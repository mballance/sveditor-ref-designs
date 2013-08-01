/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_macros.h
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
#ifndef ALREADY_INCLUDED_NIU_MACROS_DOT_H
#define ALREADY_INCLUDED_NIU_MACROS_DOT_H



/****************************************************************
* Objective:
*   Set up to allow an interrupt on transmit frame completion of
*   a marked frame.  The registers LD_IM0, LDGIMGN, LDGITMRES,
*   SID and TX_ENT_MSK are programmed.
* 
* Syntax:
* NIU_TX_LD_IM0_INTR_ON_MARK(
*       tx_dma_channel, tmp_reg_1, tmp_reg_2, tmp_reg_3,
*       tmp_reg_4, ldg_number, device_number
*       )
* 
* Args:
*    tx_dma_channel     -> NIU Tx DMA channel # to use, 0 to 15.
*    tmp_reg_1/2/3/4    -> temporary registers
*    ldg_number         -> number of logical device group to use.
*    device_number      -> device number to send to NCU, NOT logical
*                          number nor logical group device number.
* 
*/

define(NIU_TX_LD_IM0_INTR_ON_MARK,`
	mov	$1, $5
	add	$5, 32, $5
	mov	$5, $2
	setx	LD_IM0_STEP, $3, $4
	mulx	$2, $4, $2
	setx	LD_IM0, $3, $4
	add	$4, $2, $4
	stxa	%g0, [$4]ASI_PRIMARY_LITTLE
1:
	mov	$5, $2
	setx	LDG_NUM_STEP, $3, $4
	mulx	$2, $4, $2
	setx	LDG_NUM, $3, $4
	add	$4, $2, $4
	setx	$6, $3, $2
	stxa	$2, [$4]ASI_PRIMARY_LITTLE
2:
	setx	$6, $3, $2
	setx	LDGIMGN_STEP, $3, $5
	mulx	$2, $5, $2
	setx	LDGIMGN, $3, $4
	add	$4, $2, $4
	setx	0x80000001, $3, $2
	stxa	$2, [$4]ASI_PRIMARY_LITTLE
3:
	setx	LDGITMRES, $3, $4
	set	1, $2
	stxa	$2, [$4]ASI_PRIMARY_LITTLE
4:
	setx	SID_STEP, $3, $2
	mulx	$2, $6, $2
	setx	SID, $3, $4
	add	$4, $2, $4
	setx	$7, $2, $3
	stxa	$3, [$4]ASI_PRIMARY_LITTLE
5:
	mov	$1, $5
	sllx	$5, 9, $5
	setx	TX_ENT_MSK, $3, $4
	add	$4, $5, $4
	stxa	%g0, [$4]ASI_PRIMARY_LITTLE
	membar	#Sync
      ')

define(NIU_RX_LD_IM0_INTR_ON_MARK,`
        mov     $1, $5
        add     $5, 0, $5
        mov     $5, $2
        setx    LD_IM0_STEP, $3, $4
        mulx    $2, $4, $2
        setx    LD_IM0, $3, $4
        add     $4, $2, $4
        stxa    %g0, [$4]ASI_PRIMARY_LITTLE
1:
        mov     $5, $2
        setx    LDG_NUM_STEP, $3, $4
        mulx    $2, $4, $2
        setx    LDG_NUM, $3, $4
        add     $4, $2, $4
        setx    $6, $3, $2
        stxa    $2, [$4]ASI_PRIMARY_LITTLE
2:
        setx    $6, $3, $2
        setx    LDGIMGN_STEP, $3, $5
        mulx    $2, $5, $2
        setx    LDGIMGN, $3, $4
        add     $4, $2, $4
        setx    0x80000001, $3, $2
        stxa    $2, [$4]ASI_PRIMARY_LITTLE
3:
        setx    LDGITMRES, $3, $4
        set     1, $2
        stxa    $2, [$4]ASI_PRIMARY_LITTLE
4:
        setx    SID_STEP, $3, $2
        mulx    $2, $6, $2
        setx    SID, $3, $4
        add     $4, $2, $4
        setx    $7, $2, $3
        stxa    $3, [$4]ASI_PRIMARY_LITTLE
5:
        mov     $1, $5
	mulx	$5, RX_DMA_CTL_STAT_STEP, $5
        setx    RX_DMA_ENT_MSK, $3, $4
        add     $4, $5, $4
	ldxa	[$4]ASI_PRIMARY_LITTLE, $2
        setx    THRES_MASK, $3, $8
	and	$2, $8, $2
        stxa    $2, [$4]ASI_PRIMARY_LITTLE

        setx    RX_DMA_CTL_STAT, $3, $4
        setx    THRES_INT, $3, $8
        add     $4, $5, $4
        ldxa    [$4]ASI_PRIMARY_LITTLE, $2
        or      $2, $8, $2
        stxa    $2, [$4]ASI_PRIMARY_LITTLE

/*
	setx	RCRCFIG_B, $3, $4
	ldxa	[$4]ASI_PRIMARY_LITTLE, $2
	mov	$2, $8
	srlx	$2, 32, $2
	sllx	$2, 16, $2
	set	RXMAC_PKTCNT, $3
	sub	$3, 1, $3
	add	$2, $3, $2
	sllx	$2, 16, $2
	setx	0x000000000000ffff, $3, $5
	and	$8, $5, $8
	add	$2, $8, $2
	stxa    $2, [$4]ASI_PRIMARY_LITTLE
	
*/

        membar  #Sync
      ')

/****************************************************************
* Objective:
*   Set up to allow an interrupt on transmit packet completion
*   from the MAC. The register TxMAC Mask, xtxmac_stat_msk, is programmed.
* 
* Syntax:
* NIU_TX_MAC_COMPL_INTR (
*       mac_port, tmp_reg_2, tmp_reg_3
*       )
* 
* Args:
*    mac_port           -> 0 = MAC port 0, 1 = MAC port 1
*    tmp_reg_2/3        -> temporary registers
* 
*/

define(NIU_TX_MAC_COMPL_INTR,`
	set	$1, $2
	cmp	$2, 0
	bne	1f
	nop
	setx	xtxmac_stat_msk0_addr, $2, $3
	ba	2f
	nop
1:
	setx	xtxmac_stat_msk1_addr, $2, $3
2:
	stxa	%g0, [$3]ASI_PRIMARY_LITTLE
	membar	#Sync
      ')


/****************************************************************
* Objective:
*   Set up to allow an interrupt on receive packet completion
*   from the MAC. The register RxMAC Mask, xrxmac_stat_msk, is programmed.
* 
* Syntax:
* NIU_RX_MAC_COMPL_INTR (
*       mac_port, tmp_reg_2, tmp_reg_3
*       )
* 
* Args:
*    mac_port           -> 0 = MAC port 0, 1 = MAC port 1
*    tmp_reg_2/3        -> temporary registers
* 
*/

define(NIU_RX_MAC_COMPL_INTR,`
	set	$1, $2
	cmp	$2, 0
	bne	1f
	nop
	setx	xrxmac_stat_msk0_addr, $2, $3
	ba	2f
	nop
1:
	setx	xrxmac_stat_msk1_addr, $2, $3
2:
	stxa	%g0, [$3]ASI_PRIMARY_LITTLE
	membar	#Sync
      ')


/****************************************************************
* Objective:
*   Set up to allow an interrupt receive channel configuration logical
*   page violation error. The registers LD_IM0, LDGNUM, LDGIMGN, LDGITMRES,
*   SID, RXDMA_CFIG1 and RX_DMA_ENT_MSK are programmed.
* 
* Syntax:
* NIU_RX_DMA_INTR_ON_CFIGLOGPAGE (
*       rx_dma_channel, ldg_number, device_number, tmp_reg_1,
*       tmp_reg_2, tmp_reg_3, tmp_reg_4 )
*       )
* 
* Args:
*    rx_dma_channel     -> NIU Rx DMA channel #, 0 to 15, aka logical device number.
*    ldg_number         -> number of logical device group to use.
*    device_number      -> device number to send to NCU, NOT logical
*                          number nor logical group device number.
*    tmp_reg_1/2/3/4    -> 4 temporary registers
* 
*/

define(NIU_RX_DMA_INTR_ON_CFIGLOGPAGE,`
       setx	LD_IM0, $4, $5
       setx	LD_IM0_STEP, $4, $6
       mulx	$6, $1, $6
       add	$5, $6, $5
       stxa	%g0, [$5]ASI_PRIMARY_LITTLE
1:
       setx	LDG_NUM, $4, $5
       setx	LDG_NUM_STEP, $4, $6
       mulx	$6, $1, $6
       add	$5, $6, $5
       mov	$2, $7
       stxa	$7, [$5]ASI_PRIMARY_LITTLE
2:
       setx	LDGIMGN, $4, $5
       setx	LDGIMGN_STEP, $4, $6
       mulx	$6, $2, $6
       add	$5, $6, $5
       setx	0x80000001, $4, $7
       stxa	$7, [$5]ASI_PRIMARY_LITTLE
3:
       setx	LDGITMRES, $4, $5
       set	1, $6
       stxa	$6, [$5]ASI_PRIMARY_LITTLE
4:
       setx	SID, $4, $5
       setx	SID_STEP, $4, $6
       mulx	$6, $2, $6
       add	$5, $6, $5
       mov	$3, $7
       stxa	$7, [$5]ASI_PRIMARY_LITTLE
5:
       setx	RX_DMA_ENT_MSK, $4, $5
       setx	RX_DMA_CTL_STAT_STEP, $4, $6
       mulx	$6, $1, $6
       add	$5, $6, $5
       stxa	%g0, [$5]ASI_PRIMARY_LITTLE
       membar	#Sync
      ')



/* following endif needs to be at very bottom  -- 6/27/05  */
#endif
