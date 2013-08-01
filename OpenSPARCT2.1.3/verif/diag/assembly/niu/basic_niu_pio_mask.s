/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: basic_niu_pio_mask.s
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

//#include "defines.h"
//#include "nmacros.h"
#include "hboot.s"
#include "asi_s.h"

/************************************************************************
   Test case code start
 ************************************************************************/
#define XPCS_CONTROL1                   mpeval( 0x000 <<1)
#define XPCS_STATUS1                    mpeval( 0x004 <<1)
#define XPCS_DEVICE_ID                  mpeval( 0x008 <<1)
#define XPCS_SPEED_ABILITY              mpeval( 0x00C <<1)
#define XPCS_DEVICE_IN_PKG              mpeval( 0x010 <<1)
#define XPCS_CONTROL2                   mpeval( 0x014 <<1)
#define XPCS_STATUS2                    mpeval( 0x018 <<1)
#define XPCS_PKG_ID                     mpeval( 0x01C <<1)
#define XPCS_STATUS                     mpeval( 0x020 <<1)
#define XPCS_TEST_CONTROL               mpeval( 0x024 <<1)
#define XPCS_CONFIG_VENDOR1             mpeval( 0x028 <<1)
#define XPCS_DIAG_VENDOR2               mpeval( 0x02C <<1)
#define XPCS_MASK1                      mpeval( 0x030 <<1)
#define XPCS_PACKET_COUNTER             mpeval( 0x034 <<1)
#define XPCS_TX_STATEMACHINE            mpeval( 0x038 <<1)
#define XPCS_TX_DESKWERR_COUNTER        mpeval( 0x03C <<1)

#define NIU_BASE_ADDRESS 	0x8100000000
#define FZC_MAC_BASE_ADDRESS    0x180000
#define TXC_BASE_ADDRESS        0x700000
#define FZC_TXC_BASE_ADDRESS    0x780000

#define TXC_DMA_MAXBURST        0x000
#define TXC_DMA_MAXBURST_MASK   0x000000000000ffff
#define TXC_PORT_CONTROL_MASK   0x000000000000ffff
#define TXC_PORT0_DMA_ENBALE    0x028
#define TXC_PORT0_CONTROL       0x010
#define TXC_PORT1_CONTROL       0x018
#define TXC_CONTROL             0x000
#define TXC_CONTROL_MASK        0x000000000000001f
#define XPCS_0_RANGE      	mpeval(0x00001000 << 1)
#define XPCS_1_RANGE      	mpeval(0x00004000 << 1)

#define NEPTUNE_BASE_ADDRESS    NIU_BASE_ADDRESS
#define MAC_ADDRESS_RANGE      	mpeval(NEPTUNE_BASE_ADDRESS + FZC_MAC_BASE_ADDRESS)
#define XPCS0_BASE       	mpeval(MAC_ADDRESS_RANGE + XPCS_0_RANGE)
#define XPCS1_BASE       	mpeval(MAC_ADDRESS_RANGE + XPCS_1_RANGE)
#define TXC_ADDRESS_RANGE      	mpeval(NEPTUNE_BASE_ADDRESS + TXC_BASE_ADDRESS)
#define FZC_TXC_ADDRESS_RANGE   mpeval(NEPTUNE_BASE_ADDRESS + FZC_TXC_BASE_ADDRESS)

#define TXC_DMA0_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x00 << 12))
#define TXC_FZC_BASE  		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x20 << 12))
#define TXC_PIO_BASE  		mpeval(TXC_ADDRESS_RANGE +  (0x20 << 12))

#define xpcs_reg0_addr 		mpeval(XPCS0_BASE + XPCS_CONTROL1)
#define xpcs_reg1_addr		mpeval(XPCS0_BASE + XPCS_TEST_CONTROL)
#define xpcs_reg2_addr		mpeval(XPCS0_BASE + XPCS_CONFIG_VENDOR1)
#define xpcs_reg3_addr		mpeval(XPCS0_BASE + XPCS_DIAG_VENDOR2)
#define xpcs_reg4_addr		mpeval(XPCS0_BASE + XPCS_MASK1)
#define xpcs_reg5_addr		mpeval(XPCS0_BASE + XPCS_PACKET_COUNTER)
#define xpcs_reg6_addr		mpeval(XPCS0_BASE + XPCS_TX_DESKWERR_COUNTER)
#define xpcs_reg7_addr		mpeval(XPCS0_BASE + XPCS_STATUS1)
#define xpcs_reg8_addr		mpeval(XPCS0_BASE + XPCS_DEVICE_ID)
#define xpcs_reg9_addr		mpeval(XPCS0_BASE + XPCS_SPEED_ABILITY)
#define xpcs_reg10_addr		mpeval(XPCS0_BASE + XPCS_DEVICE_IN_PKG)
#define xpcs_reg11_addr		mpeval(XPCS0_BASE + XPCS_CONTROL2)
#define xpcs_reg12_addr		mpeval(XPCS0_BASE + XPCS_STATUS2)
#define xpcs_reg13_addr		mpeval(XPCS0_BASE + XPCS_PKG_ID)
#define xpcs_reg14_addr		mpeval(XPCS0_BASE + XPCS_STATUS)
#define xpcs_reg15_addr		mpeval(XPCS0_BASE + XPCS_TX_STATEMACHINE)

#define xpcs_reg0_data		0x00002040
#define xpcs_reg1_data		0x00000000
#define xpcs_reg2_data		0x00000003
#define xpcs_reg3_data		0x00000000
#define xpcs_reg4_data		0x00000084
#define xpcs_reg5_data		0x00000000
#define xpcs_reg6_data		0x00000000
#define xpcs_reg7_data		0x00000080
#define xpcs_reg8_data		0x00000000
#define xpcs_reg9_data		0x00000001
#define xpcs_reg10_data		0xC0000008
#define xpcs_reg11_data		0x00000001
#define xpcs_reg12_data		0x00000802
#define xpcs_reg13_data		0x00000000
#define xpcs_reg14_data		0x00000800
#define xpcs_reg15_data		0x0000000C

#define	txc_dma0_addr		mpeval(TXC_DMA0_BASE + TXC_DMA_MAXBURST)
#define fzc_txc_addr		mpeval(TXC_FZC_BASE + TXC_PORT0_CONTROL)
#define txc_pio_addr		mpeval(TXC_PIO_BASE + TXC_CONTROL)
#define txc_port0_dma_enbale    mpeval(TXC_FZC_BASE + TXC_PORT0_DMA_ENBALE)

#define	txc_dma0_data		0xa5a5a5a5a5a5a5a5
#define fzc_txc_data		0xffffffffffffffff
#define	txc_pio_data		0x1f

#define DMC_BASE_ADDRESS        0x600000
#define FZC_DMC_BASE_ADDRESS    0x680000
#define DMC_ADDRESS_RANGE       mpeval(NEPTUNE_BASE_ADDRESS + DMC_BASE_ADDRESS)
#define FZC_DMC_ADDRESS_RANGE   mpeval(NEPTUNE_BASE_ADDRESS + FZC_DMC_BASE_ADDRESS)
#define  RX_ADDR_MD             mpeval(FZC_DMC_ADDRESS_RANGE+0x00070)
#define  RDC_TABLE_BASE         mpeval(FZC_DMC_ADDRESS_RANGE+0x10000)
#define  RX_LOG_PAGE_VLD        mpeval(FZC_DMC_ADDRESS_RANGE+0x20000)
#define  RX_LOG_PAGE1           mpeval(FZC_DMC_ADDRESS_RANGE+0x20008)
#define  RX_LOG_PAGE2           mpeval(FZC_DMC_ADDRESS_RANGE+0x20010)
#define  RX_LOG_PAGE_RELO1      mpeval(FZC_DMC_ADDRESS_RANGE+0x20018)
#define  RX_LOG_PAGE_RELO2      mpeval(FZC_DMC_ADDRESS_RANGE+0x20020)
#define  Rx_LOG_PAGE_HDL        mpeval(FZC_DMC_ADDRESS_RANGE+0x20028)
#define  RDC_RED_PARA           mpeval(FZC_DMC_ADDRESS_RANGE+0x30000)
#define  RXDMA_CFIG_BASE        mpeval(DMC_ADDRESS_RANGE+0x00000)
#define  RBR_CFIG_A             mpeval(DMC_ADDRESS_RANGE+0x00010)
#define  RCRCFIG_A              mpeval(DMC_ADDRESS_RANGE+0x00040)
#define  TBR_CFIG_A             mpeval(DMC_ADDRESS_RANGE+0x10000)
#define  RBR_KICK               mpeval(DMC_ADDRESS_RANGE+0x00020)
#define  RBR_HD                 mpeval(DMC_ADDRESS_RANGE+0x00030)
#define  RBR_TL                 mpeval(DMC_ADDRESS_RANGE+0x00038)
#define FZC_FFLP_BASE_ADDRESS   0x380000
#define FZC_FFLP_BASE_OFFSET    0x020000
#define FFLP_CONFIG             0x00100
#define FFLP_ADDRESS_RANGE      mpeval(NEPTUNE_BASE_ADDRESS + FZC_FFLP_BASE_ADDRESS + FZC_FFLP_BASE_OFFSET)

#define xpcs0_config_vendor1 	mpeval(XPCS0_BASE + XPCS_CONFIG_VENDOR1)
#define xpcs1_config_vendor1 	mpeval(XPCS1_BASE + XPCS_CONFIG_VENDOR1)
#define fflp_reg0		mpeval(FFLP_ADDRESS_RANGE +FFLP_CONFIG)
#define txc_reg0		mpeval(TXC_DMA0_BASE + TXC_DMA_MAXBURST)
#define	txc_reg1		mpeval(TXC_FZC_BASE+ TXC_PORT0_CONTROL)
#define txc_reg2		mpeval(TXC_FZC_BASE+ TXC_PORT1_CONTROL)
#define txc_reg3		mpeval(TXC_PIO_BASE + TXC_CONTROL)

.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

!
! Thread 0 Start
!
thread_0:

	setx	xpcs0_config_vendor1, %g1, %g2
	stxa	%g0, [%g2]ASI_PRIMARY_LITTLE
	nop 

	setx	xpcs1_config_vendor1, %g1, %g2
	stxa	%g0, [%g2]ASI_PRIMARY_LITTLE
	nop

txc_sanity_tx:
	set	0x2, %g4
	setx	txc_dma0_addr, %g1, %g2
	setx	TXC_DMA_MAXBURST_MASK, %g1, %g6
	setx	txc_dma0_data, %g1, %g3

pattern_loop1:
	and	%g3, %g6, %g1
	stxa	%g1, [%g2]ASI_PRIMARY_LITTLE
	nop

	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g5
	nop
	cmp	%g5, %g1
	bne	test_failed
	nop

	inc	%g3
	dec	%g4
	brnz	%g4, pattern_loop1
	nop

	setx	txc_port0_dma_enbale, %g1, %g2
        setx    TXC_PORT_CONTROL_MASK, %g1, %g6
	setx	fzc_txc_data, %g1, %g3
        and     %g3, %g6, %g1
	stxa	%g1, [%g2]ASI_PRIMARY_LITTLE
	nop

        ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
        cmp     %g5, %g1
        bne     test_failed
        nop


//  This code is to access an invalid address.
//  Nack is detected by a checker.  Disabling in this
//  basic diag.  Need to add to another diag

	setx	txc_pio_addr, %g1, %g2
        setx    TXC_CONTROL_MASK, %g1, %g6
	setx	txc_pio_data, %g1, %g3
        and     %g3, %g6, %g1
//	stxa	%g1, [%g2]ASI_PRIMARY_LITTLE
	nop

//       ldxa     [%g2]ASI_PRIMARY_LITTLE, %g5
        nop
//        cmp     %g5, %g1
//        bne     test_failed
        nop

test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
	.xword 0x0000000000000000
	.xword 0xffffffffffffffff
	.xword 0xa55a5aa5a55a5aa5
	.xword 0x5aa5a55a5aa5a55a
.end



