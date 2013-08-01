/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_ncu_peu_piord_eie.s
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
#define MAIN_PAGE_HV_ALSO

#include "err_defines.h"
#include "hboot.s"
#include "peu_defines.h"


#define IO_RD_ADDR mpeval((N2_PCIE_BASE_ADDR + (IOCFG_OFFSET_BASE_REG_DATA & 0x7fffffffffffffff)) | IO_ACCESS_PA)

#define H_HT0_Data_access_Error_0x32  My_Data_access_error_trap

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
.global  My_Data_access_error_trap

main:
        ta T_CHANGE_HPRIV
        nop


clear_esr_first:
        setx    SOC_ESR_REG, %l7, %i0
        stx     %g0, [%i0]


set_err_field:
        set     0x1, %i1
        sllx    %i1, ERR_FIELD, %i2
        setx    SOC_EIE_REG, %l7, %i3

set_eie:
        stx     %i2, [%i3]
        membar  0x40

set_ejr:
        setx    SOC_EJR_REG, %l7, %i3
        stx     %i2, [%i3]
        membar  0x40

pio:
        ! select an IO address in PCI address range and transmit the command to NCU
        setx IO_RD_ADDR, %g1, %g2

        ! load byte - all byte offsets within an octlet
        ldub [%g2 + 1*8 + 0], %l0

	setx	0x40, %l1, %g4
delay_loop:
	nop
	nop
	nop
	dec	%g4
	brnz	%g4, delay_loop
	nop



        /******************************
                Error Check
        ******************************/
err_check:
	nop

check_esr:
        setx    SOC_PER_REG, %l7, %i0
        ldx     [%i0], %i1
        nop

        setx    0x8000000000000000, %l7, %o3    !valid bit
        set     0x1, %i2
        sllx    %i2, ERR_FIELD, %i3
        or      %i3, %o3, %i4

	/* It will take trap whether EIE enabled or not as ld return data has the error bit set
           But if EIE is not set ESR data will not be copied to PER
           If EIE is set ESR data will be copied to ESR 

	   But for EIE set, ESR data might not be zero if followed by transaction
           again causes the error to be set; though in this case ESR should be zero
	  as we dont have any following DMU PIO transaction, so no more error and esr is zero 
	*/

#ifdef EIE
        sub     %i1, %g0, %i5
        brnz    %i5, test_failed
	nop
#else
        sub     %i1, %i4, %i5
        brnz    %i5, test_failed
        nop
#endif


check_per:
        setx    SOC_PER_REG, %l7, %i0
        ldx     [%i0], %i1
        nop

#ifdef EIE
        sub     %i1, %i4, %i5
        brnz    %i5, test_failed
        nop
#else
        sub     %i1, %g0, %i5
        brnz    %i5, test_failed
        nop
#endif


  ! Check if a Corrected ECC Trap happened
check_error_trap:
        setx  EXECUTED, %l1, %l0
        cmp   %o0, %l0
        bne   test_fail
        nop
        mov   TT, %l0
        cmp   %o1, %l0
        bne   test_fail
        nop
       /*************************************/

        /********************************/
	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


My_Data_access_error_trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o0
  ! save trap type value
  rdpr  %tt, %o1
  ba  err_check 
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