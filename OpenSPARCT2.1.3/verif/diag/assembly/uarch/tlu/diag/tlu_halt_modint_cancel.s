/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_halt_modint_cancel.s
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

#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */


    ta T_CHANGE_HPRIV

    ! If MT, then park all threads based on park_mask
    ! Unpark the next thread when finished with this one..
    ! %l1 contains is_mt, %l2 contains address of is_mt
    ! %l3 contains park_mask, %l4 contains address of park_mask
    ! % l5 is mutex address 

setup_for_mt: ! {{{
    setx is_mt, %g1, %l2
    add %l2, 8, %l4
    add %l4, 8, %l5
    ldx [%l5], %g1
    ldstub [%l5], %g1 
get_mutex:
    ldx [%l5], %g2
    brnz,a %g1, get_mutex
    ldstub [%l5], %g1 

check_is_mt_set:
    ldx [%l2], %l1
    brnz %l1, continue
    mov 0x58, %g3
is_mt_not_set:
    ldxa [%g3]0x41, %l1
    popc %l1, %l1
    dec %l1
    brz %l1, continue
    nop
is_mt_and_first:
    mov 0x50, %g3
    stxa %g0, [%g3] 0x41  ! Park all threads
    mov 50, %g1
wait:
    brnz,a %g1, wait
    dec %g1

    stx %l1, [%l2]        ! Set the MT flag
    mov 1, %g1
    stx %g0, [%l5]  ! release mutex
    stxa %g1, [%g3] 0x41  ! Start with T0
    
continue:
    stx %g0, [%l5]  ! release mutex

! }}}

test1:
    wrpr %g0, 0x0, %pstate  ! disable IE


	!# Write bit 9 of MACTL (causes interrupt upon completion)
	!# 21:0 == 00 0010 0000 0000 0011 1111
	!# 20:18 TID == 0..7
	!#    17 cause interrupt
	!# 12:08 modular addition (1001)
	!# 12:08 load MA mem      (0000)
	!# 07:00 length = 63

    wr %g0, 0x40, %asi
	setx	0x2003f, %g1, %g3
    ldxa [%g0]0x63, %g1  ! get my TID for interrupt steering ..
    sllx %g1, 18, %g1
    or %g3, %g1, %g3
	stxa	%g3, [%g0 + 0x80] %asi


    mov 100, %g1
wait_for_int:
    brnz,a %g1, wait_for_int
    dec %g1

halt1:
    rdhpr %halt, %g7
    wrpr %g0, 0x2, %pstate  ! enable IE


    ! Finish if not MT
    brz %l1, done_thread
    nop

    ! If MT, shift mask, unpark next thread and finish
    ldx [%l4], %l3
    sllx %l3, 1, %l3
    mov 0x60, %g1
    stxa %l3, [%g1]0x41
    stx %l3, [%l4]
    nop

	
/*******************************************************
 * Exit code
 *******************************************************/

done_thread:
    nop
	ta		T_GOOD_TRAP
    nop

/************************************************************************
   Test case data start
 ************************************************************************/
.data
is_mt :
.xword 0x0
park_mask:
.xword 0x1
mutex:
.xword 0
.end
