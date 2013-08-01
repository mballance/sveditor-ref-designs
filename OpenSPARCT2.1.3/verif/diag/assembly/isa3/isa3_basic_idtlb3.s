/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic_idtlb3.s
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
		
! allow all traps
#define SKIP_TRAPCHECK
! don't ignore Illegal_instruction trap! 
#define MY_GENERIC_TRAP \
    nop; \
    ta T_BAD_TRAP; \
    nop; \
    nop; \
    nop; \
    nop; \
    nop; \
    nop;
#define  H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 MY_GENERIC_TRAP
#define  H_HT1_Illegal_instruction_0x10
#define My_HT1_Illegal_instruction_0x10 MY_GENERIC_TRAP
#define  H_T0_Illegal_instruction_0x10
#define My_T0_Illegal_instruction_0x10 MY_GENERIC_TRAP
#define  H_T1_Illegal_instruction_0x10
#define My_T1_Illegal_instruction_0x10 MY_GENERIC_TRAP

    
#define MAIN_PAGE_VA_IS_RA_ALSO
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
    

! large page size to try and prevent TTE overlaps/VA collision
#define MAIN_PAGE_USE_CONFIG 1
! #define PART0_Z_PAGE_SIZE_0 1
#define PART0_NZ_PAGE_SIZE_0 0
! #define PART0_Z_TSB_SIZE_0 2
#define PART0_NZ_TSB_SIZE_0 1
    
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

	alignaddrl	%g7,	%i2,	%l1
	fmovs	%f28,	%f14
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	popc	%g5,	%g1
	andncc	%i4,	%l6,	%o1
	movpos	%xcc,	%i3,	%i5
	fmovrse	%o0,	%f19,	%f10
	brlez,a	%l3,	loop_1
	fmuld8sux16	%f0,	%f3,	%f10
	movle	%icc,	%o4,	%g2
	movne	%xcc,	%o6,	%i0
loop_1:
	nop
	setx	loop_2,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	std	%g6,	[%l7 + 0x20]
	movpos	%xcc,	%o3,	%l4
	srl	%i7,	0x18,	%l0
loop_2:
	nop
	setx loop_3, %l0, %l1
	jmpl %l1, %g3
	nop 	! 	tl	%xcc,	0x6 changed by convert2hboot
	movrgz	%o2,	%i1,	%g4
	udiv	%o5,	0x1C3A,	%l5
loop_3:
	fpsub32s	%f14,	%f28,	%f14
	addccc	%i6,	0x15DB,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g7,	%l2,	%i2
	nop 	! 	tcc	%xcc,	0x7 changed by convert2hboot
	ldx	[%l7 + 0x18],	%l1
	ldx	[%l7 + 0x70],	%g1
	fpadd32s	%f2,	%f7,	%f4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	movne	%icc,	%l6,	%i3
	wr	%g0,	0x10,	%asi
	wr	%g0,	0x80,	%asi
	andncc	%o0,	%l3,	%g2
	ldd	[%l7 + 0x08],	%f22
	fbuge	%fcc3,	loop_4
	fornot1s	%f7,	%f10,	%f10
	movgu	%icc,	%o6,	%i0
	nop 	! 	tgu	%xcc,	0x7 changed by convert2hboot
loop_4:
	stw	%g6,	[%l7 + 0x74]
	srlx	%o4,	0x0E,	%l4
	ldd	[%l7 + 0x20],	%f0
	nop 	! 	tsubcc	%i7,	%l0,	%o3 changed by convert2hboot
	edge8n	%g3,	%o2,	%i1
	subcc	%g4,	0x079F,	%l5
	udiv	%o5,	0x040B,	%o7
	nop
	setx loop_5, %l0, %l1
	jmpl %l1, %g7
	fnands	%f9,	%f4,	%f17
	fcmpgt32	%f14,	%f0,	%i6
	fpack32	%f18,	%f28,	%f8
loop_5:
	nop 	! 	tleu	%xcc,	0x0 changed by convert2hboot
	set	0x78, %o1
	nop	 ! 	ldxa	[%l7 + %o1] 0x14,	%i2 ASI use changed by convert2hboot
	movge	%xcc,	%l1,	%g1
	nop 	! 	tsubcc	%l2,	%i4,	%g5 changed by convert2hboot
	ba,pn	%xcc,	loop_6
	fcmpne32	%f14,	%f6,	%l6
	set	0x10, %o4
	sta	%f22,	[%l7 + %o4] 0x81
loop_6:
	nop 	! 	tn	%xcc,	0x5 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i3,	%o1,	%i5
	sethi	0x0506,	%l3
	stb	%o0,	[%l7 + 0x11]
	movrgz	%o6,	%i0,	%g2
	fnot1s	%f23,	%f26
	fbul,a	%fcc1,	loop_7
	movrne	%o4,	0x164,	%g6
	fone	%f14
	lduw	[%l7 + 0x18],	%l4
loop_7:
	bpos,pn	%xcc,	loop_8
	and	%l0,	%i7,	%o3
	fbg,a	%fcc1,	loop_9
	fbu,a	%fcc2,	loop_10
loop_8:
	movrne	%o2,	%i1,	%g3
	xnorcc	%g4,	%o5,	%l5
loop_9:
	fornot1	%f8,	%f4,	%f22
loop_10:
	nop
	set	0x7C, %l3
	ldstub	[%l7 + %l3],	%g7
	fmovrdgez	%i6,	%f14,	%f26
	ldx	[%l7 + 0x40],	%o7
	edge16n	%l1,	%g1,	%i2
	andn	%l2,	0x0BE9,	%g5
	edge16	%i4,	%l6,	%i3
	edge8l	%i5,	%l3,	%o1
	set	0x58, %g4
	nop	 ! 	stda	%o6,	[%l7 + %g4] 0x10 ASI use changed by convert2hboot
	bleu	%xcc,	loop_11
	movl	%xcc,	%i0,	%o0
	fabsd	%f26,	%f18
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
loop_11:
	xnorcc	%o4,	%g6,	%g2
	sll	%l4,	0x1B,	%i7
	nop 	! 	tneg	%xcc,	0x7 changed by convert2hboot
	xnor	%o3,	%o2,	%i1
	fnot2	%f26,	%f0
	udiv	%l0,	0x1253,	%g4
	orcc	%g3,	0x1554,	%l5
	nop 	! 	te	%icc,	0x3 changed by convert2hboot
	set	0x60, %g1
	nop	 ! 	ldsha	[%l7 + %g1] 0x80,	%g7 ASI use changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i6,	0x37C,	%o5
	fmovrsgz	%l1,	%f5,	%f26
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	sra	%g1,	0x1B,	%i2
	fcmpne16	%f0,	%f26,	%l2
	sdivx	%g5,	0x1751,	%i4
	and	%o7,	0x08AE,	%i3
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
	sub	%l6,	0x08C0,	%i5
	alignaddr	%l3,	%o1,	%i0
	movge	%xcc,	%o6,	%o0
	edge8l	%g6,	%g2,	%o4
	fmul8x16au	%f29,	%f24,	%f22
	nop 	! 	tneg	%icc,	0x3 changed by convert2hboot
	ldsw	[%l7 + 0x64],	%l4
	nop 	! 	tcs	%xcc,	0x3 changed by convert2hboot
	xorcc	%i7,	%o2,	%i1
	wr	%g0,	0x10,	%asi
	mulscc	%g4,	%l0,	%g3
	srl	%l5,	%g7,	%o5
	edge32n	%i6,	%l1,	%i2
	fands	%f12,	%f14,	%f12
	edge8l	%g1,	%g5,	%i4
	fpadd16s	%f26,	%f30,	%f16
	umulcc	%o7,	%l2,	%i3
	mulscc	%i5,	%l6,	%o1
	fmovscs	%icc,	%f4,	%f7
	array8	%i0,	%l3,	%o6
	or	%g6,	%o0,	%o4
	movrne	%l4,	0x31C,	%g2
	set	0x26, %i0
	nop	 ! 	stha	%i7,	[%l7 + %i0] 0xe2 ASI use changed by convert2hboot
	membar	#Sync
	movge	%xcc,	%o2,	%o3
	fpsub16	%f30,	%f30,	%f24
	nop 	! 	tvs	%xcc,	0x7 changed by convert2hboot
	fnegd	%f16,	%f16
	and	%g4,	%i1,	%g3
	alignaddrl	%l5,	%l0,	%g7
	movge	%icc,	%o5,	%i6
	smul	%i2,	%l1,	%g1
	swap	[%l7 + 0x0C],	%g5
	bcs,a	%xcc,	loop_12
	addcc	%i4,	%o7,	%i3
	fble	%fcc0,	loop_13
	movre	%i5,	%l2,	%l6
loop_12:
	udivcc	%o1,	0x09C1,	%l3
	fcmpne16	%f30,	%f6,	%o6
loop_13:
	sll	%g6,	%i0,	%o4
	nop 	! 	taddcctv	%o0,	%g2,	%l4 changed by convert2hboot
	ble,a	loop_14
	fnot1s	%f21,	%f7
	bn,a	%xcc,	loop_15
	edge32n	%o2,	%i7,	%g4
loop_14:
	fmovrslz	%o3,	%f17,	%f10
	nop
	setx	loop_16,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_15:
	udiv	%g3,	0x0A01,	%i1
	set	0x18, %l2
	nop	 ! 	lduha	[%l7 + %l2] 0x14,	%l0 ASI use changed by convert2hboot
loop_16:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l5,	%g7,	%o5
	bpos,a,pt	%icc,	loop_17
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	or	%i6,	0x1F5E,	%l1
	pdist	%f16,	%f10,	%f18
loop_17:
	bpos,a,pn	%icc,	loop_18
	srax	%g1,	0x03,	%i2
	xor	%g5,	%i4,	%o7
	fbue	%fcc0,	loop_19
loop_18:
	fpmerge	%f7,	%f30,	%f4
	ldd	[%l7 + 0x78],	%i4
	edge32n	%i3,	%l2,	%o1
loop_19:
	orncc	%l3,	0x1F79,	%l6
	movle	%icc,	%o6,	%i0
	movg	%icc,	%g6,	%o4
	nop 	! 	tsubcctv	%o0,	0x164C,	%g2 changed by convert2hboot
	xor	%o2,	0x1180,	%i7
	move	%icc,	%g4,	%l4
	fones	%f3
	fmovrdlez	%o3,	%f2,	%f14
	movrgz	%g3,	0x03D,	%l0
	nop 	! 	tpos	%xcc,	0x1 changed by convert2hboot
	xnorcc	%i1,	0x1CFD,	%g7
	movn	%xcc,	%o5,	%i6
	edge16l	%l1,	%l5,	%i2
	edge16l	%g1,	%i4,	%o7
	ldsb	[%l7 + 0x7D],	%g5
	mulscc	%i5,	0x0323,	%l2
	fmovdcs	%icc,	%f22,	%f1
	set	0x40, %l6
	nop	 ! 	stda	%f16,	[%l7 + %l6] 0x1f ASI use changed by convert2hboot
	membar	#Sync
	fmovd	%f4,	%f20
	subc	%o1,	0x1A26,	%l3
	movle	%icc,	%l6,	%i3
	udivcc	%o6,	0x071C,	%g6
	umulcc	%i0,	0x1F12,	%o4
	nop 	! 	sir	0x0DE6 changed by convert2hboot
	wr	%g0,	0x04,	%asi
	fbug	%fcc3,	loop_20
	fpadd32s	%f16,	%f23,	%f6
	brlez,a	%o2,	loop_21
	fpmerge	%f2,	%f17,	%f22
loop_20:
	smul	%i7,	0x09D6,	%g2
	wr	%g0,	0x11,	%asi
loop_21:
	addccc	%o3,	%g4,	%l0
	movneg	%icc,	%i1,	%g7
	fmovsle	%xcc,	%f18,	%f5
	xnorcc	%o5,	%i6,	%g3
	nop 	! 	tleu	%xcc,	0x7 changed by convert2hboot
	edge8	%l1,	%i2,	%g1
	st	%f26,	[%l7 + 0x7C]
	movg	%icc,	%l5,	%i4
	edge16n	%g5,	%i5,	%o7
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
	sdivx	%o1,	0x15E1,	%l3
	fba	%fcc1,	loop_22
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
	fmovdcc	%xcc,	%f8,	%f5
	fpsub32s	%f18,	%f19,	%f5
loop_22:
	edge32ln	%l2,	%i3,	%l6
	nop 	! 	tcs	%xcc,	0x4 changed by convert2hboot
	fone	%f12
	edge16n	%g6,	%o6,	%o4
	edge16n	%i0,	%o2,	%i7
	movvc	%xcc,	%g2,	%l4
	array8	%o0,	%o3,	%l0
	edge32	%g4,	%g7,	%o5
	edge8n	%i1,	%i6,	%g3
	movle	%xcc,	%i2,	%l1
	fxnors	%f11,	%f0,	%f13
	fbo	%fcc2,	loop_23
	sll	%l5,	%i4,	%g1
	movcs	%icc,	%i5,	%o7
	array16	%g5,	%l3,	%o1
loop_23:
	fmovsvs	%xcc,	%f3,	%f10
	nop 	! 	te	%xcc,	0x4 changed by convert2hboot
	ldd	[%l7 + 0x38],	%l2
	add	%i3,	%g6,	%l6
	be	%icc,	loop_24
	fmovrslez	%o6,	%f3,	%f27
	movleu	%icc,	%o4,	%o2
	fpsub32s	%f13,	%f16,	%f24
loop_24:
	fmuld8ulx16	%f2,	%f12,	%f20
	fcmpes	%fcc1,	%f18,	%f26
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	edge32l	%i7,	%i0,	%g2
	udivx	%l4,	0x0E59,	%o0
	set	0x48, %g2
	nop	 ! 	swapa	[%l7 + %g2] 0x89,	%l0 ASI use changed by convert2hboot
	wr	%g0,	0x80,	%asi
	fmovsa	%icc,	%f29,	%f24
	wr	%g0,	0x19,	%asi
	fmovrslz	%g7,	%f28,	%f15
	nop
	set	0x78, %l0
	ldx	[%l7 + %l0],	%o5
	fmul8ulx16	%f12,	%f28,	%f6
	movn	%xcc,	%i1,	%i6
	xor	%g3,	0x001B,	%i2
	set	0x58, %i2
	nop	 ! 	swapa	[%l7 + %i2] 0x18,	%l1 ASI use changed by convert2hboot
	fbul	%fcc0,	loop_25
	ba,a,pt	%icc,	loop_26
	mulscc	%l5,	0x1989,	%g1
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
loop_25:
	ldstub	[%l7 + 0x52],	%i5
loop_26:
	nop
	wr	%g0,	0x11,	%asi
	sta	%f15,	[%l7 + 0x38] %asi
	fcmpeq32	%f10,	%f24,	%i4
	fbug	%fcc2,	loop_27
	sdivx	%o7,	0x1868,	%g5
	fmovsvc	%xcc,	%f26,	%f1
	xorcc	%l3,	%l2,	%i3
loop_27:
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
	fmovdl	%xcc,	%f26,	%f21
	bg	loop_28
	membar	0x0E
	sllx	%o1,	0x18,	%g6
	nop 	! 	sir	0x1021 changed by convert2hboot
loop_28:
	and	%o6,	%l6,	%o4
	nop 	! 	taddcc	%o2,	%i0,	%g2 changed by convert2hboot
	fble	%fcc2,	loop_29
	smul	%i7,	%l4,	%l0
	fba	%fcc3,	loop_30
	nop 	! 	tvs	%xcc,	0x3 changed by convert2hboot
loop_29:
	udiv	%g4,	0x06C6,	%o0
	movl	%xcc,	%g7,	%o3
loop_30:
	sdiv	%o5,	0x0C3E,	%i1
	srl	%g3,	%i2,	%l1
	fmovdl	%icc,	%f0,	%f6
	fble	%fcc3,	loop_31
	xnorcc	%l5,	%i6,	%g1
	movne	%icc,	%i4,	%o7
	smulcc	%g5,	0x1A78,	%l3
loop_31:
	srax	%l2,	%i5,	%o1
	nop 	! 	tvc	%xcc,	0x4 changed by convert2hboot
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	ldsb	[%l7 + 0x10],	%i3
	nop
	setx loop_32, %l0, %l1
	jmpl %l1, %o6
	fbg,a	%fcc1,	loop_33
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
	popc	0x0E73,	%l6
loop_32:
	nop
	setx	loop_34,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_33:
	andcc	%o4,	0x1E25,	%g6
	and	%o2,	%g2,	%i0
	movg	%icc,	%l4,	%i7
loop_34:
	nop
	set	0x40, %i4
	nop	 ! 	stda	%f0,	[%l7 + %i4] 0x14 ASI use changed by convert2hboot
	fmovdl	%xcc,	%f25,	%f17
	orncc	%g4,	%l0,	%o0
	ldstub	[%l7 + 0x65],	%g7
	andncc	%o5,	%o3,	%i1
	udiv	%g3,	0x0E29,	%l1
	udiv	%l5,	0x02F6,	%i2
	sra	%g1,	0x12,	%i4
	fmovse	%xcc,	%f5,	%f7
	fmovrsne	%o7,	%f0,	%f8
	nop 	! 	sir	0x0CB6 changed by convert2hboot
	bne,a,pt	%icc,	loop_35
	movrgz	%g5,	%l3,	%l2
	fmovrdgz	%i5,	%f12,	%f24
	orcc	%o1,	%i6,	%o6
loop_35:
	fnot1	%f0,	%f8
	set	0x40, %i1
	nop	 ! 	stda	%f16,	[%l7 + %i1] 0x14 ASI use changed by convert2hboot
	movrne	%i3,	0x1C0,	%o4
	xnor	%g6,	0x0CA7,	%l6
	sllx	%o2,	%i0,	%g2
	movvc	%xcc,	%l4,	%g4
	move	%icc,	%l0,	%o0
	fcmps	%fcc1,	%f10,	%f24
	alignaddr	%i7,	%g7,	%o5
	srl	%o3,	%g3,	%i1
	movrlz	%l1,	0x1EE,	%i2
	fmovdle	%icc,	%f15,	%f28
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
	smul	%g1,	%l5,	%i4
	fmovsvc	%icc,	%f21,	%f21
	array8	%g5,	%l3,	%o7
	fpsub32s	%f30,	%f2,	%f10
	add	%l2,	0x04BC,	%o1
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	fmovrdlez	%i5,	%f4,	%f18
	flush	%l7 + 0x30
	edge32ln	%o6,	%i6,	%o4
	set	0x30, %o5
	nop	 ! 	swapa	[%l7 + %o5] 0x19,	%i3 ASI use changed by convert2hboot
	set	0x78, %i7
	nop	 ! 	lduwa	[%l7 + %i7] 0x0c,	%l6 ASI use changed by convert2hboot
	fmul8x16al	%f10,	%f27,	%f18
	edge16	%o2,	%g6,	%g2
	sethi	0x1291,	%i0
	movgu	%xcc,	%l4,	%l0
	nop 	! 	tpos	%xcc,	0x6 changed by convert2hboot
	smul	%g4,	%i7,	%o0
	movg	%icc,	%o5,	%o3
	fmovsleu	%icc,	%f4,	%f4
	udiv	%g7,	0x0F1D,	%i1
	movg	%icc,	%g3,	%i2
	nop 	! 	taddcctv	%l1,	0x0C9E,	%g1 changed by convert2hboot
	smulcc	%i4,	%g5,	%l5
	ldx	[%l7 + 0x38],	%o7
	xor	%l3,	%o1,	%l2
	nop 	! 	tne	%icc,	0x5 changed by convert2hboot
	nop 	! 	taddcctv	%o6,	%i6,	%o4 changed by convert2hboot
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
	edge32n	%i5,	%l6,	%o2
	array16	%i3,	%g6,	%i0
	movcc	%xcc,	%g2,	%l4
	wr	%g0,	0x52,	%asi
	wr	%g0,	0x89,	%asi
	nop
	set	0x31, %o0
	stb	%l0,	[%l7 + %o0]
	fmovrslez	%o5,	%f17,	%f27
	fmul8sux16	%f20,	%f22,	%f24
	ldstub	[%l7 + 0x47],	%o3
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
	udivcc	%g7,	0x0F58,	%i1
	movcs	%xcc,	%g3,	%i2
	edge8	%o0,	%g1,	%l1
	sra	%g5,	%i4,	%l5
	sllx	%l3,	0x14,	%o1
	edge32l	%o7,	%o6,	%l2
	fnegd	%f0,	%f20
	array8	%o4,	%i6,	%l6
	sdivcc	%i5,	0x187E,	%i3
	bshuffle	%f12,	%f6,	%f6
	orncc	%g6,	0x0866,	%i0
	or	%o2,	0x1E1D,	%g2
	fandnot2	%f4,	%f8,	%f20
	movre	%l4,	%g4,	%i7
	movleu	%icc,	%l0,	%o3
	fblg,a	%fcc3,	loop_36
	fxors	%f11,	%f25,	%f30
	nop 	! 	tpos	%icc,	0x3 changed by convert2hboot
	fmovdg	%icc,	%f16,	%f13
loop_36:
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
	xorcc	%o5,	%g7,	%i1
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
	sethi	0x1900,	%i2
	xnorcc	%o0,	%g3,	%g1
	array8	%l1,	%i4,	%l5
	bvs	loop_37
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	prefetch	[%l7 + 0x78],	 0x3
	sdivcc	%l3,	0x0FD2,	%o1
loop_37:
	array8	%g5,	%o6,	%l2
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
	lduw	[%l7 + 0x78],	%o7
	subcc	%i6,	0x1CB7,	%l6
	fbl,a	%fcc2,	loop_38
	fbl,a	%fcc3,	loop_39
	lduw	[%l7 + 0x20],	%i5
	move	%icc,	%i3,	%g6
loop_38:
	alignaddrl	%o4,	%o2,	%g2
loop_39:
	srlx	%i0,	%g4,	%l4
	smul	%l0,	%o3,	%o5
	addcc	%i7,	0x091F,	%g7
	fblg,a	%fcc1,	loop_40
	smul	%i2,	%o0,	%g3
	ldd	[%l7 + 0x20],	%f14
	movrgz	%g1,	%i1,	%l1
loop_40:
	brlz	%l5,	loop_41
	fmovscs	%icc,	%f0,	%f24
	udivcc	%i4,	0x1CEE,	%o1
	nop 	! 	sir	0x0212 changed by convert2hboot
loop_41:
	movne	%xcc,	%g5,	%l3
	sdivx	%o6,	0x135E,	%l2
	orcc	%i6,	%l6,	%i5
	srl	%o7,	%i3,	%o4
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	fmovdn	%xcc,	%f13,	%f2
	fmovsvc	%xcc,	%f28,	%f3
	edge16l	%g6,	%g2,	%o2
	fnot2s	%f24,	%f30
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
	edge8ln	%g4,	%l4,	%l0
	fcmped	%fcc0,	%f24,	%f26
	nop 	! 	tsubcc	%o3,	0x1CF0,	%i0 changed by convert2hboot
	set	0x40, %o6
	nop	 ! 	ldxa	[%l7 + %o6] 0x81,	%i7 ASI use changed by convert2hboot
	bne	loop_42
	movcc	%icc,	%g7,	%o5
	brgez,a	%o0,	loop_43
	fornot2s	%f24,	%f18,	%f15
loop_42:
	fpadd16s	%f19,	%f10,	%f11
	edge32l	%i2,	%g3,	%i1
loop_43:
	movneg	%xcc,	%g1,	%l1
	fbul	%fcc1,	loop_44
	nop 	! 	tcs	%icc,	0x7 changed by convert2hboot
	fmovsl	%xcc,	%f8,	%f25
	edge16l	%l5,	%i4,	%g5
loop_44:
	fand	%f2,	%f26,	%f30
	edge32ln	%l3,	%o6,	%l2
	nop 	! 	sir	0x0B7D changed by convert2hboot
	movge	%icc,	%o1,	%l6
	sllx	%i6,	%o7,	%i3
	std	%f4,	[%l7 + 0x40]
	fors	%f24,	%f12,	%f27
	stb	%i5,	[%l7 + 0x15]
	nop 	! 	tsubcctv	%o4,	%g6,	%o2 changed by convert2hboot
	fsrc2s	%f10,	%f21
	edge32l	%g2,	%g4,	%l0
	wr	%g0,	0x18,	%asi
	fpsub16	%f24,	%f18,	%f2
	fpsub16s	%f26,	%f13,	%f12
	subc	%o3,	%i7,	%g7
	edge16l	%o5,	%o0,	%i2
	fmovrsgz	%g3,	%f31,	%f28
	sllx	%i0,	0x08,	%i1
	edge8l	%g1,	%l5,	%i4
	fbu,a	%fcc2,	loop_45
	fmovrdlez	%g5,	%f24,	%f0
	edge8n	%l3,	%l1,	%o6
	sdiv	%o1,	0x19E2,	%l6
loop_45:
	nop 	! 	ta	%xcc,	0x1 changed by convert2hboot
	sethi	0x07C5,	%l2
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
	fabsd	%f16,	%f24
	fbu	%fcc3,	loop_46
	edge32l	%o7,	%i3,	%i6
	ble,pt	%xcc,	loop_47
	fmovdcs	%xcc,	%f8,	%f12
loop_46:
	sdivcc	%o4,	0x060E,	%i5
	fbul,a	%fcc3,	loop_48
loop_47:
	array8	%o2,	%g6,	%g4
	srax	%g2,	0x1E,	%l4
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
loop_48:
	nop
	wr	%g0,	0x89,	%asi
	andcc	%o3,	0x1FAA,	%i7
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	fmovdcs	%xcc,	%f16,	%f9
	movrgz	%g7,	%o0,	%o5
	xorcc	%g3,	0x079A,	%i0
	subc	%i2,	0x1B79,	%g1
	swap	[%l7 + 0x24],	%i1
	fbule,a	%fcc2,	loop_49
	fmuld8ulx16	%f27,	%f0,	%f6
	bcc,pt	%xcc,	loop_50
	fmovrsne	%i4,	%f28,	%f20
loop_49:
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	fmovdn	%icc,	%f2,	%f13
loop_50:
	andncc	%l5,	%l3,	%l1
	fmovsg	%icc,	%f8,	%f14
	ld	[%l7 + 0x54],	%f5
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	edge8n	%g5,	%o6,	%l6
	sth	%o1,	[%l7 + 0x24]
	subccc	%l2,	%o7,	%i3
	bn	%xcc,	loop_51
	movpos	%icc,	%o4,	%i6
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
	fbule	%fcc1,	loop_52
loop_51:
	edge16	%i5,	%o2,	%g6
	andncc	%g2,	%l4,	%l0
	fbul	%fcc1,	loop_53
loop_52:
	move	%xcc,	%o3,	%g4
	edge32ln	%i7,	%o0,	%g7
	subc	%g3,	%o5,	%i0
loop_53:
	st	%f6,	[%l7 + 0x28]
	umul	%g1,	%i2,	%i1
	fmovs	%f4,	%f21
	edge8n	%l5,	%i4,	%l1
	brgz,a	%g5,	loop_54
	stw	%l3,	[%l7 + 0x18]
	fmovdleu	%icc,	%f0,	%f3
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
loop_54:
	srlx	%l6,	%o6,	%l2
	fbuge	%fcc2,	loop_55
	andcc	%o1,	%o7,	%i3
	wr	%g0,	0x80,	%asi
loop_55:
	bne,pt	%xcc,	loop_56
	fmovrdgez	%i5,	%f26,	%f14
	nop 	! 	tsubcctv	%o4,	0x0DFB,	%o2 changed by convert2hboot
	srlx	%g2,	%l4,	%g6
loop_56:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o3,	%g4,	%i7
	ldx	[%l7 + 0x48],	%o0
	edge16	%l0,	%g7,	%g3
	set	0x18, %o3
	nop	 ! 	swapa	[%l7 + %o3] 0x18,	%i0 ASI use changed by convert2hboot
	nop 	! 	tge	%icc,	0x3 changed by convert2hboot
	fbue	%fcc2,	loop_57
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	fandnot1s	%f22,	%f18,	%f28
	fbg	%fcc1,	loop_58
loop_57:
	fbe,a	%fcc3,	loop_59
	array8	%o5,	%g1,	%i1
	nop 	! 	tsubcctv	%l5,	0x0598,	%i2 changed by convert2hboot
loop_58:
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
loop_59:
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	movgu	%icc,	%l3,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o6,	%g5,	%l2
	movrlez	%o7,	%i3,	%i6
	std	%i4,	[%l7 + 0x18]
	wr	%g0,	0x0c,	%asi
	sdivx	%o4,	0x173E,	%g2
	ble	%xcc,	loop_60
	ldub	[%l7 + 0x11],	%l4
	nop 	! 	taddcctv	%g6,	%o3,	%g4 changed by convert2hboot
	smul	%i7,	%o0,	%o2
loop_60:
	ldsh	[%l7 + 0x62],	%g7
	fmovrdlz	%g3,	%f22,	%f6
	wr	%g0,	0x19,	%asi
	fmovdn	%xcc,	%f6,	%f11
	call	loop_61
	ldsw	[%l7 + 0x50],	%i0
	popc	%g1,	%o5
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
loop_61:
	xorcc	%i1,	%i2,	%i4
	st	%f23,	[%l7 + 0x28]
	edge8ln	%l5,	%l3,	%l6
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
	ldstub	[%l7 + 0x45],	%o6
	umulcc	%g5,	%l2,	%o7
	bge,a,pn	%icc,	loop_63
loop_62:
	ble	%xcc,	loop_64
	nop 	! 	tneg	%icc,	0x7 changed by convert2hboot
	fmovdge	%xcc,	%f4,	%f5
loop_63:
	array8	%i3,	%l1,	%i5
loop_64:
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	xor	%o1,	%i6,	%g2
	nop
	setx	loop_65,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	array8	%o4,	%g6,	%l4
	nop
	setx	loop_66,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fmovdcc	%icc,	%f24,	%f7
loop_65:
	fnegd	%f28,	%f22
	fmovsneg	%icc,	%f14,	%f25
loop_66:
	fblg,a	%fcc3,	loop_67
	nop 	! 	tneg	%xcc,	0x7 changed by convert2hboot
	ble,a,pt	%xcc,	loop_68
	movgu	%xcc,	%g4,	%o3
loop_67:
	nop 	! 	taddcc	%i7,	0x0235,	%o0 changed by convert2hboot
	sdivcc	%o2,	0x197D,	%g3
loop_68:
	alignaddr	%l0,	%i0,	%g7
	sethi	0x0E55,	%g1
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
	fmovrsgz	%i1,	%f12,	%f17
	edge32l	%i2,	%i4,	%l5
	movrgz	%l3,	0x2AA,	%l6
	nop
	setx	loop_69,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	bleu,a,pn	%icc,	loop_70
	fbl,a	%fcc1,	loop_71
	fmovdg	%icc,	%f27,	%f13
loop_69:
	popc	0x195F,	%o6
loop_70:
	brlez	%o5,	loop_72
loop_71:
	fbge	%fcc0,	loop_73
	smulcc	%l2,	%g5,	%o7
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
loop_72:
	edge32l	%i3,	%l1,	%i5
loop_73:
	fabsd	%f28,	%f8
	srax	%o1,	%i6,	%o4
	fandnot2	%f4,	%f30,	%f20
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
	edge32n	%g2,	%l4,	%g4
	xorcc	%o3,	0x1DC9,	%g6
	xorcc	%i7,	%o2,	%g3
	stw	%o0,	[%l7 + 0x6C]
	movneg	%icc,	%i0,	%g7
	bne,pt	%icc,	loop_74
	fzeros	%f11
	lduw	[%l7 + 0x68],	%g1
	smul	%i1,	0x1E83,	%i2
loop_74:
	udivx	%i4,	0x062C,	%l5
	alignaddrl	%l3,	%l6,	%o6
	popc	%o5,	%l0
	bcc,a	loop_75
	addc	%g5,	0x1C52,	%l2
	movneg	%xcc,	%i3,	%o7
	ld	[%l7 + 0x54],	%f7
loop_75:
	edge32l	%l1,	%o1,	%i6
	movvs	%icc,	%i5,	%g2
	brgez	%l4,	loop_76
	nop 	! 	taddcctv	%g4,	0x0AA9,	%o4 changed by convert2hboot
	fmovdn	%xcc,	%f28,	%f25
	nop
	setx loop_77, %l0, %l1
	jmpl %l1, %o3
loop_76:
	edge32	%i7,	%g6,	%o2
	mova	%icc,	%o0,	%g3
	udiv	%g7,	0x0690,	%g1
loop_77:
	fmovsvs	%xcc,	%f20,	%f13
	nop 	! 	tsubcc	%i1,	0x07B0,	%i2 changed by convert2hboot
	movgu	%xcc,	%i4,	%l5
	mulx	%l3,	0x0F75,	%l6
	nop 	! 	tsubcc	%o6,	%o5,	%i0 changed by convert2hboot
	edge32ln	%l0,	%l2,	%i3
	xnorcc	%o7,	0x15DF,	%l1
	edge32l	%o1,	%i6,	%i5
	movneg	%xcc,	%g5,	%l4
	andcc	%g4,	0x0F21,	%o4
	fmovrsgez	%o3,	%f26,	%f16
	movg	%xcc,	%g2,	%i7
	wr	%g0,	0x11,	%asi
	sra	%o0,	%o2,	%g3
	movg	%xcc,	%g7,	%g1
	wr	%g0,	0x04,	%asi
	udiv	%i4,	0x0DFF,	%l5
	fnot1s	%f27,	%f27
	siam	0x4
	fand	%f16,	%f12,	%f4
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	wr	%g0,	0x0c,	%asi
	fbn	%fcc3,	loop_78
	fblg	%fcc1,	loop_79
	nop 	! 	tsubcc	%l6,	0x1E69,	%o6 changed by convert2hboot
	nop 	! 	tsubcc	%i2,	%o5,	%i0 changed by convert2hboot
loop_78:
	andcc	%l0,	0x14F3,	%i3
loop_79:
	andcc	%l2,	%l1,	%o7
	fcmps	%fcc0,	%f1,	%f10
	nop 	! 	tsubcctv	%o1,	%i5,	%i6 changed by convert2hboot
	fpsub32	%f12,	%f30,	%f10
	fsrc1	%f10,	%f12
	fmovdpos	%xcc,	%f11,	%f15
	wr	%g0,	0x18,	%asi
	or	%g4,	0x183A,	%g5
	edge8ln	%o4,	%g2,	%i7
	bgu,pn	%icc,	loop_80
	movrgz	%o3,	0x0E5,	%g6
	wr	%g0,	0x89,	%asi
loop_80:
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	nop 	! 	ta	%icc,	0x7 changed by convert2hboot
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	srlx	%g7,	%g1,	%i1
	for	%f0,	%f14,	%f20
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	fandnot1s	%f9,	%f20,	%f28
	fbo,a	%fcc2,	loop_81
	nop 	! 	tvs	%xcc,	0x2 changed by convert2hboot
	movgu	%icc,	%i4,	%l5
	andcc	%l6,	%o6,	%l3
loop_81:
	udivx	%o5,	0x18A8,	%i2
	edge32ln	%i0,	%i3,	%l2
	edge32ln	%l1,	%l0,	%o7
	sth	%i5,	[%l7 + 0x0A]
	fble	%fcc1,	loop_82
	movcs	%icc,	%o1,	%i6
	sra	%l4,	%g4,	%g5
	fsrc1s	%f5,	%f14
loop_82:
	lduw	[%l7 + 0x10],	%g2
	mulscc	%o4,	%o3,	%i7
	xor	%o2,	0x13E9,	%g3
	movcs	%xcc,	%o0,	%g7
	fxors	%f26,	%f25,	%f2
	xnorcc	%g1,	%i1,	%i4
	array16	%l5,	%l6,	%g6
	movvc	%icc,	%o6,	%o5
	fpsub32	%f26,	%f28,	%f4
	mulx	%l3,	0x0A3D,	%i0
	fpadd16s	%f12,	%f13,	%f8
	fxnors	%f8,	%f25,	%f23
	ld	[%l7 + 0x20],	%f8
	fblg	%fcc0,	loop_83
	sethi	0x0FA9,	%i2
	fbu	%fcc1,	loop_84
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
loop_83:
	orncc	%i3,	%l2,	%l1
	set	0x78, %i3
	nop	 ! 	lduha	[%l7 + %i3] 0x0c,	%l0 ASI use changed by convert2hboot
loop_84:
	fmovdg	%icc,	%f8,	%f9
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	brgez	%o7,	loop_85
	umul	%i5,	%i6,	%l4
	fcmpeq16	%f2,	%f30,	%o1
	fbule,a	%fcc2,	loop_86
loop_85:
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	fmul8sux16	%f2,	%f14,	%f26
	fmovrsne	%g5,	%f25,	%f22
loop_86:
	sdiv	%g4,	0x1FD9,	%g2
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	srax	%o4,	0x0B,	%i7
	udivcc	%o3,	0x1BB5,	%o2
	flush	%l7 + 0x34
	fsrc1	%f26,	%f6
	movcs	%xcc,	%o0,	%g7
	sll	%g1,	0x1C,	%g3
	edge16	%i4,	%l5,	%i1
	fandnot2s	%f8,	%f7,	%f13
	move	%xcc,	%l6,	%g6
	smulcc	%o6,	0x1209,	%l3
	nop 	! 	taddcc	%o5,	%i0,	%i2 changed by convert2hboot
	edge8	%i3,	%l1,	%l2
	edge8n	%o7,	%i5,	%l0
	xnorcc	%l4,	%o1,	%g5
	ldstub	[%l7 + 0x0D],	%i6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g2
	sethi	0x19E8,	%g4
	andcc	%i7,	%o3,	%o2
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	fornot1s	%f21,	%f17,	%f24
	orcc	%g7,	0x1074,	%g1
	fbule	%fcc1,	loop_87
	call	loop_88
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	alignaddr	%g3,	%i4,	%l5
loop_87:
	lduw	[%l7 + 0x0C],	%o0
loop_88:
	fmovsne	%icc,	%f20,	%f26
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	movrlz	%g6,	0x184,	%l3
	fbne,a	%fcc0,	loop_89
	xorcc	%o6,	0x1E55,	%o5
	movneg	%xcc,	%i2,	%i3
	subccc	%l1,	%l2,	%o7
loop_89:
	ldd	[%l7 + 0x78],	%f8
	addc	%i5,	0x0BC4,	%l0
	addccc	%i0,	0x1069,	%o1
	bcc,pn	%xcc,	loop_90
	movgu	%icc,	%g5,	%l4
	restored
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
loop_90:
	edge32n	%g2,	%o4,	%i6
	bleu,a	%icc,	loop_91
	array32	%i7,	%o3,	%g4
	fzero	%f16
	edge32ln	%o2,	%g7,	%g3
loop_91:
	udivx	%g1,	0x1052,	%l5
	sth	%i4,	[%l7 + 0x48]
	bge,pn	%icc,	loop_92
	fmovrse	%l6,	%f4,	%f21
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i1,	0x086C,	%g6
loop_92:
	nop 	! 	tle	%icc,	0x4 changed by convert2hboot
	wr	%g0,	0x2f,	%asi
	fnegd	%f30,	%f4
	fmuld8ulx16	%f7,	%f18,	%f22
	edge16ln	%o0,	%o5,	%i2
	udivcc	%o6,	0x1DAF,	%i3
	fornot1s	%f27,	%f11,	%f3
	andcc	%l1,	%l2,	%o7
	bvs,a	loop_93
	sdivcc	%i5,	0x0A0E,	%i0
	fmovrslz	%o1,	%f31,	%f1
	fmovdle	%icc,	%f3,	%f24
loop_93:
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
	membar	0x3C
	fxor	%f20,	%f22,	%f30
	umulcc	%g5,	%l4,	%l0
	or	%o4,	0x033A,	%i6
	add	%i7,	0x025A,	%o3
	std	%g4,	[%l7 + 0x30]
	fpadd32	%f16,	%f10,	%f6
	nop 	! 	tl	%icc,	0x1 changed by convert2hboot
	siam	0x3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	bvs,pn	%xcc,	loop_94
	movrne	%o2,	0x12D,	%g1
	be,a,pt	%xcc,	loop_95
	array8	%l5,	%i4,	%g3
loop_94:
	bvs	loop_96
	ldd	[%l7 + 0x38],	%i6
loop_95:
	smul	%g6,	0x1A85,	%i1
	edge8	%l3,	%o0,	%i2
loop_96:
	sub	%o6,	0x0F71,	%o5
	sllx	%i3,	%l1,	%l2
	udivcc	%i5,	0x1AFB,	%i0
	umul	%o7,	0x03AD,	%o1
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	orn	%l4,	0x01E4,	%g5
	nop 	! 	tle	%xcc,	0x2 changed by convert2hboot
	ldx	[%l7 + 0x20],	%l0
	membar	0x11
	orcc	%i6,	0x0679,	%o4
	mova	%icc,	%i7,	%o3
	fmul8x16au	%f19,	%f29,	%f22
	ldub	[%l7 + 0x6D],	%g4
	xnor	%g2,	%o2,	%g7
	fornot2	%f16,	%f10,	%f24
	array8	%g1,	%l5,	%i4
	bneg,pt	%xcc,	loop_97
	movleu	%xcc,	%l6,	%g3
	fmovsvc	%xcc,	%f22,	%f27
	xorcc	%i1,	%l3,	%o0
loop_97:
	brnz,a	%i2,	loop_98
	sethi	0x0B1F,	%g6
	fmovrsgez	%o5,	%f3,	%f5
	udivx	%o6,	0x06CE,	%i3
loop_98:
	brlez	%l2,	loop_99
	udivcc	%i5,	0x1937,	%i0
	wr	%g0,	0x18,	%asi
loop_99:
	umulcc	%l1,	%o1,	%l4
	fbule	%fcc0,	loop_100
	ldsw	[%l7 + 0x40],	%o7
	fmovrse	%l0,	%f13,	%f21
	fandnot2	%f4,	%f14,	%f28
loop_100:
	array16	%g5,	%i6,	%o4
	brlz,a	%o3,	loop_101
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
	nop 	! 	ta	%icc,	0x6 changed by convert2hboot
	sub	%g4,	0x0EDF,	%g2
loop_101:
	edge32ln	%i7,	%g7,	%g1
	xnorcc	%o2,	%i4,	%l5
	move	%xcc,	%l6,	%i1
	edge16l	%g3,	%o0,	%i2
	array16	%g6,	%l3,	%o5
	movvs	%icc,	%i3,	%o6
	nop
	setx	loop_102,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	edge16ln	%l2,	%i0,	%i5
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	movcs	%xcc,	%l1,	%l4
loop_102:
	fbg,a	%fcc0,	loop_103
	ba	%icc,	loop_104
	fmovscc	%xcc,	%f23,	%f16
	umul	%o7,	0x0948,	%o1
loop_103:
	smul	%l0,	0x1584,	%g5
loop_104:
	bvc	loop_105
	fmovsvc	%xcc,	%f21,	%f22
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	fnors	%f23,	%f7,	%f27
loop_105:
	orncc	%i6,	0x07D8,	%o3
	fmovrse	%g4,	%f6,	%f13
	fbul	%fcc1,	loop_106
	fmovrsgz	%g2,	%f3,	%f3
	addccc	%o4,	0x1116,	%g7
	movvs	%xcc,	%i7,	%g1
loop_106:
	nop 	! 	tvs	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
	set	0x30, %o7
	nop	 ! 	ldda	[%l7 + %o7] 0x2a,	%i4 ASI use changed by convert2hboot
	array8	%o2,	%l6,	%l5
	edge16n	%i1,	%o0,	%g3
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	sdivx	%g6,	0x1BF6,	%l3
	nop 	! 	tl	%icc,	0x4 changed by convert2hboot
	nop 	! 	te	%xcc,	0x4 changed by convert2hboot
	edge16ln	%i2,	%i3,	%o6
	sll	%o5,	%i0,	%l2
	wr	%g0,	0x2a,	%asi
	membar	#Sync
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
	fmovsvs	%icc,	%f9,	%f2
	wr	%g0,	0x19,	%asi
	movgu	%icc,	%o7,	%l1
	set	0x5C, %i6
	nop	 ! 	ldsha	[%l7 + %i6] 0x14,	%o1 ASI use changed by convert2hboot
	call	loop_107
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	xnorcc	%l0,	0x0CB7,	%i6
	nop
	setx loop_108, %l0, %l1
	jmpl %l1, %o3
loop_107:
	edge8l	%g4,	%g5,	%o4
	srl	%g2,	%g7,	%g1
	bn,a,pt	%xcc,	loop_109
loop_108:
	ld	[%l7 + 0x5C],	%f25
	fsrc1	%f18,	%f26
	fpsub32s	%f21,	%f4,	%f4
loop_109:
	addccc	%i4,	%i7,	%o2
	wr	%g0,	0x11,	%asi
	nop
	setx	loop_110,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	and	%i1,	0x0E95,	%o0
	movne	%icc,	%g3,	%g6
loop_110:
	andncc	%l3,	%i2,	%i3
	wr	%g0,	0x11,	%asi
	andcc	%l5,	0x13BA,	%o5
	srl	%l2,	%i5,	%l4
	fmovdne	%xcc,	%f14,	%f25
	fcmps	%fcc3,	%f6,	%f23
	umul	%i0,	%l1,	%o7
	fpsub32s	%f4,	%f14,	%f10
	brgz	%o1,	loop_111
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
	srax	%i6,	0x0A,	%o3
	array8	%g4,	%g5,	%l0
loop_111:
	srl	%g2,	0x0A,	%g7
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
	fbuge,a	%fcc2,	loop_112
	mulx	%g1,	0x01C0,	%i4
	fmovsn	%icc,	%f3,	%f1
	movl	%xcc,	%o4,	%o2
loop_112:
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
	fpack32	%f18,	%f2,	%f30
	fmul8x16	%f15,	%f26,	%f16
	fnegs	%f14,	%f24
	movleu	%xcc,	%l6,	%i1
	movcc	%icc,	%o0,	%i7
	set	0x40, %l1
	nop	 ! 	stda	%f0,	[%l7 + %l1] 0x14 ASI use changed by convert2hboot
	sth	%g3,	[%l7 + 0x0A]
	fors	%f27,	%f23,	%f15
	nop 	! 	tsubcctv	%l3,	%g6,	%i2 changed by convert2hboot
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	fmovrsgz	%i3,	%f31,	%f8
	ldx	[%l7 + 0x30],	%o6
	fmovrdlez	%o5,	%f8,	%f6
	brgez,a	%l5,	loop_113
	edge16n	%i5,	%l2,	%l4
	edge32	%i0,	%o7,	%o1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
loop_113:
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	edge32n	%g4,	%l1,	%l0
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
	sdivcc	%g5,	0x0227,	%g2
	srax	%g7,	%i4,	%g1
	array8	%o4,	%o2,	%i1
	movrgez	%l6,	%o0,	%g3
	fand	%f2,	%f12,	%f14
	xnorcc	%l3,	0x0A37,	%g6
	nop 	! 	tsubcc	%i7,	%i3,	%i2 changed by convert2hboot
	movrlez	%o6,	%l5,	%o5
	movpos	%icc,	%i5,	%l2
	bvc	loop_114
	fbu	%fcc0,	loop_115
	fmovdgu	%xcc,	%f6,	%f6
	fmovda	%icc,	%f9,	%f5
loop_114:
	andcc	%i0,	0x0E2C,	%o7
loop_115:
	addc	%o1,	%l4,	%i6
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
	smul	%g4,	%l1,	%l0
	stb	%o3,	[%l7 + 0x24]
	alignaddrl	%g5,	%g7,	%i4
	orncc	%g2,	0x1E5D,	%g1
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	nop	 ! 	casa	[%l6] 0x89,	%o2,	%i1 ASI use changed by convert2hboot
	movleu	%icc,	%o4,	%o0
	orn	%g3,	%l6,	%g6
	ldsb	[%l7 + 0x1C],	%i7
	movleu	%xcc,	%l3,	%i2
	add	%i3,	%l5,	%o6
	sllx	%i5,	%l2,	%o5
	bgu	loop_116
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	set	0x48, %g3
	lda	[%l7 + %g3] 0x14,	%f9
loop_116:
	fmovdleu	%xcc,	%f20,	%f27
	be,a,pn	%icc,	loop_117
	stw	%o7,	[%l7 + 0x74]
	sra	%i0,	0x1C,	%l4
	brlz	%o1,	loop_118
loop_117:
	fmul8x16	%f31,	%f28,	%f10
	and	%g4,	%l1,	%i6
	bgu	loop_119
loop_118:
	bcc,pt	%icc,	loop_120
	fbn,a	%fcc2,	loop_121
	fpack32	%f18,	%f28,	%f28
loop_119:
	subcc	%o3,	%l0,	%g5
loop_120:
	array16	%i4,	%g7,	%g1
loop_121:
	nop
	wr	%g0,	0x19,	%asi
	mova	%xcc,	%i1,	%o4
	stb	%o0,	[%l7 + 0x19]
	fblg,a	%fcc2,	loop_122
	fmovdle	%icc,	%f0,	%f30
	nop
	setx	loop_123,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	edge32ln	%g2,	%l6,	%g6
loop_122:
	udiv	%g3,	0x0DF2,	%i7
	xnor	%i2,	0x0783,	%i3
loop_123:
	movgu	%xcc,	%l3,	%o6
	edge8l	%i5,	%l5,	%o5
	fpadd32s	%f12,	%f11,	%f15
	addcc	%o7,	%l2,	%l4
	nop
	setx loop_124, %l0, %l1
	jmpl %l1, %i0
	edge8	%g4,	%l1,	%i6
	fpackfix	%f4,	%f19
	ldsh	[%l7 + 0x62],	%o3
loop_124:
	fmovdne	%xcc,	%f26,	%f10
	array16	%o1,	%g5,	%i4
	sll	%l0,	%g1,	%g7
	fba	%fcc1,	loop_125
	smul	%i1,	0x1348,	%o2
	set	0x10, %l5
	nop	 ! 	ldswa	[%l7 + %l5] 0x0c,	%o0 ASI use changed by convert2hboot
loop_125:
	andn	%o4,	0x13D2,	%l6
	array8	%g6,	%g3,	%i7
	orn	%i2,	%i3,	%l3
	fpmerge	%f13,	%f19,	%f0
	andcc	%o6,	0x154B,	%g2
	edge32ln	%l5,	%o5,	%i5
	movrgez	%l2,	%o7,	%l4
	bn,a,pt	%xcc,	loop_126
	mulscc	%g4,	0x0CA4,	%i0
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
	nop
	setx loop_127, %l0, %l1
	jmpl %l1, %l1
loop_126:
	movcs	%icc,	%i6,	%o1
	nop
	setx	loop_128,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	prefetch	[%l7 + 0x3C],	 0x1
loop_127:
	nop
	wr	%g0,	0x89,	%asi
loop_128:
	nop
	wr	%g0,	0x11,	%asi
	movre	%o3,	0x3E3,	%l0
	brlez,a	%g1,	loop_129
	xor	%g7,	%o2,	%i1
	bleu,pn	%xcc,	loop_130
	add	%o0,	%l6,	%g6
loop_129:
	membar	0x23
	sethi	0x15A6,	%o4
loop_130:
	xnorcc	%g3,	0x01F3,	%i2
	fbue	%fcc0,	loop_131
	edge8ln	%i3,	%i7,	%l3
	udivcc	%o6,	0x01C5,	%l5
	srax	%o5,	%i5,	%g2
loop_131:
	bleu	loop_132
	membar	0x38
	srlx	%l2,	%o7,	%l4
	nop 	! 	tcs	%xcc,	0x5 changed by convert2hboot
loop_132:
	fbul	%fcc1,	loop_133
	fbule,a	%fcc3,	loop_134
	andncc	%i0,	%l1,	%i6
	fmovsleu	%xcc,	%f8,	%f7
loop_133:
	fmovrdlez	%g4,	%f0,	%f20
loop_134:
	smulcc	%o1,	%i4,	%g5
	movrlz	%o3,	0x0B8,	%g1
	nop 	! 	tsubcc	%l0,	0x09FC,	%o2 changed by convert2hboot
	subccc	%i1,	0x1630,	%o0
	fmovrse	%g7,	%f5,	%f22
	edge16ln	%g6,	%o4,	%l6
	fbl,a	%fcc0,	loop_135
	subccc	%g3,	%i3,	%i7
	nop 	! 	tneg	%icc,	0x7 changed by convert2hboot
	orn	%l3,	0x0646,	%i2
loop_135:
	bvc	loop_136
	fbo	%fcc2,	loop_137
	udiv	%o6,	0x1958,	%l5
	nop
	setx	loop_138,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_136:
	edge16	%o5,	%i5,	%g2
loop_137:
	bvs	loop_139
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
loop_138:
	orncc	%o7,	0x0173,	%l2
	std	%l4,	[%l7 + 0x50]
loop_139:
	fmovdg	%xcc,	%f14,	%f1
	fnors	%f5,	%f10,	%f11
	fmovsgu	%icc,	%f14,	%f20
	fxnor	%f10,	%f30,	%f18
	edge16	%i0,	%l1,	%i6
	fpsub32	%f0,	%f6,	%f12
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	fmovdcc	%icc,	%f12,	%f21
	fpsub32	%f18,	%f22,	%f16
	xorcc	%g4,	%i4,	%o1
	sra	%o3,	%g5,	%l0
	mulscc	%o2,	0x118B,	%g1
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	bneg	loop_140
	nop
	set	0x2C, %i5
	stw	%i1,	[%l7 + %i5]
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
loop_140:
	xor	%g7,	0x1867,	%o0
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x5C] %asi,	%f19
	movle	%xcc,	%o4,	%l6
	movge	%icc,	%g6,	%i3
	nop
	setx	loop_141,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	mova	%icc,	%i7,	%l3
	ba	%xcc,	loop_142
	sdivx	%g3,	0x1FDD,	%o6
loop_141:
	popc	0x14E6,	%l5
	andn	%i2,	%i5,	%o5
loop_142:
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	edge8l	%g2,	%l2,	%o7
	xnorcc	%i0,	%l4,	%i6
	addcc	%l1,	0x19A7,	%g4
	movrlez	%o1,	0x1B4,	%o3
	fba,a	%fcc3,	loop_143
	sdivx	%i4,	0x09ED,	%g5
	ldub	[%l7 + 0x4A],	%l0
	edge8ln	%g1,	%i1,	%g7
loop_143:
	fmovs	%f23,	%f2
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	sdivx	%o0,	0x1A6A,	%o2
	ldd	[%l7 + 0x48],	%f12
	xor	%o4,	%l6,	%g6
	movrne	%i7,	0x148,	%i3
	popc	0x08D5,	%g3
	fcmped	%fcc1,	%f24,	%f2
	ldsw	[%l7 + 0x34],	%o6
	srax	%l3,	0x13,	%l5
	bgu	%icc,	loop_144
	subccc	%i2,	0x1BEA,	%i5
	movn	%icc,	%g2,	%o5
	move	%icc,	%o7,	%l2
loop_144:
	sdiv	%i0,	0x111F,	%i6
	nop
	set	0x5B, %g7
	ldstub	[%l7 + %g7],	%l1
	fpsub16	%f18,	%f14,	%f18
	sethi	0x1149,	%g4
	fmul8x16au	%f9,	%f20,	%f0
	movl	%xcc,	%o1,	%o3
	nop 	! 	tsubcc	%i4,	0x0FA9,	%g5 changed by convert2hboot
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	fmovspos	%icc,	%f1,	%f27
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	move	%icc,	%i1,	%g7
	fmovrdgz	%g1,	%f8,	%f28
	std	%o0,	[%l7 + 0x20]
	ldsh	[%l7 + 0x24],	%o4
	nop
	setx	loop_145,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fmul8x16au	%f30,	%f1,	%f22
	fmovdcs	%icc,	%f6,	%f10
	fpadd32	%f12,	%f2,	%f28
loop_145:
	fnot2s	%f0,	%f7
	membar	#Sync
	set	0x40, %g6
	nop	 ! 	ldda	[%l7 + %g6] 0xf0,	%f16 ASI use changed by convert2hboot
	nop 	! 	sir	0x1D71 changed by convert2hboot
	wr	%g0,	0x04,	%asi
	fxnors	%f0,	%f19,	%f31
	nop
	setx loop_146, %l0, %l1
	jmpl %l1, %g6
	sethi	0x0AED,	%i7
	set	0x30, %l4
	nop	 ! 	prefetcha	[%l7 + %l4] 0x0c,	 0x0 ASI use changed by convert2hboot
loop_146:
	bpos,pt	%xcc,	loop_147
	fornot2	%f14,	%f8,	%f26
	popc	0x02DC,	%i3
	set	0x40, %o2
	nop	 ! 	ldda	[%l7 + %o2] 0x19,	%f16 ASI use changed by convert2hboot
loop_147:
	srax	%g3,	%o6,	%l5
	siam	0x7
	fxnors	%f9,	%f26,	%f21
	wr	%g0,	0xea,	%asi
	membar	#Sync
	bl,a,pt	%xcc,	loop_148
	srl	%l3,	%i5,	%g2
	fbne,a	%fcc0,	loop_149
	srlx	%o5,	%l2,	%o7
loop_148:
	siam	0x2
	nop 	! 	ta	%xcc,	0x1 changed by convert2hboot
loop_149:
	move	%xcc,	%i6,	%l1
	fbuge	%fcc2,	loop_150
	sethi	0x1703,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%icc,	%f4,	%f18
loop_150:
	or	%i0,	%o1,	%i4
	wr	%g0,	0x89,	%asi
	sta	%f9,	[%l7 + 0x50] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,a	%icc,	loop_151
	fnot2s	%f27,	%f18
	alignaddr	%g5,	%l4,	%l0
	wr	%g0,	0xe2,	%asi
	membar	#Sync
loop_151:
	fmovdg	%xcc,	%f28,	%f11
	fbe,a	%fcc2,	loop_152
	movgu	%xcc,	%g7,	%i1
	andcc	%g1,	0x12E1,	%o0
	bg,pn	%xcc,	loop_153
loop_152:
	nop 	! 	tg	%xcc,	0x3 changed by convert2hboot
	xnor	%o4,	%g6,	%l6
	brlez,a	%i7,	loop_154
loop_153:
	umul	%i3,	0x00B0,	%o2
	fmovsg	%xcc,	%f1,	%f24
	fbo,a	%fcc2,	loop_155
loop_154:
	faligndata	%f20,	%f14,	%f18
	add	%g3,	0x117F,	%l5
	addccc	%i2,	%l3,	%i5
loop_155:
	fbne,a	%fcc2,	loop_156
	orcc	%g2,	0x03CF,	%o5
	edge32	%l2,	%o6,	%i6
	addccc	%l1,	%g4,	%o7
loop_156:
	fpadd16	%f24,	%f18,	%f4
	xorcc	%o1,	0x1E31,	%i0
	movcs	%xcc,	%i4,	%l4
	brlz,a	%l0,	loop_157
	fandnot2s	%f20,	%f22,	%f7
	wr	%g0,	0x11,	%asi
loop_157:
	nop
	membar	#Sync
	set	0x40, %o1
	nop	 ! 	ldda	[%l7 + %o1] 0xf0,	%f16 ASI use changed by convert2hboot
	edge8n	%o3,	%i1,	%g1
	movgu	%xcc,	%g7,	%o0
	umul	%o4,	%l6,	%i7
	nop 	! 	tgu	%icc,	0x4 changed by convert2hboot
	movrne	%i3,	0x26D,	%o2
	movrgez	%g3,	0x17E,	%l5
	swap	[%l7 + 0x68],	%i2
	edge8	%g6,	%i5,	%g2
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
	sdivcc	%l3,	0x0274,	%o5
	wr	%g0,	0x4f,	%asi
	fbg	%fcc0,	loop_158
	fmovscs	%icc,	%f16,	%f29
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
	fbge,a	%fcc1,	loop_159
loop_158:
	fmovdneg	%xcc,	%f18,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x24, %o4
	stw	%l2,	[%l7 + %o4]
loop_159:
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	fmovsge	%xcc,	%f18,	%f8
	bn	%icc,	loop_160
	umul	%l1,	%g4,	%i6
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	mulscc	%o1,	%i0,	%o7
loop_160:
	xnor	%i4,	0x1F1F,	%l0
	addcc	%l4,	%o3,	%g5
	srl	%g1,	%g7,	%o0
	ldsh	[%l7 + 0x64],	%o4
	ldd	[%l7 + 0x08],	%i6
	edge32ln	%i1,	%i7,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f26,	%f23
	bg,pt	%icc,	loop_161
	fsrc2	%f8,	%f26
	nop
	set	0x4C, %g5
	ldsw	[%l7 + %g5],	%g3
	sth	%l5,	[%l7 + 0x6C]
loop_161:
	nop
	set	0x50, %l3
	sta	%f13,	[%l7 + %l3] 0x18
	addcc	%i2,	0x06BE,	%g6
	movle	%icc,	%i5,	%g2
	edge32l	%i3,	%o5,	%l3
	ldub	[%l7 + 0x23],	%o6
	bcs	loop_162
	edge16l	%l1,	%l2,	%g4
	movre	%i6,	%o1,	%o7
loop_162:
	movrne	%i0,	%l0,	%i4
	fbu	%fcc0,	loop_163
	fblg	%fcc0,	loop_164
	edge8ln	%o3,	%g5,	%l4
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x48] %asi,	%f10
loop_163:
	xor	%g7,	%g1,	%o4
loop_164:
	mulx	%o0,	0x007C,	%l6
	umulcc	%i7,	%i1,	%o2
	movrgz	%l5,	%g3,	%i2
	bgu,a	loop_165
	for	%f28,	%f0,	%f2
	addccc	%g6,	%g2,	%i3
	nop 	! 	tvs	%xcc,	0x6 changed by convert2hboot
loop_165:
	brlz	%i5,	loop_166
	fmovsne	%xcc,	%f1,	%f24
	bvc,a	%xcc,	loop_167
	popc	%o5,	%l3
loop_166:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o6,	%l2,	%l1
loop_167:
	edge16l	%g4,	%i6,	%o7
	movne	%icc,	%o1,	%l0
	sll	%i4,	%o3,	%g5
	sra	%i0,	%g7,	%g1
	fmovdcs	%xcc,	%f3,	%f12
	set	0x68, %g4
	nop	 ! 	lduwa	[%l7 + %g4] 0x04,	%o4 ASI use changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x2 changed by convert2hboot
	brlz	%o0,	loop_168
	fandnot1	%f16,	%f8,	%f26
	stw	%l4,	[%l7 + 0x60]
	xnorcc	%i7,	0x155D,	%i1
loop_168:
	xorcc	%l6,	0x1E56,	%l5
	nop
	set	0x70, %i0
	stx	%o2,	[%l7 + %i0]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x10],	%f2
	orn	%i2,	%g3,	%g6
	fmovde	%icc,	%f19,	%f26
	subcc	%i3,	0x1613,	%i5
	movgu	%xcc,	%o5,	%g2
	movrgez	%o6,	%l3,	%l2
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
	be	loop_169
	smul	%g4,	0x13C2,	%l1
	brlez,a	%i6,	loop_170
	edge32ln	%o1,	%l0,	%i4
loop_169:
	fmul8x16al	%f25,	%f28,	%f8
	udiv	%o3,	0x1BD4,	%o7
loop_170:
	st	%f12,	[%l7 + 0x14]
	xor	%i0,	0x1C14,	%g7
	sdiv	%g1,	0x13AE,	%g5
	edge8	%o0,	%l4,	%i7
	sub	%o4,	%i1,	%l5
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
	srl	%o2,	%i2,	%g3
	andncc	%g6,	%i3,	%l6
	mulx	%o5,	0x0D82,	%g2
	popc	%i5,	%o6
	edge16ln	%l3,	%g4,	%l1
	andncc	%l2,	%o1,	%i6
	call	loop_171
	movgu	%icc,	%i4,	%o3
	st	%f31,	[%l7 + 0x64]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_171:
	nop 	! 	ta	%xcc,	0x0 changed by convert2hboot
	bvs	loop_172
	add	%o7,	%i0,	%g7
	brgez	%l0,	loop_173
	andn	%g5,	0x0D26,	%o0
loop_172:
	fxnors	%f7,	%f5,	%f20
	fmuld8sux16	%f24,	%f12,	%f6
loop_173:
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	popc	0x10AB,	%g1
	and	%l4,	%i7,	%i1
	subccc	%o4,	0x12DB,	%o2
	ldd	[%l7 + 0x40],	%i2
	fxnor	%f6,	%f6,	%f8
	fmovdvs	%icc,	%f29,	%f29
	edge8	%g3,	%l5,	%i3
	movl	%xcc,	%g6,	%l6
	xnorcc	%o5,	%i5,	%g2
	movpos	%icc,	%l3,	%o6
	edge8ln	%g4,	%l1,	%l2
	alignaddr	%o1,	%i6,	%o3
	mulx	%i4,	0x0581,	%i0
	ldsb	[%l7 + 0x27],	%g7
	std	%f14,	[%l7 + 0x38]
	stx	%l0,	[%l7 + 0x20]
	movrgez	%o7,	0x0D6,	%o0
	orncc	%g5,	0x19A7,	%l4
	bpos,a	%xcc,	loop_174
	fpadd16s	%f29,	%f28,	%f22
	fble,a	%fcc1,	loop_175
	fmovdpos	%icc,	%f28,	%f4
loop_174:
	smul	%g1,	%i7,	%o4
	bpos	loop_176
loop_175:
	membar	0x6D
	addc	%o2,	0x0283,	%i2
	orcc	%g3,	0x0A76,	%i1
loop_176:
	orncc	%l5,	%g6,	%i3
	set	0x3E, %g1
	nop	 ! 	ldsba	[%l7 + %g1] 0x19,	%o5 ASI use changed by convert2hboot
	bn,a	loop_177
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	sll	%l6,	0x10,	%i5
	or	%g2,	0x0A37,	%o6
loop_177:
	fmovsne	%icc,	%f4,	%f1
	fmul8sux16	%f26,	%f2,	%f26
	ldstub	[%l7 + 0x1A],	%g4
	srlx	%l3,	0x1E,	%l1
	umul	%l2,	%o1,	%i6
	edge32n	%o3,	%i4,	%i0
	brz	%l0,	loop_178
	addcc	%g7,	0x1F05,	%o7
	be,a	loop_179
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
loop_178:
	fcmped	%fcc0,	%f28,	%f26
	fbe,a	%fcc1,	loop_180
loop_179:
	alignaddrl	%g5,	%o0,	%g1
	movpos	%xcc,	%l4,	%o4
	orn	%i7,	%o2,	%i2
loop_180:
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	movrlz	%i1,	0x2F9,	%g3
	fmovsneg	%xcc,	%f16,	%f25
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	nop	 ! 	casxa	[%l6] 0x88,	%g6,	%l5 ASI use changed by convert2hboot
	mova	%icc,	%i3,	%o5
	movge	%icc,	%l6,	%i5
	wr	%g0,	0x0c,	%asi
	sta	%f25,	[%l7 + 0x14] %asi
	movne	%icc,	%g2,	%o6
	movpos	%xcc,	%l3,	%g4
	sdivcc	%l1,	0x1AD4,	%l2
	edge16l	%i6,	%o1,	%o3
	fbg	%fcc0,	loop_181
	edge32ln	%i0,	%i4,	%g7
	movrlz	%o7,	%l0,	%o0
loop_181:
	subcc	%g1,	0x1E5D,	%g5
	srl	%l4,	%i7,	%o4
	fbue,a	%fcc2,	loop_182
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	set	0x40, %l2
	nop	 ! 	stda	%f16,	[%l7 + %l2] 0x18 ASI use changed by convert2hboot
loop_182:
	ldx	[%l7 + 0x50],	%o2
	smulcc	%i1,	%g3,	%i2
	movpos	%xcc,	%g6,	%i3
	movrne	%o5,	0x132,	%l6
	membar	0x60
	fmovd	%f28,	%f0
	nop 	! 	tpos	%xcc,	0x4 changed by convert2hboot
	fbn	%fcc0,	loop_183
	nop 	! 	tg	%xcc,	0x3 changed by convert2hboot
	edge8l	%l5,	%i5,	%g2
	movge	%xcc,	%l3,	%o6
loop_183:
	orn	%g4,	%l1,	%l2
	sdivx	%o1,	0x1FE0,	%o3
	bneg,a,pt	%xcc,	loop_184
	xnor	%i6,	%i4,	%i0
	movrlez	%o7,	%g7,	%o0
	mova	%xcc,	%g1,	%l0
loop_184:
	movrgez	%g5,	0x36E,	%l4
	set	0x1F, %l6
	nop	 ! 	stba	%i7,	[%l7 + %l6] 0x81 ASI use changed by convert2hboot
	movgu	%icc,	%o4,	%i1
	fmovdneg	%icc,	%f20,	%f3
	mulx	%g3,	0x1204,	%o2
	fxor	%f4,	%f12,	%f10
	wr	%g0,	0x0c,	%asi
	sta	%f1,	[%l7 + 0x30] %asi
	orn	%g6,	0x08CE,	%i2
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	fmovsn	%xcc,	%f3,	%f18
	orn	%i3,	%o5,	%l6
	movrlez	%i5,	0x1AF,	%g2
	srax	%l5,	%l3,	%g4
	bl	%xcc,	loop_185
	srax	%o6,	0x0D,	%l1
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	fmovs	%f31,	%f6
loop_185:
	lduh	[%l7 + 0x44],	%o1
	xnorcc	%l2,	0x0ADA,	%o3
	fmovscs	%xcc,	%f8,	%f17
	fbne	%fcc1,	loop_186
	bvc,a,pn	%icc,	loop_187
	xor	%i4,	0x129A,	%i0
	bcs,pt	%xcc,	loop_188
loop_186:
	movvc	%xcc,	%i6,	%g7
loop_187:
	bgu	%xcc,	loop_189
	movg	%xcc,	%o0,	%g1
loop_188:
	fxors	%f11,	%f28,	%f0
	movrgez	%l0,	0x24F,	%g5
loop_189:
	be,a,pn	%xcc,	loop_190
	orncc	%l4,	%o7,	%o4
	edge16ln	%i7,	%i1,	%o2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
loop_190:
	nop
	set	0x64, %g2
	nop	 ! 	stwa	%i2,	[%l7 + %g2] 0x14 ASI use changed by convert2hboot
	nop 	! 	tgu	%xcc,	0x4 changed by convert2hboot
	bcc	%icc,	loop_191
	fbule,a	%fcc0,	loop_192
	movpos	%icc,	%o5,	%l6
	bshuffle	%f4,	%f0,	%f30
loop_191:
	nop 	! 	tsubcc	%i3,	0x1BBD,	%i5 changed by convert2hboot
loop_192:
	mulx	%l5,	0x19A3,	%g2
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	bn,a,pt	%icc,	loop_193
	sethi	0x1CC6,	%l3
	fmovsleu	%xcc,	%f14,	%f1
	sdivx	%o6,	0x022C,	%g4
loop_193:
	movrne	%l1,	0x017,	%l2
	edge8l	%o1,	%i4,	%o3
	popc	0x038C,	%i0
	membar	0x0E
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	movrlz	%i6,	%g7,	%g1
	srl	%l0,	0x08,	%g5
	xnorcc	%l4,	%o0,	%o7
	movleu	%xcc,	%o4,	%i7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x04,	%asi
	nop	 ! 	casa	[%l6] 0x04,	%i1,	%g3 ASI use changed by convert2hboot
	std	%f0,	[%l7 + 0x60]
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	movge	%xcc,	%o2,	%g6
	addc	%i2,	0x1DE2,	%o5
	fmul8x16	%f8,	%f20,	%f22
	fcmple16	%f6,	%f30,	%i3
	srax	%l6,	%i5,	%l5
	edge8l	%l3,	%g2,	%o6
	stw	%l1,	[%l7 + 0x20]
	movleu	%xcc,	%l2,	%g4
	bge	loop_194
	bg,a	%xcc,	loop_195
	nop 	! 	tneg	%icc,	0x0 changed by convert2hboot
	std	%f18,	[%l7 + 0x28]
loop_194:
	mova	%icc,	%i4,	%o1
loop_195:
	movvc	%xcc,	%o3,	%i0
	sll	%g7,	0x1E,	%i6
	subccc	%g1,	%l0,	%l4
	fmovdge	%icc,	%f5,	%f30
	bcs,pn	%icc,	loop_196
	andn	%o0,	0x16A9,	%g5
	ba,a	%icc,	loop_197
	udiv	%o7,	0x118E,	%i7
loop_196:
	nop
	set	0x40, %l0
	nop	 ! 	stda	%f16,	[%l7 + %l0] 0xf0 ASI use changed by convert2hboot
	membar	#Sync
loop_197:
	fmovrse	%i1,	%f17,	%f14
	fbuge,a	%fcc1,	loop_198
	fmovsneg	%xcc,	%f23,	%f15
	movgu	%icc,	%o4,	%g3
	fmovsvs	%icc,	%f16,	%f16
loop_198:
	fmovsl	%xcc,	%f12,	%f21
	nop 	! 	taddcctv	%o2,	0x0915,	%i2 changed by convert2hboot
	nop 	! 	taddcctv	%o5,	0x154F,	%g6 changed by convert2hboot
	alignaddrl	%l6,	%i5,	%l5
	movpos	%icc,	%i3,	%g2
	popc	%l3,	%o6
	mulscc	%l1,	0x18F5,	%g4
	set	0x2A, %i4
	nop	 ! 	ldsba	[%l7 + %i4] 0x18,	%i4 ASI use changed by convert2hboot
	edge32n	%l2,	%o1,	%o3
	membar	0x28
	movle	%icc,	%g7,	%i0
	popc	0x007C,	%i6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	movl	%icc,	%o0,	%g5
	nop 	! 	tsubcc	%o7,	0x0C0F,	%i7 changed by convert2hboot
	sdivcc	%i1,	0x04E1,	%o4
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	fexpand	%f3,	%f10
	set	0x18, %i1
	nop	 ! 	stxa	%g3,	[%l7 + %i1] 0x81 ASI use changed by convert2hboot
	fpsub32s	%f7,	%f10,	%f21
	wr	%g0,	0x4f,	%asi
	fbuge,a	%fcc0,	loop_199
	nop 	! 	tsubcc	%i2,	%o5,	%g6 changed by convert2hboot
	brlz,a	%o2,	loop_200
	movvs	%icc,	%l6,	%l5
loop_199:
	movvs	%xcc,	%i5,	%g2
	st	%f26,	[%l7 + 0x10]
loop_200:
	subccc	%l3,	0x1D0E,	%i3
	sethi	0x0D86,	%l1
	umulcc	%o6,	0x102F,	%i4
	subc	%l2,	%o1,	%g4
	fmovrse	%o3,	%f22,	%f24
	fxnors	%f9,	%f14,	%f18
	edge32n	%g7,	%i6,	%g1
	fbule,a	%fcc2,	loop_201
	std	%l4,	[%l7 + 0x18]
	movle	%icc,	%i0,	%g5
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
loop_201:
	movre	%o7,	%i7,	%o0
	fones	%f6
	wr	%g0,	0x80,	%asi
	sta	%f31,	[%l7 + 0x78] %asi
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
	sub	%i1,	%o4,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	movl	%xcc,	%l0,	%g6
	nop 	! 	tvc	%xcc,	0x0 changed by convert2hboot
	umulcc	%o2,	%l6,	%l5
	sethi	0x126F,	%o5
	fpsub16	%f4,	%f26,	%f12
	set	0x64, %i2
	nop	 ! 	lduha	[%l7 + %i2] 0x19,	%g2 ASI use changed by convert2hboot
	alignaddr	%l3,	%i5,	%i3
	ba,a,pt	%xcc,	loop_202
	movgu	%icc,	%l1,	%o6
	srlx	%i4,	0x1E,	%o1
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
loop_202:
	xor	%l2,	0x1718,	%o3
	fcmpne32	%f22,	%f10,	%g4
	movvc	%icc,	%g7,	%i6
	set	0x46, %i7
	nop	 ! 	stha	%l4,	[%l7 + %i7] 0x18 ASI use changed by convert2hboot
	brlez	%i0,	loop_203
	nop 	! 	taddcc	%g1,	0x10A6,	%o7 changed by convert2hboot
	fmovsn	%xcc,	%f31,	%f8
	ba	loop_204
loop_203:
	fmovrsgz	%g5,	%f20,	%f18
	movrgez	%o0,	%i7,	%o4
	addcc	%g3,	%i1,	%i2
loop_204:
	ldx	[%l7 + 0x20],	%g6
	fmovsa	%xcc,	%f8,	%f21
	bl,pn	%icc,	loop_205
	fmovsvs	%xcc,	%f10,	%f2
	bne	loop_206
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
loop_205:
	orcc	%o2,	0x1225,	%l0
	nop 	! 	tsubcctv	%l5,	0x1101,	%o5 changed by convert2hboot
loop_206:
	fcmpgt16	%f6,	%f24,	%l6
	sll	%l3,	0x06,	%i5
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	fmul8x16	%f28,	%f22,	%f16
	set	0x6C, %o0
	nop	 ! 	swapa	[%l7 + %o0] 0x81,	%i3 ASI use changed by convert2hboot
	nop 	! 	sir	0x1B71 changed by convert2hboot
	fcmpes	%fcc1,	%f18,	%f23
	pdist	%f24,	%f10,	%f12
	brlz	%l1,	loop_207
	fandnot1	%f26,	%f30,	%f14
	smul	%o6,	%i4,	%o1
	smulcc	%l2,	%g2,	%o3
loop_207:
	bn,a	%xcc,	loop_208
	udivcc	%g7,	0x1C98,	%g4
	fbue	%fcc3,	loop_209
	fblg	%fcc1,	loop_210
loop_208:
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	add	%l7,	0x10,	%l6
	wr	%g0,	0x11,	%asi
loop_209:
	orcc	%g1,	%i0,	%o7
loop_210:
	popc	%o0,	%i7
	alignaddr	%o4,	%g3,	%i1
	edge8ln	%g5,	%i2,	%o2
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
	fblg,a	%fcc3,	loop_211
	addc	%l0,	%g6,	%l5
	xnorcc	%o5,	0x0AB7,	%l6
	sdivcc	%l3,	0x0EA9,	%i5
loop_211:
	subccc	%i3,	%o6,	%i4
	xor	%l1,	%l2,	%g2
	wr	%g0,	0x81,	%asi
	nop 	! 	tsubcctv	%g7,	0x14B8,	%g4 changed by convert2hboot
	fxors	%f10,	%f16,	%f31
	bg	loop_212
	bl	loop_213
	fmovsvc	%icc,	%f12,	%f16
	orn	%o1,	%l4,	%g1
loop_212:
	movvc	%icc,	%i0,	%o7
loop_213:
	edge16ln	%o0,	%i6,	%i7
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	fmovdvs	%xcc,	%f15,	%f19
	bvc	%xcc,	loop_214
	fmovdcc	%xcc,	%f6,	%f15
	siam	0x7
	fbe,a	%fcc0,	loop_215
loop_214:
	udiv	%g3,	0x0705,	%o4
	udivx	%i1,	0x06D0,	%g5
	array32	%o2,	%i2,	%g6
loop_215:
	edge32ln	%l0,	%o5,	%l5
	fzero	%f30
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
	bn,a,pt	%icc,	loop_216
	alignaddrl	%l6,	%i5,	%l3
	nop 	! 	tsubcctv	%o6,	0x1130,	%i4 changed by convert2hboot
	mulscc	%i3,	%l1,	%l2
loop_216:
	fzeros	%f20
	fmovsle	%icc,	%f31,	%f13
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	sra	%g2,	%g7,	%g4
	edge16n	%o3,	%o1,	%g1
	stw	%i0,	[%l7 + 0x40]
	smul	%l4,	%o7,	%i6
	fornot1	%f14,	%f12,	%f2
	edge32ln	%o0,	%i7,	%g3
	xor	%o4,	%g5,	%i1
	sll	%i2,	%g6,	%o2
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	sra	%l0,	0x13,	%l5
	membar	0x31
	fcmped	%fcc3,	%f6,	%f18
	fxors	%f19,	%f0,	%f3
	fmovsgu	%xcc,	%f14,	%f19
	nop 	! 	taddcctv	%o5,	%l6,	%i5 changed by convert2hboot
	fmovsg	%xcc,	%f29,	%f22
	subcc	%o6,	0x0D70,	%i4
	brlz	%i3,	loop_217
	fmovsn	%icc,	%f26,	%f4
	fcmpgt32	%f10,	%f22,	%l3
	membar	0x1D
loop_217:
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
	mulscc	%l2,	%l1,	%g7
	brlez,a	%g2,	loop_218
	ld	[%l7 + 0x70],	%f20
	addccc	%g4,	%o3,	%o1
	wr	%g0,	0x89,	%asi
loop_218:
	bge	loop_219
	membar	0x48
	sdivcc	%i0,	0x0061,	%l4
	mova	%icc,	%o7,	%o0
loop_219:
	sethi	0x06E3,	%i6
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
	udivx	%g3,	0x0FB2,	%o4
	umul	%g5,	0x1D0C,	%i7
	array8	%i2,	%i1,	%g6
	srl	%l0,	0x0A,	%o2
	popc	%o5,	%l5
	fmovsl	%icc,	%f14,	%f21
	ld	[%l7 + 0x08],	%f7
	movrne	%l6,	%i5,	%o6
	edge32n	%i3,	%i4,	%l2
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	bge	%xcc,	loop_220
	nop
	set	0x32, %o6
	sth	%l1,	[%l7 + %o6]
	xnorcc	%l3,	0x0C0D,	%g2
	fbge,a	%fcc3,	loop_221
loop_220:
	subccc	%g7,	0x1375,	%g4
	stw	%o3,	[%l7 + 0x24]
	bl,a,pn	%icc,	loop_222
loop_221:
	edge8l	%g1,	%o1,	%l4
	fpadd32	%f12,	%f4,	%f6
	sethi	0x15FE,	%o7
loop_222:
	edge32	%o0,	%i0,	%i6
	fornot1s	%f12,	%f31,	%f9
	fornot1s	%f23,	%f8,	%f14
	ldstub	[%l7 + 0x20],	%g3
	edge16	%g5,	%o4,	%i7
	xorcc	%i2,	0x0660,	%i1
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
	sll	%l0,	0x04,	%o2
	alignaddr	%o5,	%g6,	%l5
	flush	%l7 + 0x54
	bvc	%icc,	loop_223
	fbuge	%fcc1,	loop_224
	fpadd32	%f12,	%f30,	%f18
	sra	%l6,	0x1B,	%o6
loop_223:
	udiv	%i5,	0x1205,	%i4
loop_224:
	fpsub16s	%f10,	%f26,	%f7
	addc	%i3,	%l1,	%l2
	movne	%xcc,	%l3,	%g2
	brz,a	%g7,	loop_225
	edge8	%o3,	%g1,	%o1
	movrlez	%l4,	%g4,	%o0
	fmul8x16al	%f18,	%f8,	%f24
loop_225:
	movrlez	%o7,	%i0,	%i6
	set	0x10, %o3
	nop	 ! 	ldsha	[%l7 + %o3] 0x89,	%g3 ASI use changed by convert2hboot
	fpsub32	%f24,	%f4,	%f22
	movne	%icc,	%g5,	%o4
	array16	%i2,	%i1,	%l0
	orcc	%o2,	0x0B18,	%i7
	ld	[%l7 + 0x5C],	%f21
	brlez	%g6,	loop_226
	addccc	%o5,	%l5,	%l6
	movpos	%xcc,	%i5,	%i4
	wr	%g0,	0x2f,	%asi
	membar	#Sync
loop_226:
	edge8n	%l1,	%l2,	%l3
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	andncc	%o6,	%g2,	%g7
	bgu	loop_227
	array8	%g1,	%o1,	%l4
	sdivx	%g4,	0x12CD,	%o0
	smulcc	%o7,	0x12FA,	%i0
loop_227:
	edge32l	%i6,	%g3,	%g5
	and	%o4,	%i2,	%i1
	fxnor	%f20,	%f18,	%f0
	nop 	! 	tvc	%xcc,	0x3 changed by convert2hboot
	array8	%l0,	%o3,	%i7
	nop 	! 	tgu	%xcc,	0x6 changed by convert2hboot
	edge8	%o2,	%o5,	%g6
	xnor	%l5,	%l6,	%i5
	ldub	[%l7 + 0x6F],	%i4
	ld	[%l7 + 0x1C],	%f5
	movre	%l1,	0x2F0,	%l2
	xorcc	%l3,	%o6,	%g2
	fmovsvc	%xcc,	%f26,	%f11
	movrne	%g7,	0x024,	%i3
	bl,a,pn	%xcc,	loop_228
	orcc	%g1,	0x0099,	%l4
	subccc	%o1,	0x185A,	%o0
	orcc	%g4,	%i0,	%o7
loop_228:
	edge32ln	%i6,	%g5,	%g3
	smulcc	%o4,	0x1BCF,	%i2
	ldx	[%l7 + 0x10],	%i1
	fcmpeq16	%f16,	%f18,	%o3
	bl,a	%xcc,	loop_229
	fornot2s	%f25,	%f5,	%f31
	fbul,a	%fcc2,	loop_230
	mulx	%i7,	%o2,	%l0
loop_229:
	ldd	[%l7 + 0x20],	%f16
	orn	%g6,	0x01EF,	%l5
loop_230:
	movre	%l6,	0x2EE,	%o5
	edge16l	%i5,	%i4,	%l2
	or	%l3,	%o6,	%l1
	nop 	! 	tvs	%xcc,	0x6 changed by convert2hboot
	srl	%g7,	%g2,	%g1
	srlx	%l4,	0x12,	%o1
	edge8l	%i3,	%o0,	%i0
	movne	%xcc,	%o7,	%i6
	fxnor	%f10,	%f24,	%f6
	wr	%g0,	0x20,	%asi
	fmovdcc	%icc,	%f2,	%f17
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble	%fcc2,	loop_231
	edge8ln	%g3,	%o4,	%g4
	subccc	%i2,	%o3,	%i7
	fmovsg	%icc,	%f13,	%f31
loop_231:
	fnands	%f13,	%f25,	%f27
	fxor	%f4,	%f10,	%f4
	udivcc	%i1,	0x1ACC,	%o2
	siam	0x7
	wr	%g0,	0x19,	%asi
	movle	%icc,	%l0,	%l6
	fcmpgt32	%f24,	%f14,	%o5
	orcc	%l5,	%i5,	%i4
	fbue,a	%fcc1,	loop_232
	fmovs	%f11,	%f10
	nop 	! 	tneg	%xcc,	0x7 changed by convert2hboot
	ldx	[%l7 + 0x30],	%l3
loop_232:
	movle	%icc,	%l2,	%l1
	fbu	%fcc1,	loop_233
	movvs	%icc,	%o6,	%g2
	movne	%icc,	%g1,	%l4
	fpsub32s	%f0,	%f18,	%f13
loop_233:
	fmul8x16	%f10,	%f26,	%f22
	sdivx	%o1,	0x0880,	%i3
	fpadd16s	%f15,	%f24,	%f28
	sdivx	%o0,	0x0CFB,	%g7
	membar	0x1C
	movpos	%icc,	%o7,	%i0
	wr	%g0,	0x19,	%asi
	fmovs	%f4,	%f28
	fmovdcc	%icc,	%f1,	%f21
	nop 	! 	taddcctv	%g5,	0x02E0,	%g3 changed by convert2hboot
	flush	%l7 + 0x50
	nop 	! 	taddcctv	%g4,	%o4,	%o3 changed by convert2hboot
	lduw	[%l7 + 0x64],	%i2
	srl	%i7,	%o2,	%i1
	edge32n	%l0,	%l6,	%o5
	movpos	%icc,	%g6,	%i5
	movrgez	%l5,	0x3C8,	%i4
	nop 	! 	taddcctv	%l2,	0x1545,	%l1 changed by convert2hboot
	bvc	%icc,	loop_234
	xorcc	%o6,	%g2,	%g1
	fpsub32	%f20,	%f18,	%f30
	std	%l2,	[%l7 + 0x10]
loop_234:
	movg	%xcc,	%o1,	%l4
	nop
	setx loop_235, %l0, %l1
	jmpl %l1, %o0
	edge8	%i3,	%g7,	%o7
	nop
	set	0x14, %i3
	stw	%i6,	[%l7 + %i3]
	movrne	%g5,	%g3,	%i0
loop_235:
	movrlez	%o4,	0x34D,	%o3
	fmul8x16	%f31,	%f6,	%f4
	nop 	! 	tneg	%icc,	0x1 changed by convert2hboot
	umulcc	%i2,	0x146B,	%i7
	wr	%g0,	0x27,	%asi
	movrlez	%o2,	%l0,	%l6
	smul	%i1,	%g6,	%o5
	fcmple32	%f4,	%f18,	%l5
	fbne,a	%fcc3,	loop_236
	movcs	%icc,	%i4,	%l2
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	movvc	%xcc,	%i5,	%o6
loop_236:
	sra	%l1,	0x06,	%g2
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	pdist	%f2,	%f6,	%f24
	fmovda	%xcc,	%f21,	%f22
	sdivx	%l3,	0x00BB,	%g1
	movneg	%xcc,	%o1,	%o0
	ba,a,pt	%xcc,	loop_237
	fmovrslz	%l4,	%f26,	%f29
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	movrlez	%g7,	0x10D,	%i3
loop_237:
	fmovrde	%o7,	%f10,	%f30
	movrgez	%i6,	0x3FE,	%g3
	movpos	%xcc,	%g5,	%o4
	alignaddr	%i0,	%i2,	%i7
	set	0x28, %o5
	sta	%f1,	[%l7 + %o5] 0x89
	edge8	%o3,	%g4,	%l0
	sub	%l6,	0x045B,	%o2
	movre	%i1,	0x185,	%g6
	movl	%icc,	%o5,	%i4
	mulx	%l2,	0x11FE,	%l5
	nop 	! 	tneg	%icc,	0x7 changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	fsrc1	%f8,	%f12
	umulcc	%i5,	0x17FF,	%l1
	set	0x30, %i6
	nop	 ! 	ldda	[%l7 + %i6] 0x15,	%o6 ASI use changed by convert2hboot
	movgu	%xcc,	%l3,	%g1
	srlx	%o1,	%g2,	%o0
	fandnot1s	%f11,	%f29,	%f11
	edge16l	%g7,	%i3,	%l4
	bpos,a,pt	%xcc,	loop_238
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
	alignaddr	%o7,	%g3,	%g5
	call	loop_240
loop_238:
	movrne	%o4,	0x335,	%i6
loop_239:
	fmovsge	%xcc,	%f26,	%f6
	edge32n	%i0,	%i7,	%i2
loop_240:
	nop
	wr	%g0,	0x23,	%asi
	membar	#Sync
	orn	%o3,	0x0649,	%l6
	movn	%xcc,	%l0,	%i1
	fexpand	%f6,	%f16
	fbuge,a	%fcc1,	loop_241
	edge32l	%o2,	%g6,	%i4
	fmovdneg	%xcc,	%f7,	%f8
	bcc,pn	%xcc,	loop_242
loop_241:
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
	nop
	set	0x24, %l1
	ldsw	[%l7 + %l1],	%l2
loop_242:
	sethi	0x0EFA,	%o5
	fands	%f11,	%f12,	%f10
	bneg,pn	%xcc,	loop_243
	nop 	! 	tl	%icc,	0x6 changed by convert2hboot
	edge8n	%i5,	%l5,	%o6
	nop 	! 	tsubcc	%l1,	%g1,	%o1 changed by convert2hboot
loop_243:
	nop
	set	0x68, %g3
	nop	 ! 	stxa	%g2,	[%l7 + %g3] 0x19 ASI use changed by convert2hboot
	set	0x54, %l5
	lda	[%l7 + %l5] 0x80,	%f26
	popc	%o0,	%g7
	subccc	%i3,	0x100B,	%l3
	wr	%g0,	0x10,	%asi
	sdivx	%l4,	0x0386,	%g5
	fmovdn	%xcc,	%f15,	%f30
	fbug,a	%fcc1,	loop_244
	xnorcc	%g3,	0x0AA5,	%o4
	bleu,a	loop_245
	orncc	%i0,	0x13F3,	%i7
loop_244:
	nop
	wr	%g0,	0x80,	%asi
loop_245:
	fmovrslz	%i2,	%f7,	%f3
	umulcc	%i6,	0x1D80,	%g4
	movg	%icc,	%o3,	%l0
	edge32l	%i1,	%l6,	%g6
	fones	%f24
	xnor	%o2,	%i4,	%o5
	fmovdge	%xcc,	%f26,	%f8
	or	%i5,	%l5,	%o6
	edge8l	%l2,	%l1,	%g1
	ldd	[%l7 + 0x70],	%f10
	ldx	[%l7 + 0x18],	%g2
	bne,pn	%icc,	loop_246
	brgz	%o1,	loop_247
	movre	%g7,	%o0,	%l3
	brlez,a	%i3,	loop_248
loop_246:
	edge32l	%o7,	%g5,	%l4
loop_247:
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
	membar	#Sync
	wr	%g0,	0x1e,	%asi
loop_248:
	nop
	setx	loop_249,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fpack16	%f14,	%f19
	edge16	%g3,	%i0,	%o4
	edge16	%i2,	%i6,	%i7
loop_249:
	addccc	%g4,	0x1C23,	%o3
	fmovdneg	%icc,	%f26,	%f16
	mulx	%i1,	%l6,	%l0
	udiv	%g6,	0x0230,	%i4
	movgu	%xcc,	%o5,	%o2
	smul	%i5,	0x0FF7,	%o6
	sub	%l2,	%l5,	%g1
	array16	%l1,	%g2,	%g7
	nop 	! 	tvc	%icc,	0x5 changed by convert2hboot
	udivcc	%o1,	0x12A1,	%l3
	membar	0x2D
	edge8n	%o0,	%i3,	%o7
	sub	%g5,	%l4,	%i0
	bneg,pn	%icc,	loop_250
	fpackfix	%f10,	%f6
	nop 	! 	sir	0x0DA0 changed by convert2hboot
	ldd	[%l7 + 0x20],	%g2
loop_250:
	bcc,pn	%icc,	loop_251
	swap	[%l7 + 0x6C],	%i2
	ldd	[%l7 + 0x70],	%f12
	movrgez	%i6,	%i7,	%g4
loop_251:
	be,a	%xcc,	loop_252
	ba	%icc,	loop_253
	edge32ln	%o3,	%o4,	%i1
	fmovspos	%icc,	%f21,	%f14
loop_252:
	edge16	%l6,	%g6,	%l0
loop_253:
	sub	%i4,	%o2,	%o5
	edge16l	%o6,	%l2,	%l5
	movl	%icc,	%g1,	%l1
	edge32n	%i5,	%g7,	%o1
	fbuge	%fcc3,	loop_254
	edge16l	%g2,	%l3,	%o0
	fmovspos	%icc,	%f15,	%f16
	fornot2s	%f13,	%f27,	%f18
loop_254:
	nop
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x7C] %asi,	%f21
	movl	%icc,	%i3,	%g5
	fsrc2	%f8,	%f0
	nop
	set	0x14, %i5
	lduw	[%l7 + %i5],	%o7
	edge32	%i0,	%l4,	%g3
	movrlez	%i6,	0x35C,	%i2
	nop 	! 	tneg	%xcc,	0x2 changed by convert2hboot
	edge8l	%g4,	%i7,	%o4
	fmovrdne	%i1,	%f10,	%f20
	edge8ln	%l6,	%o3,	%g6
	nop
	setx	loop_255,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fornot2s	%f0,	%f26,	%f8
	fmovse	%xcc,	%f26,	%f12
	pdist	%f30,	%f6,	%f2
loop_255:
	fcmpd	%fcc3,	%f20,	%f22
	fpadd16s	%f13,	%f21,	%f20
	fmovrdlz	%i4,	%f26,	%f2
	fmovsl	%icc,	%f19,	%f6
	bcc	%icc,	loop_256
	edge16	%l0,	%o5,	%o2
	add	%l2,	0x1665,	%o6
	edge8ln	%g1,	%l1,	%l5
loop_256:
	movg	%icc,	%i5,	%o1
	movvc	%xcc,	%g7,	%l3
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
	stb	%o0,	[%l7 + 0x31]
	udivx	%g2,	0x1602,	%i3
	sdivcc	%o7,	0x0B8E,	%g5
	fcmps	%fcc1,	%f6,	%f7
	fandnot2	%f2,	%f12,	%f14
	movne	%xcc,	%l4,	%g3
	subccc	%i6,	0x07A1,	%i0
	move	%icc,	%g4,	%i2
	for	%f20,	%f16,	%f22
	set	0x30, %o7
	nop	 ! 	stxa	%i7,	[%l7 + %o7] 0x0c ASI use changed by convert2hboot
	edge8n	%i1,	%o4,	%l6
	udiv	%g6,	0x0348,	%o3
	fnegs	%f0,	%f26
	fones	%f3
	smulcc	%l0,	0x0305,	%i4
	fbn,a	%fcc0,	loop_257
	fcmpeq32	%f30,	%f26,	%o5
	movneg	%xcc,	%l2,	%o2
	bvc,pt	%xcc,	loop_258
loop_257:
	fble	%fcc1,	loop_259
	fmovdcs	%icc,	%f14,	%f1
	ldstub	[%l7 + 0x76],	%o6
loop_258:
	prefetch	[%l7 + 0x20],	 0x3
loop_259:
	nop
	set	0x54, %g7
	nop	 ! 	lduwa	[%l7 + %g7] 0x04,	%g1 ASI use changed by convert2hboot
	movneg	%icc,	%l5,	%i5
	edge8l	%l1,	%o1,	%l3
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
	fmovspos	%xcc,	%f31,	%f18
	nop 	! 	taddcc	%g7,	%g2,	%o0 changed by convert2hboot
	fnot2s	%f8,	%f19
	movrgz	%i3,	0x3EC,	%o7
	brgez,a	%g5,	loop_260
	fbn,a	%fcc1,	loop_261
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
loop_260:
	fmovrsgez	%i0,	%f14,	%f1
loop_261:
	edge8ln	%i6,	%i2,	%i7
	fmovsge	%icc,	%f10,	%f5
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x10] %asi,	%f30
	stb	%g4,	[%l7 + 0x4D]
	pdist	%f14,	%f6,	%f6
	bneg	%icc,	loop_262
	nop 	! 	tge	%icc,	0x4 changed by convert2hboot
	fornot1	%f8,	%f20,	%f24
	st	%f1,	[%l7 + 0x70]
loop_262:
	smulcc	%i1,	%o4,	%g6
	movgu	%icc,	%l6,	%l0
	and	%i4,	0x1D7C,	%o3
	set	0x68, %l4
	nop	 ! 	stda	%o4,	[%l7 + %l4] 0xe3 ASI use changed by convert2hboot
	membar	#Sync
	fbg,a	%fcc1,	loop_263
	fble,a	%fcc3,	loop_264
	stx	%o2,	[%l7 + 0x78]
	edge16	%l2,	%g1,	%o6
loop_263:
	xnorcc	%l5,	0x0403,	%l1
loop_264:
	sub	%i5,	%l3,	%o1
	nop 	! 	taddcc	%g7,	%g2,	%o0 changed by convert2hboot
	set	0x68, %o2
	nop	 ! 	swapa	[%l7 + %o2] 0x19,	%o7 ASI use changed by convert2hboot
	set	0x40, %g6
	nop	 ! 	ldxa	[%l7 + %g6] 0x15,	%i3 ASI use changed by convert2hboot
	movge	%icc,	%g5,	%l4
	bpos	loop_265
	fmovdleu	%xcc,	%f18,	%f15
	movvs	%xcc,	%g3,	%i0
	movrgez	%i6,	%i7,	%i2
loop_265:
	brnz,a	%g4,	loop_266
	xnorcc	%o4,	%g6,	%l6
	edge8ln	%i1,	%i4,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_266:
	nop
	set	0x2C, %o1
	nop	 ! 	swapa	[%l7 + %o1] 0x89,	%o5 ASI use changed by convert2hboot
	fbue	%fcc3,	loop_267
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
	bneg,pn	%xcc,	loop_268
	bcs,a,pt	%xcc,	loop_269
loop_267:
	nop 	! 	taddcc	%o2,	%o3,	%l2 changed by convert2hboot
	set	0x5A, %o4
	nop	 ! 	ldsba	[%l7 + %o4] 0x10,	%g1 ASI use changed by convert2hboot
loop_268:
	addcc	%o6,	0x1F23,	%l5
loop_269:
	nop
	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl
	movg	%icc,	%l3,	%o1
	movre	%g7,	%i5,	%g2
	fbg	%fcc1,	loop_270
	nop 	! 	taddcc	%o0,	%i3,	%o7 changed by convert2hboot
	mulx	%l4,	0x0273,	%g5
	fnot1s	%f15,	%f26
loop_270:
	edge16l	%i0,	%i6,	%i7
	nop 	! 	tsubcc	%g3,	0x07C2,	%g4 changed by convert2hboot
	fmovscs	%icc,	%f4,	%f10
	fnors	%f7,	%f21,	%f9
	movn	%xcc,	%i2,	%o4
	mova	%xcc,	%g6,	%l6
	fmovdge	%icc,	%f22,	%f2
	for	%f2,	%f8,	%f12
	fble,a	%fcc1,	loop_271
	edge8	%i1,	%l0,	%i4
	sdiv	%o2,	0x1C29,	%o3
	nop 	! 	tvs	%xcc,	0x2 changed by convert2hboot
loop_271:
	fba,a	%fcc2,	loop_272
	movvs	%icc,	%l2,	%o5
	udivx	%g1,	0x1C95,	%l5
	set	0x38, %g5
	nop	 ! 	swapa	[%l7 + %g5] 0x80,	%l1 ASI use changed by convert2hboot
loop_272:
	brlez,a	%o6,	loop_273
	movvc	%xcc,	%l3,	%g7
	fbule,a	%fcc2,	loop_274
	orncc	%o1,	0x0C42,	%g2
loop_273:
	nop 	! 	tsubcctv	%o0,	0x1F85,	%i5 changed by convert2hboot
	std	%i2,	[%l7 + 0x70]
loop_274:
	movgu	%xcc,	%l4,	%o7
	fmovsn	%icc,	%f14,	%f17
	st	%f19,	[%l7 + 0x68]
	nop
	setx loop_275, %l0, %l1
	jmpl %l1, %i0
	movrlz	%i6,	0x01C,	%i7
	wr	%g0,	0x22,	%asi
	membar	#Sync
loop_275:
	bcs	%xcc,	loop_276
	mulx	%g4,	%g3,	%o4
	stx	%i2,	[%l7 + 0x28]
	movre	%l6,	0x155,	%g6
loop_276:
	sll	%l0,	%i1,	%i4
	edge16	%o2,	%o3,	%l2
	fxor	%f16,	%f16,	%f26
	movne	%xcc,	%g1,	%o5
	fmovrse	%l5,	%f1,	%f24
	movrne	%o6,	0x16E,	%l1
	fmovsa	%icc,	%f18,	%f9
	nop 	! 	tsubcctv	%l3,	%g7,	%o1 changed by convert2hboot
	fpsub16s	%f5,	%f24,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x34],	%f2
	movg	%xcc,	%g2,	%o0
	andn	%i5,	0x000D,	%l4
	edge16n	%o7,	%i0,	%i3
	nop 	! 	sir	0x0FC0 changed by convert2hboot
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	std	%i6,	[%l7 + 0x38]
	membar	0x19
	fble	%fcc3,	loop_277
	fmovd	%f20,	%f6
	xnorcc	%i7,	0x0EC5,	%g5
	fble	%fcc3,	loop_278
loop_277:
	sra	%g4,	0x01,	%g3
	fandnot1s	%f22,	%f23,	%f11
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
loop_278:
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
	mova	%xcc,	%i2,	%l6
	set	0x49, %l3
	nop	 ! 	stba	%g6,	[%l7 + %l3] 0x80 ASI use changed by convert2hboot
	xnorcc	%o4,	%l0,	%i4
	mulscc	%o2,	%o3,	%l2
	nop 	! 	taddcc	%g1,	%i1,	%o5 changed by convert2hboot
	nop 	! 	tgu	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
	bvc	loop_279
	nop 	! 	taddcctv	%l5,	0x1A42,	%o6 changed by convert2hboot
	nop 	! 	taddcc	%l1,	0x0C14,	%g7 changed by convert2hboot
	movgu	%icc,	%o1,	%g2
loop_279:
	bcc,pn	%xcc,	loop_280
	ldx	[%l7 + 0x58],	%o0
	movpos	%xcc,	%i5,	%l4
	set	0x0B, %g4
	nop	 ! 	ldsba	[%l7 + %g4] 0x0c,	%l3 ASI use changed by convert2hboot
loop_280:
	movge	%xcc,	%o7,	%i0
	ldsh	[%l7 + 0x70],	%i6
	array16	%i3,	%i7,	%g4
	srax	%g5,	%i2,	%l6
	fmovsle	%xcc,	%f13,	%f26
	fmovsg	%icc,	%f30,	%f21
	popc	%g6,	%o4
	edge8ln	%g3,	%l0,	%i4
	wr	%g0,	0x0c,	%asi
	sdiv	%o2,	0x1E11,	%o3
	movrlz	%l2,	0x037,	%g1
	wr	%g0,	0x89,	%asi
	fbge,a	%fcc2,	loop_281
	fmovsvs	%xcc,	%f23,	%f23
	fbge	%fcc0,	loop_282
	sll	%i1,	0x0D,	%o6
loop_281:
	andcc	%l5,	%g7,	%l1
	fmovdleu	%icc,	%f31,	%f6
loop_282:
	andn	%o1,	%g2,	%i5
	movn	%icc,	%l4,	%o0
	fpsub32s	%f7,	%f10,	%f3
	nop
	set	0x78, %g1
	lduw	[%l7 + %g1],	%o7
	sdivx	%i0,	0x131D,	%i6
	udivcc	%i3,	0x10AB,	%l3
	fornot1	%f12,	%f28,	%f26
	fandnot1s	%f11,	%f17,	%f13
	xor	%g4,	0x0E00,	%i7
	movcs	%xcc,	%g5,	%i2
	fmovdneg	%xcc,	%f19,	%f9
	fmovrsne	%g6,	%f0,	%f15
	movcs	%xcc,	%l6,	%g3
	nop 	! 	tcs	%icc,	0x6 changed by convert2hboot
	fbug	%fcc2,	loop_283
	xnorcc	%o4,	0x070B,	%l0
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x34] %asi,	%f8
loop_283:
	nop
	set	0x30, %i0
	nop	 ! 	stda	%i4,	[%l7 + %i0] 0x88 ASI use changed by convert2hboot
	nop 	! 	tgu	%xcc,	0x6 changed by convert2hboot
	orncc	%o3,	%l2,	%g1
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
	fornot1s	%f21,	%f21,	%f13
	bleu,a	loop_284
	addc	%o2,	%i1,	%o5
	srlx	%l5,	%o6,	%l1
	bshuffle	%f12,	%f18,	%f8
loop_284:
	addc	%g7,	0x0FA4,	%g2
	fbug	%fcc0,	loop_285
	array16	%o1,	%i5,	%l4
	edge32l	%o0,	%i0,	%o7
	fcmpne32	%f30,	%f4,	%i3
loop_285:
	andncc	%l3,	%i6,	%g4
	movre	%i7,	0x15C,	%g5
	edge32ln	%g6,	%l6,	%g3
	array8	%i2,	%o4,	%i4
	fzeros	%f8
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	swap	[%l7 + 0x2C],	%l2
	fmovdneg	%xcc,	%f21,	%f10
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	fcmpne32	%f8,	%f30,	%g1
	umulcc	%l0,	0x1984,	%o2
	nop 	! 	tvs	%icc,	0x6 changed by convert2hboot
	fbuge,a	%fcc2,	loop_286
	addcc	%i1,	%o5,	%l5
	movvc	%xcc,	%l1,	%o6
	movne	%xcc,	%g7,	%o1
loop_286:
	fbl	%fcc2,	loop_287
	sub	%i5,	%g2,	%o0
	swap	[%l7 + 0x08],	%i0
	ld	[%l7 + 0x68],	%f11
loop_287:
	nop 	! 	tleu	%xcc,	0x5 changed by convert2hboot
	sdivx	%l4,	0x1F2E,	%i3
	bcc	loop_288
	addc	%l3,	0x0372,	%i6
	fnors	%f26,	%f8,	%f31
	subc	%o7,	0x1E1F,	%i7
loop_288:
	fmovsvc	%xcc,	%f27,	%f10
	alignaddrl	%g4,	%g5,	%l6
	fmovdcc	%icc,	%f8,	%f9
	brlez,a	%g6,	loop_289
	movn	%xcc,	%g3,	%o4
	nop
	setx	loop_290,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	addc	%i4,	%o3,	%l2
loop_289:
	edge8l	%i2,	%l0,	%g1
	fmovrslz	%i1,	%f25,	%f23
loop_290:
	nop
	wr	%g0,	0x10,	%asi
	movpos	%xcc,	%o5,	%l1
	wr	%g0,	0x2f,	%asi
	membar	#Sync
	fmovdvc	%icc,	%f21,	%f25
	fmovrdlez	%g7,	%f2,	%f24
	subcc	%o1,	%i5,	%o6
	nop 	! 	sir	0x11FE changed by convert2hboot
	andcc	%o0,	%i0,	%l4
	flush	%l7 + 0x68
	brgz	%g2,	loop_291
	edge32	%l3,	%i6,	%o7
	fpsub32	%f30,	%f2,	%f6
	wr	%g0,	0x11,	%asi
loop_291:
	brgz	%g4,	loop_292
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	orncc	%i3,	%g5,	%l6
	movgu	%xcc,	%g3,	%o4
loop_292:
	array8	%g6,	%o3,	%i4
	xorcc	%l2,	%i2,	%l0
	fsrc2	%f20,	%f22
	fcmps	%fcc0,	%f23,	%f5
	sub	%i1,	%g1,	%o2
	prefetch	[%l7 + 0x5C],	 0x3
	movneg	%xcc,	%o5,	%l5
	ldstub	[%l7 + 0x49],	%g7
	fbu	%fcc3,	loop_293
	udivx	%o1,	0x1430,	%l1
	nop
	setx	loop_294,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	movrlz	%i5,	%o6,	%i0
loop_293:
	nop
	wr	%g0,	0x81,	%asi
loop_294:
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	srax	%o0,	0x14,	%g2
	fmovrslez	%i6,	%f3,	%f27
	fcmped	%fcc2,	%f2,	%f0
	edge8ln	%l3,	%i7,	%g4
	movne	%xcc,	%o7,	%g5
	movvs	%icc,	%l6,	%i3
	fcmpes	%fcc0,	%f3,	%f3
	andncc	%g3,	%g6,	%o3
	movneg	%icc,	%o4,	%i4
	prefetch	[%l7 + 0x08],	 0x2
	ld	[%l7 + 0x68],	%f15
	andncc	%l2,	%i2,	%l0
	nop 	! 	tcc	%xcc,	0x2 changed by convert2hboot
	flush	%l7 + 0x20
	move	%icc,	%g1,	%i1
	fpsub16	%f16,	%f6,	%f20
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x10] %asi,	%f12
	movn	%xcc,	%o2,	%l5
	fabss	%f28,	%f18
	alignaddr	%g7,	%o5,	%l1
	nop 	! 	taddcctv	%i5,	%o1,	%i0 changed by convert2hboot
	set	0x0E, %l6
	nop	 ! 	lduha	[%l7 + %l6] 0x18,	%l4 ASI use changed by convert2hboot
	set	0x28, %g2
	nop	 ! 	lduha	[%l7 + %g2] 0x04,	%o0 ASI use changed by convert2hboot
	movleu	%icc,	%o6,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l3,	%i6,	%g4
	set	0x40, %l2
	nop	 ! 	stda	%f0,	[%l7 + %l2] 0xf8 ASI use changed by convert2hboot
	membar	#Sync
	udivx	%o7,	0x0C3D,	%g5
	xorcc	%i7,	0x0687,	%l6
	fmovdvc	%icc,	%f30,	%f0
	wr	%g0,	0x88,	%asi
	set	0x2B, %l0
	nop	 ! 	ldsba	[%l7 + %l0] 0x18,	%i3 ASI use changed by convert2hboot
	be,a,pn	%icc,	loop_295
	fpadd32s	%f31,	%f16,	%f8
	fblg,a	%fcc2,	loop_296
	nop 	! 	tpos	%icc,	0x4 changed by convert2hboot
loop_295:
	faligndata	%f22,	%f14,	%f10
	srl	%g6,	%o4,	%o3
loop_296:
	bvs,a,pt	%xcc,	loop_297
	movvs	%xcc,	%i4,	%l2
	fbule,a	%fcc3,	loop_298
	nop 	! 	tsubcctv	%l0,	0x0D7C,	%i2 changed by convert2hboot
loop_297:
	andcc	%g1,	%i1,	%l5
	array32	%g7,	%o5,	%l1
loop_298:
	movrlez	%o2,	%i5,	%i0
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	edge32ln	%l4,	%o1,	%o6
	fpmerge	%f29,	%f2,	%f18
	array32	%o0,	%g2,	%l3
	bvs,a,pn	%icc,	loop_299
	fmovrsne	%i6,	%f24,	%f19
	andcc	%o7,	%g4,	%i7
	fsrc2	%f22,	%f16
loop_299:
	and	%g5,	%l6,	%g3
	wr	%g0,	0x80,	%asi
	fmul8x16al	%f7,	%f17,	%f14
	edge32ln	%o4,	%i3,	%o3
	movrgz	%i4,	%l0,	%l2
	movre	%g1,	%i2,	%i1
	smulcc	%g7,	%o5,	%l5
	bcc,pt	%xcc,	loop_300
	stb	%l1,	[%l7 + 0x6F]
	fmovrsne	%i5,	%f1,	%f31
	fmovse	%xcc,	%f28,	%f11
loop_300:
	fbl,a	%fcc2,	loop_301
	nop
	setx	loop_302,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	edge8ln	%o2,	%l4,	%i0
	fxnor	%f22,	%f28,	%f4
loop_301:
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
loop_302:
	add	%o6,	%o0,	%g2
	movpos	%xcc,	%l3,	%i6
	set	0x60, %i4
	nop	 ! 	stxa	%o7,	[%l7 + %i4] 0xea ASI use changed by convert2hboot
	membar	#Sync
	edge32n	%g4,	%i7,	%o1
	set	0x160, %i2
	nop 	! 	nop 	! 	nop	 ! 	ldxa	[%g0 + %i2] 0x40,	%g5 ASI use changed by convert2hboot ripped by fixASI40.pl ripped by fixASI40.pl
	pdist	%f8,	%f26,	%f20
	sub	%g3,	%l6,	%g6
	set	0x40, %i7
	nop	 ! 	stda	%f0,	[%l7 + %i7] 0x80 ASI use changed by convert2hboot
	or	%i3,	0x1A54,	%o3
	fcmped	%fcc0,	%f24,	%f18
	nop 	! 	taddcctv	%o4,	0x13B8,	%i4 changed by convert2hboot
	movrgez	%l0,	%g1,	%l2
	ldsh	[%l7 + 0x74],	%i2
	edge16	%i1,	%o5,	%l5
	set	0x5E, %o0
	nop	 ! 	ldsha	[%l7 + %o0] 0x10,	%l1 ASI use changed by convert2hboot
	brlez,a	%g7,	loop_303
	fcmpgt32	%f10,	%f26,	%o2
	movn	%icc,	%l4,	%i5
	fmul8ulx16	%f4,	%f12,	%f6
loop_303:
	fcmpes	%fcc3,	%f12,	%f24
	movleu	%xcc,	%o6,	%o0
	wr	%g0,	0x88,	%asi
	sra	%g2,	%l3,	%o7
	stw	%i6,	[%l7 + 0x40]
	srax	%i7,	0x1E,	%o1
	nop 	! 	ta	%xcc,	0x1 changed by convert2hboot
	subc	%g4,	%g5,	%g3
	bne	loop_304
	and	%l6,	%i3,	%o3
	fnors	%f21,	%f24,	%f17
	umulcc	%o4,	0x1A13,	%i4
loop_304:
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
	fpadd16s	%f28,	%f11,	%f3
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	sdiv	%l0,	0x0913,	%g6
	movrne	%g1,	%l2,	%i2
	edge8l	%i1,	%l5,	%o5
	movleu	%icc,	%l1,	%g7
	fcmpne16	%f12,	%f8,	%l4
	movne	%xcc,	%o2,	%o6
	fones	%f31
	sll	%o0,	0x0A,	%i0
	nop 	! 	tge	%icc,	0x2 changed by convert2hboot
	movrlz	%g2,	0x086,	%i5
	nop 	! 	tgu	%xcc,	0x5 changed by convert2hboot
	nop 	! 	tsubcctv	%l3,	%i6,	%o7 changed by convert2hboot
	or	%i7,	0x1AE4,	%g4
	fzeros	%f17
	movgu	%icc,	%g5,	%o1
	nop 	! 	tsubcc	%l6,	0x0361,	%i3 changed by convert2hboot
	edge32l	%o3,	%g3,	%o4
	nop 	! 	tvs	%xcc,	0x7 changed by convert2hboot
	nop 	! 	sir	0x00B9 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%l0,	%i4
	or	%g6,	%g1,	%l2
	edge16n	%i1,	%l5,	%i2
	bneg,pt	%xcc,	loop_305
	movle	%xcc,	%o5,	%l1
	sra	%g7,	0x0D,	%l4
	pdist	%f28,	%f28,	%f8
loop_305:
	fmovdvs	%icc,	%f12,	%f17
	udivx	%o2,	0x05E8,	%o0
	nop 	! 	sir	0x1374 changed by convert2hboot
	edge16	%o6,	%g2,	%i5
	fcmpgt32	%f2,	%f16,	%l3
	srlx	%i6,	%i0,	%i7
	fcmpd	%fcc0,	%f14,	%f20
	umul	%g4,	%g5,	%o1
	subc	%o7,	0x1D8D,	%l6
	lduw	[%l7 + 0x64],	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i3,	%g3,	%o4
	andn	%l0,	%i4,	%g1
	fbule	%fcc1,	loop_306
	xorcc	%l2,	0x057D,	%i1
	addc	%l5,	%g6,	%o5
	movleu	%xcc,	%l1,	%i2
loop_306:
	fbul,a	%fcc1,	loop_307
	fnot1s	%f5,	%f18
	nop
	setx loop_308, %l0, %l1
	jmpl %l1, %l4
	edge32n	%g7,	%o0,	%o2
loop_307:
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	fpsub16	%f20,	%f10,	%f24
loop_308:
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	mulx	%g2,	0x0A5C,	%i5
	fmovsa	%icc,	%f12,	%f26
	fcmple16	%f16,	%f16,	%l3
	nop 	! 	taddcc	%o6,	%i6,	%i0 changed by convert2hboot
	xor	%i7,	%g5,	%g4
	movrgez	%o1,	%o7,	%l6
	nop 	! 	sir	0x172A changed by convert2hboot
	movcc	%xcc,	%i3,	%g3
	udiv	%o4,	0x0F8D,	%l0
	be	loop_309
	fbg,a	%fcc0,	loop_310
	movrne	%o3,	%g1,	%l2
	fzero	%f28
loop_309:
	addcc	%i1,	%i4,	%l5
loop_310:
	movvs	%xcc,	%g6,	%l1
	movvs	%icc,	%i2,	%l4
	nop 	! 	tvc	%xcc,	0x0 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x0c,	%asi
	sll	%g7,	0x04,	%o0
	srl	%o5,	%o2,	%g2
	movrgez	%l3,	0x2A9,	%o6
	fblg	%fcc0,	loop_311
	addcc	%i5,	%i6,	%i7
	brgz	%g5,	loop_312
	fcmped	%fcc0,	%f16,	%f2
loop_311:
	prefetch	[%l7 + 0x20],	 0x3
	set	0x0C, %i1
	nop	 ! 	lduwa	[%l7 + %i1] 0x14,	%g4 ASI use changed by convert2hboot
loop_312:
	movneg	%icc,	%i0,	%o7
	subcc	%l6,	%i3,	%o1
	andn	%g3,	%l0,	%o4
	fpackfix	%f4,	%f10
	ldd	[%l7 + 0x58],	%f16
	fpack32	%f4,	%f6,	%f10
	nop 	! 	tsubcc	%o3,	0x0F25,	%l2 changed by convert2hboot
	alignaddrl	%i1,	%i4,	%g1
	bne	loop_313
	fmovsa	%xcc,	%f0,	%f27
	umul	%l5,	0x04F6,	%l1
	alignaddr	%g6,	%i2,	%g7
loop_313:
	sdivcc	%l4,	0x0AF9,	%o0
	fmovsle	%xcc,	%f27,	%f14
	and	%o5,	%o2,	%g2
	addccc	%l3,	%o6,	%i6
	nop
	setx	loop_314,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	movvs	%xcc,	%i7,	%i5
	stx	%g5,	[%l7 + 0x50]
	brlz,a	%g4,	loop_315
loop_314:
	brnz,a	%i0,	loop_316
	fnand	%f0,	%f28,	%f26
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
loop_315:
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
loop_316:
	edge32	%l6,	%o7,	%o1
	faligndata	%f12,	%f8,	%f12
	srl	%g3,	%l0,	%i3
	brlz,a	%o3,	loop_317
	fnands	%f25,	%f16,	%f6
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	fmovscc	%icc,	%f22,	%f9
loop_317:
	nop 	! 	te	%xcc,	0x5 changed by convert2hboot
	addc	%o4,	0x1C55,	%l2
	stb	%i4,	[%l7 + 0x51]
	fbug	%fcc2,	loop_318
	xor	%i1,	0x0315,	%l5
	nop 	! 	tne	%icc,	0x1 changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x5 changed by convert2hboot
loop_318:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x19,	%asi
	nop	 ! 	casxa	[%l6] 0x19,	%g1,	%g6 ASI use changed by convert2hboot
	set	0x7E, %o6
	nop	 ! 	lduba	[%l7 + %o6] 0x10,	%i2 ASI use changed by convert2hboot
	brlez	%l1,	loop_319
	fmovrslz	%l4,	%f3,	%f10
	stx	%g7,	[%l7 + 0x20]
	xorcc	%o5,	%o2,	%o0
loop_319:
	edge32l	%g2,	%l3,	%i6
	nop 	! 	tvs	%icc,	0x1 changed by convert2hboot
	fandnot1s	%f6,	%f12,	%f9
	fblg	%fcc1,	loop_320
	array16	%i7,	%o6,	%i5
	fones	%f9
	sll	%g4,	%i0,	%g5
loop_320:
	movl	%xcc,	%o7,	%o1
	ldd	[%l7 + 0x70],	%f28
	lduw	[%l7 + 0x30],	%l6
	movrne	%g3,	%i3,	%o3
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	bcc,pn	%icc,	loop_321
	xnor	%l0,	0x0775,	%o4
	addc	%i4,	0x1A9D,	%i1
	nop 	! 	tsubcc	%l2,	0x0AB7,	%g1 changed by convert2hboot
loop_321:
	fmovs	%f27,	%f21
	bcc,a,pt	%xcc,	loop_322
	movleu	%xcc,	%g6,	%i2
	move	%xcc,	%l5,	%l1
	for	%f4,	%f22,	%f18
loop_322:
	edge32n	%l4,	%g7,	%o5
	set	0x08, %o3
	nop	 ! 	ldswa	[%l7 + %o3] 0x81,	%o2 ASI use changed by convert2hboot
	fmovscc	%icc,	%f4,	%f3
	fmovrdgz	%o0,	%f10,	%f28
	fcmpes	%fcc3,	%f24,	%f28
	set	0x53, %i3
	nop	 ! 	lduba	[%l7 + %i3] 0x18,	%l3 ASI use changed by convert2hboot
	movvs	%icc,	%g2,	%i6
	movrlez	%o6,	%i5,	%i7
	fmovsn	%icc,	%f15,	%f18
	mova	%icc,	%i0,	%g4
	array8	%g5,	%o1,	%l6
	edge32n	%g3,	%i3,	%o3
	movleu	%xcc,	%l0,	%o7
	udivcc	%o4,	0x1A1B,	%i4
	movge	%xcc,	%l2,	%g1
	bpos,a	loop_323
	movrlz	%g6,	0x214,	%i2
	add	%i1,	%l1,	%l4
	xnor	%l5,	0x0765,	%g7
loop_323:
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
	set	0x50, %i6
	nop	 ! 	stda	%o4,	[%l7 + %i6] 0x2f ASI use changed by convert2hboot
	membar	#Sync
	brz	%o2,	loop_324
	edge16n	%o0,	%l3,	%i6
	udivcc	%o6,	0x1FB1,	%i5
	set	0x34, %o5
	sta	%f11,	[%l7 + %o5] 0x89
loop_324:
	fxor	%f2,	%f26,	%f30
	std	%g2,	[%l7 + 0x68]
	fmovdneg	%xcc,	%f12,	%f5
	udiv	%i7,	0x0DFD,	%i0
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%f8
	brlez	%g4,	loop_325
	brnz,a	%g5,	loop_326
	move	%icc,	%o1,	%g3
	array8	%l6,	%o3,	%i3
loop_325:
	movcs	%icc,	%l0,	%o4
loop_326:
	fcmps	%fcc1,	%f25,	%f15
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i4,	0x268,	%o7
	subcc	%l2,	0x071E,	%g1
	array8	%g6,	%i1,	%l1
	st	%f24,	[%l7 + 0x5C]
	movre	%i2,	0x18E,	%l5
	fbu,a	%fcc3,	loop_327
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	nop 	! 	tsubcc	%l4,	%g7,	%o2 changed by convert2hboot
	st	%f14,	[%l7 + 0x24]
loop_327:
	fbo	%fcc3,	loop_328
	bvc,a	%icc,	loop_329
	nop 	! 	tvc	%icc,	0x0 changed by convert2hboot
	nop 	! 	taddcctv	%o5,	%o0,	%l3 changed by convert2hboot
loop_328:
	fmovsl	%xcc,	%f30,	%f2
loop_329:
	nop 	! 	tsubcc	%o6,	%i5,	%g2 changed by convert2hboot
	fmovdg	%icc,	%f19,	%f29
	movrgez	%i6,	%i0,	%g4
	pdist	%f26,	%f26,	%f12
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x54] %asi,	%f29
	fmovsg	%icc,	%f31,	%f16
	sdivcc	%i7,	0x1F65,	%o1
	movneg	%icc,	%g3,	%l6
	sub	%o3,	%i3,	%g5
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
	fmovdl	%xcc,	%f11,	%f12
	add	%l0,	0x0469,	%i4
	subc	%o4,	%o7,	%l2
	swap	[%l7 + 0x58],	%g1
	andcc	%i1,	%l1,	%i2
	fand	%f18,	%f18,	%f16
	fpmerge	%f2,	%f8,	%f22
	fnot2	%f20,	%f4
	orncc	%l5,	%g6,	%g7
	nop 	! 	sir	0x070F changed by convert2hboot
	srax	%o2,	0x0A,	%l4
	fbul,a	%fcc3,	loop_330
	edge32l	%o5,	%l3,	%o6
	movleu	%icc,	%i5,	%g2
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
loop_330:
	bneg,pn	%icc,	loop_331
	umul	%o0,	%i0,	%i6
	edge8	%g4,	%o1,	%i7
	sdivx	%g3,	0x11BB,	%o3
loop_331:
	addcc	%i3,	%g5,	%l0
	nop 	! 	tpos	%icc,	0x0 changed by convert2hboot
	movleu	%icc,	%l6,	%o4
	ldsb	[%l7 + 0x61],	%i4
	addccc	%o7,	0x1030,	%g1
	brgz	%i1,	loop_332
	edge8ln	%l2,	%i2,	%l1
	sll	%g6,	%l5,	%o2
	brnz,a	%l4,	loop_333
loop_332:
	nop 	! 	ta	%xcc,	0x7 changed by convert2hboot
	alignaddrl	%o5,	%g7,	%l3
	sllx	%o6,	%g2,	%o0
loop_333:
	bcc,a,pn	%xcc,	loop_334
	fbl	%fcc1,	loop_335
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f30,	%f4
loop_334:
	movpos	%xcc,	%i5,	%i0
loop_335:
	movneg	%icc,	%i6,	%g4
	movle	%icc,	%i7,	%g3
	movn	%icc,	%o3,	%i3
	fmovrsne	%o1,	%f7,	%f27
	lduh	[%l7 + 0x0C],	%l0
	fpadd16s	%f18,	%f18,	%f5
	set	0x40, %l5
	nop	 ! 	stda	%f0,	[%l7 + %l5] 0x16 ASI use changed by convert2hboot
	membar	#Sync
	edge16	%l6,	%g5,	%i4
	array16	%o4,	%g1,	%i1
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	nop
	set	0x0E, %i5
	ldub	[%l7 + %i5],	%o7
	movle	%xcc,	%i2,	%l2
	set	0x5A, %g3
	nop	 ! 	stha	%l1,	[%l7 + %g3] 0x04 ASI use changed by convert2hboot
	or	%g6,	%o2,	%l5
	st	%f18,	[%l7 + 0x10]
	fpsub32s	%f2,	%f4,	%f23
	fbo,a	%fcc1,	loop_336
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	array8	%o5,	%g7,	%l3
	sub	%l4,	%g2,	%o6
loop_336:
	bvs,a,pt	%xcc,	loop_337
	fmovrdlz	%i5,	%f10,	%f20
	bshuffle	%f0,	%f18,	%f18
	nop 	! 	tvc	%icc,	0x5 changed by convert2hboot
loop_337:
	and	%i0,	%o0,	%i6
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
	orncc	%g4,	0x1D6E,	%g3
	fcmpgt32	%f16,	%f28,	%i7
	umul	%i3,	0x1EC2,	%o3
	edge16n	%o1,	%l0,	%g5
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	ba,pn	%xcc,	loop_338
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	movrgz	%i4,	%l6,	%g1
	fnegd	%f4,	%f16
loop_338:
	fmovdg	%icc,	%f4,	%f8
	fmovdvc	%icc,	%f30,	%f23
	fbue,a	%fcc0,	loop_339
	or	%i1,	%o7,	%i2
	edge16ln	%l2,	%l1,	%g6
	set	0x17, %g7
	nop	 ! 	ldstuba	[%l7 + %g7] 0x0c,	%o4 ASI use changed by convert2hboot
loop_339:
	ldd	[%l7 + 0x28],	%f6
	nop 	! 	ta	%xcc,	0x7 changed by convert2hboot
	edge8ln	%o2,	%l5,	%g7
	mulscc	%l3,	0x0A23,	%l4
	fsrc2s	%f29,	%f11
	set	0x18, %o7
	sta	%f1,	[%l7 + %o7] 0x10
	nop 	! 	taddcc	%o5,	0x1F83,	%o6 changed by convert2hboot
	movvc	%xcc,	%i5,	%g2
	fxnors	%f28,	%f27,	%f11
	xor	%o0,	0x1C67,	%i6
	movl	%xcc,	%g4,	%g3
	movrne	%i0,	%i7,	%i3
	umulcc	%o3,	%l0,	%o1
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
	subccc	%i4,	0x0904,	%l6
	set	0x28, %o2
	nop	 ! 	stda	%g4,	[%l7 + %o2] 0x2b ASI use changed by convert2hboot
	membar	#Sync
	membar	0x5B
	addc	%i1,	0x1072,	%g1
	fmovdvc	%icc,	%f23,	%f14
	fmovrsgz	%o7,	%f22,	%f26
	orncc	%l2,	%l1,	%g6
	lduw	[%l7 + 0x2C],	%i2
	fandnot1s	%f7,	%f27,	%f27
	fpack32	%f8,	%f22,	%f8
	sdiv	%o2,	0x02C8,	%o4
	orn	%g7,	0x14C2,	%l5
	orcc	%l4,	0x16B1,	%o5
	srlx	%l3,	%i5,	%o6
	movleu	%xcc,	%o0,	%g2
	movn	%xcc,	%i6,	%g3
	orcc	%g4,	0x1090,	%i0
	set	0x18, %g6
	nop	 ! 	swapa	[%l7 + %g6] 0x19,	%i7 ASI use changed by convert2hboot
	brnz,a	%o3,	loop_340
	edge8	%l0,	%i3,	%i4
	umulcc	%l6,	%o1,	%i1
	bpos,pt	%icc,	loop_341
loop_340:
	brnz,a	%g1,	loop_342
	orncc	%o7,	%l2,	%g5
	nop 	! 	taddcctv	%g6,	%l1,	%o2 changed by convert2hboot
loop_341:
	fmovsa	%xcc,	%f26,	%f7
loop_342:
	membar	0x0F
	set	0x60, %o1
	nop	 ! 	ldda	[%l7 + %o1] 0x11,	%o4 ASI use changed by convert2hboot
	movcs	%xcc,	%i2,	%g7
	fpsub16s	%f3,	%f27,	%f21
	or	%l4,	0x13F9,	%o5
	fornot1	%f12,	%f18,	%f4
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	srl	%l3,	0x04,	%l5
	movvs	%icc,	%i5,	%o6
	fmovrdgez	%o0,	%f16,	%f0
	andcc	%i6,	0x0384,	%g3
	alignaddr	%g2,	%i0,	%g4
	set	0x20, %o4
	nop	 ! 	stda	%o2,	[%l7 + %o4] 0x15 ASI use changed by convert2hboot
	movgu	%icc,	%i7,	%l0
	ldsh	[%l7 + 0x7C],	%i4
	umulcc	%l6,	%i3,	%i1
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
	fbule	%fcc2,	loop_343
	nop 	! 	tge	%icc,	0x4 changed by convert2hboot
	movrlz	%o1,	%g1,	%l2
	fornot1	%f6,	%f4,	%f30
loop_343:
	sll	%g5,	0x15,	%g6
	fbn	%fcc0,	loop_344
	mulscc	%o7,	0x0404,	%l1
	udiv	%o4,	0x077C,	%o2
	movrlez	%g7,	%i2,	%o5
loop_344:
	edge32l	%l4,	%l3,	%l5
	fsrc2s	%f25,	%f12
	mova	%xcc,	%o6,	%i5
	bcs	loop_345
	fmovrdlz	%o0,	%f6,	%f30
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
	array16	%i6,	%g2,	%i0
loop_345:
	fxnors	%f10,	%f19,	%f24
	membar	0x1A
	fmovsgu	%xcc,	%f10,	%f18
	fmul8sux16	%f12,	%f20,	%f22
	fmovrslz	%g4,	%f22,	%f29
	nop 	! 	tsubcctv	%g3,	%o3,	%l0 changed by convert2hboot
	fornot1	%f14,	%f8,	%f8
	andcc	%i7,	0x1247,	%l6
	bcs,a,pn	%icc,	loop_346
	umul	%i3,	%i4,	%o1
	fpsub16s	%f1,	%f19,	%f13
	fbo,a	%fcc2,	loop_347
loop_346:
	add	%g1,	0x002B,	%i1
	edge16	%g5,	%g6,	%o7
	fbe	%fcc3,	loop_348
loop_347:
	bcs,a,pt	%xcc,	loop_349
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
	sub	%l1,	%l2,	%o4
loop_348:
	subcc	%g7,	0x125B,	%i2
loop_349:
	and	%o5,	%l4,	%l3
	flush	%l7 + 0x58
	fexpand	%f1,	%f26
	brnz	%o2,	loop_350
	nop 	! 	taddcc	%o6,	0x195A,	%i5 changed by convert2hboot
	set	0x1B, %g5
	nop	 ! 	ldsba	[%l7 + %g5] 0x19,	%l5 ASI use changed by convert2hboot
loop_350:
	xorcc	%o0,	0x1412,	%g2
	nop
	setx loop_351, %l0, %l1
	jmpl %l1, %i6
	fmovrdgez	%i0,	%f30,	%f22
	bcc,a,pn	%icc,	loop_352
	bl,pn	%xcc,	loop_353
loop_351:
	xnor	%g3,	%o3,	%g4
	fandnot2	%f28,	%f0,	%f26
loop_352:
	fornot2	%f22,	%f12,	%f8
loop_353:
	movcc	%xcc,	%i7,	%l6
	fmovde	%icc,	%f7,	%f24
	sllx	%i3,	0x19,	%i4
	or	%l0,	%o1,	%i1
	brgz	%g1,	loop_354
	popc	0x1AF3,	%g5
	subcc	%g6,	0x1910,	%l1
	move	%icc,	%l2,	%o7
loop_354:
	movn	%xcc,	%o4,	%i2
	nop 	! 	sir	0x1008 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x1 changed by convert2hboot
	nop
	set	0x18, %l3
	std	%f22,	[%l7 + %l3]
	subccc	%g7,	%o5,	%l3
	or	%l4,	0x1604,	%o2
	fornot1	%f10,	%f16,	%f28
	fxnors	%f12,	%f27,	%f25
	edge8n	%i5,	%l5,	%o0
	brz,a	%o6,	loop_355
	udivx	%i6,	0x0B6C,	%g2
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	bvc,pt	%icc,	loop_356
loop_355:
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	fmovdl	%icc,	%f10,	%f0
	andcc	%i0,	%g3,	%o3
loop_356:
	add	%i7,	%l6,	%g4
	edge16ln	%i3,	%i4,	%l0
	fbue,a	%fcc2,	loop_357
	mulscc	%i1,	0x011E,	%o1
	movrgez	%g1,	%g5,	%l1
	fbug	%fcc0,	loop_358
loop_357:
	fmovscs	%icc,	%f28,	%f30
	fornot2	%f24,	%f24,	%f6
	fmovrslez	%g6,	%f8,	%f6
loop_358:
	nop
	wr	%g0,	0x0c,	%asi
	bgu,pt	%xcc,	loop_359
	movrne	%o4,	%i2,	%g7
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	fandnot2	%f6,	%f10,	%f16
loop_359:
	fmovscc	%icc,	%f23,	%f30
	fmovsleu	%xcc,	%f5,	%f22
	fble,a	%fcc0,	loop_360
	fcmpd	%fcc2,	%f22,	%f12
	wr	%g0,	0x20,	%asi
loop_360:
	add	%o5,	0x1703,	%l4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	nop	 ! 	casxa	[%l6] 0x89,	%o2,	%l3 ASI use changed by convert2hboot
	edge8n	%i5,	%o0,	%o6
	nop 	! 	taddcctv	%i6,	0x1B11,	%l5 changed by convert2hboot
	nop 	! 	tle	%icc,	0x4 changed by convert2hboot
	fbu	%fcc2,	loop_361
	andcc	%i0,	%g3,	%o3
	movrne	%i7,	%l6,	%g4
	popc	%g2,	%i3
loop_361:
	smul	%l0,	0x03B5,	%i4
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
	nop
	set	0x3A, %l4
	lduh	[%l7 + %l4],	%o1
	umulcc	%g1,	%g5,	%l1
	array16	%g6,	%i1,	%o7
	addccc	%o4,	%g7,	%i2
	edge16l	%o5,	%l4,	%l2
	nop 	! 	tgu	%xcc,	0x3 changed by convert2hboot
	set	0x1B, %g1
	nop	 ! 	lduba	[%l7 + %g1] 0x89,	%o2 ASI use changed by convert2hboot
	brz,a	%i5,	loop_362
	fxnor	%f16,	%f2,	%f28
	xorcc	%l3,	%o0,	%o6
	fmovse	%icc,	%f28,	%f1
loop_362:
	fornot1s	%f27,	%f25,	%f28
	nop 	! 	tsubcctv	%l5,	%i0,	%i6 changed by convert2hboot
	movl	%xcc,	%g3,	%o3
	fandnot1	%f10,	%f2,	%f4
	smulcc	%l6,	0x014A,	%g4
	fmovde	%xcc,	%f25,	%f22
	movcs	%xcc,	%i7,	%g2
	edge32	%i3,	%l0,	%o1
	sll	%i4,	%g5,	%g1
	andncc	%g6,	%l1,	%o7
	nop 	! 	tsubcctv	%o4,	%g7,	%i2 changed by convert2hboot
	smul	%i1,	0x01D7,	%l4
	brlz	%l2,	loop_363
	movvc	%icc,	%o2,	%i5
	fcmps	%fcc3,	%f27,	%f10
	fpsub16s	%f13,	%f30,	%f5
loop_363:
	nop
	set	0x38, %i0
	nop	 ! 	ldxa	[%l7 + %i0] 0x15,	%o5 ASI use changed by convert2hboot
	popc	%o0,	%o6
	bg,pn	%xcc,	loop_364
	sethi	0x15D6,	%l3
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	nop 	! 	tle	%xcc,	0x2 changed by convert2hboot
loop_364:
	fmovrdne	%i0,	%f16,	%f14
	fsrc2s	%f8,	%f27
	andncc	%l5,	%g3,	%i6
	swap	[%l7 + 0x48],	%l6
	movvs	%xcc,	%g4,	%i7
	ldx	[%l7 + 0x78],	%g2
	nop
	setx	loop_365,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movrgez	%i3,	0x162,	%o3
	fmovscs	%icc,	%f14,	%f19
	orncc	%o1,	%i4,	%l0
loop_365:
	nop 	! 	tle	%icc,	0x6 changed by convert2hboot
	fzeros	%f10
	edge32l	%g1,	%g5,	%g6
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	movcs	%icc,	%l1,	%o4
	edge8ln	%o7,	%i2,	%g7
	movrlez	%l4,	0x2E4,	%l2
	edge32n	%o2,	%i5,	%i1
	edge16n	%o5,	%o0,	%o6
	wr	%g0,	0x18,	%asi
	wr	%g0,	0x88,	%asi
	orcc	%g3,	%i6,	%l6
	wr	%g0,	0x10,	%asi
	sub	%g4,	%g2,	%i3
	fandnot2s	%f10,	%f1,	%f21
	movl	%xcc,	%i7,	%o3
	popc	0x0A0D,	%o1
	bcc,pt	%icc,	loop_366
	nop 	! 	sir	0x1DA4 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
loop_366:
	nop
	wr	%g0,	0x2a,	%asi
	srax	%i4,	0x05,	%g5
	nop 	! 	sir	0x0BA6 changed by convert2hboot
	set	0x1E, %g4
	nop	 ! 	ldsha	[%l7 + %g4] 0x18,	%g6 ASI use changed by convert2hboot
	fmovspos	%icc,	%f28,	%f8
	fnot2	%f4,	%f28
	edge32l	%g1,	%l1,	%o7
	edge32n	%i2,	%g7,	%o4
	popc	0x1916,	%l4
	sub	%o2,	%l2,	%i1
	fbuge	%fcc3,	loop_367
	fmovd	%f20,	%f10
	fmovdge	%icc,	%f15,	%f1
	fmovsleu	%icc,	%f23,	%f21
loop_367:
	edge32ln	%i5,	%o0,	%o6
	srl	%o5,	0x01,	%l3
	ldstub	[%l7 + 0x21],	%g3
	fmovsvs	%icc,	%f3,	%f17
	udivcc	%l5,	0x13BB,	%i6
	umul	%l6,	%i0,	%g2
	orn	%g4,	%i7,	%o3
	movcs	%icc,	%i3,	%l0
	fmovspos	%icc,	%f23,	%f30
	fandnot1	%f2,	%f0,	%f8
	bgu,pn	%xcc,	loop_368
	xorcc	%o1,	0x05EC,	%g5
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	brz	%i4,	loop_369
loop_368:
	srlx	%g1,	0x16,	%l1
	fmovdneg	%xcc,	%f18,	%f26
	fnor	%f6,	%f26,	%f14
loop_369:
	movleu	%icc,	%g6,	%i2
	subc	%o7,	0x1427,	%o4
	movle	%xcc,	%l4,	%o2
	set	0x78, %l6
	nop	 ! 	swapa	[%l7 + %l6] 0x0c,	%g7 ASI use changed by convert2hboot
	fcmped	%fcc3,	%f30,	%f14
	brgz	%i1,	loop_370
	movvs	%xcc,	%l2,	%i5
	fpmerge	%f5,	%f28,	%f30
	subcc	%o6,	0x0076,	%o0
loop_370:
	array16	%o5,	%g3,	%l5
	srlx	%i6,	0x10,	%l3
	addccc	%l6,	%g2,	%g4
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
	xnorcc	%i0,	%i7,	%o3
	fba	%fcc2,	loop_371
	membar	0x49
	edge32	%i3,	%l0,	%o1
	siam	0x0
loop_371:
	nop 	! 	tle	%icc,	0x3 changed by convert2hboot
	fornot2s	%f2,	%f25,	%f27
	andcc	%i4,	%g5,	%g1
	nop 	! 	te	%xcc,	0x7 changed by convert2hboot
	st	%f23,	[%l7 + 0x24]
	edge8ln	%g6,	%l1,	%o7
	edge8ln	%o4,	%i2,	%l4
	fcmpgt32	%f16,	%f18,	%g7
	array16	%i1,	%l2,	%i5
	ble,a	loop_372
	bshuffle	%f28,	%f10,	%f4
	movleu	%xcc,	%o6,	%o0
	edge32ln	%o2,	%g3,	%o5
loop_372:
	fnegd	%f0,	%f0
	movl	%xcc,	%i6,	%l5
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%f16
	call	loop_373
	fbue,a	%fcc3,	loop_374
	nop 	! 	tge	%icc,	0x2 changed by convert2hboot
	sub	%l3,	0x0E1E,	%l6
loop_373:
	edge8l	%g4,	%i0,	%i7
loop_374:
	mulx	%g2,	0x0B22,	%i3
	sub	%o3,	0x0C84,	%o1
	sll	%l0,	%i4,	%g5
	stb	%g1,	[%l7 + 0x7A]
	movn	%xcc,	%l1,	%o7
	set	0x30, %l0
	nop	 ! 	stxa	%o4,	[%l7 + %l0] 0x04 ASI use changed by convert2hboot
	xnorcc	%i2,	0x0250,	%g6
	addcc	%g7,	%l4,	%i1
	mulx	%i5,	%l2,	%o0
	addccc	%o2,	%g3,	%o5
	movleu	%xcc,	%o6,	%i6
	fmul8x16al	%f22,	%f19,	%f28
	addc	%l3,	0x0AC5,	%l6
	sth	%g4,	[%l7 + 0x2C]
	fpsub16	%f22,	%f14,	%f10
	movrgez	%l5,	%i0,	%g2
	alignaddrl	%i7,	%o3,	%i3
	nop 	! 	tg	%xcc,	0x7 changed by convert2hboot
	bcs,pt	%xcc,	loop_375
	fmovdl	%icc,	%f8,	%f29
	addcc	%l0,	0x1847,	%o1
	xorcc	%g5,	0x058E,	%i4
loop_375:
	movcc	%xcc,	%l1,	%o7
	fblg,a	%fcc3,	loop_376
	edge32	%g1,	%i2,	%g6
	st	%f12,	[%l7 + 0x54]
	srl	%o4,	%g7,	%i1
loop_376:
	swap	[%l7 + 0x2C],	%i5
	fnot1	%f24,	%f2
	stx	%l4,	[%l7 + 0x20]
	be,a	%xcc,	loop_377
	movne	%icc,	%o0,	%o2
	subcc	%l2,	0x0DDF,	%o5
	movne	%xcc,	%g3,	%i6
loop_377:
	array8	%o6,	%l6,	%g4
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	nop
	setx loop_378, %l0, %l1
	jmpl %l1, %l5
	fsrc1s	%f2,	%f30
	edge16ln	%l3,	%i0,	%g2
	wr	%g0,	0xea,	%asi
	membar	#Sync
loop_378:
	movn	%icc,	%i3,	%i7
	ldsb	[%l7 + 0x36],	%o1
	array16	%g5,	%i4,	%l0
	fnors	%f29,	%f17,	%f19
	edge32	%o7,	%l1,	%i2
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	sdivx	%g6,	0x15FF,	%o4
	fornot2s	%f2,	%f3,	%f15
	bl,a,pn	%xcc,	loop_379
	sdivcc	%g7,	0x0684,	%i1
	nop 	! 	taddcc	%g1,	0x06FB,	%i5 changed by convert2hboot
	set	0x78, %i4
	nop	 ! 	stwa	%l4,	[%l7 + %i4] 0x2f ASI use changed by convert2hboot
	membar	#Sync
loop_379:
	edge32	%o2,	%l2,	%o5
	edge8l	%g3,	%o0,	%i6
	stb	%o6,	[%l7 + 0x7C]
	addcc	%g4,	0x1C1E,	%l5
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
	fmovsa	%icc,	%f19,	%f26
	smulcc	%l3,	0x1DDF,	%l6
	fpsub16	%f0,	%f2,	%f6
	movl	%icc,	%g2,	%i0
	xnorcc	%o3,	%i3,	%i7
	fbge	%fcc1,	loop_380
	nop 	! 	tcs	%icc,	0x6 changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	srax	%o1,	%g5,	%i4
loop_380:
	srl	%o7,	%l0,	%i2
	movrlz	%g6,	%l1,	%o4
	smulcc	%i1,	%g1,	%i5
	wr	%g0,	0x2b,	%asi
	fmovsgu	%icc,	%f20,	%f20
	nop
	set	0x5A, %g2
	stb	%o2,	[%l7 + %g2]
	edge16l	%l4,	%l2,	%g3
	st	%f4,	[%l7 + 0x78]
	popc	%o0,	%i6
	nop 	! 	sir	0x1BC0 changed by convert2hboot
	movcc	%icc,	%o6,	%g4
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	xor	%o5,	%l3,	%l6
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	wr	%g0,	0x04,	%asi
	mulx	%i0,	0x1750,	%g2
	fmovrdgz	%i3,	%f6,	%f10
	fmul8sux16	%f14,	%f0,	%f2
	sdivcc	%i7,	0x0FC5,	%o1
	addcc	%o3,	0x021E,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x0E, %i7
	nop	 ! 	ldsha	[%l7 + %i7] 0x89,	%o7 ASI use changed by convert2hboot
	nop
	set	0x48, %i2
	std	%f30,	[%l7 + %i2]
	fsrc2s	%f17,	%f27
	edge32	%i4,	%i2,	%g6
	ldub	[%l7 + 0x69],	%l0
	set	0x5C, %i1
	nop	 ! 	lduwa	[%l7 + %i1] 0x89,	%o4 ASI use changed by convert2hboot
	bn,a	loop_381
	edge16	%i1,	%g1,	%i5
	wr	%g0,	0x10,	%asi
loop_381:
	nop
	set	0x0C, %o0
	sth	%g7,	[%l7 + %o0]
	subcc	%l4,	%l2,	%g3
	fmovdne	%icc,	%f8,	%f14
	array16	%o0,	%o2,	%i6
	fmovrslez	%g4,	%f13,	%f7
	fbug	%fcc3,	loop_382
	movrgz	%o6,	0x386,	%l3
	fbl	%fcc1,	loop_383
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
loop_382:
	umulcc	%l6,	0x18BB,	%l5
	fmul8ulx16	%f12,	%f28,	%f4
loop_383:
	fnot1s	%f11,	%f29
	edge8n	%o5,	%i0,	%g2
	xorcc	%i3,	0x0B42,	%i7
	fmovsleu	%icc,	%f30,	%f8
	edge8l	%o3,	%g5,	%o7
	nop 	! 	te	%xcc,	0x7 changed by convert2hboot
	fzero	%f2
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	orcc	%o1,	%i2,	%i4
	wr	%g0,	0x80,	%asi
	fbue	%fcc2,	loop_384
	movgu	%icc,	%o4,	%i1
	edge16ln	%g6,	%g1,	%l1
	fands	%f17,	%f10,	%f9
loop_384:
	movvs	%xcc,	%i5,	%l4
	srlx	%l2,	%g3,	%g7
	movrne	%o2,	0x2E6,	%o0
	and	%i6,	%g4,	%o6
	movcc	%xcc,	%l3,	%l6
	stx	%o5,	[%l7 + 0x30]
	brlz,a	%i0,	loop_385
	addccc	%l5,	%g2,	%i7
	fmovrdlez	%i3,	%f30,	%f12
	orncc	%o3,	0x0293,	%o7
loop_385:
	lduh	[%l7 + 0x14],	%g5
	sdivx	%o1,	0x0D4E,	%i2
	fmovrde	%l0,	%f14,	%f16
	set	0x78, %o6
	sta	%f27,	[%l7 + %o6] 0x11
	array8	%i4,	%i1,	%o4
	set	0x48, %i3
	nop	 ! 	stda	%g0,	[%l7 + %i3] 0x15 ASI use changed by convert2hboot
	nop 	! 	tcs	%icc,	0x3 changed by convert2hboot
	movgu	%icc,	%l1,	%i5
	movrgz	%g6,	0x1B0,	%l4
	set	0x50, %o3
	nop	 ! 	lduwa	[%l7 + %o3] 0x81,	%l2 ASI use changed by convert2hboot
	nop 	! 	tvc	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tvs	%xcc,	0x7 changed by convert2hboot
	fandnot2s	%f20,	%f13,	%f31
	fmovrdlz	%g7,	%f26,	%f8
	movneg	%icc,	%g3,	%o2
	fsrc1	%f2,	%f26
	movle	%icc,	%i6,	%o0
	membar	0x36
	andn	%o6,	0x0B45,	%g4
	and	%l6,	%o5,	%l3
	fmovdneg	%icc,	%f25,	%f21
	edge8	%l5,	%i0,	%g2
	fpsub16s	%f25,	%f8,	%f16
	xnorcc	%i3,	%i7,	%o7
	andcc	%g5,	0x0E81,	%o1
	fmovrslz	%i2,	%f16,	%f17
	smul	%o3,	%i4,	%l0
	fble	%fcc0,	loop_386
	xnor	%i1,	%g1,	%l1
	prefetch	[%l7 + 0x40],	 0x3
	umul	%o4,	0x11C5,	%g6
loop_386:
	movvc	%xcc,	%i5,	%l4
	movrlz	%l2,	0x25D,	%g3
	fbl	%fcc2,	loop_387
	movg	%icc,	%g7,	%i6
	addc	%o0,	%o2,	%o6
	sdivcc	%l6,	0x186B,	%g4
loop_387:
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
	smulcc	%o5,	%l3,	%l5
	popc	%i0,	%i3
	ldsb	[%l7 + 0x24],	%g2
	nop 	! 	te	%icc,	0x0 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	movn	%icc,	%o7,	%g5
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	alignaddr	%o1,	%i2,	%o3
	movl	%xcc,	%l0,	%i4
	bgu,pt	%icc,	loop_388
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tneg	%icc,	0x5 changed by convert2hboot
	brgez	%i1,	loop_389
loop_388:
	movre	%g1,	0x145,	%l1
	movl	%icc,	%o4,	%i5
	fmovda	%icc,	%f17,	%f31
loop_389:
	nop
	wr	%g0,	0x0c,	%asi
	orncc	%g6,	0x0AF2,	%l2
	movleu	%xcc,	%g3,	%l4
	fmovdneg	%icc,	%f9,	%f30
	srl	%g7,	0x00,	%i6
	fnot1	%f14,	%f22
	ldx	[%l7 + 0x20],	%o0
	ldub	[%l7 + 0x2D],	%o6
	movrlez	%o2,	0x238,	%l6
	brgz	%g4,	loop_390
	addc	%l3,	%o5,	%l5
	sdivx	%i3,	0x097E,	%g2
	nop 	! 	tsubcc	%i7,	%i0,	%g5 changed by convert2hboot
loop_390:
	edge16ln	%o7,	%o1,	%i2
	movneg	%xcc,	%l0,	%i4
	fmul8x16	%f27,	%f14,	%f6
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
	edge16n	%o3,	%g1,	%l1
	nop 	! 	taddcc	%o4,	0x1710,	%i5 changed by convert2hboot
	umul	%g6,	0x1C0A,	%l2
	ldx	[%l7 + 0x40],	%g3
	edge16	%i1,	%g7,	%l4
	nop 	! 	tvs	%xcc,	0x6 changed by convert2hboot
	subc	%i6,	0x1DC5,	%o6
	edge16n	%o2,	%o0,	%g4
	smulcc	%l3,	%o5,	%l6
	be,a,pt	%xcc,	loop_391
	fblg	%fcc3,	loop_392
	orcc	%i3,	%l5,	%g2
	fmovscc	%xcc,	%f20,	%f17
loop_391:
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
loop_392:
	faligndata	%f14,	%f8,	%f26
	srlx	%i0,	%i7,	%g5
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
	swap	[%l7 + 0x2C],	%o7
	wr	%g0,	0x80,	%asi
	std	%l0,	[%l7 + 0x20]
	fandnot1s	%f25,	%f9,	%f20
	movrgz	%i4,	%o3,	%g1
	mulscc	%l1,	%o4,	%o1
	bl	loop_393
	swap	[%l7 + 0x60],	%g6
	addc	%l2,	%g3,	%i1
	srlx	%g7,	%i5,	%l4
loop_393:
	mulx	%o6,	0x0320,	%i6
	mulscc	%o2,	0x1F15,	%g4
	fzero	%f14
	fbo	%fcc3,	loop_394
	call	loop_395
	ldd	[%l7 + 0x28],	%o0
	fornot1	%f12,	%f26,	%f4
loop_394:
	udiv	%o5,	0x1BF8,	%l6
loop_395:
	brz	%l3,	loop_396
	brlz	%i3,	loop_397
	xnor	%l5,	0x1A70,	%i0
	fxor	%f30,	%f0,	%f16
loop_396:
	addcc	%i7,	%g2,	%g5
loop_397:
	movne	%xcc,	%i2,	%l0
	fmovdgu	%icc,	%f27,	%f1
	udivcc	%i4,	0x047E,	%o7
	edge32	%g1,	%o3,	%o4
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
	edge16n	%o1,	%l1,	%g6
	fbu,a	%fcc3,	loop_398
	edge16	%g3,	%l2,	%i1
	movrgez	%i5,	%l4,	%g7
	set	0x34, %i6
	nop	 ! 	ldsha	[%l7 + %i6] 0x10,	%o6 ASI use changed by convert2hboot
loop_398:
	movge	%xcc,	%o2,	%i6
	st	%f3,	[%l7 + 0x5C]
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	array16	%g4,	%o5,	%o0
	add	%l6,	0x0381,	%i3
	edge8l	%l3,	%i0,	%i7
	sll	%g2,	%l5,	%i2
	wr	%g0,	0x88,	%asi
	wr	%g0,	0x22,	%asi
	membar	#Sync
	xorcc	%o7,	0x130C,	%g1
	edge8n	%l0,	%o4,	%o3
	set	0x6A, %l1
	nop	 ! 	ldsba	[%l7 + %l1] 0x04,	%l1 ASI use changed by convert2hboot
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
	bge,pn	%icc,	loop_399
	movpos	%xcc,	%g6,	%o1
	srax	%l2,	0x08,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_399:
	nop 	! 	tsubcctv	%g3,	0x1228,	%i5 changed by convert2hboot
	movgu	%xcc,	%l4,	%g7
	fble	%fcc2,	loop_400
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
	stw	%o2,	[%l7 + 0x78]
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
loop_400:
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	movpos	%xcc,	%o6,	%i6
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g4
	andn	%l6,	%o5,	%l3
	movrlez	%i3,	%i0,	%g2
	lduw	[%l7 + 0x70],	%i7
	fcmps	%fcc0,	%f11,	%f4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i2
	fsrc2	%f26,	%f14
	sllx	%i4,	%l5,	%g1
	sub	%o7,	0x1D2B,	%o4
	bleu,pt	%icc,	loop_401
	fpadd32	%f0,	%f12,	%f28
	edge16ln	%o3,	%l0,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_401:
	edge16l	%o1,	%l1,	%l2
	fcmpne32	%f16,	%f28,	%i1
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	alignaddrl	%i5,	%l4,	%g3
	subcc	%o2,	%o6,	%g7
	array32	%g4,	%i6,	%l6
	edge16n	%o0,	%l3,	%o5
	fbg,a	%fcc1,	loop_402
	fba,a	%fcc0,	loop_403
	fcmpne16	%f2,	%f14,	%i0
	nop 	! 	taddcc	%i3,	0x15D3,	%i7 changed by convert2hboot
loop_402:
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
loop_403:
	movrlez	%i2,	0x0AF,	%g5
	set	0x60, %o5
	nop	 ! 	prefetcha	[%l7 + %o5] 0x14,	 0x1 ASI use changed by convert2hboot
	alignaddrl	%g2,	%l5,	%o7
	flush	%l7 + 0x48
	movl	%icc,	%o4,	%o3
	movle	%icc,	%g1,	%l0
	fnot2	%f22,	%f14
	bleu,a,pn	%xcc,	loop_404
	andn	%o1,	0x0504,	%l1
	fmovrslz	%g6,	%f24,	%f5
	sdivcc	%l2,	0x0A81,	%i5
loop_404:
	movgu	%xcc,	%l4,	%g3
	fmovdcc	%xcc,	%f5,	%f2
	alignaddrl	%i1,	%o2,	%g7
	nop
	setx	loop_405,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fba,a	%fcc3,	loop_406
	stw	%g4,	[%l7 + 0x08]
	bleu,a	loop_407
loop_405:
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
loop_406:
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	orncc	%o6,	%i6,	%l6
loop_407:
	movn	%xcc,	%l3,	%o5
	movvc	%xcc,	%i0,	%i3
	wr	%g0,	0x11,	%asi
	udivcc	%i2,	0x1E94,	%i7
	edge8l	%i4,	%g5,	%l5
	fpadd16s	%f13,	%f7,	%f25
	fble,a	%fcc2,	loop_408
	sethi	0x11A1,	%o7
	movpos	%icc,	%o4,	%o3
	for	%f22,	%f6,	%f28
loop_408:
	fandnot1	%f20,	%f8,	%f0
	array8	%g1,	%l0,	%o1
	mulx	%l1,	0x04D0,	%g2
	fcmpes	%fcc0,	%f9,	%f17
	andcc	%g6,	0x132F,	%l2
	movcc	%icc,	%i5,	%l4
	fmovdge	%icc,	%f2,	%f6
	and	%g3,	%o2,	%g7
	fmovrdlez	%g4,	%f20,	%f0
	fnors	%f19,	%f20,	%f12
	mulscc	%o6,	%i6,	%i1
	movrlz	%l3,	%o5,	%i0
	addcc	%l6,	%o0,	%i2
	sllx	%i3,	%i7,	%g5
	stw	%i4,	[%l7 + 0x10]
	udiv	%l5,	0x0999,	%o7
	fsrc1	%f22,	%f0
	orcc	%o4,	%o3,	%l0
	brnz	%o1,	loop_409
	bgu,pt	%icc,	loop_410
	fmovdgu	%icc,	%f19,	%f19
	wr	%g0,	0x80,	%asi
	sta	%f3,	[%l7 + 0x10] %asi
loop_409:
	nop 	! 	taddcc	%l1,	%g2,	%g1 changed by convert2hboot
loop_410:
	nop
	set	0x68, %i5
	nop	 ! 	ldxa	[%l7 + %i5] 0x81,	%g6 ASI use changed by convert2hboot
	fcmps	%fcc2,	%f11,	%f1
	movpos	%icc,	%i5,	%l4
	nop
	setx	loop_411,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	srlx	%g3,	0x00,	%l2
	sub	%o2,	0x09B0,	%g7
	edge16ln	%o6,	%g4,	%i6
loop_411:
	fmovsa	%icc,	%f18,	%f20
	brgez	%i1,	loop_412
	popc	0x0524,	%o5
	mova	%xcc,	%l3,	%l6
	edge32	%i0,	%i2,	%o0
loop_412:
	membar	0x59
	movcs	%xcc,	%i7,	%i3
	movvc	%icc,	%i4,	%g5
	fpsub32	%f20,	%f14,	%f20
	nop 	! 	tn	%xcc,	0x5 changed by convert2hboot
	fble	%fcc2,	loop_413
	addccc	%l5,	%o4,	%o7
	fmovdg	%icc,	%f1,	%f25
	sll	%o3,	%l0,	%l1
loop_413:
	edge16n	%g2,	%o1,	%g6
	movleu	%icc,	%g1,	%i5
	ble,a	%icc,	loop_414
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
	andcc	%l4,	%l2,	%o2
	movvc	%icc,	%g7,	%g3
loop_414:
	ldub	[%l7 + 0x41],	%g4
	fmovsle	%xcc,	%f10,	%f15
	xnor	%i6,	0x18C4,	%i1
	fones	%f8
	movvc	%icc,	%o5,	%o6
	edge32ln	%l3,	%l6,	%i0
	sllx	%o0,	0x1F,	%i7
	fmul8x16au	%f28,	%f10,	%f16
	fmovdgu	%xcc,	%f23,	%f12
	addc	%i3,	%i4,	%i2
	wr	%g0,	0x2f,	%asi
	fmovsneg	%xcc,	%f6,	%f0
	subc	%o4,	0x1525,	%o7
	udivx	%g5,	0x1126,	%l0
	nop 	! 	sir	0x1119 changed by convert2hboot
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x0c,	%asi
	nop	 ! 	casa	[%l6] 0x0c,	%l1,	%o3 ASI use changed by convert2hboot
	movgu	%xcc,	%o1,	%g6
	edge32ln	%g2,	%g1,	%i5
	nop 	! 	tsubcctv	%l2,	%l4,	%g7 changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	faligndata	%f24,	%f12,	%f16
	fmovsneg	%icc,	%f30,	%f5
	fbn	%fcc3,	loop_415
	fmovrse	%g3,	%f26,	%f21
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	nop	 ! 	casxa	[%l6] 0x80,	%o2,	%g4 ASI use changed by convert2hboot
loop_415:
	and	%i6,	%i1,	%o6
	bpos,a	loop_416
	st	%f19,	[%l7 + 0x70]
	fnand	%f30,	%f2,	%f26
	wr	%g0,	0x18,	%asi
	sta	%f7,	[%l7 + 0x70] %asi
loop_416:
	fcmpne32	%f24,	%f2,	%l3
	edge8n	%l6,	%i0,	%o0
	fbge	%fcc1,	loop_417
	movrgez	%i7,	%o5,	%i4
	pdist	%f22,	%f10,	%f14
	udiv	%i3,	0x0E61,	%i2
loop_417:
	ldd	[%l7 + 0x60],	%o4
	be,a,pt	%xcc,	loop_418
	nop 	! 	tl	%xcc,	0x6 changed by convert2hboot
	xnor	%l5,	0x010A,	%g5
	lduw	[%l7 + 0x68],	%o7
loop_418:
	fbue,a	%fcc2,	loop_419
	bge	loop_420
	addccc	%l1,	0x1C95,	%o3
	fornot2	%f12,	%f20,	%f22
loop_419:
	membar	0x23
loop_420:
	fmovrdne	%l0,	%f12,	%f2
	fcmps	%fcc0,	%f12,	%f28
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	movre	%o1,	0x0A1,	%g2
	fnand	%f12,	%f12,	%f14
	wr	%g0,	0x81,	%asi
	sta	%f11,	[%l7 + 0x30] %asi
	addccc	%g1,	0x1DFE,	%i5
	movrne	%g6,	0x2FE,	%l4
	orcc	%l2,	0x0631,	%g7
	fmovrdlez	%o2,	%f8,	%f26
	fmul8x16au	%f17,	%f31,	%f4
	edge16l	%g4,	%g3,	%i6
	ldsb	[%l7 + 0x17],	%i1
	andncc	%o6,	%l3,	%l6
	fmovde	%icc,	%f20,	%f24
	fmovd	%f20,	%f8
	movl	%icc,	%i0,	%i7
	andn	%o5,	0x1E98,	%o0
	movne	%icc,	%i4,	%i3
	sll	%o4,	0x1C,	%i2
	bvs,pt	%xcc,	loop_421
	movrlz	%g5,	0x318,	%o7
	fble,a	%fcc2,	loop_422
	fexpand	%f30,	%f12
loop_421:
	nop 	! 	sir	0x0F50 changed by convert2hboot
	xorcc	%l5,	%o3,	%l1
loop_422:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,a	loop_423
	bneg,a	loop_424
	movle	%icc,	%l0,	%g2
	ldd	[%l7 + 0x30],	%f14
loop_423:
	addc	%o1,	%i5,	%g1
loop_424:
	movvs	%icc,	%g6,	%l4
	srax	%g7,	0x01,	%l2
	mulscc	%o2,	%g3,	%i6
	smulcc	%i1,	0x000D,	%o6
	xorcc	%l3,	0x1BA5,	%g4
	edge16	%i0,	%l6,	%i7
	movg	%icc,	%o0,	%i4
	ba,a,pn	%icc,	loop_425
	movcc	%icc,	%o5,	%i3
	edge32n	%i2,	%g5,	%o7
	fxnors	%f23,	%f29,	%f0
loop_425:
	movneg	%icc,	%o4,	%o3
	prefetch	[%l7 + 0x1C],	 0x0
	addccc	%l5,	%l1,	%g2
	fxors	%f20,	%f7,	%f18
	fbne,a	%fcc2,	loop_426
	fcmpgt16	%f22,	%f22,	%o1
	ldd	[%l7 + 0x30],	%l0
	fbge,a	%fcc2,	loop_427
loop_426:
	fone	%f26
	edge16l	%i5,	%g6,	%l4
	set	0x3C, %l5
	sta	%f15,	[%l7 + %l5] 0x88
loop_427:
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	edge32l	%g1,	%g7,	%o2
	ldstub	[%l7 + 0x0A],	%l2
	wr	%g0,	0x19,	%asi
	brnz	%i1,	loop_428
	sethi	0x195B,	%g3
	fblg,a	%fcc3,	loop_429
	movrne	%l3,	0x216,	%o6
loop_428:
	movneg	%xcc,	%g4,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_429:
	bg,a	loop_430
	subc	%i7,	%i0,	%i4
	fmul8x16au	%f4,	%f9,	%f16
	fnors	%f27,	%f7,	%f19
loop_430:
	movneg	%xcc,	%o0,	%o5
	fmovdcs	%xcc,	%f14,	%f0
	sth	%i3,	[%l7 + 0x1E]
	fbuge	%fcc3,	loop_431
	lduw	[%l7 + 0x5C],	%g5
	nop 	! 	tle	%xcc,	0x5 changed by convert2hboot
	fbne	%fcc1,	loop_432
loop_431:
	mulscc	%i2,	%o7,	%o4
	array8	%l5,	%o3,	%g2
	bvc,a,pn	%icc,	loop_433
loop_432:
	array32	%o1,	%l1,	%l0
	fbule	%fcc0,	loop_434
	edge16l	%g6,	%l4,	%i5
loop_433:
	nop 	! 	tneg	%icc,	0x0 changed by convert2hboot
	set	0x68, %g3
	nop	 ! 	stxa	%g7,	[%l7 + %g3] 0x14 ASI use changed by convert2hboot
loop_434:
	udivcc	%o2,	0x0A64,	%l2
	std	%g0,	[%l7 + 0x38]
	fmovdge	%xcc,	%f11,	%f28
	orncc	%i1,	0x18CF,	%g3
	bpos,a	%xcc,	loop_435
	fandnot1s	%f10,	%f9,	%f10
	fors	%f3,	%f7,	%f23
	ld	[%l7 + 0x14],	%f31
loop_435:
	bge,pt	%icc,	loop_436
	orcc	%i6,	0x16CE,	%l3
	orn	%g4,	%o6,	%l6
	movl	%icc,	%i0,	%i7
loop_436:
	fmovdn	%xcc,	%f31,	%f5
	bcs,pt	%icc,	loop_437
	popc	0x0565,	%i4
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
	fornot2s	%f20,	%f1,	%f13
loop_437:
	nop 	! 	taddcc	%o5,	0x13CD,	%o0 changed by convert2hboot
	set	0x44, %o7
	nop	 ! 	stha	%g5,	[%l7 + %o7] 0x18 ASI use changed by convert2hboot
	brlz	%i3,	loop_438
	array32	%o7,	%i2,	%o4
	srax	%l5,	%g2,	%o1
	set	0x2A, %o2
	nop	 ! 	ldsha	[%l7 + %o2] 0x04,	%l1 ASI use changed by convert2hboot
loop_438:
	move	%xcc,	%o3,	%l0
	movvs	%xcc,	%g6,	%i5
	ldd	[%l7 + 0x18],	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%g7,	%l2,	%o2
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	andn	%g1,	0x1467,	%g3
	fbo	%fcc0,	loop_439
	fpadd16	%f20,	%f4,	%f10
	fnot2s	%f6,	%f26
	fmovsg	%xcc,	%f2,	%f12
loop_439:
	sdiv	%i1,	0x06B7,	%i6
	or	%l3,	%o6,	%l6
	orn	%g4,	0x0538,	%i7
	orcc	%i0,	%i4,	%o0
	edge16	%g5,	%i3,	%o5
	bn,pn	%icc,	loop_440
	membar	0x29
	movn	%xcc,	%i2,	%o7
	alignaddrl	%l5,	%g2,	%o4
loop_440:
	or	%l1,	0x1C3A,	%o1
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
	nop
	set	0x3E, %g7
	sth	%l0,	[%l7 + %g7]
	fmovdcs	%icc,	%f21,	%f24
	fmovs	%f5,	%f29
	sethi	0x191D,	%o3
	andn	%i5,	%l4,	%g7
	siam	0x4
	subc	%g6,	%l2,	%g1
	array8	%g3,	%o2,	%i1
	or	%l3,	0x1EF4,	%o6
	fmovd	%f20,	%f12
	edge16	%l6,	%g4,	%i6
	movre	%i0,	%i7,	%i4
	smulcc	%g5,	0x16EC,	%o0
	array32	%o5,	%i2,	%o7
	wr	%g0,	0x23,	%asi
	membar	#Sync
	sdivcc	%g2,	0x0570,	%l5
	sth	%l1,	[%l7 + 0x1E]
	bvs,a	%icc,	loop_441
	srlx	%o1,	0x05,	%l0
	add	%o3,	0x149B,	%i5
	fpsub16s	%f10,	%f23,	%f6
loop_441:
	fbge,a	%fcc1,	loop_442
	bshuffle	%f16,	%f6,	%f26
	movpos	%xcc,	%l4,	%g7
	movn	%icc,	%g6,	%l2
loop_442:
	srlx	%g1,	%g3,	%o2
	sethi	0x184F,	%o4
	fmovrdne	%l3,	%f24,	%f26
	sdivcc	%o6,	0x130C,	%l6
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	smulcc	%g4,	%i6,	%i0
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
	call	loop_443
	nop 	! 	tsubcctv	%i7,	%i1,	%i4 changed by convert2hboot
	alignaddrl	%g5,	%o5,	%o0
	nop 	! 	tpos	%icc,	0x3 changed by convert2hboot
loop_443:
	fornot1s	%f24,	%f30,	%f14
	xor	%i2,	0x084C,	%i3
	nop 	! 	tne	%icc,	0x5 changed by convert2hboot
	fbug,a	%fcc1,	loop_444
	array32	%o7,	%l5,	%l1
	fmovdleu	%xcc,	%f2,	%f24
	orn	%o1,	0x0963,	%l0
loop_444:
	nop
	set	0x5F, %g6
	nop	 ! 	stba	%o3,	[%l7 + %g6] 0xeb ASI use changed by convert2hboot
	membar	#Sync
	ldx	[%l7 + 0x20],	%i5
	fsrc2	%f22,	%f26
	wr	%g0,	0x89,	%asi
	array32	%g7,	%g6,	%l2
	udivcc	%l4,	0x1B66,	%g1
	subc	%o2,	0x0587,	%o4
	fmovdle	%icc,	%f4,	%f24
	subcc	%g3,	0x0DAB,	%o6
	fzeros	%f10
	fmuld8sux16	%f5,	%f31,	%f14
	std	%l2,	[%l7 + 0x40]
	ld	[%l7 + 0x6C],	%f19
	udivcc	%g4,	0x19C7,	%i6
	nop 	! 	tge	%icc,	0x0 changed by convert2hboot
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
	edge8	%i0,	%i7,	%i1
	udivcc	%i4,	0x1589,	%l6
	bneg	loop_445
	std	%g4,	[%l7 + 0x70]
	sethi	0x013D,	%o0
	xor	%o5,	%i2,	%o7
loop_445:
	fpmerge	%f10,	%f10,	%f24
	fbue	%fcc1,	loop_446
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	addc	%l5,	0x1D90,	%i3
	sra	%l1,	0x08,	%o1
loop_446:
	movcc	%icc,	%o3,	%i5
	alignaddrl	%l0,	%g7,	%g6
	alignaddrl	%g2,	%l2,	%g1
	fbug,a	%fcc3,	loop_447
	nop 	! 	tneg	%icc,	0x1 changed by convert2hboot
	movl	%xcc,	%l4,	%o4
	xnor	%o2,	0x1B9B,	%g3
loop_447:
	srl	%l3,	%o6,	%i6
	movvs	%icc,	%g4,	%i7
	bn,pt	%icc,	loop_448
	udivcc	%i1,	0x072C,	%i0
	bgu	loop_449
	add	%i4,	%l6,	%o0
loop_448:
	sllx	%o5,	%g5,	%i2
	brlz	%o7,	loop_450
loop_449:
	fmovdcs	%xcc,	%f0,	%f27
	nop 	! 	tcs	%icc,	0x3 changed by convert2hboot
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
loop_450:
	fmovrslez	%l5,	%f19,	%f21
	movvc	%icc,	%i3,	%l1
	popc	0x12DA,	%o3
	alignaddrl	%o1,	%l0,	%g7
	orcc	%i5,	0x1F6E,	%g6
	andn	%l2,	%g2,	%l4
	andncc	%o4,	%o2,	%g3
	ldd	[%l7 + 0x08],	%l2
	smulcc	%o6,	0x02B1,	%g1
	set	0x68, %o4
	nop	 ! 	stha	%i6,	[%l7 + %o4] 0x89 ASI use changed by convert2hboot
	wr	%g0,	0x11,	%asi
	set	0x10, %o1
	lda	[%l7 + %o1] 0x80,	%f18
	sub	%i1,	%g4,	%i0
	movrne	%i4,	0x0FC,	%l6
	fmovrdgz	%o0,	%f28,	%f2
	edge32	%o5,	%i2,	%g5
	wr	%g0,	0x11,	%asi
	nop 	! 	sir	0x18EA changed by convert2hboot
	fpsub16s	%f1,	%f5,	%f2
	movrlz	%l5,	%i3,	%o3
	fnot2	%f20,	%f14
	movcc	%icc,	%l1,	%l0
	array8	%o1,	%g7,	%i5
	xor	%g6,	%g2,	%l4
	membar	0x6D
	move	%icc,	%o4,	%l2
	fpack16	%f10,	%f5
	fblg	%fcc1,	loop_451
	sdivcc	%g3,	0x0329,	%l3
	fxor	%f22,	%f0,	%f24
	sll	%o6,	0x0E,	%g1
loop_451:
	fmovdne	%xcc,	%f12,	%f21
	umulcc	%o2,	0x1A13,	%i6
	fbo	%fcc2,	loop_452
	sethi	0x0813,	%i7
	lduh	[%l7 + 0x56],	%i1
	fpack16	%f28,	%f7
loop_452:
	orn	%g4,	%i4,	%i0
	ldsb	[%l7 + 0x52],	%o0
	movrgez	%o5,	0x1FE,	%l6
	set	0x5C, %g5
	nop	 ! 	swapa	[%l7 + %g5] 0x80,	%g5 ASI use changed by convert2hboot
	srlx	%o7,	%i2,	%l5
	fpsub32	%f8,	%f2,	%f20
	fbn	%fcc0,	loop_453
	sdiv	%o3,	0x1A71,	%i3
	movg	%xcc,	%l1,	%l0
	fmovrsgz	%g7,	%f31,	%f26
loop_453:
	movrne	%o1,	%g6,	%i5
	udiv	%g2,	0x0D2F,	%l4
	bne,a,pt	%xcc,	loop_454
	movrlez	%l2,	%g3,	%o4
	edge8	%o6,	%g1,	%l3
	move	%xcc,	%i6,	%o2
loop_454:
	nop 	! 	tgu	%xcc,	0x4 changed by convert2hboot
	bneg,a	loop_455
	ble,a	loop_456
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
loop_455:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_456:
	nop
	set	0x24, %l3
	nop	 ! 	swapa	[%l7 + %l3] 0x19,	%i1 ASI use changed by convert2hboot
	alignaddrl	%g4,	%i4,	%i0
	subccc	%i7,	%o0,	%o5
	fbge	%fcc0,	loop_457
	orn	%l6,	0x1136,	%o7
	bcc,a,pn	%icc,	loop_458
	nop
	set	0x70, %l4
	ldx	[%l7 + %l4],	%i2
loop_457:
	nop
	setx	loop_459,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	st	%f21,	[%l7 + 0x30]
loop_458:
	nop
	set	0x34, %g1
	nop	 ! 	stwa	%g5,	[%l7 + %g1] 0x27 ASI use changed by convert2hboot
	membar	#Sync
loop_459:
	movne	%xcc,	%l5,	%o3
	sdivcc	%l1,	0x05C9,	%i3
	subc	%l0,	%o1,	%g6
	fmovdpos	%icc,	%f2,	%f5
	edge32l	%g7,	%i5,	%g2
	andn	%l2,	0x0A19,	%l4
	nop 	! 	tcs	%icc,	0x7 changed by convert2hboot
	array16	%g3,	%o4,	%g1
	popc	%o6,	%l3
	nop 	! 	tvs	%icc,	0x5 changed by convert2hboot
	wr	%g0,	0x11,	%asi
	nop 	! 	tpos	%icc,	0x4 changed by convert2hboot
	xorcc	%i6,	0x1AD5,	%g4
	wr	%g0,	0x88,	%asi
	movneg	%icc,	%i1,	%i7
	sethi	0x179D,	%i0
	movpos	%icc,	%o5,	%o0
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	andncc	%o7,	%i2,	%g5
	brgz,a	%l6,	loop_460
	edge8l	%l5,	%o3,	%i3
	array16	%l1,	%o1,	%g6
	bneg,a	%icc,	loop_461
loop_460:
	movcc	%icc,	%l0,	%i5
	ldsh	[%l7 + 0x18],	%g2
	sra	%g7,	%l2,	%l4
loop_461:
	bcc	loop_462
	orn	%o4,	0x0C74,	%g1
	set	0x6A, %i0
	nop	 ! 	ldstuba	[%l7 + %i0] 0x0c,	%g3 ASI use changed by convert2hboot
loop_462:
	orncc	%l3,	0x08B9,	%o2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	nop	 ! 	casxa	[%l6] 0x04,	%o6,	%i6 ASI use changed by convert2hboot
	alignaddrl	%i4,	%i1,	%g4
	fcmpd	%fcc2,	%f24,	%f6
	brgz	%i0,	loop_463
	fmovd	%f14,	%f10
	fbg	%fcc2,	loop_464
	fmovscs	%xcc,	%f20,	%f11
loop_463:
	fxors	%f3,	%f10,	%f5
	fmovrsne	%i7,	%f29,	%f17
loop_464:
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	fbu,a	%fcc3,	loop_465
	smul	%o0,	0x1639,	%o5
	fnot2s	%f15,	%f13
	sethi	0x1CEF,	%o7
loop_465:
	nop 	! 	ta	%xcc,	0x0 changed by convert2hboot
	movgu	%icc,	%i2,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%l6,	%f16,	%f27
	fblg	%fcc3,	loop_466
	sllx	%l5,	0x1E,	%i3
	nop 	! 	tgu	%xcc,	0x3 changed by convert2hboot
	edge16ln	%l1,	%o3,	%o1
loop_466:
	movvs	%xcc,	%l0,	%i5
	flush	%l7 + 0x08
	bcs,a,pt	%xcc,	loop_467
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	fmovdvc	%icc,	%f5,	%f11
	ldsw	[%l7 + 0x0C],	%g6
loop_467:
	fornot2	%f0,	%f22,	%f20
	lduh	[%l7 + 0x7E],	%g2
	fbu,a	%fcc0,	loop_468
	fornot1s	%f23,	%f19,	%f17
	edge32	%l2,	%g7,	%o4
	sllx	%l4,	0x0D,	%g1
loop_468:
	and	%l3,	%o2,	%o6
	wr	%g0,	0x89,	%asi
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
	fnand	%f20,	%f0,	%f30
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	ba,a,pt	%xcc,	loop_469
	srl	%i4,	0x1C,	%g3
	movg	%xcc,	%i1,	%g4
	popc	0x01D1,	%i7
loop_469:
	ba,pn	%icc,	loop_470
	mulscc	%o0,	0x0A26,	%o5
	move	%xcc,	%i0,	%o7
	sdiv	%g5,	0x059F,	%i2
loop_470:
	xor	%l6,	0x10C9,	%i3
	set	0x7E, %l6
	nop	 ! 	ldsha	[%l7 + %l6] 0x15,	%l5 ASI use changed by convert2hboot
	andn	%l1,	%o3,	%o1
	smul	%i5,	%g6,	%g2
	wr	%g0,	0x19,	%asi
	sta	%f23,	[%l7 + 0x3C] %asi
	for	%f24,	%f26,	%f14
	fcmpd	%fcc3,	%f20,	%f2
	mulscc	%l0,	%g7,	%l2
	mova	%icc,	%o4,	%l4
	xnorcc	%g1,	0x1B18,	%o2
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	andn	%o6,	%l3,	%i6
	call	loop_471
	array32	%g3,	%i4,	%i1
	umulcc	%g4,	0x0EB7,	%i7
	fmovde	%xcc,	%f23,	%f21
loop_471:
	bcc,pt	%icc,	loop_472
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	set	0x0E, %l2
	nop	 ! 	lduba	[%l7 + %l2] 0x89,	%o0 ASI use changed by convert2hboot
loop_472:
	movne	%xcc,	%o5,	%i0
	bpos	loop_473
	edge32ln	%o7,	%i2,	%l6
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
	movrgz	%g5,	0x121,	%l5
loop_473:
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	fmovspos	%xcc,	%f1,	%f7
	xnor	%i3,	0x1395,	%l1
	udivx	%o3,	0x1452,	%i5
	nop
	setx loop_474, %l0, %l1
	jmpl %l1, %g6
	movpos	%xcc,	%o1,	%g2
	movrlez	%l0,	0x01B,	%l2
	edge32ln	%o4,	%g7,	%l4
loop_474:
	popc	%g1,	%o2
	sdiv	%o6,	0x0155,	%i6
	fxnor	%f10,	%f0,	%f12
	fmovrsgz	%l3,	%f15,	%f29
	orncc	%g3,	0x0C0C,	%i1
	alignaddrl	%g4,	%i7,	%i4
	fcmple32	%f26,	%f14,	%o5
	edge16n	%o0,	%i0,	%i2
	nop 	! 	sir	0x108B changed by convert2hboot
	fpackfix	%f16,	%f29
	movcc	%xcc,	%l6,	%o7
	wr	%g0,	0x04,	%asi
	nop 	! 	tneg	%xcc,	0x2 changed by convert2hboot
	udivx	%g5,	0x02B7,	%l1
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	bvc,pt	%icc,	loop_475
	or	%o3,	0x1D55,	%i3
	nop
	setx	loop_476,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fexpand	%f5,	%f8
loop_475:
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
loop_476:
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	brlz,a	%i5,	loop_477
	fcmple32	%f6,	%f30,	%o1
	ldsb	[%l7 + 0x52],	%g2
	fmovdleu	%icc,	%f6,	%f20
loop_477:
	nop
	wr	%g0,	0x19,	%asi
	fpadd32s	%f27,	%f3,	%f10
	edge32ln	%l2,	%l0,	%o4
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	call	loop_478
	fxnors	%f20,	%f8,	%f30
	st	%f30,	[%l7 + 0x58]
	brnz,a	%g7,	loop_479
loop_478:
	fmovdvc	%xcc,	%f14,	%f28
	andn	%g1,	%l4,	%o6
	fmovdgu	%xcc,	%f0,	%f12
loop_479:
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	sra	%i6,	0x0E,	%o2
	fmovsl	%xcc,	%f5,	%f16
	brnz	%l3,	loop_480
	movl	%icc,	%g3,	%g4
	movre	%i1,	0x396,	%i4
	wr	%g0,	0x18,	%asi
loop_480:
	nop
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	sethi	0x042F,	%o0
	movle	%icc,	%o5,	%i0
	movrgz	%i2,	0x2C7,	%o7
	brnz,a	%l5,	loop_481
	movcc	%icc,	%l6,	%g5
	movcs	%xcc,	%l1,	%o3
	mova	%icc,	%i5,	%o1
loop_481:
	nop
	wr	%g0,	0x80,	%asi
	edge32l	%g2,	%g6,	%l0
	edge16ln	%o4,	%g7,	%g1
	movcc	%icc,	%l4,	%o6
	srax	%l2,	0x0C,	%i6
	bl,pn	%xcc,	loop_482
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
	srlx	%l3,	%g3,	%g4
	array16	%o2,	%i4,	%i1
loop_482:
	nop 	! 	tpos	%icc,	0x6 changed by convert2hboot
	sll	%o0,	0x00,	%o5
	fpackfix	%f4,	%f14
	nop 	! 	tsubcc	%i0,	0x137B,	%i7 changed by convert2hboot
	movle	%icc,	%o7,	%l5
	sll	%i2,	0x16,	%l6
	fornot1	%f12,	%f30,	%f14
	nop 	! 	te	%xcc,	0x5 changed by convert2hboot
	sdivx	%g5,	0x0D39,	%l1
	set	0x170, %l0
	nop 	! 	nop 	! 	nop	 ! 	ldxa	[%g0 + %l0] 0x40,	%o3 ASI use changed by convert2hboot ripped by fixASI40.pl ripped by fixASI40.pl
	edge32ln	%i5,	%o1,	%i3
	bne,a,pn	%icc,	loop_483
	movgu	%xcc,	%g2,	%g6
	movge	%xcc,	%o4,	%l0
	edge16l	%g1,	%l4,	%o6
loop_483:
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	fxnor	%f6,	%f30,	%f6
	fnands	%f30,	%f7,	%f3
	edge32n	%l2,	%g7,	%l3
	fmovdcc	%icc,	%f6,	%f12
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
	nop
	setx	loop_484,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movrgez	%g3,	0x07B,	%i6
	fxor	%f26,	%f10,	%f30
	movpos	%xcc,	%g4,	%i4
loop_484:
	fbge,a	%fcc1,	loop_485
	fbule	%fcc3,	loop_486
	fbug	%fcc3,	loop_487
	fbue,a	%fcc1,	loop_488
loop_485:
	addcc	%i1,	%o0,	%o5
loop_486:
	movne	%xcc,	%i0,	%i7
loop_487:
	movvc	%xcc,	%o2,	%l5
loop_488:
	nop
	wr	%g0,	0x80,	%asi
	nop
	setx loop_489, %l0, %l1
	jmpl %l1, %o7
	orn	%i2,	%l6,	%l1
	fornot1s	%f23,	%f10,	%f27
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
loop_489:
	xnorcc	%g5,	0x152E,	%i5
	lduw	[%l7 + 0x60],	%o1
	movge	%xcc,	%i3,	%g2
	movneg	%icc,	%g6,	%o4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	nop	 ! 	casa	[%l6] 0x11,	%l0,	%o3 ASI use changed by convert2hboot
	orn	%l4,	%g1,	%l2
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	fcmpgt16	%f4,	%f26,	%o6
	ble,a	loop_490
	ldsh	[%l7 + 0x3A],	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g3,	%l3,	%i6
loop_490:
	edge16ln	%i4,	%g4,	%o0
	brgez,a	%o5,	loop_491
	movneg	%icc,	%i0,	%i1
	fmovdvc	%icc,	%f14,	%f23
	xnorcc	%o2,	0x04A9,	%i7
loop_491:
	sethi	0x1041,	%l5
	subc	%o7,	0x1303,	%i2
	orncc	%l1,	0x0C45,	%l6
	bleu,pn	%icc,	loop_492
	movrlez	%g5,	%o1,	%i5
	stb	%g2,	[%l7 + 0x2B]
	fbue,a	%fcc0,	loop_493
loop_492:
	smul	%g6,	0x15C1,	%i3
	array32	%o4,	%l0,	%o3
	movrgez	%g1,	0x2B7,	%l4
loop_493:
	andcc	%l2,	0x14B3,	%o6
	fand	%f20,	%f0,	%f8
	fmovde	%icc,	%f26,	%f15
	bneg,a	loop_494
	orn	%g3,	0x12AE,	%l3
	andn	%g7,	%i4,	%g4
	nop 	! 	tle	%icc,	0x6 changed by convert2hboot
loop_494:
	movre	%i6,	0x30C,	%o0
	fmovrde	%i0,	%f22,	%f26
	fmovdcs	%xcc,	%f14,	%f14
	sdivcc	%i1,	0x0B70,	%o5
	st	%f7,	[%l7 + 0x6C]
	and	%o2,	0x067C,	%l5
	wr	%g0,	0x88,	%asi
	movne	%xcc,	%i2,	%l1
	andn	%l6,	%g5,	%o7
	edge16n	%o1,	%i5,	%g2
	fabss	%f12,	%f16
	movge	%xcc,	%g6,	%i3
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	fpack16	%f10,	%f30
	fbo,a	%fcc2,	loop_495
	movvs	%icc,	%l0,	%o4
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
loop_495:
	fba	%fcc3,	loop_496
	fmovrsgz	%g1,	%f22,	%f19
	movcc	%xcc,	%l4,	%o3
	fpadd16	%f8,	%f20,	%f26
loop_496:
	fpsub16s	%f27,	%f29,	%f24
	andcc	%o6,	0x04AA,	%g3
	fnand	%f24,	%f10,	%f22
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	call	loop_497
	movrgz	%l3,	%g7,	%i4
	sdivx	%l2,	0x0146,	%g4
	fba,a	%fcc1,	loop_498
loop_497:
	fmovsvs	%xcc,	%f19,	%f12
	alignaddrl	%o0,	%i0,	%i6
	ldd	[%l7 + 0x40],	%i0
loop_498:
	edge8l	%o2,	%o5,	%l5
	fbul	%fcc3,	loop_499
	nop 	! 	tsubcc	%i7,	0x1C8B,	%i2 changed by convert2hboot
	move	%xcc,	%l1,	%l6
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
loop_499:
	restored
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
	ldd	[%l7 + 0x08],	%f10
	subccc	%o7,	0x1B42,	%g5
	lduh	[%l7 + 0x10],	%i5
	mulx	%g2,	%o1,	%g6
	fbge	%fcc1,	loop_500
	ldsh	[%l7 + 0x50],	%i3
	nop 	! 	tl	%xcc,	0x7 changed by convert2hboot
	sll	%l0,	%g1,	%o4
loop_500:
	udivx	%o3,	0x129E,	%l4
	movrgz	%g3,	0x2A8,	%o6
	edge16	%g7,	%l3,	%i4
	edge32l	%g4,	%o0,	%l2
	sdivx	%i6,	0x0960,	%i1
	wr	%g0,	0x11,	%asi
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x48] %asi,	%f28
	ldsh	[%l7 + 0x16],	%o5
	smul	%l5,	%i0,	%i7
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	movleu	%icc,	%l1,	%i2
	edge32l	%l6,	%g5,	%i5
	fpsub16s	%f20,	%f15,	%f6
	addcc	%o7,	%o1,	%g6
	move	%xcc,	%g2,	%l0
	fbue,a	%fcc2,	loop_501
	edge32l	%g1,	%i3,	%o4
	andncc	%o3,	%g3,	%o6
	mulx	%g7,	0x0400,	%l3
loop_501:
	sll	%i4,	0x19,	%g4
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
	lduw	[%l7 + 0x44],	%o0
	edge32l	%l2,	%l4,	%i1
	umulcc	%i6,	%o5,	%l5
	std	%f16,	[%l7 + 0x60]
	pdist	%f0,	%f10,	%f22
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
	movleu	%xcc,	%o2,	%i7
	sdivcc	%i0,	0x059B,	%l1
	for	%f2,	%f18,	%f0
	smul	%l6,	%g5,	%i2
	edge8ln	%o7,	%o1,	%i5
	fmovsneg	%xcc,	%f31,	%f5
	movrne	%g2,	%l0,	%g6
	nop 	! 	te	%icc,	0x0 changed by convert2hboot
	be,a,pn	%xcc,	loop_502
	edge32n	%g1,	%i3,	%o4
	fbug,a	%fcc1,	loop_503
	xnor	%o3,	0x00AF,	%g3
loop_502:
	fbn,a	%fcc1,	loop_504
	fmovdcs	%icc,	%f30,	%f24
loop_503:
	ldsb	[%l7 + 0x43],	%g7
	edge8ln	%o6,	%i4,	%l3
loop_504:
	edge16ln	%o0,	%l2,	%l4
	ldub	[%l7 + 0x51],	%g4
	edge8n	%i6,	%i1,	%o5
	fbge,a	%fcc1,	loop_505
	array16	%o2,	%i7,	%l5
	move	%icc,	%i0,	%l6
	sdivx	%g5,	0x17D0,	%l1
loop_505:
	movcs	%xcc,	%o7,	%o1
	nop
	setx	loop_506,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	edge16n	%i2,	%i5,	%g2
	nop 	! 	taddcc	%l0,	%g6,	%i3 changed by convert2hboot
	fmovdleu	%xcc,	%f23,	%f23
loop_506:
	addc	%g1,	0x05CE,	%o3
	sethi	0x092C,	%o4
	udivx	%g7,	0x1E51,	%g3
	udivcc	%i4,	0x0F49,	%l3
	set	0x0B, %i4
	nop	 ! 	ldstuba	[%l7 + %i4] 0x10,	%o6 ASI use changed by convert2hboot
	fbl	%fcc1,	loop_507
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f20,	%f30
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
loop_507:
	array16	%l2,	%l4,	%g4
	nop 	! 	tvc	%icc,	0x0 changed by convert2hboot
	smul	%i6,	0x1F9A,	%i1
	be,pn	%xcc,	loop_508
	movvc	%icc,	%o0,	%o5
	wr	%g0,	0x89,	%asi
	sta	%f10,	[%l7 + 0x58] %asi
loop_508:
	brgez	%o2,	loop_509
	xorcc	%l5,	%i0,	%l6
	mulx	%i7,	0x116A,	%l1
	bl	%xcc,	loop_510
loop_509:
	fbul,a	%fcc1,	loop_511
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	movge	%xcc,	%g5,	%o7
loop_510:
	edge16n	%o1,	%i5,	%i2
loop_511:
	movcs	%xcc,	%g2,	%g6
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	movrne	%l0,	0x0B2,	%i3
	fcmpeq32	%f12,	%f26,	%g1
	movpos	%xcc,	%o4,	%g7
	set	0x4B, %g2
	nop	 ! 	ldstuba	[%l7 + %g2] 0x80,	%g3 ASI use changed by convert2hboot
	stx	%i4,	[%l7 + 0x68]
	bpos	loop_512
	brz,a	%l3,	loop_513
	fandnot2s	%f7,	%f24,	%f21
	fxor	%f4,	%f18,	%f14
loop_512:
	umul	%o3,	%o6,	%l2
loop_513:
	fzeros	%f29
	udiv	%l4,	0x0E19,	%i6
	alignaddr	%g4,	%o0,	%o5
	bpos,a,pn	%xcc,	loop_514
	srlx	%o2,	0x15,	%l5
	nop
	setx loop_515, %l0, %l1
	jmpl %l1, %i0
	nop 	! 	tcs	%xcc,	0x4 changed by convert2hboot
loop_514:
	addccc	%i1,	0x15C2,	%l6
	subc	%l1,	%i7,	%o7
loop_515:
	edge8n	%g5,	%i5,	%o1
	fbo,a	%fcc0,	loop_516
	move	%xcc,	%i2,	%g2
	fornot1s	%f7,	%f7,	%f1
	fnot2	%f20,	%f18
loop_516:
	fbe	%fcc0,	loop_517
	stw	%g6,	[%l7 + 0x18]
	fcmpne16	%f14,	%f26,	%i3
	lduh	[%l7 + 0x78],	%l0
loop_517:
	nop
	wr	%g0,	0x89,	%asi
	bvs,pt	%xcc,	loop_518
	mova	%icc,	%g7,	%o4
	siam	0x5
	and	%i4,	0x1E3C,	%l3
loop_518:
	bg,pn	%xcc,	loop_519
	nop 	! 	tsubcctv	%o3,	%g3,	%l2 changed by convert2hboot
	movgu	%xcc,	%l4,	%i6
	addc	%g4,	0x1B99,	%o6
loop_519:
	edge32ln	%o5,	%o0,	%o2
	movvc	%xcc,	%l5,	%i1
	fnot2s	%f15,	%f9
	umulcc	%l6,	0x019B,	%i0
	mulscc	%i7,	%o7,	%l1
	sub	%i5,	%o1,	%g5
	orn	%i2,	0x1D50,	%g2
	movvs	%xcc,	%g6,	%l0
	prefetch	[%l7 + 0x6C],	 0x0
	bg,pt	%xcc,	loop_520
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	nop 	! 	tsubcc	%i3,	%g1,	%o4 changed by convert2hboot
	fbuge	%fcc3,	loop_521
loop_520:
	subc	%g7,	%l3,	%o3
	wr	%g0,	0x88,	%asi
loop_521:
	fsrc2s	%f9,	%f13
	addcc	%g3,	%l2,	%i6
	pdist	%f26,	%f28,	%f6
	bleu,a	%icc,	loop_522
	movcc	%xcc,	%l4,	%g4
	subccc	%o6,	%o5,	%o2
	subccc	%o0,	0x104B,	%i1
loop_522:
	fpadd16s	%f7,	%f9,	%f29
	orn	%l6,	%l5,	%i0
	array16	%i7,	%l1,	%i5
	srl	%o1,	%o7,	%g5
	fnot1	%f18,	%f6
	nop 	! 	tpos	%icc,	0x6 changed by convert2hboot
	add	%i2,	0x0232,	%g2
	edge32	%l0,	%g6,	%i3
	mulscc	%g1,	0x0750,	%g7
	sethi	0x090F,	%o4
	membar	0x08
	fmovdge	%xcc,	%f12,	%f20
	fbuge,a	%fcc1,	loop_523
	std	%f8,	[%l7 + 0x60]
	xnor	%l3,	0x13DB,	%i4
	fmovrdlz	%o3,	%f18,	%f26
loop_523:
	fsrc1s	%f30,	%f6
	stx	%l2,	[%l7 + 0x58]
	set	0x24, %g4
	nop	 ! 	ldswa	[%l7 + %g4] 0x10,	%i6 ASI use changed by convert2hboot
	orn	%l4,	0x18B5,	%g3
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	sllx	%g4,	%o5,	%o6
	addcc	%o0,	%o2,	%l6
	ldsh	[%l7 + 0x48],	%i1
	array32	%l5,	%i0,	%i7
	wr	%g0,	0x89,	%asi
	nop 	! 	tcs	%icc,	0x3 changed by convert2hboot
	edge8n	%o1,	%o7,	%l1
	array16	%i2,	%g2,	%l0
	subc	%g5,	%g6,	%i3
	srlx	%g7,	%o4,	%g1
	movcs	%icc,	%i4,	%o3
	movn	%xcc,	%l2,	%l3
	array16	%i6,	%l4,	%g3
	fxnors	%f22,	%f29,	%f13
	ldx	[%l7 + 0x40],	%g4
	fmovde	%icc,	%f17,	%f11
	subccc	%o6,	%o0,	%o2
	smul	%o5,	%l6,	%l5
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	xorcc	%i0,	%i1,	%i5
	sllx	%i7,	0x0E,	%o1
	flush	%l7 + 0x10
	popc	%o7,	%l1
	set	0x6C, %i7
	nop	 ! 	lduwa	[%l7 + %i7] 0x89,	%i2 ASI use changed by convert2hboot
	wr	%g0,	0x80,	%asi
	bne,pt	%xcc,	loop_524
	fmovrdne	%l0,	%f2,	%f4
	nop 	! 	tcs	%icc,	0x4 changed by convert2hboot
	movge	%xcc,	%g5,	%i3
loop_524:
	srl	%g6,	0x19,	%o4
	addc	%g7,	0x0F6D,	%i4
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	set	0x38, %i2
	nop	 ! 	lduha	[%l7 + %i2] 0x14,	%o3 ASI use changed by convert2hboot
	andn	%l2,	0x0897,	%l3
	fones	%f1
	wr	%g0,	0x19,	%asi
	edge32ln	%l4,	%g1,	%g4
	sdiv	%o6,	0x192C,	%o0
	fbuge,a	%fcc2,	loop_525
	add	%o2,	%g3,	%o5
	bcs,pn	%icc,	loop_526
	udiv	%l6,	0x0D87,	%l5
loop_525:
	fornot1	%f16,	%f2,	%f18
	for	%f2,	%f22,	%f12
loop_526:
	umulcc	%i1,	0x12D3,	%i0
	fand	%f2,	%f0,	%f26
	edge32l	%i7,	%i5,	%o7
	sdiv	%l1,	0x0ED6,	%o1
	sll	%g2,	0x15,	%i2
	edge16n	%g5,	%l0,	%g6
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
	sdivcc	%o4,	0x0F02,	%i3
	nop 	! 	taddcc	%i4,	0x11DF,	%g7 changed by convert2hboot
	movrgz	%o3,	0x27F,	%l3
	sth	%l2,	[%l7 + 0x5E]
	fmul8ulx16	%f14,	%f10,	%f16
	movleu	%icc,	%i6,	%g1
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	array8	%g4,	%o6,	%o0
	movl	%icc,	%l4,	%o2
	srl	%g3,	0x0B,	%l6
	nop 	! 	taddcctv	%o5,	%l5,	%i1 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x4 changed by convert2hboot
	nop
	set	0x4E, %o0
	lduh	[%l7 + %o0],	%i7
	array32	%i0,	%i5,	%o7
	fbug,a	%fcc0,	loop_527
	move	%xcc,	%l1,	%o1
	movneg	%xcc,	%g2,	%i2
	smul	%g5,	%l0,	%o4
loop_527:
	sdiv	%i3,	0x1BD7,	%i4
	fbu,a	%fcc2,	loop_528
	and	%g6,	%o3,	%g7
	lduh	[%l7 + 0x12],	%l3
	nop 	! 	tneg	%xcc,	0x7 changed by convert2hboot
loop_528:
	bvc	loop_529
	popc	%l2,	%g1
	movrgz	%g4,	%i6,	%o0
	movrlz	%o6,	0x0D9,	%o2
loop_529:
	nop
	set	0x70, %o6
	nop	 ! 	stda	%g2,	[%l7 + %o6] 0x10 ASI use changed by convert2hboot
	bn,pt	%icc,	loop_530
	siam	0x6
	sdiv	%l4,	0x1247,	%l6
	movge	%icc,	%l5,	%i1
loop_530:
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	movl	%icc,	%i0,	%i5
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	nop 	! 	taddcctv	%l1,	%o1,	%g2 changed by convert2hboot
	movneg	%icc,	%i2,	%g5
	wr	%g0,	0x81,	%asi
	bleu,pt	%xcc,	loop_531
	std	%l0,	[%l7 + 0x78]
	edge32n	%o4,	%o7,	%i3
	ld	[%l7 + 0x34],	%f23
loop_531:
	edge32ln	%g6,	%i4,	%o3
	addc	%g7,	0x14BB,	%l2
	edge16ln	%l3,	%g1,	%i6
	addc	%o0,	0x03A3,	%o6
	fbue,a	%fcc3,	loop_532
	ldd	[%l7 + 0x20],	%f18
	or	%o2,	%g4,	%l4
	udivx	%g3,	0x0F84,	%l5
loop_532:
	fmovdne	%xcc,	%f29,	%f11
	subc	%l6,	%i7,	%i1
	movrgez	%i0,	0x0D7,	%o5
	alignaddr	%i5,	%l1,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%i2,	%o1
	set	0x32, %i3
	nop	 ! 	stba	%l0,	[%l7 + %i3] 0x2b ASI use changed by convert2hboot
	membar	#Sync
	movle	%icc,	%g5,	%o4
	sethi	0x0E20,	%i3
	edge16ln	%g6,	%i4,	%o3
	nop 	! 	tleu	%xcc,	0x0 changed by convert2hboot
	and	%o7,	0x1B04,	%g7
	movrgz	%l2,	%l3,	%i6
	fmovdpos	%xcc,	%f16,	%f10
	edge16ln	%o0,	%o6,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%g1,	%f4,	%f2
	udiv	%g4,	0x03DA,	%g3
	fcmple32	%f14,	%f24,	%l4
	sub	%l5,	%i7,	%l6
	st	%f22,	[%l7 + 0x48]
	xnorcc	%i1,	%o5,	%i5
	movleu	%xcc,	%l1,	%g2
	bpos	%icc,	loop_533
	movrne	%i2,	%o1,	%l0
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	sdivx	%i0,	0x0EB2,	%o4
loop_533:
	fpsub32	%f2,	%f14,	%f16
	edge16	%i3,	%g5,	%g6
	subc	%i4,	0x0FC7,	%o3
	edge16	%g7,	%l2,	%o7
	fcmpne16	%f26,	%f26,	%i6
	fbule	%fcc0,	loop_534
	bvs,pn	%icc,	loop_535
	fmovdvc	%icc,	%f11,	%f13
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
loop_534:
	nop
	set	0x38, %o3
	nop	 ! 	stba	%o0,	[%l7 + %o3] 0x2f ASI use changed by convert2hboot
	membar	#Sync
loop_535:
	smul	%l3,	%o6,	%o2
	edge8	%g4,	%g1,	%l4
	movrgz	%l5,	0x3C0,	%g3
	set	0x50, %i1
	nop	 ! 	ldswa	[%l7 + %i1] 0x14,	%i7 ASI use changed by convert2hboot
	wr	%g0,	0x19,	%asi
	nop
	set	0x4C, %l1
	ldsh	[%l7 + %l1],	%l6
	nop
	setx	loop_536,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fmovsgu	%icc,	%f5,	%f12
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	fpsub16	%f18,	%f8,	%f16
loop_536:
	brnz	%o5,	loop_537
	movrgz	%i5,	0x0BD,	%l1
	fmul8x16au	%f5,	%f14,	%f20
	bpos,a	%icc,	loop_538
loop_537:
	fabsd	%f28,	%f18
	wr	%g0,	0x23,	%asi
	membar	#Sync
loop_538:
	nop 	! 	tle	%xcc,	0x0 changed by convert2hboot
	ldsw	[%l7 + 0x48],	%o1
	fmovsa	%xcc,	%f12,	%f7
	edge8n	%l0,	%i2,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f6,	%f4,	%i0
	sllx	%i3,	0x14,	%g5
	fbge	%fcc3,	loop_539
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
	array8	%i4,	%g6,	%g7
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
loop_539:
	fmovrse	%l2,	%f22,	%f15
	bcc,a	loop_540
	array32	%o3,	%o7,	%i6
	ldd	[%l7 + 0x18],	%l2
	movrgez	%o6,	0x2EC,	%o0
loop_540:
	bg,a,pn	%xcc,	loop_541
	nop 	! 	tl	%icc,	0x5 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
	brlez,a	%o2,	loop_542
loop_541:
	fandnot1s	%f29,	%f7,	%f23
	wr	%g0,	0x81,	%asi
loop_542:
	nop
	set	0x76, %i6
	nop	 ! 	stba	%g1,	[%l7 + %i6] 0xea ASI use changed by convert2hboot
	membar	#Sync
	fmul8x16al	%f16,	%f22,	%f16
	sra	%l5,	0x14,	%l4
	fxnor	%f2,	%f24,	%f10
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	sdivx	%i7,	0x1B0A,	%i1
	nop 	! 	tsubcc	%g3,	0x0829,	%o5 changed by convert2hboot
	fmovdneg	%xcc,	%f27,	%f17
	fmovsge	%xcc,	%f15,	%f9
	set	0x20, %i5
	nop	 ! 	ldda	[%l7 + %i5] 0x2a,	%i4 ASI use changed by convert2hboot
	udivcc	%l6,	0x1936,	%l1
	fmovrsne	%o1,	%f3,	%f5
	addc	%l0,	0x1E4B,	%i2
	orcc	%g2,	0x0A36,	%o4
	andcc	%i0,	%g5,	%i3
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	bgu,a	loop_543
	faligndata	%f2,	%f18,	%f26
	ba,pn	%xcc,	loop_544
	bvc,pn	%xcc,	loop_545
loop_543:
	ldub	[%l7 + 0x75],	%g6
	sra	%g7,	0x06,	%i4
loop_544:
	fpadd32s	%f29,	%f7,	%f19
loop_545:
	bgu	loop_546
	nop 	! 	taddcc	%o3,	%o7,	%i6 changed by convert2hboot
	std	%f24,	[%l7 + 0x58]
	fble	%fcc2,	loop_547
loop_546:
	nop 	! 	tsubcctv	%l2,	0x05C5,	%o6 changed by convert2hboot
	fbuge	%fcc2,	loop_548
	nop 	! 	tleu	%icc,	0x7 changed by convert2hboot
loop_547:
	subccc	%l3,	0x1AD7,	%o2
	fsrc2s	%f30,	%f24
loop_548:
	array16	%o0,	%g4,	%g1
	fba	%fcc1,	loop_549
	subc	%l4,	%i7,	%l5
	fbg,a	%fcc2,	loop_550
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
loop_549:
	fmovse	%icc,	%f3,	%f26
	fbug	%fcc3,	loop_551
loop_550:
	udiv	%i1,	0x0CAB,	%o5
	fmovspos	%icc,	%f10,	%f6
	bvs,pn	%icc,	loop_552
loop_551:
	nop
	set	0x08, %o5
	prefetch	[%l7 + %o5],	 0x1
	fmovsgu	%xcc,	%f25,	%f19
	fbge,a	%fcc3,	loop_553
loop_552:
	andncc	%g3,	%i5,	%l1
	bvs	%icc,	loop_554
	edge32ln	%l6,	%o1,	%l0
loop_553:
	fabsd	%f4,	%f26
	nop 	! 	tge	%icc,	0x0 changed by convert2hboot
loop_554:
	bcs	loop_555
	stb	%g2,	[%l7 + 0x73]
	fmovrdgz	%i2,	%f2,	%f20
	movn	%icc,	%o4,	%i0
loop_555:
	movleu	%icc,	%i3,	%g5
	wr	%g0,	0x27,	%asi
	membar	#Sync
	popc	%g7,	%i4
	subc	%o3,	0x17DD,	%i6
	srax	%l2,	%o7,	%o6
	smulcc	%o2,	%l3,	%o0
	smulcc	%g1,	0x1715,	%l4
	nop 	! 	tvc	%icc,	0x2 changed by convert2hboot
	set	0x70, %l5
	nop	 ! 	ldda	[%l7 + %l5] 0x2a,	%g4 ASI use changed by convert2hboot
	bvs	%icc,	loop_556
	call	loop_557
	movrne	%i7,	%i1,	%o5
	movl	%xcc,	%g3,	%l5
loop_556:
	nop 	! 	ta	%icc,	0x2 changed by convert2hboot
loop_557:
	nop
	setx loop_558, %l0, %l1
	jmpl %l1, %l1
	fcmpne16	%f6,	%f8,	%i5
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
	fcmpgt16	%f26,	%f26,	%o1
loop_558:
	edge16	%l0,	%l6,	%g2
	membar	0x77
	movne	%icc,	%o4,	%i2
	bleu,a	%icc,	loop_559
	faligndata	%f0,	%f8,	%f4
	edge32l	%i3,	%i0,	%g5
	sub	%g7,	%g6,	%i4
loop_559:
	addccc	%i6,	0x105F,	%l2
	movcs	%xcc,	%o3,	%o7
	set	0x50, %o7
	nop	 ! 	ldda	[%l7 + %o7] 0x23,	%o6 ASI use changed by convert2hboot
	fmovsge	%xcc,	%f13,	%f14
	fornot1	%f4,	%f30,	%f28
	fmul8x16	%f27,	%f12,	%f10
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	ldx	[%l7 + 0x68],	%o2
	fpadd32	%f6,	%f2,	%f16
	array32	%l3,	%o0,	%l4
	udivcc	%g4,	0x0AD4,	%g1
	movneg	%icc,	%i1,	%i7
	edge8n	%o5,	%l5,	%l1
	fmovs	%f3,	%f13
	add	%g3,	0x11C4,	%i5
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	fmovdle	%icc,	%f17,	%f21
	wr	%g0,	0x89,	%asi
	movvc	%xcc,	%l6,	%o1
	popc	%g2,	%o4
	sllx	%i3,	0x0A,	%i2
	fornot1s	%f3,	%f9,	%f22
	nop 	! 	tvs	%xcc,	0x2 changed by convert2hboot
	membar	0x68
	edge32n	%g5,	%i0,	%g6
	ldsb	[%l7 + 0x76],	%i4
	sdiv	%g7,	0x0ADD,	%i6
	edge16ln	%l2,	%o7,	%o6
	xnor	%o3,	0x058A,	%l3
	nop 	! 	tne	%xcc,	0x5 changed by convert2hboot
	std	%o0,	[%l7 + 0x10]
	brnz,a	%l4,	loop_560
	sdiv	%g4,	0x07FA,	%o2
	edge32ln	%i1,	%i7,	%o5
	xorcc	%l5,	%l1,	%g3
loop_560:
	xnor	%i5,	%g1,	%l6
	fpadd32	%f22,	%f14,	%f8
	bcs,pt	%xcc,	loop_561
	ldsb	[%l7 + 0x75],	%l0
	set	0x20, %o2
	nop	 ! 	swapa	[%l7 + %o2] 0x04,	%g2 ASI use changed by convert2hboot
loop_561:
	movg	%icc,	%o4,	%i3
	andn	%i2,	0x0A64,	%o1
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	ldd	[%l7 + 0x78],	%f12
	set	0x1C, %g3
	nop	 ! 	stwa	%g5,	[%l7 + %g3] 0x89 ASI use changed by convert2hboot
	alignaddrl	%g6,	%i0,	%i4
	sllx	%g7,	0x15,	%i6
	ldsw	[%l7 + 0x60],	%l2
	nop 	! 	ta	%icc,	0x7 changed by convert2hboot
	edge8n	%o7,	%o3,	%o6
	sethi	0x08D9,	%o0
	mulscc	%l3,	%l4,	%g4
	ld	[%l7 + 0x1C],	%f1
	fcmpne32	%f12,	%f26,	%o2
	movn	%xcc,	%i7,	%o5
	membar	0x60
	fmovdge	%xcc,	%f2,	%f5
	fsrc2s	%f29,	%f1
	fmovsneg	%icc,	%f17,	%f10
	fpadd32s	%f5,	%f9,	%f14
	movne	%xcc,	%l5,	%i1
	call	loop_562
	srl	%g3,	%i5,	%g1
	fsrc2	%f18,	%f10
	ld	[%l7 + 0x0C],	%f1
loop_562:
	sub	%l1,	0x04E3,	%l6
	edge16l	%l0,	%g2,	%o4
	movgu	%icc,	%i2,	%o1
	nop
	setx	loop_563,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fnand	%f26,	%f8,	%f28
	stx	%g5,	[%l7 + 0x38]
	fbu	%fcc2,	loop_564
loop_563:
	nop 	! 	taddcctv	%g6,	0x0711,	%i0 changed by convert2hboot
	udivcc	%i4,	0x0216,	%i3
	fbuge,a	%fcc3,	loop_565
loop_564:
	edge8ln	%i6,	%g7,	%o7
	fmovrdlez	%l2,	%f30,	%f12
	wr	%g0,	0xe2,	%asi
	membar	#Sync
loop_565:
	edge32	%o0,	%o6,	%l3
	addccc	%g4,	%l4,	%o2
	popc	%i7,	%o5
	fmovdcc	%icc,	%f27,	%f6
	srlx	%l5,	0x00,	%i1
	fsrc2s	%f9,	%f23
	bneg,a,pn	%icc,	loop_566
	fbg	%fcc3,	loop_567
	nop
	setx loop_568, %l0, %l1
	jmpl %l1, %g3
	membar	0x55
loop_566:
	edge8n	%i5,	%l1,	%l6
loop_567:
	bcc,a,pn	%xcc,	loop_569
loop_568:
	nop 	! 	tsubcc	%g1,	%g2,	%l0 changed by convert2hboot
	fandnot1s	%f2,	%f12,	%f27
	edge32l	%o4,	%o1,	%g5
loop_569:
	nop 	! 	tgu	%xcc,	0x5 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g6,	%i0,	%i2
	movg	%icc,	%i3,	%i6
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%g7,	%i4,	%l2
	array16	%o3,	%o7,	%o6
	nop 	! 	tvc	%icc,	0x0 changed by convert2hboot
	fabss	%f5,	%f0
	movl	%icc,	%l3,	%o0
	bneg,a,pt	%xcc,	loop_570
	sll	%l4,	%o2,	%i7
	set	0x08, %g7
	nop	 ! 	stda	%g4,	[%l7 + %g7] 0x14 ASI use changed by convert2hboot
loop_570:
	edge8	%o5,	%l5,	%g3
	fmovsvs	%icc,	%f3,	%f3
	nop 	! 	tge	%icc,	0x0 changed by convert2hboot
	fbug,a	%fcc0,	loop_571
	subccc	%i1,	0x10BE,	%l1
	alignaddrl	%i5,	%l6,	%g1
	movre	%g2,	%o4,	%o1
loop_571:
	fcmpne32	%f10,	%f16,	%l0
	edge8ln	%g5,	%i0,	%i2
	flush	%l7 + 0x3C
	lduw	[%l7 + 0x40],	%i3
	orcc	%g6,	%i6,	%g7
	set	0x14, %o4
	nop	 ! 	stwa	%i4,	[%l7 + %o4] 0x23 ASI use changed by convert2hboot
	membar	#Sync
	fpsub16	%f2,	%f22,	%f22
	lduh	[%l7 + 0x40],	%l2
	fbne	%fcc3,	loop_572
	fbuge,a	%fcc0,	loop_573
	bvs,a,pt	%xcc,	loop_574
	popc	0x11B1,	%o7
loop_572:
	andncc	%o6,	%o3,	%o0
loop_573:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_574:
	bcs	loop_575
	ble,a,pt	%icc,	loop_576
	movne	%xcc,	%l4,	%l3
	alignaddrl	%i7,	%g4,	%o5
loop_575:
	subc	%l5,	%g3,	%o2
loop_576:
	edge16ln	%i1,	%i5,	%l1
	bcs,a,pt	%icc,	loop_577
	bvs,pt	%icc,	loop_578
	orn	%l6,	%g2,	%o4
	movgu	%xcc,	%g1,	%l0
loop_577:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	nop	 ! 	casxa	[%l6] 0x80,	%g5,	%o1 ASI use changed by convert2hboot
loop_578:
	edge16	%i2,	%i3,	%g6
	and	%i6,	%g7,	%i0
	movleu	%icc,	%i4,	%l2
	set	0x1A, %g6
	nop	 ! 	ldsha	[%l7 + %g6] 0x04,	%o7 ASI use changed by convert2hboot
	set	0x0E, %g5
	nop	 ! 	lduba	[%l7 + %g5] 0x88,	%o6 ASI use changed by convert2hboot
	std	%o2,	[%l7 + 0x68]
	addccc	%o0,	%l4,	%l3
	xnorcc	%i7,	0x0A49,	%g4
	nop
	setx	loop_579,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fmovrslz	%o5,	%f14,	%f20
	umul	%g3,	%l5,	%i1
	edge16l	%o2,	%i5,	%l1
loop_579:
	fabsd	%f22,	%f26
	stx	%g2,	[%l7 + 0x60]
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	movle	%xcc,	%o4,	%l6
	movcs	%icc,	%g1,	%g5
	mova	%xcc,	%l0,	%i2
	nop
	set	0x28, %l3
	ldd	[%l7 + %l3],	%o0
	udiv	%g6,	0x0E0E,	%i6
	edge32n	%i3,	%g7,	%i0
	stw	%l2,	[%l7 + 0x7C]
	nop 	! 	tsubcctv	%o7,	0x0261,	%i4 changed by convert2hboot
	addc	%o3,	0x148F,	%o6
	membar	#Sync
	set	0x40, %o1
	nop	 ! 	ldda	[%l7 + %o1] 0xf9,	%f16 ASI use changed by convert2hboot
	fexpand	%f9,	%f22
	fxnor	%f22,	%f0,	%f2
	smul	%l4,	%o0,	%l3
	edge8n	%g4,	%i7,	%g3
	movle	%icc,	%o5,	%i1
	fmovdl	%icc,	%f4,	%f21
	fmovdg	%icc,	%f31,	%f12
	edge8	%l5,	%i5,	%o2
	sth	%l1,	[%l7 + 0x26]
	alignaddr	%g2,	%o4,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l6,	0x06D,	%g5
	udivcc	%i2,	0x0F73,	%l0
	udivcc	%g6,	0x0780,	%i6
	fpadd16s	%f9,	%f21,	%f31
	fmul8ulx16	%f18,	%f20,	%f26
	fmovdpos	%xcc,	%f17,	%f7
	movvs	%xcc,	%o1,	%g7
	fbe	%fcc0,	loop_580
	fabss	%f20,	%f3
	fmovdge	%xcc,	%f29,	%f22
	movgu	%icc,	%i3,	%i0
loop_580:
	movge	%icc,	%o7,	%i4
	smulcc	%o3,	%l2,	%o6
	wr	%g0,	0x27,	%asi
	membar	#Sync
	movcc	%icc,	%o0,	%l3
	edge32l	%g4,	%i7,	%g3
	movre	%i1,	%l5,	%o5
	fmovrdne	%i5,	%f8,	%f10
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
	nop
	set	0x44, %g1
	stw	%o2,	[%l7 + %g1]
	fnot2	%f14,	%f0
	movrgz	%l1,	0x2E4,	%g2
	fcmpeq32	%f2,	%f12,	%g1
	andncc	%o4,	%g5,	%i2
	fbug	%fcc3,	loop_581
	fbg,a	%fcc2,	loop_582
	movge	%icc,	%l0,	%g6
	move	%icc,	%l6,	%o1
loop_581:
	nop 	! 	tvc	%icc,	0x2 changed by convert2hboot
loop_582:
	sra	%g7,	0x18,	%i3
	fmovde	%icc,	%f16,	%f26
	nop 	! 	tle	%icc,	0x6 changed by convert2hboot
	fmovdgu	%xcc,	%f19,	%f18
	fsrc2s	%f12,	%f5
	ldsw	[%l7 + 0x54],	%i6
	fmovrdgez	%i0,	%f16,	%f4
	sdivcc	%o7,	0x16AC,	%i4
	bvs,a	%xcc,	loop_583
	bgu,a,pt	%icc,	loop_584
	edge16n	%l2,	%o3,	%o6
	edge8ln	%l4,	%l3,	%g4
loop_583:
	nop 	! 	taddcc	%o0,	%i7,	%i1 changed by convert2hboot
loop_584:
	fmuld8ulx16	%f27,	%f22,	%f18
	umul	%g3,	0x0CAF,	%l5
	movvs	%xcc,	%i5,	%o2
	fpsub32	%f26,	%f22,	%f28
	sdivx	%l1,	0x10CA,	%g2
	set	0x40, %l4
	nop	 ! 	ldda	[%l7 + %l4] 0x0c,	%f16 ASI use changed by convert2hboot
	fmovrdlz	%o5,	%f16,	%f16
	movneg	%icc,	%g1,	%o4
	fmovrdgez	%g5,	%f0,	%f20
	fbu,a	%fcc1,	loop_585
	edge16n	%i2,	%g6,	%l6
	movrlez	%o1,	0x35F,	%l0
	nop 	! 	tg	%xcc,	0x7 changed by convert2hboot
loop_585:
	orncc	%i3,	0x081A,	%i6
	alignaddrl	%i0,	%o7,	%g7
	addccc	%i4,	%l2,	%o6
	fmovrdgez	%o3,	%f18,	%f2
	fcmpne32	%f16,	%f26,	%l3
	nop 	! 	tl	%xcc,	0x2 changed by convert2hboot
	movleu	%xcc,	%l4,	%g4
	fmovdn	%xcc,	%f20,	%f14
	ld	[%l7 + 0x40],	%f30
	fone	%f22
	bl,a	%xcc,	loop_586
	movcs	%icc,	%o0,	%i7
	fcmpd	%fcc3,	%f4,	%f4
	edge32	%i1,	%g3,	%i5
loop_586:
	fbule	%fcc3,	loop_587
	movrgz	%l5,	0x2D0,	%o2
	wr	%g0,	0x89,	%asi
loop_587:
	fmovsge	%icc,	%f29,	%f14
	stx	%o5,	[%l7 + 0x58]
	std	%f4,	[%l7 + 0x20]
	bg,pt	%xcc,	loop_588
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	movgu	%xcc,	%l1,	%g1
	subc	%g5,	%i2,	%g6
loop_588:
	fcmple32	%f16,	%f22,	%l6
	be,pt	%xcc,	loop_589
	xnor	%o4,	0x0CCD,	%l0
	andncc	%i3,	%i6,	%i0
	fbe	%fcc1,	loop_590
loop_589:
	nop
	set	0x3A, %l6
	sth	%o7,	[%l7 + %l6]
	fbge	%fcc3,	loop_591
	udivcc	%o1,	0x1244,	%g7
loop_590:
	fpsub32s	%f9,	%f13,	%f23
	nop
	setx	loop_592,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_591:
	be,pt	%xcc,	loop_593
	movn	%xcc,	%i4,	%o6
	ldsh	[%l7 + 0x26],	%o3
loop_592:
	nop
	wr	%g0,	0xf1,	%asi
	membar	#Sync
loop_593:
	fnot1s	%f26,	%f22
	wr	%g0,	0x80,	%asi
	sdivcc	%l3,	0x152B,	%l4
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
	fbule,a	%fcc1,	loop_594
	edge16n	%g4,	%i7,	%i1
	std	%f18,	[%l7 + 0x08]
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
loop_594:
	nop
	set	0x3E, %i0
	nop	 ! 	lduha	[%l7 + %i0] 0x89,	%g3 ASI use changed by convert2hboot
	udiv	%o0,	0x0757,	%l5
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%f24
	subcc	%o2,	%g2,	%i5
	brlz,a	%l1,	loop_595
	udivcc	%g1,	0x0B6E,	%g5
	movle	%xcc,	%i2,	%o5
	movleu	%icc,	%g6,	%o4
loop_595:
	nop 	! 	tsubcctv	%l6,	%i3,	%l0 changed by convert2hboot
	set	0x28, %l0
	nop	 ! 	swapa	[%l7 + %l0] 0x0c,	%i0 ASI use changed by convert2hboot
	nop 	! 	tle	%icc,	0x4 changed by convert2hboot
	ble,a,pt	%xcc,	loop_596
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	fbge	%fcc0,	loop_597
	brgz	%o7,	loop_598
loop_596:
	srlx	%o1,	%i6,	%g7
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
loop_597:
	movl	%icc,	%i4,	%o3
loop_598:
	fbue	%fcc1,	loop_599
	fand	%f30,	%f4,	%f18
	mulscc	%l2,	%o6,	%l4
	sdivx	%l3,	0x067D,	%g4
loop_599:
	fmovdpos	%xcc,	%f26,	%f25
	movcs	%xcc,	%i1,	%g3
	fandnot1	%f8,	%f4,	%f30
	movgu	%xcc,	%i7,	%l5
	movcs	%icc,	%o0,	%g2
	ld	[%l7 + 0x3C],	%f4
	bne,a	loop_600
	bge,pt	%xcc,	loop_601
	nop 	! 	tleu	%xcc,	0x0 changed by convert2hboot
	smul	%i5,	%o2,	%g1
loop_600:
	smul	%g5,	%i2,	%o5
loop_601:
	std	%f12,	[%l7 + 0x08]
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g6,	0x1968,	%l1
	movl	%icc,	%l6,	%o4
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	st	%f1,	[%l7 + 0x50]
	add	%i3,	0x0947,	%i0
	movg	%xcc,	%o7,	%o1
	movrlez	%i6,	0x0A1,	%g7
	smulcc	%l0,	%o3,	%i4
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
	wr	%g0,	0x10,	%asi
	sta	%f25,	[%l7 + 0x20] %asi
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	fcmpgt16	%f18,	%f16,	%o6
	stx	%l2,	[%l7 + 0x18]
	nop 	! 	tsubcctv	%l4,	%g4,	%l3 changed by convert2hboot
	srl	%g3,	0x05,	%i7
	fpack16	%f4,	%f8
	fnot2s	%f24,	%f3
	add	%i1,	0x1513,	%l5
	membar	#Sync
	set	0x40, %g2
	nop	 ! 	ldda	[%l7 + %g2] 0xf0,	%f0 ASI use changed by convert2hboot
	mulscc	%g2,	%i5,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o0,	0x1A4,	%g5
	fnors	%f27,	%f19,	%f25
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	fnegs	%f23,	%f25
	movg	%icc,	%g1,	%i2
	set	0x68, %i4
	nop	 ! 	stda	%g6,	[%l7 + %i4] 0xeb ASI use changed by convert2hboot
	membar	#Sync
	fbne	%fcc1,	loop_602
	pdist	%f26,	%f26,	%f2
	fornot2s	%f9,	%f20,	%f5
	sdivx	%o5,	0x1739,	%l6
loop_602:
	fblg	%fcc2,	loop_603
	movneg	%xcc,	%o4,	%l1
	udivx	%i0,	0x1A60,	%o7
	fbu	%fcc0,	loop_604
loop_603:
	edge16	%o1,	%i3,	%g7
	fmovdneg	%icc,	%f17,	%f4
	fnot2	%f16,	%f26
loop_604:
	fcmple32	%f10,	%f26,	%l0
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tvs	%xcc,	0x2 changed by convert2hboot
	wr	%g0,	0x10,	%asi
	nop
	setx	loop_605,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	srl	%i6,	0x1E,	%o6
	fmovde	%xcc,	%f27,	%f25
	fnegd	%f16,	%f22
loop_605:
	sdivx	%i4,	0x087B,	%l2
	edge8ln	%g4,	%l4,	%g3
	wr	%g0,	0x89,	%asi
	edge8ln	%l3,	%i1,	%l5
	alignaddrl	%g2,	%i5,	%o2
	fnors	%f26,	%f31,	%f26
	be,a,pt	%icc,	loop_606
	xor	%o0,	0x02F6,	%g1
	smul	%g5,	0x16AF,	%i2
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
loop_606:
	siam	0x3
	sdiv	%o5,	0x016A,	%g6
	udivcc	%l6,	0x19E6,	%o4
	orncc	%i0,	0x0307,	%l1
	nop 	! 	tgu	%xcc,	0x6 changed by convert2hboot
	movle	%icc,	%o7,	%o1
	movge	%icc,	%g7,	%i3
	fbu	%fcc3,	loop_607
	bshuffle	%f2,	%f2,	%f2
	nop 	! 	tge	%icc,	0x2 changed by convert2hboot
	edge8	%l0,	%o3,	%i6
loop_607:
	movrne	%i4,	%l2,	%o6
	ba,a	%xcc,	loop_608
	brlz,a	%l4,	loop_609
	edge8ln	%g3,	%i7,	%l3
	fcmpeq32	%f30,	%f28,	%g4
loop_608:
	ldx	[%l7 + 0x08],	%i1
loop_609:
	movn	%icc,	%l5,	%g2
	call	loop_610
	edge8l	%i5,	%o0,	%o2
	nop 	! 	tgu	%xcc,	0x4 changed by convert2hboot
	sdivx	%g5,	0x0EC9,	%g1
loop_610:
	fcmple32	%f28,	%f0,	%o5
	fpadd32	%f8,	%f6,	%f14
	ld	[%l7 + 0x4C],	%f1
	edge8l	%i2,	%g6,	%l6
	sra	%o4,	0x11,	%i0
	movg	%xcc,	%o7,	%o1
	andncc	%l1,	%g7,	%l0
	fmul8x16al	%f13,	%f27,	%f14
	movge	%icc,	%o3,	%i6
	fnor	%f2,	%f16,	%f20
	fmovdne	%xcc,	%f30,	%f30
	subc	%i4,	0x0CB1,	%l2
	fmovdvc	%icc,	%f27,	%f17
	nop 	! 	tsubcctv	%i3,	%o6,	%l4 changed by convert2hboot
	srl	%g3,	%l3,	%i7
	stb	%i1,	[%l7 + 0x6B]
	set	0x30, %i7
	nop	 ! 	ldda	[%l7 + %i7] 0x22,	%g4 ASI use changed by convert2hboot
	udivx	%g2,	0x1B6D,	%l5
	fmul8x16	%f14,	%f22,	%f6
	flush	%l7 + 0x14
	move	%xcc,	%o0,	%o2
	flush	%l7 + 0x5C
	or	%i5,	%g1,	%g5
	andn	%o5,	%g6,	%l6
	fmovdvs	%icc,	%f27,	%f25
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	edge8	%i2,	%o4,	%i0
	bpos,a	loop_611
	movneg	%xcc,	%o1,	%o7
	orncc	%g7,	0x18AF,	%l0
	fpsub16s	%f9,	%f3,	%f31
loop_611:
	xorcc	%l1,	0x0DFA,	%i6
	edge16ln	%i4,	%l2,	%o3
	fmovsvc	%icc,	%f7,	%f13
	addc	%i3,	%o6,	%l4
	fmovdcs	%xcc,	%f16,	%f3
	udivcc	%l3,	0x0591,	%g3
	nop
	setx loop_612, %l0, %l1
	jmpl %l1, %i7
	bvc,a,pn	%icc,	loop_613
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	or	%g4,	0x08A1,	%g2
loop_612:
	movrlez	%i1,	0x2AC,	%l5
loop_613:
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	fxors	%f2,	%f6,	%f16
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	movrlz	%o2,	0x12F,	%o0
	xnor	%i5,	%g1,	%o5
	andn	%g5,	%l6,	%g6
	fpadd32	%f26,	%f4,	%f30
	ldx	[%l7 + 0x70],	%i2
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	fbg	%fcc2,	loop_614
	edge8	%o4,	%i0,	%o7
	alignaddrl	%o1,	%l0,	%l1
	brgez	%g7,	loop_615
loop_614:
	fmovd	%f18,	%f20
	fors	%f14,	%f14,	%f15
	edge16ln	%i6,	%l2,	%i4
loop_615:
	fxor	%f4,	%f6,	%f30
	array32	%i3,	%o3,	%o6
	nop
	setx	loop_616,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movrlz	%l3,	0x2BD,	%l4
	addc	%g3,	0x112B,	%g4
	movrlez	%g2,	0x3E5,	%i7
loop_616:
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	nop 	! 	taddcctv	%l5,	%i1,	%o0 changed by convert2hboot
	movvc	%icc,	%o2,	%i5
	array8	%g1,	%o5,	%g5
	lduh	[%l7 + 0x58],	%g6
	edge32n	%i2,	%o4,	%i0
	sdivx	%l6,	0x1DB8,	%o7
	nop 	! 	tle	%icc,	0x4 changed by convert2hboot
	ldd	[%l7 + 0x18],	%l0
	movn	%icc,	%l1,	%g7
	srlx	%o1,	0x1B,	%l2
	brnz,a	%i4,	loop_617
	fcmple16	%f18,	%f2,	%i3
	srax	%i6,	%o3,	%l3
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
loop_617:
	srl	%l4,	%o6,	%g3
	srax	%g2,	0x0E,	%g4
	subccc	%i7,	%l5,	%o0
	fexpand	%f2,	%f24
	nop 	! 	sir	0x1716 changed by convert2hboot
	fnegd	%f6,	%f26
	swap	[%l7 + 0x20],	%i1
	fmovsn	%xcc,	%f21,	%f4
	movle	%xcc,	%o2,	%i5
	move	%xcc,	%o5,	%g5
	membar	0x79
	movge	%icc,	%g1,	%i2
	nop
	setx loop_618, %l0, %l1
	jmpl %l1, %o4
	bneg,a,pt	%xcc,	loop_619
	fcmple16	%f26,	%f20,	%g6
	nop
	setx	loop_620,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_618:
	movpos	%icc,	%l6,	%o7
loop_619:
	ldub	[%l7 + 0x3A],	%l0
	fbl	%fcc0,	loop_621
loop_620:
	fnor	%f0,	%f24,	%f20
	nop
	set	0x20, %g4
	stx	%i0,	[%l7 + %g4]
	edge8ln	%l1,	%o1,	%g7
loop_621:
	fzeros	%f24
	fandnot1	%f16,	%f18,	%f20
	nop
	set	0x53, %i2
	ldub	[%l7 + %i2],	%i4
	fbug	%fcc3,	loop_622
	bg	%icc,	loop_623
	movcs	%icc,	%l2,	%i6
	fmovdle	%xcc,	%f24,	%f3
loop_622:
	addccc	%o3,	0x0B30,	%l3
loop_623:
	nop 	! 	sir	0x13B6 changed by convert2hboot
	fnot1s	%f5,	%f24
	movn	%xcc,	%l4,	%i3
	fandnot1	%f30,	%f12,	%f12
	fsrc1s	%f24,	%f20
	fpack32	%f20,	%f16,	%f30
	mulscc	%g3,	0x163E,	%g2
	bvs,pn	%icc,	loop_624
	fmul8ulx16	%f28,	%f0,	%f16
	ldd	[%l7 + 0x70],	%o6
	fmul8x16al	%f29,	%f18,	%f18
loop_624:
	membar	0x5E
	bleu,a,pn	%xcc,	loop_625
	smul	%g4,	%i7,	%l5
	wr	%g0,	0x11,	%asi
loop_625:
	edge8ln	%i1,	%o2,	%i5
	fmovrslez	%o5,	%f18,	%f9
	subcc	%g1,	%g5,	%i2
	brgez	%g6,	loop_626
	movleu	%icc,	%l6,	%o7
	sdiv	%l0,	0x1830,	%o4
	ba,a	loop_627
loop_626:
	bneg,pt	%icc,	loop_628
	sdiv	%i0,	0x1253,	%o1
	fandnot2s	%f10,	%f12,	%f18
loop_627:
	sdivx	%l1,	0x0FEA,	%i4
loop_628:
	fbul	%fcc1,	loop_629
	edge32l	%l2,	%i6,	%g7
	ldstub	[%l7 + 0x4E],	%l3
	brgz,a	%l4,	loop_630
loop_629:
	movne	%icc,	%i3,	%g3
	fmovrsgez	%o3,	%f25,	%f7
	ldsh	[%l7 + 0x3A],	%g2
loop_630:
	edge16l	%o6,	%g4,	%l5
	fzeros	%f23
	sub	%o0,	%i1,	%i7
	sll	%i5,	0x0F,	%o2
	brz,a	%g1,	loop_631
	umul	%o5,	0x15F9,	%i2
	fmovrdgez	%g5,	%f26,	%f18
	edge32n	%g6,	%o7,	%l0
loop_631:
	movl	%xcc,	%o4,	%i0
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	fnegs	%f28,	%f19
	edge16ln	%o1,	%l6,	%l1
	srax	%i4,	%l2,	%i6
	movne	%icc,	%l3,	%l4
	fpsub32s	%f6,	%f28,	%f7
	set	0x10, %o6
	nop	 ! 	stda	%g6,	[%l7 + %o6] 0xe2 ASI use changed by convert2hboot
	membar	#Sync
	sth	%i3,	[%l7 + 0x42]
	udivx	%o3,	0x154A,	%g2
	fmuld8ulx16	%f30,	%f18,	%f22
	fmovrsne	%o6,	%f11,	%f5
	fcmpes	%fcc1,	%f24,	%f29
	ld	[%l7 + 0x54],	%f7
	srl	%g4,	0x1E,	%g3
	fmovdvs	%xcc,	%f28,	%f17
	fnors	%f24,	%f1,	%f16
	set	0x20, %i3
	nop	 ! 	stxa	%o0,	[%l7 + %i3] 0x14 ASI use changed by convert2hboot
	mova	%icc,	%l5,	%i7
	addc	%i1,	%i5,	%g1
	movn	%xcc,	%o2,	%o5
	fbg	%fcc3,	loop_632
	fcmpne32	%f2,	%f8,	%i2
	umul	%g6,	0x1A2A,	%g5
	fxors	%f0,	%f23,	%f19
loop_632:
	sra	%o7,	0x04,	%o4
	bgu,a	%icc,	loop_633
	movre	%i0,	0x270,	%o1
	set	0x62, %o0
	nop	 ! 	lduha	[%l7 + %o0] 0x04,	%l6 ASI use changed by convert2hboot
loop_633:
	array8	%l0,	%l1,	%l2
	bgu,pt	%icc,	loop_634
	fmul8x16al	%f7,	%f15,	%f2
	bneg,a,pt	%xcc,	loop_635
	mova	%icc,	%i4,	%i6
loop_634:
	call	loop_636
	movne	%icc,	%l4,	%g7
loop_635:
	movrlz	%l3,	%i3,	%o3
	ldsb	[%l7 + 0x2A],	%g2
loop_636:
	fbuge	%fcc3,	loop_637
	fbne,a	%fcc1,	loop_638
	orn	%o6,	0x1CB0,	%g3
	ldd	[%l7 + 0x60],	%g4
loop_637:
	sdiv	%l5,	0x1BC5,	%o0
loop_638:
	fnegs	%f14,	%f10
	and	%i1,	%i7,	%i5
	nop
	setx	loop_639,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fcmpeq16	%f18,	%f22,	%g1
	addccc	%o5,	0x14E3,	%o2
	ldsh	[%l7 + 0x74],	%i2
loop_639:
	fmovdn	%icc,	%f5,	%f22
	addcc	%g6,	%o7,	%g5
	sll	%i0,	0x1E,	%o1
	array8	%l6,	%o4,	%l1
	nop 	! 	tvc	%icc,	0x5 changed by convert2hboot
	edge16ln	%l2,	%l0,	%i4
	andn	%i6,	%g7,	%l3
	sdiv	%i3,	0x0CF0,	%l4
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
	fmovrslz	%o3,	%f3,	%f27
	sdivx	%o6,	0x1AF3,	%g3
	and	%g4,	%l5,	%g2
	fcmpd	%fcc3,	%f26,	%f6
	nop 	! 	tsubcctv	%i1,	%i7,	%i5 changed by convert2hboot
	movgu	%xcc,	%o0,	%g1
	fnors	%f17,	%f17,	%f5
	nop 	! 	taddcc	%o2,	0x074B,	%o5 changed by convert2hboot
	edge8n	%i2,	%g6,	%g5
	siam	0x0
	movpos	%xcc,	%o7,	%i0
	or	%l6,	0x0F3F,	%o1
	fcmpeq32	%f20,	%f6,	%o4
	fmovsgu	%xcc,	%f24,	%f21
	movg	%icc,	%l1,	%l2
	movvc	%icc,	%l0,	%i4
	bn	%xcc,	loop_640
	subc	%i6,	0x0660,	%l3
	movgu	%icc,	%i3,	%l4
	ldub	[%l7 + 0x15],	%o3
loop_640:
	nop 	! 	tl	%xcc,	0x6 changed by convert2hboot
	fornot1s	%f25,	%f15,	%f3
	fmovdpos	%icc,	%f13,	%f12
	bcs	%icc,	loop_641
	alignaddr	%g7,	%g3,	%g4
	movle	%xcc,	%l5,	%o6
	wr	%g0,	0x10,	%asi
loop_641:
	nop 	! 	tpos	%icc,	0x3 changed by convert2hboot
	wr	%g0,	0x11,	%asi
	wr	%g0,	0x81,	%asi
	nop 	! 	tvc	%icc,	0x0 changed by convert2hboot
	fmovsvc	%icc,	%f15,	%f2
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	bl,a,pt	%xcc,	loop_642
	edge16l	%i5,	%o0,	%g1
	movne	%xcc,	%o5,	%o2
	std	%i2,	[%l7 + 0x50]
loop_642:
	edge32	%g6,	%g5,	%i0
	wr	%g0,	0x16,	%asi
	membar	#Sync
	edge16l	%l6,	%o7,	%o1
	array8	%o4,	%l1,	%l0
	fpadd16	%f6,	%f2,	%f6
	edge16	%i4,	%i6,	%l3
	fmovdle	%xcc,	%f14,	%f18
	fexpand	%f15,	%f22
	udiv	%l2,	0x0E9C,	%i3
	fmovscs	%icc,	%f5,	%f5
	ldx	[%l7 + 0x70],	%l4
	addc	%o3,	0x09D6,	%g3
	ld	[%l7 + 0x24],	%f2
	movrgz	%g4,	0x21E,	%l5
	set	0x08, %i1
	nop	 ! 	stda	%o6,	[%l7 + %i1] 0x2b ASI use changed by convert2hboot
	membar	#Sync
	fpmerge	%f5,	%f30,	%f14
	movge	%xcc,	%g7,	%i7
	bshuffle	%f30,	%f12,	%f10
	sdivcc	%i1,	0x1DFE,	%i5
	set	0x18, %o3
	sta	%f6,	[%l7 + %o3] 0x11
	fone	%f2
	wr	%g0,	0x22,	%asi
	membar	#Sync
	lduh	[%l7 + 0x72],	%g1
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	movre	%g2,	%o2,	%o5
	array32	%g6,	%i2,	%g5
	fbo,a	%fcc2,	loop_643
	umul	%l6,	0x1F0C,	%i0
	nop 	! 	sir	0x0F10 changed by convert2hboot
	set	0x56, %i6
	nop	 ! 	ldsba	[%l7 + %i6] 0x88,	%o1 ASI use changed by convert2hboot
loop_643:
	fnand	%f16,	%f20,	%f14
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	movrlez	%o4,	0x11D,	%l1
	wr	%g0,	0x89,	%asi
	sllx	%l0,	0x10,	%i4
	ldd	[%l7 + 0x08],	%l2
	fbu	%fcc1,	loop_644
	movl	%icc,	%l2,	%i3
	xnor	%l4,	0x07AF,	%o3
	movrne	%g3,	%i6,	%g4
loop_644:
	srl	%o6,	%g7,	%i7
	brz	%l5,	loop_645
	fmovdvc	%icc,	%f1,	%f2
	sdivcc	%i1,	0x1645,	%o0
	bshuffle	%f2,	%f20,	%f30
loop_645:
	stw	%i5,	[%l7 + 0x74]
	edge32n	%g2,	%g1,	%o5
	sdivcc	%o2,	0x1AC8,	%g6
	fcmpeq32	%f18,	%f28,	%i2
	bleu,pn	%xcc,	loop_646
	srax	%g5,	%l6,	%i0
	edge16	%o4,	%o1,	%o7
	fbug,a	%fcc1,	loop_647
loop_646:
	fmul8ulx16	%f12,	%f10,	%f10
	edge32	%l0,	%l1,	%l3
	or	%i4,	0x0497,	%l2
loop_647:
	fnot2s	%f1,	%f3
	xnor	%i3,	0x1BA6,	%l4
	nop 	! 	taddcctv	%o3,	%i6,	%g3 changed by convert2hboot
	edge16ln	%o6,	%g4,	%i7
	call	loop_648
	fba,a	%fcc1,	loop_649
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
loop_648:
	membar	0x64
loop_649:
	nop 	! 	taddcctv	%l5,	%g7,	%o0 changed by convert2hboot
	ldd	[%l7 + 0x40],	%f4
	popc	0x01B8,	%i1
	sub	%i5,	0x1365,	%g1
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
	fmovdne	%xcc,	%f8,	%f10
	movcs	%icc,	%g2,	%o2
	faligndata	%f12,	%f2,	%f22
	fabss	%f29,	%f3
	ldub	[%l7 + 0x32],	%g6
	st	%f23,	[%l7 + 0x0C]
	nop 	! 	tn	%xcc,	0x5 changed by convert2hboot
	movpos	%xcc,	%o5,	%g5
	xorcc	%l6,	0x1F97,	%i2
	edge8ln	%o4,	%o1,	%o7
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i0,	%l1,	%l3
	subccc	%l0,	0x111B,	%i4
	fbe,a	%fcc0,	loop_650
	movvs	%icc,	%l2,	%l4
	subcc	%o3,	0x16EC,	%i6
	sdivcc	%g3,	0x0E93,	%i3
loop_650:
	sethi	0x011F,	%o6
	andn	%i7,	%l5,	%g7
	edge32ln	%g4,	%i1,	%o0
	nop 	! 	tle	%xcc,	0x5 changed by convert2hboot
	nop 	! 	ta	%xcc,	0x4 changed by convert2hboot
	edge8l	%i5,	%g1,	%g2
	movcc	%xcc,	%g6,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%icc,	%f29,	%f26
	fcmpgt32	%f0,	%f4,	%o2
	edge32n	%g5,	%i2,	%o4
	nop 	! 	tsubcctv	%l6,	0x160B,	%o7 changed by convert2hboot
	fbg	%fcc3,	loop_651
	fmovrslz	%o1,	%f5,	%f30
	fmovd	%f8,	%f8
	array16	%l1,	%l3,	%i0
loop_651:
	nop
	setx	loop_652,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	subccc	%i4,	0x12A4,	%l2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
loop_652:
	fmovdvc	%xcc,	%f7,	%f19
	xnor	%o3,	%g3,	%i6
	stw	%o6,	[%l7 + 0x48]
	fblg	%fcc2,	loop_653
	bleu,a	loop_654
	xor	%i3,	0x1A01,	%l5
	fnegs	%f10,	%f4
loop_653:
	movvc	%icc,	%i7,	%g4
loop_654:
	orcc	%g7,	0x1102,	%o0
	movleu	%icc,	%i1,	%g1
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
	fandnot1	%f28,	%f12,	%f16
	movvc	%icc,	%g2,	%g6
	addccc	%i5,	%o5,	%g5
	fcmpeq16	%f10,	%f10,	%i2
	fmovrdlz	%o2,	%f22,	%f8
	fbug,a	%fcc2,	loop_655
	movcc	%icc,	%l6,	%o7
	fones	%f23
	subcc	%o1,	0x15A1,	%l1
loop_655:
	fbg	%fcc1,	loop_656
	movrne	%l3,	0x09D,	%i0
	ldsb	[%l7 + 0x78],	%o4
	fands	%f14,	%f2,	%f1
loop_656:
	bshuffle	%f24,	%f18,	%f12
	subc	%l2,	%i4,	%l0
	andcc	%l4,	%o3,	%i6
	movpos	%xcc,	%o6,	%g3
	fmovrdne	%i3,	%f0,	%f6
	bne	%xcc,	loop_657
	fbe,a	%fcc0,	loop_658
	nop
	set	0x75, %l1
	ldsb	[%l7 + %l1],	%i7
	fmovsleu	%xcc,	%f21,	%f18
loop_657:
	edge16n	%l5,	%g7,	%g4
loop_658:
	and	%i1,	0x098F,	%g1
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	srl	%o0,	%g6,	%g2
	fbu,a	%fcc2,	loop_659
	xorcc	%i5,	0x0062,	%g5
	set	0x60, %o5
	nop	 ! 	lduwa	[%l7 + %o5] 0x15,	%o5 ASI use changed by convert2hboot
loop_659:
	subc	%i2,	0x0538,	%l6
	fbg	%fcc3,	loop_660
	nop 	! 	taddcctv	%o2,	0x10BB,	%o7 changed by convert2hboot
	movpos	%xcc,	%l1,	%o1
	sethi	0x15C4,	%i0
loop_660:
	nop 	! 	taddcc	%l3,	%o4,	%i4 changed by convert2hboot
	fbu,a	%fcc1,	loop_661
	bne,a,pt	%xcc,	loop_662
	nop 	! 	taddcctv	%l0,	0x10E6,	%l2 changed by convert2hboot
	edge16	%o3,	%l4,	%o6
loop_661:
	bge,a,pn	%icc,	loop_663
loop_662:
	movrlez	%g3,	%i3,	%i6
	sub	%i7,	0x1ED9,	%l5
	movn	%xcc,	%g7,	%i1
loop_663:
	nop
	setx loop_664, %l0, %l1
	jmpl %l1, %g1
	andncc	%o0,	%g6,	%g2
	fnot2s	%f22,	%f21
	sll	%g4,	%g5,	%i5
loop_664:
	sll	%o5,	%l6,	%i2
	fand	%f0,	%f12,	%f26
	fmovrdne	%o2,	%f26,	%f22
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
	umulcc	%l1,	0x0E02,	%o7
	sdiv	%i0,	0x15F7,	%o1
	mulscc	%o4,	0x0E31,	%l3
	fcmps	%fcc0,	%f6,	%f7
	alignaddr	%l0,	%l2,	%i4
	sllx	%l4,	%o3,	%o6
	fpack32	%f8,	%f30,	%f8
	sdiv	%g3,	0x1694,	%i3
	add	%i7,	%i6,	%l5
	movvc	%icc,	%i1,	%g7
	brz	%g1,	loop_665
	fsrc2	%f28,	%f8
	movvc	%icc,	%o0,	%g6
	subcc	%g4,	0x1AB9,	%g2
loop_665:
	andn	%i5,	%g5,	%l6
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
	ldd	[%l7 + 0x30],	%o4
	xor	%o2,	0x15B4,	%i2
	siam	0x3
	fmovrsgez	%o7,	%f16,	%f2
	edge32l	%i0,	%o1,	%l1
	addc	%o4,	0x14CF,	%l0
	alignaddr	%l3,	%l2,	%l4
	smul	%i4,	%o6,	%g3
	bcs	%icc,	loop_666
	srlx	%i3,	%o3,	%i7
	movneg	%xcc,	%l5,	%i1
	edge8	%i6,	%g1,	%g7
loop_666:
	movrlz	%o0,	0x21F,	%g4
	ldsw	[%l7 + 0x28],	%g2
	sdivx	%i5,	0x1861,	%g6
	fnot2s	%f21,	%f7
	bcs,a,pn	%xcc,	loop_667
	ldx	[%l7 + 0x78],	%l6
	fmuld8ulx16	%f10,	%f12,	%f28
	edge8	%o5,	%g5,	%i2
loop_667:
	fmovrdgz	%o2,	%f8,	%f4
	movleu	%icc,	%i0,	%o7
	fbg,a	%fcc2,	loop_668
	ble	%xcc,	loop_669
	movg	%xcc,	%l1,	%o1
	movrlez	%o4,	0x251,	%l3
loop_668:
	fmovrde	%l2,	%f2,	%f0
loop_669:
	movge	%icc,	%l0,	%i4
	fpsub16s	%f10,	%f15,	%f19
	subccc	%o6,	0x0D89,	%l4
	set	0x34, %l5
	nop	 ! 	lduha	[%l7 + %l5] 0x80,	%i3 ASI use changed by convert2hboot
	udiv	%g3,	0x11DD,	%i7
	fmovde	%icc,	%f1,	%f4
	fnand	%f22,	%f18,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x56
	movrgz	%l5,	0x39D,	%o3
	nop
	set	0x30, %o7
	ldsh	[%l7 + %o7],	%i6
	sdiv	%g1,	0x1464,	%i1
	fpackfix	%f28,	%f7
	wr	%g0,	0x88,	%asi
	sra	%g7,	%g2,	%i5
	addccc	%g6,	%g4,	%l6
	bcc,a	loop_670
	fmovse	%icc,	%f29,	%f28
	fxnor	%f22,	%f30,	%f30
	alignaddrl	%o5,	%i2,	%o2
loop_670:
	fmovsa	%icc,	%f10,	%f23
	array8	%g5,	%o7,	%l1
	ldd	[%l7 + 0x48],	%f20
	mova	%xcc,	%i0,	%o4
	move	%xcc,	%l3,	%l2
	ldsh	[%l7 + 0x72],	%o1
	nop 	! 	tsubcc	%i4,	%o6,	%l4 changed by convert2hboot
	sethi	0x0B71,	%l0
	nop 	! 	sir	0x154E changed by convert2hboot
	bpos	loop_671
	brnz	%i3,	loop_672
	fmovdneg	%xcc,	%f19,	%f27
	set	0x22, %i5
	nop	 ! 	ldsba	[%l7 + %i5] 0x88,	%i7 ASI use changed by convert2hboot
loop_671:
	fnot1	%f0,	%f18
loop_672:
	movrlz	%g3,	%l5,	%i6
	subccc	%g1,	%i1,	%o3
	nop
	setx loop_673, %l0, %l1
	jmpl %l1, %o0
	edge8ln	%g2,	%i5,	%g6
	sra	%g7,	%l6,	%o5
	wr	%g0,	0x11,	%asi
	sta	%f7,	[%l7 + 0x24] %asi
loop_673:
	move	%xcc,	%g4,	%i2
	movrlez	%o2,	%g5,	%o7
	nop 	! 	tle	%xcc,	0x0 changed by convert2hboot
	movge	%icc,	%i0,	%l1
	fnot2	%f10,	%f4
	fbug,a	%fcc1,	loop_674
	smul	%l3,	%l2,	%o1
	movrlz	%i4,	0x028,	%o6
	fpackfix	%f26,	%f21
loop_674:
	fones	%f0
	fcmpd	%fcc1,	%f6,	%f6
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	set	0x3A, %g3
	nop	 ! 	ldsha	[%l7 + %g3] 0x88,	%l4 ASI use changed by convert2hboot
	fmovrsgz	%o4,	%f31,	%f21
	brlz	%i3,	loop_675
	ldub	[%l7 + 0x46],	%l0
	orncc	%i7,	0x0A19,	%g3
	udivcc	%l5,	0x034D,	%i6
loop_675:
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	andncc	%i1,	%o3,	%g1
	umul	%o0,	0x0012,	%g2
	fmovsne	%icc,	%f0,	%f6
	fmuld8sux16	%f8,	%f0,	%f24
	edge32	%i5,	%g6,	%g7
	mova	%xcc,	%o5,	%g4
	edge32ln	%i2,	%l6,	%o2
	edge8l	%o7,	%g5,	%i0
	wr	%g0,	0x5f,	%asi
	brnz,a	%l2,	loop_676
	edge16	%o1,	%l1,	%i4
	movg	%xcc,	%l4,	%o4
	fmovrslz	%o6,	%f15,	%f16
loop_676:
	xor	%i3,	0x1BE5,	%l0
	edge8	%g3,	%i7,	%i6
	mulscc	%l5,	%o3,	%i1
	fmovdl	%icc,	%f25,	%f14
	movneg	%xcc,	%o0,	%g2
	sub	%i5,	0x1EF4,	%g1
	ldx	[%l7 + 0x28],	%g6
	movrgez	%g7,	0x17D,	%g4
	andn	%o5,	%i2,	%l6
	sub	%o2,	%o7,	%i0
	andn	%l3,	0x0670,	%l2
	ba,a	%icc,	loop_677
	add	%o1,	%g5,	%l1
	xnorcc	%i4,	0x1CE4,	%l4
	alignaddr	%o6,	%i3,	%l0
loop_677:
	fmovdvs	%xcc,	%f7,	%f3
	fba	%fcc1,	loop_678
	stx	%o4,	[%l7 + 0x18]
	xorcc	%i7,	%g3,	%i6
	movrlez	%o3,	%i1,	%l5
loop_678:
	mova	%xcc,	%o0,	%g2
	mulx	%g1,	%i5,	%g7
	fandnot2s	%f12,	%f28,	%f17
	st	%f3,	[%l7 + 0x34]
	movgu	%icc,	%g6,	%o5
	nop 	! 	sir	0x0D9D changed by convert2hboot
	fxnor	%f20,	%f2,	%f12
	fbu,a	%fcc0,	loop_679
	umul	%i2,	0x0DA1,	%l6
	bgu,pn	%xcc,	loop_680
	andncc	%o2,	%g4,	%o7
loop_679:
	movn	%icc,	%l3,	%i0
	movg	%icc,	%l2,	%g5
loop_680:
	orn	%o1,	%l1,	%i4
	fcmpgt32	%f6,	%f30,	%o6
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	edge32	%l4,	%l0,	%i3
	edge16n	%o4,	%g3,	%i6
	bvs,a	%icc,	loop_681
	fmovsgu	%icc,	%f8,	%f17
	smul	%i7,	0x1783,	%i1
	edge16l	%o3,	%o0,	%g2
loop_681:
	fcmpgt16	%f24,	%f24,	%g1
	fones	%f22
	fornot2s	%f31,	%f16,	%f4
	movrgz	%i5,	%l5,	%g7
	umulcc	%g6,	%i2,	%o5
	set	0x14, %g7
	nop	 ! 	stha	%l6,	[%l7 + %g7] 0x80 ASI use changed by convert2hboot
	sdivx	%g4,	0x0978,	%o2
	fmovdcc	%icc,	%f20,	%f3
	brgz,a	%l3,	loop_682
	movg	%icc,	%i0,	%l2
	edge8ln	%o7,	%o1,	%g5
	fones	%f20
loop_682:
	bcc,a,pn	%xcc,	loop_683
	fmuld8ulx16	%f28,	%f4,	%f10
	xnor	%l1,	%o6,	%l4
	edge32l	%i4,	%i3,	%l0
loop_683:
	bleu	loop_684
	movneg	%icc,	%o4,	%g3
	edge16	%i7,	%i6,	%i1
	brnz,a	%o3,	loop_685
loop_684:
	move	%icc,	%o0,	%g2
	move	%xcc,	%i5,	%g1
	orn	%g7,	0x158D,	%g6
loop_685:
	mova	%xcc,	%l5,	%i2
	array32	%l6,	%o5,	%g4
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	ldd	[%l7 + 0x28],	%f0
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	bcc,a	%icc,	loop_686
	fpadd16s	%f8,	%f19,	%f0
	swap	[%l7 + 0x74],	%o2
	fbo	%fcc2,	loop_687
loop_686:
	movre	%l3,	%i0,	%l2
	prefetch	[%l7 + 0x4C],	 0x0
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
loop_687:
	srl	%o1,	%g5,	%o7
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
	bvc	%xcc,	loop_688
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
	movrlez	%l1,	0x01A,	%o6
	brgz,a	%l4,	loop_689
loop_688:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i4,	%l0,	%i3
	fmovdgu	%xcc,	%f10,	%f26
loop_689:
	mulscc	%o4,	0x07AA,	%g3
	fnands	%f28,	%f30,	%f16
	orncc	%i6,	%i1,	%o3
	bpos,a	loop_690
	sdiv	%i7,	0x096E,	%o0
	fpadd16s	%f18,	%f28,	%f17
	movle	%icc,	%i5,	%g2
loop_690:
	movn	%xcc,	%g7,	%g6
	umulcc	%l5,	0x1CDD,	%i2
	wr	%g0,	0x04,	%asi
	be,a	loop_691
	sdivcc	%o5,	0x0B46,	%l6
	addccc	%g4,	0x11F8,	%o2
	andn	%l3,	0x0221,	%l2
loop_691:
	nop 	! 	sir	0x142F changed by convert2hboot
	fpack32	%f10,	%f18,	%f4
	nop
	set	0x7F, %o2
	ldsb	[%l7 + %o2],	%o1
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
	fmul8x16al	%f1,	%f27,	%f30
	ldub	[%l7 + 0x74],	%g5
	movge	%icc,	%i0,	%o7
	subc	%l1,	%o6,	%i4
	subc	%l4,	0x1935,	%l0
	flush	%l7 + 0x28
	sll	%o4,	%i3,	%g3
	fmul8sux16	%f8,	%f6,	%f0
	fmovsge	%icc,	%f21,	%f22
	fmovsn	%xcc,	%f18,	%f15
	set	0x7C, %g6
	nop	 ! 	lduwa	[%l7 + %g6] 0x19,	%i6 ASI use changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	srlx	%o3,	0x04,	%i1
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	fpsub32	%f30,	%f22,	%f18
	or	%o0,	0x0798,	%i7
	bneg	%xcc,	loop_692
	alignaddrl	%g2,	%g7,	%g6
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%i4
	sllx	%i2,	%l5,	%g1
loop_692:
	orn	%o5,	0x0D81,	%g4
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	edge16l	%l6,	%o2,	%l3
	fexpand	%f29,	%f4
	fmovda	%icc,	%f13,	%f3
	fnot2	%f10,	%f18
	fpadd32	%f14,	%f24,	%f2
	restored
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
	wr	%g0,	0x19,	%asi
	sub	%g5,	%i0,	%l2
	bne	loop_693
	swap	[%l7 + 0x18],	%l1
	orn	%o6,	%i4,	%l4
	nop 	! 	sir	0x199C changed by convert2hboot
loop_693:
	movpos	%xcc,	%l0,	%o7
	fpadd32	%f30,	%f22,	%f0
	bne	%xcc,	loop_694
	alignaddrl	%o4,	%i3,	%i6
	fmovsl	%xcc,	%f27,	%f23
	stw	%o3,	[%l7 + 0x5C]
loop_694:
	nop 	! 	tsubcctv	%i1,	0x0B3E,	%g3 changed by convert2hboot
	movl	%xcc,	%i7,	%o0
	fmovrslz	%g2,	%f30,	%f20
	movrlz	%g6,	0x0A9,	%i5
	nop
	setx	loop_695,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	swap	[%l7 + 0x40],	%i2
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
	fmovrsgz	%g7,	%f19,	%f29
loop_695:
	andcc	%l5,	%g1,	%o5
	movle	%icc,	%l6,	%g4
	orcc	%l3,	0x1814,	%o1
	fornot1	%f6,	%f18,	%f6
	sll	%o2,	0x12,	%i0
	edge32l	%g5,	%l1,	%l2
	set	0x4C, %o4
	nop	 ! 	ldswa	[%l7 + %o4] 0x89,	%o6 ASI use changed by convert2hboot
	fmovrdne	%l4,	%f22,	%f18
	bl,a	loop_696
	ldub	[%l7 + 0x38],	%i4
	nop
	setx loop_697, %l0, %l1
	jmpl %l1, %o7
	xnorcc	%o4,	%l0,	%i6
loop_696:
	andcc	%o3,	0x043E,	%i1
	fpadd32	%f8,	%f2,	%f10
loop_697:
	umulcc	%i3,	%i7,	%g3
	edge16n	%o0,	%g2,	%i5
	nop 	! 	tsubcc	%i2,	0x03CC,	%g6 changed by convert2hboot
	fbge	%fcc3,	loop_698
	stx	%g7,	[%l7 + 0x40]
	movre	%l5,	0x1B1,	%o5
	fpsub16s	%f27,	%f29,	%f26
loop_698:
	movgu	%icc,	%l6,	%g1
	fnegd	%f10,	%f2
	fmovs	%f1,	%f14
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
	movrgez	%g4,	0x3C3,	%l3
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	fors	%f18,	%f31,	%f8
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	subccc	%o2,	0x08AC,	%i0
	smul	%g5,	0x1D10,	%o1
	umul	%l2,	0x1A27,	%l1
	smul	%o6,	%l4,	%i4
	nop 	! 	tcs	%icc,	0x7 changed by convert2hboot
	fbge	%fcc2,	loop_699
	orcc	%o7,	0x03E3,	%l0
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	nop
	setx loop_700, %l0, %l1
	jmpl %l1, %o4
loop_699:
	movgu	%icc,	%i6,	%i1
	movleu	%xcc,	%i3,	%i7
	fmovrdgez	%g3,	%f30,	%f16
loop_700:
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	movge	%icc,	%o3,	%o0
	umulcc	%g2,	0x1D19,	%i2
	move	%xcc,	%i5,	%g6
	xorcc	%g7,	%l5,	%o5
	popc	0x18B1,	%l6
	mulscc	%g4,	%l3,	%g1
	fornot2s	%f12,	%f0,	%f23
	popc	%o2,	%i0
	movle	%xcc,	%o1,	%g5
	edge32	%l1,	%l2,	%o6
	brz,a	%i4,	loop_701
	popc	%o7,	%l4
	fmovrdgz	%o4,	%f2,	%f24
	umulcc	%i6,	0x0E6B,	%l0
loop_701:
	fmovsvc	%xcc,	%f30,	%f9
	movn	%icc,	%i1,	%i3
	fabss	%f3,	%f28
	fbul	%fcc3,	loop_702
	sllx	%g3,	0x12,	%o3
	sethi	0x0427,	%o0
	bpos,a	loop_703
loop_702:
	movl	%xcc,	%i7,	%i2
	udivx	%g2,	0x0055,	%g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	nop	 ! 	casxa	[%l6] 0x81,	%i5,	%l5 ASI use changed by convert2hboot
loop_703:
	fornot1	%f0,	%f8,	%f26
	orncc	%g7,	0x1A36,	%o5
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	fmovsge	%xcc,	%f23,	%f15
	ldub	[%l7 + 0x58],	%l6
	edge32	%l3,	%g1,	%g4
	orncc	%i0,	%o2,	%g5
	movneg	%xcc,	%l1,	%l2
	movne	%icc,	%o1,	%o6
	fmul8ulx16	%f14,	%f26,	%f18
	fmovsleu	%icc,	%f2,	%f11
	movrlez	%i4,	0x05F,	%o7
	sdiv	%l4,	0x0F2E,	%o4
	fandnot2s	%f20,	%f11,	%f3
	wr	%g0,	0x80,	%asi
	sta	%f24,	[%l7 + 0x64] %asi
	sdivx	%i6,	0x10AB,	%l0
	fmul8sux16	%f10,	%f30,	%f2
	movn	%icc,	%i1,	%i3
	wr	%g0,	0x2f,	%asi
	membar	#Sync
	srlx	%o0,	0x05,	%g3
	mulx	%i7,	0x136C,	%g2
	brz	%i2,	loop_704
	orncc	%i5,	%l5,	%g7
	fcmpeq32	%f12,	%f4,	%g6
	fmovdneg	%xcc,	%f15,	%f4
loop_704:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f28,	[%l7 + 0x64] %asi
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	nop
	setx	loop_705,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	subcc	%l6,	0x1291,	%o5
	fcmpne32	%f22,	%f18,	%l3
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
loop_705:
	fba	%fcc0,	loop_706
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	fba	%fcc1,	loop_707
loop_706:
	fcmple32	%f26,	%f16,	%g4
	alignaddrl	%g1,	%i0,	%o2
	fpadd32s	%f11,	%f28,	%f31
loop_707:
	fones	%f31
	edge16	%g5,	%l1,	%l2
	fmovsa	%xcc,	%f14,	%f17
	ldsw	[%l7 + 0x60],	%o1
	fnor	%f4,	%f28,	%f0
	fpack32	%f16,	%f26,	%f12
	movne	%icc,	%i4,	%o7
	fbn,a	%fcc0,	loop_708
	fcmped	%fcc3,	%f2,	%f20
	call	loop_709
	fmovse	%xcc,	%f12,	%f14
loop_708:
	fbg	%fcc3,	loop_710
	edge32ln	%o6,	%o4,	%l4
loop_709:
	fbn,a	%fcc0,	loop_711
	edge32ln	%i6,	%l0,	%i3
loop_710:
	fnands	%f22,	%f17,	%f4
	fpsub32	%f18,	%f26,	%f18
loop_711:
	brlez	%i1,	loop_712
	subccc	%o3,	0x0CC8,	%o0
	nop 	! 	tsubcctv	%g3,	%i7,	%i2 changed by convert2hboot
	udiv	%g2,	0x1DFB,	%l5
loop_712:
	movrlz	%i5,	0x018,	%g7
	edge8ln	%g6,	%l6,	%o5
	bn,a	%icc,	loop_713
	brgez,a	%l3,	loop_714
	sub	%g4,	0x1A4C,	%i0
	fmovrdgez	%o2,	%f28,	%f0
loop_713:
	umulcc	%g1,	0x10B6,	%l1
loop_714:
	mova	%xcc,	%l2,	%o1
	fmovsa	%icc,	%f3,	%f23
	set	0x78, %l3
	nop	 ! 	stda	%i4,	[%l7 + %l3] 0xe3 ASI use changed by convert2hboot
	membar	#Sync
	array32	%o7,	%g5,	%o6
	fmovrdgez	%o4,	%f4,	%f6
	fbo,a	%fcc3,	loop_715
	andcc	%i6,	%l0,	%l4
	sll	%i3,	0x1F,	%o3
	sdiv	%i1,	0x0AB5,	%g3
loop_715:
	nop
	set	0x4C, %o1
	lda	[%l7 + %o1] 0x14,	%f6
	fmovdg	%icc,	%f22,	%f9
	popc	0x1EF3,	%i7
	array32	%o0,	%g2,	%l5
	movrne	%i5,	0x10F,	%g7
	bshuffle	%f12,	%f22,	%f28
	and	%g6,	%i2,	%o5
	movpos	%icc,	%l3,	%g4
	fmul8sux16	%f18,	%f14,	%f24
	fpackfix	%f6,	%f18
	wr	%g0,	0x58,	%asi
	sdiv	%o2,	0x0A77,	%l6
	wr	%g0,	0x0c,	%asi
	membar	0x16
	bn	%xcc,	loop_716
	edge32	%g1,	%l2,	%i4
	udiv	%o7,	0x19CA,	%o1
	srlx	%g5,	%o4,	%o6
loop_716:
	nop
	wr	%g0,	0x80,	%asi
	fcmpeq32	%f22,	%f30,	%l0
	siam	0x7
	nop 	! 	taddcc	%i6,	%l4,	%o3 changed by convert2hboot
	sub	%i3,	0x0DB0,	%i1
	fnot1s	%f29,	%f29
	nop 	! 	sir	0x0DA5 changed by convert2hboot
	mulscc	%g3,	0x170A,	%o0
	orncc	%g2,	0x09C2,	%l5
	movneg	%xcc,	%i5,	%i7
	ldsw	[%l7 + 0x60],	%g6
	nop 	! 	tg	%xcc,	0x3 changed by convert2hboot
	fmovrdlez	%g7,	%f14,	%f10
	nop 	! 	sir	0x114C changed by convert2hboot
	mulx	%i2,	0x072A,	%o5
	movg	%icc,	%g4,	%l3
	udivcc	%o2,	0x016B,	%i0
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
	fbug	%fcc2,	loop_717
	stx	%l1,	[%l7 + 0x40]
	and	%g1,	%l2,	%i4
	movgu	%icc,	%o7,	%l6
loop_717:
	movl	%icc,	%g5,	%o1
	andncc	%o4,	%l0,	%o6
	edge32n	%l4,	%i6,	%i3
	fsrc2s	%f4,	%f2
	set	0x40, %g1
	nop	 ! 	ldda	[%l7 + %g1] 0x88,	%f0 ASI use changed by convert2hboot
	flush	%l7 + 0x08
	nop 	! 	tsubcctv	%o3,	%i1,	%g3 changed by convert2hboot
	fxnor	%f10,	%f10,	%f24
	fmuld8sux16	%f21,	%f3,	%f2
	subcc	%o0,	%l5,	%g2
	set	0x40, %l4
	nop	 ! 	stda	%f16,	[%l7 + %l4] 0x0c ASI use changed by convert2hboot
	fbo	%fcc1,	loop_718
	movge	%xcc,	%i7,	%g6
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
	fcmpgt16	%f12,	%f6,	%g7
loop_718:
	fbn,a	%fcc3,	loop_719
	fbe	%fcc3,	loop_720
	movvc	%xcc,	%i5,	%i2
	nop
	setx loop_721, %l0, %l1
	jmpl %l1, %o5
loop_719:
	fbug	%fcc0,	loop_722
loop_720:
	nop 	! 	tle	%icc,	0x3 changed by convert2hboot
	lduh	[%l7 + 0x3A],	%g4
loop_721:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
loop_722:
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
	movrlz	%l1,	%g1,	%l2
	xor	%i4,	0x0364,	%i0
	edge16	%l6,	%g5,	%o7
	brgez	%o1,	loop_723
	fand	%f14,	%f4,	%f6
	edge16n	%o4,	%o6,	%l4
	edge8ln	%l0,	%i6,	%o3
loop_723:
	sra	%i3,	0x15,	%g3
	ldub	[%l7 + 0x22],	%o0
	nop
	set	0x60, %i0
	std	%l4,	[%l7 + %i0]
	wr	%g0,	0x2b,	%asi
	membar	#Sync
	subccc	%i7,	%g2,	%g7
	andcc	%g6,	%i2,	%i5
	fpack16	%f6,	%f1
	fmovscs	%xcc,	%f22,	%f14
	edge16n	%g4,	%o2,	%l3
	movpos	%xcc,	%o5,	%l1
	movge	%icc,	%l2,	%i4
	fabsd	%f8,	%f4
	fmovsneg	%icc,	%f17,	%f3
	fbo	%fcc1,	loop_724
	xorcc	%i0,	0x18E2,	%g1
	wr	%g0,	0x80,	%asi
loop_724:
	movleu	%icc,	%o7,	%o1
	fbule	%fcc1,	loop_725
	nop 	! 	sir	0x0C39 changed by convert2hboot
	nop 	! 	tsubcc	%o4,	%o6,	%l4 changed by convert2hboot
	fmul8x16au	%f30,	%f26,	%f28
loop_725:
	fmovde	%icc,	%f17,	%f13
	movre	%l0,	%i6,	%o3
	fpadd32	%f8,	%f2,	%f6
	edge32n	%l6,	%g3,	%i3
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	edge32ln	%o0,	%i1,	%i7
	movcc	%icc,	%g2,	%g7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	nop	 ! 	casxa	[%l6] 0x89,	%l5,	%g6 ASI use changed by convert2hboot
	membar	0x3C
	fbg,a	%fcc0,	loop_726
	nop 	! 	sir	0x0F15 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	fpsub16	%f26,	%f8,	%f28
loop_726:
	nop
	setx	loop_727,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movvc	%xcc,	%i2,	%g4
	sth	%i5,	[%l7 + 0x3C]
	edge8n	%l3,	%o2,	%l1
loop_727:
	stx	%o5,	[%l7 + 0x68]
	ldd	[%l7 + 0x78],	%l2
	fcmpne32	%f14,	%f20,	%i0
	move	%icc,	%g1,	%i4
	movneg	%xcc,	%o7,	%o1
	fabss	%f17,	%f8
	movl	%icc,	%g5,	%o4
	fmovrsgz	%l4,	%f28,	%f13
	xnor	%o6,	0x016A,	%i6
	edge8l	%l0,	%l6,	%o3
	movne	%xcc,	%g3,	%o0
	movcc	%icc,	%i3,	%i7
	smul	%i1,	0x0B9A,	%g2
	fmovdl	%icc,	%f5,	%f19
	movn	%xcc,	%l5,	%g7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	nop	 ! 	casa	[%l6] 0x89,	%i2,	%g4 ASI use changed by convert2hboot
	edge8ln	%i5,	%l3,	%g6
	nop 	! 	tsubcctv	%l1,	%o5,	%l2 changed by convert2hboot
	movn	%xcc,	%i0,	%g1
	array16	%o2,	%o7,	%i4
	movcs	%icc,	%o1,	%o4
	movg	%xcc,	%g5,	%o6
	be,a,pn	%icc,	loop_728
	bshuffle	%f16,	%f28,	%f22
	fmovdvs	%xcc,	%f25,	%f14
	fxnor	%f4,	%f26,	%f6
loop_728:
	edge16l	%i6,	%l0,	%l6
	movvs	%xcc,	%o3,	%g3
	edge8ln	%o0,	%i3,	%i7
	fba	%fcc3,	loop_729
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
	alignaddrl	%l4,	%i1,	%g2
	for	%f14,	%f24,	%f18
loop_729:
	fbuge	%fcc3,	loop_730
	fcmpne16	%f24,	%f16,	%l5
	umulcc	%i2,	%g4,	%i5
	addccc	%l3,	%g7,	%g6
loop_730:
	fble,a	%fcc3,	loop_731
	fors	%f14,	%f31,	%f8
	add	%o5,	0x1F51,	%l2
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
loop_731:
	mova	%xcc,	%l1,	%g1
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	fbo	%fcc0,	loop_732
	fmovsa	%xcc,	%f1,	%f3
	std	%i0,	[%l7 + 0x18]
	fbl	%fcc2,	loop_733
loop_732:
	fcmps	%fcc1,	%f16,	%f24
	movl	%icc,	%o2,	%o7
	bn,a	loop_734
loop_733:
	std	%o0,	[%l7 + 0x40]
	edge16l	%o4,	%i4,	%g5
	addcc	%o6,	0x0725,	%i6
loop_734:
	movrlz	%l6,	0x351,	%l0
	addc	%o3,	0x0055,	%g3
	bg,pt	%icc,	loop_735
	fmovdgu	%xcc,	%f3,	%f17
	subc	%o0,	%i7,	%i3
	fmovsl	%xcc,	%f19,	%f5
loop_735:
	fmovdpos	%icc,	%f16,	%f21
	fmovda	%icc,	%f19,	%f18
	fnegs	%f29,	%f21
	sllx	%l4,	0x06,	%i1
	movrlz	%l5,	%i2,	%g2
	movge	%xcc,	%i5,	%l3
	sethi	0x0002,	%g7
	alignaddr	%g6,	%g4,	%o5
	smulcc	%l1,	%g1,	%l2
	movg	%icc,	%o2,	%o7
	bl,a,pn	%xcc,	loop_736
	andncc	%i0,	%o4,	%o1
	srax	%i4,	%o6,	%i6
	fmovsne	%icc,	%f2,	%f10
loop_736:
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	fmovdge	%icc,	%f21,	%f28
	fmovdvc	%icc,	%f19,	%f9
	fpadd16s	%f31,	%f28,	%f18
	edge32l	%l6,	%l0,	%o3
	fcmpd	%fcc1,	%f20,	%f16
	fpsub32	%f20,	%f26,	%f2
	sra	%g3,	0x0C,	%g5
	mova	%icc,	%i7,	%o0
	edge8ln	%i3,	%l4,	%i1
	fornot2	%f12,	%f12,	%f22
	stb	%i2,	[%l7 + 0x34]
	set	0x33, %l2
	nop	 ! 	stba	%g2,	[%l7 + %l2] 0x19 ASI use changed by convert2hboot
	sethi	0x0EC4,	%i5
	fnot2	%f20,	%f10
	fmovrse	%l5,	%f29,	%f20
	wr	%g0,	0x2f,	%asi
	srax	%g6,	%g4,	%g7
	fbne,a	%fcc0,	loop_737
	stx	%o5,	[%l7 + 0x50]
	fmovrslez	%g1,	%f18,	%f6
	mova	%icc,	%l1,	%l2
loop_737:
	movge	%xcc,	%o2,	%i0
	sethi	0x1333,	%o4
	nop 	! 	tne	%xcc,	0x5 changed by convert2hboot
	nop 	! 	tleu	%xcc,	0x7 changed by convert2hboot
	udiv	%o1,	0x032D,	%o7
	fone	%f10
	edge8n	%o6,	%i4,	%i6
	fabsd	%f20,	%f8
	orn	%l0,	0x05E3,	%o3
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	ba,pn	%icc,	loop_738
	bvc,pt	%icc,	loop_739
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
loop_738:
	array32	%l6,	%g3,	%i7
loop_739:
	edge32ln	%o0,	%g5,	%i3
	orn	%i1,	0x08BE,	%l4
	fmovde	%xcc,	%f27,	%f7
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	srlx	%g2,	0x05,	%i2
	set	0x40, %l0
	nop	 ! 	stda	%f16,	[%l7 + %l0] 0x1f ASI use changed by convert2hboot
	membar	#Sync
	movrgez	%l5,	0x0C5,	%l3
	fmovsleu	%icc,	%f24,	%f31
	fble,a	%fcc1,	loop_740
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	fble	%fcc1,	loop_741
	sdiv	%g6,	0x105A,	%g4
loop_740:
	fandnot2s	%f7,	%f14,	%f27
	bneg,a	loop_742
loop_741:
	fpadd32	%f16,	%f16,	%f14
	orn	%i5,	0x12EB,	%g7
	udiv	%g1,	0x1239,	%o5
loop_742:
	smul	%l1,	%l2,	%o2
	movpos	%icc,	%i0,	%o1
	sdivcc	%o7,	0x101E,	%o4
	smul	%i4,	%o6,	%l0
	movl	%icc,	%o3,	%i6
	and	%g3,	%i7,	%l6
	wr	%g0,	0x89,	%asi
	movl	%xcc,	%i3,	%i1
	sdiv	%l4,	0x06D5,	%g2
	fmovdvc	%xcc,	%f11,	%f4
	add	%i2,	0x01DB,	%l5
	bge,pn	%icc,	loop_743
	andcc	%l3,	%o0,	%g6
	movpos	%icc,	%i5,	%g4
	wr	%g0,	0x19,	%asi
loop_743:
	sdivcc	%o5,	0x1F7B,	%l1
	fmovsl	%icc,	%f21,	%f6
	movrne	%l2,	%o2,	%g1
	fmovsne	%xcc,	%f6,	%f15
	movge	%xcc,	%o1,	%i0
	movre	%o7,	0x0B9,	%i4
	subccc	%o6,	%o4,	%l0
	fmovdge	%xcc,	%f20,	%f17
	movgu	%icc,	%o3,	%g3
	edge16ln	%i7,	%i6,	%l6
	ba,a,pn	%xcc,	loop_744
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	movrgz	%g5,	0x069,	%i3
loop_744:
	mulscc	%l4,	%i1,	%i2
	fmovde	%xcc,	%f17,	%f6
	orn	%g2,	0x0A3D,	%l5
	fmovdvs	%icc,	%f9,	%f4
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	array32	%l3,	%g6,	%o0
	bcs,pn	%xcc,	loop_745
	nop 	! 	tsubcctv	%g4,	0x076E,	%i5 changed by convert2hboot
	fmul8ulx16	%f8,	%f28,	%f26
	nop
	setx loop_746, %l0, %l1
	jmpl %l1, %o5
loop_745:
	ldstub	[%l7 + 0x1E],	%g7
	fmovrslez	%l2,	%f4,	%f7
	edge8l	%o2,	%l1,	%g1
loop_746:
	subc	%i0,	%o1,	%o7
	udivcc	%o6,	0x0BE2,	%i4
	movleu	%icc,	%l0,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g3,	0x088A,	%o3
	srax	%i7,	0x1B,	%l6
	movcc	%icc,	%i6,	%g5
	fmovrdlez	%l4,	%f30,	%f14
	popc	%i1,	%i2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x11,	%asi
	nop	 ! 	casa	[%l6] 0x11,	%g2,	%l5 ASI use changed by convert2hboot
	nop 	! 	taddcctv	%l3,	%i3,	%o0 changed by convert2hboot
	fbl,a	%fcc0,	loop_747
	edge32n	%g6,	%i5,	%o5
	nop 	! 	tsubcctv	%g7,	%l2,	%g4 changed by convert2hboot
	and	%o2,	0x176B,	%l1
loop_747:
	move	%icc,	%g1,	%i0
	wr	%g0,	0x80,	%asi
	fcmple32	%f28,	%f18,	%o6
	or	%o1,	0x0183,	%i4
	nop 	! 	taddcc	%o4,	%g3,	%l0 changed by convert2hboot
	addccc	%o3,	0x1C81,	%i7
	nop 	! 	tpos	%icc,	0x0 changed by convert2hboot
	bneg,a,pt	%xcc,	loop_748
	movrgz	%l6,	0x008,	%i6
	fandnot2	%f14,	%f2,	%f30
	fcmpgt32	%f30,	%f10,	%l4
loop_748:
	edge32	%i1,	%g5,	%g2
	nop 	! 	sir	0x1C4A changed by convert2hboot
	xnorcc	%i2,	0x005D,	%l5
	movpos	%icc,	%l3,	%i3
	addccc	%g6,	%i5,	%o0
	bcs,a,pt	%icc,	loop_749
	addcc	%o5,	%g7,	%l2
	faligndata	%f2,	%f24,	%f22
	xorcc	%o2,	%g4,	%g1
loop_749:
	nop 	! 	tcc	%icc,	0x1 changed by convert2hboot
	addcc	%l1,	0x1FB1,	%o7
	orcc	%i0,	%o6,	%o1
	ld	[%l7 + 0x0C],	%f11
	nop 	! 	taddcc	%i4,	%g3,	%o4 changed by convert2hboot
	bcs,pt	%icc,	loop_750
	fpadd32s	%f30,	%f1,	%f1
	array16	%l0,	%o3,	%l6
	srax	%i6,	%i7,	%l4
loop_750:
	nop
	set	0x72, %g2
	nop	 ! 	stba	%g5,	[%l7 + %g2] 0x0c ASI use changed by convert2hboot
	movneg	%icc,	%i1,	%i2
	ble,a,pn	%icc,	loop_751
	ldsw	[%l7 + 0x68],	%l5
	addccc	%l3,	%i3,	%g6
	move	%xcc,	%i5,	%o0
loop_751:
	movcs	%xcc,	%g2,	%o5
	fcmple32	%f24,	%f10,	%l2
	subcc	%o2,	0x010D,	%g7
	subc	%g1,	0x190F,	%l1
	srax	%o7,	%i0,	%o6
	srlx	%o1,	0x1A,	%i4
	udiv	%g3,	0x1588,	%o4
	fmul8ulx16	%f20,	%f12,	%f0
	add	%l0,	0x0FD2,	%g4
	edge16n	%o3,	%i6,	%l6
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
	array16	%l4,	%g5,	%i7
	orncc	%i1,	0x1E01,	%i2
	movneg	%xcc,	%l5,	%i3
	fbl,a	%fcc3,	loop_752
	movre	%g6,	0x3CD,	%l3
	subccc	%o0,	%i5,	%g2
	or	%l2,	%o2,	%o5
loop_752:
	edge32ln	%g7,	%g1,	%l1
	fandnot1	%f8,	%f12,	%f20
	fpadd32	%f10,	%f0,	%f2
	ldub	[%l7 + 0x27],	%o7
	srlx	%o6,	%i0,	%i4
	movg	%xcc,	%o1,	%o4
	bl,a	loop_753
	fmovsne	%xcc,	%f20,	%f8
	nop 	! 	tsubcc	%g3,	0x1209,	%g4 changed by convert2hboot
	fnors	%f20,	%f26,	%f23
loop_753:
	nop
	set	0x09, %l6
	nop	 ! 	ldstuba	[%l7 + %l6] 0x89,	%o3 ASI use changed by convert2hboot
	ldsh	[%l7 + 0x7A],	%l0
	or	%i6,	0x0E51,	%l4
	edge8l	%g5,	%i7,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f6,	%f8,	%l6
	edge16ln	%i2,	%i3,	%g6
	fmovrdne	%l3,	%f22,	%f8
	xorcc	%o0,	%l5,	%i5
	bcc,pn	%xcc,	loop_754
	fmul8x16	%f6,	%f18,	%f28
	fors	%f16,	%f23,	%f9
	set	0x0C, %i4
	nop	 ! 	ldswa	[%l7 + %i4] 0x19,	%g2 ASI use changed by convert2hboot
loop_754:
	sub	%o2,	0x00A9,	%l2
	add	%o5,	0x1E82,	%g7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	swap	[%l7 + 0x44],	%o7
	ldsh	[%l7 + 0x7E],	%i0
	set	0x2E, %g4
	nop	 ! 	ldsba	[%l7 + %g4] 0x0c,	%o6 ASI use changed by convert2hboot
	andncc	%i4,	%o1,	%o4
	nop 	! 	sir	0x01CC changed by convert2hboot
	brlz,a	%g4,	loop_755
	movne	%xcc,	%o3,	%g3
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	fbge,a	%fcc2,	loop_756
loop_755:
	sdivx	%l0,	0x08D0,	%i6
	fbul	%fcc0,	loop_757
	bgu,a,pt	%xcc,	loop_758
loop_756:
	smul	%l4,	0x13F4,	%i7
	set	0x44, %i7
	nop	 ! 	stwa	%g5,	[%l7 + %i7] 0x15 ASI use changed by convert2hboot
loop_757:
	umul	%i1,	%i2,	%l6
loop_758:
	movvs	%icc,	%i3,	%l3
	nop 	! 	tleu	%xcc,	0x5 changed by convert2hboot
	add	%o0,	0x199C,	%l5
	lduh	[%l7 + 0x4C],	%i5
	ldd	[%l7 + 0x68],	%f10
	fandnot2s	%f26,	%f9,	%f5
	sth	%g2,	[%l7 + 0x3E]
	bneg	loop_759
	fbug,a	%fcc3,	loop_760
	array32	%g6,	%o2,	%l2
	fmovrdgez	%g7,	%f30,	%f14
loop_759:
	fba,a	%fcc1,	loop_761
loop_760:
	subc	%o5,	0x03D8,	%g1
	udivx	%l1,	0x095B,	%i0
	fmovda	%xcc,	%f22,	%f26
loop_761:
	xorcc	%o6,	0x10B6,	%o7
	srax	%i4,	0x15,	%o1
	swap	[%l7 + 0x28],	%o4
	movcs	%xcc,	%o3,	%g4
	popc	0x1614,	%l0
	andcc	%i6,	%l4,	%g3
	fmul8x16au	%f31,	%f18,	%f22
	movcc	%icc,	%i7,	%g5
	movpos	%xcc,	%i2,	%i1
	fmovrdgz	%l6,	%f26,	%f12
	fornot2s	%f31,	%f16,	%f3
	orcc	%l3,	%i3,	%l5
	fpackfix	%f8,	%f13
	nop 	! 	tneg	%icc,	0x1 changed by convert2hboot
	movvs	%xcc,	%i5,	%g2
	bgu,a,pt	%xcc,	loop_762
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	smulcc	%o0,	0x1FFE,	%g6
	bvs,a	%xcc,	loop_763
loop_762:
	edge32ln	%l2,	%g7,	%o5
	fxnor	%f16,	%f26,	%f0
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
loop_763:
	fcmpes	%fcc2,	%f28,	%f4
	wr	%g0,	0x89,	%asi
	set	0x4E, %i2
	nop	 ! 	ldsha	[%l7 + %i2] 0x19,	%g1 ASI use changed by convert2hboot
	sllx	%i0,	%o6,	%o7
	movleu	%icc,	%l1,	%i4
	fmovrdlez	%o1,	%f30,	%f16
	edge32	%o4,	%o3,	%l0
	andcc	%i6,	%g4,	%g3
	fxnors	%f8,	%f23,	%f17
	lduh	[%l7 + 0x10],	%i7
	movl	%xcc,	%g5,	%i2
	bge,a	loop_764
	xnorcc	%l4,	%l6,	%l3
	sethi	0x1FD9,	%i1
	edge16	%i3,	%l5,	%i5
loop_764:
	alignaddr	%o0,	%g2,	%l2
	fors	%f4,	%f10,	%f0
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	bn,a,pt	%xcc,	loop_765
	sethi	0x1C47,	%g6
	xorcc	%g7,	%o2,	%g1
	fble	%fcc2,	loop_766
loop_765:
	fbl,a	%fcc0,	loop_767
	fbg,a	%fcc1,	loop_768
	srl	%o5,	0x1C,	%o6
loop_766:
	bcs,pt	%xcc,	loop_769
loop_767:
	mova	%xcc,	%o7,	%l1
loop_768:
	and	%i4,	%o1,	%o4
	fors	%f26,	%f0,	%f7
loop_769:
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
	fmovrsne	%i0,	%f17,	%f13
	andn	%o3,	0x0629,	%l0
	bcs,pt	%xcc,	loop_770
	brnz,a	%i6,	loop_771
	stb	%g3,	[%l7 + 0x21]
	srl	%g4,	%g5,	%i7
loop_770:
	fmuld8ulx16	%f15,	%f24,	%f30
loop_771:
	movvc	%icc,	%i2,	%l6
	lduw	[%l7 + 0x74],	%l3
	fbue	%fcc3,	loop_772
	edge16l	%i1,	%i3,	%l4
	edge16	%i5,	%o0,	%l5
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
loop_772:
	smul	%l2,	0x1BF3,	%g2
	fpmerge	%f31,	%f2,	%f6
	stx	%g7,	[%l7 + 0x78]
	fpmerge	%f24,	%f0,	%f12
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	addcc	%o2,	%g1,	%g6
	brgz,a	%o5,	loop_773
	movneg	%icc,	%o7,	%l1
	udivx	%o6,	0x145F,	%o1
	array32	%i4,	%i0,	%o4
loop_773:
	bpos,a,pt	%xcc,	loop_774
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
	fmovsvs	%icc,	%f2,	%f22
	umul	%l0,	%i6,	%g3
loop_774:
	nop
	set	0x40, %i3
	nop	 ! 	stda	%f0,	[%l7 + %i3] 0x0c ASI use changed by convert2hboot
	movg	%icc,	%g4,	%g5
	sdivcc	%o3,	0x1A4D,	%i7
	edge32	%l6,	%l3,	%i1
	ldsw	[%l7 + 0x24],	%i2
	subc	%i3,	0x13F5,	%l4
	ldd	[%l7 + 0x50],	%i4
	nop 	! 	tsubcctv	%l5,	0x1132,	%l2 changed by convert2hboot
	fmovrdlez	%g2,	%f2,	%f0
	fmovdn	%xcc,	%f30,	%f5
	fbne	%fcc1,	loop_775
	edge8	%o0,	%o2,	%g7
	ldstub	[%l7 + 0x15],	%g1
	fmovdcc	%xcc,	%f17,	%f18
loop_775:
	movvs	%icc,	%g6,	%o5
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	sll	%o7,	0x08,	%l1
	or	%o6,	%i4,	%i0
	nop 	! 	tleu	%xcc,	0x6 changed by convert2hboot
	fpsub32	%f30,	%f12,	%f28
	fmovdg	%icc,	%f24,	%f27
	edge32l	%o1,	%l0,	%i6
	stx	%o4,	[%l7 + 0x20]
	nop 	! 	ta	%icc,	0x6 changed by convert2hboot
	fandnot2s	%f28,	%f15,	%f30
	fmovde	%icc,	%f19,	%f8
	xnorcc	%g3,	0x096B,	%g5
	add	%o3,	%i7,	%g4
	brlz	%l6,	loop_776
	sll	%i1,	%l3,	%i2
	srax	%i3,	%l4,	%i5
	smulcc	%l2,	0x161D,	%g2
loop_776:
	flush	%l7 + 0x5C
	movne	%xcc,	%l5,	%o0
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o2,	%g1,	%g6
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	udiv	%g7,	0x07AE,	%o7
	andn	%l1,	0x177C,	%o5
	nop 	! 	tcc	%icc,	0x1 changed by convert2hboot
	add	%i4,	%i0,	%o1
	sdivcc	%l0,	0x0FCC,	%i6
	wr	%g0,	0x11,	%asi
	fnot2s	%f17,	%f6
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	add	%l7,	0x24,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o4
	fpsub16	%f22,	%f26,	%f8
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	xor	%g3,	0x0D95,	%o3
	edge8l	%i7,	%l6,	%g4
	ldsb	[%l7 + 0x6D],	%l3
	udiv	%i1,	0x15CC,	%i3
	subcc	%i2,	%i5,	%l2
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l4,	0x0EB2,	%l5
	set	0x1D, %o6
	nop	 ! 	lduba	[%l7 + %o6] 0x04,	%o0 ASI use changed by convert2hboot
	movrgez	%g2,	%g1,	%o2
	nop 	! 	tg	%xcc,	0x3 changed by convert2hboot
	edge8l	%g7,	%o7,	%l1
	stb	%g6,	[%l7 + 0x21]
	edge8n	%o5,	%i4,	%i0
	brgz,a	%o1,	loop_777
	brlz	%i6,	loop_778
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	fpadd16	%f12,	%f14,	%f22
loop_777:
	ba,a	%xcc,	loop_779
loop_778:
	movcs	%icc,	%l0,	%o4
	movleu	%xcc,	%o6,	%g3
	and	%o3,	0x0983,	%g5
loop_779:
	fsrc2s	%f10,	%f7
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	fornot1	%f26,	%f0,	%f10
	edge32l	%i7,	%l6,	%l3
	movvc	%xcc,	%i1,	%i3
	fmul8ulx16	%f28,	%f6,	%f30
	addc	%g4,	0x060B,	%i5
	set	0x40, %i1
	nop	 ! 	stda	%l2,	[%l7 + %i1] 0x2a ASI use changed by convert2hboot
	membar	#Sync
	nop 	! 	sir	0x132E changed by convert2hboot
	subcc	%i2,	%l5,	%l4
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
	wr	%g0,	0x04,	%asi
	sra	%g2,	%g1,	%o2
	srax	%g7,	%o7,	%l1
	nop 	! 	tle	%xcc,	0x3 changed by convert2hboot
	movn	%icc,	%g6,	%o5
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	movleu	%xcc,	%i4,	%o1
	fnot1s	%f8,	%f18
	edge16ln	%i0,	%i6,	%o4
	bcc	%xcc,	loop_780
	movleu	%xcc,	%o6,	%g3
	fmovdl	%xcc,	%f18,	%f28
	umul	%o3,	0x1966,	%g5
loop_780:
	fexpand	%f14,	%f0
	mova	%icc,	%l0,	%l6
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	addccc	%i7,	0x0384,	%i1
	sdivx	%l3,	0x003C,	%i3
	bvc,a,pt	%xcc,	loop_781
	edge32ln	%i5,	%l2,	%g4
	nop 	! 	tn	%icc,	0x5 changed by convert2hboot
	bl,a,pn	%icc,	loop_782
loop_781:
	ldstub	[%l7 + 0x6C],	%i2
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
	fbne,a	%fcc0,	loop_783
loop_782:
	fmovdleu	%icc,	%f21,	%f18
	fmuld8sux16	%f5,	%f25,	%f10
	fandnot2	%f16,	%f16,	%f12
loop_783:
	addc	%l5,	%l4,	%g2
	xnor	%o0,	%o2,	%g1
	array32	%g7,	%o7,	%l1
	fbule	%fcc1,	loop_784
	bleu,pn	%icc,	loop_785
	fbo	%fcc3,	loop_786
	fbul,a	%fcc0,	loop_787
loop_784:
	swap	[%l7 + 0x44],	%g6
loop_785:
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
loop_786:
	movgu	%xcc,	%i4,	%o5
loop_787:
	ldsb	[%l7 + 0x78],	%i0
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	sllx	%i6,	%o1,	%o6
	nop 	! 	tvs	%xcc,	0x2 changed by convert2hboot
	movleu	%icc,	%g3,	%o4
	set	0x7D, %o0
	nop	 ! 	ldstuba	[%l7 + %o0] 0x11,	%g5 ASI use changed by convert2hboot
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x64] %asi,	%f0
	fbe	%fcc1,	loop_788
	subccc	%o3,	0x0195,	%l6
	bl,pn	%xcc,	loop_789
	addc	%i7,	0x1B41,	%l0
loop_788:
	fandnot2	%f8,	%f8,	%f4
	edge16ln	%l3,	%i3,	%i5
loop_789:
	and	%i1,	0x09C7,	%l2
	xnor	%g4,	0x0D52,	%l5
	movge	%icc,	%i2,	%g2
	fors	%f17,	%f10,	%f2
	fmovrslz	%o0,	%f18,	%f28
	fcmpne16	%f20,	%f24,	%l4
	movleu	%xcc,	%o2,	%g1
	orcc	%g7,	%l1,	%o7
	nop 	! 	tleu	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
	movvs	%icc,	%i4,	%o5
	bvc,a	%xcc,	loop_790
	brgz,a	%g6,	loop_791
	fones	%f21
	fbg,a	%fcc0,	loop_792
loop_790:
	movg	%xcc,	%i0,	%i6
loop_791:
	movgu	%icc,	%o1,	%o6
	fsrc2s	%f2,	%f26
loop_792:
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	alignaddr	%g3,	%o4,	%o3
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	array32	%l6,	%i7,	%l0
	udivcc	%g5,	0x1EBD,	%i3
	udivcc	%i5,	0x0A88,	%l3
	edge8	%l2,	%i1,	%l5
	fnot2	%f16,	%f2
	nop 	! 	taddcc	%g4,	0x102A,	%i2 changed by convert2hboot
	nop 	! 	taddcc	%o0,	%l4,	%g2 changed by convert2hboot
	bl,a,pn	%xcc,	loop_793
	sdivx	%o2,	0x1DFC,	%g1
	fble	%fcc1,	loop_794
	fcmped	%fcc1,	%f0,	%f22
loop_793:
	fmovdge	%xcc,	%f19,	%f26
	xnor	%g7,	0x1FA6,	%l1
loop_794:
	movl	%xcc,	%i4,	%o7
	fbul	%fcc1,	loop_795
	nop 	! 	tsubcctv	%g6,	0x085C,	%o5 changed by convert2hboot
	fmovrslz	%i6,	%f7,	%f18
	array8	%o1,	%o6,	%g3
loop_795:
	edge16n	%i0,	%o3,	%l6
	wr	%g0,	0x04,	%asi
	movne	%xcc,	%l0,	%o4
	set	0x20, %i6
	nop	 ! 	prefetcha	[%l7 + %i6] 0x04,	 0x0 ASI use changed by convert2hboot
	fpack16	%f8,	%f1
	fands	%f12,	%f7,	%f23
	brgz	%i5,	loop_796
	sdiv	%l3,	0x1A6A,	%i3
	ldsw	[%l7 + 0x64],	%l2
	fors	%f29,	%f26,	%f6
loop_796:
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	sth	%g4,	[%l7 + 0x34]
	be	%xcc,	loop_797
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	addc	%i1,	%i2,	%o0
	ldd	[%l7 + 0x18],	%g2
loop_797:
	umul	%l4,	%o2,	%g1
	fmovspos	%icc,	%f7,	%f14
	umul	%g7,	%l1,	%i4
	fbug	%fcc3,	loop_798
	andn	%g6,	0x0EC2,	%o7
	movvc	%xcc,	%o5,	%o1
	set	0x60, %l1
	sta	%f30,	[%l7 + %l1] 0x04
loop_798:
	subcc	%i6,	0x1772,	%o6
	ldx	[%l7 + 0x58],	%g3
	movcc	%xcc,	%o3,	%i0
	stw	%i7,	[%l7 + 0x1C]
	stw	%l0,	[%l7 + 0x50]
	wr	%g0,	0x11,	%asi
	fxnors	%f29,	%f5,	%f29
	orn	%l6,	%i5,	%l3
	sllx	%i3,	0x1D,	%l2
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
	fmovscc	%icc,	%f29,	%f26
	nop 	! 	taddcc	%l5,	0x12CC,	%g4 changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
	srlx	%i1,	%i2,	%g5
	edge8n	%g2,	%o0,	%o2
	edge16	%l4,	%g1,	%g7
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	movle	%icc,	%i4,	%l1
	sub	%o7,	%g6,	%o5
	movle	%icc,	%o1,	%i6
	movleu	%xcc,	%o6,	%o3
	movrlez	%g3,	0x004,	%i0
	fmovda	%icc,	%f2,	%f5
	mova	%icc,	%l0,	%i7
	andcc	%l6,	0x12E2,	%o4
	movrgez	%l3,	%i3,	%l2
	movl	%xcc,	%l5,	%g4
	wr	%g0,	0x0c,	%asi
	set	0x40, %o3
	nop	 ! 	ldda	[%l7 + %o3] 0x11,	%f16 ASI use changed by convert2hboot
	fnot2s	%f31,	%f24
	fmovrdgz	%i2,	%f2,	%f0
	nop 	! 	tne	%icc,	0x5 changed by convert2hboot
	ldx	[%l7 + 0x08],	%i5
	andncc	%g5,	%o0,	%g2
	edge32ln	%l4,	%o2,	%g7
	movcc	%xcc,	%g1,	%l1
	edge8	%i4,	%g6,	%o5
	srlx	%o7,	0x05,	%o1
	fbug	%fcc2,	loop_799
	smulcc	%i6,	%o3,	%o6
	bl	%xcc,	loop_800
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
loop_799:
	bneg,a,pt	%xcc,	loop_801
	fexpand	%f15,	%f6
loop_800:
	addc	%g3,	%i0,	%l0
	movcs	%icc,	%i7,	%o4
loop_801:
	ldstub	[%l7 + 0x37],	%l3
	movneg	%icc,	%l6,	%l2
	fbe,a	%fcc2,	loop_802
	fpadd16	%f28,	%f10,	%f14
	wr	%g0,	0x80,	%asi
loop_802:
	edge32	%i3,	%i1,	%i2
	edge8n	%g4,	%g5,	%i5
	nop 	! 	tg	%xcc,	0x0 changed by convert2hboot
	edge8	%g2,	%l4,	%o0
	movvs	%icc,	%o2,	%g1
	set	0x4C, %o5
	nop	 ! 	stba	%l1,	[%l7 + %o5] 0xe3 ASI use changed by convert2hboot
	membar	#Sync
	orcc	%g7,	%i4,	%g6
	fmovdgu	%xcc,	%f2,	%f18
	fcmpeq16	%f30,	%f6,	%o5
	nop 	! 	taddcc	%o7,	%i6,	%o3 changed by convert2hboot
	set	0x2C, %l5
	nop	 ! 	lduwa	[%l7 + %l5] 0x81,	%o6 ASI use changed by convert2hboot
	fpack32	%f30,	%f20,	%f14
	fbul	%fcc3,	loop_803
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	and	%g3,	0x0AAD,	%o1
	fmovspos	%xcc,	%f2,	%f9
loop_803:
	swap	[%l7 + 0x60],	%i0
	nop 	! 	tsubcctv	%i7,	%o4,	%l3 changed by convert2hboot
	lduh	[%l7 + 0x78],	%l0
	mulscc	%l2,	%l5,	%l6
	prefetch	[%l7 + 0x58],	 0x1
	bcs,a,pt	%icc,	loop_804
	movrlz	%i1,	0x2A8,	%i2
	sethi	0x0B05,	%i3
	bcc	loop_805
loop_804:
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
	movn	%xcc,	%g4,	%g5
	wr	%g0,	0x04,	%asi
loop_805:
	movleu	%icc,	%l4,	%o0
	edge8	%o2,	%g1,	%i5
	fblg,a	%fcc3,	loop_806
	bleu	%xcc,	loop_807
	umul	%g7,	%i4,	%g6
	sllx	%l1,	%o7,	%o5
loop_806:
	fmovsneg	%xcc,	%f24,	%f21
loop_807:
	edge16ln	%i6,	%o6,	%o3
	fmovrdlz	%g3,	%f12,	%f30
	fmovrsgez	%i0,	%f19,	%f6
	udivcc	%o1,	0x1F56,	%o4
	set	0x40, %i5
	nop	 ! 	stda	%f16,	[%l7 + %i5] 0x18 ASI use changed by convert2hboot
	edge8l	%l3,	%i7,	%l0
	fpack32	%f28,	%f12,	%f18
	bshuffle	%f18,	%f12,	%f20
	set	0x5C, %g3
	nop	 ! 	lduha	[%l7 + %g3] 0x81,	%l5 ASI use changed by convert2hboot
	fbn	%fcc2,	loop_808
	movvs	%icc,	%l6,	%i1
	fbug	%fcc2,	loop_809
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
loop_808:
	fpadd32s	%f17,	%f16,	%f18
	fzero	%f6
loop_809:
	fnegs	%f27,	%f3
	movrgez	%i2,	0x37F,	%l2
	fmovsne	%icc,	%f22,	%f5
	nop 	! 	tsubcctv	%g4,	0x10DF,	%g5 changed by convert2hboot
	orcc	%g2,	0x11DD,	%l4
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
	set	0x08, %o7
	nop	 ! 	prefetcha	[%l7 + %o7] 0x11,	 0x0 ASI use changed by convert2hboot
	fmovdcs	%icc,	%f29,	%f9
	fornot1	%f6,	%f8,	%f24
	addccc	%i3,	%o2,	%g1
	movcs	%xcc,	%i5,	%g7
	fmovdvs	%xcc,	%f3,	%f9
	edge16n	%i4,	%l1,	%g6
	nop
	setx	loop_810,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fbe,a	%fcc3,	loop_811
	nop
	setx	loop_812,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fones	%f3
loop_810:
	fone	%f30
loop_811:
	bvc,a	%xcc,	loop_813
loop_812:
	srlx	%o7,	%o5,	%i6
	be,a	loop_814
	fand	%f20,	%f26,	%f10
loop_813:
	movrlz	%o6,	0x1B5,	%o3
	bvs	%icc,	loop_815
loop_814:
	orn	%g3,	%o1,	%o4
	udivx	%l3,	0x0354,	%i0
	movle	%xcc,	%i7,	%l0
loop_815:
	and	%l5,	%l6,	%i2
	wr	%g0,	0x81,	%asi
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	umul	%g4,	%l2,	%g5
	fpadd16	%f0,	%f20,	%f28
	xnorcc	%l4,	%o0,	%g2
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	swap	[%l7 + 0x14],	%o2
	fzeros	%f20
	fbo	%fcc1,	loop_816
	smul	%i3,	%g1,	%g7
	andn	%i5,	0x0004,	%l1
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
loop_816:
	std	%g6,	[%l7 + 0x58]
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
	or	%i4,	%o7,	%i6
	movcs	%icc,	%o5,	%o6
	edge8	%g3,	%o3,	%o1
	fmovsl	%icc,	%f11,	%f24
	sdivx	%o4,	0x1DF6,	%l3
	smul	%i0,	%l0,	%l5
	array32	%i7,	%i2,	%l6
	ldub	[%l7 + 0x61],	%i1
	edge8n	%g4,	%g5,	%l2
	nop
	setx	loop_817,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	tcc	%icc,	0x1 changed by convert2hboot
	fmovdle	%icc,	%f13,	%f3
	movpos	%icc,	%o0,	%l4
loop_817:
	orcc	%o2,	0x0281,	%g2
	fmovsneg	%icc,	%f20,	%f16
	stb	%i3,	[%l7 + 0x4E]
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	fcmple16	%f4,	%f22,	%g7
	movneg	%xcc,	%i5,	%l1
	fpadd32s	%f28,	%f26,	%f20
	brgez,a	%g6,	loop_818
	fcmpgt16	%f28,	%f26,	%g1
	sllx	%i4,	0x0B,	%i6
	bcc,a	loop_819
loop_818:
	sra	%o7,	%o5,	%g3
	std	%o6,	[%l7 + 0x20]
	fmovrdne	%o1,	%f14,	%f20
loop_819:
	bne,pt	%xcc,	loop_820
	ldd	[%l7 + 0x68],	%o4
	bcs	loop_821
	sub	%l3,	%i0,	%o3
loop_820:
	smul	%l5,	%l0,	%i7
	umulcc	%i2,	%l6,	%g4
loop_821:
	movrgz	%i1,	%l2,	%o0
	bn	loop_822
	movvs	%xcc,	%l4,	%g5
	bcs,a,pt	%xcc,	loop_823
	brlz,a	%o2,	loop_824
loop_822:
	mulscc	%g2,	%g7,	%i3
	sdivx	%i5,	0x16E0,	%g6
loop_823:
	ldstub	[%l7 + 0x33],	%g1
loop_824:
	fands	%f1,	%f16,	%f27
	edge32ln	%l1,	%i6,	%o7
	udiv	%i4,	0x1308,	%g3
	orn	%o5,	0x0A0E,	%o6
	or	%o1,	0x01D6,	%l3
	std	%i0,	[%l7 + 0x28]
	sll	%o3,	%o4,	%l5
	andn	%l0,	%i7,	%l6
	prefetch	[%l7 + 0x2C],	 0x1
	array32	%i2,	%g4,	%i1
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	set	0x3C, %o2
	nop	 ! 	ldswa	[%l7 + %o2] 0x81,	%l2 ASI use changed by convert2hboot
	fmovdcc	%xcc,	%f20,	%f31
	fmovdgu	%icc,	%f2,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o0,	%l4,	%g5
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
	fpack32	%f0,	%f26,	%f6
	udiv	%o2,	0x1129,	%g2
	subcc	%i3,	%g7,	%g6
	movge	%icc,	%i5,	%l1
	mova	%icc,	%i6,	%o7
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	move	%icc,	%g1,	%i4
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	fcmped	%fcc3,	%f30,	%f4
	edge16l	%g3,	%o5,	%o6
	fornot2	%f24,	%f12,	%f6
	brgez	%l3,	loop_825
	nop 	! 	tl	%icc,	0x6 changed by convert2hboot
	nop 	! 	sir	0x02DE changed by convert2hboot
	fblg	%fcc1,	loop_826
loop_825:
	smulcc	%o1,	0x0283,	%i0
	fbul,a	%fcc1,	loop_827
	edge16l	%o3,	%l5,	%l0
loop_826:
	fmovrde	%i7,	%f26,	%f30
	sth	%l6,	[%l7 + 0x44]
loop_827:
	edge32ln	%i2,	%g4,	%o4
	edge16l	%l2,	%o0,	%i1
	udivx	%l4,	0x14EA,	%o2
	popc	0x09BC,	%g2
	add	%l7,	0x74,	%l6
	wr	%g0,	0x19,	%asi
	movge	%xcc,	%g6,	%i5
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	sdivx	%i3,	0x10E7,	%i6
	lduh	[%l7 + 0x16],	%l1
	nop 	! 	te	%xcc,	0x4 changed by convert2hboot
	movre	%o7,	0x071,	%i4
	xnor	%g3,	%g1,	%o6
	ldd	[%l7 + 0x58],	%l2
	wr	%g0,	0x80,	%asi
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	fmovsg	%icc,	%f23,	%f7
	bcc,pn	%xcc,	loop_828
	edge16ln	%i0,	%o3,	%o5
	movgu	%xcc,	%l0,	%l5
	movcc	%xcc,	%i7,	%i2
loop_828:
	fmovsle	%icc,	%f9,	%f23
	sdivcc	%l6,	0x0766,	%o4
	orncc	%g4,	%l2,	%i1
	nop 	! 	tleu	%icc,	0x3 changed by convert2hboot
	movcc	%icc,	%l4,	%o0
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
	fmovda	%icc,	%f29,	%f11
	edge16l	%o2,	%g5,	%g7
	bg,a,pn	%icc,	loop_829
	nop
	setx	loop_830,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fnot2s	%f14,	%f23
	sdiv	%g6,	0x08FD,	%g2
loop_829:
	nop 	! 	tl	%icc,	0x5 changed by convert2hboot
loop_830:
	movrlz	%i3,	%i6,	%l1
	set	0x29, %g7
	nop	 ! 	ldstuba	[%l7 + %g7] 0x04,	%o7 ASI use changed by convert2hboot
	fmovse	%xcc,	%f20,	%f13
	nop 	! 	tcs	%xcc,	0x3 changed by convert2hboot
	ldd	[%l7 + 0x30],	%i4
	movrne	%g3,	0x354,	%i5
	srl	%g1,	%l3,	%o1
	ble,a	%xcc,	loop_831
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	fmovrsne	%o6,	%f29,	%f7
	nop 	! 	tsubcctv	%o3,	0x1B54,	%o5 changed by convert2hboot
loop_831:
	fmovsn	%icc,	%f7,	%f0
	sll	%i0,	0x09,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f15,	%f12
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	movne	%xcc,	%i7,	%l5
	st	%f26,	[%l7 + 0x74]
	move	%icc,	%l6,	%i2
	fands	%f30,	%f9,	%f5
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	fmovscc	%xcc,	%f5,	%f15
	set	0x44, %g6
	nop	 ! 	stwa	%o4,	[%l7 + %g6] 0x2b ASI use changed by convert2hboot
	membar	#Sync
	wr	%g0,	0x80,	%asi
	mova	%xcc,	%i1,	%g4
	fbuge,a	%fcc0,	loop_832
	fnot1	%f2,	%f10
	nop
	set	0x38, %g5
	std	%l4,	[%l7 + %g5]
	bcs	%icc,	loop_833
loop_832:
	popc	0x0292,	%o0
	nop 	! 	ta	%xcc,	0x5 changed by convert2hboot
	nop 	! 	tsubcc	%o2,	0x1BCC,	%g5 changed by convert2hboot
loop_833:
	movpos	%xcc,	%g6,	%g2
	sllx	%g7,	0x00,	%i6
	bpos,a	%icc,	loop_834
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
	fmovdgu	%icc,	%f21,	%f17
	ldx	[%l7 + 0x58],	%l1
loop_834:
	bl,a	loop_835
	brlz	%o7,	loop_836
	movvc	%xcc,	%i4,	%i3
	srax	%g3,	0x00,	%i5
loop_835:
	movcs	%icc,	%g1,	%l3
loop_836:
	and	%o1,	0x00C3,	%o6
	nop 	! 	tpos	%xcc,	0x4 changed by convert2hboot
	brz,a	%o5,	loop_837
	srax	%i0,	%o3,	%l0
	fbu,a	%fcc3,	loop_838
	fmovscc	%icc,	%f22,	%f25
loop_837:
	udivcc	%i7,	0x042B,	%l5
	fblg	%fcc0,	loop_839
loop_838:
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	fcmple16	%f4,	%f6,	%l6
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
loop_839:
	orncc	%o4,	%i2,	%l2
	set	0x70, %o4
	nop	 ! 	stda	%i0,	[%l7 + %o4] 0xe2 ASI use changed by convert2hboot
	membar	#Sync
	stx	%l4,	[%l7 + 0x38]
	array8	%g4,	%o2,	%g5
	nop 	! 	tsubcc	%g6,	0x068C,	%o0 changed by convert2hboot
	prefetch	[%l7 + 0x44],	 0x3
	nop 	! 	tpos	%icc,	0x6 changed by convert2hboot
	fmuld8sux16	%f12,	%f22,	%f0
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	srlx	%g2,	%i6,	%l1
	nop 	! 	te	%icc,	0x3 changed by convert2hboot
	array32	%g7,	%i4,	%i3
	movle	%xcc,	%g3,	%i5
	popc	0x197E,	%g1
	mulx	%l3,	0x0C51,	%o7
	fbul,a	%fcc1,	loop_840
	array8	%o1,	%o5,	%i0
	fbn,a	%fcc3,	loop_841
	fble,a	%fcc1,	loop_842
loop_840:
	edge16l	%o6,	%l0,	%i7
	edge32l	%l5,	%l6,	%o3
loop_841:
	movge	%icc,	%o4,	%i2
loop_842:
	bneg,pn	%icc,	loop_843
	bcc	loop_844
	andn	%i1,	0x0D68,	%l4
	fmul8x16au	%f7,	%f30,	%f10
loop_843:
	subcc	%g4,	%l2,	%o2
loop_844:
	subc	%g6,	0x0147,	%g5
	movre	%o0,	0x2BC,	%g2
	fbl	%fcc3,	loop_845
	fandnot2s	%f6,	%f12,	%f25
	edge32l	%i6,	%l1,	%i4
	xnor	%g7,	0x082A,	%g3
loop_845:
	sll	%i5,	0x14,	%g1
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	set	0x50, %o1
	nop	 ! 	stwa	%l3,	[%l7 + %o1] 0x19 ASI use changed by convert2hboot
	xorcc	%o7,	0x1B08,	%i3
	fmovrdgz	%o5,	%f4,	%f28
	subc	%i0,	%o1,	%o6
	fpsub16	%f28,	%f14,	%f30
	set	0x70, %g1
	nop	 ! 	ldswa	[%l7 + %g1] 0x88,	%i7 ASI use changed by convert2hboot
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	udiv	%l0,	0x1A89,	%l6
	fpack16	%f8,	%f9
	fmovrslez	%o3,	%f27,	%f3
	srax	%l5,	%i2,	%i1
	fmovdgu	%icc,	%f19,	%f15
	edge32	%o4,	%g4,	%l2
	edge32ln	%o2,	%l4,	%g5
	stw	%o0,	[%l7 + 0x3C]
	wr	%g0,	0xf0,	%asi
	membar	#Sync
	and	%g6,	0x0666,	%i6
	movrgez	%l1,	0x18E,	%g2
	movrgez	%i4,	%g3,	%g7
	nop 	! 	tsubcc	%g1,	0x00C2,	%i5 changed by convert2hboot
	edge8ln	%o7,	%l3,	%i3
	movcc	%xcc,	%o5,	%o1
	edge32l	%o6,	%i7,	%i0
	brz,a	%l6,	loop_846
	sdiv	%o3,	0x0059,	%l0
	ldub	[%l7 + 0x2E],	%l5
	or	%i1,	%i2,	%g4
loop_846:
	lduw	[%l7 + 0x0C],	%l2
	fmovdg	%xcc,	%f25,	%f9
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	move	%xcc,	%o2,	%o4
	fnands	%f11,	%f5,	%f31
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	brlz	%g5,	loop_847
	mova	%icc,	%l4,	%g6
	nop 	! 	tsubcctv	%o0,	%l1,	%g2 changed by convert2hboot
	wr	%g0,	0x19,	%asi
loop_847:
	sethi	0x0967,	%i4
	fmovdg	%xcc,	%f10,	%f23
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	move	%icc,	%i6,	%g7
	fmovs	%f26,	%f21
	ldstub	[%l7 + 0x16],	%g3
	edge16n	%g1,	%i5,	%o7
	smulcc	%l3,	0x1F6E,	%i3
	fbne	%fcc1,	loop_848
	srlx	%o1,	0x1B,	%o6
	st	%f18,	[%l7 + 0x78]
	wr	%g0,	0x80,	%asi
loop_848:
	fble,a	%fcc0,	loop_849
	mulscc	%i0,	%l6,	%o5
	stx	%l0,	[%l7 + 0x60]
	fpackfix	%f16,	%f25
loop_849:
	fpack16	%f20,	%f0
	fblg,a	%fcc1,	loop_850
	smul	%o3,	0x0D9D,	%l5
	std	%i0,	[%l7 + 0x50]
	mulx	%i2,	0x08B5,	%l2
loop_850:
	fmovsa	%xcc,	%f27,	%f8
	nop
	setx loop_851, %l0, %l1
	jmpl %l1, %o2
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
	andncc	%g4,	%o4,	%l4
	sethi	0x11F1,	%g5
loop_851:
	add	%g6,	%l1,	%g2
	array8	%i4,	%i6,	%o0
	wr	%g0,	0x80,	%asi
	sta	%f10,	[%l7 + 0x14] %asi
	edge16	%g7,	%g3,	%g1
	edge8l	%i5,	%o7,	%l3
	fmovdleu	%xcc,	%f4,	%f24
	orn	%o1,	%i3,	%i7
	fmovsa	%icc,	%f8,	%f8
	wr	%g0,	0x11,	%asi
	fbne	%fcc3,	loop_852
	sub	%l6,	0x1D15,	%i0
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
	edge16l	%o5,	%o3,	%l5
loop_852:
	movre	%i1,	%l0,	%i2
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	sllx	%l2,	0x1D,	%g4
	set	0x7A, %l3
	nop	 ! 	ldstuba	[%l7 + %l3] 0x0c,	%o2 ASI use changed by convert2hboot
	movcs	%icc,	%l4,	%o4
	addc	%g6,	0x0EC1,	%l1
	umulcc	%g5,	%g2,	%i6
	fpsub32	%f30,	%f20,	%f26
	nop 	! 	tpos	%icc,	0x4 changed by convert2hboot
	fbge,a	%fcc2,	loop_853
	nop 	! 	taddcctv	%i4,	%g7,	%g3 changed by convert2hboot
	xor	%g1,	0x14B9,	%i5
	movn	%icc,	%o7,	%l3
loop_853:
	andn	%o0,	0x035A,	%i3
	fbul,a	%fcc2,	loop_854
	mulx	%o1,	%i7,	%l6
	fones	%f28
	fornot2s	%f18,	%f26,	%f11
loop_854:
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
	fmovsne	%icc,	%f18,	%f14
	edge32	%o6,	%o5,	%o3
	array16	%l5,	%i0,	%i1
	brgez	%l0,	loop_855
	fpadd16	%f16,	%f4,	%f14
	sdivcc	%l2,	0x0084,	%i2
	ldstub	[%l7 + 0x21],	%g4
loop_855:
	orcc	%l4,	%o4,	%o2
	movn	%icc,	%g6,	%l1
	ldx	[%l7 + 0x68],	%g5
	wr	%g0,	0x16,	%asi
	membar	#Sync
	fnands	%f21,	%f9,	%f21
	brlez,a	%g2,	loop_856
	fbue,a	%fcc0,	loop_857
	fbule,a	%fcc2,	loop_858
	sllx	%i6,	0x16,	%i4
loop_856:
	nop
	wr	%g0,	0xeb,	%asi
	membar	#Sync
loop_857:
	fmovdpos	%icc,	%f22,	%f19
loop_858:
	brgez,a	%g1,	loop_859
	call	loop_860
	sdivcc	%i5,	0x0431,	%o7
	xnor	%l3,	0x01E1,	%g7
loop_859:
	fcmpes	%fcc2,	%f2,	%f23
loop_860:
	edge32l	%o0,	%o1,	%i7
	fone	%f12
	bvc,a,pn	%icc,	loop_861
	srlx	%i3,	0x12,	%l6
	set	0x13, %i0
	nop	 ! 	ldsba	[%l7 + %i0] 0x14,	%o5 ASI use changed by convert2hboot
loop_861:
	sll	%o6,	0x0E,	%l5
	brgez,a	%o3,	loop_862
	membar	0x5A
	sllx	%i1,	%l0,	%i0
	fpsub16s	%f4,	%f29,	%f29
loop_862:
	fandnot2	%f26,	%f16,	%f10
	fmovsa	%xcc,	%f27,	%f6
	mulscc	%i2,	0x1C1E,	%g4
	be	%icc,	loop_863
	movleu	%icc,	%l2,	%l4
	nop 	! 	taddcc	%o4,	0x08E7,	%g6 changed by convert2hboot
	edge32n	%l1,	%o2,	%g2
loop_863:
	fpack16	%f20,	%f1
	ble,a	loop_864
	addccc	%g5,	%i4,	%i6
	movl	%icc,	%g1,	%g3
	subccc	%o7,	%l3,	%g7
loop_864:
	movrgz	%i5,	%o1,	%i7
	movre	%i3,	0x0B6,	%l6
	bg,a	loop_865
	edge16l	%o5,	%o0,	%l5
	edge32ln	%o3,	%o6,	%i1
	movge	%xcc,	%l0,	%i0
loop_865:
	ble	%xcc,	loop_866
	nop 	! 	tsubcc	%i2,	0x009D,	%l2 changed by convert2hboot
	be,a	loop_867
	move	%xcc,	%g4,	%o4
loop_866:
	nop 	! 	tg	%xcc,	0x4 changed by convert2hboot
	nop
	setx loop_868, %l0, %l1
	jmpl %l1, %l4
loop_867:
	nop 	! 	sir	0x1E3F changed by convert2hboot
	xor	%g6,	0x1BC3,	%l1
	fmuld8ulx16	%f5,	%f24,	%f22
loop_868:
	movrlez	%o2,	0x20B,	%g2
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	set	0x51, %l2
	nop	 ! 	stba	%i4,	[%l7 + %l2] 0x18 ASI use changed by convert2hboot
	brlez,a	%g5,	loop_869
	fmovrdgz	%i6,	%f28,	%f28
	andcc	%g1,	0x0F2D,	%g3
	fpadd32	%f26,	%f24,	%f30
loop_869:
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	fbuge	%fcc1,	loop_870
	fcmple16	%f8,	%f28,	%l3
	call	loop_871
	sra	%o7,	0x0D,	%g7
loop_870:
	movl	%xcc,	%i5,	%i7
	addcc	%o1,	0x1836,	%l6
loop_871:
	array8	%o5,	%o0,	%l5
	fcmpes	%fcc1,	%f17,	%f22
	andn	%i3,	0x0A84,	%o6
	nop 	! 	sir	0x0768 changed by convert2hboot
	srl	%o3,	0x1D,	%l0
	fmovsl	%xcc,	%f9,	%f28
	movgu	%xcc,	%i0,	%i1
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	set	0x3E, %l0
	nop	 ! 	ldsha	[%l7 + %l0] 0x19,	%l2 ASI use changed by convert2hboot
	andn	%i2,	0x107D,	%o4
	addc	%l4,	0x1943,	%g4
	movrgz	%l1,	0x254,	%o2
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	edge32	%g2,	%i4,	%g6
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	movleu	%icc,	%g5,	%g1
	fmovspos	%icc,	%f25,	%f13
	alignaddr	%g3,	%l3,	%o7
	fblg,a	%fcc0,	loop_872
	movrlz	%i6,	0x000,	%g7
	wr	%g0,	0x80,	%asi
loop_872:
	bge,pn	%icc,	loop_873
	edge32ln	%o1,	%i5,	%o5
	fcmple32	%f10,	%f18,	%l6
	xnor	%o0,	%i3,	%l5
loop_873:
	fandnot1	%f16,	%f10,	%f24
	fmovdvc	%icc,	%f5,	%f31
	ldd	[%l7 + 0x78],	%o2
	wr	%g0,	0x18,	%asi
	nop
	setx loop_874, %l0, %l1
	jmpl %l1, %i0
	movle	%icc,	%i1,	%l2
	fmul8x16	%f16,	%f6,	%f16
	lduw	[%l7 + 0x78],	%o6
loop_874:
	orcc	%i2,	0x1F22,	%o4
	fandnot1s	%f30,	%f8,	%f15
	wr	%g0,	0x27,	%asi
	membar	#Sync
	fba,a	%fcc3,	loop_875
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	fcmps	%fcc3,	%f26,	%f16
	fsrc1	%f4,	%f16
loop_875:
	movcs	%xcc,	%g4,	%o2
	fornot1s	%f9,	%f2,	%f14
	sdiv	%l1,	0x0367,	%i4
	nop
	setx loop_876, %l0, %l1
	jmpl %l1, %g2
	andn	%g5,	0x066D,	%g1
	mulx	%g6,	0x10A6,	%l3
	array8	%g3,	%o7,	%g7
loop_876:
	movcc	%icc,	%i7,	%i6
	fbuge	%fcc2,	loop_877
	sub	%o1,	0x144A,	%o5
	movre	%i5,	%l6,	%i3
	fpack16	%f4,	%f2
loop_877:
	fmovdle	%xcc,	%f8,	%f31
	brlz	%o0,	loop_878
	sdiv	%l5,	0x00CE,	%o3
	alignaddrl	%i0,	%i1,	%l0
	edge32l	%l2,	%o6,	%i2
loop_878:
	orn	%o4,	%l4,	%g4
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	fone	%f8
	xnorcc	%l1,	0x1416,	%o2
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	or	%g2,	0x1629,	%i4
	fandnot2s	%f30,	%f5,	%f4
	nop
	setx loop_879, %l0, %l1
	jmpl %l1, %g5
	move	%icc,	%g1,	%g6
	movl	%icc,	%l3,	%o7
	nop 	! 	taddcc	%g7,	0x0F45,	%i7 changed by convert2hboot
loop_879:
	bvc,pt	%icc,	loop_880
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	movrlz	%g3,	0x097,	%i6
	movvs	%icc,	%o5,	%o1
loop_880:
	subc	%l6,	%i5,	%o0
	fbe,a	%fcc0,	loop_881
	brlez	%l5,	loop_882
	fcmpeq32	%f10,	%f18,	%i3
	nop 	! 	taddcc	%o3,	%i1,	%i0 changed by convert2hboot
loop_881:
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
loop_882:
	fmuld8sux16	%f28,	%f17,	%f28
	fmovrde	%l2,	%f26,	%f4
	umul	%o6,	0x10CC,	%l0
	edge8l	%i2,	%l4,	%g4
	edge32ln	%l1,	%o2,	%o4
	bg	%icc,	loop_883
	nop 	! 	taddcctv	%g2,	0x16BB,	%g5 changed by convert2hboot
	sdivx	%i4,	0x0296,	%g1
	sethi	0x1293,	%l3
loop_883:
	fmovdpos	%xcc,	%f5,	%f13
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
	fmovrdgz	%g6,	%f10,	%f26
	srax	%o7,	%i7,	%g3
	udivcc	%i6,	0x159C,	%o5
	orcc	%o1,	0x1518,	%l6
	brgz	%i5,	loop_884
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
	edge16ln	%o0,	%l5,	%i3
	bge,a,pt	%xcc,	loop_885
loop_884:
	edge8ln	%o3,	%i1,	%g7
	srax	%i0,	%l2,	%l0
	movcs	%xcc,	%o6,	%l4
loop_885:
	fnot1s	%f1,	%f12
	sra	%g4,	%l1,	%o2
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	nop 	! 	tsubcc	%o4,	%i2,	%g2 changed by convert2hboot
	xnor	%g5,	%g1,	%l3
	orncc	%g6,	%o7,	%i7
	movre	%g3,	0x093,	%i4
	movpos	%xcc,	%i6,	%o5
	xnorcc	%l6,	%i5,	%o1
	movcs	%icc,	%o0,	%i3
	fmovdvc	%icc,	%f9,	%f19
	movrne	%o3,	0x1A7,	%l5
	sth	%i1,	[%l7 + 0x7E]
	std	%f4,	[%l7 + 0x78]
	fpsub32s	%f19,	%f22,	%f22
	fpadd32s	%f22,	%f14,	%f26
	xnorcc	%g7,	%l2,	%i0
	movg	%xcc,	%l0,	%o6
	brlez,a	%g4,	loop_886
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
	sth	%l1,	[%l7 + 0x74]
	srax	%o2,	0x0C,	%l4
loop_886:
	membar	0x75
	and	%o4,	%g2,	%i2
	bn,pt	%xcc,	loop_887
	nop
	set	0x08, %g2
	stx	%g5,	[%l7 + %g2]
	fornot2	%f30,	%f14,	%f28
	mova	%xcc,	%g1,	%l3
loop_887:
	edge16	%o7,	%i7,	%g3
	brlez	%i4,	loop_888
	sll	%g6,	%i6,	%l6
	movcs	%icc,	%o5,	%o1
	fmovrdgz	%o0,	%f30,	%f10
loop_888:
	udivx	%i3,	0x0D53,	%i5
	fcmple16	%f14,	%f12,	%o3
	udivx	%i1,	0x1D8B,	%g7
	andn	%l5,	0x1DA9,	%i0
	move	%icc,	%l2,	%l0
	movg	%xcc,	%o6,	%l1
	bg,a,pt	%icc,	loop_889
	orncc	%o2,	%l4,	%g4
	fxnor	%f26,	%f26,	%f22
	sll	%g2,	0x16,	%o4
loop_889:
	fnot2	%f24,	%f14
	subccc	%g5,	%i2,	%l3
	array32	%o7,	%i7,	%g1
	udiv	%g3,	0x073C,	%g6
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	nop	 ! 	casa	[%l6] 0x89,	%i6,	%i4 ASI use changed by convert2hboot
	fmovrsgez	%l6,	%f9,	%f5
	fmovsle	%icc,	%f8,	%f24
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
	fpsub16	%f22,	%f20,	%f8
	fandnot2	%f18,	%f8,	%f28
	fmovsg	%xcc,	%f23,	%f20
	mova	%icc,	%o1,	%o5
	membar	0x1A
	bpos	%xcc,	loop_890
	srlx	%o0,	0x14,	%i3
	fandnot1s	%f26,	%f5,	%f6
	movn	%xcc,	%o3,	%i1
loop_890:
	fmovscs	%xcc,	%f0,	%f2
	ldub	[%l7 + 0x18],	%i5
	movcs	%icc,	%l5,	%i0
	fmovdneg	%icc,	%f11,	%f25
	set	0x7C, %l6
	lda	[%l7 + %l6] 0x15,	%f2
	set	0x6C, %l4
	nop	 ! 	stwa	%g7,	[%l7 + %l4] 0x2b ASI use changed by convert2hboot
	membar	#Sync
	fbe,a	%fcc2,	loop_891
	bl,a	loop_892
	array8	%l0,	%o6,	%l1
	andn	%l2,	0x16CD,	%o2
loop_891:
	fba	%fcc3,	loop_893
loop_892:
	andcc	%g4,	%g2,	%o4
	movrgez	%l4,	0x397,	%i2
	sdiv	%l3,	0x0A50,	%g5
loop_893:
	sethi	0x1517,	%i7
	sra	%o7,	%g3,	%g6
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x48] %asi,	%f15
	edge32	%g1,	%i6,	%i4
	edge16ln	%l6,	%o1,	%o5
	ble	loop_894
	fbne,a	%fcc0,	loop_895
	movrlz	%o0,	0x2DB,	%i3
	xor	%i1,	%i5,	%l5
loop_894:
	movvs	%icc,	%o3,	%g7
loop_895:
	udivcc	%l0,	0x0DDD,	%i0
	nop 	! 	tsubcctv	%l1,	%l2,	%o2 changed by convert2hboot
	fmul8ulx16	%f28,	%f24,	%f0
	mova	%icc,	%g4,	%g2
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
	fpsub16s	%f6,	%f21,	%f6
	sethi	0x17E9,	%o4
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	bn,a	loop_896
	fpsub32	%f30,	%f16,	%f16
	udivcc	%o6,	0x1686,	%i2
	ldsb	[%l7 + 0x66],	%l3
loop_896:
	movcs	%icc,	%l4,	%g5
	edge8ln	%o7,	%i7,	%g6
	nop 	! 	tpos	%icc,	0x0 changed by convert2hboot
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	sth	%g3,	[%l7 + 0x6A]
	wr	%g0,	0xe2,	%asi
	membar	#Sync
	array16	%g1,	%i4,	%l6
	fpadd32	%f20,	%f28,	%f4
	array8	%o5,	%o1,	%i3
	edge8l	%o0,	%i5,	%l5
	edge8	%o3,	%i1,	%g7
	be,a	%icc,	loop_897
	nop 	! 	tg	%xcc,	0x2 changed by convert2hboot
	fblg	%fcc3,	loop_898
	nop 	! 	tpos	%icc,	0x0 changed by convert2hboot
loop_897:
	fmul8x16	%f30,	%f6,	%f12
	xnorcc	%l0,	%l1,	%i0
loop_898:
	fmovdne	%xcc,	%f13,	%f5
	movge	%icc,	%l2,	%g4
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	udiv	%o2,	0x18DF,	%g2
	or	%o4,	0x1786,	%i2
	fbug	%fcc0,	loop_899
	movrgez	%o6,	0x156,	%l3
	mulx	%l4,	%o7,	%g5
	smulcc	%i7,	0x1C27,	%g6
loop_899:
	fmul8x16al	%f12,	%f2,	%f16
	fnegs	%f25,	%f19
	fbg,a	%fcc0,	loop_900
	fmul8ulx16	%f0,	%f28,	%f18
	edge16n	%i6,	%g1,	%g3
	movn	%xcc,	%i4,	%l6
loop_900:
	membar	0x58
	xorcc	%o5,	%o1,	%i3
	fmovrdlz	%o0,	%f2,	%f14
	nop
	set	0x1F, %g4
	ldub	[%l7 + %g4],	%i5
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	edge16n	%o3,	%l5,	%g7
	fmovdn	%xcc,	%f22,	%f28
	set	0x46, %i4
	nop	 ! 	stha	%i1,	[%l7 + %i4] 0x80 ASI use changed by convert2hboot
	fbn	%fcc1,	loop_901
	sethi	0x1F48,	%l0
	movpos	%icc,	%i0,	%l1
	movrlez	%l2,	0x2D6,	%g4
loop_901:
	add	%g2,	0x0A43,	%o2
	st	%f25,	[%l7 + 0x6C]
	orncc	%i2,	%o4,	%o6
	fmovsvs	%xcc,	%f12,	%f3
	movleu	%xcc,	%l4,	%o7
	fone	%f12
	nop
	set	0x11, %i7
	stb	%l3,	[%l7 + %i7]
	addccc	%g5,	%i7,	%g6
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	set	0x54, %i3
	sta	%f31,	[%l7 + %i3] 0x10
	edge16l	%g1,	%i6,	%i4
	fmuld8ulx16	%f8,	%f20,	%f24
	bcc,a	loop_902
	bcs	%icc,	loop_903
	be,pt	%xcc,	loop_904
	fmovdcs	%icc,	%f28,	%f21
loop_902:
	andcc	%l6,	0x1321,	%g3
loop_903:
	fbl,a	%fcc0,	loop_905
loop_904:
	mova	%icc,	%o1,	%o5
	movrne	%o0,	%i5,	%i3
	nop 	! 	tsubcc	%o3,	%g7,	%l5 changed by convert2hboot
loop_905:
	nop
	setx loop_906, %l0, %l1
	jmpl %l1, %l0
	nop 	! 	taddcctv	%i0,	%l1,	%i1 changed by convert2hboot
	orncc	%g4,	0x0379,	%g2
	sethi	0x120C,	%o2
loop_906:
	sdiv	%l2,	0x044E,	%o4
	edge8	%i2,	%l4,	%o6
	fmovrsgz	%o7,	%f27,	%f13
	add	%g5,	0x0431,	%i7
	call	loop_907
	sub	%l3,	0x0190,	%g1
	sdiv	%i6,	0x1E51,	%i4
	bcc,a,pn	%icc,	loop_908
loop_907:
	edge16	%g6,	%l6,	%g3
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	movne	%icc,	%o1,	%o5
loop_908:
	umul	%i5,	%i3,	%o0
	set	0x40, %o6
	nop	 ! 	stda	%f0,	[%l7 + %o6] 0x89 ASI use changed by convert2hboot
	wr	%g0,	0x89,	%asi
	edge16l	%l5,	%l0,	%o3
	fcmple16	%f30,	%f2,	%l1
	edge8l	%i0,	%i1,	%g4
	fexpand	%f2,	%f18
	ldx	[%l7 + 0x38],	%g2
	flush	%l7 + 0x48
	nop 	! 	tgu	%icc,	0x1 changed by convert2hboot
	flush	%l7 + 0x74
	popc	%l2,	%o4
	prefetch	[%l7 + 0x6C],	 0x0
	fnors	%f20,	%f0,	%f5
	edge8	%o2,	%l4,	%o6
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
	sra	%i2,	%g5,	%i7
	wr	%g0,	0x11,	%asi
	bneg,a,pt	%icc,	loop_909
	subc	%l3,	0x11CF,	%g1
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	ldx	[%l7 + 0x70],	%o7
loop_909:
	fmovsle	%icc,	%f14,	%f26
	fmovdvs	%xcc,	%f5,	%f28
	movrne	%i4,	%g6,	%i6
	edge16	%g3,	%l6,	%o1
	move	%xcc,	%o5,	%i5
	stb	%i3,	[%l7 + 0x60]
	ldd	[%l7 + 0x60],	%g6
	wr	%g0,	0x17,	%asi
	membar	#Sync
	fornot2s	%f1,	%f13,	%f10
	fpadd16s	%f17,	%f22,	%f29
	andncc	%o0,	%l0,	%l5
	nop 	! 	sir	0x014C changed by convert2hboot
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	add	%o3,	%i0,	%i1
	orcc	%l1,	0x1ADB,	%g4
	ld	[%l7 + 0x58],	%f5
	edge16ln	%g2,	%l2,	%o4
	set	0x7C, %i1
	lda	[%l7 + %i1] 0x14,	%f9
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	array8	%o2,	%l4,	%o6
	udiv	%g5,	0x1A1A,	%i2
	sllx	%l3,	%g1,	%o7
	fxnor	%f30,	%f20,	%f6
	fmovrslez	%i7,	%f8,	%f6
	sdiv	%g6,	0x16C4,	%i4
	fmovse	%icc,	%f20,	%f21
	orn	%i6,	%l6,	%o1
	movge	%icc,	%o5,	%g3
	nop 	! 	tle	%xcc,	0x3 changed by convert2hboot
	movle	%icc,	%i3,	%i5
	xnorcc	%g7,	0x13C0,	%o0
	fmovdg	%xcc,	%f9,	%f5
	edge8n	%l0,	%l5,	%o3
	fcmpgt32	%f10,	%f10,	%i0
	ldsb	[%l7 + 0x50],	%i1
	fpadd16s	%f4,	%f2,	%f0
	fabss	%f17,	%f26
	edge32l	%l1,	%g4,	%l2
	ldub	[%l7 + 0x5F],	%g2
	bneg,pt	%icc,	loop_910
	array16	%o4,	%o2,	%l4
	edge16ln	%g5,	%o6,	%l3
	faligndata	%f24,	%f0,	%f24
loop_910:
	fnands	%f19,	%f15,	%f2
	popc	0x0003,	%i2
	movvs	%icc,	%g1,	%o7
	bcc,a	%icc,	loop_911
	umulcc	%g6,	0x106A,	%i4
	call	loop_912
	andn	%i7,	0x0897,	%i6
loop_911:
	popc	%o1,	%o5
	mulscc	%l6,	0x12D6,	%i3
loop_912:
	alignaddr	%i5,	%g7,	%g3
	fbge,a	%fcc0,	loop_913
	addc	%o0,	0x0C14,	%l5
	wr	%g0,	0x11,	%asi
loop_913:
	nop
	wr	%g0,	0x2a,	%asi
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	membar	#Sync
	or	%i0,	0x00F4,	%l1
	xnor	%i1,	%l2,	%g4
	srlx	%o4,	0x19,	%o2
	fmuld8sux16	%f31,	%f7,	%f18
	edge8ln	%l4,	%g5,	%o6
	fandnot2	%f12,	%f20,	%f2
	edge16l	%g2,	%i2,	%g1
	wr	%g0,	0x18,	%asi
	sdiv	%g6,	0x1A12,	%i4
	fmovdge	%icc,	%f28,	%f3
	sllx	%l3,	%i7,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i6,	%o5,	%i3
	andncc	%i5,	%l6,	%g7
	addccc	%g3,	%o0,	%o3
	smulcc	%l0,	%i0,	%l1
	fble,a	%fcc3,	loop_914
	sethi	0x13E6,	%l5
	fmovsa	%icc,	%f10,	%f12
	movg	%xcc,	%i1,	%g4
loop_914:
	edge8	%o4,	%o2,	%l2
	xorcc	%g5,	0x018B,	%l4
	mulscc	%o6,	%i2,	%g1
	fcmpgt32	%f0,	%f0,	%g2
	mulx	%o7,	0x023B,	%g6
	fnot2s	%f3,	%f0
	orncc	%l3,	%i7,	%i4
	edge32ln	%o1,	%i6,	%o5
	alignaddrl	%i5,	%i3,	%g7
	fmovdneg	%xcc,	%f5,	%f2
	umulcc	%l6,	0x0F98,	%o0
	fcmps	%fcc1,	%f9,	%f11
	edge8ln	%o3,	%g3,	%l0
	movneg	%xcc,	%i0,	%l1
	stb	%l5,	[%l7 + 0x1B]
	set	0x4C, %i2
	nop	 ! 	ldsha	[%l7 + %i2] 0x80,	%g4 ASI use changed by convert2hboot
	set	0x1C, %o0
	nop	 ! 	ldsba	[%l7 + %o0] 0x19,	%o4 ASI use changed by convert2hboot
	orn	%i1,	0x1681,	%l2
	movcc	%icc,	%o2,	%g5
	nop 	! 	tsubcctv	%o6,	%i2,	%l4 changed by convert2hboot
	smulcc	%g1,	%g2,	%o7
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	movcs	%xcc,	%g6,	%i7
	movrgez	%i4,	0x2FA,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,a	loop_915
	fsrc2	%f24,	%f14
	brlz	%l3,	loop_916
	movrlz	%o5,	%i5,	%i6
loop_915:
	andn	%i3,	%l6,	%o0
	ldx	[%l7 + 0x60],	%o3
loop_916:
	edge32n	%g7,	%g3,	%i0
	smul	%l0,	%l1,	%l5
	nop 	! 	sir	0x182A changed by convert2hboot
	fmovrsgz	%g4,	%f29,	%f12
	brgz	%o4,	loop_917
	std	%f16,	[%l7 + 0x30]
	fabsd	%f20,	%f10
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
loop_917:
	fmovdn	%icc,	%f30,	%f11
	sdivx	%i1,	0x08E9,	%o2
	array8	%l2,	%g5,	%o6
	ld	[%l7 + 0x48],	%f6
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	nop 	! 	sir	0x10F8 changed by convert2hboot
	orcc	%l4,	0x1362,	%i2
	fmovs	%f29,	%f1
	nop 	! 	taddcc	%g2,	%o7,	%g6 changed by convert2hboot
	fcmpes	%fcc3,	%f0,	%f3
	sth	%i7,	[%l7 + 0x24]
	fmovsne	%xcc,	%f21,	%f12
	fmovdvs	%icc,	%f12,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g1,	%i4,	%o1
	fbn,a	%fcc2,	loop_918
	movrne	%o5,	%i5,	%i6
	nop
	setx	loop_919,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	subcc	%i3,	%l3,	%o0
loop_918:
	ldsh	[%l7 + 0x76],	%l6
	subcc	%g7,	0x1AC1,	%o3
loop_919:
	movcs	%xcc,	%g3,	%l0
	bcs	loop_920
	movrlez	%i0,	0x3E3,	%l5
	fcmpeq16	%f20,	%f6,	%l1
	set	0x40, %i6
	nop	 ! 	stda	%f16,	[%l7 + %i6] 0x11 ASI use changed by convert2hboot
loop_920:
	smulcc	%g4,	0x155D,	%i1
	fors	%f23,	%f25,	%f11
	fbg	%fcc1,	loop_921
	andn	%o4,	0x03C6,	%l2
	srlx	%g5,	0x0C,	%o2
	bleu	loop_922
loop_921:
	ldstub	[%l7 + 0x26],	%l4
	sdiv	%o6,	0x15EA,	%g2
	bvs,pn	%xcc,	loop_923
loop_922:
	xor	%i2,	%g6,	%o7
	subc	%g1,	0x1247,	%i4
	subccc	%i7,	%o1,	%i5
loop_923:
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	movrlz	%i6,	%o5,	%i3
	edge8ln	%l3,	%o0,	%l6
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	fmul8ulx16	%f28,	%f6,	%f20
	sth	%o3,	[%l7 + 0x1E]
	edge8	%g7,	%g3,	%i0
	fabss	%f11,	%f24
	fmovdpos	%icc,	%f19,	%f3
	subc	%l0,	%l5,	%l1
	set	0x5C, %o3
	nop	 ! 	stwa	%g4,	[%l7 + %o3] 0x19 ASI use changed by convert2hboot
	orcc	%o4,	%i1,	%l2
	fpsub16	%f0,	%f10,	%f20
	nop
	setx loop_924, %l0, %l1
	jmpl %l1, %o2
	srax	%l4,	%g5,	%g2
	fand	%f2,	%f8,	%f22
	fbule,a	%fcc0,	loop_925
loop_924:
	fmovsneg	%icc,	%f19,	%f6
	swap	[%l7 + 0x6C],	%o6
	bpos,a	%icc,	loop_926
loop_925:
	smulcc	%g6,	0x15E7,	%i2
	lduw	[%l7 + 0x54],	%o7
	fbu	%fcc1,	loop_927
loop_926:
	sdivcc	%i4,	0x1AA9,	%i7
	andncc	%g1,	%o1,	%i5
	edge16n	%o5,	%i3,	%i6
loop_927:
	sdiv	%l3,	0x1340,	%l6
	fcmpeq32	%f16,	%f6,	%o0
	fands	%f17,	%f6,	%f5
	bcc,a,pn	%xcc,	loop_928
	udiv	%o3,	0x02DF,	%g3
	edge8n	%i0,	%g7,	%l0
	nop 	! 	te	%icc,	0x0 changed by convert2hboot
loop_928:
	nop
	set	0x0C, %o5
	nop	 ! 	stha	%l5,	[%l7 + %o5] 0x19 ASI use changed by convert2hboot
	move	%icc,	%g4,	%l1
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	ble,a	loop_929
	bcc,a	loop_930
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
	fmovsne	%xcc,	%f14,	%f19
loop_929:
	movvc	%xcc,	%i1,	%o4
loop_930:
	fzero	%f4
	fpackfix	%f8,	%f14
	and	%o2,	0x09D7,	%l2
	wr	%g0,	0x2b,	%asi
	membar	#Sync
	bn,a,pt	%icc,	loop_931
	fbul	%fcc2,	loop_932
	edge8n	%g5,	%g2,	%g6
	fmovrsgez	%i2,	%f17,	%f9
loop_931:
	orncc	%o6,	0x1072,	%o7
loop_932:
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	fxors	%f3,	%f17,	%f18
	movrgz	%i7,	0x2F2,	%i4
	st	%f3,	[%l7 + 0x44]
	movrlz	%o1,	0x21D,	%g1
	nop 	! 	taddcctv	%i5,	0x1764,	%o5 changed by convert2hboot
	subcc	%i6,	%l3,	%l6
	movcs	%icc,	%o0,	%i3
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	movle	%xcc,	%o3,	%i0
	mulx	%g7,	%l0,	%g3
	set	0x1C, %l1
	nop	 ! 	swapa	[%l7 + %l1] 0x10,	%g4 ASI use changed by convert2hboot
	edge32l	%l5,	%l1,	%o4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	nop	 ! 	casxa	[%l6] 0x88,	%i1,	%o2 ASI use changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	array8	%l4,	%g5,	%l2
	fmovsge	%xcc,	%f7,	%f26
	bpos,a,pt	%xcc,	loop_933
	movcc	%icc,	%g2,	%g6
	mulx	%o6,	%o7,	%i7
	lduw	[%l7 + 0x6C],	%i4
loop_933:
	alignaddrl	%o1,	%g1,	%i2
	andcc	%i5,	0x1BC9,	%o5
	fmovsleu	%icc,	%f17,	%f25
	fba	%fcc3,	loop_934
	fnot1	%f10,	%f16
	bl,a	loop_935
	subcc	%l3,	0x0781,	%l6
loop_934:
	fcmple32	%f30,	%f26,	%o0
	fxnors	%f31,	%f24,	%f14
loop_935:
	xnorcc	%i6,	0x054D,	%i3
	fmovs	%f0,	%f9
	movrlez	%o3,	0x2B1,	%g7
	andcc	%i0,	0x0148,	%l0
	subc	%g3,	0x04CE,	%l5
	ldsb	[%l7 + 0x4B],	%g4
	edge32l	%o4,	%l1,	%i1
	brlz,a	%l4,	loop_936
	edge8l	%g5,	%l2,	%o2
	fbge,a	%fcc0,	loop_937
	edge16ln	%g6,	%g2,	%o6
loop_936:
	nop
	set	0x60, %i5
	nop	 ! 	ldda	[%l7 + %i5] 0x11,	%o6 ASI use changed by convert2hboot
loop_937:
	fmovrsne	%i4,	%f21,	%f29
	subccc	%i7,	%o1,	%i2
	orcc	%i5,	%g1,	%l3
	move	%xcc,	%o5,	%l6
	fnegd	%f28,	%f20
	fbug	%fcc0,	loop_938
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	wr	%g0,	0x27,	%asi
	membar	#Sync
loop_938:
	popc	0x0901,	%i6
	ld	[%l7 + 0x48],	%f0
	fbul,a	%fcc1,	loop_939
	fzeros	%f18
	movcc	%icc,	%o3,	%i3
	fcmps	%fcc0,	%f4,	%f20
loop_939:
	edge32l	%i0,	%g7,	%l0
	addcc	%l5,	0x0DA4,	%g4
	fbug,a	%fcc2,	loop_940
	fmovrde	%g3,	%f28,	%f26
	ldx	[%l7 + 0x28],	%l1
	udiv	%o4,	0x0231,	%l4
loop_940:
	fmovrslez	%g5,	%f18,	%f21
	wr	%g0,	0x88,	%asi
	bcc,pt	%xcc,	loop_941
	fblg	%fcc0,	loop_942
	ld	[%l7 + 0x34],	%f19
	movrlz	%l2,	0x040,	%g6
loop_941:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_942:
	fbue	%fcc3,	loop_943
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	fxors	%f15,	%f20,	%f9
	fmovsle	%icc,	%f15,	%f14
loop_943:
	fmovdvs	%icc,	%f18,	%f12
	fmul8sux16	%f30,	%f28,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%o2,	%o6
	array32	%o7,	%g2,	%i7
	edge32l	%o1,	%i4,	%i5
	fmovsl	%xcc,	%f2,	%f3
	movne	%icc,	%i2,	%l3
	ldsb	[%l7 + 0x79],	%g1
	smulcc	%l6,	%o0,	%i6
	movvc	%xcc,	%o3,	%i3
	fmovsne	%xcc,	%f24,	%f20
	fpsub16s	%f1,	%f27,	%f6
	fnegs	%f1,	%f1
	or	%o5,	%i0,	%l0
	fnand	%f14,	%f26,	%f14
	set	0x74, %g3
	nop	 ! 	lduwa	[%l7 + %g3] 0x19,	%l5 ASI use changed by convert2hboot
	bn,a	loop_944
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
	movge	%xcc,	%g4,	%g3
	nop 	! 	sir	0x0362 changed by convert2hboot
loop_944:
	fmovdvs	%xcc,	%f22,	%f23
	array32	%l1,	%o4,	%g7
	addcc	%g5,	%l4,	%i1
	movvs	%xcc,	%l2,	%o2
	fornot2s	%f29,	%f27,	%f20
	nop 	! 	tsubcctv	%o6,	%o7,	%g6 changed by convert2hboot
	fpadd16	%f22,	%f6,	%f20
	bcs	loop_945
	array32	%i7,	%o1,	%g2
	fcmple16	%f20,	%f26,	%i4
	mulscc	%i5,	0x17F8,	%l3
loop_945:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x0c,	%asi
	nop	 ! 	casxa	[%l6] 0x0c,	%i2,	%l6 ASI use changed by convert2hboot
	sdiv	%o0,	0x0463,	%g1
	edge8n	%i6,	%i3,	%o5
	xnor	%i0,	0x19A4,	%l0
	nop 	! 	tsubcctv	%o3,	0x17B5,	%l5 changed by convert2hboot
	fmovrdlez	%g3,	%f4,	%f6
	fbn	%fcc3,	loop_946
	movle	%icc,	%g4,	%o4
	orncc	%g7,	%l1,	%g5
	umul	%i1,	0x196A,	%l2
loop_946:
	nop
	wr	%g0,	0x80,	%asi
	fmovdcc	%xcc,	%f6,	%f16
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	set	0x60, %l5
	nop	 ! 	ldda	[%l7 + %l5] 0x2a,	%o6 ASI use changed by convert2hboot
	subccc	%o7,	%g6,	%l4
	fabsd	%f10,	%f26
	udivcc	%o1,	0x1A7B,	%g2
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	edge8n	%i7,	%i5,	%l3
	subccc	%i4,	0x1FE7,	%l6
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
	bpos,pt	%icc,	loop_947
	edge16ln	%o0,	%g1,	%i2
	fpackfix	%f14,	%f23
	orn	%i6,	0x1D8F,	%o5
loop_947:
	fcmpeq32	%f14,	%f2,	%i0
	sdivx	%i3,	0x05BF,	%o3
	movge	%xcc,	%l0,	%l5
	mova	%icc,	%g3,	%o4
	fbg,a	%fcc3,	loop_948
	std	%f12,	[%l7 + 0x10]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g7,	0x1D6A,	%g4
loop_948:
	brgez	%l1,	loop_949
	fmovsg	%icc,	%f18,	%f26
	faligndata	%f22,	%f14,	%f14
	mulx	%g5,	0x11EE,	%l2
loop_949:
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	lduw	[%l7 + 0x28],	%o2
	fbg	%fcc3,	loop_950
	fbe	%fcc0,	loop_951
	nop 	! 	tn	%xcc,	0x7 changed by convert2hboot
	and	%o6,	0x0A81,	%o7
loop_950:
	array32	%i1,	%g6,	%l4
loop_951:
	fpadd16	%f26,	%f18,	%f0
	sllx	%o1,	0x00,	%g2
	sll	%i7,	%i5,	%i4
	movg	%xcc,	%l6,	%o0
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
	fmovse	%xcc,	%f19,	%f22
	array32	%l3,	%g1,	%i2
	popc	%i6,	%i0
	movneg	%xcc,	%i3,	%o3
	fmovrdgez	%o5,	%f16,	%f24
	alignaddr	%l5,	%g3,	%o4
	movrgez	%l0,	0x2F6,	%g4
	movrne	%l1,	0x2CB,	%g5
	orncc	%g7,	%l2,	%o6
	nop 	! 	taddcc	%o2,	0x0EE4,	%i1 changed by convert2hboot
	sll	%g6,	%o7,	%o1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	nop	 ! 	casa	[%l6] 0x81,	%g2,	%i7 ASI use changed by convert2hboot
	fmovsvs	%xcc,	%f14,	%f16
	fcmpeq16	%f12,	%f28,	%i5
	ldsb	[%l7 + 0x6A],	%i4
	fmovdn	%xcc,	%f8,	%f6
	nop 	! 	tcs	%xcc,	0x5 changed by convert2hboot
	fxor	%f30,	%f4,	%f0
	udivcc	%l4,	0x11F7,	%l6
	fnand	%f4,	%f26,	%f22
	alignaddrl	%o0,	%l3,	%i2
	fmovsne	%icc,	%f5,	%f9
	bn,a	%icc,	loop_952
	movl	%xcc,	%g1,	%i6
	membar	0x7C
	fcmple32	%f0,	%f4,	%i0
loop_952:
	array8	%o3,	%o5,	%i3
	andcc	%l5,	0x00BA,	%o4
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	edge8ln	%g3,	%g4,	%l1
	prefetch	[%l7 + 0x54],	 0x3
	wr	%g0,	0x10,	%asi
	fornot1s	%f19,	%f23,	%f22
	fmovrdgz	%l0,	%f6,	%f2
	ble,a,pn	%xcc,	loop_953
	nop 	! 	tvs	%xcc,	0x6 changed by convert2hboot
	srax	%g7,	%o6,	%o2
	bl	loop_954
loop_953:
	mulx	%i1,	%g6,	%l2
	set	0x24, %o7
	nop	 ! 	stwa	%o1,	[%l7 + %o7] 0x2f ASI use changed by convert2hboot
	membar	#Sync
loop_954:
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	fmovsvs	%xcc,	%f17,	%f6
	movrlz	%g2,	%o7,	%i5
	udivx	%i7,	0x020A,	%l4
	mulx	%i4,	0x18A6,	%l6
	bshuffle	%f2,	%f8,	%f26
	sll	%o0,	0x01,	%l3
	sra	%i2,	%g1,	%i0
	movleu	%icc,	%i6,	%o3
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	subc	%i3,	0x04AE,	%o5
	fcmpgt32	%f28,	%f22,	%l5
	alignaddr	%o4,	%g3,	%l1
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
	ldsh	[%l7 + 0x2A],	%g4
	movgu	%icc,	%g5,	%g7
	fbug,a	%fcc2,	loop_955
	addc	%o6,	0x1AAA,	%l0
	orn	%o2,	0x1292,	%i1
	fexpand	%f11,	%f6
loop_955:
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	movrne	%l2,	%g6,	%g2
	sth	%o1,	[%l7 + 0x1C]
	edge8ln	%o7,	%i7,	%l4
	fand	%f28,	%f4,	%f12
	bneg,pn	%icc,	loop_956
	movvc	%icc,	%i5,	%l6
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	movne	%xcc,	%i4,	%o0
loop_956:
	nop 	! 	tl	%icc,	0x1 changed by convert2hboot
	set	0x18, %g7
	nop	 ! 	stwa	%i2,	[%l7 + %g7] 0x15 ASI use changed by convert2hboot
	wr	%g0,	0x19,	%asi
	movl	%xcc,	%l3,	%i6
	array16	%o3,	%i3,	%o5
	nop
	set	0x7C, %g6
	ldsh	[%l7 + %g6],	%i0
	bgu,pt	%icc,	loop_957
	xnor	%o4,	0x0259,	%g3
	set	0x08, %o2
	nop	 ! 	stxa	%l1,	[%l7 + %o2] 0x88 ASI use changed by convert2hboot
loop_957:
	sdivx	%l5,	0x16F8,	%g5
	fmovsvc	%icc,	%f1,	%f28
	nop 	! 	taddcc	%g7,	0x01E7,	%o6 changed by convert2hboot
	srl	%l0,	%o2,	%i1
	sra	%g4,	%g6,	%l2
	edge16	%g2,	%o7,	%i7
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
	fmovdg	%xcc,	%f7,	%f7
	movge	%xcc,	%l4,	%o1
	edge8n	%l6,	%i4,	%i5
	fmul8x16al	%f13,	%f0,	%f22
	movre	%i2,	%o0,	%g1
	wr	%g0,	0x18,	%asi
	brlez,a	%o3,	loop_958
	movgu	%xcc,	%i3,	%o5
	movgu	%xcc,	%i0,	%o4
	add	%l7,	0x24,	%l6
	wr	%g0,	0x0c,	%asi
	nop	 ! 	casa	[%l6] 0x0c,	%i6,	%g3 ASI use changed by convert2hboot
loop_958:
	edge32l	%l1,	%l5,	%g5
	movrgz	%o6,	0x041,	%g7
	fmovrdlz	%l0,	%f30,	%f8
	bshuffle	%f0,	%f0,	%f10
	movn	%icc,	%o2,	%g4
	fcmpes	%fcc3,	%f0,	%f6
	sra	%i1,	%l2,	%g6
	membar	0x72
	fsrc1	%f0,	%f14
	umul	%o7,	0x19F8,	%g2
	fcmple16	%f28,	%f24,	%l4
	xorcc	%i7,	%o1,	%i4
	nop
	setx	loop_959,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	udiv	%l6,	0x0982,	%i5
	sra	%i2,	0x00,	%g1
	sub	%l3,	0x0F11,	%o0
loop_959:
	edge32ln	%i3,	%o5,	%o3
	fbe,a	%fcc3,	loop_960
	add	%i0,	%i6,	%o4
	fmovrdlz	%l1,	%f12,	%f8
	fbl	%fcc3,	loop_961
loop_960:
	movrgz	%g3,	%g5,	%l5
	edge8l	%o6,	%l0,	%g7
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
loop_961:
	stx	%g4,	[%l7 + 0x68]
	fmovdn	%icc,	%f20,	%f21
	fmovdleu	%xcc,	%f9,	%f21
	swap	[%l7 + 0x18],	%o2
	alignaddr	%l2,	%g6,	%o7
	fbuge,a	%fcc3,	loop_962
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	umul	%i1,	0x10E3,	%g2
	movre	%i7,	%o1,	%l4
loop_962:
	fbuge	%fcc0,	loop_963
	fmovsleu	%xcc,	%f31,	%f26
	edge32ln	%i4,	%i5,	%l6
	movrgz	%g1,	0x29B,	%i2
loop_963:
	edge8n	%l3,	%i3,	%o5
	subccc	%o0,	%i0,	%o3
	or	%o4,	%l1,	%g3
	fcmpes	%fcc2,	%f21,	%f19
	set	0x70, %g5
	nop	 ! 	stxa	%g5,	[%l7 + %g5] 0x15 ASI use changed by convert2hboot
	movrlz	%l5,	%o6,	%l0
	fbule,a	%fcc1,	loop_964
	fmovrde	%g7,	%f14,	%f16
	brgz	%i6,	loop_965
	popc	0x1F9D,	%o2
loop_964:
	movvc	%xcc,	%l2,	%g6
	orn	%g4,	0x0CCF,	%i1
loop_965:
	movrgz	%o7,	%i7,	%o1
	movrlez	%l4,	%g2,	%i4
	movrgz	%l6,	0x32E,	%i5
	movvs	%xcc,	%g1,	%i2
	set	0x3C, %o4
	nop	 ! 	lduha	[%l7 + %o4] 0x11,	%l3 ASI use changed by convert2hboot
	srl	%i3,	%o0,	%i0
	move	%xcc,	%o5,	%o4
	nop
	setx loop_966, %l0, %l1
	jmpl %l1, %l1
	edge8	%o3,	%g3,	%l5
	subcc	%g5,	%l0,	%g7
	stx	%o6,	[%l7 + 0x18]
loop_966:
	andn	%i6,	%o2,	%g6
	fmovsgu	%xcc,	%f16,	%f8
	edge16l	%l2,	%i1,	%g4
	bvs,a,pn	%icc,	loop_967
	edge8	%o7,	%o1,	%l4
	wr	%g0,	0x80,	%asi
loop_967:
	fmovrdgz	%i4,	%f14,	%f14
	fcmpd	%fcc3,	%f16,	%f10
	edge8n	%l6,	%i7,	%i5
	movrgez	%g1,	%i2,	%i3
	umulcc	%l3,	%i0,	%o0
	andncc	%o4,	%o5,	%l1
	andcc	%o3,	0x1843,	%l5
	nop
	setx	loop_968,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movl	%xcc,	%g5,	%g3
	bcc	%icc,	loop_969
	fcmps	%fcc3,	%f17,	%f22
loop_968:
	nop
	wr	%g0,	0x0c,	%asi
loop_969:
	lduh	[%l7 + 0x22],	%o6
	fsrc1	%f0,	%f28
	fnors	%f6,	%f26,	%f1
	mova	%xcc,	%g7,	%o2
	fsrc2	%f4,	%f10
	addc	%i6,	0x18A3,	%g6
	ldx	[%l7 + 0x08],	%i1
	movpos	%xcc,	%l2,	%g4
	fpack16	%f30,	%f16
	fmovsneg	%xcc,	%f7,	%f7
	siam	0x1
	ldsb	[%l7 + 0x3B],	%o7
	addccc	%l4,	0x10D4,	%o1
	sdiv	%i4,	0x0B4D,	%l6
	and	%g2,	0x18FB,	%i7
	fmul8x16	%f29,	%f20,	%f22
	subccc	%i5,	0x120E,	%i2
	udivx	%i3,	0x0A1A,	%g1
	brnz,a	%i0,	loop_970
	bl,a,pt	%icc,	loop_971
	fxors	%f27,	%f18,	%f25
	edge32n	%l3,	%o4,	%o0
loop_970:
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
loop_971:
	nop
	set	0x48, %g1
	nop	 ! 	prefetcha	[%l7 + %g1] 0x88,	 0x3 ASI use changed by convert2hboot
	xor	%o3,	%l1,	%g5
	sdiv	%g3,	0x0FF8,	%l0
	movcc	%xcc,	%o6,	%l5
	fxnor	%f22,	%f4,	%f30
	brgz,a	%o2,	loop_972
	edge16n	%g7,	%i6,	%g6
	bvc,a,pn	%xcc,	loop_973
	edge8	%l2,	%i1,	%o7
loop_972:
	bg,pt	%icc,	loop_974
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
loop_973:
	ba,pn	%icc,	loop_975
	fmovdcs	%icc,	%f27,	%f16
loop_974:
	bneg,a,pt	%icc,	loop_976
	edge32ln	%g4,	%l4,	%o1
loop_975:
	edge16	%l6,	%g2,	%i4
	smul	%i5,	0x02BF,	%i2
loop_976:
	array32	%i3,	%g1,	%i7
	fmovdg	%xcc,	%f23,	%f8
	fcmpd	%fcc0,	%f6,	%f16
	movrne	%l3,	0x015,	%o4
	brlez	%i0,	loop_977
	and	%o0,	0x03F0,	%o5
	srlx	%l1,	0x03,	%g5
	fornot2s	%f29,	%f27,	%f19
loop_977:
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	fmuld8sux16	%f18,	%f3,	%f8
	fornot2s	%f13,	%f28,	%f28
	bne,a	loop_978
	edge8ln	%o3,	%l0,	%o6
	brz,a	%l5,	loop_979
	srax	%g3,	%g7,	%o2
loop_978:
	fandnot2s	%f0,	%f12,	%f1
	sethi	0x09F2,	%i6
loop_979:
	movne	%xcc,	%l2,	%g6
	srlx	%i1,	%o7,	%l4
	be,a	%icc,	loop_980
	edge32	%o1,	%g4,	%g2
	and	%i4,	0x0863,	%l6
	fmovrdgez	%i2,	%f4,	%f22
loop_980:
	movrlez	%i5,	0x1A4,	%g1
	movrgz	%i3,	0x064,	%i7
	umulcc	%o4,	0x1DAD,	%l3
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	smul	%o0,	%o5,	%l1
	fbn	%fcc0,	loop_981
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	movge	%xcc,	%i0,	%g5
	nop 	! 	taddcc	%l0,	0x055C,	%o3 changed by convert2hboot
loop_981:
	brgez,a	%o6,	loop_982
	orcc	%l5,	0x0647,	%g3
	xnorcc	%o2,	%i6,	%l2
	smul	%g6,	%i1,	%g7
loop_982:
	bvs,a,pt	%icc,	loop_983
	add	%o7,	%o1,	%g4
	edge16l	%g2,	%i4,	%l4
	fmovsgu	%xcc,	%f4,	%f10
loop_983:
	fnegs	%f4,	%f0
	or	%i2,	%l6,	%g1
	orn	%i3,	0x0F6F,	%i5
	sub	%i7,	%o4,	%o0
	bshuffle	%f26,	%f30,	%f12
	edge16	%l3,	%l1,	%i0
	sethi	0x0B9D,	%o5
	xor	%g5,	0x0049,	%l0
	nop 	! 	tsubcc	%o6,	0x11D7,	%l5 changed by convert2hboot
	fmovrslz	%g3,	%f2,	%f14
	movrlez	%o2,	%i6,	%o3
	sub	%l2,	%g6,	%i1
	xor	%g7,	0x071F,	%o7
	movcs	%icc,	%o1,	%g2
	sdivcc	%g4,	0x1B50,	%i4
	fmovsle	%icc,	%f14,	%f3
	nop 	! 	tl	%icc,	0x4 changed by convert2hboot
	nop 	! 	tleu	%xcc,	0x5 changed by convert2hboot
	fmovrde	%l4,	%f14,	%f0
	movl	%xcc,	%l6,	%i2
	stw	%g1,	[%l7 + 0x34]
	alignaddr	%i3,	%i5,	%o4
	be	loop_984
	movl	%xcc,	%o0,	%i7
	fnand	%f16,	%f4,	%f22
	andcc	%l1,	%i0,	%l3
loop_984:
	alignaddr	%g5,	%l0,	%o6
	edge16l	%o5,	%l5,	%g3
	nop 	! 	taddcctv	%i6,	0x049D,	%o2 changed by convert2hboot
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
	fmovdgu	%xcc,	%f27,	%f21
	stb	%l2,	[%l7 + 0x15]
	sethi	0x1B38,	%o3
	edge16n	%i1,	%g7,	%o7
	smulcc	%o1,	%g6,	%g4
	array16	%i4,	%g2,	%l4
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
	subcc	%i2,	0x0341,	%g1
	fmuld8ulx16	%f29,	%f23,	%f10
	movle	%xcc,	%l6,	%i3
	bg	loop_985
	sll	%o4,	0x08,	%o0
	movcc	%xcc,	%i5,	%i7
	sub	%l1,	0x042A,	%l3
loop_985:
	movcc	%xcc,	%g5,	%l0
	set	0x30, %o1
	nop	 ! 	prefetcha	[%l7 + %o1] 0x11,	 0x2 ASI use changed by convert2hboot
	movrgz	%o5,	0x2A7,	%o6
	flush	%l7 + 0x20
	lduw	[%l7 + 0x3C],	%g3
	movneg	%xcc,	%i6,	%l5
	smul	%l2,	%o3,	%i1
	fmul8x16au	%f11,	%f15,	%f10
	prefetch	[%l7 + 0x10],	 0x3
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
	fblg	%fcc3,	loop_986
	edge16ln	%o2,	%o7,	%g7
	movrlez	%g6,	%g4,	%i4
	bcs,a,pt	%icc,	loop_987
loop_986:
	st	%f25,	[%l7 + 0x08]
	xorcc	%g2,	0x0AFA,	%l4
	umul	%o1,	0x0051,	%i2
loop_987:
	fcmped	%fcc0,	%f4,	%f4
	fmovsneg	%icc,	%f2,	%f27
	alignaddrl	%l6,	%i3,	%o4
	movcc	%xcc,	%g1,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x40
	pdist	%f0,	%f20,	%f20
	call	loop_988
	lduh	[%l7 + 0x44],	%o0
	edge16n	%l1,	%i7,	%l3
	sll	%g5,	0x03,	%i0
loop_988:
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	movvs	%xcc,	%o5,	%o6
	movleu	%xcc,	%g3,	%l0
	fnot1	%f28,	%f22
	nop 	! 	tsubcc	%l5,	0x0E62,	%i6 changed by convert2hboot
	smulcc	%o3,	0x1809,	%i1
	movrne	%l2,	0x049,	%o7
	fxnor	%f4,	%f16,	%f8
	movrlz	%o2,	0x370,	%g6
	nop
	set	0x48, %i0
	ldub	[%l7 + %i0],	%g4
	movrne	%g7,	%g2,	%i4
	prefetch	[%l7 + 0x28],	 0x2
	srax	%o1,	%l4,	%l6
	srl	%i2,	%o4,	%g1
	movleu	%icc,	%i5,	%i3
	fornot2	%f24,	%f18,	%f16
	fcmpes	%fcc3,	%f27,	%f28
	orncc	%l1,	%o0,	%i7
	edge16l	%l3,	%g5,	%i0
	fsrc1	%f28,	%f4
	addcc	%o6,	0x0354,	%g3
	udivx	%l0,	0x0A6A,	%o5
	fmovrdlez	%i6,	%f4,	%f26
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	fmul8x16	%f9,	%f24,	%f22
	orcc	%o3,	%i1,	%l2
	andcc	%l5,	%o2,	%o7
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
	ldd	[%l7 + 0x28],	%f28
	edge16	%g6,	%g4,	%g2
	fmovse	%icc,	%f4,	%f21
	movcs	%xcc,	%i4,	%g7
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
	subcc	%o1,	%l6,	%l4
	nop
	setx loop_989, %l0, %l1
	jmpl %l1, %o4
	fbue,a	%fcc2,	loop_990
	movgu	%xcc,	%g1,	%i2
	fmovdleu	%icc,	%f23,	%f1
loop_989:
	nop 	! 	taddcctv	%i5,	%l1,	%i3 changed by convert2hboot
loop_990:
	brlz	%o0,	loop_991
	movrlz	%i7,	%l3,	%i0
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
	sra	%g5,	0x0F,	%o6
loop_991:
	brlz,a	%g3,	loop_992
	flush	%l7 + 0x14
	edge32	%o5,	%l0,	%i6
	movre	%o3,	0x0FE,	%i1
loop_992:
	nop
	wr	%g0,	0x2f,	%asi
	membar	#Sync
	fpsub32s	%f17,	%f20,	%f26
	nop
	set	0x24, %l2
	prefetch	[%l7 + %l2],	 0x2
	xorcc	%o2,	0x1F50,	%o7
	edge16n	%l2,	%g4,	%g6
	ld	[%l7 + 0x64],	%f24
	nop 	! 	tneg	%icc,	0x7 changed by convert2hboot
	fbg,a	%fcc0,	loop_993
	brz,a	%i4,	loop_994
	edge16n	%g7,	%o1,	%g2
	movrgez	%l6,	0x085,	%l4
loop_993:
	subcc	%o4,	0x16B5,	%g1
loop_994:
	movvc	%icc,	%i2,	%l1
	andcc	%i5,	%i3,	%i7
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
	movgu	%icc,	%l3,	%o0
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	subcc	%i0,	0x036A,	%g5
	set	0x18, %l3
	nop	 ! 	ldswa	[%l7 + %l3] 0x0c,	%g3 ASI use changed by convert2hboot
	fblg,a	%fcc0,	loop_995
	fpadd16	%f4,	%f22,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o6,	%o5,	%i6
loop_995:
	fbo	%fcc0,	loop_996
	sub	%o3,	0x1930,	%i1
	call	loop_997
	sethi	0x13DD,	%l0
loop_996:
	ldsh	[%l7 + 0x38],	%l5
	fand	%f24,	%f4,	%f12
loop_997:
	fxnor	%f20,	%f22,	%f26
	fcmps	%fcc3,	%f20,	%f11
	st	%f22,	[%l7 + 0x58]
	fmovdcs	%xcc,	%f9,	%f24
	fnegs	%f4,	%f31
	nop
	set	0x30, %l0
	stx	%o2,	[%l7 + %l0]
	sdivcc	%o7,	0x196D,	%l2
	bl,a,pn	%xcc,	loop_998
	ba,a,pt	%icc,	loop_999
	flush	%l7 + 0x2C
	nop 	! 	sir	0x06ED changed by convert2hboot
loop_998:
	nop
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g4
loop_999:
	andn	%g7,	%o1,	%g6
	nop 	! 	taddcc	%g2,	%l4,	%o4 changed by convert2hboot
	xor	%g1,	0x0DA9,	%i2
	movneg	%xcc,	%l1,	%i5
	fmovrslz	%i3,	%f13,	%f29
	fand	%f8,	%f28,	%f20
	popc	%i7,	%l6
	nop 	! 	taddcc	%l3,	%i0,	%o0 changed by convert2hboot
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	fcmps	%fcc0,	%f31,	%f18
	nop
	setx loop_1000, %l0, %l1
	jmpl %l1, %g5
	sdivx	%o6,	0x1D0F,	%o5
	sra	%g3,	0x0A,	%o3
	udivcc	%i6,	0x0673,	%i1
loop_1000:
	fbl,a	%fcc3,	loop_1001
	sra	%l0,	0x10,	%l5
	wr	%g0,	0xe2,	%asi
	membar	#Sync
loop_1001:
	sdiv	%o2,	0x11EA,	%g4
	addcc	%l2,	%i4,	%o1
	nop
	set	0x28, %g2
	ldsw	[%l7 + %g2],	%g6
	ldstub	[%l7 + 0x52],	%g7
	fnand	%f24,	%f8,	%f12
	fmovsne	%xcc,	%f4,	%f24
	fexpand	%f20,	%f24
	edge8l	%l4,	%g2,	%g1
	edge32	%o4,	%l1,	%i2
	nop 	! 	sir	0x0697 changed by convert2hboot
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	fmovrsgz	%i5,	%f6,	%f31
	fsrc1	%f18,	%f24
	orcc	%i3,	0x02DB,	%i7
	andn	%l3,	0x041F,	%i0
	sdivcc	%o0,	0x0CC0,	%l6
	alignaddr	%o6,	%o5,	%g3
	fbul,a	%fcc3,	loop_1002
	movre	%o3,	0x1D5,	%g5
	set	0x6C, %l6
	nop	 ! 	ldstuba	[%l7 + %l6] 0x89,	%i1 ASI use changed by convert2hboot
loop_1002:
	fbuge,a	%fcc2,	loop_1003
	fbe	%fcc0,	loop_1004
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1003:
	movrgz	%i6,	%l0,	%l5
loop_1004:
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
	bge,pn	%xcc,	loop_1005
	andncc	%o2,	%o7,	%l2
	add	%i4,	%g4,	%g6
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
loop_1005:
	for	%f22,	%f8,	%f26
	andcc	%g7,	0x10A9,	%l4
	movpos	%icc,	%o1,	%g1
	andcc	%g2,	0x0C7D,	%l1
	edge32l	%i2,	%i5,	%i3
	umul	%o4,	%i7,	%i0
	edge8	%l3,	%o0,	%l6
	fpack16	%f2,	%f5
	fbu	%fcc3,	loop_1006
	movcc	%xcc,	%o6,	%o5
	bgu,a,pn	%icc,	loop_1007
	siam	0x4
loop_1006:
	bg,a	%icc,	loop_1008
	movcs	%xcc,	%g3,	%g5
loop_1007:
	fsrc2	%f6,	%f22
	sdiv	%o3,	0x1950,	%i1
loop_1008:
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	move	%icc,	%l0,	%l5
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
	edge8l	%i6,	%o7,	%o2
	fnot2	%f20,	%f4
	wr	%g0,	0x18,	%asi
	bge,a,pn	%xcc,	loop_1009
	sethi	0x0B36,	%l2
	bvc,a	loop_1010
	movrlz	%g6,	0x128,	%g7
loop_1009:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f16,	%f18
loop_1010:
	andncc	%l4,	%g4,	%g1
	add	%o1,	0x1448,	%g2
	edge8n	%l1,	%i2,	%i5
	movrlez	%o4,	%i7,	%i3
	addccc	%l3,	0x13C0,	%i0
	fnor	%f16,	%f24,	%f8
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	bvs,a,pt	%xcc,	loop_1011
	fxor	%f26,	%f24,	%f18
	edge32ln	%l6,	%o0,	%o6
	sub	%g3,	%o5,	%g5
loop_1011:
	fmovdne	%icc,	%f8,	%f18
	wr	%g0,	0x18,	%asi
	movrgz	%o3,	%l5,	%l0
	fcmpne16	%f16,	%f20,	%i6
	nop 	! 	tge	%icc,	0x4 changed by convert2hboot
	umul	%o2,	0x13BB,	%o7
	fbug,a	%fcc1,	loop_1012
	fbe,a	%fcc2,	loop_1013
	movle	%icc,	%l2,	%i4
	edge32n	%g6,	%g7,	%l4
loop_1012:
	array32	%g4,	%o1,	%g2
loop_1013:
	fnegs	%f21,	%f0
	set	0x00, %g4
	nop	 ! 	ldxa	[%g0 + %g4] 0x50,	%g1 ASI use changed by convert2hboot
	fornot1	%f18,	%f26,	%f22
	movn	%icc,	%l1,	%i5
	alignaddrl	%o4,	%i7,	%i2
	bg	loop_1014
	ba,a,pn	%icc,	loop_1015
	movcs	%xcc,	%i3,	%l3
	set	0x2C, %l4
	nop	 ! 	stha	%l6,	[%l7 + %l4] 0xe3 ASI use changed by convert2hboot
	membar	#Sync
loop_1014:
	nop 	! 	tsubcctv	%i0,	%o0,	%g3 changed by convert2hboot
loop_1015:
	nop
	set	0x3A, %i4
	nop	 ! 	ldsha	[%l7 + %i4] 0x15,	%o6 ASI use changed by convert2hboot
	flush	%l7 + 0x14
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	udivx	%o5,	0x0E83,	%i1
	or	%g5,	0x0984,	%l5
	mova	%icc,	%o3,	%i6
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	srax	%o2,	%l0,	%l2
	mova	%icc,	%o7,	%g6
	bcc,a	loop_1016
	fxnors	%f9,	%f14,	%f8
	sub	%i4,	0x1A50,	%l4
	and	%g7,	0x1E97,	%o1
loop_1016:
	sdiv	%g2,	0x1879,	%g4
	bg	%icc,	loop_1017
	array8	%g1,	%i5,	%l1
	ble	%xcc,	loop_1018
	membar	0x76
loop_1017:
	subc	%i7,	%o4,	%i3
	xorcc	%i2,	0x1674,	%l3
loop_1018:
	sra	%l6,	0x12,	%i0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	nop	 ! 	casxa	[%l6] 0x88,	%o0,	%g3 ASI use changed by convert2hboot
	st	%f18,	[%l7 + 0x5C]
	bl,pn	%xcc,	loop_1019
	nop
	set	0x4C, %i3
	prefetch	[%l7 + %i3],	 0x1
	set	0x7B, %i7
	nop	 ! 	stba	%o5,	[%l7 + %i7] 0x80 ASI use changed by convert2hboot
loop_1019:
	fbne	%fcc0,	loop_1020
	add	%i1,	%o6,	%l5
	fmovda	%icc,	%f29,	%f15
	edge8ln	%o3,	%g5,	%i6
loop_1020:
	nop
	set	0x72, %o6
	ldsh	[%l7 + %o6],	%l0
	call	loop_1021
	ldsw	[%l7 + 0x50],	%l2
	edge32ln	%o7,	%o2,	%g6
	fmovdneg	%xcc,	%f8,	%f24
loop_1021:
	or	%l4,	%i4,	%g7
	fabss	%f5,	%f14
	nop 	! 	tsubcc	%o1,	%g4,	%g1 changed by convert2hboot
	fbl,a	%fcc3,	loop_1022
	fmovdne	%icc,	%f13,	%f26
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	edge32ln	%i5,	%g2,	%l1
loop_1022:
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
	fpadd32s	%f0,	%f23,	%f2
	wr	%g0,	0x81,	%asi
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
	fmovse	%icc,	%f31,	%f27
	movcc	%xcc,	%i7,	%o4
	nop
	setx loop_1023, %l0, %l1
	jmpl %l1, %i2
	fmovspos	%icc,	%f31,	%f17
	edge16l	%l3,	%i3,	%i0
	fbuge	%fcc0,	loop_1024
loop_1023:
	nop 	! 	tneg	%xcc,	0x2 changed by convert2hboot
	bn,pn	%icc,	loop_1025
	movrne	%o0,	%l6,	%g3
loop_1024:
	andn	%i1,	0x18F5,	%o5
	subccc	%l5,	0x14DF,	%o3
loop_1025:
	bleu,a,pt	%xcc,	loop_1026
	fnot1s	%f3,	%f10
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	fmovscs	%xcc,	%f2,	%f17
loop_1026:
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	set	0x60, %i2
	nop	 ! 	prefetcha	[%l7 + %i2] 0x0c,	 0x2 ASI use changed by convert2hboot
	bcc,pn	%xcc,	loop_1027
	sdivcc	%o6,	0x158D,	%l0
	lduh	[%l7 + 0x6C],	%l2
	nop 	! 	sir	0x0ACB changed by convert2hboot
loop_1027:
	fmul8sux16	%f4,	%f20,	%f0
	bneg,pt	%icc,	loop_1028
	flush	%l7 + 0x74
	nop
	setx loop_1029, %l0, %l1
	jmpl %l1, %i6
	fmovdcc	%xcc,	%f25,	%f22
loop_1028:
	movvc	%xcc,	%o2,	%g6
	edge8	%l4,	%o7,	%i4
loop_1029:
	nop 	! 	tvc	%xcc,	0x0 changed by convert2hboot
	movge	%icc,	%o1,	%g7
	alignaddrl	%g4,	%i5,	%g1
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	sta	%f17,	[%l7 + 0x0C] %asi
	bcs,pn	%xcc,	loop_1030
	brlz	%l1,	loop_1031
	fbe,a	%fcc1,	loop_1032
	xnorcc	%g2,	%i7,	%i2
loop_1030:
	fmovdpos	%xcc,	%f28,	%f3
loop_1031:
	movvc	%icc,	%o4,	%l3
loop_1032:
	fbue,a	%fcc1,	loop_1033
	ble,a,pn	%icc,	loop_1034
	edge16n	%i3,	%i0,	%o0
	ld	[%l7 + 0x74],	%f23
loop_1033:
	nop 	! 	tgu	%xcc,	0x6 changed by convert2hboot
loop_1034:
	movgu	%icc,	%g3,	%i1
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	edge16ln	%o5,	%l6,	%l5
	fbue	%fcc3,	loop_1035
	ldsb	[%l7 + 0x7D],	%g5
	set	0x44, %i1
	nop	 ! 	ldstuba	[%l7 + %i1] 0x11,	%o6 ASI use changed by convert2hboot
loop_1035:
	nop
	setx	loop_1036,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	lduh	[%l7 + 0x44],	%o3
	movl	%icc,	%l0,	%i6
	fmovrde	%l2,	%f24,	%f28
loop_1036:
	fble	%fcc1,	loop_1037
	nop
	set	0x2C, %i6
	prefetch	[%l7 + %i6],	 0x0
	fbule,a	%fcc0,	loop_1038
	orcc	%o2,	0x117B,	%g6
loop_1037:
	xorcc	%l4,	0x06E7,	%o7
	movn	%xcc,	%o1,	%i4
loop_1038:
	sethi	0x055B,	%g4
	nop 	! 	tvs	%xcc,	0x2 changed by convert2hboot
	movre	%i5,	0x1D1,	%g7
	smul	%l1,	0x1581,	%g1
	wr	%g0,	0x18,	%asi
	subccc	%i7,	0x001C,	%o4
	fpadd16s	%f13,	%f1,	%f18
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	set	0x40, %o3
	sta	%f9,	[%l7 + %o3] 0x88
	xnor	%l3,	0x17AA,	%i3
	lduh	[%l7 + 0x56],	%i2
	nop 	! 	sir	0x0FED changed by convert2hboot
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	srlx	%i0,	0x01,	%o0
	or	%i1,	0x0F08,	%g3
	movvs	%xcc,	%l6,	%o5
	movrgez	%l5,	0x13C,	%g5
	subccc	%o3,	%o6,	%i6
	bpos,pn	%xcc,	loop_1039
	andncc	%l0,	%l2,	%g6
	membar	0x3D
	addccc	%o2,	0x1FB5,	%l4
loop_1039:
	fpack16	%f16,	%f29
	addcc	%o7,	0x0B33,	%i4
	and	%o1,	0x0923,	%g4
	subcc	%g7,	%l1,	%g1
	movrlez	%g2,	%i5,	%i7
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
	udivx	%o4,	0x19A5,	%l3
	xnorcc	%i2,	0x161C,	%i3
	fble,a	%fcc1,	loop_1040
	movl	%icc,	%i0,	%i1
	edge16n	%o0,	%g3,	%o5
	nop 	! 	sir	0x0287 changed by convert2hboot
loop_1040:
	fmovdl	%xcc,	%f27,	%f30
	movvc	%xcc,	%l6,	%l5
	set	0x4A, %o5
	nop	 ! 	ldsha	[%l7 + %o5] 0x14,	%g5 ASI use changed by convert2hboot
	flush	%l7 + 0x64
	andn	%o3,	%o6,	%i6
	sdivx	%l0,	0x1DD1,	%g6
	movge	%xcc,	%o2,	%l4
	swap	[%l7 + 0x08],	%o7
	bg,a	%xcc,	loop_1041
	movleu	%xcc,	%i4,	%l2
	movcc	%xcc,	%g4,	%g7
	wr	%g0,	0x11,	%asi
	sta	%f2,	[%l7 + 0x3C] %asi
loop_1041:
	nop
	wr	%g0,	0x0c,	%asi
	sllx	%o1,	0x1A,	%g1
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
	fmovsa	%icc,	%f17,	%f15
	alignaddrl	%i5,	%i7,	%g2
	fnot1s	%f6,	%f30
	fmovrdgez	%l3,	%f30,	%f8
	set	0x30, %l1
	nop	 ! 	stda	%o4,	[%l7 + %l1] 0x2a ASI use changed by convert2hboot
	membar	#Sync
	fmovrslz	%i2,	%f23,	%f2
	udivcc	%i3,	0x10D1,	%i1
	movg	%icc,	%o0,	%g3
	movge	%icc,	%o5,	%l6
	fmul8x16au	%f16,	%f8,	%f28
	subcc	%i0,	0x15DA,	%l5
	and	%o3,	%o6,	%i6
	st	%f21,	[%l7 + 0x58]
	subccc	%l0,	%g5,	%o2
	bshuffle	%f14,	%f6,	%f6
	sdivx	%g6,	0x11AA,	%o7
	movcs	%icc,	%i4,	%l4
	ldsw	[%l7 + 0x58],	%g4
	wr	%g0,	0x18,	%asi
	nop 	! 	tsubcc	%l2,	%l1,	%o1 changed by convert2hboot
	andn	%i5,	%i7,	%g1
	bleu,a	loop_1042
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f14,	%f30
	fmovscs	%icc,	%f14,	%f6
loop_1042:
	nop 	! 	tcc	%icc,	0x4 changed by convert2hboot
	fbug,a	%fcc2,	loop_1043
	srl	%l3,	%o4,	%g2
	fmovdcs	%icc,	%f10,	%f3
	xnorcc	%i2,	%i3,	%i1
loop_1043:
	sllx	%o0,	0x06,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g3,	%l6,	%i0
	bcs,a,pn	%icc,	loop_1044
	edge32l	%l5,	%o3,	%o6
	fmovsge	%icc,	%f16,	%f13
	edge8ln	%i6,	%l0,	%g5
loop_1044:
	fpmerge	%f28,	%f4,	%f4
	movrgez	%o2,	%g6,	%i4
	add	%o7,	0x0102,	%g4
	bvs	loop_1045
	nop 	! 	tsubcctv	%g7,	0x11C5,	%l4 changed by convert2hboot
	movl	%icc,	%l2,	%o1
	sllx	%l1,	%i7,	%g1
loop_1045:
	fbn	%fcc0,	loop_1046
	fbn,a	%fcc3,	loop_1047
	fxor	%f28,	%f0,	%f24
	fmovdneg	%xcc,	%f15,	%f30
loop_1046:
	edge8n	%i5,	%o4,	%l3
loop_1047:
	movge	%xcc,	%g2,	%i2
	fcmpgt16	%f30,	%f26,	%i3
	nop 	! 	taddcctv	%o0,	0x0DDD,	%i1 changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	movg	%icc,	%o5,	%g3
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	ble,a	loop_1048
	bvs	loop_1049
	alignaddrl	%i0,	%l5,	%l6
	edge16l	%o6,	%i6,	%l0
loop_1048:
	nop
	set	0x6C, %i5
	lda	[%l7 + %i5] 0x81,	%f17
loop_1049:
	stw	%o3,	[%l7 + 0x58]
	movn	%xcc,	%o2,	%g5
	fmovdleu	%xcc,	%f29,	%f29
	set	0x20, %g3
	nop	 ! 	prefetcha	[%l7 + %g3] 0x18,	 0x2 ASI use changed by convert2hboot
	sth	%i4,	[%l7 + 0x6C]
	pdist	%f18,	%f2,	%f30
	srax	%g4,	0x11,	%o7
	movg	%icc,	%g7,	%l4
	fmovrdne	%o1,	%f20,	%f16
	movrne	%l2,	0x25D,	%l1
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	subc	%i7,	0x07B6,	%i5
	fbule,a	%fcc3,	loop_1050
	ld	[%l7 + 0x68],	%f22
	nop 	! 	te	%icc,	0x3 changed by convert2hboot
	movre	%o4,	%g1,	%l3
loop_1050:
	bneg,a,pt	%xcc,	loop_1051
	subcc	%g2,	%i3,	%i2
	bgu	loop_1052
	or	%i1,	%o5,	%o0
loop_1051:
	fornot2s	%f30,	%f2,	%f18
	nop
	setx	loop_1053,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_1052:
	movle	%xcc,	%i0,	%g3
	bne,a,pn	%icc,	loop_1054
	addc	%l5,	0x1E76,	%o6
loop_1053:
	nop
	wr	%g0,	0x0c,	%asi
loop_1054:
	subccc	%i6,	0x04CD,	%l0
	prefetch	[%l7 + 0x54],	 0x3
	fmovd	%f6,	%f14
	alignaddrl	%o3,	%g5,	%o2
	movcs	%xcc,	%g6,	%i4
	set	0x40, %l5
	nop	 ! 	ldda	[%l7 + %l5] 0x22,	%g4 ASI use changed by convert2hboot
	movvs	%icc,	%o7,	%l4
	movne	%xcc,	%g7,	%l2
	popc	0x10A1,	%l1
	edge32l	%o1,	%i5,	%i7
	fcmpne16	%f14,	%f30,	%g1
	movrlz	%l3,	0x04F,	%g2
	movre	%i3,	0x131,	%o4
	subc	%i2,	%i1,	%o5
	edge16n	%o0,	%g3,	%l5
	nop 	! 	tpos	%icc,	0x3 changed by convert2hboot
	movrgez	%i0,	%l6,	%o6
	fcmps	%fcc3,	%f7,	%f4
	bge,a	loop_1055
	bneg,pn	%xcc,	loop_1056
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tvs	%icc,	0x5 changed by convert2hboot
loop_1055:
	fpadd16s	%f16,	%f29,	%f24
loop_1056:
	movl	%xcc,	%i6,	%o3
	wr	%g0,	0x88,	%asi
	sethi	0x1BE9,	%l0
	movcc	%icc,	%g5,	%o2
	nop 	! 	tn	%xcc,	0x5 changed by convert2hboot
	fpackfix	%f26,	%f31
	movg	%xcc,	%i4,	%g6
	nop 	! 	taddcc	%o7,	0x024F,	%l4 changed by convert2hboot
	fornot1s	%f31,	%f21,	%f0
	fmovs	%f23,	%f3
	subc	%g7,	0x0CB5,	%l2
	bg,a,pn	%icc,	loop_1057
	fmovrsgz	%l1,	%f6,	%f26
	andcc	%o1,	0x03C0,	%i5
	movcc	%icc,	%g4,	%g1
loop_1057:
	fnors	%f19,	%f1,	%f17
	sll	%i7,	0x15,	%l3
	edge32ln	%i3,	%o4,	%i2
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	movgu	%icc,	%g2,	%i1
	fsrc1s	%f22,	%f30
	orn	%o0,	0x13A3,	%o5
	fbug,a	%fcc3,	loop_1058
	fmovsn	%icc,	%f15,	%f31
	and	%l5,	0x0485,	%i0
	movvc	%icc,	%l6,	%o6
loop_1058:
	fmovsleu	%icc,	%f1,	%f29
	nop 	! 	tvc	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tvc	%icc,	0x5 changed by convert2hboot
	nop 	! 	ta	%xcc,	0x2 changed by convert2hboot
	addccc	%g3,	0x0174,	%o3
	nop 	! 	taddcc	%l0,	%g5,	%o2 changed by convert2hboot
	fmovdl	%xcc,	%f13,	%f29
	ldsw	[%l7 + 0x18],	%i4
	bleu,a,pt	%icc,	loop_1059
	movvs	%xcc,	%g6,	%i6
	bleu	loop_1060
	edge16l	%o7,	%g7,	%l2
loop_1059:
	andncc	%l4,	%o1,	%i5
	sra	%l1,	%g4,	%g1
loop_1060:
	fmuld8ulx16	%f19,	%f17,	%f20
	edge16	%i7,	%i3,	%o4
	alignaddr	%l3,	%g2,	%i1
	mulx	%i2,	0x1729,	%o0
	fandnot1s	%f10,	%f22,	%f28
	movgu	%xcc,	%o5,	%l5
	udiv	%i0,	0x052C,	%l6
	fand	%f18,	%f0,	%f8
	udivcc	%o6,	0x1A3F,	%o3
	movn	%icc,	%g3,	%g5
	xnorcc	%o2,	0x1EAB,	%l0
	movneg	%icc,	%g6,	%i4
	movrne	%o7,	%g7,	%l2
	udivcc	%l4,	0x020E,	%i6
	movg	%icc,	%o1,	%i5
	alignaddr	%l1,	%g4,	%i7
	movvc	%xcc,	%g1,	%i3
	edge16ln	%l3,	%o4,	%i1
	smulcc	%i2,	0x0D72,	%g2
	or	%o0,	%l5,	%o5
	fblg	%fcc1,	loop_1061
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
	subccc	%l6,	%i0,	%o3
	nop
	setx	loop_1062,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_1061:
	fbl	%fcc3,	loop_1063
	smul	%o6,	%g5,	%g3
	movn	%xcc,	%l0,	%o2
loop_1062:
	mulscc	%g6,	%i4,	%o7
loop_1063:
	orncc	%l2,	0x000E,	%g7
	andncc	%i6,	%o1,	%i5
	nop
	set	0x48, %o7
	stb	%l4,	[%l7 + %o7]
	add	%l1,	0x1257,	%g4
	orncc	%i7,	0x1BAD,	%g1
	fxors	%f6,	%f29,	%f24
	edge8	%l3,	%i3,	%o4
	fmovsle	%xcc,	%f8,	%f29
	brlz,a	%i2,	loop_1064
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	smulcc	%g2,	0x0444,	%o0
	bge,a,pn	%icc,	loop_1065
loop_1064:
	bleu,a,pt	%xcc,	loop_1066
	fnot1	%f18,	%f2
	orncc	%l5,	0x1EA5,	%i1
loop_1065:
	fbne,a	%fcc2,	loop_1067
loop_1066:
	fandnot2	%f6,	%f26,	%f26
	udiv	%l6,	0x134E,	%i0
	edge32	%o3,	%o5,	%o6
loop_1067:
	andcc	%g3,	0x1416,	%g5
	fmovsleu	%icc,	%f8,	%f28
	sub	%o2,	0x154D,	%g6
	movpos	%xcc,	%l0,	%i4
	fpadd32s	%f13,	%f3,	%f18
	srl	%l2,	0x1C,	%o7
	udiv	%g7,	0x0B81,	%i6
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	fbule	%fcc2,	loop_1068
	fmovdge	%icc,	%f0,	%f29
	edge32l	%i5,	%l4,	%o1
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
loop_1068:
	fmovde	%icc,	%f3,	%f14
	movrgz	%l1,	0x326,	%i7
	edge32l	%g4,	%l3,	%i3
	fmovrde	%o4,	%f0,	%f14
	movg	%xcc,	%g1,	%g2
	movle	%xcc,	%i2,	%o0
	nop 	! 	tsubcc	%i1,	%l5,	%i0 changed by convert2hboot
	addcc	%l6,	0x1B69,	%o5
	movre	%o6,	0x1B5,	%g3
	fmovscs	%icc,	%f21,	%f16
	membar	0x76
	set	0x6E, %g7
	nop	 ! 	ldsha	[%l7 + %g7] 0x04,	%o3 ASI use changed by convert2hboot
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
	addc	%g5,	%o2,	%g6
	nop 	! 	sir	0x010E changed by convert2hboot
	bn,pn	%xcc,	loop_1069
	addcc	%l0,	0x08AF,	%i4
	umulcc	%o7,	0x0A54,	%g7
	fbule,a	%fcc1,	loop_1070
loop_1069:
	sethi	0x0F00,	%l2
	addcc	%i5,	0x0CD5,	%l4
	fnot2s	%f3,	%f8
loop_1070:
	fsrc2s	%f31,	%f14
	movrlez	%i6,	%l1,	%i7
	fnegs	%f29,	%f2
	mulscc	%o1,	0x05E9,	%g4
	movcs	%icc,	%i3,	%o4
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%g0
	fpadd16	%f6,	%f0,	%f22
	fnot1s	%f14,	%f7
	set	0x34, %o2
	nop	 ! 	lduba	[%l7 + %o2] 0x14,	%g2 ASI use changed by convert2hboot
	array8	%l3,	%i2,	%i1
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
	nop
	set	0x54, %o0
	stw	%l5,	[%l7 + %o0]
	movrgz	%o0,	%i0,	%o5
	array32	%l6,	%g3,	%o6
	sllx	%o3,	%g5,	%g6
	stw	%l0,	[%l7 + 0x18]
	mulx	%o2,	0x1486,	%i4
	udivx	%g7,	0x150F,	%l2
	movl	%icc,	%i5,	%l4
	fsrc2	%f26,	%f14
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	movrlz	%o7,	%i6,	%i7
	and	%o1,	%g4,	%i3
	be,pn	%xcc,	loop_1071
	fmovsl	%xcc,	%f30,	%f0
	sdivx	%o4,	0x1B0D,	%l1
	addcc	%g2,	0x1990,	%g1
loop_1071:
	movrgez	%i2,	%l3,	%i1
	movrne	%o0,	%l5,	%i0
	nop 	! 	tge	%icc,	0x3 changed by convert2hboot
	fble	%fcc1,	loop_1072
	xor	%o5,	0x0D7F,	%l6
	fmovrsgz	%g3,	%f5,	%f8
	set	0x20, %o4
	nop	 ! 	ldxa	[%g0 + %o4] 0x58,	%o6 ASI use changed by convert2hboot
loop_1072:
	movl	%icc,	%o3,	%g6
	edge32l	%l0,	%o2,	%i4
	mova	%xcc,	%g5,	%l2
	movcs	%icc,	%g7,	%l4
	wr	%g0,	0x80,	%asi
	fmovsleu	%xcc,	%f6,	%f21
	array16	%i6,	%o7,	%o1
	movrlez	%i7,	0x38B,	%i3
	fone	%f14
	fxnor	%f22,	%f26,	%f20
	edge8	%g4,	%o4,	%g2
	edge16	%g1,	%i2,	%l3
	movle	%icc,	%i1,	%l1
	edge8ln	%o0,	%i0,	%o5
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	wr	%g0,	0x80,	%asi
	membar	#Sync
	set	0x40, %g1
	nop	 ! 	ldda	[%l7 + %g1] 0xf1,	%f16 ASI use changed by convert2hboot
	movgu	%xcc,	%l6,	%g3
	set	0x50, %g5
	nop	 ! 	ldstuba	[%l7 + %g5] 0x88,	%o3 ASI use changed by convert2hboot
	mulx	%o6,	%g6,	%l0
	subcc	%i4,	0x17FC,	%g5
	fmovdne	%xcc,	%f8,	%f27
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
	movrlez	%o2,	0x094,	%l2
	move	%icc,	%l4,	%g7
	movneg	%icc,	%i6,	%o7
	fmovrdne	%o1,	%f26,	%f4
	umul	%i5,	0x0296,	%i3
	move	%icc,	%g4,	%i7
	alignaddr	%g2,	%o4,	%g1
	fpadd16	%f2,	%f26,	%f26
	movneg	%icc,	%l3,	%i2
	smul	%l1,	0x09C2,	%i1
	fcmps	%fcc3,	%f2,	%f23
	addc	%o0,	0x1A14,	%i0
	fabss	%f28,	%f11
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	set	0x14, %o1
	nop	 ! 	stwa	%l5,	[%l7 + %o1] 0x11 ASI use changed by convert2hboot
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	fmovdne	%icc,	%f21,	%f21
	subccc	%l6,	%o6,	%g6
	andn	%o3,	0x0DB0,	%i4
	ldx	[%l7 + 0x40],	%l0
	edge16l	%g5,	%o2,	%l2
	movvs	%icc,	%g7,	%i6
	movrlz	%o7,	%l4,	%i5
	ldd	[%l7 + 0x48],	%o0
	fbn	%fcc0,	loop_1073
	movleu	%icc,	%g4,	%i7
	subccc	%g2,	0x1C58,	%i3
	edge32l	%o4,	%l3,	%i2
loop_1073:
	subcc	%l1,	%g1,	%o0
	fbu	%fcc3,	loop_1074
	andn	%i0,	%l5,	%o5
	fbl	%fcc3,	loop_1075
	popc	0x027C,	%g3
loop_1074:
	fpadd16s	%f13,	%f9,	%f26
	edge16	%l6,	%o6,	%i1
loop_1075:
	mova	%xcc,	%g6,	%o3
	fmovrsne	%l0,	%f10,	%f18
	ldx	[%l7 + 0x18],	%g5
	fmovrdlz	%o2,	%f28,	%f18
	fcmpgt16	%f24,	%f0,	%i4
	fbue,a	%fcc3,	loop_1076
	fmovd	%f8,	%f0
	andn	%l2,	%g7,	%o7
	xnorcc	%l4,	%i6,	%i5
loop_1076:
	movcs	%xcc,	%g4,	%o1
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	fmul8sux16	%f10,	%f18,	%f10
	movcc	%icc,	%i7,	%i3
	edge8	%g2,	%o4,	%l3
	fones	%f22
	fbue,a	%fcc1,	loop_1077
	nop 	! 	tsubcc	%l1,	0x1CEC,	%i2 changed by convert2hboot
	bg,pt	%icc,	loop_1078
	xorcc	%g1,	%o0,	%i0
loop_1077:
	mulscc	%l5,	%o5,	%l6
	addccc	%o6,	0x15A2,	%i1
loop_1078:
	nop
	wr	%g0,	0x80,	%asi
	nop 	! 	tleu	%icc,	0x6 changed by convert2hboot
	fmul8x16au	%f29,	%f21,	%f8
	movvc	%icc,	%o3,	%l0
	orcc	%g5,	%g3,	%i4
	addcc	%o2,	%l2,	%o7
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	fbul,a	%fcc3,	loop_1079
	nop 	! 	sir	0x03F7 changed by convert2hboot
	movne	%xcc,	%g7,	%i6
	fzeros	%f11
loop_1079:
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
	movn	%icc,	%l4,	%i5
	wr	%g0,	0x81,	%asi
	movcc	%xcc,	%g4,	%i3
	array8	%i7,	%g2,	%l3
	fmovdcs	%icc,	%f3,	%f30
	array8	%o4,	%l1,	%i2
	fbu,a	%fcc2,	loop_1080
	edge8n	%g1,	%o0,	%l5
	fpackfix	%f10,	%f13
	udivcc	%o5,	0x181B,	%l6
loop_1080:
	nop 	! 	tsubcc	%o6,	%i0,	%i1 changed by convert2hboot
	movrgez	%o3,	%l0,	%g5
	set	0x6F, %l2
	nop	 ! 	ldsba	[%l7 + %l2] 0x81,	%g6 ASI use changed by convert2hboot
	nop
	setx loop_1081, %l0, %l1
	jmpl %l1, %g3
	nop 	! 	tl	%icc,	0x6 changed by convert2hboot
	std	%f10,	[%l7 + 0x38]
	xnor	%i4,	0x1A88,	%o2
loop_1081:
	umul	%l2,	%o7,	%i6
	fmul8x16	%f3,	%f24,	%f26
	movneg	%xcc,	%l4,	%i5
	fpack32	%f12,	%f18,	%f20
	movgu	%icc,	%g7,	%g4
	edge32l	%o1,	%i3,	%i7
	lduh	[%l7 + 0x0E],	%g2
	fabsd	%f22,	%f28
	fmovsne	%xcc,	%f16,	%f12
	mulscc	%l3,	%l1,	%o4
	fand	%f16,	%f8,	%f28
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	subccc	%g1,	0x0F22,	%i2
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	membar	#Sync
	set	0x40, %l3
	nop	 ! 	ldda	[%l7 + %l3] 0x1f,	%f0 ASI use changed by convert2hboot
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	ldd	[%l7 + 0x30],	%o0
	sdivx	%l5,	0x0F59,	%o5
	fmovrdlez	%l6,	%f18,	%f0
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	fone	%f14
	stx	%o6,	[%l7 + 0x60]
	fmovrdgez	%i1,	%f18,	%f10
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	edge32n	%o3,	%l0,	%i0
	fbule	%fcc3,	loop_1082
	movcc	%icc,	%g5,	%g6
	fmovscs	%icc,	%f17,	%f2
	orn	%g3,	%o2,	%l2
loop_1082:
	bg,pn	%xcc,	loop_1083
	orcc	%o7,	0x1194,	%i6
	sth	%i4,	[%l7 + 0x60]
	add	%l4,	%i5,	%g7
loop_1083:
	nop 	! 	tle	%icc,	0x2 changed by convert2hboot
	edge8n	%g4,	%o1,	%i7
	fnors	%f19,	%f9,	%f1
	brnz	%i3,	loop_1084
	fmovdg	%icc,	%f15,	%f18
	nop
	setx	loop_1085,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	edge32n	%l3,	%l1,	%o4
loop_1084:
	movl	%xcc,	%g2,	%g1
	move	%icc,	%i2,	%o0
loop_1085:
	fmovdleu	%icc,	%f10,	%f3
	fcmpgt32	%f28,	%f12,	%o5
	movg	%icc,	%l6,	%o6
	movcc	%icc,	%i1,	%o3
	array32	%l5,	%l0,	%i0
	sdivcc	%g6,	0x074E,	%g5
	fandnot2	%f2,	%f8,	%f30
	xorcc	%o2,	0x05FE,	%l2
	bg,a,pt	%icc,	loop_1086
	fcmpd	%fcc0,	%f10,	%f28
	orn	%g3,	0x17E0,	%o7
	sllx	%i6,	%l4,	%i5
loop_1086:
	fmovdl	%xcc,	%f2,	%f30
	bl,a,pn	%xcc,	loop_1087
	fand	%f26,	%f18,	%f24
	sdivx	%i4,	0x0719,	%g4
	brgez,a	%g7,	loop_1088
loop_1087:
	movle	%icc,	%i7,	%i3
	sub	%l3,	%l1,	%o1
	fmovsge	%xcc,	%f27,	%f2
loop_1088:
	fpmerge	%f14,	%f7,	%f24
	or	%g2,	%g1,	%o4
	stb	%i2,	[%l7 + 0x0C]
	edge16l	%o0,	%l6,	%o5
	sethi	0x16EB,	%o6
	smul	%i1,	0x1142,	%l5
	flush	%l7 + 0x4C
	fmovspos	%xcc,	%f8,	%f17
	movge	%xcc,	%l0,	%i0
	mulscc	%g6,	0x1DED,	%g5
	sethi	0x1484,	%o3
	nop 	! 	taddcc	%l2,	%o2,	%o7 changed by convert2hboot
	wr	%g0,	0x27,	%asi
	membar	#Sync
	fornot2	%f12,	%f8,	%f6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i6
	nop	 ! 	casa	[%l6] 0x04,	%i6,	%l4 ASI use changed by convert2hboot
	ldub	[%l7 + 0x5D],	%i5
	edge32	%g4,	%g7,	%i7
	movre	%i3,	0x25B,	%l3
	edge8ln	%l1,	%o1,	%g2
	bgu,a,pt	%xcc,	loop_1089
	nop 	! 	taddcctv	%i4,	%g1,	%o4 changed by convert2hboot
	set	0x50, %l0
	nop	 ! 	ldda	[%l7 + %l0] 0x15,	%i2 ASI use changed by convert2hboot
loop_1089:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tsubcc	%l6,	0x032C,	%o5 changed by convert2hboot
	fmovdg	%xcc,	%f8,	%f25
	nop
	setx loop_1090, %l0, %l1
	jmpl %l1, %o6
	fbule,a	%fcc3,	loop_1091
	add	%i1,	0x04B9,	%l5
	brlez	%l0,	loop_1092
loop_1090:
	sllx	%i0,	%o0,	%g5
loop_1091:
	and	%g6,	%l2,	%o2
	movle	%icc,	%o7,	%o3
loop_1092:
	fpsub16s	%f2,	%f30,	%f24
	wr	%g0,	0x80,	%asi
	sta	%f31,	[%l7 + 0x08] %asi
	movrne	%i6,	%l4,	%i5
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	bgu,a,pt	%icc,	loop_1093
	movrgez	%g3,	0x134,	%g4
	movneg	%icc,	%i7,	%i3
	edge16l	%l3,	%l1,	%o1
loop_1093:
	fmovrsne	%g2,	%f12,	%f24
	array32	%i4,	%g1,	%g7
	fblg,a	%fcc2,	loop_1094
	fnor	%f22,	%f4,	%f22
	fpadd32	%f20,	%f30,	%f2
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
loop_1094:
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	fbl,a	%fcc3,	loop_1095
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
	smulcc	%o4,	0x1654,	%l6
	smulcc	%o5,	%i2,	%o6
loop_1095:
	stb	%i1,	[%l7 + 0x5C]
	fmul8sux16	%f4,	%f30,	%f24
	bl,pt	%icc,	loop_1096
	sub	%l5,	0x06FC,	%l0
	fornot2s	%f4,	%f10,	%f20
	fpsub16	%f28,	%f24,	%f30
loop_1096:
	movrgz	%o0,	%i0,	%g5
	movle	%icc,	%g6,	%o2
	fcmpne32	%f18,	%f0,	%l2
	bvc,pn	%xcc,	loop_1097
	ldsb	[%l7 + 0x2D],	%o3
	sth	%o7,	[%l7 + 0x1A]
	fmovscc	%icc,	%f15,	%f26
loop_1097:
	movrlez	%l4,	0x0BB,	%i5
	fcmple32	%f20,	%f20,	%g3
	wr	%g0,	0x04,	%asi
	or	%g4,	%i7,	%i3
	and	%l1,	0x08C3,	%l3
	fpsub16	%f28,	%f14,	%f4
	siam	0x3
	andncc	%g2,	%o1,	%g1
	nop
	setx	loop_1098,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	movcc	%icc,	%i4,	%g7
	movneg	%icc,	%o4,	%o5
	edge8	%i2,	%o6,	%i1
loop_1098:
	array8	%l6,	%l5,	%o0
	addc	%i0,	0x05CA,	%l0
	movvs	%xcc,	%g6,	%o2
	xor	%l2,	%g5,	%o7
	fandnot2s	%f27,	%f11,	%f29
	fmuld8sux16	%f17,	%f21,	%f8
	xorcc	%l4,	%i5,	%o3
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	sllx	%i6,	0x08,	%i7
	fmovdn	%xcc,	%f29,	%f30
	wr	%g0,	0x81,	%asi
	fmovrde	%l3,	%f8,	%f8
	fbg,a	%fcc2,	loop_1099
	nop 	! 	tle	%icc,	0x2 changed by convert2hboot
	nop 	! 	taddcctv	%g2,	%i3,	%o1 changed by convert2hboot
	mova	%icc,	%i4,	%g7
loop_1099:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	nop	 ! 	casxa	[%l6] 0x04,	%g1,	%o5 ASI use changed by convert2hboot
	movpos	%xcc,	%i2,	%o6
	edge8	%i1,	%o4,	%l5
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
	movvs	%icc,	%o0,	%l6
	edge32n	%l0,	%g6,	%i0
	fmovrslz	%l2,	%f10,	%f0
	andncc	%g5,	%o2,	%l4
	nop 	! 	ta	%xcc,	0x0 changed by convert2hboot
	udiv	%o7,	0x12CA,	%o3
	orncc	%g3,	0x1BA5,	%g4
	swap	[%l7 + 0x10],	%i5
	bg,a	loop_1100
	fmovs	%f2,	%f29
	fmovrsgez	%i7,	%f12,	%f13
	movre	%l1,	0x338,	%l3
loop_1100:
	edge16l	%g2,	%i6,	%o1
	movg	%icc,	%i3,	%g7
	ldsw	[%l7 + 0x38],	%g1
	std	%o4,	[%l7 + 0x18]
	movvs	%icc,	%i4,	%o6
	sdivcc	%i2,	0x004D,	%o4
	faligndata	%f10,	%f28,	%f24
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	lduw	[%l7 + 0x1C],	%i1
	ldd	[%l7 + 0x38],	%l4
	umul	%l6,	%o0,	%g6
	subccc	%i0,	0x0C7F,	%l2
	fpmerge	%f7,	%f31,	%f10
	movcs	%icc,	%g5,	%o2
	subc	%l4,	0x0490,	%o7
	fzeros	%f8
	fbl	%fcc2,	loop_1101
	andn	%o3,	%l0,	%g4
	stw	%i5,	[%l7 + 0x10]
	stx	%i7,	[%l7 + 0x38]
loop_1101:
	fandnot1	%f26,	%f18,	%f28
	nop 	! 	tge	%icc,	0x4 changed by convert2hboot
	array32	%g3,	%l3,	%g2
	ble,a	%xcc,	loop_1102
	movrlz	%l1,	%o1,	%i3
	nop 	! 	tpos	%icc,	0x6 changed by convert2hboot
	brlez,a	%i6,	loop_1103
loop_1102:
	movleu	%icc,	%g1,	%o5
	fmovsvs	%xcc,	%f7,	%f29
	fpsub16s	%f7,	%f18,	%f15
loop_1103:
	edge8	%i4,	%o6,	%g7
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	wr	%g0,	0x80,	%asi
	edge16l	%o4,	%i1,	%l5
	alignaddrl	%i2,	%l6,	%o0
	nop 	! 	taddcctv	%i0,	%l2,	%g5 changed by convert2hboot
	fmovsge	%xcc,	%f3,	%f10
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	mova	%icc,	%o2,	%g6
	set	0x7C, %i0
	nop	 ! 	ldswa	[%l7 + %i0] 0x0c,	%l4 ASI use changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu	loop_1104
	ldsw	[%l7 + 0x68],	%o7
	and	%o3,	0x080D,	%l0
	nop 	! 	taddcctv	%g4,	0x1CC4,	%i5 changed by convert2hboot
loop_1104:
	mulx	%i7,	0x1796,	%g3
	smulcc	%l3,	%g2,	%o1
	ldstub	[%l7 + 0x3D],	%i3
	sethi	0x044F,	%i6
	stb	%l1,	[%l7 + 0x4B]
	xnorcc	%o5,	%g1,	%o6
	pdist	%f30,	%f26,	%f0
	fmovrdgez	%i4,	%f16,	%f8
	set	0x08, %g2
	lda	[%l7 + %g2] 0x04,	%f6
	fxnor	%f0,	%f0,	%f18
	fornot1	%f24,	%f28,	%f14
	andcc	%g7,	%i1,	%o4
	ldsh	[%l7 + 0x10],	%i2
	umul	%l5,	0x09AA,	%o0
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	orcc	%i0,	%l2,	%l6
	addccc	%o2,	0x117D,	%g6
	fpsub16	%f28,	%f26,	%f28
	orn	%l4,	%g5,	%o7
	movrlz	%l0,	%g4,	%o3
	fmuld8ulx16	%f21,	%f21,	%f24
	edge16ln	%i5,	%g3,	%l3
	fnor	%f22,	%f8,	%f4
	nop 	! 	taddcc	%i7,	%g2,	%i3 changed by convert2hboot
	edge8n	%o1,	%l1,	%o5
	sdivx	%i6,	0x0DDE,	%o6
	subcc	%g1,	0x01FC,	%g7
	alignaddr	%i1,	%i4,	%o4
	and	%l5,	0x1F4E,	%i2
	edge16ln	%i0,	%l2,	%o0
	ba,a	%icc,	loop_1105
	edge32n	%l6,	%g6,	%l4
	srl	%g5,	%o7,	%o2
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
loop_1105:
	movvc	%xcc,	%g4,	%l0
	movn	%xcc,	%i5,	%o3
	subccc	%l3,	0x15D4,	%g3
	brgz,a	%i7,	loop_1106
	alignaddrl	%g2,	%o1,	%l1
	nop
	set	0x4C, %l6
	ldsw	[%l7 + %l6],	%i3
	nop 	! 	tpos	%icc,	0x6 changed by convert2hboot
loop_1106:
	stb	%i6,	[%l7 + 0x64]
	fbn,a	%fcc2,	loop_1107
	edge8	%o6,	%g1,	%o5
	srlx	%g7,	%i1,	%o4
	fabsd	%f18,	%f28
loop_1107:
	fbuge,a	%fcc2,	loop_1108
	brlz,a	%l5,	loop_1109
	and	%i4,	0x020E,	%i0
	sll	%l2,	0x17,	%o0
loop_1108:
	edge16	%i2,	%g6,	%l6
loop_1109:
	fmovsle	%xcc,	%f24,	%f22
	membar	0x6A
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	nop 	! 	tsubcctv	%l4,	0x0F15,	%g5 changed by convert2hboot
	fmovsvc	%xcc,	%f13,	%f9
	fmovrse	%o7,	%f18,	%f1
	fbg,a	%fcc2,	loop_1110
	nop 	! 	taddcc	%g4,	%o2,	%i5 changed by convert2hboot
	nop 	! 	tsubcctv	%l0,	%l3,	%g3 changed by convert2hboot
	fpsub16s	%f3,	%f9,	%f30
loop_1110:
	movrne	%i7,	%o3,	%g2
	smul	%o1,	0x19E9,	%i3
	movg	%xcc,	%i6,	%l1
	faligndata	%f4,	%f2,	%f2
	fpsub32	%f30,	%f24,	%f18
	srax	%o6,	0x05,	%o5
	ble,pn	%xcc,	loop_1111
	movrlez	%g7,	0x376,	%i1
	fnands	%f7,	%f10,	%f24
	orn	%g1,	%o4,	%i4
loop_1111:
	movne	%icc,	%i0,	%l5
	fornot2s	%f23,	%f29,	%f25
	fbul,a	%fcc2,	loop_1112
	edge16	%o0,	%i2,	%g6
	fmul8x16al	%f27,	%f1,	%f28
	fones	%f12
loop_1112:
	sethi	0x156D,	%l2
	movpos	%xcc,	%l4,	%g5
	movrlz	%o7,	%g4,	%l6
	nop
	setx loop_1113, %l0, %l1
	jmpl %l1, %o2
	array16	%i5,	%l3,	%g3
	fcmpgt32	%f4,	%f4,	%i7
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
loop_1113:
	and	%o3,	%l0,	%g2
	ba,a,pn	%xcc,	loop_1114
	movgu	%xcc,	%i3,	%o1
	nop 	! 	tleu	%xcc,	0x7 changed by convert2hboot
	fnor	%f28,	%f26,	%f22
loop_1114:
	edge16n	%l1,	%o6,	%o5
	fands	%f6,	%f21,	%f7
	set	0x33, %g4
	nop	 ! 	ldstuba	[%l7 + %g4] 0x80,	%g7 ASI use changed by convert2hboot
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	bge,pt	%icc,	loop_1115
	fmovsneg	%icc,	%f31,	%f12
	fmovsleu	%xcc,	%f26,	%f7
	movl	%icc,	%i6,	%g1
loop_1115:
	fmovspos	%icc,	%f8,	%f25
	array16	%i1,	%o4,	%i4
	edge16	%l5,	%o0,	%i0
	nop
	setx loop_1116, %l0, %l1
	jmpl %l1, %g6
	fsrc1s	%f25,	%f9
	fbuge	%fcc3,	loop_1117
	mulx	%l2,	0x1881,	%l4
loop_1116:
	std	%f20,	[%l7 + 0x08]
	ldsw	[%l7 + 0x1C],	%g5
loop_1117:
	fpsub16	%f10,	%f22,	%f16
	bcs,a,pt	%icc,	loop_1118
	fbug	%fcc3,	loop_1119
	fnot2s	%f11,	%f25
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
loop_1118:
	movge	%xcc,	%i2,	%g4
loop_1119:
	mulx	%o7,	0x0F3F,	%l6
	sdiv	%i5,	0x1AEC,	%l3
	fbu,a	%fcc2,	loop_1120
	nop 	! 	tl	%xcc,	0x2 changed by convert2hboot
	fbne	%fcc1,	loop_1121
	ldsb	[%l7 + 0x45],	%g3
loop_1120:
	nop
	set	0x38, %l4
	nop	 ! 	prefetcha	[%l7 + %l4] 0x11,	 0x0 ASI use changed by convert2hboot
loop_1121:
	nop 	! 	tle	%icc,	0x6 changed by convert2hboot
	sll	%o2,	%o3,	%g2
	and	%l0,	0x192A,	%i3
	be,pn	%icc,	loop_1122
	movge	%icc,	%l1,	%o1
	lduh	[%l7 + 0x1A],	%o5
	fmovsvs	%xcc,	%f5,	%f6
loop_1122:
	addcc	%o6,	%i6,	%g7
	wr	%g0,	0x89,	%asi
	nop 	! 	sir	0x023D changed by convert2hboot
	movvc	%icc,	%i1,	%o4
	fmovsa	%xcc,	%f21,	%f24
	or	%l5,	%i4,	%o0
	fbne	%fcc2,	loop_1123
	fbn,a	%fcc0,	loop_1124
	movrgz	%i0,	%l2,	%l4
	fpadd32s	%f13,	%f17,	%f10
loop_1123:
	udivcc	%g5,	0x0426,	%i2
loop_1124:
	bvs,pn	%icc,	loop_1125
	sdivx	%g6,	0x14BE,	%g4
	fmovdpos	%icc,	%f24,	%f15
	bg,a,pn	%icc,	loop_1126
loop_1125:
	edge32ln	%o7,	%l6,	%i5
	nop 	! 	taddcc	%l3,	%i7,	%g3 changed by convert2hboot
	srlx	%o2,	0x05,	%o3
loop_1126:
	movvs	%icc,	%l0,	%g2
	lduw	[%l7 + 0x14],	%i3
	movg	%icc,	%o1,	%o5
	fmovdvc	%icc,	%f15,	%f30
	movg	%icc,	%o6,	%l1
	sra	%i6,	%g7,	%g1
	popc	%o4,	%l5
	movvc	%xcc,	%i1,	%o0
	nop 	! 	tg	%icc,	0x3 changed by convert2hboot
	ba,a	%xcc,	loop_1127
	std	%f18,	[%l7 + 0x48]
	fnot1s	%f30,	%f8
	ldsh	[%l7 + 0x70],	%i0
loop_1127:
	nop
	wr	%g0,	0x89,	%asi
	bcc,pt	%xcc,	loop_1128
	fbge,a	%fcc1,	loop_1129
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	movpos	%xcc,	%l4,	%g5
loop_1128:
	swap	[%l7 + 0x64],	%i2
loop_1129:
	movrlz	%g6,	%g4,	%o7
	array32	%l2,	%l6,	%i5
	fone	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x20, %i3
	nop	 ! 	swapa	[%l7 + %i3] 0x88,	%i7 ASI use changed by convert2hboot
	subccc	%l3,	0x171C,	%o2
	nop 	! 	tsubcc	%g3,	0x13A5,	%l0 changed by convert2hboot
	smul	%o3,	%g2,	%o1
	fcmpgt32	%f14,	%f14,	%i3
	sll	%o6,	%l1,	%i6
	umulcc	%o5,	%g7,	%o4
	std	%f0,	[%l7 + 0x30]
	fcmpeq16	%f12,	%f6,	%l5
	fmovdleu	%xcc,	%f18,	%f16
	fbug	%fcc3,	loop_1130
	sra	%i1,	%o0,	%g1
	nop 	! 	tn	%xcc,	0x7 changed by convert2hboot
	fmovsn	%icc,	%f9,	%f5
loop_1130:
	brz,a	%i0,	loop_1131
	sdiv	%i4,	0x1E31,	%l4
	fabsd	%f22,	%f22
	set	0x28, %i7
	nop	 ! 	prefetcha	[%l7 + %i7] 0x04,	 0x3 ASI use changed by convert2hboot
loop_1131:
	nop 	! 	tgu	%icc,	0x1 changed by convert2hboot
	edge32	%i2,	%g4,	%o7
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	movcc	%xcc,	%g6,	%l6
	movvc	%xcc,	%l2,	%i5
	edge16l	%l3,	%o2,	%g3
	nop 	! 	tg	%xcc,	0x0 changed by convert2hboot
	alignaddrl	%l0,	%i7,	%o3
	edge32l	%o1,	%g2,	%o6
	fpsub32	%f14,	%f0,	%f14
	bne,a,pn	%xcc,	loop_1132
	ldsw	[%l7 + 0x5C],	%i3
	fmovsn	%icc,	%f31,	%f19
	membar	0x25
loop_1132:
	fba	%fcc0,	loop_1133
	udiv	%i6,	0x1C16,	%o5
	fmovdcs	%xcc,	%f6,	%f24
	fsrc1	%f0,	%f26
loop_1133:
	movle	%icc,	%g7,	%l1
	nop 	! 	taddcctv	%o4,	%i1,	%o0 changed by convert2hboot
	fbe,a	%fcc0,	loop_1134
	and	%g1,	0x17AF,	%i0
	fxnor	%f24,	%f0,	%f4
	movvc	%icc,	%l5,	%i4
loop_1134:
	fbug	%fcc2,	loop_1135
	movge	%xcc,	%g5,	%i2
	nop 	! 	tcc	%icc,	0x4 changed by convert2hboot
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
loop_1135:
	std	%l4,	[%l7 + 0x70]
	bcs,a	%xcc,	loop_1136
	movrgez	%o7,	0x370,	%g6
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	movrlez	%g4,	%l6,	%l2
loop_1136:
	nop
	set	0x5C, %i4
	lduh	[%l7 + %i4],	%i5
	nop 	! 	sir	0x1299 changed by convert2hboot
	andcc	%l3,	0x1ADD,	%g3
	fmovdne	%icc,	%f20,	%f24
	stx	%l0,	[%l7 + 0x58]
	and	%i7,	0x1777,	%o3
	set	0x48, %o6
	nop	 ! 	stda	%o0,	[%l7 + %o6] 0x2f ASI use changed by convert2hboot
	membar	#Sync
	nop 	! 	taddcctv	%o2,	%g2,	%i3 changed by convert2hboot
	bne,pn	%xcc,	loop_1137
	nop 	! 	tgu	%xcc,	0x6 changed by convert2hboot
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
	movre	%o6,	%i6,	%o5
loop_1137:
	edge16	%g7,	%o4,	%i1
	fxors	%f21,	%f30,	%f1
	nop 	! 	tg	%xcc,	0x4 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l1,	%o0,	%i0
	nop
	set	0x30, %i2
	std	%l4,	[%l7 + %i2]
	orcc	%i4,	0x0287,	%g1
	edge8n	%g5,	%l4,	%i2
	set	0x0A, %i1
	nop	 ! 	ldsha	[%l7 + %i1] 0x81,	%g6 ASI use changed by convert2hboot
	bl	%xcc,	loop_1138
	nop 	! 	taddcctv	%g4,	0x07F0,	%l6 changed by convert2hboot
	mulx	%o7,	0x03C9,	%l2
	sra	%i5,	%l3,	%l0
loop_1138:
	ldsb	[%l7 + 0x32],	%i7
	wr	%g0,	0x89,	%asi
	sta	%f17,	[%l7 + 0x38] %asi
	movvc	%xcc,	%g3,	%o1
	nop 	! 	tcs	%xcc,	0x3 changed by convert2hboot
	mulx	%o3,	0x1FB5,	%o2
	fmovsne	%xcc,	%f29,	%f20
	xnorcc	%g2,	0x1F70,	%o6
	or	%i3,	0x0AA2,	%o5
	movpos	%icc,	%i6,	%g7
	fbul	%fcc2,	loop_1139
	udivcc	%o4,	0x11AA,	%l1
	alignaddr	%o0,	%i0,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1139:
	fbe,a	%fcc2,	loop_1140
	mova	%xcc,	%i4,	%i1
	nop 	! 	tne	%icc,	0x5 changed by convert2hboot
	fmovse	%xcc,	%f20,	%f0
loop_1140:
	movgu	%xcc,	%g1,	%l4
	bg,pt	%xcc,	loop_1141
	andncc	%i2,	%g6,	%g4
	add	%g5,	0x0BAA,	%l6
	orn	%o7,	0x09CD,	%l2
loop_1141:
	edge8	%i5,	%l0,	%i7
	bg,pn	%xcc,	loop_1142
	edge32	%l3,	%g3,	%o3
	addc	%o2,	%o1,	%o6
	sllx	%i3,	%o5,	%i6
loop_1142:
	fbuge,a	%fcc0,	loop_1143
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	pdist	%f22,	%f8,	%f10
	movcs	%icc,	%g7,	%o4
loop_1143:
	orcc	%l1,	%g2,	%i0
	add	%l7,	0x34,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%l5
	nop	 ! 	casa	[%l6] 0x19,	%l5,	%o0 ASI use changed by convert2hboot
	fmovspos	%icc,	%f2,	%f8
	fblg	%fcc1,	loop_1144
	sll	%i4,	0x0A,	%i1
	fpadd16	%f10,	%f8,	%f6
	edge8l	%l4,	%i2,	%g1
loop_1144:
	bvc,a	%xcc,	loop_1145
	movcc	%xcc,	%g4,	%g5
	smul	%l6,	%o7,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1145:
	alignaddrl	%i5,	%l0,	%i7
	array16	%l2,	%g3,	%l3
	xor	%o2,	0x0AB8,	%o1
	smul	%o6,	0x029E,	%i3
	and	%o3,	0x18EE,	%i6
	sll	%g7,	%o4,	%l1
	fbuge,a	%fcc3,	loop_1146
	ldsb	[%l7 + 0x4D],	%o5
	call	loop_1147
	andn	%i0,	%l5,	%o0
loop_1146:
	movgu	%icc,	%i4,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1147:
	fmovrslez	%i1,	%f14,	%f26
	ldsw	[%l7 + 0x14],	%i2
	fmovspos	%xcc,	%f30,	%f4
	ldub	[%l7 + 0x20],	%l4
	movrlez	%g1,	%g4,	%g5
	add	%l6,	0x083A,	%o7
	fmovrde	%i5,	%f24,	%f22
	edge8l	%l0,	%i7,	%l2
	edge32n	%g6,	%l3,	%g3
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
	andcc	%o1,	%o2,	%o6
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	sllx	%o3,	0x1E,	%i6
	bleu,a	%icc,	loop_1148
	smul	%g7,	%o4,	%i3
	fmovrse	%l1,	%f13,	%f14
	wr	%g0,	0x19,	%asi
loop_1148:
	xnorcc	%l5,	0x107C,	%o0
	mulscc	%i0,	0x10EA,	%g2
	nop 	! 	taddcctv	%i1,	0x023A,	%i4 changed by convert2hboot
	bne	%xcc,	loop_1149
	movrlez	%i2,	0x005,	%g1
	addc	%l4,	%g4,	%l6
	orncc	%o7,	%g5,	%i5
loop_1149:
	sethi	0x0F09,	%i7
	sra	%l2,	%l0,	%g6
	nop 	! 	tsubcc	%l3,	%o1,	%g3 changed by convert2hboot
	wr	%g0,	0xe3,	%asi
	membar	#Sync
	umul	%o3,	%o2,	%g7
	movrlez	%o4,	%i3,	%l1
	movrne	%o5,	%l5,	%o0
	and	%i0,	0x0B8A,	%i6
	ldx	[%l7 + 0x60],	%i1
	mulscc	%i4,	%i2,	%g1
	movpos	%icc,	%l4,	%g2
	movleu	%icc,	%l6,	%o7
	edge16ln	%g4,	%i5,	%i7
	brlz	%g5,	loop_1150
	fcmple32	%f12,	%f10,	%l2
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	movne	%xcc,	%l0,	%g6
loop_1150:
	fsrc2s	%f16,	%f20
	fbule	%fcc2,	loop_1151
	fandnot1s	%f24,	%f1,	%f2
	set	0x72, %i6
	nop	 ! 	lduha	[%l7 + %i6] 0x88,	%l3 ASI use changed by convert2hboot
loop_1151:
	movrne	%o1,	0x3D6,	%g3
	subc	%o6,	%o2,	%g7
	array8	%o3,	%o4,	%i3
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	movvc	%icc,	%l1,	%o5
	edge8l	%o0,	%i0,	%i6
	orn	%i1,	0x005B,	%l5
	set	0x47, %o3
	nop	 ! 	stba	%i4,	[%l7 + %o3] 0x10 ASI use changed by convert2hboot
	sdivcc	%i2,	0x0716,	%g1
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
	srlx	%g2,	0x0A,	%l4
	popc	%l6,	%g4
	orncc	%o7,	0x0E09,	%i7
	fone	%f26
	mulscc	%i5,	0x0225,	%l2
	xnor	%g5,	%g6,	%l3
	wr	%g0,	0x22,	%asi
	membar	#Sync
	fmovdle	%xcc,	%f16,	%f3
	bpos,a	loop_1152
	fpack16	%f16,	%f17
	fmovde	%icc,	%f7,	%f26
	movrgez	%g3,	%o1,	%o2
loop_1152:
	fone	%f8
	fnot1s	%f8,	%f26
	edge32n	%o6,	%g7,	%o4
	std	%f20,	[%l7 + 0x08]
	brgz	%i3,	loop_1153
	fnand	%f2,	%f10,	%f14
	fmovda	%icc,	%f31,	%f31
	udivcc	%o3,	0x0359,	%o5
loop_1153:
	edge8ln	%l1,	%o0,	%i6
	ba,a	%icc,	loop_1154
	fzeros	%f21
	sub	%i1,	%i0,	%i4
	movle	%xcc,	%i2,	%l5
loop_1154:
	nop
	wr	%g0,	0x11,	%asi
	fmovrdlez	%l4,	%f16,	%f22
	fblg,a	%fcc2,	loop_1155
	bl,pt	%xcc,	loop_1156
	ld	[%l7 + 0x74],	%f20
	fmovrde	%l6,	%f12,	%f10
loop_1155:
	udivx	%g1,	0x1098,	%g4
loop_1156:
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
	movrlez	%o7,	0x186,	%i5
	set	0x55, %l1
	nop	 ! 	ldsba	[%l7 + %l1] 0x11,	%i7 ASI use changed by convert2hboot
	nop 	! 	sir	0x0732 changed by convert2hboot
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	udivcc	%l2,	0x0272,	%g5
	nop
	set	0x39, %i5
	ldstub	[%l7 + %i5],	%l3
	fcmple32	%f10,	%f8,	%l0
	edge32n	%g3,	%g6,	%o2
	udivcc	%o1,	0x09EB,	%g7
	fsrc1	%f24,	%f10
	add	%o6,	0x0DD1,	%i3
	set	0x70, %g3
	nop	 ! 	ldda	[%l7 + %g3] 0xea,	%o4 ASI use changed by convert2hboot
	movrlez	%o3,	%o5,	%l1
	movrne	%i6,	%o0,	%i1
	set	0x08, %o5
	nop	 ! 	prefetcha	[%l7 + %o5] 0x19,	 0x0 ASI use changed by convert2hboot
	orncc	%i2,	%i0,	%g2
	movneg	%icc,	%l4,	%l6
	swap	[%l7 + 0x44],	%l5
	movg	%xcc,	%g1,	%g4
	udivx	%o7,	0x149E,	%i7
	fbge	%fcc2,	loop_1157
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	fbule,a	%fcc1,	loop_1158
	fbn,a	%fcc2,	loop_1159
loop_1157:
	srl	%l2,	0x16,	%i5
	wr	%g0,	0x10,	%asi
loop_1158:
	fmovrdlz	%l0,	%f28,	%f0
loop_1159:
	edge16n	%l3,	%g3,	%o2
	bg,pt	%icc,	loop_1160
	lduh	[%l7 + 0x44],	%o1
	movrgez	%g6,	0x0A4,	%g7
	addcc	%i3,	%o6,	%o4
loop_1160:
	lduh	[%l7 + 0x4E],	%o5
	movneg	%xcc,	%o3,	%l1
	popc	0x188C,	%i6
	lduh	[%l7 + 0x76],	%i1
	movpos	%xcc,	%i4,	%i2
	fbule	%fcc2,	loop_1161
	popc	%i0,	%g2
	movvc	%icc,	%l4,	%l6
	movne	%xcc,	%o0,	%l5
loop_1161:
	smul	%g1,	%o7,	%g4
	fxors	%f5,	%f23,	%f30
	ba	loop_1162
	lduh	[%l7 + 0x18],	%i7
	orn	%l2,	%g5,	%l0
	wr	%g0,	0x89,	%asi
loop_1162:
	fabss	%f26,	%f30
	edge8ln	%l3,	%o2,	%o1
	xnorcc	%g3,	0x062F,	%g6
	fmovda	%xcc,	%f0,	%f24
	set	0x4B, %o7
	nop	 ! 	ldstuba	[%l7 + %o7] 0x11,	%g7 ASI use changed by convert2hboot
	lduw	[%l7 + 0x5C],	%i3
	movn	%xcc,	%o4,	%o6
	add	%o3,	0x117E,	%l1
	xnorcc	%i6,	0x0133,	%i1
	nop 	! 	tsubcctv	%i4,	0x16D7,	%o5 changed by convert2hboot
	fmovsl	%icc,	%f7,	%f24
	xnor	%i2,	%i0,	%g2
	addc	%l6,	0x1366,	%l4
	addccc	%l5,	%o0,	%o7
	movge	%icc,	%g4,	%i7
	fbue,a	%fcc3,	loop_1163
	movvc	%icc,	%l2,	%g1
	nop 	! 	tsubcctv	%l0,	%g5,	%l3 changed by convert2hboot
	movcc	%icc,	%o2,	%i5
loop_1163:
	edge8n	%o1,	%g6,	%g7
	fcmped	%fcc1,	%f0,	%f10
	fbge,a	%fcc0,	loop_1164
	array8	%g3,	%i3,	%o4
	lduh	[%l7 + 0x3E],	%o3
	siam	0x6
loop_1164:
	fbue,a	%fcc0,	loop_1165
	edge32ln	%o6,	%l1,	%i6
	lduh	[%l7 + 0x7E],	%i4
	fbg	%fcc2,	loop_1166
loop_1165:
	addcc	%o5,	0x0A74,	%i2
	bleu,a,pn	%icc,	loop_1167
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
loop_1166:
	nop 	! 	taddcc	%i0,	0x1074,	%g2 changed by convert2hboot
	ba,a,pt	%xcc,	loop_1168
loop_1167:
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
	edge32l	%l6,	%i1,	%l4
	set	0x48, %l5
	nop	 ! 	swapa	[%l7 + %l5] 0x80,	%l5 ASI use changed by convert2hboot
loop_1168:
	nop 	! 	taddcc	%o7,	%g4,	%i7 changed by convert2hboot
	for	%f16,	%f6,	%f16
	fpadd32	%f28,	%f4,	%f26
	fpmerge	%f23,	%f22,	%f12
	or	%o0,	0x108B,	%g1
	edge16n	%l0,	%g5,	%l2
	fmovrse	%o2,	%f31,	%f17
	orn	%i5,	0x0372,	%l3
	orcc	%o1,	%g7,	%g3
	nop 	! 	tvs	%xcc,	0x7 changed by convert2hboot
	udivcc	%g6,	0x04AC,	%o4
	smul	%o3,	0x0B3A,	%o6
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
	fabsd	%f26,	%f20
	fbuge,a	%fcc3,	loop_1169
	and	%i3,	0x13E2,	%l1
	movvs	%xcc,	%i4,	%o5
	sll	%i2,	%i0,	%g2
loop_1169:
	movne	%xcc,	%l6,	%i6
	fmovsa	%xcc,	%f4,	%f10
	movcs	%xcc,	%i1,	%l4
	smul	%o7,	%g4,	%i7
	orn	%o0,	0x1653,	%l5
	set	0x54, %g7
	sta	%f18,	[%l7 + %g7] 0x81
	wr	%g0,	0x11,	%asi
	srlx	%g5,	%l2,	%o2
	stb	%l0,	[%l7 + 0x6C]
	set	0x7D, %g6
	nop	 ! 	ldsba	[%l7 + %g6] 0x81,	%i5 ASI use changed by convert2hboot
	nop
	set	0x10, %o2
	ldsw	[%l7 + %o2],	%o1
	set	0x6C, %o4
	lda	[%l7 + %o4] 0x18,	%f25
	movre	%l3,	%g7,	%g6
	fbo	%fcc2,	loop_1170
	fcmpeq32	%f2,	%f0,	%o4
	set	0x30, %g1
	nop	 ! 	stba	%o3,	[%l7 + %g1] 0x2a ASI use changed by convert2hboot
	membar	#Sync
loop_1170:
	orcc	%o6,	0x1C7D,	%g3
	xnor	%l1,	%i3,	%i4
	array8	%o5,	%i2,	%i0
	fmovdcc	%xcc,	%f26,	%f9
	fcmpeq32	%f0,	%f28,	%l6
	movle	%xcc,	%i6,	%i1
	nop 	! 	tsubcc	%g2,	0x1376,	%l4 changed by convert2hboot
	movleu	%icc,	%o7,	%i7
	array8	%o0,	%g4,	%l5
	movpos	%icc,	%g1,	%l2
	ldsb	[%l7 + 0x4B],	%g5
	edge8	%o2,	%l0,	%o1
	wr	%g0,	0x11,	%asi
	sta	%f8,	[%l7 + 0x74] %asi
	bne	loop_1171
	fbg,a	%fcc2,	loop_1172
	nop 	! 	tpos	%xcc,	0x1 changed by convert2hboot
	fxor	%f22,	%f2,	%f26
loop_1171:
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
loop_1172:
	movrne	%i5,	%g7,	%g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l3
	nop	 ! 	casa	[%l6] 0x04,	%l3,	%o4 ASI use changed by convert2hboot
	fba,a	%fcc3,	loop_1173
	fmovdg	%icc,	%f19,	%f1
	addccc	%o6,	0x1593,	%g3
	fxors	%f8,	%f2,	%f26
loop_1173:
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	fmovsg	%xcc,	%f17,	%f3
	edge8l	%o3,	%l1,	%i4
	movne	%xcc,	%i3,	%o5
	brnz	%i0,	loop_1174
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	edge16l	%i2,	%i6,	%i1
	edge32n	%l6,	%l4,	%o7
loop_1174:
	ldsb	[%l7 + 0x4F],	%i7
	orncc	%g2,	%g4,	%o0
	ldub	[%l7 + 0x23],	%l5
	fble	%fcc0,	loop_1175
	fmovsleu	%xcc,	%f19,	%f15
	fbo	%fcc3,	loop_1176
	movrne	%l2,	0x3D4,	%g1
loop_1175:
	alignaddr	%g5,	%o2,	%o1
	siam	0x2
loop_1176:
	mulx	%l0,	0x0FD0,	%i5
	edge32n	%g6,	%l3,	%o4
	fmul8x16au	%f2,	%f12,	%f18
	set	0x68, %g5
	nop	 ! 	ldsha	[%l7 + %g5] 0x19,	%g7 ASI use changed by convert2hboot
	fnot2	%f16,	%f24
	fmovde	%icc,	%f28,	%f21
	stb	%g3,	[%l7 + 0x72]
	edge8n	%o3,	%l1,	%i4
	swap	[%l7 + 0x64],	%i3
	array32	%o6,	%o5,	%i2
	movneg	%xcc,	%i0,	%i6
	sethi	0x1633,	%i1
	xor	%l6,	0x16A3,	%l4
	srlx	%i7,	0x0A,	%g2
	fornot1s	%f9,	%f14,	%f1
	brlz,a	%o7,	loop_1177
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	array16	%o0,	%g4,	%l2
loop_1177:
	andncc	%l5,	%g1,	%g5
	wr	%g0,	0x0c,	%asi
	sta	%f12,	[%l7 + 0x68] %asi
	udivx	%o1,	0x14F1,	%l0
	bl,pn	%xcc,	loop_1178
	nop 	! 	tcc	%icc,	0x4 changed by convert2hboot
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
	call	loop_1179
loop_1178:
	umulcc	%o2,	0x137D,	%g6
	fbule	%fcc1,	loop_1180
	fcmpne32	%f6,	%f10,	%l3
loop_1179:
	fpackfix	%f26,	%f27
	smulcc	%i5,	0x062F,	%g7
loop_1180:
	andncc	%g3,	%o4,	%o3
	edge32ln	%l1,	%i3,	%o6
	nop 	! 	tl	%xcc,	0x2 changed by convert2hboot
	set	0x50, %o1
	nop	 ! 	ldda	[%l7 + %o1] 0x15,	%i4 ASI use changed by convert2hboot
	wr	%g0,	0x88,	%asi
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	bleu	loop_1181
	sdivcc	%i2,	0x0CE2,	%i6
	addccc	%i1,	0x0CB1,	%l6
	smul	%i0,	%i7,	%l4
loop_1181:
	membar	0x64
	smul	%g2,	%o0,	%o7
	andcc	%g4,	%l5,	%l2
	fmovsne	%icc,	%f28,	%f14
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	xor	%g5,	0x0C1A,	%o1
	xnorcc	%l0,	%g1,	%o2
	stx	%l3,	[%l7 + 0x50]
	ble	loop_1182
	sdivx	%i5,	0x1D69,	%g7
	subccc	%g6,	0x0798,	%o4
	sllx	%o3,	%g3,	%i3
loop_1182:
	edge8l	%l1,	%o6,	%i4
	edge8ln	%o5,	%i2,	%i1
	edge16ln	%l6,	%i0,	%i6
	fmovdgu	%icc,	%f21,	%f29
	lduw	[%l7 + 0x24],	%i7
	add	%g2,	0x1620,	%o0
	edge16ln	%l4,	%o7,	%l5
	wr	%g0,	0x19,	%asi
	sta	%f19,	[%l7 + 0x1C] %asi
	fmovsa	%icc,	%f12,	%f14
	nop 	! 	taddcc	%l2,	%g5,	%o1 changed by convert2hboot
	orcc	%g4,	0x0D70,	%l0
	fandnot2s	%f4,	%f20,	%f5
	array8	%g1,	%o2,	%i5
	fpmerge	%f30,	%f27,	%f8
	bcc,a	loop_1183
	srl	%l3,	0x09,	%g7
	fbne,a	%fcc0,	loop_1184
	addc	%o4,	0x06C8,	%g6
loop_1183:
	bge,a,pn	%xcc,	loop_1185
	movg	%xcc,	%o3,	%g3
loop_1184:
	movvs	%xcc,	%l1,	%i3
	fmovrdlez	%i4,	%f10,	%f10
loop_1185:
	addccc	%o5,	%o6,	%i2
	fxors	%f0,	%f29,	%f4
	edge16	%i1,	%l6,	%i6
	set	0x30, %l2
	nop	 ! 	stwa	%i7,	[%l7 + %l2] 0x18 ASI use changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	te	%icc,	0x0 changed by convert2hboot
	edge8l	%i0,	%o0,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x74],	%o7
	edge8ln	%l5,	%l2,	%g5
	movn	%icc,	%l4,	%g4
	brlz,a	%o1,	loop_1186
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	fmovda	%xcc,	%f18,	%f12
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
loop_1186:
	fpsub16s	%f31,	%f14,	%f23
	movge	%icc,	%l0,	%o2
	nop 	! 	tle	%icc,	0x2 changed by convert2hboot
	addcc	%i5,	0x10E5,	%g1
	addccc	%g7,	0x0F83,	%l3
	fmovspos	%icc,	%f16,	%f3
	fandnot2s	%f9,	%f6,	%f18
	edge16ln	%o4,	%o3,	%g3
	sdivx	%l1,	0x1662,	%i3
	movg	%icc,	%g6,	%i4
	movl	%xcc,	%o6,	%o5
	stw	%i2,	[%l7 + 0x30]
	andncc	%l6,	%i1,	%i7
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	movgu	%xcc,	%i6,	%i0
	edge32ln	%o0,	%o7,	%g2
	bneg	%icc,	loop_1187
	movge	%xcc,	%l2,	%g5
	edge8ln	%l5,	%l4,	%o1
	bvs,a	%icc,	loop_1188
loop_1187:
	umulcc	%g4,	%o2,	%i5
	array32	%l0,	%g1,	%g7
	edge8	%l3,	%o4,	%o3
loop_1188:
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	movcs	%xcc,	%l1,	%i3
	and	%g3,	0x0ACC,	%g6
	movrgz	%o6,	%i4,	%o5
	edge32n	%l6,	%i2,	%i7
	fmovdge	%xcc,	%f3,	%f2
	wr	%g0,	0x04,	%asi
	sethi	0x1258,	%i1
	sll	%o0,	0x18,	%o7
	udivx	%i0,	0x12D4,	%l2
	brz	%g2,	loop_1189
	siam	0x6
	fbule	%fcc3,	loop_1190
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
loop_1189:
	udivx	%l5,	0x10E7,	%l4
	alignaddr	%o1,	%g5,	%g4
loop_1190:
	addc	%i5,	%l0,	%g1
	fbue,a	%fcc0,	loop_1191
	fmovsle	%icc,	%f0,	%f18
	fnand	%f18,	%f28,	%f20
	ld	[%l7 + 0x50],	%f16
loop_1191:
	movneg	%xcc,	%o2,	%l3
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	movvs	%icc,	%g7,	%o4
	movne	%xcc,	%l1,	%i3
	bneg,pt	%icc,	loop_1192
	bgu	%xcc,	loop_1193
	movrlez	%g3,	%g6,	%o6
	mulx	%o3,	%o5,	%i4
loop_1192:
	nop
	wr	%g0,	0x88,	%asi
loop_1193:
	array32	%i2,	%i7,	%l6
	nop 	! 	sir	0x036E changed by convert2hboot
	edge16n	%i1,	%o0,	%o7
	addccc	%i6,	0x0E49,	%l2
	orcc	%g2,	%i0,	%l5
	brlez,a	%l4,	loop_1194
	addcc	%g5,	%o1,	%g4
	srlx	%i5,	%l0,	%g1
	movpos	%icc,	%o2,	%l3
loop_1194:
	fbne	%fcc1,	loop_1195
	edge32l	%o4,	%l1,	%i3
	bge,a	%icc,	loop_1196
	fmovsgu	%icc,	%f16,	%f6
loop_1195:
	fones	%f21
	fmul8ulx16	%f2,	%f6,	%f26
loop_1196:
	movgu	%icc,	%g3,	%g6
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tvc	%icc,	0x5 changed by convert2hboot
	bg,a,pn	%icc,	loop_1197
	fbul	%fcc3,	loop_1198
	edge16n	%g7,	%o3,	%o5
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
loop_1197:
	movrne	%i4,	%i2,	%i7
loop_1198:
	smul	%l6,	%o6,	%o0
	edge8n	%o7,	%i6,	%l2
	fbug	%fcc0,	loop_1199
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	fmovsvc	%xcc,	%f6,	%f6
	popc	0x0497,	%i1
loop_1199:
	edge32l	%i0,	%l5,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g5,	%o1,	%g4
	fbul	%fcc0,	loop_1200
	addccc	%g2,	0x010C,	%i5
	fbge,a	%fcc1,	loop_1201
	fands	%f31,	%f17,	%f1
loop_1200:
	mulx	%l0,	%g1,	%l3
	addccc	%o4,	%o2,	%i3
loop_1201:
	fmul8x16al	%f3,	%f2,	%f2
	fble	%fcc1,	loop_1202
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	movre	%g3,	0x036,	%l1
loop_1202:
	brnz,a	%g7,	loop_1203
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	nop
	setx	loop_1204,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	srlx	%o3,	%g6,	%o5
loop_1203:
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
loop_1204:
	fcmpd	%fcc0,	%f26,	%f0
	sdivx	%i4,	0x11B5,	%i2
	edge32	%l6,	%i7,	%o0
	bn	%icc,	loop_1205
	mulscc	%o7,	0x1A25,	%o6
	fcmpeq32	%f28,	%f8,	%l2
	fones	%f21
loop_1205:
	srl	%i1,	%i0,	%l5
	fmul8x16au	%f24,	%f14,	%f8
	sll	%l4,	%g5,	%o1
	movneg	%xcc,	%g4,	%g2
	subccc	%i6,	0x151F,	%l0
	edge32l	%g1,	%l3,	%i5
	sdivcc	%o4,	0x02A9,	%i3
	fbne	%fcc1,	loop_1206
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	alignaddrl	%g3,	%o2,	%l1
	add	%g7,	0x0571,	%o3
loop_1206:
	nop
	wr	%g0,	0x04,	%asi
	sta	%f18,	[%l7 + 0x70] %asi
	fbe,a	%fcc2,	loop_1207
	fmul8ulx16	%f28,	%f22,	%f2
	edge32ln	%g6,	%o5,	%i4
	brnz,a	%i2,	loop_1208
loop_1207:
	fsrc1	%f14,	%f14
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	edge8	%i7,	%o0,	%l6
loop_1208:
	sllx	%o6,	0x06,	%o7
	array16	%l2,	%i1,	%l5
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	srl	%l4,	0x0E,	%i0
	sth	%g5,	[%l7 + 0x6C]
	fnegs	%f31,	%f2
	fbge	%fcc3,	loop_1209
	udivcc	%g4,	0x0288,	%g2
	brgez,a	%i6,	loop_1210
	edge32ln	%l0,	%g1,	%l3
loop_1209:
	fpack16	%f18,	%f4
	wr	%g0,	0x11,	%asi
loop_1210:
	addcc	%o4,	0x0D51,	%i3
	bg,pt	%icc,	loop_1211
	sub	%g3,	0x0781,	%o1
	fbge,a	%fcc0,	loop_1212
	fbu	%fcc2,	loop_1213
loop_1211:
	membar	0x4C
	sllx	%o2,	0x07,	%l1
loop_1212:
	movleu	%xcc,	%g7,	%g6
loop_1213:
	for	%f8,	%f0,	%f10
	srax	%o5,	0x0B,	%o3
	fand	%f4,	%f20,	%f20
	umulcc	%i4,	%i7,	%i2
	membar	0x14
	edge8ln	%l6,	%o0,	%o7
	movpos	%icc,	%l2,	%i1
	fble	%fcc2,	loop_1214
	fmovsl	%icc,	%f18,	%f21
	edge16ln	%o6,	%l5,	%i0
	movrgz	%g5,	0x3FC,	%g4
loop_1214:
	mulscc	%l4,	0x0251,	%g2
	orn	%l0,	0x07AF,	%g1
	mova	%icc,	%l3,	%i5
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
	siam	0x4
	alignaddrl	%i6,	%o4,	%i3
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	fandnot1s	%f1,	%f19,	%f24
	edge8l	%o1,	%g3,	%o2
	faligndata	%f2,	%f24,	%f24
	fnor	%f0,	%f30,	%f2
	fmovda	%xcc,	%f22,	%f11
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%l1,	[%l7 + 0x0C]
	lduw	[%l7 + 0x6C],	%g7
	set	0x7C, %o0
	lda	[%l7 + %o0] 0x10,	%f0
	nop 	! 	tsubcctv	%g6,	%o3,	%o5 changed by convert2hboot
	ldsh	[%l7 + 0x16],	%i4
	array32	%i2,	%l6,	%i7
	fcmpgt32	%f16,	%f16,	%o7
	fabss	%f12,	%f23
	fblg	%fcc0,	loop_1215
	movrlz	%l2,	%i1,	%o6
	fbul,a	%fcc0,	loop_1216
	umulcc	%l5,	0x1C82,	%i0
loop_1215:
	fmovsneg	%xcc,	%f21,	%f26
	subccc	%o0,	%g4,	%g5
loop_1216:
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
	ld	[%l7 + 0x4C],	%f11
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	subccc	%g2,	0x1BE8,	%l4
	prefetch	[%l7 + 0x1C],	 0x3
	lduh	[%l7 + 0x58],	%g1
	bvc,a,pn	%icc,	loop_1217
	or	%l3,	0x1364,	%i5
	srl	%l0,	%o4,	%i3
	movne	%icc,	%i6,	%o1
loop_1217:
	nop 	! 	tsubcctv	%g3,	%l1,	%o2 changed by convert2hboot
	nop 	! 	tne	%icc,	0x1 changed by convert2hboot
	fmovda	%icc,	%f12,	%f11
	fbul	%fcc1,	loop_1218
	movcc	%xcc,	%g6,	%o3
	andn	%g7,	%i4,	%o5
	fmovdpos	%icc,	%f28,	%f11
loop_1218:
	movre	%l6,	0x2C3,	%i2
	fmovsn	%xcc,	%f10,	%f29
	nop
	setx	loop_1219,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	lduh	[%l7 + 0x30],	%i7
	addcc	%o7,	0x1759,	%l2
	bleu,pt	%xcc,	loop_1220
loop_1219:
	fones	%f3
	fmovdg	%xcc,	%f18,	%f7
	srlx	%o6,	0x0A,	%l5
loop_1220:
	array32	%i0,	%i1,	%o0
	movl	%xcc,	%g4,	%g5
	std	%f0,	[%l7 + 0x40]
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
	fexpand	%f23,	%f0
	st	%f17,	[%l7 + 0x38]
	andn	%l4,	0x18BB,	%g1
	or	%g2,	%l3,	%l0
	fmovdcc	%icc,	%f15,	%f3
	srlx	%o4,	%i5,	%i6
	fmovrsgz	%i3,	%f23,	%f12
	xnorcc	%g3,	0x0530,	%l1
	fbul	%fcc0,	loop_1221
	fnand	%f26,	%f2,	%f28
	ldx	[%l7 + 0x58],	%o1
	addc	%o2,	%g6,	%g7
loop_1221:
	movge	%xcc,	%o3,	%o5
	smul	%l6,	0x0334,	%i2
	sth	%i4,	[%l7 + 0x3E]
	edge8	%i7,	%l2,	%o7
	fmovsg	%xcc,	%f20,	%f30
	movleu	%xcc,	%o6,	%l5
	fornot1s	%f30,	%f31,	%f29
	movrgez	%i0,	0x34E,	%i1
	array16	%o0,	%g4,	%g5
	fpadd16	%f18,	%f22,	%f10
	movgu	%xcc,	%l4,	%g1
	brlz,a	%g2,	loop_1222
	bvs,pn	%icc,	loop_1223
	fbl	%fcc1,	loop_1224
	bvc,a,pt	%icc,	loop_1225
loop_1222:
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
loop_1223:
	fmovdn	%xcc,	%f25,	%f26
loop_1224:
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
loop_1225:
	sth	%l3,	[%l7 + 0x36]
	sll	%l0,	%o4,	%i6
	edge16n	%i5,	%i3,	%g3
	sth	%o1,	[%l7 + 0x18]
	edge32n	%l1,	%o2,	%g6
	movl	%icc,	%g7,	%o5
	set	0x6B, %l3
	nop	 ! 	ldstuba	[%l7 + %l3] 0x11,	%l6 ASI use changed by convert2hboot
	sdivx	%i2,	0x09FE,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o3,	0x065D,	%l2
	movn	%xcc,	%i7,	%o6
	sll	%o7,	%i0,	%i1
	add	%o0,	%l5,	%g4
	wr	%g0,	0x81,	%asi
	sta	%f22,	[%l7 + 0x7C] %asi
	array32	%l4,	%g5,	%g2
	edge32ln	%l3,	%g1,	%o4
	movcc	%icc,	%i6,	%i5
	movneg	%xcc,	%l0,	%g3
	umul	%i3,	%l1,	%o2
	fxnors	%f13,	%f23,	%f19
	xnorcc	%o1,	0x026C,	%g7
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	stb	%o5,	[%l7 + 0x52]
	subccc	%g6,	0x1D50,	%l6
	fnands	%f5,	%f19,	%f18
	wr	%g0,	0x80,	%asi
	sta	%f24,	[%l7 + 0x14] %asi
	fcmpd	%fcc1,	%f30,	%f8
	prefetch	[%l7 + 0x1C],	 0x3
	alignaddrl	%i2,	%i4,	%o3
	wr	%g0,	0x18,	%asi
	ble	%xcc,	loop_1226
	sllx	%l2,	%o6,	%o7
	sdiv	%i0,	0x1E35,	%i1
	edge32n	%l5,	%g4,	%l4
loop_1226:
	srl	%o0,	%g2,	%g5
	addc	%g1,	0x0635,	%o4
	xnorcc	%l3,	0x10CC,	%i5
	movrgez	%i6,	0x0B6,	%l0
	wr	%g0,	0xe2,	%asi
	fcmple16	%f14,	%f30,	%i3
	nop
	setx	loop_1227,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fabsd	%f24,	%f28
	sth	%o2,	[%l7 + 0x24]
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
loop_1227:
	edge32ln	%l1,	%g7,	%o5
	nop 	! 	taddcctv	%o1,	0x1785,	%l6 changed by convert2hboot
	ldstub	[%l7 + 0x45],	%g6
	subccc	%i2,	0x0A16,	%o3
	siam	0x3
	ldsb	[%l7 + 0x34],	%i7
	fcmpeq16	%f20,	%f28,	%l2
	mova	%icc,	%o6,	%i4
	xnorcc	%i0,	0x10E5,	%o7
	addc	%l5,	0x006B,	%g4
	mulscc	%l4,	%i1,	%o0
	edge16l	%g5,	%g2,	%o4
	ldd	[%l7 + 0x10],	%f22
	movre	%l3,	0x2E9,	%i5
	bvs,a	%icc,	loop_1228
	orcc	%g1,	%i6,	%g3
	movcs	%icc,	%i3,	%o2
	movcc	%xcc,	%l0,	%g7
loop_1228:
	sub	%o5,	%o1,	%l6
	fcmpeq16	%f6,	%f18,	%l1
	alignaddr	%g6,	%o3,	%i7
	srl	%l2,	0x1C,	%o6
	popc	0x098E,	%i4
	fmovrdne	%i2,	%f2,	%f22
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x6C] %asi,	%f19
	bcc,pn	%icc,	loop_1229
	brnz,a	%o7,	loop_1230
	nop 	! 	ta	%xcc,	0x2 changed by convert2hboot
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
loop_1229:
	udivx	%i0,	0x0BC8,	%l5
loop_1230:
	movcc	%xcc,	%l4,	%i1
	std	%o0,	[%l7 + 0x50]
	bgu,pn	%xcc,	loop_1231
	subccc	%g4,	%g5,	%g2
	fmovsa	%icc,	%f25,	%f18
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
loop_1231:
	movrne	%l3,	%i5,	%o4
	brz	%i6,	loop_1232
	alignaddrl	%g3,	%g1,	%i3
	fornot2	%f24,	%f30,	%f4
	nop 	! 	sir	0x02CF changed by convert2hboot
loop_1232:
	edge32l	%l0,	%o2,	%g7
	bg	%icc,	loop_1233
	movrlez	%o1,	%o5,	%l6
	nop
	set	0x7C, %i0
	stb	%g6,	[%l7 + %i0]
	popc	%l1,	%i7
loop_1233:
	fbn,a	%fcc3,	loop_1234
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	movrne	%o3,	%l2,	%o6
	nop 	! 	tsubcctv	%i2,	0x045E,	%i4 changed by convert2hboot
loop_1234:
	addcc	%i0,	%l5,	%o7
	movvc	%xcc,	%i1,	%o0
	nop
	setx loop_1235, %l0, %l1
	jmpl %l1, %l4
	bn	loop_1236
	sllx	%g4,	0x02,	%g2
	nop 	! 	te	%xcc,	0x7 changed by convert2hboot
loop_1235:
	fcmpgt16	%f4,	%f26,	%l3
loop_1236:
	andncc	%g5,	%o4,	%i5
	movleu	%icc,	%i6,	%g3
	umulcc	%i3,	%l0,	%g1
	alignaddr	%o2,	%g7,	%o1
	bne	%icc,	loop_1237
	movrlz	%o5,	0x049,	%l6
	fbul	%fcc0,	loop_1238
	fmuld8sux16	%f5,	%f17,	%f24
loop_1237:
	umulcc	%l1,	0x1A88,	%i7
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
loop_1238:
	fmovsneg	%xcc,	%f11,	%f10
	nop
	setx	loop_1239,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	edge16n	%o3,	%l2,	%o6
	fmovde	%icc,	%f3,	%f9
	subccc	%g6,	0x15F0,	%i2
loop_1239:
	membar	0x4F
	bne,a	%xcc,	loop_1240
	srl	%i4,	0x0A,	%i0
	set	0x28, %g2
	nop	 ! 	ldswa	[%l7 + %g2] 0x10,	%o7 ASI use changed by convert2hboot
loop_1240:
	movleu	%icc,	%i1,	%o0
	fble	%fcc0,	loop_1241
	prefetch	[%l7 + 0x24],	 0x3
	sll	%l5,	%g4,	%l4
	brlez	%l3,	loop_1242
loop_1241:
	movcc	%icc,	%g2,	%o4
	fexpand	%f0,	%f28
	xnorcc	%g5,	0x11AE,	%i5
loop_1242:
	umul	%g3,	0x019C,	%i3
	sra	%i6,	%l0,	%o2
	fmul8x16au	%f3,	%f25,	%f16
	brlz,a	%g1,	loop_1243
	move	%icc,	%g7,	%o1
	nop 	! 	sir	0x1B0C changed by convert2hboot
	ld	[%l7 + 0x28],	%f27
loop_1243:
	orncc	%l6,	0x1998,	%l1
	edge8l	%o5,	%o3,	%l2
	udivcc	%o6,	0x0557,	%g6
	ba	loop_1244
	smul	%i7,	%i2,	%i4
	stb	%o7,	[%l7 + 0x15]
	fornot2s	%f8,	%f13,	%f18
loop_1244:
	sdiv	%i1,	0x0BC5,	%o0
	set	0x0A, %l6
	nop	 ! 	stha	%l5,	[%l7 + %l6] 0x81 ASI use changed by convert2hboot
	sth	%i0,	[%l7 + 0x42]
	fbuge	%fcc2,	loop_1245
	movne	%icc,	%l4,	%l3
	edge16l	%g4,	%o4,	%g5
	addcc	%i5,	%g3,	%g2
loop_1245:
	udivx	%i3,	0x0ED0,	%l0
	add	%o2,	0x10D3,	%i6
	call	loop_1246
	call	loop_1247
	fble,a	%fcc2,	loop_1248
	movvs	%icc,	%g1,	%g7
loop_1246:
	edge8n	%l6,	%l1,	%o1
loop_1247:
	mova	%icc,	%o5,	%o3
loop_1248:
	array8	%o6,	%l2,	%g6
	udiv	%i7,	0x0352,	%i2
	wr	%g0,	0x81,	%asi
	alignaddrl	%i1,	%i4,	%l5
	xnor	%o0,	0x048E,	%l4
	wr	%g0,	0x11,	%asi
	set	0x78, %g4
	lda	[%l7 + %g4] 0x81,	%f13
	xor	%g4,	0x15B5,	%i0
	lduh	[%l7 + 0x56],	%o4
	xorcc	%i5,	%g3,	%g5
	mulscc	%i3,	%g2,	%l0
	fmovrde	%i6,	%f2,	%f30
	sdiv	%o2,	0x0324,	%g1
	nop
	setx	loop_1249,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	edge32n	%g7,	%l6,	%o1
	fsrc2s	%f25,	%f7
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
loop_1249:
	fnot2	%f4,	%f2
	movcs	%icc,	%o5,	%o3
	set	0x30, %l4
	nop	 ! 	stda	%l0,	[%l7 + %l4] 0x19 ASI use changed by convert2hboot
	nop 	! 	te	%xcc,	0x7 changed by convert2hboot
	fblg	%fcc1,	loop_1250
	ldsh	[%l7 + 0x14],	%l2
	fbn	%fcc0,	loop_1251
	nop 	! 	tn	%xcc,	0x7 changed by convert2hboot
loop_1250:
	edge32l	%g6,	%i7,	%o6
	alignaddrl	%o7,	%i2,	%i1
loop_1251:
	orcc	%i4,	%o0,	%l5
	addcc	%l4,	0x0AF9,	%l3
	wr	%g0,	0x2f,	%asi
	membar	#Sync
	bneg	loop_1252
	nop 	! 	taddcc	%i0,	0x0B4E,	%i5 changed by convert2hboot
	andncc	%o4,	%g5,	%g3
	fornot2s	%f2,	%f31,	%f16
loop_1252:
	ld	[%l7 + 0x74],	%f0
	array8	%g2,	%i3,	%l0
	fble	%fcc1,	loop_1253
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	fnegd	%f8,	%f12
	brgz	%i6,	loop_1254
loop_1253:
	sllx	%g1,	%g7,	%o2
	smulcc	%l6,	%o1,	%o3
	fmovde	%xcc,	%f26,	%f10
loop_1254:
	movpos	%xcc,	%l1,	%o5
	xorcc	%l2,	%g6,	%o6
	nop 	! 	tsubcctv	%o7,	%i2,	%i1 changed by convert2hboot
	set	0x40, %l0
	nop	 ! 	ldxa	[%l7 + %l0] 0x15,	%i7 ASI use changed by convert2hboot
	stw	%o0,	[%l7 + 0x38]
	ld	[%l7 + 0x20],	%f21
	brgez,a	%l5,	loop_1255
	std	%l4,	[%l7 + 0x58]
	edge8n	%i4,	%g4,	%l3
	ldsb	[%l7 + 0x08],	%i0
loop_1255:
	edge16l	%o4,	%g5,	%g3
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	bcc,a,pn	%icc,	loop_1256
	movcs	%icc,	%g2,	%i5
	set	0x48, %i3
	nop	 ! 	swapa	[%l7 + %i3] 0x0c,	%l0 ASI use changed by convert2hboot
loop_1256:
	fmovdne	%xcc,	%f31,	%f28
	edge16	%i6,	%g1,	%i3
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
	edge32l	%o2,	%g7,	%o1
	stx	%l6,	[%l7 + 0x78]
	wr	%g0,	0x11,	%asi
	stb	%o5,	[%l7 + 0x36]
	ldx	[%l7 + 0x60],	%l2
	bpos,a	loop_1257
	fbul,a	%fcc1,	loop_1258
	sll	%g6,	0x1B,	%l1
	fbg,a	%fcc3,	loop_1259
loop_1257:
	sdivcc	%o6,	0x1A5D,	%i2
loop_1258:
	edge8n	%i1,	%o7,	%i7
	fandnot1	%f16,	%f26,	%f20
loop_1259:
	fones	%f7
	fpsub16s	%f17,	%f14,	%f13
	lduh	[%l7 + 0x62],	%o0
	fmovsn	%xcc,	%f14,	%f14
	movcc	%xcc,	%l5,	%l4
	andcc	%i4,	0x00D7,	%g4
	sub	%l3,	%o4,	%g5
	edge16l	%i0,	%g3,	%g2
	bvs,a,pn	%xcc,	loop_1260
	bcc	%icc,	loop_1261
	movcc	%icc,	%i5,	%i6
	flush	%l7 + 0x14
loop_1260:
	edge8n	%l0,	%i3,	%o2
loop_1261:
	nop
	setx loop_1262, %l0, %l1
	jmpl %l1, %g1
	sdivcc	%g7,	0x16EF,	%l6
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	fnot1s	%f18,	%f15
loop_1262:
	fnegs	%f15,	%f21
	fbo	%fcc0,	loop_1263
	fbl	%fcc0,	loop_1264
	fpack16	%f0,	%f24
	fnot2s	%f21,	%f29
loop_1263:
	udiv	%o3,	0x0CF7,	%o5
loop_1264:
	movneg	%icc,	%o1,	%l2
	bge,a,pn	%icc,	loop_1265
	fcmpne32	%f30,	%f12,	%l1
	addc	%g6,	0x1830,	%i2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o6
	nop	 ! 	casa	[%l6] 0x18,	%o6,	%o7 ASI use changed by convert2hboot
loop_1265:
	srax	%i1,	%o0,	%l5
	fmovda	%icc,	%f20,	%f17
	wr	%g0,	0x2f,	%asi
	membar	#Sync
	movl	%xcc,	%i4,	%l4
	movn	%xcc,	%l3,	%o4
	set	0x10, %i7
	nop	 ! 	ldsha	[%l7 + %i7] 0x18,	%g4 ASI use changed by convert2hboot
	fba	%fcc3,	loop_1266
	fnand	%f20,	%f0,	%f22
	fnot1s	%f1,	%f1
	lduw	[%l7 + 0x74],	%g5
loop_1266:
	bn,a	loop_1267
	fmovse	%xcc,	%f13,	%f4
	edge16n	%g3,	%g2,	%i5
	orn	%i0,	%l0,	%i3
loop_1267:
	movne	%icc,	%i6,	%o2
	fmovsne	%icc,	%f9,	%f13
	xnor	%g7,	%g1,	%l6
	movrgez	%o3,	0x376,	%o1
	sra	%o5,	%l2,	%l1
	movneg	%xcc,	%i2,	%o6
	fmovsneg	%icc,	%f0,	%f2
	orn	%o7,	0x135F,	%i1
	brnz,a	%g6,	loop_1268
	fbne	%fcc3,	loop_1269
	nop 	! 	tsubcctv	%l5,	0x1D88,	%o0 changed by convert2hboot
	sub	%i4,	0x0F35,	%i7
loop_1268:
	smul	%l3,	0x034E,	%o4
loop_1269:
	edge16l	%g4,	%g5,	%l4
	subc	%g3,	0x05FC,	%g2
	bne,a,pt	%xcc,	loop_1270
	bgu,a,pt	%xcc,	loop_1271
	sra	%i5,	0x02,	%l0
	sdivcc	%i0,	0x0C89,	%i6
loop_1270:
	movn	%xcc,	%i3,	%o2
loop_1271:
	fornot1	%f26,	%f18,	%f12
	edge32n	%g7,	%l6,	%o3
	edge16ln	%o1,	%g1,	%l2
	fblg	%fcc1,	loop_1272
	movpos	%icc,	%l1,	%o5
	xnor	%i2,	0x0C90,	%o7
	wr	%g0,	0x81,	%asi
	sta	%f24,	[%l7 + 0x48] %asi
loop_1272:
	fnand	%f6,	%f24,	%f16
	subccc	%i1,	%g6,	%l5
	set	0x60, %i4
	sta	%f18,	[%l7 + %i4] 0x10
	movcc	%icc,	%o6,	%i4
	bleu,pn	%icc,	loop_1273
	movg	%icc,	%i7,	%l3
	movvs	%icc,	%o0,	%g4
	fbe,a	%fcc0,	loop_1274
loop_1273:
	fbe,a	%fcc2,	loop_1275
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
	fbe	%fcc2,	loop_1276
loop_1274:
	xnorcc	%o4,	%l4,	%g5
loop_1275:
	mulx	%g3,	0x0277,	%i5
	movrlz	%l0,	%i0,	%g2
loop_1276:
	nop 	! 	tvc	%xcc,	0x7 changed by convert2hboot
	movl	%icc,	%i6,	%i3
	movrlez	%g7,	0x042,	%o2
	brgez	%o3,	loop_1277
	edge8l	%o1,	%g1,	%l2
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	movl	%xcc,	%l1,	%o5
loop_1277:
	ldd	[%l7 + 0x28],	%i6
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	movrlz	%i2,	%o7,	%i1
	bge,a,pt	%icc,	loop_1278
	sethi	0x1B8A,	%l5
	fone	%f12
	fmovrdlez	%o6,	%f24,	%f10
loop_1278:
	alignaddr	%i4,	%g6,	%l3
	movg	%xcc,	%o0,	%i7
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x7C] %asi,	%f7
	fmovdl	%xcc,	%f21,	%f22
	fmovdl	%icc,	%f19,	%f0
	nop 	! 	tleu	%icc,	0x6 changed by convert2hboot
	bl,a,pt	%xcc,	loop_1279
	xorcc	%o4,	%l4,	%g4
	fpsub32s	%f10,	%f6,	%f21
	nop
	set	0x20, %o6
	stx	%g3,	[%l7 + %o6]
loop_1279:
	subccc	%i5,	0x0BD9,	%g5
	movle	%xcc,	%l0,	%i0
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
	smul	%g2,	0x08D1,	%i6
	lduw	[%l7 + 0x40],	%g7
	subccc	%i3,	%o2,	%o1
	edge8ln	%o3,	%g1,	%l1
	call	loop_1280
	fmovrde	%o5,	%f16,	%f8
	nop 	! 	taddcctv	%l6,	%i2,	%o7 changed by convert2hboot
	movvs	%icc,	%i1,	%l5
loop_1280:
	bg,pt	%icc,	loop_1281
	movvs	%xcc,	%o6,	%i4
	movre	%g6,	%l3,	%l2
	fba,a	%fcc2,	loop_1282
loop_1281:
	fnors	%f27,	%f17,	%f13
	bneg,pt	%xcc,	loop_1283
	ldub	[%l7 + 0x55],	%o0
loop_1282:
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
	lduh	[%l7 + 0x7C],	%i7
loop_1283:
	sethi	0x0965,	%l4
	bpos	loop_1284
	xorcc	%g4,	%o4,	%i5
	edge16n	%g3,	%g5,	%i0
	smul	%l0,	0x0A41,	%g2
loop_1284:
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	edge8	%i6,	%g7,	%i3
	array32	%o2,	%o1,	%g1
	movre	%l1,	%o5,	%l6
	subc	%i2,	0x01F4,	%o7
	nop 	! 	tge	%icc,	0x3 changed by convert2hboot
	for	%f4,	%f28,	%f26
	sdiv	%o3,	0x1074,	%i1
	orcc	%l5,	%i4,	%g6
	mulscc	%l3,	%l2,	%o6
	fexpand	%f6,	%f0
	andn	%i7,	0x0582,	%o0
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
	bcc	%xcc,	loop_1285
	nop 	! 	tl	%icc,	0x1 changed by convert2hboot
	movcs	%xcc,	%g4,	%l4
	umulcc	%o4,	0x03B6,	%g3
loop_1285:
	bcs,pn	%xcc,	loop_1286
	fxnor	%f6,	%f14,	%f20
	bshuffle	%f10,	%f16,	%f18
	smulcc	%g5,	0x102C,	%i0
loop_1286:
	sub	%l0,	%i5,	%i6
	bvc	loop_1287
	edge32ln	%g2,	%g7,	%i3
	wr	%g0,	0x80,	%asi
loop_1287:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f13,	%f27,	%f29
	sdiv	%o2,	0x16A5,	%g1
	movvc	%xcc,	%o5,	%l1
	fmuld8sux16	%f6,	%f12,	%f2
	fmovrslez	%l6,	%f2,	%f14
	fmovrslez	%o7,	%f8,	%f28
	fbe,a	%fcc2,	loop_1288
	fmuld8ulx16	%f11,	%f20,	%f8
	ldd	[%l7 + 0x40],	%f12
	ldub	[%l7 + 0x42],	%o3
loop_1288:
	fbn,a	%fcc1,	loop_1289
	movle	%xcc,	%i2,	%i1
	fmovrsgz	%l5,	%f16,	%f18
	movcc	%icc,	%g6,	%l3
loop_1289:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz,a	%i4,	loop_1290
	fbuge,a	%fcc0,	loop_1291
	bcc	%xcc,	loop_1292
	movl	%icc,	%l2,	%o6
loop_1290:
	stx	%i7,	[%l7 + 0x30]
loop_1291:
	bleu,pt	%xcc,	loop_1293
loop_1292:
	umul	%g4,	0x0C89,	%l4
	ld	[%l7 + 0x70],	%f22
	nop 	! 	taddcctv	%o0,	0x174C,	%o4 changed by convert2hboot
loop_1293:
	array8	%g5,	%g3,	%l0
	sub	%i5,	0x093D,	%i0
	wr	%g0,	0x81,	%asi
	nop 	! 	sir	0x08D1 changed by convert2hboot
	fba,a	%fcc3,	loop_1294
	fbug	%fcc2,	loop_1295
	fnors	%f29,	%f30,	%f6
	st	%f16,	[%l7 + 0x60]
loop_1294:
	movcc	%icc,	%g7,	%i6
loop_1295:
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
	nop 	! 	sir	0x1273 changed by convert2hboot
	nop 	! 	tsubcctv	%o1,	%o2,	%i3 changed by convert2hboot
	subccc	%o5,	%g1,	%l6
	stb	%o7,	[%l7 + 0x5C]
	std	%f16,	[%l7 + 0x48]
	addc	%o3,	0x1782,	%l1
	array8	%i1,	%i2,	%g6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%l3
	nop	 ! 	casa	[%l6] 0x18,	%l3,	%i4 ASI use changed by convert2hboot
	fsrc1s	%f19,	%f21
	fmovsle	%icc,	%f8,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x19,	%asi
	edge8	%o6,	%l2,	%g4
	fmovsge	%xcc,	%f15,	%f18
	wr	%g0,	0x80,	%asi
	movneg	%icc,	%i7,	%o0
	nop
	setx loop_1296, %l0, %l1
	jmpl %l1, %o4
	bl,a,pt	%icc,	loop_1297
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
	nop 	! 	sir	0x1A0C changed by convert2hboot
loop_1296:
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
loop_1297:
	fandnot1s	%f12,	%f22,	%f11
	ldx	[%l7 + 0x28],	%l4
	fbe,a	%fcc3,	loop_1298
	lduw	[%l7 + 0x2C],	%g3
	nop 	! 	tvc	%xcc,	0x0 changed by convert2hboot
	fmovrse	%l0,	%f28,	%f19
loop_1298:
	smulcc	%i5,	%i0,	%g2
	ble,a	loop_1299
	fcmpne32	%f12,	%f10,	%g5
	edge16l	%g7,	%i6,	%o1
	std	%f6,	[%l7 + 0x60]
loop_1299:
	fones	%f31
	fmovsne	%xcc,	%f11,	%f1
	sdivcc	%o2,	0x0784,	%o5
	fmovsleu	%xcc,	%f12,	%f2
	ldd	[%l7 + 0x38],	%i2
	movrgez	%g1,	%o7,	%l6
	edge32	%l1,	%i1,	%o3
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	stw	%g6,	[%l7 + 0x08]
	bcs,a	%xcc,	loop_1300
	xnor	%l3,	%i2,	%l5
	movrlz	%i4,	%o6,	%g4
	udiv	%i7,	0x1898,	%o0
loop_1300:
	udivx	%l2,	0x1ED6,	%o4
	mova	%icc,	%l4,	%l0
	fmovrslz	%g3,	%f2,	%f19
	brlez,a	%i5,	loop_1301
	fba	%fcc0,	loop_1302
	movleu	%xcc,	%i0,	%g5
	nop 	! 	sir	0x1815 changed by convert2hboot
loop_1301:
	sra	%g7,	0x1E,	%i6
loop_1302:
	srlx	%o1,	0x05,	%g2
	brz	%o5,	loop_1303
	sll	%i3,	0x16,	%o2
	fxnor	%f12,	%f6,	%f6
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
loop_1303:
	ldsb	[%l7 + 0x7B],	%o7
	movcs	%xcc,	%g1,	%l6
	fcmple32	%f14,	%f6,	%l1
	movrlz	%i1,	%o3,	%g6
	set	0x4E, %i2
	nop	 ! 	stba	%l3,	[%l7 + %i2] 0x23 ASI use changed by convert2hboot
	membar	#Sync
	set	0x52, %i6
	nop	 ! 	stha	%i2,	[%l7 + %i6] 0xe3 ASI use changed by convert2hboot
	membar	#Sync
	nop 	! 	tleu	%xcc,	0x6 changed by convert2hboot
	fbo,a	%fcc2,	loop_1304
	or	%i4,	0x15E4,	%l5
	nop
	setx	loop_1305,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fandnot1	%f18,	%f30,	%f4
loop_1304:
	bvs	%xcc,	loop_1306
	fmovspos	%xcc,	%f27,	%f31
loop_1305:
	fandnot1s	%f18,	%f12,	%f15
	fones	%f20
loop_1306:
	sdivx	%o6,	0x0AEA,	%g4
	brz	%o0,	loop_1307
	nop 	! 	tsubcctv	%l2,	0x19BB,	%i7 changed by convert2hboot
	fcmpgt16	%f20,	%f24,	%o4
	udivx	%l0,	0x1224,	%l4
loop_1307:
	sdiv	%i5,	0x138B,	%i0
	fbl,a	%fcc2,	loop_1308
	fmuld8sux16	%f0,	%f27,	%f26
	movrlez	%g3,	%g7,	%g5
	lduh	[%l7 + 0x54],	%o1
loop_1308:
	smul	%g2,	%i6,	%o5
	alignaddrl	%o2,	%i3,	%g1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	nop	 ! 	casxa	[%l6] 0x89,	%o7,	%l6 ASI use changed by convert2hboot
	sra	%i1,	%o3,	%l1
	move	%icc,	%g6,	%i2
	swap	[%l7 + 0x38],	%l3
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	fsrc1	%f2,	%f22
	movcc	%xcc,	%i4,	%o6
	andcc	%l5,	0x1BCF,	%g4
	nop 	! 	tsubcctv	%l2,	%o0,	%i7 changed by convert2hboot
	fmovs	%f26,	%f21
	movrgz	%o4,	%l0,	%l4
	nop
	setx	loop_1309,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fbg	%fcc1,	loop_1310
	ldstub	[%l7 + 0x67],	%i0
	fnot1s	%f14,	%f20
loop_1309:
	nop
	setx loop_1311, %l0, %l1
	jmpl %l1, %g3
loop_1310:
	fmovrdlz	%i5,	%f16,	%f6
	fmovdge	%xcc,	%f21,	%f7
	fmovd	%f4,	%f20
loop_1311:
	addcc	%g5,	%o1,	%g7
	umul	%g2,	%o5,	%i6
	alignaddrl	%o2,	%i3,	%g1
	subccc	%o7,	%l6,	%i1
	movl	%xcc,	%l1,	%g6
	sub	%i2,	0x1744,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	siam	0x5
	fnot2	%f30,	%f20
	fxor	%f18,	%f12,	%f14
	movl	%icc,	%i4,	%o6
	std	%l4,	[%l7 + 0x30]
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	edge16ln	%g4,	%l2,	%o3
	movpos	%icc,	%o0,	%o4
	subc	%i7,	0x1EA3,	%l0
	fbge,a	%fcc3,	loop_1312
	ldstub	[%l7 + 0x2D],	%l4
	fmovsvs	%xcc,	%f12,	%f12
	bgu	%icc,	loop_1313
loop_1312:
	fbo,a	%fcc0,	loop_1314
	fmovdne	%xcc,	%f3,	%f2
	move	%icc,	%g3,	%i5
loop_1313:
	fmul8x16	%f26,	%f24,	%f22
loop_1314:
	edge32n	%g5,	%o1,	%i0
	subcc	%g7,	0x167A,	%o5
	fmul8x16au	%f9,	%f27,	%f4
	movgu	%icc,	%i6,	%o2
	edge32	%g2,	%i3,	%o7
	brlez	%g1,	loop_1315
	bshuffle	%f30,	%f10,	%f14
	array32	%i1,	%l6,	%g6
	ldub	[%l7 + 0x35],	%i2
loop_1315:
	ldd	[%l7 + 0x20],	%l2
	andncc	%l1,	%o6,	%l5
	fbue	%fcc3,	loop_1316
	fmovrsgz	%i4,	%f15,	%f29
	fmovsa	%icc,	%f17,	%f26
	array8	%l2,	%g4,	%o3
loop_1316:
	flush	%l7 + 0x44
	nop 	! 	tgu	%xcc,	0x5 changed by convert2hboot
	fbge	%fcc1,	loop_1317
	movcc	%icc,	%o0,	%i7
	mulscc	%l0,	%o4,	%g3
	fble	%fcc1,	loop_1318
loop_1317:
	fsrc1	%f28,	%f2
	movrgez	%i5,	0x3BA,	%g5
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
loop_1318:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	udiv	%o1,	0x11A0,	%i0
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	subc	%g7,	%i6,	%o2
	fmovdpos	%xcc,	%f13,	%f2
	edge16l	%o5,	%g2,	%o7
	edge8l	%g1,	%i1,	%i3
	nop 	! 	tsubcc	%g6,	0x05C9,	%l6 changed by convert2hboot
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x44] %asi,	%f8
	edge16n	%i2,	%l3,	%l1
	andncc	%o6,	%i4,	%l5
	fcmpgt32	%f26,	%f14,	%g4
	stw	%l2,	[%l7 + 0x58]
	fsrc2s	%f17,	%f1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	nop	 ! 	casxa	[%l6] 0x80,	%o3,	%o0 ASI use changed by convert2hboot
	nop 	! 	tge	%icc,	0x4 changed by convert2hboot
	bge	loop_1319
	movcc	%xcc,	%l0,	%i7
	fmovspos	%xcc,	%f13,	%f14
	fmovrdlez	%o4,	%f22,	%f18
loop_1319:
	fcmple16	%f0,	%f6,	%g3
	move	%xcc,	%i5,	%l4
	array8	%o1,	%g5,	%g7
	fcmped	%fcc2,	%f0,	%f14
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
	edge8l	%i6,	%i0,	%o5
	sdivcc	%o2,	0x1116,	%o7
	smul	%g1,	%g2,	%i1
	nop 	! 	tsubcc	%g6,	%l6,	%i2 changed by convert2hboot
	fbuge,a	%fcc0,	loop_1320
	subc	%i3,	%l1,	%l3
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	addccc	%i4,	0x09B5,	%l5
loop_1320:
	xnorcc	%g4,	%l2,	%o3
	fxnors	%f10,	%f3,	%f1
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	sll	%o6,	0x1C,	%l0
	movrlez	%i7,	0x3EA,	%o0
	xorcc	%o4,	0x10D5,	%g3
	set	0x78, %o3
	nop	 ! 	swapa	[%l7 + %o3] 0x19,	%l4 ASI use changed by convert2hboot
	nop 	! 	sir	0x11E6 changed by convert2hboot
	lduh	[%l7 + 0x08],	%i5
	fornot1	%f4,	%f28,	%f22
	fmovsg	%xcc,	%f14,	%f0
	fnot2s	%f4,	%f12
	movrlz	%o1,	%g5,	%i6
	nop 	! 	taddcc	%g7,	0x1D2B,	%i0 changed by convert2hboot
	sethi	0x07D9,	%o5
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	bl,a,pt	%icc,	loop_1321
	nop 	! 	taddcc	%o2,	0x13CD,	%o7 changed by convert2hboot
	fmovdle	%icc,	%f2,	%f19
	alignaddr	%g1,	%i1,	%g2
loop_1321:
	edge8l	%l6,	%i2,	%g6
	fcmpgt16	%f18,	%f6,	%l1
	fmovdg	%xcc,	%f19,	%f13
	fornot1	%f8,	%f16,	%f26
	fbe	%fcc3,	loop_1322
	smulcc	%i3,	%l3,	%l5
	fcmpeq16	%f22,	%f14,	%i4
	nop
	setx loop_1323, %l0, %l1
	jmpl %l1, %l2
loop_1322:
	fbul,a	%fcc3,	loop_1324
	edge32ln	%o3,	%o6,	%l0
	set	0x2F, %i1
	nop	 ! 	stba	%g4,	[%l7 + %i1] 0x10 ASI use changed by convert2hboot
loop_1323:
	fnot1s	%f25,	%f17
loop_1324:
	sub	%i7,	%o4,	%o0
	movleu	%xcc,	%l4,	%g3
	sethi	0x0FE5,	%i5
	fbn,a	%fcc2,	loop_1325
	bl	loop_1326
	movcc	%xcc,	%g5,	%o1
	bcc,a	loop_1327
loop_1325:
	sdivcc	%g7,	0x0A0E,	%i0
loop_1326:
	srlx	%o5,	%o2,	%o7
	movcs	%icc,	%i6,	%g1
loop_1327:
	nop 	! 	taddcctv	%g2,	0x1E1C,	%l6 changed by convert2hboot
	fnot2	%f6,	%f0
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x14] %asi,	%f21
	movn	%icc,	%i1,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	andncc	%g6,	%i3,	%l1
	swap	[%l7 + 0x50],	%l5
	sll	%i4,	%l2,	%l3
	fcmpeq16	%f10,	%f2,	%o3
	ldd	[%l7 + 0x28],	%f22
	movneg	%icc,	%l0,	%g4
	set	0x44, %l1
	nop	 ! 	stwa	%o6,	[%l7 + %l1] 0x89 ASI use changed by convert2hboot
	andn	%o4,	%o0,	%l4
	alignaddr	%i7,	%i5,	%g5
	prefetch	[%l7 + 0x5C],	 0x0
	orn	%g3,	0x1ABB,	%o1
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	nop	 ! 	casxa	[%l6] 0x18,	%i0,	%o5 ASI use changed by convert2hboot
	movvs	%icc,	%o2,	%g7
	array8	%i6,	%o7,	%g2
	set	0x70, %i5
	nop	 ! 	swapa	[%l7 + %i5] 0x89,	%l6 ASI use changed by convert2hboot
	fand	%f22,	%f30,	%f18
	edge32n	%g1,	%i2,	%i1
	nop 	! 	ta	%xcc,	0x2 changed by convert2hboot
	bcs,a,pn	%xcc,	loop_1328
	fpsub32	%f22,	%f18,	%f4
	nop 	! 	tsubcc	%i3,	%l1,	%g6 changed by convert2hboot
	fbe	%fcc1,	loop_1329
loop_1328:
	addccc	%i4,	%l5,	%l3
	sethi	0x01D1,	%l2
	movvs	%xcc,	%o3,	%g4
loop_1329:
	nop
	wr	%g0,	0x04,	%asi
	wr	%g0,	0x88,	%asi
	srlx	%o0,	0x0C,	%l4
	sdivcc	%i7,	0x157D,	%o4
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	fmovdneg	%icc,	%f11,	%f11
	fpadd32s	%f18,	%f20,	%f18
	subcc	%i5,	%g5,	%o1
	sdivcc	%g3,	0x15B8,	%i0
	wr	%g0,	0x18,	%asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o2,	[%l7 + 0x3C]
	andn	%g7,	%i6,	%g2
	fmovsneg	%icc,	%f0,	%f29
	smul	%o7,	0x0611,	%l6
	fnor	%f20,	%f24,	%f10
	fpmerge	%f24,	%f9,	%f4
	edge8	%i2,	%g1,	%i1
	fbe	%fcc0,	loop_1330
	fandnot1	%f0,	%f6,	%f10
	mova	%icc,	%i3,	%l1
	fmovrsgz	%g6,	%f22,	%f24
loop_1330:
	movneg	%icc,	%l5,	%l3
	fmovse	%icc,	%f0,	%f23
	fcmpd	%fcc2,	%f20,	%f0
	sdiv	%l2,	0x0DCD,	%i4
	srlx	%o3,	%l0,	%o6
	movpos	%xcc,	%g4,	%o0
	nop 	! 	tvs	%icc,	0x5 changed by convert2hboot
	subcc	%l4,	%i7,	%o4
	edge8n	%g5,	%i5,	%g3
	nop 	! 	tvs	%xcc,	0x6 changed by convert2hboot
	stx	%i0,	[%l7 + 0x60]
	bge,pt	%icc,	loop_1331
	movre	%o1,	0x152,	%o2
	ble,pn	%xcc,	loop_1332
	fmovsgu	%xcc,	%f31,	%f3
loop_1331:
	swap	[%l7 + 0x18],	%o5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
loop_1332:
	edge32ln	%i6,	%l6,	%i2
	fzeros	%f13
	orn	%g1,	%i1,	%i3
	add	%l7,	0x24,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o7
	smul	%l1,	%l3,	%l5
	movge	%icc,	%l2,	%o3
	pdist	%f20,	%f8,	%f10
	fmovdne	%xcc,	%f24,	%f26
	nop 	! 	ta	%xcc,	0x5 changed by convert2hboot
	array8	%i4,	%o6,	%g4
	bpos,pn	%xcc,	loop_1333
	udivcc	%o0,	0x02E1,	%l4
	sdivcc	%i7,	0x1EC9,	%l0
	umulcc	%o4,	0x08F8,	%i5
loop_1333:
	fmovscc	%xcc,	%f0,	%f23
	bge,pt	%xcc,	loop_1334
	fmovrdne	%g3,	%f22,	%f18
	nop 	! 	tl	%icc,	0x6 changed by convert2hboot
	addcc	%i0,	0x1006,	%o1
loop_1334:
	bvs	%icc,	loop_1335
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o2,	0x0EB1,	%o5
	movvs	%xcc,	%g5,	%g7
loop_1335:
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
	fmovscc	%xcc,	%f31,	%f23
	nop 	! 	tsubcc	%i6,	0x1249,	%g2 changed by convert2hboot
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	movvc	%icc,	%l6,	%g1
	array8	%i1,	%i3,	%i2
	movl	%xcc,	%g6,	%o7
	movl	%icc,	%l3,	%l1
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
	nop 	! 	tle	%icc,	0x2 changed by convert2hboot
	fmovdcs	%icc,	%f29,	%f27
	umul	%l2,	%o3,	%i4
	array16	%l5,	%g4,	%o6
	movgu	%icc,	%l4,	%i7
	mova	%xcc,	%l0,	%o0
	mulx	%i5,	0x01FC,	%o4
	nop 	! 	tsubcctv	%i0,	%g3,	%o2 changed by convert2hboot
	sllx	%o1,	%g5,	%o5
	st	%f8,	[%l7 + 0x30]
	bgu,pt	%icc,	loop_1336
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f10,	%f18,	%f30
	andncc	%i6,	%g7,	%g2
loop_1336:
	umul	%l6,	%i1,	%i3
	fcmpne32	%f28,	%f18,	%i2
	fmovda	%icc,	%f2,	%f31
	nop 	! 	sir	0x14CF changed by convert2hboot
	fone	%f24
	andncc	%g1,	%o7,	%g6
	movrlz	%l1,	%l3,	%l2
	addccc	%o3,	%i4,	%g4
	fbug,a	%fcc2,	loop_1337
	ldd	[%l7 + 0x10],	%f8
	fcmpgt32	%f20,	%f16,	%o6
	movrne	%l4,	%l5,	%l0
loop_1337:
	addcc	%i7,	0x0164,	%i5
	ba,a,pn	%xcc,	loop_1338
	fmovdneg	%xcc,	%f1,	%f28
	and	%o0,	0x0A68,	%o4
	nop
	setx	loop_1339,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_1338:
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	fble,a	%fcc1,	loop_1340
	sdivx	%g3,	0x0F37,	%i0
loop_1339:
	fbuge	%fcc0,	loop_1341
	ldsh	[%l7 + 0x36],	%o2
loop_1340:
	srax	%g5,	%o1,	%i6
	fbo	%fcc0,	loop_1342
loop_1341:
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	move	%xcc,	%o5,	%g7
	fmovdne	%icc,	%f19,	%f17
loop_1342:
	srlx	%l6,	0x05,	%g2
	smulcc	%i1,	0x102F,	%i2
	move	%xcc,	%g1,	%o7
	popc	0x14C2,	%i3
	membar	0x4A
	edge16	%l1,	%g6,	%l2
	fbu	%fcc0,	loop_1343
	fnor	%f20,	%f26,	%f14
	ldsb	[%l7 + 0x34],	%o3
	edge16	%i4,	%g4,	%o6
loop_1343:
	edge8n	%l3,	%l4,	%l5
	fpmerge	%f8,	%f13,	%f28
	fmovrdgez	%l0,	%f18,	%f2
	fmovsg	%icc,	%f13,	%f16
	fmovsvs	%xcc,	%f28,	%f14
	orncc	%i5,	%i7,	%o4
	addc	%g3,	%o0,	%o2
	ble,a	%icc,	loop_1344
	fpsub16	%f26,	%f16,	%f2
	fnot1	%f30,	%f0
	edge8	%g5,	%o1,	%i0
loop_1344:
	ba,a	%icc,	loop_1345
	nop 	! 	sir	0x061D changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x5 changed by convert2hboot
	st	%f12,	[%l7 + 0x30]
loop_1345:
	movn	%xcc,	%o5,	%g7
	movn	%icc,	%l6,	%g2
	ba	%xcc,	loop_1346
	addc	%i1,	0x0377,	%i6
	and	%i2,	%o7,	%g1
	sdivcc	%i3,	0x07B7,	%g6
loop_1346:
	fpack16	%f8,	%f14
	nop 	! 	taddcc	%l1,	%l2,	%i4 changed by convert2hboot
	fblg,a	%fcc1,	loop_1347
	edge16ln	%o3,	%o6,	%g4
	fmovdvc	%icc,	%f3,	%f0
	bn	loop_1348
loop_1347:
	xnor	%l3,	%l5,	%l0
	edge32l	%i5,	%l4,	%i7
	andncc	%g3,	%o4,	%o0
loop_1348:
	movrlez	%g5,	%o2,	%o1
	umul	%i0,	%g7,	%l6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	nop	 ! 	casxa	[%l6] 0x04,	%o5,	%g2 ASI use changed by convert2hboot
	movrne	%i1,	%i6,	%o7
	fmovrde	%i2,	%f18,	%f14
	movne	%icc,	%g1,	%i3
	fpsub16	%f28,	%f8,	%f0
	fnegs	%f14,	%f14
	fbne	%fcc1,	loop_1349
	fmovrsgez	%l1,	%f30,	%f29
	movleu	%xcc,	%g6,	%l2
	srax	%i4,	0x02,	%o6
loop_1349:
	nop 	! 	tsubcc	%g4,	%o3,	%l3 changed by convert2hboot
	bvc,a,pt	%xcc,	loop_1350
	fbn,a	%fcc3,	loop_1351
	andn	%l5,	0x12CD,	%l0
	movrlz	%l4,	%i5,	%i7
loop_1350:
	fors	%f7,	%f16,	%f21
loop_1351:
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	std	%g2,	[%l7 + 0x30]
	nop
	set	0x20, %g3
	ldd	[%l7 + %g3],	%o0
	fpadd32s	%f6,	%f22,	%f3
	fnot2	%f14,	%f6
	xor	%g5,	%o4,	%o2
	fzeros	%f22
	movcc	%icc,	%o1,	%i0
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	sra	%l6,	%g7,	%g2
	fxors	%f19,	%f5,	%f13
	alignaddrl	%i1,	%o5,	%o7
	nop 	! 	taddcctv	%i2,	0x0EE1,	%i6 changed by convert2hboot
	edge32ln	%i3,	%l1,	%g6
	mulscc	%l2,	0x0048,	%g1
	stx	%o6,	[%l7 + 0x50]
	fxor	%f4,	%f30,	%f4
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	brz,a	%i4,	loop_1352
	sethi	0x1BD7,	%o3
	bg,pt	%xcc,	loop_1353
	movre	%g4,	0x23D,	%l5
loop_1352:
	nop
	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl
loop_1353:
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	movl	%xcc,	%l0,	%i5
	lduh	[%l7 + 0x64],	%l4
	nop 	! 	tleu	%xcc,	0x7 changed by convert2hboot
	ldsh	[%l7 + 0x78],	%i7
	fnot2	%f16,	%f4
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	ba,a,pt	%xcc,	loop_1354
	brgez	%g3,	loop_1355
	edge8	%g5,	%o4,	%o0
	sdivcc	%o2,	0x0B7C,	%i0
loop_1354:
	bleu,a,pn	%icc,	loop_1356
loop_1355:
	nop
	set	0x2D, %o7
	ldstub	[%l7 + %o7],	%l6
	srlx	%g7,	%o1,	%g2
	bcs,a	%xcc,	loop_1357
loop_1356:
	fcmpne32	%f2,	%f8,	%o5
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x0 changed by convert2hboot
loop_1357:
	bvc,a	%xcc,	loop_1358
	ldub	[%l7 + 0x45],	%o7
	umulcc	%i1,	%i6,	%i2
	ldsh	[%l7 + 0x40],	%i3
loop_1358:
	bpos	loop_1359
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	orcc	%l1,	%g6,	%l2
	subc	%o6,	0x01A4,	%i4
loop_1359:
	fornot2s	%f0,	%f17,	%f5
	fmovdn	%icc,	%f5,	%f3
	orcc	%g1,	0x1555,	%o3
	movrne	%g4,	%l3,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x0C],	%f23
	movle	%icc,	%i5,	%l0
	add	%i7,	0x1E60,	%l4
	sethi	0x0AF5,	%g3
	udiv	%o4,	0x12AD,	%o0
	bpos,pn	%icc,	loop_1360
	fmovrdlz	%g5,	%f26,	%f22
	fxor	%f10,	%f20,	%f2
	addccc	%o2,	%i0,	%l6
loop_1360:
	fcmpd	%fcc1,	%f2,	%f14
	nop 	! 	taddcc	%g7,	0x09F6,	%o1 changed by convert2hboot
	movgu	%icc,	%g2,	%o7
	xorcc	%o5,	0x08B1,	%i1
	fmul8x16al	%f29,	%f17,	%f30
	fmovdvs	%xcc,	%f19,	%f0
	udiv	%i2,	0x008C,	%i6
	fmovrsgez	%i3,	%f13,	%f27
	mulx	%l1,	%l2,	%o6
	sra	%i4,	0x19,	%g1
	orncc	%o3,	%g4,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l5,	0x1B,	%i5
	array32	%g6,	%i7,	%l4
	movrlz	%g3,	0x0AC,	%l0
	fmovrsgz	%o4,	%f13,	%f7
	movre	%g5,	0x3B3,	%o0
	set	0x40, %l5
	nop	 ! 	stda	%f0,	[%l7 + %l5] 0xf0 ASI use changed by convert2hboot
	membar	#Sync
	nop
	setx	loop_1361,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fornot2	%f10,	%f22,	%f24
	nop 	! 	ta	%xcc,	0x2 changed by convert2hboot
	subccc	%i0,	0x1F2B,	%l6
loop_1361:
	brz	%g7,	loop_1362
	udivcc	%o1,	0x0E12,	%g2
	array32	%o2,	%o5,	%o7
	sdivcc	%i2,	0x1A26,	%i6
loop_1362:
	fmovda	%xcc,	%f28,	%f17
	fpadd32s	%f3,	%f27,	%f6
	fmovsl	%xcc,	%f19,	%f1
	ldd	[%l7 + 0x50],	%i0
	movl	%xcc,	%l1,	%l2
	edge16ln	%i3,	%o6,	%i4
	fmovdl	%icc,	%f16,	%f4
	array16	%o3,	%g1,	%g4
	movrlez	%l3,	0x099,	%l5
	fbe	%fcc3,	loop_1363
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
	fmovdle	%xcc,	%f29,	%f4
	movle	%xcc,	%g6,	%i7
loop_1363:
	fandnot1	%f12,	%f12,	%f16
	movrgez	%i5,	0x0B5,	%g3
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
	edge32l	%l4,	%l0,	%g5
	addcc	%o0,	0x1046,	%o4
	array32	%i0,	%g7,	%l6
	xor	%g2,	%o2,	%o5
	flush	%l7 + 0x54
	fbn	%fcc1,	loop_1364
	sub	%o7,	%o1,	%i2
	sdivx	%i6,	0x0B61,	%l1
	udiv	%l2,	0x0849,	%i3
loop_1364:
	movrne	%i1,	%o6,	%i4
	fbule	%fcc3,	loop_1365
	xnorcc	%o3,	%g4,	%g1
	array16	%l5,	%l3,	%i7
	fpsub32	%f12,	%f30,	%f8
loop_1365:
	fmovsg	%xcc,	%f17,	%f28
	fnors	%f20,	%f14,	%f22
	movge	%xcc,	%g6,	%g3
	fbge,a	%fcc3,	loop_1366
	nop 	! 	tne	%xcc,	0x5 changed by convert2hboot
	movrlz	%i5,	%l0,	%l4
	udivcc	%g5,	0x0DEC,	%o0
loop_1366:
	nop 	! 	tsubcctv	%i0,	0x06A0,	%o4 changed by convert2hboot
	sllx	%l6,	0x17,	%g7
	fandnot2s	%f31,	%f7,	%f26
	movpos	%icc,	%g2,	%o5
	movre	%o7,	%o2,	%i2
	xor	%o1,	0x0A93,	%i6
	movre	%l2,	%l1,	%i3
	ld	[%l7 + 0x10],	%f29
	fcmpeq16	%f6,	%f0,	%i1
	nop
	setx loop_1367, %l0, %l1
	jmpl %l1, %i4
	fbn	%fcc1,	loop_1368
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	sub	%o6,	0x1A96,	%g4
loop_1367:
	fmovd	%f2,	%f24
loop_1368:
	fxors	%f15,	%f29,	%f28
	membar	0x1B
	fpsub16s	%f0,	%f10,	%f23
	nop 	! 	taddcc	%o3,	0x095C,	%g1 changed by convert2hboot
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	fnot2	%f16,	%f30
	fblg,a	%fcc2,	loop_1369
	fnegs	%f8,	%f0
	movleu	%icc,	%l5,	%l3
	smulcc	%g6,	0x18B0,	%g3
loop_1369:
	nop 	! 	ta	%xcc,	0x0 changed by convert2hboot
	bl,a,pt	%xcc,	loop_1370
	fnot1	%f18,	%f6
	nop 	! 	sir	0x16EC changed by convert2hboot
	edge16ln	%i5,	%l0,	%i7
loop_1370:
	fpsub16s	%f31,	%f10,	%f24
	edge16	%g5,	%l4,	%i0
	nop 	! 	tl	%xcc,	0x4 changed by convert2hboot
	edge8ln	%o0,	%l6,	%o4
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
	fmul8x16	%f21,	%f20,	%f0
	st	%f6,	[%l7 + 0x2C]
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
	umulcc	%g7,	%g2,	%o7
	nop 	! 	taddcctv	%o2,	0x077E,	%o5 changed by convert2hboot
	movle	%xcc,	%o1,	%i6
	wr	%g0,	0x10,	%asi
	srl	%l1,	0x03,	%i3
	edge16ln	%i2,	%i4,	%i1
	bn,a,pn	%xcc,	loop_1371
	fmovdleu	%icc,	%f24,	%f10
	nop 	! 	tleu	%xcc,	0x6 changed by convert2hboot
	edge32ln	%g4,	%o3,	%o6
loop_1371:
	addccc	%l5,	0x1B0A,	%g1
	ldsh	[%l7 + 0x7A],	%g6
	fba,a	%fcc1,	loop_1372
	smulcc	%g3,	0x1ECA,	%i5
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	fsrc1s	%f30,	%f6
loop_1372:
	fandnot1s	%f5,	%f25,	%f11
	edge32	%l0,	%i7,	%g5
	ldsw	[%l7 + 0x1C],	%l4
	udiv	%l3,	0x1872,	%i0
	sra	%o0,	%l6,	%g7
	sdivcc	%g2,	0x090C,	%o7
	array32	%o2,	%o4,	%o5
	movl	%icc,	%o1,	%i6
	movpos	%icc,	%l1,	%i3
	udivcc	%i2,	0x0533,	%l2
	udiv	%i1,	0x0412,	%i4
	fnot1	%f18,	%f28
	brnz,a	%o3,	loop_1373
	popc	0x1CED,	%g4
	nop 	! 	tsubcc	%l5,	0x08B6,	%g1 changed by convert2hboot
	stw	%o6,	[%l7 + 0x78]
loop_1373:
	edge32n	%g3,	%i5,	%g6
	udivcc	%i7,	0x1AC1,	%g5
	bneg	%icc,	loop_1374
	edge16n	%l4,	%l0,	%l3
	edge8ln	%i0,	%l6,	%g7
	wr	%g0,	0x10,	%asi
loop_1374:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	nop	 ! 	casxa	[%l6] 0x19,	%o7,	%g2 ASI use changed by convert2hboot
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	orcc	%o4,	%o2,	%o5
	nop
	set	0x1D, %o5
	stb	%i6,	[%l7 + %o5]
	edge8ln	%l1,	%i3,	%o1
	stw	%l2,	[%l7 + 0x74]
	fmovsn	%xcc,	%f16,	%f30
	mulx	%i1,	%i4,	%i2
	edge16ln	%g4,	%o3,	%l5
	mulscc	%g1,	0x09BC,	%o6
	fpackfix	%f22,	%f18
	nop 	! 	te	%xcc,	0x7 changed by convert2hboot
	fpadd32s	%f3,	%f10,	%f30
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
	fmovsa	%xcc,	%f10,	%f28
	xnorcc	%g3,	0x0EDD,	%g6
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	fnors	%f24,	%f9,	%f15
	fbl,a	%fcc1,	loop_1375
	movrlez	%i7,	%g5,	%i5
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
loop_1375:
	mulx	%l0,	0x0AA6,	%l4
	movvs	%icc,	%i0,	%l3
	nop
	setx	loop_1376,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	or	%g7,	%l6,	%o0
	nop
	set	0x18, %g7
	ldx	[%l7 + %g7],	%g2
	std	%o4,	[%l7 + 0x78]
loop_1376:
	fmovrdlz	%o7,	%f0,	%f18
	orn	%o2,	0x1518,	%i6
	fbue	%fcc0,	loop_1377
	fbge	%fcc3,	loop_1378
	fmovsvc	%xcc,	%f16,	%f9
	smul	%o5,	%l1,	%i3
loop_1377:
	fcmpgt16	%f14,	%f12,	%l2
loop_1378:
	andcc	%o1,	%i1,	%i2
	udivx	%i4,	0x0419,	%o3
	nop 	! 	tg	%icc,	0x1 changed by convert2hboot
	xorcc	%l5,	%g1,	%g4
	and	%o6,	0x012D,	%g3
	xnorcc	%g6,	%i7,	%i5
	and	%g5,	%l4,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l3,	%g7,	%i0
	fxnors	%f31,	%f27,	%f14
	sdiv	%o0,	0x130C,	%l6
	udivx	%o4,	0x149F,	%o7
	wr	%g0,	0x88,	%asi
	alignaddrl	%i6,	%o2,	%l1
	fandnot1	%f2,	%f10,	%f10
	and	%i3,	0x1F55,	%l2
	andcc	%o1,	0x0282,	%i1
	udivx	%o5,	0x163B,	%i2
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	movneg	%xcc,	%i4,	%o3
	fexpand	%f28,	%f8
	movne	%xcc,	%g1,	%l5
	fmovdge	%xcc,	%f20,	%f19
	orncc	%g4,	0x0E1E,	%o6
	wr	%g0,	0x81,	%asi
	fexpand	%f27,	%f16
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	fones	%f24
	andncc	%g3,	%i7,	%g5
	set	0x0C, %g6
	nop	 ! 	lduwa	[%l7 + %g6] 0x80,	%l4 ASI use changed by convert2hboot
	fpsub16s	%f27,	%f19,	%f19
	movrgez	%i5,	%l3,	%l0
	bleu,pn	%icc,	loop_1379
	fbge,a	%fcc2,	loop_1380
	nop 	! 	ta	%xcc,	0x5 changed by convert2hboot
	bn	%xcc,	loop_1381
loop_1379:
	and	%g7,	%i0,	%l6
loop_1380:
	stw	%o4,	[%l7 + 0x7C]
	lduh	[%l7 + 0x76],	%o7
loop_1381:
	fmul8x16au	%f23,	%f18,	%f16
	movge	%xcc,	%g2,	%i6
	fsrc2	%f22,	%f12
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	set	0x28, %o4
	nop	 ! 	lduwa	[%l7 + %o4] 0x88,	%o2 ASI use changed by convert2hboot
	fornot2	%f30,	%f26,	%f0
	nop 	! 	taddcctv	%o0,	0x19F5,	%i3 changed by convert2hboot
	move	%icc,	%l2,	%o1
	or	%i1,	%l1,	%i2
	ba,a	%xcc,	loop_1382
	fbl	%fcc2,	loop_1383
	fmovrdgz	%i4,	%f22,	%f28
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
loop_1382:
	nop
	wr	%g0,	0x19,	%asi
loop_1383:
	sll	%o5,	%g1,	%l5
	fornot2	%f14,	%f16,	%f18
	edge16	%o6,	%g6,	%g4
	movgu	%xcc,	%i7,	%g3
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	nop 	! 	tl	%icc,	0x6 changed by convert2hboot
	ldd	[%l7 + 0x38],	%f26
	stb	%l4,	[%l7 + 0x73]
	movleu	%icc,	%g5,	%l3
	umulcc	%l0,	%i5,	%g7
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
	orcc	%l6,	%i0,	%o7
	andcc	%o4,	0x1C57,	%i6
	array8	%g2,	%o2,	%o0
	fpsub32	%f24,	%f12,	%f16
	fone	%f14
	nop 	! 	tvs	%icc,	0x5 changed by convert2hboot
	fbl	%fcc1,	loop_1384
	fands	%f13,	%f17,	%f7
	andcc	%i3,	%l2,	%i1
	bge,pt	%xcc,	loop_1385
loop_1384:
	subc	%o1,	%l1,	%i4
	bcc	%xcc,	loop_1386
	stw	%o3,	[%l7 + 0x28]
loop_1385:
	bvs,a	loop_1387
	fandnot1	%f0,	%f0,	%f6
loop_1386:
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
	fands	%f26,	%f29,	%f24
loop_1387:
	nop
	set	0x36, %g1
	nop	 ! 	lduba	[%l7 + %g1] 0x81,	%o5 ASI use changed by convert2hboot
	array16	%i2,	%l5,	%o6
	fmuld8ulx16	%f22,	%f20,	%f28
	fmovrse	%g1,	%f16,	%f0
	fnot1	%f10,	%f28
	add	%l7,	0x18,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g4
	nop	 ! 	casa	[%l6] 0x04,	%g4,	%g6 ASI use changed by convert2hboot
	movneg	%xcc,	%g3,	%l4
	subccc	%g5,	0x1D42,	%l3
	movvs	%icc,	%l0,	%i7
	fbo	%fcc2,	loop_1388
	xnor	%g7,	%l6,	%i0
	edge32	%o7,	%i5,	%o4
	orn	%i6,	%o2,	%g2
loop_1388:
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	std	%f28,	[%l7 + 0x58]
	xor	%o0,	0x11F0,	%i3
	popc	%l2,	%o1
	mova	%icc,	%i1,	%l1
	srax	%o3,	0x0C,	%i4
	popc	0x192E,	%i2
	movrne	%o5,	0x126,	%l5
	addc	%o6,	%g4,	%g6
	bvc,a,pn	%icc,	loop_1389
	array16	%g1,	%l4,	%g3
	fmul8x16	%f5,	%f8,	%f16
	addcc	%g5,	%l3,	%l0
loop_1389:
	fcmpne16	%f26,	%f20,	%g7
	and	%l6,	%i0,	%o7
	ld	[%l7 + 0x68],	%f16
	set	0x70, %o2
	nop	 ! 	stha	%i5,	[%l7 + %o2] 0x18 ASI use changed by convert2hboot
	popc	%o4,	%i7
	flush	%l7 + 0x3C
	set	0x38, %o1
	nop	 ! 	lduba	[%l7 + %o1] 0x19,	%o2 ASI use changed by convert2hboot
	set	0x360, %g5
	nop 	! 	nop 	! 	nop	 ! 	ldxa	[%g0 + %g5] 0x40,	%i6 ASI use changed by convert2hboot ripped by fixASI40.pl ripped by fixASI40.pl
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x64],	%g2
	brgz	%o0,	loop_1390
	fors	%f11,	%f12,	%f5
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
	wr	%g0,	0x80,	%asi
loop_1390:
	umul	%o1,	0x1064,	%i1
	sth	%l1,	[%l7 + 0x10]
	nop 	! 	taddcctv	%l2,	%o3,	%i2 changed by convert2hboot
	nop
	set	0x48, %o0
	stx	%o5,	[%l7 + %o0]
	fbug,a	%fcc1,	loop_1391
	movleu	%xcc,	%i4,	%l5
	edge32ln	%o6,	%g4,	%g1
	set	0x08, %l2
	sta	%f24,	[%l7 + %l2] 0x81
loop_1391:
	membar	0x20
	fmovsleu	%icc,	%f0,	%f2
	set	0x24, %l3
	nop	 ! 	ldstuba	[%l7 + %l3] 0x11,	%l4 ASI use changed by convert2hboot
	set	0x78, %g2
	nop	 ! 	stwa	%g3,	[%l7 + %g2] 0x81 ASI use changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
	fcmpes	%fcc1,	%f9,	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g6,	%l3,	%g5
	movg	%xcc,	%g7,	%l6
	nop 	! 	tvc	%icc,	0x5 changed by convert2hboot
	brgz	%l0,	loop_1392
	fba	%fcc1,	loop_1393
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
	orcc	%i0,	0x1195,	%o7
loop_1392:
	nop
	wr	%g0,	0x04,	%asi
loop_1393:
	andncc	%i7,	%o2,	%i6
	membar	0x70
	fandnot1s	%f11,	%f30,	%f26
	movrlz	%o4,	0x24A,	%o0
	fmovsge	%xcc,	%f19,	%f9
	movrne	%i3,	0x19E,	%o1
	nop 	! 	tn	%xcc,	0x5 changed by convert2hboot
	fmovrsne	%i1,	%f29,	%f18
	fcmpeq16	%f10,	%f2,	%g2
	movcs	%icc,	%l1,	%l2
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
	swap	[%l7 + 0x30],	%o3
	wr	%g0,	0x04,	%asi
	xnorcc	%o5,	%i4,	%l5
	fzero	%f24
	fmovscc	%xcc,	%f22,	%f26
	udivcc	%o6,	0x00E7,	%g4
	fmovdg	%icc,	%f12,	%f6
	fmovsl	%icc,	%f20,	%f10
	movle	%xcc,	%l4,	%g3
	edge32	%g1,	%g6,	%g5
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	nop 	! 	ta	%xcc,	0x7 changed by convert2hboot
	movne	%xcc,	%g7,	%l3
	wr	%g0,	0x19,	%asi
	srl	%i0,	0x1B,	%o7
	movne	%xcc,	%i5,	%i7
	mova	%icc,	%o2,	%l6
	edge32n	%i6,	%o0,	%o4
	ldub	[%l7 + 0x53],	%o1
	movpos	%xcc,	%i1,	%i3
	fnand	%f16,	%f24,	%f2
	edge8ln	%l1,	%l2,	%o3
	movrlez	%i2,	0x1C3,	%o5
	set	0x4A, %l6
	nop	 ! 	ldsha	[%l7 + %l6] 0x11,	%g2 ASI use changed by convert2hboot
	udivx	%i4,	0x0A4F,	%o6
	addccc	%l5,	%g4,	%g3
	array16	%g1,	%l4,	%g5
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
	fmul8x16au	%f8,	%f31,	%f0
	nop 	! 	tsubcctv	%g7,	0x1922,	%l3 changed by convert2hboot
	popc	%l0,	%g6
	movrne	%o7,	0x1CE,	%i5
	nop 	! 	ta	%icc,	0x7 changed by convert2hboot
	sll	%i0,	%o2,	%i7
	call	loop_1394
	brgz	%i6,	loop_1395
	fbu,a	%fcc2,	loop_1396
	fabsd	%f20,	%f24
loop_1394:
	brgz	%o0,	loop_1397
loop_1395:
	fone	%f30
loop_1396:
	move	%xcc,	%l6,	%o1
	xnorcc	%o4,	%i1,	%l1
loop_1397:
	membar	0x37
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	fmovsa	%icc,	%f2,	%f28
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	fones	%f0
	smulcc	%i3,	0x143D,	%l2
	fmovs	%f22,	%f1
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
	fmovspos	%icc,	%f24,	%f14
	fsrc1s	%f10,	%f20
	fmovdne	%icc,	%f2,	%f13
	mulx	%o3,	%o5,	%i2
	fmovd	%f16,	%f8
	wr	%g0,	0x22,	%asi
	membar	#Sync
	smul	%o6,	%i4,	%l5
	smulcc	%g4,	%g3,	%g1
	fmovd	%f14,	%f28
	movgu	%xcc,	%g5,	%l4
	fbn	%fcc2,	loop_1398
	srax	%g7,	0x19,	%l3
	membar	0x63
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
loop_1398:
	fnegs	%f20,	%f20
	bne,a	loop_1399
	edge32ln	%l0,	%g6,	%o7
	orncc	%i0,	%i5,	%o2
	movle	%xcc,	%i7,	%i6
loop_1399:
	edge16ln	%l6,	%o1,	%o0
	fmul8x16al	%f25,	%f24,	%f22
	set	0x08, %g4
	nop	 ! 	ldxa	[%l7 + %g4] 0x88,	%o4 ASI use changed by convert2hboot
	fmul8x16au	%f1,	%f6,	%f22
	mulscc	%i1,	0x1574,	%l1
	edge8l	%l2,	%i3,	%o3
	fmovdvc	%icc,	%f28,	%f30
	array32	%o5,	%g2,	%o6
	movge	%icc,	%i4,	%i2
	orcc	%g4,	0x0CE8,	%g3
	array16	%g1,	%l5,	%g5
	nop 	! 	tg	%xcc,	0x0 changed by convert2hboot
	fcmple16	%f26,	%f12,	%g7
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	fbg	%fcc0,	loop_1400
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
	fmovdne	%xcc,	%f29,	%f19
	set	0x40, %l4
	nop	 ! 	ldswa	[%l7 + %l4] 0x18,	%l4 ASI use changed by convert2hboot
loop_1400:
	fbne	%fcc2,	loop_1401
	fones	%f7
	set	0x60, %i0
	nop	 ! 	prefetcha	[%l7 + %i0] 0x0c,	 0x1 ASI use changed by convert2hboot
loop_1401:
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
	movl	%icc,	%g6,	%o7
	srax	%l0,	0x05,	%i5
	fpack32	%f20,	%f24,	%f22
	stx	%i0,	[%l7 + 0x70]
	fabss	%f19,	%f13
	xnor	%o2,	0x1C8D,	%i7
	orncc	%l6,	0x1583,	%i6
	sll	%o1,	0x06,	%o0
	umul	%o4,	%l1,	%i1
	fnot2s	%f15,	%f25
	fmovrdne	%l2,	%f24,	%f28
	fbl	%fcc3,	loop_1402
	fbuge,a	%fcc1,	loop_1403
	bl	loop_1404
	fmovrslez	%o3,	%f5,	%f16
loop_1402:
	mulx	%o5,	%g2,	%i3
loop_1403:
	nop 	! 	tsubcctv	%i4,	0x0337,	%i2 changed by convert2hboot
loop_1404:
	edge8ln	%o6,	%g3,	%g4
	bvc,a,pn	%xcc,	loop_1405
	bvs,pn	%xcc,	loop_1406
	or	%l5,	%g5,	%g1
	fcmple32	%f10,	%f22,	%g7
loop_1405:
	st	%f24,	[%l7 + 0x44]
loop_1406:
	edge8l	%l3,	%g6,	%l4
	array16	%o7,	%i5,	%i0
	fors	%f4,	%f27,	%f28
	nop 	! 	taddcctv	%o2,	%l0,	%i7 changed by convert2hboot
	st	%f5,	[%l7 + 0x18]
	movrgez	%l6,	0x332,	%i6
	wr	%g0,	0x04,	%asi
	fcmpne16	%f20,	%f4,	%o0
	ld	[%l7 + 0x54],	%f13
	sethi	0x1734,	%l1
	fandnot1	%f0,	%f22,	%f6
	fmuld8sux16	%f10,	%f8,	%f8
	andcc	%i1,	%l2,	%o4
	bleu,a,pn	%xcc,	loop_1407
	nop 	! 	taddcctv	%o5,	%g2,	%o3 changed by convert2hboot
	udiv	%i4,	0x0C8E,	%i2
	membar	0x1F
loop_1407:
	sethi	0x0F08,	%i3
	sub	%o6,	0x161E,	%g3
	fbe,a	%fcc2,	loop_1408
	fpadd16	%f28,	%f30,	%f20
	bge,pn	%icc,	loop_1409
	movcc	%icc,	%l5,	%g4
loop_1408:
	smul	%g5,	%g1,	%g7
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
loop_1409:
	membar	0x38
	movpos	%icc,	%g6,	%l4
	and	%o7,	%l3,	%i0
	brgez	%o2,	loop_1410
	fmovrdlz	%l0,	%f26,	%f0
	std	%i4,	[%l7 + 0x20]
	bvc,a,pn	%icc,	loop_1411
loop_1410:
	fmovd	%f18,	%f20
	subcc	%i7,	0x08C0,	%l6
	movvc	%xcc,	%o1,	%o0
loop_1411:
	fzeros	%f6
	andcc	%i6,	0x1660,	%l1
	edge16n	%i1,	%o4,	%l2
	srax	%g2,	%o3,	%i4
	array16	%i2,	%i3,	%o5
	ld	[%l7 + 0x30],	%f18
	fblg	%fcc2,	loop_1412
	fbne,a	%fcc2,	loop_1413
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
loop_1412:
	fpack16	%f22,	%f17
loop_1413:
	mova	%icc,	%g3,	%o6
	fcmpne32	%f8,	%f24,	%g4
	andncc	%g5,	%g1,	%g7
	fxnor	%f20,	%f10,	%f6
	srlx	%g6,	0x0E,	%l4
	movre	%o7,	0x0F5,	%l5
	movrgez	%i0,	0x1A3,	%l3
	fbu	%fcc0,	loop_1414
	subc	%o2,	%i5,	%i7
	fxnor	%f22,	%f6,	%f30
	nop 	! 	te	%xcc,	0x7 changed by convert2hboot
loop_1414:
	fbl,a	%fcc0,	loop_1415
	array32	%l6,	%l0,	%o1
	nop
	setx	loop_1416,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	movcc	%xcc,	%i6,	%o0
loop_1415:
	movrne	%l1,	%o4,	%l2
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
loop_1416:
	sll	%i1,	0x0F,	%g2
	edge32n	%o3,	%i2,	%i3
	movle	%icc,	%o5,	%g3
	bvs,pn	%xcc,	loop_1417
	edge16	%o6,	%i4,	%g5
	fcmple32	%f26,	%f20,	%g1
	smul	%g7,	0x1296,	%g4
loop_1417:
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	sub	%l4,	%o7,	%l5
	orn	%g6,	%l3,	%o2
	bvs,a	loop_1418
	andcc	%i0,	%i7,	%i5
	fmovsvs	%xcc,	%f24,	%f21
	movneg	%icc,	%l6,	%o1
loop_1418:
	movleu	%xcc,	%l0,	%i6
	fmovdle	%icc,	%f0,	%f5
	edge8ln	%l1,	%o4,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%xcc,	%f20,	%f10
	alignaddr	%o0,	%i1,	%o3
	edge16n	%i2,	%i3,	%g2
	wr	%g0,	0x10,	%asi
	fmovsne	%icc,	%f20,	%f20
	movre	%g3,	%o6,	%g5
	or	%g1,	%i4,	%g7
	fandnot1s	%f26,	%f10,	%f20
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	sdiv	%g4,	0x0BAF,	%o7
	be,a	%icc,	loop_1419
	fmovdvc	%xcc,	%f16,	%f29
	fmovda	%icc,	%f5,	%f18
	add	%l5,	%l4,	%l3
loop_1419:
	nop
	set	0x40, %i3
	nop	 ! 	ldda	[%l7 + %i3] 0x15,	%f0 ASI use changed by convert2hboot
	nop 	! 	tvc	%icc,	0x2 changed by convert2hboot
	ba,pt	%icc,	loop_1420
	fandnot1	%f18,	%f16,	%f0
	udivcc	%o2,	0x1336,	%g6
	brz,a	%i7,	loop_1421
loop_1420:
	sdivx	%i5,	0x09F7,	%l6
	fpadd16s	%f1,	%f17,	%f30
	edge32ln	%i0,	%l0,	%i6
loop_1421:
	movgu	%icc,	%o1,	%l1
	movvc	%xcc,	%o4,	%o0
	and	%i1,	0x16B7,	%o3
	edge8n	%l2,	%i3,	%g2
	wr	%g0,	0x89,	%asi
	movrgz	%o5,	0x26F,	%g3
	movgu	%xcc,	%g5,	%o6
	umulcc	%g1,	0x1FF1,	%g7
	be,a,pt	%icc,	loop_1422
	xorcc	%g4,	%o7,	%i4
	movne	%icc,	%l5,	%l4
	fmovsgu	%icc,	%f26,	%f19
loop_1422:
	for	%f10,	%f30,	%f10
	nop
	set	0x72, %l0
	stb	%l3,	[%l7 + %l0]
	std	%f2,	[%l7 + 0x48]
	movrgez	%g6,	0x1BF,	%o2
	fmovdg	%icc,	%f6,	%f12
	fbne	%fcc2,	loop_1423
	ldsh	[%l7 + 0x50],	%i5
	movl	%xcc,	%i7,	%l6
	fsrc1s	%f26,	%f6
loop_1423:
	fcmpes	%fcc1,	%f16,	%f28
	nop
	set	0x63, %i7
	ldub	[%l7 + %i7],	%i0
	fnors	%f6,	%f26,	%f12
	xor	%l0,	%o1,	%i6
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
	move	%xcc,	%o4,	%o0
	movg	%xcc,	%l1,	%i1
	fbug,a	%fcc3,	loop_1424
	movrgz	%o3,	0x354,	%l2
	sdivx	%i3,	0x0235,	%i2
	movrne	%g2,	0x33C,	%o5
loop_1424:
	fzeros	%f13
	udivcc	%g5,	0x07ED,	%o6
	set	0x08, %o6
	sta	%f7,	[%l7 + %o6] 0x14
	bvc	loop_1425
	or	%g1,	%g7,	%g4
	alignaddr	%o7,	%i4,	%g3
	brnz	%l4,	loop_1426
loop_1425:
	fcmped	%fcc2,	%f8,	%f4
	fmovrde	%l5,	%f8,	%f8
	mulscc	%g6,	%l3,	%o2
loop_1426:
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
	movrne	%i5,	%l6,	%i0
	nop
	setx loop_1427, %l0, %l1
	jmpl %l1, %i7
	movrlz	%o1,	0x14C,	%i6
	bgu,a,pn	%xcc,	loop_1428
	fabsd	%f22,	%f18
loop_1427:
	membar	0x6A
	fmovsa	%icc,	%f16,	%f5
loop_1428:
	fmovdleu	%xcc,	%f17,	%f17
	st	%f3,	[%l7 + 0x70]
	sll	%o4,	0x05,	%l0
	or	%l1,	%o0,	%i1
	addcc	%o3,	%l2,	%i3
	nop 	! 	tsubcctv	%g2,	0x1427,	%o5 changed by convert2hboot
	popc	%i2,	%o6
	xorcc	%g5,	0x1AE2,	%g7
	mulscc	%g4,	%o7,	%i4
	movvs	%xcc,	%g1,	%g3
	movne	%xcc,	%l5,	%l4
	sllx	%g6,	0x1E,	%l3
	addccc	%i5,	0x0143,	%l6
	move	%xcc,	%o2,	%i7
	edge16n	%o1,	%i0,	%i6
	array16	%o4,	%l1,	%o0
	fpadd32s	%f27,	%f15,	%f3
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	edge16n	%i1,	%o3,	%l0
	fpack32	%f28,	%f6,	%f2
	nop 	! 	tcc	%icc,	0x4 changed by convert2hboot
	movrgz	%i3,	0x0DA,	%g2
	sra	%o5,	%l2,	%i2
	popc	%o6,	%g7
	fble	%fcc3,	loop_1429
	fmovdge	%xcc,	%f21,	%f1
	sethi	0x12AB,	%g4
	srl	%g5,	0x11,	%o7
loop_1429:
	ba,pn	%icc,	loop_1430
	xorcc	%i4,	0x0FE0,	%g1
	bge,a	%xcc,	loop_1431
	srl	%g3,	%l5,	%g6
loop_1430:
	nop 	! 	tn	%icc,	0x5 changed by convert2hboot
	fand	%f26,	%f8,	%f26
loop_1431:
	umul	%l3,	%l4,	%l6
	andcc	%o2,	0x06C8,	%i5
	fmovdle	%xcc,	%f29,	%f3
	fmovda	%xcc,	%f5,	%f7
	array32	%i7,	%o1,	%i0
	fbne	%fcc3,	loop_1432
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	fnors	%f21,	%f28,	%f30
	brnz	%o4,	loop_1433
loop_1432:
	fmovdl	%xcc,	%f19,	%f23
	edge16ln	%i6,	%l1,	%i1
	be,pt	%icc,	loop_1434
loop_1433:
	fmovspos	%xcc,	%f7,	%f4
	movpos	%icc,	%o0,	%l0
	movcs	%icc,	%o3,	%i3
loop_1434:
	fble,a	%fcc2,	loop_1435
	movrgez	%o5,	%g2,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f6,	%f30
loop_1435:
	flush	%l7 + 0x70
	bge	%icc,	loop_1436
	srax	%i2,	%g7,	%o6
	ble	loop_1437
	ldstub	[%l7 + 0x48],	%g4
loop_1436:
	or	%o7,	%i4,	%g1
	fnor	%f28,	%f18,	%f14
loop_1437:
	array8	%g5,	%g3,	%l5
	edge8	%l3,	%l4,	%g6
	fornot2s	%f18,	%f16,	%f8
	fmovrdne	%l6,	%f28,	%f10
	and	%o2,	0x0FA4,	%i7
	nop 	! 	taddcctv	%o1,	0x16D1,	%i5 changed by convert2hboot
	fbn,a	%fcc2,	loop_1438
	fors	%f24,	%f10,	%f0
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	fmuld8sux16	%f28,	%f11,	%f20
loop_1438:
	nop
	wr	%g0,	0x20,	%asi
	fbn,a	%fcc1,	loop_1439
	fnot1	%f26,	%f0
	edge16ln	%i6,	%l1,	%i1
	fsrc1	%f16,	%f28
loop_1439:
	fmul8x16al	%f15,	%f14,	%f16
	edge8l	%i0,	%l0,	%o3
	sethi	0x0DA7,	%i3
	fmovspos	%icc,	%f0,	%f29
	fpadd16	%f6,	%f22,	%f28
	swap	[%l7 + 0x28],	%o5
	movrgez	%o0,	%g2,	%l2
	mulscc	%g7,	%i2,	%o6
	fmovrdlez	%o7,	%f0,	%f14
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
	edge8n	%g4,	%i4,	%g1
	wr	%g0,	0x88,	%asi
	xnorcc	%g5,	%l5,	%l4
	fmovd	%f26,	%f18
	wr	%g0,	0xe2,	%asi
	membar	#Sync
	fpack16	%f16,	%f26
	stb	%g6,	[%l7 + 0x72]
	srlx	%o2,	%l6,	%i7
	movne	%xcc,	%i5,	%o1
	xnorcc	%o4,	%i6,	%l1
	subc	%i0,	%i1,	%l0
	call	loop_1440
	fcmpeq16	%f18,	%f24,	%o3
	edge16ln	%o5,	%i3,	%o0
	nop 	! 	tg	%xcc,	0x7 changed by convert2hboot
loop_1440:
	fbu,a	%fcc0,	loop_1441
	bn,pt	%icc,	loop_1442
	edge16n	%g2,	%l2,	%g7
	addc	%o6,	%o7,	%g4
loop_1441:
	subcc	%i2,	%i4,	%g1
loop_1442:
	xorcc	%g5,	%g3,	%l4
	movle	%xcc,	%l3,	%l5
	mova	%icc,	%g6,	%o2
	st	%f7,	[%l7 + 0x18]
	xnor	%l6,	%i7,	%i5
	nop 	! 	tl	%xcc,	0x7 changed by convert2hboot
	fmuld8sux16	%f20,	%f12,	%f26
	bleu	loop_1443
	edge16n	%o1,	%i6,	%l1
	sll	%o4,	%i1,	%l0
	ldd	[%l7 + 0x58],	%i0
loop_1443:
	edge8l	%o3,	%i3,	%o5
	edge8l	%o0,	%g2,	%l2
	fbe,a	%fcc3,	loop_1444
	addccc	%o6,	%o7,	%g7
	umul	%g4,	%i4,	%g1
	brlez	%g5,	loop_1445
loop_1444:
	sdivcc	%i2,	0x19D1,	%l4
	nop
	setx	loop_1446,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
loop_1445:
	fnor	%f14,	%f12,	%f6
	popc	0x0325,	%g3
loop_1446:
	xnorcc	%l5,	%g6,	%l3
	fnand	%f20,	%f20,	%f16
	nop
	set	0x14, %i4
	stw	%l6,	[%l7 + %i4]
	edge16l	%o2,	%i7,	%o1
	fmovd	%f12,	%f18
	fblg	%fcc0,	loop_1447
	fpsub32	%f18,	%f10,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%i6,	%i5
loop_1447:
	edge16n	%o4,	%l1,	%l0
	movrgz	%i0,	%i1,	%o3
	brgez,a	%o5,	loop_1448
	srax	%o0,	%g2,	%i3
	ldd	[%l7 + 0x58],	%f26
	bl,a,pt	%icc,	loop_1449
loop_1448:
	array16	%o6,	%l2,	%o7
	nop
	setx	loop_1450,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fpadd16s	%f3,	%f22,	%f7
loop_1449:
	and	%g4,	0x0FC3,	%i4
	subcc	%g7,	0x15E8,	%g1
loop_1450:
	fxnor	%f30,	%f28,	%f30
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	fmovsle	%xcc,	%f10,	%f10
	fcmpgt32	%f18,	%f4,	%i2
	movne	%xcc,	%l4,	%g3
	sdivcc	%l5,	0x00B9,	%g6
	swap	[%l7 + 0x1C],	%l3
	fbo,a	%fcc2,	loop_1451
	movgu	%icc,	%l6,	%o2
	edge8l	%g5,	%i7,	%o1
	orcc	%i5,	%i6,	%l1
loop_1451:
	xnor	%l0,	%o4,	%i1
	edge16ln	%i0,	%o5,	%o0
	fmovrslez	%o3,	%f26,	%f27
	fnegs	%f23,	%f18
	srl	%g2,	0x06,	%o6
	nop 	! 	taddcc	%i3,	%l2,	%o7 changed by convert2hboot
	add	%i4,	%g4,	%g1
	addc	%i2,	0x11F4,	%l4
	nop 	! 	taddcctv	%g3,	0x0775,	%l5 changed by convert2hboot
	ld	[%l7 + 0x34],	%f30
	mova	%icc,	%g6,	%g7
	edge8n	%l6,	%o2,	%l3
	orn	%i7,	%g5,	%i5
	set	0x37, %i6
	nop	 ! 	stba	%o1,	[%l7 + %i6] 0x2f ASI use changed by convert2hboot
	membar	#Sync
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
	fmovsn	%icc,	%f16,	%f15
	movn	%icc,	%l1,	%l0
	array8	%o4,	%i1,	%i0
	orncc	%o5,	%o0,	%o3
	or	%i6,	0x1944,	%o6
	umul	%g2,	0x1158,	%l2
	xorcc	%i3,	0x1DDA,	%i4
	movrgez	%o7,	0x00F,	%g1
	wr	%g0,	0x04,	%asi
	edge32	%i2,	%g3,	%l4
	wr	%g0,	0xf9,	%asi
	membar	#Sync
	movrne	%g6,	%l5,	%l6
	edge32	%o2,	%g7,	%i7
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	bcs,a,pt	%xcc,	loop_1452
	brlez,a	%l3,	loop_1453
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
	andcc	%g5,	0x1F8D,	%i5
loop_1452:
	fmovsa	%xcc,	%f22,	%f11
loop_1453:
	movneg	%icc,	%l1,	%o1
	movgu	%icc,	%o4,	%i1
	wr	%g0,	0x81,	%asi
	xorcc	%l0,	%o0,	%o5
	addcc	%o3,	0x1A9A,	%i6
	fzero	%f18
	movcs	%xcc,	%g2,	%o6
	set	0x68, %i2
	nop	 ! 	stxa	%i3,	[%l7 + %i2] 0xea ASI use changed by convert2hboot
	membar	#Sync
	fmovdneg	%icc,	%f4,	%f13
	stw	%i4,	[%l7 + 0x30]
	bpos,a	%icc,	loop_1454
	movn	%xcc,	%o7,	%g1
	movcc	%xcc,	%g4,	%i2
	sdivcc	%g3,	0x13BD,	%l4
loop_1454:
	sdivx	%l2,	0x1C00,	%l5
	set	0x67, %o3
	nop	 ! 	ldsba	[%l7 + %o3] 0x04,	%g6 ASI use changed by convert2hboot
	sllx	%l6,	0x01,	%o2
	edge32n	%g7,	%i7,	%l3
	ldub	[%l7 + 0x33],	%g5
	ldstub	[%l7 + 0x27],	%i5
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
	fcmpeq32	%f30,	%f18,	%o1
	nop 	! 	sir	0x15C8 changed by convert2hboot
	fbuge,a	%fcc0,	loop_1455
	std	%l0,	[%l7 + 0x28]
	srl	%i1,	0x0A,	%o4
	membar	#Sync
	set	0x40, %l1
	nop	 ! 	ldda	[%l7 + %l1] 0xf0,	%f16 ASI use changed by convert2hboot
loop_1455:
	brlez	%i0,	loop_1456
	xorcc	%o0,	%o5,	%o3
	fmovscs	%xcc,	%f4,	%f8
	alignaddrl	%l0,	%g2,	%i6
loop_1456:
	alignaddrl	%i3,	%i4,	%o6
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%o7,	%g4
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	array16	%i2,	%g3,	%l4
	bneg	loop_1457
	xor	%l2,	0x0328,	%l5
	nop 	! 	sir	0x03DA changed by convert2hboot
	std	%f16,	[%l7 + 0x28]
loop_1457:
	fmovdvs	%xcc,	%f30,	%f9
	popc	0x0108,	%g6
	fexpand	%f17,	%f24
	sethi	0x038F,	%g1
	udiv	%l6,	0x0E21,	%o2
	fbn,a	%fcc3,	loop_1458
	xorcc	%i7,	0x1C9C,	%l3
	and	%g7,	0x0007,	%i5
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
loop_1458:
	nop
	set	0x0E, %i1
	lduh	[%l7 + %i1],	%o1
	set	0x1C, %g3
	nop	 ! 	ldswa	[%l7 + %g3] 0x15,	%l1 ASI use changed by convert2hboot
	mova	%icc,	%g5,	%o4
	fpack16	%f12,	%f31
	ldd	[%l7 + 0x40],	%f16
	nop 	! 	taddcc	%i1,	0x1A33,	%i0 changed by convert2hboot
	edge16l	%o0,	%o3,	%o5
	fcmpeq16	%f20,	%f14,	%g2
	ldub	[%l7 + 0x22],	%l0
	mulscc	%i3,	0x1D42,	%i4
	fmovdn	%xcc,	%f26,	%f1
	movvc	%xcc,	%i6,	%o7
	edge8l	%o6,	%i2,	%g3
	std	%l4,	[%l7 + 0x28]
	nop 	! 	sir	0x0CA5 changed by convert2hboot
	fandnot1s	%f30,	%f16,	%f5
	fabss	%f9,	%f31
	fmul8x16au	%f22,	%f31,	%f22
	fmovsgu	%icc,	%f28,	%f17
	orn	%l2,	%l5,	%g6
	subcc	%g1,	%l6,	%o2
	fba	%fcc1,	loop_1459
	movrgez	%g4,	0x34C,	%i7
	fmovsvs	%icc,	%f27,	%f26
	nop 	! 	tsubcc	%g7,	%l3,	%i5 changed by convert2hboot
loop_1459:
	brnz,a	%o1,	loop_1460
	andncc	%g5,	%o4,	%l1
	set	0x13, %o7
	nop	 ! 	ldsba	[%l7 + %o7] 0x0c,	%i1 ASI use changed by convert2hboot
loop_1460:
	addc	%i0,	0x19DB,	%o0
	fcmple16	%f28,	%f22,	%o5
	brgez	%o3,	loop_1461
	movre	%g2,	0x3A0,	%l0
	set	0x3B, %l5
	nop	 ! 	ldstuba	[%l7 + %l5] 0x89,	%i4 ASI use changed by convert2hboot
loop_1461:
	nop
	wr	%g0,	0x80,	%asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o7,	%i3,	%i2
	subc	%o6,	%g3,	%l2
	fbn	%fcc0,	loop_1462
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	fnors	%f8,	%f20,	%f21
	movvc	%icc,	%l5,	%g6
loop_1462:
	smulcc	%g1,	%l4,	%o2
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
	srl	%g4,	%i7,	%l6
	fblg	%fcc2,	loop_1463
	movl	%xcc,	%g7,	%i5
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
	fbne,a	%fcc2,	loop_1464
loop_1463:
	array32	%l3,	%g5,	%o4
	wr	%g0,	0x24,	%asi
loop_1464:
	ldsh	[%l7 + 0x68],	%i1
	bleu	loop_1465
	udivcc	%i0,	0x0271,	%o0
	edge32n	%o5,	%o3,	%g2
	ldd	[%l7 + 0x48],	%l0
loop_1465:
	movcc	%xcc,	%l1,	%i4
	alignaddr	%o7,	%i3,	%i6
	addc	%i2,	0x0CEA,	%o6
	fcmped	%fcc0,	%f20,	%f2
	fpack32	%f26,	%f22,	%f26
	membar	0x10
	edge32n	%l2,	%l5,	%g3
	fble	%fcc3,	loop_1466
	edge32ln	%g6,	%l4,	%o2
	alignaddr	%g1,	%i7,	%l6
	edge8ln	%g7,	%i5,	%l3
loop_1466:
	addc	%g4,	0x17CD,	%o4
	fba,a	%fcc1,	loop_1467
	sdivcc	%o1,	0x1D64,	%i1
	ldsw	[%l7 + 0x6C],	%i0
	fmul8x16al	%f30,	%f6,	%f26
loop_1467:
	sdivx	%g5,	0x1A70,	%o0
	set	0x74, %o5
	nop	 ! 	ldswa	[%l7 + %o5] 0x81,	%o5 ASI use changed by convert2hboot
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
	xorcc	%g2,	0x154B,	%l0
	movne	%xcc,	%o3,	%l1
	wr	%g0,	0x18,	%asi
	sta	%f3,	[%l7 + 0x4C] %asi
	movn	%xcc,	%o7,	%i3
	fmovdgu	%xcc,	%f27,	%f10
	set	0x24, %i5
	lda	[%l7 + %i5] 0x18,	%f3
	fmovrdlz	%i4,	%f20,	%f2
	nop 	! 	tvs	%icc,	0x5 changed by convert2hboot
	fpsub16s	%f20,	%f30,	%f3
	brgez	%i2,	loop_1468
	edge32	%i6,	%o6,	%l5
	set	0x68, %g6
	nop	 ! 	lduha	[%l7 + %g6] 0x88,	%l2 ASI use changed by convert2hboot
loop_1468:
	nop
	set	0x75, %o4
	nop	 ! 	lduba	[%l7 + %o4] 0x18,	%g3 ASI use changed by convert2hboot
	addcc	%g6,	0x170F,	%l4
	nop 	! 	sir	0x1B66 changed by convert2hboot
	wr	%g0,	0x0c,	%asi
	movg	%icc,	%g1,	%i7
	sra	%g7,	0x1D,	%i5
	fmul8x16	%f19,	%f4,	%f8
	sllx	%l6,	%l3,	%o4
	nop
	setx	loop_1469,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	movcc	%xcc,	%g4,	%i1
	fmovdle	%icc,	%f30,	%f6
loop_1469:
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	movge	%icc,	%i0,	%o1
	sdivcc	%o0,	0x0C6D,	%o5
	ldd	[%l7 + 0x20],	%g4
	movneg	%xcc,	%g2,	%o3
	nop 	! 	tpos	%icc,	0x3 changed by convert2hboot
	set	0x7C, %g1
	nop	 ! 	swapa	[%l7 + %g1] 0x89,	%l0 ASI use changed by convert2hboot
	ldsb	[%l7 + 0x73],	%o7
	movrgez	%l1,	0x257,	%i4
	movge	%xcc,	%i3,	%i6
	swap	[%l7 + 0x70],	%i2
	array32	%l5,	%l2,	%o6
	fmul8x16	%f28,	%f30,	%f24
	nop 	! 	tsubcctv	%g6,	%l4,	%o2 changed by convert2hboot
	smulcc	%g3,	0x1D41,	%i7
	popc	%g1,	%i5
	fmovsle	%xcc,	%f24,	%f10
	movl	%icc,	%g7,	%l6
	fmuld8ulx16	%f17,	%f12,	%f20
	nop
	setx	loop_1470,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fcmpeq16	%f18,	%f12,	%o4
	srl	%g4,	0x10,	%l3
	nop
	setx	loop_1471,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_1470:
	std	%i0,	[%l7 + 0x70]
	edge16ln	%i0,	%o1,	%o0
	srlx	%g5,	%g2,	%o3
loop_1471:
	edge16n	%o5,	%l0,	%l1
	movleu	%icc,	%o7,	%i4
	mulx	%i3,	0x1A1D,	%i6
	movrgez	%i2,	0x1A3,	%l2
	orcc	%o6,	%g6,	%l4
	lduw	[%l7 + 0x78],	%o2
	set	0x28, %g7
	nop	 ! 	stwa	%g3,	[%l7 + %g7] 0x88 ASI use changed by convert2hboot
	addc	%i7,	0x1134,	%l5
	edge16l	%g1,	%g7,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%l6,	%g4
	bvs	loop_1472
	bvs	loop_1473
	nop 	! 	taddcctv	%o4,	0x1EC3,	%l3 changed by convert2hboot
	prefetch	[%l7 + 0x24],	 0x1
loop_1472:
	fbge,a	%fcc3,	loop_1474
loop_1473:
	sll	%i0,	%i1,	%o1
	srax	%g5,	0x03,	%o0
	fpadd16s	%f23,	%f13,	%f27
loop_1474:
	orncc	%o3,	%o5,	%l0
	fxors	%f8,	%f13,	%f25
	bneg	loop_1475
	fpsub32	%f16,	%f22,	%f8
	sll	%g2,	0x1D,	%o7
	edge16ln	%i4,	%i3,	%l1
loop_1475:
	movcc	%icc,	%i2,	%i6
	edge32	%l2,	%o6,	%g6
	call	loop_1476
	movn	%icc,	%l4,	%o2
	fcmple32	%f2,	%f4,	%g3
	fbue,a	%fcc2,	loop_1477
loop_1476:
	udivcc	%l5,	0x11B1,	%i7
	fone	%f20
	fandnot1s	%f11,	%f17,	%f21
loop_1477:
	nop
	set	0x2A, %o1
	nop	 ! 	stha	%g1,	[%l7 + %o1] 0x11 ASI use changed by convert2hboot
	fone	%f22
	movrlz	%g7,	%i5,	%g4
	fmovrsgz	%l6,	%f1,	%f22
	xnor	%o4,	0x0E1E,	%i0
	bg,pt	%xcc,	loop_1478
	movcs	%xcc,	%l3,	%o1
	movge	%icc,	%g5,	%i1
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
loop_1478:
	sdivx	%o0,	0x153C,	%o3
	edge8l	%o5,	%l0,	%g2
	edge8	%i4,	%o7,	%l1
	ldsh	[%l7 + 0x60],	%i3
	nop 	! 	tgu	%xcc,	0x7 changed by convert2hboot
	set	0x70, %o2
	nop	 ! 	ldswa	[%l7 + %o2] 0x81,	%i2 ASI use changed by convert2hboot
	stb	%l2,	[%l7 + 0x52]
	fmovsle	%xcc,	%f28,	%f27
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	sethi	0x14DA,	%i6
	edge8	%o6,	%g6,	%o2
	fpackfix	%f10,	%f26
	edge32l	%l4,	%g3,	%l5
	fblg,a	%fcc0,	loop_1479
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
	movrne	%i7,	0x17A,	%g1
	nop 	! 	te	%xcc,	0x7 changed by convert2hboot
loop_1479:
	nop
	add	%l7,	0x54,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i5
	fmul8x16au	%f4,	%f6,	%f22
	fxor	%f14,	%f0,	%f16
	nop 	! 	tsubcc	%l6,	0x1E73,	%o4 changed by convert2hboot
	fnors	%f17,	%f27,	%f13
	edge16	%g4,	%i0,	%o1
	nop 	! 	taddcc	%l3,	%g5,	%i1 changed by convert2hboot
	fmovscc	%xcc,	%f28,	%f29
	fxnors	%f26,	%f5,	%f23
	fpadd16	%f18,	%f24,	%f16
	xor	%o3,	0x1DBE,	%o5
	ba	loop_1480
	std	%o0,	[%l7 + 0x58]
	fpadd16	%f10,	%f12,	%f14
	sdivx	%g2,	0x1479,	%l0
loop_1480:
	mulscc	%i4,	0x1489,	%l1
	movrlez	%i3,	%o7,	%l2
	set	0x20, %g5
	nop	 ! 	ldxa	[%l7 + %g5] 0x04,	%i6 ASI use changed by convert2hboot
	fbul,a	%fcc1,	loop_1481
	nop 	! 	taddcctv	%i2,	%o6,	%o2 changed by convert2hboot
	fxor	%f18,	%f8,	%f30
	movn	%xcc,	%l4,	%g3
loop_1481:
	nop 	! 	tg	%xcc,	0x3 changed by convert2hboot
	ble,a,pt	%icc,	loop_1482
	movrgez	%g6,	0x2A2,	%i7
	movrgez	%g1,	%l5,	%g7
	nop 	! 	tl	%icc,	0x5 changed by convert2hboot
loop_1482:
	smul	%l6,	0x01CB,	%i5
	fba,a	%fcc3,	loop_1483
	sdivx	%g4,	0x0C91,	%i0
	sdivcc	%o1,	0x1FAC,	%l3
	fmovsleu	%icc,	%f3,	%f8
loop_1483:
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	movn	%xcc,	%o4,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o3,	%o5,	%i1
	lduh	[%l7 + 0x14],	%o0
	wr	%g0,	0x10,	%asi
	smul	%g2,	0x0F90,	%l1
	set	0x40, %o0
	nop	 ! 	stda	%f16,	[%l7 + %o0] 0x16 ASI use changed by convert2hboot
	membar	#Sync
	fmovsg	%xcc,	%f21,	%f19
	move	%xcc,	%i3,	%o7
	movcc	%xcc,	%i4,	%l2
	popc	%i2,	%o6
	array32	%i6,	%l4,	%g3
	fmovdleu	%icc,	%f15,	%f18
	fmovsne	%xcc,	%f12,	%f17
	nop
	set	0x7C, %l2
	ldsw	[%l7 + %l2],	%g6
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	movvc	%xcc,	%i7,	%o2
	fpadd16	%f28,	%f14,	%f28
	movre	%g1,	%g7,	%l5
	bge,pn	%xcc,	loop_1484
	bvc,a,pn	%xcc,	loop_1485
	nop 	! 	tvs	%icc,	0x6 changed by convert2hboot
	movrgez	%i5,	%g4,	%l6
loop_1484:
	movrlez	%i0,	%o1,	%l3
loop_1485:
	fandnot1	%f2,	%f2,	%f14
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
	nop
	setx	loop_1486,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	subccc	%o4,	0x0762,	%g5
	sub	%o5,	0x1960,	%o3
	sethi	0x0012,	%i1
loop_1486:
	movn	%icc,	%o0,	%g2
	edge16ln	%l1,	%i3,	%o7
	bleu	%icc,	loop_1487
	bgu,pt	%icc,	loop_1488
	fmovsa	%xcc,	%f12,	%f0
	fpsub16	%f28,	%f0,	%f26
loop_1487:
	fmul8x16	%f25,	%f28,	%f6
loop_1488:
	ldsh	[%l7 + 0x4E],	%l0
	movvs	%xcc,	%i4,	%l2
	sdivx	%o6,	0x14CF,	%i2
	fandnot2s	%f12,	%f21,	%f26
	be	%xcc,	loop_1489
	subc	%l4,	0x1E00,	%i6
	fxors	%f2,	%f25,	%f7
	fblg,a	%fcc0,	loop_1490
loop_1489:
	movleu	%icc,	%g6,	%i7
	fexpand	%f30,	%f24
	fornot1	%f12,	%f14,	%f8
loop_1490:
	movrlz	%o2,	%g3,	%g1
	and	%l5,	%g7,	%g4
	movcs	%icc,	%l6,	%i0
	fcmpeq32	%f18,	%f10,	%i5
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	fmovdl	%xcc,	%f9,	%f23
	fmovrsgz	%l3,	%f31,	%f6
	subccc	%o4,	0x102F,	%o1
	fbg,a	%fcc0,	loop_1491
	edge16	%o5,	%g5,	%o3
	fmovrdgz	%i1,	%f20,	%f30
	edge32n	%g2,	%l1,	%i3
loop_1491:
	ba	loop_1492
	fcmpne32	%f14,	%f2,	%o0
	fmovsne	%xcc,	%f2,	%f30
	edge32n	%o7,	%i4,	%l2
loop_1492:
	fmovdge	%xcc,	%f3,	%f24
	fmovrslz	%l0,	%f10,	%f2
	array8	%i2,	%o6,	%i6
	fbo,a	%fcc0,	loop_1493
	fmovsgu	%xcc,	%f25,	%f10
	brlez,a	%g6,	loop_1494
	fnot2	%f6,	%f10
loop_1493:
	edge16l	%l4,	%i7,	%g3
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
loop_1494:
	bvs,a	%xcc,	loop_1495
	movg	%icc,	%o2,	%g1
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	sllx	%g7,	0x0A,	%g4
loop_1495:
	fabss	%f19,	%f27
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
	fbo,a	%fcc2,	loop_1496
	umulcc	%l5,	0x02A3,	%l6
	fcmpgt32	%f28,	%f2,	%i0
	nop 	! 	tsubcc	%i5,	%l3,	%o1 changed by convert2hboot
loop_1496:
	movg	%xcc,	%o4,	%g5
	set	0x43, %l3
	nop	 ! 	lduba	[%l7 + %l3] 0x10,	%o3 ASI use changed by convert2hboot
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	ldx	[%l7 + 0x28],	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz,a	%g2,	loop_1497
	nop 	! 	tvc	%xcc,	0x7 changed by convert2hboot
	movle	%xcc,	%o5,	%l1
	brgz,a	%o0,	loop_1498
loop_1497:
	fbn	%fcc3,	loop_1499
	movg	%icc,	%i3,	%i4
	movg	%icc,	%o7,	%l2
loop_1498:
	udiv	%l0,	0x11AE,	%i2
loop_1499:
	ba,pn	%icc,	loop_1500
	array32	%i6,	%o6,	%l4
	xnor	%i7,	%g6,	%g3
	edge32n	%o2,	%g7,	%g1
loop_1500:
	movne	%xcc,	%g4,	%l5
	sra	%l6,	0x1F,	%i0
	wr	%g0,	0xe3,	%asi
	membar	#Sync
	fmovdle	%xcc,	%f30,	%f0
	movvc	%xcc,	%i5,	%o1
	xnorcc	%o4,	0x1DF6,	%o3
	nop 	! 	tg	%xcc,	0x4 changed by convert2hboot
	umulcc	%i1,	%g2,	%g5
	movn	%xcc,	%o5,	%o0
	fand	%f28,	%f2,	%f26
	bl,a	%xcc,	loop_1501
	sub	%i3,	0x01F7,	%i4
	fsrc1	%f0,	%f0
	fmovrdgez	%o7,	%f4,	%f24
loop_1501:
	fmovsneg	%xcc,	%f17,	%f27
	fcmpeq32	%f2,	%f26,	%l1
	movrlez	%l2,	0x286,	%l0
	swap	[%l7 + 0x54],	%i6
	move	%icc,	%i2,	%l4
	addccc	%i7,	%o6,	%g3
	array16	%o2,	%g7,	%g6
	ldstub	[%l7 + 0x7E],	%g4
	movrgz	%g1,	%l5,	%l6
	addcc	%l3,	%i5,	%i0
	movrgz	%o1,	%o4,	%i1
	fbge,a	%fcc1,	loop_1502
	movrlz	%g2,	%o3,	%o5
	fbge,a	%fcc2,	loop_1503
	movrgz	%g5,	0x352,	%o0
loop_1502:
	udiv	%i4,	0x080D,	%o7
	fxor	%f2,	%f2,	%f12
loop_1503:
	fmovdg	%icc,	%f15,	%f21
	movne	%xcc,	%l1,	%l2
	move	%icc,	%i3,	%l0
	fors	%f24,	%f8,	%f7
	fmovdge	%icc,	%f2,	%f19
	nop 	! 	ta	%xcc,	0x5 changed by convert2hboot
	movcc	%xcc,	%i6,	%l4
	movpos	%icc,	%i7,	%o6
	fbue,a	%fcc1,	loop_1504
	std	%g2,	[%l7 + 0x58]
	fmovdvs	%icc,	%f10,	%f12
	nop 	! 	tleu	%xcc,	0x7 changed by convert2hboot
loop_1504:
	xnor	%i2,	%g7,	%g6
	nop 	! 	sir	0x1500 changed by convert2hboot
	fmovdgu	%icc,	%f21,	%f21
	alignaddrl	%o2,	%g4,	%g1
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	movne	%icc,	%l6,	%l3
	movg	%xcc,	%i5,	%i0
	andcc	%l5,	0x101E,	%o1
	ldstub	[%l7 + 0x3D],	%o4
	ldub	[%l7 + 0x47],	%g2
	edge16l	%i1,	%o3,	%g5
	fba,a	%fcc1,	loop_1505
	ldx	[%l7 + 0x40],	%o0
	fnot2s	%f27,	%f16
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
loop_1505:
	bn	loop_1506
	edge32	%i4,	%o7,	%o5
	stx	%l2,	[%l7 + 0x08]
	or	%l1,	0x1E49,	%l0
loop_1506:
	xor	%i6,	0x02B7,	%i3
	fmovrsne	%i7,	%f0,	%f25
	swap	[%l7 + 0x20],	%o6
	movrgz	%g3,	%i2,	%g7
	orncc	%l4,	0x0C77,	%o2
	edge8ln	%g4,	%g6,	%l6
	st	%f2,	[%l7 + 0x5C]
	fnot1	%f28,	%f16
	fbuge	%fcc1,	loop_1507
	fba	%fcc3,	loop_1508
	fmovrslz	%g1,	%f11,	%f2
	fxor	%f10,	%f22,	%f4
loop_1507:
	fmul8x16al	%f16,	%f27,	%f2
loop_1508:
	movcs	%icc,	%l3,	%i5
	fbg,a	%fcc2,	loop_1509
	fmovrdgz	%i0,	%f22,	%f28
	addccc	%l5,	0x1AC9,	%o1
	fpsub32	%f20,	%f28,	%f14
loop_1509:
	sdivcc	%o4,	0x06FB,	%i1
	movneg	%xcc,	%o3,	%g2
	sllx	%o0,	0x1D,	%i4
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
	wr	%g0,	0x88,	%asi
	movvc	%xcc,	%o5,	%o7
	movcc	%icc,	%l2,	%l0
	bcc	%icc,	loop_1510
	nop
	setx loop_1511, %l0, %l1
	jmpl %l1, %i6
	movle	%xcc,	%l1,	%i3
	nop 	! 	tcs	%xcc,	0x5 changed by convert2hboot
loop_1510:
	subccc	%o6,	0x15BC,	%i7
loop_1511:
	movrlez	%i2,	0x349,	%g3
	udivx	%g7,	0x025F,	%l4
	subcc	%g4,	%o2,	%l6
	edge16	%g6,	%l3,	%i5
	mulscc	%g1,	%i0,	%l5
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	movrgez	%o1,	%i1,	%o4
	fmovdgu	%icc,	%f14,	%f12
	movrgez	%g2,	%o3,	%o0
	xor	%g5,	0x0439,	%i4
	nop 	! 	tsubcc	%o5,	0x16D4,	%o7 changed by convert2hboot
	edge32l	%l2,	%i6,	%l0
	alignaddr	%l1,	%i3,	%o6
	mova	%icc,	%i7,	%g3
	array32	%g7,	%i2,	%g4
	sdivcc	%l4,	0x1C0E,	%l6
	fmovsvc	%xcc,	%f27,	%f13
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
	array8	%g6,	%o2,	%l3
	fmovsvc	%xcc,	%f17,	%f27
	sra	%i5,	%i0,	%g1
	set	0x30, %g2
	nop	 ! 	ldstuba	[%l7 + %g2] 0x04,	%o1 ASI use changed by convert2hboot
	brz	%i1,	loop_1512
	movre	%o4,	0x2B5,	%g2
	fmovrslez	%o3,	%f23,	%f23
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
loop_1512:
	addc	%l5,	%g5,	%o0
	edge32n	%o5,	%i4,	%l2
	membar	0x36
	set	0x18, %l6
	nop	 ! 	ldsha	[%l7 + %l6] 0x15,	%i6 ASI use changed by convert2hboot
	fmovrsgez	%l0,	%f12,	%f20
	nop
	setx	loop_1513,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fmovdleu	%xcc,	%f21,	%f18
	movrlez	%o7,	%l1,	%o6
	array32	%i7,	%g3,	%g7
loop_1513:
	fmovrdlez	%i2,	%f18,	%f6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g4
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x4C] %asi,	%f14
	call	loop_1514
	bge,a	loop_1515
	movne	%icc,	%l4,	%l6
	mova	%xcc,	%g6,	%o2
loop_1514:
	andcc	%i5,	%i0,	%g1
loop_1515:
	nop
	wr	%g0,	0x18,	%asi
	brnz	%l3,	loop_1516
	movpos	%xcc,	%o4,	%i1
	fcmpd	%fcc1,	%f26,	%f6
	andcc	%g2,	0x1750,	%l5
loop_1516:
	or	%g5,	%o3,	%o5
	umulcc	%o0,	0x03A2,	%l2
	fmovdleu	%xcc,	%f27,	%f7
	wr	%g0,	0x2b,	%asi
	membar	#Sync
	movg	%xcc,	%l0,	%i6
	andncc	%o7,	%o6,	%l1
	fbge,a	%fcc0,	loop_1517
	fmovsg	%icc,	%f12,	%f21
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
	sdiv	%g3,	0x0DC4,	%g7
loop_1517:
	fbule,a	%fcc2,	loop_1518
	fmovdle	%xcc,	%f11,	%f13
	set	0x18, %g4
	nop	 ! 	lduha	[%l7 + %g4] 0x04,	%i7 ASI use changed by convert2hboot
loop_1518:
	movre	%g4,	%i3,	%i2
	wr	%g0,	0x18,	%asi
	fmovdne	%icc,	%f19,	%f0
	nop 	! 	taddcctv	%l6,	%g6,	%i5 changed by convert2hboot
	bn,a	loop_1519
	fmovsn	%xcc,	%f0,	%f15
	sra	%o2,	%g1,	%o1
	movcc	%xcc,	%i0,	%o4
loop_1519:
	fabsd	%f2,	%f18
	nop 	! 	tg	%xcc,	0x2 changed by convert2hboot
	umul	%l3,	0x0543,	%i1
	fcmps	%fcc3,	%f22,	%f26
	nop
	setx	loop_1520,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fmovsa	%xcc,	%f26,	%f21
	movre	%l5,	%g5,	%o3
	fmovspos	%icc,	%f9,	%f7
loop_1520:
	bl,pt	%xcc,	loop_1521
	orcc	%g2,	%o5,	%l2
	subccc	%o0,	0x05BC,	%l0
	alignaddr	%i6,	%i4,	%o7
loop_1521:
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	movpos	%xcc,	%o6,	%g3
	movn	%xcc,	%g7,	%l1
	stx	%g4,	[%l7 + 0x18]
	be,a,pt	%xcc,	loop_1522
	array32	%i3,	%i7,	%l4
	fmovda	%xcc,	%f24,	%f3
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
loop_1522:
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	sdivx	%l6,	0x1790,	%i2
	fcmpeq32	%f10,	%f26,	%i5
	fxor	%f16,	%f12,	%f0
	array16	%o2,	%g6,	%g1
	edge16	%i0,	%o1,	%l3
	subcc	%i1,	%o4,	%l5
	stx	%g5,	[%l7 + 0x58]
	fpsub16s	%f26,	%f12,	%f30
	fmovrslz	%o3,	%f3,	%f5
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	set	0x22, %i0
	nop	 ! 	lduba	[%l7 + %i0] 0x88,	%o5 ASI use changed by convert2hboot
	and	%l2,	%g2,	%l0
	fpmerge	%f16,	%f25,	%f8
	swap	[%l7 + 0x54],	%i6
	sdivcc	%o0,	0x188F,	%i4
	bvc	%icc,	loop_1523
	movg	%icc,	%o7,	%o6
	brz,a	%g3,	loop_1524
	call	loop_1525
loop_1523:
	ld	[%l7 + 0x40],	%f28
	fblg,a	%fcc2,	loop_1526
loop_1524:
	srlx	%g7,	%g4,	%i3
loop_1525:
	nop
	set	0x40, %l4
	nop	 ! 	ldda	[%l7 + %l4] 0x15,	%f16 ASI use changed by convert2hboot
loop_1526:
	movle	%icc,	%l1,	%l4
	edge16l	%i7,	%i2,	%i5
	fmovsn	%xcc,	%f22,	%f2
	movvc	%xcc,	%o2,	%g6
	wr	%g0,	0x80,	%asi
	movl	%icc,	%i0,	%o1
	movg	%icc,	%l3,	%g1
	fbo	%fcc0,	loop_1527
	xor	%o4,	0x1CD0,	%i1
	sth	%l5,	[%l7 + 0x0E]
	fmuld8sux16	%f13,	%f31,	%f14
loop_1527:
	or	%g5,	%o5,	%l2
	edge16n	%o3,	%g2,	%i6
	set	0x6C, %l0
	nop	 ! 	ldsha	[%l7 + %l0] 0x11,	%o0 ASI use changed by convert2hboot
	subcc	%i4,	0x07A9,	%o7
	fmul8x16au	%f17,	%f11,	%f16
	andncc	%o6,	%l0,	%g3
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
	edge16n	%g7,	%g4,	%i3
	bpos,a	%icc,	loop_1528
	smulcc	%l1,	0x1B1A,	%l4
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	smul	%i7,	%i2,	%o2
loop_1528:
	xorcc	%g6,	0x15F2,	%i5
	add	%l6,	0x03BD,	%o1
	wr	%g0,	0x89,	%asi
	set	0x6C, %i3
	nop	 ! 	lduwa	[%l7 + %i3] 0x04,	%g1 ASI use changed by convert2hboot
	stw	%i0,	[%l7 + 0x48]
	andcc	%i1,	%l5,	%o4
	addccc	%o5,	0x077E,	%g5
	add	%o3,	0x1CAE,	%l2
	subcc	%i6,	%g2,	%o0
	call	loop_1529
	fsrc1s	%f25,	%f13
	addc	%i4,	0x1AF5,	%o7
	nop 	! 	tvs	%xcc,	0x6 changed by convert2hboot
loop_1529:
	fabss	%f11,	%f21
	ldsb	[%l7 + 0x3C],	%o6
	fbul	%fcc1,	loop_1530
	edge8l	%g3,	%l0,	%g4
	set	0x4C, %o6
	nop	 ! 	swapa	[%l7 + %o6] 0x80,	%i3 ASI use changed by convert2hboot
loop_1530:
	orncc	%g7,	%l4,	%i7
	bg,a	loop_1531
	fmovsle	%xcc,	%f19,	%f11
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
	fmul8sux16	%f0,	%f18,	%f24
loop_1531:
	addc	%l1,	%o2,	%g6
	xor	%i5,	0x1376,	%l6
	siam	0x5
	swap	[%l7 + 0x48],	%o1
	nop 	! 	sir	0x13FE changed by convert2hboot
	sdivx	%i2,	0x0F76,	%g1
	addc	%l3,	%i1,	%i0
	orcc	%o4,	0x142E,	%o5
	ble,a	loop_1532
	movne	%xcc,	%g5,	%o3
	edge8n	%l5,	%l2,	%i6
	ble,pt	%icc,	loop_1533
loop_1532:
	brlez,a	%g2,	loop_1534
	nop 	! 	tsubcc	%i4,	0x0002,	%o0 changed by convert2hboot
	wr	%g0,	0x0c,	%asi
loop_1533:
	movcc	%icc,	%o7,	%l0
loop_1534:
	srl	%g4,	%g3,	%g7
	movrne	%l4,	0x178,	%i7
	fcmps	%fcc3,	%f6,	%f28
	fandnot1s	%f23,	%f27,	%f23
	movgu	%icc,	%i3,	%l1
	sethi	0x0BED,	%g6
	bgu	%icc,	loop_1535
	andcc	%o2,	%l6,	%i5
	fbug	%fcc3,	loop_1536
	addc	%o1,	%g1,	%i2
loop_1535:
	mulscc	%i1,	%l3,	%i0
	sub	%o5,	%g5,	%o4
loop_1536:
	sra	%l5,	0x18,	%o3
	movl	%xcc,	%i6,	%l2
	nop 	! 	tpos	%xcc,	0x1 changed by convert2hboot
	brz,a	%g2,	loop_1537
	stw	%o0,	[%l7 + 0x38]
	fcmped	%fcc1,	%f26,	%f28
	set	0x1E, %i4
	nop	 ! 	stha	%o6,	[%l7 + %i4] 0x80 ASI use changed by convert2hboot
loop_1537:
	udivx	%i4,	0x0C3A,	%o7
	nop 	! 	tvs	%icc,	0x5 changed by convert2hboot
	movrlz	%g4,	0x043,	%l0
	nop 	! 	tvc	%xcc,	0x3 changed by convert2hboot
	brz,a	%g7,	loop_1538
	fmovrsne	%l4,	%f12,	%f30
	fcmpd	%fcc2,	%f6,	%f30
	edge16ln	%i7,	%g3,	%l1
loop_1538:
	addccc	%i3,	0x0A65,	%g6
	movgu	%xcc,	%o2,	%l6
	andn	%o1,	0x03E5,	%i5
	fmovrdne	%i2,	%f6,	%f20
	movleu	%icc,	%g1,	%l3
	srl	%i1,	%i0,	%g5
	array32	%o5,	%l5,	%o3
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
	nop 	! 	ta	%icc,	0x7 changed by convert2hboot
	fmul8sux16	%f2,	%f22,	%f28
	mulx	%i6,	0x0F7F,	%l2
	bn	%icc,	loop_1539
	edge16	%g2,	%o4,	%o0
	membar	0x3D
	fmovsl	%icc,	%f17,	%f24
loop_1539:
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	fmovdvc	%xcc,	%f7,	%f6
	addcc	%o6,	%o7,	%i4
	bn,a	loop_1540
	fbule,a	%fcc3,	loop_1541
	fmovrsgez	%g4,	%f18,	%f18
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
loop_1540:
	movre	%l0,	0x23D,	%g7
loop_1541:
	edge32l	%l4,	%g3,	%i7
	wr	%g0,	0xeb,	%asi
	sth	%g6,	[%l7 + 0x40]
	edge8	%o2,	%i3,	%l6
	fnand	%f2,	%f12,	%f14
	movne	%icc,	%o1,	%i2
	fmovsleu	%icc,	%f9,	%f19
	fors	%f31,	%f7,	%f11
	fmovdleu	%xcc,	%f18,	%f22
	array8	%g1,	%i5,	%i1
	fxnors	%f15,	%f18,	%f22
	wr	%g0,	0x04,	%asi
	xorcc	%g5,	0x1FBD,	%o5
	fmul8sux16	%f26,	%f8,	%f28
	fmovrsne	%i0,	%f14,	%f27
	sll	%l5,	%o3,	%l2
	set	0x38, %i6
	sta	%f27,	[%l7 + %i6] 0x04
	movrne	%g2,	%o4,	%i6
	popc	0x1E03,	%o6
	xor	%o0,	%i4,	%o7
	udiv	%g4,	0x0ED2,	%g7
	for	%f10,	%f28,	%f2
	movrgz	%l4,	%g3,	%i7
	xnor	%l1,	%l0,	%g6
	addccc	%i3,	%l6,	%o2
	bgu,a,pt	%xcc,	loop_1542
	stx	%o1,	[%l7 + 0x58]
	fmovdn	%xcc,	%f5,	%f26
	fble	%fcc1,	loop_1543
loop_1542:
	nop 	! 	tneg	%xcc,	0x2 changed by convert2hboot
	nop 	! 	sir	0x0C01 changed by convert2hboot
	fmovsvs	%xcc,	%f4,	%f0
loop_1543:
	smul	%g1,	%i5,	%i1
	sdivcc	%i2,	0x1137,	%l3
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
	nop 	! 	taddcc	%g5,	%i0,	%o5 changed by convert2hboot
	movleu	%icc,	%l5,	%o3
	srax	%g2,	%o4,	%l2
	edge32n	%o6,	%i6,	%i4
	brz	%o7,	loop_1544
	edge16	%o0,	%g7,	%g4
	fbn,a	%fcc1,	loop_1545
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1544:
	orn	%g3,	%l4,	%l1
	set	0x14, %i7
	sta	%f11,	[%l7 + %i7] 0x11
loop_1545:
	fbug	%fcc3,	loop_1546
	alignaddrl	%i7,	%g6,	%i3
	andncc	%l0,	%o2,	%o1
	siam	0x7
loop_1546:
	fmul8x16al	%f21,	%f31,	%f4
	ldsw	[%l7 + 0x78],	%l6
	addcc	%g1,	0x0107,	%i5
	movrlez	%i1,	0x2E1,	%i2
	movge	%icc,	%l3,	%g5
	move	%icc,	%o5,	%l5
	smulcc	%i0,	%g2,	%o3
	orncc	%o4,	%l2,	%o6
	movrgez	%i6,	0x29A,	%o7
	nop 	! 	tpos	%xcc,	0x4 changed by convert2hboot
	nop 	! 	ta	%xcc,	0x2 changed by convert2hboot
	and	%i4,	0x1FD1,	%o0
	ldub	[%l7 + 0x67],	%g7
	wr	%g0,	0xe2,	%asi
	membar	#Sync
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
	srax	%l4,	0x01,	%g3
	umul	%i7,	0x06ED,	%g6
	udivx	%l1,	0x1006,	%i3
	subcc	%l0,	0x02A8,	%o2
	edge8	%o1,	%g1,	%l6
	siam	0x3
	bne,a,pn	%icc,	loop_1547
	edge8ln	%i1,	%i5,	%i2
	flush	%l7 + 0x44
	fpack16	%f10,	%f15
loop_1547:
	array8	%g5,	%l3,	%o5
	edge32n	%l5,	%g2,	%o3
	movl	%xcc,	%i0,	%l2
	movre	%o4,	0x3AE,	%o6
	movgu	%xcc,	%o7,	%i4
	fpsub16	%f18,	%f30,	%f22
	mulx	%i6,	%g7,	%g4
	umul	%l4,	%o0,	%g3
	sdiv	%i7,	0x1D41,	%l1
	sth	%i3,	[%l7 + 0x5C]
	movneg	%xcc,	%g6,	%l0
	edge8	%o1,	%o2,	%g1
	bgu,a	%xcc,	loop_1548
	bpos,a	%icc,	loop_1549
	fornot1	%f14,	%f0,	%f4
	movl	%xcc,	%l6,	%i1
loop_1548:
	array32	%i2,	%g5,	%l3
loop_1549:
	srlx	%i5,	0x07,	%o5
	movcc	%xcc,	%g2,	%o3
	set	0x18, %i2
	nop	 ! 	ldswa	[%l7 + %i2] 0x18,	%i0 ASI use changed by convert2hboot
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	sllx	%l5,	%o4,	%l2
	flush	%l7 + 0x3C
	bn	loop_1550
	siam	0x7
	movleu	%xcc,	%o6,	%o7
	st	%f29,	[%l7 + 0x74]
loop_1550:
	fmovdl	%xcc,	%f15,	%f2
	pdist	%f6,	%f14,	%f22
	sub	%i4,	0x08E4,	%i6
	add	%g7,	%l4,	%o0
	stw	%g4,	[%l7 + 0x28]
	movvc	%icc,	%g3,	%i7
	edge32ln	%i3,	%l1,	%l0
	fpsub32	%f10,	%f12,	%f26
	edge16n	%o1,	%o2,	%g6
	edge16	%g1,	%l6,	%i2
	sth	%i1,	[%l7 + 0x24]
	movge	%xcc,	%g5,	%l3
	brnz	%o5,	loop_1551
	stb	%i5,	[%l7 + 0x5F]
	nop 	! 	tsubcc	%g2,	0x0DC0,	%i0 changed by convert2hboot
	movg	%xcc,	%l5,	%o3
loop_1551:
	movvc	%icc,	%o4,	%o6
	fbo	%fcc2,	loop_1552
	edge32	%o7,	%i4,	%l2
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
	set	0x30, %l1
	nop	 ! 	ldsba	[%l7 + %l1] 0x89,	%g7 ASI use changed by convert2hboot
loop_1552:
	bl,a,pt	%xcc,	loop_1553
	movrgez	%l4,	0x3D4,	%i6
	fands	%f9,	%f18,	%f25
	wr	%g0,	0x89,	%asi
loop_1553:
	sdivx	%g4,	0x0119,	%i7
	nop 	! 	tvs	%icc,	0x1 changed by convert2hboot
	sll	%i3,	%g3,	%l0
	edge32	%l1,	%o2,	%g6
	wr	%g0,	0x81,	%asi
	fmuld8sux16	%f11,	%f18,	%f14
	andncc	%l6,	%i2,	%i1
	wr	%g0,	0x81,	%asi
	sdiv	%l3,	0x1F90,	%o1
	st	%f18,	[%l7 + 0x60]
	udiv	%i5,	0x00C3,	%g2
	fbule	%fcc1,	loop_1554
	movleu	%xcc,	%o5,	%i0
	addcc	%l5,	0x0181,	%o3
	movge	%icc,	%o6,	%o7
loop_1554:
	srax	%o4,	0x16,	%l2
	sllx	%i4,	%l4,	%g7
	sdivx	%i6,	0x173F,	%o0
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
	udivcc	%g4,	0x04CF,	%i3
	umulcc	%g3,	%l0,	%l1
	movleu	%icc,	%o2,	%g6
	movrne	%g1,	%l6,	%i7
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	fnegs	%f4,	%f6
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	edge16	%i1,	%g5,	%l3
	addcc	%i2,	0x0D78,	%o1
	wr	%g0,	0x89,	%asi
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	fnot1s	%f20,	%f1
	sllx	%o5,	0x13,	%i0
	fand	%f24,	%f26,	%f6
	subc	%l5,	%i5,	%o3
	subcc	%o6,	%o4,	%l2
	fornot1s	%f17,	%f3,	%f20
	sll	%i4,	0x0A,	%l4
	movrgez	%g7,	0x2C8,	%i6
	bcc,pt	%icc,	loop_1555
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o0,	%o7,	%i3
	movleu	%xcc,	%g4,	%g3
loop_1555:
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
	set	0x53, %i1
	nop	 ! 	stba	%l0,	[%l7 + %i1] 0x2a ASI use changed by convert2hboot
	membar	#Sync
	fand	%f6,	%f10,	%f6
	nop 	! 	tvs	%xcc,	0x3 changed by convert2hboot
	edge32l	%o2,	%l1,	%g1
	edge8n	%g6,	%i7,	%l6
	alignaddrl	%g5,	%i1,	%i2
	fzero	%f6
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
	movneg	%xcc,	%o1,	%g2
	fbn,a	%fcc1,	loop_1556
	brnz	%l3,	loop_1557
	edge32n	%o5,	%i0,	%i5
	edge16	%l5,	%o3,	%o4
loop_1556:
	nop 	! 	tsubcc	%l2,	%i4,	%l4 changed by convert2hboot
loop_1557:
	movg	%xcc,	%g7,	%i6
	movle	%xcc,	%o6,	%o0
	subcc	%o7,	%g4,	%g3
	movl	%xcc,	%i3,	%o2
	sub	%l1,	%l0,	%g1
	nop 	! 	ta	%icc,	0x2 changed by convert2hboot
	add	%g6,	%l6,	%g5
	fpadd16s	%f1,	%f15,	%f27
	wr	%g0,	0x04,	%asi
	movcs	%xcc,	%i2,	%o1
	lduh	[%l7 + 0x68],	%g2
	fmul8ulx16	%f0,	%f30,	%f4
	nop 	! 	taddcc	%i7,	%l3,	%o5 changed by convert2hboot
	fmovrsne	%i0,	%f18,	%f12
	fcmps	%fcc1,	%f21,	%f31
	fsrc1s	%f1,	%f29
	add	%i5,	%l5,	%o4
	bn,pn	%xcc,	loop_1558
	movl	%xcc,	%l2,	%o3
	fmovde	%icc,	%f13,	%f16
	fbl	%fcc0,	loop_1559
loop_1558:
	fblg	%fcc3,	loop_1560
	for	%f8,	%f4,	%f2
	fnor	%f16,	%f26,	%f20
loop_1559:
	bl,a	loop_1561
loop_1560:
	sdivx	%i4,	0x1DF5,	%g7
	sdivx	%i6,	0x0EEC,	%l4
	membar	0x06
loop_1561:
	movge	%icc,	%o6,	%o7
	fpackfix	%f12,	%f8
	subcc	%o0,	%g3,	%g4
	fcmpd	%fcc2,	%f30,	%f28
	bneg,a	%xcc,	loop_1562
	fnot2s	%f16,	%f8
	set	0x0C, %g3
	lda	[%l7 + %g3] 0x11,	%f22
loop_1562:
	fcmpgt16	%f14,	%f12,	%o2
	sll	%i3,	0x1B,	%l1
	edge8ln	%g1,	%l0,	%l6
	bne,a,pn	%xcc,	loop_1563
	pdist	%f18,	%f2,	%f24
	edge32ln	%g5,	%g6,	%i2
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
loop_1563:
	fsrc2	%f8,	%f16
	ldub	[%l7 + 0x5B],	%i1
	edge8n	%g2,	%o1,	%i7
	fmovsn	%xcc,	%f18,	%f4
	movrne	%o5,	0x342,	%l3
	edge16	%i0,	%l5,	%o4
	nop 	! 	taddcc	%i5,	0x0076,	%o3 changed by convert2hboot
	mulscc	%l2,	0x1999,	%g7
	xnorcc	%i4,	%i6,	%l4
	orcc	%o6,	0x0202,	%o0
	movne	%xcc,	%g3,	%g4
	movneg	%icc,	%o2,	%i3
	movrgez	%o7,	%l1,	%g1
	brgez,a	%l0,	loop_1564
	fpsub32s	%f27,	%f28,	%f3
	fcmpeq32	%f6,	%f6,	%l6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x11,	%asi
	nop	 ! 	casa	[%l6] 0x11,	%g6,	%g5 ASI use changed by convert2hboot
loop_1564:
	fpmerge	%f13,	%f13,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i1,	%i2,	%o1
	sll	%g2,	%o5,	%l3
	brgz,a	%i7,	loop_1565
	andncc	%l5,	%o4,	%i0
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	smulcc	%i5,	%l2,	%g7
loop_1565:
	fbn,a	%fcc2,	loop_1566
	brlez,a	%o3,	loop_1567
	movrlz	%i4,	0x088,	%l4
	fmovdcc	%xcc,	%f21,	%f31
loop_1566:
	movre	%o6,	0x399,	%i6
loop_1567:
	movne	%xcc,	%o0,	%g4
	fnands	%f21,	%f15,	%f23
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	nop 	! 	te	%icc,	0x0 changed by convert2hboot
	set	0x19, %o3
	nop	 ! 	ldstuba	[%l7 + %o3] 0x0c,	%o2 ASI use changed by convert2hboot
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	movpos	%icc,	%i3,	%g3
	popc	%o7,	%l1
	umul	%g1,	%l6,	%g6
	fmovrdlez	%l0,	%f20,	%f28
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	fornot2	%f6,	%f16,	%f26
	andcc	%g5,	0x15CE,	%i2
	addc	%o1,	0x130D,	%g2
	set	0x3C, %o7
	nop	 ! 	ldswa	[%l7 + %o7] 0x11,	%o5 ASI use changed by convert2hboot
	andncc	%i1,	%l3,	%l5
	pdist	%f2,	%f14,	%f18
	udiv	%i7,	0x1362,	%i0
	and	%o4,	0x18FC,	%l2
	sra	%i5,	0x06,	%o3
	fxnors	%f10,	%f26,	%f8
	mulx	%i4,	%l4,	%g7
	fpsub16s	%f11,	%f6,	%f14
	mulx	%o6,	0x1728,	%o0
	set	0x08, %o5
	nop	 ! 	stwa	%i6,	[%l7 + %o5] 0xea ASI use changed by convert2hboot
	membar	#Sync
	addc	%o2,	0x103A,	%g4
	orcc	%g3,	%o7,	%l1
	fnot2s	%f28,	%f30
	fnot1s	%f30,	%f22
	movrlz	%i3,	0x32B,	%g1
	fnor	%f20,	%f22,	%f30
	fnors	%f4,	%f4,	%f24
	mova	%icc,	%l6,	%l0
	movrlez	%g5,	%g6,	%o1
	fmovrsgez	%i2,	%f1,	%f15
	fandnot1s	%f0,	%f8,	%f7
	umulcc	%o5,	%g2,	%i1
	edge32	%l3,	%i7,	%l5
	edge8n	%o4,	%l2,	%i0
	edge16l	%i5,	%o3,	%i4
	addccc	%l4,	0x1649,	%o6
	fmovspos	%icc,	%f1,	%f4
	fmovscc	%xcc,	%f6,	%f29
	fcmpgt32	%f26,	%f8,	%o0
	edge32l	%i6,	%o2,	%g4
	movpos	%xcc,	%g3,	%g7
	edge32	%l1,	%i3,	%g1
	fxnors	%f25,	%f25,	%f30
	movge	%xcc,	%o7,	%l0
	fbg	%fcc2,	loop_1568
	sdivcc	%l6,	0x0F95,	%g5
	brlz,a	%o1,	loop_1569
	std	%f0,	[%l7 + 0x50]
loop_1568:
	nop
	wr	%g0,	0x58,	%asi
loop_1569:
	movrgz	%o5,	0x073,	%g2
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
	fone	%f28
	edge8l	%i1,	%l3,	%i2
	sub	%i7,	%l5,	%o4
	fcmpgt32	%f26,	%f10,	%i0
	ble	loop_1570
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl	%fcc3,	loop_1571
	bpos,a	loop_1572
loop_1570:
	bg,a	%xcc,	loop_1573
	fsrc1	%f12,	%f6
loop_1571:
	fbn,a	%fcc2,	loop_1574
loop_1572:
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
loop_1573:
	fmovrdlz	%l2,	%f28,	%f8
	fmovrsgez	%o3,	%f22,	%f2
loop_1574:
	edge8	%i4,	%l4,	%o6
	wr	%g0,	0x11,	%asi
	fones	%f9
	nop 	! 	tsubcc	%i6,	0x11E3,	%o0 changed by convert2hboot
	edge32	%g4,	%g3,	%g7
	edge32ln	%l1,	%i3,	%g1
	nop
	setx	loop_1575,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	movrgez	%o7,	%l0,	%l6
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	edge16l	%g5,	%o2,	%o1
loop_1575:
	movcc	%icc,	%g6,	%g2
	fmul8x16	%f11,	%f4,	%f0
	smulcc	%i1,	%o5,	%i2
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	fbg	%fcc2,	loop_1576
	udivx	%i7,	0x1650,	%l5
	xor	%o4,	0x0187,	%i0
	flush	%l7 + 0x18
loop_1576:
	sra	%l2,	0x15,	%o3
	array8	%l3,	%i4,	%o6
	ldub	[%l7 + 0x74],	%i5
	fmovrde	%i6,	%f6,	%f0
	fcmpgt16	%f6,	%f20,	%l4
	movvc	%icc,	%o0,	%g3
	nop
	setx	loop_1577,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	andn	%g4,	0x0A67,	%l1
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
	fmul8x16au	%f16,	%f7,	%f14
loop_1577:
	edge16n	%i3,	%g1,	%o7
	array16	%g7,	%l0,	%l6
	wr	%g0,	0x10,	%asi
	udiv	%g5,	0x0BAC,	%o1
	movle	%xcc,	%g6,	%i1
	set	0x08, %i5
	sta	%f22,	[%l7 + %i5] 0x14
	andn	%g2,	%o5,	%i2
	fmovda	%xcc,	%f21,	%f23
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	xnor	%i7,	%l5,	%i0
	nop 	! 	taddcctv	%l2,	%o3,	%o4 changed by convert2hboot
	fbo,a	%fcc3,	loop_1578
	edge8n	%i4,	%l3,	%o6
	set	0x48, %g6
	nop	 ! 	ldxa	[%l7 + %g6] 0x10,	%i5 ASI use changed by convert2hboot
loop_1578:
	andncc	%i6,	%l4,	%g3
	movgu	%icc,	%o0,	%g4
	nop 	! 	tvs	%xcc,	0x0 changed by convert2hboot
	sllx	%l1,	%i3,	%o7
	srlx	%g1,	0x0F,	%l0
	stx	%g7,	[%l7 + 0x18]
	flush	%l7 + 0x10
	lduh	[%l7 + 0x54],	%l6
	movle	%icc,	%g5,	%o1
	edge32l	%g6,	%o2,	%g2
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	brlz	%i1,	loop_1579
	sub	%i2,	0x1F71,	%o5
	fmovdle	%xcc,	%f25,	%f3
	fmul8ulx16	%f8,	%f10,	%f18
loop_1579:
	fmovdneg	%xcc,	%f16,	%f29
	subccc	%l5,	%i7,	%i0
	fnegs	%f2,	%f10
	fmovdneg	%xcc,	%f17,	%f19
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	xor	%i4,	%l3,	%o6
	movleu	%icc,	%i5,	%l2
	flush	%l7 + 0x50
	movpos	%xcc,	%i6,	%g3
	srl	%l4,	0x1A,	%o0
	subc	%g4,	%i3,	%l1
	sdivx	%g1,	0x1B2C,	%l0
	addc	%o7,	0x0FBA,	%l6
	fmovdleu	%xcc,	%f26,	%f11
	add	%g7,	0x1BCC,	%o1
	fmovrslz	%g5,	%f28,	%f15
	bge,pt	%icc,	loop_1580
	nop 	! 	tneg	%icc,	0x7 changed by convert2hboot
	bne	%xcc,	loop_1581
	nop 	! 	tsubcc	%o2,	0x1EF2,	%g2 changed by convert2hboot
loop_1580:
	nop
	set	0x10, %o4
	nop	 ! 	prefetcha	[%l7 + %o4] 0x15,	 0x3 ASI use changed by convert2hboot
loop_1581:
	fexpand	%f28,	%f14
	movle	%xcc,	%i2,	%o5
	movl	%icc,	%i1,	%l5
	fmovda	%icc,	%f15,	%f31
	andcc	%i0,	%i7,	%o3
	edge8l	%o4,	%l3,	%i4
	movvc	%icc,	%o6,	%i5
	nop 	! 	tge	%xcc,	0x1 changed by convert2hboot
	subcc	%i6,	0x0585,	%g3
	fcmped	%fcc3,	%f14,	%f26
	membar	0x70
	sllx	%l4,	%l2,	%o0
	brlez	%g4,	loop_1582
	nop 	! 	tsubcctv	%l1,	0x0D68,	%g1 changed by convert2hboot
	bge,a,pn	%xcc,	loop_1583
	fzeros	%f4
loop_1582:
	nop
	wr	%g0,	0x80,	%asi
loop_1583:
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	sll	%i3,	%o7,	%g7
	fsrc1	%f18,	%f6
	movvc	%xcc,	%l6,	%g5
	edge8	%o1,	%o2,	%g6
	wr	%g0,	0x88,	%asi
	movleu	%icc,	%g2,	%i1
	fmovsvc	%xcc,	%f26,	%f13
	nop 	! 	tvc	%xcc,	0x3 changed by convert2hboot
	fcmpne16	%f0,	%f0,	%o5
	movge	%xcc,	%i0,	%i7
	movrlz	%o3,	0x211,	%o4
	stw	%l5,	[%l7 + 0x48]
	ldsb	[%l7 + 0x3C],	%l3
	nop 	! 	tl	%icc,	0x5 changed by convert2hboot
	alignaddr	%o6,	%i4,	%i6
	ldsb	[%l7 + 0x44],	%g3
	sdiv	%i5,	0x19B8,	%l2
	membar	0x50
	set	0x40, %g1
	nop	 ! 	ldda	[%l7 + %g1] 0x15,	%f16 ASI use changed by convert2hboot
	fornot1s	%f23,	%f14,	%f1
	subc	%o0,	%l4,	%g4
	fandnot1	%f2,	%f6,	%f20
	fpsub32s	%f15,	%f20,	%f24
	bvc,a,pn	%xcc,	loop_1584
	sdiv	%l1,	0x05BC,	%g1
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
	smulcc	%i3,	%o7,	%g7
loop_1584:
	array32	%l6,	%g5,	%l0
	fmovdvc	%xcc,	%f3,	%f31
	wr	%g0,	0x11,	%asi
	set	0x72, %g7
	nop	 ! 	ldsha	[%l7 + %g7] 0x11,	%o1 ASI use changed by convert2hboot
	fmovdn	%xcc,	%f1,	%f17
	xnorcc	%g6,	%i2,	%i1
	andcc	%o5,	0x0538,	%g2
	movre	%i0,	%i7,	%o3
	brnz,a	%l5,	loop_1585
	sra	%o4,	%o6,	%l3
	fpmerge	%f13,	%f25,	%f22
	umul	%i4,	%g3,	%i6
loop_1585:
	sdivx	%l2,	0x0787,	%i5
	mova	%xcc,	%l4,	%g4
	orncc	%l1,	0x0D0B,	%g1
	edge8	%o0,	%o7,	%i3
	fabsd	%f4,	%f14
	edge32ln	%g7,	%g5,	%l0
	srax	%o2,	%o1,	%g6
	fornot1	%f6,	%f14,	%f26
	edge8	%l6,	%i1,	%i2
	movn	%icc,	%o5,	%i0
	sdivx	%i7,	0x1309,	%o3
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	set	0x64, %l5
	nop	 ! 	stwa	%l5,	[%l7 + %l5] 0xe2 ASI use changed by convert2hboot
	membar	#Sync
	xnorcc	%o4,	0x19AB,	%g2
	fbg,a	%fcc2,	loop_1586
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
loop_1586:
	srl	%o6,	0x11,	%g3
	or	%i4,	0x187A,	%l2
	movrgz	%i5,	%l4,	%i6
	fblg	%fcc3,	loop_1587
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
	lduh	[%l7 + 0x5E],	%g4
	xnorcc	%g1,	0x12A2,	%o0
loop_1587:
	lduh	[%l7 + 0x4C],	%l1
	set	0x1C, %o1
	nop	 ! 	lduwa	[%l7 + %o1] 0x81,	%o7 ASI use changed by convert2hboot
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	fpmerge	%f18,	%f21,	%f10
	fnand	%f4,	%f14,	%f6
	umulcc	%g7,	%i3,	%l0
	array16	%o2,	%g5,	%g6
	fbne	%fcc3,	loop_1588
	ldsh	[%l7 + 0x26],	%o1
	popc	%i1,	%i2
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
loop_1588:
	flush	%l7 + 0x40
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	array32	%l6,	%i0,	%o5
	brz	%i7,	loop_1589
	udivcc	%o3,	0x0DAC,	%o4
	fmuld8sux16	%f19,	%f13,	%f24
	fabss	%f2,	%f15
loop_1589:
	udivcc	%l5,	0x0BB8,	%g2
	fornot1	%f2,	%f4,	%f30
	fbl	%fcc3,	loop_1590
	fmul8x16al	%f2,	%f18,	%f28
	subc	%l3,	%o6,	%i4
	wr	%g0,	0x89,	%asi
loop_1590:
	bneg	loop_1591
	fnand	%f18,	%f6,	%f6
	movleu	%xcc,	%g3,	%l4
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
loop_1591:
	nop
	set	0x20, %g5
	nop	 ! 	prefetcha	[%l7 + %g5] 0x11,	 0x1 ASI use changed by convert2hboot
	bl,a,pn	%icc,	loop_1592
	fand	%f28,	%f18,	%f14
	smul	%i6,	%g1,	%o0
	movn	%icc,	%l1,	%g4
loop_1592:
	movle	%icc,	%g7,	%o7
	movcs	%icc,	%l0,	%i3
	xnor	%g5,	0x19BD,	%o2
	prefetch	[%l7 + 0x38],	 0x2
	edge32	%o1,	%g6,	%i1
	fmovsle	%xcc,	%f12,	%f0
	fmovde	%icc,	%f12,	%f9
	fmul8sux16	%f24,	%f4,	%f0
	ldd	[%l7 + 0x40],	%i6
	fbe,a	%fcc0,	loop_1593
	fmovscc	%icc,	%f9,	%f1
	fornot1	%f28,	%f24,	%f26
	movcc	%icc,	%i0,	%i2
loop_1593:
	movle	%xcc,	%i7,	%o3
	edge8n	%o4,	%o5,	%g2
	movl	%xcc,	%l3,	%o6
	udivx	%i4,	0x105C,	%l2
	fcmple16	%f24,	%f12,	%l5
	edge16l	%l4,	%g3,	%i6
	fpadd32s	%f5,	%f29,	%f17
	srl	%i5,	0x1D,	%g1
	nop 	! 	tsubcc	%o0,	%g4,	%l1 changed by convert2hboot
	movrne	%g7,	0x2E7,	%o7
	movleu	%icc,	%i3,	%l0
	edge32n	%o2,	%o1,	%g5
	sdivx	%i1,	0x1C30,	%l6
	movle	%xcc,	%i0,	%g6
	edge16	%i7,	%i2,	%o4
	sdivx	%o3,	0x1519,	%o5
	ldstub	[%l7 + 0x1A],	%g2
	movpos	%xcc,	%l3,	%i4
	fnegd	%f22,	%f6
	call	loop_1594
	fcmpeq16	%f12,	%f24,	%l2
	udivcc	%o6,	0x0C0B,	%l5
	wr	%g0,	0x80,	%asi
	sta	%f8,	[%l7 + 0x1C] %asi
loop_1594:
	fsrc2s	%f19,	%f28
	movvs	%icc,	%l4,	%i6
	movrgez	%i5,	%g3,	%o0
	fpmerge	%f26,	%f26,	%f0
	xorcc	%g1,	0x1BC7,	%l1
	array16	%g7,	%o7,	%i3
	fmovdl	%xcc,	%f3,	%f24
	nop 	! 	sir	0x06FE changed by convert2hboot
	edge8	%l0,	%o2,	%o1
	set	0x7C, %o2
	nop	 ! 	stha	%g5,	[%l7 + %o2] 0x04 ASI use changed by convert2hboot
	fcmple16	%f0,	%f26,	%i1
	fmovrslez	%l6,	%f31,	%f24
	fcmpes	%fcc3,	%f31,	%f6
	set	0x20, %l2
	nop	 ! 	prefetcha	[%l7 + %l2] 0x15,	 0x0 ASI use changed by convert2hboot
	subccc	%g4,	%i7,	%i2
	fcmple32	%f22,	%f0,	%o4
	and	%o3,	0x1986,	%o5
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	std	%g2,	[%l7 + 0x30]
	addccc	%g6,	0x0DBB,	%l3
	nop 	! 	sir	0x0EE6 changed by convert2hboot
	fmovdne	%xcc,	%f8,	%f24
	fmovdne	%icc,	%f5,	%f25
	edge8l	%i4,	%o6,	%l2
	bg,a	%icc,	loop_1595
	movrgz	%l4,	%l5,	%i5
	edge32	%g3,	%o0,	%g1
	edge8ln	%l1,	%i6,	%o7
loop_1595:
	udivx	%g7,	0x17B4,	%l0
	movge	%xcc,	%o2,	%o1
	fmovrdlez	%i3,	%f16,	%f12
	add	%l7,	0x38,	%l6
	wr	%g0,	0x19,	%asi
	xnorcc	%i0,	0x1255,	%g4
	bne,pn	%xcc,	loop_1596
	nop 	! 	tle	%icc,	0x2 changed by convert2hboot
	orn	%g5,	%i2,	%i7
	nop 	! 	taddcctv	%o3,	%o5,	%o4 changed by convert2hboot
loop_1596:
	edge32ln	%g6,	%g2,	%i4
	edge8ln	%o6,	%l2,	%l3
	set	0x78, %l3
	nop	 ! 	ldstuba	[%l7 + %l3] 0x11,	%l5 ASI use changed by convert2hboot
	move	%xcc,	%l4,	%g3
	orncc	%o0,	%g1,	%l1
	umulcc	%i6,	%i5,	%g7
	fba,a	%fcc0,	loop_1597
	fbe,a	%fcc3,	loop_1598
	udivcc	%o7,	0x1D20,	%o2
	std	%f20,	[%l7 + 0x18]
loop_1597:
	subccc	%o1,	0x0EA6,	%l0
loop_1598:
	movrne	%i3,	%i1,	%i0
	edge8	%l6,	%g4,	%g5
	edge32	%i2,	%o3,	%o5
	fble	%fcc0,	loop_1599
	fxnor	%f18,	%f10,	%f12
	fandnot1	%f10,	%f30,	%f8
	nop
	setx	loop_1600,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_1599:
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	fsrc2	%f24,	%f0
	movge	%xcc,	%o4,	%i7
loop_1600:
	edge32n	%g2,	%g6,	%o6
	xnorcc	%i4,	%l2,	%l3
	alignaddrl	%l5,	%l4,	%o0
	nop 	! 	taddcctv	%g3,	%l1,	%g1 changed by convert2hboot
	smul	%i5,	0x10A3,	%i6
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	fbug,a	%fcc1,	loop_1601
	fmovsge	%icc,	%f10,	%f11
	udiv	%o7,	0x1419,	%g7
	fbu	%fcc2,	loop_1602
loop_1601:
	movvs	%icc,	%o1,	%l0
	nop
	set	0x40, %g2
	lduh	[%l7 + %g2],	%i3
	std	%f12,	[%l7 + 0x68]
loop_1602:
	ldstub	[%l7 + 0x6B],	%i1
	fbue	%fcc2,	loop_1603
	fmovrdgz	%o2,	%f18,	%f6
	fpadd32s	%f7,	%f24,	%f27
	wr	%g0,	0x19,	%asi
loop_1603:
	movcs	%icc,	%g4,	%l6
	fmovrse	%g5,	%f4,	%f31
	fmovscc	%icc,	%f22,	%f1
	addccc	%i2,	0x0625,	%o3
	wr	%g0,	0x88,	%asi
	sta	%f21,	[%l7 + 0x58] %asi
	orcc	%o4,	0x0B11,	%o5
	nop 	! 	taddcctv	%g2,	%i7,	%o6 changed by convert2hboot
	bpos,a	%xcc,	loop_1604
	st	%f23,	[%l7 + 0x7C]
	movleu	%icc,	%g6,	%i4
	fcmpes	%fcc2,	%f17,	%f7
loop_1604:
	fcmpeq32	%f0,	%f30,	%l2
	fnor	%f6,	%f30,	%f2
	fcmpne16	%f30,	%f18,	%l5
	movleu	%xcc,	%l4,	%l3
	fnot1	%f24,	%f16
	fmovdle	%xcc,	%f21,	%f8
	udivcc	%g3,	0x1F88,	%l1
	fmovdpos	%xcc,	%f18,	%f2
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
	sdiv	%g1,	0x1420,	%i5
	fandnot2	%f26,	%f14,	%f12
	movgu	%xcc,	%o0,	%o7
	umul	%i6,	%o1,	%l0
	fnors	%f30,	%f8,	%f10
	lduh	[%l7 + 0x6A],	%i3
	sdivx	%i1,	0x070F,	%g7
	movpos	%xcc,	%o2,	%g4
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	fands	%f19,	%f27,	%f5
	edge32ln	%i0,	%l6,	%i2
	fbl,a	%fcc0,	loop_1605
	sdiv	%g5,	0x1EFD,	%o4
	nop
	setx	loop_1606,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	or	%o3,	0x031F,	%g2
loop_1605:
	be,pn	%icc,	loop_1607
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
loop_1606:
	ldub	[%l7 + 0x2D],	%i7
	stw	%o6,	[%l7 + 0x54]
loop_1607:
	fcmpeq32	%f14,	%f14,	%g6
	nop
	set	0x09, %o0
	ldsb	[%l7 + %o0],	%i4
	sllx	%o5,	%l2,	%l5
	fnot1	%f18,	%f12
	fnot2s	%f9,	%f19
	fpmerge	%f25,	%f18,	%f8
	movre	%l4,	%l3,	%g3
	fmul8x16al	%f9,	%f9,	%f20
	wr	%g0,	0x18,	%asi
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	nop
	set	0x4C, %l6
	stb	%l1,	[%l7 + %l6]
	fmovrdlez	%i5,	%f30,	%f30
	smulcc	%g1,	%o7,	%o0
	umul	%o1,	%i6,	%i3
	array32	%l0,	%g7,	%i1
	brlz	%g4,	loop_1608
	fnand	%f20,	%f20,	%f2
	edge16	%o2,	%l6,	%i2
	fmuld8sux16	%f20,	%f2,	%f0
loop_1608:
	fsrc2s	%f18,	%f30
	srl	%g5,	%o4,	%o3
	fbule	%fcc2,	loop_1609
	fbl,a	%fcc2,	loop_1610
	xnor	%g2,	%i7,	%o6
	array32	%i0,	%i4,	%o5
loop_1609:
	fmovrdlez	%g6,	%f26,	%f30
loop_1610:
	edge8n	%l5,	%l2,	%l4
	edge8n	%l3,	%g3,	%i5
	bpos,a,pn	%xcc,	loop_1611
	edge8l	%l1,	%g1,	%o0
	sub	%o7,	0x155E,	%i6
	nop 	! 	tsubcc	%i3,	0x0A0B,	%o1 changed by convert2hboot
loop_1611:
	fmovscc	%xcc,	%f13,	%f12
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
	movneg	%icc,	%l0,	%i1
	ldx	[%l7 + 0x60],	%g4
	brlez,a	%o2,	loop_1612
	mova	%icc,	%l6,	%g7
	edge8ln	%g5,	%i2,	%o4
	fmovda	%xcc,	%f19,	%f22
loop_1612:
	fandnot2	%f14,	%f24,	%f6
	fmovdle	%icc,	%f27,	%f7
	xnorcc	%g2,	%o3,	%i7
	orcc	%i0,	%i4,	%o5
	fpsub32s	%f30,	%f0,	%f18
	fmul8x16	%f17,	%f20,	%f16
	andncc	%o6,	%l5,	%g6
	mulscc	%l2,	%l4,	%g3
	nop 	! 	tsubcctv	%l3,	0x1F67,	%i5 changed by convert2hboot
	movcc	%xcc,	%g1,	%o0
	fmovdleu	%icc,	%f7,	%f14
	fmovrslez	%o7,	%f3,	%f4
	set	0x40, %g4
	nop	 ! 	ldda	[%l7 + %g4] 0x89,	%f16 ASI use changed by convert2hboot
	set	0x08, %l4
	nop	 ! 	ldswa	[%l7 + %l4] 0x88,	%l1 ASI use changed by convert2hboot
	nop 	! 	tg	%xcc,	0x3 changed by convert2hboot
	nop 	! 	taddcc	%i3,	0x1742,	%i6 changed by convert2hboot
	fbue	%fcc1,	loop_1613
	array16	%l0,	%i1,	%o1
	fbne	%fcc3,	loop_1614
	fba	%fcc2,	loop_1615
loop_1613:
	movgu	%xcc,	%g4,	%o2
	udiv	%l6,	0x0DFE,	%g7
loop_1614:
	array8	%i2,	%g5,	%g2
loop_1615:
	edge8ln	%o4,	%i7,	%i0
	fbe,a	%fcc3,	loop_1616
	fble,a	%fcc1,	loop_1617
	movge	%xcc,	%i4,	%o3
	movcc	%xcc,	%o6,	%o5
loop_1616:
	nop 	! 	tcc	%xcc,	0x7 changed by convert2hboot
loop_1617:
	fmovrsne	%g6,	%f3,	%f29
	fmuld8ulx16	%f30,	%f19,	%f20
	movl	%icc,	%l5,	%l4
	fcmple32	%f28,	%f26,	%g3
	movrgez	%l2,	%i5,	%g1
	nop 	! 	tvs	%xcc,	0x3 changed by convert2hboot
	edge8l	%o0,	%o7,	%l1
	fand	%f28,	%f2,	%f8
	edge8ln	%i3,	%l3,	%l0
	alignaddr	%i1,	%i6,	%g4
	movleu	%xcc,	%o1,	%o2
	movrne	%g7,	%i2,	%g5
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
	fpsub32s	%f10,	%f4,	%f12
	fble	%fcc1,	loop_1618
	or	%g2,	0x09FE,	%l6
	smul	%o4,	%i0,	%i4
	edge16	%i7,	%o3,	%o6
loop_1618:
	fbul	%fcc1,	loop_1619
	bne,pt	%xcc,	loop_1620
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
loop_1619:
	movneg	%xcc,	%o5,	%g6
loop_1620:
	bne,a,pn	%icc,	loop_1621
	fmovsvc	%xcc,	%f3,	%f0
	subccc	%l4,	%l5,	%g3
	nop 	! 	ta	%xcc,	0x1 changed by convert2hboot
loop_1621:
	movrne	%l2,	%i5,	%o0
	ba	%icc,	loop_1622
	std	%f30,	[%l7 + 0x30]
	xor	%o7,	0x1A8C,	%l1
	set	0x6C, %l0
	nop	 ! 	lduwa	[%l7 + %l0] 0x89,	%i3 ASI use changed by convert2hboot
loop_1622:
	andncc	%g1,	%l3,	%i1
	nop 	! 	taddcctv	%i6,	%l0,	%o1 changed by convert2hboot
	movleu	%icc,	%g4,	%g7
	bge,pn	%icc,	loop_1623
	fcmpd	%fcc1,	%f12,	%f28
	fmovdcs	%icc,	%f20,	%f16
	fcmpeq16	%f30,	%f28,	%o2
loop_1623:
	edge32	%g5,	%g2,	%i2
	nop 	! 	tsubcc	%l6,	%i0,	%i4 changed by convert2hboot
	nop 	! 	sir	0x1C92 changed by convert2hboot
	fmul8x16au	%f13,	%f21,	%f18
	edge16n	%i7,	%o3,	%o4
	addccc	%o5,	0x0876,	%g6
	ldstub	[%l7 + 0x28],	%l4
	fpack32	%f28,	%f18,	%f12
	addc	%l5,	%g3,	%l2
	mova	%xcc,	%i5,	%o6
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
	set	0x48, %i3
	nop	 ! 	prefetcha	[%l7 + %i3] 0x89,	 0x0 ASI use changed by convert2hboot
	edge8l	%l1,	%i3,	%g1
	movleu	%xcc,	%o7,	%l3
	bn	%icc,	loop_1624
	subccc	%i1,	%i6,	%o1
	or	%l0,	0x085B,	%g7
	fxnor	%f22,	%f14,	%f28
loop_1624:
	movne	%xcc,	%o2,	%g5
	edge8l	%g2,	%i2,	%g4
	nop 	! 	tcs	%icc,	0x3 changed by convert2hboot
	bleu,a,pt	%xcc,	loop_1625
	fmovdneg	%icc,	%f8,	%f20
	membar	0x36
	edge16	%i0,	%l6,	%i7
loop_1625:
	alignaddr	%o3,	%i4,	%o4
	array32	%g6,	%l4,	%l5
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	movrlz	%o5,	0x367,	%g3
	fcmps	%fcc3,	%f21,	%f8
	nop
	setx loop_1626, %l0, %l1
	jmpl %l1, %i5
	smulcc	%l2,	%o0,	%l1
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
	ldd	[%l7 + 0x38],	%o6
loop_1626:
	xnor	%g1,	0x131B,	%i3
	ldsb	[%l7 + 0x18],	%o7
	movcc	%icc,	%l3,	%i6
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	orn	%o1,	%i1,	%l0
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
	fsrc1s	%f12,	%f27
	movneg	%icc,	%g7,	%g5
	fmovs	%f4,	%f6
	fmovsneg	%xcc,	%f16,	%f26
	fmovrdlez	%g2,	%f12,	%f10
	brlez	%o2,	loop_1627
	nop 	! 	taddcc	%i2,	0x1949,	%g4 changed by convert2hboot
	fsrc2	%f22,	%f12
	fmovsa	%icc,	%f14,	%f21
loop_1627:
	movrgez	%l6,	0x081,	%i0
	fbu	%fcc3,	loop_1628
	nop
	setx loop_1629, %l0, %l1
	jmpl %l1, %i7
	sdivx	%o3,	0x1F86,	%i4
	wr	%g0,	0x80,	%asi
loop_1628:
	nop 	! 	tge	%icc,	0x4 changed by convert2hboot
loop_1629:
	movre	%o4,	%l4,	%l5
	sdiv	%g3,	0x0D56,	%o5
	fbu,a	%fcc0,	loop_1630
	movrgez	%i5,	%o0,	%l1
	nop 	! 	tl	%icc,	0x1 changed by convert2hboot
	and	%l2,	%g1,	%i3
loop_1630:
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
	fmovdneg	%icc,	%f30,	%f26
	edge32	%o7,	%l3,	%i6
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	edge16	%o1,	%i1,	%o6
	fpsub16	%f2,	%f28,	%f8
	fbn	%fcc0,	loop_1631
	fpadd32s	%f27,	%f19,	%f20
	fmul8x16al	%f1,	%f11,	%f0
	sdivx	%l0,	0x16EE,	%g5
loop_1631:
	andn	%g7,	%g2,	%i2
	movneg	%icc,	%g4,	%o2
	prefetch	[%l7 + 0x54],	 0x1
	edge32ln	%l6,	%i7,	%o3
	addcc	%i0,	0x0716,	%g6
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	fbule,a	%fcc1,	loop_1632
	edge8l	%o4,	%l4,	%l5
	subc	%i4,	0x0B79,	%g3
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
loop_1632:
	fmovrdlz	%i5,	%f12,	%f26
	movrlez	%o0,	%l1,	%l2
	ble	loop_1633
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	bvc	%xcc,	loop_1634
	nop 	! 	sir	0x01A9 changed by convert2hboot
loop_1633:
	be,a	loop_1635
	popc	0x014C,	%o5
loop_1634:
	be,a,pt	%xcc,	loop_1636
	bvs,a,pt	%icc,	loop_1637
loop_1635:
	ldstub	[%l7 + 0x6E],	%g1
	nop 	! 	tg	%xcc,	0x7 changed by convert2hboot
loop_1636:
	pdist	%f6,	%f8,	%f26
loop_1637:
	fmovsgu	%xcc,	%f29,	%f20
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
	bl,a	loop_1638
	movn	%icc,	%i3,	%o7
	wr	%g0,	0x88,	%asi
loop_1638:
	for	%f22,	%f2,	%f2
	stx	%l3,	[%l7 + 0x48]
	array16	%o1,	%o6,	%i1
	edge8ln	%g5,	%g7,	%l0
	edge8	%i2,	%g2,	%o2
	fmul8x16al	%f13,	%f15,	%f2
	mulscc	%g4,	%i7,	%o3
	fxnor	%f4,	%f2,	%f28
	fcmpes	%fcc0,	%f10,	%f19
	fandnot2	%f24,	%f0,	%f24
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	fmovsne	%icc,	%f3,	%f0
	edge32	%g6,	%l6,	%o4
	edge8l	%l4,	%i4,	%g3
	fzero	%f24
	wr	%g0,	0x10,	%asi
	srl	%o0,	%l5,	%l2
	xnorcc	%o5,	0x0CC7,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i3,	%o7,	%l1
	fbu,a	%fcc2,	loop_1639
	fbe,a	%fcc1,	loop_1640
	andncc	%l3,	%o1,	%o6
	movrgez	%i1,	%g5,	%i6
loop_1639:
	movn	%icc,	%g7,	%l0
loop_1640:
	udiv	%i2,	0x0C98,	%g2
	fmovsvs	%icc,	%f3,	%f18
	add	%o2,	%g4,	%i7
	movrlez	%i0,	0x24D,	%g6
	movrgez	%o3,	0x327,	%o4
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
	fornot2	%f4,	%f0,	%f24
	fbuge	%fcc1,	loop_1641
	fsrc2	%f30,	%f2
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	set	0x2C, %o6
	sta	%f18,	[%l7 + %o6] 0x0c
loop_1641:
	bgu,a,pn	%xcc,	loop_1642
	umulcc	%l6,	%l4,	%g3
	fbe,a	%fcc3,	loop_1643
	subcc	%i4,	%i5,	%l5
loop_1642:
	fnors	%f16,	%f10,	%f0
	nop
	set	0x4C, %i0
	ldsw	[%l7 + %i0],	%l2
loop_1643:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tg	%xcc,	0x4 changed by convert2hboot
	andncc	%o0,	%g1,	%o5
	and	%o7,	%i3,	%l1
	fbn,a	%fcc2,	loop_1644
	umulcc	%o1,	%l3,	%o6
	movrlez	%g5,	%i6,	%i1
	fbge,a	%fcc2,	loop_1645
loop_1644:
	st	%f29,	[%l7 + 0x10]
	movg	%icc,	%g7,	%l0
	sra	%i2,	0x13,	%g2
loop_1645:
	alignaddrl	%o2,	%g4,	%i0
	umul	%g6,	%o3,	%i7
	nop
	setx	loop_1646,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	movre	%o4,	%l6,	%g3
	fsrc2s	%f19,	%f16
	mova	%icc,	%i4,	%l4
loop_1646:
	sub	%l5,	%i5,	%o0
	movn	%xcc,	%g1,	%o5
	addc	%o7,	%l2,	%i3
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	nop	 ! 	casa	[%l6] 0x80,	%l1,	%l3 ASI use changed by convert2hboot
	nop 	! 	sir	0x020A changed by convert2hboot
	add	%o6,	0x0F49,	%g5
	movl	%icc,	%o1,	%i1
	nop 	! 	ta	%icc,	0x7 changed by convert2hboot
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	fnegs	%f18,	%f1
	fnot1s	%f16,	%f26
	srax	%l0,	%g2,	%i2
	addc	%g4,	0x06F8,	%i0
	fnor	%f18,	%f30,	%f12
	movpos	%icc,	%g6,	%o2
	brlz,a	%o3,	loop_1647
	movl	%xcc,	%i7,	%o4
	fbl	%fcc2,	loop_1648
	brgez	%g3,	loop_1649
loop_1647:
	ble,pt	%xcc,	loop_1650
	nop 	! 	ta	%xcc,	0x1 changed by convert2hboot
loop_1648:
	popc	0x0B84,	%i4
loop_1649:
	smul	%l6,	0x035A,	%l4
loop_1650:
	bgu,a	%xcc,	loop_1651
	brgez,a	%i5,	loop_1652
	fmovsgu	%icc,	%f29,	%f19
	orn	%l5,	%o0,	%o5
loop_1651:
	sdivx	%g1,	0x0773,	%o7
loop_1652:
	nop
	wr	%g0,	0x80,	%asi
	nop 	! 	tle	%xcc,	0x2 changed by convert2hboot
	nop 	! 	taddcctv	%l2,	0x12FA,	%i3 changed by convert2hboot
	addc	%l1,	%l3,	%g5
	nop 	! 	tle	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
	edge32l	%o1,	%i1,	%i6
	fmovdle	%xcc,	%f23,	%f8
	wr	%g0,	0x04,	%asi
	sll	%l0,	%g2,	%i2
	std	%f10,	[%l7 + 0x20]
	fmovdg	%xcc,	%f25,	%f16
	nop 	! 	sir	0x167A changed by convert2hboot
	add	%g4,	0x1EC8,	%i0
	umul	%g6,	%o6,	%o2
	udivx	%i7,	0x1656,	%o3
	fnegs	%f8,	%f30
	nop 	! 	taddcctv	%g3,	%o4,	%l6 changed by convert2hboot
	prefetch	[%l7 + 0x70],	 0x1
	orn	%l4,	0x1DD8,	%i5
	fbn	%fcc2,	loop_1653
	fmovde	%icc,	%f29,	%f15
	nop 	! 	tgu	%icc,	0x1 changed by convert2hboot
	udiv	%i4,	0x083E,	%o0
loop_1653:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o5,	0x12E,	%l5
	edge32n	%o7,	%g1,	%l2
	siam	0x7
	movne	%icc,	%i3,	%l1
	edge32	%l3,	%g5,	%i1
	sra	%o1,	0x03,	%g7
	fbn	%fcc3,	loop_1654
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
	fors	%f30,	%f31,	%f3
	nop 	! 	tge	%icc,	0x0 changed by convert2hboot
loop_1654:
	std	%i6,	[%l7 + 0x18]
	std	%g2,	[%l7 + 0x68]
	edge8ln	%i2,	%l0,	%i0
	xnor	%g4,	%g6,	%o6
	or	%i7,	0x1593,	%o2
	array16	%g3,	%o3,	%o4
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
	sdiv	%l6,	0x10BF,	%i5
	wr	%g0,	0x18,	%asi
	movge	%icc,	%o0,	%o5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	array16	%l5,	%l2,	%g1
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
	sra	%i3,	%l3,	%g5
	be	%icc,	loop_1655
	edge32n	%i1,	%o1,	%l1
	nop 	! 	tvs	%icc,	0x6 changed by convert2hboot
	srlx	%i6,	%g7,	%i2
loop_1655:
	fmul8x16al	%f14,	%f17,	%f30
	fexpand	%f14,	%f16
	bvc,a,pt	%icc,	loop_1656
	movrlz	%l0,	%i0,	%g4
	movge	%icc,	%g2,	%o6
	addcc	%i7,	%g6,	%g3
loop_1656:
	fbl,a	%fcc1,	loop_1657
	xor	%o3,	%o4,	%o2
	subc	%l6,	%i4,	%i5
	movrne	%o0,	0x035,	%o5
loop_1657:
	fpack32	%f8,	%f28,	%f6
	fornot2s	%f30,	%f27,	%f21
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	fmovsl	%xcc,	%f25,	%f17
	set	0x40, %i4
	nop	 ! 	ldda	[%l7 + %i4] 0x04,	%f0 ASI use changed by convert2hboot
	ldd	[%l7 + 0x10],	%o6
	fxors	%f24,	%f13,	%f31
	fmovsleu	%xcc,	%f27,	%f7
	fmovdleu	%xcc,	%f30,	%f26
	bpos,a,pt	%xcc,	loop_1658
	fblg	%fcc1,	loop_1659
	movrlz	%l4,	0x258,	%l5
	fmuld8ulx16	%f6,	%f12,	%f28
loop_1658:
	ldd	[%l7 + 0x60],	%f28
loop_1659:
	array32	%l2,	%g1,	%l3
	for	%f20,	%f4,	%f8
	orcc	%i3,	0x0B4E,	%i1
	alignaddr	%g5,	%l1,	%i6
	fbge	%fcc3,	loop_1660
	movl	%icc,	%o1,	%i2
	movpos	%xcc,	%g7,	%i0
	sdivcc	%g4,	0x1B5A,	%l0
loop_1660:
	fmovdleu	%icc,	%f29,	%f14
	call	loop_1661
	fmovrsgez	%o6,	%f23,	%f9
	fbl	%fcc0,	loop_1662
	orcc	%g2,	%g6,	%i7
loop_1661:
	fbuge,a	%fcc1,	loop_1663
	fmovsl	%xcc,	%f10,	%f17
loop_1662:
	edge16n	%g3,	%o3,	%o4
	bcc,a,pt	%icc,	loop_1664
loop_1663:
	edge8	%o2,	%i4,	%l6
	fsrc1	%f22,	%f2
	movrne	%o0,	%o5,	%o7
loop_1664:
	udivcc	%l4,	0x01D9,	%i5
	fba,a	%fcc3,	loop_1665
	mova	%xcc,	%l2,	%l5
	nop 	! 	tleu	%xcc,	0x5 changed by convert2hboot
	fsrc1	%f0,	%f4
loop_1665:
	edge32l	%l3,	%i3,	%g1
	edge32n	%i1,	%g5,	%i6
	fnegs	%f25,	%f0
	umulcc	%l1,	%o1,	%g7
	fxnors	%f12,	%f1,	%f11
	pdist	%f26,	%f24,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x10, %i7
	nop	 ! 	ldda	[%l7 + %i7] 0x2b,	%i2 ASI use changed by convert2hboot
	addcc	%i0,	0x1CBF,	%l0
	smul	%o6,	%g4,	%g6
	bvs	loop_1666
	fpack32	%f14,	%f30,	%f20
	fandnot2s	%f5,	%f5,	%f16
	movrlz	%g2,	%g3,	%o3
loop_1666:
	fmul8x16	%f11,	%f6,	%f6
	udivcc	%i7,	0x0292,	%o2
	xorcc	%o4,	0x0888,	%i4
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
	fxor	%f26,	%f8,	%f0
	fmovsge	%icc,	%f2,	%f7
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	sdiv	%l6,	0x0013,	%o0
	bvs	%icc,	loop_1667
	andcc	%o5,	0x133B,	%o7
	fmovsvs	%xcc,	%f31,	%f22
	fmovspos	%xcc,	%f3,	%f8
loop_1667:
	bneg,a	%icc,	loop_1668
	subc	%l4,	0x1BEC,	%i5
	fbge	%fcc1,	loop_1669
	xnor	%l2,	0x0BDF,	%l5
loop_1668:
	nop 	! 	ta	%xcc,	0x0 changed by convert2hboot
	ba,a,pt	%icc,	loop_1670
loop_1669:
	fbug	%fcc2,	loop_1671
	swap	[%l7 + 0x64],	%l3
	mova	%icc,	%g1,	%i1
loop_1670:
	umul	%i3,	%i6,	%g5
loop_1671:
	stw	%l1,	[%l7 + 0x78]
	sdiv	%g7,	0x1F81,	%i2
	fmovdle	%xcc,	%f30,	%f1
	fcmpne16	%f14,	%f30,	%o1
	fors	%f4,	%f31,	%f1
	be,pt	%icc,	loop_1672
	edge16l	%l0,	%i0,	%g4
	fbug,a	%fcc3,	loop_1673
	movre	%o6,	%g6,	%g3
loop_1672:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc2,	loop_1674
loop_1673:
	xorcc	%g2,	0x092C,	%i7
	nop
	set	0x4A, %i2
	ldsb	[%l7 + %i2],	%o2
	edge16n	%o4,	%i4,	%o3
loop_1674:
	movre	%o0,	0x36F,	%l6
	fpadd16	%f20,	%f24,	%f18
	fexpand	%f28,	%f4
	sllx	%o5,	%l4,	%o7
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	movrgz	%l2,	%l5,	%i5
	fmovrde	%g1,	%f30,	%f30
	xnorcc	%l3,	0x187E,	%i1
	alignaddr	%i3,	%i6,	%l1
	std	%f8,	[%l7 + 0x18]
	andncc	%g5,	%g7,	%i2
	nop
	set	0x44, %l1
	ldsw	[%l7 + %l1],	%l0
	wr	%g0,	0x89,	%asi
	andcc	%i0,	0x090A,	%g4
	movre	%g6,	0x366,	%o6
	set	0x64, %i1
	nop	 ! 	swapa	[%l7 + %i1] 0x80,	%g2 ASI use changed by convert2hboot
	fbug	%fcc3,	loop_1675
	flush	%l7 + 0x74
	fbg	%fcc1,	loop_1676
loop_1675:
	mulscc	%i7,	0x171F,	%g3
	set	0x10, %g3
	nop	 ! 	prefetcha	[%l7 + %g3] 0x19,	 0x0 ASI use changed by convert2hboot
loop_1676:
	ld	[%l7 + 0x7C],	%f25
	wr	%g0,	0x18,	%asi
	movgu	%icc,	%i4,	%o4
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	sdivx	%o3,	0x0493,	%o0
	sub	%l6,	0x00B1,	%l4
	movleu	%icc,	%o5,	%o7
	fmovdvc	%xcc,	%f31,	%f30
	movg	%icc,	%l2,	%l5
	set	0x1C, %o3
	nop	 ! 	lduba	[%l7 + %o3] 0x19,	%g1 ASI use changed by convert2hboot
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
	edge32ln	%l3,	%i5,	%i1
	fbl,a	%fcc3,	loop_1677
	array8	%i3,	%i6,	%l1
	smulcc	%g7,	%g5,	%i2
	wr	%g0,	0x81,	%asi
	sta	%f3,	[%l7 + 0x68] %asi
loop_1677:
	xorcc	%l0,	%o1,	%i0
	movcs	%xcc,	%g4,	%o6
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
	fmovdvs	%xcc,	%f10,	%f14
	movrgz	%g6,	%g2,	%i7
	edge16n	%g3,	%o2,	%i4
	movrgz	%o4,	%o3,	%l6
	movleu	%xcc,	%o0,	%o5
	sra	%l4,	0x0A,	%o7
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
	nop 	! 	taddcc	%l5,	%l2,	%l3 changed by convert2hboot
	sdivx	%g1,	0x0A48,	%i5
	xnor	%i3,	0x0FE0,	%i6
	nop 	! 	tcc	%xcc,	0x0 changed by convert2hboot
	edge32n	%l1,	%i1,	%g7
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	fbul	%fcc1,	loop_1678
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x1F],	%i2
	fbne	%fcc3,	loop_1679
loop_1678:
	popc	%g5,	%o1
	array8	%i0,	%l0,	%o6
	or	%g4,	%g6,	%g2
loop_1679:
	edge8l	%g3,	%o2,	%i7
	fbe	%fcc0,	loop_1680
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	xnorcc	%o4,	%i4,	%l6
	andcc	%o3,	0x12DA,	%o0
loop_1680:
	fmovsneg	%xcc,	%f17,	%f27
	sub	%l4,	%o5,	%o7
	nop 	! 	tsubcc	%l5,	0x0BE6,	%l3 changed by convert2hboot
	sub	%l2,	%g1,	%i3
	sethi	0x0DCB,	%i6
	fpack16	%f0,	%f28
	set	0x20, %o7
	nop	 ! 	ldxa	[%g0 + %o7] 0x20,	%i5 ASI use changed by convert2hboot
	sethi	0x0606,	%i1
	fmovs	%f29,	%f1
	fnegs	%f22,	%f3
	and	%l1,	0x0C6A,	%g7
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	udiv	%g5,	0x1CC6,	%o1
	srlx	%i0,	0x18,	%l0
	orn	%i2,	%g4,	%g6
	umulcc	%g2,	%o6,	%o2
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	edge8n	%g3,	%o4,	%i4
	edge8	%l6,	%i7,	%o3
	sdivcc	%o0,	0x1EF6,	%l4
	array8	%o5,	%o7,	%l5
	brgz	%l3,	loop_1681
	fmovsvc	%icc,	%f30,	%f19
	edge32ln	%l2,	%i3,	%g1
	subcc	%i6,	0x14D3,	%i1
loop_1681:
	fmovrdlz	%i5,	%f0,	%f0
	udiv	%l1,	0x0F17,	%g7
	udivcc	%o1,	0x0D6E,	%i0
	edge8l	%g5,	%l0,	%g4
	movrne	%g6,	0x278,	%g2
	fsrc1s	%f28,	%f26
	edge32n	%o6,	%i2,	%g3
	fmovsle	%xcc,	%f14,	%f0
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	movvs	%xcc,	%o2,	%i4
	srax	%l6,	0x01,	%i7
	edge8ln	%o4,	%o3,	%o0
	prefetch	[%l7 + 0x30],	 0x0
	array8	%l4,	%o5,	%l5
	fmovdge	%icc,	%f19,	%f25
	nop 	! 	tl	%icc,	0x5 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	xnor	%l3,	0x1A35,	%o7
	fmovrdlz	%i3,	%f6,	%f14
	nop 	! 	sir	0x0231 changed by convert2hboot
	fnors	%f21,	%f17,	%f25
	ldsh	[%l7 + 0x10],	%l2
	wr	%g0,	0x11,	%asi
	bleu	%xcc,	loop_1682
	edge32n	%g1,	%i1,	%i5
	fpack32	%f2,	%f20,	%f30
	fzero	%f30
loop_1682:
	alignaddrl	%i6,	%l1,	%o1
	movvc	%xcc,	%g7,	%g5
	mova	%xcc,	%i0,	%l0
	fnot1s	%f23,	%f17
	alignaddr	%g4,	%g6,	%o6
	movg	%icc,	%g2,	%g3
	flush	%l7 + 0x64
	fba,a	%fcc2,	loop_1683
	be,pt	%xcc,	loop_1684
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o2,	0x1268,	%i2
loop_1683:
	alignaddr	%i4,	%l6,	%i7
loop_1684:
	edge32n	%o4,	%o3,	%l4
	xnorcc	%o5,	0x17DF,	%l5
	bcc,a	%xcc,	loop_1685
	alignaddr	%o0,	%l3,	%i3
	std	%o6,	[%l7 + 0x68]
	brlez	%g1,	loop_1686
loop_1685:
	and	%i1,	0x03BC,	%l2
	movrne	%i6,	0x2F5,	%l1
	add	%o1,	0x09A9,	%g7
loop_1686:
	popc	0x08FE,	%i5
	alignaddr	%i0,	%g5,	%g4
	ldd	[%l7 + 0x30],	%f18
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	addcc	%l0,	0x12D0,	%o6
	andn	%g6,	%g3,	%g2
	edge32l	%o2,	%i4,	%i2
	fbge	%fcc2,	loop_1687
	fmovrse	%l6,	%f23,	%f3
	edge16l	%i7,	%o4,	%o3
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
loop_1687:
	movg	%icc,	%o5,	%l4
	edge16n	%o0,	%l3,	%l5
	bl,pn	%xcc,	loop_1688
	fmovs	%f17,	%f20
	std	%f6,	[%l7 + 0x30]
	subccc	%o7,	%g1,	%i3
loop_1688:
	movg	%xcc,	%l2,	%i1
	nop
	setx	loop_1689,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	set	0x70, %i6
	nop	 ! 	stba	%l1,	[%l7 + %i6] 0x2b ASI use changed by convert2hboot
	membar	#Sync
loop_1689:
	sll	%i6,	%o1,	%g7
	movg	%xcc,	%i5,	%g5
	fmovda	%xcc,	%f22,	%f21
	swap	[%l7 + 0x18],	%g4
	array16	%l0,	%i0,	%o6
	movpos	%icc,	%g3,	%g2
	movl	%icc,	%o2,	%i4
	sra	%i2,	%g6,	%l6
	fmovdvc	%xcc,	%f27,	%f22
	alignaddrl	%i7,	%o4,	%o3
	movrlz	%l4,	0x092,	%o0
	edge8ln	%o5,	%l3,	%l5
	brz	%o7,	loop_1690
	nop 	! 	taddcc	%i3,	0x1692,	%l2 changed by convert2hboot
	sth	%g1,	[%l7 + 0x26]
	fmovrsgz	%i1,	%f11,	%f12
loop_1690:
	movcs	%icc,	%i6,	%l1
	fxnors	%f14,	%f21,	%f28
	edge32	%g7,	%o1,	%i5
	nop
	set	0x3B, %i5
	ldub	[%l7 + %i5],	%g5
	fnor	%f30,	%f28,	%f18
	andncc	%l0,	%i0,	%o6
	mulx	%g4,	0x0521,	%g2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	movre	%i2,	%o2,	%g6
	fmul8sux16	%f22,	%f8,	%f14
	fpsub16s	%f2,	%f1,	%f29
	fcmpes	%fcc2,	%f2,	%f6
	sdiv	%i7,	0x0238,	%l6
	movle	%icc,	%o3,	%l4
	array8	%o4,	%o5,	%o0
	fmovdvc	%xcc,	%f10,	%f15
	fmovdn	%icc,	%f8,	%f13
	fbge,a	%fcc3,	loop_1691
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	brnz,a	%l3,	loop_1692
	edge8l	%o7,	%l5,	%l2
loop_1691:
	nop 	! 	tleu	%xcc,	0x7 changed by convert2hboot
	nop 	! 	taddcc	%g1,	%i1,	%i3 changed by convert2hboot
loop_1692:
	sdivcc	%l1,	0x13A1,	%i6
	fbg,a	%fcc0,	loop_1693
	prefetch	[%l7 + 0x70],	 0x0
	movn	%icc,	%o1,	%i5
	movrlez	%g7,	0x005,	%g5
loop_1693:
	nop 	! 	tl	%icc,	0x5 changed by convert2hboot
	sub	%i0,	%o6,	%g4
	sdivx	%l0,	0x1FD9,	%g2
	set	0x40, %g6
	nop	 ! 	ldda	[%l7 + %g6] 0x10,	%f16 ASI use changed by convert2hboot
	fnegd	%f12,	%f0
	nop 	! 	tsubcctv	%i4,	%g3,	%i2 changed by convert2hboot
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	umul	%g6,	%i7,	%o2
	andncc	%l6,	%o3,	%l4
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
	wr	%g0,	0x04,	%asi
	array16	%o0,	%l3,	%o7
	movcs	%icc,	%l5,	%l2
	mulscc	%g1,	%i1,	%o5
	fmovsle	%xcc,	%f9,	%f27
	fornot1	%f16,	%f30,	%f26
	pdist	%f2,	%f8,	%f14
	fmovdpos	%icc,	%f10,	%f10
	fmovse	%xcc,	%f26,	%f22
	subccc	%l1,	%i6,	%i3
	fmovsle	%icc,	%f9,	%f3
	movg	%xcc,	%o1,	%i5
	umul	%g5,	%i0,	%o6
	movrne	%g4,	%l0,	%g7
	fsrc1s	%f25,	%f6
	movneg	%icc,	%i4,	%g3
	orcc	%g2,	%i2,	%i7
	edge32ln	%g6,	%o2,	%o3
	wr	%g0,	0x89,	%asi
	sta	%f14,	[%l7 + 0x08] %asi
	srax	%l6,	%o4,	%o0
	nop 	! 	taddcc	%l3,	0x120C,	%o7 changed by convert2hboot
	edge32l	%l4,	%l5,	%l2
	fmovdcs	%icc,	%f4,	%f29
	sra	%g1,	0x04,	%i1
	fmovde	%icc,	%f7,	%f2
	nop 	! 	tgu	%xcc,	0x3 changed by convert2hboot
	addccc	%o5,	%l1,	%i3
	orncc	%o1,	%i6,	%i5
	edge16n	%i0,	%o6,	%g4
	movcs	%xcc,	%g5,	%l0
	edge16n	%i4,	%g3,	%g2
	fpadd16	%f8,	%f26,	%f22
	sllx	%g7,	0x19,	%i7
	fand	%f24,	%f2,	%f8
	fnot1	%f22,	%f26
	bn	loop_1694
	udiv	%i2,	0x0C26,	%g6
	wr	%g0,	0x18,	%asi
loop_1694:
	swap	[%l7 + 0x14],	%o2
	edge8l	%o4,	%l6,	%l3
	edge32	%o0,	%l4,	%o7
	bg,a,pn	%icc,	loop_1695
	fnegs	%f17,	%f22
	set	0x3C, %o4
	nop	 ! 	ldswa	[%l7 + %o4] 0x19,	%l5 ASI use changed by convert2hboot
loop_1695:
	fbn,a	%fcc1,	loop_1696
	movg	%icc,	%g1,	%i1
	fcmpd	%fcc0,	%f24,	%f20
	nop
	setx	loop_1697,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_1696:
	bpos,a	loop_1698
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	addcc	%o5,	%l2,	%i3
loop_1697:
	nop 	! 	tsubcctv	%o1,	%l1,	%i5 changed by convert2hboot
loop_1698:
	nop
	setx	loop_1699,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movgu	%xcc,	%i0,	%i6
	movrgz	%g4,	%g5,	%o6
	nop 	! 	tcs	%icc,	0x3 changed by convert2hboot
loop_1699:
	membar	0x12
	fmovdne	%icc,	%f30,	%f5
	alignaddrl	%i4,	%l0,	%g2
	fcmple32	%f22,	%f2,	%g3
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	fmovsvs	%xcc,	%f21,	%f14
	edge32n	%g7,	%i7,	%i2
	bshuffle	%f8,	%f24,	%f24
	set	0x20, %g1
	nop	 ! 	ldda	[%l7 + %g1] 0xea,	%g6 ASI use changed by convert2hboot
	fmovdcs	%xcc,	%f12,	%f25
	add	%o3,	%o2,	%o4
	mulscc	%l3,	%l6,	%o0
	addcc	%o7,	%l5,	%l4
	fmovdne	%icc,	%f30,	%f4
	brgez	%i1,	loop_1700
	srax	%o5,	%l2,	%i3
	sra	%g1,	%l1,	%o1
	movne	%xcc,	%i0,	%i6
loop_1700:
	fmul8ulx16	%f20,	%f28,	%f28
	fba,a	%fcc0,	loop_1701
	fpadd16	%f24,	%f4,	%f12
	nop
	set	0x58, %o5
	ldsw	[%l7 + %o5],	%i5
	nop 	! 	tl	%xcc,	0x7 changed by convert2hboot
loop_1701:
	movrne	%g5,	0x31D,	%g4
	nop
	setx loop_1702, %l0, %l1
	jmpl %l1, %o6
	movgu	%xcc,	%i4,	%l0
	ldsb	[%l7 + 0x38],	%g3
	ld	[%l7 + 0x44],	%f4
loop_1702:
	fmovdne	%xcc,	%f24,	%f19
	fandnot2	%f30,	%f8,	%f14
	alignaddr	%g2,	%i7,	%i2
	edge32l	%g6,	%g7,	%o3
	nop 	! 	taddcc	%o4,	0x0CEC,	%o2 changed by convert2hboot
	fbug	%fcc0,	loop_1703
	mulx	%l6,	0x1318,	%l3
	movrne	%o7,	%l5,	%o0
	nop 	! 	taddcctv	%i1,	%l4,	%o5 changed by convert2hboot
loop_1703:
	array32	%l2,	%g1,	%l1
	fcmpd	%fcc1,	%f22,	%f2
	edge32n	%i3,	%o1,	%i6
	edge32l	%i5,	%g5,	%i0
	edge8l	%g4,	%i4,	%o6
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
	movvc	%xcc,	%g3,	%l0
	movvc	%icc,	%i7,	%g2
	movge	%icc,	%i2,	%g7
	andcc	%g6,	%o3,	%o2
	srax	%o4,	0x0D,	%l3
	siam	0x5
	mova	%xcc,	%l6,	%l5
	ldub	[%l7 + 0x68],	%o0
	membar	0x26
	nop 	! 	tgu	%xcc,	0x5 changed by convert2hboot
	xor	%i1,	%o7,	%l4
	movleu	%xcc,	%l2,	%g1
	fnot2s	%f17,	%f8
	fmul8ulx16	%f16,	%f24,	%f30
	fornot1s	%f18,	%f1,	%f9
	edge16ln	%l1,	%o5,	%i3
	fpsub16	%f22,	%f6,	%f4
	bneg,a	%xcc,	loop_1704
	fnegs	%f8,	%f13
	fmovdleu	%icc,	%f7,	%f17
	brz	%o1,	loop_1705
loop_1704:
	fabsd	%f10,	%f14
	fmovsn	%icc,	%f9,	%f19
	nop 	! 	tsubcc	%i6,	0x0E09,	%i5 changed by convert2hboot
loop_1705:
	fbn	%fcc1,	loop_1706
	fmovsgu	%icc,	%f6,	%f27
	orcc	%g5,	%i0,	%i4
	umul	%g4,	0x1D6B,	%o6
loop_1706:
	nop 	! 	tpos	%xcc,	0x4 changed by convert2hboot
	fmovsle	%xcc,	%f21,	%f27
	fmovse	%xcc,	%f24,	%f3
	wr	%g0,	0x80,	%asi
	sta	%f8,	[%l7 + 0x68] %asi
	wr	%g0,	0xeb,	%asi
	wr	%g0,	0x10,	%asi
	edge32n	%g2,	%i2,	%g7
	bg	loop_1707
	bge,a,pn	%xcc,	loop_1708
	fmovdle	%icc,	%f31,	%f18
	brlez	%g6,	loop_1709
loop_1707:
	movvs	%icc,	%i7,	%o3
loop_1708:
	nop
	set	0x59, %l5
	nop	 ! 	ldsba	[%l7 + %l5] 0x0c,	%o4 ASI use changed by convert2hboot
loop_1709:
	nop
	set	0x30, %g7
	nop	 ! 	ldda	[%l7 + %g7] 0x2e,	%l2 ASI use changed by convert2hboot
	smul	%o2,	%l5,	%l6
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
	movn	%icc,	%o0,	%i1
	movvc	%xcc,	%l4,	%o7
	andn	%l2,	0x16A2,	%l1
	udivx	%o5,	0x06D1,	%g1
	edge16ln	%i3,	%o1,	%i5
	fandnot2	%f16,	%f6,	%f2
	bvc	%icc,	loop_1710
	nop 	! 	taddcc	%i6,	0x03DD,	%g5 changed by convert2hboot
	andcc	%i4,	%i0,	%o6
	addcc	%g4,	0x0D23,	%g3
loop_1710:
	orcc	%g2,	0x1DFB,	%l0
	nop 	! 	tl	%xcc,	0x2 changed by convert2hboot
	array16	%i2,	%g7,	%i7
	andcc	%g6,	%o3,	%l3
	or	%o2,	%o4,	%l5
	udiv	%l6,	0x1B99,	%o0
	wr	%g0,	0x04,	%asi
	fnot1s	%f2,	%f30
	movneg	%xcc,	%i1,	%l2
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	subc	%l1,	0x06E1,	%o5
	fbne,a	%fcc2,	loop_1711
	bl,pt	%icc,	loop_1712
	movrlz	%o7,	0x195,	%i3
	std	%f2,	[%l7 + 0x30]
loop_1711:
	edge16	%o1,	%g1,	%i6
loop_1712:
	srax	%g5,	%i5,	%i4
	ba	loop_1713
	nop
	setx	loop_1714,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	addccc	%o6,	%g4,	%i0
	movge	%icc,	%g2,	%g3
loop_1713:
	fbul	%fcc1,	loop_1715
loop_1714:
	fandnot2s	%f13,	%f17,	%f15
	membar	0x14
	or	%i2,	0x055F,	%g7
loop_1715:
	fone	%f6
	wr	%g0,	0x11,	%asi
	wr	%g0,	0x27,	%asi
	membar	#Sync
	movn	%xcc,	%i7,	%g6
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
	fmul8x16al	%f13,	%f4,	%f8
	andncc	%o3,	%l3,	%o4
	sll	%o2,	%l6,	%l5
	fpack32	%f4,	%f16,	%f26
	sra	%o0,	%l4,	%l2
	ldsw	[%l7 + 0x24],	%i1
	wr	%g0,	0x81,	%asi
	srl	%o5,	%l1,	%o7
	std	%o0,	[%l7 + 0x10]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%g1,	0x0A,	%i6
	nop 	! 	taddcc	%i3,	0x03EB,	%g5 changed by convert2hboot
	fcmple32	%f24,	%f26,	%i5
	set	0x58, %o1
	sta	%f12,	[%l7 + %o1] 0x80
	fmuld8ulx16	%f18,	%f19,	%f26
	fandnot1	%f0,	%f26,	%f24
	movrgz	%o6,	%g4,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%g2,	%g3
	umul	%i0,	0x0613,	%g7
	sllx	%l0,	0x0A,	%i2
	srax	%i7,	%o3,	%l3
	umulcc	%o4,	0x0B4E,	%o2
	edge16ln	%g6,	%l5,	%l6
	movrgz	%l4,	0x25E,	%o0
	bcc,a,pn	%icc,	loop_1716
	addccc	%i1,	0x073A,	%o5
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
	srax	%l1,	0x0D,	%l2
loop_1716:
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	edge8n	%o7,	%o1,	%i6
	subccc	%i3,	0x1D0B,	%g5
	smulcc	%g1,	0x0416,	%i5
	addcc	%o6,	0x119A,	%g4
	nop 	! 	tsubcc	%i4,	%g2,	%g3 changed by convert2hboot
	fsrc2s	%f11,	%f23
	nop 	! 	tl	%icc,	0x1 changed by convert2hboot
	andncc	%g7,	%l0,	%i2
	subcc	%i7,	%i0,	%o3
	fpadd32s	%f3,	%f22,	%f29
	sdivcc	%l3,	0x0C00,	%o4
	nop 	! 	tcs	%icc,	0x4 changed by convert2hboot
	fxnors	%f2,	%f3,	%f18
	ba,pt	%xcc,	loop_1717
	alignaddr	%g6,	%o2,	%l6
	edge8n	%l4,	%l5,	%o0
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
loop_1717:
	fcmpne16	%f22,	%f18,	%i1
	subccc	%o5,	0x03A3,	%l2
	addcc	%o7,	%l1,	%o1
	orn	%i3,	0x0ABE,	%g5
	xorcc	%i6,	0x0F0C,	%g1
	fmovsge	%xcc,	%f8,	%f0
	subcc	%o6,	0x1FC9,	%i5
	orcc	%i4,	0x1749,	%g4
	edge8l	%g2,	%g7,	%l0
	alignaddrl	%g3,	%i2,	%i7
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	smulcc	%o3,	%i0,	%l3
	edge8l	%o4,	%o2,	%l6
	array16	%g6,	%l4,	%l5
	movrlz	%o0,	%o5,	%i1
	brz,a	%o7,	loop_1718
	bne,pn	%icc,	loop_1719
	fmovspos	%icc,	%f15,	%f2
	edge32n	%l2,	%o1,	%l1
loop_1718:
	movneg	%xcc,	%i3,	%i6
loop_1719:
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
	edge32	%g1,	%g5,	%i5
	fandnot2s	%f4,	%f4,	%f13
	edge16ln	%o6,	%i4,	%g2
	ble	loop_1720
	sethi	0x00E8,	%g4
	nop 	! 	tsubcc	%g7,	%l0,	%g3 changed by convert2hboot
	movrne	%i2,	%o3,	%i0
loop_1720:
	xnorcc	%i7,	%l3,	%o4
	wr	%g0,	0x18,	%asi
	brz	%g6,	loop_1721
	smulcc	%l4,	0x0554,	%l5
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
	xnor	%o0,	0x168B,	%o5
loop_1721:
	fmovsleu	%xcc,	%f8,	%f3
	fone	%f2
	fmovrdlz	%l6,	%f14,	%f28
	ba,pn	%xcc,	loop_1722
	brz,a	%o7,	loop_1723
	nop 	! 	tleu	%xcc,	0x5 changed by convert2hboot
	movcs	%xcc,	%l2,	%i1
loop_1722:
	fxor	%f0,	%f10,	%f24
loop_1723:
	fandnot2	%f30,	%f24,	%f2
	fmul8x16al	%f1,	%f31,	%f4
	edge8n	%l1,	%i3,	%o1
	fmovsgu	%icc,	%f23,	%f6
	fmovdn	%icc,	%f2,	%f3
	fmuld8ulx16	%f7,	%f25,	%f24
	movneg	%icc,	%i6,	%g1
	edge16n	%g5,	%o6,	%i4
	ba,pn	%icc,	loop_1724
	movleu	%xcc,	%g2,	%i5
	be	%xcc,	loop_1725
	andn	%g7,	0x1A8A,	%g4
loop_1724:
	nop 	! 	tsubcctv	%l0,	0x13D9,	%g3 changed by convert2hboot
	edge16l	%o3,	%i2,	%i0
loop_1725:
	ldub	[%l7 + 0x7F],	%i7
	fbule	%fcc2,	loop_1726
	srax	%o4,	%l3,	%o2
	nop 	! 	taddcctv	%l4,	%g6,	%o0 changed by convert2hboot
	alignaddr	%o5,	%l6,	%l5
loop_1726:
	umulcc	%l2,	0x1F39,	%o7
	fzero	%f8
	nop 	! 	tle	%xcc,	0x2 changed by convert2hboot
	edge32	%i1,	%l1,	%o1
	xorcc	%i6,	0x0C6C,	%i3
	ldub	[%l7 + 0x4C],	%g5
	sdiv	%o6,	0x092D,	%g1
	fbge	%fcc0,	loop_1727
	membar	0x6B
	movgu	%xcc,	%g2,	%i4
	nop 	! 	tleu	%xcc,	0x5 changed by convert2hboot
loop_1727:
	edge16ln	%g7,	%g4,	%i5
	subc	%l0,	%o3,	%i2
	movgu	%xcc,	%g3,	%i0
	fmovdl	%icc,	%f22,	%f10
	umul	%o4,	%l3,	%i7
	fsrc2s	%f14,	%f2
	sdivx	%o2,	0x056C,	%g6
	nop 	! 	tvc	%xcc,	0x4 changed by convert2hboot
	fmovsgu	%icc,	%f21,	%f0
	edge32l	%o0,	%l4,	%o5
	fmul8x16au	%f22,	%f1,	%f6
	movgu	%icc,	%l5,	%l6
	fpsub32s	%f20,	%f21,	%f19
	andncc	%l2,	%i1,	%o7
	fmul8ulx16	%f24,	%f8,	%f18
	subcc	%l1,	0x147C,	%o1
	ldub	[%l7 + 0x42],	%i6
	nop 	! 	taddcctv	%g5,	%o6,	%i3 changed by convert2hboot
	ldsw	[%l7 + 0x40],	%g2
	umulcc	%g1,	%i4,	%g7
	nop 	! 	ta	%icc,	0x6 changed by convert2hboot
	fcmpgt16	%f26,	%f16,	%i5
	fble,a	%fcc3,	loop_1728
	fmovscc	%icc,	%f12,	%f27
	brlz	%l0,	loop_1729
	nop 	! 	tcc	%xcc,	0x7 changed by convert2hboot
loop_1728:
	edge16l	%o3,	%g4,	%i2
	sll	%i0,	%g3,	%l3
loop_1729:
	fones	%f2
	popc	%i7,	%o2
	fmovrdlz	%o4,	%f10,	%f30
	or	%g6,	0x12CA,	%l4
	fmul8sux16	%f28,	%f10,	%f24
	brlz,a	%o0,	loop_1730
	fbe,a	%fcc2,	loop_1731
	movvc	%icc,	%l5,	%l6
	fpackfix	%f24,	%f16
loop_1730:
	mulx	%o5,	%i1,	%l2
loop_1731:
	edge8l	%o7,	%o1,	%i6
	wr	%g0,	0x0c,	%asi
	fpsub32	%f20,	%f6,	%f26
	ldub	[%l7 + 0x54],	%l1
	fmovsge	%xcc,	%f3,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%o6,	%f12,	%f0
	stx	%g2,	[%l7 + 0x70]
	fmovrdlez	%g1,	%f6,	%f22
	movrne	%i3,	%i4,	%i5
	movne	%xcc,	%g7,	%l0
	nop 	! 	tpos	%icc,	0x4 changed by convert2hboot
	orncc	%g4,	0x1633,	%i2
	fble,a	%fcc3,	loop_1732
	fornot1	%f18,	%f10,	%f12
	edge16ln	%i0,	%g3,	%o3
	xorcc	%l3,	0x031D,	%o2
loop_1732:
	nop
	wr	%g0,	0x2f,	%asi
	membar	#Sync
	fcmped	%fcc1,	%f4,	%f16
	edge32n	%g6,	%o4,	%o0
	array8	%l5,	%l6,	%l4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i1
	nop	 ! 	casa	[%l6] 0x0c,	%i1,	%o5 ASI use changed by convert2hboot
	nop 	! 	taddcctv	%o7,	%l2,	%i6 changed by convert2hboot
	bvs	%xcc,	loop_1733
	membar	0x48
	array32	%g5,	%o1,	%l1
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
loop_1733:
	movrlz	%o6,	%g2,	%g1
	alignaddrl	%i4,	%i5,	%g7
	movrlz	%l0,	0x2C0,	%g4
	nop
	setx loop_1734, %l0, %l1
	jmpl %l1, %i2
	fbule	%fcc3,	loop_1735
	brlz	%i0,	loop_1736
	fcmpes	%fcc0,	%f28,	%f21
loop_1734:
	fmovdleu	%icc,	%f4,	%f24
loop_1735:
	subcc	%g3,	0x14A5,	%o3
loop_1736:
	fpack16	%f2,	%f2
	fxor	%f16,	%f12,	%f16
	orn	%l3,	0x0DFC,	%i3
	bvs,a	loop_1737
	move	%icc,	%o2,	%g6
	ldub	[%l7 + 0x79],	%o4
	fmovsvc	%xcc,	%f29,	%f26
loop_1737:
	nop
	set	0x28, %g5
	nop	 ! 	ldsha	[%l7 + %g5] 0x19,	%o0 ASI use changed by convert2hboot
	fmovdn	%xcc,	%f31,	%f12
	movcc	%xcc,	%i7,	%l6
	fmovrse	%l5,	%f30,	%f12
	alignaddr	%i1,	%o5,	%l4
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	subcc	%l2,	0x148F,	%o7
	smulcc	%i6,	0x0BD8,	%g5
	bn,a,pt	%xcc,	loop_1738
	st	%f16,	[%l7 + 0x1C]
	fbue	%fcc0,	loop_1739
	sdiv	%l1,	0x1C0A,	%o1
loop_1738:
	be,pt	%xcc,	loop_1740
	movneg	%icc,	%o6,	%g2
loop_1739:
	bn,a	%icc,	loop_1741
	movn	%xcc,	%i4,	%g1
loop_1740:
	nop
	set	0x48, %o2
	nop	 ! 	stda	%i4,	[%l7 + %o2] 0x04 ASI use changed by convert2hboot
loop_1741:
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	set	0x58, %l3
	lda	[%l7 + %l3] 0x10,	%f20
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	or	%g7,	0x0272,	%l0
	set	0x30, %l2
	nop	 ! 	stda	%i2,	[%l7 + %l2] 0x2f ASI use changed by convert2hboot
	membar	#Sync
	srl	%i0,	0x02,	%g3
	fmovdcc	%icc,	%f24,	%f25
	nop 	! 	tvc	%icc,	0x5 changed by convert2hboot
	fandnot2s	%f23,	%f7,	%f21
	alignaddr	%g4,	%o3,	%i3
	array32	%l3,	%o2,	%g6
	fcmped	%fcc3,	%f2,	%f14
	sra	%o0,	%o4,	%l6
	fmovrsgz	%i7,	%f18,	%f0
	fmovdl	%icc,	%f7,	%f20
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
	wr	%g0,	0x80,	%asi
	stb	%o5,	[%l7 + 0x48]
	udivx	%i1,	0x0F44,	%l4
	for	%f6,	%f20,	%f16
	swap	[%l7 + 0x5C],	%o7
	nop 	! 	tsubcctv	%i6,	0x0898,	%l2 changed by convert2hboot
	addccc	%l1,	%g5,	%o1
	edge32ln	%g2,	%i4,	%o6
	addcc	%i5,	0x1D32,	%g7
	nop
	setx loop_1742, %l0, %l1
	jmpl %l1, %g1
	fmovse	%icc,	%f26,	%f1
	bvc,a,pn	%icc,	loop_1743
	andcc	%i2,	%i0,	%g3
loop_1742:
	addc	%g4,	0x1DAF,	%l0
	srlx	%o3,	0x15,	%i3
loop_1743:
	fmuld8sux16	%f3,	%f18,	%f2
	movvs	%icc,	%l3,	%o2
	movne	%xcc,	%g6,	%o4
	set	0x58, %g2
	nop	 ! 	prefetcha	[%l7 + %g2] 0x80,	 0x0 ASI use changed by convert2hboot
	fcmpeq16	%f16,	%f6,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f12,	%f26,	%f2
	fone	%f2
	fpsub32s	%f8,	%f21,	%f19
	smul	%l5,	0x1460,	%i7
	add	%i1,	0x1A36,	%l4
	bvc,pn	%xcc,	loop_1744
	movre	%o7,	%i6,	%l2
	movpos	%icc,	%o5,	%l1
	udivx	%g5,	0x16BE,	%o1
loop_1744:
	fcmpes	%fcc3,	%f7,	%f5
	fmovrslez	%g2,	%f10,	%f30
	mulscc	%o6,	%i4,	%g7
	wr	%g0,	0xf9,	%asi
	membar	#Sync
	fmul8sux16	%f0,	%f18,	%f24
	movcc	%icc,	%g1,	%i5
	fsrc1	%f2,	%f14
	set	0x50, %o0
	nop	 ! 	ldda	[%l7 + %o0] 0x22,	%i2 ASI use changed by convert2hboot
	fpack16	%f26,	%f20
	faligndata	%f6,	%f16,	%f20
	set	0x40, %g4
	nop	 ! 	stda	%f16,	[%l7 + %g4] 0x19 ASI use changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f24,	%f16
	nop 	! 	tvc	%xcc,	0x4 changed by convert2hboot
	mova	%icc,	%g3,	%g4
	fornot1s	%f30,	%f13,	%f4
	nop 	! 	taddcctv	%i0,	%l0,	%i3 changed by convert2hboot
	fornot1s	%f16,	%f3,	%f9
	fbug	%fcc2,	loop_1745
	nop 	! 	tcs	%icc,	0x4 changed by convert2hboot
	movrlz	%l3,	0x3FF,	%o2
	set	0x58, %l6
	nop	 ! 	ldxa	[%l7 + %l6] 0x89,	%o3 ASI use changed by convert2hboot
loop_1745:
	popc	0x124F,	%o4
	set	0x2E, %l0
	nop	 ! 	ldsha	[%l7 + %l0] 0x81,	%g6 ASI use changed by convert2hboot
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
	ldsw	[%l7 + 0x7C],	%l6
	subcc	%l5,	0x054D,	%i7
	xorcc	%o0,	0x0414,	%i1
	udivx	%o7,	0x0043,	%l4
	wr	%g0,	0x0c,	%asi
	movvc	%icc,	%o5,	%l1
	fcmpeq32	%f30,	%f4,	%g5
	fxors	%f15,	%f21,	%f5
	nop 	! 	tpos	%xcc,	0x6 changed by convert2hboot
	set	0x0E, %l4
	nop	 ! 	lduha	[%l7 + %l4] 0x10,	%l2 ASI use changed by convert2hboot
	fcmpgt32	%f30,	%f24,	%o1
	mulscc	%g2,	%i4,	%o6
	udivcc	%g7,	0x010C,	%g1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x18] %asi,	%f14
	fmovdvc	%xcc,	%f2,	%f12
	smulcc	%i5,	0x0242,	%g3
	wr	%g0,	0x19,	%asi
	nop 	! 	tle	%icc,	0x3 changed by convert2hboot
	brlz,a	%i0,	loop_1746
	movle	%xcc,	%i2,	%l0
	array32	%i3,	%o2,	%o3
	bvc,a	loop_1747
loop_1746:
	bge,pn	%icc,	loop_1748
	fmovscs	%icc,	%f30,	%f5
	orcc	%o4,	%g6,	%l6
loop_1747:
	movcc	%icc,	%l5,	%l3
loop_1748:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
	fpadd16	%f28,	%f28,	%f16
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	subcc	%o0,	%i7,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%l4,	loop_1749
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	fmovdl	%xcc,	%f10,	%f4
loop_1749:
	xorcc	%i6,	0x1B1F,	%i1
	umulcc	%l1,	%g5,	%o5
	sll	%l2,	%o1,	%g2
	brgz	%o6,	loop_1750
	movvc	%icc,	%i4,	%g7
	wr	%g0,	0x11,	%asi
loop_1750:
	membar	0x64
	xnorcc	%g1,	%g4,	%i0
	edge32l	%i2,	%g3,	%l0
	stx	%o2,	[%l7 + 0x50]
	movl	%xcc,	%i3,	%o3
	wr	%g0,	0x88,	%asi
	sra	%o4,	0x1E,	%l6
	fbul	%fcc3,	loop_1751
	fcmps	%fcc2,	%f24,	%f3
	nop 	! 	te	%xcc,	0x5 changed by convert2hboot
	sra	%l5,	%l3,	%o0
loop_1751:
	swap	[%l7 + 0x14],	%i7
	or	%o7,	%i6,	%l4
	fone	%f20
	nop 	! 	tsubcc	%l1,	%i1,	%o5 changed by convert2hboot
	movle	%xcc,	%g5,	%o1
	fones	%f5
	fmovrde	%g2,	%f12,	%f30
	membar	0x38
	fmuld8ulx16	%f24,	%f29,	%f2
	udivx	%l2,	0x1F4F,	%o6
	movcc	%icc,	%g7,	%i5
	array16	%g1,	%g4,	%i0
	fmovrdlz	%i2,	%f24,	%f10
	edge16ln	%g3,	%i4,	%o2
	movpos	%xcc,	%i3,	%l0
	fba,a	%fcc0,	loop_1752
	udiv	%g6,	0x1236,	%o3
	udivcc	%l6,	0x1270,	%o4
	sdiv	%l5,	0x1116,	%l3
loop_1752:
	fmuld8sux16	%f21,	%f3,	%f4
	bg,pn	%xcc,	loop_1753
	nop 	! 	tneg	%icc,	0x5 changed by convert2hboot
	stw	%o0,	[%l7 + 0x38]
	movpos	%xcc,	%o7,	%i7
loop_1753:
	movgu	%icc,	%i6,	%l1
	movpos	%icc,	%l4,	%i1
	fbne,a	%fcc0,	loop_1754
	fcmpne16	%f28,	%f20,	%o5
	fmovsg	%icc,	%f18,	%f29
	movrlez	%o1,	%g5,	%l2
loop_1754:
	nop 	! 	tg	%xcc,	0x0 changed by convert2hboot
	ba,a,pt	%xcc,	loop_1755
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f8,	%f8,	%f24
	nop 	! 	taddcc	%g2,	%o6,	%g7 changed by convert2hboot
loop_1755:
	movrne	%g1,	0x098,	%i5
	xor	%i0,	%g4,	%i2
	movleu	%icc,	%g3,	%i4
	mulscc	%i3,	%l0,	%o2
	edge32ln	%o3,	%l6,	%o4
	array8	%g6,	%l3,	%o0
	nop 	! 	tsubcctv	%l5,	%i7,	%o7 changed by convert2hboot
	sdivx	%l1,	0x138E,	%i6
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
	wr	%g0,	0x0c,	%asi
	sta	%f2,	[%l7 + 0x6C] %asi
	bleu,a,pt	%icc,	loop_1756
	or	%i1,	%l4,	%o5
	fmovrslz	%g5,	%f6,	%f27
	array32	%o1,	%g2,	%o6
loop_1756:
	nop 	! 	taddcctv	%g7,	%g1,	%i5 changed by convert2hboot
	fcmple32	%f20,	%f0,	%l2
	bcs,pt	%xcc,	loop_1757
	fnors	%f22,	%f27,	%f3
	edge8l	%g4,	%i2,	%i0
	fbl,a	%fcc3,	loop_1758
loop_1757:
	edge16ln	%i4,	%g3,	%l0
	movrgez	%i3,	%o3,	%l6
	nop 	! 	tne	%icc,	0x5 changed by convert2hboot
loop_1758:
	movrgez	%o4,	%o2,	%l3
	fmovdg	%icc,	%f27,	%f4
	nop 	! 	taddcctv	%o0,	0x1B84,	%l5 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	fxors	%f22,	%f11,	%f8
	ldd	[%l7 + 0x10],	%g6
	fmovdleu	%xcc,	%f25,	%f22
	subccc	%i7,	0x19F3,	%l1
	fmul8x16	%f6,	%f4,	%f24
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
	subccc	%i6,	%o7,	%l4
	array16	%i1,	%o5,	%g5
	alignaddrl	%o1,	%g2,	%g7
	brgz,a	%o6,	loop_1759
	edge8l	%i5,	%l2,	%g1
	membar	0x39
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
loop_1759:
	umul	%i2,	0x064C,	%i0
	andcc	%i4,	0x0228,	%g4
	edge16	%g3,	%l0,	%i3
	fmovsneg	%xcc,	%f21,	%f31
	fcmpgt16	%f22,	%f24,	%l6
	fsrc2s	%f11,	%f7
	nop 	! 	tpos	%xcc,	0x6 changed by convert2hboot
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	subccc	%o4,	%o2,	%o3
	ldsh	[%l7 + 0x18],	%l3
	orncc	%l5,	0x0C77,	%o0
	fba	%fcc3,	loop_1760
	array16	%i7,	%l1,	%g6
	move	%icc,	%o7,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1760:
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	bpos,a	%xcc,	loop_1761
	movg	%xcc,	%i6,	%o5
	wr	%g0,	0x80,	%asi
loop_1761:
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	nop 	! 	tsubcc	%g5,	0x1554,	%o1 changed by convert2hboot
	popc	%i1,	%g7
	nop 	! 	tleu	%xcc,	0x7 changed by convert2hboot
	nop 	! 	tsubcc	%g2,	0x0015,	%o6 changed by convert2hboot
	bcs	loop_1762
	fbn,a	%fcc3,	loop_1763
	movne	%xcc,	%l2,	%g1
	fmovsleu	%xcc,	%f11,	%f5
loop_1762:
	edge16n	%i2,	%i0,	%i4
loop_1763:
	nop 	! 	tsubcctv	%i5,	0x0E5F,	%g3 changed by convert2hboot
	smul	%g4,	0x1397,	%l0
	movleu	%icc,	%i3,	%l6
	edge32	%o4,	%o2,	%o3
	ldd	[%l7 + 0x20],	%l4
	or	%o0,	0x0EAC,	%i7
	set	0x1E, %o6
	nop	 ! 	lduba	[%l7 + %o6] 0x04,	%l1 ASI use changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g6,	%o7,	%l3
	fornot1	%f2,	%f4,	%f8
	edge8	%i6,	%l4,	%o5
	nop 	! 	taddcctv	%o1,	%i1,	%g7 changed by convert2hboot
	xor	%g2,	0x139B,	%g5
	udiv	%o6,	0x0BFD,	%g1
	movgu	%xcc,	%l2,	%i0
	brgez,a	%i4,	loop_1764
	bpos,a,pn	%xcc,	loop_1765
	edge32	%i2,	%g3,	%g4
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
loop_1764:
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
loop_1765:
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	sth	%i5,	[%l7 + 0x72]
	brz,a	%l0,	loop_1766
	andncc	%l6,	%i3,	%o2
	bl	loop_1767
	alignaddr	%o4,	%o3,	%l5
loop_1766:
	fmovsvs	%xcc,	%f10,	%f15
	andncc	%i7,	%l1,	%o0
loop_1767:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	brnz	%g6,	loop_1768
	udivcc	%o7,	0x1DCA,	%i6
	fmovs	%f16,	%f31
	bne	%icc,	loop_1769
loop_1768:
	fmovrdlz	%l3,	%f16,	%f30
	movpos	%icc,	%o5,	%l4
	fmovsn	%icc,	%f4,	%f30
loop_1769:
	sll	%i1,	%o1,	%g7
	edge32ln	%g5,	%o6,	%g1
	add	%g2,	0x1367,	%i0
	edge16	%l2,	%i2,	%g3
	nop
	set	0x40, %i0
	std	%g4,	[%l7 + %i0]
	nop 	! 	tvs	%icc,	0x1 changed by convert2hboot
	nop
	set	0x3F, %i3
	stb	%i5,	[%l7 + %i3]
	andncc	%l0,	%l6,	%i3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	nop	 ! 	casxa	[%l6] 0x89,	%i4,	%o4 ASI use changed by convert2hboot
	fcmped	%fcc1,	%f30,	%f30
	srax	%o3,	0x19,	%o2
	orcc	%l5,	0x1A8B,	%i7
	fmovspos	%xcc,	%f23,	%f5
	fcmped	%fcc1,	%f22,	%f4
	udivx	%l1,	0x0003,	%o0
	swap	[%l7 + 0x10],	%o7
	fcmpgt32	%f16,	%f12,	%i6
	addc	%l3,	%g6,	%o5
	flush	%l7 + 0x70
	edge32ln	%i1,	%o1,	%g7
	fbul,a	%fcc0,	loop_1770
	movge	%xcc,	%g5,	%o6
	fmovrsgez	%g1,	%f14,	%f14
	nop 	! 	tpos	%icc,	0x0 changed by convert2hboot
loop_1770:
	brgz,a	%g2,	loop_1771
	sdivcc	%l4,	0x1B9A,	%l2
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
	fone	%f14
loop_1771:
	fone	%f16
	fsrc2s	%f8,	%f4
	sub	%i2,	%g3,	%g4
	movge	%xcc,	%i0,	%i5
	fmovscs	%xcc,	%f26,	%f5
	fxors	%f10,	%f15,	%f5
	umulcc	%l0,	0x0390,	%l6
	brnz,a	%i3,	loop_1772
	nop 	! 	ta	%icc,	0x7 changed by convert2hboot
	orcc	%i4,	0x0900,	%o3
	fnand	%f12,	%f16,	%f12
loop_1772:
	movrlez	%o4,	%o2,	%l5
	fmovdleu	%icc,	%f26,	%f26
	sllx	%l1,	%o0,	%i7
	fmovrdgz	%o7,	%f20,	%f14
	set	0x60, %i4
	nop	 ! 	stha	%i6,	[%l7 + %i4] 0x2b ASI use changed by convert2hboot
	membar	#Sync
	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl
	alignaddrl	%o5,	%g6,	%o1
	srax	%i1,	%g7,	%o6
	addccc	%g1,	%g2,	%l4
	sth	%l2,	[%l7 + 0x32]
	subc	%g5,	0x1569,	%i2
	stb	%g3,	[%l7 + 0x6E]
	sub	%g4,	0x184A,	%i0
	fexpand	%f14,	%f16
	nop
	set	0x71, %i7
	stb	%i5,	[%l7 + %i7]
	brgez,a	%l0,	loop_1773
	edge16n	%i3,	%i4,	%o3
	fbn,a	%fcc3,	loop_1774
	fpadd32s	%f3,	%f22,	%f12
loop_1773:
	orcc	%o4,	%l6,	%o2
	edge16l	%l1,	%o0,	%l5
loop_1774:
	brlz	%i7,	loop_1775
	sdiv	%i6,	0x1C39,	%l3
	addc	%o5,	0x18B6,	%g6
	fblg	%fcc3,	loop_1776
loop_1775:
	addccc	%o1,	0x0C45,	%i1
	fmovrdlz	%g7,	%f12,	%f26
	fzero	%f16
loop_1776:
	nop
	set	0x60, %l1
	nop	 ! 	ldda	[%l7 + %l1] 0x11,	%o6 ASI use changed by convert2hboot
	lduh	[%l7 + 0x20],	%o7
	movleu	%icc,	%g2,	%g1
	nop
	set	0x68, %i2
	ldub	[%l7 + %i2],	%l4
	sllx	%g5,	%i2,	%l2
	bn,a	loop_1777
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	movl	%xcc,	%g4,	%i0
	ldub	[%l7 + 0x59],	%i5
loop_1777:
	add	%g3,	0x18B4,	%l0
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	udivcc	%i4,	0x199A,	%o3
	movrne	%i3,	0x03A,	%o4
	alignaddr	%l6,	%l1,	%o2
	sdivx	%o0,	0x15AA,	%l5
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
	movne	%xcc,	%i7,	%l3
	fbul	%fcc1,	loop_1778
	nop 	! 	sir	0x0C31 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	fand	%f24,	%f30,	%f2
loop_1778:
	ldd	[%l7 + 0x48],	%o4
	array8	%i6,	%o1,	%g6
	movcc	%xcc,	%g7,	%i1
	movvs	%icc,	%o6,	%g2
	wr	%g0,	0x80,	%asi
	xorcc	%g1,	0x1B19,	%g5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	nop	 ! 	casa	[%l6] 0x89,	%i2,	%l2 ASI use changed by convert2hboot
	nop
	set	0x7D, %i1
	ldub	[%l7 + %i1],	%l4
	sra	%g4,	%i5,	%i0
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	xnorcc	%g3,	0x0CF7,	%i4
	udivx	%l0,	0x101B,	%i3
	movn	%xcc,	%o4,	%l6
	nop 	! 	taddcctv	%o3,	0x0065,	%l1 changed by convert2hboot
	std	%f30,	[%l7 + 0x18]
	array32	%o0,	%o2,	%i7
	fcmpne16	%f22,	%f22,	%l5
	orncc	%o5,	0x0C1D,	%l3
	array8	%o1,	%i6,	%g6
	fmovdgu	%xcc,	%f20,	%f22
	set	0x1A, %o3
	nop	 ! 	lduha	[%l7 + %o3] 0x11,	%g7 ASI use changed by convert2hboot
	edge32l	%i1,	%o6,	%o7
	movneg	%xcc,	%g2,	%g1
	fmovdleu	%xcc,	%f2,	%f1
	stx	%g5,	[%l7 + 0x30]
	bne	%icc,	loop_1779
	popc	%l2,	%i2
	udivcc	%l4,	0x0DF5,	%g4
	movpos	%xcc,	%i5,	%g3
loop_1779:
	movrgz	%i4,	%i0,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2s	%f23,	%f5
	orcc	%o4,	%l0,	%l6
	addccc	%o3,	0x0147,	%l1
	fmovsle	%icc,	%f13,	%f19
	bgu,pt	%xcc,	loop_1780
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o0,	%o2,	%i7
	brz,a	%l5,	loop_1781
loop_1780:
	subccc	%o5,	%o1,	%i6
	andn	%g6,	%l3,	%i1
	ldub	[%l7 + 0x25],	%g7
loop_1781:
	xnorcc	%o6,	%g2,	%g1
	nop 	! 	taddcctv	%o7,	%g5,	%l2 changed by convert2hboot
	array32	%l4,	%i2,	%g4
	srax	%i5,	0x04,	%g3
	or	%i0,	%i4,	%i3
	orncc	%l0,	%o4,	%l6
	edge8ln	%l1,	%o0,	%o3
	movcc	%xcc,	%o2,	%l5
	move	%xcc,	%i7,	%o1
	movne	%xcc,	%i6,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l3,	%i1,	%g7
	ldub	[%l7 + 0x30],	%g6
	array32	%o6,	%g2,	%g1
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	edge32n	%o7,	%g5,	%l4
	udivcc	%i2,	0x1322,	%g4
	edge8ln	%l2,	%g3,	%i0
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	mulx	%i5,	0x038E,	%i4
	sllx	%l0,	0x1A,	%i3
	nop 	! 	ta	%xcc,	0x2 changed by convert2hboot
	fmovsgu	%icc,	%f10,	%f11
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x08],	%l6
	fmul8sux16	%f10,	%f6,	%f26
	fmovde	%xcc,	%f17,	%f30
	nop 	! 	taddcctv	%o4,	0x13EE,	%o0 changed by convert2hboot
	sll	%l1,	%o2,	%l5
	wr	%g0,	0x2f,	%asi
	membar	#Sync
	edge8ln	%o1,	%i7,	%i6
	and	%o5,	%l3,	%g7
	membar	0x2E
	faligndata	%f22,	%f24,	%f24
	nop 	! 	taddcctv	%g6,	0x0E81,	%o6 changed by convert2hboot
	for	%f22,	%f6,	%f8
	smul	%i1,	0x17D5,	%g1
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	ldub	[%l7 + 0x62],	%o7
	popc	%g5,	%g2
	brgz	%l4,	loop_1782
	sethi	0x1989,	%g4
	fnors	%f23,	%f29,	%f7
	orncc	%l2,	%i2,	%g3
loop_1782:
	nop 	! 	sir	0x120F changed by convert2hboot
	edge8ln	%i5,	%i0,	%i4
	fbne	%fcc2,	loop_1783
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	movleu	%xcc,	%l0,	%i3
loop_1783:
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
	bpos	%xcc,	loop_1784
	fbuge,a	%fcc2,	loop_1785
	or	%l6,	%o4,	%l1
	fmovsvc	%icc,	%f18,	%f7
loop_1784:
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
loop_1785:
	edge16n	%o0,	%o2,	%o3
	call	loop_1786
	mulx	%l5,	0x09EA,	%o1
	sth	%i6,	[%l7 + 0x5C]
	bg,pt	%icc,	loop_1787
loop_1786:
	sub	%i7,	0x1579,	%o5
	xnorcc	%l3,	%g6,	%o6
	addcc	%g7,	0x0490,	%g1
loop_1787:
	nop 	! 	tg	%xcc,	0x2 changed by convert2hboot
	xorcc	%o7,	%g5,	%g2
	fmovrdgez	%l4,	%f14,	%f4
	sllx	%g4,	0x13,	%i1
	fmovdge	%icc,	%f14,	%f26
	fcmps	%fcc1,	%f3,	%f9
	fmovsneg	%xcc,	%f24,	%f23
	nop 	! 	tsubcctv	%l2,	0x05AB,	%i2 changed by convert2hboot
	srl	%i5,	0x0E,	%g3
	udivx	%i4,	0x018C,	%l0
	subc	%i3,	0x0954,	%l6
	edge8l	%o4,	%i0,	%o0
	movrlez	%l1,	%o2,	%l5
	set	0x08, %g3
	nop	 ! 	ldxa	[%l7 + %g3] 0x0c,	%o3 ASI use changed by convert2hboot
	xorcc	%o1,	0x0810,	%i6
	brlez,a	%o5,	loop_1788
	fmovrde	%i7,	%f14,	%f14
	movcc	%icc,	%g6,	%l3
	set	0x70, %i6
	nop	 ! 	ldxa	[%l7 + %i6] 0x88,	%g7 ASI use changed by convert2hboot
loop_1788:
	fors	%f3,	%f8,	%f29
	mova	%icc,	%g1,	%o6
	siam	0x2
	fcmpne16	%f20,	%f12,	%o7
	edge8l	%g5,	%g2,	%g4
	ldsw	[%l7 + 0x3C],	%i1
	orn	%l4,	%l2,	%i5
	and	%i2,	%g3,	%l0
	membar	0x28
	fmovdneg	%xcc,	%f24,	%f3
	sdiv	%i4,	0x036E,	%l6
	nop 	! 	tcc	%xcc,	0x7 changed by convert2hboot
	edge8ln	%o4,	%i3,	%o0
	wr	%g0,	0x10,	%asi
	fnors	%f14,	%f27,	%f12
	fornot1s	%f29,	%f9,	%f7
	fsrc2	%f4,	%f8
	fmovda	%xcc,	%f18,	%f26
	edge32	%o2,	%i0,	%o3
	sdivcc	%l5,	0x1AB4,	%o1
	wr	%g0,	0xeb,	%asi
	membar	#Sync
	bvs,a,pn	%icc,	loop_1789
	fmovdcs	%icc,	%f21,	%f29
	umul	%i7,	%o5,	%l3
	ble,a	%icc,	loop_1790
loop_1789:
	nop
	setx	loop_1791,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	umulcc	%g7,	%g1,	%g6
loop_1790:
	fmovrslz	%o7,	%f27,	%f5
loop_1791:
	bgu	%xcc,	loop_1792
	movgu	%xcc,	%o6,	%g2
	nop 	! 	tvc	%xcc,	0x3 changed by convert2hboot
	movvc	%icc,	%g5,	%i1
loop_1792:
	fble,a	%fcc2,	loop_1793
	udivcc	%g4,	0x1D52,	%l2
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	bn,a	loop_1794
loop_1793:
	popc	0x1296,	%l4
	movrlez	%i5,	%i2,	%g3
	movvs	%icc,	%i4,	%l6
loop_1794:
	brgz	%o4,	loop_1795
	nop 	! 	tcs	%xcc,	0x3 changed by convert2hboot
	sdiv	%i3,	0x0090,	%o0
	srax	%l1,	0x14,	%l0
loop_1795:
	edge8n	%i0,	%o3,	%l5
	edge32	%o2,	%o1,	%i6
	call	loop_1796
	edge8n	%i7,	%l3,	%o5
	sdiv	%g1,	0x0A21,	%g7
	fbo	%fcc2,	loop_1797
loop_1796:
	array16	%o7,	%o6,	%g2
	ldd	[%l7 + 0x10],	%f8
	edge16ln	%g5,	%i1,	%g4
loop_1797:
	movrne	%g6,	%l2,	%i5
	movle	%xcc,	%l4,	%g3
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x18] %asi,	%f3
	fba	%fcc3,	loop_1798
	mulscc	%i4,	%l6,	%o4
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	subc	%i3,	0x0EBD,	%i2
loop_1798:
	fmovrsgez	%o0,	%f11,	%f23
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	movgu	%xcc,	%l0,	%i0
	sdivcc	%l1,	0x1D1B,	%l5
	fand	%f4,	%f8,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o2,	%o3,	%o1
	movg	%xcc,	%i7,	%i6
	nop 	! 	taddcc	%l3,	%o5,	%g1 changed by convert2hboot
	orn	%g7,	0x1454,	%o6
	mulx	%o7,	0x1A47,	%g5
	xor	%i1,	%g4,	%g2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	nop	 ! 	casa	[%l6] 0x89,	%l2,	%g6 ASI use changed by convert2hboot
	fmovs	%f22,	%f16
	brgez,a	%i5,	loop_1799
	edge16l	%g3,	%i4,	%l6
	andcc	%o4,	0x1A67,	%i3
	movrne	%l4,	0x074,	%o0
loop_1799:
	fmul8x16au	%f25,	%f18,	%f14
	nop 	! 	tpos	%icc,	0x0 changed by convert2hboot
	nop 	! 	tsubcctv	%l0,	0x0A86,	%i2 changed by convert2hboot
	fbl,a	%fcc1,	loop_1800
	bge,a	%xcc,	loop_1801
	sdivcc	%i0,	0x1330,	%l5
	fmovsvs	%icc,	%f31,	%f20
loop_1800:
	or	%o2,	0x069F,	%o3
loop_1801:
	movrne	%l1,	0x277,	%o1
	movg	%icc,	%i7,	%l3
	andn	%o5,	0x1A95,	%g1
	fpmerge	%f11,	%f25,	%f24
	udivx	%i6,	0x022E,	%g7
	fbn,a	%fcc3,	loop_1802
	orncc	%o7,	0x0512,	%o6
	brnz,a	%g5,	loop_1803
	subcc	%i1,	0x1E64,	%g2
loop_1802:
	movge	%icc,	%l2,	%g4
	sethi	0x1F83,	%i5
loop_1803:
	movge	%xcc,	%g6,	%g3
	sllx	%l6,	%o4,	%i4
	set	0x6E, %o7
	nop	 ! 	lduba	[%l7 + %o7] 0x19,	%l4 ASI use changed by convert2hboot
	or	%i3,	0x015F,	%l0
	edge32l	%i2,	%i0,	%l5
	set	0x38, %g6
	nop	 ! 	stxa	%o2,	[%l7 + %g6] 0x23 ASI use changed by convert2hboot
	membar	#Sync
	swap	[%l7 + 0x1C],	%o3
	brlz,a	%l1,	loop_1804
	nop
	setx	loop_1805,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	mulscc	%o1,	0x0337,	%i7
	nop 	! 	tle	%icc,	0x2 changed by convert2hboot
loop_1804:
	fmovsa	%icc,	%f31,	%f0
loop_1805:
	nop 	! 	sir	0x0B8E changed by convert2hboot
	add	%o0,	%o5,	%l3
	xnor	%g1,	%i6,	%o7
	edge16ln	%g7,	%g5,	%i1
	nop 	! 	ta	%xcc,	0x1 changed by convert2hboot
	movrlez	%o6,	%l2,	%g2
	smulcc	%g4,	0x1525,	%i5
	wr	%g0,	0x10,	%asi
	nop 	! 	ta	%icc,	0x7 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
	stx	%l6,	[%l7 + 0x58]
	sth	%g6,	[%l7 + 0x3C]
	std	%o4,	[%l7 + 0x40]
	edge8ln	%l4,	%i3,	%i4
	edge16n	%l0,	%i2,	%l5
	array8	%o2,	%o3,	%l1
	movvc	%xcc,	%o1,	%i0
	fpackfix	%f30,	%f6
	fsrc1	%f26,	%f26
	addccc	%i7,	%o0,	%o5
	fbug,a	%fcc3,	loop_1806
	udiv	%g1,	0x00E5,	%l3
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	movvc	%xcc,	%i6,	%o7
loop_1806:
	movvs	%icc,	%g7,	%i1
	nop 	! 	tcc	%icc,	0x1 changed by convert2hboot
	brlz	%o6,	loop_1807
	fpsub16s	%f25,	%f8,	%f6
	movge	%icc,	%l2,	%g2
	std	%g4,	[%l7 + 0x10]
loop_1807:
	stx	%g4,	[%l7 + 0x18]
	and	%i5,	%l6,	%g3
	fornot2	%f0,	%f0,	%f24
	fpmerge	%f3,	%f19,	%f22
	fmuld8ulx16	%f12,	%f8,	%f4
	wr	%g0,	0x04,	%asi
	movpos	%xcc,	%l4,	%o4
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
	edge32ln	%i4,	%l0,	%i2
	movre	%i3,	0x2C6,	%l5
	fnegs	%f10,	%f21
	bshuffle	%f2,	%f6,	%f6
	srlx	%o3,	0x13,	%o2
	edge16n	%o1,	%i0,	%l1
	fzero	%f22
	for	%f12,	%f30,	%f2
	fcmple16	%f18,	%f14,	%o0
	smulcc	%o5,	%i7,	%l3
	fcmpne32	%f16,	%f4,	%i6
	mova	%icc,	%g1,	%g7
	umulcc	%i1,	0x0C8F,	%o7
	umulcc	%l2,	%o6,	%g2
	and	%g4,	%i5,	%g5
	nop 	! 	tsubcc	%g3,	%l6,	%g6 changed by convert2hboot
	prefetch	[%l7 + 0x40],	 0x2
	fmuld8sux16	%f0,	%f27,	%f4
	fmovse	%xcc,	%f10,	%f10
	movneg	%xcc,	%l4,	%o4
	call	loop_1808
	ba	%xcc,	loop_1809
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1808:
	ld	[%l7 + 0x24],	%f3
loop_1809:
	nop 	! 	taddcctv	%l0,	0x1363,	%i2 changed by convert2hboot
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	nop	 ! 	casxa	[%l6] 0x0c,	%i3,	%l5 ASI use changed by convert2hboot
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	movrgz	%i4,	%o2,	%o3
	fsrc1	%f24,	%f14
	nop
	set	0x28, %i5
	stw	%o1,	[%l7 + %i5]
	movle	%xcc,	%l1,	%i0
	srlx	%o0,	%o5,	%l3
	movleu	%icc,	%i6,	%i7
	fpadd32s	%f12,	%f13,	%f14
	fandnot2s	%f16,	%f24,	%f17
	fbne,a	%fcc1,	loop_1810
	subccc	%g7,	0x0D7D,	%g1
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	fmovda	%icc,	%f18,	%f2
loop_1810:
	fnands	%f16,	%f4,	%f17
	orncc	%o7,	%l2,	%i1
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	fcmpgt32	%f22,	%f8,	%o6
	nop 	! 	tn	%icc,	0x5 changed by convert2hboot
	edge8n	%g4,	%g2,	%g5
	movvc	%xcc,	%g3,	%l6
	nop 	! 	tvs	%xcc,	0x0 changed by convert2hboot
	smulcc	%g6,	%i5,	%o4
	movl	%xcc,	%l4,	%i2
	stb	%l0,	[%l7 + 0x51]
	edge32	%l5,	%i3,	%o2
	ldsb	[%l7 + 0x19],	%i4
	bgu,a	%xcc,	loop_1811
	fsrc1	%f28,	%f24
	fornot1s	%f21,	%f18,	%f13
loop_1811:
	nop
	wr	%g0,	0x04,	%asi
	ble,a,pt	%icc,	loop_1812
	movre	%o3,	0x31D,	%i0
	udivcc	%l1,	0x12CB,	%o0
	wr	%g0,	0x81,	%asi
loop_1812:
	fbo,a	%fcc0,	loop_1813
	sll	%i6,	%i7,	%l3
	sra	%g7,	%o7,	%g1
	srl	%i1,	%l2,	%g4
loop_1813:
	nop 	! 	taddcctv	%o6,	%g5,	%g3 changed by convert2hboot
	xor	%g2,	0x161F,	%g6
	edge16l	%i5,	%o4,	%l6
	movgu	%icc,	%i2,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l5,	0x18,	%l4
	fmovse	%icc,	%f31,	%f9
	membar	0x62
	orncc	%i3,	%o2,	%o1
	smul	%o3,	0x1926,	%i0
	bleu,a	loop_1814
	sdivx	%i4,	0x15E0,	%o0
	fmovdn	%xcc,	%f3,	%f26
	nop 	! 	taddcc	%o5,	%l1,	%i7 changed by convert2hboot
loop_1814:
	fcmpgt32	%f28,	%f26,	%i6
	udiv	%g7,	0x1B99,	%l3
	fmovsg	%icc,	%f5,	%f19
	fabss	%f0,	%f24
	fcmps	%fcc1,	%f31,	%f11
	mulscc	%g1,	%o7,	%l2
	movrgez	%i1,	0x274,	%g4
	set	0x38, %g1
	nop	 ! 	lduwa	[%l7 + %g1] 0x88,	%o6 ASI use changed by convert2hboot
	movpos	%icc,	%g5,	%g3
	nop
	setx loop_1815, %l0, %l1
	jmpl %l1, %g6
	array8	%g2,	%o4,	%i5
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
	movrne	%l6,	0x1F9,	%l0
loop_1815:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l5,	%l4,	%i2
	fnand	%f10,	%f30,	%f22
	bge,pn	%icc,	loop_1816
	fmovsvc	%xcc,	%f20,	%f17
	nop 	! 	tle	%icc,	0x2 changed by convert2hboot
	lduw	[%l7 + 0x7C],	%o2
loop_1816:
	nop 	! 	tvc	%icc,	0x0 changed by convert2hboot
	add	%i3,	%o3,	%i0
	fmovrsgz	%o1,	%f5,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f10,	%f28
	nop 	! 	taddcctv	%i4,	0x0AC0,	%o5 changed by convert2hboot
	movrgz	%l1,	%i7,	%o0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	fabss	%f27,	%f17
	ldsb	[%l7 + 0x31],	%l3
	fmovsn	%xcc,	%f3,	%f12
	srl	%o7,	%l2,	%g1
	fpack16	%f4,	%f9
	brgz,a	%g4,	loop_1817
	brlez	%i1,	loop_1818
	fmovdleu	%icc,	%f1,	%f27
	fmovdne	%xcc,	%f0,	%f21
loop_1817:
	movneg	%icc,	%g5,	%g3
loop_1818:
	bn,a,pn	%xcc,	loop_1819
	mulscc	%g6,	%g2,	%o6
	andcc	%o4,	%l6,	%i5
	fpadd32	%f8,	%f2,	%f22
loop_1819:
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	wr	%g0,	0x0c,	%asi
	addccc	%l4,	0x193B,	%i2
	movvs	%xcc,	%o2,	%i3
	fors	%f21,	%f27,	%f28
	fcmple16	%f16,	%f28,	%l0
	wr	%g0,	0x19,	%asi
	fpadd32	%f22,	%f26,	%f8
	nop 	! 	tsubcc	%o3,	%i4,	%o5 changed by convert2hboot
	nop 	! 	tvc	%icc,	0x0 changed by convert2hboot
	edge32	%o1,	%i7,	%l1
	stw	%o0,	[%l7 + 0x28]
	smul	%g7,	%i6,	%l3
	edge16	%l2,	%g1,	%g4
	edge8n	%o7,	%g5,	%i1
	orcc	%g6,	%g3,	%g2
	fxors	%f11,	%f19,	%f10
	ba,a,pt	%xcc,	loop_1820
	nop
	setx loop_1821, %l0, %l1
	jmpl %l1, %o6
	nop 	! 	tsubcctv	%o4,	%l6,	%l5 changed by convert2hboot
	umul	%i5,	0x06A0,	%l4
loop_1820:
	xnorcc	%i2,	0x0429,	%i3
loop_1821:
	edge16	%l0,	%o2,	%i0
	fmovdne	%xcc,	%f21,	%f9
	ldd	[%l7 + 0x78],	%f6
	bvc,a,pt	%icc,	loop_1822
	sllx	%i4,	0x0E,	%o5
	bgu,pn	%xcc,	loop_1823
	nop 	! 	te	%icc,	0x0 changed by convert2hboot
loop_1822:
	fbo,a	%fcc1,	loop_1824
	movle	%xcc,	%o3,	%i7
loop_1823:
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
	edge16n	%l1,	%o0,	%g7
loop_1824:
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	movl	%xcc,	%o1,	%l3
	addc	%i6,	%l2,	%g4
	lduh	[%l7 + 0x64],	%o7
	movle	%icc,	%g1,	%g5
	andn	%g6,	%g3,	%i1
	sdivcc	%o6,	0x1F30,	%g2
	fbug	%fcc1,	loop_1825
	xnorcc	%o4,	%l5,	%l6
	set	0x70, %o4
	nop	 ! 	swapa	[%l7 + %o4] 0x10,	%l4 ASI use changed by convert2hboot
loop_1825:
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	xorcc	%i2,	%i3,	%i5
	array32	%o2,	%i0,	%l0
	and	%i4,	0x0545,	%o3
	array32	%i7,	%l1,	%o5
	movle	%icc,	%g7,	%o1
	edge8ln	%o0,	%i6,	%l2
	bneg	%icc,	loop_1826
	ldub	[%l7 + 0x21],	%l3
	mulx	%g4,	%o7,	%g1
	fnot2	%f8,	%f6
loop_1826:
	movrlz	%g6,	0x2C7,	%g3
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	fbuge	%fcc3,	loop_1827
	udivx	%i1,	0x1E7E,	%o6
	fmovdvc	%icc,	%f18,	%f3
	movrlz	%g5,	%g2,	%l5
loop_1827:
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	udivx	%l6,	0x0F8C,	%l4
	array32	%o4,	%i2,	%i5
	fbule	%fcc1,	loop_1828
	bvc	loop_1829
	array8	%o2,	%i0,	%i3
	fcmple32	%f26,	%f20,	%i4
loop_1828:
	nop
	wr	%g0,	0x80,	%asi
loop_1829:
	movg	%icc,	%i7,	%l1
	smul	%o5,	%o3,	%o1
	array16	%o0,	%i6,	%l2
	fandnot1	%f18,	%f18,	%f2
	movl	%icc,	%l3,	%g4
	fmovdcc	%xcc,	%f21,	%f0
	sllx	%o7,	0x09,	%g7
	movne	%icc,	%g6,	%g3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	nop	 ! 	casxa	[%l6] 0x0c,	%g1,	%o6 ASI use changed by convert2hboot
	sllx	%g5,	%i1,	%g2
	edge8n	%l6,	%l5,	%l4
	andncc	%o4,	%i5,	%o2
	nop 	! 	sir	0x018C changed by convert2hboot
	fmovdcc	%icc,	%f0,	%f9
	fmovdgu	%icc,	%f10,	%f27
	movle	%icc,	%i0,	%i2
	mulscc	%i4,	%l0,	%i3
	fpadd16s	%f19,	%f26,	%f5
	fmovdcc	%icc,	%f27,	%f29
	sll	%l1,	0x05,	%i7
	movcc	%icc,	%o5,	%o3
	nop
	set	0x78, %l5
	ldsh	[%l7 + %l5],	%o1
	fbl	%fcc2,	loop_1830
	edge16l	%i6,	%o0,	%l3
	sdivx	%l2,	0x13C9,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1830:
	fbn,a	%fcc0,	loop_1831
	array8	%g4,	%g6,	%g3
	nop 	! 	sir	0x1DFC changed by convert2hboot
	wr	%g0,	0x89,	%asi
loop_1831:
	fnegd	%f22,	%f4
	bgu,pt	%icc,	loop_1832
	movrgez	%g1,	0x30E,	%o6
	fmovsl	%icc,	%f3,	%f27
	sra	%i1,	%g2,	%g5
loop_1832:
	fnot1	%f4,	%f14
	sdivcc	%l5,	0x030A,	%l4
	brz,a	%l6,	loop_1833
	edge32l	%i5,	%o4,	%i0
	ldub	[%l7 + 0x7C],	%i2
	subc	%i4,	0x1F13,	%l0
loop_1833:
	movne	%xcc,	%i3,	%l1
	fbue	%fcc1,	loop_1834
	movrlz	%i7,	%o2,	%o3
	srlx	%o5,	%o1,	%i6
	subccc	%l3,	%l2,	%o0
loop_1834:
	edge8n	%o7,	%g6,	%g3
	fors	%f26,	%f25,	%f14
	edge16ln	%g4,	%g7,	%o6
	ble,pn	%icc,	loop_1835
	subccc	%g1,	%g2,	%i1
	ble,pt	%icc,	loop_1836
	nop 	! 	sir	0x0F4A changed by convert2hboot
loop_1835:
	addc	%l5,	%g5,	%l4
	movrlez	%l6,	0x0E1,	%i5
loop_1836:
	fmovsgu	%icc,	%f8,	%f22
	nop 	! 	tneg	%xcc,	0x7 changed by convert2hboot
	wr	%g0,	0x26,	%asi
	sra	%i0,	%i4,	%l0
	movle	%icc,	%i3,	%i2
	sllx	%l1,	%o2,	%o3
	nop 	! 	tsubcctv	%i7,	0x0AD5,	%o5 changed by convert2hboot
	bvs,pt	%xcc,	loop_1837
	fmul8ulx16	%f26,	%f12,	%f18
	movge	%icc,	%o1,	%l3
	nop 	! 	taddcctv	%l2,	%o0,	%i6 changed by convert2hboot
loop_1837:
	smul	%o7,	0x12F5,	%g6
	fmovdcs	%xcc,	%f15,	%f1
	fsrc1s	%f14,	%f9
	movgu	%xcc,	%g3,	%g4
	fble	%fcc0,	loop_1838
	edge8	%o6,	%g7,	%g2
	fmul8x16au	%f20,	%f24,	%f30
	fnands	%f1,	%f22,	%f23
loop_1838:
	sdivx	%i1,	0x1152,	%g1
	sllx	%g5,	%l4,	%l6
	fcmpne16	%f8,	%f28,	%l5
	andn	%i5,	%i0,	%i4
	nop 	! 	tg	%icc,	0x1 changed by convert2hboot
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
	movneg	%xcc,	%l0,	%o4
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	smulcc	%i2,	%l1,	%o2
	edge8	%o3,	%i7,	%i3
	lduw	[%l7 + 0x78],	%o5
	edge32l	%l3,	%l2,	%o0
	sra	%o1,	0x1B,	%i6
	alignaddr	%g6,	%g3,	%o7
	fbu	%fcc0,	loop_1839
	movrgez	%g4,	%g7,	%g2
	udivx	%o6,	0x1E77,	%i1
	fbne	%fcc3,	loop_1840
loop_1839:
	fnot1	%f28,	%f8
	bcs	loop_1841
	edge32n	%g5,	%g1,	%l6
loop_1840:
	nop
	set	0x10, %o5
	nop	 ! 	lduwa	[%l7 + %o5] 0x80,	%l4 ASI use changed by convert2hboot
loop_1841:
	sub	%l5,	%i5,	%i4
	subccc	%l0,	0x1EA6,	%i0
	add	%o4,	0x16FB,	%l1
	fandnot1	%f24,	%f30,	%f0
	movn	%xcc,	%i2,	%o2
	movl	%xcc,	%i7,	%i3
	alignaddrl	%o5,	%o3,	%l2
	sdivcc	%l3,	0x1785,	%o0
	bge,a	%xcc,	loop_1842
	andcc	%o1,	0x0DF0,	%g6
	fzero	%f12
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
loop_1842:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x1f,	%asi
	membar	#Sync
	umulcc	%g3,	%i6,	%g4
	lduw	[%l7 + 0x64],	%g7
	movrgz	%g2,	0x125,	%o7
	edge32n	%i1,	%o6,	%g1
	nop 	! 	tsubcctv	%l6,	%g5,	%l4 changed by convert2hboot
	alignaddrl	%i5,	%i4,	%l5
	fands	%f13,	%f11,	%f27
	udivx	%l0,	0x1B19,	%i0
	edge32ln	%o4,	%i2,	%l1
	fpsub16s	%f28,	%f20,	%f30
	orn	%i7,	%i3,	%o2
	mulx	%o5,	%l2,	%o3
	fmovd	%f8,	%f4
	set	0x74, %o1
	nop	 ! 	stha	%o0,	[%l7 + %o1] 0x22 ASI use changed by convert2hboot
	membar	#Sync
	wr	%g0,	0x80,	%asi
	sta	%f13,	[%l7 + 0x34] %asi
	movle	%xcc,	%l3,	%o1
	membar	0x44
	subccc	%g3,	0x0909,	%i6
	movneg	%xcc,	%g6,	%g4
	subc	%g2,	%o7,	%g7
	fmovs	%f30,	%f30
	nop 	! 	ta	%icc,	0x2 changed by convert2hboot
	fnegd	%f4,	%f14
	fnot1s	%f12,	%f4
	ld	[%l7 + 0x40],	%f8
	array16	%o6,	%i1,	%l6
	wr	%g0,	0x0c,	%asi
	alignaddr	%g1,	%l4,	%i5
	ba,pt	%icc,	loop_1843
	movl	%xcc,	%l5,	%i4
	movg	%xcc,	%l0,	%i0
	movge	%xcc,	%o4,	%l1
loop_1843:
	udivx	%i7,	0x06BC,	%i2
	fornot1s	%f16,	%f1,	%f27
	bvc,pn	%xcc,	loop_1844
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	array16	%i3,	%o2,	%l2
	mulx	%o3,	%o0,	%o5
loop_1844:
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	bvs,a	%xcc,	loop_1845
	edge32	%l3,	%g3,	%i6
	nop
	set	0x30, %g5
	std	%o0,	[%l7 + %g5]
	flush	%l7 + 0x34
loop_1845:
	movle	%icc,	%g4,	%g2
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	movrgez	%o7,	%g7,	%g6
	fcmple32	%f30,	%f24,	%i1
	movge	%icc,	%l6,	%o6
	xorcc	%g5,	0x0287,	%g1
	movrlez	%l4,	0x251,	%i5
	nop 	! 	tg	%xcc,	0x4 changed by convert2hboot
	stw	%i4,	[%l7 + 0x70]
	set	0x14, %g7
	nop	 ! 	ldsha	[%l7 + %g7] 0x18,	%l5 ASI use changed by convert2hboot
	sdivcc	%l0,	0x00FD,	%i0
	fornot2s	%f11,	%f10,	%f4
	ldsb	[%l7 + 0x1B],	%o4
	movrgz	%l1,	%i2,	%i3
	movne	%xcc,	%o2,	%l2
	fornot2	%f20,	%f28,	%f20
	fbug,a	%fcc1,	loop_1846
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	nop 	! 	sir	0x0D41 changed by convert2hboot
	fbuge	%fcc1,	loop_1847
loop_1846:
	nop 	! 	tg	%icc,	0x3 changed by convert2hboot
	fnegs	%f29,	%f6
	fxnor	%f14,	%f22,	%f18
loop_1847:
	fpsub32s	%f12,	%f29,	%f3
	bvs	%xcc,	loop_1848
	ldsh	[%l7 + 0x40],	%o3
	fmovsge	%xcc,	%f4,	%f11
	edge16l	%o0,	%i7,	%o5
loop_1848:
	umul	%l3,	%g3,	%i6
	sdivcc	%g4,	0x10D7,	%g2
	fbe	%fcc1,	loop_1849
	brnz,a	%o7,	loop_1850
	fpackfix	%f0,	%f0
	ldx	[%l7 + 0x50],	%g7
loop_1849:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1850:
	fmovrdlez	%g6,	%f2,	%f6
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	edge16ln	%i1,	%o1,	%l6
	popc	0x1E17,	%g5
	movneg	%xcc,	%g1,	%l4
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
	brgz,a	%o6,	loop_1851
	fble,a	%fcc2,	loop_1852
	movneg	%icc,	%i5,	%l5
	array16	%i4,	%i0,	%l0
loop_1851:
	fzeros	%f16
loop_1852:
	membar	0x5C
	movg	%xcc,	%l1,	%o4
	bpos,a	%xcc,	loop_1853
	fpackfix	%f4,	%f23
	membar	0x05
	bpos	loop_1854
loop_1853:
	edge8n	%i3,	%o2,	%l2
	fbul	%fcc2,	loop_1855
	sub	%i2,	0x0694,	%o3
loop_1854:
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	xnorcc	%i7,	0x087D,	%o0
loop_1855:
	fmovsne	%xcc,	%f31,	%f22
	fbug,a	%fcc2,	loop_1856
	movg	%icc,	%o5,	%g3
	xnor	%l3,	0x10F4,	%i6
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
loop_1856:
	nop 	! 	tg	%xcc,	0x2 changed by convert2hboot
	fmovdn	%xcc,	%f25,	%f9
	movneg	%icc,	%g2,	%g4
	nop 	! 	tg	%icc,	0x3 changed by convert2hboot
	fmovsa	%icc,	%f2,	%f4
	nop 	! 	tpos	%icc,	0x4 changed by convert2hboot
	movne	%icc,	%o7,	%g7
	fbe,a	%fcc2,	loop_1857
	or	%g6,	0x1DCE,	%o1
	fpadd16	%f0,	%f4,	%f30
	ldx	[%l7 + 0x60],	%i1
loop_1857:
	fblg,a	%fcc0,	loop_1858
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
	edge16l	%l6,	%g1,	%l4
	nop 	! 	tleu	%icc,	0x1 changed by convert2hboot
loop_1858:
	popc	%g5,	%o6
	and	%i5,	0x18A5,	%i4
	wr	%g0,	0x88,	%asi
	sethi	0x1643,	%l0
	xnorcc	%l5,	%l1,	%i3
	fmovdge	%xcc,	%f6,	%f27
	subcc	%o2,	0x1FF2,	%o4
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	mulx	%i2,	%o3,	%l2
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	fbue,a	%fcc0,	loop_1859
	fcmpgt32	%f26,	%f26,	%o0
	movcs	%icc,	%i7,	%g3
	movvs	%xcc,	%o5,	%l3
loop_1859:
	movcs	%xcc,	%g2,	%g4
	wr	%g0,	0x80,	%asi
	movrlez	%o7,	0x1AA,	%g6
	fpackfix	%f28,	%f4
	fmovdpos	%xcc,	%f31,	%f27
	movrne	%g7,	0x25D,	%i1
	fabsd	%f2,	%f14
	fpsub16	%f14,	%f8,	%f24
	sllx	%l6,	%g1,	%l4
	fbule	%fcc3,	loop_1860
	ldd	[%l7 + 0x20],	%o0
	edge16ln	%g5,	%o6,	%i4
	alignaddrl	%i0,	%i5,	%l0
loop_1860:
	alignaddr	%l5,	%l1,	%i3
	restored
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
	smulcc	%o2,	%i2,	%o3
	fcmped	%fcc2,	%f24,	%f28
	andn	%o4,	0x1903,	%o0
	fabss	%f10,	%f8
	andncc	%l2,	%i7,	%g3
	fbn,a	%fcc3,	loop_1861
	movrlez	%l3,	%g2,	%g4
	nop 	! 	tcc	%xcc,	0x2 changed by convert2hboot
	or	%o5,	%i6,	%g6
loop_1861:
	xor	%o7,	0x0250,	%i1
	fnegd	%f26,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l6,	%g1,	%l4
	nop
	setx	loop_1862,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movrne	%o1,	%g5,	%o6
	smul	%i4,	0x08D3,	%i0
	subc	%i5,	0x1CC0,	%l0
loop_1862:
	sllx	%g7,	0x04,	%l5
	edge16l	%l1,	%o2,	%i2
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
	sth	%o3,	[%l7 + 0x74]
	bn	%icc,	loop_1863
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	edge16l	%o4,	%i3,	%l2
	fmovrsgz	%i7,	%f11,	%f15
loop_1863:
	edge16	%g3,	%o0,	%g2
	ld	[%l7 + 0x68],	%f21
	fornot2s	%f20,	%f23,	%f16
	movgu	%icc,	%g4,	%o5
	nop 	! 	te	%icc,	0x3 changed by convert2hboot
	wr	%g0,	0x80,	%asi
	stx	%g6,	[%l7 + 0x20]
	flush	%l7 + 0x6C
	wr	%g0,	0x18,	%asi
	fmovdcc	%icc,	%f28,	%f10
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	fmovdvs	%icc,	%f7,	%f24
	xorcc	%o7,	%l6,	%i1
	movvs	%xcc,	%g1,	%l4
	movrgz	%g5,	0x2A4,	%o6
	fexpand	%f2,	%f14
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	edge32n	%o1,	%i4,	%i0
	ldsh	[%l7 + 0x52],	%i5
	bleu,a,pn	%icc,	loop_1864
	srax	%g7,	0x0E,	%l0
	movpos	%icc,	%l5,	%o2
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
loop_1864:
	fmovrdgez	%l1,	%f14,	%f12
	sll	%i2,	0x04,	%o4
	subccc	%i3,	%l2,	%i7
	edge32	%o3,	%g3,	%g2
	movcc	%icc,	%o0,	%g4
	movneg	%xcc,	%o5,	%l3
	xnorcc	%i6,	0x172E,	%g6
	movg	%xcc,	%l6,	%o7
	move	%icc,	%g1,	%l4
	array8	%i1,	%g5,	%o1
	nop 	! 	tsubcc	%i4,	%o6,	%i0 changed by convert2hboot
	brgz,a	%g7,	loop_1865
	ld	[%l7 + 0x14],	%f2
	nop
	setx	loop_1866,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fxor	%f8,	%f24,	%f12
loop_1865:
	edge32l	%l0,	%i5,	%l5
	movl	%xcc,	%o2,	%l1
loop_1866:
	stb	%i2,	[%l7 + 0x0F]
	movcc	%icc,	%o4,	%l2
	fpack32	%f2,	%f6,	%f24
	nop 	! 	taddcctv	%i7,	%o3,	%g3 changed by convert2hboot
	addc	%g2,	%o0,	%i3
	fmovrdgz	%o5,	%f6,	%f2
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
	fzeros	%f0
	fmovdl	%xcc,	%f12,	%f31
	set	0x78, %l3
	nop	 ! 	stda	%g4,	[%l7 + %l3] 0x11 ASI use changed by convert2hboot
	edge8l	%l3,	%i6,	%g6
	pdist	%f12,	%f8,	%f30
	fpadd32s	%f8,	%f19,	%f25
	fmovdn	%icc,	%f7,	%f31
	lduh	[%l7 + 0x16],	%o7
	edge8ln	%g1,	%l4,	%i1
	movcs	%xcc,	%g5,	%l6
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	move	%icc,	%o1,	%o6
	nop 	! 	tsubcc	%i4,	%i0,	%l0 changed by convert2hboot
	movl	%icc,	%g7,	%i5
	xorcc	%o2,	0x0995,	%l5
	add	%i2,	0x1E15,	%o4
	array32	%l2,	%i7,	%l1
	nop 	! 	ta	%xcc,	0x0 changed by convert2hboot
	movvc	%xcc,	%g3,	%g2
	bpos	%xcc,	loop_1867
	orn	%o0,	0x16D0,	%i3
	bl,pt	%xcc,	loop_1868
	nop 	! 	taddcc	%o3,	%o5,	%g4 changed by convert2hboot
loop_1867:
	udivx	%i6,	0x0D1E,	%g6
	lduh	[%l7 + 0x7E],	%o7
loop_1868:
	subc	%g1,	0x0469,	%l4
	fmovdvs	%xcc,	%f22,	%f1
	fcmpeq32	%f2,	%f8,	%l3
	movne	%icc,	%i1,	%g5
	addc	%l6,	%o1,	%i4
	movcs	%xcc,	%o6,	%l0
	nop 	! 	sir	0x0755 changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	fnegd	%f0,	%f26
	fmovdgu	%xcc,	%f29,	%f15
	swap	[%l7 + 0x4C],	%g7
	bpos,pt	%xcc,	loop_1869
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
	fbge	%fcc1,	loop_1870
	fands	%f21,	%f15,	%f19
loop_1869:
	fnor	%f4,	%f14,	%f10
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
loop_1870:
	fblg	%fcc0,	loop_1871
	fnor	%f6,	%f16,	%f24
	bl,a	%xcc,	loop_1872
	mova	%xcc,	%i0,	%i5
loop_1871:
	ldsw	[%l7 + 0x78],	%l5
	udivx	%i2,	0x03B2,	%o4
loop_1872:
	fone	%f26
	sdivcc	%o2,	0x13C9,	%i7
	edge8	%l2,	%g3,	%l1
	and	%o0,	%i3,	%o3
	nop 	! 	tsubcctv	%o5,	0x0B9E,	%g4 changed by convert2hboot
	bneg,a	%icc,	loop_1873
	orcc	%i6,	0x04EE,	%g6
	srax	%o7,	%g2,	%g1
	fbul	%fcc3,	loop_1874
loop_1873:
	movrne	%l4,	0x116,	%l3
	array16	%g5,	%l6,	%o1
	srl	%i4,	%i1,	%l0
loop_1874:
	fmul8x16au	%f1,	%f2,	%f24
	fnegd	%f30,	%f2
	movgu	%icc,	%o6,	%i0
	fxor	%f26,	%f8,	%f16
	fbu,a	%fcc3,	loop_1875
	movvc	%icc,	%i5,	%l5
	fmovsgu	%xcc,	%f13,	%f19
	array16	%g7,	%i2,	%o2
loop_1875:
	mulx	%o4,	0x00C7,	%i7
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	sll	%l2,	%l1,	%g3
	movge	%xcc,	%o0,	%o3
	fmovs	%f19,	%f19
	fbne	%fcc2,	loop_1876
	fnor	%f20,	%f18,	%f18
	sllx	%i3,	%g4,	%o5
	subc	%g6,	0x02F4,	%i6
loop_1876:
	movneg	%xcc,	%o7,	%g1
	subc	%g2,	0x01E7,	%l4
	add	%g5,	%l3,	%l6
	xor	%o1,	%i1,	%l0
	fandnot2	%f22,	%f10,	%f2
	wr	%g0,	0x11,	%asi
	bl,a,pt	%xcc,	loop_1877
	sdivx	%o6,	0x1E46,	%i5
	xor	%l5,	0x0461,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1877:
	ldub	[%l7 + 0x0A],	%i2
	st	%f23,	[%l7 + 0x70]
	sdivcc	%o2,	0x04E0,	%o4
	fbne,a	%fcc0,	loop_1878
	fpsub16	%f26,	%f22,	%f16
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
loop_1878:
	addc	%i7,	%i0,	%l1
	nop
	set	0x40, %l2
	prefetch	[%l7 + %l2],	 0x2
	movrne	%g3,	0x054,	%l2
	fmovd	%f2,	%f28
	faligndata	%f0,	%f16,	%f10
	fpadd32	%f20,	%f18,	%f24
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
	orn	%o3,	%i3,	%o0
	fbuge	%fcc1,	loop_1879
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
	ldd	[%l7 + 0x30],	%g4
	umulcc	%g6,	%o5,	%o7
loop_1879:
	fmul8ulx16	%f12,	%f8,	%f4
	bleu,pt	%icc,	loop_1880
	movrgz	%i6,	0x070,	%g1
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tleu	%xcc,	0x0 changed by convert2hboot
loop_1880:
	andncc	%l4,	%g2,	%g5
	fzero	%f24
	fandnot1	%f26,	%f0,	%f18
	xnorcc	%l3,	0x1201,	%o1
	addcc	%i1,	0x1013,	%l6
	xor	%l0,	0x1375,	%i4
	set	0x14, %o2
	sta	%f11,	[%l7 + %o2] 0x80
	nop 	! 	taddcctv	%o6,	0x0863,	%i5 changed by convert2hboot
	movre	%l5,	%g7,	%i2
	std	%f14,	[%l7 + 0x70]
	sdivcc	%o2,	0x0923,	%o4
	wr	%g0,	0x81,	%asi
	brgez,a	%l1,	loop_1881
	fmovdleu	%xcc,	%f28,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%xcc,	%f2,	%f4
loop_1881:
	fbul,a	%fcc0,	loop_1882
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge	%fcc2,	loop_1883
	move	%icc,	%i7,	%g3
loop_1882:
	fmovsneg	%icc,	%f10,	%f9
	nop 	! 	tleu	%xcc,	0x0 changed by convert2hboot
loop_1883:
	lduw	[%l7 + 0x70],	%o3
	fnors	%f25,	%f9,	%f13
	movle	%icc,	%l2,	%i3
	movleu	%xcc,	%g4,	%g6
	sra	%o0,	0x07,	%o5
	andncc	%o7,	%i6,	%g1
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	fnor	%f10,	%f30,	%f2
	edge16	%l4,	%g5,	%g2
	brlz,a	%l3,	loop_1884
	movrlez	%o1,	0x223,	%i1
	move	%icc,	%l0,	%i4
	srlx	%l6,	0x1A,	%o6
loop_1884:
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	nop 	! 	tneg	%xcc,	0x2 changed by convert2hboot
	ldsb	[%l7 + 0x58],	%i5
	bleu,a	loop_1885
	fpackfix	%f30,	%f10
	fors	%f22,	%f1,	%f29
	movleu	%icc,	%g7,	%i2
loop_1885:
	movn	%xcc,	%l5,	%o2
	fbo	%fcc0,	loop_1886
	movvc	%xcc,	%o4,	%l1
	edge32l	%i0,	%g3,	%i7
	movrgez	%l2,	%i3,	%g4
loop_1886:
	add	%o3,	%g6,	%o0
	fnot2	%f18,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo	%fcc3,	loop_1887
	fbule	%fcc1,	loop_1888
	subcc	%o7,	%i6,	%o5
	fmovsn	%xcc,	%f14,	%f23
loop_1887:
	mova	%xcc,	%l4,	%g1
loop_1888:
	lduh	[%l7 + 0x24],	%g5
	nop 	! 	tpos	%xcc,	0x1 changed by convert2hboot
	sra	%g2,	%o1,	%l3
	fbne,a	%fcc0,	loop_1889
	fmuld8ulx16	%f5,	%f18,	%f16
	alignaddr	%i1,	%l0,	%l6
	fpadd16s	%f21,	%f29,	%f6
loop_1889:
	movneg	%xcc,	%i4,	%i5
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	edge8n	%g7,	%i2,	%l5
	movneg	%xcc,	%o6,	%o2
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	smul	%l1,	%o4,	%g3
	fmul8sux16	%f12,	%f16,	%f30
	sdivcc	%i0,	0x1955,	%l2
	fbug	%fcc1,	loop_1890
	mulscc	%i7,	%g4,	%o3
	fxnor	%f4,	%f10,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1890:
	nop 	! 	tvs	%icc,	0x5 changed by convert2hboot
	wr	%g0,	0x0c,	%asi
	nop
	setx loop_1891, %l0, %l1
	jmpl %l1, %i3
	movvs	%xcc,	%o0,	%i6
	srax	%o7,	0x17,	%l4
	addccc	%g1,	0x0E9D,	%g5
loop_1891:
	nop 	! 	taddcctv	%g2,	0x034E,	%o5 changed by convert2hboot
	movgu	%xcc,	%l3,	%o1
	swap	[%l7 + 0x0C],	%i1
	movgu	%xcc,	%l6,	%i4
	bg,a	%xcc,	loop_1892
	movn	%icc,	%l0,	%i5
	fmovsvs	%icc,	%f4,	%f11
	srlx	%i2,	0x16,	%l5
loop_1892:
	andcc	%g7,	%o6,	%o2
	bgu,a,pt	%xcc,	loop_1893
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	set	0x08, %g2
	nop	 ! 	stda	%o4,	[%l7 + %g2] 0x23 ASI use changed by convert2hboot
	membar	#Sync
loop_1893:
	fmovsne	%xcc,	%f22,	%f30
	movge	%icc,	%g3,	%i0
	fpadd32	%f4,	%f30,	%f18
	array16	%l2,	%l1,	%g4
	bg,a,pn	%xcc,	loop_1894
	orncc	%i7,	%g6,	%o3
	ld	[%l7 + 0x78],	%f3
	movge	%xcc,	%i3,	%o0
loop_1894:
	fmovrslez	%i6,	%f15,	%f21
	bn	%xcc,	loop_1895
	ldstub	[%l7 + 0x63],	%o7
	fnot1s	%f27,	%f1
	srlx	%l4,	0x0A,	%g5
loop_1895:
	sdiv	%g2,	0x0975,	%g1
	xorcc	%o5,	%o1,	%i1
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	lduh	[%l7 + 0x60],	%l6
	fmuld8sux16	%f2,	%f1,	%f28
	nop 	! 	tne	%xcc,	0x5 changed by convert2hboot
	ldsh	[%l7 + 0x7E],	%l3
	movg	%icc,	%l0,	%i4
	ldub	[%l7 + 0x7F],	%i5
	move	%icc,	%i2,	%l5
	fmovrdne	%g7,	%f12,	%f26
	fmovdg	%icc,	%f23,	%f9
	stb	%o2,	[%l7 + 0x1E]
	movge	%xcc,	%o6,	%g3
	subc	%o4,	%l2,	%i0
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
	nop 	! 	tcs	%icc,	0x4 changed by convert2hboot
	subc	%g4,	0x0C8B,	%l1
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	edge8	%g6,	%i7,	%i3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	fsrc2s	%f27,	%f14
	fmovsn	%xcc,	%f26,	%f6
	fbu	%fcc2,	loop_1896
	bgu,pn	%xcc,	loop_1897
	movgu	%icc,	%o0,	%l4
	bleu,a	%xcc,	loop_1898
loop_1896:
	move	%xcc,	%g5,	%o7
loop_1897:
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	movle	%icc,	%g1,	%g2
loop_1898:
	fbg,a	%fcc0,	loop_1899
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
	umulcc	%o5,	0x0887,	%o1
	edge32	%l6,	%i1,	%l3
loop_1899:
	ldsh	[%l7 + 0x48],	%i4
	array32	%l0,	%i5,	%l5
	fmovdle	%icc,	%f25,	%f11
	fpsub16s	%f1,	%f7,	%f11
	movgu	%xcc,	%g7,	%o2
	bl,pt	%icc,	loop_1900
	nop 	! 	taddcctv	%o6,	0x10CE,	%g3 changed by convert2hboot
	fcmped	%fcc0,	%f18,	%f30
	movrgz	%o4,	0x36E,	%l2
loop_1900:
	fmovrslz	%i2,	%f27,	%f4
	nop 	! 	tsubcc	%g4,	0x0BA8,	%i0 changed by convert2hboot
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	brgez,a	%i3,	loop_1901
	fmovdvs	%xcc,	%f18,	%f19
	addcc	%g6,	0x0AD5,	%o3
	popc	%i6,	%l4
loop_1901:
	edge32	%o0,	%o7,	%g5
	fcmpne32	%f30,	%f6,	%g1
	fmovrdgez	%g2,	%f4,	%f14
	wr	%g0,	0x23,	%asi
	membar	#Sync
	fcmpes	%fcc1,	%f10,	%f7
	fpadd16s	%f7,	%f29,	%f27
	flush	%l7 + 0x68
	ldx	[%l7 + 0x10],	%o1
	nop 	! 	taddcctv	%l6,	%l3,	%i1 changed by convert2hboot
	nop 	! 	taddcc	%l0,	%i5,	%l5 changed by convert2hboot
	bshuffle	%f26,	%f30,	%f26
	nop 	! 	tne	%icc,	0x5 changed by convert2hboot
	smulcc	%g7,	%o2,	%o6
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	movre	%i4,	0x2D9,	%g3
	movrgz	%l2,	%i2,	%o4
	ldsw	[%l7 + 0x70],	%g4
	alignaddrl	%l1,	%i0,	%i3
	sdiv	%i7,	0x0B74,	%g6
	nop
	setx loop_1902, %l0, %l1
	jmpl %l1, %i6
	xnor	%o3,	%l4,	%o0
	fmovdcs	%xcc,	%f20,	%f27
	pdist	%f4,	%f4,	%f18
loop_1902:
	sllx	%o7,	0x10,	%g1
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	popc	%g5,	%g2
	orcc	%o1,	%l6,	%o5
	addc	%i1,	0x1C15,	%l3
	fbule	%fcc3,	loop_1903
	srl	%i5,	0x06,	%l5
	fbn,a	%fcc0,	loop_1904
	edge8	%g7,	%l0,	%o6
loop_1903:
	movcc	%icc,	%i4,	%g3
	fpmerge	%f8,	%f2,	%f6
loop_1904:
	edge8	%l2,	%i2,	%o2
	fbn,a	%fcc2,	loop_1905
	nop 	! 	tsubcc	%o4,	%l1,	%g4 changed by convert2hboot
	srlx	%i0,	%i7,	%g6
	srlx	%i3,	0x0C,	%i6
loop_1905:
	movrne	%l4,	0x027,	%o3
	fmovsn	%icc,	%f20,	%f23
	orcc	%o0,	0x14F5,	%o7
	andcc	%g1,	0x1B21,	%g2
	array16	%o1,	%l6,	%o5
	movcc	%icc,	%i1,	%g5
	fands	%f14,	%f19,	%f20
	subc	%i5,	0x0A6F,	%l3
	bge,a	loop_1906
	stw	%l5,	[%l7 + 0x3C]
	fnot2s	%f6,	%f25
	edge8n	%l0,	%g7,	%i4
loop_1906:
	edge16ln	%o6,	%l2,	%i2
	andncc	%g3,	%o2,	%l1
	fbu	%fcc1,	loop_1907
	lduh	[%l7 + 0x5E],	%o4
	mulx	%g4,	%i7,	%g6
	wr	%g0,	0x4f,	%asi
loop_1907:
	edge8ln	%i6,	%i0,	%l4
	nop 	! 	tsubcctv	%o3,	%o7,	%g1 changed by convert2hboot
	fmovse	%icc,	%f8,	%f21
	movne	%xcc,	%g2,	%o0
	bvc,a,pt	%xcc,	loop_1908
	movn	%xcc,	%o1,	%l6
	edge8	%i1,	%o5,	%i5
	fsrc2	%f28,	%f4
loop_1908:
	fcmpgt16	%f8,	%f10,	%l3
	nop
	set	0x65, %g4
	ldstub	[%l7 + %g4],	%l5
	bcs	loop_1909
	fornot1s	%f14,	%f14,	%f19
	edge8n	%l0,	%g5,	%i4
	fnegd	%f6,	%f10
loop_1909:
	brnz,a	%g7,	loop_1910
	edge8ln	%o6,	%i2,	%l2
	movre	%g3,	%o2,	%l1
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
loop_1910:
	movrlez	%o4,	%i7,	%g6
	sll	%i3,	%i6,	%i0
	fnot2	%f4,	%f2
	smulcc	%l4,	0x0F28,	%g4
	movn	%xcc,	%o7,	%g1
	fmovs	%f3,	%f3
	set	0x0C, %l6
	nop	 ! 	stba	%g2,	[%l7 + %l6] 0x80 ASI use changed by convert2hboot
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	fcmpgt16	%f30,	%f16,	%o3
	fbne	%fcc3,	loop_1911
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
	movle	%icc,	%o0,	%l6
	fpack16	%f24,	%f21
loop_1911:
	fpack16	%f28,	%f10
	edge32ln	%o1,	%i1,	%i5
	bshuffle	%f12,	%f20,	%f12
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
	alignaddr	%l3,	%l5,	%l0
	nop 	! 	tvs	%xcc,	0x0 changed by convert2hboot
	wr	%g0,	0x81,	%asi
	fmovdle	%xcc,	%f7,	%f0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x19,	%asi
	nop	 ! 	casxa	[%l6] 0x19,	%i4,	%g7 ASI use changed by convert2hboot
	set	0x30, %o0
	nop	 ! 	stda	%o6,	[%l7 + %o0] 0xea ASI use changed by convert2hboot
	membar	#Sync
	movcs	%xcc,	%o5,	%l2
	nop 	! 	tsubcctv	%i2,	0x0116,	%g3 changed by convert2hboot
	alignaddr	%l1,	%o2,	%i7
	nop 	! 	tneg	%icc,	0x0 changed by convert2hboot
	umulcc	%o4,	%i3,	%g6
	movge	%icc,	%i6,	%i0
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	fcmps	%fcc1,	%f20,	%f30
	movrgez	%g4,	0x2DD,	%l4
	set	0x25, %l0
	nop	 ! 	ldstuba	[%l7 + %l0] 0x81,	%g1 ASI use changed by convert2hboot
	nop 	! 	taddcctv	%o7,	0x1C03,	%o3 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f30,	%f3
	udivcc	%g2,	0x0E92,	%l6
	fmovrslz	%o0,	%f29,	%f10
	faligndata	%f4,	%f24,	%f14
	movle	%icc,	%i1,	%i5
	nop 	! 	tsubcctv	%o1,	%l3,	%l5 changed by convert2hboot
	sub	%g5,	%l0,	%g7
	fxnor	%f22,	%f22,	%f28
	fmovdl	%xcc,	%f30,	%f23
	subcc	%i4,	0x078C,	%o6
	fbn	%fcc2,	loop_1912
	nop 	! 	taddcc	%l2,	0x1A9F,	%o5 changed by convert2hboot
	movvs	%icc,	%i2,	%g3
	fpsub16s	%f6,	%f1,	%f19
loop_1912:
	movl	%icc,	%l1,	%i7
	ldsb	[%l7 + 0x5A],	%o2
	and	%i3,	0x0530,	%g6
	fabsd	%f4,	%f0
	edge16l	%i6,	%o4,	%i0
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	fnot1s	%f27,	%f24
	fmovsn	%icc,	%f1,	%f8
	nop 	! 	tpos	%icc,	0x4 changed by convert2hboot
	bvs,a	%xcc,	loop_1913
	movpos	%icc,	%g4,	%l4
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	fandnot2	%f24,	%f30,	%f2
loop_1913:
	movre	%o7,	0x377,	%g1
	siam	0x2
	edge8l	%g2,	%o3,	%o0
	fnegd	%f24,	%f30
	mulscc	%l6,	%i1,	%o1
	sllx	%i5,	%l5,	%l3
	movre	%l0,	0x219,	%g5
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tvs	%xcc,	0x0 changed by convert2hboot
	and	%i4,	%g7,	%o6
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x0 changed by convert2hboot
	fmuld8ulx16	%f2,	%f14,	%f28
	alignaddr	%l2,	%o5,	%g3
	set	0x74, %o6
	nop	 ! 	ldstuba	[%l7 + %o6] 0x04,	%l1 ASI use changed by convert2hboot
	edge32	%i7,	%i2,	%i3
	smulcc	%o2,	%g6,	%i6
	membar	0x0D
	nop 	! 	taddcc	%i0,	0x0919,	%o4 changed by convert2hboot
	stw	%l4,	[%l7 + 0x7C]
	movl	%icc,	%o7,	%g1
	xor	%g2,	0x13D8,	%o3
	nop 	! 	tsubcctv	%g4,	%o0,	%i1 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,pt	%icc,	loop_1914
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
	array32	%o1,	%l6,	%i5
	sra	%l5,	0x02,	%l3
loop_1914:
	nop
	set	0x40, %l4
	nop	 ! 	stwa	%l0,	[%l7 + %l4] 0x27 ASI use changed by convert2hboot
	membar	#Sync
	fmovse	%xcc,	%f23,	%f31
	fandnot2	%f24,	%f16,	%f24
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	andncc	%g5,	%g7,	%i4
	fnegs	%f29,	%f7
	movge	%icc,	%l2,	%o5
	be,pt	%icc,	loop_1915
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	nop 	! 	sir	0x151C changed by convert2hboot
	fpadd32	%f18,	%f0,	%f16
loop_1915:
	andn	%g3,	%o6,	%l1
	fba	%fcc0,	loop_1916
	stw	%i7,	[%l7 + 0x64]
	movcs	%xcc,	%i2,	%o2
	edge16l	%g6,	%i6,	%i3
loop_1916:
	array8	%o4,	%l4,	%o7
	edge8	%g1,	%i0,	%g2
	movn	%icc,	%g4,	%o3
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	fcmpeq16	%f30,	%f28,	%i1
	subccc	%o0,	0x005E,	%o1
	udivcc	%l6,	0x15EA,	%i5
	alignaddrl	%l3,	%l5,	%l0
	edge16l	%g7,	%i4,	%g5
	wr	%g0,	0xea,	%asi
	membar	#Sync
	fcmpgt32	%f30,	%f22,	%g3
	movrne	%o6,	0x0FC,	%l1
	movne	%xcc,	%i7,	%l2
	stx	%i2,	[%l7 + 0x10]
	fsrc2	%f12,	%f0
	ldd	[%l7 + 0x68],	%f16
	orncc	%g6,	0x08D9,	%o2
	wr	%g0,	0x89,	%asi
	xnor	%i6,	0x0856,	%o4
	movgu	%icc,	%i3,	%l4
	ldsw	[%l7 + 0x3C],	%g1
	and	%i0,	0x0502,	%g2
	edge8	%g4,	%o3,	%i1
	sllx	%o0,	0x03,	%o1
	fmovdleu	%xcc,	%f5,	%f1
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x24] %asi,	%f11
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
	for	%f10,	%f26,	%f30
	edge16	%l6,	%o7,	%i5
	nop 	! 	tsubcc	%l3,	%l5,	%l0 changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	fmovdle	%icc,	%f4,	%f24
	fpmerge	%f2,	%f17,	%f18
	umul	%i4,	0x10A6,	%g5
	set	0x5C, %i3
	nop	 ! 	ldswa	[%l7 + %i3] 0x81,	%g7 ASI use changed by convert2hboot
	ldsb	[%l7 + 0x18],	%o5
	mulscc	%g3,	0x152D,	%o6
	std	%f4,	[%l7 + 0x68]
	fandnot2	%f12,	%f20,	%f12
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x04,	%asi
	fnand	%f6,	%f6,	%f14
	nop 	! 	tsubcc	%i2,	0x181A,	%g6 changed by convert2hboot
	nop 	! 	tpos	%icc,	0x3 changed by convert2hboot
	sdivcc	%o2,	0x1350,	%l1
	ldsh	[%l7 + 0x3E],	%i6
	and	%i3,	0x0887,	%l4
	array32	%o4,	%i0,	%g2
	udiv	%g4,	0x1125,	%g1
	wr	%g0,	0x81,	%asi
	edge16	%o0,	%i1,	%l6
	popc	0x0F57,	%o7
	membar	#Sync
	set	0x40, %i4
	nop	 ! 	ldda	[%l7 + %i4] 0xf9,	%f0 ASI use changed by convert2hboot
	fcmple32	%f12,	%f20,	%o1
	nop 	! 	taddcc	%i5,	%l5,	%l3 changed by convert2hboot
	stw	%l0,	[%l7 + 0x54]
	smulcc	%g5,	0x10A3,	%g7
	bne,a	%xcc,	loop_1917
	nop
	setx	loop_1918,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	edge16l	%i4,	%g3,	%o6
	srl	%i7,	0x07,	%l2
loop_1917:
	lduw	[%l7 + 0x20],	%o5
loop_1918:
	fmovs	%f9,	%f8
	movleu	%icc,	%g6,	%o2
	movn	%xcc,	%i2,	%i6
	wr	%g0,	0x80,	%asi
	smul	%l4,	%i3,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe,a	%fcc1,	loop_1919
	fmovd	%f10,	%f0
	mulscc	%i0,	%g2,	%g4
	edge16n	%g1,	%o0,	%o3
loop_1919:
	movpos	%icc,	%i1,	%l6
	movvc	%icc,	%o7,	%i5
	fbn,a	%fcc0,	loop_1920
	ld	[%l7 + 0x64],	%f22
	popc	%o1,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1920:
	fsrc1s	%f7,	%f16
	wr	%g0,	0x80,	%asi
	sll	%l0,	0x1E,	%g5
	nop 	! 	sir	0x0D15 changed by convert2hboot
	fblg	%fcc1,	loop_1921
	stx	%i4,	[%l7 + 0x30]
	umul	%g3,	%g7,	%o6
	ldd	[%l7 + 0x08],	%l2
loop_1921:
	addccc	%o5,	0x06A1,	%i7
	movvs	%icc,	%g6,	%o2
	movgu	%xcc,	%i6,	%l1
	ldsh	[%l7 + 0x30],	%l4
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	wr	%g0,	0x11,	%asi
	sllx	%o4,	%i3,	%i0
	nop 	! 	sir	0x1E4C changed by convert2hboot
	fbo	%fcc1,	loop_1922
	fmovdg	%xcc,	%f8,	%f20
	nop 	! 	tcs	%xcc,	0x3 changed by convert2hboot
	movpos	%xcc,	%g4,	%g1
loop_1922:
	fbule	%fcc1,	loop_1923
	srax	%o0,	0x06,	%o3
	add	%g2,	0x03E2,	%i1
	ldx	[%l7 + 0x68],	%o7
loop_1923:
	fbule	%fcc1,	loop_1924
	fmovdle	%xcc,	%f15,	%f23
	array16	%l6,	%o1,	%i5
	movcs	%xcc,	%l5,	%l0
loop_1924:
	fbg	%fcc3,	loop_1925
	smulcc	%l3,	0x128E,	%g5
	movvc	%icc,	%g3,	%g7
	movge	%icc,	%i4,	%o6
loop_1925:
	edge32n	%l2,	%i7,	%o5
	mova	%icc,	%g6,	%o2
	movgu	%icc,	%l1,	%l4
	sll	%i2,	%o4,	%i3
	wr	%g0,	0x81,	%asi
	sta	%f14,	[%l7 + 0x40] %asi
	lduh	[%l7 + 0x66],	%i0
	srl	%i6,	%g4,	%o0
	fcmps	%fcc3,	%f2,	%f11
	set	0x60, %i0
	nop	 ! 	stwa	%g1,	[%l7 + %i0] 0x89 ASI use changed by convert2hboot
	subc	%o3,	0x103C,	%i1
	movne	%icc,	%o7,	%g2
	fmovdn	%xcc,	%f21,	%f18
	nop 	! 	ta	%xcc,	0x2 changed by convert2hboot
	sdiv	%l6,	0x0630,	%i5
	xorcc	%o1,	0x1637,	%l0
	xor	%l3,	0x189C,	%l5
	nop
	setx	loop_1926,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	fmovsle	%xcc,	%f7,	%f17
	nop
	setx	loop_1927,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_1926:
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	edge32n	%g3,	%g5,	%i4
	bleu,pt	%xcc,	loop_1928
loop_1927:
	bvs,a,pn	%xcc,	loop_1929
	fnor	%f0,	%f18,	%f24
	stw	%o6,	[%l7 + 0x54]
loop_1928:
	brlez	%g7,	loop_1930
loop_1929:
	orncc	%l2,	0x161E,	%i7
	stb	%g6,	[%l7 + 0x1B]
	movrlez	%o5,	%l1,	%o2
loop_1930:
	fnot2	%f14,	%f24
	array16	%i2,	%l4,	%o4
	lduw	[%l7 + 0x08],	%i3
	stb	%i6,	[%l7 + 0x0A]
	fmovrsgez	%i0,	%f20,	%f7
	wr	%g0,	0x04,	%asi
	fornot2	%f8,	%f26,	%f14
	addc	%g4,	0x1610,	%g1
	bne	%icc,	loop_1931
	xorcc	%o3,	%o7,	%i1
	nop
	setx	loop_1932,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	orcc	%l6,	%g2,	%o1
loop_1931:
	udiv	%i5,	0x10C5,	%l0
	xnor	%l3,	0x0FEE,	%l5
loop_1932:
	fbule	%fcc2,	loop_1933
	nop 	! 	tcs	%icc,	0x3 changed by convert2hboot
	fmul8sux16	%f26,	%f4,	%f24
	subcc	%g5,	%g3,	%o6
loop_1933:
	nop
	wr	%g0,	0x18,	%asi
	brz	%l2,	loop_1934
	fandnot2s	%f1,	%f4,	%f28
	movrgz	%i4,	%g6,	%i7
	movrlez	%l1,	0x05F,	%o2
loop_1934:
	movcc	%xcc,	%i2,	%l4
	bcc,a	loop_1935
	sll	%o5,	%i3,	%o4
	fcmpgt16	%f24,	%f2,	%i0
	fzeros	%f29
loop_1935:
	movrgz	%i6,	0x268,	%g4
	ble,a	loop_1936
	fmovdle	%icc,	%f26,	%f31
	srax	%g1,	%o3,	%o0
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
loop_1936:
	orcc	%i1,	0x0021,	%l6
	fmovscs	%xcc,	%f13,	%f2
	membar	0x25
	subccc	%o7,	%g2,	%i5
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	fpsub32s	%f15,	%f13,	%f21
	nop 	! 	tleu	%icc,	0x1 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
	movrne	%l0,	%o1,	%l5
	andn	%l3,	0x0C1E,	%g5
	bneg,pt	%xcc,	loop_1937
	sra	%g3,	%o6,	%g7
	nop 	! 	tleu	%xcc,	0x6 changed by convert2hboot
	subcc	%i4,	%l2,	%i7
loop_1937:
	bcs,a	%icc,	loop_1938
	brgez	%l1,	loop_1939
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	fmovdcc	%icc,	%f15,	%f21
loop_1938:
	fbo,a	%fcc2,	loop_1940
loop_1939:
	fpsub32s	%f22,	%f27,	%f14
	udiv	%o2,	0x1694,	%i2
	nop
	setx loop_1941, %l0, %l1
	jmpl %l1, %g6
loop_1940:
	fcmpgt32	%f30,	%f14,	%l4
	sub	%o5,	0x0223,	%o4
	nop
	setx loop_1942, %l0, %l1
	jmpl %l1, %i0
loop_1941:
	nop 	! 	sir	0x1473 changed by convert2hboot
	nop 	! 	ta	%icc,	0x7 changed by convert2hboot
	wr	%g0,	0x80,	%asi
loop_1942:
	udivcc	%i3,	0x1A6B,	%g4
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	prefetch	[%l7 + 0x40],	 0x3
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	nop 	! 	sir	0x1785 changed by convert2hboot
	add	%o3,	%o0,	%g1
	fpsub16	%f24,	%f14,	%f0
	brnz	%l6,	loop_1943
	ba	%xcc,	loop_1944
	movrlez	%o7,	%g2,	%i5
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
loop_1943:
	fbl,a	%fcc2,	loop_1945
loop_1944:
	fbue	%fcc2,	loop_1946
	udivcc	%i1,	0x067C,	%o1
	lduh	[%l7 + 0x26],	%l5
loop_1945:
	ldx	[%l7 + 0x08],	%l3
loop_1946:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l0,	%g5,	%g3
	edge16l	%g7,	%i4,	%o6
	sra	%l2,	%l1,	%o2
	fbul	%fcc2,	loop_1947
	fcmpeq16	%f8,	%f16,	%i2
	movne	%icc,	%g6,	%i7
	movge	%xcc,	%o5,	%o4
loop_1947:
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	addcc	%l4,	%i0,	%i6
	array32	%i3,	%o3,	%o0
	add	%g1,	0x03A6,	%g4
	orn	%o7,	%l6,	%g2
	nop 	! 	tsubcctv	%i1,	0x1EE9,	%o1 changed by convert2hboot
	and	%l5,	0x136C,	%i5
	srax	%l3,	%g5,	%g3
	fmovscc	%xcc,	%f31,	%f10
	set	0x75, %i7
	nop	 ! 	ldstuba	[%l7 + %i7] 0x89,	%l0 ASI use changed by convert2hboot
	edge8l	%g7,	%i4,	%l2
	nop 	! 	tcc	%icc,	0x4 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	ld	[%l7 + 0x24],	%f16
	fmovspos	%icc,	%f27,	%f22
	set	0x380, %l1
	nop 	! 	nop 	! 	nop	 ! 	ldxa	[%g0 + %l1] 0x40,	%o6 ASI use changed by convert2hboot ripped by fixASI40.pl ripped by fixASI40.pl
	sra	%l1,	%o2,	%g6
	ldstub	[%l7 + 0x09],	%i2
	movgu	%icc,	%i7,	%o5
	xnor	%o4,	0x081D,	%i0
	fpsub32	%f22,	%f2,	%f22
	fcmpd	%fcc1,	%f22,	%f20
	set	0x24, %i2
	nop	 ! 	swapa	[%l7 + %i2] 0x04,	%i6 ASI use changed by convert2hboot
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	movleu	%icc,	%l4,	%o3
	bl,a	loop_1948
	movneg	%xcc,	%o0,	%i3
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
	edge16ln	%g4,	%o7,	%l6
loop_1948:
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
	bcc,a,pt	%xcc,	loop_1949
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x5A
	edge8n	%g2,	%g1,	%o1
loop_1949:
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	fmovsge	%icc,	%f12,	%f9
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	wr	%g0,	0xe3,	%asi
	std	%f28,	[%l7 + 0x48]
	ba,a,pt	%xcc,	loop_1950
	movcc	%xcc,	%i5,	%l5
	fmovdle	%xcc,	%f15,	%f4
	wr	%g0,	0x22,	%asi
	membar	#Sync
loop_1950:
	addccc	%g3,	0x191D,	%l0
	movpos	%xcc,	%g7,	%g5
	edge16l	%l2,	%i4,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x50, %o3
	nop	 ! 	prefetcha	[%l7 + %o3] 0x81,	 0x3 ASI use changed by convert2hboot
	nop 	! 	tneg	%icc,	0x3 changed by convert2hboot
	sra	%g6,	%i2,	%o6
	movgu	%xcc,	%i7,	%o4
	movn	%xcc,	%i0,	%o5
	subc	%l4,	%o3,	%i6
	edge32l	%i3,	%o0,	%o7
	set	0x10, %i1
	nop	 ! 	prefetcha	[%l7 + %i1] 0x81,	 0x1 ASI use changed by convert2hboot
	movcs	%icc,	%l6,	%g1
	fmovsneg	%xcc,	%f18,	%f21
	nop 	! 	tsubcc	%o1,	%i1,	%g2 changed by convert2hboot
	edge32	%i5,	%l3,	%l5
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	set	0x40, %i6
	nop	 ! 	stda	%f0,	[%l7 + %i6] 0x18 ASI use changed by convert2hboot
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
	orn	%g3,	0x1D92,	%g7
	nop 	! 	taddcctv	%l0,	%g5,	%i4 changed by convert2hboot
	orn	%l1,	%l2,	%g6
	smulcc	%i2,	0x0CE6,	%o6
	movrgz	%i7,	%o4,	%o2
	udivx	%i0,	0x182C,	%l4
	movcs	%icc,	%o5,	%o3
	umul	%i3,	%i6,	%o0
	array32	%o7,	%g4,	%l6
	movrlez	%g1,	0x057,	%i1
	fmovrdne	%o1,	%f18,	%f8
	sdivcc	%i5,	0x04F0,	%l3
	srlx	%l5,	%g2,	%g7
	orcc	%l0,	0x00F2,	%g3
	fandnot1	%f20,	%f4,	%f26
	bgu,pn	%icc,	loop_1951
	fmovdgu	%xcc,	%f17,	%f19
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	wr	%g0,	0x11,	%asi
loop_1951:
	movvs	%icc,	%i4,	%l2
	wr	%g0,	0x1e,	%asi
	membar	#Sync
	addcc	%g6,	0x19AB,	%l1
	sll	%o6,	%i7,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%o2,	%f1,	%f28
	stb	%o4,	[%l7 + 0x6B]
	subccc	%l4,	0x1CCF,	%o5
	movvc	%icc,	%i0,	%o3
	alignaddrl	%i3,	%o0,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tsubcc	%o7,	%l6,	%g4 changed by convert2hboot
	orcc	%i1,	0x0BC5,	%o1
	sdivcc	%i5,	0x0C71,	%g1
	xor	%l5,	%g2,	%g7
	movrlez	%l3,	%l0,	%g3
	fnot1s	%f24,	%f2
	wr	%g0,	0x23,	%asi
	membar	#Sync
	fcmped	%fcc3,	%f18,	%f16
	mulscc	%g5,	%l2,	%l1
	edge8n	%o6,	%i7,	%g6
	be	%icc,	loop_1952
	fmovrdlz	%i2,	%f30,	%f24
	mulx	%o4,	%o2,	%l4
	edge8	%o5,	%i0,	%i3
loop_1952:
	nop
	wr	%g0,	0x10,	%asi
	fornot1	%f0,	%f6,	%f16
	edge8	%i6,	%o7,	%l6
	fblg,a	%fcc0,	loop_1953
	bvs,pn	%icc,	loop_1954
	xnor	%g4,	0x15B7,	%i1
	fbue	%fcc2,	loop_1955
loop_1953:
	smul	%o0,	%o1,	%i5
loop_1954:
	fmul8x16al	%f18,	%f1,	%f26
	fmovsge	%xcc,	%f31,	%f9
loop_1955:
	srax	%l5,	0x10,	%g1
	ldsb	[%l7 + 0x23],	%g2
	fblg	%fcc2,	loop_1956
	edge16ln	%l3,	%g7,	%g3
	sdivx	%i4,	0x1DDE,	%l0
	set	0x78, %g3
	nop	 ! 	stda	%g4,	[%l7 + %g3] 0x0c ASI use changed by convert2hboot
loop_1956:
	edge16	%l2,	%l1,	%i7
	fnors	%f15,	%f4,	%f8
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	nop	 ! 	casa	[%l6] 0x11,	%g6,	%i2 ASI use changed by convert2hboot
	fpadd16s	%f26,	%f6,	%f6
	nop
	setx	loop_1957,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	edge32ln	%o6,	%o2,	%l4
	fmovdcc	%icc,	%f19,	%f9
	nop 	! 	sir	0x1643 changed by convert2hboot
loop_1957:
	nop
	wr	%g0,	0x18,	%asi
	fmovdgu	%xcc,	%f11,	%f26
	fcmple16	%f14,	%f6,	%o5
	fornot1	%f24,	%f28,	%f0
	fmovda	%xcc,	%f21,	%f19
	fmovscs	%icc,	%f6,	%f18
	fba,a	%fcc3,	loop_1958
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	wr	%g0,	0x2b,	%asi
loop_1958:
	movge	%xcc,	%i3,	%i6
	edge16l	%o7,	%l6,	%g4
	bl,a	%xcc,	loop_1959
	fcmpgt16	%f6,	%f14,	%o3
	nop 	! 	tvs	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
loop_1959:
	movrne	%o0,	0x3A8,	%i1
	fmovrdlz	%i5,	%f12,	%f24
	brgez,a	%o1,	loop_1960
	fbge	%fcc1,	loop_1961
	fcmps	%fcc1,	%f16,	%f21
	set	0x2E, %o7
	nop	 ! 	lduha	[%l7 + %o7] 0x04,	%g1 ASI use changed by convert2hboot
loop_1960:
	subccc	%g2,	%l5,	%l3
loop_1961:
	alignaddrl	%g3,	%g7,	%l0
	edge8ln	%g5,	%i4,	%l2
	fbu,a	%fcc3,	loop_1962
	xorcc	%i7,	0x112A,	%l1
	movvc	%xcc,	%i2,	%o6
loop_1962:
	fmul8x16al	%f31,	%f4,	%f6
	movcs	%icc,	%g6,	%l4
	srl	%o2,	0x14,	%o5
	movrgez	%i0,	%o4,	%i6
	nop 	! 	sir	0x042D changed by convert2hboot
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	movpos	%xcc,	%o7,	%i3
	bvc	loop_1963
	ldsw	[%l7 + 0x10],	%g4
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	movl	%icc,	%l6,	%o3
loop_1963:
	nop 	! 	sir	0x03C4 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
	srlx	%o0,	0x09,	%i1
	fbg,a	%fcc0,	loop_1964
	xnor	%o1,	0x0428,	%i5
	fbl	%fcc3,	loop_1965
	movcc	%icc,	%g1,	%g2
loop_1964:
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	fbge,a	%fcc1,	loop_1966
loop_1965:
	edge32n	%l3,	%g3,	%l5
	andncc	%l0,	%g5,	%i4
	edge8l	%g7,	%l2,	%i7
loop_1966:
	fnor	%f4,	%f6,	%f10
	fmovsle	%xcc,	%f27,	%f22
	fbue,a	%fcc3,	loop_1967
	fmul8ulx16	%f28,	%f28,	%f30
	alignaddr	%i2,	%o6,	%l1
	movne	%xcc,	%g6,	%o2
loop_1967:
	nop
	set	0x50, %i5
	nop	 ! 	ldda	[%l7 + %i5] 0x81,	%l4 ASI use changed by convert2hboot
	fmovd	%f20,	%f0
	fcmpne16	%f2,	%f14,	%i0
	set	0x65, %g6
	nop	 ! 	ldsba	[%l7 + %g6] 0x80,	%o5 ASI use changed by convert2hboot
	bgu,a,pt	%xcc,	loop_1968
	ble	loop_1969
	orncc	%i6,	0x1B2D,	%o4
	andncc	%o7,	%g4,	%l6
loop_1968:
	nop
	set	0x40, %g1
	nop	 ! 	prefetcha	[%l7 + %g1] 0x14,	 0x3 ASI use changed by convert2hboot
loop_1969:
	edge16	%o0,	%i3,	%i1
	fmovd	%f24,	%f8
	movrgz	%o1,	%i5,	%g2
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	membar	0x50
	bl,pt	%icc,	loop_1970
	fones	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl	%xcc,	loop_1971
loop_1970:
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	fandnot1s	%f30,	%f14,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1971:
	andcc	%l3,	0x12AA,	%g3
	flush	%l7 + 0x24
	fors	%f31,	%f0,	%f8
	set	0x34, %l5
	lda	[%l7 + %l5] 0x14,	%f19
	brlez,a	%l5,	loop_1972
	sll	%l0,	0x0A,	%g5
	sth	%g1,	[%l7 + 0x5A]
	xnor	%i4,	0x024C,	%l2
loop_1972:
	ld	[%l7 + 0x78],	%f23
	movrgz	%i7,	%i2,	%g7
	movpos	%xcc,	%o6,	%l1
	nop 	! 	tsubcctv	%g6,	%o2,	%l4 changed by convert2hboot
	edge16	%i0,	%o5,	%i6
	wr	%g0,	0x19,	%asi
	nop 	! 	tsubcctv	%g4,	%l6,	%o4 changed by convert2hboot
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
	fbg	%fcc1,	loop_1973
	nop 	! 	tl	%xcc,	0x2 changed by convert2hboot
	fcmpne16	%f6,	%f10,	%o0
	movne	%xcc,	%i3,	%o3
loop_1973:
	siam	0x4
	sra	%o1,	0x0F,	%i1
	fbug,a	%fcc0,	loop_1974
	edge8l	%i5,	%g2,	%l3
	movleu	%xcc,	%g3,	%l5
	fbue,a	%fcc2,	loop_1975
loop_1974:
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	fpadd16s	%f26,	%f25,	%f8
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
loop_1975:
	bg,a	%xcc,	loop_1976
	ldsh	[%l7 + 0x28],	%l0
	ldd	[%l7 + 0x40],	%f24
	nop 	! 	tle	%xcc,	0x3 changed by convert2hboot
loop_1976:
	udiv	%g5,	0x1F93,	%i4
	fmovrdlz	%l2,	%f2,	%f4
	mulx	%g1,	%i2,	%i7
	fmovsvc	%xcc,	%f30,	%f24
	fmovsa	%icc,	%f7,	%f28
	mova	%xcc,	%o6,	%l1
	fpsub16s	%f12,	%f27,	%f30
	lduw	[%l7 + 0x08],	%g6
	nop 	! 	ta	%xcc,	0x5 changed by convert2hboot
	brlz	%o2,	loop_1977
	flush	%l7 + 0x78
	membar	0x30
	movn	%xcc,	%g7,	%l4
loop_1977:
	nop 	! 	tneg	%xcc,	0x7 changed by convert2hboot
	bcc,a	%icc,	loop_1978
	bcs,a,pt	%icc,	loop_1979
	nop 	! 	taddcctv	%i0,	0x0F11,	%i6 changed by convert2hboot
	alignaddrl	%o5,	%g4,	%o7
loop_1978:
	ldd	[%l7 + 0x58],	%i6
loop_1979:
	nop
	wr	%g0,	0x2f,	%asi
	membar	#Sync
	ld	[%l7 + 0x68],	%f9
	andncc	%i3,	%o3,	%o1
	movrlez	%o0,	%i1,	%i5
	nop
	setx	loop_1980,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movpos	%icc,	%g2,	%l3
	lduw	[%l7 + 0x18],	%l5
	subc	%l0,	0x0E17,	%g3
loop_1980:
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	udivx	%i4,	0x0AB0,	%l2
	fones	%f7
	bcc	loop_1981
	nop 	! 	tsubcc	%g1,	%i2,	%i7 changed by convert2hboot
	srl	%g5,	%l1,	%g6
	movleu	%icc,	%o2,	%g7
loop_1981:
	movleu	%xcc,	%o6,	%i0
	or	%i6,	%l4,	%o5
	addc	%o7,	0x0AC6,	%l6
	fzeros	%f31
	edge16	%g4,	%i3,	%o4
	bn,a	%icc,	loop_1982
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	movvs	%xcc,	%o1,	%o3
loop_1982:
	fnands	%f30,	%f29,	%f1
	brz,a	%o0,	loop_1983
	addccc	%i5,	0x1187,	%g2
	brnz	%i1,	loop_1984
	sethi	0x1937,	%l3
loop_1983:
	nop
	setx loop_1985, %l0, %l1
	jmpl %l1, %l5
	bcc,a	%xcc,	loop_1986
loop_1984:
	addcc	%g3,	0x0C2A,	%i4
	move	%xcc,	%l2,	%g1
loop_1985:
	fmovdvs	%icc,	%f31,	%f2
loop_1986:
	nop
	wr	%g0,	0x04,	%asi
	nop 	! 	tg	%xcc,	0x3 changed by convert2hboot
	lduw	[%l7 + 0x28],	%i7
	movvs	%xcc,	%i2,	%l1
	orcc	%g5,	%o2,	%g6
	nop 	! 	tne	%xcc,	0x3 changed by convert2hboot
	swap	[%l7 + 0x70],	%o6
	fmovrslz	%g7,	%f7,	%f1
	bne	loop_1987
	bg,pt	%xcc,	loop_1988
	sethi	0x0126,	%i6
	orn	%l4,	0x1BD3,	%i0
loop_1987:
	fmovrsgz	%o7,	%f25,	%f7
loop_1988:
	andcc	%o5,	%g4,	%i3
	nop 	! 	sir	0x0931 changed by convert2hboot
	srl	%l6,	%o4,	%o3
	fpsub32s	%f2,	%f29,	%f9
	bge,pt	%xcc,	loop_1989
	nop 	! 	tg	%icc,	0x1 changed by convert2hboot
	movrgz	%o0,	0x13A,	%o1
	fandnot2s	%f24,	%f27,	%f4
loop_1989:
	udivcc	%g2,	0x1CA3,	%i5
	xnor	%l3,	0x0869,	%i1
	sra	%l5,	%i4,	%g3
	fornot2	%f12,	%f22,	%f4
	fmovs	%f26,	%f20
	umulcc	%g1,	0x0768,	%l2
	edge8ln	%l0,	%i2,	%i7
	smul	%l1,	0x14CB,	%o2
	membar	0x30
	subc	%g6,	%g5,	%o6
	brlez,a	%i6,	loop_1990
	fabsd	%f6,	%f14
	fble,a	%fcc1,	loop_1991
	fba	%fcc1,	loop_1992
loop_1990:
	bleu	%icc,	loop_1993
	edge16	%l4,	%g7,	%i0
loop_1991:
	fmovrdgz	%o5,	%f12,	%f28
loop_1992:
	movrlz	%o7,	0x132,	%i3
loop_1993:
	ldd	[%l7 + 0x10],	%f8
	sdivx	%l6,	0x03D8,	%o4
	or	%o3,	0x0C9A,	%g4
	fnot2s	%f21,	%f31
	lduw	[%l7 + 0x78],	%o1
	addcc	%o0,	0x0D84,	%i5
	udiv	%l3,	0x1CFF,	%g2
	wr	%g0,	0x88,	%asi
	smulcc	%l5,	%i4,	%g3
	movvs	%icc,	%l2,	%g1
	mova	%icc,	%l0,	%i7
	fbn,a	%fcc3,	loop_1994
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
	umul	%i2,	0x069D,	%o2
	andcc	%l1,	%g5,	%g6
loop_1994:
	sra	%i6,	%l4,	%o6
	edge32ln	%g7,	%i0,	%o5
	sdiv	%o7,	0x1D27,	%i3
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
	movgu	%icc,	%o4,	%o3
	subcc	%g4,	%l6,	%o0
	nop 	! 	tg	%xcc,	0x4 changed by convert2hboot
	fmovdle	%xcc,	%f17,	%f2
	edge32n	%o1,	%l3,	%i5
	xnor	%i1,	%g2,	%l5
	fpackfix	%f18,	%f6
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	fxor	%f6,	%f0,	%f0
	mulscc	%g3,	0x1610,	%l2
	set	0x54, %o5
	nop	 ! 	lduwa	[%l7 + %o5] 0x89,	%g1 ASI use changed by convert2hboot
	sdivcc	%i4,	0x00C1,	%i7
	sll	%i2,	%l0,	%o2
	set	0x40, %o4
	nop	 ! 	stda	%f16,	[%l7 + %o4] 0x0c ASI use changed by convert2hboot
	move	%icc,	%l1,	%g6
	membar	0x00
	fbu,a	%fcc1,	loop_1995
	nop 	! 	tg	%xcc,	0x0 changed by convert2hboot
	wr	%g0,	0x80,	%asi
loop_1995:
	nop
	wr	%g0,	0x0c,	%asi
	lduh	[%l7 + 0x4C],	%o6
	bn	loop_1996
	fpadd16	%f6,	%f22,	%f10
	umulcc	%g7,	0x1E7F,	%i0
	fpmerge	%f27,	%f3,	%f12
loop_1996:
	fbn	%fcc2,	loop_1997
	fbn	%fcc3,	loop_1998
	bpos	%icc,	loop_1999
	fmuld8ulx16	%f24,	%f22,	%f6
loop_1997:
	stb	%l4,	[%l7 + 0x73]
loop_1998:
	nop 	! 	tle	%icc,	0x3 changed by convert2hboot
loop_1999:
	orn	%o5,	0x03EC,	%i3
	set	0x72, %g5
	nop	 ! 	stha	%o4,	[%l7 + %g5] 0x27 ASI use changed by convert2hboot
	membar	#Sync
	sra	%o7,	0x11,	%g4
	ldd	[%l7 + 0x48],	%f30
	nop 	! 	taddcc	%l6,	0x0DE1,	%o0 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc2,	loop_2000
	fmovdg	%icc,	%f29,	%f6
	movg	%xcc,	%o1,	%l3
	mulx	%o3,	%i5,	%g2
loop_2000:
	popc	%l5,	%g3
	call	loop_2001
	bgu,a	loop_2002
	nop 	! 	sir	0x1DF8 changed by convert2hboot
	fmovsleu	%icc,	%f1,	%f12
loop_2001:
	fmovsn	%icc,	%f18,	%f17
loop_2002:
	movvc	%xcc,	%i1,	%l2
	bneg,a,pn	%icc,	loop_2003
	nop 	! 	tne	%xcc,	0x3 changed by convert2hboot
	udivx	%i4,	0x1C29,	%i7
	movne	%icc,	%g1,	%i2
loop_2003:
	std	%l0,	[%l7 + 0x78]
	orcc	%o2,	%g6,	%l1
	edge32ln	%i6,	%o6,	%g7
	umulcc	%i0,	0x18D8,	%g5
	nop 	! 	tg	%icc,	0x1 changed by convert2hboot
	fmovdcc	%xcc,	%f1,	%f26
	xnorcc	%l4,	%i3,	%o4
	orncc	%o5,	%g4,	%l6
	udivcc	%o7,	0x0550,	%o1
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
	fpadd32	%f16,	%f26,	%f4
	membar	0x1A
	bne,a	loop_2004
	movpos	%icc,	%l3,	%o3
	for	%f16,	%f28,	%f0
	edge16	%i5,	%o0,	%l5
loop_2004:
	bcs,a,pn	%icc,	loop_2005
	fmovrslz	%g2,	%f8,	%f4
	array8	%g3,	%l2,	%i4
	edge8l	%i7,	%g1,	%i2
loop_2005:
	sub	%l0,	%i1,	%o2
	sllx	%g6,	%i6,	%l1
	edge16ln	%o6,	%i0,	%g5
	fmovrdlez	%g7,	%f30,	%f2
	orn	%i3,	0x1A93,	%o4
	st	%f16,	[%l7 + 0x4C]
	fands	%f29,	%f28,	%f26
	or	%l4,	0x0D7E,	%g4
	fmovrdlez	%l6,	%f26,	%f6
	brgz,a	%o5,	loop_2006
	fmovsl	%icc,	%f1,	%f16
	fble	%fcc0,	loop_2007
	stx	%o1,	[%l7 + 0x08]
loop_2006:
	edge32l	%o7,	%l3,	%i5
	wr	%g0,	0x80,	%asi
loop_2007:
	stx	%o0,	[%l7 + 0x60]
	fnors	%f16,	%f7,	%f28
	fmovsneg	%xcc,	%f1,	%f12
	bneg	loop_2008
	fmuld8sux16	%f0,	%f20,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l5,	0x0EAB,	%g2
loop_2008:
	movvs	%icc,	%g3,	%o3
	edge16l	%i4,	%l2,	%i7
	umulcc	%g1,	%l0,	%i2
	movrgz	%o2,	0x139,	%i1
	edge8	%g6,	%l1,	%i6
	orncc	%i0,	%o6,	%g7
	wr	%g0,	0x89,	%asi
	fmovsn	%icc,	%f25,	%f24
	movcc	%icc,	%g5,	%l4
	edge32	%o4,	%l6,	%o5
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
	fble,a	%fcc1,	loop_2009
	edge32ln	%g4,	%o7,	%l3
	fbue,a	%fcc3,	loop_2010
	fpadd32s	%f20,	%f1,	%f28
loop_2009:
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	udivcc	%o1,	0x1F18,	%o0
loop_2010:
	nop 	! 	tsubcctv	%i5,	%g2,	%l5 changed by convert2hboot
	brnz	%g3,	loop_2011
	movge	%xcc,	%o3,	%i4
	nop 	! 	taddcctv	%i7,	%l2,	%g1 changed by convert2hboot
	fornot1s	%f11,	%f31,	%f31
loop_2011:
	nop 	! 	taddcc	%i2,	%o2,	%i1 changed by convert2hboot
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
	lduh	[%l7 + 0x5A],	%g6
	fpack32	%f16,	%f12,	%f20
	mova	%xcc,	%l1,	%l0
	mulx	%i0,	0x02AF,	%i6
	faligndata	%f22,	%f14,	%f26
	brlz	%o6,	loop_2012
	nop 	! 	ta	%xcc,	0x1 changed by convert2hboot
	fmovsg	%icc,	%f22,	%f30
	fbuge	%fcc2,	loop_2013
loop_2012:
	fbl	%fcc2,	loop_2014
	udivx	%g7,	0x0118,	%i3
	smulcc	%l4,	0x042E,	%g5
loop_2013:
	fblg	%fcc2,	loop_2015
loop_2014:
	addccc	%l6,	%o4,	%g4
	orn	%o7,	0x018D,	%o5
	movrgz	%o1,	%l3,	%o0
loop_2015:
	ldd	[%l7 + 0x20],	%g2
	nop 	! 	tleu	%icc,	0x7 changed by convert2hboot
	fmovrdne	%i5,	%f28,	%f0
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
	sub	%g3,	%o3,	%i4
	fmovsl	%icc,	%f13,	%f29
	fmovdcs	%xcc,	%f1,	%f16
	or	%l5,	%l2,	%i7
	movvs	%icc,	%g1,	%o2
	edge16n	%i1,	%g6,	%i2
	nop
	setx	loop_2016,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fbn	%fcc1,	loop_2017
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	array16	%l0,	%i0,	%l1
loop_2016:
	fmovrde	%o6,	%f20,	%f12
loop_2017:
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	wr	%g0,	0x80,	%asi
	nop 	! 	te	%xcc,	0x4 changed by convert2hboot
	movcc	%xcc,	%g7,	%l4
	nop
	set	0x30, %o1
	stw	%i3,	[%l7 + %o1]
	srlx	%g5,	0x07,	%o4
	edge32l	%g4,	%l6,	%o7
	fmovd	%f10,	%f10
	xnor	%o1,	0x1DA4,	%l3
	movcs	%icc,	%o5,	%o0
	sdiv	%g2,	0x0548,	%i5
	fsrc2	%f14,	%f20
	movvc	%icc,	%g3,	%i4
	fmovsgu	%icc,	%f7,	%f1
	fmovsge	%icc,	%f23,	%f9
	movg	%icc,	%o3,	%l5
	or	%i7,	%g1,	%o2
	orncc	%l2,	0x0DBE,	%g6
	swap	[%l7 + 0x3C],	%i2
	movle	%xcc,	%i1,	%i0
	fmovd	%f28,	%f10
	stb	%l0,	[%l7 + 0x55]
	fmovrde	%l1,	%f22,	%f20
	set	0x70, %g7
	nop	 ! 	stwa	%i6,	[%l7 + %g7] 0x22 ASI use changed by convert2hboot
	membar	#Sync
	orcc	%g7,	0x0EA4,	%l4
	movl	%icc,	%i3,	%o6
	movg	%icc,	%o4,	%g4
	wr	%g0,	0x10,	%asi
	add	%g5,	0x0EFD,	%l6
	set	0x38, %l3
	nop	 ! 	ldxa	[%l7 + %l3] 0x81,	%o1 ASI use changed by convert2hboot
	orncc	%o7,	%l3,	%o0
	ldub	[%l7 + 0x2E],	%g2
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	nop 	! 	te	%xcc,	0x5 changed by convert2hboot
	sllx	%i5,	0x1B,	%o5
	movvs	%xcc,	%g3,	%o3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	nop	 ! 	casxa	[%l6] 0x80,	%l5,	%i7 ASI use changed by convert2hboot
	fsrc2s	%f12,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i4,	%g1,	%o2
	movcs	%xcc,	%l2,	%i2
	st	%f6,	[%l7 + 0x3C]
	bg,a	loop_2018
	nop 	! 	tl	%xcc,	0x2 changed by convert2hboot
	fbug,a	%fcc3,	loop_2019
	nop
	set	0x40, %l2
	stw	%g6,	[%l7 + %l2]
loop_2018:
	mulx	%i0,	0x1DFF,	%l0
	membar	0x59
loop_2019:
	subcc	%i1,	%l1,	%g7
	movl	%icc,	%i6,	%l4
	wr	%g0,	0x18,	%asi
	nop
	setx loop_2020, %l0, %l1
	jmpl %l1, %o4
	movg	%xcc,	%g4,	%i3
	fnegs	%f15,	%f18
	ble,pt	%xcc,	loop_2021
loop_2020:
	movcs	%xcc,	%g5,	%l6
	edge8	%o7,	%o1,	%o0
	sdivcc	%l3,	0x0DC4,	%g2
loop_2021:
	prefetch	[%l7 + 0x20],	 0x3
	fmovdge	%icc,	%f31,	%f13
	wr	%g0,	0x89,	%asi
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
	fmovsge	%icc,	%f24,	%f16
	edge16ln	%o5,	%g3,	%o3
	and	%l5,	0x1CC3,	%i4
	edge32l	%g1,	%i7,	%o2
	edge16l	%l2,	%i2,	%g6
	nop 	! 	tg	%xcc,	0x2 changed by convert2hboot
	addccc	%l0,	0x0974,	%i0
	nop 	! 	tsubcctv	%l1,	0x15DE,	%i1 changed by convert2hboot
	addccc	%g7,	0x1394,	%l4
	andn	%i6,	0x12A5,	%o6
	smul	%g4,	0x12BC,	%o4
	fmovsleu	%xcc,	%f15,	%f2
	fmovrdne	%g5,	%f12,	%f22
	ldstub	[%l7 + 0x77],	%i3
	srax	%l6,	0x1D,	%o1
	edge16ln	%o7,	%o0,	%g2
	movrgez	%l3,	%o5,	%g3
	fmovrslez	%o3,	%f31,	%f4
	edge16l	%l5,	%i5,	%g1
	udivcc	%i7,	0x1197,	%i4
	wr	%g0,	0x19,	%asi
	fmovrsgz	%l2,	%f4,	%f20
	orncc	%i2,	%l0,	%i0
	fand	%f20,	%f28,	%f26
	movrlez	%l1,	0x05A,	%i1
	movl	%xcc,	%g6,	%l4
	wr	%g0,	0x20,	%asi
	xor	%g7,	%o6,	%o4
	bne,pt	%icc,	loop_2022
	smulcc	%g4,	%g5,	%l6
	fbne,a	%fcc2,	loop_2023
	sdivcc	%o1,	0x01F9,	%o7
loop_2022:
	movneg	%xcc,	%i3,	%g2
	movcc	%icc,	%l3,	%o0
loop_2023:
	nop
	set	0x23, %g2
	nop	 ! 	ldstuba	[%l7 + %g2] 0x81,	%g3 ASI use changed by convert2hboot
	umul	%o3,	0x0494,	%l5
	srax	%i5,	0x00,	%o5
	movrgez	%g1,	%i4,	%i7
	movneg	%xcc,	%l2,	%i2
	array32	%l0,	%i0,	%o2
	wr	%g0,	0x19,	%asi
	movl	%xcc,	%i1,	%g6
	fpadd16s	%f9,	%f20,	%f11
	edge16	%l4,	%i6,	%g7
	or	%o6,	%o4,	%g4
	swap	[%l7 + 0x18],	%g5
	array8	%l6,	%o7,	%o1
	brnz,a	%g2,	loop_2024
	fmul8ulx16	%f16,	%f18,	%f22
	edge16l	%i3,	%o0,	%g3
	andn	%l3,	0x13D6,	%o3
loop_2024:
	edge16	%l5,	%i5,	%g1
	fmovrse	%o5,	%f21,	%f3
	fzeros	%f23
	fcmpd	%fcc1,	%f30,	%f0
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	movcc	%icc,	%i4,	%l2
	wr	%g0,	0x89,	%asi
	fbge,a	%fcc2,	loop_2025
	fbg,a	%fcc1,	loop_2026
	fba	%fcc3,	loop_2027
	movl	%xcc,	%l0,	%i2
loop_2025:
	movre	%i0,	0x0C1,	%o2
loop_2026:
	smul	%i1,	%g6,	%l1
loop_2027:
	ldx	[%l7 + 0x18],	%i6
	udiv	%l4,	0x173D,	%g7
	fpadd16s	%f24,	%f26,	%f19
	bge,pn	%icc,	loop_2028
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	edge16n	%o6,	%o4,	%g4
	bcs,pt	%icc,	loop_2029
loop_2028:
	bcs,a,pn	%xcc,	loop_2030
	nop 	! 	tsubcctv	%g5,	%o7,	%o1 changed by convert2hboot
	wr	%g0,	0x89,	%asi
loop_2029:
	fmovdg	%icc,	%f15,	%f27
loop_2030:
	fmovrdne	%l6,	%f4,	%f10
	fbl	%fcc0,	loop_2031
	bg,pt	%icc,	loop_2032
	movgu	%icc,	%i3,	%g3
	fcmpgt32	%f6,	%f2,	%l3
loop_2031:
	sethi	0x1819,	%o3
loop_2032:
	faligndata	%f0,	%f24,	%f26
	ba,a,pt	%xcc,	loop_2033
	movn	%icc,	%l5,	%i5
	mulscc	%o0,	%o5,	%g1
	nop 	! 	tgu	%xcc,	0x5 changed by convert2hboot
loop_2033:
	movrlz	%i4,	0x23E,	%l2
	ble,a	%xcc,	loop_2034
	move	%icc,	%l0,	%i7
	srax	%i0,	%i2,	%i1
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
loop_2034:
	array16	%g6,	%o2,	%l1
	edge32	%l4,	%g7,	%o6
	nop 	! 	tle	%icc,	0x6 changed by convert2hboot
	movrlez	%i6,	%g4,	%g5
	wr	%g0,	0x80,	%asi
	fbl,a	%fcc1,	loop_2035
	nop 	! 	tneg	%icc,	0x1 changed by convert2hboot
	move	%xcc,	%o1,	%o4
	movne	%icc,	%l6,	%g2
loop_2035:
	fbl,a	%fcc0,	loop_2036
	fbl	%fcc0,	loop_2037
	addc	%i3,	%l3,	%o3
	edge16n	%g3,	%l5,	%i5
loop_2036:
	array8	%o5,	%o0,	%i4
loop_2037:
	nop
	wr	%g0,	0x0c,	%asi
	subcc	%g1,	0x0CCF,	%i7
	fmul8x16al	%f22,	%f29,	%f0
	nop 	! 	tl	%xcc,	0x2 changed by convert2hboot
	smul	%i0,	%i2,	%i1
	fbge,a	%fcc0,	loop_2038
	movl	%xcc,	%g6,	%o2
	bvc,a	loop_2039
	add	%l1,	0x16B8,	%l0
loop_2038:
	srlx	%g7,	%l4,	%i6
	fpackfix	%f20,	%f11
loop_2039:
	smul	%o6,	0x1A83,	%g4
	fnot2s	%f5,	%f19
	bgu,a	loop_2040
	swap	[%l7 + 0x30],	%o7
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	st	%f10,	[%l7 + 0x18]
loop_2040:
	ldsh	[%l7 + 0x08],	%o1
	bge,pt	%xcc,	loop_2041
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
	nop 	! 	taddcctv	%o4,	0x192D,	%l6 changed by convert2hboot
	fbn	%fcc2,	loop_2042
loop_2041:
	lduh	[%l7 + 0x30],	%g5
	fpadd16	%f8,	%f6,	%f16
	array32	%g2,	%i3,	%l3
loop_2042:
	edge32ln	%g3,	%o3,	%i5
	nop 	! 	taddcctv	%l5,	%o0,	%o5 changed by convert2hboot
	swap	[%l7 + 0x60],	%i4
	nop 	! 	tle	%icc,	0x4 changed by convert2hboot
	sllx	%l2,	%g1,	%i0
	umul	%i7,	%i2,	%i1
	movg	%icc,	%o2,	%l1
	movcs	%xcc,	%l0,	%g7
	edge32ln	%g6,	%i6,	%o6
	wr	%g0,	0x0c,	%asi
	srlx	%o7,	%o1,	%g4
	bcc,a	%xcc,	loop_2043
	popc	%l6,	%o4
	andncc	%g5,	%i3,	%g2
	set	0x2C, %o2
	nop	 ! 	stwa	%g3,	[%l7 + %o2] 0x2b ASI use changed by convert2hboot
	membar	#Sync
loop_2043:
	fmovrsgez	%o3,	%f31,	%f31
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	orncc	%i5,	0x140A,	%l5
	fmovdcc	%xcc,	%f30,	%f27
	subcc	%o0,	%o5,	%i4
	fmovdcc	%xcc,	%f0,	%f24
	fmovsleu	%icc,	%f15,	%f0
	faligndata	%f16,	%f16,	%f22
	sllx	%l2,	%g1,	%l3
	fsrc2	%f24,	%f10
	nop
	set	0x64, %g4
	prefetch	[%l7 + %g4],	 0x3
	wr	%g0,	0xe2,	%asi
	membar	#Sync
	bvc,a,pn	%xcc,	loop_2044
	addcc	%i7,	0x08FF,	%i2
	sllx	%i1,	%l1,	%l0
	smul	%g7,	0x05B7,	%g6
loop_2044:
	movcs	%icc,	%i6,	%o2
	fbn	%fcc3,	loop_2045
	edge32ln	%l4,	%o7,	%o6
	stb	%g4,	[%l7 + 0x44]
	st	%f31,	[%l7 + 0x64]
loop_2045:
	fmovrsgz	%o1,	%f17,	%f23
	set	0x74, %o0
	nop	 ! 	stwa	%o4,	[%l7 + %o0] 0x2a ASI use changed by convert2hboot
	membar	#Sync
	edge32	%l6,	%i3,	%g2
	smul	%g3,	%g5,	%o3
	fxnor	%f4,	%f2,	%f4
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
	edge32n	%l5,	%i5,	%o5
	smul	%i4,	0x016A,	%l2
	set	0x64, %l0
	nop	 ! 	lduba	[%l7 + %l0] 0x04,	%o0 ASI use changed by convert2hboot
	and	%g1,	%i0,	%i7
	nop 	! 	tg	%xcc,	0x2 changed by convert2hboot
	fmul8sux16	%f22,	%f22,	%f24
	nop 	! 	tle	%icc,	0x3 changed by convert2hboot
	fcmpne16	%f12,	%f2,	%i2
	alignaddrl	%i1,	%l3,	%l1
	sdiv	%g7,	0x1759,	%g6
	fpsub32	%f4,	%f22,	%f22
	move	%xcc,	%i6,	%l0
	subccc	%l4,	%o2,	%o7
	addccc	%o6,	0x0B8D,	%o1
	bn,pn	%xcc,	loop_2046
	fsrc1	%f18,	%f8
	srl	%o4,	%g4,	%i3
	srl	%l6,	0x17,	%g2
loop_2046:
	mova	%xcc,	%g5,	%o3
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	udiv	%g3,	0x0A37,	%i5
	fmovse	%xcc,	%f2,	%f29
	movcs	%xcc,	%o5,	%l5
	brnz	%l2,	loop_2047
	movgu	%xcc,	%o0,	%g1
	movvs	%xcc,	%i0,	%i7
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
loop_2047:
	xnor	%i2,	%i4,	%l3
	ldsw	[%l7 + 0x30],	%l1
	udivx	%g7,	0x12A5,	%i1
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	nop 	! 	taddcctv	%g6,	%i6,	%l4 changed by convert2hboot
	nop 	! 	taddcctv	%l0,	0x1582,	%o2 changed by convert2hboot
	fors	%f25,	%f31,	%f10
	fnors	%f11,	%f7,	%f13
	nop 	! 	tg	%xcc,	0x3 changed by convert2hboot
	movrlz	%o7,	%o1,	%o4
	nop 	! 	tcc	%xcc,	0x7 changed by convert2hboot
	faligndata	%f4,	%f8,	%f10
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
	sllx	%g4,	0x18,	%i3
	wr	%g0,	0x80,	%asi
	nop 	! 	tsubcc	%g2,	0x0C2B,	%l6 changed by convert2hboot
	nop 	! 	taddcctv	%g5,	0x1C3F,	%o3 changed by convert2hboot
	fbug,a	%fcc0,	loop_2048
	movvc	%xcc,	%g3,	%o5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	nop	 ! 	casa	[%l6] 0x80,	%i5,	%l2 ASI use changed by convert2hboot
loop_2048:
	movneg	%xcc,	%o0,	%l5
	bvs,a,pn	%icc,	loop_2049
	fmovs	%f20,	%f27
	sth	%g1,	[%l7 + 0x4C]
	udivx	%i7,	0x1E7A,	%i0
loop_2049:
	fmovs	%f1,	%f23
	ldsb	[%l7 + 0x16],	%i2
	smulcc	%i4,	0x1017,	%l1
	movrlz	%l3,	%i1,	%g7
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	movpos	%xcc,	%i6,	%l4
	array8	%g6,	%l0,	%o7
	edge8n	%o1,	%o2,	%g4
	bg,pt	%xcc,	loop_2050
	fpsub16s	%f8,	%f25,	%f15
	subc	%i3,	0x119B,	%o4
	fmovsg	%xcc,	%f15,	%f12
loop_2050:
	add	%g2,	%o6,	%g5
	lduw	[%l7 + 0x50],	%l6
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
	brlez	%o3,	loop_2051
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	nop 	! 	taddcctv	%o5,	0x06AD,	%g3 changed by convert2hboot
	edge8	%i5,	%l2,	%o0
loop_2051:
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	edge16	%g1,	%i7,	%l5
	addc	%i0,	%i2,	%l1
	fxnor	%f16,	%f8,	%f16
	umulcc	%i4,	%l3,	%g7
	movvs	%xcc,	%i6,	%l4
	wr	%g0,	0x88,	%asi
	fmovs	%f6,	%f20
	sub	%l0,	0x1155,	%i1
	xnor	%o1,	0x159A,	%o2
	wr	%g0,	0x04,	%asi
	fbul,a	%fcc1,	loop_2052
	fbuge	%fcc3,	loop_2053
	fbue	%fcc0,	loop_2054
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2052:
	edge8ln	%o7,	%o4,	%i3
loop_2053:
	fmovrsne	%o6,	%f31,	%f5
loop_2054:
	fmovdn	%xcc,	%f14,	%f5
	fbl	%fcc2,	loop_2055
	lduw	[%l7 + 0x48],	%g2
	xnor	%l6,	%g5,	%o5
	std	%g2,	[%l7 + 0x30]
loop_2055:
	edge16	%i5,	%o3,	%o0
	sdivcc	%g1,	0x183A,	%i7
	udivx	%l2,	0x08CD,	%l5
	bne,a	loop_2056
	bshuffle	%f26,	%f10,	%f24
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i2
loop_2056:
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	fpsub16	%f0,	%f26,	%f24
	movcs	%icc,	%i4,	%l1
	movcs	%icc,	%l3,	%i6
	nop 	! 	sir	0x0739 changed by convert2hboot
	wr	%g0,	0x19,	%asi
	ldsh	[%l7 + 0x4C],	%g6
	membar	0x2F
	movrne	%l4,	%i1,	%l0
	fors	%f31,	%f24,	%f8
	brgz,a	%o2,	loop_2057
	fmovse	%icc,	%f9,	%f28
	set	0x20, %o6
	nop	 ! 	prefetcha	[%l7 + %o6] 0x89,	 0x2 ASI use changed by convert2hboot
loop_2057:
	nop 	! 	tsubcctv	%o7,	%o4,	%g4 changed by convert2hboot
	nop
	setx loop_2058, %l0, %l1
	jmpl %l1, %i3
	xor	%o6,	0x07D3,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug	%fcc1,	loop_2059
loop_2058:
	faligndata	%f14,	%f0,	%f4
	sllx	%g5,	%o5,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2059:
	fpsub32s	%f12,	%f9,	%f0
	fbule,a	%fcc1,	loop_2060
	sub	%l6,	%o3,	%i5
	edge32	%g1,	%i7,	%o0
	edge32	%l2,	%l5,	%i2
loop_2060:
	smul	%i0,	0x04B3,	%i4
	fmovscc	%icc,	%f10,	%f15
	fbug	%fcc3,	loop_2061
	edge16n	%l3,	%i6,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%l1,	%g6
loop_2061:
	fbu	%fcc3,	loop_2062
	nop 	! 	tcc	%icc,	0x4 changed by convert2hboot
	bvc,a	loop_2063
	movge	%icc,	%l4,	%i1
loop_2062:
	fmovsleu	%xcc,	%f24,	%f17
	nop 	! 	tvc	%xcc,	0x0 changed by convert2hboot
loop_2063:
	addc	%o2,	%l0,	%o1
	nop 	! 	tne	%xcc,	0x3 changed by convert2hboot
	fbe	%fcc0,	loop_2064
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
	movrne	%o7,	0x279,	%g4
	fcmpne32	%f12,	%f10,	%o4
loop_2064:
	nop
	set	0x15, %l4
	nop	 ! 	lduba	[%l7 + %l4] 0x81,	%o6 ASI use changed by convert2hboot
	fandnot2s	%f23,	%f26,	%f0
	sth	%i3,	[%l7 + 0x0E]
	fmul8sux16	%f22,	%f10,	%f24
	edge8	%g5,	%o5,	%g3
	sdiv	%g2,	0x0F64,	%l6
	or	%o3,	0x008B,	%i5
	movre	%g1,	0x1E7,	%i7
	alignaddrl	%o0,	%l5,	%i2
	movl	%icc,	%l2,	%i0
	andn	%i4,	%i6,	%g7
	fmuld8ulx16	%f17,	%f19,	%f28
	move	%icc,	%l3,	%g6
	fornot2s	%f19,	%f8,	%f15
	fbg	%fcc1,	loop_2065
	bcs,a,pn	%xcc,	loop_2066
	nop 	! 	tl	%xcc,	0x7 changed by convert2hboot
	nop 	! 	taddcctv	%l1,	0x19B6,	%i1 changed by convert2hboot
loop_2065:
	fbn,a	%fcc2,	loop_2067
loop_2066:
	nop 	! 	tge	%icc,	0x4 changed by convert2hboot
	fmovdl	%icc,	%f11,	%f10
	fcmple16	%f14,	%f10,	%o2
loop_2067:
	array32	%l0,	%o1,	%l4
	movrgez	%g4,	0x3C2,	%o4
	add	%o7,	%i3,	%o6
	fmovrdlz	%o5,	%f8,	%f16
	fbo,a	%fcc2,	loop_2068
	fabsd	%f0,	%f12
	fornot2s	%f26,	%f21,	%f12
	andncc	%g5,	%g2,	%l6
loop_2068:
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
	nop 	! 	tge	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	movcs	%xcc,	%o3,	%i5
	nop 	! 	taddcc	%g3,	0x1426,	%i7 changed by convert2hboot
	fmovsgu	%icc,	%f0,	%f0
	orcc	%o0,	0x1E7E,	%g1
	srl	%l5,	0x1D,	%i2
	edge16ln	%i0,	%i4,	%l2
	brnz	%i6,	loop_2069
	call	loop_2070
	bne,pt	%xcc,	loop_2071
	nop 	! 	tl	%xcc,	0x4 changed by convert2hboot
loop_2069:
	srlx	%l3,	0x17,	%g7
loop_2070:
	nop
	setx loop_2072, %l0, %l1
	jmpl %l1, %g6
loop_2071:
	smul	%l1,	%i1,	%l0
	fmovspos	%xcc,	%f2,	%f1
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
loop_2072:
	nop 	! 	sir	0x1ECC changed by convert2hboot
	fsrc2s	%f4,	%f3
	nop 	! 	tsubcc	%o1,	0x1D30,	%l4 changed by convert2hboot
	addc	%g4,	0x0BC3,	%o2
	set	0x56, %l6
	nop	 ! 	lduha	[%l7 + %l6] 0x19,	%o4 ASI use changed by convert2hboot
	wr	%g0,	0x89,	%asi
	nop 	! 	tl	%icc,	0x6 changed by convert2hboot
	lduh	[%l7 + 0x14],	%o6
	fmul8x16al	%f16,	%f1,	%f26
	nop
	setx	loop_2073,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movvc	%icc,	%o7,	%g5
	wr	%g0,	0x2a,	%asi
loop_2073:
	fmovs	%f12,	%f19
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	fcmpne32	%f10,	%f6,	%g2
	xnorcc	%l6,	0x0167,	%i5
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	edge32l	%g3,	%i7,	%o3
	edge8l	%g1,	%o0,	%i2
	set	0x50, %i4
	nop	 ! 	ldswa	[%l7 + %i4] 0x19,	%l5 ASI use changed by convert2hboot
	swap	[%l7 + 0x14],	%i0
	fmuld8ulx16	%f6,	%f15,	%f26
	stx	%i4,	[%l7 + 0x28]
	movrgez	%l2,	0x12C,	%l3
	srax	%g7,	0x01,	%i6
	nop 	! 	ta	%xcc,	0x4 changed by convert2hboot
	fandnot1	%f12,	%f30,	%f4
	movrlz	%l1,	0x1C2,	%g6
	xnorcc	%i1,	0x1309,	%o1
	subcc	%l0,	0x12D1,	%g4
	stx	%o2,	[%l7 + 0x38]
	bcs	loop_2074
	fmovsneg	%xcc,	%f20,	%f31
	brgez,a	%o4,	loop_2075
	movne	%icc,	%i3,	%l4
loop_2074:
	movcc	%icc,	%o7,	%g5
	edge16ln	%o5,	%o6,	%g2
loop_2075:
	orn	%l6,	%i5,	%g3
	srlx	%i7,	0x12,	%g1
	movpos	%xcc,	%o3,	%o0
	wr	%g0,	0x22,	%asi
	nop 	! 	tcs	%icc,	0x7 changed by convert2hboot
	fmovdcc	%icc,	%f6,	%f11
	bge	%icc,	loop_2076
	movrne	%i0,	0x1AD,	%i2
	prefetch	[%l7 + 0x34],	 0x2
	ldsw	[%l7 + 0x20],	%l2
loop_2076:
	movvs	%icc,	%i4,	%l3
	sdivx	%i6,	0x1845,	%l1
	addccc	%g6,	0x0C63,	%i1
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x24] %asi,	%f31
	movrne	%g7,	0x0B0,	%o1
	wr	%g0,	0x81,	%asi
	umulcc	%l0,	0x174B,	%o4
	fbule	%fcc1,	loop_2077
	edge8n	%o2,	%l4,	%i3
	membar	0x22
	movgu	%icc,	%g5,	%o7
loop_2077:
	array16	%o5,	%o6,	%g2
	fxnors	%f0,	%f23,	%f25
	movvc	%icc,	%l6,	%g3
	mulscc	%i7,	0x1B4A,	%g1
	set	0x66, %i0
	nop	 ! 	ldsha	[%l7 + %i0] 0x18,	%i5 ASI use changed by convert2hboot
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
	fbge	%fcc3,	loop_2078
	ldsw	[%l7 + 0x30],	%o3
	sdiv	%o0,	0x1FF3,	%i0
	alignaddrl	%i2,	%l2,	%i4
loop_2078:
	movleu	%xcc,	%l3,	%l5
	mulx	%l1,	0x158D,	%g6
	movn	%icc,	%i1,	%i6
	edge8	%o1,	%g4,	%g7
	fbu	%fcc2,	loop_2079
	ldstub	[%l7 + 0x76],	%o4
	flush	%l7 + 0x34
	movvs	%icc,	%l0,	%o2
loop_2079:
	addcc	%l4,	%i3,	%g5
	set	0x0, %i3
	nop	 ! 	ldxa	[%g0 + %i3] 0x58,	%o7 ASI use changed by convert2hboot
	nop 	! 	taddcc	%o6,	%g2,	%l6 changed by convert2hboot
	set	0x6C, %i7
	sta	%f28,	[%l7 + %i7] 0x88
	andn	%g3,	%o5,	%i7
	alignaddr	%i5,	%g1,	%o0
	set	0x14, %i2
	lda	[%l7 + %i2] 0x80,	%f4
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	fmovdpos	%xcc,	%f24,	%f16
	movcs	%xcc,	%o3,	%i0
	movrne	%i2,	%l2,	%l3
	fmovsne	%xcc,	%f10,	%f22
	fmuld8sux16	%f22,	%f12,	%f20
	nop 	! 	taddcc	%l5,	%i4,	%g6 changed by convert2hboot
	sethi	0x1B8B,	%l1
	edge32l	%i1,	%o1,	%g4
	call	loop_2080
	stb	%g7,	[%l7 + 0x11]
	subc	%o4,	0x0175,	%l0
	srl	%o2,	%i6,	%i3
loop_2080:
	edge8	%g5,	%o7,	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	fmovrse	%g3,	%f0,	%f19
	fornot1	%f6,	%f12,	%f28
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
	udiv	%o5,	0x0C64,	%i7
	fmovsneg	%icc,	%f20,	%f29
	fzero	%f14
	edge8	%o6,	%g1,	%i5
	bge	%icc,	loop_2081
	sdiv	%o3,	0x1905,	%i0
	sllx	%i2,	%l2,	%o0
	wr	%g0,	0x88,	%asi
loop_2081:
	fnegs	%f13,	%f20
	movge	%xcc,	%i4,	%l5
	nop 	! 	sir	0x0C2F changed by convert2hboot
	prefetch	[%l7 + 0x6C],	 0x0
	fmovrdne	%l1,	%f26,	%f6
	udivcc	%i1,	0x0E44,	%o1
	for	%f0,	%f0,	%f4
	nop 	! 	tl	%xcc,	0x4 changed by convert2hboot
	brgz	%g6,	loop_2082
	orn	%g4,	%o4,	%l0
	bvs,a,pn	%icc,	loop_2083
	bn,a	%xcc,	loop_2084
loop_2082:
	siam	0x3
	ba,a,pn	%icc,	loop_2085
loop_2083:
	sllx	%o2,	%i6,	%i3
loop_2084:
	movrlz	%g7,	0x2E0,	%g5
	fpack32	%f28,	%f20,	%f16
loop_2085:
	movleu	%xcc,	%l4,	%g2
	umulcc	%l6,	0x1A40,	%o7
	fpadd32s	%f2,	%f14,	%f29
	fbge	%fcc3,	loop_2086
	sethi	0x1FC7,	%g3
	subc	%i7,	%o6,	%g1
	ldsw	[%l7 + 0x38],	%i5
loop_2086:
	nop
	set	0x30, %o3
	stw	%o3,	[%l7 + %o3]
	fbu,a	%fcc0,	loop_2087
	edge32n	%o5,	%i2,	%l2
	add	%o0,	%l3,	%i0
	bpos,a	loop_2088
loop_2087:
	fnegd	%f26,	%f12
	bleu	loop_2089
	movle	%icc,	%i4,	%l1
loop_2088:
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	fmovsge	%icc,	%f30,	%f7
loop_2089:
	bpos	loop_2090
	popc	0x0675,	%l5
	edge16l	%o1,	%g6,	%i1
	fpadd16	%f14,	%f6,	%f20
loop_2090:
	sdivx	%g4,	0x131A,	%o4
	sth	%l0,	[%l7 + 0x0E]
	srax	%i6,	0x1A,	%i3
	ldx	[%l7 + 0x70],	%o2
	fcmps	%fcc0,	%f25,	%f26
	fpack16	%f24,	%f5
	movvc	%xcc,	%g5,	%g7
	bn,a,pt	%icc,	loop_2091
	fmovrdgez	%l4,	%f12,	%f10
	flush	%l7 + 0x10
	addc	%l6,	0x1C86,	%o7
loop_2091:
	edge16ln	%g2,	%g3,	%i7
	srax	%o6,	%g1,	%i5
	alignaddr	%o5,	%i2,	%l2
	movcs	%xcc,	%o0,	%o3
	fmovsvc	%xcc,	%f26,	%f5
	move	%icc,	%l3,	%i4
	fmovrsne	%l1,	%f24,	%f22
	addcc	%i0,	0x0872,	%o1
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
	fpack32	%f20,	%f4,	%f4
	mulx	%l5,	%g6,	%g4
	fcmps	%fcc0,	%f14,	%f12
	edge16ln	%o4,	%i1,	%i6
	edge32n	%i3,	%o2,	%g5
	popc	0x1259,	%g7
	bvc,a,pt	%xcc,	loop_2092
	andcc	%l0,	0x1587,	%l6
	array8	%l4,	%g2,	%g3
	wr	%g0,	0x27,	%asi
	membar	#Sync
loop_2092:
	array32	%o7,	%g1,	%o6
	movge	%xcc,	%i5,	%i2
	fpadd16	%f26,	%f22,	%f26
	fmovrsgez	%l2,	%f10,	%f26
	call	loop_2093
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
	xor	%o0,	0x02CA,	%o3
	smul	%o5,	%i4,	%l1
loop_2093:
	fmovrslz	%l3,	%f9,	%f21
	sdivcc	%o1,	0x0BC2,	%i0
	fbg,a	%fcc3,	loop_2094
	movrne	%l5,	0x1E5,	%g4
	udiv	%g6,	0x0172,	%i1
	fmovsn	%xcc,	%f3,	%f17
loop_2094:
	bleu,pn	%icc,	loop_2095
	movl	%xcc,	%i6,	%i3
	movrgez	%o4,	%o2,	%g7
	movre	%l0,	0x20B,	%g5
loop_2095:
	movrgz	%l4,	0x3D7,	%l6
	fmovd	%f24,	%f22
	set	0x18, %l1
	lda	[%l7 + %l1] 0x15,	%f27
	movle	%icc,	%g2,	%i7
	fmul8x16au	%f12,	%f28,	%f4
	sethi	0x1935,	%g3
	fxnor	%f2,	%f12,	%f14
	edge16n	%g1,	%o7,	%i5
	subc	%i2,	0x0366,	%o6
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	movvc	%xcc,	%o0,	%o3
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	lduw	[%l7 + 0x10],	%o5
	sdivcc	%i4,	0x12B4,	%l2
	subc	%l3,	0x0D99,	%o1
	sllx	%l1,	0x18,	%l5
	movre	%g4,	0x1EE,	%g6
	smul	%i0,	%i1,	%i3
	subccc	%i6,	%o4,	%g7
	edge16l	%o2,	%l0,	%l4
	srlx	%l6,	%g2,	%i7
	fnands	%f5,	%f5,	%f20
	mova	%xcc,	%g3,	%g5
	ld	[%l7 + 0x40],	%f26
	fzeros	%f7
	mulx	%o7,	%i5,	%g1
	brnz	%i2,	loop_2096
	fandnot1s	%f2,	%f24,	%f18
	nop 	! 	tcs	%icc,	0x6 changed by convert2hboot
	movcc	%icc,	%o0,	%o6
loop_2096:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc3,	loop_2097
	fsrc1	%f2,	%f8
	fcmpgt32	%f4,	%f28,	%o3
	alignaddrl	%o5,	%i4,	%l3
loop_2097:
	fmuld8sux16	%f16,	%f24,	%f24
	movrlez	%o1,	0x156,	%l2
	fpsub32s	%f7,	%f24,	%f15
	std	%l4,	[%l7 + 0x60]
	andncc	%l1,	%g6,	%g4
	nop 	! 	tvs	%icc,	0x5 changed by convert2hboot
	fmovrsne	%i0,	%f28,	%f15
	movrne	%i1,	%i6,	%o4
	subcc	%g7,	%o2,	%l0
	orn	%i3,	0x1515,	%l4
	fnor	%f2,	%f20,	%f2
	andcc	%l6,	%i7,	%g3
	movcs	%icc,	%g5,	%o7
	fmovdvs	%xcc,	%f17,	%f20
	nop 	! 	tcs	%icc,	0x4 changed by convert2hboot
	nop 	! 	tle	%icc,	0x6 changed by convert2hboot
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	or	%i5,	0x1A78,	%g1
	nop 	! 	taddcctv	%g2,	%o0,	%o6 changed by convert2hboot
	fmovdg	%xcc,	%f14,	%f6
	movrlz	%o3,	0x356,	%i2
	brgez	%o5,	loop_2098
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	subccc	%i4,	%l3,	%o1
	movvc	%xcc,	%l2,	%l1
loop_2098:
	ba	%xcc,	loop_2099
	fand	%f18,	%f4,	%f26
	edge8n	%l5,	%g4,	%g6
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
loop_2099:
	fpadd16	%f22,	%f28,	%f20
	fcmpd	%fcc0,	%f2,	%f30
	fmovda	%icc,	%f27,	%f24
	mova	%icc,	%i1,	%i0
	nop 	! 	taddcctv	%i6,	%g7,	%o4 changed by convert2hboot
	move	%icc,	%o2,	%l0
	subccc	%l4,	%l6,	%i7
	std	%g2,	[%l7 + 0x18]
	movgu	%icc,	%i3,	%o7
	sethi	0x1DD0,	%i5
	movrlez	%g1,	0x25E,	%g5
	fand	%f18,	%f8,	%f24
	fbug,a	%fcc3,	loop_2100
	fpmerge	%f0,	%f19,	%f28
	subcc	%o0,	0x18CB,	%g2
	bg,pt	%xcc,	loop_2101
loop_2100:
	st	%f1,	[%l7 + 0x08]
	be,a,pt	%icc,	loop_2102
	alignaddrl	%o6,	%i2,	%o5
loop_2101:
	addccc	%i4,	0x1711,	%l3
	fmovrdgez	%o1,	%f30,	%f12
loop_2102:
	movrne	%o3,	%l2,	%l1
	movneg	%xcc,	%g4,	%g6
	fmovdvc	%xcc,	%f4,	%f4
	fxnors	%f19,	%f0,	%f17
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	addccc	%l5,	%i0,	%i1
	fcmpes	%fcc1,	%f20,	%f29
	sllx	%i6,	0x1F,	%g7
	add	%o4,	0x1A96,	%o2
	fbl	%fcc3,	loop_2103
	bvs,a,pt	%icc,	loop_2104
	nop 	! 	tcs	%icc,	0x3 changed by convert2hboot
	brgz,a	%l4,	loop_2105
loop_2103:
	edge32	%l6,	%l0,	%i7
loop_2104:
	mulx	%i3,	0x15A3,	%o7
	fcmpeq16	%f12,	%f12,	%g3
loop_2105:
	srlx	%g1,	%g5,	%i5
	add	%g2,	%o0,	%o6
	movne	%icc,	%o5,	%i2
	stb	%i4,	[%l7 + 0x2C]
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%o1,	%f2,	%f8
	movrlez	%l3,	%o3,	%l2
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	nop
	setx	loop_2106,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop
	setx	loop_2107,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fcmpes	%fcc2,	%f5,	%f30
	sub	%l1,	%g6,	%l5
loop_2106:
	fmovd	%f10,	%f24
loop_2107:
	movleu	%xcc,	%g4,	%i1
	fbl	%fcc2,	loop_2108
	fmovdne	%icc,	%f26,	%f8
	fxnors	%f8,	%f19,	%f9
	movneg	%xcc,	%i6,	%g7
loop_2108:
	mulscc	%o4,	0x096E,	%i0
	movvc	%icc,	%o2,	%l4
	ldd	[%l7 + 0x30],	%f30
	add	%l6,	0x15E9,	%l0
	nop
	set	0x26, %i6
	stb	%i3,	[%l7 + %i6]
	xor	%i7,	%g3,	%o7
	bcs	%icc,	loop_2109
	fbuge,a	%fcc3,	loop_2110
	lduh	[%l7 + 0x78],	%g5
	ble	%xcc,	loop_2111
loop_2109:
	bge,a,pn	%icc,	loop_2112
loop_2110:
	fabss	%f31,	%f16
	nop 	! 	tvs	%xcc,	0x3 changed by convert2hboot
loop_2111:
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
loop_2112:
	edge32ln	%i5,	%g2,	%g1
	addc	%o6,	0x1B01,	%o5
	fandnot1	%f14,	%f10,	%f12
	smulcc	%o0,	%i2,	%i4
	fcmple32	%f12,	%f4,	%l3
	bge,pt	%xcc,	loop_2113
	edge16n	%o1,	%l2,	%l1
	edge8n	%g6,	%l5,	%o3
	set	0x40, %g3
	nop	 ! 	stda	%f16,	[%l7 + %g3] 0x0c ASI use changed by convert2hboot
loop_2113:
	orncc	%g4,	0x0DCF,	%i6
	udiv	%i1,	0x1226,	%o4
	add	%g7,	0x0E61,	%o2
	fmovdpos	%xcc,	%f27,	%f6
	fble	%fcc2,	loop_2114
	edge32l	%l4,	%i0,	%l0
	alignaddrl	%l6,	%i7,	%g3
	movneg	%xcc,	%o7,	%i3
loop_2114:
	nop
	wr	%g0,	0x23,	%asi
	membar	#Sync
	st	%f15,	[%l7 + 0x28]
	set	0x20, %o7
	nop	 ! 	ldxa	[%g0 + %o7] 0x58,	%g5 ASI use changed by convert2hboot
	stb	%g1,	[%l7 + 0x62]
	orn	%g2,	0x0394,	%o6
	fmovdle	%xcc,	%f29,	%f14
	nop
	setx	loop_2115,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fmovrdgz	%o5,	%f12,	%f6
	fcmps	%fcc2,	%f31,	%f5
	edge8n	%o0,	%i4,	%l3
loop_2115:
	edge32n	%o1,	%i2,	%l1
	fxors	%f31,	%f24,	%f19
	srl	%g6,	%l2,	%l5
	mulx	%g4,	%o3,	%i6
	edge32	%o4,	%i1,	%g7
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	st	%f24,	[%l7 + 0x50]
	fcmped	%fcc3,	%f20,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o2,	0x08BD,	%l4
	edge16ln	%l0,	%l6,	%i7
	alignaddr	%i0,	%o7,	%g3
	fpadd16	%f8,	%f28,	%f30
	fcmpgt32	%f30,	%f2,	%i3
	movge	%xcc,	%g5,	%i5
	swap	[%l7 + 0x44],	%g2
	fmovdleu	%xcc,	%f17,	%f23
	movl	%xcc,	%g1,	%o5
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
	bpos,a,pt	%icc,	loop_2116
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x0c,	%asi
loop_2116:
	udiv	%o6,	0x03D2,	%i4
	movneg	%xcc,	%o1,	%l3
	fpsub32s	%f31,	%f16,	%f19
	srl	%i2,	%g6,	%l1
	fbge	%fcc2,	loop_2117
	subccc	%l2,	0x02F9,	%g4
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	array16	%o3,	%i6,	%l5
loop_2117:
	fbne	%fcc0,	loop_2118
	add	%o4,	0x006A,	%g7
	fmovdleu	%xcc,	%f16,	%f5
	fornot2	%f2,	%f20,	%f16
loop_2118:
	nop 	! 	te	%xcc,	0x7 changed by convert2hboot
	subc	%i1,	0x17A8,	%o2
	std	%l4,	[%l7 + 0x30]
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
	array32	%l0,	%i7,	%i0
	ldub	[%l7 + 0x53],	%o7
	fbu	%fcc3,	loop_2119
	edge16	%l6,	%g3,	%g5
	bneg,a	%xcc,	loop_2120
	ldx	[%l7 + 0x68],	%i3
loop_2119:
	ldd	[%l7 + 0x18],	%f14
	nop
	set	0x7A, %i5
	ldsh	[%l7 + %i5],	%i5
loop_2120:
	nop
	wr	%g0,	0x18,	%asi
	ble,pn	%icc,	loop_2121
	fbg,a	%fcc2,	loop_2122
	brz	%g1,	loop_2123
	std	%o4,	[%l7 + 0x70]
loop_2121:
	ld	[%l7 + 0x0C],	%f13
loop_2122:
	edge16	%o6,	%o0,	%o1
loop_2123:
	movge	%xcc,	%i4,	%i2
	addcc	%g6,	%l1,	%l3
	fexpand	%f28,	%f10
	xnor	%l2,	0x180F,	%o3
	set	0x2C, %g6
	nop	 ! 	stwa	%g4,	[%l7 + %g6] 0x89 ASI use changed by convert2hboot
	movrlez	%i6,	0x14E,	%o4
	add	%g7,	0x116E,	%i1
	st	%f6,	[%l7 + 0x14]
	bgu,pn	%xcc,	loop_2124
	edge8ln	%o2,	%l5,	%l4
	bcc	loop_2125
	fand	%f24,	%f4,	%f26
loop_2124:
	nop 	! 	taddcc	%l0,	0x0051,	%i7 changed by convert2hboot
	orncc	%i0,	0x179D,	%l6
loop_2125:
	fmovrsgz	%g3,	%f31,	%f31
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	bneg	%icc,	loop_2126
	addccc	%g5,	%o7,	%i5
	udiv	%g2,	0x0BD7,	%i3
	fnor	%f22,	%f10,	%f20
loop_2126:
	mulscc	%g1,	0x0A39,	%o6
	xorcc	%o5,	0x1BB7,	%o0
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
	fsrc1s	%f21,	%f14
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
	fand	%f12,	%f10,	%f22
	movneg	%icc,	%i4,	%o1
	nop 	! 	tleu	%icc,	0x1 changed by convert2hboot
	edge16ln	%g6,	%i2,	%l3
	fornot2	%f10,	%f16,	%f28
	popc	%l1,	%l2
	lduh	[%l7 + 0x38],	%g4
	smulcc	%i6,	%o3,	%o4
	edge16	%g7,	%o2,	%i1
	fbn,a	%fcc0,	loop_2127
	lduw	[%l7 + 0x24],	%l5
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	bl,a,pt	%xcc,	loop_2128
loop_2127:
	sdiv	%l0,	0x0830,	%i7
	sdivcc	%l4,	0x098B,	%i0
	bshuffle	%f24,	%f8,	%f14
loop_2128:
	srlx	%l6,	0x01,	%g3
	fbue,a	%fcc3,	loop_2129
	fbuge	%fcc2,	loop_2130
	bg	loop_2131
	fmovde	%icc,	%f10,	%f10
loop_2129:
	fcmps	%fcc1,	%f25,	%f0
loop_2130:
	fexpand	%f0,	%f28
loop_2131:
	movge	%xcc,	%g5,	%i5
	movvc	%icc,	%o7,	%i3
	movleu	%xcc,	%g1,	%g2
	subcc	%o6,	%o0,	%o5
	array16	%o1,	%i4,	%g6
	fnegs	%f23,	%f1
	fpadd32	%f24,	%f8,	%f14
	fbn	%fcc2,	loop_2132
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
	set	0x70, %i1
	nop	 ! 	stxa	%i2,	[%l7 + %i1] 0x2a ASI use changed by convert2hboot
	membar	#Sync
loop_2132:
	nop
	setx	loop_2133,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	sub	%l1,	0x1A0C,	%l2
	nop 	! 	tsubcc	%l3,	0x1CA7,	%g4 changed by convert2hboot
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
loop_2133:
	fpmerge	%f2,	%f11,	%f4
	movge	%xcc,	%i6,	%o3
	movleu	%xcc,	%o4,	%o2
	for	%f10,	%f0,	%f16
	movn	%xcc,	%i1,	%l5
	sll	%g7,	%l0,	%l4
	fmovsa	%icc,	%f6,	%f23
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	nop	 ! 	casa	[%l6] 0x89,	%i0,	%l6 ASI use changed by convert2hboot
	movrlez	%g3,	0x302,	%i7
	fpack32	%f26,	%f10,	%f22
	fpsub32	%f10,	%f6,	%f18
	stw	%g5,	[%l7 + 0x50]
	srlx	%i5,	%o7,	%g1
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	xor	%g2,	%i3,	%o6
	set	0x47, %l5
	nop	 ! 	lduba	[%l7 + %l5] 0x19,	%o5 ASI use changed by convert2hboot
	be,pn	%icc,	loop_2134
	move	%xcc,	%o0,	%i4
	movvc	%xcc,	%g6,	%i2
	bvs,a	loop_2135
loop_2134:
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	ldub	[%l7 + 0x69],	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2135:
	fxnor	%f12,	%f26,	%f0
	stb	%l2,	[%l7 + 0x55]
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	edge16ln	%l3,	%l1,	%i6
	subc	%g4,	%o4,	%o2
	fmovdvc	%icc,	%f7,	%f21
	umul	%o3,	0x16FD,	%l5
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	movrne	%g7,	%i1,	%l4
	add	%l0,	0x03DF,	%l6
	fbo	%fcc1,	loop_2136
	nop 	! 	tg	%xcc,	0x4 changed by convert2hboot
	for	%f8,	%f4,	%f16
	and	%i0,	0x0111,	%g3
loop_2136:
	nop 	! 	tneg	%icc,	0x0 changed by convert2hboot
	udivx	%g5,	0x0D61,	%i5
	nop
	setx	loop_2137,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	ble	loop_2138
	fand	%f20,	%f4,	%f4
	fpsub32s	%f16,	%f19,	%f3
loop_2137:
	fmovse	%xcc,	%f14,	%f13
loop_2138:
	array16	%i7,	%o7,	%g2
	edge16	%g1,	%i3,	%o5
	nop
	setx loop_2139, %l0, %l1
	jmpl %l1, %o0
	edge16	%i4,	%g6,	%o6
	bge	loop_2140
	fbn,a	%fcc1,	loop_2141
loop_2139:
	sllx	%i2,	%o1,	%l3
	nop 	! 	taddcctv	%l1,	0x0C07,	%l2 changed by convert2hboot
loop_2140:
	nop 	! 	tcs	%xcc,	0x3 changed by convert2hboot
loop_2141:
	pdist	%f12,	%f8,	%f22
	fzeros	%f19
	wr	%g0,	0x2f,	%asi
	membar	#Sync
	movrgz	%g4,	0x224,	%o4
	set	0x30, %o5
	nop	 ! 	ldxa	[%l7 + %o5] 0x18,	%o2 ASI use changed by convert2hboot
	smul	%l5,	%g7,	%i1
	call	loop_2142
	stx	%l4,	[%l7 + 0x40]
	smul	%o3,	0x14EA,	%l0
	movneg	%xcc,	%l6,	%g3
loop_2142:
	movle	%xcc,	%g5,	%i0
	fbu	%fcc1,	loop_2143
	edge8n	%i7,	%i5,	%o7
	ble,a	loop_2144
	xor	%g1,	%i3,	%o5
loop_2143:
	std	%f28,	[%l7 + 0x48]
	subcc	%g2,	0x0B84,	%o0
loop_2144:
	edge16n	%i4,	%o6,	%i2
	nop 	! 	taddcctv	%g6,	%l3,	%o1 changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
	ldstub	[%l7 + 0x54],	%l2
	wr	%g0,	0x04,	%asi
	fbg,a	%fcc3,	loop_2145
	edge8l	%g4,	%l1,	%o2
	wr	%g0,	0x80,	%asi
loop_2145:
	nop 	! 	tneg	%xcc,	0x2 changed by convert2hboot
	bvs,a,pt	%xcc,	loop_2146
	bpos,pt	%icc,	loop_2147
	fble,a	%fcc1,	loop_2148
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
loop_2146:
	addcc	%o4,	%g7,	%l4
loop_2147:
	movg	%icc,	%i1,	%l0
loop_2148:
	nop
	wr	%g0,	0x89,	%asi
	andcc	%l6,	%g5,	%g3
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	edge8	%i0,	%i5,	%o7
	edge32n	%g1,	%i7,	%i3
	movrlz	%o5,	0x395,	%o0
	brz	%g2,	loop_2149
	fxors	%f22,	%f21,	%f24
	movrne	%i4,	%o6,	%i2
	nop 	! 	tcs	%icc,	0x3 changed by convert2hboot
loop_2149:
	brgz	%g6,	loop_2150
	xnor	%l3,	%o1,	%i6
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
	movle	%icc,	%g4,	%l2
loop_2150:
	nop 	! 	sir	0x118B changed by convert2hboot
	movleu	%icc,	%o2,	%l5
	set	0x60, %o4
	nop	 ! 	ldda	[%l7 + %o4] 0xe3,	%l0 ASI use changed by convert2hboot
	fmovsge	%icc,	%f28,	%f13
	smul	%g7,	%o4,	%i1
	lduh	[%l7 + 0x4A],	%l0
	nop 	! 	taddcc	%l4,	%l6,	%o3 changed by convert2hboot
	brgz	%g3,	loop_2151
	sra	%i0,	%g5,	%o7
	movvc	%xcc,	%g1,	%i7
	movleu	%icc,	%i3,	%o5
loop_2151:
	xnor	%o0,	0x1B2C,	%g2
	udivcc	%i5,	0x0E2F,	%o6
	fmovdpos	%icc,	%f27,	%f30
	xnorcc	%i4,	0x1B47,	%g6
	edge8n	%l3,	%i2,	%o1
	and	%g4,	%l2,	%o2
	fmovrdlez	%i6,	%f28,	%f20
	nop 	! 	taddcc	%l5,	0x0ED4,	%g7 changed by convert2hboot
	edge32ln	%o4,	%l1,	%i1
	bg,a,pn	%icc,	loop_2152
	fmuld8sux16	%f25,	%f13,	%f28
	set	0x3C, %g1
	nop	 ! 	ldswa	[%l7 + %g1] 0x18,	%l4 ASI use changed by convert2hboot
loop_2152:
	nop 	! 	tl	%xcc,	0x7 changed by convert2hboot
	fmovdpos	%xcc,	%f4,	%f31
	set	0x50, %o1
	nop	 ! 	lduba	[%l7 + %o1] 0x0c,	%l0 ASI use changed by convert2hboot
	array8	%o3,	%l6,	%i0
	movge	%icc,	%g3,	%g5
	fmovdvc	%xcc,	%f26,	%f6
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
	sllx	%o7,	%i7,	%i3
	movle	%icc,	%g1,	%o5
	fbne	%fcc2,	loop_2153
	movn	%icc,	%g2,	%i5
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	lduw	[%l7 + 0x2C],	%o0
loop_2153:
	bcc,a	%icc,	loop_2154
	udivcc	%i4,	0x1C61,	%g6
	bne,a	loop_2155
	nop 	! 	tle	%icc,	0x2 changed by convert2hboot
loop_2154:
	sdiv	%o6,	0x10FD,	%i2
	umulcc	%o1,	%g4,	%l3
loop_2155:
	nop
	wr	%g0,	0x89,	%asi
	fcmpne16	%f14,	%f2,	%i6
	lduw	[%l7 + 0x74],	%o2
	and	%g7,	0x05A4,	%l5
	fmuld8ulx16	%f29,	%f16,	%f30
	orn	%l1,	0x1780,	%i1
	stx	%o4,	[%l7 + 0x20]
	srax	%l4,	%o3,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	set	0x60, %g5
	nop	 ! 	stwa	%l0,	[%l7 + %g5] 0xeb ASI use changed by convert2hboot
	membar	#Sync
	fbl	%fcc0,	loop_2156
	fmovdle	%icc,	%f8,	%f21
	bvs	%xcc,	loop_2157
	fmovsl	%xcc,	%f13,	%f23
loop_2156:
	fnot2	%f22,	%f0
	xnor	%i0,	%g5,	%g3
loop_2157:
	mova	%xcc,	%i7,	%o7
	or	%g1,	0x0BBF,	%i3
	wr	%g0,	0x19,	%asi
	bvc,pn	%icc,	loop_2158
	fbue,a	%fcc0,	loop_2159
	movrgez	%g2,	%o0,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2158:
	edge16l	%i5,	%g6,	%o6
loop_2159:
	nop 	! 	sir	0x1873 changed by convert2hboot
	movrne	%o1,	0x074,	%g4
	brgez,a	%l3,	loop_2160
	movge	%icc,	%i2,	%l2
	nop 	! 	tneg	%icc,	0x1 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
loop_2160:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i6,	0x04E6,	%o2
	andncc	%l5,	%g7,	%i1
	nop 	! 	sir	0x1D6D changed by convert2hboot
	edge16ln	%o4,	%l4,	%l1
	siam	0x4
	umulcc	%l6,	%l0,	%o3
	edge16ln	%g5,	%g3,	%i7
	edge8	%i0,	%g1,	%i3
	fba,a	%fcc0,	loop_2161
	sra	%o5,	0x14,	%g2
	fbn	%fcc2,	loop_2162
	movleu	%icc,	%o0,	%i4
loop_2161:
	flush	%l7 + 0x74
	orncc	%i5,	%g6,	%o6
loop_2162:
	movne	%icc,	%o7,	%g4
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	edge8l	%l3,	%i2,	%l2
	fbuge,a	%fcc0,	loop_2163
	udiv	%i6,	0x16C9,	%o2
	bpos,a,pn	%xcc,	loop_2164
	umulcc	%o1,	%g7,	%l5
loop_2163:
	ldsb	[%l7 + 0x60],	%o4
	movn	%icc,	%l4,	%l1
loop_2164:
	fpackfix	%f8,	%f9
	subcc	%l6,	0x0A90,	%i1
	fpsub16s	%f30,	%f13,	%f1
	nop 	! 	sir	0x1EA6 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	movcc	%xcc,	%g5,	%o3
	orn	%g3,	%i0,	%g1
	fnand	%f24,	%f24,	%f12
	nop 	! 	sir	0x06E3 changed by convert2hboot
	fabsd	%f10,	%f16
	mulx	%i3,	0x074D,	%i7
	popc	0x1A1D,	%o5
	add	%g2,	%o0,	%i4
	set	0x40, %g7
	nop	 ! 	ldda	[%l7 + %g7] 0x18,	%f16 ASI use changed by convert2hboot
	orn	%g6,	%o6,	%o7
	movleu	%xcc,	%g4,	%i5
	movleu	%xcc,	%i2,	%l3
	fand	%f6,	%f22,	%f0
	movvs	%xcc,	%i6,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l2,	%o1,	%g7
	fblg,a	%fcc3,	loop_2165
	subc	%l5,	0x18C2,	%l4
	sdivx	%o4,	0x184D,	%l1
	popc	%i1,	%l0
loop_2165:
	bvs,a	%xcc,	loop_2166
	orcc	%g5,	0x0B2A,	%o3
	swap	[%l7 + 0x54],	%g3
	mulx	%l6,	%i0,	%i3
loop_2166:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tsubcc	%g1,	0x18E0,	%i7 changed by convert2hboot
	alignaddrl	%o5,	%g2,	%o0
	for	%f20,	%f2,	%f4
	nop 	! 	tsubcctv	%i4,	0x11C1,	%o6 changed by convert2hboot
	mulscc	%g6,	%o7,	%g4
	movgu	%xcc,	%i5,	%l3
	fpsub16	%f16,	%f10,	%f8
	bneg,a,pn	%icc,	loop_2167
	edge8ln	%i2,	%o2,	%i6
	flush	%l7 + 0x2C
	fbn	%fcc3,	loop_2168
loop_2167:
	fnot1s	%f23,	%f24
	addccc	%l2,	%g7,	%o1
	bn,a	%xcc,	loop_2169
loop_2168:
	movrgz	%l4,	0x068,	%o4
	nop 	! 	tl	%icc,	0x4 changed by convert2hboot
	set	0x33, %l3
	nop	 ! 	ldsba	[%l7 + %l3] 0x18,	%l5 ASI use changed by convert2hboot
loop_2169:
	array32	%i1,	%l1,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tvc	%xcc,	0x4 changed by convert2hboot
	xor	%g5,	0x0D9F,	%g3
	set	0x40, %l2
	nop	 ! 	stda	%f16,	[%l7 + %l2] 0x17 ASI use changed by convert2hboot
	membar	#Sync
	popc	0x0630,	%l6
	nop 	! 	tgu	%icc,	0x4 changed by convert2hboot
	fcmple32	%f8,	%f26,	%i0
	nop 	! 	taddcc	%o3,	%g1,	%i3 changed by convert2hboot
	move	%xcc,	%i7,	%o5
	sdivx	%g2,	0x0F75,	%i4
	set	0x26, %o2
	nop	 ! 	stba	%o0,	[%l7 + %o2] 0x2b ASI use changed by convert2hboot
	membar	#Sync
	fornot2s	%f16,	%f24,	%f18
	edge16l	%g6,	%o6,	%g4
	edge16n	%o7,	%i5,	%l3
	umul	%i2,	%i6,	%o2
	edge16	%g7,	%o1,	%l4
	nop 	! 	te	%xcc,	0x4 changed by convert2hboot
	edge32n	%l2,	%o4,	%l5
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
	popc	%i1,	%l1
	array32	%l0,	%g5,	%l6
	nop 	! 	taddcc	%i0,	0x12B5,	%g3 changed by convert2hboot
	fandnot2	%f8,	%f8,	%f24
	fabss	%f6,	%f2
	set	0x12, %g4
	nop	 ! 	ldstuba	[%l7 + %g4] 0x19,	%g1 ASI use changed by convert2hboot
	movgu	%icc,	%i3,	%i7
	array16	%o5,	%o3,	%i4
	wr	%g0,	0x89,	%asi
	sdivcc	%g6,	0x190C,	%o6
	wr	%g0,	0x4f,	%asi
	array8	%o0,	%i5,	%l3
	and	%o7,	0x022D,	%i6
	smul	%o2,	0x1F3C,	%g7
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	movvs	%xcc,	%o1,	%l4
	sdivx	%i2,	0x0B33,	%o4
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	movge	%icc,	%l2,	%i1
	nop 	! 	tleu	%icc,	0x1 changed by convert2hboot
	edge8l	%l5,	%l1,	%l0
	andcc	%g5,	0x0776,	%i0
	sdiv	%g3,	0x1B5E,	%l6
	st	%f7,	[%l7 + 0x3C]
	edge16n	%i3,	%g1,	%o5
	fbo	%fcc2,	loop_2170
	edge32	%o3,	%i7,	%i4
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	faligndata	%f2,	%f8,	%f20
loop_2170:
	alignaddr	%g2,	%g6,	%g4
	sdivcc	%o0,	0x1E0A,	%i5
	sllx	%l3,	0x1C,	%o6
	sdiv	%i6,	0x0A53,	%o2
	sub	%o7,	%g7,	%l4
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i2
	nop	 ! 	casa	[%l6] 0x11,	%i2,	%o1 ASI use changed by convert2hboot
	sdivcc	%o4,	0x1320,	%l2
	st	%f7,	[%l7 + 0x40]
	fblg	%fcc3,	loop_2171
	fxors	%f8,	%f22,	%f29
	set	0x40, %o0
	nop	 ! 	ldda	[%l7 + %o0] 0x2c,	%l4 ASI use changed by convert2hboot
loop_2171:
	movgu	%icc,	%l1,	%i1
	xnorcc	%l0,	0x1183,	%g5
	wr	%g0,	0x04,	%asi
	sdivcc	%l6,	0x0F0F,	%g3
	xor	%g1,	%i3,	%o3
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	fandnot1	%f28,	%f0,	%f10
	movre	%i7,	0x028,	%i4
	fnor	%f30,	%f6,	%f0
	bg	loop_2172
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	srax	%o5,	%g6,	%g2
	fmovsneg	%icc,	%f14,	%f29
loop_2172:
	array16	%o0,	%g4,	%i5
	fmul8x16	%f22,	%f24,	%f12
	ldub	[%l7 + 0x67],	%l3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	addc	%o6,	0x0D40,	%g7
	alignaddrl	%l4,	%i2,	%o1
	edge8n	%o4,	%o7,	%l5
	smulcc	%l1,	0x126D,	%i1
	srlx	%l0,	0x0C,	%g5
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	edge32n	%l2,	%l6,	%i0
	wr	%g0,	0x80,	%asi
	wr	%g0,	0x80,	%asi
	fmovdpos	%icc,	%f21,	%f28
	fcmpgt16	%f28,	%f6,	%g3
	alignaddr	%i7,	%o3,	%i4
	udivx	%g6,	0x0D3F,	%g2
	ldd	[%l7 + 0x60],	%o0
	addcc	%g4,	%o5,	%l3
	movvs	%icc,	%i6,	%o2
	orncc	%i5,	%o6,	%l4
	set	0x18, %g2
	nop	 ! 	stxa	%g7,	[%g0 + %g2] 0x4f ASI use changed by convert2hboot
	movn	%icc,	%i2,	%o1
	fbge	%fcc2,	loop_2173
	fabss	%f25,	%f17
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	fone	%f16
loop_2173:
	fba,a	%fcc1,	loop_2174
	fmovrdgz	%o4,	%f26,	%f28
	udivcc	%l5,	0x18BC,	%o7
	and	%l1,	%l0,	%i1
loop_2174:
	orcc	%g5,	%l6,	%l2
	lduh	[%l7 + 0x5E],	%i0
	sllx	%g1,	0x11,	%g3
	sub	%i3,	0x050D,	%o3
	nop
	setx loop_2175, %l0, %l1
	jmpl %l1, %i4
	ldd	[%l7 + 0x38],	%i6
	orcc	%g2,	0x187D,	%g6
	nop 	! 	tg	%xcc,	0x4 changed by convert2hboot
loop_2175:
	flush	%l7 + 0x60
	bvc	%icc,	loop_2176
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
	fmovsn	%xcc,	%f4,	%f9
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
loop_2176:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%o0,	%o5
	movcc	%xcc,	%l3,	%g4
	nop 	! 	tcc	%xcc,	0x7 changed by convert2hboot
	edge16l	%i6,	%i5,	%o6
	mova	%xcc,	%o2,	%g7
	movne	%icc,	%l4,	%i2
	fmul8x16al	%f22,	%f3,	%f12
	bpos,a,pn	%icc,	loop_2177
	movrlz	%o4,	%l5,	%o1
	wr	%g0,	0x80,	%asi
loop_2177:
	fmovdn	%xcc,	%f6,	%f7
	fmovdn	%xcc,	%f2,	%f1
	bpos,a	%icc,	loop_2178
	fbo	%fcc2,	loop_2179
	udiv	%o7,	0x0EF5,	%l1
	sdiv	%i1,	0x1EA7,	%l0
loop_2178:
	fbge,a	%fcc1,	loop_2180
loop_2179:
	fbn	%fcc2,	loop_2181
	fandnot2	%f30,	%f30,	%f0
	fbn	%fcc2,	loop_2182
loop_2180:
	movn	%xcc,	%g5,	%l2
loop_2181:
	fmovdcs	%xcc,	%f12,	%f15
	movre	%l6,	%g1,	%g3
loop_2182:
	stx	%i0,	[%l7 + 0x30]
	nop 	! 	tsubcc	%i3,	0x0F45,	%i4 changed by convert2hboot
	fornot2	%f20,	%f20,	%f12
	ldub	[%l7 + 0x37],	%i7
	orcc	%g2,	%o3,	%o0
	or	%g6,	%o5,	%g4
	fpadd16	%f10,	%f14,	%f26
	stb	%l3,	[%l7 + 0x21]
	sdiv	%i6,	0x0A8F,	%o6
	fpsub16s	%f21,	%f22,	%f27
	xorcc	%o2,	%g7,	%i5
	movn	%xcc,	%i2,	%l4
	fcmple16	%f12,	%f4,	%o4
	ba,a,pt	%xcc,	loop_2183
	movcc	%xcc,	%l5,	%o7
	move	%xcc,	%o1,	%l1
	movvs	%icc,	%i1,	%g5
loop_2183:
	fmovscs	%xcc,	%f14,	%f21
	movrlz	%l2,	%l0,	%l6
	sllx	%g3,	0x08,	%i0
	smulcc	%i3,	0x16BC,	%i4
	edge16l	%g1,	%i7,	%o3
	fornot1	%f12,	%f4,	%f20
	mulscc	%g2,	%o0,	%o5
	faligndata	%f8,	%f14,	%f10
	srax	%g6,	0x00,	%g4
	movcc	%xcc,	%i6,	%l3
	set	0x68, %l0
	nop	 ! 	ldswa	[%l7 + %l0] 0x10,	%o2 ASI use changed by convert2hboot
	edge32ln	%g7,	%i5,	%o6
	movleu	%xcc,	%l4,	%i2
	movvs	%icc,	%o4,	%l5
	nop
	set	0x20, %o6
	std	%f6,	[%l7 + %o6]
	andncc	%o1,	%l1,	%o7
	fmovdg	%xcc,	%f4,	%f4
	fmovde	%xcc,	%f19,	%f28
	wr	%g0,	0x80,	%asi
	sta	%f12,	[%l7 + 0x58] %asi
	add	%l7,	0x28,	%l6
	wr	%g0,	0x11,	%asi
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
	bcs,pn	%icc,	loop_2184
	addcc	%l0,	%g5,	%g3
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	fbu,a	%fcc0,	loop_2185
loop_2184:
	fpsub16	%f28,	%f24,	%f24
	bg,a	loop_2186
	xnorcc	%l6,	%i0,	%i4
loop_2185:
	xnorcc	%i3,	0x1D0E,	%i7
	fmovscc	%icc,	%f22,	%f25
loop_2186:
	alignaddrl	%g1,	%o3,	%g2
	lduw	[%l7 + 0x34],	%o5
	stx	%o0,	[%l7 + 0x08]
	orn	%g4,	%i6,	%l3
	fandnot1	%f14,	%f10,	%f10
	ldsb	[%l7 + 0x56],	%g6
	bge,pt	%icc,	loop_2187
	fone	%f10
	nop 	! 	tle	%xcc,	0x2 changed by convert2hboot
	nop
	setx	loop_2188,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_2187:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o2,	0x1FED,	%g7
	movrgez	%i5,	%o6,	%i2
loop_2188:
	edge8	%o4,	%l5,	%l4
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	edge16	%o1,	%o7,	%i1
	srax	%l2,	0x1F,	%l1
	movrlez	%g5,	0x1CE,	%g3
	nop 	! 	taddcc	%l6,	0x0A29,	%i0 changed by convert2hboot
	addcc	%l0,	%i3,	%i4
	set	0x30, %l6
	nop	 ! 	ldstuba	[%l7 + %l6] 0x81,	%g1 ASI use changed by convert2hboot
	bcs,a	loop_2189
	xor	%i7,	0x01ED,	%g2
	set	0x220, %l4
	nop	 ! 	stxa	%o3,	[%g0 + %l4] 0x52 ASI use changed by convert2hboot
loop_2189:
	xor	%o5,	0x1100,	%g4
	umulcc	%i6,	%o0,	%g6
	ldd	[%l7 + 0x18],	%o2
	fnot2	%f10,	%f18
	st	%f14,	[%l7 + 0x4C]
	fmovdneg	%xcc,	%f15,	%f15
	sethi	0x1267,	%g7
	std	%l2,	[%l7 + 0x18]
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	movrlz	%o6,	0x31A,	%i5
	movge	%xcc,	%o4,	%i2
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	nop 	! 	te	%xcc,	0x7 changed by convert2hboot
	sub	%l4,	0x0985,	%o1
	wr	%g0,	0x20,	%asi
	fabsd	%f28,	%f8
	std	%i0,	[%l7 + 0x28]
	smul	%l2,	%l1,	%o7
	movl	%icc,	%g5,	%l6
	bcs,pt	%xcc,	loop_2190
	fxors	%f23,	%f15,	%f13
	movleu	%xcc,	%i0,	%l0
	fmovdge	%icc,	%f20,	%f19
loop_2190:
	srlx	%i3,	0x09,	%g3
	movrlz	%g1,	%i7,	%i4
	edge16ln	%g2,	%o3,	%g4
	sllx	%o5,	0x1F,	%i6
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	bg,pt	%xcc,	loop_2191
	movn	%icc,	%g6,	%o2
	sethi	0x1158,	%o0
	fpackfix	%f6,	%f21
loop_2191:
	bge,a,pn	%icc,	loop_2192
	fcmple16	%f6,	%f14,	%g7
	addccc	%l3,	%o6,	%o4
	andcc	%i2,	%l4,	%i5
loop_2192:
	movn	%icc,	%l5,	%o1
	movrgez	%i1,	%l2,	%l1
	subcc	%o7,	0x1D18,	%l6
	xor	%i0,	%g5,	%i3
	fxnors	%f11,	%f29,	%f6
	movle	%icc,	%g3,	%l0
	addccc	%i7,	%g1,	%g2
	sdivx	%o3,	0x0364,	%g4
	fcmpgt32	%f20,	%f8,	%o5
	movcs	%xcc,	%i6,	%g6
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	fnot2	%f28,	%f12
	bvs	loop_2193
	fnegd	%f20,	%f24
	sdivx	%o2,	0x0C92,	%o0
	brlez	%g7,	loop_2194
loop_2193:
	ba,a,pt	%xcc,	loop_2195
	umul	%i4,	0x10B5,	%o6
	movcs	%xcc,	%o4,	%i2
loop_2194:
	fmovscc	%xcc,	%f1,	%f12
loop_2195:
	fmovda	%icc,	%f13,	%f31
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	sdiv	%l3,	0x1D8F,	%l4
	sub	%i5,	%l5,	%o1
	fcmpes	%fcc3,	%f13,	%f29
	srl	%i1,	0x1C,	%l1
	nop 	! 	sir	0x1744 changed by convert2hboot
	sra	%o7,	%l6,	%l2
	brgez	%g5,	loop_2196
	movcc	%icc,	%i3,	%g3
	xor	%l0,	0x0FB5,	%i0
	mulx	%g1,	0x1BF3,	%g2
loop_2196:
	edge8l	%i7,	%g4,	%o5
	edge32	%o3,	%i6,	%g6
	sllx	%o2,	0x18,	%g7
	umul	%i4,	%o0,	%o4
	bpos,a,pn	%xcc,	loop_2197
	fpack16	%f8,	%f2
	subc	%o6,	%i2,	%l4
	nop 	! 	taddcc	%l3,	0x01F6,	%i5 changed by convert2hboot
loop_2197:
	nop 	! 	tsubcctv	%o1,	0x0C31,	%l5 changed by convert2hboot
	movg	%xcc,	%i1,	%o7
	wr	%g0,	0x80,	%asi
	sub	%l2,	0x120D,	%g5
	fbge	%fcc2,	loop_2198
	std	%f12,	[%l7 + 0x48]
	membar	0x1A
	set	0x5C, %i4
	nop	 ! 	lduwa	[%l7 + %i4] 0x18,	%l1 ASI use changed by convert2hboot
loop_2198:
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	set	0x5C, %i3
	nop	 ! 	ldswa	[%l7 + %i3] 0x19,	%i3 ASI use changed by convert2hboot
	brgz,a	%g3,	loop_2199
	fsrc1s	%f3,	%f14
	set	0x44, %i0
	nop	 ! 	swapa	[%l7 + %i0] 0x80,	%l0 ASI use changed by convert2hboot
loop_2199:
	fpadd16s	%f13,	%f9,	%f13
	set	0x32, %i7
	nop	 ! 	stba	%g1,	[%l7 + %i7] 0x18 ASI use changed by convert2hboot
	movgu	%icc,	%i0,	%i7
	nop
	set	0x62, %i2
	ldsh	[%l7 + %i2],	%g4
	edge8l	%o5,	%o3,	%g2
	mulscc	%i6,	0x1121,	%o2
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	fbg	%fcc0,	loop_2200
	fmovsa	%xcc,	%f7,	%f16
	fcmple16	%f30,	%f28,	%g7
	edge8n	%i4,	%g6,	%o0
loop_2200:
	subcc	%o6,	0x0C08,	%i2
	bcc,pt	%icc,	loop_2201
	sth	%o4,	[%l7 + 0x26]
	nop 	! 	tsubcc	%l4,	0x03A4,	%l3 changed by convert2hboot
	fblg,a	%fcc1,	loop_2202
loop_2201:
	edge16	%i5,	%o1,	%l5
	orcc	%i1,	0x1A1A,	%l6
	fmovdpos	%xcc,	%f28,	%f6
loop_2202:
	sllx	%l2,	0x09,	%o7
	fpack16	%f22,	%f25
	fcmpne32	%f12,	%f22,	%g5
	movrlez	%i3,	%l1,	%g3
	fcmpgt32	%f12,	%f12,	%g1
	ldsw	[%l7 + 0x78],	%l0
	sub	%i0,	%g4,	%o5
	edge32n	%o3,	%g2,	%i6
	fmovda	%icc,	%f7,	%f11
	fmovdcc	%xcc,	%f5,	%f1
	udivx	%o2,	0x0AEE,	%i7
	xnorcc	%i4,	0x1957,	%g7
	fsrc2s	%f9,	%f25
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	movrne	%o0,	%g6,	%i2
	edge8l	%o4,	%l4,	%o6
	fpack32	%f22,	%f28,	%f28
	addcc	%i5,	%l3,	%o1
	edge8ln	%l5,	%i1,	%l6
	udiv	%l2,	0x0DB7,	%g5
	fnot1s	%f11,	%f0
	wr	%g0,	0x89,	%asi
	bg,a	%xcc,	loop_2203
	fbne	%fcc3,	loop_2204
	bvs,a,pn	%xcc,	loop_2205
	st	%f5,	[%l7 + 0x40]
loop_2203:
	swap	[%l7 + 0x60],	%o7
loop_2204:
	subccc	%g3,	%g1,	%l0
loop_2205:
	edge8	%i0,	%l1,	%o5
	movl	%icc,	%o3,	%g2
	xnor	%i6,	0x0FBF,	%g4
	movgu	%icc,	%i7,	%i4
	fandnot2	%f8,	%f6,	%f8
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	subccc	%o2,	%o0,	%g6
	movcc	%xcc,	%g7,	%i2
	fbne	%fcc1,	loop_2206
	edge8l	%l4,	%o4,	%i5
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
	fbue	%fcc1,	loop_2207
loop_2206:
	fcmped	%fcc0,	%f16,	%f4
	edge16n	%l3,	%o6,	%l5
	srlx	%o1,	0x00,	%i1
loop_2207:
	nop 	! 	tvc	%xcc,	0x4 changed by convert2hboot
	edge8l	%l6,	%g5,	%i3
	faligndata	%f26,	%f20,	%f28
	movpos	%xcc,	%o7,	%l2
	nop 	! 	sir	0x0EFE changed by convert2hboot
	bg,a,pt	%icc,	loop_2208
	ldsw	[%l7 + 0x70],	%g1
	edge16ln	%l0,	%i0,	%l1
	subcc	%o5,	%g3,	%g2
loop_2208:
	addcc	%o3,	0x05CF,	%i6
	brlz	%i7,	loop_2209
	bpos	loop_2210
	sdivx	%g4,	0x182E,	%i4
	movvc	%xcc,	%o0,	%g6
loop_2209:
	addccc	%o2,	0x03B0,	%i2
loop_2210:
	ldx	[%l7 + 0x48],	%g7
	sll	%l4,	0x0F,	%i5
	nop 	! 	tle	%xcc,	0x2 changed by convert2hboot
	fbue	%fcc1,	loop_2211
	mulscc	%l3,	0x11A8,	%o6
	wr	%g0,	0x88,	%asi
loop_2211:
	movleu	%icc,	%l5,	%o1
	movvs	%icc,	%o4,	%l6
	sllx	%g5,	0x19,	%i3
	bge,a,pt	%icc,	loop_2212
	xnorcc	%i1,	%o7,	%l2
	fmovsle	%xcc,	%f27,	%f10
	movvc	%icc,	%l0,	%g1
loop_2212:
	fbue	%fcc3,	loop_2213
	fmovsneg	%xcc,	%f4,	%f15
	fmovdgu	%icc,	%f13,	%f19
	membar	0x31
loop_2213:
	edge32l	%i0,	%o5,	%l1
	fabsd	%f0,	%f26
	bn,a	loop_2214
	fbue	%fcc2,	loop_2215
	movvc	%icc,	%g2,	%o3
	sdiv	%g3,	0x086E,	%i6
loop_2214:
	fmovrsgz	%g4,	%f10,	%f17
loop_2215:
	sdivcc	%i7,	0x0E34,	%o0
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	edge32n	%g6,	%i4,	%o2
	fmovde	%icc,	%f0,	%f17
	fmovrdgz	%i2,	%f30,	%f6
	andcc	%l4,	0x1FFF,	%i5
	udivcc	%l3,	0x002D,	%g7
	nop
	setx	loop_2216,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	bgu,pt	%icc,	loop_2217
	bl	%xcc,	loop_2218
	fmovsa	%xcc,	%f29,	%f26
loop_2216:
	nop 	! 	tpos	%icc,	0x6 changed by convert2hboot
loop_2217:
	bl,a	loop_2219
loop_2218:
	nop
	setx	loop_2220,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fmovdleu	%xcc,	%f8,	%f20
	wr	%g0,	0x89,	%asi
loop_2219:
	nop
	setx	loop_2221,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_2220:
	edge32ln	%o6,	%o1,	%o4
	fbuge,a	%fcc0,	loop_2222
	srl	%l6,	%i3,	%g5
loop_2221:
	edge8ln	%i1,	%o7,	%l2
	set	0x61, %l1
	nop	 ! 	lduba	[%l7 + %l1] 0x18,	%l0 ASI use changed by convert2hboot
loop_2222:
	fbge	%fcc1,	loop_2223
	call	loop_2224
	flush	%l7 + 0x10
	movleu	%icc,	%g1,	%o5
loop_2223:
	bvs,pt	%xcc,	loop_2225
loop_2224:
	bcs,a	%icc,	loop_2226
	or	%l1,	0x1B9A,	%g2
	addcc	%o3,	%i0,	%g3
loop_2225:
	subcc	%i6,	%i7,	%o0
loop_2226:
	addc	%g4,	%i4,	%g6
	edge16n	%o2,	%l4,	%i2
	movleu	%xcc,	%l3,	%i5
	bn,pn	%icc,	loop_2227
	smulcc	%g7,	0x00B0,	%o6
	udivx	%l5,	0x03CD,	%o1
	ldsw	[%l7 + 0x78],	%o4
loop_2227:
	edge32l	%l6,	%g5,	%i1
	bg,a	loop_2228
	udivcc	%i3,	0x1A4A,	%l2
	edge32n	%l0,	%o7,	%o5
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
loop_2228:
	nop
	setx	loop_2229,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	or	%l1,	%g2,	%o3
	std	%i0,	[%l7 + 0x60]
loop_2229:
	bvc,pn	%xcc,	loop_2230
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	movpos	%icc,	%g3,	%g1
	brlez,a	%i7,	loop_2231
loop_2230:
	addccc	%o0,	0x1440,	%i6
	fbne,a	%fcc2,	loop_2232
	udivx	%i4,	0x122B,	%g6
loop_2231:
	addcc	%o2,	0x0AA4,	%g4
	movrne	%l4,	0x330,	%l3
loop_2232:
	nop
	wr	%g0,	0xe2,	%asi
	membar	#Sync
	ldsb	[%l7 + 0x73],	%g7
	movrlz	%i5,	0x2E0,	%o6
	prefetch	[%l7 + 0x38],	 0x0
	umulcc	%l5,	%o4,	%o1
	brlez,a	%g5,	loop_2233
	fmovsl	%icc,	%f13,	%f6
	bpos	loop_2234
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
loop_2233:
	fsrc2	%f12,	%f4
	membar	0x58
loop_2234:
	bge	%icc,	loop_2235
	ld	[%l7 + 0x7C],	%f11
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	udivx	%l6,	0x07DD,	%i1
loop_2235:
	nop
	set	0x10, %o3
	nop	 ! 	ldda	[%l7 + %o3] 0x04,	%l2 ASI use changed by convert2hboot
	fmovdcs	%xcc,	%f31,	%f2
	wr	%g0,	0x80,	%asi
	fbe,a	%fcc2,	loop_2236
	and	%o7,	%i3,	%o5
	fmovrdne	%l1,	%f10,	%f4
	nop 	! 	taddcctv	%g2,	0x17C3,	%i0 changed by convert2hboot
loop_2236:
	movrlz	%g3,	0x28A,	%o3
	srlx	%i7,	0x0F,	%o0
	addc	%i6,	0x0820,	%i4
	add	%g6,	%g1,	%g4
	nop 	! 	tsubcc	%o2,	%l4,	%l3 changed by convert2hboot
	fmovrde	%g7,	%f24,	%f12
	movvs	%xcc,	%i2,	%i5
	bgu	%icc,	loop_2237
	fcmpd	%fcc1,	%f8,	%f30
	movrne	%o6,	0x278,	%l5
	edge8ln	%o4,	%o1,	%g5
loop_2237:
	nop 	! 	sir	0x0060 changed by convert2hboot
	fmovdl	%xcc,	%f4,	%f31
	fbuge,a	%fcc3,	loop_2238
	sethi	0x0BB8,	%l6
	call	loop_2239
	stx	%i1,	[%l7 + 0x48]
loop_2238:
	sethi	0x0BD4,	%l2
	xorcc	%l0,	%o7,	%o5
loop_2239:
	fpackfix	%f24,	%f26
	edge8n	%i3,	%l1,	%g2
	movle	%xcc,	%g3,	%o3
	fbge	%fcc3,	loop_2240
	fpadd16s	%f6,	%f6,	%f23
	fxnor	%f30,	%f28,	%f20
	nop 	! 	tvs	%xcc,	0x3 changed by convert2hboot
loop_2240:
	nop 	! 	tsubcctv	%i0,	%o0,	%i7 changed by convert2hboot
	sethi	0x1BE2,	%i6
	udiv	%i4,	0x168B,	%g6
	ldstub	[%l7 + 0x56],	%g4
	nop
	setx	loop_2241,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fmovdvs	%xcc,	%f26,	%f0
	mova	%xcc,	%g1,	%o2
	subc	%l4,	%l3,	%i2
loop_2241:
	fmovrsgez	%i5,	%f4,	%f17
	be,a,pn	%icc,	loop_2242
	movle	%xcc,	%g7,	%l5
	fmovsneg	%xcc,	%f21,	%f6
	fble	%fcc2,	loop_2243
loop_2242:
	fmovsvc	%icc,	%f2,	%f30
	subccc	%o4,	%o1,	%g5
	bvs	%xcc,	loop_2244
loop_2243:
	fbul	%fcc1,	loop_2245
	fbn	%fcc2,	loop_2246
	and	%o6,	0x1EBA,	%i1
loop_2244:
	edge8n	%l6,	%l0,	%o7
loop_2245:
	nop
	set	0x62, %g3
	nop	 ! 	ldsha	[%l7 + %g3] 0x81,	%o5 ASI use changed by convert2hboot
loop_2246:
	bn	loop_2247
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	brnz	%l2,	loop_2248
	nop
	set	0x76, %i6
	ldub	[%l7 + %i6],	%l1
loop_2247:
	movg	%xcc,	%i3,	%g3
	mulx	%g2,	0x0722,	%o3
loop_2248:
	fzeros	%f20
	brlz	%o0,	loop_2249
	nop
	setx	loop_2250,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	udiv	%i7,	0x0D73,	%i0
	nop 	! 	tvs	%xcc,	0x6 changed by convert2hboot
loop_2249:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
loop_2250:
	movneg	%icc,	%i6,	%g4
	fmovrdlz	%g1,	%f26,	%f28
	set	0x60, %i5
	nop	 ! 	ldda	[%l7 + %i5] 0x88,	%o2 ASI use changed by convert2hboot
	fmovrse	%l4,	%f16,	%f7
	bleu,a,pn	%icc,	loop_2251
	ldx	[%l7 + 0x20],	%l3
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
loop_2251:
	movrlez	%i2,	%i5,	%l5
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	swap	[%l7 + 0x08],	%o4
	fba,a	%fcc1,	loop_2252
	orncc	%g7,	0x07AB,	%g5
	edge32	%o6,	%o1,	%i1
	edge8ln	%l6,	%o7,	%o5
loop_2252:
	fpadd16	%f4,	%f20,	%f8
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	sllx	%l0,	%l1,	%l2
	edge32ln	%g3,	%g2,	%i3
	andn	%o0,	%o3,	%i7
	movpos	%icc,	%i4,	%i0
	movleu	%xcc,	%g6,	%i6
	fmovrdlez	%g1,	%f30,	%f28
	fornot2	%f26,	%f8,	%f18
	fnot1s	%f8,	%f12
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	nop 	! 	tn	%icc,	0x5 changed by convert2hboot
	membar	0x2A
	smul	%g4,	%o2,	%l3
	xnorcc	%l4,	%i5,	%l5
	lduw	[%l7 + 0x68],	%o4
	xnorcc	%i2,	%g7,	%g5
	movrgz	%o6,	0x09D,	%o1
	fble	%fcc0,	loop_2253
	sdivcc	%l6,	0x1708,	%o7
	fxnors	%f19,	%f17,	%f29
	andn	%i1,	0x0C02,	%l0
loop_2253:
	nop
	wr	%g0,	0x0c,	%asi
	fmovrsne	%o5,	%f15,	%f25
	fcmpes	%fcc2,	%f20,	%f16
	xnor	%g3,	0x14C8,	%l2
	movrne	%g2,	0x25A,	%i3
	wr	%g0,	0x80,	%asi
	movrne	%i7,	%i4,	%o0
	fcmped	%fcc1,	%f6,	%f24
	movpos	%icc,	%i0,	%g6
	set	0x44, %g6
	nop	 ! 	swapa	[%l7 + %g6] 0x18,	%g1 ASI use changed by convert2hboot
	movrne	%g4,	0x245,	%i6
	fpsub16	%f28,	%f30,	%f30
	edge32l	%o2,	%l3,	%l4
	edge16	%l5,	%i5,	%i2
	set	0x08, %o7
	nop	 ! 	ldxa	[%l7 + %o7] 0x14,	%g7 ASI use changed by convert2hboot
	edge16l	%o4,	%o6,	%g5
	fbo	%fcc0,	loop_2254
	move	%icc,	%l6,	%o7
	nop 	! 	taddcc	%i1,	0x15A5,	%l0 changed by convert2hboot
	fmovdcs	%icc,	%f17,	%f1
loop_2254:
	mulscc	%l1,	0x15B5,	%o1
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	edge32l	%o5,	%g3,	%g2
	umulcc	%l2,	%i3,	%o3
	fsrc1s	%f10,	%f2
	set	0x5C, %l5
	nop	 ! 	lduwa	[%l7 + %l5] 0x15,	%i7 ASI use changed by convert2hboot
	xnor	%i4,	%i0,	%g6
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	udivx	%o0,	0x1006,	%g4
	nop 	! 	tleu	%icc,	0x6 changed by convert2hboot
	fmovse	%xcc,	%f0,	%f5
	fmovrsgz	%i6,	%f4,	%f16
	fmovsl	%xcc,	%f4,	%f23
	set	0x21, %i1
	nop	 ! 	ldsba	[%l7 + %i1] 0x89,	%g1 ASI use changed by convert2hboot
	mulscc	%l3,	%o2,	%l5
	edge8n	%i5,	%l4,	%i2
	movrlez	%o4,	%g7,	%o6
	wr	%g0,	0x89,	%asi
	movne	%icc,	%o7,	%i1
	orcc	%g5,	%l1,	%l0
	wr	%g0,	0x19,	%asi
	fmovdn	%xcc,	%f26,	%f20
	alignaddr	%o1,	%g3,	%l2
	mova	%icc,	%g2,	%o3
	bg,a	%xcc,	loop_2255
	array32	%i3,	%i4,	%i7
	andcc	%g6,	%i0,	%o0
	fcmpd	%fcc3,	%f30,	%f16
loop_2255:
	nop
	wr	%g0,	0x80,	%asi
	fmovda	%xcc,	%f9,	%f19
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	bg,a	loop_2256
	edge8n	%g1,	%i6,	%o2
	st	%f2,	[%l7 + 0x24]
	fbe,a	%fcc2,	loop_2257
loop_2256:
	subc	%l5,	0x0304,	%i5
	fmovsneg	%icc,	%f0,	%f31
	movne	%icc,	%l4,	%l3
loop_2257:
	movn	%icc,	%o4,	%i2
	bne,pn	%xcc,	loop_2258
	sth	%o6,	[%l7 + 0x18]
	bneg,a	loop_2259
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
loop_2258:
	movrlz	%l6,	%g7,	%o7
	fcmpd	%fcc1,	%f6,	%f16
loop_2259:
	umul	%g5,	%i1,	%l1
	edge8n	%l0,	%o5,	%o1
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
	srl	%g3,	%g2,	%o3
	and	%i3,	%i4,	%i7
	edge16	%l2,	%i0,	%g6
	udiv	%g4,	0x1D97,	%g1
	brgz	%i6,	loop_2260
	nop 	! 	tpos	%xcc,	0x6 changed by convert2hboot
	srax	%o0,	%o2,	%i5
	set	0x30, %o5
	nop	 ! 	stda	%l4,	[%l7 + %o5] 0x81 ASI use changed by convert2hboot
loop_2260:
	sll	%l4,	%l3,	%i2
	lduw	[%l7 + 0x50],	%o6
	set	0x28, %g1
	nop	 ! 	prefetcha	[%l7 + %g1] 0x10,	 0x1 ASI use changed by convert2hboot
	nop
	setx	loop_2261,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	smulcc	%l6,	0x1BA1,	%o7
	fbge,a	%fcc1,	loop_2262
	movvs	%icc,	%g7,	%g5
loop_2261:
	array16	%i1,	%l1,	%o5
	nop 	! 	tsubcctv	%l0,	0x1F2C,	%o1 changed by convert2hboot
loop_2262:
	fmovdge	%icc,	%f17,	%f28
	orcc	%g3,	0x0421,	%g2
	set	0x40, %o1
	nop	 ! 	stda	%i2,	[%l7 + %o1] 0x11 ASI use changed by convert2hboot
	fmovd	%f12,	%f24
	fmuld8sux16	%f21,	%f18,	%f26
	addccc	%o3,	0x09C1,	%i4
	or	%l2,	%i0,	%g6
	fmul8x16au	%f29,	%f24,	%f26
	edge32n	%i7,	%g4,	%g1
	mulscc	%i6,	%o0,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%l5,	%o2
	udiv	%l4,	0x06BE,	%i2
	sethi	0x1284,	%l3
	edge32l	%o6,	%o4,	%l6
	subc	%o7,	0x165B,	%g7
	fba	%fcc0,	loop_2263
	ldsw	[%l7 + 0x0C],	%g5
	srax	%l1,	%o5,	%l0
	fbule,a	%fcc2,	loop_2264
loop_2263:
	array16	%o1,	%g3,	%i1
	movrne	%g2,	%i3,	%o3
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
loop_2264:
	bvc	loop_2265
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
	fmovscc	%xcc,	%f21,	%f15
	wr	%g0,	0x80,	%asi
loop_2265:
	movvc	%icc,	%i4,	%g6
	flush	%l7 + 0x7C
	fnot1s	%f1,	%f9
	ldd	[%l7 + 0x28],	%f26
	alignaddrl	%i7,	%i0,	%g1
	nop 	! 	tle	%xcc,	0x5 changed by convert2hboot
	movcc	%xcc,	%i6,	%g4
	edge32	%i5,	%o0,	%o2
	bvs,pt	%icc,	loop_2266
	sll	%l5,	%l4,	%i2
	movcs	%xcc,	%o6,	%l3
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
loop_2266:
	std	%o4,	[%l7 + 0x08]
	umul	%l6,	%o7,	%g5
	set	0x60, %o4
	nop	 ! 	lduwa	[%l7 + %o4] 0x80,	%l1 ASI use changed by convert2hboot
	movrlz	%o5,	%g7,	%o1
	fandnot2s	%f3,	%f26,	%f9
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x1C] %asi,	%f11
	add	%g3,	0x096C,	%l0
	movleu	%xcc,	%g2,	%i3
	ble	loop_2267
	fnot1	%f16,	%f12
	xnorcc	%o3,	%i1,	%i4
	movgu	%icc,	%l2,	%i7
loop_2267:
	orncc	%g6,	%i0,	%g1
	xnor	%i6,	0x147B,	%g4
	mova	%icc,	%o0,	%i5
	subcc	%l5,	%o2,	%l4
	alignaddr	%i2,	%o6,	%o4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	nop	 ! 	casxa	[%l6] 0x81,	%l6,	%o7 ASI use changed by convert2hboot
	xorcc	%g5,	0x14E9,	%l1
	addccc	%o5,	%l3,	%g7
	fornot1s	%f5,	%f19,	%f8
	fbu,a	%fcc1,	loop_2268
	udiv	%g3,	0x1092,	%o1
	movge	%icc,	%g2,	%i3
	fcmpgt32	%f22,	%f26,	%o3
loop_2268:
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
	srlx	%l0,	%i1,	%i4
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	xnorcc	%i7,	%g6,	%l2
	fbe	%fcc2,	loop_2269
	brgz,a	%i0,	loop_2270
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%f6
	array8	%i6,	%g1,	%g4
loop_2269:
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
loop_2270:
	addccc	%i5,	0x1510,	%l5
	fpsub32	%f26,	%f14,	%f2
	movrne	%o0,	0x1D7,	%o2
	fmovdgu	%icc,	%f29,	%f24
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i2
	ldstub	[%l7 + 0x31],	%o4
	xnor	%o6,	%l6,	%o7
	movcs	%icc,	%l1,	%o5
	srl	%g5,	0x18,	%l3
	addc	%g3,	%g7,	%g2
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	orncc	%o1,	0x1AE2,	%i3
	fmovrsgz	%o3,	%f20,	%f6
	andcc	%l0,	%i4,	%i7
	bl	loop_2271
	movvs	%icc,	%i1,	%g6
	bcc,a	%xcc,	loop_2272
	bg,pn	%icc,	loop_2273
loop_2271:
	std	%f14,	[%l7 + 0x38]
	bl,a,pt	%xcc,	loop_2274
loop_2272:
	movcc	%icc,	%i0,	%i6
loop_2273:
	nop 	! 	tcc	%xcc,	0x0 changed by convert2hboot
	fabsd	%f14,	%f16
loop_2274:
	orcc	%g1,	0x0E9F,	%l2
	addcc	%i5,	0x04D5,	%l5
	nop 	! 	tcs	%xcc,	0x5 changed by convert2hboot
	orncc	%g4,	0x0F9A,	%o2
	fcmps	%fcc0,	%f7,	%f31
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	movvc	%xcc,	%i2,	%o0
	set	0x18, %g7
	nop	 ! 	ldsha	[%l7 + %g7] 0x80,	%l4 ASI use changed by convert2hboot
	ba,pt	%icc,	loop_2275
	fzero	%f4
	movn	%icc,	%o4,	%o6
	ldsh	[%l7 + 0x34],	%o7
loop_2275:
	fbuge,a	%fcc2,	loop_2276
	orcc	%l1,	0x123F,	%o5
	addccc	%g5,	%l6,	%l3
	movleu	%icc,	%g7,	%g2
loop_2276:
	membar	0x57
	andncc	%g3,	%i3,	%o3
	subccc	%o1,	0x0A00,	%l0
	ldsh	[%l7 + 0x70],	%i7
	edge16n	%i4,	%g6,	%i0
	movg	%icc,	%i6,	%i1
	fba	%fcc0,	loop_2277
	fmovdcs	%xcc,	%f0,	%f22
	movrlez	%g1,	0x391,	%i5
	wr	%g0,	0x04,	%asi
loop_2277:
	movrgz	%g4,	0x3AD,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f30,	[%l7 + 0x78]
	alignaddr	%o2,	%o0,	%l4
	fmovsle	%icc,	%f11,	%f31
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	edge16ln	%i2,	%o6,	%o7
	membar	0x26
	fcmpgt16	%f6,	%f16,	%l1
	bg,a,pn	%xcc,	loop_2278
	edge32ln	%o4,	%o5,	%l6
	and	%l3,	%g7,	%g5
	alignaddr	%g2,	%g3,	%i3
loop_2278:
	brgez	%o1,	loop_2279
	edge8n	%l0,	%i7,	%o3
	fbo	%fcc3,	loop_2280
	nop 	! 	tsubcctv	%i4,	0x0499,	%g6 changed by convert2hboot
loop_2279:
	addcc	%i6,	0x0151,	%i0
	smul	%i1,	%i5,	%l5
loop_2280:
	fbule,a	%fcc3,	loop_2281
	movleu	%icc,	%g1,	%g4
	xorcc	%o2,	%o0,	%l4
	fones	%f15
loop_2281:
	nop
	wr	%g0,	0x18,	%asi
	ldub	[%l7 + 0x5A],	%i2
	fbg	%fcc2,	loop_2282
	nop
	setx	loop_2283,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fandnot1	%f14,	%f12,	%f24
	edge8n	%o6,	%l1,	%o7
loop_2282:
	movrgez	%o4,	0x2FB,	%o5
loop_2283:
	fxors	%f10,	%f30,	%f22
	xnorcc	%l6,	0x009C,	%l3
	nop 	! 	sir	0x0846 changed by convert2hboot
	call	loop_2284
	edge32	%g7,	%g2,	%g5
	smul	%i3,	%o1,	%l0
	subccc	%g3,	%i7,	%o3
loop_2284:
	fabsd	%f20,	%f12
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	andn	%g6,	0x0955,	%i4
	udivcc	%i0,	0x1495,	%i6
	fbl,a	%fcc2,	loop_2285
	nop
	setx	loop_2286,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	and	%i1,	%l5,	%g1
	edge8	%i5,	%o2,	%g4
loop_2285:
	brz	%l4,	loop_2287
loop_2286:
	andn	%l2,	0x0FE5,	%o0
	edge32ln	%i2,	%l1,	%o7
	edge32l	%o4,	%o5,	%l6
loop_2287:
	fmovrsne	%l3,	%f8,	%f27
	edge16	%g7,	%o6,	%g5
	fbo	%fcc1,	loop_2288
	fmovda	%icc,	%f6,	%f26
	fmovdcs	%icc,	%f9,	%f30
	sdiv	%g2,	0x03E2,	%o1
loop_2288:
	edge8ln	%l0,	%i3,	%g3
	movgu	%xcc,	%o3,	%i7
	fbuge	%fcc0,	loop_2289
	fnot1	%f28,	%f26
	nop 	! 	tsubcctv	%i4,	0x03E5,	%i0 changed by convert2hboot
	set	0x10, %l2
	nop	 ! 	prefetcha	[%l7 + %l2] 0x15,	 0x3 ASI use changed by convert2hboot
loop_2289:
	fmovsge	%xcc,	%f29,	%f1
	fnegs	%f12,	%f24
	set	0x28, %o2
	lda	[%l7 + %o2] 0x04,	%f13
	smul	%i6,	%i1,	%g1
	edge16	%l5,	%o2,	%i5
	set	0x30, %l3
	nop	 ! 	stda	%l4,	[%l7 + %l3] 0xeb ASI use changed by convert2hboot
	membar	#Sync
	movvc	%xcc,	%l2,	%o0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g4
	nop	 ! 	casa	[%l6] 0x11,	%g4,	%l1 ASI use changed by convert2hboot
	set	0x6C, %g4
	nop	 ! 	stwa	%o7,	[%l7 + %g4] 0x81 ASI use changed by convert2hboot
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	fbule	%fcc0,	loop_2290
	brlez	%i2,	loop_2291
	orn	%o4,	%o5,	%l6
	movne	%xcc,	%g7,	%l3
loop_2290:
	brnz	%g5,	loop_2292
loop_2291:
	movne	%icc,	%g2,	%o6
	udivcc	%o1,	0x1ECB,	%l0
	swap	[%l7 + 0x08],	%i3
loop_2292:
	umul	%g3,	%i7,	%o3
	fmovrslez	%i4,	%f6,	%f28
	bn,a,pn	%icc,	loop_2293
	movre	%g6,	0x383,	%i0
	movvs	%icc,	%i1,	%g1
	movleu	%icc,	%i6,	%l5
loop_2293:
	std	%f6,	[%l7 + 0x50]
	add	%i5,	0x013E,	%l4
	movcc	%icc,	%o2,	%o0
	movge	%xcc,	%g4,	%l1
	fmul8x16au	%f23,	%f27,	%f24
	edge8ln	%l2,	%o7,	%o4
	edge16ln	%o5,	%l6,	%g7
	sub	%i2,	%g5,	%g2
	nop
	set	0x64, %g2
	prefetch	[%l7 + %g2],	 0x3
	set	0x30, %l0
	nop	 ! 	ldxa	[%g0 + %l0] 0x50,	%l3 ASI use changed by convert2hboot
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	edge8	%o1,	%o6,	%i3
	srl	%l0,	%i7,	%o3
	fmuld8sux16	%f21,	%f4,	%f24
	addccc	%g3,	0x023E,	%i4
	fbug	%fcc3,	loop_2294
	nop 	! 	taddcctv	%g6,	0x0A28,	%i0 changed by convert2hboot
	nop 	! 	sir	0x1525 changed by convert2hboot
	movcs	%icc,	%g1,	%i6
loop_2294:
	fmovs	%f21,	%f31
	srax	%i1,	%i5,	%l5
	fbg,a	%fcc2,	loop_2295
	udivcc	%o2,	0x12CB,	%o0
	movrne	%g4,	%l1,	%l4
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
loop_2295:
	ldsh	[%l7 + 0x30],	%o7
	nop 	! 	tsubcc	%l2,	%o4,	%o5 changed by convert2hboot
	nop 	! 	taddcc	%l6,	%i2,	%g7 changed by convert2hboot
	sllx	%g2,	%g5,	%l3
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	xor	%o1,	%o6,	%l0
	movrlz	%i7,	%i3,	%o3
	fbl	%fcc1,	loop_2296
	fblg,a	%fcc0,	loop_2297
	array8	%i4,	%g3,	%i0
	ld	[%l7 + 0x44],	%f21
loop_2296:
	fbug	%fcc3,	loop_2298
loop_2297:
	nop 	! 	taddcc	%g6,	0x0828,	%i6 changed by convert2hboot
	addcc	%g1,	0x1400,	%i5
	lduh	[%l7 + 0x6E],	%l5
loop_2298:
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	movvs	%xcc,	%o2,	%o0
	umulcc	%g4,	%i1,	%l4
	fabsd	%f8,	%f12
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	add	%o7,	%l2,	%l1
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	movle	%xcc,	%o4,	%l6
	ldsw	[%l7 + 0x7C],	%o5
	subc	%i2,	0x050A,	%g7
	fcmpeq16	%f16,	%f28,	%g2
	popc	0x161C,	%l3
	edge32l	%o1,	%o6,	%g5
	umulcc	%l0,	0x1BF3,	%i3
	fpsub32s	%f26,	%f26,	%f28
	edge8n	%o3,	%i4,	%g3
	fcmpeq32	%f4,	%f8,	%i7
	orcc	%g6,	0x1BA8,	%i0
	popc	0x027F,	%i6
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	nop 	! 	taddcc	%i5,	%g1,	%o2 changed by convert2hboot
	srax	%o0,	%g4,	%i1
	fornot1s	%f9,	%f4,	%f3
	edge16n	%l4,	%o7,	%l5
	lduw	[%l7 + 0x24],	%l1
	alignaddr	%o4,	%l6,	%l2
	array16	%i2,	%g7,	%o5
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	fbl,a	%fcc2,	loop_2299
	udivcc	%g2,	0x1F73,	%l3
	udivx	%o6,	0x03D2,	%o1
	fand	%f8,	%f24,	%f12
loop_2299:
	fand	%f30,	%f30,	%f16
	fbug,a	%fcc2,	loop_2300
	call	loop_2301
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	nop 	! 	tsubcctv	%l0,	0x04DD,	%i3 changed by convert2hboot
loop_2300:
	fcmpeq32	%f24,	%f4,	%o3
loop_2301:
	fpadd16s	%f0,	%f13,	%f27
	alignaddrl	%g5,	%i4,	%g3
	orncc	%g6,	%i0,	%i6
	movrlez	%i7,	0x3EF,	%g1
	fmovsn	%icc,	%f20,	%f1
	movl	%xcc,	%i5,	%o0
	movl	%icc,	%g4,	%o2
	nop 	! 	tvc	%icc,	0x0 changed by convert2hboot
	nop 	! 	taddcc	%i1,	0x04BD,	%l4 changed by convert2hboot
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	nop 	! 	tne	%icc,	0x1 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble	%fcc0,	loop_2302
	subc	%o7,	%l5,	%o4
	add	%l1,	0x1630,	%l2
	nop 	! 	sir	0x0080 changed by convert2hboot
loop_2302:
	andcc	%i2,	0x1E38,	%g7
	fmovdle	%xcc,	%f8,	%f21
	move	%icc,	%l6,	%g2
	fbule,a	%fcc2,	loop_2303
	move	%icc,	%l3,	%o5
	fbge	%fcc2,	loop_2304
	bne,a,pt	%xcc,	loop_2305
loop_2303:
	smulcc	%o1,	0x00B5,	%o6
	fxnors	%f2,	%f5,	%f24
loop_2304:
	nop
	set	0x0C, %o6
	lda	[%l7 + %o6] 0x19,	%f10
loop_2305:
	nop 	! 	tge	%xcc,	0x1 changed by convert2hboot
	udivx	%l0,	0x0762,	%i3
	fble	%fcc0,	loop_2306
	fexpand	%f25,	%f6
	movcs	%xcc,	%o3,	%g5
	fnors	%f28,	%f0,	%f31
loop_2306:
	sethi	0x1276,	%i4
	smul	%g6,	0x160B,	%g3
	sll	%i0,	0x08,	%i7
	fsrc2	%f12,	%f0
	fmovdvc	%xcc,	%f12,	%f3
	fmovsleu	%xcc,	%f3,	%f16
	nop 	! 	taddcc	%i6,	0x144E,	%i5 changed by convert2hboot
	array16	%o0,	%g1,	%o2
	andn	%g4,	0x05EE,	%l4
	sdivx	%i1,	0x03A0,	%o7
	fmovsge	%icc,	%f25,	%f19
	sth	%o4,	[%l7 + 0x20]
	xnorcc	%l1,	0x15CD,	%l2
	wr	%g0,	0x22,	%asi
	membar	#Sync
	fmovda	%icc,	%f0,	%f28
	edge16	%i2,	%g7,	%g2
	sll	%l3,	0x18,	%l6
	sdivcc	%o5,	0x063D,	%o6
	edge16l	%l0,	%i3,	%o3
	nop 	! 	taddcctv	%o1,	0x04F0,	%g5 changed by convert2hboot
	fmovde	%icc,	%f9,	%f22
	fbe	%fcc2,	loop_2307
	fmovdcc	%xcc,	%f3,	%f17
	fpackfix	%f28,	%f25
	nop 	! 	tne	%xcc,	0x3 changed by convert2hboot
loop_2307:
	fsrc1	%f8,	%f16
	fbg	%fcc2,	loop_2308
	nop 	! 	tle	%xcc,	0x0 changed by convert2hboot
	wr	%g0,	0x81,	%asi
loop_2308:
	alignaddr	%g6,	%g3,	%i4
	fbl	%fcc1,	loop_2309
	fmul8x16al	%f11,	%f1,	%f28
	fabss	%f15,	%f15
	edge32n	%i7,	%i0,	%i6
loop_2309:
	nop 	! 	taddcc	%i5,	%o0,	%g1 changed by convert2hboot
	fmuld8sux16	%f29,	%f26,	%f0
	set	0x76, %o0
	nop	 ! 	lduha	[%l7 + %o0] 0x88,	%o2 ASI use changed by convert2hboot
	fnands	%f2,	%f29,	%f13
	smul	%l4,	%i1,	%g4
	ba,a,pt	%xcc,	loop_2310
	xor	%o7,	%o4,	%l1
	smulcc	%l5,	0x10A0,	%l2
	fmovrdlz	%i2,	%f28,	%f14
loop_2310:
	subc	%g2,	%l3,	%l6
	nop 	! 	tleu	%icc,	0x6 changed by convert2hboot
	movge	%icc,	%o5,	%o6
	fbuge	%fcc1,	loop_2311
	lduh	[%l7 + 0x2E],	%g7
	movl	%icc,	%l0,	%i3
	umulcc	%o3,	%o1,	%g6
loop_2311:
	array8	%g5,	%i4,	%g3
	nop 	! 	sir	0x1E38 changed by convert2hboot
	movn	%xcc,	%i0,	%i7
	fpsub16s	%f24,	%f21,	%f25
	set	0x16, %l4
	nop	 ! 	lduha	[%l7 + %l4] 0x14,	%i6 ASI use changed by convert2hboot
	sdiv	%o0,	0x0AE8,	%i5
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	srax	%o2,	0x02,	%l4
	alignaddrl	%i1,	%g1,	%g4
	movrgez	%o4,	0x30E,	%l1
	edge16l	%o7,	%l2,	%l5
	set	0x42, %l6
	nop	 ! 	ldstuba	[%l7 + %l6] 0x11,	%i2 ASI use changed by convert2hboot
	fmovrsne	%g2,	%f4,	%f15
	movgu	%xcc,	%l6,	%l3
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	fpackfix	%f10,	%f14
	set	0x24, %i4
	nop	 ! 	ldswa	[%l7 + %i4] 0x18,	%o6 ASI use changed by convert2hboot
	fnegd	%f0,	%f0
	movg	%xcc,	%o5,	%g7
	fnands	%f20,	%f5,	%f6
	movneg	%xcc,	%l0,	%i3
	addc	%o1,	%g6,	%o3
	fmovspos	%icc,	%f28,	%f14
	fnor	%f10,	%f22,	%f12
	fmovdcc	%xcc,	%f7,	%f16
	movrgez	%g5,	%g3,	%i4
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
	addc	%i7,	0x003E,	%i6
	bvs,a,pt	%xcc,	loop_2312
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
	movg	%xcc,	%i0,	%i5
	fors	%f22,	%f11,	%f10
loop_2312:
	xor	%o2,	0x1078,	%l4
	nop 	! 	tneg	%icc,	0x5 changed by convert2hboot
	brlz	%o0,	loop_2313
	movrlez	%i1,	0x038,	%g4
	bne,pn	%icc,	loop_2314
	sll	%g1,	0x03,	%l1
loop_2313:
	fbe	%fcc3,	loop_2315
	bneg,pn	%xcc,	loop_2316
loop_2314:
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	edge8	%o7,	%o4,	%l2
loop_2315:
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
loop_2316:
	nop
	set	0x18, %i3
	sta	%f22,	[%l7 + %i3] 0x15
	mulscc	%i2,	%l5,	%l6
	movpos	%xcc,	%g2,	%o6
	alignaddrl	%l3,	%o5,	%l0
	movrlz	%i3,	%g7,	%o1
	call	loop_2317
	brnz,a	%g6,	loop_2318
	movge	%xcc,	%o3,	%g3
	mulscc	%i4,	%g5,	%i7
loop_2317:
	andcc	%i0,	0x0D94,	%i5
loop_2318:
	edge8ln	%o2,	%l4,	%o0
	fmovs	%f4,	%f18
	xor	%i1,	0x1446,	%g4
	movn	%xcc,	%i6,	%l1
	edge8ln	%g1,	%o4,	%l2
	srax	%i2,	0x02,	%l5
	mova	%icc,	%l6,	%g2
	movleu	%icc,	%o7,	%l3
	nop
	set	0x30, %i0
	sth	%o6,	[%l7 + %i0]
	mulscc	%l0,	0x0C78,	%o5
	st	%f8,	[%l7 + 0x6C]
	fmovrslz	%i3,	%f24,	%f7
	sra	%g7,	0x05,	%o1
	fbg,a	%fcc0,	loop_2319
	smulcc	%g6,	0x0954,	%g3
	wr	%g0,	0x52,	%asi
loop_2319:
	edge32n	%g5,	%i7,	%i0
	bvc	%icc,	loop_2320
	fnand	%f20,	%f22,	%f28
	nop 	! 	tcc	%icc,	0x4 changed by convert2hboot
	swap	[%l7 + 0x48],	%i4
loop_2320:
	array16	%i5,	%o2,	%o0
	nop 	! 	taddcc	%i1,	0x0FA5,	%g4 changed by convert2hboot
	movrlz	%l4,	0x28A,	%i6
	movneg	%icc,	%l1,	%g1
	fbuge,a	%fcc1,	loop_2321
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	orncc	%o4,	%i2,	%l5
	nop 	! 	tn	%xcc,	0x5 changed by convert2hboot
loop_2321:
	ldx	[%l7 + 0x70],	%l6
	nop 	! 	tcc	%xcc,	0x7 changed by convert2hboot
	addccc	%g2,	%o7,	%l2
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l3,	%l0,	%o5
	umulcc	%i3,	%o6,	%o1
	nop 	! 	sir	0x16EF changed by convert2hboot
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
	stx	%g7,	[%l7 + 0x20]
	srl	%g6,	0x0D,	%g3
	array32	%o3,	%i7,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	ta	%icc,	0x7 changed by convert2hboot
	nop 	! 	tsubcctv	%i4,	%i0,	%o2 changed by convert2hboot
	move	%xcc,	%i5,	%o0
	fcmpgt16	%f14,	%f24,	%i1
	fcmple16	%f12,	%f22,	%g4
	sethi	0x1253,	%l4
	edge32l	%l1,	%g1,	%i6
	fnor	%f26,	%f26,	%f20
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
	stw	%i2,	[%l7 + 0x50]
	fandnot2s	%f18,	%f6,	%f12
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	udivcc	%l5,	0x1C6F,	%l6
	ba	loop_2322
	addcc	%o4,	0x0FA9,	%o7
	movgu	%xcc,	%g2,	%l2
	sethi	0x131F,	%l3
loop_2322:
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	edge32	%l0,	%o5,	%i3
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	bcc,a,pn	%icc,	loop_2323
	subcc	%o1,	%o6,	%g6
	fmul8x16	%f6,	%f28,	%f24
	bpos,a	%icc,	loop_2324
loop_2323:
	movleu	%icc,	%g3,	%g7
	movvs	%icc,	%o3,	%i7
	udivx	%i4,	0x0CF3,	%i0
loop_2324:
	xnor	%g5,	%i5,	%o0
	movle	%icc,	%o2,	%g4
	bne,a	%icc,	loop_2325
	bvc,a,pt	%icc,	loop_2326
	nop 	! 	tg	%xcc,	0x2 changed by convert2hboot
	movneg	%xcc,	%i1,	%l1
loop_2325:
	nop
	set	0x09, %i2
	nop	 ! 	ldsba	[%l7 + %i2] 0x80,	%g1 ASI use changed by convert2hboot
loop_2326:
	movrlz	%l4,	%i2,	%l5
	set	0x28, %l1
	nop	 ! 	stwa	%i6,	[%l7 + %l1] 0xe3 ASI use changed by convert2hboot
	membar	#Sync
	orn	%o4,	%o7,	%g2
	or	%l2,	0x02E6,	%l3
	array8	%l6,	%l0,	%i3
	ld	[%l7 + 0x08],	%f5
	alignaddr	%o1,	%o5,	%o6
	lduh	[%l7 + 0x1E],	%g3
	brlez,a	%g7,	loop_2327
	brlz,a	%g6,	loop_2328
	move	%xcc,	%o3,	%i7
	mova	%xcc,	%i4,	%i0
loop_2327:
	fpadd16	%f22,	%f8,	%f24
loop_2328:
	fors	%f1,	%f12,	%f29
	movgu	%xcc,	%i5,	%o0
	orn	%o2,	0x004A,	%g5
	srax	%g4,	%i1,	%l1
	bn,pn	%icc,	loop_2329
	edge16n	%g1,	%i2,	%l5
	fbe,a	%fcc0,	loop_2330
	smulcc	%i6,	0x115F,	%o4
loop_2329:
	nop
	wr	%g0,	0x81,	%asi
loop_2330:
	edge16n	%g2,	%o7,	%l3
	add	%l7,	0x14,	%l6
	wr	%g0,	0x0c,	%asi
	mova	%icc,	%l2,	%o1
	fxors	%f28,	%f14,	%f15
	fmul8ulx16	%f8,	%f24,	%f18
	fcmpne16	%f4,	%f0,	%i3
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	movle	%xcc,	%o5,	%g3
	fmovdn	%icc,	%f23,	%f21
	udiv	%o6,	0x1919,	%g6
	fmovdneg	%xcc,	%f20,	%f10
	array16	%o3,	%i7,	%g7
	fandnot2s	%f29,	%f3,	%f22
	fcmple16	%f22,	%f22,	%i0
	subccc	%i4,	%o0,	%i5
	subccc	%o2,	%g4,	%i1
	fcmpgt16	%f26,	%f16,	%g5
	movrlz	%l1,	0x300,	%i2
	edge32l	%g1,	%i6,	%l5
	std	%l4,	[%l7 + 0x70]
	xor	%o4,	%g2,	%l3
	fmovde	%xcc,	%f17,	%f23
	udivx	%l6,	0x1EE9,	%l0
	fmovda	%icc,	%f20,	%f3
	edge16ln	%l2,	%o7,	%i3
	smul	%o1,	%o5,	%o6
	fpsub16	%f6,	%f30,	%f26
	bvs	%xcc,	loop_2331
	movneg	%xcc,	%g6,	%g3
	orncc	%i7,	0x134A,	%g7
	fmovrsne	%i0,	%f20,	%f11
loop_2331:
	orcc	%o3,	%o0,	%i5
	edge32l	%o2,	%i4,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i1,	%g5,	%l1
	udivx	%g1,	0x01C4,	%i6
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	movcs	%icc,	%i2,	%l5
	sra	%o4,	%g2,	%l3
	or	%l6,	0x1E9F,	%l4
	edge32	%l2,	%o7,	%l0
	fxnors	%f20,	%f15,	%f26
	sdiv	%o1,	0x0A8A,	%o5
	addcc	%o6,	%g6,	%i3
	prefetch	[%l7 + 0x5C],	 0x2
	sdivx	%i7,	0x115C,	%g3
	udivx	%g7,	0x1D64,	%i0
	std	%f6,	[%l7 + 0x10]
	array32	%o0,	%i5,	%o2
	fmovdneg	%icc,	%f18,	%f10
	bpos,a	%icc,	loop_2332
	edge16ln	%o3,	%i4,	%i1
	subcc	%g4,	%g5,	%l1
	fmuld8sux16	%f5,	%f1,	%f10
loop_2332:
	nop
	set	0x7A, %i7
	nop	 ! 	stha	%g1,	[%l7 + %i7] 0x22 ASI use changed by convert2hboot
	membar	#Sync
	fcmpeq16	%f14,	%f16,	%i2
	fpadd16	%f24,	%f16,	%f8
	fmovsg	%xcc,	%f16,	%f0
	wr	%g0,	0x23,	%asi
	membar	#Sync
	fmovdneg	%icc,	%f0,	%f10
	fmovsl	%icc,	%f19,	%f25
	nop 	! 	taddcctv	%o4,	%g2,	%l3 changed by convert2hboot
	nop 	! 	sir	0x18B4 changed by convert2hboot
	subc	%l6,	0x0A0C,	%l4
	orcc	%l2,	0x0E74,	%l5
	bvs,pt	%icc,	loop_2333
	fmovsneg	%icc,	%f14,	%f21
	movneg	%xcc,	%l0,	%o7
	alignaddrl	%o5,	%o6,	%g6
loop_2333:
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	bge,pt	%xcc,	loop_2334
	edge8n	%i3,	%i7,	%g3
	addccc	%g7,	0x1BFA,	%i0
	subc	%o1,	%o0,	%i5
loop_2334:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o2,	%i4,	%i1
	xor	%o3,	%g5,	%l1
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	bvs	%xcc,	loop_2335
	movneg	%icc,	%g1,	%g4
	popc	%i6,	%o4
	fmovrsgez	%i2,	%f15,	%f9
loop_2335:
	movg	%xcc,	%g2,	%l6
	wr	%g0,	0xf1,	%asi
	membar	#Sync
	xnorcc	%l4,	0x1385,	%l2
	sdiv	%l5,	0x0A67,	%l3
	movrlz	%l0,	%o7,	%o6
	bl,pt	%xcc,	loop_2336
	fornot2	%f18,	%f16,	%f20
	wr	%g0,	0x20,	%asi
loop_2336:
	nop 	! 	tsubcctv	%i3,	0x1A94,	%g6 changed by convert2hboot
	move	%xcc,	%g3,	%g7
	fbl,a	%fcc3,	loop_2337
	edge8n	%i0,	%o1,	%o0
	udivcc	%i5,	0x1F9D,	%i7
	nop 	! 	tn	%icc,	0x5 changed by convert2hboot
loop_2337:
	nop
	setx	loop_2338,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fmovdleu	%icc,	%f23,	%f13
	membar	0x56
	nop
	set	0x10, %g3
	ldx	[%l7 + %g3],	%i4
loop_2338:
	nop 	! 	tcc	%xcc,	0x2 changed by convert2hboot
	set	0x28, %i6
	nop	 ! 	ldstuba	[%l7 + %i6] 0x18,	%i1 ASI use changed by convert2hboot
	fbu	%fcc3,	loop_2339
	fmovsvs	%icc,	%f5,	%f24
	fcmple32	%f6,	%f8,	%o3
	udivcc	%o2,	0x0577,	%l1
loop_2339:
	sdiv	%g1,	0x010E,	%g5
	fmovrsne	%i6,	%f14,	%f19
	fandnot1s	%f11,	%f3,	%f18
	udivx	%o4,	0x00E3,	%g4
	ldstub	[%l7 + 0x74],	%g2
	st	%f7,	[%l7 + 0x10]
	fzero	%f20
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	wr	%g0,	0x88,	%asi
	set	0x66, %i5
	nop	 ! 	stha	%i2,	[%l7 + %i5] 0x0c ASI use changed by convert2hboot
	fmovsn	%xcc,	%f7,	%f4
	and	%l4,	0x1A79,	%l2
	sethi	0x00E2,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f28,	%f28
	mulscc	%l3,	0x154E,	%o7
	bge,a	loop_2340
	ldd	[%l7 + 0x60],	%l0
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
	array32	%o6,	%o5,	%g6
loop_2340:
	fblg	%fcc0,	loop_2341
	edge32n	%i3,	%g7,	%g3
	srlx	%o1,	%i0,	%o0
	subcc	%i5,	%i4,	%i1
loop_2341:
	movge	%icc,	%o3,	%o2
	addc	%i7,	%l1,	%g1
	set	0x68, %g6
	nop	 ! 	prefetcha	[%l7 + %g6] 0x89,	 0x1 ASI use changed by convert2hboot
	fcmpgt32	%f20,	%f8,	%i6
	movleu	%xcc,	%g4,	%g2
	smul	%l6,	%o4,	%i2
	fblg,a	%fcc0,	loop_2342
	bpos,pn	%icc,	loop_2343
	add	%l4,	%l5,	%l2
	andcc	%l3,	%l0,	%o6
loop_2342:
	ld	[%l7 + 0x2C],	%f1
loop_2343:
	brlez	%o5,	loop_2344
	fcmpne32	%f16,	%f4,	%o7
	fbne,a	%fcc1,	loop_2345
	ld	[%l7 + 0x14],	%f16
loop_2344:
	nop
	wr	%g0,	0x89,	%asi
loop_2345:
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	set	0x38, %o7
	sta	%f29,	[%l7 + %o7] 0x0c
	set	0x32, %l5
	nop	 ! 	ldsha	[%l7 + %l5] 0x81,	%g7 ASI use changed by convert2hboot
	nop
	set	0x2F, %i1
	ldstub	[%l7 + %i1],	%g6
	movne	%icc,	%g3,	%o1
	fornot2s	%f9,	%f14,	%f30
	sll	%i0,	%o0,	%i4
	edge8n	%i5,	%o3,	%o2
	set	0x16, %o5
	nop	 ! 	stha	%i1,	[%l7 + %o5] 0xea ASI use changed by convert2hboot
	membar	#Sync
	fnands	%f12,	%f16,	%f10
	fnegs	%f4,	%f21
	nop 	! 	tcc	%xcc,	0x7 changed by convert2hboot
	addc	%i7,	%g1,	%l1
	movre	%g5,	0x042,	%g4
	edge32	%g2,	%l6,	%o4
	edge32	%i2,	%i6,	%l4
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	fsrc1s	%f30,	%f4
	edge8ln	%l2,	%l5,	%l0
	movrgz	%o6,	%l3,	%o5
	alignaddrl	%i3,	%o7,	%g6
	or	%g7,	%o1,	%g3
	udivcc	%o0,	0x1DD0,	%i0
	fnors	%f31,	%f7,	%f1
	movrlz	%i4,	0x206,	%o3
	edge16n	%o2,	%i1,	%i7
	call	loop_2346
	fbn	%fcc1,	loop_2347
	fblg	%fcc0,	loop_2348
	swap	[%l7 + 0x4C],	%i5
loop_2346:
	sllx	%l1,	0x13,	%g1
loop_2347:
	bg	loop_2349
loop_2348:
	movcc	%icc,	%g5,	%g4
	and	%l6,	0x14DA,	%o4
	srax	%i2,	0x16,	%g2
loop_2349:
	ldd	[%l7 + 0x10],	%i6
	membar	0x22
	fmovrdgez	%l2,	%f22,	%f22
	fmovrdgz	%l5,	%f30,	%f8
	movcs	%icc,	%l4,	%l0
	fpack32	%f18,	%f26,	%f0
	add	%l3,	%o5,	%o6
	fblg,a	%fcc1,	loop_2350
	sub	%o7,	%i3,	%g6
	popc	0x0A22,	%g7
	fpsub32s	%f6,	%f3,	%f27
loop_2350:
	udivcc	%g3,	0x183C,	%o0
	brgz	%i0,	loop_2351
	udivcc	%o1,	0x1444,	%o3
	orcc	%i4,	%i1,	%i7
	fmovsvc	%xcc,	%f24,	%f4
loop_2351:
	edge32ln	%i5,	%o2,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,a	loop_2352
	movrlez	%l1,	0x035,	%g5
	edge32	%l6,	%g4,	%o4
	movvc	%xcc,	%i2,	%g2
loop_2352:
	edge8l	%i6,	%l2,	%l5
	set	0x50, %o3
	nop	 ! 	prefetcha	[%l7 + %o3] 0x15,	 0x1 ASI use changed by convert2hboot
	brlz	%l3,	loop_2353
	udivcc	%o5,	0x08AE,	%o6
	orn	%l0,	0x18AF,	%i3
	edge32l	%o7,	%g6,	%g7
loop_2353:
	fbn	%fcc0,	loop_2354
	sdiv	%g3,	0x0346,	%o0
	umulcc	%o1,	%i0,	%o3
loop_2354:
	addc	%i1,	0x021F,	%i4
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	andn	%i7,	%o2,	%g1
	movcs	%xcc,	%l1,	%i5
	wr	%g0,	0x88,	%asi
	xorcc	%l6,	0x1ABB,	%g4
	fpack32	%f8,	%f18,	%f28
	nop 	! 	tcs	%icc,	0x7 changed by convert2hboot
	array16	%o4,	%g2,	%i2
	wr	%g0,	0x17,	%asi
	membar	#Sync
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	edge8	%l2,	%i6,	%l5
	ldsw	[%l7 + 0x48],	%l3
	fxnors	%f30,	%f6,	%f17
	fmovdle	%icc,	%f8,	%f22
	fpmerge	%f13,	%f24,	%f8
	fabss	%f3,	%f26
	addcc	%o5,	%o6,	%l0
	umul	%l4,	0x0AE0,	%o7
	set	0x70, %g1
	nop	 ! 	ldda	[%l7 + %g1] 0x14,	%i2 ASI use changed by convert2hboot
	ldstub	[%l7 + 0x12],	%g6
	wr	%g0,	0x80,	%asi
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
	edge32l	%g7,	%o0,	%o1
	fmovsn	%icc,	%f14,	%f5
	fmovdleu	%xcc,	%f10,	%f23
	bshuffle	%f14,	%f6,	%f22
	sub	%o3,	0x1CFB,	%i1
	fmovrse	%i0,	%f15,	%f8
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	edge32l	%i4,	%i7,	%g1
	fbuge,a	%fcc1,	loop_2355
	xor	%l1,	0x14D7,	%i5
	fcmpgt16	%f6,	%f12,	%o2
	mulx	%l6,	0x14F2,	%g4
loop_2355:
	udivcc	%o4,	0x197F,	%g2
	subccc	%g5,	0x0080,	%i2
	edge32n	%l2,	%l5,	%i6
	fbuge	%fcc0,	loop_2356
	movre	%l3,	0x144,	%o6
	fnot2	%f2,	%f8
	fmuld8sux16	%f4,	%f20,	%f10
loop_2356:
	fpsub32	%f4,	%f12,	%f28
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
	movrgez	%o5,	%l4,	%o7
	fmovsle	%icc,	%f9,	%f0
	array8	%i3,	%g6,	%l0
	movne	%icc,	%g3,	%g7
	udivcc	%o1,	0x0B8F,	%o0
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	movl	%xcc,	%i1,	%i0
	fcmpes	%fcc2,	%f19,	%f9
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
	andcc	%i4,	%i7,	%o3
	movleu	%icc,	%l1,	%i5
	fexpand	%f28,	%f14
	array16	%g1,	%l6,	%g4
	fpadd32	%f28,	%f26,	%f2
	andn	%o2,	%g2,	%o4
	movne	%icc,	%i2,	%g5
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
	set	0x70, %o4
	sta	%f14,	[%l7 + %o4] 0x04
	udivx	%l2,	0x1E1A,	%l5
	fmovdvc	%icc,	%f12,	%f31
	xor	%i6,	0x1F0A,	%l3
	edge8l	%o6,	%o5,	%o7
	fbug	%fcc0,	loop_2357
	fble	%fcc2,	loop_2358
	nop 	! 	te	%xcc,	0x7 changed by convert2hboot
	xor	%l4,	%g6,	%i3
loop_2357:
	xnor	%g3,	0x0A2E,	%l0
loop_2358:
	edge32n	%g7,	%o0,	%o1
	movgu	%icc,	%i0,	%i1
	sethi	0x073C,	%i7
	movne	%xcc,	%i4,	%l1
	movre	%i5,	0x377,	%g1
	fbuge,a	%fcc1,	loop_2359
	nop 	! 	taddcc	%l6,	0x1572,	%o3 changed by convert2hboot
	nop 	! 	tvc	%icc,	0x5 changed by convert2hboot
	st	%f11,	[%l7 + 0x24]
loop_2359:
	smul	%g4,	0x09F1,	%g2
	orncc	%o2,	%i2,	%o4
	subcc	%l2,	%l5,	%g5
	srax	%i6,	%o6,	%o5
	bcs,pt	%icc,	loop_2360
	movvc	%xcc,	%l3,	%o7
	ldsw	[%l7 + 0x10],	%l4
	set	0x57, %g5
	nop	 ! 	lduba	[%l7 + %g5] 0x81,	%g6 ASI use changed by convert2hboot
loop_2360:
	fmovd	%f22,	%f20
	srax	%g3,	%l0,	%g7
	fmovsge	%xcc,	%f9,	%f4
	fcmped	%fcc0,	%f24,	%f4
	movn	%icc,	%o0,	%o1
	membar	0x36
	faligndata	%f28,	%f8,	%f26
	set	0x29, %o1
	nop	 ! 	stba	%i3,	[%l7 + %o1] 0x0c ASI use changed by convert2hboot
	udiv	%i1,	0x0B01,	%i7
	stx	%i4,	[%l7 + 0x10]
	movrlez	%i0,	%i5,	%l1
	fcmple32	%f12,	%f24,	%g1
	fmovspos	%icc,	%f4,	%f14
	andncc	%l6,	%o3,	%g4
	movrne	%g2,	%o2,	%o4
	fba,a	%fcc3,	loop_2361
	alignaddr	%l2,	%l5,	%g5
	fpackfix	%f8,	%f8
	sra	%i6,	%i2,	%o6
loop_2361:
	edge16l	%l3,	%o7,	%l4
	movvs	%xcc,	%o5,	%g3
	brlez,a	%l0,	loop_2362
	swap	[%l7 + 0x0C],	%g7
	movcc	%xcc,	%o0,	%o1
	ba,a	loop_2363
loop_2362:
	fmovs	%f23,	%f29
	alignaddrl	%g6,	%i3,	%i7
	fmovsg	%xcc,	%f22,	%f15
loop_2363:
	xor	%i4,	%i0,	%i1
	srl	%l1,	%i5,	%l6
	orcc	%g1,	%o3,	%g2
	sdivcc	%g4,	0x1C6E,	%o4
	wr	%g0,	0x80,	%asi
	sta	%f22,	[%l7 + 0x48] %asi
	fzero	%f16
	fmovsge	%icc,	%f26,	%f22
	mova	%xcc,	%o2,	%l2
	ldsw	[%l7 + 0x70],	%l5
	umul	%g5,	0x08C0,	%i2
	fmovdl	%icc,	%f13,	%f20
	sdiv	%i6,	0x0DB3,	%o6
	alignaddrl	%l3,	%o7,	%o5
	andncc	%g3,	%l4,	%l0
	sll	%g7,	%o1,	%g6
	addccc	%o0,	0x0BEB,	%i7
	movleu	%xcc,	%i3,	%i4
	subcc	%i0,	0x080B,	%i1
	mulscc	%l1,	0x1078,	%i5
	fmovdneg	%xcc,	%f2,	%f31
	fnot1s	%f16,	%f30
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	fbn	%fcc2,	loop_2364
	fbu	%fcc1,	loop_2365
	movrlz	%l6,	%o3,	%g2
	xor	%g1,	0x1068,	%o4
loop_2364:
	ble	loop_2366
loop_2365:
	fnors	%f16,	%f8,	%f26
	andncc	%o2,	%g4,	%l5
	andn	%g5,	0x1B53,	%i2
loop_2366:
	srl	%i6,	0x07,	%l2
	pdist	%f28,	%f18,	%f14
	array32	%o6,	%l3,	%o7
	fmovrslez	%o5,	%f8,	%f10
	nop 	! 	tsubcctv	%l4,	0x11B3,	%l0 changed by convert2hboot
	udivx	%g3,	0x1E81,	%o1
	fbn,a	%fcc0,	loop_2367
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
	umulcc	%g6,	%o0,	%i7
	movl	%icc,	%i3,	%i4
loop_2367:
	movvc	%xcc,	%i0,	%i1
	edge16ln	%l1,	%g7,	%l6
	nop 	! 	tsubcctv	%o3,	%g2,	%i5 changed by convert2hboot
	ldub	[%l7 + 0x10],	%o4
	fbu,a	%fcc1,	loop_2368
	brgz	%o2,	loop_2369
	bgu,a,pn	%icc,	loop_2370
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2368:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2369:
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
loop_2370:
	bg,a,pn	%xcc,	loop_2371
	ldsh	[%l7 + 0x66],	%g4
	movne	%icc,	%g1,	%l5
	std	%f18,	[%l7 + 0x68]
loop_2371:
	movgu	%icc,	%i2,	%i6
	movcs	%icc,	%l2,	%o6
	nop 	! 	taddcc	%g5,	0x1E2E,	%l3 changed by convert2hboot
	andn	%o7,	0x1E4F,	%l4
	fcmpeq32	%f20,	%f28,	%o5
	udiv	%g3,	0x10D7,	%l0
	edge16ln	%g6,	%o1,	%i7
	movrlz	%o0,	0x37A,	%i4
	nop 	! 	tsubcc	%i0,	%i3,	%l1 changed by convert2hboot
	fbl	%fcc0,	loop_2372
	nop 	! 	tge	%icc,	0x0 changed by convert2hboot
	orn	%g7,	%i1,	%l6
	fbul,a	%fcc2,	loop_2373
loop_2372:
	or	%o3,	0x02FF,	%i5
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
	nop 	! 	tsubcc	%o4,	0x17A0,	%o2 changed by convert2hboot
loop_2373:
	movrlz	%g4,	%g2,	%g1
	fmovde	%icc,	%f30,	%f0
	xnor	%l5,	%i6,	%l2
	fmuld8ulx16	%f11,	%f30,	%f4
	andcc	%i2,	0x004E,	%g5
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
	fbl	%fcc1,	loop_2374
	movrne	%o6,	0x12F,	%l3
	edge8	%l4,	%o7,	%g3
	set	0x1D, %l2
	nop	 ! 	ldstuba	[%l7 + %l2] 0x10,	%l0 ASI use changed by convert2hboot
loop_2374:
	fzeros	%f27
	array32	%g6,	%o5,	%o1
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	fmovd	%f18,	%f16
	fmovdgu	%xcc,	%f4,	%f26
	xorcc	%o0,	0x05A2,	%i7
	ldd	[%l7 + 0x70],	%f20
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	xorcc	%i4,	0x0096,	%i0
	brgz,a	%i3,	loop_2375
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	sdivx	%g7,	0x004B,	%l1
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
loop_2375:
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	fbl,a	%fcc1,	loop_2376
	movgu	%xcc,	%i1,	%o3
	edge16n	%l6,	%o4,	%i5
	edge16n	%g4,	%g2,	%o2
loop_2376:
	fbu	%fcc3,	loop_2377
	nop 	! 	taddcctv	%g1,	0x1A35,	%l5 changed by convert2hboot
	brgez,a	%i6,	loop_2378
	fbge,a	%fcc0,	loop_2379
loop_2377:
	movleu	%icc,	%l2,	%i2
	nop 	! 	tpos	%icc,	0x4 changed by convert2hboot
loop_2378:
	bl,pt	%icc,	loop_2380
loop_2379:
	orcc	%o6,	0x0D0B,	%l3
	sra	%l4,	0x1E,	%g5
	edge32l	%o7,	%g3,	%g6
loop_2380:
	movrne	%l0,	0x256,	%o5
	edge32ln	%o0,	%i7,	%i4
	udiv	%i0,	0x0971,	%i3
	fbe,a	%fcc0,	loop_2381
	srax	%o1,	0x1E,	%g7
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	sra	%i1,	%o3,	%l1
loop_2381:
	brgez,a	%o4,	loop_2382
	lduw	[%l7 + 0x2C],	%i5
	edge8l	%l6,	%g4,	%o2
	stw	%g1,	[%l7 + 0x44]
loop_2382:
	addcc	%g2,	0x0196,	%l5
	move	%xcc,	%l2,	%i2
	movl	%xcc,	%i6,	%l3
	fcmps	%fcc0,	%f31,	%f12
	movrlz	%l4,	0x077,	%g5
	movcc	%xcc,	%o7,	%g3
	umulcc	%o6,	0x13CA,	%l0
	fcmple32	%f18,	%f22,	%o5
	edge32n	%o0,	%i7,	%i4
	nop
	setx	loop_2383,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	orcc	%g6,	0x10C0,	%i3
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
	fmovdleu	%xcc,	%f28,	%f26
loop_2383:
	fcmped	%fcc3,	%f22,	%f30
	set	0x10, %g7
	sta	%f0,	[%l7 + %g7] 0x88
	alignaddrl	%i0,	%o1,	%i1
	array32	%o3,	%l1,	%g7
	fmovrsne	%o4,	%f30,	%f2
	andn	%i5,	0x0DA4,	%l6
	edge8l	%g4,	%g1,	%g2
	or	%l5,	0x09C4,	%l2
	movpos	%xcc,	%i2,	%i6
	nop
	setx	loop_2384,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fpack32	%f12,	%f0,	%f2
	movrgez	%o2,	%l4,	%l3
	fornot2s	%f2,	%f17,	%f29
loop_2384:
	ldstub	[%l7 + 0x2D],	%g5
	mulscc	%g3,	0x0372,	%o6
	nop 	! 	sir	0x1E54 changed by convert2hboot
	fmovsne	%xcc,	%f3,	%f5
	subccc	%o7,	0x05FE,	%l0
	fbg	%fcc2,	loop_2385
	xnorcc	%o5,	%o0,	%i4
	nop 	! 	tsubcctv	%g6,	0x1F15,	%i3 changed by convert2hboot
	fcmpne32	%f4,	%f24,	%i0
loop_2385:
	nop 	! 	ta	%xcc,	0x7 changed by convert2hboot
	movrlz	%i7,	%i1,	%o1
	andn	%o3,	%g7,	%l1
	xnor	%i5,	0x0D9A,	%o4
	bl,pt	%icc,	loop_2386
	edge8	%g4,	%l6,	%g1
	udiv	%l5,	0x1CA1,	%l2
	fmovdvs	%xcc,	%f26,	%f3
loop_2386:
	srlx	%i2,	0x17,	%i6
	fmovrde	%o2,	%f6,	%f28
	bvs,a,pt	%icc,	loop_2387
	movn	%icc,	%g2,	%l4
	fmovsg	%xcc,	%f18,	%f28
	set	0x16, %l3
	nop	 ! 	stba	%g5,	[%l7 + %l3] 0x2b ASI use changed by convert2hboot
	membar	#Sync
loop_2387:
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	set	0x34, %o2
	nop	 ! 	ldsha	[%l7 + %o2] 0x19,	%g3 ASI use changed by convert2hboot
	nop 	! 	tsubcc	%o6,	0x1042,	%l3 changed by convert2hboot
	ldstub	[%l7 + 0x2B],	%o7
	set	0x30, %g2
	nop	 ! 	ldxa	[%g0 + %g2] 0x58,	%l0 ASI use changed by convert2hboot
	edge8l	%o5,	%o0,	%i4
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
	set	0x74, %g4
	nop	 ! 	stwa	%i3,	[%l7 + %g4] 0x04 ASI use changed by convert2hboot
	xnorcc	%g6,	%i0,	%i1
	nop 	! 	tleu	%icc,	0x1 changed by convert2hboot
	bne	%icc,	loop_2388
	array8	%o1,	%o3,	%g7
	fornot1s	%f28,	%f9,	%f11
	stx	%l1,	[%l7 + 0x28]
loop_2388:
	movcc	%xcc,	%i5,	%i7
	andncc	%o4,	%l6,	%g4
	fblg,a	%fcc2,	loop_2389
	sra	%l5,	0x03,	%l2
	wr	%g0,	0x27,	%asi
	membar	#Sync
loop_2389:
	edge8ln	%i6,	%o2,	%i2
	edge16l	%g2,	%l4,	%g5
	srl	%o6,	%g3,	%o7
	set	0x58, %l0
	nop	 ! 	prefetcha	[%l7 + %l0] 0x18,	 0x0 ASI use changed by convert2hboot
	fxors	%f8,	%f25,	%f27
	fmovsneg	%icc,	%f21,	%f20
	xorcc	%o5,	0x17E6,	%l0
	sub	%o0,	%i4,	%i3
	ldsw	[%l7 + 0x28],	%g6
	nop 	! 	tvc	%icc,	0x2 changed by convert2hboot
	movn	%xcc,	%i1,	%i0
	bshuffle	%f2,	%f30,	%f4
	set	0x74, %o0
	nop	 ! 	ldsha	[%l7 + %o0] 0x80,	%o3 ASI use changed by convert2hboot
	edge8	%g7,	%o1,	%i5
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	set	0x70, %l4
	nop	 ! 	ldswa	[%l7 + %l4] 0x15,	%i7 ASI use changed by convert2hboot
	sdivcc	%o4,	0x02DE,	%l1
	udiv	%g4,	0x0832,	%l6
	fmovda	%icc,	%f31,	%f16
	edge8n	%l5,	%l2,	%g1
	fpsub32s	%f16,	%f11,	%f30
	movvs	%icc,	%o2,	%i2
	pdist	%f10,	%f20,	%f22
	fnand	%f0,	%f22,	%f0
	edge16n	%g2,	%l4,	%g5
	bn,pn	%xcc,	loop_2390
	subccc	%i6,	0x0AA2,	%o6
	fbne	%fcc3,	loop_2391
	fmovrde	%g3,	%f8,	%f16
loop_2390:
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
	fnegd	%f14,	%f6
loop_2391:
	lduh	[%l7 + 0x10],	%l3
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	nop 	! 	tsubcc	%o7,	0x0F7B,	%o5 changed by convert2hboot
	add	%o0,	%l0,	%i3
	wr	%g0,	0xe2,	%asi
	membar	#Sync
	movpos	%xcc,	%i4,	%i0
	fmovdne	%icc,	%f31,	%f7
	nop 	! 	tvc	%xcc,	0x7 changed by convert2hboot
	srlx	%i1,	%g7,	%o1
	sdivcc	%o3,	0x1002,	%i7
	movleu	%icc,	%o4,	%l1
	array32	%i5,	%g4,	%l5
	set	0x47, %o6
	nop	 ! 	stba	%l6,	[%l7 + %o6] 0x89 ASI use changed by convert2hboot
	edge8n	%l2,	%o2,	%i2
	fpack32	%f22,	%f14,	%f30
	sdivx	%g1,	0x1DB4,	%l4
	edge32ln	%g5,	%g2,	%i6
	sdivcc	%g3,	0x008A,	%l3
	nop
	setx	loop_2392,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fmovdle	%xcc,	%f26,	%f20
	xnorcc	%o7,	0x1173,	%o6
	wr	%g0,	0x89,	%asi
	sta	%f24,	[%l7 + 0x58] %asi
loop_2392:
	fbn,a	%fcc1,	loop_2393
	brlez	%o5,	loop_2394
	fmuld8ulx16	%f3,	%f15,	%f28
	alignaddrl	%o0,	%i3,	%l0
loop_2393:
	bcc,pt	%xcc,	loop_2395
loop_2394:
	sra	%i4,	%g6,	%i0
	be,a,pn	%icc,	loop_2396
	fsrc1	%f18,	%f8
loop_2395:
	movgu	%xcc,	%g7,	%i1
	addc	%o1,	0x145D,	%i7
loop_2396:
	fxor	%f30,	%f16,	%f2
	movrgez	%o4,	%o3,	%l1
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
	fnegs	%f4,	%f19
	bpos,a,pt	%icc,	loop_2397
	sllx	%i5,	0x0F,	%g4
	fmuld8ulx16	%f4,	%f11,	%f14
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
loop_2397:
	nop
	set	0x4E, %i4
	nop	 ! 	stha	%l6,	[%l7 + %i4] 0x10 ASI use changed by convert2hboot
	fbo,a	%fcc3,	loop_2398
	udivcc	%l2,	0x1E8A,	%l5
	xorcc	%i2,	0x10AC,	%o2
	fmovse	%xcc,	%f24,	%f21
loop_2398:
	array16	%l4,	%g5,	%g2
	stx	%i6,	[%l7 + 0x78]
	addcc	%g3,	0x1C0C,	%g1
	nop
	set	0x4C, %l6
	lduh	[%l7 + %l6],	%o7
	brz,a	%o6,	loop_2399
	srlx	%l3,	%o5,	%o0
	edge32l	%l0,	%i4,	%g6
	edge16ln	%i3,	%g7,	%i1
loop_2399:
	movg	%xcc,	%i0,	%i7
	set	0x18, %i3
	nop	 ! 	ldxa	[%l7 + %i3] 0x88,	%o4 ASI use changed by convert2hboot
	subccc	%o1,	%o3,	%i5
	movrlez	%g4,	0x082,	%l6
	fcmpd	%fcc3,	%f30,	%f26
	ba,pt	%xcc,	loop_2400
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
	fbul,a	%fcc1,	loop_2401
	add	%l2,	0x179B,	%l1
loop_2400:
	movg	%icc,	%l5,	%i2
	movvs	%xcc,	%l4,	%g5
loop_2401:
	fmovd	%f22,	%f22
	subccc	%g2,	0x0168,	%o2
	fmovde	%icc,	%f11,	%f19
	ldsw	[%l7 + 0x60],	%i6
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
	movcc	%xcc,	%g3,	%o7
	orcc	%g1,	0x0FAE,	%l3
	movcc	%icc,	%o6,	%o0
	fmovsg	%icc,	%f8,	%f30
	fzero	%f6
	fmovrdlez	%l0,	%f18,	%f16
	nop 	! 	taddcctv	%i4,	%o5,	%i3 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,a	%xcc,	loop_2402
	smul	%g7,	0x11E2,	%g6
	fornot1	%f0,	%f24,	%f26
	nop 	! 	tg	%xcc,	0x2 changed by convert2hboot
loop_2402:
	edge8ln	%i0,	%i1,	%i7
	orcc	%o4,	%o1,	%o3
	wr	%g0,	0x0c,	%asi
	set	0x44, %i0
	nop	 ! 	lduba	[%l7 + %i0] 0x15,	%g4 ASI use changed by convert2hboot
	nop 	! 	tvc	%xcc,	0x4 changed by convert2hboot
	fcmple32	%f24,	%f4,	%l2
	fmovsneg	%icc,	%f16,	%f4
	movleu	%xcc,	%l1,	%l6
	ld	[%l7 + 0x14],	%f5
	fnot1	%f10,	%f6
	alignaddr	%i2,	%l5,	%l4
	sll	%g5,	0x03,	%o2
	srl	%g2,	0x0F,	%i6
	srl	%o7,	0x16,	%g1
	edge8n	%g3,	%o6,	%o0
	umulcc	%l3,	%l0,	%o5
	fbug,a	%fcc2,	loop_2403
	movrne	%i4,	%g7,	%g6
	smul	%i0,	0x0C6A,	%i1
	udivx	%i3,	0x0E44,	%o4
loop_2403:
	andncc	%o1,	%o3,	%i7
	andcc	%g4,	0x02C0,	%l2
	wr	%g0,	0x04,	%asi
	orncc	%l1,	%l6,	%i2
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
	movle	%icc,	%l4,	%g5
	edge32	%o2,	%l5,	%g2
	xor	%o7,	%i6,	%g1
	sethi	0x0486,	%g3
	subcc	%o6,	0x0A04,	%o0
	fmovrde	%l3,	%f0,	%f24
	udiv	%o5,	0x1252,	%l0
	prefetch	[%l7 + 0x2C],	 0x1
	bl	%icc,	loop_2404
	alignaddrl	%g7,	%g6,	%i0
	fones	%f10
	fbuge,a	%fcc3,	loop_2405
loop_2404:
	edge8	%i4,	%i1,	%i3
	sllx	%o4,	0x14,	%o3
	wr	%g0,	0x04,	%asi
loop_2405:
	edge16n	%g4,	%l2,	%o1
	and	%i5,	0x0E2B,	%l6
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	fnands	%f28,	%f23,	%f21
	sllx	%l1,	0x17,	%i2
	brgz,a	%g5,	loop_2406
	sub	%l4,	0x1C61,	%l5
	udivcc	%g2,	0x0F8A,	%o2
	nop 	! 	sir	0x0747 changed by convert2hboot
loop_2406:
	movge	%xcc,	%i6,	%o7
	sdivx	%g1,	0x1DE2,	%o6
	fsrc2	%f8,	%f24
	orn	%g3,	%o0,	%o5
	ba,a	loop_2407
	brz	%l0,	loop_2408
	fbuge,a	%fcc1,	loop_2409
	subccc	%l3,	0x0975,	%g6
loop_2407:
	nop
	setx	loop_2410,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_2408:
	brgz	%g7,	loop_2411
loop_2409:
	move	%xcc,	%i0,	%i1
	movvs	%xcc,	%i3,	%o4
loop_2410:
	fpsub16s	%f4,	%f25,	%f13
loop_2411:
	fmovdn	%icc,	%f19,	%f11
	bvc,a	%xcc,	loop_2412
	orncc	%o3,	%i4,	%i7
	be,pn	%icc,	loop_2413
	std	%g4,	[%l7 + 0x70]
loop_2412:
	membar	0x45
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
loop_2413:
	movgu	%icc,	%l2,	%o1
	sll	%i5,	%l6,	%i2
	fands	%f1,	%f15,	%f6
	fcmpgt16	%f30,	%f24,	%l1
	subccc	%g5,	0x163F,	%l4
	movpos	%icc,	%l5,	%o2
	movrlz	%g2,	%o7,	%g1
	ble,pn	%icc,	loop_2414
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x38, %i2
	nop	 ! 	prefetcha	[%l7 + %i2] 0x10,	 0x2 ASI use changed by convert2hboot
loop_2414:
	edge32ln	%i6,	%g3,	%o5
	wr	%g0,	0x80,	%asi
	fmovde	%xcc,	%f28,	%f31
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	fmovrdgz	%l3,	%f4,	%f18
	fcmpes	%fcc1,	%f15,	%f23
	fbe	%fcc0,	loop_2415
	edge16	%l0,	%g7,	%g6
	wr	%g0,	0x0c,	%asi
loop_2415:
	nop 	! 	taddcctv	%i3,	%o4,	%i1 changed by convert2hboot
	fmul8x16au	%f25,	%f0,	%f22
	sethi	0x1A32,	%o3
	movre	%i4,	%g4,	%l2
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	set	0x3C, %l1
	nop	 ! 	ldswa	[%l7 + %l1] 0x89,	%o1 ASI use changed by convert2hboot
	bne	%icc,	loop_2416
	fmovrde	%i5,	%f30,	%f18
	stw	%l6,	[%l7 + 0x5C]
	movgu	%xcc,	%i2,	%l1
loop_2416:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,a,pn	%xcc,	loop_2417
	fbuge,a	%fcc0,	loop_2418
	fzero	%f4
	fmovsneg	%icc,	%f13,	%f27
loop_2417:
	fexpand	%f14,	%f28
loop_2418:
	edge32l	%i7,	%l4,	%g5
	fpadd32	%f10,	%f28,	%f14
	add	%l5,	%g2,	%o7
	fpadd16s	%f26,	%f11,	%f11
	lduh	[%l7 + 0x34],	%o2
	set	0x18, %g3
	nop	 ! 	ldswa	[%l7 + %g3] 0x14,	%o6 ASI use changed by convert2hboot
	addcc	%i6,	0x0391,	%g1
	movleu	%icc,	%g3,	%o5
	edge8ln	%l3,	%o0,	%g7
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	bl	%icc,	loop_2419
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l0,	%g6,	%i0
	umul	%o4,	%i1,	%i3
loop_2419:
	fmovdge	%xcc,	%f2,	%f31
	fmovrsgz	%i4,	%f29,	%f11
	fcmpne16	%f0,	%f14,	%o3
	wr	%g0,	0x04,	%asi
	fba	%fcc1,	loop_2420
	fmovsgu	%icc,	%f12,	%f18
	subc	%l2,	%o1,	%l6
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
loop_2420:
	udivx	%i2,	0x10AF,	%l1
	udivx	%i5,	0x15D5,	%i7
	edge16ln	%l4,	%g5,	%g2
	fnot1s	%f5,	%f26
	xor	%l5,	0x0DBF,	%o2
	umul	%o7,	0x13F2,	%o6
	fmuld8ulx16	%f20,	%f10,	%f20
	fcmple16	%f2,	%f24,	%i6
	fmovsleu	%xcc,	%f22,	%f9
	fmovrdlz	%g3,	%f12,	%f20
	array8	%o5,	%g1,	%o0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	nop	 ! 	casxa	[%l6] 0x81,	%g7,	%l0 ASI use changed by convert2hboot
	bvc,a,pt	%xcc,	loop_2421
	fmuld8ulx16	%f9,	%f13,	%f2
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	sethi	0x19BF,	%l3
loop_2421:
	movvs	%xcc,	%i0,	%o4
	movrlez	%g6,	0x1F4,	%i1
	call	loop_2422
	brnz,a	%i3,	loop_2423
	fbg,a	%fcc0,	loop_2424
	fmovdge	%xcc,	%f12,	%f16
loop_2422:
	fnot2	%f14,	%f4
loop_2423:
	fmovscs	%xcc,	%f9,	%f8
loop_2424:
	edge8	%o3,	%g4,	%l2
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
	bge,a	%xcc,	loop_2425
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o1,	%i4,	%i2
	fpadd32	%f0,	%f18,	%f6
loop_2425:
	srl	%l1,	0x1A,	%i5
	edge32ln	%i7,	%l4,	%g5
	fbge,a	%fcc2,	loop_2426
	brlz,a	%g2,	loop_2427
	edge32n	%l6,	%l5,	%o7
	flush	%l7 + 0x10
loop_2426:
	edge32	%o2,	%o6,	%g3
loop_2427:
	bpos,a,pt	%xcc,	loop_2428
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	fmovdle	%xcc,	%f12,	%f18
loop_2428:
	sdiv	%i6,	0x0BDB,	%o5
	fmovdcs	%icc,	%f28,	%f25
	movvc	%xcc,	%g1,	%g7
	edge8n	%l0,	%o0,	%l3
	wr	%g0,	0x2b,	%asi
	membar	#Sync
	mulx	%o4,	0x1301,	%i1
	movleu	%icc,	%i3,	%g6
	movcc	%icc,	%o3,	%g4
	nop
	setx loop_2429, %l0, %l1
	jmpl %l1, %o1
	nop 	! 	taddcctv	%i4,	0x0747,	%l2 changed by convert2hboot
	move	%xcc,	%i2,	%l1
	fmovdvs	%xcc,	%f16,	%f24
loop_2429:
	smulcc	%i7,	%l4,	%g5
	fmovrdne	%g2,	%f16,	%f6
	fbne	%fcc3,	loop_2430
	sth	%l6,	[%l7 + 0x18]
	array8	%l5,	%i5,	%o7
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
loop_2430:
	xnorcc	%o6,	%g3,	%i6
	movvc	%icc,	%o2,	%o5
	fbe	%fcc2,	loop_2431
	nop 	! 	tpos	%icc,	0x3 changed by convert2hboot
	ldsh	[%l7 + 0x7E],	%g7
	subcc	%g1,	0x0FCD,	%l0
loop_2431:
	nop
	setx	loop_2432,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fbe	%fcc1,	loop_2433
	nop 	! 	tsubcctv	%l3,	0x1050,	%i0 changed by convert2hboot
	edge32ln	%o4,	%o0,	%i1
loop_2432:
	movre	%i3,	%o3,	%g6
loop_2433:
	ldsw	[%l7 + 0x40],	%o1
	fnot2s	%f18,	%f11
	udivcc	%g4,	0x0118,	%l2
	edge16n	%i2,	%l1,	%i4
	fbn,a	%fcc1,	loop_2434
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f14,	%f0,	%l4
	subccc	%i7,	0x087A,	%g5
loop_2434:
	nop 	! 	tcs	%icc,	0x6 changed by convert2hboot
	array16	%l6,	%g2,	%i5
	movle	%icc,	%o7,	%l5
	movrne	%g3,	%o6,	%o2
	fmovdn	%icc,	%f13,	%f5
	pdist	%f2,	%f16,	%f30
	sll	%i6,	0x15,	%o5
	nop 	! 	tsubcc	%g7,	0x0083,	%l0 changed by convert2hboot
	mulscc	%g1,	0x0590,	%i0
	movrne	%o4,	%o0,	%l3
	orncc	%i3,	0x0000,	%o3
	fabss	%f23,	%f19
	edge8ln	%g6,	%o1,	%g4
	move	%xcc,	%l2,	%i2
	fsrc2	%f0,	%f14
	andcc	%l1,	%i4,	%i1
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	taddcctv	%l4,	%g5,	%l6 changed by convert2hboot
	sdivx	%g2,	0x1FA3,	%i5
	fbuge	%fcc3,	loop_2435
	xorcc	%i7,	%o7,	%g3
	be,pt	%xcc,	loop_2436
	movrgz	%o6,	%o2,	%i6
loop_2435:
	nop
	wr	%g0,	0x11,	%asi
loop_2436:
	addcc	%g7,	0x1C9D,	%l0
	nop 	! 	te	%icc,	0x0 changed by convert2hboot
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
	fmuld8ulx16	%f9,	%f18,	%f26
	fpadd32s	%f27,	%f3,	%f21
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	nop 	! 	tvc	%xcc,	0x4 changed by convert2hboot
	fmovsvs	%xcc,	%f12,	%f5
	nop 	! 	taddcc	%l5,	%g1,	%i0 changed by convert2hboot
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x5 changed by convert2hboot
	fpsub16	%f14,	%f14,	%f14
	ldd	[%l7 + 0x38],	%f12
	sll	%o0,	0x19,	%o4
	movl	%xcc,	%l3,	%o3
	brgz,a	%g6,	loop_2437
	fpack32	%f20,	%f0,	%f8
	nop 	! 	tn	%xcc,	0x5 changed by convert2hboot
	fmovrsne	%i3,	%f2,	%f25
loop_2437:
	fxors	%f21,	%f10,	%f25
	fmovde	%xcc,	%f6,	%f15
	fmovrse	%o1,	%f24,	%f9
	movrlz	%l2,	0x2EC,	%g4
	set	0x21, %i6
	nop	 ! 	lduba	[%l7 + %i6] 0x19,	%l1 ASI use changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i4,	%i2,	%l4
	edge32n	%g5,	%i1,	%g2
	sdivcc	%l6,	0x078C,	%i5
	udivx	%i7,	0x03CA,	%o7
	fmovsneg	%icc,	%f2,	%f19
	edge8	%g3,	%o2,	%i6
	movvs	%xcc,	%o5,	%o6
	wr	%g0,	0x81,	%asi
	movrlez	%g7,	0x107,	%g1
	fnot1s	%f5,	%f14
	movre	%i0,	0x3BE,	%l5
	array32	%o0,	%l3,	%o3
	subc	%o4,	%i3,	%g6
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x50] %asi,	%f23
	ldx	[%l7 + 0x08],	%l2
	movrlz	%o1,	0x26B,	%l1
	nop 	! 	tle	%xcc,	0x5 changed by convert2hboot
	edge8	%i4,	%g4,	%l4
	movl	%icc,	%i2,	%g5
	movre	%i1,	%g2,	%l6
	set	0x40, %i5
	nop	 ! 	stda	%f0,	[%l7 + %i5] 0x16 ASI use changed by convert2hboot
	membar	#Sync
	srl	%i5,	0x0D,	%i7
	nop 	! 	taddcctv	%o7,	%o2,	%g3 changed by convert2hboot
	edge16ln	%o5,	%o6,	%l0
	bne,pt	%xcc,	loop_2438
	fsrc2s	%f28,	%f18
	movrgz	%g7,	0x2F6,	%g1
	nop 	! 	tpos	%xcc,	0x1 changed by convert2hboot
loop_2438:
	udivcc	%i0,	0x14DF,	%i6
	movn	%xcc,	%l5,	%o0
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	addcc	%o3,	%o4,	%l3
	wr	%g0,	0x89,	%asi
	addcc	%l2,	0x12D9,	%g6
	stx	%l1,	[%l7 + 0x20]
	set	0x3A, %g6
	nop	 ! 	stba	%o1,	[%l7 + %g6] 0x04 ASI use changed by convert2hboot
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
	nop 	! 	taddcc	%i4,	%g4,	%l4 changed by convert2hboot
	array8	%i2,	%g5,	%i1
	sub	%l6,	%g2,	%i7
	wr	%g0,	0x18,	%asi
	edge16l	%i5,	%g3,	%o2
	fxors	%f23,	%f1,	%f22
	srl	%o5,	%o6,	%g7
	subccc	%g1,	%i0,	%i6
	orncc	%l5,	%o0,	%l0
	movleu	%icc,	%o4,	%l3
	udivcc	%i3,	0x15DA,	%o3
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
	wr	%g0,	0x88,	%asi
	bvs	loop_2439
	fsrc2s	%f9,	%f9
	andncc	%g6,	%l2,	%l1
	fbue	%fcc2,	loop_2440
loop_2439:
	or	%o1,	0x1EBB,	%g4
	srlx	%l4,	%i4,	%i2
	fpadd32	%f28,	%f4,	%f30
loop_2440:
	fmovsleu	%xcc,	%f25,	%f6
	subcc	%g5,	0x0BD1,	%i1
	edge32	%g2,	%i7,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i5,	0x04ED,	%g3
	edge16n	%o7,	%o5,	%o6
	movre	%g7,	%g1,	%i0
	srax	%o2,	%i6,	%l5
	sllx	%o0,	0x01,	%l0
	nop 	! 	tpos	%icc,	0x4 changed by convert2hboot
	movne	%icc,	%o4,	%i3
	set	0x20, %o7
	nop	 ! 	ldxa	[%l7 + %o7] 0x88,	%o3 ASI use changed by convert2hboot
	fba	%fcc1,	loop_2441
	fbu,a	%fcc2,	loop_2442
	movvs	%xcc,	%g6,	%l3
	xor	%l2,	%o1,	%l1
loop_2441:
	fmovd	%f22,	%f8
loop_2442:
	movrlz	%l4,	0x3E3,	%g4
	sdiv	%i4,	0x099C,	%i2
	bvs,pt	%xcc,	loop_2443
	nop 	! 	tcc	%xcc,	0x2 changed by convert2hboot
	array32	%i1,	%g5,	%g2
	movne	%xcc,	%l6,	%i5
loop_2443:
	fbule	%fcc1,	loop_2444
	fnand	%f30,	%f0,	%f18
	srax	%i7,	%o7,	%o5
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
loop_2444:
	std	%f18,	[%l7 + 0x70]
	mulscc	%g3,	0x0046,	%g7
	movn	%icc,	%g1,	%o6
	bgu,a,pn	%icc,	loop_2445
	addccc	%i0,	0x1EC1,	%o2
	fbg	%fcc1,	loop_2446
	xnor	%i6,	%o0,	%l5
loop_2445:
	move	%xcc,	%o4,	%l0
loop_2446:
	nop 	! 	tsubcctv	%o3,	%g6,	%l3 changed by convert2hboot
	alignaddrl	%i3,	%l2,	%l1
	set	0x11, %i7
	nop	 ! 	ldstuba	[%l7 + %i7] 0x18,	%o1 ASI use changed by convert2hboot
	fbg	%fcc3,	loop_2447
	bg,pt	%icc,	loop_2448
	fpsub32	%f22,	%f18,	%f0
	nop 	! 	taddcc	%l4,	%i4,	%i2 changed by convert2hboot
loop_2447:
	movrlz	%i1,	0x172,	%g5
loop_2448:
	nop 	! 	tsubcc	%g2,	0x1D85,	%g4 changed by convert2hboot
	movneg	%xcc,	%i5,	%l6
	nop
	setx loop_2449, %l0, %l1
	jmpl %l1, %o7
	prefetch	[%l7 + 0x70],	 0x1
	edge8ln	%i7,	%o5,	%g7
	bshuffle	%f26,	%f24,	%f18
loop_2449:
	ldd	[%l7 + 0x58],	%f24
	udivx	%g3,	0x0331,	%o6
	srax	%i0,	%o2,	%g1
	std	%f30,	[%l7 + 0x30]
	stb	%o0,	[%l7 + 0x1D]
	andncc	%l5,	%o4,	%i6
	movrgz	%o3,	%l0,	%l3
	fmovdleu	%xcc,	%f4,	%f25
	subc	%g6,	%l2,	%l1
	xorcc	%o1,	0x1643,	%i3
	fbuge	%fcc3,	loop_2450
	stb	%i4,	[%l7 + 0x64]
	fbue	%fcc2,	loop_2451
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
loop_2450:
	mulx	%i2,	0x1C38,	%i1
	fba	%fcc0,	loop_2452
loop_2451:
	subc	%g5,	0x0396,	%g2
	movcs	%xcc,	%g4,	%l4
	movrlez	%l6,	0x049,	%i5
loop_2452:
	xnorcc	%o7,	%o5,	%i7
	smulcc	%g7,	%o6,	%g3
	fmovsl	%icc,	%f19,	%f20
	fba,a	%fcc0,	loop_2453
	fabsd	%f24,	%f0
	movcs	%xcc,	%i0,	%g1
	movre	%o0,	%l5,	%o2
loop_2453:
	move	%xcc,	%i6,	%o3
	movne	%xcc,	%o4,	%l3
	or	%l0,	0x1B2A,	%g6
	xor	%l2,	%l1,	%o1
	wr	%g0,	0x04,	%asi
	array8	%i2,	%i1,	%g5
	movg	%xcc,	%i3,	%g4
	nop 	! 	taddcctv	%g2,	0x1CBC,	%l6 changed by convert2hboot
	fandnot2s	%f19,	%f23,	%f2
	edge8n	%i5,	%l4,	%o7
	nop 	! 	taddcctv	%o5,	0x0689,	%i7 changed by convert2hboot
	edge32ln	%g7,	%g3,	%i0
	movge	%xcc,	%o6,	%g1
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
	movrlez	%l5,	0x3F2,	%o2
	fzero	%f6
	srl	%i6,	%o3,	%o4
	udivx	%o0,	0x00F3,	%l3
	smulcc	%l0,	%l2,	%l1
	set	0x30, %l5
	nop	 ! 	stba	%g6,	[%l7 + %l5] 0x2b ASI use changed by convert2hboot
	membar	#Sync
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	fbn,a	%fcc3,	loop_2454
	orcc	%i4,	%o1,	%i2
	movl	%icc,	%i1,	%g5
	wr	%g0,	0x18,	%asi
	sta	%f8,	[%l7 + 0x64] %asi
loop_2454:
	movge	%icc,	%g4,	%g2
	addccc	%l6,	%i5,	%i3
	brz	%o7,	loop_2455
	fornot1	%f6,	%f24,	%f2
	edge8	%o5,	%i7,	%l4
	addccc	%g3,	0x0F85,	%i0
loop_2455:
	xnor	%o6,	%g1,	%g7
	array32	%l5,	%o2,	%o3
	movle	%xcc,	%o4,	%o0
	fcmpne32	%f24,	%f0,	%i6
	alignaddrl	%l0,	%l2,	%l3
	set	0x70, %o5
	nop	 ! 	ldxa	[%l7 + %o5] 0x18,	%l1 ASI use changed by convert2hboot
	fmovsg	%icc,	%f20,	%f22
	movrne	%i4,	0x061,	%o1
	wr	%g0,	0x80,	%asi
	edge32ln	%i2,	%i1,	%g4
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	fbo,a	%fcc2,	loop_2456
	bl,a	loop_2457
	bgu	%xcc,	loop_2458
	srax	%g2,	0x04,	%l6
loop_2456:
	fmovdvc	%xcc,	%f28,	%f0
loop_2457:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2458:
	nop 	! 	tcs	%xcc,	0x4 changed by convert2hboot
	sll	%i5,	0x00,	%i3
	movrlz	%g5,	%o5,	%i7
	andcc	%l4,	%g3,	%o7
	fmovs	%f24,	%f0
	std	%f6,	[%l7 + 0x10]
	movcc	%xcc,	%i0,	%o6
	fsrc1	%f28,	%f6
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
	move	%xcc,	%g1,	%g7
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	xorcc	%o2,	0x1309,	%o3
	edge8	%o4,	%o0,	%i6
	set	0x2E, %o3
	nop	 ! 	ldstuba	[%l7 + %o3] 0x04,	%l0 ASI use changed by convert2hboot
	andn	%l5,	%l3,	%l2
	flush	%l7 + 0x44
	membar	0x5F
	xnorcc	%i4,	0x13AC,	%o1
	bleu,a,pt	%xcc,	loop_2459
	fnegs	%f25,	%f5
	brgez	%g6,	loop_2460
	sdivx	%i2,	0x0640,	%l1
loop_2459:
	xnorcc	%i1,	0x0079,	%g4
	nop
	set	0x2C, %i1
	ldsw	[%l7 + %i1],	%g2
loop_2460:
	edge32	%l6,	%i3,	%i5
	udivx	%g5,	0x12C4,	%i7
	edge32	%l4,	%g3,	%o5
	udiv	%o7,	0x1222,	%o6
	edge16ln	%g1,	%i0,	%o2
	edge32n	%o3,	%g7,	%o4
	fpsub32	%f20,	%f4,	%f30
	popc	%i6,	%o0
	fornot2	%f8,	%f20,	%f20
	addccc	%l5,	%l0,	%l3
	xorcc	%l2,	0x0BC3,	%o1
	edge8	%i4,	%g6,	%i2
	fnot2s	%f15,	%f17
	subcc	%i1,	%l1,	%g2
	nop 	! 	tvs	%icc,	0x5 changed by convert2hboot
	umulcc	%l6,	0x0288,	%i3
	lduh	[%l7 + 0x76],	%g4
	movleu	%icc,	%i5,	%i7
	nop 	! 	te	%icc,	0x3 changed by convert2hboot
	wr	%g0,	0x11,	%asi
	wr	%g0,	0x19,	%asi
	fmovsge	%icc,	%f0,	%f8
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	set	0x62, %g1
	nop	 ! 	lduba	[%l7 + %g1] 0x10,	%o5 ASI use changed by convert2hboot
	orncc	%l4,	0x0B1A,	%o7
	movpos	%icc,	%g1,	%o6
	srl	%o2,	0x0C,	%o3
	mulscc	%i0,	%g7,	%i6
	fble	%fcc1,	loop_2461
	srlx	%o0,	%l5,	%l0
	popc	%o4,	%l3
	addc	%o1,	0x1065,	%l2
loop_2461:
	nop
	wr	%g0,	0x23,	%asi
	membar	#Sync
	andncc	%i2,	%i4,	%l1
	set	0x54, %g5
	nop	 ! 	stwa	%g2,	[%l7 + %g5] 0xeb ASI use changed by convert2hboot
	membar	#Sync
	brgz	%l6,	loop_2462
	xnorcc	%i1,	%g4,	%i5
	andcc	%i7,	%i3,	%g5
	array16	%o5,	%g3,	%l4
loop_2462:
	srax	%g1,	%o7,	%o6
	xnor	%o3,	%o2,	%i0
	movcs	%xcc,	%g7,	%i6
	set	0x10, %o1
	nop	 ! 	prefetcha	[%l7 + %o1] 0x80,	 0x0 ASI use changed by convert2hboot
	nop
	setx	loop_2463,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movvs	%xcc,	%o0,	%o4
	udivcc	%l3,	0x05E4,	%o1
	addcc	%l0,	%l2,	%g6
loop_2463:
	fxnor	%f26,	%f8,	%f22
	nop 	! 	sir	0x05A4 changed by convert2hboot
	bge,a	%icc,	loop_2464
	edge8ln	%i4,	%i2,	%l1
	nop
	setx	loop_2465,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movg	%icc,	%l6,	%g2
loop_2464:
	bg	loop_2466
	fone	%f2
loop_2465:
	fmuld8sux16	%f8,	%f17,	%f24
	add	%g4,	0x0FC6,	%i1
loop_2466:
	orcc	%i5,	0x126F,	%i3
	std	%i6,	[%l7 + 0x20]
	sll	%o5,	0x06,	%g5
	sllx	%l4,	%g3,	%g1
	xorcc	%o6,	%o7,	%o3
	orn	%i0,	%o2,	%g7
	edge32n	%l5,	%i6,	%o4
	fbl	%fcc3,	loop_2467
	fornot1s	%f13,	%f31,	%f14
	nop 	! 	tsubcctv	%o0,	0x0198,	%l3 changed by convert2hboot
	movne	%icc,	%o1,	%l0
loop_2467:
	bn,a,pn	%icc,	loop_2468
	sethi	0x1910,	%l2
	subccc	%g6,	0x19C1,	%i4
	ldd	[%l7 + 0x38],	%l0
loop_2468:
	smulcc	%i2,	0x1521,	%g2
	fbuge	%fcc1,	loop_2469
	addc	%l6,	0x1C0E,	%i1
	sdivx	%i5,	0x0F8F,	%i3
	orn	%g4,	0x0C22,	%i7
loop_2469:
	nop 	! 	tsubcctv	%o5,	0x1B35,	%g5 changed by convert2hboot
	brlez,a	%g3,	loop_2470
	addcc	%g1,	0x1161,	%l4
	wr	%g0,	0x19,	%asi
loop_2470:
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	wr	%g0,	0x22,	%asi
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%o7,	%i0,	%g7
	nop 	! 	taddcctv	%l5,	0x02BB,	%o2 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	sta	%f27,	[%l7 + 0x58] %asi
	array32	%i6,	%o0,	%l3
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
	fbn,a	%fcc2,	loop_2471
	andcc	%o1,	%l0,	%l2
	move	%icc,	%o4,	%g6
	movrlz	%l1,	%i2,	%i4
loop_2471:
	sra	%l6,	0x0B,	%i1
	addccc	%g2,	%i3,	%i5
	fzero	%f18
	set	0x5A, %o4
	nop	 ! 	ldstuba	[%l7 + %o4] 0x80,	%i7 ASI use changed by convert2hboot
	fpadd16s	%f30,	%f30,	%f16
	udivcc	%o5,	0x05B0,	%g4
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	srl	%g3,	0x10,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x68],	%g1
	brz	%o6,	loop_2472
	and	%l4,	%o7,	%i0
	movvc	%xcc,	%o3,	%g7
	edge8	%o2,	%l5,	%i6
loop_2472:
	bl	%xcc,	loop_2473
	fmovrdne	%l3,	%f6,	%f24
	smul	%o0,	%o1,	%l2
	bvc,a,pn	%xcc,	loop_2474
loop_2473:
	edge32	%o4,	%l0,	%g6
	fandnot2	%f2,	%f22,	%f10
	sth	%i2,	[%l7 + 0x26]
loop_2474:
	popc	0x0444,	%l1
	sdivcc	%l6,	0x02E8,	%i1
	flush	%l7 + 0x38
	srax	%g2,	0x1B,	%i3
	movrlz	%i5,	%i7,	%o5
	array8	%i4,	%g3,	%g4
	stb	%g1,	[%l7 + 0x56]
	fmovsgu	%xcc,	%f29,	%f18
	nop 	! 	tl	%icc,	0x5 changed by convert2hboot
	fpadd16	%f26,	%f18,	%f12
	swap	[%l7 + 0x64],	%o6
	fmovrde	%l4,	%f22,	%f30
	bn,a	loop_2475
	movge	%icc,	%o7,	%i0
	bcs,a,pt	%xcc,	loop_2476
	addc	%o3,	0x050B,	%g7
loop_2475:
	smul	%o2,	%g5,	%i6
	fnot1	%f8,	%f24
loop_2476:
	nop
	set	0x60, %g7
	nop	 ! 	ldxa	[%l7 + %g7] 0x19,	%l3 ASI use changed by convert2hboot
	addcc	%l5,	0x1055,	%o1
	smul	%l2,	%o0,	%l0
	add	%g6,	0x1AC4,	%o4
	fones	%f0
	fmovdleu	%xcc,	%f14,	%f30
	movne	%icc,	%l1,	%i2
	movg	%icc,	%i1,	%g2
	fxnors	%f3,	%f8,	%f21
	nop
	setx	loop_2477,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc0,	%f8,	%f18
	srl	%l6,	0x19,	%i3
loop_2477:
	andcc	%i5,	%o5,	%i4
	srl	%i7,	0x1E,	%g4
	srl	%g1,	0x02,	%o6
	movrgz	%l4,	%g3,	%i0
	sdivx	%o3,	0x10C5,	%g7
	nop
	set	0x28, %l2
	stx	%o7,	[%l7 + %l2]
	srax	%o2,	%i6,	%l3
	nop 	! 	tvs	%xcc,	0x6 changed by convert2hboot
	sdivcc	%g5,	0x010A,	%o1
	smul	%l2,	0x06EF,	%o0
	xnorcc	%l5,	%l0,	%g6
	subc	%o4,	0x009A,	%l1
	swap	[%l7 + 0x54],	%i2
	nop 	! 	taddcc	%i1,	0x13B7,	%g2 changed by convert2hboot
	fmovdcc	%xcc,	%f17,	%f4
	wr	%g0,	0x89,	%asi
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	brlz,a	%i3,	loop_2478
	fbne,a	%fcc1,	loop_2479
	udivx	%o5,	0x09D1,	%i4
	lduw	[%l7 + 0x78],	%i7
loop_2478:
	fandnot1	%f24,	%f28,	%f16
loop_2479:
	nop
	set	0x18, %l3
	nop	 ! 	stxa	%i5,	[%l7 + %l3] 0xeb ASI use changed by convert2hboot
	membar	#Sync
	movcs	%icc,	%g1,	%g4
	set	0x48, %g2
	nop	 ! 	swapa	[%l7 + %g2] 0x10,	%o6 ASI use changed by convert2hboot
	std	%g2,	[%l7 + 0x30]
	movrgez	%l4,	0x0D5,	%i0
	ldsb	[%l7 + 0x7F],	%o3
	movrne	%g7,	%o2,	%i6
	fone	%f16
	bge	loop_2480
	movvs	%icc,	%l3,	%o7
	nop 	! 	tsubcctv	%g5,	%o1,	%o0 changed by convert2hboot
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
loop_2480:
	subcc	%l5,	0x1C6A,	%l0
	bvs,a,pn	%xcc,	loop_2481
	subc	%l2,	0x15B2,	%g6
	lduh	[%l7 + 0x2E],	%o4
	udiv	%i2,	0x19D8,	%i1
loop_2481:
	andcc	%g2,	%l1,	%i3
	fnands	%f23,	%f9,	%f4
	edge8ln	%l6,	%o5,	%i4
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	brnz,a	%i7,	loop_2482
	nop 	! 	tsubcc	%g1,	%i5,	%g4 changed by convert2hboot
	edge32n	%g3,	%l4,	%o6
	movrgz	%i0,	0x1EF,	%o3
loop_2482:
	fabss	%f29,	%f12
	brgz,a	%g7,	loop_2483
	array32	%o2,	%l3,	%i6
	movcc	%xcc,	%g5,	%o1
	brlez,a	%o0,	loop_2484
loop_2483:
	orcc	%l5,	0x105A,	%l0
	umulcc	%o7,	%g6,	%o4
	wr	%g0,	0x10,	%asi
loop_2484:
	nop
	set	0x40, %g4
	std	%f0,	[%l7 + %g4]
	bvc	%xcc,	loop_2485
	subccc	%i1,	0x05DA,	%g2
	umul	%l2,	0x0A12,	%l1
	smulcc	%l6,	%o5,	%i4
loop_2485:
	fmovdge	%icc,	%f5,	%f7
	mulx	%i7,	0x01E5,	%g1
	edge8n	%i5,	%g4,	%g3
	ldsh	[%l7 + 0x50],	%i3
	orn	%o6,	0x01F8,	%l4
	edge32ln	%o3,	%i0,	%o2
	orncc	%l3,	0x1148,	%i6
	nop 	! 	tleu	%icc,	0x7 changed by convert2hboot
	movcs	%xcc,	%g7,	%o1
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
	move	%xcc,	%g5,	%o0
	fbne,a	%fcc2,	loop_2486
	xor	%l5,	%o7,	%g6
	mova	%xcc,	%o4,	%i2
	udiv	%i1,	0x069B,	%l0
loop_2486:
	brgez,a	%l2,	loop_2487
	edge16	%g2,	%l6,	%l1
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	fmovsle	%xcc,	%f29,	%f6
loop_2487:
	orcc	%o5,	0x156E,	%i4
	fpack16	%f14,	%f1
	fmovdne	%xcc,	%f14,	%f9
	edge8ln	%i7,	%g1,	%i5
	xnor	%g4,	%i3,	%o6
	fmovdvc	%icc,	%f21,	%f22
	fmovdcs	%icc,	%f3,	%f4
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	and	%l4,	0x14CD,	%o3
	flush	%l7 + 0x0C
	edge8	%i0,	%o2,	%g3
	wr	%g0,	0x89,	%asi
	movn	%xcc,	%g7,	%o1
	alignaddrl	%i6,	%o0,	%l5
	smulcc	%o7,	%g5,	%o4
	edge16n	%i2,	%i1,	%g6
	fmovrdne	%l0,	%f12,	%f8
	umul	%g2,	0x165D,	%l6
	edge16n	%l1,	%o5,	%l2
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	std	%i4,	[%l7 + 0x10]
	nop
	set	0x3E, %l0
	ldstub	[%l7 + %l0],	%g1
	fzero	%f2
	udivx	%i7,	0x1849,	%i5
	movcs	%icc,	%g4,	%o6
	nop 	! 	tsubcctv	%l4,	0x1CD6,	%o3 changed by convert2hboot
	orn	%i3,	%o2,	%g3
	fpadd16	%f22,	%f28,	%f24
	wr	%g0,	0x10,	%asi
	edge16l	%g7,	%i0,	%o1
	movcs	%icc,	%i6,	%o0
	udivcc	%o7,	0x14EC,	%l5
	brlz,a	%g5,	loop_2488
	movne	%xcc,	%i2,	%o4
	fmovdle	%icc,	%f7,	%f4
	bleu,a,pn	%icc,	loop_2489
loop_2488:
	lduh	[%l7 + 0x24],	%i1
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	lduh	[%l7 + 0x64],	%l0
loop_2489:
	fmovrdlez	%g6,	%f14,	%f0
	orncc	%l6,	%g2,	%o5
	movvs	%xcc,	%l1,	%l2
	edge8n	%i4,	%i7,	%i5
	movl	%xcc,	%g1,	%g4
	wr	%g0,	0x22,	%asi
	membar	#Sync
	edge16n	%o6,	%i3,	%o3
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	array32	%g3,	%o2,	%g7
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	fmovda	%icc,	%f9,	%f14
	alignaddr	%i0,	%o1,	%i6
	fbo	%fcc1,	loop_2490
	mova	%icc,	%o0,	%o7
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	edge32ln	%l5,	%g5,	%i2
loop_2490:
	fsrc1s	%f12,	%f26
	nop 	! 	tle	%icc,	0x2 changed by convert2hboot
	srl	%o4,	0x0D,	%i1
	movleu	%icc,	%l0,	%g6
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%l3,	%g2
	movge	%xcc,	%o5,	%l1
	movgu	%icc,	%l6,	%l2
	fmovsvs	%icc,	%f3,	%f8
	fmovsneg	%icc,	%f20,	%f10
	ldsb	[%l7 + 0x29],	%i4
	fbule	%fcc0,	loop_2491
	movn	%icc,	%i7,	%g1
	set	0x18, %o0
	nop	 ! 	stxa	%g4,	[%l7 + %o0] 0x19 ASI use changed by convert2hboot
loop_2491:
	sdivcc	%l4,	0x1FCD,	%o6
	fmovdneg	%xcc,	%f7,	%f28
	movcc	%icc,	%i5,	%i3
	fmovse	%icc,	%f3,	%f25
	wr	%g0,	0x22,	%asi
	membar	#Sync
	nop 	! 	tneg	%xcc,	0x7 changed by convert2hboot
	fmul8x16al	%f24,	%f9,	%f14
	fmovsn	%xcc,	%f4,	%f27
	movrne	%o2,	%g3,	%i0
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	movvc	%icc,	%o1,	%i6
	fbg,a	%fcc1,	loop_2492
	nop 	! 	tsubcc	%g7,	0x0462,	%o0 changed by convert2hboot
	fpadd16s	%f6,	%f2,	%f15
	nop 	! 	te	%icc,	0x3 changed by convert2hboot
loop_2492:
	udivcc	%l5,	0x1EA4,	%g5
	edge16ln	%o7,	%o4,	%i1
	nop
	set	0x68, %o2
	prefetch	[%l7 + %o2],	 0x1
	movle	%xcc,	%i2,	%g6
	set	0x40, %o6
	nop	 ! 	ldsha	[%l7 + %o6] 0x14,	%l3 ASI use changed by convert2hboot
	srax	%l0,	%o5,	%g2
	ba,a	loop_2493
	edge32n	%l1,	%l6,	%l2
	sub	%i4,	%i7,	%g4
	ba,a	loop_2494
loop_2493:
	subccc	%l4,	%o6,	%g1
	ldstub	[%l7 + 0x3E],	%i3
	set	0x7C, %l4
	nop	 ! 	lduba	[%l7 + %l4] 0x11,	%i5 ASI use changed by convert2hboot
loop_2494:
	fmovdleu	%icc,	%f19,	%f25
	addc	%o3,	%g3,	%i0
	membar	0x0B
	for	%f12,	%f4,	%f30
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	orncc	%g7,	%o2,	%l5
	edge32n	%g5,	%o7,	%o0
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
	fmovsge	%xcc,	%f11,	%f6
	ldsb	[%l7 + 0x5E],	%o4
	fbule	%fcc2,	loop_2495
	movne	%xcc,	%i1,	%i2
	sethi	0x1AA0,	%l3
	popc	0x0B64,	%l0
loop_2495:
	alignaddr	%o5,	%g6,	%g2
	wr	%g0,	0xe3,	%asi
	membar	#Sync
	fnot1	%f30,	%f2
	nop 	! 	tl	%xcc,	0x7 changed by convert2hboot
	fmovdcc	%icc,	%f30,	%f14
	movle	%xcc,	%l2,	%l6
	edge16	%i4,	%i7,	%g4
	subcc	%o6,	0x0265,	%l4
	fmuld8ulx16	%f4,	%f7,	%f2
	movcc	%icc,	%i3,	%i5
	set	0x38, %i4
	nop	 ! 	ldswa	[%l7 + %i4] 0x80,	%g1 ASI use changed by convert2hboot
	movvc	%xcc,	%o3,	%i0
	smulcc	%g3,	0x13EB,	%i6
	movrne	%g7,	0x3E3,	%o2
	fblg	%fcc2,	loop_2496
	addcc	%l5,	%g5,	%o7
	fandnot1	%f28,	%f0,	%f12
	srl	%o0,	%o4,	%i1
loop_2496:
	membar	0x50
	fmul8x16au	%f6,	%f20,	%f10
	sdivx	%o1,	0x186C,	%l3
	sdiv	%i2,	0x0C76,	%l0
	edge32n	%o5,	%g6,	%l1
	array8	%l2,	%g2,	%l6
	fmovdle	%xcc,	%f12,	%f28
	sdivcc	%i7,	0x0347,	%g4
	nop 	! 	taddcc	%i4,	%o6,	%l4 changed by convert2hboot
	ldd	[%l7 + 0x28],	%f22
	fmovdn	%icc,	%f28,	%f30
	mova	%xcc,	%i3,	%g1
	nop 	! 	tl	%xcc,	0x2 changed by convert2hboot
	movl	%xcc,	%o3,	%i0
	orn	%i5,	0x0763,	%i6
	movcs	%xcc,	%g7,	%g3
	wr	%g0,	0x19,	%asi
	smul	%o2,	%o7,	%g5
	srlx	%o4,	%o0,	%i1
	edge8l	%o1,	%l3,	%i2
	ldd	[%l7 + 0x68],	%f2
	movne	%xcc,	%o5,	%g6
	nop 	! 	tsubcctv	%l1,	%l0,	%l2 changed by convert2hboot
	fnot2	%f20,	%f18
	movrgz	%g2,	%l6,	%g4
	ble	%xcc,	loop_2497
	fmovsn	%xcc,	%f0,	%f5
	fpadd16	%f24,	%f22,	%f22
	wr	%g0,	0x18,	%asi
	sta	%f9,	[%l7 + 0x2C] %asi
loop_2497:
	fandnot2	%f2,	%f4,	%f6
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	edge16ln	%i4,	%o6,	%i7
	sllx	%i3,	0x17,	%g1
	bl,a	loop_2498
	fmovdneg	%xcc,	%f6,	%f21
	array16	%l4,	%o3,	%i5
	bneg,a,pn	%xcc,	loop_2499
loop_2498:
	edge16l	%i6,	%g7,	%g3
	movrgez	%i0,	%l5,	%o2
	brlez,a	%o7,	loop_2500
loop_2499:
	fbo,a	%fcc0,	loop_2501
	movle	%icc,	%g5,	%o4
	movleu	%icc,	%i1,	%o0
loop_2500:
	fnor	%f16,	%f30,	%f24
loop_2501:
	subc	%o1,	%i2,	%l3
	fornot2s	%f23,	%f9,	%f18
	bcs,a,pt	%xcc,	loop_2502
	bgu,pn	%icc,	loop_2503
	nop 	! 	tsubcctv	%g6,	0x144C,	%l1 changed by convert2hboot
	fandnot1s	%f4,	%f28,	%f2
loop_2502:
	bge	loop_2504
loop_2503:
	edge8n	%o5,	%l2,	%l0
	sll	%l6,	%g2,	%i4
	fbe,a	%fcc1,	loop_2505
loop_2504:
	fmovrdlez	%o6,	%f4,	%f0
	movvc	%icc,	%i7,	%g4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	nop	 ! 	casa	[%l6] 0x89,	%i3,	%g1 ASI use changed by convert2hboot
loop_2505:
	edge32l	%l4,	%i5,	%i6
	nop 	! 	tle	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
	fmovdg	%icc,	%f0,	%f21
	fsrc1	%f28,	%f2
	array8	%o3,	%g3,	%i0
	udivcc	%l5,	0x0A11,	%g7
	set	0x78, %l6
	nop	 ! 	stxa	%o2,	[%l7 + %l6] 0x23 ASI use changed by convert2hboot
	membar	#Sync
	udiv	%g5,	0x0044,	%o4
	andn	%i1,	%o0,	%o7
	brgz	%o1,	loop_2506
	movrgez	%l3,	0x3A8,	%i2
	fblg	%fcc1,	loop_2507
	ldstub	[%l7 + 0x79],	%g6
loop_2506:
	nop 	! 	sir	0x1616 changed by convert2hboot
	add	%o5,	0x0A82,	%l2
loop_2507:
	nop 	! 	tsubcctv	%l1,	0x171F,	%l6 changed by convert2hboot
	fbu	%fcc2,	loop_2508
	fxnors	%f7,	%f26,	%f15
	fnands	%f2,	%f27,	%f22
	fcmps	%fcc3,	%f15,	%f6
loop_2508:
	nop 	! 	sir	0x0167 changed by convert2hboot
	addcc	%l0,	%g2,	%i4
	and	%i7,	0x1642,	%g4
	fmovspos	%icc,	%f20,	%f22
	sra	%i3,	0x04,	%g1
	fmovrsgz	%l4,	%f26,	%f16
	movrne	%i5,	%o6,	%i6
	wr	%g0,	0x89,	%asi
	ldstub	[%l7 + 0x35],	%i0
	fnor	%f14,	%f20,	%f10
	addc	%g3,	0x133A,	%l5
	srl	%o2,	0x0E,	%g7
	fmovsvs	%icc,	%f18,	%f31
	umulcc	%o4,	0x051E,	%g5
	sra	%o0,	0x10,	%i1
	movrne	%o1,	%l3,	%i2
	fmovrde	%o7,	%f12,	%f18
	fcmpes	%fcc3,	%f16,	%f0
	fmovsgu	%xcc,	%f2,	%f20
	movne	%xcc,	%g6,	%o5
	udiv	%l2,	0x0CD1,	%l1
	movge	%xcc,	%l6,	%l0
	edge8l	%i4,	%g2,	%i7
	movrgz	%g4,	%i3,	%l4
	fcmpne32	%f26,	%f14,	%g1
	movle	%xcc,	%i5,	%i6
	fxnor	%f18,	%f2,	%f10
	nop
	set	0x1B, %i3
	ldsb	[%l7 + %i3],	%o3
	sethi	0x162B,	%i0
	set	0x2C, %i2
	nop	 ! 	lduwa	[%l7 + %i2] 0x04,	%g3 ASI use changed by convert2hboot
	movl	%icc,	%l5,	%o2
	nop
	setx loop_2509, %l0, %l1
	jmpl %l1, %o6
	subcc	%g7,	0x0C0D,	%g5
	fmovsvc	%icc,	%f4,	%f10
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
loop_2509:
	fbne	%fcc2,	loop_2510
	srlx	%o4,	%i1,	%o1
	swap	[%l7 + 0x40],	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2510:
	fblg,a	%fcc2,	loop_2511
	fmovrdgez	%i2,	%f2,	%f6
	umul	%o7,	%g6,	%o0
	array32	%l2,	%l1,	%o5
loop_2511:
	sll	%l0,	%i4,	%l6
	addc	%g2,	%g4,	%i3
	fbul,a	%fcc3,	loop_2512
	and	%l4,	0x0269,	%g1
	andn	%i7,	%i6,	%o3
	movne	%icc,	%i5,	%i0
loop_2512:
	mulx	%l5,	%o2,	%g3
	prefetch	[%l7 + 0x60],	 0x0
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	sdiv	%g5,	0x16E4,	%o4
	edge8l	%i1,	%o1,	%g7
	bg,a	loop_2513
	sdivcc	%i2,	0x1B56,	%l3
	wr	%g0,	0x80,	%asi
loop_2513:
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	fmovscc	%xcc,	%f28,	%f28
	fcmps	%fcc1,	%f31,	%f1
	edge8n	%o0,	%o7,	%l2
	edge32l	%l1,	%l0,	%i4
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	st	%f26,	[%l7 + 0x4C]
	wr	%g0,	0x04,	%asi
	wr	%g0,	0x89,	%asi
	smulcc	%g4,	0x0AAA,	%i3
	movne	%xcc,	%o5,	%g1
	movn	%xcc,	%l4,	%i7
	nop 	! 	tcs	%icc,	0x6 changed by convert2hboot
	movl	%xcc,	%i6,	%i5
	fornot1s	%f11,	%f13,	%f0
	edge8n	%o3,	%i0,	%l5
	movvs	%xcc,	%g3,	%o2
	fabss	%f7,	%f31
	fbne	%fcc1,	loop_2514
	orncc	%o6,	%g5,	%o4
	orn	%i1,	0x0FD3,	%o1
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
loop_2514:
	membar	0x5F
	nop 	! 	tne	%xcc,	0x3 changed by convert2hboot
	edge32l	%g7,	%i2,	%g6
	edge16n	%l3,	%o0,	%o7
	fmovrslz	%l1,	%f0,	%f8
	lduw	[%l7 + 0x3C],	%l2
	nop 	! 	tl	%icc,	0x6 changed by convert2hboot
	add	%i4,	0x0826,	%l0
	sdivcc	%l6,	0x1A13,	%g4
	movneg	%icc,	%g2,	%o5
	fbn	%fcc3,	loop_2515
	movne	%icc,	%i3,	%g1
	fpackfix	%f2,	%f11
	fmuld8ulx16	%f8,	%f21,	%f4
loop_2515:
	fornot2	%f22,	%f20,	%f28
	fblg	%fcc1,	loop_2516
	bgu,a	loop_2517
	ldsb	[%l7 + 0x7E],	%i7
loop_2516:
	movle	%icc,	%i6,	%l4
loop_2517:
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
	movg	%icc,	%o3,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge	%fcc3,	loop_2518
	movrgez	%l5,	%g3,	%o2
	brnz	%o6,	loop_2519
	orncc	%i0,	0x0FAE,	%g5
loop_2518:
	edge8l	%o4,	%o1,	%g7
	fpackfix	%f10,	%f8
loop_2519:
	movgu	%icc,	%i2,	%g6
	brnz	%i1,	loop_2520
	membar	0x71
	fmovdgu	%icc,	%f18,	%f25
	nop 	! 	tl	%icc,	0x5 changed by convert2hboot
loop_2520:
	sub	%l3,	0x1E74,	%o0
	sethi	0x01BB,	%o7
	bg,pt	%xcc,	loop_2521
	nop 	! 	tpos	%icc,	0x6 changed by convert2hboot
	orn	%l2,	0x041C,	%l1
	fble	%fcc3,	loop_2522
loop_2521:
	fornot1s	%f3,	%f24,	%f7
	fabsd	%f22,	%f24
	nop
	set	0x74, %i0
	stw	%i4,	[%l7 + %i0]
loop_2522:
	stb	%l0,	[%l7 + 0x11]
	sth	%l6,	[%l7 + 0x62]
	mulscc	%g4,	%g2,	%o5
	orn	%g1,	0x07E0,	%i7
	call	loop_2523
	edge16l	%i6,	%l4,	%o3
	fpsub32s	%f16,	%f1,	%f19
	nop
	setx loop_2524, %l0, %l1
	jmpl %l1, %i3
loop_2523:
	fmovrde	%l5,	%f6,	%f4
	fbe,a	%fcc2,	loop_2525
	fcmped	%fcc0,	%f12,	%f18
loop_2524:
	orcc	%g3,	0x00E1,	%o2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i5
	nop	 ! 	casa	[%l6] 0x11,	%i5,	%o6 ASI use changed by convert2hboot
loop_2525:
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	fmovdleu	%xcc,	%f6,	%f13
	wr	%g0,	0x11,	%asi
	fbne	%fcc0,	loop_2526
	fabsd	%f30,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x81,	%asi
loop_2526:
	nop
	wr	%g0,	0x19,	%asi
	orn	%o4,	%o1,	%g5
	movg	%icc,	%i2,	%g7
	fmovdn	%icc,	%f12,	%f26
	edge16l	%g6,	%i1,	%o0
	wr	%g0,	0x80,	%asi
	sta	%f27,	[%l7 + 0x40] %asi
	addc	%o7,	%l2,	%l3
	umulcc	%i4,	%l0,	%l6
	edge32ln	%l1,	%g4,	%g2
	sdivcc	%g1,	0x02FF,	%i7
	ldstub	[%l7 + 0x6D],	%i6
	fzero	%f18
	set	0x7C, %g3
	nop	 ! 	stwa	%l4,	[%l7 + %g3] 0xe2 ASI use changed by convert2hboot
	membar	#Sync
	fmovdgu	%xcc,	%f17,	%f31
	fmovsn	%icc,	%f1,	%f1
	fbug	%fcc1,	loop_2527
	fmovsl	%xcc,	%f1,	%f14
	sub	%o5,	0x0FD2,	%o3
	bcs,a	%xcc,	loop_2528
loop_2527:
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	fmul8ulx16	%f14,	%f16,	%f4
	fnot1	%f18,	%f0
loop_2528:
	nop 	! 	tneg	%icc,	0x5 changed by convert2hboot
	wr	%g0,	0x17,	%asi
	membar	#Sync
	smul	%i3,	0x1F4C,	%l5
	movge	%icc,	%g3,	%o2
	edge32ln	%i5,	%o6,	%i0
	fabss	%f9,	%f24
	fmovsle	%xcc,	%f24,	%f0
	fornot1s	%f13,	%f0,	%f20
	fcmpeq16	%f20,	%f14,	%o4
	srl	%g5,	%o1,	%g7
	edge16n	%i2,	%g6,	%i1
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
	movneg	%xcc,	%o7,	%l2
	edge8l	%o0,	%i4,	%l3
	set	0x12, %i6
	nop	 ! 	stba	%l0,	[%l7 + %i6] 0xeb ASI use changed by convert2hboot
	membar	#Sync
	andcc	%l6,	0x11AB,	%g4
	set	0x68, %i5
	nop	 ! 	ldxa	[%l7 + %i5] 0x14,	%g2 ASI use changed by convert2hboot
	movrlez	%l1,	0x05F,	%i7
	movre	%i6,	%g1,	%l4
	subc	%o5,	0x17DE,	%i3
	movle	%icc,	%o3,	%g3
	fmovsneg	%icc,	%f4,	%f2
	orn	%o2,	0x0EF5,	%l5
	nop 	! 	tleu	%xcc,	0x6 changed by convert2hboot
	xnor	%o6,	%i0,	%i5
	brgez,a	%g5,	loop_2529
	subc	%o1,	0x0E20,	%o4
	stb	%i2,	[%l7 + 0x69]
	movvc	%xcc,	%g6,	%g7
loop_2529:
	nop 	! 	tge	%xcc,	0x1 changed by convert2hboot
	subcc	%o7,	%l2,	%o0
	edge16n	%i1,	%l3,	%l0
	bneg,pt	%xcc,	loop_2530
	andncc	%l6,	%g4,	%g2
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
loop_2530:
	fbue,a	%fcc3,	loop_2531
	addccc	%l1,	%i7,	%i4
	mulscc	%i6,	0x05B8,	%g1
	sth	%o5,	[%l7 + 0x18]
loop_2531:
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	edge16	%i3,	%l4,	%g3
	movre	%o2,	%o3,	%o6
	array16	%l5,	%i0,	%g5
	fmovrdgez	%i5,	%f6,	%f20
	movneg	%xcc,	%o1,	%o4
	sllx	%g6,	%i2,	%o7
	movle	%icc,	%l2,	%g7
	fxors	%f19,	%f20,	%f31
	mulscc	%o0,	0x0A3A,	%l3
	prefetch	[%l7 + 0x68],	 0x1
	movcs	%xcc,	%l0,	%i1
	srl	%l6,	%g2,	%l1
	fors	%f9,	%f14,	%f24
	fmovrdlz	%i7,	%f0,	%f30
	mulx	%i4,	%g4,	%i6
	smulcc	%g1,	%o5,	%i3
	movne	%icc,	%l4,	%g3
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
	and	%o3,	%o2,	%o6
	movne	%xcc,	%i0,	%g5
	movrlz	%i5,	%l5,	%o1
	nop
	set	0x23, %l1
	ldsb	[%l7 + %l1],	%o4
	bge	%icc,	loop_2532
	bcs,a	loop_2533
	movne	%xcc,	%i2,	%g6
	fands	%f22,	%f1,	%f26
loop_2532:
	ldsh	[%l7 + 0x40],	%o7
loop_2533:
	alignaddrl	%g7,	%l2,	%o0
	fbu,a	%fcc3,	loop_2534
	nop
	setx	loop_2535,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	srlx	%l3,	0x0D,	%l0
	brlz,a	%i1,	loop_2536
loop_2534:
	fmovrdne	%l6,	%f18,	%f8
loop_2535:
	be	loop_2537
	movl	%xcc,	%g2,	%l1
loop_2536:
	nop 	! 	taddcc	%i4,	%i7,	%g4 changed by convert2hboot
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	nop	 ! 	casa	[%l6] 0x81,	%g1,	%i6 ASI use changed by convert2hboot
loop_2537:
	nop 	! 	tsubcc	%o5,	0x0761,	%i3 changed by convert2hboot
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
	movgu	%xcc,	%l4,	%o3
	add	%g3,	%o2,	%o6
	fmovsvs	%icc,	%f13,	%f30
	brgez	%i0,	loop_2538
	membar	0x2C
	alignaddrl	%g5,	%i5,	%l5
	sth	%o1,	[%l7 + 0x6A]
loop_2538:
	smul	%o4,	%g6,	%i2
	edge32n	%g7,	%o7,	%o0
	faligndata	%f16,	%f22,	%f22
	popc	%l3,	%l2
	movneg	%xcc,	%i1,	%l0
	fpsub16s	%f4,	%f1,	%f13
	nop 	! 	tne	%xcc,	0x3 changed by convert2hboot
	fpadd32s	%f28,	%f11,	%f12
	subcc	%l6,	0x0C6E,	%g2
	movrne	%i4,	%l1,	%g4
	fxnors	%f12,	%f9,	%f19
	subcc	%g1,	0x0C0A,	%i6
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	xnorcc	%i7,	%i3,	%l4
	add	%o3,	%o5,	%o2
	fones	%f20
	nop 	! 	tl	%xcc,	0x2 changed by convert2hboot
	fmovda	%xcc,	%f20,	%f7
	bpos,a,pn	%xcc,	loop_2539
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	brlez,a	%o6,	loop_2540
	lduh	[%l7 + 0x0E],	%g3
loop_2539:
	subc	%g5,	%i5,	%i0
	nop 	! 	tg	%xcc,	0x0 changed by convert2hboot
loop_2540:
	bshuffle	%f14,	%f26,	%f22
	ldd	[%l7 + 0x60],	%f2
	fmovsn	%xcc,	%f27,	%f24
	fmovsg	%xcc,	%f1,	%f16
	srl	%l5,	0x0D,	%o4
	and	%o1,	%i2,	%g7
	sdiv	%o7,	0x1BA6,	%g6
	set	0x5A, %o7
	nop	 ! 	lduha	[%l7 + %o7] 0x0c,	%l3 ASI use changed by convert2hboot
	add	%o0,	0x0C4B,	%l2
	edge32ln	%i1,	%l0,	%g2
	movleu	%icc,	%i4,	%l1
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
	fmovsne	%icc,	%f12,	%f10
	nop 	! 	tg	%xcc,	0x7 changed by convert2hboot
	mova	%xcc,	%l6,	%g4
	movrgz	%i6,	0x2DF,	%g1
	fmovdg	%xcc,	%f6,	%f22
	fbo,a	%fcc1,	loop_2541
	fmovrdlez	%i7,	%f20,	%f8
	fmovrdgez	%l4,	%f28,	%f16
	movneg	%xcc,	%i3,	%o3
loop_2541:
	nop 	! 	tvs	%icc,	0x1 changed by convert2hboot
	set	0x5D, %g6
	nop	 ! 	ldstuba	[%l7 + %g6] 0x04,	%o2 ASI use changed by convert2hboot
	ba,a	loop_2542
	fmovrslez	%o6,	%f8,	%f0
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
	edge8n	%g3,	%g5,	%o5
loop_2542:
	array8	%i5,	%i0,	%o4
	movvs	%xcc,	%o1,	%l5
	set	0x78, %i7
	nop	 ! 	stxa	%g7,	[%l7 + %i7] 0x19 ASI use changed by convert2hboot
	sub	%o7,	%g6,	%i2
	set	0x20, %l5
	nop	 ! 	ldxa	[%g0 + %l5] 0x20,	%l3 ASI use changed by convert2hboot
	smul	%o0,	%l2,	%l0
	movn	%icc,	%g2,	%i1
	ldsh	[%l7 + 0x28],	%i4
	addc	%l1,	0x04C4,	%l6
	brnz	%g4,	loop_2543
	addccc	%g1,	%i7,	%i6
	movrgz	%i3,	0x29A,	%o3
	set	0x45, %o5
	nop	 ! 	ldstuba	[%l7 + %o5] 0x10,	%l4 ASI use changed by convert2hboot
loop_2543:
	addcc	%o2,	%g3,	%o6
	movgu	%icc,	%o5,	%i5
	fbul	%fcc3,	loop_2544
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
	udivcc	%g5,	0x0941,	%i0
loop_2544:
	fmovdge	%xcc,	%f14,	%f14
	fblg,a	%fcc0,	loop_2545
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
	movn	%icc,	%o4,	%l5
	bne,a	loop_2546
loop_2545:
	bg,pt	%xcc,	loop_2547
	fors	%f1,	%f19,	%f11
	fcmps	%fcc0,	%f7,	%f8
loop_2546:
	smul	%g7,	%o7,	%o1
loop_2547:
	ldd	[%l7 + 0x20],	%g6
	or	%l3,	%i2,	%o0
	srax	%l0,	%l2,	%i1
	movrlz	%g2,	0x17E,	%l1
	ldstub	[%l7 + 0x56],	%i4
	fbo,a	%fcc2,	loop_2548
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
	fbn,a	%fcc3,	loop_2549
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
loop_2548:
	bshuffle	%f14,	%f0,	%f26
	add	%l6,	%g1,	%i7
loop_2549:
	brnz,a	%i6,	loop_2550
	udivcc	%g4,	0x1D82,	%i3
	bshuffle	%f22,	%f24,	%f16
	udivx	%l4,	0x1F31,	%o3
loop_2550:
	nop
	setx	loop_2551,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	ldd	[%l7 + 0x08],	%f12
	edge8l	%o2,	%g3,	%o6
	movle	%xcc,	%o5,	%i5
loop_2551:
	fmovdcc	%icc,	%f1,	%f22
	orncc	%i0,	0x00DA,	%o4
	fba,a	%fcc2,	loop_2552
	movleu	%icc,	%l5,	%g7
	wr	%g0,	0x80,	%asi
loop_2552:
	movcs	%xcc,	%o1,	%o7
	fornot2s	%f22,	%f3,	%f18
	nop
	setx loop_2553, %l0, %l1
	jmpl %l1, %g6
	udivcc	%i2,	0x1460,	%o0
	mova	%icc,	%l0,	%l3
	brlz,a	%i1,	loop_2554
loop_2553:
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	movpos	%xcc,	%l2,	%l1
	call	loop_2555
loop_2554:
	andncc	%i4,	%l6,	%g2
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	movrne	%i7,	%i6,	%g1
loop_2555:
	add	%g4,	%i3,	%l4
	nop 	! 	taddcc	%o2,	0x053C,	%o3 changed by convert2hboot
	or	%g3,	0x0680,	%o5
	srax	%o6,	%i0,	%o4
	fmovsgu	%icc,	%f19,	%f22
	nop 	! 	ta	%icc,	0x2 changed by convert2hboot
	wr	%g0,	0x11,	%asi
	edge16l	%l5,	%i5,	%g7
	for	%f2,	%f16,	%f6
	fcmpeq32	%f16,	%f8,	%o1
	fmovdne	%icc,	%f2,	%f9
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	movrne	%g5,	%o7,	%i2
	udivx	%o0,	0x178F,	%l0
	bpos	%xcc,	loop_2556
	sdivcc	%l3,	0x0F68,	%g6
	fmovsn	%xcc,	%f23,	%f31
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
loop_2556:
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
	set	0x43, %i1
	nop	 ! 	stba	%i1,	[%l7 + %i1] 0x11 ASI use changed by convert2hboot
	ldub	[%l7 + 0x5F],	%l1
	fcmpgt16	%f22,	%f22,	%i4
	or	%l2,	%l6,	%g2
	nop 	! 	tcs	%xcc,	0x5 changed by convert2hboot
	movvs	%xcc,	%i6,	%g1
	set	0x44, %o3
	nop	 ! 	stha	%g4,	[%l7 + %o3] 0x15 ASI use changed by convert2hboot
	wr	%g0,	0x89,	%asi
	fmovsle	%icc,	%f8,	%f18
	srax	%l4,	%o2,	%o3
	movgu	%icc,	%i3,	%o5
	fmovde	%xcc,	%f2,	%f22
	fmovrse	%o6,	%f0,	%f19
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	fmuld8ulx16	%f27,	%f9,	%f0
	fbu,a	%fcc3,	loop_2557
	fandnot2	%f18,	%f2,	%f2
	fnands	%f18,	%f21,	%f20
	xnor	%i0,	%o4,	%l5
loop_2557:
	fmovdcs	%xcc,	%f15,	%f27
	fmovrdlz	%i5,	%f0,	%f26
	fmovda	%icc,	%f16,	%f30
	fbul	%fcc0,	loop_2558
	movrgz	%g7,	0x119,	%g3
	mulscc	%o1,	%o7,	%g5
	array16	%i2,	%o0,	%l3
loop_2558:
	movle	%icc,	%g6,	%i1
	fmovdleu	%xcc,	%f7,	%f15
	fpackfix	%f24,	%f5
	movpos	%icc,	%l0,	%i4
	fcmpd	%fcc3,	%f26,	%f2
	fbue,a	%fcc2,	loop_2559
	prefetch	[%l7 + 0x1C],	 0x3
	fpadd16s	%f21,	%f4,	%f7
	fabss	%f1,	%f12
loop_2559:
	sra	%l1,	0x03,	%l2
	srlx	%g2,	0x11,	%l6
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	xnorcc	%i6,	%g4,	%i7
	alignaddrl	%l4,	%o2,	%o3
	fexpand	%f0,	%f20
	addc	%i3,	%o5,	%o6
	and	%g1,	%o4,	%l5
	andcc	%i0,	%g7,	%g3
	fandnot1	%f12,	%f18,	%f16
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
	alignaddr	%o1,	%i5,	%o7
	sll	%g5,	%o0,	%i2
	alignaddr	%l3,	%g6,	%l0
	movn	%xcc,	%i4,	%l1
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	xor	%l2,	%i1,	%l6
	fbe	%fcc1,	loop_2560
	or	%i6,	%g4,	%g2
	edge16ln	%l4,	%i7,	%o2
	fxors	%f24,	%f6,	%f4
loop_2560:
	edge16l	%i3,	%o3,	%o5
	fandnot2	%f12,	%f8,	%f6
	membar	0x27
	add	%o6,	0x16EF,	%o4
	nop 	! 	tsubcc	%g1,	0x0797,	%i0 changed by convert2hboot
	membar	0x2C
	fmul8x16al	%f14,	%f1,	%f18
	fcmpne32	%f26,	%f4,	%g7
	nop 	! 	tsubcctv	%l5,	0x0CD1,	%g3 changed by convert2hboot
	movg	%xcc,	%o1,	%i5
	fmovdpos	%icc,	%f4,	%f24
	nop 	! 	taddcctv	%o7,	%g5,	%i2 changed by convert2hboot
	fmovd	%f2,	%f0
	movge	%xcc,	%l3,	%o0
	nop 	! 	ta	%xcc,	0x0 changed by convert2hboot
	subcc	%g6,	0x0DE5,	%i4
	std	%l0,	[%l7 + 0x60]
	fmovspos	%icc,	%f26,	%f19
	fmovrdgz	%l2,	%f16,	%f14
	fsrc1s	%f19,	%f23
	movl	%xcc,	%l0,	%l6
	sethi	0x1206,	%i1
	sdiv	%g4,	0x1EF2,	%g2
	sra	%i6,	0x15,	%l4
	ldd	[%l7 + 0x10],	%f20
	movneg	%icc,	%o2,	%i3
	orncc	%i7,	0x0BFE,	%o3
	sdiv	%o6,	0x15A8,	%o4
	orcc	%o5,	0x1EBA,	%i0
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	fnand	%f18,	%f28,	%f10
	stw	%g1,	[%l7 + 0x30]
	fmul8x16au	%f20,	%f6,	%f28
	movpos	%icc,	%l5,	%g7
	fmul8sux16	%f2,	%f24,	%f26
	fpadd32	%f12,	%f14,	%f10
	andn	%g3,	%i5,	%o1
	fmovsg	%icc,	%f21,	%f17
	fand	%f14,	%f8,	%f4
	movleu	%xcc,	%o7,	%i2
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
	fors	%f26,	%f21,	%f24
	edge16n	%g5,	%o0,	%g6
	fornot2s	%f14,	%f13,	%f28
	ldsb	[%l7 + 0x49],	%i4
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	srax	%l1,	0x1F,	%l2
	movcs	%xcc,	%l3,	%l0
	nop 	! 	taddcctv	%l6,	%g4,	%g2 changed by convert2hboot
	fornot2s	%f14,	%f18,	%f4
	nop 	! 	taddcctv	%i1,	0x07B8,	%i6 changed by convert2hboot
	smulcc	%o2,	%l4,	%i7
	nop
	set	0x18, %g5
	ldsb	[%l7 + %g5],	%i3
	fcmpd	%fcc0,	%f28,	%f30
	fpsub32	%f10,	%f22,	%f6
	call	loop_2561
	fmovsne	%xcc,	%f14,	%f20
	movrlz	%o6,	%o3,	%o5
	fpsub16s	%f20,	%f21,	%f2
loop_2561:
	movrlez	%o4,	%i0,	%l5
	brgz,a	%g1,	loop_2562
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	fbg,a	%fcc2,	loop_2563
	bcc,pn	%xcc,	loop_2564
loop_2562:
	or	%g3,	0x0002,	%i5
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
loop_2563:
	sdivcc	%o1,	0x1ABD,	%o7
loop_2564:
	fmul8x16au	%f23,	%f28,	%f0
	bg	%xcc,	loop_2565
	sethi	0x1D32,	%i2
	movpos	%xcc,	%g5,	%g7
	bpos,a,pn	%icc,	loop_2566
loop_2565:
	fbo	%fcc2,	loop_2567
	movrlz	%g6,	%o0,	%l1
	fmul8sux16	%f0,	%f30,	%f16
loop_2566:
	move	%xcc,	%l2,	%i4
loop_2567:
	nop 	! 	tl	%icc,	0x4 changed by convert2hboot
	nop
	setx	loop_2568,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movleu	%xcc,	%l3,	%l6
	brnz,a	%l0,	loop_2569
	edge16n	%g4,	%i1,	%g2
loop_2568:
	stw	%o2,	[%l7 + 0x2C]
	set	0x2B, %o1
	nop	 ! 	lduba	[%l7 + %o1] 0x04,	%i6 ASI use changed by convert2hboot
loop_2569:
	movle	%icc,	%i7,	%i3
	ba	loop_2570
	fbule	%fcc2,	loop_2571
	xnorcc	%o6,	0x1151,	%l4
	ldsh	[%l7 + 0x12],	%o3
loop_2570:
	stx	%o5,	[%l7 + 0x70]
loop_2571:
	movne	%xcc,	%i0,	%l5
	fmuld8ulx16	%f27,	%f17,	%f2
	fpadd32	%f22,	%f14,	%f18
	fpsub16	%f22,	%f28,	%f26
	set	0x30, %o4
	nop	 ! 	prefetcha	[%l7 + %o4] 0x15,	 0x1 ASI use changed by convert2hboot
	fcmpgt32	%f0,	%f12,	%g3
	andncc	%i5,	%o1,	%o7
	fones	%f1
	sub	%i2,	0x04BD,	%o4
	sra	%g7,	%g6,	%g5
	udivcc	%l1,	0x1BE5,	%l2
	fbue	%fcc0,	loop_2572
	fmovrdgz	%i4,	%f8,	%f4
	srlx	%l3,	%l6,	%o0
	wr	%g0,	0x80,	%asi
loop_2572:
	srlx	%g4,	0x04,	%g2
	sub	%i1,	%i6,	%i7
	edge16l	%i3,	%o2,	%o6
	set	0x10, %g1
	nop	 ! 	swapa	[%l7 + %g1] 0x89,	%o3 ASI use changed by convert2hboot
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	fone	%f16
	and	%o5,	0x08CA,	%l4
	pdist	%f30,	%f10,	%f18
	fmovdg	%icc,	%f2,	%f16
	umul	%l5,	%i0,	%g1
	fpadd32s	%f1,	%f4,	%f3
	siam	0x7
	movcs	%icc,	%i5,	%g3
	bcc,pt	%xcc,	loop_2573
	brlez,a	%o1,	loop_2574
	fnot1s	%f10,	%f15
	sub	%i2,	%o7,	%o4
loop_2573:
	movrgz	%g7,	0x0C6,	%g6
loop_2574:
	movre	%l1,	0x313,	%g5
	edge8n	%i4,	%l2,	%l3
	edge16n	%l6,	%o0,	%g4
	umulcc	%g2,	0x0C31,	%l0
	movleu	%xcc,	%i1,	%i6
	edge16ln	%i7,	%i3,	%o6
	nop
	setx	loop_2575,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fpackfix	%f14,	%f9
	std	%o2,	[%l7 + 0x18]
	movl	%icc,	%o3,	%o5
loop_2575:
	nop
	wr	%g0,	0x04,	%asi
	edge32n	%l5,	%g1,	%i5
	faligndata	%f6,	%f14,	%f24
	sra	%g3,	0x1C,	%i0
	bl,pn	%xcc,	loop_2576
	fmovsn	%xcc,	%f2,	%f23
	xor	%i2,	%o7,	%o1
	orn	%g7,	%g6,	%o4
loop_2576:
	edge32ln	%g5,	%i4,	%l1
	fzero	%f8
	edge32n	%l3,	%l6,	%o0
	subccc	%g4,	0x01D6,	%g2
	prefetch	[%l7 + 0x58],	 0x3
	wr	%g0,	0x0c,	%asi
	bge,a,pn	%icc,	loop_2577
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
	fbg,a	%fcc3,	loop_2578
	movcs	%xcc,	%l0,	%i1
loop_2577:
	xnor	%l2,	0x018A,	%i7
	fxnors	%f0,	%f9,	%f3
loop_2578:
	subcc	%i6,	0x084E,	%i3
	nop 	! 	tge	%icc,	0x2 changed by convert2hboot
	fblg,a	%fcc0,	loop_2579
	addcc	%o6,	0x0436,	%o3
	set	0x58, %l2
	nop	 ! 	stda	%o2,	[%l7 + %l2] 0x14 ASI use changed by convert2hboot
loop_2579:
	addcc	%l4,	%l5,	%o5
	movre	%i5,	%g3,	%i0
	fors	%f22,	%f12,	%f19
	stw	%i2,	[%l7 + 0x6C]
	fpsub16s	%f10,	%f20,	%f14
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	std	%o6,	[%l7 + 0x10]
	edge32l	%g1,	%g7,	%o1
	nop
	setx	loop_2580,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	fmuld8ulx16	%f20,	%f13,	%f4
	movneg	%xcc,	%g6,	%o4
loop_2580:
	fmovda	%xcc,	%f7,	%f29
	movn	%xcc,	%i4,	%g5
	fmovspos	%xcc,	%f5,	%f7
	fmovrslz	%l3,	%f22,	%f19
	fzero	%f2
	ldstub	[%l7 + 0x1A],	%l1
	movrlez	%l6,	0x1E7,	%g4
	edge32ln	%o0,	%l0,	%g2
	subcc	%l2,	%i1,	%i7
	movcs	%icc,	%i3,	%o6
	fmuld8sux16	%f22,	%f13,	%f20
	brgz,a	%i6,	loop_2581
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	nop 	! 	ta	%xcc,	0x2 changed by convert2hboot
	set	0x58, %l3
	nop	 ! 	lduba	[%l7 + %l3] 0x89,	%o3 ASI use changed by convert2hboot
loop_2581:
	nop 	! 	tne	%icc,	0x5 changed by convert2hboot
	or	%o2,	0x14BE,	%l4
	movrgz	%o5,	%i5,	%l5
	sdiv	%i0,	0x074C,	%g3
	subc	%o7,	0x01CF,	%i2
	movrgz	%g7,	%o1,	%g1
	edge8	%g6,	%i4,	%g5
	movvc	%xcc,	%l3,	%l1
	fmovda	%icc,	%f7,	%f6
	fmovsleu	%icc,	%f5,	%f7
	nop
	setx	loop_2582,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	bgu,a	%xcc,	loop_2583
	udivcc	%l6,	0x1738,	%o4
	edge16l	%g4,	%o0,	%g2
loop_2582:
	nop
	set	0x78, %g2
	std	%l2,	[%l7 + %g2]
loop_2583:
	udiv	%i1,	0x0580,	%l0
	brlz	%i7,	loop_2584
	sdiv	%o6,	0x147B,	%i6
	edge32ln	%i3,	%o3,	%o2
	movge	%icc,	%o5,	%l4
loop_2584:
	xnor	%i5,	%l5,	%g3
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
	udiv	%i0,	0x003F,	%i2
	ble,a,pt	%xcc,	loop_2585
	nop 	! 	sir	0x0E17 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
	sdivcc	%o7,	0x17FE,	%o1
loop_2585:
	andncc	%g7,	%g1,	%g6
	ldd	[%l7 + 0x10],	%g4
	fmovdl	%icc,	%f8,	%f12
	set	0x2C, %g7
	lda	[%l7 + %g7] 0x18,	%f29
	fmul8x16au	%f12,	%f9,	%f0
	movcs	%icc,	%l3,	%l1
	fbl	%fcc3,	loop_2586
	std	%i6,	[%l7 + 0x30]
	addccc	%o4,	0x0A84,	%g4
	udivx	%i4,	0x15DE,	%g2
loop_2586:
	edge8l	%o0,	%l2,	%i1
	fbue,a	%fcc0,	loop_2587
	sdiv	%l0,	0x1A49,	%i7
	fnor	%f14,	%f18,	%f20
	faligndata	%f8,	%f30,	%f30
loop_2587:
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	ldub	[%l7 + 0x15],	%i6
	movvs	%xcc,	%i3,	%o6
	fsrc1	%f22,	%f10
	bgu	loop_2588
	mova	%xcc,	%o3,	%o2
	fbule,a	%fcc2,	loop_2589
	fcmped	%fcc2,	%f16,	%f2
loop_2588:
	nop
	set	0x34, %g4
	nop	 ! 	stwa	%o5,	[%l7 + %g4] 0x18 ASI use changed by convert2hboot
loop_2589:
	ldd	[%l7 + 0x10],	%i4
	wr	%g0,	0xe3,	%asi
	membar	#Sync
	edge16ln	%l5,	%i0,	%i2
	smulcc	%g3,	%o7,	%o1
	fbn	%fcc3,	loop_2590
	fcmpne32	%f6,	%f8,	%g1
	udivcc	%g7,	0x0067,	%g5
	fbug,a	%fcc0,	loop_2591
loop_2590:
	movpos	%icc,	%l3,	%l1
	nop 	! 	tpos	%icc,	0x0 changed by convert2hboot
	movre	%l6,	%g6,	%o4
loop_2591:
	be,a	%xcc,	loop_2592
	bcs,a,pt	%icc,	loop_2593
	bg	%icc,	loop_2594
	move	%xcc,	%g4,	%g2
loop_2592:
	sra	%o0,	0x16,	%l2
loop_2593:
	movleu	%icc,	%i4,	%i1
loop_2594:
	membar	0x15
	movpos	%xcc,	%l0,	%i6
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	nop
	setx	loop_2595,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fpack32	%f4,	%f20,	%f0
	popc	%i7,	%o6
	movvs	%icc,	%o3,	%o2
loop_2595:
	nop 	! 	tle	%xcc,	0x5 changed by convert2hboot
	fmovsneg	%xcc,	%f15,	%f20
	nop 	! 	tsubcc	%o5,	%i3,	%l4 changed by convert2hboot
	bvc,a	%xcc,	loop_2596
	nop 	! 	taddcc	%i5,	0x1CE1,	%i0 changed by convert2hboot
	flush	%l7 + 0x74
	set	0x10, %o0
	nop	 ! 	ldda	[%l7 + %o0] 0x24,	%i2 ASI use changed by convert2hboot
loop_2596:
	nop
	setx loop_2597, %l0, %l1
	jmpl %l1, %l5
	srax	%g3,	%o7,	%g1
	fmovdge	%icc,	%f3,	%f14
	bpos	loop_2598
loop_2597:
	fmul8sux16	%f18,	%f12,	%f10
	fbo	%fcc3,	loop_2599
	umul	%o1,	0x1BA5,	%g7
loop_2598:
	alignaddrl	%l3,	%g5,	%l6
	addccc	%g6,	0x14A0,	%o4
loop_2599:
	nop 	! 	taddcc	%g4,	%l1,	%g2 changed by convert2hboot
	stx	%o0,	[%l7 + 0x60]
	nop
	setx	loop_2600,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	move	%xcc,	%i4,	%i1
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	bcc,pn	%xcc,	loop_2601
loop_2600:
	movleu	%xcc,	%l2,	%i6
	movcc	%icc,	%i7,	%o6
	wr	%g0,	0x0c,	%asi
loop_2601:
	fmovsvs	%icc,	%f10,	%f29
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	nop 	! 	tn	%icc,	0x5 changed by convert2hboot
	siam	0x4
	fmovrsne	%l0,	%f24,	%f11
	fandnot1s	%f16,	%f25,	%f4
	wr	%g0,	0x89,	%asi
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
	fxors	%f6,	%f24,	%f23
	umulcc	%o2,	%l4,	%i5
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
	edge8	%i3,	%i0,	%i2
	or	%l5,	0x0C51,	%g3
	pdist	%f0,	%f6,	%f18
	edge8ln	%g1,	%o1,	%g7
	movneg	%xcc,	%l3,	%g5
	bne,a	%icc,	loop_2602
	fpadd16s	%f1,	%f27,	%f29
	fmul8sux16	%f10,	%f14,	%f20
	call	loop_2603
loop_2602:
	move	%xcc,	%l6,	%g6
	udiv	%o4,	0x1C44,	%g4
	fmovsleu	%xcc,	%f3,	%f26
loop_2603:
	std	%o6,	[%l7 + 0x38]
	stb	%l1,	[%l7 + 0x13]
	xnorcc	%g2,	%o0,	%i1
	nop
	setx	loop_2604,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fmovsa	%icc,	%f14,	%f27
	fpsub32s	%f9,	%f2,	%f12
	fone	%f22
loop_2604:
	nop 	! 	tpos	%icc,	0x6 changed by convert2hboot
	orn	%l2,	0x077C,	%i4
	lduh	[%l7 + 0x50],	%i6
	edge32ln	%i7,	%o6,	%l0
	movpos	%icc,	%o3,	%o5
	movn	%icc,	%l4,	%i5
	fmuld8ulx16	%f22,	%f6,	%f22
	umulcc	%i3,	%o2,	%i0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	movrne	%g3,	0x3D6,	%o1
	fcmpes	%fcc3,	%f2,	%f24
	fbe,a	%fcc3,	loop_2605
	be	loop_2606
	bn,pt	%xcc,	loop_2607
	ldsh	[%l7 + 0x4E],	%g7
loop_2605:
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
loop_2606:
	alignaddr	%l3,	%g5,	%l6
loop_2607:
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	wr	%g0,	0x19,	%asi
	umulcc	%o4,	%g6,	%g4
	fcmpeq16	%f2,	%f20,	%o7
	fmovrsne	%g2,	%f26,	%f8
	movcc	%xcc,	%o0,	%l1
	udiv	%i1,	0x1FCC,	%i4
	bcc,a	%icc,	loop_2608
	sll	%i6,	0x04,	%l2
	addcc	%i7,	0x1E0A,	%o6
	movvs	%xcc,	%o3,	%o5
loop_2608:
	array32	%l4,	%l0,	%i5
	fnot1	%f10,	%f2
	nop 	! 	taddcc	%o2,	0x0E0A,	%i0 changed by convert2hboot
	mova	%xcc,	%i2,	%i3
	fmovrdlz	%g3,	%f4,	%f24
	smulcc	%o1,	%g7,	%l5
	udivx	%l3,	0x1FB6,	%l6
	bn,a	%xcc,	loop_2609
	orcc	%g1,	0x0C74,	%o4
	prefetch	[%l7 + 0x38],	 0x0
loop_2609:
	alignaddr	%g5,	%g4,	%g6
	fornot2s	%f0,	%f18,	%f31
	wr	%g0,	0x88,	%asi
	nop 	! 	tsubcctv	%g2,	0x0207,	%l1 changed by convert2hboot
	flush	%l7 + 0x64
	sethi	0x02F1,	%o0
	sdivcc	%i4,	0x0742,	%i6
	sdivx	%i1,	0x00BE,	%l2
	move	%icc,	%i7,	%o3
	orn	%o6,	%o5,	%l4
	popc	0x150C,	%i5
	fmovrsgz	%o2,	%f14,	%f12
	bneg,pt	%xcc,	loop_2610
	fmovdgu	%xcc,	%f4,	%f13
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	edge32l	%i0,	%i2,	%l0
loop_2610:
	sub	%g3,	%o1,	%i3
	fbo	%fcc3,	loop_2611
	bgu	%xcc,	loop_2612
	addccc	%g7,	%l3,	%l6
	smulcc	%g1,	%o4,	%g5
loop_2611:
	fmovsl	%icc,	%f7,	%f7
loop_2612:
	ld	[%l7 + 0x7C],	%f19
	fpack16	%f4,	%f0
	fcmpd	%fcc1,	%f30,	%f4
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	fmovdle	%xcc,	%f4,	%f11
	sdivx	%l5,	0x1AF4,	%g4
	bne	loop_2613
	fmovrsne	%g6,	%f19,	%f31
	fba	%fcc1,	loop_2614
	movvc	%xcc,	%g2,	%l1
loop_2613:
	addc	%o7,	%i4,	%i6
	fxnors	%f31,	%f6,	%f12
loop_2614:
	srax	%o0,	0x1A,	%l2
	fbul,a	%fcc3,	loop_2615
	subc	%i1,	%i7,	%o3
	movneg	%icc,	%o5,	%l4
	fpsub32s	%f15,	%f26,	%f18
loop_2615:
	ldstub	[%l7 + 0x6A],	%o6
	fmovde	%xcc,	%f5,	%f9
	fbue	%fcc1,	loop_2616
	nop 	! 	tleu	%icc,	0x7 changed by convert2hboot
	udivx	%o2,	0x160F,	%i0
	lduw	[%l7 + 0x60],	%i2
loop_2616:
	xnorcc	%i5,	0x17FF,	%g3
	ldstub	[%l7 + 0x0E],	%o1
	xnor	%i3,	%g7,	%l3
	movge	%icc,	%l6,	%g1
	fmovd	%f28,	%f6
	nop 	! 	tge	%icc,	0x2 changed by convert2hboot
	fbne	%fcc3,	loop_2617
	edge32ln	%l0,	%o4,	%g5
	smulcc	%g4,	%l5,	%g6
	movrlz	%g2,	0x02B,	%l1
loop_2617:
	nop
	set	0x1F, %o2
	nop	 ! 	ldstuba	[%l7 + %o2] 0x81,	%o7 ASI use changed by convert2hboot
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	nop
	setx	loop_2618,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	add	%i4,	%o0,	%l2
	edge32n	%i1,	%i7,	%i6
	movre	%o5,	%o3,	%o6
loop_2618:
	edge16ln	%l4,	%o2,	%i0
	fmovrsgez	%i5,	%f9,	%f10
	fmul8sux16	%f12,	%f12,	%f20
	stw	%i2,	[%l7 + 0x08]
	movre	%o1,	0x08E,	%i3
	nop
	setx	loop_2619,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	brgz,a	%g7,	loop_2620
	fnot2	%f12,	%f22
	srax	%l3,	%g3,	%l6
loop_2619:
	fexpand	%f10,	%f6
loop_2620:
	bcs,pn	%icc,	loop_2621
	nop 	! 	sir	0x1240 changed by convert2hboot
	mulscc	%l0,	0x0C1F,	%g1
	edge16n	%g5,	%g4,	%o4
loop_2621:
	nop 	! 	tgu	%xcc,	0x5 changed by convert2hboot
	movg	%xcc,	%g6,	%l5
	orcc	%l1,	%o7,	%i4
	wr	%g0,	0x50,	%asi
	edge32n	%l2,	%i1,	%g2
	nop 	! 	taddcctv	%i7,	0x1985,	%i6 changed by convert2hboot
	bvc,a,pn	%xcc,	loop_2622
	fbg	%fcc1,	loop_2623
	bpos,pt	%xcc,	loop_2624
	nop 	! 	tsubcctv	%o5,	0x10A6,	%o6 changed by convert2hboot
loop_2622:
	movcs	%xcc,	%o3,	%o2
loop_2623:
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
loop_2624:
	edge8ln	%i0,	%i5,	%l4
	set	0x64, %o6
	nop	 ! 	swapa	[%l7 + %o6] 0x18,	%o1 ASI use changed by convert2hboot
	edge8l	%i3,	%i2,	%g7
	edge8l	%l3,	%g3,	%l6
	edge32ln	%l0,	%g5,	%g4
	movrlz	%o4,	0x38B,	%g1
	prefetch	[%l7 + 0x28],	 0x3
	fbn	%fcc3,	loop_2625
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
	std	%l4,	[%l7 + 0x28]
	mulx	%l1,	0x011D,	%o7
loop_2625:
	fsrc1s	%f7,	%f31
	srlx	%g6,	0x15,	%i4
	nop 	! 	tpos	%xcc,	0x4 changed by convert2hboot
	fand	%f14,	%f24,	%f30
	fbg	%fcc3,	loop_2626
	addccc	%l2,	%o0,	%g2
	popc	%i7,	%i1
	movleu	%icc,	%o5,	%i6
loop_2626:
	udivx	%o6,	0x016C,	%o2
	udiv	%o3,	0x008A,	%i5
	wr	%g0,	0x88,	%asi
	udiv	%i0,	0x1F81,	%i3
	edge16ln	%o1,	%g7,	%l3
	wr	%g0,	0x89,	%asi
	xor	%l6,	0x0847,	%i2
	bvs,pn	%xcc,	loop_2627
	membar	0x17
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l0,	%g5,	%o4
loop_2627:
	subc	%g1,	%l5,	%l1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	fmovde	%xcc,	%f28,	%f24
	array16	%g6,	%i4,	%l2
	subccc	%g2,	0x10FD,	%o0
	prefetch	[%l7 + 0x48],	 0x2
	movneg	%xcc,	%i1,	%i7
	edge8l	%o5,	%o6,	%i6
	subcc	%o3,	%o2,	%i5
	sth	%i0,	[%l7 + 0x10]
	movrne	%i3,	0x366,	%l4
	array32	%g7,	%o1,	%g3
	brgz,a	%l6,	loop_2628
	call	loop_2629
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,a,pt	%xcc,	loop_2630
loop_2628:
	fmovdneg	%icc,	%f15,	%f9
loop_2629:
	fsrc1s	%f13,	%f19
	movrne	%l3,	%i2,	%l0
loop_2630:
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	nop 	! 	tvc	%icc,	0x5 changed by convert2hboot
	add	%g5,	%g1,	%o4
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	mulx	%l1,	0x19EB,	%o7
	wr	%g0,	0x88,	%asi
	nop 	! 	tleu	%icc,	0x6 changed by convert2hboot
	sethi	0x01B7,	%g4
	fmovdn	%xcc,	%f11,	%f12
	nop 	! 	taddcc	%g6,	0x1179,	%i4 changed by convert2hboot
	fbl,a	%fcc1,	loop_2631
	nop 	! 	taddcctv	%g2,	%o0,	%l2 changed by convert2hboot
	fbn	%fcc1,	loop_2632
	movre	%i1,	%o5,	%i7
loop_2631:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	nop	 ! 	casxa	[%l6] 0x18,	%i6,	%o6 ASI use changed by convert2hboot
loop_2632:
	movl	%xcc,	%o2,	%o3
	and	%i0,	%i3,	%l4
	movneg	%icc,	%g7,	%i5
	srax	%g3,	%o1,	%l6
	fmovrde	%l3,	%f10,	%f18
	orn	%i2,	%g5,	%g1
	bcs,pn	%icc,	loop_2633
	edge16ln	%o4,	%l0,	%o7
	fpadd16	%f6,	%f30,	%f12
	fbu	%fcc3,	loop_2634
loop_2633:
	brlez,a	%l5,	loop_2635
	movne	%icc,	%g4,	%g6
	nop 	! 	tpos	%icc,	0x0 changed by convert2hboot
loop_2634:
	movcs	%xcc,	%i4,	%g2
loop_2635:
	sll	%l1,	%o0,	%i1
	sllx	%l2,	%o5,	%i7
	smul	%o6,	%o2,	%i6
	alignaddr	%i0,	%o3,	%i3
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	wr	%g0,	0x04,	%asi
	ldd	[%l7 + 0x50],	%f0
	fabss	%f28,	%f0
	alignaddr	%i5,	%g3,	%l4
	nop 	! 	sir	0x0145 changed by convert2hboot
	fbg,a	%fcc0,	loop_2636
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	fbue,a	%fcc3,	loop_2637
	fnot1	%f4,	%f12
loop_2636:
	nop
	set	0x52, %l0
	nop	 ! 	stha	%l6,	[%l7 + %l0] 0x80 ASI use changed by convert2hboot
loop_2637:
	nop
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x50] %asi,	%f27
	wr	%g0,	0x81,	%asi
	orn	%l3,	%i2,	%g1
	mova	%icc,	%o4,	%g5
	fxnor	%f18,	%f28,	%f28
	srlx	%l0,	%o7,	%l5
	bne	%xcc,	loop_2638
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
	ld	[%l7 + 0x34],	%f20
	bl,pt	%xcc,	loop_2639
loop_2638:
	fmovs	%f21,	%f23
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	udivcc	%g4,	0x122B,	%g6
loop_2639:
	alignaddrl	%g2,	%l1,	%i4
	fcmped	%fcc3,	%f6,	%f16
	movg	%xcc,	%o0,	%i1
	bl,pt	%xcc,	loop_2640
	udivx	%l2,	0x0096,	%o5
	addc	%o6,	%i7,	%i6
	brlz,a	%i0,	loop_2641
loop_2640:
	smulcc	%o3,	%o2,	%g7
	set	0x27, %l4
	nop	 ! 	ldsba	[%l7 + %l4] 0x10,	%i3 ASI use changed by convert2hboot
loop_2641:
	edge32l	%g3,	%i5,	%l6
	bneg	%xcc,	loop_2642
	movrgez	%o1,	%l3,	%l4
	wr	%g0,	0x88,	%asi
loop_2642:
	movrlez	%i2,	%g5,	%l0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	nop	 ! 	casxa	[%l6] 0x80,	%o4,	%l5 ASI use changed by convert2hboot
	fmovde	%xcc,	%f18,	%f10
	fmuld8sux16	%f29,	%f29,	%f14
	fnot2s	%f3,	%f1
	fmul8x16au	%f29,	%f27,	%f24
	edge16l	%g4,	%g6,	%g2
	fornot1	%f2,	%f12,	%f8
	xnor	%o7,	0x1D48,	%l1
	movvs	%icc,	%i4,	%o0
	nop 	! 	te	%xcc,	0x7 changed by convert2hboot
	wr	%g0,	0x11,	%asi
	sta	%f13,	[%l7 + 0x54] %asi
	fbul,a	%fcc3,	loop_2643
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	brgz	%i1,	loop_2644
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
loop_2643:
	sra	%l2,	%o5,	%i7
	addccc	%i6,	%o6,	%o3
loop_2644:
	movre	%o2,	0x0B9,	%i0
	udivx	%g7,	0x01B8,	%i3
	nop 	! 	te	%icc,	0x3 changed by convert2hboot
	membar	0x2E
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	sra	%i5,	%g3,	%o1
	ldstub	[%l7 + 0x14],	%l6
	fornot2	%f8,	%f10,	%f24
	movre	%l4,	%l3,	%g1
	set	0x60, %l6
	nop	 ! 	swapa	[%l7 + %l6] 0x04,	%g5 ASI use changed by convert2hboot
	movgu	%xcc,	%l0,	%i2
	edge16	%l5,	%o4,	%g4
	andn	%g6,	0x00A5,	%o7
	umulcc	%g2,	0x1F54,	%i4
	umulcc	%o0,	%l1,	%i1
	set	0x68, %i4
	nop	 ! 	lduwa	[%l7 + %i4] 0x11,	%o5 ASI use changed by convert2hboot
	fble	%fcc2,	loop_2645
	nop 	! 	tvc	%icc,	0x0 changed by convert2hboot
	array32	%i7,	%l2,	%i6
	udivcc	%o3,	0x1D56,	%o2
loop_2645:
	nop 	! 	taddcctv	%o6,	0x1B48,	%i0 changed by convert2hboot
	edge16l	%i3,	%g7,	%g3
	std	%i4,	[%l7 + 0x70]
	movvs	%icc,	%l6,	%l4
	and	%l3,	%o1,	%g5
	smul	%l0,	%i2,	%g1
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	bshuffle	%f4,	%f12,	%f20
	movl	%xcc,	%o4,	%l5
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	ldsh	[%l7 + 0x3E],	%g6
	umul	%o7,	0x00D4,	%g2
	edge8	%g4,	%i4,	%l1
	ldsh	[%l7 + 0x7A],	%i1
	smulcc	%o5,	0x011E,	%o0
	fxnors	%f22,	%f21,	%f1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i7,	0x0D7,	%l2
	popc	%i6,	%o2
	fandnot1	%f0,	%f28,	%f22
	fbe	%fcc0,	loop_2646
	movcs	%icc,	%o6,	%o3
	swap	[%l7 + 0x58],	%i0
	fmul8x16al	%f24,	%f25,	%f10
loop_2646:
	sdiv	%g7,	0x0D0E,	%i3
	bgu,a	loop_2647
	fpsub16	%f4,	%f14,	%f12
	fmovsl	%xcc,	%f25,	%f20
	stb	%i5,	[%l7 + 0x54]
loop_2647:
	smul	%g3,	%l4,	%l3
	nop
	setx loop_2648, %l0, %l1
	jmpl %l1, %l6
	edge8	%g5,	%o1,	%l0
	movpos	%xcc,	%g1,	%i2
	addccc	%o4,	%l5,	%o7
loop_2648:
	add	%g2,	%g6,	%i4
	orn	%g4,	%i1,	%l1
	movn	%icc,	%o5,	%i7
	pdist	%f24,	%f30,	%f16
	fbge	%fcc1,	loop_2649
	fmovrse	%l2,	%f13,	%f2
	std	%i6,	[%l7 + 0x10]
	fpadd16s	%f5,	%f9,	%f14
loop_2649:
	srl	%o2,	%o0,	%o6
	siam	0x3
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	movre	%o3,	%i0,	%g7
	movcc	%xcc,	%i5,	%i3
	fcmpne16	%f28,	%f4,	%l4
	fpsub16	%f10,	%f12,	%f8
	fbuge	%fcc1,	loop_2650
	umulcc	%l3,	%l6,	%g3
	nop
	set	0x24, %i3
	ldsw	[%l7 + %i3],	%o1
	nop 	! 	tleu	%xcc,	0x7 changed by convert2hboot
loop_2650:
	bne,pn	%icc,	loop_2651
	fsrc1	%f22,	%f20
	movge	%icc,	%l0,	%g1
	brlz,a	%g5,	loop_2652
loop_2651:
	udivx	%o4,	0x0EEC,	%l5
	xnor	%i2,	0x0609,	%o7
	brgez	%g2,	loop_2653
loop_2652:
	fsrc2	%f16,	%f22
	udiv	%g6,	0x0953,	%i4
	sra	%i1,	0x15,	%l1
loop_2653:
	bleu	loop_2654
	fpadd16s	%f12,	%f26,	%f8
	edge8n	%o5,	%i7,	%l2
	popc	%g4,	%i6
loop_2654:
	andn	%o0,	%o2,	%o3
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	edge8ln	%i0,	%o6,	%g7
	andcc	%i3,	0x1614,	%i5
	fmovde	%icc,	%f25,	%f13
	set	0x40, %i0
	nop	 ! 	stda	%f0,	[%l7 + %i0] 0x1e ASI use changed by convert2hboot
	membar	#Sync
	movvc	%xcc,	%l3,	%l6
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
	fbuge	%fcc2,	loop_2655
	xnorcc	%l4,	%g3,	%l0
	set	0x68, %g3
	nop	 ! 	stxa	%g1,	[%l7 + %g3] 0x23 ASI use changed by convert2hboot
	membar	#Sync
loop_2655:
	movgu	%xcc,	%o1,	%o4
	fba	%fcc1,	loop_2656
	sllx	%g5,	0x08,	%i2
	movne	%xcc,	%o7,	%g2
loop_2656:
	st	%f30,	[%l7 + 0x50]
	addcc	%l5,	%i4,	%g6
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	ldd	[%l7 + 0x28],	%f4
	andncc	%l1,	%i1,	%i7
	smulcc	%l2,	0x0EDF,	%o5
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
	fmovscc	%icc,	%f13,	%f21
	fcmped	%fcc0,	%f2,	%f16
	call	loop_2657
	sll	%g4,	0x17,	%o0
	movrne	%i6,	0x32F,	%o2
	fpsub32s	%f14,	%f25,	%f31
loop_2657:
	std	%o2,	[%l7 + 0x28]
	fbl,a	%fcc0,	loop_2658
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
	movl	%icc,	%o6,	%g7
	movrgz	%i3,	%i5,	%i0
loop_2658:
	fcmpeq16	%f4,	%f4,	%l3
	umulcc	%l4,	%g3,	%l0
	fbule,a	%fcc3,	loop_2659
	xnorcc	%g1,	%l6,	%o1
	ldx	[%l7 + 0x68],	%o4
	fmovdne	%xcc,	%f27,	%f16
loop_2659:
	nop
	set	0x29, %i6
	nop	 ! 	stba	%i2,	[%l7 + %i6] 0xe2 ASI use changed by convert2hboot
	membar	#Sync
	bg	%xcc,	loop_2660
	bcs	loop_2661
	nop 	! 	taddcctv	%o7,	0x1210,	%g2 changed by convert2hboot
	edge32n	%l5,	%g5,	%i4
loop_2660:
	edge32ln	%l1,	%g6,	%i7
loop_2661:
	orncc	%i1,	0x1C02,	%l2
	and	%g4,	0x0072,	%o0
	bl	%icc,	loop_2662
	nop 	! 	tleu	%icc,	0x7 changed by convert2hboot
	move	%xcc,	%i6,	%o5
	wr	%g0,	0x80,	%asi
loop_2662:
	movre	%o3,	0x3B9,	%g7
	movre	%i3,	0x09E,	%o6
	add	%i5,	0x0090,	%l3
	fxors	%f4,	%f29,	%f3
	xorcc	%i0,	0x19EA,	%g3
	fba,a	%fcc0,	loop_2663
	stw	%l0,	[%l7 + 0x14]
	bshuffle	%f22,	%f24,	%f20
	orn	%l4,	0x1567,	%l6
loop_2663:
	edge32ln	%o1,	%o4,	%i2
	edge8n	%g1,	%g2,	%o7
	wr	%g0,	0xeb,	%asi
	membar	#Sync
	fone	%f0
	fmovsvs	%icc,	%f16,	%f18
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	nop	 ! 	casa	[%l6] 0x88,	%l5,	%i4 ASI use changed by convert2hboot
	wr	%g0,	0x89,	%asi
	std	%g6,	[%l7 + 0x48]
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
	nop
	set	0x22, %i5
	sth	%i1,	[%l7 + %i5]
	wr	%g0,	0x18,	%asi
	edge8ln	%g4,	%l2,	%o0
	sdivx	%i6,	0x1095,	%o2
	movle	%icc,	%o3,	%o5
	xnorcc	%g7,	%i3,	%o6
	fmovsneg	%icc,	%f2,	%f7
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
	fmovrdlez	%i5,	%f4,	%f0
	or	%l3,	0x130F,	%i0
	movvc	%icc,	%g3,	%l0
	fpadd16s	%f12,	%f17,	%f8
	nop
	setx loop_2664, %l0, %l1
	jmpl %l1, %l4
	orcc	%l6,	%o1,	%o4
	movre	%i2,	%g2,	%g1
	andncc	%g5,	%o7,	%l5
loop_2664:
	edge16n	%i4,	%l1,	%i1
	stb	%g6,	[%l7 + 0x4F]
	set	0x220, %i2
	nop	 ! 	ldxa	[%g0 + %i2] 0x52,	%g4 ASI use changed by convert2hboot
	movpos	%icc,	%l2,	%i7
	nop 	! 	tsubcc	%o0,	0x1E54,	%o2 changed by convert2hboot
	edge8	%i6,	%o5,	%o3
	movvs	%xcc,	%g7,	%o6
	add	%i5,	%i3,	%i0
	alignaddr	%g3,	%l3,	%l4
	movvc	%icc,	%l6,	%o1
	edge8ln	%l0,	%i2,	%o4
	movleu	%xcc,	%g2,	%g5
	lduh	[%l7 + 0x54],	%o7
	call	loop_2665
	movn	%icc,	%g1,	%l5
	edge8ln	%i4,	%l1,	%g6
	fmovdcc	%xcc,	%f1,	%f30
loop_2665:
	fabss	%f22,	%f2
	fmovrdgz	%g4,	%f18,	%f10
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	andcc	%l2,	%i7,	%o0
	andncc	%o2,	%i1,	%o5
	fmuld8sux16	%f9,	%f0,	%f20
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	movrlz	%i6,	%g7,	%o3
	edge32ln	%i5,	%i3,	%i0
	nop 	! 	taddcctv	%g3,	0x09DE,	%l3 changed by convert2hboot
	set	0x1C, %l1
	nop	 ! 	ldswa	[%l7 + %l1] 0x0c,	%o6 ASI use changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	sdiv	%l6,	0x0A0D,	%o1
	sllx	%l0,	%i2,	%o4
	movge	%icc,	%g2,	%g5
	array32	%l4,	%g1,	%o7
	nop
	set	0x68, %g6
	lduh	[%l7 + %g6],	%l5
	add	%i4,	0x19C9,	%g6
	subcc	%l1,	%l2,	%g4
	popc	0x15B9,	%i7
	andn	%o2,	0x1F04,	%i1
	for	%f30,	%f30,	%f26
	movcs	%xcc,	%o0,	%i6
	mulx	%g7,	0x19A7,	%o5
	set	0x68, %o7
	nop	 ! 	ldsha	[%l7 + %o7] 0x14,	%i5 ASI use changed by convert2hboot
	mulscc	%i3,	0x07E3,	%i0
	edge8n	%o3,	%l3,	%o6
	nop 	! 	ta	%icc,	0x7 changed by convert2hboot
	fmovsle	%icc,	%f18,	%f24
	fbge	%fcc0,	loop_2666
	addccc	%l6,	0x0181,	%g3
	fmovda	%xcc,	%f0,	%f12
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
loop_2666:
	nop
	setx loop_2667, %l0, %l1
	jmpl %l1, %o1
	subc	%i2,	%o4,	%g2
	fsrc2	%f26,	%f6
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
loop_2667:
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	andn	%l0,	%g5,	%l4
	movn	%xcc,	%o7,	%l5
	set	0x60, %l5
	nop	 ! 	prefetcha	[%l7 + %l5] 0x88,	 0x0 ASI use changed by convert2hboot
	set	0x30, %o5
	nop	 ! 	ldda	[%l7 + %o5] 0x2e,	%g6 ASI use changed by convert2hboot
	bleu	%xcc,	loop_2668
	fcmped	%fcc1,	%f24,	%f26
	fcmpd	%fcc3,	%f6,	%f22
	array8	%l1,	%i4,	%g4
loop_2668:
	subccc	%i7,	%o2,	%i1
	fble	%fcc2,	loop_2669
	bshuffle	%f18,	%f18,	%f4
	wr	%g0,	0x89,	%asi
loop_2669:
	edge32l	%i6,	%g7,	%l2
	set	0x50, %i7
	nop	 ! 	stwa	%o5,	[%l7 + %i7] 0x27 ASI use changed by convert2hboot
	membar	#Sync
	sethi	0x17FB,	%i3
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
	call	loop_2670
	nop 	! 	tg	%icc,	0x1 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	fcmps	%fcc1,	%f24,	%f15
loop_2670:
	udiv	%i0,	0x1B22,	%i5
	fcmpes	%fcc0,	%f23,	%f27
	ldstub	[%l7 + 0x0B],	%o3
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tge	%icc,	0x0 changed by convert2hboot
	movvs	%xcc,	%o6,	%l6
	edge8l	%g3,	%o1,	%i2
	subccc	%o4,	%l3,	%l0
	bcs,a	loop_2671
	add	%g2,	0x1BF7,	%l4
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	stx	%g5,	[%l7 + 0x78]
loop_2671:
	bn,pn	%xcc,	loop_2672
	std	%f2,	[%l7 + 0x18]
	sethi	0x0F9C,	%l5
	ldd	[%l7 + 0x30],	%g0
loop_2672:
	add	%g6,	0x0913,	%l1
	xnorcc	%o7,	%i4,	%g4
	movgu	%xcc,	%i7,	%i1
	fbg	%fcc2,	loop_2673
	movpos	%xcc,	%o2,	%o0
	movcs	%xcc,	%i6,	%g7
	xnorcc	%l2,	%o5,	%i0
loop_2673:
	udiv	%i3,	0x051B,	%o3
	bleu,pn	%icc,	loop_2674
	sllx	%i5,	%l6,	%o6
	sll	%o1,	%g3,	%o4
	nop 	! 	tsubcc	%i2,	%l3,	%g2 changed by convert2hboot
loop_2674:
	move	%xcc,	%l0,	%l4
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	smulcc	%g5,	%l5,	%g6
	wr	%g0,	0x80,	%asi
	brlez	%o7,	loop_2675
	nop 	! 	sir	0x1341 changed by convert2hboot
	bgu,a,pt	%icc,	loop_2676
	movg	%icc,	%g1,	%i4
loop_2675:
	fmovdvc	%icc,	%f30,	%f15
	fornot2s	%f27,	%f2,	%f12
loop_2676:
	edge8	%i7,	%i1,	%g4
	ldsw	[%l7 + 0x0C],	%o2
	nop 	! 	tsubcc	%o0,	0x0DA7,	%g7 changed by convert2hboot
	bneg,a	loop_2677
	fba	%fcc2,	loop_2678
	brnz,a	%l2,	loop_2679
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
loop_2677:
	fbn,a	%fcc0,	loop_2680
loop_2678:
	fcmpeq16	%f24,	%f20,	%i6
loop_2679:
	andcc	%i0,	%i3,	%o5
	fble	%fcc1,	loop_2681
loop_2680:
	edge32n	%i5,	%o3,	%o6
	wr	%g0,	0x89,	%asi
loop_2681:
	fbue,a	%fcc0,	loop_2682
	fmovrslz	%g3,	%f29,	%f12
	fmovde	%xcc,	%f6,	%f7
	andcc	%l6,	%o4,	%l3
loop_2682:
	fpadd16	%f12,	%f2,	%f12
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	fmul8x16au	%f24,	%f3,	%f8
	subc	%i2,	%g2,	%l0
	fcmple16	%f8,	%f20,	%g5
	set	0x78, %i1
	nop	 ! 	stxa	%l5,	[%l7 + %i1] 0x2b ASI use changed by convert2hboot
	membar	#Sync
	edge16	%l4,	%l1,	%g6
	nop 	! 	tsubcctv	%o7,	0x183B,	%g1 changed by convert2hboot
	wr	%g0,	0x81,	%asi
	add	%i1,	%i7,	%g4
	edge8l	%o2,	%g7,	%l2
	fcmpne16	%f6,	%f18,	%o0
	movle	%icc,	%i0,	%i3
	mova	%icc,	%o5,	%i6
	fzeros	%f15
	ba	%xcc,	loop_2683
	fmovsg	%xcc,	%f26,	%f3
	fbo	%fcc1,	loop_2684
	edge8	%i5,	%o6,	%o1
loop_2683:
	fcmpes	%fcc3,	%f10,	%f31
	set	0x4B, %g5
	nop	 ! 	ldsba	[%l7 + %g5] 0x18,	%g3 ASI use changed by convert2hboot
loop_2684:
	nop 	! 	tgu	%xcc,	0x6 changed by convert2hboot
	fpadd16s	%f2,	%f8,	%f19
	set	0x44, %o1
	nop	 ! 	swapa	[%l7 + %o1] 0x04,	%o3 ASI use changed by convert2hboot
	wr	%g0,	0x19,	%asi
	nop 	! 	sir	0x14AB changed by convert2hboot
	subccc	%l3,	%i2,	%g2
	set	0x40, %o3
	nop	 ! 	stda	%f0,	[%l7 + %o3] 0x10 ASI use changed by convert2hboot
	fbul	%fcc3,	loop_2685
	fors	%f11,	%f11,	%f13
	subc	%l0,	0x0DC4,	%l6
	smulcc	%l5,	%g5,	%l4
loop_2685:
	array8	%l1,	%o7,	%g6
	bn,a	%icc,	loop_2686
	nop 	! 	tg	%icc,	0x3 changed by convert2hboot
	movcs	%icc,	%i4,	%i1
	fnands	%f31,	%f31,	%f11
loop_2686:
	movneg	%icc,	%g1,	%i7
	fbe,a	%fcc2,	loop_2687
	sethi	0x0404,	%g4
	nop 	! 	te	%xcc,	0x4 changed by convert2hboot
	array8	%g7,	%o2,	%o0
loop_2687:
	fornot1	%f8,	%f10,	%f28
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
	movrne	%i0,	0x11E,	%i3
	fors	%f27,	%f12,	%f10
	edge8l	%l2,	%i6,	%o5
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x19,	%asi
	bshuffle	%f6,	%f0,	%f30
	bcs,a	%icc,	loop_2688
	ldx	[%l7 + 0x38],	%o1
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
	srlx	%o3,	0x06,	%g3
loop_2688:
	membar	0x0E
	andn	%l3,	0x02E6,	%i2
	movg	%xcc,	%g2,	%l0
	fzero	%f12
	fbne,a	%fcc1,	loop_2689
	movneg	%xcc,	%l6,	%l5
	fbu,a	%fcc2,	loop_2690
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
loop_2689:
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	bneg,a	%xcc,	loop_2691
loop_2690:
	orncc	%g5,	0x13C1,	%l4
	andcc	%l1,	0x1DFA,	%o4
	nop 	! 	tg	%xcc,	0x7 changed by convert2hboot
loop_2691:
	movge	%xcc,	%g6,	%o7
	sth	%i4,	[%l7 + 0x0E]
	wr	%g0,	0x19,	%asi
	edge32	%i7,	%g1,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%o2,	0x1F72,	%g4
	fmovdgu	%xcc,	%f26,	%f5
	nop
	setx loop_2692, %l0, %l1
	jmpl %l1, %i0
	fmovsn	%icc,	%f24,	%f2
	edge16n	%o0,	%i3,	%i6
	fnot2s	%f1,	%f2
loop_2692:
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
	ldstub	[%l7 + 0x48],	%l2
	addcc	%o5,	%o6,	%i5
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
	sethi	0x0DF8,	%o1
	xnor	%g3,	0x1D93,	%l3
	srl	%i2,	%g2,	%l0
	ldsw	[%l7 + 0x1C],	%o3
	udivcc	%l5,	0x0F19,	%l6
	fbne	%fcc2,	loop_2693
	edge8	%l4,	%g5,	%l1
	fnot1s	%f9,	%f25
	stb	%o4,	[%l7 + 0x46]
loop_2693:
	smulcc	%o7,	%i4,	%i1
	stx	%g6,	[%l7 + 0x08]
	and	%i7,	%g1,	%g7
	fnor	%f6,	%f10,	%f4
	fornot1s	%f24,	%f17,	%f6
	ldsb	[%l7 + 0x32],	%g4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i0
	nop	 ! 	casa	[%l6] 0x19,	%i0,	%o2 ASI use changed by convert2hboot
	brnz,a	%i3,	loop_2694
	andncc	%o0,	%l2,	%o5
	nop 	! 	tg	%xcc,	0x2 changed by convert2hboot
	fmul8x16al	%f19,	%f22,	%f2
loop_2694:
	fmovsn	%icc,	%f17,	%f8
	movrlez	%o6,	0x1F5,	%i6
	array16	%i5,	%g3,	%l3
	fnor	%f28,	%f6,	%f16
	bg,pt	%icc,	loop_2695
	bleu,pn	%icc,	loop_2696
	fblg	%fcc2,	loop_2697
	fmovsgu	%icc,	%f20,	%f6
loop_2695:
	ldd	[%l7 + 0x18],	%f10
loop_2696:
	fnors	%f7,	%f9,	%f18
loop_2697:
	fbe	%fcc1,	loop_2698
	fexpand	%f3,	%f4
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
	fmovsle	%icc,	%f4,	%f12
loop_2698:
	ldd	[%l7 + 0x48],	%f8
	bn,a	%xcc,	loop_2699
	udiv	%o1,	0x123F,	%g2
	sra	%i2,	%o3,	%l0
	fmovrde	%l5,	%f0,	%f30
loop_2699:
	edge8	%l6,	%g5,	%l4
	addc	%o4,	0x0A7F,	%l1
	sethi	0x1C46,	%i4
	orncc	%o7,	%g6,	%i1
	mulscc	%g1,	0x1B2F,	%g7
	xnor	%i7,	0x015A,	%g4
	fmovsl	%xcc,	%f30,	%f14
	srl	%o2,	%i0,	%i3
	fmovdne	%icc,	%f8,	%f29
	fsrc1s	%f13,	%f17
	fmovdgu	%xcc,	%f7,	%f20
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	prefetch	[%l7 + 0x64],	 0x1
	srl	%l2,	0x03,	%o0
	addccc	%o5,	0x0212,	%i6
	set	0x4B, %o4
	nop	 ! 	ldsba	[%l7 + %o4] 0x89,	%o6 ASI use changed by convert2hboot
	smulcc	%i5,	0x0C87,	%g3
	nop 	! 	tsubcctv	%l3,	%o1,	%i2 changed by convert2hboot
	brlez,a	%g2,	loop_2700
	sllx	%o3,	%l5,	%l0
	std	%f0,	[%l7 + 0x40]
	membar	0x2E
loop_2700:
	smul	%l6,	0x0DD2,	%g5
	ldd	[%l7 + 0x50],	%f22
	fsrc2s	%f28,	%f3
	membar	0x76
	edge8n	%o4,	%l1,	%i4
	array16	%o7,	%g6,	%i1
	movg	%icc,	%g1,	%g7
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
	fbul	%fcc3,	loop_2701
	fmovsleu	%xcc,	%f10,	%f29
	udivx	%l4,	0x0471,	%g4
	addccc	%i7,	0x1D4E,	%i0
loop_2701:
	movn	%icc,	%i3,	%o2
	bvc	loop_2702
	subc	%l2,	%o5,	%i6
	movle	%icc,	%o0,	%o6
	fmovsneg	%icc,	%f29,	%f9
loop_2702:
	lduw	[%l7 + 0x38],	%g3
	orncc	%i5,	%o1,	%i2
	edge8n	%l3,	%g2,	%l5
	ldsw	[%l7 + 0x44],	%l0
	subccc	%o3,	0x02D2,	%l6
	wr	%g0,	0x0c,	%asi
	fmul8ulx16	%f8,	%f18,	%f26
	movre	%l1,	%g5,	%o7
	sub	%i4,	%g6,	%g1
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
	fcmpgt16	%f14,	%f30,	%i1
	fmul8x16au	%f12,	%f20,	%f20
	edge16	%l4,	%g4,	%i7
	for	%f20,	%f4,	%f18
	xor	%i0,	0x1CEE,	%i3
	fpack16	%f18,	%f13
	sdivcc	%o2,	0x0D5B,	%g7
	movgu	%xcc,	%o5,	%l2
	orncc	%i6,	%o0,	%g3
	edge32l	%o6,	%i5,	%o1
	std	%l2,	[%l7 + 0x50]
	fmovrdlz	%i2,	%f24,	%f16
	bneg,a	%icc,	loop_2703
	fcmpgt16	%f16,	%f12,	%g2
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	andncc	%l0,	%l5,	%o3
loop_2703:
	xor	%o4,	%l6,	%l1
	nop 	! 	tneg	%xcc,	0x7 changed by convert2hboot
	edge16	%g5,	%i4,	%o7
	nop 	! 	tsubcc	%g6,	0x15E8,	%i1 changed by convert2hboot
	fmovdl	%xcc,	%f0,	%f31
	movn	%icc,	%g1,	%g4
	wr	%g0,	0x0c,	%asi
	movvs	%icc,	%i0,	%i3
	wr	%g0,	0x2b,	%asi
	membar	#Sync
	addcc	%g7,	%o5,	%l2
	andn	%o2,	%o0,	%g3
	srl	%o6,	0x07,	%i6
	addcc	%i5,	0x1DC1,	%o1
	fmovdcc	%icc,	%f1,	%f3
	movpos	%xcc,	%i2,	%g2
	edge8	%l0,	%l3,	%l5
	sth	%o4,	[%l7 + 0x36]
	fmovse	%xcc,	%f18,	%f14
	fpack16	%f24,	%f22
	set	0x3C, %l2
	nop	 ! 	lduwa	[%l7 + %l2] 0x11,	%l6 ASI use changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
	andn	%o3,	0x1949,	%l1
	smulcc	%g5,	%i4,	%g6
	be,a,pn	%xcc,	loop_2704
	ldsh	[%l7 + 0x5E],	%i1
	subcc	%o7,	%g4,	%g1
	nop
	set	0x70, %g1
	ldstub	[%l7 + %g1],	%i0
loop_2704:
	membar	0x54
	nop
	setx	loop_2705,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	brnz	%i3,	loop_2706
	udiv	%l4,	0x14DB,	%i7
	fornot1	%f14,	%f22,	%f0
loop_2705:
	edge16	%o5,	%g7,	%o2
loop_2706:
	ldstub	[%l7 + 0x5C],	%o0
	fmovde	%icc,	%f10,	%f0
	edge32n	%l2,	%g3,	%o6
	srlx	%i6,	0x15,	%o1
	bgu,a	loop_2707
	movpos	%icc,	%i2,	%i5
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	fbuge,a	%fcc0,	loop_2708
loop_2707:
	smulcc	%l0,	0x100B,	%l3
	brlz,a	%g2,	loop_2709
	fmovspos	%icc,	%f10,	%f15
loop_2708:
	lduw	[%l7 + 0x18],	%o4
	addc	%l5,	0x1F3D,	%o3
loop_2709:
	movle	%xcc,	%l1,	%l6
	orcc	%i4,	%g6,	%g5
	fmovspos	%xcc,	%f29,	%f15
	movgu	%icc,	%o7,	%i1
	and	%g1,	%g4,	%i0
	set	0x3C, %l3
	nop	 ! 	swapa	[%l7 + %l3] 0x89,	%i3 ASI use changed by convert2hboot
	movrgez	%i7,	0x0FA,	%l4
	edge8	%g7,	%o5,	%o2
	wr	%g0,	0x89,	%asi
	umulcc	%o0,	%o6,	%g3
	movle	%xcc,	%o1,	%i2
	fpack16	%f26,	%f21
	srlx	%i6,	%l0,	%l3
	udivcc	%i5,	0x0217,	%o4
	fmovdleu	%xcc,	%f13,	%f9
	ldsw	[%l7 + 0x14],	%l5
	sdivx	%o3,	0x1116,	%g2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	nop	 ! 	casxa	[%l6] 0x80,	%l1,	%i4 ASI use changed by convert2hboot
	fbg	%fcc2,	loop_2710
	nop 	! 	tgu	%xcc,	0x3 changed by convert2hboot
	siam	0x7
	edge16ln	%g6,	%l6,	%o7
loop_2710:
	movcs	%xcc,	%i1,	%g1
	fbul,a	%fcc3,	loop_2711
	fnand	%f26,	%f18,	%f26
	bn	loop_2712
	fmul8sux16	%f24,	%f28,	%f8
loop_2711:
	fcmple16	%f18,	%f30,	%g4
	fandnot1	%f10,	%f30,	%f12
loop_2712:
	bneg,a,pt	%icc,	loop_2713
	mulx	%i0,	0x1C58,	%g5
	bvc,a	%icc,	loop_2714
	for	%f12,	%f6,	%f26
loop_2713:
	mulscc	%i7,	0x1191,	%l4
	bgu,pt	%xcc,	loop_2715
loop_2714:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f1
	mova	%icc,	%g7,	%i3
loop_2715:
	sllx	%o2,	%o5,	%l2
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
	ldd	[%l7 + 0x20],	%f30
	edge32ln	%o6,	%o0,	%g3
	fone	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%i2,	loop_2716
	array16	%i6,	%l0,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2716:
	xor	%i5,	%o4,	%l5
	mulx	%o3,	%l3,	%l1
	ldx	[%l7 + 0x30],	%g2
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	fxnors	%f2,	%f1,	%f6
	membar	0x79
	popc	%g6,	%l6
	bshuffle	%f10,	%f8,	%f26
	mulx	%o7,	0x1FC2,	%i1
	ba,a	loop_2717
	andn	%g1,	0x081B,	%g4
	srlx	%i4,	0x11,	%i0
	umulcc	%i7,	0x1E7B,	%g5
loop_2717:
	movvs	%icc,	%g7,	%i3
	subcc	%o2,	%l4,	%o5
	fxnors	%f11,	%f23,	%f23
	edge8	%o6,	%o0,	%l2
	move	%xcc,	%g3,	%i2
	sll	%i6,	%l0,	%o1
	stw	%i5,	[%l7 + 0x74]
	movrgz	%o4,	0x0C8,	%l5
	fnot1s	%f18,	%f8
	wr	%g0,	0x80,	%asi
	movcs	%icc,	%l1,	%g2
	movrlez	%o3,	%g6,	%o7
	fpadd32	%f2,	%f26,	%f8
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	ldx	[%l7 + 0x58],	%l6
	movn	%icc,	%i1,	%g1
	fbug	%fcc0,	loop_2718
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
	array16	%i4,	%i0,	%g4
	nop 	! 	ta	%icc,	0x2 changed by convert2hboot
loop_2718:
	edge8n	%i7,	%g5,	%i3
	fbge	%fcc3,	loop_2719
	nop 	! 	tgu	%xcc,	0x5 changed by convert2hboot
	fxor	%f28,	%f12,	%f28
	sth	%o2,	[%l7 + 0x32]
loop_2719:
	movpos	%icc,	%g7,	%l4
	bcc,a,pn	%icc,	loop_2720
	mulscc	%o5,	%o0,	%l2
	fsrc2s	%f9,	%f23
	bleu,a	loop_2721
loop_2720:
	nop 	! 	tneg	%icc,	0x3 changed by convert2hboot
	fnor	%f14,	%f30,	%f26
	wr	%g0,	0x04,	%asi
loop_2721:
	edge32	%i2,	%i6,	%g3
	fmovdvs	%icc,	%f26,	%f18
	edge16	%o1,	%l0,	%o4
	fmovsg	%xcc,	%f13,	%f14
	mulx	%l5,	0x1480,	%i5
	nop 	! 	tsubcctv	%l3,	%l1,	%o3 changed by convert2hboot
	edge32ln	%g2,	%o7,	%g6
	fexpand	%f3,	%f8
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	fmovdgu	%icc,	%f11,	%f5
	movl	%xcc,	%l6,	%i1
	alignaddr	%i4,	%g1,	%i0
	ba,a,pn	%icc,	loop_2722
	mova	%icc,	%g4,	%i7
	alignaddrl	%g5,	%o2,	%i3
	subcc	%g7,	%o5,	%l4
loop_2722:
	addccc	%o0,	0x1706,	%l2
	fmul8ulx16	%f10,	%f30,	%f2
	array8	%i2,	%i6,	%g3
	subcc	%o1,	0x066D,	%l0
	bgu,a,pt	%xcc,	loop_2723
	orcc	%o6,	0x0138,	%l5
	umul	%i5,	%o4,	%l1
	fmovdvc	%icc,	%f27,	%f3
loop_2723:
	bcs,a,pn	%xcc,	loop_2724
	swap	[%l7 + 0x34],	%l3
	array8	%o3,	%o7,	%g6
	srl	%l6,	%g2,	%i1
loop_2724:
	popc	0x12C5,	%i4
	fpadd16	%f20,	%f30,	%f10
	orncc	%g1,	%i0,	%g4
	nop 	! 	tsubcc	%g5,	%i7,	%i3 changed by convert2hboot
	fmovsvs	%xcc,	%f4,	%f23
	fmovdleu	%icc,	%f19,	%f8
	siam	0x3
	fnot2s	%f24,	%f19
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	bg,a,pt	%icc,	loop_2725
	bvs,a	%xcc,	loop_2726
	xnor	%g7,	0x0451,	%o2
	and	%l4,	0x1269,	%o5
loop_2725:
	andn	%l2,	0x19C6,	%i2
loop_2726:
	brlz	%i6,	loop_2727
	bge,pn	%xcc,	loop_2728
	xnorcc	%o0,	0x1596,	%o1
	bl,pn	%xcc,	loop_2729
loop_2727:
	sra	%g3,	0x11,	%o6
loop_2728:
	array8	%l5,	%i5,	%o4
	stx	%l1,	[%l7 + 0x48]
loop_2729:
	stb	%l3,	[%l7 + 0x54]
	fnot2	%f20,	%f4
	add	%o3,	%l0,	%g6
	sub	%l6,	%g2,	%o7
	movrgez	%i4,	0x043,	%i1
	fcmps	%fcc1,	%f24,	%f13
	wr	%g0,	0x89,	%asi
	movneg	%icc,	%g1,	%g4
	move	%xcc,	%i7,	%g5
	fpmerge	%f0,	%f25,	%f2
	edge8	%i3,	%o2,	%g7
	andncc	%o5,	%l2,	%i2
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
	srlx	%l4,	%o0,	%i6
	fcmpeq32	%f20,	%f6,	%o1
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	sdivcc	%o6,	0x0957,	%l5
	brgez	%i5,	loop_2730
	fpackfix	%f12,	%f8
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
	xor	%g3,	%o4,	%l1
loop_2730:
	fmovdg	%xcc,	%f29,	%f30
	movle	%xcc,	%o3,	%l0
	set	0x58, %g7
	nop	 ! 	lduha	[%l7 + %g7] 0x18,	%g6 ASI use changed by convert2hboot
	edge32ln	%l6,	%g2,	%l3
	subc	%o7,	0x022E,	%i1
	fmovdle	%icc,	%f14,	%f7
	edge32	%i0,	%g1,	%i4
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	or	%i7,	%g4,	%g5
	fbul	%fcc3,	loop_2731
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
	fpsub16s	%f18,	%f22,	%f14
	fmovsleu	%icc,	%f30,	%f16
loop_2731:
	fpack32	%f0,	%f2,	%f8
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
	edge32n	%i3,	%o2,	%g7
	brgz,a	%o5,	loop_2732
	bpos	loop_2733
	sdiv	%l2,	0x1976,	%l4
	nop 	! 	tle	%icc,	0x2 changed by convert2hboot
loop_2732:
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
loop_2733:
	move	%xcc,	%o0,	%i2
	brz	%o1,	loop_2734
	nop 	! 	taddcc	%i6,	0x108B,	%l5 changed by convert2hboot
	movrgz	%o6,	0x11E,	%g3
	fmovse	%xcc,	%f6,	%f4
loop_2734:
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
	fcmpgt16	%f20,	%f20,	%o4
	subcc	%l1,	%i5,	%l0
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	fmovsgu	%xcc,	%f29,	%f23
	movrgz	%g6,	0x068,	%o3
	bpos,pt	%xcc,	loop_2735
	fandnot1	%f30,	%f24,	%f26
	fmovrdlz	%l6,	%f24,	%f28
	wr	%g0,	0x80,	%asi
loop_2735:
	movre	%o7,	%i1,	%l3
	edge8l	%i0,	%i4,	%i7
	array8	%g1,	%g4,	%g5
	fornot2s	%f21,	%f8,	%f19
	brlez	%o2,	loop_2736
	movrlez	%i3,	0x2AA,	%o5
	fmovde	%xcc,	%f5,	%f31
	nop 	! 	te	%xcc,	0x5 changed by convert2hboot
loop_2736:
	sdivx	%g7,	0x15D8,	%l2
	srax	%l4,	0x16,	%o0
	srlx	%o1,	0x0F,	%i2
	addc	%l5,	%o6,	%g3
	movleu	%icc,	%i6,	%l1
	subc	%i5,	%o4,	%l0
	fbge,a	%fcc0,	loop_2737
	srl	%o3,	0x1E,	%l6
	movgu	%xcc,	%g2,	%o7
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
loop_2737:
	srax	%g6,	0x16,	%l3
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	movrlez	%i1,	0x3F3,	%i4
	movne	%xcc,	%i0,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%g1,	%f2,	%f28
	edge32	%g4,	%g5,	%i3
	add	%o2,	0x16CF,	%g7
	movrne	%o5,	%l2,	%l4
	edge8l	%o1,	%i2,	%o0
	edge16n	%l5,	%g3,	%i6
	movrlez	%o6,	%l1,	%i5
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	fxor	%f28,	%f0,	%f8
	srlx	%l0,	0x0D,	%o4
	xorcc	%l6,	%o3,	%o7
	fpsub32s	%f22,	%f21,	%f30
	set	0x4D, %g2
	nop	 ! 	lduba	[%l7 + %g2] 0x88,	%g2 ASI use changed by convert2hboot
	fnor	%f8,	%f4,	%f12
	fbue	%fcc3,	loop_2738
	nop 	! 	tvs	%xcc,	0x7 changed by convert2hboot
	sllx	%l3,	0x16,	%g6
	fnot1s	%f15,	%f10
loop_2738:
	nop
	setx	loop_2739,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	call	loop_2740
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	smulcc	%i1,	0x1C5A,	%i0
loop_2739:
	movg	%icc,	%i7,	%i4
loop_2740:
	popc	%g4,	%g1
	movge	%icc,	%g5,	%i3
	nop 	! 	tl	%icc,	0x1 changed by convert2hboot
	fpack16	%f22,	%f1
	membar	0x01
	movrlz	%g7,	0x03E,	%o5
	nop 	! 	tleu	%icc,	0x7 changed by convert2hboot
	addccc	%o2,	0x186E,	%l4
	nop 	! 	sir	0x0286 changed by convert2hboot
	fpmerge	%f5,	%f4,	%f24
	movgu	%xcc,	%o1,	%l2
	andn	%i2,	0x058E,	%o0
	sdivx	%l5,	0x1124,	%g3
	fpsub32	%f28,	%f26,	%f0
	bg,a,pn	%xcc,	loop_2741
	move	%xcc,	%i6,	%o6
	edge8	%i5,	%l1,	%o4
	ba,pn	%xcc,	loop_2742
loop_2741:
	mova	%icc,	%l6,	%o3
	movle	%icc,	%l0,	%g2
	sllx	%o7,	0x03,	%l3
loop_2742:
	fxors	%f13,	%f27,	%f22
	fpadd32s	%f19,	%f14,	%f30
	smul	%g6,	%i0,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x4F],	%i4
	movvc	%xcc,	%g4,	%g1
	movl	%xcc,	%g5,	%i1
	nop 	! 	tgu	%xcc,	0x3 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%g7,	%i3,	%o2
	orncc	%l4,	%o1,	%o5
	edge32n	%l2,	%o0,	%i2
	st	%f22,	[%l7 + 0x74]
	ldsh	[%l7 + 0x76],	%l5
	fmovrsgz	%i6,	%f30,	%f3
	set	0x54, %o0
	nop	 ! 	stwa	%o6,	[%l7 + %o0] 0x15 ASI use changed by convert2hboot
	orncc	%i5,	%g3,	%l1
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
	fnot2	%f24,	%f20
	std	%i6,	[%l7 + 0x30]
	edge32ln	%o3,	%l0,	%o4
	brgez	%o7,	loop_2743
	xnor	%l3,	0x1276,	%g6
	fcmped	%fcc0,	%f20,	%f24
	addc	%i0,	0x0A5C,	%i7
loop_2743:
	smulcc	%i4,	0x1872,	%g4
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
	sub	%g1,	%g5,	%g2
	movrne	%g7,	0x2FE,	%i3
	fblg	%fcc2,	loop_2744
	fmovde	%xcc,	%f24,	%f0
	fnor	%f4,	%f14,	%f24
	nop 	! 	tgu	%icc,	0x1 changed by convert2hboot
loop_2744:
	fandnot2	%f28,	%f18,	%f28
	movneg	%icc,	%o2,	%l4
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	mulscc	%o1,	0x1296,	%i1
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	orcc	%l2,	0x181E,	%o5
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
	fmovrde	%i2,	%f28,	%f20
	nop 	! 	taddcctv	%o0,	0x1BF0,	%i6 changed by convert2hboot
	brgz	%l5,	loop_2745
	subcc	%i5,	0x0746,	%o6
	fbul	%fcc3,	loop_2746
	movpos	%xcc,	%g3,	%l6
loop_2745:
	edge32l	%l1,	%l0,	%o4
	addccc	%o7,	0x10C0,	%l3
loop_2746:
	st	%f6,	[%l7 + 0x5C]
	andncc	%g6,	%i0,	%o3
	addcc	%i7,	%g4,	%g1
	nop 	! 	tl	%icc,	0x5 changed by convert2hboot
	edge32ln	%g5,	%g2,	%g7
	fcmpne16	%f6,	%f24,	%i3
	mulx	%o2,	0x1479,	%l4
	set	0x25, %g4
	nop	 ! 	ldstuba	[%l7 + %g4] 0x89,	%i4 ASI use changed by convert2hboot
	fmul8sux16	%f24,	%f22,	%f10
	ld	[%l7 + 0x2C],	%f13
	edge16	%o1,	%i1,	%o5
	movrlz	%i2,	0x284,	%o0
	fble,a	%fcc3,	loop_2747
	array16	%l2,	%l5,	%i6
	swap	[%l7 + 0x24],	%o6
	fbn	%fcc1,	loop_2748
loop_2747:
	nop 	! 	tsubcctv	%g3,	%i5,	%l1 changed by convert2hboot
	fandnot2s	%f21,	%f22,	%f2
	fbe	%fcc3,	loop_2749
loop_2748:
	fmovse	%icc,	%f31,	%f29
	brgz	%l0,	loop_2750
	fmovsg	%xcc,	%f25,	%f20
loop_2749:
	alignaddrl	%l6,	%o4,	%l3
	fcmpgt32	%f8,	%f22,	%o7
loop_2750:
	nop 	! 	tleu	%icc,	0x3 changed by convert2hboot
	nop 	! 	tgu	%xcc,	0x5 changed by convert2hboot
	move	%icc,	%g6,	%o3
	bneg	%icc,	loop_2751
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	fxnors	%f29,	%f25,	%f26
	fsrc2s	%f21,	%f13
loop_2751:
	sub	%i0,	0x0ECD,	%i7
	fmovdn	%xcc,	%f26,	%f29
	movrlz	%g1,	%g4,	%g2
	fmovrsne	%g7,	%f16,	%f28
	sub	%i3,	%g5,	%l4
	sub	%i4,	%o2,	%i1
	udivcc	%o5,	0x06B3,	%i2
	movle	%xcc,	%o0,	%o1
	fbn,a	%fcc2,	loop_2752
	fmovrdgz	%l2,	%f12,	%f0
	movrne	%l5,	0x0EF,	%i6
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
loop_2752:
	udivcc	%o6,	0x0AB5,	%i5
	mova	%xcc,	%g3,	%l1
	nop
	setx	loop_2753,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	udivx	%l0,	0x0022,	%l6
	fbule	%fcc1,	loop_2754
	srlx	%l3,	0x14,	%o7
loop_2753:
	sth	%g6,	[%l7 + 0x12]
	movneg	%xcc,	%o3,	%o4
loop_2754:
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
	sra	%i0,	0x1A,	%g1
	bpos,pt	%icc,	loop_2755
	fmovdneg	%xcc,	%f10,	%f2
	addccc	%i7,	%g2,	%g4
	subcc	%g7,	%i3,	%l4
loop_2755:
	fmovsn	%icc,	%f7,	%f3
	fbe	%fcc0,	loop_2756
	sdivx	%g5,	0x0B4E,	%i4
	smulcc	%o2,	%o5,	%i1
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
loop_2756:
	alignaddr	%i2,	%o1,	%o0
	andncc	%l2,	%l5,	%i6
	movcs	%xcc,	%i5,	%g3
	fmovsgu	%xcc,	%f1,	%f24
	set	0x40, %o2
	nop	 ! 	ldda	[%l7 + %o2] 0x14,	%f16 ASI use changed by convert2hboot
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	fnot1	%f0,	%f16
	mulx	%l1,	%l3,	%l6
	ble,a,pt	%icc,	loop_2757
	umulcc	%g6,	0x08FE,	%o7
	edge16ln	%o3,	%o4,	%i0
	andn	%g1,	0x11B0,	%g2
loop_2757:
	fmovse	%icc,	%f19,	%f7
	movrgz	%g4,	0x000,	%i7
	sdivcc	%g7,	0x00C1,	%i3
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	bcs,pt	%xcc,	loop_2758
	fsrc1s	%f2,	%f30
	popc	0x03FC,	%g5
	call	loop_2759
loop_2758:
	nop 	! 	tl	%icc,	0x5 changed by convert2hboot
	fmovscc	%icc,	%f15,	%f13
	srax	%l4,	%o2,	%i4
loop_2759:
	fands	%f26,	%f1,	%f17
	fbg	%fcc3,	loop_2760
	xorcc	%i1,	%o5,	%o1
	umul	%o0,	0x06A2,	%i2
	fones	%f14
loop_2760:
	smul	%l5,	%l2,	%i5
	lduw	[%l7 + 0x2C],	%g3
	fsrc1	%f22,	%f14
	movcc	%icc,	%o6,	%l0
	umul	%l1,	%i6,	%l6
	wr	%g0,	0x89,	%asi
	udivx	%o7,	0x13B3,	%o3
	smul	%o4,	%i0,	%g1
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
	movle	%icc,	%l3,	%g4
	movne	%xcc,	%g2,	%g7
	fmovd	%f8,	%f20
	set	0x30, %o6
	nop	 ! 	ldda	[%l7 + %o6] 0x2c,	%i6 ASI use changed by convert2hboot
	edge8l	%i3,	%l4,	%g5
	movvs	%xcc,	%o2,	%i4
	sub	%i1,	0x1FDA,	%o5
	ldstub	[%l7 + 0x64],	%o1
	movre	%i2,	0x2A7,	%l5
	movn	%xcc,	%o0,	%i5
	movrgez	%g3,	0x189,	%l2
	srlx	%l0,	0x03,	%l1
	subccc	%i6,	%l6,	%o6
	lduh	[%l7 + 0x2A],	%o7
	stb	%g6,	[%l7 + 0x22]
	edge16n	%o3,	%i0,	%o4
	move	%icc,	%l3,	%g1
	movgu	%xcc,	%g4,	%g7
	fmovsvc	%xcc,	%f5,	%f26
	set	0x0C, %l0
	lda	[%l7 + %l0] 0x80,	%f20
	set	0x67, %l6
	nop	 ! 	lduba	[%l7 + %l6] 0x88,	%g2 ASI use changed by convert2hboot
	st	%f20,	[%l7 + 0x58]
	movrne	%i3,	0x0C1,	%i7
	fors	%f8,	%f7,	%f5
	bne,pn	%icc,	loop_2761
	srl	%g5,	%o2,	%l4
	brlez,a	%i1,	loop_2762
	orn	%o5,	0x0BE9,	%i4
loop_2761:
	movrgez	%o1,	0x392,	%l5
	nop
	set	0x20, %i4
	stw	%i2,	[%l7 + %i4]
loop_2762:
	fmovs	%f6,	%f2
	srl	%i5,	%g3,	%o0
	fblg	%fcc3,	loop_2763
	xnor	%l0,	%l1,	%l2
	bcs,a,pt	%xcc,	loop_2764
	edge16l	%i6,	%o6,	%l6
loop_2763:
	movge	%xcc,	%o7,	%o3
	sra	%i0,	0x10,	%o4
loop_2764:
	fblg,a	%fcc3,	loop_2765
	subccc	%l3,	%g6,	%g1
	popc	0x076D,	%g7
	orn	%g2,	0x1BD0,	%g4
loop_2765:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	nop	 ! 	casa	[%l6] 0x80,	%i3,	%i7 ASI use changed by convert2hboot
	fmovspos	%xcc,	%f27,	%f26
	ble,a,pt	%xcc,	loop_2766
	fmovda	%xcc,	%f9,	%f5
	fmovdpos	%xcc,	%f29,	%f16
	edge32ln	%g5,	%l4,	%o2
loop_2766:
	sdiv	%i1,	0x0995,	%i4
	or	%o5,	%o1,	%i2
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	fbu,a	%fcc0,	loop_2767
	bneg,a	loop_2768
	nop
	setx loop_2769, %l0, %l1
	jmpl %l1, %i5
	add	%g3,	%o0,	%l0
loop_2767:
	movle	%icc,	%l1,	%l5
loop_2768:
	movle	%icc,	%i6,	%o6
loop_2769:
	nop
	set	0x18, %l4
	nop	 ! 	ldxa	[%l7 + %l4] 0x04,	%l6 ASI use changed by convert2hboot
	movpos	%icc,	%o7,	%l2
	add	%i0,	0x0922,	%o3
	nop 	! 	taddcc	%o4,	%g6,	%l3 changed by convert2hboot
	movvc	%icc,	%g1,	%g7
	subccc	%g2,	%g4,	%i7
	edge16l	%i3,	%l4,	%o2
	alignaddr	%g5,	%i1,	%i4
	movn	%icc,	%o5,	%i2
	fandnot1	%f14,	%f20,	%f18
	fcmple32	%f10,	%f18,	%i5
	bcc,a	%xcc,	loop_2770
	ldx	[%l7 + 0x68],	%o1
	lduw	[%l7 + 0x68],	%g3
	subc	%l0,	%o0,	%l1
loop_2770:
	movre	%l5,	%o6,	%i6
	movrgz	%o7,	0x156,	%l2
	srax	%i0,	%o3,	%l6
	fnands	%f20,	%f5,	%f4
	sethi	0x0B52,	%g6
	mulscc	%o4,	%g1,	%l3
	edge8l	%g2,	%g7,	%i7
	bl,pt	%icc,	loop_2771
	bcc,pt	%icc,	loop_2772
	fpack16	%f16,	%f15
	fxor	%f8,	%f16,	%f24
loop_2771:
	fsrc2	%f18,	%f22
loop_2772:
	srax	%g4,	%l4,	%o2
	wr	%g0,	0x89,	%asi
	udivx	%g5,	0x1028,	%i1
	fmovdneg	%xcc,	%f26,	%f31
	array8	%i4,	%o5,	%i2
	faligndata	%f8,	%f14,	%f24
	edge32	%o1,	%i5,	%g3
	fmovdg	%icc,	%f1,	%f12
	movne	%icc,	%l0,	%o0
	nop
	setx	loop_2773,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fmul8sux16	%f28,	%f16,	%f22
	fcmpd	%fcc2,	%f8,	%f30
	bleu,a	loop_2774
loop_2773:
	xnorcc	%l1,	0x03C6,	%l5
	sdivx	%o6,	0x102F,	%i6
	fones	%f21
loop_2774:
	fmul8x16au	%f27,	%f10,	%f8
	nop 	! 	taddcctv	%l2,	0x166F,	%i0 changed by convert2hboot
	move	%icc,	%o7,	%l6
	array32	%o3,	%g6,	%o4
	andcc	%l3,	0x1959,	%g1
	ldsw	[%l7 + 0x60],	%g7
	fpadd16	%f22,	%f12,	%f10
	fmovde	%icc,	%f12,	%f11
	nop 	! 	tpos	%icc,	0x6 changed by convert2hboot
	fmovs	%f6,	%f16
	fors	%f8,	%f13,	%f7
	edge32	%i7,	%g2,	%l4
	movvs	%icc,	%g4,	%i3
	set	0x13, %i0
	nop	 ! 	lduba	[%l7 + %i0] 0x10,	%g5 ASI use changed by convert2hboot
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	movneg	%icc,	%o2,	%i1
	subc	%i4,	%o5,	%i2
	bneg,a	%xcc,	loop_2775
	brz,a	%i5,	loop_2776
	ld	[%l7 + 0x58],	%f7
	ble	%icc,	loop_2777
loop_2775:
	fmovde	%icc,	%f21,	%f8
loop_2776:
	orcc	%g3,	0x12A2,	%l0
	set	0x31, %g3
	nop	 ! 	ldsba	[%l7 + %g3] 0x14,	%o1 ASI use changed by convert2hboot
loop_2777:
	sra	%l1,	0x08,	%o0
	array8	%o6,	%i6,	%l2
	brgz,a	%i0,	loop_2778
	fmovde	%xcc,	%f27,	%f9
	orn	%l5,	%o7,	%l6
	addcc	%o3,	0x0E9F,	%o4
loop_2778:
	fmovdge	%xcc,	%f30,	%f16
	fbue	%fcc1,	loop_2779
	bg,pt	%xcc,	loop_2780
	fand	%f24,	%f16,	%f24
	fbuge	%fcc3,	loop_2781
loop_2779:
	udiv	%l3,	0x1109,	%g1
loop_2780:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g7,	0x15,	%i7
loop_2781:
	ldd	[%l7 + 0x10],	%g6
	mulscc	%g2,	0x0CF3,	%g4
	mulscc	%i3,	%g5,	%o2
	fandnot2s	%f30,	%f13,	%f2
	umulcc	%i1,	%l4,	%o5
	udivx	%i4,	0x129B,	%i2
	movvs	%icc,	%g3,	%i5
	nop 	! 	tgu	%icc,	0x4 changed by convert2hboot
	sdivcc	%o1,	0x1245,	%l1
	ba,a	loop_2782
	movl	%icc,	%o0,	%o6
	fornot2	%f28,	%f28,	%f6
	xnorcc	%l0,	0x1306,	%i6
loop_2782:
	nop
	wr	%g0,	0x81,	%asi
	nop 	! 	tsubcc	%l5,	0x0EB8,	%o7 changed by convert2hboot
	set	0x4C, %i6
	sta	%f7,	[%l7 + %i6] 0x88
	fbuge	%fcc2,	loop_2783
	sdivcc	%l6,	0x0D0E,	%o3
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
loop_2783:
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	wr	%g0,	0x18,	%asi
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	fandnot2	%f4,	%f6,	%f2
	movpos	%icc,	%l2,	%g1
	edge8ln	%g7,	%i7,	%l3
	fornot2s	%f28,	%f1,	%f17
	fmovsvc	%xcc,	%f14,	%f9
	udiv	%g2,	0x0307,	%g4
	edge32	%g6,	%g5,	%o2
	movrlz	%i1,	%i3,	%o5
	mulscc	%i4,	0x0C8D,	%l4
	fmovda	%xcc,	%f29,	%f3
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
	sra	%g3,	%i2,	%o1
	nop 	! 	tgu	%icc,	0x4 changed by convert2hboot
	brz,a	%l1,	loop_2784
	andcc	%i5,	0x1DCC,	%o6
	xnorcc	%o0,	%i6,	%i0
	movleu	%icc,	%l0,	%o7
loop_2784:
	edge16ln	%l5,	%l6,	%o3
	set	0x08, %i5
	lda	[%l7 + %i5] 0x19,	%f3
	fsrc1s	%f8,	%f1
	fors	%f1,	%f18,	%f30
	sll	%l2,	0x17,	%g1
	add	%o4,	0x0439,	%i7
	fba,a	%fcc2,	loop_2785
	bg,a,pt	%icc,	loop_2786
	fmovrsne	%g7,	%f16,	%f21
	movrgz	%g2,	%g4,	%l3
loop_2785:
	movpos	%xcc,	%g5,	%g6
loop_2786:
	and	%o2,	0x0AC8,	%i3
	bpos,a	loop_2787
	fbu	%fcc3,	loop_2788
	fpadd32	%f16,	%f14,	%f22
	subcc	%o5,	%i1,	%i4
loop_2787:
	be,pn	%xcc,	loop_2789
loop_2788:
	orcc	%g3,	%i2,	%l4
	ldsw	[%l7 + 0x48],	%o1
	ldstub	[%l7 + 0x76],	%l1
loop_2789:
	nop
	wr	%g0,	0x2e,	%asi
	fnor	%f10,	%f30,	%f20
	array16	%o0,	%o6,	%i6
	popc	%i0,	%o7
	fbu	%fcc0,	loop_2790
	fbue,a	%fcc1,	loop_2791
	fbg,a	%fcc2,	loop_2792
	stw	%l0,	[%l7 + 0x70]
loop_2790:
	fxors	%f23,	%f23,	%f3
loop_2791:
	movre	%l5,	0x2A6,	%l6
loop_2792:
	fnegs	%f9,	%f7
	fmovdne	%xcc,	%f27,	%f3
	umul	%l2,	%o3,	%o4
	fabss	%f27,	%f17
	xorcc	%i7,	%g1,	%g7
	wr	%g0,	0x11,	%asi
	lduh	[%l7 + 0x60],	%g2
	nop 	! 	tle	%xcc,	0x5 changed by convert2hboot
	nop 	! 	ta	%icc,	0x6 changed by convert2hboot
	fmovscc	%icc,	%f27,	%f25
	fmovrdne	%l3,	%f8,	%f4
	movn	%icc,	%g6,	%o2
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	fbul,a	%fcc0,	loop_2793
	nop 	! 	tsubcc	%g5,	0x022F,	%i3 changed by convert2hboot
	udivx	%o5,	0x0271,	%i4
	array32	%i1,	%i2,	%g3
loop_2793:
	fbule,a	%fcc3,	loop_2794
	movrne	%l4,	%o1,	%i5
	sdiv	%l1,	0x1836,	%o6
	or	%o0,	0x0408,	%i0
loop_2794:
	bn	loop_2795
	fzero	%f20
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
	set	0x40, %i3
	nop	 ! 	stda	%f0,	[%l7 + %i3] 0x81 ASI use changed by convert2hboot
loop_2795:
	sll	%o7,	%l0,	%l5
	fnands	%f31,	%f21,	%f9
	srl	%i6,	%l6,	%l2
	orn	%o4,	0x00A6,	%i7
	popc	0x0205,	%o3
	fmovsle	%xcc,	%f29,	%f25
	fmovsn	%icc,	%f16,	%f9
	wr	%g0,	0x18,	%asi
	movleu	%xcc,	%g4,	%g7
	umul	%g2,	0x145A,	%g6
	fexpand	%f9,	%f20
	fbn	%fcc1,	loop_2796
	fmovsn	%icc,	%f13,	%f11
	fmovscs	%icc,	%f31,	%f0
	movg	%xcc,	%l3,	%o2
loop_2796:
	sra	%g5,	0x0A,	%o5
	udivcc	%i4,	0x0741,	%i3
	udiv	%i1,	0x186B,	%i2
	nop 	! 	tsubcctv	%g3,	%o1,	%i5 changed by convert2hboot
	orn	%l1,	%l4,	%o6
	subc	%o0,	0x0412,	%o7
	brnz	%l0,	loop_2797
	movle	%icc,	%i0,	%i6
	fmovsle	%icc,	%f5,	%f4
	fbue	%fcc3,	loop_2798
loop_2797:
	brgz	%l6,	loop_2799
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l5,	0x0F2D,	%o4
loop_2798:
	movg	%icc,	%l2,	%o3
loop_2799:
	nop 	! 	taddcctv	%i7,	0x0396,	%g4 changed by convert2hboot
	fsrc1	%f22,	%f16
	bge,a	loop_2800
	or	%g1,	0x0A39,	%g2
	movcs	%xcc,	%g7,	%g6
	nop 	! 	taddcc	%l3,	%o2,	%g5 changed by convert2hboot
loop_2800:
	movgu	%xcc,	%i4,	%i3
	andncc	%o5,	%i2,	%i1
	nop 	! 	taddcctv	%o1,	0x054B,	%g3 changed by convert2hboot
	mulx	%l1,	%l4,	%i5
	add	%o6,	%o0,	%l0
	wr	%g0,	0x18,	%asi
	wr	%g0,	0xe2,	%asi
	membar	#Sync
	wr	%g0,	0x88,	%asi
	fmovsn	%icc,	%f16,	%f17
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	taddcctv	%l6,	0x1CD4,	%l5 changed by convert2hboot
	mulx	%i0,	%o4,	%l2
	movge	%icc,	%i7,	%g4
	edge16	%g1,	%g2,	%g7
	alignaddr	%g6,	%o3,	%l3
	fcmpes	%fcc3,	%f24,	%f5
	wr	%g0,	0x04,	%asi
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	udiv	%g5,	0x1768,	%i3
	sdiv	%i4,	0x0C2E,	%o5
	siam	0x2
	fornot2	%f2,	%f30,	%f0
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	alignaddrl	%i2,	%i1,	%o1
	array8	%l1,	%l4,	%g3
	popc	0x058C,	%o6
	edge32l	%i5,	%l0,	%o0
	umul	%i6,	%o7,	%l5
	move	%icc,	%l6,	%o4
	fbu,a	%fcc2,	loop_2801
	movgu	%xcc,	%l2,	%i7
	nop 	! 	tsubcctv	%g4,	%g1,	%i0 changed by convert2hboot
	fsrc2	%f10,	%f2
loop_2801:
	nop
	set	0x0, %l1
	nop	 ! 	stxa	%g2,	[%g0 + %l1] 0x57 ASI use changed by convert2hboot
	umul	%g7,	%g6,	%l3
	sra	%o2,	0x0A,	%o3
	add	%i3,	0x1D93,	%g5
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
	bne,a	loop_2802
	subc	%i4,	0x1B9E,	%i2
	ldsb	[%l7 + 0x50],	%i1
	movleu	%icc,	%o1,	%l1
loop_2802:
	srax	%o5,	%l4,	%o6
	edge16n	%i5,	%g3,	%l0
	andncc	%o0,	%o7,	%l5
	bvs,a	%icc,	loop_2803
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%l6,	%i6,	%l2
	fbne,a	%fcc0,	loop_2804
loop_2803:
	addcc	%o4,	0x1888,	%i7
	xnorcc	%g1,	%g4,	%i0
	orn	%g7,	0x1E80,	%g6
loop_2804:
	edge32n	%g2,	%o2,	%l3
	fmovsg	%xcc,	%f16,	%f21
	movre	%i3,	0x1A0,	%g5
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o3,	0x064F,	%i2
	brz	%i1,	loop_2805
	movvc	%xcc,	%o1,	%i4
	fmovs	%f1,	%f3
	fands	%f10,	%f31,	%f23
loop_2805:
	fnegd	%f22,	%f4
	ldd	[%l7 + 0x48],	%l0
	andcc	%l4,	0x03EA,	%o5
	fmovsleu	%icc,	%f10,	%f11
	fcmple16	%f10,	%f4,	%i5
	bgu,pt	%icc,	loop_2806
	edge8ln	%o6,	%l0,	%o0
	mulx	%o7,	%l5,	%g3
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
loop_2806:
	edge32	%l6,	%i6,	%l2
	movge	%xcc,	%i7,	%o4
	fbg,a	%fcc1,	loop_2807
	bge,a,pn	%icc,	loop_2808
	fmovsvc	%xcc,	%f12,	%f14
	wr	%g0,	0x0c,	%asi
loop_2807:
	nop
	set	0x66, %i2
	nop	 ! 	ldsba	[%l7 + %i2] 0x10,	%i0 ASI use changed by convert2hboot
loop_2808:
	array16	%g7,	%g1,	%g6
	fmovd	%f24,	%f6
	add	%o2,	0x0F3B,	%l3
	fbe,a	%fcc3,	loop_2809
	edge8ln	%g2,	%i3,	%o3
	fandnot1s	%f21,	%f1,	%f27
	brgez,a	%g5,	loop_2810
loop_2809:
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	faligndata	%f16,	%f8,	%f16
	nop 	! 	tleu	%icc,	0x7 changed by convert2hboot
loop_2810:
	nop
	set	0x73, %g6
	nop	 ! 	lduba	[%l7 + %g6] 0x80,	%i1 ASI use changed by convert2hboot
	set	0x60, %o7
	lda	[%l7 + %o7] 0x18,	%f31
	nop 	! 	taddcctv	%i2,	0x1C89,	%o1 changed by convert2hboot
	nop
	setx	loop_2811,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fbul	%fcc1,	loop_2812
	stx	%i4,	[%l7 + 0x28]
	wr	%g0,	0x89,	%asi
loop_2811:
	xorcc	%l4,	0x0373,	%i5
loop_2812:
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	sra	%o5,	%l0,	%o6
	fmovsg	%icc,	%f12,	%f25
	fand	%f14,	%f4,	%f20
	add	%o7,	%o0,	%l5
	and	%g3,	%l6,	%l2
	fcmpes	%fcc1,	%f4,	%f21
	andcc	%i7,	%o4,	%g4
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	edge16ln	%i6,	%i0,	%g7
	ble	%icc,	loop_2813
	fxnor	%f12,	%f8,	%f24
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	srlx	%g1,	0x1F,	%g6
loop_2813:
	fbe,a	%fcc1,	loop_2814
	fmovsg	%icc,	%f1,	%f2
	wr	%g0,	0x81,	%asi
loop_2814:
	movvc	%icc,	%l3,	%g2
	sllx	%o3,	0x1B,	%i3
	edge16l	%i1,	%i2,	%g5
	fbne,a	%fcc0,	loop_2815
	nop 	! 	tcc	%xcc,	0x0 changed by convert2hboot
	edge16l	%o1,	%i4,	%l1
	movrne	%i5,	0x056,	%o5
loop_2815:
	bg,pt	%icc,	loop_2816
	bg,a	loop_2817
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	fmovse	%xcc,	%f28,	%f22
loop_2816:
	movgu	%icc,	%l4,	%l0
loop_2817:
	nop 	! 	tsubcc	%o6,	%o7,	%l5 changed by convert2hboot
	array32	%g3,	%l6,	%l2
	orcc	%i7,	%o0,	%o4
	srax	%g4,	%i6,	%i0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g7
	addc	%o2,	0x03F1,	%g6
	xnor	%g2,	%l3,	%o3
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	fpadd16	%f30,	%f6,	%f24
	fmovde	%xcc,	%f31,	%f23
	smul	%i3,	%i1,	%g5
	ldstub	[%l7 + 0x36],	%i2
	mulscc	%i4,	%o1,	%l1
	nop
	setx	loop_2818,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movrne	%i5,	%o5,	%l0
	edge16l	%l4,	%o6,	%o7
	lduw	[%l7 + 0x4C],	%g3
loop_2818:
	nop
	setx	loop_2819,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	bvs	loop_2820
	fcmpd	%fcc3,	%f30,	%f10
	fornot2	%f20,	%f18,	%f4
loop_2819:
	nop 	! 	tsubcctv	%l5,	0x05B1,	%l2 changed by convert2hboot
loop_2820:
	nop
	set	0x8, %o5
	nop	 ! 	stxa	%i7,	[%g0 + %o5] 0x21 ASI use changed by convert2hboot
	fcmpes	%fcc2,	%f19,	%f24
	fbu,a	%fcc1,	loop_2821
	movneg	%xcc,	%o0,	%l6
	xnor	%o4,	0x003F,	%i6
	fpsub16	%f28,	%f10,	%f22
loop_2821:
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	movleu	%xcc,	%g4,	%i0
	fzero	%f8
	bne,a	%xcc,	loop_2822
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	fmovsne	%icc,	%f7,	%f28
	fabsd	%f18,	%f6
loop_2822:
	ba,a	loop_2823
	addc	%g7,	0x149F,	%o2
	ldstub	[%l7 + 0x7D],	%g1
	sth	%g2,	[%l7 + 0x70]
loop_2823:
	fzeros	%f18
	wr	%g0,	0x80,	%asi
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
	andn	%g6,	%o3,	%i3
	wr	%g0,	0x04,	%asi
	ldsw	[%l7 + 0x74],	%g5
	movre	%i2,	%i4,	%o1
	bcs	%icc,	loop_2824
	sub	%l1,	0x11C2,	%i5
	for	%f26,	%f6,	%f18
	fbl	%fcc0,	loop_2825
loop_2824:
	fmovsgu	%xcc,	%f6,	%f3
	alignaddr	%o5,	%l4,	%l0
	movrlz	%o7,	0x358,	%g3
loop_2825:
	nop
	wr	%g0,	0x80,	%asi
	movg	%icc,	%o6,	%i7
	nop 	! 	tge	%icc,	0x2 changed by convert2hboot
	sethi	0x01ED,	%o0
	bvc,pn	%icc,	loop_2826
	subccc	%l6,	0x008A,	%o4
	and	%l2,	0x14A5,	%i6
	fbule,a	%fcc0,	loop_2827
loop_2826:
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	udiv	%i0,	0x1BDF,	%g4
	brlez,a	%o2,	loop_2828
loop_2827:
	fsrc1	%f0,	%f22
	fmovsg	%icc,	%f14,	%f25
	ldx	[%l7 + 0x28],	%g7
loop_2828:
	edge32	%g1,	%l3,	%g6
	set	0x11, %i7
	nop	 ! 	ldstuba	[%l7 + %i7] 0x0c,	%g2 ASI use changed by convert2hboot
	fmul8sux16	%f22,	%f14,	%f6
	fmovdvc	%icc,	%f19,	%f15
	fbuge,a	%fcc0,	loop_2829
	fmovsge	%xcc,	%f27,	%f9
	bvs,a,pt	%xcc,	loop_2830
	edge16n	%i3,	%o3,	%g5
loop_2829:
	ldstub	[%l7 + 0x63],	%i1
	nop
	set	0x27, %l5
	ldub	[%l7 + %l5],	%i2
loop_2830:
	fornot1	%f30,	%f20,	%f8
	movneg	%xcc,	%i4,	%o1
	edge32l	%l1,	%o5,	%i5
	nop 	! 	tsubcctv	%l4,	0x12D8,	%o7 changed by convert2hboot
	movcs	%icc,	%l0,	%l5
	srax	%o6,	0x0A,	%g3
	set	0x40, %i1
	nop	 ! 	ldda	[%l7 + %i1] 0x80,	%f0 ASI use changed by convert2hboot
	edge16	%i7,	%o0,	%l6
	nop 	! 	tvs	%icc,	0x6 changed by convert2hboot
	edge8	%o4,	%i6,	%i0
	smul	%g4,	0x0436,	%l2
	xnorcc	%o2,	0x1D8E,	%g7
	orcc	%g1,	%g6,	%l3
	nop 	! 	tsubcc	%i3,	0x083E,	%o3 changed by convert2hboot
	fmovdg	%xcc,	%f17,	%f3
	brgez,a	%g2,	loop_2831
	fbl	%fcc3,	loop_2832
	movvc	%xcc,	%i1,	%i2
	fmovsgu	%icc,	%f0,	%f4
loop_2831:
	nop 	! 	tvs	%xcc,	0x7 changed by convert2hboot
loop_2832:
	fsrc1s	%f25,	%f31
	bcc,a	%xcc,	loop_2833
	mova	%icc,	%g5,	%i4
	fmovdcs	%xcc,	%f26,	%f10
	fcmpne32	%f2,	%f6,	%o1
loop_2833:
	srlx	%l1,	0x04,	%o5
	fmovdle	%icc,	%f26,	%f5
	sth	%i5,	[%l7 + 0x56]
	wr	%g0,	0x0c,	%asi
	wr	%g0,	0x18,	%asi
	fmovsle	%icc,	%f24,	%f26
	subc	%l5,	%l0,	%o6
	andncc	%g3,	%o0,	%i7
	edge8	%l6,	%o4,	%i6
	sra	%g4,	%l2,	%i0
	ldd	[%l7 + 0x38],	%f26
	movge	%icc,	%g7,	%o2
	fandnot2	%f22,	%f4,	%f24
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	edge32ln	%g1,	%g6,	%i3
	brgez	%l3,	loop_2834
	movrgez	%o3,	%i1,	%g2
	udivcc	%i2,	0x1044,	%i4
	movrlez	%o1,	%g5,	%l1
loop_2834:
	ldsh	[%l7 + 0x58],	%o5
	mulscc	%o7,	%i5,	%l4
	fmovdn	%xcc,	%f31,	%f22
	smulcc	%l5,	%o6,	%l0
	fbne,a	%fcc0,	loop_2835
	movneg	%xcc,	%o0,	%i7
	movle	%icc,	%l6,	%g3
	mulx	%o4,	0x1DD7,	%i6
loop_2835:
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	fnegd	%f30,	%f18
	move	%xcc,	%l2,	%i0
	sll	%g4,	%o2,	%g1
	fmuld8ulx16	%f25,	%f5,	%f18
	nop
	set	0x30, %g5
	stx	%g7,	[%l7 + %g5]
	movvc	%icc,	%g6,	%i3
	set	0x78, %o1
	nop	 ! 	lduba	[%l7 + %o1] 0x0c,	%l3 ASI use changed by convert2hboot
	edge16	%i1,	%g2,	%o3
	set	0x18, %o4
	nop	 ! 	prefetcha	[%l7 + %o4] 0x0c,	 0x0 ASI use changed by convert2hboot
	mova	%icc,	%o1,	%g5
	orn	%l1,	%o5,	%o7
	edge32l	%i5,	%i4,	%l5
	srl	%l4,	0x05,	%l0
	mova	%icc,	%o0,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l6,	%g3,	%o4
	array8	%i6,	%l2,	%i0
	set	0x7E, %l2
	nop	 ! 	lduha	[%l7 + %l2] 0x0c,	%o6 ASI use changed by convert2hboot
	fmovsneg	%icc,	%f29,	%f12
	popc	0x112D,	%o2
	movge	%icc,	%g4,	%g1
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
	fzeros	%f0
	fcmps	%fcc0,	%f1,	%f31
	udivx	%g7,	0x0A03,	%g6
	wr	%g0,	0x18,	%asi
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	ble,a,pn	%icc,	loop_2836
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
	be	loop_2837
	sra	%i1,	%g2,	%i3
loop_2836:
	fmovsne	%xcc,	%f27,	%f11
	subccc	%i2,	%o3,	%o1
loop_2837:
	fbul,a	%fcc3,	loop_2838
	fpmerge	%f25,	%f24,	%f12
	movg	%icc,	%l1,	%o5
	edge32	%g5,	%i5,	%o7
loop_2838:
	stx	%l5,	[%l7 + 0x78]
	fzeros	%f9
	fmovsn	%icc,	%f4,	%f11
	nop
	setx	loop_2839,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fcmpgt16	%f0,	%f28,	%i4
	fpackfix	%f26,	%f26
	std	%f16,	[%l7 + 0x50]
loop_2839:
	fbge,a	%fcc0,	loop_2840
	bcs,a	%xcc,	loop_2841
	fmuld8sux16	%f24,	%f31,	%f8
	and	%l4,	%l0,	%o0
loop_2840:
	movl	%xcc,	%l6,	%g3
loop_2841:
	bcs,pt	%xcc,	loop_2842
	fmovrdgez	%i7,	%f14,	%f18
	mulx	%o4,	0x1549,	%i6
	fmovda	%xcc,	%f23,	%f5
loop_2842:
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	fmovsgu	%icc,	%f23,	%f7
	fpack16	%f30,	%f22
	srax	%l2,	0x1C,	%o6
	sdiv	%i0,	0x1003,	%g4
	fmovsvs	%icc,	%f30,	%f28
	nop
	setx loop_2843, %l0, %l1
	jmpl %l1, %g1
	edge8	%g7,	%o2,	%l3
	fcmple32	%f22,	%f18,	%g6
	movne	%xcc,	%i1,	%g2
loop_2843:
	sdiv	%i2,	0x17B1,	%o3
	bge,pn	%icc,	loop_2844
	edge8l	%i3,	%l1,	%o1
	andncc	%o5,	%i5,	%o7
	mulx	%l5,	0x0309,	%i4
loop_2844:
	edge8ln	%g5,	%l4,	%l0
	andncc	%l6,	%o0,	%g3
	set	0x50, %o3
	nop	 ! 	ldsba	[%l7 + %o3] 0x18,	%i7 ASI use changed by convert2hboot
	bn	loop_2845
	movpos	%xcc,	%i6,	%l2
	edge32n	%o6,	%i0,	%g4
	fbug,a	%fcc3,	loop_2846
loop_2845:
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	wr	%g0,	0x80,	%asi
loop_2846:
	bgu	loop_2847
	edge8ln	%g7,	%o4,	%l3
	bn,pn	%xcc,	loop_2848
	membar	0x3E
loop_2847:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
loop_2848:
	brnz,a	%o2,	loop_2849
	xorcc	%i2,	0x1D78,	%g2
	xorcc	%i3,	%l1,	%o3
	fzeros	%f10
loop_2849:
	fbul,a	%fcc3,	loop_2850
	popc	0x19F0,	%o1
	move	%xcc,	%o5,	%o7
	movrlez	%l5,	0x13A,	%i5
loop_2850:
	umul	%g5,	%l4,	%l0
	fbl	%fcc3,	loop_2851
	array32	%i4,	%l6,	%o0
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	prefetch	[%l7 + 0x48],	 0x0
loop_2851:
	srax	%i7,	0x06,	%i6
	fbuge	%fcc3,	loop_2852
	xnor	%g3,	%l2,	%o6
	subcc	%i0,	%g4,	%g1
	movvc	%xcc,	%g7,	%l3
loop_2852:
	fmovscc	%icc,	%f0,	%f29
	movrgez	%o4,	0x064,	%g6
	bshuffle	%f18,	%f10,	%f4
	edge32ln	%i1,	%i2,	%g2
	bcs,a,pn	%xcc,	loop_2853
	fmovsne	%xcc,	%f26,	%f15
	fmovd	%f4,	%f4
	movpos	%xcc,	%i3,	%o2
loop_2853:
	movre	%o3,	%l1,	%o5
	ldsb	[%l7 + 0x4D],	%o1
	alignaddrl	%l5,	%i5,	%o7
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	wr	%g0,	0x88,	%asi
	movrlz	%l4,	0x051,	%i4
	movcs	%xcc,	%l0,	%o0
	swap	[%l7 + 0x64],	%i7
	movrgz	%l6,	0x23D,	%i6
	nop
	setx	loop_2854,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	tsubcc	%g3,	0x0F1C,	%l2 changed by convert2hboot
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
	fones	%f24
loop_2854:
	smulcc	%i0,	%g4,	%o6
	movl	%xcc,	%g1,	%l3
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	movgu	%xcc,	%g7,	%g6
	bn	loop_2855
	popc	0x1FC2,	%o4
	set	0x18, %l3
	nop	 ! 	ldxa	[%l7 + %l3] 0x88,	%i2 ASI use changed by convert2hboot
loop_2855:
	movrgz	%i1,	0x32E,	%g2
	movrne	%i3,	0x178,	%o3
	andn	%l1,	%o5,	%o1
	srax	%o2,	%i5,	%o7
	fcmpes	%fcc1,	%f28,	%f27
	movne	%icc,	%l5,	%l4
	movgu	%icc,	%i4,	%l0
	lduh	[%l7 + 0x24],	%g5
	subcc	%i7,	0x12CF,	%l6
	movrne	%i6,	%g3,	%o0
	srlx	%i0,	0x07,	%l2
	wr	%g0,	0x81,	%asi
	wr	%g0,	0x18,	%asi
	fmovdvc	%xcc,	%f10,	%f14
	fbg	%fcc2,	loop_2856
	be	%xcc,	loop_2857
	nop 	! 	tvc	%xcc,	0x7 changed by convert2hboot
	edge32	%g1,	%l3,	%g4
loop_2856:
	nop 	! 	taddcctv	%g7,	%o4,	%i2 changed by convert2hboot
loop_2857:
	mulx	%g6,	%g2,	%i1
	xorcc	%i3,	%l1,	%o5
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	fbne,a	%fcc2,	loop_2858
	fcmped	%fcc1,	%f18,	%f22
	addcc	%o1,	0x0004,	%o3
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
loop_2858:
	nop 	! 	tsubcctv	%o2,	0x0F13,	%o7 changed by convert2hboot
	edge16ln	%i5,	%l4,	%i4
	nop 	! 	tcc	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	fmovrslz	%l0,	%f16,	%f21
	wr	%g0,	0x0c,	%asi
	fblg	%fcc1,	loop_2859
	fmul8x16au	%f12,	%f23,	%f28
	bcs	%xcc,	loop_2860
	movneg	%xcc,	%i7,	%l6
loop_2859:
	fnot2s	%f27,	%f17
	sdivx	%i6,	0x10AE,	%g3
loop_2860:
	fblg	%fcc2,	loop_2861
	srl	%g5,	0x12,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_2862, %l0, %l1
	jmpl %l1, %l2
loop_2861:
	array16	%o6,	%g1,	%l3
	smulcc	%o0,	%g7,	%o4
	edge8l	%g4,	%i2,	%g6
loop_2862:
	edge8ln	%g2,	%i1,	%i3
	nop 	! 	tg	%xcc,	0x0 changed by convert2hboot
	wr	%g0,	0x88,	%asi
	fpadd16s	%f16,	%f12,	%f4
	fmovde	%icc,	%f6,	%f8
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	movcs	%xcc,	%o5,	%o1
	fxor	%f28,	%f10,	%f28
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	edge32l	%o3,	%o2,	%o7
	andncc	%i5,	%l4,	%i4
	std	%f4,	[%l7 + 0x58]
	popc	%l0,	%i7
	array16	%l5,	%i6,	%g3
	andcc	%g5,	%i0,	%l2
	fandnot1	%f6,	%f20,	%f14
	fpadd16	%f30,	%f10,	%f2
	nop 	! 	tge	%icc,	0x0 changed by convert2hboot
	movgu	%xcc,	%o6,	%g1
	bn,a	loop_2863
	be	loop_2864
	fbl,a	%fcc2,	loop_2865
	movpos	%xcc,	%l6,	%o0
loop_2863:
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
loop_2864:
	ble,pn	%xcc,	loop_2866
loop_2865:
	stw	%l3,	[%l7 + 0x60]
	edge8n	%o4,	%g4,	%i2
	fones	%f30
loop_2866:
	edge8ln	%g7,	%g6,	%i1
	alignaddrl	%g2,	%l1,	%o5
	prefetch	[%l7 + 0x44],	 0x3
	fmovsa	%xcc,	%f18,	%f3
	movn	%xcc,	%o1,	%i3
	ld	[%l7 + 0x28],	%f7
	fcmpgt16	%f20,	%f18,	%o2
	be,a,pt	%icc,	loop_2867
	movrgz	%o7,	0x334,	%o3
	srl	%i5,	0x0E,	%l4
	edge8l	%l0,	%i7,	%l5
loop_2867:
	move	%xcc,	%i6,	%g3
	srlx	%g5,	%i4,	%l2
	fornot1	%f30,	%f22,	%f0
	sdivcc	%i0,	0x0855,	%o6
	be,a	loop_2868
	andcc	%l6,	%g1,	%l3
	wr	%g0,	0xea,	%asi
	membar	#Sync
loop_2868:
	fnot1s	%f30,	%f25
	edge32	%o0,	%i2,	%g7
	movrlez	%g4,	%g6,	%i1
	bl,a,pt	%icc,	loop_2869
	edge32	%g2,	%o5,	%o1
	ldd	[%l7 + 0x70],	%i2
	move	%xcc,	%o2,	%o7
loop_2869:
	xorcc	%o3,	%l1,	%i5
	fmovrse	%l4,	%f1,	%f22
	sra	%i7,	0x07,	%l5
	fmovrdne	%i6,	%f4,	%f24
	edge16ln	%g3,	%g5,	%l0
	fxor	%f16,	%f16,	%f24
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	movvc	%icc,	%i4,	%i0
	udivx	%o6,	0x1690,	%l2
	fcmpes	%fcc3,	%f18,	%f7
	movrgz	%l6,	0x330,	%g1
	nop 	! 	taddcc	%l3,	0x193E,	%o4 changed by convert2hboot
	edge16n	%o0,	%g7,	%g4
	umulcc	%i2,	0x0938,	%i1
	wr	%g0,	0x04,	%asi
	fmovdg	%icc,	%f2,	%f16
	srax	%g6,	%g2,	%o5
	fcmpd	%fcc1,	%f22,	%f18
	fbule,a	%fcc2,	loop_2870
	nop 	! 	sir	0x0C15 changed by convert2hboot
	movleu	%icc,	%o1,	%i3
	alignaddrl	%o7,	%o3,	%o2
loop_2870:
	fmovdgu	%icc,	%f29,	%f0
	movg	%icc,	%i5,	%l4
	bcs,a,pn	%xcc,	loop_2871
	mova	%icc,	%i7,	%l1
	brlez,a	%l5,	loop_2872
	nop 	! 	tsubcc	%g3,	0x118D,	%i6 changed by convert2hboot
loop_2871:
	fmovdg	%icc,	%f27,	%f15
	nop
	setx loop_2873, %l0, %l1
	jmpl %l1, %g5
loop_2872:
	be	%icc,	loop_2874
	fmovdle	%xcc,	%f17,	%f18
loop_2873:
	bne,pn	%xcc,	loop_2875
loop_2874:
	membar	0x00
	move	%icc,	%l0,	%i4
	srl	%o6,	0x08,	%l2
loop_2875:
	fnot1s	%f30,	%f10
	umulcc	%i0,	%g1,	%l6
	bshuffle	%f14,	%f26,	%f16
	nop 	! 	tsubcc	%o4,	%o0,	%g7 changed by convert2hboot
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	edge16l	%i2,	%g6,	%g2
	xor	%i1,	%o5,	%i3
	ba	loop_2876
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
	ble,pt	%icc,	loop_2877
	brgz	%o1,	loop_2878
loop_2876:
	swap	[%l7 + 0x4C],	%o3
	and	%o7,	%i5,	%o2
loop_2877:
	umulcc	%l4,	0x0BF1,	%i7
loop_2878:
	mulx	%l1,	0x09D2,	%g3
	mulscc	%l5,	0x0DE3,	%g5
	udiv	%i6,	0x13DB,	%l0
	fbne,a	%fcc1,	loop_2879
	sdivcc	%o6,	0x0E5F,	%i4
	udiv	%l2,	0x1588,	%i0
	fexpand	%f22,	%f30
loop_2879:
	alignaddrl	%g1,	%l6,	%o0
	edge16ln	%o4,	%l3,	%g4
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	alignaddrl	%g7,	%i2,	%g6
	bleu,a	%icc,	loop_2880
	bpos,pn	%icc,	loop_2881
	movneg	%icc,	%i1,	%o5
	nop 	! 	tn	%icc,	0x5 changed by convert2hboot
loop_2880:
	fmovse	%icc,	%f21,	%f26
loop_2881:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%i3,	%o1
	edge32l	%o3,	%o7,	%g2
	ba	loop_2882
	udiv	%i5,	0x01F6,	%o2
	move	%icc,	%l4,	%l1
	std	%f12,	[%l7 + 0x38]
loop_2882:
	andcc	%g3,	0x04DA,	%l5
	nop 	! 	sir	0x194E changed by convert2hboot
	fabsd	%f2,	%f22
	add	%l7,	0x54,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g5
	edge8ln	%i7,	%l0,	%o6
	and	%i4,	0x1C54,	%l2
	xnorcc	%g1,	0x0012,	%l6
	fmovsneg	%icc,	%f0,	%f19
	edge16ln	%o0,	%o4,	%i0
	fmovsn	%xcc,	%f15,	%f24
	srl	%g4,	%g7,	%l3
	movg	%xcc,	%g6,	%i1
	fmovsle	%xcc,	%f15,	%f31
	edge8l	%i2,	%o5,	%i3
	edge16n	%o3,	%o1,	%o7
	fnand	%f26,	%f30,	%f4
	fmovrdgz	%g2,	%f0,	%f0
	fcmpeq16	%f2,	%f28,	%i5
	membar	0x00
	ldd	[%l7 + 0x50],	%o2
	move	%xcc,	%l4,	%l1
	fmul8ulx16	%f6,	%f8,	%f8
	fmovsneg	%xcc,	%f19,	%f12
	nop 	! 	tsubcc	%g3,	%l5,	%i6 changed by convert2hboot
	bl,a	loop_2883
	fsrc2	%f16,	%f16
	fmul8x16	%f18,	%f22,	%f16
	sub	%i7,	0x1A6B,	%g5
loop_2883:
	movl	%xcc,	%l0,	%o6
	edge8l	%i4,	%g1,	%l2
	nop
	setx	loop_2884,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	ta	%icc,	0x6 changed by convert2hboot
	movpos	%icc,	%l6,	%o4
	set	0x58, %g7
	nop	 ! 	lduwa	[%l7 + %g7] 0x80,	%o0 ASI use changed by convert2hboot
loop_2884:
	nop 	! 	taddcc	%i0,	%g7,	%l3 changed by convert2hboot
	addccc	%g6,	%i1,	%i2
	bl	loop_2885
	edge8l	%o5,	%g4,	%i3
	movcc	%icc,	%o1,	%o7
	fornot1s	%f20,	%f27,	%f2
loop_2885:
	movn	%icc,	%o3,	%g2
	movrgz	%i5,	0x0BA,	%o2
	array32	%l4,	%g3,	%l5
	set	0x40, %g1
	nop	 ! 	prefetcha	[%l7 + %g1] 0x19,	 0x3 ASI use changed by convert2hboot
	smul	%i6,	0x1423,	%g5
	array16	%l0,	%i7,	%o6
	ldx	[%l7 + 0x50],	%g1
	orn	%i4,	%l2,	%l6
	set	0x2E, %o0
	nop	 ! 	lduha	[%l7 + %o0] 0x18,	%o0 ASI use changed by convert2hboot
	addc	%i0,	0x002F,	%o4
	addc	%l3,	%g6,	%i1
	bleu,a	loop_2886
	edge32n	%g7,	%i2,	%o5
	fornot1	%f30,	%f14,	%f18
	std	%i2,	[%l7 + 0x38]
loop_2886:
	brz,a	%g4,	loop_2887
	array32	%o7,	%o3,	%o1
	fpadd16s	%f29,	%f21,	%f9
	mulx	%i5,	%o2,	%g2
loop_2887:
	fbne	%fcc1,	loop_2888
	orcc	%g3,	0x18AA,	%l5
	fmovsl	%icc,	%f10,	%f1
	fbne,a	%fcc2,	loop_2889
loop_2888:
	fxnor	%f30,	%f16,	%f12
	fmovrsgez	%l4,	%f3,	%f0
	fmovrde	%l1,	%f10,	%f30
loop_2889:
	nop 	! 	sir	0x1392 changed by convert2hboot
	fbne	%fcc1,	loop_2890
	fnors	%f8,	%f21,	%f1
	fmovsn	%icc,	%f26,	%f2
	fornot1	%f18,	%f26,	%f10
loop_2890:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	nop	 ! 	casxa	[%l6] 0x18,	%i6,	%l0 ASI use changed by convert2hboot
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	movn	%xcc,	%i7,	%g5
	for	%f16,	%f24,	%f26
	fbul	%fcc2,	loop_2891
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	edge8	%g1,	%o6,	%i4
	movl	%xcc,	%l2,	%o0
loop_2891:
	srl	%i0,	%o4,	%l3
	prefetch	[%l7 + 0x78],	 0x3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g6
	nop	 ! 	casa	[%l6] 0x18,	%g6,	%i1 ASI use changed by convert2hboot
	nop 	! 	tleu	%icc,	0x6 changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x6 changed by convert2hboot
	set	0x7B, %g2
	nop	 ! 	ldstuba	[%l7 + %g2] 0x11,	%l6 ASI use changed by convert2hboot
	nop 	! 	tle	%xcc,	0x0 changed by convert2hboot
	st	%f11,	[%l7 + 0x34]
	bvs	loop_2892
	subc	%i2,	%g7,	%o5
	stb	%g4,	[%l7 + 0x44]
	for	%f0,	%f14,	%f20
loop_2892:
	edge32n	%o7,	%i3,	%o3
	srax	%i5,	0x09,	%o1
	udivx	%o2,	0x0587,	%g3
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	xnorcc	%g2,	%l5,	%l4
	fmovdneg	%xcc,	%f17,	%f8
	andncc	%i6,	%l0,	%i7
	edge8l	%g5,	%l1,	%g1
	nop 	! 	te	%icc,	0x3 changed by convert2hboot
	movgu	%xcc,	%i4,	%o6
	smulcc	%o0,	0x06E0,	%l2
	membar	0x5D
	movrgz	%o4,	%i0,	%l3
	nop 	! 	tsubcctv	%i1,	%l6,	%i2 changed by convert2hboot
	xnorcc	%g6,	%o5,	%g7
	edge16ln	%o7,	%i3,	%o3
	fble,a	%fcc3,	loop_2893
	smulcc	%i5,	%o1,	%g4
	fmovrdlez	%g3,	%f8,	%f2
	edge32l	%o2,	%l5,	%l4
loop_2893:
	fmovdneg	%icc,	%f5,	%f12
	orncc	%g2,	%i6,	%l0
	alignaddr	%i7,	%g5,	%l1
	movrlz	%i4,	%g1,	%o0
	sdivcc	%o6,	0x0DBB,	%o4
	andn	%l2,	0x091B,	%i0
	fmovscs	%icc,	%f10,	%f22
	nop 	! 	taddcctv	%l3,	%l6,	%i2 changed by convert2hboot
	alignaddrl	%i1,	%g6,	%g7
	nop 	! 	tle	%icc,	0x6 changed by convert2hboot
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	edge32	%o7,	%i3,	%o3
	nop 	! 	ta	%xcc,	0x7 changed by convert2hboot
	movvc	%xcc,	%i5,	%o5
	movcs	%xcc,	%o1,	%g4
	edge8n	%g3,	%o2,	%l4
	nop 	! 	tg	%xcc,	0x3 changed by convert2hboot
	edge8n	%g2,	%i6,	%l5
	alignaddrl	%i7,	%l0,	%l1
	fsrc1s	%f22,	%f31
	edge32l	%i4,	%g5,	%g1
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	udivx	%o0,	0x0D8C,	%o6
	fones	%f30
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	fmovd	%f28,	%f20
	fpadd32	%f10,	%f28,	%f18
	ld	[%l7 + 0x18],	%f14
	fabss	%f25,	%f21
	fbg	%fcc1,	loop_2894
	fxors	%f3,	%f23,	%f23
	movrlz	%o4,	0x1DE,	%i0
	sllx	%l3,	%l6,	%l2
loop_2894:
	and	%i1,	0x1B29,	%g6
	std	%i2,	[%l7 + 0x58]
	st	%f13,	[%l7 + 0x40]
	sdiv	%o7,	0x086B,	%g7
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
	bgu,a	%xcc,	loop_2895
	ldx	[%l7 + 0x18],	%i3
	nop 	! 	tle	%icc,	0x3 changed by convert2hboot
	fbuge	%fcc2,	loop_2896
loop_2895:
	edge32n	%i5,	%o5,	%o3
	set	0x38, %g4
	nop	 ! 	prefetcha	[%l7 + %g4] 0x81,	 0x0 ASI use changed by convert2hboot
loop_2896:
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	xorcc	%g3,	%o2,	%l4
	bl	loop_2897
	fmovscs	%xcc,	%f7,	%f2
	nop 	! 	tcc	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x7 changed by convert2hboot
loop_2897:
	sll	%o1,	%i6,	%l5
	fand	%f22,	%f10,	%f20
	nop 	! 	ta	%xcc,	0x2 changed by convert2hboot
	movleu	%xcc,	%g2,	%i7
	fba,a	%fcc3,	loop_2898
	fblg,a	%fcc0,	loop_2899
	fbule,a	%fcc0,	loop_2900
	movgu	%icc,	%l0,	%i4
loop_2898:
	sll	%l1,	0x0D,	%g1
loop_2899:
	sdivcc	%g5,	0x17AD,	%o0
loop_2900:
	movle	%xcc,	%o4,	%o6
	edge16	%i0,	%l6,	%l3
	edge8n	%i1,	%g6,	%i2
	prefetch	[%l7 + 0x40],	 0x2
	nop 	! 	tle	%xcc,	0x2 changed by convert2hboot
	fzero	%f20
	nop
	setx loop_2901, %l0, %l1
	jmpl %l1, %l2
	fnegs	%f4,	%f1
	fbug,a	%fcc2,	loop_2902
	nop 	! 	tgu	%icc,	0x4 changed by convert2hboot
loop_2901:
	movrlz	%g7,	%i3,	%o7
	fmovd	%f30,	%f26
loop_2902:
	fmuld8ulx16	%f9,	%f28,	%f14
	brnz,a	%o5,	loop_2903
	fcmple32	%f18,	%f16,	%o3
	set	0x14, %o6
	lda	[%l7 + %o6] 0x0c,	%f10
loop_2903:
	ble	%icc,	loop_2904
	edge32ln	%g4,	%i5,	%g3
	bneg,a,pn	%icc,	loop_2905
	stw	%l4,	[%l7 + 0x70]
loop_2904:
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
loop_2905:
	fmovdvs	%icc,	%f10,	%f12
	ldsh	[%l7 + 0x62],	%o2
	orn	%o1,	%l5,	%i6
	addcc	%i7,	0x0300,	%l0
	nop 	! 	tge	%icc,	0x3 changed by convert2hboot
	movge	%xcc,	%i4,	%g2
	andcc	%l1,	%g5,	%g1
	movrgez	%o4,	%o6,	%o0
	fnor	%f20,	%f4,	%f26
	edge8ln	%i0,	%l3,	%l6
	mulx	%g6,	%i2,	%i1
	set	0x78, %l0
	nop	 ! 	ldxa	[%l7 + %l0] 0x11,	%g7 ASI use changed by convert2hboot
	edge8	%i3,	%o7,	%l2
	edge32n	%o5,	%o3,	%g4
	xnor	%g3,	0x1CF7,	%l4
	ldsh	[%l7 + 0x0A],	%o2
	bn,a,pt	%icc,	loop_2906
	sth	%o1,	[%l7 + 0x2A]
	movrgez	%l5,	0x2FB,	%i5
	nop 	! 	taddcctv	%i6,	0x06DC,	%l0 changed by convert2hboot
loop_2906:
	fmovrse	%i4,	%f5,	%f0
	subc	%i7,	0x1E49,	%l1
	std	%f24,	[%l7 + 0x08]
	movvc	%icc,	%g2,	%g5
	fsrc1	%f28,	%f2
	edge32ln	%o4,	%g1,	%o6
	fbuge	%fcc3,	loop_2907
	srlx	%o0,	%l3,	%l6
	wr	%g0,	0x16,	%asi
	membar	#Sync
loop_2907:
	array32	%i0,	%i2,	%i1
	fmovdle	%icc,	%f4,	%f6
	bvs	%xcc,	loop_2908
	brnz,a	%g6,	loop_2909
	sdivcc	%i3,	0x04F0,	%o7
	wr	%g0,	0x19,	%asi
loop_2908:
	andn	%l2,	%o5,	%o3
loop_2909:
	siam	0x2
	fmovdl	%xcc,	%f13,	%f0
	sethi	0x0C3D,	%g3
	movrlz	%l4,	0x13B,	%o2
	popc	0x14C5,	%o1
	movneg	%icc,	%l5,	%i5
	smul	%i6,	%l0,	%g4
	fba,a	%fcc0,	loop_2910
	ble,pt	%xcc,	loop_2911
	bneg	loop_2912
	movgu	%xcc,	%i4,	%i7
loop_2910:
	mova	%icc,	%l1,	%g5
loop_2911:
	ldd	[%l7 + 0x48],	%f4
loop_2912:
	fmuld8ulx16	%f0,	%f18,	%f20
	nop 	! 	tleu	%xcc,	0x7 changed by convert2hboot
	nop 	! 	tvs	%icc,	0x5 changed by convert2hboot
	array32	%g2,	%g1,	%o6
	nop 	! 	tsubcctv	%o4,	%o0,	%l3 changed by convert2hboot
	srl	%l6,	0x04,	%i2
	sra	%i0,	%i1,	%i3
	ldsw	[%l7 + 0x70],	%g6
	nop 	! 	tl	%xcc,	0x7 changed by convert2hboot
	fnot1	%f26,	%f20
	addcc	%g7,	%l2,	%o5
	movvs	%xcc,	%o3,	%g3
	movrgz	%o7,	0x088,	%l4
	bshuffle	%f0,	%f2,	%f10
	movre	%o1,	0x3FF,	%l5
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
	bshuffle	%f26,	%f0,	%f14
	array32	%i5,	%o2,	%l0
	wr	%g0,	0x04,	%asi
	nop 	! 	tsubcctv	%g4,	%i4,	%l1 changed by convert2hboot
	sdiv	%g5,	0x072F,	%g2
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	nop 	! 	taddcc	%g1,	%o6,	%o4 changed by convert2hboot
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
	movrlz	%o0,	%l3,	%l6
	edge16	%i2,	%i0,	%i1
	nop 	! 	taddcctv	%i7,	%i3,	%g6 changed by convert2hboot
	orn	%l2,	0x0B0F,	%g7
	fornot1	%f4,	%f26,	%f16
	sdivx	%o5,	0x1DAC,	%g3
	bneg,pt	%icc,	loop_2913
	fpsub16s	%f4,	%f28,	%f16
	ldd	[%l7 + 0x40],	%o2
	fpadd16s	%f31,	%f18,	%f11
loop_2913:
	bl,a	%xcc,	loop_2914
	bshuffle	%f10,	%f0,	%f22
	popc	%l4,	%o1
	bvs,a,pt	%icc,	loop_2915
loop_2914:
	xnorcc	%o7,	0x0875,	%l5
	udivx	%i5,	0x00AA,	%l0
	ldx	[%l7 + 0x60],	%i6
loop_2915:
	smul	%o2,	0x1ACB,	%i4
	bpos,a	loop_2916
	alignaddr	%l1,	%g5,	%g4
	orncc	%g2,	%o6,	%o4
	srax	%g1,	%l3,	%l6
loop_2916:
	ldsh	[%l7 + 0x24],	%o0
	brlez,a	%i0,	loop_2917
	andcc	%i2,	%i7,	%i3
	movl	%icc,	%g6,	%l2
	fornot2s	%f4,	%f23,	%f6
loop_2917:
	brlez	%g7,	loop_2918
	edge16l	%o5,	%i1,	%g3
	fmovdgu	%icc,	%f22,	%f28
	edge32l	%o3,	%l4,	%o1
loop_2918:
	nop
	wr	%g0,	0x89,	%asi
	fmovrdlez	%o7,	%f2,	%f22
	mova	%xcc,	%l0,	%i6
	edge8	%o2,	%i5,	%l1
	fpadd32s	%f30,	%f7,	%f21
	fxnors	%f9,	%f21,	%f4
	nop 	! 	ta	%xcc,	0x0 changed by convert2hboot
	set	0x52, %o2
	nop	 ! 	stba	%g5,	[%l7 + %o2] 0x15 ASI use changed by convert2hboot
	ba,pn	%xcc,	loop_2919
	smul	%i4,	%g2,	%o6
	movgu	%icc,	%g4,	%o4
	edge32l	%g1,	%l3,	%l6
loop_2919:
	fmovdge	%icc,	%f27,	%f7
	edge16n	%i0,	%i2,	%i7
	fbu,a	%fcc1,	loop_2920
	fbo	%fcc2,	loop_2921
	fpadd32s	%f8,	%f29,	%f9
	movg	%xcc,	%i3,	%g6
loop_2920:
	nop 	! 	sir	0x1E6D changed by convert2hboot
loop_2921:
	bpos,a,pn	%icc,	loop_2922
	edge16ln	%l2,	%g7,	%o5
	and	%o0,	%i1,	%o3
	bpos,a,pt	%icc,	loop_2923
loop_2922:
	movre	%g3,	%l4,	%l5
	or	%o7,	%o1,	%l0
	nop 	! 	tge	%xcc,	0x1 changed by convert2hboot
loop_2923:
	movg	%icc,	%i6,	%o2
	movl	%icc,	%i5,	%l1
	wr	%g0,	0x80,	%asi
	nop 	! 	tvc	%xcc,	0x0 changed by convert2hboot
	std	%f26,	[%l7 + 0x28]
	movn	%xcc,	%g5,	%g2
	nop
	setx	loop_2924,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fbo	%fcc3,	loop_2925
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	fbe	%fcc3,	loop_2926
loop_2924:
	add	%o6,	%g4,	%g1
loop_2925:
	srlx	%o4,	%l3,	%l6
	udivcc	%i2,	0x0EB0,	%i7
loop_2926:
	nop
	set	0x65, %i4
	nop	 ! 	ldstuba	[%l7 + %i4] 0x10,	%i0 ASI use changed by convert2hboot
	restored
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
	fandnot1s	%f30,	%f1,	%f13
	fmul8x16al	%f1,	%f15,	%f0
	movrlz	%g6,	%i3,	%l2
	smul	%g7,	0x071D,	%o5
	umul	%o0,	%o3,	%i1
	nop 	! 	taddcc	%g3,	0x0281,	%l4 changed by convert2hboot
	fmovdne	%icc,	%f24,	%f31
	edge8n	%l5,	%o1,	%l0
	fmovrdgz	%o7,	%f14,	%f26
	sra	%i6,	0x18,	%i5
	wr	%g0,	0x89,	%asi
	fmovda	%xcc,	%f12,	%f26
	fmovdn	%xcc,	%f6,	%f20
	fbue	%fcc0,	loop_2927
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
	fbne	%fcc1,	loop_2928
	bpos,a,pt	%icc,	loop_2929
loop_2927:
	edge8l	%o2,	%g5,	%i4
	brz,a	%g2,	loop_2930
loop_2928:
	bneg,a	%icc,	loop_2931
loop_2929:
	fmovde	%icc,	%f6,	%f4
	fandnot2s	%f18,	%f27,	%f2
loop_2930:
	nop
	set	0x16, %l4
	nop	 ! 	ldstuba	[%l7 + %l4] 0x81,	%g4 ASI use changed by convert2hboot
loop_2931:
	nop 	! 	taddcc	%g1,	0x1B4A,	%o6 changed by convert2hboot
	movcs	%xcc,	%o4,	%l6
	nop 	! 	tgu	%xcc,	0x5 changed by convert2hboot
	add	%l3,	0x09DC,	%i2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	bg,a,pn	%xcc,	loop_2932
	edge8l	%i3,	%i7,	%l2
	bpos,a	%icc,	loop_2933
	fble,a	%fcc1,	loop_2934
loop_2932:
	movl	%xcc,	%o5,	%o0
	umul	%o3,	%i1,	%g3
loop_2933:
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
loop_2934:
	fbn	%fcc0,	loop_2935
	flush	%l7 + 0x60
	brnz	%l4,	loop_2936
	nop
	set	0x38, %i0
	std	%l4,	[%l7 + %i0]
loop_2935:
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
	sub	%g7,	0x1B10,	%l0
loop_2936:
	movl	%icc,	%o7,	%i6
	fnegd	%f16,	%f8
	fabsd	%f14,	%f16
	and	%o1,	0x1F37,	%l1
	subc	%i5,	%o2,	%i4
	udiv	%g5,	0x0CD5,	%g2
	brz	%g1,	loop_2937
	fmovd	%f10,	%f22
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
	edge32ln	%g4,	%o4,	%l6
loop_2937:
	nop 	! 	sir	0x1DC1 changed by convert2hboot
	ld	[%l7 + 0x58],	%f19
	bne,pt	%icc,	loop_2938
	movne	%xcc,	%o6,	%l3
	nop 	! 	taddcc	%i2,	%i0,	%i3 changed by convert2hboot
	wr	%g0,	0x4f,	%asi
loop_2938:
	fnegd	%f6,	%f24
	srl	%l2,	0x08,	%o5
	fnot2s	%f15,	%f10
	movvc	%icc,	%o0,	%o3
	stx	%g6,	[%l7 + 0x78]
	xnor	%g3,	0x0198,	%l4
	fpadd32	%f4,	%f16,	%f14
	fble	%fcc2,	loop_2939
	andcc	%i1,	0x0414,	%g7
	fmovrdlez	%l0,	%f24,	%f22
	fmovrslz	%o7,	%f11,	%f29
loop_2939:
	nop
	wr	%g0,	0x18,	%asi
	call	loop_2940
	fcmped	%fcc1,	%f26,	%f8
	edge16ln	%l5,	%o1,	%l1
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
loop_2940:
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
	movpos	%xcc,	%o2,	%i5
	movgu	%xcc,	%g5,	%i4
	edge16ln	%g1,	%g2,	%o4
	sdivx	%l6,	0x0ACD,	%o6
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	movleu	%icc,	%l3,	%g4
	call	loop_2941
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	movne	%icc,	%i0,	%i2
	subcc	%i3,	0x1AAC,	%i7
loop_2941:
	fsrc1	%f8,	%f24
	nop
	setx	loop_2942,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movgu	%icc,	%o5,	%l2
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	srax	%o3,	0x06,	%o0
loop_2942:
	nop
	wr	%g0,	0x4f,	%asi
	fbuge,a	%fcc2,	loop_2943
	edge32l	%g3,	%i1,	%l4
	set	0x70, %l6
	nop	 ! 	stxa	%g7,	[%l7 + %l6] 0x80 ASI use changed by convert2hboot
loop_2943:
	brgez	%o7,	loop_2944
	mova	%xcc,	%i6,	%l5
	srax	%l0,	%o1,	%l1
	addc	%o2,	%i5,	%g5
loop_2944:
	nop
	set	0x70, %g3
	nop	 ! 	stda	%g0,	[%l7 + %g3] 0x18 ASI use changed by convert2hboot
	edge32ln	%g2,	%o4,	%l6
	edge32	%o6,	%l3,	%g4
	nop 	! 	tle	%icc,	0x4 changed by convert2hboot
	ldub	[%l7 + 0x18],	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f23,	[%l7 + 0x60]
	std	%i2,	[%l7 + 0x70]
	fmovsleu	%xcc,	%f28,	%f28
	fble,a	%fcc2,	loop_2945
	fcmpeq16	%f4,	%f24,	%i0
	fblg	%fcc0,	loop_2946
	ba,a,pt	%xcc,	loop_2947
loop_2945:
	st	%f29,	[%l7 + 0x1C]
	fcmpeq32	%f26,	%f28,	%i3
loop_2946:
	fmovrsne	%i7,	%f5,	%f24
loop_2947:
	fxor	%f14,	%f22,	%f20
	ldsw	[%l7 + 0x08],	%l2
	xorcc	%o3,	%o0,	%g6
	fnor	%f24,	%f14,	%f30
	movle	%icc,	%g3,	%o5
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
	nop 	! 	taddcctv	%l4,	%i1,	%g7 changed by convert2hboot
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
	movg	%xcc,	%o7,	%i6
	movle	%icc,	%l5,	%l0
	xnorcc	%l1,	%o1,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	movle	%icc,	%g5,	%i5
	movn	%xcc,	%g1,	%o4
	fandnot1s	%f12,	%f9,	%f7
	smulcc	%l6,	0x13A1,	%g2
	fsrc1	%f8,	%f28
	fmul8x16al	%f22,	%f27,	%f10
	mulx	%l3,	%o6,	%i4
	sdivcc	%i2,	0x0ED7,	%g4
	sdivx	%i0,	0x0656,	%i7
	fcmpgt16	%f24,	%f22,	%i3
	edge32n	%l2,	%o0,	%o3
	sdiv	%g6,	0x135E,	%g3
	movgu	%xcc,	%o5,	%l4
	fmovscc	%icc,	%f18,	%f18
	udivx	%i1,	0x0039,	%g7
	movl	%icc,	%i6,	%l5
	fnegd	%f24,	%f30
	membar	0x13
	fmuld8sux16	%f16,	%f8,	%f26
	fandnot1	%f16,	%f4,	%f12
	edge16l	%o7,	%l0,	%l1
	set	0x70, %i6
	nop	 ! 	lduba	[%l7 + %i6] 0x0c,	%o2 ASI use changed by convert2hboot
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
	membar	0x25
	nop 	! 	tleu	%xcc,	0x7 changed by convert2hboot
	movl	%icc,	%o1,	%i5
	umulcc	%g1,	%g5,	%l6
	nop 	! 	sir	0x1C13 changed by convert2hboot
	fmovsvc	%xcc,	%f16,	%f5
	sdiv	%g2,	0x0B82,	%o4
	nop 	! 	tsubcctv	%l3,	%i4,	%i2 changed by convert2hboot
	fmovsn	%xcc,	%f22,	%f30
	ldsh	[%l7 + 0x46],	%g4
	srax	%i0,	0x0D,	%o6
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	addcc	%i3,	%l2,	%i7
	edge8ln	%o0,	%o3,	%g6
	subcc	%o5,	%l4,	%g3
	fmovrdgz	%i1,	%f16,	%f6
	movleu	%icc,	%i6,	%l5
	fpadd32s	%f10,	%f2,	%f20
	movrlz	%o7,	0x3F1,	%g7
	sll	%l0,	%l1,	%o2
	nop 	! 	tsubcc	%i5,	%o1,	%g1 changed by convert2hboot
	move	%xcc,	%l6,	%g5
	set	0x0C, %i3
	nop	 ! 	lduwa	[%l7 + %i3] 0x89,	%g2 ASI use changed by convert2hboot
	fbl	%fcc1,	loop_2948
	mulx	%l3,	0x1B4C,	%o4
	movrlz	%i2,	%i4,	%g4
	ldsh	[%l7 + 0x5A],	%o6
loop_2948:
	popc	%i3,	%l2
	fmovsn	%icc,	%f14,	%f17
	xnorcc	%i7,	0x1C28,	%i0
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x4 changed by convert2hboot
	fmovsneg	%xcc,	%f22,	%f4
	udivcc	%o3,	0x0C7F,	%g6
	nop 	! 	tcs	%xcc,	0x5 changed by convert2hboot
	xnorcc	%o5,	%o0,	%l4
	nop 	! 	tneg	%icc,	0x3 changed by convert2hboot
	fbg,a	%fcc3,	loop_2949
	edge8l	%i1,	%i6,	%l5
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	sethi	0x0AAC,	%o7
loop_2949:
	fblg	%fcc2,	loop_2950
	fones	%f14
	fnegs	%f9,	%f13
	fmovrdlz	%g7,	%f8,	%f16
loop_2950:
	subc	%l0,	0x0623,	%l1
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
	orn	%o2,	0x0FCD,	%g3
	prefetch	[%l7 + 0x58],	 0x3
	fmovdvs	%xcc,	%f29,	%f21
	edge8n	%i5,	%o1,	%l6
	fzeros	%f8
	fbug,a	%fcc2,	loop_2951
	sth	%g5,	[%l7 + 0x16]
	set	0x7C, %i5
	sta	%f12,	[%l7 + %i5] 0x14
loop_2951:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f18,	[%l7 + 0x08] %asi
	fbule,a	%fcc3,	loop_2952
	ba,a,pt	%icc,	loop_2953
	array16	%g2,	%g1,	%o4
	wr	%g0,	0x04,	%asi
loop_2952:
	edge32ln	%l3,	%g4,	%o6
loop_2953:
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
	fsrc2	%f10,	%f30
	brz,a	%i4,	loop_2954
	fbl	%fcc1,	loop_2955
	movn	%xcc,	%l2,	%i7
	bvs,a	%icc,	loop_2956
loop_2954:
	umulcc	%i0,	%o3,	%i3
loop_2955:
	ldub	[%l7 + 0x1F],	%g6
	bcs,a,pn	%icc,	loop_2957
loop_2956:
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
loop_2957:
	movge	%icc,	%l4,	%i6
	wr	%g0,	0x89,	%asi
	andncc	%i1,	%g7,	%o7
	wr	%g0,	0x80,	%asi
	movcs	%icc,	%o2,	%l0
	set	0x0, %l1
	nop	 ! 	stxa	%g3,	[%g0 + %l1] 0x20 ASI use changed by convert2hboot
	fmovse	%icc,	%f19,	%f1
	fcmpd	%fcc1,	%f20,	%f4
	fmovsl	%xcc,	%f0,	%f18
	andn	%o1,	%i5,	%g5
	lduw	[%l7 + 0x14],	%l6
	fcmpeq32	%f30,	%f26,	%g1
	bvs	loop_2958
	movle	%icc,	%o4,	%i2
	fnor	%f14,	%f20,	%f18
	movle	%xcc,	%g2,	%g4
loop_2958:
	movg	%xcc,	%l3,	%i4
	edge16	%o6,	%l2,	%i0
	xorcc	%o3,	0x0D30,	%i7
	stw	%i3,	[%l7 + 0x48]
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	fpsub32s	%f27,	%f17,	%f24
	fbe,a	%fcc0,	loop_2959
	udiv	%g6,	0x0E22,	%o0
	subccc	%o5,	%l4,	%l5
	edge16n	%i6,	%i1,	%o7
loop_2959:
	fmovsvc	%icc,	%f20,	%f20
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	set	0x40, %i2
	nop	 ! 	ldda	[%l7 + %i2] 0x04,	%f0 ASI use changed by convert2hboot
	fcmpgt32	%f28,	%f26,	%g7
	set	0x37, %o7
	nop	 ! 	ldsba	[%l7 + %o7] 0x80,	%o2 ASI use changed by convert2hboot
	bpos,pt	%xcc,	loop_2960
	xnor	%l1,	0x1A40,	%g3
	nop
	set	0x60, %g6
	ldx	[%l7 + %g6],	%l0
	fmovsn	%icc,	%f18,	%f28
loop_2960:
	array8	%i5,	%g5,	%l6
	edge32ln	%o1,	%g1,	%i2
	nop 	! 	tsubcctv	%g2,	0x1C95,	%g4 changed by convert2hboot
	nop 	! 	taddcc	%o4,	%i4,	%l3 changed by convert2hboot
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	fsrc2s	%f16,	%f3
	fmovsleu	%icc,	%f27,	%f16
	fcmpeq16	%f20,	%f18,	%l2
	nop 	! 	tsubcc	%o6,	0x0B40,	%i0 changed by convert2hboot
	movn	%xcc,	%o3,	%i3
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
	fpack32	%f12,	%f20,	%f6
	nop
	setx	loop_2961,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movvc	%xcc,	%g6,	%i7
	xor	%o0,	%o5,	%l5
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
loop_2961:
	nop 	! 	tvs	%xcc,	0x2 changed by convert2hboot
	sdivx	%l4,	0x075E,	%i1
	fbe	%fcc1,	loop_2962
	smulcc	%o7,	0x00D6,	%i6
	fmovrse	%o2,	%f20,	%f28
	movrne	%g7,	0x35E,	%g3
loop_2962:
	nop 	! 	tn	%icc,	0x5 changed by convert2hboot
	udivcc	%l0,	0x1CF8,	%i5
	movn	%xcc,	%l1,	%g5
	fbule	%fcc3,	loop_2963
	fmuld8ulx16	%f12,	%f28,	%f6
	fbg,a	%fcc3,	loop_2964
	bgu,a	loop_2965
loop_2963:
	edge32l	%o1,	%g1,	%l6
	fbu	%fcc0,	loop_2966
loop_2964:
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
loop_2965:
	nop
	wr	%g0,	0x2b,	%asi
	membar	#Sync
loop_2966:
	edge8	%g4,	%o4,	%i2
	std	%f12,	[%l7 + 0x30]
	srlx	%l3,	0x0E,	%l2
	bne,pt	%xcc,	loop_2967
	brgez,a	%i4,	loop_2968
	edge16n	%o6,	%i0,	%o3
	fmovdgu	%xcc,	%f30,	%f12
loop_2967:
	edge8l	%i3,	%g6,	%i7
loop_2968:
	nop 	! 	tcc	%icc,	0x4 changed by convert2hboot
	addcc	%o0,	%l5,	%l4
	set	0x54, %o5
	nop	 ! 	swapa	[%l7 + %o5] 0x89,	%i1 ASI use changed by convert2hboot
	srl	%o7,	0x16,	%o5
	array32	%o2,	%g7,	%g3
	xor	%l0,	%i5,	%i6
	fmovrse	%l1,	%f25,	%f26
	movl	%icc,	%o1,	%g1
	movrgz	%l6,	0x069,	%g5
	brlz,a	%g2,	loop_2969
	edge16l	%o4,	%g4,	%i2
	wr	%g0,	0x11,	%asi
	sta	%f31,	[%l7 + 0x78] %asi
loop_2969:
	edge32l	%l2,	%l3,	%o6
	movgu	%icc,	%i0,	%i4
	fbne,a	%fcc2,	loop_2970
	movrlz	%o3,	0x287,	%g6
	fbl	%fcc3,	loop_2971
	umulcc	%i3,	0x1E99,	%o0
loop_2970:
	edge16l	%i7,	%l4,	%l5
	array8	%i1,	%o7,	%o2
loop_2971:
	movgu	%icc,	%g7,	%o5
	fornot1s	%f21,	%f20,	%f6
	fmovsge	%icc,	%f25,	%f16
	movcs	%icc,	%l0,	%g3
	fmovdpos	%xcc,	%f29,	%f8
	sllx	%i6,	%i5,	%l1
	edge16ln	%g1,	%l6,	%g5
	andcc	%g2,	%o1,	%g4
	fnegd	%f24,	%f18
	edge8l	%i2,	%o4,	%l3
	fmovsa	%xcc,	%f21,	%f15
	edge16	%l2,	%o6,	%i0
	srax	%i4,	0x18,	%g6
	movcs	%xcc,	%i3,	%o3
	subc	%o0,	0x1B64,	%l4
	movre	%l5,	%i1,	%o7
	set	0x50, %i7
	nop	 ! 	ldxa	[%l7 + %i7] 0x04,	%i7 ASI use changed by convert2hboot
	fbo,a	%fcc3,	loop_2972
	movl	%icc,	%g7,	%o5
	edge16ln	%l0,	%o2,	%i6
	nop 	! 	taddcc	%g3,	%i5,	%g1 changed by convert2hboot
loop_2972:
	movre	%l1,	%g5,	%l6
	movpos	%icc,	%o1,	%g2
	sllx	%g4,	0x18,	%o4
	fmovsleu	%icc,	%f26,	%f10
	andcc	%i2,	%l3,	%o6
	prefetch	[%l7 + 0x44],	 0x3
	udiv	%l2,	0x0B28,	%i4
	sdiv	%g6,	0x007E,	%i0
	nop 	! 	tg	%xcc,	0x3 changed by convert2hboot
	ble,a	%icc,	loop_2973
	nop 	! 	tleu	%icc,	0x7 changed by convert2hboot
	nop 	! 	tne	%xcc,	0x5 changed by convert2hboot
	orncc	%o3,	%o0,	%l4
loop_2973:
	fbn,a	%fcc3,	loop_2974
	mova	%icc,	%i3,	%i1
	fcmple32	%f6,	%f18,	%o7
	bvs,a	loop_2975
loop_2974:
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	fmovsgu	%icc,	%f28,	%f23
	movrgez	%i7,	%l5,	%o5
loop_2975:
	fnot2	%f16,	%f20
	fnegs	%f15,	%f14
	edge8ln	%l0,	%o2,	%i6
	wr	%g0,	0x19,	%asi
	andn	%i5,	%g7,	%l1
	sra	%g5,	0x1E,	%g1
	wr	%g0,	0x11,	%asi
	set	0x30, %l5
	nop	 ! 	ldsha	[%l7 + %l5] 0x88,	%g2 ASI use changed by convert2hboot
	edge32n	%l6,	%g4,	%i2
	alignaddrl	%l3,	%o4,	%o6
	bn,a,pt	%icc,	loop_2976
	fnands	%f4,	%f5,	%f1
	bge,a	%icc,	loop_2977
	fmovsneg	%xcc,	%f22,	%f10
loop_2976:
	fmuld8ulx16	%f31,	%f27,	%f18
	edge32ln	%l2,	%i4,	%i0
loop_2977:
	nop
	set	0x30, %g5
	nop	 ! 	prefetcha	[%l7 + %g5] 0x18,	 0x0 ASI use changed by convert2hboot
	orcc	%o0,	0x1FD6,	%g6
	brnz,a	%i3,	loop_2978
	fmul8ulx16	%f26,	%f16,	%f4
	sra	%i1,	0x12,	%l4
	fmovdle	%xcc,	%f20,	%f5
loop_2978:
	nop
	set	0x5B, %i1
	nop	 ! 	ldsba	[%l7 + %i1] 0x14,	%o7 ASI use changed by convert2hboot
	sub	%i7,	%o5,	%l0
	bcs,a,pt	%xcc,	loop_2979
	orncc	%l5,	%i6,	%g3
	addc	%o2,	0x05E5,	%i5
	set	0x50, %o4
	nop	 ! 	lduha	[%l7 + %o4] 0x15,	%l1 ASI use changed by convert2hboot
loop_2979:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%g7,	%g5,	%o1
	fcmple16	%f0,	%f18,	%g1
	nop 	! 	sir	0x04D0 changed by convert2hboot
	fcmpgt16	%f0,	%f24,	%g2
	sethi	0x1D08,	%g4
	fbge	%fcc3,	loop_2980
	xor	%i2,	0x0B74,	%l3
	fxor	%f18,	%f6,	%f14
	call	loop_2981
loop_2980:
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
	set	0x20, %l2
	nop	 ! 	stxa	%o4,	[%l7 + %l2] 0xe2 ASI use changed by convert2hboot
	membar	#Sync
loop_2981:
	move	%icc,	%l6,	%o6
	edge8l	%l2,	%i0,	%o3
	bn,pn	%icc,	loop_2982
	edge32ln	%o0,	%g6,	%i3
	movrgez	%i1,	0x100,	%i4
	fbo	%fcc3,	loop_2983
loop_2982:
	fmovrdgez	%o7,	%f10,	%f30
	and	%l4,	%o5,	%i7
	edge32ln	%l5,	%i6,	%g3
loop_2983:
	brlez	%o2,	loop_2984
	faligndata	%f16,	%f24,	%f24
	movn	%icc,	%i5,	%l1
	edge16	%g7,	%g5,	%o1
loop_2984:
	fpadd32	%f28,	%f16,	%f2
	array16	%l0,	%g2,	%g1
	movcs	%xcc,	%i2,	%g4
	andcc	%l3,	0x184A,	%o4
	movle	%icc,	%l6,	%l2
	addccc	%i0,	0x1973,	%o3
	nop 	! 	tvc	%xcc,	0x3 changed by convert2hboot
	udivx	%o0,	0x1393,	%g6
	fcmpd	%fcc2,	%f14,	%f28
	udivx	%i3,	0x13CC,	%o6
	smulcc	%i1,	%i4,	%o7
	orn	%o5,	0x0DF6,	%i7
	nop 	! 	tsubcctv	%l5,	%i6,	%g3 changed by convert2hboot
	fcmple32	%f4,	%f30,	%l4
	sethi	0x004F,	%o2
	fba	%fcc3,	loop_2985
	alignaddr	%i5,	%l1,	%g7
	fmovdg	%xcc,	%f27,	%f26
	bg	loop_2986
loop_2985:
	fbule	%fcc2,	loop_2987
	movl	%icc,	%o1,	%g5
	edge8n	%g2,	%l0,	%i2
loop_2986:
	edge32	%g4,	%g1,	%l3
loop_2987:
	fble	%fcc1,	loop_2988
	bl,pt	%xcc,	loop_2989
	fmovsle	%icc,	%f3,	%f30
	wr	%g0,	0x89,	%asi
loop_2988:
	ldub	[%l7 + 0x0F],	%l2
loop_2989:
	ldx	[%l7 + 0x30],	%l6
	or	%i0,	0x13FB,	%o0
	andcc	%o3,	%i3,	%o6
	fmovsg	%xcc,	%f26,	%f7
	xnorcc	%i1,	%i4,	%o7
	sethi	0x1658,	%o5
	udivx	%g6,	0x1F4D,	%i7
	fmovrslez	%l5,	%f23,	%f3
	fbug,a	%fcc1,	loop_2990
	addcc	%i6,	0x12D1,	%l4
	wr	%g0,	0x0c,	%asi
	sta	%f19,	[%l7 + 0x58] %asi
loop_2990:
	siam	0x1
	fbne	%fcc2,	loop_2991
	fbuge	%fcc0,	loop_2992
	nop 	! 	tg	%xcc,	0x5 changed by convert2hboot
	fbge,a	%fcc2,	loop_2993
loop_2991:
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
loop_2992:
	movcc	%xcc,	%g3,	%o2
	movne	%icc,	%i5,	%l1
loop_2993:
	xorcc	%o1,	%g5,	%g7
	sub	%g2,	0x1097,	%l0
	set	0x51, %o3
	nop	 ! 	ldsba	[%l7 + %o3] 0x15,	%g4 ASI use changed by convert2hboot
	udivx	%g1,	0x07CB,	%l3
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	set	0x14, %o1
	nop	 ! 	lduwa	[%l7 + %o1] 0x89,	%o4 ASI use changed by convert2hboot
	std	%l2,	[%l7 + 0x10]
	srax	%l6,	0x13,	%i0
	array8	%i2,	%o3,	%o0
	fbue,a	%fcc3,	loop_2994
	fmovsg	%xcc,	%f23,	%f9
	pdist	%f0,	%f6,	%f10
	brz	%o6,	loop_2995
loop_2994:
	srax	%i1,	%i4,	%o7
	swap	[%l7 + 0x20],	%o5
	umulcc	%g6,	%i3,	%l5
loop_2995:
	edge16	%i7,	%i6,	%g3
	movrlz	%l4,	0x2E0,	%i5
	bneg	loop_2996
	nop 	! 	tsubcctv	%l1,	%o1,	%g5 changed by convert2hboot
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	xnorcc	%o2,	0x1DA5,	%g2
loop_2996:
	nop 	! 	ta	%icc,	0x2 changed by convert2hboot
	subccc	%g7,	%g4,	%l0
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	fblg,a	%fcc0,	loop_2997
	sra	%l3,	%o4,	%g1
	fbo,a	%fcc1,	loop_2998
	movn	%xcc,	%l2,	%i0
loop_2997:
	sdiv	%i2,	0x1AF9,	%o3
	nop 	! 	tpos	%xcc,	0x4 changed by convert2hboot
loop_2998:
	and	%o0,	0x100B,	%l6
	edge8l	%i1,	%i4,	%o6
	sllx	%o7,	0x07,	%o5
	mova	%icc,	%i3,	%l5
	fbuge,a	%fcc1,	loop_2999
	flush	%l7 + 0x5C
	movvs	%xcc,	%i7,	%i6
	xor	%g6,	%g3,	%i5
loop_2999:
	fbu	%fcc2,	loop_3000
	ldsb	[%l7 + 0x2F],	%l4
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	movrgz	%l1,	0x224,	%o1
loop_3000:
	fmovs	%f20,	%f2
	fxor	%f6,	%f6,	%f14
	fbug	%fcc3,	loop_3001
	ldstub	[%l7 + 0x36],	%g5
	fbe	%fcc2,	loop_3002
	fble	%fcc3,	loop_3003
loop_3001:
	movn	%icc,	%g2,	%g7
	xnorcc	%g4,	0x11A4,	%o2
loop_3002:
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
loop_3003:
	fpadd32s	%f20,	%f14,	%f6
	orn	%l3,	0x1C20,	%l0
	mulscc	%o4,	%g1,	%l2
	wr	%g0,	0x89,	%asi
	movvs	%xcc,	%i0,	%o0
	movle	%icc,	%l6,	%o3
	brgz,a	%i1,	loop_3004
	nop 	! 	taddcc	%i4,	0x1566,	%o6 changed by convert2hboot
	or	%o7,	%o5,	%l5
	fmovsvc	%icc,	%f1,	%f10
loop_3004:
	fmovrslz	%i7,	%f12,	%f6
	fmul8ulx16	%f20,	%f20,	%f24
	movne	%xcc,	%i3,	%i6
	nop 	! 	tg	%xcc,	0x5 changed by convert2hboot
	movre	%g6,	0x09E,	%g3
	add	%i5,	%l1,	%o1
	array32	%l4,	%g2,	%g5
	membar	0x32
	mulx	%g7,	%g4,	%o2
	fsrc1s	%f7,	%f11
	fmovsn	%icc,	%f6,	%f28
	fornot2	%f14,	%f14,	%f20
	fmovsvs	%xcc,	%f31,	%f15
	set	0x40, %l3
	nop	 ! 	ldswa	[%l7 + %l3] 0x0c,	%l3 ASI use changed by convert2hboot
	array32	%o4,	%g1,	%l2
	movg	%icc,	%l0,	%i0
	st	%f24,	[%l7 + 0x24]
	sub	%o0,	%l6,	%i2
	srl	%o3,	0x0F,	%i1
	srlx	%i4,	%o6,	%o5
	subcc	%l5,	0x1252,	%i7
	movrne	%o7,	%i3,	%g6
	fmovrdgez	%i6,	%f26,	%f14
	nop 	! 	taddcctv	%i5,	%l1,	%g3 changed by convert2hboot
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%l4,	%o1
	fcmpgt16	%f14,	%f4,	%g5
	or	%g7,	0x14C2,	%g4
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	fzeros	%f24
	movrgez	%o2,	%l3,	%g2
	add	%o4,	0x020A,	%l2
	st	%f18,	[%l7 + 0x40]
	fblg,a	%fcc1,	loop_3005
	be,pt	%icc,	loop_3006
	fandnot2	%f12,	%f26,	%f14
	ld	[%l7 + 0x78],	%f13
loop_3005:
	fpadd32s	%f15,	%f15,	%f26
loop_3006:
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
	fmovrslez	%g1,	%f3,	%f11
	fbule	%fcc1,	loop_3007
	fmovdcc	%icc,	%f20,	%f31
	fmovsvs	%icc,	%f17,	%f14
	wr	%g0,	0x81,	%asi
loop_3007:
	fbge,a	%fcc0,	loop_3008
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	mulscc	%i0,	%o0,	%l6
	brgez,a	%i2,	loop_3009
loop_3008:
	lduw	[%l7 + 0x20],	%o3
	fcmpd	%fcc3,	%f28,	%f24
	fpsub16	%f12,	%f30,	%f2
loop_3009:
	nop
	setx	loop_3010,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	edge32n	%i4,	%o6,	%o5
	brz,a	%i1,	loop_3011
	popc	%i7,	%o7
loop_3010:
	andncc	%l5,	%g6,	%i3
	set	0x110, %g7
	nop	 ! 	stxa	%i6,	[%g0 + %g7] 0x52 ASI use changed by convert2hboot
loop_3011:
	fxnor	%f18,	%f12,	%f14
	xnorcc	%l1,	%g3,	%l4
	edge16l	%i5,	%o1,	%g5
	fpack32	%f18,	%f30,	%f26
	andncc	%g7,	%o2,	%g4
	wr	%g0,	0x10,	%asi
	ldd	[%l7 + 0x30],	%o4
	fbo,a	%fcc3,	loop_3012
	fxor	%f28,	%f30,	%f2
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
	fsrc1s	%f17,	%f9
loop_3012:
	fmovrslez	%l2,	%f31,	%f24
	umul	%g2,	%g1,	%i0
	subcc	%o0,	%l0,	%l6
	sethi	0x1149,	%o3
	nop 	! 	tneg	%icc,	0x5 changed by convert2hboot
	movrgez	%i4,	0x2E5,	%i2
	add	%o5,	0x0021,	%i1
	brlez	%i7,	loop_3013
	xor	%o6,	%l5,	%o7
	sethi	0x16F8,	%i3
	ldx	[%l7 + 0x48],	%i6
loop_3013:
	fxors	%f28,	%f25,	%f31
	edge8n	%g6,	%l1,	%g3
	bleu,pt	%xcc,	loop_3014
	fmovd	%f24,	%f30
	nop 	! 	tsubcc	%l4,	%i5,	%o1 changed by convert2hboot
	udiv	%g7,	0x02D8,	%o2
loop_3014:
	fmovspos	%icc,	%f28,	%f13
	orncc	%g5,	0x1BED,	%l3
	fmovsl	%icc,	%f7,	%f9
	andncc	%g4,	%o4,	%g2
	fmovspos	%xcc,	%f20,	%f15
	edge16n	%g1,	%i0,	%o0
	fmovscc	%icc,	%f31,	%f13
	edge16	%l2,	%l6,	%o3
	wr	%g0,	0x2f,	%asi
	membar	#Sync
	fcmpeq32	%f18,	%f26,	%i2
	nop 	! 	tge	%icc,	0x0 changed by convert2hboot
	lduh	[%l7 + 0x68],	%i4
	movl	%icc,	%i1,	%o5
	orncc	%i7,	0x1332,	%l5
	fands	%f5,	%f21,	%f1
	edge32l	%o6,	%i3,	%o7
	fcmple32	%f24,	%f28,	%i6
	sllx	%l1,	0x04,	%g6
	nop 	! 	tleu	%xcc,	0x7 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g3,	0x1DC,	%i5
	fxnor	%f6,	%f0,	%f26
	fcmpeq16	%f26,	%f14,	%l4
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	fbl	%fcc1,	loop_3015
	subc	%g7,	%o2,	%g5
	brgz,a	%l3,	loop_3016
	movn	%xcc,	%o1,	%o4
loop_3015:
	std	%f6,	[%l7 + 0x38]
	bg,a	loop_3017
loop_3016:
	fba,a	%fcc2,	loop_3018
	fcmpeq16	%f30,	%f6,	%g4
	mulscc	%g1,	%g2,	%i0
loop_3017:
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
loop_3018:
	edge8	%l2,	%l6,	%o0
	st	%f21,	[%l7 + 0x10]
	bshuffle	%f6,	%f18,	%f24
	wr	%g0,	0x89,	%asi
	nop 	! 	tcs	%xcc,	0x5 changed by convert2hboot
	fxnor	%f4,	%f30,	%f10
	fpsub16	%f4,	%f6,	%f24
	xnorcc	%i2,	0x0BAB,	%i4
	edge16ln	%i1,	%o5,	%i7
	fbo	%fcc0,	loop_3019
	fbne,a	%fcc2,	loop_3020
	fbue,a	%fcc0,	loop_3021
	fbne	%fcc0,	loop_3022
loop_3019:
	sllx	%o3,	%o6,	%i3
loop_3020:
	fpadd16s	%f8,	%f29,	%f5
loop_3021:
	edge8n	%o7,	%i6,	%l1
loop_3022:
	fpadd16s	%f10,	%f25,	%f28
	movl	%icc,	%l5,	%g3
	fnegd	%f12,	%f4
	nop 	! 	tcc	%icc,	0x1 changed by convert2hboot
	fbuge	%fcc0,	loop_3023
	addcc	%g6,	%i5,	%g7
	brgez,a	%l4,	loop_3024
	nop 	! 	ta	%xcc,	0x2 changed by convert2hboot
loop_3023:
	sdiv	%o2,	0x0325,	%g5
loop_3024:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2849
!	Type x   	: 1323
!	Type cti   	: 3024
!	Type f   	: 4392
!	Type i   	: 13412
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xA4877FCC
.word 0xE028F7F7
.word 0x2586EF85
.word 0x03221257
.word 0x1B16B301
.word 0xF5E5EC54
.word 0x094950AA
.word 0x0187E7EA
.word 0xB8474D54
.word 0x6215F9F1
.word 0x7DF7EC04
.word 0x40FD26D9
.word 0x8D46B8BB
.word 0xB6EA5A91
.word 0x5BF4F9AD
.word 0x1626BE49
.word 0xD84145F4
.word 0xEB814F75
.word 0x1642AB23
.word 0x7B384AD3
.word 0xA0EDD213
.word 0x234C5B02
.word 0x14ED1ECA
.word 0xFFCF715B
.word 0x7240058B
.word 0x76086CE1
.word 0xAC17DB3F
.word 0x6CBBD40A
.word 0x47CBD2E2
.word 0x5B7AD7CB
.word 0x184DECC8
.word 0x0F101C1A
.word 0x966D107B
.word 0x210B2CF2
.word 0xC6409A2D
.word 0x87851405
.word 0x4DB3C3B9
.word 0xD4ACD89F
.word 0x64609B81
.word 0xECDAB802
.word 0x85B36961
.word 0xBE2BF252
.word 0xB1EDA302
.word 0x4C71E331
.word 0x1B698074
.word 0x050539D3
.word 0xCE27BF65
.word 0xC86735FD
.word 0xF68E836F
.word 0xBAE9FE08
.word 0x8C512EC0
.word 0x1A7ADB25
.word 0xE795C70D
.word 0xB85EB2B4
.word 0x5BAD35F2
.word 0x62F9BDBA
.word 0xA4E13EBB
.word 0xA01C842E
.word 0xF695ACB0
.word 0x572BDDA9
.word 0x3446960F
.word 0xD4EB3BE1
.word 0xD6F47170
.word 0xF7CAFD9A
.end
