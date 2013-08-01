/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_intmem_regs.s
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

!Write then read data of  MONDO_BUSY_REG 
    setx 0x0000008000000000,%g7,%g1
    setx reg_data,%g7,%g2
    set  128,%g3

loop1:
    ldx  [%g2],%g4
    stx  %g4,[%g1]
    ldx [%g1], %g5
    cmp %g4, %g5
    bne %xcc, test_fail


    add  %g1,8,%g1
    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0

    bne  loop1
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
reg_data:
    .xword 0x0000000000003f3f
    .xword 0x0000000000002a2a
    .xword 0x0000000000001203
    .xword 0x0000000000001515
    .xword 0x0000000000003f2a
    .xword 0x0000000000002307
    .xword 0x0000000000001914
    .xword 0x0000000000003b2d
    .xword 0x0000000000002b3e
    .xword 0x0000000000001703
    .xword 0x0000000000003b1e
    .xword 0x0000000000003a2d
    .xword 0x0000000000003e38
    .xword 0x000000000000330e
    .xword 0x0000000000000319
    .xword 0x0000000000003e2e
    .xword 0x0000000000003537
    .xword 0x0000000000002304
    .xword 0x0000000000003e19
    .xword 0x0000000000000022
    .xword 0x0000000000003235
    .xword 0x0000000000000605
    .xword 0x000000000000031d
    .xword 0x000000000000082b
    .xword 0x0000000000003634
    .xword 0x0000000000002a03
    .xword 0x0000000000000f19
    .xword 0x0000000000003d3b
    .xword 0x0000000000002a2b
    .xword 0x0000000000003d07
    .xword 0x0000000000002c12
    .xword 0x0000000000002d32
    .xword 0x0000000000003f21
    .xword 0x0000000000003f3f
    .xword 0x0000000000002a2a
    .xword 0x0000000000001203
    .xword 0x0000000000001515
    .xword 0x0000000000003f2a
    .xword 0x0000000000002337
    .xword 0x0000000000001904
    .xword 0x0000000000003b1d
    .xword 0x0000000000002b2e
    .xword 0x0000000000001733
    .xword 0x0000000000003b0e
    .xword 0x0000000000003a1d
    .xword 0x0000000000003e28
    .xword 0x000000000000332e
    .xword 0x0000000000000339
    .xword 0x0000000000003e0e
    .xword 0x0000000000003517
    .xword 0x0000000000002324
    .xword 0x0000000000003e39
    .xword 0x0000000000000002
    .xword 0x0000000000003215
    .xword 0x0000000000000625
    .xword 0x000000000000033d
    .xword 0x000000000000080b
    .xword 0x0000000000003614
    .xword 0x0000000000002a23
    .xword 0x0000000000000f39
    .xword 0x0000000000003d0b
    .xword 0x0000000000002a1b
    .xword 0x0000000000003d27
    .xword 0x0000000000002c32
    .xword 0x0000000000002d02
    .xword 0x0000000000003f11
    .xword 0x0000000000003f2f
    .xword 0x0000000000002a3a
    .xword 0x0000000000001203
    .xword 0x0000000000001515
    .xword 0x0000000000003f2a
    .xword 0x0000000000002337
    .xword 0x0000000000001904
    .xword 0x0000000000003b1d
    .xword 0x0000000000002b2e
    .xword 0x0000000000001723
    .xword 0x0000000000003b3e
    .xword 0x0000000000003a0d
    .xword 0x0000000000003e18
    .xword 0x000000000000332e
    .xword 0x0000000000000329
    .xword 0x0000000000003e3e
    .xword 0x0000000000003507
    .xword 0x0000000000002314
    .xword 0x0000000000003e29
    .xword 0x0000000000000032
    .xword 0x0000000000003205
    .xword 0x0000000000000615
    .xword 0x000000000000032d
    .xword 0x000000000000082b
    .xword 0x0000000000003634
    .xword 0x0000000000002a03
    .xword 0x0000000000000f19
    .xword 0x0000000000003d2b
    .xword 0x0000000000002a3b
    .xword 0x0000000000003d07
    .xword 0x0000000000002c12
    .xword 0x0000000000002d32
    .xword 0x0000000000003f21
    .xword 0x0000000000003f3f
    .xword 0x0000000000002a2a
    .xword 0x0000000000001203
    .xword 0x0000000000001525
    .xword 0x0000000000003f1a
    .xword 0x0000000000002337
    .xword 0x0000000000001924
    .xword 0x0000000000003b0d
    .xword 0x0000000000002b1e
    .xword 0x0000000000001723
    .xword 0x0000000000003b3e
    .xword 0x0000000000003a0d
    .xword 0x0000000000003e18
    .xword 0x000000000000332e
    .xword 0x0000000000000339
    .xword 0x0000000000003e0e
    .xword 0x0000000000003517
    .xword 0x0000000000002324
    .xword 0x0000000000003e09
    .xword 0x0000000000002l12
    .xword 0x0000000000003215
    .xword 0x0000000000000605
    .xword 0x000000000000132d
    .xword 0x000000000000083b
    .xword 0x0000000000003604
    .xword 0x0000000000002a13
    .xword 0x0000000000000f29
    .xword 0x0000000000003d3b
    .xword 0x0000000000002a2b
    .xword 0x0000000000003d17
    .xword 0x0000000000002c12
.end
