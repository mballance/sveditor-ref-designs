/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_adv_ncuctague_wrmreset.s
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
#define MAIN_PAGE_HV_ALSO
#define SOC_EST_REG	0x9001041000

#define RESET_STAT_CHECK

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


main:
        ta T_CHANGE_HPRIV
        nop


        /************************************************************
        Check if this is the first time thru here
        ************************************************************/
reset_decide:
        setx    test_entered, %g1, %g2
        ldx     [%g2], %g3
        brnz    %g3, After_Warm_Reset
        nop

        ! First time thru, Store a non-zero value there
        dec     %g3
        stx     %g3, [%g2]


main_t0:
	nop
        setx    MEM_LOC1, %g1, %g3
        st      %g0, [%g3]

clear_esr_first:
        setx    SOC_ESR_REG, %l7, %i0
        stx     %g0, [%i0]


set_ejr_fee:
        set     0x1, %i1
        sllx    %i1, ERR_FIELD, %i2
        setx    SOC_EJR_REG, %l7, %i3
        stx     %i2, [%i3]

        setx    SOC_FEE_REG, %l7, %i3
        stx     %i2, [%i3]

pio_addr:
        ! select an IO address in PCI address range and transmit the command to NCU
        setx IO_RD_ADDR, %g1, %g2

st_mem1:
        set     0x1, %g4
        st      %g4, [%g3]

pio:
        ! load byte - all byte offsets within an octlet
        ldub [%g2 + 1*8 + 0], %l0
	nop 				! ld hangs and not completes

	ba 	test_failed
	nop


After_Warm_Reset:
	nop
	nop

read_esr:
        setx    SOC_ESR_REG, %g7, %g3
        ldx     [%g3], %g6

        setx    0x8000000000000000, %g7, %g3    !valid bit
        set     0x1, %g2
        sllx    %g2, ERR_FIELD, %g4
        or      %g3, %g4, %g5

        cmp     %g6, %g5
        bne      %xcc, test_failed 
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

	ba 	test_failed
	nop


        .align 64
test_entered:
        .xword 0

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
