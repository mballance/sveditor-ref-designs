/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_defines.h
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
#define TXC_DMA_MAXBURST_MASK   0x00000000000fffff
#define TXC_PORT_CONTROL_MASK   0x00000000ffffffff
#define TXC_PORT0_CONTROL       0x020			/* 081505 MAQ  #define TXC_PORT0_CONTROL       0x010 */
#define TXC_PORT1_CONTROL       0x120			/* 081505 MAQ  #define TXC_PORT1_CONTROL       0x018 */
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

#define	txc_dma0_data		0xa5a5a5a5a5a5a5a5
#define fzc_txc_data		0xffffffffffffffff
#define	txc_pio_data		0x1f

#define FZC_PIO_BASE_ADDRESS	0x80000
#define FZC_PIO_ADDRESS_RANGE	mpeval(NEPTUNE_BASE_ADDRESS + FZC_PIO_BASE_ADDRESS)
#define ZCP_BASE_ADDRESS	0x500000
#define ZCP_ADDRESS_RANGE	mpeval(NEPTUNE_BASE_ADDRESS + ZCP_BASE_ADDRESS)
#define FZC_ZCP_BASE_ADDRESS	0x580000
#define FZC_ZCP_ADDRESS_RANGE	mpeval(NEPTUNE_BASE_ADDRESS + FZC_ZCP_BASE_ADDRESS)
#define PIO_LDSV_BASE_ADDRESS	0x800000
#define PIO_LDSV_ADDRESS_RANGE	mpeval(NEPTUNE_BASE_ADDRESS + PIO_LDSV_BASE_ADDRESS)
#define PIO_IMASK0_BASE_ADDRESS	0xa00000
#define PIO_IMASK0_ADDRESS_RANGE mpeval(NEPTUNE_BASE_ADDRESS + PIO_IMASK0_BASE_ADDRESS)
#define PIO_IMASK1_BASE_ADDRESS 0xb00000
#define PIO_IMASK1_ADDRESS_RANGE mpeval(NEPTUNE_BASE_ADDRESS + PIO_IMASK1_BASE_ADDRESS)

#define	LDG_NUM		mpeval(FZC_PIO_ADDRESS_RANGE+0x20000)
#define LDG_NUM_COUNT   69
#define LDG_NUM_STEP    8

#define LDSV0           mpeval(PIO_LDSV_ADDRESS_RANGE+0x0)
#define LDSV0_COUNT     64
#define LDSV0_STEP      8192
#define LDSV1           mpeval(PIO_LDSV_ADDRESS_RANGE+0x8)
#define LDSV1_COUNT     64
#define LDSV1_STEP      8192
#define LDSV2           mpeval(PIO_LDSV_ADDRESS_RANGE+0x10)
#define LDSV2_COUNT     64
#define LDSV2_STEP      8192

#define LD_IM0		mpeval(PIO_IMASK0_ADDRESS_RANGE+0x00000)
#define LD_IM0_COUNT    64
#define LD_IM0_STEP     8192
#define LD_IM1		mpeval(PIO_IMASK1_ADDRESS_RANGE+0x00000)
#define LD_IM1_COUNT    5
#define LD_IM1_STEP     8192

#define LDGIMGN		mpeval(PIO_LDSV_ADDRESS_RANGE+0x00018)
#define LDGIMGN_COUNT   64
#define LDGIMGN_STEP    8192

#define LDGITMRES	mpeval(FZC_PIO_ADDRESS_RANGE+0x00008)

#define SID		mpeval(FZC_PIO_ADDRESS_RANGE+0x10200)
#define SID_COUNT       64
#define SID_STEP        8

#define SMX_CFIG_DAT    mpeval(FZC_PIO_ADDRESS_RANGE+0x40)
#define SMX_INT_STAT    mpeval(FZC_PIO_ADDRESS_RANGE+0x48)

#define SYS_ERR_MASK    mpeval(FZC_PIO_ADDRESS_RANGE+0x00090)
#define SYS_ERR_STAT    mpeval(FZC_PIO_ADDRESS_RANGE+0x00098)

#define ZCP_INT_STAT    mpeval(FZC_ZCP+0x8)
#define ZCP_INT_MASK    mpeval(FZC_ZCP+0x10)


#define DMC_BASE_ADDRESS        0x600000
#define FZC_DMC_BASE_ADDRESS    0x680000
#define DMC_ADDRESS_RANGE       mpeval(NEPTUNE_BASE_ADDRESS + DMC_BASE_ADDRESS)
#define FZC_DMC_ADDRESS_RANGE   mpeval(NEPTUNE_BASE_ADDRESS + FZC_DMC_BASE_ADDRESS)

#define DEF_PORT0_RDC          mpeval(FZC_DMC_ADDRESS_RANGE+0x00008)
#define DEF_PORT1_RDC          mpeval(FZC_DMC_ADDRESS_RANGE+0x00010)

#define RX_ADDR_MD             mpeval(FZC_DMC_ADDRESS_RANGE+0x00070)
#define RDC_TABLE_BASE         mpeval(FZC_DMC_ADDRESS_RANGE+0x10000)
#define RX_LOG_PAGE_VLD        mpeval(FZC_DMC_ADDRESS_RANGE+0x20000)
#define RX_LOG_PAGE1           mpeval(FZC_DMC_ADDRESS_RANGE+0x20008)
#define RX_LOG_PAGE2           mpeval(FZC_DMC_ADDRESS_RANGE+0x20010)
#define RX_LOG_PAGE_RELO1      mpeval(FZC_DMC_ADDRESS_RANGE+0x20018)
#define RX_LOG_PAGE_RELO2      mpeval(FZC_DMC_ADDRESS_RANGE+0x20020)
#define Rx_LOG_PAGE_HDL        mpeval(FZC_DMC_ADDRESS_RANGE+0x20028)
#define RDC_RED_PARA           mpeval(FZC_DMC_ADDRESS_RANGE+0x30000)

#define RXDMA_CFIG_BASE        mpeval(DMC_ADDRESS_RANGE+0x00000)
#define RBR_CFIG_A             mpeval(DMC_ADDRESS_RANGE+0x00010)
#define RBR_CFIG_B             mpeval(DMC_ADDRESS_RANGE+0x00018)
#define RCRCFIG_A              mpeval(DMC_ADDRESS_RANGE+0x00040)
#define TBR_CFIG_A             mpeval(DMC_ADDRESS_RANGE+0x10000)
#define RBR_KICK               mpeval(DMC_ADDRESS_RANGE+0x00020)
#define RBR_HD                 mpeval(DMC_ADDRESS_RANGE+0x00030)
#define RBR_TL                 mpeval(DMC_ADDRESS_RANGE+0x00038)
#define RCR_STAT_A             mpeval(DMC_ADDRESS_RANGE+0x00050)
#define RCRCFIG_B	       mpeval(DMC_ADDRESS_RANGE+0x00048)
#define RX_DMA_ENT_MSK	       mpeval(DMC_ADDRESS_RANGE+0x00068)
#define THRES_MASK	       0xffffffffffffbfff
#define THRES_INT	       0x0000800000000000

#define RX_DMA_CTL_STAT        mpeval(DMC_ADDRESS_RANGE+0x70)
#define RX_DMA_CTL_STAT_COUNT  16
#define RX_DMA_CTL_STAT_STEP   0x200
#define RX_DMA_CTL_STAT_DBG    mpeval(DMC_ADDRESS_RANGE+0x98)
#define RX_DMA_CTL_STAT_DBG_STEP    0x200
#define RX_DMA_CTL_STAT_DBG_COUNT   16

#define FZC_FFLP_BASE_ADDRESS   0x380000
#define FZC_FFLP_BASE_OFFSET    0x020000
#define FFLP_CONFIG             0x00100
#define FFLP_ADDRESS_RANGE      mpeval(NEPTUNE_BASE_ADDRESS + FZC_FFLP_BASE_ADDRESS + FZC_FFLP_BASE_OFFSET)
#define XTxMAC_SW_RST           mpeval(0x000 <<1)
#define XRxMAC_SW_RST           mpeval(0x004 <<1)
#define XTxMAC_STATUS           mpeval(0x010 <<1)
#define XRxMAC_STATUS           mpeval(0x014 <<1)
#define XTxMAC_STAT_MSK         mpeval(0x020 <<1)
#define XRxMAC_STAT_MSK         mpeval(0x024 <<1)
#define xMAC_FLOW_STAT          mpeval(0x018 <<1)
#define xMAC_FLOW_STAT_MSK      mpeval(0x028 <<1)
#define IPP_0_RANGE      	0x00000000 
#define IPP_1_RANGE		0x00008000		/* 071405  #define IPP_1_RANGE      	0x00001000  */
#define IPP_2_RANGE      	0x00002000 
#define IPP_3_RANGE      	0x00003000 
#define FZC_IPP_BASE_ADDRESS    0x280000
#define IPP_ADDRESS_RANGE       mpeval(NEPTUNE_BASE_ADDRESS + FZC_IPP_BASE_ADDRESS)
#define IPP0_BASE       	mpeval(IPP_ADDRESS_RANGE + IPP_0_RANGE)
#define IPP1_BASE       	mpeval(IPP_ADDRESS_RANGE + IPP_1_RANGE)
#define IPP2_BASE       	mpeval(IPP_ADDRESS_RANGE + IPP_2_RANGE)
#define IPP3_BASE       	mpeval(IPP_ADDRESS_RANGE + IPP_3_RANGE)

#define IPP_CONFIG              0x000000000
#define PORT_RANGE_MASK   	0x0000F000
#define PORT_OFFSET       	0x00001000
#define PORT_0_RANGE      	0x00000000
#define XPCS_0_RANGE      	mpeval(0x00001000 << 1)
#define PCS_0_RANGE       	mpeval(0x00002000 << 1)
#define PORT_1_RANGE      	mpeval(0x00003000 << 1)
#define XPCS_1_RANGE      	mpeval(0x00004000 << 1)
#define PCS_1_RANGE       	mpeval(0x00005000 << 1)
#define PORT_2_RANGE      	mpeval(0x00006000 << 1)
#define PCS_2_RANGE       	mpeval(0x00007000 << 1)
#define PORT_3_RANGE      	mpeval(0x00008000 << 1)
#define PCS_3_RANGE       	mpeval(0x00009000 << 1)
#define ESER_RANGE        	mpeval(0x0000a000 << 1)
#define MAC0_BASE       	mpeval(MAC_ADDRESS_RANGE + PORT_0_RANGE)
#define MAC1_BASE       	mpeval(MAC_ADDRESS_RANGE + PORT_1_RANGE)
#define MAC2_BASE       	mpeval(MAC_ADDRESS_RANGE + PORT_2_RANGE)
#define MAC3_BASE       	mpeval(MAC_ADDRESS_RANGE + PORT_3_RANGE)

#define	XMAC_MAX		mpeval(0x048       <<1)
#define XMAC_CONFIG             mpeval(0x030       <<1)
#define	xmac_config0		mpeval(MAC0_BASE + XMAC_CONFIG)
#define	xmac_config1		mpeval(MAC1_BASE + XMAC_CONFIG)
#define XMAC0_MAX_addr		mpeval(MAC0_BASE + XMAC_MAX)
#define XMAC1_MAX_addr		mpeval(MAC1_BASE + XMAC_MAX)
#define XMAC0_MAX_data		0x00003fff
#define XMAC1_MAX_data		0x00003fff
#define xpcs0_config_vendor1    mpeval(XPCS0_BASE + XPCS_CONFIG_VENDOR1)
#define xpcs1_config_vendor1    mpeval(XPCS1_BASE + XPCS_CONFIG_VENDOR1)
#define fflp_reg0               mpeval(FFLP_ADDRESS_RANGE +FFLP_CONFIG)
#define txc_reg0                mpeval(TXC_DMA0_BASE + TXC_DMA_MAXBURST)
#define txc_reg1                mpeval(TXC_FZC_BASE+ TXC_PORT0_CONTROL)
#define txc_reg2                mpeval(TXC_FZC_BASE+ TXC_PORT1_CONTROL)
#define txc_reg3                mpeval(TXC_PIO_BASE + TXC_CONTROL)
#define xtxmac_sw_rst0_addr	mpeval(MAC0_BASE + XTxMAC_SW_RST)
#define xrxmac_sw_rst0_addr	mpeval(MAC0_BASE + XRxMAC_SW_RST)
#define xtxmac_sw_rst1_addr	mpeval(MAC1_BASE + XTxMAC_SW_RST)
#define xrxmac_sw_rst1_addr	mpeval(MAC1_BASE + XRxMAC_SW_RST)
#define xtxmac_status0_addr	mpeval(MAC0_BASE + XTxMAC_STATUS)
#define xrxmac_status0_addr	mpeval(MAC0_BASE + XRxMAC_STATUS)
#define xtxmac_status1_addr	mpeval(MAC1_BASE + XTxMAC_STATUS)
#define xrxmac_status1_addr	mpeval(MAC1_BASE + XRxMAC_STATUS)
#define xtxmac_stat_msk0_addr	mpeval(MAC0_BASE + XTxMAC_STAT_MSK)
#define xrxmac_stat_msk0_addr	mpeval(MAC0_BASE + XRxMAC_STAT_MSK)
#define xtxmac_stat_msk1_addr	mpeval(MAC1_BASE + XTxMAC_STAT_MSK)
#define xrxmac_stat_msk1_addr	mpeval(MAC1_BASE + XRxMAC_STAT_MSK)
#define xmac_flow_stat0_addr	mpeval(MAC0_BASE + xMAC_FLOW_STAT)
#define xmac_flow_stat1_addr	mpeval(MAC1_BASE + xMAC_FLOW_STAT)
#define xmac_flow_msk0_addr	mpeval(MAC0_BASE + xMAC_FLOW_STAT_MSK)
#define xmac_flow_msk1_addr	mpeval(MAC1_BASE + xMAC_FLOW_STAT_MSK)
#define Time_out                0x10
#define delay_10_count          0x5
#define zcp_16_count            0x10
#define zcp_32_count            0x20
#define zcp_64_count            0x40
#define zcp_128_count           0x80
#define ipp_config0_addr        mpeval(IPP0_BASE + IPP_CONFIG)
#define ipp_config1_addr        mpeval(IPP1_BASE + IPP_CONFIG)
#define ipp_config_data        	0x0000000001ffff11		/* 071405 0x0000000000000101 */
#define fflp_config_addr        mpeval(FFLP_ADDRESS_RANGE +FFLP_CONFIG)
#define fflp_config_data        0x0000000000043301

#define FFLP_L2_CLS_2                    0x00000
#define FFLP_L2_CLS_3                    0x00008
#define FFLP_L3_CLS_4                    0x00010
#define FFLP_L3_CLS_5                    0x00018
#define FFLP_L3_CLS_6                    0x00020
#define FFLP_L3_CLS_7                    0x00028
#define FFLP_CAM_KEY_REG0                0x00090
#define FFLP_CAM_KEY_REG1                0x00098
#define FFLP_CAM_KEY_REG2                0x000a0
#define FFLP_CAM_KEY_REG3                0x000a8
#define FFLP_CAM_KEY_MASK_REG0           0x000b0
#define FFLP_CAM_KEY_MASK_REG1           0x000b8
#define FFLP_CAM_KEY_MASK_REG2           0x000c0
#define FFLP_CAM_KEY_MASK_REG3           0x000c8
#define FFLP_CAM_CONTROL                 0x000d0

#define xpcs0_control1_addr		mpeval(XPCS0_BASE + XPCS_CONTROL1)
#define xpcs1_control1_addr		mpeval(XPCS1_BASE + XPCS_CONTROL1)
#define	xpcs0_control1_data		0x00008000
#define	xpcs1_control1_data		0x00008000
#define fflp_l2_cls_2_addr      mpeval(FFLP_ADDRESS_RANGE + FFLP_L2_CLS_2)
#define fflp_l2_cls_3_addr      mpeval(FFLP_ADDRESS_RANGE + FFLP_L2_CLS_3)
#define fflp_l3_cls_4_start     mpeval(FFLP_ADDRESS_RANGE + FFLP_L3_CLS_4)
#define fflp_l3_cls_4_end       mpeval(FFLP_ADDRESS_RANGE + FFLP_L3_CLS_7)
#define fflp_cam_key_reg0_start mpeval(FFLP_ADDRESS_RANGE + FFLP_CAM_KEY_REG0)
#define fflp_cam_key_reg0_end   mpeval(FFLP_ADDRESS_RANGE + FFLP_CAM_KEY_REG3)
#define fflp_cam_key_mask_reg0_start    mpeval(FFLP_ADDRESS_RANGE + FFLP_CAM_KEY_MASK_REG0)
#define fflp_cam_key_mask_reg0_end      mpeval(FFLP_ADDRESS_RANGE + FFLP_CAM_KEY_MASK_REG3)
#define fflp_cam_control_addr   mpeval(FFLP_ADDRESS_RANGE + FFLP_CAM_CONTROL)
#define fflp_cam_ram_data       0x100000
#define txc_dma_maxburst_addr   mpeval(TXC_DMA0_BASE + TXC_DMA_MAXBURST)
#define txc_dma_maxburst_data   0x00000000000005ea
#define txc_port0_control_addr  mpeval(TXC_FZC_BASE + TXC_PORT0_CONTROL)
#define txc_port0_control_data  0x0000000000000001
#define txc_port1_control_addr  mpeval(TXC_FZC_BASE + TXC_PORT1_CONTROL)
#define txc_port1_control_data  0x0000000000000000
#define txc_control_addr        mpeval(TXC_FZC_BASE + TXC_CONTROL)
#define txc_control_data        0x1f

#define RX_ADDR_MD_data         0x0000000000000001
#define RXDMA_CFIG_BASE_data    0x8000000000000001
#define RXDMA_CFIG1         	mpeval(DMC_ADDRESS_RANGE+0x00000)
#define RXDMA_CFIG1_data	0x0000000080000000 	/* b31 DMA-EN */
#define RBR_CFIG_A_data         0x00FF000100000200	/* LEN FF , START ADDR 100000200 */
#define RBR_CFIG_B_data		0x0000000000808080	/* Set all 3 sizes S,M &L */
#define RX_LOG_PAGE_VLD_data	0x0000000000000003	/* Logical Page0&1 valid */
#define RBR_KICK_data		0x0000000000000128	/* KICK 8 buffers */
#define RBR_HDH                 mpeval(DMC_ADDRESS_RANGE + 0x00030)
#define RBR_HDH_data		0x0000000000000200
#define RBR_HDL                 mpeval(DMC_ADDRESS_RANGE + 0x00038)
#define RBR_HDL_data		0x0000000000000006

#define XMAC_ADDR_CMPEN_LSB	mpeval( 0x104       <<1)
#define XMAC_HOST_INFO0		mpeval( 0x480       <<1)
#define XMAC_HOST_INFO1		mpeval( 0x484       <<1)
#define XMAC_HOST_INFO2		mpeval( 0x488       <<1)
#define XMAC_HOST_INFO3		mpeval( 0x48C 	    <<1)
#define XMAC_HOST_INFO4         mpeval( 0x490       <<1)
#define XMAC_HOST_INFO5         mpeval( 0x494       <<1)
#define XMAC_HOST_INFO6         mpeval( 0x498       <<1)
#define XMAC_HOST_INFO7         mpeval( 0x49C       <<1)
#define XMAC_ADDR3		mpeval( 0x10C       <<1)
#define XMAC_ADDR4		mpeval( 0x110       <<1)
#define XMAC_ADDR5		mpeval( 0x114       <<1)
#define XMAC_ADDR6		mpeval( 0x118       <<1)
#define XMAC_ADDR7		mpeval( 0x11C       <<1)
#define XMAC_ADDR8		mpeval( 0x120       <<1)
#define XMAC_ADDR9		mpeval( 0x124       <<1)            
#define XMAC_ADDR10		mpeval( 0x128       <<1)            
#define XMAC_ADDR11		mpeval( 0x12C       <<1)            
#define XMAC_ADDR12		mpeval( 0x130       <<1)          
#define XMAC_ADDR13		mpeval( 0x134       <<1)            
#define XMAC_ADDR14		mpeval( 0x138       <<1)            
#define XMAC_ADDR15		mpeval( 0x13C       <<1)            
#define XMAC_ADDR16		mpeval( 0x140       <<1)            
#define XMAC_ADDR17		mpeval( 0x144       <<1)            
#define XMAC_ADDR18		mpeval( 0x148       <<1)          
#define XMAC_ADDR19		mpeval( 0x14C       <<1)            
#define XMAC_ADDR20		mpeval( 0x150       <<1)            
#define XMAC_ADDR21		mpeval( 0x154       <<1)            
#define XMAC_ADDR22		mpeval( 0x158       <<1)            
#define XMAC_ADDR23		mpeval( 0x15C       <<1)            
#define XMAC_ADDR24		mpeval( 0x160       <<1)          
#define XMAC_ADDR25		mpeval( 0x164       <<1)            
#define XMAC_ADDR26		mpeval( 0x168       <<1)            
#define XMAC_ADDR27		mpeval( 0x16C       <<1)            
#define XMAC_ADDR28		mpeval( 0x170       <<1)            
#define XMAC_ADDR29		mpeval( 0x174       <<1)            
#define XMAC_ADDR30		mpeval( 0x178       <<1)          
#define XMAC_ADDR31		mpeval( 0x17C       <<1)            
#define XMAC_ADDR32		mpeval( 0x180       <<1)            
#define XMAC_ADDR33		mpeval( 0x184       <<1)            
#define XMAC_ADDR34		mpeval( 0x188       <<1)            
#define XMAC_ADDR35		mpeval( 0x18C       <<1)            
#define XMAC_ADDR36		mpeval( 0x190       <<1)          
#define XMAC_ADDR37		mpeval( 0x194       <<1)            
#define XMAC_ADDR38		mpeval( 0x198       <<1)            
#define XMAC_ADDR39		mpeval( 0x19C       <<1)            
#define XMAC_ADDR40		mpeval( 0x1A0       <<1)            
#define XMAC_ADDR41		mpeval( 0x1A4       <<1)            
#define XMAC_ADDR42		mpeval( 0x1A8       <<1)          
#define XMAC_ADDR43		mpeval( 0x1AC       <<1)            
#define XMAC_ADDR44		mpeval( 0x1B0       <<1)            
#define XMAC_ADDR45		mpeval( 0x1B4       <<1)            
#define XMAC_ADDR46		mpeval( 0x1B8       <<1)            
#define XMAC_ADDR47		mpeval( 0x1BC       <<1)            
#define XMAC_ADDR48		mpeval( 0x1C0       <<1)          
#define XMAC_ADDR49		mpeval( 0x1C4       <<1)            
#define XMAC_ADDR50		mpeval( 0x1C8       <<1)            



#define	XMAC_ADDR_CMPEN_LSB_data	0xFFFFFFFF
#define	XMAC_CONFIG_mask	0xFFFFF9FF
#define	XMAC_CONFIG_mask1	0x00010000
#define	ctrl_word0		0x00000002
#define ctrl_word1		0x00000006
#define	ctrl_word2		0x0000000A
#define ctrl_word3		0x0000000E
#define	XMAC_ADDR3_data		0x0001		/* MAC-Address:Change the Address in Vera,if this changes */
#define	XMAC_ADDR4_data		0xFFFF
#define	XMAC_ADDR5_data		0x0100
#define XMAC_ADDR6_data		0x0003
#define XMAC_ADDR7_data		0xFFFF
#define XMAC_ADDR8_data		0x1111
#define XMAC_ADDR9_data		0x0005
#define XMAC_ADDR10_data	0xFFFF
#define XMAC_ADDR11_data	0x2722
#define XMAC_ADDR12_data	0x0007
#define XMAC_ADDR13_data	0xFFFF
#define XMAC_ADDR14_data	0x3333

#ifdef NIU_RX_MULTI_PORT
#define mac0_ctrl_word0         0x00000000
#define mac0_ctrl_word1         0x00000002
#define mac0_ctrl_word2         0x00000004
#define mac0_ctrl_word3         0x00000006
#define mac0_ctrl_word4         0x00000000
#define mac0_ctrl_word5         0x00000002
#define mac0_ctrl_word6         0x00000004
#define mac0_ctrl_word7         0x00000006

#define mac1_ctrl_word0         0x00000001
#define mac1_ctrl_word1         0x00000003
#define mac1_ctrl_word2         0x00000005
#define mac1_ctrl_word3         0x00000007
#define mac1_ctrl_word4         0x00000001
#define mac1_ctrl_word5         0x00000003
#define mac1_ctrl_word6         0x00000005
#define mac1_ctrl_word7         0x00000007
#else
#define mac0_ctrl_word0         0x00000000
#define mac0_ctrl_word1         0x00000001
#define mac0_ctrl_word2         0x00000002
#define mac0_ctrl_word3         0x00000003
#define mac0_ctrl_word4         0x00000004
#define mac0_ctrl_word5         0x00000005
#define mac0_ctrl_word6         0x00000006
#define mac0_ctrl_word7         0x00000007

#define mac1_ctrl_word0         0x00000007
#define mac1_ctrl_word1         0x00000006
#define mac1_ctrl_word2         0x00000005
#define mac1_ctrl_word3         0x00000004
#define mac1_ctrl_word4         0x00000003
#define mac1_ctrl_word5         0x00000002
#define mac1_ctrl_word6         0x00000001
#define mac1_ctrl_word7         0x00000000
#endif

#define XMAC0_ADDR3_data         0xa000         /* MAC-Address:Change the Address in Vera,if this changes */
#define XMAC0_ADDR4_data         0x56a0
#define XMAC0_ADDR5_data         0x1234

#define XMAC0_ADDR6_data         0xa001
#define XMAC0_ADDR7_data         0x56a0
#define XMAC0_ADDR8_data         0x1234

#define XMAC0_ADDR9_data         0xa002
#define XMAC0_ADDR10_data        0x56a0
#define XMAC0_ADDR11_data        0x1234

#define XMAC0_ADDR12_data        0xa003
#define XMAC0_ADDR13_data        0x56a0
#define XMAC0_ADDR14_data        0x1234

#define XMAC0_ADDR15_data        0xa004
#define XMAC0_ADDR16_data        0x56a0
#define XMAC0_ADDR17_data        0x1234

#define XMAC0_ADDR18_data        0xa005
#define XMAC0_ADDR19_data        0x56a0
#define XMAC0_ADDR20_data        0x1234

#define XMAC0_ADDR21_data        0xa006
#define XMAC0_ADDR22_data        0x56a0
#define XMAC0_ADDR23_data        0x1234

#define XMAC0_ADDR24_data        0xa007
#define XMAC0_ADDR25_data        0x56a0
#define XMAC0_ADDR26_data        0x1234

#define XMAC1_ADDR3_data         0xb000         /* MAC-Address:Change the Address in Vera,if this changes */
#define XMAC1_ADDR4_data         0x56b0
#define XMAC1_ADDR5_data         0x1234

#define XMAC1_ADDR6_data         0xb001
#define XMAC1_ADDR7_data         0x56b0
#define XMAC1_ADDR8_data         0x1234

#define XMAC1_ADDR9_data         0xb002
#define XMAC1_ADDR10_data        0x56b0
#define XMAC1_ADDR11_data        0x1234

#define XMAC1_ADDR12_data        0xb003
#define XMAC1_ADDR13_data        0x56b0
#define XMAC1_ADDR14_data        0x1234

#define XMAC1_ADDR15_data        0xb004
#define XMAC1_ADDR16_data        0x56b0
#define XMAC1_ADDR17_data        0x1234

#define XMAC1_ADDR18_data        0xb005
#define XMAC1_ADDR19_data        0x56b0
#define XMAC1_ADDR20_data        0x1234

#define XMAC1_ADDR21_data        0xb006
#define XMAC1_ADDR22_data        0x56b0
#define XMAC1_ADDR23_data        0x1234

#define XMAC1_ADDR24_data        0xb007
#define XMAC1_ADDR25_data        0x56b0
#define XMAC1_ADDR26_data        0x1234

#define RCRCFIG_A_data          0x000F000000000040
#define TBR_CFIG_A_data         mpeval(0x000F000000000080 + 0x100010000)
#define RBR_HD_data             0x0000000000000200
#define RBR_TL_data             0x0000000000000006

#define TDMC_STEP               0x200
#define TDMC_COUNT              16
#define TX_RNG_CFIG             mpeval(DMC_ADDRESS_RANGE+0x40000)
#define TX_RING_KICK            mpeval(DMC_ADDRESS_RANGE+0x40018)
#define TX_CS                   mpeval(DMC_ADDRESS_RANGE+0x40028)
#define TX_ENT_MSK	        mpeval(DMC_ADDRESS_RANGE+0x40020)
#define TDMC_INTR_DBG           mpeval(DMC_ADDRESS_RANGE+0x40060)

#define TxRingConfig_data       0x000F000100000000
#define SetTxCs_data            0x00000000C0000000
#define Tx_Ring_Kick_data       0x0000000100000040
#ifndef loop_count
#define loop_count              0x10
#endif
#define Rx_loop_count		0x20

/*  04/25/05 ***/
#define TX_LOG_PAGE_VLD_Addr         mpeval(FZC_DMC_ADDRESS_RANGE+0x40000)
#define TX_LOG_MASK1_Addr            mpeval(FZC_DMC_ADDRESS_RANGE+0x40008)
#define TX_LOG_VALUE1_Addr           mpeval(FZC_DMC_ADDRESS_RANGE+0x40010)
#define TX_LOG_MASK2_Addr            mpeval(FZC_DMC_ADDRESS_RANGE+0x40018)
#define TX_LOG_VALUE2_Addr           mpeval(FZC_DMC_ADDRESS_RANGE+0x40020)
#define TX_LOG_PAGE_RELO1_Addr       mpeval(FZC_DMC_ADDRESS_RANGE+0x40028)
#define TX_LOG_PAGE_RELO2_Addr       mpeval(FZC_DMC_ADDRESS_RANGE+0x40030)

#define TX_RNG_CFIG_Addr             mpeval(DMC_ADDRESS_RANGE+0x40000)
#define TX_RING_KICK_Addr            mpeval(DMC_ADDRESS_RANGE+0x40018)
#define TX_CS_Addr                   mpeval(DMC_ADDRESS_RANGE+0x40028)
#define TX_CS_Data		0x0

#define TXC_DMA0_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x00 << 12))
#define TXC_DMA1_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x01 << 12))
#define TXC_DMA2_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x02 << 12))
#define TXC_DMA3_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x03 << 12))
#define TXC_DMA4_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x04 << 12))
#define TXC_DMA5_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x05 << 12))
#define TXC_DMA6_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x06 << 12))
#define TXC_DMA7_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x07 << 12))
#define TXC_DMA8_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x08 << 12))
#define TXC_DMA9_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x09 << 12))
#define TXC_DMA10_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x0a << 12))
#define TXC_DMA11_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x0b << 12))
#define TXC_DMA12_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x0c << 12))
#define TXC_DMA13_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x0d << 12))
#define TXC_DMA14_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x0e << 12))
#define TXC_DMA15_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x0f << 12))
#define TXC_DMA16_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x10 << 12))
#define TXC_DMA17_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x11 << 12))
#define TXC_DMA18_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x12 << 12))
#define TXC_DMA19_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x13 << 12))
#define TXC_DMA20_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x14 << 12))
#define TXC_DMA21_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x15 << 12))
#define TXC_DMA22_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x16 << 12))
#define TXC_DMA23_BASE 		mpeval(FZC_TXC_ADDRESS_RANGE +  (0x17 << 12))


#define	SetTxMaxBurst_DMA0_Addr		mpeval(TXC_DMA0_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA1_Addr		mpeval(TXC_DMA1_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA2_Addr		mpeval(TXC_DMA2_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA3_Addr		mpeval(TXC_DMA3_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA4_Addr		mpeval(TXC_DMA4_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA5_Addr		mpeval(TXC_DMA5_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA6_Addr		mpeval(TXC_DMA6_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA7_Addr		mpeval(TXC_DMA7_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA8_Addr		mpeval(TXC_DMA8_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA9_Addr		mpeval(TXC_DMA9_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA10_Addr	mpeval(TXC_DMA10_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA11_Addr	mpeval(TXC_DMA11_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA12_Addr	mpeval(TXC_DMA12_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA13_Addr	mpeval(TXC_DMA13_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA14_Addr	mpeval(TXC_DMA14_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA15_Addr	mpeval(TXC_DMA15_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA16_Addr	mpeval(TXC_DMA16_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA17_Addr	mpeval(TXC_DMA17_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA18_Addr	mpeval(TXC_DMA18_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA19_Addr	mpeval(TXC_DMA19_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA20_Addr	mpeval(TXC_DMA20_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA21_Addr	mpeval(TXC_DMA21_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA22_Addr	mpeval(TXC_DMA22_BASE + TXC_DMA_MAXBURST)
#define	SetTxMaxBurst_DMA23_Addr	mpeval(TXC_DMA23_BASE + TXC_DMA_MAXBURST)


#define TXC_PKT_XMIT         		0x038 
#define TXC_PKT_XMIT_Addr		mpeval(TXC_FZC_BASE + TXC_PKT_XMIT)
#define	TXC_PKT_XMIT_Mask		0xffff		/* bit[15:0] */

#define	port_offset		0		/* port_offset = 256*i; */
#define TXC_PORT0_DMA_ENBALE    0x028
#define TXC_PORT1_DMA_ENBALE    0x128 		/* PORT1_DMA_list */
#define SetPort0TxDMAActive_Addr	mpeval(TXC_FZC_BASE+ (TXC_PORT0_DMA_ENBALE +  port_offset))
#define SetPort1TxDMAActive_Addr	mpeval(TXC_FZC_BASE+ (TXC_PORT1_DMA_ENBALE +  port_offset))
/* #define	SetTxDMAActive_list	0x00ffffff		For All Channels */
/* #define	TxDmaActive_list	00ffffff		For All Channels */
#define	SetTxMaxBurst_Data	0x500
#define	TxMaxBurst_Data		500

#define RX_LOG_MASK1_START_Addr		mpeval(FZC_DMC_ADDRESS_RANGE+0x20008)
#define RX_LOG_VAL1_START_Addr		mpeval(FZC_DMC_ADDRESS_RANGE+0x20010)
#define RX_LOG_MASK2_START_Addr		mpeval(FZC_DMC_ADDRESS_RANGE+0x20018)
#define RX_LOG_VAL2_START_Addr		mpeval(FZC_DMC_ADDRESS_RANGE+0x20020)
#define RX_LOG_RELO1_START_Addr		mpeval(FZC_DMC_ADDRESS_RANGE+0x20028)
#define RX_LOG_RELO2_START_Addr		mpeval(FZC_DMC_ADDRESS_RANGE+0x20030)
#define RBR_CFIG_A_Addr			mpeval(DMC_ADDRESS_RANGE+0x00010)
#define RBR_CFIG_B_Addr			mpeval(DMC_ADDRESS_RANGE+0x00018)
#define RXDMA_CFIG1_Addr		mpeval(DMC_ADDRESS_RANGE+0x00000)
#define RXDMA_CFIG2_Addr		mpeval(DMC_ADDRESS_RANGE+0x00008)
#define RXDMA_CFIG2_START_Addr		mpeval(DMC_ADDRESS_RANGE+0x00008)
#define RXDMA_CFIG1_START_Addr		mpeval(DMC_ADDRESS_RANGE+0x00000)
#define RXDMA_CFIG1_Addr		mpeval(DMC_ADDRESS_RANGE+0x00000)
#define RXDMA_CFIG2_Addr		mpeval(DMC_ADDRESS_RANGE+0x00008)
#define RBR_KICK_Addr			mpeval(DMC_ADDRESS_RANGE+0x00020)
#define ZCP_RDC_TBL_Addr		mpeval(FZC_ZCP_ADDRESS_RANGE + 0x10000)
#define RX_LOG_PAGE_VLD_Addr		mpeval(FZC_DMC_ADDRESS_RANGE+0x20000)
#define RCR_CFIG_A_Addr			mpeval(DMC_ADDRESS_RANGE+0x00040)

#define PCS0_BASE       		mpeval(MAC_ADDRESS_RANGE + PCS_0_RANGE)
#define PCS1_BASE       		mpeval(MAC_ADDRESS_RANGE + PCS_1_RANGE)
#define PCS_CONFIGURATION               mpeval(0x010 << 1)
#define PCS_DATAPATH_MODE               mpeval(0x050 << 1)

#define	PCS0_CONFIGURATION_Addr		mpeval(PCS0_BASE + PCS_CONFIGURATION)
#define	PCS0_DATAPATH_MODE_Addr		mpeval(PCS0_BASE + PCS_DATAPATH_MODE)
#define	PCS1_CONFIGURATION_Addr		mpeval(PCS1_BASE + PCS_CONFIGURATION)
#define	PCS1_DATAPATH_MODE_Addr		mpeval(PCS1_BASE + PCS_DATAPATH_MODE)

/*  04/25/05 ***/

#ifndef NIU_RX_PKT_LEN               
#define NIU_RX_PKT_LEN          60   		/* 64B packet */
#endif

#ifndef NIU_TX_PKT_LEN_P0            
#define NIU_TX_PKT_LEN_P0       40   		/* 64B packet */
#endif

#ifndef NIU_TX_PKT_LEN_P1            
#define NIU_TX_PKT_LEN_P1       64   		/* 70B packet */
#endif

#ifndef MAC_SPEED0                   
#define MAC_SPEED0              10000		/* Default to 10G speed for Port-0 */
#endif

#ifndef MAC_SPEED1                   
#define MAC_SPEED1              10000		/* Default to 10G speed for Port-1 */
#endif

#define	mac_config_10000		0x01000701
#define	mac_config_1000			0x6D000600	/* 0x6D800600 */
#define	mac_config_1000_pcs_serdes	0x0D000600	/* 0x09000600 */

#ifdef MAC_ER_CK_EN
#define	data11		0x0
#else
#define	data11		0x800          /* data[11] = check_cmd(cmd, MAC_ER_CK_EN) ? 0 : 1; */
#endif

#if (MAC_SPEED0==10000)
#define	mac0_config_data	mpeval(mac_config_10000 | data11)
#endif /* (MAC_SPEED0==10000) */        

#if (MAC_SPEED0==1000)
#ifdef PCS_SERDES
#define	mac0_config_data	mpeval(mac_config_1000_pcs_serdes | data11)
#else
#define	mac0_config_data	mpeval(mac_config_1000 | data11)
#endif 
#endif /* (MAC_SPEED0==1000) */ 

#if (MAC_SPEED1==10000)
#define mac1_config_data        mpeval(mac_config_10000 | data11)
#endif /* (MAC_SPEED1==10000) */
        
#if (MAC_SPEED1==1000)
#ifdef PCS_SERDES
#define mac1_config_data        mpeval(mac_config_1000_pcs_serdes | data11)
#else   
#define mac1_config_data        mpeval(mac_config_1000 | data11)
#endif  
#endif /* (MAC_SPEED1==1000) */

#ifndef TX_PKT_LEN
#define TX_PKT_LEN      34      /* Default to 64Bytes */
#endif

#ifndef HTRAP_NIU_TX_PKT_LEN
#define HTRAP_NIU_TX_PKT_LEN      34      /* Packet_len for ISR : Default to 64Bytes */
#endif

#ifndef HTRAP_NIU_TX_PKT_CNT
#define HTRAP_NIU_TX_PKT_CNT      0x10      /* Packet Count for IST : Default to 16 packets; */
#endif

#ifndef NIU_TX_PKT_CNT
#define NIU_TX_PKT_CNT      0x10      /* Default to 16 packets; in IOS (random() % 16); */
#endif

/* #ifdef TX_PKT_SIZE_SWEEP */
#ifndef TX_PKT_INCR
#define TX_PKT_INCR     0       /* Byte increment = 0 */
#endif
/* #endif */

#ifndef NO_OF_TX_DMA
#define NO_OF_TX_DMA    1       /* Default to 1 DMA channel only */
#endif

#ifdef DESC_START_ADDR
#define DESC_START_ADDR         0x400000        /* Need to update with Random within the range */
#endif

#ifndef TXQ_RNG_BUFFSZ
#define TXQ_RNG_BUFFSZ          0xf             /* Default to 16 */
#endif

#ifndef TX_KICK_INTERVAL
#define TX_KICK_INTERVAL        TX_PKT_CNT      /* Kick after last packet */
#endif

#ifndef MAC_ID
#define MAC_ID          0       /* Default to MAC_ID = 0 */
#endif

#ifndef	HTRAP_NIU_MAC_PKT_LEN
#define	HTRAP_NIU_MAC_PKT_LEN	0x40	/* Packet Length for ISR : Default packet size = 64 */
#endif

#ifndef	MAC_PKT_LEN
#define	MAC_PKT_LEN	0x40	/* Default packet size = 64 */
#endif

#ifndef	HTRAP_NIU_RXMAC_PKTCNT
#define	HTRAP_NIU_RXMAC_PKTCNT	0x1	/* Packet count for ISR : default no. of Packets to receive = 1 */
#endif

#ifndef	RXMAC_PKTCNT
#define	RXMAC_PKTCNT	0x1	/* default no. of Packets to receive = 1 */
#endif

#ifndef RXDMA_CHNL
#define	RXDMA_CHNL	0x0
#endif


#ifndef	RX_BLKSZ
#define	RX_BLKSZ	32		/* lowest value = 4 */
#endif

#ifndef	RX_BUF_SIZ0
#define	RX_BUF_SIZ0	2048		/* lowest value = 256 */
#endif

#ifndef	RX_BUF_SIZ1
#define	RX_BUF_SIZ1	8192		/* lowest value = 1024 */
#endif

#ifndef	RX_BUF_SIZ2
#define	RX_BUF_SIZ2	16384		/* lowest value = 2048 */
#endif

#ifndef	VLD0
#define	VLD0	1
#endif

#ifndef	VLD1
#define	VLD1	1
#endif

#ifndef	VLD2
#define	VLD2	1
#endif

#if (RX_BLKSZ==4)
#define	rbr_config_B_data_25_24		0x0
#endif

#if (RX_BLKSZ==8)
#define	rbr_config_B_data_25_24		0x1000000
#endif

#if (RX_BLKSZ==16)
#define	rbr_config_B_data_25_24		0x2000000
#endif

#if (RX_BLKSZ==32)
#define	rbr_config_B_data_25_24		0x3000000
#endif

#if (RX_BUF_SIZ2==2048)
#define	rbr_config_B_data_17_16		0x0
#endif

#if (RX_BUF_SIZ2==4096)
#define	rbr_config_B_data_17_16		0x10000
#endif

#if (RX_BUF_SIZ2==8192)
#define	rbr_config_B_data_17_16		0x20000
#endif

#if (RX_BUF_SIZ2==16384)
#define	rbr_config_B_data_17_16		0x30000
#endif

#if (RX_BUF_SIZ1==1024)
#define	rbr_config_B_data_9_8		0x0
#endif

#if (RX_BUF_SIZ1==2048)
#define	rbr_config_B_data_9_8		0x100
#endif

#if (RX_BUF_SIZ1==4096)
#define	rbr_config_B_data_9_8		0x200
#endif

#if (RX_BUF_SIZ1==8192)
#define	rbr_config_B_data_9_8		0x300
#endif

#if (RX_BUF_SIZ0==256)
#define	rbr_config_B_data_1_0		0x0
#endif

#if (RX_BUF_SIZ0==512)
#define	rbr_config_B_data_1_0		0x1
#endif

#if (RX_BUF_SIZ0==1024)
#define	rbr_config_B_data_1_0		0x2
#endif

#if (RX_BUF_SIZ0==2048)
#define	rbr_config_B_data_1_0		0x3
#endif

#define		RBR_CONFIG_B_DATA	mpeval(	rbr_config_B_data_25_24 + \
					       (VLD2 << 23) +		  \
					       	rbr_config_B_data_17_16 + \
					       (VLD1 << 15) +		  \
					       	rbr_config_B_data_9_8 +   \
					       (VLD0 << 7) +		  \
					       	rbr_config_B_data_1_0 , 16)
#ifndef	RBR_CONFIG_B_DATA_UE
#define	RBR_CONFIG_B_DATA_UE  80
#endif

#ifndef	RX_COMPL_RING_LEN
#define	RX_COMPL_RING_LEN	0x2000
#endif

#ifndef	RX_RING_START_ADDRESS
#define	RX_RING_START_ADDRESS	0x0
#endif

#ifndef	RX_INITIAL_KICK
#define	RX_INITIAL_KICK		0xff
#endif

#ifndef	RX_DESC_RING_LENGTH
#define	RX_DESC_RING_LENGTH	0x1fff
#endif

#ifndef	RX_NIU_MULTI_DMA
#define	RX_NIU_MULTI_DMA 0
#endif

#ifndef TX_NIU_MULTI_DMA
#define TX_NIU_MULTI_DMA 0x0
#endif

#ifndef	NIU_TX_DMA_NUM
#define	NIU_TX_DMA_NUM	0
#endif

#define NIU_TxDmaNo	NIU_TX_DMA_NUM

#ifndef NIU_TX_DMA_ACT_LIST
#define NIU_TX_DMA_ACT_LIST	1
#endif

#define	SetTxDMAActive_list	NIU_TX_DMA_ACT_LIST

#if (NIU_TX_DMA_NUM==0)
#define NIU_TxDmaNoUE	0
#define	TxDmaActive_list	1
#endif

#if (NIU_TX_DMA_NUM==1)
#define NIU_TxDmaNoUE	1
#define	TxDmaActive_list	2
#endif

#if (NIU_TX_DMA_NUM==2)
#define NIU_TxDmaNoUE	2
#define	TxDmaActive_list	4
#endif

#if (NIU_TX_DMA_NUM==3)
#define NIU_TxDmaNoUE	3
#define	TxDmaActive_list	8
#endif

#if (NIU_TX_DMA_NUM==4)
#define NIU_TxDmaNoUE	4
#define	TxDmaActive_list	10
#endif

#if (NIU_TX_DMA_NUM==5)
#define NIU_TxDmaNoUE	5
#define	TxDmaActive_list	20
#endif

#if (NIU_TX_DMA_NUM==6)
#define NIU_TxDmaNoUE	6
#define	TxDmaActive_list	40
#endif

#if (NIU_TX_DMA_NUM==7)
#define NIU_TxDmaNoUE	7
#define	TxDmaActive_list	80
#endif

#if (NIU_TX_DMA_NUM==8)
#define NIU_TxDmaNoUE	8
#define	TxDmaActive_list	100
#endif

#if (NIU_TX_DMA_NUM==9)
#define NIU_TxDmaNoUE	9
#define	TxDmaActive_list	200
#endif

#if (NIU_TX_DMA_NUM==10)
#define NIU_TxDmaNoUE	a
#define	TxDmaActive_list	400
#endif

#if (NIU_TX_DMA_NUM==11)
#define NIU_TxDmaNoUE	b
#define	TxDmaActive_list	800
#endif

#if (NIU_TX_DMA_NUM==12)
#define NIU_TxDmaNoUE	c
#define	TxDmaActive_list	1000
#endif

#if (NIU_TX_DMA_NUM==13)
#define NIU_TxDmaNoUE	d
#define	TxDmaActive_list	2000
#endif

#if (NIU_TX_DMA_NUM==14)
#define NIU_TxDmaNoUE	e
#define	TxDmaActive_list	4000
#endif

#if (NIU_TX_DMA_NUM==15)
#define NIU_TxDmaNoUE	f
#define	TxDmaActive_list	8000
#endif

#if (NIU_TX_DMA_NUM==16)
#define NIU_TxDmaNoUE	10
#define	TxDmaActive_list	10000
#endif

#if (NIU_TX_DMA_NUM==17)
#define NIU_TxDmaNoUE	11
#define	TxDmaActive_list	20000
#endif

#if (NIU_TX_DMA_NUM==18)
#define NIU_TxDmaNoUE	12
#define	TxDmaActive_list	40000
#endif

#if (NIU_TX_DMA_NUM==19)
#define NIU_TxDmaNoUE	13
#define	TxDmaActive_list	80000
#endif

#if (NIU_TX_DMA_NUM==20)
#define NIU_TxDmaNoUE	14
#define	TxDmaActive_list	100000
#endif

#if (NIU_TX_DMA_NUM==21)
#define NIU_TxDmaNoUE	15
#define	TxDmaActive_list	200000
#endif

#if (NIU_TX_DMA_NUM==22)
#define NIU_TxDmaNoUE	16
#define	TxDmaActive_list	400000
#endif

#if (NIU_TX_DMA_NUM==23)
#define NIU_TxDmaNoUE   17
#define	TxDmaActive_list	800000
#endif


/* ------------------------------------------------------- */
/* NIU Tx Packet Types					   */
/* ------------------------------------------------------- */
#define DELTA			0x13

#define CL_IP                   0x7
#define CL_UDP                  0xd
#define CL_TCP                  0x10
#define CL_IP_V6                0x1a		/* mpeval(DELTA + CL_IP) */
#define CL_UDP_IP_V6            0x20		/* mpeval(DELTA + CL_UDP) */
#define CL_TCP_IP_V6            0x23		/* mpeval(DELTA + CL_TCP) */


#ifndef VLAN
#define VLAN	0
#endif

#ifndef LLC
#define LLC	0
#endif

#ifndef IP_VER
#define IP_VER	4
#endif

#ifndef UDP
#define UDP	0
#endif

#ifndef TCP
#define TCP	0
#endif

#ifndef IP
#define IP	1
#endif

#if (IP_VER == 4)
#if (LLC == 0) && (VLAN == 0) 
#define	FRAME_TYPE	0x2
#endif

#if (LLC == 0) && (VLAN == 1) 
#define	FRAME_TYPE	0x6
#endif

#if (LLC == 1) && (VLAN == 0) 
#define	FRAME_TYPE	0x3
#endif

#if (LLC == 1) && (VLAN == 1) 
#define	FRAME_TYPE	0x7
#endif

#if (IP == 1)
#define	FRAME_CLASS	CL_IP
#endif

#if (UDP == 1)
#define	FRAME_CLASS	CL_UDP
#endif

#if (TCP == 1)
#define	FRAME_CLASS	CL_TCP
#endif

#else /* IP_VER == 6 */

#if (LLC == 0) && (VLAN == 0) 
#define	FRAME_TYPE	0xa
#endif

#if (LLC == 0) && (VLAN == 1) 
#define	FRAME_TYPE	0xe
#endif

#if (LLC == 1) && (VLAN == 0) 
#define	FRAME_TYPE	0xb
#endif

#if (LLC == 1) && (VLAN == 1) 
#define	FRAME_TYPE	0xf
#endif

#if (IP == 1)
#define	FRAME_CLASS	CL_IP_V6
#endif

#if (UDP == 1)
#define	FRAME_CLASS	CL_UDP_IP_V6
#endif

#if (TCP == 1)
#define	FRAME_CLASS	CL_TCP_IP_V6
#endif

#endif

/* ------------------------------------------------------- */

#ifdef	XLATE_ON
#define	NIU_Xlate_On 1
#else
#define	NIU_Xlate_On 0
#endif

/* ------------------------------------------------------- */

#include "../../../env/fc/vera/include/niu_pktgen_csr_ev2a.vrh"
