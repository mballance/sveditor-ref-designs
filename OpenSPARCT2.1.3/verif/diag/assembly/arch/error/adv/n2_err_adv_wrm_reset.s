/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_adv_wrm_reset.s
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
#define ENABLE_PCIE_LINK_TRAINING
/* #define MAIN_PAGE_NUCLEUS_ALSO */ /* Access main in priviledge mode */
#define MAIN_PAGE_HV_ALSO

#include "err_defines.h"
#include "hboot.s"
#include "peu_defines.h"


#define ERR_BITS                0x80
#define ERR_BITS_EXPECT         0x8000000000000080

    
/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

	clr	%i7
	clr	%o6
	clr	%o7
	clr	%i0

fee_reg_ones_rdd:
        setx    SOC_FEE_REG, %g3, %g2
        set     0xf, %g1
        stx     %g1, [%g2]
        membar  0x40

esr_reg_ones_rdd:
	setx	SOC_ESR_REG, %g3, %g2
	set	0xf, %g1
	stx	%g1, [%g2]
	membar	0x40

L2_err_enable:
        set	0x3, %l1 
	setx	0x420000, %g3, %g2

        stx     %l1, [%g2]
        stx     %l1, [%g2 + 0x40]
        stx     %l1, [%g2 + 0x80]
        stx     %l1, [%g2 + 0xc0]
        stx     %l1, [%g2 + 0x100]
        stx     %l1, [%g2 + 0x140]
        stx     %l1, [%g2 + 0x180]
        stx     %l1, [%g2 + 0x1c0]

	stx	%l1, [%g2]
	stx	%l1, [%g2 + 0x40]
	stx	%l1, [%g2 + 0x80]
	stx	%l1, [%g2 + 0xc0]
	stx	%l1, [%g2 + 0x100]
	stx	%l1, [%g2 + 0x140]
	stx	%l1, [%g2 + 0x180]
	stx	%l1, [%g2 + 0x1c0]


test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


