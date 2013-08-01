/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_halt_cwqint_cancel.s
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


    wr %g0, 0x40, %asi    
    stxa    %g0,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    !# allocate control word queue (e.g., setup head/tail/first/last registers)
    set CWQ_BASE, %g6

    !# write base addr to first, head, and tail ptr
    !# first store to first
    stxa    %g6, [%g0 + ASI_SPU_CWQ_FIRST] %asi	!# first store to first

    stxa    %g6, [%g0 + ASI_SPU_CWQ_HEAD] %asi	!# then to head
    stxa    %g6, [%g0 + ASI_SPU_CWQ_TAIL] %asi	!# then to tail
    setx CWQ_LAST, %g1, %g5				!# then end of CWQ region to LAST
    stxa    %g5, [%g0 + ASI_SPU_CWQ_LAST] %asi

    !# set  CWQ control word ([39:37] is strand ID ..)
    best_set_reg(0x20610000, %g1, %g2)		!#		Control Word
    ldxa [%g0]0x63, %g1  ! get my TID for interrupt steering ..
    sllx %g1, 5, %g1
    or %g2, %g1, %g2
    sllx %g2, 32, %g2

    !# write CWQ entry (%g6 points to CWQ)
    stx  %g2, [%g6 + 0x0]

    setx msg, %g1, %g2
    stx %g2, [%g6 + 0x8]	!# source address

    stx %g0, [%g6 + 0x10]	!# Authentication Key  Address (40-bit)
    stx %g0, [%g6 + 0x18]	!# Authentication IV   Address (40-bit)
    stx %g0, [%g6 + 0x20]	!# Authentication FSAS Address (40-bit)
    stx %g0, [%g6 + 0x28]	!# Encryption Key Address (40-bit)
    stx %g0, [%g6 + 0x30]	!# Encryption Initialization Vector Address (40-bit)

    setx    results, %g1, %o3
    stx %o3, [%g6 + 0x38]	!# Destination Address (40-bit)

    membar #Sync

    ldxa    [%g0 + ASI_SPU_CWQ_TAIL] %asi, %g2
    add %g2, 0x40, %g2
    stxa    %g2, [%g0 + ASI_SPU_CWQ_TAIL] %asi

    !# Kick off the CWQ operation by writing to the CWQ_CSR
    !# Set the enabled bit and reset the other bits
    or      %g0, 0x1, %g1
    stxa    %g1,    [%g0 + ASI_SPU_CWQ_CSR] %asi


    mov 100, %g1
wait_for_int:
    brnz,a %g1, wait_for_int
    dec %g1

halt1:
    rdhpr %halt, %g7

    wrpr %g0, 0x2, %pstate  ! enable  IE

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

SECTION .CWQ_DATA DATA_VA =0x4000
attr_data {
    Name = .CWQ_DATA 
    hypervisor
}

.data
.align 16
.global msg
msg:
.xword 0xad32fa52374cc6ba
.xword 0x4cbf52280549003a

.align 16
.global results
results:
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
!# CWQ data area 
.align 64
.global CWQ_BASE
CWQ_BASE:
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.global CWQ_LAST
.align 64
CWQ_LAST:
.word 0x0

