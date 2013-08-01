/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic_idtlb2.s
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

	fmovdne	%xcc,	%f21,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i0,	0x393,	%i4
	add	%o2,	%g2,	%l4
	nop 	! 	tgu	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x7 changed by convert2hboot
	mulscc	%o5,	%g7,	%i6
	fbe	%fcc1,	loop_1
	fblg,a	%fcc0,	loop_2
	fmovd	%f30,	%f12
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
loop_1:
	srl	%g1,	0x02,	%i5
loop_2:
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	swap	[%l7 + 0x6C],	%l6
	movrgz	%i1,	0x155,	%l3
	fone	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	st	%f7,	[%l7 + 0x2C]
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	edge8ln	%l0,	%l2,	%o6
	fands	%f24,	%f21,	%f16
	siam	0x6
	wr	%g0,	0x11,	%asi
	popc	%i7,	%o3
	brnz,a	%g6,	loop_3
	alignaddrl	%g5,	%i2,	%g3
	nop 	! 	tge	%xcc,	0x1 changed by convert2hboot
	fors	%f10,	%f28,	%f29
loop_3:
	fmovscc	%icc,	%f31,	%f28
	fmovdleu	%icc,	%f22,	%f29
	xor	%o0,	%i3,	%g4
	set	0x18, %i4
	nop	 ! 	prefetcha	[%l7 + %i4] 0x0c,	 0x1 ASI use replaced by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%o7,	%l5
	movre	%l1,	%i0,	%i4
	movleu	%xcc,	%o2,	%g2
	bpos	loop_4
	prefetch	[%l7 + 0x5C],	 0x2
	movrne	%o1,	0x07C,	%l4
	fmovsle	%icc,	%f19,	%f31
loop_4:
	edge32ln	%g7,	%i6,	%g1
	xnorcc	%i5,	0x16ED,	%l6
	xor	%i1,	0x11B2,	%l3
	subc	%o5,	0x0669,	%l2
	edge16l	%o6,	%i7,	%l0
	xorcc	%o3,	0x0CB3,	%g6
	fmovrslz	%i2,	%f7,	%f14
	smul	%g5,	0x1DE7,	%g3
	movneg	%icc,	%o0,	%i3
	fxnor	%f26,	%f18,	%f22
	udivx	%o4,	0x005E,	%o7
	sra	%g4,	0x1C,	%l5
	edge8n	%l1,	%i0,	%o2
	fmovspos	%xcc,	%f17,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgez	%i4,	loop_5
	bpos	%xcc,	loop_6
	nop 	! 	taddcc	%g2,	%o1,	%l4 changed by convert2hboot
	movrlez	%g7,	%i6,	%g1
loop_5:
	movleu	%xcc,	%l6,	%i5
loop_6:
	fpsub16	%f28,	%f12,	%f28
	umulcc	%l3,	%i1,	%l2
	fcmpd	%fcc0,	%f6,	%f6
	movgu	%icc,	%o5,	%i7
	movl	%icc,	%o6,	%l0
	andncc	%o3,	%i2,	%g6
	wr	%g0,	0x10,	%asi
	addcc	%o0,	0x070E,	%i3
	sllx	%o4,	0x02,	%g3
	edge32ln	%o7,	%l5,	%l1
	fmovsvs	%icc,	%f24,	%f2
	movgu	%icc,	%g4,	%o2
	wr	%g0,	0x89,	%asi
	edge8ln	%i4,	%o1,	%g2
	call	loop_7
	bn,a,pt	%xcc,	loop_8
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	add	%l4,	0x0A68,	%g7
loop_7:
	orcc	%g1,	0x0984,	%l6
loop_8:
	edge8ln	%i5,	%l3,	%i6
	brlez	%l2,	loop_9
	be,pt	%xcc,	loop_10
	movpos	%xcc,	%i1,	%i7
	brlz	%o5,	loop_11
loop_9:
	fmovsg	%icc,	%f18,	%f24
loop_10:
	fba	%fcc0,	loop_12
	sll	%l0,	0x05,	%o6
loop_11:
	fpackfix	%f12,	%f30
	nop 	! 	tle	%xcc,	0x3 changed by convert2hboot
loop_12:
	array8	%o3,	%g6,	%i2
	nop 	! 	taddcc	%o0,	0x06E7,	%g5 changed by convert2hboot
	sra	%i3,	%g3,	%o7
	movrlez	%o4,	%l5,	%g4
	set	0x54, %o5
	sta	%f28,	[%l7 + %o5] 0x04
	movrne	%l1,	%i0,	%i4
	move	%xcc,	%o2,	%g2
	andcc	%l4,	%g7,	%o1
	brgz	%g1,	loop_13
	edge32ln	%l6,	%l3,	%i6
	and	%l2,	0x0019,	%i5
	stw	%i1,	[%l7 + 0x60]
loop_13:
	fbe,a	%fcc1,	loop_14
	edge16ln	%i7,	%l0,	%o6
	movcc	%xcc,	%o3,	%o5
	addccc	%i2,	%o0,	%g6
loop_14:
	xorcc	%i3,	0x0B75,	%g3
	nop 	! 	tsubcctv	%o7,	0x0F00,	%g5 changed by convert2hboot
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	nop	 ! 	casxa	[%l6] 0x81,	%o4,	%g4 ASI use replaced by convert2hboot
	subcc	%l1,	%l5,	%i4
	srax	%i0,	%o2,	%g2
	fcmped	%fcc1,	%f0,	%f22
	fmovde	%icc,	%f12,	%f14
	edge16n	%l4,	%g7,	%o1
	sdivx	%g1,	0x0821,	%l3
	alignaddr	%i6,	%l6,	%i5
	fornot1	%f20,	%f4,	%f24
	addcc	%l2,	%i7,	%i1
	orn	%l0,	%o3,	%o5
	bl,a,pt	%icc,	loop_15
	fmovrdlez	%o6,	%f12,	%f12
	fble	%fcc1,	loop_16
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
loop_15:
	fbo	%fcc2,	loop_17
	membar	0x0D
loop_16:
	nop
	set	0x4E, %g1
	nop	 ! 	stba	%o0,	[%l7 + %g1] 0xe2 ASI use replaced by convert2hboot
	membar	#Sync
loop_17:
	ldub	[%l7 + 0x1A],	%i2
	movrlez	%i3,	%g3,	%o7
	edge32n	%g5,	%g6,	%o4
	fbe	%fcc0,	loop_18
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
	set	0x28, %g4
	nop	 ! 	prefetcha	[%l7 + %g4] 0x04,	 0x3 ASI use replaced by convert2hboot
loop_18:
	fcmpne32	%f28,	%f28,	%l5
	fnegd	%f10,	%f22
	bg,pn	%icc,	loop_19
	subc	%i4,	%i0,	%g4
	fones	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19:
	andn	%o2,	%g2,	%g7
	movrgz	%o1,	%l4,	%g1
	sth	%i6,	[%l7 + 0x2A]
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
	fmovrsne	%l6,	%f15,	%f27
	nop 	! 	tsubcctv	%l3,	0x1E6C,	%i5 changed by convert2hboot
	smulcc	%i7,	%i1,	%l0
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	sethi	0x1643,	%o3
	set	0x28, %g3
	nop	 ! 	prefetcha	[%l7 + %g3] 0x14,	 0x2 ASI use replaced by convert2hboot
	fnegs	%f8,	%f12
	bvs,a	%xcc,	loop_20
	movleu	%icc,	%o5,	%o0
	sra	%i2,	0x0E,	%o6
	xnor	%i3,	0x1F76,	%o7
loop_20:
	mulscc	%g3,	0x176D,	%g5
	brnz,a	%g6,	loop_21
	sllx	%o4,	0x12,	%l1
	fexpand	%f21,	%f30
	fsrc2	%f30,	%f24
loop_21:
	fmovrsgz	%i4,	%f1,	%f18
	fmul8ulx16	%f4,	%f24,	%f16
	fbule,a	%fcc1,	loop_22
	srl	%l5,	%i0,	%o2
	nop 	! 	taddcc	%g2,	%g4,	%g7 changed by convert2hboot
	fbu,a	%fcc2,	loop_23
loop_22:
	movgu	%icc,	%l4,	%g1
	ba,a	%xcc,	loop_24
	for	%f4,	%f18,	%f6
loop_23:
	array32	%o1,	%l6,	%l3
	bne,pn	%icc,	loop_25
loop_24:
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	fmovrdgez	%i5,	%f18,	%f20
	movn	%icc,	%i7,	%i6
loop_25:
	nop
	set	0x7B, %i0
	nop	 ! 	lduba	[%l7 + %i0] 0x88,	%l0 ASI use replaced by convert2hboot
	alignaddr	%i1,	%o3,	%l2
	add	%o0,	%i2,	%o5
	move	%icc,	%i3,	%o7
	fnor	%f16,	%f18,	%f30
	nop
	setx	loop_26,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	addccc	%o6,	%g5,	%g3
	xor	%o4,	%l1,	%g6
	andcc	%l5,	0x19A6,	%i4
loop_26:
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	fpackfix	%f0,	%f12
	fmuld8sux16	%f31,	%f15,	%f4
	fbule	%fcc0,	loop_27
	fmovda	%xcc,	%f20,	%f19
	movne	%icc,	%o2,	%g2
	subcc	%i0,	%g4,	%l4
loop_27:
	nop
	wr	%g0,	0x88,	%asi
	edge8l	%g1,	%o1,	%l6
	xor	%l3,	0x1F92,	%i5
	bge,a	%xcc,	loop_28
	bge,pt	%icc,	loop_29
	stx	%i7,	[%l7 + 0x78]
	set	0x2E, %o1
	nop	 ! 	stha	%i6,	[%l7 + %o1] 0xe2 ASI use replaced by convert2hboot
	membar	#Sync
loop_28:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29:
	xor	%i1,	%o3,	%l0
	nop 	! 	tcs	%xcc,	0x4 changed by convert2hboot
	smulcc	%o0,	0x0CEA,	%l2
	fmovsle	%icc,	%f17,	%f1
	array16	%i2,	%o5,	%o7
	udiv	%o6,	0x124F,	%g5
	fbn	%fcc1,	loop_30
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	xorcc	%g3,	%o4,	%i3
	movcc	%icc,	%l1,	%g6
loop_30:
	sdivcc	%i4,	0x0AFA,	%o2
	edge8l	%l5,	%g2,	%i0
	wr	%g0,	0x27,	%asi
	membar	#Sync
	prefetch	[%l7 + 0x58],	 0x3
	fbe,a	%fcc0,	loop_31
	fmovdge	%xcc,	%f29,	%f2
	umul	%g4,	%g7,	%o1
	nop 	! 	tvs	%icc,	0x6 changed by convert2hboot
loop_31:
	srl	%l6,	%g1,	%l3
	movvs	%xcc,	%i5,	%i7
	orncc	%i6,	%o3,	%l0
	movrlz	%i1,	%o0,	%l2
	edge8n	%o5,	%i2,	%o7
	prefetch	[%l7 + 0x14],	 0x3
	fmovde	%xcc,	%f23,	%f1
	sdiv	%g5,	0x0E1E,	%o6
	ldd	[%l7 + 0x38],	%f18
	edge8l	%o4,	%i3,	%l1
	movgu	%icc,	%g6,	%g3
	fnot1s	%f3,	%f29
	fbo	%fcc3,	loop_32
	fbule	%fcc3,	loop_33
	prefetch	[%l7 + 0x60],	 0x0
	array8	%i4,	%l5,	%o2
loop_32:
	movg	%icc,	%g2,	%l4
loop_33:
	nop
	wr	%g0,	0x0c,	%asi
	fcmpeq16	%f2,	%f6,	%g7
	nop 	! 	sir	0x1614 changed by convert2hboot
	fpsub16	%f8,	%f24,	%f12
	mulx	%o1,	0x136A,	%i0
	stb	%g1,	[%l7 + 0x1A]
	ldd	[%l7 + 0x08],	%l2
	fpackfix	%f20,	%f3
	movcc	%xcc,	%i5,	%l6
	movneg	%xcc,	%i6,	%o3
	fxnor	%f10,	%f2,	%f10
	brz,a	%i7,	loop_34
	movl	%icc,	%i1,	%l0
	membar	0x19
	nop
	setx	loop_35,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_34:
	movpos	%xcc,	%l2,	%o0
	mulx	%o5,	%o7,	%i2
	membar	0x42
loop_35:
	array8	%g5,	%o6,	%o4
	fmovsne	%xcc,	%f3,	%f22
	fmovsge	%xcc,	%f24,	%f20
	move	%xcc,	%l1,	%g6
	movcs	%xcc,	%g3,	%i3
	fmovscs	%xcc,	%f3,	%f12
	fble	%fcc1,	loop_36
	bvs,pn	%xcc,	loop_37
	edge16l	%i4,	%l5,	%o2
	mulx	%l4,	0x0A9E,	%g4
loop_36:
	std	%g2,	[%l7 + 0x28]
loop_37:
	edge8ln	%g7,	%i0,	%g1
	or	%l3,	%o1,	%l6
	wr	%g0,	0x0c,	%asi
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	subccc	%o3,	0x15D3,	%i7
	fnands	%f5,	%f30,	%f21
	brgez	%i5,	loop_38
	nop 	! 	tleu	%icc,	0x1 changed by convert2hboot
	orcc	%l0,	%l2,	%o0
	fornot1s	%f23,	%f1,	%f31
loop_38:
	alignaddrl	%i1,	%o5,	%o7
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	fmovdneg	%icc,	%f2,	%f19
	movrlz	%i2,	%g5,	%o6
	alignaddrl	%o4,	%l1,	%g3
	wr	%g0,	0x11,	%asi
	wr	%g0,	0x80,	%asi
	nop 	! 	ta	%xcc,	0x1 changed by convert2hboot
	be	loop_39
	nop 	! 	tge	%icc,	0x0 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x4 changed by convert2hboot
	brlz,a	%l5,	loop_40
loop_39:
	and	%i4,	0x1E13,	%o2
	mulscc	%g4,	%l4,	%g7
	nop 	! 	tsubcc	%i0,	0x0038,	%g1 changed by convert2hboot
loop_40:
	nop 	! 	tle	%icc,	0x3 changed by convert2hboot
	set	0x48, %l5
	sta	%f26,	[%l7 + %l5] 0x0c
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	smulcc	%g2,	%l3,	%l6
	fmovspos	%icc,	%f14,	%f13
	nop
	setx	loop_41,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movre	%i6,	%o3,	%o1
	wr	%g0,	0x81,	%asi
loop_41:
	array8	%i5,	%l2,	%o0
	movrne	%i1,	%l0,	%o7
	membar	0x73
	alignaddr	%o5,	%g5,	%i2
	andcc	%o6,	%l1,	%o4
	fpadd32	%f20,	%f20,	%f24
	std	%f30,	[%l7 + 0x30]
	addccc	%g3,	%i3,	%l5
	edge8n	%g6,	%i4,	%g4
	fbul	%fcc2,	loop_42
	fpack32	%f18,	%f8,	%f8
	edge8ln	%l4,	%o2,	%i0
	array16	%g1,	%g2,	%l3
loop_42:
	nop
	set	0x40, %g6
	nop	 ! 	stda	%f16,	[%l7 + %g6] 0x10 ASI use replaced by convert2hboot
	xorcc	%l6,	%g7,	%i6
	fmovscs	%icc,	%f24,	%f5
	movrne	%o1,	%o3,	%i5
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	fbl,a	%fcc0,	loop_43
	bn,pt	%icc,	loop_44
	movl	%xcc,	%l2,	%o0
	swap	[%l7 + 0x24],	%i1
loop_43:
	nop 	! 	tle	%icc,	0x3 changed by convert2hboot
loop_44:
	udiv	%l0,	0x073B,	%i7
	edge32l	%o7,	%g5,	%o5
	alignaddrl	%o6,	%i2,	%l1
	fbug,a	%fcc3,	loop_45
	ldstub	[%l7 + 0x21],	%o4
	fmovdne	%xcc,	%f21,	%f31
	edge32	%i3,	%g3,	%g6
loop_45:
	movne	%icc,	%i4,	%l5
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
	srl	%l4,	%g4,	%i0
	fmovrse	%g1,	%f21,	%f8
	sethi	0x0DCD,	%g2
	flush	%l7 + 0x48
	fmul8x16au	%f2,	%f11,	%f14
	ba,a,pt	%icc,	loop_46
	fmovdn	%icc,	%f17,	%f21
	faligndata	%f14,	%f22,	%f0
	srl	%l3,	%l6,	%o2
loop_46:
	movcs	%icc,	%i6,	%g7
	fmul8sux16	%f14,	%f16,	%f24
	udiv	%o1,	0x0D97,	%o3
	call	loop_47
	fsrc2s	%f15,	%f7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	nop	 ! 	casxa	[%l6] 0x04,	%l2,	%o0 ASI use replaced by convert2hboot
loop_47:
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	fbuge,a	%fcc3,	loop_48
	and	%i5,	0x1C2D,	%l0
	fone	%f30
	addccc	%i1,	0x0A08,	%o7
loop_48:
	movrgez	%i7,	%o5,	%o6
	udivx	%g5,	0x02CD,	%i2
	alignaddrl	%l1,	%o4,	%g3
	brlz,a	%i3,	loop_49
	array32	%g6,	%i4,	%l5
	fpmerge	%f12,	%f1,	%f30
	fcmpeq32	%f16,	%f6,	%l4
loop_49:
	movrne	%g4,	0x130,	%g1
	addccc	%g2,	0x08BC,	%l3
	fpadd16	%f16,	%f6,	%f22
	edge32n	%l6,	%i0,	%o2
	fbn,a	%fcc1,	loop_50
	ldsh	[%l7 + 0x38],	%g7
	xor	%o1,	%o3,	%l2
	udivx	%i6,	0x1D91,	%i5
loop_50:
	subccc	%o0,	%l0,	%o7
	fmovdneg	%xcc,	%f14,	%f17
	fmovd	%f14,	%f18
	udiv	%i7,	0x1D23,	%i1
	movrne	%o5,	%g5,	%i2
	movcc	%xcc,	%o6,	%o4
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
	fbn	%fcc2,	loop_51
	movge	%icc,	%g3,	%i3
	fcmpeq16	%f2,	%f20,	%g6
	sdivcc	%l1,	0x1000,	%l5
loop_51:
	nop
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	andcc	%g1,	0x1799,	%i4
	fbul	%fcc2,	loop_52
	udivx	%g2,	0x00B7,	%l6
	bgu,a	loop_53
	array32	%i0,	%o2,	%g7
loop_52:
	for	%f14,	%f0,	%f16
	mova	%icc,	%l3,	%o3
loop_53:
	nop
	set	0x60, %i7
	nop	 ! 	lduwa	[%l7 + %i7] 0x04,	%l2 ASI use replaced by convert2hboot
	srlx	%i6,	0x19,	%o1
	nop
	setx	loop_54,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fbn	%fcc0,	loop_55
	edge32	%o0,	%i5,	%o7
	bneg,a	%xcc,	loop_56
loop_54:
	movvc	%icc,	%l0,	%i7
loop_55:
	fble	%fcc0,	loop_57
	nop 	! 	taddcc	%o5,	0x1F24,	%g5 changed by convert2hboot
loop_56:
	srax	%i1,	0x07,	%i2
	bpos,a,pn	%icc,	loop_58
loop_57:
	nop 	! 	tsubcc	%o6,	%o4,	%g3 changed by convert2hboot
	fbge,a	%fcc2,	loop_59
	faligndata	%f30,	%f26,	%f18
loop_58:
	movrlez	%g6,	0x333,	%l1
	ldstub	[%l7 + 0x30],	%i3
loop_59:
	nop 	! 	tsubcctv	%l5,	%g4,	%g1 changed by convert2hboot
	alignaddrl	%i4,	%g2,	%l6
	xnor	%i0,	%l4,	%g7
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
	movrlz	%l3,	%o3,	%l2
	fbn	%fcc0,	loop_60
	prefetch	[%l7 + 0x70],	 0x2
	sdiv	%o2,	0x1E10,	%o1
	edge8	%o0,	%i6,	%o7
loop_60:
	fnot1	%f10,	%f0
	sra	%i5,	0x19,	%l0
	array8	%o5,	%i7,	%i1
	brnz,a	%g5,	loop_61
	subc	%i2,	%o4,	%g3
	andn	%g6,	0x15CA,	%o6
	fpadd32s	%f17,	%f1,	%f6
loop_61:
	orncc	%i3,	0x0F12,	%l5
	sdivcc	%l1,	0x0661,	%g1
	nop 	! 	tvc	%xcc,	0x0 changed by convert2hboot
	fbuge	%fcc0,	loop_62
	fornot2s	%f15,	%f19,	%f28
	nop 	! 	taddcc	%i4,	0x003F,	%g2 changed by convert2hboot
	fcmpne32	%f16,	%f6,	%g4
loop_62:
	nop 	! 	tcs	%icc,	0x6 changed by convert2hboot
	set	0x40, %i5
	nop	 ! 	stha	%l6,	[%l7 + %i5] 0x2a ASI use replaced by convert2hboot
	membar	#Sync
	set	0x38, %o2
	nop	 ! 	stwa	%i0,	[%l7 + %o2] 0x2a ASI use replaced by convert2hboot
	membar	#Sync
	movrlez	%l4,	%l3,	%o3
	nop 	! 	ta	%xcc,	0x4 changed by convert2hboot
	ble,a	%icc,	loop_63
	ldd	[%l7 + 0x68],	%f22
	fmovsg	%icc,	%f24,	%f15
	sdivcc	%g7,	0x0AB2,	%o2
loop_63:
	fnands	%f28,	%f18,	%f5
	fmovsleu	%icc,	%f15,	%f23
	faligndata	%f24,	%f22,	%f28
	set	0x38, %i6
	nop	 ! 	swapa	[%l7 + %i6] 0x89,	%l2 ASI use replaced by convert2hboot
	fpsub16	%f30,	%f4,	%f24
	edge32n	%o1,	%i6,	%o7
	nop
	setx	loop_64,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	addccc	%o0,	%i5,	%l0
	stw	%i7,	[%l7 + 0x60]
	wr	%g0,	0x80,	%asi
loop_64:
	fandnot1	%f26,	%f24,	%f24
	fbue	%fcc0,	loop_65
	fpmerge	%f17,	%f31,	%f30
	srax	%o5,	0x1F,	%i2
	fpmerge	%f7,	%f19,	%f10
loop_65:
	edge16l	%o4,	%g3,	%g6
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	stb	%o6,	[%l7 + 0x30]
	array32	%g5,	%i3,	%l5
	edge8l	%g1,	%l1,	%g2
	lduw	[%l7 + 0x78],	%i4
	fbg	%fcc0,	loop_66
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	nop 	! 	tpos	%icc,	0x0 changed by convert2hboot
	srax	%l6,	%g4,	%l4
loop_66:
	movre	%l3,	0x258,	%o3
	stx	%g7,	[%l7 + 0x18]
	nop 	! 	te	%xcc,	0x5 changed by convert2hboot
	array16	%i0,	%o2,	%o1
	bvs,a,pt	%xcc,	loop_67
	movg	%xcc,	%i6,	%o7
	addccc	%l2,	%i5,	%o0
	edge16ln	%i7,	%l0,	%o5
loop_67:
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	fmuld8sux16	%f20,	%f17,	%f20
	edge32l	%i2,	%o4,	%g3
	fmovd	%f28,	%f10
	movrgez	%i1,	0x0FB,	%g6
	srax	%g5,	%i3,	%o6
	sra	%l5,	0x0B,	%g1
	fbug	%fcc1,	loop_68
	movneg	%icc,	%l1,	%g2
	udiv	%l6,	0x1834,	%g4
	wr	%g0,	0x5f,	%asi
loop_68:
	sllx	%l3,	0x08,	%l4
	edge8n	%o3,	%g7,	%o2
	nop 	! 	tle	%xcc,	0x5 changed by convert2hboot
	move	%icc,	%i0,	%i6
	brz,a	%o1,	loop_69
	movl	%xcc,	%l2,	%o7
	bvs	loop_70
	nop 	! 	tgu	%xcc,	0x3 changed by convert2hboot
loop_69:
	movrne	%i5,	0x365,	%i7
	sdiv	%l0,	0x1EF9,	%o5
loop_70:
	popc	%i2,	%o4
	movcc	%xcc,	%o0,	%g3
	movge	%icc,	%i1,	%g6
	fand	%f0,	%f14,	%f24
	sdivx	%g5,	0x1EC0,	%o6
	edge32n	%i3,	%g1,	%l1
	fmovrdgez	%l5,	%f16,	%f16
	fblg,a	%fcc1,	loop_71
	movn	%xcc,	%l6,	%g4
	edge8	%i4,	%g2,	%l3
	andn	%l4,	%o3,	%o2
loop_71:
	nop 	! 	taddcc	%i0,	0x0FF5,	%g7 changed by convert2hboot
	nop 	! 	taddcc	%i6,	0x12FC,	%o1 changed by convert2hboot
	andcc	%o7,	%i5,	%l2
	std	%f18,	[%l7 + 0x18]
	edge8ln	%l0,	%o5,	%i7
	movrlez	%o4,	0x128,	%i2
	fbul,a	%fcc0,	loop_72
	alignaddr	%o0,	%g3,	%i1
	nop 	! 	tsubcc	%g5,	0x1607,	%g6 changed by convert2hboot
	movcs	%xcc,	%i3,	%o6
loop_72:
	movne	%icc,	%l1,	%l5
	movrne	%l6,	0x082,	%g4
	fmovrslez	%i4,	%f27,	%f25
	nop
	set	0x72, %i1
	ldstub	[%l7 + %i1],	%g1
	movl	%xcc,	%l3,	%g2
	sth	%o3,	[%l7 + 0x18]
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	movvs	%icc,	%l4,	%o2
	nop 	! 	sir	0x0613 changed by convert2hboot
	swap	[%l7 + 0x7C],	%g7
	or	%i6,	0x1A64,	%i0
	fmovsgu	%icc,	%f3,	%f28
	fmovsle	%xcc,	%f29,	%f4
	fands	%f6,	%f16,	%f31
	xor	%o7,	%i5,	%l2
	edge16l	%o1,	%l0,	%o5
	bneg,a	loop_73
	smulcc	%i7,	0x1503,	%i2
	xorcc	%o4,	%o0,	%g3
	edge16	%g5,	%g6,	%i1
loop_73:
	bg	%icc,	loop_74
	fble,a	%fcc0,	loop_75
	stw	%o6,	[%l7 + 0x0C]
	fmovsleu	%xcc,	%f25,	%f13
loop_74:
	orncc	%i3,	%l5,	%l1
loop_75:
	addc	%g4,	0x0B9D,	%l6
	edge32l	%g1,	%l3,	%i4
	faligndata	%f10,	%f16,	%f4
	nop
	setx	loop_76,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	movvs	%xcc,	%o3,	%g2
	movcs	%icc,	%l4,	%g7
	and	%o2,	0x1418,	%i6
loop_76:
	movge	%xcc,	%o7,	%i5
	fsrc1s	%f27,	%f27
	subcc	%l2,	%i0,	%l0
	wr	%g0,	0x04,	%asi
	edge32ln	%i7,	%i2,	%o4
	fmovsne	%xcc,	%f24,	%f8
	orn	%o5,	%g3,	%g5
	nop 	! 	tleu	%xcc,	0x0 changed by convert2hboot
	fmovdn	%xcc,	%f4,	%f29
	andcc	%g6,	%o0,	%i1
	fpackfix	%f6,	%f3
	srax	%i3,	0x03,	%l5
	sethi	0x01AC,	%l1
	membar	0x37
	brlz	%g4,	loop_77
	bneg,a	%icc,	loop_78
	brnz	%l6,	loop_79
	mova	%icc,	%g1,	%o6
loop_77:
	fxnors	%f10,	%f7,	%f12
loop_78:
	nop 	! 	tgu	%xcc,	0x7 changed by convert2hboot
loop_79:
	fbuge	%fcc1,	loop_80
	edge16n	%l3,	%i4,	%g2
	smul	%l4,	0x0FE8,	%o3
	set	0x0, %o3
	nop	 ! 	ldxa	[%g0 + %o3] 0x20,	%o2 ASI use replaced by convert2hboot
loop_80:
	bcc,pn	%xcc,	loop_81
	edge8ln	%i6,	%o7,	%i5
	stw	%g7,	[%l7 + 0x40]
	nop 	! 	tneg	%icc,	0x1 changed by convert2hboot
loop_81:
	fmovsgu	%icc,	%f30,	%f22
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
	edge8	%l2,	%l0,	%o1
	addccc	%i0,	%i2,	%o4
	xor	%i7,	0x1170,	%g3
	siam	0x4
	umul	%g5,	0x1A23,	%g6
	array32	%o5,	%i1,	%o0
	fmovsleu	%xcc,	%f8,	%f26
	fmovrse	%i3,	%f14,	%f27
	edge16ln	%l5,	%l1,	%l6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g4
	nop	 ! 	casa	[%l6] 0x10,	%g4,	%o6 ASI use replaced by convert2hboot
	nop 	! 	tsubcctv	%l3,	%i4,	%g1 changed by convert2hboot
	nop
	set	0x1A, %o4
	ldub	[%l7 + %o4],	%l4
	subccc	%g2,	0x12CB,	%o2
	fands	%f28,	%f15,	%f0
	ldstub	[%l7 + 0x6E],	%o3
	sub	%o7,	%i5,	%i6
	movrgz	%l2,	%g7,	%o1
	andn	%l0,	0x0A4F,	%i0
	fxors	%f10,	%f14,	%f24
	orn	%i2,	0x0814,	%o4
	udiv	%i7,	0x1CDB,	%g5
	ba,a	%xcc,	loop_82
	fbe	%fcc3,	loop_83
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g6,	0x0B0D,	%o5
loop_82:
	nop
	setx	loop_84,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_83:
	ldub	[%l7 + 0x2C],	%i1
	nop 	! 	tleu	%icc,	0x1 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84:
	edge16	%g3,	%o0,	%l5
	fmovrsne	%l1,	%f20,	%f20
	fble	%fcc0,	loop_85
	sub	%i3,	0x1CB6,	%g4
	brgz,a	%l6,	loop_86
	fabss	%f9,	%f29
loop_85:
	umulcc	%l3,	%i4,	%g1
	edge16ln	%o6,	%l4,	%g2
loop_86:
	srl	%o2,	0x02,	%o7
	alignaddr	%i5,	%o3,	%i6
	movg	%xcc,	%g7,	%o1
	fmovrslez	%l2,	%f28,	%f19
	mova	%icc,	%i0,	%i2
	fmovdge	%xcc,	%f26,	%f25
	andncc	%o4,	%i7,	%l0
	srax	%g5,	0x0A,	%o5
	fmul8x16	%f17,	%f28,	%f0
	std	%g6,	[%l7 + 0x40]
	ble,a,pn	%icc,	loop_87
	edge16l	%g3,	%o0,	%l5
	add	%l1,	0x1EC5,	%i3
	wr	%g0,	0x80,	%asi
loop_87:
	subcc	%l6,	%l3,	%i1
	and	%g1,	0x0CA9,	%o6
	fmovdvs	%icc,	%f28,	%f23
	srl	%l4,	0x19,	%g2
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	srax	%o2,	%o7,	%i4
	set	0x2E, %o6
	nop	 ! 	ldsba	[%l7 + %o6] 0x14,	%o3 ASI use replaced by convert2hboot
	fone	%f20
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
	fpackfix	%f18,	%f29
	edge32ln	%i6,	%i5,	%g7
	smulcc	%o1,	%i0,	%i2
	andn	%l2,	%o4,	%i7
	fmovdneg	%xcc,	%f11,	%f29
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	ld	[%l7 + 0x10],	%f27
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	edge32n	%l0,	%g5,	%g6
	udivcc	%g3,	0x1992,	%o5
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	set	0x2E, %l1
	nop	 ! 	lduha	[%l7 + %l1] 0x04,	%o0 ASI use replaced by convert2hboot
	fbuge,a	%fcc2,	loop_88
	fors	%f30,	%f28,	%f29
	edge32	%l1,	%i3,	%g4
	edge32ln	%l6,	%l3,	%i1
loop_88:
	movneg	%xcc,	%l5,	%o6
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
	move	%icc,	%g1,	%l4
	fmovsvs	%xcc,	%f26,	%f0
	sllx	%g2,	%o2,	%o7
	movge	%xcc,	%o3,	%i6
	srax	%i4,	0x13,	%g7
	brnz,a	%o1,	loop_89
	srl	%i0,	0x12,	%i5
	nop 	! 	tsubcctv	%i2,	0x015F,	%l2 changed by convert2hboot
	fmovsge	%icc,	%f0,	%f23
loop_89:
	fnot1	%f0,	%f16
	wr	%g0,	0x80,	%asi
	movne	%xcc,	%i7,	%g5
	movpos	%icc,	%l0,	%g3
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	fcmpeq16	%f16,	%f16,	%o5
	brz,a	%g6,	loop_90
	ldub	[%l7 + 0x1D],	%o0
	nop 	! 	tsubcctv	%l1,	0x19BB,	%i3 changed by convert2hboot
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
loop_90:
	sdiv	%l6,	0x0381,	%g4
	fmuld8sux16	%f2,	%f2,	%f8
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
	udiv	%l3,	0x0A06,	%l5
	fmovscc	%xcc,	%f1,	%f5
	movrlez	%i1,	0x1EA,	%o6
	movpos	%xcc,	%l4,	%g1
	sethi	0x0D7B,	%o2
	nop 	! 	ta	%xcc,	0x4 changed by convert2hboot
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	xor	%o7,	%o3,	%i6
	bl	%icc,	loop_91
	nop 	! 	tn	%xcc,	0x7 changed by convert2hboot
	std	%f12,	[%l7 + 0x48]
	udivx	%g2,	0x062E,	%g7
loop_91:
	fcmpne16	%f18,	%f4,	%i4
	fmovda	%xcc,	%f19,	%f28
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	edge32l	%i0,	%o1,	%i5
	nop 	! 	sir	0x11BD changed by convert2hboot
	be,a,pn	%icc,	loop_92
	bn,a	loop_93
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x18] %asi,	%f12
loop_92:
	membar	0x13
loop_93:
	movle	%icc,	%i2,	%l2
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	subc	%i7,	0x0597,	%o4
	fmovdge	%xcc,	%f8,	%f10
	srax	%l0,	%g3,	%o5
	fnands	%f27,	%f3,	%f20
	fba	%fcc1,	loop_94
	fcmple32	%f4,	%f30,	%g6
	ldx	[%l7 + 0x08],	%g5
	stb	%o0,	[%l7 + 0x3F]
loop_94:
	nop
	set	0x0C, %l4
	nop	 ! 	swapa	[%l7 + %l4] 0x10,	%i3 ASI use replaced by convert2hboot
	wr	%g0,	0x89,	%asi
	movrgez	%g4,	%l1,	%l5
	brlz,a	%l3,	loop_95
	srl	%o6,	0x07,	%i1
	fmovdge	%icc,	%f15,	%f14
	nop 	! 	taddcctv	%g1,	0x1B12,	%l4 changed by convert2hboot
loop_95:
	movgu	%icc,	%o7,	%o3
	ba,pt	%xcc,	loop_96
	fcmpd	%fcc3,	%f30,	%f4
	andn	%o2,	%g2,	%g7
	ble,a	loop_97
loop_96:
	lduw	[%l7 + 0x78],	%i4
	bn,a	%icc,	loop_98
	membar	0x26
loop_97:
	alignaddr	%i6,	%o1,	%i5
	brnz	%i2,	loop_99
loop_98:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f2,	%f5,	%f30
	fbo,a	%fcc1,	loop_100
loop_99:
	bg	loop_101
	stx	%i0,	[%l7 + 0x08]
	movn	%icc,	%l2,	%o4
loop_100:
	ldx	[%l7 + 0x20],	%i7
loop_101:
	fxnors	%f12,	%f23,	%f31
	fand	%f28,	%f28,	%f0
	subc	%l0,	0x014B,	%o5
	fmovdneg	%xcc,	%f5,	%f25
	fbue,a	%fcc0,	loop_102
	brz,a	%g3,	loop_103
	fmovse	%xcc,	%f6,	%f18
	nop 	! 	tge	%icc,	0x3 changed by convert2hboot
loop_102:
	nop
	setx loop_104, %l0, %l1
	jmpl %l1, %g6
loop_103:
	movleu	%icc,	%g5,	%o0
	fbuge	%fcc0,	loop_105
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_104:
	nop
	set	0x26, %l6
	ldsh	[%l7 + %l6],	%l6
	sllx	%g4,	%i3,	%l1
loop_105:
	nop 	! 	tg	%xcc,	0x5 changed by convert2hboot
	xnor	%l3,	0x1A52,	%l5
	movleu	%icc,	%o6,	%i1
	edge8l	%l4,	%o7,	%o3
	bleu,a,pn	%icc,	loop_106
	nop 	! 	sir	0x00E8 changed by convert2hboot
	fbuge,a	%fcc1,	loop_107
	nop 	! 	tg	%icc,	0x1 changed by convert2hboot
loop_106:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f30,	%f2,	%f22
loop_107:
	nop
	set	0x6C, %g5
	nop	 ! 	lduba	[%l7 + %g5] 0x88,	%g1 ASI use replaced by convert2hboot
	fblg,a	%fcc2,	loop_108
	nop 	! 	taddcctv	%g2,	%g7,	%o2 changed by convert2hboot
	movrgez	%i6,	%i4,	%i5
	nop
	setx loop_109, %l0, %l1
	jmpl %l1, %i2
loop_108:
	fbul	%fcc0,	loop_110
	sll	%i0,	%l2,	%o4
	set	0x20, %l3
	nop	 ! 	stxa	%i7,	[%l7 + %l3] 0x2a ASI use replaced by convert2hboot
	membar	#Sync
loop_109:
	movpos	%icc,	%o1,	%l0
loop_110:
	orn	%o5,	%g3,	%g5
	fabss	%f22,	%f23
	fornot2s	%f17,	%f16,	%f10
	edge16l	%g6,	%l6,	%o0
	or	%i3,	%g4,	%l3
	edge32ln	%l5,	%l1,	%i1
	bshuffle	%f20,	%f16,	%f6
	array32	%l4,	%o6,	%o3
	fmovde	%xcc,	%f20,	%f24
	nop 	! 	tn	%xcc,	0x7 changed by convert2hboot
	stb	%o7,	[%l7 + 0x71]
	fmovsle	%xcc,	%f0,	%f8
	set	0x1C, %o7
	nop	 ! 	ldswa	[%l7 + %o7] 0x80,	%g2 ASI use replaced by convert2hboot
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	edge16ln	%g7,	%g1,	%i6
	movrlz	%i4,	%o2,	%i5
	edge16l	%i0,	%i2,	%l2
	sll	%i7,	%o4,	%o1
	array8	%l0,	%o5,	%g5
	fmovsleu	%xcc,	%f7,	%f2
	fands	%f4,	%f12,	%f26
	edge16	%g3,	%l6,	%o0
	set	0x7C, %l0
	lda	[%l7 + %l0] 0x89,	%f11
	edge16	%g6,	%i3,	%l3
	nop 	! 	taddcc	%g4,	%l5,	%l1 changed by convert2hboot
	movn	%icc,	%i1,	%o6
	movgu	%icc,	%l4,	%o7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o3
	nop	 ! 	casa	[%l6] 0x81,	%o3,	%g2 ASI use replaced by convert2hboot
	movre	%g7,	0x20E,	%i6
	std	%f14,	[%l7 + 0x38]
	fcmpgt16	%f24,	%f30,	%i4
	edge32n	%g1,	%i5,	%i0
	xnorcc	%i2,	0x1F88,	%l2
	subcc	%i7,	%o4,	%o2
	fsrc1s	%f21,	%f25
	movpos	%icc,	%l0,	%o5
	add	%l7,	0x14,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o1
	nop	 ! 	casa	[%l6] 0x10,	%o1,	%g3 ASI use replaced by convert2hboot
	bneg	%icc,	loop_111
	edge16l	%l6,	%g5,	%g6
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tsubcc	%o0,	%i3,	%l3 changed by convert2hboot
loop_111:
	movgu	%icc,	%g4,	%l1
	movge	%icc,	%i1,	%o6
	fmovrslez	%l4,	%f1,	%f21
	fmovrslez	%o7,	%f13,	%f17
	udivx	%o3,	0x1D37,	%l5
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
	fbo,a	%fcc2,	loop_112
	bshuffle	%f4,	%f2,	%f18
	movcs	%xcc,	%g7,	%i6
	flush	%l7 + 0x08
loop_112:
	fbge,a	%fcc2,	loop_113
	sdiv	%i4,	0x1B75,	%g2
	fexpand	%f17,	%f24
	nop 	! 	taddcctv	%g1,	%i0,	%i2 changed by convert2hboot
loop_113:
	srax	%i5,	0x0B,	%i7
	fexpand	%f4,	%f18
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	movpos	%xcc,	%l2,	%o4
	wr	%g0,	0x89,	%asi
	fnor	%f16,	%f6,	%f14
	nop
	setx	loop_114,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	tsubcctv	%o5,	%o1,	%o2 changed by convert2hboot
	movne	%xcc,	%g3,	%g5
	ble,a	%xcc,	loop_115
loop_114:
	fbo	%fcc3,	loop_116
	movg	%xcc,	%g6,	%o0
	nop 	! 	sir	0x1DD9 changed by convert2hboot
loop_115:
	edge8	%i3,	%l6,	%g4
loop_116:
	nop
	wr	%g0,	0x0c,	%asi
	edge16	%l3,	%l1,	%i1
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
	fmovdleu	%xcc,	%f2,	%f18
	edge32	%o6,	%o7,	%o3
	flush	%l7 + 0x34
	array16	%l5,	%g7,	%l4
	wr	%g0,	0x88,	%asi
	or	%i4,	%g1,	%i0
	srax	%i2,	0x15,	%g2
	movrlz	%i5,	%i7,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l0,	%l2,	%o5
	sdivx	%o2,	0x09B8,	%g3
	fpackfix	%f18,	%f3
	fxnor	%f8,	%f30,	%f30
	set	0x0C, %i2
	nop	 ! 	ldsba	[%l7 + %i2] 0x04,	%g5 ASI use replaced by convert2hboot
	orcc	%o1,	0x19CF,	%o0
	ldsb	[%l7 + 0x76],	%g6
	movl	%xcc,	%i3,	%l6
	fbge,a	%fcc2,	loop_117
	fmovrsgez	%g4,	%f28,	%f20
	add	%l3,	0x1952,	%l1
	bne	loop_118
loop_117:
	fbul	%fcc3,	loop_119
	membar	0x07
	ldx	[%l7 + 0x48],	%i1
loop_118:
	bvs,pt	%xcc,	loop_120
loop_119:
	nop 	! 	tn	%xcc,	0x5 changed by convert2hboot
	and	%o7,	0x071E,	%o6
	ldsb	[%l7 + 0x6B],	%l5
loop_120:
	lduh	[%l7 + 0x68],	%o3
	bgu,a	%xcc,	loop_121
	fcmpgt32	%f14,	%f20,	%g7
	sdivcc	%l4,	0x12EA,	%i6
	movpos	%xcc,	%i4,	%i0
loop_121:
	nop
	set	0x18, %l2
	sta	%f27,	[%l7 + %l2] 0x10
	fbe	%fcc1,	loop_122
	array32	%i2,	%g1,	%g2
	fzero	%f14
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
loop_122:
	ba,pn	%icc,	loop_123
	fmovrdgz	%i7,	%f30,	%f14
	ble	%xcc,	loop_124
	edge8n	%i5,	%o4,	%l0
loop_123:
	nop
	wr	%g0,	0x81,	%asi
loop_124:
	srax	%l2,	%o2,	%g5
	bshuffle	%f6,	%f26,	%f26
	sra	%g3,	%o1,	%o0
	fmul8sux16	%f30,	%f10,	%f20
	edge32	%g6,	%i3,	%l6
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	fbuge	%fcc3,	loop_125
	ld	[%l7 + 0x68],	%f22
	movneg	%xcc,	%l3,	%g4
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
loop_125:
	fblg,a	%fcc3,	loop_126
	nop 	! 	taddcc	%i1,	0x10BE,	%o7 changed by convert2hboot
	alignaddr	%o6,	%l1,	%o3
	orn	%l5,	0x105F,	%l4
loop_126:
	nop
	setx	loop_127,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	andn	%i6,	%i4,	%g7
	movrlez	%i0,	%i2,	%g2
	fbe,a	%fcc2,	loop_128
loop_127:
	fbug,a	%fcc1,	loop_129
	edge32l	%i7,	%i5,	%o4
	fnands	%f31,	%f24,	%f13
loop_128:
	sub	%g1,	%l0,	%o5
loop_129:
	movg	%icc,	%l2,	%o2
	set	0x28, %i3
	nop	 ! 	stxa	%g5,	[%l7 + %i3] 0x2b ASI use replaced by convert2hboot
	membar	#Sync
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	fnegd	%f24,	%f16
	sdivcc	%g3,	0x04E0,	%o1
	fmovsle	%icc,	%f22,	%f10
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	fbuge	%fcc2,	loop_130
	nop 	! 	taddcc	%o0,	%g6,	%l6 changed by convert2hboot
	array16	%l3,	%i3,	%i1
	and	%g4,	0x1BB0,	%o7
loop_130:
	orn	%l1,	%o3,	%o6
	nop
	setx	loop_131,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fpsub16	%f8,	%f28,	%f20
	movpos	%icc,	%l5,	%i6
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
loop_131:
	fmovsn	%icc,	%f24,	%f3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f16,	%f8,	%f30
	fmovdneg	%icc,	%f25,	%f12
	sdivcc	%l4,	0x0483,	%i4
	fblg,a	%fcc0,	loop_132
	fand	%f2,	%f8,	%f20
	brnz	%i0,	loop_133
	bvc,a,pt	%xcc,	loop_134
loop_132:
	edge32l	%g7,	%g2,	%i7
	edge8ln	%i5,	%i2,	%o4
loop_133:
	subccc	%g1,	%l0,	%o5
loop_134:
	udiv	%l2,	0x0663,	%o2
	movrlez	%g3,	%o1,	%o0
	fxor	%f14,	%f2,	%f8
	movrlez	%g6,	0x1F2,	%g5
	fandnot1	%f10,	%f22,	%f30
	and	%l6,	0x107B,	%l3
	nop
	setx	loop_135,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fpack16	%f2,	%f16
	smulcc	%i3,	%i1,	%g4
	xor	%o7,	%l1,	%o6
loop_135:
	fmuld8ulx16	%f29,	%f22,	%f12
	sll	%o3,	%l5,	%l4
	brz	%i4,	loop_136
	fmovrde	%i0,	%f2,	%f4
	andncc	%g7,	%i6,	%i7
	bneg	%xcc,	loop_137
loop_136:
	fbo,a	%fcc1,	loop_138
	movn	%icc,	%i5,	%g2
	umulcc	%o4,	%g1,	%i2
loop_137:
	fcmple32	%f6,	%f26,	%l0
loop_138:
	bpos,a	%xcc,	loop_139
	fmul8x16al	%f13,	%f17,	%f16
	movl	%icc,	%l2,	%o5
	srax	%o2,	0x0E,	%o1
loop_139:
	sdivcc	%g3,	0x15C6,	%o0
	fexpand	%f8,	%f22
	subccc	%g5,	%l6,	%l3
	be,a	%xcc,	loop_140
	movpos	%xcc,	%i3,	%i1
	srl	%g6,	0x00,	%o7
	bl,a	loop_141
loop_140:
	nop
	setx	loop_142,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	subcc	%l1,	0x155B,	%g4
	fandnot1	%f10,	%f20,	%f30
loop_141:
	nop
	set	0x38, %g7
	nop	 ! 	prefetcha	[%l7 + %g7] 0x11,	 0x1 ASI use replaced by convert2hboot
loop_142:
	fsrc2s	%f6,	%f24
	array32	%o3,	%l5,	%i4
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	edge8n	%i0,	%g7,	%l4
	fcmpeq16	%f18,	%f20,	%i6
	fone	%f28
	fmovdgu	%xcc,	%f22,	%f25
	bshuffle	%f8,	%f28,	%f24
	udivcc	%i7,	0x024D,	%g2
	xor	%i5,	%g1,	%i2
	ldd	[%l7 + 0x60],	%f14
	fmovrsne	%o4,	%f1,	%f29
	sethi	0x1C85,	%l2
	addccc	%l0,	0x0B8A,	%o5
	set	0x57, %o0
	nop	 ! 	lduba	[%l7 + %o0] 0x11,	%o2 ASI use replaced by convert2hboot
	movpos	%icc,	%o1,	%g3
	andn	%o0,	%g5,	%l3
	udivcc	%i3,	0x0B0F,	%l6
	addc	%i1,	%o7,	%g6
	fornot1s	%f7,	%f28,	%f8
	movrgz	%l1,	%g4,	%o6
	wr	%g0,	0x04,	%asi
	wr	%g0,	0x23,	%asi
	membar	#Sync
	ba	%icc,	loop_143
	fbo,a	%fcc3,	loop_144
	fpsub32	%f14,	%f14,	%f22
	fba,a	%fcc3,	loop_145
loop_143:
	fexpand	%f13,	%f16
loop_144:
	bgu	loop_146
	fba	%fcc1,	loop_147
loop_145:
	udivx	%l5,	0x1119,	%g7
	nop
	setx	loop_148,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_146:
	xnorcc	%i0,	0x1FB4,	%l4
loop_147:
	fbul,a	%fcc2,	loop_149
	movn	%xcc,	%i7,	%g2
loop_148:
	fxnor	%f16,	%f16,	%f6
	ldd	[%l7 + 0x58],	%i4
loop_149:
	movle	%xcc,	%g1,	%i6
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
	movre	%i2,	0x3B5,	%l2
	xor	%l0,	0x1536,	%o4
	fbe	%fcc3,	loop_150
	movleu	%xcc,	%o2,	%o1
	fmovrslez	%g3,	%f20,	%f5
	umul	%o5,	%o0,	%l3
loop_150:
	bneg	%xcc,	loop_151
	mulscc	%i3,	0x093A,	%l6
	alignaddr	%g5,	%i1,	%g6
	set	0x4B, %g2
	nop	 ! 	lduba	[%l7 + %g2] 0x10,	%l1 ASI use replaced by convert2hboot
loop_151:
	nop
	set	0x10, %o5
	nop	 ! 	stwa	%g4,	[%l7 + %o5] 0xe2 ASI use replaced by convert2hboot
	membar	#Sync
	fpackfix	%f14,	%f19
	nop
	set	0x10, %g1
	std	%f24,	[%l7 + %g1]
	fmovdgu	%icc,	%f19,	%f9
	move	%icc,	%o6,	%o3
	swap	[%l7 + 0x40],	%i4
	bcc,a,pt	%icc,	loop_152
	ldsb	[%l7 + 0x66],	%o7
	array32	%g7,	%i0,	%l5
	umul	%i7,	%g2,	%l4
loop_152:
	nop
	wr	%g0,	0x81,	%asi
	edge16l	%i6,	%i2,	%l2
	sub	%g1,	%o4,	%l0
	bneg,pn	%xcc,	loop_153
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
	alignaddrl	%o1,	%g3,	%o5
	movre	%o0,	%o2,	%l3
loop_153:
	fbule	%fcc0,	loop_154
	fmovrsgz	%i3,	%f17,	%f20
	umulcc	%g5,	0x11E5,	%l6
	nop 	! 	tne	%icc,	0x1 changed by convert2hboot
loop_154:
	nop 	! 	taddcc	%g6,	%l1,	%g4 changed by convert2hboot
	fpsub32s	%f30,	%f23,	%f4
	prefetch	[%l7 + 0x58],	 0x1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x19,	%asi
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
	std	%f6,	[%l7 + 0x10]
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz	%i4,	loop_155
	lduh	[%l7 + 0x7E],	%i1
	nop 	! 	tcc	%icc,	0x1 changed by convert2hboot
	fbuge	%fcc2,	loop_156
loop_155:
	array16	%o7,	%i0,	%l5
	movn	%icc,	%g7,	%i7
	nop 	! 	taddcc	%l4,	0x0C6E,	%i5 changed by convert2hboot
loop_156:
	movre	%i6,	%i2,	%g2
	fblg	%fcc0,	loop_157
	fmovsne	%xcc,	%f8,	%f14
	nop 	! 	tpos	%icc,	0x6 changed by convert2hboot
	brnz	%l2,	loop_158
loop_157:
	umul	%g1,	0x1892,	%l0
	mulx	%o1,	0x0504,	%g3
	fxnors	%f14,	%f28,	%f30
loop_158:
	movleu	%xcc,	%o5,	%o0
	or	%o2,	0x00BA,	%o4
	add	%i3,	%g5,	%l3
	ba,pn	%xcc,	loop_159
	movvs	%xcc,	%g6,	%l1
	subc	%g4,	%o6,	%o3
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
loop_159:
	edge16	%l6,	%i4,	%o7
	fmovsvc	%icc,	%f1,	%f11
	movgu	%xcc,	%i1,	%l5
	movcc	%xcc,	%g7,	%i7
	umul	%l4,	%i0,	%i5
	smulcc	%i2,	%i6,	%l2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	fcmpne32	%f20,	%f6,	%o1
	movrlez	%g2,	%o5,	%g3
	movl	%xcc,	%o0,	%o4
	srlx	%o2,	%g5,	%i3
	nop
	setx	loop_160,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop 	! 	taddcctv	%l3,	%g6,	%g4 changed by convert2hboot
	fmovrslz	%l1,	%f5,	%f0
	sethi	0x0FAC,	%o3
loop_160:
	movneg	%icc,	%l6,	%o6
	movrgz	%o7,	%i4,	%l5
	orcc	%g7,	%i7,	%i1
	subcc	%l4,	%i0,	%i2
	wr	%g0,	0x11,	%asi
	sta	%f10,	[%l7 + 0x0C] %asi
	fbuge,a	%fcc2,	loop_161
	fbg	%fcc1,	loop_162
	array32	%i5,	%l2,	%i6
	edge8n	%l0,	%o1,	%g2
loop_161:
	udivx	%o5,	0x142B,	%g1
loop_162:
	fmovscc	%xcc,	%f14,	%f19
	fpsub32s	%f28,	%f21,	%f2
	fbge,a	%fcc1,	loop_163
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	fnot1s	%f18,	%f22
	fmovrsgz	%o0,	%f13,	%f26
loop_163:
	nop 	! 	tcs	%icc,	0x3 changed by convert2hboot
	subcc	%g3,	%o2,	%o4
	orn	%g5,	0x0434,	%i3
	set	0x54, %g4
	nop	 ! 	lduwa	[%l7 + %g4] 0x18,	%l3 ASI use replaced by convert2hboot
	brz	%g4,	loop_164
	bge	loop_165
	be	loop_166
	movleu	%xcc,	%g6,	%o3
loop_164:
	mulscc	%l6,	%o6,	%l1
loop_165:
	fcmple16	%f18,	%f16,	%i4
loop_166:
	nop 	! 	tn	%xcc,	0x5 changed by convert2hboot
	sllx	%o7,	0x16,	%l5
	edge16n	%i7,	%i1,	%l4
	nop 	! 	tvs	%xcc,	0x2 changed by convert2hboot
	mulx	%g7,	%i0,	%i5
	fcmpes	%fcc1,	%f18,	%f9
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	edge32n	%i6,	%l0,	%g2
	fpadd16	%f14,	%f30,	%f6
	array8	%o5,	%g1,	%o0
	edge32l	%g3,	%o1,	%o2
	nop 	! 	tneg	%icc,	0x3 changed by convert2hboot
	movle	%xcc,	%g5,	%o4
	movvs	%xcc,	%i3,	%l3
	fnot1s	%f18,	%f14
	udivcc	%g4,	0x1712,	%g6
	addc	%l6,	0x1C4E,	%o3
	smul	%l1,	%o6,	%o7
	wr	%g0,	0x11,	%asi
	fmovsg	%icc,	%f13,	%f27
	edge8l	%l5,	%i1,	%i7
	alignaddrl	%g7,	%l4,	%i5
	movneg	%xcc,	%i2,	%i0
	edge32l	%l2,	%i6,	%g2
	array8	%l0,	%g1,	%o5
	fones	%f5
	nop 	! 	tsubcctv	%g3,	0x11B8,	%o1 changed by convert2hboot
	lduw	[%l7 + 0x70],	%o2
	fbl	%fcc0,	loop_167
	movg	%icc,	%g5,	%o4
	movrlz	%o0,	0x25F,	%l3
	nop
	setx loop_168, %l0, %l1
	jmpl %l1, %i3
loop_167:
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	nop
	set	0x24, %g3
	sth	%g6,	[%l7 + %g3]
	set	0x32, %i0
	nop	 ! 	ldstuba	[%l7 + %i0] 0x0c,	%l6 ASI use replaced by convert2hboot
loop_168:
	fmovscc	%xcc,	%f12,	%f5
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	bcc,pt	%xcc,	loop_169
	sllx	%g4,	0x03,	%o3
	movn	%icc,	%l1,	%o7
	fornot1s	%f26,	%f2,	%f28
loop_169:
	fabss	%f0,	%f25
	lduh	[%l7 + 0x28],	%o6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	fbge,a	%fcc1,	loop_170
	xor	%i7,	%g7,	%l5
	xorcc	%l4,	%i2,	%i5
loop_170:
	addc	%i0,	0x1FDF,	%l2
	ldd	[%l7 + 0x60],	%f10
	fsrc2s	%f10,	%f12
	subccc	%g2,	0x00E2,	%i6
	fbu	%fcc2,	loop_171
	orn	%l0,	%o5,	%g1
	fmovda	%xcc,	%f30,	%f5
	fble	%fcc3,	loop_172
loop_171:
	fxor	%f8,	%f12,	%f24
	edge8n	%o1,	%o2,	%g5
	movvs	%xcc,	%o4,	%g3
loop_172:
	nop
	wr	%g0,	0xeb,	%asi
	membar	#Sync
	popc	%o0,	%i3
	xnorcc	%g6,	0x0413,	%l6
	fabss	%f27,	%f30
	edge16n	%o3,	%g4,	%l1
	ldsw	[%l7 + 0x2C],	%o7
	movge	%icc,	%i4,	%o6
	fcmps	%fcc2,	%f27,	%f31
	edge16n	%i1,	%g7,	%i7
	prefetch	[%l7 + 0x7C],	 0x1
	edge16l	%l5,	%l4,	%i2
	fbug	%fcc3,	loop_173
	fba,a	%fcc2,	loop_174
	add	%i5,	0x1791,	%i0
	subc	%l2,	%g2,	%i6
loop_173:
	orn	%l0,	%o5,	%g1
loop_174:
	swap	[%l7 + 0x3C],	%o2
	fpsub16s	%f28,	%f31,	%f24
	set	0x40, %o1
	nop	 ! 	stda	%f0,	[%l7 + %o1] 0xf0 ASI use replaced by convert2hboot
	membar	#Sync
	edge32ln	%o1,	%g5,	%g3
	mulscc	%o4,	0x0AC4,	%o0
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
	smul	%l3,	%i3,	%l6
	movvs	%icc,	%o3,	%g6
	fbul	%fcc1,	loop_175
	array16	%l1,	%g4,	%o7
	set	0x08, %l5
	nop	 ! 	ldsha	[%l7 + %l5] 0x80,	%i4 ASI use replaced by convert2hboot
loop_175:
	edge16n	%i1,	%g7,	%i7
	add	%l5,	0x0856,	%l4
	movre	%o6,	%i5,	%i0
	fbn	%fcc1,	loop_176
	bneg	%xcc,	loop_177
	nop 	! 	tneg	%icc,	0x0 changed by convert2hboot
	movn	%icc,	%l2,	%g2
loop_176:
	nop
	set	0x60, %g6
	nop	 ! 	stba	%i2,	[%l7 + %g6] 0x14 ASI use replaced by convert2hboot
loop_177:
	bleu,a	%icc,	loop_178
	lduw	[%l7 + 0x40],	%l0
	popc	0x0210,	%o5
	orn	%i6,	%o2,	%o1
loop_178:
	movrgz	%g5,	0x1DD,	%g1
	movle	%icc,	%g3,	%o0
	set	0x28, %i7
	nop	 ! 	prefetcha	[%l7 + %i7] 0x11,	 0x1 ASI use replaced by convert2hboot
	bvc,pn	%icc,	loop_179
	umulcc	%i3,	0x1E28,	%l6
	fmovsge	%icc,	%f3,	%f29
	stb	%o3,	[%l7 + 0x3D]
loop_179:
	fmuld8sux16	%f19,	%f23,	%f8
	array32	%l3,	%g6,	%g4
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	mova	%xcc,	%o7,	%l1
	call	loop_180
	sdivcc	%i1,	0x1FD6,	%g7
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	edge32	%i7,	%i4,	%l4
loop_180:
	fabss	%f28,	%f21
	alignaddr	%o6,	%l5,	%i0
	nop 	! 	tne	%xcc,	0x3 changed by convert2hboot
	orn	%i5,	0x1BB6,	%g2
	nop 	! 	tpos	%icc,	0x0 changed by convert2hboot
	subccc	%i2,	%l2,	%o5
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	movcc	%icc,	%i6,	%o2
	edge16	%o1,	%l0,	%g5
	bshuffle	%f2,	%f20,	%f4
	move	%icc,	%g1,	%o0
	fandnot2	%f12,	%f18,	%f26
	ld	[%l7 + 0x40],	%f4
	udivcc	%o4,	0x0281,	%i3
	nop 	! 	tvs	%xcc,	0x6 changed by convert2hboot
	movre	%l6,	0x100,	%o3
	udiv	%l3,	0x00AA,	%g3
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
	fmovdvs	%xcc,	%f19,	%f24
	membar	#Sync
	set	0x40, %i4
	nop	 ! 	ldda	[%l7 + %i4] 0xf1,	%f0 ASI use replaced by convert2hboot
	edge16ln	%g4,	%o7,	%l1
	std	%f30,	[%l7 + 0x08]
	ldsh	[%l7 + 0x24],	%g6
	fnegs	%f24,	%f7
	flush	%l7 + 0x4C
	fornot1	%f30,	%f2,	%f18
	fmovscs	%icc,	%f27,	%f1
	movvc	%xcc,	%i1,	%i7
	nop 	! 	tcc	%xcc,	0x0 changed by convert2hboot
	addccc	%i4,	%g7,	%l4
	sdivcc	%o6,	0x1F0C,	%i0
	udivcc	%l5,	0x00B8,	%g2
	xnor	%i5,	%i2,	%l2
	orcc	%o5,	0x04B4,	%i6
	srax	%o1,	%l0,	%o2
	sra	%g5,	%g1,	%o4
	nop 	! 	tn	%xcc,	0x5 changed by convert2hboot
	fpmerge	%f10,	%f14,	%f4
	edge16	%o0,	%l6,	%i3
	movn	%xcc,	%o3,	%l3
	fmovsvs	%xcc,	%f7,	%f18
	sdivcc	%g4,	0x0610,	%g3
	udiv	%o7,	0x1720,	%l1
	subccc	%i1,	%i7,	%g6
	orcc	%g7,	%l4,	%o6
	udiv	%i4,	0x101B,	%i0
	fmovrdgz	%g2,	%f22,	%f10
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x18] %asi,	%f11
	fmovdcc	%xcc,	%f20,	%f31
	movvs	%xcc,	%i5,	%i2
	alignaddrl	%l5,	%l2,	%o5
	edge8n	%i6,	%o1,	%o2
	bn,pn	%xcc,	loop_181
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	orncc	%g5,	0x0A1A,	%l0
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
loop_181:
	nop
	set	0x20, %o2
	nop	 ! 	ldda	[%l7 + %o2] 0xea,	%g0 ASI use replaced by convert2hboot
	wr	%g0,	0x0c,	%asi
	nop 	! 	tne	%xcc,	0x3 changed by convert2hboot
	orncc	%l6,	0x1C96,	%i3
	umulcc	%o3,	%l3,	%o4
	array32	%g3,	%g4,	%o7
	xnorcc	%i1,	0x041D,	%i7
	nop 	! 	tcs	%icc,	0x3 changed by convert2hboot
	bshuffle	%f16,	%f26,	%f2
	umulcc	%l1,	%g6,	%l4
	wr	%g0,	0x89,	%asi
	orcc	%i4,	%o6,	%g2
	fmovsg	%xcc,	%f23,	%f12
	array8	%i0,	%i5,	%l5
	bvs,a,pn	%xcc,	loop_182
	array8	%i2,	%l2,	%i6
	movpos	%icc,	%o1,	%o2
	srax	%o5,	0x06,	%l0
loop_182:
	fornot1	%f2,	%f22,	%f20
	ld	[%l7 + 0x28],	%f28
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	movrne	%g1,	%o0,	%l6
	bleu,a	loop_183
	lduw	[%l7 + 0x30],	%i3
	srlx	%g5,	0x0B,	%l3
	and	%o3,	0x0650,	%o4
loop_183:
	mova	%icc,	%g3,	%g4
	prefetch	[%l7 + 0x74],	 0x1
	bne	loop_184
	movrgez	%i1,	0x03D,	%o7
	nop 	! 	tcs	%icc,	0x3 changed by convert2hboot
	fmovsvc	%icc,	%f30,	%f19
loop_184:
	fbge,a	%fcc3,	loop_185
	st	%f20,	[%l7 + 0x1C]
	fmovde	%icc,	%f23,	%f20
	nop 	! 	tleu	%icc,	0x6 changed by convert2hboot
loop_185:
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
	bl	%icc,	loop_186
	stb	%l1,	[%l7 + 0x72]
	alignaddrl	%i7,	%g6,	%g7
	fmovsneg	%icc,	%f16,	%f22
loop_186:
	fmovdgu	%xcc,	%f1,	%f20
	ld	[%l7 + 0x78],	%f15
	edge8l	%i4,	%l4,	%g2
	array16	%o6,	%i5,	%i0
	sdivx	%i2,	0x14C0,	%l5
	srl	%l2,	0x04,	%o1
	umul	%i6,	0x133D,	%o5
	movrgez	%l0,	%o2,	%o0
	fnegs	%f26,	%f4
	andcc	%g1,	%l6,	%g5
	srlx	%i3,	0x14,	%l3
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
	fmovsn	%xcc,	%f12,	%f8
	udivx	%o3,	0x1BE2,	%g3
	fpadd32	%f26,	%f6,	%f12
	nop 	! 	tsubcctv	%o4,	0x0939,	%i1 changed by convert2hboot
	mulscc	%g4,	%l1,	%o7
	fcmpgt32	%f18,	%f0,	%i7
	umul	%g6,	0x0E7A,	%g7
	umulcc	%l4,	%g2,	%o6
	fmuld8sux16	%f18,	%f28,	%f4
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	stw	%i4,	[%l7 + 0x1C]
	array8	%i0,	%i2,	%l5
	fabss	%f27,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f8,	%f0
	xnor	%l2,	%i5,	%o1
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	alignaddrl	%o5,	%l0,	%o2
	fmovsneg	%icc,	%f21,	%f17
	fmovdneg	%xcc,	%f31,	%f18
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	orcc	%o0,	%g1,	%l6
	nop
	setx loop_187, %l0, %l1
	jmpl %l1, %i6
	movge	%icc,	%g5,	%l3
	movn	%xcc,	%o3,	%g3
	movrgez	%i3,	0x1BA,	%i1
loop_187:
	fbul,a	%fcc1,	loop_188
	edge8n	%g4,	%l1,	%o4
	edge16ln	%i7,	%o7,	%g7
	bpos	%icc,	loop_189
loop_188:
	fabss	%f6,	%f7
	wr	%g0,	0x19,	%asi
loop_189:
	orncc	%g6,	%o6,	%i4
	addc	%i0,	0x0844,	%g2
	membar	0x51
	edge16ln	%i2,	%l2,	%i5
	sll	%o1,	%l5,	%o5
	sdivcc	%l0,	0x0F6A,	%o2
	movcc	%icc,	%o0,	%l6
	umul	%g1,	%g5,	%l3
	fmuld8sux16	%f12,	%f8,	%f16
	fmul8x16au	%f20,	%f3,	%f16
	movgu	%icc,	%i6,	%o3
	fbn,a	%fcc0,	loop_190
	fbg,a	%fcc0,	loop_191
	edge16l	%g3,	%i1,	%g4
	fmul8x16	%f10,	%f26,	%f6
loop_190:
	lduh	[%l7 + 0x5A],	%i3
loop_191:
	movn	%icc,	%l1,	%i7
	movgu	%icc,	%o7,	%o4
	movrlz	%l4,	0x137,	%g6
	wr	%g0,	0x80,	%asi
	fmovdcc	%xcc,	%f26,	%f3
	movn	%xcc,	%i4,	%i0
	movpos	%xcc,	%o6,	%g2
	nop 	! 	sir	0x1AF1 changed by convert2hboot
	fornot1s	%f29,	%f16,	%f11
	fpsub16	%f10,	%f18,	%f22
	xorcc	%l2,	%i5,	%o1
	nop 	! 	tneg	%icc,	0x1 changed by convert2hboot
	bcs,a	%xcc,	loop_192
	nop 	! 	tne	%xcc,	0x5 changed by convert2hboot
	srax	%i2,	%o5,	%l5
	fcmpgt16	%f12,	%f18,	%l0
loop_192:
	fbn	%fcc0,	loop_193
	fpsub32	%f0,	%f22,	%f12
	movle	%icc,	%o0,	%o2
	srlx	%l6,	%g5,	%l3
loop_193:
	fmovdne	%xcc,	%f30,	%f6
	movgu	%xcc,	%i6,	%g1
	ble	%icc,	loop_194
	xnorcc	%g3,	%i1,	%g4
	membar	0x76
	orncc	%o3,	0x1864,	%l1
loop_194:
	nop 	! 	sir	0x049D changed by convert2hboot
	bge,a	loop_195
	udivcc	%i3,	0x0DC4,	%o7
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
	nop 	! 	taddcctv	%i7,	0x1B13,	%l4 changed by convert2hboot
loop_195:
	nop 	! 	tvs	%xcc,	0x7 changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	edge32n	%g6,	%o4,	%i4
	sethi	0x04EA,	%i0
	movle	%xcc,	%g7,	%g2
	mulx	%l2,	0x1E15,	%i5
	fnegd	%f6,	%f20
	nop
	set	0x48, %i6
	std	%o0,	[%l7 + %i6]
	movcc	%xcc,	%o6,	%o5
	srlx	%i2,	0x15,	%l0
	orn	%o0,	0x115D,	%l5
	orncc	%l6,	0x16BB,	%o2
	bg,a,pn	%xcc,	loop_196
	sub	%l3,	0x09E6,	%g5
	fcmpd	%fcc1,	%f24,	%f0
	std	%f6,	[%l7 + 0x78]
loop_196:
	movgu	%icc,	%g1,	%i6
	brlz,a	%g3,	loop_197
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
	fnand	%f12,	%f2,	%f10
	ba,pt	%icc,	loop_198
loop_197:
	fpmerge	%f1,	%f11,	%f8
	sllx	%g4,	0x06,	%i1
	edge8n	%l1,	%i3,	%o7
loop_198:
	nop
	wr	%g0,	0x04,	%asi
	edge16l	%o3,	%g6,	%l4
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
	and	%o4,	%i0,	%g7
	movge	%xcc,	%i4,	%g2
	movneg	%xcc,	%i5,	%o1
	fblg,a	%fcc3,	loop_199
	edge8n	%o6,	%o5,	%l2
	wr	%g0,	0x88,	%asi
loop_199:
	fblg,a	%fcc2,	loop_200
	orncc	%i2,	0x126C,	%o0
	edge8ln	%l0,	%l5,	%l6
	movre	%o2,	%g5,	%l3
loop_200:
	bg,a	%icc,	loop_201
	brnz,a	%g1,	loop_202
	fcmpne16	%f4,	%f24,	%i6
	fmovscs	%xcc,	%f0,	%f0
loop_201:
	nop
	set	0x34, %i5
	lduw	[%l7 + %i5],	%g4
loop_202:
	fxnor	%f30,	%f28,	%f24
	brgez	%g3,	loop_203
	movne	%icc,	%l1,	%i1
	edge8n	%i3,	%o7,	%i7
	movle	%icc,	%o3,	%g6
loop_203:
	alignaddrl	%o4,	%l4,	%i0
	edge32ln	%i4,	%g7,	%i5
	fpadd32	%f16,	%f4,	%f30
	fbuge	%fcc1,	loop_204
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tge	%icc,	0x3 changed by convert2hboot
loop_204:
	array32	%g2,	%o6,	%o5
	sra	%l2,	%i2,	%o1
	fbu,a	%fcc2,	loop_205
	fble,a	%fcc0,	loop_206
	edge8n	%o0,	%l5,	%l6
	andncc	%l0,	%g5,	%l3
loop_205:
	nop
	set	0x40, %o3
	nop	 ! 	stda	%f16,	[%l7 + %o3] 0x1e ASI use replaced by convert2hboot
	membar	#Sync
loop_206:
	array16	%g1,	%o2,	%i6
	set	0x40, %i1
	nop	 ! 	stda	%g4,	[%l7 + %i1] 0x19 ASI use replaced by convert2hboot
	edge32	%g3,	%i1,	%i3
	sra	%l1,	%o7,	%i7
	fpadd32	%f14,	%f24,	%f28
	nop 	! 	tneg	%icc,	0x5 changed by convert2hboot
	fmovsle	%icc,	%f26,	%f8
	bcc	%icc,	loop_207
	fmul8x16al	%f22,	%f8,	%f24
	nop 	! 	tl	%icc,	0x1 changed by convert2hboot
	fble	%fcc2,	loop_208
loop_207:
	fmovse	%xcc,	%f17,	%f7
	subccc	%g6,	%o4,	%o3
	edge8ln	%l4,	%i0,	%i4
loop_208:
	bg,a	%xcc,	loop_209
	andncc	%i5,	%g7,	%g2
	udivx	%o5,	0x1E25,	%l2
	edge32ln	%i2,	%o1,	%o0
loop_209:
	bneg,a,pn	%icc,	loop_210
	mulscc	%o6,	0x1102,	%l5
	set	0x26, %o4
	nop	 ! 	lduha	[%l7 + %o4] 0x04,	%l6 ASI use replaced by convert2hboot
loop_210:
	movne	%icc,	%l0,	%l3
	nop
	set	0x24, %o6
	sth	%g1,	[%l7 + %o6]
	move	%icc,	%g5,	%i6
	lduw	[%l7 + 0x38],	%g4
	fors	%f28,	%f2,	%f27
	srl	%o2,	%i1,	%g3
	nop 	! 	tsubcctv	%l1,	0x068E,	%i3 changed by convert2hboot
	fxor	%f8,	%f6,	%f12
	fone	%f4
	xnorcc	%i7,	%o7,	%o4
	nop 	! 	tsubcctv	%g6,	%o3,	%l4 changed by convert2hboot
	subccc	%i0,	0x0767,	%i5
	edge16l	%g7,	%i4,	%o5
	fmovsle	%xcc,	%f19,	%f18
	fmovsvs	%icc,	%f26,	%f29
	set	0x60, %l4
	nop	 ! 	ldswa	[%l7 + %l4] 0x81,	%g2 ASI use replaced by convert2hboot
	movcs	%icc,	%l2,	%i2
	movg	%xcc,	%o1,	%o6
	nop 	! 	taddcc	%o0,	%l5,	%l0 changed by convert2hboot
	movleu	%icc,	%l3,	%g1
	and	%l6,	0x0C46,	%g5
	smul	%g4,	0x178A,	%i6
	mova	%icc,	%i1,	%g3
	lduh	[%l7 + 0x0C],	%l1
	stx	%i3,	[%l7 + 0x08]
	xnor	%i7,	0x0ADD,	%o2
	fmovrdne	%o4,	%f26,	%f0
	edge16l	%g6,	%o3,	%o7
	fnor	%f8,	%f10,	%f14
	stx	%i0,	[%l7 + 0x38]
	edge16l	%i5,	%l4,	%i4
	udivx	%g7,	0x1434,	%g2
	set	0x4C, %l1
	nop	 ! 	lduwa	[%l7 + %l1] 0x80,	%o5 ASI use replaced by convert2hboot
	nop 	! 	taddcctv	%i2,	%o1,	%o6 changed by convert2hboot
	nop 	! 	taddcctv	%o0,	%l2,	%l0 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	fmovrsgez	%g1,	%f13,	%f10
	fmovscs	%xcc,	%f7,	%f23
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	and	%l6,	0x06E2,	%l5
	stb	%g4,	[%l7 + 0x3E]
	movl	%icc,	%g5,	%i1
	brlz,a	%g3,	loop_211
	fmovrsgez	%l1,	%f25,	%f13
	sdivx	%i3,	0x0DCF,	%i6
	movcc	%icc,	%o2,	%i7
loop_211:
	array8	%o4,	%o3,	%g6
	mulx	%o7,	%i0,	%l4
	fnegs	%f3,	%f24
	sdivx	%i5,	0x1D43,	%g7
	xnor	%g2,	%i4,	%i2
	edge32ln	%o1,	%o6,	%o0
	alignaddr	%o5,	%l0,	%l3
	sethi	0x10A4,	%l2
	nop 	! 	tsubcctv	%l6,	0x127A,	%l5 changed by convert2hboot
	movvc	%icc,	%g1,	%g4
	edge32	%g5,	%i1,	%l1
	sra	%i3,	%i6,	%g3
	edge8l	%i7,	%o4,	%o3
	edge16n	%o2,	%o7,	%i0
	fnands	%f26,	%f27,	%f22
	be,pn	%xcc,	loop_212
	fmovspos	%xcc,	%f16,	%f29
	xorcc	%g6,	%i5,	%l4
	st	%f28,	[%l7 + 0x54]
loop_212:
	alignaddr	%g7,	%g2,	%i4
	movcc	%icc,	%o1,	%i2
	movpos	%xcc,	%o0,	%o5
	xnor	%l0,	%o6,	%l3
	lduw	[%l7 + 0x4C],	%l6
	wr	%g0,	0x04,	%asi
	flush	%l7 + 0x40
	fbule	%fcc0,	loop_213
	fpackfix	%f12,	%f6
	nop 	! 	taddcctv	%l5,	0x0489,	%g4 changed by convert2hboot
	sub	%g5,	0x1011,	%g1
loop_213:
	movre	%i1,	%l1,	%i3
	fbn	%fcc0,	loop_214
	xor	%g3,	%i6,	%i7
	movg	%xcc,	%o4,	%o2
	edge16l	%o7,	%i0,	%o3
loop_214:
	ldsh	[%l7 + 0x46],	%i5
	sdivx	%g6,	0x07C7,	%l4
	nop 	! 	taddcc	%g2,	%i4,	%g7 changed by convert2hboot
	fones	%f27
	andcc	%o1,	0x15A0,	%o0
	movrlez	%i2,	%o5,	%o6
	xorcc	%l3,	0x0C31,	%l6
	movrlez	%l0,	0x284,	%l5
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
	movleu	%icc,	%g4,	%g5
	membar	0x43
	sth	%l2,	[%l7 + 0x7E]
	movneg	%xcc,	%i1,	%g1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	nop	 ! 	casa	[%l6] 0x89,	%l1,	%g3 ASI use replaced by convert2hboot
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
	movvc	%xcc,	%i3,	%i7
	and	%i6,	0x173E,	%o4
	fnand	%f8,	%f20,	%f10
	srlx	%o2,	%o7,	%i0
	xorcc	%o3,	0x1F83,	%g6
	movvc	%icc,	%i5,	%g2
	fmovrslez	%l4,	%f18,	%f19
	movrgz	%i4,	%o1,	%g7
	fble,a	%fcc1,	loop_215
	xnorcc	%o0,	%i2,	%o6
	nop 	! 	taddcctv	%l3,	%o5,	%l6 changed by convert2hboot
	edge8l	%l5,	%l0,	%g4
loop_215:
	sdiv	%l2,	0x0E74,	%i1
	move	%icc,	%g5,	%l1
	edge16l	%g3,	%i3,	%g1
	fnor	%f24,	%f18,	%f10
	addccc	%i6,	%i7,	%o4
	nop 	! 	taddcctv	%o7,	0x1B8A,	%o2 changed by convert2hboot
	stw	%i0,	[%l7 + 0x0C]
	fand	%f16,	%f18,	%f10
	fnor	%f16,	%f24,	%f4
	fmovdgu	%icc,	%f9,	%f12
	sethi	0x1950,	%g6
	fmovrde	%o3,	%f0,	%f8
	prefetch	[%l7 + 0x68],	 0x3
	nop 	! 	taddcc	%g2,	0x0D04,	%l4 changed by convert2hboot
	ldx	[%l7 + 0x10],	%i4
	add	%o1,	0x17CD,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x7C
	fmovsvs	%xcc,	%f18,	%f30
	add	%i5,	0x0056,	%o0
	sub	%o6,	0x130E,	%l3
	nop 	! 	tsubcc	%o5,	%l6,	%i2 changed by convert2hboot
	set	0x40, %g5
	nop	 ! 	stda	%f0,	[%l7 + %g5] 0xf1 ASI use replaced by convert2hboot
	membar	#Sync
	umulcc	%l0,	0x1941,	%g4
	edge16n	%l2,	%l5,	%g5
	fmovsle	%icc,	%f7,	%f0
	brlz,a	%l1,	loop_216
	fmovsl	%icc,	%f6,	%f28
	fpadd16	%f0,	%f8,	%f2
	or	%i1,	%g3,	%i3
loop_216:
	movne	%icc,	%i6,	%g1
	fmovdcs	%icc,	%f18,	%f13
	orcc	%i7,	%o7,	%o4
	bne,a,pt	%xcc,	loop_217
	fbule	%fcc1,	loop_218
	nop 	! 	tleu	%xcc,	0x6 changed by convert2hboot
	fcmps	%fcc1,	%f18,	%f30
loop_217:
	fmovrsgz	%i0,	%f16,	%f21
loop_218:
	fmovsleu	%icc,	%f21,	%f21
	edge16	%g6,	%o3,	%o2
	movge	%xcc,	%l4,	%g2
	movneg	%icc,	%i4,	%g7
	move	%icc,	%o1,	%o0
	movge	%xcc,	%i5,	%l3
	fmovsleu	%icc,	%f13,	%f25
	fbl	%fcc3,	loop_219
	subcc	%o6,	%l6,	%o5
	umul	%l0,	0x10FD,	%i2
	sdiv	%l2,	0x1FC4,	%l5
loop_219:
	edge8n	%g4,	%l1,	%g5
	subc	%i1,	0x0464,	%g3
	fbug	%fcc3,	loop_220
	fbuge	%fcc3,	loop_221
	orn	%i3,	0x1628,	%i6
	umul	%g1,	%i7,	%o7
loop_220:
	nop 	! 	tneg	%xcc,	0x2 changed by convert2hboot
loop_221:
	and	%o4,	%i0,	%g6
	edge32n	%o2,	%l4,	%o3
	bvc,a,pn	%xcc,	loop_222
	call	loop_223
	umulcc	%g2,	0x13B7,	%g7
	orcc	%o1,	0x170F,	%o0
loop_222:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_223:
	sdivcc	%i4,	0x15C3,	%i5
	faligndata	%f12,	%f30,	%f4
	ldub	[%l7 + 0x65],	%l3
	wr	%g0,	0x18,	%asi
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	move	%xcc,	%o6,	%o5
	brlz	%l0,	loop_224
	stx	%l2,	[%l7 + 0x48]
	mova	%xcc,	%i2,	%g4
	std	%f12,	[%l7 + 0x68]
loop_224:
	ldsb	[%l7 + 0x1F],	%l1
	fbg	%fcc2,	loop_225
	movvc	%xcc,	%g5,	%l5
	edge16n	%g3,	%i1,	%i6
	wr	%g0,	0x19,	%asi
loop_225:
	sdivx	%g1,	0x0960,	%o7
	bg	%icc,	loop_226
	movvs	%xcc,	%i7,	%i0
	nop 	! 	tn	%xcc,	0x5 changed by convert2hboot
	orcc	%g6,	%o2,	%l4
loop_226:
	nop
	set	0x7A, %l3
	nop	 ! 	lduba	[%l7 + %l3] 0x81,	%o3 ASI use replaced by convert2hboot
	movrgez	%o4,	0x247,	%g7
	brlez	%g2,	loop_227
	nop 	! 	tle	%xcc,	0x2 changed by convert2hboot
	movrne	%o1,	0x240,	%o0
	nop 	! 	sir	0x02DA changed by convert2hboot
loop_227:
	movvs	%xcc,	%i4,	%l3
	movrlz	%l6,	0x0CD,	%i5
	smul	%o6,	%l0,	%o5
	movrlz	%i2,	%l2,	%l1
	movrgz	%g4,	%l5,	%g5
	fpsub16	%f12,	%f6,	%f20
	bge,a	%icc,	loop_228
	ldstub	[%l7 + 0x69],	%i1
	fmovspos	%icc,	%f12,	%f11
	fmovdge	%icc,	%f8,	%f3
loop_228:
	edge16l	%i6,	%i3,	%g1
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	fbuge,a	%fcc2,	loop_229
	addccc	%g3,	%o7,	%i7
	flush	%l7 + 0x74
	and	%i0,	0x1194,	%g6
loop_229:
	udivx	%l4,	0x1E0A,	%o2
	fmovspos	%xcc,	%f25,	%f26
	st	%f8,	[%l7 + 0x5C]
	ldd	[%l7 + 0x08],	%f22
	ldub	[%l7 + 0x7F],	%o3
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
	movrlez	%g7,	0x3C2,	%g2
	movne	%xcc,	%o1,	%o0
	fblg,a	%fcc3,	loop_230
	smulcc	%i4,	0x0FDA,	%l3
	fmovdle	%icc,	%f21,	%f0
	edge16n	%l6,	%o4,	%o6
loop_230:
	fcmpd	%fcc3,	%f0,	%f18
	ldub	[%l7 + 0x2A],	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%o5,	%i2
	umul	%i5,	0x021C,	%l1
	movpos	%xcc,	%l2,	%g4
	ld	[%l7 + 0x50],	%f7
	subccc	%g5,	0x1D59,	%i1
	xnor	%l5,	0x018B,	%i3
	udivcc	%i6,	0x1426,	%g3
	addc	%o7,	%g1,	%i0
	andn	%i7,	0x0817,	%l4
	set	0x24, %l6
	nop	 ! 	ldstuba	[%l7 + %l6] 0x04,	%o2 ASI use replaced by convert2hboot
	andn	%o3,	0x0407,	%g6
	fcmped	%fcc0,	%f30,	%f14
	fnegd	%f16,	%f30
	sdiv	%g7,	0x1B89,	%o1
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	stb	%o0,	[%l7 + 0x2B]
	and	%g2,	0x062F,	%l3
	sdiv	%i4,	0x16F2,	%o4
	fbe	%fcc1,	loop_231
	sra	%o6,	0x1B,	%l0
	fpadd16	%f4,	%f4,	%f12
	wr	%g0,	0x04,	%asi
loop_231:
	srlx	%o5,	%i2,	%i5
	ble,a	loop_232
	brlz,a	%l2,	loop_233
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
	andncc	%g4,	%l1,	%g5
loop_232:
	sub	%i1,	0x03B5,	%l5
loop_233:
	fabss	%f31,	%f3
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	edge32ln	%i6,	%i3,	%g3
	lduh	[%l7 + 0x66],	%o7
	wr	%g0,	0x19,	%asi
	movre	%i0,	%i7,	%g1
	nop
	setx	loop_234,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	for	%f16,	%f10,	%f22
	fones	%f9
	xor	%l4,	%o2,	%g6
loop_234:
	fmovsleu	%xcc,	%f22,	%f0
	subcc	%g7,	0x0649,	%o1
	mova	%icc,	%o0,	%g2
	set	0x70, %l0
	nop	 ! 	stda	%o2,	[%l7 + %l0] 0x89 ASI use replaced by convert2hboot
	be,a,pt	%xcc,	loop_235
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	fandnot1	%f28,	%f28,	%f28
	brgez	%i4,	loop_236
loop_235:
	nop 	! 	tne	%icc,	0x5 changed by convert2hboot
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	mulscc	%o4,	%o6,	%l0
loop_236:
	bne,a	%icc,	loop_237
	membar	0x6C
	wr	%g0,	0x19,	%asi
loop_237:
	fmovdge	%xcc,	%f18,	%f7
	edge8ln	%o5,	%i2,	%l3
	fsrc1	%f12,	%f24
	movvs	%xcc,	%l2,	%i5
	fabsd	%f30,	%f16
	fmovrdne	%g4,	%f24,	%f20
	array8	%g5,	%i1,	%l5
	movcs	%icc,	%i6,	%i3
	fmovrsgez	%g3,	%f15,	%f13
	nop 	! 	tg	%xcc,	0x4 changed by convert2hboot
	sra	%l1,	0x14,	%i0
	addc	%i7,	%o7,	%g1
	ldsh	[%l7 + 0x36],	%l4
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
	addcc	%g6,	0x07FB,	%o2
	smulcc	%o1,	0x0D14,	%g7
	stb	%g2,	[%l7 + 0x1B]
	bgu,a,pn	%icc,	loop_238
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	movpos	%xcc,	%o3,	%i4
	sll	%o0,	0x08,	%o6
loop_238:
	subcc	%l0,	%l6,	%o5
	brnz,a	%o4,	loop_239
	fbne	%fcc1,	loop_240
	edge8	%l3,	%i2,	%l2
	fmovsa	%icc,	%f21,	%f21
loop_239:
	srax	%i5,	0x0A,	%g5
loop_240:
	addc	%g4,	%l5,	%i6
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	edge8	%i3,	%g3,	%i1
	set	0x1D, %o7
	nop	 ! 	ldsba	[%l7 + %o7] 0x80,	%i0 ASI use replaced by convert2hboot
	stx	%l1,	[%l7 + 0x48]
	fpmerge	%f20,	%f25,	%f6
	movgu	%icc,	%o7,	%g1
	stx	%i7,	[%l7 + 0x30]
	movcs	%icc,	%l4,	%o2
	fand	%f12,	%f20,	%f30
	ld	[%l7 + 0x44],	%f1
	subccc	%g6,	0x013C,	%o1
	fmovrslz	%g7,	%f12,	%f2
	stw	%g2,	[%l7 + 0x10]
	subccc	%i4,	%o0,	%o3
	brlz	%o6,	loop_241
	fnegd	%f30,	%f8
	movl	%icc,	%l6,	%l0
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
loop_241:
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
	edge32n	%o4,	%o5,	%l3
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
	edge32n	%l2,	%i5,	%g5
	wr	%g0,	0x19,	%asi
	edge8ln	%l5,	%i6,	%i3
	array16	%g3,	%g4,	%i1
	edge16l	%i0,	%o7,	%l1
	xnorcc	%g1,	%i7,	%o2
	stw	%l4,	[%l7 + 0x4C]
	ldd	[%l7 + 0x20],	%g6
	bgu,pt	%icc,	loop_242
	fmul8ulx16	%f12,	%f28,	%f0
	ble,pt	%xcc,	loop_243
	fandnot1	%f28,	%f0,	%f4
loop_242:
	andcc	%g7,	%o1,	%i4
	nop 	! 	tcc	%xcc,	0x0 changed by convert2hboot
loop_243:
	bleu,a,pn	%icc,	loop_244
	movg	%xcc,	%o0,	%g2
	andn	%o3,	%o6,	%l0
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
loop_244:
	ldd	[%l7 + 0x18],	%i6
	fcmpgt32	%f2,	%f4,	%o5
	fpsub16	%f8,	%f24,	%f12
	udiv	%l3,	0x16D9,	%o4
	fmovse	%icc,	%f30,	%f28
	prefetch	[%l7 + 0x18],	 0x0
	fbug	%fcc3,	loop_245
	subcc	%l2,	%i5,	%i2
	bvc	loop_246
	nop
	set	0x60, %i2
	ldsh	[%l7 + %i2],	%g5
loop_245:
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
loop_246:
	fmovrsgez	%i6,	%f20,	%f17
	smulcc	%g4,	0x10D2,	%i1
	fmovsleu	%icc,	%f19,	%f28
	mulx	%g3,	0x0CA4,	%i0
	orn	%l1,	0x1FEE,	%o7
	fandnot1s	%f19,	%f2,	%f4
	brnz	%i7,	loop_247
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	orncc	%g1,	0x0E6C,	%l4
	fmovrdgez	%o2,	%f8,	%f26
loop_247:
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	ldd	[%l7 + 0x48],	%g6
	fcmpgt32	%f24,	%f18,	%o1
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	movrlz	%i4,	%o0,	%g7
	movgu	%xcc,	%g2,	%o3
	fmovrdgez	%o6,	%f10,	%f2
	movvs	%icc,	%l0,	%o5
	set	0x71, %l2
	nop	 ! 	ldsba	[%l7 + %l2] 0x81,	%l6 ASI use replaced by convert2hboot
	movn	%xcc,	%o4,	%l3
	srax	%l2,	%i2,	%g5
	set	0x64, %g7
	nop	 ! 	swapa	[%l7 + %g7] 0x80,	%i5 ASI use replaced by convert2hboot
	srl	%l5,	%i6,	%g4
	fpack16	%f10,	%f27
	nop 	! 	tle	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	wr	%g0,	0xe2,	%asi
	wr	%g0,	0x18,	%asi
	alignaddr	%g3,	%l1,	%i0
	movrlz	%i7,	0x3C5,	%g1
	fmovrdlez	%o7,	%f18,	%f22
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	brlez	%o2,	loop_248
	fmul8x16au	%f9,	%f2,	%f12
	bl	%icc,	loop_249
	fcmpeq32	%f14,	%f2,	%l4
loop_248:
	fone	%f8
	andncc	%o1,	%i4,	%o0
loop_249:
	ldsw	[%l7 + 0x70],	%g7
	alignaddrl	%g2,	%g6,	%o6
	array16	%o3,	%o5,	%l6
	movcc	%xcc,	%o4,	%l3
	wr	%g0,	0x04,	%asi
	orcc	%i2,	0x1DB6,	%l0
	udivx	%g5,	0x0005,	%i5
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	andncc	%l5,	%i6,	%i1
	addc	%g4,	%g3,	%l1
	array16	%i3,	%i0,	%i7
	orncc	%o7,	%o2,	%l4
	fmovrdgez	%g1,	%f30,	%f0
	brlez,a	%o1,	loop_250
	alignaddrl	%o0,	%g7,	%g2
	nop 	! 	tg	%icc,	0x1 changed by convert2hboot
	prefetch	[%l7 + 0x70],	 0x0
loop_250:
	fbul	%fcc3,	loop_251
	fbne	%fcc0,	loop_252
	mulx	%g6,	%o6,	%o3
	fbge,a	%fcc3,	loop_253
loop_251:
	siam	0x3
loop_252:
	nop
	set	0x0D, %i3
	nop	 ! 	ldstuba	[%l7 + %i3] 0x0c,	%o5 ASI use replaced by convert2hboot
loop_253:
	fmovrdlez	%l6,	%f12,	%f20
	andn	%o4,	0x0510,	%i4
	sdivx	%l3,	0x0AA0,	%l2
	array32	%i2,	%l0,	%g5
	movneg	%xcc,	%i5,	%i6
	fbule,a	%fcc3,	loop_254
	movre	%i1,	%l5,	%g3
	fmul8x16au	%f3,	%f30,	%f6
	wr	%g0,	0x18,	%asi
loop_254:
	fpackfix	%f18,	%f30
	mova	%icc,	%i3,	%i0
	fexpand	%f21,	%f14
	ldsw	[%l7 + 0x48],	%i7
	set	0x40, %o0
	nop	 ! 	ldda	[%l7 + %o0] 0x18,	%f16 ASI use replaced by convert2hboot
	fcmpd	%fcc2,	%f28,	%f0
	bge	loop_255
	nop 	! 	tneg	%xcc,	0x7 changed by convert2hboot
	stw	%o7,	[%l7 + 0x30]
	bl,a	%xcc,	loop_256
loop_255:
	umulcc	%l1,	0x1EFA,	%o2
	addccc	%l4,	0x0AB5,	%g1
	wr	%g0,	0x89,	%asi
loop_256:
	xorcc	%o0,	0x1075,	%o1
	set	0x60, %o5
	nop	 ! 	ldxa	[%l7 + %o5] 0x19,	%g7 ASI use replaced by convert2hboot
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	bne	loop_257
	be,a,pt	%xcc,	loop_258
	srax	%g6,	0x16,	%g2
	fxnor	%f10,	%f4,	%f26
loop_257:
	sdivx	%o6,	0x0CED,	%o5
loop_258:
	array8	%o3,	%l6,	%o4
	movne	%icc,	%i4,	%l3
	add	%i2,	%l0,	%l2
	bge,pt	%icc,	loop_259
	bcc,a	loop_260
	fnot1	%f8,	%f28
	fxors	%f31,	%f17,	%f23
loop_259:
	udivcc	%g5,	0x1903,	%i5
loop_260:
	or	%i1,	%i6,	%g3
	set	0x32, %g1
	nop	 ! 	stha	%g4,	[%l7 + %g1] 0xea ASI use replaced by convert2hboot
	membar	#Sync
	movrgz	%l5,	0x0DB,	%i0
	wr	%g0,	0x89,	%asi
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	bcs,pt	%icc,	loop_261
	srl	%i3,	0x15,	%o7
	subcc	%o2,	0x01FF,	%l1
	bvs,a	loop_262
loop_261:
	andcc	%g1,	0x05A0,	%l4
	fsrc1	%f8,	%f8
	andcc	%o0,	%g7,	%g6
loop_262:
	faligndata	%f6,	%f18,	%f8
	fmovrse	%o1,	%f13,	%f4
	movcc	%icc,	%o6,	%g2
	fzero	%f10
	addccc	%o3,	%o5,	%l6
	fmovdcs	%xcc,	%f21,	%f27
	edge8n	%o4,	%l3,	%i2
	sdivcc	%i4,	0x0804,	%l0
	udivx	%l2,	0x1473,	%i5
	nop 	! 	taddcc	%i1,	%i6,	%g5 changed by convert2hboot
	fba	%fcc3,	loop_263
	edge8	%g4,	%l5,	%g3
	fmovsne	%xcc,	%f11,	%f20
	nop 	! 	taddcctv	%i7,	0x1697,	%i0 changed by convert2hboot
loop_263:
	stx	%o7,	[%l7 + 0x38]
	xorcc	%o2,	%l1,	%g1
	nop 	! 	tsubcctv	%i3,	%l4,	%g7 changed by convert2hboot
	bl,a,pn	%xcc,	loop_264
	movcc	%icc,	%o0,	%g6
	lduw	[%l7 + 0x38],	%o6
	orn	%g2,	%o1,	%o3
loop_264:
	mulx	%o5,	0x0C6D,	%l6
	call	loop_265
	brlz	%l3,	loop_266
	edge8ln	%i2,	%i4,	%l0
	mulscc	%l2,	%i5,	%i1
loop_265:
	alignaddr	%o4,	%g5,	%g4
loop_266:
	nop
	set	0x60, %g2
	nop	 ! 	ldstuba	[%l7 + %g2] 0x88,	%i6 ASI use replaced by convert2hboot
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
	bneg,a	loop_267
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l5,	0x0641,	%g3
	bg,a,pt	%icc,	loop_268
loop_267:
	bne,a,pn	%icc,	loop_269
	nop
	setx loop_270, %l0, %l1
	jmpl %l1, %i0
	sub	%i7,	0x1652,	%o7
loop_268:
	fpsub32	%f8,	%f16,	%f6
loop_269:
	xorcc	%l1,	0x04FD,	%o2
loop_270:
	orncc	%i3,	%l4,	%g7
	movvs	%icc,	%g1,	%g6
	sub	%o0,	0x0F97,	%g2
	sdivcc	%o6,	0x042E,	%o3
	edge16n	%o1,	%l6,	%l3
	sethi	0x1982,	%o5
	movrgz	%i4,	%i2,	%l0
	ldsw	[%l7 + 0x54],	%i5
	fcmps	%fcc1,	%f7,	%f26
	mulx	%i1,	0x150F,	%l2
	fmovdpos	%icc,	%f3,	%f21
	fpmerge	%f24,	%f26,	%f22
	orcc	%g5,	%o4,	%g4
	nop 	! 	sir	0x0C93 changed by convert2hboot
	edge16ln	%i6,	%g3,	%i0
	edge8l	%i7,	%l5,	%l1
	bcs,a	%xcc,	loop_271
	mova	%icc,	%o2,	%o7
	ldub	[%l7 + 0x7F],	%i3
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
loop_271:
	movpos	%icc,	%l4,	%g7
	xnorcc	%g6,	0x14EF,	%o0
	movvs	%icc,	%g1,	%o6
	set	0x48, %g4
	nop	 ! 	stxa	%o3,	[%l7 + %g4] 0xe3 ASI use replaced by convert2hboot
	membar	#Sync
	edge8n	%g2,	%l6,	%o1
	fcmpgt32	%f14,	%f6,	%l3
	movre	%i4,	%i2,	%l0
	edge8l	%i5,	%i1,	%l2
	sethi	0x1975,	%g5
	std	%o4,	[%l7 + 0x78]
	fnands	%f18,	%f2,	%f4
	array16	%o4,	%g4,	%i6
	fcmpeq16	%f14,	%f8,	%i0
	sdiv	%i7,	0x0A7D,	%g3
	fbul,a	%fcc1,	loop_272
	movleu	%xcc,	%l1,	%o2
	udivx	%o7,	0x0068,	%l5
	orn	%l4,	0x1E4F,	%i3
loop_272:
	brnz,a	%g6,	loop_273
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	udivx	%g7,	0x1667,	%o0
	fcmps	%fcc3,	%f9,	%f8
loop_273:
	nop
	set	0x76, %g3
	ldub	[%l7 + %g3],	%o6
	fmovdl	%xcc,	%f12,	%f17
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	bn,a,pn	%xcc,	loop_274
	fabsd	%f2,	%f0
	fnot1	%f12,	%f16
	udiv	%g2,	0x0890,	%l6
loop_274:
	fmovdleu	%xcc,	%f22,	%f1
	edge16	%o1,	%l3,	%i2
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	movl	%icc,	%i4,	%l0
	mulscc	%i1,	%i5,	%l2
	fpackfix	%f10,	%f12
	movcc	%icc,	%g5,	%o5
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	bne,a,pt	%icc,	loop_275
	movg	%icc,	%g4,	%o4
	and	%i6,	%i7,	%g3
loop_275:
	call	loop_276
	edge8n	%l1,	%i0,	%o2
	bcc,a	loop_277
	movle	%xcc,	%l5,	%o7
loop_276:
	fpadd32	%f16,	%f16,	%f24
	subcc	%i3,	%l4,	%g7
loop_277:
	edge8l	%g6,	%o0,	%o6
	set	0x40, %o1
	nop	 ! 	ldda	[%l7 + %o1] 0x11,	%f0 ASI use replaced by convert2hboot
	smul	%g1,	%g2,	%l6
	popc	%o3,	%o1
	fpadd32s	%f13,	%f4,	%f8
	fxor	%f14,	%f8,	%f20
	bvs,a,pt	%xcc,	loop_278
	movvc	%icc,	%i2,	%i4
	wr	%g0,	0x18,	%asi
loop_278:
	fbo,a	%fcc2,	loop_279
	edge8	%i1,	%i5,	%l0
	smul	%g5,	0x1765,	%l2
	movneg	%xcc,	%o5,	%o4
loop_279:
	sdiv	%i6,	0x1ED0,	%i7
	fandnot2s	%f28,	%f29,	%f5
	bcs	%xcc,	loop_280
	srlx	%g3,	0x1B,	%l1
	prefetch	[%l7 + 0x0C],	 0x3
	smulcc	%g4,	0x07BE,	%o2
loop_280:
	movl	%icc,	%i0,	%l5
	nop 	! 	tcs	%xcc,	0x3 changed by convert2hboot
	swap	[%l7 + 0x58],	%o7
	bleu	loop_281
	andncc	%i3,	%g7,	%l4
	sub	%o0,	%g6,	%o6
	andncc	%g1,	%l6,	%g2
loop_281:
	movrlz	%o1,	0x21F,	%i2
	edge8	%o3,	%l3,	%i1
	nop
	setx loop_282, %l0, %l1
	jmpl %l1, %i4
	move	%xcc,	%l0,	%i5
	ba,a	%xcc,	loop_283
	fbuge,a	%fcc2,	loop_284
loop_282:
	xorcc	%l2,	%g5,	%o5
	movleu	%icc,	%i6,	%o4
loop_283:
	nop
	membar	#Sync
	wr	%g0,	0x1f,	%asi
loop_284:
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
	movvc	%icc,	%i7,	%g3
	nop 	! 	taddcc	%g4,	%l1,	%i0 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	fbg	%fcc2,	loop_285
	nop 	! 	tl	%icc,	0x1 changed by convert2hboot
	fandnot1	%f0,	%f12,	%f2
	popc	0x12EE,	%l5
loop_285:
	udiv	%o7,	0x11E3,	%i3
	mulscc	%g7,	%l4,	%o0
	fbl	%fcc0,	loop_286
	fnands	%f5,	%f25,	%f15
	srax	%g6,	%o6,	%o2
	set	0x55, %l5
	nop	 ! 	ldstuba	[%l7 + %l5] 0x80,	%l6 ASI use replaced by convert2hboot
loop_286:
	fmovsge	%icc,	%f22,	%f11
	fmovda	%xcc,	%f9,	%f22
	fmovs	%f31,	%f10
	orcc	%g2,	0x1887,	%g1
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	bn,pt	%icc,	loop_287
	movcs	%xcc,	%o1,	%o3
	edge32	%l3,	%i2,	%i4
	sll	%i1,	0x1D,	%i5
loop_287:
	brz,a	%l2,	loop_288
	andcc	%l0,	0x1426,	%g5
	udivcc	%o5,	0x1A64,	%i6
	edge8ln	%o4,	%g3,	%g4
loop_288:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	nop	 ! 	casxa	[%l6] 0x11,	%i7,	%l1 ASI use replaced by convert2hboot
	xnorcc	%l5,	0x03BF,	%i0
	fmovsg	%xcc,	%f4,	%f23
	prefetch	[%l7 + 0x5C],	 0x0
	andn	%i3,	%g7,	%o7
	swap	[%l7 + 0x74],	%l4
	fornot1	%f16,	%f0,	%f16
	brlez	%g6,	loop_289
	fnot2	%f28,	%f28
	fmovsvs	%xcc,	%f1,	%f26
	st	%f5,	[%l7 + 0x44]
loop_289:
	fpadd16s	%f17,	%f0,	%f10
	movpos	%icc,	%o6,	%o2
	fmovsgu	%xcc,	%f0,	%f22
	srax	%o0,	0x1D,	%g2
	fnot2s	%f31,	%f3
	addccc	%g1,	0x182A,	%o1
	call	loop_290
	popc	%o3,	%l3
	movrne	%i2,	0x0B5,	%l6
	lduw	[%l7 + 0x50],	%i1
loop_290:
	movleu	%icc,	%i5,	%i4
	brnz	%l0,	loop_291
	movvs	%xcc,	%g5,	%l2
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
loop_291:
	nop 	! 	taddcctv	%i6,	%o5,	%o4 changed by convert2hboot
	brnz	%g4,	loop_292
	movre	%g3,	0x378,	%i7
	bneg,a	%xcc,	loop_293
	movgu	%xcc,	%l1,	%i0
loop_292:
	udivcc	%l5,	0x0AB1,	%i3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g7
loop_293:
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	edge8ln	%g6,	%l4,	%o2
	movgu	%icc,	%o0,	%o6
	movleu	%icc,	%g2,	%o1
	fmuld8ulx16	%f0,	%f27,	%f2
	xnor	%o3,	%g1,	%l3
	ld	[%l7 + 0x74],	%f4
	movrgez	%i2,	%l6,	%i1
	fnot1s	%f10,	%f11
	alignaddrl	%i5,	%l0,	%g5
	wr	%g0,	0x80,	%asi
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x14] %asi,	%f17
	alignaddr	%i6,	%o5,	%l2
	fmovrdgez	%o4,	%f8,	%f4
	fmovsge	%xcc,	%f3,	%f5
	fbue	%fcc1,	loop_294
	sdivx	%g3,	0x1C28,	%i7
	movrgz	%l1,	0x12C,	%i0
	sll	%l5,	0x04,	%i3
loop_294:
	nop
	setx loop_295, %l0, %l1
	jmpl %l1, %g4
	edge32l	%o7,	%g6,	%l4
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	orncc	%g7,	%o0,	%o2
loop_295:
	edge16ln	%o6,	%o1,	%o3
	fmovrslez	%g2,	%f15,	%f17
	sethi	0x1889,	%l3
	set	0x70, %g6
	nop	 ! 	stba	%i2,	[%l7 + %g6] 0x04 ASI use replaced by convert2hboot
	movrgez	%g1,	0x0B9,	%l6
	sth	%i5,	[%l7 + 0x2E]
	wr	%g0,	0x19,	%asi
	wr	%g0,	0x80,	%asi
	movne	%icc,	%g5,	%i6
	add	%i4,	0x0134,	%l2
	umul	%o4,	%g3,	%i7
	fxor	%f26,	%f10,	%f30
	fbul	%fcc0,	loop_296
	xnor	%l1,	0x16F8,	%o5
	movcc	%icc,	%l5,	%i3
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
loop_296:
	for	%f2,	%f28,	%f28
	xnor	%i0,	0x0499,	%o7
	bleu,a	loop_297
	fbg	%fcc2,	loop_298
	fpsub32s	%f16,	%f28,	%f12
	nop
	setx loop_299, %l0, %l1
	jmpl %l1, %g4
loop_297:
	fcmped	%fcc2,	%f28,	%f30
loop_298:
	edge32	%l4,	%g6,	%g7
	fmovsn	%icc,	%f25,	%f24
loop_299:
	fbg,a	%fcc1,	loop_300
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	nop 	! 	ta	%icc,	0x6 changed by convert2hboot
	array32	%o2,	%o6,	%o0
loop_300:
	mova	%icc,	%o3,	%g2
	fba,a	%fcc3,	loop_301
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
	popc	%o1,	%l3
	fmovrslz	%i2,	%f22,	%f26
loop_301:
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	fors	%f29,	%f26,	%f12
	srax	%g1,	%i5,	%i1
	bne,pt	%icc,	loop_302
	fors	%f5,	%f4,	%f22
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	bgu,pn	%xcc,	loop_303
loop_302:
	movvc	%xcc,	%l0,	%g5
	fbe	%fcc0,	loop_304
	fmovdn	%xcc,	%f10,	%f31
loop_303:
	stb	%i6,	[%l7 + 0x3C]
	udivcc	%l6,	0x137A,	%i4
loop_304:
	nop 	! 	taddcc	%o4,	%g3,	%i7 changed by convert2hboot
	fnors	%f2,	%f25,	%f4
	andcc	%l2,	%l1,	%o5
	fxor	%f20,	%f4,	%f14
	popc	0x1D5F,	%i3
	fabss	%f12,	%f27
	fornot2s	%f2,	%f20,	%f8
	udivx	%l5,	0x0F35,	%i0
	srlx	%g4,	%o7,	%g6
	nop 	! 	tsubcctv	%l4,	%g7,	%o6 changed by convert2hboot
	fcmpne16	%f10,	%f22,	%o0
	flush	%l7 + 0x3C
	fpsub16	%f28,	%f20,	%f26
	andncc	%o3,	%g2,	%o2
	fbuge	%fcc2,	loop_305
	nop 	! 	tleu	%icc,	0x3 changed by convert2hboot
	movgu	%xcc,	%l3,	%i2
	andcc	%o1,	0x0723,	%i5
loop_305:
	movcs	%icc,	%i1,	%l0
	fba,a	%fcc2,	loop_306
	or	%g5,	%i6,	%l6
	brgz	%i4,	loop_307
	andcc	%g1,	0x08CA,	%g3
loop_306:
	movn	%icc,	%i7,	%o4
	movrlz	%l1,	%l2,	%o5
loop_307:
	movgu	%icc,	%i3,	%i0
	movle	%icc,	%l5,	%g4
	edge8	%g6,	%l4,	%o7
	xor	%o6,	%g7,	%o0
	nop
	setx loop_308, %l0, %l1
	jmpl %l1, %o3
	mulx	%g2,	0x1C71,	%l3
	fcmpne32	%f22,	%f16,	%o2
	movgu	%xcc,	%i2,	%o1
loop_308:
	edge16l	%i1,	%i5,	%l0
	or	%g5,	0x054C,	%l6
	movvc	%xcc,	%i4,	%g1
	sdivx	%i6,	0x1774,	%i7
	and	%o4,	%l1,	%g3
	addcc	%l2,	%o5,	%i3
	srax	%i0,	0x0D,	%l5
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	movre	%g4,	%l4,	%g6
	fblg	%fcc0,	loop_309
	edge16	%o7,	%o6,	%o0
	wr	%g0,	0x89,	%asi
loop_309:
	fxors	%f1,	%f16,	%f29
	fbe	%fcc2,	loop_310
	srax	%g2,	0x16,	%g7
	fmovdg	%xcc,	%f17,	%f4
	bne	%icc,	loop_311
loop_310:
	nop 	! 	tsubcctv	%o2,	%l3,	%i2 changed by convert2hboot
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
	movn	%icc,	%o1,	%i5
loop_311:
	orn	%i1,	%g5,	%l0
	brlz,a	%i4,	loop_312
	movl	%icc,	%g1,	%i6
	edge32n	%l6,	%o4,	%l1
	fbl	%fcc2,	loop_313
loop_312:
	lduh	[%l7 + 0x5C],	%i7
	wr	%g0,	0x88,	%asi
loop_313:
	addc	%o5,	%i3,	%l2
	nop 	! 	tneg	%icc,	0x0 changed by convert2hboot
	stb	%l5,	[%l7 + 0x23]
	movle	%icc,	%i0,	%g4
	fmovscs	%icc,	%f18,	%f26
	fpackfix	%f16,	%f0
	edge32n	%g6,	%l4,	%o6
	set	0x66, %i7
	nop	 ! 	lduha	[%l7 + %i7] 0x10,	%o0 ASI use replaced by convert2hboot
	bg,a	%icc,	loop_314
	movge	%xcc,	%o7,	%g2
	fsrc1	%f12,	%f18
	fmovdneg	%xcc,	%f26,	%f31
loop_314:
	movle	%icc,	%g7,	%o3
	wr	%g0,	0xe2,	%asi
	membar	#Sync
	edge32n	%i2,	%o1,	%i5
	movrlz	%i1,	%g5,	%l0
	movrlz	%l3,	%i4,	%g1
	fnot2s	%f2,	%f27
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	movneg	%xcc,	%l1,	%o4
	set	0x40, %i4
	nop	 ! 	stda	%f16,	[%l7 + %i4] 0x14 ASI use replaced by convert2hboot
	edge16	%g3,	%o5,	%i7
	andncc	%i3,	%l2,	%l5
	mulscc	%i0,	0x1453,	%g4
	edge16	%l4,	%g6,	%o0
	xnor	%o6,	0x0BBD,	%o7
	movne	%icc,	%g2,	%g7
	fmovsge	%xcc,	%f3,	%f11
	smulcc	%o3,	%o2,	%o1
	faligndata	%f30,	%f8,	%f14
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	edge32ln	%i5,	%i2,	%g5
	andcc	%i1,	%l3,	%l0
	fpsub16s	%f16,	%f26,	%f7
	ldd	[%l7 + 0x60],	%f28
	fbg	%fcc1,	loop_315
	fbule,a	%fcc2,	loop_316
	movrgez	%i4,	0x088,	%i6
	brgez,a	%g1,	loop_317
loop_315:
	edge16l	%l1,	%l6,	%o4
loop_316:
	move	%xcc,	%g3,	%o5
	fbg,a	%fcc0,	loop_318
loop_317:
	brlz,a	%i3,	loop_319
	fcmps	%fcc2,	%f4,	%f11
	mulx	%l2,	%l5,	%i0
loop_318:
	ldsw	[%l7 + 0x58],	%g4
loop_319:
	and	%l4,	0x0E74,	%g6
	mulscc	%i7,	%o6,	%o7
	set	0x2C, %o2
	nop	 ! 	stwa	%o0,	[%l7 + %o2] 0x15 ASI use replaced by convert2hboot
	nop 	! 	taddcctv	%g7,	0x10A7,	%o3 changed by convert2hboot
	movrlez	%o2,	0x0B1,	%g2
	movrgez	%o1,	%i2,	%i5
	fmovdleu	%xcc,	%f3,	%f21
	umulcc	%i1,	0x14F7,	%g5
	movrgz	%l3,	0x3EA,	%i4
	array16	%l0,	%i6,	%l1
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	movleu	%icc,	%g1,	%l6
	fzero	%f2
	fcmpne16	%f28,	%f26,	%o4
	edge32ln	%g3,	%i3,	%o5
	orn	%l5,	%i0,	%g4
	fcmped	%fcc0,	%f26,	%f20
	fmovrdgez	%l4,	%f24,	%f20
	nop 	! 	taddcctv	%l2,	%g6,	%i7 changed by convert2hboot
	mova	%xcc,	%o7,	%o0
	popc	0x18DE,	%o6
	orcc	%g7,	0x1529,	%o3
	stw	%o2,	[%l7 + 0x60]
	movvc	%icc,	%g2,	%o1
	pdist	%f22,	%f4,	%f18
	fands	%f4,	%f19,	%f1
	brz,a	%i2,	loop_320
	fmovsa	%icc,	%f9,	%f24
	fmovsa	%icc,	%f23,	%f2
	movrgez	%i5,	%g5,	%i1
loop_320:
	array32	%l3,	%l0,	%i6
	fxor	%f4,	%f26,	%f24
	xnor	%l1,	%g1,	%i4
	subccc	%o4,	0x1D94,	%l6
	brgz,a	%g3,	loop_321
	bneg,a,pn	%icc,	loop_322
	fpsub16	%f24,	%f4,	%f6
	wr	%g0,	0x11,	%asi
loop_321:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_322:
	xnor	%i3,	%l5,	%g4
	fpackfix	%f30,	%f26
	nop 	! 	sir	0x065A changed by convert2hboot
	bge	%icc,	loop_323
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i0,	%l2,	%l4
	edge8ln	%g6,	%o7,	%o0
loop_323:
	flush	%l7 + 0x08
	andcc	%o6,	%g7,	%i7
	fbn,a	%fcc2,	loop_324
	ldsh	[%l7 + 0x66],	%o2
	nop 	! 	tg	%xcc,	0x3 changed by convert2hboot
	movvc	%xcc,	%o3,	%g2
loop_324:
	alignaddr	%i2,	%i5,	%g5
	orn	%i1,	%o1,	%l3
	ldsh	[%l7 + 0x26],	%l0
	edge8l	%l1,	%g1,	%i4
	edge16	%i6,	%l6,	%o4
	bpos,pn	%icc,	loop_325
	fmovsn	%icc,	%f9,	%f16
	orn	%o5,	0x0D18,	%i3
	membar	0x5B
loop_325:
	bvs,a	%xcc,	loop_326
	fbuge	%fcc2,	loop_327
	fmovsneg	%xcc,	%f0,	%f2
	fbn	%fcc0,	loop_328
loop_326:
	sdivx	%l5,	0x0A8A,	%g4
loop_327:
	nop 	! 	tsubcctv	%g3,	%i0,	%l4 changed by convert2hboot
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
loop_328:
	fmovdvc	%icc,	%f12,	%f0
	edge32ln	%g6,	%l2,	%o7
	movneg	%icc,	%o6,	%o0
	mulx	%g7,	%i7,	%o2
	movvs	%xcc,	%g2,	%i2
	nop 	! 	tsubcc	%i5,	%o3,	%i1 changed by convert2hboot
	udiv	%g5,	0x0B0A,	%l3
	sdivx	%l0,	0x051C,	%o1
	fcmpne32	%f8,	%f30,	%l1
	bleu,pn	%xcc,	loop_329
	sethi	0x1C84,	%i4
	fones	%f28
	fble,a	%fcc0,	loop_330
loop_329:
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	fmovrse	%g1,	%f5,	%f2
	fmovsge	%xcc,	%f19,	%f12
loop_330:
	edge32n	%i6,	%o4,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l6,	0x1556,	%i3
	edge8l	%l5,	%g3,	%i0
	andcc	%l4,	%g4,	%l2
	fmovrslez	%o7,	%f10,	%f19
	subc	%o6,	%g6,	%g7
	edge8n	%i7,	%o0,	%o2
	srl	%i2,	%g2,	%o3
	add	%i1,	%g5,	%i5
	fmovdleu	%xcc,	%f12,	%f21
	xorcc	%l0,	0x0766,	%o1
	fnand	%f26,	%f18,	%f22
	movcc	%icc,	%l3,	%i4
	nop 	! 	ta	%xcc,	0x5 changed by convert2hboot
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	set	0x74, %i6
	nop	 ! 	ldswa	[%l7 + %i6] 0x0c,	%l1 ASI use replaced by convert2hboot
	edge8l	%i6,	%g1,	%o5
	movg	%icc,	%o4,	%i3
	sdivcc	%l5,	0x1DCE,	%l6
	set	0x30, %i5
	nop	 ! 	ldxa	[%l7 + %i5] 0x81,	%g3 ASI use replaced by convert2hboot
	std	%l4,	[%l7 + 0x18]
	edge32ln	%i0,	%l2,	%g4
	movvs	%xcc,	%o6,	%g6
	xor	%o7,	%g7,	%i7
	set	0x30, %i0
	nop	 ! 	ldda	[%l7 + %i0] 0x23,	%o2 ASI use replaced by convert2hboot
	movrgez	%i2,	%g2,	%o0
	fmul8x16	%f8,	%f22,	%f6
	andncc	%i1,	%g5,	%i5
	call	loop_331
	flush	%l7 + 0x38
	sdivx	%l0,	0x04D0,	%o1
	edge16	%o3,	%l3,	%l1
loop_331:
	movrgez	%i6,	0x203,	%g1
	edge32ln	%i4,	%o5,	%i3
	andn	%o4,	0x1B54,	%l5
	flush	%l7 + 0x14
	movrlez	%l6,	%g3,	%i0
	fmovscs	%icc,	%f29,	%f1
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	edge32	%l2,	%g4,	%o6
	xorcc	%g6,	%l4,	%g7
	fmovdpos	%xcc,	%f13,	%f22
	addc	%o7,	%o2,	%i2
	nop
	set	0x70, %o3
	stw	%g2,	[%l7 + %o3]
	array8	%o0,	%i1,	%i7
	alignaddr	%g5,	%i5,	%l0
	subc	%o1,	0x192F,	%l3
	fmovda	%xcc,	%f13,	%f11
	nop
	set	0x64, %i1
	stw	%l1,	[%l7 + %i1]
	wr	%g0,	0x81,	%asi
	sta	%f20,	[%l7 + 0x68] %asi
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	edge32n	%o3,	%i6,	%g1
	edge32n	%i4,	%i3,	%o4
	lduh	[%l7 + 0x6A],	%l5
	wr	%g0,	0x18,	%asi
	fmovrsgz	%o5,	%f9,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g3,	%i0,	%l2
	popc	0x0D68,	%g4
	edge8ln	%o6,	%l4,	%g6
	fmovdl	%xcc,	%f3,	%f29
	wr	%g0,	0x80,	%asi
	fcmpes	%fcc1,	%f0,	%f12
	movl	%icc,	%o7,	%o2
	xorcc	%i2,	0x1494,	%o0
	edge8	%g2,	%i7,	%i1
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	or	%g5,	%l0,	%o1
	nop
	setx loop_332, %l0, %l1
	jmpl %l1, %l3
	fcmpgt16	%f18,	%f28,	%i5
	fmovsvs	%icc,	%f26,	%f3
	fmovsge	%xcc,	%f4,	%f2
loop_332:
	umulcc	%l1,	%o3,	%i6
	bne,a	loop_333
	fbge	%fcc0,	loop_334
	ble,a	%icc,	loop_335
	fbne	%fcc2,	loop_336
loop_333:
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
loop_334:
	nop
	wr	%g0,	0x89,	%asi
loop_335:
	subc	%i4,	%i3,	%l5
loop_336:
	bl	loop_337
	fcmpeq16	%f28,	%f22,	%o4
	sllx	%o5,	0x13,	%g3
	call	loop_338
loop_337:
	fcmpd	%fcc1,	%f6,	%f28
	bg,a	%icc,	loop_339
	fmovdneg	%icc,	%f14,	%f14
loop_338:
	fbul	%fcc3,	loop_340
	udiv	%l6,	0x18F2,	%i0
loop_339:
	nop
	wr	%g0,	0x19,	%asi
loop_340:
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
	fpack32	%f28,	%f10,	%f10
	set	0x4E, %o4
	nop	 ! 	stba	%g4,	[%l7 + %o4] 0x80 ASI use replaced by convert2hboot
	bcs,a,pt	%xcc,	loop_341
	fmul8x16al	%f21,	%f12,	%f28
	fmovrdlez	%o6,	%f4,	%f24
	movcc	%icc,	%l4,	%g6
loop_341:
	fmovd	%f30,	%f18
	fmovrse	%o7,	%f2,	%f3
	move	%icc,	%g7,	%i2
	nop 	! 	tne	%icc,	0x5 changed by convert2hboot
	nop 	! 	taddcctv	%o0,	0x1BB3,	%o2 changed by convert2hboot
	fmovspos	%xcc,	%f22,	%f27
	mulx	%g2,	%i7,	%i1
	andn	%g5,	%l0,	%o1
	bl,a	%xcc,	loop_342
	andn	%l3,	0x1ABE,	%i5
	and	%o3,	%l1,	%g1
	array16	%i6,	%i3,	%i4
loop_342:
	edge16l	%o4,	%l5,	%g3
	swap	[%l7 + 0x24],	%o5
	fmovspos	%icc,	%f28,	%f6
	andcc	%l6,	0x10EE,	%i0
	fmovdn	%xcc,	%f8,	%f27
	fmovdleu	%icc,	%f1,	%f2
	add	%g4,	%l2,	%o6
	wr	%g0,	0x11,	%asi
	edge32	%o7,	%l4,	%i2
	bn,a	loop_343
	ldd	[%l7 + 0x48],	%f30
	subc	%o0,	0x00B9,	%g7
	ble	loop_344
loop_343:
	alignaddr	%g2,	%o2,	%i7
	bl,a	loop_345
	fbne,a	%fcc0,	loop_346
loop_344:
	movrgz	%i1,	%g5,	%l0
	nop
	set	0x10, %l4
	stx	%l3,	[%l7 + %l4]
loop_345:
	bcs	loop_347
loop_346:
	xnor	%i5,	%o1,	%l1
	alignaddr	%g1,	%o3,	%i3
	nop 	! 	sir	0x0216 changed by convert2hboot
loop_347:
	smulcc	%i6,	0x0B45,	%i4
	fmovdn	%icc,	%f15,	%f6
	movrne	%l5,	%g3,	%o4
	fmovrse	%l6,	%f9,	%f20
	edge8n	%o5,	%g4,	%l2
	flush	%l7 + 0x68
	ldsw	[%l7 + 0x70],	%o6
	fmovrdlez	%i0,	%f16,	%f10
	flush	%l7 + 0x64
	andcc	%g6,	0x182B,	%o7
	sra	%i2,	0x09,	%o0
	sth	%g7,	[%l7 + 0x38]
	subccc	%l4,	0x1CA2,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g2,	0x195D,	%i1
	movleu	%icc,	%g5,	%l0
	fbue	%fcc2,	loop_348
	udiv	%i7,	0x0B5C,	%i5
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
	edge8n	%l3,	%o1,	%l1
loop_348:
	srl	%o3,	0x1F,	%g1
	fmul8x16	%f25,	%f4,	%f20
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	fmovdcc	%xcc,	%f31,	%f29
	srax	%i3,	0x1A,	%i4
	bcc,a	%icc,	loop_349
	edge16l	%l5,	%i6,	%o4
	sllx	%g3,	%o5,	%l6
	fmovrdlz	%g4,	%f16,	%f28
loop_349:
	prefetch	[%l7 + 0x30],	 0x1
	ldd	[%l7 + 0x58],	%o6
	ldsb	[%l7 + 0x25],	%i0
	nop 	! 	tge	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	nop 	! 	sir	0x11B6 changed by convert2hboot
	srlx	%g6,	%o7,	%l2
	edge16n	%o0,	%i2,	%l4
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	stx	%o2,	[%l7 + 0x68]
	fornot2	%f2,	%f28,	%f14
	popc	%g7,	%g2
	fmovdl	%xcc,	%f24,	%f27
	fmovrdgez	%g5,	%f8,	%f22
	fornot1	%f30,	%f14,	%f22
	sra	%i1,	0x0F,	%l0
	brz,a	%i7,	loop_350
	ldub	[%l7 + 0x2B],	%l3
	fbul	%fcc3,	loop_351
	fpadd16	%f30,	%f6,	%f10
loop_350:
	fnot1	%f24,	%f28
	xorcc	%i5,	%l1,	%o3
loop_351:
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	fbe	%fcc2,	loop_352
	bgu,a	loop_353
	fmovsl	%icc,	%f28,	%f25
	fpmerge	%f28,	%f9,	%f12
loop_352:
	movcc	%xcc,	%g1,	%i3
loop_353:
	ldd	[%l7 + 0x68],	%f4
	nop 	! 	tsubcc	%o1,	%i4,	%l5 changed by convert2hboot
	and	%i6,	%g3,	%o5
	fand	%f12,	%f2,	%f18
	ld	[%l7 + 0x20],	%f0
	array32	%o4,	%g4,	%o6
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	bne,pt	%icc,	loop_354
	nop 	! 	sir	0x0D1F changed by convert2hboot
	nop 	! 	sir	0x0C8E changed by convert2hboot
	wr	%g0,	0x80,	%asi
	sta	%f9,	[%l7 + 0x14] %asi
loop_354:
	fmovdge	%icc,	%f1,	%f13
	sdiv	%l6,	0x0351,	%g6
	fmuld8sux16	%f0,	%f0,	%f10
	movcc	%icc,	%o7,	%l2
	movl	%icc,	%o0,	%i2
	andn	%i0,	0x1470,	%l4
	edge8	%o2,	%g7,	%g5
	mulscc	%i1,	%l0,	%i7
	xorcc	%g2,	0x0EAE,	%l3
	xnorcc	%l1,	0x17CA,	%o3
	set	0x50, %o6
	nop	 ! 	stwa	%i5,	[%l7 + %o6] 0xeb ASI use replaced by convert2hboot
	membar	#Sync
	fmovs	%f23,	%f28
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	udivcc	%g1,	0x1B38,	%i3
	nop 	! 	taddcc	%i4,	0x0A4A,	%o1 changed by convert2hboot
	array16	%i6,	%l5,	%o5
	edge8n	%o4,	%g3,	%g4
	smulcc	%l6,	%g6,	%o6
	fbul	%fcc1,	loop_355
	sra	%l2,	0x1E,	%o7
	fmul8x16au	%f26,	%f9,	%f30
	movpos	%xcc,	%i2,	%o0
loop_355:
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	xnorcc	%i0,	0x14EC,	%o2
	xorcc	%l4,	%g7,	%g5
	fors	%f7,	%f29,	%f26
	nop 	! 	taddcc	%l0,	0x1CF7,	%i7 changed by convert2hboot
	fcmpes	%fcc0,	%f7,	%f29
	sethi	0x1BE2,	%g2
	array8	%i1,	%l3,	%l1
	nop
	setx	loop_356,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movrgez	%o3,	%g1,	%i5
	lduh	[%l7 + 0x2E],	%i3
	bcs	loop_357
loop_356:
	fble,a	%fcc1,	loop_358
	andncc	%o1,	%i4,	%l5
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
loop_357:
	prefetch	[%l7 + 0x64],	 0x0
loop_358:
	fbg	%fcc3,	loop_359
	edge8n	%o5,	%i6,	%g3
	std	%f30,	[%l7 + 0x18]
	ldx	[%l7 + 0x30],	%g4
loop_359:
	fpsub32	%f6,	%f6,	%f30
	edge32	%o4,	%g6,	%l6
	udivcc	%o6,	0x171B,	%o7
	fbug	%fcc3,	loop_360
	nop 	! 	tneg	%icc,	0x0 changed by convert2hboot
	wr	%g0,	0x81,	%asi
loop_360:
	ldub	[%l7 + 0x33],	%o0
	fmovdle	%icc,	%f12,	%f30
	wr	%g0,	0x89,	%asi
	wr	%g0,	0x80,	%asi
	mulscc	%l4,	0x0CF9,	%i2
	lduh	[%l7 + 0x70],	%g5
	edge32n	%l0,	%g7,	%i7
	fmovdvs	%icc,	%f7,	%f9
	nop 	! 	tneg	%icc,	0x3 changed by convert2hboot
	wr	%g0,	0x81,	%asi
	orcc	%l3,	0x19B3,	%l1
	fbl,a	%fcc2,	loop_361
	sll	%g2,	0x0F,	%g1
	edge32ln	%i5,	%i3,	%o1
	set	0x2F, %g5
	nop	 ! 	stba	%o3,	[%l7 + %g5] 0x2b ASI use replaced by convert2hboot
	membar	#Sync
loop_361:
	movn	%icc,	%i4,	%l5
	fbu	%fcc2,	loop_362
	fxnors	%f23,	%f1,	%f3
	andcc	%o5,	0x0FB1,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_362:
	edge32l	%g3,	%o4,	%g6
	fsrc1	%f12,	%f18
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
	membar	0x49
	fmovrdlez	%g4,	%f28,	%f18
	edge8ln	%l6,	%o6,	%l2
	nop 	! 	sir	0x11FF changed by convert2hboot
	fmovsvc	%icc,	%f18,	%f14
	set	0x2F, %l3
	nop	 ! 	stba	%o0,	[%l7 + %l3] 0x80 ASI use replaced by convert2hboot
	fbne	%fcc3,	loop_363
	bleu,a	%xcc,	loop_364
	fpadd16	%f20,	%f30,	%f16
	fmovsge	%xcc,	%f10,	%f15
loop_363:
	sethi	0x05DB,	%o7
loop_364:
	nop 	! 	tle	%icc,	0x3 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne,a	%fcc0,	loop_365
	membar	0x45
	bvs,a,pt	%xcc,	loop_366
	movge	%xcc,	%o2,	%l4
loop_365:
	umul	%i0,	0x0D4A,	%g5
	ld	[%l7 + 0x10],	%f24
loop_366:
	fmovdle	%icc,	%f12,	%f28
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	st	%f28,	[%l7 + 0x5C]
	udivx	%l0,	0x185A,	%i2
	nop 	! 	tsubcctv	%i7,	%i1,	%l3 changed by convert2hboot
	set	0x38, %l1
	nop	 ! 	ldswa	[%l7 + %l1] 0x81,	%g7 ASI use replaced by convert2hboot
	udivx	%l1,	0x1909,	%g2
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
	and	%i5,	0x15AD,	%i3
	set	0x22, %l0
	nop	 ! 	lduha	[%l7 + %l0] 0x14,	%o1 ASI use replaced by convert2hboot
	mova	%icc,	%o3,	%i4
	fmovrse	%l5,	%f15,	%f26
	nop 	! 	te	%xcc,	0x5 changed by convert2hboot
	alignaddrl	%g1,	%i6,	%o5
	fcmpgt16	%f2,	%f4,	%o4
	movgu	%xcc,	%g6,	%g3
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	subc	%g4,	0x0192,	%l6
	addcc	%l2,	0x0767,	%o0
	fmovrdlz	%o7,	%f30,	%f14
	nop 	! 	tvs	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	fpsub32	%f18,	%f28,	%f0
	bn	loop_367
	fsrc1s	%f15,	%f16
	fbn	%fcc0,	loop_368
	array8	%o2,	%l4,	%i0
loop_367:
	fnor	%f4,	%f24,	%f24
	sethi	0x023B,	%o6
loop_368:
	fpadd16	%f0,	%f24,	%f10
	sdiv	%g5,	0x0A43,	%l0
	movg	%icc,	%i7,	%i2
	movpos	%icc,	%l3,	%i1
	sra	%g7,	0x18,	%l1
	nop 	! 	tsubcc	%i5,	%g2,	%i3 changed by convert2hboot
	fmovdvc	%xcc,	%f8,	%f18
	fcmpeq16	%f22,	%f4,	%o1
	xnorcc	%i4,	0x0CC4,	%o3
	addc	%g1,	0x153E,	%l5
	udivx	%o5,	0x1BCE,	%o4
	fpmerge	%f4,	%f4,	%f24
	movvc	%icc,	%g6,	%i6
	and	%g4,	%g3,	%l6
	brz	%l2,	loop_369
	faligndata	%f10,	%f20,	%f26
	fsrc1s	%f15,	%f21
	bgu	%xcc,	loop_370
loop_369:
	fmovsl	%icc,	%f27,	%f26
	prefetch	[%l7 + 0x08],	 0x2
	fpack32	%f12,	%f4,	%f2
loop_370:
	srax	%o7,	%o0,	%o2
	bcc,a	%xcc,	loop_371
	fmovspos	%xcc,	%f21,	%f28
	ble,a	loop_372
	nop 	! 	tsubcc	%i0,	%o6,	%g5 changed by convert2hboot
loop_371:
	array8	%l0,	%i7,	%i2
	sll	%l3,	0x05,	%l4
loop_372:
	fpsub32	%f24,	%f28,	%f18
	edge16l	%i1,	%l1,	%i5
	fbl	%fcc3,	loop_373
	nop 	! 	tsubcctv	%g7,	%g2,	%o1 changed by convert2hboot
	fmovsgu	%icc,	%f12,	%f2
	bg	loop_374
loop_373:
	fbul,a	%fcc0,	loop_375
	fmovrsgz	%i4,	%f12,	%f23
	edge32ln	%i3,	%o3,	%l5
loop_374:
	movg	%xcc,	%g1,	%o5
loop_375:
	fxor	%f2,	%f20,	%f0
	fmovdl	%xcc,	%f18,	%f31
	ldub	[%l7 + 0x18],	%g6
	srlx	%o4,	0x1C,	%i6
	or	%g3,	0x037E,	%l6
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
	edge16l	%g4,	%o7,	%o0
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	edge16ln	%l2,	%i0,	%o6
	fnot2s	%f17,	%f17
	fbule	%fcc0,	loop_376
	andcc	%o2,	%g5,	%l0
	fbule	%fcc1,	loop_377
	udivcc	%i2,	0x033D,	%i7
loop_376:
	movrgez	%l4,	0x0D5,	%l3
	wr	%g0,	0xe3,	%asi
	membar	#Sync
loop_377:
	movrlz	%l1,	0x3C5,	%g7
	movre	%i5,	0x35D,	%g2
	movg	%icc,	%i4,	%o1
	movle	%icc,	%o3,	%l5
	fmovsl	%xcc,	%f19,	%f9
	std	%i2,	[%l7 + 0x68]
	wr	%g0,	0x11,	%asi
	popc	0x04A5,	%g1
	xor	%g6,	%o4,	%i6
	subc	%l6,	0x0E2F,	%g3
	sll	%g4,	%o7,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i0,	0x337,	%o6
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	mulscc	%l2,	%g5,	%l0
	and	%i2,	0x181F,	%o2
	nop 	! 	tgu	%xcc,	0x7 changed by convert2hboot
	fmovrsne	%i7,	%f12,	%f19
	nop 	! 	tsubcc	%l3,	0x00AB,	%i1 changed by convert2hboot
	bneg	%xcc,	loop_378
	mova	%xcc,	%l4,	%g7
	edge16	%i5,	%l1,	%g2
	and	%o1,	%o3,	%l5
loop_378:
	smul	%i3,	%o5,	%g1
	sdivcc	%i4,	0x1514,	%g6
	bcc,a,pn	%icc,	loop_379
	bg,a,pn	%icc,	loop_380
	nop 	! 	te	%icc,	0x3 changed by convert2hboot
	movl	%icc,	%o4,	%i6
loop_379:
	fmovsvs	%xcc,	%f3,	%f21
loop_380:
	bneg,pn	%xcc,	loop_381
	swap	[%l7 + 0x40],	%l6
	sra	%g3,	0x04,	%g4
	edge8ln	%o7,	%i0,	%o6
loop_381:
	orcc	%o0,	0x1F17,	%g5
	or	%l0,	%l2,	%o2
	addc	%i7,	0x05E0,	%l3
	movneg	%xcc,	%i1,	%i2
	smul	%l4,	%i5,	%l1
	fba	%fcc1,	loop_382
	fxor	%f16,	%f0,	%f8
	movrgez	%g2,	0x2DB,	%o1
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
loop_382:
	fcmple32	%f14,	%f18,	%o3
	fmovspos	%xcc,	%f27,	%f11
	fzero	%f22
	movrne	%l5,	0x335,	%i3
	fmovdcs	%icc,	%f7,	%f1
	srl	%g7,	%g1,	%i4
	movpos	%xcc,	%g6,	%o4
	fba	%fcc0,	loop_383
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	movrne	%o5,	0x0F2,	%i6
	set	0x0C, %o7
	nop	 ! 	ldswa	[%l7 + %o7] 0x15,	%g3 ASI use replaced by convert2hboot
loop_383:
	smul	%g4,	0x0A9D,	%l6
	membar	0x6E
	fpsub32s	%f31,	%f10,	%f18
	set	0x5C, %i2
	nop	 ! 	stha	%o7,	[%l7 + %i2] 0x18 ASI use replaced by convert2hboot
	udivx	%o6,	0x1771,	%i0
	fmovdg	%xcc,	%f29,	%f25
	alignaddrl	%o0,	%g5,	%l0
	edge32l	%l2,	%o2,	%l3
	sdivcc	%i7,	0x1757,	%i1
	movrgz	%l4,	%i2,	%l1
	nop 	! 	tvs	%xcc,	0x6 changed by convert2hboot
	stx	%g2,	[%l7 + 0x68]
	fpadd32s	%f9,	%f16,	%f7
	nop 	! 	taddcc	%i5,	0x1D00,	%o3 changed by convert2hboot
	sethi	0x1528,	%l5
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
	movg	%icc,	%i3,	%o1
	fmovrse	%g7,	%f8,	%f3
	movrgz	%i4,	0x1BF,	%g1
	fmovdleu	%xcc,	%f10,	%f28
	srlx	%o4,	%o5,	%g6
	wr	%g0,	0x88,	%asi
	sta	%f1,	[%l7 + 0x5C] %asi
	movgu	%xcc,	%g3,	%i6
	stx	%l6,	[%l7 + 0x58]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o7,	%g4,	%o6
	nop 	! 	tsubcctv	%i0,	0x1000,	%o0 changed by convert2hboot
	addc	%g5,	%l2,	%l0
	subcc	%o2,	0x10CA,	%l3
	fcmple16	%f28,	%f4,	%i1
	add	%l4,	%i2,	%i7
	fbu,a	%fcc2,	loop_384
	stb	%l1,	[%l7 + 0x39]
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	fabsd	%f0,	%f28
loop_384:
	mulx	%g2,	%i5,	%o3
	xnor	%i3,	0x1BFD,	%l5
	smulcc	%g7,	%o1,	%i4
	fmovsne	%xcc,	%f22,	%f3
	fmovdneg	%icc,	%f29,	%f2
	movrlz	%o4,	0x11E,	%o5
	alignaddrl	%g1,	%g6,	%g3
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	stw	%l6,	[%l7 + 0x24]
	orcc	%o7,	0x1E0B,	%i6
	mova	%xcc,	%o6,	%g4
	movrgez	%i0,	0x0BB,	%o0
	srlx	%l2,	0x06,	%g5
	movn	%xcc,	%o2,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg	%xcc,	loop_385
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	or	%l0,	%i1,	%i2
	fcmpne32	%f22,	%f20,	%l4
loop_385:
	nop
	setx	loop_386,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	bge	loop_387
	andcc	%l1,	0x0C52,	%i7
	fmovdl	%icc,	%f18,	%f15
loop_386:
	udivcc	%i5,	0x153B,	%o3
loop_387:
	nop 	! 	tle	%xcc,	0x2 changed by convert2hboot
	move	%xcc,	%i3,	%l5
	nop 	! 	tg	%xcc,	0x7 changed by convert2hboot
	ba,pt	%icc,	loop_388
	nop
	set	0x30, %l6
	std	%g2,	[%l7 + %l6]
	movpos	%xcc,	%o1,	%i4
	fmovdneg	%icc,	%f4,	%f30
loop_388:
	movl	%icc,	%g7,	%o4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g1
	fbule	%fcc1,	loop_389
	movleu	%xcc,	%o5,	%l6
	edge8ln	%g3,	%i6,	%o6
	orn	%g4,	%i0,	%o7
loop_389:
	ldsh	[%l7 + 0x44],	%o0
	bcs,a	loop_390
	udivx	%g5,	0x112D,	%o2
	subc	%l2,	%l3,	%i1
	andncc	%l0,	%l4,	%i2
loop_390:
	fba,a	%fcc2,	loop_391
	edge16n	%l1,	%i7,	%i5
	fble	%fcc3,	loop_392
	edge16n	%o3,	%l5,	%g2
loop_391:
	andncc	%i3,	%i4,	%o1
	bleu,pt	%icc,	loop_393
loop_392:
	subc	%g7,	0x17A2,	%g1
	wr	%g0,	0x10,	%asi
loop_393:
	udiv	%o5,	0x0053,	%g6
	edge16ln	%l6,	%g3,	%i6
	edge8ln	%g4,	%i0,	%o6
	sethi	0x080B,	%o0
	wr	%g0,	0x88,	%asi
	ba,pn	%icc,	loop_394
	edge32l	%g5,	%o2,	%l2
	fbn	%fcc2,	loop_395
	movn	%icc,	%l3,	%i1
loop_394:
	nop
	set	0x30, %g7
	lda	[%l7 + %g7] 0x0c,	%f10
loop_395:
	nop 	! 	sir	0x1727 changed by convert2hboot
	movpos	%xcc,	%l4,	%i2
	edge16	%l1,	%i7,	%l0
	sub	%o3,	0x12BE,	%i5
	edge8n	%g2,	%l5,	%i3
	movrne	%o1,	%g7,	%g1
	flush	%l7 + 0x38
	fbg,a	%fcc3,	loop_396
	edge8ln	%i4,	%o4,	%g6
	movrne	%o5,	%l6,	%g3
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
loop_396:
	nop
	wr	%g0,	0x18,	%asi
	bgu,pn	%icc,	loop_397
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	edge16	%i6,	%i0,	%g4
loop_397:
	nop
	wr	%g0,	0x04,	%asi
	movrgz	%o6,	%g5,	%o7
	subcc	%l2,	0x1953,	%o2
	orcc	%i1,	%l4,	%l3
	sth	%i2,	[%l7 + 0x78]
	fbo	%fcc1,	loop_398
	xorcc	%l1,	0x0D20,	%i7
	sllx	%o3,	%l0,	%i5
	fbne,a	%fcc3,	loop_399
loop_398:
	array8	%g2,	%l5,	%o1
	fba	%fcc0,	loop_400
	udiv	%g7,	0x07CA,	%g1
loop_399:
	movrgz	%i3,	0x2F9,	%i4
	sub	%g6,	%o5,	%o4
loop_400:
	smul	%g3,	%i6,	%l6
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
	smulcc	%g4,	0x1E87,	%o0
	nop 	! 	tvs	%xcc,	0x3 changed by convert2hboot
	fand	%f2,	%f30,	%f26
	movpos	%icc,	%i0,	%o6
	fornot1s	%f21,	%f8,	%f23
	andcc	%g5,	%l2,	%o7
	wr	%g0,	0x89,	%asi
	movvc	%xcc,	%i1,	%l4
	sth	%i2,	[%l7 + 0x14]
	nop
	setx	loop_401,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop
	setx	loop_402,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop
	setx	loop_403,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	array16	%l3,	%l1,	%i7
loop_401:
	fcmpd	%fcc1,	%f10,	%f22
loop_402:
	subc	%l0,	%i5,	%o3
loop_403:
	umul	%g2,	%o1,	%g7
	ld	[%l7 + 0x68],	%f3
	nop 	! 	tsubcctv	%g1,	%l5,	%i4 changed by convert2hboot
	fsrc2s	%f24,	%f19
	fbuge,a	%fcc3,	loop_404
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
	ldsb	[%l7 + 0x3F],	%g6
	xnor	%o5,	0x0FE7,	%o4
loop_404:
	bge,pt	%xcc,	loop_405
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	fbule,a	%fcc3,	loop_406
	fpsub16s	%f4,	%f10,	%f2
loop_405:
	nop
	set	0x50, %i3
	nop	 ! 	ldswa	[%l7 + %i3] 0x19,	%g3 ASI use replaced by convert2hboot
loop_406:
	nop 	! 	sir	0x0A1E changed by convert2hboot
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	set	0x0, %l2
	nop	 ! 	stxa	%i6,	[%g0 + %l2] 0x5f ASI use replaced by convert2hboot
	fmuld8sux16	%f19,	%f19,	%f14
	stb	%l6,	[%l7 + 0x6C]
	orcc	%i3,	%g4,	%i0
	udiv	%o0,	0x150F,	%g5
	fexpand	%f11,	%f0
	set	0x45, %o0
	nop	 ! 	ldstuba	[%l7 + %o0] 0x80,	%o6 ASI use replaced by convert2hboot
	movrgez	%l2,	%o2,	%o7
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	movrgez	%l4,	0x324,	%i2
	bn,a,pt	%xcc,	loop_407
	fabsd	%f30,	%f0
	fandnot1s	%f2,	%f27,	%f1
	array32	%l3,	%l1,	%i1
loop_407:
	movleu	%icc,	%l0,	%i7
	addccc	%i5,	%o3,	%o1
	nop
	set	0x78, %g1
	ldx	[%l7 + %g1],	%g2
	nop 	! 	sir	0x1853 changed by convert2hboot
	movrlez	%g7,	0x33F,	%g1
	smulcc	%l5,	%i4,	%o5
	fmovsa	%icc,	%f6,	%f0
	mulx	%g6,	0x0938,	%o4
	bge,a	loop_408
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	#Sync
	wr	%g0,	0x1f,	%asi
loop_408:
	prefetch	[%l7 + 0x44],	 0x2
	membar	0x2E
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
	smul	%i6,	%g3,	%i3
	nop 	! 	taddcctv	%g4,	%i0,	%o0 changed by convert2hboot
	mulx	%l6,	0x18E4,	%o6
	xnor	%l2,	0x0F9E,	%g5
	nop
	set	0x48, %g2
	stx	%o2,	[%l7 + %g2]
	movrlz	%o7,	0x21C,	%l4
	mulscc	%l3,	0x103A,	%l1
	wr	%g0,	0x88,	%asi
	edge16ln	%l0,	%i2,	%i5
	udivcc	%i7,	0x035E,	%o1
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
	and	%g2,	%o3,	%g1
	fmovrslez	%l5,	%f2,	%f26
	sdivx	%g7,	0x0E4A,	%o5
	be,a,pn	%icc,	loop_409
	fmovdgu	%icc,	%f30,	%f19
	array32	%i4,	%g6,	%o4
	edge8ln	%g3,	%i6,	%g4
loop_409:
	fornot1s	%f30,	%f20,	%f3
	fmovsgu	%xcc,	%f6,	%f7
	swap	[%l7 + 0x20],	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f25,	%f19
	bg,a,pt	%icc,	loop_410
	edge32l	%i0,	%o0,	%l6
	fcmpeq16	%f2,	%f20,	%l2
	movn	%icc,	%o6,	%o2
loop_410:
	fnot2s	%f30,	%f3
	mova	%icc,	%g5,	%o7
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	move	%xcc,	%l4,	%l3
	fcmps	%fcc3,	%f13,	%f7
	smul	%l1,	0x02D5,	%i1
	bcc,pn	%icc,	loop_411
	fmovdle	%xcc,	%f5,	%f3
	udivcc	%i2,	0x031E,	%l0
	edge32ln	%i5,	%i7,	%o1
loop_411:
	umulcc	%o3,	0x1FB6,	%g1
	fmovsvc	%icc,	%f1,	%f22
	wr	%g0,	0xeb,	%asi
	membar	#Sync
	umul	%g7,	%o5,	%i4
	fors	%f8,	%f0,	%f11
	brgz	%l5,	loop_412
	sdivx	%g6,	0x19A9,	%g3
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
loop_412:
	fnegd	%f26,	%f26
	set	0x59, %g4
	nop	 ! 	lduba	[%l7 + %g4] 0x88,	%i3 ASI use replaced by convert2hboot
	bl,pt	%icc,	loop_413
	nop 	! 	tcc	%xcc,	0x7 changed by convert2hboot
	srl	%i6,	0x16,	%o0
	lduh	[%l7 + 0x62],	%i0
loop_413:
	and	%l6,	%l2,	%o6
	nop 	! 	sir	0x0E79 changed by convert2hboot
	subccc	%o2,	%g5,	%l4
	wr	%g0,	0x18,	%asi
	brnz	%o7,	loop_414
	nop 	! 	tcs	%xcc,	0x3 changed by convert2hboot
	fmuld8sux16	%f30,	%f8,	%f4
	fexpand	%f19,	%f14
loop_414:
	edge32	%l1,	%i1,	%l0
	fnor	%f16,	%f14,	%f2
	movgu	%xcc,	%i2,	%i7
	movrlz	%i5,	%o3,	%g1
	brlz,a	%g2,	loop_415
	sub	%o1,	%o5,	%i4
	fmovde	%icc,	%f12,	%f29
	movneg	%icc,	%g7,	%l5
loop_415:
	fmovsg	%icc,	%f31,	%f7
	fmovrslz	%g6,	%f0,	%f5
	sdiv	%o4,	0x1004,	%g4
	add	%g3,	0x05CB,	%i3
	fmovdn	%xcc,	%f10,	%f13
	ble,pt	%icc,	loop_416
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
	udivx	%i6,	0x0970,	%o0
	set	0x4C, %g3
	nop	 ! 	ldswa	[%l7 + %g3] 0x04,	%l6 ASI use replaced by convert2hboot
loop_416:
	edge32	%i0,	%o6,	%l2
	fnot1	%f30,	%f16
	udiv	%g5,	0x1B51,	%l4
	mova	%xcc,	%l3,	%o7
	fbuge,a	%fcc1,	loop_417
	edge16n	%o2,	%i1,	%l1
	fmovsvc	%icc,	%f12,	%f7
	fpsub16	%f0,	%f26,	%f20
loop_417:
	umul	%l0,	%i7,	%i5
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	movrlz	%o3,	0x2EC,	%g1
	srlx	%i2,	%o1,	%g2
	fpadd32	%f6,	%f12,	%f18
	edge32ln	%o5,	%g7,	%l5
	edge8ln	%g6,	%o4,	%i4
	sdivx	%g3,	0x1410,	%i3
	call	loop_418
	fmovdgu	%icc,	%f2,	%f22
	ldsb	[%l7 + 0x59],	%g4
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
loop_418:
	fbuge,a	%fcc2,	loop_419
	alignaddrl	%o0,	%i6,	%i0
	movrne	%o6,	%l6,	%l2
	and	%g5,	%l4,	%l3
loop_419:
	bneg	%xcc,	loop_420
	fmovda	%icc,	%f6,	%f19
	movpos	%xcc,	%o2,	%i1
	movrgz	%o7,	0x102,	%l0
loop_420:
	fmovscc	%xcc,	%f23,	%f24
	fsrc1	%f6,	%f14
	std	%f8,	[%l7 + 0x48]
	sra	%l1,	0x1F,	%i7
	sll	%o3,	0x1C,	%i5
	movre	%i2,	0x3FB,	%g1
	bcs,a	%icc,	loop_421
	movrgez	%g2,	0x3DA,	%o1
	movleu	%xcc,	%g7,	%o5
	fbn,a	%fcc2,	loop_422
loop_421:
	sll	%l5,	0x07,	%o4
	array16	%i4,	%g3,	%i3
	nop 	! 	taddcc	%g4,	0x0AAB,	%g6 changed by convert2hboot
loop_422:
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	fmovrslez	%o0,	%f27,	%f10
	fxnor	%f4,	%f12,	%f30
	sdivcc	%i0,	0x0F35,	%o6
	movrlez	%i6,	%l6,	%l2
	movcc	%xcc,	%l4,	%g5
	fmovdge	%xcc,	%f27,	%f16
	andncc	%l3,	%o2,	%i1
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	fpadd16s	%f0,	%f10,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f6,	%f4,	%f6
	stw	%o7,	[%l7 + 0x20]
	edge8n	%l1,	%i7,	%l0
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	fnands	%f9,	%f2,	%f21
	edge8ln	%o3,	%i5,	%g1
	fmovdne	%icc,	%f12,	%f12
	fcmpgt32	%f4,	%f18,	%i2
	subcc	%g2,	%g7,	%o5
	movrgz	%l5,	0x1D4,	%o4
	fcmped	%fcc0,	%f8,	%f0
	set	0x54, %o5
	lda	[%l7 + %o5] 0x15,	%f23
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	wr	%g0,	0x04,	%asi
	sta	%f8,	[%l7 + 0x48] %asi
	popc	%i4,	%o1
	orcc	%i3,	0x005B,	%g3
	subccc	%g4,	%o0,	%g6
	array8	%i0,	%i6,	%o6
	edge16	%l6,	%l2,	%g5
	fpack32	%f10,	%f0,	%f2
	srl	%l4,	%l3,	%o2
	fpsub16s	%f3,	%f1,	%f30
	brgez,a	%o7,	loop_423
	fornot2	%f10,	%f28,	%f22
	umul	%l1,	%i7,	%l0
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
loop_423:
	movne	%xcc,	%i1,	%o3
	wr	%g0,	0xe3,	%asi
	membar	#Sync
	srlx	%i2,	0x15,	%g2
	udivcc	%g7,	0x1E65,	%g1
	and	%l5,	0x1654,	%o5
	nop 	! 	tsubcctv	%o4,	0x00FC,	%o1 changed by convert2hboot
	bn,a,pn	%icc,	loop_424
	subccc	%i4,	%i3,	%g3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
loop_424:
	fbue,a	%fcc3,	loop_425
	alignaddrl	%i0,	%i6,	%g6
	sdiv	%o6,	0x1E99,	%l2
	edge16ln	%g5,	%l6,	%l3
loop_425:
	bne,pt	%icc,	loop_426
	sllx	%l4,	%o7,	%o2
	fcmped	%fcc2,	%f26,	%f24
	fmovdneg	%xcc,	%f8,	%f28
loop_426:
	be,a	%icc,	loop_427
	and	%i7,	%l1,	%l0
	bg,a,pn	%xcc,	loop_428
	ld	[%l7 + 0x1C],	%f9
loop_427:
	prefetch	[%l7 + 0x48],	 0x3
	movl	%icc,	%i1,	%i5
loop_428:
	std	%o2,	[%l7 + 0x38]
	bneg,pn	%icc,	loop_429
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
	lduw	[%l7 + 0x2C],	%g2
	xnor	%i2,	%g7,	%g1
loop_429:
	ldd	[%l7 + 0x60],	%l4
	edge16l	%o5,	%o1,	%o4
	umul	%i4,	%g3,	%g4
	sdivcc	%i3,	0x1721,	%i0
	edge8ln	%i6,	%g6,	%o6
	addcc	%l2,	0x1031,	%g5
	set	0x78, %o1
	nop	 ! 	prefetcha	[%l7 + %o1] 0x18,	 0x1 ASI use replaced by convert2hboot
	xnor	%l3,	%l4,	%o7
	fnot2	%f14,	%f0
	fpackfix	%f0,	%f6
	edge16	%o0,	%o2,	%l1
	fbuge	%fcc2,	loop_430
	smulcc	%i7,	0x0F10,	%i1
	alignaddr	%i5,	%l0,	%g2
	wr	%g0,	0x04,	%asi
loop_430:
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
	fnegd	%f8,	%f22
	bg,a	%icc,	loop_431
	or	%i2,	%g1,	%g7
	wr	%g0,	0x58,	%asi
loop_431:
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	edge32l	%o1,	%o4,	%l5
	flush	%l7 + 0x2C
	mulscc	%g3,	%g4,	%i4
	bg,a	loop_432
	fzeros	%f21
	srlx	%i3,	%i0,	%i6
	wr	%g0,	0x80,	%asi
loop_432:
	sdivx	%g6,	0x13AE,	%o6
	brlez	%g5,	loop_433
	addc	%l2,	0x1EBD,	%l6
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
loop_433:
	fpadd32s	%f9,	%f6,	%f19
	fpmerge	%f1,	%f7,	%f22
	st	%f20,	[%l7 + 0x0C]
	xor	%l3,	0x09C7,	%l4
	movrgz	%o7,	0x0D5,	%o2
	fmovrdne	%o0,	%f14,	%f8
	movg	%icc,	%l1,	%i1
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
	orncc	%i7,	%i5,	%l0
	mulscc	%g2,	%o3,	%g1
	movle	%xcc,	%g7,	%i2
	sub	%o5,	0x1FDE,	%o4
	fpadd32	%f10,	%f4,	%f0
	nop 	! 	tle	%icc,	0x3 changed by convert2hboot
	movcc	%icc,	%l5,	%g3
	fmovdleu	%xcc,	%f2,	%f18
	stx	%o1,	[%l7 + 0x38]
	fornot1	%f10,	%f18,	%f14
	nop 	! 	taddcc	%g4,	0x1EE3,	%i3 changed by convert2hboot
	fand	%f18,	%f10,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i0,	%i6,	%g6
	fbo,a	%fcc0,	loop_434
	movvs	%xcc,	%o6,	%i4
	be,pt	%icc,	loop_435
	nop 	! 	tpos	%xcc,	0x6 changed by convert2hboot
loop_434:
	srl	%g5,	0x00,	%l2
	movpos	%icc,	%l6,	%l3
loop_435:
	nop
	setx loop_436, %l0, %l1
	jmpl %l1, %l4
	fpadd32	%f20,	%f0,	%f22
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x50] %asi,	%f25
loop_436:
	fcmpne32	%f24,	%f20,	%o2
	bvc,a	loop_437
	andncc	%o7,	%l1,	%i1
	and	%i7,	%o0,	%i5
	wr	%g0,	0x81,	%asi
loop_437:
	movl	%xcc,	%l0,	%o3
	array16	%g7,	%i2,	%o5
	sra	%g1,	0x17,	%o4
	set	0x54, %g6
	sta	%f3,	[%l7 + %g6] 0x18
	array8	%g3,	%l5,	%g4
	fcmpd	%fcc0,	%f22,	%f28
	fxnor	%f28,	%f16,	%f24
	fbue	%fcc0,	loop_438
	nop 	! 	taddcctv	%o1,	%i3,	%i0 changed by convert2hboot
	fbg	%fcc1,	loop_439
	fsrc2	%f16,	%f30
loop_438:
	xor	%i6,	%g6,	%i4
	fmuld8ulx16	%f17,	%f5,	%f4
loop_439:
	alignaddrl	%g5,	%l2,	%l6
	nop 	! 	tsubcc	%l3,	%o6,	%l4 changed by convert2hboot
	andncc	%o2,	%l1,	%i1
	movcc	%icc,	%i7,	%o7
	movrlz	%i5,	%o0,	%g2
	sth	%o3,	[%l7 + 0x7E]
	fcmpd	%fcc1,	%f26,	%f0
	bshuffle	%f16,	%f20,	%f30
	popc	0x1992,	%g7
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	move	%icc,	%l0,	%o5
	wr	%g0,	0xea,	%asi
	membar	#Sync
	edge8n	%o4,	%i2,	%l5
	alignaddrl	%g4,	%g3,	%i3
	nop 	! 	tvc	%xcc,	0x7 changed by convert2hboot
	brlez,a	%i0,	loop_440
	fba	%fcc2,	loop_441
	movl	%icc,	%i6,	%o1
	std	%f20,	[%l7 + 0x48]
loop_440:
	fmul8ulx16	%f4,	%f8,	%f14
loop_441:
	fba	%fcc1,	loop_442
	nop 	! 	tsubcctv	%g6,	%g5,	%i4 changed by convert2hboot
	ldd	[%l7 + 0x28],	%f10
	fpsub32	%f16,	%f26,	%f26
loop_442:
	bpos,a,pn	%xcc,	loop_443
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	mova	%xcc,	%l2,	%l3
	wr	%g0,	0xeb,	%asi
	membar	#Sync
loop_443:
	andcc	%o6,	0x04B9,	%l4
	sdivx	%o2,	0x06CA,	%l1
	fpack32	%f6,	%f16,	%f0
	edge16ln	%i7,	%i1,	%i5
	fbo	%fcc3,	loop_444
	bleu,a	%xcc,	loop_445
	or	%o0,	%g2,	%o7
	movvc	%icc,	%o3,	%l0
loop_444:
	fmovsvc	%icc,	%f8,	%f3
loop_445:
	fbug	%fcc0,	loop_446
	nop 	! 	tsubcc	%g7,	%g1,	%o4 changed by convert2hboot
	sdiv	%o5,	0x03C8,	%l5
	sllx	%g4,	0x0A,	%g3
loop_446:
	movvc	%icc,	%i2,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%xcc,	%f1,	%f25
	or	%i3,	%i6,	%o1
	fble,a	%fcc2,	loop_447
	addccc	%g6,	0x13DF,	%i4
	bl	loop_448
	movneg	%xcc,	%l2,	%g5
loop_447:
	edge8n	%l6,	%l3,	%l4
	udiv	%o6,	0x0EC1,	%o2
loop_448:
	fandnot1s	%f19,	%f14,	%f9
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	bcc,a,pt	%xcc,	loop_449
	xnor	%i7,	0x00D4,	%i1
	array32	%i5,	%l1,	%g2
	brlz	%o0,	loop_450
loop_449:
	ldsb	[%l7 + 0x71],	%o3
	bne,a,pt	%xcc,	loop_451
	subccc	%o7,	0x0398,	%g7
loop_450:
	membar	0x5E
	set	0x41, %l5
	nop	 ! 	lduba	[%l7 + %l5] 0x88,	%g1 ASI use replaced by convert2hboot
loop_451:
	bneg,a,pt	%xcc,	loop_452
	xor	%o4,	%o5,	%l5
	ble,pt	%xcc,	loop_453
	mova	%xcc,	%g4,	%g3
loop_452:
	swap	[%l7 + 0x78],	%l0
	bcc,a	loop_454
loop_453:
	ldd	[%l7 + 0x18],	%i2
	fmovdn	%icc,	%f18,	%f10
	fmovrse	%i0,	%f7,	%f10
loop_454:
	alignaddrl	%i3,	%o1,	%g6
	add	%i4,	%i6,	%l2
	call	loop_455
	fpackfix	%f10,	%f4
	sdivx	%l6,	0x1B99,	%l3
	fbu,a	%fcc2,	loop_456
loop_455:
	edge8l	%l4,	%o6,	%g5
	move	%icc,	%o2,	%i7
	fmovrdne	%i1,	%f14,	%f6
loop_456:
	nop 	! 	taddcc	%i5,	%g2,	%l1 changed by convert2hboot
	fmovs	%f17,	%f11
	fabsd	%f28,	%f2
	fpsub16	%f4,	%f26,	%f0
	movge	%icc,	%o3,	%o0
	bvs,pn	%xcc,	loop_457
	movpos	%xcc,	%o7,	%g1
	ldstub	[%l7 + 0x70],	%g7
	mova	%icc,	%o5,	%l5
loop_457:
	sll	%o4,	%g3,	%l0
	wr	%g0,	0x19,	%asi
	fmovdn	%xcc,	%f25,	%f28
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	nop	 ! 	casxa	[%l6] 0x81,	%i2,	%i3 ASI use replaced by convert2hboot
	mulscc	%o1,	0x06B3,	%g6
	movvc	%xcc,	%i4,	%i6
	fpadd16s	%f9,	%f15,	%f19
	edge32l	%i0,	%l2,	%l6
	be	loop_458
	movre	%l4,	0x3DE,	%o6
	sdiv	%l3,	0x193E,	%g5
	wr	%g0,	0x89,	%asi
loop_458:
	edge16	%i1,	%i7,	%i5
	movneg	%icc,	%l1,	%o3
	subc	%g2,	%o0,	%g1
	nop
	set	0x20, %i4
	std	%f18,	[%l7 + %i4]
	or	%g7,	0x062B,	%o5
	edge8	%l5,	%o4,	%o7
	edge8ln	%l0,	%g3,	%g4
	fcmpgt16	%f2,	%f22,	%i2
	or	%i3,	0x0AB0,	%o1
	fmovdgu	%icc,	%f27,	%f26
	nop
	setx	loop_459,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movrlez	%i4,	%i6,	%i0
	srax	%g6,	%l6,	%l2
	smulcc	%o6,	0x15B9,	%l3
loop_459:
	sll	%l4,	0x1D,	%o2
	fandnot2	%f14,	%f20,	%f20
	fand	%f16,	%f8,	%f28
	nop
	setx loop_460, %l0, %l1
	jmpl %l1, %i1
	udivx	%g5,	0x1B12,	%i5
	movrlez	%l1,	%o3,	%g2
	bge,a,pn	%xcc,	loop_461
loop_460:
	orn	%i7,	%o0,	%g7
	fmovdvc	%xcc,	%f23,	%f12
	set	0x18, %o2
	nop	 ! 	lduha	[%l7 + %o2] 0x18,	%o5 ASI use replaced by convert2hboot
loop_461:
	orcc	%g1,	%l5,	%o7
	ldub	[%l7 + 0x1F],	%l0
	bneg	%xcc,	loop_462
	movne	%xcc,	%g3,	%o4
	or	%g4,	%i2,	%i3
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
loop_462:
	fnors	%f30,	%f3,	%f5
	xnor	%o1,	%i6,	%i0
	movcs	%xcc,	%i4,	%l6
	movcc	%icc,	%g6,	%o6
	movneg	%icc,	%l2,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%o2,	%i1
	movcc	%icc,	%g5,	%i5
	mova	%xcc,	%l1,	%o3
	flush	%l7 + 0x2C
	edge32ln	%g2,	%i7,	%o0
	array16	%l3,	%o5,	%g7
	movrgz	%g1,	%o7,	%l5
	edge8n	%g3,	%o4,	%g4
	andncc	%i2,	%i3,	%l0
	orcc	%o1,	0x08AE,	%i6
	for	%f24,	%f6,	%f14
	fbule,a	%fcc3,	loop_463
	smulcc	%i4,	0x139E,	%i0
	edge32ln	%g6,	%l6,	%l2
	fcmpes	%fcc0,	%f10,	%f30
loop_463:
	alignaddr	%l4,	%o6,	%i1
	subcc	%o2,	0x1299,	%i5
	fsrc2s	%f7,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f12,	%f14,	%g5
	wr	%g0,	0x80,	%asi
	sta	%f7,	[%l7 + 0x08] %asi
	be,a	loop_464
	fcmpes	%fcc0,	%f19,	%f31
	ldx	[%l7 + 0x18],	%o3
	fmul8x16	%f5,	%f12,	%f28
loop_464:
	movpos	%xcc,	%l1,	%g2
	movne	%xcc,	%o0,	%l3
	fpackfix	%f2,	%f3
	movcs	%icc,	%i7,	%g7
	movcs	%icc,	%g1,	%o5
	movgu	%icc,	%l5,	%o7
	lduh	[%l7 + 0x5C],	%g3
	fandnot2	%f28,	%f8,	%f26
	fmovdvs	%xcc,	%f26,	%f13
	brnz	%o4,	loop_465
	fcmpne32	%f0,	%f10,	%g4
	fornot2s	%f5,	%f1,	%f11
	alignaddr	%i3,	%i2,	%l0
loop_465:
	fsrc1	%f30,	%f8
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	smul	%o1,	0x05E1,	%i4
	ldx	[%l7 + 0x40],	%i0
	nop 	! 	tvs	%icc,	0x6 changed by convert2hboot
	movcs	%icc,	%i6,	%l6
	sll	%l2,	0x11,	%g6
	sdivcc	%o6,	0x1A7A,	%l4
	mulx	%o2,	%i1,	%i5
	smulcc	%g5,	0x04BE,	%l1
	fbu	%fcc0,	loop_466
	edge32	%g2,	%o3,	%o0
	edge32n	%l3,	%i7,	%g1
	fxors	%f21,	%f9,	%f9
loop_466:
	nop
	wr	%g0,	0x89,	%asi
	fnegd	%f16,	%f20
	edge16ln	%g7,	%o7,	%g3
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	sdivx	%l5,	0x1071,	%o4
	fmovdg	%icc,	%f11,	%f8
	andcc	%g4,	%i2,	%i3
	array16	%o1,	%l0,	%i4
	movrne	%i6,	%l6,	%i0
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
	fmovsle	%icc,	%f12,	%f18
	orcc	%g6,	0x1A6E,	%o6
	fmovscc	%icc,	%f7,	%f4
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	movge	%icc,	%l4,	%l2
	fbn,a	%fcc2,	loop_467
	ld	[%l7 + 0x18],	%f9
	wr	%g0,	0x80,	%asi
loop_467:
	edge8ln	%o2,	%i5,	%g5
	sdivx	%l1,	0x07EC,	%g2
	lduh	[%l7 + 0x36],	%o0
	addccc	%l3,	%i7,	%o3
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	ba	loop_468
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
	movl	%icc,	%g1,	%g7
	movneg	%xcc,	%o5,	%g3
loop_468:
	fsrc2s	%f3,	%f9
	smul	%o7,	0x1171,	%o4
	nop 	! 	tcs	%icc,	0x4 changed by convert2hboot
	fmovrdlz	%g4,	%f0,	%f28
	sll	%i2,	%i3,	%o1
	nop 	! 	tsubcc	%l5,	%i4,	%l0 changed by convert2hboot
	edge8ln	%i6,	%i0,	%g6
	array32	%l6,	%o6,	%l2
	edge8	%l4,	%o2,	%i5
	fabsd	%f8,	%f10
	nop 	! 	ta	%xcc,	0x1 changed by convert2hboot
	fmovspos	%icc,	%f22,	%f15
	edge8	%i1,	%l1,	%g5
	movn	%icc,	%o0,	%g2
	fabsd	%f8,	%f4
	fnors	%f28,	%f9,	%f27
	fpsub32	%f0,	%f14,	%f26
	bg,pt	%xcc,	loop_469
	xor	%i7,	0x11AD,	%l3
	fnand	%f26,	%f28,	%f18
	fcmpes	%fcc1,	%f25,	%f16
loop_469:
	movvc	%icc,	%o3,	%g7
	andn	%o5,	%g3,	%g1
	xorcc	%o4,	0x172D,	%o7
	udiv	%i2,	0x0B7B,	%i3
	subc	%g4,	%o1,	%i4
	fmul8x16au	%f25,	%f24,	%f18
	movrne	%l0,	0x1CB,	%i6
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	fmovd	%f30,	%f10
	smul	%l5,	0x10BB,	%i0
	srl	%g6,	%l6,	%l2
	fxnor	%f8,	%f12,	%f14
	fmovsvs	%icc,	%f13,	%f27
	fornot1	%f22,	%f6,	%f0
	wr	%g0,	0x89,	%asi
	movneg	%icc,	%o2,	%o6
	prefetch	[%l7 + 0x50],	 0x3
	fsrc1s	%f25,	%f3
	add	%i1,	0x1AE8,	%i5
	fcmple32	%f12,	%f2,	%l1
	fcmpeq16	%f4,	%f14,	%g5
	fands	%f25,	%f17,	%f8
	fnand	%f4,	%f24,	%f0
	fcmpeq16	%f14,	%f6,	%o0
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
	movrlz	%g2,	0x025,	%i7
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	fpadd32	%f14,	%f20,	%f6
	ldd	[%l7 + 0x28],	%o2
	movne	%icc,	%g7,	%l3
	stx	%g3,	[%l7 + 0x48]
	edge32ln	%g1,	%o4,	%o7
	nop 	! 	tcs	%xcc,	0x4 changed by convert2hboot
	fnegd	%f12,	%f18
	bcc,a,pt	%icc,	loop_470
	andcc	%i2,	%i3,	%g4
	xnorcc	%o1,	%o5,	%l0
	set	0x26, %i7
	nop	 ! 	lduha	[%l7 + %i7] 0x81,	%i4 ASI use replaced by convert2hboot
loop_470:
	nop
	wr	%g0,	0x19,	%asi
	fmovdn	%xcc,	%f0,	%f5
	orn	%i0,	0x069E,	%g6
	srl	%l6,	0x1B,	%l2
	sethi	0x1B91,	%i6
	srax	%l4,	0x19,	%o2
	fbo,a	%fcc1,	loop_471
	edge8ln	%o6,	%i5,	%i1
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	movge	%xcc,	%l1,	%o0
loop_471:
	movrgez	%g2,	%i7,	%g5
	orcc	%o3,	0x1DB0,	%l3
	srax	%g7,	0x0A,	%g1
	movvs	%icc,	%g3,	%o4
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	srax	%o7,	%i3,	%i2
	andcc	%g4,	0x0C59,	%o1
	fmovdcs	%xcc,	%f3,	%f29
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%o5,	%i4
	movneg	%icc,	%l5,	%i0
	prefetch	[%l7 + 0x7C],	 0x2
	addcc	%g6,	0x0594,	%l0
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	bn,a	loop_472
	alignaddr	%l6,	%l2,	%l4
	edge16	%i6,	%o2,	%i5
	mulx	%i1,	%o6,	%o0
loop_472:
	addc	%l1,	0x1A64,	%g2
	bpos,pt	%icc,	loop_473
	bgu,pt	%xcc,	loop_474
	fmul8x16au	%f1,	%f21,	%f16
	movvs	%xcc,	%i7,	%o3
loop_473:
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
loop_474:
	sdivcc	%l3,	0x1E19,	%g5
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	fbuge	%fcc2,	loop_475
	movvc	%icc,	%g1,	%g3
	edge16	%o4,	%o7,	%i3
loop_475:
	mova	%xcc,	%i2,	%g7
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	bpos	loop_476
	udivx	%o1,	0x0E5A,	%o5
	fbg	%fcc0,	loop_477
	udivcc	%i4,	0x1427,	%l5
loop_476:
	sdivx	%i0,	0x00FF,	%g6
	movne	%xcc,	%l0,	%g4
loop_477:
	edge16l	%l6,	%l4,	%i6
	fcmpeq32	%f22,	%f24,	%l2
	array8	%i5,	%o2,	%o6
	call	loop_478
	sllx	%i1,	%l1,	%g2
	fsrc2	%f16,	%f18
	fbue,a	%fcc2,	loop_479
loop_478:
	fcmpgt16	%f10,	%f4,	%i7
	fcmpne16	%f18,	%f0,	%o3
	set	0x3C, %i6
	nop	 ! 	stwa	%l3,	[%l7 + %i6] 0x81 ASI use replaced by convert2hboot
loop_479:
	fbn	%fcc2,	loop_480
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	xnorcc	%o0,	0x0D55,	%g5
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
loop_480:
	fmovdcc	%xcc,	%f25,	%f9
	movrlz	%g3,	0x061,	%g1
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	ldstub	[%l7 + 0x3F],	%o7
	movrne	%o4,	%i2,	%g7
	edge16l	%o1,	%i3,	%i4
	wr	%g0,	0x04,	%asi
	flush	%l7 + 0x34
	mova	%xcc,	%i0,	%o5
	set	0x30, %i0
	lda	[%l7 + %i0] 0x81,	%f28
	movre	%g6,	0x00D,	%g4
	and	%l0,	0x180C,	%l6
	movl	%icc,	%i6,	%l4
	fmovsn	%xcc,	%f15,	%f20
	prefetch	[%l7 + 0x30],	 0x2
	sdivx	%l2,	0x1E7B,	%i5
	nop 	! 	tgu	%xcc,	0x5 changed by convert2hboot
	fmovse	%icc,	%f26,	%f15
	fpmerge	%f1,	%f2,	%f22
	fmovrdlz	%o6,	%f16,	%f20
	stb	%o2,	[%l7 + 0x5C]
	fmovdg	%xcc,	%f3,	%f11
	sdivx	%i1,	0x1EBC,	%g2
	andn	%i7,	0x138D,	%l1
	be,a	%xcc,	loop_481
	edge16n	%l3,	%o0,	%o3
	movle	%icc,	%g3,	%g1
	edge16l	%o7,	%o4,	%g5
loop_481:
	udiv	%i2,	0x154A,	%g7
	fmovdcs	%xcc,	%f9,	%f15
	fbg	%fcc0,	loop_482
	nop
	setx	loop_483,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	orn	%i3,	0x1D0C,	%o1
	nop 	! 	tne	%xcc,	0x3 changed by convert2hboot
loop_482:
	prefetch	[%l7 + 0x54],	 0x2
loop_483:
	andn	%l5,	0x14F6,	%i4
	fbug	%fcc2,	loop_484
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	fcmpgt16	%f12,	%f4,	%o5
	array16	%g6,	%i0,	%l0
loop_484:
	std	%f26,	[%l7 + 0x60]
	array16	%g4,	%i6,	%l6
	nop 	! 	tsubcctv	%l2,	%i5,	%o6 changed by convert2hboot
	array16	%o2,	%i1,	%g2
	fpsub32s	%f15,	%f7,	%f13
	fmovsgu	%xcc,	%f3,	%f1
	set	0x40, %o3
	nop	 ! 	stda	%f16,	[%l7 + %o3] 0x1e ASI use replaced by convert2hboot
	membar	#Sync
	ldsw	[%l7 + 0x10],	%l4
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	nop 	! 	taddcctv	%i7,	%l1,	%l3 changed by convert2hboot
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
	mova	%xcc,	%o3,	%g3
	movneg	%icc,	%g1,	%o0
	fmovdcc	%icc,	%f14,	%f13
	set	0x0, %i1
	nop	 ! 	stxa	%o7,	[%g0 + %i1] 0x57 ASI use replaced by convert2hboot
	fpadd32s	%f10,	%f6,	%f24
	sub	%g5,	%o4,	%g7
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
	movrgez	%i3,	%o1,	%l5
	nop 	! 	taddcctv	%i4,	0x1C5D,	%i2 changed by convert2hboot
	nop 	! 	tsubcc	%o5,	%g6,	%l0 changed by convert2hboot
	bg	%icc,	loop_485
	sdiv	%i0,	0x01E2,	%i6
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	bneg	%icc,	loop_486
loop_485:
	bvs,a	loop_487
	fnand	%f16,	%f20,	%f14
	xnor	%l6,	0x18B5,	%g4
loop_486:
	fbul	%fcc1,	loop_488
loop_487:
	bvc,a,pt	%xcc,	loop_489
	nop 	! 	tsubcc	%i5,	0x1752,	%o6 changed by convert2hboot
	fsrc1	%f4,	%f24
loop_488:
	fornot1s	%f9,	%f12,	%f28
loop_489:
	edge16n	%l2,	%o2,	%i1
	movvc	%icc,	%l4,	%g2
	sdivcc	%l1,	0x1816,	%i7
	udivx	%l3,	0x08BD,	%g3
	mova	%icc,	%o3,	%g1
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	fnot1	%f2,	%f16
	brgez	%o0,	loop_490
	srax	%g5,	%o7,	%g7
	fmovdcc	%xcc,	%f0,	%f7
	fbe,a	%fcc3,	loop_491
loop_490:
	fandnot1	%f10,	%f16,	%f22
	movleu	%xcc,	%i3,	%o4
	be	%xcc,	loop_492
loop_491:
	fmovsge	%icc,	%f25,	%f27
	umul	%o1,	%l5,	%i4
	be,a,pt	%icc,	loop_493
loop_492:
	movgu	%xcc,	%i2,	%g6
	fcmps	%fcc2,	%f26,	%f25
	fmovrsgez	%o5,	%f16,	%f23
loop_493:
	edge32n	%l0,	%i6,	%i0
	fmovsne	%icc,	%f22,	%f16
	fexpand	%f9,	%f14
	fornot2	%f10,	%f24,	%f2
	ba,pt	%xcc,	loop_494
	bne	%xcc,	loop_495
	ba,pn	%xcc,	loop_496
	edge8l	%g4,	%l6,	%i5
loop_494:
	fpsub16s	%f21,	%f27,	%f12
loop_495:
	srlx	%o6,	%o2,	%i1
loop_496:
	fmovrdlez	%l4,	%f28,	%f30
	edge32ln	%g2,	%l2,	%i7
	movrne	%l1,	0x2A3,	%l3
	mulx	%g3,	%g1,	%o0
	edge16n	%o3,	%o7,	%g5
	wr	%g0,	0x23,	%asi
	membar	#Sync
	udiv	%o4,	0x0193,	%o1
	stw	%l5,	[%l7 + 0x38]
	fpadd16	%f14,	%f24,	%f4
	fmovs	%f12,	%f12
	movgu	%xcc,	%i4,	%i3
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	edge16ln	%g6,	%o5,	%i2
	nop 	! 	ta	%icc,	0x2 changed by convert2hboot
	subcc	%i6,	0x1508,	%i0
	fmovrsgz	%g4,	%f20,	%f22
	wr	%g0,	0x81,	%asi
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	fmovspos	%xcc,	%f16,	%f0
	edge8n	%i5,	%o6,	%l6
	mulx	%o2,	0x196C,	%l4
	fmovsn	%icc,	%f31,	%f11
	fmuld8ulx16	%f18,	%f31,	%f0
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	edge8ln	%i1,	%l2,	%i7
	fba,a	%fcc0,	loop_497
	fpadd32	%f6,	%f6,	%f16
	movne	%xcc,	%g2,	%l1
	set	0x78, %o4
	nop	 ! 	stxa	%g3,	[%l7 + %o4] 0xe3 ASI use replaced by convert2hboot
	membar	#Sync
loop_497:
	popc	%l3,	%o0
	set	0x30, %l4
	nop	 ! 	ldda	[%l7 + %l4] 0xea,	%o2 ASI use replaced by convert2hboot
	andn	%g1,	0x1F9A,	%o7
	xorcc	%g5,	%g7,	%o4
	lduw	[%l7 + 0x34],	%o1
	nop 	! 	tl	%icc,	0x1 changed by convert2hboot
	brgz,a	%i4,	loop_498
	movn	%icc,	%i3,	%l5
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	nop 	! 	tsubcc	%g6,	0x05B4,	%i2 changed by convert2hboot
loop_498:
	nop
	set	0x3A, %i5
	nop	 ! 	ldsha	[%l7 + %i5] 0x81,	%o5 ASI use replaced by convert2hboot
	udivcc	%i6,	0x041D,	%g4
	bneg,a	%xcc,	loop_499
	fbge	%fcc1,	loop_500
	sra	%l0,	0x03,	%i5
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
loop_499:
	array16	%i0,	%o6,	%l6
loop_500:
	fxnor	%f26,	%f20,	%f14
	movrgez	%l4,	0x210,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l2,	0x0E80,	%i7
	movge	%icc,	%g2,	%l1
	bne,a	%xcc,	loop_501
	fmovsg	%icc,	%f16,	%f18
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%f30
	umulcc	%o2,	0x0C08,	%l3
loop_501:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g3
	fmuld8sux16	%f13,	%f1,	%f20
	fmovrsne	%g1,	%f2,	%f2
	subc	%o7,	%g5,	%g7
	fmovscs	%xcc,	%f28,	%f22
	xnor	%o4,	%o1,	%i4
	fbuge,a	%fcc2,	loop_502
	fmovdle	%xcc,	%f28,	%f0
	brgz	%i3,	loop_503
	bneg,a	%xcc,	loop_504
loop_502:
	fbug,a	%fcc0,	loop_505
	movl	%icc,	%o3,	%l5
loop_503:
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
loop_504:
	edge32ln	%i2,	%g6,	%i6
loop_505:
	movpos	%xcc,	%o5,	%g4
	fcmpne32	%f18,	%f2,	%l0
	movgu	%icc,	%i5,	%i0
	nop 	! 	sir	0x1149 changed by convert2hboot
	fble,a	%fcc0,	loop_506
	brlez	%o6,	loop_507
	std	%l4,	[%l7 + 0x70]
	nop 	! 	tpos	%icc,	0x6 changed by convert2hboot
loop_506:
	movpos	%xcc,	%i1,	%l2
loop_507:
	nop
	wr	%g0,	0x81,	%asi
	nop 	! 	taddcc	%l6,	0x18D6,	%l1 changed by convert2hboot
	fnegd	%f14,	%f20
	mulx	%g2,	%o2,	%g3
	bgu	loop_508
	or	%o0,	0x16AE,	%l3
	fcmpgt16	%f28,	%f26,	%g1
	fbug	%fcc2,	loop_509
loop_508:
	brlez,a	%g5,	loop_510
	fnot1s	%f0,	%f3
	subcc	%o7,	0x123C,	%o4
loop_509:
	srax	%o1,	0x14,	%g7
loop_510:
	ld	[%l7 + 0x38],	%f6
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	xorcc	%i4,	0x1336,	%i3
	popc	%l5,	%o3
	fmul8x16al	%f7,	%f15,	%f8
	sdivx	%g6,	0x0738,	%i2
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	fmovrdlz	%i6,	%f26,	%f26
	movpos	%xcc,	%g4,	%o5
	edge16l	%i5,	%l0,	%o6
	bpos,a,pt	%xcc,	loop_511
	sll	%l4,	0x1B,	%i0
	udiv	%i1,	0x196C,	%i7
	fcmpne16	%f14,	%f2,	%l6
loop_511:
	fmovsn	%icc,	%f30,	%f23
	orcc	%l2,	0x09A5,	%g2
	srlx	%l1,	%o2,	%g3
	fmuld8sux16	%f14,	%f29,	%f12
	fmovsn	%xcc,	%f10,	%f5
	nop 	! 	tne	%xcc,	0x5 changed by convert2hboot
	smulcc	%o0,	0x0777,	%g1
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	stb	%l3,	[%l7 + 0x36]
	move	%icc,	%o7,	%o4
	std	%f26,	[%l7 + 0x68]
	movvs	%xcc,	%o1,	%g5
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	movre	%g7,	0x125,	%i3
	fmovrsgz	%i4,	%f0,	%f23
	srl	%o3,	%g6,	%l5
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	fmovdl	%icc,	%f25,	%f25
	fnand	%f16,	%f12,	%f14
	fmovse	%xcc,	%f6,	%f28
	nop 	! 	tsubcc	%i2,	%i6,	%o5 changed by convert2hboot
	srl	%i5,	0x14,	%l0
	udivx	%g4,	0x0A7D,	%l4
	fbue,a	%fcc3,	loop_512
	brlz,a	%o6,	loop_513
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i0,	%i1,	%i7
loop_512:
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
loop_513:
	fbe	%fcc0,	loop_514
	ldd	[%l7 + 0x40],	%i6
	fnot2	%f24,	%f30
	ldsb	[%l7 + 0x0C],	%l2
loop_514:
	ldd	[%l7 + 0x48],	%f18
	fxnors	%f31,	%f30,	%f17
	fnand	%f4,	%f20,	%f6
	subc	%g2,	%l1,	%o2
	brgz,a	%o0,	loop_515
	bpos,a	%xcc,	loop_516
	fmul8x16	%f20,	%f30,	%f6
	movgu	%xcc,	%g1,	%l3
loop_515:
	fpsub32s	%f2,	%f9,	%f29
loop_516:
	fpackfix	%f24,	%f11
	sll	%o7,	%o4,	%g3
	fsrc2	%f28,	%f6
	bvc,pt	%icc,	loop_517
	bpos,a	%xcc,	loop_518
	movvc	%icc,	%g5,	%o1
	xor	%i3,	0x0085,	%i4
loop_517:
	edge8	%o3,	%g7,	%g6
loop_518:
	movcc	%xcc,	%l5,	%i6
	fabsd	%f16,	%f14
	movgu	%icc,	%i2,	%o5
	nop 	! 	tl	%xcc,	0x2 changed by convert2hboot
	fandnot1	%f24,	%f10,	%f14
	st	%f1,	[%l7 + 0x1C]
	nop
	setx	loop_519,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	subccc	%i5,	%g4,	%l0
	mulscc	%o6,	0x1DF6,	%l4
	wr	%g0,	0x18,	%asi
loop_519:
	stw	%i1,	[%l7 + 0x44]
	movneg	%xcc,	%i7,	%l2
	xnorcc	%g2,	%l1,	%o2
	nop
	setx	loop_520,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	edge16n	%o0,	%l6,	%g1
	fmovrslez	%l3,	%f27,	%f11
	mova	%icc,	%o4,	%o7
loop_520:
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	fmovrdlz	%g5,	%f10,	%f30
	edge32l	%g3,	%i3,	%i4
	srlx	%o3,	%o1,	%g7
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	movvc	%xcc,	%g6,	%i6
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	nop	 ! 	casxa	[%l6] 0x04,	%l5,	%i2 ASI use replaced by convert2hboot
	fxnor	%f14,	%f14,	%f10
	fmul8x16al	%f30,	%f4,	%f10
	bneg,pt	%xcc,	loop_521
	movle	%icc,	%i5,	%g4
	fmovrsne	%l0,	%f10,	%f24
	brnz,a	%o5,	loop_522
loop_521:
	array8	%l4,	%o6,	%i0
	popc	0x018E,	%i1
	movre	%i7,	0x1C2,	%l2
loop_522:
	nop
	setx	loop_523,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fnand	%f12,	%f30,	%f16
	bvc	%icc,	loop_524
loop_523:
	fxnors	%f3,	%f7,	%f21
	fpack16	%f18,	%f23
loop_524:
	movrgz	%l1,	0x295,	%o2
	fzeros	%f27
	edge32n	%o0,	%l6,	%g2
	fcmped	%fcc3,	%f16,	%f12
	fnot1s	%f15,	%f18
	sllx	%g1,	%o4,	%o7
	movcc	%icc,	%g5,	%l3
	andncc	%i3,	%i4,	%g3
	andncc	%o1,	%g7,	%o3
	sethi	0x1903,	%g6
	fbule	%fcc2,	loop_525
	edge32n	%i6,	%l5,	%i2
	movrlez	%g4,	%i5,	%o5
	edge32n	%l0,	%o6,	%l4
loop_525:
	ldsb	[%l7 + 0x3F],	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%i7,	%i1
	brlz	%l1,	loop_526
	edge16ln	%l2,	%o2,	%o0
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	fandnot1	%f28,	%f10,	%f14
loop_526:
	nop
	setx loop_527, %l0, %l1
	jmpl %l1, %g2
	flush	%l7 + 0x30
	movcc	%xcc,	%l6,	%o4
	subccc	%g1,	0x1185,	%g5
loop_527:
	movge	%icc,	%l3,	%i3
	nop 	! 	tsubcc	%o7,	0x060C,	%i4 changed by convert2hboot
	orn	%g3,	%g7,	%o3
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	fbuge	%fcc2,	loop_528
	fbne	%fcc1,	loop_529
	mulx	%o1,	%i6,	%l5
	bvc,pn	%xcc,	loop_530
loop_528:
	fpack32	%f22,	%f2,	%f2
loop_529:
	srlx	%g6,	0x00,	%g4
	call	loop_531
loop_530:
	fmovd	%f28,	%f28
	ldd	[%l7 + 0x48],	%i4
	wr	%g0,	0x2a,	%asi
	membar	#Sync
loop_531:
	movrlez	%o5,	0x0E8,	%o6
	fmovrslz	%l0,	%f5,	%f4
	mulscc	%l4,	0x07C4,	%i0
	brgz	%i1,	loop_532
	movrgz	%i7,	%l1,	%o2
	brz	%l2,	loop_533
	fbe	%fcc3,	loop_534
loop_532:
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
	stb	%o0,	[%l7 + 0x40]
loop_533:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
loop_534:
	fand	%f6,	%f26,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule	%fcc2,	loop_535
	fmovrsgez	%o4,	%f26,	%f20
	fnor	%f2,	%f16,	%f10
	membar	0x4A
loop_535:
	ldd	[%l7 + 0x28],	%f2
	nop 	! 	tle	%icc,	0x6 changed by convert2hboot
	edge8	%g1,	%g5,	%l3
	fsrc1s	%f6,	%f13
	movrlz	%o7,	0x3F5,	%i3
	orn	%g3,	%i4,	%g7
	fbe	%fcc2,	loop_536
	fcmpgt32	%f12,	%f12,	%o1
	lduw	[%l7 + 0x24],	%i6
	sub	%o3,	0x1F3A,	%l5
loop_536:
	movleu	%xcc,	%g4,	%i5
	wr	%g0,	0x04,	%asi
	movrlz	%g6,	0x092,	%o5
	nop
	set	0x08, %g5
	std	%f14,	[%l7 + %g5]
	movre	%l0,	0x24B,	%l4
	fandnot1s	%f24,	%f16,	%f5
	mulx	%i0,	0x1BC6,	%i1
	edge16n	%o6,	%l1,	%i7
	ldub	[%l7 + 0x21],	%o2
	edge16n	%o0,	%g2,	%l2
	orncc	%l6,	%o4,	%g1
	bl,a	%icc,	loop_537
	fbule	%fcc2,	loop_538
	fbule,a	%fcc0,	loop_539
	fmovdcc	%icc,	%f18,	%f16
loop_537:
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
loop_538:
	movrlez	%l3,	0x26D,	%o7
loop_539:
	movpos	%icc,	%i3,	%g3
	subcc	%i4,	0x1956,	%g5
	fxors	%f22,	%f19,	%f28
	movre	%o1,	%g7,	%i6
	add	%o3,	%l5,	%g4
	prefetch	[%l7 + 0x34],	 0x1
	fmovrdgez	%i5,	%f18,	%f16
	movrlz	%g6,	%i2,	%o5
	wr	%g0,	0x11,	%asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%i0,	%i1
	movne	%icc,	%o6,	%l0
	set	0x1D, %l1
	nop	 ! 	ldstuba	[%l7 + %l1] 0x89,	%i7 ASI use replaced by convert2hboot
	nop 	! 	sir	0x1910 changed by convert2hboot
	fnegd	%f24,	%f28
	umul	%o2,	%l1,	%g2
	edge16n	%l2,	%l6,	%o0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g1
	nop	 ! 	casa	[%l6] 0x10,	%g1,	%o4 ASI use replaced by convert2hboot
	udivx	%l3,	0x0D52,	%i3
	sllx	%o7,	0x1F,	%i4
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	sllx	%g5,	0x02,	%o1
	fbn	%fcc2,	loop_540
	edge16	%g7,	%g3,	%o3
	xnor	%l5,	%g4,	%i5
	bneg,a	%icc,	loop_541
loop_540:
	movcs	%icc,	%g6,	%i6
	orcc	%i2,	%o5,	%i0
	ldx	[%l7 + 0x08],	%i1
loop_541:
	ble	loop_542
	movg	%xcc,	%l4,	%o6
	orn	%i7,	0x18EF,	%l0
	movre	%o2,	0x1E1,	%g2
loop_542:
	movrgez	%l1,	%l2,	%o0
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	fmovsge	%xcc,	%f15,	%f25
	alignaddrl	%l6,	%g1,	%l3
	fmovrdgz	%i3,	%f2,	%f0
	fmovrdgz	%o4,	%f10,	%f14
	fbge	%fcc1,	loop_543
	fpack32	%f0,	%f20,	%f4
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
	movrgez	%i4,	0x2E8,	%o7
loop_543:
	swap	[%l7 + 0x6C],	%o1
	andcc	%g5,	0x11E1,	%g7
	and	%g3,	0x1288,	%l5
	nop 	! 	tsubcc	%g4,	0x08E3,	%i5 changed by convert2hboot
	andn	%o3,	0x1806,	%g6
	lduh	[%l7 + 0x08],	%i6
	fmovrdne	%o5,	%f14,	%f6
	fands	%f6,	%f2,	%f27
	orncc	%i2,	%i0,	%i1
	addc	%l4,	0x1959,	%o6
	fsrc1	%f26,	%f26
	bneg,a	loop_544
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tne	%xcc,	0x5 changed by convert2hboot
	movleu	%icc,	%i7,	%l0
loop_544:
	fmul8x16	%f24,	%f26,	%f20
	nop 	! 	tg	%xcc,	0x4 changed by convert2hboot
	mulscc	%g2,	%o2,	%l1
	nop
	set	0x7D, %l0
	ldub	[%l7 + %l0],	%o0
	fmovrsgez	%l2,	%f28,	%f6
	nop 	! 	taddcctv	%g1,	%l3,	%i3 changed by convert2hboot
	nop
	setx	loop_545,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	bn	%icc,	loop_546
	fpsub32	%f12,	%f10,	%f8
	movne	%xcc,	%o4,	%l6
loop_545:
	fmovdpos	%xcc,	%f13,	%f23
loop_546:
	brnz	%i4,	loop_547
	brlz,a	%o1,	loop_548
	nop
	setx	loop_549,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop 	! 	tge	%icc,	0x4 changed by convert2hboot
loop_547:
	sra	%o7,	%g5,	%g3
loop_548:
	srl	%l5,	%g4,	%g7
loop_549:
	fpadd16	%f30,	%f22,	%f30
	wr	%g0,	0x80,	%asi
	subcc	%g6,	%i6,	%o5
	alignaddrl	%i2,	%i0,	%o3
	nop 	! 	tsubcc	%l4,	0x1E4B,	%o6 changed by convert2hboot
	fmovdg	%xcc,	%f10,	%f11
	fxnors	%f16,	%f17,	%f13
	fmovsle	%xcc,	%f28,	%f18
	edge16n	%i7,	%i1,	%l0
	xnorcc	%o2,	%g2,	%l1
	movrlz	%l2,	0x096,	%o0
	for	%f16,	%f0,	%f26
	wr	%g0,	0x81,	%asi
	movpos	%xcc,	%i3,	%g1
	subcc	%o4,	0x153E,	%i4
	bcc	loop_550
	andn	%l6,	0x0E98,	%o1
	fmovse	%icc,	%f23,	%f19
	nop
	setx loop_551, %l0, %l1
	jmpl %l1, %o7
loop_550:
	nop 	! 	tcs	%xcc,	0x4 changed by convert2hboot
	wr	%g0,	0x89,	%asi
loop_551:
	udiv	%g5,	0x1A93,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%xcc,	%f7,	%f5
	addcc	%g7,	0x0B7A,	%l5
	array16	%g6,	%i6,	%i5
	fmovrslez	%o5,	%f28,	%f11
	fbu	%fcc0,	loop_552
	fbn	%fcc2,	loop_553
	alignaddr	%i0,	%o3,	%i2
	ba,a,pt	%icc,	loop_554
loop_552:
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
loop_553:
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
	stw	%o6,	[%l7 + 0x2C]
loop_554:
	orncc	%i7,	%l4,	%i1
	brnz	%l0,	loop_555
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	xor	%o2,	0x1580,	%l1
	movrgz	%l2,	%g2,	%o0
loop_555:
	udivx	%l3,	0x1CBA,	%g1
	edge32l	%i3,	%i4,	%l6
	fmovdcs	%icc,	%f6,	%f13
	wr	%g0,	0x0c,	%asi
	wr	%g0,	0x10,	%asi
	array32	%g3,	%g5,	%o1
	xor	%g7,	%l5,	%g6
	xor	%i6,	%g4,	%i5
	movneg	%xcc,	%o5,	%o3
	wr	%g0,	0x10,	%asi
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	fnand	%f22,	%f12,	%f4
	fnand	%f18,	%f10,	%f20
	bn	%xcc,	loop_556
	fmovrde	%i2,	%f30,	%f22
	edge8n	%i7,	%l4,	%i1
	nop 	! 	tgu	%xcc,	0x5 changed by convert2hboot
loop_556:
	movn	%xcc,	%o6,	%o2
	brlz	%l0,	loop_557
	ble,a,pt	%icc,	loop_558
	xnorcc	%l2,	%l1,	%o0
	bcc	%icc,	loop_559
loop_557:
	srax	%g2,	0x11,	%g1
loop_558:
	movrlz	%i3,	0x03E,	%i4
	brnz	%l6,	loop_560
loop_559:
	array8	%l3,	%o7,	%g3
	lduh	[%l7 + 0x3C],	%g5
	umulcc	%o1,	0x16A8,	%g7
loop_560:
	move	%xcc,	%l5,	%g6
	alignaddr	%o4,	%i6,	%i5
	movgu	%xcc,	%g4,	%o3
	movvs	%xcc,	%i0,	%o5
	xorcc	%i7,	%i2,	%l4
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	fornot2	%f6,	%f22,	%f0
	sllx	%i1,	0x13,	%o6
	andn	%l0,	0x0FBC,	%l2
	nop 	! 	tl	%icc,	0x1 changed by convert2hboot
	fmovsvs	%xcc,	%f2,	%f29
	add	%o2,	0x0CA0,	%l1
	array8	%o0,	%g2,	%g1
	srlx	%i4,	0x0C,	%l6
	sth	%i3,	[%l7 + 0x56]
	mova	%xcc,	%o7,	%g3
	movre	%l3,	0x1C3,	%g5
	fmovdcs	%xcc,	%f22,	%f9
	movvc	%icc,	%g7,	%l5
	sll	%g6,	%o4,	%i6
	array32	%i5,	%o1,	%g4
	edge8l	%i0,	%o5,	%o3
	or	%i7,	%i2,	%l4
	movle	%icc,	%o6,	%i1
	movne	%xcc,	%l2,	%o2
	nop 	! 	tcs	%icc,	0x3 changed by convert2hboot
	membar	0x33
	edge32	%l1,	%o0,	%l0
	fxnor	%f16,	%f12,	%f2
	fpadd16	%f18,	%f20,	%f12
	movle	%xcc,	%g2,	%i4
	sra	%g1,	0x1C,	%i3
	nop 	! 	tsubcc	%o7,	0x08F3,	%l6 changed by convert2hboot
	fnand	%f12,	%f4,	%f24
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	fmovscc	%xcc,	%f27,	%f22
	fnot2s	%f18,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g3,	0x0845,	%l3
	srax	%g5,	%l5,	%g7
	set	0x54, %o7
	nop	 ! 	swapa	[%l7 + %o7] 0x18,	%o4 ASI use replaced by convert2hboot
	nop 	! 	tsubcctv	%i6,	%i5,	%o1 changed by convert2hboot
	bgu,a,pt	%icc,	loop_561
	sth	%g6,	[%l7 + 0x22]
	fmovse	%icc,	%f0,	%f21
	nop
	setx	loop_562,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_561:
	membar	0x0F
	fcmpgt32	%f26,	%f26,	%i0
	movneg	%icc,	%g4,	%o3
loop_562:
	udivcc	%i7,	0x18E5,	%i2
	add	%l4,	%o5,	%o6
	call	loop_563
	andcc	%l2,	%i1,	%o2
	and	%o0,	0x05EF,	%l0
	fmovsge	%icc,	%f15,	%f21
loop_563:
	movrlez	%g2,	%i4,	%l1
	alignaddr	%g1,	%o7,	%i3
	addcc	%g3,	%l3,	%g5
	fnegs	%f9,	%f27
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	fxnor	%f30,	%f26,	%f28
	flush	%l7 + 0x0C
	nop
	setx	loop_564,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_564:
	swap	[%l7 + 0x68],	%l5
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%l6,	%o4
	wr	%g0,	0x11,	%asi
	fnot2s	%f23,	%f2
	mova	%icc,	%g7,	%i5
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
	edge8l	%g6,	%o1,	%i0
	fornot2	%f18,	%f20,	%f6
	fba,a	%fcc0,	loop_565
	fbg,a	%fcc0,	loop_566
	edge32n	%o3,	%g4,	%i7
	fxor	%f8,	%f0,	%f12
loop_565:
	fmovdcs	%icc,	%f3,	%f7
loop_566:
	sra	%l4,	0x0A,	%i2
	swap	[%l7 + 0x34],	%o5
	lduh	[%l7 + 0x54],	%l2
	ldd	[%l7 + 0x68],	%f6
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	bleu,a	%icc,	loop_567
	array32	%i1,	%o6,	%o0
	fmovsn	%icc,	%f0,	%f26
	bpos,a,pt	%icc,	loop_568
loop_567:
	edge16ln	%o2,	%g2,	%l0
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	edge8l	%i4,	%l1,	%g1
loop_568:
	alignaddrl	%i3,	%o7,	%l3
	fnand	%f6,	%f14,	%f2
	xor	%g3,	%l5,	%l6
	edge16n	%g5,	%o4,	%i6
	brz,a	%g7,	loop_569
	popc	%i5,	%o1
	wr	%g0,	0x80,	%asi
loop_569:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%icc,	%f9,	%f19
	movgu	%xcc,	%i0,	%g4
	umul	%o3,	%i7,	%l4
	orcc	%o5,	%i2,	%l2
	nop 	! 	sir	0x0CF0 changed by convert2hboot
	edge8n	%i1,	%o0,	%o2
	bg,a,pt	%xcc,	loop_570
	std	%f30,	[%l7 + 0x58]
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	bge	%xcc,	loop_571
loop_570:
	alignaddr	%g2,	%l0,	%o6
	or	%l1,	0x1A5C,	%i4
	movl	%icc,	%i3,	%o7
loop_571:
	ldsh	[%l7 + 0x0A],	%l3
	movcc	%xcc,	%g1,	%g3
	movre	%l6,	%l5,	%o4
	array32	%g5,	%g7,	%i6
	udivx	%o1,	0x026E,	%i5
	fbug,a	%fcc0,	loop_572
	movgu	%xcc,	%g6,	%i0
	movgu	%icc,	%o3,	%i7
	fsrc1	%f10,	%f6
loop_572:
	fbne,a	%fcc0,	loop_573
	nop 	! 	tsubcctv	%l4,	%g4,	%o5 changed by convert2hboot
	brnz	%l2,	loop_574
	call	loop_575
loop_573:
	srax	%i2,	%i1,	%o2
	bge,a,pn	%icc,	loop_576
loop_574:
	fbu	%fcc3,	loop_577
loop_575:
	brlz	%o0,	loop_578
	fcmps	%fcc2,	%f7,	%f14
loop_576:
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
loop_577:
	orn	%g2,	0x1622,	%l0
loop_578:
	mulx	%o6,	0x1ADF,	%l1
	sdivx	%i3,	0x0260,	%o7
	edge8l	%l3,	%g1,	%g3
	fmovsvc	%xcc,	%f30,	%f1
	bl	loop_579
	fmovrdgz	%l6,	%f30,	%f20
	wr	%g0,	0xe2,	%asi
	membar	#Sync
loop_579:
	fnegs	%f26,	%f6
	set	0x40, %l3
	nop	 ! 	ldda	[%l7 + %l3] 0x19,	%f0 ASI use replaced by convert2hboot
	call	loop_580
	mova	%icc,	%o4,	%g5
	addcc	%l5,	%g7,	%i6
	addccc	%i5,	%g6,	%i0
loop_580:
	ld	[%l7 + 0x10],	%f26
	nop 	! 	tsubcctv	%o3,	0x1E64,	%o1 changed by convert2hboot
	edge8	%l4,	%i7,	%g4
	xor	%o5,	%l2,	%i1
	sth	%i2,	[%l7 + 0x3E]
	edge8	%o0,	%g2,	%o2
	movle	%xcc,	%o6,	%l1
	fpadd16s	%f8,	%f31,	%f12
	call	loop_581
	fmuld8sux16	%f22,	%f8,	%f24
	fbul	%fcc0,	loop_582
	umul	%l0,	0x1DD7,	%i3
loop_581:
	mulscc	%l3,	0x1013,	%g1
	and	%o7,	%g3,	%i4
loop_582:
	st	%f31,	[%l7 + 0x38]
	movg	%xcc,	%l6,	%g5
	orcc	%l5,	%g7,	%i6
	fnands	%f10,	%f5,	%f1
	nop 	! 	tle	%icc,	0x4 changed by convert2hboot
	movn	%icc,	%o4,	%i5
	nop 	! 	taddcc	%i0,	0x0B06,	%o3 changed by convert2hboot
	nop 	! 	tle	%xcc,	0x3 changed by convert2hboot
	brgez	%o1,	loop_583
	ld	[%l7 + 0x6C],	%f25
	set	0x64, %i2
	nop	 ! 	ldswa	[%l7 + %i2] 0x89,	%l4 ASI use replaced by convert2hboot
loop_583:
	stb	%g6,	[%l7 + 0x21]
	add	%i7,	%o5,	%g4
	edge8l	%i1,	%l2,	%o0
	movne	%xcc,	%i2,	%g2
	umulcc	%o6,	%l1,	%o2
	xorcc	%i3,	%l0,	%g1
	fmovsvc	%xcc,	%f14,	%f4
	edge8n	%l3,	%g3,	%i4
	stb	%o7,	[%l7 + 0x3A]
	movgu	%xcc,	%g5,	%l5
	fmovrsgz	%l6,	%f25,	%f25
	movrne	%i6,	0x17C,	%o4
	movrne	%i5,	0x371,	%g7
	fmovsvs	%icc,	%f3,	%f13
	fbuge	%fcc2,	loop_584
	ldstub	[%l7 + 0x3D],	%o3
	movleu	%xcc,	%o1,	%i0
	fmul8ulx16	%f22,	%f12,	%f28
loop_584:
	movleu	%icc,	%l4,	%g6
	fbue	%fcc3,	loop_585
	movg	%icc,	%o5,	%g4
	bvc,a	%xcc,	loop_586
	add	%i7,	%i1,	%o0
loop_585:
	fmul8sux16	%f30,	%f18,	%f16
	ld	[%l7 + 0x40],	%f12
loop_586:
	array16	%l2,	%i2,	%o6
	nop
	set	0x28, %l6
	std	%l0,	[%l7 + %l6]
	bcs,a	loop_587
	be,a	%xcc,	loop_588
	nop
	setx	loop_589,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	array16	%o2,	%g2,	%i3
loop_587:
	alignaddr	%l0,	%g1,	%g3
loop_588:
	nop
	setx	loop_590,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_589:
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	sdiv	%i4,	0x1F69,	%l3
	ldsh	[%l7 + 0x3A],	%o7
loop_590:
	fmovsleu	%icc,	%f29,	%f3
	movge	%icc,	%g5,	%l6
	edge16n	%l5,	%o4,	%i6
	brnz,a	%i5,	loop_591
	bleu,pt	%xcc,	loop_592
	fnegd	%f10,	%f6
	popc	0x1CD8,	%g7
loop_591:
	movneg	%icc,	%o1,	%o3
loop_592:
	movg	%icc,	%l4,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o5,	%g4,	%i0
	movrlz	%i1,	%o0,	%i7
	pdist	%f0,	%f16,	%f28
	set	0x60, %g7
	nop	 ! 	ldstuba	[%l7 + %g7] 0x81,	%l2 ASI use replaced by convert2hboot
	alignaddr	%i2,	%l1,	%o6
	sdivx	%g2,	0x15BF,	%i3
	edge32n	%l0,	%g1,	%g3
	fmovrslez	%o2,	%f0,	%f2
	edge32l	%l3,	%i4,	%g5
	smul	%o7,	0x14FA,	%l6
	fnor	%f22,	%f4,	%f22
	fbul	%fcc1,	loop_593
	movre	%o4,	%i6,	%l5
	fmul8sux16	%f24,	%f24,	%f10
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
loop_593:
	nop 	! 	sir	0x15A8 changed by convert2hboot
	fpack16	%f14,	%f1
	movl	%icc,	%g7,	%o1
	fmovda	%xcc,	%f5,	%f30
	fmovsleu	%xcc,	%f19,	%f31
	fpack32	%f26,	%f20,	%f16
	movneg	%xcc,	%o3,	%l4
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	mova	%xcc,	%i5,	%g6
	umul	%g4,	%o5,	%i1
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	movgu	%icc,	%i0,	%o0
	wr	%g0,	0x0c,	%asi
	bne,a,pn	%xcc,	loop_594
	st	%f28,	[%l7 + 0x64]
	brlz,a	%l2,	loop_595
	brgz,a	%l1,	loop_596
loop_594:
	movrne	%i2,	%o6,	%i3
	fmovda	%icc,	%f8,	%f24
loop_595:
	fnegd	%f30,	%f28
loop_596:
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
	edge16ln	%g2,	%l0,	%g3
	lduw	[%l7 + 0x48],	%o2
	xnorcc	%l3,	0x0DDF,	%i4
	array8	%g1,	%g5,	%o7
	mulscc	%o4,	%l6,	%l5
	movvc	%xcc,	%g7,	%o1
	fxor	%f30,	%f10,	%f30
	nop 	! 	tpos	%icc,	0x3 changed by convert2hboot
	movre	%o3,	%l4,	%i6
	movvs	%icc,	%i5,	%g6
	andcc	%o5,	%i1,	%i0
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	bg	loop_597
	movcc	%icc,	%g4,	%i7
	fcmple32	%f8,	%f10,	%l2
	stw	%o0,	[%l7 + 0x74]
loop_597:
	nop
	wr	%g0,	0x18,	%asi
	fbge	%fcc1,	loop_598
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	ldsb	[%l7 + 0x39],	%l1
	stx	%o6,	[%l7 + 0x10]
loop_598:
	popc	%g2,	%i3
	umulcc	%g3,	%o2,	%l3
	fmovsl	%icc,	%f17,	%f9
	fnegd	%f4,	%f30
	wr	%g0,	0x89,	%asi
	fmovdn	%icc,	%f5,	%f23
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	movpos	%xcc,	%l0,	%g1
	ldsb	[%l7 + 0x0C],	%g5
	wr	%g0,	0x1e,	%asi
	membar	#Sync
	call	loop_599
	fornot1	%f16,	%f16,	%f20
	fbne,a	%fcc1,	loop_600
	fmovdl	%icc,	%f8,	%f2
loop_599:
	edge8ln	%o7,	%o4,	%l6
	udivcc	%l5,	0x041C,	%g7
loop_600:
	bshuffle	%f22,	%f22,	%f22
	popc	%o1,	%l4
	fmovdn	%icc,	%f10,	%f25
	andn	%i6,	%i5,	%o3
	set	0x48, %l2
	lda	[%l7 + %l2] 0x19,	%f15
	fnor	%f18,	%f4,	%f22
	ba,a	loop_601
	xorcc	%o5,	0x08A5,	%g6
	membar	0x06
	fmovdpos	%icc,	%f30,	%f28
loop_601:
	fmovscc	%icc,	%f16,	%f10
	fmovrdlez	%i1,	%f8,	%f22
	fcmps	%fcc3,	%f25,	%f12
	std	%g4,	[%l7 + 0x50]
	fxnors	%f11,	%f13,	%f16
	umul	%i7,	0x0A34,	%l2
	umul	%i0,	%o0,	%i2
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	movgu	%xcc,	%o6,	%l1
	andcc	%i3,	0x03C1,	%g3
	nop 	! 	tl	%icc,	0x6 changed by convert2hboot
	srlx	%g2,	%o2,	%i4
	fpsub32s	%f9,	%f16,	%f22
	movrlez	%l0,	0x237,	%g1
	array32	%g5,	%o7,	%o4
	fmovrslez	%l3,	%f9,	%f31
	flush	%l7 + 0x24
	fpsub32	%f16,	%f6,	%f24
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	popc	0x1CB0,	%g7
	movrgz	%o1,	%l4,	%i5
	fnors	%f14,	%f5,	%f19
	fcmps	%fcc0,	%f30,	%f25
	fsrc2	%f16,	%f0
	fcmpeq32	%f14,	%f8,	%o3
	fandnot2s	%f0,	%f11,	%f8
	mova	%xcc,	%i6,	%o5
	sdivx	%g6,	0x09F8,	%g4
	movrlez	%i7,	%i1,	%i0
	sllx	%l2,	0x10,	%o0
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	or	%o6,	%i2,	%i3
	stb	%g3,	[%l7 + 0x7F]
	edge16l	%l1,	%o2,	%g2
	nop
	set	0x0B, %i3
	ldsb	[%l7 + %i3],	%i4
	edge8	%l0,	%g5,	%o7
	andn	%g1,	0x1BDA,	%l3
	fmovdpos	%icc,	%f14,	%f2
	edge16l	%o4,	%l5,	%g7
	array16	%o1,	%l6,	%l4
	edge8n	%o3,	%i6,	%i5
	fbue	%fcc3,	loop_602
	swap	[%l7 + 0x5C],	%g6
	fcmpes	%fcc2,	%f25,	%f22
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
loop_602:
	fbg,a	%fcc2,	loop_603
	umul	%o5,	%i7,	%i1
	movrgz	%g4,	0x344,	%i0
	and	%l2,	%o0,	%i2
loop_603:
	edge8ln	%i3,	%g3,	%o6
	smulcc	%o2,	0x12A3,	%l1
	xnorcc	%g2,	0x1BAE,	%i4
	fmovd	%f2,	%f16
	sllx	%l0,	%g5,	%g1
	movneg	%xcc,	%o7,	%o4
	edge32l	%l3,	%g7,	%o1
	bleu	%icc,	loop_604
	fmovse	%icc,	%f14,	%f27
	fmovde	%xcc,	%f22,	%f30
	fmovsgu	%xcc,	%f16,	%f6
loop_604:
	fcmpes	%fcc1,	%f23,	%f8
	movvc	%icc,	%l5,	%l6
	fand	%f22,	%f18,	%f22
	popc	%o3,	%l4
	nop 	! 	tvs	%xcc,	0x7 changed by convert2hboot
	brgz	%i6,	loop_605
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	addc	%g6,	0x1B56,	%o5
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
loop_605:
	fbue,a	%fcc1,	loop_606
	movpos	%icc,	%i7,	%i5
	fmul8sux16	%f30,	%f28,	%f26
	movrlez	%i1,	0x194,	%i0
loop_606:
	sub	%l2,	%o0,	%g4
	fpadd16	%f14,	%f26,	%f2
	wr	%g0,	0x80,	%asi
	set	0x5E, %g1
	nop	 ! 	lduba	[%l7 + %g1] 0x15,	%i3 ASI use replaced by convert2hboot
	fmovde	%icc,	%f2,	%f27
	bpos,a,pn	%xcc,	loop_607
	addcc	%g3,	%o2,	%o6
	nop 	! 	tpos	%icc,	0x6 changed by convert2hboot
	fmul8sux16	%f10,	%f16,	%f26
loop_607:
	fbl,a	%fcc1,	loop_608
	mova	%xcc,	%l1,	%g2
	wr	%g0,	0x89,	%asi
loop_608:
	ldub	[%l7 + 0x18],	%g5
	fmovrslez	%i4,	%f0,	%f31
	movvs	%icc,	%g1,	%o4
	be,a	%icc,	loop_609
	andncc	%l3,	%g7,	%o7
	xor	%l5,	0x1401,	%l6
	array8	%o1,	%o3,	%i6
loop_609:
	membar	0x52
	movcc	%icc,	%l4,	%o5
	fbge,a	%fcc1,	loop_610
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	wr	%g0,	0x2a,	%asi
	membar	#Sync
loop_610:
	fmovrsgez	%i5,	%f10,	%f31
	nop 	! 	tgu	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tsubcctv	%i1,	0x0F62,	%i7 changed by convert2hboot
	move	%xcc,	%i0,	%l2
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	fblg	%fcc1,	loop_611
	ba,a,pt	%icc,	loop_612
	popc	0x1F70,	%g4
	udivcc	%i2,	0x19F4,	%i3
loop_611:
	fbule	%fcc3,	loop_613
loop_612:
	fmovrdlez	%g3,	%f6,	%f30
	flush	%l7 + 0x28
	fpadd16	%f2,	%f22,	%f2
loop_613:
	stx	%o0,	[%l7 + 0x20]
	andn	%o2,	%o6,	%g2
	fbe	%fcc0,	loop_614
	fmovse	%xcc,	%f8,	%f12
	alignaddrl	%l1,	%l0,	%g5
	edge32ln	%i4,	%g1,	%l3
loop_614:
	nop
	wr	%g0,	0x89,	%asi
	umulcc	%g7,	0x070E,	%o7
	fmovdvs	%icc,	%f31,	%f9
	fcmpes	%fcc1,	%f14,	%f14
	srl	%l5,	0x15,	%o1
	subcc	%o3,	%i6,	%l6
	fmovdleu	%icc,	%f27,	%f26
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	bcs	loop_615
	fmovdcs	%xcc,	%f12,	%f5
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	addc	%o5,	0x1A07,	%l4
loop_615:
	fzero	%f28
	alignaddr	%i5,	%i1,	%g6
	sdiv	%i0,	0x0841,	%i7
	fmovdg	%xcc,	%f23,	%f7
	movrgez	%l2,	%i2,	%i3
	fmuld8ulx16	%f1,	%f7,	%f0
	sll	%g3,	0x06,	%g4
	array32	%o2,	%o0,	%g2
	srax	%l1,	0x1E,	%o6
	fornot1s	%f21,	%f8,	%f4
	orncc	%g5,	%i4,	%g1
	movrgz	%l0,	%l3,	%o4
	udivcc	%g7,	0x13B0,	%l5
	fpadd16	%f22,	%f4,	%f30
	movcs	%icc,	%o1,	%o7
	nop 	! 	tsubcc	%o3,	0x07AF,	%i6 changed by convert2hboot
	mova	%icc,	%o5,	%l6
	fmul8x16	%f26,	%f20,	%f18
	smul	%l4,	%i1,	%g6
	ld	[%l7 + 0x18],	%f0
	edge32ln	%i0,	%i7,	%i5
	sdiv	%l2,	0x032C,	%i3
	be,a	loop_616
	edge8n	%g3,	%i2,	%g4
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
	sllx	%o0,	0x07,	%g2
loop_616:
	nop
	set	0x40, %o0
	nop	 ! 	ldstuba	[%l7 + %o0] 0x80,	%o2 ASI use replaced by convert2hboot
	alignaddr	%o6,	%g5,	%l1
	bneg,pt	%xcc,	loop_617
	movvc	%icc,	%g1,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%icc,	%f11,	%f2
loop_617:
	umul	%l3,	%o4,	%g7
	xor	%l5,	0x1C7E,	%i4
	movg	%xcc,	%o1,	%o7
	be,a	loop_618
	edge8ln	%o3,	%i6,	%l6
	udiv	%l4,	0x0BD8,	%o5
	fmovsl	%icc,	%f7,	%f3
loop_618:
	bl,pt	%icc,	loop_619
	xor	%i1,	%i0,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,a,pt	%xcc,	loop_620
loop_619:
	edge16n	%g6,	%i5,	%i3
	movn	%icc,	%l2,	%i2
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
loop_620:
	movleu	%xcc,	%g4,	%g3
	ldstub	[%l7 + 0x64],	%o0
	fbl	%fcc2,	loop_621
	nop 	! 	tge	%xcc,	0x1 changed by convert2hboot
	fpsub16s	%f30,	%f30,	%f17
	prefetch	[%l7 + 0x24],	 0x0
loop_621:
	prefetch	[%l7 + 0x58],	 0x0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	nop	 ! 	casxa	[%l6] 0x80,	%o2,	%g2 ASI use replaced by convert2hboot
	wr	%g0,	0x88,	%asi
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x70] %asi,	%f16
	fmovdl	%xcc,	%f8,	%f11
	fcmps	%fcc1,	%f0,	%f22
	nop 	! 	tle	%xcc,	0x0 changed by convert2hboot
	orn	%o6,	0x0789,	%g1
	ble,a	%xcc,	loop_622
	fnegs	%f5,	%f20
	fmovsleu	%icc,	%f28,	%f9
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
loop_622:
	sub	%l0,	0x0F74,	%l3
	mova	%icc,	%o4,	%g7
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	fpmerge	%f31,	%f4,	%f14
	ba	loop_623
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	addc	%l5,	0x1E03,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_623:
	faligndata	%f20,	%f6,	%f4
	call	loop_624
	edge32	%o1,	%o7,	%i4
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%o2
	movcs	%icc,	%l6,	%i6
loop_624:
	edge8ln	%l4,	%o5,	%i0
	alignaddr	%i7,	%g6,	%i5
	movrgez	%i3,	%i1,	%i2
	sllx	%l2,	%g4,	%g3
	umul	%o0,	0x0527,	%o2
	edge8n	%g5,	%g2,	%o6
	andncc	%g1,	%l3,	%o4
	wr	%g0,	0x89,	%asi
	udivx	%l0,	0x0119,	%l5
	movrgez	%l1,	0x352,	%g7
	fbu,a	%fcc2,	loop_625
	nop
	setx	loop_626,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	alignaddr	%o1,	%o7,	%o3
	set	0x78, %g3
	nop	 ! 	lduwa	[%l7 + %g3] 0x04,	%l6 ASI use replaced by convert2hboot
loop_625:
	movre	%i4,	%l4,	%o5
loop_626:
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	sethi	0x161E,	%i0
	st	%f11,	[%l7 + 0x50]
	std	%f8,	[%l7 + 0x50]
	nop 	! 	tsubcc	%i7,	0x1697,	%i6 changed by convert2hboot
	ldsh	[%l7 + 0x72],	%i5
	movge	%xcc,	%g6,	%i3
	movre	%i1,	0x00A,	%l2
	edge16	%g4,	%i2,	%o0
	wr	%g0,	0x89,	%asi
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
	fmovsvs	%icc,	%f10,	%f30
	fbo,a	%fcc0,	loop_627
	or	%g5,	0x13EC,	%o2
	fmovdcc	%icc,	%f30,	%f16
	wr	%g0,	0x89,	%asi
loop_627:
	edge8n	%o6,	%l3,	%o4
	smul	%g1,	%l5,	%l1
	movrlz	%g7,	%o1,	%l0
	fmovrdgz	%o3,	%f0,	%f14
	movle	%icc,	%o7,	%l6
	nop 	! 	tle	%icc,	0x4 changed by convert2hboot
	edge16l	%l4,	%o5,	%i0
	nop 	! 	tle	%icc,	0x2 changed by convert2hboot
	andcc	%i4,	0x00B2,	%i6
	add	%i7,	0x1C10,	%g6
	ldd	[%l7 + 0x20],	%i2
	fbg	%fcc3,	loop_628
	movpos	%icc,	%i1,	%l2
	set	0x78, %o5
	nop	 ! 	prefetcha	[%l7 + %o5] 0x88,	 0x1 ASI use replaced by convert2hboot
loop_628:
	array16	%i5,	%i2,	%g3
	or	%o0,	%g5,	%g2
	edge32ln	%o2,	%o6,	%l3
	fmovrsgez	%g1,	%f24,	%f3
	fbuge,a	%fcc0,	loop_629
	bvs,a,pn	%xcc,	loop_630
	mulx	%l5,	0x02A4,	%o4
	and	%g7,	%l1,	%l0
loop_629:
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
loop_630:
	edge8	%o3,	%o7,	%l6
	brz	%o1,	loop_631
	umulcc	%l4,	%o5,	%i0
	xnor	%i6,	%i7,	%i4
	wr	%g0,	0x80,	%asi
loop_631:
	srax	%i1,	%g6,	%g4
	fpadd16	%f0,	%f30,	%f0
	ld	[%l7 + 0x50],	%f13
	fnands	%f23,	%f10,	%f2
	fbuge,a	%fcc2,	loop_632
	movre	%i5,	0x243,	%l2
	udivcc	%i2,	0x1C98,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_632:
	fsrc1	%f8,	%f28
	fnot1s	%f19,	%f26
	wr	%g0,	0xeb,	%asi
	membar	#Sync
	udivcc	%g2,	0x1569,	%g3
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
	sllx	%o6,	0x03,	%l3
	set	0x30, %g2
	nop	 ! 	lduha	[%l7 + %g2] 0x89,	%g1 ASI use replaced by convert2hboot
	fcmpd	%fcc2,	%f4,	%f2
	nop 	! 	sir	0x125A changed by convert2hboot
	xnorcc	%o2,	0x19C6,	%l5
	fbg	%fcc3,	loop_633
	fand	%f28,	%f6,	%f22
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	fones	%f5
loop_633:
	movcc	%icc,	%g7,	%o4
	udivx	%l1,	0x1552,	%o3
	alignaddrl	%o7,	%l0,	%l6
	array16	%l4,	%o5,	%o1
	call	loop_634
	sllx	%i6,	%i7,	%i0
	faligndata	%f12,	%f14,	%f4
	movre	%i4,	0x28A,	%i1
loop_634:
	movrgez	%i3,	%g4,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%icc,	%f9,	%f18
	nop 	! 	tpos	%xcc,	0x4 changed by convert2hboot
	sllx	%i5,	0x0A,	%i2
	bvc,pn	%xcc,	loop_635
	nop 	! 	tle	%xcc,	0x0 changed by convert2hboot
	andn	%l2,	0x1396,	%g5
	fnands	%f1,	%f0,	%f31
loop_635:
	movvs	%icc,	%o0,	%g3
	fmovde	%xcc,	%f5,	%f25
	alignaddr	%o6,	%l3,	%g1
	movrgz	%g2,	%l5,	%o2
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
	std	%f14,	[%l7 + 0x08]
	fpsub16	%f2,	%f16,	%f24
	fblg	%fcc0,	loop_636
	movrgz	%o4,	0x0FA,	%l1
	xnorcc	%o3,	0x0771,	%g7
	fnands	%f29,	%f23,	%f31
loop_636:
	fmovscc	%icc,	%f23,	%f6
	movrne	%l0,	0x182,	%l6
	movne	%xcc,	%o7,	%l4
	ldub	[%l7 + 0x28],	%o5
	srlx	%o1,	%i7,	%i0
	udivcc	%i6,	0x1400,	%i4
	edge8n	%i3,	%i1,	%g4
	mova	%icc,	%i5,	%g6
	fmul8x16	%f2,	%f10,	%f30
	fbuge,a	%fcc2,	loop_637
	nop 	! 	taddcc	%i2,	%g5,	%o0 changed by convert2hboot
	fcmpes	%fcc2,	%f6,	%f24
	movvs	%icc,	%g3,	%l2
loop_637:
	ble,a,pt	%xcc,	loop_638
	fcmpd	%fcc1,	%f14,	%f24
	sub	%o6,	0x19DF,	%g1
	fabsd	%f4,	%f14
loop_638:
	movne	%xcc,	%l3,	%l5
	andn	%o2,	0x0630,	%g2
	edge16	%l1,	%o4,	%g7
	addcc	%l0,	0x14F9,	%o3
	fone	%f24
	movge	%xcc,	%l6,	%o7
	popc	%l4,	%o1
	srl	%i7,	0x15,	%o5
	movl	%icc,	%i6,	%i0
	ldx	[%l7 + 0x58],	%i4
	edge16n	%i3,	%i1,	%i5
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
	movne	%xcc,	%g6,	%i2
	movn	%icc,	%g4,	%g5
	fmovsgu	%xcc,	%f28,	%f3
loop_639:
	fxors	%f10,	%f14,	%f17
	edge32ln	%o0,	%l2,	%o6
	xorcc	%g3,	%l3,	%l5
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
	brgz	%g1,	loop_640
	orcc	%g2,	%l1,	%o2
	smul	%g7,	%o4,	%l0
	std	%i6,	[%l7 + 0x78]
loop_640:
	nop 	! 	tleu	%xcc,	0x5 changed by convert2hboot
	set	0x4E, %o1
	nop	 ! 	stba	%o3,	[%l7 + %o1] 0x11 ASI use replaced by convert2hboot
	udivx	%o7,	0x07E2,	%o1
	fbul	%fcc2,	loop_641
	movrlz	%l4,	%o5,	%i7
	fcmps	%fcc2,	%f9,	%f18
	sll	%i0,	%i6,	%i3
loop_641:
	xnorcc	%i4,	0x1538,	%i5
	membar	0x4C
	std	%f10,	[%l7 + 0x30]
	fcmpgt16	%f16,	%f20,	%g6
	wr	%g0,	0x0c,	%asi
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	edge16l	%i2,	%g5,	%g4
	alignaddrl	%o0,	%l2,	%g3
	xnor	%o6,	%l3,	%g1
	sllx	%g2,	0x0D,	%l1
	or	%o2,	%g7,	%o4
	umul	%l5,	0x1BFE,	%l6
	bgu,a	%xcc,	loop_642
	fxnors	%f3,	%f25,	%f7
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
	movg	%xcc,	%o3,	%o7
loop_642:
	movrlez	%o1,	0x1A6,	%l0
	srax	%o5,	0x04,	%l4
	fmovdne	%icc,	%f18,	%f11
	movre	%i7,	%i6,	%i0
	edge32	%i3,	%i4,	%g6
	fmovdne	%xcc,	%f25,	%f1
	umulcc	%i1,	0x117B,	%i2
	movcs	%xcc,	%i5,	%g4
	bg,pt	%xcc,	loop_643
	ldstub	[%l7 + 0x69],	%o0
	fbge,a	%fcc2,	loop_644
	nop 	! 	tgu	%xcc,	0x6 changed by convert2hboot
loop_643:
	fmovrdlz	%g5,	%f12,	%f22
	fcmpeq32	%f30,	%f14,	%l2
loop_644:
	subccc	%o6,	0x1D03,	%g3
	fmul8x16	%f2,	%f2,	%f18
	edge32ln	%g1,	%l3,	%l1
	fnot1	%f22,	%f14
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	fmovsvc	%xcc,	%f23,	%f26
	udivx	%g2,	0x11C9,	%g7
	sll	%o4,	0x0F,	%o2
	movrgez	%l6,	%o3,	%o7
	fmovsn	%icc,	%f26,	%f31
	wr	%g0,	0xeb,	%asi
	fbule	%fcc1,	loop_645
	xorcc	%l0,	%o5,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%l4,	0x1D,	%i7
loop_645:
	nop 	! 	te	%xcc,	0x4 changed by convert2hboot
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	fmovsa	%xcc,	%f14,	%f17
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
	fmul8x16al	%f16,	%f3,	%f30
	umul	%i4,	%g6,	%i1
	srlx	%i2,	0x16,	%i5
	fmuld8sux16	%f0,	%f2,	%f16
	xnor	%i0,	%o0,	%g5
	wr	%g0,	0x0c,	%asi
	srl	%g4,	%g3,	%o6
	movgu	%icc,	%l3,	%l1
	fcmpeq32	%f18,	%f14,	%g2
	edge16l	%g7,	%o4,	%g1
	be,pn	%icc,	loop_646
	addccc	%o2,	0x04F9,	%o3
	sllx	%o7,	0x0D,	%o1
	fmovsvc	%xcc,	%f26,	%f27
loop_646:
	fpack16	%f16,	%f24
	fzero	%f16
	fnegd	%f10,	%f6
	fmovsleu	%icc,	%f4,	%f9
	edge16n	%l6,	%l0,	%l5
	fbl,a	%fcc2,	loop_647
	fblg	%fcc2,	loop_648
	and	%l4,	%i7,	%i6
	fornot2s	%f15,	%f27,	%f23
loop_647:
	fornot2	%f16,	%f0,	%f0
loop_648:
	srl	%o5,	0x02,	%i4
	andncc	%i3,	%i1,	%g6
	fsrc2s	%f0,	%f1
	edge32n	%i5,	%i2,	%i0
	movrgez	%g5,	0x17F,	%o0
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	nop
	setx loop_649, %l0, %l1
	jmpl %l1, %g4
	bne	loop_650
	array16	%g3,	%l2,	%l3
	movle	%xcc,	%o6,	%l1
loop_649:
	edge16ln	%g7,	%g2,	%g1
loop_650:
	andn	%o4,	0x0AF9,	%o3
	fmovsge	%icc,	%f5,	%f1
	sllx	%o2,	0x13,	%o7
	edge32ln	%l6,	%o1,	%l5
	mova	%xcc,	%l4,	%i7
	edge8ln	%i6,	%l0,	%o5
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	fpack16	%f8,	%f2
	umulcc	%i4,	%i3,	%g6
	brlez	%i5,	loop_651
	movn	%icc,	%i2,	%i1
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
	fcmple16	%f30,	%f14,	%g5
loop_651:
	addccc	%i0,	0x06FC,	%g4
	umul	%o0,	0x0927,	%g3
	fmovsne	%icc,	%f11,	%f28
	xnorcc	%l3,	0x172F,	%l2
	subc	%o6,	%l1,	%g7
	sllx	%g2,	%o4,	%o3
	movvs	%icc,	%g1,	%o2
	subccc	%l6,	0x0D04,	%o1
	sdivx	%o7,	0x1CDF,	%l5
	array8	%l4,	%i7,	%i6
	movrgz	%o5,	%i4,	%l0
	movvc	%icc,	%i3,	%g6
	fcmpd	%fcc2,	%f0,	%f20
	subccc	%i2,	0x0A3C,	%i5
	swap	[%l7 + 0x78],	%g5
	fbne,a	%fcc1,	loop_652
	brlz	%i0,	loop_653
	fcmpne32	%f0,	%f26,	%i1
loop_652:
	fandnot2	%f16,	%f18,	%f0
loop_653:
	fpadd16s	%f21,	%f9,	%f6
	movre	%g4,	%o0,	%l3
	ldd	[%l7 + 0x10],	%g2
	nop
	setx	loop_654,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fmovdvc	%icc,	%f1,	%f13
	movle	%xcc,	%o6,	%l1
	nop 	! 	tvs	%icc,	0x1 changed by convert2hboot
loop_654:
	fmovsg	%icc,	%f6,	%f14
	ble,a,pt	%icc,	loop_655
	edge8l	%l2,	%g2,	%g7
	wr	%g0,	0x04,	%asi
loop_655:
	movrgez	%g1,	%o2,	%l6
	fnegs	%f21,	%f6
	nop
	setx loop_656, %l0, %l1
	jmpl %l1, %o4
	stb	%o7,	[%l7 + 0x0E]
	std	%f4,	[%l7 + 0x08]
	movvc	%xcc,	%o1,	%l5
loop_656:
	fmovdpos	%icc,	%f1,	%f14
	fabsd	%f24,	%f2
	fmovdcs	%icc,	%f9,	%f24
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	fpsub32	%f0,	%f24,	%f16
	membar	0x4A
	set	0x10, %g6
	nop	 ! 	stxa	%i7,	[%l7 + %g6] 0x11 ASI use replaced by convert2hboot
	fcmpne32	%f26,	%f22,	%l4
	edge32l	%i6,	%i4,	%l0
	and	%o5,	0x0A7A,	%g6
	brlz,a	%i3,	loop_657
	mova	%xcc,	%i5,	%i2
	edge8ln	%i0,	%g5,	%g4
	edge16ln	%i1,	%o0,	%l3
loop_657:
	fmovdcs	%icc,	%f13,	%f19
	wr	%g0,	0x80,	%asi
	fands	%f5,	%f3,	%f7
	movgu	%xcc,	%l1,	%g3
	ldx	[%l7 + 0x58],	%l2
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
	edge8l	%g2,	%o3,	%g7
	fmovd	%f28,	%f2
	sdiv	%o2,	0x17ED,	%l6
	bge,a	loop_658
	fbge	%fcc2,	loop_659
	brnz	%o4,	loop_660
	sub	%o7,	0x0C0F,	%g1
loop_658:
	orncc	%o1,	0x123D,	%i7
loop_659:
	stb	%l4,	[%l7 + 0x39]
loop_660:
	sll	%i6,	%l5,	%i4
	movneg	%xcc,	%l0,	%o5
	movrgez	%g6,	%i5,	%i2
	fba,a	%fcc1,	loop_661
	sll	%i3,	%i0,	%g4
	edge32	%i1,	%o0,	%g5
	fmovsne	%icc,	%f6,	%f3
loop_661:
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	movleu	%icc,	%l3,	%l1
	fbn	%fcc2,	loop_662
	fbug	%fcc1,	loop_663
	fmovsvs	%xcc,	%f9,	%f29
	fbue	%fcc1,	loop_664
loop_662:
	ld	[%l7 + 0x34],	%f25
loop_663:
	ldsh	[%l7 + 0x32],	%o6
	ba,pt	%icc,	loop_665
loop_664:
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	sdivcc	%l2,	0x14A5,	%g2
	brz,a	%g3,	loop_666
loop_665:
	movcs	%icc,	%o3,	%g7
	ldstub	[%l7 + 0x3F],	%o2
loop_666:
	fpack32	%f8,	%f22,	%f26
	movleu	%icc,	%o4,	%l6
	orn	%g1,	0x02FD,	%o1
	fornot1	%f6,	%f10,	%f14
	set	0x38, %l5
	nop	 ! 	ldxa	[%g0 + %l5] 0x20,	%o7 ASI use replaced by convert2hboot
	fpadd32s	%f7,	%f24,	%f29
	fbg	%fcc0,	loop_667
	faligndata	%f8,	%f6,	%f6
	nop 	! 	taddcctv	%l4,	%i6,	%i7 changed by convert2hboot
	movrgz	%l5,	%i4,	%o5
loop_667:
	fblg	%fcc3,	loop_668
	andncc	%l0,	%g6,	%i5
	stx	%i3,	[%l7 + 0x28]
	st	%f14,	[%l7 + 0x30]
loop_668:
	edge32n	%i2,	%i0,	%i1
	fbuge,a	%fcc2,	loop_669
	edge8n	%g4,	%o0,	%l3
	flush	%l7 + 0x3C
	array16	%g5,	%o6,	%l2
loop_669:
	addccc	%l1,	0x1744,	%g2
	fxnor	%f4,	%f26,	%f4
	set	0x5C, %i4
	nop	 ! 	lduwa	[%l7 + %i4] 0x80,	%g3 ASI use replaced by convert2hboot
	fmul8ulx16	%f24,	%f22,	%f6
	fors	%f25,	%f29,	%f26
	xnor	%o3,	0x1E11,	%g7
	popc	0x0873,	%o2
	umulcc	%l6,	0x1028,	%o4
	fnors	%f16,	%f27,	%f20
	flush	%l7 + 0x24
	edge16ln	%g1,	%o7,	%l4
	fnot1	%f20,	%f26
	udivcc	%o1,	0x02E1,	%i7
	edge16l	%l5,	%i4,	%i6
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	fsrc2s	%f13,	%f14
	mulx	%l0,	0x1593,	%g6
	fmovdpos	%icc,	%f15,	%f21
	fmul8ulx16	%f16,	%f0,	%f8
	fpackfix	%f28,	%f22
	orn	%o5,	0x0D60,	%i5
	stx	%i2,	[%l7 + 0x60]
	bpos	loop_670
	fbu	%fcc0,	loop_671
	fcmpeq16	%f24,	%f10,	%i3
	bvs,pt	%icc,	loop_672
loop_670:
	popc	0x0271,	%i0
loop_671:
	nop
	set	0x7C, %o2
	ldsw	[%l7 + %o2],	%i1
	fpack32	%f18,	%f16,	%f8
loop_672:
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	popc	0x1CF4,	%o0
	fnegs	%f16,	%f1
	movpos	%xcc,	%l3,	%g4
	srl	%g5,	0x01,	%o6
	set	0x40, %i6
	nop	 ! 	ldda	[%l7 + %i6] 0x10,	%f0 ASI use replaced by convert2hboot
	bgu,a,pt	%xcc,	loop_673
	or	%l2,	%g2,	%l1
	nop
	setx	loop_674,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	bg,pn	%xcc,	loop_675
loop_673:
	movge	%icc,	%o3,	%g3
	fnand	%f22,	%f16,	%f24
loop_674:
	fxors	%f17,	%f18,	%f8
loop_675:
	stb	%g7,	[%l7 + 0x27]
	fzero	%f12
	addcc	%o2,	0x0771,	%o4
	movcs	%icc,	%g1,	%l6
	mova	%icc,	%l4,	%o1
	stb	%o7,	[%l7 + 0x7D]
	array16	%i7,	%l5,	%i6
	array16	%l0,	%g6,	%o5
	st	%f5,	[%l7 + 0x40]
	ldd	[%l7 + 0x58],	%f16
	movcc	%xcc,	%i4,	%i5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i3
	nop	 ! 	casa	[%l6] 0x18,	%i3,	%i2 ASI use replaced by convert2hboot
	movre	%i1,	%i0,	%o0
	sra	%g4,	%l3,	%o6
	movrgz	%g5,	0x343,	%l2
	edge16ln	%g2,	%l1,	%o3
	ldub	[%l7 + 0x1B],	%g7
	fbo	%fcc3,	loop_676
	sdiv	%o2,	0x0A4B,	%o4
	edge8n	%g3,	%l6,	%g1
	nop 	! 	tleu	%xcc,	0x5 changed by convert2hboot
loop_676:
	fblg	%fcc2,	loop_677
	sll	%o1,	%o7,	%l4
	wr	%g0,	0x18,	%asi
loop_677:
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	andcc	%i7,	%i6,	%g6
	sth	%o5,	[%l7 + 0x78]
	fabss	%f17,	%f12
	sra	%l0,	0x1F,	%i5
	fmovrsgz	%i4,	%f1,	%f6
	movn	%icc,	%i2,	%i1
	call	loop_678
	fmovsge	%xcc,	%f19,	%f30
	fpsub16	%f24,	%f6,	%f22
	movn	%xcc,	%i3,	%i0
loop_678:
	membar	0x1E
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	nop	 ! 	casa	[%l6] 0x89,	%g4,	%l3 ASI use replaced by convert2hboot
	srlx	%o0,	%g5,	%l2
	nop 	! 	sir	0x1F35 changed by convert2hboot
	fcmpd	%fcc0,	%f4,	%f4
	array8	%g2,	%l1,	%o6
	fcmped	%fcc2,	%f12,	%f30
	bcs,a,pn	%xcc,	loop_679
	edge8	%o3,	%o2,	%o4
	ldd	[%l7 + 0x50],	%f20
	fbo,a	%fcc0,	loop_680
loop_679:
	std	%f18,	[%l7 + 0x28]
	nop 	! 	taddcctv	%g3,	0x0858,	%l6 changed by convert2hboot
	movn	%xcc,	%g1,	%o1
loop_680:
	array32	%g7,	%l4,	%o7
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	nop 	! 	taddcc	%l5,	0x0055,	%i7 changed by convert2hboot
	smul	%g6,	0x0BC9,	%o5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x11,	%asi
	sdivcc	%i4,	0x0746,	%l0
	movgu	%xcc,	%i1,	%i3
	fmovrdgez	%i0,	%f26,	%f2
	fmovdpos	%icc,	%f18,	%f8
	fornot1s	%f7,	%f30,	%f31
	umul	%g4,	0x1EFB,	%l3
	edge32n	%i2,	%o0,	%l2
	ld	[%l7 + 0x10],	%f12
	srl	%g2,	%g5,	%l1
	sth	%o6,	[%l7 + 0x1E]
	subcc	%o2,	%o4,	%o3
	edge16n	%g3,	%l6,	%g1
	set	0x10, %i7
	nop	 ! 	ldda	[%l7 + %i7] 0x80,	%o0 ASI use replaced by convert2hboot
	addccc	%g7,	%l4,	%o7
	set	0x28, %i0
	nop	 ! 	prefetcha	[%l7 + %i0] 0x80,	 0x2 ASI use replaced by convert2hboot
	array16	%i7,	%g6,	%i6
	sethi	0x0D65,	%i5
	swap	[%l7 + 0x4C],	%i4
	fcmpes	%fcc2,	%f18,	%f11
	prefetch	[%l7 + 0x34],	 0x2
	mulx	%o5,	0x18A7,	%l0
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	alignaddr	%i3,	%i0,	%g4
	sdivcc	%l3,	0x18C3,	%i1
	subcc	%o0,	0x1B6B,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%icc,	%f20,	%f9
	fnot1	%f0,	%f24
	fcmpne32	%f24,	%f8,	%g2
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	std	%f30,	[%l7 + 0x50]
	mova	%icc,	%g5,	%l1
	edge32n	%o6,	%o2,	%l2
	brlz	%o3,	loop_681
	andncc	%g3,	%o4,	%g1
	fnegd	%f30,	%f12
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
loop_681:
	nop
	set	0x24, %i1
	nop	 ! 	stba	%o1,	[%l7 + %i1] 0x19 ASI use replaced by convert2hboot
	fbu	%fcc1,	loop_682
	sdivx	%l6,	0x1BA1,	%g7
	movpos	%icc,	%o7,	%l5
	set	0x10, %o3
	lda	[%l7 + %o3] 0x80,	%f31
loop_682:
	fpsub32	%f24,	%f26,	%f22
	bvc,a	%icc,	loop_683
	fornot1s	%f14,	%f10,	%f15
	subc	%i7,	0x1827,	%g6
	edge32ln	%l4,	%i5,	%i4
loop_683:
	fand	%f6,	%f2,	%f22
	movl	%xcc,	%i6,	%o5
	fmovsa	%icc,	%f17,	%f27
	fand	%f2,	%f28,	%f30
	nop 	! 	tge	%xcc,	0x1 changed by convert2hboot
	fba	%fcc3,	loop_684
	fmovd	%f4,	%f14
	ldd	[%l7 + 0x40],	%f2
	srlx	%i3,	%i0,	%l0
loop_684:
	ld	[%l7 + 0x68],	%f0
	fmovrsne	%g4,	%f8,	%f24
	orncc	%i1,	%o0,	%l3
	sdivx	%g2,	0x017B,	%g5
	alignaddrl	%i2,	%l1,	%o6
	umul	%l2,	%o2,	%o3
	fxor	%f16,	%f12,	%f26
	wr	%g0,	0x4f,	%asi
	prefetch	[%l7 + 0x34],	 0x1
	nop 	! 	tne	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tvc	%xcc,	0x3 changed by convert2hboot
	bgu	loop_685
	membar	0x37
	array8	%g1,	%o1,	%o4
	popc	0x1587,	%l6
loop_685:
	pdist	%f12,	%f4,	%f20
	wr	%g0,	0x89,	%asi
	array32	%l5,	%o7,	%g6
	bvs	%xcc,	loop_686
	brlz	%i7,	loop_687
	ldsb	[%l7 + 0x63],	%l4
	bgu,pt	%xcc,	loop_688
loop_686:
	movre	%i4,	0x193,	%i6
loop_687:
	edge16ln	%o5,	%i3,	%i0
	or	%i5,	%g4,	%l0
loop_688:
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
	fxors	%f13,	%f0,	%f3
	fpsub16s	%f27,	%f10,	%f12
	edge32	%o0,	%l3,	%i1
	fblg,a	%fcc3,	loop_689
	fnot2	%f24,	%f26
	smul	%g5,	%i2,	%g2
	fmovrdlez	%l1,	%f16,	%f14
loop_689:
	mulx	%l2,	%o2,	%o6
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
	alignaddr	%o3,	%g3,	%o1
	addc	%o4,	0x0D1A,	%l6
	brz,a	%g1,	loop_690
	movrgz	%g7,	0x176,	%o7
	fbg,a	%fcc1,	loop_691
	udivcc	%g6,	0x1F04,	%i7
loop_690:
	fnot2	%f28,	%f12
	swap	[%l7 + 0x70],	%l4
loop_691:
	sub	%i4,	%i6,	%l5
	add	%o5,	%i3,	%i0
	fcmpgt16	%f14,	%f6,	%g4
	fmovdneg	%xcc,	%f6,	%f29
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
	addcc	%l0,	%o0,	%i5
	edge32l	%l3,	%g5,	%i1
	bgu,a,pn	%icc,	loop_692
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	addcc	%i2,	0x1D95,	%l1
	lduw	[%l7 + 0x44],	%g2
loop_692:
	sdivx	%l2,	0x08A8,	%o6
	bvs,a,pn	%icc,	loop_693
	addccc	%o3,	%o2,	%g3
	ldd	[%l7 + 0x10],	%f6
	alignaddrl	%o4,	%o1,	%g1
loop_693:
	fnegd	%f26,	%f0
	subc	%l6,	%o7,	%g6
	addcc	%i7,	%l4,	%g7
	wr	%g0,	0x80,	%asi
	fabsd	%f26,	%f18
	fmovse	%icc,	%f28,	%f29
	sll	%l5,	0x06,	%i6
	fcmpne32	%f8,	%f0,	%o5
	popc	0x0663,	%i0
	wr	%g0,	0x80,	%asi
	fbo	%fcc1,	loop_694
	sdivcc	%l0,	0x0316,	%o0
	edge8	%i5,	%i3,	%g5
	movrne	%l3,	0x23D,	%i2
loop_694:
	nop 	! 	tsubcc	%l1,	%i1,	%l2 changed by convert2hboot
	udivcc	%g2,	0x060C,	%o6
	wr	%g0,	0x88,	%asi
	fcmpeq32	%f12,	%f14,	%o2
	wr	%g0,	0x11,	%asi
	fxor	%f26,	%f26,	%f20
	sdivx	%o4,	0x07F5,	%g1
	movcs	%xcc,	%l6,	%o7
	andcc	%o1,	0x0161,	%i7
	array32	%g6,	%l4,	%g7
	fbg,a	%fcc1,	loop_695
	movgu	%xcc,	%i4,	%i6
	fsrc2s	%f23,	%f16
	sethi	0x1AED,	%l5
loop_695:
	fxors	%f9,	%f31,	%f28
	xnorcc	%o5,	%i0,	%g4
	alignaddr	%o0,	%i5,	%i3
	ldx	[%l7 + 0x28],	%g5
	subcc	%l3,	%l0,	%l1
	fmovsg	%icc,	%f27,	%f1
	movvs	%icc,	%i2,	%i1
	xorcc	%g2,	0x0970,	%l2
	nop 	! 	tpos	%xcc,	0x4 changed by convert2hboot
	sub	%o6,	%o2,	%o3
	move	%icc,	%o4,	%g3
	nop 	! 	tneg	%icc,	0x3 changed by convert2hboot
	nop
	set	0x38, %o4
	ldx	[%l7 + %o4],	%g1
	movrlz	%l6,	0x207,	%o7
	fmovse	%icc,	%f2,	%f21
	stb	%i7,	[%l7 + 0x4D]
	movrne	%o1,	%g6,	%l4
	movcs	%icc,	%i4,	%g7
	fabsd	%f4,	%f4
	sdivcc	%l5,	0x0633,	%o5
	ldd	[%l7 + 0x60],	%i6
	movgu	%xcc,	%i0,	%g4
	smul	%i5,	%i3,	%g5
	fmovdl	%icc,	%f1,	%f19
	umulcc	%l3,	%l0,	%l1
	mulscc	%i2,	0x0837,	%o0
	mova	%icc,	%i1,	%l2
	movrne	%o6,	%g2,	%o2
	fbe,a	%fcc1,	loop_696
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
	umul	%o3,	%g3,	%o4
	sdiv	%l6,	0x0A25,	%o7
loop_696:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a	loop_697
	fmovscs	%icc,	%f18,	%f20
	ldd	[%l7 + 0x48],	%g0
	movle	%xcc,	%o1,	%i7
loop_697:
	sllx	%l4,	%g6,	%i4
	movvs	%xcc,	%g7,	%l5
	edge16	%o5,	%i0,	%g4
	sll	%i5,	0x17,	%i3
	bvs	loop_698
	umulcc	%g5,	%l3,	%l0
	nop 	! 	tsubcc	%i6,	0x1492,	%i2 changed by convert2hboot
	nop 	! 	tl	%icc,	0x6 changed by convert2hboot
loop_698:
	nop 	! 	tsubcctv	%o0,	%l1,	%l2 changed by convert2hboot
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	srlx	%o6,	0x16,	%g2
	fornot1s	%f23,	%f1,	%f24
	nop 	! 	taddcctv	%o2,	0x12E2,	%i1 changed by convert2hboot
	nop 	! 	sir	0x0475 changed by convert2hboot
	fmovscc	%icc,	%f6,	%f21
	edge16l	%g3,	%o3,	%o4
	mulx	%l6,	%o7,	%g1
	edge16l	%o1,	%l4,	%g6
	movcs	%icc,	%i7,	%i4
	ba	loop_699
	movrne	%l5,	0x0B2,	%g7
	fnegd	%f30,	%f30
	membar	0x42
loop_699:
	umul	%o5,	%i0,	%g4
	bg,a	loop_700
	movg	%icc,	%i5,	%i3
	fble,a	%fcc2,	loop_701
	movne	%xcc,	%l3,	%l0
loop_700:
	orncc	%g5,	%i2,	%i6
	faligndata	%f0,	%f0,	%f8
loop_701:
	fcmpeq32	%f22,	%f24,	%o0
	movge	%icc,	%l2,	%o6
	lduw	[%l7 + 0x2C],	%g2
	fpadd32s	%f30,	%f2,	%f16
	nop 	! 	tsubcctv	%o2,	0x0FE2,	%i1 changed by convert2hboot
	edge8	%l1,	%g3,	%o4
	nop 	! 	tgu	%icc,	0x4 changed by convert2hboot
	fmuld8sux16	%f16,	%f5,	%f6
	fsrc1s	%f27,	%f22
	call	loop_702
	stw	%o3,	[%l7 + 0x40]
	fbule,a	%fcc3,	loop_703
	fmovrse	%l6,	%f17,	%f20
loop_702:
	ldd	[%l7 + 0x38],	%g0
	movre	%o7,	%o1,	%l4
loop_703:
	fmul8x16al	%f14,	%f9,	%f30
	fnegs	%f2,	%f0
	fabsd	%f6,	%f12
	fcmpgt32	%f4,	%f14,	%i7
	movre	%g6,	%l5,	%g7
	sdiv	%i4,	0x0720,	%i0
	srax	%g4,	%i5,	%i3
	bcc,a,pn	%icc,	loop_704
	fmovrdgz	%l3,	%f14,	%f12
	alignaddrl	%l0,	%g5,	%o5
	fone	%f4
loop_704:
	edge16l	%i2,	%i6,	%o0
	andcc	%l2,	0x0CEE,	%o6
	fandnot2	%f20,	%f4,	%f20
	ldsw	[%l7 + 0x30],	%o2
	fbge	%fcc3,	loop_705
	fcmpes	%fcc1,	%f3,	%f16
	nop 	! 	tsubcctv	%g2,	0x130C,	%i1 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
loop_705:
	edge16l	%g3,	%o4,	%o3
	fmovsl	%icc,	%f8,	%f25
	udivcc	%l6,	0x1363,	%l1
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
	membar	0x6C
	sdiv	%g1,	0x1678,	%o1
	addc	%o7,	0x09C6,	%l4
	ba,pn	%icc,	loop_706
	fmovsa	%icc,	%f2,	%f5
	fornot2	%f18,	%f16,	%f14
	fbne	%fcc1,	loop_707
loop_706:
	movgu	%xcc,	%g6,	%i7
	fmovsne	%icc,	%f3,	%f6
	edge16n	%l5,	%g7,	%i0
loop_707:
	fmovdleu	%xcc,	%f6,	%f1
	movvs	%icc,	%i4,	%g4
	movrgez	%i3,	0x122,	%l3
	smulcc	%l0,	%i5,	%o5
	umulcc	%g5,	0x18C5,	%i2
	bn,pt	%xcc,	loop_708
	membar	0x4F
	fmovsa	%icc,	%f7,	%f29
	smul	%i6,	0x1F7A,	%l2
loop_708:
	fble	%fcc1,	loop_709
	fmovs	%f20,	%f27
	nop 	! 	sir	0x10B9 changed by convert2hboot
	edge32l	%o0,	%o2,	%o6
loop_709:
	nop 	! 	tleu	%icc,	0x3 changed by convert2hboot
	fbule,a	%fcc1,	loop_710
	fornot1	%f24,	%f12,	%f18
	fbue,a	%fcc2,	loop_711
	sllx	%g2,	%i1,	%o4
loop_710:
	nop 	! 	taddcctv	%g3,	%o3,	%l6 changed by convert2hboot
	set	0x72, %i5
	nop	 ! 	ldsha	[%l7 + %i5] 0x04,	%l1 ASI use replaced by convert2hboot
loop_711:
	fpadd16	%f10,	%f6,	%f28
	movneg	%icc,	%o1,	%g1
	fmovrsgez	%l4,	%f14,	%f26
	andcc	%o7,	0x15BB,	%g6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x18,	%asi
	nop	 ! 	casa	[%l6] 0x18,	%l5,	%i7 ASI use replaced by convert2hboot
	bcc,a	loop_712
	fexpand	%f29,	%f6
	fmovdl	%xcc,	%f9,	%f4
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
loop_712:
	be,pt	%xcc,	loop_713
	andcc	%g7,	%i4,	%g4
	movn	%icc,	%i3,	%l3
	movge	%icc,	%l0,	%i0
loop_713:
	sllx	%o5,	%g5,	%i5
	fors	%f26,	%f7,	%f20
	fbu	%fcc2,	loop_714
	fmovdgu	%icc,	%f15,	%f23
	srl	%i6,	0x0E,	%l2
	fbuge,a	%fcc0,	loop_715
loop_714:
	fcmple16	%f4,	%f22,	%o0
	fmovd	%f18,	%f18
	subcc	%i2,	0x04A9,	%o2
loop_715:
	andncc	%g2,	%o6,	%o4
	fnegs	%f18,	%f13
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	fmovdg	%xcc,	%f15,	%f1
	fsrc1	%f8,	%f12
	movvs	%xcc,	%g3,	%o3
	array16	%l6,	%l1,	%o1
	andcc	%g1,	0x1C72,	%i1
	fmovrdgez	%l4,	%f2,	%f12
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	subc	%g6,	%l5,	%o7
	wr	%g0,	0x23,	%asi
	bn,a	loop_716
	movg	%xcc,	%g7,	%i4
	ldstub	[%l7 + 0x48],	%g4
	movl	%icc,	%i3,	%l3
loop_716:
	srlx	%l0,	0x08,	%i0
	membar	0x12
	edge32ln	%o5,	%i5,	%g5
	ldub	[%l7 + 0x2C],	%l2
	fnot2s	%f5,	%f3
	subcc	%i6,	%i2,	%o2
	wr	%g0,	0x11,	%asi
	brlez,a	%o0,	loop_717
	siam	0x3
	movneg	%icc,	%o6,	%o4
	fxnors	%f6,	%f15,	%f17
loop_717:
	sdiv	%o3,	0x0545,	%l6
	be,pt	%xcc,	loop_718
	array16	%g3,	%l1,	%o1
	ld	[%l7 + 0x40],	%f12
	fexpand	%f21,	%f12
loop_718:
	fmovrsgz	%g1,	%f31,	%f0
	subc	%l4,	%i1,	%l5
	movle	%xcc,	%g6,	%i7
	fpackfix	%f16,	%f2
	movvc	%xcc,	%o7,	%i4
	xorcc	%g4,	0x1CF4,	%g7
	fmovdleu	%icc,	%f26,	%f8
	udivcc	%l3,	0x1F8D,	%l0
	fandnot1	%f18,	%f18,	%f20
	edge16n	%i3,	%i0,	%o5
	addc	%g5,	%i5,	%l2
	xnor	%i6,	%o2,	%i2
	bge	loop_719
	addcc	%o0,	%o6,	%o4
	bpos,pt	%icc,	loop_720
	xor	%g2,	%l6,	%o3
loop_719:
	xorcc	%l1,	0x17E3,	%g3
	membar	0x5E
loop_720:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x04,	%asi
	set	0x10, %o6
	nop	 ! 	stxa	%l4,	[%l7 + %o6] 0x22 ASI use replaced by convert2hboot
	membar	#Sync
	std	%l4,	[%l7 + 0x20]
	bleu,pn	%icc,	loop_721
	fpmerge	%f10,	%f23,	%f26
	fmovdl	%icc,	%f21,	%f21
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
loop_721:
	ld	[%l7 + 0x20],	%f30
	sllx	%i1,	0x18,	%g6
	sethi	0x1E84,	%i7
	fmovrdlz	%o7,	%f2,	%f8
	andncc	%i4,	%g4,	%l3
	fone	%f10
	movrgz	%g7,	%i3,	%i0
	edge16l	%l0,	%o5,	%i5
	fbu,a	%fcc1,	loop_722
	nop 	! 	sir	0x15C5 changed by convert2hboot
	pdist	%f6,	%f2,	%f22
	nop 	! 	sir	0x0298 changed by convert2hboot
loop_722:
	xor	%l2,	%g5,	%i6
	array8	%o2,	%o0,	%i2
	fmovdleu	%xcc,	%f18,	%f1
	fmovrdlz	%o4,	%f28,	%f8
	orcc	%g2,	0x167D,	%o6
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	ldsw	[%l7 + 0x70],	%l6
	swap	[%l7 + 0x40],	%o3
	bn,a,pt	%xcc,	loop_723
	fmovrdgez	%l1,	%f8,	%f22
	sll	%o1,	0x0B,	%g1
	udivx	%l4,	0x03A3,	%l5
loop_723:
	udivcc	%g3,	0x04BF,	%g6
	orncc	%i1,	%i7,	%i4
	movneg	%icc,	%o7,	%l3
	fpsub32	%f18,	%f20,	%f4
	edge16ln	%g7,	%i3,	%g4
	fmovrsgez	%l0,	%f13,	%f12
	movrlez	%i0,	%o5,	%l2
	brgez	%g5,	loop_724
	fnors	%f19,	%f1,	%f14
	array16	%i5,	%o2,	%i6
	brlez	%i2,	loop_725
loop_724:
	sethi	0x03DF,	%o4
	nop 	! 	taddcc	%o0,	%g2,	%l6 changed by convert2hboot
	bg,a	%xcc,	loop_726
loop_725:
	movle	%xcc,	%o6,	%o3
	addc	%l1,	0x1C04,	%o1
	subcc	%l4,	0x0773,	%g1
loop_726:
	movl	%xcc,	%l5,	%g6
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	brgz	%g3,	loop_727
	movg	%icc,	%i1,	%i7
	wr	%g0,	0x19,	%asi
	sta	%f12,	[%l7 + 0x64] %asi
loop_727:
	lduw	[%l7 + 0x2C],	%o7
	fabss	%f29,	%f8
	movrne	%i4,	0x05D,	%l3
	nop 	! 	tcs	%xcc,	0x3 changed by convert2hboot
	alignaddrl	%g7,	%g4,	%i3
	nop 	! 	taddcc	%l0,	%i0,	%o5 changed by convert2hboot
	udivx	%l2,	0x0CF9,	%g5
	add	%o2,	%i5,	%i2
	fbg,a	%fcc0,	loop_728
	array8	%i6,	%o4,	%g2
	sll	%l6,	0x0A,	%o6
	ldx	[%l7 + 0x08],	%o0
loop_728:
	add	%l1,	%o1,	%l4
	fcmpgt32	%f28,	%f4,	%o3
	fmovspos	%xcc,	%f17,	%f17
	fcmple32	%f2,	%f20,	%l5
	nop 	! 	tleu	%icc,	0x7 changed by convert2hboot
	subcc	%g1,	%g6,	%g3
	andncc	%i1,	%o7,	%i4
	orncc	%l3,	0x1583,	%g7
	sdiv	%g4,	0x05CF,	%i3
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
	bpos,pt	%xcc,	loop_729
	srl	%l0,	0x02,	%i0
	edge16l	%i7,	%l2,	%o5
	xor	%g5,	%o2,	%i5
loop_729:
	nop 	! 	tsubcctv	%i2,	0x1A5B,	%o4 changed by convert2hboot
	fmul8x16	%f3,	%f24,	%f28
	fmovscs	%xcc,	%f0,	%f0
	fsrc1	%f6,	%f8
	fmovrslez	%i6,	%f2,	%f4
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
	fzeros	%f2
	andn	%l6,	0x0DCB,	%o6
	xorcc	%g2,	0x1B90,	%o0
	fbne	%fcc2,	loop_730
	fornot2s	%f12,	%f5,	%f12
	edge8	%l1,	%l4,	%o3
	movne	%xcc,	%o1,	%g1
loop_730:
	nop
	set	0x78, %l4
	nop	 ! 	prefetcha	[%l7 + %l4] 0x88,	 0x0 ASI use replaced by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba,a	%fcc0,	loop_731
	srax	%g3,	%i1,	%o7
	nop 	! 	tgu	%icc,	0x1 changed by convert2hboot
	edge16n	%g6,	%l3,	%i4
loop_731:
	and	%g7,	%g4,	%i3
	movre	%l0,	0x29A,	%i0
	nop
	set	0x44, %g5
	lduw	[%l7 + %g5],	%i7
	smulcc	%o5,	0x0FF2,	%l2
	fexpand	%f6,	%f2
	edge32l	%o2,	%g5,	%i2
	udivcc	%o4,	0x0A3C,	%i6
	subcc	%i5,	%l6,	%o6
	fpack16	%f22,	%f21
	mulx	%g2,	0x1D2B,	%l1
	sdivcc	%o0,	0x177D,	%l4
	fbug,a	%fcc3,	loop_732
	sllx	%o3,	%g1,	%l5
	movne	%icc,	%g3,	%o1
	fcmpes	%fcc0,	%f24,	%f4
loop_732:
	srax	%o7,	0x18,	%g6
	addcc	%i1,	0x0275,	%l3
	bpos,a	loop_733
	nop 	! 	taddcc	%i4,	%g7,	%g4 changed by convert2hboot
	fbul,a	%fcc3,	loop_734
	sdiv	%l0,	0x0146,	%i3
loop_733:
	bne,a,pn	%xcc,	loop_735
	subc	%i7,	0x153D,	%o5
loop_734:
	nop 	! 	tneg	%icc,	0x0 changed by convert2hboot
	movl	%icc,	%i0,	%o2
loop_735:
	srl	%g5,	%l2,	%o4
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
	sdivx	%i6,	0x1BF4,	%i2
	sdivx	%i5,	0x011A,	%l6
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	fmovdge	%xcc,	%f25,	%f23
	edge32ln	%o6,	%g2,	%l1
	movrne	%l4,	%o3,	%g1
	bcc	loop_736
	pdist	%f30,	%f26,	%f0
	fmul8sux16	%f0,	%f6,	%f24
	alignaddrl	%l5,	%o0,	%g3
loop_736:
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	nop 	! 	taddcc	%o7,	0x0244,	%o1 changed by convert2hboot
	fmovs	%f28,	%f7
	fpsub32s	%f6,	%f22,	%f3
	bcs,pt	%xcc,	loop_737
	fnot1s	%f19,	%f24
	fbul	%fcc2,	loop_738
	fmovrdlz	%g6,	%f2,	%f8
loop_737:
	fornot1	%f2,	%f8,	%f20
	nop 	! 	tsubcc	%l3,	%i4,	%g7 changed by convert2hboot
loop_738:
	fxnors	%f13,	%f31,	%f26
	set	0x50, %l1
	nop	 ! 	ldswa	[%l7 + %l1] 0x19,	%i1 ASI use replaced by convert2hboot
	edge8	%g4,	%i3,	%l0
	ble,a,pn	%xcc,	loop_739
	fcmpgt32	%f30,	%f20,	%i7
	brnz	%i0,	loop_740
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
loop_739:
	nop 	! 	tl	%xcc,	0x7 changed by convert2hboot
	movge	%icc,	%o2,	%o5
loop_740:
	brlez,a	%l2,	loop_741
	array16	%o4,	%g5,	%i2
	orcc	%i5,	0x029C,	%l6
	nop 	! 	sir	0x061F changed by convert2hboot
loop_741:
	nop 	! 	tle	%icc,	0x6 changed by convert2hboot
	subcc	%i6,	0x10C4,	%o6
	ba,pt	%xcc,	loop_742
	ldd	[%l7 + 0x68],	%l0
	edge32ln	%g2,	%l4,	%o3
	bgu	%icc,	loop_743
loop_742:
	fmul8ulx16	%f28,	%f4,	%f14
	bn	loop_744
	smulcc	%g1,	0x1099,	%o0
loop_743:
	movg	%xcc,	%l5,	%g3
	sub	%o7,	%g6,	%o1
loop_744:
	fcmple32	%f10,	%f2,	%i4
	fsrc1s	%f28,	%f17
	edge8	%g7,	%l3,	%g4
	edge16l	%i3,	%i1,	%l0
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	edge16l	%i7,	%i0,	%o5
	umul	%l2,	%o4,	%o2
	bneg,a,pn	%xcc,	loop_745
	ldub	[%l7 + 0x64],	%i2
	srlx	%i5,	%l6,	%g5
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
loop_745:
	andn	%i6,	0x0DD9,	%o6
	edge8n	%g2,	%l1,	%l4
	nop
	setx	loop_746,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fnegd	%f26,	%f26
	movcs	%icc,	%o3,	%g1
	fbe,a	%fcc3,	loop_747
loop_746:
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
	edge32ln	%o0,	%g3,	%o7
	addcc	%g6,	%o1,	%i4
loop_747:
	array16	%l5,	%g7,	%g4
	fmovrdne	%i3,	%f10,	%f14
	movrgez	%l3,	%l0,	%i1
	ble,a	%icc,	loop_748
	udivx	%i0,	0x1F24,	%o5
	umul	%l2,	0x1F25,	%i7
	movvc	%icc,	%o2,	%i2
loop_748:
	nop
	set	0x48, %o7
	nop	 ! 	prefetcha	[%l7 + %o7] 0x80,	 0x3 ASI use replaced by convert2hboot
	array16	%l6,	%o4,	%i6
	set	0x08, %l0
	nop	 ! 	stda	%g4,	[%l7 + %l0] 0x80 ASI use replaced by convert2hboot
	ldstub	[%l7 + 0x63],	%o6
	bl,a,pt	%icc,	loop_749
	sdivx	%l1,	0x0C5A,	%l4
	edge16	%g2,	%o3,	%o0
	edge8n	%g3,	%o7,	%g6
loop_749:
	fzeros	%f27
	ldub	[%l7 + 0x64],	%g1
	nop
	setx	loop_750,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fcmpne32	%f6,	%f10,	%o1
	bgu,a,pt	%xcc,	loop_751
	ldx	[%l7 + 0x58],	%l5
loop_750:
	nop 	! 	tl	%icc,	0x1 changed by convert2hboot
	xnor	%g7,	%i4,	%i3
loop_751:
	nop
	set	0x0B, %i2
	nop	 ! 	stba	%g4,	[%l7 + %i2] 0x14 ASI use replaced by convert2hboot
	sdiv	%l0,	0x1D8D,	%l3
	set	0x10, %l3
	nop	 ! 	stxa	%i1,	[%g0 + %l3] 0x20 ASI use replaced by convert2hboot
	subc	%i0,	0x18E4,	%o5
	edge16ln	%i7,	%l2,	%i2
	movne	%xcc,	%o2,	%l6
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x04,	%asi
	nop	 ! 	casa	[%l6] 0x04,	%o4,	%i6 ASI use replaced by convert2hboot
	bne,a	loop_752
	edge16l	%i5,	%o6,	%l1
	call	loop_753
	sth	%l4,	[%l7 + 0x0C]
loop_752:
	udivx	%g2,	0x001B,	%g5
	andncc	%o0,	%o3,	%g3
loop_753:
	movrlz	%o7,	%g6,	%o1
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l5,	%g1,	%g7
	fmovrdne	%i3,	%f4,	%f24
	fpadd32s	%f7,	%f4,	%f20
	edge32	%i4,	%g4,	%l0
	edge16n	%l3,	%i0,	%i1
	bshuffle	%f14,	%f14,	%f18
	popc	%i7,	%o5
	movre	%l2,	%o2,	%l6
	nop 	! 	taddcc	%o4,	%i2,	%i5 changed by convert2hboot
	fnot1	%f20,	%f22
	movge	%icc,	%o6,	%l1
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	fmovsne	%icc,	%f6,	%f0
	brgz	%i6,	loop_754
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
	fbue,a	%fcc3,	loop_755
loop_754:
	fxnor	%f8,	%f20,	%f20
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
	sdivx	%l4,	0x137C,	%g2
loop_755:
	movrlz	%o0,	0x32E,	%g5
	for	%f22,	%f18,	%f0
	be,a,pn	%icc,	loop_756
	nop 	! 	taddcc	%g3,	%o3,	%o7 changed by convert2hboot
	stx	%o1,	[%l7 + 0x40]
	fmovdge	%icc,	%f31,	%f13
loop_756:
	nop 	! 	tl	%icc,	0x4 changed by convert2hboot
	fcmpne16	%f16,	%f12,	%l5
	movle	%xcc,	%g1,	%g6
	fexpand	%f30,	%f0
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
	nop
	setx loop_757, %l0, %l1
	jmpl %l1, %i3
	mulscc	%g7,	%g4,	%i4
	umulcc	%l0,	0x00ED,	%i0
	fandnot1	%f18,	%f14,	%f26
loop_757:
	nop 	! 	tsubcctv	%l3,	0x1756,	%i7 changed by convert2hboot
	mulscc	%i1,	%l2,	%o2
	stw	%l6,	[%l7 + 0x3C]
	fmovdpos	%icc,	%f17,	%f0
	fpack32	%f22,	%f0,	%f28
	sethi	0x1288,	%o5
	or	%o4,	0x1165,	%i2
	mulscc	%i5,	%l1,	%i6
	fornot1	%f4,	%f2,	%f16
	fbule,a	%fcc2,	loop_758
	fba,a	%fcc3,	loop_759
	fnegd	%f2,	%f0
	std	%o6,	[%l7 + 0x08]
loop_758:
	movleu	%icc,	%g2,	%l4
loop_759:
	nop 	! 	tsubcctv	%o0,	0x191E,	%g3 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f3,	%f13,	%f14
	ldsw	[%l7 + 0x2C],	%o3
	edge32ln	%o7,	%g5,	%l5
	fmovdn	%xcc,	%f21,	%f23
	edge16n	%g1,	%g6,	%i3
	fcmpgt16	%f6,	%f24,	%g7
	flush	%l7 + 0x64
	array16	%g4,	%o1,	%i4
	xnor	%i0,	0x1518,	%l3
	edge32ln	%i7,	%l0,	%l2
	umul	%i1,	0x0BF3,	%l6
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	set	0x14, %g7
	nop	 ! 	swapa	[%l7 + %g7] 0x89,	%o5 ASI use replaced by convert2hboot
	wr	%g0,	0x81,	%asi
	popc	%o4,	%i2
	bgu,a,pt	%icc,	loop_760
	edge32l	%i5,	%i6,	%l1
	membar	0x4E
	edge32ln	%g2,	%l4,	%o0
loop_760:
	fpsub32s	%f27,	%f20,	%f24
	nop 	! 	taddcctv	%g3,	%o6,	%o7 changed by convert2hboot
	movleu	%icc,	%g5,	%l5
	nop 	! 	taddcc	%o3,	0x14F0,	%g1 changed by convert2hboot
	umul	%g6,	0x111F,	%g7
	fbne,a	%fcc3,	loop_761
	movn	%icc,	%i3,	%o1
	array8	%i4,	%g4,	%l3
	std	%i6,	[%l7 + 0x68]
loop_761:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i0,	%l0,	%l2
	ld	[%l7 + 0x08],	%f4
	fmovsvs	%xcc,	%f20,	%f31
	fblg	%fcc0,	loop_762
	sra	%l6,	0x04,	%o5
	edge32	%i1,	%o4,	%o2
	edge8l	%i5,	%i2,	%i6
loop_762:
	mulx	%g2,	0x0D8D,	%l1
	fmovdvs	%xcc,	%f9,	%f25
	fblg,a	%fcc0,	loop_763
	edge32n	%o0,	%l4,	%g3
	fsrc1	%f12,	%f2
	nop 	! 	tsubcctv	%o7,	0x0622,	%o6 changed by convert2hboot
loop_763:
	sdivcc	%l5,	0x1AB1,	%g5
	or	%g1,	%o3,	%g6
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	movrlz	%g7,	%o1,	%i3
	srlx	%g4,	%l3,	%i7
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	nop 	! 	taddcc	%i4,	%i0,	%l2 changed by convert2hboot
	sdiv	%l6,	0x148D,	%l0
	fmovsleu	%xcc,	%f8,	%f29
	movcs	%xcc,	%o5,	%i1
	subccc	%o4,	%i5,	%i2
	smulcc	%i6,	%o2,	%g2
	ldd	[%l7 + 0x20],	%l0
	addccc	%l4,	0x0036,	%o0
	fmovrslez	%o7,	%f27,	%f27
	std	%g2,	[%l7 + 0x28]
	set	0x38, %l2
	nop	 ! 	prefetcha	[%l7 + %l2] 0x81,	 0x3 ASI use replaced by convert2hboot
	be,a,pt	%icc,	loop_764
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g5,	%g1,	%o6
	nop 	! 	tcs	%icc,	0x3 changed by convert2hboot
loop_764:
	srax	%o3,	0x07,	%g7
	mulx	%g6,	%i3,	%g4
	add	%o1,	0x1121,	%i7
	movrgz	%i4,	%l3,	%l2
	sth	%l6,	[%l7 + 0x38]
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
	edge8l	%i0,	%l0,	%i1
	srlx	%o4,	0x0D,	%i5
	udivcc	%i2,	0x0DE3,	%o5
	brlz,a	%i6,	loop_765
	brgez,a	%g2,	loop_766
	lduh	[%l7 + 0x3E],	%o2
	edge8n	%l1,	%o0,	%o7
loop_765:
	nop 	! 	tsubcc	%g3,	%l4,	%g5 changed by convert2hboot
loop_766:
	ldd	[%l7 + 0x78],	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f26
	edge16	%g1,	%l5,	%o6
	or	%o3,	%g7,	%i3
	set	0x48, %l6
	nop	 ! 	stda	%g6,	[%l7 + %l6] 0x89 ASI use replaced by convert2hboot
	bcs,pn	%icc,	loop_767
	nop 	! 	te	%xcc,	0x5 changed by convert2hboot
	fmovsleu	%icc,	%f10,	%f20
	edge8l	%g4,	%i7,	%o1
loop_767:
	nop
	set	0x34, %i3
	nop	 ! 	swapa	[%l7 + %i3] 0x0c,	%l3 ASI use replaced by convert2hboot
	fbl	%fcc3,	loop_768
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
	std	%i4,	[%l7 + 0x40]
	fnand	%f10,	%f16,	%f30
loop_768:
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
	wr	%g0,	0x80,	%asi
	andcc	%l2,	%i0,	%i1
	subc	%l0,	0x157E,	%o4
	nop
	set	0x72, %o0
	lduh	[%l7 + %o0],	%i5
	sra	%i2,	0x1C,	%o5
	bcc,pn	%xcc,	loop_769
	mova	%icc,	%i6,	%o2
	udiv	%g2,	0x1CCC,	%o0
	orncc	%o7,	0x1B4C,	%g3
loop_769:
	movl	%icc,	%l4,	%l1
	fsrc2	%f24,	%f8
	fbo,a	%fcc2,	loop_770
	xorcc	%g5,	%l5,	%o6
	wr	%g0,	0x10,	%asi
loop_770:
	bge,a,pt	%icc,	loop_771
	or	%g1,	0x18E3,	%g7
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	nop 	! 	sir	0x0184 changed by convert2hboot
loop_771:
	fbuge	%fcc3,	loop_772
	prefetch	[%l7 + 0x70],	 0x0
	fnegs	%f8,	%f19
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
loop_772:
	movvc	%icc,	%i3,	%o3
	fmovrsgez	%g6,	%f29,	%f22
	subcc	%g4,	%o1,	%i7
	brz	%i4,	loop_773
	edge8	%l3,	%l6,	%i0
	fornot2s	%f5,	%f17,	%f18
	srax	%i1,	0x04,	%l2
loop_773:
	ble	loop_774
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
	ldsb	[%l7 + 0x76],	%l0
	nop 	! 	tgu	%xcc,	0x6 changed by convert2hboot
loop_774:
	call	loop_775
	edge16ln	%o4,	%i5,	%i2
	wr	%g0,	0x80,	%asi
loop_775:
	std	%f28,	[%l7 + 0x58]
	fmovdl	%xcc,	%f0,	%f9
	nop 	! 	tcc	%xcc,	0x0 changed by convert2hboot
	wr	%g0,	0x04,	%asi
	bge,pn	%icc,	loop_776
	fba,a	%fcc0,	loop_777
	fmul8sux16	%f14,	%f4,	%f20
	sdiv	%i6,	0x05B0,	%o0
loop_776:
	ldd	[%l7 + 0x68],	%g2
loop_777:
	movvs	%icc,	%o7,	%g3
	fmovspos	%xcc,	%f19,	%f23
	nop 	! 	sir	0x06A9 changed by convert2hboot
	fbue,a	%fcc3,	loop_778
	nop 	! 	tneg	%icc,	0x1 changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	umulcc	%l1,	%l4,	%l5
loop_778:
	subcc	%g5,	0x1547,	%o6
	popc	%g7,	%g1
	fpackfix	%f24,	%f22
	fabsd	%f22,	%f14
	movne	%icc,	%o3,	%i3
	subcc	%g4,	%g6,	%o1
	wr	%g0,	0x80,	%asi
	edge8l	%l3,	%i7,	%i0
	nop 	! 	sir	0x0904 changed by convert2hboot
	edge32n	%l6,	%l2,	%i1
	set	0x60, %g4
	nop	 ! 	lduwa	[%l7 + %g4] 0x81,	%l0 ASI use replaced by convert2hboot
	std	%i4,	[%l7 + 0x28]
	sub	%i2,	0x0D82,	%o5
	fmuld8ulx16	%f14,	%f0,	%f16
	xnorcc	%o2,	0x18E9,	%o4
	sllx	%o0,	0x15,	%i6
	sra	%g2,	%o7,	%g3
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%l4
	xnor	%l5,	%l1,	%g5
	fbul	%fcc1,	loop_779
	fsrc1s	%f17,	%f4
	movne	%xcc,	%g7,	%g1
	ble,pn	%xcc,	loop_780
loop_779:
	mulscc	%o3,	%i3,	%o6
	nop 	! 	tg	%xcc,	0x4 changed by convert2hboot
	array32	%g4,	%o1,	%i4
loop_780:
	xnor	%l3,	0x07B0,	%g6
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
	umul	%i0,	0x12AF,	%l6
	movre	%i7,	%l2,	%l0
	movrgz	%i5,	0x188,	%i1
	wr	%g0,	0x80,	%asi
	fmovdgu	%icc,	%f26,	%f6
	movrne	%o5,	%o4,	%o2
	movgu	%icc,	%o0,	%g2
	edge16l	%i6,	%o7,	%l4
	std	%g2,	[%l7 + 0x30]
	andcc	%l5,	%l1,	%g7
	edge32n	%g5,	%o3,	%i3
	fnot2	%f8,	%f20
	andncc	%g1,	%g4,	%o6
	mova	%xcc,	%i4,	%o1
	subc	%l3,	%g6,	%i0
	brgz,a	%i7,	loop_781
	fpsub16	%f20,	%f26,	%f18
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_781:
	fbuge,a	%fcc1,	loop_782
	fmovrdne	%l2,	%f2,	%f14
	fcmpgt32	%f6,	%f30,	%l6
	edge16	%i5,	%i1,	%l0
loop_782:
	fmovrde	%i2,	%f26,	%f18
	fexpand	%f30,	%f20
	brgez,a	%o4,	loop_783
	umul	%o5,	%o2,	%o0
	faligndata	%f14,	%f20,	%f8
	fbn	%fcc3,	loop_784
loop_783:
	edge16ln	%g2,	%o7,	%l4
	movrne	%i6,	%l5,	%g3
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
loop_784:
	and	%l1,	%g7,	%o3
	sdiv	%g5,	0x1FCB,	%g1
	brgez	%g4,	loop_785
	fmovrdgez	%o6,	%f26,	%f2
	fmuld8ulx16	%f20,	%f26,	%f2
	fexpand	%f23,	%f16
loop_785:
	fmovrsne	%i3,	%f19,	%f24
	ldub	[%l7 + 0x71],	%i4
	edge32	%o1,	%l3,	%i0
	ldd	[%l7 + 0x20],	%i6
	alignaddrl	%g6,	%l2,	%l6
	wr	%g0,	0xe3,	%asi
	membar	#Sync
	addccc	%l0,	0x0CA9,	%i2
	fbu	%fcc1,	loop_786
	smulcc	%i5,	0x00D9,	%o5
	alignaddr	%o2,	%o4,	%o0
	xnorcc	%g2,	0x1B09,	%o7
loop_786:
	brz	%i6,	loop_787
	fmovsn	%xcc,	%f22,	%f0
	xor	%l5,	0x1F63,	%l4
	fbuge,a	%fcc2,	loop_788
loop_787:
	ldstub	[%l7 + 0x70],	%l1
	stx	%g3,	[%l7 + 0x10]
	nop 	! 	taddcctv	%o3,	0x1A0A,	%g5 changed by convert2hboot
loop_788:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x18] %asi,	%f5
	edge32ln	%g7,	%g4,	%g1
	smul	%o6,	%i4,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,pn	%xcc,	loop_789
	fbne,a	%fcc3,	loop_790
	fpsub32	%f2,	%f24,	%f12
	udivx	%o1,	0x1FEA,	%l3
loop_789:
	fandnot1s	%f16,	%f8,	%f30
loop_790:
	nop
	membar	#Sync
	set	0x40, %g3
	nop	 ! 	ldda	[%l7 + %g3] 0xf0,	%f16 ASI use replaced by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i0,	0x0EB4,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i7,	%l6,	%i1
	movpos	%xcc,	%l2,	%i2
	fpadd16s	%f15,	%f22,	%f31
	edge32n	%i5,	%o5,	%l0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	xnorcc	%g2,	0x09E4,	%o7
	wr	%g0,	0x04,	%asi
	mova	%icc,	%l5,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_791, %l0, %l1
	jmpl %l1, %l1
	nop 	! 	tl	%xcc,	0x4 changed by convert2hboot
	andcc	%l4,	0x1F21,	%o3
	movrlez	%g5,	%g7,	%g4
loop_791:
	nop
	set	0x1B, %o5
	stb	%g1,	[%l7 + %o5]
	popc	0x0A71,	%o6
	fsrc2	%f24,	%f24
	movle	%icc,	%g3,	%i3
	ld	[%l7 + 0x64],	%f25
	bcs,a	%xcc,	loop_792
	fmovd	%f28,	%f16
	nop 	! 	tpos	%xcc,	0x4 changed by convert2hboot
	ldsb	[%l7 + 0x11],	%o1
loop_792:
	umul	%l3,	%i4,	%i0
	set	0x1F, %g2
	nop	 ! 	lduba	[%l7 + %g2] 0x04,	%i7 ASI use replaced by convert2hboot
	fble	%fcc2,	loop_793
	nop 	! 	tle	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tsubcctv	%g6,	%i1,	%l6 changed by convert2hboot
	xnorcc	%l2,	%i5,	%o5
loop_793:
	nop
	set	0x45, %g6
	nop	 ! 	stba	%l0,	[%l7 + %g6] 0x81 ASI use replaced by convert2hboot
	sub	%o4,	%i2,	%g2
	fcmpeq16	%f16,	%f22,	%o7
	array32	%o2,	%l5,	%i6
	fmul8x16au	%f4,	%f11,	%f28
	movle	%xcc,	%o0,	%l1
	nop 	! 	tvc	%icc,	0x2 changed by convert2hboot
	fcmple32	%f14,	%f20,	%l4
	subcc	%o3,	%g5,	%g7
	nop
	setx	loop_794,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	taddcc	%g1,	%o6,	%g4 changed by convert2hboot
	xnor	%i3,	%g3,	%l3
	fpadd32	%f14,	%f8,	%f24
loop_794:
	movvc	%icc,	%i4,	%i0
	movvc	%xcc,	%o1,	%g6
	swap	[%l7 + 0x4C],	%i7
	edge16n	%l6,	%l2,	%i5
	edge16n	%i1,	%l0,	%o4
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	fexpand	%f4,	%f4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x2C] %asi,	%f16
	set	0x40, %o1
	nop	 ! 	stda	%f0,	[%l7 + %o1] 0x1e ASI use replaced by convert2hboot
	membar	#Sync
	movneg	%icc,	%i2,	%o5
	fcmps	%fcc1,	%f18,	%f0
	array16	%g2,	%o7,	%o2
	nop 	! 	tle	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
	movvs	%xcc,	%i6,	%l5
	movg	%xcc,	%o0,	%l4
	nop 	! 	tl	%xcc,	0x6 changed by convert2hboot
	fmovsvc	%icc,	%f0,	%f4
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	fmovsa	%icc,	%f13,	%f1
	nop 	! 	tcs	%xcc,	0x4 changed by convert2hboot
	movrgz	%o3,	0x0E0,	%g5
	sdivx	%g7,	0x05DB,	%g1
	nop 	! 	taddcctv	%l1,	0x0AF2,	%g4 changed by convert2hboot
	edge8	%i3,	%g3,	%o6
	fcmpes	%fcc0,	%f6,	%f1
	bge,a,pt	%xcc,	loop_795
	movcc	%xcc,	%l3,	%i4
	xnor	%o1,	%i0,	%i7
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
loop_795:
	movcc	%xcc,	%g6,	%l6
	fbuge,a	%fcc1,	loop_796
	movrne	%i5,	%l2,	%l0
	subcc	%i1,	0x0FDB,	%o4
	nop
	setx loop_797, %l0, %l1
	jmpl %l1, %i2
loop_796:
	fmovdpos	%icc,	%f25,	%f31
	xorcc	%o5,	0x1F55,	%g2
	or	%o7,	0x1B59,	%i6
loop_797:
	ldsb	[%l7 + 0x44],	%l5
	nop 	! 	taddcc	%o2,	%l4,	%o3 changed by convert2hboot
	fbl	%fcc0,	loop_798
	brz,a	%o0,	loop_799
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
	fcmpeq16	%f22,	%f18,	%g5
loop_798:
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
loop_799:
	fmovrsgz	%g7,	%f22,	%f27
	wr	%g0,	0x0c,	%asi
	andcc	%l1,	%g4,	%g3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x11,	%asi
	nop	 ! 	casxa	[%l6] 0x11,	%o6,	%i3 ASI use replaced by convert2hboot
	nop 	! 	tcs	%xcc,	0x5 changed by convert2hboot
	fmovdne	%xcc,	%f24,	%f31
	or	%l3,	%i4,	%i0
	brgez	%o1,	loop_800
	movge	%xcc,	%i7,	%l6
	andcc	%i5,	%l2,	%g6
	edge8n	%i1,	%o4,	%l0
loop_800:
	movleu	%xcc,	%i2,	%o5
	fcmpne16	%f20,	%f20,	%g2
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	movgu	%icc,	%i6,	%l5
	movrlz	%o7,	0x3DE,	%o2
	udivx	%l4,	0x17FD,	%o3
	edge32	%o0,	%g7,	%g1
	ldstub	[%l7 + 0x18],	%l1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	stw	%g3,	[%l7 + 0x44]
	fbuge	%fcc3,	loop_801
	edge8n	%o6,	%i3,	%l3
	movrlez	%i4,	0x307,	%o1
	sdivcc	%i7,	0x1687,	%l6
loop_801:
	fandnot2	%f14,	%f0,	%f0
	brz,a	%i5,	loop_802
	brnz,a	%i0,	loop_803
	movpos	%xcc,	%l2,	%g6
	fcmple16	%f0,	%f16,	%o4
loop_802:
	alignaddr	%l0,	%i2,	%o5
loop_803:
	fbug,a	%fcc2,	loop_804
	fbule	%fcc2,	loop_805
	movn	%icc,	%g2,	%i6
	faligndata	%f28,	%f6,	%f26
loop_804:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x64] %asi,	%f20
loop_805:
	udivx	%i1,	0x0428,	%o7
	set	0x70, %l5
	nop	 ! 	stba	%l5,	[%l7 + %l5] 0xe3 ASI use replaced by convert2hboot
	membar	#Sync
	std	%f30,	[%l7 + 0x20]
	srlx	%o2,	%o3,	%l4
	mova	%xcc,	%o0,	%g7
	fmovrsne	%g1,	%f1,	%f25
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g4,	%g5,	%l1
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	mova	%icc,	%g3,	%o6
	udivx	%l3,	0x0B87,	%i3
	nop 	! 	tg	%xcc,	0x0 changed by convert2hboot
	movl	%icc,	%o1,	%i7
	sdivcc	%l6,	0x0160,	%i5
	mulx	%i0,	%i4,	%g6
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	movcc	%icc,	%o4,	%l2
	fmuld8ulx16	%f1,	%f21,	%f16
	fnot1	%f22,	%f12
	bvs,pn	%icc,	loop_806
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%i2,	%l0
	set	0x40, %i4
	nop	 ! 	stda	%f0,	[%l7 + %i4] 0x16 ASI use replaced by convert2hboot
	membar	#Sync
loop_806:
	nop
	membar	#Sync
	set	0x40, %i6
	nop	 ! 	ldda	[%l7 + %i6] 0xf8,	%f0 ASI use replaced by convert2hboot
	call	loop_807
	fsrc1s	%f30,	%f12
	bvc,a,pt	%icc,	loop_808
	nop 	! 	sir	0x174C changed by convert2hboot
loop_807:
	fcmpes	%fcc3,	%f23,	%f4
	udiv	%o5,	0x03F1,	%g2
loop_808:
	nop
	setx loop_809, %l0, %l1
	jmpl %l1, %i1
	brlz	%o7,	loop_810
	nop 	! 	tsubcctv	%l5,	0x0FA2,	%i6 changed by convert2hboot
	nop
	setx	loop_811,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_809:
	membar	0x03
loop_810:
	fbue	%fcc3,	loop_812
	sub	%o3,	%o2,	%o0
loop_811:
	nop
	wr	%g0,	0x19,	%asi
loop_812:
	movre	%g1,	%g4,	%l4
	sethi	0x0914,	%l1
	ld	[%l7 + 0x4C],	%f12
	srl	%g5,	0x08,	%o6
	wr	%g0,	0x80,	%asi
	fsrc1	%f8,	%f24
	alignaddr	%i3,	%g3,	%i7
	wr	%g0,	0x80,	%asi
	ld	[%l7 + 0x3C],	%f16
	subc	%l6,	0x1222,	%i5
	nop 	! 	tsubcc	%i4,	0x1974,	%g6 changed by convert2hboot
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	movl	%xcc,	%o4,	%i0
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	wr	%g0,	0x88,	%asi
	bpos	loop_813
	move	%xcc,	%l0,	%o5
	brgz,a	%g2,	loop_814
	nop 	! 	tle	%xcc,	0x2 changed by convert2hboot
loop_813:
	edge8l	%i2,	%o7,	%i1
	nop 	! 	tl	%icc,	0x6 changed by convert2hboot
loop_814:
	fbu	%fcc0,	loop_815
	fornot2s	%f24,	%f16,	%f0
	subcc	%i6,	%l5,	%o2
	and	%o3,	0x14F3,	%g7
loop_815:
	movneg	%icc,	%g1,	%o0
	sllx	%g4,	%l1,	%l4
	array16	%g5,	%l3,	%o6
	addcc	%i3,	0x04F0,	%g3
	fblg	%fcc1,	loop_816
	sth	%i7,	[%l7 + 0x16]
	set	0x11, %i7
	nop	 ! 	ldstuba	[%l7 + %i7] 0x18,	%l6 ASI use replaced by convert2hboot
loop_816:
	andn	%o1,	0x185F,	%i4
	fbule	%fcc1,	loop_817
	edge8ln	%i5,	%g6,	%o4
	movne	%icc,	%i0,	%l0
	nop 	! 	tsubcc	%o5,	%g2,	%i2 changed by convert2hboot
loop_817:
	flush	%l7 + 0x40
	nop
	set	0x18, %o2
	std	%f16,	[%l7 + %o2]
	fcmpgt32	%f22,	%f10,	%l2
	fmovdgu	%xcc,	%f0,	%f29
	nop 	! 	taddcc	%o7,	%i6,	%i1 changed by convert2hboot
	fpsub16	%f14,	%f20,	%f12
	fnot2s	%f31,	%f17
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
	orcc	%l5,	%o3,	%g7
	nop 	! 	taddcc	%g1,	%o2,	%o0 changed by convert2hboot
	xnor	%g4,	%l1,	%l4
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	wr	%g0,	0x88,	%asi
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	fmovdpos	%xcc,	%f28,	%f30
	edge8l	%g5,	%i3,	%o6
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
	andcc	%g3,	0x164D,	%l6
	edge16n	%i7,	%o1,	%i5
	andn	%g6,	%o4,	%i0
	nop 	! 	taddcctv	%i4,	0x1F1E,	%o5 changed by convert2hboot
	bvc,a,pt	%icc,	loop_818
	movrlz	%l0,	0x1F0,	%i2
	movre	%g2,	0x37F,	%o7
	movge	%xcc,	%i6,	%i1
loop_818:
	orncc	%l5,	0x09D6,	%o3
	edge8n	%l2,	%g1,	%o2
	xnor	%g7,	0x1440,	%o0
	movge	%icc,	%g4,	%l1
	fmovrde	%l4,	%f2,	%f4
	fcmped	%fcc3,	%f12,	%f26
	movl	%xcc,	%l3,	%i3
	srax	%g5,	%g3,	%o6
	udivcc	%l6,	0x0959,	%i7
	movg	%icc,	%o1,	%i5
	fbuge	%fcc1,	loop_819
	brlz,a	%g6,	loop_820
	sth	%i0,	[%l7 + 0x48]
loop_819:
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
loop_820:
	movrgz	%o4,	%o5,	%i4
	fpadd32	%f16,	%f20,	%f10
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
	nop 	! 	ta	%xcc,	0x7 changed by convert2hboot
	bneg,pt	%icc,	loop_821
	fpackfix	%f20,	%f19
	udivx	%i2,	0x0DBA,	%l0
	udiv	%g2,	0x1F5C,	%o7
loop_821:
	fmul8x16al	%f12,	%f19,	%f20
	prefetch	[%l7 + 0x5C],	 0x3
	bvc,a	loop_822
	nop 	! 	tge	%icc,	0x3 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x54] %asi,	%f1
loop_822:
	pdist	%f12,	%f30,	%f2
	mulscc	%i6,	%i1,	%l5
	set	0x40, %i0
	nop	 ! 	stda	%f0,	[%l7 + %i0] 0x1f ASI use replaced by convert2hboot
	membar	#Sync
	bn,a,pn	%xcc,	loop_823
	subc	%o3,	%g1,	%o2
	movvs	%icc,	%g7,	%l2
	movneg	%icc,	%o0,	%g4
loop_823:
	alignaddr	%l1,	%l4,	%i3
	fmovdl	%icc,	%f29,	%f3
	fblg,a	%fcc3,	loop_824
	bpos,a	loop_825
	fmovsl	%icc,	%f6,	%f1
	movn	%icc,	%g5,	%g3
loop_824:
	fbe,a	%fcc2,	loop_826
loop_825:
	edge16l	%l3,	%o6,	%l6
	brgz,a	%o1,	loop_827
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
loop_826:
	fmovscc	%icc,	%f30,	%f7
	sdivx	%i7,	0x0AA7,	%i5
loop_827:
	movcc	%icc,	%i0,	%g6
	nop 	! 	tle	%xcc,	0x3 changed by convert2hboot
	fandnot2s	%f20,	%f3,	%f27
	ldx	[%l7 + 0x60],	%o5
	alignaddrl	%i4,	%o4,	%i2
	wr	%g0,	0x81,	%asi
	movvc	%icc,	%g2,	%i6
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	addc	%i1,	%l5,	%o3
	edge16n	%g1,	%o7,	%g7
	edge32l	%l2,	%o0,	%g4
	fnors	%f2,	%f7,	%f27
	fmovse	%icc,	%f19,	%f3
	umulcc	%o2,	%l1,	%i3
	sdivcc	%g5,	0x1971,	%l4
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	fmovrslz	%l3,	%f1,	%f2
	edge32l	%g3,	%l6,	%o6
	set	0x74, %i1
	nop	 ! 	swapa	[%l7 + %i1] 0x80,	%i7 ASI use replaced by convert2hboot
	nop
	setx	loop_828,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	ldsh	[%l7 + 0x0E],	%o1
	mulx	%i5,	0x1B49,	%i0
	faligndata	%f26,	%f12,	%f14
loop_828:
	fmul8x16al	%f9,	%f22,	%f8
	andn	%o5,	0x1490,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	membar	0x2A
	edge8ln	%o4,	%i2,	%g6
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
	movrgz	%g2,	0x0F0,	%l0
	fandnot2s	%f4,	%f21,	%f27
	fbul,a	%fcc3,	loop_829
	edge8	%i1,	%l5,	%i6
	sdiv	%o3,	0x1075,	%g1
	sethi	0x13D4,	%g7
loop_829:
	movrlez	%o7,	%l2,	%o0
	edge16ln	%g4,	%o2,	%i3
	fble,a	%fcc0,	loop_830
	edge16	%l1,	%l4,	%l3
	xorcc	%g3,	0x1B29,	%g5
loop_830:
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
	edge16	%o6,	%l6,	%i7
	alignaddr	%i5,	%i0,	%o5
	movpos	%xcc,	%o1,	%i4
	array8	%o4,	%g6,	%i2
	fnot2s	%f19,	%f1
	fmul8x16al	%f2,	%f12,	%f20
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
	xnorcc	%l0,	%i1,	%g2
	sdivcc	%i6,	0x09EA,	%l5
	fnot2s	%f29,	%f13
	add	%l7,	0x78,	%l6
	wr	%g0,	0x10,	%asi
	nop	 ! 	casxa	[%l6] 0x10,	%o3,	%g1 ASI use replaced by convert2hboot
	fmovdvs	%xcc,	%f24,	%f28
	srlx	%g7,	0x10,	%l2
	ldsb	[%l7 + 0x63],	%o7
	sll	%o0,	%o2,	%g4
	edge16	%i3,	%l1,	%l3
	movre	%g3,	%g5,	%o6
	nop 	! 	sir	0x1C99 changed by convert2hboot
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	move	%xcc,	%l4,	%l6
	movvc	%xcc,	%i5,	%i7
	fmovsge	%xcc,	%f28,	%f6
	ldx	[%l7 + 0x70],	%i0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	nop	 ! 	casa	[%l6] 0x80,	%o5,	%o1 ASI use replaced by convert2hboot
	ldd	[%l7 + 0x50],	%o4
	add	%g6,	0x18BB,	%i4
	edge16	%l0,	%i2,	%i1
	fmovse	%icc,	%f0,	%f23
	mulscc	%i6,	%g2,	%o3
	fcmple16	%f28,	%f26,	%l5
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	umulcc	%g1,	%l2,	%o7
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	fzeros	%f2
	fcmpeq32	%f28,	%f28,	%o0
	alignaddrl	%g7,	%o2,	%g4
	sethi	0x105A,	%i3
	fbug,a	%fcc1,	loop_831
	ble,a	%icc,	loop_832
	pdist	%f4,	%f24,	%f14
	xnorcc	%l1,	%l3,	%g5
loop_831:
	fpsub32	%f20,	%f18,	%f24
loop_832:
	array32	%g3,	%l4,	%o6
	fmovsvs	%xcc,	%f16,	%f16
	set	0x0F, %o4
	nop	 ! 	lduba	[%l7 + %o4] 0x80,	%i5 ASI use replaced by convert2hboot
	wr	%g0,	0x0c,	%asi
	fbo	%fcc3,	loop_833
	fmul8x16	%f24,	%f28,	%f8
	nop 	! 	tleu	%icc,	0x6 changed by convert2hboot
	fnegd	%f28,	%f20
loop_833:
	movrne	%i0,	0x0B3,	%l6
	fmul8x16	%f31,	%f20,	%f30
	mulx	%o1,	0x094C,	%o5
	fbe	%fcc1,	loop_834
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	nop
	setx loop_835, %l0, %l1
	jmpl %l1, %o4
	fmovrsne	%g6,	%f19,	%f26
loop_834:
	srl	%l0,	%i4,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_835:
	fmovrdlz	%i6,	%f24,	%f26
	fpadd16	%f6,	%f12,	%f22
	sdiv	%g2,	0x17C3,	%o3
	nop 	! 	tsubcc	%i1,	0x10DE,	%l5 changed by convert2hboot
	set	0x20, %i5
	sta	%f16,	[%l7 + %i5] 0x80
	movrgz	%l2,	0x37B,	%g1
	wr	%g0,	0x89,	%asi
	sll	%o0,	0x0F,	%o2
	nop
	set	0x0A, %o6
	ldstub	[%l7 + %o6],	%g4
	fbue,a	%fcc1,	loop_836
	bneg,a	loop_837
	subccc	%g7,	0x0B4C,	%i3
	fmovdne	%icc,	%f24,	%f0
loop_836:
	fba	%fcc1,	loop_838
loop_837:
	stb	%l1,	[%l7 + 0x1E]
	membar	#Sync
	set	0x40, %l4
	nop	 ! 	ldda	[%l7 + %l4] 0xf8,	%f0 ASI use replaced by convert2hboot
loop_838:
	orncc	%l3,	%g3,	%g5
	stw	%o6,	[%l7 + 0x54]
	set	0x40, %g5
	nop	 ! 	ldda	[%l7 + %g5] 0x80,	%f0 ASI use replaced by convert2hboot
	fblg,a	%fcc1,	loop_839
	addcc	%l4,	%i5,	%i0
	movrlez	%l6,	%o1,	%o5
	edge8n	%i7,	%g6,	%o4
loop_839:
	sub	%l0,	0x014F,	%i4
	fbul	%fcc2,	loop_840
	smulcc	%i6,	0x1C12,	%i2
	edge16l	%g2,	%o3,	%i1
	subcc	%l2,	%l5,	%g1
loop_840:
	fbue,a	%fcc0,	loop_841
	mulscc	%o7,	%o0,	%g4
	wr	%g0,	0x2c,	%asi
loop_841:
	fornot1	%f8,	%f18,	%f8
	andcc	%o2,	%l1,	%i3
	movrlez	%l3,	%g5,	%g3
	fpsub32s	%f30,	%f0,	%f2
	edge8	%o6,	%i5,	%i0
	wr	%g0,	0x80,	%asi
	mova	%icc,	%l4,	%o1
	bgu,pn	%xcc,	loop_842
	bne,a,pt	%icc,	loop_843
	udiv	%i7,	0x1948,	%g6
	mova	%xcc,	%o5,	%l0
loop_842:
	movpos	%xcc,	%i4,	%o4
loop_843:
	nop 	! 	taddcctv	%i6,	%g2,	%o3 changed by convert2hboot
	udivcc	%i2,	0x09D8,	%l2
	fones	%f27
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l5,	0x1F59,	%i1
	smul	%o7,	0x1541,	%o0
	nop 	! 	tpos	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tle	%icc,	0x6 changed by convert2hboot
	call	loop_844
	edge8l	%g1,	%g7,	%g4
	fpsub32	%f12,	%f14,	%f12
	fnot2	%f20,	%f14
loop_844:
	fmovs	%f18,	%f10
	sra	%o2,	0x07,	%l1
	movrgz	%i3,	%l3,	%g5
	movn	%icc,	%o6,	%i5
	andncc	%g3,	%l6,	%i0
	fmovdpos	%xcc,	%f8,	%f0
	fcmpeq32	%f4,	%f18,	%l4
	fabsd	%f12,	%f20
	xor	%o1,	0x0F71,	%g6
	edge16n	%o5,	%i7,	%i4
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	set	0x50, %o3
	lda	[%l7 + %o3] 0x19,	%f24
	edge8l	%l0,	%i6,	%o4
	fnegs	%f21,	%f7
	array8	%g2,	%i2,	%o3
	ld	[%l7 + 0x4C],	%f16
	movrne	%l5,	%i1,	%l2
	andncc	%o0,	%g1,	%g7
	set	0x18, %o7
	nop	 ! 	ldswa	[%l7 + %o7] 0x18,	%o7 ASI use replaced by convert2hboot
	edge32	%g4,	%o2,	%l1
	sth	%l3,	[%l7 + 0x44]
	set	0x20, %l0
	nop	 ! 	ldda	[%l7 + %l0] 0x27,	%i2 ASI use replaced by convert2hboot
	edge8l	%o6,	%g5,	%g3
	xorcc	%l6,	0x00C1,	%i5
	be,a,pt	%xcc,	loop_845
	edge32	%l4,	%i0,	%g6
	edge16l	%o1,	%o5,	%i7
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
loop_845:
	udiv	%i4,	0x09D8,	%i6
	nop
	setx	loop_846,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	mova	%icc,	%l0,	%g2
	sth	%o4,	[%l7 + 0x58]
	andncc	%i2,	%o3,	%l5
loop_846:
	edge8n	%l2,	%i1,	%g1
	popc	0x1B12,	%g7
	fones	%f9
	fornot1	%f0,	%f30,	%f8
	mulx	%o7,	%g4,	%o0
	fornot1	%f26,	%f26,	%f4
	udivx	%l1,	0x1094,	%o2
	nop 	! 	tge	%xcc,	0x1 changed by convert2hboot
	fcmple16	%f18,	%f10,	%i3
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
	xor	%o6,	%g5,	%g3
	bpos,a	%icc,	loop_847
	bcc	loop_848
	edge32	%l3,	%i5,	%l6
	set	0x29, %l1
	nop	 ! 	ldstuba	[%l7 + %l1] 0x10,	%i0 ASI use replaced by convert2hboot
loop_847:
	fxors	%f16,	%f30,	%f28
loop_848:
	nop 	! 	tge	%icc,	0x4 changed by convert2hboot
	alignaddrl	%l4,	%g6,	%o5
	smulcc	%i7,	%o1,	%i4
	fabss	%f31,	%f0
	movrlez	%l0,	0x01E,	%i6
	fands	%f13,	%f20,	%f29
	edge32n	%g2,	%o4,	%i2
	alignaddr	%l5,	%l2,	%o3
	ld	[%l7 + 0x78],	%f1
	fmovdcs	%xcc,	%f21,	%f13
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	ba,a	loop_849
	udivcc	%i1,	0x0A73,	%g7
	movvs	%xcc,	%g1,	%g4
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
loop_849:
	fbne	%fcc0,	loop_850
	movrgz	%o7,	%l1,	%o0
	fpack16	%f22,	%f17
	fmovsn	%xcc,	%f7,	%f24
loop_850:
	fnot2s	%f22,	%f12
	fsrc1	%f6,	%f26
	sdivx	%o2,	0x1FA4,	%o6
	fbo,a	%fcc1,	loop_851
	bneg,a	%icc,	loop_852
	alignaddrl	%i3,	%g5,	%l3
	movre	%i5,	0x0D5,	%g3
loop_851:
	movcs	%xcc,	%i0,	%l4
loop_852:
	ldx	[%l7 + 0x18],	%g6
	bg	%icc,	loop_853
	ble	loop_854
	movgu	%icc,	%o5,	%i7
	fbug	%fcc3,	loop_855
loop_853:
	array8	%o1,	%i4,	%l6
loop_854:
	srlx	%l0,	%i6,	%o4
	edge8l	%i2,	%g2,	%l5
loop_855:
	nop
	set	0x66, %l3
	nop	 ! 	ldsha	[%l7 + %l3] 0x10,	%o3 ASI use replaced by convert2hboot
	sdivx	%l2,	0x1DA2,	%g7
	bshuffle	%f0,	%f20,	%f20
	fnands	%f4,	%f14,	%f9
	popc	%g1,	%g4
	fandnot1	%f22,	%f24,	%f24
	nop 	! 	tgu	%xcc,	0x7 changed by convert2hboot
	edge32	%o7,	%l1,	%i1
	umul	%o2,	0x0F4E,	%o6
	ble	%icc,	loop_856
	edge8l	%i3,	%o0,	%g5
	set	0x74, %g7
	nop	 ! 	stba	%i5,	[%l7 + %g7] 0x2a ASI use replaced by convert2hboot
	membar	#Sync
loop_856:
	umul	%l3,	0x12A9,	%i0
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	edge16n	%g3,	%g6,	%o5
	fandnot2	%f26,	%f4,	%f8
	fcmple32	%f20,	%f16,	%i7
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	fcmpes	%fcc2,	%f6,	%f25
	fpadd32s	%f14,	%f26,	%f7
	edge8	%l4,	%o1,	%l6
	andn	%i4,	0x15A2,	%l0
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
	fmovrdlz	%o4,	%f10,	%f10
	fmovspos	%xcc,	%f1,	%f17
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
	fbule	%fcc1,	loop_857
	and	%i6,	%g2,	%i2
	subcc	%o3,	%l5,	%l2
	edge16n	%g1,	%g7,	%g4
loop_857:
	movne	%xcc,	%o7,	%i1
	fmovrdlz	%o2,	%f14,	%f16
	fbo,a	%fcc3,	loop_858
	orn	%o6,	0x1967,	%l1
	wr	%g0,	0x18,	%asi
loop_858:
	fmovs	%f2,	%f7
	edge8	%o0,	%g5,	%l3
	fmovdleu	%xcc,	%f28,	%f14
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	brgz,a	%i0,	loop_859
	movpos	%xcc,	%i5,	%g6
	fbule,a	%fcc1,	loop_860
	fpsub16s	%f7,	%f10,	%f9
loop_859:
	fxors	%f30,	%f24,	%f6
	fcmpeq16	%f18,	%f2,	%g3
loop_860:
	smulcc	%i7,	%l4,	%o1
	subcc	%o5,	0x0E28,	%l6
	nop 	! 	tleu	%xcc,	0x5 changed by convert2hboot
	movrlez	%i4,	0x2F7,	%o4
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	fble,a	%fcc0,	loop_861
	bvc	%icc,	loop_862
	brlz,a	%l0,	loop_863
	fxnors	%f12,	%f17,	%f1
loop_861:
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
loop_862:
	nop
	set	0x40, %l2
	nop	 ! 	ldda	[%l7 + %l2] 0x14,	%f0 ASI use replaced by convert2hboot
loop_863:
	brlz	%i6,	loop_864
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	wr	%g0,	0x89,	%asi
loop_864:
	fmovspos	%icc,	%f12,	%f31
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	nop
	set	0x26, %l6
	lduh	[%l7 + %l6],	%o3
	nop 	! 	tl	%xcc,	0x7 changed by convert2hboot
	udiv	%i2,	0x0610,	%l2
	xnor	%l5,	0x0B8B,	%g7
	st	%f22,	[%l7 + 0x68]
	movleu	%icc,	%g1,	%o7
	movge	%icc,	%g4,	%o2
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
	subc	%o6,	0x0198,	%i1
	edge16ln	%i3,	%l1,	%g5
	movrgz	%l3,	0x1AC,	%i0
	move	%xcc,	%i5,	%o0
	smul	%g3,	%i7,	%l4
	fcmpgt16	%f0,	%f22,	%o1
	mulscc	%o5,	0x1A51,	%g6
	fmovrdgz	%i4,	%f20,	%f0
	subcc	%l6,	0x1805,	%l0
	alignaddrl	%i6,	%o4,	%g2
	nop 	! 	sir	0x0E55 changed by convert2hboot
	nop
	setx	loop_865,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop 	! 	tsubcc	%i2,	%l2,	%o3 changed by convert2hboot
	udiv	%g7,	0x1132,	%g1
	fnot2	%f24,	%f18
loop_865:
	and	%l5,	%g4,	%o7
	fbul,a	%fcc0,	loop_866
	ldd	[%l7 + 0x50],	%o2
	orn	%i1,	0x0463,	%i3
	edge32l	%l1,	%o6,	%l3
loop_866:
	fmovde	%xcc,	%f24,	%f12
	wr	%g0,	0x10,	%asi
	movpos	%icc,	%g5,	%o0
	ldsb	[%l7 + 0x32],	%i5
	fmovsl	%icc,	%f23,	%f31
	ld	[%l7 + 0x68],	%f5
	smul	%g3,	0x067F,	%l4
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
	fxor	%f0,	%f4,	%f2
	fmovrsgz	%i7,	%f10,	%f13
	fcmpne16	%f2,	%f0,	%o1
	fbuge	%fcc1,	loop_867
	fabss	%f13,	%f25
	ldsh	[%l7 + 0x0A],	%o5
	fnot2	%f4,	%f4
loop_867:
	xnor	%i4,	0x1D98,	%l6
	edge16n	%g6,	%l0,	%i6
	fbl	%fcc2,	loop_868
	movvc	%icc,	%g2,	%o4
	wr	%g0,	0xe2,	%asi
loop_868:
	bshuffle	%f10,	%f20,	%f2
	subccc	%o3,	%g7,	%g1
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc2,	loop_869
	fmovsge	%xcc,	%f21,	%f15
	move	%icc,	%l2,	%l5
	st	%f3,	[%l7 + 0x14]
loop_869:
	fmovsgu	%xcc,	%f2,	%f9
	orcc	%o7,	0x0661,	%o2
	fmovrsgz	%g4,	%f15,	%f7
	srlx	%i3,	%l1,	%o6
	brlez	%i1,	loop_870
	movrlz	%l3,	%g5,	%o0
	wr	%g0,	0x23,	%asi
	membar	#Sync
loop_870:
	fcmpne32	%f0,	%f24,	%g3
	nop 	! 	sir	0x0E64 changed by convert2hboot
	movpos	%xcc,	%i5,	%l4
	fxnor	%f8,	%f12,	%f30
	std	%f20,	[%l7 + 0x40]
	fmovsvs	%xcc,	%f15,	%f6
	edge16ln	%i7,	%o1,	%i4
	mulscc	%l6,	0x0D2A,	%o5
	ld	[%l7 + 0x08],	%f5
	fornot2	%f6,	%f4,	%f6
	wr	%g0,	0x88,	%asi
	fexpand	%f20,	%f28
	xnorcc	%g6,	%g2,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o4,	0x0E6E,	%o3
	orcc	%g7,	%g1,	%l2
	nop 	! 	tn	%icc,	0x5 changed by convert2hboot
	movre	%i2,	%o7,	%o2
	pdist	%f4,	%f30,	%f6
	srax	%g4,	0x0F,	%i3
	fmovspos	%xcc,	%f28,	%f16
	alignaddr	%l1,	%o6,	%l5
	edge8l	%i1,	%g5,	%o0
	bvs,a	%xcc,	loop_871
	bvs,pn	%icc,	loop_872
	sethi	0x0026,	%i0
	for	%f20,	%f8,	%f28
loop_871:
	nop 	! 	tge	%icc,	0x0 changed by convert2hboot
loop_872:
	edge8l	%g3,	%i5,	%l4
	set	0x40, %i3
	nop	 ! 	stda	%f16,	[%l7 + %i3] 0x16 ASI use replaced by convert2hboot
	membar	#Sync
	edge32l	%l3,	%o1,	%i7
	fmovsleu	%icc,	%f4,	%f9
	sub	%l6,	0x101D,	%i4
	movge	%icc,	%l0,	%g6
	fnot2	%f18,	%f28
	edge32n	%o5,	%i6,	%o4
	fbn,a	%fcc1,	loop_873
	alignaddr	%g2,	%o3,	%g1
	sdivcc	%l2,	0x1D71,	%i2
	subcc	%g7,	0x08AF,	%o2
loop_873:
	alignaddr	%g4,	%o7,	%i3
	fbne,a	%fcc3,	loop_874
	bpos,a	loop_875
	umulcc	%l1,	0x1180,	%l5
	bneg,pt	%xcc,	loop_876
loop_874:
	mulscc	%i1,	%g5,	%o0
loop_875:
	stw	%i0,	[%l7 + 0x54]
	pdist	%f6,	%f10,	%f24
loop_876:
	nop 	! 	tsubcc	%g3,	0x1BD5,	%o6 changed by convert2hboot
	or	%i5,	0x154B,	%l3
	addccc	%l4,	%i7,	%l6
	nop
	set	0x48, %i2
	ldx	[%l7 + %i2],	%o1
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	sdiv	%l0,	0x0042,	%i4
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	movcc	%xcc,	%g6,	%i6
	alignaddrl	%o5,	%o4,	%g2
	add	%o3,	0x0FBD,	%g1
	wr	%g0,	0x89,	%asi
	fnegs	%f31,	%f2
	nop
	set	0x27, %o0
	ldsb	[%l7 + %o0],	%l2
	movrne	%o2,	%g7,	%o7
	fnands	%f31,	%f5,	%f13
	bg	loop_877
	movrne	%g4,	%i3,	%l1
	udivcc	%i1,	0x02CB,	%l5
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
loop_877:
	addc	%g5,	0x00A9,	%o0
	bleu,a,pt	%xcc,	loop_878
	srax	%g3,	%i0,	%i5
	bg,pn	%icc,	loop_879
	movvc	%icc,	%o6,	%l4
loop_878:
	fnot2s	%f8,	%f28
	set	0x60, %g4
	nop	 ! 	stwa	%i7,	[%l7 + %g4] 0x88 ASI use replaced by convert2hboot
loop_879:
	smul	%l3,	%o1,	%l6
	ldsw	[%l7 + 0x68],	%i4
	movvs	%icc,	%l0,	%i6
	edge16	%o5,	%o4,	%g6
	smul	%o3,	0x1D79,	%g1
	umul	%g2,	0x1A66,	%l2
	brz	%i2,	loop_880
	movgu	%xcc,	%g7,	%o7
	movn	%xcc,	%o2,	%g4
	srl	%l1,	0x1C,	%i3
loop_880:
	fmovrsne	%i1,	%f25,	%f29
	set	0x54, %g1
	sta	%f25,	[%l7 + %g1] 0x10
	fcmpeq32	%f6,	%f0,	%l5
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	addccc	%g5,	%g3,	%o0
	fbue,a	%fcc0,	loop_881
	nop 	! 	taddcctv	%i5,	%o6,	%i0 changed by convert2hboot
	fmuld8sux16	%f10,	%f1,	%f6
	subcc	%l4,	0x1592,	%l3
loop_881:
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	popc	0x196F,	%o1
	brlz	%l6,	loop_882
	fnegd	%f6,	%f28
	and	%i4,	%i7,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_882:
	xnor	%o5,	%i6,	%g6
	xnor	%o4,	0x15A6,	%g1
	edge8ln	%g2,	%l2,	%i2
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x18] %asi,	%f3
	mulscc	%o3,	%g7,	%o2
	fbu	%fcc3,	loop_883
	fors	%f16,	%f7,	%f7
	fbg,a	%fcc1,	loop_884
	bpos,a,pt	%xcc,	loop_885
loop_883:
	nop 	! 	tcc	%icc,	0x4 changed by convert2hboot
	prefetch	[%l7 + 0x64],	 0x3
loop_884:
	fandnot1	%f0,	%f4,	%f0
loop_885:
	movre	%g4,	0x309,	%o7
	std	%f4,	[%l7 + 0x48]
	nop 	! 	tvs	%xcc,	0x6 changed by convert2hboot
	smul	%i3,	%i1,	%l5
	edge8ln	%g5,	%l1,	%o0
	set	0x78, %o5
	nop	 ! 	ldswa	[%l7 + %o5] 0x80,	%i5 ASI use replaced by convert2hboot
	nop 	! 	tsubcc	%o6,	0x1E69,	%i0 changed by convert2hboot
	wr	%g0,	0x88,	%asi
	fzero	%f10
	fbuge	%fcc0,	loop_886
	popc	%l3,	%o1
	brlz,a	%g3,	loop_887
	fornot2s	%f10,	%f31,	%f3
loop_886:
	fmul8sux16	%f28,	%f16,	%f2
	movle	%xcc,	%l6,	%i7
loop_887:
	nop
	setx	loop_888,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	alignaddr	%l0,	%o5,	%i4
	brgz	%i6,	loop_889
	nop 	! 	tg	%icc,	0x1 changed by convert2hboot
loop_888:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g6,	%o4,	%g2
loop_889:
	fmovsleu	%icc,	%f4,	%f13
	movle	%icc,	%l2,	%g1
	fmovrdne	%o3,	%f24,	%f12
	mova	%xcc,	%g7,	%o2
	smulcc	%g4,	0x0865,	%i2
	movrgz	%o7,	%i1,	%l5
	andn	%g5,	%l1,	%o0
	add	%i5,	%o6,	%i3
	alignaddr	%l4,	%i0,	%o1
	ldstub	[%l7 + 0x5D],	%g3
	array32	%l3,	%i7,	%l6
	orcc	%l0,	0x19CA,	%o5
	movrne	%i6,	0x31A,	%i4
	fmovrsgz	%g6,	%f26,	%f29
	wr	%g0,	0x80,	%asi
	membar	0x70
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	and	%o4,	%l2,	%g1
	fmovsvs	%icc,	%f22,	%f24
	movg	%xcc,	%g7,	%o3
	fnegd	%f18,	%f8
	fmovdpos	%xcc,	%f0,	%f13
	fand	%f18,	%f30,	%f18
	add	%o2,	0x19E4,	%g4
	movl	%xcc,	%o7,	%i1
	brlz	%i2,	loop_890
	fnot1s	%f0,	%f25
	udivx	%l5,	0x0750,	%l1
	be,pt	%xcc,	loop_891
loop_890:
	brnz,a	%g5,	loop_892
	nop 	! 	taddcctv	%i5,	%o6,	%i3 changed by convert2hboot
loop_891:
	fba	%fcc0,	loop_893
	and	%l4,	%i0,	%o1
loop_892:
	subc	%o0,	%g3,	%l3
	fmovsg	%xcc,	%f26,	%f0
loop_893:
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	sdiv	%i7,	0x1DD3,	%l6
	fmovdcs	%xcc,	%f19,	%f20
	nop 	! 	tsubcc	%o5,	%l0,	%i4 changed by convert2hboot
	addccc	%i6,	%g2,	%g6
	brz	%o4,	loop_894
	subccc	%l2,	0x0AD5,	%g1
	fpadd16s	%f10,	%f5,	%f29
	fsrc1s	%f4,	%f17
loop_894:
	flush	%l7 + 0x10
	bvs,a	%icc,	loop_895
	fsrc2s	%f5,	%f4
	bl,a	%xcc,	loop_896
	fmovdcs	%xcc,	%f12,	%f2
loop_895:
	fba	%fcc1,	loop_897
	fnor	%f30,	%f22,	%f18
loop_896:
	andncc	%o3,	%o2,	%g4
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
loop_897:
	fmovrdgez	%g7,	%f20,	%f0
	nop 	! 	tcc	%icc,	0x1 changed by convert2hboot
	addccc	%o7,	0x169A,	%i2
	wr	%g0,	0x80,	%asi
	fornot1s	%f25,	%f14,	%f26
	nop 	! 	tl	%icc,	0x4 changed by convert2hboot
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
	set	0x56, %g2
	nop	 ! 	stha	%l1,	[%l7 + %g2] 0x04 ASI use replaced by convert2hboot
	movl	%icc,	%l5,	%g5
	movcc	%xcc,	%i5,	%i3
	fnot1s	%f20,	%f4
	edge16	%l4,	%o6,	%o1
	subcc	%i0,	0x1E5A,	%o0
	movn	%xcc,	%g3,	%i7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	alignaddr	%l0,	%i4,	%o5
	fmovsne	%xcc,	%f4,	%f0
	nop 	! 	tsubcc	%g2,	%i6,	%o4 changed by convert2hboot
	fbuge	%fcc2,	loop_898
	movcc	%icc,	%l2,	%g6
	edge32	%o3,	%o2,	%g1
	fmovrsgz	%g7,	%f20,	%f2
loop_898:
	and	%o7,	%i2,	%g4
	fcmple32	%f22,	%f4,	%l1
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	fbu	%fcc0,	loop_899
	subccc	%l5,	%g5,	%i1
	bl,a	loop_900
	andncc	%i5,	%i3,	%o6
loop_899:
	nop 	! 	tvc	%icc,	0x5 changed by convert2hboot
	sra	%l4,	%i0,	%o0
loop_900:
	pdist	%f2,	%f18,	%f20
	array8	%g3,	%o1,	%i7
	bcs,a	%xcc,	loop_901
	movre	%l3,	0x2C8,	%l0
	popc	%i4,	%l6
	fnegd	%f26,	%f20
loop_901:
	fnands	%f17,	%f1,	%f11
	edge32ln	%o5,	%g2,	%i6
	movrgez	%l2,	%o4,	%g6
	lduh	[%l7 + 0x1A],	%o2
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	movg	%icc,	%o3,	%g7
	sdivx	%g1,	0x1C43,	%o7
	movpos	%xcc,	%g4,	%l1
	nop 	! 	tne	%icc,	0x1 changed by convert2hboot
	fbne	%fcc0,	loop_902
	stw	%l5,	[%l7 + 0x68]
	brlz,a	%g5,	loop_903
	movn	%xcc,	%i2,	%i5
loop_902:
	andncc	%i1,	%o6,	%l4
	or	%i3,	0x0FE8,	%o0
loop_903:
	alignaddr	%i0,	%g3,	%o1
	stx	%l3,	[%l7 + 0x30]
	srl	%l0,	%i7,	%i4
	wr	%g0,	0x18,	%asi
	sllx	%l6,	0x12,	%i6
	fzeros	%f20
	movge	%icc,	%g2,	%l2
	fbule,a	%fcc0,	loop_904
	fbo	%fcc1,	loop_905
	fmovrsne	%o4,	%f28,	%f8
	edge32l	%o2,	%g6,	%o3
loop_904:
	bcs,pt	%xcc,	loop_906
loop_905:
	bvc,a	%icc,	loop_907
	nop 	! 	tcs	%xcc,	0x4 changed by convert2hboot
	bne	%icc,	loop_908
loop_906:
	and	%g7,	%g1,	%g4
loop_907:
	udivx	%l1,	0x0A9C,	%l5
	fmovrdlz	%o7,	%f2,	%f16
loop_908:
	fmovrdgz	%g5,	%f10,	%f0
	stw	%i5,	[%l7 + 0x3C]
	andncc	%i1,	%o6,	%l4
	bcs	%xcc,	loop_909
	be,a,pn	%icc,	loop_910
	edge32	%i2,	%o0,	%i3
	fmovrslz	%i0,	%f8,	%f15
loop_909:
	nop
	set	0x28, %g6
	nop	 ! 	ldxa	[%l7 + %g6] 0x15,	%g3 ASI use replaced by convert2hboot
loop_910:
	fmovdn	%icc,	%f22,	%f12
	fcmpd	%fcc1,	%f14,	%f6
	nop 	! 	tleu	%icc,	0x3 changed by convert2hboot
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
	fcmpd	%fcc0,	%f14,	%f28
	fand	%f22,	%f2,	%f12
	bshuffle	%f10,	%f20,	%f0
	udiv	%l3,	0x01CE,	%l0
	membar	0x1C
	addc	%i7,	0x0CAD,	%i4
	std	%f6,	[%l7 + 0x60]
	fblg,a	%fcc2,	loop_911
	ldsw	[%l7 + 0x14],	%o1
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	brgez,a	%o5,	loop_912
loop_911:
	nop 	! 	taddcctv	%l6,	0x05B7,	%i6 changed by convert2hboot
	alignaddrl	%l2,	%g2,	%o2
	edge16l	%g6,	%o4,	%g7
loop_912:
	popc	%o3,	%g4
	sll	%g1,	%l5,	%l1
	array16	%g5,	%o7,	%i1
	edge32ln	%o6,	%i5,	%i2
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	edge32	%o0,	%l4,	%i0
	mulx	%i3,	0x089C,	%l3
	andncc	%g3,	%i7,	%i4
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	edge32	%l0,	%o5,	%l6
	set	0x0E, %o1
	nop	 ! 	ldsha	[%l7 + %o1] 0x81,	%i6 ASI use replaced by convert2hboot
	fandnot1s	%f16,	%f9,	%f24
	nop 	! 	tvs	%xcc,	0x6 changed by convert2hboot
	movne	%xcc,	%o1,	%g2
	edge32	%l2,	%g6,	%o4
	fble,a	%fcc2,	loop_913
	edge8n	%g7,	%o3,	%o2
	fble,a	%fcc1,	loop_914
	fsrc2	%f10,	%f28
loop_913:
	fbul	%fcc1,	loop_915
	sllx	%g1,	0x0A,	%g4
loop_914:
	mulscc	%l1,	0x1BCF,	%l5
	fmovsleu	%icc,	%f12,	%f26
loop_915:
	edge8l	%o7,	%i1,	%g5
	fnot2	%f26,	%f10
	move	%xcc,	%o6,	%i2
	fcmps	%fcc2,	%f1,	%f27
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
	fcmps	%fcc2,	%f28,	%f8
	fmuld8ulx16	%f6,	%f1,	%f18
	xnorcc	%i5,	%o0,	%i0
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
	xnor	%l4,	0x0E3F,	%i3
	movg	%icc,	%g3,	%l3
	movleu	%icc,	%i4,	%i7
	set	0x68, %l5
	lda	[%l7 + %l5] 0x80,	%f10
	edge32	%l0,	%l6,	%i6
	srl	%o1,	%g2,	%l2
	edge32ln	%o5,	%g6,	%g7
	nop 	! 	tsubcctv	%o4,	0x0BF5,	%o2 changed by convert2hboot
	movg	%icc,	%g1,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g4,	0x13,	%l1
	wr	%g0,	0x81,	%asi
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
	add	%o7,	0x1BEA,	%i1
	movleu	%xcc,	%l5,	%g5
	fcmple16	%f28,	%f6,	%i2
	xnorcc	%i5,	0x0D5D,	%o0
	movcc	%icc,	%i0,	%o6
	ld	[%l7 + 0x08],	%f22
	subccc	%i3,	%l4,	%g3
	umul	%i4,	%l3,	%i7
	fnot2s	%f5,	%f25
	subccc	%l0,	0x1F21,	%l6
	bne	%icc,	loop_916
	movge	%xcc,	%o1,	%g2
	fmovsle	%icc,	%f13,	%f2
	fcmple32	%f24,	%f12,	%l2
loop_916:
	fmovdcc	%xcc,	%f23,	%f12
	fmovsleu	%icc,	%f26,	%f4
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	movvc	%xcc,	%i6,	%g6
	fmovdcc	%xcc,	%f13,	%f10
	sll	%o5,	%o4,	%o2
	nop 	! 	tneg	%icc,	0x3 changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x2 changed by convert2hboot
	andcc	%g1,	0x0A7E,	%o3
	movcs	%icc,	%g7,	%g4
	bne,a,pn	%xcc,	loop_917
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	ld	[%l7 + 0x7C],	%f20
	andn	%l1,	%i1,	%o7
loop_917:
	fmovsle	%icc,	%f6,	%f0
	wr	%g0,	0x80,	%asi
	nop 	! 	tle	%xcc,	0x5 changed by convert2hboot
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
	udiv	%l5,	0x0BD5,	%i5
	andcc	%i2,	%o0,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	taddcc	%i3,	%o6,	%l4 changed by convert2hboot
	movl	%icc,	%i4,	%l3
	wr	%g0,	0x19,	%asi
	fmovrsgez	%l0,	%f26,	%f23
	nop 	! 	taddcc	%l6,	%o1,	%g3 changed by convert2hboot
	xnor	%g2,	0x1330,	%l2
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
	stb	%g6,	[%l7 + 0x38]
	edge8	%o5,	%o4,	%i6
	sra	%g1,	0x1E,	%o2
	fmovrse	%o3,	%f13,	%f31
	edge8ln	%g4,	%l1,	%g7
	fxnors	%f16,	%f26,	%f10
	bcc,pt	%icc,	loop_918
	popc	0x11AE,	%o7
	array32	%g5,	%i1,	%i5
	sdivx	%l5,	0x0BDB,	%o0
loop_918:
	ldx	[%l7 + 0x60],	%i2
	edge8n	%i3,	%i0,	%l4
	andcc	%i4,	%l3,	%o6
	nop 	! 	tge	%icc,	0x4 changed by convert2hboot
	fmovde	%xcc,	%f27,	%f9
	fmovdn	%icc,	%f3,	%f9
	xorcc	%l0,	%i7,	%o1
	fpadd32s	%f18,	%f23,	%f0
	movrgz	%g3,	%l6,	%g2
	fcmple32	%f24,	%f22,	%g6
	ble,a,pt	%xcc,	loop_919
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	fmovsg	%xcc,	%f3,	%f9
	st	%f25,	[%l7 + 0x64]
loop_919:
	ldd	[%l7 + 0x40],	%o4
	st	%f10,	[%l7 + 0x38]
	set	0x40, %i4
	nop	 ! 	ldda	[%l7 + %i4] 0x81,	%f0 ASI use replaced by convert2hboot
	fmovda	%xcc,	%f28,	%f6
	fmovscc	%icc,	%f2,	%f3
	std	%f30,	[%l7 + 0x48]
	edge32n	%l2,	%i6,	%g1
	wr	%g0,	0x89,	%asi
	sll	%o3,	%g4,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%g7,	%o2,	%o7
	fmovscs	%xcc,	%f24,	%f16
	fbe,a	%fcc0,	loop_920
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	bleu,pn	%icc,	loop_921
	mulscc	%i1,	0x0C4D,	%i5
loop_920:
	stw	%g5,	[%l7 + 0x78]
	movvc	%xcc,	%o0,	%i2
loop_921:
	movrgez	%l5,	%i3,	%i0
	umulcc	%l4,	0x12CD,	%l3
	sdivx	%o6,	0x01C9,	%i4
	edge32ln	%l0,	%i7,	%g3
	flush	%l7 + 0x34
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	fzero	%f20
	bcc,a,pt	%xcc,	loop_922
	srlx	%l6,	0x00,	%o1
	ld	[%l7 + 0x40],	%f7
	edge8ln	%g6,	%o5,	%g2
loop_922:
	orcc	%i6,	%g1,	%o4
	lduh	[%l7 + 0x74],	%l2
	fbule,a	%fcc3,	loop_923
	call	loop_924
	orcc	%g4,	%l1,	%g7
	smulcc	%o3,	%o2,	%o7
loop_923:
	fmovrslz	%i1,	%f4,	%f30
loop_924:
	srl	%g5,	0x07,	%o0
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	addcc	%i5,	%i3,	%i0
	movcc	%icc,	%l5,	%l3
	be,pt	%xcc,	loop_925
	smulcc	%o6,	0x1E28,	%l4
	movl	%icc,	%i4,	%l0
	wr	%g0,	0xeb,	%asi
	membar	#Sync
loop_925:
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
	mova	%icc,	%i7,	%o1
	fands	%f25,	%f1,	%f2
	bpos,a,pt	%xcc,	loop_926
	movne	%icc,	%g6,	%o5
	nop 	! 	taddcc	%g2,	0x14ED,	%l6 changed by convert2hboot
	movre	%i6,	0x3E5,	%o4
loop_926:
	movrgz	%l2,	0x177,	%g1
	srlx	%l1,	0x1F,	%g7
	movvc	%xcc,	%o3,	%o2
	alignaddr	%g4,	%o7,	%g5
	wr	%g0,	0x4f,	%asi
	nop 	! 	ta	%xcc,	0x5 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	fbge,a	%fcc3,	loop_927
	ldd	[%l7 + 0x10],	%i4
	movvs	%icc,	%i1,	%i0
	fmovsvs	%icc,	%f17,	%f25
loop_927:
	fba	%fcc0,	loop_928
	orn	%l5,	0x0591,	%l3
	fcmple16	%f10,	%f8,	%o6
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
loop_928:
	ldd	[%l7 + 0x60],	%l4
	fnors	%f31,	%f23,	%f26
	sll	%i4,	%l0,	%g3
	srlx	%i3,	0x10,	%i7
	nop 	! 	taddcc	%o1,	%o5,	%g6 changed by convert2hboot
	sethi	0x0D09,	%g2
	fnegd	%f28,	%f30
	sdiv	%i6,	0x07AB,	%l6
	nop 	! 	taddcctv	%o4,	%l2,	%l1 changed by convert2hboot
	bleu,a	%xcc,	loop_929
	fmuld8ulx16	%f22,	%f22,	%f24
	set	0x40, %i6
	nop	 ! 	ldda	[%l7 + %i6] 0x11,	%f16 ASI use replaced by convert2hboot
loop_929:
	fmovscc	%icc,	%f17,	%f20
	fpack16	%f16,	%f0
	nop 	! 	tsubcctv	%g7,	%g1,	%o2 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x0 changed by convert2hboot
	movrgz	%g4,	0x148,	%o3
	movpos	%icc,	%g5,	%o7
	fnand	%f28,	%f16,	%f10
	array8	%o0,	%i5,	%i2
	mulx	%i0,	%i1,	%l3
	edge32n	%l5,	%o6,	%l4
	movcs	%icc,	%i4,	%l0
	fbo	%fcc0,	loop_930
	edge16n	%i3,	%i7,	%g3
	sdivx	%o5,	0x083F,	%o1
	nop 	! 	ta	%icc,	0x2 changed by convert2hboot
loop_930:
	fmovs	%f8,	%f4
	addcc	%g2,	0x1232,	%i6
	nop 	! 	ta	%icc,	0x2 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	fmovsl	%icc,	%f12,	%f11
	nop 	! 	tcc	%xcc,	0x7 changed by convert2hboot
	wr	%g0,	0x2b,	%asi
	membar	#Sync
	nop 	! 	sir	0x1CA0 changed by convert2hboot
	fmovde	%icc,	%f1,	%f11
	edge16n	%o4,	%l6,	%l1
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
	fornot1	%f18,	%f22,	%f20
	subcc	%l2,	0x174E,	%g1
	fpadd32s	%f19,	%f17,	%f17
	fandnot1	%f18,	%f0,	%f12
	movre	%g7,	0x331,	%o2
	array32	%g4,	%o3,	%o7
	fba	%fcc0,	loop_931
	sll	%o0,	%g5,	%i5
	edge8ln	%i2,	%i0,	%l3
	ldsb	[%l7 + 0x26],	%l5
loop_931:
	fcmped	%fcc2,	%f6,	%f26
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
	movcc	%icc,	%i1,	%o6
	fbo	%fcc3,	loop_932
	movge	%icc,	%i4,	%l0
	xor	%l4,	%i3,	%g3
	udivcc	%o5,	0x1A2F,	%o1
loop_932:
	umulcc	%i7,	%i6,	%g6
	nop 	! 	tpos	%xcc,	0x4 changed by convert2hboot
	udivx	%g2,	0x1A59,	%l6
	fmovspos	%icc,	%f24,	%f31
	fmovrdlz	%o4,	%f6,	%f14
	mulx	%l2,	%l1,	%g7
	bne,pt	%icc,	loop_933
	sub	%g1,	0x0669,	%o2
	sll	%g4,	%o7,	%o0
	sth	%g5,	[%l7 + 0x70]
loop_933:
	movrlz	%i5,	%i2,	%o3
	movrgez	%l3,	0x097,	%l5
	sdivcc	%i0,	0x111D,	%o6
	sdivcc	%i1,	0x0056,	%i4
	membar	0x5E
	sth	%l4,	[%l7 + 0x3E]
	fbu,a	%fcc3,	loop_934
	fmovrdgz	%i3,	%f16,	%f16
	stw	%g3,	[%l7 + 0x0C]
	movl	%xcc,	%l0,	%o5
loop_934:
	bn	%icc,	loop_935
	fpsub32	%f2,	%f6,	%f8
	nop
	setx	loop_936,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	brgez	%i7,	loop_937
loop_935:
	fcmpne32	%f0,	%f14,	%i6
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
loop_936:
	edge32	%g6,	%g2,	%o1
loop_937:
	fmovsge	%icc,	%f27,	%f21
	lduw	[%l7 + 0x48],	%l6
	alignaddrl	%o4,	%l1,	%l2
	brz	%g1,	loop_938
	fmovdneg	%icc,	%f29,	%f5
	bpos,pn	%icc,	loop_939
	movge	%xcc,	%o2,	%g4
loop_938:
	fblg,a	%fcc0,	loop_940
	fnand	%f4,	%f6,	%f20
loop_939:
	mulx	%g7,	0x15CB,	%o7
	fxnors	%f17,	%f7,	%f15
loop_940:
	movl	%icc,	%o0,	%i5
	movrne	%i2,	%o3,	%g5
	xnor	%l5,	%l3,	%o6
	ldd	[%l7 + 0x48],	%f20
	xor	%i0,	0x1986,	%i1
	orcc	%i4,	0x1704,	%l4
	ldd	[%l7 + 0x78],	%g2
	fmul8x16	%f13,	%f0,	%f4
	edge8n	%i3,	%o5,	%l0
	movge	%xcc,	%i7,	%i6
	addc	%g2,	0x1B29,	%g6
	subcc	%o1,	0x086A,	%o4
	movrlez	%l1,	%l2,	%l6
	edge16ln	%o2,	%g1,	%g4
	fmovdvs	%icc,	%f26,	%f22
	nop 	! 	taddcc	%g7,	0x0CF1,	%o0 changed by convert2hboot
	bl,a,pt	%xcc,	loop_941
	udivcc	%i5,	0x04C9,	%o7
	sll	%o3,	0x00,	%i2
	wr	%g0,	0x89,	%asi
loop_941:
	brlez	%l3,	loop_942
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	sdiv	%o6,	0x1310,	%g5
	xorcc	%i0,	0x0D3B,	%i1
loop_942:
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
	mulscc	%l4,	%g3,	%i3
	nop 	! 	tne	%xcc,	0x5 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f8,	%f2,	%f6
	sethi	0x195C,	%i4
	bn	%xcc,	loop_943
	brlz,a	%l0,	loop_944
	fmovsvs	%xcc,	%f13,	%f3
	fmovd	%f30,	%f20
loop_943:
	xorcc	%o5,	%i6,	%g2
loop_944:
	fmovdvs	%xcc,	%f10,	%f21
	fmovrse	%i7,	%f19,	%f15
	fcmple32	%f20,	%f12,	%o1
	umul	%o4,	%g6,	%l2
	mova	%icc,	%l6,	%o2
	sth	%g1,	[%l7 + 0x58]
	edge8	%g4,	%l1,	%o0
	ldstub	[%l7 + 0x36],	%i5
	nop
	setx	loop_945,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop 	! 	taddcc	%o7,	0x07FD,	%o3 changed by convert2hboot
	movleu	%icc,	%g7,	%l5
	fornot1s	%f5,	%f7,	%f14
loop_945:
	movcc	%xcc,	%i2,	%l3
	andcc	%o6,	0x059C,	%g5
	edge16	%i0,	%l4,	%i1
	movcc	%xcc,	%g3,	%i3
	add	%i4,	%o5,	%l0
	movvs	%icc,	%i6,	%g2
	sth	%i7,	[%l7 + 0x72]
	swap	[%l7 + 0x08],	%o1
	ba,a,pn	%icc,	loop_946
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	udivcc	%g6,	0x0A22,	%o4
	movle	%xcc,	%l6,	%l2
loop_946:
	nop
	wr	%g0,	0x0c,	%asi
	andncc	%g4,	%l1,	%o2
	fornot1	%f10,	%f18,	%f16
	stb	%i5,	[%l7 + 0x2C]
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	wr	%g0,	0x19,	%asi
	sethi	0x1269,	%o7
	fbuge	%fcc2,	loop_947
	fmovdge	%xcc,	%f6,	%f16
	edge16l	%o3,	%g7,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_947:
	xnorcc	%l3,	0x00E6,	%o6
	pdist	%f22,	%f18,	%f16
	sll	%g5,	%i2,	%l4
	sdivcc	%i0,	0x13AE,	%i1
	fmovscc	%xcc,	%f13,	%f4
	xorcc	%i3,	0x01DC,	%i4
	wr	%g0,	0x19,	%asi
	movrne	%l0,	0x2DD,	%g3
	fabsd	%f16,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i6,	0x14E1,	%i7
	subcc	%o1,	0x087A,	%g2
	fmuld8sux16	%f7,	%f14,	%f22
	edge16l	%o4,	%g6,	%l2
	mulx	%l6,	%g4,	%g1
	xor	%o2,	%l1,	%o0
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
	subc	%i5,	%o7,	%o3
	smul	%g7,	%l5,	%o6
	edge8ln	%g5,	%l3,	%i2
	movre	%l4,	0x2D9,	%i1
	nop
	setx loop_948, %l0, %l1
	jmpl %l1, %i3
	and	%i0,	%i4,	%o5
	sdivcc	%g3,	0x17F6,	%i6
	fsrc1s	%f14,	%f18
loop_948:
	alignaddr	%i7,	%o1,	%l0
	fmovrse	%o4,	%f13,	%f24
	andcc	%g6,	%g2,	%l6
	bn,a,pn	%icc,	loop_949
	fmovsl	%xcc,	%f16,	%f21
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x7C] %asi,	%f10
loop_949:
	fornot1	%f16,	%f2,	%f12
	fpsub32	%f6,	%f2,	%f4
	bge,a,pt	%xcc,	loop_950
	sllx	%l2,	0x0E,	%g4
	andcc	%g1,	0x070C,	%o2
	edge16l	%o0,	%l1,	%i5
loop_950:
	sll	%o3,	0x1C,	%g7
	fbu	%fcc3,	loop_951
	edge16ln	%o7,	%o6,	%l5
	array16	%l3,	%g5,	%l4
loop_951:
	subc	%i1,	0x1AB7,	%i3
	set	0x5C, %g3
	nop	 ! 	lduba	[%l7 + %g3] 0x81,	%i2 ASI use replaced by convert2hboot
	xorcc	%i0,	0x06F0,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g3,	%i6,	%i4
	movrlez	%o1,	0x267,	%i7
	subc	%o4,	0x07A2,	%g6
	bneg,a,pt	%icc,	loop_952
	fble	%fcc2,	loop_953
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	bcc,a,pt	%icc,	loop_954
loop_952:
	movneg	%xcc,	%l0,	%g2
loop_953:
	st	%f16,	[%l7 + 0x28]
	mulx	%l6,	0x03C7,	%l2
loop_954:
	orncc	%g1,	0x01A2,	%g4
	fmovde	%xcc,	%f12,	%f10
	bgu,a	loop_955
	mulx	%o0,	%o2,	%l1
	xor	%o3,	0x1E1A,	%g7
	smulcc	%i5,	%o7,	%l5
loop_955:
	sdiv	%l3,	0x0A88,	%o6
	xorcc	%g5,	0x0A80,	%l4
	movg	%icc,	%i1,	%i2
	movcc	%icc,	%i0,	%o5
	fcmple16	%f10,	%f28,	%i3
	array32	%i6,	%g3,	%o1
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	array8	%i4,	%i7,	%o4
	bgu,pn	%icc,	loop_956
	fmovsa	%xcc,	%f10,	%f8
	sllx	%g6,	%g2,	%l6
	subcc	%l2,	0x072C,	%l0
loop_956:
	edge16n	%g4,	%g1,	%o0
	addcc	%l1,	%o3,	%g7
	fmovspos	%icc,	%f3,	%f20
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	ba,pn	%icc,	loop_957
	fmovrdgz	%o2,	%f12,	%f20
	bneg,pn	%xcc,	loop_958
	fornot1	%f0,	%f24,	%f18
loop_957:
	edge16	%i5,	%o7,	%l5
	sub	%l3,	0x0C01,	%o6
loop_958:
	nop 	! 	ta	%icc,	0x6 changed by convert2hboot
	fsrc1s	%f28,	%f2
	fbug	%fcc2,	loop_959
	edge16l	%g5,	%i1,	%i2
	fabsd	%f18,	%f14
	fnot2	%f24,	%f30
loop_959:
	fbn	%fcc0,	loop_960
	movpos	%icc,	%i0,	%o5
	subc	%i3,	%i6,	%g3
	move	%icc,	%l4,	%i4
loop_960:
	fand	%f26,	%f14,	%f28
	movrne	%o1,	0x1A2,	%o4
	popc	%g6,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be	loop_961
	bvc,a,pn	%xcc,	loop_962
	std	%i6,	[%l7 + 0x58]
	ldstub	[%l7 + 0x6B],	%i7
loop_961:
	fmovsge	%xcc,	%f0,	%f13
loop_962:
	addcc	%l0,	%g4,	%g1
	edge8ln	%l2,	%l1,	%o0
	movvs	%xcc,	%g7,	%o3
	movne	%icc,	%i5,	%o2
	nop 	! 	taddcc	%l5,	%o7,	%o6 changed by convert2hboot
	fzeros	%f5
	fbu,a	%fcc3,	loop_963
	fbe	%fcc3,	loop_964
	fandnot2s	%f12,	%f24,	%f12
	movne	%icc,	%l3,	%g5
loop_963:
	fones	%f20
loop_964:
	sdivcc	%i2,	0x0344,	%i1
	edge8n	%i0,	%o5,	%i3
	subcc	%i6,	0x1551,	%l4
	edge8l	%i4,	%o1,	%o4
	movpos	%xcc,	%g6,	%g2
	edge32l	%l6,	%g3,	%l0
	fmovdge	%icc,	%f19,	%f23
	umulcc	%i7,	0x075F,	%g4
	udiv	%l2,	0x133B,	%g1
	nop 	! 	tneg	%icc,	0x3 changed by convert2hboot
	umul	%l1,	0x0F2E,	%g7
	nop 	! 	tgu	%icc,	0x1 changed by convert2hboot
	udivx	%o3,	0x0176,	%o0
	xor	%o2,	0x146B,	%i5
	nop 	! 	tleu	%icc,	0x1 changed by convert2hboot
	ldub	[%l7 + 0x0A],	%l5
	andncc	%o7,	%o6,	%g5
	fmovsle	%icc,	%f13,	%f13
	subccc	%i2,	0x08A9,	%i1
	fnor	%f30,	%f26,	%f6
	umul	%l3,	0x1F01,	%o5
	fmovrsne	%i0,	%f12,	%f17
	edge8	%i6,	%l4,	%i4
	orn	%i3,	0x06DF,	%o4
	fand	%f20,	%f18,	%f30
	brgz,a	%o1,	loop_965
	nop 	! 	sir	0x0558 changed by convert2hboot
	fmovrdne	%g6,	%f10,	%f6
	nop 	! 	taddcctv	%l6,	0x0875,	%g3 changed by convert2hboot
loop_965:
	udivx	%g2,	0x1B1F,	%l0
	xnor	%g4,	0x19E0,	%i7
	movneg	%xcc,	%l2,	%l1
	fpadd32	%f26,	%f22,	%f14
	addccc	%g1,	0x0AC8,	%o3
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	ldx	[%l7 + 0x58],	%o0
	srax	%g7,	0x00,	%i5
	alignaddrl	%o2,	%l5,	%o6
	brlez,a	%g5,	loop_966
	fmul8x16	%f26,	%f6,	%f14
	ldx	[%l7 + 0x40],	%o7
	subc	%i1,	%i2,	%l3
loop_966:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%i0,	loop_967
	fmovdvc	%xcc,	%f24,	%f28
	fmovsneg	%xcc,	%f2,	%f8
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
loop_967:
	nop
	wr	%g0,	0x89,	%asi
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	xnor	%l4,	%i6,	%i4
	fands	%f5,	%f0,	%f15
	edge32l	%o4,	%i3,	%o1
	fbo	%fcc1,	loop_968
	fmovsa	%icc,	%f13,	%f2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g6
	nop	 ! 	casa	[%l6] 0x80,	%g6,	%g3 ASI use replaced by convert2hboot
loop_968:
	brnz,a	%g2,	loop_969
	bne,a,pn	%xcc,	loop_970
	nop
	setx	loop_971,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	sethi	0x1016,	%l6
loop_969:
	ldsb	[%l7 + 0x59],	%l0
loop_970:
	nop
	wr	%g0,	0x0c,	%asi
loop_971:
	mova	%xcc,	%l2,	%l1
	set	0x7E, %o2
	nop	 ! 	lduha	[%l7 + %o2] 0x10,	%g4 ASI use replaced by convert2hboot
	fbuge,a	%fcc3,	loop_972
	nop 	! 	tcc	%xcc,	0x0 changed by convert2hboot
	fbule,a	%fcc1,	loop_973
	prefetch	[%l7 + 0x4C],	 0x3
loop_972:
	srl	%g1,	%o0,	%g7
	or	%i5,	%o2,	%o3
loop_973:
	srax	%o6,	0x11,	%g5
	movg	%xcc,	%o7,	%l5
	sra	%i1,	%l3,	%i0
	nop 	! 	taddcc	%o5,	%l4,	%i6 changed by convert2hboot
	andncc	%i4,	%i2,	%o4
	nop
	setx	loop_974,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
	edge8ln	%i3,	%g6,	%o1
	xor	%g3,	0x1B7B,	%g2
loop_974:
	bn,a,pt	%xcc,	loop_975
	subcc	%l0,	0x045B,	%l6
	popc	%l2,	%i7
	fsrc1	%f6,	%f14
loop_975:
	nop 	! 	tneg	%icc,	0x0 changed by convert2hboot
	mulx	%l1,	0x1621,	%g1
	sdivcc	%o0,	0x053B,	%g4
	fmovspos	%icc,	%f11,	%f7
	fpsub16	%f2,	%f0,	%f20
	fmovrdgez	%i5,	%f10,	%f6
	sdiv	%g7,	0x1A5B,	%o3
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	ldstub	[%l7 + 0x23],	%o6
	or	%o2,	%g5,	%o7
	nop 	! 	sir	0x0B8B changed by convert2hboot
	xnor	%l5,	0x1C00,	%l3
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	movgu	%xcc,	%i1,	%o5
	fmovrsgez	%l4,	%f0,	%f4
	movpos	%xcc,	%i0,	%i6
	alignaddrl	%i2,	%o4,	%i3
	udiv	%i4,	0x0ABE,	%o1
	nop 	! 	tvc	%xcc,	0x7 changed by convert2hboot
	and	%g6,	%g3,	%g2
	stb	%l0,	[%l7 + 0x5D]
	xnorcc	%l2,	%l6,	%i7
	fcmpes	%fcc3,	%f4,	%f21
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	alignaddrl	%g1,	%o0,	%g4
	udivcc	%l1,	0x1168,	%i5
	edge32l	%o3,	%o6,	%o2
	movpos	%icc,	%g5,	%g7
	movvs	%xcc,	%o7,	%l3
	bne,a,pt	%icc,	loop_976
	fmovsgu	%icc,	%f11,	%f11
	fpsub32s	%f9,	%f28,	%f15
	orcc	%l5,	0x0235,	%i1
loop_976:
	alignaddr	%l4,	%i0,	%i6
	fmovsg	%icc,	%f29,	%f14
	fbule,a	%fcc3,	loop_977
	fmul8sux16	%f6,	%f14,	%f20
	fabsd	%f18,	%f0
	fpsub32s	%f31,	%f16,	%f8
loop_977:
	movge	%icc,	%o5,	%o4
	mulx	%i3,	%i2,	%o1
	fabsd	%f30,	%f4
	xor	%g6,	0x1DF3,	%i4
	edge32n	%g3,	%l0,	%l2
	edge32	%g2,	%i7,	%g1
	movgu	%icc,	%o0,	%g4
	fandnot1	%f24,	%f14,	%f18
	ldd	[%l7 + 0x38],	%i6
	bleu,pt	%xcc,	loop_978
	umul	%l1,	0x1AEA,	%i5
	ld	[%l7 + 0x34],	%f26
	mova	%icc,	%o6,	%o3
loop_978:
	orn	%g5,	%g7,	%o2
	nop
	setx loop_979, %l0, %l1
	jmpl %l1, %l3
	smul	%o7,	%l5,	%l4
	addc	%i0,	%i1,	%i6
	andcc	%o5,	%o4,	%i2
loop_979:
	fornot1s	%f5,	%f10,	%f30
	srlx	%o1,	0x1C,	%i3
	nop 	! 	tsubcc	%g6,	%g3,	%l0 changed by convert2hboot
	movrne	%l2,	0x1B9,	%i4
	fones	%f9
	edge16	%g2,	%g1,	%o0
	add	%g4,	0x1323,	%l6
	fmovse	%xcc,	%f15,	%f24
	std	%f20,	[%l7 + 0x68]
	edge8	%l1,	%i5,	%o6
	movrgz	%o3,	%i7,	%g5
	sllx	%g7,	%o2,	%l3
	popc	%o7,	%l5
	addc	%i0,	%i1,	%i6
	fcmpeq16	%f26,	%f20,	%o5
	fbge	%fcc3,	loop_980
	fbge,a	%fcc1,	loop_981
	or	%l4,	%o4,	%o1
	edge32l	%i2,	%i3,	%g3
loop_980:
	lduw	[%l7 + 0x6C],	%l0
loop_981:
	fbge,a	%fcc3,	loop_982
	fpsub16s	%f25,	%f10,	%f15
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	bleu,a,pt	%xcc,	loop_983
loop_982:
	movg	%icc,	%l2,	%g6
	fnot2s	%f24,	%f0
	edge16	%i4,	%g2,	%o0
loop_983:
	movrlz	%g4,	0x2DE,	%l6
	std	%f30,	[%l7 + 0x60]
	orn	%g1,	%l1,	%i5
	sllx	%o3,	%i7,	%o6
	fnand	%f12,	%f24,	%f2
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	subc	%g5,	0x15B6,	%o2
	bg	%icc,	loop_984
	fabss	%f2,	%f14
	movn	%icc,	%l3,	%g7
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
loop_984:
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
	movrlez	%l5,	%o7,	%i0
	edge16n	%i6,	%i1,	%o5
	set	0x18, %i7
	nop	 ! 	prefetcha	[%l7 + %i7] 0x10,	 0x1 ASI use replaced by convert2hboot
	fbu	%fcc3,	loop_985
	fornot2s	%f4,	%f0,	%f11
	wr	%g0,	0x20,	%asi
loop_985:
	fbu	%fcc0,	loop_986
	fmovsg	%xcc,	%f28,	%f21
	fcmpeq32	%f18,	%f16,	%o1
	nop 	! 	tcs	%xcc,	0x4 changed by convert2hboot
loop_986:
	movge	%xcc,	%i3,	%i2
	nop 	! 	tvc	%icc,	0x2 changed by convert2hboot
	fbue	%fcc1,	loop_987
	movcs	%xcc,	%g3,	%l0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	nop	 ! 	casa	[%l6] 0x80,	%l2,	%g6 ASI use replaced by convert2hboot
loop_987:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne	%fcc1,	loop_988
	udivx	%i4,	0x0C9A,	%o0
	xor	%g4,	%l6,	%g1
	xnor	%g2,	0x13AA,	%i5
loop_988:
	ba,pn	%icc,	loop_989
	fand	%f30,	%f26,	%f20
	movgu	%xcc,	%o3,	%l1
	fbo,a	%fcc3,	loop_990
loop_989:
	andn	%o6,	%g5,	%o2
	andn	%l3,	0x152F,	%g7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	nop	 ! 	casa	[%l6] 0x89,	%i7,	%o7 ASI use replaced by convert2hboot
loop_990:
	xnor	%i0,	0x1117,	%i6
	fmovsge	%icc,	%f12,	%f15
	udivcc	%i1,	0x16E6,	%o5
	bg	loop_991
	orcc	%l5,	0x177C,	%l4
	edge32n	%o1,	%o4,	%i3
	fornot2	%f2,	%f0,	%f20
loop_991:
	fbul,a	%fcc3,	loop_992
	movvc	%icc,	%g3,	%l0
	bneg	loop_993
	ldd	[%l7 + 0x40],	%i2
loop_992:
	nop 	! 	taddcctv	%l2,	0x1203,	%i4 changed by convert2hboot
	fxors	%f1,	%f1,	%f11
loop_993:
	nop
	setx	loop_994,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	bpos	%icc,	loop_995
	mulx	%g6,	%g4,	%o0
	xor	%l6,	0x17CF,	%g2
loop_994:
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
loop_995:
	bneg,pt	%icc,	loop_996
	movvc	%xcc,	%g1,	%o3
	bgu,a	loop_997
	orn	%i5,	0x1C2E,	%o6
loop_996:
	sth	%g5,	[%l7 + 0x44]
	edge32	%o2,	%l1,	%l3
loop_997:
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
	smulcc	%i7,	%o7,	%i0
	nop 	! 	taddcctv	%i6,	%i1,	%g7 changed by convert2hboot
	udivx	%o5,	0x0FDB,	%l5
	subc	%l4,	%o4,	%i3
	ldsh	[%l7 + 0x32],	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l0,	%i2,	%o1
	subcc	%l2,	0x1626,	%i4
	movneg	%xcc,	%g6,	%g4
	edge32n	%l6,	%g2,	%g1
	ba,pt	%xcc,	loop_998
	mova	%icc,	%o0,	%o3
	nop 	! 	sir	0x1BE3 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_998:
	movre	%i5,	0x255,	%o6
	membar	#Sync
	set	0x40, %i0
	nop	 ! 	ldda	[%l7 + %i0] 0xf9,	%f16 ASI use replaced by convert2hboot
	movle	%icc,	%o2,	%l1
	nop 	! 	tcs	%xcc,	0x3 changed by convert2hboot
	alignaddrl	%g5,	%l3,	%o7
	fmovsle	%icc,	%f29,	%f19
	bleu,pt	%xcc,	loop_999
	nop 	! 	tpos	%xcc,	0x1 changed by convert2hboot
	edge16	%i0,	%i7,	%i1
	alignaddr	%i6,	%o5,	%g7
loop_999:
	movle	%xcc,	%l5,	%o4
	bgu,a	loop_1000
	membar	0x3C
	fandnot1	%f6,	%f28,	%f20
	nop 	! 	sir	0x03BE changed by convert2hboot
loop_1000:
	add	%l4,	%g3,	%l0
	fmovrse	%i2,	%f14,	%f25
	add	%o1,	%i3,	%i4
	movrlz	%l2,	%g6,	%l6
	movneg	%icc,	%g4,	%g2
	addccc	%o0,	0x03FF,	%g1
	brz	%i5,	loop_1001
	array16	%o6,	%o2,	%o3
	edge16	%l1,	%g5,	%o7
	fmovrdgz	%l3,	%f22,	%f30
loop_1001:
	nop
	wr	%g0,	0x88,	%asi
	brlz	%i1,	loop_1002
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	andcc	%i0,	%o5,	%g7
	movcc	%xcc,	%l5,	%o4
loop_1002:
	edge8	%i6,	%l4,	%l0
	movn	%xcc,	%g3,	%o1
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	fnand	%f26,	%f28,	%f12
	wr	%g0,	0x11,	%asi
	edge32	%i4,	%l2,	%g6
	fble,a	%fcc2,	loop_1003
	stx	%i2,	[%l7 + 0x30]
	srlx	%l6,	%g4,	%o0
	fbuge,a	%fcc0,	loop_1004
loop_1003:
	nop 	! 	ta	%xcc,	0x4 changed by convert2hboot
	movrlz	%g2,	0x2D8,	%g1
	array16	%o6,	%o2,	%o3
loop_1004:
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
	fbn	%fcc1,	loop_1005
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
	orcc	%i5,	%g5,	%o7
	movgu	%xcc,	%l1,	%l3
loop_1005:
	fcmpeq32	%f16,	%f4,	%i7
	ba,pt	%icc,	loop_1006
	fmovdleu	%icc,	%f26,	%f1
	membar	0x07
	edge8l	%i0,	%o5,	%i1
loop_1006:
	srl	%l5,	%o4,	%i6
	nop
	setx	loop_1007,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	orcc	%l4,	0x0D35,	%l0
	fpadd16	%f28,	%f6,	%f4
	smulcc	%g3,	0x0985,	%g7
loop_1007:
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	fabss	%f2,	%f23
	umul	%i3,	0x0666,	%o1
	edge8	%i4,	%g6,	%l2
	set	0x40, %i1
	nop	 ! 	stda	%f0,	[%l7 + %i1] 0x0c ASI use replaced by convert2hboot
	fcmpgt16	%f6,	%f24,	%i2
	ld	[%l7 + 0x3C],	%f25
	set	0x1E, %o4
	nop	 ! 	stha	%l6,	[%l7 + %o4] 0x04 ASI use replaced by convert2hboot
	mova	%icc,	%o0,	%g4
	fnegd	%f22,	%f20
	movvs	%icc,	%g2,	%g1
	edge8ln	%o2,	%o3,	%i5
	srlx	%g5,	%o6,	%l1
	fmovsvs	%xcc,	%f8,	%f27
	nop 	! 	tsubcc	%o7,	0x156C,	%i7 changed by convert2hboot
	mulx	%l3,	0x1E88,	%i0
	edge32l	%i1,	%o5,	%l5
	movrgz	%o4,	0x193,	%i6
	edge32ln	%l0,	%l4,	%g7
	sdiv	%g3,	0x0007,	%o1
	nop 	! 	tsubcc	%i4,	%g6,	%i3 changed by convert2hboot
	fnegd	%f4,	%f26
	bne,a	%xcc,	loop_1008
	movvc	%icc,	%l2,	%l6
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	array32	%i2,	%g4,	%o0
loop_1008:
	edge8ln	%g1,	%g2,	%o2
	fnot2	%f28,	%f12
	fnot2s	%f5,	%f29
	fmovdcc	%xcc,	%f10,	%f9
	ld	[%l7 + 0x34],	%f23
	movcc	%xcc,	%i5,	%o3
	fcmped	%fcc2,	%f24,	%f10
	subcc	%g5,	%o6,	%o7
	umulcc	%i7,	0x0B23,	%l3
	set	0x2A, %o6
	nop	 ! 	ldsba	[%l7 + %o6] 0x04,	%i0 ASI use replaced by convert2hboot
	andcc	%l1,	0x0CBF,	%o5
	movn	%icc,	%i1,	%o4
	movrgez	%i6,	%l5,	%l4
	wr	%g0,	0x80,	%asi
	nop
	set	0x42, %l4
	ldstub	[%l7 + %l4],	%g3
	fsrc1	%f20,	%f2
	nop 	! 	tsubcc	%g7,	0x1560,	%i4 changed by convert2hboot
	movle	%icc,	%o1,	%i3
	fbule,a	%fcc0,	loop_1009
	subc	%l2,	0x1B96,	%l6
	bpos	%xcc,	loop_1010
	edge16l	%g6,	%g4,	%o0
loop_1009:
	edge16ln	%g1,	%g2,	%i2
	array16	%i5,	%o2,	%o3
loop_1010:
	sll	%o6,	%o7,	%i7
	prefetch	[%l7 + 0x34],	 0x1
	ldstub	[%l7 + 0x2C],	%l3
	fnands	%f21,	%f3,	%f28
	udivx	%g5,	0x13E6,	%l1
	andcc	%o5,	%i1,	%i0
	and	%o4,	%l5,	%l4
	movcc	%icc,	%l0,	%i6
	addc	%g3,	%i4,	%g7
	subccc	%i3,	%l2,	%o1
	edge8	%l6,	%g4,	%o0
	smul	%g1,	%g6,	%i2
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	udivcc	%g2,	0x03F3,	%o2
	fxnor	%f2,	%f12,	%f10
	set	0x24, %i5
	nop	 ! 	lduha	[%l7 + %i5] 0x10,	%o3 ASI use replaced by convert2hboot
	for	%f20,	%f8,	%f28
	nop 	! 	tleu	%icc,	0x6 changed by convert2hboot
	edge32n	%o6,	%i5,	%o7
	nop 	! 	taddcctv	%l3,	%g5,	%i7 changed by convert2hboot
	fblg,a	%fcc3,	loop_1011
	bneg,a	%icc,	loop_1012
	nop 	! 	tleu	%xcc,	0x6 changed by convert2hboot
	edge8n	%l1,	%o5,	%i1
loop_1011:
	sllx	%i0,	0x0F,	%l5
loop_1012:
	fmovrse	%o4,	%f8,	%f17
	nop 	! 	tsubcctv	%l4,	%l0,	%i6 changed by convert2hboot
	membar	0x36
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x5 changed by convert2hboot
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	ldstub	[%l7 + 0x7C],	%g3
	addccc	%i4,	0x1390,	%g7
	fmovsleu	%xcc,	%f25,	%f25
	movneg	%icc,	%l2,	%o1
	ldsh	[%l7 + 0x76],	%l6
	orn	%i3,	0x14C8,	%g4
	fmovdneg	%xcc,	%f24,	%f2
	fmovsneg	%xcc,	%f31,	%f14
	fbn	%fcc3,	loop_1013
	fors	%f15,	%f4,	%f21
	nop 	! 	taddcc	%o0,	0x1ECC,	%g6 changed by convert2hboot
	mova	%icc,	%i2,	%g2
loop_1013:
	movvs	%icc,	%g1,	%o2
	st	%f22,	[%l7 + 0x2C]
	nop
	setx loop_1014, %l0, %l1
	jmpl %l1, %o6
	udiv	%o3,	0x0D54,	%o7
	bpos,pn	%xcc,	loop_1015
	fnegs	%f1,	%f28
loop_1014:
	movge	%xcc,	%i5,	%g5
	bl,a	%xcc,	loop_1016
loop_1015:
	ldub	[%l7 + 0x20],	%l3
	fandnot1s	%f0,	%f27,	%f20
	wr	%g0,	0x80,	%asi
loop_1016:
	membar	0x37
	movrlz	%l1,	%i1,	%i0
	wr	%g0,	0x04,	%asi
	fmul8sux16	%f18,	%f10,	%f20
	edge32n	%l5,	%l4,	%o4
	edge16n	%l0,	%g3,	%i6
	fba	%fcc0,	loop_1017
	movrne	%g7,	%l2,	%o1
	srl	%l6,	0x05,	%i3
	fcmpgt16	%f2,	%f30,	%g4
loop_1017:
	nop
	set	0x40, %o3
	nop	 ! 	ldda	[%l7 + %o3] 0x18,	%f0 ASI use replaced by convert2hboot
	addc	%i4,	%o0,	%g6
	edge8ln	%g2,	%g1,	%o2
	edge8n	%i2,	%o3,	%o6
	stw	%i5,	[%l7 + 0x34]
	set	0x0A, %g5
	nop	 ! 	lduba	[%l7 + %g5] 0x15,	%o7 ASI use replaced by convert2hboot
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	movcs	%icc,	%l3,	%g5
	fcmpeq16	%f20,	%f14,	%i7
	srax	%i1,	0x10,	%l1
	xnor	%i0,	0x0223,	%o5
	sethi	0x0ED9,	%l5
	array16	%o4,	%l4,	%l0
	fmul8x16au	%f30,	%f9,	%f14
	movrgez	%i6,	%g3,	%l2
	xnorcc	%g7,	%o1,	%i3
	sdiv	%g4,	0x0EC1,	%i4
	fmovda	%xcc,	%f6,	%f24
	wr	%g0,	0x04,	%asi
	pdist	%f26,	%f8,	%f22
	be,a,pn	%icc,	loop_1018
	fbg	%fcc2,	loop_1019
	fabsd	%f22,	%f18
	fmovdpos	%xcc,	%f22,	%f31
loop_1018:
	edge16ln	%g6,	%o0,	%g1
loop_1019:
	movvs	%xcc,	%g2,	%i2
	fbl	%fcc3,	loop_1020
	subc	%o3,	%o2,	%o6
	fnor	%f12,	%f30,	%f18
	sllx	%o7,	%i5,	%l3
loop_1020:
	subccc	%g5,	%i1,	%i7
	xnor	%i0,	%o5,	%l1
	nop 	! 	te	%icc,	0x0 changed by convert2hboot
	bne	loop_1021
	fcmpes	%fcc1,	%f12,	%f25
	fmul8ulx16	%f28,	%f10,	%f20
	movvc	%icc,	%l5,	%o4
loop_1021:
	sub	%l4,	0x0C5E,	%l0
	sth	%g3,	[%l7 + 0x42]
	ld	[%l7 + 0x28],	%f2
	sra	%i6,	0x1F,	%g7
	orcc	%l2,	%o1,	%i3
	nop 	! 	tcs	%icc,	0x4 changed by convert2hboot
	move	%xcc,	%g4,	%i4
	nop
	setx loop_1022, %l0, %l1
	jmpl %l1, %g6
	and	%l6,	%g1,	%g2
	wr	%g0,	0x10,	%asi
loop_1022:
	array16	%o3,	%i2,	%o6
	fornot2s	%f15,	%f4,	%f29
	edge8	%o7,	%o2,	%i5
	edge32l	%g5,	%l3,	%i7
	fpmerge	%f7,	%f17,	%f10
	movcs	%xcc,	%i0,	%i1
	brgez	%l1,	loop_1023
	movneg	%icc,	%l5,	%o5
	sll	%l4,	0x1F,	%l0
	fbn	%fcc0,	loop_1024
loop_1023:
	addccc	%g3,	%i6,	%g7
	ldsw	[%l7 + 0x7C],	%o4
	fornot1	%f22,	%f6,	%f14
loop_1024:
	stw	%o1,	[%l7 + 0x54]
	bcc,a	loop_1025
	umulcc	%l2,	%i3,	%i4
	membar	0x4B
	fcmpeq16	%f30,	%f30,	%g4
loop_1025:
	movvc	%xcc,	%l6,	%g6
	sdivx	%g2,	0x1CFF,	%o0
	fabsd	%f14,	%f2
	fbo,a	%fcc3,	loop_1026
	movneg	%icc,	%g1,	%o3
	fmovdcc	%xcc,	%f30,	%f11
	movre	%i2,	0x10D,	%o6
loop_1026:
	movl	%icc,	%o7,	%o2
	bge,a	loop_1027
	smulcc	%g5,	%l3,	%i7
	movvs	%xcc,	%i5,	%i0
	brz	%i1,	loop_1028
loop_1027:
	srlx	%l5,	%o5,	%l1
	subcc	%l4,	%g3,	%i6
	wr	%g0,	0x2a,	%asi
	membar	#Sync
loop_1028:
	xorcc	%o4,	0x114A,	%l0
	nop 	! 	tneg	%xcc,	0x7 changed by convert2hboot
	wr	%g0,	0x11,	%asi
	std	%o0,	[%l7 + 0x28]
	xnorcc	%i3,	%g4,	%l6
	fmovsneg	%xcc,	%f8,	%f20
	move	%xcc,	%i4,	%g6
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	nop	 ! 	casa	[%l6] 0x89,	%g2,	%g1 ASI use replaced by convert2hboot
	fbg,a	%fcc0,	loop_1029
	xnorcc	%o3,	0x1D88,	%i2
	movvc	%icc,	%o0,	%o7
	fnot1s	%f22,	%f20
loop_1029:
	edge8	%o2,	%o6,	%l3
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	andcc	%g5,	0x1B9C,	%i5
	addc	%i7,	0x0EB0,	%i0
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
	ldub	[%l7 + 0x37],	%l5
	alignaddrl	%o5,	%i1,	%l1
	orcc	%g3,	%l4,	%i6
	alignaddrl	%g7,	%o4,	%l2
	udiv	%o1,	0x1E2C,	%l0
	fbe	%fcc2,	loop_1030
	or	%g4,	0x1EC1,	%i3
	sethi	0x0AAB,	%i4
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
loop_1030:
	bshuffle	%f24,	%f12,	%f24
	fmovdleu	%icc,	%f27,	%f8
	orncc	%l6,	0x03F3,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g1,	0x05D9,	%o3
	fandnot1s	%f4,	%f30,	%f1
	fmovrdgez	%g6,	%f18,	%f26
	nop 	! 	taddcc	%o0,	0x1953,	%o7 changed by convert2hboot
	call	loop_1031
	fornot1s	%f26,	%f12,	%f17
	edge8	%i2,	%o2,	%l3
	movge	%xcc,	%o6,	%i5
loop_1031:
	subccc	%i7,	%g5,	%i0
	nop 	! 	tcs	%icc,	0x7 changed by convert2hboot
	fbne,a	%fcc2,	loop_1032
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	wr	%g0,	0x89,	%asi
loop_1032:
	orcc	%i1,	0x1AA4,	%o5
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	bvs,a	loop_1033
	movleu	%xcc,	%g3,	%l4
	set	0x1C, %l0
	nop	 ! 	stha	%l1,	[%l7 + %l0] 0x23 ASI use replaced by convert2hboot
	membar	#Sync
loop_1033:
	addccc	%g7,	0x0A39,	%i6
	nop 	! 	taddcc	%l2,	0x1FB6,	%o1 changed by convert2hboot
	andcc	%l0,	0x0D0F,	%g4
	addc	%i3,	%o4,	%i4
	bgu,pn	%xcc,	loop_1034
	sdivx	%l6,	0x12EE,	%g2
	brz	%o3,	loop_1035
	fmovdn	%xcc,	%f30,	%f0
loop_1034:
	sdivx	%g6,	0x16C0,	%o0
	wr	%g0,	0x27,	%asi
	membar	#Sync
loop_1035:
	nop
	wr	%g0,	0x88,	%asi
	fsrc1s	%f29,	%f0
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	fcmpne16	%f16,	%f10,	%o2
	edge8n	%g1,	%l3,	%i5
	swap	[%l7 + 0x6C],	%o6
	sdivx	%g5,	0x1B45,	%i0
	add	%l5,	%i7,	%o5
	fsrc1	%f6,	%f12
	set	0x0A, %o7
	nop	 ! 	stha	%i1,	[%l7 + %o7] 0xea ASI use replaced by convert2hboot
	membar	#Sync
	move	%xcc,	%l4,	%l1
	subc	%g3,	0x1C0F,	%i6
	bcs,a,pn	%xcc,	loop_1036
	movneg	%xcc,	%g7,	%o1
	set	0x38, %l1
	nop	 ! 	stwa	%l0,	[%l7 + %l1] 0x88 ASI use replaced by convert2hboot
loop_1036:
	and	%l2,	%i3,	%o4
	umul	%i4,	0x1ABD,	%l6
	nop 	! 	tl	%xcc,	0x4 changed by convert2hboot
	bvc	%icc,	loop_1037
	subc	%g2,	%g4,	%o3
	edge16	%g6,	%o0,	%i2
	orncc	%o2,	%g1,	%l3
loop_1037:
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	popc	0x187A,	%i5
	ldx	[%l7 + 0x38],	%o6
	bshuffle	%f20,	%f30,	%f24
	fmovdgu	%xcc,	%f27,	%f26
	fmul8sux16	%f16,	%f4,	%f20
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
	xorcc	%o7,	%g5,	%l5
	sdiv	%i7,	0x16BB,	%i0
	fmuld8ulx16	%f0,	%f0,	%f4
	fornot2	%f4,	%f26,	%f8
	nop 	! 	tg	%xcc,	0x0 changed by convert2hboot
	nop 	! 	sir	0x0E3A changed by convert2hboot
	fpadd32s	%f4,	%f25,	%f26
	nop
	set	0x1C, %g7
	lduw	[%l7 + %g7],	%i1
	wr	%g0,	0x0c,	%asi
	xorcc	%l1,	%l4,	%g3
	subc	%i6,	0x0020,	%o1
	move	%icc,	%g7,	%l0
	be	%xcc,	loop_1038
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
	movn	%xcc,	%i3,	%l2
	movrgez	%i4,	%l6,	%o4
loop_1038:
	movre	%g4,	0x203,	%g2
	alignaddrl	%g6,	%o3,	%o0
	std	%i2,	[%l7 + 0x70]
	nop 	! 	tvs	%xcc,	0x3 changed by convert2hboot
	movge	%xcc,	%o2,	%g1
	bcs,a,pn	%xcc,	loop_1039
	movcs	%icc,	%i5,	%o6
	fmovsl	%icc,	%f28,	%f0
	edge32n	%o7,	%l3,	%g5
loop_1039:
	nop 	! 	ta	%xcc,	0x5 changed by convert2hboot
	move	%xcc,	%i7,	%l5
	fbue,a	%fcc3,	loop_1040
	movl	%icc,	%i0,	%i1
	edge16ln	%o5,	%l4,	%g3
	nop 	! 	sir	0x111F changed by convert2hboot
loop_1040:
	fexpand	%f16,	%f20
	wr	%g0,	0x19,	%asi
	fpsub32	%f8,	%f8,	%f2
	fmovsn	%xcc,	%f26,	%f29
	orn	%i6,	0x02BB,	%o1
	fmovrse	%l0,	%f26,	%f29
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	ldstub	[%l7 + 0x0C],	%g7
	edge16l	%l2,	%i3,	%i4
	edge8ln	%o4,	%g4,	%g2
	movrgez	%l6,	%o3,	%o0
	fmovsl	%xcc,	%f6,	%f13
	bg,a,pt	%xcc,	loop_1041
	fcmped	%fcc0,	%f0,	%f10
	wr	%g0,	0x88,	%asi
loop_1041:
	sdiv	%o2,	0x1C08,	%g6
	brlz,a	%g1,	loop_1042
	fmovdneg	%icc,	%f1,	%f8
	srl	%i5,	%o7,	%l3
	edge16ln	%g5,	%o6,	%l5
loop_1042:
	nop
	wr	%g0,	0x80,	%asi
	srl	%i7,	0x0D,	%o5
	fmovdvs	%xcc,	%f8,	%f21
	fabsd	%f18,	%f28
	movrgz	%l4,	%g3,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l1,	%i6,	%l0
	fbn,a	%fcc1,	loop_1043
	sllx	%g7,	%l2,	%i3
	fba,a	%fcc2,	loop_1044
	call	loop_1045
loop_1043:
	swap	[%l7 + 0x34],	%o1
	edge8n	%i4,	%o4,	%g2
loop_1044:
	movrgez	%l6,	%g4,	%o3
loop_1045:
	fbul	%fcc3,	loop_1046
	nop 	! 	tcc	%icc,	0x4 changed by convert2hboot
	edge8n	%i2,	%o0,	%o2
	bgu	loop_1047
loop_1046:
	brlz,a	%g1,	loop_1048
	addc	%g6,	%o7,	%i5
	wr	%g0,	0x0c,	%asi
loop_1047:
	movvc	%icc,	%l3,	%l5
loop_1048:
	movn	%icc,	%o6,	%i0
	fnot1s	%f29,	%f23
	fmovda	%icc,	%f26,	%f2
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
	fnegd	%f12,	%f20
	mulscc	%o5,	0x10CC,	%i7
	wr	%g0,	0x0c,	%asi
	sub	%i1,	%l4,	%i6
	alignaddrl	%l1,	%l0,	%l2
	srax	%i3,	0x1D,	%g7
	nop 	! 	tle	%xcc,	0x3 changed by convert2hboot
	array32	%o1,	%i4,	%o4
	xnorcc	%g2,	%g4,	%o3
	smul	%i2,	%o0,	%l6
	fxor	%f4,	%f2,	%f0
	andn	%g1,	0x0896,	%o2
	movle	%xcc,	%g6,	%i5
	smul	%g5,	0x1D98,	%l3
	flush	%l7 + 0x3C
	nop
	set	0x70, %l2
	stx	%o7,	[%l7 + %l2]
	umul	%l5,	%i0,	%o5
	edge8	%i7,	%g3,	%o6
	nop 	! 	taddcc	%i1,	0x10C5,	%i6 changed by convert2hboot
	brnz	%l1,	loop_1049
	fmovsle	%xcc,	%f20,	%f9
	array16	%l0,	%l4,	%i3
	fnot1	%f0,	%f28
loop_1049:
	fmovrdne	%l2,	%f24,	%f16
	movrne	%g7,	0x03A,	%o1
	stb	%o4,	[%l7 + 0x09]
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	movge	%icc,	%i4,	%g4
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	sdivx	%o3,	0x0E3B,	%i2
	ldsw	[%l7 + 0x08],	%g2
	sub	%l6,	0x1663,	%o0
	nop 	! 	tgu	%xcc,	0x3 changed by convert2hboot
	lduw	[%l7 + 0x24],	%o2
	fxor	%f30,	%f14,	%f30
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	movcc	%icc,	%g5,	%l3
	wr	%g0,	0x04,	%asi
	nop 	! 	taddcctv	%l5,	%g6,	%o5 changed by convert2hboot
	fmovsgu	%xcc,	%f0,	%f11
	srl	%i0,	%g3,	%o6
	edge16ln	%i7,	%i1,	%l1
	edge32n	%l0,	%i6,	%i3
	fnot2	%f30,	%f20
	nop 	! 	te	%icc,	0x0 changed by convert2hboot
	movvc	%xcc,	%l2,	%l4
	movg	%xcc,	%o1,	%o4
	edge8	%g7,	%g4,	%o3
	udivx	%i4,	0x0202,	%g2
	movvc	%xcc,	%l6,	%o0
	fornot1s	%f30,	%f5,	%f12
	srl	%i2,	%g1,	%i5
	sth	%o2,	[%l7 + 0x7E]
	edge8l	%l3,	%o7,	%g5
	movrne	%l5,	0x063,	%g6
	alignaddr	%i0,	%g3,	%o6
	fxnors	%f27,	%f31,	%f25
	edge16n	%i7,	%i1,	%l1
	movne	%icc,	%o5,	%l0
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
	fcmpne32	%f14,	%f16,	%i6
	fnand	%f16,	%f20,	%f24
	bleu	loop_1050
	edge32l	%l2,	%l4,	%o1
	sdiv	%o4,	0x085B,	%g7
	movrgez	%i3,	0x11D,	%o3
loop_1050:
	bleu	%xcc,	loop_1051
	ldstub	[%l7 + 0x19],	%i4
	alignaddr	%g2,	%g4,	%o0
	movrlez	%l6,	0x0CB,	%g1
loop_1051:
	edge32	%i2,	%i5,	%o2
	fcmped	%fcc1,	%f16,	%f24
	ld	[%l7 + 0x34],	%f22
	edge32ln	%o7,	%l3,	%g5
	array32	%l5,	%g6,	%i0
	and	%g3,	0x004A,	%o6
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	ldx	[%l7 + 0x30],	%i1
	set	0x64, %l6
	nop	 ! 	stba	%l1,	[%l7 + %l6] 0xeb ASI use replaced by convert2hboot
	membar	#Sync
	sdivcc	%o5,	0x01F5,	%l0
	ldx	[%l7 + 0x38],	%i7
	fmovdneg	%xcc,	%f12,	%f28
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	srax	%i6,	0x08,	%l4
	fmovdcs	%icc,	%f20,	%f11
	ble,a	loop_1052
	nop 	! 	taddcc	%o1,	0x1124,	%l2 changed by convert2hboot
	smulcc	%o4,	%g7,	%o3
	fand	%f18,	%f18,	%f18
loop_1052:
	movneg	%xcc,	%i4,	%i3
	fsrc1	%f18,	%f30
	fmovde	%xcc,	%f15,	%f16
	bne	%xcc,	loop_1053
	brlez	%g2,	loop_1054
	edge32ln	%o0,	%l6,	%g1
	smulcc	%g4,	0x0A6E,	%i5
loop_1053:
	nop 	! 	tneg	%xcc,	0x7 changed by convert2hboot
loop_1054:
	sra	%o2,	%o7,	%l3
	fcmple16	%f0,	%f6,	%g5
	smul	%l5,	0x0092,	%g6
	movl	%xcc,	%i2,	%i0
	subcc	%o6,	%g3,	%i1
	edge16n	%l1,	%l0,	%o5
	fbn,a	%fcc3,	loop_1055
	edge32	%i7,	%l4,	%o1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	nop	 ! 	casa	[%l6] 0x88,	%l2,	%i6 ASI use replaced by convert2hboot
loop_1055:
	subcc	%g7,	0x1043,	%o3
	set	0x52, %l3
	nop	 ! 	ldsha	[%l7 + %l3] 0x04,	%o4 ASI use replaced by convert2hboot
	nop 	! 	tvc	%xcc,	0x0 changed by convert2hboot
	movleu	%icc,	%i4,	%i3
	nop 	! 	taddcc	%g2,	%l6,	%o0 changed by convert2hboot
	sllx	%g1,	%i5,	%o2
	sllx	%o7,	0x08,	%g4
	be	%icc,	loop_1056
	fbug	%fcc2,	loop_1057
	movneg	%icc,	%l3,	%l5
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
loop_1056:
	fmovsa	%icc,	%f31,	%f17
loop_1057:
	subccc	%g5,	%g6,	%i0
	sdivcc	%o6,	0x070B,	%g3
	fzeros	%f6
	subc	%i2,	%l1,	%i1
	ldub	[%l7 + 0x66],	%l0
	udivx	%o5,	0x0D33,	%l4
	sllx	%o1,	0x11,	%i7
	edge32	%i6,	%g7,	%l2
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	wr	%g0,	0x10,	%asi
	fba,a	%fcc0,	loop_1058
	andcc	%o3,	%i3,	%i4
	nop 	! 	ta	%xcc,	0x1 changed by convert2hboot
	fmovrdlez	%l6,	%f0,	%f2
loop_1058:
	move	%xcc,	%o0,	%g1
	sll	%i5,	0x12,	%o2
	edge32n	%o7,	%g2,	%l3
	andn	%g4,	0x1059,	%g5
	movvc	%icc,	%l5,	%g6
	sdiv	%o6,	0x1E4E,	%i0
	fmovdcc	%xcc,	%f14,	%f30
	edge8ln	%g3,	%i2,	%i1
	movgu	%xcc,	%l1,	%l0
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	bg,a,pt	%icc,	loop_1059
	movvc	%icc,	%l4,	%o5
	fmovsge	%icc,	%f8,	%f3
	edge32ln	%i7,	%i6,	%o1
loop_1059:
	movl	%icc,	%l2,	%g7
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	nop 	! 	ta	%icc,	0x2 changed by convert2hboot
	sdivcc	%o4,	0x1CEA,	%o3
	andn	%i3,	%l6,	%i4
	movg	%icc,	%o0,	%i5
	nop 	! 	tvs	%xcc,	0x0 changed by convert2hboot
	addc	%o2,	%o7,	%g2
	bcc,a,pn	%icc,	loop_1060
	edge16n	%g1,	%g4,	%g5
	nop 	! 	taddcc	%l5,	%g6,	%l3 changed by convert2hboot
	fones	%f25
loop_1060:
	faligndata	%f26,	%f28,	%f10
	lduw	[%l7 + 0x28],	%o6
	and	%i0,	%i2,	%g3
	brz	%i1,	loop_1061
	nop 	! 	tleu	%icc,	0x1 changed by convert2hboot
	fmovd	%f0,	%f22
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	nop	 ! 	casa	[%l6] 0x88,	%l1,	%l4 ASI use replaced by convert2hboot
loop_1061:
	movle	%icc,	%o5,	%i7
	fmovdvs	%xcc,	%f20,	%f9
	pdist	%f16,	%f22,	%f24
	edge8ln	%l0,	%i6,	%l2
	movrlez	%o1,	0x3A3,	%g7
	addcc	%o3,	%i3,	%o4
	alignaddr	%i4,	%l6,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a	loop_1062
	movg	%icc,	%o2,	%i5
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tge	%icc,	0x2 changed by convert2hboot
loop_1062:
	nop 	! 	tl	%xcc,	0x4 changed by convert2hboot
	edge16n	%o7,	%g1,	%g2
	fpmerge	%f27,	%f11,	%f28
	fmul8x16au	%f11,	%f11,	%f20
	fblg,a	%fcc3,	loop_1063
	fmovsneg	%xcc,	%f17,	%f12
	nop 	! 	tvs	%xcc,	0x7 changed by convert2hboot
	fornot2s	%f9,	%f11,	%f31
loop_1063:
	fmul8x16al	%f31,	%f15,	%f24
	udiv	%g4,	0x083D,	%l5
	nop 	! 	tleu	%xcc,	0x7 changed by convert2hboot
	edge8l	%g5,	%g6,	%o6
	ld	[%l7 + 0x64],	%f31
	nop 	! 	tcs	%icc,	0x4 changed by convert2hboot
	fcmpne16	%f14,	%f12,	%i0
	andn	%l3,	%i2,	%g3
	sdivx	%l1,	0x0C33,	%l4
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	umulcc	%i1,	%i7,	%o5
	edge8	%i6,	%l0,	%l2
	andncc	%o1,	%o3,	%g7
	movvs	%icc,	%i3,	%i4
	ldx	[%l7 + 0x30],	%l6
	set	0x33, %i3
	nop	 ! 	ldsba	[%l7 + %i3] 0x89,	%o4 ASI use replaced by convert2hboot
	bneg,a,pt	%icc,	loop_1064
	membar	0x3C
	fmovdleu	%icc,	%f3,	%f30
	wr	%g0,	0x80,	%asi
loop_1064:
	array32	%o0,	%i5,	%o7
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	wr	%g0,	0x80,	%asi
	subc	%g2,	%l5,	%g5
	movcc	%icc,	%g6,	%g4
	nop 	! 	taddcc	%o6,	0x1F40,	%i0 changed by convert2hboot
	fmovdgu	%xcc,	%f30,	%f13
	mulscc	%l3,	0x12EC,	%g3
	alignaddr	%i2,	%l4,	%i1
	wr	%g0,	0x10,	%asi
	edge8ln	%o5,	%i7,	%l0
	fnot2s	%f6,	%f13
	array8	%l2,	%o1,	%o3
	movge	%icc,	%g7,	%i3
	orn	%i4,	%i6,	%l6
	brnz	%o4,	loop_1065
	fbg,a	%fcc1,	loop_1066
	fbne,a	%fcc1,	loop_1067
	movcs	%xcc,	%o0,	%o2
loop_1065:
	xor	%i5,	0x1A66,	%g1
loop_1066:
	brnz	%g2,	loop_1068
loop_1067:
	edge16n	%o7,	%g5,	%g6
	udivx	%l5,	0x0D08,	%o6
	movgu	%xcc,	%g4,	%l3
loop_1068:
	movgu	%xcc,	%i0,	%g3
	fmul8x16	%f11,	%f28,	%f30
	edge16n	%i2,	%l4,	%i1
	movne	%icc,	%o5,	%l1
	movl	%xcc,	%l0,	%i7
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
	andn	%l2,	%o1,	%o3
	movcc	%icc,	%i3,	%g7
	movcc	%icc,	%i6,	%i4
	umul	%o4,	0x1E3B,	%o0
	array8	%o2,	%i5,	%l6
	array16	%g2,	%o7,	%g5
	wr	%g0,	0x89,	%asi
	lduw	[%l7 + 0x34],	%l5
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x2C] %asi,	%f25
	mova	%icc,	%g1,	%o6
	mova	%icc,	%g4,	%l3
	fnand	%f28,	%f2,	%f16
	brnz	%g3,	loop_1069
	ldd	[%l7 + 0x28],	%i2
	smulcc	%i0,	0x07F7,	%i1
	movneg	%icc,	%o5,	%l1
loop_1069:
	fmovscs	%xcc,	%f13,	%f26
	fcmpd	%fcc3,	%f26,	%f30
	movneg	%icc,	%l4,	%l0
	movg	%icc,	%i7,	%l2
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	movrgz	%o1,	%i3,	%g7
	fmovdge	%xcc,	%f8,	%f17
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f10,	%f9,	%f11
	smulcc	%o3,	0x1493,	%i6
	std	%i4,	[%l7 + 0x70]
	bvs,a	%icc,	loop_1070
	udivx	%o0,	0x1571,	%o4
	sdivx	%o2,	0x1681,	%i5
	fmovrde	%l6,	%f30,	%f20
loop_1070:
	movvc	%icc,	%g2,	%o7
	xor	%g5,	%g6,	%g1
	edge32ln	%l5,	%g4,	%l3
	fblg	%fcc0,	loop_1071
	movrgez	%g3,	0x133,	%i2
	set	0x12, %o0
	nop	 ! 	stba	%i0,	[%l7 + %o0] 0x88 ASI use replaced by convert2hboot
loop_1071:
	sdiv	%o6,	0x0250,	%i1
	sdivx	%l1,	0x1829,	%l4
	movn	%xcc,	%o5,	%l0
	fmovsn	%xcc,	%f16,	%f28
	edge8	%i7,	%l2,	%i3
	sra	%o1,	%g7,	%i6
	ba,a	loop_1072
	ldub	[%l7 + 0x54],	%i4
	or	%o3,	0x094E,	%o4
	movrlez	%o0,	%o2,	%l6
loop_1072:
	nop
	set	0x18, %g4
	sta	%f2,	[%l7 + %g4] 0x04
	flush	%l7 + 0x48
	srlx	%i5,	%g2,	%o7
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
	fmul8x16	%f26,	%f14,	%f12
	sdiv	%g6,	0x13E1,	%g5
	brgez	%g1,	loop_1073
	edge32	%g4,	%l5,	%g3
	bleu,a,pn	%xcc,	loop_1074
	nop 	! 	taddcctv	%i2,	0x030E,	%l3 changed by convert2hboot
loop_1073:
	movl	%xcc,	%o6,	%i0
	addc	%l1,	0x1C3C,	%l4
loop_1074:
	fbn	%fcc2,	loop_1075
	sdivcc	%i1,	0x1E55,	%l0
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	bn,pt	%xcc,	loop_1076
loop_1075:
	fmovrslez	%i7,	%f11,	%f2
	xorcc	%o5,	0x0BA7,	%l2
	edge8ln	%o1,	%g7,	%i6
loop_1076:
	popc	0x0574,	%i4
	movrlz	%i3,	%o4,	%o3
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	addcc	%o0,	%o2,	%l6
	addccc	%g2,	0x0A6E,	%o7
	edge16	%i5,	%g6,	%g5
	orcc	%g4,	0x0777,	%l5
	fabss	%f16,	%f10
	movrgez	%g1,	%i2,	%l3
	xorcc	%g3,	%o6,	%l1
	andncc	%i0,	%l4,	%l0
	fmovrsgez	%i7,	%f22,	%f11
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
	udivcc	%o5,	0x05CA,	%l2
	array32	%i1,	%o1,	%i6
	fcmpne16	%f22,	%f28,	%i4
	ldx	[%l7 + 0x60],	%g7
	orncc	%i3,	0x1004,	%o3
	or	%o0,	0x1336,	%o4
	subc	%o2,	%l6,	%o7
	fnands	%f6,	%f15,	%f18
	set	0x40, %g1
	nop	 ! 	stda	%f0,	[%l7 + %g1] 0x11 ASI use replaced by convert2hboot
	nop 	! 	sir	0x0F51 changed by convert2hboot
	andcc	%i5,	%g2,	%g5
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
	fmovscc	%xcc,	%f0,	%f19
	wr	%g0,	0x19,	%asi
	movn	%xcc,	%l5,	%g4
	fbg,a	%fcc2,	loop_1077
	fones	%f10
	movpos	%xcc,	%i2,	%g1
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
loop_1077:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f1,	%f22,	%f16
	movpos	%icc,	%g3,	%l3
	edge16	%l1,	%i0,	%o6
	bne,pn	%icc,	loop_1078
	sll	%l4,	%l0,	%o5
	movvs	%icc,	%l2,	%i7
	edge8	%i1,	%o1,	%i6
loop_1078:
	mulx	%i4,	%g7,	%o3
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
	fbo,a	%fcc2,	loop_1079
	nop 	! 	tsubcc	%i3,	%o4,	%o0 changed by convert2hboot
	edge32	%o2,	%l6,	%i5
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
loop_1079:
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	movrgez	%o7,	%g5,	%g6
	movpos	%xcc,	%g2,	%l5
	addccc	%g4,	%i2,	%g3
	bvc,pt	%icc,	loop_1080
	fmovdl	%xcc,	%f22,	%f22
	fcmpeq32	%f28,	%f28,	%l3
	movrgz	%g1,	0x37D,	%l1
loop_1080:
	bvs	loop_1081
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	edge16n	%i0,	%l4,	%l0
	fcmps	%fcc0,	%f13,	%f13
loop_1081:
	alignaddr	%o5,	%o6,	%i7
	nop 	! 	tsubcctv	%l2,	%o1,	%i1 changed by convert2hboot
	fbo,a	%fcc3,	loop_1082
	fsrc1	%f2,	%f20
	movcs	%xcc,	%i6,	%g7
	fzeros	%f11
loop_1082:
	nop 	! 	tsubcc	%o3,	0x0EB4,	%i4 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	mulscc	%o4,	0x0F69,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos	loop_1083
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	fmovrdgez	%i3,	%f30,	%f14
	fxnors	%f26,	%f22,	%f14
loop_1083:
	edge32ln	%o2,	%l6,	%o7
	fcmple16	%f2,	%f12,	%i5
	fmovdpos	%icc,	%f26,	%f8
	movvs	%icc,	%g6,	%g5
	set	0x68, %i2
	nop	 ! 	prefetcha	[%l7 + %i2] 0x11,	 0x1 ASI use replaced by convert2hboot
	orn	%g2,	%i2,	%g3
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	movl	%xcc,	%g4,	%l3
	bpos,pn	%icc,	loop_1084
	std	%f26,	[%l7 + 0x20]
	movvs	%xcc,	%g1,	%l1
	bne,pn	%xcc,	loop_1085
loop_1084:
	edge16ln	%i0,	%l0,	%o5
	membar	0x3C
	movre	%o6,	0x0DD,	%i7
loop_1085:
	fnors	%f27,	%f20,	%f30
	call	loop_1086
	orcc	%l4,	0x0410,	%o1
	fmovdl	%xcc,	%f24,	%f11
	addc	%i1,	0x06C0,	%i6
loop_1086:
	movrgz	%l2,	%g7,	%o3
	fpsub32s	%f7,	%f13,	%f21
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	array16	%i4,	%o0,	%i3
	fmovdpos	%icc,	%f6,	%f26
	bvs,a	loop_1087
	fcmped	%fcc0,	%f0,	%f18
	set	0x20, %o5
	nop	 ! 	ldda	[%l7 + %o5] 0x2b,	%o2 ASI use replaced by convert2hboot
loop_1087:
	lduh	[%l7 + 0x68],	%l6
	membar	0x64
	alignaddr	%o7,	%o4,	%g6
	fabsd	%f28,	%f12
	subccc	%g5,	%i5,	%l5
	movrlz	%i2,	0x3F5,	%g3
	wr	%g0,	0x2b,	%asi
	membar	#Sync
	edge16	%g4,	%l3,	%g1
	nop
	set	0x3E, %g6
	ldsb	[%l7 + %g6],	%l1
	edge32n	%i0,	%l0,	%o6
	fmovrdgz	%i7,	%f4,	%f20
	srax	%l4,	%o1,	%i1
	movneg	%icc,	%o5,	%l2
	fpadd32s	%f10,	%f4,	%f22
	orncc	%i6,	0x0D93,	%g7
	umul	%o3,	%o0,	%i4
	subccc	%o2,	%l6,	%i3
	mulscc	%o7,	%g6,	%g5
	fexpand	%f21,	%f14
	wr	%g0,	0x81,	%asi
	ldsw	[%l7 + 0x34],	%l5
	edge8	%i2,	%o4,	%g2
	udiv	%g3,	0x047A,	%l3
	subcc	%g1,	0x1FDA,	%g4
	nop 	! 	taddcctv	%i0,	%l1,	%l0 changed by convert2hboot
	edge8ln	%i7,	%l4,	%o1
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	fbu	%fcc1,	loop_1088
	fmovdge	%icc,	%f24,	%f2
	movrlez	%i1,	%o5,	%l2
	fblg,a	%fcc3,	loop_1089
loop_1088:
	ld	[%l7 + 0x5C],	%f14
	fornot1	%f20,	%f14,	%f24
	set	0x58, %g2
	sta	%f9,	[%l7 + %g2] 0x11
loop_1089:
	fpadd16	%f6,	%f22,	%f12
	edge8n	%o6,	%i6,	%o3
	umul	%g7,	%o0,	%o2
	edge32l	%i4,	%l6,	%i3
	subcc	%g6,	%g5,	%o7
	ldx	[%l7 + 0x20],	%i5
	addccc	%l5,	%o4,	%g2
	udiv	%i2,	0x169D,	%l3
	wr	%g0,	0xe2,	%asi
	membar	#Sync
	ldsw	[%l7 + 0x58],	%g3
	sdiv	%i0,	0x0B37,	%l1
	set	0x10, %l5
	nop	 ! 	ldda	[%l7 + %l5] 0x27,	%l0 ASI use replaced by convert2hboot
	fmovrdlz	%i7,	%f10,	%f2
	movvc	%xcc,	%g4,	%o1
	wr	%g0,	0x81,	%asi
	fnegd	%f16,	%f26
	movgu	%xcc,	%o5,	%l4
	edge32n	%l2,	%i6,	%o6
	xorcc	%o3,	0x1FB8,	%o0
	orcc	%g7,	%i4,	%l6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i3
	set	0x4A, %i4
	nop	 ! 	ldsha	[%l7 + %i4] 0x15,	%o2 ASI use replaced by convert2hboot
	move	%xcc,	%g5,	%o7
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	smulcc	%l5,	0x1999,	%o4
	wr	%g0,	0x11,	%asi
	addc	%i2,	%l3,	%g1
	addcc	%g3,	%i0,	%l1
	orn	%l0,	0x0757,	%i5
	bl,pn	%xcc,	loop_1090
	fmovde	%icc,	%f7,	%f27
	lduw	[%l7 + 0x28],	%i7
	stx	%g4,	[%l7 + 0x10]
loop_1090:
	fbl	%fcc0,	loop_1091
	nop
	setx	loop_1092,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop
	set	0x2C, %i6
	prefetch	[%l7 + %i6],	 0x1
	set	0x25, %g3
	nop	 ! 	ldstuba	[%l7 + %g3] 0x80,	%i1 ASI use replaced by convert2hboot
loop_1091:
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
loop_1092:
	nop 	! 	tcc	%xcc,	0x2 changed by convert2hboot
	and	%o5,	0x02CE,	%o1
	movgu	%icc,	%l2,	%i6
	fornot2	%f30,	%f6,	%f28
	fbg	%fcc0,	loop_1093
	sth	%o6,	[%l7 + 0x36]
	ld	[%l7 + 0x54],	%f0
	fnand	%f10,	%f10,	%f16
loop_1093:
	ldsb	[%l7 + 0x19],	%l4
	fmovrdgez	%o3,	%f26,	%f22
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	fabsd	%f24,	%f6
	fmovdcc	%icc,	%f7,	%f29
	fcmpne16	%f14,	%f30,	%g7
	fbo,a	%fcc1,	loop_1094
	ldsb	[%l7 + 0x7C],	%i4
	fmovrsgez	%l6,	%f24,	%f20
	movvc	%icc,	%o0,	%i3
loop_1094:
	nop
	set	0x18, %o1
	nop	 ! 	stxa	%o2,	[%l7 + %o1] 0x2a ASI use replaced by convert2hboot
	membar	#Sync
	set	0x60, %i7
	nop	 ! 	ldxa	[%l7 + %i7] 0x81,	%g5 ASI use replaced by convert2hboot
	sdivx	%g6,	0x0D0B,	%o7
	sub	%l5,	%o4,	%g2
	edge8l	%i2,	%l3,	%g3
	xnor	%g1,	%l1,	%i0
	addc	%i5,	%i7,	%g4
	movvs	%icc,	%l0,	%o5
	fmovsne	%xcc,	%f9,	%f10
	be,a	loop_1095
	popc	0x158F,	%i1
	smulcc	%o1,	%i6,	%o6
	fbne,a	%fcc1,	loop_1096
loop_1095:
	ldsb	[%l7 + 0x4B],	%l4
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	edge8ln	%l2,	%g7,	%o3
loop_1096:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1A0E,	%l6
	nop 	! 	tleu	%icc,	0x1 changed by convert2hboot
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
	subcc	%o0,	0x059E,	%i3
	movvs	%xcc,	%i4,	%g5
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	faligndata	%f16,	%f6,	%f6
	bvc,a	loop_1097
	nop 	! 	taddcctv	%g6,	%o7,	%o2 changed by convert2hboot
	orn	%l5,	0x007B,	%g2
	fmovdgu	%xcc,	%f1,	%f16
loop_1097:
	bcc,pn	%icc,	loop_1098
	nop 	! 	taddcc	%i2,	0x11A0,	%o4 changed by convert2hboot
	umul	%l3,	0x0FC8,	%g3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
loop_1098:
	sdiv	%g1,	0x1591,	%i5
	bl	loop_1099
	fbul	%fcc1,	loop_1100
	fmovrdlz	%i7,	%f30,	%f28
	fcmpd	%fcc2,	%f8,	%f10
loop_1099:
	andn	%l0,	%o5,	%i1
loop_1100:
	bg,a,pt	%icc,	loop_1101
	std	%g4,	[%l7 + 0x60]
	wr	%g0,	0xeb,	%asi
	membar	#Sync
loop_1101:
	edge32ln	%o6,	%i6,	%l2
	mulscc	%g7,	%l4,	%o3
	st	%f3,	[%l7 + 0x28]
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	fmovde	%icc,	%f21,	%f31
	bg,pt	%xcc,	loop_1102
	nop 	! 	tsubcc	%l6,	%i3,	%o0 changed by convert2hboot
	ba	%xcc,	loop_1103
	subcc	%g5,	0x1FC5,	%g6
loop_1102:
	sdiv	%o7,	0x0F0E,	%o2
	be,pn	%icc,	loop_1104
loop_1103:
	bcs	%icc,	loop_1105
	xorcc	%l5,	0x1F06,	%g2
	sllx	%i2,	0x12,	%i4
loop_1104:
	fcmpgt16	%f8,	%f0,	%l3
loop_1105:
	popc	%g3,	%o4
	smulcc	%i0,	0x10FB,	%l1
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	fmovrslz	%g1,	%f17,	%f28
	orn	%i7,	0x1909,	%i5
	movrgz	%l0,	%o5,	%g4
	fnegs	%f19,	%f3
	wr	%g0,	0x80,	%asi
	array16	%o6,	%o1,	%i6
	fmovsn	%icc,	%f7,	%f21
	xor	%g7,	0x084D,	%l2
	array8	%l4,	%l6,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o0,	%i3,	%g5
	sdivx	%g6,	0x10F4,	%o7
	addc	%o2,	0x0544,	%l5
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	fmovsne	%xcc,	%f14,	%f5
	xnorcc	%g2,	0x05A1,	%i4
	alignaddr	%i2,	%l3,	%o4
	array8	%i0,	%l1,	%g3
	fpadd32s	%f14,	%f29,	%f28
	xnor	%g1,	0x033B,	%i7
	edge16	%i5,	%o5,	%l0
	bleu	loop_1106
	movrlez	%g4,	0x119,	%i1
	bcs	%icc,	loop_1107
	orn	%o1,	0x124A,	%i6
loop_1106:
	movrgz	%g7,	%l2,	%o6
	sub	%l4,	0x0125,	%l6
loop_1107:
	fmovse	%xcc,	%f20,	%f26
	lduh	[%l7 + 0x4A],	%o0
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	bge,a	%xcc,	loop_1108
	edge32	%o3,	%i3,	%g6
	movneg	%icc,	%o7,	%o2
	edge16ln	%g5,	%g2,	%l5
loop_1108:
	addccc	%i4,	%i2,	%l3
	fbug	%fcc3,	loop_1109
	fbne,a	%fcc1,	loop_1110
	nop
	setx	loop_1111,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movgu	%xcc,	%i0,	%l1
loop_1109:
	nop 	! 	taddcctv	%g3,	0x1521,	%g1 changed by convert2hboot
loop_1110:
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
loop_1111:
	bshuffle	%f26,	%f22,	%f20
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	fmovscc	%xcc,	%f13,	%f1
	andncc	%i7,	%o4,	%i5
	nop 	! 	tpos	%icc,	0x3 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	fors	%f2,	%f8,	%f30
	umulcc	%g4,	0x179C,	%i1
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	wr	%g0,	0x18,	%asi
	sta	%f21,	[%l7 + 0x60] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x62, %o2
	nop	 ! 	ldsba	[%l7 + %o2] 0x89,	%o1 ASI use replaced by convert2hboot
	mulx	%o5,	0x055C,	%i6
	umul	%g7,	0x045F,	%o6
	fmovrsne	%l4,	%f28,	%f9
	set	0x3C, %i0
	nop	 ! 	swapa	[%l7 + %i0] 0x10,	%l2 ASI use replaced by convert2hboot
	fnands	%f21,	%f25,	%f19
	sub	%o0,	0x1A95,	%o3
	nop 	! 	tg	%icc,	0x3 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tleu	%icc,	0x6 changed by convert2hboot
	movg	%xcc,	%l6,	%i3
	andncc	%g6,	%o7,	%g5
	movre	%o2,	0x394,	%g2
	array16	%i4,	%i2,	%l5
	bvs,pn	%xcc,	loop_1112
	edge8l	%i0,	%l1,	%g3
	fpsub16s	%f18,	%f2,	%f30
	fmul8x16al	%f2,	%f8,	%f18
loop_1112:
	nop
	setx	loop_1113,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fmovrdlz	%l3,	%f22,	%f0
	or	%g1,	%o4,	%i7
	fcmple32	%f2,	%f22,	%i5
loop_1113:
	nop 	! 	tge	%icc,	0x2 changed by convert2hboot
	edge16n	%l0,	%i1,	%g4
	fmovdpos	%xcc,	%f11,	%f3
	fmovdl	%icc,	%f2,	%f21
	sdivx	%o1,	0x1A1C,	%i6
	add	%g7,	%o5,	%l4
	movle	%icc,	%o6,	%o0
	fmovda	%xcc,	%f30,	%f11
	edge8n	%o3,	%l2,	%l6
	movne	%icc,	%i3,	%g6
	call	loop_1114
	fble	%fcc0,	loop_1115
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	edge32	%o7,	%g5,	%o2
loop_1114:
	movvc	%xcc,	%i4,	%i2
loop_1115:
	fmovdleu	%icc,	%f6,	%f28
	and	%l5,	%g2,	%l1
	bne,pt	%xcc,	loop_1116
	array8	%i0,	%l3,	%g3
	mulscc	%g1,	0x1708,	%i7
	membar	0x0A
loop_1116:
	srlx	%o4,	0x02,	%i5
	nop
	set	0x20, %i1
	lduw	[%l7 + %i1],	%l0
	xorcc	%g4,	0x10BD,	%i1
	nop 	! 	sir	0x1DF6 changed by convert2hboot
	udiv	%i6,	0x1896,	%o1
	nop 	! 	sir	0x0E4A changed by convert2hboot
	wr	%g0,	0x19,	%asi
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	edge8ln	%l4,	%o5,	%o6
	set	0x40, %o4
	nop	 ! 	prefetcha	[%l7 + %o4] 0x89,	 0x0 ASI use replaced by convert2hboot
	edge16l	%o0,	%l2,	%i3
	set	0x0C, %l4
	nop	 ! 	swapa	[%l7 + %l4] 0x19,	%g6 ASI use replaced by convert2hboot
	smul	%o7,	%l6,	%g5
	fpackfix	%f24,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%xcc,	%f14,	%f28
	bne	loop_1117
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	alignaddrl	%i4,	%o2,	%i2
	fnot2	%f12,	%f26
loop_1117:
	fornot2	%f6,	%f22,	%f20
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
	movrgez	%l5,	%g2,	%l1
	srlx	%l3,	%i0,	%g3
	edge32ln	%g1,	%i7,	%i5
	array16	%o4,	%g4,	%l0
	bge,a,pt	%xcc,	loop_1118
	edge8n	%i6,	%o1,	%i1
	fpackfix	%f2,	%f0
	fmovdgu	%xcc,	%f10,	%f29
loop_1118:
	fbue	%fcc1,	loop_1119
	xnorcc	%l4,	0x09B2,	%o5
	fmovdne	%icc,	%f5,	%f8
	fpadd16s	%f10,	%f20,	%f31
loop_1119:
	fpackfix	%f4,	%f13
	movne	%icc,	%g7,	%o6
	wr	%g0,	0x19,	%asi
	fmovs	%f12,	%f3
	addcc	%l2,	%o3,	%i3
	movge	%icc,	%o7,	%l6
	bshuffle	%f2,	%f28,	%f14
	fmovs	%f28,	%f12
	fzero	%f30
	movgu	%icc,	%g5,	%g6
	fbg,a	%fcc1,	loop_1120
	fmovsgu	%xcc,	%f26,	%f21
	nop
	set	0x10, %i5
	std	%f28,	[%l7 + %i5]
	fpadd32s	%f6,	%f14,	%f20
loop_1120:
	nop
	wr	%g0,	0x80,	%asi
	fpack16	%f12,	%f19
	udivx	%i2,	0x0A50,	%l5
	umulcc	%o2,	0x1261,	%g2
	subccc	%l1,	0x183E,	%i0
	sdiv	%l3,	0x0B24,	%g1
	sth	%i7,	[%l7 + 0x24]
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
	std	%f6,	[%l7 + 0x18]
	nop 	! 	tcc	%icc,	0x1 changed by convert2hboot
	swap	[%l7 + 0x54],	%i5
	movne	%icc,	%g3,	%o4
	ldstub	[%l7 + 0x0E],	%l0
	movre	%i6,	%o1,	%g4
	fsrc2	%f26,	%f14
	movg	%xcc,	%l4,	%o5
	mova	%xcc,	%g7,	%o6
	nop
	set	0x22, %o6
	lduh	[%l7 + %o6],	%i1
	fmovs	%f21,	%f2
	fmovrdne	%l2,	%f0,	%f20
	fmovsg	%icc,	%f1,	%f3
	fbge,a	%fcc2,	loop_1121
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	nop
	setx	loop_1122,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	edge8ln	%o3,	%i3,	%o0
loop_1121:
	fmovdpos	%icc,	%f23,	%f24
	set	0x70, %g5
	nop	 ! 	prefetcha	[%l7 + %g5] 0x81,	 0x1 ASI use replaced by convert2hboot
loop_1122:
	edge16	%g5,	%o7,	%g6
	ldx	[%l7 + 0x28],	%i4
	membar	#Sync
	set	0x40, %l0
	nop	 ! 	ldda	[%l7 + %l0] 0xf9,	%f0 ASI use replaced by convert2hboot
	wr	%g0,	0x89,	%asi
	edge16n	%o2,	%l5,	%l1
	nop 	! 	tvs	%icc,	0x6 changed by convert2hboot
	bgu	%icc,	loop_1123
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	bvs	%xcc,	loop_1124
	bpos	%icc,	loop_1125
loop_1123:
	movrgez	%i0,	%g2,	%l3
	fblg	%fcc2,	loop_1126
loop_1124:
	sllx	%g1,	0x1B,	%i7
loop_1125:
	fbu	%fcc2,	loop_1127
	edge8l	%g3,	%i5,	%o4
loop_1126:
	sethi	0x15A0,	%i6
	fblg,a	%fcc0,	loop_1128
loop_1127:
	sdivcc	%o1,	0x1179,	%g4
	sll	%l0,	0x09,	%l4
	set	0x20, %o3
	nop	 ! 	prefetcha	[%l7 + %o3] 0x11,	 0x0 ASI use replaced by convert2hboot
loop_1128:
	andncc	%o6,	%i1,	%o5
	movrlez	%o3,	0x33A,	%i3
	sllx	%o0,	0x02,	%l2
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	andn	%g5,	%l6,	%g6
	or	%i4,	0x0213,	%i2
	fbg,a	%fcc1,	loop_1129
	udivcc	%o7,	0x0AD0,	%o2
	fbuge	%fcc0,	loop_1130
	bcc,pt	%xcc,	loop_1131
loop_1129:
	array16	%l1,	%l5,	%i0
	or	%l3,	%g1,	%i7
loop_1130:
	sdiv	%g3,	0x19B6,	%g2
loop_1131:
	bl	loop_1132
	sth	%o4,	[%l7 + 0x12]
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
	orcc	%i6,	0x10BA,	%i5
loop_1132:
	movrgz	%o1,	%g4,	%l4
	brlez	%l0,	loop_1133
	bgu,pn	%xcc,	loop_1134
	movle	%xcc,	%o6,	%g7
	xnor	%i1,	0x1309,	%o5
loop_1133:
	siam	0x2
loop_1134:
	for	%f10,	%f26,	%f24
	movne	%xcc,	%i3,	%o3
	andcc	%o0,	%l2,	%g5
	fpsub16s	%f12,	%f19,	%f22
	movge	%xcc,	%g6,	%i4
	bgu	loop_1135
	fmovdvs	%xcc,	%f25,	%f21
	bvc,pt	%xcc,	loop_1136
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
loop_1135:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l6,	0x1195,	%i2
loop_1136:
	fmovrslz	%o2,	%f5,	%f5
	nop 	! 	sir	0x12E5 changed by convert2hboot
	subccc	%o7,	0x08B3,	%l5
	fcmpd	%fcc2,	%f20,	%f18
	fornot2	%f26,	%f14,	%f26
	set	0x58, %o7
	lda	[%l7 + %o7] 0x04,	%f18
	fornot1	%f10,	%f8,	%f4
	movn	%icc,	%i0,	%l3
	ldub	[%l7 + 0x2E],	%l1
	sth	%g1,	[%l7 + 0x2A]
	lduh	[%l7 + 0x34],	%g3
	fexpand	%f20,	%f6
	bneg,pn	%xcc,	loop_1137
	xorcc	%i7,	%o4,	%i6
	movrlz	%i5,	0x03C,	%o1
	std	%f30,	[%l7 + 0x58]
loop_1137:
	alignaddr	%g2,	%g4,	%l0
	or	%l4,	%g7,	%o6
	udiv	%i1,	0x0825,	%o5
	set	0x40, %g7
	nop	 ! 	swapa	[%l7 + %g7] 0x88,	%o3 ASI use replaced by convert2hboot
	edge32ln	%i3,	%o0,	%l2
	nop 	! 	tgu	%xcc,	0x7 changed by convert2hboot
	ba	%icc,	loop_1138
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
	movvc	%icc,	%g6,	%g5
	ldd	[%l7 + 0x50],	%i4
loop_1138:
	movrgez	%i2,	0x017,	%o2
	orcc	%o7,	%l5,	%l6
	movne	%xcc,	%i0,	%l3
	stx	%g1,	[%l7 + 0x40]
	fands	%f6,	%f18,	%f0
	movleu	%xcc,	%l1,	%i7
	edge32l	%o4,	%g3,	%i5
	set	0x4B, %l1
	nop	 ! 	ldsba	[%l7 + %l1] 0x0c,	%i6 ASI use replaced by convert2hboot
	srax	%o1,	0x17,	%g2
	set	0x1A, %l2
	nop	 ! 	ldsha	[%l7 + %l2] 0x11,	%g4 ASI use replaced by convert2hboot
	bvc,pn	%icc,	loop_1139
	fmul8x16au	%f16,	%f22,	%f16
	xorcc	%l4,	%l0,	%o6
	ldx	[%l7 + 0x28],	%g7
loop_1139:
	fble,a	%fcc0,	loop_1140
	movle	%icc,	%o5,	%i1
	fmovrdlez	%i3,	%f30,	%f0
	brgez	%o0,	loop_1141
loop_1140:
	movcs	%icc,	%o3,	%l2
	st	%f3,	[%l7 + 0x54]
	fbn,a	%fcc2,	loop_1142
loop_1141:
	fpsub32s	%f14,	%f11,	%f12
	movcc	%icc,	%g6,	%g5
	wr	%g0,	0xeb,	%asi
	membar	#Sync
loop_1142:
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	nop
	setx loop_1143, %l0, %l1
	jmpl %l1, %o2
	edge16	%i4,	%l5,	%o7
	fbne	%fcc1,	loop_1144
	srlx	%i0,	0x08,	%l6
loop_1143:
	xnorcc	%l3,	0x0252,	%l1
	edge16n	%i7,	%g1,	%o4
loop_1144:
	add	%i5,	0x10F7,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f4,	%f2,	%f27
	addcc	%o1,	0x1D48,	%i6
	ldd	[%l7 + 0x60],	%g4
	fbl	%fcc0,	loop_1145
	nop 	! 	sir	0x076F changed by convert2hboot
	lduw	[%l7 + 0x20],	%l4
	fbu	%fcc0,	loop_1146
loop_1145:
	andcc	%l0,	%o6,	%g2
	be,a,pn	%icc,	loop_1147
	fandnot2	%f12,	%f30,	%f30
loop_1146:
	subc	%g7,	0x0EC4,	%o5
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
loop_1147:
	fmovdg	%icc,	%f31,	%f31
	fbule	%fcc3,	loop_1148
	sub	%i3,	%o0,	%i1
	bg,a	loop_1149
	movn	%xcc,	%o3,	%g6
loop_1148:
	andn	%g5,	%l2,	%o2
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
loop_1149:
	fsrc1s	%f28,	%f14
	array32	%i4,	%i2,	%l5
	stb	%o7,	[%l7 + 0x45]
	popc	0x1FDF,	%l6
	array32	%i0,	%l3,	%l1
	fmul8sux16	%f26,	%f6,	%f26
	movrgz	%i7,	0x17A,	%g1
	mulx	%i5,	%o4,	%g3
	fxor	%f18,	%f18,	%f14
	xnor	%i6,	0x0173,	%g4
	movcs	%icc,	%l4,	%l0
	srl	%o6,	0x1C,	%g2
	stb	%o1,	[%l7 + 0x63]
	set	0x4C, %l3
	nop	 ! 	lduwa	[%l7 + %l3] 0x19,	%o5 ASI use replaced by convert2hboot
	sdiv	%g7,	0x1B45,	%i3
	movre	%i1,	%o0,	%o3
	edge16	%g5,	%g6,	%o2
	edge8n	%i4,	%l2,	%l5
	movvc	%icc,	%i2,	%l6
	udiv	%i0,	0x06A5,	%l3
	nop 	! 	tleu	%icc,	0x6 changed by convert2hboot
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	fmovsge	%icc,	%f11,	%f17
	nop 	! 	tn	%icc,	0x5 changed by convert2hboot
	set	0x11, %i3
	nop	 ! 	ldstuba	[%l7 + %i3] 0x19,	%l1 ASI use replaced by convert2hboot
	nop 	! 	tsubcc	%o7,	%g1,	%i5 changed by convert2hboot
	wr	%g0,	0x0c,	%asi
	mulscc	%g3,	0x0C36,	%o4
	fmovde	%icc,	%f17,	%f10
	set	0x58, %l6
	nop	 ! 	ldsba	[%l7 + %l6] 0x80,	%g4 ASI use replaced by convert2hboot
	smulcc	%i6,	0x0FBA,	%l0
	fmul8x16	%f7,	%f2,	%f28
	wr	%g0,	0x2f,	%asi
	membar	#Sync
	array32	%l4,	%o1,	%o5
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	subcc	%g2,	%g7,	%i1
	orn	%o0,	%i3,	%g5
	movl	%icc,	%g6,	%o2
	fmovrdgz	%o3,	%f26,	%f2
	fands	%f23,	%f5,	%f9
	mulx	%l2,	%l5,	%i4
	nop 	! 	taddcctv	%i2,	%i0,	%l6 changed by convert2hboot
	bvc,a	%xcc,	loop_1150
	fornot1	%f20,	%f30,	%f26
	bcs,pn	%xcc,	loop_1151
	flush	%l7 + 0x70
loop_1150:
	fbe,a	%fcc3,	loop_1152
	movrlz	%l1,	0x210,	%o7
loop_1151:
	movrlz	%l3,	%g1,	%i7
	alignaddr	%g3,	%o4,	%g4
loop_1152:
	nop
	set	0x1E, %o0
	nop	 ! 	stha	%i5,	[%l7 + %o0] 0x27 ASI use replaced by convert2hboot
	membar	#Sync
	fxnors	%f23,	%f14,	%f28
	sdivcc	%l0,	0x0CD1,	%o6
	fexpand	%f28,	%f14
	fba	%fcc3,	loop_1153
	and	%i6,	%l4,	%o1
	fmovrdlez	%g2,	%f12,	%f0
	bvc,pn	%xcc,	loop_1154
loop_1153:
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x3 changed by convert2hboot
	edge16n	%o5,	%g7,	%o0
loop_1154:
	ldx	[%l7 + 0x20],	%i1
	movcs	%xcc,	%i3,	%g6
	nop 	! 	tsubcctv	%o2,	0x0209,	%o3 changed by convert2hboot
	fbo	%fcc1,	loop_1155
	andn	%g5,	%l5,	%l2
	umulcc	%i2,	%i0,	%i4
	fcmple16	%f28,	%f20,	%l1
loop_1155:
	edge8l	%l6,	%o7,	%g1
	array32	%i7,	%l3,	%o4
	orn	%g4,	%g3,	%i5
	movne	%xcc,	%o6,	%i6
	umul	%l0,	%o1,	%g2
	xnorcc	%l4,	0x063D,	%g7
	fones	%f15
	andncc	%o5,	%i1,	%o0
	ldsh	[%l7 + 0x7E],	%g6
	sllx	%o2,	0x03,	%o3
	andncc	%i3,	%l5,	%g5
	fmovse	%xcc,	%f31,	%f23
	srl	%l2,	%i2,	%i4
	wr	%g0,	0x18,	%asi
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	bgu,a	loop_1156
	umul	%l6,	%o7,	%i0
	bpos,pt	%icc,	loop_1157
	nop 	! 	tvc	%icc,	0x5 changed by convert2hboot
loop_1156:
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	fcmpne16	%f26,	%f6,	%g1
loop_1157:
	movn	%icc,	%l3,	%o4
	and	%i7,	%g4,	%i5
	fors	%f28,	%f26,	%f4
	addc	%g3,	0x1B23,	%i6
	fmovdne	%icc,	%f2,	%f28
	fble	%fcc2,	loop_1158
	fnot2	%f0,	%f0
	fmovdleu	%xcc,	%f19,	%f10
	subccc	%l0,	0x1971,	%o6
loop_1158:
	std	%g2,	[%l7 + 0x40]
	array16	%o1,	%l4,	%g7
	ldsb	[%l7 + 0x17],	%o5
	sra	%i1,	0x01,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o0,	0x0BF0,	%o2
	subcc	%o3,	0x19A4,	%l5
	fmovrdgz	%g5,	%f20,	%f30
	orn	%i3,	%l2,	%i4
	smul	%i2,	%l1,	%o7
	movle	%icc,	%l6,	%i0
	ba,a	loop_1159
	fbne,a	%fcc2,	loop_1160
	membar	0x7D
	fblg	%fcc2,	loop_1161
loop_1159:
	fmovrdne	%l3,	%f26,	%f16
loop_1160:
	nop
	wr	%g0,	0x18,	%asi
loop_1161:
	movrgez	%i7,	0x0A5,	%o4
	bne	loop_1162
	xorcc	%g4,	0x021C,	%g3
	movleu	%icc,	%i5,	%i6
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
loop_1162:
	call	loop_1163
	sllx	%l0,	0x1C,	%o6
	subccc	%g2,	0x012E,	%l4
	addc	%g7,	%o5,	%o1
loop_1163:
	sub	%i1,	%o0,	%g6
	nop
	setx	loop_1164,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	ldd	[%l7 + 0x68],	%o2
	xor	%o2,	%g5,	%l5
	movre	%i3,	%i4,	%l2
loop_1164:
	ba,a	loop_1165
	fpack32	%f28,	%f10,	%f4
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	bleu	%xcc,	loop_1166
loop_1165:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i2,	0x11E5,	%l1
	fmovrsgz	%l6,	%f14,	%f4
loop_1166:
	movrgez	%o7,	%l3,	%i0
	nop
	setx loop_1167, %l0, %l1
	jmpl %l1, %g1
	movrlz	%i7,	%o4,	%g4
	fmovsge	%icc,	%f14,	%f21
	sllx	%i5,	0x19,	%g3
loop_1167:
	andcc	%i6,	%o6,	%l0
	fpsub32	%f12,	%f20,	%f20
	orncc	%g2,	0x0C18,	%g7
	sdiv	%l4,	0x0AA4,	%o5
	movne	%icc,	%i1,	%o0
	movneg	%icc,	%g6,	%o3
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	alignaddr	%o1,	%g5,	%l5
	nop 	! 	te	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	ldstub	[%l7 + 0x54],	%o2
	fmovsneg	%icc,	%f31,	%f21
	set	0x6A, %g1
	nop	 ! 	ldsha	[%l7 + %g1] 0x11,	%i4 ASI use replaced by convert2hboot
	xorcc	%l2,	0x162E,	%i2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	orncc	%o7,	0x0ADD,	%l1
	fands	%f29,	%f21,	%f13
	fbu,a	%fcc2,	loop_1168
	edge16	%i0,	%g1,	%l3
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
	set	0x40, %g4
	nop	 ! 	ldda	[%l7 + %g4] 0x81,	%f16 ASI use replaced by convert2hboot
loop_1168:
	bgu,a,pt	%xcc,	loop_1169
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
	st	%f8,	[%l7 + 0x40]
	addc	%o4,	0x12F1,	%g4
loop_1169:
	fcmpgt16	%f8,	%f26,	%i5
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	stw	%i7,	[%l7 + 0x50]
	movle	%icc,	%g3,	%i6
	mulx	%l0,	%g2,	%o6
	sethi	0x1437,	%l4
	ldd	[%l7 + 0x28],	%f10
	movcs	%xcc,	%g7,	%i1
	edge16ln	%o0,	%g6,	%o3
	fabsd	%f26,	%f12
	srlx	%o1,	%g5,	%o5
	subc	%l5,	0x0DF6,	%o2
	edge32	%l2,	%i2,	%i4
	movge	%xcc,	%i3,	%o7
	fcmpeq32	%f8,	%f2,	%l6
	addcc	%i0,	0x00CC,	%g1
	ld	[%l7 + 0x5C],	%f7
	fmul8sux16	%f10,	%f20,	%f28
	udivx	%l3,	0x008F,	%o4
	fandnot1	%f2,	%f24,	%f12
	addcc	%g4,	%l1,	%i5
	wr	%g0,	0x80,	%asi
	sllx	%i6,	%g3,	%l0
	stb	%o6,	[%l7 + 0x16]
	brgz,a	%g2,	loop_1170
	srax	%g7,	0x13,	%l4
	sllx	%i1,	%g6,	%o0
	set	0x7A, %i2
	nop	 ! 	stba	%o1,	[%l7 + %i2] 0x11 ASI use replaced by convert2hboot
loop_1170:
	nop
	wr	%g0,	0x22,	%asi
	membar	#Sync
	fbl,a	%fcc3,	loop_1171
	movcs	%icc,	%g5,	%o5
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	edge32ln	%o2,	%l2,	%i2
loop_1171:
	nop
	wr	%g0,	0x80,	%asi
	mulscc	%i3,	0x0F4C,	%o7
	move	%xcc,	%l5,	%l6
	movne	%icc,	%i0,	%g1
	brz,a	%o4,	loop_1172
	mulx	%l3,	%l1,	%i5
	sth	%i7,	[%l7 + 0x4E]
	fsrc2	%f16,	%f20
loop_1172:
	addccc	%i6,	0x1350,	%g3
	mova	%icc,	%g4,	%o6
	fmuld8sux16	%f8,	%f29,	%f20
	nop 	! 	tle	%xcc,	0x5 changed by convert2hboot
	mulx	%l0,	%g2,	%g7
	bneg,pt	%xcc,	loop_1173
	sdiv	%l4,	0x0206,	%g6
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
	fcmpeq32	%f4,	%f10,	%i1
loop_1173:
	nop
	setx	loop_1174,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	xnorcc	%o0,	%o3,	%g5
	edge32l	%o1,	%o2,	%l2
loop_1174:
	nop
	setx	loop_1175,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fbe	%fcc0,	loop_1176
	fmovdle	%xcc,	%f10,	%f12
	fsrc2	%f26,	%f8
loop_1175:
	edge16ln	%o5,	%i2,	%i3
loop_1176:
	srlx	%i4,	%l5,	%o7
	nop 	! 	sir	0x1B88 changed by convert2hboot
	fmovdge	%xcc,	%f27,	%f8
	set	0x4E, %o5
	nop	 ! 	lduha	[%l7 + %o5] 0x15,	%i0 ASI use replaced by convert2hboot
	addc	%g1,	0x054B,	%o4
	edge16	%l3,	%l1,	%l6
	movl	%icc,	%i5,	%i6
	set	0x1C, %g6
	lda	[%l7 + %g6] 0x14,	%f24
	nop 	! 	tvs	%xcc,	0x2 changed by convert2hboot
	andcc	%i7,	%g3,	%g4
	edge16n	%l0,	%o6,	%g2
	addcc	%g7,	%g6,	%i1
	subcc	%l4,	0x0C94,	%o0
	nop 	! 	tgu	%xcc,	0x3 changed by convert2hboot
	subcc	%o3,	0x1653,	%o1
	nop 	! 	tsubcc	%g5,	0x0E31,	%l2 changed by convert2hboot
	pdist	%f10,	%f10,	%f16
	fcmpgt32	%f0,	%f18,	%o2
	fbge,a	%fcc0,	loop_1177
	and	%i2,	0x1FAC,	%i3
	fbn,a	%fcc3,	loop_1178
	edge32	%o5,	%i4,	%l5
loop_1177:
	edge8ln	%i0,	%o7,	%g1
	fpack16	%f2,	%f3
loop_1178:
	and	%l3,	%l1,	%o4
	bgu,pn	%xcc,	loop_1179
	fbge,a	%fcc0,	loop_1180
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
	fxors	%f24,	%f8,	%f14
loop_1179:
	for	%f28,	%f30,	%f0
loop_1180:
	nop 	! 	tge	%icc,	0x3 changed by convert2hboot
	fbne,a	%fcc3,	loop_1181
	movvc	%xcc,	%l6,	%i5
	edge32	%i6,	%g3,	%i7
	fzero	%f30
loop_1181:
	sra	%l0,	0x01,	%o6
	orncc	%g2,	%g4,	%g7
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	ldsw	[%l7 + 0x44],	%i1
	call	loop_1182
	nop
	setx	loop_1183,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	call	loop_1184
	fbule,a	%fcc3,	loop_1185
loop_1182:
	xorcc	%g6,	%l4,	%o0
loop_1183:
	edge16ln	%o3,	%g5,	%o1
loop_1184:
	edge8n	%o2,	%l2,	%i2
loop_1185:
	fmul8sux16	%f16,	%f8,	%f10
	fbuge,a	%fcc2,	loop_1186
	fabsd	%f26,	%f8
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	fcmps	%fcc1,	%f11,	%f8
loop_1186:
	smulcc	%i3,	0x1ECC,	%i4
	srl	%l5,	%o5,	%o7
	fmovdl	%icc,	%f17,	%f4
	wr	%g0,	0x04,	%asi
	fnot1	%f22,	%f6
	ldsw	[%l7 + 0x1C],	%l3
	alignaddrl	%l1,	%o4,	%g1
	subccc	%l6,	0x0257,	%i5
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	nop	 ! 	casa	[%l6] 0x80,	%i6,	%g3 ASI use replaced by convert2hboot
	nop 	! 	tsubcc	%l0,	0x15A6,	%o6 changed by convert2hboot
	movvc	%icc,	%g2,	%g4
	fmovsa	%icc,	%f9,	%f10
	fnot1s	%f29,	%f21
	fpmerge	%f4,	%f0,	%f10
	subcc	%g7,	0x1C3A,	%i1
	fba,a	%fcc3,	loop_1187
	fmovdcc	%icc,	%f14,	%f14
	fmovdneg	%xcc,	%f18,	%f1
	wr	%g0,	0x11,	%asi
loop_1187:
	nop 	! 	tcc	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	fmovde	%xcc,	%f21,	%f2
	sllx	%l4,	0x1F,	%g6
	array32	%o3,	%o0,	%g5
	fbg,a	%fcc2,	loop_1188
	udivcc	%o2,	0x0EB9,	%o1
	mulx	%i2,	0x02FD,	%l2
	edge16	%i3,	%l5,	%o5
loop_1188:
	umul	%o7,	0x162F,	%i0
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
	move	%xcc,	%l3,	%l1
	movcc	%xcc,	%o4,	%i4
	fpack16	%f16,	%f31
	wr	%g0,	0x0c,	%asi
	siam	0x4
	nop 	! 	taddcctv	%i5,	0x0044,	%i6 changed by convert2hboot
	fandnot1s	%f10,	%f7,	%f29
	edge16n	%g1,	%l0,	%g3
	fcmple16	%f2,	%f18,	%g2
	smul	%o6,	0x00FC,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%g4,	%i7,	%l4
	fbn,a	%fcc1,	loop_1189
	fmovdpos	%icc,	%f25,	%f11
	fsrc1s	%f1,	%f4
	movg	%icc,	%g6,	%o3
loop_1189:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f11,	%f0,	%f4
	nop
	set	0x2C, %g2
	sth	%o0,	[%l7 + %g2]
	addc	%i1,	0x0C5F,	%o2
	movge	%xcc,	%g5,	%o1
	subccc	%l2,	0x081A,	%i2
	ldstub	[%l7 + 0x6B],	%l5
	udivx	%o5,	0x0C6D,	%o7
	fpadd16	%f24,	%f0,	%f2
	edge32	%i3,	%i0,	%l3
	mova	%xcc,	%o4,	%l1
	nop 	! 	tleu	%xcc,	0x7 changed by convert2hboot
	for	%f4,	%f30,	%f30
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	fpsub16	%f30,	%f12,	%f8
	bneg,a	loop_1190
	andcc	%i4,	%l6,	%i6
	movrgez	%i5,	%l0,	%g1
loop_1190:
	orn	%g2,	0x1BEF,	%o6
	fcmple16	%f10,	%f8,	%g7
	edge8l	%g3,	%g4,	%i7
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
	subc	%l4,	0x069D,	%g6
	fmovspos	%icc,	%f3,	%f27
	array32	%o0,	%i1,	%o2
	fmovsgu	%icc,	%f17,	%f2
	nop 	! 	taddcc	%g5,	%o1,	%o3 changed by convert2hboot
	fmovdvc	%xcc,	%f20,	%f9
	nop 	! 	tleu	%icc,	0x7 changed by convert2hboot
	xnorcc	%i2,	0x1A92,	%l2
	swap	[%l7 + 0x28],	%o5
	movgu	%xcc,	%o7,	%i3
	fbg,a	%fcc0,	loop_1191
	movleu	%xcc,	%i0,	%l3
	brz	%l5,	loop_1192
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%o4
loop_1191:
	andcc	%i4,	%l6,	%l1
	orncc	%i6,	%l0,	%g1
loop_1192:
	fpmerge	%f29,	%f30,	%f18
	srlx	%i5,	%g2,	%g7
	andncc	%g3,	%g4,	%i7
	flush	%l7 + 0x68
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
	fmul8x16al	%f6,	%f14,	%f16
	ble	loop_1193
	movl	%icc,	%l4,	%g6
	fornot2s	%f19,	%f23,	%f9
	edge32	%o0,	%i1,	%o6
loop_1193:
	movcc	%icc,	%o2,	%o1
	lduh	[%l7 + 0x2C],	%o3
	mova	%xcc,	%i2,	%g5
	nop 	! 	tn	%icc,	0x5 changed by convert2hboot
	for	%f28,	%f26,	%f26
	edge32n	%o5,	%l2,	%i3
	sdiv	%i0,	0x13B5,	%l3
	edge32	%l5,	%o4,	%i4
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	wr	%g0,	0x2b,	%asi
	membar	#Sync
	fpack16	%f20,	%f31
	edge32l	%l1,	%i6,	%l0
	bn,a	loop_1194
	movcc	%xcc,	%g1,	%i5
	sub	%l6,	0x100C,	%g2
	sethi	0x0EEE,	%g7
loop_1194:
	fmovrdlz	%g3,	%f20,	%f10
	movcs	%xcc,	%i7,	%l4
	fmovsvc	%xcc,	%f30,	%f27
	sllx	%g6,	%g4,	%o0
	addccc	%i1,	%o2,	%o1
	movge	%xcc,	%o3,	%i2
	movneg	%icc,	%o6,	%o5
	ldub	[%l7 + 0x53],	%l2
	fpackfix	%f26,	%f6
	mulx	%i3,	0x09EE,	%g5
	alignaddrl	%l3,	%i0,	%l5
	movn	%xcc,	%i4,	%o4
	umul	%o7,	0x156A,	%i6
	wr	%g0,	0x10,	%asi
	srlx	%g1,	0x18,	%i5
	fbne	%fcc3,	loop_1195
	smulcc	%l6,	%l0,	%g2
	array16	%g3,	%i7,	%g7
	srlx	%l4,	%g4,	%o0
loop_1195:
	add	%i1,	0x12DC,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f16,	%f30,	%f10
	fmovspos	%xcc,	%f12,	%f10
	ldsh	[%l7 + 0x28],	%o1
	nop 	! 	tg	%icc,	0x1 changed by convert2hboot
	movgu	%icc,	%o3,	%g6
	fandnot2s	%f20,	%f16,	%f13
	movvs	%xcc,	%i2,	%o6
	andcc	%l2,	%i3,	%g5
	set	0x60, %i6
	nop	 ! 	ldda	[%l7 + %i6] 0x89,	%o4 ASI use replaced by convert2hboot
	alignaddr	%i0,	%l3,	%l5
	nop
	setx loop_1196, %l0, %l1
	jmpl %l1, %i4
	fmovsle	%icc,	%f9,	%f6
	subcc	%o4,	0x0AAB,	%i6
	fmovrde	%o7,	%f22,	%f18
loop_1196:
	fcmpne16	%f8,	%f4,	%l1
	edge16	%i5,	%l6,	%l0
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	lduw	[%l7 + 0x40],	%g2
	wr	%g0,	0x89,	%asi
	subcc	%i7,	0x19AB,	%g7
	subccc	%g1,	%l4,	%g4
	set	0x50, %g3
	nop	 ! 	stwa	%i1,	[%l7 + %g3] 0x04 ASI use replaced by convert2hboot
	movg	%xcc,	%o0,	%o2
	fblg	%fcc3,	loop_1197
	nop 	! 	taddcc	%o3,	%o1,	%g6 changed by convert2hboot
	array16	%i2,	%o6,	%i3
	fsrc1s	%f26,	%f17
loop_1197:
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	fors	%f2,	%f28,	%f18
	andcc	%l2,	0x1975,	%o5
	fmovdcc	%icc,	%f18,	%f17
	edge8	%i0,	%l3,	%l5
	wr	%g0,	0xea,	%asi
	membar	#Sync
	edge8ln	%i4,	%i6,	%o4
	fmovrdlez	%l1,	%f20,	%f26
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x4 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i5,	%l6,	%o7
	sdiv	%l0,	0x0DFE,	%g2
	move	%icc,	%i7,	%g3
	orn	%g7,	0x1EDC,	%g1
	fpadd16s	%f5,	%f12,	%f0
	movrgz	%l4,	0x005,	%g4
	nop
	setx	loop_1198,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fmovdle	%xcc,	%f10,	%f20
	nop 	! 	tvc	%xcc,	0x3 changed by convert2hboot
	sll	%i1,	%o2,	%o3
loop_1198:
	movrlz	%o0,	%g6,	%o1
	edge32	%o6,	%i2,	%l2
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	fmovdpos	%icc,	%f31,	%f23
	fmovsleu	%xcc,	%f11,	%f19
	fandnot1	%f18,	%f26,	%f20
	siam	0x6
	edge8	%o5,	%i0,	%l3
	fmovrdlz	%i3,	%f26,	%f16
	fabss	%f29,	%f8
	mova	%xcc,	%g5,	%l5
	movneg	%xcc,	%i6,	%o4
	set	0x40, %i4
	nop	 ! 	stba	%i4,	[%l7 + %i4] 0x88 ASI use replaced by convert2hboot
	movleu	%xcc,	%i5,	%l1
	bvc,a	loop_1199
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
	wr	%g0,	0x80,	%asi
loop_1199:
	nop 	! 	taddcctv	%l0,	%g2,	%i7 changed by convert2hboot
	sethi	0x114E,	%o7
	fone	%f26
	movrne	%g3,	%g1,	%l4
	nop 	! 	tsubcctv	%g4,	%g7,	%i1 changed by convert2hboot
	mova	%icc,	%o3,	%o0
	array32	%o2,	%g6,	%o6
	andcc	%o1,	0x1440,	%l2
	movneg	%icc,	%i2,	%o5
	edge16l	%i0,	%l3,	%g5
	sdiv	%i3,	0x19F3,	%i6
	edge8n	%l5,	%o4,	%i4
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	nop 	! 	taddcc	%i5,	%l1,	%l6 changed by convert2hboot
	nop 	! 	tvs	%xcc,	0x0 changed by convert2hboot
	mulx	%g2,	0x0824,	%l0
	edge32	%o7,	%g3,	%g1
	movrne	%i7,	%l4,	%g4
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
	fpack16	%f0,	%f20
	fmovdgu	%xcc,	%f3,	%f29
	move	%xcc,	%g7,	%o3
	movvc	%icc,	%o0,	%i1
	set	0x32, %i7
	nop	 ! 	stha	%o2,	[%l7 + %i7] 0x80 ASI use replaced by convert2hboot
	fbn,a	%fcc2,	loop_1200
	orn	%o6,	0x0168,	%o1
	sth	%g6,	[%l7 + 0x6A]
	movrne	%i2,	%o5,	%l2
loop_1200:
	nop
	wr	%g0,	0x80,	%asi
	fbn,a	%fcc3,	loop_1201
	stw	%l3,	[%l7 + 0x1C]
	fmovrse	%g5,	%f27,	%f20
	fmovscs	%xcc,	%f6,	%f23
loop_1201:
	edge8n	%i0,	%i6,	%l5
	fmovsvc	%xcc,	%f1,	%f25
	smulcc	%i3,	%o4,	%i4
	movn	%icc,	%l1,	%i5
	ldd	[%l7 + 0x68],	%i6
	srlx	%l0,	%g2,	%o7
	bn,pn	%icc,	loop_1202
	xor	%g1,	0x1EEB,	%i7
	add	%g3,	0x1ADF,	%g4
	movleu	%xcc,	%l4,	%o3
loop_1202:
	nop
	wr	%g0,	0xe2,	%asi
	membar	#Sync
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	brlez,a	%i1,	loop_1203
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o2,	%o6,	%g7
	fmovdcc	%xcc,	%f14,	%f4
loop_1203:
	edge16	%g6,	%o1,	%o5
	udiv	%l2,	0x028C,	%i2
	or	%g5,	%i0,	%l3
	fmovdcs	%icc,	%f1,	%f13
	edge8	%i6,	%i3,	%o4
	xnor	%l5,	0x1D3E,	%l1
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
	movrgez	%i4,	%i5,	%l6
	fbl	%fcc3,	loop_1204
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
	umulcc	%l0,	%g2,	%g1
	fmuld8ulx16	%f3,	%f1,	%f14
loop_1204:
	udivcc	%o7,	0x13DE,	%i7
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	and	%g4,	0x1A9A,	%g3
	movrne	%o3,	0x11E,	%l4
	sll	%i1,	%o2,	%o6
	fmovsvc	%xcc,	%f3,	%f21
	ldsh	[%l7 + 0x42],	%g7
	movneg	%icc,	%g6,	%o0
	brgz,a	%o1,	loop_1205
	edge32ln	%l2,	%o5,	%i2
	brz	%i0,	loop_1206
	movcc	%icc,	%g5,	%l3
loop_1205:
	movneg	%icc,	%i6,	%o4
	orcc	%i3,	0x06EC,	%l5
loop_1206:
	udivx	%l1,	0x145A,	%i4
	std	%i6,	[%l7 + 0x60]
	alignaddr	%i5,	%l0,	%g1
	fbge,a	%fcc1,	loop_1207
	stb	%o7,	[%l7 + 0x58]
	nop 	! 	sir	0x0BAE changed by convert2hboot
	sdivcc	%g2,	0x1422,	%i7
loop_1207:
	or	%g4,	0x11AE,	%g3
	fsrc1	%f24,	%f0
	nop 	! 	taddcctv	%l4,	%o3,	%i1 changed by convert2hboot
	orn	%o2,	%g7,	%o6
	andcc	%o0,	0x04E7,	%o1
	fnegs	%f27,	%f4
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	sra	%l2,	%g6,	%o5
	fmovrdlez	%i2,	%f22,	%f18
	fmovdl	%icc,	%f17,	%f17
	srlx	%g5,	0x12,	%l3
	movcc	%icc,	%i0,	%o4
	subc	%i3,	0x0FA8,	%i6
	brlez,a	%l5,	loop_1208
	fmovsl	%icc,	%f3,	%f6
	movrlez	%i4,	0x306,	%l1
	srax	%l6,	%i5,	%l0
loop_1208:
	movge	%icc,	%g1,	%o7
	nop 	! 	taddcctv	%g2,	0x1B60,	%g4 changed by convert2hboot
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
	st	%f11,	[%l7 + 0x1C]
	fmovdne	%xcc,	%f2,	%f27
	wr	%g0,	0x11,	%asi
	edge16ln	%g3,	%o3,	%i1
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	move	%icc,	%l4,	%o2
	edge16n	%o6,	%g7,	%o1
	movrgz	%l2,	0x04A,	%g6
	bleu,pt	%xcc,	loop_1209
	fblg	%fcc2,	loop_1210
	subc	%o0,	%i2,	%o5
	addccc	%l3,	%i0,	%o4
loop_1209:
	movvc	%xcc,	%g5,	%i6
loop_1210:
	nop
	wr	%g0,	0xe2,	%asi
	membar	#Sync
	subcc	%l5,	0x0930,	%i4
	edge32l	%l6,	%i5,	%l0
	addccc	%l1,	0x1C30,	%o7
	umulcc	%g2,	0x0A59,	%g1
	fba,a	%fcc0,	loop_1211
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	fcmpne16	%f6,	%f18,	%g4
	mulscc	%i7,	%o3,	%g3
loop_1211:
	fornot1	%f16,	%f14,	%f20
	sll	%l4,	0x17,	%i1
	fmovrdlez	%o2,	%f0,	%f2
	array16	%g7,	%o6,	%l2
	fba,a	%fcc0,	loop_1212
	fpadd16	%f8,	%f0,	%f8
	fmovsl	%xcc,	%f23,	%f13
	addc	%o1,	0x1F00,	%g6
loop_1212:
	fpack16	%f10,	%f2
	bgu	loop_1213
	sllx	%o0,	0x17,	%i2
	sllx	%l3,	0x1F,	%i0
	wr	%g0,	0x80,	%asi
loop_1213:
	brgez,a	%o5,	loop_1214
	bleu,pn	%xcc,	loop_1215
	smulcc	%i6,	%g5,	%i3
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	nop	 ! 	casa	[%l6] 0x80,	%i4,	%l5 ASI use replaced by convert2hboot
loop_1214:
	array32	%l6,	%i5,	%l0
loop_1215:
	edge32n	%l1,	%g2,	%o7
	movrlez	%g1,	%g4,	%o3
	wr	%g0,	0x89,	%asi
	orncc	%l4,	%i1,	%o2
	movgu	%xcc,	%g7,	%i7
	prefetch	[%l7 + 0x1C],	 0x3
	udiv	%o6,	0x177C,	%l2
	edge32	%o1,	%o0,	%i2
	nop
	setx loop_1216, %l0, %l1
	jmpl %l1, %g6
	edge16	%l3,	%o4,	%i0
	ble,a,pn	%xcc,	loop_1217
	fmovd	%f4,	%f6
loop_1216:
	movvs	%xcc,	%o5,	%g5
	fbo	%fcc0,	loop_1218
loop_1217:
	fone	%f18
	nop 	! 	taddcctv	%i6,	%i3,	%l5 changed by convert2hboot
	edge8n	%i4,	%i5,	%l0
loop_1218:
	fxnors	%f14,	%f19,	%f5
	movre	%l6,	0x3A2,	%l1
	nop 	! 	tcs	%icc,	0x6 changed by convert2hboot
	fpack32	%f22,	%f16,	%f24
	fxnor	%f14,	%f20,	%f2
	nop 	! 	taddcctv	%o7,	0x19F7,	%g2 changed by convert2hboot
	fornot2	%f12,	%f8,	%f2
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	fmovsvs	%icc,	%f6,	%f5
	set	0x20, %o2
	nop	 ! 	stxa	%g4,	[%g0 + %o2] 0x20 ASI use replaced by convert2hboot
	movpos	%xcc,	%o3,	%g3
	set	0x70, %i0
	nop	 ! 	ldda	[%l7 + %i0] 0xeb,	%g0 ASI use replaced by convert2hboot
	sethi	0x013C,	%l4
	edge16n	%o2,	%g7,	%i1
	fmovd	%f22,	%f0
	fmovrsne	%i7,	%f27,	%f18
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
	lduw	[%l7 + 0x40],	%o6
	movpos	%xcc,	%l2,	%o1
	alignaddr	%o0,	%g6,	%l3
	movrlz	%o4,	%i2,	%i0
	flush	%l7 + 0x78
	edge8ln	%o5,	%g5,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i6,	0x00,	%i4
	movneg	%icc,	%l5,	%i5
	smul	%l0,	0x1BDE,	%l6
	ble,a	%xcc,	loop_1219
	fbl,a	%fcc0,	loop_1220
	fand	%f24,	%f4,	%f24
	nop 	! 	tsubcc	%l1,	%g2,	%o7 changed by convert2hboot
loop_1219:
	nop 	! 	tsubcc	%g4,	0x1CC2,	%o3 changed by convert2hboot
loop_1220:
	edge8n	%g3,	%l4,	%o2
	fandnot1	%f16,	%f6,	%f16
	smulcc	%g1,	0x0FF7,	%i1
	lduw	[%l7 + 0x08],	%i7
	fcmpne16	%f2,	%f24,	%o6
	fbg	%fcc2,	loop_1221
	movneg	%icc,	%g7,	%o1
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	srl	%l2,	0x01,	%g6
loop_1221:
	nop 	! 	taddcc	%o0,	%l3,	%i2 changed by convert2hboot
	smul	%o4,	0x03A4,	%o5
	fblg,a	%fcc0,	loop_1222
	fmovdneg	%xcc,	%f19,	%f26
	flush	%l7 + 0x24
	ba,pt	%xcc,	loop_1223
loop_1222:
	edge32l	%i0,	%i3,	%i6
	movle	%xcc,	%g5,	%i4
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
loop_1223:
	edge16	%l5,	%i5,	%l0
	andn	%l1,	0x052E,	%l6
	fpsub32	%f14,	%f8,	%f20
	sll	%o7,	0x02,	%g2
	edge32l	%g4,	%o3,	%g3
	fmovdge	%xcc,	%f20,	%f25
	subc	%l4,	0x1033,	%g1
	udivcc	%i1,	0x00C7,	%i7
	edge16l	%o2,	%o6,	%o1
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
	movrgez	%l2,	0x052,	%g7
	srax	%o0,	0x0F,	%g6
	wr	%g0,	0x22,	%asi
	membar	#Sync
	subccc	%o4,	%o5,	%i2
	fmovsge	%icc,	%f20,	%f11
	movrlez	%i0,	0x268,	%i3
	movne	%xcc,	%i6,	%g5
	xnor	%l5,	0x14EA,	%i4
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
	movpos	%icc,	%i5,	%o7
	fnand	%f14,	%f6,	%f8
	fbuge,a	%fcc3,	loop_1224
	fands	%f3,	%f3,	%f2
	movcc	%icc,	%g2,	%l6
	edge16n	%o3,	%g3,	%l4
loop_1224:
	fbne,a	%fcc2,	loop_1225
	andn	%g1,	%i1,	%g4
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	movpos	%xcc,	%i7,	%o6
loop_1225:
	array32	%o2,	%o1,	%g7
	or	%o0,	0x1AB5,	%l2
	fmovs	%f22,	%f5
	fcmpne16	%f18,	%f8,	%l3
	fands	%f31,	%f23,	%f29
	move	%icc,	%o4,	%o5
	edge16l	%g6,	%i0,	%i2
	movre	%i3,	%g5,	%l5
	fmovsn	%xcc,	%f2,	%f8
	fmovdle	%xcc,	%f6,	%f23
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	sllx	%i6,	%l0,	%l1
	nop 	! 	taddcctv	%i4,	0x1948,	%o7 changed by convert2hboot
	subc	%i5,	0x1CF8,	%l6
	movvs	%xcc,	%g2,	%g3
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
	fmovrde	%o3,	%f28,	%f22
	ldub	[%l7 + 0x57],	%g1
	bshuffle	%f6,	%f16,	%f2
	movleu	%icc,	%i1,	%l4
	sth	%i7,	[%l7 + 0x10]
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	fnand	%f4,	%f22,	%f12
	array16	%g4,	%o6,	%o2
	srlx	%g7,	0x09,	%o0
	fpsub32s	%f7,	%f22,	%f19
	fnegs	%f6,	%f3
	movneg	%icc,	%l2,	%l3
	edge16ln	%o1,	%o5,	%g6
	fcmpd	%fcc0,	%f8,	%f18
	fmovdcs	%xcc,	%f16,	%f25
	fbne	%fcc3,	loop_1226
	fandnot2s	%f3,	%f5,	%f3
	movn	%xcc,	%i0,	%i2
	mulscc	%o4,	0x1852,	%i3
loop_1226:
	movrlez	%g5,	%l5,	%l0
	array16	%i6,	%l1,	%i4
	sub	%o7,	0x092E,	%i5
	nop 	! 	tsubcc	%l6,	%g2,	%g3 changed by convert2hboot
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	nop	 ! 	casxa	[%l6] 0x81,	%g1,	%o3 ASI use replaced by convert2hboot
	brnz,a	%i1,	loop_1227
	movvs	%icc,	%l4,	%i7
	edge8	%o6,	%o2,	%g4
	fmovd	%f26,	%f20
loop_1227:
	movrlz	%o0,	%l2,	%l3
	movrlz	%g7,	0x141,	%o5
	nop 	! 	tge	%icc,	0x0 changed by convert2hboot
	fbe,a	%fcc2,	loop_1228
	sethi	0x0547,	%o1
	movge	%xcc,	%g6,	%i2
	sllx	%o4,	%i0,	%i3
loop_1228:
	nop 	! 	tsubcctv	%g5,	%l5,	%l0 changed by convert2hboot
	fmovdvs	%icc,	%f15,	%f20
	fcmpne16	%f6,	%f24,	%i6
	fpsub16	%f10,	%f18,	%f28
	flush	%l7 + 0x2C
	smulcc	%i4,	%l1,	%i5
	be	%icc,	loop_1229
	sub	%o7,	%l6,	%g2
	array16	%g3,	%o3,	%g1
	smulcc	%l4,	%i1,	%i7
loop_1229:
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
	edge32ln	%o6,	%o2,	%g4
	nop 	! 	tge	%icc,	0x2 changed by convert2hboot
	flush	%l7 + 0x18
	movre	%l2,	0x394,	%l3
	nop 	! 	tg	%xcc,	0x7 changed by convert2hboot
	fcmpgt16	%f12,	%f16,	%g7
	movpos	%icc,	%o5,	%o1
	nop 	! 	tvc	%xcc,	0x0 changed by convert2hboot
	wr	%g0,	0x04,	%asi
	xnorcc	%i2,	%o4,	%o0
	bgu,a	loop_1230
	movg	%icc,	%i0,	%g5
	membar	0x49
	fmul8x16al	%f27,	%f18,	%f0
loop_1230:
	movrgz	%l5,	0x277,	%i3
	movl	%xcc,	%i6,	%l0
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	fmovdcc	%xcc,	%f17,	%f18
	fpackfix	%f12,	%f30
	movgu	%xcc,	%i4,	%i5
	fandnot2	%f24,	%f8,	%f12
	set	0x40, %i1
	nop	 ! 	ldda	[%l7 + %i1] 0x19,	%f16 ASI use replaced by convert2hboot
	edge16l	%o7,	%l1,	%l6
	movle	%xcc,	%g2,	%g3
	faligndata	%f30,	%f14,	%f14
	fnands	%f5,	%f15,	%f22
	fandnot1s	%f31,	%f9,	%f7
	xnor	%g1,	%l4,	%i1
	ldx	[%l7 + 0x28],	%i7
	sll	%o3,	0x01,	%o2
	lduh	[%l7 + 0x70],	%o6
	edge16n	%l2,	%l3,	%g7
	bpos,a,pn	%icc,	loop_1231
	fmovrsgz	%g4,	%f9,	%f30
	bn,a	loop_1232
	umulcc	%o1,	0x059A,	%o5
loop_1231:
	sllx	%i2,	0x04,	%g6
	movl	%icc,	%o4,	%o0
loop_1232:
	fmovsge	%icc,	%f30,	%f21
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	nop
	setx	loop_1233,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	sdivcc	%g5,	0x07AC,	%i0
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	sdivx	%l5,	0x17D9,	%i6
loop_1233:
	andn	%i3,	0x094A,	%i4
	edge8	%i5,	%l0,	%l1
	wr	%g0,	0xeb,	%asi
	nop 	! 	tsubcctv	%o7,	%g3,	%g1 changed by convert2hboot
	bvc,pt	%icc,	loop_1234
	fmovse	%icc,	%f3,	%f5
	movvs	%xcc,	%g2,	%i1
	srl	%l4,	0x1B,	%o3
loop_1234:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i7,	%o6,	%o2
	set	0x08, %o1
	nop	 ! 	ldsba	[%l7 + %o1] 0x19,	%l3 ASI use replaced by convert2hboot
	ldd	[%l7 + 0x48],	%l2
	fmovrsgz	%g7,	%f0,	%f6
	fexpand	%f8,	%f16
	smul	%g4,	%o5,	%o1
	edge8ln	%g6,	%o4,	%i2
	sub	%o0,	0x12DE,	%i0
	fmovdle	%icc,	%f15,	%f7
	fbl	%fcc1,	loop_1235
	fcmple16	%f22,	%f0,	%l5
	fandnot1	%f6,	%f24,	%f26
	set	0x60, %o4
	nop	 ! 	stxa	%g5,	[%l7 + %o4] 0x04 ASI use replaced by convert2hboot
loop_1235:
	nop
	set	0x74, %l4
	nop	 ! 	swapa	[%l7 + %l4] 0x89,	%i3 ASI use replaced by convert2hboot
	popc	0x12EC,	%i4
	srlx	%i5,	%i6,	%l1
	fabsd	%f14,	%f22
	edge32ln	%l6,	%o7,	%g3
	movg	%xcc,	%g1,	%l0
	brgz	%g2,	loop_1236
	nop 	! 	tgu	%xcc,	0x6 changed by convert2hboot
	movle	%icc,	%i1,	%l4
	bne	%xcc,	loop_1237
loop_1236:
	swap	[%l7 + 0x2C],	%o3
	mulx	%o6,	0x1965,	%o2
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
loop_1237:
	fcmpgt32	%f18,	%f20,	%i7
	ba,a	loop_1238
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
	movneg	%icc,	%l2,	%l3
	wr	%g0,	0x0c,	%asi
loop_1238:
	fmovdn	%xcc,	%f17,	%f4
	fpsub16	%f18,	%f4,	%f28
	addccc	%g7,	%o1,	%g6
	std	%f4,	[%l7 + 0x68]
	bge,a,pt	%xcc,	loop_1239
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
	fmovrdgz	%o4,	%f22,	%f6
	movgu	%icc,	%o5,	%i2
loop_1239:
	sdivx	%i0,	0x0B39,	%l5
	edge32n	%g5,	%i3,	%i4
	set	0x7C, %i5
	nop	 ! 	stba	%o0,	[%l7 + %i5] 0xea ASI use replaced by convert2hboot
	membar	#Sync
	nop 	! 	taddcctv	%i6,	0x1952,	%i5 changed by convert2hboot
	mova	%icc,	%l1,	%o7
	wr	%g0,	0x18,	%asi
	xorcc	%g1,	%l0,	%g2
	udiv	%i1,	0x1215,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz,a	%g3,	loop_1240
	orn	%o3,	%o2,	%o6
	ldd	[%l7 + 0x40],	%f18
	fble,a	%fcc3,	loop_1241
loop_1240:
	swap	[%l7 + 0x34],	%i7
	movvc	%icc,	%l2,	%g4
	sra	%l3,	0x0E,	%g7
loop_1241:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x40] %asi,	%f0
	fpadd32	%f30,	%f20,	%f18
	movge	%icc,	%g6,	%o1
	sll	%o4,	0x0B,	%i2
	fmovrdgez	%i0,	%f2,	%f14
	fpadd32s	%f0,	%f27,	%f17
	mulscc	%l5,	%g5,	%o5
	ldsb	[%l7 + 0x4E],	%i4
	fandnot2	%f10,	%f20,	%f16
	brz	%i3,	loop_1242
	movrne	%i6,	%o0,	%i5
	edge16	%l1,	%l6,	%o7
	nop 	! 	tl	%icc,	0x6 changed by convert2hboot
loop_1242:
	andcc	%l0,	0x070D,	%g2
	nop 	! 	tsubcc	%g1,	0x00F6,	%l4 changed by convert2hboot
	movcc	%xcc,	%i1,	%o3
	fblg	%fcc0,	loop_1243
	ldub	[%l7 + 0x2A],	%o2
	movneg	%icc,	%o6,	%i7
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
loop_1243:
	stx	%l2,	[%l7 + 0x10]
	nop 	! 	taddcctv	%g3,	0x0FBB,	%g4 changed by convert2hboot
	fones	%f17
	set	0x20, %o6
	nop	 ! 	stda	%g6,	[%l7 + %o6] 0x27 ASI use replaced by convert2hboot
	membar	#Sync
	set	0x12, %l0
	nop	 ! 	ldsha	[%l7 + %l0] 0x19,	%g6 ASI use replaced by convert2hboot
	alignaddr	%o1,	%o4,	%l3
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	fmovdg	%icc,	%f4,	%f6
	orcc	%i0,	0x0746,	%l5
	nop 	! 	ta	%xcc,	0x7 changed by convert2hboot
	edge8n	%i2,	%o5,	%g5
	srlx	%i3,	0x10,	%i4
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	movrne	%o0,	%i6,	%i5
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	srax	%l6,	0x1A,	%o7
	fbge	%fcc3,	loop_1244
	sllx	%l1,	%g2,	%l0
	set	0x54, %o3
	nop	 ! 	ldsha	[%l7 + %o3] 0x04,	%g1 ASI use replaced by convert2hboot
loop_1244:
	movneg	%xcc,	%l4,	%o3
	bge,a,pn	%icc,	loop_1245
	bneg	loop_1246
	fxnor	%f22,	%f2,	%f20
	fble	%fcc3,	loop_1247
loop_1245:
	movrlz	%i1,	0x0C1,	%o2
loop_1246:
	movgu	%icc,	%o6,	%l2
	movn	%icc,	%g3,	%g4
loop_1247:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f12,	%f22
	fpadd32	%f28,	%f26,	%f18
	fmovsgu	%icc,	%f25,	%f4
	nop 	! 	tsubcctv	%g7,	%i7,	%g6 changed by convert2hboot
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	bcs,a	loop_1248
	lduh	[%l7 + 0x72],	%o4
	alignaddrl	%o1,	%l3,	%i0
	fpadd32	%f20,	%f8,	%f30
loop_1248:
	fmovdn	%xcc,	%f1,	%f24
	be,pn	%xcc,	loop_1249
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
	nop 	! 	taddcc	%l5,	0x1603,	%i2 changed by convert2hboot
	edge32n	%g5,	%i3,	%i4
loop_1249:
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
	array8	%o0,	%o5,	%i5
	lduw	[%l7 + 0x70],	%l6
	ldstub	[%l7 + 0x7C],	%i6
	bcs,a,pt	%icc,	loop_1250
	fmovrdlez	%l1,	%f2,	%f30
	subcc	%o7,	0x002B,	%g2
	sllx	%g1,	0x0C,	%l0
loop_1250:
	orcc	%l4,	%i1,	%o3
	umulcc	%o2,	0x1146,	%l2
	fcmpgt32	%f26,	%f16,	%o6
	nop 	! 	tsubcctv	%g4,	%g3,	%g7 changed by convert2hboot
	fmovscc	%icc,	%f14,	%f5
	wr	%g0,	0x80,	%asi
	movrgz	%o4,	%i7,	%l3
	wr	%g0,	0x23,	%asi
	membar	#Sync
	array16	%o1,	%l5,	%g5
	orncc	%i2,	%i4,	%i3
	fbue	%fcc2,	loop_1251
	add	%o5,	%o0,	%l6
	sra	%i5,	%l1,	%o7
	ldsb	[%l7 + 0x52],	%g2
loop_1251:
	nop
	set	0x08, %g5
	lduh	[%l7 + %g5],	%g1
	popc	0x15C2,	%i6
	fpack32	%f24,	%f26,	%f20
	movne	%icc,	%l0,	%i1
	movg	%xcc,	%l4,	%o2
	xnor	%l2,	0x0654,	%o3
	movrne	%g4,	0x1FB,	%g3
	movvc	%icc,	%o6,	%g6
	nop 	! 	tsubcctv	%g7,	%i7,	%o4 changed by convert2hboot
	nop 	! 	tsubcctv	%i0,	%o1,	%l5 changed by convert2hboot
	fmovdn	%xcc,	%f27,	%f16
	sra	%g5,	0x14,	%i2
	bvc,pt	%icc,	loop_1252
	movrne	%l3,	0x176,	%i4
	fnors	%f14,	%f18,	%f9
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
loop_1252:
	nop
	set	0x18, %o7
	nop	 ! 	stda	%i2,	[%l7 + %o7] 0xea ASI use replaced by convert2hboot
	membar	#Sync
	nop 	! 	sir	0x0BA2 changed by convert2hboot
	fmovde	%icc,	%f12,	%f11
	stx	%o5,	[%l7 + 0x20]
	fcmpeq32	%f22,	%f18,	%l6
	fcmped	%fcc1,	%f18,	%f28
	bshuffle	%f10,	%f18,	%f10
	mova	%xcc,	%i5,	%l1
	edge32l	%o7,	%o0,	%g2
	fmovsn	%icc,	%f0,	%f16
	addc	%i6,	%g1,	%i1
	addc	%l0,	0x1E7F,	%l4
	fmovsle	%icc,	%f15,	%f6
	alignaddrl	%o2,	%o3,	%g4
	fbug	%fcc0,	loop_1253
	movl	%xcc,	%l2,	%g3
	brlez	%g6,	loop_1254
	nop 	! 	tsubcc	%o6,	0x1CF6,	%g7 changed by convert2hboot
loop_1253:
	fmovsvs	%icc,	%f3,	%f24
	xnorcc	%i7,	%i0,	%o4
loop_1254:
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	edge16l	%l5,	%o1,	%i2
	fandnot2s	%f21,	%f1,	%f12
	fmovspos	%xcc,	%f3,	%f4
	or	%g5,	0x0C26,	%l3
	fbn	%fcc0,	loop_1255
	fmovdleu	%xcc,	%f29,	%f24
	movne	%xcc,	%i3,	%i4
	std	%f26,	[%l7 + 0x48]
loop_1255:
	fmuld8ulx16	%f27,	%f29,	%f8
	nop 	! 	ta	%xcc,	0x7 changed by convert2hboot
	fnot1s	%f29,	%f26
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x74] %asi,	%f27
	ldd	[%l7 + 0x28],	%f22
	fbne,a	%fcc0,	loop_1256
	fmovd	%f6,	%f6
	umulcc	%o5,	0x19D5,	%l6
	fcmped	%fcc0,	%f14,	%f12
loop_1256:
	sdivx	%l1,	0x174F,	%i5
	fpack32	%f6,	%f14,	%f12
	nop 	! 	tvs	%icc,	0x2 changed by convert2hboot
	movle	%icc,	%o7,	%o0
	ldx	[%l7 + 0x20],	%g2
	bpos	loop_1257
	sdivx	%g1,	0x1537,	%i6
	ldstub	[%l7 + 0x57],	%l0
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
loop_1257:
	stx	%l4,	[%l7 + 0x38]
	movpos	%xcc,	%o2,	%o3
	movvc	%icc,	%g4,	%l2
	movrgz	%i1,	0x374,	%g3
	fmovrsne	%o6,	%f17,	%f2
	addc	%g6,	%g7,	%i7
	nop 	! 	taddcctv	%o4,	0x0CA0,	%i0 changed by convert2hboot
	fbo	%fcc1,	loop_1258
	stx	%o1,	[%l7 + 0x20]
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
	andn	%i2,	%l5,	%g5
loop_1258:
	srax	%i3,	%i4,	%o5
	move	%icc,	%l3,	%l1
	ldub	[%l7 + 0x10],	%i5
	array8	%l6,	%o7,	%o0
	nop 	! 	taddcc	%g1,	0x1F09,	%g2 changed by convert2hboot
	movcs	%icc,	%l0,	%i6
	srlx	%l4,	%o3,	%o2
	fnand	%f26,	%f10,	%f24
	wr	%g0,	0x23,	%asi
	membar	#Sync
	array16	%l2,	%i1,	%g3
	addcc	%g6,	%o6,	%i7
	fpadd32	%f12,	%f2,	%f12
	nop
	setx	loop_1259,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	ldd	[%l7 + 0x58],	%f0
loop_1259:
	nop
	wr	%g0,	0x04,	%asi
	srl	%g7,	%i0,	%o1
	edge16n	%l5,	%g5,	%i3
	sdivx	%i4,	0x17C9,	%i2
	xnorcc	%l3,	%l1,	%o5
	edge32n	%i5,	%o7,	%l6
	fxnors	%f11,	%f11,	%f28
	fnegd	%f20,	%f0
	sth	%o0,	[%l7 + 0x5A]
	bgu,a,pn	%icc,	loop_1260
	orcc	%g1,	%l0,	%g2
	fmovdcs	%icc,	%f22,	%f27
	brgez,a	%i6,	loop_1261
loop_1260:
	udivx	%l4,	0x02CD,	%o2
	fsrc1s	%f16,	%f2
	popc	%g4,	%l2
loop_1261:
	prefetch	[%l7 + 0x18],	 0x1
	prefetch	[%l7 + 0x74],	 0x1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	subcc	%g3,	0x1922,	%o6
	movpos	%xcc,	%i7,	%g6
	edge8l	%g7,	%o4,	%o1
	wr	%g0,	0x19,	%asi
	fands	%f2,	%f18,	%f1
	std	%f22,	[%l7 + 0x08]
	xor	%i0,	%g5,	%i4
	ba,a	%icc,	loop_1262
	fmovdl	%icc,	%f0,	%f1
	nop 	! 	tcs	%icc,	0x6 changed by convert2hboot
	fpmerge	%f2,	%f0,	%f18
loop_1262:
	movrgez	%i3,	0x39E,	%l3
	subcc	%l1,	%i2,	%o5
	movrgez	%i5,	%o7,	%l6
	mova	%xcc,	%o0,	%g1
	xorcc	%g2,	0x17D9,	%i6
	edge8n	%l0,	%l4,	%o2
	bg,a,pt	%xcc,	loop_1263
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	fxnors	%f8,	%f3,	%f31
	orncc	%g4,	%l2,	%i1
loop_1263:
	umulcc	%o3,	%o6,	%g3
	set	0x7C, %l1
	nop	 ! 	swapa	[%l7 + %l1] 0x04,	%i7 ASI use replaced by convert2hboot
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	fmovdpos	%xcc,	%f5,	%f15
	pdist	%f16,	%f22,	%f24
	ldsw	[%l7 + 0x60],	%g6
	sth	%g7,	[%l7 + 0x42]
	udiv	%o4,	0x1477,	%o1
	andncc	%l5,	%i0,	%i4
	smul	%g5,	0x0CD0,	%i3
	array32	%l3,	%i2,	%o5
	wr	%g0,	0x2b,	%asi
	membar	#Sync
	wr	%g0,	0x19,	%asi
	fones	%f27
	orncc	%o7,	%o0,	%l6
	subccc	%g1,	0x070A,	%g2
	fxors	%f8,	%f19,	%f23
	fmovdvs	%icc,	%f2,	%f2
	fmovdge	%icc,	%f7,	%f16
	movrne	%i6,	0x2CC,	%l4
	edge8l	%l0,	%g4,	%l2
	andcc	%i1,	0x08AB,	%o3
	movrne	%o2,	%o6,	%i7
	and	%g3,	0x1347,	%g7
	fbn,a	%fcc1,	loop_1264
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
	bpos,a	%icc,	loop_1265
	edge16l	%o4,	%o1,	%l5
loop_1264:
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	ble,a,pn	%icc,	loop_1266
loop_1265:
	sethi	0x03F9,	%i0
	nop 	! 	ta	%xcc,	0x7 changed by convert2hboot
	edge32l	%g6,	%i4,	%i3
loop_1266:
	swap	[%l7 + 0x60],	%l3
	orncc	%i2,	0x0973,	%g5
	movrgz	%i5,	%l1,	%o7
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	edge8l	%o0,	%l6,	%o5
	addcc	%g1,	0x1E05,	%g2
	brgez,a	%i6,	loop_1267
	bvc	loop_1268
	mova	%xcc,	%l4,	%l0
	movneg	%icc,	%l2,	%g4
loop_1267:
	std	%o2,	[%l7 + 0x38]
loop_1268:
	array8	%o2,	%i1,	%o6
	edge8	%i7,	%g3,	%g7
	andn	%o4,	%o1,	%i0
	sll	%g6,	%i4,	%i3
	addccc	%l3,	0x0CBB,	%l5
	sdivx	%g5,	0x11B1,	%i2
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	bvc,pn	%icc,	loop_1269
	brlz,a	%l1,	loop_1270
	fpadd16	%f14,	%f0,	%f26
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
loop_1269:
	fornot1	%f10,	%f22,	%f14
loop_1270:
	bcs,pn	%icc,	loop_1271
	nop 	! 	tl	%xcc,	0x4 changed by convert2hboot
	fnor	%f26,	%f6,	%f0
	andcc	%i5,	%o7,	%l6
loop_1271:
	fbn	%fcc1,	loop_1272
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	bg	%xcc,	loop_1273
	edge32l	%o0,	%g1,	%g2
loop_1272:
	andncc	%i6,	%l4,	%l0
	bvs	loop_1274
loop_1273:
	fmovdleu	%xcc,	%f3,	%f9
	move	%xcc,	%l2,	%g4
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
loop_1274:
	subc	%o3,	%o2,	%i1
	edge8ln	%o6,	%i7,	%g3
	fandnot1s	%f14,	%f25,	%f4
	sdivcc	%g7,	0x1AF7,	%o4
	srl	%o5,	%o1,	%i0
	fpadd32s	%f0,	%f24,	%f10
	srax	%i4,	0x1D,	%i3
	array16	%g6,	%l3,	%l5
	edge8n	%g5,	%i2,	%i5
	andcc	%o7,	0x06BA,	%l6
	bgu,a,pn	%icc,	loop_1275
	mulscc	%o0,	0x0985,	%l1
	sth	%g2,	[%l7 + 0x48]
	wr	%g0,	0xeb,	%asi
	membar	#Sync
loop_1275:
	xorcc	%l4,	0x176B,	%l0
	fpadd32	%f0,	%f2,	%f28
	fbo	%fcc1,	loop_1276
	subcc	%g1,	%g4,	%o3
	movgu	%xcc,	%o2,	%l2
	movvs	%xcc,	%i1,	%i7
loop_1276:
	edge8	%g3,	%o6,	%g7
	sethi	0x0903,	%o4
	movneg	%xcc,	%o1,	%o5
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i0,	%i3,	%g6
	alignaddrl	%i4,	%l3,	%l5
	lduh	[%l7 + 0x46],	%i2
	sdivx	%g5,	0x036A,	%o7
	xnor	%l6,	0x10F5,	%o0
	fpadd16	%f16,	%f22,	%f22
	sub	%l1,	0x1F61,	%i5
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	nop
	set	0x0C, %g7
	lduh	[%l7 + %g7],	%g2
	fmuld8ulx16	%f24,	%f27,	%f8
	nop
	setx	loop_1277,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	tle	%xcc,	0x0 changed by convert2hboot
	fbul	%fcc2,	loop_1278
	ldx	[%l7 + 0x30],	%l4
loop_1277:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
loop_1278:
	xnorcc	%i6,	0x0B79,	%g4
	movl	%xcc,	%o2,	%l2
	fmovrse	%o3,	%f24,	%f20
	sllx	%i7,	%g3,	%i1
	fmovrsne	%o6,	%f5,	%f19
	fba	%fcc0,	loop_1279
	fmovsgu	%icc,	%f2,	%f18
	fbuge,a	%fcc2,	loop_1280
	fcmple16	%f2,	%f20,	%o4
loop_1279:
	edge32n	%o1,	%g7,	%o5
	movvc	%xcc,	%i3,	%i0
loop_1280:
	movvc	%xcc,	%g6,	%l3
	udiv	%l5,	0x03DA,	%i2
	nop 	! 	tsubcc	%g5,	%o7,	%i4 changed by convert2hboot
	bneg,a	loop_1281
	nop 	! 	ta	%icc,	0x7 changed by convert2hboot
	fmovsa	%xcc,	%f3,	%f5
	fmovs	%f30,	%f7
loop_1281:
	movrlez	%o0,	%l1,	%l6
	fpsub16s	%f7,	%f16,	%f4
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
	subccc	%g2,	%i5,	%l0
	orn	%g1,	%i6,	%l4
	set	0x48, %l3
	nop	 ! 	stxa	%g4,	[%l7 + %l3] 0xe3 ASI use replaced by convert2hboot
	membar	#Sync
	edge32	%l2,	%o3,	%o2
	bne,a,pn	%xcc,	loop_1282
	sdiv	%i7,	0x151B,	%g3
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	fmovdg	%icc,	%f12,	%f31
loop_1282:
	sdiv	%o6,	0x173D,	%o4
	fxors	%f2,	%f24,	%f21
	movle	%icc,	%i1,	%o1
	fpsub16s	%f2,	%f12,	%f12
	xor	%o5,	0x0F14,	%i3
	xnor	%i0,	0x0AF0,	%g6
	siam	0x4
	xnor	%g7,	0x0C63,	%l3
	bleu,a,pn	%icc,	loop_1283
	smul	%i2,	%l5,	%o7
	fmovsgu	%xcc,	%f1,	%f14
	fnot1	%f2,	%f14
loop_1283:
	nop
	set	0x44, %i3
	nop	 ! 	swapa	[%l7 + %i3] 0x89,	%i4 ASI use replaced by convert2hboot
	nop 	! 	taddcc	%g5,	0x06A1,	%o0 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x58],	%f16
	bn,pt	%icc,	loop_1284
	movre	%l1,	%g2,	%l6
	xorcc	%l0,	%g1,	%i5
	sdiv	%i6,	0x19DA,	%g4
loop_1284:
	fones	%f25
	fzero	%f10
	fnot2	%f0,	%f6
	fnot1	%f14,	%f30
	movrne	%l2,	0x0D6,	%o3
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	movle	%icc,	%l4,	%o2
	movne	%xcc,	%i7,	%g3
	fcmpes	%fcc2,	%f4,	%f26
	edge16l	%o4,	%o6,	%o1
	movgu	%xcc,	%i1,	%o5
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	nop 	! 	tsubcctv	%i0,	%g6,	%g7 changed by convert2hboot
	movvs	%xcc,	%l3,	%i2
	fmovrdgz	%i3,	%f8,	%f12
	ldstub	[%l7 + 0x11],	%l5
	fmovsa	%icc,	%f3,	%f0
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
	fmovsge	%icc,	%f20,	%f23
	nop 	! 	tleu	%icc,	0x3 changed by convert2hboot
	nop
	set	0x70, %l6
	std	%f20,	[%l7 + %l6]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc3,	loop_1285
	movrlz	%o7,	0x0AD,	%i4
	or	%g5,	0x1748,	%o0
	sethi	0x1192,	%l1
loop_1285:
	edge32ln	%l6,	%g2,	%g1
	fmovdle	%icc,	%f19,	%f23
	wr	%g0,	0x80,	%asi
	fcmpne16	%f0,	%f6,	%l0
	xor	%i6,	%g4,	%o3
	subccc	%l4,	0x140A,	%o2
	movre	%l2,	%g3,	%o4
	nop 	! 	tsubcc	%i7,	%o1,	%o6 changed by convert2hboot
	movre	%o5,	0x2E8,	%i1
	std	%i0,	[%l7 + 0x08]
	fba	%fcc0,	loop_1286
	fbge,a	%fcc2,	loop_1287
	fpackfix	%f24,	%f28
	sth	%g6,	[%l7 + 0x2A]
loop_1286:
	nop
	setx loop_1288, %l0, %l1
	jmpl %l1, %l3
loop_1287:
	movn	%xcc,	%i2,	%g7
	wr	%g0,	0x0c,	%asi
loop_1288:
	sdivcc	%o7,	0x05C6,	%i4
	array32	%l5,	%o0,	%l1
	bl,a	loop_1289
	fmovdcc	%icc,	%f2,	%f0
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	ldx	[%l7 + 0x58],	%l6
loop_1289:
	sub	%g2,	%g5,	%g1
	fmovda	%xcc,	%f11,	%f11
	bg,pt	%icc,	loop_1290
	edge8ln	%l0,	%i6,	%i5
	edge16ln	%g4,	%o3,	%o2
	edge16ln	%l2,	%g3,	%o4
loop_1290:
	edge8ln	%l4,	%i7,	%o1
	wr	%g0,	0x81,	%asi
	movvc	%icc,	%o5,	%i1
	edge8	%i0,	%l3,	%g6
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
	andcc	%g7,	0x0E36,	%i3
	wr	%g0,	0x89,	%asi
	fcmpgt32	%f28,	%f20,	%i4
	fmovspos	%xcc,	%f3,	%f26
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
	membar	0x21
	fnegs	%f11,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l5,	%o0,	%l1
	fandnot1s	%f6,	%f28,	%f29
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	set	0x22, %o0
	nop	 ! 	ldstuba	[%l7 + %o0] 0x80,	%l6 ASI use replaced by convert2hboot
	udiv	%g2,	0x0D71,	%g5
	fbul	%fcc0,	loop_1291
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
	movg	%icc,	%i2,	%g1
	movvc	%xcc,	%l0,	%i5
loop_1291:
	movcc	%xcc,	%g4,	%o3
	brlz	%i6,	loop_1292
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
	set	0x0A, %l2
	nop	 ! 	lduba	[%l7 + %l2] 0x19,	%o2 ASI use replaced by convert2hboot
loop_1292:
	fmovdneg	%icc,	%f4,	%f5
	movre	%g3,	%l2,	%l4
	edge8	%i7,	%o4,	%o6
	edge32n	%o1,	%i1,	%i0
	sllx	%o5,	%g6,	%l3
	set	0x7C, %g4
	nop	 ! 	stha	%g7,	[%l7 + %g4] 0xe2 ASI use replaced by convert2hboot
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x19,	%asi
	nop	 ! 	casxa	[%l6] 0x19,	%o7,	%i3 ASI use replaced by convert2hboot
	set	0x08, %g1
	nop	 ! 	stda	%l4,	[%l7 + %g1] 0x81 ASI use replaced by convert2hboot
	fmovdg	%icc,	%f2,	%f11
	nop 	! 	taddcctv	%o0,	0x191E,	%l1 changed by convert2hboot
	nop 	! 	sir	0x119F changed by convert2hboot
	fbuge,a	%fcc2,	loop_1293
	fmovrdlez	%i4,	%f26,	%f30
	array32	%g2,	%g5,	%i2
	membar	0x3C
loop_1293:
	subc	%l6,	%l0,	%i5
	fpmerge	%f15,	%f0,	%f22
	edge8	%g1,	%g4,	%o3
	fxnors	%f13,	%f10,	%f23
	sdiv	%o2,	0x1E16,	%g3
	movgu	%icc,	%l2,	%l4
	set	0x48, %o5
	lda	[%l7 + %o5] 0x18,	%f28
	be,a,pn	%xcc,	loop_1294
	fmovsvc	%xcc,	%f17,	%f24
	edge16ln	%i6,	%i7,	%o6
	array32	%o1,	%o4,	%i0
loop_1294:
	bpos	%icc,	loop_1295
	fcmpne32	%f22,	%f2,	%o5
	edge8ln	%i1,	%g6,	%l3
	movgu	%xcc,	%o7,	%i3
loop_1295:
	mova	%xcc,	%l5,	%g7
	sdiv	%o0,	0x0A54,	%l1
	xnor	%i4,	0x0D65,	%g2
	be	loop_1296
	fbe	%fcc3,	loop_1297
	addc	%i2,	%l6,	%l0
	movcs	%icc,	%i5,	%g5
loop_1296:
	bg	%icc,	loop_1298
loop_1297:
	subcc	%g1,	0x17E8,	%g4
	andncc	%o2,	%o3,	%l2
	alignaddr	%g3,	%l4,	%i7
loop_1298:
	fmovd	%f4,	%f20
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x1C] %asi,	%f8
	set	0x40, %g6
	nop	 ! 	ldswa	[%l7 + %g6] 0x89,	%i6 ASI use replaced by convert2hboot
	bshuffle	%f26,	%f6,	%f12
	fmovsge	%xcc,	%f0,	%f22
	xnor	%o6,	0x193F,	%o1
	edge8ln	%i0,	%o5,	%o4
	addcc	%g6,	0x1B37,	%i1
	fbg	%fcc2,	loop_1299
	nop 	! 	tvc	%xcc,	0x0 changed by convert2hboot
	addccc	%o7,	%l3,	%l5
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
loop_1299:
	nop
	set	0x2C, %g2
	ldsh	[%l7 + %g2],	%g7
	fmovsleu	%xcc,	%f27,	%f0
	array16	%i3,	%l1,	%i4
	edge32n	%g2,	%o0,	%l6
	or	%l0,	0x166A,	%i2
	bn,pn	%xcc,	loop_1300
	movne	%xcc,	%i5,	%g1
	stw	%g5,	[%l7 + 0x28]
	fbn	%fcc3,	loop_1301
loop_1300:
	fmovda	%xcc,	%f2,	%f23
	nop
	set	0x40, %l5
	std	%f2,	[%l7 + %l5]
	xnor	%g4,	0x1945,	%o3
loop_1301:
	edge32l	%o2,	%g3,	%l2
	udivx	%l4,	0x0AC2,	%i6
	fmovda	%icc,	%f20,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz,a	%o6,	loop_1302
	nop 	! 	tvc	%xcc,	0x7 changed by convert2hboot
	move	%xcc,	%i7,	%i0
	edge16ln	%o5,	%o4,	%o1
loop_1302:
	nop 	! 	tcs	%icc,	0x6 changed by convert2hboot
	move	%icc,	%i1,	%g6
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
	fandnot1	%f6,	%f6,	%f28
	set	0x08, %i6
	nop	 ! 	stxa	%l3,	[%l7 + %i6] 0xe2 ASI use replaced by convert2hboot
	membar	#Sync
	movge	%icc,	%l5,	%g7
	srax	%o7,	%l1,	%i3
	wr	%g0,	0x11,	%asi
	smul	%i4,	%o0,	%l0
	fmovsvs	%icc,	%f26,	%f3
	set	0x26, %i2
	nop	 ! 	lduha	[%l7 + %i2] 0x89,	%l6 ASI use replaced by convert2hboot
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
	fmovsa	%xcc,	%f18,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i2,	0x072A,	%i5
	edge8n	%g1,	%g5,	%o3
	nop 	! 	tsubcctv	%o2,	0x05B2,	%g3 changed by convert2hboot
	or	%g4,	%l4,	%l2
	bg,pn	%icc,	loop_1303
	fors	%f18,	%f4,	%f17
	set	0x38, %g3
	nop	 ! 	prefetcha	[%l7 + %g3] 0x19,	 0x0 ASI use replaced by convert2hboot
loop_1303:
	movrlz	%o6,	%i7,	%i0
	fba	%fcc1,	loop_1304
	nop 	! 	taddcctv	%o5,	0x1E20,	%o4 changed by convert2hboot
	fnors	%f23,	%f8,	%f19
	movvc	%xcc,	%i1,	%g6
loop_1304:
	srlx	%l3,	0x17,	%o1
	fmovdle	%icc,	%f6,	%f2
	srl	%g7,	0x0F,	%o7
	movge	%xcc,	%l5,	%l1
	fmul8sux16	%f20,	%f18,	%f4
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x38] %asi,	%f21
	fpack32	%f22,	%f26,	%f24
	fmovsvs	%xcc,	%f30,	%f3
	addcc	%g2,	0x1F64,	%i4
	fbg,a	%fcc3,	loop_1305
	move	%icc,	%o0,	%i3
	movre	%l0,	0x241,	%l6
	brnz	%i2,	loop_1306
loop_1305:
	call	loop_1307
	nop 	! 	taddcctv	%g1,	%i5,	%g5 changed by convert2hboot
	fbo	%fcc3,	loop_1308
loop_1306:
	fmovrde	%o2,	%f10,	%f2
loop_1307:
	movrlez	%g3,	%g4,	%l4
	movle	%icc,	%l2,	%o3
loop_1308:
	addccc	%i6,	%o6,	%i0
	smul	%o5,	0x0557,	%o4
	udiv	%i7,	0x0DDC,	%i1
	udivx	%l3,	0x0A18,	%o1
	movrgz	%g7,	%g6,	%o7
	edge32l	%l5,	%g2,	%i4
	move	%xcc,	%l1,	%o0
	fbule,a	%fcc2,	loop_1309
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	ldsh	[%l7 + 0x46],	%l0
	bg,a	loop_1310
loop_1309:
	xnorcc	%i3,	%l6,	%i2
	edge16ln	%i5,	%g1,	%o2
	sdivcc	%g3,	0x09FD,	%g4
loop_1310:
	or	%g5,	%l4,	%l2
	edge16l	%o3,	%i6,	%o6
	ld	[%l7 + 0x64],	%f4
	fbne,a	%fcc1,	loop_1311
	fmovse	%icc,	%f2,	%f4
	umul	%i0,	0x0FBC,	%o5
	fbule,a	%fcc1,	loop_1312
loop_1311:
	sdiv	%o4,	0x1EFF,	%i7
	movn	%icc,	%l3,	%o1
	sra	%g7,	0x00,	%g6
loop_1312:
	fnand	%f4,	%f2,	%f22
	edge8ln	%i1,	%o7,	%l5
	fand	%f28,	%f22,	%f2
	prefetch	[%l7 + 0x4C],	 0x0
	movle	%xcc,	%i4,	%l1
	fmovrslz	%o0,	%f1,	%f11
	and	%l0,	%g2,	%i3
	fabss	%f14,	%f16
	set	0x74, %i4
	nop	 ! 	lduha	[%l7 + %i4] 0x11,	%i2 ASI use replaced by convert2hboot
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	prefetch	[%l7 + 0x6C],	 0x1
	andncc	%l6,	%g1,	%i5
	move	%icc,	%g3,	%g4
	edge16l	%o2,	%g5,	%l2
	fmovd	%f22,	%f18
	ldsw	[%l7 + 0x54],	%o3
	set	0x0C, %o2
	nop	 ! 	stwa	%i6,	[%l7 + %o2] 0x04 ASI use replaced by convert2hboot
	fbe,a	%fcc3,	loop_1313
	fcmple32	%f18,	%f2,	%l4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i0
	nop	 ! 	casa	[%l6] 0x11,	%i0,	%o5 ASI use replaced by convert2hboot
loop_1313:
	ldd	[%l7 + 0x68],	%o6
	popc	0x03B5,	%i7
	udivx	%o4,	0x064F,	%o1
	fexpand	%f20,	%f28
	movre	%g7,	0x03E,	%l3
	movrlz	%g6,	%o7,	%i1
	edge32l	%l5,	%l1,	%o0
	movneg	%icc,	%i4,	%l0
	wr	%g0,	0x23,	%asi
	membar	#Sync
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
	fbne,a	%fcc0,	loop_1314
	edge32n	%i2,	%g2,	%g1
	movvc	%xcc,	%i5,	%g3
	andcc	%g4,	%l6,	%o2
loop_1314:
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	fbn,a	%fcc1,	loop_1315
	bshuffle	%f26,	%f20,	%f26
	movge	%icc,	%g5,	%o3
	sub	%i6,	%l4,	%i0
loop_1315:
	nop 	! 	tvc	%icc,	0x2 changed by convert2hboot
	fmovsn	%xcc,	%f18,	%f11
	flush	%l7 + 0x50
	stx	%o5,	[%l7 + 0x30]
	movle	%xcc,	%l2,	%i7
	nop 	! 	taddcctv	%o4,	0x1666,	%o6 changed by convert2hboot
	addccc	%g7,	%l3,	%g6
	edge8l	%o7,	%o1,	%l5
	bne,pn	%icc,	loop_1316
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	fnand	%f28,	%f10,	%f4
	smulcc	%i1,	%l1,	%i4
loop_1316:
	fmovrdgz	%o0,	%f30,	%f30
	movgu	%icc,	%l0,	%i3
	umulcc	%g2,	%i2,	%g1
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
	fcmpne16	%f14,	%f6,	%g3
	fbu,a	%fcc2,	loop_1317
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	prefetch	[%l7 + 0x64],	 0x1
	edge32	%g4,	%i5,	%l6
loop_1317:
	brz,a	%g5,	loop_1318
	andcc	%o3,	0x0B5D,	%o2
	or	%l4,	%i0,	%o5
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
loop_1318:
	fmovsge	%xcc,	%f6,	%f16
	fnot2	%f16,	%f6
	alignaddr	%l2,	%i6,	%o4
	subccc	%o6,	0x0BC0,	%i7
	andncc	%g7,	%g6,	%l3
	fmovse	%icc,	%f14,	%f5
	nop
	setx	loop_1319,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fbge	%fcc2,	loop_1320
	or	%o1,	0x0716,	%o7
	ld	[%l7 + 0x48],	%f26
loop_1319:
	movpos	%xcc,	%i1,	%l1
loop_1320:
	ldub	[%l7 + 0x37],	%i4
	andn	%l5,	0x0BE3,	%o0
	nop 	! 	tvs	%xcc,	0x0 changed by convert2hboot
	wr	%g0,	0x80,	%asi
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	sub	%g2,	0x1A65,	%i2
	andn	%l0,	0x0141,	%g1
	fnegs	%f8,	%f10
	movrne	%g4,	%g3,	%l6
	fcmpne16	%f16,	%f14,	%g5
	nop
	set	0x28, %i7
	prefetch	[%l7 + %i7],	 0x0
	nop
	set	0x10, %i1
	ldstub	[%l7 + %i1],	%i5
	edge8ln	%o3,	%l4,	%i0
	fcmped	%fcc0,	%f20,	%f28
	edge16l	%o5,	%o2,	%i6
	sub	%l2,	%o4,	%i7
	nop 	! 	taddcc	%o6,	%g6,	%g7 changed by convert2hboot
	sub	%o1,	%o7,	%l3
	nop 	! 	tne	%icc,	0x5 changed by convert2hboot
	fmovdleu	%icc,	%f10,	%f26
	mulx	%i1,	%i4,	%l1
	fmovsne	%icc,	%f1,	%f16
	edge8	%l5,	%i3,	%g2
	udivx	%i2,	0x1F3A,	%o0
	ldstub	[%l7 + 0x33],	%l0
	ldsb	[%l7 + 0x1D],	%g4
	array16	%g3,	%l6,	%g5
	fcmped	%fcc1,	%f6,	%f28
	fnor	%f24,	%f0,	%f22
	fexpand	%f27,	%f4
	set	0x18, %i0
	nop	 ! 	prefetcha	[%l7 + %i0] 0x14,	 0x0 ASI use replaced by convert2hboot
	stb	%i5,	[%l7 + 0x08]
	movcc	%icc,	%o3,	%l4
	fmovrdgz	%o5,	%f6,	%f18
	umul	%i0,	0x1F56,	%i6
	xorcc	%o2,	%o4,	%l2
	brz	%i7,	loop_1321
	mova	%xcc,	%g6,	%o6
	smulcc	%g7,	%o1,	%l3
	bneg,a	%icc,	loop_1322
loop_1321:
	subccc	%o7,	%i1,	%i4
	fnegs	%f11,	%f7
	sub	%l5,	%l1,	%i3
loop_1322:
	udivcc	%g2,	0x1072,	%o0
	movneg	%icc,	%l0,	%g4
	wr	%g0,	0x89,	%asi
	subccc	%l6,	0x1D33,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%g1,	%g5,	%o3
	movcs	%icc,	%i5,	%o5
	edge32ln	%i0,	%i6,	%o2
	movrgez	%l4,	0x2D7,	%l2
	fmovrdgez	%o4,	%f26,	%f0
	nop 	! 	taddcc	%g6,	0x1070,	%i7 changed by convert2hboot
	wr	%g0,	0xe2,	%asi
	membar	#Sync
	addccc	%o1,	0x0784,	%g7
	movre	%o7,	0x397,	%l3
	add	%i4,	%i1,	%l1
	addccc	%l5,	%g2,	%i3
	xorcc	%o0,	%g4,	%g3
	movcs	%xcc,	%l6,	%l0
	udivcc	%i2,	0x1D29,	%g5
	move	%xcc,	%g1,	%i5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o3
	nop 	! 	tne	%icc,	0x5 changed by convert2hboot
	movleu	%icc,	%i6,	%o2
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
	udivx	%i0,	0x19B0,	%l2
	fmovdl	%xcc,	%f9,	%f13
	array16	%o4,	%g6,	%l4
	fsrc1s	%f7,	%f7
	nop 	! 	tleu	%xcc,	0x0 changed by convert2hboot
	fmul8x16	%f28,	%f12,	%f4
	edge32l	%i7,	%o6,	%g7
	nop
	setx loop_1323, %l0, %l1
	jmpl %l1, %o1
	subc	%o7,	0x037D,	%l3
	fcmpgt32	%f14,	%f18,	%i4
	fmul8x16	%f18,	%f0,	%f2
loop_1323:
	edge8n	%i1,	%l1,	%l5
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
	fmovd	%f26,	%f22
	sra	%i3,	%o0,	%g4
	set	0x10, %o4
	nop	 ! 	ldxa	[%g0 + %o4] 0x20,	%g2 ASI use replaced by convert2hboot
	bg,a,pn	%xcc,	loop_1324
	ldstub	[%l7 + 0x6E],	%g3
	sdiv	%l0,	0x14B9,	%i2
	fxor	%f30,	%f22,	%f0
loop_1324:
	movrgz	%g5,	%l6,	%g1
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
	umulcc	%i5,	%o3,	%o5
	bcs	%xcc,	loop_1325
	st	%f18,	[%l7 + 0x78]
	subccc	%i6,	0x05FA,	%o2
	fxnor	%f18,	%f24,	%f12
loop_1325:
	srax	%i0,	%l2,	%g6
	movgu	%icc,	%l4,	%i7
	fmul8ulx16	%f2,	%f8,	%f16
	nop 	! 	tneg	%icc,	0x5 changed by convert2hboot
	nop 	! 	sir	0x1487 changed by convert2hboot
	movcs	%icc,	%o4,	%g7
	movcc	%xcc,	%o6,	%o7
	fxnor	%f14,	%f14,	%f24
	sllx	%o1,	0x01,	%i4
	fmovsl	%xcc,	%f14,	%f0
	fandnot2s	%f0,	%f22,	%f31
	fbu	%fcc3,	loop_1326
	fcmpd	%fcc1,	%f16,	%f16
	andn	%i1,	0x1C3A,	%l3
	nop 	! 	taddcc	%l1,	0x1222,	%l5 changed by convert2hboot
loop_1326:
	move	%icc,	%o0,	%g4
	st	%f5,	[%l7 + 0x64]
	udivx	%i3,	0x0277,	%g2
	edge16ln	%l0,	%i2,	%g5
	sub	%g3,	0x1670,	%g1
	movrgez	%l6,	%o3,	%o5
	nop 	! 	taddcctv	%i6,	%i5,	%o2 changed by convert2hboot
	edge16	%i0,	%g6,	%l2
	andn	%i7,	0x1CA6,	%l4
	brgz	%o4,	loop_1327
	nop 	! 	taddcc	%o6,	%o7,	%g7 changed by convert2hboot
	call	loop_1328
	prefetch	[%l7 + 0x78],	 0x0
loop_1327:
	movcs	%xcc,	%o1,	%i4
	movrgz	%i1,	0x246,	%l1
loop_1328:
	movvs	%icc,	%l3,	%o0
	set	0x74, %l4
	nop	 ! 	stwa	%l5,	[%l7 + %l4] 0x80 ASI use replaced by convert2hboot
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
	move	%xcc,	%i3,	%g2
	edge8n	%l0,	%g4,	%g5
	wr	%g0,	0x89,	%asi
	movle	%icc,	%i2,	%g1
	movgu	%icc,	%l6,	%o5
	fmovdl	%icc,	%f14,	%f11
	nop
	set	0x52, %i5
	ldsb	[%l7 + %i5],	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz	%o3,	loop_1329
	fxnor	%f12,	%f26,	%f20
	edge16ln	%i5,	%o2,	%i0
	movvc	%icc,	%g6,	%l2
loop_1329:
	sra	%i7,	0x10,	%l4
	fbule,a	%fcc0,	loop_1330
	membar	0x37
	movn	%icc,	%o6,	%o7
	sdivcc	%g7,	0x08D1,	%o1
loop_1330:
	siam	0x1
	wr	%g0,	0x80,	%asi
	movrne	%i1,	0x20F,	%l1
	movrne	%i4,	%o0,	%l3
	fpadd16	%f0,	%f2,	%f28
	movn	%icc,	%l5,	%i3
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	ba	loop_1331
	edge16l	%g2,	%l0,	%g4
	srax	%g3,	0x0C,	%i2
	movrlz	%g5,	%g1,	%l6
loop_1331:
	fnot2	%f8,	%f26
	nop 	! 	tsubcctv	%o5,	0x1EC2,	%i6 changed by convert2hboot
	fzeros	%f23
	movcs	%xcc,	%o3,	%o2
	smul	%i0,	0x1175,	%i5
	fmovd	%f24,	%f28
	set	0x58, %o1
	nop	 ! 	stxa	%l2,	[%l7 + %o1] 0x2f ASI use replaced by convert2hboot
	membar	#Sync
	fcmpeq16	%f8,	%f22,	%g6
	edge16n	%l4,	%i7,	%o6
	fzeros	%f21
	orn	%o7,	%g7,	%o4
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	bpos,a	%xcc,	loop_1332
	ble	loop_1333
	fbe	%fcc0,	loop_1334
	nop 	! 	tne	%icc,	0x1 changed by convert2hboot
loop_1332:
	fmovrdgz	%i1,	%f4,	%f2
loop_1333:
	nop
	set	0x18, %l0
	nop	 ! 	swapa	[%l7 + %l0] 0x89,	%o1 ASI use replaced by convert2hboot
loop_1334:
	addc	%i4,	0x09BD,	%o0
	fbul,a	%fcc0,	loop_1335
	siam	0x0
	orcc	%l1,	0x0AFA,	%l5
	movg	%xcc,	%l3,	%i3
loop_1335:
	nop 	! 	taddcctv	%l0,	0x15CB,	%g2 changed by convert2hboot
	fandnot1	%f4,	%f24,	%f12
	movrlez	%g4,	0x29A,	%g3
	movrne	%i2,	0x043,	%g1
	orncc	%g5,	0x0D71,	%o5
	fnand	%f14,	%f2,	%f28
	set	0x49, %o6
	nop	 ! 	ldstuba	[%l7 + %o6] 0x88,	%l6 ASI use replaced by convert2hboot
	edge32ln	%i6,	%o3,	%o2
	set	0x40, %o3
	nop	 ! 	stda	%f0,	[%l7 + %o3] 0x11 ASI use replaced by convert2hboot
	mova	%xcc,	%i0,	%l2
	fmovsvc	%xcc,	%f3,	%f21
	sdivx	%i5,	0x0B0C,	%g6
	fbe	%fcc2,	loop_1336
	nop 	! 	tg	%xcc,	0x2 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16al	%f22,	%f7,	%f22
loop_1336:
	fmovde	%xcc,	%f19,	%f19
	movneg	%xcc,	%l4,	%o6
	fmovrdlez	%i7,	%f18,	%f26
	fone	%f20
	sdivx	%g7,	0x0E79,	%o4
	ldstub	[%l7 + 0x3E],	%o7
	ldub	[%l7 + 0x30],	%o1
	nop 	! 	tsubcctv	%i1,	0x1DE4,	%i4 changed by convert2hboot
	ldsw	[%l7 + 0x14],	%l1
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
	fbul,a	%fcc3,	loop_1337
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	fzero	%f28
	sra	%o0,	0x0C,	%l3
loop_1337:
	fblg,a	%fcc3,	loop_1338
	fcmpgt16	%f20,	%f2,	%i3
	swap	[%l7 + 0x58],	%l5
	array8	%l0,	%g4,	%g3
loop_1338:
	movrgz	%i2,	0x2CF,	%g1
	nop 	! 	tgu	%xcc,	0x6 changed by convert2hboot
	xnor	%g5,	0x0667,	%o5
	smulcc	%l6,	%i6,	%g2
	fmovs	%f6,	%f23
	movne	%icc,	%o3,	%i0
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	movleu	%icc,	%l2,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_1339,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	tcs	%icc,	0x0 changed by convert2hboot
	fnor	%f6,	%f16,	%f14
	movrne	%o2,	0x2C1,	%l4
loop_1339:
	call	loop_1340
	fxnor	%f18,	%f8,	%f16
	nop 	! 	tg	%xcc,	0x7 changed by convert2hboot
	sethi	0x0280,	%g6
loop_1340:
	fnot2	%f26,	%f26
	fmovdleu	%xcc,	%f0,	%f7
	fbuge,a	%fcc2,	loop_1341
	fmovsne	%xcc,	%f29,	%f10
	sdiv	%o6,	0x0284,	%i7
	stx	%o4,	[%l7 + 0x68]
loop_1341:
	fmul8x16au	%f20,	%f6,	%f0
	std	%g6,	[%l7 + 0x40]
	movcs	%icc,	%o7,	%o1
	bvc	%xcc,	loop_1342
	ldx	[%l7 + 0x20],	%i4
	smul	%l1,	%i1,	%l3
	fmovrse	%o0,	%f29,	%f20
loop_1342:
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
	fmovrse	%l5,	%f6,	%f9
	edge16l	%l0,	%i3,	%g3
	edge32n	%g4,	%g1,	%i2
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	array8	%o5,	%l6,	%i6
	edge8ln	%g2,	%g5,	%i0
	fbo	%fcc0,	loop_1343
	bpos,pt	%xcc,	loop_1344
	bcc,pn	%icc,	loop_1345
	sdiv	%l2,	0x05E5,	%o3
loop_1343:
	nop
	wr	%g0,	0xea,	%asi
	membar	#Sync
loop_1344:
	stx	%o2,	[%l7 + 0x48]
loop_1345:
	fnot2	%f10,	%f22
	nop 	! 	tleu	%xcc,	0x0 changed by convert2hboot
	subccc	%g6,	%o6,	%l4
	fblg,a	%fcc3,	loop_1346
	nop 	! 	te	%icc,	0x3 changed by convert2hboot
	mova	%icc,	%i7,	%g7
	fpsub32	%f20,	%f22,	%f26
loop_1346:
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
	nop
	setx	loop_1347,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fbul	%fcc0,	loop_1348
	movne	%icc,	%o4,	%o1
	sllx	%i4,	%o7,	%i1
loop_1347:
	movre	%l3,	0x34D,	%l1
loop_1348:
	sdivcc	%l5,	0x048B,	%l0
	wr	%g0,	0x88,	%asi
	fpsub32	%f12,	%f28,	%f16
	fmovsa	%xcc,	%f19,	%f28
	mulx	%o0,	0x1D73,	%g4
	wr	%g0,	0x80,	%asi
	brlz,a	%g3,	loop_1349
	movneg	%icc,	%i2,	%l6
	nop
	set	0x60, %o7
	std	%o4,	[%l7 + %o7]
	nop
	setx loop_1350, %l0, %l1
	jmpl %l1, %i6
loop_1349:
	array8	%g5,	%g2,	%l2
	nop
	set	0x34, %g5
	ldsw	[%l7 + %g5],	%i0
	srax	%o3,	%i5,	%g6
loop_1350:
	xor	%o6,	0x0DFD,	%o2
	pdist	%f0,	%f24,	%f22
	movn	%icc,	%i7,	%g7
	subcc	%o4,	0x011F,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc1,	%f9,	%f9
	bcc,a,pn	%icc,	loop_1351
	std	%o0,	[%l7 + 0x68]
	fbuge,a	%fcc0,	loop_1352
	fmovrdne	%i4,	%f18,	%f10
loop_1351:
	xorcc	%i1,	%l3,	%o7
	alignaddrl	%l1,	%l5,	%l0
loop_1352:
	faligndata	%f20,	%f28,	%f14
	fmuld8sux16	%f29,	%f6,	%f2
	membar	0x6F
	call	loop_1353
	fmovrse	%o0,	%f24,	%f18
	ble,a	%icc,	loop_1354
	fbl,a	%fcc1,	loop_1355
loop_1353:
	nop 	! 	tge	%icc,	0x0 changed by convert2hboot
	siam	0x7
loop_1354:
	fone	%f22
loop_1355:
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
	add	%g4,	%i3,	%g3
	array32	%g1,	%i2,	%o5
	edge8l	%i6,	%g5,	%l6
	movle	%icc,	%l2,	%i0
	edge32	%g2,	%i5,	%o3
	edge32	%o6,	%g6,	%i7
	movrgez	%o2,	%o4,	%l4
	wr	%g0,	0x88,	%asi
	movleu	%icc,	%o1,	%i4
	bg,a,pn	%icc,	loop_1356
	fble,a	%fcc2,	loop_1357
	ldd	[%l7 + 0x60],	%l2
	umul	%o7,	%i1,	%l5
loop_1356:
	smul	%l1,	0x0082,	%l0
loop_1357:
	fsrc2	%f2,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba,a	%fcc3,	loop_1358
	umul	%o0,	0x15D6,	%g4
	movl	%xcc,	%i3,	%g3
	edge8n	%i2,	%g1,	%o5
loop_1358:
	smulcc	%i6,	%g5,	%l2
	xor	%i0,	0x1C5F,	%g2
	fbne,a	%fcc0,	loop_1359
	fnands	%f18,	%f18,	%f27
	fmovdcs	%xcc,	%f16,	%f23
	xnorcc	%l6,	0x13A2,	%i5
loop_1359:
	nop
	wr	%g0,	0x10,	%asi
	edge8l	%o6,	%i7,	%g6
	array8	%o4,	%l4,	%g7
	fpmerge	%f10,	%f17,	%f20
	fnors	%f25,	%f1,	%f6
	edge32	%o2,	%i4,	%l3
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	umulcc	%o1,	%o7,	%i1
	umul	%l5,	0x131B,	%l1
	fornot2s	%f4,	%f7,	%f17
	fcmpeq32	%f12,	%f12,	%l0
	subccc	%g4,	0x00FA,	%i3
	sllx	%o0,	%g3,	%g1
	add	%i2,	0x1027,	%i6
	popc	%g5,	%o5
	fxnors	%f24,	%f13,	%f16
	fmovdpos	%icc,	%f5,	%f9
	array32	%i0,	%g2,	%l6
	array32	%l2,	%o3,	%i5
	bgu,a,pn	%xcc,	loop_1360
	fmovsge	%icc,	%f0,	%f4
	swap	[%l7 + 0x0C],	%i7
	array32	%o6,	%o4,	%g6
loop_1360:
	move	%icc,	%l4,	%g7
	fmovdcs	%icc,	%f31,	%f23
	movre	%o2,	0x24D,	%l3
	array16	%i4,	%o7,	%o1
	fmovdvs	%xcc,	%f7,	%f18
	fba	%fcc1,	loop_1361
	srax	%l5,	%i1,	%l1
	edge16n	%l0,	%g4,	%i3
	smulcc	%g3,	0x0704,	%o0
loop_1361:
	edge32	%i2,	%g1,	%i6
	movgu	%xcc,	%o5,	%g5
	nop 	! 	ta	%xcc,	0x4 changed by convert2hboot
	edge8n	%g2,	%l6,	%i0
	popc	0x1881,	%o3
	fpadd16s	%f0,	%f29,	%f11
	fbg	%fcc0,	loop_1362
	fnot2	%f14,	%f18
	fpackfix	%f0,	%f24
	movpos	%icc,	%l2,	%i7
loop_1362:
	ldsw	[%l7 + 0x28],	%o6
	ldsh	[%l7 + 0x24],	%i5
	wr	%g0,	0xe2,	%asi
	fmovdleu	%icc,	%f4,	%f17
	fmovde	%xcc,	%f16,	%f9
	mulx	%g6,	0x165D,	%g7
	sub	%o2,	0x02ED,	%l3
	fmovsgu	%xcc,	%f8,	%f17
	movne	%icc,	%i4,	%l4
	membar	0x00
	nop 	! 	tl	%icc,	0x4 changed by convert2hboot
	fbule,a	%fcc0,	loop_1363
	umulcc	%o1,	0x0659,	%l5
	xnorcc	%i1,	0x0381,	%l1
	fmovrdlz	%o7,	%f10,	%f28
loop_1363:
	subcc	%g4,	0x158D,	%i3
	set	0x70, %g7
	lda	[%l7 + %g7] 0x14,	%f21
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	andn	%g3,	%l0,	%o0
	mulscc	%g1,	%i6,	%o5
	fmovscs	%icc,	%f26,	%f3
	alignaddrl	%g5,	%i2,	%g2
	subccc	%i0,	0x1632,	%l6
	add	%l2,	%o3,	%o6
	wr	%g0,	0x04,	%asi
	fcmple16	%f14,	%f18,	%i7
	nop 	! 	tleu	%xcc,	0x0 changed by convert2hboot
	smul	%o4,	0x09F0,	%g7
	brgez	%o2,	loop_1364
	orn	%g6,	%i4,	%l4
	fbo	%fcc3,	loop_1365
	mulscc	%l3,	%l5,	%i1
loop_1364:
	fand	%f20,	%f22,	%f30
	bl	%xcc,	loop_1366
loop_1365:
	mulx	%l1,	%o7,	%o1
	edge8n	%i3,	%g4,	%g3
	fbule,a	%fcc0,	loop_1367
loop_1366:
	subccc	%l0,	0x189B,	%o0
	xorcc	%i6,	%g1,	%o5
	fexpand	%f1,	%f18
loop_1367:
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	sth	%g5,	[%l7 + 0x6A]
	addc	%g2,	%i2,	%i0
	fxors	%f11,	%f30,	%f23
	popc	0x001A,	%l6
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
	fnot2	%f18,	%f22
	edge32l	%l2,	%o6,	%i5
	fmovspos	%icc,	%f6,	%f30
	subccc	%o3,	0x0D41,	%i7
	set	0x50, %l3
	nop	 ! 	swapa	[%l7 + %l3] 0x10,	%g7 ASI use replaced by convert2hboot
	movrne	%o4,	%g6,	%i4
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	fnegd	%f30,	%f16
	std	%f20,	[%l7 + 0x10]
	bcs	%xcc,	loop_1368
	fmovrdlz	%o2,	%f16,	%f28
	nop 	! 	tgu	%icc,	0x4 changed by convert2hboot
	movcc	%xcc,	%l3,	%l5
loop_1368:
	bcc,pn	%icc,	loop_1369
	brlez	%l4,	loop_1370
	movg	%icc,	%i1,	%o7
	fmovsn	%icc,	%f26,	%f7
loop_1369:
	and	%l1,	0x1E02,	%i3
loop_1370:
	edge32ln	%o1,	%g4,	%l0
	edge16ln	%o0,	%i6,	%g3
	movre	%o5,	0x320,	%g5
	wr	%g0,	0x19,	%asi
	bleu,pt	%xcc,	loop_1371
	orncc	%g1,	%i0,	%l6
	fpmerge	%f8,	%f18,	%f30
	addc	%l2,	%o6,	%i2
loop_1371:
	xorcc	%o3,	0x1340,	%i7
	movre	%i5,	%o4,	%g6
	nop 	! 	tvc	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x6 changed by convert2hboot
	xnorcc	%i4,	0x14B8,	%o2
	fbn	%fcc1,	loop_1372
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%l3,	%l5
	wr	%g0,	0x80,	%asi
loop_1372:
	xnor	%i1,	0x1A45,	%l4
	wr	%g0,	0x19,	%asi
	set	0x3D, %i3
	nop	 ! 	ldstuba	[%l7 + %i3] 0x80,	%i3 ASI use replaced by convert2hboot
	movrlz	%o1,	0x12E,	%g4
	edge16n	%l0,	%o7,	%i6
	andncc	%g3,	%o5,	%o0
	edge16n	%g2,	%g1,	%i0
	udivcc	%g5,	0x1F95,	%l6
	stx	%o6,	[%l7 + 0x78]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,pn	%xcc,	loop_1373
	edge32l	%l2,	%i2,	%o3
	movn	%icc,	%i7,	%i5
	sra	%o4,	%g6,	%o2
loop_1373:
	fpadd16s	%f15,	%f6,	%f21
	movrne	%i4,	%l5,	%l3
	fpack32	%f12,	%f10,	%f20
	nop 	! 	tsubcc	%g7,	0x014F,	%i1 changed by convert2hboot
	bl,a	loop_1374
	ldx	[%l7 + 0x48],	%l4
	nop
	setx	loop_1375,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	umulcc	%l1,	0x18D4,	%i3
loop_1374:
	fornot2s	%f28,	%f25,	%f3
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
loop_1375:
	move	%xcc,	%g4,	%l0
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
	fbl	%fcc1,	loop_1376
	brgez	%o1,	loop_1377
	fbl,a	%fcc3,	loop_1378
	fbule	%fcc2,	loop_1379
loop_1376:
	call	loop_1380
loop_1377:
	array8	%o7,	%i6,	%o5
loop_1378:
	edge32l	%g3,	%o0,	%g2
loop_1379:
	edge16n	%g1,	%g5,	%l6
loop_1380:
	stx	%i0,	[%l7 + 0x50]
	xorcc	%o6,	0x1988,	%i2
	edge8ln	%l2,	%i7,	%i5
	fxor	%f10,	%f8,	%f22
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	srlx	%o4,	%o3,	%o2
	alignaddrl	%i4,	%g6,	%l5
	fcmple16	%f12,	%f20,	%l3
	set	0x1C, %l1
	lda	[%l7 + %l1] 0x10,	%f31
	fpadd16	%f2,	%f28,	%f4
	movcs	%icc,	%g7,	%l4
	fbug	%fcc3,	loop_1381
	nop 	! 	tcc	%xcc,	0x0 changed by convert2hboot
	edge8n	%l1,	%i1,	%i3
	edge8n	%g4,	%l0,	%o7
loop_1381:
	edge8ln	%o1,	%o5,	%g3
	umulcc	%i6,	0x0C77,	%g2
	sdiv	%g1,	0x1F5F,	%o0
	membar	0x10
	edge32ln	%g5,	%l6,	%o6
	std	%i2,	[%l7 + 0x68]
	movvc	%xcc,	%i0,	%i7
	fbe,a	%fcc2,	loop_1382
	movge	%xcc,	%i5,	%o4
	xnor	%o3,	%l2,	%i4
	ldx	[%l7 + 0x38],	%o2
loop_1382:
	nop
	setx loop_1383, %l0, %l1
	jmpl %l1, %l5
	movrgez	%g6,	0x199,	%g7
	movcs	%icc,	%l3,	%l4
	edge8ln	%l1,	%i1,	%i3
loop_1383:
	fcmpeq32	%f20,	%f0,	%g4
	orcc	%o7,	%o1,	%l0
	udivx	%o5,	0x1F8B,	%g3
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	prefetch	[%l7 + 0x4C],	 0x1
	sdivcc	%i6,	0x0406,	%g2
	nop 	! 	tne	%xcc,	0x5 changed by convert2hboot
	fmovsle	%xcc,	%f10,	%f31
	sub	%o0,	0x1A96,	%g1
	ba,a,pt	%xcc,	loop_1384
	edge32	%g5,	%o6,	%i2
	fnot2	%f26,	%f22
	nop 	! 	taddcc	%l6,	0x1DA2,	%i7 changed by convert2hboot
loop_1384:
	fbule,a	%fcc2,	loop_1385
	nop 	! 	tsubcctv	%i5,	%i0,	%o4 changed by convert2hboot
	srlx	%o3,	%i4,	%o2
	be,a,pt	%icc,	loop_1386
loop_1385:
	fornot2s	%f1,	%f12,	%f30
	fbn,a	%fcc3,	loop_1387
	movne	%xcc,	%l5,	%l2
loop_1386:
	fmovrslz	%g7,	%f9,	%f15
	movrgez	%g6,	0x3BF,	%l3
loop_1387:
	fandnot2	%f12,	%f2,	%f10
	fmovdne	%xcc,	%f8,	%f6
	udivcc	%l1,	0x17E8,	%i1
	sllx	%l4,	%g4,	%i3
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	edge8n	%o1,	%l0,	%o7
	fbug	%fcc0,	loop_1388
	movg	%xcc,	%o5,	%i6
	fnot1	%f0,	%f24
	nop 	! 	taddcctv	%g3,	%o0,	%g1 changed by convert2hboot
loop_1388:
	fmovdleu	%icc,	%f11,	%f20
	edge8	%g2,	%g5,	%i2
	edge8l	%l6,	%o6,	%i5
	fbne	%fcc3,	loop_1389
	xorcc	%i0,	0x1F2B,	%i7
	addc	%o4,	%i4,	%o3
	fmovrslz	%o2,	%f4,	%f19
loop_1389:
	alignaddrl	%l2,	%l5,	%g6
	edge32n	%g7,	%l1,	%i1
	movn	%icc,	%l4,	%l3
	or	%i3,	0x0250,	%o1
	fmovrdlz	%g4,	%f22,	%f0
	movrne	%o7,	%o5,	%i6
	fbne,a	%fcc2,	loop_1390
	brgez,a	%g3,	loop_1391
	fsrc2s	%f0,	%f10
	movn	%icc,	%o0,	%g1
loop_1390:
	sth	%g2,	[%l7 + 0x20]
loop_1391:
	edge8ln	%g5,	%i2,	%l0
	movl	%icc,	%o6,	%i5
	popc	%i0,	%i7
	stb	%o4,	[%l7 + 0x18]
	fones	%f9
	fmovrslz	%l6,	%f14,	%f1
	fmovscc	%icc,	%f27,	%f16
	ldx	[%l7 + 0x10],	%o3
	fmuld8sux16	%f6,	%f31,	%f0
	fblg	%fcc1,	loop_1392
	fmovde	%xcc,	%f26,	%f11
	movre	%o2,	0x292,	%i4
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
loop_1392:
	st	%f11,	[%l7 + 0x50]
	alignaddrl	%l5,	%g6,	%l2
	orncc	%l1,	0x0884,	%g7
	smulcc	%i1,	%l4,	%l3
	std	%f14,	[%l7 + 0x50]
	nop 	! 	tcc	%xcc,	0x0 changed by convert2hboot
	alignaddrl	%i3,	%o1,	%o7
	fbu	%fcc2,	loop_1393
	movleu	%icc,	%o5,	%g4
	srax	%g3,	%i6,	%g1
	flush	%l7 + 0x7C
loop_1393:
	fbl	%fcc3,	loop_1394
	nop
	setx loop_1395, %l0, %l1
	jmpl %l1, %o0
	nop 	! 	taddcc	%g2,	0x1EE6,	%i2 changed by convert2hboot
loop_1394:
	nop
	wr	%g0,	0x0c,	%asi
loop_1395:
	membar	0x73
	orn	%o6,	0x1BCD,	%i5
	be,a,pt	%xcc,	loop_1396
	movrne	%i0,	0x261,	%i7
	ldsw	[%l7 + 0x30],	%o4
	xnor	%l0,	%l6,	%o2
loop_1396:
	addccc	%i4,	0x14B3,	%o3
	nop 	! 	tle	%icc,	0x3 changed by convert2hboot
	movg	%icc,	%g6,	%l5
	fbu,a	%fcc0,	loop_1397
	umulcc	%l1,	0x0FA3,	%g7
	smulcc	%i1,	%l4,	%l3
	alignaddrl	%i3,	%o1,	%l2
loop_1397:
	fmovdneg	%icc,	%f26,	%f17
	nop 	! 	sir	0x13A6 changed by convert2hboot
	nop 	! 	sir	0x12F0 changed by convert2hboot
	nop 	! 	sir	0x1F07 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f2,	%f14,	%f0
	fbug,a	%fcc1,	loop_1398
	fnand	%f14,	%f28,	%f8
	bvc	loop_1399
	fpack16	%f24,	%f28
loop_1398:
	call	loop_1400
	nop 	! 	ta	%xcc,	0x2 changed by convert2hboot
loop_1399:
	nop 	! 	sir	0x1483 changed by convert2hboot
	stw	%o5,	[%l7 + 0x64]
loop_1400:
	and	%g4,	%g3,	%i6
	fbg	%fcc1,	loop_1401
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	bshuffle	%f14,	%f2,	%f30
	movg	%icc,	%o7,	%g1
loop_1401:
	mulx	%g2,	%i2,	%o0
	fornot2s	%f4,	%f12,	%f7
	fxor	%f28,	%f12,	%f10
	movrne	%g5,	0x3EC,	%o6
	fpsub16s	%f6,	%f20,	%f28
	sll	%i0,	%i5,	%o4
	swap	[%l7 + 0x1C],	%i7
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
	alignaddr	%l0,	%o2,	%l6
	edge32n	%o3,	%i4,	%l5
	movge	%xcc,	%l1,	%g7
	nop 	! 	taddcc	%g6,	0x142A,	%l4 changed by convert2hboot
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	movvc	%icc,	%i1,	%i3
	set	0x50, %l6
	lda	[%l7 + %l6] 0x18,	%f15
	wr	%g0,	0x18,	%asi
	nop 	! 	tgu	%xcc,	0x3 changed by convert2hboot
	fmovrde	%o1,	%f8,	%f14
	fzeros	%f26
	edge8ln	%o5,	%l2,	%g4
	nop 	! 	tle	%icc,	0x3 changed by convert2hboot
	lduh	[%l7 + 0x1E],	%i6
	fmovrdne	%o7,	%f24,	%f18
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	wr	%g0,	0x2f,	%asi
	movcs	%xcc,	%g2,	%g3
	bn,pt	%icc,	loop_1402
	smulcc	%i2,	0x1A7C,	%g5
	set	0x10, %o0
	nop	 ! 	ldxa	[%l7 + %o0] 0x89,	%o0 ASI use replaced by convert2hboot
loop_1402:
	movge	%xcc,	%o6,	%i5
	udiv	%o4,	0x0513,	%i0
	subc	%l0,	%i7,	%l6
	fpack16	%f6,	%f23
	sdivx	%o2,	0x115B,	%i4
	sdivcc	%o3,	0x197D,	%l5
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	smul	%l1,	0x0AFB,	%g6
	sdivcc	%l4,	0x1039,	%i1
	nop 	! 	taddcc	%g7,	0x08C0,	%i3 changed by convert2hboot
	nop 	! 	te	%xcc,	0x5 changed by convert2hboot
	fsrc2	%f10,	%f10
	movrlz	%o1,	0x0B5,	%o5
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	wr	%g0,	0x18,	%asi
	move	%xcc,	%g4,	%l2
	brlz,a	%o7,	loop_1403
	nop 	! 	taddcc	%i6,	0x0334,	%g1 changed by convert2hboot
	alignaddrl	%g2,	%g3,	%g5
	umul	%i2,	%o6,	%o0
loop_1403:
	smul	%i5,	0x1D87,	%i0
	edge16ln	%l0,	%i7,	%o4
	edge8	%o2,	%i4,	%o3
	fabsd	%f30,	%f8
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
	movpos	%xcc,	%l6,	%l5
	bl,a	loop_1404
	fabsd	%f14,	%f12
	ldub	[%l7 + 0x37],	%l1
	fmovrsgz	%g6,	%f20,	%f15
loop_1404:
	fornot1	%f0,	%f12,	%f6
	sdivx	%i1,	0x113C,	%l4
	movgu	%icc,	%i3,	%g7
	udiv	%o5,	0x0AF6,	%o1
	fbg,a	%fcc3,	loop_1405
	sth	%g4,	[%l7 + 0x52]
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	andn	%l3,	%o7,	%l2
loop_1405:
	edge32	%g1,	%i6,	%g3
	andn	%g2,	0x0B28,	%i2
	movl	%xcc,	%o6,	%g5
	bleu,pn	%icc,	loop_1406
	movre	%i5,	0x2C4,	%o0
	movrgz	%l0,	%i0,	%i7
	fpack16	%f0,	%f21
loop_1406:
	mulscc	%o4,	0x0D51,	%o2
	swap	[%l7 + 0x70],	%o3
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	udivcc	%i4,	0x19D8,	%l6
	movleu	%xcc,	%l1,	%g6
	mulscc	%l5,	%i1,	%l4
	udivcc	%i3,	0x0FC3,	%o5
	fxors	%f19,	%f20,	%f10
	fmovrdne	%o1,	%f12,	%f30
	be,pt	%xcc,	loop_1407
	fcmpgt16	%f16,	%f26,	%g7
	fxnors	%f2,	%f10,	%f28
	subccc	%g4,	0x0B1C,	%o7
loop_1407:
	fmovscc	%xcc,	%f22,	%f24
	set	0x60, %l2
	nop	 ! 	prefetcha	[%l7 + %l2] 0x0c,	 0x1 ASI use replaced by convert2hboot
	srlx	%l3,	0x00,	%i6
	set	0x20, %g4
	nop	 ! 	ldxa	[%l7 + %g4] 0x88,	%g1 ASI use replaced by convert2hboot
	fandnot1s	%f0,	%f2,	%f26
	andn	%g2,	0x1CD6,	%i2
	movrgz	%o6,	0x3BC,	%g5
	udivcc	%i5,	0x05D0,	%o0
	movvs	%icc,	%l0,	%g3
	set	0x50, %g1
	nop	 ! 	ldda	[%l7 + %g1] 0x04,	%i6 ASI use replaced by convert2hboot
	nop 	! 	tneg	%icc,	0x5 changed by convert2hboot
	brgz	%o4,	loop_1408
	sdivcc	%o2,	0x035D,	%o3
	fnands	%f7,	%f20,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1408:
	nop 	! 	taddcctv	%i0,	0x0063,	%i4 changed by convert2hboot
	nop 	! 	ta	%icc,	0x2 changed by convert2hboot
	set	0x60, %g6
	nop	 ! 	stha	%l6,	[%l7 + %g6] 0x2b ASI use replaced by convert2hboot
	membar	#Sync
	umulcc	%l1,	%g6,	%l5
	fmovsvs	%icc,	%f26,	%f20
	fbue,a	%fcc3,	loop_1409
	fnegd	%f10,	%f4
	fbge	%fcc0,	loop_1410
	fmovdvc	%icc,	%f30,	%f3
loop_1409:
	fbn	%fcc1,	loop_1411
	xnor	%i1,	%l4,	%i3
loop_1410:
	fmovrsgz	%o1,	%f16,	%f4
	edge32l	%g7,	%o5,	%g4
loop_1411:
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	bcc,pt	%xcc,	loop_1412
	fpadd16s	%f20,	%f23,	%f30
	fpackfix	%f8,	%f26
	movcs	%xcc,	%o7,	%l3
loop_1412:
	fnegs	%f26,	%f25
	membar	#Sync
	wr	%g0,	0x16,	%asi
	nop 	! 	tgu	%xcc,	0x6 changed by convert2hboot
	bcc,a	%icc,	loop_1413
	bcc,a	loop_1414
	subcc	%l2,	0x18D5,	%i6
	move	%xcc,	%g2,	%i2
loop_1413:
	movleu	%xcc,	%g1,	%o6
loop_1414:
	fxor	%f2,	%f8,	%f2
	set	0x28, %g2
	nop	 ! 	stwa	%g5,	[%l7 + %g2] 0x19 ASI use replaced by convert2hboot
	umulcc	%o0,	%i5,	%g3
	orncc	%l0,	%i7,	%o4
	bneg,pn	%xcc,	loop_1415
	xnor	%o2,	%o3,	%i0
	fbn	%fcc3,	loop_1416
	ldsb	[%l7 + 0x17],	%l6
loop_1415:
	pdist	%f10,	%f12,	%f2
	movrne	%l1,	0x389,	%i4
loop_1416:
	move	%icc,	%l5,	%i1
	nop 	! 	tsubcc	%g6,	%l4,	%i3 changed by convert2hboot
	sllx	%o1,	0x00,	%g7
	movle	%icc,	%o5,	%g4
	or	%l3,	%o7,	%l2
	set	0x38, %o5
	nop	 ! 	ldxa	[%l7 + %o5] 0x88,	%g2 ASI use replaced by convert2hboot
	fmovsle	%icc,	%f18,	%f12
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
	call	loop_1417
	mova	%icc,	%i6,	%g1
	wr	%g0,	0xf9,	%asi
	membar	#Sync
loop_1417:
	nop
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	bpos,pn	%xcc,	loop_1418
	movrgez	%o0,	0x2AE,	%g5
	fxnors	%f26,	%f14,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1418:
	fnot2s	%f0,	%f21
	set	0x23, %l5
	nop	 ! 	lduba	[%l7 + %l5] 0x81,	%g3 ASI use replaced by convert2hboot
	mova	%icc,	%l0,	%i5
	alignaddrl	%i7,	%o2,	%o4
	umul	%o3,	%l6,	%i0
	fbge	%fcc1,	loop_1419
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	fnand	%f2,	%f18,	%f6
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
loop_1419:
	movrgz	%i4,	0x1F8,	%l1
	srl	%l5,	0x13,	%i1
	brlz,a	%l4,	loop_1420
	srl	%g6,	%o1,	%i3
	movgu	%icc,	%g7,	%g4
	fbl,a	%fcc0,	loop_1421
loop_1420:
	fandnot1s	%f0,	%f25,	%f19
	movrgz	%l3,	0x09C,	%o5
	bne,a,pt	%icc,	loop_1422
loop_1421:
	fbe	%fcc3,	loop_1423
	movneg	%xcc,	%l2,	%g2
	fmovdcs	%xcc,	%f30,	%f1
loop_1422:
	movcs	%icc,	%i6,	%g1
loop_1423:
	nop
	set	0x14, %i6
	nop	 ! 	swapa	[%l7 + %i6] 0x89,	%i2 ASI use replaced by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o7,	%o6,	%g5
	fbe	%fcc2,	loop_1424
	sub	%o0,	%g3,	%l0
	edge16l	%i7,	%o2,	%i5
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
loop_1424:
	edge16n	%o3,	%o4,	%i0
	edge32ln	%i4,	%l6,	%l5
	fornot2	%f8,	%f0,	%f18
	set	0x5E, %g3
	nop	 ! 	lduha	[%l7 + %g3] 0x10,	%i1 ASI use replaced by convert2hboot
	fmovd	%f14,	%f12
	fmovdvs	%icc,	%f17,	%f16
	nop 	! 	sir	0x03C2 changed by convert2hboot
	subcc	%l1,	0x10A7,	%g6
	nop 	! 	tl	%icc,	0x1 changed by convert2hboot
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	nop	 ! 	casa	[%l6] 0x04,	%l4,	%i3 ASI use replaced by convert2hboot
	edge32ln	%o1,	%g4,	%l3
	edge16n	%o5,	%l2,	%g2
	fmovrslez	%g7,	%f6,	%f13
	mulx	%i6,	0x05AE,	%g1
	movrlz	%i2,	0x131,	%o7
	fble	%fcc3,	loop_1425
	umul	%o6,	%g5,	%o0
	movvs	%icc,	%g3,	%i7
	set	0x25, %i4
	nop	 ! 	lduba	[%l7 + %i4] 0x14,	%o2 ASI use replaced by convert2hboot
loop_1425:
	xorcc	%l0,	0x00E4,	%i5
	array16	%o3,	%o4,	%i4
	movleu	%icc,	%i0,	%l5
	fpsub32s	%f8,	%f20,	%f7
	sll	%i1,	0x16,	%l6
	ble	loop_1426
	srax	%l1,	0x00,	%l4
	edge8	%g6,	%o1,	%g4
	st	%f19,	[%l7 + 0x3C]
loop_1426:
	fcmple16	%f10,	%f26,	%i3
	smulcc	%o5,	%l2,	%g2
	srl	%l3,	0x0C,	%i6
	wr	%g0,	0x11,	%asi
	nop
	set	0x08, %o2
	ldd	[%l7 + %o2],	%f2
	ble,a,pt	%icc,	loop_1427
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
	movleu	%xcc,	%i2,	%g7
	fxnor	%f4,	%f28,	%f6
loop_1427:
	movleu	%icc,	%o7,	%g5
	edge32l	%o6,	%o0,	%i7
	subc	%o2,	%l0,	%g3
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	brnz,a	%i5,	loop_1428
	fbe	%fcc3,	loop_1429
	sth	%o3,	[%l7 + 0x40]
	fmul8x16au	%f26,	%f7,	%f30
loop_1428:
	xnor	%o4,	%i0,	%i4
loop_1429:
	movleu	%xcc,	%i1,	%l5
	fabss	%f1,	%f17
	udivx	%l6,	0x01C0,	%l4
	fmovrdne	%l1,	%f14,	%f20
	udivx	%g6,	0x1D9A,	%o1
	fand	%f20,	%f28,	%f14
	nop 	! 	tne	%icc,	0x1 changed by convert2hboot
	fbne,a	%fcc3,	loop_1430
	smul	%g4,	%i3,	%l2
	fmovdn	%xcc,	%f5,	%f25
	sll	%g2,	%o5,	%l3
loop_1430:
	ldsw	[%l7 + 0x70],	%i6
	nop 	! 	taddcc	%i2,	0x1D95,	%g1 changed by convert2hboot
	nop 	! 	tsubcc	%o7,	0x0579,	%g7 changed by convert2hboot
	edge32	%o6,	%o0,	%g5
	swap	[%l7 + 0x5C],	%i7
	array32	%l0,	%g3,	%i5
	bvc,pt	%xcc,	loop_1431
	sra	%o2,	0x16,	%o4
	flush	%l7 + 0x68
	fxnor	%f28,	%f20,	%f22
loop_1431:
	lduw	[%l7 + 0x10],	%i0
	fcmpne32	%f6,	%f28,	%o3
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	fmovda	%xcc,	%f31,	%f1
	fands	%f2,	%f22,	%f3
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	fcmpeq32	%f30,	%f28,	%i4
	nop 	! 	taddcc	%l5,	%i1,	%l4 changed by convert2hboot
	edge16l	%l1,	%l6,	%g6
	brgez	%o1,	loop_1432
	flush	%l7 + 0x10
	mulscc	%g4,	%l2,	%g2
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
loop_1432:
	fcmpes	%fcc2,	%f9,	%f31
	fmovrse	%o5,	%f24,	%f5
	subccc	%i3,	0x0D6E,	%i6
	brnz	%l3,	loop_1433
	brgz,a	%g1,	loop_1434
	ble,pn	%xcc,	loop_1435
	fmovrsgez	%i2,	%f23,	%f18
loop_1433:
	bl,a	%icc,	loop_1436
loop_1434:
	nop 	! 	tvs	%icc,	0x5 changed by convert2hboot
loop_1435:
	fornot2	%f30,	%f16,	%f16
	fmovdleu	%xcc,	%f13,	%f22
loop_1436:
	andncc	%g7,	%o7,	%o0
	nop
	setx	loop_1437,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	st	%f8,	[%l7 + 0x30]
	fmovdcc	%icc,	%f20,	%f7
	fmovrdgz	%g5,	%f14,	%f14
loop_1437:
	xnorcc	%i7,	0x1CD0,	%o6
	fbne,a	%fcc1,	loop_1438
	stw	%g3,	[%l7 + 0x14]
	edge32ln	%l0,	%i5,	%o2
	std	%i0,	[%l7 + 0x28]
loop_1438:
	array16	%o4,	%o3,	%i4
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	sdiv	%l5,	0x11FA,	%i1
	fbuge,a	%fcc2,	loop_1439
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l1,	0x1D0,	%l4
	udivcc	%l6,	0x0028,	%g6
loop_1439:
	fcmped	%fcc2,	%f14,	%f20
	nop
	setx loop_1440, %l0, %l1
	jmpl %l1, %g4
	bneg,pn	%icc,	loop_1441
	udivx	%l2,	0x1F9E,	%o1
	edge32l	%o5,	%g2,	%i6
loop_1440:
	nop 	! 	tleu	%icc,	0x1 changed by convert2hboot
loop_1441:
	sra	%l3,	%i3,	%i2
	movl	%xcc,	%g1,	%g7
	set	0x08, %i2
	nop	 ! 	ldxa	[%l7 + %i2] 0x10,	%o7 ASI use replaced by convert2hboot
	nop 	! 	tvc	%xcc,	0x7 changed by convert2hboot
	movneg	%xcc,	%o0,	%i7
	brgez,a	%g5,	loop_1442
	nop 	! 	tsubcc	%g3,	0x05C3,	%o6 changed by convert2hboot
	bgu,a,pt	%xcc,	loop_1443
	ldsh	[%l7 + 0x10],	%l0
loop_1442:
	nop
	set	0x60, %i1
	nop	 ! 	prefetcha	[%l7 + %i1] 0x88,	 0x0 ASI use replaced by convert2hboot
loop_1443:
	mulx	%i0,	%o4,	%o2
	movrlz	%i4,	%o3,	%i1
	srl	%l5,	%l4,	%l1
	movg	%xcc,	%l6,	%g6
	bcs,a	%xcc,	loop_1444
	edge8l	%l2,	%g4,	%o1
	sub	%g2,	0x11F3,	%i6
	mulscc	%o5,	%l3,	%i3
loop_1444:
	nop
	wr	%g0,	0x22,	%asi
	membar	#Sync
	orncc	%g7,	0x0FFD,	%o7
	movpos	%icc,	%g1,	%o0
	movgu	%xcc,	%i7,	%g3
	fsrc2	%f12,	%f18
	edge16l	%o6,	%l0,	%g5
	fbug	%fcc2,	loop_1445
	fzeros	%f11
	movgu	%icc,	%i0,	%o4
	movrgz	%i5,	%o2,	%i4
loop_1445:
	fmovsne	%icc,	%f7,	%f4
	add	%o3,	0x06F2,	%i1
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	fnot1s	%f2,	%f22
	fmovrdgez	%l5,	%f4,	%f0
	nop 	! 	taddcctv	%l4,	0x09DF,	%l1 changed by convert2hboot
	fbg,a	%fcc1,	loop_1446
	fmovdvc	%xcc,	%f23,	%f12
	edge8l	%l6,	%g6,	%l2
	edge8ln	%o1,	%g4,	%i6
loop_1446:
	movleu	%xcc,	%g2,	%l3
	andn	%o5,	%i3,	%g7
	xor	%o7,	%i2,	%o0
	stx	%i7,	[%l7 + 0x68]
	fbge	%fcc0,	loop_1447
	or	%g3,	%g1,	%l0
	movne	%xcc,	%o6,	%i0
	array16	%g5,	%o4,	%o2
loop_1447:
	fmovrdgz	%i5,	%f14,	%f24
	subcc	%i4,	0x1961,	%i1
	fmuld8sux16	%f16,	%f10,	%f2
	subc	%l5,	0x1192,	%l4
	swap	[%l7 + 0x6C],	%o3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x18,	%asi
	nop	 ! 	casa	[%l6] 0x18,	%l6,	%l1 ASI use replaced by convert2hboot
	udiv	%l2,	0x1481,	%o1
	movcs	%xcc,	%g4,	%g6
	nop 	! 	tsubcc	%i6,	%l3,	%g2 changed by convert2hboot
	or	%i3,	0x0DD1,	%o5
	brgez	%g7,	loop_1448
	movcs	%xcc,	%o7,	%i2
	edge8	%i7,	%o0,	%g3
	orn	%g1,	0x1396,	%l0
loop_1448:
	fbg	%fcc0,	loop_1449
	brlez	%o6,	loop_1450
	sdivx	%i0,	0x02D1,	%o4
	nop 	! 	tsubcc	%o2,	%i5,	%i4 changed by convert2hboot
loop_1449:
	nop
	wr	%g0,	0x89,	%asi
loop_1450:
	brlez	%i1,	loop_1451
	movrne	%l4,	0x31B,	%o3
	udiv	%l5,	0x1544,	%l1
	set	0x08, %i7
	nop	 ! 	ldxa	[%l7 + %i7] 0x10,	%l2 ASI use replaced by convert2hboot
loop_1451:
	nop 	! 	tsubcc	%l6,	0x1A9B,	%o1 changed by convert2hboot
	movg	%icc,	%g4,	%g6
	add	%l3,	%g2,	%i6
	sllx	%i3,	0x1B,	%o5
	wr	%g0,	0x19,	%asi
	movle	%icc,	%g7,	%i2
	set	0x70, %o4
	nop	 ! 	swapa	[%l7 + %o4] 0x81,	%o0 ASI use replaced by convert2hboot
	set	0x40, %i0
	nop	 ! 	ldda	[%l7 + %i0] 0x18,	%f0 ASI use replaced by convert2hboot
	edge32n	%i7,	%g3,	%l0
	bl	%icc,	loop_1452
	fmul8ulx16	%f22,	%f24,	%f28
	bleu,a,pt	%xcc,	loop_1453
	edge32	%g1,	%o6,	%o4
loop_1452:
	subcc	%i0,	%i5,	%i4
	lduh	[%l7 + 0x2E],	%g5
loop_1453:
	movge	%xcc,	%i1,	%o2
	wr	%g0,	0x81,	%asi
	fmovsg	%xcc,	%f27,	%f10
	fmovscs	%icc,	%f31,	%f8
	brgz,a	%o3,	loop_1454
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%l5,	0x12,	%l2
	faligndata	%f4,	%f22,	%f12
loop_1454:
	fbn,a	%fcc3,	loop_1455
	std	%f6,	[%l7 + 0x68]
	alignaddrl	%l1,	%o1,	%g4
	bn	loop_1456
loop_1455:
	movpos	%icc,	%l6,	%g6
	array16	%g2,	%l3,	%i6
	mova	%icc,	%i3,	%o5
loop_1456:
	array16	%g7,	%i2,	%o7
	edge16ln	%i7,	%o0,	%l0
	pdist	%f10,	%f14,	%f10
	fxnor	%f18,	%f6,	%f14
	addc	%g3,	%g1,	%o4
	movvs	%xcc,	%i0,	%i5
	subc	%i4,	%o6,	%i1
	brlz,a	%g5,	loop_1457
	brgez,a	%l4,	loop_1458
	nop 	! 	tpos	%xcc,	0x4 changed by convert2hboot
	subccc	%o2,	0x1CA4,	%l5
loop_1457:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
loop_1458:
	fors	%f27,	%f30,	%f23
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	fornot1s	%f22,	%f0,	%f5
	fpsub32s	%f1,	%f20,	%f31
	fsrc1s	%f21,	%f13
	edge16ln	%o1,	%l1,	%g4
	fble,a	%fcc2,	loop_1459
	bne,a	loop_1460
	fble	%fcc2,	loop_1461
	fmovsle	%xcc,	%f23,	%f11
loop_1459:
	edge32ln	%l6,	%g6,	%l3
loop_1460:
	popc	0x1323,	%g2
loop_1461:
	edge8n	%i3,	%i6,	%g7
	add	%i2,	%o5,	%i7
	fcmpne16	%f2,	%f10,	%o0
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
	movn	%icc,	%l0,	%g3
	fcmpgt32	%f6,	%f16,	%o7
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	fabsd	%f22,	%f28
	and	%g1,	%i0,	%i5
	nop 	! 	tgu	%icc,	0x4 changed by convert2hboot
	nop 	! 	ta	%xcc,	0x0 changed by convert2hboot
	sth	%i4,	[%l7 + 0x76]
	fmul8x16au	%f14,	%f27,	%f2
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x5 changed by convert2hboot
	fba,a	%fcc3,	loop_1462
	mova	%xcc,	%o6,	%o4
	subccc	%g5,	0x1558,	%i1
	sdivcc	%l4,	0x1816,	%o2
loop_1462:
	brlz	%l2,	loop_1463
	edge16	%o3,	%o1,	%l5
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	nop	 ! 	casa	[%l6] 0x88,	%g4,	%l6 ASI use replaced by convert2hboot
loop_1463:
	nop
	setx	loop_1464,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	bgu,pt	%icc,	loop_1465
	fands	%f29,	%f1,	%f10
	smul	%g6,	0x1C35,	%l1
loop_1464:
	edge16	%l3,	%i3,	%g2
loop_1465:
	fsrc2	%f18,	%f6
	edge16ln	%g7,	%i2,	%o5
	movne	%icc,	%i6,	%o0
	movrne	%i7,	%l0,	%g3
	nop 	! 	tsubcc	%g1,	0x140E,	%o7 changed by convert2hboot
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	fmovsvc	%xcc,	%f1,	%f30
	udiv	%i5,	0x188E,	%i0
	wr	%g0,	0xea,	%asi
	membar	#Sync
	edge8	%o4,	%g5,	%i1
	ldstub	[%l7 + 0x43],	%l4
	edge8l	%o2,	%i4,	%l2
	fabss	%f15,	%f18
	addc	%o1,	0x1A6D,	%o3
	edge32n	%g4,	%l6,	%l5
	smul	%l1,	0x10D2,	%g6
	edge16	%l3,	%i3,	%g7
	fxors	%f14,	%f1,	%f5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x11,	%asi
	edge32ln	%o5,	%o0,	%i6
	andn	%i7,	0x0D65,	%l0
	bvs,a,pn	%icc,	loop_1466
	fpadd16s	%f30,	%f0,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc2,	loop_1467
loop_1466:
	nop 	! 	tvc	%icc,	0x5 changed by convert2hboot
	movrgez	%g3,	%g1,	%o7
	wr	%g0,	0x0c,	%asi
loop_1467:
	fmovsle	%icc,	%f29,	%f12
	fba	%fcc1,	loop_1468
	movge	%xcc,	%i5,	%i0
	sdivcc	%o6,	0x0E26,	%g5
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
loop_1468:
	nop
	set	0x72, %i5
	ldub	[%l7 + %i5],	%o4
	edge16n	%l4,	%i1,	%o2
	edge8l	%i4,	%l2,	%o3
	nop
	setx	loop_1469,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop 	! 	te	%xcc,	0x4 changed by convert2hboot
	fone	%f8
	xnorcc	%g4,	0x0CBD,	%l6
loop_1469:
	mulscc	%l5,	%o1,	%l1
	movrlez	%g6,	0x315,	%i3
	edge16l	%g7,	%l3,	%g2
	umulcc	%o5,	0x0D05,	%i2
	umul	%i6,	0x0384,	%i7
	fnors	%f20,	%f3,	%f11
	srax	%l0,	0x19,	%o0
	mulscc	%g1,	0x1635,	%o7
	xor	%g3,	0x09A0,	%i5
	array8	%i0,	%g5,	%o4
	set	0x14, %l4
	nop	 ! 	ldsba	[%l7 + %l4] 0x04,	%l4 ASI use replaced by convert2hboot
	movcc	%xcc,	%i1,	%o2
	udivcc	%i4,	0x1B58,	%l2
	set	0x2C, %o1
	nop	 ! 	ldsha	[%l7 + %o1] 0x88,	%o6 ASI use replaced by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%o3,	loop_1470
	srax	%l6,	%g4,	%l5
	ldd	[%l7 + 0x20],	%o0
	movre	%l1,	%i3,	%g7
loop_1470:
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	fxor	%f24,	%f30,	%f10
	edge32n	%l3,	%g6,	%o5
	fcmpgt16	%f18,	%f16,	%g2
	movne	%xcc,	%i2,	%i6
	sra	%l0,	%o0,	%i7
	edge32	%g1,	%g3,	%o7
	movrgz	%i5,	%i0,	%o4
	fmovdle	%xcc,	%f29,	%f25
	edge8ln	%l4,	%i1,	%o2
	movg	%xcc,	%g5,	%i4
	edge32n	%l2,	%o3,	%l6
	nop 	! 	tneg	%icc,	0x5 changed by convert2hboot
	fbg	%fcc1,	loop_1471
	prefetch	[%l7 + 0x58],	 0x1
	edge16ln	%g4,	%l5,	%o1
	edge32n	%o6,	%l1,	%i3
loop_1471:
	fmovsgu	%icc,	%f29,	%f26
	movvs	%xcc,	%l3,	%g7
	movpos	%xcc,	%o5,	%g2
	fabsd	%f20,	%f28
	ldub	[%l7 + 0x57],	%i2
	addccc	%g6,	%l0,	%i6
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	edge8l	%i7,	%o0,	%g3
	nop 	! 	sir	0x03F9 changed by convert2hboot
	sdiv	%g1,	0x0283,	%i5
	add	%l7,	0x44,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i0
	nop	 ! 	casa	[%l6] 0x0c,	%i0,	%o4 ASI use replaced by convert2hboot
	ba,a	loop_1472
	fpsub32	%f14,	%f24,	%f20
	edge32	%o7,	%i1,	%o2
	fbg	%fcc1,	loop_1473
loop_1472:
	movvs	%icc,	%l4,	%g5
	srax	%l2,	%i4,	%o3
	move	%icc,	%l6,	%g4
loop_1473:
	fcmpgt16	%f4,	%f16,	%o1
	fmuld8sux16	%f15,	%f21,	%f12
	subcc	%o6,	%l1,	%l5
	alignaddrl	%i3,	%l3,	%o5
	wr	%g0,	0x2a,	%asi
	membar	#Sync
	set	0x24, %l0
	nop	 ! 	stba	%i2,	[%l7 + %l0] 0x81 ASI use replaced by convert2hboot
	fbge,a	%fcc3,	loop_1474
	movrlz	%g6,	0x2EF,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l0,	0x0A66,	%i7
loop_1474:
	fba	%fcc1,	loop_1475
	movrlez	%i6,	0x129,	%g3
	movre	%o0,	%g1,	%i5
	nop 	! 	tvs	%xcc,	0x0 changed by convert2hboot
loop_1475:
	umulcc	%i0,	%o7,	%o4
	movne	%xcc,	%o2,	%i1
	bgu	%xcc,	loop_1476
	fbo,a	%fcc3,	loop_1477
	brnz	%g5,	loop_1478
	alignaddr	%l2,	%l4,	%i4
loop_1476:
	bg,a	%xcc,	loop_1479
loop_1477:
	srl	%l6,	0x0C,	%g4
loop_1478:
	fmovsg	%xcc,	%f27,	%f11
	movg	%xcc,	%o3,	%o6
loop_1479:
	movvs	%icc,	%l1,	%l5
	fxnors	%f3,	%f12,	%f17
	srax	%o1,	0x1E,	%i3
	subc	%o5,	%g7,	%i2
	set	0x40, %o3
	nop	 ! 	ldda	[%l7 + %o3] 0x89,	%f0 ASI use replaced by convert2hboot
	bg,a,pt	%xcc,	loop_1480
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	movrlz	%g6,	%g2,	%l3
	edge32ln	%i7,	%i6,	%l0
loop_1480:
	xorcc	%o0,	%g1,	%i5
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x40] %asi,	%f2
	sll	%i0,	%g3,	%o4
	fornot1s	%f20,	%f28,	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	taddcctv	%o2,	0x1F22,	%i1 changed by convert2hboot
	orncc	%o7,	%g5,	%l2
	array16	%l4,	%i4,	%g4
	fbue	%fcc3,	loop_1481
	sllx	%o3,	%o6,	%l1
	edge16ln	%l6,	%o1,	%i3
	edge32	%o5,	%g7,	%l5
loop_1481:
	fmovdvc	%icc,	%f14,	%f21
	array16	%i2,	%g6,	%g2
	nop 	! 	tl	%icc,	0x6 changed by convert2hboot
	nop
	set	0x34, %o6
	lduh	[%l7 + %o6],	%l3
	bpos,a	loop_1482
	fmovrse	%i7,	%f14,	%f31
	subc	%i6,	0x1A72,	%l0
	fnegs	%f1,	%f31
loop_1482:
	fmovdpos	%icc,	%f14,	%f1
	fmovdpos	%xcc,	%f18,	%f13
	movvc	%icc,	%g1,	%o0
	movl	%xcc,	%i5,	%g3
	membar	0x76
	prefetch	[%l7 + 0x18],	 0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	sdivcc	%o4,	0x104D,	%i1
	fmovrdgez	%o2,	%f14,	%f10
	array8	%o7,	%g5,	%l4
	fmovdvs	%xcc,	%f12,	%f11
	brlez,a	%i4,	loop_1483
	sra	%g4,	0x15,	%o3
	nop 	! 	te	%xcc,	0x5 changed by convert2hboot
	movrgz	%l2,	%l1,	%l6
loop_1483:
	bg	loop_1484
	bcs,a	loop_1485
	ldub	[%l7 + 0x66],	%o6
	ldsh	[%l7 + 0x56],	%o1
loop_1484:
	brgez	%o5,	loop_1486
loop_1485:
	srlx	%g7,	%l5,	%i2
	fandnot1s	%f9,	%f20,	%f22
	prefetch	[%l7 + 0x44],	 0x0
loop_1486:
	movgu	%xcc,	%i3,	%g2
	movrgez	%g6,	0x1DF,	%i7
	ldub	[%l7 + 0x72],	%l3
	andn	%l0,	0x11D2,	%g1
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	alignaddrl	%o0,	%i5,	%g3
	orncc	%i6,	%o4,	%i1
	movre	%o2,	%i0,	%o7
	sll	%g5,	%i4,	%g4
	addc	%o3,	%l4,	%l1
	movneg	%icc,	%l2,	%o6
	alignaddrl	%l6,	%o1,	%g7
	sub	%o5,	%l5,	%i3
	fcmpne32	%f10,	%f12,	%g2
	udivcc	%i2,	0x135C,	%g6
	fmovrdlz	%l3,	%f14,	%f18
	flush	%l7 + 0x74
	edge16	%i7,	%l0,	%o0
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
	fmuld8ulx16	%f27,	%f10,	%f24
	ldsb	[%l7 + 0x48],	%i5
	fpmerge	%f15,	%f7,	%f6
	fcmpd	%fcc1,	%f6,	%f10
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	sdivx	%g3,	0x0A83,	%i6
	set	0x40, %o7
	nop	 ! 	stda	%o4,	[%l7 + %o7] 0xe2 ASI use replaced by convert2hboot
	membar	#Sync
	bcc,a,pn	%xcc,	loop_1487
	edge16n	%g1,	%i1,	%o2
	add	%i0,	%o7,	%g5
	alignaddr	%g4,	%i4,	%o3
loop_1487:
	fpsub16s	%f28,	%f25,	%f8
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
	fmovrdlz	%l1,	%f30,	%f2
	mulscc	%l2,	0x18B5,	%l4
	movcs	%icc,	%o6,	%o1
	nop 	! 	tl	%xcc,	0x6 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
	fmovdge	%icc,	%f22,	%f13
	movl	%xcc,	%l6,	%o5
	st	%f27,	[%l7 + 0x1C]
	edge32l	%l5,	%g7,	%i3
	movn	%xcc,	%i2,	%g2
	nop 	! 	tsubcc	%g6,	%l3,	%l0 changed by convert2hboot
	fmovd	%f4,	%f4
	movgu	%icc,	%o0,	%i7
	edge8n	%i5,	%g3,	%o4
	fabsd	%f18,	%f26
	nop 	! 	tsubcctv	%i6,	%g1,	%o2 changed by convert2hboot
	mova	%xcc,	%i0,	%o7
	nop
	setx loop_1488, %l0, %l1
	jmpl %l1, %i1
	fmovda	%xcc,	%f21,	%f29
	orncc	%g5,	%i4,	%g4
	sethi	0x051A,	%o3
loop_1488:
	orn	%l2,	%l1,	%l4
	ldsh	[%l7 + 0x6A],	%o6
	fmovsl	%icc,	%f30,	%f1
	edge16	%o1,	%o5,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l5,	%i3,	%g7
	movpos	%icc,	%g2,	%g6
	array8	%i2,	%l3,	%o0
	fcmps	%fcc1,	%f24,	%f14
	edge32n	%l0,	%i7,	%i5
	alignaddr	%g3,	%o4,	%i6
	movgu	%icc,	%g1,	%i0
	nop 	! 	tgu	%xcc,	0x3 changed by convert2hboot
	popc	%o2,	%i1
	subccc	%o7,	%i4,	%g4
	nop 	! 	tleu	%icc,	0x1 changed by convert2hboot
	nop 	! 	tleu	%xcc,	0x7 changed by convert2hboot
	bcc,pt	%icc,	loop_1489
	movg	%icc,	%o3,	%g5
	ldsh	[%l7 + 0x12],	%l1
	subcc	%l4,	0x09F3,	%o6
loop_1489:
	sllx	%o1,	%l2,	%l6
	nop 	! 	tsubcc	%o5,	%i3,	%l5 changed by convert2hboot
	brgz	%g7,	loop_1490
	nop 	! 	tn	%icc,	0x5 changed by convert2hboot
	edge16ln	%g6,	%g2,	%l3
	subccc	%o0,	0x184B,	%l0
loop_1490:
	fmovrse	%i2,	%f28,	%f31
	movcs	%icc,	%i5,	%g3
	movpos	%xcc,	%i7,	%i6
	std	%g0,	[%l7 + 0x58]
	fmovsn	%xcc,	%f18,	%f21
	fors	%f7,	%f4,	%f9
	ble,pt	%icc,	loop_1491
	fbe,a	%fcc1,	loop_1492
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	fbug	%fcc1,	loop_1493
loop_1491:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1492:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
loop_1493:
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	edge32l	%o4,	%i0,	%o2
	fmovse	%icc,	%f3,	%f12
	movrgz	%i1,	0x12E,	%o7
	bcs,pn	%xcc,	loop_1494
	subccc	%g4,	0x08FF,	%i4
	fcmps	%fcc2,	%f7,	%f30
	fornot2	%f20,	%f10,	%f24
loop_1494:
	fmovrsne	%g5,	%f28,	%f11
	mova	%icc,	%l1,	%l4
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	bvs,a,pt	%xcc,	loop_1495
	movpos	%xcc,	%o6,	%o1
	fblg	%fcc0,	loop_1496
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
loop_1495:
	fornot2s	%f30,	%f6,	%f0
	movl	%icc,	%l2,	%l6
loop_1496:
	sll	%o5,	%o3,	%l5
	edge16	%i3,	%g6,	%g7
	sdiv	%l3,	0x1CA7,	%o0
	andn	%l0,	0x190C,	%i2
	stx	%g2,	[%l7 + 0x08]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	fcmped	%fcc3,	%f6,	%f28
	sdiv	%i6,	0x0707,	%i7
	nop 	! 	tpos	%icc,	0x0 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	fbu	%fcc2,	loop_1497
	udivcc	%o4,	0x1663,	%i0
	alignaddr	%g1,	%o2,	%o7
	movleu	%icc,	%g4,	%i4
loop_1497:
	fcmpgt16	%f8,	%f18,	%g5
	array16	%i1,	%l1,	%l4
	fpack32	%f22,	%f16,	%f14
	movrne	%o1,	0x087,	%o6
	movpos	%xcc,	%l2,	%o5
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
	and	%o3,	%l6,	%l5
	nop 	! 	tsubcctv	%g6,	0x105E,	%i3 changed by convert2hboot
	udivcc	%l3,	0x1E3C,	%g7
	movrne	%o0,	%i2,	%l0
	movre	%g2,	%i5,	%g3
	ldx	[%l7 + 0x20],	%i6
	fcmpeq16	%f22,	%f24,	%i7
	ldx	[%l7 + 0x58],	%o4
	fmovscs	%icc,	%f8,	%f16
	fmovsn	%icc,	%f17,	%f30
	array8	%i0,	%g1,	%o7
	bge,pn	%xcc,	loop_1498
	fbne,a	%fcc3,	loop_1499
	sdivx	%o2,	0x1123,	%g4
	edge16ln	%g5,	%i1,	%i4
loop_1498:
	andcc	%l4,	%o1,	%o6
loop_1499:
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	wr	%g0,	0x0c,	%asi
	addccc	%o5,	%l1,	%l6
	umulcc	%o3,	%g6,	%i3
	bcc,a,pt	%icc,	loop_1500
	fxors	%f14,	%f23,	%f1
	ldsb	[%l7 + 0x58],	%l5
	fnegd	%f12,	%f22
loop_1500:
	fcmple16	%f10,	%f22,	%g7
	addc	%l3,	%i2,	%o0
	udivcc	%l0,	0x1DA8,	%g2
	fbne	%fcc2,	loop_1501
	sdivx	%g3,	0x08AD,	%i5
	orncc	%i7,	%i6,	%i0
	nop 	! 	tge	%xcc,	0x1 changed by convert2hboot
loop_1501:
	alignaddr	%o4,	%g1,	%o7
	move	%xcc,	%g4,	%o2
	movneg	%xcc,	%g5,	%i4
	nop 	! 	tgu	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tle	%xcc,	0x0 changed by convert2hboot
	ldstub	[%l7 + 0x7D],	%l4
	smul	%o1,	0x0E63,	%o6
	array32	%l2,	%o5,	%i1
	fcmpgt16	%f24,	%f0,	%l6
	orn	%o3,	%l1,	%i3
	nop 	! 	tleu	%xcc,	0x7 changed by convert2hboot
	wr	%g0,	0x04,	%asi
	mulx	%g7,	%l5,	%l3
	bvs	%icc,	loop_1502
	ldsh	[%l7 + 0x2C],	%o0
	nop 	! 	tvs	%xcc,	0x3 changed by convert2hboot
	move	%xcc,	%l0,	%i2
loop_1502:
	bpos,pn	%xcc,	loop_1503
	stb	%g3,	[%l7 + 0x55]
	xnorcc	%i5,	0x1434,	%g2
	fmuld8sux16	%f20,	%f2,	%f12
loop_1503:
	fble	%fcc1,	loop_1504
	fcmpne32	%f30,	%f2,	%i6
	ld	[%l7 + 0x64],	%f14
	fpack32	%f8,	%f18,	%f20
loop_1504:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	mova	%icc,	%g1,	%i7
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	alignaddrl	%o7,	%o2,	%g5
	bg,a,pn	%xcc,	loop_1505
	edge8l	%i4,	%g4,	%o1
	fbug,a	%fcc0,	loop_1506
	addc	%o6,	%l4,	%o5
loop_1505:
	bvs,pt	%xcc,	loop_1507
	udivcc	%i1,	0x01C2,	%l2
loop_1506:
	fmovrdne	%l6,	%f10,	%f0
	fnot2	%f8,	%f26
loop_1507:
	fbule	%fcc2,	loop_1508
	movrlez	%l1,	0x157,	%o3
	fmovsneg	%xcc,	%f31,	%f17
	nop
	setx	loop_1509,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_1508:
	edge8ln	%g6,	%g7,	%i3
	fornot2s	%f20,	%f7,	%f6
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
loop_1509:
	bvc,a	%xcc,	loop_1510
	fandnot1s	%f23,	%f16,	%f30
	movvc	%icc,	%l3,	%l5
	udivx	%l0,	0x0062,	%i2
loop_1510:
	bg,a	loop_1511
	udivcc	%g3,	0x0C90,	%o0
	fbne,a	%fcc3,	loop_1512
	fcmpne32	%f12,	%f16,	%i5
loop_1511:
	ldsb	[%l7 + 0x20],	%i6
	movcc	%icc,	%g2,	%i0
loop_1512:
	movpos	%icc,	%g1,	%o4
	movcs	%icc,	%i7,	%o7
	umul	%o2,	0x1FCE,	%g5
	ldsh	[%l7 + 0x4C],	%i4
	nop 	! 	tcc	%xcc,	0x2 changed by convert2hboot
	fnot2s	%f10,	%f14
	movn	%xcc,	%o1,	%o6
	fornot1	%f30,	%f20,	%f20
	brgez	%g4,	loop_1513
	movgu	%icc,	%l4,	%i1
	wr	%g0,	0x19,	%asi
loop_1513:
	fmovdneg	%xcc,	%f21,	%f24
	nop 	! 	tcc	%xcc,	0x7 changed by convert2hboot
	set	0x10, %g7
	nop	 ! 	ldxa	[%l7 + %g7] 0x19,	%l6 ASI use replaced by convert2hboot
	srax	%l2,	%l1,	%o3
	brnz,a	%g7,	loop_1514
	membar	0x0B
	bvs	%icc,	loop_1515
	fmovdvs	%xcc,	%f20,	%f8
loop_1514:
	nop
	wr	%g0,	0x0c,	%asi
loop_1515:
	movne	%xcc,	%g6,	%l3
	addc	%l0,	%i2,	%l5
	subc	%g3,	%o0,	%i5
	fcmple16	%f0,	%f22,	%g2
	movvs	%icc,	%i0,	%g1
	movvc	%icc,	%i6,	%o4
	mulx	%o7,	%i7,	%g5
	addcc	%i4,	0x068F,	%o1
	fmul8x16au	%f0,	%f23,	%f10
	fmovrdlez	%o2,	%f24,	%f18
	movcs	%icc,	%o6,	%l4
	xor	%g4,	0x0805,	%i1
	orn	%l6,	%o5,	%l1
	movl	%xcc,	%o3,	%l2
	fcmped	%fcc2,	%f22,	%f14
	xorcc	%i3,	0x0D09,	%g7
	fandnot1s	%f13,	%f18,	%f13
	brlez	%g6,	loop_1516
	sdivx	%l3,	0x16AE,	%l0
	fmovrdlez	%i2,	%f16,	%f0
	fmovsg	%icc,	%f12,	%f27
loop_1516:
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	brnz,a	%g3,	loop_1517
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	bcs,a	loop_1518
	fpadd32s	%f17,	%f10,	%f15
loop_1517:
	bgu,a,pt	%icc,	loop_1519
	movrlz	%o0,	0x08C,	%l5
loop_1518:
	fmovde	%icc,	%f5,	%f12
	udivx	%g2,	0x1274,	%i0
loop_1519:
	bvc,pt	%xcc,	loop_1520
	fbo,a	%fcc2,	loop_1521
	umulcc	%g1,	0x10C7,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1520:
	brgez,a	%o4,	loop_1522
loop_1521:
	brnz,a	%o7,	loop_1523
	bge,a,pn	%icc,	loop_1524
	movleu	%icc,	%i7,	%i6
loop_1522:
	movn	%xcc,	%g5,	%i4
loop_1523:
	nop
	wr	%g0,	0x81,	%asi
loop_1524:
	srax	%o1,	0x0D,	%o6
	andcc	%g4,	%l4,	%i1
	edge16l	%o5,	%l6,	%l1
	udivcc	%l2,	0x0F4E,	%i3
	bg	%xcc,	loop_1525
	fmuld8ulx16	%f5,	%f5,	%f10
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	fandnot2s	%f15,	%f14,	%f25
loop_1525:
	bgu,pt	%icc,	loop_1526
	movrne	%g7,	0x37F,	%g6
	fbg	%fcc1,	loop_1527
	brlz	%o3,	loop_1528
loop_1526:
	movcs	%xcc,	%l3,	%l0
	movrgz	%g3,	%i2,	%o0
loop_1527:
	fbn	%fcc3,	loop_1529
loop_1528:
	fmuld8sux16	%f24,	%f3,	%f6
	fandnot2s	%f13,	%f10,	%f24
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
loop_1529:
	bvc,a,pn	%xcc,	loop_1530
	ldstub	[%l7 + 0x53],	%g2
	bleu,a,pn	%icc,	loop_1531
	sra	%l5,	0x04,	%i0
loop_1530:
	bvc	%icc,	loop_1532
	edge8ln	%g1,	%o4,	%o7
loop_1531:
	array8	%i5,	%i6,	%i7
	orncc	%i4,	%g5,	%o2
loop_1532:
	fmovsneg	%xcc,	%f25,	%f4
	movpos	%icc,	%o1,	%g4
	sra	%l4,	0x17,	%i1
	movrne	%o5,	0x238,	%o6
	swap	[%l7 + 0x4C],	%l6
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	brgez	%l1,	loop_1533
	xnor	%l2,	0x1B0D,	%i3
	movvc	%xcc,	%g7,	%g6
	edge32l	%o3,	%l0,	%l3
loop_1533:
	fpsub16s	%f16,	%f20,	%f25
	fmovsge	%icc,	%f27,	%f13
	subc	%i2,	%o0,	%g3
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	fmovrsgz	%g2,	%f26,	%f3
	fcmpne32	%f6,	%f10,	%l5
	movn	%icc,	%g1,	%i0
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x11,	%asi
	movgu	%xcc,	%i6,	%i5
	nop 	! 	tcc	%icc,	0x4 changed by convert2hboot
	ba	loop_1534
	brlez,a	%i4,	loop_1535
	fbu,a	%fcc0,	loop_1536
	sdiv	%g5,	0x08C4,	%o2
loop_1534:
	fbul,a	%fcc1,	loop_1537
loop_1535:
	nop 	! 	sir	0x0780 changed by convert2hboot
loop_1536:
	sub	%o1,	0x07CC,	%i7
	and	%g4,	%l4,	%i1
loop_1537:
	sub	%o6,	0x0737,	%l6
	fbule	%fcc2,	loop_1538
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
	edge32	%l1,	%l2,	%o5
loop_1538:
	edge32ln	%g7,	%g6,	%i3
	set	0x24, %l3
	nop	 ! 	ldsha	[%l7 + %l3] 0x81,	%l0 ASI use replaced by convert2hboot
	fmul8x16	%f2,	%f30,	%f30
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	movcc	%xcc,	%o3,	%l3
	call	loop_1539
	fmovsvs	%xcc,	%f11,	%f0
	fmovdleu	%icc,	%f11,	%f3
	add	%o0,	%i2,	%g2
loop_1539:
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	membar	#Sync
	set	0x40, %g5
	nop	 ! 	ldda	[%l7 + %g5] 0xf1,	%f0 ASI use replaced by convert2hboot
	movgu	%xcc,	%i0,	%g1
	fbo	%fcc2,	loop_1540
	fmovsl	%icc,	%f13,	%f22
	xor	%o4,	%i6,	%o7
	add	%i5,	%i4,	%g5
loop_1540:
	ble,a,pn	%xcc,	loop_1541
	nop
	setx	loop_1542,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	bvc,a,pn	%xcc,	loop_1543
	brgz,a	%o2,	loop_1544
loop_1541:
	edge8l	%i7,	%o1,	%g4
loop_1542:
	mulx	%l4,	%i1,	%o6
loop_1543:
	fnot2	%f8,	%f28
loop_1544:
	brgz	%l1,	loop_1545
	fsrc2s	%f17,	%f8
	fmovscc	%icc,	%f1,	%f5
	move	%xcc,	%l6,	%o5
loop_1545:
	movpos	%xcc,	%g7,	%l2
	xnor	%g6,	0x1867,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o3,	%l3,	%l0
	nop
	setx	loop_1546,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fmovsa	%xcc,	%f8,	%f11
	fmovde	%icc,	%f27,	%f4
	smulcc	%o0,	0x028D,	%i2
loop_1546:
	movvs	%icc,	%l5,	%g2
	fbl,a	%fcc1,	loop_1547
	bneg,a,pt	%xcc,	loop_1548
	fcmpd	%fcc1,	%f20,	%f14
	movrlz	%i0,	%g3,	%g1
loop_1547:
	fmovrdgz	%o4,	%f24,	%f8
loop_1548:
	xor	%i6,	%i5,	%o7
	std	%f28,	[%l7 + 0x50]
	nop 	! 	tsubcc	%g5,	0x0C53,	%i4 changed by convert2hboot
	movgu	%xcc,	%i7,	%o1
	set	0x16, %i3
	nop	 ! 	stha	%g4,	[%l7 + %i3] 0xe2 ASI use replaced by convert2hboot
	membar	#Sync
	nop 	! 	tleu	%icc,	0x3 changed by convert2hboot
	fxors	%f3,	%f5,	%f26
	fpack16	%f0,	%f0
	movvs	%xcc,	%l4,	%o2
	alignaddrl	%i1,	%o6,	%l6
	sdivx	%o5,	0x1FAA,	%g7
	fbl	%fcc3,	loop_1549
	ldsh	[%l7 + 0x1E],	%l1
	wr	%g0,	0x80,	%asi
loop_1549:
	edge16ln	%i3,	%l2,	%o3
	movcc	%xcc,	%l0,	%l3
	movne	%xcc,	%i2,	%l5
	edge32n	%o0,	%g2,	%g3
	bleu,a,pn	%xcc,	loop_1550
	movvs	%icc,	%i0,	%o4
	array16	%g1,	%i6,	%i5
	array8	%o7,	%g5,	%i7
loop_1550:
	movne	%xcc,	%i4,	%g4
	edge32n	%o1,	%l4,	%o2
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	movneg	%icc,	%o6,	%i1
	fblg,a	%fcc0,	loop_1551
	fpsub32	%f18,	%f18,	%f22
	fbl,a	%fcc1,	loop_1552
	fmovdneg	%xcc,	%f22,	%f8
loop_1551:
	nop 	! 	taddcc	%l6,	%g7,	%o5 changed by convert2hboot
	edge8ln	%g6,	%l1,	%i3
loop_1552:
	edge32l	%o3,	%l0,	%l3
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	xorcc	%l2,	%i2,	%l5
	fands	%f14,	%f8,	%f10
	fsrc2s	%f23,	%f26
	sethi	0x0966,	%o0
	stb	%g2,	[%l7 + 0x3A]
	nop 	! 	tg	%xcc,	0x4 changed by convert2hboot
	edge16l	%g3,	%o4,	%g1
	addcc	%i6,	%i0,	%i5
	add	%g5,	%i7,	%o7
	xorcc	%i4,	0x016D,	%o1
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	nop 	! 	sir	0x1E80 changed by convert2hboot
	udivx	%l4,	0x0397,	%g4
	smulcc	%o6,	%o2,	%l6
	fxnor	%f2,	%f30,	%f2
	smul	%i1,	0x1095,	%o5
	wr	%g0,	0xe3,	%asi
	membar	#Sync
	alignaddrl	%g7,	%i3,	%o3
	bpos	loop_1553
	fbge,a	%fcc2,	loop_1554
	edge8n	%l1,	%l3,	%l2
	sethi	0x1055,	%i2
loop_1553:
	fcmple16	%f2,	%f20,	%l5
loop_1554:
	movcs	%icc,	%o0,	%l0
	mulscc	%g2,	0x0380,	%o4
	fxnor	%f30,	%f28,	%f24
	addccc	%g3,	0x1A66,	%g1
	fpmerge	%f28,	%f8,	%f20
	movneg	%icc,	%i6,	%i0
	udivcc	%i5,	0x13AF,	%g5
	subccc	%o7,	%i4,	%o1
	fble	%fcc2,	loop_1555
	fbo	%fcc1,	loop_1556
	brz	%l4,	loop_1557
	fbu,a	%fcc1,	loop_1558
loop_1555:
	fmovsge	%xcc,	%f19,	%f21
loop_1556:
	fmovdvc	%xcc,	%f4,	%f11
loop_1557:
	orn	%g4,	0x10F6,	%o6
loop_1558:
	nop
	set	0x30, %l6
	nop	 ! 	ldda	[%l7 + %l6] 0x26,	%o2 ASI use replaced by convert2hboot
	sra	%i7,	%l6,	%i1
	array32	%o5,	%g7,	%i3
	fpsub32	%f18,	%f16,	%f20
	nop
	setx loop_1559, %l0, %l1
	jmpl %l1, %g6
	orn	%l1,	0x0F5E,	%l3
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	pdist	%f14,	%f6,	%f20
loop_1559:
	orcc	%l2,	0x0356,	%i2
	movpos	%icc,	%o3,	%o0
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	movl	%xcc,	%l0,	%g2
	subc	%l5,	0x04E5,	%o4
	add	%g1,	%g3,	%i6
	bgu,a,pt	%xcc,	loop_1560
	sll	%i5,	%i0,	%o7
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	edge16n	%i4,	%o1,	%l4
loop_1560:
	fsrc2s	%f11,	%f16
	subc	%g4,	0x1B45,	%g5
	ld	[%l7 + 0x54],	%f27
	sdiv	%o2,	0x15F8,	%o6
	sdivcc	%l6,	0x0DDE,	%i1
	fpackfix	%f22,	%f26
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
	udivx	%i7,	0x1B5F,	%o5
	umulcc	%g7,	%i3,	%l1
	umulcc	%g6,	%l2,	%l3
	fxor	%f18,	%f8,	%f0
	movneg	%icc,	%o3,	%o0
	brlz,a	%l0,	loop_1561
	orncc	%g2,	%i2,	%o4
	move	%xcc,	%l5,	%g1
	flush	%l7 + 0x14
loop_1561:
	fbuge,a	%fcc1,	loop_1562
	edge8ln	%g3,	%i6,	%i0
	set	0x3A, %l1
	nop	 ! 	stba	%i5,	[%l7 + %l1] 0xea ASI use replaced by convert2hboot
	membar	#Sync
loop_1562:
	fmovdge	%xcc,	%f7,	%f16
	fbne,a	%fcc2,	loop_1563
	nop 	! 	tcc	%icc,	0x1 changed by convert2hboot
	edge32ln	%o7,	%i4,	%l4
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
loop_1563:
	fmovrslz	%g4,	%f1,	%f4
	nop 	! 	tpos	%xcc,	0x4 changed by convert2hboot
	brgz,a	%o1,	loop_1564
	movrlez	%o2,	%g5,	%l6
	movn	%icc,	%i1,	%o6
	ld	[%l7 + 0x44],	%f27
loop_1564:
	xor	%i7,	%g7,	%i3
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x7 changed by convert2hboot
	edge8n	%l1,	%o5,	%l2
	fbule	%fcc3,	loop_1565
	bpos,pn	%xcc,	loop_1566
	edge32n	%g6,	%l3,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1565:
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
loop_1566:
	fpmerge	%f31,	%f17,	%f26
	fmovspos	%xcc,	%f23,	%f22
	ldsb	[%l7 + 0x61],	%l0
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%f4
	fbuge	%fcc0,	loop_1567
	udivx	%o3,	0x13C0,	%g2
	sdivcc	%i2,	0x1D52,	%l5
	fmovsle	%xcc,	%f20,	%f13
loop_1567:
	nop 	! 	sir	0x1D37 changed by convert2hboot
	set	0x48, %g4
	nop	 ! 	stxa	%o4,	[%l7 + %g4] 0xe2 ASI use replaced by convert2hboot
	membar	#Sync
	prefetch	[%l7 + 0x28],	 0x3
	fornot2	%f12,	%f4,	%f24
	fmul8x16al	%f21,	%f21,	%f30
	fpadd32s	%f22,	%f6,	%f24
	fbn	%fcc0,	loop_1568
	andn	%g1,	0x049F,	%i6
	fbu,a	%fcc2,	loop_1569
	fpadd32s	%f7,	%f26,	%f6
loop_1568:
	fmovsgu	%xcc,	%f7,	%f4
loop_1569:
	fcmpeq32	%f10,	%f24,	%g3
	orcc	%i0,	%i5,	%i4
	nop 	! 	taddcctv	%l4,	%o7,	%g4 changed by convert2hboot
	sub	%o2,	%o1,	%g5
	edge32l	%i1,	%l6,	%o6
	fmul8x16al	%f28,	%f31,	%f8
	srax	%i7,	%g7,	%i3
	edge16	%l1,	%o5,	%l2
	fnor	%f14,	%f20,	%f30
	subcc	%g6,	0x19C0,	%o0
	sdivx	%l3,	0x177C,	%l0
	xnor	%g2,	0x0484,	%i2
	fmovsg	%xcc,	%f26,	%f31
	nop
	setx loop_1570, %l0, %l1
	jmpl %l1, %l5
	udiv	%o3,	0x1F09,	%o4
	bg,pt	%icc,	loop_1571
	fmul8x16	%f6,	%f20,	%f4
loop_1570:
	xorcc	%g1,	%i6,	%i0
	lduw	[%l7 + 0x58],	%g3
loop_1571:
	fmovscc	%icc,	%f2,	%f1
	fmovse	%icc,	%f8,	%f17
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	fnot1s	%f8,	%f21
	fsrc2s	%f20,	%f24
	xnor	%i4,	0x17C6,	%l4
	mulx	%i5,	%o7,	%o2
	movrne	%o1,	0x1A6,	%g4
	popc	0x0A7B,	%i1
	srlx	%g5,	0x15,	%l6
	sllx	%o6,	0x0C,	%g7
	udiv	%i7,	0x058D,	%l1
	sethi	0x0A69,	%o5
	fcmpes	%fcc0,	%f6,	%f17
	fbuge,a	%fcc3,	loop_1572
	edge16	%l2,	%i3,	%o0
	movgu	%icc,	%l3,	%l0
	fpadd32	%f2,	%f26,	%f0
loop_1572:
	array16	%g2,	%g6,	%i2
	movrlz	%l5,	%o3,	%o4
	fxors	%f6,	%f2,	%f20
	fmovspos	%xcc,	%f0,	%f9
	alignaddr	%g1,	%i0,	%i6
	fone	%f8
	srl	%i4,	%l4,	%i5
	bl	loop_1573
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tneg	%icc,	0x3 changed by convert2hboot
	movvs	%icc,	%o7,	%o2
loop_1573:
	ba,pn	%xcc,	loop_1574
	sll	%o1,	0x09,	%g4
	call	loop_1575
	subcc	%i1,	%g3,	%l6
loop_1574:
	bg	loop_1576
	subccc	%g5,	0x19A3,	%g7
loop_1575:
	fpsub32s	%f28,	%f1,	%f29
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
loop_1576:
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	set	0x20, %g1
	nop	 ! 	ldstuba	[%l7 + %g1] 0x10,	%i7 ASI use replaced by convert2hboot
	sdiv	%l1,	0x0113,	%o5
	edge8l	%o6,	%l2,	%o0
	xorcc	%i3,	%l3,	%g2
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	subcc	%g6,	%l0,	%i2
	srl	%o3,	0x0D,	%o4
	wr	%g0,	0x2a,	%asi
	membar	#Sync
	wr	%g0,	0x19,	%asi
	fsrc1s	%f12,	%f18
	fnot1	%f12,	%f26
	fmovrdlz	%i6,	%f12,	%f6
	sdivx	%i4,	0x1A62,	%l4
	fornot1	%f8,	%f12,	%f18
	andcc	%i5,	%i0,	%o7
	sra	%o1,	%o2,	%i1
	movrgez	%g4,	0x10D,	%g3
	edge16l	%l6,	%g5,	%g7
	movcs	%xcc,	%l1,	%o5
	fand	%f20,	%f26,	%f12
	xnorcc	%o6,	%l2,	%o0
	movg	%xcc,	%i3,	%i7
	bg,a,pn	%icc,	loop_1577
	movcs	%icc,	%g2,	%g6
	nop 	! 	tgu	%xcc,	0x6 changed by convert2hboot
loop_1577:
	ldd	[%l7 + 0x18],	%l2
	subcc	%l0,	%o3,	%i2
	movge	%xcc,	%g1,	%o4
	wr	%g0,	0xea,	%asi
	membar	#Sync
	subcc	%l5,	%i4,	%l4
	ba,a	loop_1578
	fbue	%fcc1,	loop_1579
	movrlez	%i5,	0x314,	%o7
	fbue	%fcc0,	loop_1580
loop_1578:
	fcmpes	%fcc1,	%f30,	%f1
loop_1579:
	popc	%o1,	%i0
	fpsub16s	%f27,	%f5,	%f12
loop_1580:
	fblg,a	%fcc0,	loop_1581
	flush	%l7 + 0x20
	edge16	%o2,	%i1,	%g3
	mulx	%g4,	0x147C,	%g5
loop_1581:
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	ldd	[%l7 + 0x20],	%f20
	wr	%g0,	0x88,	%asi
	sta	%f21,	[%l7 + 0x5C] %asi
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	wr	%g0,	0x19,	%asi
	nop
	set	0x7A, %o0
	sth	%l1,	[%l7 + %o0]
	nop 	! 	tg	%xcc,	0x7 changed by convert2hboot
	umulcc	%o5,	%g7,	%l2
	andncc	%o6,	%i3,	%i7
	sdivcc	%o0,	0x0B02,	%g2
	subcc	%l3,	0x1B31,	%l0
	siam	0x6
	ble,pt	%icc,	loop_1582
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	fble,a	%fcc0,	loop_1583
	fbule	%fcc0,	loop_1584
loop_1582:
	fands	%f5,	%f23,	%f20
	edge16ln	%g6,	%o3,	%g1
loop_1583:
	edge32n	%i2,	%o4,	%i6
loop_1584:
	movle	%xcc,	%l5,	%i4
	fmovspos	%icc,	%f17,	%f30
	alignaddrl	%l4,	%o7,	%i5
	nop 	! 	tsubcc	%o1,	0x107F,	%i0 changed by convert2hboot
	subc	%o2,	%g3,	%i1
	xnorcc	%g4,	0x1E27,	%l6
	wr	%g0,	0x88,	%asi
	fbug,a	%fcc2,	loop_1585
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	sdiv	%o5,	0x1F0E,	%l1
	ldd	[%l7 + 0x20],	%f28
loop_1585:
	umulcc	%l2,	%o6,	%i3
	sdivx	%i7,	0x012C,	%g7
	call	loop_1586
	edge16n	%o0,	%g2,	%l3
	edge32ln	%l0,	%o3,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1586:
	fbg,a	%fcc2,	loop_1587
	movle	%icc,	%g6,	%i2
	sdivx	%i6,	0x106B,	%l5
	srl	%i4,	%l4,	%o7
loop_1587:
	fnor	%f18,	%f4,	%f2
	fmovrslz	%o4,	%f7,	%f31
	fornot1s	%f15,	%f6,	%f5
	movneg	%xcc,	%i5,	%o1
	wr	%g0,	0x23,	%asi
	membar	#Sync
	edge16l	%o2,	%g3,	%g4
	movrlez	%i1,	%l6,	%o5
	movcs	%icc,	%l1,	%g5
	sdivcc	%l2,	0x13EA,	%i3
	fandnot1	%f24,	%f14,	%f14
	alignaddr	%i7,	%o6,	%g7
	movcs	%xcc,	%o0,	%l3
	fcmpeq16	%f16,	%f6,	%g2
	set	0x220, %g6
	nop	 ! 	ldxa	[%g0 + %g6] 0x52,	%o3 ASI use replaced by convert2hboot
	udiv	%l0,	0x0FD4,	%g6
	alignaddr	%g1,	%i2,	%i6
	movvs	%icc,	%i4,	%l4
	wr	%g0,	0x88,	%asi
	set	0x30, %g2
	nop	 ! 	ldda	[%l7 + %g2] 0x88,	%o6 ASI use replaced by convert2hboot
	nop 	! 	tn	%icc,	0x5 changed by convert2hboot
	smul	%o4,	%i5,	%o1
	edge16l	%o2,	%g3,	%g4
	lduh	[%l7 + 0x22],	%i1
	ba	loop_1588
	array16	%i0,	%o5,	%l6
	lduh	[%l7 + 0x14],	%l1
	xnor	%g5,	%i3,	%l2
loop_1588:
	fmovda	%xcc,	%f11,	%f19
	bg	%xcc,	loop_1589
	fnors	%f13,	%f29,	%f13
	fbue,a	%fcc2,	loop_1590
	movcc	%icc,	%i7,	%g7
loop_1589:
	movl	%xcc,	%o0,	%l3
	nop 	! 	taddcc	%g2,	%o3,	%o6 changed by convert2hboot
loop_1590:
	ldd	[%l7 + 0x70],	%f26
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	std	%f18,	[%l7 + 0x48]
	fmovsg	%icc,	%f14,	%f17
	movvc	%xcc,	%l0,	%g6
	udivcc	%g1,	0x0C82,	%i2
	fcmped	%fcc2,	%f16,	%f4
	bvc,pt	%xcc,	loop_1591
	movn	%xcc,	%i4,	%l4
	fmovscs	%xcc,	%f30,	%f20
	set	0x2D, %l5
	nop	 ! 	ldsba	[%l7 + %l5] 0x11,	%i6 ASI use replaced by convert2hboot
loop_1591:
	fmovda	%xcc,	%f31,	%f28
	orncc	%o7,	0x0DD1,	%o4
	fbge,a	%fcc3,	loop_1592
	fmovrdgez	%i5,	%f30,	%f12
	smul	%o1,	0x1E24,	%o2
	movg	%xcc,	%l5,	%g3
loop_1592:
	lduw	[%l7 + 0x7C],	%g4
	wr	%g0,	0x04,	%asi
	edge32	%o5,	%l6,	%i1
	fmovrde	%g5,	%f30,	%f24
	array32	%i3,	%l2,	%l1
	array32	%g7,	%i7,	%l3
	fbug	%fcc3,	loop_1593
	move	%xcc,	%o0,	%g2
	subc	%o3,	%l0,	%g6
	membar	0x34
loop_1593:
	fmovdvs	%icc,	%f13,	%f18
	fbe,a	%fcc2,	loop_1594
	be,pt	%xcc,	loop_1595
	fcmple16	%f16,	%f8,	%g1
	movle	%xcc,	%o6,	%i4
loop_1594:
	std	%l4,	[%l7 + 0x20]
loop_1595:
	fmovdpos	%icc,	%f8,	%f0
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	call	loop_1596
	alignaddrl	%i6,	%i2,	%o7
	fmovdcs	%xcc,	%f10,	%f16
	nop 	! 	tl	%icc,	0x4 changed by convert2hboot
loop_1596:
	nop 	! 	taddcc	%o4,	0x020E,	%o1 changed by convert2hboot
	set	0x70, %o5
	nop	 ! 	ldda	[%l7 + %o5] 0x2e,	%o2 ASI use replaced by convert2hboot
	bneg	loop_1597
	fands	%f13,	%f24,	%f28
	orn	%i5,	%l5,	%g4
	bvs,pn	%icc,	loop_1598
loop_1597:
	movl	%xcc,	%g3,	%i0
	movrne	%l6,	%i1,	%g5
	fpadd16	%f10,	%f30,	%f20
loop_1598:
	brnz,a	%o5,	loop_1599
	sll	%i3,	%l2,	%l1
	udiv	%g7,	0x1E03,	%i7
	movleu	%icc,	%l3,	%o0
loop_1599:
	fmovrdgz	%o3,	%f0,	%f24
	movrlz	%g2,	0x38B,	%l0
	nop
	set	0x4C, %g3
	ldsh	[%l7 + %g3],	%g1
	set	0x2B, %i4
	nop	 ! 	ldsba	[%l7 + %i4] 0x88,	%o6 ASI use replaced by convert2hboot
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	or	%g6,	%l4,	%i6
	wr	%g0,	0x10,	%asi
	bgu	loop_1600
	movg	%xcc,	%i2,	%o4
	call	loop_1601
	bcs,a	%icc,	loop_1602
loop_1600:
	movge	%icc,	%o7,	%o1
	ldub	[%l7 + 0x2F],	%o2
loop_1601:
	edge32l	%i5,	%l5,	%g3
loop_1602:
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x04,	%asi
	nop	 ! 	casa	[%l6] 0x04,	%g4,	%i0 ASI use replaced by convert2hboot
	std	%i0,	[%l7 + 0x28]
	ble,pn	%icc,	loop_1603
	nop 	! 	tl	%xcc,	0x6 changed by convert2hboot
	movcc	%xcc,	%l6,	%o5
	edge16n	%g5,	%i3,	%l1
loop_1603:
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	fnand	%f2,	%f10,	%f2
	fornot1s	%f22,	%f31,	%f2
	fmovrse	%g7,	%f7,	%f12
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
	fnot2s	%f5,	%f28
	array16	%l2,	%i7,	%o0
	bcc,a	%icc,	loop_1604
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	bpos,a	%xcc,	loop_1605
	fcmpgt16	%f8,	%f18,	%o3
loop_1604:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x58] %asi,	%f0
loop_1605:
	andncc	%g2,	%l3,	%g1
	movvc	%icc,	%o6,	%g6
	fmovsvs	%xcc,	%f29,	%f16
	brgez	%l0,	loop_1606
	bcc	loop_1607
	fmovrdgez	%i6,	%f26,	%f12
	udivx	%l4,	0x14A9,	%i2
loop_1606:
	sll	%o4,	%o7,	%o1
loop_1607:
	movgu	%icc,	%i4,	%i5
	sub	%l5,	%o2,	%g4
	subc	%i0,	%g3,	%l6
	bne,a,pn	%xcc,	loop_1608
	srax	%i1,	0x15,	%o5
	fmovdvs	%icc,	%f23,	%f17
	nop 	! 	tcc	%icc,	0x1 changed by convert2hboot
loop_1608:
	popc	%g5,	%i3
	wr	%g0,	0x19,	%asi
	fpadd32s	%f20,	%f27,	%f5
	mulscc	%l2,	0x0C44,	%l1
	xor	%i7,	%o0,	%o3
	fmul8sux16	%f6,	%f8,	%f30
	brnz	%g2,	loop_1609
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
loop_1609:
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	nop 	! 	taddcc	%o6,	%l3,	%l0 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovs	%f24,	%f20
	bpos	loop_1610
	bcs,a	loop_1611
	subc	%g6,	0x1CCA,	%l4
	mulscc	%i6,	0x0A5B,	%o4
loop_1610:
	fmovrslz	%i2,	%f23,	%f27
loop_1611:
	fmovsg	%icc,	%f15,	%f16
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	edge8	%o7,	%i4,	%o1
	subccc	%l5,	%i5,	%g4
	edge16n	%o2,	%i0,	%g3
	sethi	0x04B3,	%i1
	array16	%o5,	%l6,	%g5
	fble	%fcc1,	loop_1612
	umul	%i3,	%g7,	%l1
	fbge,a	%fcc2,	loop_1613
	edge8	%i7,	%o0,	%l2
loop_1612:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	nop	 ! 	casxa	[%l6] 0x89,	%g2,	%o3 ASI use replaced by convert2hboot
loop_1613:
	srl	%o6,	%l3,	%l0
	andcc	%g6,	%l4,	%i6
	xnorcc	%g1,	0x102F,	%o4
	andn	%i2,	0x1F00,	%i4
	bg,a	%icc,	loop_1614
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	wr	%g0,	0x18,	%asi
loop_1614:
	nop
	set	0x40, %i6
	nop	 ! 	lduwa	[%l7 + %i6] 0x89,	%o1 ASI use replaced by convert2hboot
	movrlz	%i5,	0x067,	%g4
	movg	%icc,	%l5,	%i0
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	fblg,a	%fcc0,	loop_1615
	fnor	%f12,	%f22,	%f14
	array8	%o2,	%g3,	%o5
	fnor	%f30,	%f28,	%f24
loop_1615:
	and	%l6,	0x0A9F,	%g5
	ldd	[%l7 + 0x20],	%f20
	xor	%i1,	%g7,	%l1
	array32	%i3,	%o0,	%i7
	fsrc2s	%f10,	%f0
	fmovsn	%xcc,	%f10,	%f3
	edge32l	%l2,	%g2,	%o6
	edge16	%o3,	%l3,	%g6
	nop 	! 	tl	%icc,	0x6 changed by convert2hboot
	movrne	%l0,	0x3E6,	%l4
	wr	%g0,	0x89,	%asi
	movgu	%xcc,	%o4,	%i2
	sdiv	%i4,	0x0178,	%o7
	fmovrsne	%o1,	%f31,	%f21
	addc	%i6,	0x1E97,	%g4
	set	0x35, %o2
	nop	 ! 	lduba	[%l7 + %o2] 0x88,	%i5 ASI use replaced by convert2hboot
	movleu	%icc,	%l5,	%o2
	ld	[%l7 + 0x5C],	%f5
	wr	%g0,	0xe2,	%asi
	membar	#Sync
	sdivcc	%o5,	0x0289,	%l6
	fbg	%fcc2,	loop_1616
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
	subccc	%i0,	0x10A2,	%g5
	sdiv	%i1,	0x1A4A,	%l1
loop_1616:
	edge16	%g7,	%o0,	%i3
	fmovscs	%icc,	%f1,	%f18
	nop
	setx	loop_1617,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	srl	%i7,	0x13,	%l2
	fmovsne	%xcc,	%f23,	%f13
	brz	%o6,	loop_1618
loop_1617:
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%o2
	movneg	%xcc,	%g2,	%l3
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
loop_1618:
	bvs,pn	%xcc,	loop_1619
	stw	%l0,	[%l7 + 0x28]
	xnor	%l4,	0x1F01,	%g1
	orncc	%g6,	%i2,	%o4
loop_1619:
	membar	0x79
	srl	%i4,	0x0E,	%o7
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	fmovrsgez	%i6,	%f25,	%f6
	set	0x48, %i1
	nop	 ! 	prefetcha	[%l7 + %i1] 0x81,	 0x0 ASI use replaced by convert2hboot
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	smulcc	%o1,	%i5,	%l5
	fbo	%fcc1,	loop_1620
	mulx	%g3,	%o2,	%o5
	ldd	[%l7 + 0x10],	%i6
loop_1620:
	movleu	%xcc,	%i0,	%i1
	fmovdn	%icc,	%f18,	%f7
	fxor	%f4,	%f4,	%f20
	edge32ln	%l1,	%g5,	%o0
	bl,a,pt	%xcc,	loop_1621
	fmovrsgz	%i3,	%f31,	%f29
	edge32n	%i7,	%l2,	%o6
	stb	%o3,	[%l7 + 0x69]
loop_1621:
	smul	%g7,	0x0DC5,	%l3
	fmovrdne	%l0,	%f10,	%f20
	nop 	! 	tsubcc	%g2,	%g1,	%g6 changed by convert2hboot
	umulcc	%i2,	0x12DC,	%l4
	smulcc	%i4,	%o7,	%o4
	brgz	%i6,	loop_1622
	fmovsle	%icc,	%f8,	%f11
	fbg	%fcc2,	loop_1623
	fmovdpos	%xcc,	%f31,	%f30
loop_1622:
	movn	%icc,	%g4,	%i5
	bpos	%xcc,	loop_1624
loop_1623:
	mulscc	%o1,	%g3,	%o2
	srax	%o5,	0x0E,	%l5
	fba,a	%fcc2,	loop_1625
loop_1624:
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	brgz,a	%i0,	loop_1626
	fcmpes	%fcc1,	%f6,	%f22
loop_1625:
	movre	%i1,	0x2AB,	%l1
	fnand	%f6,	%f16,	%f6
loop_1626:
	nop 	! 	tl	%xcc,	0x6 changed by convert2hboot
	orncc	%g5,	%o0,	%i3
	wr	%g0,	0x10,	%asi
	udiv	%i7,	0x0682,	%o6
	set	0x40, %i7
	nop	 ! 	stda	%l2,	[%l7 + %i7] 0x19 ASI use replaced by convert2hboot
	nop 	! 	sir	0x0918 changed by convert2hboot
	edge16	%o3,	%g7,	%l0
	nop
	setx loop_1627, %l0, %l1
	jmpl %l1, %l3
	edge16	%g2,	%g6,	%i2
	alignaddr	%g1,	%l4,	%i4
	fcmpd	%fcc1,	%f4,	%f0
loop_1627:
	nop 	! 	tgu	%xcc,	0x7 changed by convert2hboot
	fbul	%fcc0,	loop_1628
	fcmps	%fcc0,	%f10,	%f12
	addccc	%o4,	0x1F03,	%o7
	fabsd	%f12,	%f14
loop_1628:
	fble,a	%fcc0,	loop_1629
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
	xor	%g4,	%i5,	%i6
	movle	%icc,	%g3,	%o1
loop_1629:
	fnor	%f30,	%f28,	%f30
	fcmpgt16	%f26,	%f16,	%o2
	nop 	! 	tneg	%xcc,	0x7 changed by convert2hboot
	andn	%o5,	%l5,	%i1
	stx	%l1,	[%l7 + 0x38]
	nop 	! 	tsubcctv	%i0,	%g5,	%i3 changed by convert2hboot
	fmovdg	%xcc,	%f18,	%f7
	fpackfix	%f12,	%f24
	movrgez	%o0,	%l6,	%i7
	fcmped	%fcc3,	%f8,	%f0
	movcc	%xcc,	%o6,	%o3
	ldsb	[%l7 + 0x17],	%g7
	edge8ln	%l0,	%l2,	%l3
	fornot2s	%f14,	%f26,	%f23
	udivx	%g2,	0x1758,	%g6
	brgz,a	%g1,	loop_1630
	udivcc	%i2,	0x09CC,	%l4
	movpos	%icc,	%o4,	%o7
	edge32	%g4,	%i5,	%i6
loop_1630:
	bn,a,pn	%xcc,	loop_1631
	xnor	%i4,	0x145A,	%g3
	add	%o2,	%o1,	%o5
	fbu	%fcc3,	loop_1632
loop_1631:
	bneg,a,pt	%icc,	loop_1633
	movrlz	%i1,	0x153,	%l1
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
loop_1632:
	fornot1s	%f7,	%f24,	%f23
loop_1633:
	sethi	0x0C97,	%i0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	wr	%g0,	0x11,	%asi
	sta	%f19,	[%l7 + 0x54] %asi
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	add	%l5,	%o0,	%i7
	set	0x14, %o4
	nop	 ! 	swapa	[%l7 + %o4] 0x89,	%o6 ASI use replaced by convert2hboot
	and	%l6,	%o3,	%g7
	fones	%f1
	edge16l	%l2,	%l0,	%l3
	fbe,a	%fcc1,	loop_1634
	andcc	%g2,	%g1,	%i2
	edge32ln	%l4,	%g6,	%o4
	fbul	%fcc0,	loop_1635
loop_1634:
	fbuge,a	%fcc1,	loop_1636
	fornot2s	%f18,	%f29,	%f23
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
loop_1635:
	movvc	%xcc,	%g4,	%o7
loop_1636:
	movrlz	%i5,	0x2D1,	%i6
	fbue	%fcc0,	loop_1637
	fcmped	%fcc2,	%f6,	%f28
	sethi	0x07CE,	%g3
	ldstub	[%l7 + 0x0F],	%i4
loop_1637:
	st	%f25,	[%l7 + 0x40]
	bpos	%icc,	loop_1638
	fmul8x16au	%f6,	%f26,	%f28
	andn	%o1,	%o2,	%i1
	nop 	! 	tneg	%icc,	0x0 changed by convert2hboot
loop_1638:
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	fzeros	%f5
	mulscc	%o5,	%i0,	%l1
	brnz,a	%g5,	loop_1639
	fmovdvc	%icc,	%f17,	%f27
	move	%xcc,	%i3,	%l5
	srl	%o0,	0x0B,	%i7
loop_1639:
	edge8n	%o6,	%o3,	%g7
	edge16ln	%l6,	%l2,	%l3
	smulcc	%g2,	%l0,	%g1
	sdivx	%l4,	0x0DE3,	%i2
	add	%g6,	%o4,	%g4
	brlz,a	%o7,	loop_1640
	edge32l	%i5,	%g3,	%i4
	movg	%xcc,	%i6,	%o1
	edge8	%o2,	%o5,	%i0
loop_1640:
	movle	%icc,	%i1,	%l1
	fmovdcs	%xcc,	%f9,	%f12
	lduh	[%l7 + 0x1C],	%i3
	ldstub	[%l7 + 0x48],	%g5
	sra	%l5,	%o0,	%o6
	movrlez	%i7,	0x288,	%o3
	array16	%l6,	%g7,	%l2
	and	%g2,	0x0865,	%l0
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
	udivx	%g1,	0x0C73,	%l4
	sra	%i2,	%l3,	%o4
	and	%g4,	0x0448,	%o7
	fnegd	%f18,	%f18
	edge32ln	%g6,	%i5,	%g3
	array8	%i4,	%o1,	%o2
	edge8ln	%i6,	%o5,	%i1
	movrgz	%l1,	0x2B2,	%i0
	fxors	%f2,	%f21,	%f30
	movvc	%icc,	%i3,	%l5
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x14] %asi,	%f22
	bvs,a,pn	%xcc,	loop_1641
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	bvs,a	loop_1642
	bpos	loop_1643
loop_1641:
	movvs	%xcc,	%o0,	%g5
	movrgez	%i7,	0x1E8,	%o3
loop_1642:
	sdivx	%l6,	0x014A,	%o6
loop_1643:
	addc	%l2,	0x09C4,	%g2
	edge8l	%l0,	%g7,	%l4
	srl	%g1,	%l3,	%i2
	nop 	! 	tsubcctv	%g4,	%o7,	%g6 changed by convert2hboot
	popc	0x11CD,	%o4
	fmovsa	%icc,	%f5,	%f16
	fsrc2	%f0,	%f30
	bvs,a	loop_1644
	bcs	loop_1645
	fmovsa	%xcc,	%f18,	%f21
	and	%i5,	%i4,	%g3
loop_1644:
	fmul8x16	%f16,	%f22,	%f12
loop_1645:
	nop 	! 	taddcctv	%o1,	0x0D41,	%i6 changed by convert2hboot
	fnands	%f28,	%f18,	%f12
	sdivcc	%o5,	0x0C80,	%o2
	membar	0x35
	edge8ln	%l1,	%i0,	%i3
	membar	0x31
	nop 	! 	tvc	%icc,	0x2 changed by convert2hboot
	fpmerge	%f29,	%f8,	%f0
	ld	[%l7 + 0x58],	%f21
	fmovscs	%xcc,	%f18,	%f28
	fcmpne16	%f14,	%f4,	%i1
	xor	%o0,	%g5,	%i7
	edge8l	%l5,	%o3,	%l6
	move	%xcc,	%l2,	%g2
	nop 	! 	taddcctv	%l0,	%o6,	%l4 changed by convert2hboot
	nop 	! 	taddcc	%g7,	%g1,	%l3 changed by convert2hboot
	bne	loop_1646
	fmovrdlz	%g4,	%f12,	%f10
	bpos	loop_1647
	fbuge	%fcc2,	loop_1648
loop_1646:
	udivx	%o7,	0x0E27,	%i2
	nop 	! 	tvc	%xcc,	0x3 changed by convert2hboot
loop_1647:
	nop 	! 	ta	%xcc,	0x1 changed by convert2hboot
loop_1648:
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	fbn,a	%fcc3,	loop_1649
	ldstub	[%l7 + 0x6E],	%g6
	ble,a	loop_1650
	fcmple32	%f18,	%f8,	%o4
loop_1649:
	sethi	0x05D9,	%i5
	stb	%g3,	[%l7 + 0x51]
loop_1650:
	lduw	[%l7 + 0x18],	%i4
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
	orn	%o1,	%o5,	%i6
	movn	%xcc,	%o2,	%i0
	xorcc	%i3,	0x19F9,	%i1
	fnot1	%f30,	%f2
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	sdivcc	%l1,	0x12E2,	%o0
	movneg	%xcc,	%g5,	%i7
	andncc	%l5,	%o3,	%l2
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
	faligndata	%f10,	%f24,	%f0
	fnot1s	%f16,	%f16
	nop 	! 	taddcc	%g2,	%l0,	%l6 changed by convert2hboot
	addccc	%l4,	0x18F4,	%o6
	mulscc	%g7,	0x196F,	%g1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	fpackfix	%f12,	%f25
	fornot1	%f2,	%f0,	%f24
	wr	%g0,	0x19,	%asi
	fpsub16s	%f3,	%f27,	%f23
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	flush	%l7 + 0x70
	ldx	[%l7 + 0x60],	%i2
	movn	%xcc,	%o4,	%g6
	fsrc2s	%f23,	%f6
	fones	%f19
	fands	%f19,	%f7,	%f6
	sllx	%i5,	%g3,	%i4
	fmovrsgez	%o5,	%f7,	%f12
	mulx	%i6,	%o1,	%o2
	subccc	%i0,	0x0F4B,	%i3
	lduw	[%l7 + 0x50],	%i1
	udivcc	%o0,	0x09DB,	%g5
	movvs	%xcc,	%l1,	%i7
	sdivcc	%o3,	0x0AB1,	%l5
	edge8	%l2,	%g2,	%l0
	udiv	%l4,	0x1516,	%o6
	fmovrsne	%g7,	%f4,	%f0
	fornot1	%f6,	%f24,	%f8
	fmovrde	%l6,	%f4,	%f14
	nop 	! 	tsubcctv	%g1,	%g4,	%o7 changed by convert2hboot
	move	%icc,	%i2,	%o4
	bneg,pt	%xcc,	loop_1651
	std	%f8,	[%l7 + 0x20]
	fpsub32s	%f1,	%f27,	%f20
	movvc	%xcc,	%l3,	%i5
loop_1651:
	fmovspos	%xcc,	%f0,	%f3
	mova	%xcc,	%g6,	%g3
	orcc	%i4,	0x1F07,	%i6
	sra	%o5,	%o2,	%o1
	movvc	%icc,	%i0,	%i3
	nop 	! 	tgu	%xcc,	0x7 changed by convert2hboot
	fpadd32	%f30,	%f10,	%f8
	or	%o0,	%g5,	%i1
	move	%icc,	%i7,	%o3
	nop 	! 	ta	%icc,	0x6 changed by convert2hboot
	mulscc	%l1,	%l2,	%l5
	ldsh	[%l7 + 0x30],	%g2
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	movpos	%xcc,	%l4,	%o6
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	popc	%l0,	%g7
	array16	%g1,	%g4,	%l6
	fbo	%fcc0,	loop_1652
	movvc	%xcc,	%o7,	%i2
	edge8ln	%l3,	%i5,	%o4
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
loop_1652:
	orcc	%g6,	0x1F9B,	%i4
	fnot1	%f24,	%f12
	fnegd	%f22,	%f0
	fcmps	%fcc0,	%f27,	%f26
	bl,a,pn	%icc,	loop_1653
	movle	%xcc,	%g3,	%o5
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	xorcc	%i6,	%o1,	%o2
loop_1653:
	fsrc1s	%f0,	%f18
	fpack32	%f30,	%f10,	%f18
	fbu	%fcc2,	loop_1654
	brnz	%i3,	loop_1655
	orcc	%i0,	0x17AA,	%o0
	flush	%l7 + 0x14
loop_1654:
	fmovrdlz	%g5,	%f26,	%f12
loop_1655:
	xorcc	%i7,	0x1116,	%i1
	fmovrdgez	%l1,	%f20,	%f28
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
	movg	%icc,	%o3,	%l2
	st	%f16,	[%l7 + 0x50]
	set	0x18, %i0
	nop	 ! 	stwa	%l5,	[%l7 + %i0] 0x81 ASI use replaced by convert2hboot
	movg	%icc,	%g2,	%l4
	nop 	! 	tsubcc	%o6,	0x0045,	%l0 changed by convert2hboot
	movvc	%xcc,	%g7,	%g1
	nop
	set	0x74, %i5
	ldsb	[%l7 + %i5],	%l6
	be	loop_1656
	fornot2s	%f17,	%f3,	%f3
	membar	#Sync
	wr	%g0,	0xf0,	%asi
loop_1656:
	subccc	%o7,	0x192A,	%g4
	edge8	%l3,	%i2,	%i5
	sdiv	%g6,	0x1553,	%o4
	mulx	%g3,	0x0FD8,	%i4
	wr	%g0,	0x20,	%asi
	nop 	! 	tn	%xcc,	0x5 changed by convert2hboot
	mulx	%i6,	%o1,	%i3
	and	%o2,	%i0,	%o0
	edge32n	%i7,	%g5,	%i1
	nop
	setx	loop_1657,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	sll	%l1,	%l2,	%o3
	add	%g2,	0x0018,	%l5
	xorcc	%o6,	0x1275,	%l4
loop_1657:
	call	loop_1658
	nop
	set	0x58, %o1
	std	%g6,	[%l7 + %o1]
	xorcc	%g1,	0x0914,	%l6
	addc	%l0,	%o7,	%l3
loop_1658:
	nop 	! 	ta	%xcc,	0x3 changed by convert2hboot
	movre	%g4,	%i5,	%i2
	fornot2s	%f9,	%f3,	%f2
	udivx	%o4,	0x1954,	%g6
	fmul8x16	%f14,	%f18,	%f10
	nop
	setx	loop_1659,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	mulx	%g3,	0x0896,	%i4
	fmovrdlz	%o5,	%f10,	%f28
	andn	%i6,	%i3,	%o2
loop_1659:
	fnot2s	%f5,	%f30
	nop 	! 	taddcc	%o1,	%i0,	%o0 changed by convert2hboot
	udivcc	%g5,	0x0063,	%i7
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x2C] %asi,	%f26
	wr	%g0,	0x22,	%asi
	membar	#Sync
	movpos	%icc,	%l1,	%o3
	fmovrdlez	%g2,	%f18,	%f12
	nop 	! 	tle	%icc,	0x6 changed by convert2hboot
	sdivx	%l5,	0x102B,	%l2
	array16	%o6,	%g7,	%g1
	nop 	! 	tsubcctv	%l4,	0x08D3,	%l0 changed by convert2hboot
	wr	%g0,	0x80,	%asi
	fmovscc	%xcc,	%f18,	%f7
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
	fmovse	%xcc,	%f20,	%f21
	movrlz	%o7,	0x267,	%l3
	movrlez	%g4,	%i2,	%o4
	and	%i5,	%g6,	%i4
	mova	%xcc,	%o5,	%i6
	movvs	%icc,	%i3,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f8,	%f12,	%f18
	fmovsvc	%icc,	%f6,	%f13
	bl,pt	%xcc,	loop_1660
	lduh	[%l7 + 0x4C],	%o1
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	movcc	%xcc,	%i0,	%o0
loop_1660:
	sdivcc	%g5,	0x0D8E,	%i7
	move	%xcc,	%o2,	%l1
	fandnot1	%f24,	%f4,	%f14
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
	or	%o3,	0x157C,	%i1
	stw	%g2,	[%l7 + 0x68]
	sub	%l2,	0x089D,	%l5
	edge8n	%o6,	%g1,	%l4
	lduh	[%l7 + 0x1A],	%l0
	addccc	%g7,	%o7,	%l3
	edge16n	%l6,	%i2,	%o4
	fpack16	%f18,	%f8
	nop 	! 	tneg	%icc,	0x3 changed by convert2hboot
	fcmpd	%fcc1,	%f6,	%f20
	fmovd	%f20,	%f8
	andncc	%i5,	%g6,	%i4
	bgu,pn	%icc,	loop_1661
	edge8ln	%g4,	%i6,	%o5
	fandnot1	%f18,	%f0,	%f12
	movge	%xcc,	%i3,	%g3
loop_1661:
	fmovdneg	%icc,	%f18,	%f2
	fbuge	%fcc2,	loop_1662
	nop 	! 	tge	%icc,	0x4 changed by convert2hboot
	move	%xcc,	%i0,	%o0
	edge8ln	%o1,	%g5,	%i7
loop_1662:
	movleu	%icc,	%l1,	%o2
	movg	%xcc,	%i1,	%o3
	fnot1s	%f11,	%f31
	wr	%g0,	0x19,	%asi
	movcc	%xcc,	%l2,	%l5
	xnor	%g1,	%l4,	%o6
	movl	%xcc,	%l0,	%o7
	sethi	0x1D7E,	%l3
	nop 	! 	tpos	%xcc,	0x1 changed by convert2hboot
	wr	%g0,	0x18,	%asi
	sta	%f31,	[%l7 + 0x4C] %asi
	ldub	[%l7 + 0x36],	%l6
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
	fbl,a	%fcc1,	loop_1663
	edge32n	%g7,	%i2,	%i5
	edge16l	%o4,	%i4,	%g6
	fmovsne	%icc,	%f24,	%f15
loop_1663:
	subccc	%g4,	0x1554,	%o5
	edge8n	%i6,	%i3,	%i0
	fbue	%fcc0,	loop_1664
	fpadd16	%f22,	%f2,	%f18
	swap	[%l7 + 0x30],	%o0
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
loop_1664:
	orn	%g3,	%g5,	%o1
	move	%icc,	%i7,	%o2
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
	edge8ln	%l1,	%o3,	%i1
	mova	%xcc,	%g2,	%l2
	array16	%l5,	%g1,	%o6
	array32	%l0,	%l4,	%o7
	fmovscc	%icc,	%f3,	%f25
	fmovrslz	%l3,	%f14,	%f4
	andn	%l6,	%g7,	%i5
	fmovscs	%icc,	%f13,	%f21
	fbg	%fcc2,	loop_1665
	fmovrdlz	%i2,	%f12,	%f24
	edge32	%i4,	%g6,	%g4
	ldd	[%l7 + 0x68],	%o4
loop_1665:
	nop
	set	0x2E, %l0
	nop	 ! 	stba	%o5,	[%l7 + %l0] 0x0c ASI use replaced by convert2hboot
	ldx	[%l7 + 0x10],	%i6
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	fcmpgt16	%f12,	%f28,	%i0
	udivcc	%i3,	0x0326,	%o0
	fpadd32s	%f13,	%f22,	%f25
	mova	%icc,	%g5,	%o1
	edge32l	%g3,	%i7,	%l1
	udivcc	%o3,	0x1574,	%i1
	nop 	! 	taddcc	%o2,	%g2,	%l2 changed by convert2hboot
	movge	%xcc,	%l5,	%o6
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
	fmovde	%xcc,	%f23,	%f17
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,pt	%xcc,	loop_1666
	move	%icc,	%l0,	%g1
	bshuffle	%f20,	%f28,	%f22
	fble	%fcc3,	loop_1667
loop_1666:
	sll	%o7,	0x05,	%l3
	fcmpeq32	%f2,	%f0,	%l4
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
loop_1667:
	smulcc	%l6,	0x1DAE,	%i5
	or	%g7,	%i2,	%g6
	fba	%fcc1,	loop_1668
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
	fbue	%fcc1,	loop_1669
	nop 	! 	tsubcctv	%i4,	0x050B,	%o4 changed by convert2hboot
loop_1668:
	mulscc	%g4,	0x1C47,	%i6
	smulcc	%o5,	0x1516,	%i3
loop_1669:
	fmovscc	%icc,	%f20,	%f6
	fxnors	%f11,	%f13,	%f0
	fornot1	%f24,	%f8,	%f10
	stw	%o0,	[%l7 + 0x38]
	nop 	! 	te	%xcc,	0x4 changed by convert2hboot
	move	%icc,	%g5,	%o1
	nop
	set	0x52, %o3
	ldub	[%l7 + %o3],	%g3
	edge16ln	%i0,	%l1,	%o3
	be,pn	%xcc,	loop_1670
	fxor	%f20,	%f8,	%f28
	st	%f29,	[%l7 + 0x6C]
	movleu	%xcc,	%i7,	%i1
loop_1670:
	srlx	%o2,	0x17,	%l2
	nop 	! 	ta	%xcc,	0x0 changed by convert2hboot
	movneg	%icc,	%l5,	%g2
	addccc	%l0,	%o6,	%o7
	andcc	%g1,	%l4,	%l6
	movle	%xcc,	%l3,	%g7
	fands	%f18,	%f8,	%f18
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tsubcctv	%i2,	0x1D58,	%g6 changed by convert2hboot
	andncc	%i5,	%o4,	%i4
	set	0x60, %o6
	nop	 ! 	ldda	[%l7 + %o6] 0x10,	%g4 ASI use replaced by convert2hboot
	wr	%g0,	0x18,	%asi
	edge16ln	%i3,	%o0,	%g5
	stw	%o1,	[%l7 + 0x48]
	fblg	%fcc1,	loop_1671
	nop 	! 	tl	%icc,	0x5 changed by convert2hboot
	fmovse	%icc,	%f28,	%f11
	wr	%g0,	0xe2,	%asi
	membar	#Sync
loop_1671:
	st	%f24,	[%l7 + 0x38]
	sdivcc	%i0,	0x0369,	%g3
	nop 	! 	tl	%xcc,	0x2 changed by convert2hboot
	nop 	! 	taddcctv	%o3,	%l1,	%i1 changed by convert2hboot
	ldsh	[%l7 + 0x42],	%i7
	brz	%o2,	loop_1672
	movne	%xcc,	%l5,	%l2
	bge,a,pn	%xcc,	loop_1673
	movneg	%xcc,	%l0,	%g2
loop_1672:
	udivx	%o7,	0x0C45,	%g1
	umulcc	%o6,	0x03DF,	%l4
loop_1673:
	fmovdgu	%xcc,	%f10,	%f24
	mulscc	%l3,	0x1926,	%l6
	edge16n	%g7,	%g6,	%i5
	movvc	%xcc,	%o4,	%i4
	udiv	%g4,	0x136C,	%i2
	fmovsge	%icc,	%f22,	%f10
	movvc	%xcc,	%o5,	%o0
	or	%i3,	0x0BC5,	%g5
	nop
	setx	loop_1674,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	array8	%o1,	%i0,	%i6
	fands	%f14,	%f13,	%f19
	std	%f26,	[%l7 + 0x18]
loop_1674:
	smulcc	%g3,	%l1,	%o3
	orcc	%i1,	0x1E0C,	%o2
	movrlez	%l5,	0x116,	%l2
	sdivx	%i7,	0x0A22,	%l0
	sra	%g2,	0x1A,	%o7
	sdivcc	%g1,	0x14BB,	%l4
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	nop 	! 	taddcctv	%l3,	0x0FAE,	%l6 changed by convert2hboot
	set	0x1B, %o7
	nop	 ! 	lduba	[%l7 + %o7] 0x80,	%g7 ASI use replaced by convert2hboot
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	siam	0x6
	fmul8sux16	%f8,	%f0,	%f4
	srax	%g6,	0x02,	%i5
	edge8ln	%o6,	%i4,	%o4
	movvc	%icc,	%g4,	%i2
	orncc	%o0,	0x0EE0,	%i3
	movgu	%xcc,	%o5,	%o1
	fandnot1s	%f7,	%f12,	%f25
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	fbg,a	%fcc0,	loop_1675
	nop
	set	0x5C, %g7
	ldsb	[%l7 + %g7],	%g5
	movrgez	%i6,	%i0,	%g3
	fsrc2s	%f6,	%f10
loop_1675:
	srlx	%l1,	0x11,	%i1
	array8	%o2,	%o3,	%l5
	udivcc	%l2,	0x15F4,	%i7
	fcmps	%fcc3,	%f2,	%f19
	fmovsgu	%xcc,	%f2,	%f8
	fmovd	%f24,	%f10
	udivx	%l0,	0x01F4,	%g2
	udiv	%o7,	0x1EC7,	%l4
	edge16n	%g1,	%l6,	%g7
	fxor	%f18,	%f16,	%f2
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
	ldd	[%l7 + 0x30],	%l2
	set	0x76, %l4
	nop	 ! 	stba	%g6,	[%l7 + %l4] 0xea ASI use replaced by convert2hboot
	membar	#Sync
	andncc	%o6,	%i4,	%o4
	mova	%icc,	%g4,	%i2
	subccc	%o0,	%i3,	%o5
	fandnot1s	%f7,	%f26,	%f23
	xnorcc	%i5,	0x13C4,	%o1
	ldsw	[%l7 + 0x44],	%i6
	stb	%i0,	[%l7 + 0x7C]
	edge8l	%g5,	%l1,	%g3
	fnegd	%f30,	%f16
	edge32n	%i1,	%o2,	%o3
	alignaddrl	%l5,	%l2,	%l0
	mova	%xcc,	%g2,	%o7
	sra	%i7,	%g1,	%l6
	set	0x44, %l3
	nop	 ! 	swapa	[%l7 + %l3] 0x10,	%l4 ASI use replaced by convert2hboot
	brgz	%g7,	loop_1676
	std	%g6,	[%l7 + 0x40]
	mulx	%o6,	%l3,	%o4
	lduh	[%l7 + 0x30],	%i4
loop_1676:
	fpsub16s	%f29,	%f0,	%f7
	mulx	%g4,	%i2,	%o0
	bpos,pt	%icc,	loop_1677
	sdivx	%i3,	0x0239,	%i5
	subcc	%o5,	%i6,	%i0
	bl,a	%icc,	loop_1678
loop_1677:
	alignaddr	%g5,	%l1,	%g3
	edge8l	%o1,	%o2,	%i1
loop_1678:
	nop
	set	0x33, %i3
	nop	 ! 	ldsba	[%l7 + %i3] 0x19,	%o3 ASI use replaced by convert2hboot
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	movge	%xcc,	%l5,	%l0
	andcc	%g2,	%l2,	%i7
	udiv	%g1,	0x0738,	%o7
	andcc	%l6,	0x1C17,	%l4
	st	%f4,	[%l7 + 0x24]
	movcc	%icc,	%g6,	%g7
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x3 changed by convert2hboot
	subc	%l3,	0x069C,	%o6
	ldsw	[%l7 + 0x78],	%o4
	movle	%xcc,	%g4,	%i2
	srlx	%i4,	0x0C,	%i3
	wr	%g0,	0x88,	%asi
	nop 	! 	tge	%xcc,	0x1 changed by convert2hboot
	fmovdpos	%xcc,	%f15,	%f17
	smulcc	%o0,	%o5,	%i0
	movrgz	%g5,	0x274,	%l1
	movleu	%xcc,	%i6,	%o1
	ldx	[%l7 + 0x20],	%o2
	nop 	! 	tsubcctv	%g3,	%i1,	%o3 changed by convert2hboot
	nop 	! 	tvc	%xcc,	0x4 changed by convert2hboot
	fabss	%f1,	%f3
	srlx	%l0,	0x11,	%g2
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
	fcmple16	%f0,	%f14,	%l5
	fnand	%f22,	%f2,	%f22
	fmovsn	%xcc,	%f23,	%f7
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	sub	%l2,	0x1F91,	%g1
	movleu	%icc,	%o7,	%l6
	fcmpgt16	%f10,	%f14,	%l4
	set	0x56, %l6
	nop	 ! 	lduha	[%l7 + %l6] 0x15,	%g6 ASI use replaced by convert2hboot
	nop 	! 	tgu	%xcc,	0x3 changed by convert2hboot
	sll	%g7,	%l3,	%o6
	fcmps	%fcc2,	%f23,	%f5
	udiv	%i7,	0x1EAE,	%o4
	fmovrdne	%g4,	%f30,	%f2
	nop 	! 	tsubcctv	%i4,	%i3,	%i2 changed by convert2hboot
	edge16	%i5,	%o0,	%i0
	for	%f16,	%f24,	%f30
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
	fbg,a	%fcc1,	loop_1679
	ble,a,pt	%xcc,	loop_1680
	edge8n	%g5,	%l1,	%o5
	bgu,pt	%icc,	loop_1681
loop_1679:
	fpadd16	%f8,	%f20,	%f24
loop_1680:
	array16	%i6,	%o2,	%o1
	nop 	! 	tvc	%xcc,	0x4 changed by convert2hboot
loop_1681:
	srlx	%g3,	0x16,	%i1
	array8	%l0,	%o3,	%g2
	wr	%g0,	0x19,	%asi
	edge8	%g1,	%o7,	%l5
	addc	%l4,	0x1DC5,	%l6
	std	%g6,	[%l7 + 0x08]
	fmovsg	%xcc,	%f26,	%f14
	xnorcc	%g7,	%l3,	%o6
	wr	%g0,	0x80,	%asi
	prefetch	[%l7 + 0x70],	 0x3
	fpadd16	%f2,	%f30,	%f6
	fcmple16	%f4,	%f18,	%g4
	sdiv	%i4,	0x1256,	%i7
	fcmpne32	%f20,	%f22,	%i3
	move	%xcc,	%i2,	%i5
	fmovrsgez	%o0,	%f13,	%f25
	brgez	%g5,	loop_1682
	fmovdgu	%xcc,	%f31,	%f27
	nop 	! 	tsubcctv	%i0,	%l1,	%i6 changed by convert2hboot
	fmovrde	%o5,	%f10,	%f2
loop_1682:
	smulcc	%o1,	0x1383,	%g3
	movre	%i1,	%o2,	%l0
	ldx	[%l7 + 0x60],	%g2
	add	%l2,	%o3,	%g1
	sdivcc	%o7,	0x0252,	%l5
	edge32	%l4,	%l6,	%g7
	udiv	%g6,	0x14C5,	%o6
	fmovdpos	%icc,	%f12,	%f15
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	set	0x40, %l1
	nop	 ! 	stda	%f0,	[%l7 + %l1] 0x1e ASI use replaced by convert2hboot
	membar	#Sync
	fmovdle	%icc,	%f24,	%f3
	andcc	%l3,	%o4,	%g4
	umul	%i4,	0x17D2,	%i7
	fmul8sux16	%f20,	%f24,	%f0
	wr	%g0,	0xf8,	%asi
	membar	#Sync
	bn,pt	%icc,	loop_1683
	smul	%i3,	%i5,	%i2
	fpackfix	%f30,	%f5
	fmovrse	%o0,	%f15,	%f28
loop_1683:
	array8	%g5,	%i0,	%l1
	srl	%o5,	%i6,	%o1
	bn,a	%xcc,	loop_1684
	fblg,a	%fcc3,	loop_1685
	sllx	%i1,	0x05,	%o2
	stx	%l0,	[%l7 + 0x08]
loop_1684:
	edge32l	%g3,	%g2,	%l2
loop_1685:
	siam	0x3
	sethi	0x0F6E,	%o3
	movl	%xcc,	%g1,	%o7
	fmovdvs	%xcc,	%f20,	%f14
	bg	loop_1686
	fmovrsgez	%l4,	%f5,	%f30
	bpos	loop_1687
	membar	0x16
loop_1686:
	edge16	%l5,	%l6,	%g6
	fcmpeq16	%f22,	%f2,	%o6
loop_1687:
	sdiv	%g7,	0x15E9,	%o4
	xnor	%l3,	0x073A,	%i4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i7
	nop	 ! 	casa	[%l6] 0x81,	%i7,	%g4 ASI use replaced by convert2hboot
	wr	%g0,	0x88,	%asi
	edge8	%i3,	%o0,	%i2
	movne	%icc,	%i0,	%g5
	movpos	%icc,	%l1,	%i6
	addcc	%o1,	0x1678,	%i1
	fmovscc	%xcc,	%f21,	%f29
	wr	%g0,	0x27,	%asi
	membar	#Sync
	wr	%g0,	0x11,	%asi
	fmovscs	%xcc,	%f18,	%f1
	lduw	[%l7 + 0x1C],	%g3
	stx	%o5,	[%l7 + 0x40]
	edge32n	%l2,	%o3,	%g2
	sdiv	%o7,	0x0FE1,	%g1
	std	%f26,	[%l7 + 0x30]
	movrne	%l4,	%l5,	%g6
	movneg	%icc,	%o6,	%g7
	flush	%l7 + 0x24
	fcmpd	%fcc2,	%f28,	%f12
	wr	%g0,	0x18,	%asi
	andncc	%o4,	%i4,	%i7
	ldsw	[%l7 + 0x38],	%g4
	movgu	%icc,	%l3,	%i5
	edge32n	%o0,	%i2,	%i3
	fmovrslz	%g5,	%f12,	%f17
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	nop	 ! 	casa	[%l6] 0x80,	%i0,	%l1 ASI use replaced by convert2hboot
	fpadd32	%f18,	%f4,	%f8
	wr	%g0,	0x10,	%asi
	brnz	%i1,	loop_1688
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	fbuge	%fcc0,	loop_1689
loop_1688:
	brlez	%o2,	loop_1690
loop_1689:
	mova	%xcc,	%i6,	%g3
	nop 	! 	tcs	%icc,	0x7 changed by convert2hboot
loop_1690:
	fmovrdgez	%l0,	%f20,	%f20
	subc	%o5,	0x1BD2,	%o3
	edge32ln	%l2,	%o7,	%g1
	membar	0x72
	sra	%g2,	%l5,	%l4
	andn	%g6,	0x1D4E,	%g7
	fpadd16s	%f20,	%f20,	%f29
	add	%o6,	0x1471,	%l6
	movrlz	%o4,	%i7,	%i4
	fsrc2	%f10,	%f0
	edge8ln	%l3,	%i5,	%o0
	edge8ln	%g4,	%i2,	%i3
	movvc	%icc,	%g5,	%l1
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	orn	%o1,	0x0AF0,	%i0
	fbug	%fcc3,	loop_1691
	stx	%i1,	[%l7 + 0x78]
	orcc	%i6,	%o2,	%l0
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
loop_1691:
	brz,a	%g3,	loop_1692
	fbg	%fcc0,	loop_1693
	movl	%icc,	%o5,	%l2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
loop_1692:
	nop 	! 	tl	%icc,	0x6 changed by convert2hboot
loop_1693:
	movrgez	%g2,	0x306,	%g1
	bne,a,pn	%icc,	loop_1694
	fcmpgt32	%f24,	%f20,	%l5
	movrlz	%l4,	%g7,	%g6
	nop 	! 	sir	0x13CF changed by convert2hboot
loop_1694:
	fbl	%fcc1,	loop_1695
	bl,a	%icc,	loop_1696
	bpos,a,pt	%xcc,	loop_1697
	udiv	%l6,	0x13D2,	%o4
loop_1695:
	sub	%o6,	%i7,	%i4
loop_1696:
	udivcc	%i5,	0x1D11,	%l3
loop_1697:
	bg	%icc,	loop_1698
	bl,a	%icc,	loop_1699
	nop 	! 	tg	%xcc,	0x5 changed by convert2hboot
	mulscc	%o0,	%g4,	%i2
loop_1698:
	fpadd16	%f2,	%f16,	%f0
loop_1699:
	alignaddrl	%g5,	%i3,	%o1
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
	fmovrdne	%i0,	%f30,	%f10
	orn	%l1,	%i1,	%o2
	fmul8x16au	%f15,	%f27,	%f10
	set	0x4C, %l2
	nop	 ! 	ldsha	[%l7 + %l2] 0x89,	%l0 ASI use replaced by convert2hboot
	ba,a,pt	%icc,	loop_1700
	fcmple16	%f2,	%f4,	%i6
	smul	%o5,	%g3,	%l2
	subccc	%o7,	0x05A3,	%g2
loop_1700:
	sdiv	%o3,	0x06ED,	%l5
	wr	%g0,	0x19,	%asi
	nop 	! 	tleu	%xcc,	0x6 changed by convert2hboot
	sdiv	%g7,	0x175E,	%g1
	fmovs	%f11,	%f6
	movle	%xcc,	%l6,	%g6
	fmovsvs	%icc,	%f26,	%f29
	fmovde	%xcc,	%f29,	%f6
	xnor	%o6,	%o4,	%i4
	wr	%g0,	0x88,	%asi
	movvs	%xcc,	%i7,	%o0
	fmovsne	%icc,	%f1,	%f7
	movg	%xcc,	%g4,	%l3
	fmovd	%f2,	%f2
	wr	%g0,	0x19,	%asi
	movn	%xcc,	%g5,	%i3
	addcc	%o1,	%i0,	%l1
	fbe	%fcc3,	loop_1701
	srl	%o2,	0x05,	%i1
	edge32	%l0,	%o5,	%i6
	orn	%g3,	0x14C6,	%l2
loop_1701:
	array8	%g2,	%o7,	%o3
	movneg	%xcc,	%l4,	%l5
	umul	%g1,	0x1C4E,	%l6
	bg,a	%xcc,	loop_1702
	nop
	set	0x61, %g4
	ldstub	[%l7 + %g4],	%g7
	sll	%g6,	0x17,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1702:
	sub	%o6,	%i4,	%i7
	array16	%o0,	%g4,	%i5
	fsrc2s	%f22,	%f5
	smulcc	%i2,	%g5,	%l3
	xorcc	%i3,	%i0,	%o1
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	fpsub16	%f0,	%f24,	%f10
	xnorcc	%o2,	0x0D48,	%i1
	fpsub16	%f2,	%f22,	%f8
	fbue	%fcc2,	loop_1703
	for	%f8,	%f4,	%f14
	sethi	0x04B2,	%l0
	membar	0x62
loop_1703:
	or	%o5,	0x1D55,	%l1
	subcc	%g3,	0x1B94,	%i6
	movvc	%icc,	%l2,	%o7
	edge16ln	%g2,	%l4,	%o3
	fpack32	%f8,	%f14,	%f10
	movne	%icc,	%l5,	%l6
	fmul8x16au	%f23,	%f19,	%f4
	set	0x40, %g1
	nop	 ! 	stda	%f0,	[%l7 + %g1] 0x81 ASI use replaced by convert2hboot
	fbne,a	%fcc1,	loop_1704
	fones	%f31
	srax	%g1,	%g7,	%o4
	ba	loop_1705
loop_1704:
	fpsub16	%f14,	%f8,	%f20
	brnz,a	%g6,	loop_1706
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
loop_1705:
	srl	%o6,	0x0D,	%i7
	mova	%icc,	%o0,	%g4
loop_1706:
	array32	%i5,	%i4,	%i2
	fbul,a	%fcc0,	loop_1707
	movcs	%xcc,	%l3,	%g5
	fmovdvc	%icc,	%f14,	%f23
	fnegd	%f20,	%f0
loop_1707:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	or	%i0,	0x0A52,	%o2
	wr	%g0,	0x10,	%asi
	movl	%xcc,	%l0,	%i1
	stx	%o5,	[%l7 + 0x08]
	nop 	! 	tg	%xcc,	0x4 changed by convert2hboot
	bne,a	%xcc,	loop_1708
	nop 	! 	tsubcc	%l1,	%i6,	%l2 changed by convert2hboot
	nop 	! 	tneg	%xcc,	0x7 changed by convert2hboot
	bge	loop_1709
loop_1708:
	movpos	%xcc,	%o7,	%g2
	fmovdn	%icc,	%f30,	%f15
	bge,a,pn	%xcc,	loop_1710
loop_1709:
	udivcc	%l4,	0x1F72,	%g3
	fbue	%fcc1,	loop_1711
	sll	%o3,	0x09,	%l5
loop_1710:
	add	%g1,	0x0282,	%l6
	alignaddrl	%g7,	%o4,	%o6
loop_1711:
	bg	%xcc,	loop_1712
	subccc	%g6,	%i7,	%o0
	array16	%i5,	%g4,	%i2
	edge8n	%i4,	%l3,	%g5
loop_1712:
	membar	0x78
	bcc,a,pn	%icc,	loop_1713
	nop
	set	0x50, %g5
	std	%f0,	[%l7 + %g5]
	subccc	%o1,	0x1119,	%i0
	smul	%i3,	0x15A1,	%o2
loop_1713:
	ldsb	[%l7 + 0x5C],	%i1
	lduw	[%l7 + 0x50],	%l0
	add	%o5,	%l1,	%l2
	add	%i6,	0x04C2,	%g2
	movgu	%icc,	%l4,	%g3
	set	0x40, %o0
	nop	 ! 	stda	%f16,	[%l7 + %o0] 0x11 ASI use replaced by convert2hboot
	fmovscs	%xcc,	%f23,	%f9
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz,a	%o3,	loop_1714
	flush	%l7 + 0x34
	fand	%f28,	%f24,	%f18
	std	%f26,	[%l7 + 0x70]
loop_1714:
	edge8ln	%o7,	%l5,	%l6
	fors	%f12,	%f10,	%f0
	wr	%g0,	0x04,	%asi
	mulx	%g7,	%o4,	%o6
	fmovdneg	%icc,	%f23,	%f9
	fbuge	%fcc0,	loop_1715
	edge16ln	%g6,	%g1,	%o0
	fbue,a	%fcc1,	loop_1716
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
loop_1715:
	fmovrse	%i5,	%f26,	%f19
	wr	%g0,	0x04,	%asi
loop_1716:
	bgu	%icc,	loop_1717
	nop 	! 	taddcc	%i2,	%i4,	%i7 changed by convert2hboot
	fmovrde	%g5,	%f24,	%f22
	and	%l3,	%i0,	%i3
loop_1717:
	subcc	%o2,	0x034F,	%o1
	movrne	%l0,	0x315,	%i1
	umulcc	%l1,	%l2,	%i6
	srlx	%g2,	0x03,	%l4
	nop 	! 	tcc	%xcc,	0x2 changed by convert2hboot
	fornot1s	%f4,	%f8,	%f21
	andcc	%g3,	0x0ED4,	%o5
	movcs	%icc,	%o7,	%l5
	mulx	%l6,	0x07E6,	%o3
	movcs	%icc,	%o4,	%o6
	faligndata	%f24,	%f14,	%f12
	edge16ln	%g6,	%g7,	%o0
	fzero	%f12
	edge8n	%g1,	%i5,	%i2
	fblg,a	%fcc0,	loop_1718
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	edge32ln	%g4,	%i4,	%i7
	bvc,a,pn	%xcc,	loop_1719
loop_1718:
	fble,a	%fcc0,	loop_1720
	movge	%xcc,	%g5,	%l3
	wr	%g0,	0xf0,	%asi
	membar	#Sync
loop_1719:
	fble	%fcc1,	loop_1721
loop_1720:
	nop 	! 	ta	%xcc,	0x0 changed by convert2hboot
	movne	%xcc,	%i0,	%o2
	edge16ln	%o1,	%l0,	%i1
loop_1721:
	st	%f7,	[%l7 + 0x10]
	movn	%xcc,	%l1,	%l2
	fmovdgu	%xcc,	%f19,	%f8
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	edge32n	%i3,	%g2,	%l4
	andn	%i6,	0x0F9F,	%g3
	fandnot1s	%f14,	%f19,	%f22
	fble	%fcc2,	loop_1722
	orncc	%o5,	0x001A,	%l5
	array16	%l6,	%o3,	%o4
	fmovsleu	%icc,	%f21,	%f6
loop_1722:
	fblg	%fcc3,	loop_1723
	fpadd16	%f26,	%f0,	%f20
	fmovsg	%icc,	%f8,	%f30
	movrne	%o6,	0x3E4,	%g6
loop_1723:
	fmovda	%xcc,	%f20,	%f14
	std	%o6,	[%l7 + 0x30]
	fmovsleu	%xcc,	%f13,	%f17
	umul	%o0,	%g7,	%g1
	movvs	%xcc,	%i2,	%g4
	bleu,a	%xcc,	loop_1724
	sth	%i5,	[%l7 + 0x12]
	edge16ln	%i4,	%g5,	%i7
	movge	%icc,	%i0,	%l3
loop_1724:
	swap	[%l7 + 0x1C],	%o1
	brlez	%o2,	loop_1725
	fpsub32	%f30,	%f18,	%f26
	fcmpne32	%f12,	%f26,	%l0
	nop 	! 	sir	0x1612 changed by convert2hboot
loop_1725:
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	ldx	[%l7 + 0x70],	%i1
	subcc	%l2,	0x009B,	%i3
	array8	%g2,	%l1,	%l4
	nop
	set	0x1A, %g6
	ldsh	[%l7 + %g6],	%g3
	movcc	%xcc,	%o5,	%i6
	fbul,a	%fcc0,	loop_1726
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
	fabsd	%f6,	%f28
	array32	%l6,	%l5,	%o4
loop_1726:
	alignaddr	%o6,	%o3,	%g6
	mulscc	%o7,	0x0ACD,	%g7
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	fpsub32s	%f15,	%f28,	%f6
	umul	%g1,	0x1349,	%o0
	fmovdle	%xcc,	%f20,	%f9
	srl	%g4,	%i5,	%i4
	nop 	! 	tn	%xcc,	0x5 changed by convert2hboot
	array32	%i2,	%g5,	%i0
	orcc	%l3,	0x16D6,	%i7
	edge16n	%o2,	%o1,	%l0
	bge,a	%xcc,	loop_1727
	movrgez	%i1,	0x353,	%i3
	fandnot1	%f6,	%f10,	%f2
	subccc	%l2,	%g2,	%l1
loop_1727:
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	fzero	%f6
	fmul8x16au	%f6,	%f13,	%f6
	movrne	%l4,	0x1B3,	%g3
	edge32n	%i6,	%l6,	%o5
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	orcc	%l5,	%o4,	%o3
	brnz	%g6,	loop_1728
	fmovspos	%icc,	%f6,	%f18
	nop 	! 	sir	0x069C changed by convert2hboot
	membar	#Sync
	set	0x40, %g2
	nop	 ! 	ldda	[%l7 + %g2] 0x1f,	%f16 ASI use replaced by convert2hboot
loop_1728:
	fmovdcc	%icc,	%f3,	%f14
	fandnot1s	%f28,	%f24,	%f28
	sra	%o6,	%o7,	%g7
	fcmped	%fcc3,	%f20,	%f26
	alignaddr	%o0,	%g1,	%i5
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
	wr	%g0,	0x23,	%asi
	membar	#Sync
	subcc	%i2,	%i4,	%g5
	addc	%i0,	0x0970,	%i7
	orncc	%l3,	%o1,	%o2
	movl	%xcc,	%i1,	%i3
	nop
	setx	loop_1729,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	movge	%xcc,	%l2,	%g2
	fmovse	%xcc,	%f31,	%f24
	fzero	%f24
loop_1729:
	nop 	! 	te	%icc,	0x3 changed by convert2hboot
	mova	%icc,	%l0,	%l1
	fbe	%fcc2,	loop_1730
	brgez,a	%l4,	loop_1731
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	movgu	%icc,	%g3,	%l6
loop_1730:
	and	%i6,	0x063E,	%l5
loop_1731:
	movvc	%xcc,	%o5,	%o3
	orncc	%o4,	%o6,	%g6
	ldsb	[%l7 + 0x48],	%g7
	fnand	%f12,	%f22,	%f20
	orcc	%o0,	0x0DCD,	%g1
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	mova	%icc,	%i5,	%g4
	fandnot1	%f20,	%f14,	%f26
	alignaddrl	%i2,	%o7,	%g5
	sllx	%i0,	0x1A,	%i7
	fbne	%fcc0,	loop_1732
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
	membar	0x6E
	fmovrde	%i4,	%f4,	%f18
loop_1732:
	fba	%fcc1,	loop_1733
	sdivcc	%o1,	0x01C5,	%o2
	srax	%l3,	0x10,	%i3
	nop
	setx loop_1734, %l0, %l1
	jmpl %l1, %l2
loop_1733:
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	ldd	[%l7 + 0x30],	%g2
loop_1734:
	sll	%i1,	0x03,	%l0
	umul	%l4,	%l1,	%l6
	bneg,a	loop_1735
	fmovspos	%icc,	%f5,	%f1
	andcc	%i6,	%l5,	%g3
	wr	%g0,	0x80,	%asi
loop_1735:
	movrne	%o3,	%o4,	%g6
	prefetch	[%l7 + 0x14],	 0x0
	fmovrsgz	%g7,	%f31,	%f19
	fmovsa	%xcc,	%f7,	%f5
	fcmpeq32	%f4,	%f14,	%o0
	xorcc	%g1,	0x024E,	%i5
	addcc	%o6,	0x16A7,	%g4
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	set	0x28, %l5
	nop	 ! 	prefetcha	[%l7 + %l5] 0x04,	 0x2 ASI use replaced by convert2hboot
	movcs	%xcc,	%i2,	%i0
	fbue	%fcc0,	loop_1736
	mova	%xcc,	%g5,	%i7
	fpsub32	%f2,	%f20,	%f6
	xorcc	%i4,	0x164F,	%o2
loop_1736:
	call	loop_1737
	fcmpeq16	%f14,	%f16,	%o1
	orn	%l3,	0x1DDA,	%i3
	wr	%g0,	0x11,	%asi
loop_1737:
	movrlz	%i1,	%l0,	%l2
	wr	%g0,	0x0c,	%asi
	fbo	%fcc2,	loop_1738
	edge16n	%l4,	%i6,	%l6
	andn	%l5,	%g3,	%o3
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
loop_1738:
	nop
	set	0x41, %g3
	nop	 ! 	ldsba	[%l7 + %g3] 0x19,	%o4 ASI use replaced by convert2hboot
	srax	%o5,	0x0D,	%g7
	movpos	%icc,	%g6,	%g1
	fnands	%f26,	%f24,	%f26
	umul	%i5,	%o0,	%g4
	movneg	%icc,	%o7,	%o6
	wr	%g0,	0x52,	%asi
	std	%g4,	[%l7 + 0x30]
	array16	%i0,	%i4,	%i7
	orncc	%o2,	0x0E4E,	%l3
	wr	%g0,	0x18,	%asi
	xor	%g2,	0x0291,	%i1
	fmovsa	%xcc,	%f17,	%f28
	movvs	%icc,	%i3,	%l0
	fpadd32s	%f28,	%f19,	%f2
	sdiv	%l2,	0x103D,	%l4
	fmuld8ulx16	%f7,	%f19,	%f2
	movleu	%icc,	%i6,	%l6
	fsrc1s	%f3,	%f16
	movrlez	%l1,	0x07D,	%l5
	srl	%o3,	%o4,	%o5
	fornot1	%f2,	%f18,	%f16
	fpsub32	%f0,	%f12,	%f18
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	fcmpd	%fcc1,	%f8,	%f8
	st	%f1,	[%l7 + 0x20]
	ldsb	[%l7 + 0x75],	%g7
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	fmovdcs	%icc,	%f8,	%f8
	nop 	! 	taddcc	%g3,	%g1,	%g6 changed by convert2hboot
	udiv	%o0,	0x007A,	%i5
	mova	%xcc,	%o7,	%o6
	alignaddr	%g4,	%i2,	%i0
	sub	%i4,	0x1D4D,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g5,	0x020C,	%o2
	fpadd32s	%f15,	%f7,	%f9
	fmovdg	%xcc,	%f21,	%f9
	fone	%f10
	andncc	%l3,	%g2,	%i1
	addc	%i3,	0x04DD,	%l0
	fandnot1	%f12,	%f14,	%f24
	wr	%g0,	0x89,	%asi
	fbg	%fcc3,	loop_1739
	fabss	%f21,	%f22
	orncc	%o1,	0x0D21,	%l2
	sdiv	%l4,	0x0031,	%i6
loop_1739:
	sub	%l1,	%l5,	%o3
	bcc,a	%icc,	loop_1740
	udiv	%l6,	0x1E52,	%o4
	addc	%o5,	%g7,	%g3
	fmovrdlez	%g6,	%f20,	%f10
loop_1740:
	or	%o0,	0x1E85,	%g1
	movg	%xcc,	%o7,	%o6
	edge8l	%g4,	%i5,	%i0
	fmovs	%f8,	%f16
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	fxors	%f16,	%f14,	%f17
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	bne,pn	%icc,	loop_1741
	movre	%i2,	%i7,	%g5
	udivx	%i4,	0x0E53,	%o2
	edge32n	%l3,	%i1,	%i3
loop_1741:
	fmovrsne	%l0,	%f30,	%f3
	edge32ln	%o1,	%g2,	%l2
	fbge	%fcc1,	loop_1742
	fxor	%f20,	%f20,	%f20
	fmovdle	%icc,	%f1,	%f26
	set	0x40, %i4
	nop	 ! 	ldxa	[%l7 + %i4] 0x11,	%l4 ASI use replaced by convert2hboot
loop_1742:
	edge8	%i6,	%l1,	%l5
	fblg	%fcc2,	loop_1743
	movcs	%icc,	%l6,	%o3
	movn	%icc,	%o5,	%g7
	nop 	! 	ta	%xcc,	0x0 changed by convert2hboot
loop_1743:
	movrgz	%g3,	%o4,	%g6
	nop 	! 	tvs	%icc,	0x1 changed by convert2hboot
	array32	%g1,	%o0,	%o7
	fbg,a	%fcc3,	loop_1744
	fmovrdgez	%g4,	%f30,	%f26
	mulx	%i5,	0x0E86,	%i0
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
loop_1744:
	nop
	set	0x68, %i6
	ldsh	[%l7 + %i6],	%o6
	set	0x45, %o5
	nop	 ! 	ldstuba	[%l7 + %o5] 0x89,	%i2 ASI use replaced by convert2hboot
	fbu	%fcc0,	loop_1745
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	bvs,pt	%xcc,	loop_1746
	fcmpne32	%f10,	%f20,	%i7
loop_1745:
	fands	%f20,	%f2,	%f10
	sdivcc	%i4,	0x1AED,	%o2
loop_1746:
	movne	%xcc,	%g5,	%l3
	sllx	%i1,	%l0,	%o1
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	xnor	%g2,	%i3,	%l4
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	fmovdl	%xcc,	%f12,	%f23
	fpackfix	%f14,	%f14
	movrne	%l2,	%i6,	%l1
	ldd	[%l7 + 0x60],	%l4
	sll	%o3,	0x01,	%l6
	movrlez	%g7,	%g3,	%o4
	smul	%o5,	%g6,	%o0
	nop 	! 	tle	%xcc,	0x5 changed by convert2hboot
	umul	%o7,	%g1,	%g4
	sdivcc	%i0,	0x1197,	%o6
	movneg	%icc,	%i5,	%i7
	fmovrdlz	%i2,	%f12,	%f22
	alignaddr	%o2,	%i4,	%l3
	orncc	%i1,	%l0,	%g5
	sll	%o1,	%g2,	%l4
	sub	%i3,	0x0B92,	%i6
	fbu,a	%fcc2,	loop_1747
	fpack32	%f10,	%f8,	%f8
	movg	%xcc,	%l2,	%l5
	srl	%o3,	%l1,	%l6
loop_1747:
	srl	%g3,	0x0E,	%g7
	orncc	%o4,	0x062A,	%g6
	movvc	%icc,	%o0,	%o5
	subccc	%g1,	%g4,	%o7
	fmovdleu	%icc,	%f30,	%f31
	bgu,a,pt	%icc,	loop_1748
	fbug	%fcc0,	loop_1749
	edge8ln	%i0,	%o6,	%i7
	smul	%i2,	0x0964,	%i5
loop_1748:
	fbl	%fcc2,	loop_1750
loop_1749:
	fbne	%fcc0,	loop_1751
	sdivx	%o2,	0x071D,	%i4
	bcc,a,pt	%icc,	loop_1752
loop_1750:
	call	loop_1753
loop_1751:
	nop 	! 	tsubcc	%l3,	0x00FD,	%l0 changed by convert2hboot
	mulx	%g5,	0x10E8,	%o1
loop_1752:
	fmovsge	%icc,	%f29,	%f24
loop_1753:
	movl	%icc,	%g2,	%i1
	movcc	%xcc,	%i3,	%i6
	array8	%l2,	%l5,	%l4
	bleu	%icc,	loop_1754
	fandnot1s	%f18,	%f24,	%f27
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	edge32n	%o3,	%l6,	%l1
loop_1754:
	movre	%g3,	0x2E0,	%o4
	addcc	%g7,	0x1CC4,	%g6
	fsrc2s	%f9,	%f13
	edge8	%o0,	%o5,	%g1
	bge	%icc,	loop_1755
	fnors	%f24,	%f31,	%f6
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	wr	%g0,	0x11,	%asi
loop_1755:
	nop 	! 	sir	0x1158 changed by convert2hboot
	fexpand	%f21,	%f14
	fmul8ulx16	%f6,	%f10,	%f2
	movneg	%xcc,	%o7,	%i0
	popc	%o6,	%i2
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
	wr	%g0,	0x19,	%asi
	udiv	%i7,	0x01F8,	%i4
	andcc	%l3,	%o2,	%l0
	sdivcc	%g5,	0x0928,	%o1
	set	0x33, %o2
	nop	 ! 	ldstuba	[%l7 + %o2] 0x04,	%i1 ASI use replaced by convert2hboot
	fbe,a	%fcc3,	loop_1756
	movgu	%xcc,	%g2,	%i3
	std	%f2,	[%l7 + 0x50]
	orn	%l2,	%l5,	%l4
loop_1756:
	xor	%o3,	%i6,	%l1
	fmovsle	%xcc,	%f16,	%f21
	prefetch	[%l7 + 0x48],	 0x2
	set	0x28, %i2
	nop	 ! 	lduwa	[%l7 + %i2] 0x15,	%l6 ASI use replaced by convert2hboot
	movle	%icc,	%o4,	%g7
	orn	%g6,	%o0,	%o5
	andcc	%g3,	%g4,	%o7
	xor	%i0,	%g1,	%i2
	srl	%i5,	0x00,	%o6
	fbue	%fcc0,	loop_1757
	fmovsle	%icc,	%f25,	%f15
	fmovrde	%i4,	%f10,	%f22
	nop 	! 	ta	%icc,	0x7 changed by convert2hboot
loop_1757:
	be	%icc,	loop_1758
	alignaddrl	%i7,	%l3,	%o2
	fcmpes	%fcc3,	%f20,	%f21
	fmovdleu	%xcc,	%f18,	%f8
loop_1758:
	nop 	! 	taddcc	%g5,	%o1,	%i1 changed by convert2hboot
	fmovsl	%xcc,	%f21,	%f29
	fmovdle	%icc,	%f27,	%f26
	subcc	%g2,	0x0CF6,	%l0
	orcc	%i3,	%l2,	%l5
	fmuld8ulx16	%f13,	%f25,	%f22
	array8	%l4,	%o3,	%l1
	stw	%i6,	[%l7 + 0x18]
	movleu	%xcc,	%o4,	%g7
	movn	%xcc,	%g6,	%o0
	fpack16	%f24,	%f15
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	smul	%l6,	%g3,	%g4
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	andncc	%o7,	%o5,	%i0
	array16	%i2,	%g1,	%o6
	sdivx	%i5,	0x04CF,	%i7
	fbo	%fcc0,	loop_1759
	movg	%xcc,	%l3,	%o2
	subccc	%g5,	%i4,	%i1
	fbne,a	%fcc0,	loop_1760
loop_1759:
	and	%o1,	%g2,	%l0
	wr	%g0,	0x19,	%asi
loop_1760:
	fmovdge	%xcc,	%f26,	%f21
	membar	0x0F
	fcmple16	%f8,	%f24,	%l5
	sra	%l4,	%i3,	%o3
	fbu	%fcc2,	loop_1761
	srl	%l1,	%i6,	%o4
	edge8l	%g7,	%o0,	%l6
	fbo,a	%fcc0,	loop_1762
loop_1761:
	fmovdg	%xcc,	%f22,	%f30
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
	xorcc	%g6,	%g4,	%o7
loop_1762:
	fmovsg	%xcc,	%f29,	%f27
	fcmpgt16	%f0,	%f24,	%o5
	fbule	%fcc3,	loop_1763
	movre	%g3,	0x38C,	%i2
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	std	%g0,	[%l7 + 0x38]
loop_1763:
	array32	%o6,	%i0,	%i7
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	fcmpd	%fcc3,	%f26,	%f6
	movge	%icc,	%l3,	%i5
	bneg,a	%xcc,	loop_1764
	and	%g5,	%o2,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f18,	%f18,	%f6
loop_1764:
	fandnot1s	%f12,	%f19,	%f15
	set	0x10, %i7
	sta	%f23,	[%l7 + %i7] 0x0c
	fmovrdlz	%o1,	%f16,	%f30
	nop
	set	0x6C, %o4
	stw	%g2,	[%l7 + %o4]
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
	fbn,a	%fcc3,	loop_1765
	movneg	%xcc,	%i1,	%l2
	sll	%l0,	0x0C,	%l5
	fmovdgu	%icc,	%f29,	%f21
loop_1765:
	array8	%i3,	%o3,	%l4
	xor	%i6,	%o4,	%g7
	udivx	%o0,	0x1921,	%l6
	edge16	%g6,	%g4,	%l1
	sethi	0x0587,	%o7
	bg,a,pt	%xcc,	loop_1766
	ldsh	[%l7 + 0x2C],	%o5
	edge32l	%g3,	%g1,	%i2
	orcc	%i0,	0x134A,	%i7
loop_1766:
	array8	%o6,	%i5,	%l3
	fcmpgt32	%f4,	%f0,	%g5
	set	0x4E, %i1
	nop	 ! 	stha	%o2,	[%l7 + %i1] 0x19 ASI use replaced by convert2hboot
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
	stb	%o1,	[%l7 + 0x0D]
	udivcc	%i4,	0x18C7,	%g2
	nop 	! 	tneg	%xcc,	0x7 changed by convert2hboot
	fpadd16s	%f26,	%f19,	%f18
	alignaddr	%l2,	%i1,	%l5
	fpsub16s	%f22,	%f18,	%f8
	fmovdne	%xcc,	%f21,	%f1
	fxnors	%f15,	%f23,	%f22
	set	0x08, %i0
	sta	%f22,	[%l7 + %i0] 0x18
	fpmerge	%f9,	%f14,	%f16
	fbu	%fcc2,	loop_1767
	subc	%i3,	0x1A41,	%l0
	fbug	%fcc0,	loop_1768
	movgu	%icc,	%o3,	%l4
loop_1767:
	nop
	setx	loop_1769,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop 	! 	tl	%xcc,	0x7 changed by convert2hboot
loop_1768:
	nop
	set	0x42, %o1
	nop	 ! 	lduha	[%l7 + %o1] 0x88,	%o4 ASI use replaced by convert2hboot
loop_1769:
	movre	%g7,	%i6,	%l6
	movcs	%xcc,	%g6,	%g4
	movcs	%xcc,	%l1,	%o7
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
	mova	%xcc,	%o5,	%g3
	fcmpgt16	%f30,	%f28,	%g1
	set	0x2C, %i5
	nop	 ! 	ldsha	[%l7 + %i5] 0x88,	%o0 ASI use replaced by convert2hboot
	nop 	! 	tneg	%icc,	0x7 changed by convert2hboot
	fsrc2	%f10,	%f0
	movne	%icc,	%i0,	%i2
	fmovrde	%i7,	%f0,	%f8
	smul	%i5,	0x0242,	%l3
	stw	%g5,	[%l7 + 0x34]
	nop 	! 	taddcc	%o6,	%o2,	%i4 changed by convert2hboot
	movrlz	%g2,	%l2,	%i1
	nop 	! 	tcc	%xcc,	0x0 changed by convert2hboot
	movrne	%o1,	%i3,	%l0
	nop 	! 	tsubcc	%o3,	%l4,	%l5 changed by convert2hboot
	fmovrse	%g7,	%f21,	%f25
	fpack32	%f10,	%f16,	%f6
	be,pt	%xcc,	loop_1770
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
	ldub	[%l7 + 0x42],	%o4
	fmovsne	%xcc,	%f7,	%f7
loop_1770:
	nop 	! 	tneg	%icc,	0x5 changed by convert2hboot
	edge32l	%i6,	%g6,	%g4
	fmovdle	%icc,	%f29,	%f25
	fpadd32s	%f3,	%f21,	%f12
	fbule	%fcc1,	loop_1771
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
	fmul8x16au	%f5,	%f25,	%f10
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
loop_1771:
	fabss	%f15,	%f11
	nop 	! 	tgu	%xcc,	0x5 changed by convert2hboot
	nop 	! 	ta	%xcc,	0x5 changed by convert2hboot
	mulscc	%l1,	0x00C2,	%l6
	alignaddrl	%o7,	%g3,	%o5
	fornot1s	%f29,	%f17,	%f7
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	edge16n	%o0,	%g1,	%i2
	movrne	%i0,	0x219,	%i5
	fmul8x16al	%f30,	%f25,	%f24
	fnand	%f8,	%f30,	%f8
	movne	%icc,	%i7,	%g5
	fmuld8ulx16	%f9,	%f4,	%f26
	fbuge	%fcc1,	loop_1772
	fmovdcs	%xcc,	%f6,	%f3
	srax	%o6,	0x0D,	%l3
	bvs,pn	%xcc,	loop_1773
loop_1772:
	movvs	%xcc,	%o2,	%i4
	nop 	! 	taddcctv	%l2,	%i1,	%g2 changed by convert2hboot
	srax	%i3,	%o1,	%l0
loop_1773:
	xor	%o3,	%l5,	%g7
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	edge8	%l4,	%o4,	%i6
	nop 	! 	tle	%xcc,	0x2 changed by convert2hboot
	fmovdcs	%xcc,	%f11,	%f5
	ldsh	[%l7 + 0x5A],	%g4
	fble,a	%fcc2,	loop_1774
	orncc	%g6,	0x13F2,	%l6
	movne	%xcc,	%o7,	%g3
	ldstub	[%l7 + 0x2A],	%l1
loop_1774:
	edge16	%o5,	%o0,	%g1
	movn	%icc,	%i2,	%i0
	wr	%g0,	0x19,	%asi
	fmovsle	%icc,	%f11,	%f10
	set	0x1C, %l0
	nop	 ! 	lduwa	[%l7 + %l0] 0x18,	%i7 ASI use replaced by convert2hboot
	brnz	%g5,	loop_1775
	orcc	%l3,	0x04FC,	%o6
	movl	%icc,	%i4,	%o2
	udivcc	%i1,	0x03DE,	%l2
loop_1775:
	fmovdgu	%xcc,	%f4,	%f15
	nop 	! 	tcs	%icc,	0x7 changed by convert2hboot
	edge32	%i3,	%o1,	%l0
	fmovsg	%icc,	%f10,	%f13
	nop 	! 	taddcc	%g2,	0x0CAD,	%o3 changed by convert2hboot
	edge32	%l5,	%g7,	%l4
	nop 	! 	tgu	%xcc,	0x4 changed by convert2hboot
	fcmpne32	%f24,	%f26,	%i6
	wr	%g0,	0x80,	%asi
	subcc	%g4,	0x0D1E,	%l6
	ble,a,pt	%xcc,	loop_1776
	fpadd32s	%f2,	%f17,	%f19
	fmovdne	%icc,	%f8,	%f1
	xnor	%g6,	0x16C2,	%g3
loop_1776:
	array16	%l1,	%o5,	%o7
	bpos	%icc,	loop_1777
	srax	%o0,	%g1,	%i0
	stw	%i5,	[%l7 + 0x24]
	fmovs	%f12,	%f3
loop_1777:
	nop 	! 	te	%xcc,	0x4 changed by convert2hboot
	movge	%xcc,	%i7,	%i2
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	sta	%f16,	[%l7 + 0x38] %asi
	set	0x56, %o6
	nop	 ! 	stha	%g5,	[%l7 + %o6] 0x11 ASI use replaced by convert2hboot
	ba,pn	%xcc,	loop_1778
	sllx	%l3,	0x06,	%i4
	wr	%g0,	0x11,	%asi
loop_1778:
	fcmpgt32	%f0,	%f2,	%o6
	fexpand	%f6,	%f20
	fpadd32s	%f31,	%f30,	%f9
	array16	%i1,	%l2,	%i3
	sth	%o1,	[%l7 + 0x22]
	wr	%g0,	0x11,	%asi
	brnz	%o3,	loop_1779
	ldub	[%l7 + 0x1C],	%l0
	movvs	%icc,	%g7,	%l5
	subc	%l4,	%o4,	%i6
loop_1779:
	nop 	! 	tgu	%xcc,	0x5 changed by convert2hboot
	brlez	%g4,	loop_1780
	alignaddrl	%l6,	%g3,	%l1
	fxnors	%f8,	%f25,	%f31
	fblg	%fcc0,	loop_1781
loop_1780:
	umulcc	%g6,	%o7,	%o0
	std	%f24,	[%l7 + 0x08]
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
loop_1781:
	edge8ln	%g1,	%i0,	%i5
	swap	[%l7 + 0x28],	%i7
	fzeros	%f18
	udivx	%i2,	0x1A8D,	%g5
	mulx	%l3,	%o5,	%o2
	fornot1s	%f21,	%f30,	%f7
	subcc	%i4,	%o6,	%i1
	edge8	%i3,	%l2,	%g2
	fbul	%fcc2,	loop_1782
	nop
	setx	loop_1783,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	movle	%icc,	%o1,	%l0
	fsrc2s	%f0,	%f10
loop_1782:
	addccc	%g7,	0x1BCA,	%o3
loop_1783:
	fmovsleu	%xcc,	%f8,	%f1
	subccc	%l4,	0x0C2F,	%o4
	array8	%i6,	%l5,	%l6
	xor	%g4,	0x0FB9,	%g3
	andcc	%l1,	%g6,	%o7
	nop 	! 	sir	0x1DC6 changed by convert2hboot
	wr	%g0,	0x11,	%asi
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	fmovrse	%g1,	%f7,	%f19
	fbue	%fcc1,	loop_1784
	nop 	! 	tl	%icc,	0x5 changed by convert2hboot
	set	0x70, %o7
	nop	 ! 	stda	%i0,	[%l7 + %o7] 0x19 ASI use replaced by convert2hboot
loop_1784:
	fsrc2	%f8,	%f30
	edge16l	%i5,	%i7,	%i2
	movl	%icc,	%l3,	%o5
	orn	%o2,	%g5,	%i4
	umulcc	%o6,	%i1,	%l2
	bleu,a	loop_1785
	alignaddr	%g2,	%o1,	%i3
	lduh	[%l7 + 0x54],	%g7
	fpack32	%f24,	%f2,	%f6
loop_1785:
	movle	%xcc,	%l0,	%l4
	fbo,a	%fcc2,	loop_1786
	nop 	! 	tcs	%icc,	0x4 changed by convert2hboot
	array8	%o4,	%o3,	%i6
	movrne	%l6,	0x3F2,	%l5
loop_1786:
	movrne	%g4,	0x3E1,	%g3
	bl,a	%xcc,	loop_1787
	fba,a	%fcc3,	loop_1788
	orcc	%g6,	%l1,	%o0
	edge32	%o7,	%g1,	%i0
loop_1787:
	nop
	set	0x20, %o3
	nop	 ! 	swapa	[%l7 + %o3] 0x89,	%i5 ASI use replaced by convert2hboot
loop_1788:
	fzero	%f12
	movrlz	%i7,	%l3,	%o5
	set	0x78, %l4
	nop	 ! 	stda	%o2,	[%l7 + %l4] 0x2f ASI use replaced by convert2hboot
	membar	#Sync
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	nop 	! 	taddcc	%g5,	0x154A,	%i2 changed by convert2hboot
	move	%icc,	%o6,	%i4
	edge8	%l2,	%g2,	%o1
	mulx	%i1,	%g7,	%i3
	fbn	%fcc2,	loop_1789
	faligndata	%f2,	%f30,	%f8
	lduw	[%l7 + 0x20],	%l4
	srax	%l0,	0x1C,	%o3
loop_1789:
	ldx	[%l7 + 0x20],	%o4
	umul	%i6,	%l6,	%g4
	umulcc	%g3,	0x1CC9,	%l5
	fmovdcs	%xcc,	%f12,	%f6
	bvc,pt	%icc,	loop_1790
	fbule,a	%fcc2,	loop_1791
	prefetch	[%l7 + 0x08],	 0x3
	fcmpes	%fcc0,	%f14,	%f30
loop_1790:
	alignaddrl	%g6,	%o0,	%l1
loop_1791:
	movle	%xcc,	%o7,	%i0
	srl	%i5,	%i7,	%l3
	fmovsne	%icc,	%f1,	%f8
	fnot2s	%f30,	%f18
	brz	%o5,	loop_1792
	movpos	%xcc,	%o2,	%g5
	movn	%icc,	%g1,	%i2
	mulscc	%i4,	0x11E0,	%l2
loop_1792:
	nop 	! 	tsubcctv	%o6,	%g2,	%o1 changed by convert2hboot
	movcc	%xcc,	%i1,	%i3
	fnand	%f12,	%f14,	%f20
	umul	%l4,	0x129C,	%g7
	sdivx	%o3,	0x1223,	%o4
	nop 	! 	sir	0x1465 changed by convert2hboot
	fone	%f0
	smulcc	%i6,	%l6,	%l0
	udiv	%g4,	0x029A,	%l5
	set	0x63, %l3
	nop	 ! 	ldstuba	[%l7 + %l3] 0x04,	%g3 ASI use replaced by convert2hboot
	stw	%g6,	[%l7 + 0x18]
	membar	0x01
	array8	%l1,	%o0,	%o7
	std	%i0,	[%l7 + 0x58]
	movle	%icc,	%i5,	%i7
	edge32	%o5,	%o2,	%l3
	movneg	%icc,	%g5,	%g1
	sra	%i2,	%l2,	%o6
	array8	%g2,	%o1,	%i4
	movcc	%icc,	%i1,	%i3
	umul	%l4,	%g7,	%o4
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	nop 	! 	taddcc	%o3,	%l6,	%l0 changed by convert2hboot
	siam	0x4
	andcc	%g4,	%i6,	%g3
	movl	%icc,	%g6,	%l1
	edge32n	%l5,	%o7,	%i0
	fmuld8ulx16	%f8,	%f28,	%f24
	umulcc	%o0,	%i5,	%o5
	movne	%icc,	%i7,	%l3
	fsrc2	%f16,	%f22
	set	0x16, %g7
	nop	 ! 	ldsha	[%l7 + %g7] 0x19,	%g5 ASI use replaced by convert2hboot
	wr	%g0,	0x81,	%asi
	fcmpeq16	%f16,	%f10,	%i2
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	fmuld8ulx16	%f26,	%f27,	%f30
	smulcc	%o2,	%o6,	%l2
	fblg,a	%fcc0,	loop_1793
	subcc	%o1,	0x08D5,	%i4
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
	fmovsg	%xcc,	%f18,	%f31
loop_1793:
	sub	%g2,	%i3,	%i1
	bgu,a	loop_1794
	orcc	%l4,	%o4,	%g7
	umul	%o3,	%l6,	%g4
	movg	%icc,	%l0,	%i6
loop_1794:
	fmovrsgez	%g6,	%f15,	%f1
	add	%g3,	0x0F38,	%l5
	orn	%l1,	0x0EFF,	%i0
	fpsub32	%f8,	%f6,	%f8
	nop
	set	0x74, %i3
	sth	%o0,	[%l7 + %i3]
	fmovdne	%icc,	%f18,	%f10
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	ldstub	[%l7 + 0x6B],	%o7
	fbl,a	%fcc1,	loop_1795
	array32	%o5,	%i7,	%i5
	orcc	%g5,	0x1944,	%l3
	popc	0x0A74,	%i2
loop_1795:
	brgz	%g1,	loop_1796
	fmovse	%xcc,	%f20,	%f20
	bne,pt	%xcc,	loop_1797
	bge,pn	%icc,	loop_1798
loop_1796:
	movgu	%icc,	%o2,	%o6
	nop 	! 	tsubcc	%l2,	%o1,	%g2 changed by convert2hboot
loop_1797:
	nop 	! 	taddcc	%i3,	0x1577,	%i1 changed by convert2hboot
loop_1798:
	fnand	%f12,	%f8,	%f2
	ldd	[%l7 + 0x40],	%f24
	umulcc	%i4,	0x1299,	%o4
	sethi	0x166B,	%g7
	alignaddrl	%o3,	%l4,	%g4
	subcc	%l0,	0x0AC2,	%l6
	fornot1s	%f19,	%f19,	%f25
	movre	%i6,	%g6,	%l5
	udivx	%l1,	0x09B8,	%g3
	move	%icc,	%o0,	%i0
	nop 	! 	ta	%xcc,	0x7 changed by convert2hboot
	edge16	%o5,	%o7,	%i7
	andncc	%g5,	%l3,	%i5
	set	0x50, %l6
	nop	 ! 	ldda	[%l7 + %l6] 0x15,	%i2 ASI use replaced by convert2hboot
	andn	%o2,	0x0AC0,	%o6
	movneg	%icc,	%l2,	%g1
	andn	%o1,	%g2,	%i1
	subccc	%i3,	0x0B6F,	%i4
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	stb	%g7,	[%l7 + 0x12]
	edge8ln	%o4,	%o3,	%l4
	andncc	%g4,	%l6,	%i6
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
	movne	%icc,	%l0,	%g6
	fbule	%fcc0,	loop_1799
	bgu,a	%xcc,	loop_1800
	andn	%l5,	%l1,	%o0
	fmovsvs	%xcc,	%f7,	%f3
loop_1799:
	movneg	%icc,	%i0,	%g3
loop_1800:
	ldsb	[%l7 + 0x74],	%o5
	orn	%o7,	%i7,	%l3
	fmovdvs	%icc,	%f15,	%f13
	fabss	%f23,	%f16
	nop 	! 	tg	%xcc,	0x5 changed by convert2hboot
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
	addcc	%i5,	0x0BB4,	%g5
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%f2
	movpos	%xcc,	%o2,	%i2
	movne	%xcc,	%l2,	%g1
	nop 	! 	ta	%xcc,	0x4 changed by convert2hboot
	movcc	%icc,	%o1,	%g2
	movl	%xcc,	%o6,	%i1
	wr	%g0,	0x10,	%asi
	nop
	setx	loop_1801,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	orn	%g7,	0x14B3,	%i3
	fornot1	%f4,	%f18,	%f10
	movrlz	%o3,	0x1AD,	%o4
loop_1801:
	fmovsa	%xcc,	%f19,	%f30
	edge16l	%g4,	%l6,	%l4
	bn,a	loop_1802
	fbge,a	%fcc0,	loop_1803
	movn	%icc,	%i6,	%g6
	movleu	%icc,	%l0,	%l1
loop_1802:
	fmovdg	%icc,	%f28,	%f18
loop_1803:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	nop	 ! 	casxa	[%l6] 0x18,	%o0,	%i0 ASI use replaced by convert2hboot
	ldsw	[%l7 + 0x70],	%l5
	movleu	%icc,	%g3,	%o7
	orncc	%o5,	%l3,	%i5
	bg,a	loop_1804
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
	fcmpd	%fcc3,	%f14,	%f2
	ldub	[%l7 + 0x12],	%i7
loop_1804:
	nop 	! 	tsubcc	%o2,	%i2,	%g5 changed by convert2hboot
	fcmpne16	%f16,	%f26,	%l2
	fmuld8ulx16	%f31,	%f9,	%f0
	fpsub32	%f2,	%f30,	%f22
	fbule,a	%fcc1,	loop_1805
	fornot1s	%f11,	%f9,	%f3
	srlx	%g1,	0x0C,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1805:
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	bneg	loop_1806
	edge8l	%o6,	%i1,	%i4
	udivx	%g7,	0x0194,	%g2
	bn	loop_1807
loop_1806:
	fmovrdgz	%o3,	%f12,	%f20
	edge32n	%i3,	%o4,	%g4
	ble	loop_1808
loop_1807:
	fmovscs	%xcc,	%f19,	%f27
	bge,a	loop_1809
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
loop_1808:
	fmovsg	%icc,	%f14,	%f7
	fmovrslez	%l6,	%f3,	%f6
loop_1809:
	brlz,a	%i6,	loop_1810
	array8	%l4,	%l0,	%l1
	move	%xcc,	%o0,	%i0
	bgu,a,pn	%xcc,	loop_1811
loop_1810:
	subcc	%l5,	%g3,	%o7
	andncc	%g6,	%o5,	%l3
	move	%icc,	%i5,	%o2
loop_1811:
	srl	%i7,	%i2,	%g5
	fand	%f8,	%f12,	%f10
	srl	%l2,	0x06,	%o1
	smul	%g1,	0x162D,	%i1
	sub	%i4,	0x1016,	%g7
	sra	%g2,	%o6,	%o3
	edge8n	%o4,	%g4,	%i3
	xnorcc	%l6,	%l4,	%i6
	or	%l1,	%l0,	%i0
	fmovsn	%xcc,	%f13,	%f29
	fpadd32s	%f20,	%f6,	%f25
	add	%o0,	0x0A06,	%l5
	fble	%fcc3,	loop_1812
	movneg	%icc,	%g3,	%g6
	fpackfix	%f22,	%f26
	ba,a,pn	%icc,	loop_1813
loop_1812:
	array16	%o7,	%o5,	%i5
	fmul8sux16	%f6,	%f18,	%f22
	set	0x22, %l2
	nop	 ! 	lduha	[%l7 + %l2] 0x15,	%l3 ASI use replaced by convert2hboot
loop_1813:
	umul	%i7,	%i2,	%o2
	wr	%g0,	0x81,	%asi
	movrlz	%g5,	0x12C,	%o1
	fbne,a	%fcc0,	loop_1814
	lduw	[%l7 + 0x58],	%i1
	xnorcc	%g1,	%i4,	%g2
	fbug,a	%fcc1,	loop_1815
loop_1814:
	umul	%o6,	%o3,	%o4
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
	orn	%g4,	0x0153,	%i3
loop_1815:
	edge32	%g7,	%l6,	%i6
	sdiv	%l4,	0x1544,	%l0
	prefetch	[%l7 + 0x68],	 0x3
	prefetch	[%l7 + 0x1C],	 0x1
	membar	#Sync
	set	0x40, %g1
	nop	 ! 	ldda	[%l7 + %g1] 0xf1,	%f0 ASI use replaced by convert2hboot
	subccc	%i0,	0x0E72,	%l1
	fbl,a	%fcc3,	loop_1816
	movl	%icc,	%l5,	%g3
	fmovda	%icc,	%f27,	%f15
	nop 	! 	tsubcctv	%g6,	%o0,	%o7 changed by convert2hboot
loop_1816:
	nop
	set	0x46, %g4
	nop	 ! 	ldstuba	[%l7 + %g4] 0x10,	%i5 ASI use replaced by convert2hboot
	movne	%xcc,	%o5,	%l3
	movrne	%i2,	0x057,	%o2
	array32	%i7,	%g5,	%l2
	fblg,a	%fcc0,	loop_1817
	brgez	%i1,	loop_1818
	edge8n	%o1,	%g1,	%i4
	nop 	! 	tneg	%icc,	0x0 changed by convert2hboot
loop_1817:
	nop
	add	%l7,	0x54,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g2
	nop	 ! 	casa	[%l6] 0x11,	%g2,	%o3 ASI use replaced by convert2hboot
loop_1818:
	bcs	%icc,	loop_1819
	ld	[%l7 + 0x2C],	%f17
	movcc	%icc,	%o6,	%g4
	fpack16	%f10,	%f17
loop_1819:
	fbu,a	%fcc2,	loop_1820
	sdiv	%i3,	0x0EA6,	%o4
	bvc,a,pn	%xcc,	loop_1821
	ba	%xcc,	loop_1822
loop_1820:
	array8	%l6,	%g7,	%i6
	ldd	[%l7 + 0x20],	%l0
loop_1821:
	umulcc	%i0,	%l4,	%l1
loop_1822:
	stb	%g3,	[%l7 + 0x64]
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	ble,a,pt	%icc,	loop_1823
	movvs	%icc,	%g6,	%l5
	swap	[%l7 + 0x68],	%o0
	brlez	%o7,	loop_1824
loop_1823:
	fmovrde	%o5,	%f24,	%f26
	fbe,a	%fcc0,	loop_1825
	bvs,a	%icc,	loop_1826
loop_1824:
	fmovdne	%icc,	%f21,	%f21
	movl	%icc,	%l3,	%i2
loop_1825:
	edge8	%i5,	%o2,	%i7
loop_1826:
	membar	0x5D
	fpsub16	%f8,	%f22,	%f20
	fmovsneg	%xcc,	%f19,	%f3
	swap	[%l7 + 0x10],	%g5
	mova	%icc,	%l2,	%i1
	movle	%xcc,	%g1,	%i4
	andncc	%g2,	%o3,	%o6
	fcmpd	%fcc1,	%f12,	%f6
	set	0x2E, %g5
	nop	 ! 	ldsba	[%l7 + %g5] 0x19,	%o1 ASI use replaced by convert2hboot
	wr	%g0,	0x89,	%asi
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	movre	%o4,	0x06E,	%g7
	stx	%i6,	[%l7 + 0x70]
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	bneg,pn	%icc,	loop_1827
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
	fmovdl	%icc,	%f17,	%f11
	fbn,a	%fcc2,	loop_1828
loop_1827:
	bcs,pt	%icc,	loop_1829
	fnot2s	%f0,	%f8
	nop 	! 	tsubcctv	%i0,	%l0,	%l4 changed by convert2hboot
loop_1828:
	movne	%icc,	%l1,	%g6
loop_1829:
	bcc,a,pn	%icc,	loop_1830
	fpsub32	%f30,	%f18,	%f10
	fmovsne	%xcc,	%f23,	%f11
	fbule	%fcc0,	loop_1831
loop_1830:
	addc	%l5,	0x1028,	%o0
	popc	0x0DB9,	%o7
	fcmpeq32	%f30,	%f28,	%g3
loop_1831:
	fmovs	%f19,	%f10
	std	%o4,	[%l7 + 0x10]
	nop
	setx	loop_1832,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	brlz	%l3,	loop_1833
	movg	%xcc,	%i2,	%i5
	nop
	setx loop_1834, %l0, %l1
	jmpl %l1, %o2
loop_1832:
	sethi	0x069F,	%i7
loop_1833:
	edge16n	%l2,	%g5,	%g1
	sllx	%i4,	0x12,	%g2
loop_1834:
	movrgez	%o3,	0x0AE,	%o6
	fbul,a	%fcc3,	loop_1835
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	nop
	set	0x49, %g6
	stb	%i1,	[%l7 + %g6]
	orcc	%i3,	0x11C4,	%o1
loop_1835:
	sll	%l6,	0x05,	%g4
	nop 	! 	tvc	%icc,	0x0 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	movcs	%xcc,	%g7,	%i0
	nop 	! 	tcs	%icc,	0x4 changed by convert2hboot
	edge16ln	%l0,	%l4,	%l1
	fbug	%fcc2,	loop_1836
	bgu,a,pt	%icc,	loop_1837
	bn,pn	%icc,	loop_1838
	movge	%icc,	%g6,	%l5
loop_1836:
	smul	%o0,	%i6,	%o7
loop_1837:
	nop
	setx	loop_1839,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_1838:
	sth	%g3,	[%l7 + 0x76]
	smulcc	%l3,	0x01FD,	%o5
	edge32l	%i2,	%i5,	%o2
loop_1839:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	movcc	%icc,	%g1,	%i4
	alignaddrl	%g2,	%l2,	%o3
	set	0x73, %o0
	nop	 ! 	ldsba	[%l7 + %o0] 0x89,	%o6 ASI use replaced by convert2hboot
	nop 	! 	ta	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	sllx	%i3,	%i1,	%o1
	nop 	! 	tsubcctv	%g4,	0x1934,	%l6 changed by convert2hboot
	movn	%xcc,	%g7,	%i0
	movle	%icc,	%o4,	%l4
	stb	%l0,	[%l7 + 0x61]
	movle	%xcc,	%g6,	%l1
	bvs	loop_1840
	fbue,a	%fcc3,	loop_1841
	xor	%o0,	%l5,	%o7
	fpsub32s	%f12,	%f16,	%f14
loop_1840:
	movle	%icc,	%g3,	%i6
loop_1841:
	bne,pn	%xcc,	loop_1842
	fblg	%fcc0,	loop_1843
	movrlz	%o5,	%l3,	%i2
	movn	%xcc,	%o2,	%i7
loop_1842:
	fmovsvs	%icc,	%f5,	%f31
loop_1843:
	bvs,a,pn	%xcc,	loop_1844
	brnz,a	%i5,	loop_1845
	fmul8ulx16	%f30,	%f2,	%f4
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
loop_1844:
	movneg	%icc,	%g1,	%g5
loop_1845:
	and	%g2,	%i4,	%o3
	udiv	%o6,	0x1EDC,	%l2
	fmovdcc	%xcc,	%f12,	%f6
	fcmpne32	%f10,	%f30,	%i1
	ld	[%l7 + 0x20],	%f13
	bvs,pt	%xcc,	loop_1846
	mulx	%o1,	0x1912,	%i3
	andncc	%g4,	%g7,	%i0
	set	0x5C, %g2
	nop	 ! 	stha	%o4,	[%l7 + %g2] 0xe2 ASI use replaced by convert2hboot
	membar	#Sync
loop_1846:
	sub	%l4,	0x0EB4,	%l6
	movleu	%xcc,	%l0,	%g6
	fmovscc	%xcc,	%f30,	%f5
	xnor	%l1,	0x1CD3,	%o0
	movle	%icc,	%o7,	%g3
	fxnors	%f13,	%f8,	%f15
	subccc	%i6,	0x0FE5,	%o5
	lduw	[%l7 + 0x3C],	%l3
	fmovsvs	%xcc,	%f10,	%f2
	fpadd16	%f4,	%f28,	%f2
	xorcc	%i2,	0x08A2,	%o2
	fmovsl	%xcc,	%f13,	%f14
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
	nop
	setx loop_1847, %l0, %l1
	jmpl %l1, %l5
	fmovsvs	%xcc,	%f29,	%f30
	fbo	%fcc1,	loop_1848
	subc	%i5,	%i7,	%g5
loop_1847:
	nop
	wr	%g0,	0x89,	%asi
loop_1848:
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
	fmul8x16au	%f25,	%f21,	%f14
	edge8ln	%g2,	%i4,	%o3
	movrlez	%o6,	0x0DE,	%l2
	movpos	%xcc,	%o1,	%i3
	siam	0x4
	movvs	%icc,	%i1,	%g7
	mulx	%g4,	0x08ED,	%o4
	sdivcc	%l4,	0x07B2,	%i0
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	add	%l6,	%g6,	%l0
	sdivx	%l1,	0x1F7F,	%o7
	fcmpgt32	%f2,	%f2,	%o0
	nop
	setx	loop_1849,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	orncc	%g3,	0x146F,	%o5
	st	%f30,	[%l7 + 0x2C]
	array32	%i6,	%i2,	%l3
loop_1849:
	brlz,a	%o2,	loop_1850
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
	fnors	%f14,	%f28,	%f6
loop_1850:
	fmovd	%f18,	%f18
	set	0x52, %l5
	nop	 ! 	lduba	[%l7 + %l5] 0x15,	%i5 ASI use replaced by convert2hboot
	fpsub32s	%f9,	%f26,	%f2
	movgu	%xcc,	%l5,	%i7
	wr	%g0,	0x89,	%asi
	array32	%g2,	%g5,	%i4
	movcs	%icc,	%o6,	%l2
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
	addccc	%o3,	%i3,	%i1
	addccc	%o1,	%g7,	%g4
	movre	%l4,	%i0,	%l6
	bl,pn	%icc,	loop_1851
	movl	%xcc,	%g6,	%o4
	fsrc2	%f20,	%f22
	subc	%l0,	%o7,	%l1
loop_1851:
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
	udivx	%o0,	0x18C7,	%o5
	andncc	%i6,	%g3,	%i2
	sethi	0x0A0E,	%l3
	sdivcc	%o2,	0x1D46,	%l5
	nop 	! 	tle	%icc,	0x4 changed by convert2hboot
	call	loop_1852
	flush	%l7 + 0x34
	nop 	! 	taddcctv	%i5,	%i7,	%g1 changed by convert2hboot
	edge32ln	%g2,	%g5,	%o6
loop_1852:
	fbe	%fcc2,	loop_1853
	smulcc	%l2,	%o3,	%i4
	movrlz	%i3,	0x090,	%i1
	movcs	%icc,	%g7,	%g4
loop_1853:
	nop
	set	0x38, %g3
	sta	%f12,	[%l7 + %g3] 0x80
	andncc	%o1,	%i0,	%l4
	udiv	%g6,	0x1926,	%l6
	fmovdn	%xcc,	%f6,	%f9
	andn	%l0,	0x1B3E,	%o7
	set	0x78, %i6
	nop	 ! 	stda	%o4,	[%l7 + %i6] 0x2a ASI use replaced by convert2hboot
	membar	#Sync
	popc	%l1,	%o0
	edge16ln	%i6,	%g3,	%i2
	swap	[%l7 + 0x08],	%o5
	set	0x40, %i4
	nop	 ! 	stda	%f0,	[%l7 + %i4] 0x1f ASI use replaced by convert2hboot
	membar	#Sync
	subcc	%l3,	%o2,	%i5
	movle	%xcc,	%i7,	%g1
	nop
	setx loop_1854, %l0, %l1
	jmpl %l1, %l5
	andn	%g5,	%o6,	%g2
	smul	%o3,	%l2,	%i3
	nop 	! 	tn	%xcc,	0x5 changed by convert2hboot
loop_1854:
	fbn,a	%fcc0,	loop_1855
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	set	0x40, %o2
	nop	 ! 	stda	%f0,	[%l7 + %o2] 0xf9 ASI use replaced by convert2hboot
	membar	#Sync
loop_1855:
	fbg,a	%fcc0,	loop_1856
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	call	loop_1857
loop_1856:
	sdivcc	%i1,	0x1C14,	%i4
	andn	%g7,	0x1337,	%o1
	smul	%i0,	%l4,	%g4
loop_1857:
	nop 	! 	taddcc	%l6,	%g6,	%o7 changed by convert2hboot
	fpadd16s	%f29,	%f7,	%f13
	fmovrdgez	%o4,	%f2,	%f6
	ldsb	[%l7 + 0x55],	%l0
	edge16l	%o0,	%i6,	%g3
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	fbl,a	%fcc1,	loop_1858
	nop 	! 	tl	%xcc,	0x4 changed by convert2hboot
	bneg,a	loop_1859
	fmovsneg	%xcc,	%f21,	%f15
loop_1858:
	fbo,a	%fcc2,	loop_1860
	nop 	! 	tcs	%icc,	0x4 changed by convert2hboot
loop_1859:
	nop 	! 	tle	%xcc,	0x0 changed by convert2hboot
	movcs	%icc,	%l1,	%o5
loop_1860:
	andn	%l3,	0x008C,	%o2
	and	%i2,	%i5,	%i7
	edge8ln	%l5,	%g1,	%o6
	bshuffle	%f30,	%f10,	%f0
	nop 	! 	taddcc	%g5,	%o3,	%l2 changed by convert2hboot
	fmovsne	%xcc,	%f8,	%f12
	fandnot1s	%f29,	%f29,	%f18
	umulcc	%g2,	%i3,	%i1
	edge16ln	%i4,	%g7,	%i0
	andn	%o1,	%l4,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x30],	%i6
	movn	%xcc,	%o7,	%g6
	brlez	%l0,	loop_1861
	sdivcc	%o4,	0x1C36,	%o0
	edge8	%g3,	%i6,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1861:
	movvs	%xcc,	%l3,	%o2
	movge	%xcc,	%o5,	%i5
	movneg	%icc,	%i2,	%l5
	fmovsgu	%icc,	%f1,	%f16
	nop 	! 	tsubcc	%g1,	%i7,	%g5 changed by convert2hboot
	array16	%o3,	%o6,	%l2
	smulcc	%i3,	%g2,	%i4
	bne,a	%xcc,	loop_1862
	add	%i1,	0x092F,	%g7
	wr	%g0,	0x22,	%asi
	membar	#Sync
loop_1862:
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
	fmovrsgz	%i0,	%f3,	%f20
	ba,a,pn	%xcc,	loop_1863
	edge32n	%l4,	%g4,	%o7
	movre	%g6,	%l6,	%o4
	fzeros	%f12
loop_1863:
	edge16n	%l0,	%g3,	%i6
	fbe	%fcc1,	loop_1864
	nop 	! 	ta	%xcc,	0x5 changed by convert2hboot
	nop 	! 	tsubcctv	%l1,	0x1ACB,	%o0 changed by convert2hboot
	movrgez	%o2,	%l3,	%o5
loop_1864:
	fmovrslez	%i2,	%f6,	%f27
	nop 	! 	sir	0x1FEF changed by convert2hboot
	alignaddr	%l5,	%i5,	%i7
	subc	%g1,	%o3,	%g5
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	ldub	[%l7 + 0x0C],	%l2
	movpos	%icc,	%o6,	%i3
	umulcc	%i4,	%i1,	%g2
	movneg	%xcc,	%g7,	%o1
	set	0x20, %o5
	nop	 ! 	stha	%l4,	[%l7 + %o5] 0x10 ASI use replaced by convert2hboot
	or	%g4,	%o7,	%g6
	nop 	! 	tcc	%icc,	0x1 changed by convert2hboot
	wr	%g0,	0x10,	%asi
	ble,a,pt	%icc,	loop_1865
	st	%f21,	[%l7 + 0x40]
	ldd	[%l7 + 0x08],	%f4
	membar	0x7C
loop_1865:
	fmovsn	%icc,	%f14,	%f21
	edge32ln	%l6,	%o4,	%l0
	srlx	%g3,	0x02,	%i6
	membar	0x40
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	movle	%icc,	%l1,	%o2
	sdivcc	%l3,	0x0AFF,	%o0
	stw	%o5,	[%l7 + 0x58]
	fzeros	%f26
	bcc,pn	%xcc,	loop_1866
	nop 	! 	tvc	%xcc,	0x2 changed by convert2hboot
	movcc	%xcc,	%i2,	%i5
	fpack16	%f22,	%f17
loop_1866:
	fandnot2	%f12,	%f12,	%f12
	fbug,a	%fcc2,	loop_1867
	lduw	[%l7 + 0x28],	%l5
	movn	%xcc,	%g1,	%i7
	movrne	%o3,	%l2,	%o6
loop_1867:
	edge16ln	%i3,	%g5,	%i4
	subc	%g2,	%i1,	%o1
	popc	0x0540,	%l4
	bn,a,pn	%icc,	loop_1868
	fbg	%fcc2,	loop_1869
	mulx	%g4,	0x1E02,	%g7
	nop
	setx	loop_1870,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_1868:
	fornot1s	%f4,	%f9,	%f22
loop_1869:
	std	%g6,	[%l7 + 0x78]
	bpos	loop_1871
loop_1870:
	fmovsa	%icc,	%f21,	%f4
	nop 	! 	tsubcctv	%o7,	%i0,	%o4 changed by convert2hboot
	fmovsl	%xcc,	%f20,	%f15
loop_1871:
	std	%f30,	[%l7 + 0x08]
	nop 	! 	tcc	%xcc,	0x2 changed by convert2hboot
	smulcc	%l0,	0x0E5D,	%l6
	fmovrdlez	%i6,	%f6,	%f24
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	fmovdcs	%icc,	%f3,	%f25
	fblg	%fcc1,	loop_1872
	fone	%f4
	andn	%g3,	0x17F0,	%o2
	fbg,a	%fcc2,	loop_1873
loop_1872:
	brlz	%l1,	loop_1874
	movle	%icc,	%l3,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1873:
	nop
	wr	%g0,	0x19,	%asi
loop_1874:
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	bn,a	loop_1875
	sll	%i5,	%i2,	%l5
	sethi	0x11D0,	%i7
	srax	%o3,	%g1,	%l2
loop_1875:
	fnands	%f20,	%f16,	%f23
	fmovdn	%icc,	%f9,	%f30
	prefetch	[%l7 + 0x08],	 0x3
	movleu	%icc,	%i3,	%o6
	fzero	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i4,	%g2,	%g5
	be,a	%icc,	loop_1876
	add	%o1,	0x1741,	%i1
	alignaddr	%l4,	%g7,	%g4
	bg	%xcc,	loop_1877
loop_1876:
	edge8l	%o7,	%i0,	%o4
	andcc	%g6,	0x16D6,	%l0
	ldsw	[%l7 + 0x2C],	%l6
loop_1877:
	fble	%fcc1,	loop_1878
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g3,	0x14,	%o2
	srax	%l1,	0x12,	%l3
loop_1878:
	move	%xcc,	%i6,	%o5
	membar	0x00
	sllx	%i5,	%o0,	%l5
	and	%i7,	%o3,	%i2
	fmovsg	%icc,	%f13,	%f10
	set	0x68, %i2
	lda	[%l7 + %i2] 0x0c,	%f14
	edge16	%l2,	%i3,	%o6
	bpos	loop_1879
	fmovdge	%xcc,	%f14,	%f27
	addccc	%g1,	%i4,	%g5
	be,pn	%xcc,	loop_1880
loop_1879:
	movneg	%icc,	%g2,	%i1
	fmovdcs	%icc,	%f25,	%f12
	edge8n	%o1,	%l4,	%g7
loop_1880:
	edge32ln	%g4,	%o7,	%o4
	movre	%i0,	%l0,	%l6
	edge8	%g3,	%o2,	%l1
	bgu,a,pt	%xcc,	loop_1881
	sethi	0x11A0,	%g6
	movcs	%xcc,	%i6,	%o5
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
loop_1881:
	andcc	%l3,	0x165A,	%i5
	movrne	%l5,	%i7,	%o3
	sdivcc	%o0,	0x0D27,	%l2
	subccc	%i2,	%o6,	%i3
	fmovdcs	%icc,	%f21,	%f30
	add	%g1,	%i4,	%g5
	fmovsg	%xcc,	%f26,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,a	loop_1882
	and	%g2,	%i1,	%o1
	std	%g6,	[%l7 + 0x78]
	array32	%l4,	%o7,	%g4
loop_1882:
	edge32l	%o4,	%l0,	%l6
	xor	%i0,	0x1E58,	%g3
	fpsub16s	%f7,	%f12,	%f30
	movn	%icc,	%l1,	%g6
	bpos,a	%xcc,	loop_1883
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
	xnor	%o2,	0x0D3D,	%o5
	fmovrse	%i6,	%f25,	%f24
loop_1883:
	fmul8sux16	%f2,	%f0,	%f16
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	add	%i5,	%l3,	%l5
	set	0x50, %o4
	nop	 ! 	prefetcha	[%l7 + %o4] 0x0c,	 0x2 ASI use replaced by convert2hboot
	fcmpd	%fcc0,	%f6,	%f26
	umulcc	%i7,	%l2,	%o0
	fmovrdlz	%o6,	%f28,	%f14
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
	edge8n	%i3,	%i2,	%i4
	edge16n	%g1,	%g2,	%g5
	fnot1	%f20,	%f24
	bge,a,pt	%icc,	loop_1884
	fmovsn	%icc,	%f28,	%f8
	fmovdne	%icc,	%f27,	%f4
	fmovdgu	%icc,	%f20,	%f19
loop_1884:
	fmovsge	%xcc,	%f29,	%f16
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	movcc	%xcc,	%i1,	%g7
	fones	%f15
	wr	%g0,	0x04,	%asi
	fcmpne32	%f10,	%f26,	%o7
	std	%f14,	[%l7 + 0x10]
	bge,pt	%xcc,	loop_1885
	brnz,a	%g4,	loop_1886
	movgu	%xcc,	%l4,	%o4
	edge16	%l0,	%i0,	%g3
loop_1885:
	fbg,a	%fcc1,	loop_1887
loop_1886:
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	ld	[%l7 + 0x20],	%f16
	edge16n	%l1,	%g6,	%o2
loop_1887:
	fnors	%f29,	%f4,	%f9
	sdivcc	%o5,	0x1B0E,	%l6
	fors	%f17,	%f1,	%f14
	stw	%i6,	[%l7 + 0x64]
	addccc	%l3,	0x08DB,	%l5
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
	wr	%g0,	0x58,	%asi
	nop 	! 	tsubcctv	%i7,	0x1B60,	%l2 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	brz	%o0,	loop_1888
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f30,	[%l7 + 0x48]
	nop 	! 	tsubcctv	%o3,	0x1BA1,	%o6 changed by convert2hboot
loop_1888:
	sdivcc	%i3,	0x047A,	%i2
	fmul8x16au	%f26,	%f19,	%f26
	nop 	! 	tvs	%icc,	0x6 changed by convert2hboot
	umul	%g1,	0x1C3E,	%g2
	udiv	%i4,	0x0356,	%g5
	movn	%xcc,	%i1,	%g7
	fpadd32	%f16,	%f12,	%f30
	movrne	%o1,	0x0E9,	%o7
	fornot1s	%f20,	%f15,	%f13
	brlez,a	%g4,	loop_1889
	edge16	%o4,	%l0,	%i0
	be,a	loop_1890
	orn	%l4,	%l1,	%g6
loop_1889:
	fmovdvs	%icc,	%f26,	%f10
	bleu,a	%xcc,	loop_1891
loop_1890:
	fmovsvc	%xcc,	%f20,	%f5
	smul	%g3,	0x09C9,	%o2
	fcmpne32	%f22,	%f18,	%l6
loop_1891:
	nop 	! 	tle	%icc,	0x6 changed by convert2hboot
	fcmpes	%fcc1,	%f20,	%f29
	udivcc	%o5,	0x0097,	%i6
	addc	%l3,	%l5,	%i5
	movleu	%icc,	%i7,	%o0
	fmovdg	%xcc,	%f2,	%f17
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	sdiv	%o3,	0x1684,	%o6
	sdivcc	%l2,	0x0B0F,	%i3
	ldstub	[%l7 + 0x57],	%g1
	prefetch	[%l7 + 0x30],	 0x2
	sdivcc	%g2,	0x0C70,	%i4
	fmovsgu	%icc,	%f3,	%f26
	set	0x6F, %i1
	nop	 ! 	ldstuba	[%l7 + %i1] 0x80,	%i2 ASI use replaced by convert2hboot
	and	%i1,	%g7,	%g5
	bgu	loop_1892
	movrlz	%o1,	0x0E6,	%g4
	fmovsge	%icc,	%f3,	%f0
	edge32l	%o4,	%o7,	%i0
loop_1892:
	mova	%xcc,	%l4,	%l1
	mulx	%l0,	%g6,	%o2
	fbul,a	%fcc0,	loop_1893
	udivx	%g3,	0x0009,	%o5
	addcc	%l6,	%i6,	%l3
	ldsw	[%l7 + 0x44],	%l5
loop_1893:
	popc	0x09A7,	%i5
	nop 	! 	tcc	%xcc,	0x2 changed by convert2hboot
	fbge	%fcc2,	loop_1894
	sdivx	%i7,	0x165F,	%o0
	nop 	! 	tsubcctv	%o3,	%l2,	%i3 changed by convert2hboot
	fcmpgt16	%f12,	%f28,	%o6
loop_1894:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f16,	[%l7 + 0x78] %asi
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
	subcc	%g2,	0x19A7,	%i4
	fmovrdgez	%i2,	%f10,	%f16
	wr	%g0,	0x89,	%asi
	prefetch	[%l7 + 0x64],	 0x1
	nop 	! 	ta	%icc,	0x7 changed by convert2hboot
	fmul8x16au	%f10,	%f18,	%f16
	bne	%xcc,	loop_1895
	fnot1	%f22,	%f14
	edge32	%g7,	%g5,	%i1
	fmovrsgz	%g4,	%f26,	%f0
loop_1895:
	array8	%o1,	%o7,	%i0
	st	%f16,	[%l7 + 0x6C]
	umul	%o4,	%l1,	%l0
	fblg	%fcc1,	loop_1896
	fbu	%fcc2,	loop_1897
	nop 	! 	tle	%icc,	0x4 changed by convert2hboot
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
loop_1896:
	edge16l	%l4,	%g6,	%g3
loop_1897:
	nop 	! 	tsubcc	%o2,	%o5,	%l6 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
	bcc,pn	%xcc,	loop_1898
	movrgez	%i6,	%l3,	%i5
	fand	%f24,	%f16,	%f12
	movl	%icc,	%i7,	%o0
loop_1898:
	subc	%o3,	%l2,	%l5
	xnorcc	%o6,	0x0124,	%i3
	mulx	%g2,	0x0EC2,	%i2
	xnorcc	%i4,	0x192C,	%g7
	edge16ln	%g5,	%g1,	%i1
	movle	%icc,	%g4,	%o7
	movcs	%xcc,	%i0,	%o4
	bvc,a,pn	%icc,	loop_1899
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
	ldsb	[%l7 + 0x2A],	%o1
	brnz,a	%l1,	loop_1900
loop_1899:
	fpack16	%f0,	%f26
	fmovdvs	%xcc,	%f0,	%f22
	nop 	! 	sir	0x1119 changed by convert2hboot
loop_1900:
	fmovd	%f12,	%f16
	xorcc	%l0,	0x1734,	%g6
	umulcc	%l4,	%o2,	%o5
	sll	%g3,	%l6,	%i6
	edge16ln	%i5,	%l3,	%i7
	fmovrse	%o3,	%f25,	%f25
	mulx	%o0,	0x0772,	%l2
	bcc,a	loop_1901
	mulx	%l5,	0x12A0,	%o6
	subccc	%i3,	0x1ACB,	%g2
	fbl,a	%fcc0,	loop_1902
loop_1901:
	udivcc	%i4,	0x180C,	%g7
	fmovrslez	%i2,	%f22,	%f3
	fcmpes	%fcc2,	%f22,	%f4
loop_1902:
	smul	%g1,	0x1C06,	%g5
	orn	%g4,	%o7,	%i0
	nop 	! 	taddcc	%o4,	%o1,	%l1 changed by convert2hboot
	fmovsn	%icc,	%f11,	%f4
	mova	%xcc,	%l0,	%i1
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	lduh	[%l7 + 0x30],	%g6
	sethi	0x1F90,	%l4
	mova	%xcc,	%o5,	%g3
	sllx	%o2,	0x1B,	%l6
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	or	%i5,	0x1D52,	%l3
	xorcc	%i6,	%i7,	%o0
	swap	[%l7 + 0x5C],	%o3
	brlez	%l2,	loop_1903
	bl,a	%xcc,	loop_1904
	fpsub16	%f24,	%f30,	%f0
	fbug	%fcc2,	loop_1905
loop_1903:
	subccc	%l5,	0x159A,	%o6
loop_1904:
	fbg	%fcc3,	loop_1906
	nop 	! 	tcs	%xcc,	0x4 changed by convert2hboot
loop_1905:
	add	%g2,	%i4,	%g7
	xorcc	%i3,	%g1,	%i2
loop_1906:
	fsrc2s	%f5,	%f31
	mulx	%g4,	%g5,	%i0
	fandnot2	%f20,	%f10,	%f10
	edge32n	%o4,	%o1,	%o7
	nop 	! 	taddcctv	%l1,	%l0,	%g6 changed by convert2hboot
	fmovrse	%i1,	%f9,	%f29
	movge	%xcc,	%o5,	%l4
	movn	%xcc,	%o2,	%g3
	srax	%l6,	0x17,	%l3
	xor	%i6,	0x1E8A,	%i5
	fmovsl	%xcc,	%f1,	%f25
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	fbue	%fcc0,	loop_1907
	nop
	setx	loop_1908,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
	fmovdvs	%xcc,	%f27,	%f29
loop_1907:
	sll	%i7,	0x1C,	%l2
loop_1908:
	bvs,a,pn	%icc,	loop_1909
	fnot1s	%f18,	%f0
	stw	%o6,	[%l7 + 0x50]
	smulcc	%g2,	%i4,	%l5
loop_1909:
	nop
	setx	loop_1910,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	edge8ln	%i3,	%g7,	%i2
	wr	%g0,	0x19,	%asi
loop_1910:
	ldub	[%l7 + 0x60],	%g1
	orcc	%i0,	0x1FE9,	%o4
	fxor	%f26,	%f16,	%f14
	fbue	%fcc3,	loop_1911
	fnot1s	%f8,	%f5
	fxors	%f24,	%f31,	%f16
	edge8ln	%o1,	%o7,	%g5
loop_1911:
	move	%icc,	%l0,	%l1
	movg	%xcc,	%i1,	%g6
	mulscc	%o5,	0x1D17,	%o2
	movre	%l4,	0x0CB,	%l6
	bne,a,pn	%xcc,	loop_1912
	fmul8sux16	%f20,	%f6,	%f26
	nop 	! 	taddcc	%g3,	%i6,	%i5 changed by convert2hboot
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
loop_1912:
	xnorcc	%l3,	%o0,	%i7
	fcmpgt32	%f8,	%f16,	%o3
	fcmpne32	%f12,	%f8,	%o6
	fornot2s	%f15,	%f21,	%f28
	fands	%f16,	%f0,	%f1
	srax	%g2,	0x01,	%l2
	nop 	! 	tgu	%icc,	0x4 changed by convert2hboot
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
	wr	%g0,	0x04,	%asi
	nop 	! 	taddcctv	%l5,	%i3,	%g7 changed by convert2hboot
	brnz	%i2,	loop_1913
	andcc	%g4,	%i0,	%o4
	edge8ln	%g1,	%o1,	%g5
	fmovsle	%icc,	%f1,	%f26
loop_1913:
	ldsh	[%l7 + 0x50],	%l0
	fbu,a	%fcc1,	loop_1914
	edge32ln	%l1,	%o7,	%i1
	array8	%o5,	%g6,	%o2
	sdiv	%l4,	0x116F,	%g3
loop_1914:
	sth	%i6,	[%l7 + 0x66]
	movl	%xcc,	%l6,	%l3
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	std	%o0,	[%l7 + 0x10]
	udiv	%i7,	0x14F8,	%o3
	nop 	! 	tsubcctv	%i5,	0x161B,	%g2 changed by convert2hboot
	mova	%xcc,	%o6,	%l2
	set	0x5B, %i0
	nop	 ! 	lduba	[%l7 + %i0] 0x19,	%i4 ASI use replaced by convert2hboot
	addccc	%i3,	%g7,	%l5
	edge32l	%i2,	%i0,	%g4
	fblg,a	%fcc3,	loop_1915
	move	%xcc,	%g1,	%o4
	nop 	! 	taddcc	%o1,	%l0,	%g5 changed by convert2hboot
	fmovrdgez	%l1,	%f16,	%f16
loop_1915:
	ld	[%l7 + 0x68],	%f9
	fxnors	%f28,	%f9,	%f6
	st	%f26,	[%l7 + 0x2C]
	fnot1s	%f31,	%f9
	array32	%i1,	%o7,	%o5
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	edge16l	%g6,	%l4,	%o2
	andncc	%g3,	%l6,	%i6
	movrlz	%l3,	0x2C9,	%o0
	mulscc	%o3,	0x0A7C,	%i7
	fnors	%f1,	%f5,	%f6
	add	%g2,	%i5,	%l2
	srl	%o6,	0x18,	%i4
	bleu	%icc,	loop_1916
	movcs	%xcc,	%i3,	%g7
	fmovdvs	%icc,	%f18,	%f23
	edge8l	%i2,	%i0,	%l5
loop_1916:
	fornot2	%f28,	%f4,	%f0
	set	0x4C, %o1
	nop	 ! 	ldstuba	[%l7 + %o1] 0x04,	%g4 ASI use replaced by convert2hboot
	udiv	%o4,	0x14A1,	%g1
	sdiv	%l0,	0x00A3,	%g5
	nop 	! 	tsubcc	%o1,	0x0B76,	%l1 changed by convert2hboot
	flush	%l7 + 0x60
	movrgez	%o7,	0x0E9,	%o5
	fmovdcc	%xcc,	%f13,	%f26
	addc	%i1,	%g6,	%o2
	movneg	%icc,	%g3,	%l6
	wr	%g0,	0x80,	%asi
	ldub	[%l7 + 0x5C],	%l4
	movl	%icc,	%l3,	%o0
	andn	%o3,	%g2,	%i7
	smulcc	%l2,	0x1BA1,	%i5
	subcc	%i4,	%o6,	%g7
	edge8ln	%i3,	%i0,	%i2
	array16	%g4,	%l5,	%o4
	alignaddrl	%g1,	%l0,	%g5
	movpos	%icc,	%o1,	%l1
	andncc	%o7,	%i1,	%o5
	xor	%g6,	0x16EA,	%o2
	movrgez	%g3,	0x149,	%i6
	udivcc	%l6,	0x0F9E,	%l3
	ldx	[%l7 + 0x78],	%o0
	movne	%xcc,	%o3,	%g2
	nop 	! 	tcs	%xcc,	0x3 changed by convert2hboot
	bge,pt	%xcc,	loop_1917
	edge8l	%l4,	%l2,	%i7
	movcc	%icc,	%i4,	%o6
	subcc	%g7,	%i3,	%i5
loop_1917:
	ble	loop_1918
	fmovdvc	%icc,	%f16,	%f0
	fbue	%fcc2,	loop_1919
	nop 	! 	tsubcctv	%i2,	0x12BA,	%i0 changed by convert2hboot
loop_1918:
	nop
	wr	%g0,	0x18,	%asi
loop_1919:
	nop 	! 	ta	%icc,	0x2 changed by convert2hboot
	fmovsl	%icc,	%f1,	%f27
	fmovdgu	%xcc,	%f25,	%f15
	for	%f2,	%f16,	%f10
	andncc	%l5,	%g1,	%o4
	membar	0x57
	add	%g5,	%l0,	%l1
	fba,a	%fcc0,	loop_1920
	edge32	%o1,	%o7,	%i1
	sra	%g6,	0x04,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1920:
	fxnor	%f10,	%f26,	%f28
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
	fpadd32s	%f11,	%f9,	%f9
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	st	%f20,	[%l7 + 0x1C]
	bleu,a	%xcc,	loop_1921
	xnorcc	%o5,	0x0A2E,	%i6
	sth	%l6,	[%l7 + 0x16]
	fbo,a	%fcc2,	loop_1922
loop_1921:
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	ldsb	[%l7 + 0x62],	%g3
	nop 	! 	te	%icc,	0x3 changed by convert2hboot
loop_1922:
	addc	%l3,	0x19E7,	%o0
	fmovrdgez	%g2,	%f18,	%f14
	move	%xcc,	%o3,	%l4
	srlx	%l2,	%i4,	%i7
	wr	%g0,	0x89,	%asi
	sra	%o6,	0x15,	%i3
	umulcc	%i5,	0x09E3,	%i2
	movrne	%i0,	%l5,	%g1
	nop 	! 	tleu	%xcc,	0x0 changed by convert2hboot
	fcmpeq16	%f6,	%f8,	%g4
	movleu	%icc,	%o4,	%l0
	nop 	! 	taddcctv	%l1,	%o1,	%g5 changed by convert2hboot
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o7
	nop	 ! 	casa	[%l6] 0x10,	%o7,	%g6 ASI use replaced by convert2hboot
	edge32	%i1,	%o5,	%o2
	fbg	%fcc1,	loop_1923
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	ble,a,pt	%xcc,	loop_1924
	fabsd	%f12,	%f2
loop_1923:
	edge16ln	%l6,	%g3,	%l3
	smulcc	%i6,	0x0E88,	%o0
loop_1924:
	udivx	%g2,	0x14BA,	%o3
	fblg,a	%fcc2,	loop_1925
	xorcc	%l4,	%l2,	%i4
	fcmpgt32	%f6,	%f14,	%i7
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g7
loop_1925:
	movre	%i3,	0x339,	%i2
	movge	%icc,	%i0,	%l5
	fbul	%fcc1,	loop_1926
	andn	%g1,	%i5,	%o4
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x10] %asi,	%f15
loop_1926:
	bvc	%xcc,	loop_1927
	fone	%f8
	bleu,a	loop_1928
	fxnor	%f14,	%f10,	%f18
loop_1927:
	movleu	%icc,	%l0,	%l1
	wr	%g0,	0x17,	%asi
	membar	#Sync
loop_1928:
	nop
	set	0x34, %i7
	stw	%g4,	[%l7 + %i7]
	ldsh	[%l7 + 0x36],	%o1
	movrgez	%g5,	0x2C7,	%g6
	movrgez	%o7,	0x287,	%i1
	nop 	! 	tl	%xcc,	0x6 changed by convert2hboot
	fbg	%fcc2,	loop_1929
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
loop_1929:
	prefetch	[%l7 + 0x50],	 0x0
	fpsub32	%f6,	%f8,	%f30
	fmovrdlz	%o5,	%f18,	%f8
	movvc	%icc,	%l6,	%g3
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	srl	%o2,	0x1E,	%i6
	fmovsle	%xcc,	%f6,	%f27
	edge32	%l3,	%o0,	%g2
	xnor	%l4,	0x1BE9,	%o3
	wr	%g0,	0x18,	%asi
	sta	%f8,	[%l7 + 0x74] %asi
	fmovdvs	%icc,	%f1,	%f29
	brnz,a	%l2,	loop_1930
	fones	%f6
	movgu	%icc,	%i7,	%g7
	mulscc	%i4,	0x05E8,	%o6
loop_1930:
	movre	%i3,	0x37B,	%i0
	fbg,a	%fcc1,	loop_1931
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	movrne	%i2,	0x3B0,	%g1
	fmovdl	%xcc,	%f14,	%f29
loop_1931:
	movrlez	%i5,	%o4,	%l0
	movle	%xcc,	%l1,	%l5
	fmovs	%f14,	%f10
	movrgz	%g4,	%g5,	%o1
	ldd	[%l7 + 0x50],	%g6
	brlez,a	%o7,	loop_1932
	fandnot1s	%f2,	%f0,	%f13
	fcmpgt16	%f2,	%f24,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1932:
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	udiv	%l6,	0x1657,	%g3
	mulx	%o2,	%i6,	%o5
	ldstub	[%l7 + 0x7C],	%o0
	nop
	set	0x29, %i5
	ldsb	[%l7 + %i5],	%l3
	nop 	! 	tgu	%xcc,	0x4 changed by convert2hboot
	fcmpgt32	%f18,	%f2,	%g2
	edge16n	%l4,	%o3,	%l2
	wr	%g0,	0x19,	%asi
	fbl,a	%fcc1,	loop_1933
	fmovdge	%icc,	%f4,	%f13
	orncc	%i7,	0x14E8,	%i4
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
loop_1933:
	fmovdle	%icc,	%f20,	%f16
	fmovdcs	%icc,	%f20,	%f13
	fpadd16s	%f20,	%f13,	%f2
	fcmpgt16	%f20,	%f6,	%o6
	nop
	setx loop_1934, %l0, %l1
	jmpl %l1, %i3
	fpadd32s	%f3,	%f12,	%f1
	fbne	%fcc3,	loop_1935
	mulx	%i0,	0x1A00,	%g7
loop_1934:
	nop
	set	0x18, %o6
	sta	%f3,	[%l7 + %o6] 0x10
loop_1935:
	fmovrdlz	%g1,	%f2,	%f24
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
	orcc	%i5,	%o4,	%l0
	fmovdle	%xcc,	%f9,	%f6
	movl	%icc,	%l1,	%i2
	brlz	%g4,	loop_1936
	fmovse	%icc,	%f4,	%f14
	call	loop_1937
	fbue,a	%fcc0,	loop_1938
loop_1936:
	fxors	%f6,	%f18,	%f29
	fnegd	%f4,	%f30
loop_1937:
	umulcc	%g5,	0x09E7,	%l5
loop_1938:
	stb	%g6,	[%l7 + 0x40]
	andn	%o7,	%i1,	%o1
	addccc	%l6,	0x1C4C,	%g3
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
	bcc,a,pn	%icc,	loop_1939
	nop 	! 	tsubcctv	%o2,	0x1C23,	%i6 changed by convert2hboot
	sdivx	%o0,	0x130E,	%o5
	edge16ln	%l3,	%g2,	%l4
loop_1939:
	sllx	%o3,	0x07,	%i7
	movn	%xcc,	%l2,	%o6
	sethi	0x045F,	%i3
	array32	%i4,	%i0,	%g7
	edge8ln	%i5,	%g1,	%l0
	movle	%icc,	%l1,	%i2
	xorcc	%o4,	0x1DBE,	%g5
	bgu,pt	%icc,	loop_1940
	fbg	%fcc1,	loop_1941
	brgz,a	%l5,	loop_1942
	addcc	%g4,	0x01F9,	%o7
loop_1940:
	brlez	%g6,	loop_1943
loop_1941:
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
loop_1942:
	xor	%i1,	0x1AD5,	%o1
	udivx	%l6,	0x0DA5,	%o2
loop_1943:
	srax	%i6,	%g3,	%o5
	bn,a,pn	%xcc,	loop_1944
	swap	[%l7 + 0x70],	%o0
	ldd	[%l7 + 0x58],	%f24
	fba	%fcc3,	loop_1945
loop_1944:
	nop
	set	0x6A, %l0
	ldsb	[%l7 + %l0],	%l3
	movn	%xcc,	%l4,	%g2
	edge8l	%i7,	%o3,	%o6
loop_1945:
	bge,pn	%icc,	loop_1946
	bvs,a	%xcc,	loop_1947
	fmovdle	%icc,	%f6,	%f26
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
loop_1946:
	edge8n	%i3,	%l2,	%i0
loop_1947:
	pdist	%f18,	%f30,	%f12
	bcs,pn	%xcc,	loop_1948
	fmovrdgez	%i4,	%f20,	%f4
	ldub	[%l7 + 0x2A],	%i5
	bshuffle	%f6,	%f30,	%f14
loop_1948:
	xnorcc	%g7,	0x10E4,	%g1
	edge32ln	%l0,	%i2,	%l1
	st	%f31,	[%l7 + 0x20]
	brgez	%g5,	loop_1949
	bn,a	loop_1950
	movvs	%icc,	%o4,	%l5
	nop 	! 	tleu	%icc,	0x3 changed by convert2hboot
loop_1949:
	fandnot2	%f6,	%f22,	%f30
loop_1950:
	st	%f2,	[%l7 + 0x30]
	sdivx	%g4,	0x10C7,	%o7
	edge16ln	%i1,	%g6,	%l6
	fmovrslz	%o1,	%f16,	%f18
	movrlz	%o2,	0x0E5,	%i6
	fbne,a	%fcc0,	loop_1951
	membar	0x5D
	fbg	%fcc3,	loop_1952
	edge16n	%o5,	%o0,	%l3
loop_1951:
	andcc	%l4,	%g2,	%i7
	edge16n	%o3,	%o6,	%i3
loop_1952:
	nop 	! 	tvs	%xcc,	0x7 changed by convert2hboot
	orncc	%l2,	0x0A35,	%i0
	wr	%g0,	0x27,	%asi
	membar	#Sync
	fmovsn	%xcc,	%f6,	%f28
	fornot2	%f28,	%f22,	%f18
	wr	%g0,	0x19,	%asi
	nop 	! 	tsubcc	%g3,	%g1,	%g7 changed by convert2hboot
	edge32ln	%i2,	%l0,	%g5
	umulcc	%o4,	0x0EA2,	%l5
	fnand	%f20,	%f0,	%f4
	wr	%g0,	0x22,	%asi
	membar	#Sync
	wr	%g0,	0x19,	%asi
	move	%xcc,	%i1,	%g4
	fble,a	%fcc3,	loop_1953
	fpadd16s	%f10,	%f25,	%f24
	sll	%l6,	0x1B,	%o1
	sllx	%g6,	0x01,	%i6
loop_1953:
	bleu	%xcc,	loop_1954
	fpsub16s	%f3,	%f9,	%f9
	subcc	%o5,	0x03EB,	%o2
	nop
	setx	loop_1955,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_1954:
	fsrc1	%f12,	%f16
	movvc	%xcc,	%o0,	%l3
	bleu	%xcc,	loop_1956
loop_1955:
	mova	%xcc,	%g2,	%l4
	set	0x40, %o3
	nop	 ! 	ldda	[%l7 + %o3] 0xea,	%i6 ASI use replaced by convert2hboot
loop_1956:
	movn	%xcc,	%o3,	%o6
	stb	%l2,	[%l7 + 0x71]
	fpadd16s	%f11,	%f31,	%f11
	fmovrslez	%i3,	%f3,	%f6
	fble,a	%fcc1,	loop_1957
	fsrc2s	%f30,	%f17
	fcmpes	%fcc1,	%f5,	%f8
	fmovrse	%i4,	%f29,	%f5
loop_1957:
	movge	%xcc,	%i5,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x74, %o7
	nop	 ! 	ldswa	[%l7 + %o7] 0x10,	%g1 ASI use replaced by convert2hboot
	bvc,a	loop_1958
	faligndata	%f22,	%f14,	%f12
	brlez,a	%g3,	loop_1959
	nop 	! 	tg	%xcc,	0x2 changed by convert2hboot
loop_1958:
	fbule	%fcc1,	loop_1960
	movne	%xcc,	%g7,	%l0
loop_1959:
	movcs	%icc,	%i2,	%g5
	fba	%fcc2,	loop_1961
loop_1960:
	movcc	%xcc,	%l5,	%l1
	fsrc2	%f20,	%f24
	bg,pt	%xcc,	loop_1962
loop_1961:
	be,a,pn	%xcc,	loop_1963
	movvc	%icc,	%o4,	%i1
	or	%g4,	%l6,	%o1
loop_1962:
	movcc	%xcc,	%o7,	%i6
loop_1963:
	stw	%o5,	[%l7 + 0x0C]
	fmuld8sux16	%f23,	%f24,	%f2
	andn	%o2,	%o0,	%l3
	edge16	%g6,	%l4,	%i7
	udiv	%o3,	0x0537,	%g2
	ldsb	[%l7 + 0x35],	%l2
	set	0x28, %l3
	nop	 ! 	stha	%o6,	[%l7 + %l3] 0x2a ASI use replaced by convert2hboot
	membar	#Sync
	umul	%i3,	%i5,	%i0
	addcc	%i4,	0x11D4,	%g1
	wr	%g0,	0x10,	%asi
	fmovsn	%xcc,	%f4,	%f25
	set	0x40, %g7
	nop	 ! 	ldda	[%l7 + %g7] 0x80,	%f0 ASI use replaced by convert2hboot
	bge,a	loop_1964
	nop 	! 	ta	%xcc,	0x7 changed by convert2hboot
	nop 	! 	tl	%icc,	0x5 changed by convert2hboot
	addcc	%g7,	%i2,	%g5
loop_1964:
	nop
	wr	%g0,	0x18,	%asi
	orn	%l1,	0x1CAB,	%l0
	fmovsge	%xcc,	%f28,	%f15
	edge32l	%o4,	%g4,	%l6
	subccc	%i1,	%o1,	%i6
	srl	%o5,	%o7,	%o2
	edge16	%l3,	%o0,	%l4
	fcmpgt16	%f26,	%f0,	%i7
	nop
	setx loop_1965, %l0, %l1
	jmpl %l1, %g6
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
	nop 	! 	tneg	%icc,	0x7 changed by convert2hboot
	srl	%o3,	%g2,	%o6
loop_1965:
	srl	%i3,	%l2,	%i5
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	xor	%i0,	0x0C22,	%i4
	pdist	%f28,	%f16,	%f30
	udivx	%g3,	0x1722,	%g1
	move	%icc,	%i2,	%g5
	set	0x2C, %i3
	nop	 ! 	ldsha	[%l7 + %i3] 0x0c,	%l5 ASI use replaced by convert2hboot
	fbul	%fcc1,	loop_1966
	fbne,a	%fcc1,	loop_1967
	fbule	%fcc0,	loop_1968
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1966:
	movrgz	%g7,	0x100,	%l1
loop_1967:
	std	%f0,	[%l7 + 0x68]
loop_1968:
	ldsh	[%l7 + 0x38],	%l0
	set	0x108, %l6
	nop	 ! 	ldxa	[%g0 + %l6] 0x52,	%g4 ASI use replaced by convert2hboot
	nop 	! 	tcs	%icc,	0x6 changed by convert2hboot
	stb	%o4,	[%l7 + 0x23]
	edge8	%i1,	%l6,	%o1
	fcmpgt32	%f24,	%f20,	%i6
	bge,pt	%xcc,	loop_1969
	mova	%icc,	%o5,	%o2
	brnz,a	%o7,	loop_1970
	fmovsge	%xcc,	%f8,	%f12
loop_1969:
	nop 	! 	tne	%xcc,	0x3 changed by convert2hboot
	fmovdle	%xcc,	%f31,	%f31
loop_1970:
	fbu,a	%fcc2,	loop_1971
	fmovrdlez	%l3,	%f28,	%f26
	srlx	%l4,	%i7,	%o0
	fnegd	%f18,	%f18
loop_1971:
	sll	%g6,	0x1F,	%g2
	fsrc2s	%f10,	%f18
	movrlez	%o6,	%o3,	%i3
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
	mova	%xcc,	%i5,	%i0
	edge32l	%i4,	%l2,	%g3
	bne,pt	%icc,	loop_1972
	srl	%g1,	%i2,	%l5
	nop 	! 	tg	%xcc,	0x5 changed by convert2hboot
	fmovsne	%xcc,	%f16,	%f25
loop_1972:
	nop 	! 	tg	%xcc,	0x7 changed by convert2hboot
	ldsw	[%l7 + 0x70],	%g7
	fnor	%f12,	%f30,	%f2
	sethi	0x0B2D,	%g5
	movleu	%icc,	%l0,	%g4
	fnot2s	%f27,	%f3
	fcmpgt16	%f30,	%f24,	%l1
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	bvc,pn	%icc,	loop_1973
	bn,a	%xcc,	loop_1974
	movpos	%icc,	%i1,	%l6
	fpadd16s	%f3,	%f11,	%f0
loop_1973:
	movrlez	%o4,	%i6,	%o5
loop_1974:
	fpsub16s	%f28,	%f13,	%f13
	movl	%icc,	%o2,	%o1
	subcc	%l3,	%l4,	%i7
	set	0x5C, %l1
	nop	 ! 	ldswa	[%l7 + %l1] 0x88,	%o7 ASI use replaced by convert2hboot
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	nop	 ! 	casxa	[%l6] 0x0c,	%g6,	%g2 ASI use replaced by convert2hboot
	ble,pt	%xcc,	loop_1975
	fmovrdne	%o6,	%f0,	%f6
	xnorcc	%o0,	0x1776,	%o3
	fors	%f31,	%f24,	%f15
loop_1975:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,a,pt	%icc,	loop_1976
	movcc	%icc,	%i3,	%i5
	movrgz	%i0,	0x191,	%i4
	fmuld8ulx16	%f23,	%f14,	%f20
loop_1976:
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	bvc,a	loop_1977
	move	%icc,	%l2,	%g1
	movle	%xcc,	%g3,	%l5
	xorcc	%g7,	0x0164,	%g5
loop_1977:
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	movrlz	%i2,	%g4,	%l1
	move	%xcc,	%i1,	%l6
	movrne	%l0,	%i6,	%o5
	srlx	%o4,	0x13,	%o1
	bleu	loop_1978
	brgz	%o2,	loop_1979
	stb	%l4,	[%l7 + 0x71]
	orncc	%i7,	0x1A18,	%l3
loop_1978:
	nop
	wr	%g0,	0x2a,	%asi
	membar	#Sync
loop_1979:
	fpsub32s	%f5,	%f19,	%f28
	bvs,a	loop_1980
	xnorcc	%g2,	0x08DC,	%g6
	alignaddrl	%o0,	%o3,	%o6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x3C] %asi,	%f28
loop_1980:
	std	%f0,	[%l7 + 0x38]
	fornot1s	%f28,	%f13,	%f14
	fornot2s	%f11,	%f16,	%f5
	nop 	! 	tgu	%xcc,	0x6 changed by convert2hboot
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	movrgez	%i3,	%i0,	%i5
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	ldsw	[%l7 + 0x10],	%i4
	edge16ln	%l2,	%g1,	%l5
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	brgz	%g7,	loop_1981
	edge8n	%g3,	%i2,	%g4
	edge32ln	%l1,	%g5,	%i1
	bvc,pt	%xcc,	loop_1982
loop_1981:
	brgez,a	%l6,	loop_1983
	edge16ln	%i6,	%o5,	%l0
	set	0x6E, %l4
	nop	 ! 	stha	%o1,	[%l7 + %l4] 0x80 ASI use replaced by convert2hboot
loop_1982:
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
loop_1983:
	ldsh	[%l7 + 0x16],	%o2
	movgu	%xcc,	%o4,	%l4
	edge32	%i7,	%o7,	%l3
	edge16	%g6,	%g2,	%o3
	membar	0x03
	fpadd16s	%f25,	%f20,	%f30
	bne,a	%icc,	loop_1984
	array32	%o6,	%i3,	%o0
	pdist	%f16,	%f12,	%f18
	nop
	setx	loop_1985,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_1984:
	nop 	! 	taddcctv	%i0,	%i4,	%i5 changed by convert2hboot
	edge8l	%g1,	%l5,	%l2
	set	0x32, %l2
	nop	 ! 	ldsha	[%l7 + %l2] 0x88,	%g3 ASI use replaced by convert2hboot
loop_1985:
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	sllx	%g7,	%i2,	%g4
	set	0x40, %g1
	nop	 ! 	ldda	[%l7 + %g1] 0x18,	%f16 ASI use replaced by convert2hboot
	fxor	%f30,	%f12,	%f12
	edge8ln	%g5,	%i1,	%l1
	movrlez	%i6,	0x3DF,	%l6
	set	0x36, %g4
	nop	 ! 	lduba	[%l7 + %g4] 0x04,	%o5 ASI use replaced by convert2hboot
	sdiv	%l0,	0x0E9D,	%o2
	movl	%icc,	%o4,	%l4
	fnors	%f26,	%f19,	%f12
	flush	%l7 + 0x44
	sth	%i7,	[%l7 + 0x76]
	sth	%o1,	[%l7 + 0x24]
	xnor	%l3,	0x162B,	%g6
	array16	%o7,	%o3,	%g2
	fxnor	%f12,	%f10,	%f6
	lduw	[%l7 + 0x60],	%i3
	addc	%o0,	%i0,	%o6
	nop 	! 	tcc	%xcc,	0x0 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i4,	[%l7 + 0x08]
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
	smulcc	%g1,	%l5,	%l2
	nop
	setx loop_1986, %l0, %l1
	jmpl %l1, %g3
	subcc	%g7,	%i2,	%g4
	fmovdcs	%xcc,	%f4,	%f0
	edge16n	%g5,	%i5,	%i1
loop_1986:
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
	edge8n	%i6,	%l1,	%l6
	subcc	%l0,	0x0030,	%o2
	fbl	%fcc3,	loop_1987
	edge32	%o4,	%o5,	%i7
	fbule	%fcc2,	loop_1988
	movrgez	%o1,	%l4,	%g6
loop_1987:
	or	%l3,	%o7,	%g2
	movle	%xcc,	%o3,	%i3
loop_1988:
	nop
	wr	%g0,	0x10,	%asi
	umul	%o0,	0x1601,	%i4
	set	0x70, %g6
	nop	 ! 	lduwa	[%l7 + %g6] 0x81,	%o6 ASI use replaced by convert2hboot
	fmovrslz	%l5,	%f26,	%f22
	sub	%g1,	%g3,	%l2
	bne,pt	%xcc,	loop_1989
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	wr	%g0,	0xe2,	%asi
loop_1989:
	fnegs	%f3,	%f22
	wr	%g0,	0x80,	%asi
	fpsub32s	%f0,	%f28,	%f4
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
	fpadd32	%f4,	%f26,	%f2
	fmovsvc	%icc,	%f6,	%f24
	subccc	%g4,	%g5,	%i5
	fmovsl	%icc,	%f28,	%f2
	set	0x40, %g5
	nop	 ! 	ldstuba	[%l7 + %g5] 0x80,	%i1 ASI use replaced by convert2hboot
	bvs,pn	%icc,	loop_1990
	sethi	0x0720,	%l1
	stb	%l6,	[%l7 + 0x56]
	movneg	%icc,	%i6,	%l0
loop_1990:
	movle	%xcc,	%o4,	%o5
	fnor	%f30,	%f8,	%f24
	fxor	%f16,	%f0,	%f4
	fbn	%fcc2,	loop_1991
	edge16n	%o2,	%i7,	%o1
	popc	0x1F49,	%l4
	std	%f20,	[%l7 + 0x40]
loop_1991:
	ldsb	[%l7 + 0x11],	%l3
	fmovdle	%icc,	%f11,	%f13
	nop 	! 	tleu	%icc,	0x1 changed by convert2hboot
	orn	%o7,	0x14F3,	%g2
	fsrc2	%f6,	%f10
	xor	%g6,	%i3,	%o3
	movvc	%icc,	%o0,	%i0
	mulscc	%o6,	0x02CB,	%l5
	nop 	! 	tl	%xcc,	0x1 changed by convert2hboot
	edge8n	%i4,	%g1,	%l2
	nop 	! 	sir	0x089C changed by convert2hboot
	andncc	%i2,	%g7,	%g3
	movne	%icc,	%g5,	%i5
	mova	%xcc,	%g4,	%i1
	fmovdne	%xcc,	%f6,	%f7
	add	%l1,	0x0EB8,	%l6
	subc	%i6,	0x09DA,	%o4
	fpadd32s	%f25,	%f21,	%f28
	addc	%o5,	%l0,	%i7
	alignaddrl	%o1,	%o2,	%l4
	fmuld8ulx16	%f1,	%f6,	%f14
	movvc	%xcc,	%o7,	%l3
	smulcc	%g6,	%i3,	%g2
	fcmple16	%f2,	%f12,	%o0
	fmovsgu	%icc,	%f25,	%f31
	movre	%i0,	0x021,	%o3
	brnz	%l5,	loop_1992
	umulcc	%o6,	%g1,	%i4
	bvc,pn	%xcc,	loop_1993
	nop 	! 	sir	0x196B changed by convert2hboot
loop_1992:
	fandnot1s	%f12,	%f13,	%f24
	array8	%l2,	%i2,	%g3
loop_1993:
	nop
	set	0x20, %g2
	std	%g6,	[%l7 + %g2]
	subc	%i5,	%g4,	%g5
	mulscc	%i1,	0x14C8,	%l1
	set	0x40, %l5
	nop	 ! 	stda	%f16,	[%l7 + %l5] 0xf1 ASI use replaced by convert2hboot
	membar	#Sync
	wr	%g0,	0x88,	%asi
	sta	%f9,	[%l7 + 0x08] %asi
	nop
	set	0x68, %g3
	ldd	[%l7 + %g3],	%f4
	stw	%i6,	[%l7 + 0x48]
	fmovrsgez	%o4,	%f5,	%f26
	udivcc	%l6,	0x01FE,	%o5
	nop 	! 	taddcc	%l0,	%i7,	%o2 changed by convert2hboot
	movrlz	%l4,	0x274,	%o1
	sdivx	%o7,	0x084F,	%g6
	movle	%xcc,	%l3,	%i3
	nop
	setx loop_1994, %l0, %l1
	jmpl %l1, %g2
	brgz	%i0,	loop_1995
	movpos	%icc,	%o0,	%o3
	edge32	%o6,	%g1,	%l5
loop_1994:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1995:
	fbl,a	%fcc1,	loop_1996
	movge	%icc,	%l2,	%i2
	wr	%g0,	0x80,	%asi
loop_1996:
	mova	%xcc,	%g7,	%i4
	xnor	%g4,	%g5,	%i5
	membar	#Sync
	set	0x40, %o0
	nop	 ! 	ldda	[%l7 + %o0] 0x17,	%f0 ASI use replaced by convert2hboot
	movvc	%xcc,	%l1,	%i1
	fnors	%f28,	%f31,	%f8
	nop 	! 	tvs	%xcc,	0x2 changed by convert2hboot
	movleu	%xcc,	%o4,	%l6
	xnorcc	%i6,	%o5,	%l0
	nop 	! 	tg	%xcc,	0x4 changed by convert2hboot
	brgez	%i7,	loop_1997
	fbl,a	%fcc2,	loop_1998
	fcmpgt16	%f10,	%f20,	%l4
	sllx	%o1,	0x19,	%o2
loop_1997:
	edge8ln	%g6,	%o7,	%l3
loop_1998:
	nop
	wr	%g0,	0x18,	%asi
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
	set	0x34, %i6
	nop	 ! 	ldswa	[%l7 + %i6] 0x10,	%i0 ASI use replaced by convert2hboot
	nop 	! 	sir	0x19C6 changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
	movrne	%o0,	0x302,	%g2
	addccc	%o3,	%o6,	%l5
	fmovdge	%xcc,	%f28,	%f27
	nop 	! 	tneg	%icc,	0x0 changed by convert2hboot
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
	movneg	%icc,	%g1,	%i2
	wr	%g0,	0x10,	%asi
	sta	%f1,	[%l7 + 0x48] %asi
	subccc	%l2,	0x046E,	%g7
	udivx	%g3,	0x0B6E,	%i4
	addcc	%g5,	0x02FE,	%g4
	fmovrslz	%i5,	%f11,	%f20
	orncc	%l1,	0x1E9F,	%o4
	for	%f16,	%f18,	%f4
	fblg,a	%fcc1,	loop_1999
	sdivx	%i1,	0x0A4B,	%i6
	fbg	%fcc3,	loop_2000
	movneg	%icc,	%o5,	%l0
loop_1999:
	movvs	%xcc,	%i7,	%l6
	addc	%l4,	0x18F6,	%o2
loop_2000:
	movre	%o1,	%g6,	%l3
	array16	%i3,	%i0,	%o0
	movgu	%xcc,	%g2,	%o3
	xorcc	%o6,	0x17AB,	%o7
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	bleu,a	%icc,	loop_2001
	bneg	%icc,	loop_2002
	movn	%xcc,	%l5,	%g1
	andncc	%l2,	%g7,	%g3
loop_2001:
	fandnot2s	%f21,	%f4,	%f7
loop_2002:
	fandnot2s	%f13,	%f30,	%f19
	udivcc	%i4,	0x1A01,	%i2
	fmuld8ulx16	%f26,	%f27,	%f18
	andcc	%g5,	0x1F2F,	%g4
	ldd	[%l7 + 0x58],	%i4
	lduh	[%l7 + 0x34],	%o4
	flush	%l7 + 0x30
	bneg	loop_2003
	fxnor	%f6,	%f26,	%f22
	set	0x08, %o2
	nop	 ! 	stwa	%i1,	[%l7 + %o2] 0x89 ASI use replaced by convert2hboot
loop_2003:
	edge32l	%i6,	%o5,	%l0
	fmovd	%f16,	%f6
	bgu,a	loop_2004
	udiv	%i7,	0x0314,	%l1
	orncc	%l6,	%l4,	%o1
	fba,a	%fcc1,	loop_2005
loop_2004:
	array32	%g6,	%l3,	%i3
	edge16	%i0,	%o0,	%g2
	fbg	%fcc0,	loop_2006
loop_2005:
	smul	%o3,	%o6,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l5,	%g1
loop_2006:
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	movge	%xcc,	%o2,	%l2
	edge8ln	%g7,	%g3,	%i2
	fmovdcc	%xcc,	%f27,	%f26
	fmovsg	%icc,	%f20,	%f13
	bvs,a	loop_2007
	edge16l	%i4,	%g4,	%i5
	sub	%o4,	%g5,	%i1
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
loop_2007:
	nop
	set	0x10, %i4
	nop	 ! 	ldxa	[%l7 + %i4] 0x11,	%i6 ASI use replaced by convert2hboot
	mova	%xcc,	%l0,	%i7
	fblg	%fcc0,	loop_2008
	sra	%o5,	0x17,	%l1
	ld	[%l7 + 0x3C],	%f12
	fmovse	%xcc,	%f5,	%f12
loop_2008:
	fand	%f28,	%f2,	%f14
	set	0x58, %i2
	nop	 ! 	ldsha	[%l7 + %i2] 0x89,	%l4 ASI use replaced by convert2hboot
	movvc	%icc,	%o1,	%g6
	addc	%l3,	0x0CC5,	%l6
	movgu	%icc,	%i0,	%i3
	edge16n	%o0,	%o3,	%g2
	udivx	%o7,	0x075C,	%o6
	ldsb	[%l7 + 0x7D],	%g1
	add	%l5,	0x1999,	%l2
	stb	%g7,	[%l7 + 0x36]
	edge8n	%o2,	%i2,	%g3
	fmovsa	%icc,	%f3,	%f1
	fxor	%f12,	%f2,	%f0
	orcc	%i4,	%g4,	%o4
	subccc	%i5,	0x04C9,	%g5
	nop 	! 	tl	%xcc,	0x4 changed by convert2hboot
	sth	%i1,	[%l7 + 0x08]
	movne	%icc,	%i6,	%i7
	fsrc2	%f8,	%f6
	edge8n	%l0,	%l1,	%l4
	sll	%o1,	%g6,	%o5
	movne	%xcc,	%l6,	%i0
	wr	%g0,	0x11,	%asi
	srax	%l3,	%o0,	%g2
	addc	%o7,	%o6,	%o3
	fmovsl	%xcc,	%f11,	%f12
	ldsb	[%l7 + 0x75],	%l5
	fmovsle	%icc,	%f22,	%f1
	fornot1	%f0,	%f22,	%f20
	sdivcc	%l2,	0x135C,	%g7
	ldx	[%l7 + 0x50],	%g1
	orncc	%i2,	0x0929,	%o2
	edge8l	%g3,	%i4,	%o4
	orcc	%g4,	0x03F4,	%i5
	fmovsg	%xcc,	%f21,	%f15
	fbo	%fcc0,	loop_2009
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%xcc,	%f16,	%f18
	andn	%i1,	0x1E77,	%g5
loop_2009:
	movvc	%icc,	%i6,	%i7
	edge8n	%l0,	%l4,	%o1
	bcs,pt	%icc,	loop_2010
	edge16ln	%g6,	%l1,	%l6
	fmovrdlz	%o5,	%f10,	%f20
	fmovsneg	%icc,	%f20,	%f9
loop_2010:
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
	edge16	%i3,	%i0,	%o0
	nop 	! 	te	%icc,	0x3 changed by convert2hboot
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x24] %asi,	%f0
	fmovdcs	%icc,	%f31,	%f18
	andcc	%g2,	%o7,	%o6
	fnot1s	%f2,	%f17
	wr	%g0,	0x27,	%asi
	membar	#Sync
	fbul,a	%fcc2,	loop_2011
	prefetch	[%l7 + 0x28],	 0x1
	fpsub32s	%f2,	%f2,	%f6
	bn,a	%icc,	loop_2012
loop_2011:
	movl	%icc,	%o3,	%l5
	set	0x64, %o5
	nop	 ! 	ldstuba	[%l7 + %o5] 0x11,	%g7 ASI use replaced by convert2hboot
loop_2012:
	ldx	[%l7 + 0x20],	%l2
	alignaddrl	%i2,	%o2,	%g1
	movrgez	%g3,	%o4,	%g4
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	bneg,pt	%xcc,	loop_2013
	bvc,a	%icc,	loop_2014
	edge8n	%i5,	%i4,	%i1
	set	0x64, %i1
	nop	 ! 	ldsba	[%l7 + %i1] 0x04,	%i6 ASI use replaced by convert2hboot
loop_2013:
	nop
	setx loop_2015, %l0, %l1
	jmpl %l1, %g5
loop_2014:
	udiv	%l0,	0x004C,	%i7
	or	%l4,	%o1,	%l1
	fnot1	%f8,	%f4
loop_2015:
	nop
	set	0x50, %i0
	std	%f6,	[%l7 + %i0]
	ble,a	%xcc,	loop_2016
	edge16n	%g6,	%l6,	%i3
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	srl	%i0,	0x04,	%o0
loop_2016:
	edge16n	%g2,	%o5,	%o6
	edge16ln	%l3,	%o3,	%o7
	umul	%l5,	%l2,	%i2
	srl	%g7,	0x15,	%o2
	nop
	set	0x08, %o4
	prefetch	[%l7 + %o4],	 0x2
	orn	%g1,	0x18E9,	%g3
	sllx	%o4,	0x19,	%g4
	nop 	! 	taddcc	%i5,	%i4,	%i1 changed by convert2hboot
	fcmpne32	%f14,	%f2,	%g5
	xor	%l0,	%i6,	%l4
	sll	%i7,	%l1,	%o1
	ba,pn	%icc,	loop_2017
	movgu	%icc,	%l6,	%i3
	fbo,a	%fcc0,	loop_2018
	movle	%icc,	%i0,	%g6
loop_2017:
	bcs	loop_2019
	udiv	%o0,	0x11CC,	%g2
loop_2018:
	addccc	%o5,	%o6,	%l3
	udiv	%o7,	0x0E9D,	%l5
loop_2019:
	movneg	%xcc,	%o3,	%i2
	mova	%icc,	%g7,	%l2
	add	%g1,	0x0FB7,	%o2
	std	%o4,	[%l7 + 0x30]
	umul	%g3,	%g4,	%i5
	fcmpne16	%f22,	%f22,	%i1
	membar	#Sync
	set	0x40, %o1
	nop	 ! 	ldda	[%l7 + %o1] 0x17,	%f16 ASI use replaced by convert2hboot
	sub	%g5,	%l0,	%i6
	orcc	%i4,	%l4,	%l1
	call	loop_2020
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x30],	%o0
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
loop_2020:
	nop 	! 	tneg	%xcc,	0x2 changed by convert2hboot
	fandnot2s	%f13,	%f10,	%f1
	xorcc	%l6,	%i3,	%i7
	orn	%g6,	%o0,	%g2
	xor	%i0,	0x002B,	%o5
	brz,a	%l3,	loop_2021
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
	bn	%xcc,	loop_2022
	stx	%o7,	[%l7 + 0x70]
loop_2021:
	fmovsa	%icc,	%f25,	%f29
	edge16	%l5,	%o3,	%o6
loop_2022:
	ldd	[%l7 + 0x28],	%i2
	sll	%g7,	0x10,	%g1
	fble	%fcc3,	loop_2023
	membar	0x04
	bn,pt	%icc,	loop_2024
	fbn	%fcc3,	loop_2025
loop_2023:
	addc	%l2,	%o4,	%o2
	movg	%icc,	%g3,	%i5
loop_2024:
	fbug,a	%fcc1,	loop_2026
loop_2025:
	lduw	[%l7 + 0x6C],	%i1
	fmovdvc	%icc,	%f14,	%f23
	bg,a	%icc,	loop_2027
loop_2026:
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	fmovdneg	%icc,	%f2,	%f0
	umulcc	%g4,	0x083B,	%g5
loop_2027:
	fmovdvs	%xcc,	%f13,	%f29
	umul	%i6,	%i4,	%l4
	popc	%l1,	%l0
	move	%xcc,	%o1,	%l6
	fbo,a	%fcc3,	loop_2028
	fble	%fcc2,	loop_2029
	orncc	%i3,	%g6,	%i7
	nop 	! 	tneg	%icc,	0x0 changed by convert2hboot
loop_2028:
	udivx	%o0,	0x1D67,	%g2
loop_2029:
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	movre	%i0,	%l3,	%o5
	fmovrslez	%l5,	%f19,	%f14
	movneg	%icc,	%o7,	%o3
	umul	%i2,	0x1F68,	%o6
	mulx	%g1,	0x1639,	%l2
	sub	%g7,	%o2,	%o4
	movneg	%icc,	%g3,	%i1
	sdivcc	%i5,	0x0520,	%g4
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	sllx	%g5,	0x0D,	%i4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	nop	 ! 	casxa	[%l6] 0x89,	%l4,	%l1 ASI use replaced by convert2hboot
	popc	0x1C86,	%l0
	nop 	! 	tcc	%icc,	0x1 changed by convert2hboot
	faligndata	%f20,	%f14,	%f18
	nop 	! 	tsubcctv	%i6,	0x00F6,	%o1 changed by convert2hboot
	ldx	[%l7 + 0x18],	%l6
	bpos,pt	%icc,	loop_2030
	nop 	! 	tg	%xcc,	0x0 changed by convert2hboot
	sethi	0x1D53,	%i3
	array16	%i7,	%g6,	%g2
loop_2030:
	udiv	%o0,	0x0E6D,	%i0
	alignaddrl	%o5,	%l3,	%l5
	addc	%o3,	%i2,	%o6
	edge8n	%o7,	%l2,	%g1
	sub	%o2,	%o4,	%g3
	mova	%icc,	%i1,	%i5
	alignaddrl	%g4,	%g7,	%g5
	smul	%i4,	%l1,	%l0
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	xnor	%l4,	0x0F69,	%o1
	fbul	%fcc0,	loop_2031
	ble,pt	%xcc,	loop_2032
	smul	%i6,	%i3,	%i7
	bl,pn	%icc,	loop_2033
loop_2031:
	fmovsvs	%icc,	%f6,	%f9
loop_2032:
	fpadd16s	%f28,	%f24,	%f29
	nop 	! 	tsubcctv	%l6,	%g2,	%o0 changed by convert2hboot
loop_2033:
	movg	%xcc,	%i0,	%o5
	std	%g6,	[%l7 + 0x30]
	nop 	! 	taddcc	%l3,	%o3,	%l5 changed by convert2hboot
	movge	%icc,	%i2,	%o6
	fone	%f28
	flush	%l7 + 0x14
	sll	%l2,	%g1,	%o7
	orncc	%o2,	0x16FA,	%o4
	stw	%i1,	[%l7 + 0x78]
	addcc	%g3,	0x0C5B,	%g4
	fmovsg	%xcc,	%f2,	%f13
	fpadd16	%f22,	%f22,	%f6
	sra	%g7,	0x08,	%g5
	fmul8x16al	%f13,	%f25,	%f12
	fcmpeq16	%f22,	%f28,	%i4
	fnot2	%f18,	%f16
	edge16	%l1,	%l0,	%i5
	std	%l4,	[%l7 + 0x10]
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
	movcs	%icc,	%i6,	%i3
	ba,a,pn	%xcc,	loop_2034
	std	%f30,	[%l7 + 0x40]
	fnegd	%f2,	%f18
	edge32ln	%i7,	%l6,	%g2
loop_2034:
	fandnot2s	%f24,	%f27,	%f17
	sllx	%o1,	%o0,	%o5
	fmovrsne	%g6,	%f14,	%f1
	fbuge,a	%fcc3,	loop_2035
	nop 	! 	tneg	%icc,	0x5 changed by convert2hboot
	movg	%icc,	%l3,	%o3
	orcc	%i0,	0x07B2,	%i2
loop_2035:
	nop 	! 	tleu	%xcc,	0x6 changed by convert2hboot
	set	0x5C, %i7
	nop	 ! 	stba	%l5,	[%l7 + %i7] 0xe2 ASI use replaced by convert2hboot
	membar	#Sync
	fmovdvc	%icc,	%f31,	%f19
	wr	%g0,	0x88,	%asi
	fbule,a	%fcc0,	loop_2036
	edge16	%l2,	%o7,	%g1
	array16	%o4,	%i1,	%g3
	alignaddr	%o2,	%g4,	%g5
loop_2036:
	movpos	%xcc,	%g7,	%l1
	move	%icc,	%l0,	%i5
	bcs,a	%xcc,	loop_2037
	subcc	%l4,	%i4,	%i6
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	xorcc	%i3,	0x0D07,	%i7
loop_2037:
	or	%g2,	0x0D78,	%l6
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	movneg	%xcc,	%o1,	%o5
	srl	%g6,	%o0,	%l3
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	move	%icc,	%o3,	%i0
	movge	%xcc,	%l5,	%o6
	sll	%i2,	%o7,	%l2
	sdivcc	%g1,	0x0E3F,	%i1
	ldd	[%l7 + 0x60],	%f16
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
	fmovrdlez	%o4,	%f20,	%f0
	mulx	%g3,	%o2,	%g5
	nop
	set	0x71, %o6
	stb	%g4,	[%l7 + %o6]
	fmovdn	%icc,	%f0,	%f21
	fmovdge	%icc,	%f7,	%f8
	move	%xcc,	%g7,	%l1
	bn,a	loop_2038
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
	set	0x40, %l0
	nop	 ! 	stda	%f16,	[%l7 + %l0] 0x04 ASI use replaced by convert2hboot
loop_2038:
	fmovscc	%xcc,	%f21,	%f0
	movcc	%icc,	%l0,	%i5
	orn	%i4,	0x1AEE,	%i6
	nop
	setx	loop_2039,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	bcs,a,pt	%xcc,	loop_2040
	movrlz	%l4,	%i7,	%g2
	fmovdl	%xcc,	%f22,	%f14
loop_2039:
	fcmpne16	%f6,	%f8,	%l6
loop_2040:
	movne	%icc,	%o1,	%o5
	nop 	! 	tge	%icc,	0x6 changed by convert2hboot
	movleu	%icc,	%g6,	%o0
	sllx	%l3,	0x0A,	%o3
	set	0x12, %i5
	nop	 ! 	stha	%i0,	[%l7 + %i5] 0xe2 ASI use replaced by convert2hboot
	membar	#Sync
	fpsub16s	%f0,	%f5,	%f8
	movrlz	%l5,	0x3CA,	%o6
	ldsh	[%l7 + 0x36],	%i2
	movleu	%icc,	%i3,	%o7
	movpos	%xcc,	%g1,	%i1
	sdivx	%l2,	0x1F74,	%o4
	array8	%g3,	%o2,	%g4
	set	0x24, %o7
	sta	%f26,	[%l7 + %o7] 0x19
	fbule,a	%fcc2,	loop_2041
	edge16	%g5,	%l1,	%l0
	movge	%icc,	%g7,	%i4
	membar	0x76
loop_2041:
	std	%i4,	[%l7 + 0x30]
	edge8l	%i6,	%i7,	%l4
	movrlez	%g2,	0x144,	%l6
	movvc	%icc,	%o5,	%o1
	sethi	0x0274,	%o0
	movrgez	%g6,	0x01B,	%l3
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	wr	%g0,	0x2a,	%asi
	membar	#Sync
	fcmple16	%f16,	%f26,	%l5
	fmovrdgez	%o3,	%f16,	%f18
	nop 	! 	tsubcc	%i2,	0x0AC0,	%i3 changed by convert2hboot
	brlz,a	%o7,	loop_2042
	fmovrdlez	%g1,	%f28,	%f2
	fmul8x16al	%f8,	%f18,	%f0
	set	0x110, %o3
	nop	 ! 	stxa	%o6,	[%g0 + %o3] 0x21 ASI use replaced by convert2hboot
loop_2042:
	fbule,a	%fcc0,	loop_2043
	fsrc1s	%f2,	%f1
	swap	[%l7 + 0x24],	%i1
	edge16ln	%l2,	%o4,	%g3
loop_2043:
	srax	%g4,	%g5,	%o2
	movcc	%icc,	%l1,	%g7
	edge8ln	%l0,	%i4,	%i6
	wr	%g0,	0x89,	%asi
	movpos	%icc,	%i5,	%g2
	std	%i6,	[%l7 + 0x08]
	ldsb	[%l7 + 0x34],	%o5
	fmovrse	%l4,	%f22,	%f10
	alignaddrl	%o1,	%g6,	%o0
	ldub	[%l7 + 0x20],	%i0
	set	0x7C, %g7
	nop	 ! 	swapa	[%l7 + %g7] 0x19,	%l3 ASI use replaced by convert2hboot
	udivx	%l5,	0x154B,	%i2
	fcmple16	%f26,	%f24,	%i3
	movrlz	%o7,	%o3,	%g1
	fones	%f15
	nop 	! 	tgu	%icc,	0x4 changed by convert2hboot
	bcc,a	%icc,	loop_2044
	edge8	%i1,	%o6,	%o4
	prefetch	[%l7 + 0x58],	 0x2
	bpos,a	%icc,	loop_2045
loop_2044:
	prefetch	[%l7 + 0x34],	 0x1
	fmovrdgez	%g3,	%f16,	%f28
	andcc	%g4,	%l2,	%g5
loop_2045:
	addcc	%l1,	0x0D10,	%o2
	ba	%icc,	loop_2046
	fbn	%fcc1,	loop_2047
	sdivcc	%l0,	0x100B,	%g7
	nop
	setx loop_2048, %l0, %l1
	jmpl %l1, %i4
loop_2046:
	edge32ln	%i7,	%i6,	%g2
loop_2047:
	fornot1	%f4,	%f20,	%f28
	fmovrdgez	%i5,	%f18,	%f0
loop_2048:
	nop
	setx loop_2049, %l0, %l1
	jmpl %l1, %l6
	bne,a,pn	%icc,	loop_2050
	be	loop_2051
	fzero	%f28
loop_2049:
	fmovrdne	%o5,	%f16,	%f30
loop_2050:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2051:
	movgu	%icc,	%o1,	%g6
	movrgz	%o0,	0x08B,	%l4
	addc	%i0,	%l3,	%l5
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%i2
	orcc	%o7,	0x0D3D,	%i2
	fbe,a	%fcc3,	loop_2052
	xor	%g1,	%o3,	%o6
	nop 	! 	tl	%xcc,	0x4 changed by convert2hboot
	mulscc	%o4,	0x13B0,	%i1
loop_2052:
	nop 	! 	tn	%xcc,	0x5 changed by convert2hboot
	ba,a	%xcc,	loop_2053
	ldd	[%l7 + 0x50],	%g4
	set	0x54, %l6
	nop	 ! 	lduba	[%l7 + %l6] 0x19,	%g3 ASI use replaced by convert2hboot
loop_2053:
	fornot1	%f24,	%f20,	%f14
	fzero	%f22
	xnorcc	%l2,	0x1014,	%g5
	movrlez	%o2,	0x3AA,	%l1
	bgu,a,pn	%xcc,	loop_2054
	fpsub32s	%f5,	%f31,	%f20
	umul	%l0,	%i4,	%g7
	nop
	set	0x30, %l3
	stx	%i7,	[%l7 + %l3]
loop_2054:
	movn	%icc,	%g2,	%i5
	stw	%l6,	[%l7 + 0x64]
	array8	%o5,	%i6,	%g6
	fmovdg	%icc,	%f31,	%f30
	edge16ln	%o0,	%l4,	%i0
	wr	%g0,	0x81,	%asi
	sll	%l5,	0x09,	%i3
	stx	%l3,	[%l7 + 0x18]
	nop 	! 	tsubcc	%i2,	0x0C98,	%g1 changed by convert2hboot
	fnor	%f8,	%f14,	%f4
	ldub	[%l7 + 0x08],	%o3
	fmovsne	%xcc,	%f20,	%f14
	fmuld8sux16	%f15,	%f11,	%f24
	srlx	%o7,	%o4,	%o6
	fbule	%fcc2,	loop_2055
	add	%i1,	0x1F2A,	%g3
	subccc	%l2,	%g4,	%g5
	nop 	! 	tvs	%xcc,	0x4 changed by convert2hboot
loop_2055:
	fpackfix	%f12,	%f28
	fbug,a	%fcc2,	loop_2056
	fmovrde	%o2,	%f28,	%f28
	fmovscs	%xcc,	%f0,	%f12
	fpsub16s	%f29,	%f9,	%f19
loop_2056:
	nop 	! 	tcc	%xcc,	0x7 changed by convert2hboot
	set	0x28, %l4
	nop	 ! 	prefetcha	[%l7 + %l4] 0x15,	 0x1 ASI use replaced by convert2hboot
	fabsd	%f2,	%f16
	srlx	%i4,	0x14,	%l0
	sub	%g7,	%g2,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	pdist	%f16,	%f0,	%f2
	fxors	%f1,	%f10,	%f10
	srax	%l6,	0x1F,	%o5
	movvc	%xcc,	%i7,	%i6
	edge16n	%g6,	%o0,	%l4
	xnor	%i0,	0x190F,	%l5
	for	%f2,	%f12,	%f2
	sdivcc	%o1,	0x0B03,	%i3
	std	%i2,	[%l7 + 0x10]
	movneg	%icc,	%g1,	%o3
	fcmped	%fcc2,	%f24,	%f8
	andncc	%l3,	%o4,	%o6
	addcc	%o7,	0x02A6,	%g3
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	umulcc	%i1,	0x15FA,	%l2
	movge	%xcc,	%g4,	%o2
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	brgez	%l1,	loop_2057
	movcs	%icc,	%i4,	%g5
	fmovrslez	%g7,	%f14,	%f29
	bpos,pn	%icc,	loop_2058
loop_2057:
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	nop 	! 	tsubcctv	%g2,	0x1D39,	%i5 changed by convert2hboot
loop_2058:
	movcc	%icc,	%l0,	%l6
	nop 	! 	taddcc	%o5,	%i6,	%g6 changed by convert2hboot
	brgz,a	%o0,	loop_2059
	movre	%i7,	%l4,	%i0
	srax	%l5,	%i3,	%o1
	fzero	%f16
loop_2059:
	fmovrsgz	%g1,	%f11,	%f18
	srl	%o3,	%i2,	%l3
	array32	%o4,	%o7,	%o6
	ldsw	[%l7 + 0x34],	%i1
	fmovdleu	%xcc,	%f4,	%f9
	sdivcc	%l2,	0x15F3,	%g4
	fcmps	%fcc3,	%f9,	%f11
	array16	%g3,	%o2,	%i4
	fpack16	%f20,	%f1
	mova	%xcc,	%g5,	%l1
	popc	0x0671,	%g7
	edge8	%i5,	%g2,	%l6
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	sub	%l0,	%i6,	%g6
	fmul8x16	%f27,	%f28,	%f8
	movrgz	%o0,	0x267,	%i7
	fmul8ulx16	%f16,	%f16,	%f0
	nop
	setx	loop_2060,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	xnorcc	%o5,	%l4,	%l5
	movrlez	%i0,	0x296,	%i3
	or	%o1,	%g1,	%o3
loop_2060:
	xnorcc	%i2,	0x1B79,	%o4
	set	0x31, %l1
	nop	 ! 	ldstuba	[%l7 + %l1] 0x88,	%l3 ASI use replaced by convert2hboot
	fmovdn	%icc,	%f21,	%f18
	edge32	%o6,	%o7,	%l2
	nop 	! 	taddcc	%i1,	0x0E83,	%g4 changed by convert2hboot
	fcmpgt32	%f16,	%f20,	%g3
	edge16	%i4,	%g5,	%l1
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%f14
	bneg,a,pn	%icc,	loop_2061
	addc	%o2,	%g7,	%i5
	bne,a,pt	%icc,	loop_2062
	sllx	%l6,	0x06,	%g2
loop_2061:
	fmovsvc	%xcc,	%f17,	%f14
	nop
	setx	loop_2063,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_2062:
	ldub	[%l7 + 0x58],	%i6
	xor	%g6,	%l0,	%o0
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x44] %asi,	%f11
loop_2063:
	fzero	%f8
	addc	%o5,	%i7,	%l4
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
	subccc	%l5,	%i0,	%o1
	movrlez	%g1,	0x00F,	%o3
	brgez	%i3,	loop_2064
	ldsh	[%l7 + 0x46],	%i2
	pdist	%f6,	%f16,	%f24
	fbue,a	%fcc1,	loop_2065
loop_2064:
	andn	%l3,	0x13DB,	%o6
	edge8n	%o7,	%l2,	%o4
	bge,pn	%icc,	loop_2066
loop_2065:
	movleu	%xcc,	%g4,	%i1
	fbg	%fcc2,	loop_2067
	fands	%f12,	%f28,	%f27
loop_2066:
	bgu,a,pt	%xcc,	loop_2068
	nop 	! 	taddcc	%i4,	0x1469,	%g3 changed by convert2hboot
loop_2067:
	fmovrdlz	%l1,	%f28,	%f6
	and	%g5,	%o2,	%g7
loop_2068:
	fcmpeq32	%f20,	%f18,	%i5
	nop 	! 	tgu	%icc,	0x1 changed by convert2hboot
	udivcc	%g2,	0x0609,	%i6
	srax	%g6,	%l0,	%o0
	wr	%g0,	0xeb,	%asi
	membar	#Sync
	fmovscc	%icc,	%f14,	%f31
	fmovda	%xcc,	%f15,	%f18
	orcc	%l6,	0x16B9,	%l4
	movleu	%xcc,	%i7,	%l5
	fmovspos	%xcc,	%f28,	%f16
	nop 	! 	tneg	%icc,	0x5 changed by convert2hboot
	fxors	%f30,	%f9,	%f7
	fmovsa	%xcc,	%f17,	%f17
	nop 	! 	sir	0x0F66 changed by convert2hboot
	nop
	set	0x58, %g1
	ldub	[%l7 + %g1],	%o1
	or	%i0,	%g1,	%o3
	nop 	! 	taddcc	%i3,	%i2,	%l3 changed by convert2hboot
	movcc	%icc,	%o6,	%l2
	sra	%o4,	%g4,	%i1
	fmuld8sux16	%f27,	%f22,	%f22
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
	fbuge	%fcc2,	loop_2069
	movrgez	%o7,	0x102,	%i4
	fmovsgu	%icc,	%f18,	%f29
	edge32	%l1,	%g3,	%g5
loop_2069:
	call	loop_2070
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	mova	%icc,	%o2,	%i5
	wr	%g0,	0x50,	%asi
loop_2070:
	fnot1s	%f1,	%f3
	orn	%i6,	%g6,	%l0
	fandnot1s	%f21,	%f17,	%f26
	srl	%g7,	0x15,	%o0
	bshuffle	%f24,	%f6,	%f2
	add	%o5,	0x05FD,	%l6
	movcs	%icc,	%i7,	%l5
	stx	%l4,	[%l7 + 0x20]
	brlez,a	%o1,	loop_2071
	nop 	! 	te	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
	nop
	setx	loop_2072,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_2071:
	fbge,a	%fcc1,	loop_2073
	fmul8x16	%f20,	%f20,	%f18
	membar	0x5D
loop_2072:
	edge32l	%i0,	%o3,	%g1
loop_2073:
	fnot1	%f8,	%f2
	sub	%i3,	%l3,	%o6
	fmuld8sux16	%f20,	%f2,	%f22
	pdist	%f30,	%f30,	%f12
	fmovscc	%icc,	%f7,	%f10
	stb	%l2,	[%l7 + 0x1F]
	lduh	[%l7 + 0x20],	%i2
	nop 	! 	sir	0x0A09 changed by convert2hboot
	movle	%xcc,	%g4,	%i1
	fpack16	%f2,	%f1
	subcc	%o4,	0x04E9,	%i4
	fmovsge	%icc,	%f11,	%f31
	brlez	%o7,	loop_2074
	fmovrdgz	%l1,	%f16,	%f24
	call	loop_2075
	sll	%g3,	%o2,	%g5
loop_2074:
	movrlez	%g2,	%i5,	%i6
	set	0x38, %g4
	nop	 ! 	prefetcha	[%l7 + %g4] 0x04,	 0x1 ASI use replaced by convert2hboot
loop_2075:
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
	fbge,a	%fcc0,	loop_2076
	orcc	%g7,	%g6,	%o5
	sll	%l6,	%i7,	%l5
	movn	%icc,	%l4,	%o1
loop_2076:
	nop 	! 	ta	%xcc,	0x1 changed by convert2hboot
	ldsb	[%l7 + 0x5D],	%o0
	membar	0x49
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o3,	%i0,	%g1
	movrlz	%l3,	0x3C2,	%i3
	nop 	! 	taddcc	%l2,	%o6,	%g4 changed by convert2hboot
	edge32l	%i1,	%i2,	%i4
	set	0x3D, %g6
	nop	 ! 	ldsba	[%l7 + %g6] 0x88,	%o7 ASI use replaced by convert2hboot
	movvc	%xcc,	%o4,	%l1
	fbg,a	%fcc0,	loop_2077
	movn	%icc,	%o2,	%g3
	mulx	%g2,	0x0C54,	%i5
	fmovsle	%icc,	%f8,	%f1
loop_2077:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i6,	[%l7 + 0x79]
	wr	%g0,	0x2b,	%asi
	movcs	%xcc,	%g7,	%g6
	fmovdvs	%icc,	%f16,	%f1
	bcc,a,pt	%xcc,	loop_2078
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	movvc	%xcc,	%o5,	%g5
	set	0x6C, %g5
	nop	 ! 	stha	%l6,	[%l7 + %g5] 0x14 ASI use replaced by convert2hboot
loop_2078:
	fmovdg	%xcc,	%f31,	%f8
	edge32ln	%i7,	%l5,	%o1
	edge16	%o0,	%o3,	%l4
	edge32	%g1,	%l3,	%i0
	stb	%l2,	[%l7 + 0x5A]
	bcs	loop_2079
	nop 	! 	taddcctv	%o6,	%i3,	%i1 changed by convert2hboot
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	bl	loop_2080
loop_2079:
	movneg	%icc,	%g4,	%i2
	orncc	%i4,	0x1C65,	%o7
	bl,a	loop_2081
loop_2080:
	movl	%icc,	%l1,	%o2
	movgu	%xcc,	%g3,	%g2
	fmovsne	%icc,	%f2,	%f14
loop_2081:
	nop 	! 	taddcctv	%i5,	0x1ECC,	%i6 changed by convert2hboot
	movpos	%xcc,	%l0,	%o4
	fpadd16s	%f29,	%f21,	%f13
	fbo	%fcc1,	loop_2082
	nop 	! 	tle	%xcc,	0x0 changed by convert2hboot
	be,a	%xcc,	loop_2083
	fmovsvs	%icc,	%f8,	%f31
loop_2082:
	orncc	%g6,	%o5,	%g5
	srl	%g7,	%i7,	%l5
loop_2083:
	fandnot2	%f10,	%f14,	%f28
	srax	%l6,	%o0,	%o1
	bge	%icc,	loop_2084
	movvc	%icc,	%o3,	%g1
	sdivx	%l3,	0x0C9D,	%i0
	fnor	%f0,	%f24,	%f6
loop_2084:
	mulscc	%l4,	%o6,	%i3
	ldstub	[%l7 + 0x57],	%i1
	fnot2	%f14,	%f4
	fones	%f3
	ldd	[%l7 + 0x50],	%l2
	udivx	%g4,	0x13B2,	%i4
	sllx	%i2,	0x02,	%l1
	sub	%o7,	%o2,	%g2
	fmovsn	%xcc,	%f25,	%f12
	sllx	%g3,	%i5,	%i6
	xnor	%l0,	%g6,	%o4
	subc	%g5,	%g7,	%o5
	nop 	! 	ta	%xcc,	0x5 changed by convert2hboot
	alignaddr	%l5,	%l6,	%o0
	addcc	%i7,	%o1,	%o3
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
	ld	[%l7 + 0x10],	%f7
	add	%l3,	0x17EE,	%i0
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
	brgez,a	%g1,	loop_2085
	sdivx	%l4,	0x00E3,	%i3
	movl	%xcc,	%i1,	%l2
	movl	%xcc,	%o6,	%g4
loop_2085:
	fnors	%f5,	%f13,	%f8
	set	0x45, %l5
	nop	 ! 	ldsba	[%l7 + %l5] 0x10,	%i4 ASI use replaced by convert2hboot
	orncc	%l1,	0x1EB1,	%i2
	fble,a	%fcc0,	loop_2086
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	mulx	%o2,	0x1EFA,	%g2
	movcs	%icc,	%g3,	%o7
loop_2086:
	fmovsle	%icc,	%f4,	%f13
	fmovdl	%icc,	%f29,	%f17
	fornot2	%f14,	%f0,	%f26
	fbo	%fcc0,	loop_2087
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	popc	%i6,	%i5
	movcs	%xcc,	%l0,	%g6
loop_2087:
	fbo,a	%fcc0,	loop_2088
	orn	%g5,	0x02F3,	%o4
	sdivx	%g7,	0x0CD7,	%o5
	fbug	%fcc0,	loop_2089
loop_2088:
	srlx	%l5,	%l6,	%i7
	fbug,a	%fcc1,	loop_2090
	sra	%o0,	0x0B,	%o1
loop_2089:
	and	%l3,	0x0633,	%i0
	std	%g0,	[%l7 + 0x20]
loop_2090:
	fbn	%fcc1,	loop_2091
	mova	%xcc,	%l4,	%i3
	bleu,a	loop_2092
	ble,a	%icc,	loop_2093
loop_2091:
	smulcc	%i1,	%l2,	%o6
	bg,pn	%icc,	loop_2094
loop_2092:
	edge8l	%o3,	%i4,	%g4
loop_2093:
	smul	%i2,	0x1124,	%l1
	andn	%o2,	%g3,	%g2
loop_2094:
	movvc	%xcc,	%i6,	%i5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	nop	 ! 	casxa	[%l6] 0x19,	%l0,	%g6 ASI use replaced by convert2hboot
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	movrne	%g5,	%o4,	%o7
	array8	%o5,	%g7,	%l5
	edge16n	%l6,	%i7,	%o1
	movrgz	%o0,	%l3,	%i0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x10,	%asi
	nop	 ! 	casxa	[%l6] 0x10,	%l4,	%i3 ASI use replaced by convert2hboot
	fcmple16	%f10,	%f0,	%g1
	nop 	! 	tleu	%xcc,	0x2 changed by convert2hboot
	fba	%fcc3,	loop_2095
	bvc,a,pt	%icc,	loop_2096
	bcc,a	loop_2097
	mova	%xcc,	%l2,	%i1
loop_2095:
	nop 	! 	taddcc	%o6,	%o3,	%i4 changed by convert2hboot
loop_2096:
	srl	%i2,	0x16,	%l1
loop_2097:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%o2,	[%l7 + 0x20]
	ldsb	[%l7 + 0x2D],	%g3
	fmovrde	%g4,	%f24,	%f14
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	bl	loop_2098
	movl	%icc,	%i6,	%g2
	sdivx	%l0,	0x050A,	%i5
	orn	%g5,	0x0236,	%g6
loop_2098:
	subcc	%o7,	%o4,	%g7
	call	loop_2099
	movrgz	%o5,	0x2B4,	%l6
	smul	%i7,	0x18B7,	%o1
	srl	%o0,	0x13,	%l3
loop_2099:
	movneg	%xcc,	%i0,	%l4
	subcc	%i3,	%g1,	%l5
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	wr	%g0,	0x2b,	%asi
	membar	#Sync
	fbue,a	%fcc2,	loop_2100
	fmovscs	%icc,	%f30,	%f18
	fmovdvc	%xcc,	%f19,	%f17
	edge32ln	%o6,	%o3,	%i1
loop_2100:
	fble,a	%fcc1,	loop_2101
	xnorcc	%i2,	0x053A,	%i4
	sdivx	%l1,	0x0CE1,	%o2
	fsrc1s	%f30,	%f27
loop_2101:
	andcc	%g4,	0x0C03,	%g3
	fcmpd	%fcc2,	%f20,	%f26
	edge16ln	%g2,	%i6,	%i5
	fbl,a	%fcc0,	loop_2102
	fmovsn	%icc,	%f18,	%f20
	movcc	%xcc,	%g5,	%l0
	edge16ln	%g6,	%o7,	%o4
loop_2102:
	sllx	%g7,	0x0C,	%o5
	movle	%xcc,	%l6,	%o1
	set	0x18, %g3
	nop	 ! 	stxa	%o0,	[%l7 + %g3] 0x14 ASI use replaced by convert2hboot
	movcs	%icc,	%i7,	%i0
	movrne	%l4,	%i3,	%l3
	xor	%l5,	%l2,	%o6
	srl	%g1,	%o3,	%i1
	smulcc	%i4,	%l1,	%i2
	movrne	%o2,	0x196,	%g4
	edge8ln	%g3,	%g2,	%i6
	edge16n	%g5,	%i5,	%g6
	mova	%icc,	%l0,	%o7
	addc	%o4,	0x1D55,	%o5
	fnor	%f12,	%f4,	%f4
	array32	%l6,	%g7,	%o0
	xnorcc	%o1,	%i7,	%i0
	ldd	[%l7 + 0x70],	%l4
	subc	%l3,	0x1175,	%l5
	xorcc	%i3,	0x0D12,	%o6
	nop
	setx loop_2103, %l0, %l1
	jmpl %l1, %g1
	nop 	! 	tleu	%icc,	0x6 changed by convert2hboot
	sethi	0x163D,	%o3
	bge	loop_2104
loop_2103:
	fnands	%f19,	%f8,	%f29
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	set	0x40, %o0
	nop	 ! 	stda	%f0,	[%l7 + %o0] 0x18 ASI use replaced by convert2hboot
loop_2104:
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	wr	%g0,	0x23,	%asi
	membar	#Sync
	orcc	%i4,	0x1F69,	%l1
	fnegs	%f0,	%f2
	sub	%l2,	%i2,	%o2
	fbn	%fcc1,	loop_2105
	fmovdgu	%xcc,	%f9,	%f5
	fmovde	%xcc,	%f20,	%f31
	bcs,a	%icc,	loop_2106
loop_2105:
	fnegs	%f25,	%f17
	swap	[%l7 + 0x54],	%g3
	movrgz	%g4,	%i6,	%g5
loop_2106:
	addccc	%i5,	%g2,	%g6
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	sta	%f22,	[%l7 + 0x34] %asi
	set	0x28, %i6
	nop	 ! 	stda	%l0,	[%l7 + %i6] 0x88 ASI use replaced by convert2hboot
	sth	%o7,	[%l7 + 0x7E]
	fsrc1	%f20,	%f30
	set	0x21, %g2
	nop	 ! 	stba	%o4,	[%l7 + %g2] 0x88 ASI use replaced by convert2hboot
	bg,a	%xcc,	loop_2107
	fmovsne	%xcc,	%f21,	%f26
	fsrc1	%f0,	%f4
	movrne	%l6,	0x162,	%o5
loop_2107:
	edge16ln	%o0,	%o1,	%g7
	smulcc	%i0,	%l4,	%i7
	smulcc	%l5,	0x0005,	%l3
	fsrc2s	%f18,	%f14
	nop 	! 	taddcctv	%o6,	%i3,	%g1 changed by convert2hboot
	movge	%icc,	%i1,	%i4
	sdivx	%l1,	0x18F1,	%o3
	nop 	! 	sir	0x0170 changed by convert2hboot
	siam	0x7
	movg	%xcc,	%l2,	%i2
	fblg,a	%fcc3,	loop_2108
	bn	%icc,	loop_2109
	movcs	%icc,	%o2,	%g3
	edge16l	%i6,	%g4,	%g5
loop_2108:
	edge16n	%i5,	%g6,	%g2
loop_2109:
	bn,pn	%icc,	loop_2110
	fmovrslez	%o7,	%f31,	%f16
	fbl	%fcc0,	loop_2111
	fmovrslz	%o4,	%f7,	%f1
loop_2110:
	nop 	! 	ta	%icc,	0x7 changed by convert2hboot
	alignaddr	%l0,	%l6,	%o5
loop_2111:
	array16	%o0,	%o1,	%g7
	fbue	%fcc3,	loop_2112
	fpadd32	%f2,	%f12,	%f12
	subcc	%l4,	0x0BAE,	%i7
	udivx	%i0,	0x06F2,	%l3
loop_2112:
	movrlez	%l5,	0x032,	%i3
	brlz	%o6,	loop_2113
	xnorcc	%i1,	%i4,	%g1
	stx	%l1,	[%l7 + 0x08]
	bleu,pt	%icc,	loop_2114
loop_2113:
	movrgz	%o3,	0x0B4,	%i2
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	move	%xcc,	%o2,	%l2
loop_2114:
	membar	0x56
	sub	%i6,	0x152F,	%g3
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	movrne	%g4,	0x266,	%g5
	sra	%g6,	0x10,	%i5
	nop 	! 	tsubcc	%o7,	0x1A26,	%o4 changed by convert2hboot
	xnor	%l0,	%l6,	%o5
	udiv	%o0,	0x1FDE,	%o1
	subcc	%g7,	0x0936,	%l4
	fmovsl	%xcc,	%f27,	%f30
	srax	%i7,	%i0,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l5,	%g2,	%o6
	bg,pt	%icc,	loop_2115
	sth	%i1,	[%l7 + 0x36]
	fnot2s	%f12,	%f13
	edge16	%i3,	%i4,	%l1
loop_2115:
	srl	%o3,	%i2,	%o2
	fmovrdlez	%l2,	%f30,	%f24
	fsrc2s	%f26,	%f8
	sdivx	%g1,	0x1077,	%g3
	mulscc	%g4,	0x17E9,	%i6
	nop 	! 	tgu	%xcc,	0x4 changed by convert2hboot
	and	%g6,	%g5,	%i5
	addc	%o7,	0x069E,	%o4
	fble,a	%fcc3,	loop_2116
	movl	%xcc,	%l0,	%o5
	array32	%o0,	%o1,	%l6
	edge8ln	%l4,	%g7,	%i0
loop_2116:
	fble	%fcc2,	loop_2117
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
	andcc	%l3,	%l5,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2117:
	movvc	%icc,	%g2,	%o6
	nop 	! 	tsubcc	%i1,	%i4,	%i3 changed by convert2hboot
	movcc	%icc,	%l1,	%o3
	mulx	%i2,	0x03D8,	%o2
	nop
	setx loop_2118, %l0, %l1
	jmpl %l1, %l2
	xor	%g1,	0x11BD,	%g4
	brlz	%g3,	loop_2119
	movpos	%icc,	%i6,	%g5
loop_2118:
	addc	%i5,	%o7,	%g6
	bn,a,pt	%xcc,	loop_2120
loop_2119:
	edge8l	%o4,	%o5,	%o0
	be,a	loop_2121
	ldsw	[%l7 + 0x44],	%l0
loop_2120:
	ldsb	[%l7 + 0x7B],	%o1
	orn	%l4,	0x00BA,	%l6
loop_2121:
	lduw	[%l7 + 0x50],	%g7
	movcc	%icc,	%i0,	%l5
	fba,a	%fcc1,	loop_2122
	movcc	%icc,	%i7,	%l3
	nop 	! 	taddcc	%o6,	0x116B,	%g2 changed by convert2hboot
	mova	%xcc,	%i1,	%i3
loop_2122:
	nop 	! 	tg	%xcc,	0x5 changed by convert2hboot
	wr	%g0,	0x27,	%asi
	smul	%l1,	0x154C,	%i2
	fmovrde	%o3,	%f2,	%f0
	lduh	[%l7 + 0x3C],	%l2
	ldub	[%l7 + 0x20],	%o2
	fmovsle	%icc,	%f27,	%f25
	brz	%g4,	loop_2123
	movre	%g1,	0x2C8,	%i6
	fmovsleu	%icc,	%f12,	%f29
	edge16	%g3,	%i5,	%o7
loop_2123:
	addccc	%g5,	%o4,	%o5
	nop 	! 	te	%icc,	0x3 changed by convert2hboot
	udivcc	%o0,	0x0D7E,	%l0
	wr	%g0,	0x18,	%asi
	subccc	%o1,	%l6,	%l4
	edge32l	%i0,	%g7,	%i7
	movge	%icc,	%l5,	%o6
	fmovsa	%xcc,	%f31,	%f26
	pdist	%f18,	%f0,	%f30
	umul	%g2,	0x1435,	%l3
	wr	%g0,	0x22,	%asi
	membar	#Sync
	edge8	%i4,	%i3,	%i2
	bshuffle	%f26,	%f14,	%f8
	nop 	! 	tleu	%icc,	0x7 changed by convert2hboot
	srl	%o3,	0x0B,	%l2
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
	movne	%icc,	%l1,	%g4
	movrgz	%g1,	%o2,	%g3
	movcc	%xcc,	%i6,	%o7
	fornot2s	%f31,	%f12,	%f7
	sll	%g5,	0x1A,	%o4
	nop 	! 	sir	0x0800 changed by convert2hboot
	nop 	! 	sir	0x0AC6 changed by convert2hboot
	subccc	%i5,	0x1C0B,	%o0
	subc	%o5,	%l0,	%o1
	movcc	%icc,	%l6,	%l4
	movn	%icc,	%g6,	%i0
	fbo,a	%fcc2,	loop_2124
	popc	%g7,	%l5
	smul	%o6,	%g2,	%l3
	ldub	[%l7 + 0x52],	%i7
loop_2124:
	fnot1s	%f13,	%f16
	fbuge,a	%fcc1,	loop_2125
	edge8n	%i1,	%i3,	%i2
	bne,pt	%icc,	loop_2126
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2125:
	addcc	%o3,	%i4,	%l1
	edge32n	%g4,	%g1,	%l2
loop_2126:
	fmovdl	%xcc,	%f7,	%f26
	set	0x30, %i4
	nop	 ! 	ldda	[%l7 + %i4] 0x15,	%o2 ASI use replaced by convert2hboot
	fbule,a	%fcc1,	loop_2127
	fornot2	%f14,	%f14,	%f8
	movn	%icc,	%g3,	%i6
	addcc	%g5,	0x0784,	%o7
loop_2127:
	edge16	%o4,	%i5,	%o0
	addcc	%l0,	%o1,	%o5
	fandnot2	%f10,	%f0,	%f16
	wr	%g0,	0x0c,	%asi
	st	%f5,	[%l7 + 0x7C]
	fmul8x16au	%f3,	%f30,	%f16
	brgez,a	%l4,	loop_2128
	ble,pn	%icc,	loop_2129
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	stw	%g6,	[%l7 + 0x38]
loop_2128:
	nop 	! 	tsubcc	%i0,	%l5,	%g7 changed by convert2hboot
loop_2129:
	brlez,a	%o6,	loop_2130
	orncc	%g2,	%i7,	%i1
	ldstub	[%l7 + 0x08],	%l3
	flush	%l7 + 0x68
loop_2130:
	bshuffle	%f14,	%f24,	%f26
	movne	%icc,	%i3,	%i2
	movleu	%icc,	%o3,	%l1
	fbo,a	%fcc0,	loop_2131
	nop
	setx	loop_2132,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fand	%f18,	%f8,	%f6
	fmovsn	%icc,	%f20,	%f1
loop_2131:
	nop
	wr	%g0,	0x11,	%asi
loop_2132:
	fmovrdgez	%g1,	%f16,	%f28
	smul	%g4,	%l2,	%o2
	sllx	%g3,	%g5,	%i6
	movg	%xcc,	%o7,	%o4
	movpos	%xcc,	%i5,	%l0
	ldx	[%l7 + 0x68],	%o1
	edge32l	%o0,	%o5,	%l4
	edge8	%l6,	%i0,	%l5
	movvs	%icc,	%g7,	%g6
	nop 	! 	tge	%icc,	0x4 changed by convert2hboot
	std	%f28,	[%l7 + 0x40]
	andn	%g2,	%i7,	%i1
	fbul,a	%fcc2,	loop_2133
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	mova	%icc,	%o6,	%l3
	edge8n	%i2,	%o3,	%i3
loop_2133:
	edge16n	%i4,	%g1,	%l1
	edge32	%l2,	%g4,	%g3
	fmovscc	%icc,	%f28,	%f2
	wr	%g0,	0x19,	%asi
	edge8n	%o2,	%i6,	%o4
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	fbuge,a	%fcc2,	loop_2134
	fone	%f4
	fbul,a	%fcc2,	loop_2135
	fpsub16s	%f6,	%f30,	%f12
loop_2134:
	edge16l	%i5,	%l0,	%o7
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
loop_2135:
	fones	%f16
	fnot2	%f18,	%f16
	sll	%o1,	%o5,	%l4
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	edge8n	%l6,	%o0,	%i0
	umulcc	%l5,	%g7,	%g2
	st	%f14,	[%l7 + 0x2C]
	edge8	%g6,	%i1,	%o6
	subccc	%i7,	0x00B4,	%l3
	subcc	%o3,	%i3,	%i2
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	stb	%g1,	[%l7 + 0x3F]
	sllx	%l1,	0x15,	%i4
	nop 	! 	tle	%icc,	0x4 changed by convert2hboot
	addcc	%g4,	%g3,	%l2
	set	0x1E, %o2
	nop	 ! 	ldsha	[%l7 + %o2] 0x11,	%g5 ASI use replaced by convert2hboot
	wr	%g0,	0x11,	%asi
	sta	%f2,	[%l7 + 0x64] %asi
	edge16ln	%i6,	%o4,	%i5
	brz,a	%o2,	loop_2136
	brnz	%l0,	loop_2137
	nop 	! 	tcc	%icc,	0x4 changed by convert2hboot
	movl	%icc,	%o7,	%o1
loop_2136:
	nop 	! 	tsubcc	%o5,	0x18A1,	%l6 changed by convert2hboot
loop_2137:
	nop
	set	0x66, %i2
	ldub	[%l7 + %i2],	%o0
	call	loop_2138
	nop 	! 	tsubcc	%l4,	%i0,	%g7 changed by convert2hboot
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	movvc	%xcc,	%g2,	%g6
loop_2138:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f12,	%f5,	%f26
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	move	%xcc,	%l5,	%i1
	movle	%xcc,	%o6,	%i7
	fmovsgu	%xcc,	%f24,	%f0
	edge32l	%o3,	%i3,	%l3
	sethi	0x1A07,	%g1
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
	movpos	%icc,	%l1,	%i4
	srax	%g4,	0x1A,	%g3
	movpos	%xcc,	%l2,	%g5
	stx	%i6,	[%l7 + 0x50]
	edge8n	%i2,	%i5,	%o4
	bne,pt	%icc,	loop_2139
	move	%xcc,	%o2,	%l0
	fmovsa	%icc,	%f24,	%f14
	addc	%o7,	%o5,	%l6
loop_2139:
	nop 	! 	tl	%icc,	0x6 changed by convert2hboot
	sub	%o1,	%o0,	%i0
	smul	%l4,	%g2,	%g6
	fxor	%f14,	%f2,	%f30
	set	0x30, %o5
	nop	 ! 	stda	%g6,	[%l7 + %o5] 0x2a ASI use replaced by convert2hboot
	membar	#Sync
	umul	%i1,	0x0EB6,	%l5
	ldsh	[%l7 + 0x6C],	%i7
	set	0x54, %i1
	sta	%f16,	[%l7 + %i1] 0x14
	smulcc	%o3,	0x0237,	%o6
	brgz,a	%l3,	loop_2140
	fmovrsne	%i3,	%f17,	%f1
	movre	%g1,	0x3E8,	%i4
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
loop_2140:
	array32	%l1,	%g3,	%g4
	fpadd32	%f26,	%f26,	%f12
	fmovsne	%icc,	%f25,	%f8
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	edge16ln	%g5,	%l2,	%i2
	stw	%i6,	[%l7 + 0x40]
	std	%f0,	[%l7 + 0x78]
	orncc	%i5,	0x0452,	%o4
	fsrc1	%f6,	%f26
	set	0x6C, %i0
	lda	[%l7 + %i0] 0x10,	%f21
	edge32	%o2,	%l0,	%o5
	mova	%icc,	%o7,	%o1
	nop 	! 	taddcc	%l6,	%o0,	%l4 changed by convert2hboot
	fmovsg	%xcc,	%f7,	%f22
	movrlez	%g2,	0x2B4,	%g6
	bcc	%icc,	loop_2141
	umulcc	%g7,	0x0573,	%i0
	subc	%i1,	%l5,	%i7
	movl	%xcc,	%o3,	%o6
loop_2141:
	nop 	! 	tgu	%icc,	0x1 changed by convert2hboot
	fsrc1s	%f2,	%f10
	fsrc2	%f22,	%f12
	brlez,a	%l3,	loop_2142
	xnorcc	%g1,	%i4,	%l1
	edge32ln	%g3,	%i3,	%g5
	fmovrse	%l2,	%f16,	%f25
loop_2142:
	ldx	[%l7 + 0x08],	%i2
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	movrgz	%i6,	%i5,	%o4
	fbue	%fcc3,	loop_2143
	movvs	%xcc,	%o2,	%l0
	fbg	%fcc1,	loop_2144
	bvs,pt	%xcc,	loop_2145
loop_2143:
	fandnot1s	%f15,	%f12,	%f2
	movrlez	%g4,	0x06F,	%o7
loop_2144:
	fmovsleu	%icc,	%f21,	%f7
loop_2145:
	edge16n	%o1,	%l6,	%o0
	fbe,a	%fcc3,	loop_2146
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	sdiv	%o5,	0x0F5D,	%g2
	edge32ln	%l4,	%g7,	%i0
loop_2146:
	edge16n	%i1,	%g6,	%i7
	wr	%g0,	0x89,	%asi
	alignaddr	%o6,	%l3,	%g1
	fnegd	%f18,	%f14
	brz	%i4,	loop_2147
	movge	%xcc,	%o3,	%l1
	subcc	%i3,	%g3,	%g5
	brgez	%i2,	loop_2148
loop_2147:
	sllx	%l2,	%i5,	%o4
	sra	%o2,	%i6,	%g4
	umulcc	%o7,	0x1F73,	%l0
loop_2148:
	nop 	! 	te	%xcc,	0x5 changed by convert2hboot
	nop 	! 	taddcc	%o1,	%o0,	%l6 changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	nop
	setx	loop_2149,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	xorcc	%o5,	0x1E94,	%g2
	lduh	[%l7 + 0x3A],	%g7
	prefetch	[%l7 + 0x60],	 0x1
loop_2149:
	popc	%i0,	%i1
	fmovrdgz	%g6,	%f30,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i7,	%l5,	%o6
	edge16	%l4,	%g1,	%l3
	st	%f9,	[%l7 + 0x24]
	nop 	! 	taddcctv	%i4,	%l1,	%i3 changed by convert2hboot
	fmul8x16au	%f27,	%f3,	%f14
	fmovdcc	%icc,	%f15,	%f30
	bvs	loop_2150
	nop 	! 	taddcc	%o3,	0x1C5A,	%g5 changed by convert2hboot
	popc	%i2,	%g3
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
loop_2150:
	xnor	%i5,	%l2,	%o4
	fornot1	%f20,	%f18,	%f22
	andcc	%i6,	0x1487,	%g4
	nop 	! 	tneg	%icc,	0x1 changed by convert2hboot
	xorcc	%o7,	%o2,	%l0
	nop 	! 	tsubcctv	%o1,	0x14DD,	%o0 changed by convert2hboot
	edge8ln	%o5,	%l6,	%g2
	brlez	%g7,	loop_2151
	umulcc	%i0,	0x102E,	%g6
	membar	0x29
	bge,a,pt	%xcc,	loop_2152
loop_2151:
	bn,a,pt	%icc,	loop_2153
	fors	%f9,	%f2,	%f25
	nop 	! 	tsubcc	%i7,	%l5,	%o6 changed by convert2hboot
loop_2152:
	fors	%f3,	%f19,	%f12
loop_2153:
	srlx	%l4,	%g1,	%i1
	fpack32	%f24,	%f0,	%f26
	edge16ln	%l3,	%l1,	%i3
	bcs	loop_2154
	sethi	0x1BF4,	%o3
	nop 	! 	tge	%icc,	0x4 changed by convert2hboot
	movvs	%xcc,	%i4,	%i2
loop_2154:
	ble	%icc,	loop_2155
	swap	[%l7 + 0x5C],	%g3
	fmovspos	%icc,	%f27,	%f14
	brlz,a	%g5,	loop_2156
loop_2155:
	fbul,a	%fcc3,	loop_2157
	movg	%icc,	%i5,	%o4
	fnands	%f8,	%f2,	%f5
loop_2156:
	fmovrslez	%i6,	%f7,	%f31
loop_2157:
	fmovdg	%icc,	%f6,	%f22
	edge16l	%g4,	%l2,	%o7
	mova	%icc,	%o2,	%o1
	fbl	%fcc1,	loop_2158
	nop 	! 	tleu	%xcc,	0x0 changed by convert2hboot
	stb	%l0,	[%l7 + 0x55]
	set	0x68, %o4
	nop	 ! 	lduwa	[%l7 + %o4] 0x80,	%o5 ASI use replaced by convert2hboot
loop_2158:
	movcc	%icc,	%l6,	%g2
	and	%g7,	0x1269,	%o0
	movrgez	%g6,	%i7,	%l5
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	bleu,a	loop_2159
	mulx	%o6,	%l4,	%g1
	std	%f22,	[%l7 + 0x48]
	ldub	[%l7 + 0x08],	%i0
loop_2159:
	fsrc1s	%f9,	%f26
	fnegd	%f6,	%f0
	sll	%l3,	%l1,	%i3
	wr	%g0,	0x80,	%asi
	edge16n	%o3,	%i4,	%g3
	andcc	%i2,	%g5,	%i5
	array8	%i6,	%g4,	%l2
	smulcc	%o7,	%o4,	%o2
	fbu	%fcc3,	loop_2160
	fornot2	%f2,	%f28,	%f0
	movvc	%xcc,	%o1,	%l0
	udivcc	%o5,	0x0092,	%g2
loop_2160:
	call	loop_2161
	srlx	%l6,	0x03,	%g7
	addccc	%g6,	%i7,	%l5
	addcc	%o0,	%o6,	%l4
loop_2161:
	edge8n	%i0,	%l3,	%l1
	nop 	! 	tle	%icc,	0x2 changed by convert2hboot
	array16	%i3,	%i1,	%o3
	fbue	%fcc3,	loop_2162
	movrgz	%g1,	0x163,	%i4
	nop 	! 	sir	0x1EAA changed by convert2hboot
	fsrc2	%f2,	%f2
loop_2162:
	fpsub16s	%f22,	%f24,	%f29
	std	%f4,	[%l7 + 0x70]
	fmovrslz	%g3,	%f20,	%f0
	array32	%g5,	%i2,	%i5
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	be,a,pn	%xcc,	loop_2163
	nop 	! 	tn	%icc,	0x5 changed by convert2hboot
	andncc	%g4,	%i6,	%l2
	udiv	%o4,	0x1E98,	%o2
loop_2163:
	sth	%o1,	[%l7 + 0x0C]
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	movvc	%icc,	%o7,	%l0
	subc	%g2,	%o5,	%l6
	fbn	%fcc3,	loop_2164
	add	%g7,	0x0000,	%g6
	subcc	%l5,	%o0,	%i7
	udiv	%o6,	0x04EC,	%l4
loop_2164:
	smulcc	%l3,	0x090B,	%i0
	fmovrsgz	%l1,	%f14,	%f2
	movpos	%icc,	%i3,	%o3
	udivx	%i1,	0x1FCD,	%i4
	nop 	! 	tneg	%xcc,	0x2 changed by convert2hboot
	nop 	! 	sir	0x142F changed by convert2hboot
	fmovda	%xcc,	%f5,	%f22
	fandnot2s	%f4,	%f8,	%f2
	ldstub	[%l7 + 0x2E],	%g3
	movrlez	%g5,	%i2,	%i5
	fpackfix	%f30,	%f9
	addc	%g1,	%i6,	%g4
	movge	%icc,	%l2,	%o2
	edge16ln	%o4,	%o7,	%o1
	fandnot1s	%f4,	%f29,	%f31
	nop 	! 	tsubcc	%l0,	%g2,	%o5 changed by convert2hboot
	mulx	%g7,	%l6,	%l5
	fbne	%fcc0,	loop_2165
	movgu	%icc,	%g6,	%o0
	brlez	%i7,	loop_2166
	movre	%o6,	0x007,	%l4
loop_2165:
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
	bleu,pn	%icc,	loop_2167
loop_2166:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l3,	0x1BEA,	%i0
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
loop_2167:
	ldsw	[%l7 + 0x68],	%i3
	smulcc	%o3,	0x149B,	%l1
	movrlez	%i1,	%i4,	%g3
	movle	%icc,	%g5,	%i2
	wr	%g0,	0x89,	%asi
	wr	%g0,	0x10,	%asi
	fbug	%fcc2,	loop_2168
	umulcc	%g1,	%g4,	%l2
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	bn,pt	%xcc,	loop_2169
loop_2168:
	fcmpd	%fcc3,	%f4,	%f14
	srax	%o4,	%o7,	%o2
	nop 	! 	taddcctv	%l0,	%g2,	%o5 changed by convert2hboot
loop_2169:
	bl,a,pt	%icc,	loop_2170
	orn	%g7,	0x0DC5,	%l6
	edge16n	%l5,	%g6,	%o0
	set	0x38, %i7
	nop	 ! 	stxa	%o1,	[%l7 + %i7] 0x88 ASI use replaced by convert2hboot
loop_2170:
	umul	%o6,	%l4,	%i7
	movne	%icc,	%i0,	%l3
	addc	%i3,	0x117D,	%l1
	orn	%i1,	%i4,	%g3
	alignaddr	%g5,	%o3,	%i5
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
	movl	%xcc,	%i2,	%i6
	fnegs	%f31,	%f15
	nop
	set	0x30, %o6
	prefetch	[%l7 + %o6],	 0x1
	ldd	[%l7 + 0x68],	%f18
	xnor	%g4,	0x0DDF,	%l2
	fornot1s	%f13,	%f4,	%f11
	fxors	%f16,	%f5,	%f31
	orn	%o4,	%g1,	%o2
	fornot1s	%f24,	%f21,	%f12
	wr	%g0,	0x11,	%asi
	srax	%g2,	%l0,	%g7
	add	%l6,	0x0934,	%o5
	sllx	%g6,	0x1E,	%o0
	edge32ln	%l5,	%o6,	%o1
	alignaddr	%l4,	%i7,	%i0
	mulscc	%l3,	%l1,	%i1
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	brlez	%i3,	loop_2171
	array32	%i4,	%g3,	%o3
	edge16	%g5,	%i5,	%i6
	bpos	%xcc,	loop_2172
loop_2171:
	udiv	%g4,	0x0E17,	%l2
	edge8ln	%o4,	%g1,	%o2
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
loop_2172:
	swap	[%l7 + 0x0C],	%o7
	fmovrdgz	%i2,	%f6,	%f8
	nop
	setx loop_2173, %l0, %l1
	jmpl %l1, %l0
	call	loop_2174
	movrlez	%g2,	0x062,	%g7
	fsrc1	%f12,	%f24
loop_2173:
	nop 	! 	tpos	%xcc,	0x4 changed by convert2hboot
loop_2174:
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
	popc	%o5,	%l6
	andncc	%o0,	%g6,	%l5
	prefetch	[%l7 + 0x54],	 0x0
	bpos,pt	%icc,	loop_2175
	udiv	%o1,	0x0F97,	%l4
	fbn,a	%fcc2,	loop_2176
	movleu	%xcc,	%i7,	%i0
loop_2175:
	nop 	! 	tge	%xcc,	0x4 changed by convert2hboot
	bne,pn	%icc,	loop_2177
loop_2176:
	call	loop_2178
	membar	0x0B
	be	loop_2179
loop_2177:
	nop 	! 	tneg	%xcc,	0x7 changed by convert2hboot
loop_2178:
	fcmpeq32	%f30,	%f8,	%o6
	fpsub16	%f20,	%f10,	%f26
loop_2179:
	fpackfix	%f4,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f28,	%f22,	%f4
	std	%l2,	[%l7 + 0x60]
	fmovde	%icc,	%f25,	%f10
	set	0x30, %l0
	nop	 ! 	ldda	[%l7 + %l0] 0x04,	%i0 ASI use replaced by convert2hboot
	movge	%icc,	%l1,	%i4
	srax	%i3,	%o3,	%g3
	fba,a	%fcc1,	loop_2180
	fand	%f0,	%f10,	%f14
	sllx	%i5,	%i6,	%g5
	ba,a,pn	%icc,	loop_2181
loop_2180:
	bg,a,pn	%icc,	loop_2182
	fcmpeq16	%f14,	%f16,	%g4
	fbo,a	%fcc1,	loop_2183
loop_2181:
	fmovd	%f24,	%f0
loop_2182:
	edge32l	%l2,	%g1,	%o2
	movle	%icc,	%o7,	%o4
loop_2183:
	fcmpne16	%f6,	%f4,	%i2
	edge8ln	%l0,	%g7,	%g2
	wr	%g0,	0x27,	%asi
	membar	#Sync
	fmovrdgz	%l6,	%f0,	%f24
	fba	%fcc3,	loop_2184
	sdivx	%o0,	0x07A9,	%g6
	fmovdneg	%icc,	%f2,	%f25
	ba,pn	%xcc,	loop_2185
loop_2184:
	fmovrdgez	%o1,	%f8,	%f10
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
	movle	%icc,	%l4,	%i7
loop_2185:
	sdivx	%l5,	0x0D9D,	%o6
	lduh	[%l7 + 0x16],	%l3
	stx	%i1,	[%l7 + 0x28]
	movne	%icc,	%l1,	%i0
	andn	%i4,	%o3,	%i3
	fmovdl	%icc,	%f9,	%f12
	add	%g3,	%i6,	%i5
	nop 	! 	taddcc	%g5,	0x1AFC,	%g4 changed by convert2hboot
	set	0x5E, %i5
	nop	 ! 	stha	%l2,	[%l7 + %i5] 0x88 ASI use replaced by convert2hboot
	array16	%g1,	%o2,	%o4
	add	%i2,	%l0,	%o7
	move	%xcc,	%g7,	%g2
	xorcc	%o5,	0x104A,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
	wr	%g0,	0x04,	%asi
	andcc	%o1,	0x16D4,	%l4
	fmovse	%icc,	%f7,	%f22
	fcmpeq32	%f2,	%f18,	%o0
	nop 	! 	tsubcctv	%i7,	%o6,	%l3 changed by convert2hboot
	bvs	%xcc,	loop_2186
	sub	%i1,	0x1810,	%l1
	membar	0x13
	fpadd16s	%f25,	%f0,	%f31
loop_2186:
	movrne	%i0,	%i4,	%o3
	xor	%i3,	0x1675,	%l5
	sub	%g3,	%i6,	%g5
	set	0x68, %o7
	nop	 ! 	stxa	%i5,	[%l7 + %o7] 0xeb ASI use replaced by convert2hboot
	membar	#Sync
	fxor	%f16,	%f20,	%f16
	fsrc1	%f20,	%f2
	subccc	%g4,	0x1ACA,	%l2
	nop 	! 	tsubcc	%o2,	%o4,	%g1 changed by convert2hboot
	fmovrdgz	%i2,	%f20,	%f26
	fmovdcs	%xcc,	%f1,	%f22
	faligndata	%f26,	%f18,	%f20
	fbu	%fcc3,	loop_2187
	edge32	%l0,	%g7,	%g2
	srlx	%o5,	%o7,	%l6
	wr	%g0,	0x2a,	%asi
	membar	#Sync
loop_2187:
	movpos	%xcc,	%l4,	%o0
	movge	%xcc,	%i7,	%o6
	smul	%g6,	0x0411,	%i1
	fornot2	%f10,	%f10,	%f14
	or	%l1,	%l3,	%i4
	fmovrse	%i0,	%f16,	%f24
	addc	%i3,	0x1E7D,	%o3
	sth	%l5,	[%l7 + 0x50]
	sll	%g3,	0x16,	%i6
	addccc	%i5,	0x09D3,	%g4
	movle	%icc,	%g5,	%l2
	call	loop_2188
	movle	%icc,	%o2,	%g1
	pdist	%f26,	%f8,	%f20
	set	0x3C, %o1
	sta	%f25,	[%l7 + %o1] 0x15
loop_2188:
	edge16ln	%i2,	%l0,	%o4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x10,	%asi
	fmovsleu	%xcc,	%f17,	%f25
	edge16	%o5,	%l6,	%o7
	andcc	%l4,	0x1F3D,	%o0
	fexpand	%f17,	%f2
	fmovsvs	%xcc,	%f10,	%f7
	xnorcc	%i7,	0x17E3,	%o1
	fandnot1	%f2,	%f2,	%f10
	ldsw	[%l7 + 0x24],	%g6
	movcs	%xcc,	%o6,	%l1
	set	0x18, %g7
	sta	%f30,	[%l7 + %g7] 0x15
	nop 	! 	taddcctv	%l3,	%i4,	%i1 changed by convert2hboot
	sdiv	%i3,	0x178C,	%i0
	fbul,a	%fcc2,	loop_2189
	fmovrdgz	%l5,	%f24,	%f22
	fbne,a	%fcc2,	loop_2190
	fmovdpos	%icc,	%f26,	%f17
loop_2189:
	movn	%icc,	%g3,	%o3
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
loop_2190:
	fpadd32s	%f1,	%f17,	%f2
	fxors	%f4,	%f2,	%f25
	mulscc	%i6,	0x14D5,	%i5
	edge16l	%g4,	%g5,	%l2
	fbo,a	%fcc0,	loop_2191
	alignaddrl	%o2,	%g1,	%l0
	smul	%i2,	%g2,	%o4
	movrgez	%g7,	%o5,	%o7
loop_2191:
	addcc	%l4,	%o0,	%l6
	udivx	%o1,	0x1DAE,	%g6
	ldsb	[%l7 + 0x23],	%i7
	smul	%o6,	%l3,	%i4
	ldstub	[%l7 + 0x54],	%i1
	movvs	%xcc,	%l1,	%i3
	add	%i0,	0x0135,	%l5
	ld	[%l7 + 0x2C],	%f15
	wr	%g0,	0xe3,	%asi
	membar	#Sync
	addc	%o3,	%i6,	%g4
	fbl	%fcc1,	loop_2192
	popc	0x0F54,	%g5
	edge8ln	%i5,	%l2,	%o2
	move	%xcc,	%l0,	%i2
loop_2192:
	nop
	set	0x18, %i3
	sta	%f31,	[%l7 + %i3] 0x89
	mova	%xcc,	%g1,	%o4
	mulscc	%g7,	%g2,	%o5
	nop 	! 	taddcctv	%o7,	0x0944,	%o0 changed by convert2hboot
	fmovdge	%xcc,	%f21,	%f23
	udiv	%l6,	0x17B8,	%l4
	ldsh	[%l7 + 0x3C],	%g6
	edge16ln	%i7,	%o6,	%o1
	fones	%f11
	bleu,pt	%xcc,	loop_2193
	udivx	%i4,	0x084D,	%l3
	udiv	%l1,	0x02B3,	%i1
	subc	%i3,	0x0A90,	%i0
loop_2193:
	nop
	set	0x38, %l6
	nop	 ! 	stba	%l5,	[%l7 + %l6] 0xe3 ASI use replaced by convert2hboot
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o3,	0x00F7,	%g3
	movne	%xcc,	%g4,	%g5
	nop 	! 	tsubcc	%i5,	%i6,	%l2 changed by convert2hboot
	fsrc1s	%f7,	%f29
	udiv	%l0,	0x16ED,	%o2
	ldd	[%l7 + 0x40],	%g0
	andn	%i2,	%o4,	%g2
	fxor	%f8,	%f18,	%f20
	edge16ln	%g7,	%o5,	%o0
	lduw	[%l7 + 0x68],	%o7
	srl	%l4,	%l6,	%i7
	subccc	%o6,	%o1,	%i4
	alignaddrl	%g6,	%l1,	%i1
	siam	0x0
	movcs	%xcc,	%i3,	%i0
	sdivcc	%l3,	0x1F44,	%o3
	set	0x7E, %o3
	nop	 ! 	ldsha	[%l7 + %o3] 0x88,	%g3 ASI use replaced by convert2hboot
	mulscc	%l5,	%g5,	%g4
	movle	%xcc,	%i6,	%i5
	movge	%icc,	%l2,	%o2
	umul	%l0,	0x0BB0,	%g1
	andn	%o4,	%g2,	%g7
	nop 	! 	tg	%icc,	0x3 changed by convert2hboot
	udivcc	%i2,	0x14C3,	%o0
	alignaddrl	%o5,	%o7,	%l4
	movgu	%xcc,	%l6,	%o6
	add	%o1,	%i7,	%g6
	sdiv	%l1,	0x13AD,	%i1
	fornot2s	%f12,	%f5,	%f2
	add	%i4,	0x10A4,	%i0
	and	%l3,	0x1092,	%i3
	xnor	%o3,	%l5,	%g3
	orcc	%g4,	%g5,	%i5
	sdiv	%i6,	0x0CF3,	%o2
	fnand	%f24,	%f0,	%f20
	fmovdvs	%icc,	%f11,	%f29
	fmovrdlz	%l2,	%f12,	%f24
	sdiv	%g1,	0x0D58,	%o4
	std	%g2,	[%l7 + 0x40]
	fba,a	%fcc3,	loop_2194
	addccc	%g7,	0x1906,	%l0
	mulx	%i2,	%o0,	%o5
	movg	%xcc,	%o7,	%l4
loop_2194:
	edge8n	%l6,	%o6,	%i7
	edge8n	%g6,	%o1,	%i1
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	sdivcc	%l1,	0x04D8,	%i4
	movcs	%xcc,	%l3,	%i3
	srlx	%i0,	0x0B,	%o3
	movle	%xcc,	%l5,	%g4
	andn	%g3,	0x019B,	%i5
	be,pt	%icc,	loop_2195
	fpadd16s	%f11,	%f7,	%f14
	fornot2s	%f22,	%f27,	%f15
	fone	%f28
loop_2195:
	edge16l	%i6,	%o2,	%l2
	nop 	! 	tne	%xcc,	0x2 changed by convert2hboot
	movcs	%xcc,	%g5,	%g1
	fbl,a	%fcc1,	loop_2196
	movn	%xcc,	%o4,	%g7
	edge32	%l0,	%i2,	%g2
	nop 	! 	tsubcc	%o0,	%o7,	%o5 changed by convert2hboot
loop_2196:
	stw	%l4,	[%l7 + 0x1C]
	subccc	%l6,	0x1B46,	%i7
	nop 	! 	sir	0x11A7 changed by convert2hboot
	wr	%g0,	0x81,	%asi
	brgez	%g6,	loop_2197
	nop 	! 	tcs	%xcc,	0x4 changed by convert2hboot
	movneg	%xcc,	%o1,	%i1
	bleu,pt	%icc,	loop_2198
loop_2197:
	smulcc	%l1,	%i4,	%l3
	fnors	%f18,	%f9,	%f15
	nop 	! 	te	%xcc,	0x4 changed by convert2hboot
loop_2198:
	fabsd	%f8,	%f22
	fmovrdlez	%i3,	%f10,	%f26
	bne,a	%icc,	loop_2199
	movg	%icc,	%o3,	%i0
	ldsb	[%l7 + 0x34],	%g4
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	nop	 ! 	casa	[%l6] 0x89,	%g3,	%l5 ASI use replaced by convert2hboot
loop_2199:
	fmovsvc	%icc,	%f14,	%f16
	mova	%icc,	%i6,	%i5
	fbge	%fcc3,	loop_2200
	sdivx	%l2,	0x172F,	%o2
	nop 	! 	taddcc	%g5,	0x0AC1,	%o4 changed by convert2hboot
	array16	%g1,	%l0,	%g7
loop_2200:
	fmovdpos	%icc,	%f23,	%f25
	set	0x10, %l4
	nop	 ! 	prefetcha	[%l7 + %l4] 0x14,	 0x2 ASI use replaced by convert2hboot
	subc	%o0,	0x0E77,	%i2
	umulcc	%o7,	0x124F,	%l4
	fmovsg	%icc,	%f19,	%f31
	edge16	%l6,	%i7,	%o5
	movrgz	%o6,	%o1,	%g6
	set	0x53, %l1
	nop	 ! 	ldsba	[%l7 + %l1] 0x15,	%l1 ASI use replaced by convert2hboot
	fpackfix	%f26,	%f16
	bge,pn	%xcc,	loop_2201
	movrlz	%i4,	0x242,	%l3
	nop 	! 	tne	%icc,	0x1 changed by convert2hboot
	movvs	%xcc,	%i3,	%i1
loop_2201:
	fmovsn	%xcc,	%f22,	%f7
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	set	0x24, %l2
	nop	 ! 	stwa	%o3,	[%l7 + %l2] 0x22 ASI use replaced by convert2hboot
	membar	#Sync
	fmovdle	%xcc,	%f26,	%f16
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	brnz	%i0,	loop_2202
	be,a	loop_2203
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
	call	loop_2204
loop_2202:
	brlz,a	%g3,	loop_2205
loop_2203:
	fcmped	%fcc0,	%f6,	%f16
	fmovdl	%xcc,	%f22,	%f26
loop_2204:
	fmovsne	%icc,	%f8,	%f28
loop_2205:
	membar	0x0E
	fmovdle	%icc,	%f9,	%f27
	andncc	%l5,	%i6,	%g4
	umul	%l2,	%i5,	%g5
	sdivcc	%o2,	0x0602,	%g1
	sdivx	%o4,	0x196A,	%l0
	fbn,a	%fcc1,	loop_2206
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
	andn	%g7,	0x0B19,	%g2
	orn	%o0,	0x0903,	%o7
loop_2206:
	fbug,a	%fcc2,	loop_2207
	edge16l	%l4,	%i2,	%i7
	mova	%icc,	%o5,	%o6
	and	%l6,	0x1249,	%o1
loop_2207:
	fmovscs	%xcc,	%f1,	%f16
	wr	%g0,	0x80,	%asi
	movpos	%icc,	%i4,	%l3
	nop 	! 	tneg	%icc,	0x3 changed by convert2hboot
	mulx	%g6,	0x1953,	%i1
	move	%icc,	%o3,	%i0
	sll	%i3,	%l5,	%g3
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	movg	%xcc,	%i6,	%l2
	popc	%i5,	%g4
	bge	loop_2208
	edge16ln	%g5,	%o2,	%o4
	sdiv	%l0,	0x06DA,	%g7
	mova	%xcc,	%g2,	%o0
loop_2208:
	nop
	setx loop_2209, %l0, %l1
	jmpl %l1, %o7
	fba,a	%fcc3,	loop_2210
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x1 changed by convert2hboot
loop_2209:
	movcc	%xcc,	%l4,	%g1
loop_2210:
	nop
	set	0x3C, %l3
	sth	%i2,	[%l7 + %l3]
	wr	%g0,	0x18,	%asi
	fsrc2	%f12,	%f12
	set	0x63, %g4
	nop	 ! 	ldsba	[%l7 + %g4] 0x10,	%o6 ASI use replaced by convert2hboot
	fsrc1s	%f5,	%f21
	sethi	0x0733,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l6,	0x0C57,	%l1
	ldsw	[%l7 + 0x7C],	%i4
	movcs	%icc,	%o1,	%l3
	sra	%g6,	%i1,	%i0
	mulscc	%i3,	0x121E,	%l5
	fbne	%fcc1,	loop_2211
	mulx	%o3,	%g3,	%i6
	set	0x6E, %g1
	nop	 ! 	ldsha	[%l7 + %g1] 0x10,	%l2 ASI use replaced by convert2hboot
loop_2211:
	smul	%g4,	%g5,	%i5
	movrgez	%o4,	0x019,	%l0
	brz,a	%g7,	loop_2212
	xnorcc	%g2,	%o0,	%o7
	fbo,a	%fcc2,	loop_2213
	bn	%icc,	loop_2214
loop_2212:
	orcc	%o2,	0x1E6D,	%l4
	fands	%f10,	%f6,	%f5
loop_2213:
	fbne	%fcc1,	loop_2215
loop_2214:
	st	%f6,	[%l7 + 0x0C]
	srlx	%g1,	0x06,	%o5
	fands	%f15,	%f27,	%f29
loop_2215:
	sdiv	%o6,	0x1DA7,	%i2
	nop
	setx	loop_2216,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	edge16ln	%i7,	%l6,	%i4
	stx	%l1,	[%l7 + 0x68]
	popc	%l3,	%o1
loop_2216:
	sub	%g6,	%i1,	%i3
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	xnorcc	%i0,	%l5,	%o3
	subcc	%g3,	%i6,	%l2
	umul	%g5,	0x128C,	%i5
	mulx	%o4,	0x12CF,	%g4
	fcmpeq16	%f26,	%f30,	%g7
	fcmpne32	%f6,	%f4,	%l0
	fmovde	%xcc,	%f20,	%f17
	movrne	%o0,	0x148,	%g2
	sdivcc	%o7,	0x10B6,	%o2
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	fones	%f28
	sll	%g1,	%o5,	%o6
	wr	%g0,	0x19,	%asi
	sta	%f29,	[%l7 + 0x24] %asi
	ldsb	[%l7 + 0x69],	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l4,	%l6,	%i4
	nop 	! 	tleu	%xcc,	0x0 changed by convert2hboot
	sub	%i7,	%l1,	%l3
	nop
	setx loop_2217, %l0, %l1
	jmpl %l1, %o1
	edge32ln	%i1,	%g6,	%i0
	popc	0x0B3E,	%i3
	fmovd	%f6,	%f22
loop_2217:
	nop
	set	0x60, %g5
	nop	 ! 	ldda	[%l7 + %g5] 0xe2,	%o2 ASI use replaced by convert2hboot
	fcmple32	%f4,	%f18,	%l5
	fmovdl	%xcc,	%f24,	%f22
	fsrc1s	%f16,	%f27
	sll	%i6,	%l2,	%g5
	movvs	%xcc,	%g3,	%i5
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
	brgz	%o4,	loop_2218
	edge8	%g7,	%g4,	%l0
	nop 	! 	taddcc	%g2,	%o0,	%o7 changed by convert2hboot
	edge16n	%o2,	%o5,	%g1
loop_2218:
	fmovdvc	%icc,	%f15,	%f30
	movrne	%i2,	%o6,	%l4
	lduw	[%l7 + 0x14],	%l6
	nop 	! 	tleu	%xcc,	0x0 changed by convert2hboot
	ldsw	[%l7 + 0x44],	%i7
	fmul8sux16	%f30,	%f14,	%f14
	udiv	%l1,	0x1061,	%i4
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
	edge16n	%o1,	%i1,	%g6
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	udivx	%i0,	0x0A17,	%i3
	fxnor	%f26,	%f0,	%f12
	ba,a	loop_2219
	xnorcc	%l3,	%l5,	%i6
	edge8	%o3,	%l2,	%g5
	fnot1	%f22,	%f8
loop_2219:
	fpadd32	%f16,	%f30,	%f2
	fmovdvs	%xcc,	%f25,	%f26
	call	loop_2220
	fnot1s	%f30,	%f12
	nop 	! 	tsubcc	%i5,	%g3,	%o4 changed by convert2hboot
	fmovrdne	%g7,	%f12,	%f18
loop_2220:
	udiv	%g4,	0x174B,	%g2
	fmovdvc	%xcc,	%f5,	%f29
	movneg	%xcc,	%o0,	%l0
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
	sub	%o7,	%o2,	%g1
	srlx	%i2,	0x02,	%o6
	set	0x48, %l5
	nop	 ! 	stha	%o5,	[%l7 + %l5] 0x19 ASI use replaced by convert2hboot
	ba	%xcc,	loop_2221
	xnor	%l4,	%i7,	%l1
	st	%f13,	[%l7 + 0x28]
	set	0x1C, %g6
	nop	 ! 	stwa	%i4,	[%l7 + %g6] 0x23 ASI use replaced by convert2hboot
	membar	#Sync
loop_2221:
	movl	%xcc,	%o1,	%l6
	edge8ln	%g6,	%i1,	%i3
	edge16n	%l3,	%i0,	%i6
	fmovrdlz	%o3,	%f8,	%f26
	movrgez	%l5,	0x195,	%g5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	nop	 ! 	casxa	[%l6] 0x18,	%i5,	%l2 ASI use replaced by convert2hboot
	fmovrsgez	%o4,	%f20,	%f1
	fnot1s	%f23,	%f15
	andcc	%g3,	%g4,	%g2
	subccc	%o0,	0x0CA3,	%l0
	nop 	! 	tsubcc	%o7,	%o2,	%g7 changed by convert2hboot
	orncc	%g1,	%o6,	%i2
	movrgez	%l4,	0x24B,	%i7
	udivcc	%o5,	0x1191,	%i4
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	fnands	%f8,	%f13,	%f7
	call	loop_2222
	sub	%l1,	%l6,	%g6
	movcc	%icc,	%o1,	%i3
	fmovsn	%icc,	%f28,	%f4
loop_2222:
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	fands	%f16,	%f18,	%f21
	siam	0x0
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
	array32	%l3,	%i0,	%i6
	be,a,pn	%icc,	loop_2223
	fnot2s	%f16,	%f16
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
loop_2223:
	flush	%l7 + 0x54
	movvc	%xcc,	%o3,	%i1
	movrlez	%g5,	0x298,	%l5
	orn	%l2,	0x19EA,	%o4
	umul	%i5,	%g3,	%g4
	fornot1	%f22,	%f14,	%f10
	ldd	[%l7 + 0x70],	%f12
	nop 	! 	sir	0x19AE changed by convert2hboot
	movge	%xcc,	%o0,	%g2
	set	0x48, %o0
	nop	 ! 	swapa	[%l7 + %o0] 0x89,	%l0 ASI use replaced by convert2hboot
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
	stw	%o7,	[%l7 + 0x0C]
	andncc	%o2,	%g7,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i2,	%l4,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f4,	%f22,	%f12
	movre	%i7,	0x188,	%i4
	movrgez	%l1,	%l6,	%g6
	edge8ln	%o1,	%i3,	%l3
	nop 	! 	tsubcctv	%i0,	0x1F44,	%o5 changed by convert2hboot
	smulcc	%o3,	0x1B67,	%i1
	movrlez	%g5,	%l5,	%i6
	fandnot2	%f24,	%f28,	%f4
	edge32	%o4,	%l2,	%g3
	xnor	%g4,	0x1C7B,	%i5
	lduh	[%l7 + 0x38],	%o0
	fmuld8sux16	%f8,	%f0,	%f4
	ldsw	[%l7 + 0x10],	%l0
	sll	%o7,	0x11,	%o2
	xor	%g2,	%g7,	%g1
	edge16l	%i2,	%l4,	%o6
	alignaddr	%i4,	%i7,	%l6
	bne,pt	%icc,	loop_2224
	fbug,a	%fcc2,	loop_2225
	movrgz	%g6,	0x22C,	%l1
	mulx	%o1,	0x1C64,	%i3
loop_2224:
	ldstub	[%l7 + 0x15],	%l3
loop_2225:
	fmovscs	%icc,	%f11,	%f5
	movgu	%xcc,	%i0,	%o3
	movle	%icc,	%i1,	%o5
	andn	%l5,	0x15F3,	%i6
	fmovsne	%icc,	%f5,	%f14
	sdivcc	%g5,	0x1677,	%l2
	edge8ln	%g3,	%o4,	%i5
	sdivx	%o0,	0x155F,	%l0
	brz,a	%o7,	loop_2226
	movrlz	%g4,	0x0FA,	%g2
	srax	%o2,	0x19,	%g7
	udivx	%i2,	0x06A9,	%g1
loop_2226:
	sdivcc	%l4,	0x0C18,	%o6
	fcmpeq32	%f6,	%f24,	%i7
	subcc	%i4,	0x100C,	%l6
	smulcc	%g6,	0x1150,	%l1
	ldd	[%l7 + 0x50],	%f8
	movrlz	%o1,	%l3,	%i0
	set	0x3F, %g3
	nop	 ! 	ldsba	[%l7 + %g3] 0x0c,	%o3 ASI use replaced by convert2hboot
	set	0x70, %g2
	sta	%f4,	[%l7 + %g2] 0x80
	fba	%fcc1,	loop_2227
	sub	%i3,	%i1,	%l5
	movleu	%icc,	%i6,	%o5
	fxnors	%f5,	%f7,	%f7
loop_2227:
	movg	%icc,	%g5,	%l2
	fnegd	%f16,	%f6
	edge32	%g3,	%o4,	%i5
	movrgz	%l0,	0x27B,	%o0
	srl	%o7,	%g4,	%o2
	prefetch	[%l7 + 0x40],	 0x1
	andn	%g7,	%g2,	%g1
	fpadd32s	%f25,	%f11,	%f20
	sdivcc	%i2,	0x096F,	%l4
	bvc,a,pt	%icc,	loop_2228
	fornot2	%f20,	%f14,	%f28
	movn	%icc,	%i7,	%i4
	sth	%l6,	[%l7 + 0x4A]
loop_2228:
	mulscc	%g6,	0x15DF,	%o6
	set	0x10, %i4
	nop	 ! 	ldda	[%l7 + %i4] 0x81,	%o0 ASI use replaced by convert2hboot
	fornot2s	%f24,	%f13,	%f10
	sllx	%l1,	0x08,	%i0
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	movcc	%xcc,	%l3,	%i3
	lduw	[%l7 + 0x4C],	%i1
	fands	%f15,	%f30,	%f15
	stx	%l5,	[%l7 + 0x58]
	fbu	%fcc0,	loop_2229
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	nop
	setx loop_2230, %l0, %l1
	jmpl %l1, %o3
	alignaddrl	%i6,	%o5,	%l2
loop_2229:
	fmovsl	%xcc,	%f30,	%f13
	nop 	! 	tpos	%xcc,	0x6 changed by convert2hboot
loop_2230:
	edge8ln	%g5,	%g3,	%o4
	fbuge,a	%fcc3,	loop_2231
	edge32l	%i5,	%l0,	%o7
	nop 	! 	taddcc	%o0,	0x0290,	%g4 changed by convert2hboot
	fcmpne32	%f28,	%f22,	%o2
loop_2231:
	nop
	wr	%g0,	0x10,	%asi
	movge	%xcc,	%g7,	%g1
	wr	%g0,	0x81,	%asi
	nop 	! 	tcs	%xcc,	0x5 changed by convert2hboot
	fnegd	%f4,	%f24
	orn	%l4,	0x0DB8,	%i7
	nop
	set	0x40, %o2
	std	%f2,	[%l7 + %o2]
	stx	%i2,	[%l7 + 0x08]
	fmovsl	%xcc,	%f2,	%f16
	sdivcc	%l6,	0x0329,	%i4
	edge32l	%o6,	%o1,	%g6
	edge8ln	%i0,	%l3,	%i3
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
	fbl,a	%fcc0,	loop_2232
	or	%l1,	%l5,	%i1
	fbu	%fcc3,	loop_2233
	fmovrslz	%o3,	%f0,	%f24
loop_2232:
	orncc	%o5,	0x03C2,	%l2
	be,a,pt	%xcc,	loop_2234
loop_2233:
	bcs,a,pt	%icc,	loop_2235
	nop 	! 	tsubcc	%g5,	%i6,	%o4 changed by convert2hboot
	bne,a,pn	%xcc,	loop_2236
loop_2234:
	st	%f7,	[%l7 + 0x0C]
loop_2235:
	movneg	%icc,	%g3,	%l0
	udivx	%o7,	0x0DD7,	%o0
loop_2236:
	fornot1	%f24,	%f16,	%f18
	fxors	%f18,	%f23,	%f11
	sdivx	%i5,	0x0793,	%g4
	ldub	[%l7 + 0x1A],	%o2
	smulcc	%g2,	0x13E6,	%g7
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
	edge32	%l4,	%i7,	%g1
	edge8	%i2,	%l6,	%i4
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
	set	0x40, %i6
	nop	 ! 	ldda	[%l7 + %i6] 0x2a,	%o0 ASI use replaced by convert2hboot
	fpack32	%f12,	%f8,	%f16
	orncc	%o6,	%g6,	%l3
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	fbue,a	%fcc2,	loop_2237
	xnorcc	%i0,	0x0EA2,	%i3
	fandnot2s	%f1,	%f2,	%f11
	membar	0x17
loop_2237:
	addccc	%l1,	%l5,	%o3
	movpos	%xcc,	%i1,	%l2
	fmovrse	%g5,	%f2,	%f22
	fpsub32s	%f8,	%f11,	%f27
	pdist	%f8,	%f8,	%f22
	fmul8x16au	%f1,	%f16,	%f22
	fandnot1	%f22,	%f26,	%f24
	edge16l	%i6,	%o5,	%g3
	fone	%f6
	subcc	%l0,	%o7,	%o0
	nop 	! 	tneg	%icc,	0x5 changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	nop 	! 	taddcc	%i5,	0x1044,	%g4 changed by convert2hboot
	fbule	%fcc3,	loop_2238
	fmovrdlez	%o2,	%f8,	%f22
	set	0x0D, %o5
	nop	 ! 	stba	%g2,	[%l7 + %o5] 0x19 ASI use replaced by convert2hboot
loop_2238:
	movgu	%xcc,	%g7,	%o4
	sllx	%l4,	0x03,	%i7
	edge8	%i2,	%g1,	%i4
	fmovsge	%xcc,	%f16,	%f1
	fmovscs	%xcc,	%f23,	%f22
	edge32	%o1,	%o6,	%l6
	srlx	%g6,	0x02,	%i0
	ldsb	[%l7 + 0x21],	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
	fnands	%f17,	%f5,	%f2
	set	0x20, %i2
	nop	 ! 	swapa	[%l7 + %i2] 0x19,	%l1 ASI use replaced by convert2hboot
	stx	%l5,	[%l7 + 0x50]
	sdivcc	%i3,	0x08E8,	%i1
	edge8l	%o3,	%l2,	%g5
	srax	%i6,	%o5,	%g3
	move	%icc,	%o7,	%o0
	popc	%i5,	%g4
	movn	%icc,	%l0,	%o2
	edge16n	%g7,	%g2,	%o4
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	mulx	%i2,	%g1,	%i4
	sra	%o6,	0x1C,	%l6
	smulcc	%g6,	0x17A6,	%o1
	andcc	%i0,	0x09BA,	%l1
	fmovrsne	%l5,	%f16,	%f22
	wr	%g0,	0x2a,	%asi
	nop 	! 	taddcc	%i3,	0x1353,	%o3 changed by convert2hboot
	orcc	%l2,	%g5,	%i1
	fmovsg	%xcc,	%f20,	%f13
	movrne	%o5,	%i6,	%g3
	fpsub16s	%f11,	%f21,	%f11
	edge8n	%o0,	%o7,	%i5
	fabss	%f8,	%f30
	popc	%l0,	%g4
	udivcc	%o2,	0x0A87,	%g2
	fands	%f24,	%f12,	%f30
	wr	%g0,	0x10,	%asi
	sta	%f10,	[%l7 + 0x60] %asi
	movn	%xcc,	%g7,	%o4
	fmovsg	%xcc,	%f7,	%f14
	bcc	%icc,	loop_2239
	fmovsa	%icc,	%f17,	%f28
	fblg	%fcc0,	loop_2240
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
loop_2239:
	fmovrde	%l4,	%f0,	%f4
	fbu,a	%fcc3,	loop_2241
loop_2240:
	movl	%xcc,	%i7,	%i2
	movle	%icc,	%g1,	%i4
	movvc	%xcc,	%l6,	%g6
loop_2241:
	nop 	! 	tl	%icc,	0x5 changed by convert2hboot
	fxnors	%f18,	%f1,	%f23
	array8	%o1,	%o6,	%i0
	array16	%l5,	%l1,	%l3
	fmuld8ulx16	%f11,	%f4,	%f18
	set	0x38, %i1
	nop	 ! 	lduba	[%l7 + %i1] 0x10,	%i3 ASI use replaced by convert2hboot
	xor	%o3,	%l2,	%i1
	fmul8x16	%f13,	%f18,	%f28
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	xorcc	%g5,	%i6,	%o5
	fmovrslz	%o0,	%f15,	%f10
	xnorcc	%o7,	%i5,	%l0
	edge8l	%g4,	%o2,	%g3
	fone	%f28
	set	0x6C, %o4
	nop	 ! 	swapa	[%l7 + %o4] 0x11,	%g7 ASI use replaced by convert2hboot
	fcmpgt16	%f14,	%f28,	%g2
	fsrc2s	%f18,	%f0
	xor	%l4,	0x058A,	%i7
	nop 	! 	sir	0x0E4A changed by convert2hboot
	set	0x18, %i7
	nop	 ! 	ldswa	[%l7 + %i7] 0x80,	%o4 ASI use replaced by convert2hboot
	edge16l	%i2,	%i4,	%g1
	bcc	%icc,	loop_2242
	edge8l	%g6,	%o1,	%l6
	fmuld8sux16	%f10,	%f23,	%f30
	ldd	[%l7 + 0x28],	%i0
loop_2242:
	nop 	! 	tge	%icc,	0x3 changed by convert2hboot
	and	%l5,	0x1F90,	%o6
	fandnot2	%f26,	%f18,	%f6
	edge16	%l3,	%l1,	%i3
	xorcc	%l2,	0x117B,	%o3
	edge16n	%g5,	%i1,	%i6
	edge8	%o0,	%o7,	%i5
	andcc	%o5,	0x06E4,	%g4
	fbul	%fcc1,	loop_2243
	edge32	%o2,	%g3,	%l0
	sllx	%g2,	0x0D,	%g7
	fornot1	%f30,	%f24,	%f6
loop_2243:
	movpos	%icc,	%l4,	%o4
	fcmped	%fcc1,	%f20,	%f18
	bleu	%icc,	loop_2244
	fbn,a	%fcc3,	loop_2245
	fmovdne	%xcc,	%f22,	%f19
	edge32l	%i2,	%i7,	%g1
loop_2244:
	fbu,a	%fcc2,	loop_2246
loop_2245:
	fbne,a	%fcc3,	loop_2247
	andcc	%i4,	%g6,	%l6
	edge8	%o1,	%i0,	%l5
loop_2246:
	add	%l3,	%l1,	%o6
loop_2247:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l2,	%o3,	%g5
	movrgez	%i1,	0x078,	%i3
	subccc	%o0,	0x0B3D,	%o7
	fbul	%fcc3,	loop_2248
	subc	%i5,	%o5,	%g4
	movneg	%xcc,	%i6,	%g3
	bge,a	%icc,	loop_2249
loop_2248:
	movl	%icc,	%l0,	%o2
	fbul,a	%fcc2,	loop_2250
	bcs,pt	%xcc,	loop_2251
loop_2249:
	srax	%g7,	%g2,	%l4
	edge16	%o4,	%i2,	%g1
loop_2250:
	mulx	%i7,	%g6,	%i4
loop_2251:
	andcc	%l6,	0x00EE,	%o1
	subc	%l5,	0x1E87,	%i0
	and	%l1,	%o6,	%l3
	fcmpeq16	%f18,	%f24,	%o3
	for	%f2,	%f14,	%f26
	fmovrse	%l2,	%f4,	%f3
	array16	%g5,	%i3,	%i1
	sdiv	%o0,	0x07C2,	%i5
	movrgz	%o5,	%g4,	%o7
	or	%g3,	%l0,	%o2
	fxors	%f4,	%f26,	%f17
	movpos	%xcc,	%g7,	%i6
	wr	%g0,	0x80,	%asi
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	nop	 ! 	casa	[%l6] 0x89,	%l4,	%o4 ASI use replaced by convert2hboot
	movrgez	%i2,	0x0A5,	%i7
	orncc	%g1,	%i4,	%l6
	set	0x18, %i0
	nop	 ! 	swapa	[%l7 + %i0] 0x19,	%g6 ASI use replaced by convert2hboot
	swap	[%l7 + 0x34],	%o1
	move	%xcc,	%l5,	%i0
	std	%f18,	[%l7 + 0x68]
	movpos	%icc,	%o6,	%l3
	fornot1	%f8,	%f24,	%f6
	fmovsn	%icc,	%f4,	%f0
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
	fcmpeq16	%f14,	%f18,	%l1
	ldub	[%l7 + 0x14],	%o3
	nop 	! 	ta	%xcc,	0x0 changed by convert2hboot
	addccc	%l2,	0x1328,	%g5
	srlx	%i3,	%i1,	%o0
	and	%o5,	0x0393,	%g4
	fmovrdgz	%o7,	%f0,	%f4
	orncc	%g3,	%l0,	%i5
	bl,a	%icc,	loop_2252
	edge16	%o2,	%i6,	%g7
	srax	%l4,	0x16,	%o4
	ldsb	[%l7 + 0x24],	%g2
loop_2252:
	move	%xcc,	%i7,	%i2
	add	%g1,	0x17C4,	%l6
	sra	%g6,	%i4,	%l5
	fmovsleu	%icc,	%f6,	%f12
	edge16l	%o1,	%i0,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tleu	%xcc,	0x6 changed by convert2hboot
	movrgz	%l3,	0x2B0,	%l1
	array16	%l2,	%g5,	%o3
	fmovrslz	%i3,	%f3,	%f26
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
	movg	%icc,	%i1,	%o0
	wr	%g0,	0x19,	%asi
	fpmerge	%f2,	%f1,	%f0
	fandnot2s	%f13,	%f21,	%f11
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	fmovrdne	%o7,	%f14,	%f6
	addccc	%g3,	0x177E,	%o5
	nop 	! 	tsubcctv	%i5,	0x02D1,	%o2 changed by convert2hboot
	edge32ln	%i6,	%g7,	%l4
	fmovrde	%o4,	%f8,	%f2
	umul	%g2,	0x017D,	%i7
	fmovrdgz	%l0,	%f6,	%f28
	smulcc	%g1,	%i2,	%g6
	fbge	%fcc1,	loop_2253
	stx	%l6,	[%l7 + 0x20]
	fmovdvc	%icc,	%f8,	%f28
	movpos	%icc,	%l5,	%o1
loop_2253:
	fsrc1	%f10,	%f2
	nop 	! 	tle	%icc,	0x7 changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	siam	0x0
	set	0x24, %o6
	nop	 ! 	stha	%i0,	[%l7 + %o6] 0xe3 ASI use replaced by convert2hboot
	membar	#Sync
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	nop 	! 	sir	0x0458 changed by convert2hboot
	fbul	%fcc0,	loop_2254
	nop 	! 	tgu	%xcc,	0x4 changed by convert2hboot
	nop 	! 	taddcctv	%i4,	0x1A5B,	%o6 changed by convert2hboot
	fmovdvs	%icc,	%f9,	%f31
loop_2254:
	movn	%xcc,	%l1,	%l2
	nop 	! 	tvs	%xcc,	0x2 changed by convert2hboot
	fnot1s	%f21,	%f15
	add	%l3,	%o3,	%i3
	ba,a,pt	%icc,	loop_2255
	add	%i1,	%o0,	%g5
	movcc	%xcc,	%g4,	%g3
	brnz,a	%o7,	loop_2256
loop_2255:
	fpmerge	%f12,	%f0,	%f26
	swap	[%l7 + 0x68],	%o5
	fors	%f4,	%f6,	%f31
loop_2256:
	movg	%icc,	%o2,	%i5
	bl,a	%xcc,	loop_2257
	fmovdne	%xcc,	%f21,	%f9
	fmovrdlez	%g7,	%f12,	%f18
	bne,a	%xcc,	loop_2258
loop_2257:
	movcc	%xcc,	%l4,	%i6
	sdivcc	%g2,	0x0718,	%o4
	ldsw	[%l7 + 0x64],	%l0
loop_2258:
	or	%g1,	0x12FB,	%i7
	umul	%g6,	%i2,	%l5
	fmovdcs	%icc,	%f26,	%f22
	srlx	%l6,	%o1,	%i0
	bneg,pn	%xcc,	loop_2259
	array8	%o6,	%l1,	%i4
	orn	%l2,	%l3,	%o3
	ldstub	[%l7 + 0x58],	%i3
loop_2259:
	orncc	%i1,	0x08E6,	%g5
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	sra	%g4,	%g3,	%o7
	sll	%o2,	%i5,	%o5
	fmovdvc	%icc,	%f22,	%f18
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	nop 	! 	tne	%xcc,	0x3 changed by convert2hboot
	umulcc	%g7,	%l4,	%g2
	fcmple16	%f10,	%f8,	%i6
	edge16	%l0,	%o4,	%i7
	edge16n	%g1,	%g6,	%i2
	fmovdg	%icc,	%f29,	%f4
	movleu	%xcc,	%l5,	%o1
	fornot1	%f14,	%f26,	%f0
	fbu	%fcc2,	loop_2260
	movvc	%icc,	%i0,	%o6
	set	0x30, %i5
	lda	[%l7 + %i5] 0x80,	%f22
loop_2260:
	fmul8sux16	%f18,	%f16,	%f26
	fnand	%f2,	%f4,	%f28
	call	loop_2261
	fone	%f0
	nop 	! 	tpos	%xcc,	0x4 changed by convert2hboot
	nop 	! 	sir	0x0B0B changed by convert2hboot
loop_2261:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l1,	%i4,	%l2
	addcc	%l3,	%l6,	%o3
	xor	%i3,	%g5,	%i1
	nop 	! 	tvs	%icc,	0x1 changed by convert2hboot
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
	fmovsge	%xcc,	%f22,	%f6
	fzeros	%f18
	movcc	%icc,	%o0,	%g3
	sub	%o7,	%o2,	%g4
	fnot1s	%f20,	%f1
	bleu,pt	%xcc,	loop_2262
	fbuge,a	%fcc2,	loop_2263
	fmovrdgez	%o5,	%f2,	%f2
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
loop_2262:
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
loop_2263:
	fnot2s	%f29,	%f2
	set	0x78, %l0
	nop	 ! 	prefetcha	[%l7 + %l0] 0x89,	 0x0 ASI use replaced by convert2hboot
	brgez	%i5,	loop_2264
	bvc,pt	%icc,	loop_2265
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	edge32n	%g2,	%l4,	%i6
loop_2264:
	membar	0x28
loop_2265:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f0,	[%l7 + 0x2C] %asi
	movrgez	%o4,	0x09C,	%l0
	movneg	%icc,	%i7,	%g1
	nop 	! 	taddcc	%g6,	%i2,	%l5 changed by convert2hboot
	edge8ln	%o1,	%i0,	%o6
	sllx	%l1,	%i4,	%l2
	subccc	%l6,	0x02F7,	%o3
	umulcc	%i3,	0x1A50,	%l3
	movge	%xcc,	%i1,	%g5
	fnegd	%f24,	%f0
	udivcc	%o0,	0x1855,	%o7
	sethi	0x137B,	%o2
	brlz,a	%g3,	loop_2266
	sethi	0x1219,	%g4
	smulcc	%o5,	0x07DE,	%g7
	flush	%l7 + 0x1C
loop_2266:
	fmovrslez	%i5,	%f26,	%f14
	ba,pt	%xcc,	loop_2267
	edge16l	%g2,	%l4,	%i6
	fcmpne32	%f28,	%f14,	%l0
	nop 	! 	tneg	%icc,	0x7 changed by convert2hboot
loop_2267:
	st	%f27,	[%l7 + 0x38]
	fabsd	%f12,	%f2
	fnot1s	%f28,	%f15
	fpadd16s	%f4,	%f20,	%f1
	movg	%xcc,	%i7,	%o4
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	movre	%g6,	0x0C3,	%g1
	movre	%l5,	0x044,	%i2
	nop 	! 	sir	0x0C7F changed by convert2hboot
	array16	%o1,	%i0,	%l1
	fexpand	%f17,	%f12
	set	0x40, %o1
	nop	 ! 	stda	%f16,	[%l7 + %o1] 0x81 ASI use replaced by convert2hboot
	fpadd32	%f28,	%f30,	%f30
	fmovdg	%xcc,	%f8,	%f13
	sdivcc	%o6,	0x06D1,	%l2
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	addcc	%i4,	%o3,	%l6
	fands	%f28,	%f31,	%f4
	fors	%f1,	%f21,	%f27
	wr	%g0,	0x80,	%asi
	edge8l	%i1,	%i3,	%g5
	udivx	%o0,	0x0222,	%o7
	bn,pt	%icc,	loop_2268
	fandnot1s	%f0,	%f18,	%f20
	mulx	%g3,	0x0351,	%o2
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
loop_2268:
	fxors	%f31,	%f0,	%f20
	sub	%o5,	%g4,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i5,	%g2,	%l4
	nop 	! 	tleu	%icc,	0x3 changed by convert2hboot
	stx	%l0,	[%l7 + 0x20]
	fmovdvs	%xcc,	%f11,	%f17
	movrne	%i6,	0x3F1,	%i7
	fpack32	%f12,	%f4,	%f8
	bg,a	loop_2269
	movle	%xcc,	%o4,	%g6
	array32	%l5,	%g1,	%i2
	edge32	%i0,	%l1,	%o6
loop_2269:
	edge32l	%o1,	%i4,	%o3
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	brgez,a	%l2,	loop_2270
	ld	[%l7 + 0x18],	%f23
	bne,pt	%icc,	loop_2271
	movleu	%xcc,	%l6,	%l3
loop_2270:
	fnand	%f28,	%f6,	%f14
	sdiv	%i1,	0x02C6,	%i3
loop_2271:
	edge16	%o0,	%g5,	%g3
	sdivx	%o7,	0x19FD,	%o2
	smul	%o5,	0x0AF8,	%g7
	wr	%g0,	0x81,	%asi
	movrne	%i5,	0x210,	%g2
	umul	%l4,	%i6,	%i7
	subc	%o4,	%l0,	%g6
	orncc	%g1,	%l5,	%i2
	nop 	! 	tle	%icc,	0x2 changed by convert2hboot
	fba,a	%fcc2,	loop_2272
	movne	%icc,	%i0,	%o6
	fpackfix	%f22,	%f19
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
loop_2272:
	fmovdvs	%xcc,	%f28,	%f7
	array32	%l1,	%i4,	%o1
	fbn	%fcc1,	loop_2273
	fmovsa	%xcc,	%f14,	%f22
	fmovdgu	%xcc,	%f2,	%f10
	set	0x72, %o7
	nop	 ! 	stha	%o3,	[%l7 + %o7] 0x23 ASI use replaced by convert2hboot
	membar	#Sync
loop_2273:
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
	fcmpd	%fcc2,	%f16,	%f10
	brlz	%l2,	loop_2274
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	movvs	%icc,	%l3,	%i1
	add	%l6,	%o0,	%i3
loop_2274:
	movcs	%xcc,	%g3,	%o7
	membar	0x5C
	fmuld8ulx16	%f15,	%f25,	%f16
	edge32n	%g5,	%o2,	%o5
	fbu,a	%fcc1,	loop_2275
	sub	%g7,	%i5,	%g4
	fornot2s	%f16,	%f22,	%f2
	movleu	%icc,	%l4,	%g2
loop_2275:
	ldsw	[%l7 + 0x7C],	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x4C, %i3
	sta	%f20,	[%l7 + %i3] 0x19
	movre	%i6,	0x116,	%l0
	fnot1	%f0,	%f30
	fmovsne	%xcc,	%f6,	%f10
	bneg,a	%xcc,	loop_2276
	fmovrdlz	%g6,	%f12,	%f18
	lduh	[%l7 + 0x0E],	%o4
	fornot2s	%f2,	%f21,	%f15
loop_2276:
	movrlz	%g1,	0x010,	%i2
	fpack32	%f18,	%f0,	%f0
	edge8l	%i0,	%o6,	%l1
	fmuld8ulx16	%f4,	%f22,	%f14
	orcc	%l5,	%i4,	%o1
	orncc	%l2,	%l3,	%o3
	addccc	%i1,	0x0FBA,	%o0
	edge32	%i3,	%l6,	%o7
	faligndata	%f24,	%f28,	%f14
	move	%xcc,	%g3,	%o2
	set	0x28, %l6
	nop	 ! 	stda	%o4,	[%l7 + %l6] 0x10 ASI use replaced by convert2hboot
	movrne	%g5,	0x066,	%g7
	movrlez	%g4,	%l4,	%g2
	andn	%i7,	0x004B,	%i6
	fandnot2	%f4,	%f14,	%f0
	fbe	%fcc2,	loop_2277
	orncc	%l0,	%g6,	%i5
	brlz	%o4,	loop_2278
	nop 	! 	sir	0x037B changed by convert2hboot
loop_2277:
	edge16l	%i2,	%i0,	%o6
	mulx	%g1,	0x1B11,	%l5
loop_2278:
	srax	%l1,	0x0B,	%o1
	fnor	%f0,	%f0,	%f0
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	orncc	%i4,	0x09AB,	%l3
	alignaddr	%o3,	%i1,	%o0
	sllx	%i3,	0x1C,	%l6
	nop 	! 	tsubcctv	%o7,	%g3,	%l2 changed by convert2hboot
	fpadd16	%f24,	%f18,	%f18
	wr	%g0,	0x81,	%asi
	umul	%o2,	%g5,	%g7
	umulcc	%g4,	%l4,	%i7
	sub	%i6,	%l0,	%g2
	srax	%i5,	%o4,	%i2
	fnot2	%f30,	%f26
	fmovdn	%icc,	%f23,	%f21
	fcmps	%fcc0,	%f25,	%f18
	xorcc	%i0,	0x17AE,	%g6
	edge8l	%g1,	%o6,	%l1
	edge16n	%o1,	%l5,	%i4
	fandnot2	%f14,	%f14,	%f14
	fpack32	%f4,	%f14,	%f22
	andn	%o3,	%i1,	%o0
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	fmovsa	%xcc,	%f7,	%f7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	nop	 ! 	casxa	[%l6] 0x04,	%l3,	%l6 ASI use replaced by convert2hboot
	edge32n	%i3,	%o7,	%l2
	subcc	%o5,	%g3,	%o2
	movvc	%icc,	%g7,	%g4
	xorcc	%g5,	%l4,	%i6
	membar	0x27
	movne	%icc,	%l0,	%i7
	fbge,a	%fcc1,	loop_2279
	brgz,a	%i5,	loop_2280
	fbl,a	%fcc3,	loop_2281
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
loop_2279:
	sub	%g2,	%o4,	%i0
loop_2280:
	nop
	set	0x52, %o3
	nop	 ! 	stha	%g6,	[%l7 + %o3] 0x22 ASI use replaced by convert2hboot
	membar	#Sync
loop_2281:
	movrgz	%i2,	%g1,	%l1
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
	andcc	%o6,	%o1,	%l5
	movl	%icc,	%i4,	%i1
	and	%o0,	%o3,	%l3
	nop 	! 	tsubcc	%l6,	0x13B6,	%o7 changed by convert2hboot
	nop 	! 	tsubcctv	%i3,	%o5,	%l2 changed by convert2hboot
	srl	%g3,	%o2,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g4,	%g5,	%l4
	udiv	%l0,	0x1B3F,	%i6
	sllx	%i7,	%g2,	%i5
	sdivx	%o4,	0x0478,	%i0
	fmovsne	%icc,	%f10,	%f12
	edge16l	%i2,	%g6,	%g1
	siam	0x3
	ba,a	loop_2282
	fmovscc	%xcc,	%f28,	%f24
	fbule,a	%fcc0,	loop_2283
	fnands	%f18,	%f8,	%f21
loop_2282:
	fbul	%fcc0,	loop_2284
	stb	%o6,	[%l7 + 0x2B]
loop_2283:
	ldsh	[%l7 + 0x38],	%o1
	brlz	%l1,	loop_2285
loop_2284:
	nop 	! 	tvs	%icc,	0x6 changed by convert2hboot
	smulcc	%i4,	%i1,	%o0
	fmovsg	%xcc,	%f0,	%f14
loop_2285:
	edge16	%l5,	%l3,	%l6
	xnor	%o3,	0x03A6,	%i3
	xor	%o7,	0x049F,	%o5
	bn,pn	%icc,	loop_2286
	movl	%icc,	%g3,	%o2
	xor	%l2,	0x0CCA,	%g4
	movne	%icc,	%g5,	%g7
loop_2286:
	sll	%l0,	0x07,	%l4
	nop 	! 	ta	%icc,	0x3 changed by convert2hboot
	fmovsg	%icc,	%f5,	%f12
	mova	%icc,	%i6,	%g2
	movl	%icc,	%i5,	%i7
	nop 	! 	tl	%icc,	0x4 changed by convert2hboot
	sdivcc	%i0,	0x16CA,	%o4
	nop 	! 	tleu	%xcc,	0x5 changed by convert2hboot
	alignaddr	%i2,	%g6,	%g1
	nop 	! 	tcs	%xcc,	0x5 changed by convert2hboot
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	nop	 ! 	casa	[%l6] 0x80,	%o1,	%o6 ASI use replaced by convert2hboot
	wr	%g0,	0x89,	%asi
	prefetch	[%l7 + 0x3C],	 0x2
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	stw	%i4,	[%l7 + 0x34]
	nop 	! 	tne	%xcc,	0x4 changed by convert2hboot
	movleu	%xcc,	%i1,	%o0
	fnors	%f10,	%f5,	%f2
	bge,pt	%icc,	loop_2287
	fmovrsgz	%l5,	%f11,	%f13
	fmovdvc	%xcc,	%f19,	%f12
	popc	0x1F7A,	%l6
loop_2287:
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
	umul	%o3,	%l3,	%i3
	ble,a	loop_2288
	fmovrdlez	%o7,	%f28,	%f22
	fbne	%fcc1,	loop_2289
	fpsub32	%f24,	%f30,	%f20
loop_2288:
	movleu	%icc,	%g3,	%o2
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
loop_2289:
	sdivx	%o5,	0x119F,	%g4
	sll	%l2,	%g7,	%g5
	movn	%icc,	%l0,	%i6
	fmovscs	%icc,	%f3,	%f7
	umulcc	%l4,	0x0C68,	%g2
	nop 	! 	tsubcc	%i7,	%i0,	%o4 changed by convert2hboot
	edge8n	%i5,	%g6,	%g1
	nop 	! 	tleu	%icc,	0x3 changed by convert2hboot
	movcs	%xcc,	%i2,	%o1
	bne,a,pt	%icc,	loop_2290
	fpsub16	%f4,	%f0,	%f0
	bn	loop_2291
	xorcc	%o6,	0x19E1,	%l1
loop_2290:
	movrlez	%i4,	0x04B,	%i1
	set	0x74, %g7
	nop	 ! 	lduha	[%l7 + %g7] 0x89,	%l5 ASI use replaced by convert2hboot
loop_2291:
	fbo	%fcc0,	loop_2292
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o0,	%o3,	%l3
	sub	%i3,	0x108A,	%l6
loop_2292:
	fbul	%fcc0,	loop_2293
	movvc	%xcc,	%g3,	%o7
	faligndata	%f0,	%f22,	%f14
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
loop_2293:
	fxnor	%f30,	%f18,	%f20
	edge16ln	%o5,	%g4,	%l2
	bge,pt	%icc,	loop_2294
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	movrgez	%o2,	0x2D9,	%g7
loop_2294:
	fcmple32	%f4,	%f16,	%l0
	pdist	%f30,	%f10,	%f2
	fmovrsgz	%g5,	%f12,	%f23
	fpadd32	%f16,	%f20,	%f28
	set	0x57, %l1
	nop	 ! 	ldstuba	[%l7 + %l1] 0x89,	%i6 ASI use replaced by convert2hboot
	fnot2	%f30,	%f30
	bcs	loop_2295
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	set	0x50, %l2
	nop	 ! 	ldda	[%l7 + %l2] 0x2b,	%l4 ASI use replaced by convert2hboot
loop_2295:
	nop
	wr	%g0,	0x20,	%asi
	xnor	%g2,	0x1A28,	%o4
	wr	%g0,	0x88,	%asi
	movrlez	%i0,	0x0D6,	%g6
	move	%icc,	%i2,	%g1
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	movleu	%icc,	%o6,	%l1
	fors	%f1,	%f4,	%f10
	andn	%i4,	%i1,	%l5
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	udiv	%o0,	0x1F27,	%o3
	mulx	%l3,	0x1C43,	%i3
	sub	%o1,	0x1EB7,	%g3
	fnegs	%f12,	%f21
	array16	%o7,	%l6,	%o5
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	ld	[%l7 + 0x0C],	%f18
	nop 	! 	tneg	%icc,	0x1 changed by convert2hboot
	movle	%xcc,	%g4,	%o2
	bne,a,pt	%xcc,	loop_2296
	edge16n	%g7,	%l2,	%g5
	add	%l0,	%i6,	%i7
	fors	%f25,	%f1,	%f25
loop_2296:
	bne,a,pt	%xcc,	loop_2297
	fnot1s	%f17,	%f21
	movrgez	%l4,	0x005,	%g2
	set	0x4E, %l3
	nop	 ! 	lduba	[%l7 + %l3] 0x19,	%i5 ASI use replaced by convert2hboot
loop_2297:
	array8	%i0,	%g6,	%o4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i2
	nop	 ! 	casa	[%l6] 0x0c,	%i2,	%o6 ASI use replaced by convert2hboot
	fcmped	%fcc1,	%f8,	%f8
	fmul8ulx16	%f22,	%f28,	%f24
	movl	%xcc,	%l1,	%i4
	subc	%i1,	%g1,	%l5
	xnorcc	%o3,	%o0,	%l3
	movge	%icc,	%i3,	%g3
	orn	%o1,	0x09D3,	%l6
	udiv	%o7,	0x1629,	%g4
	subc	%o5,	0x1DA5,	%o2
	sra	%l2,	0x12,	%g5
	fcmpgt32	%f2,	%f16,	%g7
	lduh	[%l7 + 0x24],	%l0
	fblg,a	%fcc2,	loop_2298
	nop
	setx loop_2299, %l0, %l1
	jmpl %l1, %i7
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	fcmpd	%fcc1,	%f6,	%f2
loop_2298:
	udivcc	%i6,	0x1EFE,	%l4
loop_2299:
	nop 	! 	tn	%xcc,	0x7 changed by convert2hboot
	bvs	%icc,	loop_2300
	and	%g2,	%i0,	%g6
	fpsub32s	%f17,	%f12,	%f11
	array16	%o4,	%i2,	%i5
loop_2300:
	nop 	! 	tl	%xcc,	0x6 changed by convert2hboot
	std	%f22,	[%l7 + 0x58]
	udivcc	%l1,	0x151B,	%o6
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
	srax	%i4,	%i1,	%g1
	fmul8ulx16	%f26,	%f20,	%f28
	addccc	%l5,	0x029D,	%o0
	wr	%g0,	0x89,	%asi
	nop 	! 	ta	%icc,	0x6 changed by convert2hboot
	movl	%xcc,	%l3,	%o3
	xnorcc	%i3,	0x1470,	%g3
	fpadd32	%f0,	%f26,	%f0
	addccc	%o1,	%o7,	%g4
	bvs,a	%xcc,	loop_2301
	nop 	! 	ta	%icc,	0x2 changed by convert2hboot
	udiv	%l6,	0x0F89,	%o2
	nop 	! 	ta	%xcc,	0x2 changed by convert2hboot
loop_2301:
	bvs,a,pt	%xcc,	loop_2302
	fand	%f18,	%f24,	%f4
	nop 	! 	taddcc	%o5,	%l2,	%g7 changed by convert2hboot
	st	%f12,	[%l7 + 0x08]
loop_2302:
	and	%g5,	0x12DA,	%i7
	fbge	%fcc3,	loop_2303
	brlez	%l0,	loop_2304
	movre	%l4,	0x17C,	%i6
	mulscc	%i0,	0x0176,	%g2
loop_2303:
	fmovscc	%xcc,	%f11,	%f24
loop_2304:
	fpadd32	%f26,	%f12,	%f20
	xnor	%o4,	0x1C6A,	%i2
	sra	%i5,	0x08,	%g6
	nop 	! 	ta	%xcc,	0x0 changed by convert2hboot
	sdivcc	%o6,	0x10BD,	%l1
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%i0
	nop 	! 	taddcctv	%i4,	0x089D,	%l5 changed by convert2hboot
	srax	%o0,	%g1,	%l3
	nop 	! 	tcs	%icc,	0x3 changed by convert2hboot
	wr	%g0,	0x04,	%asi
	ldsh	[%l7 + 0x3C],	%g3
	edge8ln	%o3,	%o1,	%o7
	xnorcc	%g4,	0x10E1,	%l6
	nop 	! 	taddcc	%o5,	0x17CF,	%o2 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	fnegs	%f26,	%f9
	fbne,a	%fcc3,	loop_2305
	ldd	[%l7 + 0x10],	%f8
	wr	%g0,	0x89,	%asi
	sta	%f11,	[%l7 + 0x40] %asi
loop_2305:
	nop
	wr	%g0,	0x22,	%asi
	membar	#Sync
	set	0x60, %l4
	nop	 ! 	lduha	[%l7 + %l4] 0x80,	%g5 ASI use replaced by convert2hboot
	faligndata	%f28,	%f18,	%f30
	nop 	! 	tn	%icc,	0x1 changed by convert2hboot
	siam	0x7
	wr	%g0,	0x24,	%asi
	edge16	%l0,	%l4,	%i7
	fbn,a	%fcc0,	loop_2306
	umulcc	%i6,	0x0C7E,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i0,	0x1B27,	%i2
loop_2306:
	edge32ln	%i5,	%g6,	%o4
	udivcc	%o6,	0x09C4,	%l1
	ldd	[%l7 + 0x60],	%i0
	movrgez	%i4,	%o0,	%l5
	fmovdpos	%xcc,	%f27,	%f17
	sub	%g1,	0x0F1A,	%l3
	sll	%i3,	%g3,	%o3
	fone	%f6
	sdivx	%o1,	0x00EB,	%o7
	movrne	%l6,	0x095,	%g4
	movpos	%icc,	%o2,	%o5
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	membar	0x5C
	bcc,pt	%xcc,	loop_2307
	brlz,a	%g5,	loop_2308
	alignaddrl	%g7,	%l2,	%l0
	ldd	[%l7 + 0x38],	%l4
loop_2307:
	fnands	%f4,	%f29,	%f16
loop_2308:
	subcc	%i7,	0x1A19,	%g2
	fnot1s	%f11,	%f25
	wr	%g0,	0x23,	%asi
	membar	#Sync
	fmovdge	%icc,	%f3,	%f24
	andn	%i2,	%i5,	%g6
	brgz	%o4,	loop_2309
	ld	[%l7 + 0x30],	%f2
	edge32l	%i6,	%l1,	%i1
	bne,a	loop_2310
loop_2309:
	bleu,a	%xcc,	loop_2311
	udivx	%o6,	0x10F0,	%o0
	nop 	! 	taddcctv	%l5,	0x10E2,	%g1 changed by convert2hboot
loop_2310:
	nop
	set	0x1C, %g1
	nop	 ! 	ldsha	[%l7 + %g1] 0x11,	%l3 ASI use replaced by convert2hboot
loop_2311:
	ld	[%l7 + 0x34],	%f10
	array8	%i4,	%g3,	%i3
	sll	%o1,	%o3,	%o7
	movl	%xcc,	%g4,	%l6
	nop
	set	0x6C, %l5
	stb	%o2,	[%l7 + %l5]
	nop 	! 	tsubcctv	%g5,	0x109C,	%g7 changed by convert2hboot
	popc	0x001F,	%l2
	andn	%o5,	%l0,	%l4
	wr	%g0,	0x10,	%asi
	wr	%g0,	0x23,	%asi
	membar	#Sync
	movne	%xcc,	%i0,	%i5
	ble	loop_2312
	array32	%i2,	%g6,	%o4
	srax	%i6,	%i1,	%l1
	movvc	%xcc,	%o0,	%o6
loop_2312:
	movrlz	%g1,	0x14B,	%l3
	movpos	%xcc,	%l5,	%i4
	fpsub32s	%f1,	%f4,	%f27
	sethi	0x1CEA,	%i3
	sllx	%o1,	0x04,	%o3
	srl	%o7,	0x0B,	%g3
	bne,pn	%icc,	loop_2313
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	nop 	! 	tn	%icc,	0x5 changed by convert2hboot
	movvs	%xcc,	%g4,	%l6
loop_2313:
	fmovdl	%xcc,	%f28,	%f20
	bvs,a	%xcc,	loop_2314
	nop 	! 	tvs	%xcc,	0x3 changed by convert2hboot
	fmul8ulx16	%f6,	%f10,	%f0
	bvs,pt	%icc,	loop_2315
loop_2314:
	mulscc	%g5,	0x103D,	%g7
	ldd	[%l7 + 0x10],	%f16
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
loop_2315:
	fbne	%fcc3,	loop_2316
	prefetch	[%l7 + 0x54],	 0x1
	nop
	set	0x20, %g6
	std	%l2,	[%l7 + %g6]
	or	%o5,	%o2,	%l0
loop_2316:
	subc	%l4,	0x02AD,	%i7
	set	0x24, %o0
	lda	[%l7 + %o0] 0x11,	%f16
	bleu,pt	%icc,	loop_2317
	sll	%g2,	0x1F,	%i0
	nop 	! 	tvs	%xcc,	0x3 changed by convert2hboot
	flush	%l7 + 0x24
loop_2317:
	fmovrsgez	%i2,	%f28,	%f5
	udiv	%i5,	0x187E,	%o4
	movgu	%xcc,	%g6,	%i1
	srl	%l1,	%o0,	%o6
	nop
	setx	loop_2318,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	and	%g1,	%i6,	%l5
	movge	%xcc,	%i4,	%l3
	fmovsle	%icc,	%f10,	%f24
loop_2318:
	movle	%xcc,	%o1,	%i3
	bleu	%xcc,	loop_2319
	nop
	setx	loop_2320,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	movgu	%xcc,	%o3,	%o7
	movn	%xcc,	%g4,	%g3
loop_2319:
	pdist	%f24,	%f26,	%f14
loop_2320:
	nop 	! 	tneg	%icc,	0x1 changed by convert2hboot
	fmovdleu	%xcc,	%f4,	%f6
	ldsb	[%l7 + 0x12],	%l6
	orn	%g5,	%l2,	%o5
	movrlez	%g7,	%o2,	%l0
	edge16n	%l4,	%g2,	%i0
	fmovdn	%icc,	%f2,	%f27
	fmovd	%f12,	%f2
	movne	%icc,	%i7,	%i5
	movrne	%i2,	%o4,	%i1
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	sdivx	%g6,	0x06DE,	%o0
	bg,pt	%icc,	loop_2321
	edge16ln	%l1,	%o6,	%i6
	fmovrsne	%l5,	%f11,	%f29
	or	%g1,	%l3,	%i4
loop_2321:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tvc	%icc,	0x2 changed by convert2hboot
	xnor	%o1,	%i3,	%o7
	movrgz	%g4,	%o3,	%g3
	smul	%l6,	0x0650,	%g5
	bge,a	%xcc,	loop_2322
	addccc	%o5,	0x0376,	%l2
	movn	%xcc,	%o2,	%g7
	fmul8ulx16	%f14,	%f14,	%f18
loop_2322:
	nop 	! 	tsubcctv	%l0,	0x0ED8,	%l4 changed by convert2hboot
	fmovdcc	%icc,	%f30,	%f11
	ldd	[%l7 + 0x58],	%i0
	std	%f28,	[%l7 + 0x30]
	nop 	! 	tg	%icc,	0x3 changed by convert2hboot
	movle	%icc,	%i7,	%i5
	fbug,a	%fcc3,	loop_2323
	bn,a,pt	%icc,	loop_2324
	fbo	%fcc2,	loop_2325
	edge8n	%i2,	%o4,	%g2
loop_2323:
	udivcc	%i1,	0x0BDA,	%g6
loop_2324:
	nop 	! 	ta	%xcc,	0x5 changed by convert2hboot
loop_2325:
	movcs	%xcc,	%o0,	%l1
	fbue,a	%fcc1,	loop_2326
	movgu	%xcc,	%i6,	%l5
	xnor	%g1,	%l3,	%i4
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
loop_2326:
	movvc	%xcc,	%o1,	%i3
	fmovd	%f26,	%f18
	movleu	%icc,	%o7,	%o6
	xorcc	%g4,	%o3,	%l6
	fmovrslz	%g5,	%f14,	%f4
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
	andcc	%o5,	0x02F4,	%l2
	fors	%f0,	%f26,	%f9
	smul	%o2,	%g3,	%l0
	array8	%l4,	%g7,	%i0
	edge8n	%i5,	%i7,	%o4
	sllx	%g2,	%i1,	%i2
	bpos,a,pn	%xcc,	loop_2327
	edge8n	%o0,	%g6,	%l1
	fbug	%fcc1,	loop_2328
	bcs	%xcc,	loop_2329
loop_2327:
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	fand	%f24,	%f24,	%f10
loop_2328:
	bl,a	%xcc,	loop_2330
loop_2329:
	bvs	loop_2331
	bneg,pn	%icc,	loop_2332
	umul	%i6,	%l5,	%l3
loop_2330:
	smulcc	%i4,	0x1D85,	%g1
loop_2331:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2332:
	subccc	%i3,	0x0DAB,	%o7
	xnorcc	%o6,	0x12FD,	%g4
	array8	%o1,	%o3,	%l6
	nop
	setx loop_2333, %l0, %l1
	jmpl %l1, %o5
	movrgz	%l2,	0x1E2,	%g5
	movvs	%icc,	%g3,	%l0
	movcs	%icc,	%o2,	%g7
loop_2333:
	nop
	set	0x08, %g5
	nop	 ! 	lduha	[%l7 + %g5] 0x81,	%l4 ASI use replaced by convert2hboot
	nop 	! 	tvs	%xcc,	0x5 changed by convert2hboot
	bge	%xcc,	loop_2334
	nop
	set	0x70, %g2
	stx	%i0,	[%l7 + %g2]
	nop
	setx loop_2335, %l0, %l1
	jmpl %l1, %i5
	array16	%i7,	%g2,	%o4
loop_2334:
	bneg,a,pt	%icc,	loop_2336
	nop 	! 	tsubcctv	%i1,	0x03D9,	%i2 changed by convert2hboot
loop_2335:
	fmovse	%icc,	%f31,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2336:
	fmuld8sux16	%f14,	%f30,	%f22
	brlz,a	%g6,	loop_2337
	fba	%fcc3,	loop_2338
	bgu,pn	%icc,	loop_2339
	sll	%l1,	%o0,	%l5
loop_2337:
	nop
	set	0x24, %g3
	lda	[%l7 + %g3] 0x15,	%f28
loop_2338:
	nop
	set	0x40, %i4
	nop	 ! 	stda	%f0,	[%l7 + %i4] 0x0c ASI use replaced by convert2hboot
loop_2339:
	fbu,a	%fcc3,	loop_2340
	swap	[%l7 + 0x54],	%l3
	ldsb	[%l7 + 0x7C],	%i4
	fone	%f2
loop_2340:
	subc	%g1,	%i3,	%o7
	movrgz	%o6,	%i6,	%g4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	mulx	%o1,	0x1D89,	%o5
	stx	%g5,	[%l7 + 0x30]
	movl	%icc,	%l2,	%g3
	fsrc2	%f4,	%f0
	sdivcc	%l0,	0x15BD,	%o2
	umul	%g7,	%l4,	%i0
	fcmpeq16	%f6,	%f20,	%i7
	fmovdneg	%xcc,	%f6,	%f10
	fsrc1s	%f14,	%f4
	sdiv	%i5,	0x0FEE,	%g2
	sdivx	%i1,	0x0596,	%i2
	movrlz	%g6,	%o4,	%o0
	nop 	! 	tne	%xcc,	0x5 changed by convert2hboot
	call	loop_2341
	brnz,a	%l5,	loop_2342
	fmovdl	%xcc,	%f11,	%f6
	nop 	! 	tsubcctv	%l1,	%l3,	%g1 changed by convert2hboot
loop_2341:
	nop 	! 	tcs	%icc,	0x7 changed by convert2hboot
loop_2342:
	ldx	[%l7 + 0x50],	%i3
	orn	%i4,	0x1BD3,	%o6
	wr	%g0,	0x89,	%asi
	andn	%i6,	0x18A8,	%o7
	ldsw	[%l7 + 0x4C],	%g4
	movcs	%xcc,	%o3,	%l6
	subc	%o1,	%o5,	%g5
	array8	%l2,	%g3,	%l0
	orncc	%o2,	0x0F99,	%g7
	movvc	%icc,	%l4,	%i7
	nop 	! 	tl	%xcc,	0x2 changed by convert2hboot
	set	0x6D, %i6
	nop	 ! 	lduba	[%l7 + %i6] 0x15,	%i5 ASI use replaced by convert2hboot
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	wr	%g0,	0x81,	%asi
	mova	%xcc,	%i1,	%g2
	fbul,a	%fcc3,	loop_2343
	or	%g6,	%i2,	%o0
	array8	%o4,	%l1,	%l3
	andn	%l5,	0x113D,	%i3
loop_2343:
	orn	%i4,	0x0B70,	%o6
	fcmped	%fcc3,	%f22,	%f30
	wr	%g0,	0x57,	%asi
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
	srlx	%g1,	0x18,	%g4
	fbo,a	%fcc0,	loop_2344
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	andncc	%o7,	%o3,	%l6
	fpsub32	%f4,	%f24,	%f14
loop_2344:
	edge8l	%o5,	%o1,	%g5
	fbg	%fcc2,	loop_2345
	stb	%g3,	[%l7 + 0x2A]
	ldd	[%l7 + 0x48],	%l2
	fandnot2s	%f7,	%f19,	%f10
loop_2345:
	fxnor	%f30,	%f16,	%f8
	and	%l0,	%g7,	%l4
	andcc	%i7,	0x0898,	%o2
	fands	%f1,	%f23,	%f22
	edge8ln	%i0,	%i5,	%g2
	nop 	! 	tgu	%xcc,	0x4 changed by convert2hboot
	ba,pt	%icc,	loop_2346
	membar	0x1B
	nop 	! 	tleu	%xcc,	0x5 changed by convert2hboot
	fpadd16	%f18,	%f30,	%f20
loop_2346:
	sll	%g6,	%i1,	%o0
	udivcc	%o4,	0x1584,	%l1
	edge32n	%i2,	%l3,	%l5
	alignaddr	%i3,	%i4,	%i6
	addccc	%o6,	0x0607,	%g4
	wr	%g0,	0x80,	%asi
	fcmpgt16	%f4,	%f6,	%o3
	edge16n	%o7,	%l6,	%o5
	mova	%icc,	%o1,	%g3
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	nop	 ! 	casa	[%l6] 0x89,	%l2,	%g5 ASI use replaced by convert2hboot
	fbg,a	%fcc2,	loop_2347
	sub	%l0,	0x0AE5,	%l4
	bge	%xcc,	loop_2348
	movre	%i7,	%g7,	%o2
loop_2347:
	movpos	%icc,	%i5,	%g2
	array16	%i0,	%i1,	%g6
loop_2348:
	bvs,a	%icc,	loop_2349
	subc	%o0,	%o4,	%l1
	edge8	%l3,	%i2,	%l5
	membar	0x6B
loop_2349:
	nop
	set	0x40, %o2
	nop	 ! 	ldda	[%l7 + %o2] 0x89,	%f16 ASI use replaced by convert2hboot
	edge32ln	%i3,	%i4,	%o6
	fbne	%fcc2,	loop_2350
	movvs	%xcc,	%g4,	%g1
	srax	%i6,	0x1F,	%o7
	edge16	%l6,	%o5,	%o3
loop_2350:
	fmovdn	%icc,	%f14,	%f15
	subcc	%o1,	%l2,	%g3
	fbule	%fcc0,	loop_2351
	umul	%g5,	%l0,	%i7
	ble,pn	%xcc,	loop_2352
	brgez	%g7,	loop_2353
loop_2351:
	popc	%o2,	%i5
	udivcc	%g2,	0x0AED,	%i0
loop_2352:
	movne	%xcc,	%i1,	%g6
loop_2353:
	fble,a	%fcc3,	loop_2354
	fble	%fcc2,	loop_2355
	addc	%o0,	%l4,	%l1
	prefetch	[%l7 + 0x10],	 0x1
loop_2354:
	andcc	%o4,	0x1E8F,	%l3
loop_2355:
	nop
	set	0x20, %i2
	nop	 ! 	stda	%l4,	[%l7 + %i2] 0x18 ASI use replaced by convert2hboot
	set	0x5C, %i1
	nop	 ! 	ldsha	[%l7 + %i1] 0x80,	%i2 ASI use replaced by convert2hboot
	mova	%xcc,	%i4,	%o6
	set	0x5C, %o5
	nop	 ! 	ldsha	[%l7 + %o5] 0x15,	%i3 ASI use replaced by convert2hboot
	add	%g4,	0x1A7E,	%i6
	popc	0x0B64,	%o7
	fcmpne32	%f10,	%f4,	%g1
	edge32n	%o5,	%o3,	%l6
	movgu	%xcc,	%o1,	%g3
	movrne	%g5,	0x155,	%l2
	sdiv	%i7,	0x05A8,	%l0
	brnz	%o2,	loop_2356
	edge8n	%g7,	%g2,	%i0
	edge32l	%i1,	%g6,	%i5
	edge8l	%l4,	%o0,	%o4
loop_2356:
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
	edge16ln	%l3,	%l1,	%l5
	movre	%i2,	%o6,	%i3
	movge	%icc,	%g4,	%i4
	sdivcc	%o7,	0x1420,	%i6
	andncc	%o5,	%g1,	%l6
	brz	%o1,	loop_2357
	movne	%xcc,	%o3,	%g5
	be	%xcc,	loop_2358
	or	%g3,	0x0A16,	%l2
loop_2357:
	nop 	! 	ta	%icc,	0x1 changed by convert2hboot
	fbuge	%fcc2,	loop_2359
loop_2358:
	movrlz	%i7,	0x2B3,	%o2
	and	%l0,	0x1CCF,	%g2
	edge8	%g7,	%i0,	%g6
loop_2359:
	nop 	! 	taddcc	%i5,	0x147F,	%i1 changed by convert2hboot
	nop 	! 	sir	0x0AEA changed by convert2hboot
	nop 	! 	tsubcctv	%o0,	0x0E46,	%o4 changed by convert2hboot
	fble	%fcc2,	loop_2360
	movvs	%xcc,	%l3,	%l4
	edge8ln	%l1,	%i2,	%l5
	edge32	%o6,	%g4,	%i4
loop_2360:
	edge16	%i3,	%i6,	%o5
	fbe,a	%fcc2,	loop_2361
	umul	%g1,	0x14FB,	%o7
	ldsb	[%l7 + 0x60],	%o1
	edge8	%l6,	%o3,	%g5
loop_2361:
	fcmpne32	%f8,	%f0,	%g3
	wr	%g0,	0xf1,	%asi
	membar	#Sync
	fands	%f7,	%f1,	%f15
	bvs,a,pt	%icc,	loop_2362
	srlx	%i7,	0x05,	%o2
	movvc	%icc,	%l2,	%g2
	bvc	%icc,	loop_2363
loop_2362:
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	movrgz	%g7,	%i0,	%g6
	fmovrdne	%l0,	%f24,	%f28
loop_2363:
	subccc	%i1,	%o0,	%o4
	movgu	%icc,	%l3,	%i5
	xnorcc	%l1,	%l4,	%l5
	flush	%l7 + 0x40
	subc	%i2,	0x1365,	%o6
	edge32n	%g4,	%i3,	%i4
	fnot1s	%f19,	%f15
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%i6,	%g1
	addc	%o7,	0x0D88,	%o5
	sdiv	%l6,	0x1F18,	%o3
	bg,pn	%xcc,	loop_2364
	nop 	! 	tne	%icc,	0x0 changed by convert2hboot
	st	%f26,	[%l7 + 0x0C]
	movneg	%icc,	%g5,	%g3
loop_2364:
	smul	%o1,	0x0A60,	%i7
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	fbg	%fcc3,	loop_2365
	alignaddrl	%l2,	%o2,	%g2
	fbu	%fcc2,	loop_2366
	nop 	! 	tvc	%xcc,	0x7 changed by convert2hboot
loop_2365:
	fcmpeq16	%f22,	%f8,	%i0
	movgu	%xcc,	%g6,	%g7
loop_2366:
	nop
	set	0x38, %i7
	nop	 ! 	ldswa	[%l7 + %i7] 0x81,	%i1 ASI use replaced by convert2hboot
	mova	%icc,	%o0,	%l0
	fmovrsne	%o4,	%f21,	%f28
	fnands	%f17,	%f2,	%f14
	fmovrdne	%l3,	%f14,	%f30
	and	%i5,	%l1,	%l5
	fbue	%fcc0,	loop_2367
	or	%l4,	0x0F47,	%i2
	xor	%o6,	0x134F,	%g4
	or	%i4,	0x0AE6,	%i3
loop_2367:
	fmovd	%f0,	%f30
	fmovrdgez	%g1,	%f22,	%f22
	udiv	%o7,	0x027F,	%i6
	alignaddr	%o5,	%o3,	%l6
	ldub	[%l7 + 0x2B],	%g5
	ldd	[%l7 + 0x38],	%o0
	array8	%i7,	%l2,	%o2
	brlz	%g3,	loop_2368
	andcc	%g2,	%g6,	%g7
	edge32l	%i0,	%i1,	%l0
	fbn,a	%fcc2,	loop_2369
loop_2368:
	ldx	[%l7 + 0x78],	%o4
	movrne	%l3,	%o0,	%i5
	alignaddr	%l5,	%l1,	%i2
loop_2369:
	bvs,a	%xcc,	loop_2370
	popc	0x007D,	%o6
	subcc	%g4,	0x08CE,	%i4
	ldx	[%l7 + 0x30],	%l4
loop_2370:
	movne	%xcc,	%i3,	%g1
	fmovdcs	%icc,	%f12,	%f17
	nop 	! 	tsubcc	%o7,	0x0E8E,	%o5 changed by convert2hboot
	set	0x70, %o4
	nop	 ! 	stwa	%o3,	[%l7 + %o4] 0x10 ASI use replaced by convert2hboot
	edge16n	%i6,	%l6,	%g5
	nop 	! 	tge	%icc,	0x2 changed by convert2hboot
	movcc	%icc,	%i7,	%o1
	movn	%xcc,	%l2,	%o2
	set	0x28, %o6
	lda	[%l7 + %o6] 0x81,	%f1
	edge16	%g3,	%g2,	%g7
	movle	%xcc,	%g6,	%i1
	fcmple32	%f26,	%f28,	%i0
	brz,a	%l0,	loop_2371
	xnor	%l3,	%o4,	%i5
	movl	%xcc,	%l5,	%o0
	fnegs	%f31,	%f19
loop_2371:
	fmovscc	%xcc,	%f28,	%f16
	movgu	%xcc,	%l1,	%o6
	fxnor	%f16,	%f10,	%f12
	nop 	! 	te	%icc,	0x6 changed by convert2hboot
	edge8n	%g4,	%i2,	%l4
	set	0x40, %i5
	nop	 ! 	stda	%f16,	[%l7 + %i5] 0x81 ASI use replaced by convert2hboot
	smul	%i4,	%g1,	%o7
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	fmovrdlez	%i3,	%f10,	%f2
	fbuge,a	%fcc2,	loop_2372
	nop 	! 	tl	%xcc,	0x3 changed by convert2hboot
	movvs	%icc,	%o5,	%o3
	fornot2	%f8,	%f28,	%f20
loop_2372:
	nop
	set	0x6C, %i0
	ldsw	[%l7 + %i0],	%i6
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	subc	%l6,	0x19F4,	%g5
	ldsw	[%l7 + 0x7C],	%o1
	xor	%l2,	%i7,	%g3
	edge16l	%g2,	%g7,	%o2
	umul	%g6,	0x02FA,	%i1
	fbuge,a	%fcc2,	loop_2373
	movl	%xcc,	%l0,	%l3
	edge32	%i0,	%o4,	%i5
	movvs	%xcc,	%l5,	%l1
loop_2373:
	addc	%o0,	0x1C32,	%g4
	movneg	%icc,	%i2,	%o6
	udivx	%i4,	0x06DD,	%l4
	wr	%g0,	0x24,	%asi
	wr	%g0,	0x89,	%asi
	sta	%f23,	[%l7 + 0x5C] %asi
	wr	%g0,	0x10,	%asi
	fpadd16s	%f20,	%f27,	%f23
	mulx	%g1,	0x1965,	%o3
	fbl	%fcc0,	loop_2374
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc0,	loop_2375
	edge16	%o5,	%l6,	%g5
loop_2374:
	subccc	%o1,	%l2,	%i7
	andn	%g3,	%g2,	%i6
loop_2375:
	nop 	! 	taddcc	%o2,	%g6,	%g7 changed by convert2hboot
	fpackfix	%f18,	%f23
	fornot2s	%f29,	%f26,	%f9
	sdivcc	%i1,	0x02A5,	%l3
	wr	%g0,	0xe3,	%asi
	nop
	setx	loop_2376,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movne	%icc,	%l0,	%o4
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
	fnegs	%f12,	%f7
loop_2376:
	fmovrdne	%i5,	%f8,	%f14
	fcmpd	%fcc3,	%f10,	%f24
	subc	%l1,	0x0B6F,	%l5
	movleu	%icc,	%g4,	%i2
	ba,a,pn	%icc,	loop_2377
	movrlz	%o0,	%i4,	%o6
	edge8ln	%o7,	%i3,	%g1
	alignaddrl	%l4,	%o3,	%l6
loop_2377:
	mulx	%o5,	%o1,	%l2
	mulx	%i7,	0x17A9,	%g3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	array16	%o2,	%g6,	%g7
	orcc	%i6,	0x0EB0,	%i1
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
	movgu	%xcc,	%i0,	%l0
	ldsw	[%l7 + 0x70],	%l3
	srlx	%o4,	0x0D,	%i5
	orncc	%l5,	%g4,	%l1
	fmovdne	%xcc,	%f11,	%f2
	fxor	%f20,	%f14,	%f30
	fzero	%f26
	srax	%i2,	%i4,	%o6
	subcc	%o7,	0x1A3D,	%o0
	sub	%i3,	0x136B,	%l4
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	fnor	%f10,	%f18,	%f28
	fbne,a	%fcc1,	loop_2378
	sethi	0x1648,	%o3
	fmul8x16au	%f19,	%f8,	%f30
	ldx	[%l7 + 0x60],	%g1
loop_2378:
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	or	%o5,	%o1,	%l2
	addcc	%i7,	0x055A,	%l6
	movle	%icc,	%g3,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tle	%icc,	0x4 changed by convert2hboot
	sdiv	%g2,	0x1A5A,	%o2
	fbule	%fcc0,	loop_2379
	bcc,a	loop_2380
	fcmpeq32	%f8,	%f18,	%g6
	swap	[%l7 + 0x24],	%g7
loop_2379:
	srlx	%i1,	0x09,	%i0
loop_2380:
	sdivx	%l0,	0x0B15,	%i6
	fba	%fcc1,	loop_2381
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%l3,	%i5
	nop 	! 	sir	0x1B93 changed by convert2hboot
loop_2381:
	bge,a	loop_2382
	movre	%o4,	%g4,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f26,	%f14
loop_2382:
	brlz	%l5,	loop_2383
	andcc	%i4,	0x0074,	%i2
	fmovdvs	%xcc,	%f29,	%f30
	fmuld8sux16	%f2,	%f24,	%f28
loop_2383:
	nop
	set	0x30, %l0
	nop	 ! 	ldxa	[%l7 + %l0] 0x10,	%o7 ASI use replaced by convert2hboot
	set	0x14, %o1
	nop	 ! 	ldswa	[%l7 + %o1] 0x0c,	%o0 ASI use replaced by convert2hboot
	movrlz	%o6,	0x1B7,	%i3
	srl	%l4,	%g1,	%o3
	move	%xcc,	%o5,	%l2
	sth	%o1,	[%l7 + 0x34]
	edge32l	%l6,	%g3,	%g5
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%f22
	fmovsneg	%icc,	%f21,	%f0
	movcc	%xcc,	%i7,	%o2
	nop 	! 	tn	%xcc,	0x0 changed by convert2hboot
	fmovdcs	%xcc,	%f31,	%f27
	edge16l	%g6,	%g2,	%i1
	movn	%icc,	%i0,	%l0
	sll	%i6,	0x07,	%l3
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	movvs	%xcc,	%g7,	%o4
	bg,pn	%icc,	loop_2384
	sll	%g4,	%i5,	%l5
	andn	%l1,	%i2,	%o7
	andncc	%o0,	%i4,	%i3
loop_2384:
	movne	%xcc,	%o6,	%l4
	sethi	0x0490,	%g1
	bneg,pn	%icc,	loop_2385
	array8	%o3,	%l2,	%o5
	fmul8x16al	%f19,	%f30,	%f16
	movleu	%icc,	%l6,	%g3
loop_2385:
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	and	%o1,	0x0C36,	%g5
	fmovdn	%icc,	%f15,	%f13
	fmovrdne	%o2,	%f4,	%f14
	xnorcc	%g6,	%i7,	%i1
	movle	%icc,	%i0,	%g2
	wr	%g0,	0x88,	%asi
	sethi	0x041F,	%l3
	fmovrde	%l0,	%f12,	%f30
	nop 	! 	sir	0x0F6A changed by convert2hboot
	mova	%icc,	%o4,	%g7
	smulcc	%g4,	%l5,	%i5
	umul	%i2,	%l1,	%o7
	fmovspos	%xcc,	%f28,	%f30
	array32	%i4,	%i3,	%o6
	nop 	! 	tvc	%xcc,	0x3 changed by convert2hboot
	set	0x40, %l6
	nop	 ! 	stda	%f16,	[%l7 + %l6] 0x88 ASI use replaced by convert2hboot
	fmovspos	%xcc,	%f2,	%f4
	be	%xcc,	loop_2386
	movrne	%l4,	%o0,	%g1
	sth	%o3,	[%l7 + 0x52]
	fones	%f3
loop_2386:
	movleu	%xcc,	%l2,	%l6
	fbuge,a	%fcc1,	loop_2387
	fmovde	%xcc,	%f9,	%f5
	sll	%g3,	%o5,	%o1
	srl	%g5,	%g6,	%o2
loop_2387:
	bn	loop_2388
	movg	%xcc,	%i1,	%i0
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	addccc	%g2,	0x1EB4,	%i6
loop_2388:
	fmovrdgz	%i7,	%f0,	%f22
	fandnot1	%f22,	%f10,	%f8
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	array16	%l3,	%l0,	%o4
	fble,a	%fcc1,	loop_2389
	brz	%g7,	loop_2390
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
	array32	%l5,	%i5,	%i2
loop_2389:
	nop
	setx loop_2391, %l0, %l1
	jmpl %l1, %l1
loop_2390:
	brlez	%o7,	loop_2392
	lduw	[%l7 + 0x18],	%i4
	movl	%xcc,	%g4,	%i3
loop_2391:
	nop
	set	0x08, %o3
	nop	 ! 	stwa	%o6,	[%l7 + %o3] 0x22 ASI use replaced by convert2hboot
	membar	#Sync
loop_2392:
	nop
	wr	%g0,	0x04,	%asi
	edge16l	%o0,	%o3,	%l2
	xnorcc	%g1,	%g3,	%o5
	edge16l	%l6,	%o1,	%g5
	udiv	%o2,	0x1B3F,	%i1
	edge16n	%g6,	%i0,	%g2
	movneg	%icc,	%i6,	%l3
	nop 	! 	tg	%xcc,	0x1 changed by convert2hboot
	fba,a	%fcc0,	loop_2393
	faligndata	%f12,	%f18,	%f30
	mova	%icc,	%i7,	%o4
	movl	%icc,	%g7,	%l5
loop_2393:
	xnorcc	%l0,	%i5,	%i2
	fxors	%f31,	%f20,	%f16
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
	sll	%l1,	0x1B,	%o7
	alignaddrl	%i4,	%i3,	%g4
	fnegd	%f14,	%f22
	set	0x08, %g7
	nop	 ! 	swapa	[%l7 + %g7] 0x80,	%o6 ASI use replaced by convert2hboot
	subcc	%l4,	0x0B2E,	%o0
	smul	%l2,	0x14C3,	%o3
	fmovsvs	%icc,	%f11,	%f6
	membar	0x08
	brz,a	%g1,	loop_2394
	fxnors	%f16,	%f21,	%f6
	bcs,a	loop_2395
	fmul8sux16	%f4,	%f16,	%f6
loop_2394:
	fabsd	%f22,	%f28
	movne	%xcc,	%o5,	%l6
loop_2395:
	fbn,a	%fcc1,	loop_2396
	mulx	%g3,	0x0CE3,	%g5
	bleu,a,pt	%xcc,	loop_2397
	sllx	%o2,	%i1,	%g6
loop_2396:
	bn,a	%xcc,	loop_2398
	orcc	%o1,	%g2,	%i6
loop_2397:
	membar	0x69
	fpadd16	%f14,	%f30,	%f14
loop_2398:
	smulcc	%l3,	0x0F71,	%i7
	srax	%i0,	0x0D,	%g7
	fmovdcc	%icc,	%f6,	%f18
	andncc	%o4,	%l5,	%l0
	sdiv	%i2,	0x0C5C,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne	%fcc0,	loop_2399
	sdivx	%i5,	0x0B36,	%i4
	move	%xcc,	%o7,	%g4
	set	0x40, %l1
	nop	 ! 	stda	%f16,	[%l7 + %l1] 0x14 ASI use replaced by convert2hboot
loop_2399:
	fmovrdlez	%o6,	%f4,	%f26
	pdist	%f18,	%f12,	%f28
	addcc	%i3,	0x1E72,	%l4
	movre	%l2,	0x1E3,	%o3
	orcc	%g1,	%o0,	%l6
	edge16l	%g3,	%o5,	%o2
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	fmovrsgz	%i1,	%f6,	%f31
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	ldstub	[%l7 + 0x4F],	%g6
	fsrc1	%f0,	%f2
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	subc	%o1,	%g2,	%g5
	fpsub16s	%f21,	%f26,	%f11
	array8	%i6,	%l3,	%i7
	set	0x10, %o7
	nop	 ! 	ldda	[%l7 + %o7] 0x2b,	%g6 ASI use replaced by convert2hboot
	srl	%i0,	%o4,	%l0
	edge8ln	%l5,	%l1,	%i5
	edge16l	%i4,	%i2,	%g4
	brlez,a	%o6,	loop_2400
	edge16l	%o7,	%l4,	%l2
	orcc	%o3,	0x186C,	%g1
	set	0x38, %l3
	nop	 ! 	stba	%o0,	[%l7 + %l3] 0x2b ASI use replaced by convert2hboot
	membar	#Sync
loop_2400:
	movgu	%icc,	%i3,	%g3
	edge8l	%o5,	%o2,	%l6
	set	0x38, %g4
	nop	 ! 	lduwa	[%l7 + %g4] 0x18,	%g6 ASI use replaced by convert2hboot
	nop
	set	0x48, %l2
	ldx	[%l7 + %l2],	%i1
	mulscc	%g2,	%o1,	%i6
	edge8ln	%l3,	%i7,	%g7
	fmovrsgez	%i0,	%f9,	%f2
	fmovrslz	%o4,	%f16,	%f24
	andn	%g5,	0x1C2A,	%l0
	nop 	! 	te	%xcc,	0x7 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x7 changed by convert2hboot
	brgez	%l1,	loop_2401
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	fbu,a	%fcc1,	loop_2402
	fornot2	%f30,	%f12,	%f24
loop_2401:
	nop
	set	0x00, %g1
	nop	 ! 	ldxa	[%g0 + %g1] 0x50,	%i5 ASI use replaced by convert2hboot
loop_2402:
	fsrc2	%f4,	%f14
	bg,a,pn	%xcc,	loop_2403
	fmovsa	%xcc,	%f28,	%f20
	mova	%xcc,	%l5,	%i4
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
loop_2403:
	ldub	[%l7 + 0x18],	%i2
	movg	%xcc,	%o6,	%g4
	smulcc	%o7,	%l2,	%o3
	move	%icc,	%g1,	%l4
	nop
	set	0x6D, %l4
	ldstub	[%l7 + %l4],	%i3
	sdiv	%g3,	0x169A,	%o5
	fbg,a	%fcc3,	loop_2404
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	edge32n	%o2,	%l6,	%g6
	movrgz	%o0,	%g2,	%o1
loop_2404:
	xnorcc	%i1,	0x02A8,	%i6
	set	0x5F, %l5
	nop	 ! 	lduba	[%l7 + %l5] 0x88,	%l3 ASI use replaced by convert2hboot
	nop 	! 	tsubcctv	%i7,	0x1F21,	%i0 changed by convert2hboot
	fmovsvc	%icc,	%f31,	%f15
	bcs,a,pt	%icc,	loop_2405
	sra	%o4,	%g5,	%g7
	nop 	! 	tpos	%icc,	0x0 changed by convert2hboot
	addcc	%l1,	0x115B,	%i5
loop_2405:
	movcc	%xcc,	%l5,	%i4
	nop 	! 	tl	%icc,	0x4 changed by convert2hboot
	edge8l	%l0,	%o6,	%g4
	faligndata	%f6,	%f22,	%f2
	bneg,pn	%xcc,	loop_2406
	edge8n	%o7,	%l2,	%o3
	andcc	%g1,	0x1DDE,	%i2
	alignaddr	%i3,	%g3,	%o5
loop_2406:
	movrgez	%o2,	%l4,	%g6
	fmovsl	%icc,	%f12,	%f4
	movn	%xcc,	%l6,	%g2
	array16	%o1,	%i1,	%o0
	nop 	! 	tsubcc	%i6,	%l3,	%i0 changed by convert2hboot
	fone	%f10
	bge,a	%icc,	loop_2407
	fcmpgt16	%f10,	%f12,	%i7
	fones	%f5
	fabss	%f15,	%f18
loop_2407:
	nop 	! 	tsubcc	%g5,	0x1A66,	%o4 changed by convert2hboot
	stx	%g7,	[%l7 + 0x40]
	fmul8ulx16	%f6,	%f16,	%f18
	fcmple32	%f20,	%f4,	%i5
	fnors	%f30,	%f25,	%f2
	xor	%l1,	0x1BE4,	%l5
	wr	%g0,	0x1e,	%asi
	membar	#Sync
	fpsub32s	%f25,	%f24,	%f19
	fzeros	%f11
	sdiv	%i4,	0x1CE6,	%l0
	fands	%f22,	%f15,	%f24
	orcc	%o6,	%g4,	%o7
	addcc	%o3,	0x0369,	%l2
	st	%f29,	[%l7 + 0x24]
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
	fmovdvc	%xcc,	%f8,	%f31
	fnot1	%f28,	%f14
	call	loop_2408
	nop 	! 	taddcctv	%g1,	%i3,	%i2 changed by convert2hboot
	wr	%g0,	0x0c,	%asi
loop_2408:
	and	%o2,	%o5,	%l4
	nop 	! 	tle	%xcc,	0x3 changed by convert2hboot
	edge8ln	%l6,	%g6,	%g2
	movleu	%xcc,	%o1,	%i1
	array8	%o0,	%i6,	%i0
	fcmpd	%fcc2,	%f22,	%f8
	ba,a,pt	%icc,	loop_2409
	edge32ln	%l3,	%g5,	%i7
	udiv	%g7,	0x0A6B,	%o4
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
loop_2409:
	edge32n	%i5,	%l5,	%i4
	array16	%l1,	%l0,	%o6
	ble,a,pn	%icc,	loop_2410
	addcc	%o7,	0x0CA5,	%o3
	fblg,a	%fcc2,	loop_2411
	sdivx	%l2,	0x0F20,	%g1
loop_2410:
	udivx	%g4,	0x07E9,	%i3
	movrlz	%g3,	%i2,	%o5
loop_2411:
	nop 	! 	sir	0x0DE6 changed by convert2hboot
	ldx	[%l7 + 0x60],	%l4
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	orn	%o2,	0x02D0,	%g6
	movneg	%icc,	%l6,	%o1
	fpadd32	%f24,	%f10,	%f10
	nop 	! 	tl	%xcc,	0x7 changed by convert2hboot
	fsrc2	%f20,	%f8
	fone	%f30
	wr	%g0,	0x11,	%asi
	brnz	%i1,	loop_2412
	subcc	%o0,	%i6,	%i0
	edge8l	%l3,	%i7,	%g5
	udiv	%g7,	0x120E,	%i5
loop_2412:
	stx	%o4,	[%l7 + 0x10]
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
	nop 	! 	tle	%xcc,	0x0 changed by convert2hboot
	fmovscs	%xcc,	%f29,	%f14
	fmovda	%icc,	%f25,	%f15
	set	0x28, %g6
	nop	 ! 	lduwa	[%l7 + %g6] 0x04,	%i4 ASI use replaced by convert2hboot
	ld	[%l7 + 0x0C],	%f16
	membar	0x2D
	fcmple16	%f18,	%f16,	%l1
	fpadd16	%f16,	%f0,	%f8
	movrlez	%l5,	%o6,	%o7
	udivcc	%o3,	0x0DC1,	%l0
	fnegs	%f18,	%f5
	fpsub32s	%f8,	%f22,	%f25
	sdivcc	%l2,	0x0D2C,	%g4
	ld	[%l7 + 0x2C],	%f22
	fandnot2s	%f29,	%f2,	%f2
	movvs	%xcc,	%g1,	%g3
	xor	%i2,	%o5,	%i3
	edge16l	%o2,	%g6,	%l6
	movpos	%xcc,	%o1,	%g2
	fbne	%fcc0,	loop_2413
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	sdivcc	%i1,	0x189B,	%o0
	sllx	%i6,	%i0,	%l4
loop_2413:
	movre	%i7,	%l3,	%g7
	array32	%g5,	%i5,	%o4
	fors	%f27,	%f26,	%f29
	flush	%l7 + 0x44
	fbn,a	%fcc2,	loop_2414
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	or	%i4,	0x17E0,	%l1
	fcmple16	%f26,	%f28,	%l5
loop_2414:
	fcmpne32	%f10,	%f22,	%o7
	swap	[%l7 + 0x64],	%o3
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
	fba,a	%fcc0,	loop_2415
	fsrc2s	%f13,	%f5
	orncc	%o6,	0x1A37,	%l0
	brlez,a	%g4,	loop_2416
loop_2415:
	fbule,a	%fcc1,	loop_2417
	fones	%f25
	sdiv	%g1,	0x06DE,	%l2
loop_2416:
	swap	[%l7 + 0x08],	%i2
loop_2417:
	xor	%g3,	%i3,	%o5
	wr	%g0,	0x18,	%asi
	sta	%f6,	[%l7 + 0x34] %asi
	fbg,a	%fcc1,	loop_2418
	fbo,a	%fcc3,	loop_2419
	addc	%g6,	%l6,	%o2
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
loop_2418:
	bcs	loop_2420
loop_2419:
	fmul8x16au	%f23,	%f1,	%f26
	xnor	%o1,	%g2,	%o0
	andcc	%i6,	0x15A1,	%i0
loop_2420:
	add	%l4,	0x0DD1,	%i7
	andncc	%l3,	%i1,	%g5
	udivcc	%i5,	0x1C8C,	%g7
	umul	%o4,	%l1,	%i4
	fmovsleu	%xcc,	%f24,	%f18
	bvc,a	%icc,	loop_2421
	bcc,pn	%icc,	loop_2422
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc3,	%f31,	%f28
loop_2421:
	brlez,a	%o7,	loop_2423
loop_2422:
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	nop 	! 	taddcctv	%o3,	0x13A0,	%o6 changed by convert2hboot
	bl,a,pn	%icc,	loop_2424
loop_2423:
	edge32	%l0,	%l5,	%g4
	and	%g1,	0x1ABB,	%l2
	fmovsg	%xcc,	%f11,	%f24
loop_2424:
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	subccc	%g3,	%i2,	%i3
	movle	%icc,	%g6,	%l6
	movvc	%icc,	%o5,	%o1
	fmovrslz	%g2,	%f12,	%f30
	andn	%o2,	%i6,	%i0
	edge32	%l4,	%o0,	%l3
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	mulscc	%i7,	0x0D1B,	%i1
	set	0x24, %g5
	nop	 ! 	swapa	[%l7 + %g5] 0x11,	%g5 ASI use replaced by convert2hboot
	smulcc	%g7,	%o4,	%i5
	subc	%i4,	0x17A1,	%o7
	edge32ln	%l1,	%o6,	%l0
	fcmpne32	%f6,	%f24,	%l5
	ld	[%l7 + 0x24],	%f12
	fsrc2s	%f9,	%f0
	edge8l	%g4,	%o3,	%g1
	stw	%l2,	[%l7 + 0x34]
	fmovdcs	%icc,	%f28,	%f31
	edge8	%g3,	%i3,	%g6
	mulx	%l6,	0x1A6E,	%i2
	srl	%o1,	%g2,	%o5
	ldstub	[%l7 + 0x11],	%o2
	fandnot2s	%f8,	%f22,	%f30
	set	0x70, %o0
	nop	 ! 	stda	%i6,	[%l7 + %o0] 0x23 ASI use replaced by convert2hboot
	membar	#Sync
	fmovrse	%i0,	%f4,	%f10
	subcc	%o0,	0x118D,	%l3
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	pdist	%f22,	%f0,	%f22
	wr	%g0,	0x11,	%asi
	movneg	%xcc,	%i1,	%g5
	edge8l	%l4,	%o4,	%i5
	movrgz	%i4,	0x0A3,	%g7
	subc	%o7,	%l1,	%o6
	fmul8x16	%f0,	%f16,	%f2
	edge8l	%l0,	%g4,	%o3
	nop 	! 	tcc	%xcc,	0x7 changed by convert2hboot
	movgu	%xcc,	%l5,	%g1
	fmovsleu	%icc,	%f9,	%f18
	set	0x20, %g2
	nop	 ! 	ldda	[%l7 + %g2] 0x15,	%g2 ASI use replaced by convert2hboot
	fbuge	%fcc2,	loop_2425
	fsrc2s	%f0,	%f2
	ldd	[%l7 + 0x70],	%f22
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
loop_2425:
	nop 	! 	tge	%xcc,	0x1 changed by convert2hboot
	addcc	%i3,	0x0BF4,	%g6
	popc	%l2,	%l6
	array32	%i2,	%o1,	%g2
	bge,a	%xcc,	loop_2426
	fmovdne	%icc,	%f21,	%f21
	bge,a	%xcc,	loop_2427
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
loop_2426:
	fnor	%f22,	%f28,	%f26
	movrlez	%o2,	%i6,	%i0
loop_2427:
	movleu	%icc,	%o0,	%l3
	sdivcc	%o5,	0x18BF,	%i1
	movne	%icc,	%i7,	%l4
	sll	%o4,	%i5,	%i4
	add	%g5,	0x1D45,	%o7
	orn	%l1,	0x1C93,	%o6
	movn	%xcc,	%l0,	%g4
	fnors	%f12,	%f19,	%f26
	fsrc1	%f28,	%f4
	stb	%o3,	[%l7 + 0x12]
	edge8ln	%g7,	%g1,	%g3
	fmovdpos	%xcc,	%f20,	%f30
	fpadd32s	%f24,	%f25,	%f25
	wr	%g0,	0x89,	%asi
	andn	%l5,	0x1D9D,	%g6
	bcc,pt	%icc,	loop_2428
	movneg	%icc,	%l2,	%l6
	xnorcc	%i3,	%o1,	%i2
	wr	%g0,	0x89,	%asi
loop_2428:
	nop
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x3C] %asi,	%f3
	swap	[%l7 + 0x48],	%i6
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
	umul	%g2,	0x1E4C,	%i0
	set	0x08, %g3
	nop	 ! 	stwa	%l3,	[%l7 + %g3] 0x11 ASI use replaced by convert2hboot
	orn	%o5,	0x07D9,	%o0
	nop
	setx loop_2429, %l0, %l1
	jmpl %l1, %i1
	xorcc	%i7,	%o4,	%i5
	movgu	%xcc,	%i4,	%l4
	movge	%icc,	%o7,	%g5
loop_2429:
	ldub	[%l7 + 0x15],	%o6
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tsubcctv	%l1,	0x10A8,	%l0 changed by convert2hboot
	array8	%o3,	%g7,	%g1
	xnor	%g4,	%l5,	%g6
	brgez	%l2,	loop_2430
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	udivcc	%g3,	0x13AB,	%l6
	nop 	! 	tl	%icc,	0x6 changed by convert2hboot
loop_2430:
	nop 	! 	tne	%xcc,	0x6 changed by convert2hboot
	fbl	%fcc1,	loop_2431
	ba,a,pt	%icc,	loop_2432
	edge32ln	%o1,	%i3,	%i2
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
loop_2431:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2432:
	brlz,a	%o2,	loop_2433
	fmovrsgz	%g2,	%f5,	%f7
	movn	%icc,	%i0,	%l3
	array32	%i6,	%o0,	%i1
loop_2433:
	udiv	%o5,	0x1142,	%o4
	fcmple32	%f22,	%f26,	%i5
	fzero	%f2
	subc	%i7,	0x1210,	%i4
	edge16ln	%l4,	%o7,	%o6
	mulscc	%g5,	%l0,	%o3
	fmovdle	%xcc,	%f29,	%f17
	edge32n	%g7,	%l1,	%g4
	ldd	[%l7 + 0x68],	%l4
	movl	%xcc,	%g1,	%l2
	sll	%g3,	%g6,	%o1
	ldub	[%l7 + 0x28],	%i3
	ba,a,pt	%xcc,	loop_2434
	fpadd16	%f22,	%f20,	%f20
	fpsub32s	%f18,	%f31,	%f18
	nop 	! 	tvs	%icc,	0x5 changed by convert2hboot
loop_2434:
	movne	%xcc,	%l6,	%i2
	movpos	%xcc,	%g2,	%i0
	sth	%l3,	[%l7 + 0x18]
	set	0x40, %i4
	nop	 ! 	lduwa	[%l7 + %i4] 0x18,	%i6 ASI use replaced by convert2hboot
	fmovsge	%icc,	%f12,	%f30
	xnorcc	%o2,	%o0,	%o5
	bn,a	%icc,	loop_2435
	fmovrdlz	%i1,	%f28,	%f4
	nop 	! 	taddcctv	%o4,	%i7,	%i5 changed by convert2hboot
	set	0x64, %i6
	nop	 ! 	lduwa	[%l7 + %i6] 0x0c,	%l4 ASI use replaced by convert2hboot
loop_2435:
	nop 	! 	tle	%xcc,	0x5 changed by convert2hboot
	set	0x40, %i2
	nop	 ! 	prefetcha	[%l7 + %i2] 0x18,	 0x1 ASI use replaced by convert2hboot
	xor	%i4,	%g5,	%o6
	wr	%g0,	0x81,	%asi
	fmovdle	%icc,	%f20,	%f17
	nop 	! 	tn	%icc,	0x2 changed by convert2hboot
	subc	%o3,	%l1,	%g7
	nop 	! 	tsubcctv	%g4,	0x1D16,	%l5 changed by convert2hboot
	brnz	%l2,	loop_2436
	movrlz	%g1,	%g3,	%g6
	wr	%g0,	0x80,	%asi
loop_2436:
	array8	%o1,	%l6,	%i3
	fbuge,a	%fcc1,	loop_2437
	nop 	! 	tl	%xcc,	0x7 changed by convert2hboot
	movge	%xcc,	%g2,	%i2
	movn	%xcc,	%l3,	%i0
loop_2437:
	fmovse	%icc,	%f1,	%f12
	set	0x18, %o2
	nop	 ! 	prefetcha	[%l7 + %o2] 0x88,	 0x0 ASI use replaced by convert2hboot
	nop 	! 	tsubcc	%o2,	%o0,	%i1 changed by convert2hboot
	srl	%o5,	0x02,	%o4
	set	0x40, %i1
	nop	 ! 	prefetcha	[%l7 + %i1] 0x0c,	 0x3 ASI use replaced by convert2hboot
	fmovscc	%icc,	%f29,	%f14
	xorcc	%l4,	0x07F1,	%o7
	fmovsneg	%icc,	%f23,	%f8
	fmovdg	%icc,	%f17,	%f28
	fmovdg	%xcc,	%f11,	%f25
	bleu,a,pt	%icc,	loop_2438
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tneg	%icc,	0x3 changed by convert2hboot
	mulx	%i7,	0x189A,	%g5
loop_2438:
	xnorcc	%o6,	%l0,	%o3
	fmovdgu	%xcc,	%f11,	%f10
	wr	%g0,	0x18,	%asi
	bcs,a	loop_2439
	movrgez	%i4,	0x0C6,	%g4
	movcs	%icc,	%g7,	%l2
	nop 	! 	tvs	%xcc,	0x3 changed by convert2hboot
loop_2439:
	edge8l	%g1,	%l5,	%g6
	movne	%icc,	%g3,	%l6
	sethi	0x1CA1,	%o1
	wr	%g0,	0x19,	%asi
	nop 	! 	tcc	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tsubcctv	%i2,	0x0115,	%l3 changed by convert2hboot
	sdivx	%i0,	0x13F1,	%i3
	fmul8sux16	%f12,	%f10,	%f24
	smul	%o2,	%o0,	%i1
	bcs,a,pn	%icc,	loop_2440
	subc	%i6,	%o4,	%o5
	fnor	%f22,	%f16,	%f24
	andcc	%i5,	%o7,	%i7
loop_2440:
	edge32n	%g5,	%o6,	%l0
	fxnor	%f8,	%f2,	%f18
	movrlez	%o3,	0x2C2,	%l4
	movrlz	%l1,	%i4,	%g4
	bgu	%icc,	loop_2441
	mulscc	%g7,	0x1123,	%g1
	fmovsvs	%icc,	%f11,	%f23
	wr	%g0,	0x81,	%asi
loop_2441:
	udivx	%g6,	0x1189,	%g3
	ldd	[%l7 + 0x20],	%i6
	sllx	%o1,	%l5,	%g2
	fbl,a	%fcc1,	loop_2442
	addcc	%i2,	0x0B90,	%l3
	fmovdcc	%xcc,	%f20,	%f16
	sub	%i3,	0x1E52,	%o2
loop_2442:
	nop 	! 	sir	0x0DBA changed by convert2hboot
	sll	%i0,	%o0,	%i6
	wr	%g0,	0x0c,	%asi
	sta	%f8,	[%l7 + 0x0C] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xe2,	%asi
	membar	#Sync
	brlez	%o5,	loop_2443
	sdivcc	%i5,	0x015D,	%o4
	movvs	%icc,	%o7,	%i7
	edge16ln	%g5,	%o6,	%o3
loop_2443:
	movg	%xcc,	%l4,	%l0
	nop 	! 	tg	%xcc,	0x2 changed by convert2hboot
	udivx	%l1,	0x180D,	%g4
	srlx	%g7,	%g1,	%l2
	fand	%f22,	%f30,	%f4
	fandnot1	%f24,	%f4,	%f12
	edge32	%g6,	%g3,	%i4
	umul	%l6,	0x09A6,	%l5
	fmovrdgz	%o1,	%f6,	%f22
	sllx	%i2,	%l3,	%g2
	st	%f17,	[%l7 + 0x5C]
	edge16ln	%i3,	%o2,	%o0
	edge16n	%i6,	%i1,	%o5
	set	0x38, %o5
	nop	 ! 	prefetcha	[%l7 + %o5] 0x81,	 0x2 ASI use replaced by convert2hboot
	membar	0x55
	wr	%g0,	0x19,	%asi
	membar	0x04
	umul	%i0,	0x1686,	%o7
	subccc	%g5,	0x0C60,	%o6
	movrlez	%o3,	0x30D,	%i7
	mova	%xcc,	%l0,	%l4
	bvs,pn	%icc,	loop_2444
	mulx	%l1,	0x0C0C,	%g7
	fbge,a	%fcc0,	loop_2445
loop_2444:
	subc	%g1,	0x18E2,	%l2
	udivcc	%g6,	0x1EB3,	%g4
loop_2445:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%g3,	%l6,	%i4
	move	%icc,	%o1,	%l5
	movre	%l3,	%g2,	%i2
	smulcc	%i3,	0x19C4,	%o2
	bcc	%xcc,	loop_2446
	movg	%xcc,	%i6,	%i1
	wr	%g0,	0x11,	%asi
loop_2446:
	ldd	[%l7 + 0x10],	%i4
	andncc	%o4,	%o5,	%i0
	call	loop_2447
	nop 	! 	tle	%xcc,	0x3 changed by convert2hboot
	fsrc1s	%f24,	%f15
	bge,a,pn	%xcc,	loop_2448
loop_2447:
	movl	%icc,	%o7,	%g5
	orn	%o3,	%o6,	%i7
	nop 	! 	tsubcc	%l4,	%l0,	%g7 changed by convert2hboot
loop_2448:
	nop
	set	0x0C, %o4
	nop	 ! 	ldsha	[%l7 + %o4] 0x80,	%g1 ASI use replaced by convert2hboot
	fmovrdlez	%l2,	%f26,	%f20
	movrne	%l1,	%g4,	%g6
	fbg,a	%fcc1,	loop_2449
	fmovdvc	%icc,	%f30,	%f30
	bvs,pn	%icc,	loop_2450
	fzero	%f28
loop_2449:
	movvc	%xcc,	%l6,	%i4
	fcmpes	%fcc0,	%f17,	%f10
loop_2450:
	flush	%l7 + 0x54
	fpadd16s	%f1,	%f19,	%f11
	set	0x40, %i7
	nop	 ! 	ldda	[%l7 + %i7] 0x0c,	%f16 ASI use replaced by convert2hboot
	fbne	%fcc1,	loop_2451
	popc	0x02D0,	%o1
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
	sdivcc	%l5,	0x0A7F,	%g3
loop_2451:
	nop 	! 	taddcc	%l3,	0x1BC7,	%g2 changed by convert2hboot
	alignaddrl	%i2,	%o2,	%i3
	xnor	%i1,	0x0586,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16al	%f13,	%f13,	%f30
	brnz,a	%i6,	loop_2452
	fmovsg	%icc,	%f10,	%f31
	ba,pt	%icc,	loop_2453
	nop 	! 	tneg	%icc,	0x1 changed by convert2hboot
loop_2452:
	edge16l	%o4,	%i5,	%o5
	edge8n	%i0,	%o7,	%g5
loop_2453:
	movle	%xcc,	%o6,	%o3
	bne	loop_2454
	nop 	! 	te	%xcc,	0x7 changed by convert2hboot
	set	0x40, %i5
	nop	 ! 	stxa	%l4,	[%l7 + %i5] 0x81 ASI use replaced by convert2hboot
loop_2454:
	nop 	! 	tleu	%xcc,	0x4 changed by convert2hboot
	edge8ln	%l0,	%g7,	%i7
	movl	%xcc,	%g1,	%l1
	edge16l	%l2,	%g4,	%g6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	nop	 ! 	casa	[%l6] 0x89,	%i4,	%o1 ASI use replaced by convert2hboot
	lduw	[%l7 + 0x5C],	%l5
	set	0x7F, %o6
	nop	 ! 	ldstuba	[%l7 + %o6] 0x0c,	%g3 ASI use replaced by convert2hboot
	movg	%icc,	%l3,	%g2
	bge,pn	%xcc,	loop_2455
	movvs	%xcc,	%l6,	%i2
	sra	%o2,	%i1,	%o0
	set	0x0C, %i0
	nop	 ! 	ldswa	[%l7 + %i0] 0x04,	%i6 ASI use replaced by convert2hboot
loop_2455:
	fornot2s	%f28,	%f22,	%f22
	edge16ln	%o4,	%i5,	%o5
	sdivx	%i3,	0x1CC9,	%i0
	mova	%xcc,	%g5,	%o7
	sll	%o3,	0x12,	%o6
	ba,a,pt	%icc,	loop_2456
	move	%xcc,	%l0,	%g7
	set	0x18, %o1
	nop	 ! 	ldxa	[%g0 + %o1] 0x4f,	%l4 ASI use replaced by convert2hboot
loop_2456:
	lduw	[%l7 + 0x6C],	%g1
	fnot2s	%f23,	%f5
	for	%f10,	%f6,	%f30
	sethi	0x043A,	%l1
	fmovrdgez	%i7,	%f30,	%f0
	popc	0x188E,	%l2
	fnor	%f14,	%f24,	%f22
	movrlz	%g4,	%g6,	%i4
	stx	%l5,	[%l7 + 0x48]
	brz,a	%o1,	loop_2457
	sethi	0x13EC,	%g3
	edge8l	%l3,	%l6,	%g2
	edge16	%o2,	%i1,	%o0
loop_2457:
	st	%f25,	[%l7 + 0x20]
	movne	%xcc,	%i6,	%o4
	fbo,a	%fcc2,	loop_2458
	fmovsa	%xcc,	%f20,	%f20
	fmovrsgez	%i2,	%f25,	%f30
	fones	%f30
loop_2458:
	fnands	%f20,	%f6,	%f24
	fbg	%fcc0,	loop_2459
	flush	%l7 + 0x74
	fmovscc	%xcc,	%f3,	%f3
	fbg,a	%fcc2,	loop_2460
loop_2459:
	edge32ln	%i5,	%i3,	%i0
	nop 	! 	taddcctv	%o5,	%g5,	%o7 changed by convert2hboot
	fmul8x16al	%f30,	%f4,	%f0
loop_2460:
	for	%f22,	%f14,	%f0
	srlx	%o3,	0x06,	%l0
	sllx	%g7,	%l4,	%o6
	fnegd	%f24,	%f22
	fcmpeq32	%f20,	%f12,	%l1
	movrlz	%i7,	%l2,	%g1
	movge	%xcc,	%g4,	%g6
	fand	%f20,	%f12,	%f28
	edge32ln	%l5,	%o1,	%g3
	ld	[%l7 + 0x34],	%f18
	for	%f2,	%f26,	%f4
	set	0x5B, %l0
	nop	 ! 	ldstuba	[%l7 + %l0] 0x80,	%l3 ASI use replaced by convert2hboot
	bshuffle	%f4,	%f26,	%f24
	membar	0x14
	wr	%g0,	0xe2,	%asi
	membar	#Sync
	alignaddrl	%i4,	%o2,	%i1
	fblg	%fcc1,	loop_2461
	nop
	setx	loop_2462,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop 	! 	tne	%icc,	0x3 changed by convert2hboot
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
loop_2461:
	fmovrsgz	%o0,	%f10,	%f16
loop_2462:
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
	smulcc	%g2,	%i6,	%i2
	mova	%xcc,	%i5,	%i3
	wr	%g0,	0x11,	%asi
	subc	%i0,	%g5,	%o5
	fmovrdgz	%o3,	%f20,	%f18
	sll	%l0,	%g7,	%l4
	wr	%g0,	0x81,	%asi
	movle	%xcc,	%l1,	%i7
	movvs	%xcc,	%o7,	%g1
	movneg	%icc,	%g4,	%l2
	swap	[%l7 + 0x08],	%l5
	lduh	[%l7 + 0x44],	%g6
	addccc	%g3,	0x0803,	%l3
	nop 	! 	tleu	%xcc,	0x5 changed by convert2hboot
	fmovsge	%icc,	%f24,	%f19
	xorcc	%o1,	0x02D9,	%i4
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	swap	[%l7 + 0x0C],	%o2
	movpos	%icc,	%i1,	%o0
	nop 	! 	tge	%icc,	0x2 changed by convert2hboot
	wr	%g0,	0x88,	%asi
	nop 	! 	taddcc	%g2,	0x122C,	%i2 changed by convert2hboot
	ba,a,pt	%icc,	loop_2463
	fsrc1s	%f28,	%f10
	wr	%g0,	0x04,	%asi
loop_2463:
	addccc	%i3,	%i5,	%i0
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	fbge,a	%fcc0,	loop_2464
	brlz,a	%g5,	loop_2465
	fcmpes	%fcc0,	%f27,	%f29
	edge8ln	%o5,	%o3,	%l0
loop_2464:
	swap	[%l7 + 0x18],	%o4
loop_2465:
	fmovda	%xcc,	%f4,	%f18
	srax	%l4,	%o6,	%l1
	fmovdleu	%icc,	%f11,	%f27
	subc	%g7,	0x1B8C,	%i7
	fbe	%fcc3,	loop_2466
	sll	%o7,	%g1,	%g4
	fbne,a	%fcc0,	loop_2467
	fxors	%f21,	%f13,	%f25
loop_2466:
	fnegs	%f7,	%f9
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
loop_2467:
	nop 	! 	tsubcc	%l2,	0x0E1E,	%l5 changed by convert2hboot
	fnot1	%f8,	%f6
	fandnot2	%f16,	%f6,	%f4
	xor	%g3,	%l3,	%g6
	bcc,a,pt	%xcc,	loop_2468
	movvc	%icc,	%o1,	%o2
	fmovdcc	%xcc,	%f18,	%f12
	nop 	! 	tsubcctv	%i1,	0x1C01,	%o0 changed by convert2hboot
loop_2468:
	edge32l	%i4,	%g2,	%i2
	fbn,a	%fcc2,	loop_2469
	bn,a,pn	%icc,	loop_2470
	bcs,pt	%icc,	loop_2471
	subc	%l6,	0x0974,	%i3
loop_2469:
	mulscc	%i5,	%i6,	%i0
loop_2470:
	fcmpes	%fcc2,	%f16,	%f29
loop_2471:
	edge32	%g5,	%o3,	%l0
	movre	%o4,	0x074,	%l4
	srl	%o6,	0x19,	%o5
	nop 	! 	tvs	%xcc,	0x3 changed by convert2hboot
	brgz	%g7,	loop_2472
	add	%l1,	0x0A08,	%o7
	fmovdcs	%xcc,	%f15,	%f11
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
loop_2472:
	mulx	%i7,	0x1E57,	%g1
	nop
	setx loop_2473, %l0, %l1
	jmpl %l1, %l2
	move	%icc,	%l5,	%g4
	fnot2s	%f23,	%f6
	sdivx	%g3,	0x0CBE,	%l3
loop_2473:
	movvs	%xcc,	%o1,	%o2
	wr	%g0,	0x88,	%asi
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	fandnot1s	%f17,	%f0,	%f25
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	sllx	%o0,	0x11,	%g6
	fpackfix	%f4,	%f19
	edge32n	%g2,	%i2,	%l6
	fmovde	%xcc,	%f20,	%f31
	fxors	%f11,	%f11,	%f27
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
	srl	%i3,	0x0B,	%i5
	edge16ln	%i6,	%i4,	%g5
	mulscc	%o3,	0x1287,	%i0
	sll	%l0,	0x17,	%l4
	popc	0x098A,	%o6
	fsrc1	%f22,	%f14
	sdivx	%o4,	0x136C,	%g7
	alignaddr	%o5,	%o7,	%i7
	fpsub32s	%f3,	%f15,	%f10
	fblg,a	%fcc1,	loop_2474
	fand	%f16,	%f6,	%f28
	be,pn	%xcc,	loop_2475
	andn	%l1,	0x1713,	%l2
loop_2474:
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
	stb	%l5,	[%l7 + 0x37]
loop_2475:
	sllx	%g1,	0x1D,	%g3
	fnors	%f27,	%f6,	%f30
	edge32l	%g4,	%o1,	%l3
	umul	%i1,	0x14E4,	%o0
	movl	%xcc,	%g6,	%o2
	sdivcc	%g2,	0x0D6B,	%i2
	ble,pt	%icc,	loop_2476
	addc	%l6,	%i5,	%i3
	wr	%g0,	0x2f,	%asi
	membar	#Sync
loop_2476:
	fmovdn	%icc,	%f7,	%f29
	fnor	%f16,	%f12,	%f24
	xorcc	%i4,	%g5,	%o3
	xor	%l0,	%i0,	%o6
	edge8n	%l4,	%o4,	%g7
	wr	%g0,	0x04,	%asi
	movrgez	%i7,	%o7,	%l2
	fcmpgt32	%f4,	%f16,	%l5
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	nop 	! 	tcs	%icc,	0x7 changed by convert2hboot
	nop 	! 	ta	%xcc,	0x0 changed by convert2hboot
	andcc	%g1,	0x071A,	%g3
	xor	%g4,	0x10E0,	%o1
	movrgz	%l3,	0x3B6,	%l1
	bneg	loop_2477
	bvc,a,pn	%icc,	loop_2478
	movrne	%o0,	0x299,	%g6
	stw	%o2,	[%l7 + 0x7C]
loop_2477:
	nop 	! 	tg	%icc,	0x3 changed by convert2hboot
loop_2478:
	sra	%i1,	%g2,	%l6
	bleu,a,pt	%icc,	loop_2479
	movcs	%icc,	%i2,	%i3
	edge16ln	%i5,	%i4,	%i6
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
loop_2479:
	nop
	set	0x110, %i3
	nop	 ! 	stxa	%g5,	[%g0 + %i3] 0x21 ASI use replaced by convert2hboot
	nop 	! 	tsubcctv	%l0,	0x1CC4,	%o3 changed by convert2hboot
	udivcc	%i0,	0x0DD7,	%o6
	fcmple16	%f22,	%f24,	%l4
	movvc	%icc,	%g7,	%o5
	sra	%o4,	0x16,	%o7
	fbg	%fcc1,	loop_2480
	orn	%l2,	%l5,	%g1
	umul	%g3,	0x18C4,	%i7
	fmovdpos	%icc,	%f22,	%f27
loop_2480:
	fmovsleu	%xcc,	%f16,	%f4
	fbu,a	%fcc0,	loop_2481
	fsrc1	%f30,	%f22
	set	0x178, %l6
	nop 	! 	nop	 ! 	ldxa	[%g0 + %l6] 0x40,	%g4 ASI use replaced by convert2hboot ripped by fixASI40.pl
loop_2481:
	movpos	%icc,	%l3,	%l1
	movrgz	%o0,	%o1,	%g6
	nop
	setx loop_2482, %l0, %l1
	jmpl %l1, %o2
	edge16	%g2,	%i1,	%l6
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
	sdivx	%i3,	0x01B5,	%i5
loop_2482:
	bg,a	%xcc,	loop_2483
	fnot2	%f24,	%f12
	edge8n	%i4,	%i6,	%g5
	umul	%i2,	%o3,	%l0
loop_2483:
	bl,a	%xcc,	loop_2484
	andncc	%o6,	%i0,	%g7
	fbne,a	%fcc3,	loop_2485
	fmovsvc	%icc,	%f18,	%f9
loop_2484:
	nop 	! 	tn	%xcc,	0x6 changed by convert2hboot
	set	0x20, %o3
	nop	 ! 	stxa	%l4,	[%l7 + %o3] 0x81 ASI use replaced by convert2hboot
loop_2485:
	andcc	%o4,	%o7,	%l2
	bneg	loop_2486
	edge32	%l5,	%g1,	%g3
	movn	%icc,	%o5,	%g4
	movle	%xcc,	%l3,	%l1
loop_2486:
	fsrc1	%f30,	%f20
	fmovdvs	%xcc,	%f19,	%f31
	edge32	%i7,	%o1,	%g6
	ldub	[%l7 + 0x27],	%o0
	movrlz	%g2,	%i1,	%o2
	nop
	setx	loop_2487,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	array16	%l6,	%i5,	%i3
	sllx	%i4,	%g5,	%i6
	fmovsg	%xcc,	%f16,	%f22
loop_2487:
	smul	%i2,	0x1C1C,	%o3
	edge16	%l0,	%o6,	%i0
	nop 	! 	tleu	%xcc,	0x0 changed by convert2hboot
	fbe,a	%fcc2,	loop_2488
	be	loop_2489
	addccc	%g7,	%o4,	%o7
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
loop_2488:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	nop	 ! 	casxa	[%l6] 0x81,	%l2,	%l4 ASI use replaced by convert2hboot
loop_2489:
	andcc	%g1,	0x1B05,	%g3
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	bne,a,pn	%icc,	loop_2490
	sdiv	%o5,	0x032E,	%g4
	fmovdneg	%xcc,	%f25,	%f2
	movcc	%icc,	%l3,	%l5
loop_2490:
	sdivx	%i7,	0x0C5B,	%o1
	edge8ln	%l1,	%o0,	%g2
	set	0x38, %g7
	nop	 ! 	prefetcha	[%l7 + %g7] 0x89,	 0x2 ASI use replaced by convert2hboot
	subccc	%o2,	0x1680,	%l6
	and	%i5,	%i3,	%i4
	fmovdpos	%xcc,	%f28,	%f19
	bleu,a,pt	%icc,	loop_2491
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%g5,	%i6
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
loop_2491:
	ldd	[%l7 + 0x78],	%f6
	andn	%i1,	%i2,	%o3
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	movg	%xcc,	%o6,	%l0
	fnors	%f19,	%f27,	%f2
	sdiv	%g7,	0x1BA5,	%i0
	udivcc	%o7,	0x18A6,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x00CE,	%l2
	movrgz	%l4,	%g1,	%o5
	edge8ln	%g4,	%g3,	%l3
	ba,a	loop_2492
	fmovdg	%xcc,	%f28,	%f18
	fmovrdgz	%l5,	%f0,	%f18
	sdivcc	%o1,	0x09B4,	%i7
loop_2492:
	nop 	! 	tl	%xcc,	0x2 changed by convert2hboot
	array16	%l1,	%g2,	%g6
	edge16l	%o2,	%l6,	%i5
	fmovde	%xcc,	%f25,	%f16
	fnot2s	%f30,	%f12
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	smulcc	%o0,	%i3,	%g5
	fors	%f6,	%f28,	%f26
	xnorcc	%i4,	%i1,	%i6
	nop 	! 	tleu	%xcc,	0x0 changed by convert2hboot
	smul	%i2,	0x0FC9,	%o3
	stb	%l0,	[%l7 + 0x0F]
	addccc	%g7,	%i0,	%o6
	edge16ln	%o4,	%o7,	%l4
	subc	%l2,	%g1,	%o5
	nop 	! 	tsubcctv	%g3,	%g4,	%l3 changed by convert2hboot
	srl	%o1,	0x0D,	%l5
	fmovrslz	%i7,	%f1,	%f4
	set	0x78, %l1
	nop	 ! 	ldswa	[%l7 + %l1] 0x18,	%g2 ASI use replaced by convert2hboot
	orcc	%g6,	0x0CFF,	%o2
	andcc	%l6,	0x088C,	%i5
	set	0x1C, %o7
	nop	 ! 	stwa	%l1,	[%l7 + %o7] 0x2a ASI use replaced by convert2hboot
	membar	#Sync
	set	0x38, %l3
	nop	 ! 	stha	%i3,	[%l7 + %l3] 0x18 ASI use replaced by convert2hboot
	set	0x30, %l2
	nop	 ! 	stwa	%g5,	[%l7 + %l2] 0x23 ASI use replaced by convert2hboot
	membar	#Sync
	movl	%icc,	%i4,	%i1
	fmovdcs	%icc,	%f28,	%f25
	movgu	%xcc,	%o0,	%i2
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	brlez,a	%o3,	loop_2493
	xorcc	%l0,	0x174E,	%g7
	bpos,a	loop_2494
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
loop_2493:
	nop
	set	0x20, %g4
	std	%i6,	[%l7 + %g4]
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
loop_2494:
	fxors	%f6,	%f8,	%f30
	sra	%i0,	%o4,	%o6
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	fmovrdlez	%l4,	%f12,	%f0
	popc	0x07F3,	%l2
	andn	%o7,	0x1ED5,	%g1
	srlx	%o5,	%g3,	%l3
	sdivx	%o1,	0x1C45,	%g4
	fmovdn	%xcc,	%f14,	%f21
	umulcc	%i7,	%l5,	%g2
	smulcc	%g6,	%l6,	%i5
	edge8l	%l1,	%i3,	%g5
	fbu	%fcc1,	loop_2495
	fnot1	%f30,	%f22
	srlx	%o2,	%i1,	%i4
	smul	%o0,	%i2,	%l0
loop_2495:
	nop
	wr	%g0,	0x88,	%asi
	movneg	%icc,	%o3,	%i6
	fmovrsgez	%o4,	%f20,	%f17
	movrlz	%o6,	%l4,	%i0
	array32	%o7,	%l2,	%o5
	move	%icc,	%g3,	%l3
	movrne	%o1,	0x3C9,	%g4
	sdiv	%i7,	0x1F9C,	%l5
	nop
	setx	loop_2496,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fpack16	%f26,	%f9
	fors	%f21,	%f7,	%f12
	orncc	%g1,	0x02A9,	%g2
loop_2496:
	brlz	%g6,	loop_2497
	add	%i5,	%l6,	%i3
	swap	[%l7 + 0x74],	%l1
	wr	%g0,	0x89,	%asi
loop_2497:
	nop 	! 	taddcctv	%o2,	0x114E,	%i1 changed by convert2hboot
	and	%i4,	0x0301,	%i2
	addc	%l0,	0x1C1C,	%o0
	ble	%icc,	loop_2498
	fmovsg	%icc,	%f23,	%f0
	movrlz	%g7,	0x293,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2498:
	nop
	wr	%g0,	0x27,	%asi
	movn	%icc,	%i6,	%o6
	fpack32	%f16,	%f4,	%f20
	srax	%i0,	0x01,	%o7
	movle	%xcc,	%l2,	%o5
	orcc	%g3,	0x117B,	%l3
	membar	0x7A
	fbug	%fcc3,	loop_2499
	fornot2s	%f22,	%f23,	%f23
	fnor	%f24,	%f0,	%f14
	brz	%o1,	loop_2500
loop_2499:
	nop 	! 	tpos	%icc,	0x6 changed by convert2hboot
	movrne	%l4,	%g4,	%l5
	fnands	%f20,	%f25,	%f28
loop_2500:
	movrlz	%i7,	0x175,	%g1
	fcmpne32	%f18,	%f2,	%g6
	subcc	%g2,	%l6,	%i5
	movl	%icc,	%i3,	%l1
	bn	%xcc,	loop_2501
	fmovrsgz	%o2,	%f31,	%f24
	edge16ln	%i1,	%g5,	%i2
	edge16ln	%i4,	%l0,	%o0
loop_2501:
	edge16n	%o3,	%g7,	%o4
	ld	[%l7 + 0x54],	%f12
	sllx	%i6,	%o6,	%i0
	fpadd16s	%f17,	%f0,	%f7
	movne	%xcc,	%o7,	%l2
	movpos	%xcc,	%g3,	%l3
	move	%xcc,	%o5,	%o1
	sdivx	%l4,	0x1969,	%g4
	fmovsne	%xcc,	%f3,	%f23
	edge32n	%i7,	%g1,	%l5
	bn,a	%icc,	loop_2502
	movrne	%g2,	%g6,	%i5
	edge16	%l6,	%i3,	%o2
	subcc	%l1,	0x1193,	%i1
loop_2502:
	fba	%fcc1,	loop_2503
	subcc	%g5,	%i2,	%i4
	set	0x14, %g1
	nop	 ! 	swapa	[%l7 + %g1] 0x80,	%l0 ASI use replaced by convert2hboot
loop_2503:
	fornot1	%f12,	%f22,	%f30
	movrlez	%o0,	%o3,	%g7
	movvc	%xcc,	%o4,	%o6
	fpmerge	%f3,	%f21,	%f6
	fpadd32	%f10,	%f24,	%f6
	nop
	set	0x70, %l5
	stw	%i0,	[%l7 + %l5]
	brlez,a	%o7,	loop_2504
	nop 	! 	tsubcc	%l2,	0x0ECD,	%g3 changed by convert2hboot
	nop 	! 	taddcc	%i6,	0x09A6,	%l3 changed by convert2hboot
	fcmpne16	%f26,	%f26,	%o5
loop_2504:
	udiv	%l4,	0x179D,	%g4
	addccc	%o1,	%i7,	%g1
	movl	%icc,	%g2,	%l5
	udiv	%g6,	0x0BE6,	%l6
	mulx	%i3,	%i5,	%l1
	set	0x2F, %l4
	nop	 ! 	stba	%o2,	[%l7 + %l4] 0x2a ASI use replaced by convert2hboot
	membar	#Sync
	fbl,a	%fcc0,	loop_2505
	bcs,a,pn	%icc,	loop_2506
	fnegd	%f22,	%f6
	movpos	%xcc,	%g5,	%i1
loop_2505:
	ld	[%l7 + 0x78],	%f18
loop_2506:
	fnors	%f13,	%f1,	%f8
	mulscc	%i2,	%l0,	%o0
	fand	%f2,	%f24,	%f10
	fbule,a	%fcc3,	loop_2507
	fmovsa	%xcc,	%f1,	%f9
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x60] %asi,	%f27
loop_2507:
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	edge16	%i4,	%o3,	%o4
	fmovsvs	%xcc,	%f20,	%f27
	fmovdgu	%icc,	%f1,	%f1
	edge16l	%o6,	%i0,	%o7
	andncc	%g7,	%g3,	%l2
	edge32ln	%i6,	%o5,	%l3
	wr	%g0,	0x19,	%asi
	wr	%g0,	0x11,	%asi
	fnot2	%f6,	%f24
	wr	%g0,	0x10,	%asi
	movvs	%xcc,	%g1,	%l4
	fabsd	%f14,	%f12
	ldx	[%l7 + 0x78],	%g2
	edge8l	%l5,	%g6,	%i3
	fmuld8ulx16	%f3,	%f12,	%f20
	orcc	%i5,	0x0380,	%l6
	nop 	! 	taddcc	%o2,	%l1,	%i1 changed by convert2hboot
	sdivx	%g5,	0x03ED,	%l0
	edge32l	%o0,	%i4,	%i2
	fmovdcc	%icc,	%f0,	%f12
	array16	%o3,	%o4,	%i0
	fmovrdgz	%o6,	%f12,	%f6
	bn	loop_2508
	fmul8ulx16	%f10,	%f8,	%f24
	stx	%o7,	[%l7 + 0x68]
	bg,a	loop_2509
loop_2508:
	fmovdvs	%xcc,	%f31,	%f27
	sub	%g7,	0x17C8,	%g3
	swap	[%l7 + 0x64],	%l2
loop_2509:
	fbul	%fcc2,	loop_2510
	fnand	%f24,	%f18,	%f26
	or	%i6,	0x0CA8,	%l3
	fmovs	%f23,	%f27
loop_2510:
	fone	%f10
	edge8	%g4,	%o5,	%o1
	fpsub32s	%f25,	%f1,	%f14
	nop
	setx loop_2511, %l0, %l1
	jmpl %l1, %i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	flush	%l7 + 0x58
loop_2511:
	fornot2	%f16,	%f2,	%f6
	fnegs	%f24,	%f6
	movge	%xcc,	%l4,	%g1
	mulscc	%l5,	0x1B9F,	%g6
	fnor	%f16,	%f22,	%f8
	fnot2s	%f12,	%f17
	sth	%g2,	[%l7 + 0x22]
	nop
	set	0x5B, %g6
	stb	%i5,	[%l7 + %g6]
	fmovrslez	%l6,	%f6,	%f5
	mova	%icc,	%o2,	%i3
	fbne,a	%fcc2,	loop_2512
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x2a,	%asi
	membar	#Sync
loop_2512:
	fmovsle	%xcc,	%f29,	%f23
	xnor	%g5,	%l0,	%o0
	nop 	! 	taddcc	%i4,	0x11D1,	%i2 changed by convert2hboot
	fbge,a	%fcc3,	loop_2513
	edge32n	%o3,	%l1,	%o4
	edge8n	%i0,	%o7,	%g7
	fnot1s	%f6,	%f1
loop_2513:
	xnorcc	%g3,	0x0CB8,	%l2
	movcs	%icc,	%o6,	%i6
	set	0x5C, %o0
	nop	 ! 	lduwa	[%l7 + %o0] 0x18,	%l3 ASI use replaced by convert2hboot
	fnot2s	%f31,	%f26
	movge	%xcc,	%o5,	%g4
	edge8n	%o1,	%l4,	%g1
	add	%l5,	%i7,	%g2
	fbn	%fcc3,	loop_2514
	membar	0x45
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
	sdivcc	%g6,	0x1050,	%i5
loop_2514:
	brnz	%o2,	loop_2515
	fmovscs	%xcc,	%f20,	%f9
	lduw	[%l7 + 0x54],	%l6
	sdivx	%i1,	0x181F,	%i3
loop_2515:
	movge	%xcc,	%g5,	%o0
	orn	%l0,	%i4,	%o3
	fmovde	%xcc,	%f20,	%f15
	fnegs	%f23,	%f2
	movcc	%icc,	%i2,	%l1
	movn	%xcc,	%o4,	%i0
	st	%f19,	[%l7 + 0x68]
	srlx	%o7,	%g3,	%l2
	sethi	0x0BE4,	%g7
	alignaddr	%o6,	%l3,	%o5
	movge	%xcc,	%g4,	%i6
	for	%f4,	%f28,	%f26
	bvc,pt	%icc,	loop_2516
	movge	%icc,	%l4,	%o1
	brnz,a	%g1,	loop_2517
	edge16n	%i7,	%g2,	%g6
loop_2516:
	movre	%l5,	0x3A6,	%o2
	wr	%g0,	0x04,	%asi
loop_2517:
	nop
	wr	%g0,	0x04,	%asi
	andcc	%l6,	0x1F31,	%i3
	nop
	setx loop_2518, %l0, %l1
	jmpl %l1, %o0
	fbl,a	%fcc0,	loop_2519
	addcc	%l0,	0x18B1,	%i4
	ld	[%l7 + 0x5C],	%f23
loop_2518:
	nop 	! 	taddcc	%g5,	0x15A0,	%i2 changed by convert2hboot
loop_2519:
	nop 	! 	tvc	%icc,	0x5 changed by convert2hboot
	array32	%o3,	%o4,	%l1
	brgz	%o7,	loop_2520
	udivx	%g3,	0x06FB,	%l2
	edge16	%i0,	%o6,	%l3
	movrne	%g7,	0x1B4,	%g4
loop_2520:
	brlz,a	%o5,	loop_2521
	fmovsvs	%icc,	%f13,	%f25
	movleu	%icc,	%l4,	%i6
	wr	%g0,	0x89,	%asi
loop_2521:
	nop
	set	0x48, %g5
	nop	 ! 	stxa	%i7,	[%l7 + %g5] 0xe3 ASI use replaced by convert2hboot
	membar	#Sync
	array32	%g2,	%g6,	%l5
	ldsh	[%l7 + 0x4E],	%o2
	fbuge,a	%fcc3,	loop_2522
	edge16n	%o1,	%i1,	%i5
	popc	0x1AE8,	%l6
	edge32ln	%o0,	%l0,	%i4
loop_2522:
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%g4
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x24] %asi,	%f13
	subccc	%i2,	0x1D7A,	%o3
	sllx	%o4,	0x1A,	%l1
	sdivx	%i3,	0x1B28,	%o7
	nop 	! 	tgu	%icc,	0x1 changed by convert2hboot
	fbne,a	%fcc2,	loop_2523
	fbu,a	%fcc0,	loop_2524
	fmovrse	%l2,	%f8,	%f10
	nop 	! 	tle	%xcc,	0x1 changed by convert2hboot
loop_2523:
	movgu	%icc,	%i0,	%g3
loop_2524:
	fcmpne16	%f2,	%f28,	%l3
	fmovse	%icc,	%f31,	%f17
	fnegs	%f1,	%f5
	edge16l	%g7,	%g4,	%o5
	edge32ln	%l4,	%i6,	%g1
	addcc	%i7,	0x0793,	%o6
	stx	%g6,	[%l7 + 0x40]
	sdivx	%l5,	0x03FA,	%g2
	fmovdvs	%xcc,	%f1,	%f13
	wr	%g0,	0x80,	%asi
	be,a,pt	%icc,	loop_2525
	nop 	! 	tne	%icc,	0x1 changed by convert2hboot
	fmovrsgez	%i1,	%f13,	%f17
	movge	%icc,	%i5,	%l6
loop_2525:
	fcmpd	%fcc0,	%f28,	%f24
	xorcc	%o2,	%o0,	%i4
	fpadd32s	%f11,	%f26,	%f7
	and	%g5,	%l0,	%o3
	bgu	loop_2526
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	srax	%i2,	0x0F,	%l1
	movle	%xcc,	%i3,	%o7
loop_2526:
	subccc	%l2,	%i0,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xeb,	%asi
	membar	#Sync
	umulcc	%o4,	%g7,	%g4
	umul	%o5,	0x0112,	%l4
	edge32l	%g1,	%i7,	%i6
	prefetch	[%l7 + 0x10],	 0x1
	movrgez	%g6,	%o6,	%l5
	edge16l	%o1,	%g2,	%i1
	wr	%g0,	0x04,	%asi
	edge16l	%l6,	%o0,	%o2
	fabss	%f4,	%f25
	edge8n	%i4,	%g5,	%o3
	nop 	! 	tsubcc	%l0,	0x0F0D,	%l1 changed by convert2hboot
	udivcc	%i3,	0x06EE,	%o7
	nop 	! 	tcc	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	fcmpgt16	%f28,	%f24,	%l2
	fcmpgt32	%f14,	%f10,	%i2
	fbn,a	%fcc1,	loop_2527
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tle	%icc,	0x3 changed by convert2hboot
	subcc	%i0,	%l3,	%g3
loop_2527:
	prefetch	[%l7 + 0x1C],	 0x2
	or	%o4,	%g4,	%g7
	addcc	%o5,	0x1149,	%l4
	srl	%i7,	%g1,	%i6
	fpsub16	%f8,	%f14,	%f18
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	nop	 ! 	casxa	[%l6] 0x89,	%g6,	%o6 ASI use replaced by convert2hboot
	fmovscc	%icc,	%f17,	%f17
	fmovsa	%icc,	%f19,	%f30
	sllx	%o1,	%l5,	%i1
	fcmpne16	%f28,	%f6,	%i5
	set	0x30, %i4
	nop	 ! 	ldsha	[%l7 + %i4] 0x88,	%g2 ASI use replaced by convert2hboot
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	array32	%o0,	%l6,	%i4
	bl,pt	%xcc,	loop_2528
	fmovdvs	%icc,	%f21,	%f5
	fpsub16	%f16,	%f6,	%f30
	xorcc	%o2,	%o3,	%g5
loop_2528:
	movge	%xcc,	%l0,	%l1
	fbe	%fcc1,	loop_2529
	nop 	! 	tl	%xcc,	0x0 changed by convert2hboot
	movcc	%xcc,	%i3,	%l2
	srl	%o7,	0x0A,	%i0
loop_2529:
	flush	%l7 + 0x40
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	nop
	setx loop_2530, %l0, %l1
	jmpl %l1, %i2
	movrne	%l3,	0x090,	%o4
	movneg	%xcc,	%g4,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2530:
	add	%o5,	%l4,	%g3
	andcc	%i7,	%g1,	%g6
	or	%i6,	%o6,	%l5
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
	prefetch	[%l7 + 0x48],	 0x3
	edge16	%o1,	%i1,	%i5
	call	loop_2531
	subccc	%g2,	0x0810,	%o0
	nop
	set	0x38, %i6
	prefetch	[%l7 + %i6],	 0x1
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
loop_2531:
	srlx	%i4,	%o2,	%l6
	nop 	! 	ta	%xcc,	0x5 changed by convert2hboot
	fpadd16s	%f16,	%f19,	%f11
	movle	%icc,	%g5,	%o3
	mova	%icc,	%l0,	%l1
	bg,a,pt	%icc,	loop_2532
	movrgez	%l2,	0x082,	%i3
	bne,pn	%icc,	loop_2533
	nop
	setx	loop_2534,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_2532:
	fsrc1	%f22,	%f10
	bgu,pn	%icc,	loop_2535
loop_2533:
	fsrc2	%f4,	%f22
loop_2534:
	fmovsg	%xcc,	%f25,	%f22
	movle	%icc,	%i0,	%i2
loop_2535:
	stx	%o7,	[%l7 + 0x58]
	set	0x34, %g2
	nop	 ! 	ldsba	[%l7 + %g2] 0x89,	%o4 ASI use replaced by convert2hboot
	set	0x48, %o2
	nop	 ! 	stda	%l2,	[%l7 + %o2] 0x89 ASI use replaced by convert2hboot
	nop 	! 	tsubcc	%g4,	%g7,	%o5 changed by convert2hboot
	umulcc	%g3,	0x126B,	%i7
	movn	%xcc,	%l4,	%g1
	xnorcc	%i6,	%g6,	%l5
	nop 	! 	tcs	%icc,	0x7 changed by convert2hboot
	nop 	! 	tpos	%icc,	0x5 changed by convert2hboot
	xor	%o1,	0x098D,	%i1
	nop 	! 	tge	%xcc,	0x5 changed by convert2hboot
	fsrc2s	%f18,	%f20
	array32	%i5,	%g2,	%o0
	nop 	! 	tg	%xcc,	0x2 changed by convert2hboot
	orn	%i4,	%o2,	%o6
	smul	%l6,	%o3,	%l0
	ldsw	[%l7 + 0x70],	%l1
	fabss	%f15,	%f15
	fandnot1	%f26,	%f20,	%f6
	movg	%xcc,	%g5,	%l2
	ble	loop_2536
	andncc	%i3,	%i0,	%o7
	set	0x68, %i1
	nop	 ! 	lduwa	[%l7 + %i1] 0x0c,	%o4 ASI use replaced by convert2hboot
loop_2536:
	movrgz	%i2,	%g4,	%g7
	fbg	%fcc2,	loop_2537
	faligndata	%f16,	%f20,	%f4
	xnorcc	%l3,	0x1D29,	%o5
	prefetch	[%l7 + 0x28],	 0x0
loop_2537:
	movle	%icc,	%i7,	%l4
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
	sub	%g1,	0x0A26,	%i6
	edge8	%g6,	%g3,	%l5
	edge8	%o1,	%i1,	%g2
	sdivcc	%i5,	0x063F,	%i4
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	fones	%f12
	fmovsl	%icc,	%f14,	%f10
	fmul8ulx16	%f12,	%f24,	%f2
	edge8n	%o2,	%o0,	%l6
	movleu	%icc,	%o3,	%o6
	orncc	%l0,	0x0564,	%l1
	xnorcc	%l2,	0x055B,	%g5
	mova	%icc,	%i3,	%i0
	bn,a,pn	%xcc,	loop_2538
	call	loop_2539
	xnorcc	%o7,	%o4,	%i2
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
loop_2538:
	sdiv	%g4,	0x12CC,	%l3
loop_2539:
	orcc	%o5,	%i7,	%l4
	bpos,a	%xcc,	loop_2540
	edge32n	%g7,	%g1,	%i6
	wr	%g0,	0x19,	%asi
loop_2540:
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	wr	%g0,	0x88,	%asi
	addccc	%o1,	%g6,	%i1
	fmul8ulx16	%f18,	%f2,	%f16
	edge32ln	%g2,	%i5,	%o2
	fbuge,a	%fcc0,	loop_2541
	sub	%o0,	%i4,	%o3
	edge32	%o6,	%l0,	%l1
	subc	%l2,	0x04DF,	%g5
loop_2541:
	orn	%i3,	0x1D42,	%i0
	xnor	%o7,	%l6,	%o4
	orn	%g4,	%l3,	%o5
	movne	%xcc,	%i7,	%i2
	smulcc	%g7,	0x1D39,	%g1
	xnor	%l4,	0x021C,	%i6
	mulx	%l5,	0x0B77,	%g3
	bleu,a	loop_2542
	subcc	%o1,	%g6,	%i1
	st	%f16,	[%l7 + 0x60]
	membar	0x3B
loop_2542:
	bn,pn	%icc,	loop_2543
	nop
	setx	loop_2544,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	brgz,a	%i5,	loop_2545
	nop
	setx loop_2546, %l0, %l1
	jmpl %l1, %g2
loop_2543:
	nop
	setx	loop_2547,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_2544:
	fandnot2s	%f23,	%f2,	%f21
loop_2545:
	subccc	%o0,	%i4,	%o2
loop_2546:
	add	%o3,	0x1301,	%l0
loop_2547:
	xnorcc	%o6,	%l1,	%l2
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	brlz,a	%i3,	loop_2548
	xnor	%g5,	0x0194,	%i0
	bshuffle	%f4,	%f24,	%f20
	nop 	! 	ta	%icc,	0x5 changed by convert2hboot
loop_2548:
	nop 	! 	sir	0x1CE5 changed by convert2hboot
	bge	loop_2549
	edge16l	%l6,	%o4,	%o7
	movvc	%icc,	%l3,	%g4
	array32	%i7,	%o5,	%g7
loop_2549:
	edge16n	%i2,	%l4,	%g1
	bne,a	%icc,	loop_2550
	xnor	%i6,	%l5,	%o1
	fornot2	%f0,	%f16,	%f16
	prefetch	[%l7 + 0x7C],	 0x2
loop_2550:
	movge	%icc,	%g6,	%i1
	xnor	%i5,	%g2,	%g3
	edge16n	%i4,	%o0,	%o2
	udiv	%o3,	0x1CE3,	%o6
	edge16l	%l0,	%l2,	%i3
	mulx	%g5,	0x00ED,	%i0
	xnor	%l1,	0x0683,	%l6
	edge8n	%o7,	%o4,	%l3
	addc	%g4,	%i7,	%g7
	fpsub32s	%f19,	%f24,	%f18
	add	%o5,	0x089E,	%i2
	wr	%g0,	0x80,	%asi
	udivx	%g1,	0x0C07,	%l4
	set	0x08, %o5
	nop	 ! 	prefetcha	[%l7 + %o5] 0x81,	 0x1 ASI use replaced by convert2hboot
	nop 	! 	taddcctv	%o1,	%i6,	%i1 changed by convert2hboot
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	array32	%g2,	%i4,	%g3
	fbn,a	%fcc1,	loop_2551
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
	fxnors	%f25,	%f10,	%f22
	edge8l	%o2,	%o3,	%o6
loop_2551:
	fexpand	%f5,	%f14
	bneg,a,pt	%xcc,	loop_2552
	udiv	%l0,	0x160B,	%o0
	fands	%f8,	%f15,	%f15
	fnors	%f5,	%f23,	%f12
loop_2552:
	fmovdle	%icc,	%f25,	%f19
	sdivcc	%l2,	0x0B2D,	%i3
	alignaddr	%i0,	%l1,	%g5
	fcmpeq32	%f20,	%f30,	%o7
	udivcc	%l6,	0x0FFD,	%l3
	stx	%o4,	[%l7 + 0x40]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g4,	0x1629,	%i7
	movgu	%icc,	%g7,	%o5
	fmovscc	%xcc,	%f9,	%f19
	udivx	%g1,	0x01CF,	%l4
	swap	[%l7 + 0x18],	%i2
	fcmpgt32	%f12,	%f0,	%l5
	wr	%g0,	0x89,	%asi
	fmovs	%f12,	%f15
	movrne	%i1,	0x1D2,	%i5
	movcs	%icc,	%g6,	%g2
	set	0x14, %o4
	nop	 ! 	stba	%i6,	[%l7 + %o4] 0x19 ASI use replaced by convert2hboot
	array16	%i4,	%g3,	%o3
	wr	%g0,	0x89,	%asi
	fmul8sux16	%f20,	%f4,	%f10
	fpack16	%f12,	%f13
	subccc	%l0,	%o0,	%o6
	movne	%icc,	%i3,	%l2
	nop 	! 	tpos	%icc,	0x0 changed by convert2hboot
	xorcc	%l1,	0x0FEF,	%g5
	sdivcc	%o7,	0x0DC9,	%l6
	fpmerge	%f8,	%f11,	%f14
	movpos	%xcc,	%i0,	%o4
	nop 	! 	taddcc	%g4,	0x1824,	%i7 changed by convert2hboot
	movrlez	%g7,	0x28D,	%o5
	movvc	%xcc,	%l3,	%l4
	fcmpne32	%f26,	%f30,	%g1
	movge	%xcc,	%l5,	%i2
	bvs,pn	%icc,	loop_2553
	bneg,a	%icc,	loop_2554
	andn	%i1,	%i5,	%o1
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
loop_2553:
	ble	loop_2555
loop_2554:
	edge32	%g6,	%g2,	%i4
	nop
	setx	loop_2556,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	edge32n	%i6,	%g3,	%o2
loop_2555:
	edge32ln	%o3,	%l0,	%o6
	xnorcc	%i3,	%l2,	%l1
loop_2556:
	sth	%o0,	[%l7 + 0x3C]
	bl,pt	%xcc,	loop_2557
	edge8n	%g5,	%l6,	%o7
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	movgu	%icc,	%o4,	%g4
loop_2557:
	edge32ln	%i7,	%i0,	%o5
	fmovrsne	%l3,	%f28,	%f31
	sllx	%g7,	0x0B,	%g1
	fnot2s	%f17,	%f30
	sllx	%l4,	%i2,	%i1
	umulcc	%i5,	0x1813,	%o1
	fmovsne	%xcc,	%f10,	%f28
	faligndata	%f20,	%f2,	%f16
	fmovse	%xcc,	%f0,	%f29
	bshuffle	%f22,	%f26,	%f30
	edge8n	%g6,	%l5,	%i4
	nop 	! 	taddcc	%i6,	%g3,	%g2 changed by convert2hboot
	andn	%o3,	%l0,	%o6
	sethi	0x15F6,	%i3
	mulx	%o2,	%l2,	%l1
	sll	%o0,	0x03,	%g5
	subc	%l6,	%o4,	%o7
	sra	%i7,	0x12,	%i0
	movleu	%xcc,	%o5,	%g4
	array32	%g7,	%l3,	%g1
	fmovse	%icc,	%f12,	%f26
	umul	%i2,	0x02C0,	%i1
	bn,pn	%icc,	loop_2558
	sllx	%l4,	0x10,	%i5
	fxnor	%f12,	%f12,	%f30
	edge8ln	%o1,	%g6,	%i4
loop_2558:
	edge16	%i6,	%g3,	%g2
	set	0x4B, %i7
	nop	 ! 	lduba	[%l7 + %i7] 0x81,	%o3 ASI use replaced by convert2hboot
	fnot1	%f14,	%f22
	nop
	set	0x1C, %i5
	ldsb	[%l7 + %i5],	%l0
	fnot2	%f8,	%f14
	orncc	%o6,	%l5,	%o2
	std	%i2,	[%l7 + 0x28]
	flush	%l7 + 0x50
	nop 	! 	tle	%xcc,	0x0 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f2,	%f4,	%f22
	movle	%icc,	%l2,	%l1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	nop	 ! 	casa	[%l6] 0x80,	%o0,	%l6 ASI use replaced by convert2hboot
	udivx	%o4,	0x0069,	%g5
	edge8l	%o7,	%i7,	%o5
	nop 	! 	tsubcctv	%g4,	%g7,	%l3 changed by convert2hboot
	andncc	%i0,	%i2,	%i1
	fcmpne32	%f24,	%f24,	%l4
	nop
	setx	loop_2559,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f12,	%f4,	%f2
	fbue,a	%fcc2,	loop_2560
loop_2559:
	xor	%g1,	%o1,	%i5
	fornot2s	%f21,	%f29,	%f5
	fpsub32	%f22,	%f22,	%f6
loop_2560:
	fmovdge	%xcc,	%f21,	%f15
	set	0x73, %o6
	nop	 ! 	ldstuba	[%l7 + %o6] 0x0c,	%i4 ASI use replaced by convert2hboot
	movneg	%icc,	%g6,	%i6
	xnor	%g2,	0x188C,	%o3
	umul	%g3,	%o6,	%l5
	udivx	%l0,	0x0400,	%o2
	fcmpeq32	%f26,	%f26,	%l2
	srl	%l1,	%o0,	%l6
	fmovdle	%icc,	%f30,	%f14
	nop 	! 	tle	%xcc,	0x6 changed by convert2hboot
	wr	%g0,	0x19,	%asi
	fcmple32	%f24,	%f24,	%i3
	nop
	set	0x78, %i2
	prefetch	[%l7 + %i2],	 0x0
	array32	%o7,	%i7,	%o5
	array32	%g4,	%g5,	%g7
	movg	%xcc,	%i0,	%i2
	fmovdg	%xcc,	%f31,	%f8
	nop 	! 	tl	%icc,	0x5 changed by convert2hboot
	brlez,a	%i1,	loop_2561
	subccc	%l4,	%g1,	%o1
	nop 	! 	ta	%xcc,	0x4 changed by convert2hboot
	wr	%g0,	0x2f,	%asi
loop_2561:
	fnot1	%f8,	%f26
	edge8	%l3,	%g6,	%i6
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
	movvc	%xcc,	%g2,	%o3
	fmul8x16	%f8,	%f28,	%f22
	fbo	%fcc3,	loop_2562
	mulx	%i4,	0x0C95,	%g3
	nop
	set	0x3E, %o1
	sth	%o6,	[%l7 + %o1]
	ldd	[%l7 + 0x10],	%l0
loop_2562:
	std	%f28,	[%l7 + 0x68]
	subcc	%l5,	%l2,	%l1
	fmovsa	%icc,	%f9,	%f28
	movneg	%xcc,	%o0,	%o2
	wr	%g0,	0x10,	%asi
	movn	%icc,	%o4,	%i3
	fble,a	%fcc0,	loop_2563
	srax	%l6,	%i7,	%o7
	sdiv	%o5,	0x13AB,	%g4
	fbne,a	%fcc1,	loop_2564
loop_2563:
	nop 	! 	taddcc	%g7,	0x0D15,	%i0 changed by convert2hboot
	fble,a	%fcc3,	loop_2565
	mulx	%g5,	%i1,	%l4
loop_2564:
	addcc	%i2,	0x0379,	%g1
	fbne	%fcc3,	loop_2566
loop_2565:
	movre	%i5,	0x013,	%o1
	nop 	! 	tsubcctv	%g6,	%i6,	%l3 changed by convert2hboot
	move	%icc,	%g2,	%i4
loop_2566:
	nop
	set	0x10, %i0
	nop	 ! 	stha	%g3,	[%l7 + %i0] 0x15 ASI use replaced by convert2hboot
	fmovrslez	%o3,	%f9,	%f9
	fcmpne32	%f20,	%f20,	%o6
	subc	%l0,	0x1830,	%l5
	fornot1s	%f1,	%f5,	%f8
	set	0x54, %i3
	nop	 ! 	lduwa	[%l7 + %i3] 0x0c,	%l2 ASI use replaced by convert2hboot
	fornot2s	%f7,	%f20,	%f5
	fmovdn	%icc,	%f13,	%f6
	nop 	! 	tleu	%xcc,	0x6 changed by convert2hboot
	fmovscc	%icc,	%f3,	%f30
	and	%o0,	%o2,	%o4
	movrgz	%i3,	0x0E6,	%l6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i7
	nop	 ! 	casa	[%l6] 0x0c,	%i7,	%l1 ASI use replaced by convert2hboot
	andn	%o7,	0x0F7C,	%o5
	ldstub	[%l7 + 0x25],	%g4
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x2C] %asi,	%f28
	ldub	[%l7 + 0x42],	%i0
	fmovrdgz	%g5,	%f10,	%f18
	nop 	! 	tsubcctv	%i1,	0x032E,	%g7 changed by convert2hboot
	fpack32	%f22,	%f2,	%f8
	fbe	%fcc1,	loop_2567
	fcmpes	%fcc1,	%f6,	%f13
	array32	%i2,	%g1,	%i5
	srlx	%o1,	%g6,	%i6
loop_2567:
	nop
	wr	%g0,	0x10,	%asi
	set	0x40, %l0
	nop	 ! 	stda	%f16,	[%l7 + %l0] 0x18 ASI use replaced by convert2hboot
	movre	%l3,	0x11B,	%i4
	ble,a,pn	%xcc,	loop_2568
	fxnors	%f8,	%f29,	%f4
	fpack32	%f14,	%f26,	%f8
	udivcc	%g3,	0x0CD0,	%o3
loop_2568:
	fmovrde	%o6,	%f4,	%f26
	edge32ln	%l0,	%g2,	%l2
	subccc	%l5,	%o0,	%o2
	addcc	%i3,	0x1CB5,	%o4
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
	movre	%i7,	0x389,	%l1
	edge32n	%l6,	%o5,	%g4
	movvc	%xcc,	%i0,	%o7
	fmovrdlz	%i1,	%f6,	%f20
	fsrc2	%f22,	%f22
	orn	%g7,	%i2,	%g1
	set	0x78, %l6
	nop	 ! 	stba	%i5,	[%l7 + %l6] 0x27 ASI use replaced by convert2hboot
	membar	#Sync
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x0C] %asi,	%f31
	edge32	%g5,	%g6,	%o1
	addc	%l4,	0x0FAE,	%l3
	movvc	%xcc,	%i6,	%i4
	udivx	%g3,	0x0F0C,	%o6
	fbug	%fcc2,	loop_2569
	stw	%l0,	[%l7 + 0x5C]
	udivcc	%o3,	0x1826,	%l2
	subc	%g2,	0x136B,	%l5
loop_2569:
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
	mulx	%o0,	%o2,	%o4
	fbl,a	%fcc3,	loop_2570
	edge16l	%i7,	%l1,	%l6
	movrgz	%i3,	%o5,	%i0
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
loop_2570:
	alignaddrl	%g4,	%i1,	%o7
	bvs	loop_2571
	fmovsa	%xcc,	%f24,	%f12
	orcc	%i2,	%g7,	%g1
	set	0x3A, %g7
	nop	 ! 	ldsha	[%l7 + %g7] 0x19,	%i5 ASI use replaced by convert2hboot
loop_2571:
	movpos	%icc,	%g6,	%g5
	nop 	! 	tsubcc	%l4,	%o1,	%i6 changed by convert2hboot
	edge16n	%l3,	%g3,	%i4
	wr	%g0,	0x10,	%asi
	mulscc	%l0,	0x1597,	%o3
	fbule	%fcc0,	loop_2572
	edge16	%l2,	%g2,	%l5
	fandnot2	%f30,	%f12,	%f28
	set	0x45, %l1
	nop	 ! 	lduba	[%l7 + %l1] 0x18,	%o2 ASI use replaced by convert2hboot
loop_2572:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	nop	 ! 	casxa	[%l6] 0x89,	%o0,	%o4 ASI use replaced by convert2hboot
	lduw	[%l7 + 0x1C],	%i7
	fmovdle	%icc,	%f21,	%f23
	bcs,a	%icc,	loop_2573
	fbul,a	%fcc3,	loop_2574
	st	%f4,	[%l7 + 0x58]
	bgu	%xcc,	loop_2575
loop_2573:
	ldsw	[%l7 + 0x54],	%l1
loop_2574:
	fexpand	%f25,	%f12
	brgz,a	%l6,	loop_2576
loop_2575:
	movle	%xcc,	%i3,	%i0
	movre	%g4,	%i1,	%o7
	set	0x0, %o7
	nop	 ! 	ldxa	[%g0 + %o7] 0x4f,	%o5 ASI use replaced by convert2hboot
loop_2576:
	alignaddr	%i2,	%g7,	%i5
	movrne	%g6,	%g1,	%l4
	edge32l	%g5,	%i6,	%o1
	call	loop_2577
	nop 	! 	tcs	%icc,	0x3 changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
	movrlz	%g3,	%l3,	%i4
loop_2577:
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
	fpsub32	%f2,	%f28,	%f24
	siam	0x7
	lduw	[%l7 + 0x68],	%o6
	fbule,a	%fcc2,	loop_2578
	edge8	%l0,	%l2,	%o3
	udivx	%l5,	0x12F9,	%o2
	sdivx	%o0,	0x0629,	%o4
loop_2578:
	addcc	%g2,	0x1630,	%l1
	srl	%l6,	%i7,	%i3
	mulscc	%g4,	%i1,	%i0
	edge32ln	%o7,	%o5,	%i2
	fbug,a	%fcc3,	loop_2579
	fmovsvc	%icc,	%f25,	%f3
	udivx	%i5,	0x155D,	%g7
	orn	%g1,	%l4,	%g5
loop_2579:
	array16	%i6,	%g6,	%g3
	fmovsg	%xcc,	%f0,	%f21
	movrne	%o1,	%l3,	%o6
	xorcc	%i4,	0x05FE,	%l0
	fxors	%f23,	%f20,	%f21
	udivcc	%o3,	0x02EA,	%l5
	movneg	%icc,	%o2,	%l2
	fpadd16s	%f4,	%f9,	%f15
	ldsb	[%l7 + 0x74],	%o0
	set	0x6C, %o3
	nop	 ! 	lduwa	[%l7 + %o3] 0x10,	%o4 ASI use replaced by convert2hboot
	edge32ln	%g2,	%l6,	%i7
	sethi	0x10DD,	%i3
	fnegs	%f14,	%f17
	xnorcc	%g4,	0x1EC5,	%l1
	movcs	%icc,	%i0,	%i1
	edge32l	%o7,	%o5,	%i5
	orcc	%i2,	0x142C,	%g7
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	srax	%g1,	0x08,	%g5
	fornot2s	%f8,	%f21,	%f25
	xnor	%l4,	0x0EED,	%g6
	edge32	%g3,	%i6,	%o1
	edge16ln	%o6,	%i4,	%l3
	fmovdvc	%xcc,	%f8,	%f5
	fblg,a	%fcc3,	loop_2580
	fandnot1	%f20,	%f16,	%f8
	fcmpgt16	%f24,	%f28,	%o3
	movrgz	%l5,	%o2,	%l0
loop_2580:
	mulx	%o0,	%o4,	%l2
	edge8	%l6,	%i7,	%i3
	sub	%g4,	%g2,	%i0
	set	0x18, %l2
	lda	[%l7 + %l2] 0x88,	%f7
	fbne,a	%fcc1,	loop_2581
	nop 	! 	taddcctv	%l1,	%i1,	%o7 changed by convert2hboot
	ba	%xcc,	loop_2582
	sllx	%o5,	%i2,	%i5
loop_2581:
	movrlez	%g7,	0x165,	%g1
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
loop_2582:
	fmovrdgez	%l4,	%f4,	%f30
	brlz	%g6,	loop_2583
	fblg,a	%fcc3,	loop_2584
	edge32	%g5,	%g3,	%o1
	movge	%icc,	%i6,	%i4
loop_2583:
	fsrc1s	%f4,	%f22
loop_2584:
	movneg	%xcc,	%o6,	%o3
	for	%f12,	%f20,	%f4
	movgu	%xcc,	%l3,	%l5
	siam	0x0
	wr	%g0,	0xf9,	%asi
	membar	#Sync
	sll	%o2,	0x03,	%o0
	brgez	%o4,	loop_2585
	edge32n	%l2,	%l6,	%l0
	edge8l	%i7,	%g4,	%i3
	movrlz	%g2,	0x032,	%l1
loop_2585:
	fornot2	%f28,	%f0,	%f16
	fpadd16s	%f13,	%f10,	%f8
	nop 	! 	taddcctv	%i1,	0x072E,	%i0 changed by convert2hboot
	fmovd	%f12,	%f16
	nop 	! 	tneg	%icc,	0x6 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,a	loop_2586
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	movne	%xcc,	%o5,	%i2
	movne	%icc,	%o7,	%i5
loop_2586:
	brgz	%g1,	loop_2587
	add	%g7,	%l4,	%g5
	stw	%g6,	[%l7 + 0x48]
	nop 	! 	te	%xcc,	0x7 changed by convert2hboot
loop_2587:
	edge32ln	%o1,	%i6,	%g3
	fxors	%f17,	%f16,	%f8
	array16	%o6,	%o3,	%l3
	addcc	%i4,	%o2,	%l5
	fpsub16	%f4,	%f6,	%f10
	brlz	%o0,	loop_2588
	fmovdvc	%icc,	%f0,	%f16
	set	0x40, %g4
	nop	 ! 	stda	%f0,	[%l7 + %g4] 0x1e ASI use replaced by convert2hboot
	membar	#Sync
loop_2588:
	fbl	%fcc0,	loop_2589
	nop
	setx loop_2590, %l0, %l1
	jmpl %l1, %l2
	alignaddr	%o4,	%l0,	%l6
	movrgz	%i7,	%i3,	%g2
loop_2589:
	movge	%xcc,	%l1,	%g4
loop_2590:
	movrgz	%i0,	0x3C4,	%o5
	edge8n	%i2,	%o7,	%i1
	set	0x58, %l3
	nop	 ! 	stxa	%i5,	[%l7 + %l3] 0x0c ASI use replaced by convert2hboot
	mova	%icc,	%g7,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l4,	%g5,	%g6
	movrgz	%i6,	%g3,	%o6
	fmovrsne	%o3,	%f29,	%f0
	ldsw	[%l7 + 0x70],	%l3
	brgez	%i4,	loop_2591
	smulcc	%o1,	0x0C82,	%o2
	fxor	%f30,	%f22,	%f6
	sll	%l5,	%o0,	%l2
loop_2591:
	movgu	%xcc,	%o4,	%l6
	fnegs	%f13,	%f4
	orncc	%i7,	%i3,	%g2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	nop	 ! 	casxa	[%l6] 0x10,	%l1,	%l0 ASI use replaced by convert2hboot
	fmovrde	%i0,	%f4,	%f30
	fbl,a	%fcc2,	loop_2592
	popc	0x1A17,	%g4
	and	%i2,	%o5,	%i1
	fmovrde	%o7,	%f28,	%f22
loop_2592:
	fnot1s	%f26,	%f10
	popc	%g7,	%g1
	wr	%g0,	0x10,	%asi
	fmovscc	%icc,	%f6,	%f11
	movn	%icc,	%g5,	%g6
	fxnor	%f22,	%f18,	%f12
	movcs	%xcc,	%i6,	%g3
	fmovspos	%xcc,	%f1,	%f1
	fmul8x16au	%f3,	%f4,	%f24
	wr	%g0,	0x04,	%asi
	sdivcc	%o3,	0x01AE,	%l4
	fmovsge	%icc,	%f12,	%f20
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	udivx	%i4,	0x09B7,	%l3
	and	%o1,	0x1C4A,	%o2
	movgu	%xcc,	%o0,	%l2
	edge8ln	%l5,	%o4,	%i7
	xorcc	%i3,	%g2,	%l1
	nop 	! 	tl	%icc,	0x3 changed by convert2hboot
	srax	%l6,	0x09,	%l0
	set	0x62, %g1
	nop	 ! 	ldsba	[%l7 + %g1] 0x81,	%i0 ASI use replaced by convert2hboot
	fands	%f17,	%f18,	%f29
	movcc	%icc,	%i2,	%o5
	movg	%icc,	%g4,	%i1
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
	nop 	! 	tvc	%icc,	0x0 changed by convert2hboot
	udiv	%g7,	0x10ED,	%o7
	bgu	%xcc,	loop_2593
	movrlez	%g1,	0x0D1,	%i5
	orncc	%g6,	%g5,	%i6
	wr	%g0,	0x89,	%asi
loop_2593:
	edge16ln	%g3,	%o3,	%i4
	fxnors	%f13,	%f28,	%f21
	brgez,a	%l3,	loop_2594
	movrgez	%o1,	%l4,	%o0
	fmovscs	%icc,	%f31,	%f23
	xnor	%o2,	%l5,	%o4
loop_2594:
	edge8n	%l2,	%i7,	%i3
	orncc	%l1,	%g2,	%l6
	nop 	! 	tleu	%icc,	0x1 changed by convert2hboot
	set	0x2C, %l5
	sta	%f27,	[%l7 + %l5] 0x88
	edge16	%i0,	%l0,	%i2
	fcmpes	%fcc2,	%f0,	%f0
	movvc	%xcc,	%o5,	%i1
	wr	%g0,	0x88,	%asi
	edge8	%g7,	%o7,	%g1
	sethi	0x15D6,	%g6
	fnor	%f10,	%f8,	%f16
	fmovdpos	%xcc,	%f30,	%f3
	fnegs	%f5,	%f14
	addccc	%g5,	0x0CA1,	%i6
	fands	%f18,	%f5,	%f2
	brgez	%o6,	loop_2595
	nop 	! 	taddcc	%i5,	0x0590,	%o3 changed by convert2hboot
	bcc,pt	%xcc,	loop_2596
	fnot2s	%f31,	%f1
loop_2595:
	bpos,pt	%xcc,	loop_2597
	subccc	%i4,	0x196D,	%l3
loop_2596:
	edge32n	%o1,	%g3,	%l4
	addc	%o0,	%l5,	%o4
loop_2597:
	xnor	%o2,	0x1B39,	%l2
	brlz,a	%i7,	loop_2598
	andncc	%l1,	%i3,	%g2
	nop 	! 	te	%xcc,	0x6 changed by convert2hboot
	nop 	! 	taddcctv	%l6,	0x08D4,	%i0 changed by convert2hboot
loop_2598:
	membar	0x1B
	set	0x45, %g6
	nop	 ! 	ldsba	[%l7 + %g6] 0x15,	%l0 ASI use replaced by convert2hboot
	srl	%i2,	%o5,	%g4
	brgz,a	%g7,	loop_2599
	membar	0x0F
	brnz	%o7,	loop_2600
	sdivcc	%g1,	0x1BE4,	%g6
loop_2599:
	nop 	! 	taddcctv	%g5,	%i1,	%i6 changed by convert2hboot
	wr	%g0,	0x2b,	%asi
	membar	#Sync
loop_2600:
	nop
	wr	%g0,	0x1f,	%asi
	membar	#Sync
	wr	%g0,	0x89,	%asi
	array16	%i4,	%l3,	%o1
	nop 	! 	tsubcctv	%o3,	%l4,	%g3 changed by convert2hboot
	fpack32	%f28,	%f6,	%f14
	movne	%icc,	%o0,	%o4
	nop 	! 	tcc	%icc,	0x1 changed by convert2hboot
	movrgz	%l5,	%o2,	%i7
	nop 	! 	tpos	%xcc,	0x7 changed by convert2hboot
	fands	%f12,	%f9,	%f21
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	bcc,pt	%icc,	loop_2601
	subccc	%l1,	%l2,	%i3
	nop 	! 	taddcctv	%g2,	0x007F,	%l6 changed by convert2hboot
	fand	%f24,	%f26,	%f4
loop_2601:
	nop
	wr	%g0,	0x80,	%asi
	movcs	%xcc,	%l0,	%o5
	edge16ln	%g4,	%i2,	%o7
	fmovdgu	%xcc,	%f18,	%f22
	fmul8x16au	%f15,	%f14,	%f24
	nop 	! 	taddcctv	%g1,	%g6,	%g5 changed by convert2hboot
	fmovrdne	%i1,	%f12,	%f14
	addcc	%g7,	0x0807,	%o6
	fmovrslz	%i6,	%f20,	%f8
	fornot1s	%f24,	%f0,	%f25
	nop 	! 	tvc	%xcc,	0x4 changed by convert2hboot
	movrlz	%i4,	0x142,	%l3
	movrgez	%i5,	%o1,	%l4
	nop 	! 	taddcc	%o3,	0x0E46,	%o0 changed by convert2hboot
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule,a	%fcc1,	loop_2602
	brgz,a	%o4,	loop_2603
	xorcc	%l5,	%o2,	%g3
loop_2602:
	mulscc	%l1,	%l2,	%i7
loop_2603:
	movre	%i3,	%l6,	%i0
	smul	%l0,	%g2,	%o5
	add	%i2,	%o7,	%g4
	ble,pt	%icc,	loop_2604
	ldstub	[%l7 + 0x29],	%g6
	srl	%g1,	0x03,	%i1
	fmovda	%xcc,	%f31,	%f23
loop_2604:
	movrlez	%g7,	0x2AF,	%g5
	nop 	! 	tsubcctv	%o6,	0x09B8,	%i6 changed by convert2hboot
	brlz	%i4,	loop_2605
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	movcc	%icc,	%i5,	%l3
	movneg	%icc,	%o1,	%o3
loop_2605:
	nop
	set	0x18, %l4
	nop	 ! 	ldxa	[%l7 + %l4] 0x19,	%l4 ASI use replaced by convert2hboot
	wr	%g0,	0x89,	%asi
	fxnors	%f5,	%f18,	%f8
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	srlx	%l5,	0x06,	%o2
	udivcc	%g3,	0x1CB3,	%o0
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	andcc	%l2,	0x055F,	%i7
	xorcc	%i3,	%l1,	%l6
	srax	%i0,	%l0,	%g2
	movre	%o5,	0x0F4,	%o7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	fpadd32	%f16,	%f24,	%f4
	udivcc	%g6,	0x021D,	%g1
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
	fnot2s	%f6,	%f16
	nop 	! 	ta	%xcc,	0x5 changed by convert2hboot
	edge16l	%g7,	%g5,	%i1
	sdiv	%i6,	0x1AB3,	%o6
	xor	%i5,	%l3,	%i4
	fmovrsgez	%o3,	%f18,	%f1
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
	sethi	0x12EA,	%l4
	fpack32	%f10,	%f22,	%f12
	movrlez	%o1,	%o4,	%l5
	movne	%icc,	%g3,	%o0
	fmovse	%icc,	%f13,	%f23
	nop 	! 	tcc	%xcc,	0x4 changed by convert2hboot
	fmovdleu	%xcc,	%f8,	%f12
	udiv	%l2,	0x0756,	%i7
	movpos	%xcc,	%o2,	%l1
	movvs	%xcc,	%l6,	%i0
	bne,pt	%icc,	loop_2606
	mulx	%l0,	%i3,	%o5
	fcmpes	%fcc2,	%f9,	%f8
	brz,a	%g2,	loop_2607
loop_2606:
	movn	%icc,	%i2,	%o7
	edge32n	%g4,	%g6,	%g7
	movneg	%icc,	%g1,	%g5
loop_2607:
	fmovsne	%xcc,	%f23,	%f21
	fmovsn	%xcc,	%f20,	%f28
	fsrc2s	%f14,	%f17
	movge	%xcc,	%i1,	%o6
	fcmps	%fcc3,	%f29,	%f19
	movvs	%icc,	%i5,	%l3
	nop 	! 	tpos	%xcc,	0x4 changed by convert2hboot
	fbn,a	%fcc0,	loop_2608
	edge32n	%i4,	%o3,	%i6
	movne	%icc,	%o1,	%l4
	nop
	setx	loop_2609,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_2608:
	fmovrde	%l5,	%f12,	%f18
	movrlez	%o4,	%g3,	%l2
	fmovdvs	%icc,	%f1,	%f18
loop_2609:
	fnot2	%f2,	%f20
	andcc	%i7,	0x1B9E,	%o2
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%l1
	bleu,a	%xcc,	loop_2610
	movge	%icc,	%o0,	%i0
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	fmovsg	%xcc,	%f8,	%f10
loop_2610:
	edge16ln	%l0,	%i3,	%g2
	sethi	0x05E2,	%i2
	addcc	%o7,	0x0E21,	%o5
	popc	%g4,	%g6
	nop
	set	0x7C, %o0
	ldsh	[%l7 + %o0],	%g1
	fmovsvs	%xcc,	%f1,	%f4
	orn	%g5,	%g7,	%o6
	edge8ln	%i5,	%l3,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge,a	%fcc1,	loop_2611
	sdivx	%i1,	0x0F0D,	%i6
	bleu,a	%xcc,	loop_2612
	fba	%fcc1,	loop_2613
loop_2611:
	edge32ln	%o1,	%l4,	%o3
	wr	%g0,	0x0c,	%asi
loop_2612:
	fble,a	%fcc0,	loop_2614
loop_2613:
	fandnot1	%f0,	%f4,	%f0
	xnorcc	%l5,	%g3,	%i7
	andn	%l2,	0x043C,	%o2
loop_2614:
	mulscc	%l6,	%o0,	%i0
	ldd	[%l7 + 0x08],	%l0
	fmovsge	%xcc,	%f30,	%f6
	fbe,a	%fcc1,	loop_2615
	bn,a	%icc,	loop_2616
	nop
	setx loop_2617, %l0, %l1
	jmpl %l1, %l1
	movrlz	%g2,	0x0E3,	%i2
loop_2615:
loop_2616:
	array32	%i3,	%o7,	%o5
loop_2617:
	fone	%f0
	move	%xcc,	%g6,	%g1
	fbo	%fcc2,	loop_2618
	bg,pt	%icc,	loop_2619
	movrlez	%g5,	0x0C6,	%g7
	edge16	%o6,	%i5,	%g4
loop_2618:
	brnz	%l3,	loop_2620
loop_2619:
	prefetch	[%l7 + 0x4C],	 0x1
	subccc	%i1,	0x17C5,	%i6
	fmovrslz	%o1,	%f21,	%f7
loop_2620:
	edge8	%l4,	%o3,	%i4
	fmovsn	%xcc,	%f3,	%f28
	fzero	%f26
	set	0x4C, %g5
	lda	[%l7 + %g5] 0x11,	%f28
	sdivx	%o4,	0x157D,	%l5
	andn	%i7,	0x078F,	%l2
	fmovdleu	%icc,	%f21,	%f19
	wr	%g0,	0x80,	%asi
	set	0x20, %g3
	sta	%f19,	[%l7 + %g3] 0x19
	or	%o2,	%o0,	%l6
	fbu	%fcc1,	loop_2621
	brlez,a	%i0,	loop_2622
	umul	%l1,	%g2,	%i2
	wr	%g0,	0xea,	%asi
	membar	#Sync
loop_2621:
	fbue,a	%fcc2,	loop_2623
loop_2622:
	move	%xcc,	%o7,	%i3
	fbug,a	%fcc0,	loop_2624
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
loop_2623:
	umulcc	%o5,	%g1,	%g5
	bvc	%icc,	loop_2625
loop_2624:
	edge16	%g7,	%g6,	%i5
	fbge	%fcc0,	loop_2626
	movleu	%xcc,	%g4,	%l3
loop_2625:
	fsrc1s	%f7,	%f20
	stx	%i1,	[%l7 + 0x78]
loop_2626:
	nop 	! 	taddcc	%i6,	0x1B64,	%o6 changed by convert2hboot
	edge32	%l4,	%o1,	%i4
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	fpsub16s	%f23,	%f5,	%f29
	lduw	[%l7 + 0x10],	%o4
	fpsub32	%f20,	%f2,	%f10
	fble	%fcc3,	loop_2627
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l5,	%o3,	%i7
	bgu,a,pt	%icc,	loop_2628
loop_2627:
	edge8n	%l2,	%g3,	%o2
	edge8ln	%l6,	%i0,	%l1
	fsrc1	%f18,	%f24
loop_2628:
	fpsub16	%f16,	%f28,	%f16
	fbuge	%fcc2,	loop_2629
	and	%o0,	0x1886,	%i2
	movne	%icc,	%l0,	%g2
	movg	%xcc,	%i3,	%o7
loop_2629:
	nop
	set	0x4E, %i6
	nop	 ! 	lduha	[%l7 + %i6] 0x04,	%o5 ASI use replaced by convert2hboot
	fnegd	%f28,	%f28
	move	%icc,	%g5,	%g7
	fnot1s	%f19,	%f2
	alignaddrl	%g6,	%g1,	%i5
	fmul8sux16	%f30,	%f2,	%f30
	movrne	%l3,	%g4,	%i6
	movge	%icc,	%i1,	%l4
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	fornot1s	%f0,	%f11,	%f16
	andn	%o1,	%o6,	%i4
	ldstub	[%l7 + 0x08],	%o4
	fbul,a	%fcc1,	loop_2630
	nop 	! 	tleu	%icc,	0x3 changed by convert2hboot
	lduw	[%l7 + 0x38],	%o3
	stb	%l5,	[%l7 + 0x50]
loop_2630:
	udivx	%i7,	0x14DC,	%l2
	flush	%l7 + 0x24
	orcc	%o2,	0x03B9,	%l6
	fbul	%fcc3,	loop_2631
	xnorcc	%g3,	%i0,	%o0
	smul	%i2,	%l1,	%g2
	srl	%l0,	%o7,	%i3
loop_2631:
	mulx	%o5,	%g7,	%g5
	ble,a	%xcc,	loop_2632
	xnorcc	%g6,	0x1BCE,	%g1
	movrlez	%l3,	0x377,	%i5
	pdist	%f30,	%f4,	%f20
loop_2632:
	bn,pn	%icc,	loop_2633
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	call	loop_2634
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
loop_2633:
	nop
	set	0x38, %i4
	nop	 ! 	stxa	%i6,	[%l7 + %i4] 0x81 ASI use replaced by convert2hboot
loop_2634:
	fmul8x16au	%f1,	%f9,	%f28
	mulscc	%g4,	0x00BF,	%i1
	fmovrdne	%o1,	%f16,	%f12
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	ble,a	%xcc,	loop_2635
	movvs	%xcc,	%o6,	%i4
	bgu,a,pn	%icc,	loop_2636
	fbne,a	%fcc3,	loop_2637
loop_2635:
	movpos	%xcc,	%o4,	%o3
	movrne	%l5,	0x22B,	%i7
loop_2636:
	xnor	%l2,	%l4,	%l6
loop_2637:
	nop 	! 	tcs	%xcc,	0x5 changed by convert2hboot
	movcs	%icc,	%g3,	%i0
	movvc	%xcc,	%o2,	%o0
	edge16l	%i2,	%l1,	%g2
	edge32ln	%o7,	%i3,	%o5
	wr	%g0,	0x81,	%asi
	sethi	0x178A,	%g5
	andn	%g6,	0x07F9,	%g7
	bvc,a	%icc,	loop_2638
	subccc	%g1,	%l3,	%i6
	udivx	%i5,	0x1F89,	%i1
	ldsh	[%l7 + 0x6E],	%o1
loop_2638:
	move	%xcc,	%g4,	%i4
	fmul8sux16	%f16,	%f10,	%f28
	xnorcc	%o6,	0x1A73,	%o4
	popc	%o3,	%l5
	nop 	! 	tgu	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tleu	%xcc,	0x6 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%i7,	%l2
	or	%l6,	0x10F7,	%l4
	mulscc	%i0,	0x0F63,	%o2
	fmovsge	%xcc,	%f26,	%f27
	fmovsleu	%xcc,	%f17,	%f15
	pdist	%f24,	%f6,	%f20
	fmovdleu	%xcc,	%f28,	%f12
	fmovsgu	%icc,	%f14,	%f26
	movrlz	%o0,	%g3,	%l1
	andncc	%i2,	%o7,	%g2
	nop 	! 	tcs	%xcc,	0x6 changed by convert2hboot
	fcmpeq16	%f24,	%f14,	%o5
	nop 	! 	tvc	%xcc,	0x3 changed by convert2hboot
	sllx	%l0,	0x11,	%g5
	nop 	! 	tcs	%xcc,	0x5 changed by convert2hboot
	movl	%icc,	%i3,	%g6
	fmovspos	%xcc,	%f14,	%f2
	fbe	%fcc0,	loop_2639
	fbug,a	%fcc1,	loop_2640
	fbl	%fcc1,	loop_2641
	popc	0x1399,	%g1
loop_2639:
	umul	%g7,	%i6,	%i5
loop_2640:
	siam	0x0
loop_2641:
	nop
	set	0x14, %g2
	nop	 ! 	ldswa	[%l7 + %g2] 0x80,	%i1 ASI use replaced by convert2hboot
	fbul,a	%fcc0,	loop_2642
	fpsub16	%f26,	%f4,	%f20
	fmovrsne	%l3,	%f29,	%f0
	fbn,a	%fcc3,	loop_2643
loop_2642:
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x0 changed by convert2hboot
	edge16l	%g4,	%i4,	%o6
loop_2643:
	fone	%f8
	and	%o1,	%o4,	%o3
	edge16ln	%i7,	%l2,	%l6
	fmovrdlz	%l4,	%f26,	%f18
	add	%i0,	%l5,	%o0
	nop
	set	0x28, %o2
	ldd	[%l7 + %o2],	%f24
	and	%o2,	%g3,	%i2
	array16	%o7,	%g2,	%o5
	fand	%f6,	%f30,	%f22
	sllx	%l1,	0x1E,	%l0
	alignaddr	%i3,	%g5,	%g6
	nop 	! 	tg	%icc,	0x2 changed by convert2hboot
	udiv	%g7,	0x1394,	%g1
	mulscc	%i5,	0x19BE,	%i6
	brlez	%l3,	loop_2644
	movvs	%icc,	%i1,	%i4
	fmovrsgz	%g4,	%f8,	%f17
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
loop_2644:
	movneg	%xcc,	%o1,	%o6
	movne	%icc,	%o3,	%o4
	ldd	[%l7 + 0x58],	%f14
	movleu	%xcc,	%l2,	%i7
	fnegd	%f14,	%f26
	mulx	%l4,	%i0,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f31,	%f6,	%f17
	fmovdvc	%xcc,	%f27,	%f25
	smul	%l6,	%o2,	%g3
	sdivcc	%i2,	0x0F46,	%o7
	fmovsle	%xcc,	%f9,	%f22
	ld	[%l7 + 0x10],	%f22
	fmovdvc	%icc,	%f2,	%f16
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
	fbl,a	%fcc0,	loop_2645
	movne	%icc,	%o0,	%o5
	edge32ln	%l1,	%g2,	%i3
	movl	%xcc,	%g5,	%l0
loop_2645:
	nop 	! 	tpos	%icc,	0x6 changed by convert2hboot
	nop 	! 	tsubcc	%g6,	0x1468,	%g7 changed by convert2hboot
	membar	0x32
	subcc	%i5,	0x1F64,	%i6
	popc	%g1,	%i1
	fmovdcc	%xcc,	%f0,	%f24
	udivcc	%l3,	0x13AD,	%i4
	sdivx	%g4,	0x1D45,	%o1
	or	%o6,	%o3,	%o4
	fmovrdlz	%l2,	%f8,	%f22
	fmul8x16au	%f13,	%f13,	%f2
	movge	%icc,	%i7,	%i0
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%l4
	fors	%f20,	%f22,	%f9
	fmovs	%f22,	%f24
	fxnors	%f29,	%f25,	%f10
	movcs	%xcc,	%l6,	%l5
	bcs,a,pn	%xcc,	loop_2646
	fmovdvc	%icc,	%f2,	%f1
	wr	%g0,	0x80,	%asi
loop_2646:
	addc	%o2,	%o7,	%o0
	fmovrdlz	%i2,	%f4,	%f6
	fmovse	%xcc,	%f10,	%f2
	bvc	%xcc,	loop_2647
	udivcc	%o5,	0x0CDA,	%l1
	stx	%i3,	[%l7 + 0x68]
	srl	%g5,	%g2,	%l0
loop_2647:
	nop 	! 	tsubcc	%g6,	0x085A,	%g7 changed by convert2hboot
	swap	[%l7 + 0x50],	%i6
	edge8	%i5,	%i1,	%l3
	fblg	%fcc1,	loop_2648
	fnot2s	%f5,	%f10
	edge16ln	%g1,	%i4,	%o1
	nop
	set	0x3F, %o4
	stb	%g4,	[%l7 + %o4]
loop_2648:
	srlx	%o6,	%o3,	%l2
	sub	%o4,	%i7,	%i0
	ba,a	%icc,	loop_2649
	fandnot2	%f2,	%f20,	%f16
	fcmpne16	%f14,	%f12,	%l4
	fone	%f28
loop_2649:
	nop
	setx	loop_2650,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	array8	%l6,	%l5,	%g3
	orcc	%o2,	0x12F6,	%o7
	movneg	%xcc,	%o0,	%i2
loop_2650:
	movrlz	%o5,	%i3,	%l1
	xor	%g5,	%g2,	%l0
	edge32n	%g6,	%i6,	%i5
	fmul8sux16	%f18,	%f22,	%f2
	srl	%i1,	0x15,	%g7
	fcmped	%fcc2,	%f10,	%f30
	edge16n	%l3,	%g1,	%o1
	movrgez	%i4,	%o6,	%g4
	fmovrslez	%o3,	%f26,	%f22
	andncc	%l2,	%o4,	%i7
	fpadd32s	%f1,	%f22,	%f13
	movre	%l4,	0x197,	%l6
	andcc	%i0,	%l5,	%g3
	fnot1s	%f16,	%f24
	fmovdvc	%icc,	%f25,	%f1
	flush	%l7 + 0x10
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
	ba,pn	%xcc,	loop_2651
	fandnot1	%f12,	%f22,	%f8
	nop 	! 	tgu	%xcc,	0x4 changed by convert2hboot
	srax	%o7,	%o0,	%o2
loop_2651:
	nop 	! 	tvc	%xcc,	0x3 changed by convert2hboot
	movcs	%icc,	%i2,	%i3
	sdivx	%l1,	0x1F70,	%o5
	xnorcc	%g2,	0x1D1F,	%l0
	swap	[%l7 + 0x18],	%g6
	fble	%fcc2,	loop_2652
	fcmped	%fcc0,	%f8,	%f14
	set	0x18, %i1
	nop	 ! 	stxa	%i6,	[%g0 + %i1] 0x20 ASI use replaced by convert2hboot
loop_2652:
	nop 	! 	tcs	%icc,	0x5 changed by convert2hboot
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	edge8l	%g5,	%i1,	%g7
	addccc	%i5,	0x1E45,	%g1
	array16	%l3,	%i4,	%o1
	fmovd	%f22,	%f10
	edge8n	%o6,	%o3,	%l2
	edge8	%g4,	%o4,	%i7
	fmovrslz	%l6,	%f13,	%f14
	bcc	%icc,	loop_2653
	fmovsgu	%xcc,	%f0,	%f12
	edge16l	%i0,	%l5,	%g3
	movre	%o7,	0x018,	%o0
loop_2653:
	fmovrsne	%l4,	%f26,	%f8
	fmovrdgz	%o2,	%f16,	%f12
	movrgez	%i3,	0x32A,	%l1
	ldub	[%l7 + 0x6A],	%i2
	srl	%g2,	0x04,	%o5
	bg,a,pt	%icc,	loop_2654
	fmovdn	%icc,	%f16,	%f15
	sll	%l0,	0x08,	%i6
	mulscc	%g6,	%g5,	%i1
loop_2654:
	nop 	! 	tgu	%icc,	0x4 changed by convert2hboot
	fand	%f24,	%f12,	%f2
	movrlz	%i5,	0x307,	%g7
	fmuld8ulx16	%f25,	%f22,	%f20
	fzeros	%f26
	umul	%g1,	0x12B8,	%l3
	fcmpeq16	%f30,	%f10,	%i4
	fbue	%fcc3,	loop_2655
	alignaddr	%o1,	%o3,	%o6
	fornot2	%f26,	%f28,	%f10
	smul	%l2,	%o4,	%g4
loop_2655:
	umulcc	%i7,	%l6,	%i0
	movvc	%xcc,	%l5,	%o7
	movrlz	%o0,	0x3EF,	%l4
	bge,pn	%xcc,	loop_2656
	nop 	! 	te	%icc,	0x3 changed by convert2hboot
	move	%icc,	%o2,	%i3
	nop 	! 	tl	%icc,	0x5 changed by convert2hboot
loop_2656:
	movvs	%xcc,	%g3,	%i2
	sdivcc	%l1,	0x0F8D,	%o5
	swap	[%l7 + 0x30],	%g2
	edge8l	%l0,	%i6,	%g6
	movneg	%xcc,	%g5,	%i1
	fbl,a	%fcc0,	loop_2657
	movl	%xcc,	%g7,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x01
loop_2657:
	prefetch	[%l7 + 0x30],	 0x2
	andcc	%l3,	0x1254,	%g1
	nop 	! 	tvc	%icc,	0x2 changed by convert2hboot
	nop 	! 	taddcctv	%o1,	%i4,	%o6 changed by convert2hboot
	bpos,pt	%icc,	loop_2658
	srl	%o3,	0x10,	%l2
	bpos,a,pt	%icc,	loop_2659
	nop 	! 	tcc	%icc,	0x4 changed by convert2hboot
loop_2658:
	fcmple32	%f12,	%f10,	%g4
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
loop_2659:
	edge8n	%i7,	%o4,	%l6
	fcmpgt16	%f22,	%f4,	%i0
	udivx	%o7,	0x0CF2,	%l5
	orcc	%l4,	0x1EAA,	%o0
	nop 	! 	tpos	%xcc,	0x6 changed by convert2hboot
	nop 	! 	taddcctv	%i3,	0x03DE,	%o2 changed by convert2hboot
	fmovdcc	%xcc,	%f19,	%f25
	movgu	%xcc,	%i2,	%g3
	nop 	! 	sir	0x0D24 changed by convert2hboot
	fmovsge	%xcc,	%f28,	%f2
	movne	%xcc,	%l1,	%o5
	sethi	0x0C17,	%g2
	udivx	%i6,	0x1683,	%g6
	fpmerge	%f10,	%f26,	%f2
	set	0x38, %i7
	nop	 ! 	lduwa	[%l7 + %i7] 0x80,	%g5 ASI use replaced by convert2hboot
	nop 	! 	tgu	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
	edge16ln	%l0,	%i1,	%i5
	udiv	%g7,	0x00CB,	%l3
	fpsub32	%f18,	%f8,	%f22
	fpsub16s	%f0,	%f30,	%f15
	for	%f24,	%f14,	%f6
	umulcc	%g1,	%o1,	%o6
	std	%o2,	[%l7 + 0x58]
	set	0x40, %o6
	nop	 ! 	stda	%f0,	[%l7 + %o6] 0x10 ASI use replaced by convert2hboot
	nop 	! 	tne	%icc,	0x5 changed by convert2hboot
	sllx	%i4,	0x0D,	%l2
	fnors	%f7,	%f21,	%f28
	ldsw	[%l7 + 0x1C],	%g4
	bne,pt	%xcc,	loop_2660
	nop 	! 	taddcc	%o4,	%l6,	%i0 changed by convert2hboot
	sub	%i7,	%l5,	%l4
	fsrc1	%f30,	%f18
loop_2660:
	sethi	0x19DD,	%o7
	fcmped	%fcc3,	%f8,	%f4
	movn	%xcc,	%o0,	%i3
	fcmpeq16	%f0,	%f14,	%i2
	brgz	%o2,	loop_2661
	nop 	! 	tpos	%icc,	0x3 changed by convert2hboot
	sdivcc	%g3,	0x0E63,	%o5
	fnot1s	%f25,	%f28
loop_2661:
	array32	%l1,	%g2,	%i6
	fcmpgt32	%f20,	%f20,	%g5
	fmovscs	%icc,	%f2,	%f25
	edge8ln	%g6,	%i1,	%l0
	move	%xcc,	%g7,	%l3
	fmovrsne	%g1,	%f15,	%f30
	set	0x54, %i2
	nop	 ! 	stwa	%i5,	[%l7 + %i2] 0x81 ASI use replaced by convert2hboot
	fnot2s	%f15,	%f30
	nop 	! 	tge	%icc,	0x3 changed by convert2hboot
	fbg	%fcc1,	loop_2662
	fmovs	%f17,	%f17
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tl	%xcc,	0x6 changed by convert2hboot
loop_2662:
	edge16ln	%o6,	%o1,	%i4
	nop 	! 	taddcctv	%o3,	0x1FC7,	%l2 changed by convert2hboot
	movle	%icc,	%g4,	%l6
	movpos	%xcc,	%i0,	%i7
	wr	%g0,	0x10,	%asi
	membar	0x60
	fbg	%fcc1,	loop_2663
	fmovdn	%icc,	%f20,	%f17
	fmovsge	%icc,	%f29,	%f10
	ba	%xcc,	loop_2664
loop_2663:
	fnot1	%f2,	%f4
	orn	%o4,	%l4,	%o7
	movleu	%icc,	%o0,	%i3
loop_2664:
	movge	%icc,	%l5,	%o2
	ble,pn	%icc,	loop_2665
	fmovrsgez	%g3,	%f0,	%f29
	brlz,a	%i2,	loop_2666
	brgz,a	%o5,	loop_2667
loop_2665:
	edge32ln	%g2,	%i6,	%g5
	fsrc2	%f30,	%f16
loop_2666:
	fpsub32s	%f7,	%f27,	%f21
loop_2667:
	fmovscs	%icc,	%f21,	%f30
	fmuld8ulx16	%f30,	%f6,	%f4
	bl,pn	%xcc,	loop_2668
	xorcc	%g6,	0x11DE,	%i1
	fpsub32s	%f21,	%f21,	%f3
	fbo,a	%fcc2,	loop_2669
loop_2668:
	fmovse	%xcc,	%f31,	%f16
	fmovdvs	%xcc,	%f9,	%f22
	movcs	%xcc,	%l1,	%g7
loop_2669:
	edge16	%l3,	%g1,	%i5
	popc	0x0DB1,	%o6
	addccc	%o1,	0x1123,	%i4
	smul	%l0,	%l2,	%o3
	subcc	%g4,	0x0D7D,	%l6
	sll	%i0,	0x16,	%i7
	movneg	%icc,	%o4,	%l4
	fone	%f30
	sll	%o0,	%i3,	%l5
	sdivx	%o2,	0x1A4F,	%g3
	fornot1	%f0,	%f20,	%f12
	movg	%xcc,	%o7,	%i2
	brlez	%g2,	loop_2670
	edge16ln	%o5,	%g5,	%g6
	mulscc	%i6,	%l1,	%i1
	xnor	%g7,	%l3,	%g1
loop_2670:
	fmovrslez	%o6,	%f30,	%f6
	std	%i4,	[%l7 + 0x20]
	fmovdcc	%xcc,	%f31,	%f28
	fcmpgt16	%f24,	%f28,	%i4
	fxors	%f27,	%f19,	%f14
	bvs,a,pt	%icc,	loop_2671
	fmovrdlez	%l0,	%f16,	%f22
	brnz	%o1,	loop_2672
	fbule	%fcc3,	loop_2673
loop_2671:
	xorcc	%o3,	0x07DD,	%l2
	movneg	%xcc,	%g4,	%i0
loop_2672:
	edge32ln	%i7,	%l6,	%l4
loop_2673:
	udiv	%o4,	0x1D6F,	%o0
	bne,a,pt	%icc,	loop_2674
	flush	%l7 + 0x54
	subcc	%i3,	%l5,	%o2
	edge32ln	%g3,	%o7,	%g2
loop_2674:
	array16	%o5,	%i2,	%g5
	orcc	%i6,	%g6,	%i1
	mova	%icc,	%l1,	%g7
	fpsub32s	%f0,	%f10,	%f17
	movcc	%icc,	%l3,	%g1
	edge16ln	%i5,	%i4,	%o6
	movneg	%icc,	%o1,	%o3
	ba,pn	%xcc,	loop_2675
	movrgz	%l0,	0x25A,	%l2
	fbge	%fcc0,	loop_2676
	sra	%i0,	%g4,	%l6
loop_2675:
	bshuffle	%f0,	%f20,	%f8
	movrlez	%i7,	%l4,	%o0
loop_2676:
	nop 	! 	tvs	%xcc,	0x2 changed by convert2hboot
	xnor	%o4,	0x1B4C,	%l5
	sth	%o2,	[%l7 + 0x08]
	nop 	! 	tvc	%icc,	0x4 changed by convert2hboot
	xorcc	%i3,	0x1A20,	%g3
	movne	%icc,	%o7,	%o5
	fnot2s	%f15,	%f8
	fand	%f4,	%f24,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i2,	0x121A,	%g5
	andcc	%i6,	%g6,	%g2
	fpadd32	%f20,	%f30,	%f30
	movrgez	%i1,	%l1,	%g7
	srlx	%l3,	0x18,	%i5
	movrgz	%i4,	0x335,	%o6
	fblg	%fcc1,	loop_2677
	and	%o1,	%g1,	%l0
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
	popc	%l2,	%i0
loop_2677:
	nop
	set	0x48, %o1
	ldx	[%l7 + %o1],	%o3
	fcmpne32	%f24,	%f4,	%g4
	nop
	setx	loop_2678,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	bg,a,pt	%icc,	loop_2679
	membar	0x48
	nop
	set	0x70, %i5
	lduw	[%l7 + %i5],	%l6
loop_2678:
	movpos	%xcc,	%i7,	%l4
loop_2679:
	bleu,a	%icc,	loop_2680
	fbul,a	%fcc0,	loop_2681
	edge32	%o4,	%l5,	%o0
	sllx	%i3,	0x0C,	%g3
loop_2680:
	fpadd32s	%f28,	%f22,	%f17
loop_2681:
	orn	%o7,	0x1D9D,	%o2
	fmovdle	%icc,	%f25,	%f1
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x4C] %asi,	%f27
	nop 	! 	tcs	%icc,	0x4 changed by convert2hboot
	nop 	! 	taddcctv	%o5,	%g5,	%i2 changed by convert2hboot
	smul	%g6,	%i6,	%i1
	bg,a,pt	%icc,	loop_2682
	nop 	! 	tsubcctv	%l1,	%g2,	%g7 changed by convert2hboot
	nop 	! 	tg	%icc,	0x1 changed by convert2hboot
	fzeros	%f3
loop_2682:
	call	loop_2683
	movrlz	%l3,	%i5,	%o6
	lduw	[%l7 + 0x7C],	%i4
	fmovrde	%g1,	%f10,	%f20
loop_2683:
	fmovsa	%icc,	%f11,	%f29
	fmul8x16au	%f27,	%f1,	%f24
	movne	%icc,	%o1,	%l2
	nop 	! 	tg	%icc,	0x1 changed by convert2hboot
	fmovrdlez	%i0,	%f26,	%f8
	set	0x18, %i3
	nop	 ! 	ldsha	[%l7 + %i3] 0x14,	%o3 ASI use replaced by convert2hboot
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%f2
	fnot2	%f26,	%f20
	fcmps	%fcc3,	%f2,	%f28
	bcc,a,pn	%xcc,	loop_2684
	fxors	%f4,	%f8,	%f21
	fmovsgu	%icc,	%f31,	%f13
	be,pt	%icc,	loop_2685
loop_2684:
	mulx	%g4,	0x1C81,	%l6
	edge8l	%i7,	%l0,	%l4
	flush	%l7 + 0x40
loop_2685:
	nop
	set	0x28, %l6
	nop	 ! 	ldsha	[%l7 + %l6] 0x14,	%o4 ASI use replaced by convert2hboot
	bgu,pn	%xcc,	loop_2686
	xnorcc	%l5,	0x11D3,	%o0
	sethi	0x0F5B,	%i3
	andcc	%o7,	0x031E,	%o2
loop_2686:
	fmovrdne	%o5,	%f12,	%f28
	xnor	%g3,	%i2,	%g5
	movcs	%xcc,	%i6,	%i1
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	orncc	%l1,	%g2,	%g6
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	xorcc	%g7,	%i5,	%o6
	andn	%l3,	%g1,	%i4
	fmul8x16	%f26,	%f16,	%f6
	movrlz	%o1,	%l2,	%o3
	xnorcc	%g4,	%l6,	%i7
	ble	loop_2687
	subc	%i0,	%l0,	%o4
	std	%l4,	[%l7 + 0x20]
	be,a	loop_2688
loop_2687:
	orcc	%l5,	%o0,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%icc,	%f23,	%f6
loop_2688:
	movrlez	%i3,	0x3EA,	%o2
	set	0x8, %i0
	nop	 ! 	ldxa	[%g0 + %i0] 0x20,	%o5 ASI use replaced by convert2hboot
	move	%icc,	%g3,	%g5
	and	%i2,	0x061A,	%i1
	bn,pn	%xcc,	loop_2689
	sra	%i6,	0x19,	%l1
	fnor	%f4,	%f16,	%f10
	edge32n	%g2,	%g6,	%g7
loop_2689:
	fcmpne32	%f16,	%f20,	%o6
	fmovdl	%xcc,	%f16,	%f5
	lduw	[%l7 + 0x34],	%i5
	nop 	! 	tge	%xcc,	0x7 changed by convert2hboot
	wr	%g0,	0x19,	%asi
	ldsh	[%l7 + 0x46],	%i4
	set	0x28, %l1
	nop	 ! 	swapa	[%l7 + %l1] 0x80,	%l3 ASI use replaced by convert2hboot
	srax	%o1,	%l2,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tgu	%xcc,	0x7 changed by convert2hboot
	ldx	[%l7 + 0x70],	%l6
	xor	%i7,	%o3,	%l0
	fbuge	%fcc2,	loop_2690
	movrne	%i0,	%o4,	%l5
	movg	%icc,	%o0,	%l4
	sub	%i3,	0x1846,	%o7
loop_2690:
	fbl,a	%fcc0,	loop_2691
	addc	%o2,	0x147A,	%g3
	nop 	! 	te	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
loop_2691:
	fmovdle	%icc,	%f18,	%f27
	movrlz	%o5,	%i2,	%i1
	stb	%i6,	[%l7 + 0x0F]
	mulx	%g5,	%l1,	%g6
	fmovrsgez	%g2,	%f2,	%f28
	fxor	%f12,	%f26,	%f24
	bshuffle	%f14,	%f0,	%f22
	movne	%icc,	%g7,	%i5
	bl,a,pn	%icc,	loop_2692
	sra	%g1,	%i4,	%l3
	nop 	! 	taddcc	%o1,	0x1F45,	%l2 changed by convert2hboot
	sdiv	%g4,	0x169F,	%l6
loop_2692:
	movge	%xcc,	%o6,	%i7
	wr	%g0,	0x11,	%asi
	sdiv	%i0,	0x077E,	%o3
	srax	%o4,	0x17,	%l5
	fornot1s	%f2,	%f3,	%f20
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	ldsw	[%l7 + 0x14],	%o0
	movrgez	%i3,	%o7,	%l4
	nop 	! 	tvc	%xcc,	0x7 changed by convert2hboot
	umul	%o2,	0x068A,	%g3
	fblg,a	%fcc0,	loop_2693
	fmovsleu	%icc,	%f19,	%f27
	movcc	%icc,	%o5,	%i1
	bne	%icc,	loop_2694
loop_2693:
	stw	%i2,	[%l7 + 0x3C]
	andn	%i6,	%l1,	%g6
	nop 	! 	tne	%icc,	0x2 changed by convert2hboot
loop_2694:
	srlx	%g2,	0x01,	%g7
	nop 	! 	tcs	%icc,	0x4 changed by convert2hboot
	fmul8x16	%f26,	%f26,	%f20
	mulx	%i5,	%g1,	%g5
	movne	%xcc,	%l3,	%i4
	set	0x3E, %o7
	nop	 ! 	stha	%l2,	[%l7 + %o7] 0x89 ASI use replaced by convert2hboot
	wr	%g0,	0x27,	%asi
	nop 	! 	tl	%xcc,	0x7 changed by convert2hboot
	edge32ln	%o1,	%o6,	%l6
	andn	%l0,	%i7,	%o3
	sllx	%i0,	0x07,	%o4
	sra	%l5,	%i3,	%o7
	movle	%xcc,	%o0,	%o2
	orcc	%g3,	%o5,	%i1
	movg	%icc,	%i2,	%i6
	fbu	%fcc0,	loop_2695
	fcmped	%fcc3,	%f4,	%f4
	movle	%xcc,	%l1,	%l4
	orncc	%g6,	%g7,	%i5
loop_2695:
	fbule	%fcc3,	loop_2696
	bgu,a,pt	%icc,	loop_2697
	sra	%g2,	%g5,	%g1
	addc	%l3,	%l2,	%i4
loop_2696:
	fpsub32	%f4,	%f8,	%f16
loop_2697:
	fmuld8ulx16	%f0,	%f30,	%f22
	nop 	! 	tle	%icc,	0x4 changed by convert2hboot
	wr	%g0,	0x89,	%asi
	bleu,pn	%xcc,	loop_2698
	sra	%o1,	0x0B,	%o6
	nop
	set	0x40, %o3
	stx	%l6,	[%l7 + %o3]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2698:
	xorcc	%l0,	%i7,	%g4
	subc	%i0,	%o3,	%l5
	wr	%g0,	0x19,	%asi
	fble	%fcc2,	loop_2699
	fmovrsne	%o7,	%f18,	%f8
	fmovdneg	%icc,	%f23,	%f0
	and	%o0,	%o4,	%o2
loop_2699:
	movvc	%icc,	%g3,	%o5
	brnz,a	%i2,	loop_2700
	udiv	%i1,	0x1EC1,	%l1
	xor	%l4,	%i6,	%g7
	edge32l	%i5,	%g6,	%g5
loop_2700:
	be,a,pn	%icc,	loop_2701
	movrne	%g1,	%l3,	%l2
	set	0x10, %l2
	nop	 ! 	ldxa	[%g0 + %l2] 0x20,	%g2 ASI use replaced by convert2hboot
loop_2701:
	bneg,a,pn	%xcc,	loop_2702
	mova	%icc,	%i4,	%o6
	movpos	%icc,	%o1,	%l6
	set	0x2E, %g4
	nop	 ! 	lduha	[%l7 + %g4] 0x80,	%i7 ASI use replaced by convert2hboot
loop_2702:
	nop
	wr	%g0,	0x89,	%asi
	wr	%g0,	0x81,	%asi
	fmovdgu	%xcc,	%f7,	%f13
	nop 	! 	tne	%xcc,	0x3 changed by convert2hboot
	fzeros	%f1
	fmovsneg	%xcc,	%f14,	%f29
	fandnot1s	%f24,	%f14,	%f8
	fble	%fcc3,	loop_2703
	fsrc2s	%f5,	%f24
	movvc	%icc,	%o3,	%i0
	nop 	! 	tn	%icc,	0x6 changed by convert2hboot
loop_2703:
	subccc	%l5,	%o7,	%i3
	nop
	setx loop_2704, %l0, %l1
	jmpl %l1, %o0
	fcmpne32	%f18,	%f0,	%o4
	nop 	! 	tpos	%xcc,	0x3 changed by convert2hboot
	fand	%f2,	%f22,	%f2
loop_2704:
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	fmovda	%icc,	%f18,	%f29
	umulcc	%g3,	%o5,	%i2
	mulscc	%o2,	0x1D8D,	%l1
	xor	%i1,	0x1B80,	%l4
	movpos	%xcc,	%i6,	%i5
	orncc	%g6,	%g5,	%g7
	movrgez	%l3,	%g1,	%l2
	fmovd	%f2,	%f14
	movne	%icc,	%g2,	%o6
	set	0x66, %l3
	nop	 ! 	stha	%o1,	[%l7 + %l3] 0x18 ASI use replaced by convert2hboot
	wr	%g0,	0x04,	%asi
	udiv	%i7,	0x0C48,	%g4
	edge8l	%l0,	%o3,	%l6
	fmovdle	%xcc,	%f25,	%f27
	sdivcc	%l5,	0x079A,	%o7
	sra	%i0,	%i3,	%o4
	fbg	%fcc1,	loop_2705
	fxor	%f18,	%f12,	%f10
	movvs	%icc,	%o0,	%o5
	brnz,a	%g3,	loop_2706
loop_2705:
	brz	%i2,	loop_2707
	udivcc	%l1,	0x0D79,	%i1
	std	%o2,	[%l7 + 0x68]
loop_2706:
	fandnot2s	%f31,	%f14,	%f14
loop_2707:
	lduh	[%l7 + 0x50],	%l4
	membar	0x26
	bne,a,pt	%xcc,	loop_2708
	ldd	[%l7 + 0x08],	%i4
	andcc	%i6,	%g6,	%g5
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
loop_2708:
	fabss	%f10,	%f2
	umul	%g7,	%l3,	%g1
	nop 	! 	tsubcctv	%g2,	%o6,	%l2 changed by convert2hboot
	sra	%i4,	0x08,	%i7
	andn	%g4,	0x1ACC,	%o1
	mova	%icc,	%o3,	%l0
	bleu,a	%xcc,	loop_2709
	fexpand	%f6,	%f12
	sdiv	%l6,	0x0ED5,	%l5
	edge32ln	%o7,	%i0,	%i3
loop_2709:
	addccc	%o0,	0x182B,	%o4
	fcmple16	%f28,	%f4,	%g3
	fmovda	%icc,	%f5,	%f30
	set	0x10, %g7
	nop	 ! 	stda	%i2,	[%l7 + %g7] 0x10 ASI use replaced by convert2hboot
	fmul8x16au	%f31,	%f3,	%f30
	alignaddr	%o5,	%l1,	%i1
	orcc	%l4,	%o2,	%i6
	movneg	%xcc,	%i5,	%g6
	bgu,pt	%icc,	loop_2710
	bge,a,pn	%icc,	loop_2711
	fcmpgt32	%f4,	%f10,	%g7
	srlx	%g5,	0x06,	%l3
loop_2710:
	fble	%fcc1,	loop_2712
loop_2711:
	bne,a	%xcc,	loop_2713
	array8	%g1,	%g2,	%l2
	bg,pn	%xcc,	loop_2714
loop_2712:
	sth	%o6,	[%l7 + 0x70]
loop_2713:
	sth	%i4,	[%l7 + 0x7A]
	movgu	%icc,	%g4,	%i7
loop_2714:
	fbn	%fcc0,	loop_2715
	ldd	[%l7 + 0x08],	%f22
	add	%o3,	0x0F8B,	%o1
	and	%l6,	%l5,	%l0
loop_2715:
	fba,a	%fcc1,	loop_2716
	nop 	! 	taddcctv	%i0,	%o7,	%i3 changed by convert2hboot
	movl	%icc,	%o4,	%o0
	ldd	[%l7 + 0x40],	%f24
loop_2716:
	fornot1s	%f1,	%f17,	%f18
	mulscc	%i2,	%g3,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,a,pn	%icc,	loop_2717
	umul	%l1,	0x0198,	%i1
	movrne	%o2,	%i6,	%l4
	umulcc	%i5,	0x00F3,	%g6
loop_2717:
	movre	%g7,	0x0F0,	%g5
	fbo,a	%fcc0,	loop_2718
	popc	%l3,	%g1
	bneg,a	loop_2719
	fba	%fcc3,	loop_2720
loop_2718:
	edge32l	%g2,	%o6,	%i4
	fbule,a	%fcc3,	loop_2721
loop_2719:
	movcs	%xcc,	%l2,	%i7
loop_2720:
	edge8n	%o3,	%g4,	%l6
	edge8n	%o1,	%l5,	%i0
loop_2721:
	fmovdl	%xcc,	%f2,	%f8
	mulscc	%o7,	0x19C4,	%i3
	fnors	%f9,	%f10,	%f28
	nop 	! 	te	%xcc,	0x4 changed by convert2hboot
	movleu	%xcc,	%o4,	%o0
	movn	%xcc,	%l0,	%i2
	movrne	%o5,	0x1E9,	%g3
	fabsd	%f26,	%f4
	movrlz	%l1,	%i1,	%o2
	fba,a	%fcc3,	loop_2722
	nop 	! 	tgu	%xcc,	0x4 changed by convert2hboot
	brgz,a	%l4,	loop_2723
	brlz,a	%i5,	loop_2724
loop_2722:
	fmovdvs	%xcc,	%f23,	%f21
	nop 	! 	tle	%xcc,	0x3 changed by convert2hboot
loop_2723:
	movvs	%icc,	%g6,	%i6
loop_2724:
	nop 	! 	tneg	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
	bge,a,pn	%xcc,	loop_2725
	nop
	set	0x22, %g1
	stb	%g7,	[%l7 + %g1]
	subcc	%g5,	0x0A2C,	%g1
	addc	%g2,	0x0069,	%o6
loop_2725:
	fbug,a	%fcc0,	loop_2726
	fmovdcc	%xcc,	%f25,	%f5
	bl,a	loop_2727
	orcc	%i4,	0x0046,	%l3
loop_2726:
	fpackfix	%f8,	%f29
	fbu,a	%fcc2,	loop_2728
loop_2727:
	ldsw	[%l7 + 0x34],	%i7
	fmovsvc	%xcc,	%f29,	%f23
	smul	%o3,	0x052D,	%l2
loop_2728:
	fba	%fcc3,	loop_2729
	fmovsg	%icc,	%f29,	%f14
	fmovdleu	%icc,	%f3,	%f26
	brnz	%l6,	loop_2730
loop_2729:
	movneg	%xcc,	%g4,	%l5
	edge32	%o1,	%o7,	%i3
	fmovsle	%icc,	%f25,	%f10
loop_2730:
	fcmpeq32	%f30,	%f2,	%i0
	udivx	%o4,	0x08E4,	%o0
	fba	%fcc2,	loop_2731
	nop 	! 	tneg	%icc,	0x3 changed by convert2hboot
	subcc	%i2,	%l0,	%o5
	move	%icc,	%g3,	%l1
loop_2731:
	nop
	wr	%g0,	0x04,	%asi
	fba,a	%fcc1,	loop_2732
	fcmpgt16	%f8,	%f10,	%l4
	nop 	! 	tleu	%xcc,	0x5 changed by convert2hboot
	move	%icc,	%i5,	%o2
loop_2732:
	call	loop_2733
	fcmpgt16	%f14,	%f6,	%g6
	brz,a	%i6,	loop_2734
	movpos	%icc,	%g7,	%g1
loop_2733:
	fand	%f14,	%f18,	%f16
	nop 	! 	tg	%xcc,	0x3 changed by convert2hboot
loop_2734:
	fmovdle	%icc,	%f13,	%f17
	fmovsleu	%xcc,	%f30,	%f10
	fandnot2	%f20,	%f22,	%f28
	fsrc2	%f20,	%f6
	nop 	! 	tg	%xcc,	0x7 changed by convert2hboot
	membar	0x18
	faligndata	%f4,	%f26,	%f12
	movcc	%icc,	%g2,	%o6
	movleu	%icc,	%i4,	%g5
	ldstub	[%l7 + 0x27],	%i7
	array16	%o3,	%l2,	%l6
	bge	%icc,	loop_2735
	siam	0x0
	alignaddrl	%l3,	%l5,	%o1
	fpmerge	%f12,	%f21,	%f30
loop_2735:
	edge16l	%o7,	%i3,	%i0
	orcc	%o4,	%g4,	%o0
	membar	0x25
	fble,a	%fcc3,	loop_2736
	movg	%xcc,	%l0,	%i2
	bcs	loop_2737
	movg	%icc,	%o5,	%l1
loop_2736:
	movn	%xcc,	%g3,	%i1
	udiv	%i5,	0x02B8,	%l4
loop_2737:
	array8	%o2,	%g6,	%i6
	flush	%l7 + 0x18
	wr	%g0,	0x80,	%asi
	fba	%fcc2,	loop_2738
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	fba	%fcc2,	loop_2739
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
loop_2738:
	movre	%g1,	%g2,	%i4
	nop 	! 	tge	%icc,	0x2 changed by convert2hboot
loop_2739:
	movne	%xcc,	%o6,	%i7
	brlz	%g5,	loop_2740
	addccc	%o3,	0x0203,	%l2
	subc	%l3,	0x0D50,	%l5
	ld	[%l7 + 0x74],	%f7
loop_2740:
	nop
	set	0x40, %g6
	nop	 ! 	stwa	%l6,	[%l7 + %g6] 0x2f ASI use replaced by convert2hboot
	membar	#Sync
	or	%o1,	%i3,	%o7
	mova	%icc,	%o4,	%i0
	sth	%g4,	[%l7 + 0x3A]
	fmovsneg	%icc,	%f26,	%f17
	fors	%f30,	%f7,	%f31
	set	0x4F, %l5
	nop	 ! 	stba	%o0,	[%l7 + %l5] 0x80 ASI use replaced by convert2hboot
	orn	%i2,	%l0,	%o5
	mulx	%g3,	%l1,	%i5
	fblg	%fcc2,	loop_2741
	move	%icc,	%l4,	%o2
	movrgz	%g6,	0x3A0,	%i6
	bge,pn	%icc,	loop_2742
loop_2741:
	fbl	%fcc3,	loop_2743
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
	wr	%g0,	0x21,	%asi
loop_2742:
	bn,pt	%icc,	loop_2744
loop_2743:
	bl	%xcc,	loop_2745
	edge16l	%i1,	%g1,	%i4
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
loop_2744:
	nop 	! 	tneg	%xcc,	0x1 changed by convert2hboot
loop_2745:
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	srax	%o6,	%g2,	%g5
	fmovsle	%xcc,	%f3,	%f31
	fones	%f30
	nop
	setx loop_2746, %l0, %l1
	jmpl %l1, %o3
	fbo,a	%fcc3,	loop_2747
	nop 	! 	tle	%icc,	0x2 changed by convert2hboot
	bn,a,pt	%xcc,	loop_2748
loop_2746:
loop_2747:
	bvc	loop_2749
	brlz	%i7,	loop_2750
loop_2748:
	movleu	%icc,	%l3,	%l2
	ldx	[%l7 + 0x28],	%l5
loop_2749:
	movgu	%xcc,	%l6,	%i3
loop_2750:
	membar	0x37
	movre	%o1,	%o7,	%o4
	orncc	%i0,	%o0,	%g4
	orcc	%l0,	%o5,	%g3
	edge32	%l1,	%i2,	%i5
	ldsw	[%l7 + 0x48],	%l4
	bn,a,pn	%icc,	loop_2751
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
	nop 	! 	tgu	%xcc,	0x7 changed by convert2hboot
	smul	%o2,	%i6,	%g7
loop_2751:
	fsrc2	%f22,	%f0
	st	%f20,	[%l7 + 0x64]
	set	0x24, %l4
	nop	 ! 	swapa	[%l7 + %l4] 0x88,	%i1 ASI use replaced by convert2hboot
	fpackfix	%f24,	%f20
	movre	%g1,	%g6,	%o6
	nop 	! 	sir	0x13CF changed by convert2hboot
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	fmovspos	%xcc,	%f10,	%f4
	andncc	%g2,	%i4,	%o3
	orn	%g5,	0x0965,	%l3
	flush	%l7 + 0x44
	nop 	! 	tvs	%icc,	0x6 changed by convert2hboot
	movne	%icc,	%i7,	%l2
	edge8	%l6,	%l5,	%i3
	fmovsl	%icc,	%f4,	%f25
	wr	%g0,	0x18,	%asi
	nop 	! 	taddcc	%o4,	0x10CA,	%o1 changed by convert2hboot
	fcmpgt32	%f4,	%f10,	%o0
	call	loop_2752
	alignaddrl	%i0,	%l0,	%o5
	movleu	%icc,	%g3,	%g4
	fmovrsne	%l1,	%f26,	%f24
loop_2752:
	lduh	[%l7 + 0x12],	%i5
	ble,a	loop_2753
	or	%l4,	0x19E8,	%i2
	fblg,a	%fcc3,	loop_2754
	movg	%icc,	%o2,	%g7
loop_2753:
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	sethi	0x1567,	%i6
loop_2754:
	movrne	%g1,	%g6,	%i1
	addcc	%g2,	%o6,	%o3
	udivx	%g5,	0x1CD6,	%i4
	movrne	%l3,	%i7,	%l6
	fmovdn	%xcc,	%f3,	%f28
	fcmple32	%f24,	%f18,	%l2
	movgu	%xcc,	%l5,	%i3
	edge8ln	%o7,	%o1,	%o0
	set	0x66, %g5
	nop	 ! 	ldstuba	[%l7 + %g5] 0x88,	%o4 ASI use replaced by convert2hboot
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	sethi	0x0099,	%i0
	subcc	%l0,	0x1933,	%g3
	subcc	%o5,	0x0A2C,	%g4
	nop 	! 	tvs	%icc,	0x4 changed by convert2hboot
	wr	%g0,	0xea,	%asi
	membar	#Sync
	fmovdleu	%xcc,	%f0,	%f5
	array8	%i5,	%i2,	%l4
	fpsub32	%f0,	%f22,	%f8
	edge32n	%g7,	%o2,	%g1
	fbue	%fcc2,	loop_2755
	edge32	%g6,	%i1,	%g2
	set	0x78, %o0
	nop	 ! 	prefetcha	[%l7 + %o0] 0x04,	 0x2 ASI use replaced by convert2hboot
loop_2755:
	edge32n	%o3,	%o6,	%g5
	nop 	! 	tvc	%icc,	0x1 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x34],	%l3
	fbge	%fcc0,	loop_2756
	movcs	%xcc,	%i7,	%l6
	edge16n	%l2,	%l5,	%i3
	sethi	0x004A,	%o7
loop_2756:
	edge16	%i4,	%o0,	%o1
	movgu	%xcc,	%i0,	%l0
	set	0x6A, %i6
	nop	 ! 	stba	%g3,	[%l7 + %i6] 0x10 ASI use replaced by convert2hboot
	movpos	%xcc,	%o4,	%o5
	xorcc	%g4,	%i5,	%i2
	xor	%l1,	0x0142,	%l4
	edge32ln	%o2,	%g1,	%g6
	fands	%f7,	%f24,	%f25
	sdivx	%g7,	0x10E0,	%i1
	fsrc2s	%f1,	%f10
	sdivcc	%g2,	0x19C6,	%i6
	movvs	%icc,	%o3,	%o6
	set	0x40, %g3
	nop	 ! 	stda	%f16,	[%l7 + %g3] 0x80 ASI use replaced by convert2hboot
	fornot1s	%f12,	%f20,	%f3
	sdivx	%g5,	0x0020,	%i7
	wr	%g0,	0x80,	%asi
	movleu	%xcc,	%l6,	%l2
	fexpand	%f23,	%f16
	bcs,a	%xcc,	loop_2757
	fnot1	%f16,	%f28
	movne	%xcc,	%l5,	%i3
	nop 	! 	tl	%xcc,	0x7 changed by convert2hboot
loop_2757:
	ldd	[%l7 + 0x18],	%f10
	be,pt	%xcc,	loop_2758
	fones	%f4
	movn	%xcc,	%o7,	%o0
	popc	0x09AA,	%i4
loop_2758:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,a,pn	%xcc,	loop_2759
	nop 	! 	tleu	%xcc,	0x7 changed by convert2hboot
	fnor	%f28,	%f8,	%f20
	wr	%g0,	0xe3,	%asi
	membar	#Sync
loop_2759:
	edge16	%l0,	%i0,	%g3
	bl,a,pt	%xcc,	loop_2760
	xorcc	%o4,	%g4,	%i5
	fmovrdne	%o5,	%f22,	%f6
	fmuld8ulx16	%f24,	%f4,	%f8
loop_2760:
	bpos,pt	%xcc,	loop_2761
	sra	%i2,	%l1,	%o2
	wr	%g0,	0x18,	%asi
loop_2761:
	srl	%g6,	0x12,	%g7
	ldub	[%l7 + 0x3B],	%i1
	edge16ln	%l4,	%g2,	%o3
	andcc	%o6,	0x0E2D,	%g5
	movrgez	%i7,	%i6,	%l6
	nop 	! 	sir	0x15F7 changed by convert2hboot
	fxnor	%f16,	%f4,	%f22
	array8	%l2,	%l3,	%i3
	fbn	%fcc0,	loop_2762
	fandnot1	%f12,	%f18,	%f16
	addc	%l5,	%o7,	%i4
	andn	%o1,	%o0,	%l0
loop_2762:
	fmovdle	%xcc,	%f6,	%f15
	ldd	[%l7 + 0x20],	%i0
	nop 	! 	sir	0x1FCA changed by convert2hboot
	srl	%g3,	0x1A,	%o4
	movcs	%icc,	%i5,	%g4
	xnorcc	%o5,	%l1,	%i2
	sdivx	%o2,	0x1573,	%g1
	fpsub32	%f28,	%f28,	%f22
	move	%icc,	%g6,	%g7
	nop 	! 	tle	%icc,	0x4 changed by convert2hboot
	fmul8x16au	%f18,	%f19,	%f8
	nop 	! 	tl	%icc,	0x0 changed by convert2hboot
	movn	%xcc,	%l4,	%g2
	fmul8ulx16	%f2,	%f22,	%f12
	movre	%o3,	0x3EA,	%o6
	bshuffle	%f20,	%f18,	%f6
	nop 	! 	te	%icc,	0x4 changed by convert2hboot
	array32	%i1,	%i7,	%g5
	ldsb	[%l7 + 0x5F],	%l6
	mulscc	%l2,	%i6,	%l3
	sll	%i3,	0x01,	%l5
	movrgz	%o7,	%i4,	%o0
	add	%o1,	0x092F,	%l0
	wr	%g0,	0x11,	%asi
	nop 	! 	tvs	%icc,	0x3 changed by convert2hboot
	umulcc	%g3,	%i0,	%o4
	xnor	%i5,	%o5,	%l1
	nop 	! 	te	%icc,	0x7 changed by convert2hboot
	brnz,a	%i2,	loop_2763
	fbe,a	%fcc1,	loop_2764
	movn	%icc,	%g4,	%g1
	fmovdcc	%xcc,	%f31,	%f31
loop_2763:
	fmovsa	%xcc,	%f10,	%f31
loop_2764:
	nop
	wr	%g0,	0x19,	%asi
	nop 	! 	sir	0x0FA0 changed by convert2hboot
	srl	%g7,	%l4,	%g2
	or	%o2,	0x14B7,	%o6
	sethi	0x01BA,	%i1
	for	%f2,	%f12,	%f0
	fpack32	%f14,	%f0,	%f26
	fbug,a	%fcc0,	loop_2765
	movvs	%icc,	%o3,	%i7
	pdist	%f12,	%f28,	%f14
	sra	%g5,	0x03,	%l2
loop_2765:
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
	movvc	%xcc,	%l6,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l3,	%i3,	%l5
	set	0x2B, %g2
	nop	 ! 	ldstuba	[%l7 + %g2] 0x89,	%o7 ASI use replaced by convert2hboot
	addcc	%o0,	%i4,	%l0
	orncc	%g3,	0x00C7,	%o1
	smulcc	%i0,	%i5,	%o4
	nop 	! 	ta	%xcc,	0x2 changed by convert2hboot
	fbn,a	%fcc2,	loop_2766
	fblg	%fcc1,	loop_2767
	edge8ln	%l1,	%o5,	%i2
	brlez,a	%g1,	loop_2768
loop_2766:
	nop 	! 	tle	%icc,	0x4 changed by convert2hboot
loop_2767:
	edge16	%g6,	%g7,	%g4
	edge16	%g2,	%o2,	%o6
loop_2768:
	nop
	set	0x40, %i4
	nop	 ! 	ldda	[%l7 + %i4] 0x18,	%f16 ASI use replaced by convert2hboot
	sll	%l4,	%i1,	%o3
	fpsub32s	%f11,	%f23,	%f30
	xnorcc	%i7,	0x01C5,	%g5
	movrgz	%l6,	0x39F,	%i6
	movre	%l2,	%i3,	%l3
	movl	%icc,	%l5,	%o0
	fnegs	%f30,	%f6
	movvs	%xcc,	%o7,	%l0
	smulcc	%g3,	%i4,	%i0
	fbul	%fcc1,	loop_2769
	brgez	%i5,	loop_2770
	edge8	%o1,	%l1,	%o5
	umulcc	%o4,	0x104C,	%g1
loop_2769:
	udivx	%i2,	0x0FE7,	%g7
loop_2770:
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	bcs	loop_2771
	lduw	[%l7 + 0x70],	%g6
	smul	%g4,	0x12E4,	%g2
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
loop_2771:
	xorcc	%o6,	%i1,	%i7
	fxnor	%f18,	%f14,	%f14
	bg,a	%xcc,	loop_2772
	sub	%o3,	%g5,	%i6
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	fcmpes	%fcc1,	%f31,	%f20
loop_2772:
	edge32l	%l6,	%l2,	%l3
	nop 	! 	tleu	%icc,	0x3 changed by convert2hboot
	ldx	[%l7 + 0x50],	%l5
	bcs,a,pt	%xcc,	loop_2773
	fbne	%fcc1,	loop_2774
	brlz,a	%o0,	loop_2775
	addcc	%o7,	0x021A,	%l0
loop_2773:
	sdivcc	%i3,	0x16DC,	%i4
loop_2774:
	fmovsleu	%xcc,	%f7,	%f11
loop_2775:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	array16	%i5,	%o1,	%l1
	smul	%o5,	0x1E03,	%o4
	fmovda	%icc,	%f19,	%f3
	movgu	%icc,	%i2,	%g1
	sra	%g7,	%g4,	%g6
	fones	%f6
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
	nop
	set	0x32, %o5
	ldstub	[%l7 + %o5],	%o2
	fbue,a	%fcc0,	loop_2776
	edge8	%g2,	%l4,	%o6
	fbule	%fcc3,	loop_2777
	nop 	! 	tpos	%icc,	0x0 changed by convert2hboot
loop_2776:
	array8	%i1,	%i7,	%o3
	fpsub16	%f12,	%f28,	%f8
loop_2777:
	ldstub	[%l7 + 0x47],	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc3,	loop_2778
	lduw	[%l7 + 0x0C],	%i6
	fmovdn	%icc,	%f0,	%f23
	fnot2s	%f16,	%f13
loop_2778:
	movgu	%xcc,	%l6,	%l3
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	ble,a	loop_2779
	fmovdneg	%xcc,	%f10,	%f19
	fcmpne32	%f6,	%f26,	%l2
	xor	%o0,	%o7,	%l0
loop_2779:
	sll	%i3,	%i4,	%l5
	mova	%xcc,	%i0,	%g3
	nop 	! 	taddcctv	%o1,	%l1,	%o5 changed by convert2hboot
	move	%xcc,	%o4,	%i5
	fmovsge	%icc,	%f24,	%f13
	call	loop_2780
	fble	%fcc2,	loop_2781
	sub	%i2,	%g7,	%g1
	fabss	%f9,	%f14
loop_2780:
	fcmpd	%fcc3,	%f0,	%f24
loop_2781:
	fmovdcc	%xcc,	%f29,	%f13
	nop 	! 	taddcc	%g4,	%g6,	%g2 changed by convert2hboot
	nop 	! 	tn	%xcc,	0x2 changed by convert2hboot
	fmovdvc	%icc,	%f1,	%f30
	wr	%g0,	0x19,	%asi
	sll	%l4,	0x11,	%i1
	sra	%o6,	0x14,	%i7
	edge8n	%g5,	%o3,	%i6
	edge16	%l3,	%l2,	%o0
	nop 	! 	tvs	%icc,	0x5 changed by convert2hboot
	movne	%xcc,	%o7,	%l6
	fnors	%f17,	%f7,	%f11
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
	fpadd32s	%f25,	%f22,	%f5
	mulx	%l0,	%i4,	%i3
	edge8	%i0,	%l5,	%g3
	umul	%l1,	0x000B,	%o5
	brlez,a	%o4,	loop_2782
	edge32	%o1,	%i5,	%i2
	lduh	[%l7 + 0x1A],	%g1
	addcc	%g7,	%g4,	%g6
loop_2782:
	srax	%o2,	%l4,	%i1
	fmovrdne	%o6,	%f18,	%f20
	bvs,a	loop_2783
	andncc	%i7,	%g5,	%g2
	bvs,a,pt	%icc,	loop_2784
	orn	%i6,	%l3,	%l2
loop_2783:
	bleu,a,pt	%icc,	loop_2785
	fcmpeq32	%f18,	%f6,	%o0
loop_2784:
	movvs	%icc,	%o3,	%l6
	call	loop_2786
loop_2785:
	bleu,a	loop_2787
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
loop_2786:
	subccc	%l0,	%i4,	%o7
loop_2787:
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
	fones	%f16
	ldd	[%l7 + 0x28],	%f22
	nop
	set	0x78, %o4
	stx	%i0,	[%l7 + %o4]
	xnorcc	%i3,	0x0511,	%l5
	fmovdpos	%icc,	%f30,	%f13
	lduh	[%l7 + 0x54],	%g3
	fpsub16	%f10,	%f28,	%f2
	srl	%l1,	%o4,	%o5
	membar	0x54
	bgu	%icc,	loop_2788
	alignaddr	%o1,	%i2,	%i5
	mulscc	%g1,	%g7,	%g6
	nop 	! 	tsubcc	%g4,	0x1F95,	%l4 changed by convert2hboot
loop_2788:
	fornot2	%f24,	%f4,	%f6
	ldstub	[%l7 + 0x34],	%o2
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	array8	%i1,	%i7,	%o6
	fbuge	%fcc2,	loop_2789
	addccc	%g5,	%g2,	%i6
	fbul,a	%fcc3,	loop_2790
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
loop_2789:
	subc	%l3,	%o0,	%o3
	edge8l	%l6,	%l0,	%l2
loop_2790:
	nop 	! 	tvc	%icc,	0x7 changed by convert2hboot
	fsrc2s	%f3,	%f6
	pdist	%f14,	%f2,	%f18
	andncc	%i4,	%i0,	%i3
	fandnot1	%f18,	%f18,	%f4
	set	0x2E, %i1
	nop	 ! 	lduha	[%l7 + %i1] 0x88,	%l5 ASI use replaced by convert2hboot
	bge,a,pt	%xcc,	loop_2791
	bne,a,pt	%xcc,	loop_2792
	subc	%o7,	0x03E1,	%g3
	movn	%icc,	%o4,	%l1
loop_2791:
	membar	0x03
loop_2792:
	fxor	%f30,	%f24,	%f0
	nop 	! 	tcs	%xcc,	0x4 changed by convert2hboot
	nop 	! 	taddcc	%o1,	%o5,	%i2 changed by convert2hboot
	movcs	%xcc,	%i5,	%g7
	orn	%g1,	0x0559,	%g6
	popc	%l4,	%o2
	be,pn	%xcc,	loop_2793
	fmovdvs	%xcc,	%f25,	%f7
	nop 	! 	sir	0x04C1 changed by convert2hboot
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
loop_2793:
	sub	%g4,	0x0D9D,	%o6
	nop 	! 	tn	%icc,	0x7 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x3 changed by convert2hboot
	fcmpeq16	%f6,	%f8,	%g5
	wr	%g0,	0x18,	%asi
	fandnot2	%f0,	%f18,	%f30
	fmovd	%f30,	%f14
	fmovspos	%xcc,	%f3,	%f24
	wr	%g0,	0x17,	%asi
	membar	#Sync
	wr	%g0,	0x5f,	%asi
	fblg,a	%fcc2,	loop_2794
	andcc	%o0,	0x1272,	%o3
	edge16l	%l6,	%l0,	%g2
	fmuld8ulx16	%f11,	%f18,	%f26
loop_2794:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	nop	 ! 	casxa	[%l6] 0x89,	%i4,	%l2 ASI use replaced by convert2hboot
	fbug,a	%fcc0,	loop_2795
	fnors	%f23,	%f12,	%f26
	sethi	0x14C2,	%i0
	ldd	[%l7 + 0x30],	%f30
loop_2795:
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	fmovrdlez	%i3,	%f0,	%f8
	movrne	%o7,	%l5,	%g3
	movvs	%xcc,	%l1,	%o1
	set	0x8, %i7
	nop	 ! 	stxa	%o4,	[%g0 + %i7] 0x21 ASI use replaced by convert2hboot
	movneg	%icc,	%o5,	%i5
	movrlz	%i2,	0x198,	%g1
	sethi	0x0362,	%g7
	nop 	! 	taddcc	%g6,	%l4,	%o2 changed by convert2hboot
	fpackfix	%f2,	%f31
	nop 	! 	tsubcctv	%i7,	%g4,	%o6 changed by convert2hboot
	bn,a	loop_2796
	fmovscs	%xcc,	%f6,	%f31
	fmuld8sux16	%f7,	%f22,	%f12
	bcs,a,pt	%icc,	loop_2797
loop_2796:
	edge32n	%i1,	%g5,	%i6
	membar	0x54
	edge8n	%o0,	%l3,	%l6
loop_2797:
	movle	%icc,	%l0,	%g2
	udiv	%o3,	0x1A50,	%i4
	bcc,a,pn	%icc,	loop_2798
	nop 	! 	taddcctv	%l2,	%i3,	%i0 changed by convert2hboot
	fornot2	%f6,	%f30,	%f30
	udivx	%o7,	0x0E39,	%l5
loop_2798:
	nop
	set	0x40, %o2
	lda	[%l7 + %o2] 0x15,	%f24
	lduh	[%l7 + 0x6C],	%g3
	nop 	! 	tvc	%icc,	0x3 changed by convert2hboot
	alignaddr	%o1,	%l1,	%o5
	mulscc	%o4,	0x0E20,	%i2
	set	0x3C, %o6
	nop	 ! 	ldswa	[%l7 + %o6] 0x15,	%i5 ASI use replaced by convert2hboot
	ldsw	[%l7 + 0x24],	%g7
	edge16ln	%g1,	%g6,	%l4
	srl	%o2,	%g4,	%o6
	bvs,pt	%xcc,	loop_2799
	fbug,a	%fcc1,	loop_2800
	nop
	set	0x70, %o1
	lduw	[%l7 + %o1],	%i1
	edge8ln	%g5,	%i7,	%o0
loop_2799:
	ldsw	[%l7 + 0x34],	%l3
loop_2800:
	udivcc	%l6,	0x184D,	%l0
	wr	%g0,	0x11,	%asi
	andncc	%g2,	%o3,	%i4
	edge16ln	%i3,	%i0,	%o7
	alignaddr	%l5,	%l2,	%o1
	fmul8x16au	%f5,	%f13,	%f18
	fbne,a	%fcc0,	loop_2801
	fmovsg	%xcc,	%f3,	%f9
	subcc	%g3,	%o5,	%o4
	fmovsne	%xcc,	%f11,	%f25
loop_2801:
	nop
	set	0x10, %i5
	nop	 ! 	stha	%l1,	[%l7 + %i5] 0x2f ASI use replaced by convert2hboot
	membar	#Sync
	xor	%i2,	%i5,	%g7
	array32	%g1,	%l4,	%g6
	nop 	! 	tg	%icc,	0x3 changed by convert2hboot
	membar	0x0C
	smulcc	%g4,	0x0900,	%o2
	edge16n	%o6,	%i1,	%g5
	fmovrdne	%i7,	%f6,	%f12
	movre	%l3,	%o0,	%l6
	andncc	%i6,	%l0,	%o3
	fzeros	%f24
	set	0x6C, %i3
	nop	 ! 	swapa	[%l7 + %i3] 0x11,	%g2 ASI use replaced by convert2hboot
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	fbule	%fcc3,	loop_2802
	fcmpd	%fcc3,	%f30,	%f30
	xnorcc	%i3,	%i0,	%o7
	andncc	%i4,	%l5,	%o1
loop_2802:
	bvc,a,pt	%icc,	loop_2803
	sllx	%g3,	0x0F,	%l2
	xnor	%o4,	%o5,	%l1
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
loop_2803:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,a,pt	%xcc,	loop_2804
	movrne	%i2,	%g7,	%i5
	array8	%g1,	%g6,	%g4
	edge32n	%l4,	%o2,	%o6
loop_2804:
	sra	%i1,	0x0F,	%g5
	bpos,pn	%icc,	loop_2805
	add	%i7,	%o0,	%l6
	ba,pt	%xcc,	loop_2806
	fblg,a	%fcc1,	loop_2807
loop_2805:
	fxnors	%f20,	%f29,	%f29
	smul	%l3,	%i6,	%l0
loop_2806:
	xorcc	%o3,	%g2,	%i0
loop_2807:
	edge16l	%i3,	%o7,	%l5
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	fcmpeq16	%f6,	%f14,	%o1
	movrgz	%g3,	%l2,	%i4
	fcmpne32	%f22,	%f22,	%o4
	alignaddr	%l1,	%o5,	%i2
	orcc	%g7,	%g1,	%i5
	fpack16	%f2,	%f24
	movleu	%icc,	%g6,	%g4
	array16	%o2,	%l4,	%o6
	smulcc	%i1,	0x1F1B,	%i7
	fbule	%fcc2,	loop_2808
	edge16l	%o0,	%g5,	%l6
	bvc,pn	%xcc,	loop_2809
	movn	%icc,	%i6,	%l3
loop_2808:
	subc	%o3,	0x004A,	%g2
	mova	%xcc,	%i0,	%i3
loop_2809:
	movrgez	%o7,	%l0,	%l5
	fmovscs	%icc,	%f8,	%f26
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
	srl	%o1,	0x1B,	%l2
	nop
	set	0x34, %l0
	ldstub	[%l7 + %l0],	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz	%o4,	loop_2810
	srax	%l1,	%i4,	%o5
	brgez	%g7,	loop_2811
	orn	%g1,	0x08BA,	%i2
loop_2810:
	bcs,pt	%icc,	loop_2812
	fmul8x16	%f30,	%f10,	%f24
loop_2811:
	sdiv	%i5,	0x0225,	%g4
	nop 	! 	tsubcc	%o2,	0x1EB2,	%l4 changed by convert2hboot
loop_2812:
	bl	loop_2813
	fmovdvs	%icc,	%f1,	%f13
	udiv	%g6,	0x107C,	%o6
	ldsw	[%l7 + 0x54],	%i1
loop_2813:
	fexpand	%f31,	%f28
	udivx	%i7,	0x1AEA,	%o0
	fnand	%f24,	%f0,	%f20
	movpos	%icc,	%l6,	%i6
	orn	%l3,	%g5,	%g2
	fbule,a	%fcc3,	loop_2814
	movneg	%xcc,	%i0,	%i3
	udivcc	%o3,	0x16D0,	%l0
	movne	%icc,	%l5,	%o1
loop_2814:
	fpadd32s	%f18,	%f10,	%f8
	fnot1	%f26,	%f22
	fbl,a	%fcc3,	loop_2815
	edge16	%o7,	%g3,	%l2
	fmovrdlez	%l1,	%f16,	%f6
	movrgz	%o4,	%i4,	%o5
loop_2815:
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	movgu	%xcc,	%g7,	%i2
	xor	%g1,	0x08A9,	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	nop	 ! 	casxa	[%l6] 0x10,	%i5,	%o2 ASI use replaced by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_2816,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	call	loop_2817
	edge8	%g6,	%l4,	%i1
	wr	%g0,	0x81,	%asi
loop_2816:
	edge8	%o6,	%l6,	%o0
loop_2817:
	nop
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	ble,a	%icc,	loop_2818
	ldx	[%l7 + 0x38],	%g2
	fnands	%f25,	%f23,	%f24
	edge8l	%i6,	%i3,	%o3
loop_2818:
	fmovdcc	%icc,	%f23,	%f10
	subccc	%l0,	0x1235,	%l5
	nop
	set	0x4C, %i2
	stw	%i0,	[%l7 + %i2]
	movvs	%xcc,	%o7,	%g3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	nop	 ! 	casxa	[%l6] 0x04,	%l2,	%l1 ASI use replaced by convert2hboot
	edge8l	%o1,	%i4,	%o4
	movcc	%xcc,	%g7,	%o5
	movrne	%g1,	0x3FE,	%g4
	set	0x5C, %l6
	nop	 ! 	ldsha	[%l7 + %l6] 0x19,	%i5 ASI use replaced by convert2hboot
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	fandnot2s	%f0,	%f18,	%f11
	nop 	! 	tcc	%icc,	0x6 changed by convert2hboot
	smulcc	%i2,	%g6,	%l4
	ldstub	[%l7 + 0x2D],	%i1
	swap	[%l7 + 0x10],	%i7
	edge8l	%o2,	%l6,	%o6
	movl	%icc,	%o0,	%g5
	fba	%fcc3,	loop_2819
	sethi	0x0158,	%g2
	sra	%i6,	0x19,	%i3
	sdivcc	%l3,	0x04AE,	%l0
loop_2819:
	bvc	loop_2820
	srl	%o3,	0x0D,	%l5
	nop 	! 	tsubcc	%o7,	%i0,	%l2 changed by convert2hboot
	set	0x6C, %i0
	nop	 ! 	stwa	%l1,	[%l7 + %i0] 0xea ASI use replaced by convert2hboot
	membar	#Sync
loop_2820:
	nop
	wr	%g0,	0x04,	%asi
	addccc	%i4,	%g3,	%o4
	fmul8x16au	%f9,	%f13,	%f28
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
	xor	%g7,	0x09D2,	%o5
	fbug	%fcc0,	loop_2821
	bgu	%xcc,	loop_2822
	sra	%g4,	%i5,	%i2
	udivcc	%g1,	0x08B4,	%g6
loop_2821:
	bneg,a,pt	%xcc,	loop_2823
loop_2822:
	bpos,a,pt	%icc,	loop_2824
	srlx	%i1,	0x14,	%i7
	edge32l	%o2,	%l6,	%o6
loop_2823:
	nop 	! 	tvs	%icc,	0x0 changed by convert2hboot
loop_2824:
	bneg	loop_2825
	nop 	! 	tne	%xcc,	0x3 changed by convert2hboot
	nop 	! 	taddcctv	%l4,	%o0,	%g2 changed by convert2hboot
	wr	%g0,	0x23,	%asi
	membar	#Sync
loop_2825:
	popc	%i3,	%l3
	sdivx	%l0,	0x1F09,	%o3
	addccc	%g5,	0x134A,	%o7
	ldsh	[%l7 + 0x64],	%i0
	mulx	%l2,	%l1,	%l5
	edge16	%o1,	%i4,	%g3
	fandnot2	%f30,	%f18,	%f6
	alignaddrl	%o4,	%g7,	%o5
	wr	%g0,	0x5f,	%asi
	movne	%xcc,	%g4,	%g1
	fxnor	%f24,	%f4,	%f20
	umul	%i2,	%i1,	%g6
	edge32n	%i7,	%l6,	%o6
	fpadd32	%f20,	%f24,	%f22
	nop 	! 	tvc	%icc,	0x6 changed by convert2hboot
	fmovrde	%o2,	%f24,	%f8
	fpsub32	%f2,	%f12,	%f30
	set	0x3B, %o7
	nop	 ! 	ldstuba	[%l7 + %o7] 0x04,	%l4 ASI use replaced by convert2hboot
	fmovs	%f4,	%f24
	bn,a,pn	%icc,	loop_2826
	ba,a	loop_2827
	fnot2	%f0,	%f20
	fmovrsgz	%o0,	%f8,	%f14
loop_2826:
	subccc	%g2,	0x0E0C,	%i6
loop_2827:
	edge16	%i3,	%l0,	%l3
	set	0x0C, %o3
	nop	 ! 	ldswa	[%l7 + %o3] 0x18,	%g5 ASI use replaced by convert2hboot
	movvc	%icc,	%o7,	%o3
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
	edge16n	%l2,	%i0,	%l5
	ba,pn	%icc,	loop_2828
	array16	%l1,	%i4,	%o1
	udiv	%o4,	0x1C59,	%g3
	fcmpeq32	%f4,	%f0,	%o5
loop_2828:
	fmul8sux16	%f22,	%f0,	%f28
	subccc	%i5,	%g4,	%g1
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
	fbg,a	%fcc0,	loop_2829
	fcmpes	%fcc0,	%f29,	%f14
	wr	%g0,	0x27,	%asi
	membar	#Sync
loop_2829:
	fnot2	%f20,	%f8
	movvs	%xcc,	%i2,	%g6
	stw	%i1,	[%l7 + 0x24]
	nop 	! 	tleu	%icc,	0x3 changed by convert2hboot
	ldd	[%l7 + 0x30],	%i6
	fbue,a	%fcc0,	loop_2830
	faligndata	%f16,	%f6,	%f10
	set	0x58, %l2
	nop	 ! 	ldxa	[%l7 + %l2] 0x11,	%o6 ASI use replaced by convert2hboot
loop_2830:
	fmovrsgz	%o2,	%f23,	%f28
	sll	%i7,	%l4,	%g2
	nop 	! 	tleu	%icc,	0x1 changed by convert2hboot
	andcc	%o0,	%i6,	%l0
	flush	%l7 + 0x40
	addc	%i3,	0x0423,	%g5
	bvc	loop_2831
	bg,a,pt	%xcc,	loop_2832
	bcc,a	loop_2833
	mova	%icc,	%l3,	%o7
loop_2831:
	sll	%l2,	0x10,	%i0
loop_2832:
	fmovrdlz	%o3,	%f30,	%f14
loop_2833:
	sra	%l5,	%i4,	%l1
	bcs,a	loop_2834
	srax	%o4,	%o1,	%o5
	fmul8x16	%f2,	%f18,	%f12
	nop
	setx loop_2835, %l0, %l1
	jmpl %l1, %g3
loop_2834:
	nop
	set	0x79, %l1
	ldsb	[%l7 + %l1],	%i5
	set	0x50, %g4
	nop	 ! 	stxa	%g1,	[%l7 + %g4] 0x81 ASI use replaced by convert2hboot
loop_2835:
	orncc	%g4,	%g7,	%i2
	mulx	%i1,	%l6,	%o6
	movle	%icc,	%g6,	%o2
	ldstub	[%l7 + 0x64],	%l4
	sethi	0x1189,	%i7
	membar	0x29
	nop 	! 	tsubcctv	%o0,	0x00AB,	%g2 changed by convert2hboot
	fmul8x16al	%f12,	%f23,	%f6
	fmovsge	%xcc,	%f10,	%f2
	nop 	! 	tge	%xcc,	0x3 changed by convert2hboot
	fpsub32s	%f28,	%f20,	%f25
	fmovrdlez	%i6,	%f2,	%f6
	nop 	! 	tleu	%xcc,	0x3 changed by convert2hboot
	array32	%l0,	%i3,	%l3
	movge	%xcc,	%g5,	%l2
	fbge	%fcc0,	loop_2836
	bneg,a	loop_2837
	orncc	%i0,	%o7,	%o3
	set	0x64, %g7
	nop	 ! 	stwa	%i4,	[%l7 + %g7] 0x0c ASI use replaced by convert2hboot
loop_2836:
	fbul	%fcc3,	loop_2838
loop_2837:
	fblg	%fcc0,	loop_2839
	xnor	%l1,	0x16A0,	%o4
	nop
	setx	loop_2840,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_2838:
	udivcc	%l5,	0x16C9,	%o5
loop_2839:
	movn	%icc,	%o1,	%i5
	alignaddrl	%g1,	%g4,	%g7
loop_2840:
	xnor	%i2,	%i1,	%g3
	flush	%l7 + 0x2C
	set	0x68, %g1
	nop	 ! 	stwa	%l6,	[%l7 + %g1] 0x0c ASI use replaced by convert2hboot
	ldub	[%l7 + 0x7F],	%o6
	movleu	%icc,	%g6,	%o2
	fbule	%fcc0,	loop_2841
	smul	%l4,	0x1EAE,	%o0
	sth	%i7,	[%l7 + 0x46]
	fmovse	%xcc,	%f19,	%f24
loop_2841:
	srlx	%i6,	0x00,	%l0
	set	0x50, %g6
	nop	 ! 	lduwa	[%l7 + %g6] 0x11,	%i3 ASI use replaced by convert2hboot
	mulscc	%l3,	0x140D,	%g2
	fmul8sux16	%f16,	%f2,	%f22
	edge16n	%l2,	%g5,	%o7
	movne	%icc,	%i0,	%i4
	andn	%o3,	%l1,	%o4
	nop 	! 	tneg	%xcc,	0x0 changed by convert2hboot
	umul	%o5,	0x127A,	%o1
	nop
	setx	loop_2842,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fbul	%fcc3,	loop_2843
	fbue,a	%fcc0,	loop_2844
	ldub	[%l7 + 0x24],	%l5
loop_2842:
	fornot2s	%f2,	%f19,	%f8
loop_2843:
	nop
	set	0x28, %l3
	nop	 ! 	ldxa	[%l7 + %l3] 0x19,	%g1 ASI use replaced by convert2hboot
loop_2844:
	addccc	%i5,	0x1B43,	%g7
	fbn	%fcc2,	loop_2845
	nop 	! 	sir	0x09B7 changed by convert2hboot
	fble,a	%fcc3,	loop_2846
	andn	%g4,	%i2,	%i1
loop_2845:
	fpadd32	%f20,	%f2,	%f22
	std	%f12,	[%l7 + 0x70]
loop_2846:
	nop
	setx	loop_2847,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	addccc	%l6,	0x1D23,	%o6
	fbl	%fcc3,	loop_2848
	movvc	%icc,	%g6,	%o2
loop_2847:
	nop 	! 	tne	%xcc,	0x1 changed by convert2hboot
	wr	%g0,	0x18,	%asi
loop_2848:
	fmovdg	%xcc,	%f10,	%f14
	and	%g3,	0x0947,	%o0
	set	0x68, %l5
	sta	%f13,	[%l7 + %l5] 0x15
	ba,a,pn	%icc,	loop_2849
	fmovsne	%xcc,	%f21,	%f9
	edge8l	%i6,	%l0,	%i7
	movrgez	%l3,	0x2AC,	%g2
loop_2849:
	addcc	%l2,	%i3,	%o7
	movpos	%xcc,	%g5,	%i4
	alignaddrl	%o3,	%i0,	%o4
	fpack32	%f20,	%f10,	%f16
	movrne	%o5,	0x187,	%o1
	movleu	%xcc,	%l1,	%l5
	st	%f4,	[%l7 + 0x68]
	fcmpgt32	%f14,	%f4,	%g1
	nop
	setx	loop_2850,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	movleu	%xcc,	%i5,	%g7
	brnz,a	%i2,	loop_2851
	brnz,a	%g4,	loop_2852
loop_2850:
	bleu,a,pt	%xcc,	loop_2853
	sllx	%i1,	%o6,	%l6
loop_2851:
	movcs	%xcc,	%g6,	%l4
loop_2852:
	fmovd	%f10,	%f14
loop_2853:
	addccc	%g3,	%o0,	%i6
	nop 	! 	taddcc	%o2,	%l0,	%l3 changed by convert2hboot
	srax	%i7,	0x1F,	%g2
	array32	%l2,	%o7,	%g5
	bleu,a,pt	%xcc,	loop_2854
	ldub	[%l7 + 0x30],	%i4
	sdivx	%o3,	0x1FC5,	%i0
	edge32l	%i3,	%o5,	%o4
loop_2854:
	fandnot2s	%f19,	%f3,	%f3
	fornot2	%f24,	%f24,	%f8
	fmovdpos	%xcc,	%f11,	%f15
	mova	%icc,	%l1,	%o1
	fzeros	%f2
	sdiv	%g1,	0x17DC,	%i5
	fsrc1s	%f1,	%f22
	movrgz	%l5,	0x1DA,	%i2
	smul	%g7,	%i1,	%o6
	movn	%xcc,	%g4,	%g6
	popc	%l4,	%l6
	wr	%g0,	0x2f,	%asi
	membar	#Sync
	bcs,pn	%icc,	loop_2855
	srax	%i6,	%o0,	%l0
	fcmped	%fcc2,	%f8,	%f0
	nop
	setx loop_2856, %l0, %l1
	jmpl %l1, %l3
loop_2855:
	fbne	%fcc2,	loop_2857
	bneg,pt	%xcc,	loop_2858
	add	%o2,	0x0092,	%i7
loop_2856:
	nop 	! 	tgu	%xcc,	0x5 changed by convert2hboot
loop_2857:
	orn	%g2,	%l2,	%g5
loop_2858:
	nop 	! 	tpos	%xcc,	0x1 changed by convert2hboot
	sdivx	%i4,	0x19B2,	%o3
	umul	%i0,	0x114B,	%o7
	sllx	%i3,	0x10,	%o4
	bvs,a,pn	%icc,	loop_2859
	fsrc1	%f0,	%f10
	ble,pn	%xcc,	loop_2860
	movvc	%xcc,	%l1,	%o5
loop_2859:
	fmovse	%xcc,	%f31,	%f3
	alignaddr	%o1,	%g1,	%l5
loop_2860:
	sra	%i2,	%g7,	%i1
	fornot2s	%f23,	%f28,	%f0
	wr	%g0,	0x18,	%asi
	sta	%f24,	[%l7 + 0x38] %asi
	fandnot2	%f24,	%f28,	%f24
	fmovdleu	%icc,	%f30,	%f5
	fcmped	%fcc0,	%f0,	%f8
	bge,pn	%icc,	loop_2861
	nop 	! 	tg	%xcc,	0x0 changed by convert2hboot
	brlz	%o6,	loop_2862
	fmovrdgez	%g4,	%f20,	%f2
loop_2861:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x19,	%asi
loop_2862:
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
	fmovdg	%xcc,	%f29,	%f27
	movrgz	%i5,	0x1AA,	%l6
	fnot1	%f0,	%f20
	edge16l	%i6,	%g3,	%o0
	fornot2	%f30,	%f0,	%f12
	nop
	set	0x28, %l4
	stw	%l3,	[%l7 + %l4]
	bvc,a,pt	%icc,	loop_2863
	movvs	%icc,	%o2,	%i7
	nop 	! 	sir	0x01E0 changed by convert2hboot
	movrne	%l0,	0x1B7,	%l2
loop_2863:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x11,	%asi
	nop 	! 	taddcctv	%o3,	%g5,	%o7 changed by convert2hboot
	andncc	%i0,	%i3,	%l1
	fmovrdgez	%o4,	%f20,	%f14
	xor	%o5,	0x102D,	%g1
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	fornot2	%f4,	%f28,	%f24
	wr	%g0,	0x18,	%asi
	fmovsl	%icc,	%f9,	%f13
	fcmple16	%f4,	%f24,	%i2
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	wr	%g0,	0x88,	%asi
	fmovdg	%icc,	%f18,	%f17
	fmul8sux16	%f8,	%f6,	%f6
	umulcc	%g7,	%i1,	%g4
	set	0x6D, %g5
	nop	 ! 	ldsba	[%l7 + %g5] 0x0c,	%o6 ASI use replaced by convert2hboot
	fpsub32	%f30,	%f16,	%f12
	fmovda	%xcc,	%f13,	%f21
	subccc	%g6,	0x0C04,	%l4
	movg	%xcc,	%i5,	%l6
	nop 	! 	tpos	%xcc,	0x4 changed by convert2hboot
	alignaddrl	%i6,	%g3,	%o0
	sdivx	%o2,	0x0875,	%l3
	nop 	! 	tg	%icc,	0x3 changed by convert2hboot
	addc	%l0,	%l2,	%i7
	swap	[%l7 + 0x6C],	%i4
	fmovscc	%icc,	%f6,	%f23
	sllx	%g2,	0x1F,	%o3
	sdiv	%g5,	0x1F7E,	%o7
	move	%icc,	%i3,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc3,	loop_2864
	movrlez	%o4,	0x351,	%l1
	bvc	loop_2865
	fmovscc	%icc,	%f11,	%f19
loop_2864:
	nop 	! 	tvc	%xcc,	0x6 changed by convert2hboot
	fnot1	%f22,	%f0
loop_2865:
	movge	%icc,	%o5,	%g1
	fmovrde	%o1,	%f20,	%f16
	nop 	! 	tsubcctv	%i2,	%l5,	%g7 changed by convert2hboot
	and	%i1,	0x1B63,	%g4
	andcc	%o6,	%l4,	%g6
	orcc	%i5,	0x16BC,	%l6
	edge16n	%g3,	%i6,	%o2
	st	%f12,	[%l7 + 0x64]
	movneg	%xcc,	%l3,	%l0
	nop 	! 	tcs	%icc,	0x6 changed by convert2hboot
	fmul8ulx16	%f0,	%f26,	%f4
	fmovrslez	%o0,	%f26,	%f27
	fxors	%f3,	%f14,	%f25
	array16	%i7,	%l2,	%i4
	movvc	%icc,	%g2,	%g5
	wr	%g0,	0x89,	%asi
	nop 	! 	taddcctv	%o3,	0x0023,	%i3 changed by convert2hboot
	edge8	%i0,	%l1,	%o4
	movleu	%icc,	%g1,	%o5
	movneg	%icc,	%o1,	%i2
	ldd	[%l7 + 0x58],	%l4
	srl	%i1,	0x08,	%g4
	prefetch	[%l7 + 0x0C],	 0x1
	array16	%g7,	%o6,	%g6
	udiv	%i5,	0x0DF7,	%l6
	set	0x10, %o0
	nop	 ! 	stxa	%g3,	[%l7 + %o0] 0x04 ASI use replaced by convert2hboot
	stb	%l4,	[%l7 + 0x16]
	fbo	%fcc0,	loop_2866
	stx	%o2,	[%l7 + 0x70]
	set	0x10, %g3
	nop	 ! 	ldsba	[%l7 + %g3] 0x04,	%i6 ASI use replaced by convert2hboot
loop_2866:
	xnor	%l0,	%o0,	%i7
	nop 	! 	tpos	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	edge16ln	%l2,	%i4,	%l3
	fone	%f0
	xorcc	%g2,	%g5,	%o7
	nop 	! 	taddcc	%i3,	%o3,	%l1 changed by convert2hboot
	fmovsne	%icc,	%f14,	%f25
	movrgez	%o4,	0x2C9,	%i0
	movle	%xcc,	%g1,	%o5
	fblg	%fcc0,	loop_2867
	brz,a	%o1,	loop_2868
	movl	%xcc,	%l5,	%i1
	movgu	%icc,	%g4,	%g7
loop_2867:
	movcc	%xcc,	%o6,	%i2
loop_2868:
	nop 	! 	tge	%icc,	0x4 changed by convert2hboot
	movne	%icc,	%i5,	%g6
	udiv	%l6,	0x0BE9,	%l4
	movgu	%icc,	%o2,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l0,	%o0,	%i6
	orn	%l2,	%i7,	%i4
	nop 	! 	taddcctv	%l3,	%g2,	%g5 changed by convert2hboot
	movcs	%xcc,	%o7,	%o3
	fcmpes	%fcc1,	%f9,	%f27
	ldsb	[%l7 + 0x4C],	%i3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	nop	 ! 	casa	[%l6] 0x04,	%o4,	%i0 ASI use replaced by convert2hboot
	set	0x51, %g2
	nop	 ! 	stba	%g1,	[%l7 + %g2] 0x04 ASI use replaced by convert2hboot
	set	0x74, %i6
	nop	 ! 	ldswa	[%l7 + %i6] 0x0c,	%o5 ASI use replaced by convert2hboot
	move	%icc,	%l1,	%o1
	edge16n	%l5,	%i1,	%g4
	fpadd32s	%f18,	%f5,	%f21
	orn	%o6,	%i2,	%i5
	sdivcc	%g6,	0x08EB,	%g7
	fmovspos	%icc,	%f0,	%f21
	orcc	%l6,	%l4,	%g3
	fpack32	%f18,	%f10,	%f30
	set	0x40, %i4
	nop	 ! 	ldda	[%l7 + %i4] 0x0c,	%f0 ASI use replaced by convert2hboot
	movpos	%xcc,	%l0,	%o0
	bn,a,pn	%icc,	loop_2869
	srlx	%i6,	%l2,	%i7
	fbul,a	%fcc2,	loop_2870
	movl	%icc,	%o2,	%l3
loop_2869:
	fcmpgt16	%f26,	%f4,	%g2
	movne	%icc,	%g5,	%o7
loop_2870:
	brgz	%o3,	loop_2871
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
	set	0x10, %o4
	nop	 ! 	ldda	[%l7 + %o4] 0x88,	%i2 ASI use replaced by convert2hboot
loop_2871:
	fpack16	%f24,	%f22
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
	sdivx	%i4,	0x0108,	%i0
	fxors	%f8,	%f2,	%f18
	nop 	! 	tge	%icc,	0x5 changed by convert2hboot
	movrgez	%o4,	%g1,	%l1
	nop 	! 	tsubcctv	%o5,	0x171C,	%l5 changed by convert2hboot
	st	%f10,	[%l7 + 0x44]
	sll	%i1,	%g4,	%o6
	umul	%o1,	%i2,	%g6
	bl	%icc,	loop_2872
	fmovrsgez	%i5,	%f25,	%f7
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	movrgez	%g7,	%l4,	%l6
loop_2872:
	fmovsvs	%icc,	%f22,	%f6
	nop
	setx	loop_2873,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	fpack16	%f12,	%f1
	fble,a	%fcc0,	loop_2874
	andcc	%g3,	%o0,	%l0
loop_2873:
	nop
	wr	%g0,	0x80,	%asi
loop_2874:
	nop 	! 	tneg	%icc,	0x0 changed by convert2hboot
	fmul8x16al	%f5,	%f6,	%f22
	popc	%i6,	%o2
	sethi	0x1984,	%l3
	fpadd16	%f4,	%f0,	%f28
	fmovsn	%icc,	%f28,	%f10
	fmovsg	%icc,	%f22,	%f27
	sll	%g2,	%g5,	%o7
	movrne	%o3,	0x2C6,	%i7
	subccc	%i3,	0x0E9E,	%i4
	edge32n	%o4,	%i0,	%g1
	addc	%o5,	0x122D,	%l5
	brnz	%i1,	loop_2875
	edge8n	%g4,	%l1,	%o6
	fsrc1s	%f23,	%f2
	edge16n	%o1,	%i2,	%i5
loop_2875:
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
	nop
	setx loop_2876, %l0, %l1
	jmpl %l1, %g6
	sdivcc	%g7,	0x0B52,	%l6
	movvs	%xcc,	%l4,	%g3
	edge8l	%o0,	%l2,	%i6
loop_2876:
	brlz	%o2,	loop_2877
	fmul8x16au	%f11,	%f25,	%f26
	fmovdn	%icc,	%f21,	%f29
	bcs,pn	%xcc,	loop_2878
loop_2877:
	orn	%l0,	%l3,	%g2
	wr	%g0,	0x10,	%asi
loop_2878:
	array8	%o7,	%o3,	%i7
	sub	%i3,	0x0D66,	%i4
	fmovsgu	%icc,	%f30,	%f19
	std	%o4,	[%l7 + 0x68]
	nop 	! 	ta	%icc,	0x4 changed by convert2hboot
	orcc	%i0,	0x08CA,	%g1
	wr	%g0,	0x19,	%asi
	sta	%f11,	[%l7 + 0x58] %asi
	move	%icc,	%o5,	%l5
	andncc	%i1,	%l1,	%g4
	fmovdcc	%xcc,	%f19,	%f29
	flush	%l7 + 0x70
	wr	%g0,	0x81,	%asi
	sta	%f20,	[%l7 + 0x40] %asi
	umul	%o1,	0x038E,	%o6
	edge32	%i2,	%i5,	%g7
	fmovdcs	%xcc,	%f14,	%f17
	fmovsleu	%icc,	%f17,	%f5
	movrne	%g6,	%l4,	%l6
	for	%f6,	%f22,	%f4
	sth	%o0,	[%l7 + 0x5A]
	movrlz	%l2,	0x294,	%i6
	xor	%o2,	0x1D3B,	%g3
	movleu	%xcc,	%l0,	%l3
	array32	%g5,	%o7,	%g2
	or	%i7,	%i3,	%i4
	bne,pn	%icc,	loop_2879
	edge16n	%o4,	%o3,	%i0
	orcc	%g1,	%o5,	%i1
	array8	%l1,	%l5,	%o1
loop_2879:
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x1 changed by convert2hboot
	orn	%g4,	0x1F20,	%i2
	std	%o6,	[%l7 + 0x10]
	fmovsg	%xcc,	%f16,	%f25
	nop 	! 	taddcc	%g7,	%i5,	%l4 changed by convert2hboot
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	wr	%g0,	0x81,	%asi
	set	0x48, %o5
	nop	 ! 	swapa	[%l7 + %o5] 0x10,	%o0 ASI use replaced by convert2hboot
	movrlz	%l6,	%l2,	%i6
	array8	%g3,	%o2,	%l0
	set	0x4A, %i7
	nop	 ! 	lduha	[%l7 + %i7] 0x11,	%g5 ASI use replaced by convert2hboot
	array8	%o7,	%g2,	%i7
	fbu,a	%fcc0,	loop_2880
	nop 	! 	tcs	%icc,	0x7 changed by convert2hboot
	lduw	[%l7 + 0x14],	%l3
	movrlz	%i4,	0x350,	%o4
loop_2880:
	bcs,a,pt	%xcc,	loop_2881
	sra	%i3,	%i0,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g1,	%i1,	%l1
loop_2881:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	nop	 ! 	casxa	[%l6] 0x80,	%o5,	%o1 ASI use replaced by convert2hboot
	ldsw	[%l7 + 0x3C],	%g4
	fcmpeq32	%f16,	%f4,	%l5
	movrgez	%i2,	0x1F5,	%o6
	nop 	! 	tsubcc	%g7,	%l4,	%i5 changed by convert2hboot
	fmovdvs	%xcc,	%f12,	%f28
	edge16n	%g6,	%l6,	%l2
	brgez,a	%i6,	loop_2882
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%g3,	%o0
	faligndata	%f2,	%f10,	%f30
loop_2882:
	bcc,a,pt	%icc,	loop_2883
	sllx	%o2,	0x10,	%l0
	fmovdle	%xcc,	%f18,	%f6
	srlx	%g5,	0x1F,	%g2
loop_2883:
	movg	%xcc,	%i7,	%o7
	edge16ln	%l3,	%o4,	%i3
	bl	%xcc,	loop_2884
	fmovda	%xcc,	%f17,	%f15
	bleu	loop_2885
	fmovdle	%xcc,	%f27,	%f4
loop_2884:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	nop	 ! 	casxa	[%l6] 0x81,	%i0,	%o3 ASI use replaced by convert2hboot
loop_2885:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g1,	%i4,	%i1
	wr	%g0,	0x19,	%asi
	fbne,a	%fcc3,	loop_2886
	srlx	%o5,	%g4,	%l5
	sethi	0x131B,	%o1
	orn	%o6,	%i2,	%g7
loop_2886:
	movvs	%xcc,	%l4,	%i5
	call	loop_2887
	move	%icc,	%l6,	%g6
	edge16n	%i6,	%l2,	%o0
	nop 	! 	tvc	%icc,	0x2 changed by convert2hboot
loop_2887:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	sir	0x10BB changed by convert2hboot
	array16	%g3,	%o2,	%l0
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	fmovdleu	%xcc,	%f21,	%f20
	nop 	! 	taddcc	%g5,	0x1AC8,	%g2 changed by convert2hboot
	fmovsgu	%xcc,	%f17,	%f21
	xor	%i7,	0x0C97,	%l3
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
	srax	%o7,	%i3,	%o4
	fmovrdgz	%o3,	%f26,	%f20
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	fmovrsgz	%i0,	%f15,	%f22
	set	0x6A, %o2
	nop	 ! 	lduba	[%l7 + %o2] 0x15,	%g1 ASI use replaced by convert2hboot
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	fmovdne	%icc,	%f23,	%f21
	fandnot2	%f16,	%f26,	%f18
	nop 	! 	taddcc	%i4,	%i1,	%l1 changed by convert2hboot
	xorcc	%g4,	0x149C,	%o5
	wr	%g0,	0x81,	%asi
	nop 	! 	ta	%xcc,	0x7 changed by convert2hboot
	xor	%l5,	0x1FFD,	%i2
	fbul	%fcc0,	loop_2888
	bge	%icc,	loop_2889
	fsrc1	%f10,	%f4
	std	%o6,	[%l7 + 0x70]
loop_2888:
	xnorcc	%l4,	%i5,	%l6
loop_2889:
	movgu	%xcc,	%g7,	%i6
	subc	%g6,	%l2,	%g3
	edge16ln	%o0,	%l0,	%g5
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	nop 	! 	tvc	%xcc,	0x3 changed by convert2hboot
	edge8ln	%g2,	%i7,	%o2
	add	%o7,	%i3,	%o4
	fcmpne32	%f14,	%f24,	%o3
	swap	[%l7 + 0x60],	%i0
	movpos	%icc,	%g1,	%l3
	wr	%g0,	0x89,	%asi
	fmovdge	%xcc,	%f3,	%f1
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	fmovrslez	%l1,	%f1,	%f6
	set	0x10, %o6
	nop	 ! 	ldxa	[%l7 + %o6] 0x81,	%i1 ASI use replaced by convert2hboot
	movrne	%o5,	0x08E,	%o1
	set	0x38, %i1
	nop	 ! 	ldswa	[%l7 + %i1] 0x18,	%g4 ASI use replaced by convert2hboot
	edge8	%l5,	%o6,	%i2
	sll	%i5,	0x04,	%l4
	fmovdcc	%icc,	%f28,	%f16
	umul	%l6,	%i6,	%g6
	nop 	! 	tpos	%icc,	0x1 changed by convert2hboot
	edge16ln	%l2,	%g7,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%l0,	%g3
	fandnot2	%f14,	%f24,	%f6
	fbe	%fcc1,	loop_2890
	sub	%g5,	0x1E81,	%g2
	movpos	%xcc,	%i7,	%o7
	set	0x08, %o1
	nop	 ! 	swapa	[%l7 + %o1] 0x10,	%o2 ASI use replaced by convert2hboot
loop_2890:
	fcmpgt32	%f12,	%f18,	%o4
	fmovdge	%xcc,	%f18,	%f5
	set	0x19, %i5
	nop	 ! 	ldsba	[%l7 + %i5] 0x0c,	%o3 ASI use replaced by convert2hboot
	wr	%g0,	0x23,	%asi
	membar	#Sync
	nop 	! 	ta	%xcc,	0x4 changed by convert2hboot
	wr	%g0,	0x80,	%asi
	fsrc2s	%f7,	%f16
	movrne	%l3,	0x003,	%i0
	edge16ln	%i4,	%l1,	%o5
	edge16n	%o1,	%g4,	%i1
	sllx	%l5,	0x01,	%i2
	fmovs	%f4,	%f16
	fpsub32	%f2,	%f26,	%f24
	nop 	! 	sir	0x186E changed by convert2hboot
	addcc	%i5,	0x17A1,	%o6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x48] %asi,	%f30
	fbu	%fcc0,	loop_2891
	andn	%l4,	%i6,	%g6
	set	0x48, %l0
	nop	 ! 	stxa	%l2,	[%l7 + %l0] 0xeb ASI use replaced by convert2hboot
	membar	#Sync
loop_2891:
	nop
	wr	%g0,	0x26,	%asi
	fblg	%fcc2,	loop_2892
	sllx	%l6,	%o0,	%l0
	edge32l	%g5,	%g2,	%i7
	orncc	%g3,	%o2,	%o7
loop_2892:
	fpadd32	%f14,	%f12,	%f2
	fpsub16s	%f25,	%f25,	%f17
	bn	%xcc,	loop_2893
	array32	%o4,	%i3,	%o3
	mulscc	%g1,	0x1485,	%i0
	nop 	! 	tne	%xcc,	0x3 changed by convert2hboot
loop_2893:
	fpack32	%f6,	%f18,	%f6
	smul	%i4,	0x0148,	%l1
	wr	%g0,	0x11,	%asi
	nop 	! 	ta	%xcc,	0x6 changed by convert2hboot
	movgu	%icc,	%o1,	%o5
	movge	%icc,	%g4,	%i1
	fmovrsgz	%l5,	%f7,	%f8
	stw	%i5,	[%l7 + 0x28]
	array8	%i2,	%l4,	%i6
	movvc	%xcc,	%o6,	%l2
	movl	%xcc,	%g7,	%g6
	edge8l	%o0,	%l6,	%g5
	smul	%g2,	0x0464,	%l0
	edge16ln	%g3,	%o2,	%i7
	nop 	! 	sir	0x072A changed by convert2hboot
	pdist	%f4,	%f28,	%f14
	fmovdl	%xcc,	%f14,	%f13
	smulcc	%o7,	0x1225,	%o4
	edge32n	%o3,	%g1,	%i3
	ldub	[%l7 + 0x72],	%i4
	nop 	! 	tgu	%icc,	0x4 changed by convert2hboot
	fnegd	%f16,	%f20
	edge16	%l1,	%l3,	%o1
	xorcc	%o5,	0x0657,	%g4
	movge	%xcc,	%i0,	%l5
	nop
	set	0x10, %i2
	ldd	[%l7 + %i2],	%i0
	nop
	setx	loop_2894,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	ldstub	[%l7 + 0x1F],	%i5
	movcs	%xcc,	%l4,	%i6
	subcc	%i2,	0x157D,	%o6
loop_2894:
	nop 	! 	sir	0x0642 changed by convert2hboot
	nop 	! 	tl	%xcc,	0x6 changed by convert2hboot
	fbne,a	%fcc0,	loop_2895
	sll	%g7,	%l2,	%o0
	movcc	%icc,	%g6,	%g5
	alignaddr	%l6,	%l0,	%g2
loop_2895:
	fmovscs	%xcc,	%f17,	%f16
	nop 	! 	tvc	%icc,	0x5 changed by convert2hboot
	bge,a,pn	%icc,	loop_2896
	nop 	! 	tl	%xcc,	0x4 changed by convert2hboot
	ldub	[%l7 + 0x1D],	%g3
	fsrc2	%f14,	%f0
loop_2896:
	nop
	set	0x28, %l6
	lda	[%l7 + %l6] 0x11,	%f9
	nop 	! 	tpos	%icc,	0x7 changed by convert2hboot
	subc	%i7,	0x0914,	%o7
	and	%o2,	0x03A9,	%o3
	fbuge	%fcc0,	loop_2897
	fmovsvc	%icc,	%f17,	%f21
	movleu	%icc,	%o4,	%i3
	fbuge,a	%fcc2,	loop_2898
loop_2897:
	movn	%icc,	%i4,	%l1
	set	0x40, %i0
	nop	 ! 	stda	%f16,	[%l7 + %i0] 0x1f ASI use replaced by convert2hboot
	membar	#Sync
loop_2898:
	nop 	! 	sir	0x1760 changed by convert2hboot
	nop 	! 	tvs	%icc,	0x7 changed by convert2hboot
	fpack32	%f28,	%f14,	%f4
	ld	[%l7 + 0x6C],	%f13
	edge32l	%l3,	%g1,	%o1
	movg	%icc,	%o5,	%g4
	nop 	! 	tge	%icc,	0x0 changed by convert2hboot
	sll	%i0,	0x1A,	%l5
	sethi	0x1047,	%i1
	fpadd16s	%f29,	%f29,	%f11
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
	set	0x0, %i3
	nop	 ! 	stxa	%l4,	[%g0 + %i3] 0x57 ASI use replaced by convert2hboot
	wr	%g0,	0x80,	%asi
	fmovrsgez	%i6,	%f0,	%f14
	sdivcc	%o6,	0x0CDD,	%g7
	edge8	%i2,	%l2,	%g6
	set	0x14, %o3
	sta	%f20,	[%l7 + %o3] 0x15
	edge8l	%g5,	%l6,	%o0
	fmovdcc	%xcc,	%f30,	%f15
	fbue,a	%fcc0,	loop_2899
	bvs,a,pn	%icc,	loop_2900
	movle	%icc,	%g2,	%g3
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
loop_2899:
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
loop_2900:
	fpsub32	%f0,	%f10,	%f6
	fmovsvc	%xcc,	%f11,	%f7
	alignaddrl	%l0,	%o7,	%i7
	fmovsneg	%icc,	%f17,	%f4
	array16	%o2,	%o3,	%i3
	edge8l	%o4,	%l1,	%l3
	nop 	! 	taddcc	%g1,	0x0B1A,	%i4 changed by convert2hboot
	fmovd	%f22,	%f30
	fmovsne	%icc,	%f4,	%f14
	and	%o1,	%g4,	%o5
	sth	%i0,	[%l7 + 0x4C]
	mova	%xcc,	%i1,	%l4
	smulcc	%i5,	0x1D1F,	%i6
	array8	%l5,	%o6,	%g7
	wr	%g0,	0x80,	%asi
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
	edge32l	%g6,	%l2,	%l6
	sdivx	%o0,	0x0B4B,	%g5
	fandnot1	%f26,	%f6,	%f8
	addc	%g3,	%g2,	%o7
	fmovsg	%icc,	%f10,	%f5
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	sllx	%l0,	0x0A,	%o2
	nop 	! 	tcc	%xcc,	0x6 changed by convert2hboot
	set	0x7A, %l2
	nop	 ! 	ldsha	[%l7 + %l2] 0x11,	%o3 ASI use replaced by convert2hboot
	fmovse	%xcc,	%f28,	%f14
	set	0x38, %o7
	lda	[%l7 + %o7] 0x18,	%f4
	swap	[%l7 + 0x1C],	%i7
	andn	%i3,	%l1,	%o4
	xnorcc	%l3,	0x1BA3,	%g1
	alignaddrl	%o1,	%g4,	%i4
	fmovse	%icc,	%f4,	%f21
	sth	%i0,	[%l7 + 0x0C]
	movrgez	%i1,	%o5,	%l4
	fcmple32	%f30,	%f4,	%i5
	array8	%l5,	%i6,	%o6
	fabsd	%f0,	%f28
	srax	%g7,	%i2,	%l2
	mulx	%l6,	%o0,	%g5
	nop 	! 	tg	%icc,	0x3 changed by convert2hboot
	fcmpes	%fcc0,	%f6,	%f28
	fandnot1	%f12,	%f6,	%f20
	smulcc	%g3,	%g6,	%o7
	fble,a	%fcc0,	loop_2901
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
	move	%xcc,	%g2,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2901:
	xor	%o2,	%i7,	%o3
	membar	#Sync
	set	0x40, %g4
	nop	 ! 	ldda	[%l7 + %g4] 0xf0,	%f0 ASI use replaced by convert2hboot
	nop 	! 	tpos	%xcc,	0x6 changed by convert2hboot
	udivx	%i3,	0x1532,	%o4
	membar	#Sync
	set	0x40, %l1
	nop	 ! 	ldda	[%l7 + %l1] 0x17,	%f16 ASI use replaced by convert2hboot
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	xnorcc	%l1,	0x1D2F,	%g1
	sdivcc	%o1,	0x114B,	%g4
	array8	%l3,	%i4,	%i0
	flush	%l7 + 0x2C
	edge16ln	%i1,	%o5,	%l4
	edge16n	%i5,	%i6,	%l5
	nop 	! 	tcc	%xcc,	0x0 changed by convert2hboot
	nop 	! 	tcs	%icc,	0x2 changed by convert2hboot
	add	%l7,	0x44,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g7
	bcs	%xcc,	loop_2902
	orcc	%i2,	0x1787,	%l6
	fbge	%fcc1,	loop_2903
	addccc	%l2,	%g5,	%o0
loop_2902:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g3,	%o7,	%g2
loop_2903:
	nop
	set	0x58, %g1
	nop	 ! 	ldsha	[%l7 + %g1] 0x19,	%l0 ASI use replaced by convert2hboot
	fbge	%fcc2,	loop_2904
	std	%f6,	[%l7 + 0x08]
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
	movcc	%icc,	%o2,	%g6
loop_2904:
	nop
	membar	#Sync
	set	0x40, %g7
	nop	 ! 	ldda	[%l7 + %g7] 0xf8,	%f0 ASI use replaced by convert2hboot
	movg	%xcc,	%o3,	%i3
	popc	%i7,	%l1
	bshuffle	%f20,	%f14,	%f16
	ble,a,pn	%xcc,	loop_2905
	or	%o4,	0x05EC,	%o1
	wr	%g0,	0x04,	%asi
loop_2905:
	fandnot1s	%f9,	%f0,	%f16
	andncc	%l3,	%i4,	%g1
	bg,pn	%xcc,	loop_2906
	movg	%icc,	%i1,	%i0
	edge8ln	%l4,	%i5,	%o5
	movrlz	%i6,	0x1BE,	%l5
loop_2906:
	movne	%icc,	%o6,	%i2
	brnz	%l6,	loop_2907
	pdist	%f30,	%f24,	%f26
	edge8	%g7,	%g5,	%o0
	sdiv	%g3,	0x0EE5,	%o7
loop_2907:
	flush	%l7 + 0x20
	nop
	set	0x3E, %g6
	ldsb	[%l7 + %g6],	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc2,	loop_2908
	fzeros	%f3
	movneg	%xcc,	%l0,	%l2
	edge16l	%o2,	%g6,	%o3
loop_2908:
	udiv	%i7,	0x1C23,	%l1
	swap	[%l7 + 0x20],	%o4
	andcc	%o1,	%g4,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%l3,	%i4
	fcmpd	%fcc2,	%f6,	%f6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	movn	%xcc,	%i1,	%l4
	fnot2	%f16,	%f4
	edge8	%o5,	%i6,	%l5
	fandnot2s	%f23,	%f15,	%f20
	fones	%f26
	move	%xcc,	%o6,	%i2
	nop 	! 	tleu	%icc,	0x4 changed by convert2hboot
	smul	%l6,	%i5,	%g5
	movn	%icc,	%g7,	%o0
	xnorcc	%o7,	%g3,	%g2
	brnz,a	%l0,	loop_2909
	sdivcc	%l2,	0x138A,	%o2
	fornot1s	%f12,	%f16,	%f28
	fbo	%fcc2,	loop_2910
loop_2909:
	umulcc	%o3,	%i7,	%g6
	movcs	%icc,	%l1,	%o1
	mova	%icc,	%o4,	%i3
loop_2910:
	subccc	%l3,	%i4,	%g4
	fmovdl	%xcc,	%f19,	%f16
	movn	%icc,	%g1,	%i1
	fcmple16	%f4,	%f26,	%l4
	sethi	0x1148,	%o5
	sllx	%i6,	0x15,	%l5
	fmul8x16	%f13,	%f0,	%f18
	edge8ln	%i0,	%o6,	%i2
	subccc	%l6,	%g5,	%i5
	movre	%g7,	%o7,	%g3
	fbul	%fcc2,	loop_2911
	fcmple16	%f14,	%f12,	%o0
	popc	%l0,	%l2
	orncc	%o2,	0x01FD,	%o3
loop_2911:
	fmovdg	%xcc,	%f0,	%f11
	for	%f18,	%f2,	%f22
	fmul8x16au	%f22,	%f19,	%f26
	sllx	%g2,	0x02,	%g6
	fmul8x16	%f24,	%f26,	%f14
	fbn	%fcc3,	loop_2912
	movrgz	%l1,	%i7,	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	nop	 ! 	casa	[%l6] 0x89,	%o1,	%l3 ASI use replaced by convert2hboot
loop_2912:
	fmovrdgz	%i3,	%f22,	%f28
	wr	%g0,	0x89,	%asi
	ba,pn	%icc,	loop_2913
	movcs	%icc,	%i4,	%g1
	edge32n	%i1,	%o5,	%i6
	brz,a	%l5,	loop_2914
loop_2913:
	fandnot1	%f4,	%f10,	%f18
	nop 	! 	tgu	%icc,	0x2 changed by convert2hboot
	movre	%l4,	0x3CB,	%o6
loop_2914:
	fbge	%fcc3,	loop_2915
	fmovsg	%xcc,	%f5,	%f16
	edge8n	%i0,	%l6,	%g5
	xorcc	%i5,	0x0E06,	%g7
loop_2915:
	sllx	%i2,	0x0C,	%o7
	addc	%g3,	%o0,	%l0
	fcmpeq16	%f20,	%f24,	%o2
	sll	%o3,	%l2,	%g6
	movre	%g2,	%l1,	%o4
	edge8l	%i7,	%o1,	%l3
	nop 	! 	tg	%icc,	0x6 changed by convert2hboot
	movge	%xcc,	%g4,	%i3
	fmovsvc	%icc,	%f26,	%f9
	srax	%i4,	0x09,	%g1
	fxnors	%f6,	%f10,	%f28
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	nop 	! 	tneg	%icc,	0x4 changed by convert2hboot
	bg	%icc,	loop_2916
	add	%l5,	0x106C,	%i1
	fsrc1s	%f12,	%f29
	umul	%o6,	%i0,	%l4
loop_2916:
	movre	%l6,	0x09A,	%g5
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
	fpmerge	%f25,	%f26,	%f0
	st	%f31,	[%l7 + 0x18]
	edge8	%g7,	%i2,	%o7
	umul	%i5,	0x155D,	%o0
	brlez	%l0,	loop_2917
	sth	%o2,	[%l7 + 0x22]
	edge8l	%g3,	%o3,	%g6
	subc	%l2,	0x18C1,	%l1
loop_2917:
	sra	%o4,	%g2,	%o1
	wr	%g0,	0x89,	%asi
	fmovsl	%icc,	%f4,	%f4
	wr	%g0,	0x80,	%asi
	array32	%i7,	%i3,	%i4
	nop 	! 	tg	%icc,	0x4 changed by convert2hboot
	sra	%g1,	%i6,	%l5
	ldstub	[%l7 + 0x6E],	%i1
	nop 	! 	tne	%xcc,	0x5 changed by convert2hboot
	fmovdle	%icc,	%f24,	%f0
	array16	%o5,	%i0,	%o6
	nop 	! 	tvc	%xcc,	0x4 changed by convert2hboot
	fornot2	%f30,	%f20,	%f12
	movcs	%icc,	%l4,	%g5
	popc	%l6,	%g7
	fpsub32s	%f9,	%f20,	%f10
	call	loop_2918
	brz	%i2,	loop_2919
	movrlz	%i5,	0x263,	%o7
	set	0x24, %l5
	lda	[%l7 + %l5] 0x19,	%f22
loop_2918:
	andn	%l0,	%o0,	%g3
loop_2919:
	sub	%o2,	0x1A53,	%o3
	movcc	%icc,	%l2,	%l1
	smulcc	%o4,	%g2,	%g6
	sub	%l3,	0x0552,	%g4
	fpack32	%f24,	%f2,	%f14
	sub	%i7,	0x143B,	%i3
	xor	%i4,	0x1410,	%g1
	fnegs	%f1,	%f2
	movl	%icc,	%o1,	%i6
	fmovdgu	%xcc,	%f8,	%f30
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
	edge8	%l5,	%o5,	%i0
	xor	%o6,	0x1227,	%l4
	fcmpeq16	%f28,	%f26,	%i1
	nop 	! 	tneg	%icc,	0x7 changed by convert2hboot
	edge16ln	%g5,	%g7,	%i2
	xorcc	%i5,	%l6,	%l0
	fmovrdlez	%o7,	%f16,	%f0
	sub	%g3,	%o0,	%o3
	move	%xcc,	%o2,	%l1
	movgu	%icc,	%l2,	%g2
	fone	%f2
	movrgz	%o4,	0x181,	%g6
	set	0x43, %l3
	nop	 ! 	stba	%g4,	[%l7 + %l3] 0x2a ASI use replaced by convert2hboot
	membar	#Sync
	fbge	%fcc3,	loop_2920
	fsrc1s	%f26,	%f7
	nop 	! 	tsubcc	%l3,	0x1826,	%i7 changed by convert2hboot
	fcmple32	%f12,	%f2,	%i3
loop_2920:
	fmovdcc	%xcc,	%f22,	%f27
	bvs,a	loop_2921
	subccc	%i4,	0x0DF0,	%g1
	fpadd16s	%f21,	%f26,	%f10
	nop 	! 	tl	%xcc,	0x6 changed by convert2hboot
loop_2921:
	nop 	! 	tgu	%xcc,	0x0 changed by convert2hboot
	fmovdg	%icc,	%f12,	%f7
	std	%o0,	[%l7 + 0x38]
	array32	%i6,	%o5,	%i0
	sdiv	%o6,	0x1B0C,	%l5
	bleu,pn	%xcc,	loop_2922
	fmovspos	%icc,	%f7,	%f17
	nop 	! 	tcs	%icc,	0x1 changed by convert2hboot
	sll	%l4,	0x14,	%g5
loop_2922:
	membar	0x02
	nop 	! 	tvs	%icc,	0x1 changed by convert2hboot
	mulx	%g7,	%i1,	%i5
	movrgez	%l6,	0x06D,	%l0
	addcc	%o7,	0x180A,	%i2
	edge32n	%g3,	%o3,	%o0
	std	%l0,	[%l7 + 0x20]
	fbule,a	%fcc0,	loop_2923
	nop 	! 	sir	0x0FDB changed by convert2hboot
	fpadd16	%f2,	%f10,	%f14
	fnegd	%f14,	%f0
loop_2923:
	fmovdleu	%xcc,	%f31,	%f12
	bcc,a	loop_2924
	brz	%l2,	loop_2925
	subccc	%o2,	0x083B,	%g2
	nop
	setx loop_2926, %l0, %l1
	jmpl %l1, %g6
loop_2924:
	movneg	%xcc,	%g4,	%l3
loop_2925:
	array8	%o4,	%i3,	%i4
	set	0x64, %l4
	nop	 ! 	lduwa	[%l7 + %l4] 0x80,	%g1 ASI use replaced by convert2hboot
loop_2926:
	fbul,a	%fcc3,	loop_2927
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	brz	%i7,	loop_2928
	movre	%i6,	%o1,	%o5
loop_2927:
	and	%i0,	%l5,	%l4
	orn	%o6,	0x07DA,	%g5
loop_2928:
	ldx	[%l7 + 0x08],	%g7
	fornot1s	%f13,	%f15,	%f27
	bge,a,pn	%icc,	loop_2929
	bg,pn	%xcc,	loop_2930
	udiv	%i1,	0x094E,	%l6
	xorcc	%i5,	%o7,	%l0
loop_2929:
	fblg,a	%fcc1,	loop_2931
loop_2930:
	movrne	%g3,	%o3,	%o0
	bl	loop_2932
	array32	%l1,	%i2,	%o2
loop_2931:
	nop 	! 	tvs	%xcc,	0x1 changed by convert2hboot
	subc	%g2,	0x0347,	%l2
loop_2932:
	xorcc	%g4,	%l3,	%g6
	srax	%o4,	0x0C,	%i4
	fmovda	%xcc,	%f10,	%f15
	movge	%icc,	%i3,	%i7
	brgz,a	%i6,	loop_2933
	nop 	! 	tsubcc	%g1,	%o5,	%i0 changed by convert2hboot
	move	%xcc,	%o1,	%l5
	sdiv	%o6,	0x1128,	%l4
loop_2933:
	nop 	! 	taddcc	%g5,	%i1,	%g7 changed by convert2hboot
	array8	%i5,	%o7,	%l0
	nop 	! 	sir	0x0BCC changed by convert2hboot
	edge8ln	%l6,	%o3,	%g3
	edge8l	%o0,	%i2,	%l1
	nop 	! 	taddcc	%o2,	%l2,	%g2 changed by convert2hboot
	for	%f24,	%f16,	%f2
	set	0x40, %o0
	nop	 ! 	stda	%f0,	[%l7 + %o0] 0x11 ASI use replaced by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%g4,	%g6,	%l3
	movvc	%icc,	%i4,	%o4
	popc	%i3,	%i7
	brgz,a	%i6,	loop_2934
	nop 	! 	tn	%icc,	0x5 changed by convert2hboot
	xor	%g1,	%o5,	%i0
	xnor	%o1,	%o6,	%l5
loop_2934:
	fbg	%fcc2,	loop_2935
	array8	%l4,	%g5,	%g7
	wr	%g0,	0x0c,	%asi
loop_2935:
	fmovsgu	%xcc,	%f9,	%f9
	fmovrsne	%i5,	%f24,	%f29
	fnands	%f8,	%f29,	%f28
	ldsb	[%l7 + 0x72],	%i1
	fbe	%fcc3,	loop_2936
	sdiv	%o7,	0x146C,	%l0
	subc	%o3,	0x1A7F,	%g3
	fsrc1s	%f8,	%f7
loop_2936:
	udivcc	%l6,	0x1B13,	%o0
	nop 	! 	tn	%xcc,	0x7 changed by convert2hboot
	movre	%i2,	%l1,	%l2
	udivx	%o2,	0x0F3D,	%g4
	srlx	%g2,	%l3,	%g6
	orncc	%i4,	0x0D60,	%o4
	movl	%icc,	%i3,	%i6
	edge32l	%g1,	%o5,	%i7
	array32	%i0,	%o6,	%l5
	addccc	%l4,	%g5,	%o1
	nop 	! 	tsubcc	%i5,	%g7,	%o7 changed by convert2hboot
	edge8l	%i1,	%o3,	%g3
	mova	%xcc,	%l0,	%l6
	ld	[%l7 + 0x54],	%f14
	fcmps	%fcc2,	%f21,	%f30
	edge32l	%i2,	%l1,	%l2
	nop 	! 	tleu	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o0,	%o2,	%g2
	set	0x38, %g5
	nop	 ! 	ldxa	[%l7 + %g5] 0x80,	%l3 ASI use replaced by convert2hboot
	fmovdcs	%xcc,	%f5,	%f23
	fmovsleu	%icc,	%f12,	%f1
	wr	%g0,	0x04,	%asi
	add	%i4,	0x1281,	%o4
	wr	%g0,	0x19,	%asi
	smul	%i6,	%i3,	%o5
	subcc	%g1,	0x1062,	%i7
	lduh	[%l7 + 0x1C],	%i0
	nop
	setx loop_2937, %l0, %l1
	jmpl %l1, %l5
	bvs,a	loop_2938
	movrlez	%l4,	0x12E,	%g5
	smul	%o6,	0x166F,	%i5
loop_2937:
	mulscc	%o1,	%g7,	%o7
loop_2938:
	sdivx	%o3,	0x14B6,	%i1
	fmovdn	%icc,	%f4,	%f25
	ld	[%l7 + 0x4C],	%f30
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
	alignaddr	%g3,	%l0,	%i2
	addccc	%l6,	0x1EF9,	%l1
	wr	%g0,	0x11,	%asi
	fbl	%fcc2,	loop_2939
	prefetch	[%l7 + 0x68],	 0x2
	fmovsa	%icc,	%f26,	%f21
	movcs	%xcc,	%l2,	%g2
loop_2939:
	xnorcc	%l3,	%g6,	%i4
	brgz	%o2,	loop_2940
	alignaddr	%o4,	%i6,	%g4
	movge	%xcc,	%o5,	%g1
	nop 	! 	tle	%icc,	0x0 changed by convert2hboot
loop_2940:
	sdivx	%i3,	0x0284,	%i7
	movre	%l5,	%l4,	%g5
	subccc	%o6,	%i0,	%o1
	nop
	setx	loop_2941,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fmovsneg	%xcc,	%f26,	%f10
	fpadd16s	%f8,	%f5,	%f22
	edge32	%i5,	%g7,	%o7
loop_2941:
	nop
	set	0x54, %g3
	nop	 ! 	lduwa	[%l7 + %g3] 0x15,	%i1 ASI use replaced by convert2hboot
	fbuge	%fcc0,	loop_2942
	srax	%o3,	0x0B,	%g3
	fbge	%fcc3,	loop_2943
	call	loop_2944
loop_2942:
	fabss	%f18,	%f8
	fmovdcc	%xcc,	%f0,	%f8
loop_2943:
	fbe,a	%fcc2,	loop_2945
loop_2944:
	brgz,a	%l0,	loop_2946
	fbne,a	%fcc1,	loop_2947
	alignaddrl	%l6,	%i2,	%l1
loop_2945:
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
loop_2946:
loop_2947:
	movvc	%xcc,	%o0,	%g2
	movrlz	%l2,	0x258,	%g6
	edge8n	%i4,	%l3,	%o2
	edge32ln	%i6,	%o4,	%g4
	sra	%o5,	0x0F,	%g1
	array16	%i7,	%i3,	%l5
	bneg,pt	%icc,	loop_2948
	edge16ln	%g5,	%o6,	%l4
	sethi	0x09A5,	%o1
	nop 	! 	tg	%icc,	0x0 changed by convert2hboot
loop_2948:
	orncc	%i5,	0x0ED3,	%g7
	movle	%xcc,	%o7,	%i1
	fmovrslez	%i0,	%f9,	%f11
	fone	%f18
	nop 	! 	tvc	%xcc,	0x5 changed by convert2hboot
	movrne	%g3,	%l0,	%l6
	fpackfix	%f22,	%f22
	orcc	%o3,	%i2,	%l1
	pdist	%f0,	%f30,	%f20
	sra	%o0,	0x17,	%g2
	std	%f18,	[%l7 + 0x40]
	fsrc2s	%f23,	%f12
	fmovdgu	%xcc,	%f1,	%f2
	bgu,pn	%xcc,	loop_2949
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	fcmple16	%f12,	%f8,	%l2
	brnz	%i4,	loop_2950
loop_2949:
	alignaddrl	%l3,	%g6,	%i6
	fbu,a	%fcc1,	loop_2951
	alignaddrl	%o4,	%g4,	%o2
loop_2950:
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
	brlz	%o5,	loop_2952
loop_2951:
	movrgz	%i7,	%g1,	%i3
	array8	%g5,	%l5,	%o6
	bpos,a	%xcc,	loop_2953
loop_2952:
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	fble,a	%fcc2,	loop_2954
	stx	%o1,	[%l7 + 0x48]
loop_2953:
	fors	%f16,	%f15,	%f31
	orn	%l4,	0x196A,	%g7
loop_2954:
	fpadd16	%f8,	%f22,	%f12
	fsrc2s	%f27,	%f27
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	nop 	! 	tg	%icc,	0x1 changed by convert2hboot
	fbne,a	%fcc0,	loop_2955
	nop 	! 	tg	%xcc,	0x6 changed by convert2hboot
	orncc	%i0,	0x14D7,	%o7
	movrne	%l0,	%l6,	%g3
loop_2955:
	fbule	%fcc1,	loop_2956
	fmul8x16	%f0,	%f20,	%f22
	set	0x68, %i6
	nop	 ! 	ldsha	[%l7 + %i6] 0x18,	%o3 ASI use replaced by convert2hboot
loop_2956:
	fsrc2s	%f28,	%f15
	fmovsleu	%xcc,	%f29,	%f18
	edge8	%l1,	%i2,	%o0
	array32	%l2,	%g2,	%l3
	nop 	! 	tcc	%icc,	0x5 changed by convert2hboot
	sll	%i4,	0x03,	%g6
	movne	%xcc,	%i6,	%g4
	edge16ln	%o2,	%o5,	%o4
	nop 	! 	tcc	%xcc,	0x2 changed by convert2hboot
	nop
	set	0x40, %g2
	prefetch	[%l7 + %g2],	 0x1
	array16	%g1,	%i3,	%i7
	orcc	%l5,	%g5,	%o1
	movrgz	%l4,	0x131,	%o6
	nop 	! 	tleu	%icc,	0x5 changed by convert2hboot
	andn	%g7,	%i5,	%i0
	nop 	! 	tle	%icc,	0x1 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x6 changed by convert2hboot
	fcmpes	%fcc3,	%f0,	%f8
	nop 	! 	tsubcctv	%i1,	0x132D,	%o7 changed by convert2hboot
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l6,	0x06FF,	%g3
	nop
	set	0x48, %i4
	std	%l0,	[%l7 + %i4]
	fmovsa	%icc,	%f3,	%f15
	array32	%l1,	%i2,	%o3
	udiv	%o0,	0x08E0,	%g2
	subcc	%l2,	0x18CD,	%l3
	nop 	! 	tcs	%xcc,	0x0 changed by convert2hboot
	set	0x66, %o4
	nop	 ! 	lduha	[%l7 + %o4] 0x15,	%g6 ASI use replaced by convert2hboot
	srax	%i6,	%g4,	%o2
	set	0x64, %i7
	lda	[%l7 + %i7] 0x81,	%f4
	nop 	! 	taddcctv	%o5,	%o4,	%i4 changed by convert2hboot
	fmovscs	%icc,	%f6,	%f0
	addc	%i3,	%g1,	%l5
	edge8n	%g5,	%o1,	%l4
	movvc	%icc,	%i7,	%o6
	brlez,a	%i5,	loop_2957
	fands	%f5,	%f28,	%f17
	fmovsne	%icc,	%f30,	%f16
	sdiv	%i0,	0x1207,	%i1
loop_2957:
	fbug,a	%fcc3,	loop_2958
	fmovsa	%xcc,	%f4,	%f11
	brlz	%g7,	loop_2959
	nop 	! 	tle	%xcc,	0x3 changed by convert2hboot
loop_2958:
	orncc	%o7,	0x03AD,	%l6
	swap	[%l7 + 0x18],	%g3
loop_2959:
	stb	%l1,	[%l7 + 0x7D]
	wr	%g0,	0x18,	%asi
	movcc	%icc,	%o3,	%i2
	fzero	%f18
	alignaddrl	%o0,	%l2,	%l3
	nop 	! 	tneg	%icc,	0x0 changed by convert2hboot
	movvc	%icc,	%g6,	%g2
	sdivx	%g4,	0x0EB4,	%o2
	bvc,a	%icc,	loop_2960
	movl	%icc,	%i6,	%o4
	nop 	! 	tcc	%xcc,	0x1 changed by convert2hboot
	edge8ln	%i4,	%i3,	%o5
loop_2960:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f29,	[%l7 + 0x74]
	nop 	! 	tgu	%icc,	0x5 changed by convert2hboot
	nop 	! 	tle	%xcc,	0x7 changed by convert2hboot
	edge16	%g1,	%l5,	%g5
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
	addcc	%o1,	%l4,	%i7
	fpadd32s	%f17,	%f2,	%f21
	orn	%o6,	%i5,	%i1
loop_2961:
	fcmpes	%fcc0,	%f9,	%f3
	fmovsne	%icc,	%f21,	%f17
	wr	%g0,	0x80,	%asi
	udivx	%g7,	0x122F,	%l6
	alignaddr	%g3,	%l1,	%o7
	fcmpeq16	%f6,	%f26,	%l0
	movne	%xcc,	%i2,	%o3
	edge32	%o0,	%l3,	%l2
	fcmple16	%f26,	%f28,	%g2
	array16	%g4,	%g6,	%o2
	nop
	setx	loop_2962,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	edge32ln	%o4,	%i4,	%i6
	movvc	%xcc,	%o5,	%i3
	brz,a	%l5,	loop_2963
loop_2962:
	fmul8x16	%f1,	%f8,	%f20
	andcc	%g1,	0x0200,	%o1
	sub	%l4,	%g5,	%o6
loop_2963:
	xnorcc	%i7,	0x0081,	%i1
	set	0x20, %o2
	nop	 ! 	stda	%i4,	[%l7 + %o2] 0x88 ASI use replaced by convert2hboot
	nop 	! 	taddcc	%i0,	0x1FA0,	%g7 changed by convert2hboot
	srax	%l6,	0x04,	%l1
	smul	%g3,	%l0,	%o7
	fcmpd	%fcc3,	%f28,	%f2
	edge8l	%o3,	%o0,	%l3
	fpsub32s	%f15,	%f23,	%f25
	nop
	setx	loop_2964,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	or	%i2,	0x06CE,	%l2
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
	nop 	! 	tpos	%icc,	0x2 changed by convert2hboot
loop_2964:
	movgu	%xcc,	%g4,	%g6
	movvc	%icc,	%o2,	%g2
	edge8n	%o4,	%i4,	%i6
	fmovsle	%xcc,	%f18,	%f7
	bge	%xcc,	loop_2965
	fpack32	%f16,	%f22,	%f22
	and	%o5,	0x0E58,	%i3
	nop 	! 	te	%icc,	0x2 changed by convert2hboot
loop_2965:
	movcs	%icc,	%g1,	%o1
	fbne	%fcc0,	loop_2966
	edge32n	%l4,	%g5,	%l5
	mulx	%i7,	%i1,	%i5
	movge	%icc,	%i0,	%o6
loop_2966:
	andncc	%l6,	%l1,	%g3
	wr	%g0,	0x2f,	%asi
	membar	#Sync
	mulx	%l0,	0x0934,	%o3
	nop 	! 	taddcctv	%o7,	%o0,	%i2 changed by convert2hboot
	nop 	! 	tvc	%xcc,	0x1 changed by convert2hboot
	or	%l2,	0x1198,	%l3
	nop
	set	0x68, %o6
	ldsw	[%l7 + %o6],	%g6
	set	0x10, %o5
	nop	 ! 	ldda	[%l7 + %o5] 0x14,	%g4 ASI use replaced by convert2hboot
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	bvc,a,pt	%icc,	loop_2967
	ld	[%l7 + 0x74],	%f19
	faligndata	%f26,	%f24,	%f28
	set	0x68, %i1
	sta	%f27,	[%l7 + %i1] 0x88
loop_2967:
	nop 	! 	tle	%icc,	0x5 changed by convert2hboot
	andcc	%o2,	0x1C74,	%g2
	fmovdvc	%icc,	%f21,	%f29
	fmovsneg	%xcc,	%f10,	%f0
	movrlz	%o4,	0x233,	%i4
	fblg,a	%fcc2,	loop_2968
	nop 	! 	ta	%xcc,	0x7 changed by convert2hboot
	udivcc	%o5,	0x0F36,	%i3
	subc	%g1,	0x03FC,	%i6
loop_2968:
	fnegd	%f24,	%f12
	nop 	! 	taddcc	%l4,	%g5,	%l5 changed by convert2hboot
	sra	%o1,	%i7,	%i5
	sub	%i0,	%o6,	%i1
	xorcc	%l1,	0x108F,	%l6
	and	%g3,	0x033D,	%l0
	fmovd	%f12,	%f16
	movle	%icc,	%o3,	%g7
	edge8n	%o7,	%i2,	%o0
	movrlez	%l3,	0x035,	%g6
	movge	%icc,	%l2,	%o2
	fbule	%fcc3,	loop_2969
	mulscc	%g4,	%o4,	%g2
	edge8n	%i4,	%i3,	%o5
	fexpand	%f19,	%f12
loop_2969:
	bneg,a,pt	%icc,	loop_2970
	fmovdneg	%icc,	%f19,	%f2
	movneg	%xcc,	%i6,	%g1
	set	0x40, %i5
	nop	 ! 	ldda	[%l7 + %i5] 0x15,	%f0 ASI use replaced by convert2hboot
loop_2970:
	nop 	! 	tg	%xcc,	0x5 changed by convert2hboot
	sra	%l4,	0x12,	%l5
	fpsub16s	%f27,	%f8,	%f26
	andncc	%o1,	%g5,	%i5
	xnorcc	%i0,	0x09F9,	%o6
	fmovsle	%icc,	%f7,	%f20
	movrgez	%i7,	0x327,	%l1
	wr	%g0,	0xea,	%asi
	membar	#Sync
	fbne,a	%fcc1,	loop_2971
	edge8l	%i1,	%g3,	%o3
	fandnot2	%f30,	%f26,	%f24
	nop 	! 	tg	%icc,	0x1 changed by convert2hboot
loop_2971:
	fbg	%fcc2,	loop_2972
	umulcc	%g7,	0x055B,	%o7
	xnorcc	%i2,	0x1D19,	%l0
	array16	%o0,	%l3,	%l2
loop_2972:
	edge32	%o2,	%g4,	%o4
	siam	0x0
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
	fmovrdne	%g2,	%f24,	%f28
	andn	%i4,	%i3,	%g6
	mulx	%o5,	0x14F2,	%g1
	edge16	%l4,	%i6,	%l5
	move	%icc,	%o1,	%i5
	bl,a,pt	%icc,	loop_2973
	movrgz	%i0,	%o6,	%g5
	movl	%icc,	%l1,	%i7
	set	0x08, %l0
	nop	 ! 	ldxa	[%l7 + %l0] 0x88,	%l6 ASI use replaced by convert2hboot
loop_2973:
	pdist	%f8,	%f10,	%f6
	set	0x3C, %o1
	nop	 ! 	lduwa	[%l7 + %o1] 0x80,	%g3 ASI use replaced by convert2hboot
	array32	%o3,	%g7,	%i1
	subcc	%o7,	0x09E9,	%l0
	edge16n	%i2,	%l3,	%o0
	umulcc	%o2,	%l2,	%g4
	set	0x0C, %i2
	nop	 ! 	swapa	[%l7 + %i2] 0x81,	%g2 ASI use replaced by convert2hboot
	udiv	%o4,	0x0B41,	%i3
	ldd	[%l7 + 0x08],	%f8
	std	%f28,	[%l7 + 0x40]
	nop 	! 	tleu	%icc,	0x0 changed by convert2hboot
	sdivx	%i4,	0x15AE,	%o5
	fmovsa	%xcc,	%f23,	%f12
	nop
	setx	loop_2974,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	fornot1s	%f29,	%f16,	%f11
	movleu	%xcc,	%g1,	%l4
	udivcc	%g6,	0x0E2D,	%l5
loop_2974:
	movgu	%icc,	%o1,	%i6
	sub	%i0,	0x1C96,	%o6
	edge16n	%i5,	%g5,	%l1
	edge8l	%i7,	%g3,	%o3
	wr	%g0,	0x89,	%asi
	nop 	! 	sir	0x1C94 changed by convert2hboot
	fbg	%fcc0,	loop_2975
	fmovrsgz	%i1,	%f13,	%f5
	nop 	! 	tn	%xcc,	0x4 changed by convert2hboot
	fcmps	%fcc1,	%f13,	%f25
loop_2975:
	nop
	set	0x64, %l6
	nop	 ! 	lduwa	[%l7 + %l6] 0x15,	%l6 ASI use replaced by convert2hboot
	movrne	%o7,	%i2,	%l0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x04,	%asi
	nop	 ! 	casa	[%l6] 0x04,	%o0,	%l3 ASI use replaced by convert2hboot
	ba	%icc,	loop_2976
	movvs	%icc,	%l2,	%g4
	and	%g2,	0x02B3,	%o2
	srlx	%i3,	%i4,	%o4
loop_2976:
	edge32ln	%g1,	%l4,	%o5
	wr	%g0,	0xeb,	%asi
	membar	#Sync
	movn	%xcc,	%g6,	%o1
	movrgez	%i0,	%i6,	%i5
	movcc	%icc,	%g5,	%o6
	ldub	[%l7 + 0x39],	%i7
	set	0x60, %i3
	nop	 ! 	lduwa	[%l7 + %i3] 0x04,	%g3 ASI use replaced by convert2hboot
	xor	%o3,	0x042F,	%l1
	fornot1	%f16,	%f10,	%f10
	fbe,a	%fcc1,	loop_2977
	fpadd16	%f8,	%f14,	%f12
	fbge	%fcc2,	loop_2978
	sra	%i1,	%l6,	%o7
loop_2977:
	fbge	%fcc2,	loop_2979
	sth	%g7,	[%l7 + 0x14]
loop_2978:
	nop
	set	0x40, %i0
	nop	 ! 	stda	%f0,	[%l7 + %i0] 0x11 ASI use replaced by convert2hboot
loop_2979:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	tle	%icc,	0x3 changed by convert2hboot
	fmovrsne	%l0,	%f10,	%f4
	set	0x67, %o3
	nop	 ! 	ldstuba	[%l7 + %o3] 0x18,	%i2 ASI use replaced by convert2hboot
	ldub	[%l7 + 0x25],	%o0
	fbne,a	%fcc3,	loop_2980
	fmovsne	%xcc,	%f19,	%f21
	sub	%l2,	0x0760,	%l3
	bl,pn	%icc,	loop_2981
loop_2980:
	fblg	%fcc0,	loop_2982
	addcc	%g2,	%o2,	%g4
	srlx	%i3,	0x0E,	%i4
loop_2981:
	movrlez	%g1,	0x0FB,	%l4
loop_2982:
	edge8ln	%o5,	%o4,	%g6
	nop 	! 	tgu	%xcc,	0x4 changed by convert2hboot
	fcmped	%fcc0,	%f26,	%f20
	set	0x48, %l2
	sta	%f14,	[%l7 + %l2] 0x80
	array32	%o1,	%l5,	%i0
	fmovdvc	%icc,	%f7,	%f14
	fpsub16s	%f25,	%f12,	%f29
	nop 	! 	tg	%icc,	0x3 changed by convert2hboot
	alignaddr	%i5,	%g5,	%o6
	nop 	! 	tn	%xcc,	0x1 changed by convert2hboot
	bl,pt	%xcc,	loop_2983
	stw	%i6,	[%l7 + 0x08]
	fcmps	%fcc1,	%f28,	%f30
	fpsub32	%f12,	%f8,	%f8
loop_2983:
	edge8	%g3,	%o3,	%l1
	addccc	%i1,	%l6,	%i7
	fmovscc	%xcc,	%f8,	%f9
	movcs	%xcc,	%o7,	%l0
	mulx	%i2,	0x1599,	%o0
	for	%f18,	%f30,	%f12
	fabss	%f20,	%f23
	nop 	! 	tne	%icc,	0x4 changed by convert2hboot
	fmovrsgz	%g7,	%f8,	%f17
	nop 	! 	tle	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tsubcc	%l3,	%l2,	%o2 changed by convert2hboot
	edge8	%g4,	%i3,	%g2
	edge32ln	%i4,	%g1,	%o5
	fbug,a	%fcc0,	loop_2984
	fnors	%f5,	%f11,	%f25
	fmovrsgez	%o4,	%f12,	%f18
	xnor	%g6,	0x0E01,	%o1
loop_2984:
	movrlz	%l4,	0x027,	%l5
	movcs	%icc,	%i0,	%i5
	bvs,a	loop_2985
	fsrc1s	%f27,	%f29
	bcs	%xcc,	loop_2986
	nop 	! 	tg	%xcc,	0x5 changed by convert2hboot
loop_2985:
	fcmps	%fcc3,	%f17,	%f3
	sdivx	%o6,	0x05BD,	%i6
loop_2986:
	srlx	%g3,	0x07,	%o3
	fornot1	%f8,	%f14,	%f6
	fmovdgu	%icc,	%f18,	%f16
	stx	%l1,	[%l7 + 0x48]
	srl	%i1,	%g5,	%i7
	ldd	[%l7 + 0x20],	%o6
	ld	[%l7 + 0x64],	%f8
	brlez	%l0,	loop_2987
	movrlez	%l6,	%o0,	%i2
	nop 	! 	tsubcc	%g7,	0x1C47,	%l2 changed by convert2hboot
	nop 	! 	tcs	%icc,	0x4 changed by convert2hboot
loop_2987:
	edge16n	%l3,	%g4,	%o2
	fnot1s	%f18,	%f30
	udiv	%i3,	0x1B9B,	%g2
	brnz,a	%g1,	loop_2988
	movne	%icc,	%i4,	%o4
	sra	%o5,	%o1,	%g6
	nop 	! 	tgu	%icc,	0x7 changed by convert2hboot
loop_2988:
	addc	%l5,	%i0,	%i5
	nop 	! 	tne	%xcc,	0x0 changed by convert2hboot
	fmovdvs	%xcc,	%f16,	%f10
	siam	0x1
	fbuge,a	%fcc1,	loop_2989
	fmovsvc	%icc,	%f27,	%f31
	fcmpgt32	%f24,	%f4,	%o6
	sll	%i6,	%l4,	%o3
loop_2989:
	edge32	%l1,	%g3,	%g5
	fbuge,a	%fcc1,	loop_2990
	nop 	! 	tl	%icc,	0x7 changed by convert2hboot
	edge16ln	%i1,	%i7,	%o7
	sth	%l6,	[%l7 + 0x26]
loop_2990:
	bgu	%xcc,	loop_2991
	fors	%f4,	%f29,	%f22
	fcmple16	%f24,	%f24,	%l0
	movn	%xcc,	%i2,	%o0
loop_2991:
	fmovsleu	%xcc,	%f10,	%f25
	fnot1	%f18,	%f6
	nop 	! 	tneg	%xcc,	0x5 changed by convert2hboot
	sllx	%l2,	0x15,	%g7
	pdist	%f10,	%f20,	%f28
	mulscc	%l3,	%o2,	%i3
	wr	%g0,	0x89,	%asi
	stb	%g4,	[%l7 + 0x43]
	fmovsl	%xcc,	%f1,	%f8
	edge16	%i4,	%o4,	%o5
	bl,a,pt	%xcc,	loop_2992
	bne,a,pn	%icc,	loop_2993
	nop 	! 	te	%icc,	0x5 changed by convert2hboot
	array16	%g1,	%o1,	%g6
loop_2992:
	nop 	! 	tpos	%xcc,	0x2 changed by convert2hboot
loop_2993:
	fmovda	%xcc,	%f24,	%f10
	edge16ln	%i0,	%i5,	%l5
	wr	%g0,	0x89,	%asi
	orn	%o6,	%o3,	%l4
	faligndata	%f22,	%f20,	%f26
	stx	%l1,	[%l7 + 0x30]
	movle	%icc,	%g5,	%i1
	fmovrdgz	%i7,	%f4,	%f0
	fmovsleu	%icc,	%f0,	%f1
	movpos	%icc,	%o7,	%l6
	fmovsvc	%icc,	%f24,	%f28
	fmovdvs	%xcc,	%f14,	%f28
	ld	[%l7 + 0x74],	%f8
	wr	%g0,	0x80,	%asi
	nop 	! 	tcc	%xcc,	0x5 changed by convert2hboot
	sdivcc	%i2,	0x0D08,	%o0
	edge32ln	%l2,	%g7,	%l3
	wr	%g0,	0x88,	%asi
	be,a	%icc,	loop_2994
	movcc	%icc,	%g3,	%i3
	fmovdneg	%xcc,	%f4,	%f6
	bvs	%icc,	loop_2995
loop_2994:
	edge32n	%o2,	%g4,	%i4
	pdist	%f14,	%f2,	%f26
	fpack16	%f30,	%f5
loop_2995:
	fmovsl	%icc,	%f25,	%f15
	andn	%o4,	0x1CE2,	%g2
	fblg,a	%fcc0,	loop_2996
	nop 	! 	tsubcctv	%o5,	%g1,	%o1 changed by convert2hboot
	fmul8ulx16	%f24,	%f4,	%f28
	lduw	[%l7 + 0x2C],	%g6
loop_2996:
	movne	%icc,	%i5,	%l5
	ba,pn	%icc,	loop_2997
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i0,	0x1800,	%i6
	fbue,a	%fcc2,	loop_2998
loop_2997:
	smulcc	%o3,	%o6,	%l1
	ldsw	[%l7 + 0x3C],	%g5
	fbu	%fcc3,	loop_2999
loop_2998:
	bg,pn	%xcc,	loop_3000
	ba	%icc,	loop_3001
	srlx	%i1,	0x08,	%i7
loop_2999:
	fmovsgu	%icc,	%f22,	%f28
loop_3000:
	nop
	wr	%g0,	0x58,	%asi
loop_3001:
	xorcc	%o7,	%l0,	%l6
	smul	%o0,	0x0BC8,	%i2
	array16	%l2,	%l3,	%g7
	or	%g3,	%i3,	%g4
	fmuld8sux16	%f7,	%f4,	%f4
	fmovscc	%icc,	%f0,	%f26
	smul	%i4,	%o2,	%g2
	fmul8x16	%f31,	%f2,	%f12
	fmovsvc	%icc,	%f14,	%f27
	fmul8x16au	%f27,	%f28,	%f2
	brlz,a	%o4,	loop_3002
	flush	%l7 + 0x40
	bshuffle	%f22,	%f4,	%f24
	wr	%g0,	0x88,	%asi
loop_3002:
	movne	%icc,	%o5,	%o1
	edge8ln	%i5,	%l5,	%i0
	bgu	loop_3003
	array32	%g6,	%o3,	%i6
	nop 	! 	tg	%xcc,	0x2 changed by convert2hboot
	fsrc2	%f2,	%f10
loop_3003:
	fmovrdne	%l1,	%f28,	%f14
	fandnot2s	%f30,	%f10,	%f11
	movle	%icc,	%o6,	%i1
	fmovdvc	%icc,	%f1,	%f11
	edge32	%g5,	%i7,	%l4
	movrgez	%o7,	%l6,	%o0
	membar	0x2A
	sra	%i2,	0x17,	%l2
	sdiv	%l3,	0x174B,	%l0
	nop 	! 	tle	%icc,	0x6 changed by convert2hboot
	or	%g3,	0x1C58,	%g7
	movle	%icc,	%i3,	%i4
	bleu,a,pt	%icc,	loop_3004
	smulcc	%g4,	%g2,	%o2
	udiv	%g1,	0x013E,	%o5
	wr	%g0,	0x80,	%asi
loop_3004:
	nop
	setx	loop_3005,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	sethi	0x165D,	%o1
	ldsb	[%l7 + 0x42],	%i5
	fble	%fcc3,	loop_3006
loop_3005:
	nop 	! 	tsubcctv	%l5,	0x1A10,	%i0 changed by convert2hboot
	wr	%g0,	0x18,	%asi
loop_3006:
	andncc	%g6,	%l1,	%i6
	sra	%o6,	%g5,	%i7
	movrne	%i1,	0x2B8,	%l4
	subccc	%l6,	%o0,	%i2
	nop 	! 	tsubcctv	%l2,	%o7,	%l3 changed by convert2hboot
	alignaddrl	%l0,	%g3,	%i3
	fmovdvs	%icc,	%f10,	%f25
	bg,pn	%icc,	loop_3007
	brgz	%g7,	loop_3008
	siam	0x0
	udivcc	%i4,	0x0CD5,	%g4
loop_3007:
	fmovsneg	%icc,	%f14,	%f19
loop_3008:
	andcc	%o2,	%g1,	%g2
	sra	%o5,	0x07,	%o4
	edge8	%i5,	%o1,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	taddcctv	%o3,	%l5,	%g6 changed by convert2hboot
	movrgz	%l1,	0x33D,	%i6
	fnegs	%f9,	%f23
	nop
	set	0x1C, %o7
	lduw	[%l7 + %o7],	%g5
	edge8ln	%i7,	%i1,	%l4
	xorcc	%l6,	0x01E8,	%o6
	fone	%f22
	xnorcc	%i2,	%l2,	%o7
	mulx	%o0,	0x17B4,	%l3
	movcc	%xcc,	%l0,	%g3
	movpos	%xcc,	%i3,	%g7
	fbl	%fcc3,	loop_3009
	movpos	%icc,	%g4,	%i4
	fbule,a	%fcc2,	loop_3010
	xorcc	%g1,	%o2,	%o5
loop_3009:
	fbe,a	%fcc1,	loop_3011
	nop 	! 	tcs	%xcc,	0x2 changed by convert2hboot
loop_3010:
	nop 	! 	sir	0x1B4F changed by convert2hboot
	fbge,a	%fcc2,	loop_3012
loop_3011:
	bvs,a	%xcc,	loop_3013
	movne	%xcc,	%g2,	%i5
	movre	%o1,	0x093,	%i0
loop_3012:
	nop 	! 	ta	%icc,	0x0 changed by convert2hboot
loop_3013:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o4,	%o3,	%g6
	bleu,a	loop_3014
	be,a,pn	%xcc,	loop_3015
	siam	0x5
	fcmpeq32	%f22,	%f2,	%l5
loop_3014:
	xorcc	%l1,	%i6,	%i7
loop_3015:
	edge8ln	%i1,	%g5,	%l6
	bvc	%xcc,	loop_3016
	brgez	%l4,	loop_3017
	ba,a	%xcc,	loop_3018
	subc	%o6,	0x1135,	%l2
loop_3016:
	fornot1s	%f30,	%f14,	%f17
loop_3017:
	fmovrsne	%o7,	%f27,	%f12
loop_3018:
	sth	%o0,	[%l7 + 0x32]
	nop 	! 	tg	%icc,	0x5 changed by convert2hboot
	nop 	! 	tl	%icc,	0x2 changed by convert2hboot
	membar	0x15
	bgu	%icc,	loop_3019
	sub	%i2,	%l0,	%g3
	fmovdvc	%icc,	%f7,	%f11
	orncc	%i3,	0x0BDB,	%g7
loop_3019:
	addcc	%l3,	%i4,	%g4
	siam	0x5
	fbul	%fcc2,	loop_3020
	fornot2s	%f9,	%f6,	%f22
	fbne	%fcc3,	loop_3021
	ldstub	[%l7 + 0x5B],	%o2
loop_3020:
	nop
	set	0x62, %g4
	nop	 ! 	ldsba	[%l7 + %g4] 0x11,	%g1 ASI use replaced by convert2hboot
loop_3021:
	edge16	%o5,	%g2,	%o1
	alignaddr	%i0,	%o4,	%i5
	set	0x68, %g1
	nop	 ! 	stda	%g6,	[%l7 + %g1] 0x18 ASI use replaced by convert2hboot
	bne,a,pn	%icc,	loop_3022
	stw	%l5,	[%l7 + 0x10]
	bcs,a,pt	%xcc,	loop_3023
	mulscc	%l1,	%i6,	%i7
loop_3022:
	andcc	%i1,	%g5,	%l6
	movvs	%icc,	%o3,	%o6
loop_3023:
	bgu,a,pn	%icc,	loop_3024
	srlx	%l2,	0x00,	%o7
	nop 	! 	tgu	%xcc,	0x1 changed by convert2hboot
	nop 	! 	tcc	%icc,	0x2 changed by convert2hboot
loop_3024:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop 	! 	taddcctv	%l4,	0x1DD5,	%i2 changed by convert2hboot
	fnor	%f0,	%f24,	%f2
	nop 	! 	te	%xcc,	0x4 changed by convert2hboot
	nop 	! 	tne	%xcc,	0x7 changed by convert2hboot
	array16	%l0,	%g3,	%i3
	nop 	! 	tleu	%icc,	0x7 changed by convert2hboot
	fornot1s	%f18,	%f23,	%f24
	movcs	%icc,	%g7,	%l3
	mulx	%o0,	%i4,	%o2
	nop 	! 	tn	%icc,	0x4 changed by convert2hboot
	movcs	%xcc,	%g4,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g2,	%g1,	%o1
	fbule,a	%fcc2,	loop_3025
	nop 	! 	tleu	%icc,	0x2 changed by convert2hboot
	bge,a	%xcc,	loop_3026
	nop 	! 	tsubcc	%i0,	0x09B5,	%o4 changed by convert2hboot
loop_3025:
	nop
	set	0x68, %l1
	nop	 ! 	stda	%i4,	[%l7 + %l1] 0x22 ASI use replaced by convert2hboot
	membar	#Sync
loop_3026:
	fzero	%f28
	nop 	! 	tge	%xcc,	0x6 changed by convert2hboot
	or	%l5,	%g6,	%i6
	nop 	! 	tvc	%xcc,	0x0 changed by convert2hboot
	or	%i7,	0x17BB,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%i1,	%l6
	umul	%o3,	%o6,	%g5
	movrne	%o7,	%l4,	%i2
	wr	%g0,	0x27,	%asi
	membar	#Sync
	fmovrdlz	%l2,	%f16,	%f0
	brz,a	%i3,	loop_3027
	orcc	%g7,	%l3,	%o0
	fbne	%fcc3,	loop_3028
	nop 	! 	taddcctv	%i4,	0x099D,	%o2 changed by convert2hboot
loop_3027:
	ldsb	[%l7 + 0x5F],	%g3
	nop 	! 	tne	%icc,	0x7 changed by convert2hboot
loop_3028:
	brnz	%o5,	loop_3029
	subc	%g2,	%g1,	%g4
	nop 	! 	tpos	%xcc,	0x0 changed by convert2hboot
	fbne,a	%fcc3,	loop_3030
loop_3029:
	nop 	! 	taddcc	%o1,	0x0410,	%i0 changed by convert2hboot
	set	0x40, %g7
	nop	 ! 	stda	%f0,	[%l7 + %g7] 0x17 ASI use replaced by convert2hboot
	membar	#Sync
loop_3030:
	popc	%i5,	%l5
	bg,a,pt	%xcc,	loop_3031
	movrlez	%o4,	0x1EA,	%g6
	set	0x74, %g6
	nop	 ! 	ldswa	[%l7 + %g6] 0x0c,	%i7 ASI use replaced by convert2hboot
loop_3031:
	udiv	%i6,	0x17FE,	%i1
	movle	%icc,	%l1,	%o3
	nop 	! 	ta	%xcc,	0x7 changed by convert2hboot
	wr	%g0,	0x0c,	%asi
	subcc	%o6,	%o7,	%g5
	edge16ln	%l4,	%i2,	%l0
	srax	%i3,	%l2,	%l3
	movn	%xcc,	%o0,	%i4
	move	%xcc,	%g7,	%o2
	xorcc	%o5,	%g2,	%g1
	movle	%xcc,	%g4,	%g3
	array32	%i0,	%o1,	%i5
	fnand	%f10,	%f8,	%f30
	movrne	%o4,	%l5,	%g6
	ble,a	loop_3032
	udiv	%i7,	0x17A4,	%i1
	umulcc	%i6,	0x0FEB,	%l1
	movcs	%icc,	%o3,	%o6
loop_3032:
	nop 	! 	tn	%icc,	0x0 changed by convert2hboot
	edge32n	%l6,	%o7,	%g5
	mova	%xcc,	%l4,	%l0
	subccc	%i2,	%i3,	%l3
	sethi	0x1B55,	%l2
	sll	%i4,	0x05,	%o0
	edge16ln	%g7,	%o5,	%o2
	wr	%g0,	0x04,	%asi
	edge8n	%g4,	%g3,	%g1
	edge32ln	%o1,	%i0,	%o4
	subcc	%l5,	0x0FA1,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i7,	%g6,	%i6
	fmovde	%xcc,	%f5,	%f20
	nop 	! 	tge	%xcc,	0x0 changed by convert2hboot
	addc	%i1,	%o3,	%o6
	umul	%l1,	%o7,	%g5
	add	%l6,	0x1DE2,	%l0
	movl	%xcc,	%l4,	%i2
	popc	%l3,	%i3
	andncc	%i4,	%o0,	%l2
	edge16l	%g7,	%o5,	%o2
	edge16	%g2,	%g4,	%g1
	sdiv	%g3,	0x1EBD,	%i0
	udiv	%o4,	0x0E91,	%l5
	edge32l	%o1,	%i5,	%g6
	fcmpne32	%f16,	%f0,	%i7
	movpos	%icc,	%i1,	%i6
	fone	%f2
	sll	%o3,	%o6,	%o7
	movn	%xcc,	%g5,	%l6
	andn	%l1,	%l4,	%i2
	edge16	%l3,	%i3,	%l0
	nop
	setx loop_3033, %l0, %l1
	jmpl %l1, %o0
	edge8	%i4,	%l2,	%g7
	fxors	%f14,	%f16,	%f23
	membar	0x49
loop_3033:
	and	%o2,	0x1912,	%o5
	movge	%icc,	%g4,	%g2
	fbue	%fcc3,	loop_3034
	edge32l	%g3,	%g1,	%i0
	ldx	[%l7 + 0x70],	%o4
	sdivcc	%l5,	0x0EF8,	%o1
loop_3034:
	andcc	%g6,	%i7,	%i5
	ldd	[%l7 + 0x58],	%i6
	sdiv	%o3,	0x17F3,	%o6
	lduw	[%l7 + 0x5C],	%i1
	bcs,a,pn	%xcc,	loop_3035
	fmovdneg	%xcc,	%f4,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x1C],	%f14
loop_3035:
	nop 	! 	tg	%xcc,	0x2 changed by convert2hboot
	fba	%fcc0,	loop_3036
	edge32n	%o7,	%l6,	%l1
	orcc	%g5,	0x066E,	%l4
	edge16	%i2,	%l3,	%l0
loop_3036:
	movge	%xcc,	%o0,	%i3
	wr	%g0,	0x2f,	%asi
	membar	#Sync
	set	0x40, %l5
	nop	 ! 	stda	%f16,	[%l7 + %l5] 0xf8 ASI use replaced by convert2hboot
	membar	#Sync
	edge32l	%l2,	%g7,	%o5
	brlz	%o2,	loop_3037
	sub	%g2,	0x09E4,	%g3
	movle	%xcc,	%g4,	%g1
	subcc	%i0,	%l5,	%o1
loop_3037:
	fcmple16	%f28,	%f10,	%g6
	movvs	%icc,	%o4,	%i7
	nop 	! 	tg	%xcc,	0x3 changed by convert2hboot
	nop 	! 	tl	%icc,	0x4 changed by convert2hboot
	brlz,a	%i5,	loop_3038
	movvc	%icc,	%i6,	%o6
	sra	%i1,	0x0E,	%o7
	fbule,a	%fcc0,	loop_3039
loop_3038:
	ba,a,pn	%xcc,	loop_3040
	ldd	[%l7 + 0x50],	%f20
	nop 	! 	tgu	%icc,	0x3 changed by convert2hboot
loop_3039:
	fmovd	%f30,	%f8
loop_3040:
	fbuge,a	%fcc1,	loop_3041
	addccc	%o3,	%l1,	%l6
	movrlez	%l4,	0x325,	%g5
	bge,pt	%xcc,	loop_3042
loop_3041:
	movcs	%xcc,	%i2,	%l0
	fpadd32s	%f16,	%f26,	%f13
	alignaddrl	%l3,	%i3,	%i4
loop_3042:
	smul	%l2,	0x131F,	%o0
	fbug	%fcc1,	loop_3043
	stx	%g7,	[%l7 + 0x60]
	fmovrsgz	%o5,	%f3,	%f17
	ld	[%l7 + 0x68],	%f18
loop_3043:
	subc	%g2,	%g3,	%g4
	addcc	%g1,	0x1961,	%i0
	edge8	%l5,	%o1,	%g6
	andn	%o2,	%i7,	%i5
	nop 	! 	te	%xcc,	0x3 changed by convert2hboot
	orncc	%o4,	0x0B76,	%i6
	add	%i1,	0x14C1,	%o6
	fcmpne32	%f10,	%f10,	%o3
	fcmpd	%fcc2,	%f18,	%f28
	bne	loop_3044
	bge	loop_3045
	movrne	%l1,	0x1F4,	%o7
	fbuge,a	%fcc3,	loop_3046
loop_3044:
	movrgz	%l4,	0x3D1,	%l6
loop_3045:
	fmovrslez	%g5,	%f19,	%f19
	sethi	0x1ECA,	%i2
loop_3046:
	udivcc	%l3,	0x1B1D,	%l0
	call	loop_3047
	edge32n	%i4,	%l2,	%i3
	fmovrde	%g7,	%f22,	%f6
	wr	%g0,	0x81,	%asi
loop_3047:
	nop
	set	0x08, %l3
	nop	 ! 	stxa	%g2,	[%l7 + %l3] 0x15 ASI use replaced by convert2hboot
	fcmps	%fcc1,	%f27,	%f20
	nop 	! 	te	%icc,	0x1 changed by convert2hboot
	fmovdneg	%xcc,	%f14,	%f19
	fbe	%fcc1,	loop_3048
	stx	%o5,	[%l7 + 0x28]
	alignaddr	%g3,	%g1,	%g4
	nop 	! 	tgu	%xcc,	0x2 changed by convert2hboot
loop_3048:
	nop 	! 	te	%xcc,	0x2 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x0 changed by convert2hboot
	bn,pt	%xcc,	loop_3049
	nop 	! 	tn	%xcc,	0x3 changed by convert2hboot
	fbl	%fcc1,	loop_3050
	edge8ln	%i0,	%l5,	%o1
loop_3049:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x38] %asi,	%f25
loop_3050:
	nop 	! 	tpos	%xcc,	0x6 changed by convert2hboot
	movrgez	%g6,	0x059,	%i7
	fmovsne	%icc,	%f11,	%f0
	set	0x40, %o0
	nop	 ! 	ldda	[%l7 + %o0] 0x0c,	%f16 ASI use replaced by convert2hboot
	bg,a,pt	%icc,	loop_3051
	edge32l	%o2,	%i5,	%i6
	smul	%i1,	%o4,	%o3
	edge32l	%o6,	%l1,	%l4
loop_3051:
	nop
	setx loop_3052, %l0, %l1
	jmpl %l1, %o7
	nop 	! 	tg	%icc,	0x7 changed by convert2hboot
	movre	%l6,	0x0E7,	%g5
	fnegd	%f4,	%f28
loop_3052:
	nop 	! 	tneg	%icc,	0x7 changed by convert2hboot
	edge32ln	%l3,	%i2,	%l0
	nop 	! 	tneg	%icc,	0x2 changed by convert2hboot
	edge32l	%l2,	%i3,	%g7
	movvc	%xcc,	%o0,	%g2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2877
!	Type x   	: 1357
!	Type cti   	: 3052
!	Type f   	: 4465
!	Type i   	: 13249
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x4FF84B67
.word 0x083855C0
.word 0xDB8F8F07
.word 0xAA1FD872
.word 0xA4358DE2
.word 0x3FA789AA
.word 0x332B3376
.word 0x8571085A
.word 0xC3F8A5C0
.word 0x0978AC9E
.word 0x21F19015
.word 0xFE9666AB
.word 0x6BA2D289
.word 0x74B119EB
.word 0x6962A506
.word 0x3AE21806
.word 0x28A52E29
.word 0x5CCF8536
.word 0x6DDF6041
.word 0x84C6E6A7
.word 0xFBCAD3AD
.word 0xAC9B8217
.word 0xECBF490B
.word 0x1BD3DAC5
.word 0xA109FAA2
.word 0x3C6C2D75
.word 0x28821E07
.word 0x08CB0C30
.word 0xC16A8D72
.word 0x033A6341
.word 0x39A9E734
.word 0x77DDFC0B
.word 0x6209877C
.word 0x6C71C290
.word 0x99B28F5E
.word 0x3066B6E6
.word 0x89F849E7
.word 0x528F5D49
.word 0x145BB046
.word 0x33A2546A
.word 0xD87094AC
.word 0xA1F1947F
.word 0x9BEA4828
.word 0x83E141C8
.word 0xC4FFE8C6
.word 0xE0676BE9
.word 0xE2C5B382
.word 0x793E5916
.word 0x9C67B86C
.word 0x7F5F012F
.word 0x784FE423
.word 0xB937E939
.word 0x3FE660DA
.word 0xCFA91C98
.word 0xABF67ADC
.word 0x000D6958
.word 0xE860D54A
.word 0xDA13A436
.word 0xE16572E7
.word 0x08771F1B
.word 0x0D2201DD
.word 0x16579472
.word 0xD5FF7BD0
.word 0x532A1A36
.end
