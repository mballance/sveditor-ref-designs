/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: FcNiuBasicTx.p0.xpcs.lback.cmp.NO_EV.NO_FC.s
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

/**********************************************************************************************/
#define POLL_DELAY_VALUE            0xc00           /* 0x1000=4096; 0x800=2048; 0x400=1024; 0x200=512 */

#define addr_MIF_CONFIG                  mpeval(0x8100196020)     /*   1 */ 
#define addr_MIF_FRAME_OUTPUT_REG        mpeval(0x8100196018)     /*   2 */ 
#define addr_XMAC_0_CONFIG               mpeval(0x8100180060)     /*  44 */ 
#define addr_XMAC_0_TxSftRst             mpeval(0x8100180000)     /*  45 */ 
#define addr_XMAC_0_RxSftRst             mpeval(0x8100180008)     /*  46 */ 
#define addr_XMAC_0_RxMac_Hist_Cnt1      mpeval(0x8100180120)     /*  47 */ 
#define addr_XMAC_0_RxMac_Hist_Cnt2      mpeval(0x8100180128)     /*  48 */ 
#define addr_XMAC_0_RxMac_Hist_Cnt3      mpeval(0x8100180130)     /*  49 */ 
#define addr_XMAC_0_RxMac_Hist_Cnt4      mpeval(0x8100180138)     /*  50 */ 
#define addr_XMAC_0_RxMac_Hist_Cnt5      mpeval(0x8100180140)     /*  51 */ 
#define addr_XMAC_0_RxMac_Hist_Cnt6      mpeval(0x8100180148)     /*  52 */ 
#define addr_XMAC_0_RxMac_Hist_Cnt7      mpeval(0x8100180188)     /*  53 */ 
#define addr_XMAC_0_BASE10G_CONTROL1     mpeval(0x8100182000)     /*  55 */ 
#define addr_XMAC_1_BASE10G_CONTROL1     mpeval(0x8100188000)     /*  56 */ 
#define addr_IPP_CFIG_0                  mpeval(0x8100280000)     /*  57 */ 
#define addr_TXC_CONTROL                 mpeval(0x81007a0000)     /*  58 */ 
#define addr_RDC_TaBLe                   mpeval(0x8100590000)     /*  60 */ 
#define addr_RBR_CFIG_B_0                mpeval(0x8100600018)     /*  61 */ 
#define addr_RX_LOG_MASK1_0              mpeval(0x81006a0008)     /*  62 */ 
#define addr_RX_LOG_VAL1_0               mpeval(0x81006a0010)     /*  63 */ 
#define addr_RX_LOG_PAGE_RELO1_0         mpeval(0x81006a0028)     /*  64 */ 
#define addr_RX_LOG_MASK2_0              mpeval(0x81006a0018)     /*  65 */ 
#define addr_RX_LOG_VAL2_0               mpeval(0x81006a0020)     /*  66 */ 
#define addr_RX_LOG_PAGE_RELO2_0         mpeval(0x81006a0030)     /*  67 */ 
#define addr_RX_LOG_PAGE_VLD_0           mpeval(0x81006a0000)     /*  68 */ 
#define addr_RBR_CFIG_A_0                mpeval(0x8100600010)     /*  69 */ 
#define addr_RCRCFIG_A_0                 mpeval(0x8100600040)     /*  70 */ 
#define addr_RXDMA_CFIG1_0               mpeval(0x8100600000)     /*  71 */ 
#define addr_RXDMA_CFIG2_0               mpeval(0x8100600008)     /*  72 */ 
#define addr_RED_RANdom_INIT             mpeval(0x8100680068)     /*  74 */ 
#define addr_RDC_RED_PARAmeter_0         mpeval(0x81006b0000)     /*  75 */ 
#define addr_RBR_KICK_0                  mpeval(0x8100600020)     /*  76 */ 
#define addr_XMAC_0_ADDR3_da             mpeval(0x8100180218)     /*  77 */ 
#define addr_XMAC_0_ADDR4_da             mpeval(0x8100180220)     /*  78 */ 
#define addr_XMAC_0_ADDR5_da             mpeval(0x8100180228)     /*  79 */ 
#define addr_TXC_PORT_DMA_enable         mpeval(0x81007a0028)     /*  81 */ 
#define addr_TX_LOG_PAGE_VLD_0           mpeval(0x81006c0000)     /*  82 */ 
#define addr_TX_LOG_MASK1_0              mpeval(0x81006c0008)     /*  83 */ 
#define addr_TXC_DMA_MAX_burst_0         mpeval(0x8100780000)     /*  84 */ 
#define addr_TX_LOG_PAGE_VLD_1           mpeval(0x81006c0200)     /*  85 */ 
#define addr_TX_LOG_MASK1_1              mpeval(0x81006c0208)     /*  86 */ 
#define addr_TXC_DMA_MAX_burst_1         mpeval(0x8100781000)     /*  87 */ 
#define addr_TX_LOG_PAGE_VLD_2           mpeval(0x81006c0400)     /*  88 */ 
#define addr_TX_LOG_MASK1_2              mpeval(0x81006c0408)     /*  89 */ 
#define addr_TXC_DMA_MAX_burst_2         mpeval(0x8100782000)     /*  90 */ 
#define addr_TX_LOG_PAGE_VLD_3           mpeval(0x81006c0600)     /*  91 */ 
#define addr_TX_LOG_MASK1_3              mpeval(0x81006c0608)     /*  92 */ 
#define addr_TXC_DMA_MAX_burst_3         mpeval(0x8100783000)     /*  93 */ 
#define addr_TX_LOG_PAGE_VLD_4           mpeval(0x81006c0800)     /*  94 */ 
#define addr_TX_LOG_MASK1_4              mpeval(0x81006c0808)     /*  95 */ 
#define addr_TXC_DMA_MAX_burst_4         mpeval(0x8100784000)     /*  96 */ 
#define addr_TX_LOG_PAGE_VLD_5           mpeval(0x81006c0a00)     /*  97 */ 
#define addr_TX_LOG_MASK1_5              mpeval(0x81006c0a08)     /*  98 */ 
#define addr_TXC_DMA_MAX_burst_5         mpeval(0x8100785000)     /*  99 */ 
#define addr_TX_LOG_PAGE_VLD_6           mpeval(0x81006c0c00)     /* 100 */ 
#define addr_TX_LOG_MASK1_6              mpeval(0x81006c0c08)     /* 101 */ 
#define addr_TXC_DMA_MAX_burst_6         mpeval(0x8100786000)     /* 102 */ 
#define addr_TX_LOG_PAGE_VLD_7           mpeval(0x81006c0e00)     /* 103 */ 
#define addr_TX_LOG_MASK1_7              mpeval(0x81006c0e08)     /* 104 */ 
#define addr_TXC_DMA_MAX_burst_7         mpeval(0x8100787000)     /* 105 */ 
#define addr_TX_LOG_PAGE_VLD_8           mpeval(0x81006c1000)     /* 106 */ 
#define addr_TX_LOG_MASK1_8              mpeval(0x81006c1008)     /* 107 */ 
#define addr_TXC_DMA_MAX_burst_8         mpeval(0x8100788000)     /* 108 */ 
#define addr_TX_LOG_PAGE_VLD_9           mpeval(0x81006c1200)     /* 109 */ 
#define addr_TX_LOG_MASK1_9              mpeval(0x81006c1208)     /* 110 */ 
#define addr_TXC_DMA_MAX_burst_9         mpeval(0x8100789000)     /* 111 */ 
#define addr_TX_LOG_PAGE_VLD_a           mpeval(0x81006c1400)     /* 112 */ 
#define addr_TX_LOG_MASK1_a              mpeval(0x81006c1408)     /* 113 */ 
#define addr_TXC_DMA_MAX_burst_a         mpeval(0x810078a000)     /* 114 */ 
#define addr_TX_LOG_PAGE_VLD_b           mpeval(0x81006c1600)     /* 115 */ 
#define addr_TX_LOG_MASK1_b              mpeval(0x81006c1608)     /* 116 */ 
#define addr_TXC_DMA_MAX_burst_b         mpeval(0x810078b000)     /* 117 */ 
#define addr_TX_LOG_PAGE_VLD_c           mpeval(0x81006c1800)     /* 118 */ 
#define addr_TX_LOG_MASK1_c              mpeval(0x81006c1808)     /* 119 */ 
#define addr_TXC_DMA_MAX_burst_c         mpeval(0x810078c000)     /* 120 */ 
#define addr_TX_LOG_PAGE_VLD_d           mpeval(0x81006c1a00)     /* 121 */ 
#define addr_TX_LOG_MASK1_d              mpeval(0x81006c1a08)     /* 122 */ 
#define addr_TXC_DMA_MAX_burst_d         mpeval(0x810078d000)     /* 123 */ 
#define addr_TX_LOG_PAGE_VLD_e           mpeval(0x81006c1c00)     /* 124 */ 
#define addr_TX_LOG_MASK1_e              mpeval(0x81006c1c08)     /* 125 */ 
#define addr_TXC_DMA_MAX_burst_e         mpeval(0x810078e000)     /* 126 */ 
#define addr_TX_LOG_PAGE_VLD_f           mpeval(0x81006c1e00)     /* 127 */ 
#define addr_TX_LOG_MASK1_f              mpeval(0x81006c1e08)     /* 128 */ 
#define addr_TXC_DMA_MAX_burst_f         mpeval(0x810078f000)     /* 129 */ 
#define addr_TX_RNG_CFIG_0               mpeval(0x8100640000)     /* 130 */ 
#define addr_TX_RING_KICK_0              mpeval(0x8100640018)     /* 131 */ 
#define addr_TX_CS_0                     mpeval(0x8100640028)     /* 132 */ 

#define data_xpcs0_init_001         0x0000000000008008    /* MIF_CONFIG                     */ /*   1 */ 
#define data_xpcs0_init_002         0x00000000007a8000    /* MIF_FRAME_OUTPUT_REG           */ /*   2 */ 
#define data_xpcs0_init_003         0x00000000107a0003    /* MIF_FRAME_OUTPUT_REG           */ /*   3 */ 
#define data_xpcs0_init_004         0x00000000007a8000    /* MIF_FRAME_OUTPUT_REG           */ /*   4 */ 
#define data_xpcs0_init_005         0x00000000207a0003    /* MIF_FRAME_OUTPUT_REG           */ /*   5 */ 
#define data_xpcs0_init_006         0x00000000007a8001    /* MIF_FRAME_OUTPUT_REG           */ /*   6 */ 
#define data_xpcs0_init_007         0x00000000107a0000    /* MIF_FRAME_OUTPUT_REG           */ /*   7 */ 
#define data_xpcs0_init_008         0x00000000007a8004    /* MIF_FRAME_OUTPUT_REG           */ /*   8 */ 
#define data_xpcs0_init_009         0x00000000107a0000    /* MIF_FRAME_OUTPUT_REG           */ /*   9 */ 
#define data_xpcs0_init_010         0x00000000007a8005    /* MIF_FRAME_OUTPUT_REG           */ /*  10 */ 
#define data_xpcs0_init_011         0x00000000107a0000    /* MIF_FRAME_OUTPUT_REG           */ /*  11 */ 
#define data_xpcs0_init_012         0x00000000007a8100    /* MIF_FRAME_OUTPUT_REG           */ /*  12 */ 
#define data_xpcs0_init_013         0x00000000107a0001    /* MIF_FRAME_OUTPUT_REG           */ /*  13 */ 
#define data_xpcs0_init_014         0x00000000007a8101    /* MIF_FRAME_OUTPUT_REG           */ /*  14 */ 
#define data_xpcs0_init_015         0x00000000107a0000    /* MIF_FRAME_OUTPUT_REG           */ /*  15 */ 
#define data_xpcs0_init_016         0x00000000007a8104    /* MIF_FRAME_OUTPUT_REG           */ /*  16 */ 
#define data_xpcs0_init_017         0x00000000107a0001    /* MIF_FRAME_OUTPUT_REG           */ /*  17 */ 
#define data_xpcs0_init_018         0x00000000007a8105    /* MIF_FRAME_OUTPUT_REG           */ /*  18 */ 
#define data_xpcs0_init_019         0x00000000107a0000    /* MIF_FRAME_OUTPUT_REG           */ /*  19 */ 
#define data_xpcs0_init_020         0x00000000007a8108    /* MIF_FRAME_OUTPUT_REG           */ /*  20 */ 
#define data_xpcs0_init_021         0x00000000107a0001    /* MIF_FRAME_OUTPUT_REG           */ /*  21 */ 
#define data_xpcs0_init_022         0x00000000007a8109    /* MIF_FRAME_OUTPUT_REG           */ /*  22 */ 
#define data_xpcs0_init_023         0x00000000107a0000    /* MIF_FRAME_OUTPUT_REG           */ /*  23 */ 
#define data_xpcs0_init_024         0x00000000007a810c    /* MIF_FRAME_OUTPUT_REG           */ /*  24 */ 
#define data_xpcs0_init_025         0x00000000107a0001    /* MIF_FRAME_OUTPUT_REG           */ /*  25 */ 
#define data_xpcs0_init_026         0x00000000007a810d    /* MIF_FRAME_OUTPUT_REG           */ /*  26 */ 
#define data_xpcs0_init_027         0x00000000107a0000    /* MIF_FRAME_OUTPUT_REG           */ /*  27 */ 
#define data_xpcs0_init_028         0x00000000007a8120    /* MIF_FRAME_OUTPUT_REG           */ /*  28 */ 
#define data_xpcs0_init_029         0x00000000107a5001    /* MIF_FRAME_OUTPUT_REG           */ /*  29 */ 
#define data_xpcs0_init_030         0x00000000007a8121    /* MIF_FRAME_OUTPUT_REG           */ /*  30 */ 
#define data_xpcs0_init_031         0x00000000107a0008    /* MIF_FRAME_OUTPUT_REG           */ /*  31 */ 
#define data_xpcs0_init_032         0x00000000007a8124    /* MIF_FRAME_OUTPUT_REG           */ /*  32 */ 
#define data_xpcs0_init_033         0x00000000107a5001    /* MIF_FRAME_OUTPUT_REG           */ /*  33 */ 
#define data_xpcs0_init_034         0x00000000007a8125    /* MIF_FRAME_OUTPUT_REG           */ /*  34 */ 
#define data_xpcs0_init_035         0x00000000107a0008    /* MIF_FRAME_OUTPUT_REG           */ /*  35 */ 
#define data_xpcs0_init_036         0x00000000007a8128    /* MIF_FRAME_OUTPUT_REG           */ /*  36 */ 
#define data_xpcs0_init_037         0x00000000107a5001    /* MIF_FRAME_OUTPUT_REG           */ /*  37 */ 
#define data_xpcs0_init_038         0x00000000007a8129    /* MIF_FRAME_OUTPUT_REG           */ /*  38 */ 
#define data_xpcs0_init_039         0x00000000107a0008    /* MIF_FRAME_OUTPUT_REG           */ /*  39 */ 
#define data_xpcs0_init_040         0x00000000007a812c    /* MIF_FRAME_OUTPUT_REG           */ /*  40 */ 
#define data_xpcs0_init_041         0x00000000107a5001    /* MIF_FRAME_OUTPUT_REG           */ /*  41 */ 
#define data_xpcs0_init_042         0x00000000007a812d    /* MIF_FRAME_OUTPUT_REG           */ /*  42 */ 
#define data_xpcs0_init_043         0x00000000107a0008    /* MIF_FRAME_OUTPUT_REG           */ /*  43 */ 
#define data_xpcs0_init_044         0x0000000001000e04    /* XMAC_0_CONFIG                  */ /*  44 */ 
#define data_xpcs0_init_045         0x0000000000000001    /* XMAC_0_TxSftRst                */ /*  45 */ 
#define data_xpcs0_init_046         0x0000000000000001    /* XMAC_0_RxSftRst                */ /*  46 */ 
#define data_xpcs0_init_047         0x0000000000000000    /* XMAC_0_RxMac_Hist_Cnt1         */ /*  47 */ 
#define data_xpcs0_init_048         0x0000000000000000    /* XMAC_0_RxMac_Hist_Cnt2         */ /*  48 */ 
#define data_xpcs0_init_049         0x0000000000000000    /* XMAC_0_RxMac_Hist_Cnt3         */ /*  49 */ 
#define data_xpcs0_init_050         0x0000000000000000    /* XMAC_0_RxMac_Hist_Cnt4         */ /*  50 */ 
#define data_xpcs0_init_051         0x0000000000000000    /* XMAC_0_RxMac_Hist_Cnt5         */ /*  51 */ 
#define data_xpcs0_init_052         0x0000000000000000    /* XMAC_0_RxMac_Hist_Cnt6         */ /*  52 */ 
#define data_xpcs0_init_053         0x0000000000000000    /* XMAC_0_RxMac_Hist_Cnt7         */ /*  53 */ 
#define data_xpcs0_init_054         0x0000000001000f05    /* XMAC_0_CONFIG                  */ /*  54 */ 
#define data_xpcs0_init_055         0x0000000000008000    /* XMAC_0_BASE10G_CONTROL1        */ /*  55 */ 
#define data_xpcs0_init_056         0x0000000000008000    /* XMAC_1_BASE10G_CONTROL1        */ /*  56 */ 
#define data_xpcs0_init_057         0x0000000001ffff11    /* IPP_CFIG_0                     */ /*  57 */ 
#define data_xpcs0_init_058         0x000000000000001f    /* TXC_CONTROL                    */ /*  58 */ 
#define data_xpcs0_init_059         0x0000000000006040    /* XMAC_0_BASE10G_CONTROL1        */ /*  59 */ 
#define data_xpcs0_init_060         0x0000000000000000    /* RDC_TaBLe                      */ /*  60 */ 
#define data_xpcs0_init_061         0x0000000000808080    /* RBR_CFIG_B_0                   */ /*  61 */ 
#define data_xpcs0_init_062         0x00000000fffffc00    /* RX_LOG_MASK1_0                 */ /*  62 */ 
#define data_xpcs0_init_063         0x00000000043fe000    /* RX_LOG_VAL1_0                  */ /*  63 */ 
#define data_xpcs0_init_064         0x00000000001a6800    /* RX_LOG_PAGE_RELO1_0            */ /*  64 */ 
#define data_xpcs0_init_065         0x00000000fffffc00    /* RX_LOG_MASK2_0                 */ /*  65 */ 
#define data_xpcs0_init_066         0x00000000058d3800    /* RX_LOG_VAL2_0                  */ /*  66 */ 
#define data_xpcs0_init_067         0x0000000002003c00    /* RX_LOG_PAGE_RELO2_0            */ /*  67 */ 
#define data_xpcs0_init_068         0x0000000000000003    /* RX_LOG_PAGE_VLD_0              */ /*  68 */ 
#define data_xpcs0_init_069         0x01ff0043fe140000    /* RBR_CFIG_A_0                   */ /*  69 */ 
#define data_xpcs0_init_070         0x20000043fe200000    /* RCRCFIG_A_0                    */ /*  70 */ 
#define data_xpcs0_init_071         0x0000000000000043    /* RXDMA_CFIG1_0                  */ /*  71 */ 
#define data_xpcs0_init_072         0x00000000fe05cf40    /* RXDMA_CFIG2_0                  */ /*  72 */ 
#define data_xpcs0_init_073         0x0000000080000043    /* RXDMA_CFIG1_0                  */ /*  73 */ 
#define data_xpcs0_init_074         0x0000000000016512    /* RED_RANdom_INIT                */ /*  74 */ 
#define data_xpcs0_init_075         0x00000000fe00fe00    /* RDC_RED_PARAmeter_0            */ /*  75 */ 
#define data_xpcs0_init_076         0x00000000000000ff    /* RBR_KICK_0                     */ /*  76 */ 
#define data_xpcs0_init_077         0x0000000000000000    /* XMAC_0_ADDR3_da                */ /*  77 */ 
#define data_xpcs0_init_078         0x000000000000ffff    /* XMAC_0_ADDR4_da                */ /*  78 */ 
#define data_xpcs0_init_079         0x0000000000000100    /* XMAC_0_ADDR5_da                */ /*  79 */ 
#define data_xpcs0_init_080         0x0000000000000000    /* RDC_TaBLe                      */ /*  80 */ 
#define data_xpcs0_init_081         0x2b96ad2300000001    /* TXC_PORT_DMA_enable            */ /*  81 */ 
#define data_xpcs0_init_082         0x0000000000000001    /* TX_LOG_PAGE_VLD_0              */ /*  82 */ 
#define data_xpcs0_init_083         0x0000000000000000    /* TX_LOG_MASK1_0                 */ /*  83 */ 
#define data_xpcs0_init_084         0x00000000000001f4    /* TXC_DMA_MAX_burst_0            */ /*  84 */ 
#define data_xpcs0_init_085         0x0000000000000001    /* TX_LOG_PAGE_VLD_1              */ /*  85 */ 
#define data_xpcs0_init_086         0x0000000000000000    /* TX_LOG_MASK1_1                 */ /*  86 */ 
#define data_xpcs0_init_087         0x00000000000001f4    /* TXC_DMA_MAX_burst_1            */ /*  87 */ 
#define data_xpcs0_init_088         0x0000000000000001    /* TX_LOG_PAGE_VLD_2              */ /*  88 */ 
#define data_xpcs0_init_089         0x0000000000000000    /* TX_LOG_MASK1_2                 */ /*  89 */ 
#define data_xpcs0_init_090         0x00000000000001f4    /* TXC_DMA_MAX_burst_2            */ /*  90 */ 
#define data_xpcs0_init_091         0x0000000000000001    /* TX_LOG_PAGE_VLD_3              */ /*  91 */ 
#define data_xpcs0_init_092         0x0000000000000000    /* TX_LOG_MASK1_3                 */ /*  92 */ 
#define data_xpcs0_init_093         0x00000000000001f4    /* TXC_DMA_MAX_burst_3            */ /*  93 */ 
#define data_xpcs0_init_094         0x0000000000000001    /* TX_LOG_PAGE_VLD_4              */ /*  94 */ 
#define data_xpcs0_init_095         0x0000000000000000    /* TX_LOG_MASK1_4                 */ /*  95 */ 
#define data_xpcs0_init_096         0x00000000000001f4    /* TXC_DMA_MAX_burst_4            */ /*  96 */ 
#define data_xpcs0_init_097         0x0000000000000001    /* TX_LOG_PAGE_VLD_5              */ /*  97 */ 
#define data_xpcs0_init_098         0x0000000000000000    /* TX_LOG_MASK1_5                 */ /*  98 */ 
#define data_xpcs0_init_099         0x00000000000001f4    /* TXC_DMA_MAX_burst_5            */ /*  99 */ 
#define data_xpcs0_init_100         0x0000000000000001    /* TX_LOG_PAGE_VLD_6              */ /* 100 */ 
#define data_xpcs0_init_101         0x0000000000000000    /* TX_LOG_MASK1_6                 */ /* 101 */ 
#define data_xpcs0_init_102         0x00000000000001f4    /* TXC_DMA_MAX_burst_6            */ /* 102 */ 
#define data_xpcs0_init_103         0x0000000000000001    /* TX_LOG_PAGE_VLD_7              */ /* 103 */ 
#define data_xpcs0_init_104         0x0000000000000000    /* TX_LOG_MASK1_7                 */ /* 104 */ 
#define data_xpcs0_init_105         0x00000000000001f4    /* TXC_DMA_MAX_burst_7            */ /* 105 */ 
#define data_xpcs0_init_106         0x0000000000000001    /* TX_LOG_PAGE_VLD_8              */ /* 106 */ 
#define data_xpcs0_init_107         0x0000000000000000    /* TX_LOG_MASK1_8                 */ /* 107 */ 
#define data_xpcs0_init_108         0x00000000000001f4    /* TXC_DMA_MAX_burst_8            */ /* 108 */ 
#define data_xpcs0_init_109         0x0000000000000001    /* TX_LOG_PAGE_VLD_9              */ /* 109 */ 
#define data_xpcs0_init_110         0x0000000000000000    /* TX_LOG_MASK1_9                 */ /* 110 */ 
#define data_xpcs0_init_111         0x00000000000001f4    /* TXC_DMA_MAX_burst_9            */ /* 111 */ 
#define data_xpcs0_init_112         0x0000000000000001    /* TX_LOG_PAGE_VLD_a              */ /* 112 */ 
#define data_xpcs0_init_113         0x0000000000000000    /* TX_LOG_MASK1_a                 */ /* 113 */ 
#define data_xpcs0_init_114         0x00000000000001f4    /* TXC_DMA_MAX_burst_a            */ /* 114 */ 
#define data_xpcs0_init_115         0x0000000000000001    /* TX_LOG_PAGE_VLD_b              */ /* 115 */ 
#define data_xpcs0_init_116         0x0000000000000000    /* TX_LOG_MASK1_b                 */ /* 116 */ 
#define data_xpcs0_init_117         0x00000000000001f4    /* TXC_DMA_MAX_burst_b            */ /* 117 */ 
#define data_xpcs0_init_118         0x0000000000000001    /* TX_LOG_PAGE_VLD_c              */ /* 118 */ 
#define data_xpcs0_init_119         0x0000000000000000    /* TX_LOG_MASK1_c                 */ /* 119 */ 
#define data_xpcs0_init_120         0x00000000000001f4    /* TXC_DMA_MAX_burst_c            */ /* 120 */ 
#define data_xpcs0_init_121         0x0000000000000001    /* TX_LOG_PAGE_VLD_d              */ /* 121 */ 
#define data_xpcs0_init_122         0x0000000000000000    /* TX_LOG_MASK1_d                 */ /* 122 */ 
#define data_xpcs0_init_123         0x00000000000001f4    /* TXC_DMA_MAX_burst_d            */ /* 123 */ 
#define data_xpcs0_init_124         0x0000000000000001    /* TX_LOG_PAGE_VLD_e              */ /* 124 */ 
#define data_xpcs0_init_125         0x0000000000000000    /* TX_LOG_MASK1_e                 */ /* 125 */ 
#define data_xpcs0_init_126         0x00000000000001f4    /* TXC_DMA_MAX_burst_e            */ /* 126 */ 
#define data_xpcs0_init_127         0x0000000000000001    /* TX_LOG_PAGE_VLD_f              */ /* 127 */ 
#define data_xpcs0_init_128         0x0000000000000000    /* TX_LOG_MASK1_f                 */ /* 128 */ 
#define data_xpcs0_init_129         0x00000000000001f4    /* TXC_DMA_MAX_burst_f            */ /* 129 */ 
! #define data_xpcs0_init_130         0x0ffff0000000001c    /* TX_RNG_CFIG_0                  */ /* 130 */ 
#define data_xpcs0_init_130         0x0ffff00020000000    /* TX_RNG_CFIG_0                  */ /* 130 */ 
#define data_xpcs0_init_131         0x0007d08a8490000c    /* TX_RING_KICK_0                 */ /* 131 */ 
#define data_xpcs0_init_132         0x0000000000000000    /* TX_CS_0                        */ /* 132 */ 
/******************************************************************************************************/

/*********************************************** ***********************************************/
!#define addr_IPP_CFIG_0                  mpeval(IPP0_BASE + IPP_CONFIG)     /*dupli*/ 
#define addr_IPP_DFIFO_RD1_0             mpeval(IPP0_BASE + 0x00c0    )     /*   2 */ 
#define addr_IPP_DFIFO_RD2_0             mpeval(IPP0_BASE + 0x00c8    )     /*   3 */ 
#define addr_IPP_DFIFO_RD3_0             mpeval(IPP0_BASE + 0x00d0    )     /*   4 */ 
#define addr_IPP_DFIFO_RD4_0             mpeval(IPP0_BASE + 0x00d8    )     /*   5 */ 
#define addr_IPP_DFIFO_RD5_0             mpeval(IPP0_BASE + 0x00e0    )     /*   6 */ 
#define addr_IPP_DFIFO_WR1_0             mpeval(IPP0_BASE + 0x00e8    )     /*   7 */ 
#define addr_IPP_DFIFO_WR2_0             mpeval(IPP0_BASE + 0x00f0    )     /*   8 */ 
#define addr_IPP_DFIFO_WR3_0             mpeval(IPP0_BASE + 0x00f8    )     /*   9 */ 
#define addr_IPP_DFIFO_WR4_0             mpeval(IPP0_BASE + 0x0100    )     /*  10 */ 
#define addr_IPP_DFIFO_WR5_0             mpeval(IPP0_BASE + 0x0108    )     /*  11 */ 
#define addr_IPP_DFIFO_RD_PTR_0          mpeval(IPP0_BASE + 0x0110    )     /*  12 */ 
#define addr_IPP_DFIFO_WR_PTR_0          mpeval(IPP0_BASE + 0x0118    )     /*  13 */ 

#define addr_IPP_CFIG_1                  mpeval(IPP1_BASE + IPP_CONFIG)     /*   1 */ 
#define addr_IPP_DFIFO_RD1_1             mpeval(IPP1_BASE + 0x00c0    )     /*   2 */ 
#define addr_IPP_DFIFO_RD2_1             mpeval(IPP1_BASE + 0x00c8    )     /*   3 */ 
#define addr_IPP_DFIFO_RD3_1             mpeval(IPP1_BASE + 0x00d0    )     /*   4 */ 
#define addr_IPP_DFIFO_RD4_1             mpeval(IPP1_BASE + 0x00d8    )     /*   5 */ 
#define addr_IPP_DFIFO_RD5_1             mpeval(IPP1_BASE + 0x00e0    )     /*   6 */ 
#define addr_IPP_DFIFO_WR1_1             mpeval(IPP1_BASE + 0x00e8    )     /*   7 */ 
#define addr_IPP_DFIFO_WR2_1             mpeval(IPP1_BASE + 0x00f0    )     /*   8 */ 
#define addr_IPP_DFIFO_WR3_1             mpeval(IPP1_BASE + 0x00f8    )     /*   9 */ 
#define addr_IPP_DFIFO_WR4_1             mpeval(IPP1_BASE + 0x0100    )     /*  10 */ 
#define addr_IPP_DFIFO_WR5_1             mpeval(IPP1_BASE + 0x0108    )     /*  11 */ 
#define addr_IPP_DFIFO_RD_PTR_1          mpeval(IPP1_BASE + 0x0110    )     /*  12 */ 
#define addr_IPP_DFIFO_WR_PTR_1          mpeval(IPP1_BASE + 0x0118    )     /*  13 */ 
/*----------------------------------------------------------------------------------------------------*/
/* loopback_dfifo_data.FcNiuBasicTx.s.06.09.2006.B064.Tcp */

#define data_conf_df_pio_w                  0x01ffff31    /* dfifo_pio_w[5]=1, cksum[4]=1, ipp[0]=1   */

#define data_dfifo_reg1_000                 0x02e50000
#define data_dfifo_reg2_000                 0x00001540
#define data_dfifo_reg3_000                 0x40000000
#define data_dfifo_reg4_000                 0x00001800
#define data_dfifo_reg5_000                 0x00000001    /* IPP_DFIFO_WR5                  */ /*   5 */

#ifdef NIU_FORCE_XPCS_ERROR     /* force data_dfifo_reg1_001 error, check error detection & EXIT_BAD trap */
#define data_dfifo_reg1_001                 0xaaaaaaaa
#else
#define data_dfifo_reg1_001                 0x55555500
#endif
#define data_dfifo_reg2_001                 0x41725555
#define data_dfifo_reg3_001                 0x00003c62
#define data_dfifo_reg4_001                 0x00450008
#define data_dfifo_reg5_001                 0x00000000    /* IPP_DFIFO_WR5                  */ /*   5 */

#define data_dfifo_reg1_002                 0xf2002e00
#define data_dfifo_reg2_002                 0x06400000
#define data_dfifo_reg3_002                 0xf575635d
#define data_dfifo_reg4_002                 0xa06f44cb
#define data_dfifo_reg5_002                 0x00000000    /* IPP_DFIFO_WR5                  */ /*   5 */

#define data_dfifo_reg1_003                 0xa65a9b6b
#define data_dfifo_reg2_003                 0x00003a18
#define data_dfifo_reg3_003                 0x00000000
#define data_dfifo_reg4_003                 0x02500000
#define data_dfifo_reg5_003                 0x00000000    /* IPP_DFIFO_WR5                  */ /*   5 */

#define data_dfifo_reg1_004                 0x851f0000
#define data_dfifo_reg2_004                 0x00000000
#define data_dfifo_reg3_004                 0x02010000
#define data_dfifo_reg4_004                 0x99927958
#define data_dfifo_reg5_004                 0x00000002    /* IPP_DFIFO_WR5                  */ /*   5 */
/******************************************************************************************************/

/***********************************************  ***********************************************/
/* loopback_tx_info.FcNiuBasicTx.s.06.09.2006.B064.Tcp */

#define Tx_Descriptor               0x0000042000c00484    /* [43:0] address of the Tx control_header  */
/********                                  --- addr --                                         ********/

#define Tx_ctrl_header_lo8          0x00003c0019115740
#define Tx_ctrl_header_hi8          0x0000000000000000    /*       16 byte of the Tx_pkt control_head */

#define Tx_pkt_dat_lo8_0001         0x0055555555557241
#define Tx_pkt_dat_hi8_0001         0x623c000008004500    /*   1st 16 byte of the Tx_pkt raw_data     */

#define Tx_pkt_dat_lo8_0002         0x002e00f200004006
#define Tx_pkt_dat_hi8_0002         0x5d6375f5cb446fa0    /*   2nd 16 byte of the Tx_pkt raw_data     */

#define Tx_pkt_dat_lo8_0003         0x6b9b5aa6183a0000
#define Tx_pkt_dat_hi8_0003         0x0000000000005002    /*   3rd 16 byte of the Tx_pkt raw_data     */

#define Tx_pkt_dat_lo8_0004         0x00001c9600000000
#define Tx_pkt_dat_hi8_0004         0x0000010200000000    /*   4th 16 byte of the Tx_pkt raw_data     */
/******************************************************************************************************/

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

! #include "niu_init.h"
!
! Thread 0 Start
!
!
! thread_0:

/***********************************************  ***********************************************/
set_L2_DM:
    set   0x40000,                       %l1           ! %l1 -> constant, address space for pkt_data
    set   0x2,                           %l0
    setx  0xa900000000,                  %l6, %g1      ! %g1 -> L2 Control Status Register
    stx   %l0,                          [%g1]
    add   %g1,                           %l1, %g1
    stx   %l0,                          [%g1]
    add   %g1,                           %l1, %g1

Store_TxDescriptor:
    setx  Tx_Descriptor,                 %l2, %g2
    set   0x20000000,                    %g3           ! %g3 -> L2$ address
    stx   %g2,                          [%g3]
    membar #Sync

Store_TxControl:
    set   0x8,                           %l2           ! %l2 -> constant, address increment by 8-byte   

    setx  Tx_ctrl_header_lo8,            %l0, %g4
    add   %g3,                           %l1, %g3      ! Tx_data starts at 20040000
    stx   %g4,                          [%g3]
    membar #Sync

    setx  Tx_ctrl_header_hi8,            %l0, %g4
    add   %g3,                           %l2, %g3
    stx   %g4,                          [%g3]
    membar #Sync

Store_TxPktdata:
    setx  Tx_pkt_dat_lo8_0001,           %l0, %g4
    add   %g3,                           %l2, %g3
    stx   %g4,                          [%g3]
    membar #Sync

    setx  Tx_pkt_dat_hi8_0001,           %l0, %g4
    add   %g3,                           %l2, %g3
    stx   %g4,                          [%g3]
    membar #Sync

    setx  Tx_pkt_dat_lo8_0002,           %l0, %g4
    add   %g3,                           %l2, %g3
    stx   %g4,                          [%g3]
    membar #Sync

    setx  Tx_pkt_dat_hi8_0002,           %l0, %g4
    add   %g3,                           %l2, %g3
    stx   %g4,                          [%g3]
    membar #Sync

    setx  Tx_pkt_dat_lo8_0003,           %l0, %g4
    add   %g3,                           %l2, %g3
    stx   %g4,                          [%g3]
    membar #Sync

    setx  Tx_pkt_dat_hi8_0003,           %l0, %g4
    add   %g3,                           %l2, %g3
    stx   %g4,                          [%g3]
    membar #Sync

    setx  Tx_pkt_dat_lo8_0004,           %l0, %g4
    add   %g3,                           %l2, %g3
    stx   %g4,                          [%g3]
    membar #Sync

    setx  Tx_pkt_dat_hi8_0004,           %l0, %g4
    add   %g3,                           %l2, %g3
    stx   %g4,                          [%g3]
    membar #Sync
/******************************************************************************************************/

#ifdef NIU_XPCS_LOOPBACK_CHECK_L2
/***********************************************  ***********************************************/
    setx  addr_IPP_CFIG_1,               %o1, %o2; setx  data_conf_df_pio_w,  %o1, %o3; call ST_ad_o2_da_o3; nop

Read_TxDescriptor:
! -----------------------------------------------------------------------vvv------------------------------------
    setx  addr_IPP_DFIFO_WR_PTR_1,       %o1, %o2; setx                0x000, %o1, %o3; call ST_ad_o2_da_o3; nop

    set   0x20000000,                    %g3           ! --> g3 has L2$ address of tx_descriptor 
    ldx  [%g3],                          %o3

    setx  addr_IPP_DFIFO_WR1_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop
    srlx  %o3,                           32,  %o3;
    setx  addr_IPP_DFIFO_WR2_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop

!   setx  addr_IPP_DFIFO_WR3_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop
!   srlx  %o3,                           32,  %o3;
!   setx  addr_IPP_DFIFO_WR4_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop

    setx  addr_IPP_DFIFO_WR5_1,          %o1, %o2; setx                  0x0, %o1, %o3; call ST_ad_o2_da_o3; nop

Read_TxControl:
! -----------------------------------------------------------------------vvv------------------------------------
    setx  addr_IPP_DFIFO_WR_PTR_1,       %o1, %o2; setx                0x001, %o1, %o3; call ST_ad_o2_da_o3; nop

    set   0x20040000,                    %g3           ! --> g3 has L2$ address of tx_data 
    ldx  [%g3],                          %o3

    setx  addr_IPP_DFIFO_WR1_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop
    srlx  %o3,                           32,  %o3;
    setx  addr_IPP_DFIFO_WR2_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop

    set   0x20040008,                    %g3           ! --> g3 has L2$ address of tx_data 
    ldx  [%g3],                          %o3

    setx  addr_IPP_DFIFO_WR3_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop
    srlx  %o3,                           32,  %o3;
    setx  addr_IPP_DFIFO_WR4_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop

    setx  addr_IPP_DFIFO_WR5_1,          %o1, %o2; setx                  0x0, %o1, %o3; call ST_ad_o2_da_o3; nop

! -----------------------------------------------------------------------vvv------------------------------------
    setx  addr_IPP_DFIFO_WR_PTR_1,       %o1, %o2; setx                0x002, %o1, %o3; call ST_ad_o2_da_o3; nop

    set   0x20040010,                    %g3           ! --> g3 has L2$ address of tx_data 
    ldx  [%g3],                          %o3

    setx  addr_IPP_DFIFO_WR1_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop
    srlx  %o3,                           32,  %o3;
    setx  addr_IPP_DFIFO_WR2_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop

    set   0x20040018,                    %g3           ! --> g3 has L2$ address of tx_data 
    ldx  [%g3],                          %o3

    setx  addr_IPP_DFIFO_WR3_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop
    srlx  %o3,                           32,  %o3;
    setx  addr_IPP_DFIFO_WR4_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop

    setx  addr_IPP_DFIFO_WR5_1,          %o1, %o2; setx                  0x0, %o1, %o3; call ST_ad_o2_da_o3; nop

! -----------------------------------------------------------------------vvv------------------------------------
    setx  addr_IPP_DFIFO_WR_PTR_1,       %o1, %o2; setx                0x003, %o1, %o3; call ST_ad_o2_da_o3; nop

    set   0x20040020,                    %g3           ! --> g3 has L2$ address of tx_data 
    ldx  [%g3],                          %o3

    setx  addr_IPP_DFIFO_WR1_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop
    srlx  %o3,                           32,  %o3;
    setx  addr_IPP_DFIFO_WR2_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop

    set   0x20040028,                    %g3           ! --> g3 has L2$ address of tx_data 
    ldx  [%g3],                          %o3

    setx  addr_IPP_DFIFO_WR3_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop
    srlx  %o3,                           32,  %o3;
    setx  addr_IPP_DFIFO_WR4_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop

    setx  addr_IPP_DFIFO_WR5_1,          %o1, %o2; setx                  0x0, %o1, %o3; call ST_ad_o2_da_o3; nop

! -----------------------------------------------------------------------vvv------------------------------------
    setx  addr_IPP_DFIFO_WR_PTR_1,       %o1, %o2; setx                0x004, %o1, %o3; call ST_ad_o2_da_o3; nop

    set   0x20040030,                    %g3           ! --> g3 has L2$ address of tx_data
    ldx  [%g3],                          %o3

    setx  addr_IPP_DFIFO_WR1_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop
    srlx  %o3,                           32,  %o3;
    setx  addr_IPP_DFIFO_WR2_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop

    set   0x20040038,                    %g3           ! --> g3 has L2$ address of tx_data 
    ldx  [%g3],                          %o3

    setx  addr_IPP_DFIFO_WR3_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop
    srlx  %o3,                           32,  %o3;
    setx  addr_IPP_DFIFO_WR4_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop

    setx  addr_IPP_DFIFO_WR5_1,          %o1, %o2; setx                  0x0, %o1, %o3; call ST_ad_o2_da_o3; nop

! -----------------------------------------------------------------------vvv------------------------------------
    setx  addr_IPP_DFIFO_WR_PTR_1,       %o1, %o2; setx                0x005, %o1, %o3; call ST_ad_o2_da_o3; nop

    set   0x20040040,                    %g3           ! --> g3 has L2$ address of tx_data
    ldx  [%g3],                          %o3

    setx  addr_IPP_DFIFO_WR1_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop
    srlx  %o3,                           32,  %o3;
    setx  addr_IPP_DFIFO_WR2_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop

    set   0x20040048,                    %g3           ! --> g3 has L2$ address of tx_data 
    ldx  [%g3],                          %o3

    setx  addr_IPP_DFIFO_WR3_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop
    srlx  %o3,                           32,  %o3;
    setx  addr_IPP_DFIFO_WR4_1,          %o1, %o2;                                      call ST_ad_o2_da_o3; nop

    setx  addr_IPP_DFIFO_WR5_1,          %o1, %o2; setx                  0x0, %o1, %o3; call ST_ad_o2_da_o3; nop

/** ---------------------------------------------------------------------vvv------------------------ **/
    setx  addr_IPP_DFIFO_RD_PTR_1,       %l1, %o2; setx                0x000, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_RD1_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    setx  addr_IPP_DFIFO_RD2_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop

                                                   setx                0x001, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_RD1_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    setx  addr_IPP_DFIFO_RD2_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    setx  addr_IPP_DFIFO_RD3_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    setx  addr_IPP_DFIFO_RD4_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop

                                                   setx                0x002, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_RD1_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    setx  addr_IPP_DFIFO_RD2_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    setx  addr_IPP_DFIFO_RD3_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    setx  addr_IPP_DFIFO_RD4_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop

                                                   setx                0x003, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_RD1_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    setx  addr_IPP_DFIFO_RD2_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    setx  addr_IPP_DFIFO_RD3_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    setx  addr_IPP_DFIFO_RD4_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop

                                                   setx                0x004, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_RD1_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    setx  addr_IPP_DFIFO_RD2_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    setx  addr_IPP_DFIFO_RD3_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    setx  addr_IPP_DFIFO_RD4_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop

                                                   setx                0x005, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_RD1_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    setx  addr_IPP_DFIFO_RD2_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    setx  addr_IPP_DFIFO_RD3_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    setx  addr_IPP_DFIFO_RD4_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
/******************************************************************************************************/
#endif

/***********************************************  ***********************************************/
#ifdef NIU_XPCS_LOOPBACK
    setx  addr_MIF_CONFIG,               %o1, %o2; setx  data_xpcs0_init_001, %o1, %o3; call ST_ad_o2_da_o3; nop

    setx  addr_MIF_FRAME_OUTPUT_REG,     %o1, %o2; setx  data_xpcs0_init_002, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_003, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_004, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_005, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_006, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_007, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_008, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_009, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_010, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_011, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_012, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_013, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_014, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_015, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_016, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_017, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_018, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_019, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_020, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_021, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_022, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_023, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_024, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_025, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_026, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_027, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_028, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_029, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_030, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_031, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_032, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_033, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_034, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_035, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_036, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_037, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_038, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_039, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_040, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_041, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_042, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
                                                   setx  data_xpcs0_init_043, %o1, %o3; call ST_ad_o2_da_o3; nop; call WA_po_ad_o2; nop
#endif

    setx  addr_XMAC_0_CONFIG,            %o1, %o2; setx  data_xpcs0_init_044, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_XMAC_0_TxSftRst,          %o1, %o2; setx  data_xpcs0_init_045, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_XMAC_0_RxSftRst,          %o1, %o2; setx  data_xpcs0_init_046, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_XMAC_0_RxMac_Hist_Cnt1,   %o1, %o2; setx  data_xpcs0_init_047, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_XMAC_0_RxMac_Hist_Cnt2,   %o1, %o2; setx  data_xpcs0_init_048, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_XMAC_0_RxMac_Hist_Cnt3,   %o1, %o2; setx  data_xpcs0_init_049, %o1, %o3; call ST_ad_o2_da_o3; nop; 
 
    setx  addr_XMAC_0_RxMac_Hist_Cnt4,   %o1, %o2; setx  data_xpcs0_init_050, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_XMAC_0_RxMac_Hist_Cnt5,   %o1, %o2; setx  data_xpcs0_init_051, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_XMAC_0_RxMac_Hist_Cnt6,   %o1, %o2; setx  data_xpcs0_init_052, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_XMAC_0_RxMac_Hist_Cnt7,   %o1, %o2; setx  data_xpcs0_init_053, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_XMAC_0_CONFIG,            %o1, %o2; setx  data_xpcs0_init_054, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_XMAC_0_BASE10G_CONTROL1,  %o1, %o2; setx  data_xpcs0_init_055, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_XMAC_1_BASE10G_CONTROL1,  %o1, %o2; setx  data_xpcs0_init_056, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_IPP_CFIG_0,               %o1, %o2; setx  data_xpcs0_init_057, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_TXC_CONTROL,              %o1, %o2; setx  data_xpcs0_init_058, %o1, %o3; call ST_ad_o2_da_o3; nop; 
#ifdef NIU_XPCS_LOOPBACK
    setx  addr_XMAC_0_BASE10G_CONTROL1,  %o1, %o2; setx  data_xpcs0_init_059, %o1, %o3; call ST_ad_o2_da_o3; nop; 
#endif

    setx  addr_RDC_TaBLe,                %o1, %o2; setx  data_xpcs0_init_060, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_RBR_CFIG_B_0,             %o1, %o2; setx  data_xpcs0_init_061, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_RX_LOG_MASK1_0,           %o1, %o2; setx  data_xpcs0_init_062, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_RX_LOG_VAL1_0,            %o1, %o2; setx  data_xpcs0_init_063, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_RX_LOG_PAGE_RELO1_0,      %o1, %o2; setx  data_xpcs0_init_064, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_RX_LOG_MASK2_0,           %o1, %o2; setx  data_xpcs0_init_065, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_RX_LOG_VAL2_0,            %o1, %o2; setx  data_xpcs0_init_066, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_RX_LOG_PAGE_RELO2_0,      %o1, %o2; setx  data_xpcs0_init_067, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_RX_LOG_PAGE_VLD_0,        %o1, %o2; setx  data_xpcs0_init_068, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_RBR_CFIG_A_0,             %o1, %o2; setx  data_xpcs0_init_069, %o1, %o3; call ST_ad_o2_da_o3; nop; 
 
    setx  addr_RCRCFIG_A_0,              %o1, %o2; setx  data_xpcs0_init_070, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_RXDMA_CFIG1_0,            %o1, %o2; setx  data_xpcs0_init_071, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_RXDMA_CFIG2_0,            %o1, %o2; setx  data_xpcs0_init_072, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_RXDMA_CFIG1_0,            %o1, %o2; setx  data_xpcs0_init_073, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_RED_RANdom_INIT,          %o1, %o2; setx  data_xpcs0_init_074, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_RDC_RED_PARAmeter_0,      %o1, %o2; setx  data_xpcs0_init_075, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_RBR_KICK_0,               %o1, %o2; setx  data_xpcs0_init_076, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_XMAC_0_ADDR3_da,          %o1, %o2; setx  data_xpcs0_init_077, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_XMAC_0_ADDR4_da,          %o1, %o2; setx  data_xpcs0_init_078, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_XMAC_0_ADDR5_da,          %o1, %o2; setx  data_xpcs0_init_079, %o1, %o3; call ST_ad_o2_da_o3; nop; 

!   setx  addr_RDC_TaBLe,                %o1, %o2; setx  data_xpcs0_init_080, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_TXC_PORT_DMA_enable,      %o1, %o2; setx  data_xpcs0_init_081, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_TX_LOG_PAGE_VLD_0,        %o1, %o2; setx  data_xpcs0_init_082, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_TX_LOG_MASK1_0,           %o1, %o2; setx  data_xpcs0_init_083, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_TXC_DMA_MAX_burst_0,      %o1, %o2; setx  data_xpcs0_init_084, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_PAGE_VLD_1,        %o1, %o2; setx  data_xpcs0_init_085, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_MASK1_1,           %o1, %o2; setx  data_xpcs0_init_086, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TXC_DMA_MAX_burst_1,      %o1, %o2; setx  data_xpcs0_init_087, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_PAGE_VLD_2,        %o1, %o2; setx  data_xpcs0_init_088, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_MASK1_2,           %o1, %o2; setx  data_xpcs0_init_089, %o1, %o3; call ST_ad_o2_da_o3; nop; 

!   setx  addr_TXC_DMA_MAX_burst_2,      %o1, %o2; setx  data_xpcs0_init_090, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_PAGE_VLD_3,        %o1, %o2; setx  data_xpcs0_init_091, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_MASK1_3,           %o1, %o2; setx  data_xpcs0_init_092, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TXC_DMA_MAX_burst_3,      %o1, %o2; setx  data_xpcs0_init_093, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_PAGE_VLD_4,        %o1, %o2; setx  data_xpcs0_init_094, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_MASK1_4,           %o1, %o2; setx  data_xpcs0_init_095, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TXC_DMA_MAX_burst_4,      %o1, %o2; setx  data_xpcs0_init_096, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_PAGE_VLD_5,        %o1, %o2; setx  data_xpcs0_init_097, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_MASK1_5,           %o1, %o2; setx  data_xpcs0_init_098, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TXC_DMA_MAX_burst_5,      %o1, %o2; setx  data_xpcs0_init_099, %o1, %o3; call ST_ad_o2_da_o3; nop; 
 
!   setx  addr_TX_LOG_PAGE_VLD_6,        %o1, %o2; setx  data_xpcs0_init_100, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_MASK1_6,           %o1, %o2; setx  data_xpcs0_init_101, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TXC_DMA_MAX_burst_6,      %o1, %o2; setx  data_xpcs0_init_102, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_PAGE_VLD_7,        %o1, %o2; setx  data_xpcs0_init_103, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_MASK1_7,           %o1, %o2; setx  data_xpcs0_init_104, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TXC_DMA_MAX_burst_7,      %o1, %o2; setx  data_xpcs0_init_105, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_PAGE_VLD_8,        %o1, %o2; setx  data_xpcs0_init_106, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_MASK1_8,           %o1, %o2; setx  data_xpcs0_init_107, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TXC_DMA_MAX_burst_8,      %o1, %o2; setx  data_xpcs0_init_108, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_PAGE_VLD_9,        %o1, %o2; setx  data_xpcs0_init_109, %o1, %o3; call ST_ad_o2_da_o3; nop; 

!   setx  addr_TX_LOG_MASK1_9,           %o1, %o2; setx  data_xpcs0_init_110, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TXC_DMA_MAX_burst_9,      %o1, %o2; setx  data_xpcs0_init_111, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_PAGE_VLD_a,        %o1, %o2; setx  data_xpcs0_init_112, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_MASK1_a,           %o1, %o2; setx  data_xpcs0_init_113, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TXC_DMA_MAX_burst_a,      %o1, %o2; setx  data_xpcs0_init_114, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_PAGE_VLD_b,        %o1, %o2; setx  data_xpcs0_init_115, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_MASK1_b,           %o1, %o2; setx  data_xpcs0_init_116, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TXC_DMA_MAX_burst_b,      %o1, %o2; setx  data_xpcs0_init_117, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_PAGE_VLD_c,        %o1, %o2; setx  data_xpcs0_init_118, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_MASK1_c,           %o1, %o2; setx  data_xpcs0_init_119, %o1, %o3; call ST_ad_o2_da_o3; nop; 

!   setx  addr_TXC_DMA_MAX_burst_c,      %o1, %o2; setx  data_xpcs0_init_120, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_PAGE_VLD_d,        %o1, %o2; setx  data_xpcs0_init_121, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_MASK1_d,           %o1, %o2; setx  data_xpcs0_init_122, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TXC_DMA_MAX_burst_d,      %o1, %o2; setx  data_xpcs0_init_123, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_PAGE_VLD_e,        %o1, %o2; setx  data_xpcs0_init_124, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_MASK1_e,           %o1, %o2; setx  data_xpcs0_init_125, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TXC_DMA_MAX_burst_e,      %o1, %o2; setx  data_xpcs0_init_126, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_PAGE_VLD_f,        %o1, %o2; setx  data_xpcs0_init_127, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TX_LOG_MASK1_f,           %o1, %o2; setx  data_xpcs0_init_128, %o1, %o3; call ST_ad_o2_da_o3; nop; 
!   setx  addr_TXC_DMA_MAX_burst_f,      %o1, %o2; setx  data_xpcs0_init_129, %o1, %o3; call ST_ad_o2_da_o3; nop; 

    setx  addr_TX_RNG_CFIG_0,            %o1, %o2; setx  data_xpcs0_init_130, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_TX_RING_KICK_0,           %o1, %o2; setx  data_xpcs0_init_131, %o1, %o3; call ST_ad_o2_da_o3; nop; 
    setx  addr_TX_CS_0,                  %o1, %o2; setx  data_xpcs0_init_132, %o1, %o3; call ST_ad_o2_da_o3; nop; 
/******************************************************************************************************/

/***********************************************  ***********************************************/
    setx  addr_IPP_CFIG_1,               %o1, %o2; setx  data_conf_df_pio_w,  %o1, %o3; call ST_ad_o2_da_o3; nop

    setx  addr_IPP_DFIFO_WR_PTR_1,       %o1, %o2; setx                0x000, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR1_1,          %o1, %o2; setx  data_dfifo_reg1_000, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR2_1,          %o1, %o2; setx  data_dfifo_reg2_000, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR3_1,          %o1, %o2; setx  data_dfifo_reg3_000, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR4_1,          %o1, %o2; setx  data_dfifo_reg4_000, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR5_1,          %o1, %o2; setx  data_dfifo_reg5_000, %o1, %o3; call ST_ad_o2_da_o3; nop

    setx  addr_IPP_DFIFO_WR_PTR_1,       %o1, %o2; setx                0x001, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR1_1,          %o1, %o2; setx  data_dfifo_reg1_001, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR2_1,          %o1, %o2; setx  data_dfifo_reg2_001, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR3_1,          %o1, %o2; setx  data_dfifo_reg3_001, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR4_1,          %o1, %o2; setx  data_dfifo_reg4_001, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR5_1,          %o1, %o2; setx  data_dfifo_reg5_001, %o1, %o3; call ST_ad_o2_da_o3; nop

    setx  addr_IPP_DFIFO_WR_PTR_1,       %o1, %o2; setx                0x002, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR1_1,          %o1, %o2; setx  data_dfifo_reg1_002, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR2_1,          %o1, %o2; setx  data_dfifo_reg2_002, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR3_1,          %o1, %o2; setx  data_dfifo_reg3_002, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR4_1,          %o1, %o2; setx  data_dfifo_reg4_002, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR5_1,          %o1, %o2; setx  data_dfifo_reg5_002, %o1, %o3; call ST_ad_o2_da_o3; nop

    setx  addr_IPP_DFIFO_WR_PTR_1,       %o1, %o2; setx                0x003, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR1_1,          %o1, %o2; setx  data_dfifo_reg1_003, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR2_1,          %o1, %o2; setx  data_dfifo_reg2_003, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR3_1,          %o1, %o2; setx  data_dfifo_reg3_003, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR4_1,          %o1, %o2; setx  data_dfifo_reg4_003, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR5_1,          %o1, %o2; setx  data_dfifo_reg5_003, %o1, %o3; call ST_ad_o2_da_o3; nop

    setx  addr_IPP_DFIFO_WR_PTR_1,       %o1, %o2; setx                0x004, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR1_1,          %o1, %o2; setx  data_dfifo_reg1_004, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR2_1,          %o1, %o2; setx  data_dfifo_reg2_004, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR3_1,          %o1, %o2; setx  data_dfifo_reg3_004, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR4_1,          %o1, %o2; setx  data_dfifo_reg4_004, %o1, %o3; call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_WR5_1,          %o1, %o2; setx  data_dfifo_reg5_004, %o1, %o3; call ST_ad_o2_da_o3; nop
/******************************************************************************************************/

#ifdef NIU_XPCS_LOOPBACK
/***********************************************  ***********************************************/
    setx  addr_IPP_CFIG_0,               %o1, %o2; setx  data_conf_df_pio_w,  %o1, %o3; call ST_ad_o2_da_o3; nop
!du setx  addr_IPP_CFIG_1,               %o1, %o2; setx  data_conf_df_pio_w,  %o1, %o3; call ST_ad_o2_da_o3; nop

                                                   setx                0x000, %o1, %o3; call CH_da_o3;       nop
                                                   setx                0x001, %o1, %o3; call CH_da_o3;       nop
                                                   setx                0x002, %o1, %o3; call CH_da_o3;       nop
                                                   setx                0x003, %o1, %o3; call CH_da_o3;       nop
                                                   setx                0x004, %o1, %o3; call CH_da_o3;       nop
/******************************************************************************************************/
#endif

!-------------------------------------------------------------------------
        setx    loop_count, %g1, %g4
delay_loop_end:
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop_end
        nop
!-------------------------------------------------------------------------

test_passed:
	nop
	EXIT_GOOD

test_failed:
	nop
        EXIT_BAD

!++++++++++++++++ end of the main test +++++++++++++++++++++++++++++++++++

!-------------------------------------------------------------------------
ST_ad_o2_da_o3:
        save
        mov      %i2,                             %l2
        stxa     %i3,                            [%l2]ASI_PRIMARY_LITTLE
        nop
        ret
        restore
!-------------------------------------------------------------------------

!-------------------------------------------------------------------------
WA_po_ad_o2:
        save
        mov      %i2,                             %l2

set_delay_counter:
        setx     POLL_DELAY_VALUE,                %l1, %l6

delay_loop_instr_compl:
        dec      %l6
        brnz     %l6,                             delay_loop_instr_compl
        nop

        ldxa    [%l2]ASI_PRIMARY_LITTLE,          %l4
        setx     0x10000,                         %l1, %l5
        and      %l5,                             %l4, %l4
        brz      %l4,                             set_delay_counter
        nop
        ret
        restore
!-------------------------------------------------------------------------

!-------------------------------------------------------------------------
CH_da_o3:
        save
        mov      %i3,                             %o3

    setx  addr_IPP_DFIFO_RD_PTR_0,       %l1, %o2;                                      call ST_ad_o2_da_o3; nop
    setx  addr_IPP_DFIFO_RD_PTR_1,       %l1, %o2;                                      call ST_ad_o2_da_o3; nop

    setx  addr_IPP_DFIFO_RD1_0,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l3; nop
    setx  addr_IPP_DFIFO_RD1_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    cmp                                  %l3, %l4;
    bne   test_failed
    nop

    setx  addr_IPP_DFIFO_RD2_0,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l3; nop
    setx  addr_IPP_DFIFO_RD2_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    cmp                                  %l3, %l4;
    bne   test_failed
    nop

    setx  addr_IPP_DFIFO_RD3_0,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l3; nop
    setx  addr_IPP_DFIFO_RD3_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    cmp                                  %l3, %l4;
    bne   test_failed
    nop

    setx  addr_IPP_DFIFO_RD4_0,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l3; nop
    setx  addr_IPP_DFIFO_RD4_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    cmp                                  %l3, %l4;
    bne   test_failed
    nop

    setx  addr_IPP_DFIFO_RD5_0,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l3; nop
    setx  addr_IPP_DFIFO_RD5_1,          %l1, %l2; ldxa   [%l2]ASI_PRIMARY_LITTLE, %l4; nop
    cmp                                  %l3, %l4;
    bne   test_failed
    nop

        ret
        restore
!-------------------------------------------------------------------------

!.global test_failed
!test_failed:
!	EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/
/* These initialization is temporary, as there looks some bug in mempli */

SECTION       SetRngConfig_init data_va=0x100000000
attr_data {
	Name = SetRngConfig_init,
	hypervisor,
	compressimage
	}
.data
SetRngConfig_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetTxRingKick_init data_va=0x100000100
attr_data {
	Name = SetTxRingKick_init,
	hypervisor,
	compressimage
	}
.data
SetTxRingKick_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetTxLPMask1_init data_va=0x100000200
attr_data {
        Name = SetTxLPMask1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPMask1_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetTxLPValue1_init data_va=0x100000300
attr_data {
        Name = SetTxLPValue1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValue1_init:
        .xword 0x0060452301000484
/************************************************************************/

SECTION       SetTxLPRELOC1_init data_va=0x100000400
attr_data {
        Name = SetTxLPRELOC1_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPRELOC1_init:
        .xword 0x0060452301000484
/************************************************************************/
SECTION       SetTxLPMask2_init data_va=0x100000500
attr_data {
        Name = SetTxLPMask2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPMask2_init:
        .xword 0x0060452301000484
/************************************************************************/
SECTION       SetTxLPValue2_init data_va=0x100000600
attr_data {
        Name = SetTxLPValue2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValue2_init:
        .xword 0x0060452301000484

/************************************************************************/
SECTION       SetTxLPRELOC2_init data_va=0x100000700
attr_data {
        Name = SetTxLPRELOC2_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPRELOC2_init:
        .xword 0x0060452301000484

/************************************************************************/
SECTION       SetTxLPValid_init data_va=0x100000800
attr_data {
        Name = SetTxLPValid_init,
        hypervisor,
        compressimage
        }
.data
SetTxLPValid_init:
        .xword 0x0060452301000484

/************************************************************************/

