/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: pmuAtomic.s
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
#define MAIN_PAGE_HV_ALSO
#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */


! Thread 0 Start

!main_t0:

	! Execute Main Diag ..
	ta T_CHANGE_HPRIV            ! Should cause Watchdog_reset trap
        
	set     0x1400a00F,     %l7 ! count atomics	
	wr	%l7, %g0, %pcr 	! count atomics
	wr 	%g0, %g0, %pic 	! zero out the counter


    setx 0x10000000, %o1, %o2  ! Generic address

    ldstub  [%o2], %o3
    ldstuba [%o2] 0x80, %o3
    casxa   [%o2] 0x80, %o3, %o4
    casa    [%o2] 0x80, %o3, %o4
    swap    [%o2], %o3
    swapa   [%o2] 0x80, %o3
    ldstub  [%o2], %o3
    ldstuba [%o2] 0x80, %o3
    casxa   [%o2] 0x80, %o3, %o4
    casa    [%o2] 0x80, %o3, %o4
    swap    [%o2], %o3
    swapa   [%o2] 0x80, %o3
    
    setx 0xC0000000C, %l2, %g5
	rd 	%pic, %g2	! load the current pic value into %g2
    xor %g5, %g2, %g2
    
    brnz %g2, fail
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
