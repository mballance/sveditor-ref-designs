/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_ncu_cmp.s
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

#define L20 0x0000134000
#define L21 0x0000134040

#define L22 0x0000134080
#define L23 0x00001340c0

#define L24 0x0000134100
#define L25 0x0000134140

#define L26 0x0000134180
#define L27 0x00001341c0

.text
.global	 main


main:
        ta      T_CHANGE_HPRIV
	nop

get_th_id_o0:
        ta      T_RD_THID

        cmp     %o1, 0x0
        be      main_t0
        nop

        cmp     %o1, 0x1
        be      main_t1
        nop

	
main_t0:
	! msa 01/16/07
    	wr	%g0, ASI_CMP_CORE, %asi
    	ldxa 	[ASI_CMP_CORE_ENABLED]%asi, %g1
	setx	0x0202020202020202, %g7, %g6
	and	%g1, %g6, %g4
!	set	0x2, %g4
	stxa 	%g4, [ASI_CMP_CORE_RUNNING_W1S]%asi
	nop
	ba	L2_Init
	nop


main_t1:
	nop
	nop
	nop
        ba      L2_Init
	nop


/*******************
   DIMM 0,1
*******************/
chk_core_running_status_reg:
        wr      %g0, ASI_CMP_CORE, %asi
        ldxa    [ASI_CMP_CORE_RUNNING_STATUS]%asi, %l0

L2_Init:
        setx    0x1111111111111110, %g7, %o0
        setx    0x2222222222222220, %g7, %o1
        setx    0x3333333333333330, %g7, %o2
        setx    0x4444444444444440, %g7, %o3
        setx    0x5555555555555550, %g7, %o4
        setx    0x6666666666666660, %g7, %o5
        setx    0x8888888888888880, %g7, %o6
        setx    0x9999999999999990, %g7, %o7

        setx    L20, %g7, %l0
        setx    L21, %g7, %l1

        setx    L22, %g7, %l2
        setx    L23, %g7, %l3

        setx    L24, %g7, %l4
        setx    L25, %g7, %l5

        setx    L26, %g7, %l6
        setx    L27, %g7, %l7

L2_0:
        stx     %o0, [%l0]
        ldx     [%l0], %g1

L2_1:
        stx     %o1, [%l1]
        ldx     [%l1], %g1

L2_2:
        stx     %o2, [%l2]
        ldx     [%l2], %g1

L2_3:
        stx     %o3, [%l3]
        ldx     [%l3], %g1

L2_4:
        stx     %o4, [%l4]
        ldx     [%l4], %g1

L2_5:
        stx     %o5, [%l5]
        ldx     [%l5], %g1

L2_6:
        stx     %o6, [%l6]
        ldx     [%l6], %g1

L2_7:
        stx     %o7, [%l7]
        ldx     [%l7], %g1


/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD

