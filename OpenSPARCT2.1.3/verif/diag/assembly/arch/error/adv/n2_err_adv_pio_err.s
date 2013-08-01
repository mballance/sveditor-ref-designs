/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_adv_pio_err.s
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

#define H_HT0_Hw_Corrected_Error_0x63 My_Corrected_ECC_error_trap

#include "err_defines.h"
#include "hboot.s"
#include "peu_defines.h"
#include "err_defines.h"
	
#define MEM64_BASE			mpeval(N2_PCIE_BASE_ADDR + (MEM64_OFFSET_BASE_REG_DATA & 0x7fffffffffffffff))
	
#define MEM64_RD_ADDR0			MEM64_BASE
!!#define MEM64_RD_ADDR0		mpeval(MEM64_BASE + 0x0000000000000000)
!!#define MEM64_RD_ADDR1		mpeval(MEM64_BASE + 0x0000000100000000)
!!#define MEM64_RD_ADDR2		mpeval(MEM64_BASE + 0x0000000200000000)
!!#define MEM64_RD_ADDR4		mpeval(MEM64_BASE + 0x0000000400000000)

!! Keep bit 39 set so that the data section gets read into gMem by vera
	
#define MEM64_OFFSET			0xaabbcc8000000000
!!#define MEM64_OFFSET_PLUS_GARBAGE	mpeval(MEM64_OFFSET + 0x0000000000112233, 16, 16)
#define MEM64_OFFSET_PLUS_GARBAGE	0xaabbcc8000112233
		
!!#define MEM64_RD_ADDR0_PLUS_OFFSET	mpeval(MEM64_OFFSET | MEM64_RD_ADDR0, 16, 16)
#define MEM64_RD_ADDR0_PLUS_OFFSET	0xaabbcc8000000000
		
#ifndef NO_SELF_CHECK
#define BNE_TEST_FAIL  bne	test_failed
#else
#define BNE_TEST_FAIL  nop
#endif
		
/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
.global	 My_Corrected_ECC_error_trap

main:
        ta T_CHANGE_HPRIV
        nop

	! Load the PCIE MEM64 OFFSET Register
	
        setx    FIRE_DLC_IMU_ICS_CSR_A_MEM_64_PCIE_OFFSET_REG_ADDR, %g1, %g2
        setx    MEM64_OFFSET_PLUS_GARBAGE, %g1, %g3
        stx     %g3, [%g2]
        ldx     [%g2], %g4

	! select a MEM address in PCI address range and
	! set up the data area using stores, because Midas does not seem to
	! allow a .data section to be set up with an address > 2**39

	setx	MEM64_RD_ADDR0, %g1, %g2
	setx	0x1011121314151617, %g1, %g3
	stx     %g3,[%g2 + 0]
	setx	0x18191a1b1c1d1e1f, %g1, %g3
	stx     %g3,[%g2 + 8]
	setx	0x2021222324252627, %g1, %g3
	stx     %g3,[%g2 + 16]
	setx	0x28292a2b2c2d2e2f, %g1, %g3
	stx     %g3,[%g2 + 24]
	setx	0x3031323334353637, %g1, %g3
	stx     %g3,[%g2 + 32]
	setx	0x38393a3b3c3d3e3f, %g1, %g3
	stx     %g3,[%g2 + 40]
	setx	0x4041424344454647, %g1, %g3
	stx     %g3,[%g2 + 48]
	setx	0x48494a4b4c4d4e4f, %g1, %g3
	stx     %g3,[%g2 + 56]

	/*******************************************************
		RDD from DMU
	********************************************************/
set_eie_rdd:
	mov	0x1, %g1
	sllx	%g1, ERR_FIELD, %l2
	setx	SOC_EIE_REG, %g7, %g3
	stx	%l2, [%g3]
	membar	0x40


set_ejr_1:
        setx	SOC_EJR_REG, %g7, %g6
	stx	%l2, [%g6]
	membar	0x40


	! 1 byte loads, all 16 offsets
			
byte_os0:	
	nop     ! $EV trig_pc_d(1, @VA(.MAIN.byte_os0)) -> printf("\n byte_os0 \n")
	ldub	[%g2 + 0], %l0
	cmp	%l0, 0x10
	BNE_TEST_FAIL
	nop


        set     0x40, %i2
        set     0x1, %i1
checks_traptaken:
        cmp     %i7, %i1	 
        be     	%xcc, check_tt 
        nop

	dec	%i2
	cmp	%i2, %g0
	be	test_failed
	nop 

check_tt:
	mov	0x63, %l0
	cmp	%o7, %l0
	bne	%xcc, test_failed 
	nop

test_passed:
	EXIT_GOOD

test_failed:	
	EXIT_BAD

My_Corrected_ECC_error_trap:
	! Signal trap taken
	setx  EXECUTED, %l0, %o6
	! save trap type value
	rdpr  %tt, %o7

	inc	%i7

check_desr_tt63:
	ldxa  [%g0]0x4c, %g2
	nop
        setx	0x8b00000000000000, %l0, %g3
	subcc	%g2, %g3, %g4
	brnz	%g4, test_failed
	nop

check_per_tt63:
        mov	0x1, %g1
	sllx	%g1, ERR_FIELD, %g2
	setx	0x8000000000000000, %g7, %g3
	or	%g2, %g3, %g1

	setx	SOC_PER_REG, %g7, %g2
	ldx	[%g2], %g3

	cmp	%g1, %g3
	bne	%xcc, test_failed
	nop

clear_per_tt63:
	setx	SOC_PER_REG, %l7, %i0
	stx	%g0, [%i0]
	nop
	done
	nop


