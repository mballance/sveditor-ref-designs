/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fp_fprs0_n2.s
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
#define H_T0_Fp_disabled_0x20 
#define My_T0_Fp_disabled_0x20 \
    rdpr %tstate, %i1; \
    rdpr %tt, %i1; \
    wr %g0, 0x4, %fprs; \
    rdpr	%tpc, %i0; \
    rdpr	%tnpc, %i1; \
    retry; \
    nop; nop;


#define ENABLE_T0_Fp_disabled_0x20
#include "hboot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  

main:

	setx		data0, %l0, %l1
	setx		data1, %l0, %l2

        wr      	%g0, 0x4, %fprs         ! Set fp enable

	ld		[%l1+0x0], %f0		! dl should be set
	rd		%fprs, %g1

	ldd		[%l2+0x0], %f32		! du should be set
	rd		%fprs, %g1

        wr      	%g0, 0x4, %fprs         ! Clear dl and du

	ba,a		tgt00			! in the delay slot
	ldd		[%l1+0x8], %f32

tgt00:

	rd		%fprs, %g1

	subcc		%g0, 0x1, %g0		! This should set n and c

	be,a		test_fail
	ldd		[%l1+0x8], %f32		! 

	rd		%fprs, %g1

	subcc		%g0, 0x1, %g0		! This should set n and c

	be,a		test_fail
	ldd		[%l1+0x8], %f0		! 

	rd		%fprs, %g1

	bne,a		tgt01
        wr      	%g0, 0x0, %fprs         ! Clear dl and du
	
tgt01:

	ldd		[%l1+0x8], %f0		! Should cause fp disabled trap

	rd		%fprs, %g1


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

data0:
	.word		0x80000010
	.word		0x80000011
	.word		0x80000012
	.word		0x80000013
	.word		0x80000014
	.word		0x80000015
	.word		0x80000016
	.word		0x80000017
	.word		0x80000018
	.word		0x80000019
	.word		0x8000001a
	.word		0x8000001b
	.word		0x8000001c
	.word		0x8000001d
	.word		0x8000001e
	.word		0x8000001f

.align 256

data1:
	.word		0x00000011
	.word		0x00000012
	.word		0x00000013
	.word		0x00000014


