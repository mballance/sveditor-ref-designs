/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic_idtlb4.s
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
    EXIT_BAD; \
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

	ldstub	[%l7 + 0x59],	%i0
	ldsh	[%l7 + 0x2E],	%l2
	ld	[%l7 + 0x08],	%f14
	nop
	set	0x6F, %o2
	ldstub	[%l7 + %o2],	%g6
	sth	%l3,	[%l7 + 0x22]
	prefetch	[%l7 + 0x14],	 0x2
	stb	%o2,	[%l7 + 0x4D]
	nop
	set	0x4C, %l4
	ldsw	[%l7 + %l4],	%g3
	ldstub	[%l7 + 0x0C],	%l4
	lduh	[%l7 + 0x16],	%i5
	nop 	! 	rdhpr	%hintp,	%o4 changed by convert2hboot
	stb	%o0,	[%l7 + 0x5A]
	std	%g6,	[%l7 + 0x30]
	nop
	set	0x18, %g2
	stw	%l5,	[%l7 + %g2]
	movne	%icc,	%i6,	%i4
	fmovdne	%icc,	%f7,	%f25
	st	%f27,	[%l7 + 0x34]
	ldd	[%l7 + 0x20],	%f4
	ldub	[%l7 + 0x2E],	%g2
	prefetch	[%l7 + 0x0C],	 0x1
	ld	[%l7 + 0x50],	%f30
	st	%f0,	[%l7 + 0x54]
	nop
	set	0x64, %l0
	prefetch	[%l7 + %l0],	 0x1
	nop
	set	0x62, %i3
	stb	%o5,	[%l7 + %i3]
	ldsb	[%l7 + 0x78],	%i2
	ldx	[%l7 + 0x60],	%g4
	wr	%g0,	0x80,	%asi
	stx	%o7,	[%l7 + 0x38]
	ldsh	[%l7 + 0x34],	%g5
	ldx	[%l7 + 0x48],	%l1
	ldd	[%l7 + 0x48],	%i0
	mova	%icc,	%g1,	%i3
	popc	0x1D18,	%l0
	lduh	[%l7 + 0x6C],	%o3
	stb	%l6,	[%l7 + 0x7D]
	sth	%o6,	[%l7 + 0x08]
	lduh	[%l7 + 0x44],	%i0
	ldsb	[%l7 + 0x2D],	%g6
	std	%l2,	[%l7 + 0x28]
	flush	%l7 + 0x74
	nop
	set	0x22, %l2
	ldsh	[%l7 + %l2],	%l3
	addc	%o2,	%g3,	%i5
	prefetch	[%l7 + 0x24],	 0x0
	stx	%l4,	[%l7 + 0x38]
	ldd	[%l7 + 0x30],	%f28
	ldstub	[%l7 + 0x48],	%o4
	stw	%g7,	[%l7 + 0x34]
	rdpr	%wstate,	%l5
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	wr	%g0,	0x5f,	%asi
	stb	%i4,	[%l7 + 0x39]
	flush	%l7 + 0x14
	movneg	%icc,	%i6,	%o5
	stx	%g2,	[%l7 + 0x38]
	stw	%g4,	[%l7 + 0x30]
	ldsw	[%l7 + 0x50],	%i2
	sra	%o7,	%g5,	%l1
	fand	%f20,	%f14,	%f2
	wr	%g0,	0x81,	%asi
	ldstub	[%l7 + 0x4E],	%o1
	stb	%i3,	[%l7 + 0x69]
	subc	%g1,	0x0DCB,	%o3
	ldsw	[%l7 + 0x74],	%l6
	ldsh	[%l7 + 0x70],	%o6
	nop
	set	0x40, %l1
	stx	%i0,	[%l7 + %l1]
	st	%f29,	[%l7 + 0x3C]
	flush	%l7 + 0x58
	nop
	set	0x10, %i2
	lduh	[%l7 + %i2],	%l0
	sth	%i7,	[%l7 + 0x1A]
	stx	%g6,	[%l7 + 0x10]
	std	%f22,	[%l7 + 0x38]
	ld	[%l7 + 0x78],	%f29
	ld	[%l7 + 0x6C],	%f0
	ldsh	[%l7 + 0x5C],	%l2
	and	%o2,	0x10B5,	%l3
	lduh	[%l7 + 0x7A],	%g3
	nop 	! 	tcc	%icc,	0x7 changed by convert2hboot
	stx	%l4,	[%l7 + 0x40]
	nop
	set	0x58, %o0
	ldsw	[%l7 + %o0],	%i5
	stw	%g7,	[%l7 + 0x70]
	bleu	loop_1
	stx	%o4,	[%l7 + 0x38]
	nop 	! 	tl	%xcc,	0x5 changed by convert2hboot
	wr	%g0,	0x88,	%asi
loop_1:
	wr	%i4,	%i6,	%pic
	ldstub	[%l7 + 0x15],	%l5
	ldub	[%l7 + 0x32],	%o5
	fbule	%fcc1,	loop_2
	ld	[%l7 + 0x0C],	%f21
	fsrc2	%f26,	%f16
	lduw	[%l7 + 0x44],	%g4
loop_2:
	fnand	%f22,	%f24,	%f14
	swap	[%l7 + 0x2C],	%i2
	lduw	[%l7 + 0x28],	%g2
	ldsb	[%l7 + 0x70],	%o7
	rd	%pc,	%l1
	sdivx	%i1,	0x1F8E,	%o1
	ldsh	[%l7 + 0x46],	%g5
	ldsh	[%l7 + 0x38],	%i3
	wr	%g0,	0x1d,	%asi
	mulx	%g1,	0x04D1,	%o6
	fxnors	%f28,	%f7,	%f1
	stx	%i0,	[%l7 + 0x50]
	movl	%xcc,	%l6,	%l0
	stb	%i7,	[%l7 + 0x3F]
	fandnot1s	%f26,	%f30,	%f2
	st	%f12,	[%l7 + 0x34]
	movneg	%icc,	%g6,	%o2
	lduh	[%l7 + 0x76],	%l2
	std	%f16,	[%l7 + 0x50]
	swap	[%l7 + 0x40],	%g3
	nop
	set	0x3C, %o4
	ldsw	[%l7 + %o4],	%l4
	fnors	%f16,	%f0,	%f21
	edge8n	%l3,	%g7,	%i5
	fpackfix	%f30,	%f26
	ldub	[%l7 + 0x63],	%o4
	stx	%o0,	[%l7 + 0x78]
	ld	[%l7 + 0x60],	%f6
	std	%f10,	[%l7 + 0x60]
	fpadd32s	%f17,	%f6,	%f4
	nop 	! 	tpos	%xcc,	0x5 changed by convert2hboot
	set	0x20, %g6
	nop	 ! 	stxa	%i4,	[%l7 + %g6] 0x15 ASI use changed by convert2hboot
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x110
	wr	%g0,	0x52,	%asi
	ldsb	[%l7 + 0x40],	%l5
	brgez,a	%g4,	loop_3
	stx	%i2,	[%l7 + 0x40]
	prefetch	[%l7 + 0x74],	 0x3
	ldx	[%l7 + 0x08],	%o5
loop_3:
	ldd	[%l7 + 0x38],	%g2
	ldstub	[%l7 + 0x71],	%l1
	stw	%o7,	[%l7 + 0x6C]
	swap	[%l7 + 0x78],	%o1
	nop
	setx	loop_4,	%l0,	%l1
	nop 	! 	wrpr	0x1,	%tl changed by convert2hboot
	nop 	! 	wrpr	%l1,	%tpc changed by convert2hboot
	add	%l1,	0x4,	%l1
	nop 	! 	wrpr	%l1,	%tnpc changed by convert2hboot
	setx	0x34400001400,	%l0,	%l1
	nop 	! 	wrpr	%l1,	%tstate changed by convert2hboot
	nop 	! 	wrhpr	0x4,	%htstate changed by convert2hboot
	nop 	! 	retry changed by convert2hboot
	nop 	! 	tne	%icc,	0x6 changed by convert2hboot
	ldx	[%l7 + 0x30],	%g5
	nop 	! 	sir	0x1CE5 changed by convert2hboot
loop_4:
	st	%f5,	[%l7 + 0x20]
	prefetch	[%l7 + 0x48],	 0x1
	array16	%i1,	%i3,	%g1
	ldsh	[%l7 + 0x6C],	%o6
	swap	[%l7 + 0x1C],	%i0
!Yo - got one - imm_asi 0x58 
!And yo - immediate is 0x18
	set	0x18, %i6
	nop	 ! 	ldxa	[%g0 + %i6] 0x58,	%o3 ASI use changed by convert2hboot
	wrpr	%l0,	0x0F13,	%cwp
	lduh	[%l7 + 0x28],	%l6
	ldd	[%l7 + 0x58],	%f2
	lduh	[%l7 + 0x60],	%i7
	stb	%o2,	[%l7 + 0x08]
	udivx	%l2,	0x1717,	%g6
	stx	%l4,	[%l7 + 0x40]
	fbule,a	%fcc2,	loop_5
	lduw	[%l7 + 0x50],	%g3
	stb	%g7,	[%l7 + 0x4A]
	std	%f6,	[%l7 + 0x20]
loop_5:
	nop
	set	0x40, %i5
	nop	 ! 	stxa	%l3,	[%l7 + %i5] 0x04 ASI use changed by convert2hboot
	stx	%o4,	[%l7 + 0x78]
	ldd	[%l7 + 0x08],	%i4
	ldd	[%l7 + 0x48],	%i4
	ldd	[%l7 + 0x38],	%o0
	std	%f24,	[%l7 + 0x50]
	std	%i6,	[%l7 + 0x38]
	move	%icc,	%l5,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x7C],	%o5
	stw	%g2,	[%l7 + 0x30]
	ld	[%l7 + 0x40],	%f11
	lduh	[%l7 + 0x50],	%g4
	st	%f23,	[%l7 + 0x14]
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%f2
	set	0x10, %g1
	nop	 ! 	stxa	%l1,	[%l7 + %g1] 0x14 ASI use changed by convert2hboot
	set	0x20, %g4
	nop	 ! 	ldxa	[%l7 + %g4] 0x80,	%o7 ASI use changed by convert2hboot
	sth	%g5,	[%l7 + 0x72]
	movg	%icc,	%o1,	%i1
	ld	[%l7 + 0x6C],	%f14
	std	%f18,	[%l7 + 0x40]
	stx	%i3,	[%l7 + 0x28]
	stx	%g1,	[%l7 + 0x70]
	flush	%l7 + 0x44
	nop 	! 	tn	%xcc,	0x5 changed by convert2hboot
	ldsh	[%l7 + 0x48],	%o6
	nop
	set	0x20, %i4
	prefetch	[%l7 + %i4],	 0x0
	sth	%i0,	[%l7 + 0x62]
	prefetch	[%l7 + 0x6C],	 0x3
	st	%f16,	[%l7 + 0x58]
	stx	%l0,	[%l7 + 0x48]
	nop
	set	0x22, %o7
	sth	%l6,	[%l7 + %o7]
	movrlez	%i7,	%o3,	%o2
	prefetch	[%l7 + 0x30],	 0x2
	std	%g6,	[%l7 + 0x38]
	stw	%l4,	[%l7 + 0x18]
	move	%xcc,	%g3,	%l2
	nop
	set	0x40, %o1
	stx	%l3,	[%l7 + %o1]
	ldstub	[%l7 + 0x60],	%o4
	st	%f18,	[%l7 + 0x08]
	fcmpes	%fcc1,	%f15,	%f27
	std	%i4,	[%l7 + 0x20]
	swap	[%l7 + 0x24],	%i4
	bg,a,pt	%icc,	loop_6
	nop 	! 	tge	%xcc,	0x2 changed by convert2hboot
	std	%g6,	[%l7 + 0x60]
loop_6:
	fxors	%f19,	%f27,	%f25
	ldsh	[%l7 + 0x7E],	%o0
	st	%f13,	[%l7 + 0x2C]
	wr	%g0,	0x1c,	%asi
	set	0x40, %o6
	nop	 ! 	stxa	%l5,	[%l7 + %o6] 0x88 ASI use changed by convert2hboot
	lduw	[%l7 + 0x7C],	%i2
	nop 	! 	wrpr	%g2,	0x13FC,	%tick changed by convert2hboot
	ld	[%l7 + 0x44],	%f11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc3,	loop_7
	ldd	[%l7 + 0x10],	%f2
	ld	[%l7 + 0x18],	%f7
	ldsw	[%l7 + 0x50],	%g4
loop_7:
	flush	%l7 + 0x50
	swap	[%l7 + 0x38],	%l1
	ldub	[%l7 + 0x3F],	%o7
	fxor	%f6,	%f28,	%f2
	ldsw	[%l7 + 0x50],	%o5
	set	0x38, %l5
	nop	 ! 	stxa	%o1,	[%l7 + %l5] 0x14 ASI use changed by convert2hboot
	std	%g4,	[%l7 + 0x08]
	ldsb	[%l7 + 0x60],	%i1
	movle	%icc,	%g1,	%i3
	wr	%g0,	0xe2,	%asi
	membar	#Sync
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
	ldsw	[%l7 + 0x68],	%i0
	std	%f22,	[%l7 + 0x50]
	ldsb	[%l7 + 0x75],	%l6
	wr	%g0,	0x80,	%asi
	nop
	set	0x0A, %g5
	sth	%i7,	[%l7 + %g5]
	wr	%g0,	0x19,	%asi
	set	0x20, %o3
	nop	 ! 	stxa	%o3,	[%l7 + %o3] 0x2b ASI use changed by convert2hboot
	membar	#Sync
	ldsb	[%l7 + 0x43],	%g6
	lduh	[%l7 + 0x66],	%g3
	lduw	[%l7 + 0x44],	%l4
	edge8ln	%l2,	%l3,	%o4
	fbuge,a	%fcc0,	loop_8
	ldstub	[%l7 + 0x1D],	%i4
	std	%g6,	[%l7 + 0x18]
	ldsh	[%l7 + 0x18],	%i5
loop_8:
	prefetch	[%l7 + 0x70],	 0x1
	nop 	! 	tle	%icc,	0x2 changed by convert2hboot
	ldd	[%l7 + 0x30],	%o0
	stw	%i6,	[%l7 + 0x70]
	smulcc	%i2,	%l5,	%g2
	ldd	[%l7 + 0x40],	%g4
	addccc	%l1,	%o5,	%o7
	movg	%xcc,	%g5,	%o1
	sth	%g1,	[%l7 + 0x5E]
	ld	[%l7 + 0x6C],	%f6
	lduh	[%l7 + 0x6C],	%i3
	nop 	! 	tvs	%xcc,	0x7 changed by convert2hboot
	wr	%g0,	0x1c,	%asi
	fands	%f26,	%f13,	%f0
	flush	%l7 + 0x50
	lduh	[%l7 + 0x5C],	%i1
	bleu,a,pt	%xcc,	loop_9
	prefetch	[%l7 + 0x68],	 0x0
	addccc	%l6,	%l0,	%i0
	ldub	[%l7 + 0x27],	%o2
loop_9:
	ldx	[%l7 + 0x38],	%o3
	ldd	[%l7 + 0x28],	%i6
	std	%f24,	[%l7 + 0x48]
	ldd	[%l7 + 0x08],	%f12
	ldub	[%l7 + 0x0A],	%g3
	stx	%g6,	[%l7 + 0x28]
	ldsb	[%l7 + 0x28],	%l4
	ldd	[%l7 + 0x70],	%f2
	ldsw	[%l7 + 0x0C],	%l2
	ldstub	[%l7 + 0x13],	%l3
	ldub	[%l7 + 0x1B],	%o4
	flush	%l7 + 0x24
	fnands	%f31,	%f11,	%f25
	swap	[%l7 + 0x30],	%g7
	nop
	set	0x68, %i0
	std	%f16,	[%l7 + %i0]
	lduw	[%l7 + 0x2C],	%i5
	set	0x50, %i1
	nop	 ! 	ldxa	[%l7 + %i1] 0x19,	%o0 ASI use changed by convert2hboot
	prefetch	[%l7 + 0x50],	 0x3
	flush	%l7 + 0x7C
	prefetch	[%l7 + 0x2C],	 0x3
	ldd	[%l7 + 0x60],	%i6
	nop 	! 	tleu	%xcc,	0x6 changed by convert2hboot
	ldstub	[%l7 + 0x55],	%i4
	ldx	[%l7 + 0x58],	%i2
	stb	%g2,	[%l7 + 0x51]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x50],	%l4
	prefetch	[%l7 + 0x7C],	 0x2
	st	%f7,	[%l7 + 0x54]
	std	%l0,	[%l7 + 0x08]
	ldsw	[%l7 + 0x60],	%o5
	stx	%g4,	[%l7 + 0x18]
	lduw	[%l7 + 0x50],	%g5
	set	0x08, %g3
	nop	 ! 	stxa	%o7,	[%l7 + %g3] 0x10 ASI use changed by convert2hboot
	ldd	[%l7 + 0x60],	%g0
	fcmpeq16	%f0,	%f6,	%i3
	orncc	%o6,	0x0BAB,	%o1
	rd	%ccr,	%i1
	ldstub	[%l7 + 0x21],	%l6
	ld	[%l7 + 0x5C],	%f23
	edge32ln	%l0,	%o2,	%i0
	stw	%i7,	[%l7 + 0x34]
	edge32	%g3,	%o3,	%g6
	ldd	[%l7 + 0x38],	%f6
	ld	[%l7 + 0x6C],	%f23
	lduw	[%l7 + 0x54],	%l4
	wr	%g0,	0x1c,	%asi
	ldsw	[%l7 + 0x28],	%l3
	lduh	[%l7 + 0x40],	%g7
	nop 	! 	tsubcctv	%i5,	%o4,	%o0 changed by convert2hboot
	andn	%i6,	0x0455,	%i2
	nop 	! 	tsubcctv	%g2,	%l5,	%i4 changed by convert2hboot
	sllx	%l1,	%g4,	%o5
	ldsb	[%l7 + 0x27],	%g5
	addccc	%g1,	0x19D0,	%i3
	fbg	%fcc3,	loop_10
	stx	%o6,	[%l7 + 0x08]
	fbule,a	%fcc0,	loop_11
	swap	[%l7 + 0x58],	%o1
loop_10:
	or	%o7,	0x1A23,	%l6
	ldx	[%l7 + 0x48],	%l0
loop_11:
	fmovrslz	%i1,	%f22,	%f18
	ldstub	[%l7 + 0x4C],	%o2
	lduw	[%l7 + 0x1C],	%i0
	flush	%l7 + 0x44
	st	%f20,	[%l7 + 0x28]
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x00
	set	0x00, %o5
	nop	 ! 	ldxa	[%g0 + %o5] 0x50,	%g3 ASI use changed by convert2hboot
	ldd	[%l7 + 0x78],	%f14
	flush	%l7 + 0x18
	stx	%o3,	[%l7 + 0x20]
	swap	[%l7 + 0x50],	%g6
	flush	%l7 + 0x1C
	stw	%l4,	[%l7 + 0x2C]
	nop 	! 	rdhpr	%htba,	%l2 changed by convert2hboot
	ld	[%l7 + 0x68],	%f9
	set	0x08, %l6
	nop	 ! 	ldxa	[%l7 + %l6] 0x1c,	%i7 ASI use changed by convert2hboot
	swap	[%l7 + 0x10],	%g7
	stx	%l3,	[%l7 + 0x50]
	ldd	[%l7 + 0x30],	%o4
	ldsw	[%l7 + 0x78],	%i5
	ldd	[%l7 + 0x68],	%o0
	stx	%i2,	[%l7 + 0x10]
	sra	%g2,	%i6,	%i4
	nop
	set	0x38, %g7
	std	%f24,	[%l7 + %g7]
	ld	[%l7 + 0x24],	%f10
!Yo - got one - imm_asi 0x58 
!And yo - immediate is 0x20
	wr	%g0,	0x58,	%asi
	ba,pn	%icc,	loop_12
	stx	%g4,	[%l7 + 0x30]
	st	%f18,	[%l7 + 0x60]
	fmovspos	%icc,	%f0,	%f2
loop_12:
	ba,a	loop_13
	movrlz	%l5,	%o5,	%g5
	ldstub	[%l7 + 0x4E],	%g1
	std	%f22,	[%l7 + 0x28]
loop_13:
	stx	%o6,	[%l7 + 0x70]
	ldstub	[%l7 + 0x3B],	%o1
	lduh	[%l7 + 0x10],	%o7
	ldd	[%l7 + 0x18],	%i6
	flush	%l7 + 0x7C
	stb	%l0,	[%l7 + 0x5E]
	ld	[%l7 + 0x34],	%f22
	nop 	! 	tcs	%xcc,	0x7 changed by convert2hboot
	set	0x50, %o2
	nop	 ! 	stxa	%i1,	[%l7 + %o2] 0x1c ASI use changed by convert2hboot
	stb	%i3,	[%l7 + 0x1D]
	lduw	[%l7 + 0x60],	%i0
	ldsh	[%l7 + 0x22],	%g3
	nop
	set	0x0A, %i7
	stb	%o2,	[%l7 + %i7]
	nop 	! 	tneg	%xcc,	0x3 changed by convert2hboot
	swap	[%l7 + 0x60],	%g6
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x18
	wr	%g0,	0x50,	%asi
	std	%f0,	[%l7 + 0x38]
	faligndata	%f24,	%f4,	%f24
	ldsw	[%l7 + 0x64],	%l2
	fandnot1	%f16,	%f8,	%f12
	swap	[%l7 + 0x24],	%i7
	fandnot1	%f22,	%f6,	%f16
	sdiv	%l4,	0x146D,	%l3
	ld	[%l7 + 0x6C],	%f14
	ldsb	[%l7 + 0x0F],	%g7
	std	%f22,	[%l7 + 0x20]
	stb	%o4,	[%l7 + 0x24]
	stx	%i5,	[%l7 + 0x68]
	ldd	[%l7 + 0x10],	%f18
	st	%f11,	[%l7 + 0x44]
	ldx	[%l7 + 0x10],	%o0
	bg,a,pn	%icc,	loop_14
	stb	%g2,	[%l7 + 0x0E]
	ldd	[%l7 + 0x68],	%f6
	ld	[%l7 + 0x20],	%f3
loop_14:
	ldub	[%l7 + 0x7F],	%i6
	std	%f14,	[%l7 + 0x08]
	rd	%asi,	%i4
	flush	%l7 + 0x28
	ldsh	[%l7 + 0x2C],	%i2
	fcmpeq32	%f4,	%f6,	%l1
	ldx	[%l7 + 0x20],	%g4
	nop
	set	0x22, %l4
	ldub	[%l7 + %l4],	%l5
	ldx	[%l7 + 0x18],	%o5
	ldx	[%l7 + 0x38],	%g1
	ldd	[%l7 + 0x48],	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x4AD, 	%hsys_tick_cmpr changed by convert2hboot
	std	%f24,	[%l7 + 0x28]
	ldsw	[%l7 + 0x20],	%o6
	nop 	! 	rdhpr	%htba,	%l6 changed by convert2hboot
	lduh	[%l7 + 0x16],	%o7
	nop
	set	0x38, %g2
	stx	%i1,	[%l7 + %g2]
	stb	%l0,	[%l7 + 0x60]
	ldd	[%l7 + 0x08],	%i0
	st	%f26,	[%l7 + 0x78]
	lduh	[%l7 + 0x2A],	%g3
	andn	%o2,	0x00EB,	%g6
	std	%f18,	[%l7 + 0x38]
	stx	%i3,	[%l7 + 0x70]
	lduw	[%l7 + 0x14],	%o3
	st	%f16,	[%l7 + 0x1C]
	ldd	[%l7 + 0x10],	%f26
	stx	%l2,	[%l7 + 0x10]
	st	%f5,	[%l7 + 0x10]
	nop
	set	0x48, %i3
	stx	%i7,	[%l7 + %i3]
	lduw	[%l7 + 0x0C],	%l3
	ldub	[%l7 + 0x6F],	%g7
	std	%o4,	[%l7 + 0x60]
	nop
	set	0x18, %l0
	std	%l4,	[%l7 + %l0]
	st	%f16,	[%l7 + 0x1C]
	call	loop_15
	std	%o0,	[%l7 + 0x78]
	lduw	[%l7 + 0x4C],	%i5
	nop 	! 	taddcc	%i6,	0x093D,	%i4 changed by convert2hboot
loop_15:
	std	%f16,	[%l7 + 0x18]
	ldx	[%l7 + 0x48],	%i2
	ldub	[%l7 + 0x5A],	%l1
	call	loop_16
	sth	%g2,	[%l7 + 0x62]
	sdivcc	%g4,	0x0636,	%l5
loop_16:
	nop 	! 	rdhpr	%htba,	%o5 changed by convert2hboot
	ldd	[%l7 + 0x10],	%f18
	swap	[%l7 + 0x08],	%g5
	fmovrdne	%g1,	%f0,	%f18
	st	%f8,	[%l7 + 0x60]
	ldub	[%l7 + 0x0D],	%o6
	nop
	set	0x60, %l2
	std	%f18,	[%l7 + %l2]
	lduw	[%l7 + 0x20],	%o1
	ldx	[%l7 + 0x68],	%o7
	prefetch	[%l7 + 0x54],	 0x1
	swap	[%l7 + 0x44],	%i1
	std	%l0,	[%l7 + 0x38]
	flush	%l7 + 0x3C
	andn	%l6,	%i0,	%g3
	stb	%o2,	[%l7 + 0x25]
	prefetch	[%l7 + 0x6C],	 0x0
	ldstub	[%l7 + 0x41],	%g6
	ldub	[%l7 + 0x73],	%o3
	ldub	[%l7 + 0x40],	%l2
	addccc	%i3,	%l3,	%g7
	nop
	set	0x40, %i2
	ldx	[%l7 + %i2],	%i7
	swap	[%l7 + 0x3C],	%l4
	ldsw	[%l7 + 0x54],	%o0
	ldub	[%l7 + 0x32],	%o4
	prefetch	[%l7 + 0x68],	 0x1
	st	%f20,	[%l7 + 0x70]
	flush	%l7 + 0x5C
	lduw	[%l7 + 0x40],	%i5
	ld	[%l7 + 0x1C],	%f20
	ldstub	[%l7 + 0x49],	%i6
	sth	%i2,	[%l7 + 0x38]
	std	%l0,	[%l7 + 0x40]
	lduw	[%l7 + 0x40],	%g2
	srl	%i4,	%g4,	%l5
	st	%f11,	[%l7 + 0x3C]
	lduh	[%l7 + 0x12],	%g5
	stb	%g1,	[%l7 + 0x39]
	st	%f6,	[%l7 + 0x10]
	array16	%o6,	%o1,	%o7
	nop
	set	0x78, %o0
	lduw	[%l7 + %o0],	%o5
	umulcc	%l0,	0x04D5,	%i1
	ld	[%l7 + 0x3C],	%f29
	sth	%l6,	[%l7 + 0x14]
	lduh	[%l7 + 0x22],	%g3
	lduh	[%l7 + 0x5A],	%o2
	nop
	set	0x1A, %l1
	sth	%i0,	[%l7 + %l1]
	ldsw	[%l7 + 0x38],	%o3
	nop
	set	0x4C, %g6
	ldsw	[%l7 + %g6],	%l2
	fpmerge	%f7,	%f23,	%f12
	flush	%l7 + 0x10
	lduw	[%l7 + 0x10],	%i3
	nop 	! 	tle	%xcc,	0x5 changed by convert2hboot
	set	0x58, %o4
	nop	 ! 	stxa	%l3,	[%l7 + %o4] 0x89 ASI use changed by convert2hboot
	nop
	set	0x14, %i5
	lduw	[%l7 + %i5],	%g7
	swap	[%l7 + 0x0C],	%i7
	stx	%l4,	[%l7 + 0x20]
	ldx	[%l7 + 0x28],	%g6
	ldx	[%l7 + 0x28],	%o0
	ld	[%l7 + 0x34],	%f14
	ldsh	[%l7 + 0x7C],	%o4
	wr	%g0,	0x0c,	%asi
	ldsw	[%l7 + 0x78],	%i2
	ldsh	[%l7 + 0x64],	%l1
	ldstub	[%l7 + 0x4F],	%i5
	fpsub32	%f0,	%f6,	%f16
	ldsh	[%l7 + 0x36],	%i4
	nop
	set	0x35, %l3
	ldub	[%l7 + %l3],	%g4
	ldd	[%l7 + 0x10],	%f10
	rd	%fprs,	%l5
	pdist	%f6,	%f24,	%f28
	ldsh	[%l7 + 0x10],	%g5
	set	0x60, %i6
	nop	 ! 	ldxa	[%l7 + %i6] 0x11,	%g1 ASI use changed by convert2hboot
	st	%f22,	[%l7 + 0x50]
	wr	%g0,	0xeb,	%asi
	membar	#Sync
	ldx	[%l7 + 0x08],	%o1
	std	%o6,	[%l7 + 0x20]
	ldd	[%l7 + 0x58],	%o6
	fbg,a	%fcc0,	loop_17
	umul	%o5,	0x1CC8,	%i1
	flush	%l7 + 0x44
loop_17:
	edge16ln	%l0,	%g3,	%l6
	st	%f15,	[%l7 + 0x70]
	subcc	%i0,	0x0D29,	%o3
	swap	[%l7 + 0x3C],	%l2
	std	%f30,	[%l7 + 0x10]
	ldd	[%l7 + 0x48],	%i2
	wr	%g0,	0x1d,	%asi
	stw	%g7,	[%l7 + 0x1C]
	stw	%i7,	[%l7 + 0x54]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l4,	%l3,	%g6
	ldstub	[%l7 + 0x24],	%o4
	stb	%o0,	[%l7 + 0x11]
	flush	%l7 + 0x54
	stw	%i2,	[%l7 + 0x7C]
	prefetch	[%l7 + 0x38],	 0x1
	prefetch	[%l7 + 0x58],	 0x3
	ldub	[%l7 + 0x2C],	%l1
	set	0x68, %g4
	nop	 ! 	ldxa	[%l7 + %g4] 0x1d,	%i5 ASI use changed by convert2hboot
	stb	%i4,	[%l7 + 0x41]
	brz,a	%i6,	loop_18
	nop 	! 	tn	%icc,	0x3 changed by convert2hboot
	st	%f7,	[%l7 + 0x54]
loop_18:
	lduh	[%l7 + 0x4C],	%g4
	ldx	[%l7 + 0x10],	%l5
	ld	[%l7 + 0x44],	%f15
	swap	[%l7 + 0x44],	%g5
	ldub	[%l7 + 0x6D],	%g1
	ldd	[%l7 + 0x10],	%o0
	ld	[%l7 + 0x1C],	%f19
	stw	%o6,	[%l7 + 0x24]
	fbl,a	%fcc2,	loop_19
	ldx	[%l7 + 0x58],	%o7
	ldd	[%l7 + 0x10],	%f26
	ldub	[%l7 + 0x7D],	%g2
loop_19:
	ldd	[%l7 + 0x18],	%i0
	fbo,a	%fcc3,	loop_20
	ldsw	[%l7 + 0x54],	%o5
	lduh	[%l7 + 0x3E],	%l0
loop_20:
	ldsw	[%l7 + 0x70],	%l6
	prefetch	[%l7 + 0x44],	 0x1
	wr	%g0,	0x22,	%asi
	membar	#Sync
	flush	%l7 + 0x30
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%f22
	stx	%o3,	[%l7 + 0x20]
	ldd	[%l7 + 0x50],	%f14
	xnorcc	%l2,	0x18F1,	%g3
	fcmple32	%f14,	%f8,	%i3
	flush	%l7 + 0x30
	lduh	[%l7 + 0x46],	%g7
	ldsw	[%l7 + 0x4C],	%o2
	ldsb	[%l7 + 0x24],	%i7
	set	0x20, %o7
	nop	 ! 	stxa	%l3,	[%l7 + %o7] 0x81 ASI use changed by convert2hboot
	movpos	%xcc,	%l4,	%o4
	ldsw	[%l7 + 0x2C],	%g6
	ldsb	[%l7 + 0x4C],	%o0
	stw	%i2,	[%l7 + 0x44]
	ldsb	[%l7 + 0x4C],	%l1
	lduh	[%l7 + 0x54],	%i5
	srax	%i6,	%i4,	%l5
	ldsw	[%l7 + 0x34],	%g4
	prefetch	[%l7 + 0x78],	 0x1
	ldub	[%l7 + 0x75],	%g1
	nop 	! 	tle	%icc,	0x4 changed by convert2hboot
	sdivx	%o1,	0x1078,	%g5
	nop
	set	0x7C, %o1
	ldsh	[%l7 + %o1],	%o6
	nop 	! 	tcs	%xcc,	0x1 changed by convert2hboot
	lduw	[%l7 + 0x48],	%g2
	ldsh	[%l7 + 0x50],	%i1
	flush	%l7 + 0x1C
	fbn	%fcc3,	loop_21
	fcmpes	%fcc0,	%f15,	%f19
	flush	%l7 + 0x50
	stx	%o7,	[%l7 + 0x10]
loop_21:
	ldx	[%l7 + 0x70],	%o5
	brgz	%l6,	loop_22
	movpos	%xcc,	%l0,	%o3
	fzeros	%f6
	smulcc	%i0,	%l2,	%g3
loop_22:
	ld	[%l7 + 0x2C],	%f9
	nop
	set	0x20, %o6
	lduw	[%l7 + %o6],	%g7
	move	%xcc,	%o2,	%i7
	orn	%i3,	%l4,	%o4
	orn	%g6,	0x1C8B,	%l3
	nop 	! 	tneg	%icc,	0x7 changed by convert2hboot
	nop
	set	0x4C, %g1
	stw	%o0,	[%l7 + %g1]
	ldub	[%l7 + 0x74],	%i2
	nop 	! 	tge	%icc,	0x7 changed by convert2hboot
	ldsh	[%l7 + 0x38],	%l1
	sth	%i6,	[%l7 + 0x1C]
	lduw	[%l7 + 0x68],	%i5
	ldsh	[%l7 + 0x48],	%i4
	flush	%l7 + 0x60
	std	%g4,	[%l7 + 0x08]
	fbe,a	%fcc0,	loop_23
	lduh	[%l7 + 0x6E],	%l5
	ldstub	[%l7 + 0x78],	%o1
	ldd	[%l7 + 0x10],	%g4
loop_23:
	stb	%g1,	[%l7 + 0x12]
	wr	%g0,	0x2b,	%asi
	membar	#Sync
	ldsw	[%l7 + 0x4C],	%g2
	ldd	[%l7 + 0x18],	%f6
	nop 	! 	sir	0x0CB5 changed by convert2hboot
	ldstub	[%l7 + 0x76],	%o7
	flush	%l7 + 0x40
	wr	%g0,	0x18,	%asi
	stb	%l6,	[%l7 + 0x20]
	sth	%l0,	[%l7 + 0x30]
	stx	%o3,	[%l7 + 0x60]
	lduh	[%l7 + 0x64],	%i0
	lduw	[%l7 + 0x30],	%o5
	st	%f9,	[%l7 + 0x78]
	stb	%g3,	[%l7 + 0x0D]
	fors	%f17,	%f16,	%f23
	ldstub	[%l7 + 0x61],	%g7
	prefetch	[%l7 + 0x60],	 0x3
	sth	%o2,	[%l7 + 0x38]
	fmovdgu	%icc,	%f24,	%f20
	prefetch	[%l7 + 0x34],	 0x3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	set	0x28, %l5
	nop	 ! 	ldxa	[%g0 + %l5] 0x20,	%l2 ASI use changed by convert2hboot
	prefetch	[%l7 + 0x5C],	 0x3
	stb	%i7,	[%l7 + 0x6C]
	stw	%i3,	[%l7 + 0x74]
	flush	%l7 + 0x3C
	ldx	[%l7 + 0x08],	%o4
	ldd	[%l7 + 0x50],	%l4
	ldx	[%l7 + 0x08],	%g6
	ldd	[%l7 + 0x58],	%f16
	ldub	[%l7 + 0x36],	%o0
	st	%f31,	[%l7 + 0x70]
	ldsh	[%l7 + 0x7A],	%l3
	stb	%i2,	[%l7 + 0x29]
	sth	%l1,	[%l7 + 0x2E]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f24,	%f5
	rdpr	%pil,	%i6
	ld	[%l7 + 0x40],	%f8
	array32	%i4,	%g4,	%l5
	bvs	%xcc,	loop_24
	orn	%i5,	%o1,	%g1
	ldsw	[%l7 + 0x7C],	%o6
	rd	%y,	%g5
loop_24:
	std	%g2,	[%l7 + 0x48]
	flush	%l7 + 0x24
	std	%f14,	[%l7 + 0x70]
	std	%f8,	[%l7 + 0x38]
	flush	%l7 + 0x24
	stw	%o7,	[%l7 + 0x6C]
	ld	[%l7 + 0x48],	%f11
	movvs	%xcc,	%l6,	%i1
	st	%f0,	[%l7 + 0x14]
	prefetch	[%l7 + 0x4C],	 0x3
	xor	%o3,	%i0,	%l0
	ldd	[%l7 + 0x18],	%o4
	fpsub16s	%f9,	%f30,	%f1
	ldub	[%l7 + 0x79],	%g7
	stb	%g3,	[%l7 + 0x22]
	stx	%o2,	[%l7 + 0x60]
	bleu	loop_25
	st	%f9,	[%l7 + 0x68]
	sth	%i7,	[%l7 + 0x0E]
	ldd	[%l7 + 0x78],	%f8
loop_25:
	ld	[%l7 + 0x74],	%f11
	sth	%i3,	[%l7 + 0x2E]
	ldstub	[%l7 + 0x3A],	%l2
	andn	%l4,	0x05A9,	%o4
	ld	[%l7 + 0x48],	%f24
	ldd	[%l7 + 0x60],	%f4
	xnorcc	%o0,	0x07CC,	%g6
	array16	%i2,	%l1,	%l3
	ldstub	[%l7 + 0x5F],	%i6
	ldsw	[%l7 + 0x68],	%g4
	lduw	[%l7 + 0x64],	%l5
	prefetch	[%l7 + 0x1C],	 0x1
	ldub	[%l7 + 0x28],	%i4
	swap	[%l7 + 0x3C],	%i5
	prefetch	[%l7 + 0x74],	 0x1
	sth	%g1,	[%l7 + 0x48]
	sth	%o6,	[%l7 + 0x58]
	swap	[%l7 + 0x3C],	%g5
	ld	[%l7 + 0x5C],	%f15
	nop
	set	0x40, %g5
	std	%o0,	[%l7 + %g5]
	set	0x08, %o3
	nop	 ! 	ldxa	[%l7 + %o3] 0x04,	%o7 ASI use changed by convert2hboot
	ldsh	[%l7 + 0x64],	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i1,	[%l7 + 0x34]
	udiv	%g2,	0x1EF0,	%i0
	fmovrde	%o3,	%f6,	%f8
	ldsb	[%l7 + 0x4A],	%l0
	ldsh	[%l7 + 0x2C],	%o5
	stb	%g7,	[%l7 + 0x65]
	std	%g2,	[%l7 + 0x48]
	nop 	! 	tg	%xcc,	0x3 changed by convert2hboot
	fmovspos	%icc,	%f6,	%f16
	nop 	! 	rdhpr	%htba,	%o2 changed by convert2hboot
	ldub	[%l7 + 0x73],	%i7
	smul	%i3,	0x02A3,	%l4
	ldd	[%l7 + 0x58],	%f30
	bshuffle	%f22,	%f2,	%f26
	fpsub16s	%f2,	%f5,	%f21
	nop
	set	0x08, %i1
	stx	%o0,	[%l7 + %i1]
	nop 	! 	rdhpr	%hsys_tick_cmpr,	%g6 changed by convert2hboot
	prefetch	[%l7 + 0x6C],	 0x1
	std	%i2,	[%l7 + 0x10]
	sth	%l1,	[%l7 + 0x4C]
	ldub	[%l7 + 0x79],	%l2
	stw	%i6,	[%l7 + 0x10]
	ldx	[%l7 + 0x78],	%l3
	flush	%l7 + 0x70
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %g3
	nop	 ! 	ldxa	[%g0 + %g3] 0x20,	%l5 ASI use changed by convert2hboot
	popc	0x1A70,	%g4
	ldx	[%l7 + 0x70],	%i5
	ldsh	[%l7 + 0x1C],	%i4
	ldstub	[%l7 + 0x7A],	%g1
	ldstub	[%l7 + 0x7C],	%o6
	fsrc1s	%f7,	%f30
	stb	%g5,	[%l7 + 0x4F]
	swap	[%l7 + 0x5C],	%o7
	nop
	set	0x28, %o5
	std	%o0,	[%l7 + %o5]
	bvs,a	loop_26
	rd	%ccr,	%l6
	ld	[%l7 + 0x78],	%f13
	ldd	[%l7 + 0x28],	%f20
loop_26:
	ldx	[%l7 + 0x48],	%i1
	sth	%i0,	[%l7 + 0x46]
	wr	%g0,	0x88,	%asi
	nop
	set	0x34, %i0
	stb	%g2,	[%l7 + %i0]
	ldstub	[%l7 + 0x28],	%o5
	sth	%l0,	[%l7 + 0x68]
	std	%g6,	[%l7 + 0x20]
	ld	[%l7 + 0x0C],	%f28
	ldd	[%l7 + 0x20],	%f12
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x8
	wr	%g0,	0x21,	%asi
	nop 	! 	rdhpr	%hintp,	%o2 changed by convert2hboot
	swap	[%l7 + 0x10],	%i3
	fbu,a	%fcc2,	loop_27
	ldub	[%l7 + 0x61],	%i7
	wr	%g0,	0x2f,	%asi
	membar	#Sync
loop_27:
	ldsb	[%l7 + 0x47],	%o4
	lduh	[%l7 + 0x48],	%g6
	std	%i2,	[%l7 + 0x78]
	ldub	[%l7 + 0x61],	%l1
	stx	%o0,	[%l7 + 0x38]
	sth	%l2,	[%l7 + 0x6A]
	ldd	[%l7 + 0x18],	%l2
	flush	%l7 + 0x4C
	stx	%i6,	[%l7 + 0x18]
	std	%f28,	[%l7 + 0x58]
	ld	[%l7 + 0x08],	%f21
	ld	[%l7 + 0x18],	%f9
	ldd	[%l7 + 0x70],	%f10
	lduw	[%l7 + 0x24],	%g4
	nop 	! 	tneg	%xcc,	0x6 changed by convert2hboot
	nop 	! 	tsubcc	%l5,	%i4,	%i5 changed by convert2hboot
	nop
	set	0x0C, %g7
	stw	%g1,	[%l7 + %g7]
	ld	[%l7 + 0x54],	%f2
	subccc	%o6,	0x0B10,	%o7
	st	%f14,	[%l7 + 0x38]
	ldx	[%l7 + 0x48],	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0x890, 	%hsys_tick_cmpr changed by convert2hboot
	sth	%g5,	[%l7 + 0x34]
	ldd	[%l7 + 0x10],	%i0
	ldd	[%l7 + 0x70],	%f16
	swap	[%l7 + 0x34],	%o3
	nop
	set	0x14, %o2
	ldstub	[%l7 + %o2],	%g2
	ldsw	[%l7 + 0x10],	%i1
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f20
	edge32	%o5,	%g7,	%g3
	stx	%o2,	[%l7 + 0x60]
	nop
	set	0x4C, %l6
	prefetch	[%l7 + %l6],	 0x3
	std	%i2,	[%l7 + 0x48]
	nop
	set	0x48, %g2
	lduw	[%l7 + %g2],	%i7
	lduw	[%l7 + 0x18],	%l4
	ldsw	[%l7 + 0x34],	%l0
	std	%f18,	[%l7 + 0x70]
	edge32	%o4,	%i2,	%l1
	xnorcc	%g6,	%l2,	%l3
	ldsb	[%l7 + 0x0F],	%o0
	ldstub	[%l7 + 0x4A],	%i6
	ldx	[%l7 + 0x28],	%l5
	swap	[%l7 + 0x6C],	%i4
	ldsb	[%l7 + 0x52],	%i5
	subc	%g4,	0x02A1,	%o6
	nop 	! 	tle	%xcc,	0x5 changed by convert2hboot
	std	%f26,	[%l7 + 0x20]
	nop
	set	0x48, %l4
	std	%g0,	[%l7 + %l4]
	prefetch	[%l7 + 0x14],	 0x1
	ldsb	[%l7 + 0x0C],	%o1
	flush	%l7 + 0x54
	set	0x28, %l0
	nop	 ! 	stxa	%o7,	[%l7 + %l0] 0x22 ASI use changed by convert2hboot
	membar	#Sync
	fba	%fcc2,	loop_28
	alignaddrl	%g5,	%l6,	%i0
	andncc	%o3,	%i1,	%g2
	fmovscc	%icc,	%f7,	%f24
loop_28:
	ldsb	[%l7 + 0x24],	%g7
	stx	%g3,	[%l7 + 0x58]
	prefetch	[%l7 + 0x34],	 0x2
	movleu	%xcc,	%o5,	%o2
	movrne	%i7,	0x030,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	nop 	! 	wrhpr 	%l0, 	0xBB6, 	%hsys_tick_cmpr changed by convert2hboot
	fbe,a	%fcc3,	loop_29
	lduh	[%l7 + 0x5E],	%i2
	andcc	%o4,	%l1,	%l2
	ldx	[%l7 + 0x58],	%l3
loop_29:
	nop 	! 	rdhpr	%hpstate,	%o0 changed by convert2hboot
	ldx	[%l7 + 0x60],	%g6
	ld	[%l7 + 0x5C],	%f4
	prefetch	[%l7 + 0x44],	 0x3
	prefetch	[%l7 + 0x48],	 0x0
	ldstub	[%l7 + 0x20],	%i6
	stw	%i4,	[%l7 + 0x48]
	ldd	[%l7 + 0x58],	%f26
	stx	%l5,	[%l7 + 0x30]
	std	%i4,	[%l7 + 0x58]
	rd	%sys_tick_cmpr,	%g4
	st	%f15,	[%l7 + 0x30]
	ldd	[%l7 + 0x40],	%f24
	ldsw	[%l7 + 0x44],	%g1
	swap	[%l7 + 0x14],	%o1
	swap	[%l7 + 0x50],	%o6
	ldsw	[%l7 + 0x44],	%o7
	nop
	set	0x66, %l2
	sth	%g5,	[%l7 + %l2]
	ld	[%l7 + 0x24],	%f0
	ldsb	[%l7 + 0x5A],	%l6
	ldstub	[%l7 + 0x5F],	%o3
	ldd	[%l7 + 0x10],	%f8
	st	%f0,	[%l7 + 0x74]
	nop 	! 	tvs	%icc,	0x5 changed by convert2hboot
	andncc	%i0,	%g2,	%i1
	xorcc	%g3,	%o5,	%g7
	rdpr	%cleanwin,	%i7
	edge32	%o2,	%l4,	%i3
	ldsh	[%l7 + 0x60],	%l0
	stw	%i2,	[%l7 + 0x34]
	fmuld8sux16	%f19,	%f2,	%f8
	nop
	set	0x78, %i2
	ldx	[%l7 + %i2],	%l1
	ldsw	[%l7 + 0x34],	%l2
	prefetch	[%l7 + 0x5C],	 0x0
	set	0x50, %o0
	nop	 ! 	ldxa	[%l7 + %o0] 0x04,	%l3 ASI use changed by convert2hboot
	wr	%g0,	0x0,	%pcr
	wr	%g0,	0x1d,	%asi
	prefetch	[%l7 + 0x70],	 0x0
	ldsh	[%l7 + 0x18],	%i6
	ldstub	[%l7 + 0x71],	%i4
	prefetch	[%l7 + 0x68],	 0x2
	fmul8x16au	%f5,	%f11,	%f22
	rd	%y,	%i5
	ldub	[%l7 + 0x4D],	%g4
	srlx	%g1,	0x09,	%o1
	fmovdvs	%icc,	%f9,	%f17
	nop 	! 	rdhpr	%hpstate,	%o6 changed by convert2hboot
	ldsb	[%l7 + 0x3E],	%o7
	srlx	%g5,	%l5,	%l6
	ldd	[%l7 + 0x20],	%f4
	nop 	! 	tge	%icc,	0x1 changed by convert2hboot
	ldsh	[%l7 + 0x36],	%o3
	wr	%g0,	0x2a,	%asi
	membar	#Sync
	nop
	set	0x74, %i3
	prefetch	[%l7 + %i3],	 0x3
	ldx	[%l7 + 0x40],	%i1
	wr	%g3,	0x11B2,	%pic
	st	%f25,	[%l7 + 0x50]
	st	%f29,	[%l7 + 0x10]
	sth	%o5,	[%l7 + 0x52]
	prefetch	[%l7 + 0x24],	 0x1
	wr	%g0,	0x19,	%asi
	ldsb	[%l7 + 0x63],	%g7
	lduh	[%l7 + 0x44],	%i7
	lduh	[%l7 + 0x7E],	%o2
	ldub	[%l7 + 0x6D],	%l4
	st	%f12,	[%l7 + 0x18]
	fcmpd	%fcc0,	%f6,	%f22
	fmovse	%icc,	%f9,	%f9
	fpack32	%f8,	%f8,	%f10
	andcc	%l0,	%i3,	%i2
	ldsh	[%l7 + 0x1A],	%l2
	nop 	! 	wrpr	%l1,	0x0D2B,	%tick changed by convert2hboot
	bpos,a,pn	%xcc,	loop_30
	bl	%icc,	loop_31
	ldsh	[%l7 + 0x16],	%o0
	stb	%g6,	[%l7 + 0x60]
loop_30:
	fmovdne	%icc,	%f0,	%f1
loop_31:
	sth	%o4,	[%l7 + 0x20]
	fpmerge	%f17,	%f23,	%f28
	ld	[%l7 + 0x14],	%f12
	ld	[%l7 + 0x58],	%f17
	ldsw	[%l7 + 0x70],	%i6
	flush	%l7 + 0x54
	lduh	[%l7 + 0x5A],	%l3
	fandnot2s	%f22,	%f4,	%f27
	ldd	[%l7 + 0x60],	%f6
	nop 	! 	sir	0x026A changed by convert2hboot
	swap	[%l7 + 0x0C],	%i5
	movg	%xcc,	%i4,	%g1
	st	%f20,	[%l7 + 0x08]
	stx	%g4,	[%l7 + 0x70]
	prefetch	[%l7 + 0x2C],	 0x2
	ld	[%l7 + 0x24],	%f4
	swap	[%l7 + 0x74],	%o1
	ldub	[%l7 + 0x57],	%o7
	ldub	[%l7 + 0x35],	%g5
	stb	%o6,	[%l7 + 0x3D]
	lduh	[%l7 + 0x2C],	%l5
	std	%o2,	[%l7 + 0x18]
	flush	%l7 + 0x18
	prefetch	[%l7 + 0x1C],	 0x0
	ld	[%l7 + 0x1C],	%f5
	udiv	%i0,	0x17FC,	%i1
	wr	%g0,	0x80,	%asi
	nop 	! 	wrpr	%o5,	%l6,	%tick changed by convert2hboot
	stx	%g7,	[%l7 + 0x20]
	ldd	[%l7 + 0x08],	%i6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 722
!	Type a   	: 32
!	Type cti   	: 31
!	Type x   	: 49
!	Type f   	: 47
!	Type i   	: 119
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x04BAEE04
.word 0xA26211E7
.word 0xC46CE935
.word 0xD086C0FA
.word 0x95181468
.word 0xA561DA01
.word 0x66B600B3
.word 0x3DDF304B
.word 0xD59B63E9
.word 0x69CD7744
.word 0x93D976FD
.word 0x632A2A09
.word 0xD21BB7C3
.word 0x6D4AA3F7
.word 0x1FB493C2
.word 0xA8132A6B
.word 0x5D211FF0
.word 0x819A5EF5
.word 0x73B3D78A
.word 0x979BCD1A
.word 0x88730AC3
.word 0xBD87189E
.word 0x372CA055
.word 0x87AD6A47
.word 0x1EC56408
.word 0x19156A2C
.word 0x188A924A
.word 0xE21AB83D
.word 0xAC4488B1
.word 0x34AF2861
.word 0x90E27A07
.word 0x7ECBAD34
.word 0x0D0C9AD8
.word 0xCD68A2C2
.word 0x744F3CF8
.word 0x8BF0C9D3
.word 0xB6232F4D
.word 0x16EEB7FF
.word 0x2CE4DC96
.word 0x086BC9ED
.word 0x87757CAE
.word 0xF207ACCA
.word 0xE25E65DB
.word 0x8189486F
.word 0x00156704
.word 0x0E78970C
.word 0x00B22AFF
.word 0x5EA3DBAD
.word 0x091EEE20
.word 0x067AF9AB
.word 0x68CC189A
.word 0xAEE0946E
.word 0x24E3D750
.word 0x704AC16A
.word 0xA3F11926
.word 0xE63276D1
.word 0xDD91CC43
.word 0x87772648
.word 0x2983F7D2
.word 0xD99DB0E4
.word 0x96D7B61B
.word 0x29F098FC
.word 0xCA413B16
.word 0x506B0706
.end
