/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_halt_hstmatch.s
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
#define H_HT0_Hstick_Match_0x5e
#define My_HT0_Hstick_Match_0x5e \
	rdhpr	%hintp, %g3; \
	wrhpr	%g3, %g3, %hintp; \
	retry

#define MAIN_PAGE_HV_ALSO

#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main


main:		/* test begin */


    ta T_CHANGE_HPRIV


    wrpr %g0, 0x0, %pstate

! Setup tick_cmpr to 200 clocks in the future ..

    mov 1, %g7
    sllx %g7, 63, %g7
    rd %tick, %g1
    add %g1, 0x300, %g1
    wrhpr %g1, %g7, %hsys_tick_cmpr


halt:
    wrhpr %g0, 0x0, %halt
    nop
    nop

halt2:
    wrhpr %g0, 0x1, %hintp
    nop
    wrhpr %g0, 0x0, %halt
    
    EXIT_GOOD



/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.word 0xB52E8698
