/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_tx_gen_hboot.s
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
#define MAIN_PAGE_HV_ALSO

#include "hboot.s"
#include "niu_defines.h"

#define	TX_LOG_PAGE_VLD_ADDR	mpeval(FZC_DMC_ADDRESS_RANGE+0x40000)
#define TX_LOG_PAGE_VLD_DATA	0x1

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

#include "niu_init.h"
!
! Thread 0 Start
!
!
thread_0:

Init_flow: 
	nop			! $EV trig_pc_d(1, @VA(.MAIN.Init_flow)) -> pktGenConfig()
	nop

	setx	TXC_PORT0_DMA_ENABLE_ADDR, %g1, %g2
	setx	TXC_PORT0_DMA_ENABLE_DATA, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
SetActive:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.SetActive)) -> DMAActivate(3)

Gen_Packet:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet)) -> pktgen(0,8)


tx_begin:
SetTxLPValid:
	setx	TX_LOG_PAGE_VLD_ADDR, %g1, %g2
	setx	TX_LOG_PAGE_VLD_DATA, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

setTxRingConfig:
	setx	0x100000000, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g3 	! $EV trig_pc_d(1, @VA(.MAIN.setTxRingConfig)) -> printf("Triggering setTxRingConfig",*,1)
	nop				        
	setx	TX_RNG_CFIG, %g1, %g2		
						! setx	TxRingConfig_data, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop
setTxRingKick:
	setx	0x100000100, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g3	! $EV trig_pc_d(1, @VA(.MAIN.setTxRingKick)) -> printf("Triggering setTxRingKick",*,1)
	nop
	setx    TX_RING_KICK, %g1, %g2
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop
setTxCs:
	setx	TX_CS, %g1, %g2
	setx	SetTxCs_data, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	nop
	nop
	stxa	%g0, [%g2]ASI_PRIMARY_LITTLE		! Unstall the dma Engine
	nop

	setx	loop_count, %g1, %g4
delay_loop:
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g5
	nop
	nop
	nop
	nop
	dec	%g4
	brnz	%g4, delay_loop
	nop

	
test_passed:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.test_passed)) -> NIU_EXIT_chk()
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/
SECTION       descriptor data_va=0x100000000

attr_data {
	Name = descriptor,
	hypervisor,
	compressimage
	}
.data
	.align 0x10000
descriptor:
        .xword 0x0060452301000484
        .xword 0x0068452301000484
        .xword 0x0070452301000484
        .xword 0x0078452301000484
        .xword 0x0080452301000484
        .xword 0x0088452301000484
        .xword 0x0090452301000484
        .xword 0x0098452301000484

        .xword 0x0060452301000484
        .xword 0x0068452301000484
        .xword 0x0070452301000484
        .xword 0x0078452301000484
        .xword 0x0080452301000484
        .xword 0x0088452301000484
        .xword 0x0090452301000484
        .xword 0x0098452301000484
        .xword 0x0060452301000484
        .xword 0x0068452301000484
        .xword 0x0070452301000484
        .xword 0x0078452301000484
        .xword 0x0080452301000484
        .xword 0x0088452301000484
        .xword 0x0090452301000484
        .xword 0x0098452301000484

        .xword 0x0060452301000484
        .xword 0x0064452301000484
        .xword 0x0068452301000484
        .xword 0x006c452301000484
        .xword 0x0070452301000484
        .xword 0x0074452301000484
        .xword 0x0078452301000484
        .xword 0x007c452301000484
	.xword 0x8404000123456400
	.xword 0x8404000123456000
	.xword 0x8404000123456c00
	.xword 0x8404000123456800
	.xword 0x8404000123457400
	.xword 0x8404000123457000
	.xword 0x8404000123457c00
	.xword 0x8404000123457800

/************************************************************************/
