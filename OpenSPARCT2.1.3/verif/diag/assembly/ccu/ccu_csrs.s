/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ccu_csrs.s
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
!#include "asi_s.h"

.text
.global	 main


main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID

//    cmp  %o1,0x0
//    bne  test_pass
    nop

!Write then read data of  PLL_CTL 
    setx 0x0000008300000000,%g7,%g1
    setx pll_ctl_data,%g7,%g2
    set  0x06,%g3

loop1:
    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5

    cmp %g4, %g5
    
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop1
    nop



!Write then read data of  RGN_CTL   
 setx 0x0000008300000020,%g7,%g1
    setx rng_ctl_data,%g7,%g2
    set  0x06,%g3

loop2:
    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop2
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
pll_ctl_data:
    .xword 0x0000001fffffffff
    .xword 0x0000001aaaaaaaaa
    .xword 0x0000000555555555
    .xword 0x000000123456789a
    .xword 0x0000000bcedf0123
    .xword 0x0000001456789abc

.align 0x100
rng_ctl_data:
    .xword 0x00000001ffffffff
    .xword 0x00000000aaaaaaaa
    .xword 0x0000000155555555
    .xword 0x000000003456789a
    .xword 0x00000001cedf0123
    .xword 0x0000000056789abc

rng_data:
    .xword 0xffffffffffffffff
    .xword 0x0000000000000000
    .xword 0xaaaaaaaaaaaaaaaa
    .xword 0x5555555555555555
    .xword 0x0123456789abcdef
    .xword 0xfedcba9876543210

.end

