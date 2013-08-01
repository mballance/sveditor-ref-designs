/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_niu_regs_rw.s
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

#include "hboot.s"
#include "asi_s.h"
#include "niu_defines.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:

	! Switch to hypervisor mode.

	ta	T_CHANGE_HPRIV
	nop
	ta	T_CHANGE_PRIV
	nop
pstate:	
	rdpr	%pstate, %l0
	and	%l0, 0x2, %l1
	wrpr	%l0, %l1, %pstate	! Disable interrupts

	wr	%g0, ASI_PRIMARY_LITTLE, %asi	! The NCU is little endian

	! Test the Recieve DMA Control and Status register.

rx_dma_ctl_stat_write1:
	setx	RX_DMA_CTL_STAT, %l0, %l1
	setx	RX_DMA_CTL_STAT_COUNT, %l0, %l2
	setx	RX_DMA_CTL_STAT_STEP, %l0, %l3
	sub	%g0, 1, %l4		! data of all 1's

rx_dma_ctl_stat_write1_loop_top:
	stxa	%l4, [%l1]%asi
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	rx_dma_ctl_stat_write1_loop_top
	dec	%l2

rx_dma_ctl_stat_read1:
	setx	RX_DMA_CTL_STAT, %l0, %l1
	setx	RX_DMA_CTL_STAT_COUNT, %l0, %l2
	setx	0x8000ffffffff, %l0, %l6		! mask for RW fields

rx_dma_ctl_stat_read1_loop_top:
	ldxa	[%l1]%asi, %l7
	and	%l7, %l6, %l7
	cmp	%l7, %l6
	bne	test_failed
	nop
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	rx_dma_ctl_stat_read1_loop_top
	dec	%l2

rx_dma_ctl_stat_write0:
	setx	RX_DMA_CTL_STAT, %l0, %l1
	setx	RX_DMA_CTL_STAT_COUNT, %l0, %l2
	setx	RX_DMA_CTL_STAT_STEP, %l0, %l3

rx_dma_ctl_stat_write0_loop_top:
	stxa	%g0, [%l1]%asi
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	rx_dma_ctl_stat_write0_loop_top
	dec	%l2

rx_dma_ctl_stat_read0:
	setx	RX_DMA_CTL_STAT, %l0, %l1
	setx	RX_DMA_CTL_STAT_COUNT, %l0, %l2
	setx	0x8000ffffffff, %l0, %l6		! mask for RW fields

rx_dma_ctl_stat_read0_loop_top:
	ldxa	[%l1]%asi, %l7
	and	%l7, %l6, %l7
	cmp	%l7, 0
	bne	test_failed
	nop
	add     %l1, %l3, %l1
	cmp	%l2, 1
	bne	rx_dma_ctl_stat_read0_loop_top
	dec	%l2

	! Test the Logical Device Group Number registers.

ldg_num1:
	setx	LDG_NUM, %l1, %l2
	set	LDG_NUM_COUNT, %l3
	set	LDG_NUM_STEP, %l4

ldg_num_write0_loop_top:
	stxa	%g0, [%l2]%asi		! Write 0's to LDG_NUM register
	add	%l2, %l4, %l2
	cmp	%l3, 1
	bne	ldg_num_write0_loop_top
	dec	%l3

ldg_num2:
	setx	LDG_NUM, %l1, %l2
	set	LDG_NUM_COUNT, %l3

ldg_num_read0_loop_top:
	ldxa	[%l2]%asi, %l7
	cmp	%l7, 0			! Expect all 0's read back
	bne	test_failed
	nop
	add	%l2, %l4, %l2
	cmp	%l3, 1
	bne	ldg_num_read0_loop_top
	dec	%l3

ldg_num3:
	setx	LDG_NUM, %l1, %l2
	set	LDG_NUM_COUNT, %l3
	sub	%g0, 1, %l5

ldg_num_write1_loop_top:
	stxa	%l5, [%l2]%asi		! Write 1's to LDG_NUM register
	add	%l2, %l4, %l2
	cmp	%l3, 1
	bne	ldg_num_write1_loop_top
	dec	%l3

ldg_num4:
	setx	LDG_NUM, %l1, %l2
	set	LDG_NUM_COUNT, %l3

ldg_num_read1_loop_top:
	ldxa	[%l2]%asi, %l7
	cmp	%l7, 0x3f			! Expect 0x3f read back
	bne	test_failed
	nop
	add	%l2, %l4, %l2
	cmp	%l3, 1
	bne	ldg_num_read1_loop_top
	dec	%l3

	! Test the Logical Device State Vector 0 registers
	! These are read only registers

ldsv0:
	setx	LDSV0, %l0, %l1
	set	LDSV0_COUNT, %l2
	setx	LDSV0_STEP, %l0, %l3

ldsv0_loop_top:
	ldxa	[%l1]%asi, %l7
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	ldsv0_loop_top
	dec	%l2

	! Test the Logical Device State Vector 1 registers
	! These are read only registers

ldsv1:
	setx	LDSV1, %l0, %l1
!	set	LDSV1_COUNT, %l2
	set	1, %l2
	setx	LDSV1_STEP, %l0, %l3

ldsv1_loop_top:
	ldxa	[%l1]%asi, %l7
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	ldsv1_loop_top
	dec	%l2

	! Test the Logical Device State Vector 2 registers
	! These are read only registers

ldsv2:
	setx	LDSV2, %l0, %l1
!	set	LDSV2_COUNT, %l2
	set	1, %l2
	setx	LDSV2_STEP, %l0, %l3

ldsv2_loop_top:
	ldxa	[%l1]%asi, %l7
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	ldsv2_loop_top
	dec	%l2

	! Test the Logical Device Interrupt Mask 0 register.
	
ld_im0_write1:
	setx	LD_IM0, %l0, %l1
!	set	LD_IM0_COUNT, %l2
	set	1, %l2
	setx	LD_IM0_STEP, %l0, %l3
	sub	%g0, 1, %l4		! Data of all 1's

ld_im0_write1_loop_top:
	stxa	%l4, [%l1]%asi
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	ld_im0_write1_loop_top
	dec	%l2

ld_im0_read1:	
	setx	LD_IM0, %l0, %l1
	set	LD_IM0_COUNT, %l2

ld_im0_read1_loop_top:
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 3		! Exp. data = 3 since only bits 1:0 are R/W
	bne	test_failed
	nop
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	ld_im0_read1_loop_top
	dec	%l2

ld_im0_write0:
	setx	LD_IM0, %l0, %l1
	set	LD_IM0_COUNT, %l2

ld_im0_write0_loop_top:
	stxa	%g0, [%l1]%asi
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	ld_im0_write0_loop_top
	dec	%l2

ld_im0_read0:
	setx	LD_IM0, %l0, %l1
	set	LD_IM0_COUNT, %l2

ld_im0_read0_loop_top:
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 0
	bne	test_failed
	nop
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	ld_im0_read0_loop_top
	dec	%l2

	! Test the Logical Device Interrupt Mask 1 register.
	
ld_im1_write1:
	setx	LD_IM1, %l0, %l1
!	set	LD_IM1_COUNT, %l2
	set	1, %l2
	setx	LD_IM1_STEP, %l0, %l3
	sub	%g0, 1, %l4		! Data of all 1's

ld_im1_write1_loop_top:
	stxa	%l4, [%l1]%asi
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	ld_im1_write1_loop_top
	dec	%l2

ld_im1_read1:	
	setx	LD_IM1, %l0, %l1
	set	LD_IM1_COUNT, %l2

ld_im1_read1_loop_top:
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 3		! Exp. data = 3 since only bits 1:0 are R/W
	bne	test_failed
	nop
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	ld_im1_read1_loop_top
	dec	%l2

ld_im1_write0:
	setx	LD_IM1, %l0, %l1
	set	LD_IM1_COUNT, %l2

ld_im1_write0_loop_top:
	stxa	%g0, [%l1]%asi
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	ld_im1_write0_loop_top
	dec	%l2

ld_im1_read0:
	setx	LD_IM1, %l0, %l1
	set	LD_IM1_COUNT, %l2

ld_im1_read0_loop_top:
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 0
	bne	test_failed
	nop
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	ld_im1_read0_loop_top
	dec	%l2

	! Test the Logical Device Group Interrupt Management registers

ldgimgn_write1:
	setx	LDGIMGN, %l0, %l1
	setx	LDGIMGN_COUNT, %l0, %l2
	setx	LDGIMGN_STEP, %l0, %l3
	sub	%g0, 1, %l4			! Data of all 1's

ldgimgn_write1_loop_top:
	stxa	%l4, [%l1]%asi
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	ldgimgn_write1_loop_top
	dec	%l2

ldgimgn_read1:
	setx	LDGIMGN, %l0, %l1
	setx	LDGIMGN_COUNT, %l0, %l2

ldgimgn_read1_loop_top:
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 0		! Since this contains a countdown timer,
	beq	test_failed	! value is not known.
	nop
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	ldgimgn_read1_loop_top
	dec	%l2

ldgimgn_write0:
	setx	LDGIMGN, %l0, %l1
	setx	LDGIMGN_COUNT, %l0, %l2

ldgimgn_write0_loop_top:
	stxa	%g0, [%l1]%asi
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	ldgimgn_write0_loop_top
	dec	%l2

ldgimgn_read0:
	setx	LDGIMGN, %l0, %l1
	setx	LDGIMGN_COUNT, %l0, %l2

ldgimgn_read0_loop_top:
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 0
	bne	test_failed
	nop
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	ldgimgn_read0_loop_top
	dec	%l2

	! Test the Logical Device Group Interrupt Timer Resolution register.

ldgitmres_write1:
	setx	LDGITMRES, %l0, %l1
	sub	%g0, 1, %l4
	stxa	%l4, [%l1]%asi

ldgitmres_read1:
	setx	0xfffff, %l0, %l4	! Only bits [19:0] are R/W
	ldxa	[%l1]%asi, %l7
	cmp	%l7, %l4
	bne	test_failed
	nop

ldgitmres_write0:
	setx	LDGITMRES, %l0, %l1

	stxa	%g0, [%l1]%asi

ldgitmres_read0:
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 0
	bne	test_failed
	nop

	! Test the System Interrupt Data registers.

sid_write1:
	setx	SID, %l0, %l1
	setx	SID_COUNT, %l0, %l2
	setx	SID_STEP, %l0, %l3
	sub	%g0, 1, %l4		! Data of all 1's

sid_write1_loop_top:
	stxa	%l4, [%l1]%asi
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	sid_write1_loop_top
	dec	%l2

sid_read1:
	setx	SID, %l0, %l1
	setx	SID_COUNT, %l0, %l2

sid_read1_loop_top:	
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 0x7f		! Only bits [6:0] are R/W
	bne	test_failed
	nop
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	sid_read1_loop_top
	dec	%l2

sid_write0:
	setx	SID, %l0, %l1
	setx	SID_COUNT, %l0, %l2
	setx	SID_STEP, %l0, %l3

sid_write0_loop_top:
	stxa	%g0, [%l1]%asi
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	sid_write0_loop_top
	dec	%l2

sid_read0:
	setx	SID, %l0, %l1
	setx	SID_COUNT, %l0, %l2

sid_read0_loop_top:	
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 0
	bne	test_failed
	nop
	add	%l1, %l3, %l1
	cmp	%l2, 1
	bne	sid_read0_loop_top
	dec	%l2

	! Test the Tx_xMac Status Registers

tx_xmac_status0_read:
	setx	xtxmac_status0_addr, %l0, %l1
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 0
	bne	test_failed
	nop	

tx_xmac_status1_read:
	setx	xtxmac_status1_addr, %l0, %l1
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 0
	bne	test_failed
	nop	

	! Test the Rx_xMac Status Registers

rx_xmac_status0_read:
	setx	xrxmac_status0_addr, %l0, %l1
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 0
	bne	test_failed
	nop	

rx_xmac_status1_read:
	setx	xrxmac_status1_addr, %l0, %l1
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 0
	bne	test_failed
	nop	

	! Test the xMac Flow Control Status Registers

xmac_flow_stat0_read:
	setx	xmac_flow_stat0_addr, %l0, %l1
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 0
	bne	test_failed
	nop	

xmac_flow_stat1_read:
	setx	xmac_flow_stat1_addr, %l0, %l1
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 0
	bne	test_failed
	nop

	! Test the xMac Flow Control Status Mask Registers

xmac_flow_stat_mask0_read:
	setx	xmac_flow_msk0_addr, %l0, %l1
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 7
	bne	test_failed
	nop	

xmac_flow_stat_mask1_read:
	setx	xmac_flow_msk1_addr, %l0, %l1
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 7
	bne	test_failed
	nop

	! Test the Tx_xMac Status Mask Registers

tx_xmac_mask0_read:
	setx	xtxmac_stat_msk0_addr, %l0, %l1
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 0xfff
	bne	test_failed
	nop	

tx_xmac_mask1_read:
	setx	xtxmac_stat_msk1_addr, %l0, %l1
	ldxa	[%l1]%asi, %l7
	cmp	%l7, 0xfff
	bne	test_failed
	nop	

	! Test the Rx_xMac Status Mask Registers

	setx	0xfffff, %l0, %l6
rx_xmac_mask0_read:
	setx	xrxmac_stat_msk0_addr, %l0, %l1
	ldxa	[%l1]%asi, %l7
	cmp	%l7, %l6
	bne	test_failed
	nop	

rx_xmac_mask1_read:
	setx	xrxmac_stat_msk1_addr, %l0, %l1
	ldxa	[%l1]%asi, %l7
	cmp	%l7, %l6
	bne	test_failed
	nop	

	! Done

	ba	test_passed
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
	.word	0x0
	.word	0x0
user_data_end:	
.end
