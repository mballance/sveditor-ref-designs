/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: rst_csrs.s
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

!Write then read data of  RSET_STAT   
 setx 0x0000008900000810,%g7,%g1
    setx reset_stat,%g7,%g2
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

!Write then read data of  RESET_FEE   
 setx 0x0000008900000820,%g7,%g1
    setx reset_fee,%g7,%g2
    set  0x06,%g3

loop3:
    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop3
    nop


!Write then read data of  CCU_TIME   
 setx 0x0000008900000860,%g7,%g1
    setx ccu_time,%g7,%g2
    set  0x06,%g3

loop4:
    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop4
    nop
/*

!Write then read data of  LOCK_TIME   
 setx 0x0000008900000870,%g7,%g1
    setx ccu_time,%g7,%g2
    set  0x06,%g3

loop5:
    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop5
    nop

!Write then read data of  PROP_TIME   
 setx 0x0000008900000880,%g7,%g1
    setx ccu_time,%g7,%g2
    set  0x06,%g3

loop6:
    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop6
    nop

!Write then read data of  NIU_TIME   
 setx 0x0000008900000890,%g7,%g1
    setx ccu_time,%g7,%g2
    set  0x06,%g3

loop7:
    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop7
    nop

*/



/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD


.data
.align 0x100
ssys_reset_data:
    .xword 0x0000000000000073
    .xword 0x0000000000000022
    .xword 0x0000000000000051
    .xword 0x0000000000000000
    .xword 0x0000000000000043
    .xword 0x0000000000000031

.align 0x100
reset_stat:
    .xword 0x0000000000000e0e
    .xword 0x0000000000000a0a
    .xword 0x0000000000000404
    .xword 0x0000000000000000
    .xword 0x0000000000000808
    .xword 0x0000000000000202

.align 0x100
reset_fee:
    .xword 0x000000000000ff00
    .xword 0x000000000000aa00
    .xword 0x0000000000005500
    .xword 0x0000000000000000
    .xword 0x0000000000008800
    .xword 0x0000000000002200

.align 0x100
ccu_time:
    .xword 0x000000000000ffff
    .xword 0x000000000000aaaa
    .xword 0x0000000000005555
    .xword 0x0000000000000000
    .xword 0x0000000000008888
    .xword 0x0000000000002222


.end

