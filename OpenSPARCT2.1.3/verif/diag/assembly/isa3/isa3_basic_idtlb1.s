/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic_idtlb1.s
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
#define PORTABLE_CORE
		
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO
#define PCONTEXT      0x44
#define SCONTEXT      0x44
#define THREAD_STRIDE 1
#define THREAD_COUNT 8
#define USER_DATA_MT_MAP
#define USER_TEXT_MT_MAP
#define THR_0_PARTID 0
#define THR_1_PARTID 1
#define THR_2_PARTID 2
#define THR_3_PARTID 3
#define THR_4_PARTID 4
#define THR_5_PARTID 5
#define THR_6_PARTID 6
#define THR_7_PARTID 7

! ! large page size to try and prevent TTE overlaps
! #define PART0_Z_TSB_SIZE_0 3
! #define PART0_NZ_TSB_SIZE_0 3
    
#include "nmacros.h"
#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */ 

	ta	T_CHANGE_PRIV  ! run in priv mode
	nop

	rdth_id ! get thread ID in %o1
	umul	%o1, 256, %l7
	setx	user_data_start, %g1, %g3
	add 	%l7, %g3, %l7
	
    th_fork(thread)
    nop
    EXIT_BAD

!
! Thread X Start
!
thread_0:
thread_1:
thread_2:
thread_3:	
thread_4:
thread_5:
thread_6:
thread_7:	

	!# Initialize registers ..
	
	!# Set %l7 for 8 windows
	!# This threads memory space into each windows %l7
	mov 	%l7, 	%g1
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
	setx 	0x0000000000400000,	%l0,	%l6
	stx 	%l6, 	[%l7 + 0x0]
	ldx 	[%l7 + 0x0], 	%fsr

	!# Initialize asi register
	wr  %g0,    0x80,   %asi
	
	!# Global registers
	set	0xB,	%g1
	set	0xD,	%g2
	set	0x4,	%g3
	set	0x2,	%g4
	set	0x0,	%g5
	set	0xE,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x1,	%i1
	set	-0x4,	%i2
	set	-0xC,	%i3
	set	-0x4,	%i4
	set	-0x8,	%i5
	set	-0x9,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x456CAB0A,	%l0
	set	0x0A43DB30,	%l1
	set	0x68DFBD66,	%l2
	set	0x5057ACC4,	%l3
	set	0x21265CD7,	%l4
	set	0x152055D4,	%l5
	set	0x6364E1B8,	%l6
	!# Output registers
	set	0x0B7B,	%o0
	set	-0x0DBF,	%o1
	set	0x07C0,	%o2
	set	-0x1437,	%o3
	set	0x1B36,	%o4
	set	0x0664,	%o5
	set	-0x13FF,	%o6
	set	-0x1ADC,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x2F47F143426FF3F5)
	INIT_TH_FP_REG(%l7,%f2,0x066E334D2832A788)
	INIT_TH_FP_REG(%l7,%f4,0xE64CC38D3A9D93B1)
	INIT_TH_FP_REG(%l7,%f6,0x52DDBB5D3C7F633A)
	INIT_TH_FP_REG(%l7,%f8,0x2A76C868D7BE07AC)
	INIT_TH_FP_REG(%l7,%f10,0x54B63F4A7ECD3112)
	INIT_TH_FP_REG(%l7,%f12,0xEC7C15A64433EFF3)
	INIT_TH_FP_REG(%l7,%f14,0x0D6724BAF3AF2D23)
	INIT_TH_FP_REG(%l7,%f16,0x0447E11EAE229FF7)
	INIT_TH_FP_REG(%l7,%f18,0x59AE8236385BF241)
	INIT_TH_FP_REG(%l7,%f20,0xCD0EA6FC33A75976)
	INIT_TH_FP_REG(%l7,%f22,0x1F2BFA386B1B0031)
	INIT_TH_FP_REG(%l7,%f24,0x39586BAC26A0BC7F)
	INIT_TH_FP_REG(%l7,%f26,0xED4A7D0E9C3E3720)
	INIT_TH_FP_REG(%l7,%f28,0x4AFDBE01787F71F4)
	INIT_TH_FP_REG(%l7,%f30,0x440E95E5D9E790F5)
	!# Other state
	
	or      %g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot


	!# Execute Main Diag ..

	edge16n	%o7,	%g6,	%g3
 	wr	%g0,	0x88,	%asi
	movrgz	%i5,	%g7,	%o6
	andcc	%i1,	0x0CE4,	%g1
	ldx	[%l7 + 0x18],	%g2
	fbul	%fcc1,	loop_1
	bvc	loop_2
	addc	%i3,	0x0531,	%i2
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
loop_1:
	and	%o1,	0x1712,	%o0
loop_2:
	lduw	[%l7 + 0x7C],	%g5
	movvc	%icc,	%o2,	%l6
	bleu,a,pn	%xcc,	loop_3
	brlez	%o3,	loop_4
	fornot2	%f14,	%f14,	%f22
	movleu	%xcc,	%i7,	%l4
loop_3:
	fmovdvc	%icc,	%f26,	%f4
loop_4:
	nop 	! 	ta	%xcc,	0x4 changed by convert2hboot
	ble	loop_5
	smul	%g4,	0x0CAE,	%l1
	fcmpes	%fcc1,	%f30,	%f8
	brlz,a	%i6,	loop_6
loop_5:
	bneg	loop_7
	nop 	! 	ta	%xcc,	0x4 changed by convert2hboot
	sdiv	%i4,	0x1755,	%o5
loop_6:
	orncc	%l0,	0x1BC9,	%o4
loop_7:
	fandnot2s	%f24,	%f26,	%f19
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	fornot1	%f14,	%f30,	%f20
	srax	%l5,	%i0,	%o7
	movrne	%g6,	%g3,	%l2
	nop 	! 	taddcc	%i5,	0x1947,	%g7 changed by convert2hboot
	udivcc	%o6,	0x06CE,	%l3
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	movpos	%xcc,	%i1,	%g1
	subccc	%i3,	0x0447,	%g2
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	bmask	%i2,	%o0,	%o1
	fnot2s	%f5,	%f17
	fmovd	%f22,	%f26
	subccc	%g5,	%o2,	%l6
	subccc	%o3,	0x193F,	%i7
	srl	%g4,	%l4,	%i6
	udivcc	%i4,	0x1F45,	%l1
	udivx	%l0,	0x15DF,	%o4
	fbue,a	%fcc0,	loop_8
	subc	%o5,	%i0,	%l5
	nop 	! 	taddcctv	%o7,	0x03F4,	%g6 changed by convert2hboot
 	wr	%g0,	0x80,	%asi
loop_8:
	movrne	%l2,	0x073,	%i5
	flush	%l7 + 0x24
	movre	%g7,	0x311,	%l3
	mova	%icc,	%i1,	%g1
	fmovrdne	%i3,	%f16,	%f10
	fpmerge	%f30,	%f29,	%f18
	fmovrse	%g2,	%f24,	%f27
	fzero	%f22
	mova	%xcc,	%i2,	%o6
	xnor	%o0,	0x0F73,	%g5
	orncc	%o2,	0x0237,	%o1
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	fmovs	%f5,	%f17
	umul	%o3,	0x064F,	%l6
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	brlz	%i7,	loop_9
	nop 	! 	tsubcc	%g4,	%i6,	%l4 changed by convert2hboot
	fmovsge	%icc,	%f29,	%f7
	bcc,pn	%xcc,	loop_10
loop_9:
	sdivx	%i4,	0x03BA,	%l0
	fbn,a	loop_11
	nop
	set	0x24, %g5
	stb	%l1,	[%l7 + %g5]
loop_10:
	fpsub16	%f8,	%f30,	%f8
	edge8n	%o4,	%o5,	%i0
loop_11:
	xorcc	%l5,	%o7,	%g6
	ldsw	[%l7 + 0x78],	%g3
	edge32l	%i5,	%l2,	%l3
	ba	loop_12
	edge16ln	%g7,	%g1,	%i1
	ble	loop_13
	movleu	%icc,	%g2,	%i3
loop_12:
	lduh	[%l7 + 0x70],	%o6
	fpadd16	%f14,	%f14,	%f10
loop_13:
	fmul8x16	%f17,	%f24,	%f16
	add	%l7,	0x2C,	%l6
 	wr	%g0,	0x19,	%asi
	nop	 ! 	casa	[%l6] 0x19,	%i2,	%o0 ASI use changed by convert2hboot
	bpos,a	%icc,	loop_14
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	movge	%icc,	%g5,	%o2
	movvs	%icc,	%o1,	%o3
loop_14:
	sub	%i7,	0x12FA,	%g4
	fcmpne32	%f26,	%f4,	%l6
	fnegd	%f0,	%f4
	fpadd32	%f4,	%f6,	%f30
	fsrc1	%f22,	%f0
	bcs	loop_15
	fcmpeq32	%f30,	%f0,	%i6
	movne	%xcc,	%i4,	%l0
	set	0x60, %l3
	nop	 ! 	swapa	[%l7 + %l3] 0x89,	%l4 ASI use changed by convert2hboot
loop_15:
	be	%icc,	loop_16
	edge16	%l1,	%o4,	%i0
	set	0x0C, %o0
	nop	 ! 	ldswa	[%l7 + %o0] 0x88,	%l5 ASI use changed by convert2hboot
loop_16:
	fmul8sux16	%f8,	%f8,	%f20
	movpos	%icc,	%o5,	%g6
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
	lduh	[%l7 + 0x32],	%g3
	fbule,pt	%fcc1,	loop_17
	ldstub	[%l7 + 0x25],	%o7
	edge16n	%l2,	%i5,	%l3
	bleu,a	loop_18
loop_17:
	std	%f2,	[%l7 + 0x30]
	membar	#Sync
 	wr	%g0,	0x1e,	%asi
loop_18:
	mova	%icc,	%g7,	%i1
	sdivcc	%g2,	0x0253,	%i3
	orncc	%o6,	0x1D06,	%g1
 	wr	%g0,	0x0c,	%asi
	sllx	%o0,	0x01,	%o2
	nop 	! 	tcc	%xcc,	0x7 changed by convert2hboot
	swap	[%l7 + 0x08],	%g5
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	pdist	%f18,	%f18,	%f20
	fmovdpos	%xcc,	%f29,	%f24
	fpadd16	%f16,	%f10,	%f16
	movcs	%xcc,	%o1,	%o3
	fmovsn	%icc,	%f23,	%f12
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	alignaddrl	%i7,	%l6,	%g4
	add	%l7,	0x68,	%l6
 	wr	%g0,	0x89,	%asi
	st	%f10,	[%l7 + 0x68]
	or	%l0,	%l1,	%l4
	nop
	setx	loop_19,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fand	%f24,	%f12,	%f30
	and	%o4,	0x175B,	%i0
	array16	%o5,	%l5,	%g6
loop_19:
	fmovrse	%o7,	%f7,	%f25
	movcc	%icc,	%l2,	%g3
	addcc	%i5,	0x1A6C,	%g7
	sllx	%l3,	%g2,	%i3
	nop 	! 	taddcc	%i1,	%o6,	%i2 changed by convert2hboot
	bleu,a	loop_20
	fcmpeq32	%f22,	%f16,	%o0
	sdivx	%g1,	0x1D30,	%o2
	fandnot1s	%f31,	%f10,	%f8
loop_20:
	xorcc	%o1,	0x1FCA,	%o3
	movn	%icc,	%i7,	%l6
	edge16	%g4,	%i6,	%g5
	faligndata	%f8,	%f22,	%f4
	fmovsgu	%xcc,	%f31,	%f4
	smul	%i4,	0x155C,	%l0
	movrgz	%l4,	%l1,	%o4
 	wr	%g0,	0x19,	%asi
	movneg	%icc,	%l5,	%g6
	udiv	%o7,	0x093B,	%l2
	movrgez	%o5,	%i5,	%g3
	sub	%g7,	0x1A37,	%l3
	xorcc	%i3,	%g2,	%i1
	array8	%i2,	%o0,	%g1
	fbl,pt	%fcc0,	loop_21
	fmovdle	%icc,	%f30,	%f12
	orncc	%o2,	%o6,	%o3
	movl	%icc,	%i7,	%o1
loop_21:
	mulscc	%g4,	0x0145,	%l6
	move	%icc,	%i6,	%g5
	membar	0x1D
	sethi	0x0E6D,	%l0
	nop 	! 	ta	%icc,	0x2 changed by convert2hboot
	edge16l	%l4,	%l1,	%o4
	smulcc	%i0,	%l5,	%i4
	fmovsgu	%icc,	%f17,	%f1
	bvs,a,pn	%icc,	loop_22
	movl	%icc,	%o7,	%g6
	fsrc2	%f8,	%f20
	andncc	%o5,	%i5,	%l2
loop_22:
	fpadd16	%f16,	%f6,	%f12
	movrgz	%g3,	0x0B5,	%g7
	sll	%i3,	0x14,	%g2
 	wr	%g0,	0x89,	%asi
	sethi	0x1C97,	%i1
	stb	%i2,	[%l7 + 0x7D]
	umul	%o0,	0x0705,	%o2
	fcmped	%fcc0,	%f8,	%f20
	nop 	! 	tsubcctv	%o6,	0x0346,	%o3 changed by convert2hboot
	edge8ln	%g1,	%o1,	%i7
	nop
	set	0x10, %g1
	std	%f30,	[%l7 + %g1]
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	popc	0x010D,	%g4
	edge8	%l6,	%g5,	%l0
	fexpand	%f15,	%f0
	andn	%i6,	%l1,	%o4
	addccc	%i0,	0x1DC1,	%l4
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	fones	%f24
	subc	%i4,	0x04B1,	%l5
	movpos	%xcc,	%g6,	%o5
	movrlz	%o7,	%l2,	%g3
	edge8	%i5,	%g7,	%g2
	xnor	%l3,	0x07E6,	%i3
	stb	%i1,	[%l7 + 0x6C]
	orn	%i2,	%o2,	%o0
	sdivcc	%o6,	0x128F,	%o3
	fmul8x16al	%f1,	%f5,	%f20
	fbge,pt	%fcc2,	loop_23
	fsrc1	%f0,	%f2
	and	%o1,	0x152E,	%i7
	bcs,a	%xcc,	loop_24
loop_23:
	fmovspos	%xcc,	%f18,	%f11
	fnands	%f18,	%f5,	%f20
	be	%icc,	loop_25
loop_24:
	fmovsvs	%xcc,	%f22,	%f17
	or	%g1,	%g4,	%l6
	fbo	%fcc1,	loop_26
loop_25:
	sra	%l0,	0x1F,	%g5
	bcs,a,pn	%icc,	loop_27
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
loop_26:
	edge32l	%l1,	%o4,	%i0
	alignaddr	%l4,	%i6,	%l5
loop_27:
	smulcc	%g6,	%i4,	%o5
	movrne	%o7,	0x34C,	%g3
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
	mulx	%l2,	0x140A,	%i5
	andncc	%g2,	%g7,	%i3
	fandnot1	%f0,	%f26,	%f14
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
	or	%i1,	0x1603,	%i2
	ldsw	[%l7 + 0x44],	%o2
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	bvc,pt	%icc,	loop_28
	and	%o0,	%l3,	%o6
	edge8ln	%o1,	%i7,	%o3
	subccc	%g1,	0x08E6,	%l6
loop_28:
	fsrc1	%f26,	%f18
	lduh	[%l7 + 0x52],	%g4
	bl,a	%icc,	loop_29
	fmovdcs	%icc,	%f15,	%f1
	sra	%l0,	0x0D,	%l1
	fmuld8sux16	%f16,	%f2,	%f28
loop_29:
	smul	%g5,	%o4,	%l4
	umul	%i0,	%i6,	%g6
	edge8	%l5,	%i4,	%o7
	movrlz	%g3,	0x275,	%l2
	smul	%i5,	0x07B7,	%g2
	sdiv	%o5,	0x08D7,	%g7
	brlz	%i3,	loop_30
	fbo	%fcc1,	loop_31
	ldsb	[%l7 + 0x7C],	%i1
	movrne	%i2,	%o0,	%l3
loop_30:
	fmovrsne	%o6,	%f1,	%f14
loop_31:
	edge8l	%o2,	%i7,	%o1
	array8	%o3,	%g1,	%g4
	add	%l7,	0x38,	%l6
 	wr	%g0,	0x04,	%asi
	nop	 ! 	casxa	[%l6] 0x04,	%l0,	%l6 ASI use changed by convert2hboot
	fcmpd	%fcc2,	%f4,	%f28
	array8	%l1,	%o4,	%g5
	set	0x38, %l0
	nop	 ! 	stwa	%l4,	[%l7 + %l0] 0x22 ASI use changed by convert2hboot
	membar	#Sync
	or	%i6,	0x13AA,	%g6
	fbn	%fcc0,	loop_32
	fxor	%f4,	%f10,	%f12
	movn	%icc,	%l5,	%i4
	and	%i0,	0x027E,	%o7
loop_32:
	fmovdne	%icc,	%f23,	%f24
	xorcc	%l2,	%g3,	%i5
	addcc	%g2,	%g7,	%o5
	add	%i3,	0x145A,	%i2
	movrlz	%o0,	%l3,	%i1
	xnorcc	%o2,	%o6,	%o1
	fbul	%fcc0,	loop_33
	movl	%icc,	%o3,	%g1
	edge32n	%g4,	%i7,	%l6
	fmovdg	%xcc,	%f27,	%f20
loop_33:
	sra	%l1,	0x19,	%o4
	mulscc	%l0,	0x04BD,	%l4
	nop 	! 	tsubcctv	%g5,	0x1231,	%i6 changed by convert2hboot
	fmovsleu	%icc,	%f1,	%f17
	array16	%g6,	%l5,	%i4
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	nop 	! 	ta	%xcc,	0x7 changed by convert2hboot
	bvc	loop_34
	udivcc	%i0,	0x0955,	%l2
	edge32ln	%g3,	%o7,	%g2
	sllx	%i5,	%o5,	%g7
loop_34:
	stw	%i3,	[%l7 + 0x68]
	sub	%i2,	%l3,	%i1
	fmovdvs	%xcc,	%f3,	%f29
	fcmped	%fcc3,	%f24,	%f16
	fcmpne32	%f2,	%f6,	%o2
	fbl	%fcc1,	loop_35
	sdivcc	%o6,	0x0DB1,	%o0
	fmovda	%xcc,	%f19,	%f3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35:
	mova	%icc,	%o1,	%o3
	add	%l7,	0x78,	%l6
 	wr	%g0,	0x0c,	%asi
	nop	 ! 	casxa	[%l6] 0x0c,	%g1,	%g4 ASI use changed by convert2hboot
	xor	%i7,	0x178D,	%l6
	edge8	%l1,	%l0,	%l4
	sdivcc	%o4,	0x1C9E,	%g5
	xnorcc	%g6,	0x091E,	%l5
	fmovdne	%xcc,	%f3,	%f12
	movn	%icc,	%i4,	%i6
	bg,a,pn	%icc,	loop_36
	bcc,pt	%xcc,	loop_37
	add	%l2,	%g3,	%o7
	fmovrsgez	%i0,	%f22,	%f20
loop_36:
	or	%i5,	0x0E14,	%o5
loop_37:
	udiv	%g2,	0x1A88,	%g7
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	movne	%xcc,	%i2,	%i3
	fmovda	%xcc,	%f28,	%f31
	edge32l	%l3,	%i1,	%o2
	set	0x51, %g3
	nop	 ! 	ldsba	[%l7 + %g3] 0x80,	%o0 ASI use changed by convert2hboot
	fcmpes	%fcc1,	%f7,	%f13
	movne	%icc,	%o1,	%o6
	ldsh	[%l7 + 0x48],	%g1
	fxnor	%f28,	%f0,	%f28
	fandnot2	%f10,	%f20,	%f4
	srl	%o3,	0x02,	%g4
	srlx	%i7,	0x1F,	%l1
	movg	%xcc,	%l0,	%l4
	movre	%l6,	0x390,	%g5
	smul	%g6,	0x09AC,	%l5
	andcc	%o4,	%i4,	%l2
	brz	%i6,	loop_38
	array32	%o7,	%i0,	%g3
 	wr	%g0,	0x19,	%asi
loop_38:
	swap	[%l7 + 0x68],	%g2
	ldx	[%l7 + 0x30],	%g7
	brlz,a	%i2,	loop_39
	bleu,a	loop_40
	smul	%i3,	%l3,	%i1
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
loop_39:
	fcmple16	%f16,	%f4,	%o5
loop_40:
	for	%f6,	%f20,	%f12
	alignaddr	%o0,	%o2,	%o1
	popc	%o6,	%g1
	brgz	%o3,	loop_41
	popc	0x10D6,	%g4
	fmovsl	%icc,	%f3,	%f29
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
loop_41:
	fmovda	%xcc,	%f26,	%f8
	fpmerge	%f0,	%f21,	%f4
	fmuld8ulx16	%f25,	%f28,	%f18
	fpmerge	%f30,	%f13,	%f6
	fpackfix	%f6,	%f11
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
	edge16ln	%i7,	%l1,	%l4
	membar	0x75
	fbue	%fcc1,	loop_42
	xnor	%l6,	%g5,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g6,	%l5,	%o4
loop_42:
	fzero	%f6
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	edge8	%i4,	%l2,	%o7
	bmask	%i6,	%g3,	%i0
	fnot2	%f6,	%f10
	fmovsge	%icc,	%f25,	%f15
	udiv	%i5,	0x008B,	%g2
	brgz	%i2,	loop_43
	array32	%i3,	%g7,	%l3
	set	0x40, %i2
	nop	 ! 	stda	%f16,	[%l7 + %i2] 0xc2 ASI use changed by convert2hboot
loop_43:
	movre	%o5,	0x245,	%o0
	fbul	loop_44
	sub	%i1,	0x1245,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f4,	%f3,	%f15
loop_44:
	nop 	! 	tcs	%xcc,	0x5 changed by convert2hboot
	edge8n	%o1,	%o6,	%o3
	fnors	%f14,	%f25,	%f14
	movpos	%icc,	%g4,	%g1
	xnorcc	%i7,	0x1C2C,	%l1
	ld	[%l7 + 0x44],	%f11
	bl,a,pn	%xcc,	loop_45
	xor	%l4,	%g5,	%l6
	fbn	loop_46
	movl	%icc,	%g6,	%l0
loop_45:
	array32	%l5,	%i4,	%l2
	fmovsvs	%icc,	%f1,	%f13
loop_46:
	fmovrsne	%o4,	%f2,	%f0
	fmovdleu	%xcc,	%f14,	%f17
	movrlez	%o7,	%i6,	%i0
	movl	%icc,	%g3,	%g2
	or	%i2,	%i5,	%i3
	fones	%f20
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	stb	%l3,	[%l7 + 0x34]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f26,	%f24
	movge	%icc,	%o5,	%o0
	flush	%l7 + 0x7C
	bvc,a,pt	%xcc,	loop_47
	nop 	! 	tle	%xcc,	0x2 changed by convert2hboot
	alignaddrl	%g7,	%i1,	%o2
	fmovsge	%xcc,	%f10,	%f14
loop_47:
	nop
	add	%l7,	0x48,	%l6
 	wr	%g0,	0x04,	%asi
	nop	 ! 	casxa	[%l6] 0x04,	%o6,	%o3 ASI use changed by convert2hboot
 	wr	%g0,	0x10,	%asi
	sllx	%o1,	0x11,	%i7
	movrlz	%l1,	0x15D,	%g1
	edge16	%l4,	%g5,	%g6
	fmuld8sux16	%f16,	%f0,	%f8
	fnot2s	%f29,	%f19
	xor	%l6,	%l5,	%i4
	edge8n	%l2,	%o4,	%o7
	fnegs	%f7,	%f28
	array32	%l0,	%i6,	%g3
	addccc	%g2,	%i2,	%i0
	lduw	[%l7 + 0x10],	%i5
	xorcc	%l3,	0x1534,	%o5
	ble	loop_48
	srax	%o0,	%i3,	%i1
	array16	%g7,	%o2,	%o6
	nop 	! 	tn	%xcc,	0x7 changed by convert2hboot
loop_48:
	ldsb	[%l7 + 0x52],	%o3
	nop 	! 	tcc	%icc,	0x4 changed by convert2hboot
	movcs	%icc,	%o1,	%i7
	edge16ln	%g4,	%l1,	%g1
	udivcc	%l4,	0x1DF2,	%g5
	smulcc	%g6,	%l5,	%l6
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
	fmovs	%f7,	%f10
	array32	%i4,	%o4,	%l2
	bpos,a,pt	%icc,	loop_49
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	edge8ln	%l0,	%i6,	%g3
	nop
	setx loop_50, %l0, %l1
	jmpl %l1, %g2
loop_49:
	fmovdg	%xcc,	%f14,	%f9
	set	0x24, %g7
	nop	 ! 	lduba	[%l7 + %g7] 0x88,	%i2 ASI use changed by convert2hboot
loop_50:
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
	nop 	! 	ta	%xcc,	0x0 changed by convert2hboot
	nop 	! 	taddcctv	%i0,	%o7,	%l3 changed by convert2hboot
	sethi	0x1E69,	%o5
	movl	%icc,	%o0,	%i5
	bleu,a	loop_51
	edge32n	%i1,	%g7,	%o2
	nop 	! 	tvs	%xcc,	0x7 changed by convert2hboot
	movcc	%icc,	%i3,	%o3
loop_51:
	nop
	setx	loop_52,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	membar	0x31
	movl	%xcc,	%o1,	%i7
	orn	%g4,	0x010F,	%l1
loop_52:
	nop
	set	0x08, %g4
	nop	 ! 	lduwa	[%l7 + %g4] 0x81,	%g1 ASI use changed by convert2hboot
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	add	%l7,	0x68,	%l6
 	wr	%g0,	0x88,	%asi
 	wr	%g0,	0x80,	%asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
 	wr	%g0,	0x19,	%asi
	ldd	[%l7 + 0x10],	%f22
	sdivx	%l6,	0x1DDE,	%i4
	ble,a	%xcc,	loop_53
	array32	%o4,	%l2,	%l0
	nop 	! 	tcs	%icc,	0x6 changed by convert2hboot
	fmovsvs	%xcc,	%f20,	%f7
loop_53:
	xnor	%l5,	%g3,	%g2
	nop 	! 	sir	0x1FB3 changed by convert2hboot
	edge32l	%i6,	%i0,	%o7
	smul	%i2,	0x0E66,	%l3
	bvs	%xcc,	loop_54
	srlx	%o0,	%i5,	%o5
	movn	%xcc,	%g7,	%o2
	xnor	%i3,	0x05DB,	%i1
loop_54:
	edge8ln	%o1,	%i7,	%o3
	movcc	%xcc,	%l1,	%g4
	alignaddr	%g1,	%l4,	%o6
	fmovdpos	%icc,	%f6,	%f11
	fpackfix	%f20,	%f17
	fxnors	%f0,	%f5,	%f26
	edge32l	%g5,	%l6,	%i4
	stx	%g6,	[%l7 + 0x78]
	sra	%o4,	0x1C,	%l0
	fors	%f26,	%f10,	%f9
	sll	%l2,	0x0A,	%g3
	fnegs	%f4,	%f9
	mulscc	%g2,	0x1BF4,	%l5
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	addccc	%i6,	%i0,	%o7
	fcmps	%fcc2,	%f23,	%f28
	fmovdgu	%xcc,	%f6,	%f20
 	wr	%g0,	0x0c,	%asi
	sll	%o0,	0x07,	%i2
	nop 	! 	tsubcctv	%i5,	0x004C,	%o5 changed by convert2hboot
	fmovdpos	%xcc,	%f1,	%f15
	sethi	0x0B99,	%g7
	movle	%icc,	%o2,	%i3
	movg	%icc,	%o1,	%i7
	set	0x40, %i6
	nop	 ! 	prefetcha	[%l7 + %i6] 0x89,	 0x2 ASI use changed by convert2hboot
	andcc	%o3,	0x0DA7,	%g4
	fandnot2	%f20,	%f6,	%f8
	stb	%g1,	[%l7 + 0x4F]
	array32	%l4,	%l1,	%o6
	nop 	! 	tpos	%xcc,	0x1 changed by convert2hboot
	srax	%l6,	%i4,	%g5
	smul	%o4,	%g6,	%l0
	nop 	! 	tsubcctv	%l2,	0x09FF,	%g2 changed by convert2hboot
	sra	%l5,	%g3,	%i6
	edge8n	%o7,	%i0,	%o0
	fbug,pt	%fcc1,	loop_55
	andncc	%l3,	%i5,	%i2
	bne	%xcc,	loop_56
	movl	%icc,	%g7,	%o5
loop_55:
	move	%xcc,	%o2,	%o1
	bleu,a,pt	%icc,	loop_57
loop_56:
	movneg	%icc,	%i7,	%i3
	nop 	! 	tg	%xcc,	0x5 changed by convert2hboot
	flush	%l7 + 0x44
loop_57:
	mova	%xcc,	%o3,	%i1
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	xor	%g4,	0x1ACE,	%g1
	fcmped	%fcc0,	%f2,	%f20
	ldsw	[%l7 + 0x48],	%l1
	or	%o6,	0x0579,	%l6
	orn	%i4,	0x08C7,	%g5
	xnor	%o4,	%g6,	%l0
	pdist	%f22,	%f16,	%f28
	fxnor	%f14,	%f16,	%f16
	fandnot2s	%f20,	%f10,	%f1
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%l2
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	fpadd32	%f16,	%f6,	%f0
	smul	%g2,	%l5,	%g3
	movrne	%l4,	%i6,	%i0
	st	%f11,	[%l7 + 0x1C]
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	edge32ln	%o7,	%l3,	%o0
	fcmpne32	%f20,	%f2,	%i5
	fmovdl	%icc,	%f20,	%f11
	movl	%xcc,	%i2,	%g7
	fpadd32	%f4,	%f4,	%f8
	sdivx	%o5,	0x1519,	%o2
	fmuld8ulx16	%f6,	%f26,	%f12
	and	%i7,	0x0E58,	%o1
	xnorcc	%i3,	0x005F,	%o3
	umulcc	%i1,	%g1,	%l1
	nop 	! 	taddcctv	%g4,	%o6,	%l6 changed by convert2hboot
	bcc,a,pn	%xcc,	loop_58
	movge	%xcc,	%i4,	%o4
	array16	%g5,	%l0,	%l2
	sra	%g2,	0x1B,	%g6
loop_58:
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
	movleu	%icc,	%g3,	%l5
 	wr	%g0,	0x0c,	%asi
	fbge,pt	%fcc1,	loop_59
	fmovdgu	%icc,	%f31,	%f17
	lduh	[%l7 + 0x62],	%i0
	fcmpgt32	%f10,	%f6,	%l4
loop_59:
	sll	%l3,	0x07,	%o7
	bleu,a,pn	%icc,	loop_60
	fbule,pn	%fcc2,	loop_61
	ldsb	[%l7 + 0x0D],	%i5
	lduh	[%l7 + 0x14],	%i2
loop_60:
	faligndata	%f6,	%f16,	%f12
loop_61:
	nop
	setx	loop_62,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	brz	%g7,	loop_63
	movneg	%icc,	%o0,	%o2
	fandnot2s	%f26,	%f2,	%f14
loop_62:
	udivx	%i7,	0x0470,	%o5
loop_63:
	nop
	set	0x40, %g2
	nop	 ! 	stda	%f16,	[%l7 + %g2] 0xca ASI use changed by convert2hboot
	fcmps	%fcc1,	%f19,	%f0
	subccc	%o1,	0x1D68,	%i3
	bgu	loop_64
	edge32l	%i1,	%g1,	%o3
	fmovrslez	%l1,	%f11,	%f17
	edge8n	%g4,	%o6,	%l6
loop_64:
	xnor	%i4,	0x151B,	%o4
	nop 	! 	tleu	%icc,	0x6 changed by convert2hboot
	edge16n	%l0,	%g5,	%l2
	xorcc	%g2,	%g6,	%g3
	movrne	%l5,	0x0B5,	%i0
	orncc	%l4,	0x0D01,	%i6
	nop 	! 	tgu	%icc,	0x1 changed by convert2hboot
	movgu	%icc,	%o7,	%l3
	fmovrsgz	%i2,	%f22,	%f28
	edge32n	%g7,	%i5,	%o0
	fsrc2s	%f16,	%f14
	fmovrdne	%o2,	%f8,	%f8
	nop 	! 	tsubcctv	%i7,	0x1113,	%o1 changed by convert2hboot
	fmovspos	%xcc,	%f26,	%f20
	alignaddr	%o5,	%i1,	%g1
	movge	%xcc,	%o3,	%i3
	bshuffle	%f18,	%f18,	%f0
	fmuld8sux16	%f2,	%f22,	%f20
	fbne,a	%fcc3,	loop_65
	udivx	%l1,	0x06DC,	%g4
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	udivcc	%o6,	0x0AC2,	%l6
loop_65:
	umulcc	%i4,	%o4,	%g5
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	fcmps	%fcc2,	%f19,	%f18
	fbue,a,pt	%fcc2,	loop_66
	movne	%xcc,	%l2,	%l0
	sra	%g6,	0x17,	%g3
	bvs	%icc,	loop_67
loop_66:
	fpmerge	%f16,	%f2,	%f20
	ldub	[%l7 + 0x15],	%l5
	edge8	%i0,	%g2,	%l4
loop_67:
	fmovsl	%icc,	%f24,	%f21
	fmovsvs	%icc,	%f24,	%f1
	bvs,a,pn	%xcc,	loop_68
	ldx	[%l7 + 0x20],	%o7
	fbn,a	loop_69
	nop 	! 	sir	0x04A5 changed by convert2hboot
loop_68:
	fones	%f9
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
loop_69:
	movpos	%icc,	%l3,	%i6
	movre	%i2,	0x107,	%i5
	or	%g7,	0x1CE5,	%o0
	movrlz	%i7,	%o1,	%o5
	fmovdg	%xcc,	%f6,	%f2
	mulscc	%o2,	0x1C90,	%g1
	sllx	%o3,	0x1F,	%i3
	fbul,a	%fcc0,	loop_70
	fcmpgt16	%f20,	%f28,	%i1
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70:
	fnor	%f8,	%f14,	%f14
 	wr	%g0,	0xd8,	%asi
	fabsd	%f8,	%f2
	fcmpd	%fcc1,	%f8,	%f6
	edge8	%l1,	%g4,	%l6
	nop 	! 	tle	%xcc,	0x0 changed by convert2hboot
	edge32ln	%i4,	%o6,	%o4
	smul	%g5,	%l2,	%g6
	array32	%g3,	%l0,	%i0
	xor	%l5,	%l4,	%g2
	and	%l3,	0x1726,	%i6
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	fexpand	%f17,	%f14
	movn	%icc,	%i2,	%o7
	mulx	%g7,	%i5,	%i7
	ldub	[%l7 + 0x5C],	%o0
	fbue,pn	%fcc1,	loop_71
	mulx	%o1,	%o5,	%o2
	mulscc	%o3,	%g1,	%i1
	membar	0x3D
loop_71:
	fmovdneg	%xcc,	%f9,	%f26
	edge16l	%i3,	%l1,	%g4
	brnz	%i4,	loop_72
	xnorcc	%o6,	%o4,	%g5
	movle	%xcc,	%l6,	%g6
	fmul8ulx16	%f26,	%f22,	%f26
loop_72:
	fbul,a,pn	%fcc1,	loop_73
	sub	%g3,	0x1CC5,	%l0
	nop 	! 	tcs	%icc,	0x6 changed by convert2hboot
	bpos	loop_74
loop_73:
	ldx	[%l7 + 0x20],	%i0
	addcc	%l5,	%l4,	%l2
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
loop_74:
	umulcc	%l3,	%i6,	%i2
	fsrc2s	%f25,	%f15
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
	or	%o7,	%g7,	%g2
	edge8	%i7,	%o0,	%o1
	ldd	[%l7 + 0x60],	%o4
	edge8	%o2,	%o3,	%i5
	movcc	%xcc,	%g1,	%i3
	orncc	%l1,	%i1,	%i4
	array32	%o6,	%g4,	%g5
	xnorcc	%l6,	%o4,	%g6
	xnorcc	%l0,	0x0A10,	%i0
	xor	%l5,	0x1077,	%g3
	sll	%l4,	%l2,	%i6
	umul	%l3,	%i2,	%g7
	add	%o7,	%i7,	%o0
	brlz	%o1,	loop_75
	movvc	%xcc,	%o5,	%o2
	orn	%o3,	%i5,	%g1
	set	0x18, %o3
	nop	 ! 	stha	%i3,	[%l7 + %o3] 0x0c ASI use changed by convert2hboot
loop_75:
	fbge	loop_76
	sdivcc	%l1,	0x1702,	%g2
	movrgz	%i1,	%o6,	%i4
	nop 	! 	tsubcctv	%g4,	%g5,	%l6 changed by convert2hboot
loop_76:
	xnor	%g6,	%o4,	%i0
	movn	%icc,	%l0,	%l5
	nop 	! 	tcs	%xcc,	0x4 changed by convert2hboot
	fornot1	%f18,	%f20,	%f22
	sll	%g3,	0x08,	%l2
	sth	%l4,	[%l7 + 0x60]
	bvc,pn	%xcc,	loop_77
	fbu,pt	%fcc1,	loop_78
	fcmpes	%fcc3,	%f27,	%f7
	bg,pn	%icc,	loop_79
loop_77:
	movne	%xcc,	%i6,	%i2
loop_78:
	fcmped	%fcc2,	%f20,	%f22
	nop 	! 	tleu	%icc,	0x3 changed by convert2hboot
loop_79:
	fnegd	%f20,	%f12
	fnot2	%f10,	%f14
	set	0x4C, %o4
	nop	 ! 	lduwa	[%l7 + %o4] 0x18,	%g7 ASI use changed by convert2hboot
	nop 	! 	tneg	%icc,	0x3 changed by convert2hboot
	fbn,pt	%fcc2,	loop_80
	fnors	%f4,	%f15,	%f15
	addccc	%o7,	%i7,	%o0
	sethi	0x0358,	%o1
loop_80:
	fbl	%fcc2,	loop_81
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	smulcc	%o5,	0x047D,	%o2
	movrne	%o3,	0x26A,	%i5
loop_81:
	fbn,pn	%fcc0,	loop_82
	xor	%l3,	0x1D94,	%g1
	edge8ln	%l1,	%i3,	%i1
	fmovsne	%xcc,	%f7,	%f20
loop_82:
	movge	%xcc,	%g2,	%i4
	fmovscs	%xcc,	%f2,	%f28
	popc	%o6,	%g4
	subc	%l6,	%g5,	%o4
	sdiv	%i0,	0x12C2,	%g6
	edge16n	%l0,	%l5,	%l2
	be,a	%xcc,	loop_83
	fmovsle	%icc,	%f19,	%f28
	stb	%l4,	[%l7 + 0x48]
	andncc	%i6,	%g3,	%i2
loop_83:
	fcmpne16	%f0,	%f26,	%o7
	edge16ln	%g7,	%i7,	%o0
	lduh	[%l7 + 0x4A],	%o5
	sdivcc	%o2,	0x04F4,	%o1
	fbul	loop_84
	bneg,a,pt	%icc,	loop_85
	move	%icc,	%i5,	%o3
	nop 	! 	taddcctv	%l3,	0x0501,	%g1 changed by convert2hboot
loop_84:
	addcc	%i3,	0x058C,	%l1
loop_85:
	fandnot1s	%f17,	%f12,	%f10
	movrne	%g2,	0x042,	%i1
	add	%l7,	0x08,	%l6
 	wr	%g0,	0x88,	%asi
	nop	 ! 	casxa	[%l6] 0x88,	%i4,	%g4 ASI use changed by convert2hboot
	stx	%o6,	[%l7 + 0x10]
	movgu	%xcc,	%l6,	%g5
	sra	%i0,	%g6,	%o4
	sethi	0x1615,	%l0
	brnz,a	%l2,	loop_86
	stx	%l4,	[%l7 + 0x50]
	edge32l	%i6,	%g3,	%l5
	or	%o7,	0x1BC2,	%i2
loop_86:
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	addcc	%g7,	%i7,	%o5
	fbo,a	loop_87
	movle	%xcc,	%o2,	%o1
	orcc	%i5,	0x19A9,	%o0
	fbo,pn	%fcc2,	loop_88
loop_87:
	movle	%xcc,	%l3,	%g1
	nop 	! 	tge	%icc,	0x0 changed by convert2hboot
	srl	%i3,	%o3,	%g2
loop_88:
	fbn,a	loop_89
	srlx	%l1,	%i1,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
loop_89:
	sub	%g4,	%o6,	%l6
	umul	%i0,	%g6,	%g5
	pdist	%f8,	%f28,	%f4
	subc	%l0,	%l2,	%o4
	andcc	%l4,	0x196E,	%g3
	edge16	%l5,	%i6,	%o7
	fnors	%f21,	%f18,	%f15
	fnands	%f7,	%f7,	%f3
	prefetch	[%l7 + 0x48],	 0x2
	brnz,a	%g7,	loop_90
	bn,a	%xcc,	loop_91
	andn	%i7,	0x0A16,	%i2
	brz	%o5,	loop_92
loop_90:
	mulscc	%o1,	0x16CE,	%o2
loop_91:
	edge32ln	%o0,	%i5,	%l3
	or	%i3,	0x0558,	%o3
loop_92:
	siam	0x3
	fpadd16	%f16,	%f18,	%f22
	udivx	%g2,	0x087A,	%g1
	bpos,a,pn	%icc,	loop_93
	fabsd	%f20,	%f0
	edge32n	%i1,	%l1,	%i4
	bvc,pn	%xcc,	loop_94
loop_93:
	fnot1	%f28,	%f10
	and	%o6,	%l6,	%g4
	edge32l	%g6,	%g5,	%i0
loop_94:
	fnand	%f14,	%f22,	%f24
	movcc	%icc,	%l2,	%l0
	fbule,a,pn	%fcc3,	loop_95
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
	orcc	%o4,	%g3,	%l4
	edge32l	%i6,	%o7,	%g7
loop_95:
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	fcmple16	%f26,	%f4,	%i7
	movrlez	%i2,	0x223,	%l5
	bvs	loop_96
	brgez	%o5,	loop_97
	fpsub32	%f24,	%f22,	%f16
	nop 	! 	te	%icc,	0x0 changed by convert2hboot
loop_96:
	xnor	%o1,	%o0,	%i5
loop_97:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tvc	%xcc,	0x3 changed by convert2hboot
	edge8l	%o2,	%l3,	%o3
	movne	%icc,	%g2,	%g1
 	wr	%g0,	0x89,	%asi
	movvs	%icc,	%l1,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a	%xcc,	loop_98
	fornot1	%f2,	%f6,	%f28
	fpadd32s	%f10,	%f22,	%f20
	add	%i3,	0x03D1,	%l6
loop_98:
	ble,a	loop_99
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	stw	%g4,	[%l7 + 0x38]
	std	%f4,	[%l7 + 0x20]
loop_99:
	bn,a	%xcc,	loop_100
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	fmovrse	%g6,	%f10,	%f2
	sdivx	%g5,	0x178D,	%o6
loop_100:
	nop 	! 	taddcctv	%l2,	0x15CD,	%l0 changed by convert2hboot
	srl	%o4,	0x04,	%i0
	srlx	%l4,	0x02,	%i6
	st	%f2,	[%l7 + 0x64]
	fmuld8ulx16	%f10,	%f18,	%f30
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
 	wr	%g0,	0x89,	%asi
	movgu	%xcc,	%g3,	%g7
	movne	%icc,	%i7,	%i2
	fmovrdlez	%l5,	%f10,	%f20
	udivcc	%o1,	0x10C3,	%o0
	fmovrdlz	%i5,	%f28,	%f20
	movrlez	%o5,	%o2,	%o3
	faligndata	%f22,	%f24,	%f8
	fbu,pn	%fcc1,	loop_101
	nop
	setx	loop_102,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	popc	%l3,	%g1
	movge	%xcc,	%g2,	%i1
loop_101:
	array16	%l1,	%i3,	%l6
loop_102:
	sra	%g4,	0x10,	%i4
	movle	%icc,	%g6,	%o6
	popc	0x0593,	%l2
	fmovdvs	%xcc,	%f7,	%f11
	movg	%icc,	%l0,	%g5
	movrlez	%o4,	0x104,	%l4
	movneg	%xcc,	%i6,	%o7
	sdivcc	%g3,	0x0076,	%i0
	fmul8ulx16	%f16,	%f6,	%f16
	fand	%f26,	%f10,	%f6
	fmovdpos	%xcc,	%f8,	%f13
	subccc	%g7,	%i7,	%l5
	nop 	! 	taddcc	%o1,	0x1924,	%i2 changed by convert2hboot
	smul	%i5,	0x1C80,	%o0
	movvc	%xcc,	%o2,	%o3
	fzero	%f6
	set	0x16, %i7
	nop	 ! 	stha	%l3,	[%l7 + %i7] 0x04 ASI use changed by convert2hboot
	addccc	%g1,	0x1BA9,	%o5
	udiv	%g2,	0x0807,	%i1
	movcc	%xcc,	%i3,	%l1
	nop
	set	0x70, %i4
	ldx	[%l7 + %i4],	%g4
	bvc	%xcc,	loop_103
	fmovdleu	%icc,	%f13,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i4,	%l6,	%o6
loop_103:
	fmul8sux16	%f4,	%f28,	%f0
	add	%l7,	0x18,	%l6
 	wr	%g0,	0x04,	%asi
	movcs	%xcc,	%g5,	%l0
	andn	%l4,	%i6,	%o4
 	wr	%g0,	0x18,	%asi
	bl,a	%xcc,	loop_104
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,pt	%xcc,	loop_105
	fnot2s	%f15,	%f19
loop_104:
	nop 	! 	ta	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
loop_105:
	fpsub32	%f10,	%f20,	%f26
	sllx	%o7,	0x02,	%i0
	sra	%g3,	%g7,	%l5
	sdivx	%i7,	0x1EFE,	%i2
	smulcc	%o1,	0x1673,	%o0
	nop 	! 	ta	%icc,	0x6 changed by convert2hboot
	fpsub16s	%f9,	%f2,	%f31
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	addccc	%i5,	%o2,	%l3
	set	0x4C, %g6
	nop	 ! 	ldsha	[%l7 + %g6] 0x88,	%g1 ASI use changed by convert2hboot
	umul	%o5,	%g2,	%o3
	nop
	setx	loop_106,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
	movpos	%xcc,	%i1,	%i3
	orncc	%l1,	%i4,	%g4
loop_106:
	fmovrdgz	%o6,	%f4,	%f26
	edge32ln	%l2,	%g6,	%l6
	movvs	%xcc,	%g5,	%l0
	ldsw	[%l7 + 0x1C],	%i6
	membar	#Sync
 	wr	%g0,	0x1e,	%asi
	edge8l	%l4,	%o4,	%i0
	mova	%icc,	%g3,	%o7
	fmovdge	%xcc,	%f2,	%f11
	xnor	%l5,	%g7,	%i2
	orcc	%i7,	0x0F9E,	%o1
	mulscc	%i5,	0x1C63,	%o0
	bleu,pt	%xcc,	loop_107
	movg	%icc,	%l3,	%o2
	edge16n	%g1,	%o5,	%g2
	call	loop_108
loop_107:
	brnz,a	%i1,	loop_109
	movcc	%icc,	%i3,	%o3
	sllx	%l1,	%g4,	%i4
loop_108:
	umul	%o6,	0x081F,	%l2
loop_109:
	fmovrsne	%g6,	%f23,	%f4
	popc	0x026C,	%g5
	ldsw	[%l7 + 0x6C],	%l6
	addc	%i6,	0x0411,	%l4
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
 	wr	%g0,	0x81,	%asi
	edge16n	%i0,	%g3,	%o4
	bgu,a,pt	%icc,	loop_110
	fsrc1s	%f19,	%f23
	edge32ln	%l5,	%g7,	%o7
	fsrc1	%f30,	%f30
loop_110:
	movn	%icc,	%i7,	%o1
	fbu,a,pt	%fcc0,	loop_111
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
	ble,a,pt	%icc,	loop_112
loop_111:
	edge8	%i2,	%i5,	%l3
	edge32l	%o2,	%o0,	%o5
	set	0x1C, %l2
	nop	 ! 	ldswa	[%l7 + %l2] 0x88,	%g2 ASI use changed by convert2hboot
loop_112:
	fnegs	%f22,	%f28
	fba	%fcc0,	loop_113
	orncc	%g1,	0x0171,	%i1
	fmovrsne	%i3,	%f29,	%f27
	movvc	%xcc,	%o3,	%l1
loop_113:
	fcmpgt16	%f26,	%f10,	%i4
	edge16	%o6,	%l2,	%g6
	andcc	%g5,	0x114D,	%l6
	popc	0x0E62,	%i6
	or	%g4,	%l4,	%i0
	stw	%g3,	[%l7 + 0x40]
	udivx	%l0,	0x1C29,	%o4
	sdiv	%l5,	0x0C41,	%o7
	subc	%i7,	0x06CD,	%o1
	edge8ln	%g7,	%i5,	%i2
	bl	%xcc,	loop_114
	ld	[%l7 + 0x64],	%f3
	movn	%xcc,	%l3,	%o0
	movre	%o2,	0x0AC,	%o5
loop_114:
	nop 	! 	tle	%xcc,	0x2 changed by convert2hboot
	fornot1s	%f3,	%f4,	%f29
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	smulcc	%g1,	0x0BE7,	%g2
	smulcc	%i3,	%i1,	%o3
	edge8	%l1,	%i4,	%o6
	nop
	setx	loop_115,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	addc	%g6,	%l2,	%g5
	nop 	! 	tle	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tge	%xcc,	0x1 changed by convert2hboot
loop_115:
	movrlez	%l6,	%i6,	%g4
	stw	%i0,	[%l7 + 0x20]
	fmovrdne	%l4,	%f26,	%f10
	fbn,pn	%fcc3,	loop_116
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
	fcmpes	%fcc2,	%f16,	%f25
	movrgez	%l0,	%o4,	%l5
loop_116:
	array32	%o7,	%i7,	%o1
	fornot1s	%f8,	%f16,	%f0
	bl,a	%icc,	loop_117
	sll	%g7,	0x08,	%i5
	brz,a	%g3,	loop_118
	movne	%xcc,	%i2,	%l3
loop_117:
	bmask	%o0,	%o2,	%g1
	srlx	%g2,	%o5,	%i1
loop_118:
	fbl,pt	%fcc0,	loop_119
	edge32	%i3,	%o3,	%l1
	edge8ln	%i4,	%g6,	%o6
	fcmpeq16	%f24,	%f22,	%g5
loop_119:
	sdivcc	%l2,	0x1E39,	%l6
	move	%icc,	%i6,	%i0
	subc	%l4,	%l0,	%o4
	nop 	! 	ta	%icc,	0x7 changed by convert2hboot
	fmuld8sux16	%f31,	%f12,	%f22
	movrne	%l5,	0x192,	%o7
	fbul,pt	%fcc1,	loop_120
	fbl,a,pn	%fcc1,	loop_121
	fmovdl	%xcc,	%f27,	%f28
	edge8n	%i7,	%g4,	%g7
loop_120:
	bl,a,pn	%icc,	loop_122
loop_121:
	fornot2	%f14,	%f28,	%f28
	alignaddrl	%i5,	%o1,	%g3
	xorcc	%l3,	0x0452,	%i2
loop_122:
	nop 	! 	tpos	%icc,	0x4 changed by convert2hboot
	set	0x3C, %o7
	nop	 ! 	ldsba	[%l7 + %o7] 0x0c,	%o2 ASI use changed by convert2hboot
	bcc	loop_123
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl	loop_124
	movrlz	%g1,	0x2E5,	%g2
loop_123:
	addccc	%o0,	%i1,	%i3
	fmovsneg	%icc,	%f7,	%f28
loop_124:
	nop
	membar	#Sync
	set	0x40, %o6
	nop	 ! 	ldda	[%l7 + %o6] 0xf8,	%f16 ASI use changed by convert2hboot
	movn	%xcc,	%o3,	%o5
	srl	%i4,	0x02,	%l1
	sdivcc	%o6,	0x0095,	%g5
	fmovsneg	%xcc,	%f5,	%f21
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
 	wr	%g0,	0x80,	%asi
	movleu	%icc,	%l6,	%i6
	std	%l2,	[%l7 + 0x78]
	fbuge,pt	%fcc2,	loop_125
	ld	[%l7 + 0x6C],	%f26
 	wr	%g0,	0x18,	%asi
loop_125:
	nop
	set	0x40, %o5
	nop	 ! 	ldda	[%l7 + %o5] 0x14,	%f16 ASI use changed by convert2hboot
	movrgez	%l0,	%l4,	%o4
	fmovrdgez	%l5,	%f22,	%f20
	set	0x50, %i3
	nop	 ! 	ldswa	[%l7 + %i3] 0x15,	%i7 ASI use changed by convert2hboot
	fandnot2s	%f7,	%f28,	%f29
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
	bcs,pn	%icc,	loop_126
	umul	%o7,	%g4,	%g7
	movg	%icc,	%o1,	%g3
	movcs	%icc,	%l3,	%i5
loop_126:
	fandnot1	%f2,	%f6,	%f4
	xnorcc	%i2,	0x0BAD,	%g1
	mulscc	%o2,	%o0,	%i1
	fmovda	%xcc,	%f28,	%f5
	and	%i3,	%g2,	%o3
	fnot1s	%f11,	%f22
	ldd	[%l7 + 0x38],	%o4
	nop 	! 	tsubcc	%l1,	0x1741,	%i4 changed by convert2hboot
	movrgz	%o6,	0x125,	%g5
	bvc,a,pt	%icc,	loop_127
	srlx	%l6,	0x1A,	%g6
	mulscc	%i6,	0x0BF4,	%i0
	edge8l	%l2,	%l0,	%l4
loop_127:
	pdist	%f20,	%f20,	%f18
	sdiv	%l5,	0x064B,	%i7
	fnors	%f10,	%f20,	%f5
	be	loop_128
	movne	%icc,	%o7,	%o4
	sdiv	%g7,	0x0D9B,	%o1
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
loop_128:
	bvc,a,pt	%xcc,	loop_129
	movgu	%icc,	%g3,	%l3
	orcc	%g4,	%i5,	%i2
	fpadd16	%f16,	%f4,	%f8
loop_129:
	fmovscs	%icc,	%f18,	%f30
	movge	%icc,	%g1,	%o0
	fcmple32	%f28,	%f12,	%i1
	st	%f5,	[%l7 + 0x20]
	addccc	%i3,	0x1390,	%g2
	flush	%l7 + 0x5C
	fsrc2	%f16,	%f20
	mulx	%o3,	%o2,	%l1
	fmovdne	%icc,	%f24,	%f28
	popc	0x1567,	%i4
	bcc,pn	%icc,	loop_130
	fbn,a	loop_131
	subc	%o5,	0x0C41,	%g5
	sllx	%l6,	0x0F,	%g6
loop_130:
	membar	0x3C
loop_131:
	smul	%i6,	%i0,	%l2
	membar	0x3E
	srax	%l0,	0x01,	%o6
	fnot2s	%f9,	%f21
	fnand	%f4,	%f8,	%f14
	edge32l	%l5,	%i7,	%l4
	movleu	%xcc,	%o7,	%g7
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
	ldub	[%l7 + 0x21],	%o4
	udiv	%o1,	0x0644,	%l3
	fcmpeq16	%f24,	%f16,	%g4
	brgz,a	%g3,	loop_132
	movrgz	%i5,	0x10C,	%g1
	movcs	%icc,	%o0,	%i2
	swap	[%l7 + 0x0C],	%i3
loop_132:
	fbne,a	loop_133
	sdivx	%i1,	0x1936,	%g2
	array8	%o2,	%o3,	%l1
	fbug	%fcc2,	loop_134
loop_133:
	edge16n	%i4,	%g5,	%o5
	umul	%l6,	0x1610,	%i6
	fbug,a,pt	%fcc1,	loop_135
loop_134:
	sdivcc	%g6,	0x0980,	%i0
	nop 	! 	tvs	%icc,	0x5 changed by convert2hboot
	movrlez	%l2,	0x397,	%o6
loop_135:
	subcc	%l0,	0x0590,	%l5
	movrgz	%i7,	%o7,	%g7
	fcmpgt16	%f18,	%f4,	%o4
	fmovdleu	%icc,	%f11,	%f3
	sdiv	%l4,	0x0DBF,	%l3
	subcc	%o1,	0x016C,	%g4
	sdivx	%g3,	0x0803,	%g1
	srl	%i5,	0x0F,	%o0
	orn	%i2,	%i3,	%g2
	edge32l	%o2,	%i1,	%l1
	movcs	%icc,	%o3,	%i4
	edge8n	%g5,	%o5,	%i6
	fzeros	%f28
	edge32n	%l6,	%i0,	%l2
	fmovrdlz	%o6,	%f26,	%f24
	stx	%l0,	[%l7 + 0x68]
	movleu	%xcc,	%l5,	%g6
	fmovdneg	%xcc,	%f1,	%f5
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
	umul	%o7,	0x1324,	%g7
	bvc	loop_136
	fbg,a	%fcc1,	loop_137
	movcs	%xcc,	%i7,	%o4
	fmovsa	%xcc,	%f29,	%f21
loop_136:
	addcc	%l3,	%o1,	%g4
loop_137:
	bgu,a,pn	%xcc,	loop_138
	edge16	%l4,	%g1,	%g3
	sdiv	%o0,	0x1D57,	%i2
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
loop_138:
	fxnor	%f4,	%f30,	%f6
	udivcc	%i3,	0x0846,	%i5
	movrlz	%o2,	%i1,	%l1
	movvc	%xcc,	%g2,	%o3
	nop 	! 	tgu	%xcc,	0x3 changed by convert2hboot
	subcc	%i4,	%g5,	%i6
	srl	%l6,	0x05,	%o5
	fcmple32	%f22,	%f4,	%i0
	nop
	setx	loop_139,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	add	%o6,	%l2,	%l0
	fbuge	%fcc3,	loop_140
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
loop_139:
	sdiv	%l5,	0x16DF,	%o7
	ldx	[%l7 + 0x20],	%g6
loop_140:
	bcs,a,pn	%icc,	loop_141
	subc	%g7,	0x1003,	%o4
	nop 	! 	taddcc	%i7,	0x0BCF,	%o1 changed by convert2hboot
	ldub	[%l7 + 0x3D],	%l3
loop_141:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	taddcctv	%l4,	0x1047,	%g1 changed by convert2hboot
	fpadd32	%f20,	%f30,	%f26
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	array8	%g4,	%o0,	%i2
	fcmped	%fcc0,	%f22,	%f20
	fmul8sux16	%f16,	%f12,	%f24
	fmovrde	%g3,	%f20,	%f22
	edge16	%i5,	%i3,	%i1
	sdivx	%o2,	0x114D,	%g2
	or	%o3,	%i4,	%l1
	addccc	%g5,	%i6,	%l6
 	wr	%g0,	0xf0,	%asi
	membar	#Sync
	ldd	[%l7 + 0x48],	%f16
	smulcc	%i0,	0x07ED,	%o5
	movcc	%xcc,	%l2,	%l0
	fornot2	%f24,	%f0,	%f2
	fnors	%f16,	%f29,	%f3
	bmask	%o6,	%l5,	%g6
	srlx	%o7,	0x06,	%g7
	array8	%o4,	%o1,	%i7
	movcc	%icc,	%l4,	%g1
	fbug,a	%fcc1,	loop_142
	nop 	! 	tsubcctv	%l3,	%o0,	%i2 changed by convert2hboot
	addc	%g4,	%i5,	%g3
	fnand	%f14,	%f18,	%f16
loop_142:
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
	std	%f24,	[%l7 + 0x08]
	alignaddrl	%i3,	%o2,	%i1
	move	%xcc,	%g2,	%o3
	movgu	%icc,	%l1,	%g5
	sll	%i4,	0x05,	%l6
	nop 	! 	tle	%icc,	0x6 changed by convert2hboot
	xor	%i6,	%o5,	%i0
	bshuffle	%f26,	%f16,	%f0
	movrlz	%l0,	0x2CA,	%o6
	fbu,a	%fcc2,	loop_143
	smul	%l2,	%l5,	%o7
	umul	%g6,	%o4,	%o1
	fpackfix	%f22,	%f25
loop_143:
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	movrlez	%g7,	%l4,	%g1
	fmovrslez	%i7,	%f9,	%f22
	movn	%xcc,	%o0,	%i2
	sdivx	%g4,	0x04D8,	%l3
	edge32l	%i5,	%g3,	%o2
	nop 	! 	taddcc	%i3,	%i1,	%g2 changed by convert2hboot
	brlz	%l1,	loop_144
	umulcc	%o3,	%g5,	%i4
	fmovrsgez	%l6,	%f0,	%f22
	ldsw	[%l7 + 0x08],	%o5
loop_144:
	fble,pt	%fcc2,	loop_145
	srax	%i0,	%i6,	%o6
	swap	[%l7 + 0x58],	%l0
	fabsd	%f14,	%f28
loop_145:
	movrgez	%l2,	0x19B,	%o7
	ldd	[%l7 + 0x08],	%f14
	movrgez	%g6,	%l5,	%o1
	bne,a	loop_146
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	edge32ln	%o4,	%g7,	%g1
	or	%i7,	0x0960,	%l4
loop_146:
	edge32ln	%o0,	%g4,	%l3
	movrgz	%i5,	%g3,	%i2
	fbuge,a,pt	%fcc0,	loop_147
	movrlz	%i3,	0x25D,	%i1
	bmask	%o2,	%g2,	%o3
	edge8l	%g5,	%i4,	%l6
loop_147:
	movvs	%xcc,	%o5,	%l1
	fxors	%f23,	%f3,	%f21
	addccc	%i6,	%o6,	%l0
	nop 	! 	tge	%icc,	0x0 changed by convert2hboot
	fnegs	%f6,	%f14
	nop 	! 	tg	%xcc,	0x0 changed by convert2hboot
	sll	%i0,	0x05,	%l2
	sllx	%g6,	%l5,	%o1
	fnot2	%f8,	%f28
	fmovdne	%xcc,	%f23,	%f22
	or	%o7,	%g7,	%o4
	mova	%xcc,	%g1,	%i7
	sdivx	%l4,	0x005F,	%g4
	ble,a	%xcc,	loop_148
	movge	%xcc,	%l3,	%o0
	fcmpes	%fcc2,	%f9,	%f12
	nop 	! 	tl	%xcc,	0x2 changed by convert2hboot
loop_148:
	nop 	! 	tsubcc	%g3,	0x09E1,	%i2 changed by convert2hboot
	fmovdl	%icc,	%f1,	%f23
	brnz,a	%i3,	loop_149
	movge	%icc,	%i1,	%o2
	edge32l	%i5,	%g2,	%o3
	swap	[%l7 + 0x40],	%i4
loop_149:
	nop
	set	0x78, %o1
	nop	 ! 	prefetcha	[%l7 + %o1] 0x0c,	 0x2 ASI use changed by convert2hboot
	or	%o5,	0x069F,	%l1
 	wr	%g0,	0x11,	%asi
	fpsub16s	%f30,	%f16,	%f25
	brlez,a	%l6,	loop_150
	fmovrdgez	%l0,	%f0,	%f24
	move	%icc,	%o6,	%l2
	movg	%xcc,	%g6,	%i0
loop_150:
	alignaddr	%o1,	%o7,	%g7
	movrgez	%o4,	%l5,	%i7
	orcc	%g1,	0x0D0E,	%l4
	fmovdvc	%icc,	%f6,	%f2
	edge32n	%g4,	%l3,	%g3
	fpadd32	%f2,	%f10,	%f30
	fornot2s	%f10,	%f25,	%f7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f30,	%f2
	fpsub32	%f18,	%f8,	%f10
	subccc	%i2,	%o0,	%i1
	movpos	%xcc,	%i3,	%o2
	fmul8x16al	%f3,	%f3,	%f20
	nop 	! 	tvc	%xcc,	0x0 changed by convert2hboot
	addccc	%g2,	0x14CA,	%i5
	movrne	%o3,	%i4,	%g5
	set	0x40, %l6
	nop	 ! 	stda	%f0,	[%l7 + %l6] 0xc8 ASI use changed by convert2hboot
	edge16l	%l1,	%o5,	%l6
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	xnor	%i6,	%o6,	%l2
	fxnor	%f26,	%f6,	%f6
	fmovrdlz	%g6,	%f16,	%f26
	set	0x28, %i0
	nop	 ! 	swapa	[%l7 + %i0] 0x10,	%l0 ASI use changed by convert2hboot
	movge	%icc,	%i0,	%o7
	fmovspos	%icc,	%f13,	%f13
	movrlz	%g7,	%o1,	%o4
	edge32n	%i7,	%l5,	%l4
	set	0x60, %l5
	nop	 ! 	ldda	[%l7 + %l5] 0x19,	%g4 ASI use changed by convert2hboot
	fbuge	loop_151
	flush	%l7 + 0x74
	mulx	%g1,	0x1074,	%l3
	addcc	%g3,	0x1BC1,	%i2
loop_151:
	fmovdleu	%icc,	%f22,	%f25
	movleu	%xcc,	%i1,	%o0
	membar	0x4E
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	fornot1s	%f7,	%f20,	%f19
	brnz	%i3,	loop_152
	smulcc	%o2,	0x1F96,	%i5
	nop 	! 	tvc	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
loop_152:
	fmovdl	%xcc,	%f30,	%f11
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	addcc	%g2,	0x0530,	%i4
	fmovdvs	%xcc,	%f5,	%f8
	std	%g4,	[%l7 + 0x48]
	edge32ln	%l1,	%o5,	%o3
	nop
	setx loop_153, %l0, %l1
	jmpl %l1, %l6
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	movgu	%xcc,	%i6,	%o6
	edge32ln	%l2,	%g6,	%i0
loop_153:
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
	fcmple16	%f10,	%f30,	%l0
	fmovdvs	%icc,	%f1,	%f22
	add	%o7,	0x1C29,	%g7
	fmovdge	%xcc,	%f29,	%f15
	add	%l7,	0x28,	%l6
 	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o1
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu,a,pt	%xcc,	loop_154
	orcc	%l5,	%l4,	%g4
	fors	%f17,	%f29,	%f23
	stx	%o4,	[%l7 + 0x08]
loop_154:
	sth	%g1,	[%l7 + 0x2A]
	move	%xcc,	%g3,	%l3
	fmovrdlz	%i1,	%f30,	%f14
	array32	%o0,	%i3,	%o2
	udivcc	%i2,	0x03F6,	%i5
	fbuge,a,pn	%fcc1,	loop_155
	udivcc	%g2,	0x0CF3,	%g5
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
loop_155:
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
	fmovsle	%icc,	%f5,	%f7
 	wr	%g0,	0x19,	%asi
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
 	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x44] %asi,	%f20
	andncc	%o5,	%l1,	%l6
	xnorcc	%i6,	0x0714,	%o3
	movge	%icc,	%l2,	%o6
	fbge,a	loop_156
	fmovsg	%icc,	%f25,	%f10
	nop 	! 	taddcc	%i0,	0x16A9,	%g6 changed by convert2hboot
	movgu	%xcc,	%o7,	%l0
loop_156:
	mova	%xcc,	%o1,	%i7
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
	fnot1	%f6,	%f14
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
	srlx	%l5,	%g7,	%g4
	brnz	%o4,	loop_157
	fmovrdlez	%l4,	%f8,	%f0
	nop 	! 	taddcctv	%g3,	%l3,	%i1 changed by convert2hboot
	sll	%g1,	0x1A,	%o0
loop_157:
	be,pt	%xcc,	loop_158
	ldstub	[%l7 + 0x6F],	%o2
	fpsub32s	%f24,	%f20,	%f28
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
loop_158:
	nop
	set	0x08, %l1
	nop	 ! 	swapa	[%l7 + %l1] 0x89,	%i3 ASI use changed by convert2hboot
	ldub	[%l7 + 0x72],	%i2
	fbg	%fcc3,	loop_159
	sdiv	%g2,	0x1AA9,	%g5
 	wr	%g0,	0x89,	%asi
loop_159:
	sdivcc	%i4,	0x1513,	%l1
	nop 	! 	tgu	%xcc,	0x6 changed by convert2hboot
	fmovsg	%icc,	%f14,	%f28
	fnors	%f24,	%f8,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble	loop_160
	popc	0x064A,	%o5
	nop 	! 	sir	0x1682 changed by convert2hboot
	ble,pn	%xcc,	loop_161
loop_160:
	fmovdpos	%xcc,	%f1,	%f12
	movne	%xcc,	%i6,	%o3
 	wr	%g0,	0x04,	%asi
loop_161:
	nop
 	wr	%g0,	0x80,	%asi
	edge8n	%o6,	%i0,	%o7
	edge8ln	%l0,	%g6,	%o1
	fmovsle	%icc,	%f29,	%f17
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	nop
	setx	loop_162,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	alignaddrl	%l5,	%i7,	%g7
	addccc	%g4,	%o4,	%g3
	fand	%f6,	%f4,	%f22
loop_162:
	edge32l	%l4,	%i1,	%g1
	lduw	[%l7 + 0x10],	%l3
	fnegd	%f22,	%f16
 	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x14] %asi,	%f26
	movcc	%icc,	%o2,	%o0
	udivx	%i3,	0x0ECD,	%g2
	movcc	%xcc,	%g5,	%i2
	fcmpes	%fcc2,	%f5,	%f6
	fone	%f14
	bmask	%i5,	%i4,	%o5
	and	%l1,	%i6,	%o3
	xnorcc	%l2,	%o6,	%i0
	movgu	%icc,	%l6,	%o7
	sra	%g6,	0x0E,	%l0
	fpsub32	%f8,	%f16,	%f0
	movcs	%xcc,	%o1,	%l5
	call	loop_163
	movcc	%xcc,	%i7,	%g4
	movvs	%icc,	%o4,	%g7
	orcc	%l4,	%i1,	%g1
loop_163:
	nop
	set	0x50, %i5
	stx	%g3,	[%l7 + %i5]
	edge8	%l3,	%o0,	%i3
	array16	%o2,	%g2,	%i2
	brlz,a	%g5,	loop_164
	fmovsneg	%icc,	%f5,	%f18
	nop 	! 	tcc	%icc,	0x4 changed by convert2hboot
	or	%i4,	0x17FB,	%o5
loop_164:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x097A,	%i5
	brgz	%i6,	loop_165
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	mulscc	%l1,	%o3,	%o6
	andn	%l2,	%l6,	%o7
loop_165:
	fzeros	%f30
	movre	%g6,	%l0,	%o1
	xnor	%i0,	%l5,	%g4
	nop 	! 	tsubcc	%i7,	0x1FE9,	%g7 changed by convert2hboot
	udiv	%l4,	0x141B,	%o4
 	wr	%g0,	0x2f,	%asi
	xnorcc	%g1,	%g3,	%o0
	set	0x78, %o2
	nop	 ! 	ldsba	[%l7 + %o2] 0x11,	%l3 ASI use changed by convert2hboot
	subcc	%o2,	%g2,	%i2
	fblg,pn	%fcc1,	loop_166
	xor	%i3,	%g5,	%o5
	udiv	%i5,	0x1155,	%i6
	andcc	%i4,	0x1734,	%o3
loop_166:
	sll	%l1,	%l2,	%o6
	nop 	! 	tpos	%xcc,	0x6 changed by convert2hboot
	nop 	! 	tsubcc	%l6,	0x1C2D,	%o7 changed by convert2hboot
	xor	%l0,	%o1,	%g6
	ble,pn	%icc,	loop_167
	fsrc2s	%f21,	%f9
	swap	[%l7 + 0x28],	%l5
	orn	%i0,	0x14BF,	%i7
loop_167:
	nop 	! 	taddcctv	%g4,	0x00D8,	%g7 changed by convert2hboot
	fmovdge	%icc,	%f1,	%f21
	fbl,pt	%fcc0,	loop_168
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%xcc,	%f24,	%f19
	nop
	setx	loop_169,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_168:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x55],	%o4
	nop 	! 	tsubcctv	%l4,	0x01B6,	%i1 changed by convert2hboot
loop_169:
	fmovrdgz	%g1,	%f0,	%f24
	siam	0x2
	fabss	%f3,	%f14
	fandnot1	%f24,	%f26,	%f8
	nop 	! 	taddcc	%g3,	%o0,	%l3 changed by convert2hboot
	ldub	[%l7 + 0x61],	%o2
	fmovdle	%icc,	%f27,	%f30
	fbge,pn	%fcc0,	loop_170
	sra	%i2,	%g2,	%i3
	ldsw	[%l7 + 0x30],	%o5
	prefetch	[%l7 + 0x0C],	 0x3
loop_170:
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
 	wr	%g0,	0xeb,	%asi
	membar	#Sync
	umulcc	%i5,	%i4,	%o3
	fbge	loop_171
	fmovrsgez	%i6,	%f1,	%f5
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	ble,a	loop_172
loop_171:
	nop 	! 	tg	%icc,	0x1 changed by convert2hboot
	fbue,a,pn	%fcc2,	loop_173
	array32	%l2,	%l1,	%l6
loop_172:
	fmovdvs	%icc,	%f9,	%f22
	xnorcc	%o7,	0x0D26,	%o6
loop_173:
	fbne	%fcc3,	loop_174
	xor	%l0,	0x1871,	%o1
	brlz,a	%l5,	loop_175
	fmovd	%f14,	%f8
loop_174:
	sll	%g6,	%i7,	%g4
	sub	%i0,	0x07A8,	%o4
loop_175:
	fmovsneg	%xcc,	%f7,	%f1
	nop
	setx loop_176, %l0, %l1
	jmpl %l1, %g7
	udiv	%l4,	0x194E,	%i1
	ba,a	loop_177
	array16	%g3,	%o0,	%l3
loop_176:
	fbue,a	loop_178
	movrne	%g1,	%o2,	%i2
loop_177:
	nop
 	wr	%g0,	0x23,	%asi
	membar	#Sync
loop_178:
	xnorcc	%i3,	%g5,	%i5
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
 	wr	%g0,	0x81,	%asi
	bge,a	loop_179
	fpadd32s	%f18,	%f28,	%f24
	ldd	[%l7 + 0x58],	%o2
 	wr	%g0,	0x19,	%asi
loop_179:
	nop
 	wr	%g0,	0x22,	%asi
	membar	#Sync
	xnor	%l1,	0x1DE8,	%i6
	add	%l6,	0x03AF,	%o7
	ldstub	[%l7 + 0x14],	%o6
	fmovdg	%xcc,	%f21,	%f8
	fpadd16s	%f7,	%f0,	%f2
	fbne	%fcc1,	loop_180
	fmovdvc	%icc,	%f27,	%f20
	ldstub	[%l7 + 0x64],	%l0
	nop 	! 	tneg	%icc,	0x5 changed by convert2hboot
loop_180:
	edge8n	%o1,	%l5,	%g6
	fnot2s	%f6,	%f11
	nop 	! 	tleu	%xcc,	0x5 changed by convert2hboot
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
	fnand	%f22,	%f28,	%f4
	ldsb	[%l7 + 0x2A],	%i7
	ldstub	[%l7 + 0x46],	%i0
 	wr	%g0,	0x10,	%asi
	nop 	! 	tne	%xcc,	0x5 changed by convert2hboot
	fcmpeq16	%f18,	%f14,	%g4
	fmovde	%icc,	%f6,	%f6
	fmovdge	%icc,	%f16,	%f23
	fornot2s	%f26,	%f19,	%f7
	stb	%l4,	[%l7 + 0x52]
	fmovd	%f18,	%f20
	fmul8x16au	%f16,	%f21,	%f16
	std	%g6,	[%l7 + 0x20]
	smulcc	%g3,	%i1,	%o0
	fcmpne32	%f30,	%f14,	%g1
	srl	%l3,	0x04,	%i2
	movgu	%xcc,	%o2,	%g2
	smulcc	%i3,	%g5,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o5,	%i4,	%l2
	brnz,a	%o3,	loop_181
	sra	%i6,	0x0C,	%l1
	stb	%o7,	[%l7 + 0x70]
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
loop_181:
	umul	%o6,	0x0666,	%l6
	nop 	! 	sir	0x153E changed by convert2hboot
	set	0x40, %l4
	nop	 ! 	stda	%f16,	[%l7 + %l4] 0xc3 ASI use changed by convert2hboot
 	wr	%g0,	0x89,	%asi
	add	%l7,	0x60,	%l6
 	wr	%g0,	0x89,	%asi
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	add	%l7,	0x18,	%l6
 	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%l5
	nop	 ! 	casa	[%l6] 0x19,	%l5,	%i7 ASI use changed by convert2hboot
	add	%l7,	0x58,	%l6
 	wr	%g0,	0x18,	%asi
	nop	 ! 	casxa	[%l6] 0x18,	%i0,	%g6 ASI use changed by convert2hboot
	bmask	%g4,	%l4,	%o4
	subcc	%g3,	%g7,	%o0
	fornot2	%f0,	%f18,	%f8
	nop 	! 	taddcctv	%g1,	%i1,	%i2 changed by convert2hboot
	brgez	%o2,	loop_182
	add	%l3,	%i3,	%g2
	ldsh	[%l7 + 0x54],	%i5
	sra	%o5,	0x08,	%i4
loop_182:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%g5,	%o3
	movcc	%xcc,	%i6,	%l2
	fornot1	%f10,	%f6,	%f24
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	fbue,a	loop_183
	fcmpes	%fcc3,	%f5,	%f10
	set	0x40, %g5
	nop	 ! 	ldda	[%l7 + %g5] 0xd0,	%f16 ASI use changed by convert2hboot
loop_183:
	sethi	0x02D3,	%l1
	movcs	%xcc,	%o7,	%l6
	array32	%o6,	%o1,	%l0
	set	0x40, %o0
	nop	 ! 	stda	%f0,	[%l7 + %o0] 0x15 ASI use changed by convert2hboot
	sdivcc	%i7,	0x0C0B,	%l5
	movneg	%icc,	%i0,	%g6
	sdiv	%l4,	0x1CC1,	%o4
	fbo,pt	%fcc0,	loop_184
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tvc	%icc,	0x2 changed by convert2hboot
	fmovsa	%icc,	%f12,	%f10
loop_184:
	movcc	%xcc,	%g4,	%g3
	movpos	%icc,	%o0,	%g7
	array16	%g1,	%i2,	%i1
	array16	%o2,	%i3,	%g2
	fcmpeq16	%f2,	%f4,	%l3
	nop 	! 	taddcctv	%o5,	%i4,	%g5 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
	srax	%o3,	0x10,	%i5
	fbug	loop_185
	movrlez	%l2,	0x24D,	%i6
	movpos	%xcc,	%o7,	%l6
	brgez,a	%o6,	loop_186
loop_185:
	fcmpne16	%f12,	%f4,	%o1
	fpsub16s	%f22,	%f22,	%f10
	nop
	set	0x08, %l3
	lduh	[%l7 + %l3],	%l1
loop_186:
	edge8l	%l0,	%l5,	%i0
	smulcc	%i7,	%l4,	%o4
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	flush	%l7 + 0x1C
	edge8	%g6,	%g3,	%o0
	fsrc1	%f30,	%f14
	nop 	! 	tcs	%xcc,	0x3 changed by convert2hboot
	bmask	%g4,	%g7,	%i2
	fpadd16s	%f20,	%f18,	%f17
	prefetch	[%l7 + 0x60],	 0x1
	nop 	! 	tsubcc	%g1,	%i1,	%o2 changed by convert2hboot
	orn	%i3,	%l3,	%g2
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
	fmuld8ulx16	%f12,	%f13,	%f30
	fmovrde	%i4,	%f18,	%f8
	bneg,pt	%xcc,	loop_187
	fbe,a,pn	%fcc1,	loop_188
	fbo,a	%fcc0,	loop_189
	be,a	loop_190
loop_187:
	fmovde	%icc,	%f20,	%f30
loop_188:
	nop
 	wr	%g0,	0x0c,	%asi
loop_189:
	fpadd16s	%f26,	%f15,	%f4
loop_190:
	fnegd	%f10,	%f20
	nop 	! 	taddcc	%o3,	%i5,	%g5 changed by convert2hboot
	add	%i6,	0x0A33,	%o7
	fxor	%f24,	%f12,	%f20
	umul	%l2,	0x1AC5,	%o6
	membar	0x0F
	fbl,a,pn	%fcc0,	loop_191
	fnot1s	%f4,	%f16
	movgu	%xcc,	%o1,	%l1
	fmovdgu	%icc,	%f20,	%f18
loop_191:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%l0,	%f16,	%f24
	movpos	%xcc,	%l6,	%l5
	fzero	%f0
	move	%icc,	%i7,	%i0
	edge16	%l4,	%o4,	%g3
	bn,pn	%xcc,	loop_192
	subcc	%o0,	0x117E,	%g4
	edge8n	%g7,	%g6,	%i2
	fandnot2	%f22,	%f18,	%f14
loop_192:
	movre	%g1,	0x163,	%o2
	ldsw	[%l7 + 0x18],	%i3
	subccc	%l3,	0x1DDB,	%i1
	movleu	%icc,	%i4,	%o5
	movvs	%xcc,	%o3,	%i5
	bg,pn	%xcc,	loop_193
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
	nop 	! 	tsubcc	%g5,	0x1459,	%g2 changed by convert2hboot
	edge16ln	%o7,	%i6,	%l2
loop_193:
	bcs	loop_194
	fbn,a	%fcc2,	loop_195
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
 	wr	%g0,	0x80,	%asi
loop_194:
	edge8l	%o1,	%l1,	%l6
loop_195:
	bg,pn	%xcc,	loop_196
	brgez	%l5,	loop_197
	fand	%f4,	%f2,	%f2
	nop 	! 	taddcctv	%i7,	%i0,	%l4 changed by convert2hboot
loop_196:
	edge8	%o4,	%l0,	%o0
loop_197:
	andncc	%g3,	%g7,	%g6
	subccc	%g4,	%i2,	%o2
	subc	%g1,	%i3,	%l3
	fsrc2s	%f29,	%f6
	stb	%i4,	[%l7 + 0x24]
	fcmple16	%f20,	%f2,	%i1
	nop
	setx loop_198, %l0, %l1
	jmpl %l1, %o5
	nop 	! 	tcc	%icc,	0x4 changed by convert2hboot
	fbug,pn	%fcc2,	loop_199
	xnorcc	%i5,	0x0DD3,	%g5
loop_198:
	movre	%o3,	0x031,	%o7
	movle	%xcc,	%g2,	%l2
loop_199:
	orcc	%o6,	%i6,	%l1
	fmovsvc	%icc,	%f4,	%f26
	edge8n	%o1,	%l6,	%i7
	fbule	%fcc2,	loop_200
	sethi	0x1A08,	%l5
	fxors	%f30,	%f15,	%f2
 	wr	%g0,	0x2b,	%asi
	membar	#Sync
loop_200:
	smulcc	%o4,	%i0,	%l0
	andncc	%o0,	%g3,	%g7
	sub	%g4,	%i2,	%o2
	mulscc	%g1,	0x0CE4,	%i3
	udivx	%g6,	0x0257,	%l3
	srax	%i4,	%i1,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsge	%icc,	%f13,	%f24
	fxnors	%f11,	%f16,	%f4
	movne	%icc,	%o5,	%g5
	fpsub16	%f16,	%f18,	%f0
	fbuge	%fcc3,	loop_201
	lduh	[%l7 + 0x48],	%o3
	edge8n	%g2,	%o7,	%l2
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
loop_201:
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	movrne	%o6,	0x2E1,	%i6
	srax	%l1,	%l6,	%o1
	movle	%xcc,	%i7,	%l4
	movpos	%icc,	%l5,	%i0
	fbue,a	%fcc3,	loop_202
	edge8ln	%l0,	%o4,	%g3
	movcc	%icc,	%o0,	%g7
	edge8	%g4,	%o2,	%g1
loop_202:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i2,	0x0176,	%i3
	orn	%g6,	%l3,	%i1
	fsrc1s	%f15,	%f9
	for	%f30,	%f8,	%f22
	membar	0x18
	ble,a	%xcc,	loop_203
	flush	%l7 + 0x28
	mulscc	%i4,	%i5,	%o5
	sdivx	%o3,	0x06A2,	%g2
loop_203:
	orn	%g5,	0x1799,	%l2
	fpsub16	%f22,	%f10,	%f4
	movrlez	%o7,	%o6,	%l1
	fmovsne	%xcc,	%f4,	%f14
	xorcc	%l6,	0x125E,	%i6
	bneg,a,pn	%icc,	loop_204
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
	fpsub16s	%f15,	%f8,	%f6
	smulcc	%o1,	0x0BB4,	%i7
loop_204:
	nop
 	wr	%g0,	0x80,	%asi
	add	%l4,	0x1FA3,	%l0
	edge8l	%i0,	%g3,	%o4
	sethi	0x1484,	%o0
	fcmpgt16	%f30,	%f28,	%g4
	fmovd	%f24,	%f18
	srlx	%o2,	0x1E,	%g7
	nop 	! 	tcs	%icc,	0x7 changed by convert2hboot
	nop 	! 	taddcctv	%i2,	0x07F2,	%i3 changed by convert2hboot
 	wr	%g0,	0x19,	%asi
 	wr	%g0,	0x04,	%asi
	nop 	! 	tvs	%xcc,	0x0 changed by convert2hboot
	add	%l3,	0x1056,	%g6
 	wr	%g0,	0x0c,	%asi
	edge16ln	%i4,	%i5,	%o3
	edge16ln	%g2,	%o5,	%l2
	fpack16	%f18,	%f29
	mulx	%o7,	%g5,	%o6
	smul	%l6,	%i6,	%o1
	umul	%i7,	%l1,	%l5
	fbne,a,pn	%fcc2,	loop_205
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
	or	%l4,	%i0,	%l0
	movrlz	%g3,	%o4,	%g4
loop_205:
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	fmovdge	%icc,	%f14,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o2,	%g7,	%i2
	fbge,a	loop_206
	xor	%i3,	%o0,	%g1
	move	%xcc,	%g6,	%l3
	fnot2	%f8,	%f28
loop_206:
	movl	%xcc,	%i1,	%i5
	orcc	%o3,	0x14F9,	%g2
	fbo,a,pt	%fcc3,	loop_207
	and	%o5,	0x0F05,	%l2
	fmovdne	%icc,	%f10,	%f1
	fbne	loop_208
loop_207:
	bpos	loop_209
	edge32ln	%o7,	%i4,	%g5
	movge	%xcc,	%o6,	%l6
loop_208:
	movre	%o1,	0x027,	%i6
loop_209:
	fpack16	%f30,	%f13
	fba,a	%fcc3,	loop_210
	edge32l	%i7,	%l1,	%l5
	fcmpne32	%f2,	%f8,	%i0
	edge8	%l4,	%g3,	%l0
loop_210:
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	movge	%icc,	%g4,	%o4
	bgu,pt	%icc,	loop_211
	fbo	%fcc1,	loop_212
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	fexpand	%f27,	%f6
loop_211:
	brgez,a	%g7,	loop_213
loop_212:
	fcmpeq16	%f12,	%f6,	%o2
	add	%i2,	%i3,	%g1
	fmovdleu	%xcc,	%f23,	%f22
loop_213:
	nop
	set	0x48, %g1
	sth	%g6,	[%l7 + %g1]
	nop
	setx	loop_214,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fmovsle	%xcc,	%f30,	%f25
	fmul8ulx16	%f26,	%f24,	%f28
	fmovdneg	%icc,	%f20,	%f17
loop_214:
	nop 	! 	te	%icc,	0x3 changed by convert2hboot
	bpos,a	%xcc,	loop_215
	umul	%o0,	%i1,	%i5
	movpos	%icc,	%o3,	%g2
	fbu,a,pt	%fcc0,	loop_216
loop_215:
	array8	%o5,	%l2,	%l3
	movvc	%xcc,	%o7,	%g5
	array32	%i4,	%l6,	%o6
loop_216:
	movpos	%icc,	%o1,	%i7
	nop 	! 	taddcctv	%i6,	0x10F4,	%l1 changed by convert2hboot
	fmovda	%icc,	%f2,	%f3
	sub	%l5,	0x1256,	%l4
	srlx	%g3,	0x12,	%i0
	edge16ln	%l0,	%g4,	%o4
	movpos	%icc,	%o2,	%i2
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	fmovsl	%xcc,	%f30,	%f19
	nop 	! 	tcs	%icc,	0x4 changed by convert2hboot
	fmovdvs	%icc,	%f9,	%f19
	addcc	%g7,	%i3,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g1,	0x1DF4,	%i1
	ldd	[%l7 + 0x20],	%f16
	edge32ln	%i5,	%o3,	%o0
	fsrc1s	%f22,	%f19
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	movleu	%icc,	%g2,	%o5
	addc	%l2,	%o7,	%g5
	nop
	setx	loop_217,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop 	! 	taddcc	%i4,	0x0CCF,	%l3 changed by convert2hboot
	fabss	%f30,	%f10
	movrgez	%l6,	%o1,	%o6
loop_217:
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
 	wr	%g0,	0x19,	%asi
	nop 	! 	tsubcctv	%l1,	%i6,	%l4 changed by convert2hboot
	orncc	%g3,	0x1919,	%i0
	movvs	%xcc,	%l0,	%l5
	ldd	[%l7 + 0x28],	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f31,	%f24,	%f20
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
	fmuld8ulx16	%f14,	%f13,	%f16
	fexpand	%f18,	%f28
	fbg	%fcc0,	loop_218
	sdiv	%g4,	0x0096,	%o2
	umulcc	%i2,	0x1EF1,	%o4
	nop 	! 	sir	0x01A6 changed by convert2hboot
loop_218:
	subcc	%g7,	0x065C,	%g6
	fblg,pt	%fcc3,	loop_219
	fsrc1s	%f9,	%f15
	edge32l	%i3,	%i1,	%i5
	edge8l	%g1,	%o0,	%o3
loop_219:
	fmovsgu	%icc,	%f22,	%f31
	nop
	setx	loop_220,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fbue,a	loop_221
	movrgez	%g2,	%l2,	%o5
	sdivx	%g5,	0x1AC8,	%i4
loop_220:
	ldsb	[%l7 + 0x63],	%o7
loop_221:
	brnz,a	%l3,	loop_222
	fmovspos	%icc,	%f4,	%f11
	sllx	%l6,	0x13,	%o1
	movrgz	%o6,	%i7,	%l1
loop_222:
	fbule	loop_223
	fmovrslz	%i6,	%f24,	%f31
	add	%l7,	0x30,	%l6
 	wr	%g0,	0x80,	%asi
loop_223:
	fbn,a	loop_224
	fpadd32s	%f10,	%f12,	%f7
	fba,pn	%fcc3,	loop_225
	add	%g3,	0x02DA,	%l5
loop_224:
	fand	%f14,	%f8,	%f24
	brgez,a	%g4,	loop_226
loop_225:
	udivcc	%l0,	0x0CE1,	%o2
	movneg	%xcc,	%o4,	%g7
	udiv	%i2,	0x1DFC,	%i3
loop_226:
	nop 	! 	tvc	%xcc,	0x4 changed by convert2hboot
	sethi	0x078A,	%g6
	movge	%icc,	%i5,	%g1
	fandnot1s	%f13,	%f27,	%f11
	fmovsleu	%xcc,	%f20,	%f28
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	edge8	%i1,	%o3,	%o0
	membar	0x05
 	wr	%g0,	0x81,	%asi
	ldd	[%l7 + 0x58],	%f10
	udiv	%l2,	0x0173,	%o5
	mova	%xcc,	%i4,	%o7
	nop
	setx loop_227, %l0, %l1
	jmpl %l1, %l3
	mova	%xcc,	%l6,	%o1
	addc	%g5,	%i7,	%l1
	fmovdvc	%icc,	%f2,	%f24
loop_227:
	edge8l	%o6,	%i6,	%l4
	sll	%i0,	0x10,	%l5
	fbule,a	%fcc3,	loop_228
	sdivcc	%g4,	0x01B7,	%l0
	fnot1	%f18,	%f4
	orncc	%o2,	0x0CD8,	%g3
loop_228:
	srlx	%o4,	0x1D,	%g7
	fbuge,a,pn	%fcc2,	loop_229
	edge32l	%i3,	%g6,	%i2
	movrne	%g1,	%i1,	%i5
	edge32ln	%o0,	%o3,	%l2
loop_229:
	sra	%o5,	0x1E,	%g2
	bcc,a	%icc,	loop_230
	movrlez	%i4,	0x32A,	%o7
	addcc	%l6,	%l3,	%o1
	set	0x08, %l0
	nop	 ! 	stda	%g4,	[%l7 + %l0] 0x88 ASI use changed by convert2hboot
loop_230:
	movrlez	%l1,	%o6,	%i6
	sdivcc	%l4,	0x1F86,	%i7
	movg	%icc,	%l5,	%i0
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	movrlez	%g4,	%o2,	%g3
	alignaddr	%o4,	%l0,	%i3
	edge8l	%g6,	%g7,	%i2
	srl	%g1,	%i1,	%i5
	nop 	! 	taddcctv	%o3,	0x1FEF,	%o0 changed by convert2hboot
	movle	%xcc,	%l2,	%g2
	fmovdgu	%icc,	%f26,	%f26
	fcmped	%fcc2,	%f10,	%f14
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
	nop 	! 	tvs	%xcc,	0x7 changed by convert2hboot
	addcc	%i4,	0x0820,	%o5
	nop 	! 	tg	%xcc,	0x7 changed by convert2hboot
	fmovsle	%icc,	%f28,	%f26
	membar	0x0F
	fxor	%f0,	%f10,	%f2
	fbug,a,pt	%fcc2,	loop_231
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l6,	%o7
	srlx	%o1,	0x04,	%l3
loop_231:
	movneg	%xcc,	%l1,	%g5
	edge32l	%i6,	%o6,	%i7
	movrne	%l5,	0x10D,	%l4
	andcc	%i0,	%o2,	%g4
	sra	%g3,	0x01,	%l0
	sll	%i3,	%g6,	%g7
	movleu	%icc,	%o4,	%g1
	srlx	%i2,	0x14,	%i1
	orcc	%i5,	%o0,	%l2
	edge16n	%g2,	%o3,	%o5
	std	%f10,	[%l7 + 0x68]
	sub	%l6,	0x1DA7,	%o7
	sth	%i4,	[%l7 + 0x0A]
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	bg,a	%icc,	loop_232
	subcc	%l3,	0x16FA,	%l1
	andn	%o1,	%i6,	%o6
	sll	%i7,	0x19,	%l5
loop_232:
	movcc	%icc,	%g5,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f12
	array8	%o2,	%g4,	%g3
	movcs	%xcc,	%i0,	%i3
	nop 	! 	sir	0x03BF changed by convert2hboot
	srl	%g6,	0x16,	%g7
	movle	%icc,	%l0,	%g1
	fmovrslz	%o4,	%f24,	%f2
	mulscc	%i1,	0x161E,	%i5
	array32	%o0,	%l2,	%g2
	andncc	%i2,	%o3,	%o5
	swap	[%l7 + 0x74],	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,a,pt	%icc,	loop_233
	bge,pn	%xcc,	loop_234
	alignaddr	%l6,	%l3,	%i4
	fmovsn	%xcc,	%f28,	%f7
loop_233:
	sra	%o1,	%l1,	%o6
loop_234:
	lduh	[%l7 + 0x08],	%i6
	fbl,pn	%fcc2,	loop_235
	smulcc	%i7,	0x0090,	%l5
	srl	%l4,	%g5,	%o2
	set	0x3A, %g3
	nop	 ! 	ldsba	[%l7 + %g3] 0x80,	%g4 ASI use changed by convert2hboot
loop_235:
	nop
	set	0x3A, %g7
	lduh	[%l7 + %g7],	%i0
	ldsb	[%l7 + 0x34],	%i3
	sll	%g6,	0x1D,	%g7
	fcmple32	%f2,	%f10,	%g3
	fxnors	%f14,	%f0,	%f12
	movrgez	%l0,	0x16A,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%i1,	%f26,	%f29
	lduh	[%l7 + 0x10],	%i5
	lduw	[%l7 + 0x3C],	%o0
	smul	%l2,	%g2,	%o4
 	wr	%g0,	0x89,	%asi
	xorcc	%o5,	0x0932,	%o3
	movrgz	%l6,	0x0AA,	%o7
	edge32	%l3,	%i4,	%o1
	fnand	%f0,	%f28,	%f18
	sdiv	%o6,	0x08C1,	%l1
	fbu	loop_236
	movcs	%icc,	%i6,	%l5
	sdiv	%i7,	0x1AA3,	%l4
	movgu	%xcc,	%o2,	%g5
loop_236:
	nop 	! 	taddcc	%i0,	0x1B4C,	%i3 changed by convert2hboot
	fmovda	%icc,	%f23,	%f16
	bmask	%g6,	%g7,	%g4
	set	0x2C, %g4
	nop	 ! 	ldswa	[%l7 + %g4] 0x14,	%g3 ASI use changed by convert2hboot
	fnands	%f29,	%f9,	%f31
	nop
	setx	loop_237,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	tle	%xcc,	0x0 changed by convert2hboot
	movpos	%icc,	%g1,	%l0
	set	0x58, %i6
	nop	 ! 	ldxa	[%l7 + %i6] 0x11,	%i5 ASI use changed by convert2hboot
loop_237:
	stw	%o0,	[%l7 + 0x4C]
	movne	%xcc,	%l2,	%g2
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	fcmple32	%f26,	%f28,	%o4
	addccc	%i1,	0x0A52,	%i2
	set	0x2F, %i1
	nop	 ! 	stba	%o3,	[%l7 + %i1] 0x0c ASI use changed by convert2hboot
	movrlz	%o5,	%o7,	%l6
	sethi	0x0311,	%l3
	nop
	set	0x2E, %i2
	lduh	[%l7 + %i2],	%i4
	srax	%o1,	%l1,	%o6
	xor	%i6,	0x080C,	%l5
	nop 	! 	taddcc	%l4,	%o2,	%g5 changed by convert2hboot
 	wr	%g0,	0x11,	%asi
	nop 	! 	taddcc	%i3,	0x0828,	%g6 changed by convert2hboot
	bge,a,pt	%xcc,	loop_238
	nop
	setx	loop_239,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	bpos	%icc,	loop_240
	smulcc	%g7,	0x16EE,	%g4
loop_238:
	sdivcc	%i7,	0x1C39,	%g3
loop_239:
	nop 	! 	tsubcctv	%g1,	%l0,	%o0 changed by convert2hboot
loop_240:
	sdivcc	%l2,	0x1691,	%g2
	fmuld8sux16	%f11,	%f27,	%f16
	umulcc	%o4,	0x05B6,	%i1
	movrne	%i2,	%i5,	%o3
	add	%o5,	%o7,	%l3
	popc	0x09E0,	%l6
	subc	%i4,	%o1,	%l1
	fcmpgt16	%f10,	%f28,	%o6
	nop 	! 	tgu	%xcc,	0x5 changed by convert2hboot
	nop
	set	0x30, %o3
	stx	%i6,	[%l7 + %o3]
	fmovrdlz	%l4,	%f18,	%f24
	alignaddr	%o2,	%l5,	%g5
	fmovsgu	%icc,	%f9,	%f29
	fsrc1	%f24,	%f10
	fpack16	%f12,	%f10
	set	0x41, %g2
	nop	 ! 	ldstuba	[%l7 + %g2] 0x0c,	%i0 ASI use changed by convert2hboot
	udiv	%g6,	0x19E4,	%g7
	edge8l	%i3,	%g4,	%i7
	nop 	! 	taddcctv	%g3,	0x0CB9,	%l0 changed by convert2hboot
	xorcc	%g1,	0x0FE2,	%o0
	srax	%l2,	0x09,	%o4
	fmovdvc	%icc,	%f17,	%f15
	stb	%g2,	[%l7 + 0x2E]
	set	0x08, %o4
	nop	 ! 	stda	%i2,	[%l7 + %o4] 0x11 ASI use changed by convert2hboot
	fmuld8ulx16	%f1,	%f8,	%f8
	nop 	! 	tgu	%xcc,	0x6 changed by convert2hboot
	sdivx	%i1,	0x006E,	%o3
	fmovd	%f8,	%f12
	set	0x60, %i7
	nop	 ! 	ldda	[%l7 + %i7] 0x2a,	%i4 ASI use changed by convert2hboot
	stw	%o7,	[%l7 + 0x7C]
	set	0x52, %g6
	nop	 ! 	lduha	[%l7 + %g6] 0x89,	%l3 ASI use changed by convert2hboot
	edge16	%l6,	%o5,	%i4
	fblg,a	loop_241
	edge16l	%o1,	%o6,	%l1
	udivcc	%l4,	0x1B43,	%i6
	fcmple16	%f6,	%f22,	%l5
loop_241:
	brlz,a	%o2,	loop_242
	sdivx	%g5,	0x012B,	%g6
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
	xor	%g7,	%i3,	%i0
loop_242:
	sethi	0x0CCC,	%g4
	alignaddrl	%i7,	%l0,	%g3
	fmovrdlz	%o0,	%f30,	%f4
	movrlez	%g1,	0x2A4,	%l2
	fandnot1s	%f11,	%f1,	%f29
	fbn	loop_243
	fba,a,pt	%fcc2,	loop_244
	movrne	%g2,	%o4,	%i1
	fones	%f8
loop_243:
	fpsub16s	%f20,	%f14,	%f16
loop_244:
	movvc	%icc,	%o3,	%i2
	nop 	! 	tsubcctv	%i5,	%l3,	%l6 changed by convert2hboot
	popc	%o7,	%o5
	movg	%icc,	%o1,	%o6
	bmask	%i4,	%l4,	%l1
	smulcc	%i6,	%l5,	%o2
	movgu	%xcc,	%g6,	%g7
	set	0x0, %l2
	nop	 ! 	stxa	%i3,	[%g0 + %l2] 0x5f ASI use changed by convert2hboot
	fbne,a	%fcc0,	loop_245
	movneg	%xcc,	%i0,	%g4
	bgu,pn	%xcc,	loop_246
	bn,pt	%icc,	loop_247
loop_245:
	move	%icc,	%g5,	%i7
	subccc	%g3,	0x0012,	%l0
loop_246:
	addccc	%o0,	0x1F31,	%l2
loop_247:
	fandnot1	%f20,	%f8,	%f26
	nop 	! 	sir	0x0169 changed by convert2hboot
	movgu	%icc,	%g1,	%o4
	mulscc	%i1,	0x036E,	%o3
	nop 	! 	tsubcc	%i2,	%g2,	%l3 changed by convert2hboot
	sth	%l6,	[%l7 + 0x66]
	membar	0x46
	subccc	%o7,	%o5,	%i5
	nop 	! 	sir	0x0465 changed by convert2hboot
	fandnot1s	%f6,	%f31,	%f28
	alignaddr	%o1,	%i4,	%o6
	orcc	%l4,	%l1,	%i6
	fmovscc	%xcc,	%f26,	%f23
	fmovsn	%xcc,	%f2,	%f23
	pdist	%f28,	%f18,	%f16
	flush	%l7 + 0x08
	fbule,pn	%fcc1,	loop_248
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x4 changed by convert2hboot
	srax	%l5,	%o2,	%g7
loop_248:
	fbg,a	%fcc2,	loop_249
	xorcc	%i3,	0x0220,	%i0
	orn	%g6,	0x1290,	%g5
 	wr	%g0,	0x11,	%asi
loop_249:
	array32	%g4,	%l0,	%o0
	fmovsvc	%xcc,	%f14,	%f14
	fble	%fcc1,	loop_250
	fandnot1	%f30,	%f28,	%f24
	fnot2	%f24,	%f0
	movvc	%xcc,	%g3,	%l2
loop_250:
	nop
 	wr	%g0,	0xeb,	%asi
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge,a,pt	%fcc0,	loop_251
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	bg,a,pn	%xcc,	loop_252
	edge16ln	%o4,	%i1,	%o3
loop_251:
	movrlz	%i2,	%g2,	%l3
	fmovrdgez	%o7,	%f14,	%f30
loop_252:
	addc	%l6,	%o5,	%i5
	sll	%i4,	%o6,	%l4
	andn	%l1,	0x0E66,	%i6
	fcmple16	%f4,	%f30,	%o1
	edge32ln	%l5,	%g7,	%o2
	swap	[%l7 + 0x58],	%i3
	fmovsvs	%xcc,	%f21,	%f31
	ldsw	[%l7 + 0x08],	%g6
	nop 	! 	tle	%icc,	0x2 changed by convert2hboot
	bcs,a,pt	%xcc,	loop_253
	movrgez	%g5,	0x189,	%i0
	xor	%g4,	%i7,	%o0
	ba	%xcc,	loop_254
loop_253:
	fsrc2s	%f30,	%f23
	movrgz	%g3,	%l2,	%l0
	subccc	%o4,	0x0EFB,	%g1
loop_254:
	nop
 	wr	%g0,	0x89,	%asi
	stw	%o3,	[%l7 + 0x20]
	fmovdcc	%icc,	%f17,	%f16
	edge32ln	%g2,	%i2,	%o7
	nop 	! 	taddcctv	%l3,	%l6,	%i5 changed by convert2hboot
	bg,a,pn	%icc,	loop_255
	fmovdn	%icc,	%f4,	%f12
	fmovsgu	%icc,	%f0,	%f2
	ldd	[%l7 + 0x30],	%f28
loop_255:
	fnot1	%f18,	%f2
	fones	%f15
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	sra	%o5,	%o6,	%i4
	subccc	%l4,	%i6,	%o1
	edge8l	%l1,	%l5,	%g7
	set	0x0B, %o7
	nop	 ! 	stba	%i3,	[%l7 + %o7] 0x89 ASI use changed by convert2hboot
 	wr	%g0,	0x89,	%asi
 	wr	%g0,	0x80,	%asi
	mulscc	%i0,	0x0FD5,	%g4
	xor	%o2,	0x1D51,	%o0
	ldd	[%l7 + 0x48],	%f0
	fmovrdlz	%g3,	%f10,	%f8
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	smul	%l2,	%i7,	%o4
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
	fbul	%fcc3,	loop_256
	subc	%g1,	%l0,	%o3
	fbne,pn	%fcc3,	loop_257
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
loop_256:
	nop
	set	0x14, %o6
	nop	 ! 	swapa	[%l7 + %o6] 0x89,	%g2 ASI use changed by convert2hboot
loop_257:
	fxor	%f8,	%f24,	%f8
	udivcc	%i1,	0x127F,	%o7
	fmovse	%xcc,	%f31,	%f11
	fornot2	%f6,	%f30,	%f8
	nop 	! 	tcc	%xcc,	0x2 changed by convert2hboot
	edge16	%i2,	%l3,	%l6
	fand	%f4,	%f4,	%f16
	fbg,a	loop_258
	mova	%xcc,	%i5,	%o5
	fcmpeq32	%f2,	%f4,	%o6
	sdivx	%l4,	0x0E6B,	%i6
loop_258:
	move	%icc,	%o1,	%i4
	movre	%l1,	%g7,	%l5
	fpadd32	%f6,	%f28,	%f0
	fmul8x16	%f29,	%f8,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i3,	[%l7 + 0x28]
	xor	%g6,	0x0047,	%i0
	movg	%xcc,	%g5,	%o2
	edge16	%g4,	%g3,	%o0
	movne	%icc,	%i7,	%o4
	nop 	! 	sir	0x090E changed by convert2hboot
	mulx	%g1,	0x0843,	%l2
	fmovdvs	%icc,	%f6,	%f1
	sdivx	%o3,	0x073A,	%l0
	subcc	%i1,	0x03E5,	%g2
	movrne	%i2,	0x260,	%o7
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
	udiv	%l6,	0x1CAF,	%i5
	orn	%l3,	0x0FEC,	%o6
	movpos	%icc,	%o5,	%l4
	nop 	! 	taddcc	%o1,	%i6,	%l1 changed by convert2hboot
	fbu,a,pn	%fcc0,	loop_259
	fzero	%f10
	std	%f26,	[%l7 + 0x68]
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
loop_259:
	fbul,a,pt	%fcc2,	loop_260
	nop 	! 	taddcc	%g7,	%i4,	%i3 changed by convert2hboot
	fmovs	%f9,	%f26
	movrlez	%l5,	%i0,	%g5
loop_260:
	bmask	%o2,	%g6,	%g3
	orn	%o0,	0x1432,	%g4
	set	0x50, %i4
	nop	 ! 	stda	%o4,	[%l7 + %i4] 0x23 ASI use changed by convert2hboot
	membar	#Sync
	smulcc	%i7,	%g1,	%l2
	edge32ln	%o3,	%l0,	%g2
	fpadd32	%f12,	%f4,	%f12
	movgu	%icc,	%i2,	%i1
	sdivcc	%o7,	0x00A4,	%i5
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	andn	%l6,	0x128D,	%l3
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
	fmovdvc	%icc,	%f24,	%f14
	edge8ln	%o5,	%o6,	%l4
	fmovsleu	%xcc,	%f15,	%f6
	movne	%icc,	%o1,	%l1
	fmovsgu	%icc,	%f26,	%f27
	edge32ln	%i6,	%i4,	%i3
 	wr	%g0,	0x18,	%asi
	fmul8sux16	%f18,	%f26,	%f10
	fmovsneg	%icc,	%f0,	%f28
	edge8l	%i0,	%g7,	%g5
	nop 	! 	tsubcctv	%g6,	%g3,	%o2 changed by convert2hboot
	membar	0x7D
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
	orn	%g4,	0x0058,	%o4
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	fandnot1s	%f9,	%f21,	%f14
	fmul8x16	%f6,	%f30,	%f24
	fbu,a	%fcc0,	loop_261
	fmovdle	%xcc,	%f0,	%f13
	umul	%i7,	0x1D0A,	%g1
	bcc,a	%icc,	loop_262
loop_261:
	edge32n	%l2,	%o3,	%o0
	fmovdg	%icc,	%f21,	%f30
	srax	%g2,	0x17,	%i2
loop_262:
	nop 	! 	tvc	%xcc,	0x4 changed by convert2hboot
	popc	0x0755,	%l0
	fmovdn	%xcc,	%f15,	%f30
	xnor	%i1,	0x1EE6,	%i5
	fnands	%f26,	%f15,	%f6
	brnz,a	%l6,	loop_263
	movgu	%xcc,	%o7,	%o5
	fcmped	%fcc0,	%f4,	%f18
 	wr	%g0,	0x0c,	%asi
loop_263:
	movcs	%icc,	%l4,	%o6
	lduh	[%l7 + 0x7C],	%o1
	nop 	! 	tcs	%xcc,	0x3 changed by convert2hboot
	sdivcc	%i6,	0x1D1D,	%i4
	addccc	%i3,	0x1FA1,	%l5
	fsrc1	%f2,	%f2
	bg,a	%icc,	loop_264
	nop 	! 	tsubcctv	%i0,	0x01C2,	%l1 changed by convert2hboot
	fmul8x16	%f7,	%f26,	%f0
	set	0x44, %o5
	nop	 ! 	stha	%g5,	[%l7 + %o5] 0x2f ASI use changed by convert2hboot
	membar	#Sync
loop_264:
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
	stb	%g6,	[%l7 + 0x23]
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	faligndata	%f28,	%f20,	%f4
	fandnot1s	%f4,	%f14,	%f27
	fmovsle	%icc,	%f23,	%f14
	udivcc	%g7,	0x117C,	%g3
 	wr	%g0,	0x89,	%asi
	nop
	setx loop_265, %l0, %l1
	jmpl %l1, %g4
	sllx	%o4,	%i7,	%g1
	fbg	%fcc3,	loop_266
	srlx	%l2,	%o3,	%o0
loop_265:
	brlez	%g2,	loop_267
	movrlz	%l0,	0x276,	%i1
loop_266:
	fandnot1	%f16,	%f2,	%f28
	mulscc	%i5,	%l6,	%o7
loop_267:
	fzero	%f12
	for	%f30,	%f6,	%f24
	subc	%i2,	%o5,	%l3
	alignaddrl	%l4,	%o1,	%o6
	popc	0x0413,	%i4
	edge16	%i3,	%l5,	%i6
	edge32ln	%l1,	%g5,	%g6
	xnor	%i0,	0x1D30,	%g7
	xnorcc	%o2,	0x1F51,	%g3
	sdivcc	%g4,	0x0EEF,	%o4
	std	%f28,	[%l7 + 0x30]
	move	%xcc,	%g1,	%i7
	edge32n	%l2,	%o0,	%o3
	subcc	%g2,	0x160F,	%l0
	smulcc	%i5,	%i1,	%l6
	movvs	%icc,	%o7,	%i2
	brgez	%o5,	loop_268
	fmovdneg	%icc,	%f31,	%f17
	edge32l	%l3,	%o1,	%o6
	add	%l4,	%i4,	%l5
loop_268:
	sub	%i6,	%l1,	%i3
	movle	%xcc,	%g5,	%g6
	movrlez	%g7,	0x30B,	%o2
	prefetch	[%l7 + 0x20],	 0x0
	alignaddrl	%i0,	%g3,	%o4
	ldd	[%l7 + 0x48],	%g0
	be,a	%icc,	loop_269
	movvc	%icc,	%i7,	%g4
	nop 	! 	taddcctv	%l2,	%o0,	%g2 changed by convert2hboot
	fmovsleu	%xcc,	%f19,	%f2
loop_269:
	ldd	[%l7 + 0x40],	%f16
	fzero	%f8
	edge16l	%l0,	%o3,	%i1
	movvs	%xcc,	%i5,	%l6
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x7 changed by convert2hboot
	bgu,pt	%icc,	loop_270
	alignaddr	%o7,	%i2,	%o5
	nop 	! 	tsubcctv	%o1,	0x028E,	%o6 changed by convert2hboot
	sll	%l4,	0x0C,	%l3
loop_270:
	movrgz	%i4,	%l5,	%l1
	set	0x24, %o1
	nop	 ! 	ldswa	[%l7 + %o1] 0x14,	%i3 ASI use changed by convert2hboot
	movleu	%icc,	%g5,	%g6
	fmovrdgez	%i6,	%f18,	%f8
	set	0x68, %i3
	nop	 ! 	swapa	[%l7 + %i3] 0x18,	%o2 ASI use changed by convert2hboot
	set	0x80, %i0
	nop	 ! 	ldxa	[%g0 + %i0] 0x58,	%i0 ASI use changed by convert2hboot
	edge16ln	%g3,	%g7,	%o4
	movge	%icc,	%g1,	%g4
	movleu	%icc,	%l2,	%i7
	movge	%xcc,	%o0,	%l0
	mulscc	%o3,	%i1,	%g2
	fpsub32s	%f31,	%f28,	%f0
	fmovsne	%icc,	%f10,	%f10
	movrlez	%l6,	%i5,	%i2
	fornot1	%f4,	%f22,	%f30
	edge8n	%o7,	%o5,	%o6
	fbne,a	%fcc1,	loop_271
	brgz,a	%o1,	loop_272
	orn	%l4,	0x1783,	%i4
	movvc	%icc,	%l5,	%l3
loop_271:
	alignaddrl	%i3,	%l1,	%g6
loop_272:
	fxnor	%f6,	%f14,	%f2
	sra	%i6,	0x17,	%g5
	add	%o2,	0x0531,	%i0
	xorcc	%g7,	0x08C3,	%g3
	bcc	%icc,	loop_273
	edge16ln	%g1,	%g4,	%l2
	mova	%icc,	%o4,	%o0
	ld	[%l7 + 0x7C],	%f1
loop_273:
	sra	%l0,	0x16,	%o3
	set	0x08, %l6
	nop	 ! 	prefetcha	[%l7 + %l6] 0x15,	 0x2 ASI use changed by convert2hboot
	movgu	%xcc,	%g2,	%i1
	fbule,a,pt	%fcc2,	loop_274
	edge32	%i5,	%i2,	%l6
	edge16	%o5,	%o7,	%o6
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
loop_274:
	lduw	[%l7 + 0x10],	%o1
 	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x20] %asi,	%f17
	srl	%l4,	0x1F,	%l5
	movpos	%icc,	%l3,	%i4
	fmovrsgez	%i3,	%f29,	%f22
	subcc	%l1,	0x17AE,	%g6
	fcmpgt32	%f20,	%f24,	%g5
	sub	%o2,	0x0AAC,	%i0
	andcc	%i6,	%g7,	%g3
	movrgez	%g4,	0x2D4,	%l2
	movg	%icc,	%g1,	%o0
	movpos	%xcc,	%o4,	%l0
 	wr	%g0,	0x11,	%asi
	edge32l	%g2,	%i1,	%i5
	andcc	%i2,	0x0F59,	%l6
	set	0x4C, %l5
	nop	 ! 	ldsha	[%l7 + %l5] 0x0c,	%o5 ASI use changed by convert2hboot
	movrgz	%o3,	%o6,	%o1
	fcmpne32	%f10,	%f24,	%l4
	movl	%xcc,	%o7,	%l5
	set	0x48, %l1
	nop	 ! 	stba	%l3,	[%l7 + %l1] 0x80 ASI use changed by convert2hboot
	alignaddrl	%i3,	%l1,	%g6
	movneg	%icc,	%g5,	%i4
	movgu	%xcc,	%o2,	%i0
 	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x44] %asi,	%f5
	nop 	! 	taddcctv	%i6,	0x122A,	%g3 changed by convert2hboot
	nop 	! 	ta	%xcc,	0x2 changed by convert2hboot
	edge16l	%g7,	%l2,	%g4
	fbo	loop_275
	movvs	%xcc,	%g1,	%o0
	edge16l	%o4,	%l0,	%g2
	fmovdne	%icc,	%f21,	%f21
loop_275:
	movrlez	%i1,	0x2E0,	%i5
	orn	%i2,	%i7,	%l6
	fmovdpos	%icc,	%f21,	%f31
	fands	%f5,	%f11,	%f13
	srax	%o3,	%o5,	%o1
	nop
	setx	loop_276,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	brgz	%o6,	loop_277
	array8	%l4,	%l5,	%l3
	subcc	%i3,	%l1,	%o7
loop_276:
	brlez,a	%g6,	loop_278
loop_277:
	fmovdvc	%xcc,	%f7,	%f18
	edge32n	%g5,	%i4,	%i0
	fbu,a	loop_279
loop_278:
	array8	%o2,	%g3,	%g7
	movrne	%l2,	0x299,	%i6
	movvs	%icc,	%g4,	%g1
loop_279:
	fcmpgt16	%f2,	%f0,	%o0
	movleu	%xcc,	%l0,	%o4
	orn	%g2,	%i1,	%i2
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
	alignaddrl	%i7,	%l6,	%o3
	ba,a,pt	%icc,	loop_280
	stb	%o5,	[%l7 + 0x22]
	xor	%i5,	0x068B,	%o6
	fbe,pn	%fcc3,	loop_281
loop_280:
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	add	%o1,	%l5,	%l4
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
loop_281:
	nop 	! 	te	%xcc,	0x4 changed by convert2hboot
 	wr	%g0,	0xeb,	%asi
	membar	#Sync
 	wr	%g0,	0x18,	%asi
	alignaddr	%o7,	%l1,	%g6
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
	srl	%i4,	%i0,	%o2
	edge16l	%g5,	%g3,	%g7
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	nop
	setx	loop_282,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	addc	%i6,	%g4,	%g1
	movcs	%xcc,	%o0,	%l0
	smulcc	%o4,	0x0D07,	%l2
loop_282:
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	xor	%i1,	%i2,	%g2
	edge32	%i7,	%o3,	%l6
	nop 	! 	ta	%icc,	0x2 changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	movl	%icc,	%i5,	%o6
	for	%f26,	%f30,	%f6
	nop 	! 	sir	0x1CCF changed by convert2hboot
	move	%icc,	%o5,	%o1
	edge8n	%l5,	%i3,	%l3
	fmul8ulx16	%f8,	%f6,	%f14
	andncc	%o7,	%l4,	%l1
	nop 	! 	tgu	%xcc,	0x3 changed by convert2hboot
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	xnorcc	%g6,	%i4,	%o2
	fbu,a	%fcc1,	loop_283
	alignaddr	%g5,	%g3,	%i0
 	wr	%g0,	0x0c,	%asi
loop_283:
	srax	%g4,	0x1D,	%g1
	movle	%xcc,	%o0,	%g7
	edge8l	%o4,	%l2,	%i1
	bcs,a,pt	%xcc,	loop_284
	nop
	setx	loop_285,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	movgu	%xcc,	%l0,	%g2
	mova	%icc,	%i7,	%i2
loop_284:
	nop
	setx loop_286, %l0, %l1
	jmpl %l1, %o3
loop_285:
	edge32ln	%i5,	%l6,	%o5
	bvs,a,pt	%xcc,	loop_287
	sub	%o6,	%o1,	%i3
loop_286:
	fandnot1s	%f8,	%f5,	%f15
	nop 	! 	taddcc	%l3,	0x1F40,	%o7 changed by convert2hboot
loop_287:
	bvs,a	loop_288
	nop 	! 	taddcc	%l4,	0x1B38,	%l5 changed by convert2hboot
	udivcc	%g6,	0x0008,	%i4
	nop 	! 	taddcc	%l1,	%o2,	%g3 changed by convert2hboot
loop_288:
	edge16l	%i0,	%g5,	%g4
	nop 	! 	tcc	%xcc,	0x0 changed by convert2hboot
	or	%g1,	%o0,	%g7
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
	movcc	%icc,	%i6,	%l2
	movge	%xcc,	%i1,	%o4
	edge16n	%l0,	%g2,	%i2
	fbul	%fcc2,	loop_289
	mulx	%i7,	0x05A9,	%o3
	stb	%l6,	[%l7 + 0x53]
	movleu	%xcc,	%o5,	%o6
loop_289:
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	movvc	%xcc,	%i5,	%o1
	bcc,a	%xcc,	loop_290
	move	%xcc,	%i3,	%o7
	nop 	! 	sir	0x0CA8 changed by convert2hboot
	fnors	%f12,	%f30,	%f21
loop_290:
	edge8l	%l3,	%l5,	%g6
	fpack32	%f2,	%f16,	%f26
	mulx	%i4,	%l4,	%l1
	fmuld8ulx16	%f22,	%f15,	%f10
	sdiv	%o2,	0x1918,	%g3
	bvs,pn	%xcc,	loop_291
	fbul,pt	%fcc3,	loop_292
	nop
	set	0x44, %i5
	ldsw	[%l7 + %i5],	%i0
	fbo,pt	%fcc2,	loop_293
loop_291:
	orn	%g5,	0x01D1,	%g1
loop_292:
	fmovs	%f9,	%f2
	nop
	setx	loop_294,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_293:
	fabsd	%f30,	%f14
	fbule,a	%fcc0,	loop_295
	stx	%g4,	[%l7 + 0x38]
loop_294:
	fnot2	%f8,	%f16
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
loop_295:
	membar	0x3A
	bcs,a,pt	%xcc,	loop_296
	addc	%g7,	%o0,	%i6
	set	0x31, %o2
	nop	 ! 	ldstuba	[%l7 + %o2] 0x80,	%i1 ASI use changed by convert2hboot
loop_296:
	nop
	set	0x10, %l4
	nop	 ! 	ldda	[%l7 + %l4] 0x81,	%o4 ASI use changed by convert2hboot
	udiv	%l0,	0x055B,	%l2
	edge8n	%i2,	%g2,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x6C],	%i7
	movne	%xcc,	%l6,	%o6
	movle	%icc,	%o5,	%o1
	move	%xcc,	%i5,	%i3
	xorcc	%o7,	0x0230,	%l5
	ld	[%l7 + 0x20],	%f28
	sethi	0x15B0,	%l3
	sub	%i4,	%g6,	%l1
	fmovdn	%xcc,	%f16,	%f6
	alignaddrl	%o2,	%l4,	%i0
	fabss	%f18,	%f11
	stx	%g3,	[%l7 + 0x48]
	orncc	%g5,	%g4,	%g7
	mulscc	%g1,	0x17B4,	%o0
	fbule	loop_297
	movrlez	%i6,	0x039,	%i1
	bne,a	%xcc,	loop_298
	nop 	! 	sir	0x05B6 changed by convert2hboot
loop_297:
	movne	%icc,	%o4,	%l0
	or	%i2,	0x12AD,	%g2
loop_298:
	nop 	! 	tcs	%icc,	0x3 changed by convert2hboot
	sdivx	%o3,	0x1BF7,	%l2
	fmovdcc	%icc,	%f25,	%f24
	mulscc	%i7,	0x1545,	%l6
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	fpadd32	%f24,	%f16,	%f18
	nop 	! 	taddcc	%o5,	%o1,	%i5 changed by convert2hboot
	movpos	%icc,	%o6,	%o7
	fone	%f12
	orncc	%i3,	0x17CF,	%l3
	set	0x12, %g5
	nop	 ! 	lduba	[%l7 + %g5] 0x14,	%i4 ASI use changed by convert2hboot
	fmovsle	%xcc,	%f20,	%f9
	fmul8ulx16	%f28,	%f10,	%f24
	and	%g6,	%l5,	%o2
	movrlz	%l4,	0x1C2,	%i0
	prefetch	[%l7 + 0x60],	 0x0
	bn,pt	%icc,	loop_299
	bn	%icc,	loop_300
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	array16	%l1,	%g5,	%g3
loop_299:
	edge8	%g7,	%g4,	%o0
loop_300:
	nop 	! 	te	%xcc,	0x5 changed by convert2hboot
	fone	%f22
	fmovsg	%xcc,	%f15,	%f8
	array16	%g1,	%i6,	%i1
	fbul	loop_301
	fbule	%fcc1,	loop_302
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l0,	0x1C66,	%i2
loop_301:
	fmovsn	%icc,	%f2,	%f6
loop_302:
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
	movne	%xcc,	%g2,	%o4
	fxor	%f20,	%f4,	%f22
	st	%f31,	[%l7 + 0x74]
	fmovdcc	%xcc,	%f28,	%f31
	movleu	%xcc,	%l2,	%i7
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	movrlez	%l6,	%o3,	%o1
	fmovdge	%xcc,	%f9,	%f23
	bvc,a	%icc,	loop_303
	and	%o5,	%i5,	%o6
	nop 	! 	tpos	%icc,	0x4 changed by convert2hboot
	movn	%xcc,	%i3,	%o7
loop_303:
	fornot2	%f22,	%f26,	%f10
	movrlz	%i4,	0x2F7,	%g6
	movl	%xcc,	%l3,	%o2
	fmul8ulx16	%f14,	%f26,	%f0
	nop 	! 	tcs	%icc,	0x4 changed by convert2hboot
	fmovscc	%icc,	%f17,	%f24
	add	%l5,	0x1FD1,	%i0
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
	fmovdvc	%icc,	%f29,	%f2
	nop 	! 	tsubcc	%l1,	%g5,	%g3 changed by convert2hboot
	fpmerge	%f10,	%f9,	%f18
	fcmps	%fcc1,	%f12,	%f28
	nop 	! 	tcs	%xcc,	0x3 changed by convert2hboot
	ldd	[%l7 + 0x48],	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g7,	%g4,	%l4
	sllx	%g1,	0x08,	%o0
	ldub	[%l7 + 0x1D],	%i6
	fmovsvc	%xcc,	%f22,	%f9
	fmovrse	%i1,	%f20,	%f20
	edge8ln	%i2,	%l0,	%g2
	fmovrdne	%l2,	%f24,	%f26
	fbge,pt	%fcc2,	loop_304
	fpmerge	%f11,	%f17,	%f18
	nop 	! 	taddcc	%i7,	%o4,	%o3 changed by convert2hboot
	fmuld8ulx16	%f27,	%f16,	%f30
loop_304:
	edge8l	%o1,	%o5,	%i5
	fandnot1s	%f4,	%f5,	%f20
	fmovsg	%icc,	%f14,	%f23
	subc	%l6,	0x1588,	%i3
	nop 	! 	tneg	%icc,	0x0 changed by convert2hboot
	fpackfix	%f30,	%f2
	srlx	%o7,	%o6,	%i4
	ba,a,pt	%xcc,	loop_305
	bge,a	%xcc,	loop_306
	edge32n	%l3,	%o2,	%l5
	movge	%xcc,	%i0,	%l1
loop_305:
	fmovrdgez	%g5,	%f4,	%f28
loop_306:
	fmovsvc	%xcc,	%f18,	%f3
	edge8ln	%g3,	%g7,	%g4
	fxnor	%f18,	%f14,	%f0
	andn	%l4,	0x07F3,	%g6
	ble,pt	%icc,	loop_307
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	edge16l	%g1,	%i6,	%o0
	fmovdvc	%xcc,	%f13,	%f19
loop_307:
	fsrc1s	%f13,	%f28
	movne	%xcc,	%i2,	%l0
	fpadd16	%f26,	%f22,	%f16
	sethi	0x1C1E,	%g2
	umulcc	%i1,	%l2,	%o4
	fmovdneg	%xcc,	%f28,	%f23
	fble,a,pt	%fcc2,	loop_308
	fbn	%fcc1,	loop_309
	edge8l	%i7,	%o1,	%o3
	fbn,a	%fcc2,	loop_310
loop_308:
	andn	%o5,	%l6,	%i3
loop_309:
	mova	%xcc,	%i5,	%o7
	set	0x44, %l3
	nop	 ! 	ldstuba	[%l7 + %l3] 0x89,	%o6 ASI use changed by convert2hboot
loop_310:
	fbne,a,pn	%fcc0,	loop_311
	movgu	%icc,	%i4,	%l3
	subc	%o2,	0x0E52,	%i0
	bcs	loop_312
loop_311:
	fmovdgu	%icc,	%f6,	%f13
	fmovsle	%icc,	%f30,	%f6
	fmovdg	%icc,	%f14,	%f2
loop_312:
	movcs	%xcc,	%l5,	%l1
	fcmped	%fcc1,	%f2,	%f28
	movrgz	%g3,	%g5,	%g7
	udivx	%g4,	0x0F64,	%l4
	orcc	%g6,	%g1,	%o0
	edge8ln	%i6,	%l0,	%g2
	fmovscs	%icc,	%f26,	%f14
	ldx	[%l7 + 0x30],	%i1
	fmovdpos	%icc,	%f26,	%f9
	xorcc	%i2,	%o4,	%l2
	brlez,a	%i7,	loop_313
	umul	%o1,	0x12CC,	%o5
	movn	%icc,	%o3,	%i3
	subc	%i5,	0x181B,	%o7
loop_313:
	fpadd16	%f0,	%f30,	%f10
	nop
	setx loop_314, %l0, %l1
	jmpl %l1, %o6
	movrlez	%i4,	%l6,	%o2
	std	%f22,	[%l7 + 0x70]
	array32	%i0,	%l5,	%l1
loop_314:
	fmovdge	%xcc,	%f29,	%f30
	pdist	%f16,	%f24,	%f16
	umulcc	%l3,	%g5,	%g3
	bcs,a	loop_315
	sra	%g7,	%l4,	%g4
	subc	%g1,	0x1093,	%g6
	set	0x58, %g1
	nop	 ! 	stxa	%i6,	[%l7 + %g1] 0x88 ASI use changed by convert2hboot
loop_315:
	ble	%icc,	loop_316
	sdivcc	%l0,	0x1AA1,	%g2
	movl	%icc,	%o0,	%i2
	fmovrdgz	%o4,	%f14,	%f20
loop_316:
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	edge16n	%i1,	%l2,	%i7
	fcmpd	%fcc3,	%f28,	%f26
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
	alignaddr	%o5,	%o3,	%i3
	movg	%icc,	%o1,	%o7
	fbue,pn	%fcc2,	loop_317
	nop 	! 	tvs	%xcc,	0x7 changed by convert2hboot
	umulcc	%o6,	0x179F,	%i5
	bcc	%icc,	loop_318
loop_317:
	movl	%icc,	%l6,	%i4
	orncc	%o2,	%l5,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_318:
	movl	%icc,	%l1,	%g5
	fmovdpos	%icc,	%f28,	%f11
	nop 	! 	tvc	%icc,	0x2 changed by convert2hboot
	xnorcc	%l3,	0x0F59,	%g3
	movrgz	%g7,	0x112,	%g4
	nop 	! 	ta	%icc,	0x2 changed by convert2hboot
	ldsh	[%l7 + 0x7E],	%l4
	fmovrslez	%g6,	%f26,	%f1
	brlz	%g1,	loop_319
	nop 	! 	tge	%icc,	0x3 changed by convert2hboot
	nop 	! 	taddcctv	%i6,	0x0958,	%g2 changed by convert2hboot
	fcmpes	%fcc3,	%f30,	%f6
loop_319:
	edge16n	%o0,	%l0,	%o4
	membar	0x56
	ldsw	[%l7 + 0x3C],	%i2
	udiv	%i1,	0x0649,	%l2
	nop 	! 	tsubcc	%i7,	0x00B8,	%o5 changed by convert2hboot
 	wr	%g0,	0x89,	%asi
 	wr	%g0,	0x19,	%asi
	add	%l7,	0x78,	%l6
 	wr	%g0,	0x80,	%asi
	nop 	! 	ta	%xcc,	0x4 changed by convert2hboot
	brgz	%i5,	loop_320
	bvs,a,pn	%icc,	loop_321
	udivcc	%l6,	0x0CFC,	%i3
	bcc,pn	%icc,	loop_322
loop_320:
	udiv	%o2,	0x1436,	%i4
loop_321:
	fmovsleu	%xcc,	%f30,	%f11
	fmovrsgez	%l5,	%f7,	%f12
loop_322:
	nop
	add	%l7,	0x08,	%l6
 	wr	%g0,	0x18,	%asi
	nop	 ! 	casxa	[%l6] 0x18,	%i0,	%l1 ASI use changed by convert2hboot
	movrlz	%l3,	%g5,	%g3
	fmuld8sux16	%f1,	%f31,	%f12
	addcc	%g4,	%l4,	%g6
	fexpand	%f15,	%f12
	add	%g7,	0x154D,	%g1
	xnorcc	%g2,	%o0,	%l0
	movne	%icc,	%i6,	%i2
	ldsw	[%l7 + 0x38],	%i1
	alignaddr	%o4,	%l2,	%i7
	set	0x54, %l0
	sta	%f14,	[%l7 + %l0] 0x10
	lduw	[%l7 + 0x0C],	%o3
	andn	%o5,	0x1466,	%o7
	fmovde	%xcc,	%f27,	%f8
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
	andncc	%o1,	%i5,	%o6
	edge8ln	%i3,	%o2,	%i4
	subcc	%l5,	0x176C,	%i0
	srax	%l6,	%l1,	%g5
	fmovrdlez	%l3,	%f18,	%f0
	bge,a	loop_323
	fandnot2s	%f4,	%f6,	%f11
	for	%f28,	%f20,	%f0
	andncc	%g3,	%l4,	%g6
loop_323:
	nop
	setx loop_324, %l0, %l1
	jmpl %l1, %g4
	fcmpne32	%f22,	%f14,	%g7
	ldd	[%l7 + 0x28],	%g0
	fbug,pt	%fcc1,	loop_325
loop_324:
	fcmpne16	%f10,	%f20,	%o0
	edge32ln	%g2,	%l0,	%i2
	ldstub	[%l7 + 0x61],	%i6
loop_325:
	fbl,a,pn	%fcc1,	loop_326
	fsrc1	%f26,	%f20
	array8	%o4,	%i1,	%l2
	sdiv	%i7,	0x0739,	%o5
loop_326:
	srlx	%o7,	%o3,	%o1
	addcc	%o6,	0x0588,	%i3
	edge16l	%o2,	%i4,	%l5
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
	movrne	%i0,	0x236,	%i5
 	wr	%g0,	0x2a,	%asi
	membar	#Sync
	brlz,a	%l6,	loop_327
	orcc	%l3,	0x01D0,	%g5
	fblg,a,pn	%fcc2,	loop_328
	udiv	%l4,	0x120D,	%g3
loop_327:
	popc	%g4,	%g7
	nop
	setx	loop_329,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_328:
	ldsb	[%l7 + 0x2C],	%g1
	set	0x10, %g3
	nop	 ! 	prefetcha	[%l7 + %g3] 0x19,	 0x3 ASI use changed by convert2hboot
loop_329:
	movvc	%xcc,	%o0,	%g2
	srlx	%i2,	0x1D,	%i6
	fnot2s	%f7,	%f20
	alignaddr	%l0,	%i1,	%o4
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	fmul8ulx16	%f20,	%f8,	%f12
	sdivcc	%i7,	0x11EF,	%l2
	set	0x55, %o0
	nop	 ! 	ldstuba	[%l7 + %o0] 0x19,	%o5 ASI use changed by convert2hboot
	be	%xcc,	loop_330
	edge8n	%o3,	%o1,	%o7
	addc	%o6,	%o2,	%i3
loop_330:
	brlez,a	%i4,	loop_331
	umulcc	%l5,	%i0,	%l1
	nop
	setx	loop_332,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	smul	%l6,	%i5,	%g5
loop_331:
	fbule,a,pn	%fcc1,	loop_333
	or	%l4,	0x1F96,	%g3
loop_332:
	for	%f26,	%f6,	%f30
	edge16l	%l3,	%g4,	%g1
loop_333:
	fzeros	%f30
	fble,a	%fcc1,	loop_334
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
	fmovrslez	%g7,	%f1,	%f12
	bl	loop_335
loop_334:
	movrgez	%o0,	0x1E6,	%g2
	edge16ln	%i2,	%i6,	%l0
	subccc	%g6,	0x0E9B,	%i1
loop_335:
	fnot2s	%f15,	%f25
	fnegs	%f12,	%f9
	fbule	%fcc1,	loop_336
	edge32n	%i7,	%o4,	%l2
	edge8ln	%o3,	%o5,	%o7
loop_336:
	fbn,a,pt	%fcc2,	loop_337
	nop 	! 	tvc	%xcc,	0x0 changed by convert2hboot
	udivcc	%o6,	0x01AF,	%o2
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
loop_337:
	lduw	[%l7 + 0x34],	%i3
	andcc	%i4,	%o1,	%l5
	fmovrse	%l1,	%f11,	%f25
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
	prefetch	[%l7 + 0x54],	 0x0
	array8	%i0,	%l6,	%g5
	bne,a,pn	%icc,	loop_338
	edge16n	%i5,	%g3,	%l3
	xnor	%l4,	0x00CA,	%g4
 	wr	%g0,	0x2b,	%asi
	membar	#Sync
loop_338:
	sll	%g7,	0x1A,	%o0
	std	%i2,	[%l7 + 0x78]
	set	0x60, %g4
	nop	 ! 	ldda	[%l7 + %g4] 0x2b,	%i6 ASI use changed by convert2hboot
	bge	loop_339
	edge32l	%g2,	%l0,	%i1
 	wr	%g0,	0x04,	%asi
loop_339:
	nop 	! 	ta	%xcc,	0x4 changed by convert2hboot
	fzeros	%f15
	brnz	%o4,	loop_340
	subcc	%g6,	0x1D0E,	%o3
	edge8	%l2,	%o7,	%o5
	orcc	%o6,	0x1543,	%o2
loop_340:
	alignaddrl	%i4,	%o1,	%i3
	nop 	! 	tsubcc	%l5,	%l1,	%i0 changed by convert2hboot
	andncc	%l6,	%i5,	%g5
	set	0x50, %g7
	nop	 ! 	stwa	%l3,	[%l7 + %g7] 0x18 ASI use changed by convert2hboot
	edge32n	%l4,	%g3,	%g1
	set	0x40, %i1
	nop	 ! 	ldda	[%l7 + %i1] 0x80,	%f0 ASI use changed by convert2hboot
	sdiv	%g7,	0x051C,	%o0
	edge32l	%i2,	%g4,	%g2
	nop 	! 	tvc	%icc,	0x5 changed by convert2hboot
	bvs,a,pn	%icc,	loop_341
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	edge16n	%l0,	%i1,	%i7
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
loop_341:
	edge32l	%i6,	%o4,	%o3
	edge32l	%l2,	%o7,	%o5
	fmul8x16	%f1,	%f0,	%f18
	brgz,a	%o6,	loop_342
	swap	[%l7 + 0x3C],	%g6
	fmovdgu	%xcc,	%f27,	%f7
	fbuge,a,pn	%fcc3,	loop_343
loop_342:
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
	fxnors	%f28,	%f27,	%f3
	movge	%icc,	%i4,	%o1
loop_343:
	bneg,a,pn	%icc,	loop_344
	movcs	%xcc,	%i3,	%o2
	brlez	%l5,	loop_345
	movg	%xcc,	%i0,	%l1
loop_344:
	udivx	%i5,	0x12B4,	%l6
	bmask	%l3,	%l4,	%g5
loop_345:
	nop
	set	0x08, %i2
	nop	 ! 	prefetcha	[%l7 + %i2] 0x0c,	 0x3 ASI use changed by convert2hboot
	brnz,a	%g1,	loop_346
	edge32l	%g7,	%o0,	%g4
	array32	%i2,	%l0,	%i1
 	wr	%g0,	0x52,	%asi
loop_346:
	bpos,a,pn	%xcc,	loop_347
	nop 	! 	taddcc	%i6,	0x106D,	%g2 changed by convert2hboot
	sdivcc	%o3,	0x0026,	%o4
	addc	%o7,	%l2,	%o6
loop_347:
	movcc	%xcc,	%g6,	%i4
	fandnot1	%f26,	%f8,	%f0
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	ldsh	[%l7 + 0x78],	%o5
	brgez	%i3,	loop_348
	movrlz	%o1,	0x397,	%o2
	movg	%icc,	%l5,	%i0
	edge8n	%i5,	%l6,	%l1
loop_348:
	andncc	%l4,	%l3,	%g5
	fone	%f0
	fpsub32	%f2,	%f8,	%f20
	fbule,a,pt	%fcc3,	loop_349
	sub	%g3,	%g1,	%o0
	movg	%icc,	%g7,	%i2
	movneg	%xcc,	%l0,	%g4
loop_349:
	xorcc	%i1,	0x1D15,	%i6
	nop 	! 	tge	%icc,	0x4 changed by convert2hboot
	fmovscc	%xcc,	%f18,	%f10
	set	0x58, %o3
	nop	 ! 	ldswa	[%l7 + %o3] 0x0c,	%g2 ASI use changed by convert2hboot
	orncc	%i7,	0x1D47,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%o4,	%f12,	%f6
	fabss	%f20,	%f30
	movne	%icc,	%l2,	%o7
	nop 	! 	taddcc	%g6,	%i4,	%o5 changed by convert2hboot
	movcc	%icc,	%i3,	%o1
	fmul8sux16	%f28,	%f26,	%f14
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
 	wr	%g0,	0x18,	%asi
	movvs	%xcc,	%o2,	%l5
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	movl	%xcc,	%i0,	%l6
	nop 	! 	sir	0x0D09 changed by convert2hboot
	movleu	%xcc,	%l1,	%i5
	nop 	! 	tpos	%xcc,	0x6 changed by convert2hboot
	movvs	%icc,	%l4,	%l3
	subccc	%g5,	0x1F7B,	%g1
	movrgez	%o0,	0x36A,	%g7
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	fmovrde	%g3,	%f30,	%f20
	srlx	%l0,	%i2,	%g4
	udivcc	%i6,	0x075A,	%g2
	fnot1	%f20,	%f24
	nop
	setx	loop_350,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fmovsn	%icc,	%f16,	%f15
	fxnor	%f24,	%f16,	%f2
	umulcc	%i7,	0x06FA,	%i1
loop_350:
	nop
	set	0x24, %g2
	sta	%f14,	[%l7 + %g2] 0x10
	addcc	%o3,	0x1775,	%l2
	fexpand	%f21,	%f4
	move	%xcc,	%o4,	%g6
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	movn	%icc,	%i4,	%o7
	stw	%o5,	[%l7 + 0x40]
	mulscc	%i3,	0x15D8,	%o6
	sllx	%o2,	0x17,	%o1
	set	0x58, %i6
	nop	 ! 	stda	%l4,	[%l7 + %i6] 0xe2 ASI use changed by convert2hboot
	membar	#Sync
	move	%icc,	%l6,	%i0
	fabsd	%f8,	%f0
	movcs	%xcc,	%l1,	%i5
	fones	%f7
	fmovsa	%xcc,	%f5,	%f18
	nop 	! 	tsubcctv	%l4,	%l3,	%g5 changed by convert2hboot
	fnors	%f8,	%f6,	%f4
	edge16l	%g1,	%o0,	%g3
	fmovse	%xcc,	%f14,	%f16
	orn	%l0,	0x0C7D,	%i2
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
	edge32ln	%g7,	%g4,	%g2
	fmovdpos	%xcc,	%f12,	%f25
	sdiv	%i6,	0x158B,	%i1
	movge	%xcc,	%i7,	%o3
	movvc	%xcc,	%o4,	%l2
	udiv	%i4,	0x04D7,	%g6
	nop 	! 	sir	0x0157 changed by convert2hboot
	movg	%icc,	%o7,	%o5
	fpack16	%f10,	%f14
	edge8n	%o6,	%i3,	%o1
	fcmpgt16	%f0,	%f12,	%l5
	edge32l	%l6,	%i0,	%l1
	set	0x14, %i7
	nop	 ! 	lduwa	[%l7 + %i7] 0x81,	%o2 ASI use changed by convert2hboot
	movne	%xcc,	%i5,	%l4
	fpadd16	%f26,	%f28,	%f26
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 313
!	Type cti   	: 350
!	Type x   	: 146
!	Type f   	: 550
!	Type i   	: 1641
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x467CF4A5
.word 0x456AE15F
.word 0x474BB986
.word 0x53747440
.word 0xED0096F2
.word 0x2CE637F7
.word 0x9BD9A7C0
.word 0xBE2AA72A
.word 0x088C53DD
.word 0x5012143F
.word 0x116EC5CD
.word 0x5595B55F
.word 0x55B9948C
.word 0x1EE5170D
.word 0xA3EEBF72
.word 0x3F747FA9
.word 0xF1938074
.word 0x6BAE278F
.word 0xAF8A4B40
.word 0x80D2A6EE
.word 0x764D38CB
.word 0xA5E6CDC6
.word 0x4E02661E
.word 0xBD4F1F72
.word 0x9041403A
.word 0x5EB60B2F
.word 0x0C2C17E5
.word 0xB9E47075
.word 0x8C330220
.word 0x0D154BA9
.word 0x6DCC6086
.word 0x90164DEE
.word 0xB50143E5
.word 0x14215C04
.word 0xE3DBB86F
.word 0x0D0B3AF8
.word 0x8AC0CE2D
.word 0xC29F7644
.word 0x51A97264
.word 0x9583F216
.word 0x5FF93848
.word 0x6FE0F1E7
.word 0xE9B13480
.word 0x9383A344
.word 0x6A4F0122
.word 0x7F4B80D8
.word 0x4BF1ED67
.word 0x7A02202E
.word 0xF996253F
.word 0x1A811540
.word 0x472340A6
.word 0xA598EE44
.word 0x3A216234
.word 0xF0F78871
.word 0x2536D2F3
.word 0x33A451AD
.word 0x84FF25B1
.word 0x84B64D72
.word 0xDAC47452
.word 0x83ADCAA8
.word 0xE925A8BE
.word 0x2E0D4262
.word 0xFB238555
.word 0xB52E8698
.end
