/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIePIOUc.s
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
	
#define H_HT0_Data_access_error_0x32
#define SUN_H_HT0_Data_access_error_0x32 \
	inc     %l4; \
	done;

#include "hboot.s"
	
#define CFG0_RD_ADDR  N2_PCIE_BASE_ADDR
#define CFG1_RD_ADDR  mpeval(CFG0_RD_ADDR + CFG1_ACCESS_PA)

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
main:
        ta T_CHANGE_HPRIV
        nop

	mov	0, %l4		! zero the interrupt count
		
/******************************************************************************
 Set the Completion Timeout Select (CTO_SEL) to its minimum (2^10 symbol times)
 ******************************************************************************/
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_ADDR, %g2, %g3
	set	0x00070000, %g4 ! set bits[18:	16] to 3'b111
	ldx	[%g3], %g5
	or	%g5, %g4, %g5
	stx	%g5, [%g3]


	! select a CFG1 address in PCI address range
	setx CFG1_RD_ADDR, %g1, %g2

	! Load a couple of words to show that PIOs are working
	lduw [%g2 + 0*4], %o4
	lduw [%g2 + 1*4], %o5

	setx FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1C_ALIAS_ADDR, %g1, %g3
	ldx  [%g3], %g4		! status
	stx  %g4, [%g3]		! clear it
	setx FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_ERR_RW1C_ALIAS_ADDR, %g1, %g5
	ldx  [%g5], %g4		! status
	stx  %g4, [%g5]		! clear it
	
/******************************************************************************
 On the next PIO, get an "unsupported request" completion
 ******************************************************************************/
! $EV trig_pc_d(1, @VA(.MAIN.PIO_Uc)) -> EnablePCIeIgCmd ("PIO_UC",0,0,0,1)
PIO_Uc:	nop; nop; nop; nop; nop; nop; nop; nop;
	lduw [%g2 + 2*8], %o4	! this one should get Ur status
	
	lduw [%g2 + 3*8], %o5	! this one should be good
	lduw [%g2 + 4*8], %o6	! this one should be good
	
	ldx  [%g3], %g4		! status => should get the RUC Primary Event bit set
	setx 0x0000000000010000, %g1, %l1
	xor  %l1, %g4, %l1
	brnz %l1, test_failed
	stx  %g4, [%g3]		! clear the OE status reg
	
	ldx  [%g3 + 0x10], %l0	! OE Receive  Hdr1
	ldx  [%g3 + 0x18], %l1	! OE Receive  Hdr2
	
	ldx  [%g5], %g6		! UE status => should be zero
	brnz %g6, test_failed
	stx  %g6, [%g5]		! clear the UE status reg
	ldx  [%g5 + 0x10], %l0	! UE Receive  Hdr1
	ldx  [%g5 + 0x18], %l1	! UE Receive  Hdr2

	! test whether enough exceptions were taken
	sub	%l4, 1, %l4
	brnz	%l4, test_failed
	nop


test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


SECTION       .DATA2 DATA_VA=CFG1_RD_ADDR
attr_data {     
      Name = .DATA2,
      hypervisor,
      compressimage
}

.data
	.word 0x11121314
	.word 0x21222324
	.word 0x31323334
	.word 0x41424344
	.word 0xdeadbeef
	.word 0x61626364
	.word 0x71727374
	.word 0x81828384
	

/************************************************************************/
