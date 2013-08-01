/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_xir.s
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

!! Need to disable some cores also
! Disable some cores
    !setx 0xffffff0000ffffff,%g7,%g1
    !stxa %g1,[ASI_CMP_CORE_ENABLE]%asi

! Set asi_xir_steering 
    setx 0x0006060000060606,%g7,%g1
    stxa %g1,[0x30]%asi

    call sleep
    nop

! Check that XIR trap was not taken by thread yet
    setx xir_cnt,%g7,%g1
    lduw [%g1],%g2
    cmp  %g2,%g0
    bne  test_fail
    nop
    
! XIR reset
    setx 0x8900000808,%g7,%g1
    set  0x2,%g2
    stx  %g2,[%g1]

! Wait for threads to take the XIR trap
    setx xir_cnt,%g7,%g1
    set  0xef,%g2
xirs_not_done: 
    lduw [%g1],%g3
    cmp  %g3,%g2
    bl   xirs_not_done
    nop
    bne  test_fail
    nop
    
! Wait a little longer in case something else took an xir trap
    call sleep
    nop
    lduw [%g1],%g3
    cmp  %g3,%g2
    bne  test_fail
    nop

! Check that RESET_GEN was cleared
    setx 0x8900000808,%g7,%g1
    ldx  [%g1],%g2
    cmp  %g2,%g0
    bne  test_fail
    nop

    ba   test_pass
    nop
    
other_threads:
    setx 0x200005000,%g7,%g1
    add  %g1,%o1,%g1

wait_for_xir:
    ldub [%g1],%g2
    cmp  %g2,0x1
    bne  wait_for_xir
    nop
    
! Get access to common cntrs
    set  0x1,%g2
    setx xir_cnt_access,%g7,%g1
    set  0x0,%g3

spin_lock_ot:
    cas  [%g1],%g2,%g3
    cmp  %g3,0x1
    bne  spin_lock_ot
    nop

    setx xir_cnt,%g7,%g4
    lduw [%g4],%g2
    add  %g2,%o1,%g2
    stw  %g2,[%g4]

! Release common cntrs
    stw  %g3,[%g1]

    ba   test_pass
    nop

/******************************************************
 * Subroutine code
 *******************************************************/

sleep:
    rd   %tick,%l2
    setx 0x00000000000000ff,%g7,%l1
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

.data
xir_cnt_access:
    .word 0x00000001
xir_cnt:
    .word 0x00000000
.end

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
