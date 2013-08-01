/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fp_sticky_bits_n2.s
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
#define	H_T0_Fp_exception_ieee_754_0x21 T0_Fp_exception_ieee_754
#define	H_T0_Fp_exception_other_0x22 T0_Fp_exception_other

#define ENABLE_T0_Fp_disabled_0x20
#include "hboot.s"

	
.text
.global main  

main:

        wr      	%g0, 0x4, %fprs         /* make sure fef is 1 */

	setx		fsr_tem_en, %l0, %l3	! fsr tem enable value

/*******************************************************
 * Simple data
 *******************************************************/

	! By default, mask is disabled

	ld		[%l3+0x0], %fsr		! Read it from memory - trap disabled


	setx    walking_one, %l0, %l6        ! Double precision data

	ldd     [%l6+%g0], %f0          ! double precision
        add     %g0, 0x8, %g4
        ldd     [%l6+%g4], %f2          ! double precision
	add     %g4, 0x8, %g4

	        
	set	0x30, %g6		! Max loop count rd
	set	0x0, %g7		! loop iterator	

	walking_one_loop0:		! Rounding mode loop


	faddd   %f0,  %f2,  %f10
	fdivd   %f0,  %f2,  %f20
	fmuld   %f0,  %f2,  %f30

	ldd     [%l6+%g4], %f2          ! double precision
	add     %g4, 0x8, %g4


	add		%g7, 0x1, %g7
	subcc		%g7, %g6, %g0

	bne,a		walking_one_loop0	! If not 0, go to test more
        nop

	
/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
	ta		T_GOOD_TRAP

test_fail:
	ta		T_BAD_TRAP

/*******************************************************
 * Data section 
 *******************************************************/
	
.data

.align 256


walking_one:

	.xword		0x0000000000000001	! Walking one
	.xword		0x0000000000000002	! Walking one
	.xword		0x0000000000000004	! Walking one
	.xword		0x0000000000000008	! Walking one
	.xword		0x0000000000000010	! Walking one
	.xword		0x0000000000000020	! Walking one
	.xword		0x0000000000000040	! Walking one
	.xword		0x0000000000000080	! Walking one
	.xword		0x0000000000000100	! Walking one
	.xword		0x0000000000000200	! Walking one
	.xword		0x0000000000000400	! Walking one
	.xword		0x0000000000000800	! Walking one
	.xword		0x0000000000001000	! Walking one
	.xword		0x0000000000002000	! Walking one
	.xword		0x0000000000004000	! Walking one
	.xword		0x0000000000008000	! Walking one
	.xword		0x0000000000010000	! Walking one
	.xword		0x0000000000020000	! Walking one
	.xword		0x0000000000040000	! Walking one
	.xword		0x0000000000080000	! Walking one
	.xword		0x0000000000100000	! Walking one
	.xword		0x0000000000200000	! Walking one
	.xword		0x0000000000400000	! Walking one
	.xword		0x0000000000800000	! Walking one
        .xword		0x0000000001000000	! Walking one
	.xword		0x0000000002000000	! Walking one
	.xword		0x0000000004000000	! Walking one
	.xword		0x0000000008000000	! Walking one
	.xword		0x0000000010000000	! Walking one
	.xword		0x0000000020000000	! Walking one
	.xword		0x0000000040000000	! Walking one
	.xword		0x0000000080000000	! Walking one
	.xword		0x0000000100000000	! Walking one
	.xword		0x0000000200000000	! Walking one
	.xword		0x0000000400000000	! Walking one
	.xword		0x0000000800000000	! Walking one
	.xword		0x0000001000000000	! Walking one
	.xword		0x0000002000000000	! Walking one
	.xword		0x0000004000000000	! Walking one
	.xword		0x0000008000000000	! Walking one
	.xword		0x0000010000000000	! Walking one
	.xword		0x0000020000000000	! Walking one
	.xword		0x0000040000000000	! Walking one
	.xword		0x0000080000000000	! Walking one
	.xword		0x0000100000000000	! Walking one
	.xword		0x0000200000000000	! Walking one
	.xword		0x0000400000000000	! Walking one
	.xword		0x0000800000000000	! Walking one
	.xword		0x0001000000000000	! Walking one
	.xword		0x0002000000000000	! Walking one
	.xword		0x0004000000000000	! Walking one
	.xword		0x0008000000000000	! Walking one
	.xword		0x0010000000000000	! Walking one
	.xword		0x0020000000000000	! Walking one
	.xword		0x0040000000000000	! Walking one
	.xword		0x0080000000000000	! Walking one
	.xword		0x0100000000000000	! Walking one
	.xword		0x0200000000000000	! Walking one
	.xword		0x0400000000000000	! Walking one
	.xword		0x0800000000000000	! Walking one
	.xword		0x1000000000000000	! Walking one
	.xword		0x2000000000000000	! Walking one
	.xword		0x4000000000000000	! Walking one
	.xword		0x8000000000000000	! Walking one
	


.align 256

fsr_tem_en:
	.word		0x0f800000	! TEM - all enabled - rd 0
	.word		0x4f800000	! TEM - all enabled - rd 1
	.word		0x8f800000	! TEM - all enabled - rd 2
	.word		0xcf800000	! TEM - all enabled - rd 3
        .word           0x00000000      ! TEM - walk through all values
        .word           0x0f800000
	.word           0x01000000
        .word           0x01800000
	.word           0x02000000
        .word           0x02800000
        .word           0x03000000
	.word           0x03800000
	.word           0x04000000
	.word           0x04800000
	.word           0x05000000
	.word           0x05800000
	.word           0x06000000
	.word           0x06800000
	.word           0x07000000
	.word           0x07800000
	.word           0x08000000
	.word           0x08800000
	.word           0x09000000
	.word           0x09800000
	.word           0x0a000000
	.word           0x0a800000
	.word           0x0b000000
	.word           0x0b800000
	.word           0x0c000000
	.word           0x0c800000
	.word           0x0d000000
	.word           0x0d800000
	.word           0x0e000000
	.word           0x0e800000
	.word           0x0f000000
	.word           0x0f800000
	.word           0x01800000
	.word           0x02800000
	.word           0x03800000
	.word           0x04800000
	
	
	
	
fsr_tem_dis:
	.word		0x00000000	! TEM - all disabled
	.word		0x40000000	! TEM - all disabled
	.word		0x80000000	! TEM - all disabled
	.word		0xc0000000	! TEM - all disabled

/*******************************************************
 * My own trap handlers
 *******************************************************/

SECTION .TRAPS
.text
	

.global	T0_Fp_exception_ieee_754
.global	T0_Fp_exception_other

	T0_Fp_exception_ieee_754:	
	rdpr	%tpc, %i0
	rdpr	%tnpc, %i1
	rdpr	%tstate, %i1
	rdpr	%tt, %i1
	setx	scratch, %l0, %l5	! scratch
	stx	%fsr, [%l5+0x0]
	ldx	[%l5+0x0], %fsr		! Need to test the sync operation
	done
	nop

T0_Fp_exception_other:	
	rdpr	%tpc, %i0
	rdpr	%tnpc, %i1
	rdpr	%tstate, %i1
	rdpr	%tt, %i1
	setx	scratch, %l0, %l5	! scratch
	stx	%fsr, [%l5+0x0]
	ldx	[%l5+0x0], %fsr		! Need to test the sync operation
	done
	nop

.data
.align 128

scratch:
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
	.word		0x00000000
