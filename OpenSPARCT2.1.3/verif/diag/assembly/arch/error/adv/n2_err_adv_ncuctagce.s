/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_adv_ncuctagce.s
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
#define H_HT0_Sw_Recoverable_Error_0x40	 My_Recoverable_Sw_error_trap

#define ENABLE_PCIE_LINK_TRAINING
#define MAIN_PAGE_HV_ALSO
#define SOC_EST_REG	0x9001041000

#include "err_defines.h"
#include "hboot.s"
#include "peu_defines.h"


#define IO_RD_ADDR mpeval((N2_PCIE_BASE_ADDR + (IOCFG_OFFSET_BASE_REG_DATA & 0x7fffffffffffffff)) | IO_ACCESS_PA)

#define MEM_LOC1 	0x42400000

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
.global	 My_Recoverable_Sw_error_trap
.global	 My_Corrected_ECC_error_trap


main:
        ta T_CHANGE_HPRIV
        nop


        /**************************************
                THREAD 0
        **************************************/
main_t0:
	nop
        setx    MEM_LOC1, %g1, %g3
        st      %g0, [%g3]

clear_esr_first:
        setx    SOC_ESR_REG, %l7, %i0
        stx     %g0, [%i0]


set_ejr:
        set     0x1, %i1
        sllx    %i1, ERR_FIELD, %i2
        setx    SOC_EJR_REG, %l7, %i3
        stx     %i2, [%i3]

set_eie:
        set	0x1, %i1
	sllx	%i1, ERR_FIELD, %i2
	setx	SOC_EIE_REG, %l7, %i3
	stx	%i2, [%i3]

pio_addr:
        setx IO_RD_ADDR, %g1, %g2

pio:
	ldub [%g2], %l0

	setx	0x30, %o5, %g6
	set	0x1, %g7		! 1 Trap
err_trap_loop:
	cmp     %g6, %g0
	be	%xcc, test_failed
        nop

	cmp	%i7, %g7
	be	%xcc, check_tt
        nop

	ba	err_trap_loop
        nop

check_tt:
	mov	0x63, %l0
	cmp	%o7,  %l0
	bne	%xcc, test_failed
        nop

clear_eie:
        set	0x1, %i1
	sllx	%i1, ERR_FIELD, %i2
	setx	SOC_EIE_REG, %l7, %i3
	stx	%g0, [%i3]


clean_pios:
        setx IO_RD_ADDR, %g1, %g2
	ldub [%g2], %l0
	ldub [%g2 + 1*8 + 0], %l0
	ldub [%g2 + 2*8 + 0], %l0
	ldub [%g2 + 3*8 + 0], %l0
	ldub [%g2 + 4*8 + 0], %l0
	ldub [%g2 + 5*8 + 0], %l0
	ldub [%g2 + 6*8 + 0], %l0
	ldub [%g2 + 7*8 + 0], %l0

check_esr:
	setx	SOC_ESR_REG, %l7, %i0
	ldx	[%i0], %i1
	cmp	%g0, %i1
	bne	%xcc, test_failed 
	nop

        /********************************/
	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD



/************************************************************************
	RAS
	Trap Handlers
 ************************************************************************/
My_Recoverable_Sw_error_trap:
	ba	test_failed
	nop


My_Corrected_ECC_error_trap:
	! Signal trap taken
	setx	EXECUTED, %l0, %o6
	! save trap type value
	rdpr	%tt, %o7

	inc	%i7

check_desr_tt63:
	ldxa  [%g0]0x4c, %g2
	nop
	setx    0x8b00000000000000, %l0, %g3
	subcc	%g2, %g3, %g4
	brnz	%g4, test_failed

check_per_tt63:
	setx	SOC_PER_REG, %l7, %i0
	ldx	[%i0], %i1
	setx	0x8000000000000000, %l7, %o3	!valid bit
	set	0x1, %i2
	sllx	%i2, ERR_FIELD, %i3
	or	%i3, %o3, %i4
	sub	%i1, %i4, %i5
	brnz	%i5, test_failed
	nop

clear_per_ejr_tt63:
	setx	SOC_PER_REG, %l7, %i0
	stx	%g0, [%i0]

        setx    SOC_EJR_REG, %l7, %i0
        stx     %g0, [%i0]

	nop
	done
	nop


check_DSFSR_tt63:
	set	0x18, %g1
	ldxa	[%g1]0x58, %g5


trap_done_tt40:
 	done
	nop


/************************************************************************
   Test case data start
************************************************************************/

SECTION       .DATA DATA_VA=IO_RD_ADDR
attr_data {
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
        .xword 0xdeadbeefdeadbeef

        .xword 0x1101010101010101
        .xword 0x0122010101010101
        .xword 0x0101330101010101
        .xword 0x0101014401010101
        .xword 0x0101010155010101
        .xword 0x0101010101660101
        .xword 0x0101010101017701
        .xword 0x0101010101010188

        .xword 0x1122010101010101
        .xword 0x0101334401010101
        .xword 0x0101010155660101
        .xword 0x0101010101017788

        .xword 0x1122334401010101
        .xword 0x0101010155667788

        .xword 0xdeadbeefdeadbeef

/************************************************************************/
