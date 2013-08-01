/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic_idtlb5.s
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

	fbule,pn	%fcc0,	loop_1
	call	loop_2
	movuge	%fcc3,	0x5A4,	%i2
	nop
	nop
	setx	0x57806086704F8400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
loop_1:
	mulscc	%l5,	0x0398,	%l4
loop_2:
	call	loop_3
	movn	%xcc,	0x685,	%g3
	fbuge,a,pt	%fcc3,	loop_4
	call	loop_5
loop_3:
	call	loop_6
	alignaddr	%o0,	%l2,	%l3
loop_4:
	call	loop_7
loop_5:
	movul	%fcc1,	0x2A2,	%g4
loop_6:
	fornot1	%f6,	%f6,	%f12
	fbue	%fcc2,	loop_8
loop_7:
	orn	%l0,	0x1A52,	%g2
	call	loop_9
	call	loop_10
loop_8:
	wrpr	%g6,	0x10AE,	%pil
	andncc	%i5,	0x0D6D,	%i6
loop_9:
	ldsw	[%l7 + 0x2C],	%g5
loop_10:
	call	loop_11
	call	loop_12
	fandnot1	%f8,	%f0,	%f16
	brgez,a	%i0,	loop_13
loop_11:
	wr	%g0,	0x0,	%pcr	! 	wr	%o1,	0x07F0,	%ccr changed by convert2hboot
loop_12:
	movcc	%xcc,	%o4,	%o2
	call	loop_14
loop_13:
	movu	%fcc3,	0x6EC,	%o7
	rd	%sys_tick_cmpr,	%i7
	edge32l	%i4,	%g7,	%o6
loop_14:
	bmask	%o3,	%i3,	%g1
	set	0x1D, %i1
	nop	 ! 	ldsba	[%l7 + %i1] 0x19,	%o5 ASI use replaced by convert2hboot
	movvc	%xcc,	0x65E,	%i1
	call	loop_15
	array16	%l6,	%i2,	%l5
	call	loop_16
	orncc	%l1,	0x118D,	%l4
loop_15:
	movug	%fcc0,	%g3,	%o0
	set	0x66, %i0
	nop	 ! 	ldsha	[%l7 + %i0] 0x19,	%l2 ASI use replaced by convert2hboot
loop_16:
	movrgez	%l3,	0x119,	%g4
	call	loop_17
	call	loop_18
	nop 	! 	tsubcc	%g2,	0x66,	%l0 changed by convert2hboot
	movrne	%i5,	%g6,	%g5
loop_17:
	mulscc	%i0,	0x1086,	%o1
loop_18:
	nop
	nop
	setx	0x057DEB79B3D2AB82,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f12
	set	0x3C, %i5
	nop	 ! 	ldsba	[%l7 + %i5] 0x80,	%o4 ASI use replaced by convert2hboot
	movvc	%icc,	%i6,	%o7
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x5, 	%fprs changed by convert2hboot
	wrpr	%i4,	0x037B,	%cwp
	rd	%softint,	%g7
	flushw
	movug	%fcc1,	%o2,	%o6
	fmovduge	%fcc1,	%f28,	%f2
	xnor	%i3,	0x0E4D,	%g1
	nop
	setx	0x1F64,	%l0,	%i1
	udivx	%o5,	%i1,	%l6
	array8	%o3,	%l5,	%l1
	call	loop_19
	call	loop_20
	movo	%fcc3,	0x4B5,	%i2
	edge8l	%g3,	%o0,	%l4
loop_19:
	call	loop_21
loop_20:
	movleu	%icc,	%l2,	%l3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	sub	%l0,	0x1B7E,	%g4
loop_21:
	bvs,a	%xcc,	loop_22
	nop
	nop
	setx	0xA40A81BE52F7AD54,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x10472A4359134CF8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f26,	%f16
	call	loop_23
	movule	%fcc3,	%g6,	%i5
loop_22:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	nop
	setx loop_24, %l0, %l1
	jmpl %l1, %g5
loop_23:
	xnorcc	%o1,	%i6,	%o4
	fmovs	%f14,	%f4
	nop
	fitod	%f10,	%f18
	fdtos	%f18,	%f22
loop_24:
	edge16l	%i7,	%i4,	%g7
	xor	%o7,	%o2,	%i3
	or	%g1,	0x037D,	%o6
	fbuge,pt	%fcc2,	loop_25
	bneg,pn	%icc,	loop_26
	stx	%o5,	[%l7 + 0x70]
	wrpr	%l6,	%i1,	%pil
loop_25:
	fbg,a	%fcc3,	loop_27
loop_26:
	call	loop_28
	movule	%fcc3,	0x38A,	%o3
	bpos,pn	%icc,	loop_29
loop_27:
	nop
	setx	loop_30,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x014200001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_28:
	fnands	%f5,	%f24,	%f14
	nop 	! 	tneg	%icc,	0x39 changed by convert2hboot
loop_29:
	call	loop_31
loop_30:
	call	loop_32
	movrgz	%l5,	0x3A3,	%l1
	rdpr	%otherwin,	%i2
loop_31:
	edge16ln	%o0,	%g3,	%l2
loop_32:
	rd	%sys_tick_cmpr,	%l4
	nop
	nop
	setx	0xC39BD955,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f16
	fpack16	%f12,	%f12
	movneg	%xcc,	%l3,	%g2
	nop
	nop
	setx	0xF61C7A26852D7C4F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f8
	call	loop_33
	movne	%icc,	0x54B,	%g4
	fandnot2s	%f21,	%f14,	%f18
	call	loop_34
loop_33:
	srax	%l0,	%g6,	%i0
	call	loop_35
	nop 	! 	rdpr	%tba,	%g5 changed by convert2hboot
loop_34:
	call	loop_36
	call	loop_37
loop_35:
	call	loop_38
	sdivx	%i5,	0x007B,	%o1
loop_36:
	call	loop_39
loop_37:
	nop	!	sir	0x0C6E !! sir is illegal now
loop_38:
	nop 	! 	tvs	%icc,	0x61 changed by convert2hboot
	rd	%pc,	%i6
loop_39:
	brnz,pn	%i7,	loop_40
	nop 	! 	tne	%xcc,	0x38 changed by convert2hboot
	fmovdue	%fcc2,	%f2,	%f22
	call	loop_41
loop_40:
	fble,a	%fcc2,	loop_42
	mova	%fcc2,	0x58B,	%o4
	sll	%g7,	0x13,	%i4
loop_41:
	call	loop_43
loop_42:
	call	loop_44
	call	loop_45
	call	loop_46
loop_43:
	call	loop_47
loop_44:
	call	loop_48
loop_45:
	nop 	! 	tge	%icc,	0x61 changed by convert2hboot
loop_46:
	sllx	%o2,	0x15,	%o7
loop_47:
	fbug,a,pn	%fcc1,	loop_49
loop_48:
	call	loop_50
	call	loop_51
	sub	%g1,	%i3,	%o5
loop_49:
	fmuld8sux16	%f25,	%f16,	%f0
loop_50:
	srlx	%o6,	%i1,	%l6
loop_51:
	rdpr	%pil,	%l5
	call	loop_52
	fbn,pn	%fcc0,	loop_53
	nop	!	sir	0x0E9B !! sir is illegal now
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
loop_52:
	nop 	! 	tsubcctv	%i2,	0x7c,	%o0 changed by convert2hboot
loop_53:
	brlez,pn	%g3,	loop_54
	fnor	%f18,	%f22,	%f6
	fbul,pn	%fcc2,	loop_55
	nop 	! 	tge	%xcc,	0x4e changed by convert2hboot
loop_54:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x04,	%asi changed by convert2hboot
loop_55:
	call	loop_56
	stx	%l4,	[%l7 + 0x08]
	nop 	! 	tvs	%xcc,	0x35 changed by convert2hboot
	movre	%l3,	%o3,	%g4
loop_56:
	lduh	[%l7 + 0x74],	%g2
	call	loop_57
	call	loop_58
	ble,a	%icc,	loop_59
	edge32	%g6,	%l0,	%i0
loop_57:
	movlg	%fcc1,	%i5,	%g5
loop_58:
	be,a	%xcc,	loop_60
loop_59:
	nop 	! 	tne	%xcc,	0x47 changed by convert2hboot
	andn	%o1,	0x1D57,	%i7
	call	loop_61
loop_60:
	call	loop_62
	ba,a	%icc,	loop_63
	movne	%fcc0,	%i6,	%g7
loop_61:
	nop 	! 	tneg	%xcc,	0x4c changed by convert2hboot
loop_62:
	wrpr	%o4,	0x0B9C,	%pil
loop_63:
	sra	%o2,	%i4,	%o7
	nop 	! 	tvc	%icc,	0x57 changed by convert2hboot
	nop
	set	0x10, %l1
	sth	%g1,	[%l7 + %l1]
	xor	%o5,	%o6,	%i1
	movrlz	%l6,	0x10F,	%l5
	call	loop_64
	popc	%i3,	%l1
	array16	%o0,	%g3,	%i2
	st	%f28,	[%l7 + 0x0C]
loop_64:
	wrpr	%l2,	0x121C,	%cwp
	movne	%fcc3,	%l3,	%o3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xBB9, 	%hsys_tick_cmpr changed by convert2hboot
	nop
	set	0x14, %i3
	lduw	[%l7 + %i3],	%g4
	nop
	nop
	setx	0x865315D3042FC00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	rdpr	%pil,	%g6
	nop
	set	0x40, %l6
	ldstub	[%l7 + %l6],	%g2
	popc	0x130A,	%l0
	call	loop_65
	nop 	! 	taddcctv	%i0,	0x3d,	%g5 changed by convert2hboot
	andn	%o1,	0x144F,	%i5
	fbl	%fcc1,	loop_66
loop_65:
	call	loop_67
	movl	%icc,	%i7,	%i6
	fbo,pn	%fcc2,	loop_68
loop_66:
	call	loop_69
loop_67:
	fmovdvc	%xcc,	%f4,	%f14
	call	loop_70
loop_68:
	call	loop_71
loop_69:
	mova	%xcc,	%o4,	%g7
	call	loop_72
loop_70:
	call	loop_73
loop_71:
	orcc	%i4,	%o2,	%g1
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x0c,	%asi changed by convert2hboot
loop_72:
	bleu,a	%icc,	loop_74
loop_73:
	fmovsge	%icc,	%f12,	%f24
	call	loop_75
	nop
	nop
	setx	0x305A7C00,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
loop_74:
	fmovsneg	%xcc,	%f26,	%f4
	movlg	%fcc3,	0x20B,	%o7
loop_75:
	fmovrdgez	%o6,	%f18,	%f30
	call	loop_76
	call	loop_77
	movue	%fcc2,	0x489,	%l6
	call	loop_78
loop_76:
	nop
	setx	0x0046,	%l0,	%i3
	sdiv	%l5,	%i3,	%i1
loop_77:
	nop
	set	0x74, %o4
	swap	[%l7 + %o4],	%o0
	movn	%xcc,	%l1,	%i2
loop_78:
	call	loop_79
	rd	%asi,	%l2
	call	loop_80
	movule	%fcc3,	%l3,	%g3
loop_79:
	movrne	%o3,	0x1A7,	%g4
	call	loop_81
loop_80:
	srax	%g6,	%l4,	%g2
	and	%i0,	0x13A1,	%l0
	sub	%o1,	0x12F4,	%g5
loop_81:
	movu	%fcc2,	0x211,	%i5
	fsrc2s	%f23,	%f4
	wr	%g0,	0x0,	%pcr	! 	wr	%i7,	0x019E,	%softint changed by convert2hboot
	rdpr	%cansave,	%i6
	call	loop_82
	fornot2s	%f7,	%f26,	%f10
	movul	%fcc1,	0x1D0,	%g7
	fpack16	%f24,	%f31
loop_82:
	movneg	%xcc,	0x2E8,	%i4
	nop 	! 	tl	%xcc,	0x38 changed by convert2hboot
	array8	%o2,	%o4,	%o5
	call	loop_83
	rdpr	%wstate,	%g1
	call	loop_84
	umulcc	%o6,	%l6,	%o7
loop_83:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x11,	%asi changed by convert2hboot
loop_84:
	call	loop_85
	bpos	%icc,	loop_86
	call	loop_87
	call	loop_88
loop_85:
	array16	%l5,	%i1,	%l1
loop_86:
	call	loop_89
loop_87:
	nop 	! 	tle	%icc,	0x3d changed by convert2hboot
loop_88:
	nop
	nop
	setx	0x43111D7CCFCD0FF0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x337F9DB5413C86BE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f14,	%f30
	call	loop_90
loop_89:
	nop 	! 	te	%xcc,	0x69 changed by convert2hboot
	addccc	%i2,	%o0,	%l2
	membar	0x06
loop_90:
	nop 	! 	tgu	%icc,	0x66 changed by convert2hboot
	sllx	%l3,	%g3,	%g4
	ble	%xcc,	loop_91
	rd	%ccr,	%g6
	wrpr	%o3,	%l4,	%pil
	call	loop_92
loop_91:
	rd	%y,	%i0
	call	loop_93
	fmovdpos	%icc,	%f8,	%f28
loop_92:
	call	loop_94
	fbo,a,pt	%fcc3,	loop_95
loop_93:
	brgz,a	%g2,	loop_96
	call	loop_97
loop_94:
	call	loop_98
loop_95:
	call	loop_99
loop_96:
	call	loop_100
loop_97:
	movule	%fcc1,	%l0,	%g5
loop_98:
	call	loop_101
loop_99:
	subc	%o1,	%i5,	%i6
loop_100:
	call	loop_102
	movge	%icc,	%i7,	%i4
loop_101:
	nop
	setx	0x0708,	%l0,	%o4
	udiv	%o2,	%o4,	%g7
	call	loop_103
loop_102:
	fbug,a,pt	%fcc0,	loop_104
	nop 	! 	tpos	%icc,	0x49 changed by convert2hboot
	call	loop_105
loop_103:
	ldx	[%l7 + 0x70],	%g1
loop_104:
	popc	%o6,	%o5
	movrgz	%o7,	0x2CB,	%i3
loop_105:
	ba	%xcc,	loop_106
	edge16ln	%l6,	%l5,	%i1
	movug	%fcc3,	0x224,	%l1
	movg	%fcc3,	0x2BA,	%i2
loop_106:
	call	loop_107
	rd	%tick_cmpr,	%o0
	call	loop_108
	call	loop_109
loop_107:
	call	loop_110
	nop
	nop
	setx	0x314250AA81CF70ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x1DC65C0BD4D0DB62,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f6,	%f12
loop_108:
	alignaddr	%l2,	%l3,	%g4
loop_109:
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x6, 	%fprs changed by convert2hboot
loop_110:
	nop 	! 	rdhpr	%htba,	%o3 changed by convert2hboot
	call	loop_111
	movrne	%g3,	0x167,	%l4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x5B9, 	%hsys_tick_cmpr changed by convert2hboot
	popc	0x0979,	%g5
loop_111:
	call	loop_112
	fmovsgu	%icc,	%f7,	%f24
	call	loop_113
	fmovsne	%fcc0,	%f22,	%f25
loop_112:
	nop 	! 	tle	%icc,	0x37 changed by convert2hboot
	movrgez	%o1,	0x00A,	%i5
loop_113:
	nop 	! 	tneg	%icc,	0x76 changed by convert2hboot
	fmovdne	%fcc1,	%f12,	%f20
	movrlz	%g2,	%i6,	%i4
	call	loop_114
	call	loop_115
	edge16ln	%o2,	%i7,	%o4
	call	loop_116
loop_114:
	bl,a,pn	%icc,	loop_117
loop_115:
	wrpr	%g1,	0x1B9C,	%cwp
	call	loop_118
loop_116:
	nop 	! 	tcs	%icc,	0x5e changed by convert2hboot
loop_117:
	nop 	! 	tne	%xcc,	0x78 changed by convert2hboot
	call	loop_119
loop_118:
	call	loop_120
	call	loop_121
	call	loop_122
loop_119:
	nop
	setx	0x0EE3,	%l0,	%o5
	sdiv	%o6,	%o5,	%g7
loop_120:
	orncc	%i3,	0x0A21,	%l6
loop_121:
	nop
	set	0x72, %l0
	stb	%l5,	[%l7 + %l0]
loop_122:
	call	loop_123
	movrgez	%i1,	%l1,	%i2
	fands	%f8,	%f17,	%f4
	movrlez	%o7,	%l2,	%o0
loop_123:
	fmovdleu	%xcc,	%f10,	%f4
	fmovduge	%fcc0,	%f22,	%f24
	call	loop_124
	call	loop_125
	call	loop_126
	movvs	%xcc,	%l3,	%g4
loop_124:
	call	loop_127
loop_125:
	wr	%g0,	0x0,	%pcr	! 	wr	%g6,	%g3,	%sys_tick changed by convert2hboot
loop_126:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x87C, 	%hsys_tick_cmpr changed by convert2hboot
	call	loop_128
loop_127:
	nop
	set	0x12, %o2
	ldsh	[%l7 + %o2],	%i0
	call	loop_129
	wr	%g0,	0x0,	%pcr	! 	wr	%l0,	0x13CF,	%set_softint changed by convert2hboot
loop_128:
	fbge	%fcc0,	loop_130
	call	loop_131
loop_129:
	call	loop_132
	call	loop_133
loop_130:
	call	loop_134
loop_131:
	call	loop_135
loop_132:
	movge	%xcc,	0x0E8,	%g5
loop_133:
	call	loop_136
loop_134:
	call	loop_137
loop_135:
	addc	%i5,	%o1,	%i6
	nop
	nop
	setx	0x2F8A23FED51C25DE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xB483D598F2083733,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f20,	%f12
loop_136:
	call	loop_138
loop_137:
	addcc	%g2,	%o2,	%i7
	call	loop_139
	movcc	%icc,	0x51F,	%o4
loop_138:
	nop 	! 	tne	%xcc,	0x39 changed by convert2hboot
	call	loop_140
loop_139:
	nop 	! 	tn	%xcc,	0x79 changed by convert2hboot
	fmovdvc	%xcc,	%f6,	%f18
	sth	%i4,	[%l7 + 0x28]
loop_140:
	ldsh	[%l7 + 0x3A],	%o6
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	sll	%o5,	0x1F,	%g7
	call	loop_141
	nop 	! 	tvc	%icc,	0x46 changed by convert2hboot
	call	loop_142
	call	loop_143
loop_141:
	fabsd	%f4,	%f10
	call	loop_144
loop_142:
	call	loop_145
loop_143:
	ba,pt	%xcc,	loop_146
	popc	0x0D7C,	%i3
loop_144:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_145:
	call	loop_147
loop_146:
	nop
	nop
	setx	0x4BED3BC2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x903CB2AB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f21,	%f9
	lduh	[%l7 + 0x10],	%l6
	movue	%fcc0,	%g1,	%i1
loop_147:
	call	loop_148
	call	loop_149
	call	loop_150
	ble,a,pt	%icc,	loop_151
loop_148:
	nop 	! 	tne	%xcc,	0x4e changed by convert2hboot
loop_149:
	edge32n	%l1,	%i2,	%o7
loop_150:
	xor	%l5,	%l2,	%o0
loop_151:
	call	loop_152
	movrgez	%g4,	%l3,	%g6
	andncc	%g3,	0x0ECD,	%l4
	call	loop_153
loop_152:
	fnands	%f21,	%f1,	%f9
	call	loop_154
	call	loop_155
loop_153:
	orn	%i0,	0x1156,	%l0
	wrpr 	%g0, 	0x0, 	%gl
loop_154:
	call	loop_156
loop_155:
	call	loop_157
	call	loop_158
	call	loop_159
loop_156:
	ldd	[%l7 + 0x10],	%o2
loop_157:
	fbue,pt	%fcc0,	loop_160
loop_158:
	addcc	%o1,	0x1A65,	%i5
loop_159:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x0c,	%asi changed by convert2hboot
loop_160:
	nop
	set	0x54, %g2
	lduw	[%l7 + %g2],	%g2
	nop 	! 	taddcc	%o4,	%i7,	%o6 changed by convert2hboot
	call	loop_161
	nop 	! 	tsubcc	%i4,	%o5,	%g7 changed by convert2hboot
	nop
	set	0x38, %i7
	ldx	[%l7 + %i7],	%i3
	nop
	set	0x0A, %o5
	ldsh	[%l7 + %o5],	%g1
loop_161:
	umul	%i1,	%l6,	%i2
	fmul8sux16	%f18,	%f8,	%f4
	call	loop_162
	call	loop_163
	orn	%o7,	%l5,	%l2
	wrpr 	%g0, 	0x2, 	%gl
loop_162:
	call	loop_164
loop_163:
	call	loop_165
	sub	%l1,	0x1E26,	%l3
	bmask	%g3,	%g6,	%i0
loop_164:
	movcc	%xcc,	0x669,	%l0
loop_165:
	andn	%g5,	%o3,	%o1
	fbe,a,pt	%fcc2,	loop_166
	brz,a	%i5,	loop_167
	fmovde	%xcc,	%f20,	%f2
	call	loop_168
loop_166:
	fors	%f0,	%f14,	%f9
loop_167:
	or	%i6,	%l4,	%o2
	nop
	nop
	setx	0xF69F980843B61ED1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f22
loop_168:
	subcc	%g2,	0x1801,	%i7
	edge8ln	%o6,	%o4,	%i4
	call	loop_169
	call	loop_170
	fxors	%f20,	%f22,	%f15
	call	loop_171
loop_169:
	fpadd16s	%f9,	%f31,	%f12
loop_170:
	bgu	%icc,	loop_172
	call	loop_173
loop_171:
	edge16n	%g7,	%i3,	%o5
	alignaddr	%g1,	%i1,	%l6
loop_172:
	ldd	[%l7 + 0x48],	%f6
loop_173:
	fbg	%fcc0,	loop_174
	sllx	%o7,	0x17,	%i2
	call	loop_175
	fmovdvs	%icc,	%f14,	%f14
loop_174:
	fnot1	%f18,	%f16
	ba,pt	%xcc,	loop_176
loop_175:
	fxnors	%f22,	%f29,	%f17
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x7, 	%fprs changed by convert2hboot
	fmovsvs	%icc,	%f0,	%f8
loop_176:
	fbg,pn	%fcc3,	loop_177
	nop 	! 	te	%xcc,	0x4e changed by convert2hboot
	call	loop_178
	call	loop_179
loop_177:
	call	loop_180
	umul	%o0,	%l1,	%l3
loop_178:
	fmovdug	%fcc0,	%f22,	%f30
loop_179:
	sllx	%g4,	0x1E,	%g3
loop_180:
	call	loop_181
	call	loop_182
	call	loop_183
	movug	%fcc2,	%g6,	%l0
loop_181:
	fandnot2s	%f7,	%f12,	%f18
loop_182:
	movu	%fcc0,	0x739,	%g5
loop_183:
	edge16l	%i0,	%o1,	%o3
	nop
	set	0x70, %i6
	std	%f0,	[%l7 + %i6]
	call	loop_184
	nop
	nop
	setx	0xE78E3CB3A06B2400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	nop 	! 	tn	%xcc,	0x49 changed by convert2hboot
	edge16	%i5,	%l4,	%i6
loop_184:
	nop 	! 	tleu	%icc,	0x39 changed by convert2hboot
	fpsub16	%f6,	%f18,	%f4
	array16	%g2,	%i7,	%o2
	edge32	%o6,	%o4,	%g7
	call	loop_185
	call	loop_186
	nop 	! 	tgu	%xcc,	0x4d changed by convert2hboot
	edge8ln	%i4,	%o5,	%g1
loop_185:
	call	loop_187
loop_186:
	umulcc	%i3,	0x0FD7,	%l6
	fcmpeq32	%f10,	%f24,	%o7
	srl	%i1,	%l2,	%i2
loop_187:
	fmuld8sux16	%f22,	%f7,	%f10
	fmovda	%fcc0,	%f12,	%f0
	call	loop_188
	call	loop_189
	fnot1	%f4,	%f24
	call	loop_190
loop_188:
	call	loop_191
loop_189:
	fbule	%fcc1,	loop_192
	call	loop_193
loop_190:
	movg	%fcc1,	0x581,	%l5
loop_191:
	fnot1s	%f21,	%f8
loop_192:
	call	loop_194
loop_193:
	array32	%o0,	%l1,	%g4
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x80,	%asi changed by convert2hboot
loop_194:
	rdpr	%wstate,	%g6
	call	loop_195
	wrpr	%l3,	0x1B8F,	%cwp
	sethi	0x05B2,	%l0
	orn	%g5,	%o1,	%i0
loop_195:
	fornot1s	%f24,	%f16,	%f14
	xorcc	%i5,	%o3,	%l4
	std	%g2,	[%l7 + 0x38]
	movcs	%icc,	0x3C4,	%i6
	movul	%fcc0,	0x50B,	%i7
	for	%f22,	%f18,	%f30
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x80,	%asi changed by convert2hboot
	add	%o2,	0x0D27,	%o4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	movcs	%xcc,	0x408,	%g1
	wr	%g0,	0x0,	%pcr	! 	wr	%i3,	0x1904,	%ccr changed by convert2hboot
	addcc	%l6,	0x080A,	%o7
	call	loop_196
	nop 	! 	tcs	%xcc,	0x47 changed by convert2hboot
	fandnot2s	%f5,	%f21,	%f22
	call	loop_197
loop_196:
	bleu,pt	%xcc,	loop_198
	nop 	! 	tcs	%xcc,	0x47 changed by convert2hboot
	smul	%o5,	%l2,	%i2
loop_197:
	call	loop_199
loop_198:
	edge16l	%i1,	%o0,	%l5
	wrpr	%l1,	%g4,	%pil
	movn	%xcc,	0x478,	%g6
loop_199:
	smul	%l3,	%g3,	%l0
	edge16n	%o1,	%g5,	%i0
	bneg,pn	%xcc,	loop_200
	brz,a	%i5,	loop_201
	call	loop_202
	fbn,a	%fcc0,	loop_203
loop_200:
	nop
	set	0x58, %g3
	std	%l4,	[%l7 + %g3]
loop_201:
	call	loop_204
loop_202:
	bvs,pn	%xcc,	loop_205
loop_203:
	mova	%fcc0,	0x114,	%g2
	fpadd32s	%f12,	%f31,	%f14
loop_204:
	movrgz	%o3,	%i6,	%i7
loop_205:
	call	loop_206
	movrgz	%o2,	%o6,	%g7
	fabss	%f18,	%f12
	call	loop_207
loop_206:
	movgu	%xcc,	0x454,	%o4
	st	%f6,	[%l7 + 0x6C]
	brlz,pt	%g1,	loop_208
loop_207:
	call	loop_209
	call	loop_210
	nop
	setx	loop_211,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x001200001406,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_208:
	rdpr	%pil,	%i3
loop_209:
	movn	%icc,	%i4,	%l6
loop_210:
	fmovrsgz	%o5,	%f11,	%f27
loop_211:
	fbg,a,pt	%fcc2,	loop_212
	or	%l2,	%i2,	%o7
	movneg	%xcc,	0x24A,	%i1
	brgz,a	%l5,	loop_213
loop_212:
	edge16	%o0,	%l1,	%g4
	call	loop_214
	call	loop_215
loop_213:
	nop
	set	0x18, %i4
	swap	[%l7 + %i4],	%g6
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%g3
loop_214:
	sth	%l3,	[%l7 + 0x28]
loop_215:
	mulscc	%o1,	%g5,	%l0
	nop
	set	0x58, %l2
	std	%f4,	[%l7 + %l2]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	fpsub32s	%f22,	%f6,	%f10
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f30
	fxtod	%f30,	%f0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr	%g0,	0x0,	%pcr	! 	wr 	%l0, 	0x36A, 	%tick_cmpr changed by convert2hboot
	movne	%icc,	0x15E,	%o3
	movlg	%fcc2,	0x78C,	%i6
	array16	%i7,	%i5,	%o2
	fcmpd	%fcc0,	%f2,	%f12
	fxnors	%f30,	%f28,	%f18
	fmovdu	%fcc0,	%f4,	%f30
	movrlez	%o6,	%o4,	%g1
	call	loop_216
	fbule,pn	%fcc2,	loop_217
	call	loop_218
	call	loop_219
loop_216:
	movule	%fcc0,	%g7,	%i3
loop_217:
	sra	%i4,	%o5,	%l6
loop_218:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x18,	%asi changed by convert2hboot
loop_219:
	nop	!	sir	0x01D4 !! sir is illegal now
	nop 	! 	tvc	%icc,	0x55 changed by convert2hboot
	andn	%o7,	%i1,	%l5
	call	loop_220
	fornot2	%f30,	%f4,	%f2
	fpsub16	%f18,	%f28,	%f0
	ble,a,pt	%xcc,	loop_221
loop_220:
	call	loop_222
	fble	%fcc1,	loop_223
	call	loop_224
loop_221:
	movre	%o0,	%l2,	%l1
loop_222:
	bvs,a,pn	%xcc,	loop_225
loop_223:
	srax	%g4,	%g6,	%l3
loop_224:
	nop 	! 	tcc	%xcc,	0x72 changed by convert2hboot
	nop
	nop
	setx	0xF65B2F0007B7FA36,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xC12B53B8D80CB8F0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f14,	%f16
loop_225:
	call	loop_226
	array16	%g3,	%o1,	%l0
	fbu	%fcc2,	loop_227
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f8
	fxtod	%f8,	%f20
loop_226:
	orcc	%i0,	%g5,	%g2
	fands	%f16,	%f15,	%f11
loop_227:
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x6, 	%fprs changed by convert2hboot
	call	loop_228
	rd	%asi,	%i7
	andncc	%o3,	0x1921,	%i5
	call	loop_229
loop_228:
	movn	%icc,	%o6,	%o2
	call	loop_230
	bpos	%xcc,	loop_231
loop_229:
	movrlz	%o4,	0x0A5,	%g7
	nop
	setx	0x1559,	%l0,	%g1
	sdiv	%i3,	%g1,	%i4
loop_230:
	call	loop_232
loop_231:
	call	loop_233
	call	loop_234
	call	loop_235
loop_232:
	nop 	! 	tgu	%xcc,	0x3a changed by convert2hboot
loop_233:
	fmovrslez	%l6,	%f20,	%f14
loop_234:
	call	loop_236
loop_235:
	nop
	setx	0x1FB5,	%l0,	%o7
	sdiv	%i2,	%o7,	%i1
	edge8n	%l5,	%o0,	%l2
	fbuge,a,pn	%fcc1,	loop_237
loop_236:
	fcmpeq16	%f16,	%f8,	%l1
	nop 	! 	tne	%xcc,	0x64 changed by convert2hboot
	movul	%fcc2,	%o5,	%g4
loop_237:
	call	loop_238
	smulcc	%l3,	%g3,	%o1
	call	loop_239
	fpadd16s	%f20,	%f14,	%f20
loop_238:
	nop
	setx	0x16A1,	%l0,	%i0
	sdiv	%g6,	%i0,	%g5
	wrpr	%g2,	%l0,	%cwp
loop_239:
	fxnor	%f10,	%f0,	%f4
	call	loop_240
	movpos	%icc,	%i6,	%l4
	nop
	set	0x34, %o3
	flush	%l7 + %o3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
loop_240:
	edge32	%i7,	%i5,	%o6
	nop
	setx loop_241, %l0, %l1
	jmpl %l1, %o2
	fbue,a	%fcc0,	loop_242
	call	loop_243
	call	loop_244
loop_241:
	fbg	%fcc2,	loop_245
loop_242:
	call	loop_246
loop_243:
	call	loop_247
loop_244:
	nop
	setx	0x1CD3,	%l0,	%o4
	sdiv	%g7,	%o4,	%i3
loop_245:
	nop
	setx loop_248, %l0, %l1
	jmpl %l1, %i4
loop_246:
	ba	%icc,	loop_249
loop_247:
	call	loop_250
	call	loop_251
loop_248:
	call	loop_252
loop_249:
	call	loop_253
loop_250:
	ldsw	[%l7 + 0x50],	%g1
loop_251:
	movlg	%fcc0,	%l6,	%i2
loop_252:
	subc	%o7,	%i1,	%o0
loop_253:
	nop 	! 	tg	%icc,	0x4b changed by convert2hboot
	call	loop_254
	call	loop_255
	call	loop_256
	nop 	! 	tgu	%xcc,	0x70 changed by convert2hboot
loop_254:
	fmovsleu	%icc,	%f23,	%f1
loop_255:
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x7, 	%fprs changed by convert2hboot
loop_256:
	fpsub32	%f8,	%f12,	%f16
	call	loop_257
	movneg	%xcc,	%l2,	%o5
	fxors	%f23,	%f20,	%f10
	movleu	%icc,	%l3,	%g4
loop_257:
	sra	%o1,	%g3,	%g6
	add	%g5,	0x1E25,	%g2
	wr	%g0,	0x0,	%pcr	! 	wr	%l0,	0x1D9C,	%softint changed by convert2hboot
	fbule,a,pt	%fcc0,	loop_258
	call	loop_259
	call	loop_260
	mulscc	%i6,	%i0,	%o3
loop_258:
	movvs	%icc,	%l4,	%i7
loop_259:
	call	loop_261
loop_260:
	nop
	set	0x08, %g4
	swap	[%l7 + %g4],	%o6
	bvc	%xcc,	loop_262
	call	loop_263
loop_261:
	fpadd32	%f6,	%f16,	%f0
	call	loop_264
loop_262:
	edge16ln	%i5,	%g7,	%o2
loop_263:
	call	loop_265
	nop 	! 	tgu	%icc,	0x69 changed by convert2hboot
loop_264:
	flush	%l7 + 0x2C
	call	loop_266
loop_265:
	bne,pn	%icc,	loop_267
	movle	%fcc3,	%o4,	%i3
	stb	%i4,	[%l7 + 0x0C]
loop_266:
	call	loop_268
loop_267:
	swap	[%l7 + 0x58],	%l6
	call	loop_269
	movle	%xcc,	0x0D3,	%i2
loop_268:
	nop
	setx	0x06A5,	%l0,	%o7
	sdivx	%g1,	%o7,	%o0
loop_269:
	call	loop_270
	call	loop_271
	movcs	%icc,	%l5,	%i1
	rd	%y,	%l1
loop_270:
	rdpr	%pil,	%l2
loop_271:
	movuge	%fcc3,	%l3,	%g4
	fcmple16	%f24,	%f10,	%o1
	fcmpgt16	%f8,	%f14,	%o5
	addcc	%g3,	0x0AA3,	%g6
	call	loop_272
	call	loop_273
	subcc	%g2,	%g5,	%i6
	flush	%l7 + 0x38
loop_272:
	movl	%fcc1,	0x18A,	%l0
loop_273:
	edge32ln	%i0,	%o3,	%i7
	fmovslg	%fcc2,	%f10,	%f29
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	call	loop_274
	ldd	[%l7 + 0x38],	%o6
	call	loop_275
	call	loop_276
loop_274:
	call	loop_277
	brlz,a	%i5,	loop_278
loop_275:
	mulx	%g7,	%o2,	%i3
loop_276:
	wrpr	%o4,	0x0C84,	%pil
loop_277:
	edge32	%l6,	%i2,	%g1
loop_278:
	fcmpne32	%f20,	%f4,	%i4
	call	loop_279
	nop
	setx	0x0B41,	%l0,	%o0
	sdiv	%o7,	%o0,	%l5
	set	0x24, %i2
	lda	[%l7 + %i2] 0x18,	%f20
loop_279:
	stb	%i1,	[%l7 + 0x3A]
	addccc	%l1,	0x06CA,	%l3
	movpos	%xcc,	0x6C7,	%g4
	bmask	%l2,	%o5,	%o1
	movre	%g3,	0x040,	%g6
	mulscc	%g5,	0x19E5,	%g2
	call	loop_280
	call	loop_281
	call	loop_282
	fnot1	%f6,	%f26
loop_280:
	call	loop_283
loop_281:
	nop 	! 	tvs	%icc,	0x3a changed by convert2hboot
loop_282:
	call	loop_284
	fmul8x16	%f3,	%f28,	%f16
loop_283:
	sll	%l0,	%i6,	%o3
	sll	%i7,	%l4,	%i0
loop_284:
	call	loop_285
	nop 	! 	rdhpr	%hpstate,	%o6 changed by convert2hboot
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x2a,	%asi changed by convert2hboot
loop_285:
	smulcc	%o2,	0x06B7,	%i5
	call	loop_286
	call	loop_287
	nop 	! 	wrpr	%i3,	%o4,	%tick changed by convert2hboot
	call	loop_288
loop_286:
	call	loop_289
loop_287:
	call	loop_290
	call	loop_291
loop_288:
	nop 	! 	taddcc	%i2,	%l6,	%i4 changed by convert2hboot
loop_289:
	call	loop_292
loop_290:
	call	loop_293
loop_291:
	call	loop_294
	call	loop_295
loop_292:
	nop
	set	0x42, %o1
	lduh	[%l7 + %o1],	%o7
loop_293:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0xeb,	%asi changed by convert2hboot
	membar	#Sync
loop_294:
	call	loop_296
loop_295:
	ba,pt	%icc,	loop_297
	rd	%fprs,	%g1
	move	%fcc3,	0x704,	%i1
loop_296:
	call	loop_298
loop_297:
	fpack16	%f6,	%f22
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x88,	%asi changed by convert2hboot
loop_298:
	array16	%l3,	%g4,	%l2
	call	loop_299
	nop 	! 	ta	%xcc,	0x5d changed by convert2hboot
	call	loop_300
	array32	%l1,	%o5,	%g3
loop_299:
	fexpand	%f16,	%f14
	fxnors	%f17,	%f24,	%f22
loop_300:
	rd	%fprs,	%g6
	nop 	! 	tl	%icc,	0x5a changed by convert2hboot
	set	0x40, %o6
	nop	 ! 	stba	%o1,	[%l7 + %o6] 0xeb ASI use replaced by convert2hboot
	membar	#Sync
	movleu	%xcc,	0x672,	%g5
	mulscc	%g2,	%i6,	%l0
	movne	%xcc,	%i7,	%l4
	fmul8x16al	%f28,	%f4,	%f20
	call	loop_301
	call	loop_302
	movrne	%i0,	0x3C9,	%o3
	subccc	%o6,	%o2,	%g7
loop_301:
	subcc	%i5,	%o4,	%i2
loop_302:
	nop
	nop
	setx	0xE0794000,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	sra	%i3,	0x06,	%i4
	call	loop_303
	call	loop_304
	call	loop_305
	nop 	! 	tle	%icc,	0x38 changed by convert2hboot
loop_303:
	nop
	set	0x110, %o0
	nop	 ! 	stxa	%o7,	[%g0 + %o0] 0x21 ASI use replaced by convert2hboot
loop_304:
	call	loop_306
loop_305:
	call	loop_307
	call	loop_308
	call	loop_309
loop_306:
	call	loop_310
loop_307:
	wr	%g0,	0x0,	%pcr	! 	wr	%l6,	%o0,	%sys_tick changed by convert2hboot
loop_308:
	xor	%g1,	%i1,	%l3
loop_309:
	nop 	! 	tsubcctv	%g4,	0x45,	%l5 changed by convert2hboot
loop_310:
	move	%icc,	0x016,	%l1
	call	loop_311
	call	loop_312
	nop 	! 	tneg	%xcc,	0x3f changed by convert2hboot
	nop 	! 	tge	%xcc,	0x5d changed by convert2hboot
loop_311:
	nop 	! 	tcc	%xcc,	0x72 changed by convert2hboot
loop_312:
	movrgez	%o5,	0x33A,	%l2
	movg	%icc,	%g6,	%o1
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x7, 	%fprs changed by convert2hboot
	call	loop_313
	fmovdneg	%xcc,	%f16,	%f0
	movvc	%icc,	0x5BF,	%g3
	ble,a	%icc,	loop_314
loop_313:
	call	loop_315
	call	loop_316
	call	loop_317
loop_314:
	call	loop_318
loop_315:
	movre	%i6,	%l0,	%l4
loop_316:
	nop 	! 	tg	%icc,	0x65 changed by convert2hboot
loop_317:
	umulcc	%i0,	%i7,	%o3
loop_318:
	call	loop_319
	movg	%xcc,	0x697,	%o6
	call	loop_320
	movvc	%xcc,	%g7,	%o2
loop_319:
	movpos	%icc,	0x15E,	%i5
	nop 	! 	tl	%icc,	0x46 changed by convert2hboot
loop_320:
	xor	%i2,	%i3,	%o4
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f18
	fxtod	%f18,	%f16
	nop
	set	0x64, %l4
	swap	[%l7 + %l4],	%o7
	call	loop_321
	call	loop_322
	fmovrde	%i4,	%f10,	%f30
	nop 	! 	ta	%xcc,	0x7c changed by convert2hboot
loop_321:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x75B, 	%hsys_tick_cmpr changed by convert2hboot
loop_322:
	fmovscs	%icc,	%f23,	%f20
	call	loop_323
	call	loop_324
	membar	0x28
	nop
	fitos	%f2,	%f4
	fstoi	%f4,	%f4
loop_323:
	movneg	%icc,	%g1,	%o0
loop_324:
	call	loop_325
	nop 	! 	tge	%icc,	0x38 changed by convert2hboot
	call	loop_326
	brgz,a,pn	%i1,	loop_327
loop_325:
	umul	%l3,	%g4,	%l5
	flush	%l7 + 0x08
loop_326:
	call	loop_328
loop_327:
	call	loop_329
	movn	%fcc0,	0x69F,	%l1
	call	loop_330
loop_328:
	call	loop_331
loop_329:
	move	%fcc1,	%l2,	%g6
	bpos,pt	%xcc,	loop_332
loop_330:
	sll	%o1,	%o5,	%g2
loop_331:
	fbge	%fcc3,	loop_333
	movgu	%xcc,	0x457,	%g3
loop_332:
	call	loop_334
	alignaddr	%g5,	%i6,	%l4
loop_333:
	movrne	%l0,	0x0E9,	%i0
	edge32n	%o3,	%i7,	%o6
loop_334:
	call	loop_335
	movn	%fcc0,	0x6B2,	%g7
	call	loop_336
	fnot1s	%f10,	%f23
loop_335:
	call	loop_337
	umul	%o2,	0x07E0,	%i5
loop_336:
	nop
	nop
	setx	0x26F67E0D7AB496FB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x3BD3D3C1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsmuld	%f16,	%f22,	%f28
	bcc	%icc,	loop_338
loop_337:
	call	loop_339
	call	loop_340
	call	loop_341
loop_338:
	edge16	%i3,	%i2,	%o7
loop_339:
	fbe,a	%fcc1,	loop_342
loop_340:
	move	%icc,	0x06E,	%o4
loop_341:
	call	loop_343
	call	loop_344
loop_342:
	call	loop_345
	nop 	! 	rdhpr	%htba,	%i4 changed by convert2hboot
loop_343:
	nop
	set	0x63, %g6
	ldsb	[%l7 + %g6],	%g1
loop_344:
	subcc	%l6,	%o0,	%i1
loop_345:
	call	loop_346
	call	loop_347
	mulx	%g4,	0x093F,	%l5
	nop
	fitos	%f2,	%f9
	fstod	%f9,	%f22
loop_346:
	array8	%l1,	%l2,	%l3
loop_347:
	nop 	! 	rdpr	%tl,	%g6 changed by convert2hboot
	fcmpes	%fcc3,	%f26,	%f12
	edge32	%o1,	%o5,	%g3
	fmovdcs	%icc,	%f2,	%f20
	nop
	nop
	setx	0x46A33F24,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x439D2A13,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f25,	%f30
	call	loop_348
	nop 	! 	wrpr	%g2,	0x1F6F,	%tick changed by convert2hboot
	call	loop_349
	movge	%xcc,	0x0D6,	%g5
loop_348:
	membar	0x47
	call	loop_350
loop_349:
	call	loop_351
	flushw
	ldsw	[%l7 + 0x70],	%i6
loop_350:
	call	loop_352
loop_351:
	call	loop_353
	fpadd16	%f30,	%f28,	%f30
	wr	%g0,	0x0,	%pcr	! 	wr	%l0,	%i0,	%ccr changed by convert2hboot
loop_352:
	call	loop_354
loop_353:
	call	loop_355
	xor	%o3,	%l4,	%o6
	nop 	! 	tg	%xcc,	0x54 changed by convert2hboot
loop_354:
	call	loop_356
loop_355:
	call	loop_357
	call	loop_358
	fbn,a	%fcc1,	loop_359
loop_356:
	nop 	! 	tleu	%xcc,	0x4b changed by convert2hboot
loop_357:
	call	loop_360
loop_358:
	lduh	[%l7 + 0x58],	%i7
loop_359:
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x5, 	%fprs changed by convert2hboot
	edge16n	%g7,	%i3,	%i2
loop_360:
	call	loop_361
	call	loop_362
	call	loop_363
	orcc	%o7,	%o4,	%i5
loop_361:
	edge8	%i4,	%g1,	%l6
loop_362:
	edge32n	%i1,	%g4,	%o0
loop_363:
	call	loop_364
	rdpr	%otherwin,	%l1
	call	loop_365
	nop
	set	0x08, %l3
	ldsw	[%l7 + %l3],	%l2
loop_364:
	ldstub	[%l7 + 0x32],	%l3
	call	loop_366
loop_365:
	call	loop_367
	call	loop_368
	udivx	%g6,	0x0DB3,	%l5
loop_366:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x81,	%asi changed by convert2hboot
loop_367:
	call	loop_369
loop_368:
	call	loop_370
	call	loop_371
	call	loop_372
loop_369:
	movue	%fcc2,	%o1,	%g2
loop_370:
	call	loop_373
loop_371:
	fpsub32s	%f1,	%f24,	%f29
loop_372:
	orncc	%g3,	%g5,	%i6
	fmovdvc	%xcc,	%f6,	%f8
loop_373:
	brlz,a,pt	%l0,	loop_374
	nop 	! 	tge	%icc,	0x7e changed by convert2hboot
	fmuld8ulx16	%f31,	%f8,	%f2
	nop 	! 	tleu	%xcc,	0x7b changed by convert2hboot
loop_374:
	nop 	! 	tneg	%xcc,	0x48 changed by convert2hboot
	call	loop_375
	sub	%o3,	0x1A5B,	%l4
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	mulscc	%o6,	0x15C5,	%i7
loop_375:
	bmask	%i0,	%o2,	%i3
	call	loop_376
	call	loop_377
	call	loop_378
	call	loop_379
loop_376:
	call	loop_380
loop_377:
	edge8	%g7,	%i2,	%o4
loop_378:
	fpsub16s	%f5,	%f8,	%f15
loop_379:
	nop 	! 	tg	%icc,	0x50 changed by convert2hboot
loop_380:
	bmask	%o7,	%i4,	%g1
	call	loop_381
	fcmple32	%f18,	%f4,	%l6
	fand	%f28,	%f22,	%f24
	call	loop_382
loop_381:
	nop 	! 	rdhpr	%hintp,	%i5 changed by convert2hboot
	call	loop_383
	bvc,a,pt	%xcc,	loop_384
loop_382:
	call	loop_385
	call	loop_386
loop_383:
	fmovscc	%icc,	%f5,	%f30
loop_384:
	wrpr	%i1,	%g4,	%cwp
loop_385:
	andn	%l1,	0x0080,	%o0
loop_386:
	call	loop_387
	movle	%fcc1,	%l3,	%l2
	bvc,a	%icc,	loop_388
	movcc	%icc,	0x1B4,	%l5
loop_387:
	nop 	! 	tle	%icc,	0x51 changed by convert2hboot
	fnot1	%f16,	%f8
loop_388:
	call	loop_389
	bshuffle	%f20,	%f0,	%f6
	srax	%g6,	%o5,	%o1
	call	loop_390
loop_389:
	call	loop_391
	call	loop_392
	xorcc	%g3,	%g2,	%g5
loop_390:
	fmovso	%fcc0,	%f9,	%f16
loop_391:
	ldd	[%l7 + 0x18],	%l0
loop_392:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x18,	%asi changed by convert2hboot
	subccc	%l4,	0x0A42,	%i7
	call	loop_393
	flush	%l7 + 0x18
	alignaddrl	%i0,	%o6,	%o2
	subccc	%i3,	0x1DEB,	%g7
loop_393:
	call	loop_394
	movl	%fcc0,	%i2,	%o7
	call	loop_395
	call	loop_396
loop_394:
	fcmpgt32	%f10,	%f18,	%i4
	fmovrsgez	%o4,	%f20,	%f0
loop_395:
	nop
	set	0x28, %o7
	stx	%g1,	[%l7 + %o7]
loop_396:
	fba,a,pn	%fcc3,	loop_397
	nop 	! 	tsubcctv	%l6,	%i5,	%g4 changed by convert2hboot
	movcs	%xcc,	0x72A,	%l1
	edge8l	%o0,	%i1,	%l2
loop_397:
	call	loop_398
	call	loop_399
	fbn,a,pt	%fcc3,	loop_400
	call	loop_401
loop_398:
	call	loop_402
loop_399:
	call	loop_403
loop_400:
	call	loop_404
loop_401:
	fnor	%f18,	%f20,	%f26
loop_402:
	fmul8x16al	%f20,	%f8,	%f16
loop_403:
	array8	%l3,	%l5,	%g6
loop_404:
	edge32l	%o1,	%g3,	%o5
	call	loop_405
	call	loop_406
	movue	%fcc0,	0x7D9,	%g2
	call	loop_407
loop_405:
	fmovslg	%fcc3,	%f1,	%f10
loop_406:
	fblg	%fcc1,	loop_408
	fbul,a,pt	%fcc1,	loop_409
loop_407:
	edge8n	%l0,	%o3,	%g5
	call	loop_410
loop_408:
	xnor	%i6,	0x1AB5,	%l4
loop_409:
	array16	%i0,	%i7,	%o2
	nop 	! 	tleu	%xcc,	0x3f changed by convert2hboot
loop_410:
	fnot2	%f6,	%f22
	xor	%o6,	0x030F,	%g7
	sethi	0x0F4A,	%i2
	movlg	%fcc0,	%o7,	%i4
	fmovsne	%fcc2,	%f8,	%f27
	fmovda	%xcc,	%f20,	%f28
	call	loop_411
	movne	%fcc2,	0x4B2,	%i3
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x58,	%asi changed by convert2hboot
loop_411:
	nop
	set	0x40, %g1
	nop	 ! 	stda	%f0,	[%l7 + %g1] 0xc8 ASI use replaced by convert2hboot
	fnors	%f0,	%f21,	%f6
	bg	%icc,	loop_412
	movule	%fcc0,	%o4,	%l6
	call	loop_413
	fbul,a	%fcc2,	loop_414
loop_412:
	wrpr	%g4,	%l1,	%cwp
	fmovsuge	%fcc2,	%f25,	%f6
loop_413:
	fbe,a,pt	%fcc3,	loop_415
loop_414:
	xorcc	%i5,	0x12F2,	%o0
	rdpr	%otherwin,	%l2
	call	loop_416
loop_415:
	movcs	%icc,	0x375,	%i1
	call	loop_417
	fcmped	%fcc0,	%f12,	%f22
loop_416:
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x6, 	%fprs changed by convert2hboot
	nop
	setx	0x1BB4,	%l0,	%l3
	sdivx	%o1,	%l3,	%o5
loop_417:
	fbl	%fcc0,	loop_418
	call	loop_419
	nop
	setx	loop_420,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x014100001405,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	array16	%g3,	%l0,	%o3
loop_418:
	fmovde	%icc,	%f0,	%f22
loop_419:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x26,	%asi changed by convert2hboot
loop_420:
	call	loop_421
	call	loop_422
	movrgez	%g5,	%i6,	%l4
	popc	%i7,	%o2
loop_421:
	fmovscc	%icc,	%f2,	%f4
loop_422:
	call	loop_423
	addc	%i0,	0x1715,	%g7
	call	loop_424
	rd	%pc,	%i2
loop_423:
	fbuge	%fcc0,	loop_425
	mova	%fcc2,	0x516,	%o7
loop_424:
	nop 	! 	tne	%xcc,	0x44 changed by convert2hboot
	bvs	%icc,	loop_426
loop_425:
	fpsub16	%f8,	%f0,	%f28
	call	loop_427
	fcmpeq32	%f4,	%f12,	%i4
loop_426:
	nop 	! 	tge	%xcc,	0x74 changed by convert2hboot
	edge16l	%i3,	%g1,	%o4
loop_427:
	orncc	%l6,	0x037F,	%o6
	movrne	%l1,	0x257,	%g4
	nop 	! 	tsubcctv	%i5,	0x5c,	%l2 changed by convert2hboot
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr	%g0,	0x0,	%pcr	! 	wr 	%l0, 	0xF7A, 	%sys_tick_cmpr changed by convert2hboot
	set	0x70, %g7
	nop	 ! 	ldxa	[%l7 + %g7] 0x81,	%l5 ASI use replaced by convert2hboot
	array8	%o1,	%g6,	%o5
	call	loop_428
	nop
	nop
	setx	0xFFBF7ECA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x7D74DA1B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fmuls	%f27,	%f13,	%f30
	flushw
	nop
	set	0x28, %g5
	sth	%l3,	[%l7 + %g5]
loop_428:
	movneg	%xcc,	%l0,	%o3
	mulx	%g2,	0x107F,	%g3
	nop 	! 	taddcc	%i6,	0x44,	%g5 changed by convert2hboot
	nop 	! 	tle	%xcc,	0x6f changed by convert2hboot
	call	loop_429
	fmovscs	%icc,	%f30,	%f21
	call	loop_430
	movug	%fcc3,	%i7,	%l4
loop_429:
	call	loop_431
	subccc	%i0,	%g7,	%o2
loop_430:
	call	loop_432
	movleu	%icc,	%i2,	%i4
loop_431:
	bgu,a,pt	%xcc,	loop_433
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%f20
loop_432:
	call	loop_434
	stw	%i3,	[%l7 + 0x18]
loop_433:
	nop 	! 	taddcc	%g1,	%o4,	%o7 changed by convert2hboot
	xorcc	%o6,	0x1E4F,	%l1
loop_434:
	movuge	%fcc3,	0x7AC,	%g4
	call	loop_435
	wr	%g0,	0x0,	%pcr	! 	wr	%i5,	%l6,	%pic changed by convert2hboot
	call	loop_436
	array8	%o0,	%l2,	%l5
loop_435:
	fzero	%f14
	call	loop_437
loop_436:
	orcc	%o1,	0x0CD2,	%g6
	call	loop_438
	membar	0x5D
loop_437:
	call	loop_439
	bvs,a,pn	%icc,	loop_440
loop_438:
	call	loop_441
	ble	%icc,	loop_442
loop_439:
	fands	%f17,	%f26,	%f27
loop_440:
	fmovdu	%fcc0,	%f10,	%f30
loop_441:
	nop
	set	0x54, %i0
	nop	 ! 	ldsha	[%l7 + %i0] 0x18,	%o5 ASI use replaced by convert2hboot
loop_442:
	bg	%icc,	loop_443
	alignaddrl	%l3,	%i1,	%o3
	call	loop_444
	nop 	! 	tpos	%icc,	0x47 changed by convert2hboot
loop_443:
	nop 	! 	tl	%icc,	0x59 changed by convert2hboot
	sll	%l0,	%g2,	%g3
loop_444:
	bneg	%icc,	loop_445
	nop 	! 	wrpr	%i6,	0x1823,	%tick changed by convert2hboot
	fmovsa	%fcc3,	%f3,	%f31
	nop 	! 	tcc	%icc,	0x70 changed by convert2hboot
loop_445:
	movne	%fcc3,	0x7BD,	%g5
	call	loop_446
	edge8n	%l4,	%i7,	%g7
	movvc	%icc,	0x789,	%i0
	nop 	! 	tn	%xcc,	0x3f changed by convert2hboot
loop_446:
	membar	0x16
	movneg	%icc,	%o2,	%i2
	bl,a	%xcc,	loop_447
	nop 	! 	tl	%icc,	0x41 changed by convert2hboot
	nop 	! 	tvs	%xcc,	0x59 changed by convert2hboot
	udivx	%i3,	0x168C,	%g1
loop_447:
	edge16	%o4,	%o7,	%i4
	movrne	%o6,	%l1,	%i5
	nop 	! 	tg	%icc,	0x67 changed by convert2hboot
	fbo,pt	%fcc3,	loop_448
	move	%fcc1,	0x46B,	%g4
	nop 	! 	tg	%icc,	0x58 changed by convert2hboot
	array8	%l6,	%l2,	%l5
loop_448:
	edge16n	%o0,	%g6,	%o5
	call	loop_449
	nop 	! 	tvc	%xcc,	0x41 changed by convert2hboot
	bpos,a,pt	%icc,	loop_450
	movpos	%icc,	%l3,	%i1
loop_449:
	fblg,a,pt	%fcc1,	loop_451
	call	loop_452
loop_450:
	fands	%f31,	%f26,	%f16
	nop
	set	0x54, %l1
	swap	[%l7 + %l1],	%o3
loop_451:
	call	loop_453
loop_452:
	fbge,pn	%fcc3,	loop_454
	andncc	%o1,	%l0,	%g2
	addc	%i6,	0x0FA7,	%g3
loop_453:
	movue	%fcc2,	0x1EE,	%g5
loop_454:
	nop 	! 	tcc	%icc,	0x4d changed by convert2hboot
	call	loop_455
	call	loop_456
	edge32l	%l4,	%i7,	%g7
	call	loop_457
loop_455:
	call	loop_458
loop_456:
	call	loop_459
	call	loop_460
loop_457:
	call	loop_461
loop_458:
	andncc	%o2,	%i0,	%i2
loop_459:
	flush	%l7 + 0x7C
loop_460:
	call	loop_462
loop_461:
	nop 	! 	tsubcc	%g1,	0x35,	%o4 changed by convert2hboot
	call	loop_463
	movl	%icc,	%i3,	%o7
loop_462:
	nop
	set	0x74, %i3
	sta	%f10,	[%l7 + %i3] 0x18
loop_463:
	movgu	%icc,	%i4,	%l1
	call	loop_464
	call	loop_465
	fpsub32s	%f9,	%f3,	%f31
	orncc	%o6,	%i5,	%g4
loop_464:
	call	loop_466
loop_465:
	nop 	! 	tn	%xcc,	0x60 changed by convert2hboot
	call	loop_467
	call	loop_468
loop_466:
	sll	%l2,	0x14,	%l5
	call	loop_469
loop_467:
	call	loop_470
loop_468:
	edge16	%o0,	%l6,	%g6
	fnot1s	%f17,	%f7
loop_469:
	nop 	! 	tle	%icc,	0x5e changed by convert2hboot
loop_470:
	subccc	%l3,	0x047E,	%i1
	mulscc	%o3,	%o1,	%l0
	fbul	%fcc1,	loop_471
	brlz,a	%g2,	loop_472
	movue	%fcc0,	0x007,	%i6
	call	loop_473
loop_471:
	edge32n	%g3,	%o5,	%g5
loop_472:
	wr	%g0,	0x0,	%pcr	! 	wr	%i7,	%l4,	%ccr changed by convert2hboot
	bshuffle	%f22,	%f0,	%f14
loop_473:
	call	loop_474
	nop
	set	0x50, %l6
	prefetch	[%l7 + %l6],	 3
	nop 	! 	taddcctv	%o2,	%g7,	%i2 changed by convert2hboot
	call	loop_475
loop_474:
	call	loop_476
	movgu	%xcc,	0x13F,	%g1
	call	loop_477
loop_475:
	call	loop_478
loop_476:
	call	loop_479
	movu	%fcc0,	%i0,	%o4
loop_477:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x46D, 	%hsys_tick_cmpr changed by convert2hboot
loop_478:
	call	loop_480
loop_479:
	call	loop_481
	call	loop_482
	fmovsul	%fcc3,	%f21,	%f7
loop_480:
	call	loop_483
loop_481:
	sub	%l1,	%i4,	%i5
loop_482:
	nop
	set	0x24, %o4
	swap	[%l7 + %o4],	%o6
	movrlz	%l2,	%l5,	%o0
loop_483:
	call	loop_484
	call	loop_485
	xnorcc	%l6,	0x1A52,	%g6
	bmask	%g4,	%l3,	%i1
loop_484:
	call	loop_486
loop_485:
	call	loop_487
	nop
	nop
	setx	0x6AD315A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x147410E7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f7,	%f29
	edge8n	%o3,	%o1,	%l0
loop_486:
	call	loop_488
loop_487:
	mulx	%g2,	0x0694,	%i6
	subcc	%g3,	%o5,	%i7
	call	loop_489
loop_488:
	fnor	%f0,	%f30,	%f0
	call	loop_490
	fnot1	%f30,	%f6
loop_489:
	rdpr	%wstate,	%g5
	umul	%l4,	0x1F0F,	%g7
loop_490:
	add	%o2,	%i2,	%g1
	call	loop_491
	wrpr	%o4,	0x02F3,	%pil
	flushw
	flushw
loop_491:
	call	loop_492
	nop 	! 	tneg	%icc,	0x42 changed by convert2hboot
	nop
	setx	0x06CE,	%l0,	%o7
	sdivx	%i3,	%o7,	%l1
	fbne	%fcc3,	loop_493
loop_492:
	fmovrslez	%i0,	%f12,	%f27
	call	loop_494
	nop
	setx	0x1714,	%l0,	%i5
	udiv	%i4,	%i5,	%o6
loop_493:
	rdpr	%cleanwin,	%l2
	movpos	%icc,	%o0,	%l6
loop_494:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr	%g0,	0x0,	%pcr	! 	wr 	%l0, 	%g0, 	%sys_tick_cmpr changed by convert2hboot
	subcc	%g4,	0x15E0,	%l5
	brz,a	%l3,	loop_495
	nop 	! 	tsubcctv	%i1,	%o1,	%l0 changed by convert2hboot
	fmovso	%fcc2,	%f8,	%f20
	fmovsle	%fcc1,	%f1,	%f13
loop_495:
	brgez,pn	%g2,	loop_496
	movle	%fcc2,	%i6,	%g3
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	srl	%o3,	0x17,	%i7
loop_496:
	rd	%fprs,	%g5
	call	loop_497
	call	loop_498
	orncc	%o5,	0x1DF2,	%g7
	movrlez	%l4,	0x1B1,	%i2
loop_497:
	edge8ln	%o2,	%o4,	%i3
loop_498:
	call	loop_499
	movrlez	%o7,	0x185,	%l1
	movlg	%fcc3,	0x06B,	%i0
	call	loop_500
loop_499:
	fornot1s	%f14,	%f12,	%f23
	call	loop_501
	call	loop_502
loop_500:
	call	loop_503
	fbg,a	%fcc1,	loop_504
loop_501:
	movug	%fcc1,	0x7D3,	%g1
loop_502:
	movn	%fcc2,	0x662,	%i4
loop_503:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x10,	%asi changed by convert2hboot
loop_504:
	brlez,a	%l2,	loop_505
	move	%icc,	%o0,	%i5
	fmovse	%icc,	%f21,	%f19
	set	0x51, %i5
	nop	 ! 	stba	%g6,	[%l7 + %i5] 0x27 ASI use replaced by convert2hboot
	membar	#Sync
loop_505:
	edge32	%l6,	%g4,	%l5
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x88,	%asi changed by convert2hboot
	call	loop_506
	fmovsneg	%xcc,	%f27,	%f24
	subcc	%o1,	0x0964,	%l3
	set	0x10, %o2
	nop	 ! 	ldda	[%l7 + %o2] 0x2f,	%l0 ASI use replaced by convert2hboot
loop_506:
	call	loop_507
	wrpr 	%g0, 	0x3, 	%gl
	andcc	%g2,	%o3,	%i7
	call	loop_508
loop_507:
	nop 	! 	rdhpr	%hintp,	%g5 changed by convert2hboot
	nop
	set	0x20, %l0
	sth	%o5,	[%l7 + %l0]
	orncc	%g7,	0x1DDB,	%g3
loop_508:
	call	loop_509
	call	loop_510
	fornot1	%f20,	%f2,	%f0
	rdpr	%gl,	%i2
loop_509:
	fmovdvs	%xcc,	%f8,	%f8
loop_510:
	call	loop_511
	fabss	%f30,	%f24
	edge8ln	%o2,	%l4,	%i3
	nop 	! 	tleu	%xcc,	0x37 changed by convert2hboot
loop_511:
	movlg	%fcc0,	%o7,	%o4
	edge16ln	%l1,	%i0,	%g1
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x89,	%asi changed by convert2hboot
	sta	%f27,	[%l7 + 0x54] %asi
	nop
	nop
	setx	0x3534260B19F63C3A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x52FAA0B416D26871,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f2,	%f16
	set	0x1C, %g2
	nop	 ! 	swapa	[%l7 + %g2] 0x10,	%o6 ASI use replaced by convert2hboot
	fba	%fcc3,	loop_512
	fmovsue	%fcc2,	%f12,	%f17
	fbne	%fcc3,	loop_513
	mulx	%l2,	%i4,	%o0
loop_512:
	fcmple16	%f10,	%f28,	%g6
	call	loop_514
loop_513:
	smulcc	%i5,	%l6,	%l5
	movre	%g4,	%i1,	%o1
	call	loop_515
loop_514:
	bvc	%icc,	loop_516
	call	loop_517
	call	loop_518
loop_515:
	fnot2s	%f30,	%f13
loop_516:
	call	loop_519
loop_517:
	edge8l	%l3,	%l0,	%i6
loop_518:
	fbo	%fcc2,	loop_520
	call	loop_521
loop_519:
	ldx	[%l7 + 0x30],	%g2
	call	loop_522
loop_520:
	call	loop_523
loop_521:
	nop 	! 	tl	%icc,	0x72 changed by convert2hboot
	rd	%ccr,	%o3
loop_522:
	nop 	! 	wrpr	%i7,	%g5,	%tick changed by convert2hboot
loop_523:
	bne	%xcc,	loop_524
	call	loop_525
	movug	%fcc3,	%o5,	%g3
	fmovd	%f4,	%f2
loop_524:
	andncc	%g7,	%o2,	%l4
loop_525:
	smul	%i3,	%o7,	%o4
	rdpr	%pil,	%i2
	call	loop_526
	addcc	%l1,	0x0761,	%g1
	call	loop_527
	nop 	! 	te	%xcc,	0x4c changed by convert2hboot
loop_526:
	movrlez	%o6,	%l2,	%i0
	call	loop_528
loop_527:
	movneg	%xcc,	%o0,	%g6
	nop 	! 	tcs	%icc,	0x39 changed by convert2hboot
	fxnors	%f29,	%f25,	%f3
loop_528:
	movrne	%i4,	%l6,	%i5
	udivx	%g4,	0x19C0,	%i1
	sethi	0x1879,	%o1
	fcmpgt32	%f16,	%f18,	%l5
	movleu	%xcc,	%l3,	%i6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x89,	%asi changed by convert2hboot
	lda	[%l7 + 0x54] %asi,	%f15
	call	loop_529
	call	loop_530
	call	loop_531
	nop 	! 	tge	%icc,	0x4b changed by convert2hboot
loop_529:
	nop
	fitod	%f31,	%f22
loop_530:
	call	loop_532
loop_531:
	fsrc1s	%f29,	%f31
	movrgz	%g2,	0x308,	%o3
	xorcc	%i7,	0x097E,	%l0
loop_532:
	edge32	%o5,	%g5,	%g3
	fmovspos	%icc,	%f24,	%f0
	call	loop_533
	nop
	set	0x20, %o5
	flush	%l7 + %o5
	sll	%o2,	%g7,	%l4
	nop 	! 	tge	%xcc,	0x72 changed by convert2hboot
loop_533:
	nop 	! 	tle	%xcc,	0x53 changed by convert2hboot
	xor	%o7,	%i3,	%i2
	call	loop_534
	call	loop_535
	call	loop_536
	call	loop_537
loop_534:
	fmovsn	%fcc2,	%f9,	%f0
loop_535:
	movo	%fcc3,	%l1,	%o4
loop_536:
	movue	%fcc1,	%o6,	%l2
loop_537:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x89,	%asi changed by convert2hboot
	and	%o0,	%i0,	%g6
	rdpr	%canrestore,	%l6
	call	loop_538
	orncc	%i4,	%i5,	%i1
	wr	%g0,	0x0,	%pcr	! 	wr	%o1,	0x1BF1,	%sys_tick changed by convert2hboot
	call	loop_539
loop_538:
	call	loop_540
	edge16	%l5,	%l3,	%g4
	call	loop_541
loop_539:
	call	loop_542
loop_540:
	movleu	%xcc,	%i6,	%g2
	call	loop_543
loop_541:
	movug	%fcc1,	0x2F7,	%i7
loop_542:
	call	loop_544
	swap	[%l7 + 0x60],	%l0
loop_543:
	call	loop_545
	call	loop_546
loop_544:
	call	loop_547
	bvc,a	%icc,	loop_548
loop_545:
	flushw
loop_546:
	call	loop_549
loop_547:
	movule	%fcc0,	0x144,	%o5
loop_548:
	bgu	%xcc,	loop_550
	wrpr	%o3,	0x13CC,	%pil
loop_549:
	call	loop_551
	nop 	! 	tne	%xcc,	0x7f changed by convert2hboot
loop_550:
	call	loop_552
	fmovrdlz	%g5,	%f30,	%f8
loop_551:
	call	loop_553
	movre	%o2,	0x287,	%g3
loop_552:
	movuge	%fcc2,	%g7,	%o7
	fxnor	%f8,	%f6,	%f24
loop_553:
	ldsw	[%l7 + 0x40],	%l4
	bneg,pn	%icc,	loop_554
	fexpand	%f27,	%f16
	movne	%fcc3,	0x42B,	%i3
	set	0x72, %i7
	nop	 ! 	ldsba	[%l7 + %i7] 0x81,	%l1 ASI use replaced by convert2hboot
loop_554:
	fnors	%f31,	%f2,	%f12
	xnor	%i2,	%o4,	%o6
	edge16ln	%l2,	%g1,	%i0
	edge8n	%g6,	%o0,	%l6
	set	0x74, %i6
	nop	 ! 	ldstuba	[%l7 + %i6] 0x81,	%i4 ASI use replaced by convert2hboot
	fpsub32s	%f5,	%f8,	%f22
	call	loop_555
	nop
	setx	0x07B8,	%l0,	%o1
	sdiv	%i1,	%o1,	%l5
	fbul	%fcc1,	loop_556
	nop 	! 	te	%icc,	0x3b changed by convert2hboot
loop_555:
	movre	%i5,	%l3,	%i6
	call	loop_557
loop_556:
	call	loop_558
	nop
	set	0x1C, %i4
	ldsw	[%l7 + %i4],	%g2
	call	loop_559
loop_557:
	movug	%fcc2,	%g4,	%l0
loop_558:
	nop	!	sir	0x06F4 !! sir is illegal now
	fmovdvs	%xcc,	%f10,	%f18
loop_559:
	fblg,pt	%fcc1,	loop_560
	nop 	! 	taddcc	%o5,	0x38,	%i7 changed by convert2hboot
	nop 	! 	rdhpr	%ver,	%g5 changed by convert2hboot
	call	loop_561
loop_560:
	movrlez	%o2,	0x2EE,	%o3
	movul	%fcc2,	0x65E,	%g3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
loop_561:
	fbo,a	%fcc1,	loop_562
	orcc	%g7,	%l4,	%l1
	call	loop_563
	bpos,a,pt	%xcc,	loop_564
loop_562:
	movne	%icc,	%i3,	%i2
	nop
	nop
	setx	0xB4A2796D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f21
loop_563:
	call	loop_565
loop_564:
	nop 	! 	tn	%xcc,	0x3b changed by convert2hboot
	sllx	%o6,	0x19,	%l2
	brgez,pt	%g1,	loop_566
loop_565:
	call	loop_567
	call	loop_568
	call	loop_569
loop_566:
	call	loop_570
loop_567:
	wrpr	%o4,	%i0,	%cwp
loop_568:
	call	loop_571
loop_569:
	nop 	! 	taddcctv	%g6,	0x35,	%l6 changed by convert2hboot
loop_570:
	nop 	! 	tsubcctv	%i4,	%i1,	%o0 changed by convert2hboot
	nop 	! 	tsubcc	%o1,	0x55,	%l5 changed by convert2hboot
loop_571:
	call	loop_572
	call	loop_573
	flushw
	edge8l	%l3,	%i6,	%i5
loop_572:
	fmovdne	%icc,	%f14,	%f10
loop_573:
	call	loop_574
	call	loop_575
	call	loop_576
	array8	%g2,	%g4,	%l0
loop_574:
	srlx	%o5,	0x00,	%i7
loop_575:
	call	loop_577
loop_576:
	call	loop_578
	call	loop_579
	nop 	! 	ta	%icc,	0x4f changed by convert2hboot
loop_577:
	sra	%g5,	0x0E,	%o3
loop_578:
	nop 	! 	rdpr	%tba,	%o2 changed by convert2hboot
loop_579:
	bleu,a,pn	%xcc,	loop_580
	prefetch	[%l7 + 0x10],	 3
	nop
	setx	0x00DA,	%l0,	%g7
	sdivcc	%o7,	%g7,	%l4
	call	loop_581
loop_580:
	fmovdule	%fcc0,	%f30,	%f20
	call	loop_582
	edge32l	%g3,	%l1,	%i2
loop_581:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x81,	%asi changed by convert2hboot
loop_582:
	xnorcc	%i3,	%g1,	%o4
	xnorcc	%g6,	%l6,	%i4
	membar	0x2D
	fnegs	%f12,	%f16
	popc	%i1,	%o0
	umulcc	%i0,	%o1,	%l3
	call	loop_583
	fmovdu	%fcc1,	%f16,	%f20
	stb	%l5,	[%l7 + 0x38]
	call	loop_584
loop_583:
	sll	%i5,	%i6,	%g4
	movrne	%l0,	0x2CD,	%o5
	call	loop_585
loop_584:
	call	loop_586
	mulx	%i7,	0x147D,	%g2
	call	loop_587
loop_585:
	call	loop_588
loop_586:
	call	loop_589
	bneg	%icc,	loop_590
loop_587:
	fmovrdgz	%g5,	%f28,	%f26
loop_588:
	call	loop_591
loop_589:
	array32	%o2,	%o7,	%o3
loop_590:
	call	loop_592
	fmovscs	%icc,	%f15,	%f28
loop_591:
	nop 	! 	tne	%xcc,	0x5d changed by convert2hboot
	movrlz	%g7,	%g3,	%l1
loop_592:
	fcmpd	%fcc1,	%f24,	%f30
	edge32	%i2,	%o6,	%l2
	edge32n	%i3,	%g1,	%o4
	movue	%fcc1,	%g6,	%l4
	xnor	%i4,	0x0C81,	%l6
	nop 	! 	tn	%xcc,	0x66 changed by convert2hboot
	fmovdcs	%icc,	%f8,	%f18
	call	loop_593
	alignaddr	%o0,	%i0,	%i1
	call	loop_594
	bcc,pn	%xcc,	loop_595
loop_593:
	fmovrsne	%l3,	%f23,	%f13
	movvc	%icc,	0x7F1,	%l5
loop_594:
	call	loop_596
loop_595:
	bcc	%xcc,	loop_597
	fabsd	%f2,	%f18
	nop
	setx	0x18A0,	%l0,	%o1
	udivx	%i5,	%o1,	%g4
loop_596:
	nop
	set	0x10, %l5
	nop	 ! 	stha	%l0,	[%l7 + %l5] 0x22 ASI use replaced by convert2hboot
	membar	#Sync
loop_597:
	popc	0x082B,	%i6
	movne	%xcc,	%o5,	%i7
	set	0x50, %g3
	sta	%f19,	[%l7 + %g3] 0x0c
	andcc	%g2,	%g5,	%o2
	call	loop_598
	bneg,a	%xcc,	loop_599
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	sdivcc	%o7,	0x0A19,	%o3
loop_598:
	movu	%fcc3,	%g3,	%g7
loop_599:
	fsrc2s	%f7,	%f29
	fmovsug	%fcc0,	%f19,	%f22
	nop 	! 	tn	%xcc,	0x42 changed by convert2hboot
	call	loop_600
	call	loop_601
	fbo,a	%fcc3,	loop_602
	nop 	! 	tl	%icc,	0x66 changed by convert2hboot
loop_600:
	movvc	%icc,	%l1,	%i2
loop_601:
	call	loop_603
loop_602:
	call	loop_604
	edge16l	%l2,	%i3,	%o6
	bshuffle	%f14,	%f4,	%f28
loop_603:
	nop 	! 	tsubcctv	%g1,	0x56,	%o4 changed by convert2hboot
loop_604:
	call	loop_605
	call	loop_606
	call	loop_607
	fbo,a,pn	%fcc0,	loop_608
loop_605:
	subccc	%l4,	%g6,	%i4
loop_606:
	movgu	%icc,	%o0,	%i0
loop_607:
	call	loop_609
loop_608:
	movn	%fcc1,	%i1,	%l3
	andncc	%l6,	0x1264,	%l5
	call	loop_610
loop_609:
	fmovrsne	%o1,	%f8,	%f30
	bge,a,pt	%icc,	loop_611
	umul	%i5,	0x11FD,	%g4
loop_610:
	nop
	set	0x70, %l2
	nop	 ! 	stxa	%i6,	[%l7 + %l2] 0xe2 ASI use replaced by convert2hboot
	membar	#Sync
loop_611:
	fcmpeq16	%f4,	%f4,	%l0
	edge16n	%i7,	%o5,	%g2
	udivx	%g5,	0x1D1A,	%o7
	fbul,a	%fcc3,	loop_612
	edge8	%o3,	%g3,	%g7
	nop 	! 	tpos	%icc,	0x55 changed by convert2hboot
	fcmple16	%f2,	%f18,	%l1
loop_612:
	call	loop_613
	fbug,pt	%fcc3,	loop_614
	fbuge,pn	%fcc1,	loop_615
	nop
	nop
	setx	0x60779000,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
loop_613:
	call	loop_616
loop_614:
	nop 	! 	rdhpr	%ver,	%o2 changed by convert2hboot
loop_615:
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x6, 	%fprs changed by convert2hboot
	nop 	! 	tvc	%xcc,	0x5c changed by convert2hboot
loop_616:
	call	loop_617
	fsrc1	%f12,	%f14
	xorcc	%i2,	%i3,	%g1
	call	loop_618
loop_617:
	call	loop_619
	udiv	%o6,	0x07AB,	%o4
	srlx	%g6,	0x19,	%l4
loop_618:
	call	loop_620
loop_619:
	bmask	%i4,	%i0,	%o0
	sllx	%l3,	0x0F,	%i1
	nop
	nop
	setx	0x944C250C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x953246B1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f21,	%f27
loop_620:
	fmovdug	%fcc2,	%f22,	%f24
	call	loop_621
	add	%l5,	%o1,	%i5
	umulcc	%g4,	%i6,	%l6
	movrgez	%l0,	0x21B,	%o5
loop_621:
	nop
	nop
	setx	0x3706D0902B2C7EC3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x26BEA0825F5D341C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f26,	%f12
	movul	%fcc3,	%g2,	%g5
	call	loop_622
	popc	0x1DF6,	%i7
	wrpr	%o7,	%o3,	%pil
	edge8	%g3,	%l1,	%g7
loop_622:
	fmovrslez	%l2,	%f21,	%f16
	call	loop_623
	fors	%f31,	%f9,	%f4
	orcc	%i2,	%i3,	%g1
	edge32	%o6,	%o2,	%g6
loop_623:
	fblg,a	%fcc1,	loop_624
	call	loop_625
	call	loop_626
	and	%l4,	%i4,	%o4
loop_624:
	nop
	set	0x28, %g4
	sth	%o0,	[%l7 + %g4]
loop_625:
	fmovdue	%fcc0,	%f28,	%f28
loop_626:
	call	loop_627
	add	%l3,	%i1,	%i0
	call	loop_628
	fcmpeq16	%f18,	%f12,	%l5
loop_627:
	fbge,a,pt	%fcc0,	loop_629
	call	loop_630
loop_628:
	fmovsuge	%fcc2,	%f12,	%f26
	bmask	%i5,	%g4,	%o1
loop_629:
	addc	%l6,	0x0E59,	%l0
loop_630:
	edge8ln	%o5,	%g2,	%i6
	movrgz	%g5,	0x233,	%o7
	movne	%xcc,	0x1AC,	%i7
	call	loop_631
	call	loop_632
	orncc	%g3,	0x10BF,	%o3
	call	loop_633
loop_631:
	flushw
loop_632:
	bg,a,pn	%icc,	loop_634
	movle	%fcc1,	%l1,	%g7
loop_633:
	movvs	%xcc,	%l2,	%i3
	nop
	set	0x6D, %o3
	stb	%g1,	[%l7 + %o3]
loop_634:
	call	loop_635
	wr	%g0,	0x0,	%pcr	! 	wr	%i2,	0x05C9,	%pic changed by convert2hboot
	call	loop_636
	rdpr	%otherwin,	%o2
loop_635:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x80,	%asi changed by convert2hboot
	nop	 ! 	casxa	[%l6] 0x80,	%g6,	%l4 ASI use replaced by convert2hboot
loop_636:
	call	loop_637
	nop
	setx loop_638, %l0, %l1
	jmpl %l1, %o6
	call	loop_639
	call	loop_640
loop_637:
	subccc	%i4,	0x084D,	%o4
loop_638:
	andcc	%o0,	%l3,	%i1
loop_639:
	fble	%fcc3,	loop_641
loop_640:
	udivcc	%i0,	0x181A,	%l5
	brlz	%g4,	loop_642
	fbu,a	%fcc1,	loop_643
loop_641:
	fbl,pt	%fcc1,	loop_644
	fbul,a,pt	%fcc3,	loop_645
loop_642:
	call	loop_646
loop_643:
	umulcc	%o1,	0x18DF,	%l6
loop_644:
	call	loop_647
loop_645:
	nop
	setx	0x0491,	%l0,	%i5
	sdivcc	%l0,	%i5,	%o5
loop_646:
	fornot2s	%f25,	%f16,	%f2
	nop
	setx	0x0E1D,	%l0,	%g2
	sdivcc	%i6,	%g2,	%o7
loop_647:
	fmul8sux16	%f30,	%f20,	%f0
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f16
	fxtod	%f16,	%f4
	rd	%softint,	%g5
	bvs	%icc,	loop_648
	call	loop_649
	srl	%g3,	0x18,	%i7
	call	loop_650
loop_648:
	movo	%fcc2,	0x7F0,	%o3
loop_649:
	orcc	%l1,	0x1CB3,	%g7
	call	loop_651
loop_650:
	nop
	setx	0x10F2,	%l0,	%g1
	sdivx	%i3,	%g1,	%i2
	call	loop_652
	nop 	! 	tle	%icc,	0x36 changed by convert2hboot
loop_651:
	call	loop_653
	ldub	[%l7 + 0x12],	%o2
loop_652:
	fmovdg	%fcc3,	%f16,	%f10
	rdpr	%cwp,	%g6
loop_653:
	umulcc	%l4,	0x0D99,	%l2
	fcmpne32	%f0,	%f12,	%o6
	nop 	! 	rdpr	%tba,	%i4 changed by convert2hboot
	call	loop_654
	call	loop_655
	call	loop_656
	fbge,a	%fcc1,	loop_657
loop_654:
	call	loop_658
loop_655:
	fmovdule	%fcc1,	%f16,	%f30
loop_656:
	fmovdleu	%icc,	%f4,	%f26
loop_657:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr	%g0,	0x0,	%pcr	! 	wr 	%l0, 	%g0, 	%sys_tick_cmpr changed by convert2hboot
loop_658:
	call	loop_659
	nop
	nop
	setx	0x749AEBEC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x0309DDFA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f19,	%f27
	call	loop_660
	call	loop_661
loop_659:
	wrpr 	%g0, 	0x0, 	%gl
	nop
	fitos	%f6,	%f17
	fstox	%f17,	%f12
	fxtos	%f12,	%f9
loop_660:
	call	loop_662
loop_661:
	movvs	%icc,	%i0,	%l5
	orncc	%o4,	%g4,	%o1
	sethi	0x0F56,	%l0
loop_662:
	nop 	! 	tsubcctv	%l6,	%i5,	%o5 changed by convert2hboot
	subc	%g2,	0x097F,	%o7
	call	loop_663
	call	loop_664
	smulcc	%i6,	0x1310,	%g3
	call	loop_665
loop_663:
	rd	%sys_tick_cmpr,	%i7
loop_664:
	fbue,a,pt	%fcc3,	loop_666
	call	loop_667
loop_665:
	call	loop_668
	call	loop_669
loop_666:
	xnorcc	%g5,	%l1,	%g7
loop_667:
	sra	%o3,	0x08,	%i3
loop_668:
	call	loop_670
loop_669:
	fzero	%f18
	call	loop_671
	call	loop_672
loop_670:
	call	loop_673
	fnot1s	%f3,	%f18
loop_671:
	call	loop_674
loop_672:
	call	loop_675
loop_673:
	fbg,a	%fcc1,	loop_676
	andncc	%g1,	0x0A1D,	%o2
loop_674:
	std	%i2,	[%l7 + 0x38]
loop_675:
	fmovdue	%fcc1,	%f14,	%f30
loop_676:
	nop 	! 	tsubcctv	%g6,	0x6c,	%l4 changed by convert2hboot
	movleu	%icc,	0x2A7,	%o6
	smul	%l2,	0x0B3D,	%i4
	movrlez	%l3,	0x38D,	%i1
	movcc	%xcc,	0x0BA,	%i0
	fmovdne	%icc,	%f24,	%f4
	array8	%l5,	%o4,	%o0
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%o0
	fcmps	%fcc0,	%f8,	%f28
	call	loop_677
	call	loop_678
	fcmpne32	%f8,	%f8,	%g4
	call	loop_679
loop_677:
	call	loop_680
loop_678:
	call	loop_681
	nop 	! 	rdhpr	%hpstate,	%l0 changed by convert2hboot
loop_679:
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%f28
loop_680:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x11,	%asi changed by convert2hboot
loop_681:
	nop
	setx	0x1904,	%l0,	%g2
	sdivcc	%o5,	%g2,	%l6
	movu	%fcc3,	%o7,	%i6
	call	loop_682
	call	loop_683
	xorcc	%g3,	%i7,	%g5
	move	%fcc3,	0x666,	%g7
loop_682:
	xnorcc	%o3,	0x0C3C,	%l1
loop_683:
	call	loop_684
	sra	%i3,	%g1,	%o2
	call	loop_685
	nop 	! 	taddcc	%g6,	0x3f,	%i2 changed by convert2hboot
loop_684:
	call	loop_686
	call	loop_687
loop_685:
	call	loop_688
	movrlz	%l4,	0x22D,	%l2
loop_686:
	call	loop_689
loop_687:
	call	loop_690
loop_688:
	array8	%o6,	%i4,	%i1
	call	loop_691
loop_689:
	bvc,a	%xcc,	loop_692
loop_690:
	fmovd	%f26,	%f2
	call	loop_693
loop_691:
	call	loop_694
loop_692:
	fmovsge	%fcc1,	%f4,	%f0
	call	loop_695
loop_693:
	call	loop_696
loop_694:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	addc	%l3,	0x10DD,	%i0
loop_695:
	wr	%g0,	0x0,	%pcr	! 	wr	%o4,	%o0,	%y changed by convert2hboot
loop_696:
	flushw
	call	loop_697
	membar	0x55
	call	loop_698
	call	loop_699
loop_697:
	for	%f18,	%f30,	%f2
	call	loop_700
loop_698:
	xnorcc	%o1,	%g4,	%l5
loop_699:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	edge32	%l0,	%i5,	%o5
loop_700:
	movg	%icc,	0x6FF,	%l6
	call	loop_701
	call	loop_702
	fmul8x16	%f11,	%f4,	%f26
	call	loop_703
loop_701:
	movcs	%icc,	0x39E,	%o7
loop_702:
	nop
	set	0x5C, %o6
	flush	%l7 + %o6
	call	loop_704
loop_703:
	bn	%xcc,	loop_705
	call	loop_706
	nop 	! 	taddcc	%g2,	%g3,	%i6 changed by convert2hboot
loop_704:
	fnands	%f1,	%f22,	%f10
loop_705:
	popc	0x0A60,	%i7
loop_706:
	bmask	%g5,	%o3,	%l1
	nop 	! 	tcc	%icc,	0x7d changed by convert2hboot
	call	loop_707
	call	loop_708
	call	loop_709
	call	loop_710
loop_707:
	sllx	%i3,	0x03,	%g7
loop_708:
	call	loop_711
loop_709:
	call	loop_712
loop_710:
	movne	%xcc,	%g1,	%o2
	fandnot1	%f6,	%f24,	%f8
loop_711:
	add	%i2,	0x04EB,	%l4
loop_712:
	fbg,a,pt	%fcc0,	loop_713
	or	%l2,	0x1434,	%g6
	popc	0x0DD6,	%i4
	call	loop_714
loop_713:
	fmovrse	%o6,	%f29,	%f22
	fmul8x16	%f3,	%f22,	%f30
	wr	%g0,	0x0,	%pcr	! 	wr	%i1,	0x1B4D,	%pic changed by convert2hboot
loop_714:
	fmul8x16	%f10,	%f30,	%f10
	call	loop_715
	nop 	! 	tge	%xcc,	0x5d changed by convert2hboot
	edge32	%i0,	%o4,	%o0
	movne	%fcc3,	0x043,	%o1
loop_715:
	call	loop_716
	orcc	%g4,	0x15C8,	%l5
	ld	[%l7 + 0x7C],	%f5
	udiv	%l3,	0x0FDD,	%l0
loop_716:
	bn,a,pt	%icc,	loop_717
	bne,pt	%icc,	loop_718
	nop 	! 	tle	%icc,	0x6c changed by convert2hboot
	call	loop_719
loop_717:
	call	loop_720
loop_718:
	call	loop_721
	movpos	%icc,	%o5,	%i5
loop_719:
	edge16ln	%l6,	%g2,	%g3
loop_720:
	call	loop_722
loop_721:
	fble	%fcc3,	loop_723
	call	loop_724
	call	loop_725
loop_722:
	xnorcc	%o7,	0x0962,	%i6
loop_723:
	movpos	%xcc,	0x253,	%g5
loop_724:
	call	loop_726
loop_725:
	movvs	%xcc,	0x0FA,	%i7
	addccc	%l1,	%i3,	%g7
	xor	%o3,	%o2,	%g1
loop_726:
	or	%l4,	0x08E4,	%l2
	rd	%y,	%i2
	edge16l	%g6,	%o6,	%i1
	edge16	%i4,	%o4,	%i0
	movneg	%icc,	0x20B,	%o0
	call	loop_727
	call	loop_728
	call	loop_729
	call	loop_730
loop_727:
	smulcc	%o1,	0x019A,	%l5
loop_728:
	movul	%fcc2,	0x749,	%l3
loop_729:
	fbl	%fcc0,	loop_731
loop_730:
	call	loop_732
	fcmps	%fcc2,	%f24,	%f8
	fnegd	%f2,	%f10
loop_731:
	nop
	nop
	setx	0xE82FB149,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xEC834EED,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f1,	%f15
loop_732:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x2b,	%asi changed by convert2hboot
	membar	#Sync
	edge8n	%g4,	%o5,	%l6
	call	loop_733
	call	loop_734
	call	loop_735
	nop 	! 	tvc	%xcc,	0x4f changed by convert2hboot
loop_733:
	call	loop_736
loop_734:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_735:
	call	loop_737
	sth	%g2,	[%l7 + 0x0A]
loop_736:
	call	loop_738
	call	loop_739
loop_737:
	fmovrsgez	%i5,	%f7,	%f4
	fbule	%fcc2,	loop_740
loop_738:
	call	loop_741
loop_739:
	movule	%fcc3,	%o7,	%g3
	call	loop_742
loop_740:
	movpos	%xcc,	0x58D,	%g5
loop_741:
	alignaddrl	%i7,	%l1,	%i3
	call	loop_743
loop_742:
	call	loop_744
	call	loop_745
	fmovdvs	%xcc,	%f30,	%f8
loop_743:
	fmovsue	%fcc3,	%f15,	%f21
loop_744:
	fmul8x16	%f24,	%f6,	%f24
loop_745:
	call	loop_746
	edge8ln	%i6,	%o3,	%g7
	call	loop_747
	movrlez	%o2,	0x340,	%l4
loop_746:
	st	%f22,	[%l7 + 0x54]
	nop 	! 	tgu	%xcc,	0x7c changed by convert2hboot
loop_747:
	call	loop_748
	call	loop_749
	nop 	! 	tneg	%icc,	0x55 changed by convert2hboot
	movul	%fcc2,	%l2,	%g1
loop_748:
	movrgz	%g6,	0x357,	%i2
loop_749:
	addcc	%o6,	0x1995,	%i4
	call	loop_750
	fcmps	%fcc3,	%f7,	%f13
	stx	%o4,	[%l7 + 0x48]
	call	loop_751
loop_750:
	call	loop_752
	flush	%l7 + 0x5C
	movl	%fcc2,	%i0,	%i1
loop_751:
	call	loop_753
loop_752:
	call	loop_754
	movule	%fcc3,	%o0,	%o1
	call	loop_755
loop_753:
	addc	%l5,	0x0D3A,	%l0
loop_754:
	call	loop_756
	xnor	%g4,	%o5,	%l6
loop_755:
	andcc	%g2,	%i5,	%l3
	call	loop_757
loop_756:
	call	loop_758
	fble	%fcc3,	loop_759
	nop 	! 	taddcc	%g3,	%o7,	%i7 changed by convert2hboot
loop_757:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_758:
	rd	%sys_tick_cmpr,	%l1
loop_759:
	alignaddrl	%g5,	%i3,	%o3
	xor	%g7,	0x0D76,	%i6
	umulcc	%l4,	0x156C,	%l2
	andncc	%o2,	%g6,	%i2
	rd	%asi,	%o6
	nop
	set	0x28, %l4
	stx	%i4,	[%l7 + %l4]
	call	loop_760
	ldd	[%l7 + 0x70],	%g0
	fmovsug	%fcc2,	%f17,	%f28
	set	0x08, %o0
	nop	 ! 	ldxa	[%l7 + %o0] 0x80,	%o4 ASI use replaced by convert2hboot
loop_760:
	call	loop_761
	nop
	nop
	setx	0x35F1F8A0A05B2400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	nop
	set	0x0B, %l3
	ldsb	[%l7 + %l3],	%i1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr	%g0,	0x0,	%pcr	! 	wr 	%l0, 	0x4FC, 	%tick_cmpr changed by convert2hboot
loop_761:
	call	loop_762
	array32	%o1,	%o0,	%l5
	call	loop_763
	lduh	[%l7 + 0x0C],	%l0
loop_762:
	nop 	! 	tcc	%icc,	0x37 changed by convert2hboot
	mulscc	%g4,	%o5,	%l6
loop_763:
	rd	%tick_cmpr,	%i5
	subc	%l3,	0x1AD8,	%g3
	pdist	%f2,	%f20,	%f0
	call	loop_764
	smulcc	%o7,	%g2,	%l1
	addccc	%g5,	0x051E,	%i7
	call	loop_765
loop_764:
	array16	%o3,	%g7,	%i3
	call	loop_766
	call	loop_767
loop_765:
	call	loop_768
	edge8l	%l4,	%l2,	%i6
loop_766:
	call	loop_769
loop_767:
	nop
	nop
	setx	0x907EA400,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
loop_768:
	call	loop_770
	call	loop_771
loop_769:
	umul	%g6,	0x0B18,	%o2
	call	loop_772
loop_770:
	call	loop_773
loop_771:
	orcc	%i2,	%i4,	%o6
	call	loop_774
loop_772:
	call	loop_775
loop_773:
	call	loop_776
	call	loop_777
loop_774:
	fmovsle	%fcc2,	%f27,	%f22
loop_775:
	bpos	%icc,	loop_778
loop_776:
	call	loop_779
loop_777:
	wrpr	%g1,	%i1,	%pil
	edge16ln	%o4,	%o1,	%i0
loop_778:
	nop 	! 	tgu	%icc,	0x40 changed by convert2hboot
loop_779:
	array32	%l5,	%o0,	%l0
	fmovrsgz	%g4,	%f14,	%f15
	edge16	%l6,	%o5,	%l3
	fbe	%fcc2,	loop_780
	bmask	%i5,	%g3,	%o7
	nop
	nop
	setx	0x687ED6DE2D575B84,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xCA7C107587F5F746,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f16,	%f20
	call	loop_781
loop_780:
	call	loop_782
	call	loop_783
	edge32n	%l1,	%g2,	%g5
loop_781:
	add	%o3,	0x1366,	%i7
loop_782:
	fmovdvs	%xcc,	%f26,	%f28
loop_783:
	nop 	! 	tsubcc	%g7,	%i3,	%l2 changed by convert2hboot
	call	loop_784
	nop 	! 	tvc	%icc,	0x69 changed by convert2hboot
	nop
	setx	0x0209,	%l0,	%i6
	udivcc	%l4,	%i6,	%o2
	call	loop_785
loop_784:
	call	loop_786
	edge16ln	%g6,	%i4,	%o6
	call	loop_787
loop_785:
	nop
	set	0x70, %g6
	std	%f14,	[%l7 + %g6]
loop_786:
	subccc	%g1,	0x16BE,	%i2
	fmovsn	%fcc1,	%f29,	%f14
loop_787:
	ba,a,pt	%xcc,	loop_788
	call	loop_789
	smulcc	%o4,	%i1,	%o1
	ldx	[%l7 + 0x18],	%l5
loop_788:
	fbug,a,pn	%fcc3,	loop_790
loop_789:
	fsrc2	%f6,	%f24
	nop
	fitos	%f13,	%f14
	fstox	%f14,	%f24
	call	loop_791
loop_790:
	call	loop_792
	movcc	%icc,	%i0,	%o0
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_791:
	bpos	%icc,	loop_793
loop_792:
	call	loop_794
	call	loop_795
	call	loop_796
loop_793:
	movule	%fcc1,	%g4,	%l0
loop_794:
	fmuld8ulx16	%f3,	%f26,	%f30
loop_795:
	nop
	set	0x68, %g1
	ldx	[%l7 + %g1],	%o5
loop_796:
	call	loop_797
	nop 	! 	tneg	%xcc,	0x42 changed by convert2hboot
	call	loop_798
	subccc	%l6,	%i5,	%l3
loop_797:
	call	loop_799
	brlez,pn	%g3,	loop_800
loop_798:
	nop
	nop
	setx	0x64B400,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	movre	%o7,	0x38E,	%l1
loop_799:
	movg	%xcc,	%g5,	%g2
loop_800:
	fbule,pn	%fcc3,	loop_801
	srl	%o3,	0x01,	%i7
	srlx	%i3,	0x10,	%l2
	nop 	! 	taddcc	%g7,	%i6,	%l4 changed by convert2hboot
loop_801:
	call	loop_802
	call	loop_803
	fble,pn	%fcc0,	loop_804
	movcs	%xcc,	0x4DF,	%o2
loop_802:
	sllx	%g6,	0x1B,	%o6
loop_803:
	edge16ln	%i4,	%g1,	%o4
loop_804:
	sllx	%i1,	%i2,	%o1
	call	loop_805
	nop 	! 	te	%icc,	0x41 changed by convert2hboot
	movrgz	%i0,	0x1D5,	%l5
	movneg	%icc,	0x2DE,	%g4
loop_805:
	wrpr 	%g0, 	0x3, 	%gl
	movl	%icc,	%o0,	%l6
	movrlez	%o5,	%i5,	%l3
	srl	%o7,	%g3,	%l1
	nop 	! 	tsubcctv	%g5,	0x47,	%g2 changed by convert2hboot
	call	loop_806
	call	loop_807
	edge16	%o3,	%i7,	%l2
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x04,	%asi changed by convert2hboot
loop_806:
	nop
	fitos	%f1,	%f12
	fstod	%f12,	%f14
loop_807:
	andn	%i3,	0x03B6,	%l4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	fmovse	%xcc,	%f6,	%f25
	call	loop_808
	fmul8x16	%f18,	%f20,	%f18
	nop
	fitos	%f10,	%f18
	fstoi	%f18,	%f26
	edge32n	%i6,	%o6,	%g6
loop_808:
	call	loop_809
	brlez,a,pn	%i4,	loop_810
	bl,a,pt	%icc,	loop_811
	rdpr	%pil,	%o4
loop_809:
	nop
	set	0x10, %o7
	nop	 ! 	stda	%g0,	[%l7 + %o7] 0x04 ASI use replaced by convert2hboot
loop_810:
	umulcc	%i2,	0x1463,	%i1
loop_811:
	mova	%fcc0,	0x50A,	%i0
	call	loop_812
	call	loop_813
	call	loop_814
	fmovdo	%fcc0,	%f26,	%f30
loop_812:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
loop_813:
	call	loop_815
loop_814:
	movu	%fcc2,	0x23E,	%g4
	nop
	setx	0x100B,	%l0,	%l5
	sdivcc	%l0,	%l5,	%l6
	bvs	%xcc,	loop_816
loop_815:
	ldub	[%l7 + 0x42],	%o0
	array32	%o5,	%i5,	%o7
	call	loop_817
loop_816:
	andn	%l3,	%g3,	%g5
	call	loop_818
	call	loop_819
loop_817:
	subccc	%l1,	%o3,	%g2
	call	loop_820
loop_818:
	call	loop_821
loop_819:
	call	loop_822
	nop 	! 	tsubcc	%l2,	%g7,	%i3 changed by convert2hboot
loop_820:
	movl	%fcc1,	0x7E1,	%l4
loop_821:
	call	loop_823
loop_822:
	fxors	%f9,	%f12,	%f27
	call	loop_824
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%o2 changed by convert2hboot
loop_823:
	wr	%g0,	0x0,	%pcr	! 	wr	%i7,	0x11FD,	%sys_tick changed by convert2hboot
	call	loop_825
loop_824:
	nop 	! 	rdhpr	%hintp,	%o6 changed by convert2hboot
	wr	%g0,	0x0,	%pcr	! 	wr	%i6,	%g6,	%ccr changed by convert2hboot
	call	loop_826
loop_825:
	call	loop_827
	call	loop_828
	call	loop_829
loop_826:
	call	loop_830
loop_827:
	call	loop_831
loop_828:
	movcs	%xcc,	0x6F9,	%o4
loop_829:
	alignaddr	%g1,	%i4,	%i2
loop_830:
	sdiv	%i0,	0x09AB,	%o1
loop_831:
	nop 	! 	tge	%icc,	0x4c changed by convert2hboot
	ld	[%l7 + 0x14],	%f7
	set	0x20, %g7
	nop	 ! 	lduba	[%l7 + %g7] 0x04,	%g4 ASI use replaced by convert2hboot
	addcc	%l0,	0x1366,	%i1
	call	loop_832
	fmovdgu	%icc,	%f18,	%f2
	orcc	%l6,	%o0,	%l5
	wrpr	%i5,	0x03B2,	%pil
loop_832:
	brgz,pn	%o7,	loop_833
	call	loop_834
	subcc	%o5,	0x1CB7,	%l3
	call	loop_835
loop_833:
	fmovde	%icc,	%f28,	%f12
loop_834:
	rd	%softint,	%g3
	set	0x54, %i1
	nop	 ! 	lduha	[%l7 + %i1] 0x81,	%g5 ASI use replaced by convert2hboot
loop_835:
	array16	%l1,	%g2,	%l2
	movle	%icc,	%g7,	%o3
	call	loop_836
	sra	%i3,	0x01,	%l4
	bcs,a,pn	%xcc,	loop_837
	fmovdge	%fcc1,	%f26,	%f4
loop_836:
	ldsh	[%l7 + 0x2A],	%i7
	ld	[%l7 + 0x44],	%f10
loop_837:
	call	loop_838
	call	loop_839
	orcc	%o2,	%i6,	%g6
	fmovsug	%fcc1,	%f13,	%f21
loop_838:
	call	loop_840
loop_839:
	call	loop_841
	nop 	! 	tne	%icc,	0x6d changed by convert2hboot
	movge	%icc,	0x4C9,	%o6
loop_840:
	flushw
loop_841:
	call	loop_842
	andcc	%g1,	%i4,	%i2
	nop 	! 	tvs	%xcc,	0x4b changed by convert2hboot
	fmovsvs	%xcc,	%f21,	%f16
loop_842:
	bvs,pt	%icc,	loop_843
	nop 	! 	tcs	%icc,	0x61 changed by convert2hboot
	call	loop_844
	call	loop_845
loop_843:
	call	loop_846
	movrne	%i0,	%o1,	%o4
loop_844:
	call	loop_847
loop_845:
	call	loop_848
loop_846:
	fbue,pt	%fcc1,	loop_849
	stx	%l0,	[%l7 + 0x28]
loop_847:
	wrpr	%i1,	%l6,	%pil
loop_848:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x04,	%asi changed by convert2hboot
loop_849:
	movre	%l5,	0x309,	%i5
	call	loop_850
	call	loop_851
	call	loop_852
	call	loop_853
loop_850:
	call	loop_854
loop_851:
	movn	%icc,	%o0,	%o7
loop_852:
	nop 	! 	tcc	%xcc,	0x68 changed by convert2hboot
loop_853:
	nop
	nop
	setx	0x504F4800,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
loop_854:
	nop
	fitos	%f5,	%f11
	fstox	%f11,	%f2
	fxtos	%f2,	%f27
	call	loop_855
	wrpr	%l3,	%o5,	%pil
	call	loop_856
	call	loop_857
loop_855:
	bneg	%icc,	loop_858
	call	loop_859
loop_856:
	call	loop_860
loop_857:
	movul	%fcc3,	0x42D,	%g5
loop_858:
	call	loop_861
loop_859:
	fmul8ulx16	%f0,	%f12,	%f4
loop_860:
	fbge,a,pt	%fcc0,	loop_862
	call	loop_863
loop_861:
	nop
	fitos	%f4,	%f19
	fstoi	%f19,	%f31
	fbl,a	%fcc3,	loop_864
loop_862:
	bcc,pn	%icc,	loop_865
loop_863:
	call	loop_866
	movre	%g3,	%g2,	%l1
loop_864:
	bge,a,pn	%icc,	loop_867
loop_865:
	edge16l	%l2,	%g7,	%o3
loop_866:
	movcs	%xcc,	%l4,	%i3
	bmask	%o2,	%i7,	%g6
loop_867:
	nop 	! 	tne	%xcc,	0x64 changed by convert2hboot
	call	loop_868
	call	loop_869
	movpos	%icc,	0x7A7,	%o6
	brlz,a	%i6,	loop_870
loop_868:
	nop 	! 	tl	%xcc,	0x76 changed by convert2hboot
loop_869:
	movug	%fcc3,	0x0BF,	%i4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x04,	%asi changed by convert2hboot
	lda	[%l6] %asi,	%g1
	nop	 ! 	casa	[%l6] 0x04,	%g1,	%i2 ASI use replaced by convert2hboot
loop_870:
	sethi	0x035E,	%o1
	smul	%o4,	%i0,	%i1
	edge16l	%l0,	%l6,	%g4
	nop 	! 	tcc	%xcc,	0x4f changed by convert2hboot
	nop 	! 	tcc	%icc,	0x75 changed by convert2hboot
	movule	%fcc3,	%l5,	%i5
	orcc	%o0,	%l3,	%o5
	alignaddr	%g5,	%o7,	%g2
	call	loop_871
	addc	%l1,	%g3,	%g7
	movle	%xcc,	0x414,	%l2
	movu	%fcc2,	0x239,	%o3
loop_871:
	movrlz	%i3,	0x226,	%o2
	movg	%icc,	%i7,	%l4
	call	loop_872
	ldstub	[%l7 + 0x44],	%o6
	sethi	0x1EE7,	%i6
	addc	%g6,	0x0E5A,	%g1
loop_872:
	movrgez	%i4,	0x052,	%o1
	call	loop_873
	fmovspos	%icc,	%f1,	%f31
	call	loop_874
	nop
	setx	0x0CF0,	%l0,	%o4
	sdivx	%i2,	%o4,	%i1
loop_873:
	subccc	%l0,	0x0EAE,	%l6
	mulscc	%g4,	0x11EE,	%l5
loop_874:
	subccc	%i0,	%o0,	%l3
	fcmple16	%f24,	%f2,	%i5
	fzeros	%f8
	ble,pn	%xcc,	loop_875
	bn,pt	%icc,	loop_876
	edge32n	%g5,	%o5,	%o7
	rd	%fprs,	%l1
loop_875:
	call	loop_877
loop_876:
	fmovdpos	%icc,	%f6,	%f16
	for	%f12,	%f18,	%f18
	bmask	%g3,	%g2,	%l2
loop_877:
	nop
	setx	loop_878,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x004400001407,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	tvc	%xcc,	0x6b changed by convert2hboot
	fbuge,a	%fcc1,	loop_879
	rdpr	%cansave,	%o3
loop_878:
	nop 	! 	tn	%icc,	0x65 changed by convert2hboot
	call	loop_880
loop_879:
	movl	%fcc0,	%g7,	%o2
	xor	%i3,	0x02DF,	%i7
	call	loop_881
loop_880:
	movn	%fcc1,	%l4,	%i6
	xor	%g6,	0x181B,	%o6
	nop
	set	0x2D, %i0
	stb	%g1,	[%l7 + %i0]
loop_881:
	nop 	! 	tneg	%xcc,	0x53 changed by convert2hboot
	wr	%g0,	0x0,	%pcr	! 	wr	%o1,	%i2,	%y changed by convert2hboot
	edge8	%i4,	%i1,	%o4
	fpack16	%f6,	%f7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xC8D, 	%hsys_tick_cmpr changed by convert2hboot
	fexpand	%f29,	%f12
	call	loop_882
	array8	%l5,	%i0,	%o0
	call	loop_883
	movrne	%l3,	%i5,	%l0
loop_882:
	fmovdcc	%xcc,	%f4,	%f30
	nop
	fitod	%f8,	%f28
	fdtoi	%f28,	%f9
loop_883:
	mova	%icc,	%g5,	%o7
	set	0x40, %l1
	nop	 ! 	ldda	[%l7 + %l1] 0x10,	%f16 ASI use replaced by convert2hboot
	call	loop_884
	call	loop_885
	bgu,a,pt	%icc,	loop_886
	call	loop_887
loop_884:
	call	loop_888
loop_885:
	call	loop_889
loop_886:
	nop 	! 	tvc	%xcc,	0x48 changed by convert2hboot
loop_887:
	fbne,pn	%fcc3,	loop_890
loop_888:
	fmovdvs	%icc,	%f14,	%f22
loop_889:
	nop 	! 	tn	%xcc,	0x65 changed by convert2hboot
	fmovdvs	%icc,	%f6,	%f0
loop_890:
	fmovsule	%fcc1,	%f17,	%f15
	fmovdge	%fcc2,	%f22,	%f0
	call	loop_891
	fpmerge	%f11,	%f29,	%f10
	andn	%l1,	%g3,	%o5
	fbge,a	%fcc2,	loop_892
loop_891:
	call	loop_893
	fbg,a,pt	%fcc0,	loop_894
	call	loop_895
loop_892:
	movrgz	%g2,	0x16E,	%l2
loop_893:
	call	loop_896
loop_894:
	fmovsl	%xcc,	%f16,	%f4
loop_895:
	movule	%fcc0,	%g7,	%o3
	srl	%i3,	0x04,	%o2
loop_896:
	call	loop_897
	movuge	%fcc3,	%i7,	%l4
	fmovdge	%xcc,	%f28,	%f6
	orncc	%i6,	%g6,	%o6
loop_897:
	movue	%fcc3,	%o1,	%g1
	wr	%g0,	0x0,	%pcr	! 	wr	%i4,	%i2,	%set_softint changed by convert2hboot
	fmovsl	%fcc2,	%f29,	%f25
	call	loop_898
	fmovdn	%fcc2,	%f26,	%f24
	fcmpne32	%f6,	%f14,	%o4
	rd	%tick_cmpr,	%l6
loop_898:
	call	loop_899
	udivcc	%i1,	0x1586,	%g4
	wrpr 	%g0, 	0x2, 	%gl
	nop
	setx loop_900, %l0, %l1
	jmpl %l1, %i0
loop_899:
	call	loop_901
	call	loop_902
	sllx	%o0,	0x1E,	%l3
loop_900:
	call	loop_903
loop_901:
	bmask	%i5,	%l0,	%o7
loop_902:
	nop
	set	0x64, %g5
	ldsw	[%l7 + %g5],	%l1
	call	loop_904
loop_903:
	fsrc1s	%f27,	%f10
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	xor	%g2,	%l2,	%g7
loop_904:
	movl	%fcc3,	0x7B8,	%g3
	nop 	! 	tle	%icc,	0x6b changed by convert2hboot
	set	0x50, %i3
	nop	 ! 	stda	%i2,	[%l7 + %i3] 0x23 ASI use replaced by convert2hboot
	membar	#Sync
	fmovde	%xcc,	%f4,	%f28
	smul	%o3,	0x02DE,	%o2
	nop 	! 	te	%icc,	0x7d changed by convert2hboot
	call	loop_905
	wr	%g0,	0x0,	%pcr	! 	wr	%i7,	%i6,	%set_softint changed by convert2hboot
	fornot2s	%f8,	%f11,	%f4
	call	loop_906
loop_905:
	call	loop_907
	nop 	! 	tsubcctv	%l4,	%o6,	%o1 changed by convert2hboot
	call	loop_908
loop_906:
	fcmple32	%f4,	%f26,	%g1
loop_907:
	mulscc	%g6,	0x1CD7,	%i4
	movle	%fcc1,	%i2,	%o4
loop_908:
	nop
	fitos	%f9,	%f24
	fstox	%f24,	%f24
	nop
	fitos	%f1,	%f25
	fstoi	%f25,	%f7
	call	loop_909
	call	loop_910
	fmovsvc	%icc,	%f2,	%f2
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x89,	%asi changed by convert2hboot
loop_909:
	ld	[%l7 + 0x1C],	%f16
loop_910:
	fpack32	%f28,	%f30,	%f22
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x2B5, 	%hsys_tick_cmpr changed by convert2hboot
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movvs	%icc,	%l5,	%i0
	nop 	! 	tleu	%icc,	0x4e changed by convert2hboot
	call	loop_911
	call	loop_912
	nop
	set	0x30, %o4
	lduh	[%l7 + %o4],	%o0
loop_911:
	call	loop_913
loop_912:
	movuge	%fcc1,	0x660,	%g4
	membar	0x5F
	edge8l	%l3,	%i5,	%l0
loop_913:
	rd	%asi,	%o7
	fnot1s	%f5,	%f20
	addcc	%l1,	0x0919,	%g5
	call	loop_914
	call	loop_915
	brlz,a,pt	%g2,	loop_916
	call	loop_917
loop_914:
	call	loop_918
loop_915:
	wr	%g0,	0x0,	%pcr	! 	wr	%l2,	0x1916,	%softint changed by convert2hboot
loop_916:
	fbne,pt	%fcc2,	loop_919
loop_917:
	movgu	%xcc,	%o5,	%g7
loop_918:
	call	loop_920
	call	loop_921
loop_919:
	bl,a,pn	%icc,	loop_922
	call	loop_923
loop_920:
	subcc	%g3,	%o3,	%i3
loop_921:
	call	loop_924
loop_922:
	call	loop_925
loop_923:
	call	loop_926
	call	loop_927
loop_924:
	bne	%xcc,	loop_928
loop_925:
	call	loop_929
loop_926:
	bvs,pt	%icc,	loop_930
loop_927:
	movlg	%fcc0,	0x18E,	%o2
loop_928:
	call	loop_931
loop_929:
	call	loop_932
loop_930:
	call	loop_933
	nop 	! 	tsubcctv	%i7,	%i6,	%l4 changed by convert2hboot
loop_931:
	call	loop_934
loop_932:
	movuge	%fcc0,	0x3F8,	%o6
loop_933:
	nop 	! 	rdpr	%tl,	%g1 changed by convert2hboot
	fbule,a	%fcc3,	loop_935
loop_934:
	subccc	%g6,	0x01DA,	%i4
	call	loop_936
	bneg,pn	%icc,	loop_937
loop_935:
	fnot2s	%f23,	%f5
	fmovdlg	%fcc0,	%f2,	%f22
loop_936:
	call	loop_938
loop_937:
	call	loop_939
	fmovso	%fcc0,	%f20,	%f30
	edge32ln	%i2,	%o4,	%o1
loop_938:
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%i6
loop_939:
	xnor	%i1,	%l5,	%o0
	call	loop_940
	nop 	! 	tvs	%icc,	0x42 changed by convert2hboot
	brlez,a,pt	%i0,	loop_941
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%f28
loop_940:
	call	loop_942
	fbu,pn	%fcc3,	loop_943
loop_941:
	nop 	! 	tl	%xcc,	0x3d changed by convert2hboot
	call	loop_944
loop_942:
	nop	!	sir	0x1E3E !! sir is illegal now
loop_943:
	array32	%l3,	%i5,	%l0
	rd	%sys_tick_cmpr,	%o7
loop_944:
	addcc	%g4,	0x145E,	%l1
	fbule	%fcc2,	loop_945
	nop
	nop
	setx	0x69D7DED60C9165DD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x5F239718B6B2DCAA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f20,	%f14
	lduh	[%l7 + 0x0A],	%g5
	call	loop_946
loop_945:
	edge8n	%l2,	%o5,	%g2
	call	loop_947
	edge8l	%g3,	%o3,	%g7
loop_946:
	fbge,pt	%fcc1,	loop_948
	sdivcc	%o2,	0x1E96,	%i7
loop_947:
	movge	%xcc,	%i6,	%l4
	fmovscs	%icc,	%f9,	%f13
loop_948:
	call	loop_949
	fbn,a	%fcc3,	loop_950
	wr	%g0,	0x0,	%pcr	! 	wr	%i3,	0x14F5,	%set_softint changed by convert2hboot
	edge32	%g1,	%o6,	%g6
loop_949:
	fxnor	%f10,	%f16,	%f6
loop_950:
	fpack16	%f28,	%f31
	subc	%i2,	0x1769,	%i4
	ldd	[%l7 + 0x70],	%f24
	call	loop_951
	srl	%o1,	%l6,	%i1
	call	loop_952
	nop 	! 	tpos	%icc,	0x42 changed by convert2hboot
loop_951:
	call	loop_953
	rd	%pc,	%o4
loop_952:
	alignaddrl	%o0,	%l5,	%l3
	call	loop_954
loop_953:
	call	loop_955
	fnands	%f1,	%f5,	%f8
	call	loop_956
loop_954:
	call	loop_957
loop_955:
	orncc	%i0,	0x122B,	%l0
	call	loop_958
loop_956:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_957:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movcc	%icc,	0x6D3,	%o7
loop_958:
	call	loop_959
	brlez,pn	%g4,	loop_960
	fmovrslz	%i5,	%f23,	%f9
	call	loop_961
loop_959:
	fors	%f16,	%f20,	%f14
loop_960:
	call	loop_962
	call	loop_963
loop_961:
	nop 	! 	tn	%xcc,	0x51 changed by convert2hboot
	fba,a,pn	%fcc0,	loop_964
loop_962:
	nop
	fitod	%f0,	%f24
	fdtoi	%f24,	%f23
loop_963:
	call	loop_965
	call	loop_966
loop_964:
	movleu	%icc,	0x3FE,	%l1
	brnz,a,pt	%g5,	loop_967
loop_965:
	call	loop_968
loop_966:
	call	loop_969
	rd	%fprs,	%l2
loop_967:
	call	loop_970
loop_968:
	call	loop_971
loop_969:
	nop
	setx	0x0A0F,	%l0,	%g2
	sdivx	%o5,	%g2,	%g3
	nop 	! 	tsubcc	%o3,	%o2,	%i7 changed by convert2hboot
loop_970:
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%i6 changed by convert2hboot
loop_971:
	call	loop_972
	movgu	%icc,	0x290,	%g7
	nop
	set	0x10, %l6
	ldx	[%l7 + %l6],	%i3
	fmovde	%xcc,	%f18,	%f8
loop_972:
	subc	%l4,	%o6,	%g1
	call	loop_973
	movue	%fcc2,	%i2,	%i4
	movrne	%g6,	0x141,	%l6
	call	loop_974
loop_973:
	movle	%xcc,	%o1,	%o4
	fmovrdgez	%o0,	%f12,	%f2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x11,	%asi changed by convert2hboot
	lda	[%l6] %asi,	%l5
	nop	 ! 	casa	[%l6] 0x11,	%l5,	%l3 ASI use replaced by convert2hboot
loop_974:
	fabss	%f28,	%f15
	call	loop_975
	nop 	! 	rdhpr	%hpstate,	%i0 changed by convert2hboot
	call	loop_976
	call	loop_977
loop_975:
	call	loop_978
	mova	%icc,	%i1,	%o7
loop_976:
	fmul8sux16	%f6,	%f28,	%f24
loop_977:
	bn,a,pt	%xcc,	loop_979
loop_978:
	nop
	setx	loop_980,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x004200001405,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	ldub	[%l7 + 0x51],	%g4
	bcc	%icc,	loop_981
loop_979:
	nop 	! 	tpos	%icc,	0x74 changed by convert2hboot
loop_980:
	call	loop_982
	call	loop_983
loop_981:
	addcc	%i5,	%l1,	%g5
	call	loop_984
loop_982:
	fbn,pn	%fcc2,	loop_985
loop_983:
	fmovrsne	%l0,	%f1,	%f20
	call	loop_986
loop_984:
	nop 	! 	tle	%xcc,	0x56 changed by convert2hboot
loop_985:
	call	loop_987
	wr	%g0,	0x0,	%pcr	! 	wr	%l2,	%o5,	%softint changed by convert2hboot
loop_986:
	fmovspos	%icc,	%f11,	%f20
	rdpr	%canrestore,	%g2
loop_987:
	nop
	set	0x28, %l0
	flush	%l7 + %l0
	movrne	%g3,	0x218,	%o3
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop	!	sir	0x0879 !! sir is illegal now
	fmovduge	%fcc1,	%f8,	%f24
	call	loop_988
	addccc	%i7,	0x1BAB,	%i6
	call	loop_989
	movul	%fcc3,	%o2,	%i3
loop_988:
	ldx	[%l7 + 0x78],	%g7
	edge32n	%o6,	%g1,	%l4
loop_989:
	nop 	! 	taddcctv	%i4,	%g6,	%i2 changed by convert2hboot
	wr	%g0,	0x0,	%pcr	! 	wr	%o1,	%l6,	%pic changed by convert2hboot
	wr	%g0,	0x0,	%pcr	! 	wr	%o4,	%o0,	%y changed by convert2hboot
	call	loop_990
	movuge	%fcc3,	0x4EA,	%l5
	faligndata	%f2,	%f16,	%f10
	sdivx	%i0,	0x1CDF,	%l3
loop_990:
	call	loop_991
	call	loop_992
	call	loop_993
	fmovda	%fcc3,	%f10,	%f8
loop_991:
	nop
	set	0x36, %g2
	stb	%i1,	[%l7 + %g2]
loop_992:
	call	loop_994
loop_993:
	call	loop_995
	array8	%o7,	%g4,	%i5
	call	loop_996
loop_994:
	movrlez	%g5,	%l1,	%l2
loop_995:
	nop
	set	0x40, %i7
	nop	 ! 	ldda	[%l7 + %i7] 0x11,	%f16 ASI use replaced by convert2hboot
loop_996:
	brlez,a,pn	%o5,	loop_997
	nop 	! 	rdhpr	%htba,	%l0 changed by convert2hboot
	movul	%fcc1,	%g2,	%g3
	call	loop_998
loop_997:
	srlx	%o3,	%i7,	%o2
	st	%f6,	[%l7 + 0x6C]
	andn	%i6,	0x0274,	%g7
loop_998:
	xor	%o6,	%g1,	%l4
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	rd	%sys_tick_cmpr,	%i3
	call	loop_999
	call	loop_1000
	fcmpeq16	%f30,	%f2,	%i4
	set	0x18, %i6
	nop	 ! 	prefetcha	[%l7 + %i6] 0x0c,	 0 ASI use replaced by convert2hboot
loop_999:
	fbne,pn	%fcc3,	loop_1001
loop_1000:
	bcs,pt	%xcc,	loop_1002
	nop
	set	0x2C, %o5
	ldsh	[%l7 + %o5],	%o1
	fmovse	%xcc,	%f10,	%f4
loop_1001:
	smulcc	%g6,	%o4,	%l6
loop_1002:
	fbu,a	%fcc1,	loop_1003
	fmul8x16au	%f21,	%f8,	%f8
	addcc	%l5,	%i0,	%o0
	andn	%l3,	%o7,	%i1
loop_1003:
	andcc	%g4,	%g5,	%l1
	fpsub16	%f0,	%f8,	%f2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x04,	%asi changed by convert2hboot
	alignaddrl	%o5,	%l0,	%g3
	sdiv	%g2,	0x1388,	%o3
	movl	%fcc2,	%i7,	%i6
	move	%fcc2,	%o2,	%g7
	nop 	! 	rdhpr	%htba,	%o6 changed by convert2hboot
	nop 	! 	tpos	%icc,	0x7f changed by convert2hboot
	nop
	setx	0x0946,	%l0,	%g1
	udiv	%l4,	%g1,	%i3
	ble,pn	%icc,	loop_1004
	movrlez	%i2,	0x28C,	%i4
	rdpr	%otherwin,	%o1
	addcc	%o4,	%g6,	%l6
loop_1004:
	fmovdue	%fcc1,	%f6,	%f22
	nop 	! 	rdhpr	%ver,	%l5 changed by convert2hboot
	nop 	! 	tcs	%icc,	0x71 changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%o0 changed by convert2hboot
	nop
	setx	loop_1005,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x002200001402,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	andn	%i0,	0x1A7C,	%l3
	call	loop_1006
	nop 	! 	tne	%xcc,	0x47 changed by convert2hboot
loop_1005:
	fmovrdgz	%i1,	%f18,	%f0
	set	0x0C, %l5
	nop	 ! 	ldsba	[%l7 + %l5] 0x81,	%o7 ASI use replaced by convert2hboot
loop_1006:
	edge16	%g5,	%g4,	%l2
	nop
	set	0x54, %i4
	ldub	[%l7 + %i4],	%i5
	call	loop_1007
	call	loop_1008
	movcc	%xcc,	0x445,	%l1
	call	loop_1009
loop_1007:
	fsrc2	%f16,	%f10
loop_1008:
	call	loop_1010
	wr	%g0,	0x0,	%pcr	! 	wr	%l0,	%g3,	%sys_tick changed by convert2hboot
loop_1009:
	call	loop_1011
	fbue	%fcc1,	loop_1012
loop_1010:
	fmovsleu	%xcc,	%f24,	%f11
	smul	%o5,	0x1747,	%g2
loop_1011:
	st	%f25,	[%l7 + 0x10]
loop_1012:
	umulcc	%i7,	%i6,	%o3
	call	loop_1013
	fmovsuge	%fcc2,	%f29,	%f13
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f10
	fxtod	%f10,	%f2
	call	loop_1014
loop_1013:
	nop 	! 	tle	%icc,	0x4e changed by convert2hboot
	nop
	set	0x4C, %g3
	prefetch	[%l7 + %g3],	 0
	call	loop_1015
loop_1014:
	alignaddrl	%o2,	%o6,	%g7
	nop 	! 	rdhpr	%hintp,	%g1 changed by convert2hboot
	edge8l	%i3,	%i2,	%i4
loop_1015:
	movrgez	%o1,	0x2AE,	%l4
	array8	%o4,	%g6,	%l5
	set	0x10, %l2
	nop	 ! 	stda	%i6,	[%l7 + %l2] 0x27 ASI use replaced by convert2hboot
	membar	#Sync
	sethi	0x170D,	%i0
	call	loop_1016
	call	loop_1017
	nop
	set	0x64, %g4
	ldsw	[%l7 + %g4],	%o0
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1016:
	orn	%i1,	0x1334,	%o7
loop_1017:
	nop 	! 	tvs	%xcc,	0x70 changed by convert2hboot
	call	loop_1018
	smulcc	%l3,	0x09DC,	%g5
	call	loop_1019
	call	loop_1020
loop_1018:
	call	loop_1021
	call	loop_1022
loop_1019:
	call	loop_1023
loop_1020:
	movgu	%icc,	%l2,	%g4
loop_1021:
	nop 	! 	rdhpr	%htba,	%l1 changed by convert2hboot
loop_1022:
	bcs,a,pn	%xcc,	loop_1024
loop_1023:
	call	loop_1025
	nop
	nop
	setx	0x3DEA9D0D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f16
	nop
	setx	0x0425,	%l0,	%g3
	sdivx	%l0,	%g3,	%i5
loop_1024:
	call	loop_1026
loop_1025:
	call	loop_1027
	srl	%g2,	0x0B,	%i7
	call	loop_1028
loop_1026:
	call	loop_1029
loop_1027:
	call	loop_1030
	array8	%i6,	%o5,	%o2
loop_1028:
	nop
	setx loop_1031, %l0, %l1
	jmpl %l1, %o6
loop_1029:
	fbn	%fcc1,	loop_1032
loop_1030:
	call	loop_1033
	sth	%g7,	[%l7 + 0x64]
loop_1031:
	movuge	%fcc1,	%g1,	%i3
loop_1032:
	rd	%ccr,	%o3
loop_1033:
	call	loop_1034
	call	loop_1035
	call	loop_1036
	subccc	%i4,	0x08A1,	%o1
loop_1034:
	addccc	%l4,	0x1042,	%i2
loop_1035:
	fpadd32	%f12,	%f22,	%f26
loop_1036:
	wrpr 	%g0, 	0x3, 	%gl
	fba	%fcc2,	loop_1037
	call	loop_1038
	call	loop_1039
	fmovrsgez	%g6,	%f24,	%f22
loop_1037:
	call	loop_1040
loop_1038:
	call	loop_1041
loop_1039:
	fmovdl	%fcc2,	%f4,	%f24
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x10,	%asi changed by convert2hboot
	nop	 ! 	casxa	[%l6] 0x10,	%l6,	%i0 ASI use replaced by convert2hboot
loop_1040:
	nop 	! 	tne	%icc,	0x6a changed by convert2hboot
loop_1041:
	nop 	! 	tleu	%xcc,	0x46 changed by convert2hboot
	udivx	%l5,	0x03C5,	%i1
	movo	%fcc2,	0x037,	%o7
	call	loop_1042
	st	%f19,	[%l7 + 0x0C]
	ldsb	[%l7 + 0x73],	%l3
	call	loop_1043
loop_1042:
	bge,pn	%xcc,	loop_1044
	call	loop_1045
	movvs	%icc,	0x412,	%g5
loop_1043:
	fornot1s	%f2,	%f19,	%f20
loop_1044:
	call	loop_1046
loop_1045:
	nop	!	sir	0x1746 !! sir is illegal now
	umulcc	%l2,	%g4,	%o0
	call	loop_1047
loop_1046:
	edge8l	%l1,	%l0,	%i5
	movul	%fcc3,	%g2,	%g3
	sub	%i6,	%o5,	%o2
loop_1047:
	call	loop_1048
	call	loop_1049
	call	loop_1050
	call	loop_1051
loop_1048:
	bcc,a	%xcc,	loop_1052
loop_1049:
	nop 	! 	tl	%icc,	0x4b changed by convert2hboot
loop_1050:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
loop_1051:
	movue	%fcc2,	%i7,	%g1
loop_1052:
	call	loop_1053
	call	loop_1054
	umulcc	%i3,	0x1B94,	%i4
	fmovsa	%xcc,	%f6,	%f10
loop_1053:
	umulcc	%o1,	0x12B1,	%o3
loop_1054:
	nop 	! 	taddcc	%l4,	%o4,	%g6 changed by convert2hboot
	xorcc	%l6,	%i2,	%i0
	call	loop_1055
	sub	%i1,	0x1033,	%l5
	nop
	set	0x28, %o1
	lduh	[%l7 + %o1],	%o7
	subccc	%g5,	0x0947,	%l3
loop_1055:
	nop 	! 	tsubcctv	%g4,	%l2,	%o0 changed by convert2hboot
	nop 	! 	tpos	%icc,	0x76 changed by convert2hboot
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x88,	%asi changed by convert2hboot
	sta	%f19,	[%l7 + 0x2C] %asi
	call	loop_1056
	movgu	%xcc,	%l1,	%i5
	be,a,pt	%icc,	loop_1057
	call	loop_1058
loop_1056:
	nop 	! 	tge	%xcc,	0x79 changed by convert2hboot
	call	loop_1059
loop_1057:
	ldub	[%l7 + 0x65],	%l0
loop_1058:
	nop 	! 	rdhpr	%hintp,	%g2 changed by convert2hboot
	nop
	fitos	%f30,	%f27
loop_1059:
	alignaddrl	%g3,	%o5,	%o2
	movcc	%xcc,	%o6,	%g7
	call	loop_1060
	nop
	set	0x60, %i2
	std	%f0,	[%l7 + %i2]
	bleu,a,pt	%icc,	loop_1061
	fnands	%f31,	%f0,	%f4
loop_1060:
	call	loop_1062
	nop 	! 	tcs	%xcc,	0x53 changed by convert2hboot
loop_1061:
	fmul8x16al	%f28,	%f19,	%f18
	rd	%asi,	%i6
loop_1062:
	call	loop_1063
	call	loop_1064
	nop 	! 	rdpr	%tba,	%i7 changed by convert2hboot
	movug	%fcc2,	%g1,	%i3
loop_1063:
	sll	%o1,	%i4,	%l4
loop_1064:
	nop 	! 	tvc	%xcc,	0x77 changed by convert2hboot
	rd	%ccr,	%o3
	call	loop_1065
	fsrc1	%f10,	%f4
	call	loop_1066
	ba,a	%xcc,	loop_1067
loop_1065:
	bshuffle	%f0,	%f4,	%f26
	nop 	! 	tle	%xcc,	0x7f changed by convert2hboot
loop_1066:
	call	loop_1068
loop_1067:
	sllx	%o4,	0x04,	%l6
	call	loop_1069
	lduw	[%l7 + 0x60],	%g6
loop_1068:
	nop
	fitod	%f0,	%f28
	fdtos	%f28,	%f1
	nop
	fitos	%f2,	%f29
	fstox	%f29,	%f6
	fxtos	%f6,	%f6
loop_1069:
	movre	%i0,	%i1,	%l5
	fmovrdgz	%o7,	%f12,	%f26
	fmul8x16al	%f27,	%f12,	%f16
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x80,	%asi changed by convert2hboot
	lda	[%l7 + 0x08] %asi,	%f13
	subc	%g5,	0x0391,	%l3
	call	loop_1070
	flushw
	call	loop_1071
	call	loop_1072
loop_1070:
	nop
	nop
	setx	0x5BA6E42D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x4CBEB14E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f23,	%f15
	rd	%pc,	%i2
loop_1071:
	call	loop_1073
loop_1072:
	fmovrde	%g4,	%f0,	%f18
	srlx	%l2,	%l1,	%i5
	call	loop_1074
loop_1073:
	edge16l	%l0,	%g2,	%g3
	call	loop_1075
	movug	%fcc0,	0x0F0,	%o0
loop_1074:
	call	loop_1076
	fnot2s	%f31,	%f7
loop_1075:
	flushw
	call	loop_1077
loop_1076:
	call	loop_1078
	movn	%fcc3,	0x5B2,	%o2
	call	loop_1079
loop_1077:
	call	loop_1080
loop_1078:
	call	loop_1081
	edge32n	%o5,	%g7,	%i6
loop_1079:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x19,	%asi changed by convert2hboot
loop_1080:
	call	loop_1082
loop_1081:
	call	loop_1083
	fbug,a,pt	%fcc3,	loop_1084
	call	loop_1085
loop_1082:
	fabss	%f18,	%f23
loop_1083:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
loop_1084:
	call	loop_1086
loop_1085:
	call	loop_1087
	movug	%fcc2,	%o6,	%o1
	nop
	set	0x20, %o6
	sth	%l4,	[%l7 + %o6]
loop_1086:
	rd	%softint,	%i4
loop_1087:
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%o3 changed by convert2hboot
	call	loop_1088
	call	loop_1089
	call	loop_1090
	call	loop_1091
loop_1088:
	movvc	%icc,	%o4,	%g6
loop_1089:
	call	loop_1092
loop_1090:
	fmul8x16	%f10,	%f18,	%f28
loop_1091:
	movgu	%xcc,	0x4AB,	%l6
	nop 	! 	tgu	%icc,	0x3b changed by convert2hboot
loop_1092:
	fornot2s	%f2,	%f29,	%f13
	fnot1s	%f16,	%f1
	fbug	%fcc2,	loop_1093
	movn	%fcc0,	%i1,	%l5
	call	loop_1094
	fsrc1	%f12,	%f18
loop_1093:
	fmovdge	%fcc0,	%f18,	%f16
	movcs	%xcc,	0x169,	%i0
loop_1094:
	ldsh	[%l7 + 0x12],	%g5
	call	loop_1095
	umulcc	%o7,	%i2,	%g4
	call	loop_1096
	rd	%y,	%l3
loop_1095:
	call	loop_1097
	nop
	setx	0x1F55,	%l0,	%l2
	sdivcc	%l1,	%l2,	%l0
loop_1096:
	call	loop_1098
	call	loop_1099
loop_1097:
	fmovdge	%fcc3,	%f16,	%f18
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1098:
	fble	%fcc3,	loop_1100
loop_1099:
	brnz,a	%i5,	loop_1101
	nop 	! 	tleu	%xcc,	0x43 changed by convert2hboot
	rdpr	%wstate,	%g3
loop_1100:
	membar	0x15
loop_1101:
	nop 	! 	tpos	%icc,	0x3a changed by convert2hboot
	call	loop_1102
	call	loop_1103
	call	loop_1104
	nop
	setx loop_1105, %l0, %l1
	jmpl %l1, %o0
loop_1102:
	array16	%g2,	%o5,	%o2
loop_1103:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x18,	%asi changed by convert2hboot
loop_1104:
	movrgz	%i7,	0x3FE,	%i6
loop_1105:
	fble,pt	%fcc2,	loop_1106
	sll	%i3,	0x18,	%o6
	call	loop_1107
	call	loop_1108
loop_1106:
	fmovsne	%fcc3,	%f26,	%f0
	edge16	%o1,	%g1,	%i4
loop_1107:
	call	loop_1109
loop_1108:
	call	loop_1110
	call	loop_1111
	call	loop_1112
loop_1109:
	call	loop_1113
loop_1110:
	nop 	! 	tle	%icc,	0x5d changed by convert2hboot
loop_1111:
loop_1112:
	call	loop_1114
loop_1113:
	fmovrdgz	%o3,	%f0,	%f28
	call	loop_1115
	call	loop_1116
loop_1114:
	nop
	setx	loop_1117,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x004200001403,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	call	loop_1118
loop_1115:
	move	%fcc2,	0x17D,	%o4
loop_1116:
	call	loop_1119
loop_1117:
	movul	%fcc1,	0x208,	%g6
loop_1118:
	or	%l4,	%l6,	%i1
	fnot1	%f10,	%f6
loop_1119:
	nop 	! 	tcs	%xcc,	0x37 changed by convert2hboot
	call	loop_1120
	call	loop_1121
	nop 	! 	tn	%icc,	0x52 changed by convert2hboot
	call	loop_1122
loop_1120:
	call	loop_1123
loop_1121:
	call	loop_1124
	nop 	! 	tneg	%xcc,	0x7a changed by convert2hboot
loop_1122:
	nop
	set	0x18, %o3
	nop	 ! 	stda	%i0,	[%l7 + %o3] 0x81 ASI use replaced by convert2hboot
loop_1123:
	fmovsneg	%xcc,	%f1,	%f3
loop_1124:
	srlx	%l5,	0x0A,	%g5
	wrpr	%i2,	0x17FF,	%cwp
	edge32ln	%o7,	%l3,	%g4
	call	loop_1125
	wr	%g0,	0x0,	%pcr	! 	wr	%l1,	%l0,	%sys_tick changed by convert2hboot
	edge32ln	%l2,	%i5,	%o0
	bne,a,pn	%icc,	loop_1126
loop_1125:
	wr	%g0,	0x0,	%pcr	! 	wr	%g3,	%g2,	%softint changed by convert2hboot
	sllx	%o2,	0x0D,	%o5
	edge32l	%i7,	%g7,	%i6
loop_1126:
	call	loop_1127
	fnot2	%f6,	%f16
	fpack32	%f0,	%f18,	%f2
	movul	%fcc2,	%o6,	%i3
loop_1127:
	call	loop_1128
	rd	%pc,	%g1
	fmovdpos	%icc,	%f14,	%f8
	call	loop_1129
loop_1128:
	nop 	! 	rdhpr	%hpstate,	%o1 changed by convert2hboot
	fbue,a	%fcc0,	loop_1130
	rd	%softint,	%i4
loop_1129:
	nop
	set	0x08, %o0
	ldsw	[%l7 + %o0],	%o4
	nop 	! 	tsubcctv	%g6,	0x55,	%o3 changed by convert2hboot
loop_1130:
	addcc	%l6,	0x189B,	%l4
	call	loop_1131
	call	loop_1132
	call	loop_1133
	andn	%i0,	%l5,	%g5
loop_1131:
	nop
	set	0x46, %l4
	nop	 ! 	ldstuba	[%l7 + %l4] 0x80,	%i1 ASI use replaced by convert2hboot
loop_1132:
	stx	%i2,	[%l7 + 0x40]
loop_1133:
	call	loop_1134
	fmovdn	%icc,	%f20,	%f4
	fandnot1	%f30,	%f10,	%f4
	call	loop_1135
loop_1134:
	call	loop_1136
	movul	%fcc2,	%l3,	%g4
	fmovsvs	%icc,	%f28,	%f1
loop_1135:
	fzeros	%f20
loop_1136:
	call	loop_1137
	nop
	nop
	setx	0x72AC9D3C8E6BBC5E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xEDB80B01,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsmuld	%f26,	%f22,	%f20
	call	loop_1138
	call	loop_1139
loop_1137:
	rd	%tick_cmpr,	%l1
	call	loop_1140
loop_1138:
	call	loop_1141
loop_1139:
	fmovsge	%fcc3,	%f10,	%f5
	sub	%l0,	0x1EDA,	%o7
loop_1140:
	call	loop_1142
loop_1141:
	call	loop_1143
	nop
	set	0x32, %l3
	lduh	[%l7 + %l3],	%i5
	bl,pn	%xcc,	loop_1144
loop_1142:
	ba,a,pn	%xcc,	loop_1145
loop_1143:
	movug	%fcc0,	%l2,	%g3
	movrne	%g2,	0x081,	%o2
loop_1144:
	call	loop_1146
loop_1145:
	faligndata	%f14,	%f8,	%f10
	fnot1	%f0,	%f4
	call	loop_1147
loop_1146:
	movpos	%xcc,	%o5,	%i7
	call	loop_1148
	call	loop_1149
loop_1147:
	nop 	! 	tle	%xcc,	0x7b changed by convert2hboot
	nop 	! 	te	%xcc,	0x71 changed by convert2hboot
loop_1148:
	andn	%o0,	%g7,	%i6
loop_1149:
	nop
	setx	0x065B,	%l0,	%g1
	sdivcc	%o6,	%g1,	%i3
	call	loop_1150
	call	loop_1151
	movgu	%icc,	0x73B,	%o1
	set	0x40, %g1
	nop	 ! 	swapa	[%l7 + %g1] 0x89,	%o4 ASI use replaced by convert2hboot
loop_1150:
	xnor	%g6,	0x01D1,	%o3
loop_1151:
	rd	%asi,	%i4
	call	loop_1152
	and	%l6,	0x0E82,	%l4
	wr	%g0,	0x0,	%pcr	! 	wr	%i0,	%g5,	%y changed by convert2hboot
	call	loop_1153
loop_1152:
	movge	%icc,	0x6DE,	%i1
	nop
	setx	0x1487,	%l0,	%l3
	udivcc	%i2,	%l3,	%l5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr	%g0,	0x0,	%pcr	! 	wr 	%l0, 	%g0, 	%tick_cmpr changed by convert2hboot
loop_1153:
	nop 	! 	tne	%icc,	0x61 changed by convert2hboot
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x534, 	%hsys_tick_cmpr changed by convert2hboot
	nop 	! 	tle	%icc,	0x59 changed by convert2hboot
	fmovdvc	%xcc,	%f22,	%f8
	call	loop_1154
	nop 	! 	taddcctv	%i5,	0x78,	%g3 changed by convert2hboot
	call	loop_1155
	andcc	%l2,	0x15CF,	%g2
loop_1154:
	nop 	! 	wrpr	%o5,	0x0E30,	%tick changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%o2 changed by convert2hboot
loop_1155:
	call	loop_1156
	mulx	%o0,	0x11E4,	%i7
	nop 	! 	taddcctv	%i6,	%g7,	%g1 changed by convert2hboot
	bne,a	%icc,	loop_1157
loop_1156:
	fbuge,pn	%fcc1,	loop_1158
	nop 	! 	tl	%xcc,	0x4c changed by convert2hboot
	nop
	setx	0x1216,	%l0,	%o6
	sdivx	%i3,	%o6,	%o1
loop_1157:
	call	loop_1159
loop_1158:
	call	loop_1160
	call	loop_1161
	alignaddr	%o4,	%g6,	%i4
loop_1159:
	call	loop_1162
loop_1160:
	movleu	%icc,	%l6,	%o3
loop_1161:
	call	loop_1163
	nop
	fitos	%f31,	%f27
loop_1162:
	fcmpes	%fcc0,	%f12,	%f1
	edge32	%i0,	%l4,	%i1
loop_1163:
	call	loop_1164
	and	%g5,	%l3,	%l5
	call	loop_1165
	sub	%i2,	0x0EC7,	%g4
loop_1164:
	call	loop_1166
	nop 	! 	rdhpr	%hpstate,	%o7 changed by convert2hboot
loop_1165:
	movpos	%icc,	0x034,	%l0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x0c,	%asi changed by convert2hboot
	lda	[%l6] %asi,	%i5
loop_1166:
	call	loop_1167
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fblg,a,pn	%fcc2,	loop_1168
	addccc	%g3,	0x16D0,	%l2
loop_1167:
	nop 	! 	tle	%xcc,	0x51 changed by convert2hboot
	movcc	%xcc,	%g2,	%o5
loop_1168:
	call	loop_1169
	call	loop_1170
	fandnot1s	%f12,	%f18,	%f26
	nop 	! 	tge	%xcc,	0x54 changed by convert2hboot
loop_1169:
	nop 	! 	tsubcctv	%o0,	0x5a,	%o2 changed by convert2hboot
loop_1170:
	andn	%i7,	%g7,	%g1
	edge32n	%i3,	%i6,	%o6
	movg	%xcc,	%o1,	%g6
	wrpr	%i4,	%o4,	%cwp
	call	loop_1171
	call	loop_1172
	call	loop_1173
	nop
	setx	loop_1174,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x002400001401,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_1171:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1172:
	call	loop_1175
loop_1173:
	movcc	%xcc,	0x6AB,	%o3
loop_1174:
	call	loop_1176
	be,pn	%icc,	loop_1177
loop_1175:
	xnorcc	%i0,	0x0E1B,	%l6
	call	loop_1178
loop_1176:
	movrlz	%l4,	%i1,	%l3
loop_1177:
	edge8	%g5,	%l5,	%i2
	call	loop_1179
loop_1178:
	edge16n	%o7,	%l0,	%i5
	fble,pn	%fcc2,	loop_1180
	fornot2s	%f23,	%f11,	%f30
loop_1179:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	call	loop_1181
loop_1180:
	call	loop_1182
	orcc	%l2,	%l1,	%g2
	nop 	! 	tpos	%xcc,	0x6e changed by convert2hboot
loop_1181:
	nop 	! 	rdhpr	%hpstate,	%o0 changed by convert2hboot
loop_1182:
	nop
	set	0x6A, %o7
	ldstub	[%l7 + %o7],	%o2
	fmovspos	%icc,	%f21,	%f29
	call	loop_1183
	movcs	%xcc,	0x3CF,	%i7
	subc	%g7,	%g1,	%o5
	nop 	! 	tsubcc	%i6,	%o6,	%o1 changed by convert2hboot
loop_1183:
	movug	%fcc1,	%i3,	%i4
	bge	%icc,	loop_1184
	addcc	%g6,	%o4,	%i0
	nop 	! 	tvc	%xcc,	0x4f changed by convert2hboot
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xD56, 	%hsys_tick_cmpr changed by convert2hboot
loop_1184:
	call	loop_1185
	movu	%fcc0,	%l4,	%l6
	subc	%i1,	0x0F9D,	%g5
	call	loop_1186
loop_1185:
	movcc	%icc,	0x56A,	%l3
	edge8n	%i2,	%o7,	%l0
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1186:
	srl	%i5,	%l5,	%g3
	set	0x58, %g7
	nop	 ! 	lduwa	[%l7 + %g7] 0x88,	%g4 ASI use replaced by convert2hboot
	movu	%fcc0,	0x055,	%l1
	or	%g2,	0x1AFE,	%o0
	movrgez	%l2,	0x0B0,	%i7
	set	0x48, %i1
	nop	 ! 	lduha	[%l7 + %i1] 0x19,	%o2 ASI use replaced by convert2hboot
	call	loop_1187
	movrlz	%g7,	0x36A,	%o5
	nop 	! 	te	%icc,	0x68 changed by convert2hboot
	call	loop_1188
loop_1187:
	call	loop_1189
	movl	%icc,	%g1,	%i6
	set	0x78, %i0
	nop	 ! 	stda	%o6,	[%l7 + %i0] 0x22 ASI use replaced by convert2hboot
	membar	#Sync
loop_1188:
	call	loop_1190
loop_1189:
	movul	%fcc0,	0x2DD,	%i3
	edge32ln	%o1,	%g6,	%i4
	set	0x18, %l1
	nop	 ! 	prefetcha	[%l7 + %l1] 0x10,	 3 ASI use replaced by convert2hboot
loop_1190:
	movrgz	%o3,	%i0,	%l6
	movcc	%icc,	%i1,	%l4
	rd	%softint,	%g5
	nop
	nop
	setx	0xF6704187D2182BCF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x2073D2FE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsmuld	%f14,	%f0,	%f24
	call	loop_1191
	nop 	! 	tsubcc	%i2,	0x6f,	%o7 changed by convert2hboot
	umul	%l0,	%l3,	%i5
	nop
	nop
	setx	0xDA39E782,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xD5CFB1F8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f11,	%f22
loop_1191:
	nop 	! 	rdhpr	%ver,	%g3 changed by convert2hboot
	edge8ln	%l5,	%l1,	%g4
	fpmerge	%f27,	%f18,	%f12
	nop
	set	0x0C, %g5
	stw	%o0,	[%l7 + %g5]
	alignaddr	%l2,	%g2,	%o2
	call	loop_1192
	move	%icc,	%g7,	%o5
	call	loop_1193
	nop 	! 	tvc	%xcc,	0x65 changed by convert2hboot
loop_1192:
	orn	%g1,	0x17BA,	%i7
	movrlz	%i6,	%i3,	%o1
loop_1193:
	call	loop_1194
	call	loop_1195
	call	loop_1196
	movrgez	%o6,	%i4,	%g6
loop_1194:
	stx	%o3,	[%l7 + 0x18]
loop_1195:
	andncc	%o4,	%l6,	%i1
loop_1196:
	nop 	! 	tle	%icc,	0x5b changed by convert2hboot
	nop 	! 	tle	%icc,	0x3e changed by convert2hboot
	mulscc	%l4,	0x1B14,	%g5
	nop 	! 	tsubcctv	%i2,	0x6a,	%i0 changed by convert2hboot
	call	loop_1197
	nop 	! 	tvc	%icc,	0x5a changed by convert2hboot
	fbue,a,pn	%fcc0,	loop_1198
	call	loop_1199
loop_1197:
	call	loop_1200
	call	loop_1201
loop_1198:
	nop
	setx	0x01A1,	%l0,	%o7
	udiv	%l0,	%o7,	%i5
loop_1199:
	fors	%f30,	%f8,	%f5
loop_1200:
	fbuge,a,pt	%fcc2,	loop_1202
loop_1201:
	call	loop_1203
	call	loop_1204
	call	loop_1205
loop_1202:
	popc	%g3,	%l5
loop_1203:
	ldx	[%l7 + 0x20],	%l3
loop_1204:
	edge16n	%g4,	%l1,	%o0
loop_1205:
	fbg,pn	%fcc1,	loop_1206
	call	loop_1207
	fcmpgt16	%f12,	%f10,	%g2
	movle	%xcc,	0x77C,	%o2
loop_1206:
	fandnot1	%f12,	%f18,	%f22
loop_1207:
	alignaddrl	%l2,	%g7,	%o5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xE18, 	%hsys_tick_cmpr changed by convert2hboot
	edge8n	%g1,	%i3,	%i6
	wrpr	%o1,	%i4,	%cwp
	movleu	%xcc,	0x282,	%g6
	call	loop_1208
	addc	%o3,	%o6,	%o4
	bmask	%l6,	%l4,	%g5
	fbo	%fcc1,	loop_1209
loop_1208:
	nop	!	sir	0x16D7 !! sir is illegal now
	addcc	%i2,	0x1016,	%i0
	fones	%f16
loop_1209:
	call	loop_1210
	orncc	%i1,	0x18BD,	%o7
	nop 	! 	tvs	%icc,	0x62 changed by convert2hboot
	call	loop_1211
loop_1210:
	fbl	%fcc3,	loop_1212
	movrne	%i5,	0x1FE,	%l0
	wrpr	%g3,	0x061B,	%pil
loop_1211:
	call	loop_1213
loop_1212:
	nop
	setx loop_1214, %l0, %l1
	jmpl %l1, %l5
	call	loop_1215
	wrpr	%l3,	%g4,	%cwp
loop_1213:
	xor	%o0,	0x151F,	%g2
loop_1214:
	fmovdcs	%icc,	%f20,	%f2
loop_1215:
	fmul8x16	%f4,	%f2,	%f0
	nop 	! 	tne	%icc,	0x52 changed by convert2hboot
	and	%o2,	%l1,	%l2
	nop 	! 	rdpr	%tl,	%o5 changed by convert2hboot
	call	loop_1216
	movleu	%xcc,	0x50A,	%g7
	call	loop_1217
	call	loop_1218
loop_1216:
	call	loop_1219
	call	loop_1220
loop_1217:
	rdpr	%otherwin,	%i7
loop_1218:
	flush	%l7 + 0x5C
loop_1219:
	call	loop_1221
loop_1220:
	nop
	fitod	%f0,	%f28
	fdtoi	%f28,	%f28
	call	loop_1222
	bmask	%g1,	%i3,	%i6
loop_1221:
	call	loop_1223
	andn	%i4,	%g6,	%o3
loop_1222:
	alignaddrl	%o1,	%o6,	%l6
	fbu	%fcc3,	loop_1224
loop_1223:
	nop
	set	0x50, %i3
	stx	%l4,	[%l7 + %i3]
	fbue	%fcc1,	loop_1225
	call	loop_1226
loop_1224:
	call	loop_1227
	call	loop_1228
loop_1225:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1226:
	call	loop_1229
loop_1227:
	fbu,a	%fcc2,	loop_1230
loop_1228:
	nop
	set	0x62, %g6
	ldstub	[%l7 + %g6],	%o4
	nop 	! 	rdhpr	%htba,	%g5 changed by convert2hboot
loop_1229:
	andcc	%i0,	%i2,	%i1
loop_1230:
	nop
	set	0x58, %i5
	lda	[%l7 + %i5] 0x04,	%f0
	call	loop_1231
	edge32ln	%o7,	%i5,	%g3
	bne,a,pt	%xcc,	loop_1232
	call	loop_1233
loop_1231:
	movule	%fcc2,	0x06C,	%l0
	call	loop_1234
loop_1232:
	orn	%l3,	%g4,	%l5
loop_1233:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	fblg	%fcc1,	loop_1235
loop_1234:
	fxnors	%f16,	%f14,	%f0
	call	loop_1236
	srl	%o2,	0x0C,	%g2
loop_1235:
	movue	%fcc3,	0x1EC,	%l1
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%l2 changed by convert2hboot
loop_1236:
	movule	%fcc3,	%o5,	%i7
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x04,	%asi changed by convert2hboot
	lda	[%l7 + 0x64] %asi,	%f1
	rd	%pc,	%g7
	set	0x7D, %o2
	nop	 ! 	lduba	[%l7 + %o2] 0x0c,	%g1 ASI use replaced by convert2hboot
	ld	[%l7 + 0x7C],	%f25
	nop 	! 	taddcc	%i6,	0x74,	%i4 changed by convert2hboot
	smul	%g6,	%i3,	%o1
	call	loop_1237
	edge32n	%o3,	%o6,	%l6
	smulcc	%o4,	%g5,	%i0
	call	loop_1238
loop_1237:
	fmovsle	%xcc,	%f12,	%f16
	nop 	! 	tn	%icc,	0x35 changed by convert2hboot
	nop
	setx	0x054F,	%l0,	%i1
	udivcc	%l4,	%i1,	%i2
loop_1238:
	rd	%pc,	%i5
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%g3 changed by convert2hboot
	subc	%o7,	0x038F,	%l3
	movo	%fcc1,	0x0AD,	%l0
	move	%xcc,	0x053,	%g4
	array16	%l5,	%o2,	%g2
	ldd	[%l7 + 0x70],	%f20
	movlg	%fcc0,	%o0,	%l2
	call	loop_1239
	stw	%o5,	[%l7 + 0x58]
	call	loop_1240
	movug	%fcc3,	%l1,	%i7
loop_1239:
	nop
	set	0x30, %o4
	nop	 ! 	stwa	%g1,	[%l7 + %o4] 0xe3 ASI use replaced by convert2hboot
	membar	#Sync
loop_1240:
	movre	%i6,	%g7,	%i4
	sllx	%i3,	%g6,	%o1
	xnor	%o6,	0x09AF,	%o3
	edge32	%l6,	%o4,	%i0
	call	loop_1241
	call	loop_1242
	fandnot2	%f18,	%f20,	%f6
	call	loop_1243
loop_1241:
	nop 	! 	tg	%xcc,	0x50 changed by convert2hboot
loop_1242:
	fzeros	%f18
	subccc	%l4,	0x1FC6,	%g5
loop_1243:
	call	loop_1244
	call	loop_1245
	call	loop_1246
	call	loop_1247
loop_1244:
	sll	%i1,	%i5,	%i2
loop_1245:
	edge16	%o7,	%g3,	%l0
loop_1246:
	fpsub32s	%f14,	%f18,	%f21
loop_1247:
	edge32ln	%g4,	%l3,	%o2
	call	loop_1248
	movgu	%xcc,	%l5,	%g2
	call	loop_1249
	call	loop_1250
loop_1248:
	movrlez	%l2,	%o5,	%o0
	call	loop_1251
loop_1249:
	fmovdvs	%icc,	%f18,	%f12
loop_1250:
	bvc,a,pn	%xcc,	loop_1252
	call	loop_1253
loop_1251:
	sdivx	%l1,	0x0FA8,	%g1
	wrpr 	%g0, 	0x2, 	%gl
loop_1252:
	nop
	setx	loop_1254,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x011200001401,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_1253:
	nop 	! 	te	%icc,	0x55 changed by convert2hboot
	call	loop_1255
	movvs	%xcc,	0x6FA,	%g7
loop_1254:
	call	loop_1256
	brgez,pn	%i3,	loop_1257
loop_1255:
	call	loop_1258
	movo	%fcc2,	%g6,	%i4
loop_1256:
	nop 	! 	tne	%icc,	0x68 changed by convert2hboot
loop_1257:
	call	loop_1259
loop_1258:
	call	loop_1260
	call	loop_1261
	fmovsul	%fcc1,	%f17,	%f30
loop_1259:
	fpadd32s	%f12,	%f8,	%f7
loop_1260:
	movvs	%xcc,	0x3D1,	%o1
loop_1261:
	nop
	set	0x19, %l0
	nop	 ! 	lduba	[%l7 + %l0] 0x88,	%o3 ASI use replaced by convert2hboot
	call	loop_1262
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%l6 changed by convert2hboot
	call	loop_1263
	nop 	! 	tsubcctv	%o4,	0x42,	%i0 changed by convert2hboot
loop_1262:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x52,	%asi changed by convert2hboot
loop_1263:
	call	loop_1264
	fmovdvc	%xcc,	%f16,	%f14
	udivcc	%l4,	0x0472,	%i1
	call	loop_1265
loop_1264:
	nop
	nop
	setx	0x55FED68E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f29
	andcc	%i5,	0x12D6,	%g5
	call	loop_1266
loop_1265:
	fornot2	%f18,	%f16,	%f24
	srax	%i2,	%o7,	%l0
	call	loop_1267
loop_1266:
	nop 	! 	tgu	%icc,	0x6e changed by convert2hboot
	call	loop_1268
	call	loop_1269
loop_1267:
	call	loop_1270
	call	loop_1271
loop_1268:
	call	loop_1272
loop_1269:
	bge,pt	%xcc,	loop_1273
loop_1270:
	fmovdvc	%icc,	%f12,	%f0
loop_1271:
	mulscc	%g4,	0x0673,	%g3
loop_1272:
	subccc	%o2,	%l3,	%l5
loop_1273:
	nop
	nop
	setx	0x99D55A48C04FF800,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsn	%icc,	%f25,	%f15
	nop 	! 	tg	%icc,	0x7c changed by convert2hboot
	bge,a,pn	%icc,	loop_1274
	nop 	! 	tcc	%icc,	0x5d changed by convert2hboot
	nop 	! 	taddcc	%g2,	%l2,	%o5 changed by convert2hboot
	nop 	! 	tneg	%xcc,	0x38 changed by convert2hboot
loop_1274:
	call	loop_1275
	bmask	%l1,	%g1,	%i7
	call	loop_1276
	subcc	%i6,	%o0,	%g7
loop_1275:
	nop 	! 	tpos	%xcc,	0x54 changed by convert2hboot
	or	%g6,	%i4,	%o1
loop_1276:
	call	loop_1277
	call	loop_1278
	fones	%f4
	bge,a	%icc,	loop_1279
loop_1277:
	sethi	0x05D6,	%o3
loop_1278:
	smulcc	%i3,	%o4,	%i0
	fpackfix	%f12,	%f28
loop_1279:
	fcmple16	%f18,	%f16,	%l6
	array16	%l4,	%i1,	%i5
	call	loop_1280
	xorcc	%g5,	%o6,	%i2
	nop 	! 	tne	%icc,	0x45 changed by convert2hboot
	wr	%g0,	0x0,	%pcr	! 	wr	%l0,	0x0091,	%set_softint changed by convert2hboot
loop_1280:
	fmovsneg	%xcc,	%f31,	%f17
	xor	%o7,	0x0CF5,	%g3
	fbne	%fcc2,	loop_1281
	fmovsule	%fcc1,	%f4,	%f4
	bne,pn	%xcc,	loop_1282
	edge16ln	%g4,	%o2,	%l5
loop_1281:
	nop
	fitod	%f6,	%f30
	fdtox	%f30,	%f20
	brlz,a,pt	%g2,	loop_1283
loop_1282:
	call	loop_1284
	nop
	fitod	%f4,	%f28
	fdtoi	%f28,	%f30
	nop 	! 	tpos	%xcc,	0x70 changed by convert2hboot
loop_1283:
	call	loop_1285
loop_1284:
	nop 	! 	tleu	%xcc,	0x40 changed by convert2hboot
	call	loop_1286
	wr	%g0,	0x0,	%pcr	! 	wr	%l2,	0x0C4F,	%pic changed by convert2hboot
loop_1285:
	call	loop_1287
	call	loop_1288
loop_1286:
	edge32l	%l3,	%l1,	%o5
	call	loop_1289
loop_1287:
	call	loop_1290
loop_1288:
	srax	%g1,	%i7,	%o0
	nop 	! 	tg	%xcc,	0x52 changed by convert2hboot
loop_1289:
	flushw
loop_1290:
	bn,a	%xcc,	loop_1291
	movpos	%xcc,	0x2AA,	%i6
	brz,pt	%g6,	loop_1292
	call	loop_1293
loop_1291:
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%g6
	call	loop_1294
loop_1292:
	mulx	%i4,	%o1,	%i3
loop_1293:
	call	loop_1295
	smulcc	%o3,	%o4,	%l6
loop_1294:
	nop
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x04,	%asi changed by convert2hboot
loop_1295:
	srlx	%l4,	0x1D,	%i5
	ldsh	[%l7 + 0x24],	%g5
	xnorcc	%i2,	%o6,	%l0
	call	loop_1296
	subcc	%o7,	%g3,	%o2
	wrpr	%l5,	0x09B3,	%cwp
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x7C8, 	%hsys_tick_cmpr changed by convert2hboot
loop_1296:
	flush	%l7 + 0x68
	srlx	%l3,	%l1,	%o5
	call	loop_1297
	call	loop_1298
	array16	%l2,	%i7,	%o0
	sllx	%g1,	%i6,	%g6
loop_1297:
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%g6
loop_1298:
	addc	%i4,	%o1,	%o3
	call	loop_1299
	call	loop_1300
	movle	%xcc,	0x4BF,	%i3
	set	0x16, %i6
	nop	 ! 	lduha	[%l7 + %i6] 0x80,	%o4 ASI use replaced by convert2hboot
loop_1299:
	call	loop_1301
loop_1300:
	fbe	%fcc2,	loop_1302
	addccc	%l6,	0x03D8,	%i0
	flushw
loop_1301:
	call	loop_1303
loop_1302:
	call	loop_1304
	movrlz	%l4,	%i5,	%g5
	call	loop_1305
loop_1303:
	call	loop_1306
loop_1304:
	call	loop_1307
	wr	%g0,	0x0,	%pcr	! 	wr	%i1,	%i2,	%softint changed by convert2hboot
loop_1305:
	umul	%l0,	%o6,	%g3
loop_1306:
	call	loop_1308
loop_1307:
	ba	%xcc,	loop_1309
	array16	%o7,	%o2,	%g2
	fmovsn	%xcc,	%f14,	%f25
loop_1308:
	fcmpes	%fcc0,	%f19,	%f3
loop_1309:
	fbo,a,pn	%fcc0,	loop_1310
	ba,a	%xcc,	loop_1311
	call	loop_1312
	fmovsue	%fcc3,	%f28,	%f14
loop_1310:
	call	loop_1313
loop_1311:
	nop 	! 	wrpr	%g4,	%l5,	%tick changed by convert2hboot
loop_1312:
	call	loop_1314
	brz	%l1,	loop_1315
loop_1313:
	nop
	setx	0x06C8,	%l0,	%l3
	sdivx	%o5,	%l3,	%i7
	movle	%icc,	%o0,	%g1
loop_1314:
	call	loop_1316
loop_1315:
	move	%fcc1,	0x075,	%i6
	fmovdge	%xcc,	%f6,	%f20
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x18,	%asi changed by convert2hboot
loop_1316:
	edge8ln	%i4,	%o1,	%l2
	prefetch	[%l7 + 0x50],	 2
	fcmpd	%fcc3,	%f22,	%f16
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x8AC, 	%hsys_tick_cmpr changed by convert2hboot
	movle	%fcc0,	%l6,	%i0
	addccc	%l4,	%o4,	%i5
	edge8	%g5,	%i1,	%l0
	orncc	%i2,	%g3,	%o6
	nop 	! 	taddcc	%o2,	0x6b,	%g2 changed by convert2hboot
	call	loop_1317
	call	loop_1318
	call	loop_1319
	bge,pt	%icc,	loop_1320
loop_1317:
	call	loop_1321
loop_1318:
	fmovdl	%xcc,	%f6,	%f16
loop_1319:
	nop 	! 	tle	%icc,	0x3a changed by convert2hboot
loop_1320:
	movue	%fcc1,	%g4,	%l5
loop_1321:
	call	loop_1322
	movvs	%xcc,	0x393,	%o7
	membar	0x75
	rdpr	%otherwin,	%o5
loop_1322:
	call	loop_1323
	fmovsge	%icc,	%f11,	%f18
	fnot2s	%f7,	%f23
	nop
	fitos	%f5,	%f17
	fstox	%f17,	%f26
	fxtos	%f26,	%f13
loop_1323:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x04,	%asi changed by convert2hboot
	call	loop_1324
	movne	%icc,	%l3,	%o0
	call	loop_1325
	call	loop_1326
loop_1324:
	fmovd	%f30,	%f4
	edge16l	%i7,	%i6,	%g6
loop_1325:
	movrne	%g1,	0x27F,	%i4
loop_1326:
	nop
	set	0x58, %o5
	nop	 ! 	ldsba	[%l7 + %o5] 0x89,	%g7 ASI use replaced by convert2hboot
	call	loop_1327
	nop
	setx	loop_1328,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x011100001406,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	call	loop_1329
	nop
	setx	0x130D,	%l0,	%i3
	sdiv	%o1,	%i3,	%o3
loop_1327:
	nop 	! 	rdhpr	%htba,	%l6 changed by convert2hboot
loop_1328:
	edge8l	%l2,	%l4,	%i0
loop_1329:
	fmovdneg	%icc,	%f20,	%f10
	movg	%fcc0,	0x7BD,	%o4
	nop 	! 	tleu	%icc,	0x35 changed by convert2hboot
	fbue,a,pt	%fcc0,	loop_1330
	nop 	! 	taddcc	%i5,	%g5,	%l0 changed by convert2hboot
	edge8l	%i1,	%i2,	%g3
	fbul,pt	%fcc3,	loop_1331
loop_1330:
	nop
	nop
	setx	0xEC093C2707E9400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	nop 	! 	rdhpr	%htba,	%o6 changed by convert2hboot
	fpadd32s	%f27,	%f23,	%f17
loop_1331:
	nop 	! 	tgu	%xcc,	0x6d changed by convert2hboot
	smulcc	%o2,	0x0334,	%g2
	rd	%fprs,	%g4
	call	loop_1332
	fmovrdne	%l5,	%f12,	%f14
	call	loop_1333
	rd	%softint,	%o7
loop_1332:
	call	loop_1334
	nop
	fitod	%f0,	%f14
	fdtoi	%f14,	%f11
loop_1333:
	udivx	%o5,	0x0C3E,	%l1
	fmovs	%f26,	%f15
loop_1334:
	call	loop_1335
	fbue,pt	%fcc3,	loop_1336
	bne,a,pt	%icc,	loop_1337
	nop
	nop
	setx	0xB2004032,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x7B4B9CA8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f17,	%f23
loop_1335:
	edge32ln	%l3,	%o0,	%i7
loop_1336:
	nop	!	sir	0x0A69 !! sir is illegal now
loop_1337:
	call	loop_1338
	edge8ln	%g6,	%g1,	%i6
	nop 	! 	tcc	%xcc,	0x67 changed by convert2hboot
	call	loop_1339
loop_1338:
	call	loop_1340
	nop
	fitod	%f6,	%f24
	fdtox	%f24,	%f2
	fmovrdlez	%g7,	%f14,	%f2
loop_1339:
	call	loop_1341
loop_1340:
	call	loop_1342
	nop 	! 	tn	%icc,	0x50 changed by convert2hboot
	call	loop_1343
loop_1341:
	call	loop_1344
loop_1342:
	call	loop_1345
	movo	%fcc2,	%i4,	%i3
loop_1343:
	fornot1	%f20,	%f8,	%f0
loop_1344:
	movcc	%xcc,	0x478,	%o3
loop_1345:
	addccc	%o1,	%l2,	%l6
	edge8l	%l4,	%i0,	%o4
	nop 	! 	tvc	%xcc,	0x3e changed by convert2hboot
	call	loop_1346
	smul	%g5,	%i5,	%i1
	movleu	%xcc,	0x229,	%i2
	nop
	setx	0x1DBE,	%l1,	%l0
	udivcc	%g3,	%l0,	%o6
loop_1346:
	call	loop_1347
	movrgz	%o2,	%g4,	%g2
	edge16ln	%o7,	%l5,	%o5
	set	0x28, %l6
	nop	 ! 	prefetcha	[%l7 + %l6] 0x18,	 2 ASI use replaced by convert2hboot
loop_1347:
	fmovsue	%fcc2,	%f10,	%f3
	movrne	%o0,	%i7,	%l1
	nop 	! 	tsubcc	%g6,	0x4d,	%g1 changed by convert2hboot
	fnor	%f22,	%f30,	%f4
	call	loop_1348
	call	loop_1349
	orcc	%g7,	%i4,	%i3
	call	loop_1350
loop_1348:
	alignaddr	%i6,	%o3,	%o1
loop_1349:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x0c,	%asi changed by convert2hboot
loop_1350:
	bgu,a,pt	%xcc,	loop_1351
	orn	%l4,	0x0D5F,	%i0
	call	loop_1352
	call	loop_1353
loop_1351:
	call	loop_1354
	fbn,a,pt	%fcc3,	loop_1355
loop_1352:
	edge32n	%l6,	%o4,	%g5
loop_1353:
	movo	%fcc2,	%i5,	%i2
loop_1354:
	xnor	%i1,	%g3,	%l0
loop_1355:
	nop 	! 	tcc	%xcc,	0x3a changed by convert2hboot
	array8	%o6,	%g4,	%g2
	fmovdneg	%xcc,	%f24,	%f26
	nop 	! 	ta	%icc,	0x66 changed by convert2hboot
	edge8l	%o7,	%l5,	%o5
	nop 	! 	rdhpr	%ver,	%o2 changed by convert2hboot
	brgz	%o0,	loop_1356
	move	%fcc0,	%i7,	%l1
	call	loop_1357
	fmovrdlz	%g6,	%f10,	%f16
loop_1356:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x89,	%asi changed by convert2hboot
loop_1357:
	call	loop_1358
	fmovsvs	%xcc,	%f24,	%f27
	rdpr	%cwp,	%g7
	movrlez	%i4,	%l3,	%i6
loop_1358:
	array32	%i3,	%o3,	%o1
	nop 	! 	tgu	%xcc,	0x47 changed by convert2hboot
	nop 	! 	rdhpr	%htba,	%l2 changed by convert2hboot
	call	loop_1359
	srl	%l4,	0x03,	%l6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xF72, 	%hsys_tick_cmpr changed by convert2hboot
	set	0x51, %l5
	nop	 ! 	stba	%i0,	[%l7 + %l5] 0x88 ASI use replaced by convert2hboot
loop_1359:
	call	loop_1360
	call	loop_1361
	addc	%i5,	%i2,	%i1
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x18,	%asi changed by convert2hboot
loop_1360:
	nop 	! 	tcs	%icc,	0x52 changed by convert2hboot
loop_1361:
	nop 	! 	tcs	%icc,	0x35 changed by convert2hboot
	nop 	! 	tsubcctv	%l0,	%o6,	%g5 changed by convert2hboot
	std	%f18,	[%l7 + 0x70]
	fmovsn	%xcc,	%f20,	%f19
	swap	[%l7 + 0x20],	%g2
	call	loop_1362
	edge32ln	%o7,	%l5,	%o5
	call	loop_1363
	nop 	! 	tl	%xcc,	0x42 changed by convert2hboot
loop_1362:
	call	loop_1364
	fbule,a,pt	%fcc0,	loop_1365
loop_1363:
	fmovspos	%xcc,	%f28,	%f29
	fmuld8ulx16	%f22,	%f12,	%f0
loop_1364:
	srl	%g4,	%o0,	%i7
loop_1365:
	bg,a,pn	%xcc,	loop_1366
	wr	%g0,	0x0,	%pcr	! 	wr	%o2,	0x02C4,	%set_softint changed by convert2hboot
	addccc	%g6,	%l1,	%g7
	call	loop_1367
loop_1366:
	brnz,a	%i4,	loop_1368
	call	loop_1369
	call	loop_1370
loop_1367:
	udivx	%l3,	0x017D,	%g1
loop_1368:
	ldsw	[%l7 + 0x44],	%i3
loop_1369:
	nop
	fitos	%f2,	%f27
	fstox	%f27,	%f24
loop_1370:
	brnz	%o3,	loop_1371
	fpack32	%f18,	%f6,	%f12
	call	loop_1372
	nop 	! 	rdhpr	%htba,	%o1 changed by convert2hboot
loop_1371:
	nop
	set	0x40, %i4
	nop	 ! 	ldda	[%l7 + %i4] 0x18,	%f0 ASI use replaced by convert2hboot
loop_1372:
	rdpr	%cansave,	%l2
	call	loop_1373
	nop 	! 	tleu	%icc,	0x58 changed by convert2hboot
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%l4 changed by convert2hboot
	nop 	! 	tne	%icc,	0x78 changed by convert2hboot
loop_1373:
	edge8	%l6,	%o4,	%i6
	call	loop_1374
	fmovrse	%i0,	%f8,	%f23
	nop 	! 	rdhpr	%hintp,	%i2 changed by convert2hboot
	call	loop_1375
loop_1374:
	fmul8x16au	%f13,	%f14,	%f8
	call	loop_1376
	movge	%icc,	%i5,	%g3
loop_1375:
	fmovdg	%fcc0,	%f28,	%f30
	call	loop_1377
loop_1376:
	fmovscc	%xcc,	%f7,	%f14
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x19,	%asi changed by convert2hboot
loop_1377:
	srlx	%l0,	%o6,	%g2
	call	loop_1378
	movuge	%fcc2,	%g5,	%l5
	call	loop_1379
	nop 	! 	tne	%xcc,	0x71 changed by convert2hboot
loop_1378:
	wrpr 	%g0, 	0x3, 	%gl
	call	loop_1380
loop_1379:
	call	loop_1381
	xor	%o0,	%i7,	%o2
	call	loop_1382
loop_1380:
	andncc	%g4,	%l1,	%g7
loop_1381:
	call	loop_1383
	fnors	%f14,	%f21,	%f22
loop_1382:
	nop 	! 	tge	%xcc,	0x55 changed by convert2hboot
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f10
	fxtod	%f10,	%f6
loop_1383:
	movre	%g6,	0x204,	%l3
	edge16ln	%i4,	%i3,	%g1
	call	loop_1384
	subcc	%o3,	%o1,	%l4
	sll	%l6,	0x12,	%l2
	call	loop_1385
loop_1384:
	call	loop_1386
	std	%i6,	[%l7 + 0x18]
	call	loop_1387
loop_1385:
	brgz,a,pn	%i0,	loop_1388
loop_1386:
	call	loop_1389
	edge16l	%i2,	%i5,	%o4
loop_1387:
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%f16
loop_1388:
	call	loop_1390
loop_1389:
	sth	%i1,	[%l7 + 0x42]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	call	loop_1391
loop_1390:
	call	loop_1392
	nop
	setx	0x16A0,	%l0,	%g2
	udiv	%o6,	%g2,	%g5
	nop 	! 	tle	%icc,	0x54 changed by convert2hboot
loop_1391:
	pdist	%f12,	%f14,	%f24
loop_1392:
	movrne	%l5,	%l0,	%o7
	fbu,pn	%fcc2,	loop_1393
	fmovscc	%icc,	%f31,	%f8
	fxnor	%f2,	%f8,	%f2
	call	loop_1394
loop_1393:
	orn	%o0,	%o5,	%i7
	orncc	%o2,	%l1,	%g4
	nop
	setx	0x1936,	%l0,	%g6
	sdiv	%g7,	%g6,	%i4
loop_1394:
	call	loop_1395
	movg	%fcc3,	%l3,	%i3
	call	loop_1396
	movrgez	%o3,	%g1,	%o1
loop_1395:
	call	loop_1397
	fbg,pn	%fcc1,	loop_1398
loop_1396:
	movrgz	%l6,	%l4,	%i6
	bshuffle	%f4,	%f2,	%f18
loop_1397:
	nop 	! 	tgu	%xcc,	0x77 changed by convert2hboot
loop_1398:
	movleu	%xcc,	0x59E,	%l2
	fcmped	%fcc1,	%f10,	%f22
	fbug	%fcc1,	loop_1399
	movrlez	%i0,	%i5,	%o4
	call	loop_1400
	movrlz	%i1,	%i2,	%o6
loop_1399:
	fmovsleu	%xcc,	%f23,	%f19
	fmovdne	%fcc1,	%f20,	%f12
loop_1400:
	xorcc	%g2,	0x0996,	%g3
	call	loop_1401
	movl	%fcc3,	%l5,	%l0
	call	loop_1402
	fbl,a,pn	%fcc2,	loop_1403
loop_1401:
	nop 	! 	taddcctv	%g5,	0x47,	%o7 changed by convert2hboot
	add	%o0,	%i7,	%o5
loop_1402:
	brgz,a	%o2,	loop_1404
loop_1403:
	call	loop_1405
	fbug	%fcc0,	loop_1406
	xnor	%l1,	%g4,	%g7
loop_1404:
	call	loop_1407
loop_1405:
	nop
	set	0x2E, %l2
	sth	%i4,	[%l7 + %l2]
loop_1406:
	call	loop_1408
	fnors	%f1,	%f12,	%f16
loop_1407:
	call	loop_1409
	call	loop_1410
loop_1408:
	edge8l	%g6,	%l3,	%o3
	nop 	! 	rdpr	%tba,	%g1 changed by convert2hboot
loop_1409:
	sub	%o1,	0x0DC6,	%i3
loop_1410:
	edge8l	%l6,	%l4,	%l2
	fmul8ulx16	%f10,	%f0,	%f12
	call	loop_1411
	call	loop_1412
	ldstub	[%l7 + 0x32],	%i0
	movl	%fcc2,	0x476,	%i6
loop_1411:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x04,	%asi changed by convert2hboot
loop_1412:
	edge16n	%i1,	%i2,	%o6
	call	loop_1413
	nop
	setx	loop_1414,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x001400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	call	loop_1415
	brgez,a,pn	%g2,	loop_1416
loop_1413:
	nop 	! 	tpos	%xcc,	0x51 changed by convert2hboot
loop_1414:
	call	loop_1417
loop_1415:
	call	loop_1418
loop_1416:
	call	loop_1419
	call	loop_1420
loop_1417:
	call	loop_1421
loop_1418:
	nop 	! 	tn	%xcc,	0x63 changed by convert2hboot
loop_1419:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x80,	%asi changed by convert2hboot
	sta	%f25,	[%l7 + 0x24] %asi
loop_1420:
	movre	%o4,	0x3C1,	%g3
loop_1421:
	call	loop_1422
	movvc	%icc,	0x4A2,	%l0
	nop 	! 	tle	%xcc,	0x4c changed by convert2hboot
	brnz,a	%g5,	loop_1423
loop_1422:
	nop 	! 	tneg	%xcc,	0x47 changed by convert2hboot
	call	loop_1424
	fornot2	%f4,	%f30,	%f4
loop_1423:
	umulcc	%l5,	0x1107,	%o0
	ldstub	[%l7 + 0x7D],	%o7
loop_1424:
	nop 	! 	tsubcc	%o5,	%o2,	%i7 changed by convert2hboot
	nop 	! 	tle	%icc,	0x4e changed by convert2hboot
	movcc	%xcc,	%g4,	%g7
	fnors	%f6,	%f24,	%f14
	call	loop_1425
	xorcc	%l1,	0x0502,	%i4
	call	loop_1426
	edge32ln	%g6,	%l3,	%o3
loop_1425:
	nop
	nop
	setx	0xBD735AFA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x4024ADF7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f3,	%f23
	movrgez	%o1,	0x360,	%i3
loop_1426:
	call	loop_1427
	movrlz	%l6,	%l4,	%g1
	fmovsl	%xcc,	%f11,	%f24
	movul	%fcc2,	0x0C5,	%i0
loop_1427:
	call	loop_1428
	mova	%icc,	0x40A,	%i6
	call	loop_1429
	nop	!	sir	0x1A05 !! sir is illegal now
loop_1428:
	call	loop_1430
	nop 	! 	tle	%icc,	0x5e changed by convert2hboot
loop_1429:
	call	loop_1431
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x7, 	%fprs changed by convert2hboot
loop_1430:
	nop 	! 	tcs	%xcc,	0x40 changed by convert2hboot
	wrpr 	%g0, 	0x2, 	%gl
loop_1431:
	call	loop_1432
	call	loop_1433
	bgu	%icc,	loop_1434
	call	loop_1435
loop_1432:
	nop 	! 	taddcctv	%i1,	0x7b,	%g2 changed by convert2hboot
loop_1433:
	ldub	[%l7 + 0x36],	%o6
loop_1434:
	mova	%fcc0,	0x502,	%g3
loop_1435:
	fmovsge	%fcc0,	%f22,	%f16
	fmovsuge	%fcc3,	%f31,	%f16
	call	loop_1436
	movrgez	%l0,	0x356,	%g5
	orncc	%l5,	%o0,	%o4
	call	loop_1437
loop_1436:
	call	loop_1438
	xnorcc	%o7,	%o5,	%o2
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0xf9,	%asi changed by convert2hboot
	membar	#Sync
loop_1437:
	call	loop_1439
loop_1438:
	nop
	set	0x40, %o1
	flush	%l7 + %o1
	wrpr 	%g0, 	0x1, 	%gl
	set	0x70, %g4
	nop	 ! 	lduwa	[%l7 + %g4] 0x81,	%l1 ASI use replaced by convert2hboot
loop_1439:
	fsrc1	%f28,	%f8
	call	loop_1440
	call	loop_1441
	call	loop_1442
	nop 	! 	tge	%icc,	0x66 changed by convert2hboot
loop_1440:
	nop 	! 	wrpr	%i4,	%g6,	%tick changed by convert2hboot
loop_1441:
	call	loop_1443
loop_1442:
	bcc	%xcc,	loop_1444
	array32	%i7,	%l3,	%o3
	fbuge	%fcc3,	loop_1445
loop_1443:
	fands	%f15,	%f6,	%f27
loop_1444:
	nop 	! 	rdhpr	%htba,	%i3 changed by convert2hboot
	call	loop_1446
loop_1445:
	call	loop_1447
	call	loop_1448
	call	loop_1449
loop_1446:
	rd	%pc,	%l6
loop_1447:
	fbne,a,pt	%fcc2,	loop_1450
loop_1448:
	nop 	! 	tge	%xcc,	0x53 changed by convert2hboot
loop_1449:
	brgez	%o1,	loop_1451
	fbe,a,pt	%fcc3,	loop_1452
loop_1450:
	fmovduge	%fcc2,	%f22,	%f6
	call	loop_1453
loop_1451:
	call	loop_1454
loop_1452:
	mulscc	%g1,	0x1658,	%l4
	nop 	! 	tsubcc	%i0,	0x3b,	%i6 changed by convert2hboot
loop_1453:
	nop 	! 	tleu	%icc,	0x64 changed by convert2hboot
loop_1454:
	nop
	nop
	setx	0x0B6B32E3D8CEEEFE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x727C887D8BC0AC7A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f20,	%f10
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x54E, 	%hsys_tick_cmpr changed by convert2hboot
	call	loop_1455
	nop
	setx	loop_1456,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x014200001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	call	loop_1457
	call	loop_1458
loop_1455:
	call	loop_1459
loop_1456:
	call	loop_1460
loop_1457:
	call	loop_1461
loop_1458:
	nop 	! 	tge	%icc,	0x65 changed by convert2hboot
loop_1459:
	xnorcc	%i2,	0x101E,	%l2
loop_1460:
	fmovrse	%i1,	%f22,	%f15
loop_1461:
	sethi	0x18A6,	%g2
	fmovdug	%fcc1,	%f30,	%f18
	call	loop_1462
	fmovdne	%fcc3,	%f24,	%f10
	call	loop_1463
	call	loop_1464
loop_1462:
	call	loop_1465
	call	loop_1466
loop_1463:
	nop	!	sir	0x1911 !! sir is illegal now
loop_1464:
	call	loop_1467
loop_1465:
	call	loop_1468
loop_1466:
	fcmped	%fcc0,	%f4,	%f24
	movrlz	%o6,	%l0,	%g3
loop_1467:
	call	loop_1469
loop_1468:
	nop 	! 	tg	%icc,	0x44 changed by convert2hboot
	alignaddrl	%l5,	%o0,	%g5
	edge32n	%o4,	%o5,	%o7
loop_1469:
	call	loop_1470
	call	loop_1471
	call	loop_1472
	wrpr	%g4,	0x0F4A,	%pil
loop_1470:
	orcc	%g7,	%l1,	%o2
loop_1471:
	nop 	! 	tl	%xcc,	0x75 changed by convert2hboot
loop_1472:
	brnz	%g6,	loop_1473
	call	loop_1474
	fmovdneg	%xcc,	%f2,	%f6
	movrgez	%i4,	0x00A,	%l3
loop_1473:
	nop 	! 	wrpr	%i7,	0x00D3,	%tick changed by convert2hboot
loop_1474:
	call	loop_1475
	movvc	%xcc,	0x0DF,	%o3
	fmovsgu	%xcc,	%f17,	%f8
	stx	%i3,	[%l7 + 0x60]
loop_1475:
	call	loop_1476
	xorcc	%l6,	0x1E7C,	%o1
	rd	%ccr,	%l4
	nop 	! 	tsubcctv	%g1,	%i0,	%i6 changed by convert2hboot
loop_1476:
	call	loop_1477
	call	loop_1478
	movrgez	%i5,	0x077,	%i2
	orncc	%l2,	%g2,	%i1
loop_1477:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x18,	%asi changed by convert2hboot
loop_1478:
	call	loop_1479
	brgz,pt	%g3,	loop_1480
	fpmerge	%f1,	%f5,	%f6
	call	loop_1481
loop_1479:
	call	loop_1482
loop_1480:
	or	%l5,	%o6,	%g5
	and	%o0,	%o4,	%o5
loop_1481:
	call	loop_1483
loop_1482:
	flushw
	call	loop_1484
	array32	%o7,	%g4,	%l1
loop_1483:
	call	loop_1485
	movneg	%icc,	0x19F,	%o2
loop_1484:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x88,	%asi changed by convert2hboot
loop_1485:
	fmovdule	%fcc1,	%f20,	%f28
	call	loop_1486
	addcc	%i4,	0x15CC,	%g7
	be	%icc,	loop_1487
	rd	%fprs,	%i7
loop_1486:
	fornot1s	%f26,	%f2,	%f7
	fmovsl	%xcc,	%f26,	%f21
loop_1487:
	fbg,a,pn	%fcc0,	loop_1488
	call	loop_1489
	membar	0x56
	and	%o3,	0x0931,	%l3
loop_1488:
	nop 	! 	ta	%xcc,	0x66 changed by convert2hboot
loop_1489:
	ldstub	[%l7 + 0x3A],	%l6
	stb	%o1,	[%l7 + 0x6C]
	call	loop_1490
	bvc,a,pt	%icc,	loop_1491
	fpmerge	%f22,	%f16,	%f4
	nop
	set	0x20, %o6
	lduh	[%l7 + %o6],	%l4
loop_1490:
	array16	%i3,	%i0,	%i6
loop_1491:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x2f,	%asi changed by convert2hboot
	membar	#Sync
	fcmple16	%f0,	%f10,	%g1
	call	loop_1492
	nop 	! 	tn	%xcc,	0x61 changed by convert2hboot
	nop 	! 	taddcctv	%l2,	%i2,	%g2 changed by convert2hboot
	subccc	%i1,	%l0,	%g3
loop_1492:
	wrpr	%l5,	0x13BA,	%pil
	fbuge	%fcc3,	loop_1493
	rd	%pc,	%o6
	nop 	! 	tg	%icc,	0x64 changed by convert2hboot
	array32	%o0,	%g5,	%o5
loop_1493:
	call	loop_1494
	bn,a,pn	%icc,	loop_1495
	call	loop_1496
	nop 	! 	tvs	%xcc,	0x70 changed by convert2hboot
loop_1494:
	nop 	! 	tgu	%icc,	0x3f changed by convert2hboot
loop_1495:
	nop
	set	0x18, %o3
	sta	%f20,	[%l7 + %o3] 0x19
loop_1496:
	call	loop_1497
	fbne,pn	%fcc0,	loop_1498
	movre	%o4,	0x1E0,	%g4
	movgu	%icc,	%o7,	%l1
loop_1497:
	nop 	! 	taddcc	%o2,	%i4,	%g6 changed by convert2hboot
loop_1498:
	fpmerge	%f8,	%f16,	%f14
	call	loop_1499
	movlg	%fcc2,	0x59E,	%i7
	call	loop_1500
	call	loop_1501
loop_1499:
	fbn	%fcc2,	loop_1502
	call	loop_1503
loop_1500:
	call	loop_1504
loop_1501:
	mulx	%g7,	0x06E0,	%o3
loop_1502:
	nop 	! 	te	%xcc,	0x39 changed by convert2hboot
loop_1503:
	movleu	%icc,	%l6,	%l3
loop_1504:
	nop 	! 	tle	%xcc,	0x3d changed by convert2hboot
	call	loop_1505
	call	loop_1506
	call	loop_1507
	call	loop_1508
loop_1505:
	movule	%fcc2,	0x4CB,	%o1
loop_1506:
	fmovrsne	%i3,	%f15,	%f0
loop_1507:
	movpos	%icc,	0x090,	%i0
loop_1508:
	nop 	! 	tsubcc	%i6,	%l4,	%i5 changed by convert2hboot
	movgu	%xcc,	0x5F2,	%g1
	sub	%i2,	0x189D,	%l2
	popc	0x0A8D,	%g2
	bl,a	%xcc,	loop_1509
	call	loop_1510
	fbne,a,pn	%fcc2,	loop_1511
	bneg	%xcc,	loop_1512
loop_1509:
	call	loop_1513
loop_1510:
	nop
	setx	loop_1514,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x004400001401,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_1511:
	call	loop_1515
loop_1512:
	call	loop_1516
loop_1513:
	fmovrdgz	%i1,	%f12,	%f8
loop_1514:
	fbne	%fcc2,	loop_1517
loop_1515:
	edge8n	%g3,	%l5,	%l0
loop_1516:
	orcc	%o0,	%o6,	%o5
	fcmpne32	%f22,	%f22,	%g5
loop_1517:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	nop
	setx loop_1518, %l0, %l1
	jmpl %l1, %o4
	rd	%tick_cmpr,	%o7
	ldsh	[%l7 + 0x30],	%l1
	brlz,a,pt	%o2,	loop_1519
loop_1518:
	rdpr	%otherwin,	%g6
	edge32l	%i7,	%i4,	%o3
	membar	#Sync
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x17,	%asi changed by convert2hboot
loop_1519:
	bne,a,pn	%icc,	loop_1520
	subc	%g7,	0x17E3,	%l3
	fbe,a,pn	%fcc3,	loop_1521
	call	loop_1522
loop_1520:
	fmovsne	%xcc,	%f10,	%f5
	call	loop_1523
loop_1521:
	nop 	! 	taddcc	%o1,	%i3,	%i0 changed by convert2hboot
loop_1522:
	movrlz	%i6,	0x17D,	%l4
loop_1523:
	movule	%fcc3,	%i5,	%g1
	fmovdleu	%icc,	%f8,	%f14
	call	loop_1524
	fcmps	%fcc0,	%f23,	%f13
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr	%g0,	0x0,	%pcr	! 	wr 	%l0, 	%g0, 	%tick_cmpr changed by convert2hboot
	call	loop_1525
loop_1524:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	brnz,a	%l6,	loop_1526
	fmovsul	%fcc2,	%f1,	%f12
loop_1525:
	call	loop_1527
	fpadd32	%f8,	%f10,	%f16
loop_1526:
	call	loop_1528
	mulscc	%g2,	0x1022,	%i1
loop_1527:
	nop 	! 	tcs	%xcc,	0x35 changed by convert2hboot
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1528:
	call	loop_1529
	rd	%softint,	%g3
	call	loop_1530
	call	loop_1531
loop_1529:
	call	loop_1532
	or	%l0,	0x123B,	%o0
loop_1530:
	movg	%fcc3,	%l5,	%o5
loop_1531:
	fcmped	%fcc3,	%f0,	%f12
loop_1532:
	bne	%icc,	loop_1533
	call	loop_1534
	movle	%icc,	%o6,	%g4
	stw	%o4,	[%l7 + 0x34]
loop_1533:
	movle	%fcc1,	0x132,	%g5
loop_1534:
	fpack16	%f24,	%f5
	call	loop_1535
	nop
	setx	0x04C1,	%l0,	%l1
	udivcc	%o7,	%l1,	%o2
	brlez,a,pt	%g6,	loop_1536
	call	loop_1537
loop_1535:
	call	loop_1538
	nop 	! 	taddcctv	%i4,	%o3,	%i7 changed by convert2hboot
loop_1536:
	edge16n	%g7,	%l3,	%i3
loop_1537:
	call	loop_1539
loop_1538:
	fbuge,pn	%fcc3,	loop_1540
	srlx	%i0,	0x1F,	%i6
	add	%l4,	0x0181,	%o1
loop_1539:
	alignaddr	%i5,	%g1,	%l2
loop_1540:
	call	loop_1541
	edge16	%l6,	%i2,	%i1
	call	loop_1542
loop_1541:
	fmovscc	%xcc,	%f16,	%f14
	fbul,a,pn	%fcc2,	loop_1543
	fmovd	%f10,	%f14
loop_1542:
	call	loop_1544
	nop
	set	0x7B, %i2
	ldub	[%l7 + %i2],	%g3
loop_1543:
	sllx	%l0,	0x01,	%o0
	fbg,pt	%fcc2,	loop_1545
loop_1544:
	fbge,a	%fcc0,	loop_1546
	ld	[%l7 + 0x60],	%f16
	call	loop_1547
loop_1545:
	fmovdle	%xcc,	%f20,	%f18
loop_1546:
	call	loop_1548
	fbg,a,pn	%fcc2,	loop_1549
loop_1547:
	call	loop_1550
	wrpr 	%g0, 	0x0, 	%gl
loop_1548:
	movuge	%fcc1,	%o6,	%g4
loop_1549:
	srl	%o4,	0x12,	%l5
loop_1550:
	bneg	%xcc,	loop_1551
	srlx	%o7,	%l1,	%g5
	call	loop_1552
	bgu,a,pn	%xcc,	loop_1553
loop_1551:
	movu	%fcc2,	0x72F,	%g6
	nop 	! 	ta	%icc,	0x5c changed by convert2hboot
loop_1552:
	movneg	%icc,	%o2,	%i4
loop_1553:
	movvc	%icc,	0x4AC,	%o3
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_1554
	call	loop_1555
	call	loop_1556
	nop 	! 	tleu	%xcc,	0x72 changed by convert2hboot
loop_1554:
	movre	%g7,	0x086,	%l3
loop_1555:
	call	loop_1557
loop_1556:
	call	loop_1558
	call	loop_1559
	call	loop_1560
loop_1557:
	movl	%icc,	%i7,	%i3
loop_1558:
	call	loop_1561
loop_1559:
	bne,pt	%xcc,	loop_1562
loop_1560:
	nop
	set	0x48, %l4
	ldx	[%l7 + %l4],	%i6
	fnot2	%f18,	%f30
loop_1561:
	sra	%l4,	%o1,	%i5
loop_1562:
	fmovdneg	%icc,	%f16,	%f10
	edge16l	%i0,	%l2,	%l6
	nop
	setx	0x126A,	%l0,	%i1
	udiv	%g1,	%i1,	%i2
	umul	%l0,	%g3,	%g2
	call	loop_1563
	call	loop_1564
	nop
	nop
	setx	0xBF827DA50043B400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	call	loop_1565
loop_1563:
	xnor	%o5,	%o0,	%o6
loop_1564:
	std	%f0,	[%l7 + 0x08]
	fandnot1s	%f27,	%f14,	%f23
loop_1565:
	call	loop_1566
	orncc	%o4,	%l5,	%g4
	call	loop_1567
	bge,a,pt	%icc,	loop_1568
loop_1566:
	fmovdne	%fcc0,	%f20,	%f10
	call	loop_1569
loop_1567:
	call	loop_1570
loop_1568:
	movg	%fcc1,	0x2D4,	%l1
	sllx	%g5,	0x14,	%g6
loop_1569:
	movrne	%o2,	%o7,	%o3
loop_1570:
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x7, 	%fprs changed by convert2hboot
	call	loop_1571
	nop 	! 	ta	%icc,	0x3f changed by convert2hboot
	fmovsug	%fcc1,	%f16,	%f2
	fbg	%fcc0,	loop_1572
loop_1571:
	call	loop_1573
	subc	%i4,	0x0BC1,	%l3
	nop 	! 	tcc	%xcc,	0x60 changed by convert2hboot
loop_1572:
	call	loop_1574
loop_1573:
	fmovsue	%fcc0,	%f17,	%f19
	call	loop_1575
	movul	%fcc3,	%i3,	%i7
loop_1574:
	nop
	set	0x50, %l3
	nop	 ! 	stwa	%l4,	[%l7 + %l3] 0x2a ASI use replaced by convert2hboot
	membar	#Sync
loop_1575:
	movn	%fcc1,	0x1F8,	%o1
	call	loop_1576
	fmovrdgez	%i5,	%f26,	%f18
	mulscc	%i6,	0x1DAA,	%i0
	movo	%fcc0,	%l6,	%g1
loop_1576:
	nop 	! 	tl	%xcc,	0x45 changed by convert2hboot
	or	%l2,	%i1,	%l0
	wrpr	%g3,	0x1E45,	%pil
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x4, 	%fprs changed by convert2hboot
	edge32ln	%o0,	%i2,	%o6
	call	loop_1577
	nop 	! 	tne	%icc,	0x3d changed by convert2hboot
	srax	%o4,	%l5,	%g4
	call	loop_1578
loop_1577:
	call	loop_1579
	call	loop_1580
	bgu,pn	%xcc,	loop_1581
loop_1578:
	movcc	%icc,	0x6EC,	%l1
loop_1579:
	prefetch	[%l7 + 0x58],	 2
loop_1580:
	movneg	%xcc,	%g5,	%o2
loop_1581:
	edge16ln	%o7,	%g6,	%o3
	call	loop_1582
	flushw
	be	%xcc,	loop_1583
	nop 	! 	tpos	%icc,	0x48 changed by convert2hboot
loop_1582:
	nop 	! 	te	%xcc,	0x59 changed by convert2hboot
	fsrc2	%f18,	%f10
loop_1583:
	movrgez	%g7,	%l3,	%i4
	movuge	%fcc0,	0x1CD,	%i3
	edge16n	%i7,	%o1,	%l4
	edge16l	%i6,	%i0,	%l6
	nop 	! 	rdhpr	%htba,	%i5 changed by convert2hboot
	nop
	setx	0x0800,	%l0,	%g1
	udiv	%l2,	%g1,	%i1
	movrne	%g3,	%g2,	%l0
	edge32l	%o0,	%i2,	%o6
	nop 	! 	taddcc	%o5,	%l5,	%o4 changed by convert2hboot
	subcc	%l1,	0x0AC1,	%g5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x10,	%asi changed by convert2hboot
	nop	 ! 	casa	[%l6] 0x10,	%o2,	%o7 ASI use replaced by convert2hboot
	flush	%l7 + 0x40
	call	loop_1584
	wr	%g0,	0x0,	%pcr	! 	wr	%g4,	0x1022,	%pic changed by convert2hboot
	fmovsn	%fcc3,	%f21,	%f1
	nop 	! 	tvc	%icc,	0x76 changed by convert2hboot
loop_1584:
	movrgez	%g6,	%g7,	%l3
	call	loop_1585
	subccc	%i4,	%o3,	%i7
	bcs,pn	%icc,	loop_1586
	nop
	setx	0x01D0,	%l0,	%l4
	udivcc	%o1,	%l4,	%i6
loop_1585:
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%i2
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0xe2,	%asi changed by convert2hboot
	membar	#Sync
loop_1586:
	fpack32	%f10,	%f18,	%f12
	sdivx	%i5,	0x0DC9,	%l6
	nop 	! 	tge	%xcc,	0x78 changed by convert2hboot
	call	loop_1587
	call	loop_1588
	call	loop_1589
	nop 	! 	ta	%icc,	0x6a changed by convert2hboot
loop_1587:
	xor	%g1,	%i1,	%g3
loop_1588:
	nop 	! 	tsubcc	%g2,	0x39,	%l0 changed by convert2hboot
loop_1589:
	nop
	setx	0x05F1,	%l0,	%o0
	sdiv	%l2,	%o0,	%o6
	call	loop_1590
	ldsh	[%l7 + 0x74],	%i2
	set	0x40, %g1
	nop	 ! 	stda	%f16,	[%l7 + %g1] 0xc0 ASI use replaced by convert2hboot
loop_1590:
	for	%f28,	%f2,	%f8
	nop 	! 	tne	%icc,	0x7c changed by convert2hboot
	bmask	%o5,	%o4,	%l5
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x88,	%asi changed by convert2hboot
	call	loop_1591
	fmovsne	%fcc0,	%f30,	%f11
	fmovsneg	%icc,	%f7,	%f20
	nop 	! 	taddcc	%o2,	0x37,	%o7 changed by convert2hboot
loop_1591:
	fexpand	%f25,	%f14
	nop 	! 	tpos	%icc,	0x6a changed by convert2hboot
	movn	%icc,	%g4,	%l1
	call	loop_1592
	srl	%g6,	0x13,	%l3
	nop
	nop
	setx	0x3A2BE71711685FFD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x8B536E27D6BF6D8C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f22,	%f22
	call	loop_1593
loop_1592:
	call	loop_1594
	call	loop_1595
	nop
	set	0x0B, %g7
	ldub	[%l7 + %g7],	%g7
loop_1593:
	call	loop_1596
loop_1594:
	bvs,pn	%icc,	loop_1597
loop_1595:
	call	loop_1598
	call	loop_1599
loop_1596:
	xnor	%i4,	%o3,	%o1
loop_1597:
	movule	%fcc3,	%l4,	%i6
loop_1598:
	edge16n	%i7,	%i3,	%i0
loop_1599:
	movrgez	%l6,	0x2FC,	%i5
	fnot2s	%f2,	%f20
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x04,	%asi changed by convert2hboot
	andn	%g1,	%g3,	%g2
	call	loop_1600
	fnot2	%f10,	%f6
	wr	%g0,	0x0,	%pcr	! 	wr	%l2,	0x174D,	%clear_softint changed by convert2hboot
	movg	%icc,	0x35A,	%o0
loop_1600:
	nop
	nop
	setx	0xCE21A06962DF7494,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xEE2293CE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsmuld	%f28,	%f26,	%f2
	nop
	setx	loop_1601,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x012100001405,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop
	setx	0x0E3C,	%l0,	%o6
	udiv	%l0,	%o6,	%o5
	nop	!	sir	0x1F9A !! sir is illegal now
	ldd	[%l7 + 0x68],	%o4
loop_1601:
	nop 	! 	ta	%xcc,	0x6f changed by convert2hboot
	fbue	%fcc1,	loop_1602
	movo	%fcc3,	%l5,	%g5
	movn	%icc,	%i2,	%o2
	prefetch	[%l7 + 0x60],	 2
loop_1602:
	call	loop_1603
	call	loop_1604
	call	loop_1605
	call	loop_1606
loop_1603:
	fmovsuge	%fcc3,	%f29,	%f17
loop_1604:
	fpmerge	%f31,	%f8,	%f20
loop_1605:
	call	loop_1607
loop_1606:
	nop 	! 	rdpr	%tba,	%o7 changed by convert2hboot
	fbu,pt	%fcc1,	loop_1608
	call	loop_1609
loop_1607:
	movrlez	%l1,	0x3C2,	%g6
	set	0x34, %i1
	nop	 ! 	ldsha	[%l7 + %i1] 0x81,	%g4 ASI use replaced by convert2hboot
loop_1608:
	wrpr	%l3,	0x14BA,	%cwp
loop_1609:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x80,	%asi changed by convert2hboot
	sta	%f24,	[%l7 + 0x08] %asi
	movcc	%icc,	0x147,	%i4
	call	loop_1610
	bge,a	%xcc,	loop_1611
	wr	%g0,	0x0,	%pcr	! 	wr	%o3,	%g7,	%set_softint changed by convert2hboot
	call	loop_1612
loop_1610:
	membar	0x30
loop_1611:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0xe2,	%asi changed by convert2hboot
	membar	#Sync
loop_1612:
	fmovda	%fcc1,	%f0,	%f18
	nop
	setx loop_1613, %l0, %l1
	jmpl %l1, %i6
	call	loop_1614
	call	loop_1615
	fmovduge	%fcc2,	%f16,	%f14
loop_1613:
	call	loop_1616
loop_1614:
	edge8ln	%o1,	%i7,	%i0
loop_1615:
	nop
	set	0x5C, %o7
	nop	 ! 	lduwa	[%l7 + %o7] 0x0c,	%i3 ASI use replaced by convert2hboot
loop_1616:
	fbn	%fcc1,	loop_1617
	call	loop_1618
	srax	%i5,	0x01,	%l6
	call	loop_1619
loop_1617:
	umulcc	%i1,	%g3,	%g2
loop_1618:
	nop 	! 	te	%xcc,	0x3a changed by convert2hboot
	call	loop_1620
loop_1619:
	call	loop_1621
	fmovdg	%icc,	%f30,	%f10
	rdpr	%cleanwin,	%g1
loop_1620:
	nop 	! 	tle	%icc,	0x53 changed by convert2hboot
loop_1621:
	fble,a	%fcc1,	loop_1622
	brgz,pn	%l2,	loop_1623
	or	%o0,	0x0FCD,	%l0
	orcc	%o5,	%o4,	%l5
loop_1622:
	fbne,a	%fcc3,	loop_1624
loop_1623:
	move	%fcc0,	0x712,	%g5
	call	loop_1625
	call	loop_1626
loop_1624:
	flushw
	nop
	nop
	setx	0xA13DDF72,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xE32D7A8B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f8,	%f23
loop_1625:
	fmovsne	%fcc0,	%f3,	%f27
loop_1626:
	srl	%o6,	0x00,	%o2
	wrpr	%i2,	%l1,	%pil
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x04,	%asi changed by convert2hboot
	movu	%fcc0,	0x356,	%g6
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_1627
	addccc	%g4,	0x02DA,	%l3
	call	loop_1628
	xnorcc	%i4,	%o7,	%g7
loop_1627:
	edge16n	%o3,	%l4,	%i6
	call	loop_1629
loop_1628:
	nop
	setx	0x1A14,	%l0,	%i0
	udiv	%o1,	%i0,	%i3
	nop 	! 	tneg	%icc,	0x52 changed by convert2hboot
	array32	%i7,	%l6,	%i1
loop_1629:
	fsrc2	%f6,	%f28
	fmovdul	%fcc2,	%f26,	%f6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x2A6, 	%hsys_tick_cmpr changed by convert2hboot
	udiv	%i5,	0x157D,	%g1
	nop
	set	0x28, %l1
	std	%f28,	[%l7 + %l1]
	fmovsge	%fcc2,	%f23,	%f10
	edge16ln	%g2,	%l2,	%l0
	call	loop_1630
	call	loop_1631
	call	loop_1632
	call	loop_1633
loop_1630:
	nop
	set	0x24, %i0
	flush	%l7 + %i0
loop_1631:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x04,	%asi changed by convert2hboot
loop_1632:
	move	%fcc3,	0x2D6,	%o0
loop_1633:
	call	loop_1634
	call	loop_1635
	fnegs	%f24,	%f27
	nop
	setx	loop_1636,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x032200001403,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_1634:
	call	loop_1637
loop_1635:
	call	loop_1638
	xorcc	%l5,	%o4,	%g5
loop_1636:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x18,	%asi changed by convert2hboot
loop_1637:
	call	loop_1639
loop_1638:
	call	loop_1640
	fbg,pn	%fcc0,	loop_1641
	movlg	%fcc2,	%o2,	%i2
loop_1639:
	call	loop_1642
loop_1640:
	fbn	%fcc3,	loop_1643
loop_1641:
	edge8	%g6,	%l1,	%l3
	set	0x40, %i3
	nop	 ! 	stda	%f0,	[%l7 + %i3] 0xc3 ASI use replaced by convert2hboot
loop_1642:
	call	loop_1644
loop_1643:
	nop 	! 	tcc	%icc,	0x4f changed by convert2hboot
	fmuld8ulx16	%f23,	%f19,	%f14
	call	loop_1645
loop_1644:
	sdivx	%i4,	0x1119,	%o7
	call	loop_1646
	alignaddrl	%g7,	%g4,	%l4
loop_1645:
	movpos	%xcc,	%o3,	%i6
	call	loop_1647
loop_1646:
	nop 	! 	rdpr	%tba,	%o1 changed by convert2hboot
	call	loop_1648
	fcmpeq32	%f12,	%f4,	%i3
loop_1647:
	ldsh	[%l7 + 0x58],	%i0
	nop 	! 	rdhpr	%hintp,	%l6 changed by convert2hboot
loop_1648:
	smul	%i7,	0x0DBF,	%g3
	nop
	nop
	setx	0xE0778000,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	movue	%fcc3,	%i1,	%g1
	nop
	set	0x4E, %g6
	ldub	[%l7 + %g6],	%g2
	call	loop_1649
	movrlz	%l2,	0x3F5,	%i5
	stb	%l0,	[%l7 + 0x28]
	call	loop_1650
loop_1649:
	call	loop_1651
	call	loop_1652
	movu	%fcc1,	0x748,	%o0
loop_1650:
	call	loop_1653
loop_1651:
	nop 	! 	te	%icc,	0x71 changed by convert2hboot
loop_1652:
	bmask	%l5,	%o4,	%g5
	call	loop_1654
loop_1653:
	nop
	setx	0x1349,	%l0,	%o2
	sdivx	%o5,	%o2,	%i2
	call	loop_1655
	call	loop_1656
loop_1654:
	call	loop_1657
	xor	%o6,	%g6,	%l1
loop_1655:
	fbe,pn	%fcc1,	loop_1658
loop_1656:
	movrne	%i4,	0x1FA,	%o7
loop_1657:
	move	%icc,	%l3,	%g7
	call	loop_1659
loop_1658:
	call	loop_1660
	movcc	%xcc,	0x433,	%g4
	movu	%fcc3,	%l4,	%i6
loop_1659:
	andcc	%o3,	0x09C9,	%o1
loop_1660:
	call	loop_1661
	call	loop_1662
	call	loop_1663
	movg	%xcc,	0x3CE,	%i3
loop_1661:
	nop 	! 	tcs	%xcc,	0x68 changed by convert2hboot
loop_1662:
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%l6 changed by convert2hboot
loop_1663:
	membar	0x23
	edge32n	%i7,	%i0,	%g3
	fbule,a,pt	%fcc3,	loop_1664
	fornot1s	%f2,	%f30,	%f31
	fmovdvs	%xcc,	%f2,	%f26
	orncc	%g1,	0x0506,	%i1
loop_1664:
	call	loop_1665
	call	loop_1666
	call	loop_1667
	call	loop_1668
loop_1665:
	andcc	%g2,	0x0F90,	%l2
loop_1666:
	call	loop_1669
loop_1667:
	edge32	%i5,	%l0,	%l5
loop_1668:
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%o0 changed by convert2hboot
	call	loop_1670
loop_1669:
	movcs	%icc,	%g5,	%o4
	smul	%o5,	0x054D,	%o2
	nop
	setx	0x1BF4,	%l0,	%i2
	udiv	%o6,	%i2,	%g6
loop_1670:
	call	loop_1671
	stx	%l1,	[%l7 + 0x70]
	call	loop_1672
	fbn,a	%fcc3,	loop_1673
loop_1671:
	lduw	[%l7 + 0x38],	%o7
	call	loop_1674
loop_1672:
	fmovse	%fcc1,	%f23,	%f3
loop_1673:
	call	loop_1675
	call	loop_1676
loop_1674:
	std	%f18,	[%l7 + 0x10]
	rd	%ccr,	%i4
loop_1675:
	fandnot2	%f24,	%f22,	%f10
loop_1676:
	movn	%fcc3,	0x3DF,	%l3
	call	loop_1677
	nop
	setx	0x0880,	%l0,	%l4
	udivx	%g4,	%l4,	%i6
	call	loop_1678
	call	loop_1679
loop_1677:
	edge16ln	%g7,	%o3,	%i3
	call	loop_1680
loop_1678:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1679:
	call	loop_1681
	call	loop_1682
loop_1680:
	bneg,a,pt	%icc,	loop_1683
	orcc	%l6,	%o1,	%i7
loop_1681:
	call	loop_1684
loop_1682:
	nop
	fitos	%f9,	%f3
	fstoi	%f3,	%f29
loop_1683:
	call	loop_1685
	sdiv	%g3,	0x1D04,	%g1
loop_1684:
	fmovsul	%fcc3,	%f23,	%f2
	call	loop_1686
loop_1685:
	brgz,pn	%i0,	loop_1687
	call	loop_1688
	call	loop_1689
loop_1686:
	addcc	%g2,	0x1D12,	%l2
loop_1687:
	movneg	%icc,	0x4BE,	%i1
loop_1688:
	call	loop_1690
loop_1689:
	call	loop_1691
	call	loop_1692
	call	loop_1693
loop_1690:
	call	loop_1694
loop_1691:
	nop
	setx	0x1267,	%l0,	%i5
	sdiv	%l0,	%i5,	%l5
loop_1692:
	nop
	nop
	setx	0x8DDAFD5F011BAA0A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xFC8FB918BA8A3B1F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f6,	%f2
loop_1693:
	call	loop_1695
loop_1694:
	call	loop_1696
	sdivx	%g5,	0x0518,	%o4
	fnegs	%f6,	%f16
loop_1695:
	srax	%o0,	%o5,	%o6
loop_1696:
	brgez,pn	%o2,	loop_1697
	call	loop_1698
	rd	%tick_cmpr,	%g6
	call	loop_1699
loop_1697:
	fbul,a	%fcc1,	loop_1700
loop_1698:
	wr	%g0,	0x0,	%pcr	! 	wr	%i2,	%l1,	%pic changed by convert2hboot
	movn	%fcc2,	%i4,	%l3
loop_1699:
	fsrc1	%f30,	%f8
loop_1700:
	movo	%fcc0,	0x154,	%o7
	call	loop_1701
	xor	%l4,	%i6,	%g7
	movpos	%xcc,	%o3,	%g4
	fmovsa	%icc,	%f19,	%f19
loop_1701:
	movrgez	%i3,	0x129,	%o1
	srl	%i7,	0x19,	%g3
	for	%f24,	%f22,	%f28
	call	loop_1702
	call	loop_1703
	addccc	%l6,	%i0,	%g1
	edge32n	%l2,	%g2,	%l0
loop_1702:
	call	loop_1704
loop_1703:
	rd	%fprs,	%i1
	call	loop_1705
	movcc	%xcc,	%l5,	%g5
loop_1704:
	wr	%g0,	0x0,	%pcr	! 	wr	%o4,	0x037F,	%clear_softint changed by convert2hboot
	call	loop_1706
loop_1705:
	edge32ln	%o0,	%i5,	%o5
	call	loop_1707
	sdivx	%o6,	0x00E8,	%o2
loop_1706:
	call	loop_1708
	nop
	fitod	%f3,	%f20
loop_1707:
	subc	%i2,	0x07C2,	%l1
	nop 	! 	tle	%xcc,	0x66 changed by convert2hboot
loop_1708:
	nop 	! 	tn	%xcc,	0x40 changed by convert2hboot
	call	loop_1709
	call	loop_1710
	subcc	%i4,	%g6,	%o7
	call	loop_1711
loop_1709:
	movug	%fcc1,	%l4,	%i6
loop_1710:
	call	loop_1712
	movre	%l3,	0x07A,	%g7
loop_1711:
	movo	%fcc1,	0x630,	%o3
	nop 	! 	tvc	%xcc,	0x6d changed by convert2hboot
loop_1712:
	rd	%softint,	%g4
	call	loop_1713
	call	loop_1714
	call	loop_1715
	call	loop_1716
loop_1713:
	call	loop_1717
loop_1714:
	nop 	! 	rdhpr	%htba,	%i3 changed by convert2hboot
loop_1715:
	srax	%o1,	0x10,	%i7
loop_1716:
	fornot2s	%f21,	%f23,	%f19
loop_1717:
	call	loop_1718
	call	loop_1719
	rdpr	%otherwin,	%l6
	xnorcc	%g3,	0x1CEB,	%i0
loop_1718:
	nop 	! 	tneg	%icc,	0x75 changed by convert2hboot
loop_1719:
	nop 	! 	tneg	%icc,	0x37 changed by convert2hboot
	fnot1	%f2,	%f22
	call	loop_1720
	fpadd16s	%f2,	%f12,	%f18
	subccc	%g1,	0x0D3B,	%g2
	call	loop_1721
loop_1720:
	nop
	fitos	%f4,	%f11
	fstox	%f11,	%f8
	fxtos	%f8,	%f18
	movge	%icc,	0x249,	%l0
	nop	!	sir	0x1D10 !! sir is illegal now
loop_1721:
	nop
	fitos	%f1,	%f17
	fstod	%f17,	%f10
	call	loop_1722
	call	loop_1723
	edge16l	%l2,	%l5,	%i1
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x19,	%asi changed by convert2hboot
loop_1722:
	rd	%fprs,	%g5
loop_1723:
	call	loop_1724
	call	loop_1725
	call	loop_1726
	subc	%o0,	%i5,	%o6
loop_1724:
	nop 	! 	taddcctv	%o5,	%i2,	%l1 changed by convert2hboot
loop_1725:
	movgu	%xcc,	0x281,	%o2
loop_1726:
	call	loop_1727
	nop 	! 	rdhpr	%htba,	%i4 changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%g6 changed by convert2hboot
	call	loop_1728
loop_1727:
	call	loop_1729
	sub	%o7,	%l4,	%i6
	edge16	%l3,	%g7,	%o3
loop_1728:
	fmovsge	%fcc1,	%f1,	%f20
loop_1729:
	orncc	%g4,	%i3,	%i7
	nop 	! 	rdhpr	%hintp,	%o1 changed by convert2hboot
	call	loop_1730
	nop 	! 	rdhpr	%ver,	%g3 changed by convert2hboot
	udivx	%i0,	0x15CC,	%l6
	mova	%fcc0,	0x2BF,	%g1
loop_1730:
	nop
	set	0x40, %i5
	nop	 ! 	stda	%f0,	[%l7 + %i5] 0xc2 ASI use replaced by convert2hboot
	call	loop_1731
	xnorcc	%l0,	%l2,	%g2
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x80,	%asi changed by convert2hboot
loop_1731:
	call	loop_1732
	call	loop_1733
	movul	%fcc2,	0x15D,	%l5
	nop 	! 	tgu	%icc,	0x78 changed by convert2hboot
loop_1732:
	call	loop_1734
loop_1733:
	edge8l	%g5,	%o0,	%o4
	call	loop_1735
	call	loop_1736
loop_1734:
	fbuge,a,pn	%fcc0,	loop_1737
	wrpr 	%g0, 	0x1, 	%gl
loop_1735:
	rd	%fprs,	%i5
loop_1736:
	fmovdug	%fcc1,	%f20,	%f24
loop_1737:
	array8	%l1,	%o2,	%i4
	call	loop_1738
	call	loop_1739
	call	loop_1740
	call	loop_1741
loop_1738:
	st	%f13,	[%l7 + 0x50]
loop_1739:
	lduw	[%l7 + 0x6C],	%i2
loop_1740:
	sub	%g6,	%l4,	%o7
loop_1741:
	ldub	[%l7 + 0x6F],	%l3
	call	loop_1742
	call	loop_1743
	array8	%g7,	%o3,	%g4
	nop 	! 	wrpr	%i6,	0x0D31,	%tick changed by convert2hboot
loop_1742:
	movle	%fcc2,	%i3,	%i7
loop_1743:
	movn	%fcc3,	%g3,	%o1
	call	loop_1744
	call	loop_1745
	call	loop_1746
	movgu	%icc,	0x04E,	%l6
loop_1744:
	movge	%icc,	%g1,	%l0
loop_1745:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x89,	%asi changed by convert2hboot
loop_1746:
	call	loop_1747
	call	loop_1748
	movu	%fcc3,	0x386,	%g2
	call	loop_1749
loop_1747:
	bg	%icc,	loop_1750
loop_1748:
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x7, 	%fprs changed by convert2hboot
	call	loop_1751
loop_1749:
	call	loop_1752
loop_1750:
	subccc	%i0,	%g5,	%o0
	call	loop_1753
loop_1751:
	call	loop_1754
loop_1752:
	wrpr	%o4,	%l5,	%cwp
	wr	%g0,	0x0,	%pcr	! 	wr	%o5,	%o6,	%y changed by convert2hboot
loop_1753:
	call	loop_1755
loop_1754:
	nop 	! 	tvc	%icc,	0x55 changed by convert2hboot
	xorcc	%l1,	%i5,	%o2
	sra	%i4,	0x17,	%i2
loop_1755:
	edge32n	%g6,	%o7,	%l4
	set	0x58, %o2
	nop	 ! 	stda	%l2,	[%l7 + %o2] 0x11 ASI use replaced by convert2hboot
	mova	%fcc3,	0x60E,	%g7
	alignaddr	%g4,	%o3,	%i3
	movpos	%xcc,	0x33F,	%i7
	call	loop_1756
	call	loop_1757
	brnz,a,pn	%g3,	loop_1758
	call	loop_1759
loop_1756:
	call	loop_1760
loop_1757:
	call	loop_1761
loop_1758:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1759:
	call	loop_1762
loop_1760:
	nop 	! 	tsubcctv	%i6,	0x56,	%l6 changed by convert2hboot
loop_1761:
	call	loop_1763
	nop
	fitod	%f0,	%f2
	fdtoi	%f2,	%f26
loop_1762:
	call	loop_1764
	srl	%o1,	0x01,	%g1
loop_1763:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x10,	%asi changed by convert2hboot
loop_1764:
	nop
	setx	loop_1765,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x021100001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	smul	%l0,	0x1555,	%g2
	nop
	set	0x60, %o4
	stx	%i0,	[%l7 + %o4]
	call	loop_1766
loop_1765:
	call	loop_1767
	lduw	[%l7 + 0x10],	%g5
	nop 	! 	te	%icc,	0x35 changed by convert2hboot
loop_1766:
	bcs,a	%xcc,	loop_1768
loop_1767:
	movvs	%icc,	0x4C0,	%o0
	call	loop_1769
	nop
	set	0x58, %g5
	ldd	[%l7 + %g5],	%f28
loop_1768:
	subc	%i1,	0x08FD,	%l5
	fmovsn	%xcc,	%f26,	%f26
loop_1769:
	call	loop_1770
	call	loop_1771
	nop 	! 	tleu	%icc,	0x4c changed by convert2hboot
	call	loop_1772
loop_1770:
	ldstub	[%l7 + 0x1E],	%o5
loop_1771:
	nop 	! 	tcs	%xcc,	0x47 changed by convert2hboot
	nop 	! 	tgu	%icc,	0x41 changed by convert2hboot
loop_1772:
	call	loop_1773
	rd	%tick_cmpr,	%o6
	mulx	%o4,	0x060C,	%l1
	call	loop_1774
loop_1773:
	mova	%icc,	0x0D3,	%i5
	call	loop_1775
	fmovdpos	%xcc,	%f2,	%f22
loop_1774:
	alignaddr	%o2,	%i2,	%g6
	stb	%i4,	[%l7 + 0x53]
loop_1775:
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f30
	movpos	%xcc,	0x0F6,	%o7
	sdivcc	%l4,	0x1377,	%l3
	bcc	%xcc,	loop_1776
	rd	%fprs,	%g4
	edge8ln	%g7,	%o3,	%i3
	movug	%fcc3,	%g3,	%i7
loop_1776:
	call	loop_1777
	call	loop_1778
	faligndata	%f30,	%f2,	%f20
	edge32n	%l6,	%o1,	%g1
loop_1777:
	fmovrsgz	%i6,	%f24,	%f31
loop_1778:
	movg	%icc,	%l0,	%l2
	for	%f26,	%f30,	%f12
	nop 	! 	wrpr	%i0,	%g5,	%tick changed by convert2hboot
	sub	%o0,	%i1,	%l5
	nop
	set	0x24, %g2
	swap	[%l7 + %g2],	%g2
	call	loop_1779
	swap	[%l7 + 0x44],	%o6
	call	loop_1780
	nop 	! 	rdpr	%tba,	%o4 changed by convert2hboot
loop_1779:
	brlez,pn	%o5,	loop_1781
	call	loop_1782
loop_1780:
	smulcc	%l1,	0x15FB,	%i5
	bvc	%icc,	loop_1783
loop_1781:
	smulcc	%i2,	%g6,	%o2
loop_1782:
	nop
	fitod	%f15,	%f4
	call	loop_1784
loop_1783:
	or	%o7,	0x1280,	%l4
	call	loop_1785
	subc	%l3,	0x0A97,	%i4
loop_1784:
	addc	%g4,	0x10DB,	%g7
	call	loop_1786
loop_1785:
	call	loop_1787
	rd	%softint,	%i3
	call	loop_1788
loop_1786:
	xnorcc	%o3,	%g3,	%i7
loop_1787:
	call	loop_1789
	fand	%f26,	%f28,	%f8
loop_1788:
	call	loop_1790
	call	loop_1791
loop_1789:
	fornot1s	%f12,	%f1,	%f24
	movn	%fcc0,	%l6,	%o1
loop_1790:
	fmovdpos	%xcc,	%f12,	%f22
loop_1791:
	edge8ln	%i6,	%l0,	%l2
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x81,	%asi changed by convert2hboot
	sta	%f0,	[%l7 + 0x70] %asi
	mulx	%i0,	0x0C77,	%g1
	movneg	%icc,	0x095,	%o0
	fbug,a	%fcc3,	loop_1792
	bgu,a,pt	%xcc,	loop_1793
	bmask	%i1,	%l5,	%g5
	nop 	! 	tneg	%icc,	0x60 changed by convert2hboot
loop_1792:
	nop 	! 	te	%xcc,	0x61 changed by convert2hboot
loop_1793:
	fxnors	%f28,	%f27,	%f22
	srax	%g2,	0x17,	%o6
	orn	%o5,	%o4,	%i5
	edge16ln	%i2,	%l1,	%g6
	call	loop_1794
	fabss	%f13,	%f16
	fnot2s	%f21,	%f28
	fmovsule	%fcc3,	%f16,	%f25
loop_1794:
	movn	%icc,	%o7,	%o2
	movle	%fcc0,	0x718,	%l4
	smulcc	%l3,	0x1424,	%i4
	call	loop_1795
	call	loop_1796
	nop
	setx	loop_1797,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x012100001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	brgez,a	%g7,	loop_1798
loop_1795:
	fmovsneg	%icc,	%f30,	%f13
loop_1796:
	bge,pn	%xcc,	loop_1799
loop_1797:
	call	loop_1800
loop_1798:
	fmovdn	%fcc0,	%f16,	%f20
	nop 	! 	tle	%xcc,	0x68 changed by convert2hboot
loop_1799:
	nop 	! 	tn	%xcc,	0x3b changed by convert2hboot
loop_1800:
	nop
	setx loop_1801, %l0, %l1
	jmpl %l1, %i3
	call	loop_1802
	nop 	! 	rdhpr	%htba,	%g4 changed by convert2hboot
	call	loop_1803
loop_1801:
	call	loop_1804
loop_1802:
	call	loop_1805
	fmovdcs	%xcc,	%f6,	%f4
loop_1803:
	call	loop_1806
loop_1804:
	mulscc	%o3,	0x1CB1,	%g3
loop_1805:
	nop
	set	0x40, %l0
	nop	 ! 	prefetcha	[%l7 + %l0] 0x11,	 2 ASI use replaced by convert2hboot
loop_1806:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x88,	%asi changed by convert2hboot
	rd	%fprs,	%i6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr	%g0,	0x0,	%pcr	! 	wr 	%l0, 	%g0, 	%tick_cmpr changed by convert2hboot
	fbule,a,pt	%fcc0,	loop_1807
	call	loop_1808
	call	loop_1809
	nop
	setx	0x1D1E,	%l0,	%i0
	sdiv	%l0,	%i0,	%g1
loop_1807:
	xorcc	%l2,	0x0482,	%o0
loop_1808:
	stb	%i1,	[%l7 + 0x6E]
loop_1809:
	movlg	%fcc2,	0x6BA,	%g5
	call	loop_1810
	array16	%g2,	%l5,	%o5
	andncc	%o4,	0x0EAA,	%i5
	movn	%icc,	%o6,	%i2
loop_1810:
	nop
	nop
	setx	0xBC9ECF26,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xEEFF2FDE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f3,	%f17
	movrlz	%g6,	0x1E0,	%o7
	sub	%o2,	%l1,	%l3
	movlg	%fcc3,	0x039,	%l4
	edge16n	%i4,	%g7,	%i3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x486, 	%hsys_tick_cmpr changed by convert2hboot
	fandnot1s	%f1,	%f29,	%f19
	movle	%fcc3,	%l6,	%o1
	nop 	! 	tl	%xcc,	0x66 changed by convert2hboot
	call	loop_1811
	fxnors	%f2,	%f0,	%f28
	fbg,pt	%fcc2,	loop_1812
	rdpr	%pil,	%i6
loop_1811:
	nop
	set	0x57, %i6
	ldstub	[%l7 + %i6],	%i7
	wr	%g0,	0x0,	%pcr	! 	wr	%l0,	%g3,	%y changed by convert2hboot
loop_1812:
	bneg,a	%icc,	loop_1813
	popc	%g1,	%i0
	set	0x14, %i7
	nop	 ! 	swapa	[%l7 + %i7] 0x11,	%l2 ASI use replaced by convert2hboot
loop_1813:
	call	loop_1814
	nop
	setx	loop_1815,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x002400001403,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	bl,a,pn	%xcc,	loop_1816
	call	loop_1817
loop_1814:
	alignaddrl	%i1,	%o0,	%g5
loop_1815:
	subc	%g2,	0x0E03,	%l5
loop_1816:
	call	loop_1818
loop_1817:
	edge32n	%o4,	%i5,	%o6
	call	loop_1819
	call	loop_1820
loop_1818:
	bn,pn	%xcc,	loop_1821
	call	loop_1822
loop_1819:
	nop 	! 	tcc	%xcc,	0x67 changed by convert2hboot
loop_1820:
	wrpr	%i2,	%g6,	%cwp
loop_1821:
	rdpr	%otherwin,	%o5
loop_1822:
	fzeros	%f29
	sllx	%o7,	0x05,	%l1
	nop 	! 	tgu	%xcc,	0x73 changed by convert2hboot
	nop 	! 	tg	%icc,	0x63 changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%o2 changed by convert2hboot
	call	loop_1823
	rd	%sys_tick_cmpr,	%l4
	nop	!	sir	0x1F2B !! sir is illegal now
	call	loop_1824
loop_1823:
	movu	%fcc0,	0x663,	%l3
	wrpr	%g7,	%i4,	%cwp
	call	loop_1825
loop_1824:
	nop 	! 	rdhpr	%hintp,	%i3 changed by convert2hboot
	call	loop_1826
	fexpand	%f8,	%f26
loop_1825:
	call	loop_1827
	fmovsg	%xcc,	%f0,	%f22
loop_1826:
	movl	%fcc2,	%o3,	%g4
	sra	%o1,	%l6,	%i7
loop_1827:
	st	%f13,	[%l7 + 0x08]
	fpadd16	%f28,	%f26,	%f18
	rd	%tick_cmpr,	%i6
	call	loop_1828
	call	loop_1829
	call	loop_1830
	nop 	! 	tpos	%xcc,	0x63 changed by convert2hboot
loop_1828:
	movcc	%xcc,	%l0,	%g3
loop_1829:
	edge8n	%g1,	%i0,	%l2
loop_1830:
	fcmpeq32	%f20,	%f30,	%i1
	movne	%fcc3,	%g5,	%g2
	nop
	set	0x38, %l6
	stx	%l5,	[%l7 + %l6]
	nop
	fitod	%f25,	%f12
	brlz	%o0,	loop_1831
	call	loop_1832
	call	loop_1833
	nop 	! 	rdpr	%tl,	%o4 changed by convert2hboot
loop_1831:
	call	loop_1834
loop_1832:
	nop 	! 	tsubcctv	%o6,	0x70,	%i2 changed by convert2hboot
loop_1833:
	bshuffle	%f4,	%f18,	%f20
	mulscc	%g6,	0x0AF8,	%o5
loop_1834:
	umulcc	%o7,	%l1,	%i5
	call	loop_1835
	fbo,pt	%fcc0,	loop_1836
	call	loop_1837
	call	loop_1838
loop_1835:
	call	loop_1839
loop_1836:
	brlez,a	%l4,	loop_1840
loop_1837:
	edge16n	%l3,	%g7,	%i4
loop_1838:
	call	loop_1841
loop_1839:
	nop
	nop
	setx	0xE047AC00,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
loop_1840:
	fcmpeq16	%f14,	%f0,	%o2
	call	loop_1842
loop_1841:
	fmovs	%f6,	%f1
	fmovrse	%i3,	%f9,	%f21
	call	loop_1843
loop_1842:
	call	loop_1844
	bcc,a	%icc,	loop_1845
	call	loop_1846
loop_1843:
	edge16n	%g4,	%o3,	%l6
loop_1844:
	alignaddr	%o1,	%i7,	%i6
loop_1845:
	movne	%fcc1,	%g3,	%g1
loop_1846:
	fmovsule	%fcc1,	%f5,	%f16
	movrlz	%i0,	%l0,	%i1
	fmul8x16au	%f12,	%f27,	%f10
	nop
	setx	0x1AAC,	%l0,	%l2
	udivcc	%g5,	%l2,	%g2
	call	loop_1847
	movu	%fcc2,	%l5,	%o0
	movlg	%fcc3,	0x31F,	%o4
	call	loop_1848
loop_1847:
	nop
	nop
	setx	0xE1DB1EEB105E0000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	call	loop_1849
	call	loop_1850
loop_1848:
	fmovduge	%fcc1,	%f28,	%f30
	nop
	fitos	%f29,	%f26
loop_1849:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x10,	%asi changed by convert2hboot
loop_1850:
	be	%icc,	loop_1851
	call	loop_1852
	call	loop_1853
	nop 	! 	tleu	%icc,	0x4e changed by convert2hboot
loop_1851:
	array16	%g6,	%i2,	%o5
loop_1852:
	array32	%l1,	%o7,	%i5
loop_1853:
	nop
	fitos	%f5,	%f9
	fstox	%f9,	%f24
	fxtos	%f24,	%f18
	fabsd	%f30,	%f18
	nop
	set	0x24, %o5
	lduh	[%l7 + %o5],	%l3
	wr	%g0,	0x0,	%pcr	! 	wr	%l4,	%g7,	%ccr changed by convert2hboot
	bleu	%xcc,	loop_1854
	call	loop_1855
	nop
	nop
	setx	0xFAB2A22AA050B145,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x2218332B3CBE4C1D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f20,	%f4
	call	loop_1856
loop_1854:
	alignaddr	%o2,	%i3,	%g4
loop_1855:
	call	loop_1857
	fbuge	%fcc2,	loop_1858
loop_1856:
	bge	%icc,	loop_1859
	rd	%pc,	%i4
loop_1857:
	bl,a,pn	%icc,	loop_1860
loop_1858:
	call	loop_1861
loop_1859:
	movgu	%icc,	0x739,	%l6
	call	loop_1862
loop_1860:
	call	loop_1863
loop_1861:
	call	loop_1864
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1862:
	fpsub32	%f24,	%f4,	%f6
loop_1863:
	nop 	! 	ta	%icc,	0x40 changed by convert2hboot
loop_1864:
	movcc	%icc,	0x798,	%o1
	nop
	setx	0x1F11,	%l0,	%i6
	sdivx	%o3,	%i6,	%i7
	call	loop_1865
	nop
	set	0x14, %i4
	ldsh	[%l7 + %i4],	%g1
	movu	%fcc3,	0x708,	%g3
	wrpr 	%g0, 	0x2, 	%gl
loop_1865:
	call	loop_1866
	call	loop_1867
	mulx	%l0,	%i1,	%g5
	fmovrsgez	%l2,	%f25,	%f11
loop_1866:
	nop 	! 	tn	%xcc,	0x4f changed by convert2hboot
loop_1867:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xCF7, 	%hsys_tick_cmpr changed by convert2hboot
	sra	%g2,	%o4,	%o6
	call	loop_1868
	fand	%f26,	%f24,	%f6
	set	0x66, %l5
	nop	 ! 	ldstuba	[%l7 + %l5] 0x81,	%g6 ASI use replaced by convert2hboot
loop_1868:
	call	loop_1869
	call	loop_1870
	addcc	%i2,	%l1,	%o7
loop_1869:
	srax	%i5,	%o5,	%l3
loop_1870:
	nop 	! 	tleu	%xcc,	0x41 changed by convert2hboot
	bleu,pt	%icc,	loop_1871
	movule	%fcc2,	%g7,	%o2
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f6
	fxtod	%f6,	%f16
	call	loop_1872
loop_1871:
	umul	%i3,	%l4,	%i4
	call	loop_1873
	fmovsl	%fcc3,	%f27,	%f5
loop_1872:
	call	loop_1874
	fbg,a	%fcc2,	loop_1875
loop_1873:
	movcs	%xcc,	%l6,	%o1
	call	loop_1876
loop_1874:
	st	%f3,	[%l7 + 0x14]
loop_1875:
	rd	%asi,	%g4
	call	loop_1877
loop_1876:
	nop
	set	0x58, %l2
	stx	%o3,	[%l7 + %l2]
	call	loop_1878
	call	loop_1879
loop_1877:
	fmul8ulx16	%f28,	%f16,	%f30
	sdivx	%i7,	0x05DD,	%g1
loop_1878:
	bvs,a	%icc,	loop_1880
loop_1879:
	nop 	! 	tpos	%icc,	0x72 changed by convert2hboot
	flushw
	call	loop_1881
loop_1880:
	call	loop_1882
	call	loop_1883
	edge32	%i6,	%g3,	%i0
loop_1881:
	edge8ln	%i1,	%l0,	%g5
loop_1882:
	call	loop_1884
loop_1883:
	call	loop_1885
	fmovrdlez	%l2,	%f14,	%f30
	ble,a,pt	%icc,	loop_1886
loop_1884:
	movleu	%xcc,	0x1A2,	%l5
loop_1885:
	call	loop_1887
	movul	%fcc0,	%g2,	%o0
loop_1886:
	nop 	! 	tcc	%xcc,	0x62 changed by convert2hboot
	movle	%fcc0,	0x249,	%o6
loop_1887:
	call	loop_1888
	nop 	! 	tcc	%xcc,	0x3a changed by convert2hboot
	call	loop_1889
	move	%fcc0,	%g6,	%o4
loop_1888:
	fmovrdgez	%l1,	%f8,	%f8
	call	loop_1890
loop_1889:
	nop
	fitos	%f8,	%f11
	fstox	%f11,	%f0
	fxtos	%f0,	%f20
	call	loop_1891
	fpadd16s	%f18,	%f1,	%f22
loop_1890:
	movo	%fcc0,	0x795,	%o7
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x19,	%asi changed by convert2hboot
loop_1891:
	fpadd16	%f14,	%f12,	%f0
	fnor	%f8,	%f4,	%f6
	nop 	! 	tcs	%icc,	0x36 changed by convert2hboot
	call	loop_1892
	nop 	! 	tsubcctv	%o5,	0x5c,	%i2 changed by convert2hboot
	xorcc	%l3,	%o2,	%g7
	call	loop_1893
loop_1892:
	rd	%pc,	%i3
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0xeb,	%asi changed by convert2hboot
	membar	#Sync
loop_1893:
	call	loop_1894
	sth	%i4,	[%l7 + 0x1A]
	rd	%fprs,	%o1
	nop
	nop
	setx	0xD718D3220073E400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
loop_1894:
	bn,a	%xcc,	loop_1895
	nop 	! 	tcc	%xcc,	0x38 changed by convert2hboot
	srl	%l6,	0x19,	%o3
	nop
	set	0x2A, %g3
	lduh	[%l7 + %g3],	%i7
loop_1895:
	sdivx	%g1,	0x00E3,	%g4
	call	loop_1896
	call	loop_1897
	call	loop_1898
	array32	%i6,	%i0,	%i1
loop_1896:
	call	loop_1899
loop_1897:
	call	loop_1900
loop_1898:
	call	loop_1901
	fnot2	%f18,	%f0
loop_1899:
	orncc	%l0,	%g5,	%l2
loop_1900:
	sll	%g3,	0x08,	%g2
loop_1901:
	flush	%l7 + 0x30
	nop 	! 	wrpr	%o0,	%o6,	%tick changed by convert2hboot
	call	loop_1902
	call	loop_1903
	nop 	! 	tsubcc	%l5,	%g6,	%l1 changed by convert2hboot
	nop
	set	0x60, %g4
	ldx	[%l7 + %g4],	%o7
loop_1902:
	mova	%xcc,	0x38F,	%i5
loop_1903:
	fsrc2	%f16,	%f12
	call	loop_1904
	nop 	! 	tpos	%icc,	0x6d changed by convert2hboot
	call	loop_1905
	movcs	%xcc,	%o4,	%o5
loop_1904:
	call	loop_1906
	call	loop_1907
loop_1905:
	fmovrdgz	%l3,	%f8,	%f10
	and	%o2,	%g7,	%i3
loop_1906:
	call	loop_1908
loop_1907:
	add	%l4,	0x15FA,	%i4
	call	loop_1909
	rd	%fprs,	%i2
loop_1908:
	call	loop_1910
	nop 	! 	tpos	%icc,	0x52 changed by convert2hboot
loop_1909:
	nop
	set	0x30, %o1
	prefetch	[%l7 + %o1],	 4
	rd	%ccr,	%o1
loop_1910:
	fmovrsne	%l6,	%f29,	%f4
	call	loop_1911
	xor	%i7,	%o3,	%g1
	call	loop_1912
	call	loop_1913
loop_1911:
	call	loop_1914
	nop 	! 	tvc	%icc,	0x4b changed by convert2hboot
loop_1912:
	nop
	setx	0x1221,	%l0,	%i0
	sdivcc	%i6,	%i0,	%i1
loop_1913:
	nop 	! 	tvs	%icc,	0x65 changed by convert2hboot
loop_1914:
	stx	%g4,	[%l7 + 0x48]
	call	loop_1915
	nop 	! 	rdhpr	%hpstate,	%g5 changed by convert2hboot
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x80,	%asi changed by convert2hboot
loop_1915:
	wr	%g0,	0x0,	%pcr	! 	wr	%g3,	%l2,	%pic changed by convert2hboot
	rd	%asi,	%g2
	call	loop_1916
	call	loop_1917
	movug	%fcc3,	%o6,	%l5
	call	loop_1918
loop_1916:
	call	loop_1919
loop_1917:
	xnorcc	%o0,	0x0A0B,	%l1
	bmask	%o7,	%g6,	%o4
loop_1918:
	call	loop_1920
loop_1919:
	edge16ln	%i5,	%o5,	%l3
	call	loop_1921
	fnands	%f15,	%f17,	%f18
loop_1920:
	call	loop_1922
	edge32l	%o2,	%i3,	%g7
loop_1921:
	call	loop_1923
	call	loop_1924
loop_1922:
	call	loop_1925
	call	loop_1926
loop_1923:
	call	loop_1927
loop_1924:
loop_1925:
	movrne	%l4,	%i4,	%o1
loop_1926:
	movgu	%icc,	0x22B,	%i2
loop_1927:
	brlez	%i7,	loop_1928
	andcc	%l6,	0x0558,	%o3
	popc	%i6,	%g1
	call	loop_1929
loop_1928:
	rdpr	%cleanwin,	%i0
	andn	%i1,	%g5,	%g4
	call	loop_1930
loop_1929:
	popc	0x0313,	%l0
	call	loop_1931
	rd	%tick_cmpr,	%l2
loop_1930:
	call	loop_1932
	stb	%g2,	[%l7 + 0x16]
loop_1931:
	movule	%fcc2,	0x05D,	%o6
	call	loop_1933
loop_1932:
	nop
	set	0x30, %o6
	ldx	[%l7 + %o6],	%l5
	movge	%fcc2,	%g3,	%o0
	call	loop_1934
loop_1933:
	fmovrdlez	%o7,	%f0,	%f4
	call	loop_1935
	call	loop_1936
loop_1934:
	nop 	! 	tcs	%icc,	0x41 changed by convert2hboot
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
loop_1935:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x4EB, 	%hsys_tick_cmpr changed by convert2hboot
loop_1936:
	nop 	! 	tsubcc	%o5,	0x48,	%o4 changed by convert2hboot
	fmovdg	%fcc3,	%f2,	%f22
	call	loop_1937
	array8	%o2,	%i3,	%l3
	fmovdle	%icc,	%f6,	%f22
	pdist	%f10,	%f22,	%f4
loop_1937:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x10,	%asi changed by convert2hboot
	ldd	[%l7 + 0x48],	%g6
	addcc	%i4,	0x1279,	%o1
	movl	%icc,	%i7,	%l6
	call	loop_1938
	array16	%i2,	%i6,	%o3
	nop 	! 	rdhpr	%hpstate,	%g1 changed by convert2hboot
	fmovsle	%fcc1,	%f13,	%f7
loop_1938:
	call	loop_1939
	sub	%i0,	%i1,	%g5
	bmask	%g4,	%l2,	%l0
	fbn,a,pn	%fcc2,	loop_1940
loop_1939:
	call	loop_1941
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x4, 	%fprs changed by convert2hboot
	call	loop_1942
loop_1940:
	call	loop_1943
loop_1941:
	movge	%fcc2,	0x5EF,	%l5
	movule	%fcc0,	%g3,	%o0
loop_1942:
	call	loop_1944
loop_1943:
	fpsub32	%f12,	%f12,	%f24
	wrpr	%o7,	0x18B3,	%cwp
	fpadd32s	%f10,	%f24,	%f14
loop_1944:
	fmovsgu	%icc,	%f24,	%f23
	call	loop_1945
	call	loop_1946
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%l1 changed by convert2hboot
	orncc	%g6,	%i5,	%o5
loop_1945:
	call	loop_1947
loop_1946:
	rdpr	%pil,	%o4
	movpos	%icc,	0x747,	%o2
	fandnot1	%f18,	%f14,	%f14
loop_1947:
	call	loop_1948
	fbule	%fcc0,	loop_1949
	nop 	! 	tle	%icc,	0x4c changed by convert2hboot
	fbl,a,pt	%fcc1,	loop_1950
loop_1948:
	edge8n	%i3,	%l3,	%l4
loop_1949:
	xnorcc	%i4,	0x0F2B,	%g7
	call	loop_1951
loop_1950:
	nop 	! 	rdhpr	%hintp,	%o1 changed by convert2hboot
	call	loop_1952
	call	loop_1953
loop_1951:
	nop
	fitod	%f4,	%f2
	fdtos	%f2,	%f21
	movug	%fcc0,	0x18F,	%l6
loop_1952:
	call	loop_1954
loop_1953:
	rdpr	%pil,	%i7
	array16	%i2,	%o3,	%g1
	movrgz	%i6,	%i1,	%i0
loop_1954:
	edge32ln	%g5,	%g4,	%l2
	movule	%fcc0,	0x4A3,	%g2
	call	loop_1955
	movrlz	%o6,	0x315,	%l5
	edge16n	%g3,	%o0,	%l0
	ld	[%l7 + 0x08],	%f25
loop_1955:
	fmovsl	%fcc1,	%f7,	%f6
	set	0x49, %i2
	nop	 ! 	ldsba	[%l7 + %i2] 0x80,	%o7 ASI use replaced by convert2hboot
	call	loop_1956
	edge32	%g6,	%i5,	%o5
	movneg	%xcc,	%o4,	%l1
	set	0x78, %o3
	nop	 ! 	ldstuba	[%l7 + %o3] 0x81,	%o2 ASI use replaced by convert2hboot
loop_1956:
	wrpr 	%g0, 	0x3, 	%gl
	call	loop_1957
	fnand	%f26,	%f8,	%f12
	set	0x28, %l4
	nop	 ! 	prefetcha	[%l7 + %l4] 0x80,	 0 ASI use replaced by convert2hboot
loop_1957:
	call	loop_1958
	call	loop_1959
	nop 	! 	tge	%xcc,	0x74 changed by convert2hboot
	smulcc	%i4,	%g7,	%l3
loop_1958:
	edge16l	%o1,	%i7,	%i2
loop_1959:
	call	loop_1960
	movpos	%xcc,	%l6,	%g1
	fbule,a	%fcc1,	loop_1961
	ba,a	%xcc,	loop_1962
loop_1960:
	rd	%tick_cmpr,	%o3
	stw	%i6,	[%l7 + 0x28]
loop_1961:
	wrpr	%i0,	%i1,	%pil
loop_1962:
	nop	!	sir	0x09D2 !! sir is illegal now
	call	loop_1963
	nop 	! 	tl	%xcc,	0x5b changed by convert2hboot
	popc	%g5,	%l2
	call	loop_1964
loop_1963:
	call	loop_1965
	call	loop_1966
	nop 	! 	tvc	%icc,	0x5c changed by convert2hboot
loop_1964:
	movcc	%icc,	0x178,	%g2
loop_1965:
	call	loop_1967
loop_1966:
	call	loop_1968
	call	loop_1969
	fornot2	%f4,	%f0,	%f26
loop_1967:
	movpos	%icc,	0x202,	%g4
loop_1968:
	bvs,a	%icc,	loop_1970
loop_1969:
	fbge	%fcc3,	loop_1971
	call	loop_1972
	call	loop_1973
loop_1970:
	nop	!	sir	0x107E !! sir is illegal now
loop_1971:
	brlz,a	%l5,	loop_1974
loop_1972:
	movg	%icc,	0x590,	%g3
loop_1973:
	edge16	%o0,	%o6,	%l0
	set	0x2E, %l3
	nop	 ! 	lduba	[%l7 + %l3] 0x10,	%o7 ASI use replaced by convert2hboot
loop_1974:
	movleu	%icc,	0x02D,	%i5
	nop
	nop
	setx	0xF18EDFAD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f27
	addcc	%o5,	%o4,	%g6
	fpsub16s	%f22,	%f4,	%f0
	add	%l1,	%o2,	%i3
	call	loop_1975
	nop 	! 	rdpr	%tba,	%i4 changed by convert2hboot
	fcmple32	%f30,	%f22,	%g7
	call	loop_1976
loop_1975:
	flush	%l7 + 0x20
	nop
	nop
	setx	0x70425C00,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	movug	%fcc0,	0x208,	%l4
loop_1976:
	call	loop_1977
	nop 	! 	tneg	%icc,	0x6a changed by convert2hboot
	call	loop_1978
	call	loop_1979
loop_1977:
	andncc	%l3,	%o1,	%i7
	call	loop_1980
loop_1978:
	rd	%y,	%l6
loop_1979:
	call	loop_1981
	call	loop_1982
loop_1980:
	fmovdl	%xcc,	%f12,	%f6
	popc	%i2,	%g1
loop_1981:
	udivx	%i6,	0x097B,	%i0
loop_1982:
	nop
	set	0x30, %o0
	sta	%f1,	[%l7 + %o0] 0x80
	nop
	setx	0x0509,	%l0,	%i1
	udivcc	%o3,	%i1,	%l2
	movrgez	%g5,	%g2,	%g4
	fmovscs	%xcc,	%f26,	%f3
	call	loop_1983
	nop
	fitos	%f14,	%f5
	fstox	%f5,	%f14
	fxtos	%f14,	%f11
	fbue,a,pn	%fcc0,	loop_1984
	call	loop_1985
loop_1983:
	brlz	%l5,	loop_1986
	call	loop_1987
loop_1984:
	call	loop_1988
loop_1985:
	edge8l	%o0,	%g3,	%l0
loop_1986:
	call	loop_1989
loop_1987:
	fpadd32	%f30,	%f28,	%f28
loop_1988:
	flushw
	array16	%o6,	%o7,	%o5
loop_1989:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x19,	%asi changed by convert2hboot
	array32	%l1,	%o2,	%g6
	set	0x0A, %g1
	nop	 ! 	ldsha	[%l7 + %g1] 0x04,	%i4 ASI use replaced by convert2hboot
	call	loop_1990
	movrlz	%i3,	%g7,	%l3
	fbug,a,pt	%fcc0,	loop_1991
	movvc	%icc,	0x249,	%o1
loop_1990:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x88,	%asi changed by convert2hboot
loop_1991:
	edge16l	%l6,	%l4,	%i2
	rd	%y,	%i6
	nop
	nop
	setx	0x8049EC00,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	wrpr	%g1,	0x1DDE,	%pil
	brnz,a	%i0,	loop_1992
	call	loop_1993
	brnz	%o3,	loop_1994
	call	loop_1995
loop_1992:
	nop 	! 	tl	%icc,	0x37 changed by convert2hboot
loop_1993:
	bgu,a	%icc,	loop_1996
loop_1994:
	fble,pn	%fcc2,	loop_1997
loop_1995:
	move	%fcc3,	%i1,	%l2
	ldsb	[%l7 + 0x30],	%g2
loop_1996:
	nop 	! 	tn	%icc,	0x7e changed by convert2hboot
loop_1997:
	call	loop_1998
	call	loop_1999
	edge16n	%g4,	%l5,	%g5
	call	loop_2000
loop_1998:
	edge32ln	%g3,	%o0,	%l0
loop_1999:
	nop 	! 	tpos	%icc,	0x4d changed by convert2hboot
	movne	%xcc,	%o7,	%o5
loop_2000:
	rd	%asi,	%o4
	fmovsvs	%icc,	%f13,	%f15
	call	loop_2001
	fors	%f31,	%f25,	%f31
	rdpr	%gl,	%i5
	nop
	set	0x58, %g7
	flush	%l7 + %g7
loop_2001:
	call	loop_2002
	wrpr	%o6,	%o2,	%cwp
	edge16	%l1,	%i4,	%i3
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x04,	%asi changed by convert2hboot
loop_2002:
	call	loop_2003
	nop
	set	0x58, %i1
	std	%f28,	[%l7 + %i1]
	call	loop_2004
	srl	%g7,	%l3,	%i7
loop_2003:
	nop 	! 	taddcctv	%l6,	0x6e,	%o1 changed by convert2hboot
	andncc	%l4,	0x0956,	%i2
loop_2004:
	brz,a	%g1,	loop_2005
	orcc	%i6,	%o3,	%i0
	sub	%i1,	0x1CDC,	%l2
	call	loop_2006
loop_2005:
	call	loop_2007
	fcmpes	%fcc3,	%f24,	%f5
	movcc	%xcc,	0x2B0,	%g4
loop_2006:
	andcc	%l5,	%g2,	%g5
loop_2007:
	call	loop_2008
	call	loop_2009
	call	loop_2010
	call	loop_2011
loop_2008:
	nop 	! 	ta	%icc,	0x6f changed by convert2hboot
loop_2009:
	call	loop_2012
loop_2010:
	move	%fcc2,	%g3,	%l0
loop_2011:
	nop 	! 	rdhpr	%ver,	%o7 changed by convert2hboot
	movre	%o0,	0x0B1,	%o4
loop_2012:
	array16	%o5,	%i5,	%o6
	call	loop_2013
	brlez,a	%l1,	loop_2014
	call	loop_2015
loop_2013:
	call	loop_2016
	call	loop_2017
loop_2014:
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%i4 changed by convert2hboot
loop_2015:
	call	loop_2018
loop_2016:
	nop 	! 	te	%xcc,	0x4c changed by convert2hboot
loop_2017:
	fmovdule	%fcc3,	%f6,	%f18
	call	loop_2019
loop_2018:
	call	loop_2020
	or	%i3,	0x03F9,	%g6
	set	0x44, %o7
	nop	 ! 	stwa	%g7,	[%l7 + %o7] 0x11 ASI use replaced by convert2hboot
loop_2019:
	fandnot2	%f18,	%f6,	%f30
loop_2020:
	mulx	%l3,	0x04C4,	%i7
	fmovsleu	%icc,	%f2,	%f27
	rd	%pc,	%l6
	call	loop_2021
	subccc	%o1,	0x0780,	%o2
	nop 	! 	tne	%xcc,	0x3f changed by convert2hboot
	movne	%fcc2,	%i2,	%l4
loop_2021:
	call	loop_2022
	fmovslg	%fcc1,	%f22,	%f17
	movg	%xcc,	0x248,	%g1
	edge16n	%o3,	%i6,	%i0
loop_2022:
	call	loop_2023
	nop 	! 	ta	%xcc,	0x7a changed by convert2hboot
	call	loop_2024
	nop 	! 	rdhpr	%hintp,	%l2 changed by convert2hboot
loop_2023:
	fmovdcc	%icc,	%f16,	%f24
	call	loop_2025
loop_2024:
	call	loop_2026
	sra	%i1,	%l5,	%g4
	call	loop_2027
loop_2025:
	call	loop_2028
loop_2026:
	edge32ln	%g2,	%g5,	%g3
	call	loop_2029
loop_2027:
	movne	%fcc2,	%l0,	%o7
loop_2028:
	fbl,a,pt	%fcc0,	loop_2030
	edge8l	%o0,	%o5,	%i5
loop_2029:
	edge8ln	%o4,	%l1,	%o6
	umulcc	%i3,	0x155D,	%g6
loop_2030:
	flushw
	edge16n	%i4,	%g7,	%i7
	edge32ln	%l6,	%o1,	%l3
	xorcc	%i2,	%o2,	%g1
	call	loop_2031
	call	loop_2032
	call	loop_2033
	call	loop_2034
loop_2031:
	fmovdule	%fcc2,	%f2,	%f14
loop_2032:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x0EF, 	%hsys_tick_cmpr changed by convert2hboot
loop_2033:
	xor	%i6,	0x17E7,	%i0
loop_2034:
	call	loop_2035
	call	loop_2036
	nop 	! 	tleu	%xcc,	0x55 changed by convert2hboot
	move	%xcc,	%o3,	%l2
loop_2035:
	nop
	set	0x24, %i0
	nop	 ! 	swapa	[%l7 + %i0] 0x81,	%l5 ASI use replaced by convert2hboot
loop_2036:
	movu	%fcc0,	0x286,	%i1
	call	loop_2037
	call	loop_2038
	call	loop_2039
	call	loop_2040
loop_2037:
	bcc	%xcc,	loop_2041
loop_2038:
	nop 	! 	tle	%xcc,	0x3f changed by convert2hboot
loop_2039:
	call	loop_2042
loop_2040:
	movrgez	%g2,	0x249,	%g5
loop_2041:
	call	loop_2043
	wr	%g0,	0x0,	%pcr	! 	wr	%g4,	%l0,	%clear_softint changed by convert2hboot
loop_2042:
	call	loop_2044
	bvs	%xcc,	loop_2045
loop_2043:
	call	loop_2046
	fnand	%f4,	%f0,	%f26
loop_2044:
	call	loop_2047
loop_2045:
	call	loop_2048
loop_2046:
	edge16ln	%o7,	%g3,	%o0
	add	%i5,	0x14F1,	%o4
loop_2047:
	call	loop_2049
loop_2048:
	nop 	! 	rdhpr	%ver,	%l1 changed by convert2hboot
	nop 	! 	tne	%xcc,	0x71 changed by convert2hboot
	nop 	! 	tg	%icc,	0x52 changed by convert2hboot
loop_2049:
	srax	%o5,	0x0B,	%i3
	fmovdpos	%icc,	%f18,	%f2
	call	loop_2050
	nop 	! 	ta	%xcc,	0x79 changed by convert2hboot
	movule	%fcc1,	0x2CB,	%o6
	call	loop_2051
loop_2050:
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%g6
	movleu	%icc,	0x5D1,	%i4
	call	loop_2052
loop_2051:
	sra	%i7,	%g7,	%l6
	brgz,pn	%o1,	loop_2053
	nop
	setx	loop_2054,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x004200001407,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_2052:
	movrlez	%i2,	%o2,	%l3
	call	loop_2055
loop_2053:
	edge32ln	%g1,	%i6,	%i0
loop_2054:
	fmovsge	%icc,	%f25,	%f21
	nop 	! 	rdpr	%tl,	%o3 changed by convert2hboot
loop_2055:
	call	loop_2056
	fmovrdgz	%l4,	%f18,	%f24
	edge32ln	%l2,	%i1,	%g2
	call	loop_2057
loop_2056:
	brgz,a,pt	%g5,	loop_2058
	call	loop_2059
	fmovdcs	%icc,	%f2,	%f20
loop_2057:
	call	loop_2060
loop_2058:
	movrne	%l5,	0x2E3,	%l0
loop_2059:
	call	loop_2061
loop_2060:
	call	loop_2062
	movn	%icc,	%o7,	%g4
	fbge,a	%fcc1,	loop_2063
loop_2061:
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%g3 changed by convert2hboot
loop_2062:
	call	loop_2064
	movre	%i5,	0x318,	%o4
loop_2063:
	movlg	%fcc2,	0x1CE,	%l1
	ldstub	[%l7 + 0x2C],	%o0
loop_2064:
	call	loop_2065
	wr	%g0,	0x0,	%pcr	! 	wr	%i3,	0x16EF,	%ccr changed by convert2hboot
	brz	%o6,	loop_2066
	call	loop_2067
loop_2065:
	fones	%f31
	fmovrslez	%g6,	%f9,	%f1
loop_2066:
	fmovrslez	%i4,	%f0,	%f3
loop_2067:
	nop 	! 	tne	%xcc,	0x68 changed by convert2hboot
	call	loop_2068
	call	loop_2069
	bne	%xcc,	loop_2070
	call	loop_2071
loop_2068:
	call	loop_2072
loop_2069:
	nop
	setx	0x00F5,	%l0,	%o5
	udiv	%i7,	%o5,	%l6
loop_2070:
	call	loop_2073
loop_2071:
	nop
	setx	0x1692,	%l0,	%o1
	sdivx	%g7,	%o1,	%o2
loop_2072:
	and	%i2,	%l3,	%i6
	edge32ln	%i0,	%g1,	%l4
loop_2073:
	fmovdn	%icc,	%f18,	%f24
	call	loop_2074
	call	loop_2075
	nop 	! 	tle	%icc,	0x4c changed by convert2hboot
	fble,a	%fcc3,	loop_2076
loop_2074:
	fmovdg	%icc,	%f10,	%f0
loop_2075:
	movuge	%fcc1,	0x6B1,	%l2
	addc	%o3,	%g2,	%g5
loop_2076:
	rd	%fprs,	%l5
	nop
	fitos	%f8,	%f29
	fstox	%f29,	%f8
	fxtos	%f8,	%f26
	nop
	setx	0x0ECB,	%l0,	%i1
	udiv	%l0,	%i1,	%o7
	srlx	%g4,	%i5,	%g3
	call	loop_2077
	call	loop_2078
	call	loop_2079
	movo	%fcc2,	0x1F8,	%l1
loop_2077:
	rd	%tick_cmpr,	%o4
loop_2078:
	call	loop_2080
loop_2079:
	movpos	%xcc,	0x00A,	%o0
	call	loop_2081
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x5, 	%fprs changed by convert2hboot
loop_2080:
	call	loop_2082
	orn	%g6,	0x007E,	%i7
loop_2081:
	fmovdneg	%icc,	%f24,	%f20
	call	loop_2083
loop_2082:
	nop 	! 	tge	%xcc,	0x6e changed by convert2hboot
	edge8	%o5,	%l6,	%i4
	ba,a	%icc,	loop_2084
loop_2083:
	fbge	%fcc3,	loop_2085
	nop
	setx	0x1868,	%l0,	%g7
	sdivx	%o1,	%g7,	%i2
	call	loop_2086
loop_2084:
	ld	[%l7 + 0x38],	%f18
loop_2085:
	call	loop_2087
	nop 	! 	tle	%icc,	0x51 changed by convert2hboot
loop_2086:
	call	loop_2088
	addccc	%l3,	0x16C3,	%i6
loop_2087:
	add	%o2,	0x0355,	%g1
	nop 	! 	tsubcctv	%i0,	%l2,	%o3 changed by convert2hboot
loop_2088:
	call	loop_2089
	movn	%fcc0,	0x068,	%l4
	xorcc	%g5,	0x089F,	%l5
	nop
	nop
	setx	0xFFAF990F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xF0E12BE4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f3,	%f22
loop_2089:
	fblg	%fcc0,	loop_2090
	call	loop_2091
	call	loop_2092
	call	loop_2093
loop_2090:
	smulcc	%l0,	0x1B15,	%g2
loop_2091:
	ldd	[%l7 + 0x40],	%f6
loop_2092:
	movue	%fcc0,	0x727,	%i1
loop_2093:
	fands	%f18,	%f18,	%f9
	movgu	%xcc,	0x10D,	%o7
	call	loop_2094
	wr	%g0,	0x0,	%pcr	! 	wr	%g4,	0x18BC,	%softint changed by convert2hboot
	call	loop_2095
	nop 	! 	taddcctv	%i5,	0x61,	%l1 changed by convert2hboot
loop_2094:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x9AD, 	%hsys_tick_cmpr changed by convert2hboot
	movpos	%icc,	0x3C4,	%g3
loop_2095:
	edge16n	%i3,	%o6,	%g6
	fmovsgu	%icc,	%f11,	%f6
	call	loop_2096
	fmovsa	%xcc,	%f19,	%f13
	call	loop_2097
	edge16ln	%i7,	%o5,	%i4
loop_2096:
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%o1 changed by convert2hboot
	call	loop_2098
loop_2097:
	fmovdne	%icc,	%f4,	%f8
	call	loop_2099
	rd	%ccr,	%l6
loop_2098:
	smul	%i2,	%g7,	%l3
	fbuge,pn	%fcc0,	loop_2100
loop_2099:
	nop 	! 	taddcc	%i6,	%o2,	%g1 changed by convert2hboot
	set	0x4B, %g6
	nop	 ! 	ldstuba	[%l7 + %g6] 0x0c,	%i0 ASI use replaced by convert2hboot
loop_2100:
	andn	%o3,	%l4,	%g5
	call	loop_2101
	fmovdne	%fcc2,	%f2,	%f28
	nop 	! 	rdhpr	%ver,	%l2 changed by convert2hboot
	fmovsvs	%xcc,	%f13,	%f24
loop_2101:
	popc	%l5,	%g2
	set	0x10, %i5
	nop	 ! 	ldda	[%l7 + %i5] 0x0c,	%l0 ASI use replaced by convert2hboot
	movrgez	%i1,	0x0FF,	%g4
	sllx	%o7,	0x12,	%i5
	call	loop_2102
	call	loop_2103
	nop 	! 	tpos	%icc,	0x3c changed by convert2hboot
	orcc	%o4,	0x168C,	%o0
loop_2102:
	bgu	%xcc,	loop_2104
loop_2103:
	and	%g3,	0x0F79,	%i3
	call	loop_2105
	nop 	! 	tvc	%icc,	0x4e changed by convert2hboot
loop_2104:
	nop 	! 	rdhpr	%ver,	%l1 changed by convert2hboot
	nop
	setx	loop_2106,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x004200001403,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_2105:
	brgez,a,pn	%o6,	loop_2107
	call	loop_2108
	movrlez	%g6,	%o5,	%i4
loop_2106:
	bvc,pn	%xcc,	loop_2109
loop_2107:
	wr	%g0,	0x0,	%pcr	! 	wr	%i7,	%l6,	%set_softint changed by convert2hboot
loop_2108:
	nop 	! 	tne	%xcc,	0x55 changed by convert2hboot
	call	loop_2110
loop_2109:
	movcs	%xcc,	%i2,	%o1
	movleu	%icc,	%l3,	%i6
	call	loop_2111
loop_2110:
	nop
	setx	loop_2112,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x001200001406,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop
	set	0x30, %l1
	prefetch	[%l7 + %l1],	 3
	movrlz	%g7,	%o2,	%i0
loop_2111:
	call	loop_2113
loop_2112:
	movg	%fcc1,	%g1,	%o3
	call	loop_2114
	call	loop_2115
loop_2113:
	call	loop_2116
	call	loop_2117
loop_2114:
	movuge	%fcc1,	0x22D,	%g5
loop_2115:
	sethi	0x0268,	%l4
loop_2116:
	edge32	%l2,	%l5,	%g2
loop_2117:
	brnz,pt	%i1,	loop_2118
	sdivx	%l0,	0x089C,	%g4
	nop
	set	0x68, %o2
	std	%i4,	[%l7 + %o2]
	sdivx	%o7,	0x1DCB,	%o4
loop_2118:
	call	loop_2119
	nop 	! 	tneg	%icc,	0x36 changed by convert2hboot
	call	loop_2120
	subc	%g3,	0x10F3,	%i3
loop_2119:
	ba	%xcc,	loop_2121
	array8	%o0,	%o6,	%g6
loop_2120:
	call	loop_2122
	nop
	fitos	%f14,	%f3
	fstoi	%f3,	%f29
loop_2121:
	wr	%g0,	0x0,	%pcr	! 	wr	%l1,	%o5,	%set_softint changed by convert2hboot
	call	loop_2123
loop_2122:
	movg	%xcc,	%i7,	%l6
	alignaddrl	%i2,	%i4,	%l3
	call	loop_2124
loop_2123:
	fsrc2	%f2,	%f0
	call	loop_2125
	call	loop_2126
loop_2124:
	movrlez	%o1,	%i6,	%o2
	nop 	! 	te	%xcc,	0x46 changed by convert2hboot
loop_2125:
	call	loop_2127
loop_2126:
	call	loop_2128
	call	loop_2129
	fbug,a	%fcc1,	loop_2130
loop_2127:
	movn	%fcc1,	0x7AE,	%i0
loop_2128:
	bl,a,pt	%xcc,	loop_2131
loop_2129:
	nop	!	sir	0x0D84 !! sir is illegal now
loop_2130:
	udiv	%g7,	0x0507,	%g1
	movule	%fcc1,	0x372,	%o3
loop_2131:
	call	loop_2132
	bpos,pt	%xcc,	loop_2133
	nop 	! 	tn	%xcc,	0x67 changed by convert2hboot
	fmovdn	%fcc0,	%f12,	%f10
loop_2132:
	add	%g5,	0x018A,	%l4
loop_2133:
	call	loop_2134
	movre	%l2,	%g2,	%i1
	call	loop_2135
	nop 	! 	tle	%icc,	0x78 changed by convert2hboot
loop_2134:
	fmul8sux16	%f12,	%f6,	%f2
	swap	[%l7 + 0x6C],	%l5
loop_2135:
	nop 	! 	tpos	%xcc,	0x75 changed by convert2hboot
	movue	%fcc1,	0x1D7,	%g4
	movle	%fcc1,	0x7D1,	%l0
	edge8l	%i5,	%o7,	%o4
	call	loop_2136
	rd	%asi,	%i3
	nop	!	sir	0x112B !! sir is illegal now
	fmovsge	%icc,	%f27,	%f9
loop_2136:
	call	loop_2137
	ble,a,pn	%xcc,	loop_2138
	array8	%g3,	%o0,	%g6
	call	loop_2139
loop_2137:
	fxnor	%f12,	%f12,	%f6
loop_2138:
	nop	!	sir	0x0564 !! sir is illegal now
	call	loop_2140
loop_2139:
	fbule,a	%fcc3,	loop_2141
	call	loop_2142
	andcc	%o6,	0x1A41,	%o5
loop_2140:
	call	loop_2143
loop_2141:
	call	loop_2144
loop_2142:
	edge8	%i7,	%l1,	%l6
	bcs,pt	%icc,	loop_2145
loop_2143:
	edge8n	%i4,	%i2,	%l3
loop_2144:
	nop	!	sir	0x0728 !! sir is illegal now
	call	loop_2146
loop_2145:
	call	loop_2147
	nop 	! 	tn	%icc,	0x6e changed by convert2hboot
	fexpand	%f21,	%f20
loop_2146:
	fmovdug	%fcc3,	%f26,	%f30
loop_2147:
	call	loop_2148
	call	loop_2149
	nop
	setx	loop_2150,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x034100001405,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	subccc	%i6,	0x13A7,	%o1
loop_2148:
	movl	%fcc1,	0x3D1,	%o2
loop_2149:
	movl	%fcc0,	0x71D,	%i0
loop_2150:
	nop 	! 	tvs	%icc,	0x64 changed by convert2hboot
	fornot2	%f22,	%f4,	%f0
	call	loop_2151
	fmovspos	%icc,	%f28,	%f19
	alignaddrl	%g7,	%g1,	%o3
	call	loop_2152
loop_2151:
	fmul8x16au	%f11,	%f4,	%f16
	andn	%g5,	%l4,	%g2
	popc	%l2,	%i1
loop_2152:
	call	loop_2153
	fcmpes	%fcc1,	%f15,	%f6
	call	loop_2154
	call	loop_2155
loop_2153:
	call	loop_2156
	orcc	%g4,	0x0F6E,	%l5
loop_2154:
	rdpr	%otherwin,	%l0
loop_2155:
	st	%f30,	[%l7 + 0x2C]
loop_2156:
	call	loop_2157
	umulcc	%o7,	0x0EC7,	%o4
	xnorcc	%i5,	0x08E9,	%i3
	call	loop_2158
loop_2157:
	call	loop_2159
	fmovde	%fcc2,	%f6,	%f28
	fnors	%f27,	%f10,	%f3
loop_2158:
	call	loop_2160
loop_2159:
	call	loop_2161
	umul	%o0,	%g6,	%o6
	ldd	[%l7 + 0x20],	%f4
loop_2160:
	bcc,a,pn	%icc,	loop_2162
loop_2161:
	subccc	%o5,	0x0C3E,	%g3
	stw	%l1,	[%l7 + 0x3C]
	call	loop_2163
loop_2162:
	fbl,a	%fcc3,	loop_2164
	call	loop_2165
	call	loop_2166
loop_2163:
	orcc	%i7,	%i4,	%l6
loop_2164:
	movrgez	%l3,	%i6,	%i2
loop_2165:
	call	loop_2167
loop_2166:
	movg	%fcc2,	0x728,	%o2
	edge32l	%o1,	%i0,	%g7
	fmovrdlez	%g1,	%f24,	%f6
loop_2167:
	smul	%g5,	0x1E61,	%l4
	call	loop_2168
	call	loop_2169
	fxnors	%f20,	%f14,	%f4
	call	loop_2170
loop_2168:
	fbn,pn	%fcc3,	loop_2171
loop_2169:
	xor	%o3,	%g2,	%i1
	call	loop_2172
loop_2170:
	fpadd32s	%f27,	%f0,	%f8
loop_2171:
	call	loop_2173
	nop 	! 	taddcc	%g4,	0x69,	%l5 changed by convert2hboot
loop_2172:
	std	%l0,	[%l7 + 0x30]
	movlg	%fcc1,	%o7,	%o4
loop_2173:
	call	loop_2174
	call	loop_2175
	call	loop_2176
	call	loop_2177
loop_2174:
	call	loop_2178
loop_2175:
	call	loop_2179
loop_2176:
	call	loop_2180
loop_2177:
	wr	%g0,	0x0,	%pcr	! 	wr	%l2,	%i5,	%set_softint changed by convert2hboot
loop_2178:
	call	loop_2181
loop_2179:
	call	loop_2182
loop_2180:
	call	loop_2183
	edge32ln	%i3,	%o0,	%g6
loop_2181:
	movrgz	%o6,	%o5,	%l1
loop_2182:
	call	loop_2184
loop_2183:
	fmovdl	%icc,	%f18,	%f6
	call	loop_2185
	fbug,a,pt	%fcc3,	loop_2186
loop_2184:
	alignaddrl	%i7,	%g3,	%i4
	fbge,pt	%fcc3,	loop_2187
loop_2185:
	call	loop_2188
loop_2186:
	call	loop_2189
	fmovdo	%fcc2,	%f2,	%f22
loop_2187:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_2188:
	nop
	set	0x7C, %o4
	nop	 ! 	stwa	%l3,	[%l7 + %o4] 0xeb ASI use replaced by convert2hboot
	membar	#Sync
loop_2189:
	call	loop_2190
	edge8ln	%l6,	%i2,	%o2
	call	loop_2191
	call	loop_2192
loop_2190:
	fmovdvs	%xcc,	%f16,	%f8
	call	loop_2193
loop_2191:
	andncc	%i6,	0x09DD,	%o1
loop_2192:
	call	loop_2194
	ld	[%l7 + 0x64],	%f0
loop_2193:
	andcc	%g7,	%i0,	%g1
	wr	%g0,	0x0,	%pcr	! 	wr	%g5,	%l4,	%sys_tick changed by convert2hboot
loop_2194:
	ble,a	%icc,	loop_2195
	call	loop_2196
	call	loop_2197
	call	loop_2198
loop_2195:
	wr	%g0,	0x0,	%pcr	! 	wr	%o3,	0x10A7,	%y changed by convert2hboot
loop_2196:
	edge32n	%g2,	%g4,	%i1
loop_2197:
	fmovdcs	%xcc,	%f10,	%f20
loop_2198:
	orncc	%l5,	%o7,	%o4
	movule	%fcc2,	%l0,	%l2
	call	loop_2199
	call	loop_2200
	rd	%sys_tick_cmpr,	%i5
	call	loop_2201
loop_2199:
	call	loop_2202
loop_2200:
	bmask	%i3,	%g6,	%o6
	fmovrdne	%o5,	%f24,	%f2
loop_2201:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x61E, 	%hsys_tick_cmpr changed by convert2hboot
loop_2202:
	stx	%o0,	[%l7 + 0x68]
	call	loop_2203
	movvs	%icc,	%i4,	%l3
	alignaddrl	%l6,	%g3,	%i2
	nop 	! 	tvc	%icc,	0x73 changed by convert2hboot
loop_2203:
	call	loop_2204
	brgez,a	%o2,	loop_2205
	wrpr	%i6,	%g7,	%pil
	call	loop_2206
loop_2204:
	alignaddrl	%o1,	%i0,	%g1
loop_2205:
	fmovrdgz	%l4,	%f12,	%f4
	subc	%o3,	0x1456,	%g5
loop_2206:
	fbne,a,pt	%fcc0,	loop_2207
	call	loop_2208
	call	loop_2209
	fandnot2s	%f24,	%f1,	%f11
loop_2207:
	xnorcc	%g4,	%g2,	%l5
loop_2208:
	nop
	set	0x7C, %g2
	lduw	[%l7 + %g2],	%o7
loop_2209:
	nop 	! 	wrpr	%i1,	0x07E8,	%tick changed by convert2hboot
	membar	0x47
	flushw
	edge8	%l0,	%o4,	%l2
	nop
	setx	loop_2210,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x031100001406,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop
	nop
	setx	0x10C3B210CF1D4327,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xCF5D7BE1EE55F5AB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f12,	%f22
	rd	%ccr,	%i3
	flushw
loop_2210:
	call	loop_2211
	movule	%fcc1,	0x5BC,	%i5
	movule	%fcc3,	%o6,	%g6
	call	loop_2212
loop_2211:
	orn	%o5,	0x1F4E,	%l1
	movpos	%icc,	0x5C4,	%o0
	fbug	%fcc3,	loop_2213
loop_2212:
	call	loop_2214
	rdpr	%cleanwin,	%i7
	rd	%asi,	%i4
loop_2213:
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%l6 changed by convert2hboot
loop_2214:
	nop
	setx	0x11E4,	%l0,	%i2
	sdivx	%l3,	%i2,	%o2
	call	loop_2215
	umul	%g3,	%g7,	%o1
	sethi	0x06D0,	%i6
	call	loop_2216
loop_2215:
	call	loop_2217
	nop 	! 	tvs	%xcc,	0x7f changed by convert2hboot
	movrgz	%i0,	%g1,	%o3
loop_2216:
	wrpr	%g5,	0x0E3E,	%cwp
loop_2217:
	call	loop_2218
	movle	%fcc0,	0x691,	%g4
	bcs,a	%icc,	loop_2219
	movle	%icc,	%l4,	%l5
loop_2218:
	call	loop_2220
	movlg	%fcc2,	%o7,	%g2
loop_2219:
	call	loop_2221
	addccc	%l0,	0x193E,	%i1
loop_2220:
	nop 	! 	tn	%xcc,	0x49 changed by convert2hboot
	nop 	! 	ta	%icc,	0x72 changed by convert2hboot
loop_2221:
	call	loop_2222
	call	loop_2223
	bleu,a	%icc,	loop_2224
	call	loop_2225
loop_2222:
	fbge,a	%fcc2,	loop_2226
loop_2223:
	nop 	! 	tgu	%icc,	0x42 changed by convert2hboot
loop_2224:
	bneg,pn	%icc,	loop_2227
loop_2225:
	call	loop_2228
loop_2226:
	nop
	nop
	setx	0xEF50D01D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xF9A5648C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f18,	%f22
	nop
	setx	0x1835,	%l0,	%i3
	udivcc	%o4,	%i3,	%l2
loop_2227:
	call	loop_2229
loop_2228:
	rdpr	%cleanwin,	%o6
	mova	%xcc,	%i5,	%g6
	call	loop_2230
loop_2229:
	call	loop_2231
	call	loop_2232
	call	loop_2233
loop_2230:
	movl	%xcc,	0x5FC,	%l1
loop_2231:
	nop
	set	0x10, %g5
	stx	%o5,	[%l7 + %g5]
loop_2232:
	movrgz	%i7,	%o0,	%l6
loop_2233:
	fnot2	%f4,	%f16
	call	loop_2234
	rd	%asi,	%l3
	mova	%fcc2,	0x596,	%i2
	movneg	%icc,	%i4,	%o2
loop_2234:
	call	loop_2235
	call	loop_2236
	nop 	! 	rdpr	%tba,	%g3 changed by convert2hboot
	rd	%tick_cmpr,	%o1
loop_2235:
	movneg	%icc,	0x15C,	%g7
loop_2236:
	call	loop_2237
	call	loop_2238
	call	loop_2239
	call	loop_2240
loop_2237:
	wr	%g0,	0x0,	%pcr	! 	wr	%i6,	%i0,	%sys_tick changed by convert2hboot
loop_2238:
	srax	%g1,	%g5,	%g4
loop_2239:
	call	loop_2241
loop_2240:
	bge,a,pn	%icc,	loop_2242
	call	loop_2243
	call	loop_2244
loop_2241:
	fbue	%fcc3,	loop_2245
loop_2242:
	call	loop_2246
loop_2243:
	call	loop_2247
loop_2244:
	movrgz	%o3,	0x0EE,	%l5
loop_2245:
	srax	%l4,	0x08,	%g2
loop_2246:
	nop
	setx	0x1184,	%l1,	%l0
	udivcc	%o7,	%l0,	%i1
loop_2247:
	andcc	%i3,	%o4,	%o6
	movul	%fcc1,	0x5F2,	%i5
	rdpr	%canrestore,	%l2
	rdpr	%canrestore,	%l1
	flushw
	nop 	! 	tge	%xcc,	0x4f changed by convert2hboot
	orn	%o5,	0x160C,	%i7
	fnot1s	%f29,	%f14
	nop 	! 	rdhpr	%hpstate,	%g6 changed by convert2hboot
	andcc	%o0,	%l6,	%i2
	nop
	setx loop_2248, %l0, %l1
	jmpl %l1, %i4
	call	loop_2249
	fmovso	%fcc3,	%f10,	%f14
	call	loop_2250
loop_2248:
	nop 	! 	taddcc	%o2,	%g3,	%o1 changed by convert2hboot
loop_2249:
	call	loop_2251
	movrlez	%g7,	0x0D6,	%i6
loop_2250:
	nop 	! 	tgu	%xcc,	0x45 changed by convert2hboot
	fmovd	%f12,	%f12
loop_2251:
	nop 	! 	tgu	%xcc,	0x6c changed by convert2hboot
	alignaddrl	%i0,	%g1,	%g5
	mulscc	%l3,	%g4,	%l5
	call	loop_2252
	call	loop_2253
	call	loop_2254
	call	loop_2255
loop_2252:
	call	loop_2256
loop_2253:
	call	loop_2257
loop_2254:
	nop 	! 	tvs	%xcc,	0x72 changed by convert2hboot
loop_2255:
	alignaddr	%l4,	%g2,	%o7
loop_2256:
	call	loop_2258
loop_2257:
	call	loop_2259
	movpos	%xcc,	%o3,	%i1
	edge8n	%l0,	%i3,	%o6
loop_2258:
	fpack32	%f30,	%f0,	%f28
loop_2259:
	call	loop_2260
	popc	0x1386,	%i5
	nop 	! 	taddcc	%o4,	0x53,	%l1 changed by convert2hboot
	xor	%o5,	%i7,	%l2
loop_2260:
	sll	%o0,	0x09,	%l6
	call	loop_2261
	movu	%fcc2,	%g6,	%i4
	movgu	%icc,	%o2,	%i2
	orcc	%g3,	0x0ED5,	%g7
loop_2261:
	wr	%g0,	0x0,	%pcr	! 	wr	%o1,	0x1DE8,	%pic changed by convert2hboot
	edge8	%i6,	%i0,	%g5
	call	loop_2262
	call	loop_2263
	call	loop_2264
	xnorcc	%l3,	0x06CE,	%g4
loop_2262:
	movvs	%xcc,	0x741,	%l5
loop_2263:
	call	loop_2265
loop_2264:
	edge8ln	%g1,	%g2,	%l4
	call	loop_2266
	mova	%xcc,	%o3,	%o7
loop_2265:
	addccc	%l0,	%i3,	%o6
	movg	%icc,	0x50D,	%i5
loop_2266:
	ba,pn	%xcc,	loop_2267
	fpadd32	%f24,	%f24,	%f22
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x11,	%asi changed by convert2hboot
loop_2267:
	smulcc	%i1,	%o5,	%i7
	be	%xcc,	loop_2268
	fpsub16	%f30,	%f28,	%f6
	rdpr	%cwp,	%l1
	move	%fcc0,	0x2A4,	%o0
loop_2268:
	call	loop_2269
	umulcc	%l6,	%g6,	%i4
	nop
	setx loop_2270, %l0, %l1
	jmpl %l1, %o2
	fcmpne16	%f6,	%f14,	%l2
loop_2269:
	fbule,a	%fcc0,	loop_2271
	movle	%fcc3,	%i2,	%g7
loop_2270:
	call	loop_2272
	umulcc	%g3,	%o1,	%i0
loop_2271:
	call	loop_2273
	srlx	%i6,	0x0F,	%l3
loop_2272:
	for	%f10,	%f14,	%f8
	call	loop_2274
loop_2273:
	edge8n	%g4,	%g5,	%g1
	fmovsl	%icc,	%f5,	%f6
	call	loop_2275
loop_2274:
	fnot2	%f18,	%f30
	movge	%fcc1,	%g2,	%l5
	nop 	! 	rdhpr	%hintp,	%l4 changed by convert2hboot
loop_2275:
	call	loop_2276
	call	loop_2277
	bn	%icc,	loop_2278
	ldsb	[%l7 + 0x2F],	%o3
loop_2276:
	call	loop_2279
loop_2277:
	movg	%fcc1,	%l0,	%i3
loop_2278:
	sra	%o6,	0x1E,	%i5
	addccc	%o7,	0x16AA,	%o4
loop_2279:
	call	loop_2280
	and	%i1,	0x1996,	%i7
	fcmpgt16	%f30,	%f14,	%o5
	movuge	%fcc2,	%o0,	%l1
loop_2280:
	call	loop_2281
	call	loop_2282
	call	loop_2283
	fcmpne16	%f26,	%f4,	%l6
loop_2281:
	bn	%xcc,	loop_2284
loop_2282:
	nop 	! 	tge	%icc,	0x43 changed by convert2hboot
loop_2283:
	rdpr	%canrestore,	%i4
	call	loop_2285
loop_2284:
	andncc	%o2,	0x0A89,	%g6
	brlez,a,pn	%l2,	loop_2286
	call	loop_2287
loop_2285:
	sdiv	%g7,	0x1556,	%i2
	nop 	! 	tcs	%icc,	0x39 changed by convert2hboot
loop_2286:
	call	loop_2288
loop_2287:
	brz,a,pn	%g3,	loop_2289
	andncc	%i0,	%o1,	%l3
	call	loop_2290
loop_2288:
	call	loop_2291
loop_2289:
	call	loop_2292
	edge8n	%i6,	%g4,	%g5
loop_2290:
	call	loop_2293
loop_2291:
	edge8	%g2,	%l5,	%g1
loop_2292:
	smulcc	%o3,	0x112A,	%l4
	call	loop_2294
loop_2293:
	call	loop_2295
	fmul8x16al	%f4,	%f7,	%f22
	fmovdvc	%xcc,	%f0,	%f8
loop_2294:
	call	loop_2296
loop_2295:
	fmovrse	%l0,	%f8,	%f30
	call	loop_2297
	nop 	! 	tne	%icc,	0x5d changed by convert2hboot
loop_2296:
	fpack32	%f14,	%f2,	%f6
	andncc	%i3,	%i5,	%o7
loop_2297:
	fexpand	%f10,	%f30
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%o4 changed by convert2hboot
	bvc,a,pt	%xcc,	loop_2298
	sra	%i1,	%o6,	%i7
	call	loop_2299
	nop 	! 	tsubcctv	%o0,	%l1,	%o5 changed by convert2hboot
loop_2298:
	call	loop_2300
	ld	[%l7 + 0x40],	%f1
loop_2299:
	call	loop_2301
	movgu	%xcc,	0x7C6,	%i4
loop_2300:
	nop 	! 	rdhpr	%htba,	%o2 changed by convert2hboot
	fbue,a,pt	%fcc0,	loop_2302
loop_2301:
	umulcc	%l6,	%l2,	%g6
	sub	%i2,	%g3,	%g7
	movl	%fcc0,	0x6B1,	%i0
loop_2302:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_2303
	fbul	%fcc3,	loop_2304
	call	loop_2305
	andn	%l3,	0x071C,	%i6
loop_2303:
	call	loop_2306
loop_2304:
	fpsub16	%f2,	%f4,	%f8
loop_2305:
	call	loop_2307
	mova	%icc,	%g4,	%g5
loop_2306:
	call	loop_2308
	ld	[%l7 + 0x28],	%f4
loop_2307:
	rdpr	%cleanwin,	%o1
	movul	%fcc1,	%g2,	%l5
loop_2308:
	call	loop_2309
	fmovrse	%g1,	%f1,	%f26
	call	loop_2310
	srlx	%l4,	%l0,	%o3
loop_2309:
	call	loop_2311
	nop 	! 	taddcctv	%i3,	0x3c,	%i5 changed by convert2hboot
loop_2310:
	membar	0x59
	call	loop_2312
loop_2311:
	call	loop_2313
	call	loop_2314
	call	loop_2315
loop_2312:
	call	loop_2316
loop_2313:
	movvc	%xcc,	%o4,	%i1
loop_2314:
	movule	%fcc0,	%o6,	%i7
loop_2315:
	call	loop_2317
loop_2316:
	fba,a,pn	%fcc1,	loop_2318
	call	loop_2319
	call	loop_2320
loop_2317:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_2318:
	nop 	! 	tcc	%xcc,	0x56 changed by convert2hboot
loop_2319:
	call	loop_2321
loop_2320:
	srlx	%o7,	%l1,	%o5
	call	loop_2322
	sethi	0x00AF,	%o0
loop_2321:
	nop 	! 	tsubcctv	%o2,	0x43,	%l6 changed by convert2hboot
	edge16ln	%i4,	%g6,	%i2
loop_2322:
	fandnot2	%f26,	%f22,	%f18
	nop 	! 	tl	%icc,	0x68 changed by convert2hboot
	edge32n	%l2,	%g7,	%g3
	edge8n	%l3,	%i0,	%g4
	nop 	! 	tpos	%xcc,	0x48 changed by convert2hboot
	call	loop_2323
	smulcc	%g5,	%i6,	%o1
	smulcc	%l5,	%g2,	%g1
	add	%l4,	%o3,	%i3
loop_2323:
	call	loop_2324
	bcc,a	%xcc,	loop_2325
	srl	%i5,	%o4,	%l0
	call	loop_2326
loop_2324:
	sethi	0x112C,	%o6
loop_2325:
	movrlz	%i1,	0x0D7,	%o7
	fbo,a	%fcc3,	loop_2327
loop_2326:
	call	loop_2328
	call	loop_2329
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_2327:
	call	loop_2330
loop_2328:
	call	loop_2331
loop_2329:
	call	loop_2332
	fbu,a	%fcc1,	loop_2333
loop_2330:
	nop 	! 	tne	%icc,	0x52 changed by convert2hboot
loop_2331:
	call	loop_2334
loop_2332:
	nop 	! 	tneg	%xcc,	0x47 changed by convert2hboot
loop_2333:
	movl	%icc,	0x604,	%i7
	call	loop_2335
loop_2334:
	nop 	! 	tle	%xcc,	0x46 changed by convert2hboot
	call	loop_2336
	orcc	%l1,	0x19FC,	%o5
loop_2335:
	call	loop_2337
	fnot1	%f30,	%f14
loop_2336:
	subc	%o2,	0x0B39,	%l6
	call	loop_2338
loop_2337:
	call	loop_2339
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%o0
	call	loop_2340
loop_2338:
	fbg,pt	%fcc2,	loop_2341
loop_2339:
	fandnot2s	%f24,	%f2,	%f21
	movrgez	%i4,	0x1FF,	%i2
loop_2340:
	call	loop_2342
loop_2341:
	call	loop_2343
	call	loop_2344
	call	loop_2345
loop_2342:
	call	loop_2346
loop_2343:
	call	loop_2347
loop_2344:
	fbug	%fcc1,	loop_2348
loop_2345:
	nop
	nop
	setx	0xC03DC4E0EA8D39DC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f26
loop_2346:
	call	loop_2349
loop_2347:
	and	%g6,	%g7,	%l2
loop_2348:
	nop 	! 	tne	%icc,	0x4c changed by convert2hboot
	nop
	nop
	setx	0xE10160CD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xF76C9E1D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f5,	%f13
loop_2349:
	nop
	set	0x50, %i6
	nop	 ! 	swapa	[%l7 + %i6] 0x19,	%g3 ASI use replaced by convert2hboot
	call	loop_2350
	nop 	! 	tge	%icc,	0x35 changed by convert2hboot
	call	loop_2351
	mova	%fcc0,	%l3,	%i0
loop_2350:
	bleu,a	%xcc,	loop_2352
	call	loop_2353
loop_2351:
	edge32	%g5,	%i6,	%o1
	fmovsug	%fcc2,	%f3,	%f18
loop_2352:
	call	loop_2354
loop_2353:
	call	loop_2355
	edge8l	%g4,	%g2,	%l5
	addcc	%l4,	0x1376,	%g1
loop_2354:
	edge32l	%i3,	%o3,	%i5
loop_2355:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x88,	%asi changed by convert2hboot
	array16	%l0,	%o6,	%i1
	call	loop_2356
	srl	%i7,	%o7,	%l1
	membar	0x67
	call	loop_2357
loop_2356:
	nop 	! 	tgu	%icc,	0x5f changed by convert2hboot
	call	loop_2358
	call	loop_2359
loop_2357:
	brnz,pt	%o2,	loop_2360
	movcs	%xcc,	%o5,	%l6
loop_2358:
	movl	%fcc1,	%o0,	%i2
loop_2359:
	nop 	! 	tsubcctv	%i4,	%g6,	%l2 changed by convert2hboot
loop_2360:
	call	loop_2361
	nop
	setx	0x13AD,	%l0,	%l3
	udiv	%g7,	%l3,	%i0
	call	loop_2362
	xorcc	%g5,	0x0943,	%g3
loop_2361:
	sll	%o1,	%g4,	%i6
	fpack32	%f26,	%f30,	%f2
loop_2362:
	addc	%g2,	%l4,	%g1
	nop 	! 	tsubcc	%i3,	0x52,	%l5 changed by convert2hboot
	call	loop_2363
	array32	%o3,	%o4,	%i5
	movleu	%xcc,	0x7FC,	%o6
	nop 	! 	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x40,	%asi changed by convert2hboot ripped by fixASI40.pl
loop_2363:
	nop 	! 	rdpr	%tl,	%i7 changed by convert2hboot
	call	loop_2364
	nop 	! 	tg	%xcc,	0x5e changed by convert2hboot
	call	loop_2365
	rd	%fprs,	%o7
loop_2364:
	rdpr	%gl,	%i1
	set	0x10, %i7
	nop	 ! 	stda	%l0,	[%l7 + %i7] 0x22 ASI use replaced by convert2hboot
	membar	#Sync
loop_2365:
	movne	%fcc2,	0x36F,	%o2
	call	loop_2366
	call	loop_2367
	call	loop_2368
	edge16ln	%l6,	%o0,	%i2
loop_2366:
	fpsub16s	%f12,	%f10,	%f17
loop_2367:
	call	loop_2369
loop_2368:
	movrne	%o5,	%g6,	%i4
	addc	%l2,	%g7,	%l3
	fbul,pt	%fcc3,	loop_2370
loop_2369:
	nop
	nop
	setx	0xA10511D6BEC118C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x9DB459A68296D331,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f4,	%f14
	fmovda	%xcc,	%f20,	%f4
	call	loop_2371
loop_2370:
	call	loop_2372
	movn	%icc,	%i0,	%g3
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_2371:
	call	loop_2373
loop_2372:
	fbule,pn	%fcc1,	loop_2374
	movule	%fcc0,	%g5,	%g4
	fmovrdgz	%o1,	%f0,	%f0
loop_2373:
	subcc	%g2,	0x0C4E,	%i6
loop_2374:
	fbul,a,pn	%fcc0,	loop_2375
	sub	%l4,	%g1,	%l5
	st	%f4,	[%l7 + 0x78]
	flushw
loop_2375:
	call	loop_2376
	fmul8x16	%f26,	%f6,	%f4
	call	loop_2377
	edge8ln	%i3,	%o3,	%o4
loop_2376:
	fmovdlg	%fcc0,	%f26,	%f26
	fmovrdlez	%o6,	%f22,	%f10
loop_2377:
	nop 	! 	tneg	%xcc,	0x5f changed by convert2hboot
	call	loop_2378
	addccc	%i5,	%i7,	%o7
	call	loop_2379
	call	loop_2380
loop_2378:
	fmovse	%icc,	%f17,	%f18
	fmul8x16au	%f14,	%f22,	%f12
loop_2379:
	bcs,a,pn	%icc,	loop_2381
loop_2380:
	call	loop_2382
	rd	%pc,	%l0
	movne	%fcc2,	%l1,	%o2
loop_2381:
	nop
	setx	loop_2383,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x021100001407,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_2382:
	nop
	set	0x7C, %o5
	stw	%l6,	[%l7 + %o5]
	nop
	set	0x08, %l6
	ldsw	[%l7 + %l6],	%i1
	call	loop_2384
loop_2383:
	wrpr	%i2,	%o5,	%pil
	movl	%fcc3,	0x7E8,	%o0
	call	loop_2385
loop_2384:
	call	loop_2386
	movrgez	%g6,	0x3D2,	%i4
	call	loop_2387
loop_2385:
	nop 	! 	tle	%xcc,	0x40 changed by convert2hboot
loop_2386:
	call	loop_2388
	movue	%fcc1,	0x29B,	%g7
loop_2387:
	nop 	! 	tle	%icc,	0x62 changed by convert2hboot
	sdiv	%l2,	0x1415,	%l3
loop_2388:
	movul	%fcc3,	%i0,	%g3
	call	loop_2389
	fmovsgu	%icc,	%f18,	%f14
	call	loop_2390
	call	loop_2391
loop_2389:
	orncc	%g5,	%o1,	%g4
	edge32	%g2,	%l4,	%i6
loop_2390:
	nop 	! 	tneg	%xcc,	0x6c changed by convert2hboot
loop_2391:
	movleu	%xcc,	%g1,	%i3
	nop 	! 	taddcctv	%l5,	0x38,	%o3 changed by convert2hboot
	call	loop_2392
	mulscc	%o6,	%o4,	%i7
	call	loop_2393
	call	loop_2394
loop_2392:
	bgu,a	%xcc,	loop_2395
	fnor	%f2,	%f10,	%f22
loop_2393:
	call	loop_2396
loop_2394:
	call	loop_2397
loop_2395:
	movrlz	%o7,	%l0,	%l1
	call	loop_2398
loop_2396:
	call	loop_2399
loop_2397:
	fmovdug	%fcc2,	%f22,	%f8
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x19,	%asi changed by convert2hboot
	sta	%f12,	[%l7 + 0x24] %asi
loop_2398:
	fmovrdlz	%i5,	%f22,	%f4
loop_2399:
	movrgez	%l6,	%i1,	%i2
	call	loop_2400
	call	loop_2401
	call	loop_2402
	smulcc	%o2,	0x08F8,	%o5
loop_2400:
	edge32ln	%o0,	%i4,	%g7
loop_2401:
	fbg,a	%fcc3,	loop_2403
loop_2402:
	call	loop_2404
	call	loop_2405
	mulx	%l2,	0x0408,	%g6
loop_2403:
	nop 	! 	tcc	%icc,	0x7b changed by convert2hboot
loop_2404:
	nop
	set	0x62, %i4
	nop	 ! 	lduha	[%l7 + %i4] 0x88,	%i0 ASI use replaced by convert2hboot
loop_2405:
	movneg	%icc,	0x0DD,	%l3
	call	loop_2406
	nop 	! 	tn	%icc,	0x4e changed by convert2hboot
	array16	%g5,	%g3,	%o1
	call	loop_2407
loop_2406:
	call	loop_2408
	call	loop_2409
	nop 	! 	tpos	%icc,	0x58 changed by convert2hboot
loop_2407:
	call	loop_2410
loop_2408:
	nop
	setx	0x1A23,	%l0,	%l4
	udiv	%g4,	%l4,	%g2
loop_2409:
	smulcc	%i6,	0x1752,	%g1
	fmovdul	%fcc0,	%f20,	%f10
loop_2410:
	sll	%l5,	0x0F,	%o3
	call	loop_2411
	srlx	%o6,	0x08,	%i3
	call	loop_2412
	addccc	%i7,	%o7,	%l0
loop_2411:
	call	loop_2413
	movlg	%fcc2,	%o4,	%l1
loop_2412:
	call	loop_2414
	xnor	%i5,	%i1,	%i2
loop_2413:
	sdivx	%o2,	0x0FDC,	%o5
	call	loop_2415
loop_2414:
	call	loop_2416
	call	loop_2417
	fornot2	%f10,	%f8,	%f2
loop_2415:
	fbg,a,pt	%fcc3,	loop_2418
loop_2416:
	edge32ln	%l6,	%i4,	%o0
loop_2417:
	edge16ln	%g7,	%l2,	%g6
	fmovrdlz	%l3,	%f6,	%f4
loop_2418:
	rdpr	%canrestore,	%g5
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_2419
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_2420
	call	loop_2421
loop_2419:
	call	loop_2422
	fbge,a	%fcc3,	loop_2423
loop_2420:
	movrgez	%g3,	0x2DA,	%i0
loop_2421:
	nop
	set	0x70, %l5
	std	%g4,	[%l7 + %l5]
loop_2422:
	call	loop_2424
loop_2423:
	call	loop_2425
	movrne	%o1,	0x310,	%g2
	or	%l4,	0x0962,	%g1
loop_2424:
	addcc	%l5,	%i6,	%o3
loop_2425:
	call	loop_2426
	call	loop_2427
	call	loop_2428
	fmovspos	%xcc,	%f24,	%f30
loop_2426:
	nop
	setx	0x1DB8,	%l0,	%i7
	udiv	%i3,	%i7,	%o6
loop_2427:
	sra	%l0,	%o7,	%l1
loop_2428:
	bpos,a,pn	%icc,	loop_2429
	call	loop_2430
	nop 	! 	tsubcc	%i5,	%i1,	%i2 changed by convert2hboot
	wr	%g0,	0x0,	%pcr	! 	wr	%o4,	0x16F3,	%softint changed by convert2hboot
loop_2429:
	call	loop_2431
loop_2430:
	rd	%fprs,	%o2
	st	%f13,	[%l7 + 0x50]
	nop 	! 	tgu	%xcc,	0x56 changed by convert2hboot
loop_2431:
	ble	%xcc,	loop_2432
	fmovsl	%xcc,	%f17,	%f5
	movleu	%icc,	%l6,	%o5
	call	loop_2433
loop_2432:
	edge8	%i4,	%g7,	%o0
	nop
	set	0x2C, %l2
	swap	[%l7 + %l2],	%l2
	edge32	%g6,	%l3,	%g3
loop_2433:
	call	loop_2434
	sub	%i0,	0x0976,	%g4
	edge16	%g5,	%g2,	%l4
	nop
	set	0x28, %g3
	lduw	[%l7 + %g3],	%g1
loop_2434:
	nop 	! 	taddcc	%o1,	%i6,	%o3 changed by convert2hboot
	call	loop_2435
	movge	%icc,	0x7FD,	%i3
	movre	%i7,	0x01E,	%l5
	fblg,a	%fcc3,	loop_2436
loop_2435:
	nop
	setx loop_2437, %l0, %l1
	jmpl %l1, %l0
	call	loop_2438
	fmovrsgez	%o6,	%f26,	%f1
loop_2436:
	nop
	set	0x5B, %g4
	nop	 ! 	stba	%l1,	[%l7 + %g4] 0x2f ASI use replaced by convert2hboot
	membar	#Sync
loop_2437:
	fbg,a,pn	%fcc0,	loop_2439
loop_2438:
	call	loop_2440
	call	loop_2441
	rdpr	%gl,	%o7
loop_2439:
	movvs	%xcc,	0x152,	%i5
loop_2440:
	call	loop_2442
loop_2441:
	addcc	%i2,	%o4,	%o2
	wr	%g0,	0x0,	%pcr	! 	wr	%i1,	0x0240,	%ccr changed by convert2hboot
	movgu	%icc,	%o5,	%l6
loop_2442:
	nop 	! 	tn	%xcc,	0x42 changed by convert2hboot
	call	loop_2443
	bg,pn	%xcc,	loop_2444
	nop
	set	0x70, %o1
	ldx	[%l7 + %o1],	%i4
	xor	%g7,	0x1DC5,	%l2
loop_2443:
	edge32n	%o0,	%g6,	%g3
loop_2444:
	call	loop_2445
	movrlez	%l3,	0x382,	%i0
	mulx	%g5,	0x0763,	%g2
	nop
	setx	loop_2446,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x002100001402,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_2445:
	fmovsa	%xcc,	%f29,	%f23
	call	loop_2447
	nop 	! 	tge	%xcc,	0x4a changed by convert2hboot
loop_2446:
	nop 	! 	tsubcc	%g4,	0x71,	%l4 changed by convert2hboot
	call	loop_2448
loop_2447:
	call	loop_2449
	fpsub32	%f20,	%f6,	%f4
	bneg,a	%icc,	loop_2450
loop_2448:
	call	loop_2451
loop_2449:
	flushw
	fnand	%f30,	%f10,	%f20
loop_2450:
	srlx	%o1,	%g1,	%o3
loop_2451:
	call	loop_2452
	fbo,a	%fcc0,	loop_2453
	call	loop_2454
	fbule,a	%fcc3,	loop_2455
loop_2452:
	call	loop_2456
loop_2453:
	fmovsvc	%xcc,	%f29,	%f17
loop_2454:
	subcc	%i3,	0x00B2,	%i6
loop_2455:
	nop 	! 	tcc	%xcc,	0x6f changed by convert2hboot
loop_2456:
	call	loop_2457
	nop 	! 	taddcctv	%l5,	%i7,	%o6 changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	rd	%fprs,	%l0
loop_2457:
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f30
	fxtod	%f30,	%f22
	fmovdvc	%icc,	%f28,	%f12
	orncc	%o7,	0x0D41,	%i2
	rd	%ccr,	%o4
	wrpr 	%g0, 	0x0, 	%gl
	nop
	nop
	setx	0xA2D67AA6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x1613EA01,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f28,	%f1
	brgez,a,pn	%i1,	loop_2458
	fmovsl	%fcc0,	%f14,	%f28
	call	loop_2459
	nop 	! 	tvc	%xcc,	0x73 changed by convert2hboot
loop_2458:
	and	%o2,	0x1C10,	%o5
	call	loop_2460
loop_2459:
	call	loop_2461
	fbue	%fcc3,	loop_2462
	be	%icc,	loop_2463
loop_2460:
	call	loop_2464
loop_2461:
	fnors	%f13,	%f30,	%f31
loop_2462:
	call	loop_2465
loop_2463:
	movuge	%fcc0,	%i4,	%l6
loop_2464:
	movlg	%fcc0,	0x1CC,	%g7
	subcc	%o0,	0x0770,	%g6
loop_2465:
	fbe,a	%fcc1,	loop_2466
	movuge	%fcc1,	%g3,	%l3
	be,a	%icc,	loop_2467
	nop 	! 	tpos	%icc,	0x51 changed by convert2hboot
loop_2466:
	fornot1	%f2,	%f26,	%f6
	addccc	%l2,	0x07B2,	%i0
loop_2467:
	fmovsue	%fcc3,	%f22,	%f23
	wrpr 	%g0, 	0x1, 	%gl
	subc	%g5,	0x1B02,	%l4
	call	loop_2468
	fnors	%f7,	%f18,	%f20
	rdpr	%cleanwin,	%o1
	fcmped	%fcc3,	%f4,	%f2
loop_2468:
	call	loop_2469
	call	loop_2470
	movcs	%icc,	%g4,	%o3
	call	loop_2471
loop_2469:
	movleu	%icc,	0x695,	%g1
loop_2470:
	nop 	! 	tvs	%icc,	0x42 changed by convert2hboot
	call	loop_2472
loop_2471:
	nop 	! 	tl	%icc,	0x4f changed by convert2hboot
	call	loop_2473
	membar	0x30
loop_2472:
	call	loop_2474
	rd	%asi,	%i3
loop_2473:
	call	loop_2475
	call	loop_2476
loop_2474:
	edge16ln	%i6,	%l5,	%i7
	umul	%o6,	0x1594,	%l1
loop_2475:
	fbn	%fcc2,	loop_2477
loop_2476:
	call	loop_2478
	fmovdlg	%fcc3,	%f24,	%f16
	bleu	%xcc,	loop_2479
loop_2477:
	andncc	%l0,	0x0F30,	%i2
loop_2478:
	call	loop_2480
	call	loop_2481
loop_2479:
	call	loop_2482
	edge32n	%o7,	%o4,	%i5
loop_2480:
	call	loop_2483
loop_2481:
	addccc	%o2,	0x1F26,	%o5
loop_2482:
	sethi	0x0D02,	%i4
	fmovrdlz	%i1,	%f26,	%f12
loop_2483:
	call	loop_2484
	umul	%g7,	0x1016,	%o0
	movpos	%xcc,	%l6,	%g6
	call	loop_2485
loop_2484:
	call	loop_2486
	nop
	fitod	%f16,	%f12
	call	loop_2487
loop_2485:
	edge16	%l3,	%g3,	%l2
loop_2486:
	fmovrslz	%g2,	%f6,	%f7
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_2487:
	nop 	! 	rdhpr	%ver,	%g5 changed by convert2hboot
	edge8ln	%i0,	%o1,	%l4
	call	loop_2488
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x6, 	%fprs changed by convert2hboot
	sra	%o3,	%g1,	%i6
	call	loop_2489
loop_2488:
	call	loop_2490
	nop 	! 	tcc	%icc,	0x4e changed by convert2hboot
	rd	%asi,	%i3
loop_2489:
	call	loop_2491
loop_2490:
	edge16n	%i7,	%o6,	%l1
	nop 	! 	tne	%icc,	0x4b changed by convert2hboot
	call	loop_2492
loop_2491:
	nop 	! 	rdhpr	%hintp,	%l0 changed by convert2hboot
	for	%f30,	%f20,	%f10
	call	loop_2493
loop_2492:
	brnz	%i2,	loop_2494
	nop 	! 	wrpr	%o7,	%o4,	%tick changed by convert2hboot
	call	loop_2495
loop_2493:
	call	loop_2496
loop_2494:
	call	loop_2497
	movug	%fcc0,	%l5,	%o2
loop_2495:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x80,	%asi changed by convert2hboot
loop_2496:
	call	loop_2498
loop_2497:
	srl	%o5,	%i4,	%g7
	movgu	%icc,	%o0,	%i1
	edge8n	%l6,	%g6,	%g3
loop_2498:
	nop 	! 	tcs	%xcc,	0x49 changed by convert2hboot
	bn,pn	%xcc,	loop_2499
	xnorcc	%l2,	%g2,	%l3
	call	loop_2500
	xnor	%g5,	%o1,	%i0
loop_2499:
	nop 	! 	tg	%icc,	0x3f changed by convert2hboot
	lduh	[%l7 + 0x62],	%l4
loop_2500:
	call	loop_2501
	fba,pt	%fcc0,	loop_2502
	nop 	! 	rdpr	%tba,	%g4 changed by convert2hboot
	wrpr 	%g0, 	0x2, 	%gl
loop_2501:
	fbule	%fcc1,	loop_2503
loop_2502:
	nop 	! 	tvc	%xcc,	0x42 changed by convert2hboot
	call	loop_2504
	call	loop_2505
loop_2503:
	nop
	fitos	%f1,	%f11
	fstod	%f11,	%f18
	fand	%f2,	%f14,	%f22
loop_2504:
	st	%f18,	[%l7 + 0x48]
loop_2505:
	call	loop_2506
	nop
	set	0x3C, %o6
	flush	%l7 + %o6
	nop 	! 	tgu	%icc,	0x52 changed by convert2hboot
	wr	%g0,	0x0,	%pcr	! 	wr	%o3,	%i7,	%pic changed by convert2hboot
loop_2506:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fbge,a,pn	%fcc1,	loop_2507
	fcmped	%fcc1,	%f30,	%f14
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x04,	%asi changed by convert2hboot
loop_2507:
	call	loop_2508
	srlx	%o6,	0x04,	%l0
	nop
	set	0x6B, %o3
	ldstub	[%l7 + %o3],	%l1
	movgu	%xcc,	%o7,	%i2
loop_2508:
	nop 	! 	tsubcctv	%o4,	%l5,	%i5 changed by convert2hboot
	wrpr 	%g0, 	0x3, 	%gl
	nop 	! 	te	%xcc,	0x3b changed by convert2hboot
	smulcc	%g7,	%o0,	%i4
	nop
	fitod	%f9,	%f0
	nop 	! 	tneg	%icc,	0x71 changed by convert2hboot
	array32	%i1,	%g6,	%l6
	movule	%fcc0,	%g3,	%l2
	sll	%l3,	%g2,	%g5
	rdpr	%wstate,	%o1
	fbge,pt	%fcc2,	loop_2509
	nop
	setx loop_2510, %l0, %l1
	jmpl %l1, %l4
	nop 	! 	tvc	%icc,	0x3a changed by convert2hboot
	nop
	fitod	%f4,	%f4
	fdtoi	%f4,	%f14
loop_2509:
	call	loop_2511
loop_2510:
	fmovsleu	%icc,	%f24,	%f23
	be,a,pn	%icc,	loop_2512
	bne,a,pt	%xcc,	loop_2513
loop_2511:
	edge8n	%g4,	%g1,	%i0
	array32	%i6,	%i7,	%o3
loop_2512:
	call	loop_2514
loop_2513:
	nop 	! 	tvc	%icc,	0x45 changed by convert2hboot
	set	0x24, %l4
	nop	 ! 	ldswa	[%l7 + %l4] 0x18,	%i3 ASI use replaced by convert2hboot
loop_2514:
	call	loop_2515
	movug	%fcc3,	%o6,	%l0
	movleu	%icc,	0x05C,	%l1
	call	loop_2516
loop_2515:
	nop 	! 	tgu	%xcc,	0x54 changed by convert2hboot
	call	loop_2517
	movvs	%xcc,	%o7,	%i2
loop_2516:
	call	loop_2518
	call	loop_2519
loop_2517:
	fmovsuge	%fcc2,	%f1,	%f20
	call	loop_2520
loop_2518:
	call	loop_2521
loop_2519:
	wr	%g0,	0x0,	%pcr	! 	wr	%l5,	%i5,	%softint changed by convert2hboot
	movlg	%fcc2,	0x53F,	%o2
loop_2520:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x18,	%asi changed by convert2hboot
loop_2521:
	nop
	setx	loop_2522,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x031100001403,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop
	setx	loop_2523,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x024200001402,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	bl,a	%icc,	loop_2524
	fornot1s	%f13,	%f28,	%f29
loop_2522:
	fmovdpos	%xcc,	%f2,	%f20
loop_2523:
	call	loop_2525
loop_2524:
	movo	%fcc3,	0x2B5,	%o4
	movrlz	%i4,	0x043,	%o0
	st	%f27,	[%l7 + 0x30]
loop_2525:
	xnorcc	%i1,	%l6,	%g3
	movuge	%fcc3,	%g6,	%l3
	ldd	[%l7 + 0x70],	%g2
	fcmpeq32	%f6,	%f12,	%l2
	movvc	%xcc,	0x3A2,	%g5
	fmovrslz	%l4,	%f9,	%f26
	movvc	%icc,	%o1,	%g1
	andncc	%i0,	%i6,	%i7
	fnors	%f4,	%f6,	%f29
	xorcc	%g4,	%i3,	%o3
	movle	%icc,	%o6,	%l0
	edge8ln	%l1,	%o7,	%i2
	call	loop_2526
	call	loop_2527
	fbn,a,pn	%fcc2,	loop_2528
	call	loop_2529
loop_2526:
	xorcc	%i5,	0x0113,	%l5
loop_2527:
	call	loop_2530
loop_2528:
	ldstub	[%l7 + 0x55],	%o2
loop_2529:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	xorcc	%o5,	%o4,	%i4
loop_2530:
	nop
	set	0x21, %l3
	nop	 ! 	ldsba	[%l7 + %l3] 0x0c,	%g7 ASI use replaced by convert2hboot
	movgu	%icc,	0x779,	%o0
	call	loop_2531
	call	loop_2532
	call	loop_2533
	nop
	set	0x24, %i2
	sth	%i1,	[%l7 + %i2]
loop_2531:
	call	loop_2534
loop_2532:
	brgz,a	%l6,	loop_2535
loop_2533:
	array16	%g3,	%g6,	%g2
	alignaddrl	%l2,	%g5,	%l3
loop_2534:
	call	loop_2536
loop_2535:
	fnot2s	%f24,	%f31
	call	loop_2537
	fbl,a	%fcc0,	loop_2538
loop_2536:
	call	loop_2539
	rdpr	%wstate,	%o1
loop_2537:
	call	loop_2540
loop_2538:
	bshuffle	%f18,	%f18,	%f30
loop_2539:
	fblg,a	%fcc0,	loop_2541
	call	loop_2542
loop_2540:
	bl,a	%icc,	loop_2543
	alignaddr	%l4,	%g1,	%i0
loop_2541:
	movre	%i7,	%g4,	%i6
loop_2542:
	call	loop_2544
loop_2543:
	call	loop_2545
	call	loop_2546
	alignaddrl	%o3,	%o6,	%l0
loop_2544:
	fmovsneg	%xcc,	%f27,	%f25
loop_2545:
	brnz	%i3,	loop_2547
loop_2546:
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x6, 	%fprs changed by convert2hboot
	fmovsl	%fcc0,	%f22,	%f5
	fmovsul	%fcc1,	%f20,	%f25
loop_2547:
	call	loop_2548
	rd	%ccr,	%i2
	fand	%f2,	%f14,	%f28
	call	loop_2549
loop_2548:
	fbue	%fcc1,	loop_2550
	fmovdne	%fcc2,	%f26,	%f10
	call	loop_2551
loop_2549:
	call	loop_2552
loop_2550:
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%f14
	call	loop_2553
loop_2551:
	call	loop_2554
loop_2552:
	call	loop_2555
	call	loop_2556
loop_2553:
	xor	%i5,	%l5,	%o2
loop_2554:
	edge32l	%o5,	%o4,	%g7
loop_2555:
	nop 	! 	ta	%xcc,	0x41 changed by convert2hboot
loop_2556:
	andn	%i4,	%i1,	%l6
	movrlez	%o0,	0x315,	%g6
	call	loop_2557
	call	loop_2558
	call	loop_2559
	fbn	%fcc3,	loop_2560
loop_2557:
	nop
	nop
	setx	0xF2131DA1C8D93F52,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x458B66F94C940CAC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f22,	%f8
loop_2558:
	call	loop_2561
loop_2559:
	call	loop_2562
loop_2560:
	fand	%f6,	%f2,	%f22
	edge32	%g3,	%l2,	%g5
loop_2561:
	add	%g2,	0x0419,	%o1
loop_2562:
	nop
	set	0x30, %g7
	prefetch	[%l7 + %g7],	 3
	nop	!	sir	0x1B28 !! sir is illegal now
	call	loop_2563
	bvs	%xcc,	loop_2564
	movcs	%icc,	0x59F,	%l3
	call	loop_2565
loop_2563:
	call	loop_2566
loop_2564:
	call	loop_2567
	call	loop_2568
loop_2565:
	nop 	! 	tl	%icc,	0x3d changed by convert2hboot
loop_2566:
	call	loop_2569
loop_2567:
	fmovdvc	%icc,	%f26,	%f6
loop_2568:
	call	loop_2570
	alignaddr	%l4,	%i0,	%g1
loop_2569:
	nop
	setx	0x19ED,	%l0,	%i6
	sdivcc	%i7,	%i6,	%g4
	fpsub16s	%f5,	%f1,	%f3
loop_2570:
	nop 	! 	tneg	%icc,	0x76 changed by convert2hboot
	bneg	%xcc,	loop_2571
	call	loop_2572
	mulscc	%o3,	%o6,	%l0
	call	loop_2573
loop_2571:
	call	loop_2574
loop_2572:
	rdpr	%pil,	%l1
	call	loop_2575
loop_2573:
	nop 	! 	tneg	%icc,	0x3c changed by convert2hboot
loop_2574:
	nop 	! 	tsubcc	%o7,	%i3,	%i2 changed by convert2hboot
	call	loop_2576
loop_2575:
	edge16	%l5,	%i5,	%o2
	call	loop_2577
	fsrc2	%f16,	%f16
loop_2576:
	edge16ln	%o5,	%o4,	%g7
	call	loop_2578
loop_2577:
	nop
	set	0x78, %i1
	std	%f8,	[%l7 + %i1]
	edge32l	%i4,	%i1,	%l6
	rd	%asi,	%o0
loop_2578:
	nop
	set	0x40, %g1
	nop	 ! 	lduwa	[%l7 + %g1] 0x11,	%g3 ASI use replaced by convert2hboot
	nop 	! 	tle	%icc,	0x44 changed by convert2hboot
	movu	%fcc0,	%l2,	%g6
	edge8l	%g2,	%o1,	%g5
	edge16l	%l4,	%i0,	%l3
	call	loop_2579
	fmovdleu	%xcc,	%f30,	%f24
	call	loop_2580
	nop 	! 	tvs	%icc,	0x75 changed by convert2hboot
loop_2579:
	movneg	%xcc,	%g1,	%i7
	nop
	set	0x69, %o7
	ldub	[%l7 + %o7],	%i6
loop_2580:
	call	loop_2581
	bne,a,pt	%icc,	loop_2582
	call	loop_2583
	call	loop_2584
loop_2581:
	fcmpne32	%f30,	%f12,	%g4
loop_2582:
	fcmpd	%fcc0,	%f26,	%f2
loop_2583:
	movug	%fcc1,	%o3,	%l0
loop_2584:
	nop
	set	0x54, %i0
	ldub	[%l7 + %i0],	%o6
	nop 	! 	taddcctv	%o7,	0x52,	%i3 changed by convert2hboot
	nop 	! 	tcc	%xcc,	0x62 changed by convert2hboot
	call	loop_2585
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	tcs	%icc,	0x79 changed by convert2hboot
	call	loop_2586
loop_2585:
	call	loop_2587
	call	loop_2588
	call	loop_2589
loop_2586:
	call	loop_2590
loop_2587:
	nop
	fitos	%f0,	%f26
	fstod	%f26,	%f20
loop_2588:
	srl	%l5,	0x10,	%i5
loop_2589:
	nop
	set	0x4C, %g6
	lda	[%l7 + %g6] 0x0c,	%f19
loop_2590:
	andn	%i2,	0x0CD1,	%o2
	movrlz	%o5,	%o4,	%g7
	rdpr	%cansave,	%i4
	movl	%fcc2,	0x12D,	%l6
	call	loop_2591
	ble	%icc,	loop_2592
	call	loop_2593
	wrpr	%o0,	0x1223,	%pil
loop_2591:
	umul	%i1,	%g3,	%l2
loop_2592:
	fmovsl	%fcc2,	%f21,	%f23
loop_2593:
	movvc	%xcc,	0x6F8,	%g6
	sub	%g2,	0x1D91,	%o1
	call	loop_2594
	call	loop_2595
	or	%g5,	0x1987,	%i0
	nop 	! 	tgu	%icc,	0x3a changed by convert2hboot
loop_2594:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
loop_2595:
	edge16l	%g1,	%i6,	%g4
	call	loop_2596
	nop
	nop
	setx	0xCB62451DD076F000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	fxor	%f18,	%f24,	%f18
	nop
	set	0x34, %i5
	prefetch	[%l7 + %i5],	 1
loop_2596:
	call	loop_2597
	bcs,a,pn	%icc,	loop_2598
	nop	!	sir	0x1E7C !! sir is illegal now
	prefetch	[%l7 + 0x78],	 0
loop_2597:
	subcc	%i7,	%o3,	%o6
loop_2598:
	call	loop_2599
	call	loop_2600
	bpos,a,pt	%xcc,	loop_2601
	andncc	%o7,	0x0B41,	%l0
loop_2599:
	call	loop_2602
loop_2600:
	call	loop_2603
loop_2601:
	call	loop_2604
	array16	%i3,	%l1,	%i5
loop_2602:
	fexpand	%f19,	%f4
loop_2603:
	movrlez	%i2,	0x206,	%o2
loop_2604:
	stb	%o5,	[%l7 + 0x1B]
	subccc	%l5,	%g7,	%i4
	nop
	setx	0x1B3E,	%l0,	%o0
	udiv	%l6,	%o0,	%i1
	fmovrdgz	%o4,	%f12,	%f30
	movpos	%xcc,	%l2,	%g3
	ble	%xcc,	loop_2605
	nop 	! 	taddcc	%g2,	%g6,	%g5 changed by convert2hboot
	call	loop_2606
	call	loop_2607
loop_2605:
	movrgz	%o1,	0x168,	%i0
	fone	%f28
loop_2606:
	rdpr	%cleanwin,	%l4
loop_2607:
	ldx	[%l7 + 0x48],	%g1
	nop 	! 	rdhpr	%htba,	%l3 changed by convert2hboot
	array16	%g4,	%i7,	%i6
	fbul,a	%fcc3,	loop_2608
	call	loop_2609
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop 	! 	tn	%xcc,	0x7b changed by convert2hboot
loop_2608:
	bvc	%icc,	loop_2610
loop_2609:
	sdivx	%o6,	0x113B,	%o3
	edge32	%o7,	%l0,	%i3
	wr	%g0,	0x0,	%pcr	! 	wr	%i5,	0x1F5F,	%ccr changed by convert2hboot
loop_2610:
	pdist	%f2,	%f4,	%f26
	fbul	%fcc1,	loop_2611
	nop
	nop
	setx	0xF41DE264006EF000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	call	loop_2612
	call	loop_2613
loop_2611:
	movo	%fcc2,	%l1,	%o2
	or	%o5,	0x09CE,	%i2
loop_2612:
	call	loop_2614
loop_2613:
	bn,pt	%icc,	loop_2615
	fbug,a	%fcc1,	loop_2616
	addc	%g7,	0x0537,	%i4
loop_2614:
	call	loop_2617
loop_2615:
	call	loop_2618
loop_2616:
	movule	%fcc1,	0x096,	%l5
	call	loop_2619
loop_2617:
	call	loop_2620
loop_2618:
	add	%l6,	0x173F,	%i1
	call	loop_2621
loop_2619:
	nop
	setx	0x142B,	%l0,	%l2
	udiv	%o0,	%l2,	%o4
loop_2620:
	ld	[%l7 + 0x3C],	%f29
	call	loop_2622
loop_2621:
	nop 	! 	tpos	%icc,	0x40 changed by convert2hboot
	call	loop_2623
	call	loop_2624
loop_2622:
	movn	%xcc,	0x419,	%g3
	nop
	set	0x4C, %i3
	flush	%l7 + %i3
loop_2623:
	call	loop_2625
loop_2624:
	rd	%asi,	%g6
	fbne	%fcc1,	loop_2626
	movcs	%icc,	0x261,	%g5
loop_2625:
	nop 	! 	taddcctv	%o1,	%i0,	%g2 changed by convert2hboot
	movvs	%xcc,	%l4,	%g1
loop_2626:
	fba,pn	%fcc2,	loop_2627
	call	loop_2628
	movn	%icc,	0x450,	%l3
	srlx	%g4,	0x03,	%i7
loop_2627:
	call	loop_2629
loop_2628:
	edge8	%o6,	%i6,	%o7
	ldsh	[%l7 + 0x6E],	%l0
	ldx	[%l7 + 0x20],	%i3
loop_2629:
	movle	%icc,	0x78F,	%o3
	set	0x14, %l1
	nop	 ! 	lduwa	[%l7 + %l1] 0x10,	%i5 ASI use replaced by convert2hboot
	nop
	setx	0x1EB6,	%l0,	%o5
	udivcc	%o2,	%o5,	%i2
	call	loop_2630
	edge16	%l1,	%i4,	%l5
	sub	%g7,	0x12FD,	%l6
	call	loop_2631
loop_2630:
	flushw
	call	loop_2632
	wr	%g0,	0x0,	%pcr	! 	wr	%i1,	0x1397,	%clear_softint changed by convert2hboot
loop_2631:
	nop 	! 	rdhpr	%hintp,	%l2 changed by convert2hboot
	pdist	%f14,	%f12,	%f4
loop_2632:
	orn	%o4,	0x1EDD,	%o0
	fmovdo	%fcc3,	%f16,	%f4
	fmovdgu	%xcc,	%f4,	%f14
	call	loop_2633
	call	loop_2634
	call	loop_2635
	stx	%g3,	[%l7 + 0x38]
loop_2633:
	call	loop_2636
loop_2634:
	call	loop_2637
loop_2635:
	rdpr	%otherwin,	%g6
	movrlez	%g5,	0x304,	%o1
loop_2636:
	brnz,a	%i0,	loop_2638
loop_2637:
	edge8n	%g2,	%l4,	%l3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xAF8, 	%hsys_tick_cmpr changed by convert2hboot
	nop
	setx	0x1233,	%l0,	%i6
	udiv	%g1,	%i6,	%o7
loop_2638:
	fnegs	%f8,	%f3
	nop 	! 	ta	%icc,	0x70 changed by convert2hboot
	fpadd16	%f20,	%f4,	%f28
	fcmpd	%fcc0,	%f12,	%f24
	add	%o6,	0x13F9,	%l0
	nop 	! 	tg	%xcc,	0x73 changed by convert2hboot
	call	loop_2639
	call	loop_2640
	call	loop_2641
	fbo,a	%fcc2,	loop_2642
loop_2639:
	call	loop_2643
loop_2640:
	movvc	%icc,	0x356,	%i3
loop_2641:
	nop 	! 	tge	%icc,	0x6e changed by convert2hboot
loop_2642:
	call	loop_2644
loop_2643:
	edge16	%o3,	%o2,	%i5
	rd	%sys_tick_cmpr,	%i2
	call	loop_2645
loop_2644:
	call	loop_2646
	array8	%o5,	%i4,	%l5
	movu	%fcc3,	0x478,	%l1
loop_2645:
	edge8	%l6,	%i1,	%l2
loop_2646:
	call	loop_2647
	nop 	! 	tge	%icc,	0x51 changed by convert2hboot
	ba	%xcc,	loop_2648
	addc	%o4,	%o0,	%g3
loop_2647:
	fcmpd	%fcc2,	%f4,	%f0
	call	loop_2649
loop_2648:
	call	loop_2650
	movuge	%fcc3,	%g6,	%g5
	call	loop_2651
loop_2649:
	alignaddr	%o1,	%i0,	%g2
loop_2650:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x19,	%asi changed by convert2hboot
loop_2651:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	nop
	setx	loop_2652,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x002200001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	call	loop_2653
	fsrc2s	%f27,	%f6
	fmovrdgz	%g4,	%f18,	%f0
loop_2652:
	call	loop_2654
loop_2653:
	sdivx	%i7,	0x0A56,	%i6
	edge8n	%g1,	%o7,	%o6
	edge8ln	%l0,	%o3,	%i3
loop_2654:
	call	loop_2655
	call	loop_2656
	udiv	%i5,	0x1A1B,	%i2
	nop 	! 	tgu	%xcc,	0x40 changed by convert2hboot
loop_2655:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x10,	%asi changed by convert2hboot
	lda	[%l6] %asi,	%o2
loop_2656:
	call	loop_2657
	smulcc	%l5,	%i4,	%l6
	rd	%y,	%l1
	call	loop_2658
loop_2657:
	call	loop_2659
	smulcc	%l2,	0x1EB1,	%o4
	wrpr 	%g0, 	0x2, 	%gl
loop_2658:
	udiv	%g3,	0x1DF7,	%g6
loop_2659:
	call	loop_2660
	nop
	setx loop_2661, %l0, %l1
	jmpl %l1, %i1
	fba,a,pt	%fcc0,	loop_2662
	movue	%fcc2,	%o1,	%g5
loop_2660:
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%g2 changed by convert2hboot
loop_2661:
	brnz,a,pn	%i0,	loop_2663
loop_2662:
	fmovdgu	%xcc,	%f2,	%f2
	sth	%l4,	[%l7 + 0x7C]
	nop
	set	0x54, %o4
	sth	%g7,	[%l7 + %o4]
loop_2663:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x89,	%asi changed by convert2hboot
	nop
	set	0x68, %o2
	ldstub	[%l7 + %o2],	%i7
	call	loop_2664
	nop
	nop
	setx	0x204BE400,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	nop 	! 	tleu	%icc,	0x44 changed by convert2hboot
	nop 	! 	taddcc	%g4,	0x78,	%g1 changed by convert2hboot
loop_2664:
	wrpr	%i6,	%o6,	%cwp
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	addcc	%o3,	%i3,	%i5
	nop 	! 	rdpr	%tba,	%i2 changed by convert2hboot
	wrpr	%l0,	0x0226,	%pil
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr	%g0,	0x0,	%pcr	! 	wr 	%l0, 	0x966, 	%sys_tick_cmpr changed by convert2hboot
	edge32l	%i4,	%l6,	%l1
	call	loop_2665
	wrpr 	%g0, 	0x0, 	%gl
	call	loop_2666
	nop 	! 	rdhpr	%hpstate,	%o5 changed by convert2hboot
loop_2665:
	sdivcc	%o0,	0x10FB,	%o4
	nop 	! 	tn	%icc,	0x78 changed by convert2hboot
loop_2666:
	call	loop_2667
	movpos	%icc,	%g6,	%i1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x740, 	%hsys_tick_cmpr changed by convert2hboot
	call	loop_2668
loop_2667:
	call	loop_2669
	call	loop_2670
	nop 	! 	tl	%xcc,	0x63 changed by convert2hboot
loop_2668:
	edge32ln	%o1,	%g2,	%i0
loop_2669:
	edge8ln	%g5,	%l4,	%g7
loop_2670:
	bne,a,pn	%icc,	loop_2671
	nop 	! 	ta	%icc,	0x48 changed by convert2hboot
	xor	%i7,	%g4,	%g1
	call	loop_2672
loop_2671:
	call	loop_2673
	call	loop_2674
	call	loop_2675
loop_2672:
	movpos	%icc,	%i6,	%l3
loop_2673:
	nop 	! 	rdhpr	%hintp,	%o6 changed by convert2hboot
loop_2674:
	move	%fcc2,	0x4BB,	%o3
loop_2675:
	call	loop_2676
	sdivx	%o7,	0x11DB,	%i5
	call	loop_2677
	rd	%sys_tick_cmpr,	%i2
loop_2676:
	nop
	setx loop_2678, %l0, %l1
	jmpl %l1, %l0
	sdivx	%i3,	0x0C8A,	%o2
loop_2677:
	call	loop_2679
	brgz	%l5,	loop_2680
loop_2678:
	wr	%g0,	0x0,	%pcr	! 	wr	%l6,	%l1,	%softint changed by convert2hboot
	call	loop_2681
loop_2679:
loop_2680:
	wrpr	%l2,	%i4,	%pil
	fmovde	%fcc3,	%f18,	%f16
loop_2681:
	call	loop_2682
	wrpr	%o5,	0x0FDD,	%pil
	call	loop_2683
	bn	%xcc,	loop_2684
loop_2682:
	ba,a,pt	%xcc,	loop_2685
	nop 	! 	ta	%xcc,	0x5f changed by convert2hboot
loop_2683:
	nop 	! 	taddcc	%o4,	0x57,	%g6 changed by convert2hboot
loop_2684:
	movuge	%fcc3,	0x3D4,	%i1
loop_2685:
	call	loop_2686
	movvs	%icc,	0x52A,	%o0
	sethi	0x18E8,	%o1
	edge16	%g3,	%g2,	%g5
loop_2686:
	movn	%fcc0,	0x324,	%i0
	movrgz	%l4,	0x3CF,	%g7
	call	loop_2687
	edge16ln	%g4,	%i7,	%i6
	xor	%l3,	0x00F8,	%g1
	nop 	! 	te	%xcc,	0x57 changed by convert2hboot
loop_2687:
	fpadd32s	%f10,	%f21,	%f0
	fornot2	%f4,	%f22,	%f22
	call	loop_2688
	nop
	setx	0x0FD7,	%l0,	%o7
	sdivx	%o6,	%o7,	%o3
	call	loop_2689
	nop 	! 	tcs	%xcc,	0x6e changed by convert2hboot
loop_2688:
	movue	%fcc3,	0x260,	%i5
	edge8	%l0,	%i3,	%o2
loop_2689:
	call	loop_2690
	call	loop_2691
	srl	%i2,	0x15,	%l5
	nop 	! 	taddcc	%l1,	0x62,	%l6 changed by convert2hboot
loop_2690:
	sdivx	%i4,	0x16B9,	%o5
loop_2691:
	bgu,a	%xcc,	loop_2692
	nop 	! 	tpos	%xcc,	0x55 changed by convert2hboot
	fbo	%fcc0,	loop_2693
	xnorcc	%o4,	%l2,	%i1
loop_2692:
	movgu	%xcc,	%g6,	%o1
	rd	%softint,	%g3
loop_2693:
	call	loop_2694
	call	loop_2695
	lduw	[%l7 + 0x68],	%g2
	call	loop_2696
loop_2694:
	call	loop_2697
loop_2695:
	movuge	%fcc3,	0x504,	%o0
	fcmpd	%fcc0,	%f2,	%f24
loop_2696:
	call	loop_2698
loop_2697:
	call	loop_2699
	call	loop_2700
	call	loop_2701
loop_2698:
	nop 	! 	wrpr	%g5,	%l4,	%tick changed by convert2hboot
loop_2699:
	srlx	%i0,	0x13,	%g7
loop_2700:
	call	loop_2702
loop_2701:
	fmovsvs	%icc,	%f15,	%f21
	call	loop_2703
	fnegs	%f7,	%f5
loop_2702:
	movn	%fcc3,	0x0EC,	%i7
	or	%i6,	0x058D,	%l3
loop_2703:
	edge16	%g1,	%o6,	%g4
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x81,	%asi changed by convert2hboot
	sta	%f19,	[%l7 + 0x7C] %asi
	call	loop_2704
	movn	%fcc3,	%o3,	%o7
	nop 	! 	tne	%icc,	0x51 changed by convert2hboot
	call	loop_2705
loop_2704:
	movle	%fcc3,	0x77F,	%i5
	xorcc	%l0,	%o2,	%i2
loop_2705:
	call	loop_2706
	nop 	! 	taddcc	%i3,	%l1,	%l5 changed by convert2hboot
	nop
	nop
	setx	0xB68D1820F1934259,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xC0F8E5BBA1C5D183,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f4,	%f22
	call	loop_2707
loop_2706:
	call	loop_2708
	umulcc	%i4,	%o5,	%o4
	call	loop_2709
loop_2707:
	call	loop_2710
loop_2708:
	bg,pn	%icc,	loop_2711
	fandnot1	%f0,	%f30,	%f26
loop_2709:
	nop 	! 	tsubcctv	%l2,	0x5a,	%l6 changed by convert2hboot
loop_2710:
	call	loop_2712
loop_2711:
	call	loop_2713
	call	loop_2714
	nop
	setx	loop_2715,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x002200001405,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_2712:
	and	%i1,	0x12B8,	%o1
loop_2713:
	fmovdlg	%fcc3,	%f16,	%f20
loop_2714:
	call	loop_2716
loop_2715:
	call	loop_2717
	movcs	%icc,	%g6,	%g3
	call	loop_2718
loop_2716:
	call	loop_2719
loop_2717:
	orcc	%g2,	%o0,	%g5
	ldd	[%l7 + 0x30],	%f16
loop_2718:
	call	loop_2720
loop_2719:
	call	loop_2721
	call	loop_2722
	call	loop_2723
loop_2720:
	fbn,pn	%fcc1,	loop_2724
loop_2721:
	fmovdpos	%xcc,	%f22,	%f26
loop_2722:
	fmovsl	%fcc2,	%f24,	%f8
loop_2723:
	call	loop_2725
loop_2724:
	xorcc	%i0,	0x0B5F,	%l4
	call	loop_2726
	edge32	%g7,	%i7,	%l3
loop_2725:
	fnot2s	%f17,	%f23
	fcmpne32	%f24,	%f22,	%i6
loop_2726:
	nop
	setx	0x19D7,	%l0,	%g1
	udiv	%o6,	%g1,	%o3
	nop 	! 	tn	%icc,	0x5b changed by convert2hboot
	fmovrdgz	%o7,	%f10,	%f24
	call	loop_2727
	nop 	! 	rdhpr	%ver,	%i5 changed by convert2hboot
	call	loop_2728
	movue	%fcc2,	%l0,	%g4
loop_2727:
	nop 	! 	te	%icc,	0x66 changed by convert2hboot
	call	loop_2729
loop_2728:
	call	loop_2730
	rdpr	%otherwin,	%i2
	edge16l	%i3,	%l1,	%o2
loop_2729:
	bg,a	%xcc,	loop_2731
loop_2730:
	call	loop_2732
	movgu	%icc,	0x19F,	%i4
	movuge	%fcc2,	0x460,	%l5
loop_2731:
	nop 	! 	ta	%icc,	0x43 changed by convert2hboot
loop_2732:
	movcs	%icc,	0x1E9,	%o5
	fmul8x16al	%f10,	%f15,	%f28
	call	loop_2733
	array32	%l2,	%o4,	%i1
	movuge	%fcc2,	%l6,	%o1
	fmovdug	%fcc3,	%f30,	%f8
loop_2733:
	brlz,a,pn	%g6,	loop_2734
	call	loop_2735
	movpos	%xcc,	%g3,	%g2
	nop 	! 	tl	%xcc,	0x75 changed by convert2hboot
loop_2734:
	nop
	set	0x5A, %g2
	sth	%g5,	[%l7 + %g2]
loop_2735:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xBAC, 	%hsys_tick_cmpr changed by convert2hboot
	fands	%f27,	%f1,	%f16
	call	loop_2736
	call	loop_2737
	call	loop_2738
	addc	%l4,	%i7,	%l3
loop_2736:
	call	loop_2739
loop_2737:
	call	loop_2740
loop_2738:
	wrpr	%g7,	%o6,	%pil
	fbge,a	%fcc3,	loop_2741
loop_2739:
	movrne	%g1,	%i6,	%o3
loop_2740:
	nop 	! 	tcc	%icc,	0x3b changed by convert2hboot
	movule	%fcc3,	%i5,	%l0
loop_2741:
	fandnot2	%f22,	%f8,	%f12
	call	loop_2742
	nop 	! 	tpos	%xcc,	0x37 changed by convert2hboot
	sra	%g4,	%o7,	%i2
	fbule,a	%fcc1,	loop_2743
loop_2742:
	call	loop_2744
	call	loop_2745
	nop
	set	0x58, %l0
	stx	%l1,	[%l7 + %l0]
loop_2743:
	nop 	! 	rdhpr	%hintp,	%o2 changed by convert2hboot
loop_2744:
	bmask	%i4,	%l5,	%i3
loop_2745:
	movre	%o5,	%o4,	%l2
	edge32ln	%l6,	%o1,	%i1
	call	loop_2746
	edge8n	%g6,	%g3,	%g2
	call	loop_2747
	fmovsgu	%icc,	%f26,	%f7
loop_2746:
	call	loop_2748
	wr	%g0,	0x0,	%pcr	! 	wr	%g5,	0x128A,	%pic changed by convert2hboot
loop_2747:
	call	loop_2749
	call	loop_2750
loop_2748:
	call	loop_2751
	bneg,a	%xcc,	loop_2752
loop_2749:
	call	loop_2753
loop_2750:
	movrne	%o0,	%i0,	%l4
loop_2751:
	fba,a	%fcc2,	loop_2754
loop_2752:
	call	loop_2755
loop_2753:
	call	loop_2756
	fcmpes	%fcc3,	%f26,	%f3
loop_2754:
	alignaddr	%l3,	%g7,	%i7
loop_2755:
	addccc	%o6,	%i6,	%g1
loop_2756:
	movl	%icc,	%o3,	%i5
	fmul8sux16	%f8,	%f10,	%f20
	nop 	! 	tsubcc	%g4,	%o7,	%i2 changed by convert2hboot
	fandnot1s	%f5,	%f9,	%f29
	bvc,a,pt	%icc,	loop_2757
	array8	%l0,	%l1,	%o2
	movu	%fcc3,	%i4,	%l5
	edge16l	%o5,	%o4,	%i3
loop_2757:
	nop 	! 	tcc	%xcc,	0x6b changed by convert2hboot
	fbl,a	%fcc0,	loop_2758
	nop 	! 	tpos	%icc,	0x3b changed by convert2hboot
	movl	%xcc,	%l2,	%o1
	call	loop_2759
loop_2758:
	nop 	! 	tg	%xcc,	0x48 changed by convert2hboot
	ld	[%l7 + 0x5C],	%f11
	bpos	%icc,	loop_2760
loop_2759:
	call	loop_2761
	nop
	set	0x24, %g5
	swap	[%l7 + %g5],	%i1
	brlz	%l6,	loop_2762
loop_2760:
	fmovdl	%fcc3,	%f8,	%f2
loop_2761:
	call	loop_2763
	call	loop_2764
loop_2762:
	nop 	! 	tvc	%xcc,	0x64 changed by convert2hboot
	alignaddr	%g3,	%g2,	%g5
loop_2763:
	fpadd16s	%f2,	%f28,	%f15
loop_2764:
	fnegs	%f31,	%f28
	movvs	%icc,	0x6E4,	%g6
	bcc,pn	%xcc,	loop_2765
	call	loop_2766
	call	loop_2767
	nop 	! 	tge	%xcc,	0x69 changed by convert2hboot
loop_2765:
	brgz,a	%o0,	loop_2768
loop_2766:
	nop 	! 	taddcc	%l4,	%l3,	%g7 changed by convert2hboot
loop_2767:
	fexpand	%f14,	%f12
	wrpr	%i0,	%i7,	%pil
loop_2768:
	call	loop_2769
	fmovsuge	%fcc2,	%f17,	%f21
	movvc	%icc,	0x7F8,	%o6
	movrgz	%g1,	0x2E1,	%o3
loop_2769:
	mulx	%i6,	%i5,	%o7
	fmovdule	%fcc0,	%f14,	%f22
	nop
	nop
	setx	0x47EDB36F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x4B6A1189,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f5,	%f16
	nop 	! 	tl	%icc,	0x67 changed by convert2hboot
	call	loop_2770
	mova	%xcc,	%g4,	%i2
	call	loop_2771
	call	loop_2772
loop_2770:
	fmovdle	%icc,	%f0,	%f22
	call	loop_2773
loop_2771:
	nop 	! 	taddcc	%l1,	%o2,	%i4 changed by convert2hboot
loop_2772:
	call	loop_2774
	edge32n	%l0,	%l5,	%o4
loop_2773:
	call	loop_2775
	add	%i3,	%o5,	%o1
loop_2774:
	nop
	setx	0x1F1A,	%l0,	%l2
	sdivcc	%i1,	%l2,	%l6
	call	loop_2776
loop_2775:
	fbue,a	%fcc3,	loop_2777
	call	loop_2778
	call	loop_2779
loop_2776:
	fcmpes	%fcc0,	%f18,	%f3
loop_2777:
	call	loop_2780
loop_2778:
	xor	%g3,	0x1D0F,	%g5
loop_2779:
	move	%fcc1,	%g6,	%g2
	brgez,pn	%l4,	loop_2781
loop_2780:
	fbne,a	%fcc1,	loop_2782
	rdpr	%otherwin,	%l3
	call	loop_2783
loop_2781:
	mova	%fcc0,	%o0,	%i0
loop_2782:
	movvs	%icc,	0x636,	%g7
	rd	%ccr,	%i7
loop_2783:
	fxor	%f14,	%f6,	%f4
	nop 	! 	tge	%icc,	0x6d changed by convert2hboot
	movrgz	%g1,	0x1BE,	%o6
	set	0x30, %i7
	nop	 ! 	ldda	[%l7 + %i7] 0x89,	%i6 ASI use replaced by convert2hboot
	brlz	%i5,	loop_2784
	call	loop_2785
	call	loop_2786
	call	loop_2787
loop_2784:
	addc	%o7,	0x0964,	%o3
loop_2785:
	udivx	%g4,	0x0DFD,	%l1
loop_2786:
	nop 	! 	taddcc	%o2,	0x36,	%i4 changed by convert2hboot
loop_2787:
	fmovs	%f20,	%f31
	movneg	%icc,	0x196,	%l0
	mova	%fcc2,	0x67A,	%i2
	fmovsue	%fcc3,	%f25,	%f1
	nop
	nop
	setx	0x9A01DD33,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x6E2F8D5E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f30,	%f20
	sll	%l5,	0x04,	%i3
	movo	%fcc3,	%o4,	%o5
	call	loop_2788
	fblg,pn	%fcc3,	loop_2789
	nop 	! 	tsubcctv	%i1,	%l2,	%o1 changed by convert2hboot
	call	loop_2790
loop_2788:
	rdpr	%gl,	%l6
loop_2789:
	fbg,pn	%fcc2,	loop_2791
	nop 	! 	tvc	%xcc,	0x3e changed by convert2hboot
loop_2790:
	call	loop_2792
	call	loop_2793
loop_2791:
	fmovrslz	%g3,	%f21,	%f16
	brgez,pn	%g5,	loop_2794
loop_2792:
	move	%fcc3,	0x304,	%g6
loop_2793:
	wrpr 	%g0, 	0x0, 	%gl
	wr	%g0,	0x0,	%pcr	! 	wr	%g2,	%i0,	%ccr changed by convert2hboot
loop_2794:
	wrpr	%o0,	0x123A,	%cwp
	call	loop_2795
	stb	%g7,	[%l7 + 0x7E]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xF12, 	%hsys_tick_cmpr changed by convert2hboot
	call	loop_2796
loop_2795:
	call	loop_2797
	fbug	%fcc3,	loop_2798
	srlx	%o6,	0x12,	%g1
loop_2796:
	edge8n	%i5,	%i6,	%o3
loop_2797:
	xor	%g4,	%o7,	%l1
loop_2798:
	rdpr	%otherwin,	%o2
	nop 	! 	tg	%xcc,	0x57 changed by convert2hboot
	nop 	! 	tcs	%xcc,	0x3f changed by convert2hboot
	call	loop_2799
	sra	%i4,	0x14,	%l0
	membar	0x79
	call	loop_2800
loop_2799:
	nop 	! 	tge	%icc,	0x3f changed by convert2hboot
	udivx	%l5,	0x0AD1,	%i3
	call	loop_2801
loop_2800:
	fbu,a,pn	%fcc1,	loop_2802
	xorcc	%i2,	0x0802,	%o5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x844, 	%hsys_tick_cmpr changed by convert2hboot
loop_2801:
	fmovdul	%fcc0,	%f8,	%f20
loop_2802:
	call	loop_2803
	sll	%l2,	0x04,	%i1
	movul	%fcc3,	0x271,	%l6
	nop
	setx	0x11D4,	%l0,	%g5
	udivcc	%o1,	%g5,	%g3
loop_2803:
	nop
	nop
	setx	0x9598AEC4FE52696A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xD28E28BACC0D5C7F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f14,	%f12
	mulx	%g6,	%l4,	%l3
	movule	%fcc3,	0x2A9,	%g2
	wr	%g0,	0x0,	%pcr	! 	wr	%i0,	0x1AC4,	%clear_softint changed by convert2hboot
	fnegs	%f28,	%f11
	nop 	! 	tn	%icc,	0x61 changed by convert2hboot
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%g6
	call	loop_2804
	call	loop_2805
	umul	%o0,	0x1506,	%i7
	call	loop_2806
loop_2804:
	faligndata	%f20,	%f2,	%f0
loop_2805:
	movue	%fcc2,	%o6,	%i5
	nop 	! 	tvc	%xcc,	0x47 changed by convert2hboot
loop_2806:
	movneg	%icc,	0x024,	%i6
	movrgez	%o3,	0x2E7,	%g1
	call	loop_2807
	smulcc	%o7,	%l1,	%g4
	wrpr	%i4,	%o2,	%pil
	call	loop_2808
loop_2807:
	nop 	! 	tneg	%xcc,	0x7c changed by convert2hboot
	fmovrdlz	%l5,	%f28,	%f20
	andn	%i3,	0x118B,	%l0
loop_2808:
	call	loop_2809
	movrgez	%o5,	0x0B0,	%o4
	call	loop_2810
	andcc	%i2,	0x11E9,	%i1
loop_2809:
	call	loop_2811
	brz,pt	%l6,	loop_2812
loop_2810:
	add	%l2,	%o1,	%g3
	fbo,a	%fcc2,	loop_2813
loop_2811:
	call	loop_2814
loop_2812:
	nop
	set	0x64, %o5
	lduw	[%l7 + %o5],	%g6
	rdpr	%cleanwin,	%g5
loop_2813:
	movo	%fcc3,	0x3E4,	%l4
loop_2814:
	call	loop_2815
	call	loop_2816
	membar	0x09
	movn	%fcc0,	0x6AA,	%l3
loop_2815:
	srl	%i0,	%g7,	%g2
loop_2816:
	bge	%xcc,	loop_2817
	call	loop_2818
	nop 	! 	tsubcctv	%i7,	%o6,	%i5 changed by convert2hboot
	movul	%fcc2,	%o0,	%i6
loop_2817:
	rd	%tick_cmpr,	%o3
loop_2818:
	call	loop_2819
	call	loop_2820
	fornot1s	%f4,	%f29,	%f12
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_2819:
	umul	%g1,	0x18E6,	%l1
loop_2820:
	nop 	! 	te	%icc,	0x39 changed by convert2hboot
	nop
	fitod	%f13,	%f26
	movl	%fcc0,	%o7,	%i4
	call	loop_2821
	call	loop_2822
	alignaddr	%o2,	%g4,	%i3
	add	%l0,	%o5,	%l5
loop_2821:
	rd	%softint,	%i2
loop_2822:
	nop 	! 	tle	%xcc,	0x39 changed by convert2hboot
	fcmpeq32	%f4,	%f30,	%i1
	wrpr 	%g0, 	0x1, 	%gl
	brgz,a,pn	%o1,	loop_2823
	wrpr	%g3,	0x1682,	%pil
	rdpr	%otherwin,	%g6
	fexpand	%f28,	%f2
loop_2823:
	fbug,a,pn	%fcc2,	loop_2824
	fmovsn	%fcc1,	%f6,	%f17
	call	loop_2825
	call	loop_2826
loop_2824:
	movrgez	%l6,	0x201,	%l4
	call	loop_2827
loop_2825:
	movule	%fcc1,	0x292,	%g5
loop_2826:
	call	loop_2828
	call	loop_2829
loop_2827:
	andncc	%i0,	0x0772,	%g7
	call	loop_2830
loop_2828:
	fmovsn	%fcc3,	%f13,	%f7
loop_2829:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x27,	%asi changed by convert2hboot
	membar	#Sync
loop_2830:
	mulx	%g2,	%i7,	%i5
	edge32l	%o6,	%i6,	%o3
	call	loop_2831
	fornot2	%f30,	%f10,	%f26
	call	loop_2832
	nop
	fitos	%f11,	%f1
	fstoi	%f1,	%f13
loop_2831:
	edge8l	%o0,	%l1,	%g1
	bge,pt	%xcc,	loop_2833
loop_2832:
	fbue,a	%fcc1,	loop_2834
	fbl,pn	%fcc2,	loop_2835
	call	loop_2836
loop_2833:
	fnot2s	%f17,	%f30
loop_2834:
	call	loop_2837
loop_2835:
	nop
	nop
	setx	0xFB78F91177D7E42D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x7EA73D4CEC9C6529,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f10,	%f26
loop_2836:
	call	loop_2838
	fmovdg	%fcc0,	%f28,	%f22
loop_2837:
	fnot2s	%f23,	%f11
	call	loop_2839
loop_2838:
	brgez,a,pt	%i4,	loop_2840
	nop
	set	0x1B, %i4
	ldsb	[%l7 + %i4],	%o2
	call	loop_2841
loop_2839:
	fcmpne16	%f14,	%f26,	%o7
loop_2840:
	sdiv	%i3,	0x06F2,	%g4
	call	loop_2842
loop_2841:
	call	loop_2843
	nop	!	sir	0x1400 !! sir is illegal now
	call	loop_2844
loop_2842:
	rdpr	%canrestore,	%o5
loop_2843:
	alignaddrl	%l5,	%i2,	%l0
	rd	%tick_cmpr,	%i1
loop_2844:
	fornot1s	%f11,	%f20,	%f15
	movn	%icc,	0x6EE,	%l2
	sra	%o1,	%o4,	%g6
	movre	%l6,	0x3D1,	%l4
	call	loop_2845
	movne	%fcc1,	%g3,	%g5
	nop 	! 	tsubcctv	%g7,	0x5c,	%i0 changed by convert2hboot
	udivcc	%l3,	0x0B7E,	%g2
loop_2845:
	call	loop_2846
	call	loop_2847
	xnor	%i7,	0x0F12,	%i5
	call	loop_2848
loop_2846:
	nop 	! 	tsubcc	%o6,	%i6,	%o3 changed by convert2hboot
loop_2847:
	call	loop_2849
	brgez,pn	%o0,	loop_2850
loop_2848:
	movl	%xcc,	0x64E,	%g1
	call	loop_2851
loop_2849:
	fmovrslz	%l1,	%f14,	%f22
loop_2850:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xE31, 	%hsys_tick_cmpr changed by convert2hboot
	bneg	%icc,	loop_2852
loop_2851:
	call	loop_2853
	sth	%i3,	[%l7 + 0x76]
	nop 	! 	tvs	%xcc,	0x4d changed by convert2hboot
loop_2852:
	array16	%g4,	%o2,	%o5
loop_2853:
	nop 	! 	tl	%icc,	0x35 changed by convert2hboot
	call	loop_2854
	call	loop_2855
	call	loop_2856
	nop
	set	0x7C, %l5
	prefetch	[%l7 + %l5],	 3
loop_2854:
	movrlez	%i2,	0x3FD,	%l0
loop_2855:
	nop 	! 	rdhpr	%htba,	%l5 changed by convert2hboot
loop_2856:
	nop 	! 	tcs	%icc,	0x4c changed by convert2hboot
	brlz,a,pt	%l2,	loop_2857
	bvs,pn	%icc,	loop_2858
	and	%o1,	%o4,	%i1
	edge8l	%l6,	%g6,	%l4
loop_2857:
	nop
	set	0x0D, %l6
	ldub	[%l7 + %l6],	%g5
loop_2858:
	call	loop_2859
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x7, 	%fprs changed by convert2hboot
	sth	%l3,	[%l7 + 0x5A]
	fpsub32	%f16,	%f30,	%f4
loop_2859:
	fsrc2s	%f18,	%f21
	call	loop_2860
	ldd	[%l7 + 0x40],	%f10
	fcmpgt16	%f30,	%f6,	%g2
	set	0x18, %g3
	nop	 ! 	swapa	[%l7 + %g3] 0x88,	%i0 ASI use replaced by convert2hboot
loop_2860:
	array32	%i7,	%o6,	%i6
	srax	%o3,	0x10,	%i5
	ldd	[%l7 + 0x60],	%f8
	movne	%fcc2,	%g1,	%o0
	edge32n	%l1,	%i4,	%i3
	call	loop_2861
	flushw
	umul	%o7,	%o2,	%g4
	fpsub16s	%f31,	%f15,	%f3
loop_2861:
	call	loop_2862
	movge	%xcc,	0x7AD,	%i2
	movrgz	%o5,	%l0,	%l5
	call	loop_2863
loop_2862:
	call	loop_2864
	call	loop_2865
	array8	%l2,	%o4,	%i1
loop_2863:
	call	loop_2866
loop_2864:
	call	loop_2867
loop_2865:
	call	loop_2868
	wr	%g0,	0x0,	%pcr	! 	wr	%o1,	0x0795,	%set_softint changed by convert2hboot
loop_2866:
	call	loop_2869
loop_2867:
	nop 	! 	tsubcc	%g6,	0x75,	%l6 changed by convert2hboot
loop_2868:
	nop
	setx	loop_2870,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x002100001401,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	call	loop_2871
loop_2869:
	fmovdne	%xcc,	%f6,	%f12
	call	loop_2872
loop_2870:
	call	loop_2873
loop_2871:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	array32	%g5,	%g7,	%l4
loop_2872:
	call	loop_2874
loop_2873:
	brgez,pt	%g3,	loop_2875
	call	loop_2876
	fbuge,a,pt	%fcc0,	loop_2877
loop_2874:
	wr	%g0,	0x0,	%pcr	! 	wr	%g2,	0x1E35,	%set_softint changed by convert2hboot
loop_2875:
	or	%l3,	%i0,	%i7
loop_2876:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x10,	%asi changed by convert2hboot
	nop	 ! 	casxa	[%l6] 0x10,	%o6,	%o3 ASI use replaced by convert2hboot
loop_2877:
	call	loop_2878
	fmovdge	%fcc1,	%f10,	%f10
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x18,	%asi changed by convert2hboot
loop_2878:
	call	loop_2879
	call	loop_2880
	brlz,a,pt	%g1,	loop_2881
	nop 	! 	tle	%xcc,	0x7b changed by convert2hboot
loop_2879:
	fba,a	%fcc2,	loop_2882
loop_2880:
	fmovscs	%icc,	%f13,	%f10
loop_2881:
	call	loop_2883
	nop
	nop
	setx	0xF30ED5D7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x4B0F1B0A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f23,	%f21
loop_2882:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x18,	%asi changed by convert2hboot
loop_2883:
	nop 	! 	tsubcc	%l1,	0x44,	%i5 changed by convert2hboot
	call	loop_2884
	fbe,a,pn	%fcc3,	loop_2885
	movue	%fcc2,	0x135,	%i3
	subc	%i4,	%o2,	%o7
loop_2884:
	orcc	%g4,	%o5,	%l0
loop_2885:
	fmovrsne	%l5,	%f0,	%f26
	edge32l	%i2,	%l2,	%o4
	call	loop_2886
	fbe,a	%fcc2,	loop_2887
	nop
	nop
	setx	0xD056EC00,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	call	loop_2888
loop_2886:
	bvs,a	%xcc,	loop_2889
loop_2887:
	andncc	%o1,	0x114C,	%i1
	movrlz	%g6,	%g5,	%g7
loop_2888:
	call	loop_2890
loop_2889:
	movrne	%l4,	%l6,	%g2
	or	%l3,	0x1099,	%i0
	call	loop_2891
loop_2890:
	call	loop_2892
	stb	%i7,	[%l7 + 0x3B]
	wrpr	%o6,	0x18F8,	%pil
loop_2891:
	call	loop_2893
loop_2892:
	fmovsvc	%xcc,	%f8,	%f19
	nop 	! 	tcs	%icc,	0x5f changed by convert2hboot
	fbug,a	%fcc2,	loop_2894
loop_2893:
	nop 	! 	rdhpr	%ver,	%g3 changed by convert2hboot
	fzeros	%f17
	call	loop_2895
loop_2894:
	wr	%g0,	0x0,	%pcr	! 	wr	%i6,	%g1,	%set_softint changed by convert2hboot
	bmask	%o3,	%l1,	%i5
	call	loop_2896
loop_2895:
	nop 	! 	tneg	%icc,	0x5e changed by convert2hboot
	call	loop_2897
	call	loop_2898
loop_2896:
	movrne	%o0,	0x223,	%i4
	fornot2s	%f26,	%f29,	%f0
loop_2897:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_2898:
	nop 	! 	tvc	%xcc,	0x35 changed by convert2hboot
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	orcc	%o2,	0x0E24,	%i3
	fmovsvc	%xcc,	%f9,	%f23
	nop 	! 	tsubcc	%o7,	%o5,	%l0 changed by convert2hboot
	alignaddrl	%g4,	%i2,	%l5
	be,a	%xcc,	loop_2899
	membar	0x1D
	mulx	%l2,	%o1,	%i1
	call	loop_2900
loop_2899:
	call	loop_2901
	nop 	! 	tl	%icc,	0x3e changed by convert2hboot
	call	loop_2902
loop_2900:
	membar	0x29
loop_2901:
	fbg	%fcc1,	loop_2903
	call	loop_2904
loop_2902:
	alignaddrl	%g6,	%o4,	%g5
	swap	[%l7 + 0x08],	%l4
loop_2903:
	lduh	[%l7 + 0x20],	%l6
loop_2904:
	nop
	set	0x34, %g4
	lda	[%l7 + %g4] 0x10,	%f14
	rd	%softint,	%g7
	mulx	%l3,	0x161F,	%g2
	bvs	%xcc,	loop_2905
	call	loop_2906
	call	loop_2907
	sdivx	%i7,	0x0E28,	%o6
loop_2905:
	srlx	%i0,	%i6,	%g1
loop_2906:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x0c,	%asi changed by convert2hboot
loop_2907:
	call	loop_2908
	bg,pt	%icc,	loop_2909
	fmovsn	%fcc0,	%f19,	%f14
	rd	%ccr,	%l1
loop_2908:
	call	loop_2910
loop_2909:
	call	loop_2911
	nop 	! 	rdhpr	%ver,	%i5 changed by convert2hboot
	call	loop_2912
loop_2910:
	subc	%o0,	%i4,	%o2
loop_2911:
	call	loop_2913
	fmovrdlez	%i3,	%f8,	%f30
loop_2912:
	rd	%asi,	%g3
	call	loop_2914
loop_2913:
	umul	%o7,	%o5,	%l0
	call	loop_2915
	call	loop_2916
loop_2914:
	call	loop_2917
	call	loop_2918
loop_2915:
	brz,pn	%g4,	loop_2919
loop_2916:
	call	loop_2920
loop_2917:
	edge16ln	%i2,	%l2,	%o1
loop_2918:
	call	loop_2921
loop_2919:
	array8	%l5,	%g6,	%i1
loop_2920:
	call	loop_2922
	call	loop_2923
loop_2921:
	sdivcc	%g5,	0x12B1,	%o4
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_2922:
	nop 	! 	tle	%icc,	0x79 changed by convert2hboot
loop_2923:
	alignaddrl	%l4,	%l6,	%g7
	subccc	%l3,	0x0254,	%i7
	fmovsgu	%xcc,	%f28,	%f0
	call	loop_2924
	srlx	%g2,	0x16,	%o6
	fxors	%f24,	%f5,	%f30
	fnegs	%f31,	%f17
loop_2924:
	nop 	! 	tl	%xcc,	0x61 changed by convert2hboot
	fbue	%fcc1,	loop_2925
	call	loop_2926
	nop 	! 	tcs	%icc,	0x5e changed by convert2hboot
	bmask	%i0,	%i6,	%o3
loop_2925:
	rdpr	%otherwin,	%g1
loop_2926:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x0c,	%asi changed by convert2hboot
	rdpr	%cansave,	%o0
	fnot1	%f10,	%f12
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x5, 	%fprs changed by convert2hboot
	edge16l	%i4,	%o7,	%l0
	call	loop_2927
	call	loop_2928
	rd	%asi,	%g4
	call	loop_2929
loop_2927:
	xorcc	%i2,	%o5,	%o1
loop_2928:
	call	loop_2930
	call	loop_2931
loop_2929:
	movo	%fcc2,	%l5,	%g6
	call	loop_2932
loop_2930:
	nop 	! 	tne	%icc,	0x75 changed by convert2hboot
loop_2931:
	call	loop_2933
	fmovsuge	%fcc0,	%f23,	%f21
loop_2932:
	sllx	%i1,	%l2,	%o4
	nop
	fitod	%f0,	%f20
	fdtox	%f20,	%f4
loop_2933:
	movvs	%icc,	0x427,	%l4
	set	0x70, %o1
	nop	 ! 	prefetcha	[%l7 + %o1] 0x11,	 0 ASI use replaced by convert2hboot
	call	loop_2934
	smul	%g5,	%l3,	%g7
	call	loop_2935
	andn	%g2,	%i7,	%o6
loop_2934:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0xda,	%asi changed by convert2hboot
loop_2935:
	call	loop_2936
	xorcc	%i6,	0x0E15,	%i0
	fmovrsgz	%g1,	%f2,	%f27
	rdpr	%pil,	%l1
loop_2936:
	call	loop_2937
	call	loop_2938
	movre	%o3,	0x257,	%o0
	edge8	%o2,	%i5,	%g3
loop_2937:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_2938:
	flushw
	bneg,a	%xcc,	loop_2939
	nop 	! 	tg	%icc,	0x5a changed by convert2hboot
	fbl,a	%fcc2,	loop_2940
	call	loop_2941
loop_2939:
	nop 	! 	rdhpr	%hpstate,	%i4 changed by convert2hboot
	nop 	! 	rdhpr	%htba,	%o7 changed by convert2hboot
loop_2940:
	call	loop_2942
loop_2941:
	andcc	%i3,	%g4,	%i2
	call	loop_2943
	call	loop_2944
loop_2942:
	edge16l	%l0,	%o5,	%l5
	call	loop_2945
loop_2943:
	call	loop_2946
loop_2944:
	edge8	%g6,	%i1,	%l2
	call	loop_2947
loop_2945:
	nop 	! 	tpos	%xcc,	0x58 changed by convert2hboot
loop_2946:
	call	loop_2948
	call	loop_2949
loop_2947:
	rdpr	%cwp,	%o1
	call	loop_2950
loop_2948:
	movug	%fcc3,	%o4,	%l4
loop_2949:
	movneg	%xcc,	0x249,	%l6
	call	loop_2951
loop_2950:
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x7, 	%fprs changed by convert2hboot
	call	loop_2952
	call	loop_2953
loop_2951:
	call	loop_2954
	nop
	set	0x78, %l2
	ldstub	[%l7 + %l2],	%g5
loop_2952:
	bg,a,pn	%icc,	loop_2955
loop_2953:
loop_2954:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x19,	%asi changed by convert2hboot
loop_2955:
	smul	%o6,	%i6,	%i0
	call	loop_2956
	call	loop_2957
	fpadd16s	%f5,	%f0,	%f20
	movle	%xcc,	0x55B,	%g1
loop_2956:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xA78, 	%hsys_tick_cmpr changed by convert2hboot
loop_2957:
	movrlz	%o3,	%o0,	%o2
	fbu,a	%fcc1,	loop_2958
	ldstub	[%l7 + 0x12],	%i5
	call	loop_2959
	mova	%fcc1,	%g3,	%i4
loop_2958:
	xnor	%o7,	%i3,	%g4
	call	loop_2960
loop_2959:
	call	loop_2961
	call	loop_2962
	call	loop_2963
loop_2960:
	fmovdu	%fcc3,	%f20,	%f26
loop_2961:
	call	loop_2964
loop_2962:
	call	loop_2965
loop_2963:
	movcs	%xcc,	0x67F,	%i7
	fnors	%f3,	%f0,	%f12
loop_2964:
	call	loop_2966
loop_2965:
	movvc	%xcc,	0x106,	%i2
	call	loop_2967
	edge8l	%o5,	%l0,	%g6
loop_2966:
	call	loop_2968
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x7, 	%fprs changed by convert2hboot
loop_2967:
	edge8	%i1,	%o1,	%l4
	nop 	! 	rdhpr	%hintp,	%l6 changed by convert2hboot
loop_2968:
	wrpr	%o4,	0x0216,	%cwp
	movle	%fcc1,	%g7,	%l3
	call	loop_2969
	udivx	%g2,	0x0672,	%g5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x438, 	%hsys_tick_cmpr changed by convert2hboot
	call	loop_2970
loop_2969:
	sdivx	%i6,	0x1793,	%g1
	nop
	set	0x28, %o3
	std	%o2,	[%l7 + %o3]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x6A5, 	%hsys_tick_cmpr changed by convert2hboot
loop_2970:
	edge8n	%o2,	%l1,	%g3
	smul	%i5,	%i4,	%i3
	nop
	nop
	setx	0xD3684848C657648C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x32AC3CBD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsmuld	%f8,	%f2,	%f10
	addc	%g4,	0x0F69,	%o7
	fpack32	%f24,	%f20,	%f20
	call	loop_2971
	call	loop_2972
	call	loop_2973
	fpadd16	%f22,	%f10,	%f30
loop_2971:
	call	loop_2974
loop_2972:
	udiv	%i7,	0x0F74,	%o5
loop_2973:
	bneg,a,pn	%icc,	loop_2975
	srl	%i2,	0x04,	%l0
loop_2974:
	brlez,pn	%g6,	loop_2976
	call	loop_2977
loop_2975:
	call	loop_2978
	movleu	%xcc,	%l5,	%l2
loop_2976:
	call	loop_2979
loop_2977:
	orcc	%o1,	%i1,	%l4
loop_2978:
	nop 	! 	rdhpr	%htba,	%l6 changed by convert2hboot
	nop
	fitod	%f31,	%f26
loop_2979:
	andn	%g7,	0x0E79,	%o4
	movn	%icc,	0x363,	%g2
	fmovdn	%fcc2,	%f14,	%f30
	membar	#Sync
	set	0x40, %l4
	nop	 ! 	ldda	[%l7 + %l4] 0x17,	%f0 ASI use replaced by convert2hboot
	popc	0x01A3,	%g5
	edge32n	%l3,	%o6,	%i0
	be,pt	%icc,	loop_2980
	movre	%i6,	%g1,	%o3
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f18
	bleu,a	%xcc,	loop_2981
loop_2980:
	call	loop_2982
	brlz	%o2,	loop_2983
	call	loop_2984
loop_2981:
	call	loop_2985
loop_2982:
	andncc	%o0,	%g3,	%i5
loop_2983:
	fblg,pn	%fcc0,	loop_2986
loop_2984:
	srax	%l1,	0x00,	%i4
loop_2985:
	subccc	%i3,	%g4,	%i7
	call	loop_2987
loop_2986:
	nop
	set	0x48, %l3
	sth	%o7,	[%l7 + %l3]
	or	%i2,	%l0,	%g6
	subcc	%l5,	%o5,	%o1
loop_2987:
	call	loop_2988
	nop
	setx	loop_2989,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x001400001401,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	call	loop_2990
	sllx	%l2,	%i1,	%l6
loop_2988:
	call	loop_2991
loop_2989:
	bne,a,pn	%xcc,	loop_2992
loop_2990:
	call	loop_2993
	call	loop_2994
loop_2991:
	bl	%icc,	loop_2995
loop_2992:
	nop
	nop
	setx	0x26CB9F7792C56F8E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f22
loop_2993:
	movrne	%g7,	%o4,	%g2
loop_2994:
	umulcc	%l4,	0x12F3,	%l3
loop_2995:
	fmul8sux16	%f12,	%f8,	%f14
	fsrc1s	%f31,	%f25
	call	loop_2996
	call	loop_2997
	mulscc	%g5,	0x1493,	%o6
	orncc	%i6,	%g1,	%i0
loop_2996:
	fmovsn	%icc,	%f2,	%f13
loop_2997:
	fandnot1	%f2,	%f24,	%f0
	nop 	! 	tn	%xcc,	0x7e changed by convert2hboot
	fblg,a,pn	%fcc2,	loop_2998
	addc	%o3,	0x1578,	%o2
	call	loop_2999
	call	loop_3000
loop_2998:
	ldsw	[%l7 + 0x6C],	%o0
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x81,	%asi changed by convert2hboot
loop_2999:
	call	loop_3001
loop_3000:
	call	loop_3002
	nop
	setx	loop_3003,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x021200001406,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	srlx	%l1,	%i5,	%i4
loop_3001:
	movleu	%icc,	0x32F,	%i3
loop_3002:
	ble,a	%icc,	loop_3004
loop_3003:
	fmovspos	%xcc,	%f9,	%f28
	call	loop_3005
	fones	%f27
loop_3004:
	array16	%i7,	%g4,	%o7
	nop 	! 	tsubcc	%l0,	0x77,	%i2 changed by convert2hboot
loop_3005:
	nop 	! 	rdhpr	%hintp,	%l5 changed by convert2hboot
	nop 	! 	wrpr	%o5,	0x1257,	%tick changed by convert2hboot
	movneg	%icc,	0x078,	%o1
	call	loop_3006
	call	loop_3007
	nop 	! 	tn	%icc,	0x6f changed by convert2hboot
	fornot1s	%f8,	%f3,	%f11
loop_3006:
	call	loop_3008
loop_3007:
	call	loop_3009
	fxnors	%f4,	%f28,	%f18
	subc	%g6,	%i1,	%l6
loop_3008:
	call	loop_3010
loop_3009:
	fbn,pn	%fcc0,	loop_3011
	wrpr	%g7,	%o4,	%cwp
	rdpr	%cwp,	%l2
loop_3010:
	movneg	%icc,	0x5D5,	%l4
loop_3011:
	fmovrdlez	%g2,	%f18,	%f12
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0xe3,	%asi changed by convert2hboot
	call	loop_3012
	nop 	! 	wrpr	%o6,	%i6,	%tick changed by convert2hboot
	edge32n	%g1,	%i0,	%o3
	sllx	%g5,	0x18,	%o0
loop_3012:
	call	loop_3013
	alignaddrl	%g3,	%l1,	%o2
	call	loop_3014
	nop
	setx	0x162F,	%l0,	%i4
	udivcc	%i5,	%i4,	%i7
loop_3013:
	nop 	! 	tleu	%xcc,	0x53 changed by convert2hboot
	movo	%fcc2,	0x241,	%g4
loop_3014:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xD85, 	%hsys_tick_cmpr changed by convert2hboot
	mova	%fcc0,	%i2,	%l5
	call	loop_3015
	fmovrsgz	%o5,	%f31,	%f31
	srlx	%o1,	0x02,	%g6
	movre	%l0,	%i1,	%g7
loop_3015:
	nop 	! 	rdhpr	%hintp,	%l6 changed by convert2hboot
	movvs	%icc,	0x36C,	%o4
	call	loop_3016
	nop
	fitod	%f8,	%f16
	fdtoi	%f16,	%f11
	call	loop_3017
	smul	%l4,	0x1233,	%l2
loop_3016:
	fbge,a	%fcc3,	loop_3018
	movge	%icc,	%l3,	%o6
loop_3017:
	call	loop_3019
	call	loop_3020
loop_3018:
	umul	%i6,	0x1EB3,	%g2
	call	loop_3021
loop_3019:
	sethi	0x1663,	%g1
loop_3020:
	call	loop_3022
	nop	!	sir	0x0545 !! sir is illegal now
loop_3021:
	call	loop_3023
	call	loop_3024
loop_3022:
	call	loop_3025
	subcc	%o3,	0x027F,	%g5
loop_3023:
	nop
	setx loop_3026, %l0, %l1
	jmpl %l1, %i0
loop_3024:
	fmovdge	%fcc1,	%f22,	%f2
loop_3025:
	rd	%pc,	%g3
	fmovrsgez	%l1,	%f28,	%f18
loop_3026:
	sllx	%o0,	%o2,	%i5
	addc	%i7,	0x0B94,	%g4
	nop 	! 	tgu	%xcc,	0x35 changed by convert2hboot
	add	%i4,	%i3,	%i2
	call	loop_3027
	fpadd32	%f12,	%f0,	%f30
	flushw
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr	%g0,	0x0,	%pcr	! 	wr 	%l0, 	%g0, 	%sys_tick_cmpr changed by convert2hboot
loop_3027:
	nop
	set	0x08, %o6
	ldstub	[%l7 + %o6],	%o5
	nop 	! 	tneg	%icc,	0x71 changed by convert2hboot
	fmovdul	%fcc2,	%f22,	%f2
	sth	%o1,	[%l7 + 0x7A]
	fnot2	%f6,	%f14
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xA72, 	%hsys_tick_cmpr changed by convert2hboot
	rd	%pc,	%l0
	fmovduge	%fcc3,	%f8,	%f0
	nop 	! 	tneg	%icc,	0x55 changed by convert2hboot
	call	loop_3028
	call	loop_3029
	rd	%fprs,	%g7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
loop_3028:
	mova	%xcc,	0x58B,	%i1
loop_3029:
	call	loop_3030
	nop 	! 	tsubcc	%l4,	0x4b,	%o4 changed by convert2hboot
	st	%f20,	[%l7 + 0x14]
	fones	%f2
loop_3030:
	call	loop_3031
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%l2
	call	loop_3032
	rd	%fprs,	%o6
loop_3031:
	fcmpd	%fcc1,	%f14,	%f26
	call	loop_3033
loop_3032:
	ba,pt	%icc,	loop_3034
	nop
	set	0x08, %g7
	ldsh	[%l7 + %g7],	%i6
	subc	%l3,	0x0669,	%g1
loop_3033:
	fbge,pn	%fcc3,	loop_3035
loop_3034:
	srl	%o3,	%g2,	%g5
	fnor	%f2,	%f14,	%f18
	mova	%xcc,	%g3,	%l1
loop_3035:
	movg	%fcc2,	%o0,	%i0
	fmovrdgz	%i5,	%f4,	%f16
	brlz,a,pt	%i7,	loop_3036
	call	loop_3037
	edge8	%g4,	%o2,	%i3
	movug	%fcc2,	0x3DD,	%i4
loop_3036:
	nop 	! 	tneg	%xcc,	0x5f changed by convert2hboot
loop_3037:
	call	loop_3038
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%l5 changed by convert2hboot
	addc	%o5,	0x19E6,	%o1
	sdivx	%g6,	0x1083,	%i2
loop_3038:
	nop 	! 	rdpr	%tba,	%l0 changed by convert2hboot
	movne	%fcc3,	%o7,	%g7
	call	loop_3039
	call	loop_3040
	bleu	%xcc,	loop_3041
	rdpr	%gl,	%i1
loop_3039:
	fmul8ulx16	%f18,	%f24,	%f18
loop_3040:
	xnor	%l4,	%l6,	%l2
loop_3041:
	orncc	%o6,	%o4,	%i6
	sra	%g1,	%o3,	%l3
	call	loop_3042
	call	loop_3043
	call	loop_3044
	fmovso	%fcc0,	%f4,	%f9
loop_3042:
	fands	%f7,	%f11,	%f28
loop_3043:
	fmul8ulx16	%f30,	%f8,	%f14
loop_3044:
	call	loop_3045
	fnands	%f3,	%f18,	%f28
	call	loop_3046
	call	loop_3047
loop_3045:
	mova	%xcc,	0x366,	%g2
	call	loop_3048
loop_3046:
	srax	%g5,	%l1,	%o0
loop_3047:
	call	loop_3049
	call	loop_3050
loop_3048:
	call	loop_3051
	movvs	%icc,	0x6AB,	%g3
loop_3049:
	mulscc	%i0,	0x0CE7,	%i7
loop_3050:
	call	loop_3052
loop_3051:
	bpos	%icc,	loop_3053
	fmovrslez	%i5,	%f27,	%f14
	call	loop_3054
loop_3052:
	call	loop_3055
loop_3053:
	call	loop_3056
	nop
	set	0x7C, %i1
	prefetch	[%l7 + %i1],	 2
loop_3054:
	orcc	%g4,	%o2,	%i4
loop_3055:
	fmovso	%fcc0,	%f28,	%f30
loop_3056:
	fnor	%f8,	%f2,	%f28
	movlg	%fcc1,	%i3,	%o5
	fbu	%fcc2,	loop_3057
	or	%o1,	%g6,	%l5
	call	loop_3058
	subcc	%l0,	0x0D0C,	%o7
loop_3057:
	call	loop_3059
	nop
	setx	0x0E4B,	%l0,	%g7
	udivx	%i2,	%g7,	%l4
loop_3058:
	nop 	! 	tsubcc	%i1,	0x54,	%l6 changed by convert2hboot
	fmovda	%fcc3,	%f6,	%f28
loop_3059:
	array32	%o6,	%o4,	%i6
	call	loop_3060
	bmask	%g1,	%o3,	%l2
	and	%l3,	0x159A,	%g2
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x21,	%asi changed by convert2hboot
loop_3060:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0xea,	%asi changed by convert2hboot
	membar	#Sync
	nop
	set	0x50, %i2
	std	%f24,	[%l7 + %i2]
	fmovspos	%icc,	%f0,	%f10
	popc	0x0639,	%o0
	fbug,a	%fcc2,	loop_3061
	call	loop_3062
	call	loop_3063
	nop 	! 	tcc	%icc,	0x68 changed by convert2hboot
loop_3061:
	movrgz	%g3,	0x12D,	%i0
loop_3062:
	nop 	! 	tleu	%icc,	0x61 changed by convert2hboot
loop_3063:
	movcs	%xcc,	0x15E,	%i5
	nop 	! 	tneg	%xcc,	0x62 changed by convert2hboot
	call	loop_3064
	call	loop_3065
	call	loop_3066
	call	loop_3067
loop_3064:
	xnorcc	%i7,	0x0AE5,	%o2
loop_3065:
	fbl,pn	%fcc2,	loop_3068
loop_3066:
	call	loop_3069
loop_3067:
	nop
	set	0x40, %g1
	ldsh	[%l7 + %g1],	%i4
	call	loop_3070
loop_3068:
	nop
	nop
	setx	0x80ACABDEDDE9207E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x893842E63787CE5C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f28,	%f24
loop_3069:
	addccc	%g4,	%o5,	%o1
	call	loop_3071
loop_3070:
	call	loop_3072
	bge	%icc,	loop_3073
	call	loop_3074
loop_3071:
	call	loop_3075
loop_3072:
	nop 	! 	tl	%xcc,	0x7d changed by convert2hboot
loop_3073:
	call	loop_3076
loop_3074:
	nop 	! 	tvs	%icc,	0x6f changed by convert2hboot
loop_3075:
	fmovsu	%fcc1,	%f17,	%f9
	movle	%xcc,	0x2DC,	%g6
loop_3076:
	call	loop_3077
	call	loop_3078
	bpos,a,pt	%icc,	loop_3079
	brlz,a,pt	%i3,	loop_3080
loop_3077:
	membar	0x51
loop_3078:
	movrgz	%l5,	%o7,	%i2
loop_3079:
	membar	0x1E
loop_3080:
	nop
	set	0x6B, %i0
	ldstub	[%l7 + %i0],	%g7
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0xeb,	%asi changed by convert2hboot
	membar	#Sync
	movue	%fcc1,	%i1,	%l6
	call	loop_3081
	movvs	%icc,	%l4,	%o4
	call	loop_3082
	call	loop_3083
loop_3081:
	mulx	%o6,	0x150A,	%g1
	call	loop_3084
loop_3082:
	fmovdvs	%xcc,	%f30,	%f30
loop_3083:
	sth	%o3,	[%l7 + 0x68]
	nop 	! 	tn	%icc,	0x74 changed by convert2hboot
loop_3084:
	wr	%g0,	0x0,	%pcr	! 	wr	%l2,	%i6,	%set_softint changed by convert2hboot
	alignaddr	%g2,	%l3,	%g5
	array16	%l1,	%o0,	%g3
	call	loop_3085
	nop
	set	0x0A, %g6
	ldsh	[%l7 + %g6],	%i5
	bcc,a	%icc,	loop_3086
	call	loop_3087
loop_3085:
	fbul,a	%fcc2,	loop_3088
	call	loop_3089
loop_3086:
	nop 	! 	rdhpr	%hintp,	%i0 changed by convert2hboot
loop_3087:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr	%g0,	0x0,	%pcr	! 	wr 	%l0, 	%g0, 	%tick_cmpr changed by convert2hboot
loop_3088:
	nop 	! 	rdhpr	%htba,	%o2 changed by convert2hboot
loop_3089:
	call	loop_3090
	fmovrse	%i4,	%f4,	%f13
	call	loop_3091
	xorcc	%g4,	%o5,	%o1
loop_3090:
	edge8	%g6,	%i3,	%o7
	set	0x18, %i5
	lda	[%l7 + %i5] 0x10,	%f31
loop_3091:
	nop
	set	0x30, %o7
	sth	%l5,	[%l7 + %o7]
	array32	%g7,	%l0,	%i1
	bg,a	%icc,	loop_3092
	call	loop_3093
	call	loop_3094
	nop 	! 	tg	%icc,	0x67 changed by convert2hboot
loop_3092:
	call	loop_3095
loop_3093:
	call	loop_3096
loop_3094:
	call	loop_3097
	fmovdue	%fcc3,	%f0,	%f20
loop_3095:
	call	loop_3098
loop_3096:
	fsrc1	%f28,	%f2
loop_3097:
	nop
	set	0x7A, %i3
	sth	%i2,	[%l7 + %i3]
	addc	%l6,	%l4,	%o4
loop_3098:
	edge16	%o6,	%o3,	%l2
	fmovsle	%fcc0,	%f28,	%f29
	call	loop_3099
	nop 	! 	tleu	%icc,	0x66 changed by convert2hboot
	xorcc	%i6,	0x0AC5,	%g1
	fxors	%f5,	%f22,	%f20
loop_3099:
	movul	%fcc2,	0x3B8,	%l3
	fmul8x16	%f2,	%f18,	%f10
	fmovdn	%fcc0,	%f12,	%f28
	call	loop_3100
	edge8l	%g2,	%l1,	%o0
	call	loop_3101
	wrpr	%g3,	0x1064,	%cwp
loop_3100:
	call	loop_3102
	xnor	%g5,	0x1804,	%i5
loop_3101:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	wr	%g0,	0x0,	%pcr	! 	wr	%o2,	%i4,	%sys_tick changed by convert2hboot
loop_3102:
	movug	%fcc2,	0x55F,	%i7
	movlg	%fcc2,	0x084,	%o5
	nop
	fitos	%f13,	%f19
	fstoi	%f19,	%f10
	call	loop_3103
	array8	%g4,	%g6,	%i3
	call	loop_3104
	movrlez	%o1,	%o7,	%l5
loop_3103:
	rd	%sys_tick_cmpr,	%l0
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f12
loop_3104:
	call	loop_3105
	fornot2	%f18,	%f4,	%f0
	bleu,a,pt	%xcc,	loop_3106
	alignaddr	%g7,	%i1,	%l6
loop_3105:
	addc	%l4,	%o4,	%o6
	srax	%i2,	0x06,	%o3
loop_3106:
	nop 	! 	rdhpr	%ver,	%l2 changed by convert2hboot
	call	loop_3107
	fbg,a	%fcc3,	loop_3108
	fmuld8sux16	%f20,	%f9,	%f22
	nop 	! 	tn	%icc,	0x59 changed by convert2hboot
loop_3107:
	fmovd	%f2,	%f20
loop_3108:
	nop
	nop
	setx	0xC365BBB4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x262BA3CB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f3,	%f13
	call	loop_3109
	fcmple32	%f10,	%f12,	%i6
	wrpr 	%g0, 	0x0, 	%gl
	fblg	%fcc0,	loop_3110
loop_3109:
	call	loop_3111
	fba,pt	%fcc2,	loop_3112
	subccc	%g2,	0x1DE7,	%l1
loop_3110:
	sth	%g3,	[%l7 + 0x3E]
loop_3111:
	fbn,a	%fcc1,	loop_3113
loop_3112:
	call	loop_3114
	nop 	! 	rdhpr	%hintp,	%g5 changed by convert2hboot
	set	0x40, %o4
	nop	 ! 	ldda	[%l7 + %o4] 0xda,	%f16 ASI use replaced by convert2hboot
loop_3113:
	sdivx	%o0,	0x04FC,	%i0
loop_3114:
	ldsb	[%l7 + 0x67],	%o2
	subc	%i4,	0x00E1,	%i7
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x89,	%asi changed by convert2hboot
	sta	%f13,	[%l7 + 0x68] %asi
	nop 	! 	tpos	%icc,	0x3f changed by convert2hboot
	call	loop_3115
	call	loop_3116
	call	loop_3117
	fmul8x16al	%f17,	%f9,	%f12
loop_3115:
	ldsb	[%l7 + 0x77],	%o5
loop_3116:
	call	loop_3118
loop_3117:
	brlez,pt	%g4,	loop_3119
	call	loop_3120
	call	loop_3121
loop_3118:
	nop
	setx loop_3122, %l0, %l1
	jmpl %l1, %i5
loop_3119:
	movule	%fcc0,	0x7B9,	%i3
loop_3120:
	be,a,pt	%icc,	loop_3123
loop_3121:
	call	loop_3124
loop_3122:
	movcc	%icc,	%o1,	%o7
	alignaddrl	%g6,	%l5,	%l0
loop_3123:
	movrgez	%i1,	0x030,	%g7
loop_3124:
	call	loop_3125
	edge8ln	%l4,	%o4,	%l6
	fors	%f20,	%f11,	%f22
	bne	%icc,	loop_3126
loop_3125:
	call	loop_3127
	nop 	! 	tle	%xcc,	0x64 changed by convert2hboot
	fmovsn	%icc,	%f18,	%f30
loop_3126:
	call	loop_3128
loop_3127:
	fbule	%fcc0,	loop_3129
	call	loop_3130
	call	loop_3131
loop_3128:
	sethi	0x0233,	%i2
loop_3129:
	call	loop_3132
loop_3130:
	rd	%sys_tick_cmpr,	%o6
loop_3131:
	subccc	%o3,	0x1D74,	%i6
	nop 	! 	tneg	%xcc,	0x36 changed by convert2hboot
loop_3132:
	movne	%xcc,	0x73A,	%l2
	call	loop_3133
	nop 	! 	tcs	%xcc,	0x4e changed by convert2hboot
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xCB5, 	%hsys_tick_cmpr changed by convert2hboot
	call	loop_3134
loop_3133:
	call	loop_3135
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x6, 	%fprs changed by convert2hboot
	and	%g2,	%g3,	%g5
loop_3134:
	call	loop_3136
loop_3135:
	call	loop_3137
	call	loop_3138
	call	loop_3139
loop_3136:
	movrgz	%i0,	0x35C,	%o2
loop_3137:
	movrne	%i4,	%o0,	%o5
loop_3138:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x19,	%asi changed by convert2hboot
	sta	%f22,	[%l7 + 0x44] %asi
loop_3139:
	nop 	! 	wrpr	%g4,	0x1B25,	%tick changed by convert2hboot
	nop
	nop
	setx	0x3898CC98BE62DBBB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x613C395E700F22FD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f28,	%f10
	call	loop_3140
	ld	[%l7 + 0x0C],	%f16
	call	loop_3141
	call	loop_3142
loop_3140:
	wr	%g0,	0x0,	%pcr	! 	wr	%i5,	0x1CF3,	%sys_tick changed by convert2hboot
	nop
	nop
	setx	0xAF569D2D3D7E117C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x5A74C7B1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsmuld	%f22,	%f22,	%f2
loop_3141:
	call	loop_3143
loop_3142:
	ldsw	[%l7 + 0x68],	%i7
	nop 	! 	rdhpr	%htba,	%o1 changed by convert2hboot
	fmovsne	%fcc2,	%f30,	%f11
loop_3143:
	umulcc	%o7,	%i3,	%g6
	movrgz	%l0,	0x0D3,	%l5
	bne,pt	%icc,	loop_3144
	call	loop_3145
	alignaddr	%i1,	%l4,	%g7
	popc	%l6,	%o4
loop_3144:
	call	loop_3146
loop_3145:
	call	loop_3147
	call	loop_3148
	fmovrse	%o6,	%f14,	%f27
loop_3146:
	nop
	fitos	%f27,	%f27
loop_3147:
	sll	%o3,	0x1F,	%i6
loop_3148:
	fnand	%f6,	%f16,	%f10
	alignaddrl	%l2,	%i2,	%g1
	call	loop_3149
	edge16n	%l1,	%l3,	%g3
	edge16	%g5,	%g2,	%o2
	wrpr 	%g0, 	0x2, 	%gl
loop_3149:
	call	loop_3150
	call	loop_3151
	call	loop_3152
	wr	%g0,	0x0,	%pcr	! 	wr	%o0,	%g4,	%softint changed by convert2hboot
loop_3150:
	fpackfix	%f20,	%f16
loop_3151:
	fcmpd	%fcc3,	%f16,	%f2
loop_3152:
	edge8	%i5,	%o5,	%i7
	array32	%o7,	%o1,	%g6
	call	loop_3153
	nop 	! 	tge	%icc,	0x6d changed by convert2hboot
	call	loop_3154
	movug	%fcc1,	%l0,	%i3
loop_3153:
	call	loop_3155
	nop 	! 	wrpr	%i1,	%l5,	%tick changed by convert2hboot
loop_3154:
	fnot2	%f10,	%f8
	call	loop_3156
loop_3155:
	fcmpne32	%f12,	%f24,	%g7
	call	loop_3157
	xnorcc	%l6,	%l4,	%o6
loop_3156:
	call	loop_3158
	udivcc	%o4,	0x0AA4,	%i6
loop_3157:
	call	loop_3159
	membar	0x16
loop_3158:
	sllx	%l2,	%o3,	%i2
	fornot1s	%f11,	%f5,	%f20
loop_3159:
	fzeros	%f21
	edge32n	%l1,	%g1,	%g3
	call	loop_3160
	addc	%g5,	%l3,	%o2
	fcmpne32	%f22,	%f20,	%i4
	nop	!	sir	0x11EF !! sir is illegal now
loop_3160:
	srl	%i0,	%o0,	%g4
	fxnors	%f2,	%f6,	%f28
	popc	0x013F,	%g2
	brlz,a	%i5,	loop_3161
	edge16	%i7,	%o7,	%o5
	call	loop_3162
	fmovsvc	%icc,	%f7,	%f4
loop_3161:
	nop 	! 	tn	%icc,	0x54 changed by convert2hboot
loop_3162:
	bvs,a	%icc,	loop_3163
	rd	%pc,	%o1
	call	loop_3164
	movvc	%icc,	0x69C,	%g6
loop_3163:
	fandnot1	%f10,	%f14,	%f4
	call	loop_3165
loop_3164:
	nop
	set	0x30, %l1
	stw	%i3,	[%l7 + %l1]
	nop
	set	0x5A, %g2
	ldsh	[%l7 + %g2],	%i1
	wr	%g0,	0x0,	%pcr	! 	wr	%l5,	0x0680,	%pic changed by convert2hboot
loop_3165:
	call	loop_3166
	call	loop_3167
	orncc	%g7,	0x0ED3,	%l6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr	%g0,	0x0,	%pcr	! 	wr 	%l0, 	0xE6E, 	%tick_cmpr changed by convert2hboot
loop_3166:
	fmovrdlz	%o4,	%f28,	%f4
loop_3167:
	call	loop_3168
	smul	%i6,	0x00CC,	%o6
	nop 	! 	ta	%xcc,	0x54 changed by convert2hboot
	mulscc	%o3,	%l2,	%i2
loop_3168:
	movcc	%icc,	0x76F,	%g1
	bne	%icc,	loop_3169
	array8	%g3,	%g5,	%l1
	call	loop_3170
	brgz,pt	%o2,	loop_3171
loop_3169:
	call	loop_3172
	nop 	! 	tleu	%xcc,	0x62 changed by convert2hboot
loop_3170:
	call	loop_3173
loop_3171:
	call	loop_3174
loop_3172:
	array8	%l3,	%i0,	%i4
	nop 	! 	tle	%icc,	0x6e changed by convert2hboot
loop_3173:
	call	loop_3175
loop_3174:
	call	loop_3176
	rd	%fprs,	%g4
	fmovdne	%icc,	%f0,	%f18
loop_3175:
	nop 	! 	tge	%icc,	0x4e changed by convert2hboot
loop_3176:
	bcs,a	%icc,	loop_3177
	xorcc	%o0,	0x1583,	%i5
	ldsw	[%l7 + 0x28],	%g2
	movge	%icc,	%o7,	%o5
loop_3177:
	andn	%i7,	0x0EB2,	%g6
	movrne	%o1,	%i1,	%i3
	call	loop_3178
	nop 	! 	tle	%xcc,	0x3b changed by convert2hboot
	fbu,a,pn	%fcc0,	loop_3179
	nop 	! 	tsubcctv	%l5,	0x49,	%g7 changed by convert2hboot
loop_3178:
	std	%f28,	[%l7 + 0x18]
	smul	%l4,	%l0,	%l6
loop_3179:
	mulscc	%i6,	%o6,	%o3
	nop
	set	0x28, %l0
	ldsh	[%l7 + %l0],	%l2
	call	loop_3180
	call	loop_3181
	swap	[%l7 + 0x6C],	%i2
	movul	%fcc3,	0x4AD,	%o4
loop_3180:
	xor	%g1,	0x03EF,	%g3
loop_3181:
	call	loop_3182
	nop 	! 	taddcc	%g5,	%l1,	%l3 changed by convert2hboot
	rd	%ccr,	%o2
	movue	%fcc1,	%i4,	%i0
loop_3182:
	fbn,a	%fcc1,	loop_3183
	nop 	! 	tge	%icc,	0x3c changed by convert2hboot
	bvc,pn	%xcc,	loop_3184
	fsrc1	%f14,	%f10
loop_3183:
	sll	%g4,	%i5,	%o0
	mulscc	%o7,	%o5,	%g2
loop_3184:
	nop 	! 	tvs	%icc,	0x77 changed by convert2hboot
	fmovrse	%g6,	%f25,	%f6
	andn	%i7,	%o1,	%i1
	andcc	%l5,	0x0B9E,	%g7
	nop 	! 	tvs	%icc,	0x3f changed by convert2hboot
	nop 	! 	tge	%xcc,	0x63 changed by convert2hboot
	call	loop_3185
	sth	%i3,	[%l7 + 0x4A]
	fmovrde	%l0,	%f8,	%f20
	call	loop_3186
loop_3185:
	call	loop_3187
	rdpr	%otherwin,	%l6
	fnand	%f24,	%f30,	%f16
loop_3186:
	call	loop_3188
loop_3187:
	call	loop_3189
	fpadd16s	%f25,	%f14,	%f15
	call	loop_3190
loop_3188:
	call	loop_3191
loop_3189:
	call	loop_3192
	udivx	%i6,	0x134E,	%l4
loop_3190:
	edge32l	%o6,	%l2,	%o3
loop_3191:
	call	loop_3193
loop_3192:
	call	loop_3194
	call	loop_3195
	edge32l	%i2,	%g1,	%g3
loop_3193:
	andncc	%o4,	%g5,	%l1
loop_3194:
	movue	%fcc2,	%l3,	%o2
loop_3195:
	call	loop_3196
	bneg	%icc,	loop_3197
	nop 	! 	te	%xcc,	0x73 changed by convert2hboot
	edge8n	%i0,	%i4,	%i5
loop_3196:
	nop 	! 	tge	%xcc,	0x4a changed by convert2hboot
loop_3197:
	call	loop_3198
	call	loop_3199
	call	loop_3200
	edge16n	%g4,	%o7,	%o0
loop_3198:
	call	loop_3201
loop_3199:
	flush	%l7 + 0x64
loop_3200:
	call	loop_3202
	bl	%xcc,	loop_3203
loop_3201:
	movrlz	%g2,	0x18F,	%g6
	movg	%fcc2,	0x5C6,	%o5
loop_3202:
	fxnors	%f20,	%f18,	%f6
loop_3203:
	add	%i7,	0x14CB,	%i1
	call	loop_3204
	movcc	%xcc,	%o1,	%l5
	rd	%softint,	%i3
	call	loop_3205
loop_3204:
	call	loop_3206
	call	loop_3207
	bmask	%g7,	%l0,	%l6
loop_3205:
	fmovsge	%fcc2,	%f1,	%f21
loop_3206:
	fbg,pt	%fcc3,	loop_3208
loop_3207:
	fbul	%fcc3,	loop_3209
	call	loop_3210
	call	loop_3211
loop_3208:
	call	loop_3212
loop_3209:
	bcs	%xcc,	loop_3213
loop_3210:
	fabss	%f6,	%f7
loop_3211:
	flushw
loop_3212:
	fcmpgt16	%f26,	%f28,	%i6
loop_3213:
	sub	%o6,	0x00C4,	%l4
	call	loop_3214
	nop 	! 	tge	%icc,	0x60 changed by convert2hboot
	nop 	! 	tvs	%xcc,	0x65 changed by convert2hboot
	nop 	! 	tg	%xcc,	0x56 changed by convert2hboot
loop_3214:
	movul	%fcc2,	%o3,	%i2
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x11,	%asi changed by convert2hboot
	call	loop_3215
	nop 	! 	tn	%icc,	0x70 changed by convert2hboot
	movule	%fcc3,	%g3,	%g1
	array16	%g5,	%l1,	%l3
loop_3215:
	bgu,a	%icc,	loop_3216
	call	loop_3217
	xnor	%o4,	%i0,	%o2
	call	loop_3218
loop_3216:
	nop 	! 	te	%icc,	0x5e changed by convert2hboot
loop_3217:
	nop
	set	0x3C, %o2
	sta	%f14,	[%l7 + %o2] 0x04
loop_3218:
	array16	%i4,	%g4,	%i5
	call	loop_3219
	rdpr	%pil,	%o7
	call	loop_3220
	call	loop_3221
loop_3219:
	call	loop_3222
	call	loop_3223
loop_3220:
	fcmpne16	%f30,	%f24,	%o0
loop_3221:
	bg,pn	%xcc,	loop_3224
loop_3222:
	call	loop_3225
loop_3223:
	be,a	%xcc,	loop_3226
	wr	%g0,	0x0,	%pcr	! 	wr	%g2,	0x1910,	%ccr changed by convert2hboot
loop_3224:
	call	loop_3227
loop_3225:
	fpadd32	%f22,	%f26,	%f12
loop_3226:
	call	loop_3228
	call	loop_3229
loop_3227:
	nop 	! 	tleu	%xcc,	0x7a changed by convert2hboot
	call	loop_3230
loop_3228:
	call	loop_3231
loop_3229:
	movvc	%icc,	0x16F,	%o5
	orncc	%g6,	0x1651,	%i1
loop_3230:
	call	loop_3232
loop_3231:
	call	loop_3233
	call	loop_3234
	fcmpd	%fcc2,	%f8,	%f16
loop_3232:
	nop 	! 	te	%xcc,	0x5c changed by convert2hboot
loop_3233:
	call	loop_3235
loop_3234:
	fmovda	%fcc0,	%f2,	%f6
	fsrc1s	%f17,	%f2
	call	loop_3236
loop_3235:
	call	loop_3237
	xor	%i7,	%o1,	%l5
	call	loop_3238
loop_3236:
	nop 	! 	tvc	%icc,	0x6e changed by convert2hboot
loop_3237:
	sra	%g7,	0x01,	%i3
	movcc	%icc,	%l0,	%l6
loop_3238:
	fbge,a,pt	%fcc1,	loop_3239
	call	loop_3240
	call	loop_3241
	movo	%fcc0,	0x28E,	%o6
loop_3239:
	addccc	%i6,	0x09C5,	%o3
loop_3240:
	call	loop_3242
loop_3241:
	fmovdug	%fcc0,	%f12,	%f6
	nop 	! 	tpos	%xcc,	0x7c changed by convert2hboot
	wrpr	%l4,	0x01C5,	%cwp
loop_3242:
	call	loop_3243
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x4, 	%fprs changed by convert2hboot
	rdpr	%pil,	%g3
	addc	%g1,	%g5,	%l1
loop_3243:
	call	loop_3244
	array16	%o4,	%i0,	%o2
	call	loop_3245
	movcc	%icc,	%i4,	%l3
loop_3244:
	call	loop_3246
	call	loop_3247
loop_3245:
	nop
	set	0x42, %i7
	ldstub	[%l7 + %i7],	%i5
	nop
	set	0x4B, %i6
	stb	%g4,	[%l7 + %i6]
loop_3246:
	umulcc	%o7,	%g2,	%o0
loop_3247:
	call	loop_3248
	and	%o5,	0x0A67,	%g6
	call	loop_3249
	call	loop_3250
loop_3248:
	fmovd	%f30,	%f14
	fmovscc	%xcc,	%f8,	%f18
loop_3249:
	wrpr	%i7,	%o1,	%cwp
loop_3250:
	fones	%f27
	andn	%i1,	0x0A2A,	%g7
	nop
	set	0x0E, %g5
	ldsh	[%l7 + %g5],	%l5
	movleu	%xcc,	%i3,	%l0
	call	loop_3251
	movleu	%xcc,	%o6,	%i6
	nop 	! 	tvs	%xcc,	0x79 changed by convert2hboot
	movleu	%icc,	0x64D,	%l6
loop_3251:
	fbul,a	%fcc1,	loop_3252
	call	loop_3253
	call	loop_3254
	call	loop_3255
loop_3252:
	nop 	! 	tsubcc	%l4,	%l2,	%i2 changed by convert2hboot
loop_3253:
	call	loop_3256
loop_3254:
	fxors	%f1,	%f29,	%f11
loop_3255:
	call	loop_3257
	fbne,a,pt	%fcc1,	loop_3258
loop_3256:
	call	loop_3259
	subcc	%g3,	0x148E,	%o3
loop_3257:
	nop
	set	0x7B, %i4
	nop	 ! 	lduba	[%l7 + %i4] 0x10,	%g5 ASI use replaced by convert2hboot
loop_3258:
	call	loop_3260
loop_3259:
	fnor	%f8,	%f16,	%f10
	mulscc	%g1,	%l1,	%o4
	edge8ln	%o2,	%i4,	%l3
loop_3260:
	xor	%i5,	%i0,	%o7
	fmovda	%icc,	%f14,	%f28
	fpackfix	%f0,	%f13
	nop 	! 	tg	%icc,	0x4c changed by convert2hboot
	array16	%g2,	%g4,	%o0
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x88,	%asi changed by convert2hboot
	lda	[%l7 + 0x70] %asi,	%f14
	ld	[%l7 + 0x60],	%f8
	movug	%fcc1,	%g6,	%i7
	edge16	%o1,	%i1,	%g7
	movlg	%fcc1,	%l5,	%o5
	set	0x40, %l5
	nop	 ! 	ldda	[%l7 + %l5] 0x89,	%f16 ASI use replaced by convert2hboot
	wrpr	%i3,	0x0D08,	%pil
	call	loop_3261
	nop
	setx	0x1FB7,	%l0,	%i6
	udiv	%o6,	%i6,	%l0
	edge8	%l4,	%l6,	%i2
	edge32n	%l2,	%o3,	%g5
loop_3261:
	call	loop_3262
	sth	%g3,	[%l7 + 0x36]
	bl,a,pn	%icc,	loop_3263
	fmovdne	%icc,	%f2,	%f4
loop_3262:
	nop 	! 	te	%icc,	0x41 changed by convert2hboot
	call	loop_3264
loop_3263:
	call	loop_3265
	movl	%fcc3,	0x14F,	%g1
	subc	%o4,	%l1,	%i4
loop_3264:
	wr	%g0,	0x0,	%pcr	! 	wr	%l3,	0x11F8,	%softint changed by convert2hboot
loop_3265:
	umul	%i5,	%o2,	%i0
	call	loop_3266
	add	%o7,	%g2,	%g4
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x11,	%asi changed by convert2hboot
	lda	[%l7 + 0x0C] %asi,	%f8
loop_3266:
	nop 	! 	rdhpr	%hintp,	%o0 changed by convert2hboot
	call	loop_3267
	sdivx	%g6,	0x0330,	%o1
	bn,a	%xcc,	loop_3268
	fmovdlg	%fcc3,	%f28,	%f26
loop_3267:
	fbg,pt	%fcc1,	loop_3269
	call	loop_3270
loop_3268:
	ble,a	%icc,	loop_3271
	nop 	! 	rdhpr	%htba,	%i7 changed by convert2hboot
loop_3269:
	fones	%f20
loop_3270:
	call	loop_3272
loop_3271:
	nop 	! 	tge	%icc,	0x59 changed by convert2hboot
	fpack32	%f2,	%f4,	%f30
	nop
	set	0x58, %l6
	std	%i0,	[%l7 + %l6]
loop_3272:
	smul	%g7,	%o5,	%l5
	movule	%fcc1,	0x7C2,	%i3
	rd	%ccr,	%i6
	wr	%g0,	0x0,	%pcr	! 	wr	%l0,	%l4,	%y changed by convert2hboot
	nop 	! 	tleu	%xcc,	0x58 changed by convert2hboot
	fmovdg	%fcc2,	%f24,	%f28
	edge8	%l6,	%i2,	%o6
	movpos	%icc,	0x352,	%l2
	call	loop_3273
	addc	%g5,	0x1A93,	%g3
	call	loop_3274
	call	loop_3275
loop_3273:
	edge32	%g1,	%o4,	%o3
	call	loop_3276
loop_3274:
	edge16l	%i4,	%l3,	%i5
loop_3275:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xD66, 	%hsys_tick_cmpr changed by convert2hboot
	fnot1s	%f28,	%f20
loop_3276:
	nop 	! 	tleu	%icc,	0x79 changed by convert2hboot
	call	loop_3277
	call	loop_3278
	edge16ln	%l1,	%o7,	%g2
	nop
	nop
	setx	0xA615DF11,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xD28C8F71,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f7,	%f18
loop_3277:
	call	loop_3279
loop_3278:
	call	loop_3280
	nop 	! 	rdhpr	%htba,	%g4 changed by convert2hboot
	call	loop_3281
loop_3279:
	fbge,a,pn	%fcc3,	loop_3282
loop_3280:
	fmovrdlz	%i0,	%f28,	%f6
	fble,pn	%fcc0,	loop_3283
loop_3281:
	addcc	%g6,	0x14B3,	%o0
loop_3282:
	mulscc	%i7,	%o1,	%i1
	bcc	%icc,	loop_3284
loop_3283:
	nop 	! 	tsubcc	%o5,	0x73,	%l5 changed by convert2hboot
	call	loop_3285
	edge32n	%g7,	%i3,	%l0
loop_3284:
	call	loop_3286
	call	loop_3287
loop_3285:
	call	loop_3288
	call	loop_3289
loop_3286:
	movcc	%xcc,	0x58F,	%i6
loop_3287:
	fbn,pn	%fcc1,	loop_3290
loop_3288:
	nop
	setx	0x1617,	%l0,	%i2
	udivcc	%l4,	%i2,	%l6
loop_3289:
	call	loop_3291
	call	loop_3292
loop_3290:
	fbg,a	%fcc2,	loop_3293
	array32	%o6,	%g5,	%g3
loop_3291:
	fmovsuge	%fcc3,	%f15,	%f20
loop_3292:
	fbu,a	%fcc2,	loop_3294
loop_3293:
	call	loop_3295
	fmovsul	%fcc1,	%f13,	%f8
	nop
	fitod	%f10,	%f10
	fdtos	%f10,	%f4
loop_3294:
	wr	%g0,	0x0,	%pcr	! 	wr	%l2,	0x023A,	%pic changed by convert2hboot
loop_3295:
	call	loop_3296
	call	loop_3297
	movleu	%xcc,	0x278,	%g1
	nop 	! 	tg	%xcc,	0x66 changed by convert2hboot
loop_3296:
	call	loop_3298
loop_3297:
	call	loop_3299
	edge32	%o4,	%o3,	%l3
	array8	%i4,	%o2,	%l1
loop_3298:
	xorcc	%i5,	0x185D,	%o7
loop_3299:
	mulx	%g2,	%g4,	%g6
	call	loop_3300
	movgu	%icc,	%i0,	%o0
	nop 	! 	tn	%icc,	0x42 changed by convert2hboot
	fpsub16s	%f1,	%f28,	%f10
loop_3300:
	movvc	%icc,	%i7,	%o1
	fmovsuge	%fcc3,	%f23,	%f26
	edge8n	%i1,	%o5,	%l5
	fmovrdgez	%i3,	%f10,	%f24
	movrne	%g7,	%l0,	%i6
	call	loop_3301
	call	loop_3302
	call	loop_3303
	call	loop_3304
loop_3301:
	call	loop_3305
loop_3302:
	fandnot2	%f26,	%f26,	%f18
loop_3303:
	call	loop_3306
loop_3304:
	call	loop_3307
loop_3305:
	call	loop_3308
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_3306:
	fpadd16	%f26,	%f2,	%f22
loop_3307:
	fmovsuge	%fcc1,	%f28,	%f9
loop_3308:
	smul	%i2,	%l6,	%o6
	nop
	set	0x5E, %o5
	ldstub	[%l7 + %o5],	%g5
	fmovslg	%fcc1,	%f19,	%f29
	movule	%fcc2,	%g3,	%l2
	nop
	setx	loop_3309,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x004200001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	nop 	! 	tne	%icc,	0x75 changed by convert2hboot
	smul	%g1,	%l4,	%o3
	nop 	! 	tle	%icc,	0x35 changed by convert2hboot
loop_3309:
	call	loop_3310
	call	loop_3311
	srl	%l3,	%i4,	%o4
	call	loop_3312
loop_3310:
	nop 	! 	te	%icc,	0x7e changed by convert2hboot
loop_3311:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x80,	%asi changed by convert2hboot
loop_3312:
	call	loop_3313
	call	loop_3314
	call	loop_3315
	xor	%i5,	%o7,	%l1
loop_3313:
	edge16l	%g2,	%g6,	%g4
loop_3314:
	call	loop_3316
loop_3315:
	call	loop_3317
	fmul8x16al	%f4,	%f3,	%f18
	addccc	%i0,	%i7,	%o1
loop_3316:
	call	loop_3318
loop_3317:
	call	loop_3319
	movcc	%xcc,	%i1,	%o5
	subc	%l5,	0x0E0E,	%i3
loop_3318:
	bvc,a,pn	%xcc,	loop_3320
loop_3319:
	fors	%f15,	%f17,	%f18
	sethi	0x146F,	%g7
	nop 	! 	ta	%xcc,	0x60 changed by convert2hboot
loop_3320:
	call	loop_3321
	call	loop_3322
	fmovdcc	%icc,	%f12,	%f24
	nop 	! 	tle	%icc,	0x7b changed by convert2hboot
loop_3321:
	call	loop_3323
loop_3322:
	call	loop_3324
	andncc	%o0,	0x04BC,	%l0
	call	loop_3325
loop_3323:
	orn	%i2,	0x0A20,	%l6
loop_3324:
	nop
	setx	0x14E4,	%l0,	%g5
	udivx	%o6,	%g5,	%i6
	fmovdneg	%icc,	%f10,	%f28
loop_3325:
	call	loop_3326
	fbule	%fcc3,	loop_3327
	alignaddr	%l2,	%g3,	%l4
	fbu,a	%fcc3,	loop_3328
loop_3326:
	nop
	set	0x58, %g3
	std	%f0,	[%l7 + %g3]
loop_3327:
	membar	0x79
	or	%o3,	%l3,	%g1
loop_3328:
	call	loop_3329
	call	loop_3330
	call	loop_3331
	fxors	%f20,	%f30,	%f10
loop_3329:
	call	loop_3332
loop_3330:
	fmovs	%f24,	%f28
loop_3331:
	call	loop_3333
	edge8	%i4,	%o2,	%o4
loop_3332:
	fcmped	%fcc3,	%f24,	%f22
	nop
	nop
	setx	0x6B41C7F25D9E5A6C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f12
loop_3333:
	brlez	%o7,	loop_3334
	bmask	%l1,	%i5,	%g2
	nop 	! 	tneg	%icc,	0x6f changed by convert2hboot
	fcmpne16	%f24,	%f20,	%g4
loop_3334:
	move	%icc,	0x6E1,	%i0
	movne	%fcc2,	%g6,	%i7
	xnorcc	%o1,	0x1A6C,	%i1
	call	loop_3335
	call	loop_3336
	movrlz	%l5,	0x235,	%o5
	popc	%g7,	%i3
loop_3335:
	call	loop_3337
loop_3336:
	call	loop_3338
	or	%l0,	%i2,	%o0
	call	loop_3339
loop_3337:
	nop
	nop
	setx	0x5B7927C5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f3
loop_3338:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x80,	%asi changed by convert2hboot
loop_3339:
	call	loop_3340
	movne	%fcc0,	0x791,	%g5
	bl,pn	%icc,	loop_3341
	ldd	[%l7 + 0x40],	%i6
loop_3340:
	nop 	! 	tleu	%icc,	0x52 changed by convert2hboot
	or	%l2,	%l6,	%g3
loop_3341:
	addcc	%o3,	%l3,	%l4
	call	loop_3342
	call	loop_3343
	call	loop_3344
	fnot1s	%f17,	%f19
loop_3342:
	udivx	%g1,	0x0180,	%i4
loop_3343:
	array8	%o2,	%o7,	%o4
loop_3344:
	call	loop_3345
	movge	%fcc3,	%i5,	%g2
	fbo	%fcc2,	loop_3346
	fbe	%fcc0,	loop_3347
loop_3345:
	bne,a,pt	%xcc,	loop_3348
	call	loop_3349
loop_3346:
	edge16n	%l1,	%i0,	%g4
loop_3347:
	call	loop_3350
loop_3348:
	nop 	! 	rdhpr	%hintp,	%g6 changed by convert2hboot
loop_3349:
	nop
	set	0x68, %o1
	nop	 ! 	lduwa	[%l7 + %o1] 0x89,	%o1 ASI use replaced by convert2hboot
loop_3350:
	movrgz	%i7,	%i1,	%l5
	call	loop_3351
	smulcc	%g7,	%i3,	%l0
	movrlez	%i2,	%o5,	%o6
	fand	%f18,	%f6,	%f24
loop_3351:
	subcc	%o0,	0x0BA2,	%i6
	xnor	%g5,	%l6,	%l2
	call	loop_3352
	nop 	! 	taddcctv	%o3,	0x66,	%g3 changed by convert2hboot
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%l3 changed by convert2hboot
	wr	%g0,	0x0,	%pcr	! 	wr	%g1,	%l4,	%sys_tick changed by convert2hboot
loop_3352:
	mulscc	%i4,	0x07C3,	%o7
	call	loop_3353
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movlg	%fcc0,	%o4,	%o2
	subcc	%i5,	%l1,	%g2
loop_3353:
	movn	%fcc1,	0x11F,	%g4
	set	0x6F, %g4
	nop	 ! 	ldstuba	[%l7 + %g4] 0x88,	%g6 ASI use replaced by convert2hboot
	andncc	%i0,	0x0872,	%o1
	mova	%fcc2,	%i7,	%i1
	call	loop_3354
	call	loop_3355
	call	loop_3356
	call	loop_3357
loop_3354:
	call	loop_3358
loop_3355:
	fblg	%fcc0,	loop_3359
loop_3356:
	fmovsug	%fcc0,	%f16,	%f27
loop_3357:
	udivcc	%l5,	0x16B4,	%i3
loop_3358:
	sub	%l0,	0x13D1,	%g7
loop_3359:
	movule	%fcc0,	0x6B6,	%o5
	nop 	! 	taddcc	%i2,	0x69,	%o0 changed by convert2hboot
	fpsub32	%f18,	%f10,	%f30
	fmovdg	%icc,	%f12,	%f8
	call	loop_3360
	call	loop_3361
	edge16	%o6,	%g5,	%l6
	movrgez	%i6,	%o3,	%l2
loop_3360:
	call	loop_3362
loop_3361:
	nop 	! 	tgu	%icc,	0x60 changed by convert2hboot
	membar	0x24
	rdpr	%canrestore,	%g3
loop_3362:
	fba	%fcc0,	loop_3363
	fnor	%f24,	%f2,	%f20
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	call	loop_3364
loop_3363:
	call	loop_3365
	nop
	set	0x1C, %l2
	stw	%g1,	[%l7 + %l2]
	sra	%o7,	%o4,	%o2
loop_3364:
	sllx	%i4,	%l1,	%g2
loop_3365:
	movuge	%fcc1,	0x0DE,	%i5
	movlg	%fcc3,	0x208,	%g6
	movu	%fcc2,	%i0,	%g4
	call	loop_3366
	nop
	set	0x50, %o3
	swap	[%l7 + %o3],	%o1
	std	%f6,	[%l7 + 0x48]
	movrgz	%i1,	0x261,	%l5
loop_3366:
	edge32n	%i3,	%i7,	%g7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x11,	%asi changed by convert2hboot
	nop 	! 	tneg	%icc,	0x5c changed by convert2hboot
	call	loop_3367
	mulx	%i2,	%o6,	%o0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x89,	%asi changed by convert2hboot
	nop	 ! 	casxa	[%l6] 0x89,	%g5,	%l6 ASI use replaced by convert2hboot
loop_3367:
	bneg,a,pt	%icc,	loop_3368
	call	loop_3369
	fmovdg	%fcc1,	%f2,	%f10
	call	loop_3370
loop_3368:
	call	loop_3371
loop_3369:
	nop 	! 	te	%icc,	0x52 changed by convert2hboot
	umulcc	%o3,	%i6,	%g3
loop_3370:
	nop 	! 	tsubcc	%l2,	0x5c,	%l4 changed by convert2hboot
loop_3371:
	call	loop_3372
	call	loop_3373
	call	loop_3374
	movvc	%icc,	%g1,	%l3
loop_3372:
	nop
	setx	0x1F62,	%l0,	%o4
	udiv	%o7,	%o4,	%i4
loop_3373:
	bleu,a,pt	%icc,	loop_3375
loop_3374:
	call	loop_3376
	edge8l	%o2,	%l1,	%i5
	rd	%y,	%g2
loop_3375:
	edge16	%i0,	%g6,	%o1
loop_3376:
	call	loop_3377
	call	loop_3378
	movul	%fcc0,	%g4,	%l5
	call	loop_3379
loop_3377:
	add	%i3,	%i7,	%i1
loop_3378:
	call	loop_3380
	movge	%icc,	0x7FA,	%g7
loop_3379:
	call	loop_3381
	move	%icc,	%l0,	%o5
loop_3380:
	bgu	%xcc,	loop_3382
	movule	%fcc0,	0x0E2,	%o6
loop_3381:
	bge,pt	%xcc,	loop_3383
	movrlz	%o0,	%i2,	%l6
loop_3382:
	movleu	%xcc,	%o3,	%g5
	call	loop_3384
loop_3383:
	bgu,a	%icc,	loop_3385
	addccc	%g3,	0x139B,	%i6
	call	loop_3386
loop_3384:
	fxors	%f31,	%f29,	%f19
loop_3385:
	call	loop_3387
	call	loop_3388
loop_3386:
	nop 	! 	tg	%xcc,	0x68 changed by convert2hboot
	array32	%l2,	%g1,	%l3
loop_3387:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x18,	%asi changed by convert2hboot
loop_3388:
	call	loop_3389
	call	loop_3390
	fbuge,pn	%fcc2,	loop_3391
	nop
	set	0x44, %l3
	flush	%l7 + %l3
loop_3389:
	call	loop_3392
loop_3390:
	umul	%o7,	0x1F7F,	%o4
loop_3391:
	call	loop_3393
	movvc	%icc,	0x00D,	%i4
loop_3392:
	call	loop_3394
	call	loop_3395
loop_3393:
	edge8ln	%l1,	%o2,	%g2
	srl	%i5,	%i0,	%g6
loop_3394:
	addc	%g4,	0x1600,	%o1
loop_3395:
	orncc	%l5,	0x144E,	%i7
	call	loop_3396
	call	loop_3397
	fsrc2s	%f17,	%f25
	call	loop_3398
loop_3396:
	orcc	%i1,	0x0392,	%i3
loop_3397:
	movrgez	%l0,	%g7,	%o5
	movug	%fcc1,	0x393,	%o0
loop_3398:
	edge32n	%i2,	%o6,	%o3
	movle	%xcc,	0x190,	%g5
	call	loop_3399
	call	loop_3400
	call	loop_3401
	subc	%l6,	0x1AF3,	%i6
loop_3399:
	movlg	%fcc3,	%g3,	%l2
loop_3400:
	brgez,a	%l3,	loop_3402
loop_3401:
	movrgez	%g1,	%o7,	%l4
	nop 	! 	taddcctv	%i4,	0x6f,	%o4 changed by convert2hboot
	call	loop_3403
loop_3402:
	fble	%fcc2,	loop_3404
	srax	%l1,	0x1A,	%g2
	call	loop_3405
loop_3403:
	array8	%i5,	%o2,	%g6
loop_3404:
	call	loop_3406
	array16	%i0,	%g4,	%l5
loop_3405:
	edge32l	%o1,	%i1,	%i7
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x19,	%asi changed by convert2hboot
	sta	%f3,	[%l7 + 0x14] %asi
loop_3406:
	movuge	%fcc2,	0x423,	%l0
	call	loop_3407
	subc	%i3,	%o5,	%g7
	nop 	! 	tle	%xcc,	0x4c changed by convert2hboot
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x543, 	%hsys_tick_cmpr changed by convert2hboot
loop_3407:
	fmovrsgez	%o6,	%f21,	%f8
	orn	%o0,	%o3,	%l6
	movl	%fcc1,	%i6,	%g5
	call	loop_3408
	movl	%icc,	0x368,	%g3
	call	loop_3409
	call	loop_3410
loop_3408:
	add	%l2,	0x0A31,	%l3
	fnot1	%f0,	%f10
loop_3409:
	movrgz	%o7,	%l4,	%g1
loop_3410:
	call	loop_3411
	fmovdleu	%icc,	%f4,	%f22
	call	loop_3412
	nop
	setx	0x1B74,	%l0,	%l1
	udivcc	%o4,	%l1,	%g2
loop_3411:
	edge32l	%i5,	%o2,	%g6
	add	%i0,	%g4,	%l5
loop_3412:
	nop
	fitod	%f12,	%f10
	fdtoi	%f10,	%f1
	call	loop_3413
	call	loop_3414
	subc	%i4,	0x08C0,	%i1
	call	loop_3415
loop_3413:
	movuge	%fcc2,	0x59D,	%i7
loop_3414:
	addc	%o1,	0x17CF,	%l0
	fmul8x16al	%f14,	%f13,	%f18
loop_3415:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x786, 	%hsys_tick_cmpr changed by convert2hboot
	array16	%i2,	%o5,	%o0
	call	loop_3416
	mulscc	%o6,	0x1504,	%l6
	nop
	nop
	setx	0x43E1464F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xE20850EA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f29,	%f9
	call	loop_3417
loop_3416:
	edge8n	%i6,	%g5,	%o3
	nop 	! 	tvc	%icc,	0x49 changed by convert2hboot
	call	loop_3418
loop_3417:
	ldd	[%l7 + 0x48],	%g2
	call	loop_3419
	call	loop_3420
loop_3418:
	call	loop_3421
	call	loop_3422
loop_3419:
	call	loop_3423
loop_3420:
	call	loop_3424
loop_3421:
	call	loop_3425
loop_3422:
	fnand	%f28,	%f10,	%f0
loop_3423:
	sdivx	%l3,	0x0FE2,	%l2
loop_3424:
	smul	%l4,	0x0831,	%o7
loop_3425:
	wrpr 	%g0, 	0x3, 	%gl
	fcmpgt32	%f0,	%f10,	%g1
	ldsh	[%l7 + 0x4E],	%i5
	call	loop_3426
	bvc,a,pt	%xcc,	loop_3427
	nop 	! 	tvs	%xcc,	0x73 changed by convert2hboot
	call	loop_3428
loop_3426:
	movrlez	%o2,	%g6,	%g2
loop_3427:
	fmovsvc	%icc,	%f23,	%f25
	set	0x338, %l4
	nop 	! 	nop 	! 	nop	 ! 	ldxa	[%g0 + %l4] 0x40,	%i0 ASI use replaced by convert2hboot ripped by fixASI40.pl ripped by fixASI40.pl
loop_3428:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x80,	%asi changed by convert2hboot
	lda	[%l7 + 0x24] %asi,	%f8
	call	loop_3429
	call	loop_3430
	fxors	%f14,	%f31,	%f0
	wr	%g0,	0x0,	%pcr	! 	wr	%l5,	%i4,	%clear_softint changed by convert2hboot
loop_3429:
	call	loop_3431
loop_3430:
	ba,a	%icc,	loop_3432
	fmovse	%fcc3,	%f23,	%f22
	bne,a,pn	%icc,	loop_3433
loop_3431:
	umulcc	%i1,	%i7,	%g4
loop_3432:
	add	%l0,	%o1,	%g7
	movo	%fcc3,	0x6F6,	%i3
loop_3433:
	nop 	! 	taddcctv	%o5,	0x47,	%i2 changed by convert2hboot
	movpos	%xcc,	0x4FB,	%o6
	nop 	! 	tsubcctv	%l6,	%o0,	%i6 changed by convert2hboot
	bvs,a	%icc,	loop_3434
	movul	%fcc3,	%o3,	%g5
	call	loop_3435
	membar	0x56
loop_3434:
	wr	%g0,	0x0,	%pcr	! 	wr	%l3,	%g3,	%pic changed by convert2hboot
	bcs,a	%icc,	loop_3436
loop_3435:
	call	loop_3437
	call	loop_3438
	call	loop_3439
loop_3436:
	nop
	setx loop_3440, %l0, %l1
	jmpl %l1, %l4
loop_3437:
	sethi	0x14C0,	%o7
loop_3438:
	movrlez	%o4,	0x142,	%l1
loop_3439:
	sub	%g1,	0x111D,	%l2
loop_3440:
	call	loop_3441
	nop
	setx	0x0581,	%l0,	%i5
	udiv	%o2,	%i5,	%g2
	call	loop_3442
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_3441:
	call	loop_3443
	addcc	%i0,	0x1DB4,	%g6
loop_3442:
	call	loop_3444
	fabss	%f5,	%f5
loop_3443:
	nop
	fitos	%f8,	%f12
	fstoi	%f12,	%f10
	fpack32	%f12,	%f6,	%f14
loop_3444:
	call	loop_3445
	nop 	! 	rdpr	%tl,	%l5 changed by convert2hboot
	call	loop_3446
	call	loop_3447
loop_3445:
	call	loop_3448
	nop 	! 	tpos	%icc,	0x44 changed by convert2hboot
loop_3446:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x11,	%asi changed by convert2hboot
loop_3447:
	call	loop_3449
loop_3448:
	call	loop_3450
	call	loop_3451
	call	loop_3452
loop_3449:
	fcmpgt16	%f16,	%f16,	%i7
loop_3450:
	call	loop_3453
loop_3451:
	lduw	[%l7 + 0x48],	%i4
loop_3452:
	subccc	%g4,	0x1AFA,	%o1
	call	loop_3454
loop_3453:
	call	loop_3455
	nop 	! 	rdhpr	%htba,	%l0 changed by convert2hboot
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
loop_3454:
	call	loop_3456
loop_3455:
	call	loop_3457
	nop 	! 	tn	%xcc,	0x40 changed by convert2hboot
	movrlz	%i3,	0x2E0,	%o5
loop_3456:
	fbg	%fcc0,	loop_3458
loop_3457:
	call	loop_3459
	edge16ln	%i2,	%l6,	%o6
	call	loop_3460
loop_3458:
	xor	%i6,	0x00CB,	%o0
loop_3459:
	nop 	! 	tvc	%icc,	0x74 changed by convert2hboot
	movneg	%icc,	0x21B,	%g5
loop_3460:
	nop
	set	0x14, %o6
	sth	%o3,	[%l7 + %o6]
	call	loop_3461
	edge8l	%g3,	%l4,	%o7
	call	loop_3462
	nop 	! 	tsubcc	%o4,	%l3,	%l1 changed by convert2hboot
loop_3461:
	call	loop_3463
	umul	%g1,	%o2,	%i5
loop_3462:
	nop 	! 	tvc	%icc,	0x36 changed by convert2hboot
	call	loop_3464
loop_3463:
	xor	%g2,	%l2,	%g6
	rd	%sys_tick_cmpr,	%i0
	wr	%g0,	0x0,	%pcr	! 	wr	%i1,	0x0D07,	%ccr changed by convert2hboot
loop_3464:
	fmovdule	%fcc1,	%f24,	%f10
	fmovsvc	%icc,	%f19,	%f31
	edge8n	%i7,	%l5,	%i4
	nop 	! 	tle	%icc,	0x59 changed by convert2hboot
	nop
	nop
	setx	0x0D0D3F2E7A6149AD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xEA5C132D1A25E372,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f30,	%f26
	call	loop_3465
	edge32ln	%o1,	%l0,	%g7
	fnands	%f18,	%f0,	%f26
	call	loop_3466
loop_3465:
	call	loop_3467
	faligndata	%f12,	%f18,	%f4
	call	loop_3468
loop_3466:
	nop 	! 	tcc	%xcc,	0x3d changed by convert2hboot
loop_3467:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x88,	%asi changed by convert2hboot
loop_3468:
	fmovsa	%icc,	%f7,	%f2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x04,	%asi changed by convert2hboot
	sdivx	%i3,	0x0C61,	%l6
	nop 	! 	tne	%xcc,	0x51 changed by convert2hboot
	movrlez	%o6,	0x384,	%o0
	call	loop_3469
	ble	%xcc,	loop_3470
	movo	%fcc2,	%i6,	%g5
	nop 	! 	tleu	%icc,	0x42 changed by convert2hboot
loop_3469:
	call	loop_3471
loop_3470:
	ble,a,pn	%xcc,	loop_3472
	edge16	%g3,	%l4,	%o7
	fbule,a	%fcc3,	loop_3473
loop_3471:
	call	loop_3474
loop_3472:
	fmovdgu	%icc,	%f8,	%f20
	stx	%o4,	[%l7 + 0x70]
loop_3473:
	srl	%l3,	%o3,	%g1
loop_3474:
	array16	%l1,	%o2,	%i5
	fmul8ulx16	%f20,	%f12,	%f20
	srax	%g2,	%l2,	%g6
	call	loop_3475
	sllx	%i0,	%i7,	%i1
	fmovspos	%xcc,	%f25,	%f17
	nop
	set	0x42, %g7
	lduh	[%l7 + %g7],	%i4
loop_3475:
	mulx	%o1,	0x03B8,	%l0
	ldstub	[%l7 + 0x43],	%l5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xDA2, 	%hsys_tick_cmpr changed by convert2hboot
	fbne,a	%fcc0,	loop_3476
	be,a	%icc,	loop_3477
	call	loop_3478
	movvc	%icc,	0x6F0,	%o5
loop_3476:
	edge8l	%i2,	%g7,	%l6
loop_3477:
	call	loop_3479
loop_3478:
	call	loop_3480
	call	loop_3481
	movgu	%xcc,	%o6,	%o0
loop_3479:
	wr	%g0,	0x0,	%pcr	! 	wr	%i3,	%g5,	%y changed by convert2hboot
loop_3480:
	nop
	setx	0x0DE6,	%l0,	%i6
	sdivx	%g3,	%i6,	%l4
loop_3481:
	rdpr	%canrestore,	%o4
	fexpand	%f25,	%f12
	orn	%o7,	%o3,	%l3
	fandnot2s	%f3,	%f19,	%f21
	fmuld8ulx16	%f2,	%f21,	%f2
	call	loop_3482
	fpadd32	%f4,	%f6,	%f8
	movneg	%xcc,	0x2D1,	%g1
	call	loop_3483
loop_3482:
	fones	%f18
	call	loop_3484
	call	loop_3485
loop_3483:
	fpadd16s	%f30,	%f2,	%f11
	brnz,pt	%o2,	loop_3486
loop_3484:
	orncc	%i5,	0x1160,	%g2
loop_3485:
	movn	%icc,	0x6F2,	%l1
	bg	%xcc,	loop_3487
loop_3486:
	call	loop_3488
	nop
	nop
	setx	0xC6E6DF75,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x33A46433,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f2,	%f25
	bvs,a	%xcc,	loop_3489
loop_3487:
	fmuld8sux16	%f13,	%f6,	%f0
loop_3488:
	call	loop_3490
	call	loop_3491
loop_3489:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_3492
loop_3490:
	bmask	%g6,	%i0,	%i7
loop_3491:
	nop
	nop
	setx	0xAA162EB5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x68A51043,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f14,	%f6
	move	%fcc2,	%i1,	%i4
loop_3492:
	nop
	fitod	%f2,	%f14
	fdtoi	%f14,	%f23
	nop 	! 	tsubcctv	%l2,	%o1,	%l0 changed by convert2hboot
	call	loop_3493
	sll	%l5,	%g4,	%o5
	call	loop_3494
	subcc	%g7,	%l6,	%i2
loop_3493:
	call	loop_3495
	brlez	%o0,	loop_3496
loop_3494:
	call	loop_3497
	srax	%i3,	%o6,	%g3
loop_3495:
	nop 	! 	taddcctv	%g5,	%l4,	%o4 changed by convert2hboot
loop_3496:
	call	loop_3498
loop_3497:
	movgu	%xcc,	%i6,	%o7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xC8F, 	%hsys_tick_cmpr changed by convert2hboot
	movue	%fcc3,	%o2,	%i5
loop_3498:
	fpackfix	%f12,	%f22
	fmovso	%fcc1,	%f28,	%f14
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x89,	%asi changed by convert2hboot
	nop 	! 	tsubcctv	%l1,	%g2,	%g6 changed by convert2hboot
	call	loop_3499
	nop
	nop
	setx	0xC07E0296F063D000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	edge8ln	%i7,	%i0,	%i1
	call	loop_3500
loop_3499:
	call	loop_3501
	rdpr	%pil,	%l2
	mulx	%i4,	0x1B46,	%o1
loop_3500:
	movgu	%icc,	0x5CC,	%l0
loop_3501:
	nop 	! 	te	%icc,	0x73 changed by convert2hboot
	movuge	%fcc3,	%l5,	%g4
	membar	0x6F
	call	loop_3502
	fmovsge	%fcc2,	%f14,	%f9
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr	%g0,	0x0,	%pcr	! 	wr 	%l0, 	%g0, 	%sys_tick_cmpr changed by convert2hboot
	call	loop_3503
loop_3502:
	call	loop_3504
	orcc	%l6,	0x126B,	%i2
	fmovslg	%fcc3,	%f4,	%f26
loop_3503:
	call	loop_3505
loop_3504:
	call	loop_3506
	for	%f20,	%f26,	%f12
	wr	%g0,	0x0,	%pcr	! 	wr	%o0,	0x0436,	%sys_tick changed by convert2hboot
loop_3505:
	bg,a,pn	%icc,	loop_3507
loop_3506:
	movrgez	%i3,	%g7,	%o6
	call	loop_3508
	bg,pt	%icc,	loop_3509
loop_3507:
	movgu	%icc,	0x11A,	%g3
	call	loop_3510
loop_3508:
	call	loop_3511
loop_3509:
	edge32	%l4,	%o4,	%g5
	mulscc	%o7,	%i6,	%l3
loop_3510:
	nop
	set	0x28, %o0
	ldsh	[%l7 + %o0],	%o2
loop_3511:
	nop
	set	0x28, %i1
	std	%f4,	[%l7 + %i1]
	call	loop_3512
	wrpr 	%g0, 	0x1, 	%gl
	addc	%l1,	0x0E90,	%o3
	call	loop_3513
loop_3512:
	fones	%f10
	call	loop_3514
	ldsw	[%l7 + 0x68],	%g6
loop_3513:
	fcmple32	%f24,	%f2,	%i7
	call	loop_3515
loop_3514:
	prefetch	[%l7 + 0x14],	 0
	mulx	%i0,	0x1678,	%g2
	orncc	%l2,	%i4,	%i1
loop_3515:
	andncc	%l0,	0x1DAC,	%l5
	ldsh	[%l7 + 0x2A],	%o1
	movg	%icc,	0x4A6,	%g4
	wr	%g0,	0x0,	%pcr	! 	wr	%o5,	%i2,	%clear_softint changed by convert2hboot
	movgu	%xcc,	0x0CB,	%l6
	call	loop_3516
	movleu	%icc,	0x1C0,	%i3
	call	loop_3517
	call	loop_3518
loop_3516:
	fnot1s	%f24,	%f9
	call	loop_3519
loop_3517:
	call	loop_3520
loop_3518:
	mulx	%o0,	%o6,	%g3
	popc	0x0928,	%g7
loop_3519:
	call	loop_3521
loop_3520:
	bmask	%l4,	%g5,	%o4
	nop 	! 	rdhpr	%hpstate,	%o7 changed by convert2hboot
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
loop_3521:
	call	loop_3522
	call	loop_3523
	wrpr	%o2,	0x0153,	%pil
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x853, 	%hsys_tick_cmpr changed by convert2hboot
loop_3522:
	nop
	set	0x2D, %i2
	nop	 ! 	ldsba	[%l7 + %i2] 0x11,	%g1 ASI use replaced by convert2hboot
loop_3523:
	ble,pt	%xcc,	loop_3524
	call	loop_3525
	edge32l	%g6,	%i7,	%i0
	nop 	! 	rdhpr	%ver,	%g2 changed by convert2hboot
loop_3524:
	movge	%fcc0,	0x2CD,	%o3
loop_3525:
	subcc	%i4,	0x170F,	%l2
	call	loop_3526
	edge16n	%l0,	%l5,	%o1
	rd	%asi,	%i1
	movre	%g4,	%i2,	%o5
loop_3526:
	call	loop_3527
	call	loop_3528
	call	loop_3529
	call	loop_3530
loop_3527:
	fandnot2	%f18,	%f26,	%f12
loop_3528:
	nop 	! 	rdhpr	%hpstate,	%l6 changed by convert2hboot
loop_3529:
	nop 	! 	ta	%xcc,	0x5f changed by convert2hboot
loop_3530:
	nop
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x0c,	%asi changed by convert2hboot
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%o0 changed by convert2hboot
	bpos	%xcc,	loop_3531
	nop
	fitos	%f0,	%f29
	fstoi	%f29,	%f5
	call	loop_3532
	sethi	0x071F,	%o6
loop_3531:
	be,pt	%xcc,	loop_3533
	nop
	nop
	setx	0x10D5817EACB4A471,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xADFB6B2E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsmuld	%f26,	%f18,	%f12
loop_3532:
	movn	%xcc,	0x2D6,	%g3
	nop 	! 	tneg	%icc,	0x48 changed by convert2hboot
loop_3533:
	movne	%xcc,	%g7,	%l4
	call	loop_3534
	fbule,a	%fcc0,	loop_3535
	movleu	%xcc,	0x1EB,	%g5
	movule	%fcc3,	0x06D,	%o7
loop_3534:
	call	loop_3536
loop_3535:
	nop 	! 	tvc	%icc,	0x53 changed by convert2hboot
	umulcc	%l3,	0x1553,	%i6
	xnor	%o4,	%o2,	%l1
loop_3536:
	call	loop_3537
	andncc	%i5,	%g6,	%i7
	call	loop_3538
	umul	%g1,	%g2,	%i0
loop_3537:
	umul	%i4,	0x16F0,	%l2
	nop
	setx	0x1E7C,	%l0,	%l5
	udivcc	%o3,	%l5,	%l0
loop_3538:
	call	loop_3539
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movge	%xcc,	0x228,	%i1
	for	%f6,	%f10,	%f14
loop_3539:
	movlg	%fcc2,	%o1,	%i2
	fmul8x16al	%f26,	%f31,	%f6
	nop
	fitod	%f10,	%f8
	fdtos	%f8,	%f24
	fbug,a	%fcc0,	loop_3540
	call	loop_3541
	fmovde	%icc,	%f4,	%f16
	rd	%sys_tick_cmpr,	%g4
loop_3540:
	call	loop_3542
loop_3541:
	mova	%xcc,	%o5,	%i3
	fbule,a,pn	%fcc2,	loop_3543
	nop 	! 	taddcctv	%l6,	0x6d,	%o6 changed by convert2hboot
loop_3542:
	bgu,a	%icc,	loop_3544
	wr	%g0,	0x0,	%pcr	! 	wr	%g3,	%o0,	%ccr changed by convert2hboot
loop_3543:
	nop 	! 	tvs	%xcc,	0x76 changed by convert2hboot
	call	loop_3545
loop_3544:
	smul	%l4,	0x094A,	%g5
	nop 	! 	tle	%icc,	0x7a changed by convert2hboot
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x81,	%asi changed by convert2hboot
loop_3545:
	movgu	%xcc,	%l3,	%i6
	subccc	%g7,	%o4,	%o2
	call	loop_3546
	movcc	%icc,	0x0E0,	%l1
	nop
	nop
	setx	0x96AB2577DA963FAC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xF2EA3C045BCBF679,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f0,	%f10
	call	loop_3547
loop_3546:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_3548
	bl	%icc,	loop_3549
loop_3547:
	call	loop_3550
	nop 	! 	tge	%icc,	0x38 changed by convert2hboot
loop_3548:
	call	loop_3551
loop_3549:
	fand	%f18,	%f0,	%f30
loop_3550:
	sra	%i5,	%i7,	%g1
	call	loop_3552
loop_3551:
	call	loop_3553
	call	loop_3554
	call	loop_3555
loop_3552:
	wrpr 	%g0, 	0x2, 	%gl
loop_3553:
	nop
	setx	0x1721,	%l0,	%g2
	sdivx	%i0,	%g2,	%l2
loop_3554:
	lduw	[%l7 + 0x08],	%i4
loop_3555:
	call	loop_3556
	call	loop_3557
	nop
	nop
	setx	0x6AF1E3F21A4FE282,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xB328617EA0517B71,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f2,	%f28
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x64F, 	%hsys_tick_cmpr changed by convert2hboot
loop_3556:
	nop 	! 	tsubcctv	%l0,	0x55,	%o3 changed by convert2hboot
loop_3557:
	call	loop_3558
	call	loop_3559
	call	loop_3560
	call	loop_3561
loop_3558:
	movrlz	%i1,	%i2,	%o1
loop_3559:
	call	loop_3562
loop_3560:
	call	loop_3563
loop_3561:
	srax	%g4,	%o5,	%i3
	fmul8x16au	%f21,	%f20,	%f10
loop_3562:
	call	loop_3564
loop_3563:
	nop 	! 	tvc	%xcc,	0x6c changed by convert2hboot
	andn	%o6,	%l6,	%g3
	and	%o0,	%l4,	%g5
loop_3564:
	call	loop_3565
	movrlez	%o7,	%l3,	%i6
	fblg	%fcc3,	loop_3566
	call	loop_3567
loop_3565:
	movrgz	%o4,	0x2FE,	%o2
	call	loop_3568
loop_3566:
	movrlez	%g7,	0x217,	%l1
loop_3567:
	bmask	%i5,	%i7,	%g1
	nop 	! 	tpos	%icc,	0x66 changed by convert2hboot
loop_3568:
	smul	%g6,	%i0,	%l2
	nop
	set	0x5C, %i0
	stw	%g2,	[%l7 + %i0]
	call	loop_3569
	bcs,pt	%xcc,	loop_3570
	andn	%i4,	0x1F0E,	%l5
	call	loop_3571
loop_3569:
	rdpr	%gl,	%o3
loop_3570:
	call	loop_3572
	nop 	! 	ta	%xcc,	0x39 changed by convert2hboot
loop_3571:
	flushw
	udivx	%i1,	0x0A1F,	%l0
loop_3572:
	movl	%fcc2,	%o1,	%g4
	faligndata	%f22,	%f0,	%f2
	fmovrsne	%i2,	%f5,	%f18
	alignaddr	%o5,	%i3,	%l6
	movrgz	%g3,	0x1A2,	%o0
	bgu,a,pt	%icc,	loop_3573
	call	loop_3574
	call	loop_3575
	umulcc	%o6,	0x1FCF,	%l4
loop_3573:
	call	loop_3576
loop_3574:
	nop
	fitos	%f23,	%f18
loop_3575:
	edge16n	%g5,	%o7,	%i6
	rd	%tick_cmpr,	%o4
loop_3576:
	call	loop_3577
	array16	%l3,	%o2,	%l1
	call	loop_3578
	sethi	0x1629,	%i5
loop_3577:
	nop
	nop
	setx	0x0D97F69CE87832A6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x0CD232B3E90DBA0D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f14,	%f6
	call	loop_3579
loop_3578:
	nop 	! 	tleu	%xcc,	0x4b changed by convert2hboot
	fmovdle	%fcc0,	%f30,	%f8
	call	loop_3580
loop_3579:
	wr	%g0,	0x0,	%pcr	! 	wr	%i7,	%g7,	%set_softint changed by convert2hboot
	nop
	setx	loop_3581,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x024400001403,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	call	loop_3582
loop_3580:
	for	%f16,	%f4,	%f28
	call	loop_3583
loop_3581:
	fnand	%f14,	%f4,	%f20
loop_3582:
	rdpr	%wstate,	%g1
	movpos	%icc,	0x473,	%g6
loop_3583:
	call	loop_3584
	orcc	%l2,	0x1A3F,	%i0
	brgez,a,pn	%g2,	loop_3585
	andncc	%l5,	%o3,	%i4
loop_3584:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xA0D, 	%hsys_tick_cmpr changed by convert2hboot
	nop 	! 	tn	%xcc,	0x6b changed by convert2hboot
loop_3585:
	nop	!	sir	0x1063 !! sir is illegal now
	edge16	%i1,	%g4,	%i2
	subccc	%o5,	%i3,	%o1
	movrne	%l6,	%g3,	%o0
	orncc	%l4,	%o6,	%o7
	call	loop_3586
	call	loop_3587
	call	loop_3588
	sll	%g5,	0x19,	%o4
loop_3586:
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x5, 	%fprs changed by convert2hboot
loop_3587:
	fbl,a	%fcc1,	loop_3589
loop_3588:
	xorcc	%l3,	0x05D7,	%l1
	call	loop_3590
	call	loop_3591
loop_3589:
	movule	%fcc3,	0x73C,	%i5
	call	loop_3592
loop_3590:
	add	%i7,	0x1F2F,	%o2
loop_3591:
	fmovscc	%icc,	%f12,	%f8
	nop 	! 	rdhpr	%hpstate,	%g7 changed by convert2hboot
loop_3592:
	call	loop_3593
	nop
	set	0x30, %g1
	ldub	[%l7 + %g1],	%g6
	smulcc	%g1,	0x0A93,	%i0
	smul	%l2,	0x1726,	%g2
loop_3593:
	call	loop_3594
	call	loop_3595
	movlg	%fcc3,	%l5,	%i4
	nop 	! 	tn	%icc,	0x75 changed by convert2hboot
loop_3594:
	ba,pn	%icc,	loop_3596
loop_3595:
	ldsh	[%l7 + 0x28],	%l0
	call	loop_3597
	call	loop_3598
loop_3596:
	call	loop_3599
	call	loop_3600
loop_3597:
	call	loop_3601
loop_3598:
	call	loop_3602
loop_3599:
	call	loop_3603
loop_3600:
	call	loop_3604
loop_3601:
	fblg,a,pt	%fcc3,	loop_3605
loop_3602:
	call	loop_3606
loop_3603:
	nop 	! 	tg	%xcc,	0x3c changed by convert2hboot
loop_3604:
	rd	%asi,	%o3
loop_3605:
	nop 	! 	tvs	%icc,	0x74 changed by convert2hboot
loop_3606:
	orn	%g4,	0x1402,	%i2
	call	loop_3607
	call	loop_3608
	rd	%tick_cmpr,	%i1
	alignaddrl	%o5,	%o1,	%l6
loop_3607:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x81,	%asi changed by convert2hboot
loop_3608:
	udiv	%o0,	0x04C6,	%l4
	wrpr	%o6,	%o7,	%pil
	movue	%fcc1,	%g5,	%i6
	fxnors	%f3,	%f23,	%f26
	call	loop_3609
	call	loop_3610
	nop	!	sir	0x184E !! sir is illegal now
	call	loop_3611
loop_3609:
	fpsub32s	%f24,	%f20,	%f0
loop_3610:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	call	loop_3612
loop_3611:
	andn	%i5,	0x072B,	%i7
	sllx	%l3,	%o2,	%g7
	fbne	%fcc2,	loop_3613
loop_3612:
	nop 	! 	tsubcctv	%g1,	0x5c,	%i0 changed by convert2hboot
	call	loop_3614
	call	loop_3615
loop_3613:
	edge16l	%l2,	%g2,	%l5
	call	loop_3616
loop_3614:
	movrlz	%i4,	0x324,	%g6
loop_3615:
	call	loop_3617
	bmask	%l0,	%o3,	%i2
loop_3616:
	call	loop_3618
	nop
	nop
	setx	0x9E291D686C262F0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xD991B38400F917FA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f28,	%f28
loop_3617:
	alignaddr	%g4,	%o5,	%o1
	nop 	! 	tcs	%icc,	0x3a changed by convert2hboot
loop_3618:
	nop 	! 	tn	%xcc,	0x5d changed by convert2hboot
	call	loop_3619
	brlez,a,pn	%l6,	loop_3620
	call	loop_3621
	movne	%fcc3,	%g3,	%i3
loop_3619:
	movle	%icc,	0x113,	%o0
loop_3620:
	sethi	0x0AAE,	%l4
loop_3621:
	sllx	%o6,	0x07,	%i1
	call	loop_3622
	andcc	%g5,	0x0042,	%i6
	edge32ln	%o4,	%o7,	%l1
	call	loop_3623
loop_3622:
	call	loop_3624
	nop 	! 	tvs	%icc,	0x7c changed by convert2hboot
	wr	%g0,	0x0,	%pcr	! 	wr	%i5,	%i7,	%pic changed by convert2hboot
loop_3623:
	movneg	%xcc,	0x071,	%o2
loop_3624:
	nop
	fitod	%f6,	%f20
	fdtoi	%f20,	%f19
	umul	%l3,	%g1,	%g7
	fmovde	%icc,	%f22,	%f8
	fabss	%f9,	%f2
	call	loop_3625
	move	%fcc3,	%l2,	%g2
	call	loop_3626
	addc	%l5,	0x06D0,	%i4
loop_3625:
	nop
	setx	loop_3627,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x002100001403,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
	call	loop_3628
loop_3626:
	call	loop_3629
	call	loop_3630
loop_3627:
	nop 	! 	tsubcctv	%i0,	0x48,	%g6 changed by convert2hboot
loop_3628:
	call	loop_3631
loop_3629:
	call	loop_3632
loop_3630:
	call	loop_3633
	nop 	! 	tne	%icc,	0x36 changed by convert2hboot
loop_3631:
	srl	%o3,	%i2,	%g4
loop_3632:
	movre	%l0,	%o5,	%o1
loop_3633:
	nop
	nop
	setx	0xFD620CC6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x9698F9CB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f20,	%f8
	call	loop_3634
	call	loop_3635
	nop
	setx	0x0978,	%l0,	%l6
	sdivx	%g3,	%l6,	%i3
	movre	%l4,	0x090,	%o6
loop_3634:
	call	loop_3636
loop_3635:
	call	loop_3637
	nop
	nop
	setx	0x56132C03,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xA880F500,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f28,	%f13
	nop
	setx	0x163F,	%l0,	%g5
	sdivx	%o0,	%g5,	%i1
loop_3636:
	array32	%o4,	%o7,	%l1
loop_3637:
	wr	%g0,	0x0,	%pcr	! 	wr	%i6,	0x05CB,	%sys_tick changed by convert2hboot
	call	loop_3638
	nop 	! 	tsubcc	%i7,	%i5,	%l3 changed by convert2hboot
	call	loop_3639
	call	loop_3640
loop_3638:
	move	%icc,	0x678,	%o2
	fzeros	%f4
loop_3639:
	movue	%fcc2,	%g7,	%g1
loop_3640:
	edge32l	%g2,	%l5,	%l2
	array8	%i0,	%i4,	%g6
	call	loop_3641
	call	loop_3642
	fzeros	%f9
	call	loop_3643
loop_3641:
	mulx	%i2,	0x108A,	%g4
loop_3642:
	fmovrse	%o3,	%f31,	%f6
	movrlez	%o5,	0x062,	%l0
loop_3643:
	call	loop_3644
	call	loop_3645
	movrlz	%g3,	%l6,	%o1
	call	loop_3646
loop_3644:
	bcs	%xcc,	loop_3647
loop_3645:
	call	loop_3648
	ba,a	%xcc,	loop_3649
loop_3646:
	fornot2	%f26,	%f28,	%f16
loop_3647:
	srax	%i3,	%l4,	%o6
loop_3648:
	nop
	setx	0x01F9,	%l0,	%i1
	udivx	%o0,	%i1,	%g5
loop_3649:
	nop
	set	0x7E, %g6
	nop	 ! 	ldsha	[%l7 + %g6] 0x81,	%o4 ASI use replaced by convert2hboot
	call	loop_3650
	addc	%o7,	0x0BA9,	%i6
	addccc	%i7,	0x14FB,	%i5
	bne,pn	%icc,	loop_3651
loop_3650:
	call	loop_3652
	call	loop_3653
	call	loop_3654
loop_3651:
	fbuge,pt	%fcc0,	loop_3655
loop_3652:
	call	loop_3656
loop_3653:
	call	loop_3657
loop_3654:
	fmovsuge	%fcc1,	%f8,	%f28
loop_3655:
	call	loop_3658
loop_3656:
	fcmpes	%fcc1,	%f9,	%f23
loop_3657:
	call	loop_3659
	orncc	%l3,	%o2,	%g7
loop_3658:
	rd	%tick_cmpr,	%g1
	call	loop_3660
loop_3659:
	movneg	%icc,	0x070,	%l1
	nop 	! 	tgu	%icc,	0x65 changed by convert2hboot
	edge32l	%g2,	%l5,	%l2
loop_3660:
	fpsub32s	%f26,	%f28,	%f14
	array8	%i0,	%i4,	%i2
	call	loop_3661
	popc	%g6,	%o3
	add	%o5,	%l0,	%g4
	call	loop_3662
loop_3661:
	call	loop_3663
	call	loop_3664
	call	loop_3665
loop_3662:
	srax	%g3,	0x11,	%o1
loop_3663:
	call	loop_3666
loop_3664:
	fmovrsgez	%l6,	%f13,	%f6
loop_3665:
	call	loop_3667
	call	loop_3668
loop_3666:
	movrgz	%l4,	0x1B7,	%i3
	call	loop_3669
loop_3667:
	ldsw	[%l7 + 0x18],	%o6
loop_3668:
	sllx	%o0,	0x11,	%i1
	fmovrde	%g5,	%f20,	%f8
loop_3669:
	movug	%fcc3,	0x21D,	%o7
	fors	%f7,	%f1,	%f31
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	edge16ln	%i5,	%l3,	%i7
	call	loop_3670
	ble	%xcc,	loop_3671
	movgu	%icc,	0x7F7,	%g7
	nop
	nop
	setx	0x4F3ED99F34744C86,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x052412DECE213635,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f28,	%f2
loop_3670:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
loop_3671:
	fxnor	%f26,	%f22,	%f12
	movrgez	%g1,	0x3AE,	%g2
	alignaddr	%l2,	%l5,	%i0
	call	loop_3672
	fnors	%f17,	%f4,	%f30
	fandnot1s	%f9,	%f23,	%f6
	edge32n	%i2,	%i4,	%o3
loop_3672:
	call	loop_3673
	be,a	%xcc,	loop_3674
	call	loop_3675
	and	%g6,	%o5,	%l0
loop_3673:
	call	loop_3676
loop_3674:
	rd	%pc,	%g3
loop_3675:
	call	loop_3677
	or	%g4,	0x05F8,	%l6
loop_3676:
	call	loop_3678
	call	loop_3679
loop_3677:
	call	loop_3680
	nop 	! 	tvc	%icc,	0x7f changed by convert2hboot
loop_3678:
	fbue,a,pn	%fcc3,	loop_3681
loop_3679:
	call	loop_3682
loop_3680:
	sdivx	%l4,	0x195B,	%o1
	fmovsa	%xcc,	%f23,	%f16
loop_3681:
	fmovrdgz	%i3,	%f8,	%f28
loop_3682:
	movrne	%o6,	%i1,	%g5
	call	loop_3683
	fmovdle	%icc,	%f24,	%f30
	movrlz	%o0,	0x363,	%o7
	movleu	%icc,	0x377,	%o4
loop_3683:
	call	loop_3684
	edge16ln	%i6,	%l3,	%i5
	call	loop_3685
	fbn,pn	%fcc1,	loop_3686
loop_3684:
	call	loop_3687
	nop 	! 	tneg	%icc,	0x36 changed by convert2hboot
loop_3685:
	call	loop_3688
loop_3686:
	sll	%g7,	%i7,	%o2
loop_3687:
	wr	%g0,	0x0,	%pcr	! 	wr	%l1,	0x1665,	%softint changed by convert2hboot
	call	loop_3689
loop_3688:
	edge16n	%g1,	%g2,	%l2
	movule	%fcc1,	0x1D2,	%i0
	call	loop_3690
loop_3689:
	smulcc	%i2,	0x1932,	%i4
	sdivcc	%l5,	0x0117,	%o3
	fmovsa	%fcc3,	%f4,	%f8
loop_3690:
	call	loop_3691
	call	loop_3692
	and	%o5,	0x0F7C,	%l0
	call	loop_3693
loop_3691:
	addcc	%g6,	0x06AA,	%g3
loop_3692:
	call	loop_3694
	nop 	! 	rdhpr	%ver,	%l6 changed by convert2hboot
loop_3693:
	wrpr 	%g0, 	0x0, 	%gl
	fbl	%fcc3,	loop_3695
loop_3694:
	call	loop_3696
	call	loop_3697
	call	loop_3698
loop_3695:
	mulscc	%o1,	%l4,	%o6
loop_3696:
	fpsub32	%f22,	%f8,	%f12
loop_3697:
	call	loop_3699
loop_3698:
	alignaddr	%i3,	%i1,	%g5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xBE8, 	%hsys_tick_cmpr changed by convert2hboot
	fcmple16	%f22,	%f28,	%o7
loop_3699:
	call	loop_3700
	edge16n	%l3,	%i5,	%g7
	edge32	%i7,	%i6,	%l1
	fmovdlg	%fcc0,	%f0,	%f16
loop_3700:
	brlz,a,pn	%o2,	loop_3701
	fzero	%f20
	add	%g2,	%g1,	%i0
	call	loop_3702
loop_3701:
	nop 	! 	tleu	%xcc,	0x53 changed by convert2hboot
	fbo	%fcc1,	loop_3703
	movre	%l2,	%i2,	%l5
loop_3702:
	nop
	setx	loop_3704,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x021200001407,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	sub	%o3,	%i4,	%o5
loop_3703:
	call	loop_3705
	fmovda	%fcc3,	%f18,	%f30
loop_3704:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	call	loop_3706
loop_3705:
	call	loop_3707
	nop 	! 	tl	%xcc,	0x64 changed by convert2hboot
	movcs	%icc,	0x718,	%l6
loop_3706:
	fbul	%fcc0,	loop_3708
loop_3707:
	call	loop_3709
	nop 	! 	tcs	%xcc,	0x5c changed by convert2hboot
	call	loop_3710
loop_3708:
	call	loop_3711
loop_3709:
	call	loop_3712
	fsrc1	%f20,	%f2
loop_3710:
	call	loop_3713
loop_3711:
	call	loop_3714
loop_3712:
	call	loop_3715
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_3713:
	call	loop_3716
loop_3714:
	call	loop_3717
loop_3715:
	movcs	%xcc,	%g4,	%o1
	nop 	! 	rdhpr	%ver,	%g3 changed by convert2hboot
loop_3716:
	movne	%fcc0,	%l4,	%i3
loop_3717:
	fba,a	%fcc0,	loop_3718
	nop 	! 	tcs	%icc,	0x51 changed by convert2hboot
	call	loop_3719
	bn,a	%xcc,	loop_3720
loop_3718:
	nop 	! 	tpos	%xcc,	0x5f changed by convert2hboot
	nop	!	sir	0x0BC6 !! sir is illegal now
loop_3719:
	edge8l	%o6,	%i1,	%o0
loop_3720:
	rd	%pc,	%g5
	orcc	%o4,	0x0116,	%l3
	nop
	set	0x0E, %o7
	ldsb	[%l7 + %o7],	%o7
	nop
	set	0x58, %i3
	std	%g6,	[%l7 + %i3]
	fbue,a,pt	%fcc1,	loop_3721
	andcc	%i5,	0x1035,	%i7
	call	loop_3722
	wr	%g0,	0x0,	%pcr	! 	wr	%l1,	%o2,	%set_softint changed by convert2hboot
loop_3721:
	edge32l	%i6,	%g1,	%g2
	call	loop_3723
loop_3722:
	movgu	%icc,	%i0,	%l2
	call	loop_3724
	flush	%l7 + 0x14
loop_3723:
	fmovduge	%fcc3,	%f0,	%f26
	or	%l5,	%i2,	%o3
loop_3724:
	fmovrdne	%o5,	%f8,	%f22
	fmovdul	%fcc2,	%f8,	%f26
	call	loop_3725
	call	loop_3726
	movgu	%xcc,	%g6,	%l0
	set	0x28, %i5
	nop	 ! 	stda	%i4,	[%l7 + %i5] 0x88 ASI use replaced by convert2hboot
loop_3725:
	call	loop_3727
loop_3726:
	call	loop_3728
	fones	%f23
	sth	%g4,	[%l7 + 0x1C]
loop_3727:
	call	loop_3729
loop_3728:
	fbue,a	%fcc3,	loop_3730
	fmovsue	%fcc3,	%f16,	%f30
	call	loop_3731
loop_3729:
	bvs,pt	%xcc,	loop_3732
loop_3730:
	call	loop_3733
	be,a	%xcc,	loop_3734
loop_3731:
	wrpr 	%g0, 	0x3, 	%gl
loop_3732:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
loop_3733:
	fbne,pn	%fcc0,	loop_3735
loop_3734:
	fmovsule	%fcc0,	%f15,	%f20
	subc	%o1,	0x191C,	%o6
	call	loop_3736
loop_3735:
	nop 	! 	te	%xcc,	0x4a changed by convert2hboot
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x693, 	%hsys_tick_cmpr changed by convert2hboot
	edge32n	%o0,	%g5,	%o4
loop_3736:
	call	loop_3737
	call	loop_3738
	nop 	! 	tgu	%icc,	0x60 changed by convert2hboot
	fmovrse	%l3,	%f22,	%f7
loop_3737:
	call	loop_3739
loop_3738:
	movcc	%icc,	%i1,	%g7
	edge16	%o7,	%i7,	%i5
	call	loop_3740
loop_3739:
	fcmpne16	%f30,	%f0,	%l1
	nop 	! 	tcc	%xcc,	0x4f changed by convert2hboot
	call	loop_3741
loop_3740:
	movrgz	%i6,	0x209,	%g1
	wrpr	%o2,	%i0,	%pil
	movlg	%fcc1,	%l2,	%g2
loop_3741:
	movneg	%xcc,	0x184,	%i2
	bcc	%xcc,	loop_3742
	call	loop_3743
	call	loop_3744
	call	loop_3745
loop_3742:
	call	loop_3746
loop_3743:
	rdpr	%otherwin,	%l5
loop_3744:
	fbg,pn	%fcc0,	loop_3747
loop_3745:
	sub	%o5,	0x1B7A,	%o3
loop_3746:
	movvc	%xcc,	%l0,	%g6
	call	loop_3748
loop_3747:
	xnor	%g4,	%i4,	%l6
	umulcc	%g3,	0x1D4E,	%o1
	nop
	set	0x64, %o4
	prefetch	[%l7 + %o4],	 0
loop_3748:
	wrpr	%o6,	%l4,	%pil
	movrne	%o0,	0x0F4,	%g5
	srlx	%o4,	0x15,	%i3
	bmask	%l3,	%g7,	%i1
	edge32ln	%o7,	%i5,	%i7
	call	loop_3749
	call	loop_3750
	array32	%i6,	%l1,	%o2
	call	loop_3751
loop_3749:
	call	loop_3752
loop_3750:
	ldstub	[%l7 + 0x19],	%g1
	mulscc	%i0,	0x1B8C,	%g2
loop_3751:
	call	loop_3753
loop_3752:
	call	loop_3754
	edge32n	%l2,	%l5,	%i2
	nop 	! 	tle	%icc,	0x61 changed by convert2hboot
loop_3753:
	nop 	! 	rdhpr	%htba,	%o5 changed by convert2hboot
loop_3754:
	nop 	! 	rdhpr	%hpstate,	%l0 changed by convert2hboot
	call	loop_3755
	nop 	! 	ta	%xcc,	0x52 changed by convert2hboot
	addcc	%g6,	%o3,	%g4
	nop
	fitos	%f13,	%f29
	fstox	%f29,	%f26
loop_3755:
	orcc	%l6,	0x0EFB,	%i4
	movrgez	%o1,	0x0D5,	%o6
	fbul,pn	%fcc1,	loop_3756
	call	loop_3757
	nop 	! 	tcc	%icc,	0x68 changed by convert2hboot
	call	loop_3758
loop_3756:
	call	loop_3759
loop_3757:
	udiv	%l4,	0x1272,	%g3
	alignaddrl	%o0,	%o4,	%g5
loop_3758:
	call	loop_3760
loop_3759:
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%l3 changed by convert2hboot
	call	loop_3761
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x7, 	%fprs changed by convert2hboot
loop_3760:
	st	%f23,	[%l7 + 0x74]
	st	%f28,	[%l7 + 0x60]
loop_3761:
	bneg,a	%xcc,	loop_3762
	call	loop_3763
	call	loop_3764
	subccc	%i1,	%i3,	%o7
loop_3762:
	movne	%fcc3,	0x2B4,	%i7
loop_3763:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x81,	%asi changed by convert2hboot
	lda	[%l6] %asi,	%i5
	nop	 ! 	casa	[%l6] 0x81,	%i5,	%i6 ASI use replaced by convert2hboot
loop_3764:
	nop
	fitos	%f4,	%f23
	fstox	%f23,	%f6
	fxtos	%f6,	%f16
	movg	%fcc0,	0x721,	%l1
	sra	%g1,	0x12,	%o2
	fnot2s	%f24,	%f24
	call	loop_3765
	rdpr	%pil,	%i0
	nop 	! 	te	%icc,	0x6a changed by convert2hboot
	add	%g2,	0x155D,	%l5
loop_3765:
	call	loop_3766
	udivcc	%l2,	0x1833,	%i2
	call	loop_3767
	call	loop_3768
loop_3766:
	call	loop_3769
	fcmpne16	%f14,	%f22,	%o5
loop_3767:
	orncc	%l0,	%g6,	%g4
loop_3768:
	edge32l	%o3,	%i4,	%l6
loop_3769:
	rdpr	%cwp,	%o6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x81,	%asi changed by convert2hboot
	call	loop_3770
	mova	%xcc,	0x2DC,	%o1
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_3771
loop_3770:
	fmovslg	%fcc3,	%f26,	%f20
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x81,	%asi changed by convert2hboot
	sta	%f27,	[%l7 + 0x08] %asi
loop_3771:
	call	loop_3772
	nop 	! 	tsubcctv	%g3,	0x76,	%o0 changed by convert2hboot
	call	loop_3773
	xnorcc	%g5,	%l3,	%g7
loop_3772:
	call	loop_3774
	wr	%g0,	0x0,	%pcr	! 	wr	%i1,	%i3,	%set_softint changed by convert2hboot
loop_3773:
	fcmpgt16	%f10,	%f6,	%o4
	movre	%i7,	%o7,	%i6
loop_3774:
	fmovdg	%icc,	%f26,	%f14
	fbge,a,pt	%fcc1,	loop_3775
	nop
	nop
	setx	0x0839D3DA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x3D2AA9AC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f29,	%f16
	set	0x27, %g2
	nop	 ! 	ldstuba	[%l7 + %g2] 0x89,	%l1 ASI use replaced by convert2hboot
loop_3775:
	fsrc1	%f8,	%f8
	call	loop_3776
	nop 	! 	tvc	%xcc,	0x4d changed by convert2hboot
	fnot2	%f10,	%f24
	call	loop_3777
loop_3776:
	movul	%fcc1,	0x52D,	%g1
	nop 	! 	rdhpr	%htba,	%i5 changed by convert2hboot
	lduw	[%l7 + 0x64],	%i0
loop_3777:
	call	loop_3778
	call	loop_3779
	movcs	%xcc,	0x0D8,	%g2
	call	loop_3780
loop_3778:
	nop 	! 	tge	%xcc,	0x40 changed by convert2hboot
loop_3779:
	movgu	%xcc,	0x0BB,	%o2
	fbul	%fcc3,	loop_3781
loop_3780:
	umulcc	%l5,	0x07E9,	%i2
	call	loop_3782
	call	loop_3783
loop_3781:
	movne	%xcc,	%o5,	%l0
	call	loop_3784
loop_3782:
	fcmps	%fcc3,	%f0,	%f2
loop_3783:
	edge8l	%l2,	%g6,	%o3
	call	loop_3785
loop_3784:
	call	loop_3786
	fbg,a	%fcc1,	loop_3787
	nop 	! 	tcs	%xcc,	0x54 changed by convert2hboot
loop_3785:
	nop 	! 	tcs	%icc,	0x6a changed by convert2hboot
loop_3786:
	nop 	! 	rdpr	%tl,	%i4 changed by convert2hboot
loop_3787:
	sdivx	%g4,	0x033A,	%o6
	nop
	setx	0x10A9,	%l0,	%l6
	udivx	%l4,	%l6,	%o1
	movul	%fcc3,	%o0,	%g5
	set	0x10, %l1
	nop	 ! 	stda	%g2,	[%l7 + %l1] 0x81 ASI use replaced by convert2hboot
	call	loop_3788
	call	loop_3789
	call	loop_3790
	bge,pn	%xcc,	loop_3791
loop_3788:
	call	loop_3792
loop_3789:
	nop
	set	0x26, %l0
	lduh	[%l7 + %l0],	%g7
loop_3790:
	nop
	setx	loop_3793,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x032400001407,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
loop_3791:
	call	loop_3794
loop_3792:
	nop
	set	0x64, %i7
	lduw	[%l7 + %i7],	%l3
	orcc	%i1,	0x0895,	%o4
loop_3793:
	nop 	! 	rdhpr	%hpstate,	%i7 changed by convert2hboot
loop_3794:
	nop
	setx	0x0382,	%l0,	%i3
	udiv	%o7,	%i3,	%l1
	fmovsgu	%icc,	%f5,	%f13
	fbn,a,pn	%fcc3,	loop_3795
	call	loop_3796
	movlg	%fcc1,	0x547,	%g1
	call	loop_3797
loop_3795:
	fmovdvc	%xcc,	%f4,	%f14
loop_3796:
	nop 	! 	rdhpr	%htba,	%i5 changed by convert2hboot
	call	loop_3798
loop_3797:
	fmovdn	%fcc2,	%f24,	%f8
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x19,	%asi changed by convert2hboot
	lda	[%l6] %asi,	%i6
loop_3798:
	movl	%icc,	0x131,	%o2
	edge16n	%l5,	%i2,	%o5
	sethi	0x004B,	%l0
	call	loop_3799
	call	loop_3800
	add	%l2,	%g2,	%o3
	rdpr	%cansave,	%g6
loop_3799:
	and	%g4,	%i4,	%o6
loop_3800:
	nop 	! 	tne	%xcc,	0x4e changed by convert2hboot
	mova	%fcc3,	0x4A3,	%l6
	call	loop_3801
	fbo	%fcc3,	loop_3802
	call	loop_3803
	edge16	%l4,	%o0,	%g5
loop_3801:
	movne	%fcc3,	0x400,	%o1
loop_3802:
loop_3803:
	call	loop_3804
	nop 	! 	tsubcc	%g7,	%l3,	%g3 changed by convert2hboot
	movrne	%i1,	%o4,	%o7
	edge16ln	%i7,	%i3,	%g1
loop_3804:
	srlx	%l1,	%i6,	%i5
	bpos	%icc,	loop_3805
	nop 	! 	tg	%icc,	0x53 changed by convert2hboot
	call	loop_3806
	call	loop_3807
loop_3805:
	call	loop_3808
	call	loop_3809
loop_3806:
	movpos	%icc,	0x5C2,	%i0
loop_3807:
	call	loop_3810
loop_3808:
	srax	%l5,	0x11,	%o2
loop_3809:
	call	loop_3811
	fpsub32s	%f25,	%f5,	%f4
loop_3810:
	addcc	%i2,	%l0,	%l2
	srl	%g2,	%o3,	%o5
loop_3811:
	nop 	! 	rdpr	%tl,	%g6 changed by convert2hboot
	call	loop_3812
	call	loop_3813
	call	loop_3814
	stx	%i4,	[%l7 + 0x08]
loop_3812:
	nop
	nop
	setx	0x4B092588C796871D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x0A9AF0E59B9D3F4D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f4,	%f20
loop_3813:
	call	loop_3815
loop_3814:
	call	loop_3816
	rdpr	%otherwin,	%g4
	call	loop_3817
loop_3815:
	call	loop_3818
loop_3816:
	call	loop_3819
	nop
	nop
	setx	0x7C7B80B7988D7FAB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x6264BD6C583D6576,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f8,	%f16
loop_3817:
	call	loop_3820
loop_3818:
	andcc	%l6,	0x0C34,	%l4
loop_3819:
	mulscc	%o6,	%g5,	%o1
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x2f,	%asi changed by convert2hboot
	membar	#Sync
loop_3820:
	nop 	! 	taddcc	%g7,	0x3b,	%g3 changed by convert2hboot
	fbe,a,pn	%fcc1,	loop_3821
	wr	%g0,	0x0,	%pcr	! 	wr	%l3,	%o4,	%y changed by convert2hboot
	fnor	%f12,	%f22,	%f18
	mulx	%o7,	%i1,	%i3
loop_3821:
	std	%f18,	[%l7 + 0x08]
	call	loop_3822
	movgu	%icc,	%i7,	%g1
	call	loop_3823
	call	loop_3824
loop_3822:
	array32	%l1,	%i5,	%i0
	fnot1s	%f15,	%f27
loop_3823:
	brlz	%l5,	loop_3825
loop_3824:
	fmovdneg	%xcc,	%f18,	%f26
	array16	%i6,	%o2,	%l0
	call	loop_3826
loop_3825:
	nop
	setx	0x0288,	%l0,	%g2
	sdiv	%l2,	%g2,	%o3
	set	0x10, %o2
	nop	 ! 	lduha	[%l7 + %o2] 0x81,	%o5 ASI use replaced by convert2hboot
loop_3826:
	call	loop_3827
	movue	%fcc0,	0x47E,	%i2
	add	%i4,	0x071E,	%g4
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x89,	%asi changed by convert2hboot
loop_3827:
	nop 	! 	rdhpr	%hintp,	%l6 changed by convert2hboot
	call	loop_3828
	fnegd	%f6,	%f4
	mulx	%o6,	%g5,	%o1
	call	loop_3829
loop_3828:
	movvs	%xcc,	%o0,	%l4
	fmovsug	%fcc1,	%f1,	%f9
	nop
	nop
	setx	0xB89646D3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f25
loop_3829:
	call	loop_3830
	movcs	%xcc,	%g3,	%l3
	brz	%g7,	loop_3831
	orncc	%o7,	%i1,	%i3
loop_3830:
	call	loop_3832
	call	loop_3833
loop_3831:
	call	loop_3834
	call	loop_3835
loop_3832:
	and	%i7,	%g1,	%o4
loop_3833:
	bmask	%i5,	%i0,	%l1
loop_3834:
	smulcc	%l5,	0x186C,	%o2
loop_3835:
	call	loop_3836
	call	loop_3837
	call	loop_3838
	movo	%fcc1,	%i6,	%l0
loop_3836:
	nop 	! 	taddcctv	%g2,	%o3,	%l2 changed by convert2hboot
loop_3837:
	subccc	%o5,	0x08E1,	%i2
loop_3838:
	movpos	%xcc,	%i4,	%g4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	movcc	%xcc,	0x4B9,	%g5
	sdivcc	%o1,	0x12C8,	%l6
	call	loop_3839
	call	loop_3840
	movne	%fcc1,	%l4,	%o0
	call	loop_3841
loop_3839:
	fmovsug	%fcc0,	%f31,	%f9
loop_3840:
	orncc	%l3,	%g7,	%o7
	lduw	[%l7 + 0x7C],	%i1
loop_3841:
	call	loop_3842
	call	loop_3843
	nop 	! 	rdpr	%tl,	%i3 changed by convert2hboot
	smul	%i7,	%g1,	%o4
loop_3842:
	fmovdle	%fcc1,	%f4,	%f24
loop_3843:
	wrpr	%g3,	0x026F,	%cwp
	call	loop_3844
	nop
	setx loop_3845, %l0, %l1
	jmpl %l1, %i0
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	call	loop_3846
loop_3844:
	ba	%icc,	loop_3847
loop_3845:
	fmul8ulx16	%f30,	%f22,	%f4
	call	loop_3848
loop_3846:
	nop
	nop
	setx	0x662E1A69,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xD0991232,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f28,	%f4
loop_3847:
	umul	%i5,	%l5,	%i6
	edge8l	%l0,	%o2,	%g2
loop_3848:
	nop 	! 	rdhpr	%ver,	%o3 changed by convert2hboot
	call	loop_3849
	brgz,a,pt	%l2,	loop_3850
	call	loop_3851
	rdpr	%pil,	%o5
loop_3849:
	nop 	! 	rdpr	%tba,	%i4 changed by convert2hboot
loop_3850:
	call	loop_3852
loop_3851:
	movre	%g4,	%g6,	%i2
	rd	%ccr,	%o6
	addccc	%o1,	%g5,	%l4
loop_3852:
	call	loop_3853
	membar	0x7E
	umulcc	%o0,	%l3,	%g7
	nop
	setx	0x1FE8,	%l0,	%i1
	udivx	%o7,	%i1,	%i3
loop_3853:
	smulcc	%i7,	0x1D44,	%g1
	call	loop_3854
	call	loop_3855
	bmask	%l6,	%o4,	%g3
	sll	%i0,	%i5,	%l1
loop_3854:
	sra	%i6,	%l5,	%o2
loop_3855:
	nop
	nop
	setx	0x89BBEE88D58D577B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x6282074500D6E3E7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f20,	%f16
	call	loop_3856
	andn	%l0,	%g2,	%l2
	edge16	%o5,	%o3,	%i4
	call	loop_3857
loop_3856:
	fmovsl	%fcc3,	%f20,	%f26
	call	loop_3858
	call	loop_3859
loop_3857:
	call	loop_3860
	call	loop_3861
loop_3858:
	fnot2s	%f11,	%f20
loop_3859:
	xor	%g4,	%i2,	%g6
loop_3860:
	bshuffle	%f6,	%f12,	%f16
loop_3861:
	call	loop_3862
	call	loop_3863
	sllx	%o6,	%g5,	%l4
	nop 	! 	tcc	%xcc,	0x4e changed by convert2hboot
loop_3862:
	nop
	setx loop_3864, %l0, %l1
	jmpl %l1, %o1
loop_3863:
	call	loop_3865
	movle	%fcc1,	0x7B0,	%o0
	st	%f23,	[%l7 + 0x08]
loop_3864:
	fmul8ulx16	%f28,	%f22,	%f20
loop_3865:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x6FA, 	%hsys_tick_cmpr changed by convert2hboot
	call	loop_3866
	fmovde	%fcc3,	%f18,	%f24
	array16	%l3,	%i1,	%o7
	call	loop_3867
loop_3866:
	call	loop_3868
	movpos	%icc,	%i7,	%g1
	movcs	%icc,	%l6,	%i3
loop_3867:
	call	loop_3869
loop_3868:
	call	loop_3870
	subcc	%o4,	%i0,	%i5
	call	loop_3871
loop_3869:
	rdpr	%cwp,	%l1
loop_3870:
	movre	%g3,	0x28F,	%i6
	sra	%o2,	%l0,	%g2
loop_3871:
	fblg,a	%fcc3,	loop_3872
	call	loop_3873
	call	loop_3874
	call	loop_3875
loop_3872:
	ld	[%l7 + 0x30],	%f0
loop_3873:
	call	loop_3876
loop_3874:
	fandnot2	%f22,	%f18,	%f16
loop_3875:
	fmovso	%fcc1,	%f15,	%f20
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xE41, 	%hsys_tick_cmpr changed by convert2hboot
loop_3876:
	call	loop_3877
	fbo	%fcc1,	loop_3878
	movrlz	%o5,	0x23C,	%l5
	movcc	%icc,	%i4,	%o3
loop_3877:
	edge8n	%i2,	%g6,	%g4
loop_3878:
	call	loop_3879
	nop 	! 	tge	%xcc,	0x45 changed by convert2hboot
	nop 	! 	tvs	%xcc,	0x68 changed by convert2hboot
	call	loop_3880
loop_3879:
	nop
	set	0x20, %g5
	ldx	[%l7 + %g5],	%o6
	nop
	fitos	%f6,	%f20
	fstox	%f20,	%f6
	call	loop_3881
loop_3880:
	xor	%g5,	0x15E9,	%l4
	nop 	! 	rdhpr	%hpstate,	%o1 changed by convert2hboot
	nop 	! 	tneg	%icc,	0x5f changed by convert2hboot
loop_3881:
	sll	%g7,	0x1A,	%o0
	edge32n	%i1,	%o7,	%l3
	nop 	! 	taddcc	%i7,	%g1,	%i3 changed by convert2hboot
	movrlez	%l6,	%i0,	%i5
	wr	%g0,	0x0,	%pcr	! 	wr	%g0,	0x18,	%asi changed by convert2hboot
	nop
	setx	0x1305,	%l0,	%i6
	sdivcc	%o4,	%i6,	%o2
	movule	%fcc1,	%l0,	%g2
	nop 	! 	wrpr	%g3,	0x0026,	%tick changed by convert2hboot
	call	loop_3882
	call	loop_3883
	movn	%fcc3,	%o5,	%l2
	set	0x77, %i6
	nop	 ! 	ldsba	[%l7 + %i6] 0x80,	%l5 ASI use replaced by convert2hboot
loop_3882:
	sra	%i4,	0x0F,	%o3
loop_3883:
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x4, 	%fprs changed by convert2hboot
	fcmpeq16	%f10,	%f28,	%g4
	movgu	%icc,	%o6,	%g5
	ldub	[%l7 + 0x12],	%l4
	nop
	setx	0x1250,	%l0,	%g7
	udivcc	%o1,	%g7,	%o0
	call	loop_3884
	edge32l	%g6,	%o7,	%l3
	movre	%i7,	%g1,	%i1
	edge8l	%i3,	%i0,	%i5
loop_3884:
	movvc	%icc,	0x772,	%l1
	rdpr	%cleanwin,	%l6
	call	loop_3885
	srax	%i6,	%o4,	%l0
	fbuge,a	%fcc2,	loop_3886
	call	loop_3887
loop_3885:
	call	loop_3888
	call	loop_3889
loop_3886:
	wr	%g0,	0x0,	%pcr	! 	wr 	%g0, 	0x4, 	%fprs changed by convert2hboot
loop_3887:
	nop 	! 	taddcc	%g2,	%g3,	%o5 changed by convert2hboot
loop_3888:
	rdpr	%wstate,	%l5
loop_3889:
	call	loop_3890
	nop
	set	0x50, %i4
	flush	%l7 + %i4
	call	loop_3891
	smulcc	%l2,	%i4,	%o3
loop_3890:
	call	loop_3892
	call	loop_3893
loop_3891:
	rdpr	%pil,	%g4
	nop
	setx	0x09D7,	%l0,	%i2
	sdivx	%o6,	%i2,	%g5
loop_3892:
	edge8l	%o1,	%l4,	%o0
loop_3893:
	fbge,pn	%fcc0,	loop_3894
	xnorcc	%g6,	0x0986,	%o7
	nop 	! 	tge	%icc,	0x35 changed by convert2hboot
	movvs	%icc,	0x099,	%l3
loop_3894:
	edge8l	%i7,	%g1,	%g7
	wr	%g0,	0x0,	%pcr	! 	wr	%i1,	%i0,	%softint changed by convert2hboot
	ldstub	[%l7 + 0x12],	%i5
	call	loop_3895
	edge16	%l1,	%i3,	%l6
	call	loop_3896
	call	loop_3897
loop_3895:
	movl	%xcc,	0x5DB,	%o4
	brgez	%l0,	loop_3898
loop_3896:
	nop 	! 	tgu	%xcc,	0x3e changed by convert2hboot
loop_3897:
	nop 	! 	tg	%xcc,	0x74 changed by convert2hboot
	fmovrslez	%o2,	%f30,	%f10
loop_3898:
	xnor	%g2,	0x02DD,	%i6
	orncc	%o5,	%g3,	%l2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr changed by convert2hboot
	fpmerge	%f13,	%f2,	%f20
	call	loop_3899
	nop
	nop
	setx	0x248E9CD9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x5B0E5DDD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f31,	%f24
	orncc	%l5,	0x0B67,	%o3
	call	loop_3900
loop_3899:
	nop
	setx	0x1190,	%l0,	%o6
	udivcc	%g4,	%o6,	%i2
	rd	%sys_tick_cmpr,	%o1
	nop
	setx	loop_3901,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x001400001405,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	rdpr	%tt,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tt changed by convert2hboot
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	nop 	! 	rdpr	%tl,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tl changed by convert2hboot
	nop 	! 	rdpr	%tpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tpc changed by convert2hboot
	nop 	! 	rdpr	%tnpc,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tnpc changed by convert2hboot
	nop 	! 	rdpr	%tstate,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tstate changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdpr	%tba,	%l1 changed by convert2hboot
	nop 	! 	wrpr	%g0,	%l1,	%tba changed by convert2hboot
	nop 	! 	rdhpr	%hpstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hpstate changed by convert2hboot
	nop 	! 	rdhpr	%htstate,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%htstate changed by convert2hboot
	nop 	! 	rdhpr	%hintp,	%l1 changed by convert2hboot
	nop 	! 	wrhpr	%g0,	%l1,	%hintp changed by convert2hboot
	nop 	! 	done changed by convert2hboot
loop_3900:
	call	loop_3902
	flushw
	fmovdneg	%xcc,	%f22,	%f0
loop_3901:
	movle	%icc,	%l4,	%o0
loop_3902:
	movl	%icc,	0x44D,	%g6
	movvs	%icc,	%o7,	%l3
	fandnot1	%f22,	%f30,	%f24
	fbug,a,pt	%fcc3,	loop_3903
	call	loop_3904
	call	loop_3905
	call	loop_3906
loop_3903:
	addc	%g5,	%g1,	%g7
loop_3904:
	nop

loop_3905:
	nop

loop_3906:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 621
!	Type a   	: 673
!	Type x   	: 220
!	Type cti   	: 3906
!	Type f   	: 1107
!	Type i   	: 3473
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x16410C15
.word 0xC395A566
.word 0x01AC1A2D
.word 0xE9674AC3
.word 0x00AAED64
.word 0x0E000398
.word 0xD779C0F4
.word 0x99F88B83
.word 0x3E432090
.word 0x3472DF60
.word 0x171C2D42
.word 0x9855C626
.word 0xF469E679
.word 0xB1C0E60F
.word 0x962E40C8
.word 0x64170DBC
.word 0xE405A98C
.word 0x709969B1
.word 0x1E01A3DE
.word 0x1CB91E21
.word 0x2F837ECD
.word 0x94AF8A64
.word 0xA7CF4B18
.word 0x0A32411A
.word 0x003A3A96
.word 0x83A14D28
.word 0xE9611F76
.word 0xE3954F1E
.word 0x54337B2C
.word 0xE8196654
.word 0x19E7C8BE
.word 0x1BED368F
.word 0x50A4E70D
.word 0x0721DDDB
.word 0x7FBE2A0A
.word 0x89467D1C
.word 0x7987E5CB
.word 0xFA81F9DE
.word 0xD11C3717
.word 0x5899A3AE
.word 0xE0DB2BC0
.word 0x72D7F0FF
.word 0x7F8560A3
.word 0xEAACE760
.word 0x5DF0C0DC
.word 0x4E20E710
.word 0x6B7F7E91
.word 0x8B7CB66A
.word 0xDBEDC359
.word 0x230B7B05
.word 0x36507FF2
.word 0x05957512
.word 0xE2967041
.word 0x7B32C297
.word 0xEDEF8516
.word 0x97C87CA1
.word 0x550B2E2B
.word 0xBEF1BDBE
.word 0x574FB538
.word 0x737A21A0
.word 0x89580936
.word 0x4014106D
.word 0xD77B1282
.word 0x76AD16B2
.end
