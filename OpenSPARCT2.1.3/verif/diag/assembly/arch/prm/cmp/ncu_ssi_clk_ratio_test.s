/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_ssi_clk_ratio_test.s
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
#include "asi_s.h"

.text
.global	 main

main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID
    wr   %g0,ASI_CMP_CORE,%asi

    cmp  %o1,0x0
    bne  test_fail
    nop

    setx 0x8000003040,%g7,%g1
    ldx  [%g1],%g2
    cmp  %g2,0x1
    be   new_clk_ratio
    nop

!Write words to the SSI interface
    setx 0x000000ffffff0000,%g7,%g1
    setx data_word,%g7,%g2
    set  0x08,%g3
loop0:
    lduw [%g2],%g4
    stw  %g4,[%g1]
    add  %g1,4,%g1
    add  %g2,4,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop0
    nop

! Reset to new clock ratio and warm reset
    set  0x1,%g2
    setx 0x8000003040,%g7,%g1
    stx  %g2,[%g1]
    setx 0x8900000808,%g7,%g1
    stx  %g2,[%g1]

halt:
    ba   halt
    nop

new_clk_ratio:
!Read back and confirm
    setx 0x000000ffffff0000,%g7,%g1
    setx data_word,%g7,%g2
    set  0x08,%g3
loop1:
    lduw [%g1],%g4
    lduw [%g2],%g5
    cmp  %g4,%g5
    bne  %xcc,test_fail
    nop
    add  %g1,4,%g1
    add  %g2,4,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop1
    nop

    ba   test_pass
    nop

/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD

.data
.align 0x100
data_word:
    .word 0x239232ab
    .word 0x3923badf
    .word 0x482ba83a
    .word 0xa62ed082
    .word 0xab667bdc
    .word 0xc3923bef
    .word 0x8faa9832
    .word 0xdea02003
    .word 0xb202023b
    .word 0x2035723b
    .word 0x9923ced7
    .word 0x8a29823b
    .word 0x33eeee9e
    .word 0x5beaf092
    .word 0xbfabfe22
    .word 0xa0aaccde
    .word 0x10a0a993
    .word 0x02fccbef
    .word 0xbcc553f3
    .word 0xad20833f
    .word 0xae29083a
    .word 0x92298235
    .word 0x447034b5
    .word 0x3c3b24fd
    .word 0xffce09df
    .word 0xf198122f
    .word 0x9fa32782
    .word 0x6d329263
    .word 0xeb887611
    .word 0xda340823
    .word 0xd3219bd7
    .word 0xa8293200
.end
