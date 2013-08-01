/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_tx_gen_boot.s
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

#include "boot.s"
#include "niu_defines.h"

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:

#include "niu_init.h"
!
! Thread 0 Start
!
!
thread_0:

Init_flow: 
	nop			! $EV trig_pc_d(1, @VA(.MAIN.Init_flow)) -> pktGenConfig()
	nop

Gen_Packet:
	nop			! $EV trig_pc_d(1, @VA(.MAIN.Gen_Packet)) -> pktgen(0,8)


tx_begin:
setTxRingConfig:
	setx	TX_RNG_CFIG, %g1, %g2		! $EV trig_pc_d(1, @VA(.MAIN.setTxRingConfig)) -> printf("Triggering setTxRingConfig",*,1)
	setx	TxRingConfig_data, %g1, %g3
	stx	%g3, [%g2]
	nop
setTxRingKick:
	setx	TX_RING_KICK, %g1, %g2
	setx	Tx_Ring_Kick_data, %g1, %g3
	stx	%g3, [%g2]
	nop
setTxCs:
	setx	TX_CS, %g1, %g2
	setx	SetTxCs_data, %g1, %g3
	stx	%g3, [%g2]
	nop

	nop
	nop
	stx	%g0, [%g2]		! Unstall the dma Engine
	nop

	setx	loop_count, %g1, %g4
delay_loop:
	ldx	[%g2], %g5
	nop
	nop
	nop
	nop
	dec	%g4
	brnz	%g4, delay_loop
	nop

	
test_passed:
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
	.xword 0x0064452301000484
        .xword 0x0068452301000484
        .xword 0x006c452301000484
        .xword 0x0070452301000484
        .xword 0x0074452301000484
        .xword 0x0078452301000484
        .xword 0x007c452301000484

/************************************************************************/
SECTION       pkt0_data data_va=0x123456000
attr_data {
        Name = pkt0_data,
        hypervisor,
        compressimage,
	notsb
        }
.data
pkt0_data:

/************************************************************************/
SECTION       pkt1_data data_va=0x123456100
attr_data {
        Name = pkt1_data,
        hypervisor,
        compressimage,
        notsb
        }
.data
pkt1_data:

/************************************************************************/
SECTION       pkt2_data data_va=0x123456200
attr_data {
        Name = pkt2_data,
        hypervisor,
        compressimage,
        notsb
        }
.data
pkt2_data:

/************************************************************************/
SECTION       pkt3_data data_va=0x123456300
attr_data {
        Name = pkt3_data,
        hypervisor,
        compressimage,
        notsb
        }
.data
pkt3_data:

/************************************************************************/
SECTION       pkt4_data data_va=0x123456400
attr_data {
        Name = pkt4_data,
        hypervisor,
        compressimage,
        notsb
        }
.data
pkt4_data:

/************************************************************************/
SECTION       pkt5_data data_va=0x123456500
attr_data {
        Name = pkt5_data,
        hypervisor,
        compressimage,
        notsb
        }
.data
pkt5_data:

/************************************************************************/
SECTION       pkt6_data data_va=0x123456600
attr_data {
        Name = pkt6_data,
        hypervisor,
        compressimage,
        notsb
        }
.data
pkt6_data:

/************************************************************************/
SECTION       pkt7_data data_va=0x123456700
attr_data {
        Name = pkt7_data,
        hypervisor,
        compressimage,
        notsb
        }
.data
pkt7_data:
