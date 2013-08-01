/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_core_id.s
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
    wr   %g0,ASI_CMP_CORE_ID_BASE,%asi

    ldxa [ASI_CMP_CORE_INTR_ID]%asi,%g1
    ldxa [ASI_CMP_CORE_ID]%asi,%g2
    cmp  %g1,%o1
    bne  test_fail
    nop
    setx 0x00000007003f0000,%g7,%g3
    or   %g3,%o1,%g3
    cmp  %g2,%g3
    bne  test_fail
    nop

    cmp  %o1,63
    be   test_pass
    nop

    wr   %g0,ASI_CMP_CORE,%asi
    ldxa [ASI_CMP_CORE_RUNNING_STATUS]%asi,%g1
    sllx %g1,1,%g2
    stxa %g2,[ASI_CMP_CORE_RUNNING_RW]%asi

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

