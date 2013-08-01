/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_pmu_int15.s
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

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!Override trap handler definitions
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! Trap should set %l2=TT which is verified in main program

! Turn off interrupts by setting PIL=15
	
#define H_T0_Interrupt_Level_15_0x4f
#define My_T0_Interrupt_Level_15_0x4f \
	rdpr    %tt, %l2; \
	mov    0xf,	%l3;	\
	wrpr	%l3,	%l7,	%pil; \
	retry; \
	nop;
	
! Set PIL so that pic_overflow can be taken
#define CREGS_PIL 0xe         

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
	set	0x10088072,	%l0 ! count completed branches with TOE
	set	0x101080b2,	%l1 ! count taken branches (mispredicted) with TOE
	set	0x00000000,	%l2 ! setup to be used by the trap checker
	set     0x10408232,     %l3 ! count loads with TOE
	set     0x10808432,     %l4 ! count stores with TOE
	set     0x11008832,     %l5 ! count sethi (software count instr) with TOE	
	set     0x12009032,     %l6 ! count other instructions
	!# Output registers
	!# Float registers
	!# Other state

	!# Execute Main Diag ..
	ta T_CHANGE_PRIV            ! Should cause Watchdog_reset trap
init_pic:	
	rd 	%pic, %g2	! load the current pic value into %g2
	set	0xfffffff6, %g1
	wr 	%g1, %g0, %pic 	! set the counter to near overflow	

check_pcr:
	rd 	%pcr, %g3 	! load the current pcr value into %g3

cnt_br:
	wr	%l0, %g0, %pcr 	! count branches
	set	0x0, %g4
	cmp 	%g0, %g4	
	bne,pn 	%icc, fail	! no branching
	brz	%l0, fail	! no branching
	rd 	%pic, %g2	! load the current pic value into %g2

	addcc	%g0, 0x0002, %g5! keep track of counts

cnt_other:
	wr	%l6, %g0, %pcr	!count other inst
	inc	%g5
	inc	%g5

stop_cnt:
	wr	%g0, %g0, %pcr	!stop counting
	
	add	%g0, 0x0003, %g4
	rd	%pic, %g2	!check pic value
	cmp	%g2, %g5
	!bne,pn	%icc, fail

chk_trap:
	set	0x4f,	%g1
	cmp	%l2,	%g1
	bne	fail
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
