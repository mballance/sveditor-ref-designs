/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_siu_rx_trap.s
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

#define MAIN_PAGE_HV_ALSO

#include "err_defines.h"
#include "hboot.s"
#include "niu_defines.h"

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

#include "niu_init_rx.h"	! Temporary added this initialization.  Need to merg with niu_init.h
!#include "niu_init.h"
!
! Thread 0 Start
!
!
thread_0:

Init_flow: 
	nop			! $EV trig_pc_d(1, @VA(.MAIN.Init_flow)) -> RxGenConfig()
	nop

rx_begin:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.rx_begin)) -> printf("Configuration for Rx port",*,1)

clear_esr_first:
        setx    SOC_ESR_REG, %l7, %i0
        stx     %g0, [%i0]

set_ejr:
        set     0x1, %i1
        sllx    %i1, ERR_FIELD, %i2
        setx    SOC_EJR_REG, %l7, %i3
        stx     %i2, [%i3]
        membar  0x40

eie_reg_ones:
        setx    SOC_EIE_REG, %l7, %g5
        stx     %i2, [%g5]
        membar  0x40
	
Gen_Packet:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet)) -> Rxpktgen(0,10)

	setx    TX_CS, %g1, %g2
        nop     
        setx    Rx_loop_count, %g1, %g4
delay_loop:
	ldx	[%g2], %g5
	nop
	nop
	nop
	nop
	dec	%g4
	brnz	%g4, delay_loop
	nop


        ! ESR is cleared in INT
check_esr:
        setx    SOC_ESR_REG, %l7, %i0
        ldx     [%i0], %i1
        sub     %i1, %g0, %i5
!        brnz    %i5, test_failed
        nop

check_per:
        setx    SOC_PER_REG, %l7, %i0
        ldx     [%i0], %i1
        nop

        setx    0x8000000000000000, %l7, %o3    !valid bit
        set     0x1, %i2
        sllx    %i2, ERR_FIELD, %i3
        or      %i3, %o3, %i4
        sub     %i1, %i4, %i5
        brnz    %i5, test_failed
        nop


  ! Check if a Corrected ECC Trap happened
check_error_trap:
        setx  EXECUTED, %l1, %l0
        cmp   %o6, %l0
        bne   test_failed
        nop
        mov   TT, %l0
        cmp   %o7, %l0
        bne   test_failed
        nop

test_passed:
        EXIT_GOOD
	nop

test_failed:
        EXIT_BAD
        nop


/************************************************************************
   Trap Handlers
 ************************************************************************/
My_Recoverable_Sw_error_trap:
        ! Signal trap taken
        setx  EXECUTED, %l0, %o6
        ! save trap type value
        rdpr  %tt, %o7
        retry
        nop

My_Corrected_ECC_error_trap:
        ! Signal trap taken
        setx  EXECUTED, %l0, %o6
        ! save trap type value
        rdpr  %tt, %o7
        retry
        nop


/************************************************************************
   Test case data start
 ************************************************************************/
SECTION       descriptor data_va=0x100000200
attr_data {
	Name = descriptor,
	hypervisor,
	compressimage
	}
.data
descriptor:
        .xword 0x00008967452301
        .xword 0x08008967452301
        .xword 0x10008967452301
        .xword 0x18008967452301
        .xword 0x20008967452301
        .xword 0x28008967452301
        .xword 0x30008967452301
        .xword 0x38008967452301
        .xword 0x40008967452301
        .xword 0x48008967452301
        .xword 0x50008967452301
        .xword 0x58008967452301
        .xword 0x60008967452301
        .xword 0x68008967452301
        .xword 0x70008967452301
        .xword 0x78008967452301
        .xword 0x80008967452301
        .xword 0x88008967452301
        .xword 0x90008967452301
        .xword 0x98008967452301

/************************************************************************/
