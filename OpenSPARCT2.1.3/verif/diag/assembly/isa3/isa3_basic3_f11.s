/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic3_f11.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_basic3_f11.s,v 1.1 2007/05/11 17:22:20 drp Exp $"
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
	setx	0x0F6B65BE4045D056,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x4,	%g1
	set	0x5,	%g2
	set	0x2,	%g3
	set	0x3,	%g4
	set	0x0,	%g5
	set	0xC,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x2,	%i1
	set	-0x9,	%i2
	set	-0x0,	%i3
	set	-0x9,	%i4
	set	-0xF,	%i5
	set	-0xD,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x4B6EF4B7,	%l0
	set	0x67ECFCB4,	%l1
	set	0x3F3C56F8,	%l2
	set	0x0F697BEB,	%l3
	set	0x0C8C8432,	%l4
	set	0x0EA6051A,	%l5
	set	0x70D2C15F,	%l6
	!# Output registers
	set	0x007C,	%o0
	set	-0x00CB,	%o1
	set	0x113C,	%o2
	set	0x08EA,	%o3
	set	0x0148,	%o4
	set	-0x1A3A,	%o5
	set	0x1CC6,	%o6
	set	0x0A10,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x3B2ED86ABFCEEA9A)
	INIT_TH_FP_REG(%l7,%f2,0x20BDAB175DCA2C99)
	INIT_TH_FP_REG(%l7,%f4,0x2A04C3389FD748DA)
	INIT_TH_FP_REG(%l7,%f6,0xA1C73AC7C831F712)
	INIT_TH_FP_REG(%l7,%f8,0x5EFB21949DE1EC87)
	INIT_TH_FP_REG(%l7,%f10,0xAAEFAB03280035D9)
	INIT_TH_FP_REG(%l7,%f12,0x93E9E0D3454571CC)
	INIT_TH_FP_REG(%l7,%f14,0xEA6312A73CC6B313)
	INIT_TH_FP_REG(%l7,%f16,0xC7E7E1E068DBC072)
	INIT_TH_FP_REG(%l7,%f18,0xDD937A10A71A5AF0)
	INIT_TH_FP_REG(%l7,%f20,0x04FC4321AE76B0D2)
	INIT_TH_FP_REG(%l7,%f22,0x2011A1B6C292AB5E)
	INIT_TH_FP_REG(%l7,%f24,0xA6AA3F3751EE08F6)
	INIT_TH_FP_REG(%l7,%f26,0x6041AE69601CFCDF)
	INIT_TH_FP_REG(%l7,%f28,0x03B48B521EAFE005)
	INIT_TH_FP_REG(%l7,%f30,0xBADDEF4DA6E33796)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	fxnor	%f4,	%f18,	%f14
	tgu	%xcc,	0x7
	movrlez	%l4,	%g3,	%o2
	bcs,a	loop_1
	alignaddr	%o4,	%o5,	%i4
	swap	[%l7 + 0x3C],	%l2
	xor	%g1,	0x0D5C,	%g7
loop_1:
	move	%icc,	%i1,	%i7
	fmovdcc	%xcc,	%f9,	%f14
	nop
	setx	loop_2,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8l	%i2,	%l3,	%o1
	nop
	setx	loop_3,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnot2s	%f13,	%f16
loop_2:
	subccc	%g2,	0x19D0,	%i5
	srax	%l6,	0x0F,	%o6
loop_3:
	ldsw	[%l7 + 0x20],	%i0
	tge	%xcc,	0x0
	fmovdcc	%xcc,	%f22,	%f25
	tcc	%xcc,	0x4
	fornot1	%f16,	%f6,	%f0
	umulcc	%o0,	0x0197,	%g6
	taddcctv	%l1,	%i3,	%l0
	fcmpeq32	%f0,	%f28,	%l5
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
	ldstub	[%l7 + 0x34],	%o3
	edge32l	%o7,	%i6,	%l4
	stbar
	fba	%fcc2,	loop_4
	sra	%g4,	%g3,	%o4
	edge8n	%o5,	%o2,	%l2
	set	0x50, %g2
	lduwa	[%l7 + %g2] 0x19,	%g1
loop_4:
	sethi	0x18DF,	%i4
	fmovdcs	%xcc,	%f29,	%f17
	bleu,a	loop_5
	movrgez	%g7,	0x2CA,	%i7
	movrlz	%i1,	0x204,	%l3
	orn	%o1,	0x1572,	%i2
loop_5:
	sdivcc	%i5,	0x07E7,	%g2
	srax	%o6,	0x00,	%l6
	st	%f19,	[%l7 + 0x14]
	srax	%o0,	0x0C,	%g6
	tcc	%icc,	0x3
	fmovrde	%i0,	%f30,	%f22
	fbge,a	%fcc0,	loop_6
	nop
	setx loop_7, %l0, %l1
	jmpl %l1, %l1
	fmovrdgz	%i3,	%f4,	%f8
	fxor	%f10,	%f10,	%f18
loop_6:
	movl	%xcc,	%l5,	%g5
loop_7:
	movn	%icc,	%l0,	%o7
	fpmerge	%f16,	%f12,	%f14
	edge8n	%o3,	%l4,	%i6
	edge8	%g3,	%o4,	%g4
	fcmple16	%f12,	%f0,	%o2
	fnors	%f28,	%f12,	%f21
	tl	%icc,	0x6
	addc	%l2,	0x104D,	%g1
	edge8n	%o5,	%i4,	%g7
	and	%i7,	0x0D4D,	%l3
	ldx	[%l7 + 0x28],	%o1
	st	%f7,	[%l7 + 0x78]
	and	%i1,	%i2,	%i5
	fbg	%fcc1,	loop_8
	mulscc	%o6,	0x1FE6,	%g2
	edge8ln	%l6,	%g6,	%o0
	movl	%xcc,	%l1,	%i0
loop_8:
	brz,a	%i3,	loop_9
	xor	%l5,	%g5,	%l0
	set	0x08, %g3
	stda	%o6,	[%l7 + %g3] 0x11
loop_9:
	fmovrdlez	%l4,	%f12,	%f18
	fpack32	%f14,	%f26,	%f6
	movvc	%icc,	%o3,	%g3
	taddcc	%o4,	0x02A8,	%g4
	edge16n	%i6,	%o2,	%g1
	taddcc	%o5,	%l2,	%g7
	movrgez	%i7,	%l3,	%o1
	siam	0x2
	move	%icc,	%i4,	%i2
	fbg	%fcc2,	loop_10
	fbo	%fcc0,	loop_11
	tcs	%xcc,	0x2
	fsrc2	%f18,	%f20
loop_10:
	tcc	%xcc,	0x7
loop_11:
	edge8	%i5,	%i1,	%o6
	tge	%icc,	0x1
	movneg	%icc,	%g2,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%g6,	0x0AEE,	%o0
	srl	%i0,	%l1,	%i3
	wr	%g0,	0x89,	%asi
	stxa	%l5,	[%l7 + 0x10] %asi
	tne	%xcc,	0x7
	movn	%xcc,	%g5,	%l0
	te	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f14,	%f24,	%f2
	lduh	[%l7 + 0x1C],	%l4
	stw	%o7,	[%l7 + 0x54]
	udivx	%g3,	0x0796,	%o3
	brgez	%o4,	loop_12
	tl	%icc,	0x2
	fbne,a	%fcc2,	loop_13
	move	%xcc,	%i6,	%g4
loop_12:
	tleu	%icc,	0x2
	membar	0x6E
loop_13:
	sra	%o2,	0x01,	%o5
	bcs,a	loop_14
	ldx	[%l7 + 0x38],	%l2
	srl	%g1,	0x0B,	%g7
	movrlez	%i7,	0x1DC,	%o1
loop_14:
	fsrc1	%f18,	%f20
	movn	%xcc,	%l3,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x3
	std	%i2,	[%l7 + 0x50]
	movgu	%icc,	%i5,	%i1
	ta	%icc,	0x4
	movneg	%xcc,	%o6,	%l6
	orcc	%g2,	0x00B9,	%o0
	fnegs	%f0,	%f2
	ldd	[%l7 + 0x10],	%f20
	ldd	[%l7 + 0x48],	%i0
	tcc	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%icc,	0x4
	nop
	setx	loop_15,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%g6,	0x066E,	%l1
	fand	%f2,	%f16,	%f12
	movrgez	%l5,	%g5,	%i3
loop_15:
	sub	%l4,	0x0FEE,	%o7
	fmovde	%xcc,	%f15,	%f31
	add	%l7,	0x78,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%g3,	%o3
	edge8n	%l0,	%o4,	%g4
	tleu	%icc,	0x4
	bvc,pn	%xcc,	loop_16
	sir	0x17CF
	subc	%o2,	0x1BAD,	%o5
	fmovs	%f28,	%f13
loop_16:
	fbl	%fcc2,	loop_17
	xnorcc	%i6,	0x0E9E,	%l2
	udivcc	%g1,	0x1F9A,	%i7
	andn	%g7,	0x0FC7,	%o1
loop_17:
	add	%i4,	%l3,	%i5
	movvs	%icc,	%i1,	%i2
	tl	%xcc,	0x3
	taddcc	%o6,	0x1C93,	%g2
	bn,a,pt	%icc,	loop_18
	udiv	%o0,	0x1149,	%l6
	movleu	%icc,	%g6,	%i0
	fnands	%f14,	%f28,	%f1
loop_18:
	ld	[%l7 + 0x68],	%f30
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%l5
	movvc	%xcc,	%g5,	%l1
	edge8n	%l4,	%o7,	%g3
	movgu	%icc,	%i3,	%o3
	xnor	%o4,	%l0,	%o2
	fbg,a	%fcc2,	loop_19
	edge8ln	%o5,	%i6,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f3,	%f30,	%f27
loop_19:
	add	%l2,	0x0BF4,	%g1
	fcmpd	%fcc2,	%f28,	%f2
	edge8ln	%i7,	%g7,	%o1
	sdivx	%i4,	0x05EE,	%l3
	edge16l	%i5,	%i1,	%o6
	tn	%icc,	0x3
	subc	%i2,	0x1C84,	%g2
	fcmpgt16	%f20,	%f2,	%l6
	andn	%g6,	%i0,	%o0
	lduw	[%l7 + 0x7C],	%g5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%l4
	alignaddr	%o7,	%l1,	%g3
	edge8n	%i3,	%o4,	%o3
	tl	%xcc,	0x4
	set	0x29, %g7
	ldsba	[%l7 + %g7] 0x11,	%l0
	fandnot1	%f26,	%f22,	%f8
	srax	%o5,	0x09,	%o2
	srlx	%g4,	0x01,	%l2
	movrlz	%i6,	%i7,	%g7
	movn	%xcc,	%o1,	%i4
	bl	loop_20
	add	%g1,	0x0F0A,	%i5
	movle	%xcc,	%i1,	%l3
	popc	%i2,	%g2
loop_20:
	edge8n	%l6,	%g6,	%o6
	fors	%f28,	%f12,	%f12
	addccc	%i0,	%g5,	%l5
	bcs,a,pn	%icc,	loop_21
	te	%xcc,	0x7
	orncc	%l4,	%o7,	%l1
	fbl,a	%fcc1,	loop_22
loop_21:
	srax	%o0,	0x12,	%g3
	and	%o4,	%i3,	%l0
	fmovrde	%o5,	%f6,	%f16
loop_22:
	fornot1	%f22,	%f16,	%f30
	tle	%icc,	0x3
	bcc,a,pt	%icc,	loop_23
	xnorcc	%o3,	0x1C1D,	%o2
	fmul8ulx16	%f16,	%f26,	%f18
	movrlez	%g4,	0x035,	%i6
loop_23:
	sethi	0x1D00,	%i7
	tvs	%icc,	0x5
	umul	%g7,	0x0034,	%l2
	fnand	%f16,	%f4,	%f28
	smul	%i4,	%g1,	%i5
	fpadd32s	%f19,	%f9,	%f2
	fone	%f10
	or	%i1,	0x1838,	%l3
	umulcc	%o1,	%i2,	%l6
	movl	%xcc,	%g6,	%o6
	orncc	%g2,	%i0,	%l5
	andncc	%g5,	%l4,	%l1
	set	0x34, %o6
	lduha	[%l7 + %o6] 0x89,	%o7
	edge16n	%o0,	%o4,	%g3
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x18] %asi,	%i3
	taddcctv	%l0,	0x12EB,	%o5
	andcc	%o3,	%o2,	%i6
	ta	%xcc,	0x1
	nop
	set	0x75, %l0
	ldub	[%l7 + %l0],	%i7
	edge16n	%g7,	%g4,	%i4
	tn	%icc,	0x0
	addcc	%g1,	0x0F77,	%l2
	bne,a,pt	%icc,	loop_24
	std	%f22,	[%l7 + 0x48]
	brlez	%i5,	loop_25
	bcc,a,pn	%xcc,	loop_26
loop_24:
	srlx	%l3,	0x03,	%o1
	fsrc1s	%f6,	%f30
loop_25:
	movl	%icc,	%i2,	%l6
loop_26:
	taddcctv	%i1,	0x04AC,	%o6
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x62] %asi,	%g2
	edge16n	%i0,	%g6,	%g5
	fmovrsgz	%l5,	%f11,	%f21
	edge8n	%l1,	%l4,	%o7
	movgu	%xcc,	%o0,	%o4
	te	%xcc,	0x7
	andn	%g3,	0x0D4D,	%i3
	nop
	setx	loop_27,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array32	%l0,	%o3,	%o2
	swap	[%l7 + 0x78],	%i6
	sdivx	%i7,	0x0D71,	%g7
loop_27:
	movre	%o5,	0x113,	%g4
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x77] %asi,	%i4
	fpadd16s	%f5,	%f9,	%f2
	stb	%g1,	[%l7 + 0x4C]
	sra	%l2,	0x1A,	%i5
	fbule,a	%fcc3,	loop_28
	sdivcc	%l3,	0x15B0,	%i2
	udivx	%l6,	0x009A,	%i1
	subc	%o6,	0x0BD2,	%g2
loop_28:
	fornot2s	%f14,	%f16,	%f19
	te	%icc,	0x4
	sll	%o1,	0x12,	%g6
	bcs,a,pt	%xcc,	loop_29
	edge16l	%i0,	%g5,	%l5
	edge32n	%l1,	%o7,	%o0
	fone	%f12
loop_29:
	brlez,a	%l4,	loop_30
	sir	0x03DE
	fands	%f3,	%f24,	%f4
	fmuld8ulx16	%f29,	%f17,	%f8
loop_30:
	tsubcc	%g3,	0x0BA5,	%i3
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x17
	membar	#Sync
	fpadd16	%f12,	%f14,	%f28
	prefetch	[%l7 + 0x58],	 0x2
	fmovsvc	%icc,	%f13,	%f30
	edge32ln	%l0,	%o3,	%o2
	fmovdge	%icc,	%f25,	%f4
	bne,a	%xcc,	loop_31
	tg	%xcc,	0x7
	srl	%i6,	%i7,	%o4
	ba,a,pn	%icc,	loop_32
loop_31:
	array8	%o5,	%g4,	%i4
	movcs	%icc,	%g7,	%l2
	nop
	set	0x6E, %g4
	ldub	[%l7 + %g4],	%g1
loop_32:
	sdivcc	%l3,	0x096B,	%i2
	sra	%l6,	0x1B,	%i1
	udiv	%o6,	0x0CBF,	%g2
	srl	%i5,	%g6,	%o1
	fandnot1	%f28,	%f30,	%f10
	fblg,a	%fcc2,	loop_33
	fcmpgt32	%f22,	%f2,	%g5
	bvc,a	%xcc,	loop_34
	swap	[%l7 + 0x48],	%i0
loop_33:
	tl	%xcc,	0x0
	xnorcc	%l5,	0x1A01,	%l1
loop_34:
	nop
	set	0x70, %g1
	stwa	%o7,	[%l7 + %g1] 0x89
	edge8l	%o0,	%g3,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l0,	0x1013,	%o3
	tsubcctv	%o2,	0x1493,	%i6
	edge8n	%i3,	%i7,	%o4
	swap	[%l7 + 0x0C],	%g4
	fba,a	%fcc0,	loop_35
	array32	%o5,	%g7,	%l2
	fsrc1s	%f16,	%f9
	alignaddr	%g1,	%i4,	%l3
loop_35:
	fmul8x16al	%f8,	%f17,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l6,	%i2,	%i1
	edge32	%g2,	%o6,	%g6
	be,a	%icc,	loop_36
	bvs	%xcc,	loop_37
	addc	%o1,	%g5,	%i5
	fandnot2	%f28,	%f12,	%f10
loop_36:
	subccc	%l5,	0x16E3,	%i0
loop_37:
	tcs	%xcc,	0x4
	addccc	%l1,	%o7,	%g3
	addcc	%l4,	0x0808,	%l0
	sdiv	%o0,	0x17CF,	%o2
	sra	%i6,	%o3,	%i3
	tn	%xcc,	0x0
	st	%f31,	[%l7 + 0x2C]
	sra	%o4,	0x06,	%i7
	fbne	%fcc3,	loop_38
	fmul8sux16	%f26,	%f30,	%f28
	nop
	setx	loop_39,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbg,a	%fcc2,	loop_40
loop_38:
	nop
	setx	loop_41,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrsne	%g4,	%f19,	%f27
loop_39:
	or	%g7,	0x0C11,	%o5
loop_40:
	fmovrsne	%g1,	%f20,	%f0
loop_41:
	fbul	%fcc1,	loop_42
	movne	%xcc,	%l2,	%i4
	fmovsge	%icc,	%f8,	%f21
	fbule,a	%fcc2,	loop_43
loop_42:
	edge16ln	%l3,	%l6,	%i2
	movgu	%xcc,	%g2,	%i1
	mulx	%o6,	0x03DC,	%g6
loop_43:
	sllx	%g5,	0x0C,	%i5
	movleu	%xcc,	%l5,	%i0
	fnot2	%f26,	%f24
	subcc	%l1,	0x1BB0,	%o7
	fmovsl	%icc,	%f17,	%f3
	andncc	%g3,	%l4,	%o1
	bcc	loop_44
	fmovrse	%l0,	%f3,	%f7
	bcc,a,pn	%xcc,	loop_45
	fmovrse	%o2,	%f3,	%f12
loop_44:
	movcc	%icc,	%i6,	%o3
	add	%i3,	%o4,	%i7
loop_45:
	bshuffle	%f28,	%f24,	%f2
	orncc	%g4,	%o0,	%o5
	bshuffle	%f16,	%f4,	%f28
	movgu	%icc,	%g7,	%g1
	movrgz	%i4,	0x3B0,	%l3
	fcmped	%fcc1,	%f8,	%f4
	fmovrde	%l6,	%f30,	%f2
	fmul8x16al	%f23,	%f4,	%f28
	set	0x18, %o5
	prefetcha	[%l7 + %o5] 0x15,	 0x3
	tpos	%icc,	0x0
	add	%g2,	%l2,	%i1
	srlx	%o6,	%g5,	%g6
	edge16l	%i5,	%i0,	%l1
	bneg,a	%icc,	loop_46
	fmovrdne	%l5,	%f30,	%f20
	srlx	%o7,	0x0B,	%g3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x10,	%o1,	%l4
loop_46:
	tge	%xcc,	0x3
	fbuge	%fcc3,	loop_47
	andn	%l0,	0x1B33,	%i6
	tcc	%xcc,	0x3
	orncc	%o2,	0x1677,	%i3
loop_47:
	brz,a	%o4,	loop_48
	fpack16	%f6,	%f17
	tn	%xcc,	0x2
	tgu	%icc,	0x4
loop_48:
	fmovdleu	%icc,	%f26,	%f10
	stbar
	fcmpd	%fcc3,	%f22,	%f4
	smulcc	%o3,	0x0B50,	%i7
	movvs	%xcc,	%o0,	%o5
	movcs	%icc,	%g4,	%g7
	mova	%xcc,	%i4,	%g1
	orn	%l6,	0x14DA,	%i2
	tg	%icc,	0x7
	tg	%xcc,	0x6
	fbul	%fcc2,	loop_49
	movvc	%icc,	%g2,	%l2
	mova	%xcc,	%l3,	%i1
	fsrc2s	%f1,	%f8
loop_49:
	bvs	loop_50
	popc	%o6,	%g5
	move	%xcc,	%i5,	%i0
	tvs	%xcc,	0x1
loop_50:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x58] %asi,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f13,	[%l7 + 0x20]
	fzeros	%f2
	tn	%icc,	0x4
	tg	%xcc,	0x1
	umul	%l5,	%o7,	%g6
	or	%g3,	%o1,	%l0
	movn	%xcc,	%i6,	%o2
	andcc	%l4,	%i3,	%o3
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x5C] %asi,	%f28
	sdiv	%i7,	0x0F27,	%o0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%o5
	fba,a	%fcc1,	loop_51
	tge	%icc,	0x5
	fmovdl	%xcc,	%f6,	%f2
	for	%f8,	%f12,	%f30
loop_51:
	movre	%g4,	0x07B,	%i4
	stw	%g1,	[%l7 + 0x40]
	tsubcc	%l6,	0x17CD,	%g7
	xnor	%i2,	0x0081,	%l2
	bleu,a	%icc,	loop_52
	tl	%icc,	0x1
	fbge	%fcc1,	loop_53
	movg	%xcc,	%l3,	%g2
loop_52:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba,a	%fcc1,	loop_54
loop_53:
	faligndata	%f12,	%f2,	%f20
	tcc	%icc,	0x7
	wr	%g0,	0x57,	%asi
	stxa	%o6,	[%g0 + 0x0] %asi
loop_54:
	nop
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x15] %asi,	%i1
	mulscc	%i5,	0x0416,	%i0
	and	%l1,	%l5,	%o7
	sll	%g5,	%g6,	%o1
	mova	%xcc,	%g3,	%l0
	fmovdpos	%xcc,	%f5,	%f8
	movgu	%icc,	%o2,	%i6
	sdivcc	%i3,	0x1D6E,	%o3
	subc	%i7,	0x1416,	%o0
	tvs	%icc,	0x3
	ld	[%l7 + 0x68],	%f19
	sir	0x0655
	fmovscs	%xcc,	%f13,	%f16
	sethi	0x0E24,	%l4
	bcs	%xcc,	loop_55
	andn	%o5,	0x08DB,	%o4
	bge	loop_56
	std	%f28,	[%l7 + 0x18]
loop_55:
	fmovrslez	%g4,	%f2,	%f12
	andn	%i4,	0x016B,	%l6
loop_56:
	fmovdleu	%xcc,	%f29,	%f29
	set	0x58, %l4
	stda	%g6,	[%l7 + %l4] 0x11
	fxnor	%f6,	%f6,	%f8
	fornot1s	%f29,	%f12,	%f9
	set	0x60, %o0
	stha	%i2,	[%l7 + %o0] 0x88
	smul	%l2,	0x052A,	%g1
	fbue	%fcc2,	loop_57
	edge16l	%g2,	%l3,	%o6
	std	%i0,	[%l7 + 0x10]
	mulx	%i5,	%l1,	%l5
loop_57:
	brlz	%o7,	loop_58
	movneg	%xcc,	%g5,	%g6
	tsubcctv	%o1,	0x042C,	%g3
	fpadd32s	%f0,	%f28,	%f15
loop_58:
	array16	%l0,	%o2,	%i0
	tg	%icc,	0x4
	ld	[%l7 + 0x44],	%f22
	flush	%l7 + 0x64
	edge32n	%i3,	%o3,	%i6
	move	%icc,	%o0,	%i7
	srl	%l4,	0x18,	%o5
	movrne	%g4,	%i4,	%l6
	movpos	%xcc,	%o4,	%g7
	fmovdcc	%xcc,	%f1,	%f22
	fbl	%fcc2,	loop_59
	edge16n	%l2,	%i2,	%g2
	bn,a	%xcc,	loop_60
	addc	%l3,	0x130C,	%o6
loop_59:
	fpmerge	%f8,	%f0,	%f12
	tsubcc	%i1,	%i5,	%l1
loop_60:
	fandnot1	%f30,	%f14,	%f28
	nop
	set	0x5E, %i4
	lduh	[%l7 + %i4],	%g1
	smulcc	%l5,	%g5,	%o7
	alignaddr	%o1,	%g3,	%l0
	movrgez	%o2,	0x21D,	%i0
	fmovsne	%icc,	%f15,	%f7
	movrlz	%i3,	%o3,	%i6
	movle	%icc,	%o0,	%g6
	fmovsneg	%icc,	%f28,	%f1
	fcmped	%fcc0,	%f18,	%f4
	nop
	set	0x4C, %o2
	sth	%i7,	[%l7 + %o2]
	sdivx	%l4,	0x16F6,	%o5
	fmul8x16al	%f18,	%f10,	%f18
	movn	%icc,	%i4,	%l6
	stx	%g4,	[%l7 + 0x48]
	tsubcc	%o4,	0x11A1,	%g7
	std	%i2,	[%l7 + 0x18]
	addcc	%l2,	%g2,	%o6
	sethi	0x1A03,	%i1
	andn	%l3,	%i5,	%g1
	edge16l	%l1,	%l5,	%g5
	fbge	%fcc2,	loop_61
	call	loop_62
	brlez,a	%o1,	loop_63
	and	%g3,	%o7,	%o2
loop_61:
	smulcc	%i0,	%l0,	%o3
loop_62:
	nop
	set	0x68, %i7
	stxa	%i6,	[%l7 + %i7] 0x14
loop_63:
	fbug	%fcc2,	loop_64
	fxnors	%f29,	%f20,	%f24
	edge32	%i3,	%o0,	%i7
	bshuffle	%f26,	%f28,	%f30
loop_64:
	array8	%g6,	%l4,	%o5
	edge16l	%i4,	%g4,	%l6
	wr	%g0,	0xea,	%asi
	stda	%g6,	[%l7 + 0x50] %asi
	membar	#Sync
	fpackfix	%f28,	%f14
	and	%i2,	0x1881,	%o4
	fmovdcs	%xcc,	%f18,	%f13
	st	%f21,	[%l7 + 0x34]
	mulscc	%l2,	0x0D9D,	%g2
	fbuge,a	%fcc0,	loop_65
	fbn,a	%fcc1,	loop_66
	movvs	%icc,	%o6,	%i1
	bvs	loop_67
loop_65:
	srax	%i5,	0x1D,	%l3
loop_66:
	tcc	%xcc,	0x3
	movvs	%xcc,	%l1,	%l5
loop_67:
	srax	%g1,	0x1B,	%o1
	edge8ln	%g5,	%o7,	%g3
	edge16n	%i0,	%o2,	%l0
	fmovse	%icc,	%f27,	%f23
	udivcc	%i6,	0x1986,	%i3
	ldsb	[%l7 + 0x5C],	%o0
	movrgez	%o3,	0x023,	%g6
	fmovsl	%xcc,	%f17,	%f25
	array32	%i7,	%o5,	%i4
	movrgz	%g4,	0x13F,	%l6
	udiv	%l4,	0x1DE4,	%i2
	fmovrsgz	%o4,	%f31,	%f28
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%g7
	taddcc	%l2,	0x1244,	%o6
	movpos	%xcc,	%g2,	%i1
	set	0x6C, %o3
	sta	%f30,	[%l7 + %o3] 0x10
	fmovdgu	%icc,	%f4,	%f2
	add	%i5,	%l1,	%l3
	mulx	%g1,	0x0F70,	%l5
	edge8	%g5,	%o1,	%g3
	fmovrsgez	%o7,	%f19,	%f1
	fmovdvs	%xcc,	%f12,	%f27
	movl	%icc,	%o2,	%l0
	brlez	%i0,	loop_68
	addccc	%i3,	%i6,	%o0
	set	0x18, %o1
	lduha	[%l7 + %o1] 0x0c,	%g6
loop_68:
	std	%o2,	[%l7 + 0x78]
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x78] %asi,	%f31
	membar	0x00
	bn,pn	%xcc,	loop_69
	brgez	%i7,	loop_70
	movleu	%xcc,	%o5,	%g4
	xnorcc	%l6,	%i4,	%i2
loop_69:
	addc	%l4,	%g7,	%o4
loop_70:
	orncc	%o6,	%l2,	%g2
	std	%f12,	[%l7 + 0x18]
	mulx	%i1,	0x0A7F,	%i5
	mulx	%l1,	0x1A09,	%l3
	fpack32	%f16,	%f24,	%f0
	tsubcctv	%l5,	%g1,	%o1
	fnegs	%f6,	%f10
	xor	%g3,	%o7,	%o2
	bcc,a	loop_71
	mulx	%g5,	%i0,	%i3
	umul	%i6,	0x183F,	%o0
	ldstub	[%l7 + 0x4D],	%l0
loop_71:
	fbo,a	%fcc2,	loop_72
	andn	%g6,	%i7,	%o3
	or	%g4,	%o5,	%l6
	movrgez	%i2,	%l4,	%g7
loop_72:
	nop
	setx loop_73, %l0, %l1
	jmpl %l1, %i4
	orn	%o6,	0x1DF2,	%o4
	fmovrdgz	%l2,	%f2,	%f0
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x0C] %asi,	%f12
loop_73:
	nop
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g2,	%i1
	mulscc	%i5,	0x0EFC,	%l1
	prefetch	[%l7 + 0x78],	 0x2
	fcmpes	%fcc3,	%f17,	%f11
	movneg	%xcc,	%l3,	%l5
	mulscc	%o1,	%g3,	%g1
	tg	%xcc,	0x6
	edge32ln	%o2,	%g5,	%i0
	subcc	%o7,	0x18C2,	%i3
	movrgz	%o0,	%l0,	%g6
	bvc,a,pt	%xcc,	loop_74
	tgu	%xcc,	0x5
	andcc	%i7,	%o3,	%g4
	xorcc	%o5,	0x101D,	%l6
loop_74:
	edge32l	%i6,	%l4,	%i2
	andncc	%g7,	%o6,	%i4
	subccc	%l2,	%o4,	%g2
	fblg	%fcc3,	loop_75
	orcc	%i5,	0x07D7,	%i1
	tvs	%xcc,	0x2
	fmovscc	%icc,	%f30,	%f19
loop_75:
	edge16l	%l3,	%l5,	%o1
	fbo	%fcc2,	loop_76
	xorcc	%l1,	0x022C,	%g3
	fmovd	%f18,	%f28
	movrne	%g1,	%o2,	%g5
loop_76:
	edge16n	%i0,	%o7,	%i3
	edge16n	%l0,	%o0,	%g6
	tsubcctv	%o3,	0x0E46,	%g4
	brgez	%i7,	loop_77
	movge	%icc,	%l6,	%o5
	bpos,pt	%xcc,	loop_78
	alignaddrl	%i6,	%i2,	%l4
loop_77:
	addccc	%o6,	%i4,	%g7
	ba,a	loop_79
loop_78:
	stw	%l2,	[%l7 + 0x48]
	fmovdleu	%xcc,	%f6,	%f5
	ta	%xcc,	0x6
loop_79:
	fand	%f18,	%f22,	%f24
	st	%f5,	[%l7 + 0x68]
	tg	%xcc,	0x7
	fcmpgt32	%f2,	%f8,	%o4
	orn	%g2,	0x04DA,	%i5
	fmovda	%icc,	%f26,	%f30
	tge	%icc,	0x3
	sdivcc	%l3,	0x0D97,	%i1
	or	%l5,	%o1,	%g3
	tcs	%icc,	0x6
	fmovrsne	%g1,	%f21,	%f30
	std	%l0,	[%l7 + 0x08]
	fmovsn	%icc,	%f19,	%f13
	fbul,a	%fcc1,	loop_80
	tl	%icc,	0x4
	tneg	%icc,	0x7
	fbule	%fcc0,	loop_81
loop_80:
	movcs	%xcc,	%o2,	%i0
	movrgez	%g5,	0x343,	%o7
	nop
	set	0x68, %g6
	stw	%i3,	[%l7 + %g6]
loop_81:
	fmovrde	%l0,	%f14,	%f0
	andn	%o0,	0x187D,	%o3
	addc	%g4,	0x0987,	%i7
	tgu	%xcc,	0x2
	movg	%xcc,	%l6,	%o5
	fnot2s	%f26,	%f12
	srl	%g6,	%i6,	%i2
	edge32	%o6,	%l4,	%i4
	umulcc	%g7,	0x0DD8,	%l2
	fcmple32	%f10,	%f20,	%o4
	fmovsleu	%icc,	%f19,	%f13
	subcc	%g2,	%l3,	%i1
	array16	%i5,	%o1,	%g3
	brz	%g1,	loop_82
	edge32	%l5,	%l1,	%i0
	fpack32	%f16,	%f28,	%f8
	tcs	%xcc,	0x3
loop_82:
	ble,pt	%xcc,	loop_83
	move	%icc,	%g5,	%o7
	movrlz	%i3,	%l0,	%o0
	fpackfix	%f4,	%f25
loop_83:
	taddcc	%o2,	0x05B1,	%o3
	smulcc	%i7,	%g4,	%o5
	fmovsleu	%xcc,	%f3,	%f10
	tge	%icc,	0x6
	st	%f26,	[%l7 + 0x7C]
	edge16l	%g6,	%i6,	%l6
	fnegs	%f29,	%f11
	array32	%i2,	%l4,	%i4
	alignaddrl	%o6,	%g7,	%l2
	tvc	%icc,	0x3
	fba,a	%fcc0,	loop_84
	nop
	setx loop_85, %l0, %l1
	jmpl %l1, %g2
	fcmped	%fcc3,	%f0,	%f30
	fbul	%fcc0,	loop_86
loop_84:
	fsrc2	%f12,	%f12
loop_85:
	array8	%l3,	%i1,	%i5
	fmovscs	%icc,	%f11,	%f15
loop_86:
	tcc	%icc,	0x0
	fpack16	%f28,	%f18
	movrlez	%o4,	0x25B,	%g3
	popc	0x1B67,	%o1
	fbug	%fcc0,	loop_87
	bl,pn	%icc,	loop_88
	fpsub16	%f8,	%f2,	%f2
	fcmpgt16	%f24,	%f10,	%g1
loop_87:
	nop
	set	0x17, %l6
	stb	%l5,	[%l7 + %l6]
loop_88:
	array16	%i0,	%g5,	%o7
	set	0x78, %l1
	ldsha	[%l7 + %l1] 0x19,	%l1
	ble,a	loop_89
	subcc	%l0,	0x0D0D,	%i3
	fornot2s	%f8,	%f18,	%f9
	tcs	%icc,	0x6
loop_89:
	srlx	%o0,	0x1E,	%o3
	sdivx	%o2,	0x0A37,	%g4
	tvs	%icc,	0x2
	fmul8sux16	%f20,	%f14,	%f2
	fmovsneg	%icc,	%f2,	%f19
	fmovrdgez	%o5,	%f0,	%f22
	movg	%xcc,	%g6,	%i7
	tsubcc	%i6,	0x09CF,	%i2
	sdivcc	%l6,	0x0CE8,	%l4
	tge	%icc,	0x6
	ble	%icc,	loop_90
	tsubcctv	%i4,	%g7,	%l2
	st	%f14,	[%l7 + 0x60]
	flush	%l7 + 0x40
loop_90:
	tvc	%icc,	0x7
	wr	%g0,	0xeb,	%asi
	stha	%g2,	[%l7 + 0x0A] %asi
	membar	#Sync
	edge8	%l3,	%i1,	%o6
	fexpand	%f20,	%f18
	movvc	%xcc,	%o4,	%g3
	brgz,a	%o1,	loop_91
	andncc	%i5,	%l5,	%i0
	movgu	%icc,	%g1,	%g5
	mova	%xcc,	%o7,	%l0
loop_91:
	nop
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	lduw	[%l7 + 0x68],	%l1
	edge16ln	%i3,	%o3,	%o2
	brnz	%g4,	loop_92
	bg	%xcc,	loop_93
	fcmpes	%fcc0,	%f31,	%f24
	sub	%o5,	0x1ADB,	%g6
loop_92:
	edge16l	%i7,	%i6,	%i2
loop_93:
	alignaddr	%o0,	%l4,	%l6
	sethi	0x1C95,	%g7
	tne	%icc,	0x1
	tg	%icc,	0x7
	add	%l7,	0x54,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%i4,	%l2
	fcmps	%fcc3,	%f14,	%f18
	subc	%l3,	0x0F72,	%i1
	edge8l	%g2,	%o6,	%o4
	bvs,a,pn	%xcc,	loop_94
	stbar
	pdist	%f20,	%f22,	%f8
	tvc	%xcc,	0x3
loop_94:
	fpmerge	%f24,	%f23,	%f14
	andncc	%o1,	%i5,	%g3
	fmovrdgez	%l5,	%f24,	%f14
	edge8	%i0,	%g5,	%o7
	edge32n	%l0,	%l1,	%g1
	array8	%o3,	%o2,	%g4
	tleu	%icc,	0x0
	lduw	[%l7 + 0x5C],	%i3
	movre	%o5,	%i7,	%i6
	fbge,a	%fcc0,	loop_95
	subccc	%g6,	0x18B5,	%i2
	edge16l	%l4,	%l6,	%o0
	edge8	%i4,	%l2,	%l3
loop_95:
	smulcc	%g7,	%g2,	%o6
	orcc	%o4,	%i1,	%o1
	ldd	[%l7 + 0x18],	%f22
	edge16n	%i5,	%l5,	%i0
	sdiv	%g3,	0x0C89,	%o7
	movvc	%icc,	%l0,	%g5
	edge32n	%g1,	%l1,	%o2
	set	0x5B, %i0
	lduba	[%l7 + %i0] 0x11,	%g4
	or	%i3,	%o3,	%i7
	lduw	[%l7 + 0x14],	%i6
	movrlez	%o5,	0x1DC,	%g6
	movrlz	%i2,	0x376,	%l6
	srax	%l4,	%o0,	%l2
	movrgz	%l3,	0x007,	%i4
	sllx	%g7,	%o6,	%o4
	tl	%icc,	0x7
	addcc	%g2,	%i1,	%i5
	prefetch	[%l7 + 0x10],	 0x1
	sethi	0x1764,	%l5
	movrlz	%o1,	%i0,	%g3
	fmovrde	%o7,	%f10,	%f10
	fxor	%f18,	%f12,	%f22
	wr	%g0,	0x89,	%asi
	sta	%f2,	[%l7 + 0x6C] %asi
	ldub	[%l7 + 0x0B],	%g5
	movrlz	%l0,	%l1,	%o2
	taddcc	%g1,	0x178C,	%g4
	fmul8ulx16	%f10,	%f2,	%f30
	tvs	%icc,	0x4
	fbule	%fcc2,	loop_96
	fcmpne16	%f16,	%f20,	%o3
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x89
loop_96:
	taddcctv	%i7,	0x15F1,	%i6
	array32	%o5,	%i3,	%g6
	fmovrdgez	%l6,	%f26,	%f22
	xorcc	%i2,	0x1AA4,	%l4
	sdivcc	%o0,	0x043F,	%l2
	taddcc	%l3,	%g7,	%i4
	move	%xcc,	%o6,	%g2
	st	%f14,	[%l7 + 0x54]
	udivx	%i1,	0x1040,	%i5
	fands	%f31,	%f31,	%f10
	mulscc	%l5,	%o4,	%o1
	sll	%i0,	0x0F,	%o7
	tcs	%icc,	0x7
	tsubcc	%g5,	%g3,	%l0
	umul	%l1,	%g1,	%o2
	mulx	%o3,	%i7,	%i6
	movrne	%g4,	0x058,	%i3
	xor	%g6,	0x0F41,	%l6
	addcc	%i2,	0x0C2D,	%o5
	xor	%l4,	0x1D98,	%o0
	fbl,a	%fcc2,	loop_97
	fcmpgt32	%f30,	%f2,	%l3
	bvc,pt	%xcc,	loop_98
	be,a,pt	%xcc,	loop_99
loop_97:
	fbg,a	%fcc0,	loop_100
	edge16l	%l2,	%g7,	%i4
loop_98:
	bl	%icc,	loop_101
loop_99:
	swap	[%l7 + 0x10],	%g2
loop_100:
	membar	0x68
	edge16	%i1,	%i5,	%o6
loop_101:
	edge8n	%o4,	%o1,	%l5
	sdivx	%i0,	0x07C0,	%g5
	fcmple32	%f30,	%f14,	%g3
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x48] %asi,	%o7
	fmovdg	%icc,	%f30,	%f20
	orcc	%l0,	0x1358,	%g1
	fmovrdgz	%o2,	%f16,	%f0
	bvs,a	loop_102
	fmovsvs	%icc,	%f14,	%f21
	fpack16	%f14,	%f11
	movleu	%icc,	%l1,	%o3
loop_102:
	fbug	%fcc2,	loop_103
	fsrc1	%f12,	%f4
	edge32ln	%i7,	%g4,	%i6
	fmovsvs	%icc,	%f14,	%f2
loop_103:
	fornot2s	%f22,	%f1,	%f11
	mulx	%i3,	0x025C,	%g6
	tcs	%icc,	0x0
	srax	%i2,	0x14,	%l6
	bvs,a,pt	%xcc,	loop_104
	addc	%o5,	0x1251,	%o0
	movge	%icc,	%l3,	%l4
	fbo	%fcc1,	loop_105
loop_104:
	sir	0x1A2B
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x7F] %asi,	%g7
loop_105:
	tsubcc	%l2,	%g2,	%i4
	tleu	%xcc,	0x0
	sll	%i1,	0x1B,	%i5
	movvs	%xcc,	%o6,	%o1
	bgu,a	%xcc,	loop_106
	movvs	%xcc,	%l5,	%o4
	sth	%g5,	[%l7 + 0x76]
	taddcctv	%i0,	%o7,	%g3
loop_106:
	tn	%icc,	0x5
	fmovrde	%l0,	%f20,	%f28
	taddcc	%o2,	%g1,	%o3
	nop
	setx	loop_107,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrgz	%l1,	%i7,	%i6
	movl	%icc,	%i3,	%g6
	sll	%i2,	%g4,	%o5
loop_107:
	xnorcc	%l6,	%l3,	%l4
	wr	%g0,	0x11,	%asi
	sta	%f19,	[%l7 + 0x0C] %asi
	addcc	%o0,	0x193A,	%g7
	ldsb	[%l7 + 0x2B],	%g2
	tneg	%icc,	0x3
	bvs,a,pn	%icc,	loop_108
	flush	%l7 + 0x6C
	movcs	%xcc,	%i4,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_108:
	movn	%icc,	%i5,	%i1
	fble	%fcc1,	loop_109
	siam	0x1
	fmovdpos	%xcc,	%f2,	%f7
	fandnot1	%f2,	%f18,	%f30
loop_109:
	fornot2	%f4,	%f16,	%f20
	set	0x24, %i3
	stwa	%o6,	[%l7 + %i3] 0x19
	be	%icc,	loop_110
	and	%o1,	%l5,	%g5
	addcc	%o4,	%o7,	%i0
	nop
	set	0x40, %l5
	ldsb	[%l7 + %l5],	%g3
loop_110:
	xnorcc	%o2,	0x0DD1,	%g1
	movcc	%xcc,	%o3,	%l1
	fmovrdne	%i7,	%f20,	%f2
	sethi	0x1472,	%l0
	movpos	%icc,	%i6,	%i3
	addc	%i2,	0x184B,	%g4
	andn	%o5,	0x1D3C,	%g6
	fbue	%fcc3,	loop_111
	xnor	%l3,	%l4,	%l6
	set	0x54, %g5
	ldswa	[%l7 + %g5] 0x10,	%g7
loop_111:
	brlz,a	%o0,	loop_112
	and	%i4,	%g2,	%l2
	sethi	0x0887,	%i1
	edge8	%i5,	%o1,	%o6
loop_112:
	fpackfix	%f16,	%f9
	mulscc	%l5,	0x04C6,	%g5
	ta	%icc,	0x0
	andcc	%o4,	%o7,	%i0
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x88,	%f16
	movrne	%g3,	%o2,	%g1
	umul	%o3,	0x02EC,	%i7
	srax	%l1,	0x10,	%l0
	fmovrdgez	%i6,	%f12,	%f16
	brlez	%i2,	loop_113
	or	%i3,	%o5,	%g4
	tvs	%xcc,	0x6
	fmovdneg	%icc,	%f5,	%f28
loop_113:
	fabss	%f24,	%f31
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x2C] %asi,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x30, %l2
	stha	%l4,	[%l7 + %l2] 0x81
	orcc	%l6,	%g7,	%g6
	ldstub	[%l7 + 0x67],	%i4
	mulx	%g2,	%o0,	%i1
	movvc	%xcc,	%l2,	%o1
	movpos	%icc,	%o6,	%l5
	edge32	%i5,	%g5,	%o4
	tn	%xcc,	0x0
	tle	%icc,	0x3
	ldsh	[%l7 + 0x14],	%o7
	tgu	%xcc,	0x7
	bleu,a	loop_114
	xor	%g3,	%o2,	%g1
	array16	%o3,	%i7,	%i0
	nop
	setx	loop_115,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_114:
	lduw	[%l7 + 0x48],	%l0
	movvc	%icc,	%l1,	%i2
	array8	%i6,	%i3,	%o5
loop_115:
	ldd	[%l7 + 0x08],	%g4
	alignaddrl	%l4,	%l3,	%l6
	fbl,a	%fcc0,	loop_116
	fxor	%f22,	%f20,	%f2
	umulcc	%g7,	0x1B83,	%g6
	te	%xcc,	0x7
loop_116:
	edge16ln	%i4,	%g2,	%i1
	fand	%f20,	%f8,	%f4
	edge32l	%l2,	%o0,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x4C, %o7
	ldswa	[%l7 + %o7] 0x14,	%l5
	smul	%i5,	%g5,	%o4
	udivx	%o7,	0x1241,	%o1
	fbule,a	%fcc0,	loop_117
	umul	%g3,	0x0FE7,	%g1
	umul	%o3,	%i7,	%i0
	mova	%icc,	%o2,	%l1
loop_117:
	andn	%l0,	0x18DD,	%i6
	sub	%i2,	%o5,	%i3
	for	%f8,	%f6,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x1
	ble,a	loop_118
	nop
	setx loop_119, %l0, %l1
	jmpl %l1, %l4
	xnor	%l3,	0x167A,	%g4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] %asi,	%g7,	%l6
loop_118:
	sdivx	%g6,	0x0D02,	%i4
loop_119:
	movrgez	%g2,	%i1,	%l2
	movleu	%icc,	%o0,	%o6
	array8	%l5,	%g5,	%i5
	tne	%xcc,	0x7
	bvs,a	%xcc,	loop_120
	smulcc	%o7,	%o1,	%o4
	movrlez	%g3,	%g1,	%o3
	srlx	%i7,	0x0E,	%o2
loop_120:
	fmovdn	%icc,	%f0,	%f13
	taddcc	%i0,	0x0C7D,	%l0
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x88
	fornot1	%f8,	%f22,	%f26
	fbn	%fcc2,	loop_121
	andncc	%l1,	%i2,	%i6
	xor	%o5,	0x11B4,	%i3
	edge8l	%l3,	%g4,	%g7
loop_121:
	srl	%l6,	%g6,	%l4
	sir	0x17BD
	movle	%icc,	%i4,	%g2
	umul	%i1,	0x16E8,	%l2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%o0,	%o6
	fmovrdgez	%l5,	%f14,	%f10
	tcc	%icc,	0x2
	movgu	%icc,	%i5,	%g5
	edge16n	%o1,	%o7,	%g3
	xnor	%g1,	%o4,	%i7
	fandnot2s	%f11,	%f30,	%f6
	fmovscc	%icc,	%f23,	%f8
	brlez	%o2,	loop_122
	bvs	%icc,	loop_123
	xnorcc	%o3,	0x0551,	%l0
	fbu,a	%fcc0,	loop_124
loop_122:
	movrgz	%l1,	0x12F,	%i0
loop_123:
	sdivcc	%i2,	0x11E9,	%i6
	fmovsne	%icc,	%f11,	%f15
loop_124:
	fmovse	%xcc,	%f29,	%f24
	fornot1s	%f13,	%f20,	%f14
	array8	%i3,	%o5,	%l3
	set	0x18, %l3
	ldxa	[%l7 + %l3] 0x0c,	%g4
	tleu	%icc,	0x4
	tl	%icc,	0x5
	movvs	%xcc,	%l6,	%g7
	sethi	0x1CB1,	%g6
	tleu	%xcc,	0x2
	be,a	%xcc,	loop_125
	fpadd16s	%f20,	%f20,	%f6
	ldsh	[%l7 + 0x22],	%l4
	brgez,a	%g2,	loop_126
loop_125:
	bcc,a,pn	%icc,	loop_127
	movcs	%xcc,	%i1,	%l2
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_126:
	brlez	%i4,	loop_128
loop_127:
	fmovd	%f26,	%f24
	and	%o6,	%o0,	%l5
	fbl	%fcc3,	loop_129
loop_128:
	movneg	%icc,	%i5,	%o1
	fbl	%fcc2,	loop_130
	faligndata	%f18,	%f0,	%f6
loop_129:
	sir	0x1F05
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x1e
	membar	#Sync
loop_130:
	fble,a	%fcc0,	loop_131
	movvc	%xcc,	%g5,	%g3
	popc	0x18D6,	%o7
	tn	%icc,	0x7
loop_131:
	ble,a,pt	%xcc,	loop_132
	mova	%icc,	%o4,	%i7
	tcs	%icc,	0x3
	sub	%g1,	0x14EB,	%o2
loop_132:
	fmovdvs	%icc,	%f15,	%f14
	xnorcc	%l0,	%o3,	%i0
	xorcc	%l1,	%i2,	%i3
	addc	%i6,	0x0A7F,	%o5
	fabsd	%f6,	%f4
	sdivcc	%g4,	0x1771,	%l6
	tleu	%icc,	0x3
	set	0x4A, %g3
	lduba	[%l7 + %g3] 0x10,	%l3
	ldsw	[%l7 + 0x08],	%g6
	edge32n	%g7,	%l4,	%i1
	set	0x5A, %g2
	ldstuba	[%l7 + %g2] 0x88,	%l2
	subc	%i4,	%o6,	%g2
	nop
	setx	loop_133,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	add	%o0,	%i5,	%l5
	edge8ln	%o1,	%g5,	%g3
	sra	%o4,	%i7,	%o7
loop_133:
	movrlz	%o2,	%l0,	%g1
	xor	%o3,	%l1,	%i2
	umulcc	%i0,	0x013C,	%i6
	addccc	%i3,	0x0AAD,	%o5
	movre	%g4,	0x3FA,	%l6
	movrne	%l3,	0x31B,	%g6
	movcs	%icc,	%g7,	%l4
	edge32ln	%i1,	%i4,	%o6
	sll	%g2,	0x12,	%l2
	array8	%i5,	%o0,	%o1
	sethi	0x097C,	%l5
	fandnot2s	%f9,	%f16,	%f27
	fbge	%fcc0,	loop_134
	xnorcc	%g3,	0x0B91,	%g5
	fmovdg	%icc,	%f23,	%f6
	bshuffle	%f8,	%f10,	%f8
loop_134:
	te	%xcc,	0x2
	movcs	%xcc,	%o4,	%o7
	sll	%i7,	0x0F,	%o2
	edge32n	%g1,	%o3,	%l0
	fmovdneg	%icc,	%f30,	%f27
	set	0x14, %o6
	ldstuba	[%l7 + %o6] 0x11,	%i2
	andcc	%l1,	%i6,	%i3
	tne	%xcc,	0x7
	fpsub16	%f30,	%f22,	%f10
	fors	%f6,	%f31,	%f6
	ld	[%l7 + 0x14],	%f15
	fmovdn	%xcc,	%f30,	%f20
	tvc	%icc,	0x7
	bneg,pt	%icc,	loop_135
	movl	%icc,	%i0,	%o5
	fmul8x16al	%f30,	%f2,	%f30
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%g4,	%l3
loop_135:
	fandnot2s	%f17,	%f11,	%f19
	tle	%icc,	0x5
	ldx	[%l7 + 0x10],	%g6
	edge32ln	%g7,	%l4,	%i1
	edge32l	%i4,	%o6,	%g2
	siam	0x3
	andncc	%l6,	%i5,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o0,	%l5,	%o1
	movrgez	%g5,	%g3,	%o7
	tsubcctv	%o4,	0x1B65,	%o2
	tsubcctv	%i7,	%o3,	%l0
	movle	%icc,	%g1,	%l1
	call	loop_136
	sll	%i6,	0x12,	%i2
	tsubcctv	%i3,	0x1BFB,	%i0
	srax	%g4,	0x0F,	%l3
loop_136:
	xnor	%g6,	%g7,	%o5
	movgu	%icc,	%i1,	%i4
	ld	[%l7 + 0x34],	%f24
	fpadd32	%f16,	%f28,	%f20
	xnorcc	%o6,	%g2,	%l4
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x60] %asi,	%i4
	tsubcctv	%l6,	0x1969,	%l2
	bge,a,pt	%xcc,	loop_137
	ble	%xcc,	loop_138
	brnz,a	%l5,	loop_139
	fnands	%f2,	%f3,	%f11
loop_137:
	tsubcctv	%o1,	0x026C,	%g5
loop_138:
	movge	%xcc,	%o0,	%o7
loop_139:
	movrlez	%o4,	0x063,	%o2
	tl	%xcc,	0x0
	fsrc1s	%f15,	%f17
	fones	%f26
	prefetch	[%l7 + 0x2C],	 0x3
	orncc	%g3,	0x05E2,	%o3
	fblg	%fcc2,	loop_140
	tleu	%xcc,	0x7
	sth	%i7,	[%l7 + 0x12]
	edge32n	%l0,	%g1,	%l1
loop_140:
	ta	%icc,	0x7
	orn	%i2,	%i3,	%i6
	tvs	%xcc,	0x4
	alignaddr	%i0,	%g4,	%g6
	fnot2	%f30,	%f6
	wr	%g0,	0x0c,	%asi
	stda	%g6,	[%l7 + 0x28] %asi
	movg	%icc,	%o5,	%i1
	srl	%l3,	0x02,	%o6
	udivx	%g2,	0x0451,	%i4
	subc	%l4,	%i5,	%l2
	fmovrdgz	%l6,	%f24,	%f28
	movcs	%xcc,	%l5,	%o1
	srl	%g5,	%o7,	%o4
	fmovsg	%icc,	%f0,	%f8
	fmovrslez	%o0,	%f5,	%f7
	call	loop_141
	edge8l	%o2,	%o3,	%i7
	be,pn	%xcc,	loop_142
	edge16n	%l0,	%g1,	%g3
loop_141:
	fxor	%f4,	%f22,	%f8
	and	%l1,	0x0AD7,	%i3
loop_142:
	nop
	set	0x3C, %g7
	ldsba	[%l7 + %g7] 0x89,	%i6
	flush	%l7 + 0x38
	array32	%i0,	%i2,	%g6
	fmovsl	%xcc,	%f16,	%f17
	andncc	%g7,	%o5,	%i1
	mulscc	%g4,	0x1047,	%o6
	andcc	%l3,	%i4,	%l4
	ba,a	loop_143
	andcc	%i5,	0x0BFD,	%l2
	fmovrslez	%g2,	%f29,	%f3
	edge16	%l6,	%o1,	%l5
loop_143:
	fmovscs	%xcc,	%f21,	%f9
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x64] %asi,	%g5
	fnot1	%f24,	%f28
	xor	%o4,	0x1BD7,	%o7
	andcc	%o0,	%o2,	%o3
	movre	%l0,	0x2EC,	%g1
	sir	0x0D6B
	fmovrdgz	%i7,	%f10,	%f6
	fnot1s	%f21,	%f31
	subcc	%l1,	0x055D,	%i3
	movrne	%i6,	%g3,	%i2
	movrgez	%g6,	%g7,	%o5
	fcmple16	%f12,	%f28,	%i0
	tl	%xcc,	0x2
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x64] %asi,	%g4
	movrlez	%o6,	%l3,	%i1
	sub	%i4,	%i5,	%l2
	edge32n	%g2,	%l4,	%l6
	orcc	%l5,	%o1,	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%g5,	%o0
	fmovsle	%icc,	%f30,	%f15
	tleu	%icc,	0x6
	nop
	setx	loop_144,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldsb	[%l7 + 0x54],	%o7
	and	%o3,	%o2,	%g1
	tgu	%icc,	0x4
loop_144:
	smul	%i7,	0x0852,	%l1
	std	%f6,	[%l7 + 0x20]
	brlez,a	%l0,	loop_145
	tl	%icc,	0x4
	tne	%xcc,	0x4
	edge8n	%i3,	%i6,	%g3
loop_145:
	movrne	%i2,	%g7,	%o5
	bcs,pt	%xcc,	loop_146
	sll	%i0,	%g4,	%g6
	brgz	%o6,	loop_147
	srlx	%l3,	%i1,	%i4
loop_146:
	umul	%l2,	0x0BC5,	%i5
	edge8ln	%l4,	%l6,	%g2
loop_147:
	fand	%f12,	%f0,	%f12
	fbo	%fcc2,	loop_148
	fone	%f24
	movvc	%xcc,	%l5,	%o1
	movrgez	%o4,	0x0CF,	%g5
loop_148:
	bvc,a	%xcc,	loop_149
	ta	%icc,	0x3
	lduw	[%l7 + 0x08],	%o0
	tcs	%icc,	0x6
loop_149:
	movpos	%xcc,	%o7,	%o2
	brlz	%o3,	loop_150
	fmovrde	%i7,	%f16,	%f24
	st	%f27,	[%l7 + 0x08]
	brz,a	%g1,	loop_151
loop_150:
	bne	%xcc,	loop_152
	movle	%xcc,	%l1,	%i3
	orncc	%i6,	0x0954,	%l0
loop_151:
	fnands	%f9,	%f25,	%f2
loop_152:
	fornot2	%f20,	%f14,	%f4
	fcmpgt32	%f10,	%f2,	%g3
	edge8ln	%g7,	%i2,	%o5
	taddcc	%i0,	%g6,	%g4
	fmul8ulx16	%f0,	%f30,	%f12
	fpsub32s	%f6,	%f11,	%f0
	fblg,a	%fcc0,	loop_153
	sth	%o6,	[%l7 + 0x42]
	movneg	%icc,	%l3,	%i4
	wr	%g0,	0x20,	%asi
	stxa	%i1,	[%g0 + 0x0] %asi
loop_153:
	movrlez	%l2,	0x160,	%i5
	tsubcc	%l4,	%l6,	%l5
	prefetch	[%l7 + 0x44],	 0x1
	udivx	%g2,	0x1F18,	%o1
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x10] %asi,	%o4
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%g5
	fones	%f12
	tcs	%xcc,	0x4
	fexpand	%f14,	%f0
	movvc	%icc,	%o0,	%o2
	alignaddr	%o3,	%o7,	%g1
	edge32l	%i7,	%l1,	%i6
	fmovde	%xcc,	%f28,	%f0
	fones	%f12
	orn	%i3,	%l0,	%g3
	prefetch	[%l7 + 0x2C],	 0x2
	edge32n	%g7,	%i2,	%i0
	nop
	setx	loop_154,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orcc	%o5,	0x16AC,	%g6
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x1f
	membar	#Sync
loop_154:
	tvs	%xcc,	0x5
	edge16n	%o6,	%g4,	%l3
	fabss	%f27,	%f26
	set	0x17, %l0
	ldstuba	[%l7 + %l0] 0x19,	%i1
	tneg	%icc,	0x2
	subc	%i4,	%i5,	%l4
	nop
	set	0x5F, %g1
	ldstub	[%l7 + %g1],	%l2
	fpsub16s	%f27,	%f24,	%f3
	wr	%g0,	0x81,	%asi
	stwa	%l5,	[%l7 + 0x38] %asi
	movrlz	%l6,	%g2,	%o1
	fcmps	%fcc1,	%f24,	%f13
	ldd	[%l7 + 0x10],	%g4
	tleu	%icc,	0x0
	fsrc2	%f0,	%f28
	tvc	%icc,	0x3
	andn	%o0,	0x195B,	%o2
	fbuge	%fcc2,	loop_155
	movgu	%xcc,	%o3,	%o4
	membar	0x10
	te	%icc,	0x7
loop_155:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o7,	%i7,	%l1
	fpsub32	%f14,	%f18,	%f22
	fmovrde	%g1,	%f10,	%f16
	edge32ln	%i3,	%l0,	%i6
	movneg	%xcc,	%g3,	%g7
	andcc	%i0,	0x0D83,	%i2
	tpos	%icc,	0x5
	set	0x64, %o5
	lda	[%l7 + %o5] 0x80,	%f20
	andncc	%g6,	%o5,	%g4
	movneg	%icc,	%l3,	%i1
	te	%xcc,	0x7
	sra	%i4,	%o6,	%l4
	movn	%icc,	%l2,	%i5
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x14,	%f0
	fmovsn	%xcc,	%f9,	%f13
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%l6,	%l5
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x50] %asi,	%g2
	fpsub16s	%f11,	%f21,	%f24
	tne	%xcc,	0x1
	edge8l	%o1,	%o0,	%g5
	addcc	%o3,	0x10D0,	%o2
	fmovdvs	%xcc,	%f18,	%f15
	fors	%f7,	%f9,	%f26
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%o7,	%o4
	movrgez	%l1,	%i7,	%i3
	edge32n	%l0,	%g1,	%i6
	nop
	setx	loop_156,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbule	%fcc0,	loop_157
	orcc	%g7,	%g3,	%i2
	movcs	%xcc,	%g6,	%i0
loop_156:
	nop
	setx loop_158, %l0, %l1
	jmpl %l1, %g4
loop_157:
	tvc	%xcc,	0x1
	fcmpgt32	%f4,	%f16,	%l3
	movg	%xcc,	%o5,	%i4
loop_158:
	andn	%i1,	%o6,	%l4
	bl,pn	%xcc,	loop_159
	movrlez	%i5,	0x3BB,	%l2
	edge16ln	%l6,	%g2,	%o1
	bgu,pn	%icc,	loop_160
loop_159:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%l5,	%f12,	%f6
	subccc	%g5,	%o0,	%o3
loop_160:
	fnot1	%f28,	%f12
	fnot1s	%f19,	%f0
	fmovdne	%xcc,	%f13,	%f23
	movcc	%icc,	%o2,	%o7
	tle	%xcc,	0x5
	sdivx	%o4,	0x18E4,	%l1
	xorcc	%i7,	0x0668,	%l0
	fcmpgt16	%f26,	%f16,	%i3
	orcc	%g1,	0x1602,	%g7
	set	0x35, %o0
	stba	%g3,	[%l7 + %o0] 0x88
	fmovrsgz	%i2,	%f11,	%f20
	fpsub16s	%f13,	%f17,	%f1
	set	0x44, %g4
	lduba	[%l7 + %g4] 0x10,	%g6
	srlx	%i0,	0x04,	%g4
	tne	%xcc,	0x4
	xor	%i6,	%l3,	%i4
	tsubcctv	%o5,	%o6,	%l4
	taddcctv	%i1,	%l2,	%i5
	udivx	%l6,	0x0B9B,	%o1
	ldsb	[%l7 + 0x79],	%l5
	andcc	%g5,	0x1F18,	%g2
	fmovrslz	%o3,	%f26,	%f4
	fblg,a	%fcc0,	loop_161
	umul	%o0,	0x17AD,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%icc,	0x2
loop_161:
	addcc	%o7,	%l1,	%i7
	fmul8sux16	%f26,	%f0,	%f14
	umul	%o4,	%l0,	%i3
	faligndata	%f26,	%f8,	%f12
	edge32l	%g7,	%g1,	%i2
	movle	%xcc,	%g3,	%i0
	sdivx	%g4,	0x1B13,	%g6
	fornot2s	%f1,	%f26,	%f28
	sllx	%i6,	0x00,	%i4
	fmovsleu	%xcc,	%f0,	%f1
	fmovscc	%xcc,	%f11,	%f25
	sll	%o5,	0x14,	%l3
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf0
	membar	#Sync
	brgez,a	%l4,	loop_162
	subc	%i1,	0x1F02,	%o6
	xorcc	%i5,	%l6,	%o1
	fmovsn	%xcc,	%f30,	%f14
loop_162:
	xorcc	%l2,	0x059B,	%l5
	subcc	%g2,	%g5,	%o3
	ta	%xcc,	0x2
	te	%icc,	0x7
	movre	%o0,	%o2,	%o7
	edge16	%i7,	%o4,	%l0
	fmovsvs	%xcc,	%f27,	%f17
	edge16l	%l1,	%g7,	%g1
	xor	%i3,	0x031D,	%g3
	bgu,a,pn	%xcc,	loop_163
	edge16	%i0,	%i2,	%g4
	subccc	%i6,	%g6,	%o5
	ldsb	[%l7 + 0x61],	%i4
loop_163:
	addc	%l3,	%i1,	%l4
	fsrc1	%f28,	%f26
	movcs	%icc,	%i5,	%l6
	set	0x48, %i7
	ldsba	[%l7 + %i7] 0x80,	%o1
	fnot2	%f28,	%f28
	movrne	%l2,	0x13A,	%o6
	bneg,a,pt	%xcc,	loop_164
	fabss	%f25,	%f26
	sllx	%g2,	0x0E,	%l5
	ld	[%l7 + 0x10],	%f6
loop_164:
	fmovsl	%icc,	%f29,	%f20
	fpmerge	%f24,	%f0,	%f30
	stbar
	fmovdcc	%xcc,	%f16,	%f23
	tvc	%xcc,	0x2
	tg	%icc,	0x0
	bvs,a,pt	%xcc,	loop_165
	fmovdvc	%icc,	%f5,	%f16
	fbu,a	%fcc1,	loop_166
	tvc	%xcc,	0x7
loop_165:
	fbe	%fcc1,	loop_167
	edge8l	%g5,	%o3,	%o0
loop_166:
	mulscc	%o2,	%o7,	%i7
	fpadd32s	%f26,	%f25,	%f7
loop_167:
	addc	%o4,	%l1,	%g7
	xnorcc	%l0,	0x11A0,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g3,	%i0,	%i2
	fnot2	%f20,	%f24
	fnot2	%f0,	%f12
	fbn	%fcc1,	loop_168
	brnz,a	%g4,	loop_169
	move	%xcc,	%i6,	%i3
	movge	%xcc,	%g6,	%o5
loop_168:
	array8	%i4,	%i1,	%l3
loop_169:
	alignaddr	%l4,	%l6,	%o1
	fmul8x16	%f22,	%f28,	%f6
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x5C] %asi,	%i5
	mulscc	%o6,	%l2,	%l5
	array32	%g5,	%g2,	%o0
	edge8n	%o3,	%o7,	%o2
	prefetch	[%l7 + 0x64],	 0x3
	fsrc1	%f8,	%f6
	fmovrdlz	%o4,	%f20,	%f18
	fand	%f2,	%f4,	%f2
	nop
	setx	loop_170,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%i7,	%l1,	%g7
	tle	%icc,	0x6
	addccc	%g1,	%l0,	%i0
loop_170:
	sdivcc	%i2,	0x0965,	%g4
	subccc	%i6,	%g3,	%g6
	ble,pt	%icc,	loop_171
	edge32ln	%o5,	%i4,	%i3
	brgz	%l3,	loop_172
	movl	%icc,	%i1,	%l4
loop_171:
	bneg,pt	%icc,	loop_173
	tsubcc	%l6,	%o1,	%i5
loop_172:
	add	%o6,	%l5,	%g5
	subcc	%l2,	0x12F2,	%o0
loop_173:
	swap	[%l7 + 0x78],	%g2
	alignaddrl	%o7,	%o2,	%o4
	set	0x6C, %o3
	lda	[%l7 + %o3] 0x0c,	%f15
	brz,a	%i7,	loop_174
	fcmpes	%fcc1,	%f23,	%f10
	fcmpes	%fcc2,	%f27,	%f9
	tl	%xcc,	0x6
loop_174:
	fnegs	%f20,	%f0
	movrne	%l1,	0x06D,	%o3
	udiv	%g1,	0x007C,	%l0
	srax	%i0,	0x0A,	%g7
	fcmpne16	%f20,	%f26,	%g4
	popc	%i6,	%i2
	fmovsle	%icc,	%f19,	%f23
	fbne,a	%fcc2,	loop_175
	movge	%xcc,	%g6,	%g3
	stb	%o5,	[%l7 + 0x7A]
	stx	%i3,	[%l7 + 0x78]
loop_175:
	fbe	%fcc2,	loop_176
	tneg	%xcc,	0x4
	be,pn	%icc,	loop_177
	ldx	[%l7 + 0x48],	%i4
loop_176:
	fmovrdgz	%i1,	%f22,	%f14
	set	0x14, %o2
	lduha	[%l7 + %o2] 0x04,	%l3
loop_177:
	mulx	%l4,	0x1737,	%l6
	subcc	%o1,	0x1770,	%i5
	movneg	%icc,	%o6,	%l5
	tne	%xcc,	0x2
	sra	%l2,	%o0,	%g5
	xnorcc	%o7,	%o2,	%o4
	mulscc	%i7,	0x17F5,	%l1
	sir	0x1C41
	ldd	[%l7 + 0x68],	%g2
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x10,	%f16
	bl,pt	%xcc,	loop_178
	fcmpeq32	%f6,	%f12,	%o3
	set	0x68, %o1
	stda	%g0,	[%l7 + %o1] 0xe3
	membar	#Sync
loop_178:
	fandnot2s	%f27,	%f12,	%f16
	tcs	%icc,	0x0
	movgu	%icc,	%i0,	%l0
	sll	%g4,	0x0E,	%g7
	sth	%i6,	[%l7 + 0x3C]
	fbug,a	%fcc2,	loop_179
	fxors	%f10,	%f20,	%f4
	fnot1	%f18,	%f12
	movrlz	%i2,	0x1A7,	%g6
loop_179:
	fnot2s	%f19,	%f31
	andncc	%o5,	%i3,	%g3
	edge32l	%i4,	%l3,	%l4
	andncc	%i1,	%l6,	%o1
	fmovdgu	%xcc,	%f6,	%f5
	umulcc	%o6,	%i5,	%l5
	tleu	%icc,	0x7
	fpsub32	%f18,	%f22,	%f2
	std	%l2,	[%l7 + 0x60]
	edge32n	%g5,	%o7,	%o0
	fpsub16s	%f16,	%f0,	%f4
	wr	%g0,	0x81,	%asi
	stda	%o2,	[%l7 + 0x28] %asi
	ta	%icc,	0x3
	te	%xcc,	0x0
	movrlz	%o4,	0x22E,	%l1
	sll	%i7,	%g2,	%o3
	move	%icc,	%i0,	%l0
	ldd	[%l7 + 0x20],	%f16
	set	0x50, %l1
	stha	%g1,	[%l7 + %l1] 0xeb
	membar	#Sync
	tneg	%xcc,	0x6
	subccc	%g4,	%i6,	%g7
	fmovsleu	%xcc,	%f15,	%f22
	te	%icc,	0x7
	srl	%g6,	0x13,	%o5
	fnor	%f22,	%f16,	%f26
	fbo	%fcc3,	loop_180
	fbu	%fcc0,	loop_181
	xnor	%i3,	0x0D33,	%g3
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x3C] %asi,	%i4
loop_180:
	fbn	%fcc0,	loop_182
loop_181:
	tg	%icc,	0x7
	alignaddr	%l3,	%l4,	%i2
	alignaddrl	%l6,	%o1,	%i1
loop_182:
	edge8l	%o6,	%i5,	%l5
	fbug,a	%fcc3,	loop_183
	movge	%icc,	%g5,	%l2
	movcc	%icc,	%o7,	%o2
	fnot2s	%f30,	%f15
loop_183:
	fmul8sux16	%f22,	%f18,	%f30
	edge16ln	%o0,	%o4,	%l1
	movrgz	%g2,	0x3CD,	%i7
	addccc	%o3,	%i0,	%g1
	array16	%g4,	%i6,	%l0
	ldx	[%l7 + 0x48],	%g7
	fbn,a	%fcc0,	loop_184
	fones	%f27
	udivx	%o5,	0x1BCE,	%g6
	movrgez	%g3,	%i4,	%l3
loop_184:
	sll	%i3,	%i2,	%l4
	set	0x20, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0x2
	prefetch	[%l7 + 0x24],	 0x1
	tvc	%icc,	0x6
	movvs	%icc,	%o1,	%i1
	andncc	%o6,	%i5,	%l5
	fmovdge	%icc,	%f27,	%f1
	tleu	%xcc,	0x7
	mulscc	%l2,	0x0CDA,	%o7
	movvc	%xcc,	%o2,	%g5
	fmovdcc	%xcc,	%f10,	%f27
	mova	%icc,	%o4,	%o0
	movcs	%icc,	%l1,	%i7
	edge32n	%o3,	%i0,	%g1
	edge16l	%g2,	%i6,	%l0
	addcc	%g4,	0x0B69,	%o5
	movrlz	%g7,	0x150,	%g6
	orncc	%g3,	0x0701,	%l3
	tleu	%xcc,	0x3
	fmovsvc	%icc,	%f30,	%f10
	sra	%i3,	%i4,	%i2
	bpos,a	loop_185
	tg	%xcc,	0x0
	subcc	%l4,	%l6,	%i1
	xorcc	%o6,	%o1,	%l5
loop_185:
	nop
	set	0x75, %l6
	lduba	[%l7 + %l6] 0x18,	%i5
	movrgz	%l2,	0x34D,	%o2
	fbul,a	%fcc2,	loop_186
	fxor	%f30,	%f6,	%f6
	udiv	%o7,	0x0FA3,	%g5
	te	%icc,	0x1
loop_186:
	swap	[%l7 + 0x1C],	%o4
	fmovsge	%icc,	%f18,	%f8
	sll	%l1,	0x1D,	%i7
	movg	%icc,	%o3,	%i0
	udivcc	%o0,	0x050D,	%g2
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%g1,	[%g0 + 0x138] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	subcc	%i6,	%l0,	%o5
	movle	%icc,	%g7,	%g4
	andn	%g3,	0x18D3,	%l3
	edge8	%g6,	%i4,	%i2
	andn	%i3,	0x0A95,	%l6
	fpmerge	%f15,	%f19,	%f6
	fmovspos	%icc,	%f18,	%f21
	addcc	%l4,	0x0941,	%o6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%l5
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x60] %asi,	%i4
	fpsub32	%f12,	%f18,	%f30
	movrlez	%l2,	0x3A0,	%o2
	fbuge,a	%fcc3,	loop_187
	movn	%xcc,	%o1,	%o7
	swap	[%l7 + 0x1C],	%g5
	fcmpne32	%f18,	%f0,	%o4
loop_187:
	fpmerge	%f6,	%f0,	%f30
	fbge	%fcc2,	loop_188
	tpos	%xcc,	0x7
	fmul8ulx16	%f20,	%f2,	%f18
	fbuge	%fcc2,	loop_189
loop_188:
	edge16	%i7,	%o3,	%l1
	orncc	%i0,	0x1539,	%o0
	smul	%g1,	0x01E3,	%i6
loop_189:
	movne	%xcc,	%g2,	%l0
	orn	%o5,	%g4,	%g3
	fmovrsgez	%l3,	%f17,	%f11
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x14,	 0x2
	alignaddrl	%g7,	%i2,	%i3
	orn	%l6,	0x142C,	%i4
	set	0x08, %i3
	ldsha	[%l7 + %i3] 0x15,	%o6
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x11,	%f16
	fbn	%fcc0,	loop_190
	mova	%xcc,	%l4,	%l5
	or	%i1,	%l2,	%o2
	addcc	%i5,	%o7,	%o1
loop_190:
	tgu	%icc,	0x1
	movrne	%o4,	0x07D,	%g5
	movg	%icc,	%i7,	%l1
	ldub	[%l7 + 0x43],	%o3
	movrlez	%o0,	%g1,	%i6
	std	%i0,	[%l7 + 0x70]
	mulx	%l0,	%g2,	%o5
	umul	%g3,	%g4,	%g6
	wr	%g0,	0x2f,	%asi
	stha	%g7,	[%l7 + 0x14] %asi
	membar	#Sync
	movgu	%icc,	%i2,	%i3
	bn,a	%xcc,	loop_191
	fmovrdlz	%l3,	%f0,	%f6
	movcc	%xcc,	%l6,	%o6
	tsubcc	%i4,	%l5,	%i1
loop_191:
	fpadd16	%f28,	%f2,	%f24
	bvc	loop_192
	alignaddrl	%l4,	%o2,	%l2
	fbuge	%fcc1,	loop_193
	fcmpd	%fcc2,	%f12,	%f10
loop_192:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x25] %asi,	%o7
loop_193:
	movrlz	%o1,	0x1E3,	%i5
	tg	%icc,	0x0
	tl	%icc,	0x3
	srlx	%g5,	0x04,	%i7
	fmovdcc	%icc,	%f20,	%f13
	orn	%o4,	%o3,	%l1
	sdivcc	%o0,	0x0200,	%g1
	edge8l	%i0,	%l0,	%i6
	subccc	%o5,	%g3,	%g4
	sdiv	%g6,	0x0199,	%g2
	taddcc	%i2,	0x1834,	%i3
	movrgz	%g7,	%l6,	%o6
	fornot1s	%f5,	%f7,	%f4
	fpmerge	%f18,	%f27,	%f2
	be,a	loop_194
	fbn	%fcc3,	loop_195
	tge	%icc,	0x3
	udivcc	%i4,	0x08D1,	%l5
loop_194:
	fpadd32	%f20,	%f16,	%f26
loop_195:
	fpmerge	%f17,	%f24,	%f30
	fcmpne16	%f18,	%f30,	%l3
	tneg	%icc,	0x2
	fpack16	%f6,	%f18
	addccc	%l4,	%o2,	%i1
	xorcc	%l2,	%o7,	%i5
	orncc	%o1,	%g5,	%i7
	fmovspos	%xcc,	%f30,	%f22
	fbue,a	%fcc3,	loop_196
	andcc	%o3,	%o4,	%l1
	udiv	%g1,	0x0095,	%o0
	fbue,a	%fcc2,	loop_197
loop_196:
	fzeros	%f1
	move	%icc,	%i0,	%i6
	bn,a,pt	%xcc,	loop_198
loop_197:
	fpsub32	%f10,	%f2,	%f30
	fblg,a	%fcc1,	loop_199
	fmovrdne	%o5,	%f6,	%f6
loop_198:
	fnot1s	%f6,	%f22
	movrne	%g3,	0x2F0,	%g4
loop_199:
	tcs	%xcc,	0x7
	xorcc	%l0,	%g6,	%g2
	fandnot2s	%f11,	%f17,	%f18
	xor	%i2,	0x073F,	%g7
	movne	%xcc,	%l6,	%i3
	fmul8sux16	%f18,	%f22,	%f4
	ble,a,pn	%xcc,	loop_200
	ldsb	[%l7 + 0x3C],	%o6
	fmovrslz	%l5,	%f0,	%f15
	movrgz	%i4,	0x041,	%l3
loop_200:
	orn	%l4,	0x09C6,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o2,	%o7,	%i5
	bcs	loop_201
	edge16l	%l2,	%g5,	%i7
	tn	%xcc,	0x6
	orncc	%o1,	0x1B31,	%o4
loop_201:
	movvc	%xcc,	%o3,	%g1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fcmple32	%f18,	%f18,	%l1
	movcs	%xcc,	%i0,	%i6
	ldd	[%l7 + 0x38],	%o0
	fbne,a	%fcc2,	loop_202
	brnz	%o5,	loop_203
	fnot1s	%f23,	%f16
	edge32ln	%g3,	%g4,	%l0
loop_202:
	bcs,a	loop_204
loop_203:
	edge8n	%g6,	%g2,	%i2
	bge,a	loop_205
	tgu	%xcc,	0x1
loop_204:
	nop
	set	0x6D, %i6
	stba	%l6,	[%l7 + %i6] 0x04
loop_205:
	nop
	set	0x0A, %l2
	ldstuba	[%l7 + %l2] 0x89,	%i3
	set	0x70, %o7
	ldxa	[%l7 + %o7] 0x11,	%g7
	fmovdge	%xcc,	%f2,	%f27
	array32	%l5,	%i4,	%l3
	ldsw	[%l7 + 0x1C],	%l4
	xorcc	%o6,	0x0225,	%o2
	edge8	%o7,	%i5,	%l2
	subc	%i1,	0x07FA,	%g5
	tsubcctv	%o1,	0x0E39,	%i7
	movrgz	%o3,	%o4,	%l1
	andn	%i0,	%i6,	%g1
	fmovsl	%icc,	%f22,	%f29
	xnor	%o5,	0x135F,	%g3
	sir	0x1107
	srlx	%g4,	%l0,	%g6
	movne	%icc,	%g2,	%i2
	fmul8ulx16	%f4,	%f30,	%f16
	fmovdne	%icc,	%f3,	%f19
	bn,pt	%xcc,	loop_206
	fxors	%f4,	%f1,	%f1
	array32	%l6,	%i3,	%g7
	tcs	%icc,	0x1
loop_206:
	sllx	%o0,	%l5,	%l3
	edge8	%l4,	%o6,	%i4
	fzeros	%f14
	edge16l	%o2,	%i5,	%l2
	popc	%o7,	%g5
	fnegs	%f17,	%f8
	movvs	%xcc,	%i1,	%i7
	array16	%o1,	%o3,	%o4
	bn,a,pn	%xcc,	loop_207
	brlez	%i0,	loop_208
	fbue	%fcc1,	loop_209
	brnz,a	%l1,	loop_210
loop_207:
	tg	%icc,	0x7
loop_208:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x46] %asi,	%i6
loop_209:
	movpos	%xcc,	%o5,	%g3
loop_210:
	nop
	wr	%g0,	0x27,	%asi
	stda	%g4,	[%l7 + 0x50] %asi
	membar	#Sync
	flush	%l7 + 0x20
	bg,pn	%xcc,	loop_211
	fbge,a	%fcc0,	loop_212
	fmovda	%icc,	%f8,	%f31
	tleu	%icc,	0x3
loop_211:
	lduw	[%l7 + 0x68],	%l0
loop_212:
	movneg	%icc,	%g1,	%g2
	fmovscc	%icc,	%f21,	%f6
	bpos,a,pn	%xcc,	loop_213
	smul	%g6,	%l6,	%i2
	movpos	%xcc,	%g7,	%i3
	xor	%l5,	%l3,	%l4
loop_213:
	fmovdge	%icc,	%f28,	%f12
	fmul8sux16	%f18,	%f22,	%f26
	umulcc	%o0,	0x1746,	%o6
	faligndata	%f24,	%f12,	%f20
	set	0x74, %i5
	ldswa	[%l7 + %i5] 0x18,	%o2
	fcmpeq16	%f28,	%f22,	%i5
	tcs	%xcc,	0x3
	umul	%i4,	%o7,	%g5
	fmovrse	%i1,	%f26,	%f26
	fmovrdlez	%i7,	%f28,	%f16
	fmovdneg	%icc,	%f27,	%f18
	srl	%l2,	%o1,	%o4
	fnot1s	%f28,	%f28
	and	%i0,	%l1,	%o3
	prefetch	[%l7 + 0x08],	 0x0
	fmovsa	%xcc,	%f20,	%f25
	fmovsa	%icc,	%f25,	%f30
	bn,pt	%xcc,	loop_214
	orn	%o5,	%g3,	%g4
	popc	%l0,	%i6
	udivcc	%g2,	0x14AA,	%g6
loop_214:
	nop
	set	0x39, %l5
	ldstuba	[%l7 + %l5] 0x81,	%g1
	set	0x48, %l3
	lduwa	[%l7 + %l3] 0x80,	%i2
	taddcc	%g7,	%i3,	%l6
	mova	%xcc,	%l3,	%l4
	udiv	%l5,	0x14F8,	%o0
	fbo	%fcc2,	loop_215
	movge	%icc,	%o2,	%o6
	tge	%icc,	0x2
	smul	%i4,	%o7,	%i5
loop_215:
	sub	%i1,	%g5,	%l2
	fxors	%f8,	%f0,	%f10
	edge32l	%o1,	%i7,	%i0
	udivx	%l1,	0x055F,	%o4
	movl	%xcc,	%o3,	%o5
	brlez,a	%g3,	loop_216
	tneg	%icc,	0x2
	sdivx	%g4,	0x1C52,	%i6
	subcc	%g2,	0x1D16,	%l0
loop_216:
	ldsh	[%l7 + 0x58],	%g6
	fmovs	%f13,	%f5
	tvs	%icc,	0x2
	fone	%f16
	move	%icc,	%g1,	%i2
	fmovsgu	%icc,	%f28,	%f20
	movpos	%icc,	%g7,	%i3
	edge32l	%l3,	%l4,	%l5
	addccc	%o0,	%o2,	%l6
	srax	%o6,	%o7,	%i5
	movrgz	%i4,	0x210,	%i1
	tleu	%icc,	0x3
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%f22
	movpos	%icc,	%g5,	%l2
	sll	%i7,	0x15,	%i0
	mulscc	%o1,	0x14DD,	%o4
	movg	%xcc,	%o3,	%l1
	alignaddr	%g3,	%g4,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f13,	%f24
	movrne	%i6,	%l0,	%g6
	nop
	set	0x74, %g2
	lduw	[%l7 + %g2],	%g2
	movle	%icc,	%g1,	%g7
	fcmpgt16	%f2,	%f22,	%i2
	movrgz	%l3,	0x3F1,	%l4
	fmul8sux16	%f20,	%f16,	%f0
	srl	%l5,	%o0,	%i3
	movg	%xcc,	%o2,	%l6
	movle	%icc,	%o7,	%i5
	movrlz	%i4,	0x1A8,	%o6
	mulscc	%i1,	0x12A1,	%l2
	tn	%icc,	0x5
	sir	0x0BEE
	fmovdg	%xcc,	%f8,	%f8
	tne	%xcc,	0x5
	ld	[%l7 + 0x08],	%f3
	sra	%g5,	0x14,	%i0
	edge16	%i7,	%o1,	%o4
	bne,a,pt	%xcc,	loop_217
	membar	0x1B
	tle	%icc,	0x6
	movpos	%icc,	%o3,	%l1
loop_217:
	fbul,a	%fcc3,	loop_218
	fbo	%fcc3,	loop_219
	fmovsl	%xcc,	%f9,	%f10
	fmul8ulx16	%f22,	%f8,	%f0
loop_218:
	nop
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x37] %asi,	%g4
loop_219:
	fbul,a	%fcc3,	loop_220
	bleu,pt	%xcc,	loop_221
	sdivcc	%o5,	0x0FC1,	%i6
	edge16ln	%l0,	%g6,	%g3
loop_220:
	fmovdgu	%icc,	%f17,	%f25
loop_221:
	bn	loop_222
	tne	%xcc,	0x3
	fmovdle	%xcc,	%f2,	%f17
	ldd	[%l7 + 0x50],	%f28
loop_222:
	movcs	%icc,	%g2,	%g7
	fnand	%f28,	%f30,	%f22
	sllx	%g1,	%i2,	%l4
	ldd	[%l7 + 0x30],	%f20
	movgu	%icc,	%l5,	%l3
	move	%icc,	%i3,	%o0
	udiv	%o2,	0x1A1D,	%o7
	xorcc	%l6,	%i5,	%o6
	orn	%i1,	%l2,	%i4
	movneg	%xcc,	%i0,	%g5
	edge8	%o1,	%i7,	%o3
	alignaddrl	%o4,	%l1,	%o5
	add	%g4,	%l0,	%g6
	fxors	%f23,	%f25,	%f13
	popc	0x1023,	%i6
	tvs	%icc,	0x1
	movn	%icc,	%g3,	%g2
	set	0x198, %i2
	nop 	! 	nop 	! 	ldxa	[%g0 + %i2] 0x40,	%g1 ripped by fixASI40.pl ripped by fixASI40.pl
	fcmpd	%fcc2,	%f18,	%f22
	bgu,pn	%icc,	loop_223
	tg	%icc,	0x5
	fmovdcs	%xcc,	%f31,	%f8
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
loop_223:
	nop
	setx	loop_224,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcc	%xcc,	%i2,	%l5
	tgu	%xcc,	0x1
	fsrc1	%f18,	%f2
loop_224:
	movvc	%xcc,	%l4,	%i3
	move	%icc,	%l3,	%o2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x3F] %asi,	%o7
	movrgez	%o0,	0x0A4,	%i5
	ldd	[%l7 + 0x18],	%i6
	tl	%icc,	0x3
	udivx	%i1,	0x1B18,	%o6
	movneg	%xcc,	%l2,	%i0
	srl	%i4,	0x1B,	%g5
	flush	%l7 + 0x7C
	movrgz	%o1,	%i7,	%o3
	fmovsneg	%xcc,	%f25,	%f31
	bge	%icc,	loop_225
	stx	%l1,	[%l7 + 0x48]
	fmovde	%xcc,	%f26,	%f8
	tvc	%icc,	0x3
loop_225:
	fabsd	%f20,	%f18
	set	0x10, %o6
	sta	%f15,	[%l7 + %o6] 0x10
	xnorcc	%o5,	%o4,	%g4
	fmovsl	%xcc,	%f4,	%f7
	sll	%g6,	0x0A,	%l0
	udivcc	%i6,	0x1F04,	%g2
	fmovsvc	%xcc,	%f31,	%f22
	stb	%g1,	[%l7 + 0x1B]
	alignaddr	%g3,	%i2,	%l5
	array32	%l4,	%g7,	%i3
	movrlez	%l3,	0x047,	%o7
	fxnor	%f30,	%f6,	%f20
	tcs	%icc,	0x2
	movrne	%o2,	0x1D6,	%i5
	orcc	%o0,	%i1,	%o6
	ldx	[%l7 + 0x68],	%l6
	udivx	%l2,	0x0902,	%i0
	tne	%icc,	0x7
	fpadd32s	%f15,	%f15,	%f13
	sub	%i4,	0x1773,	%o1
	bne	%icc,	loop_226
	xnor	%i7,	0x1A1B,	%g5
	fmovsg	%icc,	%f13,	%f0
	and	%l1,	%o5,	%o3
loop_226:
	movgu	%xcc,	%o4,	%g4
	taddcc	%l0,	0x0BB8,	%i6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x11,	%g6,	%g1
	bvs	loop_227
	popc	%g2,	%i2
	edge16	%g3,	%l4,	%g7
	udivx	%i3,	0x115F,	%l5
loop_227:
	fbge	%fcc3,	loop_228
	movrne	%o7,	%l3,	%i5
	add	%o0,	0x02B1,	%o2
	std	%i0,	[%l7 + 0x40]
loop_228:
	movrgez	%o6,	0x37F,	%l6
	tne	%icc,	0x3
	ldd	[%l7 + 0x58],	%i0
	movrlz	%i4,	%o1,	%l2
	wr	%g0,	0x19,	%asi
	stha	%i7,	[%l7 + 0x1C] %asi
	alignaddrl	%l1,	%o5,	%o3
	faligndata	%f8,	%f10,	%f0
	sdivcc	%g5,	0x1981,	%o4
	umul	%g4,	%l0,	%i6
	udiv	%g1,	0x10DA,	%g2
	fbn,a	%fcc2,	loop_229
	ba,pt	%icc,	loop_230
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%g6,	%i2
loop_229:
	edge16	%g3,	%l4,	%g7
loop_230:
	fmovrdlz	%i3,	%f14,	%f2
	fba	%fcc3,	loop_231
	edge8l	%o7,	%l3,	%l5
	smulcc	%o0,	0x16B5,	%o2
	fmul8x16	%f11,	%f28,	%f24
loop_231:
	smulcc	%i1,	0x1AC5,	%i5
	movvs	%icc,	%l6,	%i0
	fmovsa	%icc,	%f23,	%f9
	movne	%xcc,	%o6,	%o1
	fpsub32s	%f11,	%f3,	%f11
	array8	%l2,	%i4,	%l1
	alignaddrl	%i7,	%o5,	%o3
	edge16n	%o4,	%g4,	%g5
	xnor	%l0,	%i6,	%g1
	bne,pn	%icc,	loop_232
	tn	%xcc,	0x7
	edge32l	%g6,	%i2,	%g3
	sra	%l4,	0x07,	%g2
loop_232:
	sra	%i3,	0x1B,	%o7
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x19] %asi,	%g7
	move	%xcc,	%l5,	%l3
	movrlz	%o0,	%i1,	%i5
	tvs	%icc,	0x6
	sra	%o2,	0x1B,	%l6
	sth	%o6,	[%l7 + 0x6C]
	fbne,a	%fcc0,	loop_233
	sll	%i0,	%o1,	%l2
	array16	%i4,	%l1,	%i7
	movrne	%o5,	0x3D0,	%o4
loop_233:
	ldx	[%l7 + 0x48],	%o3
	taddcctv	%g5,	%g4,	%l0
	andncc	%i6,	%g6,	%g1
	sdiv	%i2,	0x0062,	%l4
	fmovdvs	%xcc,	%f27,	%f27
	andcc	%g2,	%g3,	%o7
	array16	%i3,	%l5,	%g7
	movleu	%icc,	%l3,	%o0
	fcmps	%fcc2,	%f5,	%f21
	movrlez	%i5,	%o2,	%i1
	movrne	%l6,	%o6,	%o1
	bvc,a	loop_234
	movvc	%xcc,	%i0,	%i4
	sllx	%l2,	0x04,	%i7
	edge32n	%o5,	%l1,	%o4
loop_234:
	nop
	wr	%g0,	0x52,	%asi
	stxa	%g5,	[%g0 + 0x118] %asi
	fmovsleu	%xcc,	%f7,	%f15
	sdivx	%g4,	0x0F91,	%o3
	srl	%l0,	%i6,	%g6
	orncc	%g1,	%l4,	%i2
	set	0x6F, %o4
	ldstuba	[%l7 + %o4] 0x18,	%g2
	fcmps	%fcc1,	%f17,	%f20
	orn	%g3,	0x1837,	%o7
	tcs	%icc,	0x2
	smulcc	%l5,	%g7,	%l3
	movvs	%icc,	%o0,	%i3
	umul	%i5,	%o2,	%l6
	ldsh	[%l7 + 0x42],	%o6
	fmovdvc	%icc,	%f23,	%f13
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x08] %asi,	%o1
	set	0x50, %l0
	ldxa	[%l7 + %l0] 0x19,	%i1
	fmovdvc	%xcc,	%f0,	%f13
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x18] %asi,	%i4
	movcc	%xcc,	%i0,	%l2
	fpadd16s	%f3,	%f9,	%f16
	lduw	[%l7 + 0x54],	%o5
	movleu	%icc,	%l1,	%o4
	array32	%g5,	%i7,	%o3
	stx	%l0,	[%l7 + 0x20]
	edge8	%i6,	%g4,	%g1
	tpos	%icc,	0x4
	srlx	%l4,	%g6,	%g2
	edge16ln	%i2,	%o7,	%l5
	fmovs	%f11,	%f26
	te	%icc,	0x6
	umul	%g7,	0x19EE,	%l3
	tvs	%icc,	0x0
	fzeros	%f1
	bn,a	%xcc,	loop_235
	edge8l	%g3,	%i3,	%o0
	smulcc	%i5,	%l6,	%o2
	add	%o1,	%o6,	%i1
loop_235:
	orn	%i0,	0x1539,	%i4
	fpadd16s	%f21,	%f3,	%f30
	set	0x32, %g1
	lduha	[%l7 + %g1] 0x11,	%l2
	mulscc	%o5,	%o4,	%g5
	xorcc	%i7,	%o3,	%l0
	set	0x20, %o5
	ldda	[%l7 + %o5] 0xea,	%i6
	tge	%xcc,	0x7
	fbg	%fcc3,	loop_236
	array8	%g4,	%l1,	%l4
	membar	0x07
	sra	%g1,	%g2,	%i2
loop_236:
	tvs	%icc,	0x7
	fcmpeq16	%f30,	%f18,	%o7
	fbule,a	%fcc0,	loop_237
	edge32l	%l5,	%g6,	%l3
	fmovdleu	%icc,	%f31,	%f7
	fbe	%fcc0,	loop_238
loop_237:
	xorcc	%g3,	0x0AC9,	%i3
	subccc	%g7,	%i5,	%o0
	bpos,a	loop_239
loop_238:
	sir	0x0C71
	sllx	%l6,	%o2,	%o6
	st	%f5,	[%l7 + 0x28]
loop_239:
	ble	%icc,	loop_240
	brgz,a	%o1,	loop_241
	nop
	setx loop_242, %l0, %l1
	jmpl %l1, %i0
	addccc	%i4,	%l2,	%i1
loop_240:
	sdiv	%o4,	0x1527,	%o5
loop_241:
	movpos	%xcc,	%g5,	%i7
loop_242:
	subccc	%l0,	0x154C,	%o3
	fmovsn	%icc,	%f2,	%f24
	edge32ln	%i6,	%g4,	%l1
	sub	%l4,	0x0D5C,	%g1
	bn,a	%icc,	loop_243
	bn,a	%xcc,	loop_244
	alignaddrl	%g2,	%i2,	%l5
	ldsh	[%l7 + 0x5E],	%o7
loop_243:
	ble	loop_245
loop_244:
	ldstub	[%l7 + 0x37],	%l3
	stb	%g3,	[%l7 + 0x34]
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%i3
loop_245:
	nop
	set	0x28, %l4
	stxa	%g7,	[%g0 + %l4] 0x4f
	bge,pt	%icc,	loop_246
	fbe	%fcc2,	loop_247
	fbl,a	%fcc1,	loop_248
	ldub	[%l7 + 0x44],	%i5
loop_246:
	subcc	%g6,	0x024B,	%l6
loop_247:
	orn	%o0,	0x1E97,	%o6
loop_248:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	smul	%o2,	0x19FA,	%o1
	tle	%icc,	0x5
	edge16l	%i4,	%l2,	%i0
	fmovspos	%xcc,	%f25,	%f30
	orncc	%i1,	%o4,	%g5
	tsubcctv	%o5,	0x1A0E,	%l0
	edge8l	%o3,	%i6,	%g4
	fmovsleu	%icc,	%f4,	%f10
	tge	%xcc,	0x4
	smulcc	%i7,	0x0073,	%l1
	fbn	%fcc1,	loop_249
	nop
	setx	loop_250,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbo,a	%fcc2,	loop_251
	fmovdn	%xcc,	%f3,	%f17
loop_249:
	fcmple32	%f0,	%f18,	%l4
loop_250:
	tpos	%xcc,	0x2
loop_251:
	or	%g1,	0x0DE6,	%i2
	orcc	%g2,	%o7,	%l5
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%g3
	movg	%icc,	%i3,	%g7
	set	0x7C, %o0
	stwa	%l3,	[%l7 + %o0] 0x2f
	membar	#Sync
	orn	%i5,	%l6,	%o0
	subc	%g6,	%o2,	%o6
	addc	%i4,	0x0525,	%l2
	fbe,a	%fcc2,	loop_252
	membar	0x61
	orncc	%i0,	0x06C9,	%o1
	fpack32	%f10,	%f30,	%f2
loop_252:
	movrlz	%o4,	%i1,	%o5
	srlx	%g5,	%l0,	%i6
	set	0x76, %g4
	ldsha	[%l7 + %g4] 0x81,	%o3
	udivx	%g4,	0x0C7C,	%l1
	movge	%xcc,	%i7,	%g1
	movrlz	%l4,	%g2,	%o7
	popc	%l5,	%g3
	movvs	%icc,	%i2,	%i3
	fcmpeq16	%f8,	%f26,	%g7
	fmovsleu	%xcc,	%f2,	%f20
	tvs	%xcc,	0x3
	fone	%f0
	movgu	%icc,	%i5,	%l3
	fmovse	%xcc,	%f22,	%f3
	ldsh	[%l7 + 0x50],	%o0
	fpackfix	%f30,	%f6
	movle	%icc,	%l6,	%g6
	fornot1s	%f10,	%f14,	%f17
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o2
	edge8	%i4,	%l2,	%i0
	fmovse	%icc,	%f29,	%f15
	ldsb	[%l7 + 0x3F],	%o6
	and	%o1,	0x0057,	%i1
	sdiv	%o5,	0x084B,	%o4
	te	%icc,	0x2
	fmovspos	%xcc,	%f30,	%f20
	tne	%xcc,	0x2
	movleu	%icc,	%l0,	%g5
	wr	%g0,	0x80,	%asi
	stba	%o3,	[%l7 + 0x6B] %asi
	wr	%g0,	0xe2,	%asi
	stba	%g4,	[%l7 + 0x6C] %asi
	membar	#Sync
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x81,	 0x1
	tn	%xcc,	0x0
	sth	%l1,	[%l7 + 0x44]
	bne,pn	%icc,	loop_253
	edge32n	%i7,	%g1,	%g2
	fmul8ulx16	%f24,	%f0,	%f10
	movcc	%icc,	%l4,	%l5
loop_253:
	smulcc	%o7,	0x06E5,	%i2
	brnz,a	%i3,	loop_254
	bvc,a,pn	%xcc,	loop_255
	bneg,pt	%xcc,	loop_256
	udivcc	%g3,	0x1018,	%g7
loop_254:
	sethi	0x1D50,	%i5
loop_255:
	movpos	%xcc,	%o0,	%l3
loop_256:
	fsrc1s	%f22,	%f23
	st	%f16,	[%l7 + 0x14]
	tle	%icc,	0x3
	fmovsgu	%icc,	%f6,	%f12
	fmul8ulx16	%f8,	%f28,	%f2
	tsubcc	%l6,	%g6,	%o2
	fmovdneg	%icc,	%f17,	%f29
	sllx	%i4,	%i0,	%o6
	sra	%l2,	0x1E,	%i1
	fmovrdlz	%o1,	%f4,	%f0
	movl	%icc,	%o5,	%o4
	nop
	set	0x58, %i7
	sth	%l0,	[%l7 + %i7]
	fmovdneg	%icc,	%f31,	%f20
	nop
	setx	loop_257,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orcc	%g5,	%g4,	%i6
	fmovsge	%xcc,	%f16,	%f23
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x58] %asi,	%l1
loop_257:
	edge32ln	%i7,	%o3,	%g1
	fnot1s	%f25,	%f19
	umulcc	%g2,	%l5,	%o7
	edge8n	%i2,	%i3,	%g3
	fones	%f8
	edge32l	%l4,	%g7,	%o0
	tl	%xcc,	0x4
	array16	%l3,	%l6,	%i5
	fmovdpos	%icc,	%f26,	%f20
	fbug,a	%fcc2,	loop_258
	movne	%icc,	%o2,	%g6
	edge16n	%i0,	%i4,	%o6
	tcc	%xcc,	0x5
loop_258:
	bn,a	%xcc,	loop_259
	ldstub	[%l7 + 0x75],	%i1
	fmovde	%xcc,	%f18,	%f19
	fcmpes	%fcc3,	%f19,	%f3
loop_259:
	sdiv	%o1,	0x0802,	%o5
	movl	%icc,	%l2,	%l0
	taddcc	%g5,	%o4,	%i6
	sdivcc	%g4,	0x1985,	%i7
	subc	%l1,	0x06D2,	%o3
	fmovsl	%icc,	%f14,	%f3
	mulscc	%g2,	%l5,	%o7
	wr	%g0,	0x18,	%asi
	sta	%f5,	[%l7 + 0x40] %asi
	tgu	%xcc,	0x0
	fpsub16s	%f9,	%f30,	%f17
	movgu	%xcc,	%i2,	%i3
	nop
	setx loop_260, %l0, %l1
	jmpl %l1, %g1
	swap	[%l7 + 0x34],	%g3
	movg	%icc,	%g7,	%l4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%o0
loop_260:
	addcc	%l6,	0x0D16,	%i5
	fpack16	%f22,	%f5
	taddcctv	%o2,	0x16CB,	%g6
	srl	%i4,	0x1C,	%o6
	movre	%i1,	0x3C4,	%o1
	fbug	%fcc2,	loop_261
	fzeros	%f7
	subcc	%o5,	0x0EE0,	%l2
	tne	%icc,	0x3
loop_261:
	bge,a	%icc,	loop_262
	movn	%icc,	%i0,	%g5
	fcmpne16	%f10,	%f0,	%o4
	fmovscc	%icc,	%f31,	%f10
loop_262:
	fcmpeq16	%f14,	%f24,	%i6
	fmovse	%xcc,	%f28,	%f31
	fmovsneg	%xcc,	%f0,	%f26
	subcc	%l0,	%g4,	%l1
	umul	%o3,	0x1C2F,	%g2
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x48] %asi,	%i7
	fnands	%f9,	%f4,	%f2
	bcc,pt	%icc,	loop_263
	tcs	%icc,	0x7
	edge32	%l5,	%i2,	%i3
	movrne	%g1,	%o7,	%g7
loop_263:
	nop
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x0c
	edge16l	%l4,	%l3,	%g3
	movrlz	%o0,	%l6,	%i5
	addcc	%g6,	%i4,	%o2
	bvs,a,pt	%xcc,	loop_264
	sra	%o6,	%i1,	%o1
	siam	0x5
	pdist	%f18,	%f26,	%f22
loop_264:
	movn	%xcc,	%o5,	%l2
	edge16n	%g5,	%o4,	%i6
	movge	%icc,	%l0,	%i0
	fmovspos	%icc,	%f23,	%f17
	ble,pt	%xcc,	loop_265
	bgu	%xcc,	loop_266
	fmul8x16al	%f11,	%f0,	%f4
	edge8ln	%g4,	%o3,	%l1
loop_265:
	smul	%i7,	%g2,	%l5
loop_266:
	smul	%i2,	0x1C4B,	%i3
	fand	%f10,	%f0,	%f6
	bge,a,pn	%xcc,	loop_267
	tpos	%icc,	0x3
	movrgz	%g1,	%g7,	%l4
	fmovscs	%icc,	%f13,	%f28
loop_267:
	ldx	[%l7 + 0x58],	%l3
	movrne	%g3,	0x14D,	%o7
	srl	%o0,	%l6,	%g6
	fornot2	%f16,	%f16,	%f14
	xorcc	%i5,	%i4,	%o2
	ldx	[%l7 + 0x68],	%o6
	alignaddr	%i1,	%o1,	%l2
	xorcc	%g5,	%o5,	%i6
	brz	%o4,	loop_268
	tpos	%icc,	0x7
	bneg,pn	%xcc,	loop_269
	ldsh	[%l7 + 0x6E],	%l0
loop_268:
	fmovdcc	%icc,	%f2,	%f26
	movrgez	%g4,	0x0C4,	%i0
loop_269:
	tvc	%xcc,	0x2
	taddcctv	%l1,	%o3,	%i7
	fnor	%f28,	%f22,	%f20
	mulx	%l5,	%g2,	%i3
	orcc	%g1,	0x18A5,	%g7
	movleu	%icc,	%l4,	%l3
	lduw	[%l7 + 0x30],	%g3
	movg	%icc,	%i2,	%o7
	edge16l	%o0,	%g6,	%i5
	tn	%xcc,	0x7
	mulx	%l6,	0x1745,	%o2
	stb	%o6,	[%l7 + 0x70]
	subccc	%i1,	%o1,	%i4
	stbar
	edge32	%g5,	%o5,	%l2
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
	umul	%o4,	0x1F76,	%g4
	ba,a,pn	%xcc,	loop_270
	sllx	%l0,	0x00,	%l1
	set	0x5C, %o3
	stwa	%i0,	[%l7 + %o3] 0x15
loop_270:
	fbg,a	%fcc2,	loop_271
	andcc	%o3,	%l5,	%g2
	srl	%i3,	0x1B,	%i7
	movpos	%xcc,	%g1,	%g7
loop_271:
	edge32l	%l3,	%g3,	%l4
	fmovsneg	%icc,	%f27,	%f11
	tpos	%xcc,	0x2
	fnors	%f18,	%f3,	%f10
	bleu,pt	%xcc,	loop_272
	movre	%i2,	0x06D,	%o0
	orn	%o7,	%i5,	%l6
	xnorcc	%g6,	%o2,	%i1
loop_272:
	tleu	%xcc,	0x1
	movcc	%icc,	%o1,	%i4
	udivx	%o6,	0x0EA8,	%g5
	umulcc	%o5,	%l2,	%i6
	bneg	loop_273
	tsubcctv	%o4,	%g4,	%l0
	nop
	set	0x7B, %g6
	stb	%l1,	[%l7 + %g6]
	addc	%o3,	0x0464,	%l5
loop_273:
	sethi	0x0781,	%g2
	taddcctv	%i3,	0x1BA8,	%i0
	set	0x50, %o2
	prefetcha	[%l7 + %o2] 0x19,	 0x0
	fmovsvs	%xcc,	%f30,	%f10
	sir	0x0AF7
	srax	%g7,	%l3,	%g3
	brgz,a	%l4,	loop_274
	andcc	%g1,	%o0,	%i2
	bcs,pn	%icc,	loop_275
	fxnor	%f30,	%f22,	%f18
loop_274:
	and	%i5,	%o7,	%l6
	fmovdl	%xcc,	%f14,	%f20
loop_275:
	ldub	[%l7 + 0x0C],	%g6
	andncc	%o2,	%o1,	%i4
	tn	%xcc,	0x0
	for	%f28,	%f26,	%f30
	fones	%f6
	fnot2s	%f11,	%f11
	brgz	%i1,	loop_276
	edge8ln	%g5,	%o5,	%o6
	fbo,a	%fcc3,	loop_277
	movge	%icc,	%l2,	%i6
loop_276:
	fabss	%f9,	%f12
	ldx	[%l7 + 0x48],	%o4
loop_277:
	fmovsg	%icc,	%f25,	%f13
	fbo,a	%fcc2,	loop_278
	udivcc	%g4,	0x18BC,	%l0
	udivcc	%l1,	0x19B4,	%o3
	fbl,a	%fcc3,	loop_279
loop_278:
	srax	%l5,	%g2,	%i0
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x18] %asi,	%i7
loop_279:
	ta	%xcc,	0x0
	fba,a	%fcc1,	loop_280
	andn	%i3,	0x02E7,	%g7
	alignaddrl	%l3,	%g3,	%g1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%l4
loop_280:
	umul	%i5,	%i2,	%o7
	fbne	%fcc1,	loop_281
	fba	%fcc0,	loop_282
	xnorcc	%l6,	0x1315,	%o2
	tg	%icc,	0x7
loop_281:
	orncc	%o1,	0x1215,	%i4
loop_282:
	fmul8x16al	%f25,	%f26,	%f24
	fmovdg	%icc,	%f4,	%f7
	bvc,pn	%xcc,	loop_283
	fands	%f6,	%f31,	%f29
	addc	%g6,	%g5,	%o5
	fbul	%fcc1,	loop_284
loop_283:
	sub	%i1,	%o6,	%l2
	umulcc	%i6,	%g4,	%l0
	ba,pn	%xcc,	loop_285
loop_284:
	edge8n	%o4,	%l1,	%o3
	movvc	%xcc,	%l5,	%i0
	move	%xcc,	%i7,	%i3
loop_285:
	movrgz	%g7,	%g2,	%l3
	tle	%xcc,	0x0
	addc	%g3,	0x148D,	%o0
	sll	%l4,	0x16,	%i5
	popc	0x0698,	%i2
	movvc	%xcc,	%g1,	%o7
	sll	%l6,	0x06,	%o1
	tle	%xcc,	0x1
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x60] %asi,	%i4
	wr	%g0,	0x80,	%asi
	stwa	%o2,	[%l7 + 0x54] %asi
	swap	[%l7 + 0x0C],	%g6
	fcmpeq16	%f20,	%f20,	%o5
	movcs	%xcc,	%i1,	%g5
	wr	%g0,	0x80,	%asi
	sta	%f12,	[%l7 + 0x10] %asi
	sra	%o6,	%l2,	%g4
	movne	%xcc,	%i6,	%o4
	sllx	%l1,	%l0,	%o3
	udivx	%i0,	0x1569,	%i7
	fnors	%f24,	%f8,	%f9
	set	0x6E, %o1
	stha	%l5,	[%l7 + %o1] 0x88
	movle	%xcc,	%i3,	%g7
	fornot1s	%f19,	%f1,	%f28
	set	0x20, %l1
	ldda	[%l7 + %l1] 0x89,	%g2
	umulcc	%l3,	%o0,	%l4
	smul	%g3,	0x14BA,	%i5
	fmovsleu	%xcc,	%f24,	%f25
	sth	%g1,	[%l7 + 0x4E]
	fmovsl	%icc,	%f14,	%f17
	tvc	%xcc,	0x2
	set	0x10, %l6
	swapa	[%l7 + %l6] 0x89,	%o7
	tvs	%icc,	0x1
	movvc	%icc,	%l6,	%i2
	std	%f2,	[%l7 + 0x60]
	fbe	%fcc3,	loop_286
	array16	%i4,	%o2,	%g6
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%o1
loop_286:
	fbne,a	%fcc3,	loop_287
	bleu,a,pt	%icc,	loop_288
	mulscc	%o5,	0x11D7,	%g5
	tg	%xcc,	0x5
loop_287:
	fmovdgu	%xcc,	%f12,	%f28
loop_288:
	nop
	wr	%g0,	0x0c,	%asi
	stha	%o6,	[%l7 + 0x34] %asi
	fbul	%fcc0,	loop_289
	ble	loop_290
	movrne	%i1,	%g4,	%i6
	tg	%icc,	0x5
loop_289:
	tgu	%icc,	0x0
loop_290:
	movne	%xcc,	%l2,	%o4
	fmovsl	%icc,	%f13,	%f22
	be	%xcc,	loop_291
	sub	%l1,	0x1122,	%o3
	subcc	%l0,	%i7,	%i0
	tvc	%xcc,	0x0
loop_291:
	tcs	%icc,	0x6
	fmovsl	%icc,	%f8,	%f27
	fbge,a	%fcc0,	loop_292
	movcc	%xcc,	%i3,	%g7
	edge32ln	%g2,	%l3,	%l5
	edge8l	%o0,	%l4,	%g3
loop_292:
	tl	%xcc,	0x5
	sub	%i5,	0x1720,	%o7
	flush	%l7 + 0x6C
	bleu,a,pn	%icc,	loop_293
	tne	%icc,	0x1
	tneg	%icc,	0x0
	fand	%f28,	%f18,	%f26
loop_293:
	tvc	%xcc,	0x0
	fcmpd	%fcc3,	%f22,	%f10
	srl	%g1,	0x04,	%i2
	fbule,a	%fcc0,	loop_294
	ldd	[%l7 + 0x70],	%i4
	mulscc	%o2,	%l6,	%o1
	tsubcctv	%o5,	%g5,	%o6
loop_294:
	movrne	%i1,	%g4,	%g6
	orn	%i6,	0x053E,	%l2
	edge8	%l1,	%o4,	%l0
	move	%xcc,	%i7,	%i0
	movvs	%icc,	%o3,	%g7
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x80
	array8	%g2,	%l3,	%i3
	andn	%l5,	0x0BCD,	%l4
	sub	%g3,	0x1C10,	%o0
	movn	%xcc,	%o7,	%g1
	tl	%icc,	0x4
	edge32	%i5,	%i2,	%o2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%l6
	stx	%o5,	[%l7 + 0x68]
	movrlz	%g5,	0x18A,	%o6
	edge32n	%i1,	%o1,	%g6
	fsrc1	%f6,	%f24
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	ldsh	[%l7 + 0x42],	%l2
	fmovsvc	%icc,	%f13,	%f30
	edge16	%l1,	%g4,	%o4
	mova	%xcc,	%i7,	%l0
	bneg	loop_295
	fcmple16	%f18,	%f30,	%i0
	fbe,a	%fcc3,	loop_296
	fbue	%fcc1,	loop_297
loop_295:
	membar	0x11
	wr	%g0,	0x11,	%asi
	sta	%f18,	[%l7 + 0x1C] %asi
loop_296:
	umulcc	%o3,	0x07A8,	%g7
loop_297:
	fmovsneg	%xcc,	%f18,	%f6
	stbar
	nop
	set	0x5A, %i3
	ldsh	[%l7 + %i3],	%l3
	sdiv	%g2,	0x1C61,	%i3
	set	0x2C, %g5
	sta	%f23,	[%l7 + %g5] 0x80
	edge8	%l5,	%l4,	%g3
	edge8l	%o0,	%o7,	%g1
	bpos,a,pn	%icc,	loop_298
	movge	%icc,	%i2,	%i5
	tpos	%xcc,	0x5
	fbule	%fcc3,	loop_299
loop_298:
	movne	%xcc,	%i4,	%o2
	tsubcc	%l6,	0x11B7,	%o5
	fpsub32s	%f5,	%f17,	%f15
loop_299:
	brnz	%o6,	loop_300
	sdivx	%g5,	0x0F00,	%o1
	fors	%f8,	%f11,	%f5
	tn	%icc,	0x5
loop_300:
	fabsd	%f28,	%f30
	tcc	%icc,	0x6
	for	%f28,	%f0,	%f22
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%i1
	fpsub32s	%f28,	%f17,	%f20
	tle	%xcc,	0x6
	array8	%i6,	%l2,	%l1
	fbule	%fcc3,	loop_301
	fmovrsgz	%o4,	%f24,	%f7
	sub	%g4,	%i7,	%i0
	fmul8ulx16	%f6,	%f6,	%f18
loop_301:
	movre	%l0,	%g7,	%l3
	sir	0x0D73
	bpos,a	loop_302
	fzero	%f28
	add	%o3,	%i3,	%l5
	stx	%l4,	[%l7 + 0x48]
loop_302:
	tneg	%xcc,	0x3
	movneg	%icc,	%g2,	%o0
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x2B] %asi,	%g3
	edge32l	%g1,	%o7,	%i5
	brnz,a	%i4,	loop_303
	fmovsgu	%icc,	%f26,	%f18
	set	0x18, %i6
	stxa	%i2,	[%l7 + %i6] 0x2b
	membar	#Sync
loop_303:
	sdivcc	%o2,	0x0271,	%o5
	ldd	[%l7 + 0x28],	%o6
	taddcctv	%l6,	0x0801,	%o1
	tvc	%icc,	0x1
	fpsub32	%f16,	%f2,	%f18
	udivx	%g6,	0x0C15,	%i1
	tsubcc	%i6,	0x0D79,	%g5
	umul	%l2,	%l1,	%g4
	tne	%icc,	0x3
	tcc	%xcc,	0x4
	movrgez	%o4,	0x00A,	%i7
	brnz,a	%l0,	loop_304
	fmovrdne	%i0,	%f12,	%f24
	xnorcc	%l3,	%g7,	%o3
	fmuld8ulx16	%f1,	%f28,	%f26
loop_304:
	fnot1	%f8,	%f20
	tpos	%icc,	0x5
	tsubcctv	%i3,	%l5,	%g2
	membar	0x7E
	edge16ln	%o0,	%l4,	%g1
	movrne	%g3,	0x1A8,	%o7
	movge	%icc,	%i4,	%i5
	movvc	%xcc,	%i2,	%o2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x80,	%o6,	%l6
	mova	%xcc,	%o5,	%o1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%i1
	movvc	%icc,	%i6,	%g5
	fbn,a	%fcc3,	loop_305
	tpos	%xcc,	0x0
	stb	%l2,	[%l7 + 0x43]
	stb	%g4,	[%l7 + 0x17]
loop_305:
	movvs	%xcc,	%l1,	%i7
	bcc,a,pn	%icc,	loop_306
	movle	%icc,	%l0,	%i0
	tn	%xcc,	0x3
	srlx	%o4,	%l3,	%o3
loop_306:
	nop
	setx	loop_307,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbug	%fcc3,	loop_308
	movgu	%icc,	%g7,	%l5
	fbn	%fcc3,	loop_309
loop_307:
	fzero	%f30
loop_308:
	or	%i3,	%o0,	%l4
	orncc	%g2,	%g1,	%o7
loop_309:
	fpsub32s	%f26,	%f3,	%f27
	tleu	%icc,	0x1
	fbne,a	%fcc1,	loop_310
	movg	%xcc,	%g3,	%i5
	fsrc1	%f20,	%f12
	tn	%icc,	0x4
loop_310:
	or	%i4,	%o2,	%o6
	tvc	%xcc,	0x7
	fand	%f28,	%f14,	%f10
	fmovscc	%icc,	%f3,	%f0
	tn	%icc,	0x0
	wr	%g0,	0x89,	%asi
	stha	%i2,	[%l7 + 0x62] %asi
	tsubcc	%l6,	0x1817,	%o1
	andncc	%g6,	%o5,	%i6
	movre	%i1,	%l2,	%g4
	fcmple32	%f6,	%f24,	%l1
	popc	0x1636,	%g5
	movrne	%l0,	%i0,	%o4
	fmovrdlz	%l3,	%f0,	%f28
	fpadd16	%f4,	%f26,	%f6
	edge16l	%o3,	%i7,	%g7
	ldsw	[%l7 + 0x5C],	%l5
	subc	%o0,	0x0573,	%l4
	andncc	%g2,	%i3,	%g1
	alignaddrl	%g3,	%o7,	%i5
	sdiv	%i4,	0x05E6,	%o6
	mulx	%o2,	0x1862,	%l6
	movgu	%xcc,	%i2,	%o1
	tvs	%xcc,	0x6
	tsubcctv	%o5,	%g6,	%i6
	lduh	[%l7 + 0x1E],	%l2
	movcs	%icc,	%g4,	%i1
	fandnot2	%f18,	%f28,	%f18
	st	%f0,	[%l7 + 0x20]
	subcc	%l1,	%l0,	%g5
	fbe,a	%fcc2,	loop_311
	nop
	setx loop_312, %l0, %l1
	jmpl %l1, %i0
	subcc	%l3,	0x1599,	%o4
	fmovse	%xcc,	%f23,	%f17
loop_311:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_312:
	movre	%o3,	0x1BD,	%i7
	be	%xcc,	loop_313
	edge32ln	%l5,	%o0,	%g7
	edge32n	%g2,	%i3,	%l4
	bne	%xcc,	loop_314
loop_313:
	andn	%g1,	%g3,	%i5
	udiv	%i4,	0x011B,	%o6
	smulcc	%o2,	0x161B,	%l6
loop_314:
	movrgez	%i2,	%o7,	%o1
	taddcctv	%g6,	%o5,	%i6
	faligndata	%f0,	%f6,	%f24
	addccc	%g4,	%l2,	%l1
	fmovrse	%l0,	%f10,	%f12
	bl,a,pt	%xcc,	loop_315
	movrgz	%g5,	0x371,	%i1
	sdivx	%i0,	0x1716,	%o4
	brnz	%o3,	loop_316
loop_315:
	fcmpne32	%f8,	%f26,	%i7
	udiv	%l3,	0x0B72,	%l5
	srlx	%o0,	%g2,	%i3
loop_316:
	umulcc	%l4,	0x0068,	%g1
	edge16l	%g7,	%g3,	%i5
	tl	%icc,	0x6
	sllx	%o6,	0x0B,	%o2
	edge16ln	%l6,	%i2,	%i4
	array16	%o7,	%g6,	%o5
	movl	%icc,	%i6,	%g4
	ldub	[%l7 + 0x45],	%l2
	srlx	%l1,	0x0F,	%o1
	brlez,a	%g5,	loop_317
	sdivx	%i1,	0x0E5C,	%l0
	fmovrsgez	%o4,	%f13,	%f21
	umulcc	%o3,	%i0,	%i7
loop_317:
	edge32	%l5,	%l3,	%g2
	subc	%i3,	%o0,	%l4
	fzeros	%f3
	wr	%g0,	0x11,	%asi
	stba	%g7,	[%l7 + 0x31] %asi
	movge	%icc,	%g1,	%i5
	sll	%o6,	0x02,	%g3
	fpadd16s	%f0,	%f14,	%f5
	fpack16	%f0,	%f2
	srl	%o2,	0x10,	%i2
	fbule,a	%fcc2,	loop_318
	andn	%i4,	0x07BA,	%l6
	movre	%o7,	0x18D,	%o5
	edge8l	%i6,	%g6,	%g4
loop_318:
	sdivx	%l1,	0x136C,	%o1
	tcc	%icc,	0x6
	fmul8sux16	%f2,	%f14,	%f2
	fmuld8ulx16	%f14,	%f5,	%f22
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x60] %asi,	%l2
	movcc	%icc,	%i1,	%l0
	faligndata	%f4,	%f26,	%f10
	ta	%icc,	0x3
	std	%o4,	[%l7 + 0x38]
	fcmpne32	%f8,	%f22,	%g5
	sllx	%i0,	%i7,	%l5
	movneg	%icc,	%o3,	%g2
	fmovrsgez	%l3,	%f9,	%f3
	array8	%i3,	%l4,	%o0
	ldsb	[%l7 + 0x61],	%g7
	tgu	%xcc,	0x7
	fornot1s	%f27,	%f7,	%f25
	fmovrse	%g1,	%f17,	%f9
	smul	%o6,	0x123A,	%g3
	movcs	%icc,	%i5,	%i2
	umulcc	%i4,	%o2,	%l6
	set	0x70, %l2
	prefetcha	[%l7 + %l2] 0x14,	 0x3
	tneg	%xcc,	0x2
	movrne	%o5,	0x017,	%i6
	fpsub32	%f2,	%f2,	%f20
	fandnot1	%f28,	%f8,	%f0
	ldx	[%l7 + 0x58],	%g4
	edge8	%l1,	%o1,	%l2
	set	0x14, %o7
	stha	%g6,	[%l7 + %o7] 0x2b
	membar	#Sync
	ldd	[%l7 + 0x18],	%l0
	fbule	%fcc2,	loop_319
	fmovdgu	%xcc,	%f12,	%f25
	tpos	%xcc,	0x7
	siam	0x1
loop_319:
	subc	%i1,	0x001B,	%g5
	prefetch	[%l7 + 0x5C],	 0x3
	array32	%o4,	%i7,	%l5
	edge8ln	%i0,	%g2,	%o3
	sra	%l3,	0x07,	%i3
	tcc	%xcc,	0x4
	fmovdvc	%xcc,	%f27,	%f15
	movcc	%xcc,	%l4,	%o0
	movrgez	%g1,	0x1C5,	%o6
	udivx	%g3,	0x0BFE,	%i5
	umul	%g7,	0x1387,	%i4
	fbul,a	%fcc2,	loop_320
	and	%o2,	0x0F07,	%i2
	movpos	%icc,	%l6,	%o5
	subcc	%o7,	0x1E18,	%g4
loop_320:
	bvs,a	loop_321
	subc	%l1,	0x00C4,	%i6
	fornot1	%f28,	%f8,	%f24
	orn	%l2,	0x1520,	%g6
loop_321:
	mova	%icc,	%l0,	%o1
	wr	%g0,	0xea,	%asi
	stda	%g4,	[%l7 + 0x10] %asi
	membar	#Sync
	fzeros	%f2
	ble,a	loop_322
	ldub	[%l7 + 0x7F],	%i1
	tpos	%icc,	0x5
	for	%f18,	%f2,	%f14
loop_322:
	xor	%o4,	%l5,	%i0
	fbg	%fcc1,	loop_323
	tvc	%icc,	0x3
	fors	%f27,	%f11,	%f28
	smul	%i7,	0x0998,	%g2
loop_323:
	edge8n	%o3,	%i3,	%l3
	sra	%o0,	0x01,	%g1
	addcc	%l4,	0x1E68,	%o6
	ldsb	[%l7 + 0x25],	%g3
	movl	%icc,	%i5,	%i4
	movgu	%icc,	%o2,	%g7
	bge,pt	%icc,	loop_324
	bvc,pn	%icc,	loop_325
	mova	%xcc,	%i2,	%l6
	orcc	%o7,	0x1CB7,	%o5
loop_324:
	and	%l1,	%i6,	%g4
loop_325:
	movleu	%icc,	%l2,	%l0
	mulx	%o1,	%g5,	%g6
	stw	%o4,	[%l7 + 0x44]
	set	0x78, %i5
	lda	[%l7 + %i5] 0x81,	%f24
	fmovsne	%icc,	%f8,	%f22
	fzero	%f20
	fcmpeq16	%f22,	%f28,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu,pn	%icc,	loop_326
	tneg	%icc,	0x1
	and	%i1,	0x184C,	%i0
	fmovrdne	%g2,	%f10,	%f26
loop_326:
	nop
	set	0x52, %l5
	lduha	[%l7 + %l5] 0x15,	%o3
	be	%icc,	loop_327
	edge32	%i3,	%i7,	%l3
	movle	%xcc,	%o0,	%l4
	movl	%icc,	%o6,	%g3
loop_327:
	fcmple16	%f0,	%f30,	%g1
	set	0x10, %l3
	ldsba	[%l7 + %l3] 0x15,	%i4
	edge32l	%o2,	%i5,	%g7
	wr	%g0,	0x11,	%asi
	stxa	%l6,	[%l7 + 0x28] %asi
	fandnot2s	%f11,	%f21,	%f12
	fand	%f24,	%f28,	%f12
	fmovsle	%xcc,	%f10,	%f23
	bl,pt	%icc,	loop_328
	alignaddrl	%i2,	%o7,	%l1
	fblg	%fcc1,	loop_329
	fzeros	%f24
loop_328:
	taddcc	%i6,	0x1FE2,	%o5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] %asi,	%g4,	%l2
loop_329:
	fbge	%fcc3,	loop_330
	tl	%icc,	0x4
	std	%f28,	[%l7 + 0x38]
	edge32n	%o1,	%l0,	%g6
loop_330:
	tsubcc	%o4,	%g5,	%i1
	mova	%xcc,	%i0,	%g2
	tvc	%xcc,	0x1
	movleu	%icc,	%o3,	%i3
	smulcc	%i7,	%l5,	%o0
	brgz,a	%l3,	loop_331
	srax	%o6,	%g3,	%l4
	edge32ln	%g1,	%i4,	%i5
	ldx	[%l7 + 0x10],	%g7
loop_331:
	movl	%xcc,	%o2,	%l6
	fnot2s	%f3,	%f22
	and	%i2,	0x14B0,	%o7
	tcs	%xcc,	0x3
	sir	0x19D1
	swap	[%l7 + 0x24],	%i6
	faligndata	%f16,	%f18,	%f4
	stbar
	array32	%o5,	%l1,	%l2
	taddcc	%o1,	0x0422,	%l0
	std	%f0,	[%l7 + 0x38]
	andn	%g4,	0x1315,	%g6
	move	%icc,	%o4,	%g5
	edge8l	%i1,	%g2,	%i0
	movgu	%icc,	%o3,	%i3
	brlz	%i7,	loop_332
	mulx	%o0,	0x1D78,	%l3
	fpack16	%f10,	%f12
	movleu	%xcc,	%l5,	%o6
loop_332:
	flush	%l7 + 0x28
	edge8l	%g3,	%l4,	%g1
	fpadd16	%f28,	%f16,	%f22
	fmul8x16au	%f13,	%f10,	%f2
	fpackfix	%f8,	%f30
	ldd	[%l7 + 0x20],	%i4
	addc	%i5,	0x1234,	%o2
	taddcctv	%l6,	0x08FF,	%g7
	fmovse	%icc,	%f28,	%f31
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o7,	%i2
	umul	%i6,	%o5,	%l1
	subc	%l2,	0x18C2,	%o1
	movrlz	%g4,	0x00A,	%l0
	fmovrdlz	%o4,	%f28,	%f18
	popc	%g6,	%g5
	fcmple32	%f0,	%f30,	%i1
	mova	%icc,	%g2,	%o3
	set	0x2A, %g3
	stha	%i3,	[%l7 + %g3] 0x80
	movrlez	%i7,	0x225,	%i0
	fand	%f10,	%f28,	%f28
	edge8n	%o0,	%l5,	%l3
	bvs,a	loop_333
	popc	0x0D4C,	%g3
	set	0x18, %g2
	sta	%f11,	[%l7 + %g2] 0x14
loop_333:
	tleu	%icc,	0x3
	tcs	%xcc,	0x6
	movvc	%xcc,	%o6,	%g1
	nop
	setx	loop_334,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bvs,a	loop_335
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l4,	%i4,	%i5
loop_334:
	nop
	setx loop_336, %l0, %l1
	jmpl %l1, %o2
loop_335:
	call	loop_337
	fble,a	%fcc1,	loop_338
	andn	%g7,	0x0FFA,	%l6
loop_336:
	addc	%i2,	0x13A3,	%i6
loop_337:
	brgz	%o5,	loop_339
loop_338:
	or	%o7,	0x195B,	%l1
	fmovdle	%xcc,	%f27,	%f25
	edge16	%o1,	%l2,	%g4
loop_339:
	ble	loop_340
	mulx	%o4,	0x1D99,	%l0
	addccc	%g6,	%i1,	%g2
	movrlz	%g5,	0x137,	%i3
loop_340:
	movcs	%xcc,	%i7,	%i0
	edge8ln	%o3,	%o0,	%l5
	tsubcctv	%l3,	%g3,	%o6
	fpadd32s	%f12,	%f7,	%f23
	orcc	%l4,	%i4,	%i5
	movvc	%icc,	%o2,	%g7
	srlx	%g1,	0x12,	%i2
	fxor	%f12,	%f6,	%f20
	fmovdvs	%xcc,	%f8,	%f3
	sdivcc	%l6,	0x0081,	%i6
	fornot2s	%f21,	%f16,	%f17
	ba,pt	%xcc,	loop_341
	edge16l	%o5,	%o7,	%o1
	fmovsa	%xcc,	%f16,	%f19
	fbuge	%fcc3,	loop_342
loop_341:
	move	%xcc,	%l1,	%g4
	fabsd	%f4,	%f10
	array32	%o4,	%l0,	%g6
loop_342:
	fmovdleu	%icc,	%f7,	%f18
	faligndata	%f16,	%f0,	%f28
	tleu	%xcc,	0x5
	tpos	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l2,	%i1
	stb	%g5,	[%l7 + 0x42]
	edge8	%i3,	%g2,	%i0
	edge8n	%o3,	%i7,	%l5
	movg	%xcc,	%o0,	%l3
	xor	%g3,	%o6,	%l4
	tl	%icc,	0x1
	orcc	%i5,	0x1DB8,	%o2
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x54] %asi,	%f9
	set	0x7D, %i2
	stba	%g7,	[%l7 + %i2] 0x19
	fmovsle	%xcc,	%f12,	%f14
	andn	%i4,	%i2,	%g1
	tsubcctv	%l6,	0x0A09,	%o5
	movrgez	%i6,	%o1,	%l1
	fmovsleu	%icc,	%f24,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a,pn	%icc,	loop_343
	movg	%xcc,	%o7,	%g4
	movcc	%xcc,	%l0,	%o4
	fones	%f15
loop_343:
	stw	%l2,	[%l7 + 0x34]
	fcmpeq32	%f0,	%f12,	%i1
	fbu,a	%fcc2,	loop_344
	array8	%g6,	%g5,	%g2
	tg	%icc,	0x1
	tsubcctv	%i0,	%i3,	%o3
loop_344:
	fbug	%fcc2,	loop_345
	srlx	%l5,	0x1F,	%i7
	movvs	%xcc,	%l3,	%g3
	mulscc	%o6,	0x1F0E,	%l4
loop_345:
	ldsh	[%l7 + 0x2E],	%o0
	xnor	%i5,	%g7,	%o2
	fbu	%fcc3,	loop_346
	bpos,a,pn	%icc,	loop_347
	movgu	%xcc,	%i4,	%i2
	fmovrsne	%l6,	%f26,	%f23
loop_346:
	fbule	%fcc3,	loop_348
loop_347:
	fmul8ulx16	%f16,	%f18,	%f10
	or	%g1,	0x030F,	%o5
	sllx	%i6,	%o1,	%o7
loop_348:
	fbe	%fcc2,	loop_349
	fblg	%fcc2,	loop_350
	bcc,a,pt	%icc,	loop_351
	popc	0x13F0,	%g4
loop_349:
	fblg,a	%fcc3,	loop_352
loop_350:
	srl	%l1,	%l0,	%l2
loop_351:
	brnz	%i1,	loop_353
	bge,a,pn	%icc,	loop_354
loop_352:
	fnot2s	%f28,	%f14
	fmul8ulx16	%f20,	%f10,	%f14
loop_353:
	nop
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_354:
	bleu	%xcc,	loop_355
	orn	%g6,	%o4,	%g2
	fnot2s	%f14,	%f31
	brlz	%i0,	loop_356
loop_355:
	bvs	%xcc,	loop_357
	membar	0x3D
	addc	%g5,	%i3,	%l5
loop_356:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_357:
	fmuld8sux16	%f0,	%f14,	%f6
	fbe,a	%fcc0,	loop_358
	fmovde	%xcc,	%f14,	%f21
	bl,pn	%xcc,	loop_359
	edge32	%i7,	%l3,	%g3
loop_358:
	alignaddr	%o3,	%o6,	%o0
	tle	%icc,	0x3
loop_359:
	fba	%fcc2,	loop_360
	tg	%icc,	0x3
	sdivx	%l4,	0x161C,	%i5
	fmovsge	%icc,	%f28,	%f15
loop_360:
	xorcc	%g7,	%o2,	%i2
	fnot1	%f12,	%f28
	udivx	%l6,	0x1D8E,	%g1
	movne	%xcc,	%i4,	%i6
	fmovde	%xcc,	%f27,	%f1
	fmovrdgz	%o5,	%f10,	%f16
	fpadd16s	%f28,	%f21,	%f25
	tl	%icc,	0x7
	fmovdleu	%xcc,	%f17,	%f0
	srlx	%o1,	%o7,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x6C],	%l0
	ldub	[%l7 + 0x2D],	%l2
	array32	%g4,	%i1,	%o4
	fbge,a	%fcc0,	loop_361
	array32	%g2,	%g6,	%g5
	edge16	%i0,	%i3,	%i7
	fmovdl	%xcc,	%f16,	%f28
loop_361:
	sir	0x0FD1
	fpadd16	%f28,	%f20,	%f10
	tgu	%icc,	0x0
	edge16l	%l3,	%g3,	%o3
	fands	%f21,	%f16,	%f16
	fpmerge	%f11,	%f7,	%f4
	fxor	%f18,	%f0,	%f26
	brnz	%o6,	loop_362
	mova	%icc,	%o0,	%l4
	addccc	%l5,	0x010E,	%g7
	add	%o2,	%i2,	%i5
loop_362:
	nop
	set	0x10, %i0
	stha	%g1,	[%l7 + %i0] 0x22
	membar	#Sync
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x30] %asi,	%f8
	set	0x3C, %o4
	stha	%i4,	[%l7 + %o4] 0x0c
	fmovrsgez	%l6,	%f12,	%f6
	bvs	%icc,	loop_363
	movg	%icc,	%i6,	%o1
	lduw	[%l7 + 0x14],	%o7
	ta	%xcc,	0x5
loop_363:
	edge16n	%o5,	%l0,	%l2
	array16	%l1,	%g4,	%i1
	fbge,a	%fcc1,	loop_364
	brlez	%g2,	loop_365
	smul	%o4,	%g5,	%i0
	and	%i3,	%g6,	%l3
loop_364:
	orncc	%g3,	%o3,	%i7
loop_365:
	bneg	%xcc,	loop_366
	membar	0x57
	fbne,a	%fcc2,	loop_367
	tne	%xcc,	0x2
loop_366:
	stbar
	tne	%xcc,	0x5
loop_367:
	fcmple32	%f8,	%f16,	%o6
	movge	%icc,	%o0,	%l5
	bleu,pt	%xcc,	loop_368
	and	%g7,	0x1AC1,	%o2
	fbge,a	%fcc3,	loop_369
	tvs	%icc,	0x2
loop_368:
	fandnot2	%f30,	%f26,	%f10
	fmul8ulx16	%f28,	%f30,	%f26
loop_369:
	fmovrdgz	%l4,	%f2,	%f26
	smul	%i2,	0x150B,	%i5
	movrgez	%g1,	%i4,	%i6
	mulscc	%l6,	%o7,	%o1
	edge8l	%o5,	%l0,	%l2
	tg	%xcc,	0x5
	movrgz	%g4,	%l1,	%i1
	array32	%g2,	%g5,	%i0
	set	0x68, %o6
	swapa	[%l7 + %o6] 0x80,	%o4
	add	%g6,	0x0622,	%i3
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x48] %asi,	%f26
	tsubcctv	%l3,	0x1CC3,	%o3
	sub	%g3,	%o6,	%o0
	fnot2	%f8,	%f26
	sdivcc	%i7,	0x128F,	%g7
	edge32ln	%l5,	%o2,	%l4
	fors	%f14,	%f19,	%f29
	bleu,pn	%icc,	loop_370
	be	loop_371
	orn	%i5,	0x1DEE,	%g1
	fmovd	%f26,	%f8
loop_370:
	sll	%i2,	%i6,	%l6
loop_371:
	xnorcc	%i4,	0x00CA,	%o1
	movle	%xcc,	%o7,	%o5
	or	%l0,	0x1D14,	%g4
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x3
	fmul8x16al	%f26,	%f7,	%f6
	xor	%l2,	0x16ED,	%i1
	orn	%g5,	0x135B,	%g2
	tne	%xcc,	0x1
	fnand	%f6,	%f8,	%f8
	orn	%o4,	0x075E,	%i0
	fnot1s	%f25,	%f20
	wr	%g0,	0x22,	%asi
	stwa	%g6,	[%l7 + 0x68] %asi
	membar	#Sync
	orn	%i3,	%l3,	%o3
	andcc	%o6,	%g3,	%o0
	te	%xcc,	0x5
	movpos	%xcc,	%i7,	%l5
	set	0x1C, %l0
	swapa	[%l7 + %l0] 0x18,	%g7
	fxnors	%f25,	%f14,	%f5
	fors	%f2,	%f10,	%f1
	tsubcctv	%o2,	0x1210,	%i5
	fmovsa	%icc,	%f23,	%f7
	sth	%g1,	[%l7 + 0x68]
	tg	%icc,	0x0
	tcc	%xcc,	0x0
	edge16l	%l4,	%i2,	%i6
	fbge,a	%fcc3,	loop_372
	fmovsvc	%xcc,	%f16,	%f0
	tle	%icc,	0x1
	array8	%l6,	%o1,	%i4
loop_372:
	bcc,a	loop_373
	fbg,a	%fcc1,	loop_374
	alignaddr	%o7,	%l0,	%o5
	alignaddrl	%g4,	%l1,	%i1
loop_373:
	fmovrse	%g5,	%f11,	%f22
loop_374:
	fmovda	%xcc,	%f22,	%f9
	and	%g2,	0x1E92,	%o4
	bpos	%icc,	loop_375
	fmovsn	%xcc,	%f5,	%f12
	udiv	%l2,	0x1EE3,	%g6
	movge	%icc,	%i0,	%l3
loop_375:
	alignaddr	%o3,	%o6,	%i3
	movg	%icc,	%o0,	%i7
	fmuld8sux16	%f12,	%f5,	%f12
	fmovrsgez	%g3,	%f14,	%f10
	fandnot1s	%f22,	%f5,	%f22
	movvs	%xcc,	%l5,	%o2
	movge	%xcc,	%i5,	%g1
	edge32n	%l4,	%g7,	%i2
	tvs	%icc,	0x4
	movvs	%icc,	%l6,	%i6
	te	%xcc,	0x2
	brz	%i4,	loop_376
	movgu	%xcc,	%o1,	%l0
	edge16ln	%o5,	%o7,	%l1
	tne	%icc,	0x0
loop_376:
	fexpand	%f5,	%f30
	array32	%g4,	%i1,	%g2
	sth	%g5,	[%l7 + 0x66]
	fmovrsne	%l2,	%f17,	%f14
	movleu	%icc,	%o4,	%g6
	membar	0x3A
	fxor	%f14,	%f2,	%f24
	orn	%i0,	%l3,	%o3
	tleu	%icc,	0x3
	fnot1s	%f12,	%f29
	bpos,a,pn	%icc,	loop_377
	fmovdcs	%xcc,	%f5,	%f16
	tle	%xcc,	0x3
	ta	%xcc,	0x3
loop_377:
	movcc	%xcc,	%i3,	%o6
	ba,a,pn	%icc,	loop_378
	andncc	%o0,	%i7,	%g3
	stbar
	fmovsvc	%icc,	%f24,	%f20
loop_378:
	fbu,a	%fcc1,	loop_379
	edge8n	%o2,	%i5,	%g1
	brlz,a	%l4,	loop_380
	fone	%f30
loop_379:
	fcmpgt16	%f6,	%f12,	%l5
	bvc,pt	%xcc,	loop_381
loop_380:
	sdivx	%i2,	0x0FAC,	%l6
	wr	%g0,	0xea,	%asi
	stba	%i6,	[%l7 + 0x2A] %asi
	membar	#Sync
loop_381:
	xor	%i4,	%o1,	%g7
	fmovdneg	%icc,	%f7,	%f19
	bne	%xcc,	loop_382
	mulscc	%o5,	%o7,	%l1
	fmovdpos	%xcc,	%f14,	%f13
	fandnot2s	%f29,	%f10,	%f15
loop_382:
	movpos	%icc,	%l0,	%i1
	brlez	%g2,	loop_383
	addcc	%g5,	0x083C,	%l2
	fmovsleu	%xcc,	%f31,	%f14
	fmovdleu	%icc,	%f30,	%f20
loop_383:
	array16	%o4,	%g6,	%i0
	tvc	%icc,	0x3
	fmovda	%xcc,	%f0,	%f0
	fnegd	%f24,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l3,	0x0165,	%o3
	movvc	%xcc,	%g4,	%i3
	fsrc1s	%f17,	%f24
	alignaddrl	%o6,	%i7,	%o0
	for	%f20,	%f28,	%f14
	bl,pn	%icc,	loop_384
	udiv	%o2,	0x09AA,	%i5
	set	0x38, %o5
	stxa	%g1,	[%l7 + %o5] 0x89
loop_384:
	andcc	%g3,	0x0EF0,	%l5
	movpos	%xcc,	%i2,	%l6
	fpsub16	%f24,	%f10,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l4,	0x1B,	%i4
	sra	%o1,	%i6,	%o5
	fpmerge	%f16,	%f12,	%f16
	umul	%o7,	%g7,	%l1
	fexpand	%f7,	%f26
	mulx	%i1,	0x04EC,	%g2
	fand	%f30,	%f4,	%f4
	xor	%g5,	0x102E,	%l2
	movcs	%icc,	%o4,	%g6
	addcc	%l0,	0x0A6B,	%l3
	alignaddrl	%i0,	%o3,	%g4
	tcc	%xcc,	0x1
	move	%xcc,	%i3,	%i7
	set	0x4C, %l4
	lduwa	[%l7 + %l4] 0x88,	%o0
	sub	%o2,	%i5,	%o6
	fbo	%fcc1,	loop_385
	fpadd32	%f8,	%f12,	%f16
	smulcc	%g3,	0x0B00,	%g1
	xnor	%l5,	0x0065,	%i2
loop_385:
	edge32l	%l4,	%i4,	%o1
	taddcc	%i6,	%l6,	%o7
	mulx	%o5,	0x19C6,	%g7
	andncc	%i1,	%g2,	%l1
	lduw	[%l7 + 0x70],	%g5
	movcs	%xcc,	%l2,	%g6
	fmovrdgz	%l0,	%f22,	%f16
	mulx	%l3,	%i0,	%o3
	tn	%xcc,	0x5
	bne,pn	%icc,	loop_386
	addc	%o4,	0x1745,	%i3
	bg,a,pt	%icc,	loop_387
	tleu	%xcc,	0x0
loop_386:
	array16	%g4,	%o0,	%i7
	mova	%icc,	%o2,	%o6
loop_387:
	nop
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x74] %asi,	%g3
	fmuld8ulx16	%f21,	%f27,	%f2
	edge32n	%g1,	%l5,	%i2
	fmovdge	%icc,	%f17,	%f11
	taddcctv	%l4,	%i5,	%o1
	ldd	[%l7 + 0x18],	%i4
	orcc	%l6,	%i6,	%o5
	sdiv	%o7,	0x0829,	%i1
	fbo,a	%fcc2,	loop_388
	movvc	%icc,	%g7,	%l1
	brz	%g5,	loop_389
	fexpand	%f26,	%f26
loop_388:
	nop
	set	0x18, %o0
	prefetcha	[%l7 + %o0] 0x11,	 0x0
loop_389:
	sub	%g6,	%l0,	%l2
	fmovscs	%xcc,	%f0,	%f12
	xnorcc	%i0,	%o3,	%l3
	fmovsvc	%icc,	%f9,	%f31
	edge16l	%o4,	%g4,	%i3
	fbl,a	%fcc2,	loop_390
	sra	%i7,	%o0,	%o6
	brnz,a	%g3,	loop_391
	tcc	%xcc,	0x6
loop_390:
	srax	%o2,	0x19,	%l5
	or	%i2,	%g1,	%i5
loop_391:
	edge8l	%o1,	%i4,	%l6
	orncc	%l4,	0x09EA,	%o5
	fcmped	%fcc2,	%f16,	%f20
	tn	%icc,	0x3
	tge	%xcc,	0x7
	fandnot1s	%f16,	%f29,	%f15
	orncc	%i6,	0x0CF7,	%i1
	sdivx	%g7,	0x0B46,	%l1
	te	%xcc,	0x3
	swap	[%l7 + 0x48],	%g5
	stw	%o7,	[%l7 + 0x0C]
	udivx	%g2,	0x1D3F,	%g6
	set	0x24, %g1
	ldswa	[%l7 + %g1] 0x80,	%l2
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x10] %asi,	%i0
	subc	%l0,	%o3,	%l3
	brnz,a	%g4,	loop_392
	movrgz	%o4,	0x388,	%i7
	movvc	%icc,	%i3,	%o6
	fbue,a	%fcc3,	loop_393
loop_392:
	bneg	loop_394
	edge16	%g3,	%o2,	%l5
	movgu	%icc,	%o0,	%i2
loop_393:
	subcc	%i5,	0x0831,	%o1
loop_394:
	ld	[%l7 + 0x38],	%f14
	fbue	%fcc1,	loop_395
	sir	0x1EE9
	fnot1	%f10,	%f20
	std	%i4,	[%l7 + 0x50]
loop_395:
	mulscc	%g1,	%l4,	%l6
	pdist	%f30,	%f20,	%f14
	edge8ln	%o5,	%i1,	%i6
	set	0x70, %g4
	stda	%g6,	[%l7 + %g4] 0xea
	membar	#Sync
	tne	%icc,	0x5
	nop
	setx	loop_396,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot1s	%f11,	%f8,	%f29
	tvc	%icc,	0x3
	sub	%g5,	0x08DF,	%l1
loop_396:
	fmovrdlez	%o7,	%f12,	%f0
	movcs	%xcc,	%g2,	%g6
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x1e,	%f16
	alignaddr	%l2,	%l0,	%i0
	umul	%o3,	0x1822,	%l3
	edge8	%o4,	%i7,	%g4
	orn	%i3,	0x0E08,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o2,	0x13FA,	%g3
	set	0x6C, %g7
	ldswa	[%l7 + %g7] 0x89,	%l5
	membar	0x3D
	xnor	%o0,	0x0065,	%i5
	sir	0x1E54
	movg	%xcc,	%i2,	%o1
	fmovrsgz	%g1,	%f28,	%f30
	tge	%xcc,	0x6
	fsrc2s	%f18,	%f4
	tsubcctv	%i4,	%l4,	%l6
	xnorcc	%i1,	%o5,	%g7
	tgu	%icc,	0x7
	bpos,a,pn	%xcc,	loop_397
	array8	%g5,	%i6,	%o7
	mova	%icc,	%g2,	%g6
	tsubcc	%l2,	0x0E77,	%l0
loop_397:
	bcc	loop_398
	movg	%xcc,	%l1,	%o3
	xor	%l3,	0x0720,	%o4
	array16	%i7,	%g4,	%i0
loop_398:
	fmovrslz	%o6,	%f23,	%f23
	bn,pt	%xcc,	loop_399
	fpadd32	%f18,	%f14,	%f16
	movge	%xcc,	%i3,	%o2
	movvc	%xcc,	%l5,	%g3
loop_399:
	membar	0x4D
	bcc	loop_400
	ble,a,pn	%icc,	loop_401
	xnor	%i5,	%o0,	%o1
	umul	%i2,	%i4,	%l4
loop_400:
	move	%icc,	%g1,	%i1
loop_401:
	call	loop_402
	fbge,a	%fcc3,	loop_403
	fcmpes	%fcc3,	%f17,	%f22
	movleu	%icc,	%o5,	%l6
loop_402:
	tl	%xcc,	0x0
loop_403:
	fmovdgu	%xcc,	%f1,	%f28
	array8	%g5,	%g7,	%i6
	tcc	%icc,	0x0
	fbn,a	%fcc2,	loop_404
	flush	%l7 + 0x58
	fxors	%f21,	%f9,	%f20
	move	%icc,	%o7,	%g2
loop_404:
	tleu	%xcc,	0x1
	tg	%xcc,	0x7
	fmovsa	%xcc,	%f2,	%f3
	andcc	%g6,	%l0,	%l1
	edge16l	%l2,	%l3,	%o3
	membar	0x0F
	srax	%o4,	0x0E,	%i7
	bpos,a,pt	%xcc,	loop_405
	srax	%i0,	0x16,	%o6
	movneg	%icc,	%i3,	%g4
	tsubcctv	%o2,	0x130C,	%g3
loop_405:
	nop
	setx loop_406, %l0, %l1
	jmpl %l1, %l5
	movcs	%xcc,	%o0,	%o1
	fmovsa	%icc,	%f28,	%f28
	edge32n	%i5,	%i4,	%l4
loop_406:
	movn	%xcc,	%g1,	%i1
	movgu	%icc,	%o5,	%i2
	sra	%l6,	%g5,	%g7
	movne	%xcc,	%i6,	%g2
	mulscc	%o7,	0x0B71,	%g6
	udivx	%l0,	0x0068,	%l2
	bpos,pt	%icc,	loop_407
	bg,a,pn	%icc,	loop_408
	fzero	%f24
	orcc	%l1,	%l3,	%o4
loop_407:
	sdivcc	%i7,	0x1BF3,	%i0
loop_408:
	fmovrdgz	%o3,	%f28,	%f20
	brgez	%i3,	loop_409
	srlx	%o6,	%g4,	%g3
	fcmpgt32	%f4,	%f20,	%o2
	addccc	%o0,	%o1,	%l5
loop_409:
	mulscc	%i4,	0x01EC,	%l4
	andcc	%i5,	%g1,	%i1
	movvc	%xcc,	%o5,	%l6
	orncc	%g5,	%i2,	%g7
	movcs	%icc,	%g2,	%o7
	ldd	[%l7 + 0x38],	%g6
	fpadd16	%f22,	%f12,	%f28
	fcmpgt16	%f10,	%f22,	%l0
	tpos	%xcc,	0x5
	movrne	%l2,	%i6,	%l3
	fcmpne32	%f14,	%f10,	%l1
	movrlez	%i7,	%i0,	%o3
	tpos	%xcc,	0x7
	movn	%xcc,	%o4,	%o6
	fnors	%f5,	%f30,	%f14
	sll	%i3,	%g4,	%g3
	array8	%o2,	%o1,	%l5
	bn,pn	%xcc,	loop_410
	fands	%f21,	%f28,	%f1
	or	%i4,	%l4,	%i5
	ta	%icc,	0x1
loop_410:
	edge16n	%o0,	%i1,	%g1
	fmovdn	%xcc,	%f24,	%f23
	fbe,a	%fcc0,	loop_411
	tsubcctv	%l6,	0x1C0D,	%g5
	sir	0x0180
	bl,pn	%icc,	loop_412
loop_411:
	ta	%xcc,	0x2
	wr	%g0,	0xe3,	%asi
	stda	%i2,	[%l7 + 0x08] %asi
	membar	#Sync
loop_412:
	xnorcc	%g7,	0x03B1,	%o5
	fmul8ulx16	%f14,	%f20,	%f26
	fpsub16	%f8,	%f4,	%f8
	movcs	%icc,	%g2,	%o7
	fbn,a	%fcc1,	loop_413
	fmovdn	%xcc,	%f26,	%f14
	fmovsge	%icc,	%f4,	%f17
	sra	%l0,	%g6,	%i6
loop_413:
	fornot1	%f2,	%f22,	%f14
	tneg	%xcc,	0x2
	mulscc	%l2,	0x1965,	%l3
	srlx	%i7,	%l1,	%o3
	fbe	%fcc1,	loop_414
	tvs	%xcc,	0x1
	fnot1	%f12,	%f24
	fcmpgt32	%f18,	%f2,	%o4
loop_414:
	fmovscc	%icc,	%f28,	%f17
	fmovsgu	%icc,	%f25,	%f31
	move	%icc,	%i0,	%i3
	subc	%g4,	%g3,	%o2
	set	0x30, %i7
	ldda	[%l7 + %i7] 0x18,	%o0
	fmovdvs	%icc,	%f5,	%f2
	fmovsa	%icc,	%f25,	%f25
	srax	%o6,	0x0C,	%i4
	bl,a,pn	%xcc,	loop_415
	sdivcc	%l4,	0x18B4,	%i5
	call	loop_416
	subcc	%l5,	%i1,	%g1
loop_415:
	edge32	%l6,	%g5,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_416:
	fbule	%fcc3,	loop_417
	nop
	setx	loop_418,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array8	%i2,	%o5,	%g2
	movpos	%icc,	%o7,	%l0
loop_417:
	addccc	%g6,	0x02F5,	%g7
loop_418:
	fnands	%f14,	%f24,	%f15
	fnot1	%f2,	%f24
	tsubcc	%i6,	0x0691,	%l3
	te	%xcc,	0x1
	movl	%xcc,	%i7,	%l2
	sth	%l1,	[%l7 + 0x6C]
	ldsb	[%l7 + 0x7A],	%o4
	tvs	%icc,	0x6
	membar	0x46
	srlx	%o3,	0x08,	%i0
	add	%g4,	%i3,	%g3
	fpsub32	%f26,	%f28,	%f10
	tpos	%xcc,	0x7
	sdivx	%o2,	0x1214,	%o6
	fpack32	%f22,	%f4,	%f2
	movgu	%xcc,	%o1,	%i4
	movleu	%xcc,	%l4,	%l5
	edge16l	%i1,	%g1,	%l6
	fabsd	%f28,	%f24
	movn	%icc,	%g5,	%i5
	addc	%o0,	0x0660,	%o5
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x15
	subccc	%g2,	%o7,	%l0
	movrgez	%g6,	%i2,	%g7
	movge	%icc,	%l3,	%i7
	sllx	%l2,	%i6,	%o4
	fnot2s	%f18,	%f0
	addccc	%l1,	%o3,	%g4
	srl	%i0,	0x04,	%g3
	xnorcc	%i3,	%o6,	%o2
	tgu	%xcc,	0x3
	set	0x20, %g6
	stxa	%o1,	[%g0 + %g6] 0x4f
	edge16n	%l4,	%l5,	%i4
	fmovrdgz	%i1,	%f8,	%f2
	movleu	%icc,	%l6,	%g1
	fsrc1s	%f2,	%f13
	movre	%i5,	0x165,	%o0
	add	%g5,	%g2,	%o7
	fornot1s	%f9,	%f23,	%f0
	std	%f30,	[%l7 + 0x38]
	st	%f29,	[%l7 + 0x18]
	fnor	%f18,	%f28,	%f14
	fbg,a	%fcc1,	loop_419
	move	%xcc,	%o5,	%g6
	ldsh	[%l7 + 0x26],	%l0
	movvs	%icc,	%g7,	%i2
loop_419:
	array32	%l3,	%i7,	%i6
	bne	%icc,	loop_420
	move	%xcc,	%l2,	%o4
	ble	%xcc,	loop_421
	tgu	%xcc,	0x3
loop_420:
	fmuld8sux16	%f27,	%f1,	%f14
	membar	0x25
loop_421:
	orncc	%o3,	0x019C,	%l1
	nop
	setx loop_422, %l0, %l1
	jmpl %l1, %i0
	bge,a	loop_423
	mova	%icc,	%g3,	%i3
	fmovdvs	%xcc,	%f7,	%f23
loop_422:
	movrgez	%g4,	0x2FA,	%o6
loop_423:
	fbge,a	%fcc2,	loop_424
	bn,pt	%xcc,	loop_425
	edge16	%o1,	%l4,	%l5
	xnorcc	%i4,	0x0E9F,	%o2
loop_424:
	movre	%i1,	0x316,	%l6
loop_425:
	ldsb	[%l7 + 0x26],	%g1
	fmovda	%icc,	%f26,	%f24
	edge8n	%o0,	%g5,	%i5
	bvc	loop_426
	edge16	%o7,	%o5,	%g6
	bshuffle	%f8,	%f10,	%f6
	fnot1s	%f27,	%f5
loop_426:
	fbge	%fcc3,	loop_427
	fbn,a	%fcc3,	loop_428
	array16	%g2,	%l0,	%i2
	edge8ln	%g7,	%i7,	%l3
loop_427:
	addccc	%i6,	0x1C5B,	%o4
loop_428:
	edge32l	%l2,	%o3,	%l1
	fmuld8sux16	%f0,	%f8,	%f14
	std	%i0,	[%l7 + 0x40]
	stx	%i3,	[%l7 + 0x10]
	addcc	%g3,	0x04D1,	%g4
	edge16	%o6,	%o1,	%l5
	sir	0x1233
	edge16ln	%i4,	%o2,	%i1
	edge8l	%l6,	%l4,	%o0
	edge8l	%g5,	%g1,	%i5
	fcmps	%fcc3,	%f8,	%f27
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x330] %asi,	%o5 ripped by fixASI40.pl ripped by fixASI40.pl
	orcc	%o7,	0x0F1A,	%g2
	be,a,pt	%icc,	loop_429
	fpackfix	%f4,	%f7
	siam	0x1
	udiv	%l0,	0x11E0,	%g6
loop_429:
	fmovrslez	%i2,	%f24,	%f1
	movrne	%g7,	%i7,	%i6
	movn	%icc,	%o4,	%l2
	xnorcc	%l3,	0x0968,	%o3
	stx	%l1,	[%l7 + 0x18]
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x68] %asi,	%i0
	tneg	%icc,	0x5
	movvs	%icc,	%i3,	%g3
	bne,a,pn	%xcc,	loop_430
	fmovdne	%icc,	%f8,	%f8
	swap	[%l7 + 0x40],	%g4
	sub	%o1,	%l5,	%i4
loop_430:
	nop
	wr	%g0,	0x27,	%asi
	stwa	%o2,	[%l7 + 0x40] %asi
	membar	#Sync
	smulcc	%o6,	%i1,	%l4
	edge8n	%o0,	%g5,	%l6
	set	0x74, %o2
	lduba	[%l7 + %o2] 0x80,	%i5
	fmovdn	%xcc,	%f30,	%f1
	sll	%g1,	0x0E,	%o5
	umulcc	%g2,	%o7,	%g6
	bneg	%xcc,	loop_431
	prefetch	[%l7 + 0x6C],	 0x0
	fbug,a	%fcc3,	loop_432
	tsubcctv	%i2,	%l0,	%i7
loop_431:
	alignaddr	%g7,	%o4,	%l2
	edge32n	%l3,	%o3,	%l1
loop_432:
	fbg	%fcc1,	loop_433
	fandnot2	%f20,	%f8,	%f18
	srlx	%i0,	0x17,	%i6
	edge16l	%g3,	%g4,	%i3
loop_433:
	move	%icc,	%l5,	%o1
	udivx	%i4,	0x0106,	%o2
	orcc	%o6,	%l4,	%i1
	fornot2s	%f13,	%f28,	%f24
	srax	%o0,	%l6,	%i5
	be,a,pt	%xcc,	loop_434
	alignaddrl	%g5,	%o5,	%g2
	fmuld8sux16	%f12,	%f13,	%f0
	fxors	%f31,	%f2,	%f6
loop_434:
	or	%g1,	%o7,	%g6
	tsubcctv	%i2,	%l0,	%i7
	fmovrdlz	%g7,	%f0,	%f0
	set	0x31, %l1
	stba	%l2,	[%l7 + %l1] 0x22
	membar	#Sync
	fmovda	%icc,	%f5,	%f12
	edge32n	%o4,	%o3,	%l3
	movle	%icc,	%l1,	%i6
	xor	%i0,	0x1932,	%g4
	ldd	[%l7 + 0x68],	%f22
	movg	%icc,	%g3,	%i3
	edge32ln	%o1,	%i4,	%l5
	edge16l	%o6,	%o2,	%i1
	fbg	%fcc1,	loop_435
	fbue,a	%fcc1,	loop_436
	ldstub	[%l7 + 0x6C],	%l4
	fbge,a	%fcc1,	loop_437
loop_435:
	fbug,a	%fcc1,	loop_438
loop_436:
	tneg	%xcc,	0x5
	fbul	%fcc1,	loop_439
loop_437:
	addccc	%o0,	0x123D,	%l6
loop_438:
	fxors	%f5,	%f25,	%f5
	addc	%i5,	%g5,	%o5
loop_439:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x2B] %asi,	%g1
	alignaddrl	%o7,	%g6,	%i2
	edge8l	%g2,	%l0,	%g7
	movrgz	%i7,	%l2,	%o3
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x7B] %asi,	%o4
	smul	%l1,	0x050D,	%i6
	fbul	%fcc1,	loop_440
	stbar
	fmovsn	%xcc,	%f9,	%f30
	fpadd32s	%f8,	%f4,	%f20
loop_440:
	array8	%l3,	%i0,	%g4
	movrgez	%g3,	0x21C,	%o1
	fcmple16	%f30,	%f14,	%i3
	brnz,a	%i4,	loop_441
	fpack16	%f6,	%f16
	ldub	[%l7 + 0x55],	%o6
	sub	%l5,	0x1B4F,	%o2
loop_441:
	movleu	%xcc,	%i1,	%l4
	smul	%o0,	%l6,	%i5
	tn	%xcc,	0x7
	movleu	%xcc,	%o5,	%g1
	movrgz	%o7,	%g5,	%i2
	fmovs	%f0,	%f24
	subccc	%g2,	0x0D62,	%g6
	membar	0x64
	edge16n	%g7,	%i7,	%l2
	bleu,pt	%icc,	loop_442
	movcc	%icc,	%l0,	%o3
	fmovrdlez	%l1,	%f16,	%f0
	tge	%xcc,	0x0
loop_442:
	fmovrde	%o4,	%f30,	%f26
	xor	%l3,	%i0,	%g4
	tl	%icc,	0x7
	mova	%icc,	%i6,	%o1
	tgu	%xcc,	0x3
	tneg	%icc,	0x3
	fors	%f29,	%f16,	%f15
	fpack16	%f14,	%f15
	ld	[%l7 + 0x38],	%f25
	udivx	%i3,	0x0E80,	%g3
	tvc	%xcc,	0x2
	edge8ln	%i4,	%l5,	%o6
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x20] %asi,	%o2
	andcc	%i1,	0x0C8B,	%l4
	taddcc	%l6,	0x1C79,	%i5
	fmovde	%xcc,	%f14,	%f21
	mova	%xcc,	%o5,	%g1
	andncc	%o7,	%o0,	%i2
	movvc	%xcc,	%g5,	%g6
	edge16n	%g7,	%g2,	%l2
	be,pt	%xcc,	loop_443
	fcmpne32	%f4,	%f0,	%l0
	srl	%i7,	%o3,	%l1
	fones	%f28
loop_443:
	sethi	0x06F5,	%o4
	and	%i0,	%l3,	%g4
	set	0x64, %l6
	ldsba	[%l7 + %l6] 0x80,	%o1
	fcmped	%fcc3,	%f30,	%f28
	te	%xcc,	0x3
	fnot1	%f30,	%f2
	fbne,a	%fcc1,	loop_444
	fbe,a	%fcc1,	loop_445
	fmovse	%xcc,	%f6,	%f24
	fpsub16	%f18,	%f6,	%f14
loop_444:
	fxors	%f12,	%f25,	%f16
loop_445:
	taddcc	%i6,	0x1C39,	%i3
	tleu	%icc,	0x2
	ldub	[%l7 + 0x49],	%i4
	fmovrdgez	%g3,	%f30,	%f18
	fornot2s	%f0,	%f27,	%f20
	edge16ln	%o6,	%l5,	%o2
	andn	%i1,	0x082F,	%l4
	xor	%i5,	0x0DE1,	%l6
	movne	%icc,	%g1,	%o7
	alignaddrl	%o0,	%i2,	%o5
	movrlz	%g6,	0x060,	%g7
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	fbue,a	%fcc2,	loop_446
	fbl,a	%fcc0,	loop_447
	subccc	%g2,	%l2,	%l0
	tsubcctv	%o3,	%i7,	%o4
loop_446:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x30] %asi,	%f23
loop_447:
	smul	%i0,	0x199C,	%l1
	umul	%g4,	0x1DD6,	%o1
	udivx	%i6,	0x1266,	%l3
	movne	%xcc,	%i4,	%i3
	ba,a	%icc,	loop_448
	tvs	%icc,	0x3
	alignaddrl	%g3,	%l5,	%o6
	fble,a	%fcc3,	loop_449
loop_448:
	movgu	%icc,	%i1,	%l4
	orcc	%o2,	%l6,	%g1
	sdivcc	%o7,	0x1344,	%o0
loop_449:
	edge8l	%i5,	%i2,	%o5
	fpsub16s	%f28,	%f20,	%f16
	bne	loop_450
	udivcc	%g6,	0x16DC,	%g7
	array32	%g2,	%l2,	%l0
	stb	%o3,	[%l7 + 0x6F]
loop_450:
	movg	%xcc,	%i7,	%o4
	fnot2	%f16,	%f6
	movrlez	%g5,	%i0,	%g4
	fsrc2s	%f2,	%f31
	fble	%fcc2,	loop_451
	bcs,a,pt	%xcc,	loop_452
	edge32l	%o1,	%i6,	%l3
	orcc	%i4,	%i3,	%l1
loop_451:
	orn	%l5,	%g3,	%o6
loop_452:
	srl	%i1,	%l4,	%l6
	subc	%o2,	0x0374,	%g1
	edge8n	%o7,	%i5,	%i2
	movl	%xcc,	%o5,	%g6
	movcs	%icc,	%g7,	%o0
	fones	%f27
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	brgz	%l2,	loop_453
	lduh	[%l7 + 0x3C],	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_453:
	fmovs	%f1,	%f25
	tle	%xcc,	0x6
	fpsub16	%f26,	%f12,	%f16
	fmuld8sux16	%f11,	%f0,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o3,	%g2,	%i7
	sllx	%g5,	0x13,	%o4
	tl	%xcc,	0x4
	edge16n	%g4,	%i0,	%o1
	movre	%l3,	%i4,	%i6
	movle	%xcc,	%i3,	%l5
	bg	%xcc,	loop_454
	edge16	%l1,	%g3,	%i1
	lduh	[%l7 + 0x64],	%l4
	movneg	%icc,	%o6,	%o2
loop_454:
	mulx	%l6,	0x1A2B,	%g1
	alignaddr	%o7,	%i5,	%o5
	ldsw	[%l7 + 0x18],	%g6
	add	%i2,	0x0D41,	%o0
	udivx	%g7,	0x1F70,	%l0
	array16	%o3,	%g2,	%l2
	brz,a	%g5,	loop_455
	orncc	%o4,	0x12D4,	%i7
	fmovsle	%icc,	%f27,	%f18
	addcc	%i0,	0x0BC6,	%o1
loop_455:
	call	loop_456
	tle	%icc,	0x3
	st	%f22,	[%l7 + 0x0C]
	taddcctv	%l3,	%i4,	%i6
loop_456:
	tneg	%icc,	0x4
	andn	%g4,	%i3,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%xcc,	%f2,	%f2
	fmovsa	%xcc,	%f9,	%f14
	bgu	%icc,	loop_457
	bvc	loop_458
	fmovsg	%icc,	%f2,	%f14
	nop
	setx	loop_459,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_457:
	fmovdne	%xcc,	%f2,	%f16
loop_458:
	fbue,a	%fcc3,	loop_460
	sir	0x1E04
loop_459:
	edge8ln	%l5,	%g3,	%i1
	tpos	%icc,	0x0
loop_460:
	fmovrdgz	%l4,	%f8,	%f6
	set	0x08, %o1
	lda	[%l7 + %o1] 0x89,	%f0
	wr	%g0,	0xea,	%asi
	stha	%o6,	[%l7 + 0x1C] %asi
	membar	#Sync
	sdivx	%l6,	0x10E8,	%g1
	tcs	%xcc,	0x3
	edge16n	%o7,	%o2,	%i5
	ta	%icc,	0x3
	array32	%o5,	%g6,	%o0
	udivx	%g7,	0x10C8,	%i2
	std	%l0,	[%l7 + 0x10]
	brgez	%g2,	loop_461
	edge16ln	%o3,	%l2,	%o4
	fmovsge	%xcc,	%f26,	%f23
	fandnot1	%f6,	%f28,	%f0
loop_461:
	fxor	%f20,	%f20,	%f8
	movvc	%icc,	%g5,	%i7
	fmovscc	%xcc,	%f23,	%f22
	bvc,a,pn	%xcc,	loop_462
	movg	%icc,	%o1,	%i0
	tsubcc	%l3,	%i6,	%g4
	edge16n	%i4,	%l1,	%i3
loop_462:
	nop
	set	0x16, %i3
	ldsba	[%l7 + %i3] 0x18,	%g3
	fmovdgu	%xcc,	%f18,	%f27
	ba,pt	%xcc,	loop_463
	addccc	%l5,	%i1,	%l4
	prefetch	[%l7 + 0x44],	 0x3
	umul	%l6,	%o6,	%g1
loop_463:
	fmuld8sux16	%f10,	%f5,	%f14
	xor	%o2,	%o7,	%i5
	movrlez	%o5,	0x0B4,	%o0
	movrlez	%g7,	%g6,	%l0
	bvc,pn	%xcc,	loop_464
	edge8n	%g2,	%o3,	%l2
	bg	%xcc,	loop_465
	fmovde	%icc,	%f28,	%f2
loop_464:
	movgu	%icc,	%i2,	%o4
	fone	%f20
loop_465:
	brnz,a	%g5,	loop_466
	movneg	%icc,	%o1,	%i7
	nop
	set	0x30, %g5
	std	%l2,	[%l7 + %g5]
	or	%i0,	0x0A23,	%g4
loop_466:
	sth	%i4,	[%l7 + 0x48]
	subccc	%i6,	%i3,	%g3
	movre	%l1,	0x230,	%l5
	taddcc	%i1,	0x0F29,	%l4
	fmovsg	%xcc,	%f13,	%f16
	xorcc	%l6,	%g1,	%o6
	movvc	%icc,	%o7,	%o2
	sdiv	%i5,	0x1594,	%o5
	taddcc	%g7,	%o0,	%l0
	movrgez	%g2,	%o3,	%g6
	movvs	%xcc,	%i2,	%l2
	movg	%icc,	%o4,	%g5
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	brz,a	%o1,	loop_467
	movrne	%l3,	0x387,	%i0
	add	%i7,	%i4,	%i6
	wr	%g0,	0x81,	%asi
	sta	%f16,	[%l7 + 0x08] %asi
loop_467:
	fcmpeq32	%f10,	%f26,	%i3
	movn	%xcc,	%g4,	%g3
	sethi	0x15CD,	%l1
	pdist	%f26,	%f16,	%f24
	alignaddrl	%i1,	%l4,	%l6
	tvs	%xcc,	0x6
	tvc	%xcc,	0x1
	srl	%l5,	%o6,	%o7
	edge8l	%g1,	%o2,	%o5
	array32	%g7,	%o0,	%i5
	andn	%g2,	%o3,	%l0
	lduh	[%l7 + 0x74],	%i2
	te	%xcc,	0x3
	fornot1	%f4,	%f6,	%f28
	and	%l2,	%o4,	%g5
	movcc	%icc,	%o1,	%g6
	fbule	%fcc2,	loop_468
	fmul8ulx16	%f20,	%f0,	%f12
	fba,a	%fcc3,	loop_469
	swap	[%l7 + 0x60],	%i0
loop_468:
	fnors	%f6,	%f29,	%f19
	sdivcc	%i7,	0x01D0,	%l3
loop_469:
	stbar
	bshuffle	%f20,	%f20,	%f26
	set	0x42, %i1
	lduha	[%l7 + %i1] 0x10,	%i6
	edge8ln	%i4,	%i3,	%g3
	movle	%icc,	%g4,	%l1
	umulcc	%i1,	0x1D5E,	%l4
	orn	%l5,	%l6,	%o7
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fnot2	%f8,	%f0
	alignaddrl	%g1,	%o2,	%o6
	tl	%icc,	0x1
	set	0x51, %i6
	ldsba	[%l7 + %i6] 0x10,	%g7
	fba,a	%fcc2,	loop_470
	movcc	%xcc,	%o5,	%i5
	subcc	%g2,	0x10BE,	%o0
	fmovrsgez	%o3,	%f13,	%f23
loop_470:
	fmovsgu	%xcc,	%f24,	%f4
	fbuge	%fcc0,	loop_471
	xorcc	%i2,	0x1C00,	%l2
	edge8l	%o4,	%g5,	%o1
	tcc	%xcc,	0x4
loop_471:
	array16	%g6,	%l0,	%i7
	bg	loop_472
	sdiv	%i0,	0x1557,	%l3
	movcs	%xcc,	%i4,	%i3
	and	%g3,	%g4,	%i6
loop_472:
	fandnot1	%f14,	%f24,	%f28
	edge16	%l1,	%l4,	%i1
	andn	%l6,	0x0432,	%l5
	brlz,a	%g1,	loop_473
	fmul8x16al	%f17,	%f23,	%f10
	set	0x44, %o7
	ldsha	[%l7 + %o7] 0x19,	%o7
loop_473:
	fabss	%f31,	%f26
	tn	%xcc,	0x3
	udivx	%o2,	0x1075,	%g7
	fzeros	%f21
	fnand	%f8,	%f16,	%f2
	array32	%o5,	%o6,	%g2
	mulx	%o0,	0x00CA,	%o3
	fmovdge	%xcc,	%f2,	%f22
	bge	%icc,	loop_474
	tcc	%icc,	0x0
	addc	%i2,	%l2,	%i5
	sethi	0x1D02,	%g5
loop_474:
	add	%o1,	%o4,	%l0
	fone	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x10, %i5
	ldswa	[%l7 + %i5] 0x80,	%i7
	orn	%g6,	0x189F,	%l3
	fmuld8ulx16	%f24,	%f2,	%f10
	fandnot2	%f26,	%f10,	%f28
	move	%xcc,	%i0,	%i3
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x60] %asi,	%g2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g4,	%i6
	udivcc	%l1,	0x1DC4,	%i4
	ba,pn	%icc,	loop_475
	edge16	%l4,	%i1,	%l6
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_475:
	bgu,pt	%icc,	loop_476
	orcc	%g1,	0x02C1,	%o7
	sth	%l5,	[%l7 + 0x58]
	alignaddr	%g7,	%o2,	%o5
loop_476:
	fbul,a	%fcc0,	loop_477
	fbug	%fcc2,	loop_478
	andcc	%g2,	%o6,	%o0
	andn	%i2,	%l2,	%i5
loop_477:
	tneg	%icc,	0x1
loop_478:
	movrlez	%g5,	%o3,	%o4
	fbul,a	%fcc2,	loop_479
	fmovsne	%icc,	%f21,	%f13
	movle	%xcc,	%l0,	%o1
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x1f,	%f0
loop_479:
	fmul8x16al	%f18,	%f1,	%f4
	movg	%icc,	%i7,	%g6
	tle	%xcc,	0x7
	brz	%i0,	loop_480
	bge,pn	%xcc,	loop_481
	orncc	%i3,	%l3,	%g3
	fmovdvs	%xcc,	%f12,	%f27
loop_480:
	sdiv	%g4,	0x1100,	%l1
loop_481:
	movg	%xcc,	%i6,	%i4
	movg	%icc,	%l4,	%i1
	fsrc2	%f14,	%f24
	edge8	%g1,	%l6,	%o7
	fand	%f24,	%f14,	%f8
	be,a,pn	%icc,	loop_482
	fmovdne	%xcc,	%f23,	%f26
	sub	%l5,	%g7,	%o5
	fpsub16	%f22,	%f10,	%f22
loop_482:
	andncc	%g2,	%o6,	%o2
	andncc	%o0,	%l2,	%i5
	alignaddr	%g5,	%i2,	%o3
	andn	%l0,	0x0974,	%o1
	fbne,a	%fcc2,	loop_483
	umul	%o4,	%i7,	%g6
	std	%i0,	[%l7 + 0x68]
	movl	%icc,	%l3,	%i3
loop_483:
	mova	%xcc,	%g3,	%g4
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
	umul	%i4,	%l4,	%l1
	sra	%g1,	%i1,	%l6
	xnor	%o7,	%l5,	%o5
	fone	%f8
	andn	%g7,	0x0A59,	%o6
	set	0x110, %l3
	ldxa	[%g0 + %l3] 0x52,	%g2
	sethi	0x0E76,	%o0
	srl	%o2,	%i5,	%g5
	orn	%l2,	%o3,	%i2
	tsubcctv	%l0,	%o4,	%i7
	ble,a,pt	%icc,	loop_484
	fbe,a	%fcc0,	loop_485
	fbe,a	%fcc3,	loop_486
	edge32n	%o1,	%i0,	%l3
loop_484:
	fmovscs	%icc,	%f14,	%f1
loop_485:
	array32	%i3,	%g6,	%g4
loop_486:
	sir	0x0687
	be,pt	%xcc,	loop_487
	subccc	%i6,	%i4,	%l4
	movrlz	%l1,	%g3,	%i1
	edge8	%l6,	%o7,	%l5
loop_487:
	fornot2s	%f6,	%f4,	%f14
	movg	%icc,	%o5,	%g1
	smulcc	%o6,	%g7,	%g2
	edge16n	%o2,	%o0,	%g5
	andncc	%i5,	%l2,	%o3
	alignaddr	%i2,	%l0,	%i7
	orn	%o4,	%o1,	%l3
	sub	%i3,	%g6,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i0,	0x11,	%i4
	addc	%l4,	0x041C,	%i6
	umul	%l1,	0x011F,	%i1
	alignaddrl	%g3,	%l6,	%l5
	tcc	%xcc,	0x2
	nop
	set	0x13, %g3
	ldstub	[%l7 + %g3],	%o5
	movleu	%icc,	%g1,	%o6
	movrgez	%g7,	0x346,	%g2
	taddcc	%o2,	0x1F48,	%o0
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x26] %asi,	%g5
	fcmps	%fcc1,	%f29,	%f7
	ldd	[%l7 + 0x68],	%o6
	xorcc	%l2,	%o3,	%i5
	ba,a,pn	%xcc,	loop_488
	tsubcctv	%l0,	%i7,	%i2
	udivx	%o4,	0x0973,	%o1
	bne,a	%icc,	loop_489
loop_488:
	bneg,a,pn	%xcc,	loop_490
	tneg	%icc,	0x4
	brgez	%i3,	loop_491
loop_489:
	edge8ln	%l3,	%g6,	%i0
loop_490:
	array16	%g4,	%l4,	%i6
	edge16	%i4,	%l1,	%i1
loop_491:
	mulx	%g3,	0x1D4F,	%l6
	movle	%icc,	%l5,	%g1
	movre	%o5,	%o6,	%g7
	tcs	%icc,	0x4
	subcc	%g2,	%o2,	%o0
	fmovsneg	%xcc,	%f13,	%f22
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x88,	%f16
	fba	%fcc3,	loop_492
	bneg	%xcc,	loop_493
	andcc	%g5,	0x1A11,	%l2
	movn	%xcc,	%o3,	%i5
loop_492:
	nop
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x59] %asi,	%l0
loop_493:
	nop
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x0c,	%i7,	%i2
	srl	%o4,	%o7,	%i3
	popc	%o1,	%l3
	movpos	%xcc,	%g6,	%i0
	ta	%icc,	0x1
	movneg	%icc,	%l4,	%g4
	fmuld8sux16	%f8,	%f21,	%f16
	fcmple32	%f10,	%f6,	%i4
	umul	%i6,	0x0559,	%i1
	addc	%l1,	%l6,	%g3
	fcmpgt32	%f14,	%f12,	%l5
	fpsub32	%f28,	%f24,	%f14
	orn	%o5,	0x0A87,	%o6
	te	%icc,	0x6
	fbue,a	%fcc3,	loop_494
	taddcctv	%g1,	%g7,	%o2
	mulx	%o0,	%g5,	%l2
	add	%g2,	0x1B84,	%o3
loop_494:
	alignaddr	%i5,	%i7,	%i2
	add	%o4,	0x1A68,	%o7
	siam	0x1
	fpadd32	%f28,	%f20,	%f18
	fcmped	%fcc1,	%f10,	%f16
	fornot2s	%f5,	%f2,	%f19
	taddcctv	%i3,	0x0132,	%l0
	fbl	%fcc1,	loop_495
	taddcc	%o1,	%g6,	%i0
	ble,pt	%xcc,	loop_496
	ldd	[%l7 + 0x18],	%l2
loop_495:
	brlez	%g4,	loop_497
	tsubcctv	%l4,	0x1E1F,	%i6
loop_496:
	edge8l	%i1,	%i4,	%l6
	tcs	%icc,	0x5
loop_497:
	movcc	%icc,	%l1,	%g3
	fmovdcc	%icc,	%f24,	%f15
	tn	%icc,	0x3
	array32	%l5,	%o6,	%g1
	flush	%l7 + 0x58
	fpadd16	%f18,	%f26,	%f14
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x14] %asi,	%o5
	tcc	%icc,	0x4
	srax	%o2,	0x09,	%o0
	fcmpeq16	%f10,	%f16,	%g5
	edge8n	%l2,	%g2,	%o3
	edge32l	%i5,	%g7,	%i7
	fmovrsgez	%i2,	%f22,	%f23
	fcmpgt16	%f30,	%f6,	%o4
	orcc	%o7,	0x05B0,	%i3
	fcmps	%fcc0,	%f28,	%f28
	stx	%l0,	[%l7 + 0x40]
	smul	%g6,	0x198E,	%i0
	movneg	%xcc,	%l3,	%g4
	movcc	%xcc,	%o1,	%i6
	wr	%g0,	0x04,	%asi
	stba	%l4,	[%l7 + 0x0D] %asi
	ldstub	[%l7 + 0x77],	%i1
	movpos	%icc,	%l6,	%i4
	fbl,a	%fcc2,	loop_498
	subccc	%g3,	0x0827,	%l5
	stb	%o6,	[%l7 + 0x0E]
	fnot1s	%f24,	%f9
loop_498:
	fmovrslz	%g1,	%f1,	%f23
	brlez	%l1,	loop_499
	tvc	%icc,	0x3
	smul	%o2,	0x1ABA,	%o5
	tsubcctv	%g5,	0x16C9,	%o0
loop_499:
	tsubcc	%g2,	%o3,	%l2
	movrne	%i5,	0x23C,	%g7
	bshuffle	%f0,	%f14,	%f8
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x40] %asi,	%i7
	fxor	%f20,	%f10,	%f26
	movl	%icc,	%i2,	%o7
	fbge,a	%fcc1,	loop_500
	stx	%o4,	[%l7 + 0x58]
	fexpand	%f26,	%f0
	fpmerge	%f16,	%f29,	%f28
loop_500:
	movle	%xcc,	%i3,	%g6
	flush	%l7 + 0x14
	fcmpne32	%f16,	%f20,	%l0
	alignaddr	%l3,	%i0,	%g4
	movrlz	%o1,	0x230,	%i6
	movl	%icc,	%i1,	%l6
	te	%icc,	0x6
	fmul8x16au	%f9,	%f30,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l4,	%i4,	%g3
	taddcc	%l5,	%o6,	%l1
	fmovrdne	%g1,	%f20,	%f10
	fandnot2	%f22,	%f14,	%f8
	movne	%icc,	%o2,	%o5
	tcc	%xcc,	0x3
	brgz	%o0,	loop_501
	array32	%g5,	%o3,	%g2
	fbue	%fcc2,	loop_502
	movneg	%xcc,	%l2,	%i5
loop_501:
	sir	0x0BE8
	or	%g7,	0x1C53,	%i2
loop_502:
	membar	0x5F
	sllx	%o7,	0x18,	%i7
	wr	%g0,	0x89,	%asi
	stda	%o4,	[%l7 + 0x30] %asi
	fmovdne	%xcc,	%f21,	%f29
	flush	%l7 + 0x1C
	fmovsleu	%xcc,	%f0,	%f11
	fandnot1s	%f20,	%f15,	%f11
	xnor	%i3,	%l0,	%l3
	tg	%icc,	0x3
	tvs	%icc,	0x1
	movl	%xcc,	%i0,	%g4
	fblg,a	%fcc0,	loop_503
	fbl	%fcc2,	loop_504
	fnegs	%f16,	%f24
	fcmpgt32	%f26,	%f28,	%o1
loop_503:
	tle	%icc,	0x5
loop_504:
	smul	%g6,	%i1,	%l6
	orcc	%i6,	%l4,	%g3
	srl	%i4,	%o6,	%l5
	fpadd32	%f4,	%f24,	%f2
	edge16ln	%g1,	%o2,	%l1
	movvc	%icc,	%o5,	%g5
	ldsw	[%l7 + 0x5C],	%o3
	fmovdg	%icc,	%f25,	%f12
	movre	%g2,	%o0,	%l2
	sll	%g7,	0x09,	%i5
	fabss	%f18,	%f24
	bvc,a	loop_505
	movre	%o7,	0x28E,	%i7
	edge32n	%i2,	%o4,	%i3
	sll	%l0,	0x1D,	%i0
loop_505:
	ldstub	[%l7 + 0x7D],	%l3
	lduw	[%l7 + 0x28],	%o1
	fones	%f22
	movrlz	%g6,	%g4,	%l6
	movcc	%xcc,	%i6,	%l4
	fmovsvs	%icc,	%f26,	%f10
	orcc	%g3,	0x0EFE,	%i1
	tpos	%xcc,	0x6
	ble,a,pn	%xcc,	loop_506
	movgu	%xcc,	%i4,	%o6
	orn	%g1,	%o2,	%l5
	fpmerge	%f7,	%f9,	%f26
loop_506:
	bleu,a,pt	%icc,	loop_507
	fone	%f30
	fbug	%fcc0,	loop_508
	bne,a	%xcc,	loop_509
loop_507:
	edge8n	%o5,	%l1,	%o3
	fmovscs	%icc,	%f31,	%f26
loop_508:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%g2,	%o0
loop_509:
	fpsub16s	%f4,	%f31,	%f0
	fmovdcc	%icc,	%f12,	%f4
	fmovrslz	%g5,	%f14,	%f28
	edge16	%g7,	%i5,	%l2
	fbn,a	%fcc2,	loop_510
	addcc	%o7,	0x144D,	%i7
	set	0x40, %l5
	stwa	%o4,	[%l7 + %l5] 0x10
loop_510:
	sll	%i3,	%i2,	%i0
	tvc	%xcc,	0x5
	fmovrdlz	%l0,	%f18,	%f12
	srl	%o1,	0x0D,	%g6
	ble,pn	%xcc,	loop_511
	fmovdne	%icc,	%f27,	%f24
	umulcc	%l3,	%l6,	%g4
	fnot2	%f4,	%f20
loop_511:
	nop
	set	0x48, %i0
	stha	%l4,	[%l7 + %i0] 0x15
	fmul8ulx16	%f18,	%f24,	%f22
	movrgz	%i6,	0x23C,	%i1
	xnor	%i4,	0x1C60,	%o6
	fmovsn	%xcc,	%f12,	%f8
	umul	%g1,	0x1431,	%o2
	fbug	%fcc1,	loop_512
	tgu	%icc,	0x6
	tsubcctv	%l5,	0x0A79,	%o5
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%g3
loop_512:
	fpsub16s	%f7,	%f19,	%f17
	sir	0x1577
	fmovsvs	%xcc,	%f20,	%f22
	fmovdvs	%icc,	%f10,	%f23
	udivcc	%l1,	0x0363,	%o3
	bg,a	%xcc,	loop_513
	addccc	%o0,	%g2,	%g5
	srlx	%g7,	0x0A,	%l2
	xor	%i5,	0x0472,	%o7
loop_513:
	fzeros	%f12
	fmovdneg	%icc,	%f13,	%f18
	fnot2s	%f5,	%f17
	brlez,a	%o4,	loop_514
	movvs	%icc,	%i3,	%i2
	bgu,pt	%xcc,	loop_515
	tne	%icc,	0x5
loop_514:
	ble,pn	%xcc,	loop_516
	fmovdpos	%xcc,	%f22,	%f9
loop_515:
	fpsub16s	%f5,	%f4,	%f28
	bg,a,pt	%xcc,	loop_517
loop_516:
	movvs	%xcc,	%i7,	%l0
	fxor	%f26,	%f4,	%f6
	tpos	%xcc,	0x4
loop_517:
	nop
	wr	%g0,	0x89,	%asi
	stha	%i0,	[%l7 + 0x60] %asi
	edge16l	%g6,	%l3,	%l6
	brgez,a	%g4,	loop_518
	fbu,a	%fcc1,	loop_519
	orcc	%l4,	0x00A7,	%i6
	movrgz	%o1,	0x2AF,	%i4
loop_518:
	membar	0x34
loop_519:
	tvc	%xcc,	0x4
	fbu	%fcc0,	loop_520
	tle	%xcc,	0x3
	edge8	%i1,	%o6,	%g1
	addcc	%l5,	%o5,	%g3
loop_520:
	fmovsgu	%icc,	%f7,	%f21
	movvs	%xcc,	%l1,	%o3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%o2,	%o0
	bl	%xcc,	loop_521
	bvs	loop_522
	sll	%g5,	0x0D,	%g2
	sll	%g7,	0x08,	%i5
loop_521:
	movrgez	%l2,	0x3C1,	%o7
loop_522:
	movl	%icc,	%o4,	%i2
	umulcc	%i3,	%l0,	%i7
	movrgez	%i0,	0x095,	%g6
	tg	%icc,	0x3
	wr	%g0,	0x88,	%asi
	stba	%l6,	[%l7 + 0x4D] %asi
	movpos	%xcc,	%g4,	%l4
	fmovsneg	%xcc,	%f15,	%f15
	fmovrdgz	%i6,	%f26,	%f18
	mova	%icc,	%l3,	%o1
	srax	%i4,	%o6,	%i1
	tle	%icc,	0x5
	movgu	%xcc,	%l5,	%o5
	sub	%g1,	0x1869,	%l1
	ta	%xcc,	0x3
	pdist	%f4,	%f10,	%f14
	sir	0x1402
	fbue,a	%fcc1,	loop_523
	tge	%icc,	0x4
	tle	%xcc,	0x3
	fands	%f7,	%f26,	%f16
loop_523:
	ldsh	[%l7 + 0x72],	%g3
	andn	%o2,	%o3,	%o0
	xorcc	%g5,	0x0E0D,	%g7
	stw	%g2,	[%l7 + 0x5C]
	sllx	%l2,	0x1B,	%o7
	movvc	%xcc,	%i5,	%i2
	tvc	%icc,	0x3
	andncc	%o4,	%i3,	%l0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x11,	%i7,	%i0
	bge,a	loop_524
	andcc	%g6,	0x00FB,	%l6
	prefetch	[%l7 + 0x40],	 0x1
	stw	%g4,	[%l7 + 0x74]
loop_524:
	srax	%l4,	0x07,	%l3
	nop
	setx	loop_525,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcc	%xcc,	0x0
	std	%f22,	[%l7 + 0x28]
	bvs,a	%xcc,	loop_526
loop_525:
	mulscc	%i6,	0x1DC5,	%i4
	movneg	%xcc,	%o6,	%o1
	movle	%icc,	%l5,	%o5
loop_526:
	udivx	%i1,	0x17B3,	%l1
	umulcc	%g3,	0x1EA2,	%o2
	swap	[%l7 + 0x3C],	%o3
	andncc	%g1,	%o0,	%g7
	tvc	%xcc,	0x6
	fmovdn	%xcc,	%f12,	%f6
	set	0x64, %i2
	lduwa	[%l7 + %i2] 0x0c,	%g5
	edge16ln	%g2,	%o7,	%l2
	sdivcc	%i5,	0x1FFC,	%i2
	fmovrse	%i3,	%f22,	%f5
	tsubcctv	%l0,	%i7,	%i0
	fone	%f28
	orn	%o4,	0x14C0,	%g6
	sdivx	%g4,	0x0676,	%l4
	sethi	0x17DF,	%l3
	bge	loop_527
	movl	%icc,	%i6,	%i4
	nop
	setx	loop_528,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovs	%f26,	%f3
loop_527:
	ldd	[%l7 + 0x50],	%i6
	taddcctv	%o6,	%o1,	%l5
loop_528:
	umul	%o5,	%i1,	%g3
	fnot2s	%f23,	%f6
	ldsh	[%l7 + 0x4C],	%o2
	bge,a	loop_529
	fnegs	%f25,	%f22
	fcmpes	%fcc0,	%f28,	%f29
	movgu	%icc,	%l1,	%o3
loop_529:
	fcmpd	%fcc1,	%f6,	%f4
	siam	0x7
	fmovdvc	%xcc,	%f17,	%f0
	tsubcc	%g1,	0x0080,	%o0
	stb	%g5,	[%l7 + 0x68]
	fmovsgu	%xcc,	%f15,	%f7
	ld	[%l7 + 0x1C],	%f22
	brgz,a	%g7,	loop_530
	edge16ln	%g2,	%o7,	%i5
	fbu	%fcc1,	loop_531
	bn,pn	%xcc,	loop_532
loop_530:
	edge8l	%l2,	%i3,	%l0
	srl	%i2,	0x19,	%i0
loop_531:
	edge32n	%i7,	%g6,	%o4
loop_532:
	subcc	%g4,	0x0F36,	%l3
	set	0x08, %o6
	stda	%i6,	[%l7 + %o6] 0x15
	srl	%l4,	%l6,	%i4
	edge8n	%o1,	%o6,	%l5
	ldub	[%l7 + 0x69],	%i1
	fmovsneg	%icc,	%f18,	%f8
	fornot1s	%f31,	%f9,	%f31
	bn,pn	%xcc,	loop_533
	umul	%o5,	%o2,	%l1
	sethi	0x1B09,	%g3
	movneg	%icc,	%g1,	%o0
loop_533:
	tg	%icc,	0x1
	fpack16	%f14,	%f14
	fbul,a	%fcc0,	loop_534
	taddcctv	%o3,	0x195F,	%g7
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x44] %asi,	%g5
loop_534:
	subcc	%o7,	0x0D2B,	%i5
	sir	0x00A5
	fmovdvs	%xcc,	%f20,	%f30
	bleu,a,pn	%icc,	loop_535
	array16	%g2,	%i3,	%l0
	sdivx	%l2,	0x0096,	%i0
	edge32l	%i7,	%i2,	%g6
loop_535:
	movrgz	%o4,	%l3,	%g4
	fpack16	%f18,	%f25
	edge8ln	%l4,	%i6,	%i4
	ta	%icc,	0x3
	fpsub16s	%f5,	%f3,	%f10
	edge8l	%l6,	%o1,	%l5
	fbule,a	%fcc2,	loop_536
	array16	%o6,	%i1,	%o2
	set	0x7C, %o4
	lda	[%l7 + %o4] 0x04,	%f2
loop_536:
	sdivx	%l1,	0x0C24,	%o5
	ble,a	%icc,	loop_537
	std	%g2,	[%l7 + 0x08]
	andn	%g1,	0x0641,	%o3
	edge32n	%g7,	%o0,	%g5
loop_537:
	tgu	%xcc,	0x0
	fnands	%f15,	%f21,	%f13
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x54] %asi,	%f2
	tl	%xcc,	0x6
	fpadd16	%f6,	%f2,	%f24
	fornot2s	%f5,	%f4,	%f30
	stx	%o7,	[%l7 + 0x20]
	mulscc	%i5,	%i3,	%g2
	srlx	%l0,	%i0,	%l2
	addccc	%i2,	%g6,	%o4
	set	0x74, %l0
	stha	%l3,	[%l7 + %l0] 0x19
	ldd	[%l7 + 0x48],	%f8
	set	0x70, %l4
	swapa	[%l7 + %l4] 0x19,	%g4
	ta	%icc,	0x6
	mulx	%i7,	%l4,	%i6
	ldstub	[%l7 + 0x20],	%l6
	array8	%i4,	%o1,	%o6
	bne,a	%icc,	loop_538
	fmovrslz	%l5,	%f4,	%f18
	fbl,a	%fcc3,	loop_539
	fmovse	%xcc,	%f22,	%f25
loop_538:
	fornot1	%f28,	%f20,	%f14
	fnot2	%f14,	%f28
loop_539:
	fsrc2s	%f11,	%f12
	movpos	%icc,	%o2,	%i1
	be,pt	%xcc,	loop_540
	ldd	[%l7 + 0x78],	%l0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%g3
loop_540:
	movrne	%g1,	%o3,	%g7
	fnand	%f26,	%f24,	%f24
	wr	%g0,	0x0c,	%asi
	sta	%f31,	[%l7 + 0x14] %asi
	xorcc	%g5,	0x1075,	%o7
	fmovdpos	%icc,	%f14,	%f9
	movne	%icc,	%i5,	%i3
	fands	%f15,	%f30,	%f8
	array16	%o0,	%l0,	%i0
	alignaddrl	%g2,	%l2,	%i2
	tpos	%xcc,	0x0
	array32	%o4,	%l3,	%g4
	edge16ln	%g6,	%l4,	%i6
	orn	%l6,	%i7,	%o1
	fxors	%f11,	%f20,	%f17
	sethi	0x16F7,	%i4
	brlez,a	%l5,	loop_541
	tvs	%xcc,	0x4
	smulcc	%o2,	0x0944,	%i1
	fandnot2s	%f13,	%f21,	%f14
loop_541:
	movg	%xcc,	%o6,	%o5
	fcmple32	%f4,	%f6,	%g3
	movcs	%icc,	%g1,	%o3
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	bge,a	%xcc,	loop_542
	mova	%icc,	%g5,	%o7
	subcc	%l1,	0x189C,	%i5
	addccc	%i3,	0x19C0,	%o0
loop_542:
	tneg	%xcc,	0x1
	movre	%l0,	0x309,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%xcc,	%f30,	%f18
	fmovdleu	%icc,	%f1,	%f14
	brnz	%l2,	loop_543
	andn	%i2,	0x1641,	%g2
	edge32	%o4,	%l3,	%g4
	udiv	%g6,	0x0948,	%i6
loop_543:
	sdivx	%l6,	0x196E,	%i7
	xorcc	%l4,	0x0928,	%i4
	movle	%icc,	%l5,	%o1
	bn,a,pn	%xcc,	loop_544
	addc	%i1,	0x1871,	%o6
	movleu	%xcc,	%o2,	%o5
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%g1
loop_544:
	tsubcctv	%g3,	0x0B41,	%o3
	bgu,pn	%icc,	loop_545
	swap	[%l7 + 0x08],	%g7
	fpmerge	%f0,	%f23,	%f8
	movleu	%xcc,	%g5,	%o7
loop_545:
	bne,a	%xcc,	loop_546
	fpsub32s	%f14,	%f8,	%f15
	swap	[%l7 + 0x28],	%i5
	fmuld8ulx16	%f15,	%f19,	%f0
loop_546:
	umulcc	%l1,	%o0,	%i3
	sth	%l0,	[%l7 + 0x78]
	array32	%l2,	%i2,	%g2
	tsubcctv	%i0,	0x0467,	%l3
	movleu	%xcc,	%g4,	%g6
	move	%icc,	%o4,	%i6
	tvs	%icc,	0x1
	ldx	[%l7 + 0x38],	%i7
	popc	0x1E4C,	%l4
	fblg,a	%fcc0,	loop_547
	movl	%xcc,	%l6,	%l5
	sdivx	%o1,	0x1DA8,	%i1
	brlez,a	%o6,	loop_548
loop_547:
	flush	%l7 + 0x44
	ldsb	[%l7 + 0x46],	%o2
	fmovrde	%o5,	%f0,	%f24
loop_548:
	brz,a	%i4,	loop_549
	fmovrdgz	%g1,	%f24,	%f4
	be,a	%icc,	loop_550
	movcs	%icc,	%o3,	%g3
loop_549:
	smul	%g7,	0x1423,	%g5
	set	0x0C, %o0
	sta	%f7,	[%l7 + %o0] 0x15
loop_550:
	fones	%f4
	sethi	0x1E14,	%i5
	movne	%xcc,	%l1,	%o7
	taddcctv	%o0,	0x03BC,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f26,	%f22,	%i3
	set	0x78, %o5
	stha	%l2,	[%l7 + %o5] 0x19
	alignaddr	%i2,	%g2,	%l3
	mulscc	%i0,	0x1CDE,	%g6
	sra	%g4,	0x0F,	%i6
	fmovdg	%xcc,	%f28,	%f2
	ldsb	[%l7 + 0x11],	%i7
	sir	0x134F
	fcmpgt16	%f0,	%f16,	%l4
	fcmpeq16	%f16,	%f22,	%l6
	edge8l	%o4,	%l5,	%i1
	movne	%xcc,	%o1,	%o6
	smul	%o5,	0x10B2,	%i4
	edge32n	%g1,	%o2,	%o3
	brlez,a	%g7,	loop_551
	addccc	%g3,	%g5,	%l1
	edge32l	%i5,	%o7,	%l0
	orncc	%o0,	0x02D2,	%l2
loop_551:
	sllx	%i2,	0x0C,	%g2
	tgu	%icc,	0x5
	fmovsl	%xcc,	%f30,	%f10
	tne	%xcc,	0x0
	sll	%i3,	%l3,	%i0
	movneg	%icc,	%g4,	%g6
	tn	%icc,	0x7
	umul	%i7,	0x07D7,	%i6
	sllx	%l4,	0x14,	%o4
	orcc	%l6,	%i1,	%l5
	fmovdgu	%xcc,	%f28,	%f21
	orncc	%o6,	0x0E79,	%o5
	srax	%o1,	0x09,	%g1
	edge16ln	%i4,	%o3,	%o2
	edge16ln	%g3,	%g5,	%g7
	ta	%xcc,	0x1
	edge32	%l1,	%i5,	%o7
	movrgz	%o0,	%l2,	%i2
	fnot1	%f12,	%f20
	membar	0x1C
	add	%l0,	0x1B1A,	%g2
	orcc	%l3,	%i3,	%g4
	fbul,a	%fcc3,	loop_552
	bn,a,pn	%icc,	loop_553
	edge32ln	%i0,	%i7,	%g6
	movrlez	%l4,	0x335,	%i6
loop_552:
	ldd	[%l7 + 0x10],	%o4
loop_553:
	sllx	%l6,	0x09,	%l5
	popc	0x1B7B,	%o6
	add	%i1,	%o1,	%g1
	array32	%o5,	%i4,	%o3
	and	%g3,	%o2,	%g5
	movrgz	%l1,	%g7,	%i5
	movgu	%xcc,	%o0,	%o7
	edge16	%i2,	%l2,	%g2
	fcmped	%fcc3,	%f20,	%f12
	movre	%l0,	0x264,	%l3
	array32	%g4,	%i0,	%i3
	pdist	%f8,	%f8,	%f6
	movre	%i7,	%l4,	%i6
	movcs	%xcc,	%g6,	%o4
	fmovrdgz	%l6,	%f12,	%f2
	and	%o6,	0x1A43,	%i1
	mulx	%l5,	0x1C78,	%o1
	sra	%o5,	%g1,	%i4
	tleu	%icc,	0x5
	andcc	%o3,	0x1E04,	%g3
	bn,a,pn	%xcc,	loop_554
	brlez	%g5,	loop_555
	nop
	setx loop_556, %l0, %l1
	jmpl %l1, %o2
	edge16l	%g7,	%i5,	%l1
loop_554:
	array16	%o0,	%i2,	%o7
loop_555:
	tvs	%xcc,	0x2
loop_556:
	fmovdl	%xcc,	%f5,	%f0
	edge8ln	%l2,	%l0,	%l3
	edge32	%g4,	%g2,	%i0
	srlx	%i3,	%l4,	%i6
	movpos	%icc,	%i7,	%o4
	movrgz	%g6,	0x0F3,	%l6
	fbue,a	%fcc2,	loop_557
	movl	%icc,	%o6,	%l5
	te	%icc,	0x5
	taddcc	%i1,	%o1,	%o5
loop_557:
	or	%g1,	%i4,	%g3
	movpos	%xcc,	%o3,	%g5
	fbg,a	%fcc2,	loop_558
	tgu	%xcc,	0x1
	fmuld8sux16	%f3,	%f26,	%f30
	movle	%icc,	%g7,	%i5
loop_558:
	subccc	%o2,	%o0,	%l1
	edge16l	%o7,	%i2,	%l2
	fnand	%f0,	%f28,	%f8
	array8	%l0,	%g4,	%l3
	alignaddr	%i0,	%i3,	%g2
	fmovdcs	%xcc,	%f13,	%f7
	fmovdvs	%xcc,	%f22,	%f5
	mulx	%i6,	%l4,	%i7
	movne	%xcc,	%o4,	%l6
	fmuld8ulx16	%f19,	%f17,	%f12
	ba,a,pn	%icc,	loop_559
	edge8ln	%o6,	%g6,	%l5
	fmul8sux16	%f28,	%f18,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_559:
	brlz,a	%o1,	loop_560
	udivx	%o5,	0x1E7F,	%g1
	tsubcc	%i1,	%g3,	%o3
	movvc	%icc,	%i4,	%g5
loop_560:
	fbg,a	%fcc0,	loop_561
	umulcc	%g7,	0x020A,	%o2
	movleu	%icc,	%i5,	%o0
	stw	%l1,	[%l7 + 0x78]
loop_561:
	tneg	%icc,	0x3
	subccc	%o7,	0x0BE0,	%l2
	bpos,pt	%xcc,	loop_562
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%l0,	[%l7 + 0x28]
	edge32n	%i2,	%g4,	%l3
loop_562:
	srl	%i3,	%g2,	%i0
	fcmpd	%fcc1,	%f24,	%f22
	brlz	%l4,	loop_563
	subccc	%i6,	%i7,	%l6
	movge	%icc,	%o4,	%o6
	fbne,a	%fcc0,	loop_564
loop_563:
	movpos	%xcc,	%g6,	%o1
	smulcc	%l5,	%g1,	%i1
	tl	%icc,	0x4
loop_564:
	sllx	%g3,	0x12,	%o3
	bcc,pn	%xcc,	loop_565
	addc	%o5,	0x00B3,	%g5
	fmovsvc	%xcc,	%f3,	%f28
	udiv	%i4,	0x11A5,	%g7
loop_565:
	fbule,a	%fcc3,	loop_566
	subc	%i5,	0x0DDD,	%o2
	bgu,pn	%xcc,	loop_567
	bge,a	loop_568
loop_566:
	fbule,a	%fcc2,	loop_569
	fmovdpos	%xcc,	%f11,	%f12
loop_567:
	edge16l	%l1,	%o0,	%o7
loop_568:
	xnor	%l0,	0x09CE,	%i2
loop_569:
	fmovsvs	%xcc,	%f24,	%f18
	movneg	%icc,	%l2,	%g4
	andncc	%i3,	%g2,	%i0
	fsrc2	%f2,	%f8
	movrgz	%l3,	%l4,	%i6
	edge8ln	%l6,	%o4,	%i7
	fmovrsne	%o6,	%f25,	%f28
	movpos	%xcc,	%g6,	%l5
	addcc	%g1,	0x08DB,	%i1
	fcmps	%fcc2,	%f8,	%f0
	movge	%xcc,	%g3,	%o1
	movl	%xcc,	%o3,	%o5
	movg	%icc,	%i4,	%g5
	taddcc	%g7,	0x1897,	%o2
	taddcc	%i5,	%o0,	%o7
	edge16ln	%l0,	%i2,	%l1
	movleu	%xcc,	%g4,	%l2
	and	%g2,	%i0,	%l3
	taddcc	%l4,	0x11A9,	%i3
	andn	%i6,	0x15E2,	%l6
	movg	%xcc,	%i7,	%o4
	fnors	%f19,	%f16,	%f22
	fpadd32s	%f1,	%f29,	%f30
	mulscc	%g6,	0x0B30,	%l5
	fcmpeq16	%f28,	%f10,	%g1
	tvc	%icc,	0x6
	fbg	%fcc2,	loop_570
	srl	%i1,	%g3,	%o1
	te	%xcc,	0x7
	flush	%l7 + 0x7C
loop_570:
	nop
	wr	%g0,	0x89,	%asi
	stha	%o3,	[%l7 + 0x3A] %asi
	fabsd	%f16,	%f16
	set	0x68, %g1
	stwa	%o6,	[%l7 + %g1] 0x80
	fbo	%fcc2,	loop_571
	sethi	0x104D,	%o5
	addccc	%i4,	0x0A43,	%g5
	te	%icc,	0x0
loop_571:
	movrlez	%o2,	0x23C,	%g7
	sdivcc	%i5,	0x14EB,	%o0
	move	%xcc,	%l0,	%i2
	brlez	%l1,	loop_572
	tge	%xcc,	0x2
	mova	%icc,	%o7,	%l2
	fandnot2s	%f2,	%f13,	%f24
loop_572:
	fbg	%fcc3,	loop_573
	array32	%g4,	%i0,	%l3
	sllx	%l4,	%i3,	%i6
	tn	%xcc,	0x5
loop_573:
	movcs	%xcc,	%l6,	%g2
	movre	%o4,	%g6,	%l5
	movvc	%icc,	%g1,	%i7
	movvc	%xcc,	%g3,	%o1
	brnz	%i1,	loop_574
	fmovdvs	%icc,	%f31,	%f20
	bneg,a	loop_575
	sub	%o3,	%o5,	%i4
loop_574:
	nop
	set	0x48, %i4
	sta	%f0,	[%l7 + %i4] 0x80
loop_575:
	movrlez	%g5,	0x372,	%o6
	taddcc	%o2,	0x04B1,	%i5
	edge32n	%o0,	%l0,	%i2
	brgz	%g7,	loop_576
	edge16ln	%l1,	%l2,	%o7
	fpackfix	%f12,	%f19
	tle	%xcc,	0x3
loop_576:
	sth	%g4,	[%l7 + 0x56]
	stb	%l3,	[%l7 + 0x3B]
	tcs	%icc,	0x0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] %asi,	%l4,	%i0
	srlx	%i6,	%i3,	%g2
	fmovd	%f14,	%f4
	movcc	%xcc,	%o4,	%g6
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1
	edge32ln	%l5,	%i7,	%g3
	fmovd	%f2,	%f24
	sdiv	%g1,	0x0E81,	%i1
	move	%icc,	%o1,	%o5
	fabss	%f17,	%f8
	fbule	%fcc0,	loop_577
	brgz,a	%i4,	loop_578
	bneg,pt	%icc,	loop_579
	tvc	%icc,	0x5
loop_577:
	movle	%icc,	%g5,	%o3
loop_578:
	fands	%f12,	%f1,	%f31
loop_579:
	bge,a	loop_580
	addc	%o6,	0x0042,	%i5
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
loop_580:
	or	%o2,	0x020C,	%l0
	udivcc	%i2,	0x1F9B,	%g7
	mulx	%l1,	0x03EC,	%o7
	wr	%g0,	0x22,	%asi
	stda	%g4,	[%l7 + 0x48] %asi
	membar	#Sync
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x40] %asi,	%l2
	brz,a	%l3,	loop_581
	ble	loop_582
	fmovsleu	%icc,	%f13,	%f4
	std	%i0,	[%l7 + 0x70]
loop_581:
	fmovsvc	%xcc,	%f21,	%f17
loop_582:
	move	%icc,	%l4,	%i6
	edge16	%i3,	%g2,	%o4
	fbe,a	%fcc3,	loop_583
	movrlez	%g6,	%l6,	%l5
	alignaddr	%i7,	%g1,	%g3
	set	0x0A, %g4
	ldsha	[%l7 + %g4] 0x81,	%o1
loop_583:
	smulcc	%o5,	%i4,	%i1
	fmovsvc	%xcc,	%f25,	%f16
	tne	%icc,	0x0
	taddcctv	%g5,	%o6,	%o3
	movrne	%o0,	0x14A,	%i5
	edge16	%l0,	%i2,	%o2
	fbule,a	%fcc0,	loop_584
	fbl,a	%fcc1,	loop_585
	movrne	%g7,	0x1D9,	%l1
	fbe	%fcc1,	loop_586
loop_584:
	move	%icc,	%g4,	%l2
loop_585:
	nop
	set	0x0C, %g7
	sta	%f24,	[%l7 + %g7] 0x14
loop_586:
	fornot2s	%f31,	%f13,	%f30
	fzero	%f14
	fnegd	%f24,	%f16
	fsrc2	%f10,	%f0
	fmovdne	%xcc,	%f23,	%f13
	edge8n	%o7,	%l3,	%l4
	fmul8ulx16	%f20,	%f26,	%f30
	addcc	%i6,	0x1C94,	%i0
	movvs	%xcc,	%g2,	%i3
	ldsb	[%l7 + 0x5F],	%g6
	bleu,a,pn	%icc,	loop_587
	fmovde	%icc,	%f6,	%f16
	xorcc	%l6,	%l5,	%i7
	array32	%g1,	%g3,	%o1
loop_587:
	addcc	%o5,	%o4,	%i4
	edge16ln	%i1,	%o6,	%g5
	tge	%xcc,	0x0
	tle	%xcc,	0x1
	fbo	%fcc3,	loop_588
	fnot2	%f6,	%f12
	sir	0x0716
	movgu	%icc,	%o0,	%o3
loop_588:
	umul	%i5,	%l0,	%o2
	smul	%i2,	0x188C,	%l1
	subccc	%g7,	0x04E0,	%g4
	orn	%o7,	%l2,	%l4
	andn	%i6,	0x08AC,	%l3
	mova	%xcc,	%i0,	%i3
	array8	%g6,	%l6,	%l5
	fbe	%fcc0,	loop_589
	bvc,a,pt	%xcc,	loop_590
	movvc	%xcc,	%g2,	%g1
	movneg	%icc,	%g3,	%o1
loop_589:
	orcc	%i7,	0x0545,	%o4
loop_590:
	fzero	%f12
	array8	%o5,	%i1,	%o6
	tge	%xcc,	0x4
	orncc	%i4,	%g5,	%o3
	call	loop_591
	fmul8sux16	%f0,	%f28,	%f4
	movcc	%icc,	%o0,	%l0
	tsubcctv	%i5,	%i2,	%l1
loop_591:
	movvc	%xcc,	%g7,	%o2
	alignaddrl	%g4,	%o7,	%l2
	movleu	%icc,	%i6,	%l3
	fmuld8sux16	%f11,	%f0,	%f28
	edge32ln	%i0,	%l4,	%i3
	std	%g6,	[%l7 + 0x50]
	fandnot2	%f2,	%f30,	%f14
	srax	%l6,	%g2,	%g1
	tge	%xcc,	0x4
	set	0x44, %i7
	sta	%f17,	[%l7 + %i7] 0x80
	alignaddrl	%l5,	%o1,	%i7
	mulscc	%g3,	%o4,	%o5
	fpsub32	%f10,	%f8,	%f20
	std	%i0,	[%l7 + 0x18]
	movrne	%i4,	%g5,	%o6
	set	0x74, %o3
	swapa	[%l7 + %o3] 0x10,	%o3
	fsrc2	%f18,	%f0
	tle	%icc,	0x6
	subcc	%o0,	0x1916,	%l0
	fmovdge	%icc,	%f14,	%f8
	brgez,a	%i5,	loop_592
	fcmped	%fcc3,	%f24,	%f26
	sll	%l1,	%g7,	%o2
	fmovsge	%icc,	%f4,	%f14
loop_592:
	subcc	%g4,	0x0779,	%i2
	movl	%icc,	%l2,	%i6
	alignaddr	%l3,	%i0,	%l4
	and	%o7,	0x0905,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x64, %g6
	stwa	%g6,	[%l7 + %g6] 0x22
	membar	#Sync
	bge,a,pn	%icc,	loop_593
	fmuld8sux16	%f19,	%f28,	%f30
	tvc	%icc,	0x2
	array32	%g2,	%g1,	%l5
loop_593:
	udivx	%l6,	0x0E9A,	%i7
	fmovscc	%icc,	%f19,	%f13
	edge32ln	%g3,	%o4,	%o5
	std	%o0,	[%l7 + 0x38]
	fcmpne16	%f26,	%f24,	%i4
	taddcctv	%i1,	%g5,	%o6
	tpos	%xcc,	0x4
	tneg	%icc,	0x1
	alignaddr	%o0,	%o3,	%l0
	fmovdpos	%xcc,	%f21,	%f15
	siam	0x2
	edge32l	%l1,	%i5,	%o2
	or	%g7,	0x0C75,	%i2
	fbule	%fcc1,	loop_594
	tn	%icc,	0x1
	brgez,a	%l2,	loop_595
	fble	%fcc1,	loop_596
loop_594:
	array32	%g4,	%l3,	%i0
	movcs	%xcc,	%l4,	%i6
loop_595:
	addccc	%i3,	%g6,	%g2
loop_596:
	fmovsg	%xcc,	%f22,	%f9
	movleu	%xcc,	%g1,	%o7
	udivx	%l5,	0x1E2B,	%l6
	move	%xcc,	%i7,	%g3
	movvs	%icc,	%o4,	%o1
	set	0x40, %l1
	lduwa	[%l7 + %l1] 0x88,	%i4
	fmuld8sux16	%f5,	%f22,	%f2
	bge,a	loop_597
	call	loop_598
	taddcctv	%o5,	%i1,	%g5
	sra	%o0,	%o6,	%l0
loop_597:
	sdivcc	%l1,	0x1FB1,	%i5
loop_598:
	stw	%o2,	[%l7 + 0x70]
	fmovda	%xcc,	%f19,	%f0
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%g7,	%i2
	movcc	%icc,	%o3,	%l2
	and	%g4,	0x1C90,	%l3
	movcc	%icc,	%l4,	%i6
	mulscc	%i0,	0x13DD,	%g6
	fmovdvs	%icc,	%f17,	%f7
	movleu	%icc,	%i3,	%g2
	movn	%icc,	%g1,	%o7
	andncc	%l5,	%i7,	%g3
	xnorcc	%o4,	0x0047,	%o1
	bn	loop_599
	movgu	%icc,	%i4,	%o5
	alignaddr	%i1,	%l6,	%o0
	movge	%icc,	%o6,	%l0
loop_599:
	movcc	%xcc,	%g5,	%i5
	brgz,a	%o2,	loop_600
	srl	%g7,	0x03,	%i2
	fmovsn	%icc,	%f18,	%f19
	mulscc	%o3,	%l2,	%l1
loop_600:
	xor	%g4,	%l4,	%i6
	tleu	%xcc,	0x7
	subccc	%l3,	0x05CF,	%i0
	udivx	%g6,	0x0FE9,	%g2
	edge16ln	%g1,	%i3,	%l5
	or	%i7,	%g3,	%o7
	smul	%o4,	0x0F05,	%o1
	ldd	[%l7 + 0x38],	%i4
	addc	%o5,	%i1,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc2,	loop_601
	fxor	%f20,	%f28,	%f14
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x74] %asi,	%o6
loop_601:
	or	%o0,	0x05D9,	%l0
	orn	%i5,	%g5,	%g7
	prefetch	[%l7 + 0x50],	 0x1
	fpsub32	%f0,	%f6,	%f30
	addcc	%i2,	0x1B77,	%o3
	set	0x24, %l6
	lda	[%l7 + %l6] 0x80,	%f28
	movleu	%icc,	%l2,	%o2
	srlx	%g4,	0x16,	%l1
	movpos	%icc,	%i6,	%l3
	fpadd16	%f0,	%f14,	%f24
	array32	%l4,	%g6,	%i0
	stbar
	orn	%g2,	0x0C37,	%i3
	fmovdpos	%xcc,	%f30,	%f28
	set	0x68, %o2
	swapa	[%l7 + %o2] 0x04,	%g1
	popc	%l5,	%i7
	membar	0x69
	set	0x50, %o1
	ldswa	[%l7 + %o1] 0x19,	%o7
	fmovrsgez	%g3,	%f14,	%f5
	array32	%o1,	%i4,	%o4
	edge32ln	%o5,	%i1,	%o6
	srl	%l6,	%l0,	%o0
	bne,pt	%icc,	loop_602
	fcmpne32	%f0,	%f12,	%i5
	tsubcctv	%g7,	0x091D,	%g5
	movne	%icc,	%o3,	%i2
loop_602:
	nop
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x23] %asi,	%o2
	sub	%l2,	0x1E1C,	%l1
	xnor	%g4,	%i6,	%l3
	movle	%icc,	%g6,	%l4
	fmovs	%f29,	%f23
	tn	%xcc,	0x1
	fnands	%f17,	%f0,	%f28
	movrlez	%i0,	0x2C0,	%i3
	mulx	%g2,	0x1B6B,	%g1
	umulcc	%i7,	0x0D66,	%o7
	mova	%xcc,	%l5,	%o1
	edge32n	%g3,	%i4,	%o5
	edge16ln	%i1,	%o6,	%l6
	tvc	%xcc,	0x4
	fxor	%f4,	%f6,	%f28
	array32	%l0,	%o4,	%i5
	fpack32	%f26,	%f6,	%f0
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x58] %asi,	%g7
	ld	[%l7 + 0x74],	%f23
	xnorcc	%g5,	%o3,	%i2
	ldub	[%l7 + 0x3D],	%o2
	bl	%xcc,	loop_603
	movcc	%icc,	%l2,	%l1
	alignaddr	%g4,	%o0,	%i6
	fpsub16	%f18,	%f4,	%f30
loop_603:
	movrne	%l3,	%l4,	%g6
	fmovd	%f14,	%f6
	srl	%i0,	%i3,	%g2
	movrlz	%g1,	0x033,	%o7
	fcmps	%fcc0,	%f23,	%f25
	subcc	%l5,	%i7,	%g3
	bge,pn	%icc,	loop_604
	udivx	%i4,	0x0D70,	%o1
	ta	%xcc,	0x3
	andcc	%o5,	%i1,	%l6
loop_604:
	fpackfix	%f8,	%f18
	addc	%l0,	0x133C,	%o4
	tle	%icc,	0x4
	tl	%xcc,	0x4
	mulscc	%o6,	%i5,	%g7
	udiv	%o3,	0x0DB7,	%i2
	taddcctv	%o2,	%g5,	%l2
	movleu	%xcc,	%g4,	%l1
	fbule,a	%fcc2,	loop_605
	srax	%i6,	%l3,	%o0
	edge8	%l4,	%i0,	%g6
	fmovrdgz	%g2,	%f26,	%f28
loop_605:
	ldd	[%l7 + 0x28],	%f30
	sethi	0x0A4F,	%g1
	edge32	%i3,	%o7,	%i7
	brlez,a	%g3,	loop_606
	tgu	%xcc,	0x0
	set	0x58, %i3
	lda	[%l7 + %i3] 0x89,	%f13
loop_606:
	fpsub32s	%f19,	%f6,	%f21
	subcc	%i4,	0x196D,	%l5
	fbg	%fcc0,	loop_607
	add	%o1,	%o5,	%i1
	movge	%icc,	%l0,	%l6
	bcs,a,pt	%xcc,	loop_608
loop_607:
	xnor	%o6,	0x0C1F,	%o4
	subcc	%g7,	%i5,	%i2
	movge	%xcc,	%o2,	%o3
loop_608:
	fmovdg	%xcc,	%f24,	%f30
	and	%l2,	%g5,	%g4
	fnot1s	%f1,	%f1
	lduh	[%l7 + 0x5C],	%l1
	fmovrdne	%i6,	%f6,	%f2
	xnorcc	%l3,	0x18B1,	%l4
	stx	%i0,	[%l7 + 0x10]
	xnor	%g6,	0x0872,	%o0
	xor	%g1,	%i3,	%o7
	orn	%i7,	%g2,	%i4
	brlez	%l5,	loop_609
	addccc	%g3,	%o1,	%o5
	andn	%l0,	0x1778,	%i1
	tle	%icc,	0x4
loop_609:
	movneg	%icc,	%o6,	%o4
	movpos	%xcc,	%g7,	%l6
	set	0x54, %i1
	lduwa	[%l7 + %i1] 0x10,	%i2
	fbue,a	%fcc2,	loop_610
	addc	%i5,	%o3,	%l2
	fnot2	%f8,	%f30
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x88
loop_610:
	array16	%o2,	%g5,	%g4
	edge32l	%i6,	%l3,	%l1
	xnorcc	%l4,	%i0,	%g6
	fandnot1s	%f3,	%f13,	%f20
	ldsw	[%l7 + 0x24],	%g1
	edge16n	%o0,	%o7,	%i3
	std	%i6,	[%l7 + 0x78]
	bge,pn	%xcc,	loop_611
	array8	%g2,	%i4,	%l5
	movl	%xcc,	%g3,	%o1
	tvc	%xcc,	0x3
loop_611:
	move	%icc,	%l0,	%i1
	set	0x20, %o7
	stda	%o6,	[%l7 + %o7] 0x23
	membar	#Sync
	mova	%icc,	%o5,	%o4
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf8
	membar	#Sync
	srlx	%g7,	%i2,	%l6
	movle	%xcc,	%o3,	%l2
	fbo,a	%fcc1,	loop_612
	sub	%i5,	%o2,	%g4
	movrne	%g5,	%l3,	%l1
	movge	%icc,	%i6,	%l4
loop_612:
	lduh	[%l7 + 0x44],	%g6
	ldd	[%l7 + 0x18],	%f26
	fmovdvs	%xcc,	%f17,	%f14
	tne	%xcc,	0x1
	sethi	0x0545,	%i0
	addccc	%o0,	0x1030,	%g1
	nop
	set	0x1C, %l2
	sth	%i3,	[%l7 + %l2]
	taddcctv	%i7,	%o7,	%g2
	set	0x0E, %l3
	stha	%i4,	[%l7 + %l3] 0xea
	membar	#Sync
	tge	%xcc,	0x5
	bgu,a,pn	%xcc,	loop_613
	nop
	setx	loop_614,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnot2s	%f16,	%f6
	fnegd	%f24,	%f22
loop_613:
	bge,a	loop_615
loop_614:
	array32	%g3,	%o1,	%l5
	fbu,a	%fcc0,	loop_616
	mulscc	%l0,	0x1FF1,	%o6
loop_615:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_616:
	subccc	%o5,	0x038D,	%o4
	udivx	%g7,	0x1935,	%i1
	fbul	%fcc3,	loop_617
	array16	%l6,	%o3,	%i2
	stx	%i5,	[%l7 + 0x38]
	movle	%icc,	%l2,	%g4
loop_617:
	call	loop_618
	and	%g5,	%o2,	%l1
	srax	%i6,	%l3,	%g6
	tsubcc	%i0,	0x0E52,	%o0
loop_618:
	nop
	setx	loop_619,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subccc	%g1,	0x1FF9,	%i3
	sth	%i7,	[%l7 + 0x60]
	set	0x48, %g3
	prefetcha	[%l7 + %g3] 0x10,	 0x0
loop_619:
	srax	%g2,	%i4,	%g3
	tleu	%xcc,	0x1
	udiv	%o7,	0x0217,	%l5
	fmovde	%icc,	%f1,	%f19
	tcc	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x54] %asi,	%o1
	add	%o6,	0x1ED7,	%o5
	tvc	%xcc,	0x2
	srlx	%o4,	0x06,	%l0
	fone	%f4
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x2e,	%i0
	nop
	set	0x28, %g2
	std	%i6,	[%l7 + %g2]
	addccc	%o3,	0x1785,	%g7
	sra	%i2,	0x1F,	%l2
	fmuld8sux16	%f17,	%f16,	%f10
	sir	0x1854
	fornot2s	%f25,	%f12,	%f11
	tg	%xcc,	0x3
	andncc	%i5,	%g4,	%g5
	smul	%o2,	0x12EB,	%i6
	set	0x24, %i0
	ldsba	[%l7 + %i0] 0x81,	%l1
	ldd	[%l7 + 0x68],	%f6
	nop
	set	0x3D, %l5
	ldstub	[%l7 + %l5],	%l3
	subccc	%i0,	0x03A1,	%o0
	fmovsvc	%xcc,	%f2,	%f26
	brnz	%g1,	loop_620
	orcc	%g6,	%i7,	%l4
	call	loop_621
	fzero	%f14
loop_620:
	movg	%xcc,	%i3,	%g2
	ldsh	[%l7 + 0x60],	%i4
loop_621:
	fxor	%f20,	%f4,	%f18
	edge32	%o7,	%l5,	%o1
	mulx	%g3,	%o5,	%o4
	set	0x00, %o6
	ldxa	[%g0 + %o6] 0x50,	%l0
	set	0x0C, %i2
	ldsha	[%l7 + %i2] 0x14,	%i1
	fmovdneg	%icc,	%f20,	%f29
	movcs	%icc,	%o6,	%o3
	fbuge,a	%fcc1,	loop_622
	sub	%l6,	0x1CCF,	%g7
	bvc,pn	%icc,	loop_623
	fmovrdlz	%i2,	%f28,	%f16
loop_622:
	tcc	%icc,	0x6
	edge8	%i5,	%g4,	%g5
loop_623:
	tne	%icc,	0x3
	edge16n	%l2,	%o2,	%l1
	movge	%icc,	%i6,	%i0
	tvc	%icc,	0x7
	set	0x3C, %l0
	lduha	[%l7 + %l0] 0x15,	%o0
	brgz,a	%l3,	loop_624
	sethi	0x058A,	%g6
	bl,a	loop_625
	fbule	%fcc3,	loop_626
loop_624:
	fmovdpos	%xcc,	%f25,	%f13
	bne,pt	%xcc,	loop_627
loop_625:
	prefetch	[%l7 + 0x58],	 0x1
loop_626:
	srlx	%i7,	0x1C,	%l4
	ld	[%l7 + 0x18],	%f5
loop_627:
	stbar
	alignaddrl	%i3,	%g1,	%i4
	and	%o7,	%g2,	%o1
	fsrc2	%f26,	%f26
	fmovsl	%xcc,	%f21,	%f11
	fblg	%fcc3,	loop_628
	umulcc	%g3,	0x0B86,	%o5
	fbl,a	%fcc2,	loop_629
	sllx	%o4,	%l0,	%i1
loop_628:
	taddcctv	%l5,	%o6,	%l6
	ta	%icc,	0x2
loop_629:
	edge32	%g7,	%i2,	%i5
	alignaddrl	%g4,	%o3,	%g5
	edge8ln	%o2,	%l1,	%l2
	brlz	%i0,	loop_630
	bvs,a,pn	%icc,	loop_631
	xorcc	%i6,	%l3,	%g6
	umul	%i7,	%l4,	%o0
loop_630:
	tg	%xcc,	0x0
loop_631:
	fpsub16	%f0,	%f2,	%f10
	array8	%g1,	%i3,	%i4
	tsubcctv	%g2,	0x09E3,	%o1
	fnegd	%f12,	%f14
	tleu	%xcc,	0x3
	tle	%icc,	0x1
	fcmpgt32	%f28,	%f22,	%g3
	movl	%icc,	%o5,	%o4
	nop
	setx	loop_632,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tg	%icc,	0x6
	addcc	%l0,	%i1,	%o7
	bcc,a	loop_633
loop_632:
	fpmerge	%f20,	%f11,	%f4
	addccc	%l5,	0x0A7F,	%l6
	xor	%g7,	%i2,	%i5
loop_633:
	fcmpeq16	%f28,	%f30,	%g4
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	movne	%xcc,	%o6,	%g5
	fxor	%f2,	%f6,	%f20
	tl	%xcc,	0x4
	fmovdle	%icc,	%f11,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l1,	%l2,	%i0
	bvc,a	loop_634
	array8	%i6,	%o2,	%g6
	orncc	%i7,	0x068D,	%l3
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x7C] %asi,	%o0
loop_634:
	movrne	%g1,	%l4,	%i4
	te	%xcc,	0x0
	wr	%g0,	0xeb,	%asi
	stba	%g2,	[%l7 + 0x54] %asi
	membar	#Sync
	tvs	%xcc,	0x4
	bl	loop_635
	fcmpgt32	%f4,	%f6,	%i3
	membar	0x53
	edge32	%o1,	%g3,	%o4
loop_635:
	udiv	%o5,	0x05A8,	%l0
	fsrc2	%f20,	%f20
	umul	%i1,	%o7,	%l6
	edge16l	%g7,	%l5,	%i5
	movvc	%xcc,	%i2,	%g4
	nop
	set	0x18, %l4
	std	%f12,	[%l7 + %l4]
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x58] %asi,	%f17
	bshuffle	%f20,	%f20,	%f14
	set	0x26, %o4
	ldsba	[%l7 + %o4] 0x18,	%o3
	subcc	%g5,	0x0FDF,	%l1
	mulscc	%o6,	0x174B,	%l2
	sll	%i0,	%i6,	%o2
	fbe	%fcc0,	loop_636
	edge16l	%g6,	%i7,	%l3
	sdiv	%o0,	0x07FA,	%g1
	bshuffle	%f18,	%f18,	%f2
loop_636:
	nop
	set	0x50, %o5
	stxa	%i4,	[%l7 + %o5] 0x18
	fmovrsgez	%l4,	%f13,	%f26
	tge	%icc,	0x1
	tcs	%xcc,	0x0
	mulx	%g2,	%o1,	%g3
	be,a,pn	%xcc,	loop_637
	edge8ln	%i3,	%o5,	%l0
	tsubcc	%o4,	%i1,	%o7
	taddcc	%l6,	%g7,	%l5
loop_637:
	edge32	%i5,	%g4,	%o3
	tg	%xcc,	0x6
	tsubcctv	%g5,	%i2,	%l1
	tl	%xcc,	0x3
	tle	%xcc,	0x6
	fbne,a	%fcc2,	loop_638
	fmovsg	%xcc,	%f31,	%f1
	flush	%l7 + 0x24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_638:
	ta	%xcc,	0x4
	array32	%l2,	%o6,	%i0
	ldsb	[%l7 + 0x74],	%o2
	ba,a	%icc,	loop_639
	edge16	%g6,	%i6,	%i7
	udivcc	%o0,	0x03E4,	%g1
	subccc	%i4,	%l3,	%g2
loop_639:
	bvs	%xcc,	loop_640
	bcs,a,pn	%xcc,	loop_641
	fnors	%f28,	%f19,	%f5
	sdivx	%o1,	0x0CCF,	%g3
loop_640:
	fone	%f22
loop_641:
	nop
	set	0x7C, %o0
	swapa	[%l7 + %o0] 0x18,	%i3
	tge	%xcc,	0x5
	std	%f30,	[%l7 + 0x28]
	tn	%xcc,	0x4
	sethi	0x1829,	%o5
	movre	%l4,	%l0,	%i1
	fbul,a	%fcc0,	loop_642
	fandnot1s	%f21,	%f14,	%f15
	or	%o7,	%l6,	%g7
	movvc	%xcc,	%o4,	%l5
loop_642:
	fpadd32s	%f21,	%f22,	%f17
	andncc	%i5,	%o3,	%g5
	te	%xcc,	0x6
	tpos	%icc,	0x5
	tleu	%icc,	0x2
	alignaddrl	%i2,	%g4,	%l2
	fbug	%fcc3,	loop_643
	stw	%l1,	[%l7 + 0x4C]
	addc	%i0,	0x0B6E,	%o6
	array8	%g6,	%o2,	%i6
loop_643:
	or	%o0,	0x1F5A,	%i7
	stbar
	wr	%g0,	0x11,	%asi
	stha	%i4,	[%l7 + 0x24] %asi
	tvc	%icc,	0x6
	fzero	%f22
	bcc,a	%xcc,	loop_644
	fmovdvc	%xcc,	%f24,	%f16
	fpadd16	%f12,	%f22,	%f0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g1,	%g2
loop_644:
	movvs	%xcc,	%l3,	%o1
	edge16ln	%g3,	%i3,	%l4
	movle	%icc,	%o5,	%i1
	fxnors	%f20,	%f14,	%f11
	srlx	%o7,	%l6,	%l0
	nop
	setx	loop_645,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8	%g7,	%o4,	%i5
	std	%f24,	[%l7 + 0x38]
	set	0x10, %i4
	lda	[%l7 + %i4] 0x80,	%f12
loop_645:
	fexpand	%f2,	%f16
	fbuge	%fcc3,	loop_646
	umul	%o3,	0x012D,	%g5
	bn,a	%xcc,	loop_647
	edge32n	%i2,	%g4,	%l2
loop_646:
	fpsub32s	%f19,	%f18,	%f28
	edge8l	%l1,	%l5,	%o6
loop_647:
	tne	%xcc,	0x4
	fbule	%fcc3,	loop_648
	sub	%g6,	0x1D70,	%i0
	brgez,a	%o2,	loop_649
	array16	%o0,	%i7,	%i6
loop_648:
	bne	%icc,	loop_650
	sdivx	%g1,	0x0C6D,	%i4
loop_649:
	orcc	%g2,	0x0577,	%l3
	xnor	%o1,	%i3,	%l4
loop_650:
	movg	%xcc,	%o5,	%i1
	sethi	0x1C90,	%o7
	array8	%g3,	%l6,	%g7
	popc	0x164A,	%o4
	orn	%l0,	0x12A1,	%o3
	fnors	%f9,	%f5,	%f27
	tsubcc	%i5,	%i2,	%g4
	fbu,a	%fcc2,	loop_651
	udiv	%g5,	0x0D72,	%l1
	edge8	%l5,	%l2,	%g6
	bvs,a,pt	%icc,	loop_652
loop_651:
	ble	loop_653
	movl	%icc,	%o6,	%i0
	brnz	%o2,	loop_654
loop_652:
	edge16	%o0,	%i6,	%i7
loop_653:
	nop
	set	0x58, %g1
	lduba	[%l7 + %g1] 0x04,	%i4
loop_654:
	fmovdn	%xcc,	%f6,	%f27
	membar	0x7F
	flush	%l7 + 0x64
	ba,pn	%xcc,	loop_655
	brz,a	%g1,	loop_656
	xnor	%g2,	%o1,	%l3
	fmul8x16au	%f0,	%f15,	%f2
loop_655:
	popc	%l4,	%o5
loop_656:
	nop
	set	0x28, %g7
	lduw	[%l7 + %g7],	%i1
	fmovrdlez	%o7,	%f4,	%f14
	andcc	%g3,	%l6,	%i3
	movgu	%xcc,	%o4,	%g7
	movrgez	%o3,	%i5,	%l0
	mulx	%g4,	%g5,	%l1
	sdivx	%l5,	0x17C5,	%i2
	fmovrdne	%l2,	%f26,	%f8
	add	%g6,	%i0,	%o6
	wr	%g0,	0x11,	%asi
	sta	%f22,	[%l7 + 0x30] %asi
	sdivcc	%o0,	0x01D4,	%o2
	addc	%i7,	0x143C,	%i6
	xnor	%i4,	0x040B,	%g1
	movre	%g2,	0x23C,	%o1
	fmovdvs	%xcc,	%f10,	%f17
	alignaddr	%l3,	%l4,	%i1
	movrgez	%o7,	0x042,	%o5
	mova	%icc,	%l6,	%g3
	bge	loop_657
	udiv	%i3,	0x0C86,	%g7
	umulcc	%o4,	%o3,	%l0
	sir	0x1AFC
loop_657:
	fmovsvc	%xcc,	%f13,	%f7
	edge32n	%g4,	%g5,	%l1
	edge32	%l5,	%i5,	%l2
	sllx	%i2,	%i0,	%o6
	mova	%xcc,	%o0,	%g6
	mulx	%o2,	0x0A8A,	%i6
	fmovdn	%icc,	%f29,	%f27
	andncc	%i4,	%g1,	%g2
	movrlz	%i7,	0x267,	%l3
	orncc	%o1,	%i1,	%o7
	bvc,a	loop_658
	fzeros	%f5
	edge32n	%o5,	%l4,	%g3
	tvs	%icc,	0x6
loop_658:
	movrgez	%l6,	0x329,	%g7
	edge16n	%o4,	%i3,	%o3
	taddcctv	%g4,	0x1750,	%g5
	movrlz	%l1,	0x118,	%l5
	movn	%xcc,	%i5,	%l2
	sllx	%i2,	%i0,	%l0
	stw	%o0,	[%l7 + 0x48]
	ta	%xcc,	0x6
	tn	%xcc,	0x6
	siam	0x0
	fpadd16	%f20,	%f12,	%f24
	xnor	%g6,	0x14F7,	%o2
	movrne	%o6,	%i4,	%g1
	movl	%icc,	%i6,	%g2
	fsrc2	%f22,	%f18
	xorcc	%i7,	%l3,	%o1
	fornot1	%f28,	%f20,	%f26
	faligndata	%f22,	%f8,	%f12
	edge32ln	%i1,	%o7,	%o5
	tge	%xcc,	0x2
	std	%l4,	[%l7 + 0x30]
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x3
	movn	%xcc,	%g7,	%l6
	movleu	%icc,	%i3,	%o3
	fbe	%fcc1,	loop_659
	ldstub	[%l7 + 0x10],	%o4
	orn	%g4,	%l1,	%l5
	fmovsg	%icc,	%f11,	%f9
loop_659:
	movgu	%xcc,	%i5,	%g5
	taddcctv	%l2,	0x07F3,	%i0
	fmovdn	%icc,	%f24,	%f24
	fmovdgu	%icc,	%f5,	%f31
	fmovsg	%xcc,	%f5,	%f15
	brlz,a	%l0,	loop_660
	umulcc	%i2,	%o0,	%o2
	fbe	%fcc0,	loop_661
	smul	%g6,	%i4,	%g1
loop_660:
	edge8ln	%o6,	%g2,	%i6
	sub	%i7,	0x157C,	%l3
loop_661:
	subccc	%o1,	%o7,	%o5
	udivx	%i1,	0x1CC5,	%g3
	udivx	%l4,	0x1E55,	%l6
	xnorcc	%g7,	%i3,	%o4
	fmul8sux16	%f24,	%f22,	%f2
	mulscc	%o3,	0x0729,	%g4
	bvs,a	%icc,	loop_662
	fpadd32s	%f20,	%f9,	%f24
	addc	%l5,	0x1FDD,	%i5
	sethi	0x0C75,	%l1
loop_662:
	edge16l	%g5,	%l2,	%i0
	fbue,a	%fcc0,	loop_663
	ld	[%l7 + 0x6C],	%f3
	fpadd16	%f12,	%f28,	%f20
	fbue,a	%fcc1,	loop_664
loop_663:
	movne	%xcc,	%i2,	%l0
	tvc	%xcc,	0x5
	tcs	%xcc,	0x2
loop_664:
	tn	%icc,	0x1
	edge32ln	%o2,	%o0,	%i4
	set	0x30, %i7
	prefetcha	[%l7 + %i7] 0x89,	 0x1
	fandnot2s	%f15,	%f5,	%f25
	brlez,a	%g1,	loop_665
	mova	%icc,	%o6,	%g2
	move	%xcc,	%i6,	%i7
	fsrc2	%f16,	%f18
loop_665:
	movrgz	%l3,	0x057,	%o1
	umulcc	%o7,	0x070D,	%o5
	udiv	%g3,	0x178C,	%i1
	tn	%icc,	0x3
	tge	%icc,	0x6
	andn	%l6,	0x0654,	%g7
	fexpand	%f13,	%f14
	fsrc2s	%f28,	%f28
	tcc	%xcc,	0x0
	prefetch	[%l7 + 0x7C],	 0x2
	fxors	%f3,	%f15,	%f16
	sllx	%i3,	0x1D,	%l4
	set	0x70, %o3
	ldswa	[%l7 + %o3] 0x10,	%o4
	orcc	%o3,	0x0E95,	%l5
	edge8	%i5,	%g4,	%l1
	subcc	%l2,	%i0,	%i2
	brgez	%g5,	loop_666
	fbuge	%fcc3,	loop_667
	sub	%o2,	%l0,	%o0
	bg,a	%icc,	loop_668
loop_666:
	fcmpeq32	%f18,	%f12,	%g6
loop_667:
	add	%g1,	0x1004,	%i4
	fmovrdlez	%g2,	%f6,	%f20
loop_668:
	tsubcc	%o6,	%i6,	%l3
	movvs	%icc,	%i7,	%o1
	fornot2s	%f24,	%f4,	%f12
	movvs	%xcc,	%o7,	%o5
	tvc	%icc,	0x2
	bcs,pn	%icc,	loop_669
	nop
	set	0x62, %g6
	lduh	[%l7 + %g6],	%g3
	set	0x41, %g4
	lduba	[%l7 + %g4] 0x0c,	%l6
loop_669:
	tg	%xcc,	0x7
	fble,a	%fcc3,	loop_670
	srax	%i1,	%g7,	%i3
	edge16l	%o4,	%l4,	%l5
	edge32ln	%o3,	%i5,	%g4
loop_670:
	te	%icc,	0x3
	bgu	%xcc,	loop_671
	fmul8x16al	%f29,	%f27,	%f18
	fbg,a	%fcc3,	loop_672
	fnot2s	%f13,	%f5
loop_671:
	tge	%icc,	0x6
	fzero	%f12
loop_672:
	fsrc1	%f14,	%f12
	movrgez	%l2,	0x06B,	%l1
	fcmps	%fcc3,	%f12,	%f24
	fbe	%fcc1,	loop_673
	alignaddr	%i2,	%i0,	%g5
	movpos	%icc,	%o2,	%o0
	fcmps	%fcc1,	%f15,	%f0
loop_673:
	tne	%xcc,	0x3
	edge16l	%g6,	%g1,	%l0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g2,	%o6
	fbge,a	%fcc2,	loop_674
	fble	%fcc1,	loop_675
	array32	%i6,	%l3,	%i4
	srlx	%i7,	0x14,	%o1
loop_674:
	sdiv	%o5,	0x09C2,	%g3
loop_675:
	nop
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x3A] %asi,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x60] %asi,	%f26
	fmul8x16	%f20,	%f12,	%f22
	fble	%fcc3,	loop_676
	alignaddr	%i1,	%g7,	%i3
	andncc	%o7,	%o4,	%l4
	edge32n	%l5,	%i5,	%g4
loop_676:
	edge32n	%o3,	%l2,	%l1
	tsubcctv	%i0,	0x085A,	%g5
	srl	%o2,	%o0,	%i2
	fbo	%fcc2,	loop_677
	nop
	set	0x20, %l1
	std	%g0,	[%l7 + %l1]
	umulcc	%g6,	0x119D,	%g2
	faligndata	%f28,	%f8,	%f4
loop_677:
	nop
	set	0x40, %l6
	lduw	[%l7 + %l6],	%l0
	udiv	%i6,	0x0ECD,	%o6
	fsrc1	%f8,	%f30
	fnot1	%f0,	%f26
	tneg	%icc,	0x3
	tleu	%xcc,	0x0
	edge32n	%i4,	%i7,	%o1
	tle	%xcc,	0x4
	membar	0x5B
	fbe	%fcc3,	loop_678
	edge32ln	%l3,	%g3,	%l6
	fble	%fcc2,	loop_679
	alignaddrl	%i1,	%g7,	%i3
loop_678:
	sdivcc	%o5,	0x1C49,	%o7
	lduw	[%l7 + 0x18],	%o4
loop_679:
	tleu	%xcc,	0x1
	be	loop_680
	tcs	%xcc,	0x7
	tpos	%icc,	0x3
	fmul8x16al	%f29,	%f0,	%f6
loop_680:
	andncc	%l4,	%i5,	%l5
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x48] %asi,	%g4
	xor	%o3,	0x1BB9,	%l1
	bneg	loop_681
	movvc	%xcc,	%l2,	%g5
	xor	%o2,	%i0,	%i2
	umul	%o0,	%g6,	%g1
loop_681:
	bshuffle	%f16,	%f0,	%f16
	taddcctv	%g2,	0x1FC5,	%i6
	std	%f30,	[%l7 + 0x18]
	andcc	%l0,	%i4,	%o6
	fmovrslez	%i7,	%f6,	%f4
	std	%l2,	[%l7 + 0x40]
	tgu	%xcc,	0x5
	sub	%g3,	0x0CDA,	%o1
	taddcc	%l6,	0x1887,	%i1
	fmovrdgez	%g7,	%f14,	%f30
	sth	%o5,	[%l7 + 0x6C]
	tneg	%xcc,	0x5
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x75] %asi,	%i3
	fmuld8sux16	%f10,	%f5,	%f4
	tne	%icc,	0x5
	mulscc	%o7,	0x07E9,	%o4
	movl	%icc,	%l4,	%l5
	subcc	%i5,	%g4,	%o3
	addccc	%l1,	0x142E,	%g5
	fnegs	%f14,	%f28
	movrgez	%l2,	%o2,	%i2
	alignaddr	%i0,	%o0,	%g1
	movrgez	%g6,	%g2,	%i6
	fmovs	%f1,	%f9
	fbule,a	%fcc0,	loop_682
	edge16n	%l0,	%o6,	%i7
	stx	%i4,	[%l7 + 0x68]
	fmul8ulx16	%f26,	%f6,	%f6
loop_682:
	array16	%g3,	%o1,	%l6
	movrgz	%i1,	0x0D1,	%l3
	brlez	%o5,	loop_683
	srlx	%g7,	0x02,	%i3
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x62] %asi,	%o4
loop_683:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x70] %asi,	%o6
	ldsb	[%l7 + 0x2A],	%l5
	tg	%xcc,	0x2
	fmovdgu	%icc,	%f16,	%f1
	nop
	setx	loop_684,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnands	%f21,	%f25,	%f10
	fornot2s	%f28,	%f10,	%f3
	bpos	%icc,	loop_685
loop_684:
	tvs	%xcc,	0x5
	fbule	%fcc1,	loop_686
	tsubcc	%l4,	0x0AED,	%i5
loop_685:
	bne,pn	%xcc,	loop_687
	tvs	%xcc,	0x2
loop_686:
	te	%icc,	0x0
	fands	%f1,	%f19,	%f11
loop_687:
	movge	%icc,	%g4,	%l1
	brlez	%g5,	loop_688
	xnorcc	%l2,	0x1465,	%o2
	fmovdle	%icc,	%f16,	%f29
	move	%icc,	%o3,	%i0
loop_688:
	fnot2	%f30,	%f14
	fcmpgt16	%f2,	%f22,	%o0
	set	0x72, %o2
	lduba	[%l7 + %o2] 0x19,	%g1
	taddcc	%g6,	0x1F93,	%i2
	tleu	%icc,	0x2
	movvc	%icc,	%i6,	%l0
	umulcc	%g2,	0x1FD0,	%o6
	movg	%xcc,	%i7,	%g3
	edge8	%o1,	%l6,	%i1
	movne	%icc,	%l3,	%i4
	set	0x44, %o1
	stwa	%g7,	[%l7 + %o1] 0x22
	membar	#Sync
	prefetch	[%l7 + 0x10],	 0x3
	fbne,a	%fcc1,	loop_689
	fmovdg	%icc,	%f31,	%f6
	tge	%xcc,	0x2
	fmovrdne	%i3,	%f20,	%f30
loop_689:
	fmovsle	%xcc,	%f4,	%f22
	bleu,a,pt	%xcc,	loop_690
	sir	0x00B8
	sethi	0x0FC8,	%o4
	sth	%o7,	[%l7 + 0x58]
loop_690:
	ldd	[%l7 + 0x08],	%f14
	std	%f6,	[%l7 + 0x18]
	fpadd32	%f4,	%f18,	%f12
	addccc	%o5,	0x0AA0,	%l4
	fxnor	%f14,	%f16,	%f8
	movle	%xcc,	%i5,	%g4
	popc	0x1E18,	%l5
	edge16	%g5,	%l2,	%l1
	brz,a	%o2,	loop_691
	tl	%icc,	0x1
	bge,a	loop_692
	smul	%i0,	0x1762,	%o3
loop_691:
	fbu,a	%fcc3,	loop_693
	sllx	%g1,	%g6,	%o0
loop_692:
	tpos	%icc,	0x2
	edge8n	%i2,	%l0,	%g2
loop_693:
	brgz	%o6,	loop_694
	fmovdcc	%icc,	%f12,	%f13
	fxnor	%f24,	%f18,	%f18
	array8	%i7,	%i6,	%o1
loop_694:
	edge8ln	%l6,	%i1,	%g3
	pdist	%f28,	%f24,	%f12
	movle	%xcc,	%l3,	%i4
	sdivx	%i3,	0x0D51,	%o4
	fabss	%f19,	%f7
	tgu	%icc,	0x1
	nop
	setx	loop_695,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umulcc	%g7,	%o7,	%o5
	orncc	%i5,	%g4,	%l5
	tcc	%icc,	0x7
loop_695:
	taddcc	%l4,	%l2,	%l1
	tg	%icc,	0x0
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movvs	%xcc,	%o2,	%g5
	taddcctv	%i0,	%g1,	%o3
	srax	%g6,	%o0,	%l0
	fpsub32	%f28,	%f6,	%f20
	xorcc	%i2,	%o6,	%g2
	fbne	%fcc0,	loop_696
	xnor	%i6,	0x0902,	%i7
	edge32l	%o1,	%l6,	%g3
	sth	%l3,	[%l7 + 0x48]
loop_696:
	tg	%icc,	0x5
	movvc	%xcc,	%i4,	%i3
	movrgz	%i1,	0x216,	%g7
	sllx	%o4,	%o5,	%o7
	add	%g4,	0x0228,	%l5
	movle	%xcc,	%l4,	%i5
	nop
	setx	loop_697,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ta	%xcc,	0x3
	movre	%l1,	%o2,	%l2
	tsubcc	%g5,	%i0,	%g1
loop_697:
	movneg	%xcc,	%o3,	%g6
	fmovrse	%l0,	%f22,	%f14
	fbu,a	%fcc0,	loop_698
	ldx	[%l7 + 0x68],	%o0
	sethi	0x063B,	%i2
	ble,a,pn	%xcc,	loop_699
loop_698:
	smul	%o6,	0x15BA,	%g2
	fmovd	%f16,	%f26
	subcc	%i6,	%i7,	%l6
loop_699:
	fmovdleu	%xcc,	%f17,	%f24
	tge	%icc,	0x3
	fmovs	%f13,	%f15
	movg	%xcc,	%o1,	%l3
	movn	%xcc,	%g3,	%i3
	movgu	%xcc,	%i4,	%i1
	bge,pn	%xcc,	loop_700
	array8	%o4,	%o5,	%o7
	xor	%g7,	0x0DDA,	%l5
	fcmpgt32	%f18,	%f16,	%g4
loop_700:
	ldsb	[%l7 + 0x3E],	%l4
	fcmple16	%f6,	%f24,	%i5
	fmovsa	%xcc,	%f6,	%f31
	edge32	%l1,	%l2,	%o2
	alignaddrl	%i0,	%g1,	%g5
	fnand	%f0,	%f30,	%f10
	subccc	%g6,	%l0,	%o0
	fandnot1	%f2,	%f6,	%f24
	subccc	%o3,	0x085D,	%i2
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x0C] %asi,	%o6
	ldub	[%l7 + 0x7C],	%i6
	sdiv	%g2,	0x1560,	%i7
	te	%icc,	0x3
	bge	loop_701
	array8	%l6,	%l3,	%g3
	fbuge	%fcc1,	loop_702
	edge32l	%i3,	%o1,	%i4
loop_701:
	movvc	%icc,	%i1,	%o5
	smulcc	%o4,	%o7,	%l5
loop_702:
	tvc	%xcc,	0x7
	ldub	[%l7 + 0x3E],	%g7
	fornot2s	%f31,	%f9,	%f24
	sdivcc	%g4,	0x08B2,	%i5
	taddcctv	%l4,	0x05F9,	%l1
	tg	%icc,	0x0
	fble,a	%fcc3,	loop_703
	brgz	%o2,	loop_704
	tsubcctv	%l2,	0x1AEB,	%g1
	taddcc	%i0,	0x112F,	%g5
loop_703:
	movrlz	%g6,	%l0,	%o3
loop_704:
	sll	%o0,	%o6,	%i6
	movcc	%xcc,	%i2,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc0,	loop_705
	movg	%icc,	%g2,	%l6
	stw	%l3,	[%l7 + 0x2C]
	movvs	%icc,	%g3,	%o1
loop_705:
	fpack16	%f6,	%f17
	fcmpd	%fcc2,	%f12,	%f6
	mova	%xcc,	%i3,	%i4
	fmul8sux16	%f2,	%f2,	%f10
	edge8ln	%o5,	%o4,	%i1
	movne	%icc,	%o7,	%l5
	bcs,a,pn	%xcc,	loop_706
	fmovse	%xcc,	%f22,	%f8
	wr	%g0,	0x81,	%asi
	stxa	%g4,	[%l7 + 0x58] %asi
loop_706:
	stx	%i5,	[%l7 + 0x08]
	umul	%g7,	%l4,	%l1
	fmovsl	%xcc,	%f4,	%f12
	fnor	%f10,	%f18,	%f22
	ldsw	[%l7 + 0x38],	%l2
	fbe	%fcc0,	loop_707
	edge32l	%g1,	%i0,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o2,	0x1A3D,	%l0
loop_707:
	edge32ln	%o3,	%o0,	%g6
	fbul	%fcc3,	loop_708
	array8	%i6,	%i2,	%i7
	fbl	%fcc1,	loop_709
	tcc	%icc,	0x0
loop_708:
	movge	%icc,	%o6,	%g2
	fmuld8sux16	%f8,	%f0,	%f14
loop_709:
	bcc,pn	%icc,	loop_710
	sdivx	%l6,	0x0FAE,	%g3
	tn	%icc,	0x0
	fbule,a	%fcc3,	loop_711
loop_710:
	fxnors	%f0,	%f10,	%f11
	tl	%xcc,	0x2
	set	0x60, %i3
	ldda	[%l7 + %i3] 0x2c,	%l2
loop_711:
	fbug,a	%fcc1,	loop_712
	tgu	%icc,	0x3
	udivcc	%o1,	0x093E,	%i4
	taddcc	%o5,	0x0700,	%o4
loop_712:
	movl	%icc,	%i1,	%i3
	move	%xcc,	%l5,	%o7
	edge8	%g4,	%i5,	%l4
	sdiv	%g7,	0x1721,	%l2
	fpadd16	%f16,	%f16,	%f16
	sllx	%g1,	0x16,	%i0
	set	0x2C, %g5
	sta	%f5,	[%l7 + %g5] 0x10
	fmovsvc	%icc,	%f10,	%f10
	or	%g5,	%o2,	%l0
	tpos	%xcc,	0x0
	fxors	%f14,	%f6,	%f9
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x78] %asi,	%o3
	lduw	[%l7 + 0x34],	%l1
	faligndata	%f26,	%f30,	%f4
	fmovdge	%icc,	%f28,	%f25
	addcc	%o0,	0x0942,	%i6
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf1,	%f0
	fornot1s	%f5,	%f17,	%f24
	set	0x18, %i6
	lda	[%l7 + %i6] 0x15,	%f15
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x3
	fmovrdlez	%g6,	%f14,	%f2
	movneg	%xcc,	%i7,	%i2
	fbl,a	%fcc1,	loop_713
	brgz,a	%o6,	loop_714
	fmovda	%xcc,	%f28,	%f12
	tleu	%icc,	0x7
loop_713:
	bge,pn	%icc,	loop_715
loop_714:
	fbn,a	%fcc3,	loop_716
	movl	%xcc,	%l6,	%g3
	ldsw	[%l7 + 0x54],	%g2
loop_715:
	fcmpgt32	%f28,	%f6,	%o1
loop_716:
	lduh	[%l7 + 0x6A],	%l3
	fblg,a	%fcc2,	loop_717
	edge8l	%o5,	%o4,	%i4
	te	%icc,	0x5
	addc	%i1,	%l5,	%o7
loop_717:
	fbule	%fcc1,	loop_718
	fcmpeq32	%f4,	%f26,	%i3
	subccc	%i5,	%g4,	%g7
	edge16	%l4,	%l2,	%i0
loop_718:
	faligndata	%f6,	%f14,	%f22
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%o2
	tneg	%xcc,	0x5
	sdivx	%l0,	0x16AF,	%o3
	brz	%l1,	loop_719
	fmovrslz	%o0,	%f24,	%f7
	movrlez	%g5,	%i6,	%i7
	set	0x0C, %l2
	lda	[%l7 + %l2] 0x88,	%f8
loop_719:
	fmovsge	%icc,	%f17,	%f3
	bg,a,pt	%icc,	loop_720
	movrne	%i2,	0x37D,	%o6
	and	%g6,	0x0FEE,	%l6
	or	%g2,	0x1798,	%o1
loop_720:
	umul	%l3,	0x0725,	%o5
	fbo,a	%fcc2,	loop_721
	fbn	%fcc1,	loop_722
	tsubcctv	%o4,	%g3,	%i1
	bleu,a,pt	%icc,	loop_723
loop_721:
	movl	%xcc,	%i4,	%l5
loop_722:
	tge	%icc,	0x1
	add	%o7,	%i5,	%g4
loop_723:
	srax	%g7,	0x15,	%i3
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovrdlz	%l4,	%f8,	%f22
	brgez,a	%i0,	loop_724
	tgu	%xcc,	0x2
	fnegd	%f14,	%f14
	sub	%g1,	%l2,	%l0
loop_724:
	sir	0x097C
	mulscc	%o2,	%o3,	%o0
	edge16n	%g5,	%i6,	%i7
	bleu,a,pn	%xcc,	loop_725
	umul	%l1,	%o6,	%g6
	movrlz	%l6,	0x221,	%g2
	umulcc	%i2,	0x1F15,	%o1
loop_725:
	edge32	%o5,	%o4,	%g3
	edge32	%i1,	%l3,	%l5
	movg	%icc,	%i4,	%i5
	udivx	%g4,	0x10AE,	%o7
	andcc	%i3,	%l4,	%i0
	edge32n	%g7,	%g1,	%l2
	edge32	%l0,	%o3,	%o2
	lduh	[%l7 + 0x18],	%g5
	fbl	%fcc3,	loop_726
	sll	%i6,	%i7,	%o0
	fxnors	%f24,	%f18,	%f13
	sdivx	%l1,	0x0946,	%g6
loop_726:
	subccc	%o6,	0x17E2,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2s	%f26,	%f23
	lduw	[%l7 + 0x3C],	%g2
	fmovsle	%icc,	%f21,	%f28
	movneg	%xcc,	%o1,	%i2
	fcmpne16	%f4,	%f8,	%o4
	movn	%icc,	%o5,	%g3
	ldsb	[%l7 + 0x7D],	%i1
	nop
	set	0x18, %o7
	ldx	[%l7 + %o7],	%l3
	movge	%icc,	%i4,	%i5
	addccc	%l5,	%g4,	%i3
	set	0x64, %g3
	stwa	%o7,	[%l7 + %g3] 0x88
	movrgez	%i0,	%l4,	%g1
	stx	%g7,	[%l7 + 0x38]
	movrgz	%l2,	0x25F,	%o3
	tleu	%icc,	0x6
	addc	%o2,	%l0,	%i6
	movge	%xcc,	%g5,	%o0
	subcc	%l1,	0x0848,	%g6
	fmovd	%f28,	%f24
	tneg	%icc,	0x1
	fands	%f1,	%f6,	%f31
	fba	%fcc1,	loop_727
	edge32	%i7,	%o6,	%l6
	fpack32	%f8,	%f2,	%f22
	movl	%xcc,	%g2,	%i2
loop_727:
	tcs	%xcc,	0x2
	movrlz	%o1,	%o5,	%g3
	tne	%icc,	0x7
	edge16ln	%o4,	%l3,	%i4
	lduw	[%l7 + 0x0C],	%i1
	fsrc2	%f8,	%f18
	fcmpgt32	%f12,	%f0,	%l5
	smul	%g4,	%i5,	%o7
	tl	%xcc,	0x7
	tvs	%icc,	0x4
	fmovsa	%icc,	%f28,	%f3
	mova	%xcc,	%i0,	%i3
	smul	%g1,	0x1F23,	%g7
	movge	%icc,	%l2,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o3,	%o2,	%l0
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x15
	edge32	%i6,	%o0,	%l1
	bleu,pn	%xcc,	loop_728
	movle	%icc,	%g5,	%i7
	brnz,a	%o6,	loop_729
	mulx	%g6,	%l6,	%i2
loop_728:
	sth	%o1,	[%l7 + 0x7E]
	alignaddr	%o5,	%g3,	%g2
loop_729:
	fmovrde	%o4,	%f12,	%f18
	add	%l3,	0x01F0,	%i1
	sdivcc	%l5,	0x078B,	%g4
	subccc	%i4,	0x0F89,	%o7
	fmul8x16au	%f15,	%f14,	%f6
	movpos	%icc,	%i0,	%i3
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x1f,	%f16
	set	0x58, %l3
	stha	%i5,	[%l7 + %l3] 0x0c
	fpmerge	%f26,	%f12,	%f20
	sdivx	%g1,	0x006C,	%l2
	fands	%f20,	%f15,	%f14
	movne	%icc,	%g7,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%l4,	%o2
	membar	0x4B
	fornot2s	%f15,	%f7,	%f27
	sir	0x0E3F
	tcs	%xcc,	0x7
	umul	%l0,	0x0FEB,	%o0
	sll	%i6,	0x0D,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x14] %asi,	%l1
	fmovsvc	%icc,	%f30,	%f1
	subc	%o6,	0x1380,	%g6
	subccc	%l6,	0x0D70,	%i7
	orncc	%i2,	0x1ED7,	%o5
	fmovrsgez	%o1,	%f19,	%f7
	fcmpne16	%f26,	%f2,	%g2
	fmovsneg	%xcc,	%f12,	%f28
	subc	%o4,	0x1968,	%g3
	fba	%fcc2,	loop_730
	ta	%icc,	0x1
	movne	%xcc,	%l3,	%l5
	bvc,pt	%icc,	loop_731
loop_730:
	fbul,a	%fcc2,	loop_732
	fmovd	%f16,	%f0
	umulcc	%g4,	%i1,	%o7
loop_731:
	lduh	[%l7 + 0x6E],	%i0
loop_732:
	ble,a,pn	%xcc,	loop_733
	edge16	%i3,	%i4,	%i5
	fandnot1s	%f12,	%f7,	%f30
	sdiv	%l2,	0x0733,	%g7
loop_733:
	bgu,a,pn	%xcc,	loop_734
	bleu,pn	%icc,	loop_735
	fxnor	%f16,	%f2,	%f0
	tleu	%xcc,	0x6
loop_734:
	movpos	%icc,	%o3,	%g1
loop_735:
	stw	%l4,	[%l7 + 0x60]
	fornot2	%f22,	%f22,	%f12
	prefetch	[%l7 + 0x6C],	 0x1
	udivx	%l0,	0x0D27,	%o0
	st	%f15,	[%l7 + 0x78]
	fxor	%f6,	%f10,	%f6
	fcmple16	%f10,	%f10,	%o2
	srlx	%i6,	%l1,	%o6
	addccc	%g5,	0x097E,	%g6
	movvc	%xcc,	%l6,	%i2
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%o4
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf8,	%f16
	edge32n	%i7,	%o1,	%g2
	bgu,a,pn	%icc,	loop_736
	fpackfix	%f16,	%f29
	movre	%g3,	0x0E7,	%l3
	edge32l	%o4,	%l5,	%g4
loop_736:
	mulscc	%i1,	0x119E,	%i0
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x18,	%f0
	ldx	[%l7 + 0x48],	%o7
	movge	%xcc,	%i4,	%i5
	edge8ln	%l2,	%g7,	%i3
	fmovrdlz	%g1,	%f26,	%f12
	add	%o3,	0x1863,	%l0
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	add	%l4,	%o2,	%o0
	sdivcc	%l1,	0x1A80,	%i6
	edge32ln	%o6,	%g5,	%g6
	fmul8ulx16	%f16,	%f0,	%f12
	stb	%i2,	[%l7 + 0x6E]
	subcc	%o5,	0x0EE1,	%l6
	set	0x24, %l0
	stwa	%i7,	[%l7 + %l0] 0x18
	brz,a	%g2,	loop_737
	fnors	%f29,	%f25,	%f10
	fzeros	%f4
	ta	%icc,	0x3
loop_737:
	tle	%icc,	0x3
	umulcc	%o1,	0x1DA8,	%l3
	edge16ln	%o4,	%g3,	%l5
	addc	%g4,	0x0719,	%i0
	siam	0x7
	fmovrslez	%o7,	%f27,	%f28
	tsubcc	%i4,	%i5,	%l2
	alignaddrl	%i1,	%i3,	%g7
	fors	%f27,	%f24,	%f10
	fmovrdlz	%o3,	%f20,	%f28
	subccc	%l0,	%l4,	%g1
	fmovrdgez	%o0,	%f4,	%f10
	fmovrsne	%o2,	%f22,	%f12
	addcc	%i6,	%l1,	%g5
	std	%g6,	[%l7 + 0x18]
	fornot2s	%f8,	%f19,	%f26
	membar	0x73
	fpsub16	%f26,	%f14,	%f26
	and	%o6,	%i2,	%o5
	array8	%l6,	%i7,	%g2
	bneg,pt	%icc,	loop_738
	smul	%o1,	0x0730,	%l3
	edge8n	%g3,	%l5,	%o4
	xnorcc	%i0,	%g4,	%o7
loop_738:
	fnand	%f10,	%f20,	%f4
	swap	[%l7 + 0x30],	%i5
	edge16l	%i4,	%i1,	%i3
	tvc	%icc,	0x2
	sll	%l2,	0x18,	%g7
	smul	%o3,	0x1A51,	%l0
	tcs	%xcc,	0x7
	te	%icc,	0x7
	ta	%xcc,	0x5
	movrgez	%l4,	0x3CC,	%o0
	nop
	setx	loop_739,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%icc,	%o2,	%g1
	subcc	%i6,	0x0350,	%g5
	xnorcc	%g6,	%l1,	%i2
loop_739:
	fble,a	%fcc1,	loop_740
	tcs	%icc,	0x7
	tgu	%icc,	0x7
	st	%f13,	[%l7 + 0x58]
loop_740:
	tsubcctv	%o5,	0x06D8,	%o6
	bl	loop_741
	fxor	%f10,	%f24,	%f22
	edge8ln	%l6,	%g2,	%o1
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x38] %asi,	%f24
loop_741:
	tleu	%xcc,	0x7
	movge	%xcc,	%i7,	%g3
	fcmpne32	%f16,	%f2,	%l5
	fabss	%f19,	%f18
	taddcc	%o4,	0x0810,	%l3
	udivx	%i0,	0x1609,	%o7
	movvs	%icc,	%g4,	%i4
	movge	%icc,	%i1,	%i3
	bleu,a	loop_742
	fpackfix	%f22,	%f16
	lduw	[%l7 + 0x7C],	%i5
	edge8ln	%l2,	%o3,	%g7
loop_742:
	bn,a,pt	%xcc,	loop_743
	tvs	%xcc,	0x3
	bpos	loop_744
	srlx	%l0,	%l4,	%o0
loop_743:
	movre	%o2,	0x014,	%g1
	tgu	%xcc,	0x4
loop_744:
	tne	%icc,	0x2
	fmovscc	%xcc,	%f23,	%f11
	andn	%i6,	%g6,	%l1
	tne	%icc,	0x7
	subccc	%i2,	%o5,	%o6
	tn	%icc,	0x5
	addc	%l6,	0x1C46,	%g5
	tneg	%icc,	0x7
	movle	%icc,	%g2,	%i7
	pdist	%f8,	%f4,	%f2
	fmovdne	%xcc,	%f0,	%f25
	and	%o1,	0x0565,	%l5
	andncc	%o4,	%g3,	%l3
	umulcc	%i0,	0x0688,	%o7
	fabsd	%f22,	%f14
	mulx	%g4,	%i4,	%i3
	taddcc	%i1,	%l2,	%o3
	fmovsa	%icc,	%f1,	%f23
	tcs	%xcc,	0x2
	fsrc1	%f14,	%f16
	fnot1	%f18,	%f16
	movg	%xcc,	%g7,	%i5
	sdivcc	%l4,	0x1287,	%o0
	fpadd16	%f18,	%f28,	%f6
	edge16ln	%l0,	%g1,	%o2
	bleu	loop_745
	fmovdneg	%xcc,	%f10,	%f10
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i6,	%l1
loop_745:
	tn	%icc,	0x3
	xorcc	%g6,	%i2,	%o6
	fornot1	%f4,	%f2,	%f28
	movneg	%xcc,	%l6,	%o5
	andncc	%g2,	%g5,	%i7
	umulcc	%l5,	0x1B85,	%o1
	std	%g2,	[%l7 + 0x18]
	addc	%o4,	%l3,	%i0
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x6E] %asi,	%o7
	fmovsle	%xcc,	%f14,	%f10
	tgu	%icc,	0x2
	movrlez	%g4,	%i3,	%i1
	fmovsn	%xcc,	%f20,	%f8
	fnor	%f16,	%f4,	%f4
	and	%i4,	%l2,	%o3
	nop
	set	0x40, %l4
	std	%f18,	[%l7 + %l4]
	alignaddr	%i5,	%l4,	%g7
	fzero	%f6
	tsubcc	%o0,	%g1,	%l0
	movvc	%xcc,	%i6,	%o2
	movn	%xcc,	%g6,	%i2
	ldub	[%l7 + 0x5C],	%o6
	fnegs	%f8,	%f20
	movge	%icc,	%l6,	%l1
	subc	%g2,	0x0B57,	%g5
	movneg	%icc,	%o5,	%l5
	edge8n	%i7,	%g3,	%o1
	fba,a	%fcc3,	loop_746
	fand	%f14,	%f6,	%f10
	edge16	%l3,	%i0,	%o7
	fornot1	%f12,	%f26,	%f22
loop_746:
	nop
	set	0x70, %o4
	ldstuba	[%l7 + %o4] 0x81,	%o4
	fxors	%f30,	%f16,	%f16
	movle	%icc,	%i3,	%g4
	edge32l	%i4,	%l2,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f7,	%f6
	edge16	%o3,	%l4,	%g7
	bl,pt	%icc,	loop_747
	fabss	%f31,	%f22
	fnand	%f8,	%f14,	%f22
	edge32l	%i5,	%o0,	%l0
loop_747:
	fmovdleu	%icc,	%f15,	%f25
	xorcc	%g1,	0x1062,	%i6
	sub	%o2,	0x0FCE,	%i2
	tpos	%xcc,	0x5
	fpadd32s	%f28,	%f12,	%f24
	tvc	%icc,	0x2
	udivx	%o6,	0x1202,	%l6
	fmovrse	%l1,	%f3,	%f14
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x18,	%f16
	fxnor	%f16,	%f18,	%f30
	bn,a,pt	%xcc,	loop_748
	fmovda	%xcc,	%f6,	%f25
	fone	%f12
	movre	%g2,	%g5,	%o5
loop_748:
	fands	%f18,	%f14,	%f6
	tcs	%icc,	0x7
	movvc	%xcc,	%g6,	%l5
	tneg	%xcc,	0x5
	bcs,pn	%icc,	loop_749
	fmovdleu	%icc,	%f26,	%f4
	smulcc	%g3,	%o1,	%i7
	srax	%i0,	0x00,	%o7
loop_749:
	bneg,a,pt	%xcc,	loop_750
	fcmpgt32	%f28,	%f26,	%l3
	st	%f26,	[%l7 + 0x5C]
	fnors	%f9,	%f6,	%f1
loop_750:
	edge16n	%i3,	%g4,	%o4
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x0E] %asi,	%l2
	fnor	%f16,	%f14,	%f6
	umulcc	%i4,	0x09E2,	%i1
	set	0x24, %o5
	lduwa	[%l7 + %o5] 0x11,	%l4
	edge32l	%g7,	%i5,	%o3
	set	0x48, %i4
	stha	%l0,	[%l7 + %i4] 0xea
	membar	#Sync
	fmovdcc	%icc,	%f3,	%f23
	fxor	%f8,	%f18,	%f10
	bcs	loop_751
	umul	%g1,	0x1C6D,	%o0
	taddcc	%o2,	%i6,	%i2
	udivx	%l6,	0x1D6C,	%o6
loop_751:
	fsrc1s	%f29,	%f2
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tg	%xcc,	0x4
	sir	0x183F
	subccc	%l1,	%g5,	%o5
	bgu,pt	%xcc,	loop_752
	bcs,a,pt	%icc,	loop_753
	or	%g6,	0x1B32,	%g2
	prefetch	[%l7 + 0x7C],	 0x3
loop_752:
	fbule,a	%fcc1,	loop_754
loop_753:
	and	%g3,	%l5,	%o1
	edge8ln	%i7,	%i0,	%l3
	brz	%i3,	loop_755
loop_754:
	srax	%o7,	%g4,	%l2
	stw	%o4,	[%l7 + 0x64]
	alignaddr	%i1,	%l4,	%g7
loop_755:
	fbug,a	%fcc0,	loop_756
	fmovdne	%icc,	%f23,	%f24
	bleu,a,pt	%xcc,	loop_757
	nop
	set	0x50, %g1
	prefetch	[%l7 + %g1],	 0x2
loop_756:
	movleu	%icc,	%i4,	%o3
	fmovsgu	%xcc,	%f3,	%f16
loop_757:
	udivx	%l0,	0x0122,	%i5
	sll	%g1,	%o2,	%i6
	edge32	%o0,	%l6,	%o6
	fpack16	%f10,	%f16
	tsubcctv	%i2,	%g5,	%l1
	movpos	%icc,	%g6,	%o5
	fcmped	%fcc2,	%f10,	%f30
	brz,a	%g2,	loop_758
	faligndata	%f26,	%f6,	%f30
	stw	%g3,	[%l7 + 0x48]
	edge16	%l5,	%o1,	%i7
loop_758:
	fba,a	%fcc3,	loop_759
	tsubcctv	%i0,	0x0C05,	%l3
	fors	%f3,	%f21,	%f29
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_759:
	add	%i3,	0x0779,	%o7
	umul	%l2,	0x04E3,	%o4
	tsubcctv	%g4,	%i1,	%g7
	movrgz	%i4,	%l4,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i5,	%g1,	%l0
	brlez,a	%i6,	loop_760
	fnot2	%f10,	%f0
	fmovrdgez	%o0,	%f2,	%f0
	fba	%fcc2,	loop_761
loop_760:
	fxors	%f9,	%f8,	%f17
	tge	%xcc,	0x4
	edge16ln	%o2,	%l6,	%o6
loop_761:
	tpos	%icc,	0x3
	fmul8x16al	%f29,	%f21,	%f4
	ta	%icc,	0x5
	sth	%g5,	[%l7 + 0x56]
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x64] %asi,	%i2
	fcmpgt32	%f12,	%f22,	%g6
	stbar
	edge32	%l1,	%g2,	%g3
	alignaddr	%o5,	%o1,	%l5
	fcmpgt16	%f14,	%f10,	%i0
	edge8ln	%l3,	%i3,	%o7
	fpsub16s	%f23,	%f5,	%f12
	bgu	loop_762
	bne,a	%icc,	loop_763
	movrgz	%i7,	%o4,	%l2
	fsrc1	%f24,	%f30
loop_762:
	fabss	%f28,	%f30
loop_763:
	tg	%icc,	0x0
	set	0x30, %o0
	stda	%g4,	[%l7 + %o0] 0x2b
	membar	#Sync
	ldsb	[%l7 + 0x7F],	%g7
	stbar
	fornot1s	%f20,	%f20,	%f9
	sll	%i1,	0x0D,	%i4
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x60] %asi,	%l4
	addc	%i5,	0x015A,	%g1
	fbuge,a	%fcc2,	loop_764
	edge16ln	%l0,	%i6,	%o0
	edge32n	%o3,	%o2,	%l6
	sdivcc	%o6,	0x0B77,	%g5
loop_764:
	fbge	%fcc1,	loop_765
	fbn	%fcc0,	loop_766
	movg	%icc,	%g6,	%i2
	edge16	%l1,	%g2,	%o5
loop_765:
	nop
	wr	%g0,	0x04,	%asi
	stba	%o1,	[%l7 + 0x75] %asi
loop_766:
	ld	[%l7 + 0x70],	%f5
	array16	%g3,	%i0,	%l5
	edge32n	%l3,	%o7,	%i7
	fors	%f17,	%f2,	%f25
	movleu	%xcc,	%o4,	%i3
	fmovsne	%xcc,	%f31,	%f14
	fbul	%fcc0,	loop_767
	andn	%g4,	0x14DD,	%l2
	movge	%xcc,	%g7,	%i4
	edge8	%l4,	%i5,	%i1
loop_767:
	fornot2	%f8,	%f8,	%f20
	fmovdvs	%xcc,	%f2,	%f11
	fnot1s	%f31,	%f22
	stx	%g1,	[%l7 + 0x20]
	movrlz	%l0,	%i6,	%o3
	fandnot2s	%f11,	%f19,	%f25
	movg	%xcc,	%o0,	%o2
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%o6
	smulcc	%l6,	%g6,	%i2
	wr	%g0,	0x18,	%asi
	stxa	%g5,	[%l7 + 0x58] %asi
	fmovsvc	%xcc,	%f22,	%f14
	fmovrsgz	%l1,	%f28,	%f17
	srax	%o5,	0x17,	%g2
	siam	0x3
	fmovsneg	%xcc,	%f2,	%f24
	fandnot2s	%f14,	%f30,	%f12
	andcc	%o1,	0x1825,	%g3
	addccc	%i0,	%l3,	%o7
	fmovsge	%icc,	%f31,	%f10
	udiv	%i7,	0x13A6,	%l5
	fmovdvs	%icc,	%f30,	%f28
	movvc	%icc,	%i3,	%o4
	tneg	%xcc,	0x4
	movpos	%xcc,	%l2,	%g4
	srlx	%i4,	0x17,	%l4
	fmovsleu	%icc,	%f23,	%f4
	ldx	[%l7 + 0x50],	%g7
	bleu,a	%xcc,	loop_768
	fmovsle	%icc,	%f22,	%f19
	movgu	%icc,	%i1,	%i5
	wr	%g0,	0x19,	%asi
	stha	%g1,	[%l7 + 0x3A] %asi
loop_768:
	fmovse	%icc,	%f10,	%f1
	sdiv	%l0,	0x0121,	%o3
	bcc,a,pn	%icc,	loop_769
	array32	%i6,	%o2,	%o6
	srl	%o0,	%l6,	%g6
	alignaddr	%i2,	%l1,	%o5
loop_769:
	addc	%g5,	0x1870,	%g2
	edge16n	%g3,	%o1,	%l3
	fblg	%fcc2,	loop_770
	tl	%icc,	0x4
	andcc	%i0,	0x0445,	%o7
	addcc	%i7,	%i3,	%l5
loop_770:
	sllx	%l2,	0x1C,	%o4
	alignaddrl	%g4,	%i4,	%l4
	fmovdcs	%xcc,	%f10,	%f13
	fmovd	%f8,	%f2
	alignaddrl	%i1,	%g7,	%g1
	ldsb	[%l7 + 0x37],	%l0
	movg	%xcc,	%i5,	%i6
	fpsub16s	%f23,	%f24,	%f20
	addcc	%o3,	0x0B18,	%o2
	movg	%icc,	%o6,	%l6
	bvc,pn	%xcc,	loop_771
	edge32n	%o0,	%g6,	%i2
	fandnot2s	%f6,	%f12,	%f10
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x20] %asi,	%o5
loop_771:
	tsubcc	%l1,	0x0717,	%g5
	udivx	%g3,	0x0BA7,	%g2
	mulscc	%o1,	0x0AD2,	%i0
	be,pn	%xcc,	loop_772
	taddcctv	%l3,	0x0735,	%i7
	orn	%o7,	%i3,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_772:
	fmovdg	%icc,	%f6,	%f16
	edge8l	%l2,	%o4,	%g4
	movrne	%i4,	%i1,	%l4
	sub	%g7,	%l0,	%i5
	fbug	%fcc0,	loop_773
	bleu,a	%xcc,	loop_774
	movneg	%xcc,	%g1,	%i6
	move	%xcc,	%o3,	%o2
loop_773:
	movrgz	%o6,	%l6,	%o0
loop_774:
	taddcctv	%g6,	%i2,	%l1
	fzero	%f24
	set	0x3C, %i7
	stwa	%o5,	[%l7 + %i7] 0x14
	std	%f28,	[%l7 + 0x68]
	movneg	%xcc,	%g3,	%g5
	fcmpne16	%f4,	%f24,	%g2
	umulcc	%o1,	0x0AA5,	%l3
	tge	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f13,	%f1,	%f10
	tneg	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc1,	%f11,	%f20
	movrgz	%i7,	0x3AB,	%o7
	movgu	%xcc,	%i3,	%l5
	sethi	0x07AA,	%l2
	set	0x6C, %g6
	swapa	[%l7 + %g6] 0x89,	%o4
	movrgz	%g4,	%i4,	%i0
	te	%xcc,	0x5
	fpadd32	%f8,	%f12,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x48, %g4
	prefetcha	[%l7 + %g4] 0x10,	 0x3
	ldsw	[%l7 + 0x58],	%g7
	fpsub32	%f4,	%f18,	%f10
	tge	%xcc,	0x7
	sir	0x1EE8
	lduw	[%l7 + 0x64],	%l0
	fnot1	%f20,	%f18
	brz	%i1,	loop_775
	edge16	%g1,	%i5,	%i6
	brnz	%o2,	loop_776
	sir	0x048E
loop_775:
	sdivx	%o3,	0x1F67,	%l6
	tleu	%icc,	0x7
loop_776:
	edge16	%o6,	%o0,	%i2
	nop
	setx loop_777, %l0, %l1
	jmpl %l1, %g6
	sllx	%o5,	0x01,	%l1
	smul	%g5,	%g3,	%o1
	movgu	%icc,	%g2,	%l3
loop_777:
	fblg	%fcc2,	loop_778
	bne,pt	%xcc,	loop_779
	edge8l	%o7,	%i3,	%i7
	movcs	%icc,	%l5,	%o4
loop_778:
	movg	%xcc,	%l2,	%i4
loop_779:
	array8	%i0,	%g4,	%l4
	subccc	%l0,	0x1EF1,	%i1
	movrne	%g1,	%i5,	%i6
	srl	%o2,	0x12,	%o3
	movl	%icc,	%l6,	%o6
	fblg	%fcc0,	loop_780
	addcc	%g7,	0x0C62,	%i2
	fmovsvc	%xcc,	%f28,	%f18
	tsubcctv	%g6,	0x1768,	%o5
loop_780:
	fbue,a	%fcc1,	loop_781
	movge	%xcc,	%o0,	%l1
	fmovrslez	%g5,	%f29,	%f19
	tgu	%xcc,	0x0
loop_781:
	fmovrdgz	%o1,	%f18,	%f16
	wr	%g0,	0x22,	%asi
	stba	%g3,	[%l7 + 0x1E] %asi
	membar	#Sync
	movg	%icc,	%l3,	%o7
	fmovdcc	%xcc,	%f15,	%f19
	fmovd	%f4,	%f4
	subc	%i3,	0x09EA,	%i7
	tpos	%xcc,	0x7
	fpsub16	%f30,	%f8,	%f16
	array16	%l5,	%g2,	%o4
	fsrc2	%f28,	%f6
	fmul8x16	%f1,	%f22,	%f24
	edge32	%i4,	%i0,	%l2
	fmovrse	%g4,	%f11,	%f27
	movl	%xcc,	%l0,	%i1
	set	0x4C, %l1
	lduwa	[%l7 + %l1] 0x18,	%g1
	movne	%xcc,	%i5,	%i6
	edge32n	%o2,	%o3,	%l6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%g7
	set	0x10, %l6
	lduha	[%l7 + %l6] 0x10,	%l4
	andn	%i2,	%o5,	%o0
	bpos	%xcc,	loop_782
	edge32l	%l1,	%g5,	%o1
	orncc	%g6,	%g3,	%o7
	edge32n	%l3,	%i7,	%l5
loop_782:
	nop
	setx loop_783, %l0, %l1
	jmpl %l1, %g2
	andn	%o4,	%i3,	%i4
	wr	%g0,	0x88,	%asi
	stha	%i0,	[%l7 + 0x26] %asi
loop_783:
	movcs	%icc,	%l2,	%g4
	ldsw	[%l7 + 0x20],	%i1
	movre	%l0,	%i5,	%g1
	bgu,pn	%xcc,	loop_784
	movn	%xcc,	%i6,	%o2
	fpsub16	%f6,	%f18,	%f8
	move	%icc,	%o3,	%l6
loop_784:
	movcc	%icc,	%g7,	%l4
	umulcc	%i2,	0x15C6,	%o6
	bcc,a	loop_785
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_786,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subccc	%o0,	%l1,	%o5
loop_785:
	edge32ln	%g5,	%o1,	%g3
	tsubcctv	%g6,	%o7,	%l3
loop_786:
	movvc	%icc,	%l5,	%g2
	nop
	setx	loop_787,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnor	%i7,	0x16A9,	%i3
	ldd	[%l7 + 0x10],	%f26
	mulscc	%o4,	%i4,	%i0
loop_787:
	edge8	%l2,	%i1,	%g4
	fmovsg	%xcc,	%f0,	%f15
	fandnot1	%f8,	%f6,	%f6
	fcmpgt16	%f2,	%f8,	%l0
	fmovrdgz	%g1,	%f0,	%f20
	tpos	%icc,	0x3
	fsrc1s	%f17,	%f25
	movrne	%i5,	%i6,	%o2
	movgu	%icc,	%o3,	%l6
	ble,pt	%xcc,	loop_788
	bvs,pn	%xcc,	loop_789
	call	loop_790
	ble,a,pn	%xcc,	loop_791
loop_788:
	andn	%l4,	%g7,	%o6
loop_789:
	edge16ln	%i2,	%o0,	%o5
loop_790:
	fexpand	%f4,	%f12
loop_791:
	nop
	set	0x10, %o2
	swapa	[%l7 + %o2] 0x10,	%g5
	move	%xcc,	%l1,	%g3
	fblg	%fcc3,	loop_792
	udivx	%g6,	0x08EB,	%o7
	fnot2	%f14,	%f14
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x20] %asi,	%l3
loop_792:
	tpos	%xcc,	0x0
	array32	%l5,	%g2,	%o1
	ld	[%l7 + 0x74],	%f6
	fbg	%fcc2,	loop_793
	sdivx	%i7,	0x1A84,	%o4
	tneg	%xcc,	0x3
	fpadd16	%f26,	%f6,	%f22
loop_793:
	fcmple16	%f18,	%f16,	%i3
	nop
	set	0x3F, %o3
	ldsb	[%l7 + %o3],	%i0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%i1
	and	%i4,	%g4,	%g1
	stx	%i5,	[%l7 + 0x70]
	call	loop_794
	edge8	%l0,	%i6,	%o3
	tn	%icc,	0x1
	fmovs	%f21,	%f8
loop_794:
	ldsb	[%l7 + 0x79],	%o2
	fblg	%fcc2,	loop_795
	call	loop_796
	taddcc	%l4,	%g7,	%o6
	fmovrslez	%l6,	%f31,	%f17
loop_795:
	fmovdle	%icc,	%f3,	%f14
loop_796:
	fcmpgt32	%f6,	%f18,	%i2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%o0,	%g5
	movl	%xcc,	%o5,	%l1
	fmovdleu	%xcc,	%f0,	%f10
	fbe,a	%fcc3,	loop_797
	edge32l	%g6,	%o7,	%g3
	lduh	[%l7 + 0x70],	%l5
	bn	loop_798
loop_797:
	srl	%l3,	0x04,	%g2
	movg	%xcc,	%o1,	%i7
	te	%icc,	0x0
loop_798:
	array32	%i3,	%i0,	%o4
	subccc	%l2,	0x16F3,	%i1
	fmovsl	%icc,	%f0,	%f25
	fcmpd	%fcc2,	%f4,	%f10
	fbue,a	%fcc0,	loop_799
	movcs	%icc,	%g4,	%g1
	fcmpeq32	%f4,	%f4,	%i4
	movgu	%xcc,	%i5,	%i6
loop_799:
	smul	%o3,	%l0,	%o2
	tsubcc	%g7,	%o6,	%l4
	set	0x58, %o1
	stwa	%l6,	[%l7 + %o1] 0x2a
	membar	#Sync
	stw	%o0,	[%l7 + 0x28]
	alignaddr	%g5,	%i2,	%l1
	addccc	%o5,	%o7,	%g6
	fbul,a	%fcc2,	loop_800
	tle	%xcc,	0x1
	fbo,a	%fcc2,	loop_801
	fmovdneg	%icc,	%f3,	%f1
loop_800:
	smul	%g3,	0x0FF5,	%l5
	sdivx	%l3,	0x1966,	%g2
loop_801:
	taddcc	%o1,	%i7,	%i3
	fnegs	%f7,	%f1
	fbne	%fcc0,	loop_802
	edge8l	%o4,	%i0,	%i1
	nop
	setx loop_803, %l0, %l1
	jmpl %l1, %g4
	edge32ln	%l2,	%g1,	%i4
loop_802:
	bne,a	loop_804
	sth	%i6,	[%l7 + 0x2C]
loop_803:
	stb	%o3,	[%l7 + 0x3A]
	movcc	%xcc,	%i5,	%o2
loop_804:
	addcc	%g7,	%l0,	%o6
	movrlez	%l6,	%o0,	%l4
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x73] %asi,	%g5
	wr	%g0,	0x89,	%asi
	stba	%l1,	[%l7 + 0x28] %asi
	fpadd16	%f30,	%f8,	%f12
	add	%i2,	%o7,	%o5
	ldx	[%l7 + 0x28],	%g6
	smul	%g3,	%l3,	%g2
	movleu	%icc,	%o1,	%l5
	srax	%i3,	0x16,	%i7
	edge8ln	%i0,	%i1,	%o4
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x40] %asi,	%l2
	fpsub32s	%f9,	%f29,	%f20
	udivx	%g1,	0x0D9E,	%i4
	fmovsneg	%icc,	%f14,	%f6
	xor	%i6,	0x0B84,	%o3
	fxors	%f19,	%f1,	%f22
	edge8l	%i5,	%g4,	%g7
	edge16l	%l0,	%o6,	%l6
	add	%o2,	%o0,	%g5
	prefetch	[%l7 + 0x44],	 0x1
	fmovrdlz	%l4,	%f12,	%f6
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x18] %asi,	%l1
	movrlz	%o7,	0x074,	%i2
	fblg	%fcc0,	loop_805
	fcmped	%fcc3,	%f2,	%f22
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x58] %asi,	%g6
loop_805:
	popc	%g3,	%o5
	tl	%xcc,	0x1
	bgu,a,pn	%xcc,	loop_806
	fmovrsgz	%l3,	%f6,	%f1
	fpsub16	%f0,	%f4,	%f22
	edge32n	%o1,	%g2,	%l5
loop_806:
	fsrc1	%f6,	%f18
	fpsub16s	%f13,	%f1,	%f21
	edge32ln	%i7,	%i0,	%i1
	addcc	%i3,	%o4,	%g1
	ldd	[%l7 + 0x78],	%l2
	movne	%icc,	%i4,	%i6
	movne	%xcc,	%i5,	%g4
	fbug,a	%fcc2,	loop_807
	mova	%xcc,	%g7,	%l0
	and	%o6,	%o3,	%o2
	bcs,a,pn	%xcc,	loop_808
loop_807:
	brgz,a	%o0,	loop_809
	fba,a	%fcc2,	loop_810
	stw	%g5,	[%l7 + 0x30]
loop_808:
	edge32n	%l4,	%l1,	%o7
loop_809:
	fmovsvs	%xcc,	%f13,	%f8
loop_810:
	edge16l	%l6,	%i2,	%g6
	stb	%o5,	[%l7 + 0x7B]
	fbne,a	%fcc0,	loop_811
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x2
	te	%icc,	0x6
loop_811:
	fmovsl	%xcc,	%f17,	%f2
	fand	%f14,	%f0,	%f6
	bneg,a,pn	%icc,	loop_812
	fmovsle	%xcc,	%f26,	%f5
	tcc	%icc,	0x7
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_812:
	sub	%g3,	0x1607,	%l3
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x0E] %asi,	%g2
	mulscc	%l5,	0x0072,	%i7
	tvc	%xcc,	0x4
	taddcc	%o1,	0x03D4,	%i1
	fcmpes	%fcc0,	%f15,	%f4
	bgu,a	%xcc,	loop_813
	addccc	%i0,	0x13F4,	%i3
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_813:
	sir	0x1A4A
	std	%o4,	[%l7 + 0x70]
	movgu	%icc,	%g1,	%i4
	sir	0x1851
	edge8	%i6,	%i5,	%l2
	popc	%g7,	%l0
	movrlz	%o6,	%o3,	%g4
	bgu,a,pt	%xcc,	loop_814
	movrlez	%o2,	0x326,	%o0
	fnot1s	%f24,	%f6
	sdivcc	%l4,	0x1D8F,	%l1
loop_814:
	nop
	set	0x6C, %i3
	stwa	%g5,	[%l7 + %i3] 0x11
	sub	%l6,	%o7,	%i2
	subc	%g6,	0x080C,	%o5
	smul	%l3,	%g2,	%g3
	edge32	%l5,	%o1,	%i7
	te	%icc,	0x3
	and	%i0,	0x1228,	%i3
	movneg	%icc,	%i1,	%g1
	movle	%icc,	%o4,	%i4
	fmovda	%icc,	%f25,	%f7
	te	%icc,	0x7
	movrgez	%i5,	%l2,	%g7
	movg	%icc,	%l0,	%o6
	fmovrde	%i6,	%f22,	%f28
	fble,a	%fcc1,	loop_815
	tneg	%icc,	0x2
	tleu	%xcc,	0x5
	fpack32	%f16,	%f28,	%f12
loop_815:
	brlz	%o3,	loop_816
	smulcc	%o2,	0x1116,	%g4
	tsubcc	%l4,	%l1,	%o0
	bne,a	%icc,	loop_817
loop_816:
	sra	%l6,	0x12,	%o7
	movrne	%i2,	0x2D3,	%g5
	or	%o5,	0x0F99,	%l3
loop_817:
	subcc	%g2,	0x0577,	%g6
	brz	%g3,	loop_818
	prefetch	[%l7 + 0x2C],	 0x2
	edge8ln	%l5,	%i7,	%i0
	ldsh	[%l7 + 0x4C],	%i3
loop_818:
	udivcc	%i1,	0x1522,	%o1
	movle	%icc,	%g1,	%i4
	udivx	%o4,	0x19AC,	%l2
	bvs	loop_819
	ba	loop_820
	tneg	%xcc,	0x0
	edge16	%i5,	%l0,	%o6
loop_819:
	movgu	%icc,	%i6,	%g7
loop_820:
	srlx	%o2,	%g4,	%o3
	mova	%xcc,	%l1,	%o0
	sll	%l4,	0x06,	%o7
	movleu	%xcc,	%i2,	%l6
	orncc	%g5,	%o5,	%l3
	edge32ln	%g6,	%g3,	%l5
	tvs	%xcc,	0x0
	brgz,a	%g2,	loop_821
	tgu	%xcc,	0x2
	fmovrde	%i7,	%f14,	%f8
	fnot2s	%f20,	%f23
loop_821:
	nop
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf0,	%f0
	fmovscs	%icc,	%f15,	%f9
	array8	%i3,	%i0,	%i1
	movne	%icc,	%g1,	%o1
	edge16	%i4,	%l2,	%i5
	and	%l0,	%o4,	%o6
	xor	%g7,	0x095A,	%o2
	fmovdge	%icc,	%f28,	%f25
	fmul8x16al	%f22,	%f30,	%f30
	mulscc	%g4,	0x0D00,	%i6
	tcc	%icc,	0x6
	umul	%o3,	0x0DAF,	%l1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x70] %asi,	%o0
	movrlz	%l4,	%i2,	%o7
	movg	%icc,	%g5,	%o5
	sdivx	%l6,	0x1D5C,	%g6
	bcc	loop_822
	brlz,a	%l3,	loop_823
	addccc	%g3,	%g2,	%l5
	fmovs	%f0,	%f5
loop_822:
	fexpand	%f20,	%f6
loop_823:
	ta	%xcc,	0x4
	umul	%i7,	0x198F,	%i3
	fmovdneg	%icc,	%f21,	%f20
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x56] %asi,	%i0
	andn	%g1,	0x07D2,	%i1
	movge	%icc,	%i4,	%l2
	mulx	%i5,	0x111F,	%l0
	fpack32	%f8,	%f12,	%f26
	addc	%o1,	0x1368,	%o4
	fmuld8ulx16	%f10,	%f18,	%f4
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x70] %asi,	%o6
	membar	0x2E
	movrlz	%g7,	%o2,	%g4
	faligndata	%f26,	%f22,	%f2
	brlz	%o3,	loop_824
	stw	%i6,	[%l7 + 0x0C]
	movvs	%xcc,	%l1,	%o0
	edge8	%i2,	%l4,	%g5
loop_824:
	movl	%xcc,	%o5,	%o7
	mova	%icc,	%l6,	%l3
	fmul8sux16	%f12,	%f14,	%f4
	srlx	%g3,	%g6,	%g2
	fornot1	%f24,	%f24,	%f28
	movvs	%icc,	%l5,	%i3
	tg	%icc,	0x7
	smul	%i7,	%g1,	%i0
	brgz,a	%i4,	loop_825
	sllx	%l2,	%i1,	%l0
	andcc	%i5,	0x077A,	%o1
	edge8n	%o6,	%g7,	%o4
loop_825:
	fbuge	%fcc1,	loop_826
	udivx	%o2,	0x0E30,	%o3
	movcs	%xcc,	%g4,	%l1
	andn	%i6,	%o0,	%l4
loop_826:
	tvc	%icc,	0x7
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x2C] %asi,	%f5
	tsubcc	%i2,	%g5,	%o7
	movneg	%icc,	%l6,	%o5
	fbul	%fcc0,	loop_827
	movcs	%icc,	%g3,	%l3
	sra	%g2,	0x06,	%g6
	smulcc	%l5,	%i7,	%g1
loop_827:
	tcs	%xcc,	0x0
	xnorcc	%i0,	0x17ED,	%i3
	subc	%l2,	0x049B,	%i1
	fnot2s	%f22,	%f3
	udivx	%l0,	0x1C11,	%i5
	movcs	%xcc,	%i4,	%o1
	udivx	%o6,	0x07EF,	%g7
	fbue,a	%fcc3,	loop_828
	edge8n	%o2,	%o4,	%g4
	edge32ln	%l1,	%i6,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_828:
	nop
	set	0x6F, %i6
	ldstub	[%l7 + %i6],	%l4
	edge16ln	%i2,	%o0,	%g5
	ldx	[%l7 + 0x10],	%o7
	fcmple32	%f0,	%f20,	%l6
	stb	%g3,	[%l7 + 0x58]
	movrlz	%o5,	0x3C3,	%g2
	sir	0x023C
	for	%f26,	%f2,	%f22
	pdist	%f12,	%f14,	%f20
	tg	%xcc,	0x7
	array16	%l3,	%g6,	%l5
	orn	%i7,	0x0775,	%i0
	movg	%xcc,	%g1,	%i3
	mulscc	%l2,	%i1,	%i5
	bn,pn	%xcc,	loop_829
	movl	%icc,	%i4,	%l0
	bg,pt	%xcc,	loop_830
	array16	%o6,	%g7,	%o1
loop_829:
	xorcc	%o2,	0x0977,	%g4
	fmovsn	%icc,	%f6,	%f5
loop_830:
	nop
	setx loop_831, %l0, %l1
	jmpl %l1, %l1
	udivx	%i6,	0x10CD,	%o3
	move	%icc,	%l4,	%i2
	bl	loop_832
loop_831:
	fmovrdgz	%o0,	%f22,	%f0
	sllx	%o4,	0x1C,	%g5
	st	%f31,	[%l7 + 0x24]
loop_832:
	tg	%icc,	0x6
	tge	%xcc,	0x0
	stw	%o7,	[%l7 + 0x1C]
	fcmpd	%fcc3,	%f4,	%f24
	orncc	%l6,	0x198E,	%o5
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x28] %asi,	%g2
	ldstub	[%l7 + 0x08],	%g3
	srlx	%l3,	0x0F,	%l5
	bn,a,pn	%xcc,	loop_833
	movg	%icc,	%g6,	%i0
	sir	0x0545
	bneg	%icc,	loop_834
loop_833:
	tcs	%icc,	0x0
	fmovsvc	%icc,	%f23,	%f5
	set	0x30, %l2
	swapa	[%l7 + %l2] 0x81,	%g1
loop_834:
	nop
	set	0x7F, %g5
	stba	%i7,	[%l7 + %g5] 0x89
	sdivx	%l2,	0x087A,	%i3
	add	%i5,	0x143D,	%i4
	st	%f2,	[%l7 + 0x1C]
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%i1
	movrlz	%o6,	0x318,	%l0
	wr	%g0,	0x19,	%asi
	stba	%g7,	[%l7 + 0x3E] %asi
	bn,a	loop_835
	mulscc	%o1,	%g4,	%l1
	fmovdl	%icc,	%f18,	%f15
	fbe,a	%fcc2,	loop_836
loop_835:
	sll	%o2,	%o3,	%i6
	movcc	%icc,	%l4,	%i2
	udivcc	%o0,	0x1F8A,	%g5
loop_836:
	bvs,a,pt	%xcc,	loop_837
	te	%xcc,	0x3
	movpos	%icc,	%o7,	%o4
	ble,a,pt	%icc,	loop_838
loop_837:
	fones	%f22
	fbg	%fcc0,	loop_839
	movrgez	%o5,	%g2,	%g3
loop_838:
	srax	%l6,	%l3,	%g6
	bn,a,pt	%icc,	loop_840
loop_839:
	movre	%l5,	0x3E9,	%g1
	move	%xcc,	%i0,	%i7
	set	0x61, %o7
	ldsba	[%l7 + %o7] 0x19,	%i3
loop_840:
	movge	%icc,	%i5,	%l2
	te	%xcc,	0x0
	fcmpes	%fcc0,	%f4,	%f5
	and	%i4,	0x051B,	%o6
	or	%i1,	0x1A1B,	%g7
	fbl	%fcc2,	loop_841
	fmovrdlez	%o1,	%f4,	%f22
	movle	%xcc,	%g4,	%l0
	movleu	%icc,	%o2,	%l1
loop_841:
	tn	%icc,	0x5
	ldub	[%l7 + 0x13],	%o3
	udivx	%l4,	0x0EFF,	%i2
	taddcc	%o0,	0x00DB,	%i6
	call	loop_842
	movcs	%xcc,	%g5,	%o7
	nop
	setx	loop_843,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bg,pt	%xcc,	loop_844
loop_842:
	for	%f28,	%f16,	%f2
	fxnor	%f26,	%f30,	%f26
loop_843:
	fnegs	%f16,	%f16
loop_844:
	nop
	set	0x5E, %g3
	ldsba	[%l7 + %g3] 0x19,	%o4
	movcc	%icc,	%o5,	%g2
	fba,a	%fcc0,	loop_845
	or	%g3,	%l3,	%g6
	edge16l	%l6,	%g1,	%i0
	tpos	%icc,	0x5
loop_845:
	umulcc	%l5,	%i7,	%i5
	subcc	%l2,	%i4,	%i3
	udivx	%i1,	0x0CAC,	%g7
	edge16ln	%o1,	%o6,	%g4
	brgez	%l0,	loop_846
	bge,a	loop_847
	movrlez	%l1,	0x1CE,	%o3
	tge	%icc,	0x3
loop_846:
	fbug,a	%fcc1,	loop_848
loop_847:
	subcc	%o2,	%l4,	%o0
	addccc	%i6,	%g5,	%o7
	edge16ln	%i2,	%o4,	%o5
loop_848:
	movneg	%xcc,	%g3,	%g2
	edge32l	%l3,	%l6,	%g1
	mulscc	%g6,	0x0A33,	%i0
	xnorcc	%l5,	0x1DDF,	%i5
	orcc	%i7,	0x1ED1,	%l2
	fxnors	%f26,	%f15,	%f27
	fmovscs	%xcc,	%f26,	%f19
	fpsub16	%f6,	%f10,	%f24
	tvs	%icc,	0x1
	movcs	%xcc,	%i3,	%i1
	fmovrsgz	%i4,	%f3,	%f0
	fba	%fcc3,	loop_849
	move	%icc,	%o1,	%g7
	tvs	%xcc,	0x1
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x28] %asi,	%g4
loop_849:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] %asi,	%o6,	%l0
	fmul8x16	%f16,	%f22,	%f14
	bvs,a	loop_850
	sir	0x1611
	tgu	%xcc,	0x1
	srlx	%l1,	0x06,	%o2
loop_850:
	udiv	%l4,	0x1FC0,	%o0
	array8	%o3,	%g5,	%o7
	fpadd16	%f20,	%f24,	%f30
	srax	%i2,	0x0E,	%i6
	movn	%icc,	%o5,	%g3
	alignaddrl	%g2,	%o4,	%l6
	movre	%g1,	%g6,	%i0
	movcs	%icc,	%l5,	%l3
	ldsw	[%l7 + 0x30],	%i7
	andncc	%i5,	%l2,	%i1
	tgu	%icc,	0x6
	alignaddrl	%i4,	%i3,	%o1
	xorcc	%g7,	%o6,	%g4
	call	loop_851
	bgu,pn	%icc,	loop_852
	tpos	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_851:
	movg	%xcc,	%l1,	%l0
loop_852:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%l4
	fandnot2	%f12,	%f20,	%f30
	fbe	%fcc3,	loop_853
	te	%icc,	0x2
	subcc	%o3,	0x0890,	%g5
	fnot2	%f24,	%f2
loop_853:
	fcmpeq32	%f18,	%f20,	%o0
	andcc	%o7,	0x1230,	%i6
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	udiv	%i2,	0x1DB4,	%o5
	smulcc	%g3,	0x1643,	%g2
	tge	%xcc,	0x4
	edge16l	%o4,	%g1,	%g6
	nop
	setx loop_854, %l0, %l1
	jmpl %l1, %l6
	brz	%i0,	loop_855
	fsrc1	%f6,	%f14
	fmovdcc	%icc,	%f21,	%f17
loop_854:
	bpos	loop_856
loop_855:
	tge	%icc,	0x5
	srlx	%l3,	0x1B,	%l5
	bgu,a,pt	%icc,	loop_857
loop_856:
	swap	[%l7 + 0x14],	%i7
	udivcc	%i5,	0x13F6,	%i1
	tcc	%icc,	0x7
loop_857:
	udivx	%i4,	0x17D3,	%i3
	movcc	%xcc,	%l2,	%g7
	tn	%xcc,	0x6
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf8,	%f0
	movge	%icc,	%o6,	%o1
	edge32n	%g4,	%l1,	%o2
	movcs	%xcc,	%l0,	%o3
	sdivcc	%l4,	0x1AE2,	%o0
	sir	0x0C37
	tsubcctv	%o7,	0x041D,	%i6
	lduw	[%l7 + 0x2C],	%i2
	tne	%icc,	0x5
	sdivx	%g5,	0x0611,	%g3
	sir	0x183E
	tvc	%icc,	0x2
	tle	%xcc,	0x6
	edge32l	%o5,	%o4,	%g1
	nop
	setx loop_858, %l0, %l1
	jmpl %l1, %g2
	tleu	%icc,	0x2
	fbug,a	%fcc2,	loop_859
	xnorcc	%g6,	%l6,	%l3
loop_858:
	fbuge	%fcc1,	loop_860
	fmovsvs	%icc,	%f6,	%f30
loop_859:
	fbue	%fcc1,	loop_861
	ldx	[%l7 + 0x78],	%l5
loop_860:
	edge32l	%i0,	%i5,	%i1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x19,	%i7,	%i3
loop_861:
	nop
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x3D] %asi,	%i4
	fcmpgt16	%f22,	%f14,	%l2
	sethi	0x0E41,	%o6
	ldd	[%l7 + 0x60],	%g6
	ldub	[%l7 + 0x5E],	%o1
	ble,pn	%xcc,	loop_862
	bge,pt	%xcc,	loop_863
	edge16l	%g4,	%o2,	%l1
	bn,a,pt	%xcc,	loop_864
loop_862:
	udiv	%o3,	0x0F72,	%l4
loop_863:
	fmovsl	%icc,	%f0,	%f15
	fbo,a	%fcc2,	loop_865
loop_864:
	fand	%f14,	%f20,	%f20
	edge32l	%o0,	%o7,	%i6
	subccc	%i2,	0x07D0,	%g5
loop_865:
	fbug,a	%fcc2,	loop_866
	edge16	%g3,	%o5,	%o4
	sdiv	%g1,	0x0EEB,	%g2
	movneg	%icc,	%g6,	%l6
loop_866:
	tne	%xcc,	0x2
	set	0x7C, %l3
	stha	%l0,	[%l7 + %l3] 0x0c
	xor	%l3,	%i0,	%l5
	orcc	%i1,	0x11FF,	%i5
	xorcc	%i3,	%i4,	%i7
	fbue,a	%fcc1,	loop_867
	fpadd32s	%f13,	%f9,	%f13
	mulx	%l2,	0x1BF2,	%o6
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_867:
	orn	%o1,	0x11D5,	%g7
	movneg	%icc,	%o2,	%g4
	srl	%o3,	%l1,	%o0
	bl	%xcc,	loop_868
	tpos	%xcc,	0x3
	popc	%l4,	%i6
	set	0x18, %i0
	sta	%f15,	[%l7 + %i0] 0x04
loop_868:
	taddcctv	%o7,	%g5,	%i2
	prefetch	[%l7 + 0x18],	 0x3
	fbul,a	%fcc3,	loop_869
	std	%f12,	[%l7 + 0x70]
	fcmpd	%fcc1,	%f4,	%f20
	taddcctv	%o5,	%o4,	%g3
loop_869:
	orcc	%g2,	0x15B0,	%g1
	sir	0x1A36
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f31,	%f6,	%f18
	tcc	%xcc,	0x1
	set	0x44, %l5
	stwa	%g6,	[%l7 + %l5] 0x22
	membar	#Sync
	sdivx	%l0,	0x1D0C,	%l3
	fxnors	%f27,	%f16,	%f31
	fmovdcs	%icc,	%f12,	%f24
	ta	%xcc,	0x6
	fmovrse	%i0,	%f21,	%f24
	mulx	%l5,	%l6,	%i1
	taddcctv	%i5,	0x1E04,	%i4
	edge16	%i7,	%l2,	%i3
	movvs	%icc,	%o6,	%g7
	tgu	%xcc,	0x4
	movle	%icc,	%o2,	%o1
	fsrc2	%f10,	%f14
	movl	%icc,	%g4,	%o3
	set	0x7C, %g2
	ldsha	[%l7 + %g2] 0x88,	%l1
	fands	%f18,	%f16,	%f17
	fpadd32	%f4,	%f24,	%f6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l4,	%i6
	tsubcctv	%o7,	0x1B37,	%o0
	tleu	%xcc,	0x1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%i2,	%o5
	edge16l	%g5,	%o4,	%g2
	sir	0x0449
	movpos	%xcc,	%g1,	%g3
	wr	%g0,	0x0c,	%asi
	sta	%f16,	[%l7 + 0x34] %asi
	tvc	%icc,	0x6
	fmovrde	%l0,	%f24,	%f18
	fmovrse	%g6,	%f1,	%f21
	mulx	%i0,	%l5,	%l6
	edge8	%i1,	%i5,	%i4
	orncc	%i7,	%l2,	%i3
	srlx	%o6,	0x03,	%l3
	tsubcc	%g7,	0x1A23,	%o1
	faligndata	%f2,	%f4,	%f0
	mulx	%o2,	0x025C,	%g4
	fbg	%fcc1,	loop_870
	fcmpes	%fcc1,	%f21,	%f12
	addc	%l1,	%o3,	%i6
	movpos	%icc,	%o7,	%o0
loop_870:
	movrlz	%i2,	%l4,	%o5
	ldsb	[%l7 + 0x11],	%g5
	tcc	%icc,	0x3
	fpsub32	%f10,	%f16,	%f14
	brnz	%o4,	loop_871
	mulx	%g1,	%g3,	%l0
	fbn	%fcc1,	loop_872
	fnot1	%f10,	%f12
loop_871:
	fabsd	%f12,	%f20
	andncc	%g6,	%g2,	%l5
loop_872:
	nop
	set	0x3D, %o6
	ldsba	[%l7 + %o6] 0x11,	%l6
	xnor	%i1,	%i5,	%i0
	fmovsvc	%icc,	%f22,	%f22
	tn	%icc,	0x1
	popc	%i4,	%i7
	tneg	%icc,	0x5
	fmovdleu	%xcc,	%f9,	%f18
	movvs	%xcc,	%l2,	%o6
	brlez	%i3,	loop_873
	movrne	%g7,	0x0C0,	%l3
	edge32l	%o2,	%o1,	%g4
	be	loop_874
loop_873:
	movrlez	%l1,	0x043,	%o3
	addcc	%o7,	%i6,	%o0
	fpsub32	%f22,	%f20,	%f8
loop_874:
	te	%xcc,	0x2
	movge	%xcc,	%l4,	%o5
	fmovda	%icc,	%f28,	%f26
	set	0x21, %l4
	lduba	[%l7 + %l4] 0x10,	%i2
	nop
	setx	loop_875,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movneg	%xcc,	%o4,	%g1
	fmul8x16au	%f6,	%f0,	%f6
	sub	%g5,	%g3,	%l0
loop_875:
	stb	%g2,	[%l7 + 0x6E]
	sub	%g6,	%l5,	%l6
	set	0x5F, %o4
	ldstuba	[%l7 + %o4] 0x89,	%i1
	edge8	%i5,	%i0,	%i4
	bne,a,pt	%icc,	loop_876
	xorcc	%l2,	%i7,	%o6
	movge	%xcc,	%g7,	%l3
	and	%o2,	0x0A4A,	%i3
loop_876:
	nop
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x88,	%o0
	set	0x28, %o5
	swapa	[%l7 + %o5] 0x19,	%g4
	fbug,a	%fcc2,	loop_877
	subccc	%o3,	0x1EE3,	%l1
	ldx	[%l7 + 0x60],	%o7
	bgu	%xcc,	loop_878
loop_877:
	xnor	%o0,	%l4,	%i6
	bl,a,pn	%xcc,	loop_879
	fzero	%f30
loop_878:
	movrlz	%i2,	%o4,	%o5
	movle	%xcc,	%g1,	%g3
loop_879:
	subccc	%l0,	%g2,	%g5
	array8	%g6,	%l5,	%l6
	set	0x18, %l0
	prefetcha	[%l7 + %l0] 0x89,	 0x3
	movneg	%xcc,	%i1,	%i0
	movcc	%icc,	%l2,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
	fone	%f26
	fnands	%f2,	%f18,	%f30
	orn	%o6,	0x0C1A,	%i7
	set	0x48, %g1
	stxa	%l3,	[%l7 + %g1] 0x2b
	membar	#Sync
	array8	%g7,	%i3,	%o1
	mulscc	%g4,	%o2,	%l1
	bpos,a,pt	%xcc,	loop_880
	sub	%o7,	%o0,	%o3
	xnorcc	%l4,	%i6,	%i2
	move	%xcc,	%o5,	%g1
loop_880:
	ldd	[%l7 + 0x38],	%o4
	sub	%l0,	%g2,	%g5
	andn	%g6,	0x1CDB,	%l5
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xf9
	membar	#Sync
	movgu	%icc,	%l6,	%i5
	nop
	setx	loop_881,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8	%i1,	%g3,	%l2
	fmovscs	%xcc,	%f0,	%f7
	brlz,a	%i0,	loop_882
loop_881:
	sll	%o6,	%i7,	%l3
	sir	0x0809
	bpos,a,pt	%icc,	loop_883
loop_882:
	and	%g7,	0x1562,	%i3
	tleu	%icc,	0x3
	fbuge,a	%fcc1,	loop_884
loop_883:
	srl	%o1,	0x1A,	%i4
	brgez	%o2,	loop_885
	move	%xcc,	%g4,	%o7
loop_884:
	nop
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x61] %asi,	%l1
loop_885:
	alignaddrl	%o3,	%l4,	%i6
	orn	%o0,	0x15F5,	%o5
	udivcc	%g1,	0x1755,	%i2
	brgez	%o4,	loop_886
	fble	%fcc2,	loop_887
	array32	%l0,	%g2,	%g6
	movre	%g5,	0x188,	%l5
loop_886:
	sub	%l6,	%i1,	%i5
loop_887:
	std	%f16,	[%l7 + 0x70]
	faligndata	%f20,	%f10,	%f2
	edge16ln	%l2,	%g3,	%i0
	edge8	%o6,	%l3,	%g7
	edge8l	%i7,	%i3,	%i4
	movrgez	%o1,	0x3CA,	%g4
	edge32n	%o2,	%o7,	%l1
	fornot2	%f20,	%f0,	%f28
	bg,pt	%icc,	loop_888
	move	%xcc,	%o3,	%l4
	stb	%o0,	[%l7 + 0x31]
	fmovdgu	%xcc,	%f1,	%f22
loop_888:
	umulcc	%o5,	0x04F0,	%g1
	movrlez	%i6,	%i2,	%l0
	membar	0x31
	brz,a	%o4,	loop_889
	faligndata	%f4,	%f10,	%f26
	brz	%g2,	loop_890
	movrne	%g6,	0x1C2,	%g5
loop_889:
	orcc	%l5,	0x104C,	%i1
	set	0x54, %i4
	swapa	[%l7 + %i4] 0x10,	%l6
loop_890:
	subc	%i5,	0x1F91,	%g3
	edge16	%i0,	%l2,	%l3
	sdivx	%o6,	0x0615,	%i7
	tge	%xcc,	0x2
	fbuge,a	%fcc2,	loop_891
	movvs	%icc,	%i3,	%g7
	edge16n	%o1,	%i4,	%g4
	fbne,a	%fcc3,	loop_892
loop_891:
	edge16n	%o7,	%o2,	%o3
	srlx	%l1,	0x01,	%o0
	fmovrdgez	%l4,	%f10,	%f4
loop_892:
	fors	%f13,	%f21,	%f1
	fmovs	%f24,	%f0
	tne	%xcc,	0x5
	stbar
	udivx	%g1,	0x1747,	%o5
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x2D] %asi,	%i6
	call	loop_893
	movrne	%l0,	0x1F1,	%i2
	srax	%g2,	0x15,	%g6
	edge32n	%g5,	%o4,	%l5
loop_893:
	fnot1	%f24,	%f18
	fnot1s	%f29,	%f28
	smul	%i1,	0x1FF7,	%i5
	addcc	%g3,	0x0D55,	%l6
	bvs,a,pt	%xcc,	loop_894
	movrlez	%l2,	%i0,	%o6
	fbge	%fcc1,	loop_895
	tvc	%icc,	0x7
loop_894:
	fcmpgt16	%f22,	%f12,	%l3
	fmovdleu	%icc,	%f6,	%f28
loop_895:
	andcc	%i3,	%g7,	%i7
	and	%i4,	%o1,	%o7
	mova	%xcc,	%o2,	%o3
	tvs	%xcc,	0x3
	ldsw	[%l7 + 0x0C],	%g4
	andcc	%o0,	0x1C71,	%l1
	bl	%icc,	loop_896
	tge	%xcc,	0x4
	taddcc	%g1,	%o5,	%i6
	fmovrslez	%l4,	%f20,	%f9
loop_896:
	sdiv	%i2,	0x1158,	%g2
	set	0x68, %g7
	stxa	%l0,	[%l7 + %g7] 0x22
	membar	#Sync
	xnorcc	%g5,	%o4,	%l5
	set	0x70, %i7
	ldda	[%l7 + %i7] 0x19,	%i0
	flush	%l7 + 0x44
	fble,a	%fcc1,	loop_897
	andcc	%i5,	0x0BC6,	%g6
	ldsh	[%l7 + 0x28],	%l6
	sllx	%g3,	0x13,	%l2
loop_897:
	fbge	%fcc2,	loop_898
	add	%o6,	0x1F07,	%i0
	movne	%xcc,	%i3,	%g7
	movrlez	%l3,	%i4,	%o1
loop_898:
	ldub	[%l7 + 0x7A],	%i7
	bne,pn	%xcc,	loop_899
	edge32	%o7,	%o2,	%g4
	movrlez	%o3,	0x0A7,	%o0
	edge8n	%g1,	%o5,	%i6
loop_899:
	edge16	%l1,	%i2,	%l4
	fcmpeq32	%f0,	%f28,	%g2
	fmovsne	%xcc,	%f26,	%f8
	tge	%icc,	0x5
	subccc	%g5,	%l0,	%l5
	fpsub16s	%f25,	%f4,	%f16
	fmovrdlz	%o4,	%f6,	%f12
	movvs	%xcc,	%i5,	%i1
	fcmple16	%f6,	%f30,	%l6
	fmovsle	%icc,	%f8,	%f27
	tvc	%icc,	0x6
	sethi	0x0FA9,	%g6
	fbge,a	%fcc2,	loop_900
	fcmpgt16	%f20,	%f2,	%l2
	fandnot1s	%f4,	%f15,	%f18
	fbuge	%fcc1,	loop_901
loop_900:
	ldx	[%l7 + 0x30],	%g3
	st	%f2,	[%l7 + 0x7C]
	flush	%l7 + 0x64
loop_901:
	faligndata	%f0,	%f10,	%f4
	fmovdpos	%xcc,	%f30,	%f9
	srlx	%i0,	0x0A,	%o6
	tpos	%icc,	0x6
	movneg	%xcc,	%i3,	%g7
	movre	%l3,	0x14F,	%o1
	ld	[%l7 + 0x2C],	%f19
	fcmpne16	%f28,	%f12,	%i4
	fbue,a	%fcc2,	loop_902
	stw	%i7,	[%l7 + 0x10]
	orncc	%o7,	0x14AF,	%o2
	fbge,a	%fcc1,	loop_903
loop_902:
	edge16ln	%g4,	%o3,	%g1
	movrlez	%o5,	0x36C,	%o0
	tl	%icc,	0x1
loop_903:
	sir	0x0127
	fbug,a	%fcc0,	loop_904
	array16	%l1,	%i2,	%l4
	tvs	%xcc,	0x7
	tvs	%xcc,	0x1
loop_904:
	orcc	%i6,	0x00A0,	%g5
	tge	%xcc,	0x6
	array16	%g2,	%l0,	%o4
	brlez,a	%i5,	loop_905
	fmovsvs	%xcc,	%f6,	%f24
	fpmerge	%f24,	%f19,	%f14
	bvc	loop_906
loop_905:
	or	%i1,	%l6,	%g6
	addcc	%l2,	%l5,	%g3
	orcc	%i0,	0x0B6D,	%i3
loop_906:
	bvs,pn	%xcc,	loop_907
	movcc	%icc,	%g7,	%o6
	set	0x8, %g6
	stxa	%o1,	[%g0 + %g6] 0x4f
loop_907:
	array8	%i4,	%i7,	%o7
	ldx	[%l7 + 0x78],	%l3
	ta	%icc,	0x7
	movne	%xcc,	%o2,	%g4
	xnor	%o3,	%o5,	%g1
	edge8n	%l1,	%o0,	%i2
	stx	%i6,	[%l7 + 0x38]
	fcmpne32	%f18,	%f24,	%g5
	bpos,a,pt	%xcc,	loop_908
	movcs	%xcc,	%g2,	%l4
	andncc	%o4,	%l0,	%i1
	bgu,a,pn	%xcc,	loop_909
loop_908:
	fblg,a	%fcc2,	loop_910
	fmovsl	%xcc,	%f27,	%f8
	ba,pt	%xcc,	loop_911
loop_909:
	addcc	%i5,	0x12E0,	%l6
loop_910:
	edge16n	%l2,	%g6,	%l5
	fpadd32s	%f14,	%f17,	%f19
loop_911:
	array16	%i0,	%i3,	%g7
	brgez,a	%o6,	loop_912
	xnor	%g3,	0x16FF,	%o1
	fmovrse	%i7,	%f7,	%f8
	udiv	%i4,	0x04DC,	%o7
loop_912:
	tvs	%xcc,	0x3
	umulcc	%o2,	0x0674,	%l3
	membar	0x37
	orncc	%o3,	0x086E,	%o5
	sdivx	%g4,	0x0CFA,	%l1
	movpos	%icc,	%o0,	%i2
	movvs	%xcc,	%i6,	%g1
	edge32n	%g5,	%l4,	%o4
	bcs,a,pn	%xcc,	loop_913
	fcmpne32	%f8,	%f24,	%l0
	fnegd	%f12,	%f4
	movgu	%icc,	%g2,	%i5
loop_913:
	sdivx	%i1,	0x005B,	%l6
	wr	%g0,	0x81,	%asi
	stha	%l2,	[%l7 + 0x5E] %asi
	bvs,pn	%xcc,	loop_914
	te	%xcc,	0x6
	and	%g6,	%l5,	%i3
	fandnot1s	%f18,	%f29,	%f1
loop_914:
	edge8ln	%i0,	%g7,	%g3
	movre	%o1,	%i7,	%o6
	fmovdpos	%xcc,	%f16,	%f2
	fmovdl	%icc,	%f19,	%f22
	movrlz	%i4,	%o2,	%o7
	taddcc	%o3,	0x1523,	%l3
	fnors	%f20,	%f8,	%f19
	set	0x4C, %g4
	swapa	[%l7 + %g4] 0x0c,	%o5
	fxnors	%f26,	%f25,	%f19
	fmovdn	%xcc,	%f3,	%f22
	fnegs	%f8,	%f1
	tvs	%icc,	0x6
	and	%l1,	%g4,	%o0
	srax	%i6,	0x1D,	%i2
	taddcctv	%g1,	0x15B0,	%l4
	edge8n	%g5,	%l0,	%g2
	movvs	%icc,	%o4,	%i5
	andcc	%l6,	0x1E4B,	%l2
	bcc,pn	%xcc,	loop_915
	udivcc	%i1,	0x0A4F,	%l5
	orn	%i3,	%g6,	%i0
	taddcc	%g7,	%g3,	%o1
loop_915:
	fmovsl	%xcc,	%f3,	%f15
	movcs	%icc,	%o6,	%i4
	edge32	%i7,	%o7,	%o2
	orn	%l3,	0x0B1C,	%o5
	fmovdge	%xcc,	%f24,	%f3
	fbuge,a	%fcc3,	loop_916
	fble	%fcc1,	loop_917
	brlez	%l1,	loop_918
	movleu	%xcc,	%g4,	%o3
loop_916:
	stx	%i6,	[%l7 + 0x20]
loop_917:
	movl	%icc,	%o0,	%i2
loop_918:
	fmovsle	%xcc,	%f25,	%f4
	xorcc	%g1,	%g5,	%l0
	fbug	%fcc2,	loop_919
	tg	%xcc,	0x0
	fmovrsgez	%l4,	%f13,	%f9
	edge16l	%o4,	%g2,	%l6
loop_919:
	tl	%icc,	0x2
	xorcc	%i5,	0x0DAE,	%i1
	fmul8ulx16	%f26,	%f30,	%f22
	lduh	[%l7 + 0x72],	%l5
	smul	%l2,	%i3,	%i0
	tn	%icc,	0x1
	tn	%icc,	0x1
	fcmpgt16	%f18,	%f4,	%g6
	fpsub32s	%f14,	%f5,	%f22
	addc	%g3,	%g7,	%o1
	lduh	[%l7 + 0x1E],	%o6
	tvs	%xcc,	0x1
	edge32n	%i7,	%o7,	%o2
	fnot2s	%f14,	%f31
	bne	loop_920
	fpsub32	%f16,	%f14,	%f24
	bl	loop_921
	fmovdvs	%xcc,	%f17,	%f15
loop_920:
	edge32l	%l3,	%i4,	%o5
	tle	%icc,	0x0
loop_921:
	nop
	set	0x74, %l6
	lduw	[%l7 + %l6],	%g4
	orncc	%o3,	0x1FCE,	%i6
	sll	%o0,	%l1,	%i2
	sir	0x0D47
	fmovsvc	%xcc,	%f11,	%f3
	xnor	%g1,	%l0,	%g5
	udivx	%l4,	0x0F97,	%o4
	movle	%xcc,	%g2,	%l6
	tn	%icc,	0x4
	add	%i1,	0x17B0,	%i5
	fone	%f28
	movle	%icc,	%l2,	%l5
	brnz	%i0,	loop_922
	fcmpd	%fcc3,	%f6,	%f4
	prefetch	[%l7 + 0x54],	 0x3
	mulx	%i3,	0x0ACB,	%g6
loop_922:
	tneg	%xcc,	0x5
	prefetch	[%l7 + 0x70],	 0x0
	orncc	%g3,	%g7,	%o1
	movg	%xcc,	%i7,	%o7
	movgu	%xcc,	%o6,	%l3
	orcc	%o2,	0x0AB5,	%i4
	tcc	%xcc,	0x0
	nop
	setx loop_923, %l0, %l1
	jmpl %l1, %g4
	movre	%o3,	%i6,	%o0
	sll	%l1,	0x18,	%o5
	ldd	[%l7 + 0x28],	%f26
loop_923:
	tg	%xcc,	0x6
	swap	[%l7 + 0x34],	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x0
	wr	%g0,	0x2f,	%asi
	stxa	%l0,	[%l7 + 0x18] %asi
	membar	#Sync
	edge16ln	%g1,	%g5,	%o4
	fmovrse	%g2,	%f9,	%f1
	sdivcc	%l4,	0x07D4,	%i1
	sllx	%l6,	0x14,	%l2
	fcmpeq16	%f22,	%f22,	%l5
	fcmpne16	%f10,	%f24,	%i0
	fmovde	%icc,	%f0,	%f4
	edge8l	%i3,	%i5,	%g6
	fmovd	%f6,	%f28
	movrgz	%g7,	0x3E3,	%g3
	tvs	%xcc,	0x7
	tleu	%icc,	0x2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x19,	%o1,	%o7
	subcc	%i7,	0x13D1,	%o6
	stx	%o2,	[%l7 + 0x40]
	fnegd	%f6,	%f22
	fmovse	%xcc,	%f15,	%f15
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l3,	0x1054,	%i4
	umul	%g4,	%o3,	%i6
	array32	%l1,	%o5,	%o0
	movl	%icc,	%l0,	%i2
	array32	%g5,	%g1,	%g2
	tl	%icc,	0x3
	srax	%l4,	0x18,	%o4
	ba,a,pt	%icc,	loop_924
	fornot2	%f24,	%f16,	%f28
	movrgez	%l6,	0x2B1,	%l2
	bl	loop_925
loop_924:
	movneg	%icc,	%i1,	%l5
	alignaddr	%i0,	%i5,	%g6
	sth	%i3,	[%l7 + 0x1E]
loop_925:
	move	%xcc,	%g7,	%g3
	tle	%xcc,	0x5
	sra	%o1,	%i7,	%o7
	or	%o6,	%o2,	%i4
	fands	%f3,	%f5,	%f22
	sll	%l3,	%o3,	%i6
	addc	%g4,	0x10ED,	%l1
	move	%xcc,	%o0,	%l0
	fcmple32	%f0,	%f22,	%o5
	sdivcc	%g5,	0x0047,	%i2
	ldsw	[%l7 + 0x28],	%g1
	udiv	%l4,	0x13A2,	%o4
	array8	%g2,	%l2,	%i1
	bvs,pt	%icc,	loop_926
	brnz	%l5,	loop_927
	bn,a,pt	%xcc,	loop_928
	addccc	%l6,	%i0,	%i5
loop_926:
	sir	0x0B08
loop_927:
	movleu	%icc,	%g6,	%i3
loop_928:
	umulcc	%g3,	%o1,	%i7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x88,	%o7,	%g7
	movrgz	%o6,	%i4,	%o2
	fmovsle	%xcc,	%f16,	%f12
	fpadd16	%f4,	%f0,	%f26
	add	%l3,	%o3,	%g4
	fmul8x16au	%f8,	%f11,	%f14
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x78] %asi,	%i6
	fornot1	%f2,	%f8,	%f12
	set	0x11, %o2
	stba	%l1,	[%l7 + %o2] 0x22
	membar	#Sync
	tcs	%xcc,	0x5
	subcc	%l0,	0x1256,	%o0
	smulcc	%o5,	0x0F5B,	%i2
	tsubcctv	%g5,	%g1,	%l4
	move	%xcc,	%o4,	%g2
	movcs	%xcc,	%i1,	%l2
	srlx	%l5,	0x0B,	%i0
	fcmpne32	%f2,	%f22,	%l6
	fbug	%fcc2,	loop_929
	fbul	%fcc0,	loop_930
	sethi	0x1790,	%g6
	add	%i3,	%i5,	%g3
loop_929:
	fcmpgt32	%f2,	%f26,	%i7
loop_930:
	sll	%o1,	0x19,	%g7
	brgz	%o6,	loop_931
	fxor	%f0,	%f22,	%f20
	edge32l	%o7,	%o2,	%i4
	movrgez	%o3,	0x1B5,	%l3
loop_931:
	tcs	%xcc,	0x1
	move	%icc,	%i6,	%l1
	brlz,a	%l0,	loop_932
	movgu	%icc,	%g4,	%o0
	movrne	%o5,	0x051,	%g5
	fmovsa	%xcc,	%f29,	%f6
loop_932:
	fmovsvc	%icc,	%f11,	%f0
	movn	%xcc,	%g1,	%i2
	movge	%icc,	%o4,	%g2
	andncc	%l4,	%i1,	%l5
	alignaddrl	%l2,	%l6,	%g6
	movre	%i0,	%i5,	%g3
	fbo	%fcc1,	loop_933
	fpack32	%f10,	%f28,	%f2
	smul	%i3,	0x17EC,	%o1
	movrlez	%g7,	0x21E,	%i7
loop_933:
	te	%icc,	0x3
	set	0x7E, %l1
	stba	%o7,	[%l7 + %l1] 0xeb
	membar	#Sync
	brgez	%o2,	loop_934
	movvc	%icc,	%o6,	%o3
	tcc	%xcc,	0x6
	edge8l	%i4,	%i6,	%l1
loop_934:
	fornot2	%f20,	%f12,	%f16
	fsrc2s	%f14,	%f26
	movrlz	%l3,	%g4,	%l0
	orcc	%o5,	0x0F1D,	%g5
	and	%o0,	0x1E23,	%i2
	nop
	setx	loop_935,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movle	%icc,	%g1,	%g2
	array16	%o4,	%l4,	%l5
	fbge	%fcc2,	loop_936
loop_935:
	fbug	%fcc0,	loop_937
	st	%f5,	[%l7 + 0x20]
	andncc	%i1,	%l2,	%l6
loop_936:
	movneg	%xcc,	%g6,	%i0
loop_937:
	sub	%g3,	0x0628,	%i5
	ldd	[%l7 + 0x08],	%o0
	movrgez	%i3,	0x21C,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f11,	%f18,	%f4
	fand	%f28,	%f22,	%f10
	andn	%g7,	%o7,	%o2
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x20] %asi,	%o6
	fmuld8sux16	%f14,	%f6,	%f18
	fmovrdlz	%o3,	%f6,	%f18
	bl,pn	%icc,	loop_938
	nop
	setx	loop_939,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bl	loop_940
	lduw	[%l7 + 0x6C],	%i4
loop_938:
	tneg	%xcc,	0x0
loop_939:
	movcs	%xcc,	%i6,	%l3
loop_940:
	umulcc	%l1,	%l0,	%g4
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x50] %asi,	%g5
	brlz,a	%o5,	loop_941
	ta	%icc,	0x5
	fpmerge	%f13,	%f14,	%f24
	lduw	[%l7 + 0x20],	%i2
loop_941:
	bvs,pn	%icc,	loop_942
	tcs	%xcc,	0x7
	edge8l	%g1,	%o0,	%o4
	nop
	setx	loop_943,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_942:
	subccc	%l4,	0x15A4,	%g2
	fmuld8sux16	%f5,	%f9,	%f6
	edge16ln	%l5,	%l2,	%i1
loop_943:
	ble	loop_944
	fsrc1	%f2,	%f24
	fmovsle	%icc,	%f12,	%f7
	wr	%g0,	0x10,	%asi
	stwa	%l6,	[%l7 + 0x20] %asi
loop_944:
	edge8n	%i0,	%g3,	%g6
	edge16n	%i5,	%i3,	%o1
	movre	%i7,	%o7,	%o2
	sethi	0x1D06,	%o6
	fsrc2	%f4,	%f2
	movrgez	%o3,	%i4,	%g7
	fmovscc	%xcc,	%f12,	%f27
	add	%l3,	0x0BE9,	%i6
	brlez	%l0,	loop_945
	sllx	%g4,	0x03,	%g5
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x58] %asi,	%o5
loop_945:
	addc	%l1,	%i2,	%g1
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x118] %asi,	%o0
	fabsd	%f4,	%f26
	tgu	%xcc,	0x1
	fbge,a	%fcc3,	loop_946
	sethi	0x1DC4,	%l4
	fcmpgt32	%f14,	%f24,	%g2
	fnand	%f10,	%f28,	%f10
loop_946:
	sdiv	%l5,	0x1910,	%o4
	prefetch	[%l7 + 0x50],	 0x2
	fmovsvs	%xcc,	%f30,	%f5
	move	%xcc,	%l2,	%l6
	bl,pt	%icc,	loop_947
	bleu,a	%xcc,	loop_948
	fornot2s	%f7,	%f3,	%f10
	srl	%i0,	0x0D,	%g3
loop_947:
	movleu	%xcc,	%i1,	%g6
loop_948:
	movrlez	%i3,	%o1,	%i7
	edge32n	%i5,	%o2,	%o6
	fmovrdlz	%o7,	%f18,	%f18
	fzero	%f24
	set	0x78, %o3
	stwa	%o3,	[%l7 + %o3] 0x2b
	membar	#Sync
	brnz,a	%g7,	loop_949
	movvs	%icc,	%l3,	%i4
	mulscc	%i6,	%g4,	%g5
	fbule	%fcc2,	loop_950
loop_949:
	fcmpeq32	%f10,	%f18,	%l0
	tg	%xcc,	0x6
	edge8n	%o5,	%i2,	%l1
loop_950:
	sdivx	%o0,	0x103C,	%g1
	edge32	%g2,	%l4,	%l5
	fmovrsgez	%l2,	%f11,	%f27
	fmovsleu	%xcc,	%f18,	%f1
	movvc	%icc,	%o4,	%i0
	sll	%l6,	%g3,	%g6
	fmovrde	%i1,	%f30,	%f6
	edge16n	%o1,	%i3,	%i7
	tge	%xcc,	0x5
	popc	0x0CAC,	%i5
	sdivx	%o6,	0x1182,	%o2
	fmovdvc	%icc,	%f29,	%f15
	smul	%o7,	%g7,	%l3
	movcc	%icc,	%i4,	%o3
	ta	%icc,	0x2
	tn	%icc,	0x1
	movg	%xcc,	%g4,	%g5
	taddcctv	%i6,	%o5,	%l0
	movrlez	%l1,	0x140,	%o0
	movpos	%icc,	%i2,	%g2
	edge8l	%g1,	%l5,	%l4
	umul	%l2,	%i0,	%l6
	or	%g3,	%o4,	%g6
	for	%f28,	%f24,	%f8
	tneg	%icc,	0x2
	mova	%xcc,	%o1,	%i3
	fmul8x16au	%f7,	%f15,	%f0
	srl	%i1,	0x17,	%i5
	fnor	%f18,	%f8,	%f24
	ta	%xcc,	0x3
	edge8n	%o6,	%o2,	%i7
	tl	%icc,	0x0
	fbuge	%fcc3,	loop_951
	mulx	%g7,	%o7,	%l3
	xor	%o3,	%g4,	%i4
	ld	[%l7 + 0x10],	%f18
loop_951:
	andcc	%g5,	%i6,	%o5
	movvc	%icc,	%l1,	%l0
	tn	%icc,	0x0
	ldd	[%l7 + 0x30],	%f2
	membar	0x57
	taddcctv	%i2,	0x00DD,	%o0
	fmovs	%f9,	%f29
	taddcc	%g2,	0x0C86,	%l5
	stbar
	set	0x28, %o1
	sta	%f16,	[%l7 + %o1] 0x19
	fpack32	%f8,	%f10,	%f20
	sdivx	%l4,	0x1B4E,	%g1
	fbue,a	%fcc0,	loop_952
	std	%l2,	[%l7 + 0x28]
	edge8ln	%i0,	%l6,	%o4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x04,	%g6,	%g3
loop_952:
	fpack16	%f10,	%f16
	fcmpd	%fcc2,	%f10,	%f30
	srax	%o1,	%i3,	%i5
	tsubcctv	%o6,	%o2,	%i7
	fcmpd	%fcc2,	%f6,	%f20
	tg	%xcc,	0x4
	fbuge,a	%fcc1,	loop_953
	movvs	%xcc,	%i1,	%o7
	orn	%g7,	0x16BF,	%l3
	wr	%g0,	0x04,	%asi
	stda	%g4,	[%l7 + 0x20] %asi
loop_953:
	fbl	%fcc1,	loop_954
	movg	%xcc,	%o3,	%i4
	andcc	%g5,	0x19CB,	%i6
	fsrc2	%f28,	%f30
loop_954:
	popc	%o5,	%l0
	ldsb	[%l7 + 0x0C],	%l1
	tvs	%icc,	0x3
	fbule	%fcc3,	loop_955
	udivcc	%o0,	0x1766,	%g2
	orncc	%i2,	%l5,	%l4
	set	0x66, %i3
	stha	%l2,	[%l7 + %i3] 0x18
loop_955:
	orcc	%i0,	0x05B9,	%g1
	subcc	%l6,	0x1913,	%g6
	fmovsle	%icc,	%f31,	%f27
	fzero	%f14
	edge32ln	%g3,	%o1,	%i3
	sdivcc	%i5,	0x1722,	%o6
	array32	%o2,	%o4,	%i1
	popc	%o7,	%i7
	fmovsleu	%xcc,	%f4,	%f10
	mulx	%l3,	%g7,	%o3
	fcmpeq16	%f22,	%f10,	%i4
	bcs,pt	%icc,	loop_956
	addcc	%g4,	%i6,	%g5
	andncc	%o5,	%l1,	%l0
	fnot1s	%f10,	%f17
loop_956:
	subcc	%g2,	%o0,	%i2
	bgu,a,pn	%icc,	loop_957
	movg	%icc,	%l5,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%l4,	%g1
loop_957:
	mulx	%l6,	%i0,	%g3
	set	0x20, %i1
	ldxa	[%l7 + %i1] 0x89,	%o1
	move	%xcc,	%i3,	%g6
	fpadd16	%f4,	%f16,	%f20
	swap	[%l7 + 0x68],	%i5
	tsubcctv	%o6,	%o2,	%o4
	movneg	%xcc,	%o7,	%i7
	ld	[%l7 + 0x64],	%f21
	smulcc	%i1,	%l3,	%o3
	edge8	%i4,	%g4,	%i6
	movneg	%icc,	%g7,	%g5
	tcc	%icc,	0x3
	sdiv	%o5,	0x027E,	%l1
	fcmpd	%fcc3,	%f24,	%f22
	std	%l0,	[%l7 + 0x18]
	fmovdvc	%icc,	%f1,	%f15
	fmovdn	%xcc,	%f9,	%f0
	std	%f18,	[%l7 + 0x58]
	bn	loop_958
	edge32l	%g2,	%o0,	%i2
	umul	%l5,	0x1E1F,	%l2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%l4
loop_958:
	tne	%xcc,	0x4
	sdiv	%l6,	0x1F9B,	%i0
	fcmped	%fcc2,	%f2,	%f24
	udivcc	%o1,	0x0EC6,	%i3
	fbg,a	%fcc3,	loop_959
	orncc	%g3,	%g6,	%o6
	fmovrde	%o2,	%f18,	%f26
	fblg	%fcc0,	loop_960
loop_959:
	ld	[%l7 + 0x70],	%f4
	movleu	%xcc,	%o4,	%i5
	smul	%i7,	%i1,	%o7
loop_960:
	sdivx	%o3,	0x1318,	%i4
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	membar	0x56
	edge8	%l3,	%i6,	%g4
	popc	0x0F88,	%g5
	ldstub	[%l7 + 0x39],	%o5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%l0
	tneg	%icc,	0x7
	fbue	%fcc0,	loop_961
	movpos	%icc,	%g2,	%o0
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x58] %asi,	%g7
loop_961:
	fmovrde	%l5,	%f18,	%f24
	tle	%icc,	0x2
	fbul,a	%fcc1,	loop_962
	taddcctv	%i2,	%l2,	%l4
	umulcc	%g1,	%l6,	%i0
	add	%o1,	0x16E5,	%i3
loop_962:
	brlz	%g6,	loop_963
	smulcc	%o6,	%o2,	%o4
	tg	%xcc,	0x6
	fmovrslez	%g3,	%f19,	%f17
loop_963:
	nop
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x5C] %asi,	%i5
	tcs	%icc,	0x6
	xor	%i7,	%i1,	%o3
	bl	loop_964
	sir	0x115E
	tcc	%icc,	0x1
	sllx	%o7,	%i4,	%i6
loop_964:
	fpadd32s	%f18,	%f17,	%f7
	movneg	%xcc,	%l3,	%g5
	or	%g4,	0x0A0D,	%l1
	tvc	%xcc,	0x5
	bvc	%xcc,	loop_965
	fxnor	%f6,	%f18,	%f26
	edge8n	%l0,	%o5,	%g2
	tleu	%xcc,	0x6
loop_965:
	subccc	%g7,	%o0,	%i2
	fcmpes	%fcc1,	%f0,	%f17
	wr	%g0,	0x80,	%asi
	stda	%l2,	[%l7 + 0x40] %asi
	xnor	%l5,	%g1,	%l6
	stbar
	brlez,a	%l4,	loop_966
	ldsw	[%l7 + 0x6C],	%i0
	fpsub32	%f12,	%f22,	%f20
	fbn,a	%fcc3,	loop_967
loop_966:
	sth	%i3,	[%l7 + 0x3C]
	fpadd32s	%f29,	%f14,	%f14
	movrgez	%o1,	%g6,	%o2
loop_967:
	edge8n	%o6,	%o4,	%i5
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x5A] %asi,	%g3
	fmovsne	%xcc,	%f21,	%f27
	ble,a,pn	%icc,	loop_968
	alignaddr	%i7,	%o3,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f0,	%f6
loop_968:
	bne,a,pn	%xcc,	loop_969
	array32	%i1,	%i4,	%l3
	sethi	0x1211,	%i6
	nop
	setx loop_970, %l0, %l1
	jmpl %l1, %g4
loop_969:
	fbuge	%fcc2,	loop_971
	movrlz	%g5,	%l1,	%o5
	fmovrdlez	%l0,	%f6,	%f6
loop_970:
	prefetch	[%l7 + 0x74],	 0x1
loop_971:
	fmul8sux16	%f10,	%f28,	%f8
	movgu	%icc,	%g2,	%o0
	ldsh	[%l7 + 0x2A],	%i2
	bleu,a,pt	%xcc,	loop_972
	fxnors	%f13,	%f9,	%f4
	fmovsg	%icc,	%f31,	%f8
	te	%xcc,	0x2
loop_972:
	bpos,a,pn	%xcc,	loop_973
	fcmple32	%f12,	%f4,	%g7
	movg	%icc,	%l5,	%l2
	fmovrsgz	%l6,	%f7,	%f1
loop_973:
	mova	%icc,	%g1,	%i0
	smulcc	%i3,	0x0E8C,	%o1
	and	%l4,	0x0AEF,	%o2
	movgu	%xcc,	%o6,	%o4
	fones	%f17
	movrgz	%g6,	%i5,	%g3
	srax	%i7,	0x10,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne	%fcc1,	loop_974
	orcc	%o7,	%i1,	%l3
	udivcc	%i6,	0x0A02,	%g4
	fnot1	%f12,	%f14
loop_974:
	xor	%g5,	%l1,	%o5
	fmovsle	%icc,	%f18,	%f21
	mulx	%l0,	%i4,	%g2
	movcs	%icc,	%o0,	%i2
	andcc	%l5,	%g7,	%l6
	fbule,a	%fcc0,	loop_975
	tn	%xcc,	0x6
	fcmpes	%fcc1,	%f12,	%f4
	tgu	%xcc,	0x6
loop_975:
	addcc	%g1,	%l2,	%i3
	fsrc2s	%f2,	%f23
	fmuld8sux16	%f28,	%f3,	%f6
	bleu,pn	%xcc,	loop_976
	brnz	%o1,	loop_977
	fmovsne	%xcc,	%f27,	%f17
	mova	%xcc,	%i0,	%o2
loop_976:
	nop
	set	0x4E, %i6
	stha	%o6,	[%l7 + %i6] 0x80
loop_977:
	alignaddr	%o4,	%l4,	%i5
	edge16ln	%g3,	%i7,	%g6
	andcc	%o3,	0x181D,	%i1
	tpos	%xcc,	0x3
	set	0x40, %l2
	stda	%o6,	[%l7 + %l2] 0x19
	array32	%l3,	%i6,	%g5
	bneg,pn	%icc,	loop_978
	subccc	%l1,	%o5,	%l0
	subc	%i4,	0x0760,	%g2
	add	%g4,	%o0,	%i2
loop_978:
	tpos	%icc,	0x0
	tcs	%xcc,	0x7
	edge16	%l5,	%g7,	%l6
	add	%l2,	%g1,	%i3
	edge16	%i0,	%o2,	%o6
	fcmpgt16	%f6,	%f8,	%o4
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x7C] %asi,	%l4
	fmuld8ulx16	%f9,	%f7,	%f20
	fmuld8ulx16	%f30,	%f27,	%f26
	movrne	%o1,	%g3,	%i7
	fbl	%fcc0,	loop_979
	movleu	%icc,	%i5,	%o3
	udivx	%i1,	0x0E3F,	%g6
	ba,a,pt	%xcc,	loop_980
loop_979:
	edge32n	%l3,	%o7,	%i6
	umulcc	%l1,	%o5,	%l0
	umul	%g5,	%i4,	%g2
loop_980:
	flush	%l7 + 0x60
	ta	%icc,	0x3
	and	%g4,	0x0374,	%o0
	fmovdge	%icc,	%f17,	%f2
	sir	0x0DA8
	fpsub32	%f6,	%f14,	%f2
	fmovscc	%xcc,	%f10,	%f9
	fmovrdne	%l5,	%f16,	%f28
	subccc	%i2,	0x152D,	%g7
	fbue	%fcc3,	loop_981
	udivcc	%l2,	0x1F75,	%g1
	smulcc	%l6,	0x15D5,	%i0
	set	0x5E, %o7
	stba	%o2,	[%l7 + %o7] 0x2a
	membar	#Sync
loop_981:
	andcc	%o6,	0x179F,	%o4
	xnor	%l4,	%o1,	%g3
	bn,pt	%icc,	loop_982
	fble,a	%fcc0,	loop_983
	stw	%i3,	[%l7 + 0x54]
	fnand	%f30,	%f16,	%f18
loop_982:
	fsrc2s	%f6,	%f15
loop_983:
	movn	%icc,	%i5,	%o3
	taddcc	%i1,	0x09C9,	%g6
	tsubcctv	%l3,	%i7,	%i6
	fmovscs	%xcc,	%f12,	%f7
	movrne	%l1,	%o5,	%l0
	addcc	%g5,	%o7,	%g2
	udivx	%i4,	0x0620,	%g4
	fmuld8sux16	%f27,	%f5,	%f24
	set	0x38, %g3
	ldxa	[%l7 + %g3] 0x89,	%o0
	pdist	%f6,	%f22,	%f6
	fandnot1	%f22,	%f20,	%f20
	edge32	%i2,	%g7,	%l5
	te	%xcc,	0x2
	fmovdgu	%xcc,	%f1,	%f23
	edge8l	%g1,	%l6,	%i0
	umul	%l2,	0x0B79,	%o2
	xorcc	%o4,	%l4,	%o6
	set	0x5F, %i5
	lduba	[%l7 + %i5] 0x89,	%g3
	fbge	%fcc1,	loop_984
	fmovsneg	%xcc,	%f15,	%f7
	ldsb	[%l7 + 0x4D],	%i3
	edge16l	%o1,	%o3,	%i5
loop_984:
	edge8	%g6,	%l3,	%i7
	edge16n	%i1,	%l1,	%o5
	fnot2	%f2,	%f6
	mova	%icc,	%i6,	%l0
	fnot2s	%f30,	%f7
	fbuge	%fcc2,	loop_985
	edge16ln	%g5,	%o7,	%i4
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x46] %asi,	%g4
loop_985:
	std	%f26,	[%l7 + 0x28]
	fcmple32	%f0,	%f16,	%o0
	xnor	%i2,	0x1B66,	%g7
	movrgz	%l5,	0x124,	%g1
	set	0x75, %l3
	stba	%l6,	[%l7 + %l3] 0x23
	membar	#Sync
	edge8ln	%g2,	%i0,	%l2
	brgez	%o2,	loop_986
	tne	%icc,	0x6
	udiv	%o4,	0x122D,	%l4
	movrlz	%g3,	0x00A,	%o6
loop_986:
	brgez,a	%i3,	loop_987
	movg	%icc,	%o1,	%o3
	fmovrslez	%g6,	%f27,	%f6
	fbule	%fcc1,	loop_988
loop_987:
	smul	%i5,	%i7,	%i1
	faligndata	%f18,	%f24,	%f10
	edge32n	%l1,	%o5,	%i6
loop_988:
	fmovdneg	%xcc,	%f28,	%f20
	taddcctv	%l0,	0x0BFF,	%l3
	xnorcc	%g5,	%o7,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o0,	%i2,	%g7
	array16	%i4,	%l5,	%l6
	ta	%xcc,	0x6
	fmovrdgez	%g1,	%f28,	%f28
	tcc	%icc,	0x1
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x08] %asi,	%g2
	umulcc	%i0,	0x1E93,	%o2
	movle	%xcc,	%l2,	%l4
	bgu,a	loop_989
	tvs	%xcc,	0x7
	sllx	%g3,	0x0E,	%o4
	tpos	%xcc,	0x0
loop_989:
	movg	%icc,	%i3,	%o1
	brz	%o6,	loop_990
	edge32ln	%o3,	%g6,	%i5
	fmovsg	%icc,	%f13,	%f6
	array8	%i1,	%l1,	%i7
loop_990:
	fpsub32s	%f6,	%f26,	%f7
	movne	%xcc,	%i6,	%l0
	fpadd16s	%f7,	%f22,	%f27
	mulscc	%l3,	%o5,	%o7
	tgu	%icc,	0x4
	fandnot2	%f6,	%f28,	%f14
	ta	%xcc,	0x5
	ldsh	[%l7 + 0x34],	%g4
	set	0x78, %g5
	lda	[%l7 + %g5] 0x11,	%f0
	bshuffle	%f0,	%f4,	%f2
	for	%f22,	%f10,	%f6
	movpos	%icc,	%o0,	%i2
	fmovspos	%icc,	%f23,	%f11
	mulx	%g5,	0x0477,	%i4
	tcs	%icc,	0x7
	fbue,a	%fcc3,	loop_991
	orn	%l5,	0x1BA6,	%g7
	fmul8ulx16	%f8,	%f20,	%f0
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x60] %asi,	%l6
loop_991:
	movvc	%icc,	%g1,	%i0
	sir	0x1D11
	ldd	[%l7 + 0x30],	%o2
	movn	%xcc,	%l2,	%l4
	fcmps	%fcc3,	%f29,	%f28
	movg	%xcc,	%g3,	%o4
	ldsb	[%l7 + 0x11],	%g2
	movle	%xcc,	%o1,	%o6
	te	%icc,	0x2
	tl	%xcc,	0x6
	fmovrsne	%o3,	%f26,	%f13
	xnor	%i3,	%g6,	%i5
	stx	%l1,	[%l7 + 0x28]
	edge32ln	%i7,	%i6,	%l0
	set	0x78, %l5
	stxa	%l3,	[%l7 + %l5] 0x23
	membar	#Sync
	edge8	%o5,	%i1,	%g4
	fbuge,a	%fcc1,	loop_992
	movn	%xcc,	%o0,	%o7
	or	%i2,	%g5,	%i4
	stbar
loop_992:
	stbar
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
	tleu	%xcc,	0x0
	fandnot2	%f26,	%f24,	%f30
	fbge	%fcc2,	loop_994
loop_993:
	ta	%icc,	0x1
	tle	%xcc,	0x2
	array32	%g7,	%l5,	%g1
loop_994:
	fexpand	%f15,	%f18
	wr	%g0,	0x23,	%asi
	stxa	%l6,	[%l7 + 0x30] %asi
	membar	#Sync
	fbg,a	%fcc3,	loop_995
	movgu	%icc,	%o2,	%l2
	and	%l4,	0x1F2C,	%i0
	ldsb	[%l7 + 0x7A],	%o4
loop_995:
	edge8ln	%g3,	%g2,	%o6
	udivcc	%o1,	0x091C,	%o3
	fmovdneg	%icc,	%f5,	%f7
	fnot2	%f0,	%f16
	movleu	%xcc,	%i3,	%g6
	sra	%i5,	%i7,	%i6
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x51] %asi,	%l1
	edge32l	%l0,	%o5,	%l3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%g4
	edge8l	%o7,	%i2,	%g5
	tneg	%xcc,	0x1
	edge16l	%o0,	%g7,	%l5
	fbl,a	%fcc0,	loop_996
	brnz,a	%i4,	loop_997
	tpos	%icc,	0x7
	tcc	%xcc,	0x7
loop_996:
	alignaddrl	%g1,	%l6,	%o2
loop_997:
	fxor	%f22,	%f18,	%f2
	fpadd16	%f12,	%f2,	%f20
	edge16n	%l2,	%l4,	%o4
	tleu	%icc,	0x2
	tneg	%xcc,	0x2
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x7C] %asi,	%f27
	movrlz	%g3,	0x0BE,	%g2
	edge32ln	%o6,	%o1,	%o3
	swap	[%l7 + 0x5C],	%i3
	te	%icc,	0x0
	tsubcctv	%i0,	0x019A,	%g6
	fbn,a	%fcc1,	loop_998
	srlx	%i5,	0x17,	%i6
	movrgez	%i7,	%l0,	%o5
	or	%l3,	%i1,	%g4
loop_998:
	srlx	%o7,	0x05,	%i2
	fbule,a	%fcc0,	loop_999
	tcs	%xcc,	0x4
	fmovsn	%xcc,	%f27,	%f21
	pdist	%f28,	%f26,	%f6
loop_999:
	movcc	%xcc,	%l1,	%o0
	srlx	%g5,	0x0F,	%g7
	move	%xcc,	%i4,	%g1
	mulx	%l5,	0x075D,	%l6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o2,	%l4
	sdivcc	%o4,	0x195C,	%g3
	edge8ln	%g2,	%l2,	%o6
	tvs	%icc,	0x6
	tleu	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x7
	umul	%o3,	0x199C,	%o1
	umul	%i0,	0x1698,	%i3
	movrne	%i5,	0x1A2,	%g6
	move	%icc,	%i7,	%i6
	srlx	%o5,	%l0,	%i1
	fmovsle	%icc,	%f29,	%f12
	fblg	%fcc1,	loop_1000
	orncc	%g4,	0x1E92,	%l3
	or	%o7,	0x1ADB,	%l1
	edge32ln	%i2,	%g5,	%o0
loop_1000:
	subc	%i4,	%g1,	%g7
	te	%icc,	0x3
	lduh	[%l7 + 0x66],	%l5
	bn,a,pt	%xcc,	loop_1001
	movcc	%icc,	%o2,	%l4
	fbug,a	%fcc2,	loop_1002
	tne	%icc,	0x6
loop_1001:
	movvs	%icc,	%l6,	%g3
	fpackfix	%f10,	%f9
loop_1002:
	tge	%xcc,	0x6
	fpadd16	%f24,	%f26,	%f18
	orn	%o4,	0x11CA,	%g2
	sll	%l2,	%o3,	%o1
	fcmpgt16	%f14,	%f18,	%i0
	fmovs	%f23,	%f21
	fmovsvc	%icc,	%f1,	%f25
	movl	%xcc,	%i3,	%i5
	edge16l	%g6,	%i7,	%o6
	fmul8x16al	%f17,	%f2,	%f8
	andn	%i6,	0x0307,	%l0
	edge8ln	%o5,	%g4,	%i1
	stx	%l3,	[%l7 + 0x48]
	brgz,a	%l1,	loop_1003
	fbul	%fcc2,	loop_1004
	ldsh	[%l7 + 0x4A],	%i2
	array16	%o7,	%o0,	%g5
loop_1003:
	xnor	%i4,	0x18D3,	%g7
loop_1004:
	fxors	%f25,	%f15,	%f21
	fands	%f0,	%f31,	%f19
	siam	0x5
	alignaddr	%g1,	%o2,	%l5
	movvc	%icc,	%l6,	%l4
	taddcctv	%g3,	0x1EF6,	%o4
	edge8n	%l2,	%o3,	%g2
	andcc	%o1,	0x094F,	%i0
	movvs	%xcc,	%i5,	%i3
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x30] %asi,	%i7
	udiv	%g6,	0x0BA5,	%o6
	sub	%l0,	0x0B36,	%i6
	taddcctv	%g4,	%i1,	%o5
	fbue,a	%fcc1,	loop_1005
	sllx	%l3,	0x12,	%i2
	xorcc	%o7,	0x0CFE,	%o0
	movrgez	%g5,	%l1,	%i4
loop_1005:
	movgu	%icc,	%g1,	%g7
	and	%l5,	%l6,	%l4
	sub	%o2,	%o4,	%g3
	tvc	%icc,	0x6
	ld	[%l7 + 0x6C],	%f6
	tvc	%icc,	0x7
	brnz,a	%o3,	loop_1006
	and	%g2,	0x0697,	%l2
	tneg	%icc,	0x7
	fnand	%f0,	%f6,	%f26
loop_1006:
	umulcc	%i0,	%o1,	%i3
	taddcctv	%i5,	%g6,	%i7
	srlx	%o6,	0x01,	%l0
	flush	%l7 + 0x50
	bn	%xcc,	loop_1007
	fmovrdne	%i6,	%f16,	%f8
	fba	%fcc2,	loop_1008
	srlx	%g4,	%o5,	%i1
loop_1007:
	ta	%xcc,	0x4
	subcc	%l3,	0x0587,	%i2
loop_1008:
	sdivcc	%o7,	0x02E0,	%o0
	edge16	%g5,	%i4,	%l1
	ld	[%l7 + 0x50],	%f18
	tneg	%xcc,	0x7
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x88
	array32	%g1,	%l5,	%g7
	bvc,a,pn	%xcc,	loop_1009
	ta	%icc,	0x2
	brgz	%l4,	loop_1010
	tge	%icc,	0x4
loop_1009:
	addc	%l6,	0x0ACA,	%o2
	fbl,a	%fcc2,	loop_1011
loop_1010:
	prefetch	[%l7 + 0x40],	 0x2
	movrne	%o4,	0x102,	%o3
	fmovsgu	%icc,	%f21,	%f3
loop_1011:
	movle	%xcc,	%g2,	%l2
	nop
	setx	loop_1012,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcc	%icc,	%g3,	%o1
	edge8ln	%i0,	%i5,	%g6
	tsubcctv	%i7,	%i3,	%o6
loop_1012:
	movvs	%xcc,	%i6,	%l0
	xnorcc	%g4,	%o5,	%i1
	movvc	%xcc,	%l3,	%i2
	xnor	%o7,	%g5,	%i4
	fnegd	%f18,	%f4
	fnor	%f2,	%f20,	%f18
	fbue	%fcc2,	loop_1013
	xorcc	%l1,	0x0E01,	%o0
	fcmpes	%fcc1,	%f27,	%f25
	fpadd32	%f12,	%f20,	%f30
loop_1013:
	fbg,a	%fcc3,	loop_1014
	fpackfix	%f10,	%f5
	fblg	%fcc3,	loop_1015
	tpos	%xcc,	0x5
loop_1014:
	fnot1	%f20,	%f24
	fnand	%f30,	%f12,	%f28
loop_1015:
	brnz	%l5,	loop_1016
	tn	%xcc,	0x3
	tcs	%icc,	0x1
	std	%g6,	[%l7 + 0x70]
loop_1016:
	srax	%l4,	%l6,	%g1
	umul	%o4,	%o2,	%o3
	movrne	%g2,	0x173,	%l2
	edge8	%g3,	%o1,	%i0
	tsubcctv	%g6,	%i7,	%i3
	ldstub	[%l7 + 0x17],	%i5
	pdist	%f24,	%f30,	%f30
	fcmpes	%fcc3,	%f17,	%f3
	std	%f30,	[%l7 + 0x10]
	movcs	%icc,	%i6,	%o6
	smulcc	%g4,	0x10BA,	%l0
	fmovsg	%xcc,	%f3,	%f1
	smul	%i1,	0x0EAD,	%l3
	tvc	%xcc,	0x0
	for	%f12,	%f22,	%f16
	movvs	%icc,	%o5,	%i2
	movrlz	%g5,	%i4,	%l1
	st	%f31,	[%l7 + 0x48]
	tvs	%icc,	0x6
	tcc	%xcc,	0x2
	tne	%icc,	0x4
	edge16l	%o7,	%l5,	%o0
	fexpand	%f31,	%f8
	xorcc	%g7,	%l6,	%g1
	popc	%l4,	%o4
	fmovdle	%icc,	%f25,	%f10
	fmovdvs	%icc,	%f3,	%f28
	addc	%o2,	%o3,	%g2
	tg	%icc,	0x2
	fnot2s	%f2,	%f26
	tgu	%xcc,	0x2
	tge	%xcc,	0x0
	set	0x7C, %o6
	swapa	[%l7 + %o6] 0x80,	%g3
	movre	%o1,	%i0,	%g6
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x1f
	membar	#Sync
	fmovrslez	%l2,	%f29,	%f31
	brgez	%i7,	loop_1017
	fmovrslz	%i3,	%f8,	%f31
	sllx	%i5,	0x08,	%i6
	fnors	%f25,	%f17,	%f10
loop_1017:
	edge16n	%o6,	%g4,	%l0
	fmovrdgez	%l3,	%f20,	%f30
	nop
	set	0x78, %l4
	stx	%o5,	[%l7 + %l4]
	edge16n	%i1,	%i2,	%g5
	te	%xcc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x2
	tcc	%xcc,	0x0
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x81
	edge16ln	%i4,	%o7,	%l1
	edge16l	%o0,	%l5,	%g7
	or	%g1,	0x14B5,	%l6
	fxnors	%f29,	%f14,	%f15
	fmovrdne	%o4,	%f28,	%f2
	orcc	%l4,	0x1AE5,	%o3
	udivcc	%o2,	0x186C,	%g3
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x14] %asi,	%g2
	movvs	%icc,	%o1,	%g6
	taddcc	%i0,	%i7,	%i3
	array32	%l2,	%i6,	%i5
	sllx	%o6,	%g4,	%l0
	ldsb	[%l7 + 0x21],	%l3
	fmovdg	%xcc,	%f28,	%f14
	movgu	%xcc,	%i1,	%o5
	sir	0x09A4
	stw	%i2,	[%l7 + 0x78]
	brlz	%g5,	loop_1018
	srlx	%i4,	%o7,	%l1
	andcc	%o0,	%g7,	%g1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%l6,	%l5
loop_1018:
	nop
	set	0x22, %o5
	lduh	[%l7 + %o5],	%o4
	srax	%l4,	0x07,	%o2
	mulscc	%g3,	%g2,	%o1
	fxors	%f7,	%f22,	%f13
	sll	%o3,	%i0,	%g6
	movgu	%icc,	%i7,	%l2
	fmovdge	%xcc,	%f3,	%f8
	array32	%i6,	%i5,	%o6
	move	%icc,	%i3,	%g4
	std	%f30,	[%l7 + 0x58]
	subc	%l0,	0x092C,	%l3
	movrgez	%o5,	%i1,	%g5
	andncc	%i2,	%o7,	%i4
	tneg	%xcc,	0x0
	fnot2	%f14,	%f0
	smulcc	%o0,	0x128B,	%l1
	fnands	%f9,	%f9,	%f28
	set	0x58, %i2
	stxa	%g7,	[%l7 + %i2] 0x19
	fsrc2s	%f17,	%f18
	brlez	%l6,	loop_1019
	bgu,a	%icc,	loop_1020
	array16	%g1,	%l5,	%l4
	fblg,a	%fcc3,	loop_1021
loop_1019:
	udivx	%o4,	0x0E45,	%o2
loop_1020:
	bne,a,pn	%icc,	loop_1022
	fmovdcc	%icc,	%f30,	%f29
loop_1021:
	nop
	set	0x68, %l0
	stw	%g2,	[%l7 + %l0]
	lduh	[%l7 + 0x36],	%g3
loop_1022:
	fble,a	%fcc1,	loop_1023
	brlez,a	%o3,	loop_1024
	add	%o1,	0x10DA,	%i0
	sth	%g6,	[%l7 + 0x40]
loop_1023:
	fones	%f30
loop_1024:
	sth	%i7,	[%l7 + 0x72]
	sth	%l2,	[%l7 + 0x1A]
	fandnot1	%f14,	%f2,	%f14
	array8	%i5,	%o6,	%i6
	sllx	%i3,	0x19,	%l0
	edge16l	%g4,	%o5,	%i1
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	edge32ln	%i2,	%l3,	%o7
	bpos,a,pt	%xcc,	loop_1025
	and	%o0,	%l1,	%g7
	array8	%l6,	%g1,	%i4
	edge8l	%l4,	%l5,	%o2
loop_1025:
	umulcc	%g2,	%o4,	%g3
	tvc	%icc,	0x4
	tge	%icc,	0x7
	movneg	%xcc,	%o1,	%i0
	fmovdvc	%icc,	%f9,	%f26
	fmovdge	%icc,	%f31,	%f15
	addc	%g6,	0x19C2,	%i7
	move	%xcc,	%l2,	%o3
	siam	0x4
	srlx	%o6,	0x0D,	%i5
	pdist	%f30,	%f14,	%f12
	fmovrse	%i6,	%f29,	%f15
	movcc	%icc,	%l0,	%i3
	andn	%o5,	0x0FF4,	%g4
	edge32	%g5,	%i2,	%i1
	mova	%icc,	%l3,	%o0
	swap	[%l7 + 0x60],	%o7
	fbg,a	%fcc0,	loop_1026
	fmovrslz	%g7,	%f29,	%f21
	tn	%xcc,	0x5
	addccc	%l1,	0x12BA,	%l6
loop_1026:
	nop
	setx loop_1027, %l0, %l1
	jmpl %l1, %i4
	smulcc	%l4,	%l5,	%g1
	brgez,a	%g2,	loop_1028
	edge8	%o4,	%g3,	%o2
loop_1027:
	taddcctv	%o1,	%g6,	%i7
	edge32ln	%l2,	%i0,	%o3
loop_1028:
	fmovrde	%o6,	%f4,	%f12
	fbe,a	%fcc1,	loop_1029
	tvs	%icc,	0x5
	xnorcc	%i6,	0x0340,	%i5
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x7A] %asi,	%i3
loop_1029:
	nop
	set	0x10, %g1
	lda	[%l7 + %g1] 0x10,	%f1
	tsubcctv	%o5,	%g4,	%g5
	movneg	%xcc,	%i2,	%i1
	fcmpne16	%f8,	%f20,	%l3
	sdivx	%l0,	0x1406,	%o7
	srlx	%g7,	%o0,	%l1
	taddcc	%l6,	0x152F,	%i4
	fsrc1s	%f19,	%f20
	fxor	%f4,	%f10,	%f2
	edge8	%l5,	%g1,	%l4
	movre	%o4,	0x13E,	%g2
	array32	%o2,	%g3,	%g6
	ldstub	[%l7 + 0x3F],	%i7
	ldstub	[%l7 + 0x72],	%o1
	fbl,a	%fcc2,	loop_1030
	smul	%i0,	%l2,	%o6
	fornot1	%f0,	%f26,	%f26
	edge32ln	%o3,	%i6,	%i5
loop_1030:
	tn	%icc,	0x5
	wr	%g0,	0x88,	%asi
	sta	%f7,	[%l7 + 0x60] %asi
	fmovsge	%icc,	%f9,	%f1
	edge32ln	%i3,	%g4,	%g5
	fzeros	%f16
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x28] %asi,	%f22
	array8	%i2,	%i1,	%l3
	srl	%o5,	0x1A,	%o7
	st	%f25,	[%l7 + 0x2C]
	tsubcctv	%l0,	0x1FC1,	%o0
	movpos	%icc,	%l1,	%g7
	bge,pn	%icc,	loop_1031
	fbo,a	%fcc3,	loop_1032
	fmovsn	%xcc,	%f11,	%f17
	set	0x7F, %o0
	ldsba	[%l7 + %o0] 0x81,	%l6
loop_1031:
	tneg	%icc,	0x0
loop_1032:
	stbar
	movl	%xcc,	%l5,	%i4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
	tsubcctv	%l4,	%o4,	%o2
	fcmpes	%fcc2,	%f21,	%f23
	addc	%g2,	%g3,	%g6
	set	0x5C, %i4
	sta	%f20,	[%l7 + %i4] 0x04
	sethi	0x1E54,	%i7
	edge8l	%o1,	%l2,	%o6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x30] %asi,	%o3
	movvc	%icc,	%i0,	%i6
	edge32l	%i3,	%g4,	%i5
	alignaddr	%g5,	%i2,	%l3
	brgez	%i1,	loop_1033
	bcc,pn	%icc,	loop_1034
	fmovrdgez	%o7,	%f20,	%f20
	set	0x78, %i7
	stda	%o4,	[%l7 + %i7] 0x22
	membar	#Sync
loop_1033:
	move	%icc,	%l0,	%o0
loop_1034:
	alignaddr	%l1,	%l6,	%g7
	srax	%l5,	0x0D,	%g1
	fandnot2s	%f0,	%f15,	%f2
	sdiv	%l4,	0x1550,	%o4
	tl	%icc,	0x1
	tne	%xcc,	0x3
	fnot2s	%f26,	%f27
	fzero	%f14
	udivcc	%o2,	0x199D,	%i4
	fmovdg	%xcc,	%f26,	%f25
	movleu	%icc,	%g2,	%g6
	siam	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%icc,	%f24,	%f28
	fmovdge	%icc,	%f18,	%f9
	bg,a,pn	%icc,	loop_1035
	stbar
	fnand	%f10,	%f2,	%f24
	mova	%xcc,	%g3,	%i7
loop_1035:
	fmovdg	%icc,	%f28,	%f30
	movrgz	%o1,	0x07C,	%l2
	fmovspos	%xcc,	%f29,	%f22
	fmul8x16au	%f31,	%f11,	%f6
	movrgz	%o6,	%o3,	%i6
	ldub	[%l7 + 0x0E],	%i0
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x23] %asi,	%g4
	tleu	%icc,	0x0
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x20] %asi,	%i4
	fmovdcs	%icc,	%f30,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x64, %g6
	lduwa	[%l7 + %g6] 0x89,	%g5
	fbule	%fcc3,	loop_1036
	edge16	%i3,	%l3,	%i1
	xorcc	%i2,	0x0B7F,	%o7
	movrlez	%l0,	0x368,	%o0
loop_1036:
	movne	%xcc,	%o5,	%l1
	set	0x6A, %g7
	lduha	[%l7 + %g7] 0x88,	%g7
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f0
	mulx	%l6,	%g1,	%l4
	fmovsvc	%icc,	%f23,	%f25
	movneg	%xcc,	%l5,	%o4
	brz	%i4,	loop_1037
	edge8ln	%o2,	%g2,	%g6
	std	%f18,	[%l7 + 0x58]
	fbug	%fcc2,	loop_1038
loop_1037:
	movneg	%icc,	%i7,	%o1
	umulcc	%l2,	%o6,	%g3
	edge32ln	%i6,	%i0,	%g4
loop_1038:
	bne,a,pn	%icc,	loop_1039
	edge8n	%i5,	%o3,	%g5
	fcmple16	%f0,	%f28,	%l3
	sethi	0x164F,	%i1
loop_1039:
	and	%i2,	0x18E4,	%o7
	edge8n	%l0,	%i3,	%o5
	tn	%icc,	0x6
	mova	%icc,	%o0,	%l1
	movleu	%icc,	%l6,	%g1
	fandnot2s	%f4,	%f9,	%f29
	movneg	%xcc,	%l4,	%l5
	movrlz	%g7,	0x258,	%i4
	xor	%o2,	0x1690,	%g2
	fsrc2s	%f15,	%f9
	fpadd16	%f18,	%f14,	%f14
	sir	0x112A
	brgez,a	%o4,	loop_1040
	tn	%xcc,	0x2
	srax	%g6,	%i7,	%o1
	tneg	%icc,	0x4
loop_1040:
	andcc	%l2,	%g3,	%o6
	bvc	%xcc,	loop_1041
	te	%icc,	0x7
	edge8l	%i6,	%g4,	%i0
	movpos	%xcc,	%i5,	%o3
loop_1041:
	orn	%l3,	%g5,	%i1
	brnz,a	%i2,	loop_1042
	movre	%l0,	%o7,	%o5
	bneg	loop_1043
	alignaddrl	%i3,	%l1,	%o0
loop_1042:
	fsrc1	%f20,	%f4
	xnorcc	%g1,	%l6,	%l4
loop_1043:
	ldd	[%l7 + 0x10],	%l4
	fmul8sux16	%f0,	%f2,	%f0
	movn	%xcc,	%i4,	%g7
	bvs,a,pt	%xcc,	loop_1044
	for	%f20,	%f4,	%f28
	set	0x08, %o2
	prefetcha	[%l7 + %o2] 0x81,	 0x2
loop_1044:
	fxnors	%f9,	%f5,	%f3
	movcc	%icc,	%o4,	%g6
	tpos	%xcc,	0x6
	smul	%i7,	0x0D75,	%o1
	pdist	%f4,	%f8,	%f6
	umulcc	%l2,	0x1FB1,	%g3
	tl	%icc,	0x6
	movrne	%o2,	%o6,	%i6
	tsubcctv	%g4,	%i5,	%o3
	set	0x48, %l6
	stda	%l2,	[%l7 + %l6] 0x19
	movcc	%icc,	%i0,	%g5
	edge16l	%i2,	%i1,	%l0
	srax	%o5,	0x00,	%i3
	add	%o7,	%o0,	%g1
	tleu	%xcc,	0x6
	bg,a,pt	%xcc,	loop_1045
	tpos	%icc,	0x4
	edge8l	%l1,	%l6,	%l5
	tcc	%icc,	0x7
loop_1045:
	sllx	%i4,	0x0F,	%g7
	movcc	%icc,	%g2,	%l4
	fpadd16s	%f28,	%f0,	%f9
	brz,a	%o4,	loop_1046
	brnz	%i7,	loop_1047
	fcmple16	%f30,	%f0,	%o1
	fmovda	%icc,	%f6,	%f11
loop_1046:
	nop
	set	0x10, %l1
	ldsha	[%l7 + %l1] 0x15,	%g6
loop_1047:
	sdivx	%l2,	0x0496,	%g3
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x08] %asi,	%o6
	orn	%o2,	%i6,	%i5
	sth	%g4,	[%l7 + 0x78]
	orncc	%l3,	%i0,	%g5
	brgz	%i2,	loop_1048
	flush	%l7 + 0x34
	umulcc	%o3,	0x1740,	%i1
	srax	%o5,	%i3,	%o7
loop_1048:
	movg	%icc,	%o0,	%g1
	tg	%icc,	0x1
	fnand	%f22,	%f26,	%f2
	bge,pn	%icc,	loop_1049
	fandnot2	%f22,	%f22,	%f4
	tvs	%icc,	0x1
	alignaddr	%l1,	%l6,	%l5
loop_1049:
	fcmps	%fcc0,	%f8,	%f17
	srl	%i4,	0x01,	%g7
	set	0x3E, %o1
	lduha	[%l7 + %o1] 0x14,	%g2
	movgu	%xcc,	%l0,	%l4
	srax	%i7,	0x14,	%o1
	std	%o4,	[%l7 + 0x20]
	xnorcc	%g6,	0x0514,	%l2
	bvs,a,pt	%xcc,	loop_1050
	edge32	%o6,	%g3,	%i6
	tpos	%icc,	0x4
	fmovdn	%xcc,	%f12,	%f17
loop_1050:
	fbn	%fcc1,	loop_1051
	stbar
	be	loop_1052
	edge8l	%i5,	%o2,	%g4
loop_1051:
	subc	%l3,	0x0A09,	%g5
	fmovsg	%icc,	%f4,	%f16
loop_1052:
	fsrc2	%f24,	%f20
	xorcc	%i0,	0x0C07,	%o3
	std	%f26,	[%l7 + 0x68]
	tvc	%xcc,	0x3
	movl	%xcc,	%i2,	%o5
	sdivx	%i3,	0x1B96,	%i1
	movne	%xcc,	%o0,	%o7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%l1,	%g1
	tgu	%xcc,	0x0
	tneg	%icc,	0x1
	ta	%xcc,	0x1
	array32	%l6,	%i4,	%g7
	movrne	%l5,	0x3F7,	%g2
	alignaddrl	%l4,	%i7,	%l0
	fone	%f30
	prefetch	[%l7 + 0x60],	 0x0
	nop
	set	0x54, %o3
	ldsw	[%l7 + %o3],	%o1
	nop
	setx loop_1053, %l0, %l1
	jmpl %l1, %g6
	sllx	%o4,	0x06,	%l2
	sub	%o6,	%g3,	%i5
	movne	%xcc,	%o2,	%g4
loop_1053:
	array8	%i6,	%l3,	%i0
	tn	%xcc,	0x3
	fpadd32	%f26,	%f28,	%f16
	xnor	%o3,	%g5,	%i2
	orn	%i3,	%i1,	%o5
	fmovdge	%xcc,	%f28,	%f20
	fmovsn	%xcc,	%f17,	%f11
	tl	%xcc,	0x7
	movpos	%icc,	%o0,	%o7
	lduh	[%l7 + 0x78],	%g1
	fcmpes	%fcc2,	%f28,	%f7
	edge8l	%l1,	%l6,	%g7
	orncc	%i4,	%g2,	%l5
	fmovrsgz	%i7,	%f21,	%f25
	nop
	set	0x64, %i3
	lduw	[%l7 + %i3],	%l0
	bvs,a	%icc,	loop_1054
	tne	%xcc,	0x2
	umulcc	%l4,	0x16DB,	%o1
	brgez,a	%g6,	loop_1055
loop_1054:
	fbo	%fcc2,	loop_1056
	addc	%l2,	%o6,	%o4
	movrlez	%g3,	%o2,	%i5
loop_1055:
	fmovdgu	%xcc,	%f14,	%f23
loop_1056:
	brlez,a	%i6,	loop_1057
	pdist	%f10,	%f18,	%f24
	ldstub	[%l7 + 0x21],	%g4
	tvc	%xcc,	0x5
loop_1057:
	ldstub	[%l7 + 0x61],	%l3
	edge16	%i0,	%o3,	%g5
	andncc	%i2,	%i1,	%i3
	movrne	%o0,	%o7,	%g1
	set	0x14, %i1
	stwa	%l1,	[%l7 + %i1] 0x27
	membar	#Sync
	tleu	%xcc,	0x7
	movrne	%o5,	%l6,	%i4
	ldub	[%l7 + 0x0E],	%g2
	tn	%xcc,	0x0
	movrne	%g7,	%i7,	%l0
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%l5
	xnor	%o1,	%l4,	%g6
	ldd	[%l7 + 0x40],	%f20
	tvc	%xcc,	0x7
	set	0x14, %i6
	stwa	%o6,	[%l7 + %i6] 0x2a
	membar	#Sync
	andncc	%o4,	%l2,	%g3
	sir	0x1988
	movrne	%i5,	%o2,	%g4
	tvs	%xcc,	0x5
	orncc	%l3,	%i0,	%i6
	tneg	%xcc,	0x2
	movle	%xcc,	%o3,	%g5
	bshuffle	%f8,	%f0,	%f12
	orncc	%i1,	0x0913,	%i2
	addc	%o0,	0x1399,	%i3
	fmovsn	%icc,	%f20,	%f3
	edge32	%g1,	%o7,	%o5
	movleu	%xcc,	%l1,	%i4
	tsubcc	%g2,	0x1991,	%l6
	orn	%g7,	0x1C61,	%i7
	popc	0x1D01,	%l5
	membar	0x5A
	subc	%l0,	%l4,	%o1
	movcc	%xcc,	%o6,	%g6
	movrlez	%l2,	%o4,	%g3
	set	0x44, %o7
	ldstuba	[%l7 + %o7] 0x81,	%i5
	fnot2s	%f11,	%f17
	andcc	%g4,	%l3,	%i0
	tgu	%icc,	0x1
	andcc	%i6,	0x1DA4,	%o2
	smul	%g5,	0x1363,	%o3
	movcc	%icc,	%i2,	%o0
	bneg	%icc,	loop_1058
	ldsh	[%l7 + 0x18],	%i1
	tvc	%xcc,	0x4
	std	%i2,	[%l7 + 0x48]
loop_1058:
	edge16l	%o7,	%g1,	%l1
	edge16	%i4,	%o5,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x5C] %asi,	%f9
	stx	%g7,	[%l7 + 0x68]
	fbuge,a	%fcc3,	loop_1059
	tleu	%xcc,	0x6
	set	0x1C, %l2
	ldswa	[%l7 + %l2] 0x19,	%g2
loop_1059:
	fpmerge	%f30,	%f4,	%f2
	tcs	%xcc,	0x2
	brnz	%i7,	loop_1060
	umul	%l0,	0x0169,	%l5
	addcc	%l4,	0x1506,	%o1
	addcc	%o6,	0x0AD3,	%l2
loop_1060:
	fmovdvs	%xcc,	%f26,	%f16
	orn	%g6,	%o4,	%g3
	tge	%xcc,	0x3
	ble,pt	%xcc,	loop_1061
	fmovrdgez	%i5,	%f16,	%f10
	nop
	set	0x18, %g3
	stw	%g4,	[%l7 + %g3]
	fbg,a	%fcc3,	loop_1062
loop_1061:
	bgu,a	%icc,	loop_1063
	ble,pn	%icc,	loop_1064
	tge	%icc,	0x3
loop_1062:
	tle	%icc,	0x1
loop_1063:
	tsubcc	%i0,	0x1377,	%l3
loop_1064:
	movneg	%xcc,	%i6,	%o2
	movne	%icc,	%g5,	%i2
	fmovdn	%icc,	%f24,	%f25
	tleu	%xcc,	0x1
	fzero	%f16
	edge8n	%o3,	%i1,	%i3
	fnor	%f12,	%f6,	%f20
	edge8l	%o7,	%g1,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i4,	0x1BC8,	%o5
	fpsub16	%f16,	%f16,	%f12
	membar	0x69
	tcc	%icc,	0x5
	edge16ln	%l6,	%g7,	%l1
	add	%i7,	0x1E9F,	%l0
	taddcctv	%g2,	%l5,	%o1
	sll	%l4,	%l2,	%o6
	edge8	%o4,	%g6,	%i5
	bleu	%xcc,	loop_1065
	fbue,a	%fcc2,	loop_1066
	bpos,pn	%icc,	loop_1067
	ldsh	[%l7 + 0x70],	%g4
loop_1065:
	fmovdge	%xcc,	%f19,	%f15
loop_1066:
	udivcc	%i0,	0x0D98,	%l3
loop_1067:
	nop
	set	0x50, %i5
	ldx	[%l7 + %i5],	%g3
	bge,pt	%xcc,	loop_1068
	subc	%i6,	%g5,	%o2
	te	%xcc,	0x3
	te	%icc,	0x6
loop_1068:
	nop
	setx	loop_1069,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbe,a	%fcc1,	loop_1070
	tvc	%icc,	0x1
	sth	%i2,	[%l7 + 0x28]
loop_1069:
	udiv	%o3,	0x1658,	%i3
loop_1070:
	movpos	%xcc,	%o7,	%g1
	sdivx	%o0,	0x067F,	%i1
	edge32l	%i4,	%o5,	%g7
	fandnot1s	%f14,	%f22,	%f18
	fmovrdlez	%l1,	%f26,	%f8
	array16	%l6,	%l0,	%g2
	ba,a,pt	%xcc,	loop_1071
	ldstub	[%l7 + 0x28],	%i7
	fpsub32	%f0,	%f8,	%f14
	fbul	%fcc3,	loop_1072
loop_1071:
	tl	%xcc,	0x7
	movl	%xcc,	%l5,	%l4
	stb	%l2,	[%l7 + 0x39]
loop_1072:
	fble,a	%fcc2,	loop_1073
	fcmpd	%fcc0,	%f28,	%f0
	srax	%o1,	0x04,	%o6
	set	0x37, %l3
	ldsba	[%l7 + %l3] 0x14,	%g6
loop_1073:
	bvs,pt	%icc,	loop_1074
	movn	%icc,	%i5,	%o4
	mulx	%i0,	0x19CE,	%g4
	movcs	%xcc,	%g3,	%i6
loop_1074:
	nop
	wr	%g0,	0x19,	%asi
	stwa	%l3,	[%l7 + 0x70] %asi
	tneg	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o2,	%i2,	%o3
	fmovdne	%icc,	%f2,	%f6
	set	0x40, %l5
	sta	%f24,	[%l7 + %l5] 0x10
	set	0x0E, %g5
	stha	%g5,	[%l7 + %g5] 0x04
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x10] %asi,	%i3
	bvs,a	%xcc,	loop_1075
	bl,a,pn	%icc,	loop_1076
	fmovdvc	%xcc,	%f20,	%f21
	fmovsne	%xcc,	%f3,	%f11
loop_1075:
	movvs	%icc,	%o7,	%o0
loop_1076:
	nop
	set	0x30, %o6
	std	%f4,	[%l7 + %o6]
	taddcc	%g1,	%i1,	%o5
	array16	%i4,	%l1,	%g7
	add	%l0,	%l6,	%g2
	fmovdgu	%xcc,	%f25,	%f30
	fbne	%fcc1,	loop_1077
	sub	%i7,	0x1C9C,	%l5
	std	%f18,	[%l7 + 0x48]
	prefetch	[%l7 + 0x48],	 0x2
loop_1077:
	fmul8x16	%f29,	%f26,	%f24
	fbn	%fcc0,	loop_1078
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%xcc,	0x6
	fmovrsgz	%l2,	%f11,	%f11
loop_1078:
	xor	%o1,	%l4,	%o6
	set	0x10, %g2
	ldda	[%l7 + %g2] 0x81,	%i4
	edge32l	%o4,	%g6,	%i0
	edge32	%g3,	%i6,	%l3
	be	%icc,	loop_1079
	andn	%g4,	0x15D0,	%i2
	subc	%o2,	%g5,	%o3
	tg	%xcc,	0x0
loop_1079:
	fabss	%f9,	%f0
	tcs	%xcc,	0x5
	fornot1	%f10,	%f30,	%f12
	fbl	%fcc3,	loop_1080
	alignaddrl	%o7,	%o0,	%i3
	fnot2	%f24,	%f18
	tgu	%xcc,	0x5
loop_1080:
	fcmpne16	%f4,	%f2,	%g1
	taddcctv	%o5,	%i4,	%l1
	movrlz	%i1,	0x2EF,	%g7
	edge16	%l6,	%l0,	%i7
	movre	%g2,	0x1EC,	%l5
	fbn	%fcc3,	loop_1081
	fpsub32s	%f17,	%f9,	%f22
	fmovrsne	%o1,	%f30,	%f28
	umulcc	%l2,	0x1676,	%o6
loop_1081:
	nop
	set	0x7A, %i0
	ldsb	[%l7 + %i0],	%l4
	tgu	%icc,	0x6
	fcmpd	%fcc3,	%f16,	%f0
	udivx	%i5,	0x0539,	%g6
	xorcc	%o4,	0x1B93,	%i0
	set	0x60, %o4
	stda	%g2,	[%l7 + %o4] 0xe2
	membar	#Sync
	bl	loop_1082
	array16	%l3,	%i6,	%g4
	xnor	%i2,	%o2,	%o3
	fpack32	%f24,	%f22,	%f24
loop_1082:
	ba,a,pn	%icc,	loop_1083
	fands	%f18,	%f8,	%f17
	movpos	%icc,	%g5,	%o7
	bn,a,pt	%icc,	loop_1084
loop_1083:
	ba,pt	%xcc,	loop_1085
	stw	%o0,	[%l7 + 0x48]
	set	0x49, %o5
	ldsba	[%l7 + %o5] 0x81,	%g1
loop_1084:
	sra	%o5,	%i4,	%i3
loop_1085:
	fmovrdlez	%i1,	%f28,	%f10
	tn	%xcc,	0x1
	array32	%g7,	%l1,	%l0
	fcmped	%fcc1,	%f20,	%f30
	fmovsle	%xcc,	%f25,	%f16
	stw	%l6,	[%l7 + 0x68]
	fbule,a	%fcc2,	loop_1086
	stbar
	fpadd16	%f26,	%f22,	%f2
	edge32	%i7,	%l5,	%o1
loop_1086:
	smulcc	%l2,	%o6,	%l4
	lduh	[%l7 + 0x12],	%g2
	sra	%g6,	%i5,	%i0
	fones	%f7
	subccc	%o4,	%g3,	%l3
	fxors	%f21,	%f3,	%f18
	subccc	%i6,	%i2,	%g4
	fbe,a	%fcc1,	loop_1087
	ba,a,pn	%icc,	loop_1088
	fxor	%f4,	%f24,	%f16
	lduw	[%l7 + 0x74],	%o2
loop_1087:
	nop
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1088:
	fones	%f19
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x45] %asi,	%o3
	sth	%g5,	[%l7 + 0x12]
	fmovdg	%xcc,	%f21,	%f24
	movne	%icc,	%o7,	%g1
	xor	%o0,	0x13E3,	%o5
	fbge	%fcc2,	loop_1089
	fbule,a	%fcc0,	loop_1090
	lduh	[%l7 + 0x2E],	%i3
	fpadd32	%f14,	%f10,	%f16
loop_1089:
	nop
	set	0x28, %i2
	std	%i4,	[%l7 + %i2]
loop_1090:
	bpos,pt	%icc,	loop_1091
	fmovrsgez	%i1,	%f18,	%f25
	movg	%xcc,	%g7,	%l1
	orcc	%l0,	0x0F5C,	%i7
loop_1091:
	movvs	%icc,	%l6,	%l5
	brnz,a	%o1,	loop_1092
	movrgez	%l2,	0x25D,	%l4
	smulcc	%g2,	%o6,	%i5
	fbule	%fcc2,	loop_1093
loop_1092:
	tne	%xcc,	0x3
	taddcctv	%g6,	0x16AC,	%i0
	tne	%xcc,	0x1
loop_1093:
	edge16l	%g3,	%o4,	%l3
	tpos	%xcc,	0x3
	fbu,a	%fcc1,	loop_1094
	stw	%i2,	[%l7 + 0x5C]
	udivx	%i6,	0x1630,	%g4
	fabsd	%f4,	%f30
loop_1094:
	movneg	%icc,	%o3,	%g5
	fmovsvs	%icc,	%f25,	%f19
	umul	%o2,	%o7,	%o0
	fornot2	%f14,	%f6,	%f24
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x60] %asi,	%f13
	fpack32	%f12,	%f20,	%f6
	set	0x40, %l0
	prefetcha	[%l7 + %l0] 0x88,	 0x1
	add	%i3,	0x0CE0,	%i4
	fexpand	%f9,	%f22
	fpack32	%f28,	%f22,	%f20
	xnorcc	%i1,	0x13A5,	%o5
	fand	%f16,	%f0,	%f16
	addcc	%l1,	0x0473,	%l0
	movleu	%xcc,	%i7,	%l6
	fmovdl	%icc,	%f15,	%f6
	fbe,a	%fcc1,	loop_1095
	edge16l	%l5,	%o1,	%l2
	tgu	%xcc,	0x7
	add	%g7,	0x0D60,	%l4
loop_1095:
	movne	%xcc,	%g2,	%i5
	sir	0x18D4
	tgu	%xcc,	0x2
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x120] %asi,	%o6
	fbg	%fcc3,	loop_1096
	tleu	%xcc,	0x4
	array32	%g6,	%i0,	%g3
	fcmpeq16	%f14,	%f20,	%o4
loop_1096:
	fnot2	%f14,	%f28
	movrlez	%l3,	0x165,	%i6
	fcmpne32	%f20,	%f6,	%i2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x13] %asi,	%g4
	udiv	%g5,	0x0F17,	%o3
	addccc	%o2,	0x0723,	%o0
	fpmerge	%f9,	%f10,	%f24
	movn	%xcc,	%g1,	%i3
	movle	%xcc,	%o7,	%i1
	srl	%i4,	0x03,	%l1
	edge32n	%l0,	%i7,	%l6
	fmovsa	%xcc,	%f7,	%f23
	fmovsgu	%icc,	%f25,	%f11
	array32	%o5,	%o1,	%l2
	bneg,a,pt	%xcc,	loop_1097
	bcc	loop_1098
	ldsb	[%l7 + 0x48],	%l5
	tl	%icc,	0x4
loop_1097:
	ldub	[%l7 + 0x2F],	%l4
loop_1098:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x49] %asi,	%g7
	movcc	%icc,	%g2,	%i5
	addc	%g6,	%i0,	%g3
	add	%o4,	0x1C27,	%l3
	srax	%o6,	%i6,	%i2
	umulcc	%g5,	%o3,	%o2
	mova	%xcc,	%g4,	%o0
	ldsh	[%l7 + 0x4A],	%i3
	edge32n	%o7,	%g1,	%i1
	fmovdgu	%xcc,	%f6,	%f5
	subc	%i4,	0x1203,	%l1
	mova	%icc,	%l0,	%l6
	movcc	%xcc,	%o5,	%i7
	fbu	%fcc3,	loop_1099
	andcc	%o1,	0x07C8,	%l5
	andncc	%l2,	%g7,	%l4
	subcc	%g2,	%i5,	%i0
loop_1099:
	fors	%f5,	%f15,	%f21
	andn	%g6,	%g3,	%o4
	fbge	%fcc1,	loop_1100
	sir	0x0CB2
	fba	%fcc2,	loop_1101
	movrgz	%o6,	%l3,	%i6
loop_1100:
	or	%i2,	%g5,	%o3
	fabsd	%f16,	%f2
loop_1101:
	sdiv	%g4,	0x1106,	%o0
	srl	%i3,	0x0B,	%o7
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x80,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g1,	%i1,	%i4
	movrlz	%o2,	%l1,	%l0
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x20] %asi,	%l6
	movrne	%o5,	%o1,	%i7
	sdiv	%l2,	0x17FE,	%l5
	st	%f20,	[%l7 + 0x48]
	movn	%icc,	%l4,	%g2
	fnor	%f0,	%f22,	%f28
	fnot2	%f4,	%f30
	tgu	%xcc,	0x4
	fmovrsgez	%g7,	%f8,	%f31
	fornot2	%f0,	%f12,	%f4
	fbug	%fcc0,	loop_1102
	edge32	%i5,	%i0,	%g3
	tneg	%icc,	0x0
	siam	0x7
loop_1102:
	bpos	loop_1103
	mulx	%o4,	0x1BCE,	%o6
	fnot2s	%f31,	%f17
	edge16n	%l3,	%i6,	%i2
loop_1103:
	movrgz	%g5,	0x05D,	%o3
	srax	%g6,	0x1D,	%o0
	wr	%g0,	0x11,	%asi
	sta	%f29,	[%l7 + 0x08] %asi
	edge32n	%i3,	%g4,	%o7
	tl	%icc,	0x1
	popc	0x071C,	%i1
	edge8	%i4,	%o2,	%l1
	tge	%icc,	0x0
	array8	%l0,	%g1,	%o5
	tgu	%xcc,	0x2
	sllx	%o1,	0x1D,	%l6
	xorcc	%l2,	%i7,	%l5
	fsrc2s	%f15,	%f20
	fmovsl	%icc,	%f31,	%f14
	prefetch	[%l7 + 0x68],	 0x0
	add	%g2,	%g7,	%i5
	alignaddrl	%i0,	%g3,	%l4
	movcs	%icc,	%o4,	%o6
	tcc	%xcc,	0x6
	fnand	%f10,	%f2,	%f16
	bg	loop_1104
	edge32ln	%l3,	%i2,	%g5
	sth	%i6,	[%l7 + 0x0E]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1104:
	fmovrdgz	%g6,	%f28,	%f22
	fmovdg	%icc,	%f13,	%f18
	mova	%xcc,	%o3,	%o0
	tvs	%icc,	0x0
	xorcc	%i3,	0x1FA9,	%o7
	fors	%f18,	%f13,	%f3
	wr	%g0,	0x0c,	%asi
	stha	%i1,	[%l7 + 0x1E] %asi
	bleu,pt	%icc,	loop_1105
	tpos	%icc,	0x5
	fbug	%fcc3,	loop_1106
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1105:
	nop
	set	0x08, %o0
	ldsb	[%l7 + %o0],	%i4
	fcmpgt32	%f14,	%f24,	%g4
loop_1106:
	movne	%xcc,	%o2,	%l1
	sdiv	%g1,	0x1699,	%o5
	fmovdgu	%xcc,	%f17,	%f1
	movne	%xcc,	%o1,	%l0
	tvc	%xcc,	0x1
	fbo	%fcc0,	loop_1107
	ldsh	[%l7 + 0x34],	%l6
	sdivcc	%l2,	0x05F4,	%i7
	std	%f26,	[%l7 + 0x08]
loop_1107:
	edge16l	%g2,	%g7,	%i5
	fmovsne	%icc,	%f11,	%f12
	sra	%i0,	%l5,	%g3
	ldx	[%l7 + 0x58],	%l4
	addcc	%o4,	0x15AF,	%o6
	edge8n	%l3,	%g5,	%i6
	xnor	%g6,	0x1F9E,	%o3
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	edge8ln	%o0,	%o7,	%i1
	subcc	%i4,	%i3,	%o2
	andcc	%l1,	0x0544,	%g4
	add	%o5,	0x0F46,	%o1
	bcc	%icc,	loop_1108
	xnorcc	%g1,	%l6,	%l2
	fpsub32	%f6,	%f16,	%f28
	movrne	%i7,	%g2,	%l0
loop_1108:
	fnot1	%f14,	%f12
	tg	%icc,	0x2
	movl	%icc,	%g7,	%i0
	movg	%icc,	%l5,	%i5
	set	0x2D, %l4
	lduba	[%l7 + %l4] 0x04,	%g3
	edge8n	%l4,	%o6,	%o4
	addcc	%g5,	0x0D42,	%l3
	fmul8x16	%f1,	%f4,	%f26
	tleu	%icc,	0x1
	subc	%g6,	0x0889,	%i6
	tleu	%icc,	0x4
	fsrc2	%f22,	%f6
	fmovdcc	%icc,	%f4,	%f11
	tl	%xcc,	0x0
	movn	%icc,	%o3,	%i2
	sethi	0x03CA,	%o7
	fmuld8ulx16	%f2,	%f23,	%f0
	fmovsleu	%xcc,	%f29,	%f13
	pdist	%f14,	%f0,	%f4
	fble,a	%fcc2,	loop_1109
	tsubcctv	%o0,	0x0122,	%i4
	st	%f3,	[%l7 + 0x50]
	set	0x0C, %i4
	ldsha	[%l7 + %i4] 0x15,	%i1
loop_1109:
	andcc	%i3,	%o2,	%g4
	nop
	setx	loop_1110,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bgu,pt	%icc,	loop_1111
	fbn,a	%fcc1,	loop_1112
	std	%o4,	[%l7 + 0x48]
loop_1110:
	umul	%o1,	%l1,	%l6
loop_1111:
	movn	%xcc,	%g1,	%i7
loop_1112:
	sdiv	%l2,	0x13F8,	%l0
	movrgez	%g2,	0x3F5,	%i0
	call	loop_1113
	fbn	%fcc3,	loop_1114
	fbge,a	%fcc1,	loop_1115
	fabsd	%f4,	%f6
loop_1113:
	fbuge,a	%fcc0,	loop_1116
loop_1114:
	lduw	[%l7 + 0x34],	%l5
loop_1115:
	brgez,a	%g7,	loop_1117
	subcc	%i5,	0x03A0,	%l4
loop_1116:
	edge8ln	%o6,	%g3,	%o4
	stb	%l3,	[%l7 + 0x6B]
loop_1117:
	edge16ln	%g5,	%g6,	%o3
	umulcc	%i2,	0x128D,	%o7
	fbo,a	%fcc0,	loop_1118
	array16	%i6,	%o0,	%i4
	xnorcc	%i1,	0x135D,	%o2
	tcc	%xcc,	0x4
loop_1118:
	tcs	%icc,	0x7
	edge32	%i3,	%o5,	%o1
	tvc	%icc,	0x7
	prefetch	[%l7 + 0x5C],	 0x3
	nop
	setx loop_1119, %l0, %l1
	jmpl %l1, %g4
	andn	%l1,	%g1,	%i7
	bneg,pn	%xcc,	loop_1120
	fnot2	%f28,	%f20
loop_1119:
	fmuld8ulx16	%f29,	%f19,	%f0
	for	%f24,	%f20,	%f28
loop_1120:
	mulx	%l2,	0x1F65,	%l6
	addcc	%g2,	0x1165,	%i0
	move	%xcc,	%l0,	%g7
	mulscc	%l5,	%l4,	%o6
	set	0x70, %i7
	prefetcha	[%l7 + %i7] 0x18,	 0x0
	bcc,a	%xcc,	loop_1121
	movle	%icc,	%o4,	%l3
	brlz,a	%i5,	loop_1122
	sdiv	%g5,	0x1F69,	%o3
loop_1121:
	srax	%i2,	0x14,	%g6
	fabss	%f20,	%f26
loop_1122:
	fnot2	%f12,	%f24
	and	%i6,	%o0,	%o7
	bn,a	loop_1123
	movvc	%icc,	%i1,	%i4
	mova	%icc,	%i3,	%o5
	xorcc	%o1,	0x11CE,	%o2
loop_1123:
	movrne	%l1,	0x220,	%g4
	ldd	[%l7 + 0x78],	%f16
	te	%xcc,	0x2
	set	0x28, %g6
	sta	%f19,	[%l7 + %g6] 0x18
	sir	0x1EA7
	fcmple32	%f24,	%f26,	%i7
	nop
	setx loop_1124, %l0, %l1
	jmpl %l1, %l2
	fbule,a	%fcc0,	loop_1125
	sub	%l6,	0x0C55,	%g1
	smulcc	%g2,	0x171E,	%l0
loop_1124:
	tg	%xcc,	0x6
loop_1125:
	fpack16	%f30,	%f10
	tsubcc	%g7,	0x1BDA,	%i0
	lduh	[%l7 + 0x7C],	%l4
	addcc	%o6,	%l5,	%o4
	edge16	%l3,	%g3,	%g5
	edge32l	%i5,	%i2,	%g6
	sir	0x1040
	sth	%o3,	[%l7 + 0x4C]
	tcc	%icc,	0x7
	tcc	%xcc,	0x3
	edge16ln	%o0,	%o7,	%i6
	addccc	%i1,	%i3,	%o5
	smulcc	%i4,	0x06DF,	%o2
	movcc	%icc,	%o1,	%l1
	tsubcctv	%g4,	0x08E9,	%i7
	subccc	%l6,	0x171B,	%l2
	sdiv	%g1,	0x07CC,	%g2
	smulcc	%l0,	0x05E5,	%g7
	sllx	%i0,	0x1F,	%o6
	tleu	%xcc,	0x7
	addc	%l5,	%l4,	%o4
	edge8	%g3,	%g5,	%i5
	orn	%i2,	%g6,	%l3
	taddcctv	%o0,	0x13BF,	%o7
	wr	%g0,	0x80,	%asi
	stha	%o3,	[%l7 + 0x1A] %asi
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%i1
	xnor	%i3,	%i4,	%o2
	set	0x6A, %g4
	ldstuba	[%l7 + %g4] 0x19,	%o5
	fmovdvs	%icc,	%f31,	%f27
	std	%l0,	[%l7 + 0x20]
	tneg	%xcc,	0x7
	tge	%xcc,	0x2
	fnor	%f4,	%f20,	%f20
	edge16n	%o1,	%g4,	%l6
	tcs	%icc,	0x0
	sdiv	%i7,	0x1BC7,	%g1
	edge16ln	%g2,	%l0,	%g7
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%o6
	set	0x62, %o2
	stba	%l2,	[%l7 + %o2] 0x11
	tsubcc	%l5,	%o4,	%l4
	fmovrdgz	%g5,	%f8,	%f0
	fpadd32s	%f12,	%f26,	%f31
	fmovsne	%xcc,	%f15,	%f16
	fmovdgu	%xcc,	%f28,	%f26
	set	0x3C, %l6
	stha	%i5,	[%l7 + %l6] 0x04
	and	%g3,	0x14BD,	%g6
	edge16n	%i2,	%l3,	%o0
	fmovdvs	%xcc,	%f4,	%f20
	tl	%icc,	0x4
	bshuffle	%f6,	%f16,	%f12
	fpack16	%f26,	%f31
	xnor	%o7,	%o3,	%i6
	brlz,a	%i1,	loop_1126
	swap	[%l7 + 0x0C],	%i4
	prefetch	[%l7 + 0x28],	 0x2
	tl	%icc,	0x7
loop_1126:
	umulcc	%o2,	%o5,	%l1
	fnands	%f22,	%f4,	%f0
	fpack32	%f0,	%f0,	%f10
	fnot2s	%f24,	%f12
	siam	0x3
	tl	%xcc,	0x5
	set	0x20, %g7
	prefetcha	[%l7 + %g7] 0x80,	 0x0
	orncc	%g4,	%i3,	%i7
	st	%f31,	[%l7 + 0x10]
	edge32	%l6,	%g1,	%l0
	popc	0x1987,	%g7
	fmovsvs	%xcc,	%f27,	%f17
	fcmple32	%f4,	%f4,	%i0
	sir	0x075D
	tle	%xcc,	0x2
	fmovsne	%xcc,	%f16,	%f5
	and	%o6,	0x0B09,	%g2
	move	%icc,	%l5,	%l2
	movl	%xcc,	%l4,	%g5
	wr	%g0,	0x52,	%asi
	stxa	%o4,	[%g0 + 0x210] %asi
	tle	%xcc,	0x4
	wr	%g0,	0x27,	%asi
	stxa	%g3,	[%l7 + 0x68] %asi
	membar	#Sync
	fblg	%fcc1,	loop_1127
	ldsw	[%l7 + 0x3C],	%g6
	ldd	[%l7 + 0x38],	%f2
	movrgez	%i2,	%i5,	%o0
loop_1127:
	fbu,a	%fcc1,	loop_1128
	tgu	%icc,	0x2
	movrgez	%o7,	%o3,	%i6
	array16	%l3,	%i4,	%o2
loop_1128:
	nop
	set	0x1E, %o1
	ldsha	[%l7 + %o1] 0x80,	%o5
	alignaddr	%i1,	%l1,	%o1
	tl	%icc,	0x4
	fmovsn	%icc,	%f24,	%f6
	fbe,a	%fcc0,	loop_1129
	movvs	%icc,	%i3,	%i7
	fcmpeq32	%f20,	%f26,	%l6
	fmul8x16	%f30,	%f26,	%f8
loop_1129:
	tsubcc	%g4,	%l0,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%i0,	0x1B18,	%o6
	tle	%xcc,	0x5
	xorcc	%g7,	%l5,	%l2
	stw	%l4,	[%l7 + 0x64]
	udivcc	%g2,	0x1ADF,	%g5
	te	%xcc,	0x6
	swap	[%l7 + 0x7C],	%g3
	tcs	%xcc,	0x4
	bcc,pt	%xcc,	loop_1130
	nop
	setx loop_1131, %l0, %l1
	jmpl %l1, %g6
	fcmpne32	%f4,	%f30,	%i2
	fmul8x16al	%f5,	%f12,	%f20
loop_1130:
	movl	%icc,	%i5,	%o4
loop_1131:
	be	loop_1132
	sdivcc	%o7,	0x133C,	%o3
	edge16l	%i6,	%o0,	%l3
	stbar
loop_1132:
	fnot1	%f18,	%f28
	fmovde	%icc,	%f19,	%f9
	wr	%g0,	0x80,	%asi
	stha	%o2,	[%l7 + 0x20] %asi
	te	%xcc,	0x3
	movg	%icc,	%i4,	%o5
	edge32l	%l1,	%i1,	%i3
	movrgez	%o1,	0x11F,	%i7
	subcc	%l6,	0x091C,	%l0
	tgu	%xcc,	0x0
	orcc	%g1,	0x1613,	%g4
	sdivcc	%o6,	0x07EF,	%i0
	orcc	%l5,	%l2,	%l4
	stb	%g7,	[%l7 + 0x50]
	fnegs	%f30,	%f16
	tge	%xcc,	0x4
	edge8l	%g5,	%g2,	%g3
	movg	%icc,	%g6,	%i5
	taddcctv	%i2,	0x14CE,	%o7
	fba	%fcc1,	loop_1133
	nop
	setx	loop_1134,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot2s	%f10,	%f19,	%f5
	movge	%icc,	%o3,	%o4
loop_1133:
	movpos	%icc,	%o0,	%i6
loop_1134:
	ta	%icc,	0x2
	movge	%icc,	%l3,	%o2
	brlez	%i4,	loop_1135
	srlx	%o5,	0x10,	%i1
	fmuld8ulx16	%f15,	%f17,	%f12
	udivx	%l1,	0x00BC,	%i3
loop_1135:
	brlz	%o1,	loop_1136
	mova	%xcc,	%i7,	%l6
	srlx	%l0,	%g4,	%g1
	taddcctv	%i0,	0x0752,	%o6
loop_1136:
	tne	%xcc,	0x1
	ldsh	[%l7 + 0x12],	%l5
	movpos	%xcc,	%l4,	%g7
	edge16n	%g5,	%g2,	%g3
	membar	0x1C
	fand	%f28,	%f16,	%f28
	fcmped	%fcc1,	%f18,	%f22
	bl,a	loop_1137
	tvc	%icc,	0x6
	tle	%icc,	0x5
	xor	%g6,	0x0D67,	%i5
loop_1137:
	xorcc	%i2,	%l2,	%o7
	bcs,pn	%xcc,	loop_1138
	andcc	%o4,	0x1D6A,	%o0
	fabss	%f14,	%f5
	bcc	%xcc,	loop_1139
loop_1138:
	tcs	%xcc,	0x6
	brgz,a	%i6,	loop_1140
	fmovdg	%xcc,	%f30,	%f30
loop_1139:
	nop
	add	%l7,	0x24,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x04,	%l3,	%o2
loop_1140:
	bleu	%icc,	loop_1141
	fornot2	%f16,	%f14,	%f22
	movge	%xcc,	%i4,	%o3
	edge32l	%i1,	%o5,	%i3
loop_1141:
	smulcc	%l1,	0x1A26,	%o1
	prefetch	[%l7 + 0x1C],	 0x0
	sdiv	%i7,	0x1FC1,	%l6
	fcmped	%fcc0,	%f4,	%f18
	bn,pt	%icc,	loop_1142
	popc	%g4,	%g1
	sllx	%i0,	0x02,	%l0
	fbg,a	%fcc0,	loop_1143
loop_1142:
	mova	%xcc,	%l5,	%o6
	edge8	%l4,	%g5,	%g2
	fpack32	%f20,	%f0,	%f18
loop_1143:
	subccc	%g3,	%g7,	%g6
	bcc	%icc,	loop_1144
	array32	%i2,	%l2,	%o7
	array8	%o4,	%i5,	%i6
	taddcc	%o0,	0x038F,	%o2
loop_1144:
	subccc	%l3,	%o3,	%i1
	sll	%o5,	%i4,	%i3
	fmul8x16al	%f18,	%f10,	%f28
	fbe	%fcc1,	loop_1145
	tcs	%xcc,	0x4
	movg	%icc,	%l1,	%i7
	xorcc	%o1,	0x0E9B,	%g4
loop_1145:
	tcs	%icc,	0x3
	set	0x50, %l1
	ldda	[%l7 + %l1] 0xea,	%i6
	fpadd32	%f14,	%f8,	%f22
	fandnot2s	%f12,	%f15,	%f19
	movvs	%icc,	%g1,	%i0
	fmovsgu	%icc,	%f9,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,pn	%icc,	loop_1146
	fnot2	%f12,	%f18
	xorcc	%l5,	0x0AB8,	%o6
	sethi	0x19DC,	%l0
loop_1146:
	edge8n	%g5,	%g2,	%g3
	sub	%g7,	0x0FDB,	%l4
	fbue,a	%fcc3,	loop_1147
	nop
	setx loop_1148, %l0, %l1
	jmpl %l1, %g6
	fmovsleu	%icc,	%f21,	%f4
	movgu	%icc,	%i2,	%l2
loop_1147:
	ldx	[%l7 + 0x50],	%o7
loop_1148:
	array16	%o4,	%i6,	%o0
	movrgz	%i5,	0x1AA,	%l3
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x2
	fmovsg	%xcc,	%f6,	%f20
	movpos	%icc,	%o2,	%o5
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	andncc	%i4,	%i1,	%i3
	movrgez	%i7,	0x21C,	%l1
	fpadd16s	%f25,	%f23,	%f0
	movrlez	%g4,	%l6,	%o1
	fmul8sux16	%f18,	%f6,	%f26
	tsubcctv	%i0,	0x081B,	%g1
	alignaddrl	%o6,	%l0,	%l5
	srlx	%g5,	%g3,	%g2
	fornot2	%f4,	%f8,	%f30
	xorcc	%l4,	0x1423,	%g7
	bneg,a,pt	%xcc,	loop_1149
	movre	%g6,	0x1F1,	%i2
	fmovdleu	%icc,	%f20,	%f23
	move	%icc,	%l2,	%o4
loop_1149:
	andcc	%o7,	%i6,	%o0
	movrlz	%l3,	0x045,	%i5
	fcmpeq32	%f2,	%f22,	%o3
	edge32	%o2,	%i4,	%i1
	movrne	%i3,	%i7,	%l1
	movcc	%xcc,	%g4,	%o5
	mova	%xcc,	%l6,	%i0
	orn	%o1,	%g1,	%o6
	fba	%fcc2,	loop_1150
	sll	%l0,	0x11,	%l5
	bpos,a	loop_1151
	movneg	%xcc,	%g3,	%g2
loop_1150:
	taddcctv	%g5,	%g7,	%g6
	ldsb	[%l7 + 0x45],	%i2
loop_1151:
	fmovrsgez	%l2,	%f18,	%f15
	and	%l4,	0x0046,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i6,	0x035D,	%o4
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x3a0] %asi,	%o0 ripped by fixASI40.pl ripped by fixASI40.pl
	fzero	%f18
	movneg	%icc,	%l3,	%o3
	sth	%i5,	[%l7 + 0x22]
	ta	%xcc,	0x2
	tle	%xcc,	0x7
	set	0x7E, %i3
	ldsha	[%l7 + %i3] 0x89,	%o2
	fpackfix	%f4,	%f17
	fmovrdne	%i4,	%f2,	%f16
	subccc	%i1,	%i7,	%l1
	array8	%g4,	%o5,	%l6
	movl	%icc,	%i3,	%i0
	ld	[%l7 + 0x2C],	%f12
	edge32ln	%o1,	%g1,	%l0
	edge16n	%o6,	%g3,	%l5
	brnz	%g2,	loop_1152
	subccc	%g7,	%g6,	%i2
	movrlez	%l2,	%l4,	%g5
	array32	%o7,	%i6,	%o4
loop_1152:
	sir	0x0282
	fmovdneg	%icc,	%f14,	%f12
	mova	%xcc,	%o0,	%l3
	tsubcc	%i5,	0x1739,	%o3
	movl	%icc,	%i4,	%o2
	edge32l	%i1,	%i7,	%g4
	or	%o5,	0x0D06,	%l1
	movpos	%xcc,	%l6,	%i0
	and	%i3,	0x044C,	%o1
	fpsub16	%f6,	%f28,	%f30
	fba	%fcc0,	loop_1153
	fbne,a	%fcc1,	loop_1154
	fmovrsgz	%g1,	%f24,	%f29
	edge32	%l0,	%o6,	%g3
loop_1153:
	brnz	%g2,	loop_1155
loop_1154:
	tcs	%xcc,	0x1
	movcc	%xcc,	%g7,	%l5
	fmovsg	%xcc,	%f1,	%f24
loop_1155:
	movpos	%xcc,	%g6,	%l2
	movge	%xcc,	%l4,	%g5
	movneg	%xcc,	%o7,	%i2
	popc	%o4,	%i6
	fbu	%fcc3,	loop_1156
	fbuge	%fcc2,	loop_1157
	udivcc	%o0,	0x17D5,	%i5
	ba,a	loop_1158
loop_1156:
	tcs	%icc,	0x5
loop_1157:
	ldsb	[%l7 + 0x7E],	%o3
	sllx	%l3,	0x10,	%o2
loop_1158:
	lduh	[%l7 + 0x10],	%i4
	fbn,a	%fcc1,	loop_1159
	bgu,a	loop_1160
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i7,	%i1,	%o5
loop_1159:
	movgu	%icc,	%l1,	%g4
loop_1160:
	fmovdvc	%xcc,	%f15,	%f1
	bn,a	%xcc,	loop_1161
	swap	[%l7 + 0x7C],	%l6
	addc	%i3,	%i0,	%o1
	movrlz	%l0,	%o6,	%g3
loop_1161:
	fba	%fcc2,	loop_1162
	taddcctv	%g1,	0x0FF8,	%g7
	array8	%l5,	%g6,	%g2
	brlz,a	%l2,	loop_1163
loop_1162:
	tle	%xcc,	0x3
	tleu	%xcc,	0x0
	edge16l	%l4,	%g5,	%i2
loop_1163:
	bcc,pt	%icc,	loop_1164
	movrgez	%o7,	0x202,	%i6
	alignaddr	%o4,	%o0,	%o3
	udiv	%l3,	0x07F9,	%i5
loop_1164:
	movvs	%xcc,	%o2,	%i4
	xnorcc	%i7,	0x0793,	%i1
	st	%f2,	[%l7 + 0x70]
	udivcc	%l1,	0x11C8,	%g4
	fbu,a	%fcc0,	loop_1165
	movcs	%icc,	%o5,	%i3
	tpos	%icc,	0x0
	sethi	0x05EB,	%i0
loop_1165:
	sdivcc	%l6,	0x10F4,	%o1
	movrgz	%l0,	%g3,	%g1
	fone	%f14
	wr	%g0,	0x89,	%asi
	stha	%g7,	[%l7 + 0x74] %asi
	addcc	%l5,	0x016B,	%g6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%l2
	edge8l	%l4,	%o6,	%g5
	set	0x08, %o3
	ldstuba	[%l7 + %o3] 0x88,	%i2
	movcs	%icc,	%i6,	%o7
	bneg,a,pt	%xcc,	loop_1166
	brz	%o4,	loop_1167
	brz,a	%o3,	loop_1168
	edge16n	%l3,	%i5,	%o0
loop_1166:
	udivx	%o2,	0x175E,	%i4
loop_1167:
	fmuld8ulx16	%f19,	%f28,	%f12
loop_1168:
	fmovsneg	%icc,	%f24,	%f4
	move	%xcc,	%i1,	%i7
	membar	0x05
	array8	%g4,	%l1,	%o5
	call	loop_1169
	bvc	loop_1170
	orn	%i3,	0x07AE,	%i0
	fmovd	%f4,	%f6
loop_1169:
	xorcc	%o1,	%l0,	%g3
loop_1170:
	fmovdge	%icc,	%f6,	%f17
	sdiv	%l6,	0x193F,	%g7
	addcc	%l5,	0x11D6,	%g6
	movgu	%icc,	%g1,	%l2
	fmovrse	%g2,	%f29,	%f14
	fsrc1s	%f13,	%f2
	fornot1s	%f5,	%f25,	%f7
	tpos	%xcc,	0x6
	movge	%xcc,	%o6,	%g5
	fbg	%fcc3,	loop_1171
	fxnors	%f24,	%f21,	%f7
	fmovdcc	%xcc,	%f14,	%f8
	std	%l4,	[%l7 + 0x78]
loop_1171:
	fxnor	%f4,	%f24,	%f2
	tpos	%icc,	0x0
	fble,a	%fcc1,	loop_1172
	sethi	0x0D9C,	%i6
	fmovsvc	%icc,	%f7,	%f28
	brgz	%o7,	loop_1173
loop_1172:
	ldd	[%l7 + 0x20],	%i2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x44] %asi,	%o4
loop_1173:
	edge8	%l3,	%o3,	%o0
	srl	%o2,	%i4,	%i5
	umul	%i7,	%g4,	%i1
	stbar
	siam	0x6
	brz,a	%l1,	loop_1174
	ba	loop_1175
	move	%xcc,	%i3,	%o5
	popc	%i0,	%l0
loop_1174:
	fmovsa	%xcc,	%f27,	%f10
loop_1175:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o1,	0x063B,	%g3
	ldstub	[%l7 + 0x4D],	%g7
	brgez,a	%l6,	loop_1176
	ldx	[%l7 + 0x28],	%g6
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x46] %asi,	%g1
loop_1176:
	fmovrsgz	%l2,	%f28,	%f24
	movrgez	%l5,	0x366,	%g2
	popc	0x163C,	%g5
	nop
	setx	loop_1177,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	pdist	%f2,	%f28,	%f4
	bl,a	loop_1178
	st	%f10,	[%l7 + 0x74]
loop_1177:
	fands	%f3,	%f1,	%f14
	edge32	%l4,	%o6,	%i6
loop_1178:
	movcs	%icc,	%i2,	%o7
	movg	%icc,	%o4,	%l3
	xorcc	%o0,	%o2,	%i4
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x40] %asi,	%i5
	fbne,a	%fcc3,	loop_1179
	fmovsleu	%icc,	%f2,	%f20
	movrlez	%o3,	0x103,	%i7
	edge32	%i1,	%g4,	%i3
loop_1179:
	tne	%icc,	0x3
	nop
	setx	loop_1180,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbul	%fcc0,	loop_1181
	fsrc2	%f26,	%f28
	fmuld8sux16	%f29,	%f6,	%f18
loop_1180:
	edge32ln	%o5,	%i0,	%l0
loop_1181:
	orn	%l1,	%o1,	%g7
	wr	%g0,	0x23,	%asi
	stwa	%g3,	[%l7 + 0x30] %asi
	membar	#Sync
	fmovdcc	%xcc,	%f25,	%f3
	fmovdvc	%xcc,	%f3,	%f0
	movcs	%xcc,	%g6,	%g1
	andcc	%l6,	%l5,	%g2
	tneg	%icc,	0x3
	mulx	%l2,	0x02B4,	%l4
	alignaddrl	%g5,	%i6,	%i2
	fmovsvc	%xcc,	%f7,	%f20
	fnand	%f2,	%f4,	%f22
	srax	%o7,	0x1A,	%o4
	movge	%xcc,	%l3,	%o0
	sir	0x135A
	fmovdl	%icc,	%f13,	%f5
	alignaddr	%o6,	%i4,	%i5
	movcc	%icc,	%o2,	%i7
	tge	%icc,	0x5
	bvs	%xcc,	loop_1182
	nop
	set	0x64, %i6
	lduw	[%l7 + %i6],	%i1
	tn	%xcc,	0x2
	stw	%g4,	[%l7 + 0x68]
loop_1182:
	ldub	[%l7 + 0x7A],	%o3
	tne	%icc,	0x4
	sllx	%o5,	0x1A,	%i3
	brnz,a	%i0,	loop_1183
	orn	%l1,	0x03F7,	%o1
	subccc	%l0,	%g7,	%g3
	set	0x1C, %o7
	ldswa	[%l7 + %o7] 0x14,	%g1
loop_1183:
	ta	%xcc,	0x2
	xorcc	%l6,	0x1C75,	%g6
	array32	%g2,	%l2,	%l4
	fones	%f26
	brz	%l5,	loop_1184
	movrne	%i6,	0x0BF,	%i2
	umul	%o7,	%g5,	%l3
	nop
	setx	loop_1185,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1184:
	tcc	%xcc,	0x0
	fbne,a	%fcc1,	loop_1186
	fbu,a	%fcc2,	loop_1187
loop_1185:
	fmovsgu	%xcc,	%f27,	%f25
	tcc	%xcc,	0x0
loop_1186:
	nop
	set	0x58, %i1
	ldxa	[%l7 + %i1] 0x11,	%o0
loop_1187:
	add	%o4,	0x1A68,	%o6
	fmuld8ulx16	%f24,	%f8,	%f26
	fornot1s	%f10,	%f25,	%f4
	tcc	%icc,	0x7
	alignaddrl	%i5,	%i4,	%i7
	edge16	%o2,	%g4,	%o3
	ble	%icc,	loop_1188
	addccc	%o5,	%i3,	%i1
	addccc	%l1,	0x1754,	%i0
	smulcc	%l0,	0x13F1,	%o1
loop_1188:
	srax	%g3,	0x16,	%g7
	movrne	%l6,	0x00E,	%g6
	array32	%g2,	%l2,	%l4
	fmovrsgez	%l5,	%f11,	%f13
	nop
	set	0x3C, %g3
	ldsh	[%l7 + %g3],	%g1
	taddcc	%i2,	%i6,	%g5
	smul	%l3,	%o7,	%o0
	fcmps	%fcc3,	%f9,	%f9
	fba,a	%fcc2,	loop_1189
	edge16	%o4,	%i5,	%i4
	tvc	%xcc,	0x7
	add	%l7,	0x74,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%i7,	%o6
loop_1189:
	bgu,a,pn	%icc,	loop_1190
	edge8	%g4,	%o3,	%o5
	sdivcc	%o2,	0x04A9,	%i3
	fabss	%f1,	%f28
loop_1190:
	nop
	set	0x50, %i5
	prefetcha	[%l7 + %i5] 0x18,	 0x2
	fblg,a	%fcc2,	loop_1191
	movrgez	%i0,	0x0F4,	%l1
	array8	%o1,	%g3,	%g7
	tpos	%icc,	0x2
loop_1191:
	xor	%l6,	%l0,	%g6
	fmovspos	%icc,	%f29,	%f28
	movgu	%icc,	%l2,	%l4
	fpack16	%f0,	%f7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne,a	%fcc2,	loop_1192
	movvs	%icc,	%l5,	%g2
	addcc	%i2,	%i6,	%g5
	movrgz	%l3,	%o7,	%g1
loop_1192:
	ld	[%l7 + 0x28],	%f15
	fmul8ulx16	%f6,	%f12,	%f12
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%o0,	%i5
	movg	%icc,	%i4,	%i7
	edge8ln	%o4,	%o6,	%g4
	movn	%icc,	%o3,	%o2
	fmuld8ulx16	%f2,	%f23,	%f26
	fabss	%f2,	%f29
	xor	%o5,	0x1AA1,	%i3
	umul	%i1,	%l1,	%i0
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%g3
	movcs	%xcc,	%g7,	%l6
	udivcc	%l0,	0x033D,	%g6
	sub	%l2,	%l4,	%g2
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x3
	fbne,a	%fcc1,	loop_1193
	lduh	[%l7 + 0x68],	%i2
	fpackfix	%f12,	%f30
	addccc	%i6,	%g5,	%l3
loop_1193:
	edge8ln	%o7,	%o0,	%i5
	alignaddrl	%g1,	%i4,	%o4
	sub	%o6,	%i7,	%o3
	sdivcc	%g4,	0x0B23,	%o5
	fpsub32	%f14,	%f24,	%f26
	smul	%i3,	%o2,	%i1
	edge8ln	%l1,	%i0,	%g3
	fmul8x16	%f10,	%f20,	%f30
	fnot2s	%f1,	%f24
	fcmple16	%f2,	%f12,	%o1
	fpsub16s	%f14,	%f20,	%f7
	sub	%g7,	0x00FF,	%l6
	fmul8sux16	%f24,	%f0,	%f28
	fbe	%fcc0,	loop_1194
	brlez	%g6,	loop_1195
	bneg,pn	%icc,	loop_1196
	sdivx	%l0,	0x17CE,	%l4
loop_1194:
	alignaddrl	%l2,	%l5,	%g2
loop_1195:
	edge8ln	%i6,	%g5,	%l3
loop_1196:
	bpos,pt	%xcc,	loop_1197
	fmovscc	%xcc,	%f7,	%f11
	fors	%f14,	%f16,	%f0
	xorcc	%o7,	0x1C18,	%i2
loop_1197:
	std	%f26,	[%l7 + 0x30]
	bshuffle	%f8,	%f14,	%f20
	fmovrdgz	%i5,	%f6,	%f10
	fpsub32	%f20,	%f0,	%f4
	sethi	0x0EFD,	%g1
	tle	%xcc,	0x1
	set	0x40, %l3
	swapa	[%l7 + %l3] 0x88,	%o0
	fmovrslz	%o4,	%f26,	%f9
	orncc	%i4,	0x1CA2,	%i7
	fcmpeq32	%f22,	%f4,	%o3
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf1,	%f0
	bcs	%icc,	loop_1198
	sir	0x04ED
	fbge,a	%fcc0,	loop_1199
	tsubcctv	%g4,	0x1912,	%o5
loop_1198:
	array8	%i3,	%o2,	%o6
	array16	%l1,	%i1,	%i0
loop_1199:
	fbue,a	%fcc1,	loop_1200
	fmovde	%xcc,	%f21,	%f12
	sethi	0x1B32,	%o1
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x5A] %asi,	%g3
loop_1200:
	bvc,pt	%icc,	loop_1201
	fands	%f0,	%f20,	%f11
	edge32ln	%l6,	%g7,	%l0
	movle	%xcc,	%l4,	%g6
loop_1201:
	tle	%xcc,	0x7
	fcmple32	%f18,	%f4,	%l2
	brnz	%l5,	loop_1202
	movgu	%icc,	%i6,	%g2
	movne	%icc,	%l3,	%g5
	tpos	%icc,	0x3
loop_1202:
	fandnot1	%f14,	%f4,	%f16
	sra	%i2,	0x16,	%o7
	fmovsl	%xcc,	%f24,	%f17
	fmovrslz	%i5,	%f8,	%f1
	movneg	%xcc,	%g1,	%o4
	nop
	setx loop_1203, %l0, %l1
	jmpl %l1, %o0
	edge32n	%i4,	%o3,	%i7
	brgz	%o5,	loop_1204
	movrgez	%g4,	0x0C0,	%i3
loop_1203:
	edge16l	%o6,	%l1,	%o2
	bge,a,pn	%icc,	loop_1205
loop_1204:
	fmovrse	%i0,	%f6,	%f7
	addccc	%o1,	%i1,	%g3
	orn	%l6,	0x0391,	%l0
loop_1205:
	fmovrdgz	%g7,	%f0,	%f0
	fmul8sux16	%f28,	%f0,	%f14
	tne	%icc,	0x2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x71] %asi,	%l4
	srax	%g6,	%l2,	%i6
	fbuge,a	%fcc2,	loop_1206
	sra	%g2,	0x08,	%l5
	std	%l2,	[%l7 + 0x50]
	fmovdpos	%icc,	%f2,	%f13
loop_1206:
	fmovse	%xcc,	%f8,	%f5
	smul	%i2,	%g5,	%o7
	orn	%i5,	0x04EE,	%o4
	alignaddr	%g1,	%i4,	%o3
	array8	%i7,	%o5,	%o0
	smulcc	%g4,	%o6,	%i3
	fnors	%f9,	%f0,	%f30
	sll	%l1,	%o2,	%i0
	mulscc	%o1,	%i1,	%g3
	fmovsvc	%xcc,	%f12,	%f15
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f0,	%f2,	%f10
	orcc	%l0,	0x1644,	%g7
	fmovrsgz	%l6,	%f31,	%f7
	fba,a	%fcc1,	loop_1207
	bgu,a,pt	%icc,	loop_1208
	fabsd	%f10,	%f12
	smulcc	%l4,	%l2,	%i6
loop_1207:
	nop
	set	0x40, %l2
	stda	%g6,	[%l7 + %l2] 0xea
	membar	#Sync
loop_1208:
	nop
	setx loop_1209, %l0, %l1
	jmpl %l1, %l5
	fmovscc	%xcc,	%f0,	%f11
	mova	%icc,	%l3,	%g2
	xor	%g5,	%o7,	%i2
loop_1209:
	tne	%xcc,	0x1
	popc	%o4,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x3e0, %o6
	nop 	! 	nop 	! 	ldxa	[%g0 + %o6] 0x40,	%i5 ripped by fixASI40.pl ripped by fixASI40.pl
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%o3,	%f26,	%f30
	subcc	%i4,	0x0B45,	%i7
	movn	%xcc,	%o0,	%g4
	orcc	%o5,	%i3,	%o6
	tsubcctv	%l1,	%o2,	%i0
	sdivcc	%o1,	0x0DEE,	%g3
	xorcc	%i1,	0x1FC3,	%g7
	te	%xcc,	0x3
	tg	%xcc,	0x6
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x17] %asi,	%l0
	fand	%f10,	%f4,	%f2
	alignaddrl	%l6,	%l4,	%i6
	bne,pn	%xcc,	loop_1210
	sdiv	%g6,	0x015C,	%l2
	edge32n	%l3,	%l5,	%g5
	flush	%l7 + 0x7C
loop_1210:
	subccc	%g2,	%o7,	%i2
	bg,a	%xcc,	loop_1211
	brlz	%g1,	loop_1212
	ldsw	[%l7 + 0x08],	%o4
	movne	%icc,	%o3,	%i4
loop_1211:
	xorcc	%i7,	%o0,	%i5
loop_1212:
	nop
	set	0x0A, %g2
	ldsba	[%l7 + %g2] 0x10,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g4,	%o6,	%i3
	array16	%l1,	%o2,	%o1
	nop
	setx	loop_1213,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%g3,	%i0,	%g7
	tg	%icc,	0x2
	tge	%icc,	0x6
loop_1213:
	movcs	%xcc,	%l0,	%i1
	movge	%xcc,	%l6,	%l4
	tgu	%xcc,	0x7
	edge16	%g6,	%i6,	%l2
	fbue	%fcc2,	loop_1214
	sdiv	%l5,	0x16AD,	%l3
	orcc	%g2,	%o7,	%g5
	te	%xcc,	0x1
loop_1214:
	fnegs	%f19,	%f23
	popc	0x170A,	%g1
	or	%o4,	%i2,	%o3
	ldd	[%l7 + 0x58],	%i6
	array16	%o0,	%i4,	%i5
	bvs,pt	%icc,	loop_1215
	fmovdvs	%xcc,	%f2,	%f25
	sdiv	%o5,	0x04E5,	%g4
	fmovrdlez	%o6,	%f18,	%f12
loop_1215:
	andcc	%i3,	%l1,	%o2
	sub	%g3,	%i0,	%o1
	orncc	%g7,	0x06FD,	%i1
	popc	0x135F,	%l0
	fmovscc	%xcc,	%f4,	%f25
	smulcc	%l6,	%g6,	%l4
	movleu	%icc,	%i6,	%l5
	udiv	%l2,	0x04AD,	%l3
	movcc	%xcc,	%g2,	%g5
	membar	0x7E
	umulcc	%o7,	%o4,	%g1
	fornot1s	%f27,	%f2,	%f12
	fmul8ulx16	%f6,	%f16,	%f30
	set	0x74, %g5
	ldswa	[%l7 + %g5] 0x11,	%o3
	tg	%xcc,	0x7
	xnorcc	%i2,	0x0BE7,	%o0
	smulcc	%i7,	%i5,	%o5
	fmovdvs	%icc,	%f20,	%f7
	fzeros	%f8
	fmovrsne	%g4,	%f13,	%f19
	fba	%fcc3,	loop_1216
	andncc	%o6,	%i3,	%i4
	subccc	%l1,	0x0C1F,	%g3
	ble,a	loop_1217
loop_1216:
	add	%i0,	0x11EC,	%o1
	sdivcc	%o2,	0x0254,	%g7
	set	0x58, %o4
	prefetcha	[%l7 + %o4] 0x80,	 0x0
loop_1217:
	tgu	%xcc,	0x3
	ld	[%l7 + 0x5C],	%f18
	array16	%i1,	%g6,	%l4
	taddcc	%l6,	0x087C,	%i6
	mulscc	%l2,	0x13EB,	%l5
	tcs	%xcc,	0x3
	fpsub16	%f28,	%f16,	%f28
	movvc	%icc,	%g2,	%g5
	fzeros	%f21
	udiv	%o7,	0x0905,	%l3
	bn	%icc,	loop_1218
	fornot1s	%f29,	%f12,	%f8
	sth	%g1,	[%l7 + 0x4A]
	fmovsg	%icc,	%f26,	%f20
loop_1218:
	udivx	%o3,	0x1412,	%i2
	sir	0x03D9
	tneg	%icc,	0x0
	fmovrde	%o4,	%f16,	%f30
	add	%o0,	0x0B99,	%i7
	movrgez	%o5,	0x05C,	%i5
	fand	%f16,	%f0,	%f20
	orncc	%g4,	0x1A2C,	%i3
	srlx	%i4,	%o6,	%l1
	movle	%xcc,	%i0,	%g3
	xor	%o2,	%o1,	%l0
	udiv	%i1,	0x106B,	%g7
	fmovdne	%icc,	%f16,	%f24
	tneg	%xcc,	0x1
	sdivx	%g6,	0x0CF8,	%l4
	set	0x70, %o5
	stwa	%i6,	[%l7 + %o5] 0x14
	sdiv	%l2,	0x134C,	%l6
	fbo	%fcc0,	loop_1219
	fmovsvs	%xcc,	%f15,	%f20
	movrgez	%g2,	%l5,	%g5
	tne	%xcc,	0x5
loop_1219:
	andncc	%o7,	%g1,	%l3
	umulcc	%o3,	%i2,	%o4
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x3
	movvs	%icc,	%o0,	%i5
	fbo,a	%fcc1,	loop_1220
	fsrc1s	%f11,	%f31
	udivcc	%o5,	0x0B31,	%i3
	fcmpd	%fcc1,	%f20,	%f6
loop_1220:
	array16	%i4,	%g4,	%o6
	be,a	%xcc,	loop_1221
	orn	%i0,	%g3,	%o2
	fbg,a	%fcc3,	loop_1222
	bneg,a	loop_1223
loop_1221:
	movne	%icc,	%l1,	%l0
	tpos	%xcc,	0x3
loop_1222:
	sra	%o1,	%g7,	%g6
loop_1223:
	sir	0x15CA
	orn	%i1,	%l4,	%i6
	brnz,a	%l2,	loop_1224
	fcmpgt32	%f12,	%f30,	%g2
	tsubcc	%l6,	%l5,	%g5
	tvs	%xcc,	0x4
loop_1224:
	bl	loop_1225
	tvc	%icc,	0x6
	andcc	%o7,	%g1,	%o3
	movvc	%xcc,	%i2,	%o4
loop_1225:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x41] %asi,	%i7
	fba,a	%fcc3,	loop_1226
	addccc	%o0,	%l3,	%i5
	nop
	setx loop_1227, %l0, %l1
	jmpl %l1, %o5
	edge32	%i3,	%i4,	%g4
loop_1226:
	andcc	%i0,	0x0B86,	%o6
	umulcc	%g3,	0x1A4D,	%l1
loop_1227:
	movrlez	%l0,	%o1,	%o2
	fmovrdgz	%g6,	%f16,	%f30
	fbue	%fcc0,	loop_1228
	fbuge	%fcc0,	loop_1229
	ldub	[%l7 + 0x1B],	%g7
	fmovdl	%icc,	%f1,	%f24
loop_1228:
	fble	%fcc1,	loop_1230
loop_1229:
	bshuffle	%f8,	%f2,	%f24
	tle	%icc,	0x4
	ta	%icc,	0x0
loop_1230:
	tg	%xcc,	0x1
	umul	%l4,	0x0C65,	%i6
	movleu	%icc,	%i1,	%g2
	set	0x70, %i0
	lduha	[%l7 + %i0] 0x19,	%l2
	ble,a,pn	%xcc,	loop_1231
	popc	%l5,	%l6
	srlx	%o7,	%g1,	%g5
	bshuffle	%f26,	%f10,	%f14
loop_1231:
	membar	0x69
	tgu	%icc,	0x4
	tg	%xcc,	0x4
	mova	%xcc,	%o3,	%o4
	fnegs	%f22,	%f24
	move	%xcc,	%i2,	%o0
	fmovsleu	%icc,	%f2,	%f2
	fcmpeq16	%f30,	%f22,	%l3
	bg,a	loop_1232
	smulcc	%i5,	%i7,	%i3
	bvc,a	loop_1233
	nop
	set	0x14, %i2
	prefetch	[%l7 + %i2],	 0x0
loop_1232:
	movneg	%icc,	%i4,	%g4
	smul	%i0,	%o5,	%g3
loop_1233:
	fba	%fcc0,	loop_1234
	membar	0x38
	popc	%o6,	%l1
	orcc	%o1,	0x07EF,	%l0
loop_1234:
	nop
	setx	loop_1235,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddr	%g6,	%g7,	%o2
	bvs,pt	%xcc,	loop_1236
	taddcctv	%i6,	%l4,	%g2
loop_1235:
	nop
	set	0x63, %l0
	lduba	[%l7 + %l0] 0x15,	%i1
loop_1236:
	bpos,pt	%icc,	loop_1237
	bleu,a	%xcc,	loop_1238
	fmovrdlz	%l2,	%f24,	%f28
	tsubcctv	%l6,	0x09A3,	%l5
loop_1237:
	fcmpeq32	%f26,	%f16,	%g1
loop_1238:
	subcc	%g5,	%o7,	%o4
	addcc	%o3,	0x1C11,	%o0
	array32	%l3,	%i5,	%i2
	sdivcc	%i7,	0x19AB,	%i3
	fxors	%f30,	%f11,	%f20
	fmovdcs	%icc,	%f11,	%f10
	brz,a	%i4,	loop_1239
	smulcc	%g4,	%i0,	%g3
	wr	%g0,	0x0c,	%asi
	stha	%o6,	[%l7 + 0x3E] %asi
loop_1239:
	brnz,a	%o5,	loop_1240
	addcc	%l1,	0x1172,	%l0
	fbue,a	%fcc3,	loop_1241
	fmovdl	%icc,	%f6,	%f23
loop_1240:
	umul	%o1,	%g6,	%o2
	set	0x32, %g1
	stha	%g7,	[%l7 + %g1] 0x04
loop_1241:
	fmovdvs	%icc,	%f3,	%f15
	fxnors	%f25,	%f6,	%f18
	fmovrsne	%i6,	%f8,	%f8
	tl	%icc,	0x1
	add	%g2,	0x03AA,	%l4
	fblg,a	%fcc0,	loop_1242
	movrlez	%l2,	0x11F,	%i1
	sra	%l5,	%l6,	%g1
	tne	%icc,	0x1
loop_1242:
	be,pn	%xcc,	loop_1243
	fmuld8sux16	%f14,	%f13,	%f14
	movrgez	%o7,	%g5,	%o3
	set	0x48, %l4
	stda	%o0,	[%l7 + %l4] 0x19
loop_1243:
	popc	%o4,	%l3
	srax	%i5,	%i7,	%i2
	alignaddr	%i4,	%g4,	%i0
	tl	%icc,	0x5
	fmovdl	%icc,	%f17,	%f17
	stw	%g3,	[%l7 + 0x58]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%i3,	%o5
	swap	[%l7 + 0x34],	%o6
	andn	%l1,	0x1F3D,	%o1
	ldd	[%l7 + 0x38],	%f4
	mova	%xcc,	%g6,	%o2
	movpos	%xcc,	%l0,	%i6
	ta	%icc,	0x1
	nop
	setx loop_1244, %l0, %l1
	jmpl %l1, %g7
	bl,a,pt	%icc,	loop_1245
	prefetch	[%l7 + 0x24],	 0x1
	fmuld8ulx16	%f1,	%f22,	%f28
loop_1244:
	fmovsle	%icc,	%f10,	%f19
loop_1245:
	fmovsa	%icc,	%f28,	%f7
	sir	0x1D32
	tsubcc	%g2,	%l4,	%i1
	set	0x6C, %i4
	ldswa	[%l7 + %i4] 0x14,	%l2
	edge16	%l6,	%l5,	%o7
	edge16l	%g1,	%o3,	%g5
	movrlz	%o0,	%l3,	%i5
	tvc	%xcc,	0x1
	addccc	%o4,	%i2,	%i7
	fabsd	%f4,	%f4
	wr	%g0,	0xe2,	%asi
	stba	%g4,	[%l7 + 0x70] %asi
	membar	#Sync
	fbug,a	%fcc0,	loop_1246
	edge16	%i4,	%g3,	%i0
	tge	%xcc,	0x2
	tvc	%xcc,	0x1
loop_1246:
	fmovrsne	%i3,	%f0,	%f8
	sdivx	%o6,	0x08BC,	%o5
	fmovrsne	%o1,	%f11,	%f10
	subccc	%g6,	%l1,	%l0
	addc	%i6,	0x0C6F,	%o2
	taddcctv	%g7,	%l4,	%i1
	fsrc2	%f8,	%f14
	tle	%xcc,	0x7
	movgu	%icc,	%l2,	%g2
	edge32n	%l6,	%l5,	%o7
	brnz,a	%o3,	loop_1247
	bcc,a,pn	%xcc,	loop_1248
	ldsw	[%l7 + 0x54],	%g5
	fornot2	%f6,	%f20,	%f8
loop_1247:
	fmovdle	%xcc,	%f29,	%f17
loop_1248:
	tsubcctv	%o0,	%l3,	%i5
	nop
	set	0x78, %i7
	prefetch	[%l7 + %i7],	 0x2
	srlx	%o4,	0x19,	%g1
	edge8n	%i2,	%g4,	%i7
	sra	%g3,	%i0,	%i3
	fmovse	%icc,	%f25,	%f31
	sir	0x13D4
	ble	loop_1249
	fmuld8sux16	%f31,	%f0,	%f2
	tsubcc	%i4,	0x1DD8,	%o5
	sra	%o6,	%o1,	%g6
loop_1249:
	membar	0x53
	bvs,a	loop_1250
	fsrc2	%f30,	%f30
	subccc	%l1,	0x04DE,	%i6
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x7A] %asi,	%o2
loop_1250:
	fbug,a	%fcc1,	loop_1251
	movge	%icc,	%g7,	%l0
	fmovsg	%icc,	%f9,	%f1
	bvc,a	%xcc,	loop_1252
loop_1251:
	sub	%i1,	0x061A,	%l2
	fbg	%fcc0,	loop_1253
	andn	%g2,	0x1454,	%l4
loop_1252:
	fsrc1s	%f15,	%f20
	sra	%l6,	0x1C,	%l5
loop_1253:
	fmovdleu	%xcc,	%f9,	%f3
	fmovdne	%xcc,	%f19,	%f15
	tsubcctv	%o7,	0x06DA,	%o3
	udivcc	%o0,	0x054D,	%g5
	mulx	%l3,	%i5,	%g1
	umul	%o4,	0x19DD,	%i2
	fcmpne32	%f0,	%f26,	%g4
	udivcc	%g3,	0x1B1E,	%i0
	tsubcc	%i3,	%i4,	%o5
	brlez	%o6,	loop_1254
	tcc	%xcc,	0x3
	movvs	%icc,	%o1,	%g6
	fbo,a	%fcc3,	loop_1255
loop_1254:
	fbuge	%fcc1,	loop_1256
	umulcc	%l1,	%i6,	%i7
	fands	%f11,	%f12,	%f7
loop_1255:
	ble,a,pn	%icc,	loop_1257
loop_1256:
	fbne	%fcc1,	loop_1258
	edge16n	%o2,	%l0,	%g7
	sll	%i1,	%g2,	%l4
loop_1257:
	edge8ln	%l2,	%l5,	%o7
loop_1258:
	srl	%l6,	0x1A,	%o3
	ldd	[%l7 + 0x50],	%o0
	fmovdle	%icc,	%f8,	%f27
	srax	%l3,	0x1F,	%i5
	subcc	%g1,	0x0FD6,	%g5
	sdivx	%o4,	0x10E9,	%g4
	bcc,a,pn	%xcc,	loop_1259
	movrlz	%g3,	0x2DA,	%i0
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x1F] %asi,	%i3
loop_1259:
	umulcc	%i4,	0x1306,	%i2
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x04
	fmovsle	%xcc,	%f7,	%f29
	movgu	%icc,	%o5,	%o1
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x6C] %asi,	%f26
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x14] %asi,	%f11
	fnegd	%f8,	%f4
	fbn,a	%fcc1,	loop_1260
	array8	%o6,	%g6,	%i6
	bl	%icc,	loop_1261
	fpack32	%f4,	%f2,	%f14
loop_1260:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%l1
loop_1261:
	stb	%o2,	[%l7 + 0x54]
	movrgez	%l0,	%g7,	%i1
	bge	%xcc,	loop_1262
	array8	%l4,	%g2,	%l2
	tg	%icc,	0x2
	fxnor	%f16,	%f22,	%f20
loop_1262:
	nop
	set	0x78, %o0
	lda	[%l7 + %o0] 0x88,	%f14
	xorcc	%o7,	%l5,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpes	%fcc1,	%f18,	%f3
	move	%xcc,	%o0,	%l3
	movre	%o3,	0x0BA,	%i5
	movleu	%icc,	%g1,	%o4
	fbe	%fcc0,	loop_1263
	movleu	%icc,	%g4,	%g3
	edge32	%g5,	%i3,	%i4
	edge8ln	%i0,	%o5,	%i2
loop_1263:
	fbne	%fcc2,	loop_1264
	alignaddr	%o6,	%g6,	%i6
	fones	%f25
	fpadd16	%f16,	%f20,	%f14
loop_1264:
	movle	%xcc,	%i7,	%o1
	tleu	%xcc,	0x7
	mulscc	%o2,	%l1,	%g7
	array32	%i1,	%l4,	%g2
	movl	%xcc,	%l2,	%o7
	ta	%xcc,	0x3
	nop
	set	0x68, %g4
	lduw	[%l7 + %g4],	%l5
	sethi	0x1413,	%l0
	andn	%l6,	%l3,	%o0
	set	0x40, %l6
	ldxa	[%l7 + %l6] 0x18,	%o3
	bge,a,pn	%xcc,	loop_1265
	edge32ln	%g1,	%o4,	%i5
	lduw	[%l7 + 0x1C],	%g4
	fmovrse	%g5,	%f23,	%f0
loop_1265:
	bneg,a	%icc,	loop_1266
	movvs	%icc,	%i3,	%g3
	movl	%xcc,	%i4,	%o5
	bcc,pt	%xcc,	loop_1267
loop_1266:
	sdiv	%i2,	0x1F9B,	%i0
	fbe,a	%fcc2,	loop_1268
	fmovrdlez	%o6,	%f12,	%f8
loop_1267:
	edge32	%i6,	%g6,	%i7
	sra	%o1,	%o2,	%l1
loop_1268:
	fmovde	%icc,	%f31,	%f28
	subccc	%g7,	%i1,	%l4
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x70] %asi,	%l2
	udivx	%g2,	0x0998,	%l5
	tge	%icc,	0x1
	edge8l	%l0,	%l6,	%o7
	stb	%o0,	[%l7 + 0x35]
	movre	%o3,	0x05C,	%l3
	edge32l	%o4,	%i5,	%g1
	fpack16	%f22,	%f22
	fandnot1	%f14,	%f18,	%f30
	srl	%g4,	0x14,	%g5
	sdiv	%i3,	0x0D4F,	%g3
	fmovdle	%icc,	%f2,	%f26
	fbule,a	%fcc0,	loop_1269
	addc	%o5,	%i4,	%i2
	sdiv	%o6,	0x182E,	%i6
	bvs,pn	%icc,	loop_1270
loop_1269:
	mova	%xcc,	%i0,	%g6
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x16,	%f16
loop_1270:
	udiv	%i7,	0x12FF,	%o2
	sdivx	%l1,	0x11E7,	%o1
	edge16n	%g7,	%i1,	%l2
	sdiv	%g2,	0x0DC7,	%l5
	fabsd	%f14,	%f24
	set	0x1C, %g7
	lduba	[%l7 + %g7] 0x19,	%l4
	movvc	%xcc,	%l6,	%o7
	tsubcc	%l0,	0x0B33,	%o3
	sethi	0x031F,	%o0
	umul	%o4,	0x171C,	%l3
	tneg	%xcc,	0x4
	fones	%f0
	xnorcc	%g1,	%g4,	%g5
	movl	%icc,	%i5,	%i3
	ldsw	[%l7 + 0x24],	%o5
	fzeros	%f26
	fmovrse	%g3,	%f29,	%f4
	sethi	0x112A,	%i2
	orn	%i4,	%i6,	%i0
	alignaddr	%o6,	%i7,	%o2
	movle	%icc,	%l1,	%g6
	edge16n	%g7,	%i1,	%o1
	fcmpeq32	%f28,	%f16,	%l2
	mova	%xcc,	%l5,	%l4
	fandnot2	%f28,	%f22,	%f18
	ba	%icc,	loop_1271
	edge8l	%g2,	%l6,	%l0
	brlz,a	%o7,	loop_1272
	movle	%xcc,	%o3,	%o0
loop_1271:
	fnot1	%f26,	%f6
	fzeros	%f2
loop_1272:
	faligndata	%f28,	%f20,	%f2
	ldx	[%l7 + 0x20],	%l3
	fmovdleu	%icc,	%f8,	%f5
	brlz	%o4,	loop_1273
	sub	%g1,	0x1F8B,	%g5
	mulscc	%i5,	0x0D5E,	%i3
	edge8l	%o5,	%g4,	%i2
loop_1273:
	movrlz	%g3,	0x22E,	%i4
	xnor	%i0,	%o6,	%i7
	fmovdne	%xcc,	%f5,	%f30
	movrlz	%i6,	%l1,	%o2
	bl	loop_1274
	fmovrsne	%g6,	%f11,	%f6
	movpos	%xcc,	%i1,	%g7
	fbu	%fcc1,	loop_1275
loop_1274:
	addccc	%o1,	%l5,	%l2
	stbar
	fmovsleu	%icc,	%f11,	%f8
loop_1275:
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%g2
	tn	%xcc,	0x0
	fmovdle	%icc,	%f11,	%f20
	ldx	[%l7 + 0x38],	%l6
	movre	%l4,	0x1FE,	%l0
	bneg,a	loop_1276
	fpadd16s	%f31,	%f4,	%f1
	movcs	%xcc,	%o7,	%o3
	edge16ln	%o0,	%o4,	%l3
loop_1276:
	tsubcc	%g1,	0x0370,	%g5
	movgu	%icc,	%i5,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%g4,	%o5
	and	%i2,	0x0F35,	%g3
	brgez,a	%i0,	loop_1277
	edge32n	%o6,	%i4,	%i7
	fmovsvc	%xcc,	%f17,	%f31
	fmul8ulx16	%f14,	%f24,	%f12
loop_1277:
	udivcc	%i6,	0x0AB5,	%o2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%i1
	movg	%xcc,	%g6,	%o1
	xnorcc	%l5,	%g7,	%g2
	mulx	%l2,	0x0FF7,	%l6
	movne	%xcc,	%l0,	%o7
	alignaddrl	%o3,	%l4,	%o0
	fnot2s	%f28,	%f10
	edge16	%l3,	%g1,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o4,	%i5,	%i3
	be,a	loop_1278
	fmovsn	%icc,	%f23,	%f1
	xnorcc	%o5,	0x0A9B,	%g4
	fbne,a	%fcc0,	loop_1279
loop_1278:
	bcc,a	%icc,	loop_1280
	tg	%icc,	0x3
	fornot2	%f8,	%f18,	%f24
loop_1279:
	movrgez	%i2,	0x0FE,	%i0
loop_1280:
	smulcc	%g3,	0x0594,	%o6
	bg,a	loop_1281
	tcc	%xcc,	0x6
	subccc	%i4,	0x0405,	%i6
	fmovdl	%icc,	%f27,	%f4
loop_1281:
	fpadd16s	%f30,	%f21,	%f2
	fbo,a	%fcc1,	loop_1282
	fcmps	%fcc2,	%f14,	%f17
	fpsub32	%f26,	%f20,	%f30
	srlx	%o2,	0x0E,	%l1
loop_1282:
	sllx	%i7,	0x08,	%i1
	array32	%o1,	%g6,	%l5
	addc	%g7,	%g2,	%l6
	movrgez	%l0,	0x056,	%l2
	fnegs	%f3,	%f13
	fmovdne	%xcc,	%f30,	%f13
	fbe	%fcc3,	loop_1283
	fpack16	%f0,	%f27
	edge16n	%o7,	%o3,	%o0
	xnorcc	%l4,	%l3,	%g1
loop_1283:
	taddcctv	%o4,	0x045F,	%i5
	fornot2s	%f0,	%f23,	%f8
	add	%i3,	0x153E,	%o5
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x69] %asi,	%g4
	fmovsge	%xcc,	%f14,	%f8
	tge	%xcc,	0x0
	xnorcc	%g5,	0x16AA,	%i0
	fandnot1s	%f12,	%f20,	%f16
	tge	%icc,	0x7
	movrlez	%g3,	%o6,	%i2
	set	0x48, %i3
	ldxa	[%l7 + %i3] 0x88,	%i4
	brgez	%o2,	loop_1284
	movpos	%icc,	%l1,	%i7
	movleu	%icc,	%i1,	%i6
	fmovscc	%xcc,	%f14,	%f8
loop_1284:
	edge8l	%g6,	%l5,	%g7
	lduw	[%l7 + 0x7C],	%g2
	subcc	%o1,	0x1208,	%l0
	fmovda	%icc,	%f22,	%f19
	nop
	set	0x1B, %o3
	ldsb	[%l7 + %o3],	%l2
	fmovde	%xcc,	%f11,	%f30
	edge32l	%l6,	%o7,	%o0
	bgu,a	loop_1285
	fmovdl	%xcc,	%f7,	%f17
	fmovdneg	%icc,	%f25,	%f11
	nop
	set	0x7C, %i6
	sth	%o3,	[%l7 + %i6]
loop_1285:
	fmovrdgz	%l4,	%f12,	%f18
	fmul8ulx16	%f16,	%f16,	%f24
	ldd	[%l7 + 0x30],	%f14
	sub	%g1,	0x0A87,	%l3
	taddcc	%i5,	0x183A,	%o4
	edge32	%i3,	%g4,	%o5
	fsrc2	%f10,	%f18
	xorcc	%g5,	0x00B9,	%g3
	fornot2	%f22,	%f24,	%f16
	edge16ln	%o6,	%i2,	%i0
	andcc	%o2,	0x1A07,	%l1
	fbg,a	%fcc1,	loop_1286
	nop
	setx loop_1287, %l0, %l1
	jmpl %l1, %i7
	nop
	setx	loop_1288,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%xcc,	%i1,	%i4
loop_1286:
	fmovrsgz	%i6,	%f4,	%f22
loop_1287:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1288:
	edge32	%g6,	%l5,	%g2
	tg	%icc,	0x2
	andn	%o1,	%l0,	%g7
	fmovrdlez	%l2,	%f14,	%f16
	movne	%xcc,	%o7,	%l6
	fsrc2s	%f14,	%f0
	subccc	%o3,	%o0,	%l4
	fmovse	%xcc,	%f12,	%f29
	fnegd	%f4,	%f16
	edge8l	%l3,	%g1,	%o4
	be,pt	%xcc,	loop_1289
	fmovsge	%xcc,	%f7,	%f22
	fmovrdgez	%i5,	%f18,	%f16
	bl	%xcc,	loop_1290
loop_1289:
	fmovdcs	%xcc,	%f11,	%f2
	fmovdneg	%xcc,	%f23,	%f29
	nop
	setx loop_1291, %l0, %l1
	jmpl %l1, %i3
loop_1290:
	fcmpeq32	%f28,	%f8,	%o5
	wr	%g0,	0x10,	%asi
	sta	%f6,	[%l7 + 0x70] %asi
loop_1291:
	edge8ln	%g4,	%g5,	%o6
	set	0x45, %o7
	ldstuba	[%l7 + %o7] 0x80,	%i2
	fcmpeq16	%f10,	%f22,	%g3
	fpackfix	%f4,	%f19
	fbg,a	%fcc0,	loop_1292
	subccc	%o2,	0x0574,	%i0
	brgz,a	%l1,	loop_1293
	movn	%xcc,	%i7,	%i4
loop_1292:
	tvc	%icc,	0x7
	tvs	%xcc,	0x3
loop_1293:
	bne,a,pt	%icc,	loop_1294
	umulcc	%i1,	0x1D58,	%g6
	ldsw	[%l7 + 0x5C],	%i6
	movgu	%xcc,	%l5,	%o1
loop_1294:
	fbge	%fcc0,	loop_1295
	fmovs	%f24,	%f12
	tge	%xcc,	0x1
	addccc	%g2,	0x15C4,	%l0
loop_1295:
	fbge	%fcc0,	loop_1296
	bleu,pn	%icc,	loop_1297
	xorcc	%g7,	0x0E7E,	%l2
	tl	%xcc,	0x6
loop_1296:
	andncc	%l6,	%o3,	%o0
loop_1297:
	edge32	%o7,	%l3,	%g1
	mulscc	%o4,	%l4,	%i5
	flush	%l7 + 0x28
	fands	%f1,	%f27,	%f29
	array8	%o5,	%i3,	%g5
	fpsub32	%f30,	%f22,	%f24
	movrne	%g4,	%i2,	%o6
	edge32n	%g3,	%i0,	%o2
	array8	%i7,	%i4,	%i1
	fnor	%f18,	%f20,	%f24
	udiv	%l1,	0x019B,	%i6
	movcs	%xcc,	%l5,	%o1
	ba,a,pt	%xcc,	loop_1298
	fbue	%fcc1,	loop_1299
	tcs	%xcc,	0x4
	fmovdvc	%icc,	%f6,	%f12
loop_1298:
	tne	%xcc,	0x0
loop_1299:
	sllx	%g2,	%g6,	%l0
	fmovsle	%icc,	%f12,	%f0
	array32	%l2,	%g7,	%l6
	bn,pt	%icc,	loop_1300
	subcc	%o3,	0x09A9,	%o0
	fandnot2s	%f18,	%f23,	%f10
	ldsb	[%l7 + 0x14],	%o7
loop_1300:
	movg	%icc,	%l3,	%o4
	xorcc	%g1,	%l4,	%i5
	movn	%xcc,	%i3,	%o5
	set	0x18, %l1
	stda	%g4,	[%l7 + %l1] 0x04
	addcc	%g5,	0x13E9,	%o6
	alignaddrl	%g3,	%i0,	%o2
	wr	%g0,	0x19,	%asi
	sta	%f11,	[%l7 + 0x4C] %asi
	movgu	%xcc,	%i2,	%i7
	tgu	%icc,	0x7
	ldsw	[%l7 + 0x24],	%i4
	fpack32	%f24,	%f26,	%f14
	tne	%icc,	0x2
	fandnot1s	%f18,	%f12,	%f12
	edge8l	%i1,	%l1,	%l5
	subccc	%i6,	0x1FE5,	%g2
	fbl	%fcc1,	loop_1301
	fmovrsne	%o1,	%f19,	%f6
	edge8ln	%g6,	%l2,	%l0
	edge16n	%l6,	%g7,	%o0
loop_1301:
	fmul8x16au	%f18,	%f30,	%f20
	edge16l	%o3,	%o7,	%l3
	fmovda	%icc,	%f1,	%f14
	andn	%g1,	0x01C5,	%o4
	fbne	%fcc3,	loop_1302
	udivcc	%i5,	0x0799,	%i3
	tvc	%xcc,	0x0
	movre	%o5,	%l4,	%g4
loop_1302:
	fandnot1s	%f14,	%f17,	%f17
	fsrc1s	%f25,	%f26
	fmovspos	%xcc,	%f12,	%f18
	fnor	%f12,	%f4,	%f6
	fors	%f19,	%f17,	%f9
	fmovd	%f26,	%f30
	fcmpne16	%f14,	%f14,	%g5
	fmul8ulx16	%f12,	%f4,	%f16
	fxor	%f14,	%f16,	%f2
	srax	%o6,	%i0,	%o2
	set	0x38, %g3
	lduha	[%l7 + %g3] 0x19,	%g3
	xorcc	%i7,	0x15EB,	%i2
	tn	%xcc,	0x3
	addcc	%i1,	%i4,	%l1
	edge16n	%l5,	%i6,	%g2
	edge32l	%g6,	%l2,	%l0
	fandnot2	%f4,	%f14,	%f16
	membar	0x0D
	tcs	%xcc,	0x0
	swap	[%l7 + 0x1C],	%o1
	lduh	[%l7 + 0x10],	%l6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x22] %asi,	%o0
	srl	%o3,	0x0B,	%o7
	fmul8x16au	%f16,	%f8,	%f12
	orn	%l3,	%g1,	%o4
	edge32n	%i5,	%i3,	%o5
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x54] %asi,	%l4
	std	%f28,	[%l7 + 0x40]
	bn	%icc,	loop_1303
	movleu	%xcc,	%g7,	%g4
	movleu	%icc,	%g5,	%i0
	ba,a	loop_1304
loop_1303:
	fpsub32s	%f26,	%f10,	%f16
	fmovrsgz	%o6,	%f28,	%f28
	tl	%xcc,	0x1
loop_1304:
	call	loop_1305
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpes	%fcc2,	%f26,	%f13
	udivx	%o2,	0x1ACF,	%i7
loop_1305:
	brgez	%i2,	loop_1306
	addcc	%i1,	0x1864,	%g3
	edge32	%l1,	%l5,	%i6
	tsubcctv	%i4,	0x01B7,	%g6
loop_1306:
	fmovsleu	%xcc,	%f26,	%f18
	nop
	set	0x7E, %i1
	stb	%l2,	[%l7 + %i1]
	fnegs	%f27,	%f8
	nop
	setx	loop_1307,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%xcc,	0x2
	fexpand	%f30,	%f20
	orcc	%g2,	%o1,	%l0
loop_1307:
	fmovdle	%icc,	%f3,	%f11
	bcs,pn	%icc,	loop_1308
	movle	%xcc,	%o0,	%o3
	movgu	%icc,	%l6,	%o7
	tvc	%icc,	0x0
loop_1308:
	edge32	%l3,	%g1,	%o4
	srl	%i5,	0x06,	%o5
	edge8n	%i3,	%g7,	%l4
	xor	%g5,	%i0,	%o6
	nop
	setx loop_1309, %l0, %l1
	jmpl %l1, %o2
	movcc	%xcc,	%g4,	%i7
	fpackfix	%f26,	%f27
	fmovdcs	%xcc,	%f18,	%f28
loop_1309:
	tn	%xcc,	0x2
	edge16n	%i2,	%i1,	%g3
	movneg	%icc,	%l5,	%i6
	edge8n	%i4,	%g6,	%l2
	sdivcc	%g2,	0x16B4,	%o1
	nop
	set	0x20, %i5
	ldsh	[%l7 + %i5],	%l0
	tgu	%icc,	0x1
	fmovdle	%xcc,	%f16,	%f24
	fors	%f5,	%f2,	%f10
	movg	%xcc,	%l1,	%o0
	bcc,a	%icc,	loop_1310
	movre	%o3,	0x147,	%l6
	bneg,pt	%xcc,	loop_1311
	addcc	%l3,	%g1,	%o4
loop_1310:
	ba,a	loop_1312
	or	%i5,	0x078E,	%o5
loop_1311:
	tcc	%xcc,	0x0
	and	%o7,	%i3,	%l4
loop_1312:
	xnor	%g7,	%i0,	%o6
	tsubcctv	%g5,	0x0FD7,	%g4
	movn	%icc,	%o2,	%i7
	andncc	%i1,	%i2,	%l5
	subc	%i6,	0x000C,	%g3
	mulx	%i4,	%l2,	%g2
	edge16	%o1,	%g6,	%l1
	fmovrdgez	%o0,	%f12,	%f4
	fmovdle	%xcc,	%f13,	%f3
	movre	%l0,	0x0FC,	%l6
	orn	%l3,	%g1,	%o4
	orcc	%o3,	%i5,	%o5
	sub	%o7,	0x1C19,	%i3
	fones	%f20
	edge32l	%l4,	%i0,	%o6
	fmovdcc	%icc,	%f8,	%f7
	array16	%g5,	%g7,	%g4
	fmovsvc	%xcc,	%f23,	%f14
	fcmped	%fcc1,	%f14,	%f18
	andncc	%i7,	%o2,	%i1
	fbug	%fcc0,	loop_1313
	fabsd	%f12,	%f26
	movcs	%icc,	%l5,	%i2
	array8	%g3,	%i4,	%i6
loop_1313:
	movrgez	%l2,	0x1DF,	%g2
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x0E] %asi,	%o1
	sethi	0x0C95,	%l1
	fbul,a	%fcc0,	loop_1314
	fone	%f24
	addccc	%o0,	%g6,	%l6
	movleu	%icc,	%l0,	%l3
loop_1314:
	movl	%icc,	%g1,	%o4
	sdivcc	%i5,	0x164C,	%o3
	fcmps	%fcc1,	%f20,	%f14
	set	0x38, %l3
	ldxa	[%l7 + %l3] 0x18,	%o5
	movleu	%xcc,	%o7,	%i3
	bvs,pn	%icc,	loop_1315
	fcmpd	%fcc2,	%f6,	%f8
	brlez	%l4,	loop_1316
	nop
	setx	loop_1317,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1315:
	smulcc	%i0,	%o6,	%g5
	fxnors	%f16,	%f10,	%f29
loop_1316:
	tleu	%xcc,	0x7
loop_1317:
	nop
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%g4,	%g7
	movcs	%icc,	%i7,	%o2
	movrlez	%i1,	0x221,	%i2
	fmovrdgz	%l5,	%f24,	%f22
	ldd	[%l7 + 0x68],	%f14
	and	%g3,	%i6,	%l2
	alignaddr	%i4,	%g2,	%l1
	membar	0x4E
	andn	%o0,	0x006F,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f4,	%f12,	%f28
	taddcc	%l6,	%o1,	%l3
	edge8	%l0,	%g1,	%i5
	edge8l	%o4,	%o5,	%o7
	mulx	%o3,	%l4,	%i3
	fzero	%f30
	ldx	[%l7 + 0x28],	%i0
	be,pt	%xcc,	loop_1318
	tl	%icc,	0x3
	bleu,a	%icc,	loop_1319
	or	%o6,	%g5,	%g4
loop_1318:
	umul	%i7,	0x003C,	%g7
	popc	%i1,	%i2
loop_1319:
	array32	%o2,	%g3,	%l5
	edge8ln	%l2,	%i6,	%i4
	movcc	%xcc,	%g2,	%l1
	fcmps	%fcc1,	%f14,	%f6
	bne	%icc,	loop_1320
	taddcctv	%o0,	0x0B1E,	%g6
	tsubcc	%l6,	0x0713,	%l3
	orn	%o1,	%l0,	%i5
loop_1320:
	fmovrdlez	%o4,	%f10,	%f16
	edge16n	%g1,	%o5,	%o7
	xor	%o3,	%i3,	%i0
	set	0x20, %l5
	stda	%o6,	[%l7 + %l5] 0xe3
	membar	#Sync
	add	%l4,	%g4,	%g5
	sethi	0x014C,	%g7
	udivx	%i7,	0x0BFA,	%i1
	fors	%f15,	%f16,	%f5
	fmovspos	%icc,	%f25,	%f29
	movn	%xcc,	%o2,	%i2
	popc	0x0E79,	%l5
	fabss	%f23,	%f18
	movrgez	%l2,	%i6,	%i4
	movrlz	%g3,	%l1,	%g2
	nop
	setx loop_1321, %l0, %l1
	jmpl %l1, %g6
	udiv	%o0,	0x01ED,	%l6
	mulscc	%o1,	0x0196,	%l3
	smul	%i5,	%l0,	%o4
loop_1321:
	fpadd32s	%f25,	%f4,	%f28
	fone	%f10
	fcmpes	%fcc1,	%f0,	%f4
	set	0x3B, %o6
	ldstuba	[%l7 + %o6] 0x81,	%g1
	movcs	%icc,	%o7,	%o5
	fmovdl	%icc,	%f3,	%f28
	srax	%i3,	0x1D,	%o3
	fcmpd	%fcc3,	%f14,	%f8
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x74] %asi,	%o6
	tl	%icc,	0x6
	movneg	%icc,	%i0,	%g4
	sth	%g5,	[%l7 + 0x56]
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	fabss	%f2,	%f24
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x0C] %asi,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0346,	%g7
	fabss	%f8,	%f9
	array16	%i1,	%o2,	%l5
	alignaddr	%i2,	%i6,	%l2
	fmul8ulx16	%f12,	%f6,	%f0
	addcc	%g3,	0x16AE,	%l1
	siam	0x7
	fornot1s	%f0,	%f12,	%f1
	fble,a	%fcc1,	loop_1322
	fbg	%fcc2,	loop_1323
	alignaddr	%i4,	%g6,	%g2
	udiv	%l6,	0x1E26,	%o0
loop_1322:
	bcs,a	%icc,	loop_1324
loop_1323:
	alignaddr	%l3,	%o1,	%l0
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x11] %asi,	%o4
loop_1324:
	movleu	%icc,	%g1,	%i5
	sir	0x086C
	fbule	%fcc1,	loop_1325
	fmovdpos	%xcc,	%f0,	%f10
	array16	%o5,	%o7,	%o3
	brgez,a	%o6,	loop_1326
loop_1325:
	ldd	[%l7 + 0x68],	%i0
	fmovdle	%xcc,	%f29,	%f2
	mulscc	%g4,	%i3,	%l4
loop_1326:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%icc,	0x1
	fbule,a	%fcc3,	loop_1327
	xor	%i7,	%g7,	%i1
	tg	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1327:
	pdist	%f10,	%f12,	%f22
	tcs	%xcc,	0x5
	tn	%xcc,	0x4
	xor	%g5,	0x1B4E,	%o2
	fmovsleu	%icc,	%f2,	%f8
	movleu	%icc,	%l5,	%i6
	bpos,a	loop_1328
	fmovde	%xcc,	%f18,	%f21
	set	0x48, %l2
	ldswa	[%l7 + %l2] 0x19,	%l2
loop_1328:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f29,	[%l7 + 0x38] %asi
	fmovsg	%xcc,	%f24,	%f1
	movcs	%xcc,	%g3,	%l1
	subccc	%i2,	%i4,	%g2
	fmul8x16au	%f7,	%f0,	%f12
	fpsub16s	%f0,	%f27,	%f13
	bshuffle	%f30,	%f26,	%f2
	xorcc	%l6,	0x0473,	%o0
	array16	%g6,	%o1,	%l0
	fbge	%fcc0,	loop_1329
	pdist	%f10,	%f10,	%f26
	bl	%xcc,	loop_1330
	sdiv	%o4,	0x1043,	%l3
loop_1329:
	edge16ln	%i5,	%o5,	%g1
	set	0x39, %g2
	stba	%o3,	[%l7 + %g2] 0x0c
loop_1330:
	movpos	%xcc,	%o6,	%o7
	bg,a	loop_1331
	udivx	%i0,	0x0617,	%g4
	orn	%i3,	%i7,	%l4
	edge16	%i1,	%g7,	%o2
loop_1331:
	fors	%f30,	%f28,	%f14
	movrne	%g5,	0x05C,	%l5
	alignaddrl	%l2,	%i6,	%l1
	movrlz	%g3,	%i4,	%g2
	ta	%icc,	0x2
	movneg	%xcc,	%i2,	%o0
	xorcc	%g6,	%l6,	%o1
	pdist	%f4,	%f26,	%f30
	edge16n	%l0,	%l3,	%o4
	set	0x10, %g5
	ldda	[%l7 + %g5] 0x2b,	%o4
	mulscc	%i5,	0x1127,	%g1
	fmovrslez	%o3,	%f3,	%f11
	fzeros	%f14
	srlx	%o7,	%i0,	%g4
	edge16l	%i3,	%o6,	%l4
	andncc	%i7,	%i1,	%g7
	nop
	setx	loop_1332,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movn	%icc,	%o2,	%g5
	edge32n	%l5,	%i6,	%l2
	fand	%f6,	%f16,	%f30
loop_1332:
	orncc	%l1,	0x1A36,	%g3
	for	%f24,	%f10,	%f28
	set	0x60, %o5
	stwa	%g2,	[%l7 + %o5] 0x0c
	tgu	%xcc,	0x0
	ld	[%l7 + 0x68],	%f18
	or	%i2,	%i4,	%o0
	fors	%f19,	%f23,	%f6
	sir	0x1470
	movleu	%icc,	%g6,	%l6
	edge32n	%o1,	%l0,	%o4
	tcs	%icc,	0x4
	smul	%o5,	%l3,	%g1
	movcs	%icc,	%i5,	%o3
	sra	%o7,	0x18,	%g4
	edge16n	%i3,	%i0,	%o6
	orcc	%l4,	0x0608,	%i7
	tge	%icc,	0x4
	alignaddrl	%i1,	%o2,	%g7
	edge32	%l5,	%g5,	%l2
	tsubcc	%l1,	%g3,	%i6
	bcc,a	%icc,	loop_1333
	xnorcc	%g2,	%i4,	%i2
	lduh	[%l7 + 0x2A],	%g6
	std	%i6,	[%l7 + 0x68]
loop_1333:
	movrgez	%o1,	%l0,	%o4
	ble,pt	%xcc,	loop_1334
	smul	%o5,	%o0,	%g1
	ble,a,pt	%icc,	loop_1335
	tsubcctv	%l3,	%i5,	%o3
loop_1334:
	tneg	%icc,	0x4
	fmovde	%xcc,	%f4,	%f29
loop_1335:
	movl	%icc,	%g4,	%i3
	movleu	%icc,	%o7,	%o6
	edge8l	%i0,	%l4,	%i7
	fexpand	%f25,	%f12
	fmovd	%f30,	%f18
	subc	%o2,	0x06B6,	%i1
	fbl	%fcc1,	loop_1336
	movgu	%icc,	%g7,	%l5
	taddcctv	%l2,	%l1,	%g3
	tsubcctv	%i6,	0x1D8E,	%g5
loop_1336:
	addcc	%i4,	%g2,	%i2
	addc	%l6,	%g6,	%o1
	xorcc	%o4,	%o5,	%o0
	sra	%l0,	0x1D,	%g1
	udivcc	%i5,	0x050F,	%l3
	subccc	%g4,	0x036D,	%o3
	fba,a	%fcc3,	loop_1337
	move	%xcc,	%i3,	%o7
	alignaddr	%i0,	%l4,	%o6
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%i1
loop_1337:
	fmovsvc	%icc,	%f14,	%f17
	movcs	%icc,	%g7,	%o2
	set	0x64, %i0
	lduwa	[%l7 + %i0] 0x14,	%l2
	fcmpes	%fcc0,	%f27,	%f19
	andn	%l5,	0x1266,	%l1
	array16	%g3,	%i6,	%g5
	srax	%g2,	0x0D,	%i2
	movleu	%icc,	%i4,	%g6
	fandnot1	%f8,	%f4,	%f12
	movrne	%o1,	0x3E2,	%l6
	movvs	%icc,	%o5,	%o0
	xorcc	%o4,	0x12C0,	%g1
	sllx	%l0,	0x01,	%l3
	fmovspos	%xcc,	%f11,	%f11
	fmovdvc	%icc,	%f5,	%f10
	addc	%g4,	0x0037,	%o3
	tl	%icc,	0x3
	bneg	loop_1338
	fone	%f28
	fnegs	%f4,	%f23
	udiv	%i3,	0x0696,	%i5
loop_1338:
	nop
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x70] %asi,	%i0
	movl	%xcc,	%o7,	%o6
	bn,pn	%xcc,	loop_1339
	subccc	%i7,	0x1A22,	%l4
	array32	%g7,	%i1,	%o2
	sll	%l5,	%l2,	%g3
loop_1339:
	addc	%l1,	%i6,	%g2
	te	%icc,	0x4
	udivx	%i2,	0x1BDF,	%i4
	edge32ln	%g6,	%o1,	%g5
	movrgez	%l6,	%o0,	%o5
	edge16n	%g1,	%o4,	%l0
	ldub	[%l7 + 0x7B],	%l3
	tcc	%icc,	0x0
	std	%g4,	[%l7 + 0x58]
	tge	%xcc,	0x3
	addccc	%o3,	0x197C,	%i5
	fmovrde	%i3,	%f14,	%f10
	array32	%o7,	%i0,	%o6
	subccc	%l4,	%i7,	%i1
	fone	%f30
	brlz	%o2,	loop_1340
	addc	%g7,	%l5,	%g3
	fbg,a	%fcc3,	loop_1341
	sll	%l2,	0x1D,	%i6
loop_1340:
	movn	%icc,	%g2,	%i2
	fmovsle	%xcc,	%f30,	%f18
loop_1341:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x56] %asi,	%i4
	sdivcc	%l1,	0x1C82,	%g6
	tvs	%icc,	0x4
	set	0x28, %o4
	stxa	%g5,	[%l7 + %o4] 0xe2
	membar	#Sync
	tvs	%xcc,	0x3
	fornot2	%f22,	%f28,	%f30
	fpack32	%f18,	%f12,	%f26
	tcc	%icc,	0x6
	set	0x46, %i2
	stba	%o1,	[%l7 + %i2] 0x88
	taddcctv	%l6,	0x1DFC,	%o5
	subc	%o0,	%o4,	%l0
	tn	%xcc,	0x5
	fbug	%fcc2,	loop_1342
	edge32ln	%l3,	%g4,	%o3
	subccc	%i5,	0x0062,	%i3
	movl	%xcc,	%o7,	%g1
loop_1342:
	srl	%i0,	%o6,	%l4
	fpsub16	%f14,	%f10,	%f16
	fmovsleu	%icc,	%f31,	%f15
	nop
	set	0x3E, %g1
	stb	%i1,	[%l7 + %g1]
	sub	%i7,	%o2,	%l5
	subcc	%g7,	0x060D,	%g3
	bleu	%xcc,	loop_1343
	fmovsn	%xcc,	%f26,	%f28
	fmovrslez	%l2,	%f1,	%f26
	for	%f6,	%f10,	%f20
loop_1343:
	movvc	%icc,	%i6,	%g2
	tneg	%icc,	0x3
	subcc	%i4,	0x0661,	%i2
	set	0x6C, %l4
	lduwa	[%l7 + %l4] 0x89,	%g6
	bshuffle	%f14,	%f0,	%f30
	movpos	%icc,	%g5,	%o1
	srax	%l1,	0x11,	%l6
	fmovsneg	%icc,	%f13,	%f5
	ba,a	loop_1344
	umulcc	%o0,	0x052F,	%o5
	bvs	loop_1345
	bg,pn	%icc,	loop_1346
loop_1344:
	movvc	%icc,	%o4,	%l0
	sll	%g4,	%o3,	%i5
loop_1345:
	movvc	%xcc,	%i3,	%l3
loop_1346:
	fmuld8ulx16	%f27,	%f10,	%f18
	mulx	%g1,	%i0,	%o6
	edge8l	%l4,	%o7,	%i1
	tvs	%xcc,	0x1
	movrgz	%i7,	%l5,	%o2
	lduh	[%l7 + 0x24],	%g3
	flush	%l7 + 0x6C
	set	0x20, %l0
	ldda	[%l7 + %l0] 0x26,	%g6
	tcs	%icc,	0x3
	edge16n	%l2,	%i6,	%g2
	edge16ln	%i2,	%g6,	%g5
	tvs	%xcc,	0x4
	xnor	%o1,	%l1,	%i4
	fblg,a	%fcc1,	loop_1347
	taddcctv	%l6,	0x0820,	%o5
	andcc	%o0,	%o4,	%l0
	stb	%o3,	[%l7 + 0x0D]
loop_1347:
	movle	%icc,	%i5,	%g4
	fba,a	%fcc2,	loop_1348
	fbl,a	%fcc0,	loop_1349
	sdivx	%l3,	0x1F0E,	%i3
	sir	0x0026
loop_1348:
	andn	%i0,	%g1,	%l4
loop_1349:
	tneg	%xcc,	0x2
	fnand	%f0,	%f16,	%f10
	fmovdpos	%icc,	%f28,	%f26
	sdiv	%o7,	0x184D,	%i1
	subcc	%i7,	0x0786,	%o6
	bgu,a,pn	%xcc,	loop_1350
	movg	%xcc,	%l5,	%g3
	bl,pn	%icc,	loop_1351
	srax	%o2,	0x1C,	%l2
loop_1350:
	stb	%i6,	[%l7 + 0x76]
	subc	%g2,	%g7,	%i2
loop_1351:
	lduh	[%l7 + 0x4A],	%g5
	bcc,a	%icc,	loop_1352
	umulcc	%o1,	0x1D86,	%l1
	bg,a	loop_1353
	fbne,a	%fcc3,	loop_1354
loop_1352:
	faligndata	%f2,	%f10,	%f8
	set	0x78, %i4
	ldxa	[%l7 + %i4] 0x89,	%g6
loop_1353:
	fnot2s	%f24,	%f13
loop_1354:
	edge32n	%l6,	%i4,	%o5
	fmovse	%icc,	%f12,	%f22
	array16	%o4,	%o0,	%o3
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i5
	andn	%g4,	0x0CA6,	%l0
	ldd	[%l7 + 0x28],	%l2
	sub	%i0,	%g1,	%i3
	sub	%o7,	%i1,	%i7
	edge8l	%l4,	%o6,	%g3
	bcs,a	%icc,	loop_1355
	fnegd	%f26,	%f2
	brz	%l5,	loop_1356
	movcc	%xcc,	%o2,	%l2
loop_1355:
	array16	%i6,	%g7,	%g2
	tleu	%xcc,	0x1
loop_1356:
	fmovsg	%icc,	%f27,	%f23
	set	0x5C, %i7
	lda	[%l7 + %i7] 0x15,	%f20
	edge32ln	%i2,	%o1,	%l1
	fbg,a	%fcc0,	loop_1357
	sub	%g5,	%g6,	%l6
	tleu	%icc,	0x3
	taddcctv	%o5,	%i4,	%o4
loop_1357:
	fmovsvs	%xcc,	%f26,	%f5
	movcs	%icc,	%o3,	%i5
	tl	%xcc,	0x4
	umul	%o0,	%l0,	%g4
	fbge	%fcc3,	loop_1358
	fmovscs	%icc,	%f1,	%f27
	movrgez	%l3,	0x1D6,	%g1
	fmovdcs	%xcc,	%f16,	%f28
loop_1358:
	nop
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x08] %asi,	%f23
	prefetch	[%l7 + 0x48],	 0x1
	sllx	%i0,	0x0C,	%o7
	fnot1	%f30,	%f28
	tsubcctv	%i1,	%i3,	%i7
	or	%o6,	0x1A6B,	%g3
	ldsb	[%l7 + 0x57],	%l5
	fbne,a	%fcc0,	loop_1359
	sdivx	%l4,	0x0AA0,	%o2
	movgu	%xcc,	%i6,	%l2
	fsrc2s	%f30,	%f11
loop_1359:
	taddcctv	%g7,	0x03A6,	%g2
	brlez,a	%i2,	loop_1360
	udivx	%o1,	0x058C,	%g5
	set	0x30, %g6
	prefetcha	[%l7 + %g6] 0x04,	 0x3
loop_1360:
	fmovscs	%icc,	%f31,	%f11
	fornot2	%f2,	%f18,	%f28
	fmovd	%f4,	%f8
	taddcc	%g6,	%l6,	%i4
	ldstub	[%l7 + 0x4C],	%o5
	addc	%o3,	0x1733,	%i5
	subccc	%o0,	%l0,	%g4
	ldx	[%l7 + 0x60],	%o4
	fmovrdgz	%g1,	%f20,	%f8
	nop
	setx	loop_1361,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sethi	0x07F0,	%l3
	andn	%o7,	0x1F3C,	%i1
	fbuge,a	%fcc2,	loop_1362
loop_1361:
	sdivx	%i3,	0x1E0E,	%i7
	movrgez	%o6,	0x361,	%i0
	bg,a	loop_1363
loop_1362:
	movrgez	%g3,	%l4,	%l5
	tg	%xcc,	0x4
	ldsw	[%l7 + 0x54],	%i6
loop_1363:
	sra	%l2,	0x09,	%g7
	sll	%o2,	%g2,	%o1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x13] %asi,	%g5
	fmovrse	%i2,	%f26,	%f15
	fbue,a	%fcc3,	loop_1364
	sdiv	%g6,	0x16BA,	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%o5
loop_1364:
	taddcctv	%o3,	0x08E5,	%i4
	fbo	%fcc2,	loop_1365
	brgz,a	%i5,	loop_1366
	sdiv	%o0,	0x09F1,	%g4
	edge8	%o4,	%l0,	%g1
loop_1365:
	edge16	%o7,	%i1,	%l3
loop_1366:
	srlx	%i7,	%i3,	%i0
	fsrc2s	%f19,	%f25
	xnorcc	%g3,	%o6,	%l4
	andncc	%l5,	%i6,	%g7
	movrlz	%l2,	0x2E5,	%g2
	brz	%o2,	loop_1367
	te	%icc,	0x5
	mova	%icc,	%o1,	%i2
	pdist	%f28,	%f20,	%f10
loop_1367:
	fzeros	%f2
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x64] %asi,	%g6
	smul	%g5,	0x144C,	%l6
	sdivcc	%o5,	0x0622,	%l1
	addcc	%i4,	0x17F0,	%i5
	sub	%o3,	%g4,	%o4
	fmovdvs	%icc,	%f12,	%f17
	te	%xcc,	0x6
	fmovdpos	%icc,	%f3,	%f29
	mulx	%o0,	%l0,	%g1
	srlx	%o7,	0x1A,	%i1
	wr	%g0,	0x89,	%asi
	stwa	%l3,	[%l7 + 0x10] %asi
	tge	%xcc,	0x3
	fmul8x16al	%f29,	%f7,	%f8
	fornot2	%f0,	%f20,	%f22
	ld	[%l7 + 0x48],	%f26
	stb	%i3,	[%l7 + 0x75]
	xorcc	%i7,	0x054E,	%i0
	movpos	%xcc,	%o6,	%l4
	orcc	%g3,	0x0924,	%i6
	fmuld8ulx16	%f29,	%f5,	%f18
	fcmple32	%f14,	%f18,	%l5
	tl	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l2,	%g2,	%o2
	nop
	set	0x58, %g4
	stx	%g7,	[%l7 + %g4]
	xorcc	%o1,	0x0B36,	%g6
	fandnot1s	%f6,	%f18,	%f3
	alignaddrl	%i2,	%g5,	%o5
	xorcc	%l1,	0x0A8E,	%i4
	udivx	%i5,	0x0A06,	%l6
	movcs	%xcc,	%o3,	%g4
	xor	%o4,	%l0,	%o0
	fpmerge	%f20,	%f17,	%f16
	fandnot2	%f22,	%f16,	%f8
	movrlez	%g1,	0x1F5,	%o7
	movrgz	%l3,	0x36E,	%i1
	srl	%i7,	0x0C,	%i0
	fbn,a	%fcc3,	loop_1368
	add	%i3,	0x1F08,	%l4
	fnegs	%f28,	%f13
	movrne	%g3,	%i6,	%l5
loop_1368:
	siam	0x4
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x17
	membar	#Sync
	fmovsvs	%icc,	%f2,	%f3
	fmovdgu	%xcc,	%f4,	%f22
	udivx	%o6,	0x01D8,	%l2
	addcc	%o2,	0x185F,	%g2
	movvc	%icc,	%g7,	%g6
	ldx	[%l7 + 0x78],	%i2
	edge16ln	%g5,	%o5,	%l1
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	popc	%o1,	%i5
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x61] %asi,	%i4
	ldd	[%l7 + 0x70],	%f24
	siam	0x6
	movvs	%xcc,	%o3,	%l6
	fmovrdlz	%o4,	%f10,	%f2
	addcc	%g4,	%o0,	%l0
	fmovdle	%xcc,	%f0,	%f28
	movvc	%icc,	%o7,	%g1
	fmovrdlez	%i1,	%f8,	%f4
	set	0x74, %l6
	sta	%f8,	[%l7 + %l6] 0x89
	tcs	%icc,	0x0
	edge32l	%l3,	%i0,	%i3
	movrgez	%i7,	0x3E7,	%l4
	fmovrdgez	%g3,	%f20,	%f12
	fmovda	%icc,	%f19,	%f9
	movrlz	%l5,	0x071,	%o6
	umul	%l2,	%i6,	%o2
	sir	0x044F
	ldstub	[%l7 + 0x21],	%g7
	nop
	setx	loop_1369,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrne	%g6,	%g2,	%g5
	ldsw	[%l7 + 0x44],	%o5
	smulcc	%i2,	%o1,	%i5
loop_1369:
	nop
	wr	%g0,	0x19,	%asi
	stxa	%i4,	[%l7 + 0x30] %asi
	fpadd16	%f16,	%f26,	%f18
	andncc	%o3,	%l1,	%l6
	andcc	%g4,	0x1E24,	%o4
	subcc	%o0,	%o7,	%g1
	srl	%i1,	0x0C,	%l0
	edge32l	%i0,	%i3,	%l3
	taddcc	%l4,	%i7,	%l5
	fpadd16	%f12,	%f0,	%f0
	fba	%fcc0,	loop_1370
	subcc	%o6,	0x1C86,	%g3
	array32	%l2,	%o2,	%i6
	fbge	%fcc1,	loop_1371
loop_1370:
	fbue,a	%fcc2,	loop_1372
	te	%xcc,	0x4
	movn	%icc,	%g7,	%g2
loop_1371:
	addc	%g6,	%g5,	%i2
loop_1372:
	fmovsle	%xcc,	%f20,	%f31
	array8	%o1,	%i5,	%o5
	tn	%icc,	0x2
	bpos	loop_1373
	fones	%f5
	sethi	0x13EF,	%o3
	fmovsg	%xcc,	%f12,	%f7
loop_1373:
	fmovdcs	%icc,	%f24,	%f3
	tge	%icc,	0x5
	edge32	%i4,	%l6,	%l1
	fandnot1	%f20,	%f28,	%f6
	set	0x7E, %o2
	stha	%o4,	[%l7 + %o2] 0x18
	fmovrdgz	%g4,	%f6,	%f12
	add	%o0,	%o7,	%i1
	sub	%g1,	0x14A7,	%i0
	array16	%l0,	%l3,	%i3
	fnors	%f17,	%f22,	%f0
	call	loop_1374
	xor	%i7,	0x0A65,	%l5
	movgu	%xcc,	%l4,	%o6
	fnot1	%f16,	%f24
loop_1374:
	fmul8x16	%f5,	%f8,	%f22
	alignaddr	%g3,	%l2,	%i6
	tl	%icc,	0x5
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x34] %asi,	%g7
	fnand	%f20,	%f2,	%f14
	fbul,a	%fcc2,	loop_1375
	movvc	%xcc,	%g2,	%o2
	ldd	[%l7 + 0x70],	%f30
	fpadd32	%f2,	%f16,	%f14
loop_1375:
	movne	%xcc,	%g5,	%g6
	fmovsn	%xcc,	%f2,	%f2
	bvs	loop_1376
	array8	%i2,	%i5,	%o1
	tg	%xcc,	0x1
	bge,a	loop_1377
loop_1376:
	xorcc	%o3,	%o5,	%i4
	xorcc	%l1,	%l6,	%o4
	ldstub	[%l7 + 0x58],	%o0
loop_1377:
	movcs	%icc,	%o7,	%i1
	movrgez	%g4,	%i0,	%g1
	fbug,a	%fcc3,	loop_1378
	stbar
	brnz,a	%l3,	loop_1379
	movvs	%xcc,	%i3,	%i7
loop_1378:
	edge8	%l0,	%l5,	%l4
	movrgez	%o6,	%l2,	%i6
loop_1379:
	brnz,a	%g3,	loop_1380
	orcc	%g2,	%g7,	%o2
	addc	%g5,	0x1674,	%g6
	tneg	%icc,	0x1
loop_1380:
	fmovsn	%icc,	%f2,	%f22
	tvc	%icc,	0x5
	fnors	%f13,	%f17,	%f0
	nop
	setx	loop_1381,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdvc	%xcc,	%f24,	%f28
	array16	%i5,	%i2,	%o3
	sir	0x1E54
loop_1381:
	subccc	%o5,	%o1,	%i4
	movre	%l1,	0x191,	%l6
	array16	%o4,	%o0,	%i1
	movrgz	%o7,	0x00D,	%i0
	tne	%icc,	0x6
	tleu	%icc,	0x6
	fandnot1s	%f12,	%f6,	%f29
	movcs	%icc,	%g1,	%l3
	fmovsne	%xcc,	%f28,	%f8
	fnegd	%f26,	%f26
	fcmpeq32	%f8,	%f8,	%g4
	srl	%i7,	0x18,	%i3
	set	0x2C, %o1
	lduha	[%l7 + %o1] 0x18,	%l5
	nop
	setx	loop_1382,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdlez	%l0,	%f18,	%f30
	ba,a	loop_1383
	edge16n	%o6,	%l2,	%l4
loop_1382:
	nop
	set	0x208, %g7
	ldxa	[%g0 + %g7] 0x52,	%i6
loop_1383:
	movre	%g2,	0x29A,	%g7
	orncc	%o2,	%g5,	%g3
	edge8ln	%i5,	%g6,	%o3
	edge8	%o5,	%o1,	%i4
	orn	%i2,	%l6,	%l1
	fcmple16	%f6,	%f30,	%o4
	and	%o0,	%i1,	%o7
	tn	%icc,	0x4
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x64] %asi,	%i0
	addccc	%l3,	0x0A15,	%g1
	fones	%f3
	addc	%i7,	0x1E02,	%g4
	te	%icc,	0x1
	movvc	%icc,	%i3,	%l0
	fandnot1s	%f29,	%f31,	%f25
	set	0x78, %o3
	stda	%l4,	[%l7 + %o3] 0x0c
	subcc	%o6,	%l4,	%l2
	nop
	setx	loop_1384,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x4
loop_1384:
	ba,a	loop_1385
	orncc	%i6,	%g7,	%g2
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x51] %asi,	%g5
loop_1385:
	fmovdpos	%xcc,	%f0,	%f21
	tneg	%xcc,	0x4
	bvc,a	loop_1386
	fbne	%fcc1,	loop_1387
	umul	%g3,	%i5,	%o2
	movrgz	%g6,	0x24C,	%o5
loop_1386:
	fnot1	%f20,	%f18
loop_1387:
	ldsh	[%l7 + 0x2E],	%o3
	flush	%l7 + 0x4C
	tn	%icc,	0x7
	fpadd16	%f22,	%f6,	%f10
	fmovscc	%xcc,	%f21,	%f30
	sdiv	%o1,	0x084E,	%i2
	edge8	%i4,	%l1,	%o4
	subc	%o0,	%l6,	%i1
	tcs	%xcc,	0x7
	movrgez	%o7,	%i0,	%g1
	fcmpeq16	%f6,	%f6,	%i7
	fblg	%fcc0,	loop_1388
	movrlez	%g4,	%i3,	%l0
	movpos	%icc,	%l3,	%o6
	fandnot1s	%f2,	%f22,	%f3
loop_1388:
	edge32l	%l5,	%l4,	%l2
	std	%g6,	[%l7 + 0x78]
	fmul8x16al	%f31,	%f12,	%f10
	membar	0x51
	add	%g2,	0x1FD8,	%g5
	fmovrdlez	%i6,	%f0,	%f18
	tleu	%icc,	0x4
	sir	0x1764
	fbule	%fcc0,	loop_1389
	edge32l	%i5,	%o2,	%g6
	subcc	%o5,	0x0173,	%g3
	addc	%o1,	%i2,	%o3
loop_1389:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%l1
	srl	%i4,	0x15,	%o4
	mulx	%o0,	%l6,	%i1
	movrgz	%o7,	%g1,	%i7
	ta	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i0,	%g4,	%i3
	movneg	%xcc,	%l3,	%l0
	tcs	%xcc,	0x3
	edge16ln	%o6,	%l4,	%l2
	movcc	%icc,	%g7,	%l5
	smulcc	%g2,	%i6,	%g5
	edge16n	%i5,	%o2,	%g6
	fmovspos	%icc,	%f3,	%f20
	fcmpeq32	%f30,	%f14,	%g3
	tne	%xcc,	0x0
	movne	%icc,	%o1,	%o5
	movg	%xcc,	%o3,	%i2
	fone	%f2
	movneg	%icc,	%i4,	%l1
	alignaddrl	%o0,	%l6,	%o4
	fmovdneg	%xcc,	%f2,	%f23
	umul	%o7,	%i1,	%i7
	umul	%i0,	0x071A,	%g1
	fmovsg	%xcc,	%f17,	%f30
	movne	%xcc,	%i3,	%l3
	add	%l0,	0x031F,	%g4
	fandnot1	%f16,	%f10,	%f14
	movrlz	%o6,	%l2,	%g7
	movgu	%xcc,	%l5,	%g2
	or	%i6,	0x06F1,	%g5
	sir	0x18EA
	set	0x38, %i6
	ldswa	[%l7 + %i6] 0x18,	%l4
	tl	%xcc,	0x6
	fornot1s	%f19,	%f14,	%f9
	udivx	%o2,	0x1C61,	%i5
	fbg,a	%fcc1,	loop_1390
	tsubcc	%g6,	0x0CDE,	%g3
	addcc	%o1,	%o3,	%o5
	addc	%i4,	%i2,	%o0
loop_1390:
	subc	%l6,	%l1,	%o4
	movneg	%icc,	%i1,	%i7
	brgez	%o7,	loop_1391
	tleu	%icc,	0x6
	fmovspos	%icc,	%f23,	%f11
	movcs	%xcc,	%i0,	%g1
loop_1391:
	bge	%icc,	loop_1392
	tleu	%xcc,	0x7
	movl	%xcc,	%l3,	%l0
	fandnot1s	%f9,	%f14,	%f1
loop_1392:
	sethi	0x19E6,	%i3
	bneg,pt	%xcc,	loop_1393
	be,a	%xcc,	loop_1394
	fsrc1	%f8,	%f10
	fmovsle	%xcc,	%f1,	%f19
loop_1393:
	tpos	%icc,	0x6
loop_1394:
	fcmpeq16	%f14,	%f4,	%g4
	subccc	%l2,	%g7,	%l5
	movge	%xcc,	%g2,	%o6
	andn	%g5,	%i6,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc2,	loop_1395
	fpsub16	%f2,	%f30,	%f4
	swap	[%l7 + 0x18],	%o2
	fbo,a	%fcc2,	loop_1396
loop_1395:
	stb	%i5,	[%l7 + 0x41]
	fcmpgt32	%f22,	%f0,	%g6
	smul	%o1,	%g3,	%o5
loop_1396:
	fmovda	%icc,	%f9,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmped	%fcc0,	%f12,	%f2
	taddcc	%o3,	%i4,	%i2
	alignaddr	%l6,	%l1,	%o0
	bcs,a	loop_1397
	stx	%i1,	[%l7 + 0x60]
	orcc	%i7,	0x0208,	%o4
	fbn	%fcc2,	loop_1398
loop_1397:
	ldsw	[%l7 + 0x28],	%o7
	fmovdneg	%xcc,	%f19,	%f23
	sethi	0x0DE8,	%g1
loop_1398:
	nop
	set	0x48, %i3
	prefetcha	[%l7 + %i3] 0x18,	 0x2
	fexpand	%f1,	%f0
	sethi	0x083B,	%l0
	smulcc	%i3,	0x0889,	%l3
	fmovsa	%icc,	%f30,	%f21
	popc	%l2,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g4,	%l5,	%o6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%g5,	%i6
	bn	%xcc,	loop_1399
	addcc	%l4,	0x0B94,	%g2
	andncc	%i5,	%o2,	%g6
	tcc	%xcc,	0x6
loop_1399:
	mulscc	%g3,	%o5,	%o3
	umulcc	%o1,	0x044A,	%i4
	tle	%xcc,	0x2
	bshuffle	%f8,	%f26,	%f12
	edge16l	%i2,	%l6,	%o0
	set	0x34, %l1
	lda	[%l7 + %l1] 0x81,	%f7
	set	0x44, %g3
	ldswa	[%l7 + %g3] 0x18,	%i1
	movrgz	%l1,	0x3FA,	%o4
	tcs	%icc,	0x2
	fcmple32	%f12,	%f2,	%i7
	st	%f17,	[%l7 + 0x18]
	te	%icc,	0x5
	edge8l	%o7,	%g1,	%l0
	udivcc	%i0,	0x1400,	%i3
	tvc	%xcc,	0x4
	sdivcc	%l2,	0x0784,	%l3
	movcc	%xcc,	%g4,	%l5
	edge16ln	%o6,	%g7,	%g5
	bgu,pn	%icc,	loop_1400
	umulcc	%l4,	%g2,	%i6
	mulx	%i5,	0x0EC5,	%o2
	subcc	%g6,	%g3,	%o3
loop_1400:
	sll	%o5,	%i4,	%i2
	set	0x34, %o7
	sta	%f17,	[%l7 + %o7] 0x14
	fxors	%f22,	%f26,	%f22
	lduh	[%l7 + 0x18],	%l6
	stx	%o0,	[%l7 + 0x60]
	mulx	%i1,	%l1,	%o1
	tge	%icc,	0x3
	flush	%l7 + 0x5C
	sllx	%o4,	%i7,	%g1
	fbe	%fcc1,	loop_1401
	ld	[%l7 + 0x20],	%f31
	ldsh	[%l7 + 0x08],	%l0
	sub	%i0,	0x169C,	%i3
loop_1401:
	fsrc2	%f28,	%f12
	fabsd	%f24,	%f30
	movl	%icc,	%l2,	%o7
	udivcc	%g4,	0x0C60,	%l3
	movleu	%xcc,	%l5,	%g7
	set	0x11, %i1
	ldstuba	[%l7 + %i1] 0x88,	%g5
	edge8n	%o6,	%l4,	%g2
	movn	%icc,	%i6,	%i5
	fpack16	%f20,	%f31
	fcmpd	%fcc0,	%f20,	%f2
	fpadd32s	%f15,	%f24,	%f28
	addccc	%g6,	%o2,	%g3
	siam	0x1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%o3,	%i4
	smulcc	%o5,	%i2,	%l6
	edge16	%i1,	%l1,	%o0
	stbar
	xorcc	%o1,	0x1200,	%i7
	nop
	setx	loop_1402,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcc	%icc,	0x1
	movg	%xcc,	%g1,	%o4
	tsubcctv	%i0,	%l0,	%i3
loop_1402:
	fands	%f2,	%f22,	%f2
	fmul8x16	%f20,	%f0,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o7,	0x1CDD,	%l2
	tpos	%icc,	0x3
	edge32n	%g4,	%l5,	%l3
	tvc	%xcc,	0x0
	fmovsge	%xcc,	%f29,	%f0
	tle	%icc,	0x5
	set	0x50, %l3
	stxa	%g7,	[%l7 + %l3] 0x88
	fmovspos	%icc,	%f21,	%f19
	alignaddrl	%o6,	%l4,	%g5
	ble,pt	%icc,	loop_1403
	tge	%xcc,	0x3
	tvc	%icc,	0x1
	ldsw	[%l7 + 0x44],	%g2
loop_1403:
	popc	%i5,	%i6
	fmovrslz	%o2,	%f0,	%f12
	edge32	%g3,	%o3,	%g6
	umulcc	%i4,	0x1F06,	%i2
	ldstub	[%l7 + 0x52],	%o5
	mova	%icc,	%i1,	%l1
	alignaddrl	%o0,	%l6,	%o1
	set	0x48, %l5
	stxa	%i7,	[%l7 + %l5] 0xea
	membar	#Sync
	fandnot2s	%f12,	%f18,	%f0
	fbug,a	%fcc3,	loop_1404
	fpack32	%f30,	%f18,	%f28
	fsrc2s	%f25,	%f12
	sub	%g1,	0x124D,	%o4
loop_1404:
	move	%icc,	%l0,	%i0
	fands	%f31,	%f9,	%f9
	fbule,a	%fcc2,	loop_1405
	tl	%xcc,	0x6
	bleu,pn	%xcc,	loop_1406
	tgu	%xcc,	0x4
loop_1405:
	fpack16	%f30,	%f3
	subc	%o7,	%l2,	%i3
loop_1406:
	mulx	%l5,	0x1DDE,	%g4
	te	%xcc,	0x2
	tle	%xcc,	0x0
	fcmple32	%f30,	%f20,	%g7
	srlx	%l3,	0x0D,	%o6
	prefetch	[%l7 + 0x5C],	 0x0
	xorcc	%l4,	0x1C8B,	%g2
	edge16	%i5,	%i6,	%o2
	tge	%xcc,	0x3
	mova	%xcc,	%g3,	%g5
	movrlz	%o3,	0x0B9,	%g6
	fcmpeq16	%f26,	%f14,	%i2
	andn	%i4,	0x14B8,	%o5
	xor	%i1,	%l1,	%o0
	edge16	%l6,	%o1,	%g1
	fmul8sux16	%f20,	%f10,	%f18
	fmovrdlz	%i7,	%f12,	%f26
	edge32	%l0,	%i0,	%o4
	fpadd32s	%f12,	%f1,	%f5
	fbo,a	%fcc2,	loop_1407
	sdiv	%o7,	0x084C,	%l2
	movleu	%icc,	%l5,	%i3
	fmovsn	%icc,	%f28,	%f13
loop_1407:
	fone	%f24
	subccc	%g7,	%g4,	%o6
	tge	%icc,	0x4
	fmovscs	%icc,	%f5,	%f13
	movre	%l3,	0x15A,	%g2
	tcs	%icc,	0x2
	fbl	%fcc0,	loop_1408
	bn,pt	%icc,	loop_1409
	std	%i4,	[%l7 + 0x48]
	sllx	%i6,	0x1A,	%o2
loop_1408:
	alignaddr	%g3,	%g5,	%o3
loop_1409:
	sdiv	%g6,	0x12B4,	%i2
	fmovrslz	%l4,	%f22,	%f4
	te	%icc,	0x5
	fornot2s	%f8,	%f28,	%f4
	edge16ln	%i4,	%i1,	%o5
	ldstub	[%l7 + 0x13],	%o0
	fcmpne32	%f30,	%f8,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x40] %asi,	%l1
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x1D] %asi,	%o1
	set	0x38, %o6
	stxa	%i7,	[%l7 + %o6] 0x2a
	membar	#Sync
	tneg	%xcc,	0x6
	fbul,a	%fcc2,	loop_1410
	st	%f26,	[%l7 + 0x6C]
	array8	%g1,	%l0,	%o4
	fcmps	%fcc2,	%f25,	%f14
loop_1410:
	movcc	%icc,	%i0,	%l2
	fmovrslz	%l5,	%f3,	%f22
	tgu	%xcc,	0x5
	orncc	%o7,	0x0890,	%i3
	sdivcc	%g7,	0x1F7E,	%g4
	mova	%icc,	%o6,	%l3
	fmovdpos	%icc,	%f14,	%f3
	std	%f24,	[%l7 + 0x78]
	movle	%xcc,	%g2,	%i6
	edge16n	%i5,	%g3,	%o2
	xnorcc	%o3,	0x141B,	%g5
	orncc	%g6,	0x0BBF,	%l4
	movrlz	%i2,	0x3B0,	%i4
	tn	%xcc,	0x7
	mulscc	%o5,	0x15FB,	%i1
	alignaddrl	%l6,	%o0,	%l1
	xor	%o1,	%g1,	%l0
	fba	%fcc1,	loop_1411
	bleu,a,pn	%xcc,	loop_1412
	edge32	%o4,	%i0,	%i7
	edge32	%l5,	%o7,	%i3
loop_1411:
	fblg,a	%fcc2,	loop_1413
loop_1412:
	array16	%g7,	%g4,	%o6
	nop
	set	0x58, %l2
	std	%f14,	[%l7 + %l2]
	tne	%icc,	0x7
loop_1413:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x7B] %asi,	%l2
	fbule	%fcc3,	loop_1414
	fpsub16	%f8,	%f6,	%f6
	orcc	%l3,	0x1BF0,	%g2
	brgez,a	%i6,	loop_1415
loop_1414:
	bn	loop_1416
	or	%g3,	0x0EDA,	%i5
	or	%o2,	0x1EE6,	%g5
loop_1415:
	xnorcc	%g6,	0x111A,	%o3
loop_1416:
	fbuge,a	%fcc0,	loop_1417
	tne	%icc,	0x6
	fpackfix	%f12,	%f28
	tsubcc	%l4,	%i2,	%o5
loop_1417:
	movrgz	%i4,	%l6,	%o0
	sethi	0x10CA,	%l1
	fble	%fcc2,	loop_1418
	fornot1	%f0,	%f20,	%f14
	addcc	%o1,	%i1,	%g1
	movcc	%icc,	%l0,	%i0
loop_1418:
	nop
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fbue	%fcc0,	loop_1419
	addc	%i7,	%o4,	%l5
	umul	%i3,	%o7,	%g4
	fble	%fcc0,	loop_1420
loop_1419:
	siam	0x4
	nop
	set	0x58, %g2
	sth	%g7,	[%l7 + %g2]
	fmovscc	%icc,	%f27,	%f2
loop_1420:
	addcc	%l2,	0x0921,	%o6
	edge8n	%g2,	%l3,	%g3
	array16	%i5,	%o2,	%i6
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x66] %asi,	%g5
	tl	%icc,	0x6
	fmovsg	%icc,	%f30,	%f13
	tneg	%xcc,	0x7
	tg	%icc,	0x6
	bgu,a	%icc,	loop_1421
	xor	%o3,	0x07BB,	%l4
	edge16l	%g6,	%i2,	%o5
	tvs	%icc,	0x4
loop_1421:
	fcmple16	%f2,	%f14,	%l6
	bleu	loop_1422
	movl	%icc,	%o0,	%l1
	edge16n	%o1,	%i1,	%i4
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1422:
	smulcc	%l0,	%g1,	%i7
	srlx	%o4,	%l5,	%i0
	edge8ln	%o7,	%i3,	%g4
	st	%f27,	[%l7 + 0x08]
	tcc	%icc,	0x4
	bne,pn	%xcc,	loop_1423
	bvc,a	%icc,	loop_1424
	edge32	%g7,	%o6,	%l2
	be,a,pt	%xcc,	loop_1425
loop_1423:
	fcmpgt32	%f10,	%f26,	%l3
loop_1424:
	tleu	%icc,	0x1
	fpadd16	%f8,	%f14,	%f22
loop_1425:
	brlez,a	%g2,	loop_1426
	sethi	0x11C8,	%i5
	fbne,a	%fcc1,	loop_1427
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1426:
	brnz	%g3,	loop_1428
	tvs	%xcc,	0x1
loop_1427:
	srlx	%o2,	0x05,	%i6
	movn	%xcc,	%g5,	%o3
loop_1428:
	udiv	%l4,	0x095A,	%g6
	fbo	%fcc0,	loop_1429
	edge32ln	%o5,	%i2,	%l6
	movcc	%xcc,	%l1,	%o0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%o1
loop_1429:
	fsrc1	%f16,	%f26
	array8	%l0,	%i4,	%i7
	mulx	%g1,	%l5,	%o4
	movrgez	%o7,	0x218,	%i3
	fnot2s	%f0,	%f8
	udivx	%g4,	0x157A,	%g7
	call	loop_1430
	movgu	%icc,	%o6,	%l2
	fxnor	%f0,	%f28,	%f12
	tvs	%xcc,	0x7
loop_1430:
	sdivx	%i0,	0x0879,	%g2
	tl	%icc,	0x6
	fmovsgu	%xcc,	%f27,	%f27
	srax	%l3,	0x18,	%i5
	edge32l	%o2,	%g3,	%g5
	nop
	set	0x2D, %i5
	stb	%i6,	[%l7 + %i5]
	fpsub16	%f30,	%f26,	%f26
	sllx	%l4,	%o3,	%o5
	tvc	%xcc,	0x0
	udivcc	%g6,	0x0D6B,	%l6
	call	loop_1431
	brz	%l1,	loop_1432
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,pn	%xcc,	loop_1433
loop_1431:
	tge	%icc,	0x7
loop_1432:
	popc	0x105B,	%o0
	fmovdvc	%icc,	%f1,	%f21
loop_1433:
	sdiv	%i2,	0x16A7,	%i1
	fmovdleu	%icc,	%f4,	%f3
	be,pn	%xcc,	loop_1434
	tsubcctv	%l0,	%i4,	%o1
	tg	%xcc,	0x5
	sra	%i7,	%g1,	%l5
loop_1434:
	fmovdvs	%icc,	%f16,	%f19
	fmovdn	%icc,	%f8,	%f12
	bcc,a,pn	%icc,	loop_1435
	fbe	%fcc2,	loop_1436
	fandnot1s	%f22,	%f6,	%f24
	bleu,a	%xcc,	loop_1437
loop_1435:
	tl	%xcc,	0x5
loop_1436:
	movpos	%xcc,	%o7,	%i3
	orncc	%o4,	0x007F,	%g7
loop_1437:
	sra	%o6,	0x17,	%l2
	fmul8x16	%f27,	%f0,	%f28
	sethi	0x089C,	%g4
	movge	%icc,	%i0,	%l3
	edge16	%g2,	%i5,	%g3
	mova	%xcc,	%o2,	%i6
	ldsw	[%l7 + 0x48],	%l4
	movrne	%g5,	%o3,	%o5
	fmovsvc	%xcc,	%f5,	%f17
	ld	[%l7 + 0x0C],	%f10
	fbg,a	%fcc3,	loop_1438
	addcc	%l6,	0x0153,	%l1
	tcs	%xcc,	0x6
	popc	%o0,	%g6
loop_1438:
	fbuge	%fcc2,	loop_1439
	andn	%i1,	%l0,	%i2
	movrgz	%i4,	0x079,	%i7
	swap	[%l7 + 0x68],	%g1
loop_1439:
	movle	%xcc,	%l5,	%o1
	sllx	%o7,	0x0C,	%o4
	xnorcc	%i3,	0x1689,	%o6
	fmul8ulx16	%f2,	%f16,	%f14
	udivx	%l2,	0x0B92,	%g4
	edge32ln	%g7,	%i0,	%l3
	tsubcctv	%g2,	%i5,	%o2
	sethi	0x1D32,	%g3
	set	0x20, %g5
	stxa	%l4,	[%l7 + %g5] 0x2f
	membar	#Sync
	subccc	%g5,	0x1490,	%o3
	tsubcc	%o5,	0x0BC7,	%i6
	alignaddr	%l1,	%o0,	%l6
	ldx	[%l7 + 0x10],	%g6
	fone	%f10
	tneg	%icc,	0x5
	popc	0x16F2,	%i1
	bpos,a,pn	%xcc,	loop_1440
	andncc	%i2,	%l0,	%i7
	swap	[%l7 + 0x68],	%g1
	sdiv	%l5,	0x051D,	%o1
loop_1440:
	fcmpgt32	%f18,	%f24,	%i4
	edge32l	%o7,	%i3,	%o6
	call	loop_1441
	edge16n	%l2,	%o4,	%g4
	addc	%i0,	0x1FAE,	%g7
	fmovdne	%xcc,	%f14,	%f16
loop_1441:
	sllx	%l3,	0x0D,	%g2
	movcc	%icc,	%o2,	%i5
	fbg,a	%fcc2,	loop_1442
	mulx	%g3,	0x0D61,	%l4
	fmovsvc	%icc,	%f28,	%f20
	fnot2	%f4,	%f10
loop_1442:
	edge16n	%g5,	%o5,	%o3
	movn	%xcc,	%l1,	%i6
	subc	%o0,	%l6,	%i1
	srlx	%i2,	%g6,	%i7
	udiv	%g1,	0x0BAF,	%l0
	xnor	%l5,	0x076B,	%i4
	array16	%o1,	%i3,	%o6
	movvs	%icc,	%o7,	%l2
	swap	[%l7 + 0x58],	%g4
	fbe	%fcc1,	loop_1443
	tne	%xcc,	0x5
	fnegs	%f1,	%f9
	tl	%icc,	0x0
loop_1443:
	addc	%i0,	0x02DF,	%o4
	smul	%g7,	%g2,	%o2
	alignaddrl	%i5,	%l3,	%g3
	alignaddrl	%g5,	%l4,	%o3
	tneg	%xcc,	0x0
	movrne	%l1,	%o5,	%i6
	bcc,a,pn	%xcc,	loop_1444
	fxors	%f26,	%f13,	%f29
	movgu	%icc,	%o0,	%l6
	fmovdn	%xcc,	%f23,	%f21
loop_1444:
	edge32l	%i2,	%g6,	%i7
	addccc	%g1,	0x0E40,	%i1
	subccc	%l0,	0x05B4,	%i4
	movrne	%l5,	%i3,	%o6
	movn	%icc,	%o1,	%l2
	fbl	%fcc1,	loop_1445
	tgu	%icc,	0x5
	sdivx	%o7,	0x0404,	%i0
	smul	%g4,	0x051F,	%o4
loop_1445:
	bvs	loop_1446
	edge8ln	%g7,	%g2,	%o2
	tvs	%xcc,	0x7
	ldsh	[%l7 + 0x4C],	%i5
loop_1446:
	tg	%xcc,	0x1
	tpos	%icc,	0x4
	lduh	[%l7 + 0x7A],	%l3
	fcmpne32	%f28,	%f12,	%g5
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	te	%xcc,	0x2
	te	%icc,	0x6
	lduh	[%l7 + 0x08],	%g3
	movcc	%xcc,	%o3,	%l1
	umulcc	%l4,	%o5,	%i6
	srlx	%l6,	%i2,	%g6
	tl	%xcc,	0x6
	edge16	%i7,	%g1,	%i1
	sdiv	%o0,	0x1D9E,	%i4
	taddcc	%l0,	0x0724,	%l5
	wr	%g0,	0x2b,	%asi
	stwa	%i3,	[%l7 + 0x54] %asi
	membar	#Sync
	fcmpeq32	%f14,	%f0,	%o6
	edge32	%o1,	%l2,	%i0
	brnz	%g4,	loop_1447
	fmovdle	%xcc,	%f16,	%f16
	tvs	%icc,	0x6
	std	%o6,	[%l7 + 0x70]
loop_1447:
	fcmpes	%fcc0,	%f9,	%f12
	xorcc	%o4,	0x1C8F,	%g7
	mova	%icc,	%o2,	%i5
	bg,a,pn	%xcc,	loop_1448
	subcc	%l3,	0x14E1,	%g5
	ld	[%l7 + 0x08],	%f23
	bcs	%xcc,	loop_1449
loop_1448:
	fnegs	%f6,	%f0
	srlx	%g2,	0x15,	%g3
	srlx	%l1,	%o3,	%l4
loop_1449:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o5,	%l6
	wr	%g0,	0x23,	%asi
	stha	%i6,	[%l7 + 0x16] %asi
	membar	#Sync
	bcc,a,pn	%icc,	loop_1450
	bcc,a	loop_1451
	andcc	%g6,	%i2,	%g1
	bshuffle	%f22,	%f12,	%f18
loop_1450:
	fmovse	%xcc,	%f5,	%f4
loop_1451:
	stbar
	st	%f20,	[%l7 + 0x40]
	tgu	%icc,	0x3
	movrlez	%i7,	%o0,	%i4
	and	%l0,	%l5,	%i3
	sethi	0x022D,	%o6
	edge16ln	%i1,	%o1,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g4,	0x0F04,	%i0
	srlx	%o7,	%o4,	%o2
	prefetch	[%l7 + 0x18],	 0x3
	tle	%xcc,	0x2
	edge8ln	%g7,	%i5,	%l3
	edge8n	%g2,	%g5,	%g3
	brnz,a	%l1,	loop_1452
	subc	%l4,	0x092A,	%o5
	edge16ln	%l6,	%o3,	%i6
	brlz	%g6,	loop_1453
loop_1452:
	fnors	%f12,	%f24,	%f23
	sth	%g1,	[%l7 + 0x50]
	udivx	%i2,	0x1B5E,	%i7
loop_1453:
	movrlz	%i4,	%o0,	%l5
	edge16	%i3,	%l0,	%i1
	movneg	%icc,	%o1,	%o6
	fbl,a	%fcc0,	loop_1454
	taddcctv	%g4,	%i0,	%l2
	sub	%o4,	0x0C9A,	%o2
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
loop_1454:
	fbge,a	%fcc3,	loop_1455
	ldsh	[%l7 + 0x12],	%o7
	tvc	%xcc,	0x1
	fmovda	%icc,	%f6,	%f25
loop_1455:
	srl	%i5,	0x0E,	%l3
	sdiv	%g2,	0x1FE6,	%g3
	tge	%icc,	0x4
	movvs	%xcc,	%l1,	%g5
	movrne	%l4,	0x28E,	%l6
	wr	%g0,	0xe2,	%asi
	stwa	%o5,	[%l7 + 0x10] %asi
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i6,	%g6,	%o3
	te	%icc,	0x4
	movl	%xcc,	%g1,	%i7
	subc	%i4,	0x1740,	%o0
	ldd	[%l7 + 0x10],	%l4
	fmovrdlz	%i2,	%f18,	%f20
	brlz	%l0,	loop_1456
	udiv	%i1,	0x18C1,	%o1
	fbn	%fcc0,	loop_1457
	fsrc2s	%f22,	%f27
loop_1456:
	andcc	%o6,	0x087A,	%i3
	orncc	%g4,	%l2,	%i0
loop_1457:
	brgz	%o2,	loop_1458
	fcmple32	%f16,	%f6,	%g7
	smul	%o7,	%i5,	%l3
	edge32l	%g2,	%g3,	%o4
loop_1458:
	nop
	set	0x24, %i0
	ldstuba	[%l7 + %i0] 0x80,	%l1
	array16	%g5,	%l4,	%o5
	andncc	%i6,	%g6,	%o3
	bge,a	loop_1459
	mova	%icc,	%g1,	%l6
	array16	%i7,	%o0,	%l5
	alignaddr	%i2,	%l0,	%i4
loop_1459:
	tsubcctv	%i1,	0x179B,	%o1
	sll	%o6,	0x19,	%g4
	addccc	%l2,	%i3,	%i0
	stbar
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x3d0] %asi,	%g7 ripped by fixASI40.pl ripped by fixASI40.pl
	fmovrsne	%o2,	%f12,	%f3
	fpsub32s	%f23,	%f27,	%f0
	call	loop_1460
	movvc	%xcc,	%i5,	%l3
	fmul8x16	%f2,	%f0,	%f14
	udiv	%o7,	0x08B5,	%g3
loop_1460:
	andn	%o4,	0x036F,	%g2
	flush	%l7 + 0x78
	fbne,a	%fcc3,	loop_1461
	flush	%l7 + 0x28
	bneg,pt	%icc,	loop_1462
	mulscc	%l1,	0x19B5,	%g5
loop_1461:
	fmovdcc	%icc,	%f16,	%f28
	orn	%l4,	%i6,	%g6
loop_1462:
	movcc	%xcc,	%o5,	%o3
	tsubcc	%g1,	%i7,	%o0
	add	%l7,	0x34,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%l6,	%i2
	fbo,a	%fcc2,	loop_1463
	alignaddr	%l0,	%i4,	%i1
	fbg,a	%fcc0,	loop_1464
	fmovdge	%icc,	%f29,	%f27
loop_1463:
	andncc	%l5,	%o6,	%o1
	orn	%g4,	0x03E1,	%i3
loop_1464:
	fbge,a	%fcc3,	loop_1465
	fabss	%f21,	%f3
	taddcctv	%l2,	0x1C5B,	%g7
	subc	%i0,	%o2,	%i5
loop_1465:
	nop
	set	0x68, %o4
	swapa	[%l7 + %o4] 0x80,	%o7
	fornot2	%f2,	%f16,	%f4
	pdist	%f18,	%f14,	%f16
	fmovspos	%icc,	%f0,	%f13
	andcc	%l3,	%g3,	%o4
	addcc	%g2,	0x19C5,	%g5
	fsrc1	%f8,	%f18
	tcc	%xcc,	0x2
	smul	%l4,	%i6,	%l1
	array32	%o5,	%g6,	%g1
	set	0x64, %o5
	ldsba	[%l7 + %o5] 0x14,	%i7
	fmovrdgez	%o3,	%f2,	%f20
	smul	%l6,	0x0AB4,	%i2
	edge16l	%o0,	%i4,	%l0
	fmovsgu	%icc,	%f8,	%f12
	fand	%f2,	%f12,	%f20
	movgu	%icc,	%l5,	%o6
	fmovrdlez	%i1,	%f0,	%f2
	flush	%l7 + 0x70
	alignaddr	%o1,	%i3,	%g4
	ldd	[%l7 + 0x40],	%f20
	ble,pn	%xcc,	loop_1466
	fmovrdlz	%l2,	%f24,	%f10
	edge8n	%i0,	%o2,	%g7
	tvc	%xcc,	0x3
loop_1466:
	tn	%xcc,	0x3
	fmovda	%xcc,	%f20,	%f26
	array16	%o7,	%i5,	%l3
	fmovdne	%icc,	%f20,	%f24
	movleu	%xcc,	%o4,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f6,	%f4
	ta	%icc,	0x4
	bleu,pt	%icc,	loop_1467
	fmuld8ulx16	%f30,	%f13,	%f14
	ta	%xcc,	0x2
	fnot2s	%f17,	%f2
loop_1467:
	pdist	%f0,	%f26,	%f26
	movrgez	%g5,	0x3CE,	%l4
	array8	%i6,	%g2,	%o5
	movpos	%icc,	%g6,	%g1
	umul	%i7,	%l1,	%l6
	srlx	%i2,	0x18,	%o0
	movre	%i4,	0x287,	%o3
	fmovdgu	%icc,	%f30,	%f30
	move	%xcc,	%l0,	%l5
	fmul8x16	%f23,	%f6,	%f14
	fmovsn	%xcc,	%f19,	%f6
	fmovrdlez	%i1,	%f4,	%f4
	fbul	%fcc2,	loop_1468
	brgez	%o1,	loop_1469
	edge8ln	%i3,	%o6,	%l2
	fbug	%fcc0,	loop_1470
loop_1468:
	stw	%g4,	[%l7 + 0x5C]
loop_1469:
	tl	%icc,	0x4
	and	%o2,	0x0AA9,	%g7
loop_1470:
	nop
	set	0x108, %i2
	ldxa	[%g0 + %i2] 0x52,	%i0
	tl	%icc,	0x6
	movrne	%i5,	%o7,	%o4
	movge	%icc,	%g3,	%l3
	movpos	%icc,	%g5,	%i6
	fbn,a	%fcc0,	loop_1471
	edge8l	%l4,	%o5,	%g6
	brlez	%g2,	loop_1472
	bleu	loop_1473
loop_1471:
	fbl,a	%fcc3,	loop_1474
	movvc	%xcc,	%i7,	%l1
loop_1472:
	movrgz	%g1,	%i2,	%o0
loop_1473:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1474:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x60],	%i4
	subcc	%o3,	%l6,	%l0
	subcc	%l5,	%i1,	%i3
	sdivcc	%o1,	0x1150,	%o6
	tpos	%xcc,	0x2
	tle	%icc,	0x0
	fmovdcc	%xcc,	%f23,	%f14
	fornot1s	%f28,	%f31,	%f18
	or	%l2,	0x1107,	%o2
	udivcc	%g4,	0x11A7,	%g7
	fmovdge	%icc,	%f9,	%f9
	swap	[%l7 + 0x64],	%i5
	ld	[%l7 + 0x78],	%f21
	movvc	%icc,	%i0,	%o7
	set	0x68, %l4
	lda	[%l7 + %l4] 0x04,	%f23
	set	0x8, %l0
	ldxa	[%g0 + %l0] 0x4f,	%o4
	fmovscs	%xcc,	%f0,	%f30
	edge16	%g3,	%g5,	%i6
	st	%f15,	[%l7 + 0x1C]
	fbg	%fcc1,	loop_1475
	xorcc	%l4,	0x1185,	%l3
	fcmpeq16	%f18,	%f24,	%g6
	fandnot1s	%f12,	%f8,	%f5
loop_1475:
	membar	0x7A
	mova	%icc,	%o5,	%g2
	alignaddrl	%i7,	%g1,	%l1
	fxnors	%f17,	%f0,	%f12
	sll	%i2,	0x1C,	%o0
	fmovdpos	%icc,	%f3,	%f26
	srax	%i4,	0x17,	%o3
	fbe,a	%fcc1,	loop_1476
	array8	%l6,	%l0,	%l5
	sll	%i3,	%i1,	%o1
	movcc	%xcc,	%o6,	%o2
loop_1476:
	tvc	%xcc,	0x3
	ble,a	loop_1477
	subc	%g4,	0x05A0,	%g7
	fblg,a	%fcc2,	loop_1478
	fpsub16	%f12,	%f8,	%f2
loop_1477:
	udiv	%i5,	0x02FE,	%l2
	fbuge,a	%fcc3,	loop_1479
loop_1478:
	smulcc	%o7,	%o4,	%g3
	andncc	%i0,	%i6,	%l4
	sethi	0x1FBD,	%g5
loop_1479:
	xnorcc	%l3,	0x1B30,	%g6
	edge8	%o5,	%g2,	%g1
	std	%l0,	[%l7 + 0x18]
	fcmps	%fcc3,	%f4,	%f24
	te	%icc,	0x1
	subcc	%i7,	0x167C,	%i2
	array8	%o0,	%i4,	%o3
	tneg	%xcc,	0x3
	fmovrsgez	%l6,	%f4,	%f27
	orncc	%l0,	0x1D5B,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i1,	%l5,	%o6
	fmovsn	%icc,	%f28,	%f23
	sdiv	%o1,	0x1049,	%g4
	stw	%o2,	[%l7 + 0x54]
	movrgz	%i5,	%g7,	%o7
	fone	%f30
	bg,a,pt	%xcc,	loop_1480
	tcs	%icc,	0x4
	orcc	%l2,	%o4,	%i0
	fcmps	%fcc1,	%f26,	%f23
loop_1480:
	fnot1	%f6,	%f26
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x55] %asi,	%g3
	bneg	loop_1481
	fnor	%f26,	%f16,	%f26
	fnot2	%f10,	%f8
	udiv	%l4,	0x0691,	%g5
loop_1481:
	edge16l	%l3,	%i6,	%g6
	flush	%l7 + 0x6C
	nop
	setx loop_1482, %l0, %l1
	jmpl %l1, %o5
	call	loop_1483
	fnegd	%f6,	%f14
	nop
	setx loop_1484, %l0, %l1
	jmpl %l1, %g1
loop_1482:
	nop
	setx loop_1485, %l0, %l1
	jmpl %l1, %l1
loop_1483:
	tneg	%xcc,	0x4
	fone	%f26
loop_1484:
	umulcc	%i7,	0x1E8F,	%i2
loop_1485:
	stbar
	alignaddr	%g2,	%i4,	%o0
	lduh	[%l7 + 0x44],	%l6
	orn	%l0,	0x185F,	%i3
	be,pn	%xcc,	loop_1486
	fmovdcc	%xcc,	%f6,	%f11
	swap	[%l7 + 0x1C],	%i1
	movcs	%icc,	%l5,	%o6
loop_1486:
	alignaddr	%o1,	%g4,	%o3
	tsubcctv	%o2,	%i5,	%o7
	movleu	%xcc,	%g7,	%l2
	udivx	%o4,	0x1241,	%i0
	sir	0x0771
	fmovsle	%icc,	%f21,	%f21
	tle	%icc,	0x4
	movle	%xcc,	%l4,	%g3
	addc	%g5,	0x0454,	%i6
	addccc	%l3,	%o5,	%g6
	sir	0x0E7D
	movrgez	%g1,	0x22F,	%i7
	fbule,a	%fcc1,	loop_1487
	fmovscs	%icc,	%f25,	%f6
	edge16n	%i2,	%g2,	%i4
	set	0x0, %g1
	ldxa	[%g0 + %g1] 0x20,	%l1
loop_1487:
	xor	%o0,	%l6,	%l0
	array32	%i1,	%i3,	%o6
	call	loop_1488
	tneg	%icc,	0x2
	brlez	%l5,	loop_1489
	bn	loop_1490
loop_1488:
	fmovsvs	%xcc,	%f31,	%f21
	addcc	%o1,	%o3,	%o2
loop_1489:
	nop
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g4
loop_1490:
	fpadd32	%f30,	%f18,	%f30
	umulcc	%o7,	0x0827,	%g7
	sll	%l2,	%i5,	%o4
	fmovse	%icc,	%f29,	%f22
	ldd	[%l7 + 0x40],	%i0
	fmovrdne	%g3,	%f26,	%f26
	ba,a,pn	%xcc,	loop_1491
	fbule	%fcc3,	loop_1492
	add	%g5,	0x02D2,	%l4
	edge32ln	%i6,	%l3,	%g6
loop_1491:
	smulcc	%g1,	0x049B,	%o5
loop_1492:
	addc	%i2,	0x17AF,	%i7
	tcs	%xcc,	0x1
	fmovsneg	%xcc,	%f7,	%f16
	tl	%xcc,	0x1
	tvs	%xcc,	0x5
	fpack16	%f30,	%f5
	fmovrdlz	%g2,	%f22,	%f30
	xorcc	%i4,	%l1,	%o0
	orcc	%l6,	0x1D0D,	%l0
	or	%i3,	%i1,	%o6
	srax	%o1,	0x1E,	%l5
	movgu	%xcc,	%o3,	%o2
	fbge,a	%fcc2,	loop_1493
	stbar
	addcc	%g4,	%o7,	%l2
	brgez,a	%g7,	loop_1494
loop_1493:
	smul	%o4,	0x0324,	%i0
	fbg	%fcc1,	loop_1495
	fzero	%f8
loop_1494:
	alignaddrl	%i5,	%g3,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1495:
	edge8l	%i6,	%g5,	%g6
	sdivcc	%g1,	0x0280,	%l3
	st	%f8,	[%l7 + 0x40]
	movcs	%xcc,	%o5,	%i7
	tsubcc	%g2,	0x112F,	%i2
	fxor	%f22,	%f26,	%f6
	movgu	%icc,	%l1,	%i4
	fcmpeq16	%f4,	%f12,	%o0
	fbg,a	%fcc3,	loop_1496
	movcs	%icc,	%l0,	%i3
	wr	%g0,	0x81,	%asi
	stba	%i1,	[%l7 + 0x56] %asi
loop_1496:
	srl	%o6,	0x15,	%l6
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x73] %asi,	%o1
	andcc	%l5,	0x01CF,	%o2
	ldd	[%l7 + 0x48],	%f26
	movrlez	%o3,	%g4,	%l2
	bshuffle	%f22,	%f0,	%f30
	sth	%o7,	[%l7 + 0x0C]
	tpos	%icc,	0x0
	bneg,a,pn	%icc,	loop_1497
	move	%icc,	%o4,	%i0
	move	%icc,	%i5,	%g7
	edge8	%l4,	%i6,	%g5
loop_1497:
	fzeros	%f24
	addccc	%g6,	0x0464,	%g3
	subccc	%l3,	%o5,	%i7
	edge8ln	%g1,	%i2,	%g2
	edge16l	%i4,	%l1,	%l0
	fmovrslz	%o0,	%f7,	%f6
	array16	%i3,	%o6,	%l6
	movg	%icc,	%o1,	%l5
	ldsw	[%l7 + 0x54],	%i1
	fbu	%fcc0,	loop_1498
	movl	%icc,	%o3,	%o2
	fnegs	%f28,	%f6
	sllx	%g4,	0x05,	%o7
loop_1498:
	fmovrdgez	%l2,	%f14,	%f28
	sub	%i0,	%i5,	%g7
	bg,a	%icc,	loop_1499
	tcc	%xcc,	0x7
	umulcc	%l4,	0x1B79,	%i6
	movneg	%xcc,	%o4,	%g6
loop_1499:
	ldd	[%l7 + 0x40],	%g2
	fmovdl	%xcc,	%f21,	%f27
	fcmple16	%f4,	%f0,	%g5
	fcmpgt16	%f8,	%f28,	%o5
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x6A] %asi,	%i7
	sir	0x077C
	fpsub16s	%f27,	%f27,	%f15
	movn	%xcc,	%g1,	%l3
	edge8	%g2,	%i2,	%i4
	movleu	%icc,	%l0,	%o0
	tne	%xcc,	0x0
	movvc	%xcc,	%l1,	%i3
	fxnors	%f23,	%f1,	%f1
	tpos	%xcc,	0x2
	fmovrsgz	%l6,	%f1,	%f11
	xnorcc	%o1,	%o6,	%i1
	fmovrsgez	%o3,	%f29,	%f14
	orncc	%l5,	%g4,	%o2
	fnands	%f10,	%f28,	%f9
	movre	%o7,	0x220,	%l2
	fpsub32s	%f30,	%f27,	%f23
	fnegs	%f28,	%f27
	edge8ln	%i0,	%g7,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_1500
	swap	[%l7 + 0x30],	%i6
	bg	loop_1501
	orncc	%i5,	0x0748,	%o4
loop_1500:
	xnorcc	%g3,	0x04B4,	%g6
	sethi	0x0AB1,	%g5
loop_1501:
	array16	%o5,	%i7,	%g1
	nop
	setx loop_1502, %l0, %l1
	jmpl %l1, %l3
	fmovdg	%xcc,	%f22,	%f26
	fandnot2	%f2,	%f0,	%f20
	tvs	%xcc,	0x1
loop_1502:
	fornot2s	%f13,	%f15,	%f28
	nop
	set	0x1D, %i7
	ldsb	[%l7 + %i7],	%i2
	wr	%g0,	0x18,	%asi
	stxa	%i4,	[%l7 + 0x20] %asi
	addc	%l0,	0x1F68,	%o0
	swap	[%l7 + 0x0C],	%g2
	ble,a	loop_1503
	brz,a	%l1,	loop_1504
	tcs	%xcc,	0x3
	udivx	%i3,	0x1CA8,	%l6
loop_1503:
	addccc	%o6,	%i1,	%o1
loop_1504:
	nop
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%o3
	movrgz	%g4,	%o2,	%l5
	subcc	%l2,	%o7,	%g7
	or	%i0,	%l4,	%i5
	bn,a,pn	%xcc,	loop_1505
	udivx	%i6,	0x15A1,	%g3
	fnegs	%f27,	%f13
	fnands	%f30,	%f10,	%f31
loop_1505:
	edge16ln	%o4,	%g5,	%g6
	movleu	%icc,	%o5,	%g1
	fcmpne16	%f6,	%f12,	%l3
	tl	%xcc,	0x7
	movge	%xcc,	%i7,	%i2
	subcc	%l0,	0x031F,	%o0
	smulcc	%g2,	%i4,	%l1
	edge32	%l6,	%o6,	%i1
	fpsub16	%f28,	%f22,	%f18
	sdiv	%o1,	0x04F5,	%i3
	movn	%xcc,	%o3,	%o2
	edge16ln	%l5,	%l2,	%o7
	edge32l	%g7,	%g4,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f2,	%f24,	%f12
	set	0x08, %g6
	prefetcha	[%l7 + %g6] 0x15,	 0x2
	sethi	0x1F0E,	%i6
	fpadd16	%f8,	%f28,	%f30
	addc	%g3,	0x0E67,	%i5
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%o4
	fxnors	%f14,	%f18,	%f0
	movre	%g6,	0x23F,	%g5
	sllx	%g1,	%l3,	%o5
	tge	%icc,	0x2
	fmovse	%xcc,	%f24,	%f12
	fbo,a	%fcc0,	loop_1506
	udivcc	%i7,	0x0620,	%i2
	ldstub	[%l7 + 0x33],	%l0
	bge	%xcc,	loop_1507
loop_1506:
	stx	%g2,	[%l7 + 0x58]
	smulcc	%i4,	0x06B8,	%l1
	tne	%icc,	0x7
loop_1507:
	brz,a	%l6,	loop_1508
	bgu	loop_1509
	movle	%xcc,	%o6,	%i1
	mulscc	%o1,	%i3,	%o0
loop_1508:
	orncc	%o2,	0x1F57,	%l5
loop_1509:
	edge16	%o3,	%l2,	%g7
	or	%g4,	%o7,	%l4
	edge16l	%i6,	%g3,	%i0
	movge	%xcc,	%o4,	%i5
	fmovsneg	%icc,	%f18,	%f6
	movg	%icc,	%g6,	%g1
	sub	%g5,	0x0C81,	%l3
	sethi	0x177B,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x3
	movrne	%i2,	0x260,	%i7
	fmovrdgez	%g2,	%f4,	%f12
	fsrc1	%f22,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x6
	movrne	%l0,	0x13D,	%l1
	edge32	%i4,	%l6,	%o6
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x2C] %asi,	%o1
	fbul	%fcc0,	loop_1510
	andn	%i3,	%i1,	%o2
	edge16	%o0,	%o3,	%l5
	udivcc	%l2,	0x0E90,	%g4
loop_1510:
	ldsw	[%l7 + 0x38],	%o7
	set	0x4A, %g4
	stha	%l4,	[%l7 + %g4] 0x2b
	membar	#Sync
	fmul8x16	%f16,	%f24,	%f22
	xnor	%g7,	0x1CE8,	%g3
	brlez,a	%i6,	loop_1511
	edge16	%i0,	%i5,	%o4
	movcc	%icc,	%g1,	%g5
	movneg	%icc,	%g6,	%o5
loop_1511:
	tpos	%icc,	0x6
	edge32ln	%l3,	%i2,	%g2
	movrne	%i7,	0x3FD,	%l0
	sdiv	%l1,	0x1582,	%l6
	tsubcc	%o6,	0x0054,	%i4
	fxnors	%f24,	%f26,	%f4
	edge32ln	%i3,	%i1,	%o1
	fxors	%f2,	%f31,	%f9
	mulx	%o2,	%o0,	%l5
	fbule	%fcc1,	loop_1512
	addccc	%l2,	%o3,	%o7
	alignaddr	%g4,	%g7,	%l4
	brz,a	%g3,	loop_1513
loop_1512:
	array8	%i6,	%i5,	%o4
	set	0x78, %o0
	ldsha	[%l7 + %o0] 0x81,	%g1
loop_1513:
	movre	%i0,	0x3E3,	%g6
	fmovsneg	%icc,	%f0,	%f25
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%g5
	brlz,a	%l3,	loop_1514
	taddcctv	%o5,	0x1123,	%g2
	fmovdpos	%xcc,	%f25,	%f20
	fmovrdlz	%i2,	%f22,	%f20
loop_1514:
	mova	%xcc,	%i7,	%l0
	umul	%l6,	0x088A,	%o6
	array16	%l1,	%i3,	%i1
	and	%i4,	%o2,	%o1
	edge32ln	%l5,	%l2,	%o3
	orcc	%o7,	%g4,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs,a,pt	%icc,	loop_1515
	sra	%l4,	%g7,	%i6
	set	0x48, %l6
	ldsha	[%l7 + %l6] 0x81,	%g3
loop_1515:
	bg,a,pt	%xcc,	loop_1516
	bpos,a	loop_1517
	edge16n	%i5,	%o4,	%i0
	edge8n	%g6,	%g5,	%l3
loop_1516:
	sub	%g1,	0x0133,	%o5
loop_1517:
	fbge	%fcc2,	loop_1518
	fbe,a	%fcc1,	loop_1519
	array16	%g2,	%i7,	%l0
	fbl,a	%fcc0,	loop_1520
loop_1518:
	ldsb	[%l7 + 0x50],	%l6
loop_1519:
	mulscc	%i2,	%o6,	%l1
	fone	%f8
loop_1520:
	brnz	%i3,	loop_1521
	subccc	%i4,	%i1,	%o1
	brnz	%o2,	loop_1522
	andcc	%l2,	%o3,	%o7
loop_1521:
	srax	%l5,	0x19,	%o0
	fcmpgt32	%f6,	%f22,	%l4
loop_1522:
	fcmpne16	%f28,	%f8,	%g4
	subc	%g7,	%i6,	%g3
	orncc	%i5,	%i0,	%g6
	fmovrdgez	%o4,	%f28,	%f6
	srlx	%g5,	0x18,	%g1
	tge	%xcc,	0x2
	srlx	%o5,	%l3,	%i7
	bneg	%xcc,	loop_1523
	edge8n	%l0,	%l6,	%g2
	alignaddrl	%o6,	%l1,	%i2
	tpos	%icc,	0x3
loop_1523:
	xorcc	%i4,	%i3,	%i1
	set	0x52, %o2
	lduha	[%l7 + %o2] 0x15,	%o2
	addcc	%o1,	0x0818,	%l2
	brz,a	%o3,	loop_1524
	tleu	%xcc,	0x1
	umul	%l5,	0x0CE1,	%o7
	edge16n	%l4,	%o0,	%g4
loop_1524:
	ble,a	%xcc,	loop_1525
	and	%i6,	0x078B,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i5,	0x0573,	%g3
loop_1525:
	movvs	%xcc,	%i0,	%g6
	srlx	%o4,	%g5,	%g1
	tgu	%icc,	0x3
	fbule	%fcc2,	loop_1526
	fmovrslez	%l3,	%f19,	%f11
	taddcctv	%i7,	0x08F3,	%l0
	mulscc	%o5,	%g2,	%l6
loop_1526:
	smulcc	%o6,	0x0B0F,	%l1
	subc	%i4,	0x1FB9,	%i2
	fnors	%f6,	%f10,	%f31
	tl	%xcc,	0x5
	edge8	%i1,	%i3,	%o1
	tsubcctv	%l2,	0x15FB,	%o3
	move	%xcc,	%l5,	%o2
	fmovrslez	%l4,	%f3,	%f17
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x04
	tvc	%xcc,	0x4
	sth	%o0,	[%l7 + 0x72]
	movcs	%icc,	%g4,	%i6
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%o7
	std	%f18,	[%l7 + 0x10]
	bl,a,pn	%xcc,	loop_1527
	movg	%icc,	%i5,	%g3
	fmovdleu	%icc,	%f21,	%f26
	fbn,a	%fcc1,	loop_1528
loop_1527:
	tleu	%xcc,	0x3
	fmovsvs	%xcc,	%f28,	%f31
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xf1
	membar	#Sync
loop_1528:
	ldub	[%l7 + 0x34],	%i0
	tge	%xcc,	0x3
	sir	0x04C9
	fmul8ulx16	%f26,	%f2,	%f16
	array16	%g6,	%g7,	%g5
	srlx	%g1,	0x0C,	%o4
	srlx	%i7,	0x04,	%l0
	edge16	%o5,	%g2,	%l6
	movn	%xcc,	%l3,	%l1
	sdivx	%o6,	0x1B2D,	%i4
	set	0x54, %g7
	lduba	[%l7 + %g7] 0x18,	%i2
	fbule	%fcc2,	loop_1529
	bcs,a	loop_1530
	bvc,a	%icc,	loop_1531
	srlx	%i1,	0x10,	%i3
loop_1529:
	mulscc	%l2,	%o3,	%o1
loop_1530:
	fmovrse	%l5,	%f29,	%f29
loop_1531:
	orncc	%o2,	%o0,	%l4
	swap	[%l7 + 0x50],	%i6
	edge16l	%g4,	%i5,	%g3
	tcs	%xcc,	0x0
	pdist	%f26,	%f30,	%f22
	subccc	%o7,	%i0,	%g7
	fmovdpos	%icc,	%f0,	%f23
	udiv	%g6,	0x0668,	%g5
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o4,	%i7
	sdivcc	%g1,	0x03B5,	%l0
	be,a	loop_1532
	andcc	%o5,	0x1430,	%g2
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x66] %asi,	%l3
loop_1532:
	fmovs	%f14,	%f29
	taddcc	%l1,	%o6,	%i4
	fmuld8sux16	%f24,	%f12,	%f8
	fbul,a	%fcc1,	loop_1533
	sll	%l6,	%i2,	%i1
	fmovdleu	%xcc,	%f26,	%f28
	tvc	%icc,	0x4
loop_1533:
	fsrc2	%f30,	%f26
	subccc	%l2,	0x0184,	%i3
	te	%icc,	0x4
	brz,a	%o1,	loop_1534
	bge,pt	%icc,	loop_1535
	fbug	%fcc2,	loop_1536
	call	loop_1537
loop_1534:
	mulx	%l5,	0x17FA,	%o3
loop_1535:
	fsrc1s	%f29,	%f9
loop_1536:
	fpmerge	%f5,	%f30,	%f0
loop_1537:
	bne,pt	%xcc,	loop_1538
	brgez,a	%o2,	loop_1539
	bcs,a	%icc,	loop_1540
	edge16l	%l4,	%o0,	%i6
loop_1538:
	srl	%g4,	0x1E,	%g3
loop_1539:
	tleu	%icc,	0x3
loop_1540:
	fmovrslz	%i5,	%f21,	%f27
	fcmpgt16	%f22,	%f4,	%i0
	taddcctv	%o7,	%g6,	%g7
	movrne	%g5,	0x2B3,	%o4
	andncc	%g1,	%l0,	%i7
	umul	%g2,	%l3,	%l1
	stx	%o5,	[%l7 + 0x60]
	be	%xcc,	loop_1541
	sll	%i4,	0x01,	%o6
	edge8	%l6,	%i1,	%l2
	move	%xcc,	%i2,	%o1
loop_1541:
	udivcc	%i3,	0x1491,	%o3
	sdivx	%l5,	0x03F0,	%l4
	fnegs	%f31,	%f4
	tcs	%icc,	0x7
	fbg,a	%fcc1,	loop_1542
	stbar
	orcc	%o2,	0x1181,	%o0
	movcc	%icc,	%g4,	%g3
loop_1542:
	fmul8x16au	%f25,	%f31,	%f10
	fmovrse	%i6,	%f5,	%f26
	edge16ln	%i5,	%i0,	%o7
	bge	%xcc,	loop_1543
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%f30
	brgez	%g6,	loop_1544
	stx	%g5,	[%l7 + 0x40]
loop_1543:
	mulscc	%g7,	0x1772,	%g1
	sdiv	%l0,	0x0EFD,	%i7
loop_1544:
	sdiv	%g2,	0x13BD,	%l3
	sll	%o4,	%o5,	%i4
	fmovdne	%xcc,	%f8,	%f1
	fsrc2s	%f19,	%f3
	mulscc	%o6,	0x15D1,	%l6
	fmul8x16al	%f31,	%f27,	%f6
	movge	%icc,	%i1,	%l2
	fcmpgt16	%f28,	%f30,	%i2
	fmovrse	%o1,	%f21,	%f7
	movpos	%icc,	%l1,	%o3
	addccc	%i3,	%l4,	%l5
	nop
	setx loop_1545, %l0, %l1
	jmpl %l1, %o0
	sdiv	%o2,	0x0CE6,	%g3
	fnands	%f19,	%f2,	%f18
	xnorcc	%i6,	%g4,	%i0
loop_1545:
	fpadd16s	%f10,	%f21,	%f29
	bvc,pt	%xcc,	loop_1546
	fnot1s	%f6,	%f22
	fble,a	%fcc3,	loop_1547
	subccc	%o7,	0x1498,	%g6
loop_1546:
	st	%f11,	[%l7 + 0x34]
	movge	%xcc,	%g5,	%i5
loop_1547:
	fsrc2s	%f7,	%f28
	set	0x28, %i6
	prefetcha	[%l7 + %i6] 0x89,	 0x0
	fandnot1s	%f8,	%f31,	%f27
	edge16ln	%g7,	%i7,	%l0
	fbule,a	%fcc0,	loop_1548
	and	%l3,	0x1435,	%g2
	srlx	%o4,	%i4,	%o5
	tvs	%icc,	0x3
loop_1548:
	srl	%o6,	0x10,	%i1
	ble,a	%xcc,	loop_1549
	fmovda	%xcc,	%f24,	%f30
	fcmple16	%f30,	%f26,	%l6
	movrgez	%i2,	%o1,	%l1
loop_1549:
	tcc	%xcc,	0x3
	fmovrsne	%o3,	%f4,	%f25
	ldd	[%l7 + 0x20],	%i2
	move	%xcc,	%l4,	%l2
	edge32n	%l5,	%o0,	%g3
	andncc	%i6,	%o2,	%g4
	fmovda	%xcc,	%f4,	%f19
	movge	%xcc,	%i0,	%o7
	or	%g6,	0x0AA6,	%g5
	fcmped	%fcc1,	%f30,	%f6
	fcmpne32	%f0,	%f0,	%g1
	umul	%g7,	%i5,	%l0
	tleu	%icc,	0x0
	fnor	%f18,	%f10,	%f28
	tg	%icc,	0x7
	fmovd	%f14,	%f16
	membar	0x51
	srax	%i7,	0x1F,	%g2
	fmovsl	%icc,	%f2,	%f1
	fsrc2	%f8,	%f6
	tg	%icc,	0x2
	edge16ln	%o4,	%i4,	%o5
	fmovdn	%icc,	%f26,	%f4
	andn	%o6,	%l3,	%i1
	bg,a	%icc,	loop_1550
	movrlez	%i2,	0x339,	%l6
	movrgz	%o1,	%l1,	%i3
	set	0x32, %i3
	stha	%o3,	[%l7 + %i3] 0x88
loop_1550:
	alignaddrl	%l2,	%l4,	%l5
	subcc	%g3,	0x0F60,	%i6
	be,pn	%xcc,	loop_1551
	movrgez	%o2,	0x3F5,	%g4
	fpadd32s	%f5,	%f7,	%f29
	fandnot1	%f30,	%f8,	%f6
loop_1551:
	sllx	%i0,	0x05,	%o0
	tvs	%xcc,	0x1
	membar	0x16
	movrlz	%g6,	%g5,	%o7
	fandnot2	%f12,	%f14,	%f30
	movre	%g1,	0x39E,	%g7
	tn	%xcc,	0x1
	sub	%l0,	%i7,	%g2
	edge8n	%o4,	%i5,	%i4
	fmovrsgez	%o6,	%f3,	%f9
	fmovrdlz	%o5,	%f28,	%f30
	edge8	%i1,	%i2,	%l3
	brnz	%l6,	loop_1552
	addcc	%l1,	0x1E14,	%i3
	tcs	%xcc,	0x4
	movrne	%o3,	%l2,	%l4
loop_1552:
	ldsb	[%l7 + 0x5A],	%l5
	movpos	%xcc,	%g3,	%o1
	fandnot2	%f6,	%f28,	%f4
	movrgz	%i6,	0x366,	%g4
	tvs	%icc,	0x5
	fnegd	%f12,	%f0
	xnorcc	%o2,	0x09B4,	%i0
	edge32n	%g6,	%g5,	%o7
	fba	%fcc0,	loop_1553
	prefetch	[%l7 + 0x60],	 0x1
	tsubcc	%o0,	%g1,	%g7
	mulx	%i7,	%g2,	%l0
loop_1553:
	movpos	%icc,	%i5,	%i4
	movrgez	%o6,	0x293,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i1,	%i2,	%l3
	fbug	%fcc2,	loop_1554
	ldd	[%l7 + 0x60],	%f6
	stx	%o4,	[%l7 + 0x38]
	fmul8sux16	%f18,	%f28,	%f14
loop_1554:
	srax	%l6,	%i3,	%l1
	fmovsle	%xcc,	%f20,	%f31
	fmul8ulx16	%f4,	%f12,	%f12
	tpos	%icc,	0x2
	tcs	%xcc,	0x2
	array32	%o3,	%l4,	%l2
	bneg,a,pt	%icc,	loop_1555
	srax	%g3,	0x03,	%o1
	tle	%xcc,	0x4
	tge	%icc,	0x6
loop_1555:
	nop
	set	0x68, %l1
	ldd	[%l7 + %l1],	%i6
	tsubcc	%g4,	%l5,	%o2
	wr	%g0,	0x10,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	edge8l	%i0,	%g6,	%o7
	movrlz	%o0,	%g1,	%g7
	fbule	%fcc2,	loop_1556
	movge	%xcc,	%g5,	%i7
	fpsub16s	%f11,	%f4,	%f27
	tge	%xcc,	0x6
loop_1556:
	fcmps	%fcc3,	%f17,	%f16
	mulscc	%l0,	0x0284,	%g2
	tgu	%xcc,	0x5
	movrgz	%i4,	%o6,	%i5
	ldsw	[%l7 + 0x30],	%i1
	fmovscc	%icc,	%f4,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o5,	%l3,	%i2
	ldstub	[%l7 + 0x3F],	%o4
	set	0x60, %g3
	stwa	%i3,	[%l7 + %g3] 0x88
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l6,	0x1E,	%o3
	movvc	%icc,	%l1,	%l4
	movneg	%icc,	%l2,	%o1
	stbar
	movleu	%xcc,	%g3,	%i6
	orncc	%l5,	%o2,	%g4
	taddcctv	%g6,	0x1EDD,	%o7
	move	%icc,	%i0,	%g1
	smul	%g7,	%g5,	%i7
	subcc	%o0,	0x17E1,	%g2
	wr	%g0,	0x2a,	%asi
	stba	%i4,	[%l7 + 0x31] %asi
	membar	#Sync
	array32	%o6,	%i5,	%l0
	fands	%f9,	%f11,	%f22
	fbne,a	%fcc2,	loop_1557
	tcc	%xcc,	0x0
	udivx	%o5,	0x0944,	%l3
	popc	0x048C,	%i2
loop_1557:
	fmovrdlz	%o4,	%f18,	%f4
	fnegd	%f6,	%f14
	fmovdl	%icc,	%f10,	%f22
	movrgez	%i1,	%l6,	%i3
	fmovsle	%icc,	%f2,	%f28
	add	%l1,	%o3,	%l4
	array16	%l2,	%o1,	%i6
	bneg,pn	%xcc,	loop_1558
	popc	%l5,	%g3
	orncc	%g4,	%g6,	%o7
	array32	%i0,	%g1,	%o2
loop_1558:
	edge8l	%g5,	%g7,	%i7
	set	0x68, %i1
	ldswa	[%l7 + %i1] 0x88,	%o0
	taddcctv	%g2,	%o6,	%i4
	addccc	%l0,	%i5,	%o5
	bpos,a,pt	%xcc,	loop_1559
	fornot2	%f22,	%f26,	%f12
	fbne,a	%fcc2,	loop_1560
	addc	%l3,	%i2,	%o4
loop_1559:
	prefetch	[%l7 + 0x70],	 0x3
	fble	%fcc2,	loop_1561
loop_1560:
	nop
	set	0x4C, %l3
	ldsw	[%l7 + %l3],	%l6
	taddcc	%i3,	%i1,	%l1
	fmovdg	%icc,	%f3,	%f7
loop_1561:
	fbl	%fcc1,	loop_1562
	movleu	%xcc,	%o3,	%l4
	fbge,a	%fcc1,	loop_1563
	ldd	[%l7 + 0x38],	%o0
loop_1562:
	ta	%xcc,	0x5
	fmovrslz	%l2,	%f5,	%f13
loop_1563:
	udivx	%i6,	0x17F0,	%l5
	bshuffle	%f30,	%f22,	%f24
	fmovdpos	%xcc,	%f19,	%f18
	wr	%g0,	0x27,	%asi
	stba	%g3,	[%l7 + 0x4B] %asi
	membar	#Sync
	nop
	set	0x20, %o7
	stx	%g6,	[%l7 + %o7]
	ble,a	loop_1564
	movn	%xcc,	%o7,	%i0
	fble,a	%fcc3,	loop_1565
	srlx	%g4,	%g1,	%g5
loop_1564:
	smul	%g7,	%i7,	%o0
	orn	%g2,	%o2,	%o6
loop_1565:
	alignaddr	%l0,	%i4,	%o5
	movge	%xcc,	%i5,	%l3
	edge8ln	%i2,	%l6,	%o4
	sdiv	%i3,	0x13F4,	%i1
	fpmerge	%f31,	%f2,	%f22
	fbo	%fcc3,	loop_1566
	edge16	%o3,	%l4,	%o1
	sethi	0x1D4C,	%l1
	edge32ln	%i6,	%l5,	%g3
loop_1566:
	flush	%l7 + 0x50
	sll	%l2,	0x1F,	%g6
	srlx	%o7,	0x1D,	%g4
	movgu	%icc,	%g1,	%i0
	edge16l	%g5,	%g7,	%i7
	fpadd32s	%f24,	%f21,	%f18
	add	%o0,	0x05EA,	%g2
	fmovdcs	%icc,	%f27,	%f1
	tn	%xcc,	0x5
	fbn,a	%fcc3,	loop_1567
	lduw	[%l7 + 0x70],	%o6
	movg	%icc,	%l0,	%i4
	addcc	%o5,	0x008E,	%i5
loop_1567:
	edge32n	%l3,	%i2,	%l6
	tl	%xcc,	0x3
	fmovrdgez	%o4,	%f28,	%f22
	movcc	%icc,	%o2,	%i3
	umulcc	%i1,	0x0531,	%l4
	udivx	%o3,	0x026C,	%l1
	brnz,a	%i6,	loop_1568
	fba,a	%fcc1,	loop_1569
	fbue	%fcc3,	loop_1570
	movrlz	%l5,	%o1,	%g3
loop_1568:
	fmovrdlz	%l2,	%f10,	%f8
loop_1569:
	movvc	%xcc,	%o7,	%g4
loop_1570:
	sub	%g1,	0x01A9,	%i0
	movvc	%xcc,	%g5,	%g7
	swap	[%l7 + 0x7C],	%i7
	smulcc	%o0,	%g6,	%o6
	edge16n	%g2,	%i4,	%l0
	fmul8x16	%f19,	%f20,	%f0
	movvs	%xcc,	%i5,	%l3
	fnot1	%f14,	%f2
	nop
	setx loop_1571, %l0, %l1
	jmpl %l1, %o5
	tne	%icc,	0x5
	movrlz	%i2,	%l6,	%o2
	edge8n	%i3,	%i1,	%l4
loop_1571:
	xnor	%o3,	%l1,	%i6
	smul	%l5,	%o4,	%g3
	fors	%f21,	%f18,	%f1
	tpos	%xcc,	0x4
	bg,a,pn	%icc,	loop_1572
	umulcc	%o1,	%o7,	%g4
	fpadd32s	%f17,	%f14,	%f3
	fmovdcc	%icc,	%f27,	%f25
loop_1572:
	stw	%l2,	[%l7 + 0x34]
	fmovsn	%icc,	%f6,	%f22
	move	%xcc,	%i0,	%g1
	srl	%g5,	%i7,	%g7
	fmovdcs	%icc,	%f23,	%f23
	brnz	%g6,	loop_1573
	addcc	%o0,	%g2,	%o6
	st	%f7,	[%l7 + 0x28]
	edge16n	%i4,	%l0,	%l3
loop_1573:
	ta	%icc,	0x4
	fcmpes	%fcc1,	%f16,	%f9
	fmovrsgz	%i5,	%f18,	%f22
	swap	[%l7 + 0x78],	%o5
	orcc	%l6,	%i2,	%o2
	fbge,a	%fcc1,	loop_1574
	fmovrse	%i3,	%f29,	%f23
	add	%l4,	0x0673,	%i1
	ldx	[%l7 + 0x48],	%o3
loop_1574:
	tvs	%xcc,	0x7
	bneg,a,pn	%xcc,	loop_1575
	orncc	%i6,	0x1080,	%l5
	ble	%xcc,	loop_1576
	tn	%xcc,	0x5
loop_1575:
	sdivx	%o4,	0x1231,	%g3
	tg	%xcc,	0x4
loop_1576:
	edge16ln	%l1,	%o7,	%o1
	addcc	%g4,	%l2,	%i0
	sth	%g1,	[%l7 + 0x78]
	taddcc	%i7,	%g7,	%g6
	tcs	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	stxa	%o0,	[%l7 + 0x60] %asi
	xnor	%g5,	%o6,	%i4
	fmovdgu	%icc,	%f24,	%f0
	orn	%l0,	0x1ABD,	%l3
	edge16l	%i5,	%g2,	%l6
	udivx	%o5,	0x1DEF,	%i2
	movre	%o2,	%i3,	%l4
	fpadd16	%f22,	%f0,	%f8
	fmovrdgez	%i1,	%f18,	%f22
	array8	%i6,	%o3,	%l5
	movne	%xcc,	%o4,	%l1
	movcs	%xcc,	%g3,	%o1
	srax	%o7,	%g4,	%i0
	xorcc	%l2,	0x130D,	%g1
	fpackfix	%f2,	%f21
	udivx	%g7,	0x1D89,	%i7
	pdist	%f30,	%f24,	%f10
	xnor	%g6,	0x18BF,	%o0
	fmovdvc	%icc,	%f25,	%f6
	movcc	%xcc,	%g5,	%i4
	prefetch	[%l7 + 0x50],	 0x1
	set	0x48, %l5
	prefetcha	[%l7 + %l5] 0x11,	 0x3
	tsubcc	%l3,	0x1FDC,	%o6
	ld	[%l7 + 0x40],	%f17
	bneg,a	loop_1577
	fmovd	%f4,	%f18
	edge32l	%g2,	%l6,	%i5
	tcc	%icc,	0x7
loop_1577:
	ldd	[%l7 + 0x58],	%o4
	subc	%o2,	0x0BDF,	%i2
	fmovscs	%xcc,	%f5,	%f15
	movvs	%xcc,	%l4,	%i3
	srlx	%i6,	%i1,	%l5
	movneg	%icc,	%o3,	%l1
	fors	%f6,	%f18,	%f30
	ble,pt	%icc,	loop_1578
	taddcc	%g3,	%o4,	%o1
	sdivcc	%g4,	0x02F9,	%o7
	ldsb	[%l7 + 0x45],	%i0
loop_1578:
	lduw	[%l7 + 0x70],	%l2
	tn	%icc,	0x7
	nop
	set	0x60, %o6
	ldx	[%l7 + %o6],	%g1
	array16	%i7,	%g7,	%o0
	fmul8x16	%f22,	%f30,	%f8
	edge32ln	%g6,	%g5,	%l0
	addcc	%i4,	%l3,	%g2
	sdivx	%o6,	0x1BEC,	%l6
	andcc	%i5,	%o5,	%i2
	fone	%f0
	tl	%xcc,	0x0
	tcc	%xcc,	0x2
	bvs,pn	%icc,	loop_1579
	sra	%l4,	%o2,	%i6
	mulx	%i1,	0x0678,	%i3
	movcc	%icc,	%l5,	%l1
loop_1579:
	alignaddrl	%o3,	%o4,	%o1
	smulcc	%g4,	%o7,	%i0
	taddcctv	%g3,	%g1,	%l2
	bl,pt	%xcc,	loop_1580
	movpos	%icc,	%g7,	%i7
	tleu	%icc,	0x2
	movrgz	%o0,	0x370,	%g6
loop_1580:
	fand	%f8,	%f14,	%f2
	movneg	%icc,	%g5,	%i4
	xnor	%l0,	0x10FF,	%l3
	xorcc	%g2,	%o6,	%i5
	subccc	%l6,	%o5,	%l4
	brnz	%o2,	loop_1581
	fpadd32s	%f15,	%f16,	%f22
	movpos	%icc,	%i6,	%i2
	tvs	%icc,	0x6
loop_1581:
	srlx	%i1,	%i3,	%l5
	fbl,a	%fcc1,	loop_1582
	brnz,a	%o3,	loop_1583
	fcmpeq32	%f4,	%f0,	%l1
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%o4
loop_1582:
	addc	%o7,	0x1948,	%i0
loop_1583:
	array16	%g4,	%g3,	%l2
	set	0x6C, %g2
	ldsha	[%l7 + %g2] 0x18,	%g1
	sra	%i7,	%o0,	%g6
	fmovd	%f26,	%f20
	mulscc	%g5,	0x0D42,	%i4
	fand	%f22,	%f2,	%f10
	tsubcctv	%l0,	%g7,	%l3
	ble,pt	%icc,	loop_1584
	xorcc	%o6,	%g2,	%l6
	set	0x7A, %l2
	stha	%i5,	[%l7 + %l2] 0x27
	membar	#Sync
loop_1584:
	movpos	%icc,	%o5,	%l4
	wr	%g0,	0x23,	%asi
	stxa	%o2,	[%l7 + 0x28] %asi
	membar	#Sync
	alignaddrl	%i2,	%i1,	%i6
	movgu	%icc,	%i3,	%l5
	fxnors	%f10,	%f29,	%f9
	ba,a	loop_1585
	fpadd16s	%f16,	%f3,	%f29
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x1C] %asi,	%l1
loop_1585:
	fbue,a	%fcc1,	loop_1586
	nop
	setx	loop_1587,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%o1,	0x149B,	%o3
	alignaddrl	%o4,	%o7,	%g4
loop_1586:
	fbe,a	%fcc2,	loop_1588
loop_1587:
	ldd	[%l7 + 0x60],	%g2
	fmovrse	%l2,	%f29,	%f12
	array32	%i0,	%i7,	%g1
loop_1588:
	fnot2s	%f17,	%f15
	sir	0x12DE
	fmuld8sux16	%f30,	%f24,	%f2
	fnegd	%f28,	%f20
	movrgez	%o0,	%g6,	%i4
	orcc	%l0,	%g7,	%l3
	stbar
	set	0x58, %g5
	ldswa	[%l7 + %g5] 0x19,	%g5
	movvs	%xcc,	%g2,	%l6
	addc	%i5,	%o6,	%l4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%o2,	%i2
	edge16l	%o5,	%i1,	%i3
	bvc,a,pn	%xcc,	loop_1589
	tneg	%icc,	0x7
	bg,pn	%xcc,	loop_1590
	xnorcc	%i6,	0x0CE7,	%l1
loop_1589:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o1,	%o3
loop_1590:
	fmovrdgez	%l5,	%f6,	%f24
	bneg	%icc,	loop_1591
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%o7,	%f6,	%f26
	te	%xcc,	0x6
loop_1591:
	fmovdcs	%xcc,	%f8,	%f1
	ta	%icc,	0x6
	fcmpd	%fcc2,	%f28,	%f12
	andncc	%g4,	%g3,	%l2
	fabsd	%f18,	%f30
	tneg	%xcc,	0x7
	bleu	loop_1592
	fmovscc	%xcc,	%f23,	%f27
	mulx	%i0,	%i7,	%g1
	orncc	%o0,	0x1340,	%g6
loop_1592:
	xnor	%i4,	0x0760,	%o4
	mulx	%g7,	0x1231,	%l3
	tcc	%xcc,	0x2
	umulcc	%l0,	%g5,	%g2
	udiv	%i5,	0x03DE,	%l6
	movvc	%xcc,	%l4,	%o6
	fmovdne	%xcc,	%f6,	%f13
	fbge,a	%fcc3,	loop_1593
	edge32	%i2,	%o5,	%i1
	fmovrdne	%i3,	%f4,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1593:
	movrlez	%i6,	%l1,	%o2
	fnot2s	%f3,	%f8
	fmul8x16	%f17,	%f8,	%f4
	edge32	%o1,	%o3,	%o7
	andncc	%l5,	%g3,	%g4
	tl	%xcc,	0x3
	tcs	%icc,	0x0
	te	%xcc,	0x5
	bn,pt	%xcc,	loop_1594
	taddcc	%l2,	%i0,	%i7
	fmovdcs	%xcc,	%f1,	%f23
	fpadd32s	%f10,	%f29,	%f23
loop_1594:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%g1,	loop_1595
	fbe,a	%fcc2,	loop_1596
	smul	%g6,	0x17AA,	%o0
	movvs	%icc,	%o4,	%i4
loop_1595:
	edge16n	%g7,	%l3,	%g5
loop_1596:
	stx	%g2,	[%l7 + 0x58]
	bshuffle	%f30,	%f22,	%f20
	bvc,pn	%xcc,	loop_1597
	taddcc	%l0,	0x1937,	%i5
	bvc	%icc,	loop_1598
	movne	%xcc,	%l6,	%o6
loop_1597:
	fpadd16	%f4,	%f2,	%f2
	sra	%i2,	%o5,	%i1
loop_1598:
	smulcc	%l4,	0x1D43,	%i6
	edge32	%l1,	%o2,	%o1
	movcs	%icc,	%i3,	%o3
	stw	%o7,	[%l7 + 0x38]
	fbge	%fcc1,	loop_1599
	fandnot2s	%f21,	%f10,	%f13
	xnorcc	%l5,	%g3,	%l2
	fmovsle	%xcc,	%f12,	%f21
loop_1599:
	orcc	%i0,	%g4,	%g1
	taddcctv	%g6,	0x15D2,	%i7
	taddcc	%o4,	0x0747,	%o0
	edge16	%g7,	%l3,	%i4
	brgz,a	%g5,	loop_1600
	andcc	%l0,	%g2,	%i5
	mova	%xcc,	%l6,	%o6
	alignaddrl	%i2,	%i1,	%o5
loop_1600:
	fmovdne	%icc,	%f14,	%f17
	fcmpgt32	%f8,	%f24,	%l4
	edge32n	%l1,	%o2,	%o1
	lduw	[%l7 + 0x70],	%i3
	movn	%xcc,	%o3,	%i6
	fbuge,a	%fcc3,	loop_1601
	xnor	%o7,	0x108B,	%g3
	fornot1s	%f18,	%f28,	%f14
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%l5
loop_1601:
	movgu	%xcc,	%i0,	%g1
	ld	[%l7 + 0x2C],	%f11
	fcmpeq32	%f28,	%f12,	%g4
	udivx	%g6,	0x05F7,	%i7
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%f0
	edge8n	%o4,	%o0,	%g7
	edge32n	%l3,	%g5,	%i4
	array32	%g2,	%l0,	%i5
	ldsw	[%l7 + 0x70],	%l6
	bcc,pn	%xcc,	loop_1602
	stx	%i2,	[%l7 + 0x38]
	fornot2s	%f11,	%f16,	%f11
	fsrc2	%f16,	%f6
loop_1602:
	nop
	set	0x08, %o4
	stwa	%i1,	[%l7 + %o4] 0x18
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x6C] %asi,	%f1
	taddcctv	%o5,	0x04AF,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%l1,	%l4
	bg	%xcc,	loop_1603
	alignaddr	%o1,	%i3,	%o2
	sra	%i6,	0x16,	%o7
	tcs	%icc,	0x6
loop_1603:
	andcc	%g3,	0x0131,	%o3
	fmul8sux16	%f14,	%f16,	%f2
	fornot1	%f30,	%f26,	%f28
	movvc	%xcc,	%l5,	%i0
	tgu	%icc,	0x7
	taddcc	%g1,	0x1F34,	%g4
	fnegd	%f2,	%f26
	fmovrdlz	%g6,	%f2,	%f16
	ble,pn	%icc,	loop_1604
	add	%i7,	0x00E9,	%o4
	edge8	%l2,	%g7,	%l3
	bgu,pt	%xcc,	loop_1605
loop_1604:
	movvs	%icc,	%o0,	%g5
	fblg,a	%fcc2,	loop_1606
	fmovrde	%g2,	%f18,	%f16
loop_1605:
	sethi	0x18D0,	%i4
	edge8l	%i5,	%l6,	%l0
loop_1606:
	tneg	%icc,	0x0
	movcc	%xcc,	%i2,	%o5
	edge16l	%o6,	%l1,	%i1
	fcmple16	%f8,	%f18,	%o1
	movpos	%icc,	%i3,	%o2
	edge32l	%i6,	%l4,	%g3
	fmul8x16au	%f0,	%f6,	%f16
	alignaddr	%o3,	%l5,	%o7
	fbug	%fcc2,	loop_1607
	mulscc	%i0,	0x1E25,	%g1
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%g4
loop_1607:
	brlz,a	%o4,	loop_1608
	movg	%xcc,	%l2,	%g7
	fpsub16	%f20,	%f12,	%f4
	tcc	%icc,	0x3
loop_1608:
	srax	%l3,	0x00,	%o0
	mulscc	%g5,	%i7,	%i4
	xnorcc	%g2,	0x0A1D,	%l6
	fmovsa	%icc,	%f24,	%f31
	tl	%icc,	0x6
	orncc	%l0,	0x072D,	%i5
	andncc	%i2,	%o6,	%l1
	movvs	%xcc,	%o5,	%o1
	addc	%i1,	0x0AED,	%i3
	fmovsn	%icc,	%f1,	%f8
	tgu	%icc,	0x2
	edge16ln	%i6,	%o2,	%g3
	orn	%l4,	%o3,	%l5
	nop
	setx	loop_1609,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sir	0x0820
	array16	%i0,	%o7,	%g1
	sdiv	%g4,	0x0D21,	%g6
loop_1609:
	fxor	%f2,	%f2,	%f0
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge8	%o4,	%l2,	%l3
	membar	0x3F
	ldstub	[%l7 + 0x5E],	%g7
	ldub	[%l7 + 0x48],	%o0
	fbne	%fcc3,	loop_1610
	edge8l	%g5,	%i4,	%g2
	movn	%icc,	%i7,	%l0
	movcc	%xcc,	%l6,	%i5
loop_1610:
	tsubcc	%i2,	%l1,	%o6
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x08] %asi,	%f15
	mulscc	%o1,	0x06CD,	%i1
	movn	%xcc,	%o5,	%i6
	tle	%icc,	0x4
	fsrc2	%f30,	%f18
	udiv	%i3,	0x01BD,	%o2
	movcc	%xcc,	%l4,	%g3
	add	%o3,	%i0,	%l5
	movvs	%icc,	%g1,	%g4
	fmovsleu	%icc,	%f18,	%f24
	tgu	%icc,	0x5
	or	%g6,	%o7,	%o4
	tvc	%icc,	0x5
	fcmped	%fcc1,	%f4,	%f18
	tg	%icc,	0x2
	xnorcc	%l3,	0x043D,	%g7
	ldd	[%l7 + 0x18],	%f18
	movne	%icc,	%l2,	%o0
	fmovd	%f4,	%f0
	flush	%l7 + 0x3C
	movne	%icc,	%i4,	%g5
	fbne	%fcc3,	loop_1611
	sdivx	%g2,	0x1EB8,	%l0
	srlx	%l6,	0x1A,	%i5
	sdivcc	%i7,	0x1246,	%l1
loop_1611:
	fmovrdne	%i2,	%f22,	%f18
	andncc	%o6,	%o1,	%o5
	addc	%i1,	%i6,	%o2
	fmovdne	%icc,	%f1,	%f26
	bshuffle	%f26,	%f2,	%f24
	ldstub	[%l7 + 0x2D],	%i3
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%g2
	tle	%xcc,	0x6
	call	loop_1612
	fmuld8ulx16	%f6,	%f3,	%f2
	fmovdcs	%icc,	%f0,	%f14
	udivx	%l4,	0x137F,	%o3
loop_1612:
	tsubcctv	%l5,	%i0,	%g4
	popc	0x0B76,	%g6
	umul	%g1,	%o4,	%o7
	nop
	setx loop_1613, %l0, %l1
	jmpl %l1, %g7
	tvc	%icc,	0x0
	fpmerge	%f26,	%f31,	%f14
	alignaddr	%l3,	%o0,	%l2
loop_1613:
	movcc	%icc,	%g5,	%i4
	fandnot2	%f24,	%f12,	%f8
	tsubcc	%l0,	0x15ED,	%g2
	brgz,a	%i5,	loop_1614
	edge32l	%i7,	%l6,	%i2
	edge16	%o6,	%l1,	%o5
	add	%i1,	%o1,	%i6
loop_1614:
	nop
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x18] %asi,	%o2
	srl	%i3,	%g3,	%l4
	set	0x10, %i2
	ldxa	[%l7 + %i2] 0x10,	%l5
	movpos	%icc,	%o3,	%i0
	std	%g6,	[%l7 + 0x68]
	movrlz	%g1,	0x080,	%g4
	fmovrdlez	%o4,	%f6,	%f8
	edge16n	%g7,	%o7,	%l3
	tne	%icc,	0x3
	edge32	%l2,	%g5,	%i4
	for	%f24,	%f16,	%f24
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x29] %asi,	%o0
	membar	0x0D
	tge	%icc,	0x4
	subc	%g2,	0x0002,	%l0
	mulx	%i7,	%l6,	%i2
	edge32	%i5,	%l1,	%o5
	fones	%f3
	or	%i1,	%o1,	%i6
	edge32	%o6,	%i3,	%g3
	mova	%icc,	%o2,	%l4
	edge8l	%l5,	%i0,	%o3
	umulcc	%g6,	%g4,	%g1
	xor	%o4,	%o7,	%l3
	set	0x10, %l4
	stha	%l2,	[%l7 + %l4] 0x04
	fbul,a	%fcc1,	loop_1615
	edge8n	%g5,	%g7,	%o0
	movne	%xcc,	%g2,	%l0
	fmovsl	%xcc,	%f23,	%f12
loop_1615:
	tvs	%icc,	0x3
	ldstub	[%l7 + 0x0B],	%i4
	umul	%l6,	0x0149,	%i7
	edge32n	%i2,	%l1,	%o5
	movneg	%xcc,	%i5,	%i1
	udivcc	%i6,	0x18B4,	%o1
	fcmpgt16	%f12,	%f16,	%o6
	bcc,pt	%icc,	loop_1616
	array8	%g3,	%i3,	%l4
	sllx	%o2,	%l5,	%i0
	subcc	%o3,	%g4,	%g6
loop_1616:
	alignaddr	%o4,	%g1,	%o7
	fones	%f0
	set	0x58, %l0
	sta	%f15,	[%l7 + %l0] 0x19
	tvc	%xcc,	0x7
	add	%l3,	%l2,	%g7
	fbge	%fcc2,	loop_1617
	bgu	loop_1618
	srax	%g5,	%g2,	%l0
	srl	%o0,	%l6,	%i7
loop_1617:
	fmul8sux16	%f16,	%f30,	%f30
loop_1618:
	nop
	setx	loop_1619,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32	%i2,	%i4,	%l1
	for	%f24,	%f26,	%f0
	movle	%xcc,	%o5,	%i1
loop_1619:
	sdivcc	%i5,	0x0D9E,	%o1
	fcmpne32	%f22,	%f14,	%i6
	fbug,a	%fcc1,	loop_1620
	fcmpes	%fcc1,	%f9,	%f17
	set	0x7F, %o5
	ldsba	[%l7 + %o5] 0x18,	%o6
loop_1620:
	brz,a	%g3,	loop_1621
	bne	loop_1622
	tle	%icc,	0x3
	bne,a,pn	%icc,	loop_1623
loop_1621:
	xnor	%l4,	0x035C,	%i3
loop_1622:
	fble,a	%fcc3,	loop_1624
	smulcc	%o2,	0x0C1D,	%l5
loop_1623:
	sir	0x06D5
	wr	%g0,	0x23,	%asi
	stwa	%o3,	[%l7 + 0x18] %asi
	membar	#Sync
loop_1624:
	fmovsl	%icc,	%f21,	%f6
	fornot1	%f0,	%f22,	%f8
	edge32ln	%i0,	%g4,	%g6
	tpos	%xcc,	0x0
	ldstub	[%l7 + 0x5B],	%o4
	edge8l	%o7,	%g1,	%l2
	fmovdn	%xcc,	%f15,	%f20
	movrlez	%l3,	%g5,	%g7
	fbu	%fcc2,	loop_1625
	smul	%l0,	0x13FA,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f14,	[%l7 + 0x38]
loop_1625:
	brgez,a	%l6,	loop_1626
	movneg	%xcc,	%i7,	%g2
	tgu	%icc,	0x4
	ble,a,pn	%icc,	loop_1627
loop_1626:
	mova	%xcc,	%i2,	%i4
	movn	%xcc,	%o5,	%l1
	orncc	%i1,	%i5,	%o1
loop_1627:
	movgu	%icc,	%o6,	%i6
	fcmpd	%fcc0,	%f8,	%f8
	edge16	%l4,	%i3,	%g3
	tgu	%xcc,	0x5
	movgu	%xcc,	%o2,	%o3
	movg	%icc,	%i0,	%l5
	mulscc	%g6,	0x1ABD,	%g4
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x78] %asi,	%o7
	srlx	%o4,	0x01,	%g1
	fxnor	%f12,	%f28,	%f18
	movne	%icc,	%l3,	%g5
	alignaddrl	%l2,	%l0,	%o0
	udivx	%l6,	0x073B,	%g7
	movre	%i7,	%i2,	%i4
	fbul,a	%fcc2,	loop_1628
	tvc	%xcc,	0x5
	fmovsn	%icc,	%f31,	%f3
	xnorcc	%o5,	%l1,	%g2
loop_1628:
	tcs	%xcc,	0x3
	sdivcc	%i1,	0x0665,	%o1
	membar	0x0A
	bvc	loop_1629
	tgu	%xcc,	0x6
	ba,pt	%icc,	loop_1630
	ld	[%l7 + 0x2C],	%f1
loop_1629:
	bvc,a,pt	%xcc,	loop_1631
	sdivx	%i5,	0x03A4,	%o6
loop_1630:
	mulscc	%l4,	%i3,	%i6
	bcc,a	loop_1632
loop_1631:
	ta	%icc,	0x7
	mulx	%o2,	%g3,	%o3
	ba,a	loop_1633
loop_1632:
	fmovdg	%xcc,	%f27,	%f23
	tsubcc	%i0,	0x00CB,	%g6
	tcs	%xcc,	0x3
loop_1633:
	fcmped	%fcc2,	%f2,	%f10
	stw	%g4,	[%l7 + 0x5C]
	wr	%g0,	0x2f,	%asi
	stxa	%o7,	[%l7 + 0x60] %asi
	membar	#Sync
	fbg	%fcc2,	loop_1634
	te	%icc,	0x6
	movcc	%xcc,	%o4,	%l5
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf8
	membar	#Sync
loop_1634:
	movl	%xcc,	%g1,	%l3
	edge32ln	%l2,	%g5,	%o0
	movrlz	%l6,	%g7,	%l0
	movre	%i2,	%i4,	%o5
	movpos	%xcc,	%l1,	%g2
	sllx	%i7,	0x04,	%i1
	movcc	%xcc,	%o1,	%o6
	edge8ln	%l4,	%i3,	%i6
	ldstub	[%l7 + 0x25],	%i5
	fnegs	%f25,	%f11
	ldx	[%l7 + 0x20],	%g3
	andcc	%o2,	%o3,	%g6
	fexpand	%f9,	%f12
	sir	0x1CDB
	movcs	%xcc,	%i0,	%o7
	array16	%o4,	%g4,	%g1
	edge32l	%l3,	%l5,	%l2
	fsrc2	%f26,	%f16
	alignaddr	%g5,	%l6,	%o0
	xnorcc	%g7,	0x0CEA,	%i2
	set	0x38, %g6
	prefetcha	[%l7 + %g6] 0x81,	 0x0
	andn	%l0,	%l1,	%o5
	fmovsn	%xcc,	%f19,	%f14
	array32	%g2,	%i7,	%i1
	taddcctv	%o6,	%l4,	%i3
	mulx	%i6,	%o1,	%i5
	fnands	%f10,	%f19,	%f19
	xor	%g3,	0x1130,	%o2
	movn	%icc,	%o3,	%i0
	tvc	%xcc,	0x2
	stw	%g6,	[%l7 + 0x5C]
	nop
	setx loop_1635, %l0, %l1
	jmpl %l1, %o4
	orncc	%g4,	%o7,	%l3
	fpsub16	%f0,	%f0,	%f24
	prefetch	[%l7 + 0x1C],	 0x1
loop_1635:
	nop
	set	0x5A, %i7
	ldstuba	[%l7 + %i7] 0x80,	%g1
	bshuffle	%f28,	%f8,	%f18
	taddcc	%l2,	%g5,	%l5
	xor	%l6,	%g7,	%o0
	fmovdvs	%icc,	%f22,	%f28
	umulcc	%i4,	0x1968,	%i2
	tsubcc	%l0,	0x1A74,	%o5
	stbar
	std	%l0,	[%l7 + 0x20]
	subccc	%g2,	%i7,	%i1
	sir	0x1FFF
	movneg	%icc,	%l4,	%o6
	te	%xcc,	0x3
	fmovsne	%icc,	%f30,	%f21
	sdivx	%i3,	0x140E,	%o1
	tl	%icc,	0x0
	membar	0x2E
	ldsb	[%l7 + 0x55],	%i6
	ldsw	[%l7 + 0x7C],	%g3
	fmul8ulx16	%f0,	%f20,	%f22
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
	movn	%icc,	%o2,	%i5
	sra	%i0,	%g6,	%o3
	orn	%g4,	0x1C87,	%o7
	tsubcc	%o4,	%l3,	%l2
	fbn,a	%fcc1,	loop_1636
	tl	%xcc,	0x4
	bpos,a,pn	%icc,	loop_1637
	taddcc	%g1,	0x0A35,	%g5
loop_1636:
	movleu	%icc,	%l6,	%g7
	fnegd	%f16,	%f2
loop_1637:
	mulscc	%o0,	%l5,	%i2
	fmovsne	%xcc,	%f10,	%f10
	fzeros	%f12
	fmovsa	%icc,	%f10,	%f19
	bcc,pt	%icc,	loop_1638
	subcc	%i4,	0x05F4,	%o5
	edge32n	%l1,	%g2,	%i7
	smulcc	%i1,	%l0,	%l4
loop_1638:
	te	%xcc,	0x1
	xorcc	%o6,	%i3,	%i6
	st	%f9,	[%l7 + 0x30]
	fabss	%f16,	%f15
	sll	%g3,	0x02,	%o2
	fmovdvs	%icc,	%f5,	%f21
	ta	%xcc,	0x6
	std	%f14,	[%l7 + 0x10]
	fblg	%fcc0,	loop_1639
	movcs	%xcc,	%i5,	%i0
	umulcc	%o1,	%o3,	%g6
	fpsub32	%f30,	%f14,	%f20
loop_1639:
	fnegd	%f8,	%f30
	fsrc2s	%f20,	%f25
	fmul8x16al	%f22,	%f9,	%f28
	sdivcc	%o7,	0x1413,	%g4
	movrlez	%o4,	0x1CC,	%l2
	fandnot1	%f24,	%f6,	%f28
	tn	%icc,	0x4
	addccc	%g1,	%l3,	%l6
	movle	%xcc,	%g5,	%o0
	set	0x4C, %o0
	ldswa	[%l7 + %o0] 0x0c,	%l5
	popc	0x04C9,	%g7
	set	0x20, %l6
	ldda	[%l7 + %l6] 0x2c,	%i2
	set	0x15, %g4
	ldsba	[%l7 + %g4] 0x14,	%o5
	fsrc1	%f24,	%f20
	udivx	%l1,	0x19E5,	%g2
	tgu	%icc,	0x4
	fpack16	%f16,	%f19
	fnands	%f13,	%f29,	%f6
	fmovsl	%icc,	%f5,	%f6
	sllx	%i4,	0x11,	%i1
	edge8	%l0,	%i7,	%o6
	movrlz	%l4,	0x2B4,	%i3
	swap	[%l7 + 0x5C],	%g3
	ldsw	[%l7 + 0x20],	%i6
	movl	%xcc,	%o2,	%i0
	fmovsneg	%xcc,	%f9,	%f22
	sdivx	%o1,	0x172D,	%o3
	movle	%icc,	%g6,	%i5
	umul	%g4,	0x15CC,	%o7
	tleu	%icc,	0x0
	ldx	[%l7 + 0x50],	%o4
	fmovsle	%icc,	%f5,	%f31
	set	0x68, %o2
	prefetcha	[%l7 + %o2] 0x11,	 0x0
	umulcc	%l2,	0x0BCE,	%l6
	fbug	%fcc3,	loop_1640
	alignaddrl	%g5,	%l3,	%l5
	tle	%xcc,	0x7
	xorcc	%g7,	%o0,	%o5
loop_1640:
	edge8ln	%l1,	%i2,	%i4
	fmovrdlz	%g2,	%f18,	%f16
	or	%i1,	%i7,	%l0
	and	%o6,	0x184E,	%i3
	nop
	setx	loop_1641,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	siam	0x4
	brlez	%l4,	loop_1642
	nop
	setx	loop_1643,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1641:
	mulscc	%i6,	%o2,	%g3
	subcc	%i0,	0x0313,	%o3
loop_1642:
	fbug,a	%fcc2,	loop_1644
loop_1643:
	fmovrsgz	%g6,	%f15,	%f27
	or	%o1,	%i5,	%g4
	edge32	%o4,	%o7,	%g1
loop_1644:
	mulx	%l2,	0x0847,	%l6
	ldsh	[%l7 + 0x58],	%g5
	bcs,a,pt	%icc,	loop_1645
	fblg,a	%fcc1,	loop_1646
	ble	%xcc,	loop_1647
	fbug	%fcc3,	loop_1648
loop_1645:
	fxnor	%f14,	%f10,	%f30
loop_1646:
	flush	%l7 + 0x74
loop_1647:
	udivx	%l3,	0x1CAA,	%g7
loop_1648:
	fmul8x16au	%f30,	%f18,	%f2
	bneg,a,pt	%icc,	loop_1649
	fxor	%f28,	%f26,	%f10
	addccc	%l5,	%o0,	%o5
	fbn	%fcc0,	loop_1650
loop_1649:
	nop
	setx	loop_1651,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movn	%xcc,	%i2,	%l1
	fbe	%fcc1,	loop_1652
loop_1650:
	srl	%i4,	0x0A,	%g2
loop_1651:
	fmovscs	%xcc,	%f27,	%f10
	fmovsvs	%icc,	%f26,	%f27
loop_1652:
	sethi	0x1F83,	%i1
	sllx	%l0,	0x02,	%o6
	ldub	[%l7 + 0x0A],	%i7
	sub	%i3,	%l4,	%o2
	tg	%xcc,	0x4
	ldsh	[%l7 + 0x76],	%i6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%g3,	%o3
	sra	%g6,	0x14,	%i0
	fpadd16s	%f3,	%f8,	%f20
	edge8n	%i5,	%g4,	%o4
	tgu	%xcc,	0x6
	fmovsg	%icc,	%f11,	%f15
	addcc	%o1,	0x0A91,	%g1
	fzeros	%f13
	movge	%xcc,	%o7,	%l6
	fpackfix	%f26,	%f2
	edge32l	%l2,	%l3,	%g5
	prefetch	[%l7 + 0x28],	 0x1
	mulscc	%g7,	0x168E,	%l5
	move	%xcc,	%o5,	%o0
	fpack16	%f6,	%f8
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x4D] %asi,	%i2
	movpos	%icc,	%l1,	%i4
	tcs	%xcc,	0x3
	movrgz	%i1,	0x072,	%l0
	subccc	%o6,	%i7,	%g2
	prefetch	[%l7 + 0x2C],	 0x0
	brlez	%i3,	loop_1653
	fmovda	%xcc,	%f22,	%f3
	xnorcc	%l4,	0x04D8,	%i6
	fbne	%fcc1,	loop_1654
loop_1653:
	movvc	%icc,	%o2,	%g3
	movg	%xcc,	%o3,	%g6
	srlx	%i5,	%g4,	%o4
loop_1654:
	mulx	%o1,	0x1887,	%i0
	xor	%o7,	0x14A5,	%l6
	popc	0x0E73,	%l2
	alignaddrl	%l3,	%g1,	%g7
	smulcc	%l5,	%g5,	%o0
	set	0x34, %i4
	sta	%f17,	[%l7 + %i4] 0x10
	fabss	%f21,	%f0
	movcs	%xcc,	%i2,	%o5
	fmovdleu	%icc,	%f15,	%f9
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%l1,	%f4,	%f8
	fbule,a	%fcc2,	loop_1655
	movvc	%xcc,	%i1,	%i4
	edge16n	%l0,	%i7,	%o6
	fmul8ulx16	%f28,	%f16,	%f14
loop_1655:
	alignaddrl	%i3,	%l4,	%g2
	fxor	%f2,	%f16,	%f24
	fmovrsgz	%i6,	%f3,	%f8
	fbge	%fcc3,	loop_1656
	udiv	%o2,	0x0D5B,	%o3
	mova	%icc,	%g3,	%g6
	xnor	%g4,	%i5,	%o1
loop_1656:
	umul	%o4,	0x04F5,	%i0
	fmovdge	%xcc,	%f9,	%f3
	bneg,a	loop_1657
	array16	%o7,	%l2,	%l3
	smul	%g1,	0x1710,	%g7
	fzero	%f14
loop_1657:
	membar	0x69
	movpos	%xcc,	%l5,	%g5
	movneg	%icc,	%o0,	%l6
	movrlz	%o5,	%i2,	%i1
	andcc	%i4,	0x1F8B,	%l1
	movneg	%xcc,	%l0,	%i7
	movn	%xcc,	%i3,	%o6
	fmul8x16	%f11,	%f16,	%f18
	edge32n	%l4,	%g2,	%i6
	orcc	%o2,	%g3,	%o3
	ldx	[%l7 + 0x70],	%g6
	array32	%i5,	%g4,	%o4
	taddcc	%o1,	%i0,	%o7
	andcc	%l2,	%g1,	%l3
	alignaddr	%g7,	%g5,	%o0
	bgu,a	%icc,	loop_1658
	lduw	[%l7 + 0x14],	%l6
	brgez,a	%l5,	loop_1659
	xorcc	%i2,	0x019C,	%o5
loop_1658:
	fmovsne	%icc,	%f16,	%f16
	ba,a,pt	%xcc,	loop_1660
loop_1659:
	tne	%xcc,	0x3
	fnot2	%f18,	%f28
	movle	%xcc,	%i4,	%i1
loop_1660:
	xnorcc	%l0,	0x009C,	%l1
	smul	%i3,	%o6,	%l4
	sllx	%i7,	%g2,	%i6
	sdivcc	%o2,	0x14D1,	%g3
	sdiv	%o3,	0x1949,	%g6
	movleu	%icc,	%g4,	%i5
	ldstub	[%l7 + 0x0E],	%o1
	addccc	%o4,	%i0,	%l2
	edge8n	%o7,	%l3,	%g7
	fmul8x16al	%f2,	%f14,	%f26
	movleu	%icc,	%g1,	%o0
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x4B] %asi,	%l6
	taddcctv	%l5,	0x0A9C,	%i2
	fmovdgu	%icc,	%f16,	%f2
	or	%g5,	0x0F52,	%i4
	movvs	%icc,	%i1,	%l0
	fmovrdne	%o5,	%f0,	%f26
	edge16n	%l1,	%i3,	%o6
	udivx	%l4,	0x1379,	%g2
	edge16n	%i7,	%i6,	%g3
	set	0x28, %g7
	stba	%o2,	[%l7 + %g7] 0xe3
	membar	#Sync
	wr	%g0,	0x80,	%asi
	stha	%o3,	[%l7 + 0x7E] %asi
	sir	0x0E07
	ldsb	[%l7 + 0x56],	%g4
	fpsub32s	%f11,	%f9,	%f12
	alignaddr	%i5,	%g6,	%o4
	fands	%f14,	%f6,	%f23
	xnor	%i0,	%o1,	%l2
	fcmpne32	%f26,	%f18,	%l3
	brz	%o7,	loop_1661
	fbu,a	%fcc3,	loop_1662
	fbne	%fcc0,	loop_1663
	fandnot1s	%f20,	%f15,	%f15
loop_1661:
	umulcc	%g1,	%g7,	%o0
loop_1662:
	fcmps	%fcc0,	%f19,	%f21
loop_1663:
	fmovdge	%icc,	%f26,	%f21
	tle	%xcc,	0x2
	movrgez	%l5,	0x3C6,	%l6
	tge	%icc,	0x6
	udiv	%g5,	0x1C4E,	%i2
	andcc	%i1,	%l0,	%i4
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x2E] %asi,	%o5
	edge32l	%i3,	%o6,	%l1
	fmovsa	%xcc,	%f25,	%f15
	fmovsg	%xcc,	%f8,	%f27
	sdivx	%g2,	0x0A0B,	%i7
	edge32ln	%l4,	%i6,	%o2
	ldstub	[%l7 + 0x25],	%g3
	ldd	[%l7 + 0x28],	%f22
	movl	%icc,	%g4,	%o3
	edge32l	%g6,	%i5,	%i0
	fbe	%fcc0,	loop_1664
	edge16l	%o4,	%o1,	%l3
	andn	%l2,	0x0A12,	%g1
	orncc	%g7,	0x05FB,	%o7
loop_1664:
	taddcctv	%o0,	0x1E19,	%l5
	array32	%l6,	%g5,	%i2
	edge16ln	%i1,	%l0,	%i4
	fmovdge	%icc,	%f11,	%f27
	edge8n	%o5,	%o6,	%i3
	subc	%g2,	%l1,	%l4
	edge32	%i6,	%o2,	%g3
	fandnot1s	%f23,	%f19,	%f1
	ba,a	loop_1665
	lduw	[%l7 + 0x68],	%g4
	orncc	%i7,	%o3,	%g6
	fmovrde	%i5,	%f18,	%f0
loop_1665:
	fexpand	%f15,	%f16
	fnands	%f8,	%f21,	%f30
	fmovd	%f12,	%f30
	fmovsneg	%xcc,	%f19,	%f28
	tsubcc	%i0,	0x1670,	%o4
	ld	[%l7 + 0x5C],	%f25
	nop
	set	0x60, %o3
	ldx	[%l7 + %o3],	%o1
	set	0x70, %i6
	stwa	%l3,	[%l7 + %i6] 0x11
	nop
	set	0x2F, %o1
	ldsb	[%l7 + %o1],	%g1
	set	0x74, %l1
	swapa	[%l7 + %l1] 0x18,	%g7
	edge32	%l2,	%o7,	%l5
	edge16ln	%l6,	%o0,	%i2
	edge16	%i1,	%g5,	%i4
	movg	%icc,	%l0,	%o5
	movleu	%icc,	%i3,	%o6
	orncc	%l1,	0x1843,	%g2
	edge8n	%i6,	%l4,	%o2
	tn	%icc,	0x3
	bneg,a	%icc,	loop_1666
	movrne	%g3,	0x2C5,	%i7
	stbar
	fba,a	%fcc1,	loop_1667
loop_1666:
	umul	%g4,	0x0ACE,	%g6
	subc	%o3,	%i5,	%i0
	fmovsa	%xcc,	%f22,	%f27
loop_1667:
	movg	%icc,	%o1,	%l3
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x4C] %asi,	%o4
	fnors	%f12,	%f23,	%f18
	fpsub16	%f4,	%f4,	%f2
	fbo,a	%fcc0,	loop_1668
	edge32n	%g7,	%g1,	%o7
	sll	%l5,	0x15,	%l2
	fmovrdgz	%l6,	%f0,	%f12
loop_1668:
	movne	%xcc,	%i2,	%o0
	fmovspos	%icc,	%f3,	%f2
	tcs	%xcc,	0x0
	andncc	%i1,	%g5,	%i4
	sir	0x08C0
	fmovsl	%icc,	%f17,	%f7
	fcmpeq16	%f2,	%f4,	%o5
	subc	%i3,	0x197B,	%o6
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%l0
	fmovs	%f25,	%f25
	alignaddr	%l1,	%i6,	%l4
	tcc	%xcc,	0x5
	fmovrdgz	%o2,	%f10,	%f20
	subc	%g2,	0x00E0,	%g3
	ta	%icc,	0x4
	bcs	loop_1669
	sethi	0x0522,	%g4
	sethi	0x1F77,	%i7
	edge16n	%o3,	%g6,	%i5
loop_1669:
	fmovrsne	%o1,	%f24,	%f2
	fmovsge	%xcc,	%f16,	%f27
	fmovsne	%xcc,	%f4,	%f11
	brz	%i0,	loop_1670
	edge16ln	%l3,	%o4,	%g1
	array8	%g7,	%l5,	%o7
	nop
	setx	loop_1671,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1670:
	movvc	%xcc,	%l2,	%l6
	fsrc2s	%f14,	%f26
	xnor	%i2,	0x0BC8,	%o0
loop_1671:
	tsubcc	%i1,	%i4,	%o5
	addcc	%i3,	0x11A5,	%o6
	brnz	%g5,	loop_1672
	fbu	%fcc3,	loop_1673
	tvc	%icc,	0x2
	nop
	setx	loop_1674,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1672:
	array16	%l0,	%i6,	%l1
loop_1673:
	taddcctv	%l4,	0x062E,	%o2
	movneg	%xcc,	%g2,	%g3
loop_1674:
	tvc	%icc,	0x7
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	fcmpgt16	%f12,	%f2,	%g4
	std	%f22,	[%l7 + 0x48]
	fornot1	%f8,	%f12,	%f8
	stw	%o3,	[%l7 + 0x54]
	smulcc	%i5,	0x1FA4,	%g6
	taddcctv	%o1,	0x19FF,	%l3
	edge8l	%i0,	%o4,	%g7
	tge	%xcc,	0x4
	tl	%icc,	0x7
	fpsub16	%f0,	%f30,	%f20
	tvs	%xcc,	0x0
	add	%l5,	%o7,	%g1
	std	%l2,	[%l7 + 0x60]
	tge	%icc,	0x6
	ldub	[%l7 + 0x29],	%l6
	fcmpgt32	%f8,	%f8,	%i2
	edge8l	%i1,	%i4,	%o5
	ldd	[%l7 + 0x20],	%i2
	fmuld8sux16	%f20,	%f8,	%f8
	stbar
	fmovsa	%xcc,	%f30,	%f3
	nop
	setx loop_1675, %l0, %l1
	jmpl %l1, %o6
	movg	%xcc,	%o0,	%l0
	taddcc	%g5,	0x1977,	%i6
	fnot2	%f14,	%f6
loop_1675:
	addcc	%l4,	0x0F61,	%l1
	ta	%icc,	0x3
	fmovrsne	%g2,	%f9,	%f27
	orn	%g3,	0x0FE8,	%o2
	set	0x0E, %i1
	ldstuba	[%l7 + %i1] 0x10,	%g4
	nop
	set	0x3E, %l3
	ldstub	[%l7 + %l3],	%o3
	fmovsn	%icc,	%f5,	%f23
	fmovrdgz	%i5,	%f8,	%f8
	movneg	%xcc,	%g6,	%i7
	tgu	%icc,	0x2
	movrgez	%l3,	0x11B,	%o1
	andncc	%i0,	%o4,	%g7
	addccc	%o7,	0x1474,	%g1
	addccc	%l2,	%l6,	%l5
	fmuld8ulx16	%f26,	%f26,	%f20
	sll	%i1,	%i4,	%i2
	fbo	%fcc0,	loop_1676
	movneg	%icc,	%i3,	%o5
	tge	%icc,	0x3
	fmul8x16au	%f11,	%f0,	%f30
loop_1676:
	addc	%o6,	0x1390,	%l0
	movneg	%icc,	%o0,	%g5
	movvs	%icc,	%i6,	%l4
	st	%f16,	[%l7 + 0x64]
	alignaddr	%g2,	%l1,	%g3
	bcc,pn	%xcc,	loop_1677
	tneg	%icc,	0x4
	udiv	%g4,	0x0805,	%o3
	fmovscc	%icc,	%f10,	%f13
loop_1677:
	movrlz	%i5,	%g6,	%o2
	alignaddrl	%i7,	%l3,	%i0
	andcc	%o4,	%g7,	%o7
	bgu	%xcc,	loop_1678
	tl	%icc,	0x6
	fcmpeq32	%f26,	%f2,	%g1
	udivcc	%o1,	0x1FAB,	%l2
loop_1678:
	sdivx	%l5,	0x1F92,	%i1
	xnor	%i4,	0x022A,	%l6
	movrgz	%i2,	0x143,	%i3
	bpos,a	loop_1679
	addc	%o6,	0x07B2,	%o5
	edge16	%l0,	%g5,	%o0
	sra	%i6,	0x05,	%l4
loop_1679:
	fbue,a	%fcc1,	loop_1680
	fmovdn	%xcc,	%f11,	%f18
	umul	%l1,	%g3,	%g2
	sdiv	%g4,	0x1E0F,	%o3
loop_1680:
	sdiv	%g6,	0x1D77,	%o2
	fmovrde	%i7,	%f12,	%f2
	sdiv	%l3,	0x1B37,	%i5
	movgu	%icc,	%i0,	%o4
	pdist	%f4,	%f4,	%f28
	xnor	%g7,	0x1F5B,	%g1
	tn	%icc,	0x5
	std	%o6,	[%l7 + 0x50]
	orcc	%o1,	%l2,	%i1
	fmovrdlez	%i4,	%f20,	%f28
	edge16n	%l6,	%l5,	%i2
	tpos	%icc,	0x7
	fandnot2s	%f16,	%f8,	%f26
	edge16n	%o6,	%o5,	%i3
	fcmpd	%fcc0,	%f8,	%f10
	stb	%l0,	[%l7 + 0x7E]
	movrne	%g5,	%i6,	%l4
	tneg	%icc,	0x4
	movcs	%xcc,	%l1,	%o0
	movcs	%icc,	%g3,	%g2
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x81
	tpos	%icc,	0x6
	brgez,a	%o3,	loop_1681
	udivcc	%g6,	0x0937,	%g4
	udiv	%o2,	0x13F8,	%i7
	srax	%l3,	%i0,	%i5
loop_1681:
	tge	%icc,	0x4
	or	%o4,	%g7,	%o7
	xorcc	%g1,	0x111C,	%o1
	fcmpes	%fcc1,	%f24,	%f23
	tcc	%icc,	0x4
	edge8n	%l2,	%i1,	%i4
	fmovsneg	%icc,	%f26,	%f14
	orncc	%l5,	%l6,	%i2
	fmovdpos	%xcc,	%f5,	%f14
	tgu	%xcc,	0x1
	smulcc	%o6,	0x0221,	%i3
	edge16	%l0,	%g5,	%i6
	edge32ln	%l4,	%l1,	%o5
	fmovsne	%xcc,	%f5,	%f8
	fmovdneg	%icc,	%f20,	%f5
	movvs	%icc,	%o0,	%g3
	udivx	%g2,	0x0BDE,	%o3
	tcc	%icc,	0x7
	popc	0x16AA,	%g6
	fbe,a	%fcc0,	loop_1682
	faligndata	%f28,	%f30,	%f4
	array8	%g4,	%i7,	%o2
	fpsub32	%f16,	%f4,	%f10
loop_1682:
	tgu	%icc,	0x0
	tgu	%icc,	0x1
	mulx	%i0,	0x1B32,	%i5
	movn	%xcc,	%o4,	%g7
	move	%xcc,	%o7,	%g1
	bneg,a	loop_1683
	fmovse	%xcc,	%f23,	%f12
	array8	%l3,	%o1,	%l2
	membar	0x17
loop_1683:
	ble,pn	%xcc,	loop_1684
	andncc	%i1,	%l5,	%i4
	add	%i2,	%l6,	%o6
	movge	%xcc,	%l0,	%g5
loop_1684:
	fmovdleu	%xcc,	%f0,	%f2
	array32	%i6,	%i3,	%l1
	edge32l	%l4,	%o5,	%o0
	set	0x6A, %i3
	stha	%g3,	[%l7 + %i3] 0xe3
	membar	#Sync
	umul	%o3,	%g2,	%g4
	add	%g6,	0x1B56,	%i7
	and	%o2,	0x112C,	%i5
	std	%i0,	[%l7 + 0x40]
	nop
	set	0x6C, %l5
	stw	%o4,	[%l7 + %l5]
	edge8l	%g7,	%o7,	%g1
	movcs	%icc,	%l3,	%o1
	udiv	%l2,	0x0AC2,	%l5
	fble,a	%fcc1,	loop_1685
	movl	%xcc,	%i4,	%i1
	fbne	%fcc2,	loop_1686
	smul	%l6,	0x02B1,	%i2
loop_1685:
	movvc	%icc,	%o6,	%l0
	udiv	%g5,	0x1301,	%i3
loop_1686:
	bl	loop_1687
	tvc	%xcc,	0x1
	be,pt	%icc,	loop_1688
	alignaddr	%l1,	%l4,	%o5
loop_1687:
	fcmpgt16	%f10,	%f16,	%i6
	swap	[%l7 + 0x0C],	%g3
loop_1688:
	brz	%o0,	loop_1689
	movrlz	%o3,	0x359,	%g2
	movvs	%xcc,	%g6,	%g4
	subccc	%o2,	0x0C2B,	%i7
loop_1689:
	subccc	%i5,	%i0,	%o4
	fone	%f26
	fbul,a	%fcc3,	loop_1690
	srl	%o7,	0x1F,	%g1
	ble,a	loop_1691
	umul	%l3,	0x15A3,	%g7
loop_1690:
	fpmerge	%f21,	%f10,	%f18
	te	%xcc,	0x3
loop_1691:
	movrlz	%o1,	%l2,	%i4
	bneg,a	%icc,	loop_1692
	movpos	%icc,	%l5,	%i1
	alignaddrl	%i2,	%l6,	%l0
	ld	[%l7 + 0x18],	%f8
loop_1692:
	udivx	%g5,	0x16E8,	%i3
	lduh	[%l7 + 0x5C],	%o6
	brgez,a	%l1,	loop_1693
	brgz,a	%l4,	loop_1694
	xnorcc	%o5,	%i6,	%g3
	siam	0x3
loop_1693:
	fandnot2	%f18,	%f16,	%f8
loop_1694:
	andncc	%o3,	%o0,	%g6
	umulcc	%g2,	%g4,	%i7
	movgu	%icc,	%o2,	%i0
	fmovdcs	%xcc,	%f2,	%f0
	xor	%o4,	0x1939,	%i5
	edge16ln	%g1,	%o7,	%l3
	fbe,a	%fcc3,	loop_1695
	brgez,a	%o1,	loop_1696
	sethi	0x0D2F,	%g7
	fmovrsne	%l2,	%f16,	%f28
loop_1695:
	pdist	%f14,	%f10,	%f20
loop_1696:
	nop
	set	0x24, %g2
	swapa	[%l7 + %g2] 0x0c,	%i4
	edge16ln	%l5,	%i1,	%i2
	fbne	%fcc0,	loop_1697
	fmovdle	%icc,	%f13,	%f9
	movcs	%icc,	%l6,	%g5
	edge16n	%l0,	%o6,	%l1
loop_1697:
	movrlz	%l4,	0x1FE,	%o5
	bg,a	%icc,	loop_1698
	subccc	%i6,	0x0D1A,	%i3
	orn	%g3,	0x0FA1,	%o3
	fmul8x16au	%f24,	%f14,	%f4
loop_1698:
	flush	%l7 + 0x68
	call	loop_1699
	fmovdge	%icc,	%f26,	%f11
	movrgz	%g6,	0x3FE,	%o0
	sub	%g4,	%i7,	%g2
loop_1699:
	brgz,a	%o2,	loop_1700
	movrlez	%o4,	0x370,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g1,	[%l7 + 0x6C]
loop_1700:
	fxnors	%f26,	%f24,	%f4
	tn	%xcc,	0x5
	bvs,a,pn	%xcc,	loop_1701
	fmovsa	%icc,	%f10,	%f17
	movl	%icc,	%o7,	%i0
	fpsub16s	%f20,	%f25,	%f7
loop_1701:
	sdivcc	%l3,	0x10CA,	%o1
	sdiv	%l2,	0x1315,	%g7
	tle	%icc,	0x4
	fzeros	%f6
	edge8ln	%l5,	%i1,	%i4
	xor	%l6,	0x0898,	%g5
	mulx	%i2,	%l0,	%o6
	prefetch	[%l7 + 0x40],	 0x3
	udivcc	%l4,	0x02D7,	%l1
	fmovsgu	%xcc,	%f20,	%f14
	ta	%xcc,	0x2
	tcc	%icc,	0x4
	umulcc	%o5,	%i6,	%i3
	addcc	%g3,	%o3,	%o0
	tneg	%icc,	0x6
	membar	0x1C
	alignaddrl	%g6,	%i7,	%g4
	fmovdpos	%icc,	%f21,	%f21
	mova	%xcc,	%o2,	%g2
	taddcctv	%i5,	0x19E4,	%g1
	taddcc	%o7,	%i0,	%o4
	srl	%l3,	%l2,	%o1
	edge16	%l5,	%g7,	%i4
	taddcctv	%i1,	%l6,	%g5
	edge16ln	%i2,	%l0,	%l4
	tne	%xcc,	0x1
	fmovdleu	%xcc,	%f30,	%f11
	edge32l	%l1,	%o5,	%o6
	srl	%i3,	0x11,	%i6
	fmovsleu	%xcc,	%f26,	%f21
	tsubcc	%o3,	0x0815,	%o0
	ta	%xcc,	0x7
	sir	0x1EC2
	andn	%g3,	0x0A83,	%i7
	tvc	%xcc,	0x3
	sdivcc	%g6,	0x0AE1,	%g4
	tcc	%xcc,	0x6
	ldd	[%l7 + 0x08],	%f26
	fbu	%fcc0,	loop_1702
	tg	%xcc,	0x5
	swap	[%l7 + 0x1C],	%o2
	and	%g2,	%i5,	%g1
loop_1702:
	bshuffle	%f2,	%f16,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc1,	loop_1703
	bneg,pt	%xcc,	loop_1704
	orn	%i0,	%o7,	%o4
	addccc	%l3,	%l2,	%l5
loop_1703:
	tvc	%icc,	0x6
loop_1704:
	tgu	%xcc,	0x0
	stw	%o1,	[%l7 + 0x20]
	movle	%icc,	%i4,	%i1
	sdivcc	%l6,	0x0A1F,	%g7
	fones	%f24
	subc	%g5,	0x1798,	%i2
	ldsw	[%l7 + 0x4C],	%l4
	udiv	%l0,	0x06A9,	%o5
	tcc	%xcc,	0x0
	set	0x0E, %l2
	ldsha	[%l7 + %l2] 0x18,	%l1
	fmovspos	%icc,	%f19,	%f11
	tcs	%icc,	0x1
	bgu,pt	%xcc,	loop_1705
	movgu	%icc,	%i3,	%o6
	set	0x38, %o6
	ldxa	[%g0 + %o6] 0x20,	%o3
loop_1705:
	edge16l	%i6,	%g3,	%o0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%g6,	%g4
	andncc	%i7,	%o2,	%i5
	brlez	%g2,	loop_1706
	addccc	%g1,	%o7,	%i0
	fbne,a	%fcc3,	loop_1707
	fsrc1s	%f25,	%f15
loop_1706:
	nop
	set	0x6A, %i5
	lduha	[%l7 + %i5] 0x19,	%l3
loop_1707:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc3,	%f17,	%f27
	taddcc	%l2,	0x0228,	%o4
	fmovdgu	%xcc,	%f4,	%f4
	array8	%o1,	%l5,	%i4
	set	0x68, %o4
	swapa	[%l7 + %o4] 0x19,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x60],	%f15
	ldd	[%l7 + 0x48],	%f16
	movcc	%icc,	%l6,	%g5
	fcmps	%fcc2,	%f24,	%f31
	movgu	%icc,	%g7,	%l4
	edge16l	%l0,	%o5,	%i2
	alignaddr	%i3,	%o6,	%o3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x70] %asi,	%i6
	movpos	%icc,	%g3,	%l1
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x19
	edge8l	%o0,	%g6,	%g4
	umulcc	%o2,	%i7,	%g2
	fmul8ulx16	%f24,	%f30,	%f24
	te	%icc,	0x3
	fmovsleu	%icc,	%f29,	%f19
	sub	%i5,	0x1278,	%o7
	fmovsvs	%icc,	%f15,	%f10
	mulx	%i0,	%g1,	%l3
	fmovdgu	%xcc,	%f19,	%f21
	fbn	%fcc0,	loop_1708
	edge16n	%o4,	%l2,	%o1
	fpsub32s	%f26,	%f26,	%f13
	edge16	%i4,	%l5,	%i1
loop_1708:
	sir	0x061C
	prefetch	[%l7 + 0x30],	 0x3
	tl	%xcc,	0x4
	fxnor	%f16,	%f18,	%f8
	fnot1s	%f4,	%f17
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x18,	%f0
	movpos	%icc,	%l6,	%g5
	sdivcc	%l4,	0x08EA,	%l0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g7,	%i2
	fmovdcc	%xcc,	%f25,	%f8
	tsubcc	%o5,	0x1C7D,	%o6
	set	0x0, %l4
	stxa	%o3,	[%g0 + %l4] 0x5f
	fmovrsne	%i3,	%f27,	%f4
	sdivcc	%i6,	0x130B,	%l1
	umulcc	%o0,	%g3,	%g4
	edge8ln	%o2,	%g6,	%g2
	edge32l	%i5,	%o7,	%i7
	edge16n	%i0,	%g1,	%o4
	be,pn	%icc,	loop_1709
	udivcc	%l2,	0x1C02,	%o1
	fcmpgt32	%f20,	%f8,	%l3
	ta	%xcc,	0x1
loop_1709:
	tcs	%icc,	0x2
	edge16n	%l5,	%i1,	%i4
	mulx	%g5,	%l4,	%l6
	std	%f16,	[%l7 + 0x78]
	popc	%g7,	%i2
	brlz,a	%o5,	loop_1710
	movrgez	%o6,	%l0,	%o3
	edge16ln	%i3,	%i6,	%l1
	sub	%o0,	0x0C1C,	%g3
loop_1710:
	nop
	set	0x7A, %l0
	stba	%g4,	[%l7 + %l0] 0x88
	movl	%xcc,	%o2,	%g2
	tcs	%icc,	0x6
	array32	%g6,	%o7,	%i7
	fmovde	%xcc,	%f10,	%f31
	wr	%g0,	0xea,	%asi
	stda	%i0,	[%l7 + 0x78] %asi
	membar	#Sync
	sethi	0x1DC8,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g1,	%l2,	%o1
	brnz,a	%o4,	loop_1711
	array32	%l3,	%i1,	%l5
	ldsw	[%l7 + 0x44],	%i4
	nop
	setx	loop_1712,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1711:
	fmovrdne	%l4,	%f6,	%f2
	or	%g5,	%g7,	%l6
	fmovsleu	%icc,	%f27,	%f27
loop_1712:
	fnegd	%f30,	%f26
	fmovrslez	%i2,	%f13,	%f7
	umul	%o6,	0x042F,	%l0
	tn	%icc,	0x7
	and	%o3,	0x0BBD,	%o5
	fbe,a	%fcc0,	loop_1713
	fmovdg	%icc,	%f23,	%f17
	fmul8sux16	%f8,	%f10,	%f6
	xor	%i6,	0x0118,	%l1
loop_1713:
	siam	0x5
	fbug,a	%fcc3,	loop_1714
	alignaddr	%i3,	%g3,	%g4
	fbl,a	%fcc3,	loop_1715
	move	%xcc,	%o2,	%g2
loop_1714:
	ldsw	[%l7 + 0x74],	%o0
	ta	%xcc,	0x1
loop_1715:
	fmovrdgez	%g6,	%f12,	%f28
	bl,a	%icc,	loop_1716
	fpadd16	%f30,	%f20,	%f30
	array32	%i7,	%o7,	%i0
	tcs	%icc,	0x0
loop_1716:
	alignaddr	%i5,	%g1,	%o1
	fxor	%f14,	%f28,	%f4
	fbug	%fcc0,	loop_1717
	sra	%l2,	0x0D,	%l3
	move	%xcc,	%o4,	%i1
	fmovsn	%icc,	%f21,	%f30
loop_1717:
	tsubcctv	%i4,	%l5,	%l4
	umul	%g5,	0x002D,	%l6
	xor	%i2,	0x1DCE,	%g7
	or	%l0,	0x0E8B,	%o6
	call	loop_1718
	fmovsgu	%xcc,	%f16,	%f20
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x4D] %asi,	%o5
loop_1718:
	taddcctv	%o3,	0x007A,	%l1
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	std	%i6,	[%l7 + 0x78]
	movneg	%xcc,	%g3,	%i3
	fmul8sux16	%f18,	%f2,	%f24
	movvc	%icc,	%g4,	%g2
	fmovdge	%xcc,	%f15,	%f22
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf1,	%f0
	fnand	%f30,	%f30,	%f14
	tpos	%xcc,	0x5
	fand	%f10,	%f8,	%f4
	tsubcctv	%o0,	%g6,	%i7
	tne	%icc,	0x2
	fcmpeq32	%f18,	%f0,	%o7
	fexpand	%f10,	%f2
	andn	%i0,	%o2,	%g1
	fzero	%f10
	fmul8x16al	%f15,	%f15,	%f10
	fbg	%fcc2,	loop_1719
	addccc	%o1,	%l2,	%i5
	fnands	%f10,	%f21,	%f23
	addc	%o4,	0x1F55,	%i1
loop_1719:
	fmovda	%xcc,	%f10,	%f18
	addccc	%l3,	%i4,	%l4
	alignaddr	%l5,	%g5,	%i2
	ld	[%l7 + 0x48],	%f18
	edge16	%l6,	%g7,	%o6
	nop
	setx	loop_1720,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sir	0x0C6A
	sub	%o5,	%l0,	%l1
	smulcc	%o3,	0x05D9,	%g3
loop_1720:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%i3,	%g4
	andncc	%g2,	%o0,	%g6
	fabsd	%f10,	%f30
	edge32ln	%i7,	%i6,	%o7
	stbar
	addcc	%o2,	0x07EA,	%g1
	srl	%o1,	0x14,	%i0
	fnor	%f2,	%f24,	%f28
	sir	0x1F10
	set	0x6C, %i2
	lduha	[%l7 + %i2] 0x80,	%i5
	movgu	%xcc,	%o4,	%l2
	andncc	%i1,	%l3,	%i4
	fxnor	%f8,	%f14,	%f12
	fbule	%fcc3,	loop_1721
	orncc	%l4,	%g5,	%l5
	udivx	%l6,	0x1549,	%g7
	fnands	%f9,	%f8,	%f23
loop_1721:
	addc	%o6,	0x11C1,	%i2
	tvc	%xcc,	0x2
	taddcc	%l0,	%l1,	%o3
	fmovdcs	%xcc,	%f9,	%f17
	mulx	%g3,	0x19BF,	%o5
	fzeros	%f14
	sdiv	%g4,	0x1135,	%g2
	fbne	%fcc2,	loop_1722
	fmovrdlez	%o0,	%f8,	%f14
	set	0x14, %g6
	lduwa	[%l7 + %g6] 0x88,	%i3
loop_1722:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f31,	[%l7 + 0x2C] %asi
	edge16ln	%i7,	%g6,	%i6
	sub	%o2,	%g1,	%o7
	set	0x48, %g1
	lda	[%l7 + %g1] 0x11,	%f20
	sdivcc	%o1,	0x0EC1,	%i5
	lduh	[%l7 + 0x7A],	%i0
	movrne	%o4,	0x2C2,	%l2
	movpos	%xcc,	%i1,	%i4
	mulscc	%l3,	0x1AB3,	%g5
	fnands	%f12,	%f15,	%f2
	movn	%xcc,	%l5,	%l4
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x2C] %asi,	%g7
	prefetch	[%l7 + 0x70],	 0x3
	tn	%icc,	0x2
	orn	%l6,	0x0735,	%o6
	andn	%i2,	%l1,	%o3
	addcc	%l0,	0x0035,	%g3
	sub	%o5,	0x0DEE,	%g4
	fnands	%f19,	%f15,	%f22
	movge	%xcc,	%o0,	%i3
	tn	%xcc,	0x2
	udiv	%g2,	0x0E90,	%i7
	srax	%g6,	0x16,	%o2
	movvs	%icc,	%g1,	%i6
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x22] %asi,	%o1
	fmovscs	%icc,	%f27,	%f18
	smul	%i5,	0x0DEE,	%o7
	fsrc2	%f6,	%f28
	xnor	%o4,	0x09A8,	%l2
	tleu	%xcc,	0x4
	set	0x70, %i7
	stda	%i0,	[%l7 + %i7] 0x2b
	membar	#Sync
	xnor	%i4,	%l3,	%i1
	movrlz	%g5,	%l4,	%l5
	edge8n	%l6,	%o6,	%i2
	sdivcc	%l1,	0x06FA,	%o3
	addc	%g7,	%l0,	%g3
	fmul8x16al	%f12,	%f6,	%f16
	movle	%xcc,	%g4,	%o0
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x40] %asi,	%o4
	move	%icc,	%g2,	%i3
	fmovrdlz	%i7,	%f2,	%f12
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x2
	tcs	%xcc,	0x1
	set	0x40, %l6
	stda	%g6,	[%l7 + %l6] 0x81
	fmovsa	%xcc,	%f23,	%f18
	fandnot1	%f2,	%f6,	%f28
	movcc	%icc,	%g1,	%o1
	fabsd	%f10,	%f2
	movgu	%xcc,	%i6,	%i5
	te	%icc,	0x6
	tleu	%xcc,	0x1
	andn	%o7,	0x1B2F,	%o4
	set	0x20, %g4
	prefetcha	[%l7 + %g4] 0x0c,	 0x0
	brgez,a	%l2,	loop_1723
	sll	%i4,	%l3,	%g5
	movrne	%i1,	%l4,	%l5
	subc	%o6,	%l6,	%l1
loop_1723:
	edge16ln	%o3,	%i2,	%l0
	movne	%xcc,	%g3,	%g7
	set	0x5C, %o0
	sta	%f9,	[%l7 + %o0] 0x10
	set	0x18, %i4
	lduwa	[%l7 + %i4] 0x89,	%g4
	edge8l	%o0,	%o5,	%i3
	bn,a,pt	%icc,	loop_1724
	fsrc1	%f28,	%f4
	subc	%i7,	%o2,	%g2
	tcs	%xcc,	0x3
loop_1724:
	andcc	%g6,	0x0852,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f16,	%f8,	%f10
	andcc	%i6,	0x138B,	%i5
	edge8l	%o7,	%o4,	%i0
	fbul,a	%fcc3,	loop_1725
	fnot2	%f2,	%f28
	xnorcc	%o1,	%i4,	%l3
	fbug,a	%fcc1,	loop_1726
loop_1725:
	array16	%l2,	%g5,	%i1
	bge,a	loop_1727
	fmuld8sux16	%f20,	%f8,	%f18
loop_1726:
	edge16ln	%l5,	%o6,	%l4
	srax	%l1,	0x1A,	%o3
loop_1727:
	fcmps	%fcc1,	%f6,	%f25
	fmovsle	%xcc,	%f26,	%f8
	sdiv	%l6,	0x1A31,	%l0
	fmovdleu	%xcc,	%f14,	%f21
	tl	%icc,	0x0
	movre	%g3,	%i2,	%g7
	nop
	setx	loop_1728,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	set	0x70, %g7
	sth	%o0,	[%l7 + %g7]
	move	%xcc,	%g4,	%o5
	sdivcc	%i7,	0x0F3E,	%i3
loop_1728:
	movcc	%icc,	%o2,	%g6
	lduh	[%l7 + 0x4C],	%g2
	sdivx	%g1,	0x0B67,	%i5
	set	0x40, %o3
	stxa	%i6,	[%l7 + %o3] 0x2f
	membar	#Sync
	tpos	%xcc,	0x6
	xnorcc	%o4,	%i0,	%o7
	fmovdle	%xcc,	%f15,	%f16
	tgu	%xcc,	0x6
	movl	%icc,	%i4,	%o1
	movg	%xcc,	%l2,	%g5
	fmovrsne	%l3,	%f6,	%f27
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%l5
	fbul	%fcc0,	loop_1729
	movle	%xcc,	%o6,	%l4
	movn	%xcc,	%i1,	%l1
	srlx	%l6,	0x1F,	%o3
loop_1729:
	tvc	%xcc,	0x0
	xorcc	%g3,	%i2,	%g7
	fmovrdlz	%l0,	%f10,	%f28
	fzeros	%f24
	edge8ln	%o0,	%o5,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i7,	0x0A87,	%i3
	fmovsvc	%xcc,	%f0,	%f30
	umulcc	%o2,	%g6,	%g2
	edge8	%g1,	%i6,	%o4
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x61] %asi,	%i0
	sllx	%o7,	0x06,	%i5
	sir	0x13CB
	pdist	%f2,	%f30,	%f16
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x47] %asi,	%o1
	edge32ln	%l2,	%i4,	%l3
	xnor	%l5,	0x11CB,	%g5
	sdivcc	%o6,	0x0846,	%i1
	nop
	set	0x78, %i6
	ldsh	[%l7 + %i6],	%l4
	movl	%icc,	%l1,	%l6
	fmovsvc	%icc,	%f17,	%f29
	edge32ln	%g3,	%o3,	%g7
	movrlez	%i2,	0x194,	%o0
	tsubcctv	%l0,	0x083D,	%o5
	movrlez	%i7,	0x270,	%i3
	edge16n	%g4,	%o2,	%g6
	bgu,a	%xcc,	loop_1730
	fpadd32s	%f27,	%f8,	%f12
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x81,	%f0
loop_1730:
	movl	%icc,	%g1,	%i6
	std	%f14,	[%l7 + 0x20]
	brz,a	%o4,	loop_1731
	tgu	%icc,	0x1
	movrgez	%i0,	0x100,	%o7
	brgz,a	%g2,	loop_1732
loop_1731:
	bne	loop_1733
	movn	%icc,	%o1,	%i5
	tg	%icc,	0x0
loop_1732:
	xor	%l2,	0x0019,	%i4
loop_1733:
	nop
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] %asi,	%l5,	%g5
	movrne	%o6,	%l3,	%l4
	fble	%fcc3,	loop_1734
	andn	%l1,	0x1722,	%l6
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf8,	%f16
loop_1734:
	bpos,pt	%xcc,	loop_1735
	mulscc	%i1,	0x1547,	%g3
	array8	%o3,	%i2,	%g7
	tcs	%icc,	0x6
loop_1735:
	fmovscs	%icc,	%f13,	%f24
	move	%xcc,	%o0,	%o5
	sra	%l0,	0x0D,	%i3
	fmovda	%icc,	%f11,	%f29
	fpsub32s	%f20,	%f16,	%f7
	srax	%g4,	0x13,	%i7
	array8	%g6,	%g1,	%o2
	movcc	%xcc,	%o4,	%i0
	fbul,a	%fcc2,	loop_1736
	bvc,a	%xcc,	loop_1737
	taddcctv	%i6,	%g2,	%o7
	movre	%o1,	0x371,	%i5
loop_1736:
	tcs	%xcc,	0x2
loop_1737:
	sdiv	%l2,	0x1E1D,	%i4
	subcc	%l5,	0x1094,	%g5
	stb	%l3,	[%l7 + 0x10]
	wr	%g0,	0x80,	%asi
	stba	%l4,	[%l7 + 0x12] %asi
	fba,a	%fcc0,	loop_1738
	fbug	%fcc0,	loop_1739
	sethi	0x0CBE,	%l1
	edge16ln	%o6,	%i1,	%l6
loop_1738:
	movle	%xcc,	%o3,	%i2
loop_1739:
	tcs	%icc,	0x3
	srax	%g3,	%o0,	%o5
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x70] %asi,	%l0
	movrgez	%g7,	%g4,	%i7
	orncc	%i3,	0x109D,	%g1
	fornot2	%f0,	%f16,	%f2
	sub	%g6,	%o2,	%i0
	array16	%o4,	%g2,	%o7
	fornot2	%f28,	%f16,	%f10
	sub	%i6,	%o1,	%l2
	subc	%i4,	0x1C70,	%i5
	ldub	[%l7 + 0x53],	%g5
	tne	%xcc,	0x6
	orncc	%l5,	0x1EA0,	%l4
	edge32l	%l3,	%l1,	%o6
	tsubcc	%l6,	0x0AA9,	%i1
	tvc	%xcc,	0x3
	subcc	%i2,	0x1829,	%o3
	fmovsleu	%xcc,	%f2,	%f15
	fpackfix	%f12,	%f19
	ldsw	[%l7 + 0x58],	%o0
	tge	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%o5,	%g3
	fmovdl	%icc,	%f0,	%f24
	sir	0x08B1
	fsrc1	%f16,	%f24
	fcmpeq16	%f30,	%f10,	%g7
	movpos	%icc,	%g4,	%i7
	bvc	%xcc,	loop_1740
	tcc	%xcc,	0x6
	fcmpne16	%f4,	%f20,	%i3
	ldx	[%l7 + 0x70],	%l0
loop_1740:
	for	%f20,	%f30,	%f18
	orn	%g1,	%o2,	%i0
	movge	%xcc,	%g6,	%o4
	tvs	%icc,	0x5
	fmovrde	%o7,	%f2,	%f10
	andncc	%g2,	%i6,	%l2
	sdivcc	%o1,	0x060C,	%i5
	tsubcc	%i4,	%l5,	%l4
	orn	%l3,	%g5,	%o6
	fmovsvs	%icc,	%f25,	%f8
	fcmpne16	%f30,	%f12,	%l6
	edge16ln	%i1,	%i2,	%l1
	orncc	%o3,	0x08F7,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g3,	0x17E7,	%o0
	bpos,a	loop_1741
	mulx	%g7,	%i7,	%i3
	srax	%g4,	%g1,	%l0
	srax	%i0,	0x0F,	%g6
loop_1741:
	fmovsvc	%xcc,	%f1,	%f19
	ba,a,pn	%icc,	loop_1742
	fpmerge	%f16,	%f7,	%f28
	bcs,a,pt	%xcc,	loop_1743
	addccc	%o2,	0x0749,	%o7
loop_1742:
	stb	%g2,	[%l7 + 0x38]
	fcmple32	%f6,	%f0,	%i6
loop_1743:
	orcc	%l2,	%o4,	%i5
	edge32l	%o1,	%l5,	%l4
	fbo	%fcc1,	loop_1744
	fpadd32	%f8,	%f4,	%f14
	tge	%xcc,	0x0
	fnot2	%f14,	%f4
loop_1744:
	edge16n	%l3,	%i4,	%g5
	fornot1s	%f7,	%f19,	%f11
	tcs	%icc,	0x6
	smul	%l6,	0x04C1,	%i1
	brgz	%o6,	loop_1745
	orcc	%l1,	0x0AEB,	%o3
	edge32ln	%i2,	%o5,	%g3
	movn	%xcc,	%g7,	%o0
loop_1745:
	movre	%i7,	0x039,	%i3
	fpsub32s	%f22,	%f26,	%f7
	sth	%g4,	[%l7 + 0x3A]
	bshuffle	%f4,	%f30,	%f10
	andcc	%l0,	%i0,	%g1
	movcc	%xcc,	%g6,	%o7
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%g2
	be,a	loop_1746
	fbge	%fcc3,	loop_1747
	edge32	%o2,	%i6,	%o4
	sub	%i5,	0x17B1,	%l2
loop_1746:
	fbl	%fcc3,	loop_1748
loop_1747:
	udivcc	%l5,	0x1133,	%o1
	tvs	%icc,	0x1
	addcc	%l3,	%l4,	%g5
loop_1748:
	xor	%i4,	0x10BB,	%i1
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l6,	%l1
	movrlez	%o6,	0x090,	%i2
	orn	%o5,	%g3,	%o3
	array8	%g7,	%i7,	%i3
	for	%f0,	%f10,	%f18
	movrne	%o0,	0x39F,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f22,	%f0
	movle	%icc,	%l0,	%i0
	fnor	%f16,	%f14,	%f0
	tgu	%xcc,	0x5
	ldsh	[%l7 + 0x36],	%g1
	udivcc	%o7,	0x1493,	%g6
	be	%xcc,	loop_1749
	add	%g2,	0x0008,	%o2
	xorcc	%o4,	%i6,	%l2
	tsubcctv	%l5,	%o1,	%l3
loop_1749:
	edge8	%l4,	%i5,	%i4
	tle	%icc,	0x5
	xorcc	%g5,	0x1E5F,	%i1
	fbuge	%fcc2,	loop_1750
	edge32ln	%l6,	%o6,	%i2
	tgu	%icc,	0x6
	xorcc	%o5,	0x00E1,	%l1
loop_1750:
	andn	%g3,	%o3,	%i7
	tgu	%icc,	0x5
	movcs	%icc,	%i3,	%o0
	fblg,a	%fcc2,	loop_1751
	edge32	%g4,	%l0,	%g7
	move	%xcc,	%g1,	%o7
	fbuge,a	%fcc3,	loop_1752
loop_1751:
	brlz,a	%g6,	loop_1753
	add	%i0,	0x12A7,	%o2
	std	%o4,	[%l7 + 0x10]
loop_1752:
	mulscc	%g2,	0x1CB3,	%i6
loop_1753:
	subccc	%l5,	%l2,	%o1
	umulcc	%l3,	0x0734,	%i5
	nop
	set	0x4C, %g3
	ldstub	[%l7 + %g3],	%l4
	fmul8x16	%f28,	%f26,	%f2
	edge16n	%g5,	%i1,	%i4
	movleu	%xcc,	%o6,	%i2
	fones	%f29
	tgu	%xcc,	0x1
	andn	%l6,	0x1A53,	%l1
	umulcc	%o5,	0x1E0B,	%o3
	ldsh	[%l7 + 0x54],	%g3
	xnorcc	%i3,	0x0673,	%o0
	sdivcc	%i7,	0x19F0,	%g4
	movcc	%xcc,	%l0,	%g1
	add	%o7,	0x1995,	%g7
	ba	%icc,	loop_1754
	ba,a	loop_1755
	bl	loop_1756
	xnorcc	%i0,	%g6,	%o4
loop_1754:
	movcs	%icc,	%g2,	%o2
loop_1755:
	movl	%xcc,	%l5,	%i6
loop_1756:
	tge	%icc,	0x2
	movg	%icc,	%l2,	%l3
	bg,a,pt	%xcc,	loop_1757
	bne	loop_1758
	bgu,a	%xcc,	loop_1759
	sdivx	%o1,	0x0A68,	%l4
loop_1757:
	movgu	%icc,	%g5,	%i1
loop_1758:
	addccc	%i5,	0x026C,	%i4
loop_1759:
	swap	[%l7 + 0x50],	%i2
	edge8n	%l6,	%l1,	%o6
	tpos	%icc,	0x1
	fmul8ulx16	%f16,	%f20,	%f28
	movvs	%xcc,	%o5,	%g3
	edge32ln	%o3,	%i3,	%o0
	bg	loop_1760
	std	%g4,	[%l7 + 0x68]
	fcmple32	%f16,	%f26,	%l0
	fpack32	%f24,	%f24,	%f24
loop_1760:
	array32	%i7,	%o7,	%g7
	xor	%i0,	0x1ADB,	%g1
	movn	%icc,	%g6,	%o4
	fmovrsne	%g2,	%f18,	%f18
	edge32n	%l5,	%o2,	%l2
	fmovda	%xcc,	%f2,	%f1
	brgz	%i6,	loop_1761
	brgez	%o1,	loop_1762
	mova	%xcc,	%l3,	%l4
	sllx	%i1,	%i5,	%i4
loop_1761:
	swap	[%l7 + 0x58],	%i2
loop_1762:
	fmovdvs	%xcc,	%f10,	%f30
	tn	%xcc,	0x6
	addcc	%g5,	%l6,	%l1
	siam	0x3
	tvs	%icc,	0x1
	fmul8ulx16	%f28,	%f24,	%f6
	bn	loop_1763
	tle	%icc,	0x7
	taddcctv	%o5,	%o6,	%g3
	movne	%icc,	%o3,	%o0
loop_1763:
	edge32ln	%i3,	%g4,	%l0
	tcc	%xcc,	0x0
	sra	%o7,	0x10,	%g7
	edge16	%i0,	%i7,	%g6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g1,	%g2
	sdiv	%l5,	0x0C39,	%o4
	xnorcc	%o2,	%l2,	%i6
	edge16n	%l3,	%l4,	%o1
	fcmps	%fcc3,	%f23,	%f10
	movrgz	%i5,	%i4,	%i2
	lduw	[%l7 + 0x70],	%g5
	movcc	%icc,	%i1,	%l1
	brlez	%l6,	loop_1764
	mulx	%o5,	0x1F53,	%o6
	orcc	%o3,	0x0FAA,	%g3
	taddcctv	%i3,	%g4,	%l0
loop_1764:
	nop
	set	0x7C, %l1
	ldstuba	[%l7 + %l1] 0x89,	%o0
	fbg,a	%fcc0,	loop_1765
	sll	%o7,	0x1B,	%g7
	bvc,a,pt	%icc,	loop_1766
	bvc	loop_1767
loop_1765:
	movl	%icc,	%i0,	%g6
	subcc	%i7,	%g1,	%g2
loop_1766:
	nop
	set	0x68, %l3
	lduw	[%l7 + %l3],	%o4
loop_1767:
	brgz	%l5,	loop_1768
	tle	%icc,	0x5
	fcmpeq16	%f20,	%f0,	%o2
	bvc,a	loop_1769
loop_1768:
	tne	%icc,	0x0
	sth	%i6,	[%l7 + 0x4E]
	movl	%icc,	%l3,	%l2
loop_1769:
	andn	%o1,	0x1348,	%i5
	fpsub32	%f18,	%f0,	%f12
	movvc	%xcc,	%l4,	%i2
	sethi	0x03B1,	%g5
	edge8n	%i4,	%i1,	%l1
	edge8l	%l6,	%o5,	%o6
	addccc	%g3,	0x1F20,	%i3
	fmovsleu	%icc,	%f27,	%f24
	std	%f2,	[%l7 + 0x08]
	umulcc	%g4,	0x138C,	%l0
	andcc	%o0,	%o3,	%g7
	or	%i0,	0x0A85,	%o7
	tne	%icc,	0x0
	subcc	%g6,	0x0A4F,	%i7
	alignaddr	%g2,	%o4,	%l5
	ld	[%l7 + 0x38],	%f21
	movl	%icc,	%g1,	%i6
	fmovdg	%icc,	%f5,	%f30
	nop
	set	0x4A, %i1
	ldstub	[%l7 + %i1],	%l3
	fsrc2	%f26,	%f26
	fmovsa	%icc,	%f13,	%f3
	movre	%o2,	0x036,	%o1
	tsubcctv	%i5,	0x146D,	%l2
	udivcc	%l4,	0x13AA,	%g5
	fmovsle	%icc,	%f9,	%f17
	edge32	%i2,	%i4,	%l1
	fpsub16s	%f8,	%f6,	%f13
	fcmple16	%f0,	%f24,	%i1
	edge16ln	%o5,	%l6,	%o6
	fmovsa	%icc,	%f6,	%f28
	fmovdpos	%icc,	%f5,	%f3
	edge32ln	%i3,	%g4,	%g3
	ta	%xcc,	0x5
	or	%l0,	%o0,	%o3
	fandnot2s	%f3,	%f16,	%f26
	fpadd32s	%f17,	%f0,	%f26
	udivcc	%i0,	0x1C73,	%o7
	fandnot1	%f18,	%f10,	%f0
	array16	%g6,	%i7,	%g7
	fmovdcs	%xcc,	%f13,	%f17
	ld	[%l7 + 0x50],	%f25
	orcc	%g2,	%l5,	%g1
	mulscc	%i6,	%o4,	%l3
	alignaddr	%o1,	%o2,	%i5
	set	0x08, %o7
	lduwa	[%l7 + %o7] 0x81,	%l4
	bl	loop_1770
	fcmpne16	%f28,	%f6,	%g5
	ta	%icc,	0x1
	taddcctv	%l2,	0x1FCF,	%i4
loop_1770:
	xnor	%i2,	0x06B3,	%l1
	fmovsne	%xcc,	%f13,	%f29
	tsubcc	%o5,	0x0E8F,	%l6
	edge32n	%o6,	%i1,	%i3
	movge	%xcc,	%g4,	%l0
	faligndata	%f10,	%f24,	%f20
	for	%f22,	%f28,	%f24
	fmovd	%f14,	%f30
	tvc	%xcc,	0x5
	brlez	%o0,	loop_1771
	fpsub32s	%f24,	%f15,	%f5
	sll	%o3,	%g3,	%o7
	movcc	%xcc,	%g6,	%i7
loop_1771:
	fcmpgt32	%f0,	%f10,	%g7
	edge8ln	%g2,	%i0,	%g1
	addc	%i6,	0x113B,	%l5
	nop
	setx loop_1772, %l0, %l1
	jmpl %l1, %o4
	addc	%l3,	0x0CBD,	%o1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x7A] %asi,	%i5
loop_1772:
	bneg	%xcc,	loop_1773
	edge8n	%o2,	%g5,	%l2
	std	%f16,	[%l7 + 0x30]
	subccc	%i4,	%l4,	%l1
loop_1773:
	udiv	%i2,	0x0B81,	%l6
	orcc	%o5,	0x0DAC,	%i1
	bcs,a,pn	%xcc,	loop_1774
	edge8	%o6,	%g4,	%i3
	movpos	%icc,	%o0,	%o3
	fmovspos	%icc,	%f7,	%f19
loop_1774:
	movne	%icc,	%g3,	%o7
	fmovscs	%icc,	%f20,	%f23
	fzeros	%f11
	fcmpes	%fcc0,	%f16,	%f5
	sdivcc	%g6,	0x0225,	%l0
	fmovsgu	%icc,	%f26,	%f10
	bg	loop_1775
	fbule,a	%fcc3,	loop_1776
	add	%g7,	%g2,	%i0
	tcs	%xcc,	0x6
loop_1775:
	ldub	[%l7 + 0x54],	%i7
loop_1776:
	edge32l	%g1,	%i6,	%o4
	alignaddr	%l5,	%l3,	%o1
	tcs	%icc,	0x4
	movvs	%icc,	%i5,	%g5
	movre	%l2,	%i4,	%l4
	fmovscc	%icc,	%f27,	%f25
	fnors	%f28,	%f26,	%f0
	movg	%xcc,	%l1,	%o2
	srlx	%i2,	0x13,	%o5
	tneg	%xcc,	0x2
	set	0x58, %l5
	stxa	%i1,	[%l7 + %l5] 0x10
	edge32ln	%l6,	%o6,	%i3
	fmovrsgz	%g4,	%f26,	%f30
	movge	%icc,	%o3,	%o0
	movgu	%xcc,	%g3,	%o7
	tne	%xcc,	0x2
	tneg	%xcc,	0x4
	tcs	%xcc,	0x0
	sub	%l0,	%g7,	%g2
	array32	%g6,	%i0,	%i7
	edge8ln	%i6,	%g1,	%l5
	fmovrde	%l3,	%f14,	%f14
	movge	%xcc,	%o4,	%o1
	orncc	%i5,	0x1473,	%g5
	bn,pt	%icc,	loop_1777
	fbe,a	%fcc0,	loop_1778
	edge32l	%l2,	%i4,	%l4
	movrgez	%l1,	%i2,	%o2
loop_1777:
	movne	%xcc,	%i1,	%l6
loop_1778:
	brlz	%o5,	loop_1779
	fcmpeq32	%f6,	%f0,	%i3
	brz,a	%o6,	loop_1780
	movl	%xcc,	%g4,	%o0
loop_1779:
	bvs,a,pn	%xcc,	loop_1781
	fmovsn	%icc,	%f9,	%f23
loop_1780:
	tne	%icc,	0x7
	edge32ln	%o3,	%g3,	%l0
loop_1781:
	fbg,a	%fcc3,	loop_1782
	bleu,a	%icc,	loop_1783
	srax	%g7,	%g2,	%o7
	fornot2s	%f15,	%f25,	%f10
loop_1782:
	edge32l	%g6,	%i0,	%i6
loop_1783:
	xnor	%g1,	%i7,	%l5
	xnorcc	%l3,	%o4,	%o1
	and	%i5,	0x1F3E,	%g5
	fbg,a	%fcc1,	loop_1784
	xnorcc	%i4,	%l4,	%l2
	stbar
	fpsub32	%f6,	%f4,	%f28
loop_1784:
	fandnot2	%f26,	%f24,	%f4
	brgz	%l1,	loop_1785
	movge	%xcc,	%o2,	%i2
	be,pt	%icc,	loop_1786
	xnorcc	%l6,	0x02BC,	%o5
loop_1785:
	movvs	%icc,	%i3,	%o6
	movle	%xcc,	%g4,	%i1
loop_1786:
	fnot1s	%f29,	%f22
	fbge,a	%fcc3,	loop_1787
	sethi	0x0471,	%o3
	flush	%l7 + 0x08
	movre	%o0,	0x246,	%l0
loop_1787:
	ldx	[%l7 + 0x18],	%g3
	orn	%g7,	%g2,	%g6
	set	0x60, %i3
	lduha	[%l7 + %i3] 0x14,	%o7
	smulcc	%i0,	%g1,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc0,	loop_1788
	membar	0x42
	sdiv	%l5,	0x1201,	%l3
	array32	%o4,	%o1,	%i5
loop_1788:
	fpack32	%f0,	%f8,	%f8
	te	%icc,	0x3
	fsrc2s	%f0,	%f28
	fcmpgt32	%f24,	%f18,	%g5
	set	0x2E, %l2
	ldstuba	[%l7 + %l2] 0x80,	%i4
	tgu	%icc,	0x6
	edge16	%l4,	%i6,	%l2
	fble	%fcc3,	loop_1789
	popc	0x1BF5,	%l1
	sdiv	%o2,	0x02DE,	%l6
	tgu	%xcc,	0x1
loop_1789:
	xorcc	%o5,	%i2,	%i3
	fmovdpos	%xcc,	%f31,	%f18
	fbge	%fcc1,	loop_1790
	movneg	%xcc,	%o6,	%g4
	movcs	%icc,	%o3,	%o0
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x70] %asi,	%l0
loop_1790:
	fxor	%f0,	%f18,	%f26
	fzero	%f20
	popc	0x1299,	%g3
	movcs	%xcc,	%i1,	%g7
	edge32ln	%g6,	%o7,	%g2
	tgu	%icc,	0x1
	movg	%icc,	%g1,	%i0
	bneg,a	%xcc,	loop_1791
	fmovdneg	%icc,	%f31,	%f6
	set	0x26, %g2
	ldsba	[%l7 + %g2] 0x15,	%l5
loop_1791:
	tneg	%icc,	0x5
	edge8l	%i7,	%o4,	%o1
	nop
	set	0x4E, %i5
	stb	%i5,	[%l7 + %i5]
	brgz	%g5,	loop_1792
	stbar
	andcc	%i4,	0x10BE,	%l4
	movleu	%icc,	%l3,	%i6
loop_1792:
	tvc	%xcc,	0x5
	fpackfix	%f26,	%f8
	nop
	setx	loop_1793,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andcc	%l2,	0x100F,	%o2
	fcmpd	%fcc2,	%f20,	%f10
	mova	%icc,	%l6,	%o5
loop_1793:
	movgu	%icc,	%i2,	%l1
	taddcc	%o6,	0x11D5,	%g4
	movrgz	%o3,	0x045,	%i3
	udivcc	%o0,	0x06D1,	%l0
	edge16n	%i1,	%g3,	%g6
	fmovsle	%icc,	%f4,	%f12
	fpadd16s	%f1,	%f24,	%f26
	movle	%xcc,	%g7,	%o7
	std	%g0,	[%l7 + 0x38]
	array16	%i0,	%g2,	%i7
	tleu	%xcc,	0x2
	fmovdcc	%xcc,	%f10,	%f21
	fnor	%f26,	%f16,	%f24
	andcc	%o4,	0x0391,	%l5
	fnot1	%f26,	%f4
	fpack32	%f16,	%f4,	%f28
	flush	%l7 + 0x20
	bge	loop_1794
	ldsw	[%l7 + 0x48],	%o1
	edge16ln	%i5,	%i4,	%l4
	fba,a	%fcc1,	loop_1795
loop_1794:
	udiv	%g5,	0x053F,	%i6
	tge	%xcc,	0x4
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x3
loop_1795:
	fand	%f10,	%f18,	%f2
	movge	%icc,	%o2,	%l6
	edge32ln	%l3,	%o5,	%l1
	bleu,a,pt	%icc,	loop_1796
	movle	%xcc,	%i2,	%g4
	andncc	%o6,	%o3,	%o0
	edge16l	%i3,	%i1,	%g3
loop_1796:
	bge,a	%icc,	loop_1797
	fnand	%f6,	%f12,	%f14
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x74] %asi,	%l0
loop_1797:
	nop
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x28] %asi,	%g6
	array8	%g7,	%g1,	%i0
	fmuld8sux16	%f8,	%f18,	%f4
	ldsb	[%l7 + 0x75],	%o7
	movvc	%icc,	%i7,	%o4
	tsubcctv	%g2,	%l5,	%o1
	fxnors	%f4,	%f0,	%f17
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%i5
	movvc	%icc,	%l4,	%i4
	fmovrse	%g5,	%f13,	%f1
	bpos,a	%xcc,	loop_1798
	fmovdle	%xcc,	%f6,	%f6
	edge16	%l2,	%i6,	%o2
	tsubcc	%l6,	%o5,	%l3
loop_1798:
	fmovdg	%icc,	%f11,	%f6
	andncc	%l1,	%i2,	%g4
	tsubcctv	%o3,	0x10C5,	%o0
	bcc,a	loop_1799
	array8	%i3,	%i1,	%o6
	movcc	%xcc,	%g3,	%l0
	ldd	[%l7 + 0x50],	%g6
loop_1799:
	xnor	%g1,	0x1EB6,	%i0
	mulx	%g7,	%i7,	%o4
	movle	%icc,	%g2,	%o7
	movvs	%xcc,	%o1,	%l5
	subcc	%l4,	%i4,	%i5
	fmovdl	%xcc,	%f22,	%f4
	ld	[%l7 + 0x38],	%f9
	movvc	%xcc,	%l2,	%i6
	fornot2s	%f16,	%f4,	%f9
	tleu	%icc,	0x0
	sir	0x025F
	fsrc1	%f6,	%f12
	lduh	[%l7 + 0x46],	%o2
	fnot1	%f12,	%f20
	fzeros	%f5
	fbuge	%fcc1,	loop_1800
	add	%l6,	%o5,	%g5
	fbue	%fcc2,	loop_1801
	fbne	%fcc2,	loop_1802
loop_1800:
	movvc	%xcc,	%l3,	%i2
	srax	%l1,	%o3,	%o0
loop_1801:
	tsubcctv	%g4,	0x0E84,	%i3
loop_1802:
	swap	[%l7 + 0x50],	%i1
	sra	%o6,	0x14,	%l0
	edge8n	%g3,	%g6,	%i0
	fands	%f15,	%f27,	%f3
	fbul,a	%fcc0,	loop_1803
	fcmpne32	%f18,	%f22,	%g7
	tl	%xcc,	0x6
	tge	%xcc,	0x6
loop_1803:
	brlz	%i7,	loop_1804
	sdiv	%g1,	0x046E,	%o4
	membar	0x47
	movle	%xcc,	%o7,	%o1
loop_1804:
	sll	%g2,	0x05,	%l4
	xor	%i4,	%l5,	%i5
	tne	%icc,	0x4
	smul	%i6,	%o2,	%l6
	sdivx	%l2,	0x1649,	%o5
	tne	%xcc,	0x1
	wr	%g0,	0x89,	%asi
	stda	%l2,	[%l7 + 0x38] %asi
	fnot1s	%f9,	%f21
	fcmpne16	%f10,	%f18,	%i2
	edge16n	%g5,	%l1,	%o0
	fnot1	%f16,	%f30
	fmul8x16al	%f27,	%f12,	%f18
	movrlz	%g4,	%i3,	%o3
	nop
	set	0x68, %o6
	std	%o6,	[%l7 + %o6]
	swap	[%l7 + 0x18],	%l0
	srlx	%g3,	0x1B,	%g6
	movvc	%icc,	%i1,	%g7
	bneg,pt	%icc,	loop_1805
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc0,	loop_1806
	ldsw	[%l7 + 0x2C],	%i7
loop_1805:
	fbn	%fcc0,	loop_1807
	flush	%l7 + 0x64
loop_1806:
	fcmpd	%fcc1,	%f6,	%f12
	te	%xcc,	0x3
loop_1807:
	mulscc	%i0,	%g1,	%o7
	or	%o1,	0x0424,	%g2
	fmovda	%xcc,	%f28,	%f18
	nop
	setx	loop_1808,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvs	%xcc,	%o4,	%l4
	fmul8ulx16	%f4,	%f30,	%f22
	smulcc	%i4,	%i5,	%l5
loop_1808:
	subcc	%i6,	0x1D25,	%l6
	fmovs	%f22,	%f31
	umulcc	%l2,	0x1F17,	%o2
	call	loop_1809
	edge32l	%l3,	%o5,	%g5
	edge16	%i2,	%o0,	%g4
	fmovsa	%xcc,	%f6,	%f29
loop_1809:
	tne	%xcc,	0x3
	edge16ln	%i3,	%l1,	%o3
	stbar
	mova	%xcc,	%o6,	%g3
	umul	%l0,	0x0794,	%g6
	tcs	%icc,	0x0
	ldsb	[%l7 + 0x64],	%g7
	sdivx	%i1,	0x0907,	%i0
	umulcc	%g1,	0x0A86,	%i7
	fbe	%fcc2,	loop_1810
	edge32	%o7,	%g2,	%o4
	set	0x5C, %o4
	lduwa	[%l7 + %o4] 0x14,	%o1
loop_1810:
	movl	%xcc,	%l4,	%i5
	sll	%l5,	%i4,	%i6
	fmuld8sux16	%f27,	%f29,	%f6
	bvs,a	loop_1811
	fba,a	%fcc1,	loop_1812
	fmovda	%icc,	%f11,	%f20
	brgz,a	%l2,	loop_1813
loop_1811:
	edge8	%o2,	%l3,	%o5
loop_1812:
	movrlez	%g5,	%l6,	%i2
	taddcctv	%g4,	0x0464,	%o0
loop_1813:
	movrlez	%i3,	%l1,	%o3
	edge32n	%o6,	%l0,	%g6
	movne	%xcc,	%g7,	%g3
	sub	%i0,	%i1,	%g1
	nop
	set	0x4C, %g5
	stb	%i7,	[%l7 + %g5]
	pdist	%f2,	%f16,	%f16
	tpos	%xcc,	0x6
	fpadd16s	%f25,	%f13,	%f9
	movvs	%xcc,	%g2,	%o4
	umulcc	%o1,	0x16AD,	%l4
	fsrc2	%f8,	%f28
	tle	%xcc,	0x5
	tcc	%xcc,	0x7
	smul	%i5,	%o7,	%l5
	fxors	%f8,	%f16,	%f28
	xor	%i4,	%l2,	%i6
	popc	0x06FD,	%l3
	edge32ln	%o5,	%o2,	%l6
	lduh	[%l7 + 0x6E],	%i2
	fmovsg	%icc,	%f26,	%f11
	fnegd	%f18,	%f18
	sll	%g5,	0x1F,	%o0
	nop
	set	0x0E, %i0
	ldsh	[%l7 + %i0],	%g4
	fbl,a	%fcc1,	loop_1814
	fmovdle	%icc,	%f4,	%f31
	fbge,a	%fcc2,	loop_1815
	sir	0x06E9
loop_1814:
	bpos	loop_1816
	subcc	%i3,	%l1,	%o3
loop_1815:
	fxor	%f24,	%f24,	%f24
	array32	%l0,	%o6,	%g7
loop_1816:
	movg	%xcc,	%g3,	%i0
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%i0
	fmovdge	%icc,	%f18,	%f24
	fpsub32	%f8,	%f8,	%f0
	srax	%g1,	0x0C,	%g6
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x09] %asi,	%g2
	fmovrslez	%i7,	%f29,	%f25
	stbar
	fmovrdlz	%o4,	%f4,	%f6
	array8	%o1,	%i5,	%o7
	movne	%icc,	%l4,	%i4
	wr	%g0,	0xea,	%asi
	stda	%l4,	[%l7 + 0x60] %asi
	membar	#Sync
	fble	%fcc2,	loop_1817
	andcc	%i6,	%l3,	%l2
	fornot2s	%f27,	%f18,	%f29
	fbue,a	%fcc0,	loop_1818
loop_1817:
	sdivx	%o2,	0x0DAD,	%l6
	tpos	%xcc,	0x1
	sethi	0x005B,	%o5
loop_1818:
	fbge	%fcc0,	loop_1819
	smulcc	%g5,	0x18B1,	%o0
	srl	%i2,	%i3,	%l1
	brlz	%g4,	loop_1820
loop_1819:
	sethi	0x01EC,	%o3
	bpos	loop_1821
	membar	0x60
loop_1820:
	edge32n	%o6,	%g7,	%l0
	fcmped	%fcc1,	%f22,	%f16
loop_1821:
	orcc	%g3,	0x0479,	%i0
	edge32n	%g1,	%i1,	%g6
	movrlz	%g2,	0x255,	%o4
	fmovdg	%icc,	%f29,	%f6
	fbu	%fcc2,	loop_1822
	movvc	%icc,	%o1,	%i7
	brz	%o7,	loop_1823
	bneg	loop_1824
loop_1822:
	udivcc	%i5,	0x1A48,	%i4
	ldx	[%l7 + 0x58],	%l5
loop_1823:
	movrgz	%i6,	0x201,	%l3
loop_1824:
	movl	%xcc,	%l2,	%o2
	membar	0x1A
	fbul,a	%fcc3,	loop_1825
	edge16ln	%l6,	%l4,	%o5
	tsubcctv	%g5,	0x1D78,	%i2
	tl	%icc,	0x4
loop_1825:
	movleu	%icc,	%o0,	%l1
	tne	%xcc,	0x5
	orncc	%g4,	0x0AF6,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz,a	%o6,	loop_1826
	edge8ln	%g7,	%i3,	%l0
	movvs	%xcc,	%i0,	%g3
	add	%i1,	0x115B,	%g1
loop_1826:
	fbe,a	%fcc3,	loop_1827
	fblg,a	%fcc3,	loop_1828
	bne,a,pt	%xcc,	loop_1829
	fandnot1	%f22,	%f14,	%f26
loop_1827:
	add	%g2,	0x1D49,	%o4
loop_1828:
	fnands	%f11,	%f17,	%f0
loop_1829:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%g6,	%o1
	set	0x10, %l0
	stxa	%o7,	[%l7 + %l0] 0x2a
	membar	#Sync
	addcc	%i7,	%i5,	%i4
	fpmerge	%f29,	%f31,	%f10
	te	%icc,	0x3
	edge8ln	%i6,	%l3,	%l5
	array32	%l2,	%l6,	%o2
	fbu	%fcc3,	loop_1830
	fxnor	%f4,	%f30,	%f22
	movvs	%icc,	%o5,	%l4
	fandnot1s	%f16,	%f21,	%f22
loop_1830:
	subccc	%i2,	%o0,	%g5
	xnorcc	%g4,	%o3,	%l1
	array8	%g7,	%o6,	%i3
	fble,a	%fcc0,	loop_1831
	fcmpgt32	%f20,	%f30,	%i0
	tcc	%xcc,	0x6
	edge32	%l0,	%g3,	%i1
loop_1831:
	nop
	set	0x78, %i2
	std	%f0,	[%l7 + %i2]
	prefetch	[%l7 + 0x38],	 0x2
	fsrc1	%f2,	%f0
	tsubcc	%g2,	0x0393,	%g1
	movneg	%xcc,	%o4,	%g6
	mulx	%o1,	0x1997,	%i7
	movcc	%icc,	%o7,	%i5
	fmovsleu	%xcc,	%f19,	%f31
	fcmpeq16	%f28,	%f14,	%i6
	movrgz	%l3,	%l5,	%i4
	tcs	%xcc,	0x2
	mulscc	%l6,	%l2,	%o5
	tgu	%xcc,	0x5
	tge	%icc,	0x5
	mulx	%o2,	%l4,	%o0
	fmovdne	%icc,	%f25,	%f26
	tl	%xcc,	0x6
	movcs	%icc,	%i2,	%g4
	ldub	[%l7 + 0x2D],	%g5
	orncc	%l1,	%g7,	%o6
	bcc,pn	%icc,	loop_1832
	fornot2s	%f3,	%f26,	%f7
	fabss	%f21,	%f26
	tvc	%xcc,	0x7
loop_1832:
	tl	%xcc,	0x4
	tcs	%icc,	0x7
	set	0x16, %o5
	lduha	[%l7 + %o5] 0x04,	%i3
	and	%i0,	%o3,	%g3
	tvs	%xcc,	0x4
	alignaddr	%l0,	%g2,	%i1
	movg	%icc,	%g1,	%o4
	andcc	%g6,	%i7,	%o1
	tsubcc	%i5,	0x1753,	%o7
	set	0x28, %g6
	lda	[%l7 + %g6] 0x11,	%f17
	movrlez	%l3,	0x3C7,	%l5
	fbug	%fcc1,	loop_1833
	sdivx	%i4,	0x0786,	%i6
	fmovrslz	%l6,	%f5,	%f10
	fmovdleu	%xcc,	%f24,	%f8
loop_1833:
	fbug	%fcc0,	loop_1834
	sra	%l2,	%o5,	%o2
	fbule,a	%fcc1,	loop_1835
	addccc	%l4,	%o0,	%g4
loop_1834:
	subc	%g5,	%i2,	%l1
	fmovrdgz	%o6,	%f6,	%f0
loop_1835:
	nop
	wr	%g0,	0x2a,	%asi
	stha	%g7,	[%l7 + 0x32] %asi
	membar	#Sync
	movg	%icc,	%i3,	%i0
	movn	%icc,	%o3,	%l0
	set	0x34, %g1
	lduwa	[%l7 + %g1] 0x15,	%g3
	ldd	[%l7 + 0x78],	%f20
	fandnot2	%f2,	%f30,	%f22
	fmul8sux16	%f28,	%f26,	%f28
	bl,a	loop_1836
	fsrc2	%f30,	%f2
	te	%icc,	0x6
	sub	%g2,	0x126D,	%i1
loop_1836:
	addc	%g1,	%o4,	%i7
	fpsub32s	%f13,	%f2,	%f22
	edge16	%g6,	%i5,	%o7
	movre	%o1,	%l3,	%i4
	set	0x6C, %i7
	stha	%l5,	[%l7 + %i7] 0x89
	addcc	%l6,	%i6,	%o5
	edge8n	%o2,	%l2,	%l4
	subcc	%g4,	%o0,	%i2
	brgz,a	%g5,	loop_1837
	or	%l1,	%g7,	%o6
	array8	%i3,	%o3,	%i0
	movrgez	%l0,	0x1E9,	%g3
loop_1837:
	sll	%i1,	%g2,	%g1
	sdivx	%o4,	0x1167,	%g6
	fones	%f27
	fmovscc	%xcc,	%f19,	%f6
	tne	%icc,	0x5
	fmovdl	%xcc,	%f26,	%f20
	tvc	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%i5,	%o7
	movgu	%xcc,	%i7,	%l3
	andn	%i4,	%l5,	%o1
	subccc	%i6,	0x0311,	%o5
	fpack16	%f0,	%f10
	sllx	%l6,	0x14,	%l2
	or	%l4,	%o2,	%g4
	bcs,a,pn	%icc,	loop_1838
	fxnor	%f4,	%f18,	%f14
	alignaddrl	%o0,	%i2,	%l1
	fpack32	%f16,	%f6,	%f28
loop_1838:
	movrgez	%g7,	%g5,	%i3
	bleu,pt	%icc,	loop_1839
	fmul8ulx16	%f12,	%f2,	%f30
	tn	%icc,	0x7
	tne	%icc,	0x3
loop_1839:
	fbge,a	%fcc0,	loop_1840
	tn	%xcc,	0x4
	fmovrdgz	%o6,	%f4,	%f24
	tsubcc	%o3,	%i0,	%l0
loop_1840:
	brlz,a	%i1,	loop_1841
	xorcc	%g3,	0x0D40,	%g1
	sub	%o4,	0x0C73,	%g2
	edge32n	%g6,	%o7,	%i7
loop_1841:
	andcc	%l3,	0x1F94,	%i4
	set	0x70, %g4
	sta	%f28,	[%l7 + %g4] 0x19
	srl	%i5,	%o1,	%l5
	array16	%o5,	%l6,	%l2
	ldsw	[%l7 + 0x68],	%i6
	tn	%xcc,	0x3
	fmovsn	%xcc,	%f19,	%f20
	movcs	%xcc,	%o2,	%l4
	tn	%icc,	0x4
	taddcctv	%g4,	0x0CE2,	%i2
	fbug	%fcc1,	loop_1842
	tneg	%icc,	0x4
	sllx	%o0,	%l1,	%g7
	tne	%xcc,	0x7
loop_1842:
	tn	%xcc,	0x6
	tcc	%xcc,	0x1
	srax	%i3,	0x1A,	%o6
	tg	%xcc,	0x1
	move	%xcc,	%g5,	%i0
	fnot2	%f20,	%f30
	fpadd32	%f2,	%f8,	%f10
	fmovsleu	%icc,	%f5,	%f14
	fcmpes	%fcc0,	%f9,	%f10
	movcs	%xcc,	%l0,	%o3
	bshuffle	%f30,	%f2,	%f10
	sdivx	%g3,	0x0C18,	%g1
	mova	%icc,	%i1,	%g2
	movrgez	%o4,	%g6,	%i7
	tvs	%icc,	0x6
	sir	0x19E0
	andn	%l3,	0x167B,	%o7
	set	0x60, %l6
	ldda	[%l7 + %l6] 0x26,	%i4
	andcc	%o1,	%l5,	%i4
	tg	%xcc,	0x7
	fmovsgu	%icc,	%f11,	%f0
	fmovdg	%xcc,	%f25,	%f0
	fmovd	%f14,	%f4
	fcmpne16	%f30,	%f6,	%o5
	movl	%xcc,	%l6,	%i6
	tleu	%xcc,	0x2
	edge16	%l2,	%l4,	%g4
	umul	%i2,	%o0,	%l1
	udivcc	%g7,	0x033A,	%i3
	popc	0x1416,	%o6
	movrlez	%g5,	%i0,	%l0
	tl	%icc,	0x6
	edge32n	%o3,	%g3,	%o2
	smul	%i1,	0x0B9B,	%g2
	edge32n	%g1,	%o4,	%i7
	fexpand	%f4,	%f4
	fpack32	%f14,	%f6,	%f6
	subc	%l3,	0x1CA5,	%o7
	fabss	%f24,	%f21
	addc	%i5,	0x0AB5,	%o1
	set	0x09, %i4
	ldsba	[%l7 + %i4] 0x0c,	%l5
	fmovsneg	%icc,	%f0,	%f27
	sub	%g6,	%i4,	%l6
	set	0x10, %g7
	ldsha	[%l7 + %g7] 0x88,	%i6
	nop
	set	0x5E, %o0
	ldstub	[%l7 + %o0],	%l2
	sdiv	%o5,	0x093F,	%l4
	movneg	%xcc,	%i2,	%o0
	edge8ln	%g4,	%g7,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x5
	fmovde	%xcc,	%f20,	%f24
	subccc	%l1,	0x0DAA,	%g5
	addcc	%o6,	0x1EA1,	%i0
	fmovda	%icc,	%f14,	%f10
	fxors	%f18,	%f23,	%f3
	st	%f3,	[%l7 + 0x18]
	edge16l	%o3,	%l0,	%o2
	udivcc	%i1,	0x0B6E,	%g3
	movle	%xcc,	%g2,	%o4
	taddcc	%g1,	%l3,	%i7
	ldd	[%l7 + 0x40],	%f28
	fmovspos	%xcc,	%f19,	%f21
	edge16ln	%o7,	%o1,	%l5
	fmovsn	%xcc,	%f15,	%f9
	orn	%i5,	0x0B42,	%g6
	sra	%i4,	%l6,	%l2
	fmovdcc	%xcc,	%f3,	%f18
	tg	%icc,	0x4
	orn	%i6,	0x0637,	%l4
	movrgez	%o5,	0x084,	%o0
	set	0x4C, %o3
	lduha	[%l7 + %o3] 0x04,	%g4
	membar	0x03
	sdivcc	%g7,	0x0033,	%i3
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x14
	sll	%l1,	0x06,	%g5
	movg	%xcc,	%o6,	%i2
	popc	%i0,	%o3
	subcc	%o2,	0x0FF1,	%i1
	tsubcc	%l0,	%g2,	%o4
	bneg	loop_1843
	tge	%xcc,	0x7
	fmovsvc	%icc,	%f0,	%f8
	fsrc2	%f0,	%f24
loop_1843:
	movre	%g1,	0x0C6,	%l3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x1A] %asi,	%g3
	srax	%i7,	%o7,	%l5
	bneg	%icc,	loop_1844
	edge32ln	%o1,	%i5,	%i4
	fmovsn	%xcc,	%f5,	%f14
	membar	0x16
loop_1844:
	swap	[%l7 + 0x24],	%g6
	bn,a,pt	%icc,	loop_1845
	orcc	%l6,	%i6,	%l4
	bleu,a,pn	%icc,	loop_1846
	fmovdleu	%xcc,	%f20,	%f6
loop_1845:
	ldx	[%l7 + 0x68],	%o5
	ble,a,pt	%xcc,	loop_1847
loop_1846:
	movrgez	%o0,	%l2,	%g7
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x10] %asi,	%i3
loop_1847:
	movgu	%xcc,	%g4,	%l1
	fnot2	%f24,	%f4
	fbne,a	%fcc2,	loop_1848
	orcc	%g5,	0x0A37,	%i2
	fands	%f16,	%f23,	%f31
	edge8l	%i0,	%o6,	%o2
loop_1848:
	fmovsvs	%xcc,	%f11,	%f16
	fsrc1s	%f22,	%f12
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x17
	membar	#Sync
	bneg	loop_1849
	bleu,a	loop_1850
	fbu,a	%fcc0,	loop_1851
	xorcc	%o3,	%l0,	%g2
loop_1849:
	brgez	%i1,	loop_1852
loop_1850:
	ldsw	[%l7 + 0x7C],	%o4
loop_1851:
	ldd	[%l7 + 0x60],	%f16
	movge	%icc,	%g1,	%l3
loop_1852:
	sethi	0x1CF8,	%i7
	set	0x17, %g3
	stba	%o7,	[%l7 + %g3] 0x2a
	membar	#Sync
	prefetch	[%l7 + 0x30],	 0x1
	movrgz	%l5,	0x21F,	%g3
	movvc	%icc,	%o1,	%i4
	fsrc1s	%f18,	%f16
	fcmped	%fcc3,	%f22,	%f16
	tleu	%xcc,	0x3
	tl	%xcc,	0x6
	fmovdpos	%xcc,	%f24,	%f11
	fpack16	%f30,	%f17
	movleu	%xcc,	%i5,	%g6
	fmovsvs	%icc,	%f30,	%f30
	movleu	%icc,	%i6,	%l4
	movpos	%icc,	%l6,	%o5
	fpadd16s	%f23,	%f3,	%f12
	srl	%l2,	0x18,	%g7
	edge32n	%i3,	%g4,	%l1
	mulx	%g5,	0x0C50,	%i2
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x64] %asi,	%o0
	movcc	%xcc,	%o6,	%o2
	bcs,a	loop_1853
	edge16l	%o3,	%i0,	%l0
	set	0x34, %l1
	ldsba	[%l7 + %l1] 0x19,	%g2
loop_1853:
	tne	%icc,	0x7
	fblg,a	%fcc0,	loop_1854
	fpmerge	%f19,	%f3,	%f2
	and	%o4,	%g1,	%l3
	fmovdcc	%xcc,	%f28,	%f23
loop_1854:
	sir	0x057E
	sethi	0x139E,	%i1
	fmovdle	%icc,	%f31,	%f10
	movrgez	%i7,	0x1AF,	%l5
	fzero	%f26
	array8	%o7,	%g3,	%i4
	movne	%icc,	%o1,	%i5
	edge8l	%g6,	%l4,	%i6
	ta	%xcc,	0x7
	srl	%o5,	0x04,	%l6
	fsrc2s	%f21,	%f26
	fmovrdlz	%l2,	%f14,	%f30
	brz,a	%g7,	loop_1855
	fmovspos	%icc,	%f2,	%f4
	brnz	%i3,	loop_1856
	xnor	%g4,	%l1,	%i2
loop_1855:
	sethi	0x020D,	%o0
	srax	%o6,	%o2,	%o3
loop_1856:
	movne	%xcc,	%i0,	%l0
	edge16n	%g2,	%o4,	%g1
	fbne	%fcc1,	loop_1857
	fpadd16	%f30,	%f22,	%f12
	smul	%g5,	%i1,	%l3
	edge8ln	%l5,	%i7,	%o7
loop_1857:
	move	%xcc,	%g3,	%i4
	bn,a	loop_1858
	fcmpeq32	%f4,	%f28,	%o1
	tcs	%xcc,	0x4
	udivx	%i5,	0x085A,	%g6
loop_1858:
	move	%xcc,	%l4,	%i6
	fmovsle	%icc,	%f20,	%f30
	movge	%icc,	%l6,	%l2
	te	%xcc,	0x6
	taddcctv	%g7,	0x0AFF,	%i3
	tne	%icc,	0x7
	tsubcc	%g4,	%l1,	%o5
	movrne	%i2,	%o6,	%o2
	fcmpeq16	%f30,	%f14,	%o0
	fsrc1	%f8,	%f18
	fbne,a	%fcc0,	loop_1859
	movne	%icc,	%i0,	%o3
	set	0x5C, %l3
	lduwa	[%l7 + %l3] 0x80,	%l0
loop_1859:
	lduh	[%l7 + 0x68],	%g2
	tne	%xcc,	0x2
	fnot2s	%f2,	%f16
	orn	%o4,	0x1498,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%g1,	%i1,	%l5
	addcc	%l3,	0x04AD,	%i7
	bleu	%xcc,	loop_1860
	orcc	%g3,	0x0377,	%o7
	movgu	%xcc,	%o1,	%i5
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1860:
	taddcc	%g6,	0x1E63,	%l4
	orn	%i6,	0x0A1D,	%l6
	sth	%l2,	[%l7 + 0x0E]
	fbne	%fcc3,	loop_1861
	movre	%g7,	%i4,	%i3
	edge8n	%l1,	%o5,	%g4
	fbu,a	%fcc2,	loop_1862
loop_1861:
	fors	%f31,	%f24,	%f1
	subc	%i2,	0x0FE1,	%o6
	sir	0x0651
loop_1862:
	movneg	%xcc,	%o0,	%o2
	movg	%xcc,	%i0,	%o3
	set	0x48, %i1
	lda	[%l7 + %i1] 0x10,	%f17
	movre	%l0,	0x386,	%o4
	subc	%g2,	%g5,	%g1
	fbug	%fcc3,	loop_1863
	sir	0x135C
	sub	%l5,	%l3,	%i1
	sir	0x1992
loop_1863:
	fmovdg	%icc,	%f16,	%f14
	alignaddr	%g3,	%o7,	%o1
	fnors	%f4,	%f25,	%f16
	movrgez	%i5,	0x368,	%g6
	movcs	%icc,	%l4,	%i7
	fmovdn	%xcc,	%f21,	%f7
	orcc	%i6,	0x1870,	%l2
	bvc,a,pn	%icc,	loop_1864
	sub	%g7,	%l6,	%i3
	edge16l	%l1,	%i4,	%g4
	wr	%g0,	0x19,	%asi
	stha	%o5,	[%l7 + 0x48] %asi
loop_1864:
	tneg	%xcc,	0x3
	std	%f0,	[%l7 + 0x18]
	be,a,pn	%xcc,	loop_1865
	udiv	%i2,	0x072F,	%o0
	alignaddrl	%o6,	%o2,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1865:
	ld	[%l7 + 0x44],	%f20
	orcc	%i0,	%l0,	%g2
	sethi	0x1BE7,	%o4
	fcmps	%fcc3,	%f17,	%f13
	fpadd16s	%f14,	%f11,	%f14
	tsubcc	%g1,	%l5,	%g5
	fmovrdne	%i1,	%f12,	%f0
	xor	%l3,	%g3,	%o7
	tg	%icc,	0x1
	movl	%icc,	%i5,	%g6
	sllx	%l4,	0x12,	%o1
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i6
	fmul8x16al	%f6,	%f3,	%f2
	tle	%icc,	0x0
	fmovscs	%icc,	%f5,	%f22
	array16	%l2,	%i7,	%g7
	movrgez	%l6,	%l1,	%i4
	fandnot1	%f24,	%f20,	%f6
	std	%f18,	[%l7 + 0x10]
	orncc	%g4,	0x13AB,	%i3
	ldstub	[%l7 + 0x0B],	%o5
	wr	%g0,	0x88,	%asi
	stha	%o0,	[%l7 + 0x36] %asi
	fbul,a	%fcc0,	loop_1866
	array16	%i2,	%o2,	%o3
	array8	%i0,	%l0,	%g2
	subccc	%o4,	%o6,	%g1
loop_1866:
	xnor	%l5,	%i1,	%g5
	movg	%xcc,	%l3,	%o7
	brgez	%g3,	loop_1867
	tgu	%xcc,	0x5
	set	0x30, %o1
	stxa	%i5,	[%l7 + %o1] 0x81
loop_1867:
	movre	%l4,	0x358,	%o1
	addcc	%g6,	0x0DF9,	%l2
	tcc	%icc,	0x2
	fxor	%f24,	%f16,	%f2
	movvs	%icc,	%i7,	%i6
	sdiv	%l6,	0x1A2D,	%l1
	nop
	set	0x7C, %l5
	lduw	[%l7 + %l5],	%i4
	srlx	%g7,	0x15,	%i3
	smulcc	%g4,	%o0,	%i2
	edge32n	%o2,	%o3,	%o5
	fxnors	%f25,	%f20,	%f15
	srl	%i0,	0x11,	%l0
	fmovsle	%xcc,	%f15,	%f0
	fnegd	%f12,	%f22
	set	0x18, %o7
	lduha	[%l7 + %o7] 0x0c,	%g2
	fbg	%fcc1,	loop_1868
	movrlez	%o6,	0x0DB,	%g1
	ldstub	[%l7 + 0x3C],	%o4
	sub	%l5,	%g5,	%i1
loop_1868:
	bcs,a,pt	%icc,	loop_1869
	fpadd16	%f16,	%f28,	%f8
	addc	%l3,	%g3,	%o7
	srl	%l4,	%o1,	%i5
loop_1869:
	nop
	wr	%g0,	0x04,	%asi
	sta	%f16,	[%l7 + 0x38] %asi
	tcs	%xcc,	0x1
	sra	%g6,	%l2,	%i7
	mulscc	%i6,	%l6,	%l1
	sllx	%g7,	%i3,	%i4
	add	%o0,	0x0C4D,	%g4
	fblg	%fcc2,	loop_1870
	bl,a	%icc,	loop_1871
	fbuge,a	%fcc1,	loop_1872
	srax	%i2,	0x10,	%o3
loop_1870:
	movvc	%xcc,	%o2,	%o5
loop_1871:
	ldd	[%l7 + 0x28],	%i0
loop_1872:
	nop
	wr	%g0,	0x19,	%asi
	stha	%g2,	[%l7 + 0x2E] %asi
	flush	%l7 + 0x5C
	movrne	%o6,	0x169,	%l0
	ldsb	[%l7 + 0x65],	%o4
	orncc	%l5,	0x0854,	%g1
	bneg	%icc,	loop_1873
	membar	0x01
	call	loop_1874
	fcmpeq32	%f26,	%f6,	%g5
loop_1873:
	sub	%l3,	%g3,	%i1
	subc	%l4,	0x0FD2,	%o1
loop_1874:
	nop
	setx	loop_1875,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udiv	%i5,	0x0EF1,	%g6
	fpack16	%f14,	%f8
	mulscc	%o7,	%l2,	%i7
loop_1875:
	bne,pn	%xcc,	loop_1876
	addc	%i6,	0x1670,	%l6
	ldsh	[%l7 + 0x62],	%l1
	sdivcc	%g7,	0x0787,	%i3
loop_1876:
	tne	%icc,	0x4
	edge16ln	%o0,	%g4,	%i2
	movrlz	%i4,	%o3,	%o2
	brlez	%o5,	loop_1877
	fbug,a	%fcc0,	loop_1878
	bcs,a,pn	%xcc,	loop_1879
	tcs	%xcc,	0x0
loop_1877:
	nop
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%o6
loop_1878:
	mulscc	%g2,	%o4,	%l5
loop_1879:
	nop
	set	0x4D, %i3
	lduba	[%l7 + %i3] 0x88,	%l0
	movcc	%icc,	%g1,	%g5
	edge8l	%l3,	%g3,	%i1
	fcmpgt16	%f6,	%f12,	%l4
	fmovdpos	%icc,	%f9,	%f26
	fzeros	%f1
	fnot1s	%f17,	%f2
	taddcc	%i5,	%g6,	%o7
	movle	%xcc,	%o1,	%i7
	movleu	%xcc,	%l2,	%i6
	fmul8x16au	%f20,	%f8,	%f24
	fmovdn	%icc,	%f27,	%f17
	ldd	[%l7 + 0x70],	%i6
	ta	%xcc,	0x0
	fnands	%f15,	%f8,	%f0
	fmovrdlez	%g7,	%f8,	%f14
	sdivcc	%i3,	0x11C5,	%o0
	edge16	%g4,	%l1,	%i2
	popc	%o3,	%o2
	mulscc	%i4,	%i0,	%o6
	tpos	%xcc,	0x7
	umulcc	%o5,	%g2,	%o4
	movrlz	%l5,	0x352,	%l0
	tsubcc	%g1,	0x1C5C,	%g5
	movl	%icc,	%l3,	%g3
	fsrc2	%f8,	%f12
	subccc	%l4,	0x0344,	%i1
	movrgez	%g6,	0x39A,	%i5
	fpsub32	%f12,	%f22,	%f28
	movvs	%icc,	%o1,	%i7
	ldsw	[%l7 + 0x4C],	%o7
	smul	%l2,	0x184F,	%i6
	edge16n	%g7,	%l6,	%o0
	alignaddrl	%i3,	%l1,	%g4
	edge16l	%i2,	%o2,	%i4
	srax	%i0,	%o3,	%o6
	tsubcctv	%o5,	0x1376,	%g2
	subccc	%l5,	0x0693,	%o4
	xnorcc	%l0,	0x1E3C,	%g5
	nop
	setx	loop_1880,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovse	%icc,	%f0,	%f25
	fcmpes	%fcc0,	%f19,	%f27
	movpos	%icc,	%g1,	%g3
loop_1880:
	nop
	set	0x60, %g2
	ldda	[%l7 + %g2] 0x2c,	%l2
	bvc,pt	%xcc,	loop_1881
	fmuld8sux16	%f11,	%f31,	%f30
	fbl	%fcc3,	loop_1882
	tle	%xcc,	0x5
loop_1881:
	srlx	%l4,	%i1,	%i5
	tge	%icc,	0x5
loop_1882:
	fors	%f26,	%f1,	%f28
	stx	%g6,	[%l7 + 0x40]
	movn	%icc,	%i7,	%o1
	edge16n	%o7,	%l2,	%g7
	movrlz	%l6,	0x203,	%o0
	udiv	%i3,	0x1A68,	%l1
	sll	%i6,	0x02,	%g4
	edge16l	%o2,	%i2,	%i4
	tpos	%xcc,	0x7
	ble	loop_1883
	fexpand	%f0,	%f20
	tgu	%xcc,	0x6
	srl	%i0,	%o6,	%o3
loop_1883:
	taddcc	%g2,	0x0DE8,	%o5
	tvc	%xcc,	0x4
	bl,pt	%icc,	loop_1884
	movl	%icc,	%o4,	%l5
	fmovdne	%icc,	%f0,	%f27
	alignaddrl	%g5,	%l0,	%g3
loop_1884:
	fbuge,a	%fcc1,	loop_1885
	be,pt	%icc,	loop_1886
	or	%l3,	%g1,	%i1
	movrgez	%l4,	%g6,	%i5
loop_1885:
	lduh	[%l7 + 0x22],	%i7
loop_1886:
	sll	%o1,	%o7,	%g7
	tvs	%xcc,	0x3
	fnegs	%f15,	%f0
	fsrc1s	%f11,	%f20
	ble,a	loop_1887
	taddcc	%l2,	%o0,	%l6
	fbue	%fcc2,	loop_1888
	fbuge	%fcc1,	loop_1889
loop_1887:
	nop
	set	0x78, %i5
	ldsw	[%l7 + %i5],	%i3
	fmovdpos	%icc,	%f25,	%f2
loop_1888:
	fmovde	%xcc,	%f10,	%f15
loop_1889:
	fbug	%fcc3,	loop_1890
	udivcc	%i6,	0x1B1C,	%g4
	move	%icc,	%l1,	%i2
	swap	[%l7 + 0x7C],	%i4
loop_1890:
	bvs,a	loop_1891
	movge	%xcc,	%o2,	%o6
	tn	%xcc,	0x3
	fxnors	%f30,	%f22,	%f31
loop_1891:
	nop
	wr	%g0,	0x10,	%asi
	stda	%i0,	[%l7 + 0x18] %asi
	tgu	%icc,	0x0
	tge	%xcc,	0x7
	fpsub16	%f6,	%f20,	%f8
	xnorcc	%g2,	0x1074,	%o3
	fandnot2s	%f16,	%f20,	%f13
	fpmerge	%f26,	%f12,	%f10
	edge16	%o5,	%l5,	%o4
	fnegd	%f6,	%f10
	edge16ln	%l0,	%g5,	%l3
	smul	%g3,	0x1629,	%g1
	fmul8x16al	%f0,	%f5,	%f12
	sth	%i1,	[%l7 + 0x66]
	orncc	%g6,	%l4,	%i5
	ldx	[%l7 + 0x38],	%i7
	fmul8x16	%f9,	%f12,	%f4
	fxors	%f10,	%f6,	%f23
	orncc	%o7,	0x0507,	%g7
	addccc	%l2,	0x156D,	%o0
	edge32l	%l6,	%o1,	%i3
	sub	%g4,	0x172C,	%l1
	fmovrdgez	%i6,	%f24,	%f4
	fpsub32s	%f30,	%f4,	%f25
	ldub	[%l7 + 0x0F],	%i2
	ble	%xcc,	loop_1892
	call	loop_1893
	movn	%icc,	%o2,	%i4
	bne,a,pt	%xcc,	loop_1894
loop_1892:
	brgz	%o6,	loop_1895
loop_1893:
	edge16l	%i0,	%g2,	%o3
	ldx	[%l7 + 0x38],	%l5
loop_1894:
	edge16ln	%o5,	%o4,	%g5
loop_1895:
	stbar
	fmovrsgez	%l0,	%f9,	%f23
	movrgz	%g3,	0x374,	%g1
	nop
	set	0x42, %l2
	ldub	[%l7 + %l2],	%l3
	movrne	%i1,	0x0EE,	%g6
	srax	%l4,	%i7,	%o7
	fpack16	%f30,	%f26
	add	%g7,	0x0F62,	%l2
	fmovrdne	%o0,	%f28,	%f26
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x11
	ldstub	[%l7 + 0x0A],	%i5
	fmovrdgz	%l6,	%f26,	%f20
	addc	%o1,	0x11A7,	%i3
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	xnorcc	%l1,	0x1D8B,	%i6
	movleu	%icc,	%g4,	%o2
	sra	%i2,	%i4,	%i0
	srl	%o6,	0x04,	%g2
	taddcc	%o3,	0x0ADF,	%l5
	udivcc	%o5,	0x1E3C,	%g5
	fpadd16s	%f5,	%f30,	%f2
	srl	%l0,	0x1B,	%o4
	flush	%l7 + 0x2C
	popc	%g1,	%l3
	fmovrslez	%i1,	%f31,	%f11
	fbe,a	%fcc2,	loop_1896
	fnot1s	%f16,	%f16
	sllx	%g3,	0x0F,	%l4
	sethi	0x152A,	%g6
loop_1896:
	andn	%i7,	%g7,	%l2
	bg,pn	%xcc,	loop_1897
	ldd	[%l7 + 0x30],	%f16
	set	0x4C, %o6
	lduwa	[%l7 + %o6] 0x10,	%o7
loop_1897:
	ldx	[%l7 + 0x08],	%i5
	fmovd	%f10,	%f12
	fmovsgu	%xcc,	%f24,	%f7
	tgu	%icc,	0x3
	ld	[%l7 + 0x60],	%f10
	movle	%xcc,	%l6,	%o1
	brlz	%o0,	loop_1898
	membar	0x12
	fpadd16	%f0,	%f12,	%f4
	swap	[%l7 + 0x68],	%i3
loop_1898:
	sth	%l1,	[%l7 + 0x6E]
	fblg	%fcc1,	loop_1899
	taddcctv	%i6,	%g4,	%i2
	edge8l	%i4,	%i0,	%o6
	brgz	%g2,	loop_1900
loop_1899:
	udivx	%o3,	0x097E,	%o2
	fxors	%f1,	%f21,	%f7
	tne	%icc,	0x6
loop_1900:
	smulcc	%l5,	0x14F2,	%g5
	wr	%g0,	0x80,	%asi
	stda	%o4,	[%l7 + 0x60] %asi
	nop
	setx loop_1901, %l0, %l1
	jmpl %l1, %l0
	andn	%g1,	0x0CF3,	%o4
	addccc	%i1,	%l3,	%l4
	fbn,a	%fcc1,	loop_1902
loop_1901:
	brgez	%g3,	loop_1903
	bleu,pt	%xcc,	loop_1904
	or	%g6,	%i7,	%l2
loop_1902:
	fsrc1	%f26,	%f16
loop_1903:
	addc	%o7,	0x1348,	%g7
loop_1904:
	movrgz	%l6,	0x1A0,	%i5
	fmul8x16al	%f26,	%f29,	%f0
	brlez	%o0,	loop_1905
	fzero	%f12
	bvc,pt	%icc,	loop_1906
	subcc	%i3,	%o1,	%i6
loop_1905:
	movvs	%xcc,	%g4,	%i2
	taddcctv	%l1,	0x1AD9,	%i4
loop_1906:
	tpos	%xcc,	0x7
	move	%xcc,	%o6,	%g2
	membar	0x77
	udivx	%i0,	0x0409,	%o3
	fnegd	%f0,	%f10
	fpackfix	%f22,	%f14
	sdiv	%l5,	0x1C52,	%o2
	fbug,a	%fcc2,	loop_1907
	sth	%o5,	[%l7 + 0x38]
	array16	%g5,	%g1,	%o4
	and	%i1,	0x11C2,	%l3
loop_1907:
	udivcc	%l0,	0x1765,	%g3
	fcmple32	%f2,	%f2,	%l4
	sdivx	%g6,	0x0A05,	%l2
	orncc	%o7,	%g7,	%l6
	tle	%icc,	0x5
	srlx	%i5,	0x1D,	%o0
	set	0x44, %g5
	swapa	[%l7 + %g5] 0x80,	%i7
	nop
	set	0x64, %i0
	lduw	[%l7 + %i0],	%i3
	fmovdgu	%icc,	%f27,	%f30
	andncc	%i6,	%o1,	%g4
	fnors	%f27,	%f14,	%f22
	edge32n	%i2,	%l1,	%i4
	orncc	%g2,	%i0,	%o3
	fzero	%f22
	and	%l5,	0x115C,	%o6
	orncc	%o2,	%g5,	%g1
	udivcc	%o4,	0x00AB,	%i1
	nop
	set	0x58, %l0
	stx	%o5,	[%l7 + %l0]
	array32	%l3,	%l0,	%l4
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%g6
	fnors	%f12,	%f9,	%f31
	fsrc2s	%f10,	%f13
	fmovsgu	%xcc,	%f29,	%f10
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf0
	membar	#Sync
	andncc	%g3,	%l2,	%g7
	subccc	%o7,	%l6,	%o0
	fmovrdgz	%i5,	%f14,	%f26
	array8	%i7,	%i3,	%i6
	edge32l	%g4,	%i2,	%l1
	tn	%icc,	0x1
	sdivx	%o1,	0x0FE3,	%g2
	fmovdpos	%xcc,	%f28,	%f28
	sllx	%i4,	0x0E,	%o3
	edge16l	%i0,	%o6,	%o2
	fsrc2	%f14,	%f4
	movgu	%xcc,	%g5,	%l5
	fmovrdgz	%o4,	%f6,	%f10
	srlx	%g1,	0x10,	%o5
	fpsub16	%f12,	%f22,	%f18
	movrne	%i1,	%l0,	%l4
	fbg,a	%fcc1,	loop_1908
	fmovs	%f3,	%f15
	fbe	%fcc3,	loop_1909
	bcs,a,pn	%xcc,	loop_1910
loop_1908:
	tcc	%icc,	0x4
	fblg,a	%fcc3,	loop_1911
loop_1909:
	bgu,a	loop_1912
loop_1910:
	andcc	%l3,	0x0FCE,	%g3
	fmovs	%f17,	%f15
loop_1911:
	tle	%xcc,	0x1
loop_1912:
	std	%g6,	[%l7 + 0x78]
	set	0x30, %o5
	stda	%l2,	[%l7 + %o5] 0x2f
	membar	#Sync
	smul	%g7,	0x0BA8,	%l6
	addcc	%o0,	%o7,	%i5
	taddcctv	%i3,	%i6,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%i2,	%g4
	bpos	%xcc,	loop_1913
	orcc	%l1,	0x0386,	%o1
	movre	%i4,	%o3,	%g2
	movrgez	%i0,	%o6,	%o2
loop_1913:
	fandnot1	%f28,	%f24,	%f22
	movre	%g5,	%l5,	%o4
	udiv	%o5,	0x0CF1,	%i1
	fcmpgt16	%f20,	%f14,	%g1
	smulcc	%l0,	%l4,	%g3
	udivx	%g6,	0x09F2,	%l2
	orcc	%g7,	0x1B83,	%l3
	orcc	%o0,	%o7,	%l6
	umulcc	%i5,	0x0EE9,	%i3
	tvc	%icc,	0x6
	tsubcctv	%i6,	%i7,	%g4
	umulcc	%i2,	%l1,	%o1
	bvc,a,pt	%xcc,	loop_1914
	fmovsge	%xcc,	%f14,	%f13
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x88
loop_1914:
	movne	%xcc,	%o3,	%i4
	fcmpeq32	%f10,	%f8,	%g2
	sir	0x06D9
	fnot1s	%f17,	%f5
	addc	%i0,	%o2,	%g5
	bvc,a	loop_1915
	edge32	%l5,	%o6,	%o4
	ldsh	[%l7 + 0x32],	%o5
	sdivx	%g1,	0x1851,	%i1
loop_1915:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x38] %asi,	%l0
	add	%l4,	0x1FA8,	%g3
	xorcc	%g6,	%g7,	%l3
	movle	%icc,	%l2,	%o0
	and	%o7,	0x02ED,	%i5
	fmovsge	%icc,	%f6,	%f4
	movre	%l6,	0x3DD,	%i6
	fxor	%f16,	%f6,	%f20
	movvs	%xcc,	%i7,	%i3
	udiv	%g4,	0x01C6,	%i2
	xnor	%l1,	%o1,	%o3
	fpack16	%f24,	%f23
	set	0x60, %i2
	ldxa	[%l7 + %i2] 0x11,	%g2
	edge16ln	%i0,	%o2,	%i4
	subcc	%g5,	%o6,	%o4
	ba,pt	%xcc,	loop_1916
	bne,a,pt	%icc,	loop_1917
	stx	%o5,	[%l7 + 0x08]
	movrlz	%g1,	%l5,	%l0
loop_1916:
	fpackfix	%f2,	%f7
loop_1917:
	movg	%xcc,	%i1,	%l4
	fexpand	%f24,	%f10
	fxnor	%f6,	%f26,	%f18
	movrgez	%g6,	%g7,	%g3
	fmul8ulx16	%f28,	%f26,	%f2
	fmovsl	%icc,	%f4,	%f19
	fbl,a	%fcc2,	loop_1918
	xor	%l2,	%l3,	%o0
	movrgz	%o7,	%i5,	%l6
	array16	%i6,	%i7,	%g4
loop_1918:
	movrlez	%i3,	0x123,	%i2
	srax	%o1,	%l1,	%o3
	movre	%i0,	%g2,	%i4
	movrgez	%g5,	%o6,	%o2
	edge8	%o5,	%o4,	%l5
	fbug,a	%fcc1,	loop_1919
	fmovd	%f8,	%f16
	for	%f6,	%f4,	%f28
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
loop_1919:
	movrlez	%l0,	%i1,	%g1
	tpos	%icc,	0x3
	tsubcctv	%g6,	0x1B0A,	%l4
loop_1920:
	mova	%xcc,	%g3,	%g7
	bvc,a,pn	%xcc,	loop_1921
	movcc	%xcc,	%l3,	%l2
	fsrc2	%f2,	%f4
	fsrc1	%f26,	%f22
loop_1921:
	array8	%o7,	%i5,	%l6
	udivcc	%i6,	0x098F,	%o0
	subccc	%g4,	0x02B2,	%i3
	sir	0x1C05
	sllx	%i2,	%i7,	%l1
	fmul8x16al	%f16,	%f16,	%f22
	xnor	%o3,	%i0,	%g2
	bvs,pn	%xcc,	loop_1922
	brnz	%o1,	loop_1923
	brgz,a	%g5,	loop_1924
	pdist	%f10,	%f20,	%f30
loop_1922:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1923:
	nop
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%o6
loop_1924:
	movne	%xcc,	%i4,	%o2
	tneg	%xcc,	0x1
	nop
	setx	loop_1925,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnor	%f24,	%f8,	%f20
	edge32l	%o5,	%o4,	%l5
	wr	%g0,	0x0c,	%asi
	stwa	%l0,	[%l7 + 0x60] %asi
loop_1925:
	umul	%i1,	%g1,	%l4
	movleu	%xcc,	%g3,	%g7
	edge8n	%g6,	%l2,	%l3
	srlx	%i5,	0x02,	%l6
	sra	%i6,	0x1B,	%o7
	srl	%o0,	0x1A,	%g4
	tgu	%xcc,	0x7
	alignaddr	%i3,	%i2,	%l1
	set	0x48, %i7
	lda	[%l7 + %i7] 0x19,	%f30
	bg,a,pn	%xcc,	loop_1926
	move	%xcc,	%o3,	%i7
	fmovrsgez	%i0,	%f22,	%f13
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1926:
	addcc	%o1,	0x1EBC,	%g2
	fnot2	%f24,	%f8
	set	0x70, %g4
	stda	%g4,	[%l7 + %g4] 0x81
	tn	%xcc,	0x1
	nop
	setx	loop_1927,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bcc,a,pn	%xcc,	loop_1928
	sir	0x1ABA
	addc	%o6,	0x138D,	%i4
loop_1927:
	move	%xcc,	%o5,	%o2
loop_1928:
	edge16n	%l5,	%l0,	%o4
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x4E] %asi,	%g1
	edge16l	%l4,	%g3,	%g7
	popc	%g6,	%l2
	edge32n	%l3,	%i5,	%l6
	st	%f9,	[%l7 + 0x18]
	edge16ln	%i1,	%o7,	%o0
	bleu,a,pt	%xcc,	loop_1929
	movcc	%xcc,	%g4,	%i6
	bcc	loop_1930
	xor	%i2,	%l1,	%i3
loop_1929:
	sethi	0x0363,	%o3
	fones	%f27
loop_1930:
	std	%i0,	[%l7 + 0x20]
	tcs	%xcc,	0x7
	ba,a,pt	%icc,	loop_1931
	call	loop_1932
	bleu,pn	%xcc,	loop_1933
	fbne,a	%fcc1,	loop_1934
loop_1931:
	sir	0x0306
loop_1932:
	brnz,a	%i7,	loop_1935
loop_1933:
	fcmped	%fcc1,	%f26,	%f8
loop_1934:
	movle	%icc,	%o1,	%g5
	edge32l	%g2,	%i4,	%o5
loop_1935:
	nop
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x300] %asi,	%o2 ripped by fixASI40.pl ripped by fixASI40.pl
	brz,a	%o6,	loop_1936
	tsubcc	%l5,	0x17E7,	%o4
	umul	%l0,	%g1,	%g3
	xnor	%g7,	%l4,	%l2
loop_1936:
	movrgez	%l3,	%g6,	%l6
	udivcc	%i5,	0x12CA,	%i1
	array8	%o0,	%g4,	%i6
	addcc	%o7,	%i2,	%l1
	edge16ln	%i3,	%o3,	%i7
	movrlz	%i0,	0x2F3,	%o1
	bvs	loop_1937
	movrlez	%g5,	0x36F,	%g2
	and	%o5,	%o2,	%i4
	alignaddr	%l5,	%o4,	%o6
loop_1937:
	fmul8x16	%f13,	%f20,	%f4
	mulx	%g1,	0x1462,	%l0
	movvs	%xcc,	%g3,	%l4
	wr	%g0,	0x23,	%asi
	stha	%l2,	[%l7 + 0x7A] %asi
	membar	#Sync
	ble,a,pn	%icc,	loop_1938
	tgu	%xcc,	0x5
	move	%xcc,	%l3,	%g7
	ldstub	[%l7 + 0x1B],	%g6
loop_1938:
	fbe,a	%fcc0,	loop_1939
	movvs	%icc,	%l6,	%i1
	array8	%o0,	%i5,	%g4
	mulx	%o7,	%i6,	%i2
loop_1939:
	fmul8sux16	%f4,	%f2,	%f20
	fnegd	%f18,	%f16
	bg,a	loop_1940
	edge16ln	%l1,	%o3,	%i3
	be,pn	%icc,	loop_1941
	movl	%xcc,	%i0,	%o1
loop_1940:
	or	%g5,	%i7,	%g2
	addc	%o2,	%i4,	%l5
loop_1941:
	edge16l	%o4,	%o6,	%o5
	te	%xcc,	0x0
	edge8l	%l0,	%g3,	%g1
	movcc	%icc,	%l4,	%l2
	st	%f27,	[%l7 + 0x40]
	mulscc	%g7,	0x1DEC,	%l3
	movpos	%xcc,	%l6,	%i1
	te	%xcc,	0x1
	edge16l	%o0,	%g6,	%g4
	tl	%icc,	0x2
	umulcc	%i5,	0x01B0,	%o7
	fmovdge	%xcc,	%f12,	%f14
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x41] %asi,	%i2
	srlx	%l1,	%i6,	%o3
	edge8n	%i0,	%o1,	%i3
	fsrc2s	%f25,	%f27
	tleu	%icc,	0x6
	sdiv	%i7,	0x0340,	%g5
	stx	%g2,	[%l7 + 0x18]
	movrlez	%o2,	0x122,	%i4
	bpos,a	%xcc,	loop_1942
	fcmple32	%f10,	%f24,	%o4
	movn	%xcc,	%l5,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1942:
	xnorcc	%o5,	%g3,	%l0
	fnor	%f4,	%f16,	%f22
	sll	%l4,	0x11,	%l2
	edge32ln	%g7,	%l3,	%g1
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%l6
	fpackfix	%f12,	%f7
	umul	%o0,	0x0F47,	%i1
	edge16	%g6,	%g4,	%i5
	tsubcc	%o7,	0x0809,	%l1
	sll	%i6,	0x19,	%i2
	movleu	%xcc,	%o3,	%o1
	fmovrdlez	%i3,	%f6,	%f4
	bcs,a,pn	%icc,	loop_1943
	edge16	%i0,	%g5,	%i7
	fbn,a	%fcc1,	loop_1944
	std	%o2,	[%l7 + 0x68]
loop_1943:
	brlez,a	%g2,	loop_1945
	edge32l	%i4,	%o4,	%o6
loop_1944:
	srlx	%l5,	0x19,	%g3
	nop
	setx loop_1946, %l0, %l1
	jmpl %l1, %l0
loop_1945:
	tg	%icc,	0x2
	tl	%icc,	0x0
	fmovdneg	%xcc,	%f14,	%f4
loop_1946:
	edge32n	%o5,	%l4,	%l2
	tpos	%xcc,	0x6
	sra	%l3,	%g1,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g7,	0x1295,	%o0
	movre	%g6,	%g4,	%i5
	movge	%icc,	%i1,	%l1
	alignaddr	%i6,	%i2,	%o3
	sethi	0x00B6,	%o7
	array16	%o1,	%i0,	%g5
	fnot1s	%f7,	%f13
	ble,a,pt	%xcc,	loop_1947
	fmovsleu	%xcc,	%f2,	%f28
	edge16l	%i3,	%o2,	%g2
	movre	%i4,	%o4,	%i7
loop_1947:
	sdivx	%o6,	0x01E3,	%l5
	edge16ln	%l0,	%g3,	%o5
	sra	%l2,	%l3,	%l4
	wr	%g0,	0x2f,	%asi
	stba	%l6,	[%l7 + 0x0A] %asi
	membar	#Sync
	fands	%f23,	%f3,	%f11
	udivcc	%g7,	0x1B21,	%g1
	set	0x18, %l6
	stwa	%o0,	[%l7 + %l6] 0x80
	fandnot1	%f26,	%f10,	%f12
	edge16	%g4,	%i5,	%i1
	array8	%g6,	%i6,	%i2
	alignaddrl	%l1,	%o7,	%o3
	bcs,a,pn	%icc,	loop_1948
	std	%o0,	[%l7 + 0x60]
	movrlez	%i0,	0x2C9,	%g5
	std	%i2,	[%l7 + 0x20]
loop_1948:
	edge16l	%o2,	%i4,	%o4
	movrlz	%g2,	%o6,	%i7
	array16	%l5,	%g3,	%o5
	movge	%xcc,	%l0,	%l3
	edge16ln	%l2,	%l6,	%g7
	alignaddr	%g1,	%l4,	%g4
	sdivcc	%i5,	0x0FA1,	%i1
	mova	%xcc,	%g6,	%o0
	ldd	[%l7 + 0x58],	%i6
	fmovda	%xcc,	%f7,	%f3
	movg	%icc,	%l1,	%o7
	membar	0x6C
	tleu	%icc,	0x7
	fabsd	%f24,	%f20
	wr	%g0,	0x11,	%asi
	stwa	%o3,	[%l7 + 0x3C] %asi
	tsubcctv	%i2,	%i0,	%o1
	set	0x68, %g1
	ldsha	[%l7 + %g1] 0x80,	%g5
	array8	%o2,	%i3,	%o4
	sll	%i4,	0x0D,	%o6
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2
	fmovscs	%icc,	%f3,	%f17
	andn	%l5,	%g3,	%i7
	fmovrsgz	%o5,	%f27,	%f2
	andcc	%l0,	0x17D4,	%l2
	brgez	%l6,	loop_1949
	move	%icc,	%g7,	%g1
	ba,a,pn	%icc,	loop_1950
	nop
	set	0x22, %g7
	lduh	[%l7 + %g7],	%l3
loop_1949:
	tcc	%xcc,	0x1
	srlx	%l4,	0x0E,	%g4
loop_1950:
	fnot2	%f26,	%f24
	fnors	%f11,	%f2,	%f9
	nop
	setx	loop_1951,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orn	%i5,	%g6,	%i1
	edge32l	%i6,	%l1,	%o0
	fbg,a	%fcc2,	loop_1952
loop_1951:
	fpack32	%f10,	%f30,	%f8
	tvc	%xcc,	0x2
	addcc	%o3,	%i2,	%i0
loop_1952:
	sethi	0x0539,	%o7
	fmovrdlez	%g5,	%f6,	%f16
	fpadd16	%f22,	%f30,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%o1,	%o2
	fsrc2	%f28,	%f28
	sdivx	%o4,	0x042F,	%i3
	movcs	%icc,	%o6,	%g2
	fcmpne32	%f20,	%f22,	%l5
	fmovdle	%icc,	%f27,	%f10
	set	0x10, %o0
	swapa	[%l7 + %o0] 0x19,	%i4
	xor	%g3,	0x0E50,	%i7
	xnorcc	%o5,	%l0,	%l2
	fors	%f23,	%f22,	%f3
	edge16n	%l6,	%g7,	%l3
	sdiv	%l4,	0x03BD,	%g4
	alignaddr	%i5,	%g1,	%i1
	fmovsneg	%icc,	%f24,	%f12
	edge8n	%g6,	%l1,	%i6
	tn	%xcc,	0x0
	wr	%g0,	0xea,	%asi
	stwa	%o0,	[%l7 + 0x14] %asi
	membar	#Sync
	smulcc	%o3,	%i0,	%o7
	fmovs	%f19,	%f26
	wr	%g0,	0x18,	%asi
	sta	%f28,	[%l7 + 0x58] %asi
	sir	0x027C
	fmovrdne	%g5,	%f22,	%f4
	andncc	%i2,	%o2,	%o4
	fbug	%fcc2,	loop_1953
	fxors	%f4,	%f26,	%f16
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x108] %asi,	%i3
loop_1953:
	fornot2s	%f18,	%f21,	%f28
	fmovrsgz	%o6,	%f25,	%f1
	stw	%o1,	[%l7 + 0x68]
	bne,a,pt	%icc,	loop_1954
	tgu	%icc,	0x2
	fmovsn	%icc,	%f4,	%f9
	ba,a	%xcc,	loop_1955
loop_1954:
	brlez,a	%g2,	loop_1956
	tpos	%icc,	0x1
	ta	%xcc,	0x0
loop_1955:
	fmovdleu	%xcc,	%f20,	%f12
loop_1956:
	xorcc	%l5,	%g3,	%i7
	xnorcc	%o5,	%l0,	%i4
	fbge	%fcc1,	loop_1957
	fpsub16	%f30,	%f20,	%f12
	andncc	%l6,	%g7,	%l3
	fbg,a	%fcc2,	loop_1958
loop_1957:
	move	%xcc,	%l4,	%l2
	brgez,a	%i5,	loop_1959
	xnor	%g1,	%g4,	%i1
loop_1958:
	taddcctv	%g6,	%i6,	%o0
	andn	%o3,	%i0,	%l1
loop_1959:
	fbg,a	%fcc3,	loop_1960
	tcs	%icc,	0x2
	fors	%f22,	%f6,	%f23
	subc	%o7,	0x10CA,	%g5
loop_1960:
	srax	%o2,	0x0C,	%o4
	tgu	%icc,	0x5
	sir	0x12F8
	fxnors	%f23,	%f25,	%f27
	prefetch	[%l7 + 0x64],	 0x1
	mulscc	%i2,	0x1D40,	%i3
	prefetch	[%l7 + 0x24],	 0x3
	fpackfix	%f20,	%f10
	ba,a	loop_1961
	subccc	%o6,	0x0387,	%o1
	udiv	%g2,	0x1292,	%l5
	andncc	%g3,	%i7,	%o5
loop_1961:
	fmovrsne	%i4,	%f31,	%f8
	bleu	loop_1962
	fbg	%fcc0,	loop_1963
	fmovsa	%icc,	%f3,	%f16
	ldsb	[%l7 + 0x0B],	%l6
loop_1962:
	movge	%icc,	%g7,	%l3
loop_1963:
	and	%l0,	0x0772,	%l2
	bvc,a	loop_1964
	tleu	%icc,	0x2
	te	%icc,	0x2
	subc	%i5,	0x02D4,	%g1
loop_1964:
	subc	%g4,	0x14D3,	%l4
	or	%g6,	%i1,	%o0
	edge16ln	%o3,	%i0,	%l1
	set	0x36, %o3
	lduha	[%l7 + %o3] 0x0c,	%i6
	tl	%icc,	0x6
	fbule	%fcc2,	loop_1965
	udivx	%g5,	0x02E5,	%o7
	tne	%icc,	0x2
	tsubcctv	%o4,	0x153E,	%i2
loop_1965:
	stw	%o2,	[%l7 + 0x6C]
	fba	%fcc3,	loop_1966
	umulcc	%o6,	0x1CB4,	%o1
	movrlez	%g2,	%l5,	%g3
	andn	%i3,	%o5,	%i7
loop_1966:
	edge32	%l6,	%i4,	%g7
	andncc	%l0,	%l3,	%i5
	wr	%g0,	0x80,	%asi
	stwa	%g1,	[%l7 + 0x78] %asi
	addcc	%g4,	0x0044,	%l4
	movgu	%xcc,	%g6,	%i1
	edge16l	%o0,	%l2,	%o3
	udiv	%l1,	0x1630,	%i0
	stw	%g5,	[%l7 + 0x28]
	fxnor	%f16,	%f26,	%f20
	ldsb	[%l7 + 0x21],	%i6
	prefetch	[%l7 + 0x24],	 0x1
	sethi	0x19AD,	%o7
	alignaddr	%i2,	%o2,	%o6
	tsubcc	%o1,	0x1D15,	%o4
	fcmpeq16	%f8,	%f26,	%g2
	xnor	%l5,	%i3,	%g3
	taddcctv	%i7,	%o5,	%l6
	srl	%i4,	0x1C,	%g7
	fmovdg	%icc,	%f3,	%f5
	fmovdn	%xcc,	%f9,	%f21
	std	%f14,	[%l7 + 0x10]
	fxors	%f13,	%f1,	%f18
	edge16n	%l3,	%i5,	%g1
	fmovrdgz	%l0,	%f30,	%f14
	tvs	%icc,	0x2
	srlx	%l4,	0x17,	%g6
	srax	%i1,	0x11,	%o0
	or	%g4,	%l2,	%o3
	fornot2	%f22,	%f10,	%f24
	add	%l1,	%g5,	%i0
	tcc	%xcc,	0x0
	taddcctv	%o7,	%i6,	%o2
	fmuld8sux16	%f18,	%f9,	%f20
	fnot1	%f12,	%f22
	xnor	%o6,	0x1F78,	%o1
	tleu	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%o4,	%g2
	tvs	%icc,	0x4
	fbl,a	%fcc0,	loop_1967
	tge	%icc,	0x1
	set	0x5C, %o2
	swapa	[%l7 + %o2] 0x88,	%l5
loop_1967:
	tleu	%icc,	0x6
	brlz	%i3,	loop_1968
	or	%g3,	0x0D7F,	%i7
	te	%xcc,	0x5
	fmul8x16	%f9,	%f18,	%f14
loop_1968:
	nop
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x5A] %asi,	%o5
	fcmpne32	%f18,	%f18,	%i2
	wr	%g0,	0xe2,	%asi
	stba	%i4,	[%l7 + 0x43] %asi
	membar	#Sync
	edge32	%l6,	%g7,	%i5
	subccc	%g1,	0x02BD,	%l3
	bgu,a	loop_1969
	xorcc	%l0,	%l4,	%i1
	alignaddr	%g6,	%o0,	%g4
	movgu	%xcc,	%l2,	%o3
loop_1969:
	addc	%g5,	%l1,	%o7
	te	%xcc,	0x2
	sub	%i6,	0x0A59,	%i0
	ldstub	[%l7 + 0x6E],	%o2
	movneg	%icc,	%o1,	%o6
	bneg,pn	%xcc,	loop_1970
	andcc	%g2,	%o4,	%l5
	tge	%xcc,	0x0
	fmul8x16au	%f6,	%f5,	%f16
loop_1970:
	tcs	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x4
	movcs	%xcc,	%g3,	%i7
	fornot2s	%f22,	%f10,	%f16
	movleu	%icc,	%i3,	%o5
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x60] %asi,	%i2
	fpsub16s	%f1,	%f14,	%f29
	ta	%icc,	0x4
	fbge,a	%fcc3,	loop_1971
	xorcc	%l6,	%g7,	%i4
	wr	%g0,	0x88,	%asi
	stwa	%g1,	[%l7 + 0x7C] %asi
loop_1971:
	fbn,a	%fcc0,	loop_1972
	fnot1	%f20,	%f4
	fbn,a	%fcc3,	loop_1973
	subcc	%i5,	%l0,	%l4
loop_1972:
	fmul8x16al	%f9,	%f23,	%f28
	movre	%l3,	0x229,	%g6
loop_1973:
	fand	%f8,	%f12,	%f10
	edge32ln	%i1,	%o0,	%g4
	movl	%icc,	%o3,	%l2
	udivcc	%l1,	0x0E64,	%g5
	set	0x08, %i4
	ldsha	[%l7 + %i4] 0x89,	%i6
	bshuffle	%f12,	%f30,	%f26
	sllx	%o7,	0x0F,	%o2
	movne	%icc,	%i0,	%o6
	xnorcc	%o1,	0x1F47,	%g2
	fornot2s	%f25,	%f31,	%f17
	fbug	%fcc2,	loop_1974
	orn	%o4,	0x026B,	%l5
	movre	%g3,	%i3,	%i7
	nop
	setx	loop_1975,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1974:
	tpos	%icc,	0x4
	addc	%i2,	0x15D5,	%l6
	tvc	%icc,	0x2
loop_1975:
	fbu	%fcc0,	loop_1976
	xor	%g7,	%i4,	%o5
	alignaddr	%i5,	%g1,	%l0
	movleu	%icc,	%l3,	%l4
loop_1976:
	fnot2s	%f21,	%f8
	umul	%g6,	0x0982,	%i1
	fmovsgu	%icc,	%f12,	%f22
	fpackfix	%f0,	%f29
	edge8ln	%o0,	%g4,	%o3
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fpsub32s	%f27,	%f13,	%f27
	fmovdl	%icc,	%f6,	%f9
	fmovdpos	%icc,	%f22,	%f17
	orn	%l2,	%l1,	%i6
	fbule,a	%fcc3,	loop_1977
	edge16	%o7,	%o2,	%i0
	sllx	%o6,	%g5,	%g2
	addccc	%o1,	%l5,	%g3
loop_1977:
	udiv	%i3,	0x1A53,	%o4
	movrgz	%i7,	%i2,	%g7
	alignaddrl	%l6,	%o5,	%i4
	fpack32	%f14,	%f18,	%f16
	ldstub	[%l7 + 0x4D],	%g1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%l0,	%l3
	ba,a	loop_1978
	move	%xcc,	%l4,	%i5
	bn,pn	%icc,	loop_1979
	prefetch	[%l7 + 0x48],	 0x0
loop_1978:
	sra	%g6,	0x05,	%o0
	fmul8x16	%f18,	%f12,	%f28
loop_1979:
	st	%f12,	[%l7 + 0x7C]
	movvc	%icc,	%g4,	%i1
	addccc	%o3,	%l2,	%i6
	ldsh	[%l7 + 0x54],	%o7
	move	%xcc,	%o2,	%i0
	edge16	%o6,	%l1,	%g5
	flush	%l7 + 0x14
	tne	%xcc,	0x1
	set	0x6C, %i6
	lduha	[%l7 + %i6] 0x0c,	%g2
	fmovrslz	%l5,	%f25,	%f13
	fbug	%fcc0,	loop_1980
	nop
	set	0x5C, %g3
	ldsb	[%l7 + %g3],	%g3
	edge8ln	%i3,	%o1,	%o4
	movvs	%xcc,	%i7,	%i2
loop_1980:
	fcmpne16	%f16,	%f24,	%l6
	nop
	set	0x3D, %l1
	ldub	[%l7 + %l1],	%o5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%g7
	tge	%xcc,	0x6
	movg	%xcc,	%l0,	%g1
	smulcc	%l3,	%i5,	%l4
	orcc	%o0,	0x1C1A,	%g6
	orn	%i1,	%g4,	%o3
	srl	%l2,	0x1E,	%o7
	movre	%o2,	0x0B2,	%i6
	fpack32	%f24,	%f0,	%f30
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x50] %asi,	%o6
	movleu	%xcc,	%i0,	%g5
	movrgez	%l1,	0x07A,	%g2
	edge32	%l5,	%g3,	%o1
	ldub	[%l7 + 0x56],	%o4
	fnot1s	%f27,	%f26
	fmovrde	%i3,	%f20,	%f30
	bpos	%icc,	loop_1981
	std	%f12,	[%l7 + 0x68]
	tcs	%xcc,	0x7
	fmovrdne	%i7,	%f0,	%f10
loop_1981:
	bgu,pt	%xcc,	loop_1982
	tne	%icc,	0x3
	fmovdcc	%icc,	%f1,	%f26
	movpos	%xcc,	%l6,	%i2
loop_1982:
	fmovsle	%xcc,	%f1,	%f18
	movrgez	%o5,	%g7,	%i4
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x38] %asi,	%g1
	bneg,a,pt	%xcc,	loop_1983
	sdivcc	%l0,	0x094D,	%l3
	brlz,a	%l4,	loop_1984
	stbar
loop_1983:
	fbne,a	%fcc0,	loop_1985
	fabss	%f9,	%f1
loop_1984:
	subccc	%i5,	%o0,	%g6
	tsubcc	%i1,	0x0808,	%g4
loop_1985:
	nop
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%l2
	tge	%xcc,	0x2
	andn	%o7,	%i6,	%o6
	mova	%icc,	%o2,	%g5
	tgu	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,a,pn	%icc,	loop_1986
	udivcc	%l1,	0x1F62,	%g2
	mulscc	%l5,	%i0,	%g3
	popc	0x0904,	%o1
loop_1986:
	fbule	%fcc2,	loop_1987
	bg	loop_1988
	movpos	%icc,	%o4,	%i3
	subcc	%l6,	0x0D80,	%i2
loop_1987:
	fmovrdgez	%i7,	%f24,	%f20
loop_1988:
	stbar
	brlez	%g7,	loop_1989
	call	loop_1990
	taddcctv	%i4,	0x0ABE,	%o5
	movl	%icc,	%g1,	%l0
loop_1989:
	tgu	%xcc,	0x0
loop_1990:
	bpos,a	%icc,	loop_1991
	taddcctv	%l3,	0x0552,	%l4
	bl	%icc,	loop_1992
	fmovdvs	%icc,	%f28,	%f26
loop_1991:
	ldd	[%l7 + 0x50],	%f14
	movgu	%xcc,	%i5,	%o0
loop_1992:
	srl	%i1,	0x12,	%g4
	umul	%g6,	%l2,	%o3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%o7,	%o6
	fand	%f24,	%f2,	%f10
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x60] %asi,	%o2
	fsrc2	%f28,	%f20
	fmul8x16au	%f23,	%f5,	%f26
	fsrc2	%f22,	%f22
	fbule,a	%fcc0,	loop_1993
	tsubcc	%i6,	0x0485,	%g5
	xnor	%l1,	%g2,	%i0
	membar	0x4C
loop_1993:
	bl,a	loop_1994
	movn	%icc,	%g3,	%l5
	bleu,pt	%xcc,	loop_1995
	bge,a	%icc,	loop_1996
loop_1994:
	array8	%o1,	%o4,	%l6
	udiv	%i2,	0x0E2F,	%i7
loop_1995:
	srax	%g7,	%i3,	%o5
loop_1996:
	movrne	%i4,	0x182,	%g1
	movn	%xcc,	%l3,	%l4
	fba	%fcc0,	loop_1997
	movrgez	%i5,	0x260,	%l0
	array16	%o0,	%i1,	%g4
	fblg,a	%fcc2,	loop_1998
loop_1997:
	smul	%l2,	0x1748,	%o3
	bl,a	%icc,	loop_1999
	fmovrdne	%o7,	%f4,	%f30
loop_1998:
	fble,a	%fcc1,	loop_2000
	orncc	%o6,	0x18FD,	%o2
loop_1999:
	bne,a	%icc,	loop_2001
	fbl,a	%fcc1,	loop_2002
loop_2000:
	srlx	%g6,	%g5,	%l1
	subccc	%g2,	%i6,	%g3
loop_2001:
	tsubcc	%i0,	%o1,	%o4
loop_2002:
	brz,a	%l6,	loop_2003
	subcc	%i2,	0x1259,	%l5
	swap	[%l7 + 0x1C],	%g7
	fandnot2	%f10,	%f30,	%f14
loop_2003:
	orcc	%i3,	0x0862,	%i7
	sllx	%i4,	0x0D,	%o5
	movre	%g1,	%l4,	%l3
	fmovd	%f30,	%f16
	umulcc	%i5,	%o0,	%i1
	edge32	%g4,	%l0,	%l2
	fcmpeq16	%f18,	%f14,	%o7
	stx	%o3,	[%l7 + 0x30]
	fble	%fcc2,	loop_2004
	fmovrdgez	%o2,	%f26,	%f24
	addc	%g6,	0x01E8,	%g5
	fmovsleu	%icc,	%f17,	%f5
loop_2004:
	addcc	%o6,	0x120D,	%l1
	membar	0x43
	srlx	%g2,	0x0C,	%i6
	subccc	%g3,	0x1CEC,	%o1
	andcc	%o4,	%i0,	%i2
	tgu	%icc,	0x3
	edge32ln	%l6,	%l5,	%i3
	bneg,pn	%xcc,	loop_2005
	fmuld8sux16	%f0,	%f23,	%f6
	flush	%l7 + 0x1C
	subcc	%g7,	0x16EA,	%i4
loop_2005:
	movrgz	%i7,	%g1,	%o5
	tsubcc	%l3,	%i5,	%o0
	wr	%g0,	0x19,	%asi
	sta	%f31,	[%l7 + 0x40] %asi
	fbge,a	%fcc3,	loop_2006
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i1,	%g4
	sdivx	%l4,	0x1F72,	%l0
loop_2006:
	nop
	wr	%g0,	0xe2,	%asi
	stba	%o7,	[%l7 + 0x36] %asi
	membar	#Sync
	fcmpgt32	%f28,	%f14,	%l2
	edge32n	%o2,	%g6,	%o3
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x04,	%f16
	lduh	[%l7 + 0x22],	%g5
	fmovrdlez	%l1,	%f30,	%f12
	bvc,a	%xcc,	loop_2007
	popc	%g2,	%o6
	stbar
	movrlz	%i6,	%o1,	%g3
loop_2007:
	std	%f28,	[%l7 + 0x38]
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x6C] %asi,	%i0
	fbge,a	%fcc1,	loop_2008
	tg	%icc,	0x0
	ba,a	loop_2009
	fors	%f13,	%f10,	%f14
loop_2008:
	smul	%i2,	%l6,	%o4
	orcc	%l5,	%g7,	%i4
loop_2009:
	be,a,pt	%icc,	loop_2010
	fpadd16s	%f6,	%f23,	%f21
	fmovdneg	%icc,	%f29,	%f16
	orn	%i3,	%i7,	%o5
loop_2010:
	bne,a	loop_2011
	tneg	%icc,	0x2
	edge16ln	%g1,	%i5,	%o0
	set	0x18, %i1
	ldswa	[%l7 + %i1] 0x04,	%l3
loop_2011:
	fbl,a	%fcc3,	loop_2012
	bn,pt	%xcc,	loop_2013
	sdivcc	%i1,	0x1014,	%g4
	nop
	setx loop_2014, %l0, %l1
	jmpl %l1, %l0
loop_2012:
	fandnot1s	%f17,	%f16,	%f24
loop_2013:
	edge8ln	%l4,	%o7,	%l2
	brlez	%g6,	loop_2015
loop_2014:
	fmovda	%icc,	%f24,	%f21
	ble	%icc,	loop_2016
	fcmpes	%fcc2,	%f23,	%f15
loop_2015:
	mulx	%o3,	0x1481,	%g5
	addccc	%l1,	%g2,	%o2
loop_2016:
	edge16	%i6,	%o1,	%o6
	sll	%g3,	0x1D,	%i0
	prefetch	[%l7 + 0x74],	 0x0
	edge16ln	%l6,	%o4,	%l5
	movpos	%xcc,	%g7,	%i2
	fpadd32s	%f21,	%f17,	%f26
	taddcc	%i4,	%i7,	%i3
	xnorcc	%g1,	0x1CE3,	%o5
	xor	%i5,	%o0,	%l3
	set	0x0C, %o1
	lduwa	[%l7 + %o1] 0x18,	%g4
	umul	%l0,	0x0E2B,	%i1
	andncc	%o7,	%l4,	%l2
	tne	%icc,	0x2
	set	0x66, %o7
	stha	%o3,	[%l7 + %o7] 0x23
	membar	#Sync
	udivx	%g5,	0x142D,	%l1
	xorcc	%g6,	%g2,	%o2
	addcc	%o1,	0x1471,	%o6
	set	0x60, %i3
	ldswa	[%l7 + %i3] 0x04,	%i6
	fmovrse	%i0,	%f30,	%f2
	sllx	%g3,	0x04,	%l6
	or	%l5,	%o4,	%g7
	tgu	%icc,	0x0
	brgz,a	%i2,	loop_2017
	membar	0x37
	udiv	%i7,	0x0825,	%i4
	orncc	%i3,	0x0DFE,	%o5
loop_2017:
	andcc	%g1,	0x1CEF,	%i5
	std	%l2,	[%l7 + 0x20]
	orcc	%o0,	0x1961,	%g4
	addccc	%i1,	0x15FE,	%l0
	bneg	%icc,	loop_2018
	tsubcctv	%o7,	0x0888,	%l4
	movpos	%xcc,	%o3,	%l2
	stw	%l1,	[%l7 + 0x60]
loop_2018:
	orncc	%g5,	%g6,	%g2
	movne	%icc,	%o2,	%o6
	fnand	%f24,	%f0,	%f18
	edge8l	%o1,	%i6,	%i0
	fba	%fcc3,	loop_2019
	fmuld8sux16	%f21,	%f24,	%f4
	xorcc	%g3,	0x1369,	%l5
	fcmpne32	%f24,	%f14,	%o4
loop_2019:
	tneg	%icc,	0x2
	nop
	set	0x0A, %l5
	ldstub	[%l7 + %l5],	%g7
	fbe	%fcc3,	loop_2020
	fnot2	%f18,	%f22
	sdivcc	%l6,	0x1617,	%i7
	fsrc1	%f12,	%f0
loop_2020:
	sll	%i2,	%i3,	%o5
	fbul,a	%fcc2,	loop_2021
	andcc	%i4,	0x1E79,	%g1
	bvc	%xcc,	loop_2022
	brgz	%i5,	loop_2023
loop_2021:
	tgu	%xcc,	0x0
	movvs	%icc,	%l3,	%o0
loop_2022:
	fmul8x16au	%f5,	%f25,	%f26
loop_2023:
	movre	%g4,	0x2A4,	%i1
	smulcc	%l0,	%o7,	%l4
	fornot2	%f22,	%f2,	%f24
	addcc	%l2,	%l1,	%o3
	udivcc	%g5,	0x146A,	%g6
	prefetch	[%l7 + 0x48],	 0x1
	edge32	%o2,	%g2,	%o6
	fexpand	%f3,	%f0
	edge8n	%i6,	%o1,	%i0
	ldstub	[%l7 + 0x41],	%g3
	addc	%o4,	0x0402,	%l5
	movrne	%l6,	0x2C4,	%g7
	movn	%icc,	%i7,	%i2
	xnor	%i3,	0x142F,	%i4
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	sll	%g1,	%o5,	%i5
	ldub	[%l7 + 0x28],	%l3
	set	0x6C, %g2
	sta	%f18,	[%l7 + %g2] 0x89
	subccc	%g4,	0x14B0,	%i1
	tvs	%icc,	0x7
	movrgz	%o0,	0x0BC,	%o7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x11,	%l0,	%l4
	fcmpne32	%f24,	%f6,	%l1
	ta	%icc,	0x6
	fbn,a	%fcc0,	loop_2024
	edge16l	%o3,	%g5,	%l2
	fornot1	%f8,	%f0,	%f8
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
loop_2024:
	fmovs	%f16,	%f26
	fmul8x16al	%f17,	%f0,	%f28
	xorcc	%g2,	0x1CC9,	%o2
	fmovsle	%icc,	%f16,	%f8
	tleu	%xcc,	0x7
	and	%o6,	%o1,	%i0
	movgu	%xcc,	%g3,	%i6
	fbne	%fcc3,	loop_2025
	edge8	%o4,	%l5,	%g7
	umul	%i7,	0x0BAD,	%i2
	movrgez	%l6,	%i3,	%g1
loop_2025:
	xor	%i4,	%i5,	%l3
	fmovdcs	%icc,	%f27,	%f17
	xorcc	%o5,	0x0097,	%i1
	sdivcc	%g4,	0x0E46,	%o7
	ba,a,pn	%icc,	loop_2026
	fxor	%f4,	%f24,	%f24
	addc	%l0,	0x1E7E,	%o0
	call	loop_2027
loop_2026:
	array16	%l1,	%l4,	%o3
	alignaddrl	%l2,	%g6,	%g5
	ta	%xcc,	0x5
loop_2027:
	tneg	%xcc,	0x2
	brnz,a	%g2,	loop_2028
	fbug,a	%fcc3,	loop_2029
	std	%o6,	[%l7 + 0x20]
	fmovrdlez	%o1,	%f6,	%f24
loop_2028:
	orncc	%i0,	0x1E09,	%o2
loop_2029:
	fbn	%fcc1,	loop_2030
	bvc	%icc,	loop_2031
	movrgz	%g3,	%o4,	%i6
	lduh	[%l7 + 0x2C],	%g7
loop_2030:
	edge32ln	%l5,	%i2,	%l6
loop_2031:
	fmovdle	%icc,	%f23,	%f13
	fmovrse	%i7,	%f7,	%f26
	fmovdge	%xcc,	%f3,	%f25
	ldd	[%l7 + 0x60],	%g0
	bleu,a	loop_2032
	edge32	%i3,	%i5,	%l3
	fmovsg	%icc,	%f7,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2032:
	fcmpd	%fcc1,	%f14,	%f22
	tle	%icc,	0x4
	movle	%icc,	%i4,	%i1
	fpadd16	%f28,	%f14,	%f22
	lduw	[%l7 + 0x0C],	%o5
	movn	%xcc,	%o7,	%g4
	bcs,pn	%icc,	loop_2033
	umulcc	%o0,	0x1608,	%l0
	tsubcc	%l4,	%o3,	%l1
	xorcc	%l2,	%g6,	%g2
loop_2033:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x28] %asi,	%o6
	taddcctv	%o1,	0x172F,	%i0
	fcmpeq16	%f16,	%f10,	%g5
	fmovse	%xcc,	%f21,	%f15
	xnor	%o2,	0x09A7,	%g3
	srax	%i6,	0x04,	%o4
	tcc	%icc,	0x2
	ld	[%l7 + 0x5C],	%f8
	fandnot1	%f0,	%f12,	%f12
	fpackfix	%f24,	%f24
	fble,a	%fcc2,	loop_2034
	nop
	setx	loop_2035,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movgu	%icc,	%g7,	%i2
	mulx	%l5,	%i7,	%l6
loop_2034:
	sub	%g1,	0x0991,	%i3
loop_2035:
	movg	%icc,	%i5,	%l3
	fcmpes	%fcc2,	%f27,	%f13
	te	%icc,	0x1
	lduw	[%l7 + 0x20],	%i1
	brlez,a	%i4,	loop_2036
	taddcc	%o7,	0x1972,	%o5
	subccc	%o0,	0x0BB7,	%g4
	ldx	[%l7 + 0x28],	%l0
loop_2036:
	move	%xcc,	%o3,	%l1
	fxor	%f24,	%f30,	%f10
	bpos	%icc,	loop_2037
	fpmerge	%f20,	%f26,	%f14
	call	loop_2038
	tgu	%icc,	0x4
loop_2037:
	ldsw	[%l7 + 0x40],	%l2
	andn	%l4,	0x03F5,	%g2
loop_2038:
	andn	%o6,	%o1,	%i0
	popc	0x175E,	%g6
	bn,pn	%icc,	loop_2039
	movcc	%icc,	%g5,	%o2
	wr	%g0,	0x88,	%asi
	sta	%f31,	[%l7 + 0x18] %asi
loop_2039:
	sub	%i6,	0x045D,	%o4
	or	%g7,	%g3,	%i2
	fbg	%fcc3,	loop_2040
	xnor	%i7,	%l5,	%g1
	movg	%xcc,	%i3,	%l6
	ldd	[%l7 + 0x48],	%i4
loop_2040:
	alignaddrl	%l3,	%i1,	%o7
	subcc	%i4,	%o5,	%o0
	edge16ln	%l0,	%o3,	%g4
	fcmpeq16	%f30,	%f18,	%l2
	movle	%icc,	%l4,	%l1
	flush	%l7 + 0x54
	be,a,pn	%xcc,	loop_2041
	fxor	%f10,	%f20,	%f18
	movne	%xcc,	%o6,	%g2
	bl,a	loop_2042
loop_2041:
	fmovsa	%xcc,	%f7,	%f22
	orncc	%o1,	0x1324,	%i0
	nop
	set	0x08, %l2
	lduw	[%l7 + %l2],	%g6
loop_2042:
	sllx	%g5,	0x0A,	%i6
	movrgz	%o2,	%g7,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x7
	fbe	%fcc0,	loop_2043
	movcs	%icc,	%o4,	%i2
	mulscc	%i7,	0x0E38,	%g1
	edge32ln	%i3,	%l6,	%l5
loop_2043:
	nop
	wr	%g0,	0x2f,	%asi
	stda	%i4,	[%l7 + 0x20] %asi
	membar	#Sync
	udivcc	%l3,	0x0A4B,	%o7
	sir	0x1A8F
	umul	%i1,	0x04D5,	%o5
	addcc	%o0,	%l0,	%o3
	subcc	%i4,	0x1E0E,	%g4
	tvc	%icc,	0x6
	movg	%icc,	%l4,	%l1
	sll	%o6,	0x14,	%g2
	ba,a	loop_2044
	orncc	%o1,	%l2,	%g6
	fmovdgu	%xcc,	%f1,	%f6
	bg,a	%icc,	loop_2045
loop_2044:
	movpos	%icc,	%i0,	%g5
	sra	%i6,	0x0D,	%o2
	ldd	[%l7 + 0x10],	%g6
loop_2045:
	subccc	%o4,	0x18E7,	%i2
	tn	%icc,	0x2
	brnz	%g3,	loop_2046
	brlez	%i7,	loop_2047
	subc	%i3,	0x0513,	%g1
	movvs	%xcc,	%l6,	%i5
loop_2046:
	nop
	set	0x0A, %o4
	stha	%l5,	[%l7 + %o4] 0xeb
	membar	#Sync
loop_2047:
	nop
	set	0x398, %o6
	nop 	! 	stxa	%o7,	[%g0 + %o6] 0x40 ripped by fixASI40.pl
	movne	%xcc,	%l3,	%o5
	addcc	%o0,	0x0883,	%i1
	wr	%g0,	0x0c,	%asi
	stxa	%o3,	[%l7 + 0x50] %asi
	fxors	%f5,	%f3,	%f9
	pdist	%f30,	%f30,	%f6
	fpack32	%f10,	%f30,	%f4
	sdiv	%i4,	0x15C7,	%g4
	fmovscs	%xcc,	%f20,	%f13
	fmul8sux16	%f22,	%f0,	%f14
	tle	%xcc,	0x3
	ta	%xcc,	0x6
	addcc	%l0,	%l1,	%o6
	sub	%l4,	%o1,	%l2
	edge32n	%g6,	%i0,	%g5
	fpadd16	%f10,	%f12,	%f8
	andn	%g2,	0x1970,	%o2
	bne,a	loop_2048
	swap	[%l7 + 0x54],	%i6
	movvc	%icc,	%o4,	%i2
	umul	%g3,	%g7,	%i7
loop_2048:
	ldx	[%l7 + 0x50],	%i3
	movrlz	%l6,	%i5,	%l5
	addcc	%g1,	0x0A97,	%l3
	fcmpne32	%f8,	%f4,	%o7
	sethi	0x1ED2,	%o0
	orn	%i1,	0x0BB0,	%o5
	edge8n	%o3,	%i4,	%g4
	tgu	%icc,	0x3
	addccc	%l0,	0x0330,	%o6
	ldub	[%l7 + 0x42],	%l1
	sth	%l4,	[%l7 + 0x6A]
	fones	%f16
	nop
	setx	loop_2049,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movneg	%xcc,	%o1,	%g6
	sir	0x0FC0
	fble	%fcc0,	loop_2050
loop_2049:
	fcmpeq16	%f24,	%f10,	%i0
	edge8ln	%l2,	%g2,	%g5
	movge	%xcc,	%o2,	%i6
loop_2050:
	tsubcctv	%o4,	0x032E,	%g3
	fbe	%fcc1,	loop_2051
	fnot2	%f8,	%f28
	udivcc	%i2,	0x1AF4,	%g7
	stx	%i7,	[%l7 + 0x18]
loop_2051:
	brgez,a	%i3,	loop_2052
	fmovrdlez	%i5,	%f14,	%f24
	fnot2	%f0,	%f14
	fmovdneg	%xcc,	%f2,	%f23
loop_2052:
	fmovrsgz	%l6,	%f1,	%f29
	alignaddrl	%l5,	%l3,	%g1
	orncc	%o0,	0x1054,	%i1
	fzeros	%f7
	fornot2s	%f23,	%f2,	%f6
	edge8ln	%o7,	%o5,	%i4
	edge16n	%o3,	%g4,	%o6
	edge32n	%l1,	%l0,	%o1
	movcs	%xcc,	%g6,	%l4
	edge8n	%i0,	%g2,	%g5
	taddcc	%o2,	%l2,	%i6
	subccc	%o4,	0x166D,	%i2
	brgez,a	%g7,	loop_2053
	fmovsne	%icc,	%f10,	%f0
	fmovscc	%xcc,	%f4,	%f11
	fbg,a	%fcc0,	loop_2054
loop_2053:
	fcmps	%fcc2,	%f29,	%f30
	edge16ln	%i7,	%i3,	%i5
	tpos	%xcc,	0x7
loop_2054:
	nop
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%l6
	udivcc	%l5,	0x19E1,	%g3
	smulcc	%l3,	%g1,	%i1
	edge32	%o0,	%o7,	%o5
	umulcc	%o3,	%g4,	%o6
	stb	%i4,	[%l7 + 0x58]
	fmovsneg	%xcc,	%f16,	%f29
	edge32l	%l0,	%l1,	%o1
	bg,a,pt	%icc,	loop_2055
	movpos	%xcc,	%g6,	%l4
	mova	%icc,	%i0,	%g5
	fbg,a	%fcc3,	loop_2056
loop_2055:
	smulcc	%g2,	%l2,	%o2
	movneg	%xcc,	%i6,	%o4
	ldx	[%l7 + 0x18],	%g7
loop_2056:
	andn	%i7,	0x1ED2,	%i2
	edge32ln	%i5,	%l6,	%i3
	fmovscs	%icc,	%f8,	%f29
	fones	%f27
	fmovsle	%xcc,	%f0,	%f15
	sir	0x1825
	fbne	%fcc0,	loop_2057
	ble,pn	%xcc,	loop_2058
	and	%l5,	0x0526,	%l3
	fxnor	%f0,	%f24,	%f30
loop_2057:
	sllx	%g3,	%i1,	%g1
loop_2058:
	edge8n	%o0,	%o5,	%o7
	smulcc	%o3,	0x1072,	%o6
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x12] %asi,	%g4
	movpos	%xcc,	%i4,	%l0
	alignaddrl	%l1,	%g6,	%l4
	addcc	%i0,	0x1E13,	%g5
	orn	%o1,	%l2,	%o2
	sra	%g2,	0x05,	%i6
	fnot1	%f30,	%f10
	tpos	%xcc,	0x1
	fors	%f12,	%f9,	%f9
	fmovdcs	%icc,	%f30,	%f31
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g7,	%i7
	brlz,a	%o4,	loop_2059
	fnegs	%f19,	%f22
	fbn	%fcc1,	loop_2060
	membar	0x32
loop_2059:
	nop
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i2,	%i5
loop_2060:
	fmovsgu	%xcc,	%f10,	%f23
	orn	%l6,	0x0A12,	%i3
	nop
	setx loop_2061, %l0, %l1
	jmpl %l1, %l3
	tg	%icc,	0x2
	bn,a	%icc,	loop_2062
	smul	%l5,	%g3,	%g1
loop_2061:
	fpadd32	%f4,	%f30,	%f10
	bne,a	loop_2063
loop_2062:
	call	loop_2064
	edge8n	%i1,	%o5,	%o7
	fpadd16s	%f26,	%f22,	%f8
loop_2063:
	fpadd32	%f18,	%f30,	%f24
loop_2064:
	siam	0x1
	fmovs	%f21,	%f29
	addc	%o0,	%o6,	%o3
	fbn,a	%fcc0,	loop_2065
	mulscc	%g4,	0x0AB8,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0EF5,	%i4
loop_2065:
	fcmpes	%fcc1,	%f15,	%f14
	fxor	%f18,	%f30,	%f12
	sdiv	%l1,	0x0D67,	%g6
	fbue	%fcc0,	loop_2066
	bshuffle	%f8,	%f30,	%f18
	edge32ln	%l4,	%i0,	%g5
	brlz,a	%l2,	loop_2067
loop_2066:
	movpos	%icc,	%o1,	%o2
	bcs	%icc,	loop_2068
	fcmpeq32	%f18,	%f14,	%i6
loop_2067:
	std	%g2,	[%l7 + 0x68]
	orcc	%i7,	0x09A2,	%g7
loop_2068:
	tl	%xcc,	0x0
	stw	%i2,	[%l7 + 0x50]
	fbo,a	%fcc3,	loop_2069
	udiv	%o4,	0x163D,	%l6
	ba,pn	%icc,	loop_2070
	movvs	%xcc,	%i5,	%i3
loop_2069:
	movrgez	%l5,	0x265,	%l3
	movrlez	%g3,	0x30C,	%g1
loop_2070:
	or	%i1,	%o7,	%o0
	fbe,a	%fcc3,	loop_2071
	nop
	set	0x70, %g5
	ldsw	[%l7 + %g5],	%o5
	tpos	%icc,	0x2
	stx	%o6,	[%l7 + 0x60]
loop_2071:
	tl	%icc,	0x6
	brz,a	%o3,	loop_2072
	fbl,a	%fcc2,	loop_2073
	orn	%g4,	0x018B,	%i4
	st	%f18,	[%l7 + 0x40]
loop_2072:
	nop
	setx	loop_2074,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2073:
	edge32n	%l1,	%l0,	%l4
	ldub	[%l7 + 0x7F],	%g6
	fmovdcc	%icc,	%f13,	%f1
loop_2074:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i0,	0x1DF9,	%g5
	subcc	%l2,	0x07CF,	%o1
	stx	%o2,	[%l7 + 0x10]
	smul	%g2,	0x08B1,	%i6
	andn	%i7,	%i2,	%g7
	set	0x40, %i0
	stwa	%o4,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x0A, %l0
	lduha	[%l7 + %l0] 0x10,	%l6
	sethi	0x000A,	%i5
	fbl	%fcc3,	loop_2075
	tpos	%icc,	0x6
	fnor	%f20,	%f28,	%f14
	edge32n	%i3,	%l3,	%g3
loop_2075:
	stw	%l5,	[%l7 + 0x10]
	udivcc	%g1,	0x0BD0,	%i1
	srlx	%o7,	0x0C,	%o5
	movrne	%o0,	%o3,	%o6
	orcc	%g4,	0x069F,	%l1
	be	loop_2076
	tn	%icc,	0x6
	tcc	%icc,	0x7
	movre	%i4,	%l4,	%g6
loop_2076:
	ld	[%l7 + 0x08],	%f29
	edge32	%i0,	%l0,	%g5
	movn	%icc,	%o1,	%l2
	mulx	%o2,	%g2,	%i7
	sra	%i6,	0x0A,	%i2
	fcmpne32	%f24,	%f14,	%o4
	tsubcc	%l6,	%i5,	%i3
	movgu	%icc,	%g7,	%l3
	tneg	%xcc,	0x2
	array16	%g3,	%g1,	%l5
	and	%o7,	%o5,	%o0
	set	0x40, %l4
	stxa	%i1,	[%l7 + %l4] 0x80
	ldx	[%l7 + 0x20],	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o3,	%l1,	%g4
	tl	%xcc,	0x6
	edge8l	%i4,	%g6,	%l4
	movrgez	%i0,	%g5,	%l0
	fmovrde	%l2,	%f12,	%f12
	array8	%o2,	%g2,	%i7
	fsrc2s	%f19,	%f3
	umul	%i6,	0x0954,	%i2
	std	%f26,	[%l7 + 0x30]
	fbe	%fcc1,	loop_2077
	udivcc	%o1,	0x0C22,	%l6
	edge8	%i5,	%i3,	%o4
	set	0x5D, %i5
	ldstuba	[%l7 + %i5] 0x81,	%l3
loop_2077:
	taddcc	%g7,	0x0983,	%g1
	bvs,a,pn	%xcc,	loop_2078
	movleu	%icc,	%l5,	%o7
	set	0x62, %g6
	stha	%o5,	[%l7 + %g6] 0xe3
	membar	#Sync
loop_2078:
	tge	%xcc,	0x5
	fornot1s	%f16,	%f21,	%f0
	ldsh	[%l7 + 0x28],	%o0
	bcs,a,pn	%xcc,	loop_2079
	ldsw	[%l7 + 0x14],	%g3
	bvs,pt	%xcc,	loop_2080
	taddcctv	%i1,	%o3,	%o6
loop_2079:
	fbne,a	%fcc3,	loop_2081
	fbg	%fcc1,	loop_2082
loop_2080:
	movneg	%xcc,	%l1,	%i4
	bg	%icc,	loop_2083
loop_2081:
	nop
	set	0x52, %i2
	lduh	[%l7 + %i2],	%g4
loop_2082:
	fmovsge	%xcc,	%f15,	%f3
	edge32n	%g6,	%i0,	%g5
loop_2083:
	sethi	0x1BBE,	%l0
	mulscc	%l4,	0x10AD,	%o2
	ld	[%l7 + 0x2C],	%f31
	bge	loop_2084
	movpos	%xcc,	%g2,	%i7
	fmovsl	%icc,	%f13,	%f11
	movn	%icc,	%i6,	%i2
loop_2084:
	bpos	%xcc,	loop_2085
	lduh	[%l7 + 0x22],	%o1
	fbule,a	%fcc2,	loop_2086
	fmovsg	%icc,	%f25,	%f13
loop_2085:
	bcs,pn	%icc,	loop_2087
	movl	%icc,	%l2,	%l6
loop_2086:
	edge16ln	%i5,	%o4,	%l3
	andncc	%g7,	%i3,	%l5
loop_2087:
	sllx	%g1,	%o7,	%o5
	fmovrdlz	%g3,	%f8,	%f26
	fmovspos	%icc,	%f15,	%f1
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	sll	%o0,	%o3,	%l1
	tsubcctv	%i4,	0x069C,	%o6
	membar	0x3F
	edge16	%g6,	%g4,	%i0
	movg	%icc,	%g5,	%l0
	movle	%xcc,	%o2,	%l4
	andn	%g2,	0x0FA6,	%i7
	orncc	%i6,	0x0326,	%o1
	set	0x34, %i7
	swapa	[%l7 + %i7] 0x80,	%l2
	edge32	%l6,	%i2,	%i5
	fmovsvs	%xcc,	%f13,	%f5
	fbul,a	%fcc2,	loop_2088
	brgez,a	%l3,	loop_2089
	stx	%g7,	[%l7 + 0x48]
	bcs,a,pn	%icc,	loop_2090
loop_2088:
	tpos	%xcc,	0x0
loop_2089:
	xnorcc	%o4,	0x18CE,	%l5
	addccc	%g1,	%o7,	%o5
loop_2090:
	tvc	%icc,	0x2
	edge32	%i3,	%g3,	%o0
	orcc	%i1,	0x0815,	%l1
	tsubcctv	%i4,	%o6,	%g6
	fmovrsgez	%g4,	%f28,	%f13
	edge8	%o3,	%g5,	%l0
	brnz,a	%o2,	loop_2091
	addc	%l4,	0x058E,	%i0
	smul	%i7,	0x1CDA,	%i6
	fcmpgt32	%f14,	%f28,	%g2
loop_2091:
	edge16l	%o1,	%l2,	%i2
	addc	%i5,	%l6,	%l3
	fbg	%fcc3,	loop_2092
	fnors	%f28,	%f0,	%f1
	swap	[%l7 + 0x50],	%g7
	orcc	%o4,	0x0CF9,	%g1
loop_2092:
	fcmps	%fcc2,	%f20,	%f6
	subc	%o7,	%o5,	%l5
	bvs,pt	%xcc,	loop_2093
	edge32l	%i3,	%g3,	%i1
	fmovsleu	%icc,	%f7,	%f10
	tg	%xcc,	0x4
loop_2093:
	brnz	%o0,	loop_2094
	ba,a	loop_2095
	udivcc	%l1,	0x1CA5,	%i4
	bpos,a,pn	%xcc,	loop_2096
loop_2094:
	bcs,pt	%xcc,	loop_2097
loop_2095:
	movleu	%icc,	%g6,	%g4
	set	0x1E, %o5
	stha	%o6,	[%l7 + %o5] 0x10
loop_2096:
	movrlez	%o3,	%g5,	%l0
loop_2097:
	movne	%xcc,	%l4,	%o2
	and	%i0,	%i6,	%i7
	xorcc	%g2,	%l2,	%o1
	bpos	loop_2098
	fbule,a	%fcc1,	loop_2099
	subccc	%i5,	%l6,	%i2
	fmovrdgz	%g7,	%f16,	%f12
loop_2098:
	fxnor	%f14,	%f4,	%f6
loop_2099:
	fnands	%f10,	%f12,	%f17
	prefetch	[%l7 + 0x38],	 0x0
	subccc	%o4,	%g1,	%l3
	fmovrsgez	%o5,	%f8,	%f5
	xnorcc	%l5,	0x0E74,	%o7
	tn	%xcc,	0x3
	srlx	%g3,	0x08,	%i1
	xor	%i3,	0x0903,	%o0
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x50] %asi,	%i4
	edge8	%l1,	%g4,	%g6
	movrne	%o3,	0x06F,	%g5
	edge16l	%o6,	%l0,	%o2
	udivx	%l4,	0x06CF,	%i0
	movn	%xcc,	%i6,	%i7
	udiv	%l2,	0x0AF4,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i5,	%g2,	%l6
	mulx	%i2,	0x1E5E,	%g7
	tneg	%xcc,	0x4
	edge32n	%g1,	%l3,	%o4
	smulcc	%o5,	%o7,	%g3
	addc	%l5,	0x0065,	%i3
	array16	%o0,	%i4,	%l1
	bpos	loop_2100
	orncc	%i1,	%g6,	%o3
	set	0x4F, %l6
	ldstuba	[%l7 + %l6] 0x89,	%g5
loop_2100:
	edge32ln	%o6,	%l0,	%o2
	smul	%l4,	%g4,	%i0
	edge32n	%i6,	%i7,	%o1
	movcc	%icc,	%i5,	%g2
	tsubcctv	%l6,	%i2,	%l2
	tgu	%icc,	0x5
	tsubcc	%g1,	%l3,	%g7
	fcmple32	%f24,	%f6,	%o5
	movvs	%icc,	%o4,	%g3
	fpsub32	%f22,	%f4,	%f14
	ldsb	[%l7 + 0x7E],	%l5
	fbue	%fcc2,	loop_2101
	and	%i3,	%o0,	%i4
	movcs	%xcc,	%l1,	%i1
	addc	%g6,	0x11DD,	%o3
loop_2101:
	movpos	%xcc,	%g5,	%o7
	edge16l	%l0,	%o2,	%l4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%o6
	bn	loop_2102
	movne	%xcc,	%i0,	%i7
	add	%l7,	0x44,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%o1,	%i6
loop_2102:
	fmuld8ulx16	%f8,	%f23,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc3,	loop_2103
	xnor	%i5,	0x1D3B,	%l6
	edge8ln	%g2,	%l2,	%g1
	fbne	%fcc0,	loop_2104
loop_2103:
	fnor	%f16,	%f26,	%f12
	addccc	%i2,	0x1C35,	%g7
	smulcc	%o5,	%l3,	%o4
loop_2104:
	nop
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x08] %asi,	%g3
	tle	%xcc,	0x5
	fsrc1s	%f7,	%f26
	ble	%icc,	loop_2105
	fba	%fcc1,	loop_2106
	move	%icc,	%l5,	%o0
	movrgez	%i3,	0x04A,	%i4
loop_2105:
	fba	%fcc0,	loop_2107
loop_2106:
	andncc	%i1,	%l1,	%g6
	fandnot2s	%f21,	%f7,	%f29
	brnz,a	%o3,	loop_2108
loop_2107:
	fmovsne	%icc,	%f10,	%f20
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
loop_2108:
	udivx	%o7,	0x0ADD,	%l0
	brgez,a	%l4,	loop_2109
	movg	%xcc,	%g4,	%o2
	fpadd16	%f10,	%f24,	%f28
	andcc	%i0,	%i7,	%o1
loop_2109:
	nop
	set	0x68, %g1
	swapa	[%l7 + %g1] 0x80,	%i6
	movrlez	%o6,	0x26B,	%l6
	edge8ln	%i5,	%l2,	%g2
	ldsb	[%l7 + 0x51],	%i2
	bshuffle	%f4,	%f24,	%f8
	sdivcc	%g7,	0x1E7A,	%g1
	nop
	set	0x7A, %g7
	ldsh	[%l7 + %g7],	%o5
	bne,a,pn	%xcc,	loop_2110
	array32	%o4,	%l3,	%l5
	fmovrsne	%g3,	%f6,	%f10
	array32	%o0,	%i4,	%i1
loop_2110:
	nop
	set	0x40, %o0
	ldswa	[%l7 + %o0] 0x81,	%l1
	subc	%i3,	0x1EF4,	%g6
	orn	%o3,	%g5,	%l0
	and	%o7,	%g4,	%l4
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x62] %asi,	%i0
	udiv	%i7,	0x0981,	%o2
	fble,a	%fcc2,	loop_2111
	fmul8x16	%f0,	%f22,	%f22
	tl	%icc,	0x2
	sethi	0x1F08,	%o1
loop_2111:
	mulscc	%o6,	%i6,	%l6
	movvc	%icc,	%l2,	%g2
	sethi	0x08FF,	%i5
	xorcc	%g7,	%i2,	%o5
	faligndata	%f22,	%f8,	%f12
	set	0x38, %o3
	stda	%o4,	[%l7 + %o3] 0xe2
	membar	#Sync
	movre	%l3,	%g1,	%g3
	movcs	%icc,	%l5,	%i4
	fmovdcs	%icc,	%f31,	%f14
	edge16ln	%o0,	%l1,	%i1
	swap	[%l7 + 0x10],	%i3
	movle	%xcc,	%o3,	%g5
	alignaddrl	%g6,	%o7,	%g4
	and	%l4,	%l0,	%i7
	tsubcc	%i0,	0x0BC9,	%o2
	sdivcc	%o6,	0x10E1,	%i6
	taddcctv	%l6,	%l2,	%o1
	movl	%xcc,	%g2,	%g7
	ld	[%l7 + 0x4C],	%f27
	smul	%i5,	%i2,	%o4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%o5,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x6D],	%l3
	set	0x60, %o2
	stha	%g3,	[%l7 + %o2] 0xeb
	membar	#Sync
	mova	%icc,	%i4,	%o0
	orn	%l1,	%i1,	%i3
	movg	%icc,	%o3,	%l5
	ldd	[%l7 + 0x60],	%f4
	fbug,a	%fcc0,	loop_2112
	movrlz	%g5,	%g6,	%o7
	andcc	%g4,	%l0,	%l4
	mulscc	%i7,	0x0EEE,	%i0
loop_2112:
	brlez	%o2,	loop_2113
	fbuge,a	%fcc3,	loop_2114
	xor	%o6,	%i6,	%l6
	fandnot1	%f4,	%f2,	%f22
loop_2113:
	ldstub	[%l7 + 0x33],	%l2
loop_2114:
	fabsd	%f12,	%f14
	edge32n	%o1,	%g7,	%i5
	bvc,a,pn	%xcc,	loop_2115
	fandnot1	%f8,	%f4,	%f10
	faligndata	%f6,	%f4,	%f0
	edge8n	%g2,	%i2,	%o5
loop_2115:
	fmovsvs	%icc,	%f22,	%f25
	bvs	loop_2116
	tg	%xcc,	0x5
	fmovdg	%icc,	%f23,	%f27
	fbo,a	%fcc2,	loop_2117
loop_2116:
	fblg	%fcc1,	loop_2118
	sllx	%o4,	0x1C,	%l3
	fba	%fcc2,	loop_2119
loop_2117:
	movrgez	%g1,	0x311,	%i4
loop_2118:
	movle	%icc,	%g3,	%l1
	xorcc	%i1,	%o0,	%o3
loop_2119:
	movneg	%icc,	%l5,	%g5
	edge8	%i3,	%g6,	%o7
	addccc	%g4,	0x0FB1,	%l4
	fpsub32	%f6,	%f22,	%f14
	fmovrslez	%i7,	%f15,	%f13
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x58] %asi,	%l0
	fxnor	%f22,	%f14,	%f8
	movrgz	%i0,	%o6,	%o2
	fbuge,a	%fcc3,	loop_2120
	movne	%icc,	%l6,	%i6
	umulcc	%l2,	0x1F70,	%g7
	set	0x50, %g4
	lduha	[%l7 + %g4] 0x18,	%i5
loop_2120:
	fmovdcs	%icc,	%f14,	%f21
	fbuge	%fcc2,	loop_2121
	bneg,a,pn	%icc,	loop_2122
	sdivx	%o1,	0x09D4,	%g2
	xor	%o5,	0x0FAD,	%o4
loop_2121:
	prefetch	[%l7 + 0x68],	 0x2
loop_2122:
	and	%i2,	%g1,	%l3
	bneg,a	loop_2123
	tne	%xcc,	0x1
	fmovdle	%xcc,	%f12,	%f2
	stw	%i4,	[%l7 + 0x34]
loop_2123:
	addcc	%g3,	%i1,	%o0
	sdiv	%o3,	0x0126,	%l5
	xorcc	%g5,	%l1,	%i3
	xorcc	%g6,	%g4,	%o7
	udivcc	%l4,	0x081F,	%l0
	fcmps	%fcc2,	%f17,	%f17
	std	%i0,	[%l7 + 0x58]
	bn,pt	%xcc,	loop_2124
	move	%xcc,	%i7,	%o2
	bgu,a	loop_2125
	fxor	%f18,	%f6,	%f0
loop_2124:
	movle	%xcc,	%o6,	%l6
	tvs	%xcc,	0x3
loop_2125:
	edge16l	%i6,	%l2,	%g7
	orn	%o1,	%g2,	%o5
	fba,a	%fcc2,	loop_2126
	stx	%i5,	[%l7 + 0x70]
	brz,a	%o4,	loop_2127
	andcc	%g1,	0x0E43,	%l3
loop_2126:
	tleu	%xcc,	0x6
	srax	%i2,	0x06,	%i4
loop_2127:
	xor	%g3,	0x0C1A,	%i1
	edge16ln	%o3,	%l5,	%o0
	fba	%fcc2,	loop_2128
	fmovrsgz	%g5,	%f22,	%f10
	tsubcc	%l1,	%i3,	%g6
	fmovdcc	%xcc,	%f21,	%f9
loop_2128:
	for	%f10,	%f6,	%f0
	brlz,a	%g4,	loop_2129
	fbl	%fcc3,	loop_2130
	array32	%o7,	%l0,	%i0
	orcc	%i7,	0x10AF,	%l4
loop_2129:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2130:
	pdist	%f6,	%f10,	%f30
	ldx	[%l7 + 0x58],	%o6
	tvc	%xcc,	0x1
	add	%l6,	0x13F0,	%o2
	ldsb	[%l7 + 0x5B],	%l2
	st	%f23,	[%l7 + 0x4C]
	set	0x60, %i6
	prefetcha	[%l7 + %i6] 0x80,	 0x2
	stbar
	bge	%xcc,	loop_2131
	flush	%l7 + 0x18
	umulcc	%g7,	%o1,	%o5
	movvs	%xcc,	%g2,	%o4
loop_2131:
	fmovsn	%xcc,	%f26,	%f11
	andncc	%g1,	%i5,	%i2
	bgu,a,pn	%xcc,	loop_2132
	sub	%i4,	%g3,	%l3
	movgu	%xcc,	%i1,	%l5
	movg	%xcc,	%o0,	%g5
loop_2132:
	sethi	0x0891,	%l1
	tvc	%icc,	0x2
	fexpand	%f7,	%f4
	array8	%i3,	%g6,	%g4
	tsubcctv	%o7,	0x190E,	%l0
	tgu	%icc,	0x5
	fcmpes	%fcc0,	%f22,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%o3,	%i0
	fxnor	%f10,	%f4,	%f22
	xorcc	%l4,	%i7,	%l6
	fmuld8sux16	%f17,	%f3,	%f6
	movl	%icc,	%o2,	%l2
	brnz	%o6,	loop_2133
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%i6,	%g7
	mulx	%o1,	0x1555,	%o5
loop_2133:
	umulcc	%g2,	%o4,	%g1
	movg	%icc,	%i2,	%i4
	edge32	%g3,	%l3,	%i5
	mulx	%i1,	%o0,	%g5
	edge32	%l5,	%l1,	%g6
	bvs,a,pt	%icc,	loop_2134
	prefetch	[%l7 + 0x5C],	 0x2
	movpos	%xcc,	%i3,	%g4
	fmovsne	%icc,	%f6,	%f16
loop_2134:
	bg	%icc,	loop_2135
	array32	%l0,	%o3,	%i0
	umul	%l4,	0x174E,	%i7
	nop
	set	0x20, %g3
	ldstub	[%l7 + %g3],	%o7
loop_2135:
	tle	%icc,	0x0
	fmovs	%f6,	%f29
	tcc	%icc,	0x0
	wr	%g0,	0x88,	%asi
	sta	%f2,	[%l7 + 0x4C] %asi
	fba	%fcc1,	loop_2136
	fnor	%f30,	%f24,	%f16
	udivcc	%l6,	0x1605,	%o2
	edge32	%l2,	%o6,	%i6
loop_2136:
	movvs	%icc,	%g7,	%o5
	edge16n	%g2,	%o1,	%o4
	wr	%g0,	0x2a,	%asi
	stda	%g0,	[%l7 + 0x18] %asi
	membar	#Sync
	umulcc	%i2,	%i4,	%g3
	tne	%icc,	0x6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x10,	%i5,	%l3
	movrlz	%i1,	0x376,	%o0
	tge	%icc,	0x0
	umul	%l5,	%g5,	%g6
	brnz	%i3,	loop_2137
	move	%xcc,	%g4,	%l0
	fornot1	%f12,	%f10,	%f30
	brnz,a	%o3,	loop_2138
loop_2137:
	brlz,a	%l1,	loop_2139
	tneg	%xcc,	0x6
	movneg	%icc,	%i0,	%l4
loop_2138:
	nop
	set	0x48, %i4
	lda	[%l7 + %i4] 0x81,	%f22
loop_2139:
	sth	%i7,	[%l7 + 0x24]
	xorcc	%l6,	0x16B7,	%o2
	edge32	%o7,	%l2,	%o6
	tge	%xcc,	0x7
	fcmpgt16	%f12,	%f4,	%g7
	fpadd16s	%f0,	%f21,	%f25
	orn	%i6,	0x014A,	%o5
	call	loop_2140
	andncc	%g2,	%o1,	%g1
	fornot2	%f20,	%f22,	%f0
	ble	loop_2141
loop_2140:
	fxors	%f19,	%f24,	%f11
	ldx	[%l7 + 0x10],	%o4
	sll	%i2,	0x1D,	%g3
loop_2141:
	sdiv	%i5,	0x0A53,	%l3
	fmovscc	%xcc,	%f17,	%f11
	alignaddrl	%i4,	%o0,	%l5
	brgz,a	%i1,	loop_2142
	fbl	%fcc0,	loop_2143
	tpos	%xcc,	0x6
	ldstub	[%l7 + 0x5B],	%g6
loop_2142:
	fandnot2	%f6,	%f2,	%f2
loop_2143:
	sdivcc	%i3,	0x10AB,	%g5
	brnz	%g4,	loop_2144
	fmovdne	%xcc,	%f31,	%f5
	brgz	%l0,	loop_2145
	array8	%o3,	%i0,	%l1
loop_2144:
	fmovsle	%icc,	%f30,	%f16
	edge32ln	%i7,	%l6,	%o2
loop_2145:
	ldub	[%l7 + 0x33],	%l4
	tsubcctv	%o7,	0x0640,	%o6
	edge32n	%l2,	%g7,	%i6
	edge32ln	%o5,	%g2,	%o1
	fmovda	%xcc,	%f31,	%f3
	movleu	%icc,	%g1,	%o4
	array32	%g3,	%i2,	%l3
	set	0x20, %l3
	lda	[%l7 + %l3] 0x11,	%f11
	movleu	%xcc,	%i5,	%i4
	umul	%l5,	%o0,	%i1
	tleu	%icc,	0x1
	fcmple16	%f16,	%f8,	%i3
	addc	%g5,	%g4,	%l0
	taddcctv	%o3,	%g6,	%i0
	flush	%l7 + 0x74
	xor	%i7,	%l1,	%l6
	xnor	%o2,	%l4,	%o6
	edge8n	%l2,	%g7,	%i6
	fbu	%fcc3,	loop_2146
	xnor	%o5,	0x1ED4,	%o7
	sllx	%g2,	%g1,	%o4
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x0c,	%f0
loop_2146:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x28] %asi,	%g3
	tn	%xcc,	0x3
	andn	%o1,	%i2,	%i5
	or	%l3,	%l5,	%o0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%i3
	tneg	%icc,	0x4
	bge,a,pn	%xcc,	loop_2147
	move	%xcc,	%g5,	%g4
	fmovdvs	%xcc,	%f22,	%f21
	movvs	%icc,	%l0,	%o3
loop_2147:
	sub	%g6,	0x0065,	%i0
	bvc,a,pt	%xcc,	loop_2148
	tpos	%xcc,	0x7
	fmul8x16al	%f29,	%f4,	%f2
	sdivcc	%i7,	0x1B84,	%l1
loop_2148:
	fsrc1s	%f29,	%f4
	fpadd32	%f18,	%f2,	%f2
	andn	%i4,	0x1D7C,	%o2
	ldsh	[%l7 + 0x7E],	%l6
	fmovdleu	%xcc,	%f30,	%f25
	movrne	%o6,	0x189,	%l4
	nop
	set	0x48, %l1
	ldx	[%l7 + %l1],	%g7
	edge16l	%i6,	%o5,	%o7
	fmovsa	%icc,	%f26,	%f15
	fmovdl	%icc,	%f14,	%f23
	sub	%l2,	0x1DDA,	%g1
	tcc	%icc,	0x7
	and	%g2,	%g3,	%o1
	movrgez	%o4,	%i5,	%l3
	fnot2	%f14,	%f8
	movcs	%icc,	%l5,	%i2
	set	0x78, %o1
	ldxa	[%l7 + %o1] 0x80,	%i1
	fcmpne16	%f0,	%f8,	%i3
	add	%o0,	%g5,	%l0
	bn,a	%icc,	loop_2149
	fbn,a	%fcc0,	loop_2150
	tge	%xcc,	0x0
	fbn,a	%fcc2,	loop_2151
loop_2149:
	fmovrdgz	%o3,	%f20,	%f8
loop_2150:
	array8	%g4,	%g6,	%i7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x0F] %asi,	%l1
loop_2151:
	tl	%icc,	0x3
	udiv	%i4,	0x0D51,	%o2
	fcmpeq32	%f12,	%f4,	%l6
	fmovdle	%icc,	%f9,	%f12
	movneg	%xcc,	%i0,	%l4
	edge16ln	%o6,	%g7,	%i6
	tcc	%icc,	0x4
	fmovsvc	%icc,	%f29,	%f22
	umul	%o5,	0x0813,	%o7
	brlez,a	%l2,	loop_2152
	movleu	%icc,	%g1,	%g3
	udivcc	%o1,	0x008F,	%o4
	mulx	%i5,	0x1FAE,	%g2
loop_2152:
	fbo	%fcc1,	loop_2153
	movcs	%xcc,	%l3,	%l5
	fmovrdgz	%i1,	%f28,	%f26
	sir	0x10A6
loop_2153:
	nop
	set	0x17, %i3
	stba	%i2,	[%l7 + %i3] 0xeb
	membar	#Sync
	fmovdge	%icc,	%f30,	%f19
	edge32ln	%o0,	%g5,	%l0
	movvc	%icc,	%o3,	%i3
	taddcc	%g4,	0x0791,	%i7
	umulcc	%g6,	%l1,	%i4
	fmovdn	%icc,	%f18,	%f22
	membar	0x7F
	srlx	%l6,	0x04,	%i0
	fmovdpos	%xcc,	%f26,	%f21
	set	0x64, %l5
	ldswa	[%l7 + %l5] 0x0c,	%l4
	array8	%o6,	%o2,	%g7
	tne	%icc,	0x1
	lduw	[%l7 + 0x2C],	%o5
	udiv	%o7,	0x1BF7,	%l2
	movcc	%xcc,	%g1,	%i6
	orcc	%o1,	0x01AF,	%g3
	alignaddr	%i5,	%g2,	%l3
	edge16l	%o4,	%l5,	%i2
	movvc	%icc,	%i1,	%o0
	subc	%g5,	%o3,	%i3
	brgez,a	%l0,	loop_2154
	fsrc1s	%f31,	%f21
	movpos	%xcc,	%g4,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2154:
	nop
	setx	loop_2155,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%l1,	%g6,	%l6
	fbl,a	%fcc0,	loop_2156
	edge16l	%i0,	%l4,	%o6
loop_2155:
	edge16	%o2,	%i4,	%o5
	brlz	%o7,	loop_2157
loop_2156:
	sdivcc	%g7,	0x026D,	%l2
	umulcc	%i6,	0x1D42,	%g1
	xorcc	%o1,	0x0F65,	%i5
loop_2157:
	tneg	%icc,	0x5
	fsrc1s	%f30,	%f2
	movrlz	%g2,	%l3,	%o4
	fbe,a	%fcc0,	loop_2158
	movn	%xcc,	%g3,	%i2
	tneg	%icc,	0x1
	fpsub32s	%f0,	%f23,	%f6
loop_2158:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	fabss	%f13,	%f29
	tneg	%xcc,	0x2
	fabss	%f7,	%f30
	movleu	%icc,	%o0,	%i1
	bge	%xcc,	loop_2159
	movn	%xcc,	%o3,	%g5
	bpos,a,pn	%xcc,	loop_2160
	movge	%xcc,	%i3,	%g4
loop_2159:
	ldsw	[%l7 + 0x64],	%l0
	sdiv	%l1,	0x16CD,	%g6
loop_2160:
	fbl	%fcc3,	loop_2161
	fbue,a	%fcc2,	loop_2162
	pdist	%f20,	%f24,	%f22
	fmovsne	%xcc,	%f3,	%f15
loop_2161:
	nop
	setx loop_2163, %l0, %l1
	jmpl %l1, %l6
loop_2162:
	taddcc	%i7,	0x04A7,	%l4
	fnot1s	%f22,	%f6
	movvs	%icc,	%i0,	%o6
loop_2163:
	fmovsgu	%icc,	%f12,	%f27
	fbl	%fcc0,	loop_2164
	movpos	%xcc,	%i4,	%o2
	fbge,a	%fcc2,	loop_2165
	fmovdneg	%xcc,	%f14,	%f14
loop_2164:
	fmovrdlz	%o5,	%f22,	%f2
	tne	%icc,	0x0
loop_2165:
	bleu,pt	%icc,	loop_2166
	ldx	[%l7 + 0x30],	%g7
	sll	%o7,	0x0C,	%l2
	tcc	%icc,	0x3
loop_2166:
	movvc	%icc,	%g1,	%i6
	fmovsgu	%icc,	%f8,	%f22
	orn	%o1,	0x123F,	%g2
	edge8ln	%l3,	%o4,	%g3
	taddcc	%i5,	0x09C7,	%l5
	movl	%icc,	%o0,	%i2
	sub	%i1,	0x0733,	%g5
	tsubcc	%i3,	0x1F61,	%g4
	bpos,a	loop_2167
	tcc	%xcc,	0x7
	movre	%o3,	0x359,	%l0
	sub	%g6,	0x077C,	%l6
loop_2167:
	smulcc	%i7,	0x122B,	%l1
	edge8n	%l4,	%o6,	%i4
	edge8	%i0,	%o5,	%o2
	xnorcc	%g7,	0x094F,	%o7
	or	%l2,	0x189C,	%i6
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x57] %asi,	%g1
	smulcc	%o1,	0x0300,	%g2
	fblg	%fcc3,	loop_2168
	umulcc	%o4,	%l3,	%g3
	be	loop_2169
	sll	%i5,	%o0,	%i2
loop_2168:
	brlez	%l5,	loop_2170
	fones	%f4
loop_2169:
	fcmped	%fcc2,	%f4,	%f4
	stx	%i1,	[%l7 + 0x18]
loop_2170:
	fble,a	%fcc2,	loop_2171
	ta	%xcc,	0x2
	tcc	%icc,	0x4
	edge16l	%g5,	%i3,	%o3
loop_2171:
	bvc,a,pt	%xcc,	loop_2172
	udiv	%l0,	0x1E83,	%g4
	sethi	0x11FC,	%g6
	movne	%icc,	%l6,	%l1
loop_2172:
	ble,pn	%icc,	loop_2173
	fpadd16	%f20,	%f6,	%f2
	fmovscs	%xcc,	%f27,	%f27
	faligndata	%f22,	%f2,	%f30
loop_2173:
	swap	[%l7 + 0x70],	%l4
	fpackfix	%f20,	%f11
	addcc	%i7,	%i4,	%i0
	umul	%o6,	%o5,	%o2
	movrne	%o7,	0x2D1,	%g7
	bcs,a	%icc,	loop_2174
	smulcc	%i6,	%l2,	%o1
	edge16l	%g2,	%o4,	%l3
	tn	%icc,	0x0
loop_2174:
	orn	%g3,	0x1F46,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f20,	%f28,	%f8
	bleu	%icc,	loop_2175
	edge8ln	%o0,	%i5,	%i2
	brnz	%l5,	loop_2176
	fmovrdlz	%g5,	%f2,	%f8
loop_2175:
	membar	0x42
	fmovse	%xcc,	%f17,	%f20
loop_2176:
	ldd	[%l7 + 0x78],	%i2
	sllx	%o3,	0x18,	%l0
	taddcctv	%i1,	%g4,	%g6
	fpsub16s	%f26,	%f5,	%f25
	andncc	%l1,	%l4,	%l6
	alignaddr	%i4,	%i0,	%o6
	alignaddrl	%i7,	%o2,	%o5
	movrgz	%g7,	0x220,	%o7
	movne	%icc,	%i6,	%o1
	brnz	%l2,	loop_2177
	movgu	%icc,	%o4,	%g2
	set	0x54, %o7
	sta	%f23,	[%l7 + %o7] 0x80
loop_2177:
	tcc	%icc,	0x1
	fornot1s	%f18,	%f8,	%f12
	andcc	%g3,	0x0600,	%l3
	tne	%icc,	0x4
	brgez,a	%o0,	loop_2178
	taddcc	%g1,	0x153E,	%i2
	fandnot2s	%f20,	%f29,	%f21
	movneg	%xcc,	%l5,	%g5
loop_2178:
	tvc	%icc,	0x7
	tvc	%icc,	0x4
	sra	%i5,	%o3,	%l0
	bneg	loop_2179
	edge16l	%i1,	%i3,	%g6
	bneg,pt	%xcc,	loop_2180
	fbge	%fcc1,	loop_2181
loop_2179:
	ta	%icc,	0x7
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2180:
	bne,a,pn	%xcc,	loop_2182
loop_2181:
	faligndata	%f22,	%f18,	%f26
	fones	%f11
	sdivx	%g4,	0x1181,	%l1
loop_2182:
	fcmped	%fcc2,	%f26,	%f22
	movneg	%icc,	%l4,	%i4
	movrne	%l6,	0x2FA,	%o6
	ldsw	[%l7 + 0x24],	%i0
	taddcc	%o2,	%i7,	%o5
	sir	0x1E13
	bne,a,pt	%icc,	loop_2183
	fmovspos	%icc,	%f20,	%f28
	movneg	%icc,	%o7,	%g7
	edge16	%o1,	%i6,	%o4
loop_2183:
	fmovdn	%xcc,	%f15,	%f15
	bne,a	loop_2184
	brgz	%l2,	loop_2185
	subcc	%g3,	0x043C,	%l3
	fbne	%fcc3,	loop_2186
loop_2184:
	siam	0x0
loop_2185:
	umul	%g2,	%g1,	%i2
	bcc,pn	%xcc,	loop_2187
loop_2186:
	edge8ln	%o0,	%l5,	%i5
	tcc	%xcc,	0x1
	fpsub32s	%f20,	%f18,	%f10
loop_2187:
	fmovs	%f8,	%f10
	or	%g5,	0x0D79,	%o3
	ldub	[%l7 + 0x4B],	%i1
	fnegs	%f11,	%f30
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x29] %asi,	%l0
	tle	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x24],	%g6
	orn	%g4,	0x16DF,	%l1
	lduh	[%l7 + 0x4E],	%i3
	edge32l	%i4,	%l4,	%l6
	fmovdcc	%xcc,	%f23,	%f24
	movgu	%icc,	%i0,	%o6
	sdiv	%o2,	0x1444,	%i7
	movneg	%icc,	%o5,	%o7
	edge16n	%g7,	%i6,	%o1
	sll	%l2,	0x04,	%o4
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x54] %asi,	%g3
	tg	%icc,	0x7
	tge	%icc,	0x3
	udivx	%g2,	0x1E79,	%l3
	fnegs	%f24,	%f11
	addc	%i2,	0x0816,	%o0
	orncc	%l5,	0x1A68,	%i5
	subccc	%g1,	0x0662,	%g5
	fble,a	%fcc3,	loop_2188
	fble,a	%fcc0,	loop_2189
	movl	%icc,	%i1,	%o3
	udiv	%g6,	0x00FF,	%l0
loop_2188:
	fcmpgt16	%f20,	%f30,	%g4
loop_2189:
	fpadd16s	%f18,	%f22,	%f9
	for	%f30,	%f14,	%f26
	tleu	%xcc,	0x0
	movrgez	%i3,	%i4,	%l4
	tsubcc	%l1,	%l6,	%o6
	movrlez	%o2,	0x221,	%i0
	movgu	%xcc,	%i7,	%o7
	bgu	loop_2190
	bneg,a,pn	%icc,	loop_2191
	bleu	%icc,	loop_2192
	fmovdn	%icc,	%f18,	%f27
loop_2190:
	array16	%o5,	%i6,	%g7
loop_2191:
	tge	%icc,	0x2
loop_2192:
	ldsh	[%l7 + 0x30],	%o1
	andn	%l2,	%o4,	%g3
	movcs	%icc,	%l3,	%g2
	flush	%l7 + 0x34
	be,a,pt	%icc,	loop_2193
	movrgz	%o0,	0x31D,	%i2
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%l5
loop_2193:
	sllx	%i5,	%g5,	%i1
	movpos	%xcc,	%o3,	%g1
	taddcctv	%l0,	0x008B,	%g6
	fcmpeq32	%f24,	%f20,	%g4
	addc	%i3,	0x08C4,	%l4
	edge16ln	%i4,	%l1,	%l6
	fcmps	%fcc0,	%f4,	%f13
	movrgz	%o2,	0x041,	%o6
	add	%i0,	%i7,	%o7
	edge16ln	%i6,	%o5,	%g7
	tcs	%icc,	0x3
	fbe,a	%fcc2,	loop_2194
	array16	%o1,	%l2,	%g3
	udiv	%l3,	0x1C84,	%g2
	brlz,a	%o0,	loop_2195
loop_2194:
	array8	%o4,	%l5,	%i5
	fbug	%fcc1,	loop_2196
	tpos	%icc,	0x3
loop_2195:
	fabss	%f23,	%f1
	movneg	%xcc,	%i2,	%i1
loop_2196:
	edge16l	%g5,	%o3,	%l0
	fsrc2s	%f8,	%f6
	edge16	%g6,	%g1,	%i3
	fmul8x16al	%f4,	%f24,	%f16
	movcc	%icc,	%g4,	%i4
	edge32n	%l4,	%l1,	%l6
	fabss	%f20,	%f10
	fsrc1s	%f8,	%f5
	fmovdpos	%icc,	%f13,	%f5
	taddcc	%o6,	0x1CE1,	%i0
	fmovsn	%icc,	%f28,	%f26
	ta	%xcc,	0x7
	fbne,a	%fcc0,	loop_2197
	fbne	%fcc2,	loop_2198
	mulx	%i7,	%o2,	%o7
	fcmple32	%f16,	%f6,	%i6
loop_2197:
	or	%g7,	%o1,	%o5
loop_2198:
	tvs	%icc,	0x5
	tl	%xcc,	0x0
	stx	%g3,	[%l7 + 0x30]
	fmovsne	%xcc,	%f11,	%f0
	fmul8sux16	%f16,	%f10,	%f8
	tn	%icc,	0x0
	movne	%icc,	%l3,	%g2
	subc	%l2,	0x14E1,	%o0
	udivx	%o4,	0x1AAB,	%i5
	fabss	%f16,	%f12
	std	%f26,	[%l7 + 0x78]
	fornot2s	%f18,	%f21,	%f16
	movvc	%icc,	%l5,	%i1
	srl	%i2,	0x1B,	%g5
	subcc	%l0,	%o3,	%g1
	or	%g6,	0x0F72,	%g4
	stbar
	fnors	%f14,	%f4,	%f25
	array8	%i3,	%l4,	%i4
	te	%xcc,	0x1
	fbne	%fcc3,	loop_2199
	move	%icc,	%l1,	%l6
	set	0x08, %l2
	stxa	%i0,	[%l7 + %l2] 0x22
	membar	#Sync
loop_2199:
	edge32ln	%i7,	%o6,	%o2
	movn	%xcc,	%i6,	%o7
	sll	%o1,	%o5,	%g7
	movpos	%icc,	%l3,	%g3
	edge8n	%l2,	%g2,	%o0
	brnz,a	%i5,	loop_2200
	te	%icc,	0x3
	fmovsvs	%icc,	%f13,	%f25
	fabsd	%f20,	%f6
loop_2200:
	tn	%icc,	0x1
	sub	%o4,	%i1,	%i2
	orcc	%g5,	%l0,	%l5
	srlx	%o3,	%g6,	%g4
	taddcctv	%g1,	%l4,	%i3
	set	0x0C, %o4
	lda	[%l7 + %o4] 0x88,	%f7
	edge8	%i4,	%l1,	%l6
	edge8	%i7,	%i0,	%o6
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf1,	%f16
	bshuffle	%f28,	%f22,	%f28
	subcc	%o2,	0x0A0F,	%i6
	ldd	[%l7 + 0x60],	%o6
	movrne	%o5,	%o1,	%g7
	popc	0x009D,	%g3
	tvc	%xcc,	0x1
	popc	%l3,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%o0,	[%l7 + 0x58]
	swap	[%l7 + 0x40],	%i5
	xor	%o4,	0x1408,	%g2
	bvs,pt	%icc,	loop_2201
	tle	%xcc,	0x2
	edge16l	%i2,	%i1,	%l0
	taddcc	%l5,	%o3,	%g6
loop_2201:
	bg,a,pn	%xcc,	loop_2202
	andncc	%g5,	%g1,	%l4
	tcc	%icc,	0x1
	bleu,a	%xcc,	loop_2203
loop_2202:
	edge32ln	%g4,	%i4,	%l1
	andn	%l6,	0x0FF9,	%i7
	fmovsg	%xcc,	%f24,	%f13
loop_2203:
	tsubcctv	%i3,	0x0FDC,	%o6
	edge16n	%o2,	%i0,	%i6
	taddcc	%o7,	%o5,	%o1
	mulx	%g7,	0x1F5E,	%l3
	fmovse	%xcc,	%f11,	%f14
	ta	%xcc,	0x3
	set	0x09, %g5
	ldsba	[%l7 + %g5] 0x89,	%g3
	edge32l	%o0,	%l2,	%i5
	fmovdvs	%xcc,	%f3,	%f13
	smul	%g2,	0x0A69,	%o4
	taddcctv	%i1,	%l0,	%l5
	movvs	%xcc,	%i2,	%o3
	xnor	%g5,	0x040C,	%g1
	xnor	%g6,	%g4,	%l4
	xnor	%l1,	%l6,	%i4
	tle	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i3,	%o6,	%o2
	set	0x54, %g2
	lduba	[%l7 + %g2] 0x89,	%i7
	tgu	%xcc,	0x6
	set	0x58, %l0
	ldxa	[%l7 + %l0] 0x80,	%i6
	umulcc	%o7,	%o5,	%o1
	add	%i0,	0x02BE,	%g7
	movl	%xcc,	%l3,	%o0
	movge	%icc,	%g3,	%i5
	edge32n	%g2,	%o4,	%i1
	stb	%l0,	[%l7 + 0x28]
	addc	%l5,	%i2,	%o3
	set	0x30, %i0
	stha	%l2,	[%l7 + %i0] 0x10
	sdivcc	%g5,	0x199C,	%g1
	ldsb	[%l7 + 0x7B],	%g4
	fble,a	%fcc1,	loop_2204
	fornot2s	%f17,	%f21,	%f23
	fmovdneg	%icc,	%f8,	%f5
	fmovrsgez	%g6,	%f18,	%f14
loop_2204:
	nop
	set	0x49, %l4
	ldub	[%l7 + %l4],	%l1
	fmovrsne	%l4,	%f12,	%f13
	tvs	%icc,	0x6
	edge32l	%i4,	%i3,	%o6
	fpack16	%f6,	%f3
	set	0x0, %g6
	stxa	%l6,	[%g0 + %g6] 0x5f
	lduw	[%l7 + 0x20],	%o2
	fmul8x16au	%f3,	%f23,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%i6,	%i7
	alignaddr	%o5,	%o1,	%o7
	xnor	%i0,	%g7,	%l3
	fmuld8ulx16	%f6,	%f7,	%f12
	andn	%g3,	0x055B,	%i5
	xorcc	%o0,	%g2,	%i1
	fmovsleu	%icc,	%f24,	%f5
	srlx	%l0,	%l5,	%o4
	addc	%o3,	%l2,	%g5
	movvc	%icc,	%i2,	%g4
	fcmps	%fcc0,	%f29,	%f30
	fmovd	%f4,	%f6
	movne	%xcc,	%g6,	%l1
	fbge,a	%fcc0,	loop_2205
	andcc	%l4,	%g1,	%i3
	fcmpgt32	%f30,	%f2,	%o6
	fsrc2s	%f10,	%f30
loop_2205:
	tcc	%xcc,	0x7
	movneg	%icc,	%i4,	%o2
	set	0x68, %i5
	stha	%l6,	[%l7 + %i5] 0xe2
	membar	#Sync
	tl	%icc,	0x7
	set	0x30, %i2
	ldda	[%l7 + %i2] 0x81,	%i6
	fone	%f28
	movre	%o5,	%o1,	%o7
	edge8	%i7,	%i0,	%l3
	fnor	%f24,	%f20,	%f30
	set	0x78, %o5
	swapa	[%l7 + %o5] 0x0c,	%g7
	sub	%g3,	0x0EFC,	%o0
	brz,a	%i5,	loop_2206
	ldx	[%l7 + 0x68],	%i1
	tne	%xcc,	0x4
	brnz,a	%l0,	loop_2207
loop_2206:
	array8	%g2,	%o4,	%o3
	array32	%l5,	%g5,	%i2
	orncc	%g4,	0x1253,	%l2
loop_2207:
	add	%g6,	0x0B7E,	%l1
	fble	%fcc1,	loop_2208
	movle	%icc,	%g1,	%i3
	edge8l	%l4,	%o6,	%i4
	orcc	%l6,	0x0112,	%i6
loop_2208:
	tsubcc	%o5,	0x0037,	%o1
	movleu	%xcc,	%o7,	%i7
	brnz,a	%o2,	loop_2209
	movrgez	%i0,	%l3,	%g7
	addccc	%o0,	%g3,	%i1
	and	%i5,	%g2,	%l0
loop_2209:
	tsubcc	%o4,	0x10D5,	%l5
	std	%f30,	[%l7 + 0x20]
	orcc	%g5,	0x0E25,	%o3
	alignaddr	%i2,	%g4,	%l2
	fmuld8sux16	%f4,	%f27,	%f12
	fmovda	%icc,	%f13,	%f24
	brgez	%l1,	loop_2210
	fpsub32s	%f0,	%f31,	%f3
	movre	%g1,	0x34C,	%g6
	sdivx	%i3,	0x04A1,	%o6
loop_2210:
	edge16n	%l4,	%i4,	%l6
	bneg,a,pt	%icc,	loop_2211
	tsubcc	%o5,	%o1,	%o7
	sub	%i7,	%o2,	%i0
	fpadd32s	%f15,	%f31,	%f30
loop_2211:
	tl	%icc,	0x7
	fsrc1s	%f24,	%f25
	bn,a,pt	%xcc,	loop_2212
	fors	%f4,	%f11,	%f24
	taddcctv	%i6,	%l3,	%o0
	subccc	%g7,	%g3,	%i1
loop_2212:
	fmovrse	%i5,	%f11,	%f21
	bne	loop_2213
	udivx	%g2,	0x097E,	%o4
	or	%l5,	0x107E,	%g5
	fmovrse	%l0,	%f13,	%f0
loop_2213:
	fmul8x16al	%f8,	%f8,	%f26
	or	%o3,	%g4,	%i2
	fbue	%fcc3,	loop_2214
	alignaddrl	%l1,	%l2,	%g6
	array16	%i3,	%g1,	%o6
	add	%l4,	%i4,	%l6
loop_2214:
	fbul	%fcc3,	loop_2215
	fbg,a	%fcc3,	loop_2216
	sir	0x0B47
	fmul8ulx16	%f26,	%f22,	%f26
loop_2215:
	sdivcc	%o5,	0x018E,	%o1
loop_2216:
	fmovsn	%xcc,	%f28,	%f31
	fcmpgt16	%f30,	%f22,	%i7
	xorcc	%o7,	0x189B,	%i0
	stx	%i6,	[%l7 + 0x68]
	tcs	%icc,	0x6
	fbug,a	%fcc0,	loop_2217
	orcc	%l3,	%o2,	%o0
	std	%f30,	[%l7 + 0x10]
	ldsw	[%l7 + 0x44],	%g3
loop_2217:
	sllx	%i1,	%i5,	%g7
	xorcc	%o4,	0x0FDC,	%l5
	set	0x56, %l6
	lduba	[%l7 + %l6] 0x15,	%g5
	fmovdg	%xcc,	%f3,	%f30
	subcc	%l0,	%g2,	%g4
	std	%f16,	[%l7 + 0x08]
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i2
	fmovrde	%o3,	%f16,	%f2
	movcc	%icc,	%l1,	%g6
	edge8n	%i3,	%g1,	%o6
	movl	%icc,	%l2,	%l4
	tcs	%xcc,	0x7
	and	%l6,	0x1490,	%o5
	flush	%l7 + 0x38
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x10] %asi,	%i4
	nop
	set	0x26, %i7
	ldsb	[%l7 + %i7],	%o1
	bne,a,pn	%icc,	loop_2218
	movcs	%xcc,	%o7,	%i7
	tvc	%icc,	0x7
	fnot1	%f24,	%f8
loop_2218:
	fmovrdlez	%i6,	%f24,	%f14
	movrgz	%i0,	0x291,	%o2
	fcmple32	%f6,	%f28,	%l3
	edge32n	%o0,	%i1,	%i5
	sra	%g7,	%g3,	%o4
	ldsb	[%l7 + 0x6F],	%l5
	srax	%l0,	%g2,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f10,	%f20
	andcc	%i2,	0x0248,	%o3
	popc	0x1761,	%g4
	nop
	set	0x34, %g7
	ldsw	[%l7 + %g7],	%l1
	fbu,a	%fcc3,	loop_2219
	tn	%xcc,	0x1
	sdiv	%g6,	0x0F9A,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2219:
	fcmpgt16	%f10,	%f8,	%g1
	subccc	%o6,	%l4,	%l6
	fmul8x16al	%f13,	%f7,	%f2
	tvs	%icc,	0x3
	movneg	%xcc,	%o5,	%l2
	tvs	%icc,	0x2
	fcmped	%fcc2,	%f14,	%f30
	srl	%i4,	%o7,	%i7
	prefetch	[%l7 + 0x58],	 0x1
	array8	%o1,	%i0,	%o2
	fpsub16	%f30,	%f14,	%f28
	alignaddrl	%l3,	%i6,	%o0
	fmovrslz	%i1,	%f22,	%f9
	edge8ln	%g7,	%i5,	%o4
	fzeros	%f30
	edge32l	%g3,	%l0,	%g2
	xnorcc	%l5,	0x1A54,	%i2
	add	%g5,	0x1CCB,	%g4
	add	%l1,	%g6,	%i3
	fmovsne	%xcc,	%f28,	%f14
	nop
	setx	loop_2220,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdge	%icc,	%f3,	%f1
	set	0x28, %g1
	sta	%f19,	[%l7 + %g1] 0x15
loop_2220:
	fmovsa	%xcc,	%f3,	%f30
	udivx	%g1,	0x1256,	%o6
	fmovdgu	%xcc,	%f15,	%f23
	xnorcc	%l4,	0x1E77,	%l6
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%o2
	tle	%icc,	0x1
	sra	%o5,	0x13,	%l2
	alignaddrl	%o7,	%i4,	%o1
	fmovde	%icc,	%f9,	%f30
	fmovrde	%i0,	%f30,	%f10
	movg	%xcc,	%i7,	%l3
	fba	%fcc2,	loop_2221
	subc	%i6,	%o0,	%o2
	tl	%icc,	0x1
	swap	[%l7 + 0x4C],	%g7
loop_2221:
	fmovs	%f4,	%f0
	fands	%f3,	%f11,	%f27
	fmovdgu	%icc,	%f22,	%f13
	alignaddrl	%i1,	%o4,	%i5
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%l0
	fmovs	%f8,	%f22
	fblg,a	%fcc2,	loop_2222
	fmovdcc	%xcc,	%f7,	%f26
	fmovrdgez	%g3,	%f10,	%f0
	tneg	%xcc,	0x3
loop_2222:
	sethi	0x0C91,	%l5
	sra	%g2,	%i2,	%g4
	sth	%g5,	[%l7 + 0x4C]
	flush	%l7 + 0x44
	bcc,a,pn	%icc,	loop_2223
	ba,pn	%xcc,	loop_2224
	xnorcc	%g6,	0x09B7,	%i3
	xorcc	%l1,	%g1,	%o6
loop_2223:
	edge32ln	%l4,	%l6,	%o3
loop_2224:
	fone	%f4
	addccc	%l2,	%o7,	%o5
	tn	%icc,	0x7
	tcc	%icc,	0x1
	add	%o1,	%i0,	%i4
	fbu	%fcc1,	loop_2225
	ta	%icc,	0x4
	std	%i6,	[%l7 + 0x58]
	fmovdl	%icc,	%f21,	%f30
loop_2225:
	movre	%i6,	%o0,	%l3
	tgu	%xcc,	0x1
	fmovrsgz	%o2,	%f15,	%f7
	addcc	%g7,	%o4,	%i1
	subc	%i5,	%g3,	%l0
	movn	%icc,	%g2,	%i2
	movle	%icc,	%l5,	%g5
	subccc	%g6,	0x1A3A,	%g4
	bcc,pn	%icc,	loop_2226
	movcs	%icc,	%i3,	%l1
	sub	%g1,	0x1FFD,	%o6
	set	0x32, %o2
	lduha	[%l7 + %o2] 0x14,	%l4
loop_2226:
	ldub	[%l7 + 0x2E],	%l6
	fmovsn	%xcc,	%f14,	%f23
	fbe	%fcc2,	loop_2227
	movneg	%xcc,	%o3,	%l2
	edge32n	%o7,	%o5,	%o1
	fsrc2	%f6,	%f16
loop_2227:
	fpack16	%f30,	%f14
	edge16l	%i4,	%i0,	%i7
	movcc	%xcc,	%o0,	%i6
	nop
	set	0x58, %o3
	std	%o2,	[%l7 + %o3]
	movgu	%xcc,	%g7,	%l3
	subccc	%i1,	%i5,	%o4
	movn	%xcc,	%g3,	%l0
	movl	%xcc,	%g2,	%l5
	fpsub32	%f16,	%f16,	%f22
	movge	%xcc,	%g5,	%i2
	fcmpes	%fcc1,	%f28,	%f16
	mova	%xcc,	%g4,	%i3
	addccc	%l1,	%g1,	%o6
	fble,a	%fcc1,	loop_2228
	fmovsneg	%icc,	%f25,	%f30
	sdivx	%g6,	0x0D0C,	%l6
	udiv	%o3,	0x0A3F,	%l2
loop_2228:
	te	%icc,	0x3
	fors	%f9,	%f9,	%f24
	array16	%o7,	%l4,	%o1
	sllx	%i4,	%i0,	%o5
	bge,pt	%xcc,	loop_2229
	andn	%o0,	%i7,	%o2
	udivcc	%i6,	0x14AE,	%l3
	srax	%i1,	0x05,	%i5
loop_2229:
	umul	%o4,	%g3,	%g7
	movrlz	%l0,	0x0C5,	%l5
	edge8l	%g2,	%i2,	%g4
	ldub	[%l7 + 0x2B],	%i3
	tgu	%xcc,	0x1
	edge32	%l1,	%g1,	%g5
	movleu	%xcc,	%o6,	%l6
	edge16n	%o3,	%l2,	%o7
	movn	%icc,	%l4,	%g6
	array32	%o1,	%i4,	%i0
	udiv	%o5,	0x161E,	%i7
	taddcc	%o2,	0x1BA7,	%i6
	set	0x10, %i6
	ldstuba	[%l7 + %i6] 0x88,	%o0
	brlz,a	%i1,	loop_2230
	andcc	%l3,	0x0026,	%i5
	udiv	%g3,	0x12B5,	%g7
	ldsw	[%l7 + 0x08],	%l0
loop_2230:
	sir	0x137C
	flush	%l7 + 0x40
	edge32	%o4,	%g2,	%l5
	fcmpgt16	%f10,	%f12,	%i2
	mulscc	%i3,	0x153B,	%l1
	fmovsge	%icc,	%f13,	%f26
	fandnot1	%f0,	%f10,	%f26
	brz	%g1,	loop_2231
	alignaddrl	%g5,	%o6,	%l6
	ld	[%l7 + 0x64],	%f17
	tl	%icc,	0x4
loop_2231:
	fcmpgt16	%f12,	%f28,	%g4
	andncc	%o3,	%o7,	%l4
	fmovse	%icc,	%f18,	%f16
	fmovsl	%icc,	%f22,	%f17
	movrgez	%l2,	0x34C,	%o1
	tleu	%xcc,	0x6
	tvs	%icc,	0x1
	movleu	%xcc,	%g6,	%i0
	tvc	%xcc,	0x2
	andncc	%o5,	%i4,	%i7
	movn	%xcc,	%o2,	%o0
	fcmpgt16	%f2,	%f22,	%i6
	fandnot1	%f24,	%f14,	%f20
	edge32ln	%i1,	%i5,	%l3
	subcc	%g7,	%l0,	%g3
	fpack16	%f8,	%f16
	fpadd32s	%f18,	%f29,	%f5
	edge8ln	%g2,	%l5,	%o4
	udivx	%i2,	0x1BD5,	%i3
	subc	%g1,	%g5,	%o6
	addc	%l6,	0x1898,	%l1
	fbu,a	%fcc3,	loop_2232
	xor	%o3,	0x151F,	%g4
	subccc	%l4,	%o7,	%l2
	smul	%o1,	0x0D48,	%g6
loop_2232:
	srl	%i0,	0x08,	%o5
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x38] %asi,	%i7
	edge32ln	%i4,	%o0,	%o2
	fble	%fcc2,	loop_2233
	brgz,a	%i1,	loop_2234
	srlx	%i5,	%i6,	%g7
	movleu	%xcc,	%l0,	%g3
loop_2233:
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%g2
loop_2234:
	tsubcc	%l5,	0x1CB3,	%l3
	sra	%o4,	0x0D,	%i2
	fbe	%fcc2,	loop_2235
	srax	%g1,	%i3,	%g5
	movneg	%icc,	%l6,	%o6
	fone	%f22
loop_2235:
	tvs	%icc,	0x5
	nop
	setx loop_2236, %l0, %l1
	jmpl %l1, %l1
	sub	%o3,	%g4,	%l4
	srl	%l2,	%o1,	%o7
	fbl	%fcc3,	loop_2237
loop_2236:
	sllx	%g6,	0x0D,	%o5
	nop
	setx	loop_2238,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fexpand	%f9,	%f16
loop_2237:
	nop
	set	0x20, %i4
	ldda	[%l7 + %i4] 0x24,	%i0
loop_2238:
	umul	%i4,	%o0,	%i7
	edge32l	%i1,	%i5,	%i6
	sra	%o2,	%l0,	%g3
	fxors	%f29,	%f24,	%f25
	subcc	%g2,	%l5,	%g7
	array8	%l3,	%o4,	%g1
	swap	[%l7 + 0x54],	%i3
	srax	%g5,	%l6,	%i2
	fmovscs	%icc,	%f14,	%f23
	fmovdneg	%xcc,	%f19,	%f29
	fcmple32	%f0,	%f18,	%l1
	xor	%o3,	0x031E,	%o6
	array32	%g4,	%l2,	%l4
	addc	%o7,	%o1,	%g6
	movpos	%icc,	%i0,	%i4
	ldub	[%l7 + 0x3C],	%o5
	umulcc	%o0,	%i1,	%i5
	set	0x75, %g3
	ldsba	[%l7 + %g3] 0x81,	%i7
	ldub	[%l7 + 0x0D],	%i6
	addcc	%o2,	%l0,	%g3
	fnot1	%f10,	%f28
	movrlez	%l5,	%g2,	%l3
	set	0x75, %i1
	ldsba	[%l7 + %i1] 0x19,	%o4
	addcc	%g1,	%i3,	%g7
	fmovsge	%icc,	%f30,	%f30
	orn	%g5,	0x044E,	%i2
	fmovscs	%icc,	%f15,	%f23
	brgez	%l6,	loop_2239
	tcc	%icc,	0x1
	wr	%g0,	0x20,	%asi
	stxa	%l1,	[%g0 + 0x8] %asi
loop_2239:
	edge8	%o3,	%g4,	%o6
	movpos	%xcc,	%l2,	%o7
	fbne,a	%fcc2,	loop_2240
	edge32n	%o1,	%l4,	%g6
	srax	%i0,	0x04,	%o5
	tneg	%xcc,	0x7
loop_2240:
	fbu,a	%fcc3,	loop_2241
	brgez	%i4,	loop_2242
	tge	%xcc,	0x0
	fone	%f6
loop_2241:
	nop
	set	0x38, %l1
	swapa	[%l7 + %l1] 0x10,	%i1
loop_2242:
	nop
	set	0x8, %l3
	stxa	%i5,	[%g0 + %l3] 0x20
	fxors	%f27,	%f29,	%f5
	sdiv	%o0,	0x09E6,	%i7
	sll	%i6,	%l0,	%o2
	taddcctv	%g3,	0x0FFF,	%l5
	movg	%icc,	%l3,	%g2
	tpos	%xcc,	0x6
	fcmple16	%f16,	%f28,	%o4
	ldx	[%l7 + 0x40],	%g1
	fands	%f26,	%f1,	%f29
	fpadd32	%f0,	%f22,	%f18
	fbg	%fcc1,	loop_2243
	fmovdvs	%xcc,	%f29,	%f29
	fmovsneg	%xcc,	%f30,	%f24
	bge,a,pt	%xcc,	loop_2244
loop_2243:
	ldd	[%l7 + 0x30],	%f28
	nop
	setx	loop_2245,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmul8x16au	%f25,	%f30,	%f10
loop_2244:
	movleu	%xcc,	%g7,	%i3
	alignaddrl	%i2,	%l6,	%l1
loop_2245:
	movne	%xcc,	%g5,	%g4
	fbule	%fcc2,	loop_2246
	tsubcctv	%o3,	%o6,	%o7
	set	0x68, %o1
	stda	%l2,	[%l7 + %o1] 0x89
loop_2246:
	movpos	%icc,	%o1,	%l4
	movrgz	%i0,	0x146,	%o5
	fmovdneg	%xcc,	%f7,	%f24
	fsrc2	%f6,	%f20
	fpadd32	%f22,	%f20,	%f30
	orncc	%i4,	%g6,	%i5
	orncc	%o0,	%i1,	%i6
	movleu	%xcc,	%i7,	%l0
	fmovrsgz	%g3,	%f4,	%f4
	subcc	%l5,	0x0327,	%o2
	alignaddr	%g2,	%o4,	%l3
	tgu	%icc,	0x6
	movgu	%icc,	%g1,	%i3
	tneg	%xcc,	0x4
	tpos	%icc,	0x7
	tpos	%xcc,	0x4
	fpsub32	%f26,	%f12,	%f8
	sll	%g7,	%i2,	%l6
	tsubcc	%g5,	0x0C13,	%l1
	mulx	%g4,	%o3,	%o7
	edge32n	%l2,	%o1,	%o6
	umul	%i0,	0x07FC,	%o5
	lduw	[%l7 + 0x78],	%l4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%i4,	%g6
	fba,a	%fcc3,	loop_2247
	bg,pt	%xcc,	loop_2248
	call	loop_2249
	bgu,a,pt	%xcc,	loop_2250
loop_2247:
	fmovdvs	%xcc,	%f15,	%f11
loop_2248:
	fcmpne16	%f20,	%f4,	%i5
loop_2249:
	mulx	%i1,	%o0,	%i6
loop_2250:
	ta	%icc,	0x0
	tcs	%xcc,	0x2
	movvc	%xcc,	%l0,	%i7
	movneg	%icc,	%g3,	%l5
	ldx	[%l7 + 0x30],	%o2
	or	%o4,	0x01FD,	%g2
	tgu	%icc,	0x5
	fbge	%fcc3,	loop_2251
	fbu	%fcc0,	loop_2252
	movge	%icc,	%g1,	%l3
	fcmpne16	%f8,	%f22,	%i3
loop_2251:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2252:
	srl	%i2,	%l6,	%g5
	bvs,a,pn	%xcc,	loop_2253
	popc	0x0BBE,	%l1
	bcc	loop_2254
	ta	%xcc,	0x4
loop_2253:
	tgu	%icc,	0x1
	udivx	%g4,	0x0903,	%g7
loop_2254:
	flush	%l7 + 0x3C
	swap	[%l7 + 0x74],	%o3
	nop
	setx loop_2255, %l0, %l1
	jmpl %l1, %o7
	array8	%l2,	%o6,	%i0
	alignaddr	%o5,	%l4,	%o1
	edge16n	%g6,	%i5,	%i4
loop_2255:
	fmovrse	%i1,	%f31,	%f28
	mulx	%o0,	%l0,	%i7
	fbg	%fcc0,	loop_2256
	movge	%icc,	%g3,	%l5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%o2,	%o4
loop_2256:
	fbug,a	%fcc0,	loop_2257
	tne	%icc,	0x4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x7D] %asi,	%g2
loop_2257:
	srax	%g1,	%i6,	%i3
	edge16ln	%l3,	%i2,	%l6
	set	0x20, %l5
	stxa	%g5,	[%l7 + %l5] 0x14
	tgu	%icc,	0x4
	fbug	%fcc1,	loop_2258
	bgu	loop_2259
	fandnot1	%f22,	%f12,	%f10
	stw	%l1,	[%l7 + 0x54]
loop_2258:
	fpadd16s	%f12,	%f31,	%f15
loop_2259:
	movl	%xcc,	%g4,	%o3
	addc	%g7,	%l2,	%o6
	pdist	%f28,	%f22,	%f10
	bshuffle	%f16,	%f14,	%f30
	ld	[%l7 + 0x14],	%f15
	movle	%xcc,	%o7,	%o5
	fcmpne32	%f4,	%f12,	%l4
	movneg	%icc,	%i0,	%g6
	srlx	%i5,	0x00,	%o1
	xnor	%i1,	0x0AAD,	%o0
	tleu	%xcc,	0x2
	fornot1	%f6,	%f20,	%f20
	array32	%l0,	%i4,	%g3
	edge16n	%l5,	%i7,	%o4
	sethi	0x0B4F,	%o2
	ldstub	[%l7 + 0x36],	%g1
	andcc	%i6,	0x116E,	%i3
	fbue	%fcc3,	loop_2260
	fpsub16s	%f10,	%f23,	%f11
	subcc	%l3,	%g2,	%l6
	tg	%icc,	0x1
loop_2260:
	fpack16	%f26,	%f10
	bshuffle	%f10,	%f14,	%f10
	edge16	%g5,	%l1,	%i2
	alignaddr	%o3,	%g4,	%g7
	brlez	%o6,	loop_2261
	prefetch	[%l7 + 0x60],	 0x0
	smul	%l2,	0x08EC,	%o7
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x14,	%f0
loop_2261:
	ta	%icc,	0x5
	bleu	loop_2262
	edge8ln	%o5,	%i0,	%g6
	subc	%i5,	0x03E6,	%o1
	bvs	%icc,	loop_2263
loop_2262:
	te	%xcc,	0x6
	fxnor	%f30,	%f12,	%f2
	subcc	%i1,	0x1719,	%o0
loop_2263:
	edge8	%l0,	%i4,	%l4
	tvc	%icc,	0x5
	xor	%l5,	0x1E5E,	%g3
	edge8	%o4,	%o2,	%g1
	movcs	%icc,	%i7,	%i6
	popc	0x0176,	%i3
	fpadd32	%f10,	%f26,	%f10
	tl	%xcc,	0x0
	sdiv	%g2,	0x01B8,	%l6
	tneg	%icc,	0x5
	ldd	[%l7 + 0x48],	%f12
	alignaddrl	%g5,	%l1,	%i2
	mova	%icc,	%o3,	%l3
	fmovsge	%icc,	%f4,	%f14
	fnands	%f29,	%f26,	%f2
	ta	%icc,	0x2
	subc	%g7,	0x0DE4,	%o6
	sdivx	%g4,	0x0367,	%l2
	fandnot2s	%f3,	%f0,	%f13
	fmovsneg	%icc,	%f30,	%f9
	fmovsne	%icc,	%f13,	%f1
	edge8ln	%o5,	%i0,	%g6
	edge16ln	%i5,	%o7,	%o1
	edge16ln	%o0,	%l0,	%i1
	tsubcc	%l4,	%l5,	%i4
	fmovda	%icc,	%f2,	%f28
	bg	loop_2264
	edge16	%g3,	%o2,	%o4
	sethi	0x0BF6,	%i7
	flush	%l7 + 0x18
loop_2264:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f24,	%f30,	%i6
	move	%icc,	%i3,	%g1
	move	%icc,	%l6,	%g2
	fmovdg	%icc,	%f7,	%f26
	swap	[%l7 + 0x0C],	%l1
	fbuge,a	%fcc3,	loop_2265
	movgu	%xcc,	%i2,	%g5
	tg	%icc,	0x4
	udivcc	%o3,	0x0FB9,	%l3
loop_2265:
	movpos	%xcc,	%o6,	%g7
	fnegd	%f24,	%f4
	tcs	%icc,	0x1
	and	%g4,	%o5,	%i0
	bleu,a,pn	%icc,	loop_2266
	bg,a	%icc,	loop_2267
	movle	%icc,	%g6,	%i5
	fmovrslez	%o7,	%f11,	%f5
loop_2266:
	orn	%l2,	%o1,	%l0
loop_2267:
	nop
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x4F] %asi,	%o0
	srax	%i1,	%l4,	%i4
	udivx	%l5,	0x1056,	%o2
	brz	%o4,	loop_2268
	ba	%icc,	loop_2269
	edge8l	%i7,	%g3,	%i3
	bleu,a	loop_2270
loop_2268:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2269:
	sll	%i6,	0x02,	%g1
	brgez	%l6,	loop_2271
loop_2270:
	pdist	%f8,	%f24,	%f24
	movl	%icc,	%l1,	%i2
	set	0x30, %l2
	prefetcha	[%l7 + %l2] 0x0c,	 0x1
loop_2271:
	fbu	%fcc1,	loop_2272
	edge16ln	%o3,	%g5,	%l3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%g7
loop_2272:
	bcs,a,pn	%icc,	loop_2273
	sir	0x0F21
	movpos	%xcc,	%o6,	%o5
	wr	%g0,	0x81,	%asi
	stwa	%g4,	[%l7 + 0x64] %asi
loop_2273:
	membar	0x74
	and	%g6,	%i0,	%o7
	edge16ln	%i5,	%l2,	%l0
	srl	%o0,	0x1C,	%i1
	movrne	%l4,	0x37A,	%i4
	orncc	%o1,	%o2,	%l5
	fpsub32s	%f14,	%f19,	%f4
	fcmpd	%fcc0,	%f18,	%f28
	fmovrdlz	%i7,	%f10,	%f10
	fmovrdlez	%o4,	%f20,	%f4
	tleu	%icc,	0x0
	movrlez	%i3,	0x027,	%i6
	fmul8ulx16	%f18,	%f20,	%f10
	fnands	%f22,	%f25,	%f27
	tg	%icc,	0x0
	sll	%g3,	%l6,	%g1
	umulcc	%l1,	%i2,	%o3
	movrlez	%g2,	0x1F8,	%g5
	andcc	%g7,	0x1748,	%o6
	smul	%o5,	0x10F3,	%g4
	edge16l	%g6,	%i0,	%l3
	fmovse	%xcc,	%f4,	%f20
	alignaddrl	%o7,	%i5,	%l0
	alignaddrl	%l2,	%o0,	%l4
	orncc	%i4,	%o1,	%o2
	movle	%xcc,	%i1,	%i7
	fornot1s	%f17,	%f17,	%f4
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x10] %asi,	%o4
	stw	%l5,	[%l7 + 0x60]
	fxors	%f10,	%f4,	%f3
	tleu	%xcc,	0x6
	movg	%xcc,	%i6,	%g3
	tsubcctv	%l6,	%g1,	%i3
	sdivcc	%l1,	0x0B40,	%o3
	bneg,pt	%xcc,	loop_2274
	mova	%icc,	%i2,	%g2
	fmovrdne	%g5,	%f10,	%f28
	wr	%g0,	0x2b,	%asi
	stxa	%g7,	[%l7 + 0x18] %asi
	membar	#Sync
loop_2274:
	fbg,a	%fcc3,	loop_2275
	bgu,a,pt	%xcc,	loop_2276
	mova	%icc,	%o5,	%o6
	movvc	%xcc,	%g6,	%i0
loop_2275:
	prefetch	[%l7 + 0x70],	 0x2
loop_2276:
	nop
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge32	%g4,	%l3,	%i5
	call	loop_2277
	pdist	%f2,	%f30,	%f12
	edge8ln	%l0,	%o7,	%o0
	orncc	%l4,	%l2,	%o1
loop_2277:
	fmovdleu	%xcc,	%f21,	%f26
	tg	%xcc,	0x0
	srlx	%o2,	%i4,	%i1
	movneg	%xcc,	%i7,	%l5
	orn	%i6,	%o4,	%l6
	movpos	%xcc,	%g1,	%i3
	fcmpeq32	%f0,	%f20,	%l1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x19,	%g3,	%i2
	fsrc2s	%f10,	%f6
	edge8ln	%o3,	%g2,	%g5
	tg	%xcc,	0x2
	fmovrslz	%g7,	%f28,	%f10
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x64] %asi,	%f28
	umul	%o6,	%g6,	%i0
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x20] %asi,	%o5
	ldsh	[%l7 + 0x58],	%l3
	fandnot1	%f16,	%f2,	%f2
	movl	%xcc,	%g4,	%i5
	fabss	%f10,	%f22
	fmul8ulx16	%f30,	%f20,	%f18
	and	%o7,	%o0,	%l0
	fmovdcs	%xcc,	%f23,	%f20
	te	%xcc,	0x2
	fpack32	%f8,	%f18,	%f14
	mulscc	%l4,	%l2,	%o2
	fones	%f6
	flush	%l7 + 0x0C
	xnor	%i4,	0x10EB,	%o1
	fpsub32s	%f16,	%f30,	%f1
	fbuge,a	%fcc1,	loop_2278
	stb	%i1,	[%l7 + 0x74]
	fornot2	%f4,	%f2,	%f16
	fmovdge	%xcc,	%f28,	%f9
loop_2278:
	movleu	%xcc,	%l5,	%i7
	fxors	%f4,	%f25,	%f28
	fmovd	%f26,	%f14
	orcc	%i6,	%l6,	%o4
	edge8ln	%i3,	%g1,	%l1
	movpos	%icc,	%i2,	%o3
	smul	%g3,	%g2,	%g7
	fbuge,a	%fcc2,	loop_2279
	fmovdle	%xcc,	%f6,	%f17
	andn	%o6,	%g6,	%i0
	sllx	%o5,	%l3,	%g4
loop_2279:
	fbuge,a	%fcc1,	loop_2280
	edge32ln	%i5,	%o7,	%g5
	edge8n	%o0,	%l0,	%l2
	fornot1	%f10,	%f28,	%f12
loop_2280:
	fmuld8ulx16	%f14,	%f30,	%f26
	ble,a,pn	%xcc,	loop_2281
	fmul8x16	%f30,	%f16,	%f28
	movn	%xcc,	%o2,	%l4
	alignaddrl	%i4,	%i1,	%o1
loop_2281:
	fbl,a	%fcc3,	loop_2282
	stw	%i7,	[%l7 + 0x14]
	and	%l5,	0x0545,	%l6
	subcc	%o4,	0x15B7,	%i3
loop_2282:
	fandnot2s	%f3,	%f3,	%f15
	nop
	setx	loop_2283,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fxor	%f6,	%f16,	%f28
	edge8n	%g1,	%i6,	%i2
	ldstub	[%l7 + 0x21],	%l1
loop_2283:
	movge	%icc,	%o3,	%g3
	movrgz	%g2,	0x2B7,	%o6
	bl,a	loop_2284
	sub	%g6,	0x1312,	%g7
	bne	loop_2285
	bleu	%icc,	loop_2286
loop_2284:
	movrlz	%i0,	0x082,	%o5
	tneg	%icc,	0x6
loop_2285:
	fsrc1	%f10,	%f14
loop_2286:
	sll	%g4,	0x1D,	%i5
	fsrc1s	%f15,	%f25
	srax	%o7,	%g5,	%l3
	fors	%f28,	%f18,	%f0
	addc	%o0,	%l0,	%l2
	movrne	%l4,	%o2,	%i4
	fbul	%fcc2,	loop_2287
	lduh	[%l7 + 0x40],	%i1
	udivx	%i7,	0x0C8A,	%l5
	edge32ln	%l6,	%o4,	%i3
loop_2287:
	nop
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x14] %asi,	%g1
	set	0x08, %i3
	stda	%o0,	[%l7 + %i3] 0x81
	be,a,pt	%xcc,	loop_2288
	brlez,a	%i6,	loop_2289
	andn	%i2,	%o3,	%g3
	srl	%g2,	0x1A,	%l1
loop_2288:
	fmovsgu	%icc,	%f29,	%f21
loop_2289:
	movle	%xcc,	%o6,	%g6
	tle	%icc,	0x0
	taddcctv	%g7,	%i0,	%o5
	fabss	%f16,	%f10
	fbu,a	%fcc0,	loop_2290
	tn	%xcc,	0x3
	mulscc	%i5,	%o7,	%g4
	udiv	%g5,	0x0E4E,	%l3
loop_2290:
	nop
	set	0x30, %o4
	ldx	[%l7 + %o4],	%l0
	umulcc	%l2,	%l4,	%o2
	sethi	0x1C8F,	%o0
	smulcc	%i1,	%i7,	%l5
	fmovrdne	%l6,	%f24,	%f4
	fmovdcs	%icc,	%f0,	%f26
	popc	0x1B17,	%o4
	tpos	%xcc,	0x1
	fnegs	%f29,	%f5
	fzero	%f16
	fexpand	%f20,	%f30
	nop
	setx	loop_2291,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	flush	%l7 + 0x5C
	be,a	loop_2292
	tleu	%xcc,	0x7
loop_2291:
	edge16l	%i3,	%i4,	%g1
	fbge	%fcc0,	loop_2293
loop_2292:
	fmul8ulx16	%f12,	%f26,	%f2
	ta	%icc,	0x0
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x10] %asi,	%i6
loop_2293:
	alignaddrl	%o1,	%i2,	%o3
	mulx	%g3,	0x1354,	%l1
	movvc	%icc,	%g2,	%g6
	set	0x08, %g5
	lduha	[%l7 + %g5] 0x81,	%g7
	fandnot1s	%f23,	%f7,	%f22
	set	0x3C, %g2
	lduba	[%l7 + %g2] 0x19,	%o6
	edge32	%o5,	%i0,	%o7
	edge16l	%g4,	%i5,	%g5
	fpadd32s	%f12,	%f29,	%f19
	stb	%l0,	[%l7 + 0x78]
	udivcc	%l3,	0x1127,	%l4
	fandnot1	%f10,	%f20,	%f10
	fbne,a	%fcc1,	loop_2294
	lduw	[%l7 + 0x54],	%o2
	movrne	%l2,	0x111,	%o0
	movl	%icc,	%i1,	%l5
loop_2294:
	fpack32	%f22,	%f20,	%f4
	tvs	%xcc,	0x4
	array16	%i7,	%o4,	%i3
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x19,	%f0
	prefetch	[%l7 + 0x74],	 0x3
	or	%i4,	0x0C05,	%l6
	orncc	%i6,	%g1,	%i2
	xnorcc	%o1,	%o3,	%l1
	tl	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%g3,	%g6
	edge16ln	%g7,	%g2,	%o5
	sra	%i0,	%o6,	%o7
	movvs	%xcc,	%i5,	%g4
	or	%g5,	0x05D0,	%l3
	array32	%l4,	%l0,	%o2
	tvc	%xcc,	0x3
	ldsw	[%l7 + 0x34],	%l2
	fmovdg	%xcc,	%f28,	%f19
	edge32l	%o0,	%l5,	%i1
	fcmpeq32	%f12,	%f28,	%o4
	wr	%g0,	0x80,	%asi
	stha	%i3,	[%l7 + 0x30] %asi
	alignaddr	%i7,	%i4,	%i6
	fxnor	%f10,	%f26,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g1,	0x139,	%l6
	set	0x3C, %l0
	ldsha	[%l7 + %l0] 0x0c,	%o1
	fmovrslez	%o3,	%f14,	%f31
	movre	%l1,	%g3,	%i2
	tn	%icc,	0x0
	edge8ln	%g6,	%g2,	%o5
	set	0x3C, %i0
	lda	[%l7 + %i0] 0x18,	%f14
	fmovdcs	%icc,	%f23,	%f28
	tneg	%xcc,	0x3
	sdivx	%i0,	0x02B7,	%g7
	fone	%f18
	edge8	%o7,	%o6,	%g4
	fbug	%fcc2,	loop_2295
	or	%g5,	0x16ED,	%l3
	sllx	%l4,	%l0,	%i5
	movrlz	%l2,	%o0,	%l5
loop_2295:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc3,	loop_2296
	bshuffle	%f28,	%f10,	%f6
	array8	%o2,	%i1,	%i3
	movleu	%xcc,	%o4,	%i7
loop_2296:
	andcc	%i6,	0x145F,	%g1
	fmovdcs	%xcc,	%f21,	%f11
	mova	%icc,	%l6,	%i4
	fmovdvc	%xcc,	%f0,	%f30
	st	%f19,	[%l7 + 0x6C]
	udiv	%o1,	0x0DA9,	%l1
	alignaddr	%o3,	%g3,	%i2
	edge32	%g2,	%g6,	%i0
	popc	%g7,	%o5
	sub	%o7,	0x171F,	%g4
	addcc	%o6,	%l3,	%g5
	tg	%icc,	0x5
	fsrc2s	%f2,	%f16
	tcs	%xcc,	0x1
	srax	%l4,	%i5,	%l2
	fpsub32s	%f0,	%f22,	%f22
	xnorcc	%l0,	0x1F86,	%l5
	umulcc	%o2,	%o0,	%i1
	edge16	%i3,	%o4,	%i7
	sdivx	%g1,	0x0FCD,	%l6
	tvc	%xcc,	0x1
	fmovrsne	%i4,	%f9,	%f31
	fmovdgu	%xcc,	%f13,	%f3
	edge32n	%o1,	%i6,	%l1
	edge32l	%o3,	%i2,	%g2
	fnegs	%f26,	%f6
	tl	%icc,	0x1
	fsrc1	%f10,	%f22
	fbug,a	%fcc3,	loop_2297
	tcc	%xcc,	0x7
	fsrc1	%f8,	%f18
	or	%g3,	%i0,	%g6
loop_2297:
	sub	%o5,	%o7,	%g7
	sra	%g4,	0x08,	%o6
	movrlz	%g5,	%l4,	%i5
	xor	%l3,	0x1AEA,	%l2
	fmovdleu	%xcc,	%f17,	%f25
	fbne	%fcc0,	loop_2298
	tn	%icc,	0x7
	bvs,pn	%xcc,	loop_2299
	subcc	%l0,	0x0A31,	%o2
loop_2298:
	mova	%icc,	%o0,	%l5
	fble,a	%fcc2,	loop_2300
loop_2299:
	ldsw	[%l7 + 0x3C],	%i1
	udivcc	%i3,	0x0547,	%o4
	fandnot2s	%f29,	%f18,	%f0
loop_2300:
	taddcc	%i7,	0x130B,	%g1
	movrlz	%i4,	%o1,	%i6
	bcs,a	loop_2301
	mulscc	%l1,	%l6,	%i2
	tgu	%icc,	0x0
	xnor	%o3,	%g3,	%g2
loop_2301:
	sll	%i0,	0x0C,	%g6
	movl	%xcc,	%o5,	%o7
	nop
	set	0x3C, %g6
	lduw	[%l7 + %g6],	%g4
	fmovrsgz	%g7,	%f22,	%f22
	orncc	%o6,	0x0DF0,	%l4
	alignaddrl	%i5,	%l3,	%l2
	sll	%l0,	0x0F,	%g5
	add	%o2,	0x1CAE,	%l5
	ta	%xcc,	0x7
	edge8l	%o0,	%i3,	%o4
	movleu	%icc,	%i7,	%g1
	array16	%i1,	%i4,	%o1
	fmul8x16	%f11,	%f28,	%f4
	te	%icc,	0x5
	bneg,a	loop_2302
	tsubcc	%l1,	0x1D42,	%l6
	subccc	%i2,	0x174C,	%o3
	membar	0x23
loop_2302:
	fmovrslz	%g3,	%f22,	%f26
	brlez,a	%g2,	loop_2303
	sir	0x0208
	ldsb	[%l7 + 0x0B],	%i0
	fornot2s	%f4,	%f14,	%f14
loop_2303:
	sdivcc	%g6,	0x032D,	%o5
	membar	0x5E
	add	%i6,	0x1282,	%o7
	fbue,a	%fcc2,	loop_2304
	tsubcctv	%g4,	0x05F6,	%o6
	orcc	%g7,	%i5,	%l3
	movcs	%icc,	%l4,	%l0
loop_2304:
	movre	%g5,	0x2E8,	%o2
	movg	%icc,	%l2,	%l5
	movrgz	%i3,	%o4,	%i7
	membar	0x16
	bvc	loop_2305
	fba,a	%fcc1,	loop_2306
	tn	%icc,	0x2
	xor	%g1,	0x0F9F,	%o0
loop_2305:
	array32	%i1,	%i4,	%l1
loop_2306:
	bvc,a	loop_2307
	bl,a	loop_2308
	addcc	%o1,	%l6,	%i2
	orn	%o3,	%g3,	%i0
loop_2307:
	sllx	%g6,	%o5,	%g2
loop_2308:
	be	%icc,	loop_2309
	srl	%o7,	0x0B,	%g4
	fmovsle	%icc,	%f7,	%f31
	ble,a	loop_2310
loop_2309:
	andn	%o6,	0x15AF,	%g7
	sllx	%i5,	0x00,	%i6
	te	%xcc,	0x7
loop_2310:
	edge32l	%l4,	%l3,	%l0
	fmovde	%icc,	%f16,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%g5,	%f28,	%f18
	movrgez	%l2,	%l5,	%i3
	ta	%xcc,	0x2
	fmovdne	%xcc,	%f26,	%f21
	faligndata	%f26,	%f6,	%f30
	movne	%icc,	%o2,	%o4
	sir	0x06DE
	movcs	%xcc,	%g1,	%o0
	bleu	loop_2311
	subc	%i1,	0x0A60,	%i7
	fmovrsgez	%l1,	%f13,	%f10
	tvc	%icc,	0x7
loop_2311:
	tl	%xcc,	0x3
	pdist	%f20,	%f0,	%f18
	tle	%xcc,	0x7
	umul	%i4,	0x0EAD,	%l6
	srl	%i2,	0x10,	%o1
	andn	%o3,	0x0945,	%i0
	fcmpd	%fcc2,	%f12,	%f16
	subc	%g6,	%o5,	%g3
	tpos	%xcc,	0x0
	orn	%g2,	0x18F3,	%g4
	array32	%o7,	%o6,	%i5
	sdivx	%g7,	0x18A8,	%l4
	tsubcc	%l3,	%i6,	%l0
	fmovscs	%icc,	%f7,	%f23
	movrlez	%l2,	%l5,	%g5
	fmovsvs	%xcc,	%f7,	%f15
	addc	%o2,	0x14C7,	%o4
	fba	%fcc0,	loop_2312
	movrne	%g1,	0x203,	%o0
	orncc	%i3,	%i1,	%l1
	stw	%i7,	[%l7 + 0x38]
loop_2312:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l6,	%i4,	%i2
	andncc	%o3,	%i0,	%g6
	array32	%o5,	%g3,	%g2
	sllx	%o1,	0x11,	%g4
	movcc	%icc,	%o6,	%o7
	addccc	%i5,	0x058C,	%g7
	fmovde	%icc,	%f15,	%f6
	subc	%l4,	%l3,	%i6
	fnor	%f14,	%f24,	%f12
	fbue,a	%fcc3,	loop_2313
	fmovdvc	%xcc,	%f14,	%f6
	fandnot1	%f26,	%f20,	%f6
	movg	%xcc,	%l2,	%l0
loop_2313:
	fmovse	%icc,	%f19,	%f6
	edge16n	%l5,	%g5,	%o4
	fbug,a	%fcc3,	loop_2314
	umul	%o2,	0x1BF6,	%g1
	fones	%f19
	and	%o0,	%i3,	%i1
loop_2314:
	movrgz	%l1,	%l6,	%i4
	fbe	%fcc2,	loop_2315
	brgez,a	%i2,	loop_2316
	movrlez	%o3,	%i7,	%i0
	fmovrdlz	%g6,	%f0,	%f0
loop_2315:
	nop
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2316:
	nop
	wr	%g0,	0x22,	%asi
	stxa	%o5,	[%l7 + 0x68] %asi
	membar	#Sync
	fone	%f30
	subcc	%g2,	0x1369,	%g3
	fbuge,a	%fcc1,	loop_2317
	sra	%o1,	0x18,	%g4
	edge16l	%o7,	%i5,	%o6
	fbu,a	%fcc1,	loop_2318
loop_2317:
	bcs	%icc,	loop_2319
	ldsb	[%l7 + 0x7F],	%l4
	addcc	%l3,	%g7,	%l2
loop_2318:
	nop
	set	0x08, %l4
	swapa	[%l7 + %l4] 0x80,	%i6
loop_2319:
	mulx	%l5,	0x0DE6,	%g5
	popc	0x052E,	%o4
	fbug	%fcc3,	loop_2320
	fmovdneg	%icc,	%f29,	%f17
	xnorcc	%l0,	%g1,	%o0
	stw	%i3,	[%l7 + 0x6C]
loop_2320:
	fmovdgu	%icc,	%f27,	%f3
	set	0x6D, %i2
	ldstuba	[%l7 + %i2] 0x80,	%o2
	fpsub16s	%f29,	%f1,	%f20
	addccc	%l1,	%i1,	%i4
	orncc	%i2,	%l6,	%o3
	edge16	%i7,	%g6,	%o5
	sth	%g2,	[%l7 + 0x78]
	fpadd16s	%f3,	%f8,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz,a	%g3,	loop_2321
	addc	%o1,	%g4,	%i0
	fbuge	%fcc0,	loop_2322
	fmul8x16al	%f29,	%f9,	%f14
loop_2321:
	fones	%f11
	edge8ln	%i5,	%o6,	%o7
loop_2322:
	fmuld8ulx16	%f25,	%f29,	%f18
	fxnors	%f2,	%f10,	%f19
	ldd	[%l7 + 0x08],	%l2
	std	%g6,	[%l7 + 0x70]
	array16	%l4,	%l2,	%l5
	movg	%icc,	%g5,	%i6
	umul	%l0,	%o4,	%o0
	stw	%g1,	[%l7 + 0x10]
	sth	%o2,	[%l7 + 0x0C]
	subccc	%i3,	0x0305,	%l1
	fmovd	%f18,	%f30
	array8	%i4,	%i1,	%l6
	tneg	%xcc,	0x3
	ldd	[%l7 + 0x40],	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i7,	%g6,	%o3
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x73] %asi,	%g2
	srax	%o5,	0x0D,	%g3
	tvs	%icc,	0x4
	edge32l	%o1,	%g4,	%i5
	alignaddr	%i0,	%o6,	%o7
	edge32n	%l3,	%l4,	%g7
	brnz	%l5,	loop_2323
	tneg	%icc,	0x1
	movleu	%icc,	%g5,	%i6
	movleu	%xcc,	%l2,	%l0
loop_2323:
	nop
	set	0x6C, %o5
	ldswa	[%l7 + %o5] 0x19,	%o0
	membar	0x5E
	edge8ln	%g1,	%o4,	%i3
	fbge	%fcc2,	loop_2324
	st	%f6,	[%l7 + 0x78]
	orn	%l1,	%o2,	%i1
	tpos	%xcc,	0x6
loop_2324:
	fpsub16s	%f11,	%f31,	%f18
	fandnot2s	%f29,	%f29,	%f14
	subc	%l6,	%i2,	%i7
	sdiv	%g6,	0x1F32,	%i4
	siam	0x5
	andncc	%g2,	%o5,	%g3
	and	%o3,	%g4,	%o1
	movne	%xcc,	%i0,	%o6
	movrlez	%o7,	%l3,	%l4
	bg,a,pt	%xcc,	loop_2325
	movleu	%xcc,	%g7,	%l5
	movrlz	%i5,	0x2EF,	%g5
	fnot2s	%f16,	%f3
loop_2325:
	bgu,a,pn	%icc,	loop_2326
	fbe	%fcc2,	loop_2327
	bge,a	%xcc,	loop_2328
	movge	%xcc,	%i6,	%l0
loop_2326:
	fpadd32s	%f26,	%f17,	%f23
loop_2327:
	sir	0x13B8
loop_2328:
	nop
	set	0x73, %i5
	ldub	[%l7 + %i5],	%o0
	edge32	%g1,	%o4,	%i3
	edge32n	%l1,	%o2,	%i1
	movrlez	%l2,	0x052,	%l6
	edge16n	%i2,	%g6,	%i4
	tcs	%icc,	0x1
	taddcc	%i7,	0x1E1F,	%o5
	tle	%xcc,	0x2
	edge32l	%g3,	%g2,	%g4
	movge	%icc,	%o1,	%i0
	nop
	set	0x30, %i7
	stb	%o6,	[%l7 + %i7]
	fpadd32s	%f24,	%f22,	%f9
	fmovrslez	%o3,	%f0,	%f6
	set	0x40, %g7
	lduha	[%l7 + %g7] 0x89,	%o7
	movg	%xcc,	%l3,	%g7
	taddcc	%l5,	%i5,	%g5
	movg	%icc,	%i6,	%l4
	set	0x70, %g1
	ldda	[%l7 + %g1] 0x10,	%o0
	lduh	[%l7 + 0x1E],	%g1
	movleu	%icc,	%l0,	%i3
	brnz,a	%l1,	loop_2329
	be,a,pt	%icc,	loop_2330
	fbe	%fcc0,	loop_2331
	tne	%xcc,	0x1
loop_2329:
	movge	%xcc,	%o4,	%o2
loop_2330:
	subccc	%i1,	%l6,	%i2
loop_2331:
	smul	%g6,	%i4,	%i7
	srlx	%o5,	0x14,	%g3
	umulcc	%l2,	%g4,	%o1
	pdist	%f0,	%f22,	%f12
	tvs	%xcc,	0x3
	sdivcc	%g2,	0x13B3,	%i0
	movrne	%o6,	%o3,	%l3
	bpos,a,pn	%icc,	loop_2332
	udivcc	%o7,	0x09EE,	%l5
	movcc	%icc,	%g7,	%g5
	fbge,a	%fcc3,	loop_2333
loop_2332:
	fzero	%f12
	prefetch	[%l7 + 0x70],	 0x0
	edge32	%i5,	%i6,	%o0
loop_2333:
	subccc	%l4,	0x1259,	%l0
	fmovdcc	%xcc,	%f25,	%f27
	udiv	%g1,	0x1778,	%i3
	fcmpgt32	%f4,	%f10,	%o4
	set	0x28, %l6
	stxa	%l1,	[%l7 + %l6] 0x0c
	andcc	%i1,	%l6,	%i2
	movge	%icc,	%g6,	%o2
	nop
	setx loop_2334, %l0, %l1
	jmpl %l1, %i7
	movle	%icc,	%i4,	%o5
	movn	%xcc,	%l2,	%g3
	ta	%icc,	0x6
loop_2334:
	bg,pn	%xcc,	loop_2335
	subccc	%o1,	%g2,	%g4
	array16	%o6,	%o3,	%i0
	fmovdle	%xcc,	%f18,	%f1
loop_2335:
	orn	%l3,	0x0340,	%o7
	fcmple16	%f10,	%f30,	%l5
	movvc	%xcc,	%g5,	%i5
	movre	%g7,	%i6,	%l4
	nop
	setx	loop_2336,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8n	%l0,	%g1,	%i3
	fbo	%fcc0,	loop_2337
	fsrc1s	%f22,	%f10
loop_2336:
	mova	%icc,	%o4,	%o0
	edge16	%l1,	%l6,	%i2
loop_2337:
	tvc	%xcc,	0x6
	fnot2s	%f9,	%f3
	edge8	%i1,	%g6,	%i7
	sllx	%i4,	0x0B,	%o5
	movvc	%xcc,	%o2,	%l2
	sllx	%o1,	0x1F,	%g3
	bleu,pt	%xcc,	loop_2338
	and	%g4,	0x111D,	%o6
	array32	%o3,	%i0,	%l3
	sdivcc	%o7,	0x10BC,	%g2
loop_2338:
	fpsub16	%f6,	%f30,	%f14
	movge	%icc,	%g5,	%i5
	edge16	%l5,	%g7,	%i6
	udivcc	%l4,	0x135C,	%l0
	srax	%g1,	0x08,	%o4
	fxnors	%f12,	%f5,	%f18
	xnorcc	%i3,	%o0,	%l6
	add	%l1,	%i1,	%i2
	movrlz	%g6,	0x2C5,	%i7
	mulx	%i4,	%o2,	%l2
	movne	%icc,	%o5,	%o1
	edge16ln	%g4,	%g3,	%o3
	fbo	%fcc3,	loop_2339
	fone	%f10
	set	0x58, %o0
	prefetcha	[%l7 + %o0] 0x04,	 0x1
loop_2339:
	fmul8x16	%f18,	%f8,	%f14
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x6C] %asi,	%f21
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x1f
	membar	#Sync
	brlz	%o6,	loop_2340
	fbuge,a	%fcc1,	loop_2341
	fzero	%f24
	fmul8x16au	%f11,	%f24,	%f30
loop_2340:
	fmovrslz	%l3,	%f22,	%f3
loop_2341:
	fmovdle	%xcc,	%f15,	%f29
	ba,a	loop_2342
	edge8ln	%o7,	%g5,	%i5
	tg	%icc,	0x0
	fba	%fcc0,	loop_2343
loop_2342:
	fnot1s	%f22,	%f10
	fbule	%fcc1,	loop_2344
	tsubcc	%l5,	%g2,	%g7
loop_2343:
	movneg	%icc,	%l4,	%i6
	movleu	%icc,	%g1,	%o4
loop_2344:
	edge32	%l0,	%i3,	%o0
	udiv	%l6,	0x1A67,	%i1
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%f10
	fandnot1	%f28,	%f30,	%f20
	fbne,a	%fcc3,	loop_2345
	edge8n	%i2,	%g6,	%l1
	movrne	%i4,	0x101,	%o2
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x3F] %asi,	%l2
loop_2345:
	nop
	set	0x5D, %o3
	ldstuba	[%l7 + %o3] 0x19,	%o5
	fnegs	%f11,	%f18
	fandnot1s	%f14,	%f10,	%f7
	ba,a,pt	%xcc,	loop_2346
	movpos	%icc,	%i7,	%g4
	srlx	%o1,	%g3,	%i0
	te	%icc,	0x5
loop_2346:
	fcmpd	%fcc2,	%f2,	%f14
	set	0x5C, %i4
	sta	%f23,	[%l7 + %i4] 0x10
	fmovsvc	%icc,	%f11,	%f21
	edge8l	%o3,	%l3,	%o7
	edge16	%o6,	%i5,	%g5
	membar	0x10
	set	0x54, %g3
	ldsba	[%l7 + %g3] 0x88,	%l5
	fmovdge	%xcc,	%f12,	%f3
	subccc	%g2,	0x06A1,	%l4
	andcc	%i6,	%g7,	%o4
	taddcctv	%g1,	%i3,	%l0
	tl	%icc,	0x2
	movge	%xcc,	%l6,	%i1
	fxnor	%f20,	%f18,	%f20
	te	%icc,	0x0
	stb	%o0,	[%l7 + 0x2D]
	set	0x108, %g4
	ldxa	[%g0 + %g4] 0x21,	%i2
	fands	%f9,	%f13,	%f24
	fornot1	%f30,	%f16,	%f0
	srl	%l1,	0x1F,	%g6
	taddcc	%i4,	0x02EA,	%l2
	fmovdgu	%xcc,	%f12,	%f22
	fmovdneg	%icc,	%f17,	%f25
	move	%xcc,	%o2,	%i7
	brz,a	%o5,	loop_2347
	sll	%g4,	0x16,	%o1
	wr	%g0,	0x80,	%asi
	stha	%i0,	[%l7 + 0x2A] %asi
loop_2347:
	brgz	%o3,	loop_2348
	bn,pn	%xcc,	loop_2349
	fcmps	%fcc0,	%f8,	%f22
	xnorcc	%l3,	0x165F,	%o7
loop_2348:
	move	%icc,	%o6,	%i5
loop_2349:
	umul	%g5,	0x0969,	%g3
	udiv	%l5,	0x17E2,	%l4
	movrne	%g2,	%i6,	%g7
	fmovdneg	%xcc,	%f30,	%f1
	movrlez	%o4,	%g1,	%l0
	sdivcc	%i3,	0x0F86,	%l6
	srlx	%i1,	0x1F,	%i2
	add	%o0,	%l1,	%i4
	andcc	%g6,	0x0B26,	%o2
	st	%f22,	[%l7 + 0x48]
	siam	0x7
	udivcc	%l2,	0x0C80,	%i7
	srl	%g4,	%o5,	%i0
	fmovdle	%icc,	%f19,	%f3
	fone	%f8
	edge16l	%o1,	%l3,	%o3
	array8	%o7,	%o6,	%g5
	be,a,pn	%icc,	loop_2350
	tgu	%xcc,	0x3
	movvs	%xcc,	%i5,	%l5
	movrne	%g3,	0x18D,	%l4
loop_2350:
	edge32n	%i6,	%g7,	%o4
	sdiv	%g1,	0x1FAF,	%l0
	edge16ln	%i3,	%l6,	%g2
	bl	%icc,	loop_2351
	fpsub16	%f28,	%f16,	%f28
	tsubcc	%i1,	0x1DF1,	%i2
	fmovdgu	%xcc,	%f24,	%f26
loop_2351:
	fcmpne16	%f18,	%f14,	%l1
	edge8n	%o0,	%g6,	%i4
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x48] %asi,	%f13
	fmovda	%xcc,	%f24,	%f8
	fnot1	%f28,	%f12
	tge	%icc,	0x4
	tn	%icc,	0x0
	fmuld8ulx16	%f18,	%f3,	%f12
	edge32n	%l2,	%o2,	%g4
	std	%f10,	[%l7 + 0x08]
	fsrc1s	%f14,	%f7
	bl,a	%xcc,	loop_2352
	fsrc2	%f12,	%f10
	fornot1	%f28,	%f6,	%f18
	xnor	%i7,	%i0,	%o1
loop_2352:
	fmovsgu	%xcc,	%f19,	%f11
	fbl,a	%fcc2,	loop_2353
	tvc	%xcc,	0x6
	movvs	%xcc,	%l3,	%o3
	sll	%o5,	0x1C,	%o7
loop_2353:
	edge32	%g5,	%o6,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	stba	%g3,	[%l7 + 0x5F] %asi
	alignaddr	%l4,	%l5,	%i6
	wr	%g0,	0x89,	%asi
	stha	%g7,	[%l7 + 0x46] %asi
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x15] %asi,	%o4
	fmovsl	%icc,	%f19,	%f4
	fbe,a	%fcc1,	loop_2354
	movpos	%xcc,	%g1,	%l0
	addcc	%l6,	0x052E,	%g2
	smulcc	%i1,	0x04FA,	%i2
loop_2354:
	fpadd32s	%f17,	%f1,	%f24
	movg	%icc,	%l1,	%o0
	set	0x4C, %l1
	ldsha	[%l7 + %l1] 0x18,	%i3
	edge16n	%i4,	%g6,	%l2
	andn	%o2,	%g4,	%i0
	fmovrslez	%i7,	%f4,	%f29
	fmuld8ulx16	%f30,	%f19,	%f6
	sethi	0x15D8,	%l3
	fands	%f3,	%f21,	%f15
	array8	%o3,	%o1,	%o5
	fpack32	%f0,	%f2,	%f28
	sllx	%o7,	%g5,	%o6
	fnands	%f1,	%f24,	%f25
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x20] %asi,	%i5
	fmovda	%xcc,	%f10,	%f4
	fcmpd	%fcc3,	%f4,	%f0
	xnor	%l4,	%l5,	%g3
	movrlz	%i6,	0x3AA,	%o4
	fmovde	%icc,	%f10,	%f10
	stw	%g7,	[%l7 + 0x24]
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	edge32ln	%l0,	%l6,	%g1
	fandnot1s	%f3,	%f18,	%f14
	movneg	%xcc,	%g2,	%i1
	fmovd	%f0,	%f10
	fmovsvc	%icc,	%f0,	%f23
	bleu	%icc,	loop_2355
	andn	%l1,	0x1185,	%o0
	swap	[%l7 + 0x38],	%i2
	fpadd16s	%f19,	%f21,	%f31
loop_2355:
	brgz	%i3,	loop_2356
	fxnor	%f20,	%f2,	%f2
	movcs	%icc,	%g6,	%l2
	movpos	%xcc,	%o2,	%i4
loop_2356:
	srlx	%i0,	%g4,	%l3
	sethi	0x04AB,	%i7
	xorcc	%o1,	0x1DDF,	%o5
	fbl,a	%fcc3,	loop_2357
	umul	%o3,	0x134D,	%o7
	fmovsgu	%icc,	%f4,	%f1
	edge16ln	%g5,	%i5,	%l4
loop_2357:
	bg	%xcc,	loop_2358
	fmul8sux16	%f14,	%f8,	%f30
	sllx	%o6,	0x08,	%g3
	smulcc	%l5,	0x02F0,	%o4
loop_2358:
	ba,a,pn	%icc,	loop_2359
	lduh	[%l7 + 0x34],	%g7
	tcc	%icc,	0x5
	ldd	[%l7 + 0x30],	%i6
loop_2359:
	movrlz	%l6,	0x26F,	%g1
	fpadd16s	%f4,	%f29,	%f18
	fnand	%f26,	%f18,	%f12
	fmovsvc	%xcc,	%f18,	%f9
	movcc	%xcc,	%l0,	%g2
	fand	%f30,	%f22,	%f28
	fmovd	%f6,	%f30
	move	%icc,	%i1,	%l1
	fmovdle	%icc,	%f24,	%f29
	tsubcc	%o0,	0x1783,	%i3
	fbg	%fcc2,	loop_2360
	movgu	%xcc,	%g6,	%i2
	movleu	%icc,	%l2,	%i4
	edge32	%o2,	%i0,	%g4
loop_2360:
	bcs	%xcc,	loop_2361
	nop
	set	0x48, %i1
	std	%l2,	[%l7 + %i1]
	set	0x60, %l3
	stwa	%i7,	[%l7 + %l3] 0x11
loop_2361:
	smul	%o1,	%o3,	%o7
	sra	%o5,	%g5,	%l4
	nop
	set	0x1C, %l5
	lduw	[%l7 + %l5],	%i5
	tg	%icc,	0x6
	brgez	%g3,	loop_2362
	fmovsle	%xcc,	%f10,	%f6
	movle	%xcc,	%l5,	%o4
	alignaddrl	%g7,	%i6,	%l6
loop_2362:
	smulcc	%g1,	0x0F64,	%o6
	movre	%g2,	0x392,	%i1
	tcc	%icc,	0x3
	fcmple16	%f6,	%f28,	%l1
	xnorcc	%o0,	0x1119,	%i3
	fabss	%f19,	%f5
	ta	%icc,	0x3
	movge	%icc,	%l0,	%i2
	st	%f9,	[%l7 + 0x2C]
	edge32	%l2,	%i4,	%o2
	bneg,a	loop_2363
	st	%f21,	[%l7 + 0x54]
	fpackfix	%f24,	%f3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2363:
	fmovsleu	%xcc,	%f17,	%f28
	ta	%xcc,	0x5
	subccc	%i0,	0x0F96,	%g6
	orn	%g4,	0x02CE,	%l3
	stb	%o1,	[%l7 + 0x20]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
	fmovrse	%o3,	%f16,	%f10
	fbo	%fcc1,	loop_2364
	fcmpeq32	%f8,	%f24,	%o7
	edge16l	%o5,	%i7,	%g5
	fcmped	%fcc1,	%f18,	%f10
loop_2364:
	fbg	%fcc0,	loop_2365
	stbar
	tgu	%icc,	0x2
	sdivcc	%i5,	0x16EF,	%g3
loop_2365:
	tle	%icc,	0x0
	fmuld8ulx16	%f3,	%f7,	%f30
	swap	[%l7 + 0x44],	%l4
	array32	%l5,	%g7,	%i6
	fpsub16	%f10,	%f12,	%f16
	fbue	%fcc2,	loop_2366
	movg	%xcc,	%o4,	%l6
	movvc	%xcc,	%o6,	%g1
	tsubcctv	%i1,	0x076F,	%g2
loop_2366:
	tle	%xcc,	0x2
	fmuld8sux16	%f18,	%f15,	%f6
	fmovdleu	%xcc,	%f11,	%f19
	ta	%xcc,	0x0
	fba	%fcc2,	loop_2367
	call	loop_2368
	sllx	%l1,	0x0A,	%i3
	movre	%o0,	0x1C4,	%l0
loop_2367:
	edge32ln	%i2,	%i4,	%l2
loop_2368:
	te	%icc,	0x1
	fpadd16	%f14,	%f14,	%f18
	umulcc	%o2,	%g6,	%i0
	fpsub32	%f26,	%f18,	%f30
	movvs	%xcc,	%l3,	%g4
	fpack16	%f26,	%f29
	move	%icc,	%o1,	%o7
	srlx	%o5,	%o3,	%g5
	move	%icc,	%i5,	%g3
	movrgz	%l4,	0x25B,	%i7
	xnor	%g7,	%l5,	%o4
	tcc	%icc,	0x5
	movrlz	%i6,	0x0A0,	%l6
	edge16	%g1,	%i1,	%o6
	subccc	%g2,	0x0D67,	%i3
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x18
	mova	%xcc,	%l1,	%o0
	edge32ln	%l0,	%i2,	%l2
	xnor	%o2,	%g6,	%i4
	movneg	%icc,	%l3,	%g4
	fmovsne	%icc,	%f1,	%f31
	tle	%icc,	0x4
	tn	%icc,	0x3
	brlz,a	%o1,	loop_2369
	fone	%f26
	udivcc	%o7,	0x109D,	%i0
	edge16l	%o5,	%o3,	%i5
loop_2369:
	nop
	wr	%g0,	0x80,	%asi
	stxa	%g5,	[%l7 + 0x18] %asi
	set	0x74, %o1
	lda	[%l7 + %o1] 0x15,	%f19
	orncc	%g3,	%l4,	%i7
	taddcctv	%l5,	%g7,	%o4
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	ldd	[%l7 + 0x10],	%f26
	bvc,a	%icc,	loop_2370
	fbule	%fcc2,	loop_2371
	movcs	%xcc,	%l6,	%i6
	move	%xcc,	%g1,	%i1
loop_2370:
	popc	%o6,	%g2
loop_2371:
	tle	%icc,	0x7
	movrlez	%i3,	0x1C5,	%o0
	set	0x1B, %i3
	lduba	[%l7 + %i3] 0x04,	%l0
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	nop
	set	0x38, %o4
	ldx	[%l7 + %o4],	%l1
	sub	%l2,	%i2,	%o2
	tneg	%xcc,	0x4
	srlx	%i4,	0x1E,	%g6
	xnorcc	%g4,	%l3,	%o1
	andncc	%o7,	%i0,	%o5
	subc	%i5,	0x1E23,	%g5
	sdivcc	%o3,	0x0D22,	%l4
	fand	%f26,	%f16,	%f18
	std	%g2,	[%l7 + 0x78]
	tcc	%icc,	0x3
	movvs	%xcc,	%l5,	%g7
	set	0x40, %g5
	lduwa	[%l7 + %g5] 0x0c,	%i7
	nop
	set	0x2E, %g2
	ldstub	[%l7 + %g2],	%l6
	fnot1	%f0,	%f24
	xnorcc	%i6,	%g1,	%o4
	movrlz	%o6,	%g2,	%i3
	nop
	set	0x18, %o6
	ldx	[%l7 + %o6],	%i1
	fandnot2	%f14,	%f4,	%f4
	andn	%o0,	0x04F0,	%l0
	fmovsl	%xcc,	%f14,	%f28
	sdiv	%l1,	0x096B,	%i2
	fmovsneg	%icc,	%f6,	%f9
	movle	%icc,	%o2,	%l2
	fmovspos	%xcc,	%f7,	%f16
	nop
	setx	loop_2372,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdiv	%i4,	0x134D,	%g4
	fpadd16	%f20,	%f18,	%f4
	movleu	%icc,	%l3,	%g6
loop_2372:
	edge16n	%o7,	%i0,	%o1
	subc	%o5,	%i5,	%o3
	andncc	%g5,	%g3,	%l4
	nop
	setx loop_2373, %l0, %l1
	jmpl %l1, %l5
	edge8ln	%i7,	%g7,	%i6
	fmovdcc	%icc,	%f30,	%f24
	ldd	[%l7 + 0x48],	%f16
loop_2373:
	fmovdcc	%xcc,	%f31,	%f1
	or	%l6,	0x1D3F,	%g1
	array16	%o6,	%o4,	%g2
	movl	%icc,	%i1,	%o0
	edge32	%i3,	%l0,	%i2
	bgu,pn	%icc,	loop_2374
	tle	%xcc,	0x5
	bshuffle	%f12,	%f4,	%f10
	sllx	%l1,	0x10,	%o2
loop_2374:
	xnor	%i4,	0x0ED2,	%l2
	set	0x1A, %l2
	lduha	[%l7 + %l2] 0x11,	%g4
	brgz,a	%g6,	loop_2375
	smul	%l3,	0x018B,	%i0
	fmul8x16au	%f28,	%f15,	%f8
	prefetch	[%l7 + 0x70],	 0x0
loop_2375:
	fba,a	%fcc2,	loop_2376
	ldstub	[%l7 + 0x3A],	%o7
	fmovrsgez	%o1,	%f0,	%f6
	movgu	%xcc,	%i5,	%o5
loop_2376:
	sllx	%o3,	0x1E,	%g5
	fmovda	%icc,	%f21,	%f5
	taddcctv	%l4,	%l5,	%i7
	fornot1s	%f8,	%f28,	%f0
	call	loop_2377
	fors	%f19,	%f18,	%f25
	srax	%g7,	%g3,	%i6
	tge	%icc,	0x3
loop_2377:
	edge8ln	%g1,	%l6,	%o4
	fbul,a	%fcc3,	loop_2378
	edge16ln	%g2,	%i1,	%o6
	movgu	%xcc,	%o0,	%l0
	movge	%xcc,	%i2,	%l1
loop_2378:
	andn	%o2,	0x1BAB,	%i3
	bl	loop_2379
	brlz,a	%l2,	loop_2380
	fpsub16	%f30,	%f0,	%f0
	fmul8x16au	%f16,	%f2,	%f10
loop_2379:
	fexpand	%f11,	%f28
loop_2380:
	tle	%xcc,	0x3
	ta	%xcc,	0x1
	edge8	%g4,	%g6,	%l3
	movrgez	%i0,	%o7,	%i4
	fabss	%f29,	%f4
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x3C] %asi,	%i5
	array32	%o5,	%o1,	%o3
	fpsub32s	%f10,	%f2,	%f17
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l4,	0x08D9,	%g5
	set	0x0C, %i0
	swapa	[%l7 + %i0] 0x80,	%l5
	fmovrslz	%i7,	%f15,	%f1
	movne	%xcc,	%g3,	%g7
	movrne	%i6,	%g1,	%l6
	movneg	%xcc,	%g2,	%i1
	fbul	%fcc0,	loop_2381
	edge32l	%o4,	%o0,	%o6
	bpos,a	loop_2382
	st	%f26,	[%l7 + 0x38]
loop_2381:
	tg	%icc,	0x2
	alignaddrl	%l0,	%l1,	%i2
loop_2382:
	fmovspos	%xcc,	%f2,	%f14
	srlx	%i3,	%l2,	%g4
	swap	[%l7 + 0x48],	%o2
	fbue,a	%fcc2,	loop_2383
	fors	%f11,	%f15,	%f10
	umulcc	%l3,	0x1871,	%g6
	edge8	%i0,	%i4,	%i5
loop_2383:
	edge32	%o5,	%o7,	%o3
	sdiv	%o1,	0x00BD,	%g5
	sth	%l5,	[%l7 + 0x78]
	edge16	%l4,	%i7,	%g3
	bneg,a,pt	%xcc,	loop_2384
	movrgz	%i6,	%g7,	%l6
	movle	%xcc,	%g1,	%g2
	mulscc	%i1,	0x0CFA,	%o4
loop_2384:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o0,	0x018A,	%l0
	fcmped	%fcc3,	%f10,	%f20
	brgez,a	%l1,	loop_2385
	or	%i2,	%i3,	%o6
	tcs	%xcc,	0x2
	movg	%xcc,	%l2,	%o2
loop_2385:
	sra	%l3,	0x0B,	%g6
	bl	loop_2386
	tsubcc	%i0,	%g4,	%i5
	te	%icc,	0x2
	andncc	%i4,	%o5,	%o3
loop_2386:
	tgu	%icc,	0x1
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x60] %asi,	%o7
	fcmpne32	%f26,	%f0,	%o1
	edge8n	%g5,	%l5,	%i7
	fexpand	%f30,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_2387, %l0, %l1
	jmpl %l1, %l4
	movneg	%xcc,	%i6,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g3,	0x1C54,	%g1
loop_2387:
	tge	%icc,	0x3
	movpos	%icc,	%l6,	%i1
	fmovsneg	%icc,	%f18,	%f8
	fmul8x16al	%f16,	%f20,	%f18
	membar	0x50
	tsubcctv	%g2,	%o4,	%l0
	edge8ln	%l1,	%i2,	%i3
	sethi	0x19BF,	%o6
	popc	0x088A,	%o0
	tgu	%xcc,	0x6
	sdiv	%l2,	0x0AA0,	%l3
	fmovdvc	%xcc,	%f8,	%f27
	bge,pt	%xcc,	loop_2388
	addccc	%g6,	0x07C9,	%i0
	fbo,a	%fcc0,	loop_2389
	popc	0x0437,	%g4
loop_2388:
	ldsh	[%l7 + 0x18],	%i5
	sethi	0x1716,	%i4
loop_2389:
	movle	%icc,	%o2,	%o5
	fandnot2	%f20,	%f24,	%f4
	bcs	%icc,	loop_2390
	ldsw	[%l7 + 0x38],	%o7
	fmovsne	%xcc,	%f23,	%f19
	set	0x24, %l0
	ldsha	[%l7 + %l0] 0x11,	%o3
loop_2390:
	array32	%g5,	%o1,	%i7
	ldd	[%l7 + 0x10],	%l4
	move	%icc,	%l4,	%i6
	edge32ln	%g7,	%g1,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x30] %asi,	%f11
	nop
	set	0x44, %g6
	sth	%i1,	[%l7 + %g6]
	sethi	0x0966,	%g2
	srlx	%g3,	0x13,	%o4
	sdivcc	%l0,	0x04E1,	%i2
	sll	%i3,	%l1,	%o0
	fmovse	%xcc,	%f24,	%f21
	taddcc	%l2,	0x0440,	%o6
	edge16l	%g6,	%i0,	%l3
	array8	%i5,	%i4,	%g4
	brlz	%o2,	loop_2391
	umulcc	%o7,	%o3,	%o5
	fcmpeq32	%f2,	%f16,	%o1
	fbule	%fcc0,	loop_2392
loop_2391:
	sllx	%g5,	%l5,	%l4
	addcc	%i7,	%i6,	%g1
	edge8l	%g7,	%i1,	%l6
loop_2392:
	sir	0x1A26
	flush	%l7 + 0x30
	andcc	%g2,	%o4,	%g3
	tsubcctv	%i2,	0x03DF,	%l0
	ta	%icc,	0x5
	bgu,a	%xcc,	loop_2393
	fmovdvs	%xcc,	%f16,	%f15
	udivcc	%i3,	0x1D90,	%l1
	fmovsg	%xcc,	%f22,	%f12
loop_2393:
	tsubcc	%o0,	0x1D11,	%o6
	tn	%xcc,	0x2
	fmovdn	%icc,	%f8,	%f27
	fbo	%fcc0,	loop_2394
	andncc	%l2,	%g6,	%l3
	fmovdn	%xcc,	%f4,	%f6
	andcc	%i0,	0x00D9,	%i4
loop_2394:
	movre	%i5,	%g4,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%icc,	0x0
	fmul8x16	%f7,	%f24,	%f24
	udivx	%o7,	0x140D,	%o3
	orn	%o1,	%o5,	%l5
	set	0x50, %i2
	lduba	[%l7 + %i2] 0x15,	%g5
	tg	%icc,	0x5
	pdist	%f18,	%f22,	%f30
	fmovdcs	%xcc,	%f25,	%f3
	tn	%xcc,	0x1
	xnor	%l4,	%i7,	%g1
	tne	%xcc,	0x7
	edge8n	%g7,	%i1,	%i6
	movcs	%icc,	%l6,	%g2
	movgu	%icc,	%o4,	%i2
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x18] %asi,	%g3
	fba	%fcc3,	loop_2395
	ble,pt	%icc,	loop_2396
	taddcctv	%l0,	0x1173,	%i3
	fmovrdlez	%o0,	%f14,	%f2
loop_2395:
	movre	%o6,	0x2A5,	%l2
loop_2396:
	andncc	%g6,	%l3,	%i0
	andn	%i4,	%i5,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l1,	0x13D8,	%o2
	fmovsl	%xcc,	%f21,	%f5
	popc	%o3,	%o7
	fmovdg	%xcc,	%f17,	%f30
	tleu	%xcc,	0x1
	fmovdg	%xcc,	%f8,	%f13
	for	%f22,	%f20,	%f16
	fmovdcc	%icc,	%f4,	%f4
	edge16	%o1,	%l5,	%o5
	sub	%g5,	%l4,	%g1
	fmovdcs	%icc,	%f27,	%f10
	fmovsl	%xcc,	%f14,	%f21
	or	%i7,	0x0BC5,	%g7
	bg,a	loop_2397
	udiv	%i1,	0x0F9E,	%l6
	fands	%f1,	%f25,	%f10
	umul	%g2,	0x0C84,	%o4
loop_2397:
	mulx	%i6,	%g3,	%l0
	fmovdvs	%xcc,	%f12,	%f10
	ldstub	[%l7 + 0x0D],	%i3
	xnor	%i2,	%o0,	%o6
	add	%g6,	0x0918,	%l2
	array8	%i0,	%l3,	%i4
	popc	%i5,	%l1
	fzeros	%f13
	sdivcc	%o2,	0x0B7C,	%g4
	addc	%o3,	%o7,	%o1
	array32	%l5,	%o5,	%g5
	tcc	%xcc,	0x1
	sdiv	%g1,	0x0B57,	%l4
	movge	%xcc,	%i7,	%g7
	udivcc	%i1,	0x05EF,	%g2
	brlz	%o4,	loop_2398
	fmovrslez	%i6,	%f9,	%f29
	movneg	%xcc,	%l6,	%l0
	edge8ln	%g3,	%i3,	%i2
loop_2398:
	ta	%icc,	0x7
	fbuge	%fcc1,	loop_2399
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x23,	%asi
	stha	%o6,	[%l7 + 0x36] %asi
	membar	#Sync
loop_2399:
	movpos	%xcc,	%g6,	%l2
	edge8l	%o0,	%i0,	%l3
	fmul8x16al	%f18,	%f7,	%f14
	mova	%xcc,	%i5,	%l1
	sdivx	%o2,	0x196F,	%g4
	fmovdleu	%icc,	%f24,	%f2
	ldd	[%l7 + 0x08],	%o2
	nop
	setx	loop_2400,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tleu	%icc,	0x0
	fble	%fcc0,	loop_2401
	bg,a,pn	%xcc,	loop_2402
loop_2400:
	movneg	%xcc,	%i4,	%o7
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x63] %asi,	%l5
loop_2401:
	fbul,a	%fcc0,	loop_2403
loop_2402:
	umulcc	%o5,	0x19CD,	%g5
	fmovdg	%xcc,	%f30,	%f16
	srlx	%g1,	0x13,	%o1
loop_2403:
	fmul8ulx16	%f0,	%f22,	%f14
	orn	%i7,	0x1BE2,	%l4
	brlz,a	%i1,	loop_2404
	std	%g6,	[%l7 + 0x28]
	movrgez	%o4,	0x1AD,	%g2
	sra	%i6,	0x01,	%l6
loop_2404:
	movrne	%g3,	0x24C,	%i3
	movrgez	%i2,	%l0,	%g6
	fnegd	%f6,	%f10
	brz,a	%o6,	loop_2405
	brgz	%l2,	loop_2406
	xor	%o0,	%i0,	%i5
	nop
	setx	loop_2407,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2405:
	ble	loop_2408
loop_2406:
	prefetch	[%l7 + 0x40],	 0x3
	udivcc	%l3,	0x067F,	%l1
loop_2407:
	fmovsvs	%xcc,	%f11,	%f0
loop_2408:
	sir	0x1F41
	fmovscc	%xcc,	%f16,	%f15
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fsrc2s	%f21,	%f26
	srlx	%o2,	%g4,	%o3
	tvc	%icc,	0x3
	fmovdcs	%xcc,	%f24,	%f24
	tg	%icc,	0x1
	udivcc	%o7,	0x01BD,	%i4
	ldd	[%l7 + 0x10],	%f30
	tvs	%icc,	0x3
	orcc	%l5,	%g5,	%g1
	movge	%xcc,	%o5,	%o1
	fmovdcs	%icc,	%f15,	%f31
	lduh	[%l7 + 0x3C],	%i7
	fmovrdlez	%i1,	%f12,	%f30
	ldx	[%l7 + 0x50],	%g7
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l4,	%g2
	sth	%i6,	[%l7 + 0x42]
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	and	%o4,	0x1BD0,	%i3
	orn	%g3,	0x1DA8,	%i2
	movn	%xcc,	%l0,	%o6
	brlz,a	%g6,	loop_2409
	fbule	%fcc0,	loop_2410
	fmuld8ulx16	%f28,	%f14,	%f24
	movrgz	%l2,	0x06E,	%i0
loop_2409:
	nop
	set	0x14, %l4
	lduha	[%l7 + %l4] 0x04,	%o0
loop_2410:
	nop
	setx loop_2411, %l0, %l1
	jmpl %l1, %l3
	fbul,a	%fcc0,	loop_2412
	fxors	%f27,	%f30,	%f0
	movrgez	%l1,	0x0DC,	%i5
loop_2411:
	orn	%g4,	0x0240,	%o2
loop_2412:
	edge32ln	%o7,	%i4,	%l5
	std	%o2,	[%l7 + 0x48]
	edge16ln	%g1,	%g5,	%o5
	movcc	%icc,	%o1,	%i7
	addccc	%g7,	0x000B,	%i1
	movrgez	%l4,	%i6,	%l6
	alignaddr	%g2,	%i3,	%o4
	taddcctv	%g3,	0x1004,	%l0
	bvs,a	%icc,	loop_2413
	array16	%i2,	%g6,	%o6
	mulscc	%l2,	%o0,	%l3
	mulx	%i0,	0x1348,	%l1
loop_2413:
	taddcctv	%g4,	%o2,	%o7
	pdist	%f20,	%f6,	%f8
	alignaddr	%i5,	%i4,	%l5
	fmovdneg	%xcc,	%f31,	%f3
	tle	%icc,	0x5
	st	%f11,	[%l7 + 0x58]
	fsrc1	%f16,	%f2
	andn	%o3,	%g1,	%o5
	movcc	%xcc,	%o1,	%g5
	ld	[%l7 + 0x6C],	%f5
	set	0x40, %i5
	stwa	%g7,	[%l7 + %i5] 0x04
	tleu	%icc,	0x0
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i7,	%i1
	prefetch	[%l7 + 0x70],	 0x2
	subcc	%l4,	0x0EC0,	%l6
	movpos	%xcc,	%i6,	%g2
	tl	%icc,	0x2
	fnand	%f2,	%f20,	%f4
	fbge	%fcc3,	loop_2414
	stw	%o4,	[%l7 + 0x78]
	edge16n	%i3,	%g3,	%i2
	orncc	%l0,	0x1FED,	%o6
loop_2414:
	taddcc	%l2,	%g6,	%l3
	or	%o0,	0x0201,	%l1
	std	%f26,	[%l7 + 0x78]
	srax	%i0,	0x1F,	%o2
	edge16l	%g4,	%o7,	%i5
	brlz,a	%i4,	loop_2415
	orcc	%l5,	%o3,	%o5
	brz	%g1,	loop_2416
	std	%g4,	[%l7 + 0x70]
loop_2415:
	nop
	set	0x65, %o5
	ldsba	[%l7 + %o5] 0x81,	%o1
loop_2416:
	ta	%icc,	0x7
	subc	%i7,	%g7,	%l4
	alignaddrl	%i1,	%l6,	%g2
	addc	%o4,	0x1C58,	%i6
	fba	%fcc1,	loop_2417
	bn,pt	%xcc,	loop_2418
	tsubcctv	%g3,	%i3,	%l0
	tleu	%xcc,	0x6
loop_2417:
	movrgez	%o6,	%l2,	%g6
loop_2418:
	movre	%i2,	%o0,	%l1
	fmovsg	%icc,	%f24,	%f14
	sir	0x1FDF
	edge8ln	%l3,	%i0,	%g4
	fcmped	%fcc1,	%f8,	%f30
	tneg	%xcc,	0x3
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%o7
	movne	%xcc,	%i5,	%i4
	std	%f10,	[%l7 + 0x70]
	bne	loop_2419
	edge8l	%l5,	%o2,	%o5
	tvs	%icc,	0x2
	movn	%xcc,	%o3,	%g5
loop_2419:
	sir	0x1622
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%o1
	bpos	%xcc,	loop_2420
	tne	%xcc,	0x3
	movrgez	%i7,	0x148,	%g7
	nop
	set	0x36, %i7
	stb	%g1,	[%l7 + %i7]
loop_2420:
	std	%f4,	[%l7 + 0x68]
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x36] %asi,	%l4
	for	%f2,	%f22,	%f4
	movvs	%xcc,	%i1,	%g2
	fnands	%f10,	%f18,	%f6
	bne,a	%icc,	loop_2421
	flush	%l7 + 0x7C
	edge8n	%o4,	%i6,	%l6
	tn	%xcc,	0x0
loop_2421:
	fandnot1	%f26,	%f26,	%f18
	bl	%xcc,	loop_2422
	sir	0x113D
	tsubcctv	%i3,	0x0A81,	%l0
	alignaddrl	%o6,	%g3,	%g6
loop_2422:
	andn	%i2,	0x14C6,	%o0
	nop
	setx loop_2423, %l0, %l1
	jmpl %l1, %l1
	fbuge	%fcc3,	loop_2424
	nop
	setx loop_2425, %l0, %l1
	jmpl %l1, %l3
	edge16l	%l2,	%g4,	%i0
loop_2423:
	or	%o7,	%i4,	%i5
loop_2424:
	move	%xcc,	%o2,	%o5
loop_2425:
	mulx	%o3,	%g5,	%o1
	fbne,a	%fcc2,	loop_2426
	sir	0x0901
	flush	%l7 + 0x3C
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x10,	%l5,	%g7
loop_2426:
	fbn,a	%fcc3,	loop_2427
	sethi	0x1CA5,	%i7
	udivcc	%l4,	0x014B,	%g1
	movcs	%xcc,	%g2,	%i1
loop_2427:
	move	%xcc,	%o4,	%i6
	movcc	%xcc,	%i3,	%l6
	bcs	%xcc,	loop_2428
	tgu	%xcc,	0x5
	set	0x14, %g7
	lduha	[%l7 + %g7] 0x10,	%o6
loop_2428:
	fpsub32s	%f27,	%f21,	%f20
	wr	%g0,	0xea,	%asi
	stha	%l0,	[%l7 + 0x66] %asi
	membar	#Sync
	alignaddr	%g3,	%g6,	%o0
	edge8ln	%l1,	%l3,	%i2
	edge8	%l2,	%g4,	%i0
	std	%i4,	[%l7 + 0x40]
	bl,a	loop_2429
	fba,a	%fcc0,	loop_2430
	fands	%f27,	%f28,	%f12
	fbge,a	%fcc2,	loop_2431
loop_2429:
	fzero	%f30
loop_2430:
	fornot1s	%f7,	%f0,	%f0
	bl,pt	%xcc,	loop_2432
loop_2431:
	tvs	%xcc,	0x2
	srl	%o7,	0x14,	%o2
	edge32l	%o5,	%o3,	%g5
loop_2432:
	edge32l	%i5,	%l5,	%g7
	sdivcc	%o1,	0x1E50,	%l4
	te	%icc,	0x6
	bl,a	%icc,	loop_2433
	tne	%icc,	0x0
	ta	%xcc,	0x7
	set	0x62, %g1
	lduha	[%l7 + %g1] 0x19,	%g1
loop_2433:
	alignaddr	%i7,	%i1,	%g2
	set	0x3C, %l6
	lda	[%l7 + %l6] 0x19,	%f28
	fmovdleu	%xcc,	%f23,	%f2
	tcs	%xcc,	0x6
	smulcc	%i6,	0x1695,	%i3
	sethi	0x13EB,	%l6
	tvc	%xcc,	0x2
	fbge,a	%fcc1,	loop_2434
	movrne	%o4,	0x039,	%o6
	fmovsge	%xcc,	%f30,	%f18
	edge32	%g3,	%g6,	%l0
loop_2434:
	edge16	%o0,	%l3,	%i2
	bleu,a	loop_2435
	fbne,a	%fcc0,	loop_2436
	subccc	%l2,	%g4,	%i0
	bne,pn	%xcc,	loop_2437
loop_2435:
	fmovdn	%xcc,	%f16,	%f8
loop_2436:
	be,a,pt	%xcc,	loop_2438
	movg	%icc,	%i4,	%o7
loop_2437:
	srax	%o2,	%o5,	%l1
	movrlez	%o3,	0x0A1,	%i5
loop_2438:
	fnands	%f31,	%f19,	%f1
	or	%g5,	0x170B,	%g7
	sll	%o1,	%l5,	%g1
	prefetch	[%l7 + 0x74],	 0x0
	edge32ln	%l4,	%i1,	%g2
	brz	%i7,	loop_2439
	ldsb	[%l7 + 0x3F],	%i3
	fmovscs	%xcc,	%f30,	%f3
	edge32n	%i6,	%o4,	%l6
loop_2439:
	mova	%icc,	%o6,	%g3
	udiv	%l0,	0x17BC,	%g6
	set	0x10, %o2
	ldda	[%l7 + %o2] 0x04,	%l2
	edge16n	%o0,	%l2,	%i2
	smulcc	%i0,	0x1C46,	%i4
	fmuld8ulx16	%f17,	%f17,	%f14
	orn	%o7,	%g4,	%o2
	movrlz	%l1,	0x24B,	%o3
	fmovda	%xcc,	%f10,	%f20
	te	%xcc,	0x3
	fmovdneg	%icc,	%f8,	%f10
	edge32l	%o5,	%i5,	%g5
	subccc	%g7,	%o1,	%l5
	fmovrslz	%g1,	%f0,	%f4
	swap	[%l7 + 0x70],	%l4
	taddcc	%i1,	%g2,	%i3
	prefetch	[%l7 + 0x0C],	 0x3
	fmovscs	%icc,	%f28,	%f16
	ldx	[%l7 + 0x38],	%i7
	xorcc	%o4,	%i6,	%o6
	te	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l6,	%l0,	%g3
	tneg	%icc,	0x2
	fbg	%fcc0,	loop_2440
	edge32	%l3,	%o0,	%g6
	tsubcctv	%i2,	%l2,	%i0
	movl	%icc,	%o7,	%g4
loop_2440:
	fexpand	%f3,	%f4
	fbne	%fcc3,	loop_2441
	prefetch	[%l7 + 0x18],	 0x3
	edge32l	%o2,	%i4,	%o3
	bvs,a,pn	%xcc,	loop_2442
loop_2441:
	tsubcctv	%l1,	0x161C,	%i5
	tg	%icc,	0x0
	fbe,a	%fcc2,	loop_2443
loop_2442:
	subcc	%o5,	%g5,	%g7
	nop
	setx	loop_2444,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%l5,	%o1,	%g1
loop_2443:
	nop
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x44] %asi,	%l4
loop_2444:
	fmovsg	%icc,	%f24,	%f0
	andcc	%i1,	0x1F9D,	%i3
	xor	%g2,	0x1F36,	%i7
	sethi	0x0547,	%i6
	sub	%o4,	0x1F99,	%l6
	movrlz	%o6,	%l0,	%l3
	bpos,a	%xcc,	loop_2445
	move	%icc,	%g3,	%o0
	move	%xcc,	%g6,	%l2
	srlx	%i0,	0x1B,	%o7
loop_2445:
	array8	%i2,	%g4,	%o2
	xor	%i4,	0x0222,	%o3
	andncc	%l1,	%o5,	%g5
	movcc	%icc,	%g7,	%l5
	mulscc	%o1,	%i5,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i1,	0x1849,	%i3
	fbn,a	%fcc0,	loop_2446
	subcc	%l4,	%i7,	%g2
	fornot2s	%f16,	%f24,	%f15
	movleu	%icc,	%o4,	%i6
loop_2446:
	flush	%l7 + 0x18
	and	%l6,	%o6,	%l0
	ldx	[%l7 + 0x10],	%g3
	fmovdle	%icc,	%f6,	%f18
	edge16l	%o0,	%l3,	%g6
	edge32ln	%l2,	%i0,	%o7
	edge32ln	%i2,	%o2,	%g4
	movgu	%xcc,	%o3,	%i4
	movrgz	%o5,	%g5,	%l1
	fmovdvc	%xcc,	%f7,	%f16
	sll	%l5,	%g7,	%i5
	ta	%xcc,	0x3
	addcc	%o1,	0x0092,	%g1
	popc	0x1785,	%i3
	tneg	%xcc,	0x4
	be,a	loop_2447
	bvs,pn	%icc,	loop_2448
	mova	%xcc,	%i1,	%i7
	movn	%icc,	%l4,	%g2
loop_2447:
	tpos	%xcc,	0x0
loop_2448:
	bl	%icc,	loop_2449
	tne	%xcc,	0x4
	fands	%f23,	%f14,	%f18
	alignaddrl	%i6,	%o4,	%l6
loop_2449:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fba,a	%fcc0,	loop_2450
	xor	%o6,	0x02E0,	%g3
	udivcc	%o0,	0x0EA5,	%l3
	set	0x28, %o0
	lduwa	[%l7 + %o0] 0x88,	%g6
loop_2450:
	ldsb	[%l7 + 0x6B],	%l2
	tne	%xcc,	0x5
	xorcc	%l0,	0x0789,	%i0
	fcmpgt16	%f28,	%f8,	%o7
	orcc	%i2,	0x09C7,	%o2
	array16	%o3,	%g4,	%o5
	fsrc2	%f20,	%f18
	fnot2	%f0,	%f6
	movrgz	%g5,	%l1,	%i4
	movrlez	%l5,	0x3ED,	%i5
	fbge	%fcc2,	loop_2451
	edge32l	%o1,	%g1,	%i3
	edge8ln	%g7,	%i1,	%i7
	tl	%xcc,	0x0
loop_2451:
	fnegs	%f10,	%f0
	ldsw	[%l7 + 0x58],	%l4
	swap	[%l7 + 0x6C],	%g2
	and	%o4,	0x0D03,	%i6
	fornot2s	%f25,	%f23,	%f27
	umulcc	%l6,	%o6,	%g3
	fmovrsgz	%o0,	%f17,	%f5
	edge8n	%g6,	%l2,	%l0
	sub	%l3,	%i0,	%i2
	umul	%o7,	%o2,	%o3
	fpack32	%f26,	%f22,	%f16
	sdiv	%o5,	0x10DD,	%g5
	brgez,a	%l1,	loop_2452
	addc	%g4,	0x1418,	%i4
	edge16	%i5,	%l5,	%g1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x0c,	%o1,	%g7
loop_2452:
	tge	%icc,	0x2
	fpsub32s	%f27,	%f23,	%f20
	sdivcc	%i3,	0x153F,	%i1
	fbu	%fcc3,	loop_2453
	movg	%xcc,	%i7,	%g2
	fmovdge	%xcc,	%f17,	%f27
	fornot1	%f14,	%f10,	%f18
loop_2453:
	fcmpd	%fcc0,	%f24,	%f8
	tvc	%xcc,	0x7
	alignaddr	%o4,	%i6,	%l6
	nop
	set	0x50, %o3
	std	%f0,	[%l7 + %o3]
	edge8ln	%o6,	%g3,	%o0
	movne	%icc,	%g6,	%l2
	fpadd16s	%f6,	%f31,	%f26
	ldstub	[%l7 + 0x78],	%l0
	edge16	%l3,	%i0,	%i2
	prefetch	[%l7 + 0x34],	 0x2
	subcc	%l4,	%o2,	%o7
	add	%o3,	%o5,	%l1
	set	0x40, %i6
	lduha	[%l7 + %i6] 0x88,	%g5
	fmovspos	%icc,	%f13,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i4,	0x07E8,	%g4
	nop
	set	0x20, %g3
	stw	%i5,	[%l7 + %g3]
	orn	%l5,	%o1,	%g7
	mova	%icc,	%i3,	%g1
	fmuld8ulx16	%f21,	%f19,	%f16
	edge16l	%i1,	%g2,	%i7
	fornot2	%f26,	%f10,	%f20
	udivcc	%o4,	0x14F2,	%l6
	srax	%i6,	%o6,	%o0
	movgu	%icc,	%g3,	%g6
	fones	%f14
	edge16n	%l0,	%l3,	%l2
	bvs	%icc,	loop_2454
	movvs	%icc,	%i2,	%l4
	sub	%o2,	%i0,	%o3
	fblg	%fcc0,	loop_2455
loop_2454:
	sir	0x08B6
	fnand	%f6,	%f6,	%f14
	sll	%o7,	0x1F,	%l1
loop_2455:
	alignaddr	%o5,	%g5,	%i4
	tvs	%icc,	0x2
	edge8	%g4,	%i5,	%l5
	edge8l	%o1,	%g7,	%g1
	srl	%i1,	%g2,	%i3
	prefetch	[%l7 + 0x7C],	 0x2
	movgu	%icc,	%i7,	%o4
	bge,pn	%icc,	loop_2456
	orcc	%i6,	0x0F9C,	%o6
	umul	%o0,	%l6,	%g3
	edge16n	%g6,	%l3,	%l2
loop_2456:
	nop
	set	0x3C, %g4
	ldswa	[%l7 + %g4] 0x19,	%l0
	wr	%g0,	0x2f,	%asi
	stda	%l4,	[%l7 + 0x48] %asi
	membar	#Sync
	stbar
	fmovsneg	%xcc,	%f24,	%f24
	addccc	%i2,	0x05BE,	%i0
	sir	0x12DD
	edge16ln	%o3,	%o7,	%l1
	srl	%o5,	0x08,	%g5
	sethi	0x0DD8,	%i4
	mulx	%g4,	0x118B,	%o2
	addccc	%i5,	0x0724,	%o1
	bvc,a,pt	%xcc,	loop_2457
	fcmpeq16	%f20,	%f18,	%g7
	edge16n	%g1,	%l5,	%g2
	subc	%i1,	0x1E35,	%i7
loop_2457:
	stb	%i3,	[%l7 + 0x08]
	edge32ln	%o4,	%i6,	%o0
	addccc	%l6,	0x074C,	%o6
	fpadd16	%f18,	%f18,	%f24
	swap	[%l7 + 0x38],	%g6
	udivcc	%l3,	0x1FD8,	%l2
	subc	%g3,	%l0,	%l4
	prefetch	[%l7 + 0x7C],	 0x1
	set	0x20, %i4
	stda	%i0,	[%l7 + %i4] 0x23
	membar	#Sync
	ba,a	loop_2458
	fsrc1s	%f20,	%f7
	edge32n	%i2,	%o3,	%l1
	ble,a	%icc,	loop_2459
loop_2458:
	membar	0x6F
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x1A],	%o7
loop_2459:
	tg	%xcc,	0x2
	fmovrdne	%g5,	%f0,	%f16
	movrne	%i4,	0x07B,	%o5
	popc	0x1DC2,	%o2
	fsrc2	%f14,	%f0
	sdivcc	%i5,	0x0EE7,	%g4
	set	0x09, %l1
	ldsba	[%l7 + %l1] 0x11,	%o1
	tleu	%icc,	0x6
	fmovsgu	%xcc,	%f28,	%f20
	fmovrde	%g1,	%f4,	%f14
	fble	%fcc2,	loop_2460
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x16B1,	%g7
	fexpand	%f0,	%f26
loop_2460:
	nop
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x64] %asi,	%f18
	edge8l	%l5,	%i1,	%i7
	movleu	%icc,	%i3,	%g2
	edge16	%i6,	%o4,	%o0
	movvs	%icc,	%o6,	%l6
	stbar
	andncc	%g6,	%l2,	%g3
	fmovdpos	%xcc,	%f1,	%f27
	bvs,a,pt	%xcc,	loop_2461
	fpadd32s	%f5,	%f21,	%f20
	fbu,a	%fcc2,	loop_2462
	fpack16	%f14,	%f9
loop_2461:
	flush	%l7 + 0x18
	fmul8ulx16	%f26,	%f16,	%f14
loop_2462:
	fnot2s	%f25,	%f9
	ldsh	[%l7 + 0x5C],	%l0
	movre	%l4,	0x26F,	%l3
	umulcc	%i0,	0x1B80,	%i2
	fands	%f9,	%f23,	%f11
	set	0x38, %i1
	ldstuba	[%l7 + %i1] 0x80,	%o3
	fpackfix	%f16,	%f5
	stb	%l1,	[%l7 + 0x7D]
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x28] %asi,	%f16
	edge16l	%g5,	%i4,	%o7
	movrgez	%o5,	%i5,	%o2
	edge8ln	%o1,	%g1,	%g7
	popc	%l5,	%i1
	tcc	%icc,	0x2
	prefetch	[%l7 + 0x64],	 0x3
	ld	[%l7 + 0x48],	%f3
	fbug,a	%fcc0,	loop_2463
	tl	%icc,	0x2
	fbg	%fcc1,	loop_2464
	move	%xcc,	%g4,	%i3
loop_2463:
	sllx	%i7,	0x18,	%i6
	swap	[%l7 + 0x08],	%o4
loop_2464:
	fmovsge	%xcc,	%f17,	%f20
	stx	%g2,	[%l7 + 0x18]
	udivx	%o6,	0x1E12,	%l6
	fmovdne	%xcc,	%f3,	%f3
	be,pt	%icc,	loop_2465
	sllx	%o0,	0x08,	%l2
	movgu	%icc,	%g3,	%g6
	fmovdn	%icc,	%f13,	%f16
loop_2465:
	xorcc	%l0,	0x1047,	%l3
	movrlz	%i0,	%l4,	%o3
	bvs	%icc,	loop_2466
	tn	%icc,	0x5
	sth	%l1,	[%l7 + 0x24]
	movge	%xcc,	%i2,	%g5
loop_2466:
	subcc	%o7,	0x0AD6,	%o5
	subc	%i5,	0x0419,	%o2
	siam	0x2
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x68] %asi,	%i4
	movrlez	%o1,	%g7,	%g1
	fnor	%f8,	%f0,	%f6
	fabsd	%f6,	%f10
	tg	%xcc,	0x2
	fmovdvs	%xcc,	%f28,	%f12
	fpadd16s	%f12,	%f30,	%f27
	tneg	%icc,	0x0
	fpackfix	%f14,	%f30
	edge16ln	%i1,	%l5,	%i3
	fmovdn	%icc,	%f6,	%f12
	sdivx	%i7,	0x00AF,	%i6
	fmul8sux16	%f14,	%f6,	%f16
	fmovdle	%xcc,	%f29,	%f7
	movne	%icc,	%g4,	%o4
	fmovrslez	%g2,	%f9,	%f2
	fbge,a	%fcc2,	loop_2467
	sir	0x09B8
	edge32ln	%o6,	%l6,	%l2
	fnot1	%f16,	%f22
loop_2467:
	edge16	%o0,	%g3,	%g6
	tg	%xcc,	0x1
	tneg	%xcc,	0x0
	tne	%icc,	0x4
	movrlez	%l0,	%i0,	%l3
	and	%l4,	0x0786,	%o3
	lduw	[%l7 + 0x40],	%l1
	fcmple16	%f22,	%f28,	%g5
	edge32n	%o7,	%i2,	%o5
	movpos	%xcc,	%i5,	%o2
	movrne	%o1,	%g7,	%g1
	addc	%i1,	0x03F0,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x1
	ta	%xcc,	0x1
	xnorcc	%i3,	%i7,	%i6
	fandnot2	%f30,	%f14,	%f14
	fcmpeq32	%f2,	%f12,	%l5
	fmovspos	%icc,	%f29,	%f6
	st	%f12,	[%l7 + 0x14]
	tcs	%xcc,	0x3
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x15
	movrgz	%o4,	0x037,	%g2
	tle	%xcc,	0x5
	fbule,a	%fcc0,	loop_2468
	fmovrsgz	%g4,	%f21,	%f31
	edge8n	%l6,	%l2,	%o0
	fbl,a	%fcc1,	loop_2469
loop_2468:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%o6,	loop_2470
	fcmpeq32	%f26,	%f6,	%g6
loop_2469:
	tsubcctv	%l0,	%i0,	%l3
	ldstub	[%l7 + 0x13],	%l4
loop_2470:
	movneg	%xcc,	%g3,	%l1
	edge16ln	%g5,	%o3,	%i2
	subcc	%o5,	%o7,	%i5
	movge	%icc,	%o1,	%o2
	tne	%icc,	0x1
	fbe	%fcc0,	loop_2471
	fbl	%fcc2,	loop_2472
	movrgz	%g1,	0x3C6,	%i1
	fcmpgt32	%f20,	%f14,	%g7
loop_2471:
	subc	%i3,	%i7,	%i6
loop_2472:
	srl	%i4,	%o4,	%g2
	alignaddrl	%l5,	%g4,	%l6
	bge,pn	%icc,	loop_2473
	smulcc	%l2,	0x0C3F,	%o0
	tgu	%xcc,	0x6
	movle	%xcc,	%g6,	%l0
loop_2473:
	srl	%o6,	0x07,	%i0
	tcc	%icc,	0x0
	xnorcc	%l4,	0x1513,	%l3
	movn	%xcc,	%g3,	%g5
	edge16l	%l1,	%i2,	%o5
	tvc	%icc,	0x0
	fblg,a	%fcc1,	loop_2474
	popc	%o3,	%i5
	alignaddr	%o7,	%o1,	%o2
	xorcc	%g1,	0x0046,	%i1
loop_2474:
	std	%f2,	[%l7 + 0x70]
	lduw	[%l7 + 0x18],	%i3
	tne	%xcc,	0x3
	umulcc	%i7,	%g7,	%i6
	prefetch	[%l7 + 0x58],	 0x2
	subc	%i4,	%o4,	%l5
	movrgez	%g4,	%l6,	%l2
	stx	%g2,	[%l7 + 0x08]
	fxor	%f14,	%f28,	%f6
	xnor	%g6,	%l0,	%o6
	andn	%o0,	0x010C,	%i0
	tl	%icc,	0x4
	fmovdcc	%icc,	%f8,	%f16
	fmovsge	%xcc,	%f17,	%f28
	movgu	%icc,	%l4,	%g3
	tl	%icc,	0x7
	movn	%xcc,	%l3,	%l1
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x30] %asi,	%g5
	udivcc	%o5,	0x1DBA,	%o3
	tneg	%icc,	0x6
	fors	%f13,	%f11,	%f27
	alignaddr	%i2,	%o7,	%i5
	sdivx	%o1,	0x0C7E,	%o2
	fba,a	%fcc2,	loop_2475
	edge16ln	%g1,	%i1,	%i3
	te	%xcc,	0x2
	bcc	loop_2476
loop_2475:
	andn	%g7,	%i7,	%i6
	subc	%o4,	%l5,	%i4
	set	0x42, %o7
	lduha	[%l7 + %o7] 0x0c,	%l6
loop_2476:
	sub	%l2,	%g2,	%g6
	fzero	%f30
	bpos	loop_2477
	tgu	%icc,	0x2
	fandnot2s	%f20,	%f0,	%f0
	ldsb	[%l7 + 0x0D],	%l0
loop_2477:
	tn	%icc,	0x1
	srlx	%o6,	%g4,	%i0
	fxnor	%f10,	%f14,	%f20
	array16	%o0,	%g3,	%l4
	smul	%l3,	0x10C5,	%l1
	fbue,a	%fcc3,	loop_2478
	subccc	%g5,	0x18C3,	%o3
	fmovrslz	%i2,	%f9,	%f1
	fcmpgt32	%f24,	%f14,	%o5
loop_2478:
	brlz	%i5,	loop_2479
	alignaddr	%o1,	%o2,	%o7
	bcs,pn	%icc,	loop_2480
	ldsh	[%l7 + 0x42],	%i1
loop_2479:
	movgu	%icc,	%i3,	%g1
	fpackfix	%f2,	%f6
loop_2480:
	brgz	%i7,	loop_2481
	movcc	%xcc,	%i6,	%g7
	std	%o4,	[%l7 + 0x28]
	sdivcc	%i4,	0x0064,	%l5
loop_2481:
	fbl	%fcc0,	loop_2482
	brgz,a	%l6,	loop_2483
	taddcctv	%g2,	%l2,	%g6
	movrgz	%o6,	0x00C,	%l0
loop_2482:
	fmovsn	%icc,	%f10,	%f2
loop_2483:
	fpmerge	%f28,	%f13,	%f16
	mova	%xcc,	%i0,	%o0
	fmovscs	%icc,	%f20,	%f29
	set	0x58, %l3
	ldswa	[%l7 + %l3] 0x80,	%g3
	edge16ln	%l4,	%g4,	%l1
	movleu	%xcc,	%l3,	%o3
	array16	%i2,	%o5,	%g5
	brlz,a	%i5,	loop_2484
	brgez,a	%o2,	loop_2485
	movrne	%o7,	%o1,	%i1
	fmovse	%icc,	%f18,	%f30
loop_2484:
	std	%i2,	[%l7 + 0x50]
loop_2485:
	fbug	%fcc2,	loop_2486
	edge16l	%i7,	%g1,	%i6
	swap	[%l7 + 0x44],	%o4
	andcc	%g7,	0x0E26,	%i4
loop_2486:
	flush	%l7 + 0x30
	bge	loop_2487
	edge8ln	%l5,	%g2,	%l2
	membar	0x7D
	fmuld8sux16	%f9,	%f31,	%f0
loop_2487:
	fxnors	%f18,	%f30,	%f23
	or	%g6,	%o6,	%l0
	movne	%xcc,	%l6,	%i0
	membar	0x38
	popc	%g3,	%l4
	set	0x2C, %i3
	stba	%g4,	[%l7 + %i3] 0x23
	membar	#Sync
	fmovrsgz	%l1,	%f29,	%f17
	mulscc	%o0,	%o3,	%l3
	fmovdcc	%xcc,	%f4,	%f7
	fpsub16	%f12,	%f2,	%f20
	fblg	%fcc1,	loop_2488
	sllx	%i2,	0x1D,	%g5
	fpadd16	%f28,	%f12,	%f2
	fsrc1s	%f15,	%f17
loop_2488:
	movge	%icc,	%i5,	%o2
	bge,pn	%icc,	loop_2489
	fmovdcc	%icc,	%f18,	%f18
	smulcc	%o5,	%o7,	%o1
	mulscc	%i3,	%i1,	%g1
loop_2489:
	orncc	%i7,	%i6,	%g7
	alignaddrl	%o4,	%l5,	%i4
	bvc,a,pn	%xcc,	loop_2490
	smul	%l2,	0x10D6,	%g6
	brnz	%o6,	loop_2491
	edge32	%g2,	%l0,	%l6
loop_2490:
	nop
	set	0x30, %o1
	ldxa	[%g0 + %o1] 0x58,	%g3
loop_2491:
	array8	%i0,	%g4,	%l1
	alignaddrl	%l4,	%o0,	%l3
	prefetch	[%l7 + 0x18],	 0x0
	tgu	%xcc,	0x3
	fbn	%fcc3,	loop_2492
	popc	0x0046,	%i2
	edge32n	%o3,	%i5,	%o2
	bvs,a,pn	%xcc,	loop_2493
loop_2492:
	srl	%o5,	%o7,	%o1
	fornot1	%f24,	%f24,	%f12
	tsubcctv	%i3,	%g5,	%g1
loop_2493:
	nop
	set	0x68, %g5
	stxa	%i7,	[%l7 + %g5] 0x18
	fmul8ulx16	%f6,	%f10,	%f20
	smul	%i6,	0x1BEC,	%i1
	fmuld8sux16	%f26,	%f6,	%f6
	fpmerge	%f23,	%f2,	%f18
	mulx	%o4,	%g7,	%l5
	xorcc	%i4,	0x07C0,	%g6
	tle	%icc,	0x7
	alignaddrl	%o6,	%g2,	%l0
	edge32l	%l6,	%g3,	%i0
	set	0x68, %g2
	swapa	[%l7 + %g2] 0x81,	%g4
	fexpand	%f5,	%f12
	fmovdcc	%icc,	%f17,	%f29
	xorcc	%l2,	0x143B,	%l4
	mulx	%o0,	%l3,	%i2
	fandnot1	%f2,	%f14,	%f14
	flush	%l7 + 0x20
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l1,	%i5
	bvs,a,pn	%icc,	loop_2494
	fmovs	%f17,	%f7
	edge8	%o2,	%o5,	%o7
	movg	%xcc,	%o3,	%i3
loop_2494:
	fmovdneg	%icc,	%f16,	%f0
	bgu,a,pt	%icc,	loop_2495
	fmovdvs	%icc,	%f27,	%f21
	array8	%o1,	%g5,	%i7
	fmovs	%f21,	%f0
loop_2495:
	fmovdcs	%xcc,	%f1,	%f12
	tneg	%icc,	0x4
	movleu	%xcc,	%i6,	%i1
	fmovdle	%xcc,	%f7,	%f3
	movne	%xcc,	%o4,	%g1
	std	%g6,	[%l7 + 0x18]
	fpadd16	%f10,	%f18,	%f24
	srlx	%l5,	0x0B,	%i4
	movg	%icc,	%o6,	%g2
	tl	%xcc,	0x5
	fmul8x16	%f23,	%f8,	%f2
	fmovdl	%icc,	%f26,	%f24
	and	%l0,	%g6,	%l6
	sub	%g3,	%i0,	%g4
	edge16ln	%l4,	%l2,	%o0
	sdivcc	%l3,	0x178C,	%l1
	call	loop_2496
	tvs	%xcc,	0x3
	andcc	%i2,	0x0D8C,	%o2
	xor	%o5,	0x0419,	%o7
loop_2496:
	edge32	%i5,	%o3,	%o1
	movneg	%xcc,	%i3,	%i7
	bleu	loop_2497
	fands	%f23,	%f5,	%f11
	fbge	%fcc3,	loop_2498
	fbg,a	%fcc3,	loop_2499
loop_2497:
	umul	%g5,	0x1239,	%i6
	tg	%xcc,	0x4
loop_2498:
	st	%f9,	[%l7 + 0x0C]
loop_2499:
	nop
	set	0x60, %o6
	swapa	[%l7 + %o6] 0x04,	%o4
	andn	%i1,	0x070C,	%g1
	st	%f12,	[%l7 + 0x08]
	tcc	%icc,	0x5
	sub	%l5,	%i4,	%g7
	tpos	%xcc,	0x1
	fmovrslez	%o6,	%f8,	%f21
	set	0x7C, %l2
	lda	[%l7 + %l2] 0x18,	%f22
	fba	%fcc2,	loop_2500
	sethi	0x1CBA,	%g2
	ldsb	[%l7 + 0x7B],	%l0
	edge8l	%l6,	%g3,	%g6
loop_2500:
	fnot1s	%f25,	%f2
	movgu	%icc,	%i0,	%g4
	movne	%xcc,	%l2,	%o0
	andcc	%l4,	0x1CC1,	%l1
	movvs	%icc,	%i2,	%l3
	fmuld8sux16	%f3,	%f25,	%f26
	fpsub32	%f6,	%f30,	%f12
	nop
	set	0x41, %i0
	ldub	[%l7 + %i0],	%o2
	tleu	%icc,	0x3
	tcc	%icc,	0x3
	te	%icc,	0x6
	move	%xcc,	%o7,	%i5
	prefetch	[%l7 + 0x08],	 0x0
	nop
	set	0x1C, %l0
	prefetch	[%l7 + %l0],	 0x0
	fcmpeq32	%f20,	%f28,	%o3
	fsrc1	%f24,	%f30
	brlz	%o5,	loop_2501
	tle	%icc,	0x2
	movvc	%icc,	%o1,	%i3
	edge32l	%g5,	%i6,	%o4
loop_2501:
	movl	%xcc,	%i1,	%i7
	tsubcc	%g1,	%i4,	%g7
	fzeros	%f27
	movleu	%icc,	%l5,	%o6
	edge8n	%g2,	%l0,	%l6
	set	0x6A, %g6
	lduba	[%l7 + %g6] 0x0c,	%g6
	fandnot1	%f22,	%f14,	%f12
	fornot2s	%f1,	%f29,	%f16
	brz,a	%g3,	loop_2502
	fmovrdlz	%i0,	%f10,	%f12
	movne	%icc,	%l2,	%o0
	mova	%xcc,	%g4,	%l1
loop_2502:
	bcs	loop_2503
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l4,	%i2,	%l3
	movrlez	%o7,	0x3E9,	%i5
loop_2503:
	tvs	%icc,	0x6
	fmovsneg	%xcc,	%f3,	%f15
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x28] %asi,	%f10
	umulcc	%o3,	%o5,	%o2
	bvs,a	loop_2504
	orncc	%o1,	0x0A7B,	%g5
	set	0x1C, %o4
	stha	%i6,	[%l7 + %o4] 0xea
	membar	#Sync
loop_2504:
	fnegd	%f8,	%f14
	ta	%icc,	0x7
	sllx	%i3,	%i1,	%i7
	fbg,a	%fcc0,	loop_2505
	prefetch	[%l7 + 0x7C],	 0x1
	fcmpes	%fcc0,	%f12,	%f0
	addc	%g1,	%i4,	%o4
loop_2505:
	nop
	wr	%g0,	0x11,	%asi
	stba	%g7,	[%l7 + 0x22] %asi
	bvs,a,pn	%xcc,	loop_2506
	te	%xcc,	0x7
	st	%f21,	[%l7 + 0x50]
	std	%f30,	[%l7 + 0x10]
loop_2506:
	std	%l4,	[%l7 + 0x10]
	alignaddrl	%g2,	%o6,	%l0
	fpack16	%f2,	%f0
	nop
	setx	loop_2507,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%g6,	%l6,	%g3
	edge16	%i0,	%o0,	%g4
	mulx	%l1,	%l2,	%l4
loop_2507:
	popc	0x04A2,	%l3
	subcc	%o7,	%i5,	%o3
	srl	%o5,	%i2,	%o1
	fmovsn	%xcc,	%f13,	%f5
	fmovscs	%xcc,	%f29,	%f7
	fmovsvs	%icc,	%f8,	%f7
	fcmpeq32	%f24,	%f6,	%o2
	sdivx	%i6,	0x176F,	%i3
	smul	%i1,	0x0F67,	%i7
	taddcc	%g1,	%g5,	%i4
	edge8l	%o4,	%g7,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,pt	%xcc,	loop_2508
	tgu	%icc,	0x5
	xnor	%o6,	%g2,	%l0
	movrgz	%l6,	0x202,	%g3
loop_2508:
	nop
	set	0x70, %i2
	stxa	%i0,	[%l7 + %i2] 0x18
	sdiv	%o0,	0x1EA0,	%g4
	fand	%f14,	%f14,	%f22
	popc	0x04D0,	%l1
	fandnot1s	%f11,	%f7,	%f31
	lduh	[%l7 + 0x3C],	%g6
	nop
	setx	loop_2509,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%l4,	0x190,	%l2
	fbuge	%fcc3,	loop_2510
	tsubcc	%o7,	%l3,	%i5
loop_2509:
	brnz	%o5,	loop_2511
	movne	%xcc,	%o3,	%o1
loop_2510:
	array16	%i2,	%o2,	%i6
	movl	%icc,	%i1,	%i3
loop_2511:
	edge16	%i7,	%g1,	%i4
	fmovdl	%icc,	%f31,	%f23
	subcc	%o4,	0x0D54,	%g7
	tvs	%icc,	0x6
	movne	%icc,	%g5,	%o6
	bvc,pt	%icc,	loop_2512
	smul	%g2,	0x119C,	%l0
	movvc	%xcc,	%l6,	%g3
	edge32n	%l5,	%i0,	%o0
loop_2512:
	fxor	%f12,	%f26,	%f24
	fmovdg	%icc,	%f29,	%f5
	udiv	%l1,	0x0089,	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l4,	%l2
	addc	%g6,	0x06C9,	%l3
	movrgz	%o7,	0x3CD,	%i5
	ta	%xcc,	0x1
	andn	%o5,	%o3,	%o1
	fmul8sux16	%f18,	%f10,	%f22
	sllx	%o2,	%i2,	%i1
	brgez,a	%i6,	loop_2513
	tg	%icc,	0x2
	fcmped	%fcc2,	%f10,	%f2
	ba,pn	%icc,	loop_2514
loop_2513:
	fcmpd	%fcc1,	%f18,	%f16
	flush	%l7 + 0x4C
	xor	%i3,	0x162C,	%i7
loop_2514:
	nop
	set	0x40, %l4
	lda	[%l7 + %l4] 0x15,	%f26
	fbn	%fcc2,	loop_2515
	ldd	[%l7 + 0x18],	%g0
	fblg,a	%fcc3,	loop_2516
	tneg	%icc,	0x0
loop_2515:
	alignaddrl	%o4,	%g7,	%g5
	edge8n	%i4,	%o6,	%g2
loop_2516:
	tsubcc	%l6,	0x07F3,	%g3
	srax	%l0,	0x09,	%i0
	edge8	%l5,	%l1,	%g4
	fmovsn	%xcc,	%f13,	%f6
	fmovdg	%xcc,	%f16,	%f28
	subcc	%l4,	0x028C,	%o0
	sth	%g6,	[%l7 + 0x14]
	fnot2s	%f20,	%f14
	sll	%l3,	0x0F,	%o7
	be	loop_2517
	xorcc	%l2,	%i5,	%o3
	fpsub16	%f14,	%f30,	%f24
	fzeros	%f1
loop_2517:
	taddcc	%o5,	%o1,	%i2
	bge,a,pn	%xcc,	loop_2518
	bshuffle	%f24,	%f0,	%f20
	and	%i1,	%o2,	%i6
	andncc	%i7,	%g1,	%i3
loop_2518:
	smul	%o4,	%g5,	%i4
	tle	%icc,	0x0
	fmovdl	%xcc,	%f28,	%f12
	tge	%icc,	0x7
	movrlez	%o6,	0x1CD,	%g2
	fcmpeq16	%f12,	%f14,	%g7
	edge16n	%g3,	%l6,	%i0
	edge32l	%l5,	%l0,	%g4
	tge	%xcc,	0x0
	fbo	%fcc3,	loop_2519
	bneg	loop_2520
	array16	%l4,	%l1,	%o0
	movvc	%icc,	%l3,	%o7
loop_2519:
	edge16ln	%l2,	%i5,	%o3
loop_2520:
	nop
	set	0x20, %o5
	stda	%g6,	[%l7 + %o5] 0x0c
	sdivcc	%o5,	0x0C00,	%o1
	subc	%i2,	%i1,	%o2
	edge32ln	%i7,	%g1,	%i6
	srax	%i3,	0x18,	%o4
	movrne	%g5,	0x34B,	%o6
	edge32	%g2,	%i4,	%g3
	fxnor	%f24,	%f8,	%f28
	fmovsvs	%icc,	%f15,	%f3
	fmul8x16au	%f29,	%f22,	%f6
	nop
	setx	loop_2521,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbn,a	%fcc3,	loop_2522
	movre	%l6,	0x36D,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2521:
	move	%icc,	%g7,	%l5
loop_2522:
	smul	%g4,	0x06F3,	%l4
	bvs,a	%xcc,	loop_2523
	addccc	%l0,	0x1DC4,	%l1
	tn	%icc,	0x1
	sll	%o0,	0x13,	%l3
loop_2523:
	fble,a	%fcc2,	loop_2524
	srax	%l2,	0x03,	%o7
	fbne	%fcc2,	loop_2525
	sll	%o3,	%i5,	%o5
loop_2524:
	edge32	%o1,	%g6,	%i2
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%i1
loop_2525:
	subc	%o2,	%g1,	%i6
	movne	%icc,	%i7,	%i3
	ldsw	[%l7 + 0x70],	%g5
	for	%f8,	%f26,	%f16
	bne	loop_2526
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o6,	%g2,	%i4
	fbug,a	%fcc1,	loop_2527
loop_2526:
	addccc	%o4,	%l6,	%i0
	sllx	%g7,	0x15,	%g3
	fpmerge	%f9,	%f23,	%f20
loop_2527:
	smul	%l5,	0x03A0,	%l4
	sdiv	%g4,	0x0B1E,	%l1
	edge8n	%l0,	%l3,	%l2
	fmovspos	%xcc,	%f21,	%f16
	movre	%o0,	%o3,	%o7
	movrgz	%o5,	0x0F7,	%o1
	movrgz	%g6,	%i2,	%i1
	mulscc	%o2,	0x166D,	%i5
	tg	%xcc,	0x4
	movrne	%i6,	%i7,	%i3
	fmuld8ulx16	%f9,	%f8,	%f2
	edge8ln	%g1,	%o6,	%g2
	sllx	%g5,	0x00,	%i4
	movvs	%icc,	%o4,	%l6
	ldx	[%l7 + 0x70],	%g7
	brgez	%g3,	loop_2528
	fblg	%fcc2,	loop_2529
	fmovrse	%l5,	%f10,	%f1
	movrlez	%i0,	0x18F,	%g4
loop_2528:
	ldub	[%l7 + 0x11],	%l4
loop_2529:
	edge8l	%l1,	%l0,	%l2
	ldd	[%l7 + 0x20],	%o0
	bcs,a	loop_2530
	brgz,a	%l3,	loop_2531
	fmovdleu	%icc,	%f27,	%f30
	or	%o7,	0x1143,	%o3
loop_2530:
	udiv	%o1,	0x0348,	%g6
loop_2531:
	edge32	%i2,	%i1,	%o5
	bvs	%icc,	loop_2532
	fornot2	%f24,	%f16,	%f18
	subcc	%i5,	%i6,	%o2
	fmovsl	%xcc,	%f29,	%f30
loop_2532:
	prefetch	[%l7 + 0x44],	 0x0
	sdivx	%i3,	0x0E0C,	%i7
	edge16l	%o6,	%g2,	%g5
	edge8	%i4,	%o4,	%g1
	tvc	%xcc,	0x3
	fexpand	%f24,	%f2
	movrgz	%l6,	0x13A,	%g3
	movvc	%icc,	%g7,	%i0
	xnor	%g4,	0x1795,	%l5
	fmovsn	%xcc,	%f0,	%f13
	srax	%l1,	%l4,	%l2
	stb	%o0,	[%l7 + 0x2A]
	st	%f26,	[%l7 + 0x20]
	tcc	%xcc,	0x0
	siam	0x2
	movneg	%icc,	%l0,	%l3
	tcs	%icc,	0x6
	tle	%xcc,	0x1
	tne	%xcc,	0x3
	subcc	%o7,	%o1,	%o3
	fcmple32	%f12,	%f16,	%i2
	movrne	%i1,	%g6,	%o5
	array8	%i6,	%i5,	%i3
	movn	%xcc,	%i7,	%o6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x0c,	%o2,	%g5
	fcmpeq16	%f28,	%f24,	%g2
	edge8ln	%i4,	%o4,	%g1
	subccc	%l6,	%g3,	%g7
	add	%i0,	0x1F87,	%l5
	fmovsvc	%xcc,	%f31,	%f14
	edge16n	%g4,	%l4,	%l2
	fmovdcs	%icc,	%f22,	%f29
	xor	%l1,	0x03E0,	%o0
	fornot1	%f6,	%f26,	%f22
	movg	%icc,	%l0,	%l3
	edge16n	%o7,	%o3,	%o1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%i2,	%g6
	tle	%xcc,	0x6
	movleu	%icc,	%i1,	%i6
	tvs	%xcc,	0x4
	fmovdne	%icc,	%f25,	%f13
	movre	%i5,	0x3FC,	%o5
	fmovdneg	%xcc,	%f17,	%f22
	tvs	%xcc,	0x4
	prefetch	[%l7 + 0x30],	 0x1
	xorcc	%i3,	%o6,	%i7
	tl	%icc,	0x0
	fandnot1	%f12,	%f6,	%f14
	andncc	%o2,	%g5,	%g2
	fcmpne16	%f28,	%f10,	%i4
	fmul8x16	%f6,	%f4,	%f18
	brnz,a	%o4,	loop_2533
	ldd	[%l7 + 0x08],	%f0
	set	0x4C, %i7
	lda	[%l7 + %i7] 0x89,	%f19
loop_2533:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x54] %asi,	%l6
	fmovsle	%icc,	%f15,	%f20
	andn	%g1,	0x1533,	%g7
	fmovscc	%icc,	%f4,	%f16
	set	0x34, %g7
	ldsha	[%l7 + %g7] 0x11,	%i0
	movrne	%l5,	%g4,	%l4
	udiv	%l2,	0x1A4F,	%l1
	fcmple16	%f24,	%f20,	%g3
	edge32l	%l0,	%o0,	%o7
	movneg	%icc,	%l3,	%o3
	movge	%xcc,	%i2,	%o1
	movrlez	%g6,	0x0E9,	%i1
	array8	%i6,	%o5,	%i3
	alignaddr	%i5,	%o6,	%o2
	fblg,a	%fcc2,	loop_2534
	fbul	%fcc0,	loop_2535
	tle	%icc,	0x5
	fmovde	%icc,	%f15,	%f13
loop_2534:
	fpsub32	%f18,	%f26,	%f8
loop_2535:
	movg	%xcc,	%i7,	%g2
	srlx	%i4,	%g5,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%g1,	0x0452,	%l6
	fmovrsgez	%i0,	%f13,	%f15
	fbule	%fcc3,	loop_2536
	fmovrsgz	%g7,	%f1,	%f17
	movre	%g4,	%l5,	%l4
	wr	%g0,	0x04,	%asi
	stwa	%l2,	[%l7 + 0x1C] %asi
loop_2536:
	bcs,pn	%xcc,	loop_2537
	fmovsge	%icc,	%f28,	%f9
	srl	%g3,	%l0,	%o0
	fmovdcs	%icc,	%f18,	%f29
loop_2537:
	fcmpne32	%f20,	%f24,	%l1
	bshuffle	%f8,	%f8,	%f20
	bcs,a	loop_2538
	movl	%icc,	%l3,	%o7
	tvs	%icc,	0x3
	xor	%o3,	%i2,	%o1
loop_2538:
	fexpand	%f12,	%f28
	edge16l	%i1,	%i6,	%g6
	tvs	%icc,	0x3
	prefetch	[%l7 + 0x60],	 0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x7F] %asi,	%i3
	taddcctv	%o5,	0x05C7,	%o6
	fbug	%fcc2,	loop_2539
	movrlez	%o2,	%i7,	%i5
	movl	%xcc,	%g2,	%i4
	udiv	%g5,	0x0352,	%g1
loop_2539:
	movrlz	%o4,	%i0,	%g7
	fnot1	%f16,	%f26
	stx	%l6,	[%l7 + 0x10]
	edge8ln	%g4,	%l5,	%l2
	ta	%icc,	0x6
	umulcc	%g3,	0x1B1C,	%l4
	fba	%fcc2,	loop_2540
	mulscc	%o0,	0x1909,	%l0
	array8	%l3,	%o7,	%o3
	fsrc1s	%f4,	%f28
loop_2540:
	taddcctv	%l1,	0x03E1,	%o1
	fmovdge	%xcc,	%f23,	%f23
	st	%f7,	[%l7 + 0x3C]
	movrgez	%i1,	0x238,	%i6
	tsubcctv	%i2,	%i3,	%o5
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x14] %asi,	%g6
	fand	%f22,	%f8,	%f30
	addccc	%o6,	0x1168,	%i7
	movgu	%xcc,	%i5,	%g2
	sllx	%i4,	%o2,	%g1
	movle	%icc,	%o4,	%g5
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x2A] %asi,	%i0
	edge8ln	%l6,	%g7,	%g4
	fbe	%fcc3,	loop_2541
	fbg,a	%fcc0,	loop_2542
	sll	%l5,	%g3,	%l2
	edge8	%o0,	%l0,	%l3
loop_2541:
	ta	%icc,	0x0
loop_2542:
	fpmerge	%f5,	%f9,	%f20
	or	%o7,	0x009B,	%l4
	tneg	%xcc,	0x5
	ta	%icc,	0x7
	bneg	loop_2543
	edge16l	%o3,	%o1,	%l1
	nop
	setx loop_2544, %l0, %l1
	jmpl %l1, %i6
	addc	%i2,	%i1,	%i3
loop_2543:
	sllx	%o5,	%g6,	%i7
	array32	%i5,	%g2,	%i4
loop_2544:
	sdivcc	%o2,	0x1070,	%g1
	nop
	setx	loop_2545,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsne	%xcc,	%f5,	%f20
	ldd	[%l7 + 0x20],	%o4
	tl	%icc,	0x7
loop_2545:
	tcs	%icc,	0x3
	fcmps	%fcc1,	%f18,	%f11
	movrne	%g5,	%i0,	%o6
	tn	%xcc,	0x3
	umul	%g7,	0x0B9E,	%g4
	sll	%l5,	0x15,	%g3
	ldd	[%l7 + 0x60],	%f4
	sdivx	%l2,	0x128C,	%l6
	andncc	%l0,	%o0,	%o7
	movneg	%icc,	%l4,	%l3
	fbge	%fcc1,	loop_2546
	movl	%icc,	%o3,	%l1
	edge32ln	%o1,	%i2,	%i1
	fmovdl	%icc,	%f12,	%f30
loop_2546:
	srlx	%i3,	%i6,	%o5
	set	0x48, %g1
	lda	[%l7 + %g1] 0x0c,	%f16
	fmovdle	%icc,	%f0,	%f6
	fcmpes	%fcc3,	%f3,	%f13
	movcs	%icc,	%i7,	%i5
	smulcc	%g2,	%g6,	%i4
	set	0x0C, %i5
	stba	%g1,	[%l7 + %i5] 0x88
	umul	%o2,	%o4,	%i0
	flush	%l7 + 0x4C
	fmovdleu	%icc,	%f6,	%f23
	edge8l	%g5,	%g7,	%g4
	fornot2	%f18,	%f22,	%f16
	movrgez	%l5,	0x13C,	%o6
	brgez,a	%l2,	loop_2547
	bvc,a,pt	%icc,	loop_2548
	udiv	%l6,	0x1A67,	%g3
	add	%o0,	%o7,	%l0
loop_2547:
	stbar
loop_2548:
	fbe	%fcc3,	loop_2549
	fnor	%f6,	%f2,	%f16
	prefetch	[%l7 + 0x08],	 0x3
	movpos	%icc,	%l4,	%o3
loop_2549:
	std	%l2,	[%l7 + 0x60]
	fmovse	%xcc,	%f20,	%f17
	movre	%o1,	%i2,	%l1
	sll	%i1,	0x18,	%i6
	sir	0x0437
	srax	%o5,	0x06,	%i7
	umulcc	%i5,	0x0977,	%g2
	fnands	%f0,	%f14,	%f9
	brnz,a	%i3,	loop_2550
	fbue	%fcc1,	loop_2551
	movvc	%xcc,	%i4,	%g1
	nop
	set	0x5E, %o2
	stb	%o2,	[%l7 + %o2]
loop_2550:
	popc	%g6,	%i0
loop_2551:
	tpos	%xcc,	0x1
	fbe,a	%fcc3,	loop_2552
	tl	%icc,	0x4
	fxnors	%f28,	%f3,	%f18
	srax	%o4,	%g5,	%g4
loop_2552:
	ba,pn	%icc,	loop_2553
	sethi	0x11C4,	%g7
	taddcctv	%l5,	%o6,	%l6
	fba	%fcc1,	loop_2554
loop_2553:
	fcmped	%fcc0,	%f2,	%f16
	taddcctv	%g3,	0x15ED,	%o0
	movge	%icc,	%o7,	%l0
loop_2554:
	movrlez	%l2,	%o3,	%l4
	ble	%xcc,	loop_2555
	bcs,a,pt	%icc,	loop_2556
	fble,a	%fcc1,	loop_2557
	fcmpes	%fcc2,	%f19,	%f19
loop_2555:
	tle	%icc,	0x7
loop_2556:
	nop
	add	%l7,	0x14,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%l3,	%i2
loop_2557:
	fmovrslez	%l1,	%f28,	%f2
	fbn	%fcc1,	loop_2558
	fble	%fcc0,	loop_2559
	subccc	%o1,	0x1A2F,	%i6
	movpos	%icc,	%i1,	%i7
loop_2558:
	ba	%icc,	loop_2560
loop_2559:
	bleu,a,pn	%icc,	loop_2561
	fcmpne32	%f4,	%f22,	%i5
	fbug	%fcc3,	loop_2562
loop_2560:
	tleu	%xcc,	0x3
loop_2561:
	taddcc	%g2,	%i3,	%i4
	fmovrslz	%g1,	%f15,	%f24
loop_2562:
	tvc	%xcc,	0x0
	array16	%o5,	%g6,	%o2
	movrne	%i0,	0x3F2,	%g5
	fmovsa	%icc,	%f12,	%f0
	sethi	0x1BC9,	%o4
	set	0x28, %l6
	ldsha	[%l7 + %l6] 0x15,	%g4
	udiv	%g7,	0x175B,	%l5
	movneg	%xcc,	%l6,	%g3
	tle	%icc,	0x6
	tsubcc	%o0,	0x1664,	%o7
	alignaddr	%l0,	%l2,	%o6
	movpos	%icc,	%o3,	%l3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x50] %asi,	%i2
	xnorcc	%l4,	0x1746,	%o1
	movl	%xcc,	%l1,	%i1
	sra	%i6,	0x0B,	%i5
	bn,a	loop_2563
	or	%i7,	%g2,	%i3
	or	%g1,	0x02F1,	%o5
	udivx	%g6,	0x018F,	%o2
loop_2563:
	mulx	%i4,	0x04ED,	%i0
	smul	%o4,	0x1985,	%g4
	movleu	%xcc,	%g7,	%g5
	sll	%l6,	0x0F,	%g3
	alignaddrl	%o0,	%l5,	%o7
	flush	%l7 + 0x68
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x74] %asi,	%l2
	swap	[%l7 + 0x2C],	%o6
	ldub	[%l7 + 0x3D],	%l0
	fmovspos	%xcc,	%f16,	%f31
	tgu	%icc,	0x4
	fcmple32	%f28,	%f20,	%l3
	swap	[%l7 + 0x30],	%i2
	movrlez	%o3,	%l4,	%l1
	std	%f4,	[%l7 + 0x20]
	edge32ln	%i1,	%o1,	%i5
	brlez,a	%i6,	loop_2564
	pdist	%f20,	%f16,	%f10
	fmovda	%icc,	%f9,	%f20
	brgz	%g2,	loop_2565
loop_2564:
	subc	%i3,	%i7,	%o5
	mulscc	%g6,	%o2,	%g1
	orn	%i4,	%i0,	%o4
loop_2565:
	ldx	[%l7 + 0x48],	%g7
	sdiv	%g4,	0x1329,	%g5
	fpadd16	%f24,	%f26,	%f22
	fbug,a	%fcc0,	loop_2566
	taddcc	%l6,	%o0,	%l5
	lduh	[%l7 + 0x78],	%o7
	sethi	0x01D4,	%l2
loop_2566:
	popc	0x0477,	%g3
	movrgz	%o6,	%l0,	%i2
	movgu	%icc,	%l3,	%l4
	andncc	%o3,	%i1,	%o1
	orncc	%i5,	%l1,	%i6
	fxnor	%f20,	%f22,	%f2
	brgez,a	%g2,	loop_2567
	umul	%i7,	0x0BC5,	%i3
	movpos	%icc,	%o5,	%o2
	tl	%xcc,	0x5
loop_2567:
	subccc	%g1,	%g6,	%i4
	movrlez	%i0,	%g7,	%g4
	fnand	%f4,	%f30,	%f20
	fabsd	%f18,	%f4
	st	%f15,	[%l7 + 0x34]
	edge8n	%g5,	%o4,	%l6
	tgu	%xcc,	0x2
	fbg	%fcc3,	loop_2568
	nop
	setx loop_2569, %l0, %l1
	jmpl %l1, %o0
	udiv	%l5,	0x01F7,	%o7
	fmovrdne	%g3,	%f6,	%f6
loop_2568:
	movle	%icc,	%o6,	%l0
loop_2569:
	edge16n	%i2,	%l3,	%l4
	std	%l2,	[%l7 + 0x48]
	taddcc	%i1,	%o3,	%i5
	membar	0x03
	bleu,pt	%xcc,	loop_2570
	te	%xcc,	0x3
	sll	%l1,	%o1,	%i6
	fnegs	%f15,	%f12
loop_2570:
	fmovsle	%xcc,	%f2,	%f14
	brlz,a	%i7,	loop_2571
	ldub	[%l7 + 0x6B],	%g2
	xor	%o5,	%o2,	%g1
	movrgez	%i3,	%g6,	%i0
loop_2571:
	popc	0x1774,	%g7
	fbu,a	%fcc2,	loop_2572
	bne,a,pn	%icc,	loop_2573
	fnands	%f27,	%f15,	%f4
	orncc	%g4,	%i4,	%o4
loop_2572:
	fnot1s	%f12,	%f7
loop_2573:
	bpos,a	%icc,	loop_2574
	popc	%l6,	%o0
	fxnor	%f12,	%f20,	%f10
	xnorcc	%g5,	0x0C93,	%o7
loop_2574:
	movg	%icc,	%l5,	%g3
	movcs	%xcc,	%l0,	%i2
	sethi	0x1A26,	%o6
	movcs	%xcc,	%l4,	%l3
	fzeros	%f22
	sethi	0x14FE,	%i1
	andcc	%l2,	%o3,	%l1
	addc	%o1,	%i5,	%i6
	movcc	%icc,	%g2,	%o5
	tgu	%xcc,	0x6
	fsrc1	%f0,	%f18
	movcc	%icc,	%o2,	%g1
	fnot1	%f20,	%f0
	set	0x66, %o0
	ldsha	[%l7 + %o0] 0x11,	%i7
	addccc	%g6,	0x0B5F,	%i0
	tg	%xcc,	0x6
	call	loop_2575
	or	%g7,	0x0AF1,	%g4
	sllx	%i3,	0x1F,	%i4
	edge8ln	%l6,	%o4,	%o0
loop_2575:
	mulscc	%g5,	0x1D3D,	%l5
	set	0x12, %i6
	ldsba	[%l7 + %i6] 0x04,	%o7
	fbl	%fcc2,	loop_2576
	orcc	%g3,	0x08C6,	%i2
	subc	%l0,	0x069C,	%o6
	fbo,a	%fcc2,	loop_2577
loop_2576:
	edge16l	%l4,	%i1,	%l2
	xor	%o3,	0x1E7C,	%l1
	umulcc	%o1,	%l3,	%i6
loop_2577:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x13] %asi,	%i5
	fcmpeq32	%f20,	%f6,	%g2
	andn	%o2,	%o5,	%i7
	subc	%g6,	%i0,	%g1
	brlez,a	%g4,	loop_2578
	ldub	[%l7 + 0x1A],	%i3
	sdiv	%i4,	0x0AFD,	%l6
	taddcc	%o4,	%g7,	%g5
loop_2578:
	fsrc1s	%f6,	%f14
	andncc	%l5,	%o0,	%g3
	stbar
	movg	%icc,	%i2,	%o7
	fnot1s	%f29,	%f17
	fcmpne16	%f28,	%f0,	%o6
	set	0x34, %g3
	sta	%f27,	[%l7 + %g3] 0x18
	movre	%l0,	0x151,	%i1
	andcc	%l4,	%o3,	%l2
	sth	%o1,	[%l7 + 0x44]
	call	loop_2579
	tneg	%xcc,	0x0
	orn	%l3,	0x1986,	%l1
	srlx	%i5,	%g2,	%o2
loop_2579:
	srax	%i6,	%i7,	%o5
	tneg	%xcc,	0x1
	fbuge	%fcc3,	loop_2580
	subc	%i0,	%g6,	%g4
	xor	%g1,	0x0509,	%i4
	fmovsleu	%icc,	%f19,	%f30
loop_2580:
	fmovsn	%icc,	%f8,	%f31
	tne	%xcc,	0x5
	fbo,a	%fcc0,	loop_2581
	ldd	[%l7 + 0x38],	%f24
	movl	%icc,	%l6,	%o4
	movpos	%icc,	%i3,	%g5
loop_2581:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x13] %asi,	%g7
	movneg	%icc,	%o0,	%l5
	udivcc	%i2,	0x1361,	%o7
	call	loop_2582
	array16	%o6,	%g3,	%l0
	movge	%icc,	%i1,	%l4
	srlx	%o3,	%o1,	%l3
loop_2582:
	fsrc1s	%f0,	%f8
	orncc	%l2,	0x121F,	%i5
	fpmerge	%f15,	%f4,	%f24
	nop
	setx	loop_2583,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpsub32s	%f15,	%f21,	%f6
	fsrc1	%f28,	%f14
	fors	%f5,	%f0,	%f4
loop_2583:
	edge16l	%l1,	%o2,	%i6
	fpack32	%f12,	%f0,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0B3B,	%i7
	mulscc	%o5,	%g2,	%i0
	fbo,a	%fcc3,	loop_2584
	be,pt	%icc,	loop_2585
	flush	%l7 + 0x58
	move	%xcc,	%g6,	%g4
loop_2584:
	sub	%g1,	%i4,	%o4
loop_2585:
	edge32n	%i3,	%g5,	%l6
	bshuffle	%f30,	%f2,	%f4
	taddcc	%g7,	0x0981,	%l5
	for	%f30,	%f26,	%f26
	fnot1	%f12,	%f22
	umul	%o0,	%i2,	%o6
	call	loop_2586
	xor	%g3,	%l0,	%i1
	fpadd16	%f26,	%f16,	%f2
	subc	%o7,	%o3,	%o1
loop_2586:
	edge32n	%l3,	%l2,	%i5
	bge,pn	%icc,	loop_2587
	ldd	[%l7 + 0x08],	%l0
	set	0x28, %o3
	stda	%o2,	[%l7 + %o3] 0x80
loop_2587:
	subc	%l4,	0x13E7,	%i7
	set	0x58, %i4
	lduwa	[%l7 + %i4] 0x14,	%i6
	addcc	%o5,	%i0,	%g6
	fcmple32	%f14,	%f24,	%g2
	smul	%g4,	%g1,	%o4
	subcc	%i4,	0x0457,	%i3
	alignaddrl	%l6,	%g7,	%g5
	edge8n	%l5,	%o0,	%i2
	wr	%g0,	0x2f,	%asi
	stba	%o6,	[%l7 + 0x56] %asi
	membar	#Sync
	fmovrsne	%l0,	%f22,	%f15
	fmovdcc	%icc,	%f20,	%f10
	alignaddrl	%i1,	%o7,	%g3
	set	0x78, %g4
	stda	%o0,	[%l7 + %g4] 0x15
	fmovdle	%icc,	%f6,	%f25
	tcc	%icc,	0x2
	smul	%l3,	%l2,	%o3
	sdivx	%l1,	0x00D2,	%o2
	bne,a	%xcc,	loop_2588
	tgu	%xcc,	0x7
	be,a	loop_2589
	fmovdpos	%xcc,	%f25,	%f27
loop_2588:
	fornot2	%f6,	%f24,	%f8
	fmovse	%xcc,	%f24,	%f31
loop_2589:
	nop
	set	0x50, %l1
	stb	%i5,	[%l7 + %l1]
	ta	%xcc,	0x2
	orcc	%l4,	0x15F3,	%i6
	addcc	%i7,	0x17D1,	%i0
	xor	%o5,	0x0144,	%g6
	fmovsvs	%icc,	%f30,	%f8
	edge32n	%g2,	%g1,	%g4
	fnot2	%f20,	%f26
	alignaddr	%i4,	%i3,	%l6
	srlx	%o4,	0x0C,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l5,	%g5,	%o0
	set	0x20, %l5
	ldda	[%l7 + %l5] 0x27,	%o6
	nop
	setx	loop_2590,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnegs	%f2,	%f30
	fbl,a	%fcc2,	loop_2591
	addc	%l0,	%i1,	%o7
loop_2590:
	bleu,pn	%xcc,	loop_2592
	sdiv	%g3,	0x1A8E,	%i2
loop_2591:
	brgez	%o1,	loop_2593
	stb	%l2,	[%l7 + 0x48]
loop_2592:
	and	%l3,	%o3,	%o2
	array32	%l1,	%l4,	%i6
loop_2593:
	sdiv	%i7,	0x09F9,	%i0
	brz,a	%i5,	loop_2594
	array32	%g6,	%g2,	%g1
	andn	%g4,	%o5,	%i4
	ta	%xcc,	0x0
loop_2594:
	movvs	%icc,	%i3,	%o4
	fors	%f21,	%f1,	%f15
	tpos	%xcc,	0x1
	movle	%icc,	%l6,	%g7
	smul	%l5,	0x1966,	%g5
	movneg	%xcc,	%o6,	%o0
	edge32	%l0,	%i1,	%o7
	andcc	%i2,	%o1,	%g3
	fsrc1s	%f10,	%f7
	fandnot2	%f30,	%f22,	%f26
	movrgez	%l2,	0x2D6,	%l3
	bvc,a,pt	%icc,	loop_2595
	orn	%o3,	0x02D8,	%o2
	movne	%xcc,	%l1,	%i6
	movle	%xcc,	%i7,	%i0
loop_2595:
	tvc	%icc,	0x4
	bn,a,pn	%xcc,	loop_2596
	smul	%l4,	0x0846,	%g6
	faligndata	%f16,	%f24,	%f6
	fmovs	%f6,	%f9
loop_2596:
	subc	%g2,	%i5,	%g4
	movg	%xcc,	%g1,	%o5
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x7D] %asi,	%i4
	fcmpne32	%f16,	%f22,	%o4
	edge8	%i3,	%g7,	%l6
	fbo,a	%fcc1,	loop_2597
	fabss	%f17,	%f0
	subccc	%g5,	0x0910,	%o6
	addc	%l5,	0x0075,	%l0
loop_2597:
	movpos	%icc,	%i1,	%o0
	fmovde	%xcc,	%f0,	%f25
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	ta	%xcc,	0x6
	fsrc2	%f2,	%f6
	std	%f16,	[%l7 + 0x30]
	edge32l	%i2,	%o1,	%o7
	fble,a	%fcc1,	loop_2598
	tcc	%xcc,	0x5
	edge16l	%l2,	%g3,	%o3
	wr	%g0,	0xe2,	%asi
	stha	%l3,	[%l7 + 0x18] %asi
	membar	#Sync
loop_2598:
	tl	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc0,	loop_2599
	orn	%o2,	%i6,	%i7
	sdivx	%l1,	0x18D9,	%l4
	fzeros	%f28
loop_2599:
	fornot2s	%f11,	%f31,	%f15
	orncc	%i0,	0x0D2E,	%g6
	set	0x3C, %i1
	swapa	[%l7 + %i1] 0x80,	%i5
	fand	%f4,	%f12,	%f4
	movg	%icc,	%g4,	%g2
	movvc	%icc,	%g1,	%o5
	movneg	%icc,	%o4,	%i3
	movrlz	%i4,	0x0F5,	%l6
	fxnors	%f6,	%f9,	%f31
	wr	%g0,	0x19,	%asi
	stda	%g6,	[%l7 + 0x20] %asi
	set	0x6C, %o7
	stha	%o6,	[%l7 + %o7] 0x22
	membar	#Sync
	sra	%l5,	0x15,	%l0
	popc	%i1,	%g5
	xorcc	%i2,	0x0EFC,	%o1
	edge32l	%o0,	%o7,	%g3
	edge16l	%o3,	%l2,	%o2
	ldsh	[%l7 + 0x76],	%i6
	addcc	%i7,	%l1,	%l3
	edge8ln	%i0,	%g6,	%i5
	array8	%g4,	%l4,	%g2
	movg	%icc,	%o5,	%g1
	umul	%o4,	0x0317,	%i3
	tn	%xcc,	0x1
	fabsd	%f6,	%f22
	te	%xcc,	0x0
	movre	%i4,	%g7,	%l6
	subccc	%l5,	0x0FDE,	%o6
	popc	0x0854,	%l0
	movgu	%icc,	%i1,	%g5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%i2
	or	%o7,	0x016D,	%g3
	movrgez	%o0,	0x055,	%o3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%l2
	fmovdvs	%icc,	%f4,	%f18
	fmovsgu	%icc,	%f15,	%f18
	movvc	%xcc,	%i6,	%i7
	std	%l0,	[%l7 + 0x30]
	fmovrslez	%l3,	%f0,	%f28
	fnors	%f25,	%f26,	%f7
	ld	[%l7 + 0x50],	%f27
	fmovsleu	%xcc,	%f13,	%f24
	edge8ln	%i0,	%g6,	%i5
	xnor	%l4,	0x1118,	%g4
	movrlz	%g2,	0x2C1,	%g1
	brz,a	%o5,	loop_2600
	bg,a,pt	%xcc,	loop_2601
	addc	%o4,	%i4,	%i3
	movneg	%icc,	%l6,	%g7
loop_2600:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2601:
	membar	0x0F
	tl	%xcc,	0x3
	std	%o6,	[%l7 + 0x68]
	array16	%l5,	%l0,	%i1
	fbe,a	%fcc3,	loop_2602
	fbn,a	%fcc2,	loop_2603
	sll	%g5,	0x12,	%i2
	orcc	%o1,	0x0396,	%g3
loop_2602:
	sir	0x1228
loop_2603:
	andcc	%o7,	0x0490,	%o0
	bvc,a	loop_2604
	ldsh	[%l7 + 0x70],	%o2
	sll	%l2,	0x16,	%i6
	fand	%f6,	%f14,	%f30
loop_2604:
	fandnot2	%f12,	%f0,	%f12
	brlez	%i7,	loop_2605
	fandnot1s	%f31,	%f24,	%f26
	srlx	%o3,	%l3,	%i0
	bcc,pt	%icc,	loop_2606
loop_2605:
	movcs	%icc,	%l1,	%g6
	tge	%xcc,	0x3
	fpsub16	%f30,	%f14,	%f10
loop_2606:
	nop
	set	0x16, %i3
	lduha	[%l7 + %i3] 0x88,	%l4
	orn	%i5,	0x1364,	%g4
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x58] %asi,	%g2
	edge32ln	%o5,	%o4,	%g1
	movleu	%icc,	%i3,	%i4
	tne	%icc,	0x5
	bvc,pt	%icc,	loop_2607
	fxors	%f24,	%f18,	%f17
	taddcctv	%g7,	%l6,	%l5
	udiv	%o6,	0x1789,	%i1
loop_2607:
	fsrc2	%f20,	%f22
	movne	%xcc,	%g5,	%l0
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x08] %asi,	%o1
	sllx	%g3,	%o7,	%i2
	fbl	%fcc2,	loop_2608
	tleu	%xcc,	0x5
	movvs	%xcc,	%o2,	%o0
	fandnot1s	%f26,	%f3,	%f8
loop_2608:
	alignaddrl	%i6,	%i7,	%l2
	fmovsleu	%icc,	%f27,	%f22
	fbe	%fcc1,	loop_2609
	membar	0x67
	movn	%xcc,	%o3,	%i0
	udivx	%l1,	0x038A,	%g6
loop_2609:
	fbuge	%fcc1,	loop_2610
	fandnot1	%f4,	%f26,	%f14
	fblg	%fcc0,	loop_2611
	nop
	setx loop_2612, %l0, %l1
	jmpl %l1, %l4
loop_2610:
	lduh	[%l7 + 0x40],	%l3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%g2
loop_2611:
	fbule	%fcc0,	loop_2613
loop_2612:
	fornot1	%f20,	%f26,	%f0
	movgu	%xcc,	%o5,	%g4
	movvc	%icc,	%o4,	%i3
loop_2613:
	fsrc2s	%f16,	%f3
	bvs,a	loop_2614
	edge16n	%i4,	%g7,	%l6
	fmuld8sux16	%f0,	%f20,	%f28
	tg	%icc,	0x2
loop_2614:
	movrgz	%g1,	%l5,	%i1
	tcc	%icc,	0x5
	sdiv	%g5,	0x1E69,	%o6
	edge16	%o1,	%g3,	%o7
	andncc	%l0,	%i2,	%o0
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%i6
	membar	0x6D
	bne	loop_2615
	tne	%xcc,	0x6
	fsrc2	%f10,	%f24
	wr	%g0,	0x2b,	%asi
	stba	%i7,	[%l7 + 0x32] %asi
	membar	#Sync
loop_2615:
	fmovda	%icc,	%f0,	%f17
	fnors	%f24,	%f20,	%f6
	bge,a,pt	%xcc,	loop_2616
	movneg	%icc,	%o2,	%o3
	movne	%xcc,	%i0,	%l2
	sth	%l1,	[%l7 + 0x48]
loop_2616:
	tsubcctv	%g6,	0x19CA,	%l4
	nop
	setx loop_2617, %l0, %l1
	jmpl %l1, %i5
	move	%icc,	%l3,	%o5
	ldub	[%l7 + 0x5F],	%g2
	movrlz	%o4,	%i3,	%g4
loop_2617:
	swap	[%l7 + 0x78],	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g7,	%g1,	%l6
	array32	%l5,	%i1,	%o6
	xor	%o1,	%g5,	%g3
	tpos	%icc,	0x4
	movn	%xcc,	%l0,	%o7
	bneg,pn	%icc,	loop_2618
	edge8n	%o0,	%i2,	%i7
	ta	%icc,	0x3
	mova	%icc,	%o2,	%i6
loop_2618:
	sll	%o3,	%i0,	%l1
	sethi	0x1AFF,	%l2
	bne,a	%xcc,	loop_2619
	movgu	%xcc,	%g6,	%i5
	fmovspos	%xcc,	%f2,	%f0
	membar	0x79
loop_2619:
	te	%xcc,	0x2
	popc	%l3,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%g2,	%o4
	edge8	%i3,	%g4,	%l4
	movgu	%xcc,	%g7,	%g1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%i4
	movg	%icc,	%l5,	%l6
	fmovsn	%xcc,	%f10,	%f22
	fmovsvc	%xcc,	%f3,	%f25
	tvs	%icc,	0x3
	popc	%i1,	%o1
	srax	%g5,	0x1D,	%o6
	tge	%xcc,	0x5
	edge16	%l0,	%o7,	%g3
	edge8	%i2,	%o0,	%o2
	tcs	%xcc,	0x0
	tge	%icc,	0x5
	fpsub32s	%f15,	%f16,	%f13
	fble	%fcc0,	loop_2620
	addcc	%i7,	%i6,	%i0
	fmovsleu	%icc,	%f28,	%f13
	movcs	%icc,	%l1,	%o3
loop_2620:
	array8	%g6,	%l2,	%i5
	umul	%o5,	0x1EF0,	%g2
	addcc	%o4,	%i3,	%g4
	fmul8x16	%f2,	%f24,	%f26
	sllx	%l3,	0x02,	%g7
	umul	%g1,	0x1374,	%l4
	subc	%l5,	%i4,	%i1
	fbn,a	%fcc3,	loop_2621
	taddcc	%l6,	%g5,	%o6
	tleu	%xcc,	0x0
	addc	%l0,	%o7,	%g3
loop_2621:
	movle	%icc,	%o1,	%i2
	edge32	%o0,	%i7,	%i6
	tgu	%icc,	0x0
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x11,	%f16
	nop
	setx	loop_2622,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addccc	%o2,	%l1,	%o3
	fnand	%f22,	%f24,	%f0
	taddcc	%g6,	0x0AD8,	%l2
loop_2622:
	ldsb	[%l7 + 0x26],	%i5
	prefetch	[%l7 + 0x7C],	 0x1
	fmovrsgz	%o5,	%f19,	%f21
	fmovdl	%icc,	%f24,	%f10
	movvs	%icc,	%i0,	%o4
	tvc	%icc,	0x1
	fmuld8ulx16	%f26,	%f29,	%f8
	call	loop_2623
	be,a,pn	%icc,	loop_2624
	bcs,pn	%xcc,	loop_2625
	te	%icc,	0x7
loop_2623:
	fblg	%fcc1,	loop_2626
loop_2624:
	sra	%g2,	0x09,	%g4
loop_2625:
	fbu,a	%fcc2,	loop_2627
	tg	%xcc,	0x3
loop_2626:
	edge32n	%l3,	%g7,	%g1
	subcc	%i3,	0x139E,	%l4
loop_2627:
	edge8l	%l5,	%i4,	%l6
	orncc	%i1,	%g5,	%l0
	umul	%o6,	%o7,	%o1
	membar	0x4C
	fmovrde	%g3,	%f26,	%f6
	st	%f8,	[%l7 + 0x60]
	movrlez	%i2,	%i7,	%i6
	smulcc	%o0,	0x0230,	%o2
	movgu	%icc,	%o3,	%g6
	array16	%l1,	%l2,	%o5
	fmovda	%icc,	%f24,	%f30
	edge8	%i0,	%i5,	%g2
	move	%xcc,	%o4,	%l3
	fmovscc	%xcc,	%f9,	%f24
	fpadd32s	%f26,	%f5,	%f11
	edge16ln	%g7,	%g4,	%i3
	fcmpne16	%f8,	%f28,	%g1
	tvc	%icc,	0x1
	movvc	%icc,	%l4,	%i4
	fmovdne	%icc,	%f31,	%f13
	fba	%fcc1,	loop_2628
	edge32	%l6,	%i1,	%g5
	xorcc	%l5,	0x0486,	%o6
	movgu	%icc,	%l0,	%o7
loop_2628:
	movcc	%xcc,	%g3,	%i2
	sdivcc	%o1,	0x0B8B,	%i7
	fxors	%f27,	%f14,	%f27
	stw	%i6,	[%l7 + 0x14]
	ldsb	[%l7 + 0x46],	%o2
	set	0x40, %g5
	ldxa	[%l7 + %g5] 0x88,	%o3
	orn	%o0,	%g6,	%l1
	udiv	%o5,	0x11DF,	%l2
	sdivx	%i5,	0x16D6,	%g2
	fpsub16s	%f16,	%f19,	%f31
	fbn	%fcc2,	loop_2629
	tleu	%icc,	0x5
	andncc	%o4,	%l3,	%i0
	brgz	%g7,	loop_2630
loop_2629:
	fors	%f5,	%f14,	%f11
	sdivcc	%g4,	0x0114,	%g1
	tcc	%icc,	0x7
loop_2630:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%i3,	%l4
	edge16ln	%i4,	%i1,	%l6
	sdivcc	%l5,	0x13C8,	%g5
	ta	%icc,	0x4
	ld	[%l7 + 0x44],	%f13
	movvs	%icc,	%o6,	%l0
	or	%g3,	0x1F93,	%i2
	tne	%xcc,	0x4
	movne	%xcc,	%o7,	%i7
	mova	%icc,	%o1,	%i6
	edge16ln	%o3,	%o2,	%o0
	fbge,a	%fcc0,	loop_2631
	array8	%l1,	%g6,	%l2
	movcc	%xcc,	%o5,	%i5
	xnorcc	%o4,	%l3,	%g2
loop_2631:
	fnot2	%f28,	%f20
	movl	%icc,	%g7,	%i0
	te	%xcc,	0x4
	udivcc	%g1,	0x1160,	%g4
	taddcctv	%i3,	0x012F,	%l4
	smul	%i4,	0x095F,	%i1
	addcc	%l6,	%l5,	%o6
	sethi	0x1D33,	%g5
	tvs	%xcc,	0x2
	bcc,a,pt	%icc,	loop_2632
	fmovdne	%xcc,	%f14,	%f24
	smulcc	%g3,	%i2,	%l0
	fba,a	%fcc0,	loop_2633
loop_2632:
	srl	%i7,	%o7,	%o1
	orncc	%o3,	0x0460,	%o2
	std	%o0,	[%l7 + 0x28]
loop_2633:
	fmul8x16al	%f23,	%f26,	%f8
	xnor	%l1,	%i6,	%l2
	tsubcctv	%o5,	%i5,	%g6
	or	%l3,	%o4,	%g2
	nop
	setx	loop_2634,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bg,a	%icc,	loop_2635
	sub	%g7,	%g1,	%i0
	tge	%xcc,	0x2
loop_2634:
	fmul8sux16	%f20,	%f12,	%f12
loop_2635:
	movne	%xcc,	%g4,	%i3
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x14
	fbge	%fcc3,	loop_2636
	xnor	%i4,	0x09D7,	%i1
	andncc	%l4,	%l6,	%o6
	movleu	%xcc,	%g5,	%g3
loop_2636:
	alignaddrl	%l5,	%i2,	%i7
	siam	0x5
	orn	%o7,	0x0BE9,	%o1
	movleu	%icc,	%l0,	%o3
	st	%f19,	[%l7 + 0x18]
	add	%o2,	%o0,	%i6
	xor	%l2,	0x1BE0,	%l1
	lduh	[%l7 + 0x7A],	%o5
	fbul,a	%fcc1,	loop_2637
	fnors	%f25,	%f31,	%f24
	fmovsl	%xcc,	%f28,	%f17
	fmovsvs	%xcc,	%f0,	%f11
loop_2637:
	ta	%icc,	0x1
	andncc	%g6,	%i5,	%l3
	sub	%o4,	0x14D5,	%g7
	fpsub16s	%f3,	%f12,	%f13
	addccc	%g2,	0x06BA,	%i0
	fcmped	%fcc2,	%f12,	%f8
	addccc	%g1,	%i3,	%i4
	fbe,a	%fcc0,	loop_2638
	fxnor	%f24,	%f26,	%f26
	move	%xcc,	%g4,	%l4
	fpack16	%f14,	%f16
loop_2638:
	fands	%f23,	%f10,	%f4
	tcs	%icc,	0x2
	fmovrse	%i1,	%f26,	%f24
	udivx	%o6,	0x151B,	%l6
	sra	%g5,	%g3,	%i2
	fmovrsgez	%l5,	%f0,	%f2
	nop
	set	0x5C, %g2
	ldstub	[%l7 + %g2],	%o7
	fpack32	%f8,	%f6,	%f6
	movre	%i7,	0x2F0,	%l0
	sll	%o3,	%o2,	%o0
	taddcc	%i6,	0x1AB9,	%o1
	movpos	%icc,	%l1,	%l2
	fone	%f16
	set	0x0, %l2
	ldxa	[%g0 + %l2] 0x58,	%g6
	fbe,a	%fcc3,	loop_2639
	fcmped	%fcc2,	%f26,	%f24
	fbule,a	%fcc2,	loop_2640
	fxnor	%f4,	%f6,	%f8
loop_2639:
	std	%f22,	[%l7 + 0x08]
	tvc	%xcc,	0x1
loop_2640:
	movle	%xcc,	%o5,	%i5
	addcc	%o4,	0x1727,	%l3
	edge32n	%g2,	%i0,	%g1
	tvc	%xcc,	0x5
	subcc	%i3,	%g7,	%g4
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x60] %asi,	%i4
	brlez,a	%l4,	loop_2641
	fabss	%f30,	%f14
	srl	%o6,	%i1,	%g5
	edge32ln	%g3,	%l6,	%i2
loop_2641:
	subcc	%o7,	0x12A0,	%l5
	fmul8x16au	%f29,	%f4,	%f12
	fmovrde	%i7,	%f10,	%f26
	popc	%o3,	%l0
	fmovrsne	%o0,	%f4,	%f4
	fsrc1	%f30,	%f22
	fmovrdlz	%i6,	%f14,	%f30
	for	%f12,	%f20,	%f8
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movleu	%icc,	%o1,	%l1
	tsubcc	%l2,	%o2,	%o5
	subc	%i5,	%o4,	%l3
	movneg	%xcc,	%g6,	%g2
	fand	%f0,	%f22,	%f16
	fandnot1	%f10,	%f0,	%f18
	bcc,a	loop_2642
	edge32l	%i0,	%i3,	%g7
	taddcctv	%g4,	%i4,	%g1
	bge,a	loop_2643
loop_2642:
	smulcc	%o6,	0x161A,	%l4
	std	%g4,	[%l7 + 0x20]
	bg,pn	%xcc,	loop_2644
loop_2643:
	edge16ln	%g3,	%i1,	%i2
	tne	%icc,	0x5
	sth	%l6,	[%l7 + 0x62]
loop_2644:
	ldsb	[%l7 + 0x59],	%o7
	membar	0x29
	call	loop_2645
	fmovsgu	%xcc,	%f3,	%f29
	smulcc	%i7,	%l5,	%l0
	movcc	%icc,	%o0,	%i6
loop_2645:
	smul	%o3,	0x1309,	%l1
	tsubcctv	%l2,	%o1,	%o2
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	brnz	%i5,	loop_2646
	tpos	%xcc,	0x0
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
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2646:
	fcmple16	%f0,	%f10,	%o4
	umulcc	%l3,	0x04CC,	%o5
loop_2647:
	ldd	[%l7 + 0x58],	%f26
	movn	%xcc,	%g6,	%i0
	bvs,pt	%xcc,	loop_2648
	fmovdgu	%icc,	%f8,	%f19
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x10
loop_2648:
	edge8	%i3,	%g2,	%g7
	movrlez	%i4,	%g4,	%g1
	fandnot1s	%f1,	%f26,	%f4
	tcc	%icc,	0x0
	set	0x24, %o6
	sta	%f19,	[%l7 + %o6] 0x81
	fnot2s	%f29,	%f2
	fbl,a	%fcc2,	loop_2649
	move	%icc,	%l4,	%o6
	or	%g5,	%g3,	%i1
	fnegd	%f22,	%f12
loop_2649:
	andncc	%i2,	%l6,	%o7
	smul	%l5,	0x04AF,	%l0
	wr	%g0,	0x80,	%asi
	stda	%i6,	[%l7 + 0x60] %asi
	fbuge,a	%fcc1,	loop_2650
	fbue	%fcc1,	loop_2651
	bpos,pt	%xcc,	loop_2652
	mulscc	%o0,	%o3,	%l1
loop_2650:
	popc	%l2,	%i6
loop_2651:
	nop
	set	0x10, %l0
	stda	%o2,	[%l7 + %l0] 0x19
loop_2652:
	nop
	wr	%g0,	0x80,	%asi
	stha	%o1,	[%l7 + 0x66] %asi
	fpsub32	%f24,	%f16,	%f12
	edge16l	%o4,	%i5,	%l3
	movrlz	%g6,	%i0,	%i3
	tsubcctv	%g2,	%g7,	%o5
	mulscc	%i4,	%g1,	%g4
	edge8	%o6,	%l4,	%g5
	bvc,a,pn	%xcc,	loop_2653
	fbug	%fcc3,	loop_2654
	fabsd	%f30,	%f16
	fcmple16	%f26,	%f16,	%g3
loop_2653:
	addcc	%i2,	%l6,	%o7
loop_2654:
	nop
	set	0x40, %g6
	stda	%i0,	[%l7 + %g6] 0xeb
	membar	#Sync
	udivx	%l0,	0x01A1,	%l5
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x25] %asi,	%o0
	movge	%icc,	%i7,	%l1
	edge32n	%l2,	%i6,	%o3
	movre	%o2,	%o4,	%o1
	or	%i5,	0x1217,	%l3
	ldd	[%l7 + 0x08],	%f30
	sir	0x1683
	bgu,a,pn	%icc,	loop_2655
	sethi	0x19E2,	%g6
	fmovrsgez	%i3,	%f5,	%f22
	ldd	[%l7 + 0x08],	%i0
loop_2655:
	tneg	%xcc,	0x1
	mulscc	%g2,	0x1DD1,	%o5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x1F] %asi,	%g7
	smul	%i4,	0x008F,	%g4
	std	%f16,	[%l7 + 0x30]
	edge32n	%g1,	%l4,	%g5
	fpadd32s	%f3,	%f6,	%f28
	orn	%o6,	0x00AA,	%g3
	fmul8x16al	%f30,	%f29,	%f18
	umul	%i2,	%l6,	%i1
	edge16n	%o7,	%l5,	%o0
	addccc	%i7,	%l1,	%l0
	flush	%l7 + 0x10
	sdivx	%i6,	0x1530,	%o3
	fabsd	%f2,	%f28
	fpsub32	%f20,	%f20,	%f0
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x10] %asi,	%o2
	movre	%l2,	%o1,	%i5
	array32	%o4,	%g6,	%i3
	bvs,a	loop_2656
	fcmple16	%f22,	%f26,	%l3
	nop
	setx	loop_2657,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpne32	%f24,	%f0,	%g2
loop_2656:
	edge16n	%o5,	%g7,	%i0
	st	%f16,	[%l7 + 0x74]
loop_2657:
	movrlz	%g4,	%g1,	%i4
	taddcctv	%g5,	%o6,	%g3
	fmovsg	%xcc,	%f28,	%f18
	tg	%xcc,	0x1
	fpadd16s	%f26,	%f13,	%f4
	edge8n	%l4,	%i2,	%i1
	edge16l	%l6,	%l5,	%o7
	fnor	%f2,	%f18,	%f22
	movle	%icc,	%i7,	%l1
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%l0
	subcc	%i6,	0x19BE,	%o0
	mova	%icc,	%o2,	%l2
	movcs	%xcc,	%o1,	%i5
	array8	%o4,	%o3,	%g6
	nop
	setx	loop_2658,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvs	%xcc,	%i3,	%l3
	ba,a,pn	%icc,	loop_2659
	xorcc	%g2,	%g7,	%o5
loop_2658:
	fnand	%f4,	%f8,	%f28
	fcmped	%fcc1,	%f2,	%f6
loop_2659:
	srl	%g4,	%i0,	%g1
	sub	%i4,	%g5,	%o6
	movge	%xcc,	%l4,	%g3
	add	%i2,	0x1522,	%i1
	set	0x78, %i2
	ldxa	[%l7 + %i2] 0x88,	%l6
	ldd	[%l7 + 0x08],	%f30
	movleu	%xcc,	%l5,	%o7
	subc	%l1,	0x0F33,	%l0
	sdiv	%i7,	0x096D,	%i6
	mulscc	%o2,	%o0,	%l2
	umulcc	%i5,	%o4,	%o1
	movleu	%xcc,	%o3,	%g6
	xnorcc	%l3,	%i3,	%g7
	mulx	%g2,	0x03CF,	%o5
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%g4
	or	%i0,	0x1DB5,	%i4
	movrgez	%g5,	%g1,	%l4
	nop
	set	0x1C, %o4
	lduh	[%l7 + %o4],	%o6
	brlez	%g3,	loop_2660
	andcc	%i2,	%l6,	%i1
	and	%o7,	0x0A47,	%l1
	ba,a	loop_2661
loop_2660:
	tl	%icc,	0x5
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x76] %asi,	%l0
loop_2661:
	fmovse	%icc,	%f3,	%f9
	fmovdvs	%icc,	%f17,	%f11
	set	0x75, %l4
	stba	%i7,	[%l7 + %l4] 0x81
	fone	%f10
	brlez	%l5,	loop_2662
	tneg	%icc,	0x7
	udivx	%o2,	0x0F3E,	%o0
	fmovscc	%xcc,	%f15,	%f4
loop_2662:
	fmovsvs	%xcc,	%f5,	%f9
	fbl,a	%fcc0,	loop_2663
	sub	%i6,	%i5,	%l2
	fmovsneg	%xcc,	%f8,	%f22
	movrgz	%o1,	%o3,	%o4
loop_2663:
	fnors	%f19,	%f20,	%f29
	array8	%g6,	%i3,	%l3
	sethi	0x050C,	%g7
	movne	%xcc,	%g2,	%o5
	fba	%fcc2,	loop_2664
	array32	%i0,	%g4,	%i4
	swap	[%l7 + 0x78],	%g5
	movle	%icc,	%l4,	%o6
loop_2664:
	bvs,a	loop_2665
	stx	%g3,	[%l7 + 0x58]
	xorcc	%i2,	%g1,	%l6
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x70] %asi,	%o7
loop_2665:
	fbe	%fcc0,	loop_2666
	fornot2s	%f26,	%f27,	%f1
	edge16	%l1,	%i1,	%i7
	brgez	%l5,	loop_2667
loop_2666:
	movcs	%icc,	%l0,	%o2
	movcc	%xcc,	%i6,	%o0
	brlez,a	%i5,	loop_2668
loop_2667:
	tvc	%icc,	0x0
	udivcc	%o1,	0x0DC7,	%o3
	popc	0x1C8C,	%l2
loop_2668:
	tle	%icc,	0x6
	fcmple32	%f24,	%f26,	%g6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x74] %asi,	%i3
	movrne	%l3,	%g7,	%o4
	fnot1	%f22,	%f10
	edge8l	%g2,	%o5,	%g4
	ldsw	[%l7 + 0x74],	%i4
	ldd	[%l7 + 0x28],	%f30
	bne	%xcc,	loop_2669
	fpsub16	%f4,	%f6,	%f10
	ble,a	loop_2670
	movcs	%icc,	%i0,	%l4
loop_2669:
	fmovsge	%icc,	%f6,	%f8
	srlx	%g5,	%g3,	%i2
loop_2670:
	fnegs	%f21,	%f4
	udiv	%o6,	0x0A1D,	%l6
	fblg,a	%fcc0,	loop_2671
	fmul8x16au	%f9,	%f11,	%f20
	stw	%g1,	[%l7 + 0x34]
	fcmpgt32	%f4,	%f24,	%o7
loop_2671:
	subccc	%i1,	%l1,	%l5
	movne	%xcc,	%i7,	%o2
	sll	%i6,	%l0,	%i5
	pdist	%f24,	%f14,	%f24
	array16	%o1,	%o3,	%o0
	subcc	%l2,	%i3,	%g6
	nop
	set	0x10, %i7
	stw	%g7,	[%l7 + %i7]
	fmovrde	%l3,	%f4,	%f8
	set	0x2C, %g7
	sta	%f5,	[%l7 + %g7] 0x14
	tvc	%icc,	0x1
	alignaddrl	%g2,	%o5,	%g4
	movl	%icc,	%i4,	%o4
	movpos	%icc,	%l4,	%i0
	bcs,a	%icc,	loop_2672
	tcc	%xcc,	0x4
	membar	0x72
	alignaddrl	%g5,	%i2,	%o6
loop_2672:
	bge,pn	%xcc,	loop_2673
	or	%g3,	0x0728,	%l6
	lduw	[%l7 + 0x1C],	%g1
	ldsh	[%l7 + 0x52],	%i1
loop_2673:
	or	%l1,	0x02FE,	%l5
	movvs	%icc,	%i7,	%o7
	taddcc	%o2,	0x0014,	%i6
	xnorcc	%i5,	%o1,	%o3
	array8	%l0,	%o0,	%l2
	movcc	%xcc,	%g6,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i3,	0x0FA0,	%g2
	tsubcctv	%l3,	%o5,	%i4
	addcc	%o4,	0x09EF,	%l4
	ldx	[%l7 + 0x30],	%i0
	fmovrsgz	%g5,	%f21,	%f7
	ld	[%l7 + 0x14],	%f30
	movrgez	%i2,	%o6,	%g3
	ldub	[%l7 + 0x0D],	%l6
	fbule,a	%fcc3,	loop_2674
	fcmple32	%f10,	%f8,	%g1
	alignaddr	%g4,	%i1,	%l1
	fmovs	%f18,	%f31
loop_2674:
	smulcc	%i7,	0x1F3A,	%l5
	fnands	%f18,	%f8,	%f22
	fmovrsgez	%o2,	%f12,	%f20
	fandnot2s	%f9,	%f15,	%f25
	movcc	%icc,	%i6,	%o7
	movl	%icc,	%i5,	%o1
	fmovsneg	%icc,	%f9,	%f29
	umul	%l0,	0x10A9,	%o0
	stx	%o3,	[%l7 + 0x50]
	tle	%xcc,	0x5
	sllx	%g6,	%g7,	%i3
	edge32l	%g2,	%l2,	%l3
	fmovdn	%icc,	%f28,	%f23
	popc	%i4,	%o4
	ldx	[%l7 + 0x58],	%l4
	tpos	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i0,	%o5,	%i2
	taddcc	%g5,	%o6,	%l6
	smulcc	%g3,	0x1041,	%g1
	ldstub	[%l7 + 0x7A],	%g4
	fsrc1s	%f26,	%f6
	bn,a,pt	%icc,	loop_2675
	subc	%i1,	%l1,	%i7
	movvs	%xcc,	%o2,	%i6
	movvs	%icc,	%o7,	%i5
loop_2675:
	membar	0x0E
	smul	%o1,	0x00E3,	%l0
	movneg	%xcc,	%o0,	%o3
	faligndata	%f30,	%f24,	%f28
	umulcc	%g6,	0x1D84,	%l5
	ldstub	[%l7 + 0x64],	%i3
	tcc	%icc,	0x3
	popc	%g7,	%g2
	movvc	%icc,	%l3,	%i4
	sethi	0x1D7F,	%l2
	tne	%xcc,	0x4
	fpsub16	%f16,	%f14,	%f26
	andncc	%o4,	%l4,	%i0
	tpos	%xcc,	0x1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%g5
	srax	%i2,	%o6,	%g3
	fpadd16s	%f29,	%f19,	%f9
	addcc	%g1,	0x1AEB,	%l6
	alignaddr	%g4,	%i1,	%l1
	mulscc	%o2,	0x063F,	%i7
	mulx	%o7,	0x0137,	%i5
	fnands	%f3,	%f16,	%f27
	fcmpgt16	%f20,	%f20,	%i6
	popc	0x0D81,	%l0
	andcc	%o1,	0x0727,	%o0
	andncc	%o3,	%g6,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l5,	%g7,	%l3
	sir	0x026B
	edge8l	%i4,	%g2,	%o4
	edge32	%l4,	%l2,	%i0
	udivcc	%o5,	0x0072,	%g5
	srl	%o6,	%i2,	%g1
	tle	%icc,	0x5
	flush	%l7 + 0x38
	bg	loop_2676
	edge32ln	%g3,	%l6,	%i1
	tleu	%icc,	0x6
	fcmpeq32	%f10,	%f30,	%g4
loop_2676:
	bvs,a	loop_2677
	edge32l	%o2,	%i7,	%l1
	fmovde	%icc,	%f7,	%f14
	movge	%xcc,	%i5,	%i6
loop_2677:
	orcc	%l0,	0x0161,	%o7
	xorcc	%o1,	0x0AA8,	%o3
	fones	%f3
	stbar
	fcmpne16	%f30,	%f20,	%g6
	fbn	%fcc2,	loop_2678
	orcc	%o0,	%i3,	%g7
	array8	%l3,	%l5,	%g2
	tcs	%xcc,	0x0
loop_2678:
	fmovsge	%icc,	%f14,	%f30
	sethi	0x1F10,	%o4
	brgez	%i4,	loop_2679
	tle	%icc,	0x0
	fbu,a	%fcc3,	loop_2680
	fmovsl	%icc,	%f8,	%f10
loop_2679:
	mulx	%l2,	%l4,	%i0
	udivx	%o5,	0x12F5,	%o6
loop_2680:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f0,	[%l7 + 0x20] %asi
	alignaddr	%i2,	%g1,	%g5
	mulscc	%g3,	0x194E,	%l6
	sdivx	%g4,	0x00BC,	%i1
	ta	%xcc,	0x2
	srax	%i7,	0x16,	%l1
	movrlez	%i5,	%o2,	%i6
	orn	%l0,	0x0A31,	%o7
	edge32l	%o1,	%g6,	%o3
	fbne,a	%fcc3,	loop_2681
	fors	%f12,	%f8,	%f15
	membar	0x0D
	addc	%i3,	0x021B,	%o0
loop_2681:
	brlez	%l3,	loop_2682
	brz,a	%g7,	loop_2683
	srlx	%g2,	%l5,	%i4
	udivcc	%l2,	0x1431,	%l4
loop_2682:
	flush	%l7 + 0x08
loop_2683:
	edge16n	%i0,	%o4,	%o6
	udiv	%o5,	0x03E0,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f16,	[%l7 + 0x18]
	fmovde	%xcc,	%f15,	%f20
	te	%icc,	0x2
	movle	%icc,	%g1,	%g5
	call	loop_2684
	bvc,pn	%icc,	loop_2685
	brnz	%g3,	loop_2686
	subcc	%l6,	0x148D,	%i1
loop_2684:
	fpsub16	%f24,	%f14,	%f12
loop_2685:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2686:
	fmovdneg	%xcc,	%f14,	%f21
	movre	%i7,	%g4,	%l1
	sllx	%i5,	0x14,	%o2
	membar	0x16
	fnot2s	%f12,	%f21
	set	0x70, %o5
	lduwa	[%l7 + %o5] 0x04,	%l0
	array8	%o7,	%i6,	%g6
	umulcc	%o3,	%o1,	%o0
	edge8l	%i3,	%l3,	%g7
	ba,a	loop_2687
	fmovdvc	%icc,	%f0,	%f25
	andncc	%g2,	%i4,	%l2
	and	%l5,	%l4,	%i0
loop_2687:
	sll	%o4,	0x1C,	%o6
	fcmpgt16	%f2,	%f26,	%i2
	sub	%o5,	0x0923,	%g5
	fnot2	%f22,	%f24
	sir	0x17E4
	edge8ln	%g1,	%l6,	%g3
	and	%i7,	%i1,	%l1
	bcc,a	loop_2688
	ldsb	[%l7 + 0x2A],	%i5
	fcmps	%fcc3,	%f31,	%f4
	lduh	[%l7 + 0x42],	%o2
loop_2688:
	movrlz	%l0,	0x30F,	%g4
	fnot1	%f10,	%f30
	tvs	%xcc,	0x5
	fmovse	%xcc,	%f27,	%f14
	fsrc2	%f30,	%f12
	subccc	%i6,	%g6,	%o3
	bpos,pn	%icc,	loop_2689
	srlx	%o1,	%o7,	%o0
	array16	%i3,	%l3,	%g7
	movl	%icc,	%g2,	%i4
loop_2689:
	edge16	%l2,	%l4,	%i0
	st	%f20,	[%l7 + 0x5C]
	andn	%l5,	%o4,	%i2
	edge32	%o5,	%g5,	%o6
	edge32ln	%g1,	%l6,	%g3
	set	0x2C, %g1
	lduba	[%l7 + %g1] 0x11,	%i1
	fpsub16s	%f1,	%f22,	%f1
	taddcctv	%l1,	%i5,	%o2
	movn	%xcc,	%l0,	%i7
	fpackfix	%f28,	%f19
	edge16ln	%g4,	%i6,	%o3
	brgez,a	%o1,	loop_2690
	movrlez	%g6,	0x3D8,	%o0
	movvc	%xcc,	%i3,	%l3
	movn	%xcc,	%o7,	%g2
loop_2690:
	udivcc	%i4,	0x1F1D,	%g7
	fbule	%fcc3,	loop_2691
	fnand	%f0,	%f20,	%f12
	addc	%l4,	0x1388,	%i0
	wr	%g0,	0x88,	%asi
	stda	%l4,	[%l7 + 0x58] %asi
loop_2691:
	movrgz	%o4,	%i2,	%l2
	movleu	%icc,	%g5,	%o6
	fornot2	%f26,	%f30,	%f18
	ldx	[%l7 + 0x78],	%o5
	tleu	%icc,	0x2
	fmovrdgz	%l6,	%f22,	%f18
	fnands	%f26,	%f4,	%f16
	be	loop_2692
	fmovdcs	%icc,	%f22,	%f23
	subc	%g1,	%g3,	%i1
	fmovsne	%xcc,	%f25,	%f17
loop_2692:
	movrlz	%i5,	0x37D,	%o2
	fbe	%fcc1,	loop_2693
	addcc	%l0,	0x0127,	%i7
	xnor	%g4,	0x1012,	%l1
	andncc	%o3,	%i6,	%g6
loop_2693:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%i3
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%l3
	tge	%xcc,	0x7
	fmovda	%xcc,	%f19,	%f28
	fbuge,a	%fcc1,	loop_2694
	movl	%icc,	%o0,	%o7
	ldsw	[%l7 + 0x44],	%i4
	fmovrdne	%g7,	%f4,	%f6
loop_2694:
	call	loop_2695
	tl	%xcc,	0x5
	fmovrsgz	%l4,	%f25,	%f22
	movne	%icc,	%i0,	%g2
loop_2695:
	edge16	%l5,	%o4,	%l2
	move	%icc,	%i2,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%o5,	%l6
	srlx	%o6,	0x0C,	%g3
	fbug	%fcc0,	loop_2696
	bcs	%icc,	loop_2697
	edge32ln	%i1,	%i5,	%o2
	fandnot2s	%f15,	%f15,	%f10
loop_2696:
	bl,a,pn	%xcc,	loop_2698
loop_2697:
	tg	%xcc,	0x2
	fmovdl	%xcc,	%f29,	%f14
	alignaddr	%l0,	%i7,	%g4
loop_2698:
	movg	%xcc,	%l1,	%o3
	fbne,a	%fcc2,	loop_2699
	bl,a	%xcc,	loop_2700
	tgu	%icc,	0x3
	fbg,a	%fcc3,	loop_2701
loop_2699:
	edge32	%i6,	%g1,	%o1
loop_2700:
	or	%i3,	0x0170,	%g6
	orcc	%l3,	0x0549,	%o0
loop_2701:
	ldx	[%l7 + 0x38],	%o7
	addcc	%i4,	0x1FFA,	%l4
	nop
	setx loop_2702, %l0, %l1
	jmpl %l1, %g7
	ta	%xcc,	0x2
	srlx	%i0,	0x19,	%g2
	for	%f4,	%f22,	%f10
loop_2702:
	ba,a,pn	%xcc,	loop_2703
	bn	loop_2704
	brz	%o4,	loop_2705
	fmovrdlz	%l5,	%f0,	%f16
loop_2703:
	fornot2s	%f24,	%f26,	%f9
loop_2704:
	orncc	%i2,	0x03FC,	%g5
loop_2705:
	nop
	set	0x68, %i5
	stda	%o4,	[%l7 + %i5] 0xe2
	membar	#Sync
	fmul8x16au	%f21,	%f22,	%f12
	tgu	%icc,	0x3
	fmovdneg	%xcc,	%f20,	%f21
	mulx	%l2,	%o6,	%g3
	movle	%icc,	%i1,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x38],	%f6
	xnor	%o2,	0x015E,	%i5
	tge	%icc,	0x7
	movleu	%xcc,	%l0,	%g4
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x70] %asi,	%f17
	xnor	%l1,	0x07D3,	%i7
	movrne	%i6,	%g1,	%o3
	mova	%icc,	%i3,	%o1
	fandnot2s	%f0,	%f28,	%f1
	movn	%xcc,	%g6,	%o0
	set	0x78, %l6
	stda	%l2,	[%l7 + %l6] 0x22
	membar	#Sync
	fmovsleu	%xcc,	%f16,	%f15
	sir	0x1C54
	fnot2	%f8,	%f30
	fpadd16s	%f14,	%f5,	%f29
	movn	%xcc,	%o7,	%l4
	tle	%xcc,	0x3
	edge32ln	%i4,	%i0,	%g2
	fmovrdgz	%g7,	%f22,	%f6
	addccc	%l5,	0x1E72,	%o4
	edge16l	%i2,	%o5,	%g5
	movne	%icc,	%o6,	%l2
	movrgez	%i1,	%l6,	%g3
	movrne	%i5,	%o2,	%g4
	movrgez	%l1,	0x149,	%l0
	movleu	%icc,	%i6,	%g1
	edge16	%o3,	%i3,	%o1
	sub	%i7,	%g6,	%o0
	fmovsgu	%xcc,	%f30,	%f13
	set	0x19, %o0
	ldsba	[%l7 + %o0] 0x89,	%l3
	brlz	%o7,	loop_2706
	fors	%f17,	%f12,	%f22
	subccc	%l4,	0x0BF7,	%i0
	fmovsge	%icc,	%f16,	%f9
loop_2706:
	bg,a	loop_2707
	fmovrdlz	%i4,	%f30,	%f2
	fmuld8ulx16	%f9,	%f2,	%f10
	sll	%g7,	0x12,	%g2
loop_2707:
	fmovsvs	%icc,	%f20,	%f9
	set	0x48, %i6
	sta	%f24,	[%l7 + %i6] 0x88
	sdivx	%l5,	0x163E,	%o4
	fmovrdne	%i2,	%f18,	%f14
	and	%o5,	0x0847,	%o6
	tne	%icc,	0x1
	smulcc	%g5,	0x0BDA,	%l2
	tne	%xcc,	0x6
	taddcc	%i1,	%l6,	%i5
	membar	0x52
	fbuge,a	%fcc1,	loop_2708
	addcc	%g3,	0x0B5E,	%o2
	ta	%xcc,	0x7
	fmovspos	%icc,	%f11,	%f27
loop_2708:
	tne	%icc,	0x3
	bg,a,pn	%icc,	loop_2709
	tle	%icc,	0x2
	fmuld8sux16	%f3,	%f16,	%f20
	fmovdvs	%xcc,	%f18,	%f28
loop_2709:
	mulscc	%l1,	0x065A,	%l0
	ba,a,pt	%icc,	loop_2710
	fmovdpos	%xcc,	%f10,	%f1
	fmovsvc	%xcc,	%f28,	%f7
	movg	%xcc,	%g4,	%i6
loop_2710:
	alignaddrl	%o3,	%g1,	%i3
	fmovdcs	%xcc,	%f10,	%f18
	fmovse	%xcc,	%f15,	%f8
	nop
	set	0x40, %o2
	ldsh	[%l7 + %o2],	%o1
	alignaddr	%g6,	%o0,	%i7
	tsubcctv	%l3,	0x04AC,	%l4
	alignaddr	%i0,	%i4,	%o7
	movl	%icc,	%g7,	%l5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%g2,	%i2
	edge32ln	%o4,	%o6,	%o5
	wr	%g0,	0x2b,	%asi
	stda	%g4,	[%l7 + 0x10] %asi
	membar	#Sync
	orncc	%i1,	0x0145,	%l6
	udivx	%i5,	0x13C4,	%l2
	fandnot2s	%f30,	%f27,	%f6
	alignaddrl	%o2,	%l1,	%l0
	fbne,a	%fcc1,	loop_2711
	alignaddr	%g4,	%i6,	%g3
	membar	0x68
	subccc	%g1,	%o3,	%i3
loop_2711:
	fcmple32	%f30,	%f16,	%g6
	fbg,a	%fcc3,	loop_2712
	movvs	%icc,	%o0,	%i7
	set	0x40, %o3
	ldxa	[%l7 + %o3] 0x81,	%l3
loop_2712:
	fbne	%fcc2,	loop_2713
	movle	%xcc,	%o1,	%l4
	tcc	%icc,	0x6
	set	0x6A, %g3
	ldsha	[%l7 + %g3] 0x11,	%i0
loop_2713:
	srl	%i4,	%o7,	%l5
	fmovdcc	%xcc,	%f29,	%f23
	alignaddr	%g7,	%g2,	%i2
	fbue,a	%fcc1,	loop_2714
	movneg	%icc,	%o6,	%o5
	call	loop_2715
	fabss	%f11,	%f14
loop_2714:
	movpos	%icc,	%o4,	%i1
	fandnot2	%f24,	%f18,	%f16
loop_2715:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g5,	0x18C1,	%i5
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xf9
	membar	#Sync
	brgez	%l6,	loop_2716
	edge32l	%l2,	%l1,	%o2
	tsubcctv	%g4,	%l0,	%g3
	edge8l	%g1,	%i6,	%i3
loop_2716:
	ldx	[%l7 + 0x10],	%o3
	fcmpeq16	%f26,	%f26,	%o0
	xorcc	%g6,	0x0A95,	%l3
	alignaddr	%o1,	%l4,	%i7
	mulx	%i4,	%o7,	%l5
	edge32l	%g7,	%g2,	%i2
	fmul8x16	%f10,	%f30,	%f18
	wr	%g0,	0x89,	%asi
	stda	%o6,	[%l7 + 0x68] %asi
	bleu,a,pt	%icc,	loop_2717
	edge32ln	%o5,	%i0,	%o4
	sethi	0x19A7,	%i1
	andncc	%i5,	%l6,	%l2
loop_2717:
	fandnot2s	%f13,	%f24,	%f5
	tcc	%icc,	0x5
	or	%l1,	%o2,	%g4
	bvc,a,pt	%icc,	loop_2718
	xnorcc	%g5,	0x1356,	%l0
	tvs	%icc,	0x4
	ta	%icc,	0x6
loop_2718:
	nop
	set	0x3A, %g4
	ldsha	[%l7 + %g4] 0x81,	%g3
	fmovsne	%xcc,	%f6,	%f31
	tsubcctv	%i6,	0x0150,	%g1
	fnands	%f7,	%f24,	%f1
	movgu	%icc,	%i3,	%o0
	wr	%g0,	0x88,	%asi
	sta	%f15,	[%l7 + 0x14] %asi
	mulscc	%o3,	%g6,	%o1
	tcs	%xcc,	0x5
	ldx	[%l7 + 0x30],	%l3
	sir	0x146E
	movne	%icc,	%i7,	%i4
	edge32n	%l4,	%o7,	%g7
	array16	%l5,	%g2,	%o6
	movvc	%icc,	%o5,	%i0
	fpack32	%f18,	%f26,	%f10
	movg	%xcc,	%i2,	%o4
	fcmpes	%fcc1,	%f19,	%f2
	sdivx	%i1,	0x0D99,	%l6
	edge32l	%l2,	%l1,	%i5
	fzero	%f26
	edge32n	%o2,	%g4,	%l0
	fmovrslz	%g5,	%f21,	%f11
	orncc	%g3,	%i6,	%g1
	movpos	%icc,	%i3,	%o3
	fmovdleu	%xcc,	%f16,	%f0
	fbn	%fcc1,	loop_2719
	bn,a	loop_2720
	movvs	%icc,	%g6,	%o1
	addccc	%l3,	0x0F54,	%i7
loop_2719:
	smulcc	%o0,	0x1318,	%i4
loop_2720:
	edge16ln	%l4,	%g7,	%o7
	tn	%icc,	0x4
	and	%l5,	0x0CFD,	%o6
	mulscc	%g2,	%i0,	%i2
	edge8l	%o5,	%o4,	%l6
	brgz,a	%i1,	loop_2721
	nop
	setx	loop_2722,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdgz	%l1,	%f6,	%f28
	tneg	%icc,	0x4
loop_2721:
	edge16	%l2,	%i5,	%o2
loop_2722:
	move	%icc,	%g4,	%l0
	movvs	%xcc,	%g3,	%g5
	edge8n	%i6,	%g1,	%i3
	ba	%icc,	loop_2723
	movgu	%icc,	%o3,	%o1
	movrgez	%g6,	%l3,	%i7
	stb	%i4,	[%l7 + 0x26]
loop_2723:
	fmovsle	%xcc,	%f18,	%f30
	array32	%l4,	%o0,	%o7
	addc	%g7,	%o6,	%g2
	stb	%l5,	[%l7 + 0x09]
	edge16ln	%i0,	%o5,	%o4
	brz,a	%l6,	loop_2724
	tge	%icc,	0x5
	brz,a	%i2,	loop_2725
	fbul	%fcc2,	loop_2726
loop_2724:
	udivcc	%l1,	0x1409,	%i1
	fbe,a	%fcc2,	loop_2727
loop_2725:
	movneg	%xcc,	%l2,	%o2
loop_2726:
	edge8ln	%g4,	%i5,	%g3
	edge32l	%l0,	%i6,	%g5
loop_2727:
	fxnor	%f10,	%f6,	%f2
	add	%i3,	%g1,	%o1
	fpadd32s	%f28,	%f22,	%f14
	srax	%o3,	0x14,	%l3
	set	0x48, %l1
	prefetcha	[%l7 + %l1] 0x89,	 0x0
	tn	%xcc,	0x7
	fexpand	%f28,	%f6
	fbuge,a	%fcc1,	loop_2728
	fands	%f6,	%f25,	%f17
	taddcctv	%i4,	0x08EC,	%l4
	te	%xcc,	0x7
loop_2728:
	call	loop_2729
	addccc	%i7,	%o0,	%o7
	movn	%xcc,	%g7,	%o6
	set	0x30, %l5
	swapa	[%l7 + %l5] 0x19,	%l5
loop_2729:
	nop
	set	0x68, %i1
	lduba	[%l7 + %i1] 0x0c,	%g2
	edge32l	%o5,	%i0,	%l6
	fmovrdgez	%i2,	%f6,	%f16
	fmuld8sux16	%f9,	%f4,	%f26
	bg,pt	%icc,	loop_2730
	xnorcc	%o4,	0x16A1,	%l1
	ldsw	[%l7 + 0x44],	%l2
	fmovsg	%icc,	%f4,	%f19
loop_2730:
	edge32ln	%i1,	%g4,	%i5
	set	0x2D, %o7
	lduba	[%l7 + %o7] 0x18,	%o2
	sdivcc	%g3,	0x05B4,	%i6
	nop
	setx	loop_2731,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	or	%g5,	0x047F,	%i3
	movl	%xcc,	%g1,	%l0
	fexpand	%f11,	%f24
loop_2731:
	fpack32	%f18,	%f26,	%f10
	movn	%xcc,	%o3,	%o1
	sll	%l3,	0x0B,	%g6
	orncc	%i4,	0x0D07,	%l4
	subccc	%i7,	0x1AA0,	%o0
	umul	%o7,	%g7,	%o6
	fornot2s	%f9,	%f7,	%f15
	tge	%icc,	0x0
	addc	%l5,	%o5,	%g2
	movrgz	%l6,	0x150,	%i0
	edge32l	%i2,	%o4,	%l2
	set	0x3C, %i3
	ldswa	[%l7 + %i3] 0x04,	%i1
	fble	%fcc2,	loop_2732
	movleu	%xcc,	%l1,	%i5
	orncc	%g4,	0x15B2,	%o2
	andcc	%i6,	%g3,	%i3
loop_2732:
	movre	%g5,	0x2B7,	%g1
	and	%o3,	0x0A2A,	%o1
	movcs	%xcc,	%l3,	%l0
	tge	%icc,	0x4
	tne	%xcc,	0x5
	fand	%f12,	%f30,	%f26
	fnor	%f4,	%f28,	%f6
	bneg,pn	%xcc,	loop_2733
	fnot2	%f16,	%f16
	array8	%g6,	%i4,	%i7
	movrgez	%o0,	%l4,	%g7
loop_2733:
	edge16ln	%o6,	%o7,	%l5
	fmovrdgez	%o5,	%f20,	%f10
	tneg	%xcc,	0x2
	nop
	set	0x58, %g5
	stx	%l6,	[%l7 + %g5]
	fbul,a	%fcc2,	loop_2734
	fmovsle	%icc,	%f27,	%f3
	mulscc	%i0,	0x1FAB,	%i2
	orcc	%o4,	%g2,	%l2
loop_2734:
	fornot1	%f18,	%f28,	%f26
	sir	0x1BE2
	swap	[%l7 + 0x34],	%i1
	addc	%l1,	%g4,	%o2
	sethi	0x0592,	%i6
	ta	%icc,	0x1
	ldsh	[%l7 + 0x22],	%i5
	sdivx	%g3,	0x1212,	%i3
	fpadd32	%f10,	%f0,	%f2
	movl	%xcc,	%g5,	%g1
	tsubcctv	%o3,	%l3,	%o1
	nop
	set	0x64, %l3
	stw	%l0,	[%l7 + %l3]
	tge	%icc,	0x4
	be,a,pn	%xcc,	loop_2735
	edge32n	%g6,	%i7,	%o0
	fmul8sux16	%f28,	%f30,	%f8
	tl	%xcc,	0x7
loop_2735:
	xnor	%l4,	0x14B3,	%i4
	srl	%o6,	%o7,	%g7
	te	%xcc,	0x2
	nop
	setx	loop_2736,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sir	0x093B
	fors	%f25,	%f0,	%f26
	movrne	%l5,	0x1AB,	%l6
loop_2736:
	edge8l	%i0,	%i2,	%o4
	brlz,a	%o5,	loop_2737
	brnz,a	%g2,	loop_2738
	fblg,a	%fcc0,	loop_2739
	fmovdneg	%icc,	%f21,	%f15
loop_2737:
	or	%i1,	%l2,	%g4
loop_2738:
	edge8n	%o2,	%l1,	%i5
loop_2739:
	nop
	set	0x4A, %o1
	ldstuba	[%l7 + %o1] 0x10,	%g3
	umulcc	%i3,	0x0DDC,	%i6
	movn	%icc,	%g5,	%o3
	xnor	%l3,	%g1,	%l0
	fornot1	%f10,	%f4,	%f12
	mulx	%o1,	%g6,	%i7
	fmovsg	%xcc,	%f1,	%f17
	membar	0x41
	lduh	[%l7 + 0x22],	%o0
	ldsb	[%l7 + 0x1A],	%l4
	alignaddr	%o6,	%o7,	%i4
	sdiv	%g7,	0x1933,	%l5
	mulscc	%l6,	0x0322,	%i2
	taddcc	%o4,	%o5,	%i0
	fmovdvc	%icc,	%f9,	%f9
	movvs	%xcc,	%i1,	%l2
	movrne	%g4,	%g2,	%o2
	ta	%xcc,	0x1
	bleu,a	%xcc,	loop_2740
	fmovdge	%icc,	%f4,	%f2
	edge16	%i5,	%l1,	%g3
	tcc	%xcc,	0x3
loop_2740:
	fmovsn	%icc,	%f29,	%f12
	tneg	%icc,	0x7
	xnor	%i6,	%i3,	%o3
	andncc	%g5,	%l3,	%g1
	tvc	%xcc,	0x7
	mulx	%l0,	0x01CD,	%g6
	bvs	%xcc,	loop_2741
	bne,pn	%xcc,	loop_2742
	addcc	%o1,	%i7,	%o0
	brnz,a	%l4,	loop_2743
loop_2741:
	andncc	%o6,	%i4,	%o7
loop_2742:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz,a	%g7,	loop_2744
loop_2743:
	fornot2	%f14,	%f20,	%f24
	tge	%xcc,	0x5
	prefetch	[%l7 + 0x6C],	 0x0
loop_2744:
	array8	%l5,	%i2,	%l6
	prefetch	[%l7 + 0x64],	 0x2
	fmovrslz	%o4,	%f25,	%f16
	fcmpgt16	%f10,	%f4,	%o5
	movpos	%icc,	%i1,	%i0
	bvc,a	%icc,	loop_2745
	tvc	%xcc,	0x7
	fbug,a	%fcc1,	loop_2746
	sllx	%g4,	0x11,	%l2
loop_2745:
	fnors	%f24,	%f13,	%f1
	stx	%o2,	[%l7 + 0x70]
loop_2746:
	movge	%xcc,	%i5,	%g2
	xorcc	%g3,	0x1C61,	%i6
	brgz,a	%i3,	loop_2747
	array32	%o3,	%g5,	%l3
	srl	%g1,	%l1,	%g6
	bpos,a	%icc,	loop_2748
loop_2747:
	add	%l0,	0x0286,	%i7
	movcs	%xcc,	%o1,	%o0
	srlx	%o6,	0x17,	%i4
loop_2748:
	subccc	%o7,	%l4,	%l5
	xnorcc	%g7,	0x11D2,	%l6
	tg	%xcc,	0x6
	movle	%icc,	%i2,	%o5
	edge32ln	%i1,	%i0,	%o4
	fbn	%fcc2,	loop_2749
	movcs	%icc,	%g4,	%l2
	movrlez	%i5,	%g2,	%g3
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
loop_2749:
	array32	%i3,	%o3,	%g5
	movcs	%xcc,	%o2,	%g1
	set	0x43, %l2
	stba	%l1,	[%l7 + %l2] 0x19
	fmovdg	%xcc,	%f6,	%f16
	brgz,a	%g6,	loop_2750
	fpsub32s	%f19,	%f27,	%f24
	array32	%l3,	%l0,	%i7
	tne	%icc,	0x1
loop_2750:
	te	%xcc,	0x5
	tsubcc	%o1,	0x017D,	%o6
	bpos,a	%icc,	loop_2751
	edge16ln	%i4,	%o0,	%l4
	fpadd16s	%f6,	%f8,	%f13
	tvc	%xcc,	0x4
loop_2751:
	brz	%l5,	loop_2752
	te	%icc,	0x5
	fmovd	%f30,	%f14
	popc	0x02F9,	%o7
loop_2752:
	fpsub16s	%f15,	%f15,	%f12
	movn	%icc,	%l6,	%g7
	subccc	%o5,	%i1,	%i2
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf0,	%f16
	nop
	setx	loop_2753,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbn,a	%fcc0,	loop_2754
	fandnot1s	%f25,	%f5,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2753:
	movrgz	%o4,	0x247,	%i0
loop_2754:
	orn	%l2,	%g4,	%g2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i5,	%i6
	edge8ln	%i3,	%o3,	%g5
	andn	%g3,	0x0D23,	%o2
	subc	%g1,	%g6,	%l1
	add	%l0,	%l3,	%i7
	bg,a	%icc,	loop_2755
	popc	0x081B,	%o1
	movrlz	%i4,	%o6,	%l4
	fmovrslez	%o0,	%f3,	%f4
loop_2755:
	sdivx	%o7,	0x13D2,	%l6
	srlx	%l5,	0x1D,	%g7
	fxors	%f13,	%f6,	%f7
	movge	%xcc,	%i1,	%i2
	sllx	%o5,	%o4,	%l2
	tvs	%icc,	0x5
	movle	%icc,	%i0,	%g4
	edge32	%g2,	%i6,	%i3
	tsubcc	%o3,	%g5,	%g3
	fmovrslz	%o2,	%f24,	%f24
	movneg	%icc,	%i5,	%g1
	set	0x74, %o6
	swapa	[%l7 + %o6] 0x80,	%g6
	edge8l	%l1,	%l3,	%l0
	taddcc	%i7,	0x00B1,	%o1
	brgz,a	%o6,	loop_2756
	fbuge,a	%fcc0,	loop_2757
	fmovs	%f15,	%f2
	xor	%l4,	0x0039,	%o0
loop_2756:
	fpack16	%f28,	%f20
loop_2757:
	popc	0x0C7F,	%o7
	umulcc	%i4,	%l6,	%l5
	fandnot2	%f16,	%f30,	%f8
	fmovrdlz	%g7,	%f4,	%f14
	sethi	0x0227,	%i2
	ble,a,pt	%icc,	loop_2758
	fmovdn	%xcc,	%f28,	%f20
	subcc	%o5,	%o4,	%l2
	fbo,a	%fcc0,	loop_2759
loop_2758:
	fmovrsne	%i1,	%f23,	%f7
	addcc	%i0,	%g4,	%g2
	smul	%i3,	%i6,	%o3
loop_2759:
	nop
	setx	loop_2760,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldsh	[%l7 + 0x24],	%g5
	xnorcc	%o2,	0x0166,	%g3
	tne	%icc,	0x1
loop_2760:
	tleu	%icc,	0x1
	tgu	%xcc,	0x1
	tsubcc	%i5,	%g1,	%g6
	subc	%l3,	%l0,	%l1
	movneg	%icc,	%i7,	%o1
	fmovrslz	%l4,	%f12,	%f27
	popc	%o6,	%o0
	fmovdvc	%icc,	%f7,	%f26
	fmul8sux16	%f30,	%f24,	%f28
	fxor	%f8,	%f12,	%f14
	movrgez	%o7,	%l6,	%i4
	fsrc2s	%f14,	%f6
	sllx	%l5,	%i2,	%g7
	pdist	%f0,	%f6,	%f6
	movl	%icc,	%o4,	%l2
	bn,a,pn	%xcc,	loop_2761
	fmovdne	%icc,	%f9,	%f28
	mulscc	%i1,	%i0,	%o5
	edge32	%g2,	%g4,	%i6
loop_2761:
	movg	%icc,	%o3,	%g5
	udiv	%i3,	0x185F,	%o2
	ldstub	[%l7 + 0x51],	%g3
	tg	%icc,	0x1
	fbg,a	%fcc3,	loop_2762
	addcc	%i5,	0x19D0,	%g1
	movcs	%icc,	%l3,	%l0
	orn	%g6,	0x088A,	%l1
loop_2762:
	tleu	%xcc,	0x1
	wr	%g0,	0x2f,	%asi
	stha	%i7,	[%l7 + 0x32] %asi
	membar	#Sync
	movcs	%xcc,	%o1,	%o6
	edge16n	%l4,	%o0,	%l6
	std	%f26,	[%l7 + 0x40]
	mulx	%i4,	%o7,	%i2
	edge16ln	%l5,	%o4,	%l2
	movvs	%icc,	%g7,	%i1
	fcmps	%fcc3,	%f14,	%f6
	sll	%i0,	0x0A,	%g2
	fmovdge	%xcc,	%f14,	%f24
	movle	%icc,	%o5,	%i6
	sir	0x1A42
	fbul	%fcc1,	loop_2763
	be	loop_2764
	edge32	%g4,	%o3,	%i3
	umul	%o2,	0x0654,	%g5
loop_2763:
	tcs	%xcc,	0x0
loop_2764:
	array32	%g3,	%g1,	%l3
	tn	%icc,	0x5
	addccc	%i5,	%l0,	%l1
	fcmpeq32	%f4,	%f20,	%g6
	srax	%i7,	%o6,	%o1
	udivcc	%o0,	0x089E,	%l4
	xorcc	%l6,	0x1606,	%o7
	taddcctv	%i2,	%l5,	%i4
	fbug	%fcc0,	loop_2765
	ldsh	[%l7 + 0x2A],	%l2
	or	%o4,	%i1,	%g7
	brgz	%i0,	loop_2766
loop_2765:
	movneg	%icc,	%o5,	%g2
	movrgz	%i6,	0x230,	%g4
	edge16	%i3,	%o3,	%o2
loop_2766:
	te	%xcc,	0x6
	array8	%g5,	%g3,	%l3
	mulscc	%i5,	0x1CEE,	%l0
	addccc	%l1,	%g1,	%g6
	tg	%icc,	0x2
	edge16	%i7,	%o1,	%o0
	set	0x30, %l0
	stda	%l4,	[%l7 + %l0] 0x88
	sethi	0x14E8,	%o6
	edge16ln	%o7,	%i2,	%l6
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf1
	membar	#Sync
	fmovdgu	%icc,	%f8,	%f5
	fpadd16s	%f26,	%f1,	%f23
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fbue	%fcc3,	loop_2767
	movge	%icc,	%l5,	%l2
	set	0x42, %i2
	stha	%i4,	[%l7 + %i2] 0x80
loop_2767:
	bpos,pt	%icc,	loop_2768
	sth	%i1,	[%l7 + 0x52]
	tn	%xcc,	0x4
	tneg	%icc,	0x5
loop_2768:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f24,	%f8,	%f0
	taddcc	%o4,	0x1CDB,	%g7
	fmovrdlz	%i0,	%f14,	%f26
	tgu	%icc,	0x1
	fbul	%fcc2,	loop_2769
	mulscc	%g2,	0x028F,	%o5
	movg	%icc,	%i6,	%g4
	orncc	%i3,	0x17FF,	%o2
loop_2769:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x27
	bge	%xcc,	loop_2770
	sub	%g5,	%o3,	%l3
	wr	%g0,	0x11,	%asi
	sta	%f5,	[%l7 + 0x6C] %asi
loop_2770:
	fmovdne	%icc,	%f23,	%f30
	movcs	%icc,	%i5,	%l0
	tvs	%icc,	0x4
	smul	%g3,	0x0D2B,	%l1
	ldd	[%l7 + 0x78],	%g0
	tle	%icc,	0x2
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x10] %asi,	%g6
	edge8	%i7,	%o0,	%l4
	tsubcc	%o1,	%o7,	%i2
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x58] %asi,	%o6
	bshuffle	%f8,	%f14,	%f18
	addcc	%l5,	0x0E9E,	%l6
	tvc	%xcc,	0x2
	addc	%l2,	0x0C9A,	%i1
	edge8	%o4,	%i4,	%i0
	movre	%g2,	%g7,	%i6
	smul	%o5,	%g4,	%o2
	sub	%i3,	%g5,	%o3
	nop
	setx	loop_2771,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umul	%l3,	%i5,	%l0
	subcc	%g3,	%g1,	%l1
	popc	0x1C32,	%i7
loop_2771:
	movge	%icc,	%g6,	%l4
	movpos	%icc,	%o0,	%o1
	subccc	%o7,	%i2,	%l5
	fxor	%f14,	%f10,	%f0
	nop
	setx	loop_2772,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%l6,	0x1BDD,	%o6
	fmul8ulx16	%f28,	%f20,	%f24
	fbg,a	%fcc3,	loop_2773
loop_2772:
	fpack32	%f2,	%f10,	%f20
	fzeros	%f31
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x30] %asi,	%l2
loop_2773:
	tge	%xcc,	0x4
	fornot1	%f22,	%f2,	%f12
	taddcc	%o4,	%i1,	%i0
	fcmped	%fcc0,	%f2,	%f24
	fmovrdgz	%i4,	%f8,	%f30
	std	%f22,	[%l7 + 0x78]
	movcc	%xcc,	%g7,	%i6
	stb	%g2,	[%l7 + 0x38]
	edge32l	%o5,	%o2,	%i3
	tcs	%icc,	0x2
	edge8n	%g5,	%g4,	%l3
	movneg	%icc,	%i5,	%l0
	fpadd32	%f22,	%f8,	%f2
	bleu,a	%xcc,	loop_2774
	brz	%o3,	loop_2775
	xnor	%g3,	0x1378,	%g1
	alignaddrl	%l1,	%g6,	%i7
loop_2774:
	fzero	%f0
loop_2775:
	fsrc1s	%f8,	%f16
	taddcc	%l4,	0x0ECA,	%o1
	sub	%o7,	0x007A,	%i2
	wr	%g0,	0x0c,	%asi
	stwa	%l5,	[%l7 + 0x78] %asi
	wr	%g0,	0x11,	%asi
	sta	%f27,	[%l7 + 0x2C] %asi
	tsubcctv	%l6,	%o0,	%l2
	tle	%icc,	0x1
	fcmpne32	%f10,	%f0,	%o6
	edge32ln	%i1,	%o4,	%i0
	movgu	%xcc,	%i4,	%i6
	edge8ln	%g2,	%g7,	%o2
	movrlez	%o5,	%g5,	%i3
	fnot1	%f6,	%f18
	fmovdvc	%xcc,	%f18,	%f2
	fcmpeq16	%f8,	%f22,	%g4
	fmul8sux16	%f16,	%f30,	%f30
	pdist	%f26,	%f18,	%f30
	add	%i5,	0x0C6F,	%l0
	andncc	%l3,	%o3,	%g1
	tg	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x24] %asi,	%g3
	movrne	%g6,	0x0A9,	%l1
	ldx	[%l7 + 0x28],	%l4
	tleu	%xcc,	0x3
	st	%f16,	[%l7 + 0x28]
	move	%xcc,	%o1,	%i7
	sdivx	%i2,	0x0C5E,	%o7
	fxor	%f14,	%f16,	%f4
	fnot2s	%f21,	%f18
	tsubcctv	%l6,	%l5,	%l2
	edge8l	%o0,	%i1,	%o4
	edge16n	%o6,	%i0,	%i6
	edge16ln	%i4,	%g7,	%o2
	array16	%g2,	%g5,	%o5
	movpos	%icc,	%g4,	%i5
	edge8	%i3,	%l0,	%o3
	nop
	setx	loop_2776,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subccc	%l3,	0x00A8,	%g3
	fmovdn	%xcc,	%f1,	%f5
	movn	%xcc,	%g1,	%l1
loop_2776:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x0F] %asi,	%l4
	srlx	%g6,	%i7,	%o1
	fsrc2	%f4,	%f16
	umulcc	%i2,	%l6,	%l5
	bneg,pn	%icc,	loop_2777
	sll	%o7,	%l2,	%i1
	srax	%o4,	%o6,	%i0
	smulcc	%i6,	0x1388,	%i4
loop_2777:
	movleu	%icc,	%g7,	%o0
	fnors	%f17,	%f12,	%f13
	edge16l	%g2,	%o2,	%g5
	edge16	%g4,	%i5,	%o5
	fmuld8ulx16	%f0,	%f11,	%f30
	prefetch	[%l7 + 0x4C],	 0x0
	tne	%icc,	0x2
	fmuld8sux16	%f26,	%f20,	%f22
	subcc	%l0,	%o3,	%l3
	alignaddrl	%i3,	%g1,	%l1
	sdivcc	%g3,	0x17F1,	%g6
	movge	%xcc,	%i7,	%l4
	brnz,a	%i2,	loop_2778
	umul	%o1,	%l6,	%o7
	movrgez	%l5,	%l2,	%i1
	edge32	%o4,	%i0,	%o6
loop_2778:
	std	%f2,	[%l7 + 0x48]
	popc	0x0084,	%i4
	tneg	%xcc,	0x2
	set	0x66, %g6
	ldsha	[%l7 + %g6] 0x89,	%i6
	prefetch	[%l7 + 0x68],	 0x0
	std	%f8,	[%l7 + 0x60]
	udivx	%g7,	0x017E,	%o0
	tvs	%xcc,	0x6
	subccc	%g2,	%g5,	%g4
	fcmpes	%fcc1,	%f17,	%f0
	andncc	%o2,	%i5,	%l0
	fmovrdgez	%o5,	%f6,	%f2
	xnorcc	%l3,	%i3,	%o3
	addcc	%g1,	%l1,	%g3
	tl	%icc,	0x7
	fnot1s	%f24,	%f21
	edge8ln	%i7,	%g6,	%l4
	fbue,a	%fcc2,	loop_2779
	mulx	%i2,	0x1564,	%l6
	tg	%xcc,	0x3
	fornot1	%f0,	%f2,	%f0
loop_2779:
	membar	0x3C
	movgu	%icc,	%o7,	%o1
	tgu	%xcc,	0x3
	alignaddr	%l5,	%l2,	%o4
	movpos	%xcc,	%i1,	%o6
	tle	%icc,	0x3
	srl	%i0,	0x0E,	%i4
	ble,a	%xcc,	loop_2780
	lduw	[%l7 + 0x24],	%i6
	bcc,a	loop_2781
	edge32	%o0,	%g7,	%g2
loop_2780:
	tne	%icc,	0x4
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2781:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x30] %asi,	%g4
	fcmpes	%fcc1,	%f1,	%f5
	smul	%o2,	%i5,	%l0
	tcs	%xcc,	0x7
	fpmerge	%f28,	%f10,	%f16
	sllx	%o5,	%g5,	%l3
	fmovdvs	%xcc,	%f14,	%f21
	bneg	loop_2782
	ta	%xcc,	0x7
	fble	%fcc2,	loop_2783
	te	%xcc,	0x0
loop_2782:
	movg	%icc,	%i3,	%g1
	sub	%l1,	%g3,	%o3
loop_2783:
	fbl,a	%fcc0,	loop_2784
	sir	0x0AFA
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
loop_2784:
	movrlez	%g6,	0x3EF,	%i2
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x38] %asi,	%l4
	movrgz	%l6,	%o7,	%l5
	wr	%g0,	0x10,	%asi
	stwa	%o1,	[%l7 + 0x18] %asi
	fbg,a	%fcc2,	loop_2785
	orncc	%o4,	%i1,	%l2
	movpos	%icc,	%o6,	%i4
	tg	%icc,	0x4
loop_2785:
	fmovdleu	%icc,	%f0,	%f4
	stb	%i0,	[%l7 + 0x66]
	move	%xcc,	%i6,	%o0
	ldsb	[%l7 + 0x26],	%g2
	tgu	%xcc,	0x2
	movg	%xcc,	%g7,	%g4
	udivcc	%o2,	0x02A1,	%l0
	te	%icc,	0x0
	bcc	loop_2786
	call	loop_2787
	mulx	%o5,	%g5,	%l3
	movvc	%xcc,	%i3,	%g1
loop_2786:
	edge8ln	%l1,	%i5,	%g3
loop_2787:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul,a	%fcc0,	loop_2788
	subcc	%i7,	0x09BA,	%g6
	set	0x78, %o4
	stda	%o2,	[%l7 + %o4] 0x19
loop_2788:
	fpack32	%f0,	%f10,	%f30
	fnot1	%f18,	%f30
	bleu,pt	%icc,	loop_2789
	andcc	%l4,	%i2,	%o7
	wr	%g0,	0x19,	%asi
	stwa	%l5,	[%l7 + 0x60] %asi
loop_2789:
	srl	%l6,	%o4,	%i1
	fble,a	%fcc1,	loop_2790
	or	%o1,	0x183B,	%o6
	set	0x48, %l4
	lda	[%l7 + %l4] 0x15,	%f11
loop_2790:
	ldsb	[%l7 + 0x70],	%i4
	set	0x46, %g7
	lduba	[%l7 + %g7] 0x81,	%i0
	or	%l2,	%i6,	%g2
	alignaddrl	%g7,	%o0,	%o2
	brnz	%l0,	loop_2791
	movgu	%icc,	%g4,	%g5
	movgu	%icc,	%o5,	%l3
	nop
	set	0x68, %i7
	std	%g0,	[%l7 + %i7]
loop_2791:
	movpos	%icc,	%l1,	%i5
	ble,a	loop_2792
	movre	%i3,	0x350,	%g3
	fmovsneg	%icc,	%f12,	%f14
	fmovdle	%icc,	%f31,	%f18
loop_2792:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x54] %asi,	%g6
	movn	%icc,	%i7,	%o3
	udiv	%l4,	0x09DD,	%o7
	movg	%xcc,	%l5,	%i2
	andcc	%l6,	%o4,	%o1
	umul	%o6,	%i1,	%i4
	fmovsneg	%icc,	%f19,	%f6
	subc	%l2,	%i0,	%i6
	movg	%xcc,	%g2,	%g7
	fmovse	%xcc,	%f25,	%f8
	edge32l	%o0,	%o2,	%g4
	tcc	%xcc,	0x0
	brlez	%l0,	loop_2793
	sir	0x060D
	movcs	%icc,	%g5,	%o5
	movrne	%g1,	%l1,	%i5
loop_2793:
	xorcc	%l3,	0x133F,	%i3
	tn	%icc,	0x6
	array8	%g3,	%i7,	%o3
	wr	%g0,	0xeb,	%asi
	stda	%l4,	[%l7 + 0x58] %asi
	membar	#Sync
	fmovdn	%icc,	%f11,	%f19
	fmovsvc	%icc,	%f13,	%f16
	fbuge,a	%fcc0,	loop_2794
	sdivcc	%g6,	0x18C9,	%l5
	faligndata	%f20,	%f16,	%f12
	be,pn	%icc,	loop_2795
loop_2794:
	sethi	0x0F63,	%i2
	subccc	%l6,	%o7,	%o4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x11,	%o1,	%o6
loop_2795:
	ldsw	[%l7 + 0x68],	%i1
	movcc	%xcc,	%l2,	%i0
	fbne	%fcc2,	loop_2796
	udivx	%i4,	0x031F,	%g2
	movrgz	%g7,	%o0,	%i6
	movgu	%xcc,	%g4,	%l0
loop_2796:
	add	%g5,	%o5,	%g1
	edge16n	%l1,	%o2,	%l3
	orcc	%i3,	0x090D,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g3,	%o3,	%i7
	tne	%xcc,	0x6
	umul	%g6,	0x19EF,	%l5
	set	0x20, %g1
	prefetcha	[%l7 + %g1] 0x80,	 0x0
	edge16n	%l6,	%o7,	%l4
	sdiv	%o1,	0x04A2,	%o6
	movre	%o4,	%l2,	%i1
	and	%i4,	%g2,	%i0
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x7E] %asi,	%o0
	tleu	%icc,	0x2
	fornot2s	%f31,	%f25,	%f23
	fmovsa	%icc,	%f25,	%f2
	fandnot2	%f28,	%f8,	%f20
	umulcc	%i6,	%g4,	%l0
	for	%f6,	%f16,	%f14
	edge32l	%g7,	%o5,	%g1
	movpos	%icc,	%l1,	%o2
	fmovscc	%icc,	%f12,	%f29
	array32	%g5,	%l3,	%i5
	popc	%i3,	%o3
	movre	%g3,	%g6,	%l5
	ldsb	[%l7 + 0x2E],	%i7
	array16	%l6,	%i2,	%l4
	sth	%o1,	[%l7 + 0x42]
	movvc	%icc,	%o7,	%o4
	fmovsa	%icc,	%f19,	%f3
	ta	%icc,	0x2
	set	0x0C, %o5
	swapa	[%l7 + %o5] 0x10,	%o6
	smulcc	%l2,	0x12DC,	%i1
	stx	%i4,	[%l7 + 0x20]
	fba,a	%fcc3,	loop_2797
	edge8	%i0,	%g2,	%o0
	sllx	%g4,	0x1A,	%l0
	lduh	[%l7 + 0x30],	%i6
loop_2797:
	movgu	%xcc,	%g7,	%o5
	fbuge	%fcc1,	loop_2798
	sra	%g1,	0x03,	%o2
	array16	%l1,	%l3,	%g5
	movrlz	%i3,	0x051,	%o3
loop_2798:
	tl	%icc,	0x7
	stbar
	bgu	loop_2799
	brgz,a	%g3,	loop_2800
	edge16n	%g6,	%l5,	%i7
	orncc	%l6,	%i2,	%l4
loop_2799:
	fmul8x16	%f2,	%f30,	%f8
loop_2800:
	smulcc	%o1,	%o7,	%o4
	wr	%g0,	0x0c,	%asi
	sta	%f8,	[%l7 + 0x7C] %asi
	mova	%xcc,	%o6,	%l2
	movrlez	%i5,	%i1,	%i4
	srl	%i0,	%g2,	%g4
	movcc	%xcc,	%o0,	%l0
	edge8	%i6,	%o5,	%g7
	fpadd16s	%f10,	%f1,	%f21
	tcc	%icc,	0x1
	edge32n	%o2,	%l1,	%g1
	movrlz	%l3,	%i3,	%o3
	fmovscs	%icc,	%f29,	%f11
	set	0x40, %i5
	stda	%g4,	[%l7 + %i5] 0x0c
	tsubcc	%g6,	%g3,	%i7
	add	%l6,	0x0C56,	%l5
	brgz	%l4,	loop_2801
	stw	%i2,	[%l7 + 0x1C]
	flush	%l7 + 0x50
	sllx	%o7,	0x1E,	%o1
loop_2801:
	edge16ln	%o4,	%l2,	%i5
	orn	%o6,	%i4,	%i0
	ldub	[%l7 + 0x0C],	%g2
	fors	%f0,	%f13,	%f18
	udivx	%g4,	0x1679,	%o0
	ta	%xcc,	0x3
	fnot1s	%f31,	%f29
	fmuld8ulx16	%f30,	%f17,	%f8
	movrne	%i1,	0x082,	%l0
	edge32n	%o5,	%i6,	%g7
	movvs	%icc,	%o2,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l3,	%i3,	%g1
	edge16	%g5,	%g6,	%o3
	srlx	%i7,	%l6,	%g3
	edge32	%l5,	%i2,	%o7
	edge8l	%o1,	%l4,	%o4
	xnor	%l2,	0x0D0D,	%o6
	edge16l	%i4,	%i0,	%g2
	ta	%icc,	0x0
	movrne	%g4,	%i5,	%i1
	fbug,a	%fcc1,	loop_2802
	fmovdleu	%xcc,	%f10,	%f5
	edge16ln	%o0,	%l0,	%o5
	set	0x32, %o0
	stha	%g7,	[%l7 + %o0] 0x80
loop_2802:
	tleu	%xcc,	0x4
	fmovrslez	%i6,	%f11,	%f15
	smul	%l1,	%l3,	%i3
	fmovrdlz	%o2,	%f6,	%f28
	mova	%icc,	%g5,	%g1
	addccc	%o3,	%i7,	%l6
	fbue	%fcc1,	loop_2803
	taddcc	%g6,	0x1127,	%g3
	movl	%icc,	%i2,	%o7
	tvs	%icc,	0x0
loop_2803:
	nop
	set	0x46, %l6
	ldsb	[%l7 + %l6],	%l5
	xorcc	%o1,	0x148E,	%l4
	movrgz	%l2,	%o4,	%i4
	fone	%f18
	movre	%o6,	%i0,	%g2
	fxnor	%f12,	%f26,	%f10
	fnand	%f28,	%f26,	%f22
	stbar
	smul	%i5,	0x1A8F,	%g4
	movrne	%o0,	0x1FB,	%i1
	lduh	[%l7 + 0x7C],	%l0
	ta	%icc,	0x6
	fmovdneg	%xcc,	%f29,	%f16
	udiv	%o5,	0x0343,	%i6
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x1f,	%f16
	subccc	%g7,	%l1,	%i3
	tsubcctv	%l3,	0x0852,	%g5
	fpsub16s	%f8,	%f4,	%f8
	movg	%xcc,	%o2,	%o3
	ld	[%l7 + 0x5C],	%f16
	fmovdcs	%icc,	%f26,	%f20
	movvs	%xcc,	%i7,	%l6
	edge16ln	%g6,	%g3,	%i2
	fmovsgu	%icc,	%f29,	%f8
	sth	%g1,	[%l7 + 0x6A]
	sub	%o7,	%o1,	%l4
	fabss	%f26,	%f13
	fmovscc	%icc,	%f18,	%f11
	nop
	setx	loop_2804,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8n	%l5,	%l2,	%i4
	andncc	%o4,	%o6,	%g2
	sra	%i5,	0x1E,	%g4
loop_2804:
	srax	%i0,	%i1,	%o0
	tle	%xcc,	0x1
	edge16ln	%o5,	%l0,	%g7
	andncc	%l1,	%i6,	%l3
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x6A] %asi,	%g5
	movn	%icc,	%i3,	%o3
	orn	%i7,	0x0488,	%o2
	fxnors	%f2,	%f13,	%f23
	fmovdne	%icc,	%f16,	%f2
	fmovse	%icc,	%f0,	%f5
	fmuld8ulx16	%f18,	%f6,	%f4
	mulscc	%l6,	%g6,	%g3
	edge8n	%g1,	%i2,	%o1
	edge16ln	%l4,	%l5,	%o7
	te	%icc,	0x2
	ldx	[%l7 + 0x30],	%l2
	fbo,a	%fcc2,	loop_2805
	add	%i4,	0x0628,	%o4
	fcmps	%fcc0,	%f26,	%f14
	xnor	%o6,	0x1DFB,	%g2
loop_2805:
	fsrc1	%f18,	%f22
	sll	%g4,	%i0,	%i5
	srlx	%o0,	0x1E,	%o5
	movn	%icc,	%l0,	%i1
	fmovsneg	%xcc,	%f1,	%f18
	fmovdcs	%icc,	%f29,	%f17
	ldd	[%l7 + 0x60],	%f30
	udivcc	%l1,	0x05D8,	%i6
	mova	%icc,	%g7,	%l3
	fbu	%fcc3,	loop_2806
	ldsw	[%l7 + 0x38],	%i3
	movrgz	%g5,	%o3,	%o2
	fornot2s	%f11,	%f14,	%f11
loop_2806:
	fbul,a	%fcc3,	loop_2807
	tcs	%icc,	0x6
	for	%f22,	%f18,	%f24
	fmovdvs	%xcc,	%f25,	%f11
loop_2807:
	addc	%i7,	%g6,	%l6
	edge8	%g3,	%g1,	%i2
	std	%l4,	[%l7 + 0x20]
	movge	%icc,	%l5,	%o7
	set	0x73, %i6
	ldstuba	[%l7 + %i6] 0x18,	%o1
	fbue,a	%fcc2,	loop_2808
	fnegs	%f5,	%f3
	movrgz	%l2,	%i4,	%o6
	taddcctv	%g2,	0x0FF8,	%o4
loop_2808:
	fmovdn	%xcc,	%f20,	%f17
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tn	%icc,	0x0
	fmovsvs	%xcc,	%f4,	%f28
	mulx	%i0,	%i5,	%g4
	fbue	%fcc3,	loop_2809
	edge16n	%o5,	%l0,	%i1
	edge16n	%o0,	%l1,	%g7
	sdivcc	%l3,	0x09AE,	%i6
loop_2809:
	addcc	%i3,	0x1D4F,	%o3
	tcs	%xcc,	0x2
	sdiv	%o2,	0x071D,	%g5
	wr	%g0,	0x10,	%asi
	stwa	%i7,	[%l7 + 0x24] %asi
	tpos	%icc,	0x0
	flush	%l7 + 0x64
	tleu	%xcc,	0x2
	movneg	%xcc,	%l6,	%g6
	fbue	%fcc2,	loop_2810
	fbge	%fcc3,	loop_2811
	edge16l	%g3,	%i2,	%g1
	edge8ln	%l4,	%o7,	%l5
loop_2810:
	array16	%o1,	%l2,	%o6
loop_2811:
	movneg	%icc,	%i4,	%g2
	movgu	%icc,	%o4,	%i0
	ldx	[%l7 + 0x20],	%g4
	fnors	%f9,	%f17,	%f9
	tvs	%xcc,	0x7
	movn	%icc,	%i5,	%l0
	fba	%fcc2,	loop_2812
	call	loop_2813
	lduh	[%l7 + 0x5A],	%i1
	edge16ln	%o0,	%o5,	%l1
loop_2812:
	tne	%icc,	0x0
loop_2813:
	mulscc	%l3,	0x04E3,	%g7
	andn	%i6,	%o3,	%o2
	andncc	%i3,	%i7,	%g5
	ldd	[%l7 + 0x20],	%f14
	ta	%xcc,	0x0
	movvs	%icc,	%g6,	%g3
	edge16l	%i2,	%l6,	%l4
	andcc	%o7,	%l5,	%o1
	fmovdg	%xcc,	%f25,	%f16
	fornot2	%f16,	%f10,	%f8
	sdivx	%g1,	0x0FC9,	%l2
	edge32n	%i4,	%g2,	%o4
	sll	%o6,	0x19,	%g4
	stx	%i0,	[%l7 + 0x30]
	nop
	set	0x5A, %o3
	ldstub	[%l7 + %o3],	%i5
	fbg,a	%fcc0,	loop_2814
	movrgez	%i1,	%l0,	%o5
	udivcc	%l1,	0x1974,	%l3
	add	%g7,	%i6,	%o3
loop_2814:
	fandnot1s	%f3,	%f22,	%f20
	movvc	%xcc,	%o0,	%i3
	edge32ln	%i7,	%g5,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f23,	%f30,	%f22
	movcc	%xcc,	%g6,	%g3
	edge32n	%l6,	%i2,	%o7
	srl	%l4,	%o1,	%l5
	movge	%icc,	%l2,	%g1
	movrgz	%g2,	%o4,	%i4
	bl,a	loop_2815
	fbue,a	%fcc2,	loop_2816
	move	%icc,	%g4,	%i0
	set	0x8, %g3
	stxa	%i5,	[%g0 + %g3] 0x4f
loop_2815:
	stx	%o6,	[%l7 + 0x18]
loop_2816:
	nop
	wr	%g0,	0x57,	%asi
	stxa	%i1,	[%g0 + 0x0] %asi
	set	0x2C, %i4
	ldsha	[%l7 + %i4] 0x89,	%o5
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x0C] %asi,	%l0
	be	loop_2817
	fmul8ulx16	%f24,	%f12,	%f4
	addcc	%l1,	%g7,	%i6
	fnot1s	%f8,	%f20
loop_2817:
	fexpand	%f9,	%f2
	set	0x38, %g4
	ldswa	[%l7 + %g4] 0x04,	%l3
	movcc	%xcc,	%o3,	%i3
	sdiv	%o0,	0x1597,	%i7
	movrgz	%g5,	%o2,	%g3
	movvs	%icc,	%l6,	%g6
	tn	%icc,	0x3
	andcc	%i2,	%l4,	%o1
	tge	%icc,	0x3
	bleu,pn	%icc,	loop_2818
	alignaddrl	%o7,	%l2,	%l5
	sth	%g2,	[%l7 + 0x24]
	fbug,a	%fcc2,	loop_2819
loop_2818:
	mulx	%g1,	0x0655,	%o4
	bl,a,pn	%xcc,	loop_2820
	nop
	set	0x48, %l5
	stw	%g4,	[%l7 + %l5]
loop_2819:
	bcc	%xcc,	loop_2821
	fmovsleu	%icc,	%f23,	%f27
loop_2820:
	sdiv	%i0,	0x0FFD,	%i5
	sdivx	%o6,	0x0943,	%i1
loop_2821:
	edge8l	%i4,	%o5,	%l1
	fmovdcc	%xcc,	%f27,	%f4
	edge8ln	%l0,	%g7,	%i6
	edge32n	%l3,	%o3,	%o0
	smulcc	%i7,	0x16B3,	%g5
	addc	%i3,	0x1505,	%g3
	bneg,pt	%xcc,	loop_2822
	fmovdne	%xcc,	%f17,	%f31
	fmovscs	%xcc,	%f25,	%f12
	brz	%l6,	loop_2823
loop_2822:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o2,	%g6,	%l4
	udiv	%o1,	0x0E1E,	%i2
loop_2823:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%xcc,	%f18,	%f14
	addcc	%l2,	%l5,	%g2
	be,pn	%icc,	loop_2824
	sethi	0x07ED,	%g1
	fbe	%fcc3,	loop_2825
	stw	%o4,	[%l7 + 0x24]
loop_2824:
	nop
	wr	%g0,	0x88,	%asi
	stda	%g4,	[%l7 + 0x68] %asi
loop_2825:
	fpadd32s	%f23,	%f5,	%f28
	mulscc	%i0,	%o7,	%i5
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovsgu	%xcc,	%f14,	%f14
	bne,a	%xcc,	loop_2826
	sll	%i1,	%i4,	%o5
	tle	%xcc,	0x7
	srax	%l1,	0x03,	%l0
loop_2826:
	fmovdvs	%icc,	%f21,	%f31
	alignaddr	%o6,	%i6,	%l3
	movn	%xcc,	%o3,	%g7
	tg	%xcc,	0x4
	tcc	%icc,	0x5
	fmovdn	%icc,	%f11,	%f2
	fsrc1	%f12,	%f6
	set	0x50, %l1
	prefetcha	[%l7 + %l1] 0x81,	 0x3
	edge16l	%o0,	%g5,	%i3
	movcc	%xcc,	%g3,	%o2
	set	0x18, %i1
	ldxa	[%g0 + %i1] 0x20,	%l6
	tsubcctv	%g6,	0x1DD2,	%l4
	srl	%i2,	0x18,	%o1
	smul	%l2,	0x11BB,	%g2
	andn	%g1,	0x117E,	%o4
	set	0x5C, %i3
	stwa	%g4,	[%l7 + %i3] 0x27
	membar	#Sync
	bleu,pn	%icc,	loop_2827
	tvs	%icc,	0x1
	subc	%i0,	0x11EF,	%o7
	srax	%l5,	0x0A,	%i1
loop_2827:
	fnot2s	%f30,	%f2
	udiv	%i5,	0x1A5E,	%o5
	fmovsleu	%icc,	%f3,	%f30
	xor	%l1,	%l0,	%i4
	fnot1s	%f13,	%f26
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x44] %asi,	%f26
	fbo	%fcc0,	loop_2828
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o6,	0x1ADB,	%i6
	fmul8ulx16	%f24,	%f24,	%f16
loop_2828:
	nop
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x74] %asi,	%o3
	fmovdn	%icc,	%f5,	%f21
	fexpand	%f8,	%f0
	tl	%xcc,	0x1
	edge32	%g7,	%i7,	%o0
	brlz,a	%l3,	loop_2829
	edge32n	%i3,	%g5,	%o2
	ldx	[%l7 + 0x20],	%g3
	movrne	%g6,	%l6,	%l4
loop_2829:
	tn	%icc,	0x0
	prefetch	[%l7 + 0x0C],	 0x0
	xorcc	%o1,	0x0A56,	%l2
	fandnot1s	%f31,	%f18,	%f29
	fcmps	%fcc3,	%f20,	%f31
	ba,pn	%xcc,	loop_2830
	fcmple32	%f0,	%f0,	%i2
	set	0x11, %o7
	stba	%g2,	[%l7 + %o7] 0x27
	membar	#Sync
loop_2830:
	fnand	%f20,	%f8,	%f12
	tgu	%icc,	0x1
	fbg	%fcc2,	loop_2831
	smulcc	%g1,	%o4,	%i0
	taddcctv	%o7,	0x14F9,	%l5
	stb	%g4,	[%l7 + 0x6A]
loop_2831:
	movleu	%xcc,	%i1,	%o5
	stb	%i5,	[%l7 + 0x3E]
	or	%l1,	0x0050,	%i4
	fmovs	%f20,	%f13
	fbule	%fcc3,	loop_2832
	srax	%o6,	0x1B,	%l0
	fmovsle	%icc,	%f20,	%f3
	fbl	%fcc0,	loop_2833
loop_2832:
	tpos	%icc,	0x0
	mulscc	%i6,	%g7,	%i7
	fmovrdgz	%o0,	%f14,	%f10
loop_2833:
	andncc	%l3,	%i3,	%g5
	fcmple16	%f16,	%f6,	%o2
	fmul8sux16	%f2,	%f18,	%f22
	movn	%xcc,	%o3,	%g6
	tne	%xcc,	0x2
	orn	%g3,	%l6,	%l4
	tvc	%icc,	0x4
	std	%o0,	[%l7 + 0x18]
	fmovrsgez	%i2,	%f14,	%f25
	fnand	%f20,	%f20,	%f10
	fmovdl	%icc,	%f21,	%f17
	fcmps	%fcc2,	%f11,	%f29
	movleu	%icc,	%g2,	%g1
	tl	%icc,	0x1
	fmovsn	%xcc,	%f27,	%f13
	tcc	%xcc,	0x4
	brgz,a	%o4,	loop_2834
	movvs	%icc,	%l2,	%i0
	fmovdleu	%xcc,	%f23,	%f6
	movvs	%icc,	%l5,	%g4
loop_2834:
	bne	%xcc,	loop_2835
	edge16l	%o7,	%i1,	%i5
	membar	0x13
	edge8ln	%l1,	%i4,	%o6
loop_2835:
	movg	%icc,	%o5,	%l0
	movneg	%xcc,	%g7,	%i6
	fnand	%f10,	%f10,	%f22
	tcc	%xcc,	0x2
	brgz	%i7,	loop_2836
	fmovscs	%icc,	%f26,	%f26
	movrlz	%o0,	%l3,	%g5
	xorcc	%o2,	0x09D4,	%i3
loop_2836:
	ba,a	loop_2837
	fmovdge	%xcc,	%f29,	%f11
	popc	%o3,	%g6
	fmovde	%icc,	%f11,	%f5
loop_2837:
	fmovdpos	%xcc,	%f17,	%f26
	stb	%g3,	[%l7 + 0x3C]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%l4,	loop_2838
	fnors	%f7,	%f15,	%f25
	tne	%xcc,	0x5
	tge	%icc,	0x5
loop_2838:
	edge8ln	%l6,	%o1,	%i2
	mulscc	%g1,	%g2,	%l2
	movrne	%o4,	0x0DA,	%l5
	movneg	%xcc,	%g4,	%i0
	addcc	%i1,	0x164A,	%i5
	fmovrsgz	%l1,	%f18,	%f3
	fmovse	%xcc,	%f25,	%f19
	orn	%i4,	0x17FE,	%o6
	addc	%o7,	%l0,	%o5
	udiv	%g7,	0x1E7D,	%i7
	sra	%o0,	0x17,	%i6
	movrlz	%l3,	%o2,	%i3
	tneg	%icc,	0x5
	fbl,a	%fcc0,	loop_2839
	movvs	%icc,	%o3,	%g6
	bge,a	%xcc,	loop_2840
	movn	%icc,	%g3,	%l4
loop_2839:
	tleu	%icc,	0x1
	fcmpd	%fcc0,	%f0,	%f26
loop_2840:
	fmovdne	%xcc,	%f2,	%f24
	fbule	%fcc3,	loop_2841
	tn	%xcc,	0x5
	fbo,a	%fcc3,	loop_2842
	addccc	%l6,	%o1,	%i2
loop_2841:
	sdivx	%g1,	0x126E,	%g2
	fmovsvc	%xcc,	%f11,	%f7
loop_2842:
	fmovsge	%icc,	%f20,	%f24
	tne	%icc,	0x3
	ldstub	[%l7 + 0x38],	%l2
	std	%o4,	[%l7 + 0x18]
	orn	%l5,	%g5,	%g4
	srax	%i0,	0x0E,	%i5
	edge16l	%i1,	%i4,	%o6
	brlz	%l1,	loop_2843
	be,pt	%icc,	loop_2844
	edge32	%o7,	%l0,	%o5
	array16	%g7,	%o0,	%i7
loop_2843:
	fbl	%fcc2,	loop_2845
loop_2844:
	fmovrslz	%i6,	%f31,	%f31
	movcs	%xcc,	%o2,	%i3
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x0C] %asi,	%l3
loop_2845:
	movpos	%icc,	%g6,	%g3
	bge,pn	%xcc,	loop_2846
	fmovde	%xcc,	%f12,	%f6
	fnor	%f8,	%f18,	%f6
	udiv	%l4,	0x019E,	%o3
loop_2846:
	fmovdgu	%xcc,	%f4,	%f13
	tpos	%xcc,	0x1
	andcc	%l6,	%i2,	%o1
	movle	%xcc,	%g1,	%l2
	andncc	%g2,	%l5,	%o4
	fmovrdgez	%g5,	%f12,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i0,	0x0C34,	%g4
	fmovspos	%icc,	%f8,	%f29
	bgu,a,pn	%icc,	loop_2847
	movvc	%icc,	%i1,	%i5
	fnegd	%f26,	%f10
	fmovdge	%xcc,	%f10,	%f30
loop_2847:
	andn	%i4,	%l1,	%o7
	fpackfix	%f4,	%f15
	tn	%icc,	0x1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x44] %asi,	%f6
	fcmpeq16	%f28,	%f28,	%l0
	udivx	%o5,	0x11DB,	%g7
	fmovscs	%xcc,	%f10,	%f22
	fornot2s	%f16,	%f10,	%f8
	or	%o0,	%o6,	%i7
	fmovrslz	%i6,	%f23,	%f4
	fandnot1	%f20,	%f6,	%f30
	or	%o2,	%l3,	%i3
	fnegs	%f13,	%f11
	addccc	%g3,	0x0515,	%l4
	fmovrdne	%g6,	%f14,	%f28
	edge8ln	%l6,	%i2,	%o1
	set	0x3C, %g5
	swapa	[%l7 + %g5] 0x18,	%o3
	tne	%xcc,	0x7
	tge	%icc,	0x6
	sub	%g1,	%g2,	%l5
	sethi	0x0F50,	%l2
	fpackfix	%f8,	%f13
	fandnot1	%f10,	%f0,	%f8
	addcc	%g5,	0x1ACE,	%i0
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x1C] %asi,	%g4
	udivcc	%i1,	0x100B,	%o4
	edge8ln	%i4,	%l1,	%o7
	srlx	%l0,	0x01,	%o5
	fmul8x16	%f27,	%f2,	%f4
	fnor	%f14,	%f0,	%f26
	fand	%f12,	%f30,	%f26
	edge16ln	%i5,	%g7,	%o6
	udivx	%i7,	0x1350,	%o0
	addccc	%i6,	%o2,	%i3
	udiv	%g3,	0x06F4,	%l4
	edge8ln	%g6,	%l3,	%l6
	sdivcc	%o1,	0x1021,	%o3
	bpos	%xcc,	loop_2848
	edge16n	%i2,	%g2,	%l5
	edge32ln	%l2,	%g1,	%g5
	movcc	%icc,	%i0,	%i1
loop_2848:
	taddcctv	%o4,	%g4,	%i4
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x22,	%o6
	bgu,pn	%xcc,	loop_2849
	fmovrsgez	%l1,	%f31,	%f4
	edge8l	%o5,	%i5,	%g7
	udivx	%l0,	0x1424,	%o6
loop_2849:
	sub	%i7,	%o0,	%i6
	sub	%o2,	0x17CC,	%g3
	array8	%l4,	%i3,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%xcc,	%f23,	%f15
	and	%l3,	0x1916,	%o1
	fabsd	%f14,	%f12
	tcs	%xcc,	0x3
	bcc,pn	%xcc,	loop_2850
	tge	%icc,	0x2
	movleu	%icc,	%o3,	%i2
	edge8ln	%g2,	%l6,	%l5
loop_2850:
	fmovdgu	%xcc,	%f19,	%f2
	swap	[%l7 + 0x2C],	%l2
	fmul8x16au	%f17,	%f15,	%f28
	sdiv	%g5,	0x1066,	%i0
	tpos	%xcc,	0x1
	tcc	%icc,	0x0
	wr	%g0,	0xe2,	%asi
	stda	%i0,	[%l7 + 0x38] %asi
	membar	#Sync
	orcc	%g1,	%g4,	%o4
	fmuld8sux16	%f19,	%f11,	%f2
	set	0x60, %l3
	prefetcha	[%l7 + %l3] 0x11,	 0x0
	fbn,a	%fcc2,	loop_2851
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x3
	xnorcc	%l1,	%o5,	%i5
loop_2851:
	std	%g6,	[%l7 + 0x58]
	sllx	%o7,	0x1A,	%o6
	wr	%g0,	0xe3,	%asi
	stxa	%l0,	[%l7 + 0x30] %asi
	membar	#Sync
	addcc	%o0,	%i7,	%i6
	movrne	%g3,	0x246,	%o2
	fcmpes	%fcc1,	%f0,	%f18
	fexpand	%f11,	%f10
	set	0x15, %l2
	ldstuba	[%l7 + %l2] 0x89,	%i3
	set	0x2F, %o6
	stba	%g6,	[%l7 + %o6] 0x19
	movrlz	%l3,	%o1,	%l4
	udivcc	%o3,	0x12C1,	%i2
	array16	%l6,	%g2,	%l2
	tcs	%xcc,	0x3
	movle	%icc,	%l5,	%i0
	edge32ln	%i1,	%g1,	%g5
	xnorcc	%g4,	0x1403,	%o4
	edge32	%l1,	%i4,	%i5
	ble,a,pt	%xcc,	loop_2852
	te	%xcc,	0x3
	tsubcc	%o5,	0x1362,	%o7
	tle	%icc,	0x4
loop_2852:
	fcmpne32	%f6,	%f24,	%o6
	ldd	[%l7 + 0x38],	%g6
	lduh	[%l7 + 0x0A],	%l0
	sdiv	%o0,	0x0E39,	%i6
	fnand	%f12,	%f14,	%f20
	movrlz	%i7,	0x061,	%o2
	umulcc	%g3,	0x14CB,	%g6
	edge32l	%i3,	%l3,	%o1
	edge16n	%o3,	%i2,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%xcc,	0x3
	set	0x2A, %i0
	stba	%g2,	[%l7 + %i0] 0x2b
	membar	#Sync
	fnot2s	%f14,	%f22
	sra	%l2,	0x11,	%l4
	ldsh	[%l7 + 0x38],	%l5
	movg	%icc,	%i1,	%g1
	fmovdcs	%icc,	%f24,	%f18
	sethi	0x175A,	%g5
	stb	%g4,	[%l7 + 0x6D]
	sra	%i0,	0x01,	%l1
	ldsw	[%l7 + 0x08],	%i4
	tle	%xcc,	0x4
	addc	%o4,	%o5,	%o7
	edge16ln	%i5,	%o6,	%g7
	popc	%o0,	%l0
	nop
	setx	loop_2853,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	lduh	[%l7 + 0x18],	%i7
	movgu	%xcc,	%o2,	%g3
	mulscc	%i6,	0x0A55,	%g6
loop_2853:
	mulscc	%l3,	%i3,	%o1
	set	0x38, %g2
	lda	[%l7 + %g2] 0x18,	%f21
	srax	%o3,	%l6,	%g2
	fbul,a	%fcc3,	loop_2854
	ldd	[%l7 + 0x40],	%i2
	fexpand	%f15,	%f8
	movg	%icc,	%l2,	%l5
loop_2854:
	fmovdvc	%xcc,	%f31,	%f22
	subcc	%l4,	%g1,	%i1
	srl	%g5,	0x0D,	%g4
	set	0x3E, %l0
	lduba	[%l7 + %l0] 0x89,	%l1
	fmovsleu	%xcc,	%f30,	%f22
	sir	0x0C75
	flush	%l7 + 0x38
	smulcc	%i4,	0x081E,	%i0
	bge,a,pt	%icc,	loop_2855
	movvs	%xcc,	%o4,	%o7
	fbge	%fcc0,	loop_2856
	movpos	%icc,	%i5,	%o6
loop_2855:
	mulscc	%g7,	%o0,	%l0
	movn	%icc,	%o5,	%i7
loop_2856:
	sll	%o2,	0x04,	%g3
	movcc	%xcc,	%i6,	%l3
	ta	%icc,	0x2
	alignaddrl	%g6,	%o1,	%o3
	movle	%xcc,	%l6,	%g2
	xor	%i3,	0x1A4A,	%i2
	membar	0x4E
	fmul8x16al	%f2,	%f29,	%f10
	fbue	%fcc0,	loop_2857
	fpsub16s	%f2,	%f13,	%f1
	movvc	%icc,	%l5,	%l2
	movne	%icc,	%g1,	%l4
loop_2857:
	tpos	%xcc,	0x0
	sethi	0x0795,	%g5
	tsubcctv	%g4,	0x022E,	%l1
	movpos	%icc,	%i4,	%i1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tleu	%icc,	0x5
	sllx	%i0,	%o7,	%o4
	taddcctv	%o6,	%g7,	%i5
	fpsub16s	%f2,	%f16,	%f14
	movrlz	%l0,	%o0,	%o5
	alignaddrl	%o2,	%i7,	%g3
	fmovdne	%xcc,	%f29,	%f19
	bg	loop_2858
	fandnot2s	%f19,	%f17,	%f31
	fbu,a	%fcc3,	loop_2859
	fbg,a	%fcc2,	loop_2860
loop_2858:
	edge32	%l3,	%g6,	%i6
	faligndata	%f14,	%f28,	%f12
loop_2859:
	bne,a,pn	%icc,	loop_2861
loop_2860:
	umul	%o3,	0x0CC1,	%o1
	fpadd32	%f30,	%f24,	%f16
	ldsh	[%l7 + 0x10],	%l6
loop_2861:
	array8	%i3,	%i2,	%l5
	fbule,a	%fcc2,	loop_2862
	xorcc	%l2,	%g1,	%g2
	movl	%icc,	%g5,	%g4
	fcmple16	%f14,	%f28,	%l1
loop_2862:
	taddcc	%l4,	0x18D0,	%i1
	fmovdvs	%icc,	%f1,	%f8
	or	%i0,	0x0714,	%i4
	umul	%o4,	0x0A9A,	%o6
	bne	loop_2863
	edge16	%o7,	%i5,	%g7
	andcc	%l0,	0x1933,	%o5
	nop
	set	0x4B, %g6
	stb	%o2,	[%l7 + %g6]
loop_2863:
	stbar
	lduh	[%l7 + 0x30],	%i7
	srl	%o0,	%l3,	%g3
	stx	%g6,	[%l7 + 0x08]
	membar	0x4C
	tge	%xcc,	0x7
	array8	%i6,	%o3,	%o1
	fmovrsne	%l6,	%f13,	%f25
	set	0x44, %i2
	ldswa	[%l7 + %i2] 0x18,	%i2
	movge	%xcc,	%i3,	%l2
	movleu	%icc,	%l5,	%g1
	fornot2s	%f26,	%f7,	%f24
	smul	%g5,	0x142A,	%g2
	fcmple16	%f24,	%f14,	%l1
	brlz,a	%g4,	loop_2864
	array16	%l4,	%i0,	%i1
	sll	%i4,	0x15,	%o6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o4,	%i5
loop_2864:
	movg	%icc,	%o7,	%g7
	subccc	%l0,	0x0706,	%o2
	tne	%xcc,	0x0
	array32	%i7,	%o5,	%o0
	srlx	%l3,	0x0F,	%g6
	popc	0x07D2,	%i6
	movgu	%xcc,	%g3,	%o1
	movrlz	%l6,	%i2,	%o3
	smul	%i3,	0x1F47,	%l2
	fand	%f0,	%f18,	%f16
	ldsw	[%l7 + 0x0C],	%l5
	sdiv	%g5,	0x08E2,	%g1
	fmovsl	%xcc,	%f9,	%f5
	movvc	%icc,	%l1,	%g2
	fmovdvc	%icc,	%f25,	%f18
	movg	%xcc,	%g4,	%i0
	movle	%xcc,	%i1,	%l4
	tsubcctv	%o6,	%i4,	%i5
	fnot2	%f16,	%f0
	fpackfix	%f6,	%f29
	brlez	%o4,	loop_2865
	std	%o6,	[%l7 + 0x60]
	edge8l	%g7,	%l0,	%o2
	movrne	%o5,	0x3DD,	%i7
loop_2865:
	taddcctv	%l3,	%o0,	%i6
	orncc	%g6,	0x0BCA,	%g3
	fcmpgt16	%f30,	%f12,	%l6
	movvc	%icc,	%i2,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x042A,	%i3
	edge32l	%o1,	%l2,	%g5
	array32	%l5,	%l1,	%g2
	sethi	0x0F89,	%g4
	nop
	setx loop_2866, %l0, %l1
	jmpl %l1, %g1
	alignaddrl	%i0,	%l4,	%o6
	edge16n	%i1,	%i5,	%i4
	ta	%icc,	0x0
loop_2866:
	movcs	%icc,	%o4,	%o7
	ldd	[%l7 + 0x40],	%f18
	bvs,a,pn	%xcc,	loop_2867
	fpsub32s	%f3,	%f11,	%f29
	fsrc2	%f14,	%f24
	edge8ln	%l0,	%o2,	%o5
loop_2867:
	fmuld8ulx16	%f8,	%f8,	%f20
	ldsh	[%l7 + 0x12],	%g7
	array8	%i7,	%o0,	%l3
	subccc	%i6,	%g6,	%g3
	te	%icc,	0x6
	ta	%xcc,	0x6
	edge32n	%l6,	%o3,	%i2
	fmovse	%icc,	%f10,	%f4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%i3
	movneg	%xcc,	%g5,	%l5
	ldsh	[%l7 + 0x76],	%l1
	addcc	%g2,	%g4,	%l2
	fsrc1s	%f20,	%f26
	andcc	%g1,	0x0130,	%i0
	movvs	%xcc,	%o6,	%l4
	brgez,a	%i5,	loop_2868
	fnands	%f0,	%f31,	%f20
	fcmple32	%f0,	%f16,	%i4
	st	%f16,	[%l7 + 0x34]
loop_2868:
	fmovdn	%icc,	%f25,	%f24
	xnorcc	%i1,	%o4,	%l0
	tvc	%icc,	0x4
	move	%xcc,	%o7,	%o2
	sir	0x091A
	tpos	%icc,	0x7
	fmovsn	%icc,	%f10,	%f5
	popc	0x1876,	%o5
	srl	%g7,	%i7,	%o0
	tgu	%icc,	0x6
	tneg	%icc,	0x2
	edge32ln	%l3,	%i6,	%g3
	fcmple16	%f24,	%f22,	%l6
	fmuld8sux16	%f23,	%f5,	%f20
	set	0x7C, %l4
	lduwa	[%l7 + %l4] 0x14,	%o3
	tpos	%icc,	0x4
	add	%i2,	0x0DFC,	%o1
	andncc	%i3,	%g5,	%g6
	sdivcc	%l5,	0x1551,	%l1
	xnor	%g2,	%g4,	%g1
	tleu	%xcc,	0x6
	taddcctv	%l2,	0x09C3,	%i0
	tl	%icc,	0x5
	fmovrse	%o6,	%f22,	%f23
	call	loop_2869
	xor	%i5,	%i4,	%i1
	sir	0x10B8
	xnorcc	%l4,	%o4,	%o7
loop_2869:
	fbug	%fcc1,	loop_2870
	sdiv	%l0,	0x0F53,	%o2
	tsubcctv	%g7,	0x1B3E,	%i7
	ldd	[%l7 + 0x58],	%f6
loop_2870:
	and	%o0,	0x0A6F,	%o5
	array8	%l3,	%g3,	%l6
	movrgz	%i6,	%i2,	%o1
	call	loop_2871
	fcmpgt16	%f26,	%f14,	%i3
	bl	loop_2872
	taddcctv	%g5,	0x118C,	%g6
loop_2871:
	movneg	%icc,	%o3,	%l5
	ldub	[%l7 + 0x22],	%g2
loop_2872:
	prefetch	[%l7 + 0x28],	 0x2
	or	%g4,	%l1,	%l2
	sdiv	%g1,	0x1D61,	%i0
	tsubcctv	%o6,	0x15E2,	%i5
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x74] %asi,	%i4
	movge	%icc,	%l4,	%o4
	movre	%o7,	0x2DF,	%l0
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
	movvc	%icc,	%g7,	%o2
	bcc,a,pn	%xcc,	loop_2873
	movrgez	%o0,	%i7,	%o5
	fornot1	%f30,	%f26,	%f6
	fmovsn	%xcc,	%f17,	%f18
loop_2873:
	movre	%g3,	%l3,	%l6
	fcmpd	%fcc3,	%f2,	%f24
	fcmpd	%fcc3,	%f28,	%f30
	ldx	[%l7 + 0x58],	%i2
	set	0x70, %o4
	lda	[%l7 + %o4] 0x15,	%f8
	ldsb	[%l7 + 0x44],	%i6
	subc	%i3,	%o1,	%g6
	tleu	%icc,	0x6
	movgu	%icc,	%o3,	%g5
	wr	%g0,	0x27,	%asi
	stba	%l5,	[%l7 + 0x43] %asi
	membar	#Sync
	sdivcc	%g4,	0x0EC6,	%l1
	sdivcc	%l2,	0x1B48,	%g2
	movl	%icc,	%i0,	%o6
	fmovsvs	%icc,	%f6,	%f2
	fpadd32	%f2,	%f8,	%f22
	brlez	%g1,	loop_2874
	tsubcc	%i5,	%l4,	%i4
	bcc,a,pt	%xcc,	loop_2875
	popc	%o4,	%o7
loop_2874:
	smul	%l0,	%i1,	%o2
	fxors	%f18,	%f11,	%f16
loop_2875:
	udiv	%g7,	0x07B0,	%i7
	movrlz	%o5,	0x109,	%g3
	fmovdne	%icc,	%f3,	%f27
	sllx	%o0,	0x0A,	%l3
	fabsd	%f8,	%f0
	ldsw	[%l7 + 0x24],	%i2
	nop
	setx	loop_2876,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	swap	[%l7 + 0x20],	%i6
	fpackfix	%f22,	%f10
	ldd	[%l7 + 0x28],	%f26
loop_2876:
	fsrc1	%f0,	%f4
	movcs	%xcc,	%l6,	%i3
	swap	[%l7 + 0x44],	%g6
	ta	%xcc,	0x4
	tcc	%icc,	0x5
	fnors	%f28,	%f9,	%f25
	fbuge	%fcc0,	loop_2877
	tn	%icc,	0x7
	fmovrdgz	%o1,	%f4,	%f6
	sllx	%g5,	%o3,	%l5
loop_2877:
	bl	loop_2878
	fbn	%fcc1,	loop_2879
	smulcc	%g4,	0x1121,	%l2
	subcc	%g2,	0x1C75,	%i0
loop_2878:
	bpos,a	loop_2880
loop_2879:
	taddcc	%o6,	0x1DF8,	%l1
	fcmps	%fcc0,	%f18,	%f28
	fmuld8sux16	%f6,	%f12,	%f16
loop_2880:
	srl	%i5,	0x1C,	%g1
	movcs	%xcc,	%l4,	%o4
	orncc	%o7,	%l0,	%i1
	fpackfix	%f28,	%f25
	fpsub32s	%f29,	%f12,	%f13
	array16	%o2,	%i4,	%g7
	fpmerge	%f6,	%f16,	%f20
	movrgz	%o5,	0x2AA,	%g3
	mulx	%i7,	%l3,	%i2
	call	loop_2881
	sdiv	%i6,	0x0745,	%l6
	std	%i2,	[%l7 + 0x30]
	move	%icc,	%o0,	%o1
loop_2881:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x64] %asi,	%g5
	fmovrdlz	%o3,	%f8,	%f24
	sdivx	%g6,	0x18B7,	%g4
	movrgez	%l2,	%l5,	%g2
	fmovdvc	%icc,	%f21,	%f15
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o6,	%i0
	edge16ln	%l1,	%g1,	%i5
	fmovsn	%icc,	%f3,	%f17
	addccc	%l4,	%o7,	%o4
	fmovscc	%xcc,	%f7,	%f15
	fbg,a	%fcc0,	loop_2882
	brgez,a	%i1,	loop_2883
	array8	%o2,	%i4,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2882:
	fbe,a	%fcc2,	loop_2884
loop_2883:
	movle	%icc,	%o5,	%g3
	fmovrdlz	%l0,	%f18,	%f22
	movn	%xcc,	%i7,	%i2
loop_2884:
	ldx	[%l7 + 0x08],	%i6
	tvc	%icc,	0x1
	std	%i6,	[%l7 + 0x20]
	sdiv	%l3,	0x02FB,	%i3
	edge8ln	%o1,	%o0,	%o3
	sub	%g5,	0x0AD9,	%g4
	tle	%icc,	0x5
	fcmpeq16	%f22,	%f16,	%g6
	be,pn	%icc,	loop_2885
	nop
	set	0x2E, %i7
	ldsh	[%l7 + %i7],	%l5
	siam	0x3
	movpos	%xcc,	%g2,	%l2
loop_2885:
	brlez	%i0,	loop_2886
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o6,	%g1,	%l1
	fble,a	%fcc3,	loop_2887
loop_2886:
	membar	0x51
	fcmpes	%fcc1,	%f5,	%f23
	addc	%i5,	0x1F0B,	%o7
loop_2887:
	nop
	set	0x20, %g1
	stha	%o4,	[%l7 + %g1] 0x19
	movre	%i1,	%o2,	%l4
	bn,a	loop_2888
	fnot2	%f4,	%f2
	ldd	[%l7 + 0x50],	%f4
	taddcc	%g7,	0x046D,	%o5
loop_2888:
	fpadd32	%f24,	%f22,	%f24
	tgu	%xcc,	0x1
	fone	%f30
	sub	%i4,	%l0,	%i7
	tgu	%icc,	0x3
	fmuld8sux16	%f0,	%f4,	%f30
	xor	%i2,	%i6,	%g3
	fnot1	%f22,	%f14
	tle	%xcc,	0x6
	fmovsa	%xcc,	%f21,	%f26
	bvs,a,pt	%xcc,	loop_2889
	fnand	%f10,	%f0,	%f10
	edge16l	%l6,	%l3,	%i3
	fbge	%fcc2,	loop_2890
loop_2889:
	sll	%o1,	0x1D,	%o3
	fmovdvs	%icc,	%f16,	%f24
	bvs,pn	%xcc,	loop_2891
loop_2890:
	udiv	%o0,	0x08E3,	%g4
	xorcc	%g5,	%l5,	%g2
	fmovdg	%icc,	%f31,	%f31
loop_2891:
	stw	%l2,	[%l7 + 0x24]
	xnorcc	%i0,	0x0F1F,	%g6
	edge8ln	%g1,	%o6,	%l1
	movneg	%icc,	%o7,	%o4
	bcc,a	%xcc,	loop_2892
	ldsw	[%l7 + 0x14],	%i1
	edge8l	%o2,	%l4,	%i5
	subc	%g7,	%o5,	%i4
loop_2892:
	and	%i7,	0x092C,	%l0
	orcc	%i2,	0x0433,	%g3
	sra	%i6,	%l3,	%i3
	movrlez	%o1,	0x374,	%l6
	tpos	%icc,	0x5
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x04,	%f16
	membar	0x13
	movleu	%xcc,	%o0,	%g4
	subcc	%o3,	0x17A9,	%l5
	edge32n	%g2,	%g5,	%i0
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x74] %asi,	%l2
	movrlez	%g6,	0x22C,	%o6
	fcmped	%fcc3,	%f2,	%f20
	add	%l1,	0x1C9A,	%g1
	ldsb	[%l7 + 0x3D],	%o4
	tsubcctv	%o7,	%o2,	%i1
	tsubcc	%l4,	0x0382,	%i5
	movneg	%xcc,	%o5,	%g7
	fbge	%fcc2,	loop_2893
	xnor	%i4,	0x1A17,	%i7
	tge	%icc,	0x4
	te	%icc,	0x3
loop_2893:
	umulcc	%l0,	0x05A5,	%g3
	sllx	%i6,	%i2,	%l3
	stw	%o1,	[%l7 + 0x28]
	udivcc	%l6,	0x18E1,	%i3
	fxnor	%f30,	%f18,	%f12
	move	%icc,	%o0,	%o3
	tvs	%icc,	0x3
	fornot1s	%f30,	%f7,	%f3
	edge16n	%g4,	%g2,	%l5
	fblg	%fcc3,	loop_2894
	fmovdcc	%icc,	%f31,	%f30
	orn	%i0,	0x0B7B,	%g5
	andn	%g6,	%l2,	%o6
loop_2894:
	subccc	%l1,	%o4,	%g1
	xnorcc	%o7,	%i1,	%o2
	sethi	0x0ACF,	%l4
	fmovdvc	%xcc,	%f11,	%f15
	fcmpne32	%f4,	%f4,	%o5
	sllx	%g7,	%i4,	%i7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%i5,	%l0
	fmovsneg	%icc,	%f22,	%f3
	sth	%i6,	[%l7 + 0x7C]
	tleu	%icc,	0x1
	fpsub16s	%f29,	%f26,	%f16
	nop
	setx loop_2895, %l0, %l1
	jmpl %l1, %g3
	ldd	[%l7 + 0x78],	%i2
	fpsub16	%f14,	%f22,	%f2
	wr	%g0,	0x4f,	%asi
	stxa	%o1,	[%g0 + 0x20] %asi
loop_2895:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l3,	%i3
	movleu	%xcc,	%o0,	%l6
	membar	0x6B
	brz,a	%o3,	loop_2896
	fmovrsne	%g4,	%f14,	%f5
	fcmple32	%f0,	%f18,	%l5
	bpos,a	loop_2897
loop_2896:
	tneg	%icc,	0x5
	bg,a,pt	%xcc,	loop_2898
	array32	%g2,	%g5,	%g6
loop_2897:
	ldd	[%l7 + 0x50],	%i0
	tleu	%icc,	0x0
loop_2898:
	movpos	%xcc,	%o6,	%l1
	udivx	%l2,	0x0220,	%o4
	fbule,a	%fcc3,	loop_2899
	sub	%o7,	%i1,	%g1
	movn	%xcc,	%l4,	%o5
	tpos	%icc,	0x5
loop_2899:
	tgu	%icc,	0x5
	tvc	%icc,	0x1
	sdivcc	%g7,	0x1C36,	%i4
	movrlez	%o2,	0x0AE,	%i7
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l0
	fnegd	%f18,	%f14
	orn	%i5,	%i6,	%i2
	fbul	%fcc0,	loop_2900
	tl	%icc,	0x3
	fbul,a	%fcc2,	loop_2901
	tle	%icc,	0x3
loop_2900:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] %asi,	%g3,	%o1
loop_2901:
	taddcctv	%l3,	0x0A1E,	%o0
	bne,a,pn	%xcc,	loop_2902
	fmovdge	%icc,	%f26,	%f14
	tge	%xcc,	0x2
	tcs	%xcc,	0x3
loop_2902:
	fsrc1s	%f23,	%f31
	xorcc	%l6,	0x154B,	%i3
	addc	%g4,	0x1450,	%l5
	set	0x62, %i5
	stba	%g2,	[%l7 + %i5] 0x22
	membar	#Sync
	sdiv	%g5,	0x040C,	%o3
	fbo,a	%fcc3,	loop_2903
	ldd	[%l7 + 0x50],	%f28
	set	0x48, %o0
	ldsha	[%l7 + %o0] 0x0c,	%i0
loop_2903:
	fmovdg	%xcc,	%f3,	%f0
	brlz	%g6,	loop_2904
	edge32	%l1,	%o6,	%o4
	tsubcctv	%l2,	%i1,	%g1
	subcc	%o7,	0x1D4B,	%l4
loop_2904:
	tsubcc	%o5,	%g7,	%o2
	std	%i6,	[%l7 + 0x10]
	fxors	%f30,	%f1,	%f24
	bleu,a	%xcc,	loop_2905
	mova	%xcc,	%l0,	%i4
	fmovda	%icc,	%f4,	%f13
	fblg,a	%fcc0,	loop_2906
loop_2905:
	brgez	%i6,	loop_2907
	fbne	%fcc1,	loop_2908
	tsubcctv	%i5,	%i2,	%o1
loop_2906:
	movle	%icc,	%l3,	%o0
loop_2907:
	tpos	%xcc,	0x1
loop_2908:
	taddcctv	%g3,	0x1F5B,	%i3
	move	%icc,	%g4,	%l6
	tne	%xcc,	0x7
	xnorcc	%g2,	0x151F,	%l5
	fcmpgt16	%f6,	%f6,	%o3
	ble,a,pt	%icc,	loop_2909
	alignaddr	%g5,	%g6,	%l1
	array16	%o6,	%o4,	%l2
	tvs	%xcc,	0x4
loop_2909:
	fmovsge	%xcc,	%f4,	%f25
	tcc	%icc,	0x2
	tn	%xcc,	0x0
	srax	%i1,	%g1,	%i0
	orncc	%l4,	%o7,	%o5
	subc	%o2,	0x122D,	%i7
	fabss	%f17,	%f5
	addcc	%g7,	0x1EE9,	%l0
	sir	0x0D5C
	tn	%icc,	0x1
	movvs	%icc,	%i6,	%i4
	fmovdpos	%xcc,	%f23,	%f20
	edge8l	%i5,	%i2,	%l3
	fnot1s	%f23,	%f23
	call	loop_2910
	ldsh	[%l7 + 0x18],	%o1
	udivx	%o0,	0x1E95,	%g3
	edge16	%g4,	%l6,	%g2
loop_2910:
	nop
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i3
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x17,	%f16
	bge,pt	%icc,	loop_2911
	std	%f18,	[%l7 + 0x40]
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x28] %asi,	%l5
loop_2911:
	andncc	%g5,	%g6,	%o3
	tpos	%icc,	0x0
	fcmped	%fcc1,	%f24,	%f12
	fpadd16s	%f3,	%f9,	%f24
	smul	%o6,	%l1,	%o4
	fcmpgt32	%f28,	%f0,	%l2
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x09] %asi,	%i1
	andn	%i0,	0x16DC,	%g1
	edge8l	%l4,	%o5,	%o7
	popc	%i7,	%g7
	tleu	%icc,	0x0
	tn	%xcc,	0x1
	addccc	%l0,	%i6,	%i4
	brnz,a	%i5,	loop_2912
	bn	loop_2913
	add	%o2,	0x12E2,	%i2
	movne	%icc,	%l3,	%o1
loop_2912:
	alignaddr	%g3,	%o0,	%g4
loop_2913:
	fmovdge	%xcc,	%f20,	%f26
	tl	%xcc,	0x3
	mulx	%l6,	%g2,	%i3
	edge16n	%l5,	%g5,	%o3
	addccc	%o6,	%l1,	%g6
	nop
	setx loop_2914, %l0, %l1
	jmpl %l1, %l2
	bpos,a	loop_2915
	tl	%icc,	0x2
	fnegd	%f10,	%f26
loop_2914:
	orn	%o4,	%i0,	%i1
loop_2915:
	edge8ln	%l4,	%g1,	%o7
	sir	0x13D3
	lduh	[%l7 + 0x30],	%o5
	fmuld8sux16	%f17,	%f21,	%f4
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%g7
	fmovsvs	%xcc,	%f28,	%f17
	ba	loop_2916
	bleu	%icc,	loop_2917
	movneg	%xcc,	%l0,	%i6
	fcmpeq32	%f16,	%f14,	%i4
loop_2916:
	brgez,a	%i5,	loop_2918
loop_2917:
	flush	%l7 + 0x78
	sethi	0x0EBA,	%i7
	orcc	%i2,	0x1AA9,	%o2
loop_2918:
	array8	%o1,	%l3,	%g3
	addccc	%g4,	0x0D17,	%o0
	udivx	%l6,	0x1C05,	%g2
	fcmped	%fcc2,	%f0,	%f28
	fmovse	%xcc,	%f29,	%f13
	bn,a	loop_2919
	movle	%icc,	%l5,	%g5
	sll	%i3,	%o3,	%l1
	sllx	%g6,	%l2,	%o6
loop_2919:
	fbl,a	%fcc3,	loop_2920
	fmovsgu	%xcc,	%f7,	%f21
	movleu	%xcc,	%i0,	%i1
	edge8ln	%l4,	%o4,	%g1
loop_2920:
	orcc	%o7,	0x1EFA,	%o5
	taddcctv	%l0,	%i6,	%g7
	ldsb	[%l7 + 0x4A],	%i4
	edge8n	%i7,	%i2,	%o2
	sth	%i5,	[%l7 + 0x4E]
	movrgez	%o1,	0x367,	%l3
	fnot2	%f26,	%f20
	fcmpgt16	%f2,	%f2,	%g3
	orn	%g4,	0x0417,	%l6
	ldx	[%l7 + 0x30],	%o0
	sth	%l5,	[%l7 + 0x72]
	fmuld8ulx16	%f19,	%f27,	%f14
	fmovsle	%xcc,	%f13,	%f0
	ba,a,pt	%xcc,	loop_2921
	brgez,a	%g5,	loop_2922
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g2,	%o3,	%i3
loop_2921:
	sir	0x1C44
loop_2922:
	array16	%g6,	%l2,	%o6
	add	%i0,	%i1,	%l1
	fmovdcs	%xcc,	%f22,	%f20
	tvc	%xcc,	0x0
	fmovse	%xcc,	%f14,	%f13
	movpos	%xcc,	%o4,	%l4
	movne	%xcc,	%o7,	%o5
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x78] %asi,	%l0
	prefetch	[%l7 + 0x1C],	 0x1
	udivx	%i6,	0x163F,	%g7
	edge32l	%i4,	%i7,	%g1
	movneg	%xcc,	%o2,	%i5
	movvs	%icc,	%o1,	%l3
	edge8n	%g3,	%i2,	%l6
	bcc	%icc,	loop_2923
	fbge	%fcc3,	loop_2924
	bleu,pn	%xcc,	loop_2925
	fmovsle	%xcc,	%f28,	%f29
loop_2923:
	fcmpne32	%f28,	%f2,	%g4
loop_2924:
	tn	%icc,	0x0
loop_2925:
	fmovrslz	%l5,	%f28,	%f21
	set	0x6A, %o2
	stha	%g5,	[%l7 + %o2] 0x11
	fbug	%fcc1,	loop_2926
	ld	[%l7 + 0x48],	%f20
	edge32l	%o0,	%o3,	%g2
	tn	%icc,	0x7
loop_2926:
	tl	%xcc,	0x5
	fmovdpos	%icc,	%f22,	%f18
	add	%i3,	%l2,	%o6
	movne	%xcc,	%i0,	%i1
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%g6,	%l1
	movneg	%icc,	%o4,	%l4
	srlx	%o5,	0x16,	%l0
	umulcc	%o7,	0x0A0E,	%g7
	sdivcc	%i6,	0x1CBE,	%i7
	edge8	%i4,	%o2,	%g1
	sdivcc	%o1,	0x144C,	%l3
	fmovrde	%g3,	%f8,	%f24
	movg	%icc,	%i5,	%l6
	edge8l	%i2,	%l5,	%g5
	fsrc1s	%f11,	%f11
	sethi	0x076B,	%o0
	fmovsleu	%icc,	%f16,	%f5
	fones	%f11
	ble,pn	%xcc,	loop_2927
	fxors	%f25,	%f25,	%f29
	orncc	%o3,	0x1406,	%g2
	addcc	%i3,	%l2,	%o6
loop_2927:
	sdiv	%i0,	0x092E,	%g4
	ba,a	loop_2928
	mova	%xcc,	%g6,	%i1
	movne	%xcc,	%o4,	%l4
	set	0x60, %i6
	ldda	[%l7 + %i6] 0xea,	%o4
loop_2928:
	movl	%xcc,	%l0,	%o7
	tl	%icc,	0x3
	alignaddrl	%g7,	%i6,	%l1
	edge32l	%i4,	%o2,	%i7
	sdiv	%g1,	0x0A8F,	%l3
	orn	%g3,	0x1ED9,	%o1
	srl	%l6,	0x01,	%i2
	fcmpne32	%f12,	%f26,	%i5
	stw	%l5,	[%l7 + 0x20]
	alignaddr	%o0,	%o3,	%g2
	edge16ln	%i3,	%l2,	%g5
	fmovdn	%xcc,	%f25,	%f21
	fmovsne	%xcc,	%f12,	%f4
	fmovdvc	%icc,	%f4,	%f13
	fornot2	%f26,	%f20,	%f18
	movvs	%xcc,	%o6,	%g4
	addccc	%i0,	0x04C0,	%g6
	bgu,pn	%xcc,	loop_2929
	bleu	loop_2930
	fmovrsne	%i1,	%f31,	%f12
	array8	%l4,	%o5,	%o4
loop_2929:
	srlx	%o7,	0x1B,	%g7
loop_2930:
	fcmpne16	%f4,	%f4,	%l0
	edge8l	%i6,	%i4,	%l1
	subccc	%o2,	%i7,	%g1
	tvs	%xcc,	0x1
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x1
	movre	%l3,	%o1,	%l6
	umulcc	%i2,	%i5,	%o0
	bcs,pt	%icc,	loop_2931
	tsubcc	%o3,	0x1994,	%l5
	fsrc1	%f4,	%f12
	bcs,a,pn	%icc,	loop_2932
loop_2931:
	edge32l	%g2,	%l2,	%i3
	fmovrslez	%g5,	%f15,	%f8
	nop
	setx	loop_2933,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2932:
	fbge	%fcc2,	loop_2934
	bvc,a,pt	%icc,	loop_2935
	taddcc	%g4,	%i0,	%o6
loop_2933:
	edge16n	%g6,	%l4,	%i1
loop_2934:
	subc	%o4,	0x0B10,	%o5
loop_2935:
	fcmpgt16	%f14,	%f30,	%g7
	fmovsa	%xcc,	%f9,	%f18
	nop
	set	0x40, %l6
	std	%l0,	[%l7 + %l6]
	fcmps	%fcc2,	%f20,	%f10
	ldd	[%l7 + 0x38],	%i6
	sir	0x1E0A
	edge16l	%i4,	%o7,	%o2
	fpadd32s	%f11,	%f6,	%f26
	fsrc2	%f28,	%f24
	brz	%i7,	loop_2936
	movle	%icc,	%g1,	%l1
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x40] %asi,	%g3
loop_2936:
	umul	%o1,	%l3,	%i2
	set	0x0C, %g3
	ldswa	[%l7 + %g3] 0x88,	%i5
	srl	%o0,	%o3,	%l6
	edge8n	%l5,	%g2,	%i3
	mulscc	%l2,	0x0893,	%g4
	bl	%xcc,	loop_2937
	fbg	%fcc3,	loop_2938
	tne	%xcc,	0x0
	wr	%g0,	0x19,	%asi
	stda	%g4,	[%l7 + 0x48] %asi
loop_2937:
	andn	%i0,	0x02CE,	%o6
loop_2938:
	edge16n	%l4,	%i1,	%o4
	fbl,a	%fcc1,	loop_2939
	edge32	%g6,	%g7,	%o5
	smul	%i6,	%l0,	%i4
	ta	%xcc,	0x3
loop_2939:
	brgez	%o7,	loop_2940
	fmovrslez	%i7,	%f6,	%f1
	fble,a	%fcc3,	loop_2941
	taddcc	%o2,	%l1,	%g3
loop_2940:
	movleu	%icc,	%o1,	%g1
	ldsw	[%l7 + 0x44],	%i2
loop_2941:
	sllx	%i5,	0x0E,	%o0
	fmovsleu	%icc,	%f22,	%f5
	mova	%icc,	%o3,	%l6
	fmovsl	%icc,	%f27,	%f21
	taddcc	%l5,	%g2,	%i3
	fmul8x16au	%f29,	%f13,	%f16
	fbu,a	%fcc1,	loop_2942
	umul	%l3,	%l2,	%g5
	movcs	%icc,	%i0,	%o6
	movrlz	%g4,	%l4,	%i1
loop_2942:
	movre	%o4,	0x161,	%g7
	fcmpgt32	%f28,	%f22,	%o5
	udivx	%i6,	0x118E,	%g6
	pdist	%f10,	%f26,	%f8
	edge16l	%l0,	%o7,	%i4
	fmovrdlz	%o2,	%f16,	%f18
	movcc	%xcc,	%i7,	%l1
	fmovsgu	%xcc,	%f24,	%f23
	fmovdle	%icc,	%f0,	%f12
	fmul8x16au	%f22,	%f7,	%f12
	ldsb	[%l7 + 0x44],	%g3
	addcc	%o1,	0x1EBD,	%g1
	fbug,a	%fcc3,	loop_2943
	be,a	%xcc,	loop_2944
	movcs	%xcc,	%i5,	%o0
	tneg	%xcc,	0x1
loop_2943:
	andcc	%i2,	0x0FD8,	%o3
loop_2944:
	stx	%l6,	[%l7 + 0x70]
	bge,a,pt	%xcc,	loop_2945
	fpsub16	%f24,	%f18,	%f4
	bpos,pt	%icc,	loop_2946
	fmovsne	%xcc,	%f10,	%f17
loop_2945:
	orncc	%l5,	0x02B0,	%i3
	alignaddr	%l3,	%l2,	%g5
loop_2946:
	array16	%g2,	%o6,	%g4
	fabss	%f11,	%f28
	brlz,a	%i0,	loop_2947
	orncc	%i1,	0x15B3,	%o4
	xorcc	%l4,	%g7,	%i6
	edge8l	%g6,	%l0,	%o7
loop_2947:
	bn,a	loop_2948
	fpadd32s	%f16,	%f6,	%f22
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x10,	%i4,	%o5
loop_2948:
	fnot2	%f12,	%f14
	brlez	%i7,	loop_2949
	smulcc	%o2,	0x1A03,	%g3
	movne	%icc,	%o1,	%l1
	edge8l	%g1,	%i5,	%o0
loop_2949:
	xor	%o3,	0x0838,	%l6
	fmovse	%icc,	%f21,	%f9
	or	%l5,	0x070A,	%i2
	edge32ln	%i3,	%l2,	%g5
	fbn	%fcc1,	loop_2950
	tsubcc	%g2,	%o6,	%g4
	tne	%icc,	0x4
	fmul8x16al	%f24,	%f16,	%f28
loop_2950:
	fcmps	%fcc2,	%f31,	%f8
	sllx	%l3,	0x16,	%i0
	bne,pt	%xcc,	loop_2951
	movrlez	%i1,	0x22A,	%o4
	popc	0x0DC6,	%g7
	sdivx	%i6,	0x024C,	%l4
loop_2951:
	fcmpgt32	%f22,	%f28,	%g6
	fbe	%fcc2,	loop_2952
	ta	%xcc,	0x7
	fmovd	%f24,	%f12
	movre	%l0,	%i4,	%o5
loop_2952:
	nop
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tcc	%xcc,	0x2
	sethi	0x043A,	%o7
	tge	%xcc,	0x4
	mova	%icc,	%i7,	%g3
	bge,a,pt	%xcc,	loop_2953
	fpadd16s	%f5,	%f11,	%f22
	udivx	%o2,	0x139B,	%o1
	udiv	%l1,	0x0415,	%g1
loop_2953:
	fsrc2	%f30,	%f10
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	orn	%o0,	%o3,	%l6
	movrgez	%i5,	0x081,	%i2
	brlz,a	%i3,	loop_2954
	xnorcc	%l5,	0x0E33,	%g5
	array16	%g2,	%l2,	%g4
	tcc	%xcc,	0x1
loop_2954:
	movrne	%o6,	0x294,	%i0
	fcmpgt32	%f8,	%f30,	%i1
	taddcctv	%l3,	0x0DD8,	%o4
	fornot1s	%f27,	%f22,	%f9
	movrgz	%i6,	0x296,	%g7
	srlx	%l4,	%g6,	%i4
	fmul8x16al	%f15,	%f16,	%f14
	set	0x18, %i4
	ldswa	[%l7 + %i4] 0x14,	%o5
	movrgz	%l0,	0x12B,	%o7
	movcc	%xcc,	%g3,	%i7
	add	%o1,	%o2,	%g1
	udivcc	%o0,	0x1607,	%l1
	fmovscc	%icc,	%f25,	%f15
	bshuffle	%f16,	%f2,	%f20
	fbg,a	%fcc2,	loop_2955
	smulcc	%l6,	%o3,	%i5
	brgez	%i2,	loop_2956
	fbule,a	%fcc1,	loop_2957
loop_2955:
	movre	%i3,	0x31D,	%g5
	subc	%g2,	%l5,	%l2
loop_2956:
	addcc	%o6,	0x0BEC,	%i0
loop_2957:
	movrgez	%i1,	0x1E4,	%l3
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%o4
	movrlez	%i6,	%g4,	%g7
	andncc	%l4,	%g6,	%i4
	movgu	%icc,	%l0,	%o7
	fmovrdgz	%g3,	%f0,	%f8
	addc	%o5,	%o1,	%o2
	fexpand	%f4,	%f26
	add	%l7,	0x64,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%i7,	%o0
	bgu,a	%xcc,	loop_2958
	fmovrslez	%l1,	%f15,	%f12
	move	%icc,	%g1,	%o3
	movge	%xcc,	%l6,	%i2
loop_2958:
	pdist	%f30,	%f22,	%f8
	orncc	%i3,	%i5,	%g5
	udivx	%l5,	0x1A6E,	%g2
	fbuge	%fcc2,	loop_2959
	orn	%l2,	0x0F43,	%o6
	udiv	%i1,	0x0C7F,	%i0
	bcs	%icc,	loop_2960
loop_2959:
	tvs	%icc,	0x2
	add	%l3,	0x0DF4,	%o4
	bne,pt	%icc,	loop_2961
loop_2960:
	array32	%g4,	%i6,	%g7
	ldub	[%l7 + 0x50],	%g6
	ldd	[%l7 + 0x60],	%i4
loop_2961:
	tvc	%icc,	0x0
	sethi	0x0324,	%l0
	call	loop_2962
	fcmpgt16	%f18,	%f30,	%l4
	fandnot2s	%f24,	%f10,	%f17
	stx	%g3,	[%l7 + 0x70]
loop_2962:
	move	%icc,	%o7,	%o1
	ldstub	[%l7 + 0x24],	%o5
	nop
	setx loop_2963, %l0, %l1
	jmpl %l1, %i7
	and	%o0,	0x1F7B,	%o2
	ldsb	[%l7 + 0x18],	%l1
	brnz	%g1,	loop_2964
loop_2963:
	sth	%o3,	[%l7 + 0x34]
	fand	%f28,	%f6,	%f24
	edge16l	%l6,	%i3,	%i5
loop_2964:
	taddcctv	%g5,	0x15CF,	%i2
	edge8l	%g2,	%l5,	%l2
	fxor	%f28,	%f26,	%f14
	tge	%icc,	0x1
	fcmpes	%fcc3,	%f25,	%f20
	edge32ln	%i1,	%i0,	%l3
	bne	%xcc,	loop_2965
	bne,a	%xcc,	loop_2966
	ble	loop_2967
	array16	%o6,	%g4,	%i6
loop_2965:
	xor	%g7,	0x0673,	%g6
loop_2966:
	lduw	[%l7 + 0x24],	%o4
loop_2967:
	movvc	%xcc,	%l0,	%i4
	edge16n	%g3,	%l4,	%o1
	fmovsg	%xcc,	%f24,	%f10
	orn	%o5,	0x17E3,	%i7
	fmovrsne	%o0,	%f3,	%f30
	sra	%o2,	%l1,	%o7
	udiv	%g1,	0x0CEE,	%o3
	edge8n	%i3,	%i5,	%l6
	fbug	%fcc0,	loop_2968
	tgu	%xcc,	0x7
	set	0x40, %g4
	ldsba	[%l7 + %g4] 0x11,	%g5
loop_2968:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g2,	%i2,	%l5
	udivx	%i1,	0x1F74,	%l2
	fbul,a	%fcc3,	loop_2969
	orncc	%i0,	0x1358,	%l3
	fmovrdlz	%o6,	%f16,	%f16
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
loop_2969:
	tle	%icc,	0x0
	movleu	%xcc,	%i6,	%g7
	bcs,a,pn	%xcc,	loop_2970
	movcc	%xcc,	%g6,	%o4
	movle	%xcc,	%i4,	%l0
	ldx	[%l7 + 0x30],	%g3
loop_2970:
	alignaddr	%l4,	%o5,	%o1
	tg	%xcc,	0x2
	sir	0x1505
	movrlz	%i7,	%o0,	%o2
	fmovdge	%icc,	%f2,	%f23
	sdivx	%l1,	0x09C3,	%g1
	set	0x1B, %o3
	ldstuba	[%l7 + %o3] 0x88,	%o3
	edge8ln	%i3,	%i5,	%l6
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmul8x16	%f14,	%f4,	%f14
	fcmpes	%fcc3,	%f13,	%f26
	fbn	%fcc3,	loop_2971
	alignaddrl	%g5,	%o7,	%i2
	lduh	[%l7 + 0x3E],	%l5
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x2B] %asi,	%g2
loop_2971:
	andcc	%l2,	%i0,	%i1
	bshuffle	%f30,	%f20,	%f28
	movpos	%icc,	%l3,	%o6
	stw	%g4,	[%l7 + 0x5C]
	membar	0x27
	sdiv	%g7,	0x18BF,	%i6
	movrlz	%g6,	%o4,	%l0
	edge16	%g3,	%i4,	%l4
	add	%o1,	%i7,	%o5
	movrgez	%o2,	0x3C2,	%o0
	orn	%l1,	0x1248,	%g1
	tne	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	sta	%f0,	[%l7 + 0x28] %asi
	mova	%icc,	%i3,	%i5
	mulscc	%l6,	%g5,	%o7
	fbl,a	%fcc3,	loop_2972
	fand	%f18,	%f12,	%f0
	tn	%icc,	0x5
	srax	%o3,	0x11,	%l5
loop_2972:
	edge8	%g2,	%i2,	%l2
	fbg	%fcc1,	loop_2973
	movvs	%xcc,	%i1,	%l3
	tl	%icc,	0x2
	edge16l	%o6,	%i0,	%g7
loop_2973:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x0c,	%asi
	sta	%f26,	[%l7 + 0x7C] %asi
	array8	%i6,	%g4,	%g6
	sub	%l0,	%g3,	%i4
	fpsub32	%f2,	%f10,	%f2
	fexpand	%f20,	%f12
	wr	%g0,	0x2a,	%asi
	stha	%o4,	[%l7 + 0x46] %asi
	membar	#Sync
	xnor	%l4,	0x17AC,	%i7
	movl	%xcc,	%o5,	%o2
	fabss	%f14,	%f3
	xorcc	%o0,	0x0D7C,	%l1
	bvs	%xcc,	loop_2974
	movne	%xcc,	%g1,	%o1
	fmovspos	%xcc,	%f3,	%f19
	tgu	%xcc,	0x1
loop_2974:
	fbn	%fcc0,	loop_2975
	ld	[%l7 + 0x58],	%f22
	addccc	%i3,	%l6,	%g5
	movle	%icc,	%o7,	%o3
loop_2975:
	fblg,a	%fcc3,	loop_2976
	fmovdn	%icc,	%f25,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,a	loop_2977
loop_2976:
	fbge	%fcc3,	loop_2978
	te	%xcc,	0x2
	tcs	%icc,	0x2
loop_2977:
	movgu	%icc,	%l5,	%i5
loop_2978:
	fcmps	%fcc3,	%f12,	%f5
	std	%f22,	[%l7 + 0x28]
	set	0x50, %l1
	ldda	[%l7 + %l1] 0x15,	%i2
	edge8l	%g2,	%i1,	%l2
	movpos	%icc,	%o6,	%l3
	sll	%g7,	0x18,	%i6
	udivx	%g4,	0x161F,	%g6
	andn	%i0,	%g3,	%l0
	tpos	%xcc,	0x1
	fmovsa	%icc,	%f4,	%f11
	addcc	%i4,	0x0672,	%o4
	fabss	%f15,	%f17
	set	0x0, %i1
	stxa	%l4,	[%g0 + %i1] 0x57
	movg	%icc,	%o5,	%i7
	sllx	%o2,	0x0A,	%l1
	move	%icc,	%o0,	%g1
	fmovs	%f9,	%f31
	movgu	%xcc,	%i3,	%l6
	andcc	%o1,	%o7,	%o3
	alignaddr	%g5,	%l5,	%i5
	smulcc	%g2,	%i1,	%i2
	fmovrdne	%l2,	%f4,	%f6
	subc	%l3,	0x08B4,	%o6
	fmovsvc	%icc,	%f25,	%f0
	movl	%xcc,	%i6,	%g7
	tsubcc	%g4,	%i0,	%g3
	tsubcctv	%g6,	0x14CD,	%l0
	tg	%icc,	0x5
	fones	%f27
	ld	[%l7 + 0x38],	%f14
	movcc	%xcc,	%o4,	%l4
	addcc	%o5,	%i7,	%o2
	fnand	%f30,	%f10,	%f24
	fmovs	%f23,	%f1
	membar	0x78
	fmovrdgez	%i4,	%f22,	%f24
	movl	%icc,	%o0,	%g1
	udivcc	%i3,	0x1A5B,	%l6
	ta	%xcc,	0x6
	tpos	%icc,	0x4
	tcc	%xcc,	0x2
	swap	[%l7 + 0x44],	%o1
	edge8ln	%o7,	%l1,	%g5
	fbe,a	%fcc2,	loop_2979
	sll	%o3,	0x10,	%i5
	tle	%icc,	0x3
	movle	%xcc,	%l5,	%i1
loop_2979:
	movne	%xcc,	%i2,	%l2
	movgu	%xcc,	%g2,	%l3
	flush	%l7 + 0x08
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%i6
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x78] %asi,	%o6
	orncc	%g7,	%g4,	%i0
	fpack16	%f12,	%f13
	subccc	%g3,	0x0EE5,	%g6
	fmovsne	%icc,	%f31,	%f21
	fnegd	%f4,	%f24
	sir	0x03CD
	fnegd	%f2,	%f8
	fnot1	%f24,	%f10
	sdivx	%l0,	0x167C,	%l4
	addcc	%o5,	0x17F4,	%i7
	stx	%o4,	[%l7 + 0x08]
	tl	%xcc,	0x7
	bgu,a	loop_2980
	fmovrslez	%i4,	%f25,	%f1
	tleu	%xcc,	0x1
	fbug	%fcc1,	loop_2981
loop_2980:
	fbne	%fcc2,	loop_2982
	subc	%o0,	0x1334,	%o2
	fandnot2	%f14,	%f2,	%f14
loop_2981:
	tvs	%xcc,	0x5
loop_2982:
	nop
	set	0x34, %l5
	lduwa	[%l7 + %l5] 0x10,	%g1
	fnot1s	%f20,	%f17
	tg	%icc,	0x2
	set	0x10, %i3
	ldsba	[%l7 + %i3] 0x15,	%l6
	orncc	%i3,	%o1,	%l1
	umul	%g5,	0x0CAF,	%o7
	siam	0x1
	fmovrsgz	%o3,	%f21,	%f9
	umulcc	%l5,	%i5,	%i1
	sllx	%i2,	%g2,	%l3
	fmovde	%xcc,	%f15,	%f16
	orcc	%i6,	%l2,	%o6
	fpackfix	%f20,	%f23
	edge16	%g7,	%g4,	%g3
	ldd	[%l7 + 0x40],	%g6
	ldd	[%l7 + 0x70],	%f28
	edge32l	%l0,	%l4,	%i0
	fmovdvs	%icc,	%f18,	%f3
	sir	0x0D2D
	mulscc	%o5,	0x0F07,	%o4
	edge32n	%i7,	%i4,	%o0
	brlez,a	%o2,	loop_2983
	fsrc1	%f14,	%f4
	movrlez	%g1,	0x337,	%l6
	sra	%o1,	%l1,	%i3
loop_2983:
	movl	%icc,	%o7,	%o3
	movneg	%xcc,	%g5,	%i5
	nop
	setx loop_2984, %l0, %l1
	jmpl %l1, %i1
	sll	%l5,	0x12,	%i2
	movg	%xcc,	%g2,	%l3
	sdivx	%l2,	0x0C4E,	%i6
loop_2984:
	edge16l	%o6,	%g4,	%g7
	udivx	%g6,	0x0907,	%g3
	edge32ln	%l4,	%l0,	%o5
	stbar
	bn	loop_2985
	udivcc	%o4,	0x0FDB,	%i0
	addccc	%i7,	%o0,	%i4
	brlez	%g1,	loop_2986
loop_2985:
	taddcctv	%l6,	0x038A,	%o1
	movne	%icc,	%o2,	%l1
	prefetch	[%l7 + 0x54],	 0x0
loop_2986:
	udivcc	%o7,	0x038D,	%i3
	movvs	%icc,	%o3,	%i5
	edge8ln	%i1,	%l5,	%g5
	fnot1	%f20,	%f12
	fmovsneg	%icc,	%f21,	%f9
	ldstub	[%l7 + 0x64],	%g2
	stw	%i2,	[%l7 + 0x38]
	movn	%xcc,	%l2,	%l3
	or	%i6,	%o6,	%g4
	fmuld8ulx16	%f20,	%f12,	%f4
	bgu,pt	%xcc,	loop_2987
	movre	%g7,	%g3,	%l4
	bge,pn	%xcc,	loop_2988
	tcc	%xcc,	0x5
loop_2987:
	fnand	%f0,	%f0,	%f2
	fnor	%f24,	%f2,	%f22
loop_2988:
	movvc	%xcc,	%g6,	%l0
	fbule	%fcc3,	loop_2989
	umul	%o5,	%o4,	%i7
	udiv	%i0,	0x167E,	%i4
	fmovdg	%icc,	%f31,	%f28
loop_2989:
	edge8l	%g1,	%o0,	%l6
	lduh	[%l7 + 0x0E],	%o2
	brz	%o1,	loop_2990
	mova	%icc,	%o7,	%l1
	movrgez	%o3,	%i5,	%i3
	sll	%i1,	0x17,	%l5
loop_2990:
	nop
	setx	loop_2991,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmple32	%f22,	%f20,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i2,	0x07F5,	%g5
loop_2991:
	fmul8x16al	%f9,	%f16,	%f26
	movle	%xcc,	%l2,	%i6
	mova	%icc,	%o6,	%g4
	fblg	%fcc0,	loop_2992
	fcmpd	%fcc2,	%f2,	%f8
	srax	%g7,	0x07,	%l3
	smulcc	%g3,	0x114C,	%g6
loop_2992:
	swap	[%l7 + 0x28],	%l0
	orcc	%o5,	0x1AA8,	%l4
	subccc	%i7,	%i0,	%o4
	fbuge	%fcc3,	loop_2993
	edge8	%g1,	%i4,	%l6
	ldsw	[%l7 + 0x0C],	%o2
	xnorcc	%o1,	0x0C1F,	%o0
loop_2993:
	alignaddr	%l1,	%o3,	%i5
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf0,	%f16
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x2A] %asi,	%o7
	membar	0x3B
	fmovrdne	%i1,	%f28,	%f2
	fbne	%fcc3,	loop_2994
	mulscc	%i3,	0x0076,	%g2
	popc	0x12B8,	%l5
	andncc	%g5,	%l2,	%i6
loop_2994:
	move	%xcc,	%i2,	%o6
	ble	loop_2995
	movre	%g7,	0x103,	%g4
	bn,a,pt	%xcc,	loop_2996
	tgu	%xcc,	0x7
loop_2995:
	movre	%l3,	%g3,	%l0
	bcc	%icc,	loop_2997
loop_2996:
	movne	%icc,	%g6,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f26,	%f18
loop_2997:
	fbl	%fcc3,	loop_2998
	sdivx	%i7,	0x13A4,	%o5
	fmovscs	%xcc,	%f31,	%f11
	umul	%o4,	0x1339,	%g1
loop_2998:
	ble,pt	%xcc,	loop_2999
	subccc	%i4,	0x17F0,	%l6
	orcc	%o2,	%i0,	%o1
	fmovsgu	%icc,	%f8,	%f22
loop_2999:
	tcs	%icc,	0x6
	fpmerge	%f10,	%f17,	%f0
	for	%f12,	%f14,	%f28
	movpos	%xcc,	%o0,	%o3
	fpadd32	%f28,	%f14,	%f18
	sdivcc	%i5,	0x0F67,	%l1
	fmovrse	%i1,	%f9,	%f17
	udiv	%i3,	0x069B,	%o7
	ldd	[%l7 + 0x40],	%f10
	swap	[%l7 + 0x78],	%g2
	sll	%g5,	%l5,	%l2
	set	0x40, %o1
	stxa	%i2,	[%l7 + %o1] 0x18
	sll	%o6,	%i6,	%g4
	bvc,a,pn	%xcc,	loop_3000
	andn	%l3,	0x1002,	%g7
	srl	%l0,	0x17,	%g6
	fsrc1	%f6,	%f26
loop_3000:
	sdivcc	%g3,	0x07ED,	%i7
	mulscc	%l4,	%o4,	%o5
	fmul8sux16	%f16,	%f16,	%f6
	movg	%xcc,	%i4,	%l6
	ldd	[%l7 + 0x70],	%f4
	fbuge	%fcc2,	loop_3001
	sethi	0x0458,	%o2
	fmovrslez	%g1,	%f30,	%f13
	mova	%xcc,	%i0,	%o0
loop_3001:
	movpos	%xcc,	%o1,	%o3
	set	0x42, %g5
	stha	%l1,	[%l7 + %g5] 0x11
	set	0x7E, %l3
	lduba	[%l7 + %l3] 0x14,	%i1
	fmovdl	%xcc,	%f7,	%f21
	movneg	%xcc,	%i3,	%i5
	and	%g2,	0x1723,	%o7
	addccc	%g5,	0x1B0C,	%l5
	srl	%l2,	0x1F,	%i2
	fcmpes	%fcc0,	%f7,	%f17
	sdiv	%i6,	0x027E,	%o6
	fnor	%f24,	%f22,	%f10
	fbug,a	%fcc0,	loop_3002
	edge32ln	%g4,	%g7,	%l0
	brgez	%l3,	loop_3003
	fsrc1s	%f16,	%f16
loop_3002:
	fandnot2s	%f14,	%f5,	%f25
	xorcc	%g6,	0x1454,	%g3
loop_3003:
	bcc,a	%xcc,	loop_3004
	tn	%icc,	0x4
	set	0x13, %l2
	ldstuba	[%l7 + %l2] 0x80,	%i7
loop_3004:
	ldx	[%l7 + 0x20],	%o4
	subc	%o5,	0x0394,	%l4
	fmovde	%xcc,	%f18,	%f15
	srlx	%l6,	0x0D,	%i4
	fnot1s	%f30,	%f10
	ldd	[%l7 + 0x50],	%g0
	edge16	%o2,	%o0,	%o1
	fmovsa	%xcc,	%f3,	%f2
	ldd	[%l7 + 0x40],	%o2
	fmovsl	%xcc,	%f0,	%f31
	movre	%l1,	0x3A4,	%i0
	tsubcc	%i1,	0x121A,	%i3
	set	0x2C, %i0
	lda	[%l7 + %i0] 0x81,	%f21
	fbne	%fcc2,	loop_3005
	edge32l	%i5,	%o7,	%g2
	fmul8ulx16	%f24,	%f30,	%f26
	andcc	%l5,	0x063F,	%g5
loop_3005:
	movcs	%xcc,	%l2,	%i2
	ld	[%l7 + 0x5C],	%f13
	sllx	%o6,	%i6,	%g7
	fblg	%fcc0,	loop_3006
	fmovsle	%xcc,	%f14,	%f15
	tg	%xcc,	0x5
	fbul,a	%fcc2,	loop_3007
loop_3006:
	xorcc	%l0,	%g4,	%l3
	edge32n	%g3,	%i7,	%o4
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x18] %asi,	%o5
loop_3007:
	fmovdneg	%xcc,	%f3,	%f0
	fbl,a	%fcc3,	loop_3008
	fpack16	%f14,	%f3
	or	%l4,	%g6,	%i4
	popc	0x0369,	%g1
loop_3008:
	array16	%l6,	%o0,	%o2
	tvs	%icc,	0x3
	tle	%xcc,	0x1
	fpsub32s	%f3,	%f13,	%f3
	fsrc2s	%f24,	%f11
	subc	%o3,	%l1,	%o1
	bgu	loop_3009
	edge32ln	%i0,	%i1,	%i5
	bpos	%icc,	loop_3010
	fnegd	%f0,	%f14
loop_3009:
	movcs	%icc,	%i3,	%g2
	edge16ln	%l5,	%o7,	%g5
loop_3010:
	tpos	%icc,	0x2
	bl,pt	%xcc,	loop_3011
	xnor	%l2,	%o6,	%i6
	mova	%icc,	%g7,	%i2
	fmovsg	%icc,	%f10,	%f15
loop_3011:
	fandnot1s	%f31,	%f2,	%f10
	fpackfix	%f24,	%f20
	and	%l0,	0x0856,	%l3
	srax	%g3,	%g4,	%o4
	tcs	%icc,	0x7
	fxors	%f3,	%f1,	%f31
	popc	%o5,	%i7
	movle	%icc,	%l4,	%i4
	movrlez	%g1,	0x151,	%g6
	fmovsgu	%xcc,	%f29,	%f15
	edge16ln	%l6,	%o0,	%o2
	edge8l	%o3,	%l1,	%i0
	mulscc	%o1,	0x11A9,	%i1
	sdivcc	%i5,	0x1E9F,	%i3
	and	%l5,	%o7,	%g5
	bshuffle	%f16,	%f16,	%f30
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x78] %asi,	%l2
	andcc	%g2,	0x1ACA,	%i6
	tsubcctv	%g7,	%i2,	%l0
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x37] %asi,	%l3
	addc	%g3,	0x0CD0,	%o6
	fpsub16s	%f23,	%f1,	%f11
	bcc,a,pt	%xcc,	loop_3012
	fmuld8ulx16	%f12,	%f20,	%f22
	edge8l	%o4,	%g4,	%i7
	ldd	[%l7 + 0x70],	%l4
loop_3012:
	sll	%o5,	%g1,	%i4
	mulx	%l6,	0x1862,	%o0
	movl	%xcc,	%o2,	%g6
	fmovscs	%xcc,	%f21,	%f18
	ldd	[%l7 + 0x78],	%o2
	tcs	%xcc,	0x0
	edge8l	%i0,	%l1,	%o1
	movrlz	%i1,	0x1D9,	%i3
	ta	%icc,	0x6
	edge16	%l5,	%o7,	%g5
	udiv	%l2,	0x1BCE,	%i5
	movpos	%icc,	%i6,	%g2
	movrne	%i2,	0x0D9,	%g7
	subcc	%l3,	0x0AB5,	%l0
	andn	%g3,	0x04B8,	%o4
	andcc	%o6,	%g4,	%l4
	xnor	%o5,	0x0DFC,	%g1
	fcmple32	%f8,	%f4,	%i4
	mova	%xcc,	%i7,	%o0
	fpsub32s	%f17,	%f1,	%f13
	udivcc	%o2,	0x0F50,	%l6
	fmovsneg	%xcc,	%f2,	%f5
	and	%o3,	0x1ABF,	%g6
	sdivx	%l1,	0x1396,	%o1
	stx	%i0,	[%l7 + 0x68]
	array8	%i3,	%i1,	%o7
	fcmps	%fcc2,	%f1,	%f9
	swap	[%l7 + 0x44],	%l5
	fbuge	%fcc0,	loop_3013
	smulcc	%l2,	%i5,	%g5
	addcc	%i6,	0x0DF9,	%i2
	srlx	%g7,	%g2,	%l3
loop_3013:
	edge8ln	%g3,	%l0,	%o6
	ldd	[%l7 + 0x78],	%o4
	fand	%f8,	%f16,	%f10
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x5E] %asi,	%g4
	andn	%o5,	%l4,	%g1
	fpack32	%f16,	%f2,	%f2
	tleu	%icc,	0x6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x50] %asi,	%i4
	fmul8x16al	%f8,	%f2,	%f0
	movle	%icc,	%o0,	%i7
	brgz,a	%l6,	loop_3014
	fbn	%fcc3,	loop_3015
	ble,a,pn	%icc,	loop_3016
	fmovsgu	%xcc,	%f28,	%f16
loop_3014:
	tle	%icc,	0x2
loop_3015:
	bpos	%xcc,	loop_3017
loop_3016:
	ldx	[%l7 + 0x58],	%o2
	movneg	%xcc,	%o3,	%g6
	movrlez	%o1,	0x290,	%i0
loop_3017:
	sll	%l1,	%i1,	%i3
	fmovdcc	%icc,	%f12,	%f1
	pdist	%f6,	%f30,	%f0
	bgu,a	%icc,	loop_3018
	sth	%l5,	[%l7 + 0x44]
	movrlz	%l2,	%o7,	%g5
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x20] %asi,	%i6
loop_3018:
	edge32n	%i5,	%i2,	%g2
	movl	%icc,	%l3,	%g7
	movrlz	%g3,	%l0,	%o6
	taddcc	%g4,	0x045F,	%o4
	subccc	%l4,	0x100D,	%g1
	taddcc	%o5,	%o0,	%i7
	edge32n	%i4,	%o2,	%o3
	bcc,pn	%xcc,	loop_3019
	fcmpd	%fcc1,	%f8,	%f4
	std	%f10,	[%l7 + 0x28]
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x120] %asi,	%g6
loop_3019:
	udiv	%o1,	0x0198,	%l6
	tge	%icc,	0x7
	fbu,a	%fcc3,	loop_3020
	stbar
	orcc	%i0,	0x0743,	%l1
	tvc	%icc,	0x1
loop_3020:
	tne	%icc,	0x3
	fmovrslez	%i1,	%f12,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l5,	%i3
	nop
	setx	loop_3021,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgz	%o7,	0x0B8,	%g5
	xorcc	%i6,	%l2,	%i2
	brlz	%i5,	loop_3022
loop_3021:
	fmovdvs	%icc,	%f16,	%f1
	fpsub32	%f6,	%f2,	%f0
	set	0x10, %o6
	ldxa	[%l7 + %o6] 0x14,	%l3
loop_3022:
	nop
	set	, %l0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2847
!	Type x   	: 1317
!	Type cti   	: 3022
!	Type f   	: 4550
!	Type i   	: 13264
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x5548D9D4
.word 0x6C3FF849
.word 0xE1DC850F
.word 0xEF41FEB1
.word 0x2CB9967B
.word 0xB6C59076
.word 0x7EC41A66
.word 0xFCF1295B
.word 0xFD82230D
.word 0x94DA9E78
.word 0x972328E4
.word 0x4375A6A8
.word 0xC8E0F7FD
.word 0x49736E1F
.word 0x8959B24C
.word 0xA6C03F04
.word 0xA5FCBE54
.word 0xECE3ADC9
.word 0x72E9688D
.word 0x4929BCAD
.word 0x8352ED5E
.word 0x3F8E4871
.word 0x1C98CF5D
.word 0x4C61BD11
.word 0x013D3AE3
.word 0x7AA7A9A2
.word 0x65917289
.word 0x9249DE73
.word 0xD837BECD
.word 0x163149D6
.word 0x880E73FC
.word 0x2972FA5D
.word 0xEAF21139
.word 0xC30E4B27
.word 0x2559BF4B
.word 0x19A69E1C
.word 0xDFA5916C
.word 0xC4553311
.word 0x99BC6CE3
.word 0xA452B4E2
.word 0x3818538A
.word 0x4286FC0B
.word 0x65B50CFF
.word 0xBCB478C8
.word 0x4CB5A39E
.word 0x4CF517F3
.word 0xF3BB8AD5
.word 0x62835065
.word 0x1670B69B
.word 0xB57B08F7
.word 0x1CAF8B8E
.word 0xBAAACA60
.word 0x3EADEEBE
.word 0x4A272804
.word 0x338E23BA
.word 0xB936F22E
.word 0xBC334F07
.word 0xB2B77528
.word 0x3E8C9791
.word 0x1986B8C3
.word 0x3B007434
.word 0x3D5C0CAA
.word 0x3C0FD1CA
.word 0x53A51815
.end
