/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_1215hsysmatrap.s
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
#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_NUCLEUS_ALSO

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!Override trap handler definitions
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! Interrupt trap handler

#define H_HT0_Hstick_Match_0x5e 
#define My_HT0_Hstick_Match_0x5e \
    EXIT_GOOD     ; \
    nop;


#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

    ta T_CHANGE_HPRIV 
    
set_stick:

    setx 0x50000000, %g1, %g2
    wrpr %g2, %tick

set_hstick_cmpr:

    add %g2, 100, %g2
    wrhpr %g2, %hsys_tick_cmpr

loop_wait_for_int:

    mov 100, %g1                    ! Should get interrupt in 100
    brnz %g1, loop_wait_for_int     ! loops ..
    dec %g1
    
    EXIT_BAD

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.word 0xB52E8698
.end




