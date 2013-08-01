/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_asi_core_en_status_wptect.s
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

    cmp  %o1,0
    be   core_0
    nop
    cmp  %o1,8
    be   core_1
    nop
    cmp  %o1,24
    be   core_3
    nop
    ba   test_pass
    nop

core_0:
! Program asi_core_enable
    setx 0xffff01ff53ffff7f,%g7,%g1
    stxa %g1,[ASI_CMP_CORE_ENABLE]%asi

! Check asi_core_enable_status
    ldxa [ASI_CMP_CORE_ENABLED]%asi,%g2
    setx 0xffffffffffffffff,%g7,%g1
    cmp  %g2,%g1
    bne  %xcc,test_fail
    nop

! Warm reset
    setx 0x8900000808,%g7,%g2
    set  0x1,%g1
    stx  %g1,[%g2]

halt:
    ba   halt
    nop

core_1:
! Check asi_core_enabled
    setx 0xffff00ff00ffff00,%g7,%g1
    ldxa [ASI_CMP_CORE_ENABLED]%asi,%g2
    cmp  %g2,%g1
    bne  %xcc,test_fail
    nop

! Program asi_core_enable
    setx 0xfffeff00ff00cffd,%g7,%g3
    stxa %g3,[ASI_CMP_CORE_ENABLE]%asi

! Check asi_core_enable_status
    ldxa [ASI_CMP_CORE_ENABLED]%asi,%g2
    cmp  %g2,%g1
    bne  %xcc,test_fail
    nop

! Warm reset - same core
    setx 0x8900000808,%g7,%g2
    set  0x1,%g1
    stx  %g1,[%g2]

    ba   halt
    nop

core_3:
    setx 0xffffffff00ffffff,%g7,%g1
    stxa %g1,[ASI_CMP_CORE_RUNNING_RW]%asi

    ba   halt
    nop

/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD

