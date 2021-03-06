/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_pmu_cpu_ldst.s
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
#define MAIN_PAGE_NUCLEUS_ALSO
#include "hboot.s"
/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

!
! Thread 0 Start
!
!main_t0:
	!# Initialize registers ..

	!# Global registers
	!# Input registers
	!# Local registers
	set	0x28094042,	%l0 ! count spu load operations to L2
	set	0x28114082,	%l1 ! count spu store operations to l2   
	set	0x28214102,	%l2 ! count cpu loads to l2
	set     0x28414202,     %l3 ! count cpu ifetch to l2
	set     0x28814402,     %l4 ! count cpu stores to l2
	set     0x20000000,     %l5 ! do not use
	set     0x10000000,     %l6 ! do not ues
	!# Output registers
	!# Float registers
	!# Other state

	!# Execute Main Diag ..
	ta T_CHANGE_PRIV            ! Should cause Watchdog_reset trap
	
	rd 	%pic, %g2	! load the current pic value into %g2
	wr 	%g0, %g0, %pic 	! zero out the counter	


        ! before sending branches, update the PCR to be in UT.?
	rd 	%pcr, %g3 	! load the current pcr value into %g3

!count cpu loads to l2
	wr	%l2, %g0, %pcr 	! count dcache misses

        addcc	%g0, 0x0000, %g2
	setx	load_1, %g2, %g3
	ld	[%g3 + 0x0], %g2
	ld	[%g3 + 0x10], %g6
	ld	[%g3 + 0x0], %g1	!should not be counted as a dmiss
	inc	%g5
	inc	%g5
	rd	%pic, %g2	!check pic value

!count cpu stores to l2
	wr	%l4, %g0, %pcr	!count stores
	add 	%g0, 0x0000, %g2
	setx	store_1, %g2, %o6
	stx     %o6, [%g3 + 0x10]
	rd 	%pic, %g2	! load the current pic value into %g2
	inc	%g5

!stop counting
	wr	%g0, %g0, %pcr	!stop counting
	
	rd	%pic, %g2	!check pic value
	cmp	%g2, %g5
	bne,pn	%icc, fail


	nop

done:
	EXIT_GOOD	/* test finish  */
fail:
	EXIT_BAD	/* bad count */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.align 16	
load_1:	
.word 0xFFFF2e2d       
.word 0x2e2dFFFF
.align 16

load_2:
.xword 0xABCDEF0123456789
store_1:
.align 16
.word 0xDEADBEEF			
.word 0xAAAAAAAA		
.align 16	

.end
