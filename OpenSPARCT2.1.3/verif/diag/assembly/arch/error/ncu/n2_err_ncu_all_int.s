/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_ncu_all_int.s
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
#define H_HT0_Hw_Corrected_Error_0x63 My_Corrected_ECC_error_trap
#define H_HT0_Sw_Recoverable_Error_0x40  My_Recoverable_Sw_error_trap

    
/* #define MAIN_PAGE_NUCLEUS_ALSO */ /* Access main in priviledge mode */
#define MAIN_PAGE_HV_ALSO

#define SOC_ERR_STEERING_REG	0x9001041000

#include "err_defines.h"
#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
.global  My_Corrected_ECC_error_trap
.global  My_Recoverable_Sw_error_trap

main:
        ta T_CHANGE_HPRIV
        nop


errorsteer:
	ldxa	[%g0]ASI_INTR_ID, %o4			! get the thread id; for core-portable
	setx	SOC_ERR_STEERING_REG, %g7, %g1
	stx	%o4, [%g1]
	membar	0x40

clear_esr_first:
        setx    SOC_ESR_REG, %l7, %i0

        stx     %g0, [%i0]

	setx	43, %i0, %o3
	clr	%g1

set_eie:
        set     0x1, %i1
	sllx	%i1, %g1, %i2
        setx    SOC_EIE_REG, %l7, %i3
        stx     %i2, [%i3]
        membar  0x40

set_esr:
	setx  	SOC_ESR_REG, %l7, %g5
	stx   	%i2, [%g5]

	nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop

read_esr:
        setx    SOC_ESR_REG, %l7, %g5
	ldx	[%g5], %l3
	subcc	%l3, %g0, %g2
	brnz   	%g2, read_esr

        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop
        nop; nop; nop

	inc	%g1

	sub	%g1, 24, %l5
        brz    	%l5,  skip_one
        nop

        sub     %g1, 30, %l5
        brz     %l5,  skip_one
        nop

        sub     %g1, 33, %l5
        brz     %l5,  skip_one
        nop

        sub     %g1, 36, %l5
        brz     %l5,  skip_one
        nop

        sub     %g1, 39, %l5
        brz     %l5,  skip_one
        nop

back_to_loop:
	sub     %o3, %g1, %l6
	brnz	%l6, set_eie
	nop
	nop; nop; nop

	ba	count_trap_0x40
	nop

skip_one:
	inc 	%g1
	ba	back_to_loop
	nop


count_trap_0x40:
	set	24, %l1
	sub     %l1, %i6, %l5
	brnz    %l5, test_failed
	nop

count_trap_0x63:
        set     14, %l1
        sub     %l1, %i7, %l5
        brnz    %l5, test_failed
        nop

test_passed:
	nop			
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Trap Handlers
 ************************************************************************/
My_Recoverable_Sw_error_trap:
	! Signal trap taken
	setx  	EXECUTED, %l0, %o6
	! save trap type value
	rdpr  	%tt, %o7

	!DESR
        ldxa  [%g0]0x4c, %g2
        nop

	setx	SOC_PER_REG, %i0, %l1
	stx	%g0, [%l1]

	inc	%i6
	retry
	nop

My_Corrected_ECC_error_trap:
        ! Signal trap taken
        setx  EXECUTED, %l0, %o6
        ! save trap type value
        rdpr  	%tt, %o7

        !DESR
        ldxa  [%g0]0x4c, %g2
        nop

        setx    SOC_PER_REG, %i0, %l1
        stx     %g0, [%l1]
      	inc	%i7 
	retry
	nop
 
 
/************************************************************************
   Test case data start
 ************************************************************************/
/* These initialization is temporary, as there looks some bug in mempli */

SECTION       SetRngConfig_init data_va=0x100000000
attr_data {
	Name = SetRngConfig_init,
	hypervisor,
	compressimage
	}
.data
SetRngConfig_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetTxRingKick_init data_va=0x100000100
attr_data {
	Name = SetTxRingKick_init,
	hypervisor,
	compressimage
	}
.data
SetTxRingKick_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetTxLPMask1_init data_va=0x100000200
attr_data {
        Name = SetTxLPMask1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPMask1_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetTxLPValue1_init data_va=0x100000300
attr_data {
        Name = SetTxLPValue1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValue1_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetTxLPRELOC1_init data_va=0x100000400
attr_data {
        Name = SetTxLPRELOC1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPRELOC1_init:
        .xword 0x0060452301000484
/************************************************************************/
SECTION       SetTxLPMask2_init data_va=0x100000500
attr_data {
        Name = SetTxLPMask2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPMask2_init:
        .xword 0x0060452301000484
/************************************************************************/
SECTION       SetTxLPValue2_init data_va=0x100000600
attr_data {
        Name = SetTxLPValue2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValue2_init:
        .xword 0x0060452301000484

/************************************************************************/
SECTION       SetTxLPRELOC2_init data_va=0x100000700
attr_data {
        Name = SetTxLPRELOC2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPRELOC2_init:
        .xword 0x0060452301000484

/************************************************************************/
SECTION       SetTxLPValid_init data_va=0x100000800
attr_data {
        Name = SetTxLPValid_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValid_init:
        .xword 0x0060452301000484

/************************************************************************/


