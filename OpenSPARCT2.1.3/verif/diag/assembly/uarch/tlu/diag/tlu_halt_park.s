/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_halt_park.s
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
#define CMP_THREAD_START ALL
#define MAIN_PAGE_HV_ALSO

#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */


    ta T_CHANGE_HPRIV

    cmp_sync_threads

    ldxa [%g0]0x63, %g1

    brnz %g1, non_zero
    nop

    mov 100, %g1
wait0:
    brnz %g1, wait0
    dec %g1

park_all:
    mov 0x50, %g1
    stxa %g0, [%g1]0x41

    mov 0x58, %g1
    ldxa [%g1]0x41, %g2
wait0_1:
    cmp %g2, 1
    bne wait0_1
    ldxa [%g1]0x41, %g2

    mov 0x50, %g1
    mov 0xff, %g2
    stxa %g2, [%g1]0x41
    
halt0:
    wrhpr %g0, 0x0, %halt

    EXIT_GOOD

non_zero:
    cmp %g1, 1
    bne halt_all
    nop
    wrhpr %g0, 0x0, %halt

    mov 100, %g3
wait1:
    brnz %g3, wait1
    dec %g3

unpark_all:
    mov 0x50, %g1
    stxa %g0, [%g1]0x41

    
    mov 0x58, %g1
    ldxa [%g1]0x41, %g2
wait1_1:
    cmp %g2, 2
    bne wait1_1
    ldxa [%g1]0x41, %g2

    mov 0x50, %g1
    mov 0xff, %g2
    stxa %g2, [%g1]0x41

    EXIT_GOOD

halt_all:
    wrhpr %g0, 0x0, %halt


    EXIT_GOOD



/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.word 0xB52E8698
