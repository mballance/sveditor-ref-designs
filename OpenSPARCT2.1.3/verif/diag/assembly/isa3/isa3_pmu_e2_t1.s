/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_pmu_e2_t1.s
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
	set	0x10088042,	%l0 ! count completed branches
	set	0x10108082,	%l1 ! count taken branches (mispredicted)
	set	0x10208102,	%l2 ! count floats
	set     0x10408202,     %l3 ! count loads
	set     0x10808402,     %l4 ! count stores
	set     0x11008802,     %l5 ! count sethi (software count instr)	
	set     0x12009002,     %l6 ! count other instructions
	!# Output registers
	!# Float registers
	!# Other state

	!# Execute Main Diag ..
	ta T_CHANGE_PRIV            ! Should cause Watchdog_reset trap
	
	rd 	%pic, %g2	! load the current pic value into %g2
	wr 	%g0, %g0, %pic 	! zero out the counter	


        ! before sending branches, update the PCR to be in UT.?
	rd 	%pcr, %g3 	! load the current pcr value into %g3

cnt_br:
	wr	%l0, %g0, %pcr 	! count branches

	cmp 	%g0, %g2	
	bne,pn 	%icc, fail	! no branching
	brz	%l0, fail	! no branching
	rd 	%pic, %g2	! load the current pic value into %g2

	addcc	%g0, 0x0002, %g5! keep track of counts

cnt_taken_br:
	wr	%l1, %g0, %pcr 	! count taken branches
	inc	%g5
	brz	%g0, cnt_float	! branching	
	sub	%g0, 0x0001, %g2
	inc	%g5		! this does not get executed

cnt_float:	
	wr 	%l2, %g0, %pcr 	! count floats
	rd 	%pic, %g2	! load the current pic value into %g2
	
	fadds	%f0, %f1, %f2	
	rd 	%pic, %g2	! load the current pic value into %g2
	addcc 	%g0, 0x0001, %g2
	inc	%g5

	faddd	%f2, %f4, %f6
	rd 	%pic, %g2	! load the current pic value into %g2
	inc	%g5
	
	!testing... inserting other instructions
        addcc	%g0, 0x0000, %g2
	setx	0xDEADBEEF11111111, %g2, %g4		
        addcc	%g0, 0x0000, %g2
	setx	load_1, %g2, %g3


	ld	[%g3 + %g0],   %g6

cnt_ld:
	wr	%l3, %g0, %pcr	!count loads
	ld	[%g3 + 0x0], %g2
	ld	[%g3 + 0x10], %g6
	inc	%g5
	inc	%g5
	
cnt_st:
	wr	%l4, %g0, %pcr	!count stores
	add 	%g0, 0x0000, %g2
	setx	store_1, %g2, %o6
	rd 	%pic, %g2	! load the current pic value into %g2
	stx     %o6, [%g3 + 0x10]
	rd 	%pic, %g2	! load the current pic value into %g2
	!ldd	[%l7 + 0x28], %g6	!this fails the test in boot.s mode... ??? debug soon.
	inc	%g5
	inc	%g5	! this one to take the wrasr into account... need to revisit

cnt_sethi:
	wr	%l5, %g0, %pcr	!count sethi
	rd 	%pic, %g2	! load the current pic value into %g2

	! this sethi is not counted... not recognized by DEC
	sethi	%hi(0x0fc000), %g0	!software count inst
	inc	%g5
	rd 	%pic, %g2	! load the current pic value into %g2

cnt_other_inst:
	wr	%l6, %g0, %pcr	!count other inst
	inc	%g5
	inc	%g5

stop_cnt:
	wr	%g0, %g0, %pcr	!stop counting
	
	add	%g0, 0x0003, %g4
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

store_1:
.align 16
.word 0xDEADBEEF			
.word 0xAAAAAAAA		
.align 16	

.end
