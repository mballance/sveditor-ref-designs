/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_bank_en_wptect.s
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

#ifndef BANK_AVAIL
#define BANK_AVAIL 0xff
#endif

.text
.global	 main


main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID
    wr   %g0,ASI_CMP_CORE,%asi

! Testing settings from last core
! Check that bank_avail and bank_enable are correct
    setx 0x8000001018,%g7,%g2
    ldx  [%g2],%g4
    setx BANK_AVAIL,%g7,%g2
    cmp  %g2,%g4
    bne  test_fail
    nop

    setx 0x8000001020,%g7,%g2
    ldx  [%g2],%g4
    setx 0xffffff0000,%g7,%g3
    lduw [%g3],%g5

    cmp  %o1,0x0
    bne  all_th
    nop
    setx BANK_AVAIL,%g7,%g5
all_th:
    cmp  %g4,%g5
    bne  test_fail
    nop

! Last core - quit
    cmp  %o1,24
    be   test_pass
    nop

! Program bank_enable
    set  0xff,%g7
    xor  %g7,%o1,%g6
    stx  %g6,[%g2]

! Save it in memory
    setx BANK_AVAIL,%g7,%g2
    and  %g6,%g2,%g6
    stw  %g6,[%g3]
    lduw [%g3],%g6

! Turn on next core
    setx 0x000000000000ff00,%g7,%g1
    sllx %g1,%o1,%g1
    stxa %g1,[ASI_CMP_CORE_ENABLE]%asi
    setx 0x8900000808,%g7,%g2
    set  0x1,%g1
    stx  %g1,[%g2]

halt:
    ba   halt
    nop

/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD
