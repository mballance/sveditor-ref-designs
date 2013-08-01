/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_xir_allth.s
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

#define My_External_Reset setx 0x200005000,%g7,%g1;add %g1,%o1,%g1;set 0x1,%g2;stb %g2,[%g1];done;

#include "hboot.s"
#include "asi_s.h"

.text
.global	 main

main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID

    cmp  %o1,0x0
    bne  other_threads
    nop

    wr   %g0,ASI_CMP_CORE,%asi

! Check that asi_xir_steering is correct
    setx 0xffffffffffffffff,%g7,%g1
    ldxa [0x30]%asi,%g2
    cmp  %g1,%g2
    bne  %xcc,test_fail
    nop

! Start all threads
    stxa %g1,[ASI_CMP_CORE_RUNNING_RW]%asi

! Wait for threads to finish boot
    call sleep
    nop
    call sleep
    nop

! XIR reset
    setx 0x8900000808,%g7,%g1
    set  0x2,%g2
    stx  %g2,[%g1]

other_threads:
    setx 0x200005000,%g7,%g1
    add  %g1,%o1,%g1

wait_for_xir:
    ldub [%g1],%g2
    cmp  %g2,0x1
    bne  wait_for_xir
    nop
    
    ba   test_pass
    nop

/******************************************************
 * Subroutine code
 *******************************************************/

sleep:
    rd   %tick,%l2
    setx 0x0000000000000fff,%g7,%l1
    add  %l1,%l2,%l1
sleep_loop:
    rd   %tick,%l2
    cmp  %l1,%l2
    bpos %xcc,sleep_loop
    nop
    retl
    nop

/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD

SECTION my_xir_trap_handler DATA_VA=0x200005000
    attr_data {
        Name = my_xir_trap_handler,
	hypervisor,
	compressimage
        }  

.data
xir_trap_handler:
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
.end
