/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: FcNiuPIO_1C_8T.s
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
#define RCRSTAT_A_Addr		    mpeval(DMC_ADDRESS_RANGE+0x00050)
#define H_HT0_Data_access_error_0x32
#define SUN_H_HT0_Data_access_error_0x32 \
        inc     %l4; \
        done;
# 20 "diag.j.pp"
#include "hboot.s"
#include "niu_defines.h"
.text
.global main
main:
        ta T_CHANGE_HPRIV
        nop
! branch to main by comparing thread id.

	ta      T_RD_THID

	mov	0x1, %g2
        cmp     %g2, %o1
	be      THREAD_01
	nop

	mov	0x2, %g2
        cmp     %g2, %o1
	be      THREAD_02
	nop

	mov	0x3, %g2
        cmp     %g2, %o1
	be      THREAD_03
	nop

	mov	0x4, %g2
        cmp     %g2, %o1
	be      THREAD_04
	nop

	mov	0x5, %g2
        cmp     %g2, %o1
	be      THREAD_05
	nop

	mov	0x6, %g2
        cmp     %g2, %o1
	be      THREAD_06
	nop

	mov	0x7, %g2
        cmp     %g2, %o1
	be      THREAD_07
	nop

        brz     %o1, THREAD_00
	and	%o1, %g3, %g1
	nop

!
! Thread 0 Start
!
!
THREAD_00:

	setx    fflp_config_addr, %g1, %g2
	setx    ipp_config0_addr, %g1, %g3
	add     %g3, 0x160, %g5
	setx    0xaa, %g1, %o3
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %o2
	stxa    %o3, [%g3]ASI_PRIMARY_LITTLE
	nop
        setx    loop_count, %g1, %g4
delay_loop_0:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g1
        ldxa     [%g5]ASI_PRIMARY_LITTLE, %g6
        ldxa     [%g3]ASI_PRIMARY_LITTLE, %g1
        dec     %g4
        brnz    %g4, delay_loop_0
        nop

test_passed_00:
	nop
        EXIT_GOOD


THREAD_01:

	nop

	setx    fflp_config_addr, %g1, %g2
	setx    ipp_config0_addr, %g1, %g3
	add     %g3, 0x160, %g5
	setx    0x55, %g1, %o2
	ldxa    [%g3]ASI_PRIMARY_LITTLE, %o3

	stxa    %o2, [%g2]ASI_PRIMARY_LITTLE
        setx    loop_count, %g1, %g4
delay_loop_1:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g1
        ldxa     [%g5]ASI_PRIMARY_LITTLE, %g6
        ldxa     [%g3]ASI_PRIMARY_LITTLE, %g1
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_1 
        nop

test_passed_01:
	nop
        EXIT_GOOD
# 163 "diag.j.pp"

THREAD_02:

	nop

	setx    fflp_config_addr, %g1, %g2
	setx    ipp_config0_addr, %g1, %g3
	add     %g3, 0x160, %g5
	setx    0x55, %g1, %o2
	ldxa    [%g3]ASI_PRIMARY_LITTLE, %o3

	stxa    %o2, [%g2]ASI_PRIMARY_LITTLE
        setx    loop_count, %g1, %g4
delay_loop_2:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g1
        ldxa     [%g5]ASI_PRIMARY_LITTLE, %g6
        ldxa     [%g3]ASI_PRIMARY_LITTLE, %g1
        dec     %g4
        brnz    %g4, delay_loop_2
        nop

test_passed_02:
	nop
        EXIT_GOOD
# 198 "diag.j.pp"

THREAD_03:

	nop

	setx    fflp_config_addr, %g1, %g2
	setx    ipp_config0_addr, %g1, %g3
	add     %g3, 0x160, %g5
	setx    0x55, %g1, %o2
	ldxa    [%g3]ASI_PRIMARY_LITTLE, %o3

	stxa    %o2, [%g2]ASI_PRIMARY_LITTLE
        setx    loop_count, %g1, %g4
delay_loop_3:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g1
        ldxa     [%g5]ASI_PRIMARY_LITTLE, %g6
        ldxa     [%g3]ASI_PRIMARY_LITTLE, %g1
        dec     %g4
        brnz    %g4, delay_loop_3
        nop

test_passed_03:
	nop
        EXIT_GOOD
# 233 "diag.j.pp"

THREAD_04:

	nop

	setx    fflp_config_addr, %g1, %g2
	setx    ipp_config0_addr, %g1, %g3
	add     %g3, 0x160, %g5
	setx    0x55, %g1, %o2
	ldxa    [%g3]ASI_PRIMARY_LITTLE, %o3

	stxa    %o2, [%g2]ASI_PRIMARY_LITTLE
        setx    loop_count, %g1, %g4
delay_loop_4:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g1
        ldxa     [%g5]ASI_PRIMARY_LITTLE, %g6
        ldxa     [%g3]ASI_PRIMARY_LITTLE, %g1
        dec     %g4
        brnz    %g4, delay_loop_4
        nop

test_passed_04:
	nop
        EXIT_GOOD
# 268 "diag.j.pp"

THREAD_05:

	nop

	setx    fflp_config_addr, %g1, %g2
	setx    ipp_config0_addr, %g1, %g3
	add     %g3, 0x160, %g5
	setx    0x55, %g1, %o2
	ldxa    [%g3]ASI_PRIMARY_LITTLE, %o3

	stxa    %o2, [%g2]ASI_PRIMARY_LITTLE
        setx    loop_count, %g1, %g4
delay_loop_5:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g1
        ldxa     [%g5]ASI_PRIMARY_LITTLE, %g6
        ldxa     [%g3]ASI_PRIMARY_LITTLE, %g1
        dec     %g4
        brnz    %g4, delay_loop_5
        nop

test_passed_05:
	nop
        EXIT_GOOD
# 302 "diag.j.pp"

THREAD_06:

	nop

	setx    fflp_config_addr, %g1, %g2
	setx    ipp_config0_addr, %g1, %g3
	add     %g3, 0x160, %g5
	setx    0x55, %g1, %o2
	ldxa    [%g3]ASI_PRIMARY_LITTLE, %o3

	stxa    %o2, [%g2]ASI_PRIMARY_LITTLE
        setx    loop_count, %g1, %g4
delay_loop_6:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g1
        ldxa     [%g5]ASI_PRIMARY_LITTLE, %g6
        ldxa     [%g3]ASI_PRIMARY_LITTLE, %g1
        dec     %g4
        brnz    %g4, delay_loop_6
        nop

test_passed_06:
	nop
        EXIT_GOOD
# 336 "diag.j.pp"

THREAD_07:

	nop

	setx    fflp_config_addr, %g1, %g2
	setx    ipp_config0_addr, %g1, %g3
	add     %g3, 0x160, %g5
	setx    0x55, %g1, %o2
	ldxa    [%g3]ASI_PRIMARY_LITTLE, %o3

	stxa    %o2, [%g2]ASI_PRIMARY_LITTLE
        setx    loop_count, %g1, %g4
delay_loop_7:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g1
        ldxa     [%g5]ASI_PRIMARY_LITTLE, %g6
        ldxa     [%g3]ASI_PRIMARY_LITTLE, %g1
        dec     %g4
        brnz    %g4, delay_loop_7
        nop

test_passed_07:
	nop
        EXIT_GOOD
# 373 "diag.j.pp"

#if 0
#endif

