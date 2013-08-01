/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_pm_mcu_cmda_2bank.s
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

#ifdef BANK0
#define L2_0_ADDR0      0x220000000
#endif

#ifdef BANK1
#define L2_0_ADDR0      0x220000040
#endif

#define L2_0_ADDR1      0xff000

#define	TAG_SHIFT	22

#ifdef L2_OFF
#define L2_ON_OFF_DM	0x1
#else
#define L2_ON_OFF_DM    0x0
#endif
 
#define BANK_LOOP	0x8
#define DIMM_RANK_LOOP	0x10

.text
.global	 main


main:
  ta	T_CHANGE_HPRIV
	nop
setx	0x1, %g7, %g5
setx	0x8400000040, %g7, %g3
stx	%g5, [%g3]
setx	0x8400001040, %g7, %g3
stx	%g5, [%g3]
setx	0x8400002040, %g7, %g3
stx	%g5, [%g3]
setx	0x8400003040, %g7, %g3
stx	%g5, [%g3]
setx	0x8400000238, %g7, %g3
stx	%g5, [%g3]
setx	0x8400001238, %g7, %g3
stx	%g5, [%g3]
setx	0x8400002238, %g7, %g3
stx	%g5, [%g3]
setx	0x8400003238, %g7, %g3
stx	%g5, [%g3]

setx	0x200, %g7, %g5
setx	0x8400000018, %g7, %g3
stx	%g5, [%g3]
setx	0x200, %g7, %g5
setx	0x8400001018, %g7, %g3
stx	%g5, [%g3]
setx	0x200, %g7, %g5
setx	0x8400002018, %g7, %g3
stx	%g5, [%g3]
setx	0x200, %g7, %g5
setx	0x8400003018, %g7, %g3
stx	%g5, [%g3]


        /******************************************
                Memory Read/Write
        ******************************************/
ld_st:
        setx    L2_0_ADDR1, %g7, %g3

        setx    0x0, %g7, %g1
	setx	0x0, %g7, %l1
	setx	0x0, %g7, %l2
	setx	0x40, %g7, %l3
	setx	0x200000000, %g7, %l4
	setx	DIMM_RANK_LOOP, %g7, %l5
	setx	BANK_LOOP, %g7, %l6

dimm_rank_loop:
	nop

bank_loop:
	stx	%g1, [%g3]
	inc	%g1
	ldx	[%g3], %o1
	add	%l3, %g3, %g3	
	inc	%l2
	cmp	%l2, %l6
	bne	bank_loop
	nop


	mov	0x0, %l2
	add	%l4, %g3, %g3

	inc	%l1
	cmp	%l1, %l5
	bne	dimm_rank_loop




/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD

