/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_ncu_l2_core_enable.s
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


#define DRAM0_ERROR_COUNTER_REG		0x8400000298
#define DRAM1_ERROR_COUNTER_REG         0x8400001298
#define DRAM2_ERROR_COUNTER_REG         0x8400002298
#define DRAM3_ERROR_COUNTER_REG         0x8400003298

#define L2_BANK_ENABLE_REG		0x8000001020
#define CORE_ENABLE_REG			0x9001040020
#define XIR_STEERING_REG		0x9001040030
#define ASI_WMR_VEC_MASK_REG		0x9001140018

#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"
#include "tcu_defines.h"


.text
.global	 main


main:
  ta	  T_CHANGE_HPRIV


L2_Bank_Enable_Reg_all_zeros:
	setx	L2_BANK_ENABLE_REG, %g7, %g1
	stx	%g0, [%g1]
	ldx	[%g1], %g3
	set	0x3, %g2			! Lowest 2 Banks has to be enabled if all are written to zero;
						! To be confirmed from PRM
	cmp	%g2, %g3
	bne	%xcc, test_failed
	nop


L2_Bank_Enable_Reg_B01_off:
        set     0xfe, %g2
        stx     %g2, [%g1]
        ldx     [%g1], %g3
        set     0xfe, %g2                       ! 
        cmp     %g2, %g3
        bne     %xcc, test_failed
        nop

        set     0xfd, %g2
        stx     %g2, [%g1]
        ldx     [%g1], %g3
        set     0xfd, %g2                       ! 
        cmp     %g2, %g3
        bne    %xcc, test_failed
        nop


L2_Bank_Enable_Reg_B23_off:
	set	0xfb, %g2
	stx	%g2, [%g1]
	ldx	[%g1], %g3
	set	0xfb, %g2			!
	cmp	%g2, %g3
	bne	%xcc, test_failed
	nop

        set     0xf7, %g2
        stx     %g2, [%g1]
        ldx     [%g1], %g3
        set     0xf7, %g2                       ! 
        cmp     %g2, %g3
        bne     %xcc, test_failed
        nop


L2_Bank_Enable_Reg_B45_off:
        set     0xef, %g2
        stx     %g2, [%g1]
        ldx     [%g1], %g3
        set     0xef, %g2                       ! 
        cmp     %g2, %g3
        bne     %xcc, test_failed
        nop

        set     0xdf, %g2
        stx     %g2, [%g1]
        ldx     [%g1], %g3
        set     0xdf, %g2                       ! 
        cmp     %g2, %g3
        bne     %xcc, test_failed
        nop

L2_Bank_Enable_Reg_B67_off:
        set     0xbf, %g2
        stx     %g2, [%g1]
        ldx     [%g1], %g3
        set     0xbf, %g2                       ! 
        cmp     %g2, %g3
        bne     %xcc, test_failed
        nop

        set     0x7f, %g2
        stx     %g2, [%g1]
        ldx     [%g1], %g3
        set     0x7f, %g2                       ! 
        cmp     %g2, %g3
        bne     %xcc, test_failed
        nop




/***********************************
	Core Enable Reg
***********************************/
Core_Enable_Reg_default:
	setx	CORE_ENABLE_REG, %g7, %g1
	ldx	[%g1], %g3			! default value

Core_Enable_Reg_all_ONEs:
	setx	0xffffffffffffffff, %g7, %g2
	stx	%g2, [%g1]
	ldx	[%g1], %g3

	! check that all bits are not Zero
Core_Enable_Reg_all_ZEROs:
	stx	%g0, [%g1]
	ldx	[%g1], %g3
	set	0xff, %g2			! Lowest Core to be enabled if all are written to zero;
                                                ! To be confirmed from PRM
	cmp	%g2, %g0
	be	%xcc, test_failed
	nop


/***********************************
	XIR Steering Reg
***********************************/
XIR_Steering_Reg_default:
	setx    XIR_STEERING_REG, %g7, %g1
	ldx	[%g1], %g3		!default value

XIR_Steering_Reg_all_ones:
	setx	0xffffffffffffffff, %g7, %g2
	stx	%g2, [%g1]
	ldx	[%g1], %g3

XIR_Steering_Reg_all_zeros:
	stx	%g0, [%g1]
	ldx	[%g1], %g3
	cmp	%g0, %g3			! All ZEROS
       	bne	%xcc, test_failed
	nop

/***********************************
	ASI WMR VEC MASK  Reg
***********************************/
wmr_vec_Reg_default:
	setx	ASI_WMR_VEC_MASK_REG, %g7, %g1
	ldx	[%g1], %g3		!default value

wmr_vec_one:
	setx	0xffffffffffffffff, %g7, %g2
	stx	%g2, [%g1]
	ldx	[%g1], %g3
        mov     0x1, %g4
        cmp     %g4, %g3             
        bne     %xcc, test_failed
	nop
wmr_vec_zero:
        stx     %g0, [%g1]
        ldx     [%g1], %g3
        cmp     %g0, %g3                       
        bne     %xcc, test_failed
        nop

test_passesd:


test_passed:
EXIT_GOOD

test_failed:
EXIT_BAD



