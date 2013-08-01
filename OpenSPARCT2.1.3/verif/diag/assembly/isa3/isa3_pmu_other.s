/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_pmu_other.s
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

#define H_T0_Trap_Instruction_5
#define My_T0_Trap_Instruction_5 \
	wr	%g0, %g0, %pcr; \
    done

#define H_T1_Trap_Instruction_5
#define My_T1_Trap_Instruction_5 \
	wr	%g0, %g0, %pcr; \
    done 

#include "hboot.s"
/************************************************************************
   Test case code start
 ************************************************************************/

#define OTHER 0x12009006	

.text
.global main

main:		/* test begin */

!
! Thread 0 Start
!
!main_t0:

	!# Execute Main Diag ..
	ta T_CHANGE_PRIV
	
	wr	%g0, %g0, %pcr	

	ta T_CHANGE_NONPRIV
	wr 	%g0, %g0, %pic 	! zero out the counter	

!#      count "other" instructions
	ta T_CHANGE_PRIV

        setx OTHER, %g1, %g2
	wr	%g0, %g2, %pcr

	!# membar gets counted too...
	membar #Sync

	inc	%g5
	inc	%g5
	nop
	nop
	nop
	!# stop counting
	wr	%g0, %g0, %pcr
	setx 0x600000006, %g1, %g7
	rd	%pic, %g3	!check pic value
	cmp	%g3, %g7
	bne,pn	%xcc, fail1
	nop

!#	zero out counter, resume counting, take a trap, make sure counter not incremented for trap
	wr	%g0, %g0, %pic
	wr	%g0, %g2, %pcr

	!# membar gets counted too...
	membar #Sync
	inc	%g5
	inc	%g5
	nop
	nop
	nop
!#	trap and go to handler
	
	ta	0x35
	!# stop counting
	setx 0x600000006, %g1, %g7
	rd	%pic, %g3	!check pic value
	cmp	%g3, %g7
	bne,pn	%xcc, fail2
	nop
done:
	EXIT_GOOD	/* test finish  */
fail1:
	EXIT_BAD	/* bad count */

fail2:
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
