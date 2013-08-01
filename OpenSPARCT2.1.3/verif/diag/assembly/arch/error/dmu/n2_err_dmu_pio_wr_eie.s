/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_dmu_pio_wr_eie.s
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
#define H_HT0_Sw_Recoverable_Error_0x40	 My_Recoverable_Sw_error_trap

#define ENABLE_PCIE_LINK_TRAINING
/* #define MAIN_PAGE_NUCLEUS_ALSO */ /* Access main in priviledge mode */
#define MAIN_PAGE_HV_ALSO

#include "err_defines.h"
#include "hboot.s"
#include "peu_defines.h"

!#define IO_WR_ADDR mpeval(N2_PCIE_BASE_ADDR + IOCFG_OFFSET_BASE_REG_DATA)
#define IO_WR_ADDR mpeval((N2_PCIE_BASE_ADDR + IOCFG_OFFSET_BASE_REG_DATA) | IO_ACCESS_PA)

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
.global	 My_Recoverable_Sw_error_trap

main:
        ta T_CHANGE_HPRIV
        nop

clear_esr_first:
        setx    SOC_ESR_REG, %l7, %i0
        stx     %g0, [%i0]

set_ejr:
        set     0x1, %i1
        sllx    %i1, ERR_FIELD, %i2
        setx    SOC_EJR_REG, %l7, %i3
        stx     %i2, [%i3]
        membar  0x40

        ! select a CFG address in PCI address range and transmit the command to NCU
        setx    IO_WR_ADDR, %g1, %g2
        setx    0x7f7e7d7c, %g1, %l0
        stw     %l0, [%g2]

	setx	0x40, %l1, %g4
delay_loop:
	nop
	nop
	nop
	nop
	dec	%g4
	brnz	%g4, delay_loop
	nop
	nop

check_esr:
        setx    SOC_ESR_REG, %l7, %i0
        ldx     [%i0], %i1
        nop

        setx    0x8000000000000000, %l7, %o3    !valid bit
        set     0x1, %i2
        sllx    %i2, ERR_FIELD, %i3
        or      %i3, %o3, %i4
        sub     %i1, %i4, %i5
        brnz    %i5, test_failed
        nop

eie_reg_ones:
	setx	SOC_EIE_REG, %g3, %g2

        set	0x1, %i1
	sllx	%i1, ERR_FIELD, %g1

	stx	%g1, [%g2]
	membar	0x40

	setx	0x40, %g7, %g6
	set	0x1, %g1			! 1 Trap
err_trap_loop:
	cmp	%g6, %g0
	be	%xcc, test_failed
	nop

	cmp	%g1, %i7
	be	%xcc, check_tt
	nop

	ba	err_trap_loop
	nop

check_tt:
	mov	0x40, %l0
	cmp	%o7,  %l0
	bne	%xcc, test_failed
	nop

test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD

/************************************************************************
	RAS
	Trap Handlers
 ************************************************************************/
My_Recoverable_Sw_error_trap:
	! Signal trap taken
	setx  	EXECUTED, %l0, %o6
	! save trap type value
	rdpr  	%tt, %o7

	inc	%i7

check_desr_NcuTrap_tt40:
	ldxa  [%g0]0x4c, %g2
	nop

	setx	0xb300000000000000, %l0, %g3
	subcc	%g2, %g3, %g4
	brnz	%g4, test_failed 
	nop


check_per_tt40:
        setx	SOC_PER_REG, %l7, %g1
	ldx	[%g1], %g2
	setx	0x8000000000000000, %g7, %g1
	set	0x1, %g3
	sllx	%g3, ERR_FIELD, %g4
	or	%g1, %g4, %g3
	sub	%g2, %g3, %g5
	brnz	%g5, test_failed
	nop

clear_per_tt40:
	setx	SOC_PER_REG, %l7, %g1
	stx	%g0, [%g1]
	nop

clear_ejr_tt40:
	setx	SOC_EJR_REG, %l7, %g1
	stx	%g0, [%g1]
	nop

clear_eie_tt40:
	setx	SOC_EIE_REG, %l7, %g1
	stx	%g0, [%g1]
	nop

trap_done_tt40:
	done
	nop

/************************************************************************
   Test case data start
************************************************************************/

SECTION       .DATA DATA_VA=IO_WR_ADDR
attr_data {
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
.global PCIAddr9

data0:  .word 0xccccdddd
data1:  .word 0xeeeeffff
/************************************************************************/
