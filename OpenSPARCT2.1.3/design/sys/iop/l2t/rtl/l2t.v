// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t.v
// Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
// 4150 Network Circle, Santa Clara, California 95054, U.S.A.
//
// * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; version 2 of the License.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
// 
// For the avoidance of doubt, and except that if any non-GPL license 
// choice is available it will apply instead, Sun elects to use only 
// the General Public License version 2 (GPLv2) at this time for any 
// software where a choice of GPL license versions is made 
// available with the language indicating that GPLv2 or any later version 
// may be used, or where a choice of which version of the GPL is applied is 
// otherwise unspecified. 
//
// Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
// CA 95054 USA or visit www.sun.com if you need additional information or 
// have any questions. 
// 
// ========== Copyright Header End ============================================
`define SYSCLK_PERIOD   5000


// Afara Link Defines
// ==================

// Reliable Link
`define AL_RB_CNT       16
`define AL_RB_IDX        4
`define AL_RB_WINDOW    `AL_RB_IDX'd8

// Afara Link Objects
`define AL_OBJ_SZ      112

// Afara Link Object Format - Reliable Link
`define AL_RL_HI       111
`define AL_RL_LO       103
`define AL_RL_SZ         9

`define AL_ESN_HI      111
`define AL_ESN_LO      108
`define AL_SSN_HI      107
`define AL_SSN_LO      104
`define AL_ED          103

// Afara Link Object Format - Congestion
`define AL_CNG_HI      102
`define AL_CNG_LO       94
`define AL_CNG_SZ        9
  
`define AL_REQ_CNG     102
`define AL_BSCT_HI     101
`define AL_BSCT_LO      96
`define AL_EGR_P_CNG    95
`define AL_MARK         94


// Afara Link Object Format - Acknowledge
`define AL_ACK_SZ       21
`define AL_A_COS        93
`define AL_A_TYP_HI     92
`define AL_A_TYP_LO     91
`define AL_A_NACK       90
`define AL_A_TAG_HI     89
`define AL_A_TAG_LO     80
`define AL_A_PORT_HI    79
`define AL_A_PORT_LO    73


// Afara Link Object Format - Request
`define AL_REQ_SZ       73
`define AL_R_COS        72
`define AL_R_TYP_HI     71
`define AL_R_TYP_LO     70
`define AL_R_SCR_HI     69
`define AL_R_SCR_LO     67
`define AL_R_TCR_HI     66
`define AL_R_TCR_LO     64
`define AL_R_TAG_HI     63
`define AL_R_TAG_LO     54
`define AL_R_PORT_HI    53
`define AL_R_PORT_LO    47
`define AL_R_LEN_HI     46
`define AL_R_LEN_LO     40
`define AL_R_ADD_HI     39
`define AL_R_ADD_LO      0

// Afara Link Object Format - Message
`define AL_M_MQID_HI     2
`define AL_M_MQID_LO     0

// Acknowledge Types
`define AL_ACK_NONE   2'b00
`define AL_ACK_NPAY   2'b01
`define AL_ACK_WPAY   2'b10

// Request Types
`define AL_REQ_NONE   2'b00
`define AL_REQ_NPAY   2'b01
`define AL_REQ_WPAY   2'b10
`define AL_REQ_MSG    2'b11

// Afara Link Frame
`define AL_FRAME_SZ    144


//
// UCB Packet Type
// ===============
//
`define UCB_READ_NACK        4'b0000    // ack/nack types
`define UCB_READ_ACK         4'b0001
`define UCB_WRITE_ACK        4'b0010
`define UCB_IFILL_ACK        4'b0011
`define UCB_IFILL_NACK       4'b0111

`define UCB_READ_REQ         4'b0100    // req types
`define UCB_WRITE_REQ        4'b0101
`define UCB_IFILL_REQ        4'b0110

`define UCB_INT              4'b1000    // plain interrupt
`define UCB_INT_VEC          4'b1100    // interrupt with vector
`define UCB_RESET_VEC        4'b1101    // reset with vector
`define UCB_IDLE_VEC         4'b1110    // idle with vector
`define UCB_RESUME_VEC       4'b1111    // resume with vector


//
// UCB Data Packet Format
// ======================
//
`define UCB_NOPAY_PKT_WIDTH   64        // packet without payload
`define UCB_64PAY_PKT_WIDTH  128        // packet with 64 bit payload
`define UCB_128PAY_PKT_WIDTH 192        // packet with 128 bit payload

`define UCB_DATA_EXT_HI      191        // (64) extended data
`define UCB_DATA_EXT_LO      128
`define UCB_DATA_HI          127        // (64) data
`define UCB_DATA_LO           64
`define UCB_RSV_HI            63        // (9) reserved bits
`define UCB_RSV_LO            55
`define UCB_ADDR_HI           54        // (40) bit address
`define UCB_ADDR_LO           15
`define UCB_SIZE_HI           14        // (3) request size
`define UCB_SIZE_LO           12
`define UCB_BUF_HI            11        // (2) buffer ID
`define UCB_BUF_LO            10
`define UCB_THR_HI             9        // (6) cpu/thread ID
`define UCB_THR_LO             4
`define UCB_PKT_HI             3        // (4) packet type
`define UCB_PKT_LO             0

`define UCB_DATA_EXT_WIDTH    64
`define UCB_DATA_WIDTH        64
`define UCB_RSV_WIDTH          9
`define UCB_ADDR_WIDTH        40 
`define UCB_SIZE_WIDTH         3
`define UCB_BUFID_WIDTH        2
`define UCB_THR_WIDTH          6
`define UCB_PKT_WIDTH          4

// Size encoding for the UCB_SIZE_HI/LO field
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
`define UCB_SIZE_1B          3'b000
`define UCB_SIZE_2B          3'b001
`define UCB_SIZE_4B          3'b010
`define UCB_SIZE_8B          3'b011
`define UCB_SIZE_16B         3'b100


//
// UCB Interrupt Packet Format
// ===========================
//
`define UCB_INT_PKT_WIDTH     64

`define UCB_INT_RSV_HI        63        // (7) reserved bits
`define UCB_INT_RSV_LO        57
`define UCB_INT_VEC_HI        56        // (6) interrupt vector
`define UCB_INT_VEC_LO        51
`define UCB_INT_STAT_HI       50        // (32) interrupt status
`define UCB_INT_STAT_LO       19
`define UCB_INT_DEV_HI        18        // (9) device ID
`define UCB_INT_DEV_LO        10
//`define UCB_THR_HI             9      // (6) cpu/thread ID shared with
//`define UCB_THR_LO             4             data packet format
//`define UCB_PKT_HI             3      // (4) packet type shared with
//`define UCB_PKT_LO             0      //     data packet format

`define UCB_INT_RSV_WIDTH      7
`define UCB_INT_VEC_WIDTH      6
`define UCB_INT_STAT_WIDTH    32
`define UCB_INT_DEV_WIDTH      9


//
// FCRAM Bus Widths
// ================
//
`define FCRAM_DQ_WIDTH                16
`define FCRAM_DQS_WIDTH                2
`define FCRAM_ADDR_WIDTH              15
`define FCRAM_BA_WIDTH                 2


//
// ENET clock periods
// ==================
//
`define AXGRMII_CLK_PERIOD          6400 // 312.5MHz/2
`define ENET_GMAC_CLK_PERIOD        8000 // 125MHz


//
// Tomatillo defines
// =================
//
`define      SYS_UPA_CLK        `SYS.upa_clk
`define      SYS_J_CLK          `SYS.j_clk
`define      SYS_P_CLK          `SYS.p_clk
`define      SYS_G_CLK          `SYS.g_clk
`define      P_PCI33            `TOM_ENV.p_pci33
`define      UPA_RST_N          `TOM_ENV.g_rst_l
`define      EXPR_32            `SYS_TOM.`TOM_RST.`COUNT_5
`define      RST_COUNT          `SYS_TOM_TOM_RST_COUNT
`define      ARTHUR_MODE        1'b0
`define      JP_TIMESCALE       `timescale 1 ps / 1 ps
`define      PCI_CLK_PERIOD     15152                  //  66 MHz
`define      UPA_RD_CLK_PERIOD  6666                   // 150 MHz
`define      UPA_REF_CLK_PERIOD 7576                   // 132 MHz
`define      ICHIP_CLK_PERIOD   30304                  //  33 MHz


//
// PCI Device Address Configuration
// ================================
//
`define PRIM_SLAVE1_MEM0_L      64'h0000000000000000
`define PRIM_SLAVE1_MEM0_H      64'h000000003fff0000
`define PRIM_SLAVE1_IO0_L       64'h0000000000000000
`define PRIM_SLAVE1_IO0_H       64'h00000000002f0000
`define PRIM_SLAVE1_JBUS_BASE   64'h000007ff00000000

`define PRIM_SLAVE2_MEM0_L      64'h0000000040000000
`define PRIM_SLAVE2_MEM0_H      64'h000000007fffffff
`define PRIM_SLAVE2_IO0_L       64'h0000000000300000
`define PRIM_SLAVE2_IO0_H       64'h00000000005fffff
`define PRIM_SLAVE2_JBUS_BASE   64'h000007ff40000000

`define PCIB_SLAVE1_MEM0_L      64'h0000000000000000
`define PCIB_SLAVE1_MEM0_H      64'h000000003fff0000
`define PCIB_SLAVE1_IO0_L       64'h0000000000000000
`define PCIB_SLAVE1_IO0_H       64'h00000000002fffff
`define PCIB_SLAVE1_JBUS_BASE   64'h000007f780000000

`define PCIB_SLAVE2_MEM0_L      64'h0000000040000000
`define PCIB_SLAVE2_MEM0_H      64'h000000007fffffff
`define PCIB_SLAVE2_IO0_L       64'h0000000000300000
`define PCIB_SLAVE2_IO0_H       64'h00000000007fffff
`define PCIB_SLAVE2_JBUS_BASE   64'h000007f7c0000000


 


// Address Map Defines
// ===================
`define ADDR_MAP_HI      39
`define ADDR_MAP_LO      32
`define IO_ADDR_BIT      39

// CMP space
`define DRAM_DATA_LO     8'h00
`define DRAM_DATA_HI     8'h7f

// IOP space
`define JBUS1            8'h80
`define HASH_TBL_NRAM_CSR 8'h81
`define RESERVED_1       8'h82
`define ENET_MAC_CSR     8'h83
`define ENET_ING_CSR     8'h84
`define ENET_EGR_CMD_CSR 8'h85
`define ENET_EGR_DP_CSR  8'h86
`define RESERVED_2_LO    8'h87
`define RESERVED_2_HI    8'h92
`define BSC_CSR          8'h93
`define RESERVED_3       8'h94
`define RAND_GEN_CSR     8'h95
`define CLOCK_UNIT_CSR   8'h96
`define DRAM_CSR         8'h97
`define IOB_MAN_CSR      8'h98
`define TAP_CSR          8'h99
`define RESERVED_4_L0    8'h9a
`define RESERVED_4_HI    8'h9d
`define CPU_ASI          8'h9e
`define IOB_INT_CSR      8'h9f

// L2 space
`define L2C_CSR_LO       8'ha0
`define L2C_CSR_HI       8'hbf

// More IOP space
`define JBUS2_LO         8'hc0
`define JBUS2_HI         8'hfe
`define SPI_CSR          8'hff


//Cache Crossbar Width and Field Defines
//======================================
`define	PCX_WIDTH	130  //PCX payload packet width , BS and SR 11/12/03 N2 Xbar Packet format change
`define	PCX_WIDTH_LESS1	129  //PCX payload packet width , BS and SR 11/12/03 N2 Xbar Packet format change
`define	CPX_WIDTH	146  //CPX payload packet width, BS and SR 11/12/03 N2 Xbar Packet format change
`define	CPX_WIDTH_LESS1	145  //CPX payload packet width, BS and SR 11/12/03 N2 Xbar Packet format change
`define	CPX_WIDTH11	134 
`define	CPX_WIDTH11c	134c
`define	CPX_WIDTHc	146c  //CPX payload packet width , BS and SR 11/12/03 N2 Xbar Packet format change

`define PCX_VLD         123  //PCX packet valid 
`define PCX_RQ_HI       122  //PCX request type field 
`define PCX_RQ_LO       118
`define PCX_NC          117  //PCX non-cacheable bit
`define PCX_R           117  //PCX read/!write bit 
`define PCX_CP_HI       116  //PCX cpu_id field
`define PCX_CP_LO       114
`define PCX_TH_HI       113  //PCX Thread field
`define PCX_TH_LO       112
`define PCX_BF_HI       111  //PCX buffer id field
`define PCX_INVALL      111
`define PCX_BF_LO       109
`define PCX_WY_HI       108  //PCX replaced L1 way field
`define PCX_WY_LO       107
`define PCX_P_HI        108  //PCX packet ID, 1st STQ - 10, 2nd - 01
`define PCX_P_LO        107
`define PCX_SZ_HI       106  //PCX load/store size field
`define PCX_SZ_LO       104
`define PCX_ERR_HI      106  //PCX error field
`define PCX_ERR_LO      104
`define PCX_AD_HI       103  //PCX address field
`define PCX_AD_LO        64
`define PCX_DA_HI        63  //PCX Store data
`define PCX_DA_LO         0  

`define PCX_SZ_1B    3'b000  // encoding for 1B access
`define PCX_SZ_2B    3'b001  // encoding for 2B access
`define PCX_SZ_4B    3'b010  // encoding for 4B access
`define PCX_SZ_8B    3'b011  // encoding for 8B access
`define PCX_SZ_16B   3'b100  // encoding for 16B access

`define CPX_VLD         145  //CPX payload packet valid

`define CPX_RQ_HI       144  //CPX Request type
`define CPX_RQ_LO       141
`define CPX_L2MISS      140
`define CPX_ERR_HI      140  //CPX error field
`define CPX_ERR_LO      138
`define CPX_NC          137  //CPX non-cacheable
`define CPX_R           137  //CPX read/!write bit
`define CPX_TH_HI       136  //CPX thread ID field 
`define CPX_TH_LO       134

//bits 133:128 are shared by different fields
//for different packet types.

`define CPX_IN_HI       133  //CPX Interrupt source 
`define CPX_IN_LO       128  

`define CPX_WYVLD       133  //CPX replaced way valid
`define CPX_WY_HI       132  //CPX replaced I$/D$ way
`define CPX_WY_LO       131
`define CPX_BF_HI       130  //CPX buffer ID field - 3 bits
`define CPX_BF_LO       128

`define CPX_SI_HI       132  //L1 set ID - PA[10:6]- 5 bits
`define CPX_SI_LO       128  //used for invalidates

`define CPX_P_HI        131  //CPX packet ID, 1st STQ - 10, 2nd - 01 
`define CPX_P_LO        130

`define CPX_ASI         130  //CPX forward request to ASI
`define CPX_IF4B        130
`define CPX_IINV        124
`define CPX_DINV        123
`define CPX_INVPA5      122
`define CPX_INVPA4      121
`define CPX_CPUID_HI    120
`define CPX_CPUID_LO    118
`define CPX_INV_PA_HI   116
`define CPX_INV_PA_LO   112
`define CPX_INV_IDX_HI   117
`define CPX_INV_IDX_LO   112

`define CPX_DA_HI       127  //CPX data payload
`define CPX_DA_LO         0

`define	LOAD_RQ		5'b00000
`define MMU_RQ          5'b01000 // BS and SR 11/12/03 N2 Xbar Packet format change
`define	IMISS_RQ	5'b10000
`define	STORE_RQ	5'b00001
`define	CAS1_RQ		5'b00010
`define	CAS2_RQ		5'b00011
`define	SWAP_RQ		5'b00111 
`define	STRLOAD_RQ	5'b00100
`define	STRST_RQ	5'b00101
`define STQ_RQ          5'b00111
`define INT_RQ          5'b01001
`define FWD_RQ          5'b01101
`define FWD_RPY         5'b01110
`define RSVD_RQ         5'b11111

`define LOAD_RET        4'b0000
`define INV_RET         4'b0011
`define ST_ACK          4'b0100
`define AT_ACK          4'b0011
`define INT_RET         4'b0111
`define TEST_RET        4'b0101
`define FP_RET          4'b1000
`define IFILL_RET       4'b0001
`define	EVICT_REQ	4'b0011
//`define INVAL_ACK       4'b1000
`define INVAL_ACK       4'b0100
`define	ERR_RET		4'b1100
`define STRLOAD_RET     4'b0010
`define STRST_ACK       4'b0110
`define FWD_RQ_RET      4'b1010
`define FWD_RPY_RET     4'b1011
`define RSVD_RET        4'b1111

//End cache crossbar defines


// Number of COS supported by EECU 
`define EECU_COS_NUM  	  2


// 
// BSC bus sizes
// =============
//

// General
`define BSC_ADDRESS      40
`define MAX_XFER_LEN     7'b0
`define XFER_LEN_WIDTH   6

// CTags
`define BSC_CTAG_SZ      12
`define EICU_CTAG_PRE    5'b11101
`define EICU_CTAG_REM    7
`define EIPU_CTAG_PRE    3'b011
`define EIPU_CTAG_REM    9
`define EECU_CTAG_PRE    8'b11010000
`define EECU_CTAG_REM    4
`define EEPU_CTAG_PRE    6'b010000
`define EEPU_CTAG_REM    6
`define L2C_CTAG_PRE     2'b00
`define L2C_CTAG_REM     10
`define JBI_CTAG_PRE     2'b10
`define JBI_CTAG_REM     10
// reinstated temporarily
`define PCI_CTAG_PRE     7'b1101100
`define PCI_CTAG_REM     5


// CoS
`define EICU_COS         1'b0
`define EIPU_COS         1'b1
`define EECU_COS         1'b0
`define EEPU_COS         1'b1
`define PCI_COS          1'b0

// L2$ Bank
`define BSC_L2_BNK_HI    8
`define BSC_L2_BNK_LO    6

// L2$ Req
`define BSC_L2_REQ_SZ   62
`define BSC_L2_REQ	`BSC_L2_REQ_SZ	// used by rams in L2 code
`define BSC_L2_BUS      64
`define BSC_L2_CTAG_HI  61
`define BSC_L2_CTAG_LO  50
`define BSC_L2_ADD_HI   49
`define BSC_L2_ADD_LO   10
`define BSC_L2_LEN_HI    9
`define BSC_L2_LEN_LO    3
`define BSC_L2_ALLOC     2
`define BSC_L2_COS       1
`define BSC_L2_READ      0   

// L2$ Ack
`define L2_BSC_ACK_SZ   16
`define L2_BSC_BUS      64
`define L2_BSC_CBA_HI   14    // CBA - Critical Byte Address
`define L2_BSC_CBA_LO   13
`define L2_BSC_READ     12
`define L2_BSC_CTAG_HI  11
`define L2_BSC_CTAG_LO   0

// Enet Egress Command Unit
`define EECU_REQ_BUS    44
`define EECU_REQ_SZ     44
`define EECU_R_QID_HI   43
`define EECU_R_QID_LO   40
`define EECU_R_ADD_HI   39
`define EECU_R_ADD_LO    0

`define EECU_ACK_BUS    64
`define EECU_ACK_SZ      5
`define EECU_A_NACK      4
`define EECU_A_QID_HI    3
`define EECU_A_QID_LO    0


// Enet Egress Packet Unit
`define EEPU_REQ_BUS    55
`define EEPU_REQ_SZ     55
`define EEPU_R_TLEN_HI  54
`define EEPU_R_TLEN_LO  48
`define EEPU_R_SOF      47
`define EEPU_R_EOF      46
`define EEPU_R_PORT_HI  45
`define EEPU_R_PORT_LO  44
`define EEPU_R_QID_HI   43
`define EEPU_R_QID_LO   40
`define EEPU_R_ADD_HI   39
`define EEPU_R_ADD_LO    0

// This is cleaved in between Egress Datapath Ack's
`define EEPU_ACK_BUS     6
`define EEPU_ACK_SZ      6
`define EEPU_A_EOF       5
`define EEPU_A_NACK      4
`define EEPU_A_QID_HI    3
`define EEPU_A_QID_LO    0


// Enet Egress Datapath
`define EEDP_ACK_BUS   128
`define EEDP_ACK_SZ     28
`define EEDP_A_NACK     27
`define EEDP_A_QID_HI   26
`define EEDP_A_QID_LO   21
`define EEDP_A_SOF      20
`define EEDP_A_EOF      19
`define EEDP_A_LEN_HI   18
`define EEDP_A_LEN_LO   12
`define EEDP_A_TAG_HI   11
`define EEDP_A_TAG_LO    0
`define EEDP_A_PORT_HI   5
`define EEDP_A_PORT_LO   4
`define EEDP_A_PORT_WIDTH 2


// In-Order / Ordered Queue: EEPU
// Tag is: TLEN, SOF, EOF, QID = 15
`define EEPU_TAG_ARY     (7+1+1+6)
`define EEPU_ENTRIES     16
`define EEPU_E_IDX        4
`define EEPU_PORTS        4
`define EEPU_P_IDX        2

// Nack + Tag Info + CTag
`define IOQ_TAG_ARY      (1+`EEPU_TAG_ARY+12)
`define EEPU_TAG_LOC     (`EEPU_P_IDX+`EEPU_E_IDX)


// ENET Ingress Queue Management Req
`define EICU_REQ_BUS     64 
`define EICU_REQ_SZ      62
`define EICU_R_CTAG_HI   61
`define EICU_R_CTAG_LO   50
`define EICU_R_ADD_HI    49
`define EICU_R_ADD_LO    10
`define EICU_R_LEN_HI     9
`define EICU_R_LEN_LO     3
`define EICU_R_COS        1
`define EICU_R_READ       0   


// ENET Ingress Queue Management Ack
`define EICU_ACK_BUS     64
`define EICU_ACK_SZ      14
`define EICU_A_NACK      13
`define EICU_A_READ      12
`define EICU_A_CTAG_HI   11
`define EICU_A_CTAG_LO    0


// Enet Ingress Packet Unit
`define EIPU_REQ_BUS    128 
`define EIPU_REQ_SZ      59
`define EIPU_R_CTAG_HI   58
`define EIPU_R_CTAG_LO   50
`define EIPU_R_ADD_HI    49
`define EIPU_R_ADD_LO    10
`define EIPU_R_LEN_HI     9
`define EIPU_R_LEN_LO     3
`define EIPU_R_COS        1
`define EIPU_R_READ       0   


// ENET Ingress Packet Unit Ack
`define EIPU_ACK_BUS      10
`define EIPU_ACK_SZ       10
`define EIPU_A_NACK       9
`define EIPU_A_CTAG_HI    8
`define EIPU_A_CTAG_LO    0


// In-Order / Ordered Queue: PCI
// Tag is: CTAG
`define PCI_TAG_ARY     12
`define PCI_ENTRIES     16
`define PCI_E_IDX        4
`define PCI_PORTS        2

// PCI-X Request
`define PCI_REQ_BUS      64
`define PCI_REQ_SZ       62
`define PCI_R_CTAG_HI    61
`define PCI_R_CTAG_LO    50
`define PCI_R_ADD_HI     49
`define PCI_R_ADD_LO     10
`define PCI_R_LEN_HI      9
`define PCI_R_LEN_LO      3
`define PCI_R_COS         1
`define PCI_R_READ        0

// PCI_X Acknowledge
`define PCI_ACK_BUS      64
`define PCI_ACK_SZ       14
`define PCI_A_NACK       13
`define PCI_A_READ       12 
`define PCI_A_CTAG_HI    11
`define PCI_A_CTAG_LO     0


`define BSC_MAX_REQ_SZ   62


//
// BSC array sizes
//================
//
`define BSC_REQ_ARY_INDEX        6
`define BSC_REQ_ARY_DEPTH       64
`define BSC_REQ_ARY_WIDTH       62
`define BSC_REQ_NXT_WIDTH       12
`define BSC_ACK_ARY_INDEX        6
`define BSC_ACK_ARY_DEPTH       64
`define BSC_ACK_ARY_WIDTH       14
`define BSC_ACK_NXT_WIDTH       12
`define BSC_PAY_ARY_INDEX        6
`define BSC_PAY_ARY_DEPTH       64
`define BSC_PAY_ARY_WIDTH      256

// ECC syndrome bits per memory element
`define BSC_PAY_ECC             10
`define BSC_PAY_MEM_WIDTH       (`BSC_PAY_ECC+`BSC_PAY_ARY_WIDTH)


//
// BSC Port Definitions
// ====================
//
// Bits 7 to 4 of curr_port_id
`define BSC_PORT_NULL       4'h0
`define BSC_PORT_SC         4'h1
`define BSC_PORT_EICU       4'h2
`define BSC_PORT_EIPU       4'h3
`define BSC_PORT_EECU       4'h4
`define BSC_PORT_EEPU       4'h8
`define BSC_PORT_PCI        4'h9

// Number of ports of each type
`define BSC_PORT_SC_CNT     8

// Bits needed to represent above
`define BSC_PORT_SC_IDX     3

// How wide the linked list pointers are
// 60b for no payload (2CoS)
// 80b for payload (2CoS)

//`define BSC_OBJ_PTR   80
//`define BSC_HD1_HI    69
//`define BSC_HD1_LO    60
//`define BSC_TL1_HI    59
//`define BSC_TL1_LO    50
//`define BSC_CT1_HI    49
//`define BSC_CT1_LO    40
//`define BSC_HD0_HI    29
//`define BSC_HD0_LO    20
//`define BSC_TL0_HI    19
//`define BSC_TL0_LO    10
//`define BSC_CT0_HI     9
//`define BSC_CT0_LO     0

`define BSC_OBJP_PTR  48
`define BSC_PYP1_HI   47
`define BSC_PYP1_LO   42
`define BSC_HDP1_HI   41
`define BSC_HDP1_LO   36
`define BSC_TLP1_HI   35
`define BSC_TLP1_LO   30
`define BSC_CTP1_HI   29
`define BSC_CTP1_LO   24
`define BSC_PYP0_HI   23
`define BSC_PYP0_LO   18
`define BSC_HDP0_HI   17
`define BSC_HDP0_LO   12
`define BSC_TLP0_HI   11
`define BSC_TLP0_LO    6
`define BSC_CTP0_HI    5
`define BSC_CTP0_LO    0

`define BSC_PTR_WIDTH     192
`define BSC_PTR_REQ_HI    191
`define BSC_PTR_REQ_LO    144
`define BSC_PTR_REQP_HI   143
`define BSC_PTR_REQP_LO    96
`define BSC_PTR_ACK_HI     95
`define BSC_PTR_ACK_LO     48
`define BSC_PTR_ACKP_HI    47
`define BSC_PTR_ACKP_LO     0

`define BSC_PORT_SC_PTR    96       // R, R+P
`define BSC_PORT_EECU_PTR  48       // A+P
`define BSC_PORT_EICU_PTR  96       // A, A+P
`define BSC_PORT_EIPU_PTR  48       // A

// I2C STATES in DRAMctl
`define I2C_CMD_NOP   4'b0000
`define I2C_CMD_START 4'b0001
`define I2C_CMD_STOP  4'b0010
`define I2C_CMD_WRITE 4'b0100
`define I2C_CMD_READ  4'b1000


//
// IOB defines
// ===========
//
`define IOB_ADDR_WIDTH       40
`define IOB_LOCAL_ADDR_WIDTH 32

`define IOB_CPU_INDEX         3
`define IOB_CPU_WIDTH         8
`define IOB_THR_INDEX         2
`define IOB_THR_WIDTH         4
`define IOB_CPUTHR_INDEX      5
`define IOB_CPUTHR_WIDTH     32

`define IOB_MONDO_DATA_INDEX  5
`define IOB_MONDO_DATA_DEPTH 32
`define IOB_MONDO_DATA_WIDTH 64
`define IOB_MONDO_SRC_WIDTH   5
`define IOB_MONDO_BUSY        5

`define IOB_INT_TAB_INDEX     6
`define IOB_INT_TAB_DEPTH    64 

`define IOB_INT_STAT_WIDTH   32
`define IOB_INT_STAT_HI      31
`define IOB_INT_STAT_LO       0

`define IOB_INT_VEC_WIDTH     6
`define IOB_INT_VEC_HI        5
`define IOB_INT_VEC_LO        0

`define IOB_INT_CPU_WIDTH     5
`define IOB_INT_CPU_HI       12 
`define IOB_INT_CPU_LO        8

`define IOB_INT_MASK          2
`define IOB_INT_CLEAR         1
`define IOB_INT_PEND          0

`define IOB_DISP_TYPE_HI     17
`define IOB_DISP_TYPE_LO     16
`define IOB_DISP_THR_HI      12
`define IOB_DISP_THR_LO       8
`define IOB_DISP_VEC_HI       5
`define IOB_DISP_VEC_LO       0

`define IOB_JBI_RESET         1
`define IOB_ENET_RESET        0

`define IOB_RESET_STAT_WIDTH  3
`define IOB_RESET_STAT_HI     3
`define IOB_RESET_STAT_LO     1

`define IOB_SERNUM_WIDTH     64

`define IOB_FUSE_WIDTH       22

`define IOB_TMSTAT_THERM     63

`define IOB_POR_TT            6'b01  // power-on-reset trap type

`define IOB_CPU_BUF_INDEX     4

`define IOB_INT_BUF_INDEX     4  
`define IOB_INT_BUF_WIDTH   153  // interrupt table read result buffer width

`define IOB_IO_BUF_INDEX      4
`define IOB_IO_BUF_WIDTH    153  // io-2-cpu return buffer width

`define IOB_L2_VIS_BUF_INDEX  5
`define IOB_L2_VIS_BUF_WIDTH 48  // l2 visibility buffer width

`define IOB_INT_AVEC_WIDTH   16  // availibility vector width
`define IOB_ACK_AVEC_WIDTH   16  // availibility vector width 

// fixme - double check address mapping
// CREG in `IOB_INT_CSR space
`define IOB_DEV_ADDR_MASK    32'hfffffe07
`define IOB_CREG_INTSTAT     32'h00000000
`define IOB_CREG_MDATA0      32'h00000400
`define IOB_CREG_MDATA1      32'h00000500
`define IOB_CREG_MBUSY       32'h00000900
`define IOB_THR_ADDR_MASK    32'hffffff07
`define IOB_CREG_MDATA0_ALIAS 32'h00000600
`define IOB_CREG_MDATA1_ALIAS 32'h00000700
`define IOB_CREG_MBUSY_ALIAS  32'h00000b00

// CREG in `IOB_MAN_CSR space
`define IOB_CREG_INTMAN      32'h00000000
`define IOB_CREG_INTCTL      32'h00000400
`define IOB_CREG_INTVECDISP  32'h00000800
`define IOB_CREG_RESETSTAT   32'h00000810
`define IOB_CREG_SERNUM      32'h00000820
`define IOB_CREG_TMSTATCTRL  32'h00000828
`define IOB_CREG_COREAVAIL   32'h00000830
`define IOB_CREG_SSYSRESET   32'h00000838
`define IOB_CREG_FUSESTAT    32'h00000840
`define IOB_CREG_JINTV       32'h00000a00

`define IOB_CREG_DBG_L2VIS_CTRL    32'h00001800 
`define IOB_CREG_DBG_L2VIS_MASKA   32'h00001820 
`define IOB_CREG_DBG_L2VIS_MASKB   32'h00001828 
`define IOB_CREG_DBG_L2VIS_CMPA    32'h00001830
`define IOB_CREG_DBG_L2VIS_CMPB    32'h00001838
`define IOB_CREG_DBG_L2VIS_TRIG    32'h00001840
`define IOB_CREG_DBG_IOBVIS_CTRL   32'h00001000
`define IOB_CREG_DBG_ENET_CTRL     32'h00002000
`define IOB_CREG_DBG_ENET_IDLEVAL  32'h00002008
`define IOB_CREG_DBG_JBUS_CTRL     32'h00002100
`define IOB_CREG_DBG_JBUS_LO_MASK0 32'h00002140
`define IOB_CREG_DBG_JBUS_LO_MASK1 32'h00002160
`define IOB_CREG_DBG_JBUS_LO_CMP0  32'h00002148
`define IOB_CREG_DBG_JBUS_LO_CMP1  32'h00002168
`define IOB_CREG_DBG_JBUS_LO_CNT0  32'h00002150
`define IOB_CREG_DBG_JBUS_LO_CNT1  32'h00002170
`define IOB_CREG_DBG_JBUS_HI_MASK0 32'h00002180
`define IOB_CREG_DBG_JBUS_HI_MASK1 32'h000021a0
`define IOB_CREG_DBG_JBUS_HI_CMP0  32'h00002188
`define IOB_CREG_DBG_JBUS_HI_CMP1  32'h000021a8
`define IOB_CREG_DBG_JBUS_HI_CNT0  32'h00002190
`define IOB_CREG_DBG_JBUS_HI_CNT1  32'h000021b0

`define IOB_CREG_TESTSTUB    32'h80000000

// Address map for TAP access of SPARC ASI
`define IOB_ASI_PC            4'b0000
`define IOB_ASI_BIST          4'b0001
`define IOB_ASI_MARGIN        4'b0010
`define IOB_ASI_DEFEATURE     4'b0011
`define IOB_ASI_L1DD          4'b0100
`define IOB_ASI_L1ID          4'b0101
`define IOB_ASI_L1DT          4'b0110

`define IOB_INT               2'b00
`define IOB_RESET             2'b01
`define IOB_IDLE              2'b10
`define IOB_RESUME            2'b11

//
// CIOP UCB Bus Width
// ==================
//
`define IOB_EECU_WIDTH       16  // ethernet egress command
`define EECU_IOB_WIDTH       16

`define IOB_NRAM_WIDTH       16  // NRAM (RLDRAM previously)
`define NRAM_IOB_WIDTH        4

`define IOB_JBI_WIDTH        16  // JBI
`define JBI_IOB_WIDTH        16 

`define IOB_ENET_ING_WIDTH   32  // ethernet ingress
`define ENET_ING_IOB_WIDTH    8

`define IOB_ENET_EGR_WIDTH    4  // ethernet egress
`define ENET_EGR_IOB_WIDTH    4

`define IOB_ENET_MAC_WIDTH    4  // ethernet MAC
`define ENET_MAC_IOB_WIDTH    4

`define IOB_DRAM_WIDTH        4  // DRAM controller
`define DRAM_IOB_WIDTH        4

`define IOB_BSC_WIDTH         4  // BSC
`define BSC_IOB_WIDTH         4

`define IOB_SPI_WIDTH         4  // SPI (Boot ROM)
`define SPI_IOB_WIDTH         4

`define IOB_CLK_WIDTH         4  // clk unit
`define CLK_IOB_WIDTH         4

`define IOB_CLSP_WIDTH        4  // clk spine unit
`define CLSP_IOB_WIDTH        4

`define IOB_TAP_WIDTH         8  // TAP
`define TAP_IOB_WIDTH         8


//
// CIOP UCB Buf ID Type
// ====================
//
`define UCB_BID_CMP          2'b00
`define UCB_BID_TAP          2'b01

//
// Interrupt Device ID
// ===================
//
// Caution: DUMMY_DEV_ID has to be 9 bit wide
//          for fields to line up properly in the IOB.
`define DUMMY_DEV_ID         9'h10   // 16
`define UNCOR_ECC_DEV_ID     7'd17   // 17

//
// Soft Error related definitions 
// ==============================
//
`define COR_ECC_CNT_WIDTH   16


//
// CMP clock
// =========
//

`define CMP_CLK_PERIOD   1333


//
// NRAM/IO Interface
// =================
//

`define DRAM_CLK_PERIOD  6000

`define NRAM_IO_DQ_WIDTH   32
`define IO_NRAM_DQ_WIDTH   32

`define NRAM_IO_ADDR_WIDTH 15
`define NRAM_IO_BA_WIDTH    2


//
// NRAM/ENET Interface
// ===================
//

`define NRAM_ENET_DATA_WIDTH 64
`define ENET_NRAM_ADDR_WIDTH 20

`define NRAM_DBG_DATA_WIDTH  40


//
// IO/FCRAM Interface
// ==================
//

`define FCRAM_DATA1_HI       63
`define FCRAM_DATA1_LO       32
`define FCRAM_DATA0_HI       31
`define FCRAM_DATA0_LO        0

//
// PCI Interface
// ==================
// Load/store size encodings
// -------------------------
// Size encoding
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
// 100 - quad
`define LDST_SZ_BYTE        3'b000
`define LDST_SZ_HALF_WORD   3'b001
`define LDST_SZ_WORD        3'b010
`define LDST_SZ_DOUBLE_WORD 3'b011
`define LDST_SZ_QUAD        3'b100

//
// JBI<->SCTAG Interface
// =======================
// Outbound Header Format
`define JBI_BTU_OUT_ADDR_LO      0
`define JBI_BTU_OUT_ADDR_HI     42
`define JBI_BTU_OUT_RSV0_LO     43
`define JBI_BTU_OUT_RSV0_HI     43
`define JBI_BTU_OUT_TYPE_LO     44
`define JBI_BTU_OUT_TYPE_HI     48
`define JBI_BTU_OUT_RSV1_LO     49
`define JBI_BTU_OUT_RSV1_HI     51
`define JBI_BTU_OUT_REPLACE_LO  52
`define JBI_BTU_OUT_REPLACE_HI  56
`define JBI_BTU_OUT_RSV2_LO     57
`define JBI_BTU_OUT_RSV2_HI     59
`define JBI_BTU_OUT_BTU_ID_LO   60
`define JBI_BTU_OUT_BTU_ID_HI   71
`define JBI_BTU_OUT_DATA_RTN    72
`define JBI_BTU_OUT_RSV3_LO     73
`define JBI_BTU_OUT_RSV3_HI     75
`define JBI_BTU_OUT_CE          76
`define JBI_BTU_OUT_RSV4_LO     77
`define JBI_BTU_OUT_RSV4_HI     79
`define JBI_BTU_OUT_UE          80
`define JBI_BTU_OUT_RSV5_LO     81
`define JBI_BTU_OUT_RSV5_HI     83
`define JBI_BTU_OUT_DRAM        84
`define JBI_BTU_OUT_RSV6_LO     85
`define JBI_BTU_OUT_RSV6_HI    127

// Inbound Header Format
`define JBI_SCTAG_IN_ADDR_LO   0
`define JBI_SCTAG_IN_ADDR_HI  39
`define JBI_SCTAG_IN_SZ_LO    40
`define JBI_SCTAG_IN_SZ_HI    42
`define JBI_SCTAG_IN_RSV0     43
`define JBI_SCTAG_IN_TAG_LO   44
`define JBI_SCTAG_IN_TAG_HI   55
`define JBI_SCTAG_IN_REQ_LO   56
`define JBI_SCTAG_IN_REQ_HI   58
`define JBI_SCTAG_IN_POISON   59
`define JBI_SCTAG_IN_RSV1_LO  60
`define JBI_SCTAG_IN_RSV1_HI  63

`define JBI_SCTAG_REQ_WRI   3'b100
`define JBI_SCTAG_REQ_WR8   3'b010
`define JBI_SCTAG_REQ_RDD   3'b001
`define JBI_SCTAG_REQ_WRI_BIT 2
`define JBI_SCTAG_REQ_WR8_BIT 1
`define JBI_SCTAG_REQ_RDD_BIT 0

//
// JBI->IOB Mondo Header Format
// ============================
//
`define JBI_IOB_MONDO_RSV1_HI       15 // reserved 1
`define JBI_IOB_MONDO_RSV1_LO       13
`define JBI_IOB_MONDO_TRG_HI        12 // interrupt target
`define JBI_IOB_MONDO_TRG_LO         8 
`define JBI_IOB_MONDO_RSV0_HI        7 // reserved 0
`define JBI_IOB_MONDO_RSV0_LO        5
`define JBI_IOB_MONDO_SRC_HI         4 // interrupt source
`define JBI_IOB_MONDO_SRC_LO         0

`define JBI_IOB_MONDO_RSV1_WIDTH     3 
`define JBI_IOB_MONDO_TRG_WIDTH      5
`define JBI_IOB_MONDO_RSV0_WIDTH     3 
`define JBI_IOB_MONDO_SRC_WIDTH      5

// JBI->IOB Mondo Bus Width/Cycle
// ==============================
// Cycle  1 Header[15:8]
// Cycle  2 Header[ 7:0]
// Cycle  3 J_AD[127:120]
// Cycle  4 J_AD[119:112]
// .....
// Cycle 18 J_AD[  7:  0]
`define JBI_IOB_MONDO_BUS_WIDTH      8
`define JBI_IOB_MONDO_BUS_CYCLE     18 // 2 header + 16 data


 

`define	IQ_SIZE	8
`define	OQ_SIZE	12
`define	TAG_WIDTH	28
`define	TAG_WIDTH_LESS1	27
`define	TAG_WIDTHr	28r
`define	TAG_WIDTHc	28c
`define	TAG_WIDTH6	22
`define	TAG_WIDTH6r	22r
`define	TAG_WIDTH6c	22c


`define	MBD_WIDTH	106    // BS and SR 11/12/03 N2 Xbar Packet format change

// BS and SR 11/12/03 N2 Xbar Packet format change

`define	MBD_ECC_HI	105
`define	MBD_ECC_HI_PLUS1	106
`define	MBD_ECC_HI_PLUS5	110
`define	MBD_ECC_LO	100
`define	MBD_EVICT	99 
`define	MBD_DEP		98
`define	MBD_TECC	97
`define	MBD_ENTRY_HI	96
`define	MBD_ENTRY_LO	93

`define	MBD_POISON	92   
`define	MBD_RDMA_HI	91
`define	MBD_RDMA_LO	90
`define	MBD_RQ_HI	89
`define	MBD_RQ_LO	85
`define	MBD_NC		84
`define	MBD_RSVD	83
`define	MBD_CP_HI	82
`define	MBD_CP_LO	80
`define	MBD_TH_HI	79
`define	MBD_TH_LO	77
`define	MBD_BF_HI	76
`define	MBD_BF_LO	74
`define	MBD_WY_HI	73
`define	MBD_WY_LO	72
`define	MBD_SZ_HI	71
`define	MBD_SZ_LO	64
`define	MBD_DATA_HI	63
`define	MBD_DATA_LO	0

// BS and SR 11/12/03 N2 Xbar Packet format change
`define	L2_FBF		40
`define	L2_MBF		39
`define	L2_SNP		38
`define	L2_CTRUE	37
`define	L2_EVICT  	36
`define	L2_DEP		35
`define	L2_TECC		34
`define	L2_ENTRY_HI	33
`define	L2_ENTRY_LO	29

`define	L2_POISON	28
`define	L2_RDMA_HI	27
`define	L2_RDMA_LO	26
// BS and SR 11/12/03 N2 Xbar Packet format change , maps to bits [128:104] of PCXS packet , ther than RSVD bit
`define	L2_RQTYP_HI	25
`define	L2_RQTYP_LO	21
`define	L2_NC		20
`define	L2_RSVD		19
`define	L2_CPUID_HI	18
`define	L2_CPUID_LO	16
`define	L2_TID_HI	15	
`define	L2_TID_LO	13	
`define	L2_BUFID_HI     12	
`define	L2_BUFID_LO	10	
`define	L2_L1WY_HI	9
`define	L2_L1WY_LO	8
`define	L2_SZ_HI	7
`define	L2_SZ_LO	0


`define	ERR_MEU		63
`define	ERR_MEC		62
`define	ERR_RW		61
`define	ERR_ASYNC	60
`define	ERR_TID_HI	59 // PRM needs to change to reflect this : TID will be bits [59:54] instead of [58:54]
`define	ERR_TID_LO	54
`define	ERR_LDAC	53
`define	ERR_LDAU	52
`define	ERR_LDWC	51
`define	ERR_LDWU	50
`define	ERR_LDRC	49
`define	ERR_LDRU	48
`define	ERR_LDSC	47
`define	ERR_LDSU	46
`define	ERR_LTC		45
`define	ERR_LRU		44
`define	ERR_LVU		43
`define	ERR_DAC		42
`define	ERR_DAU		41
`define	ERR_DRC		40
`define	ERR_DRU		39
`define	ERR_DSC		38
`define	ERR_DSU		37
`define	ERR_VEC		36
`define	ERR_VEU		35
`define ERR_LVC         34
`define	ERR_SYN_HI	31
`define	ERR_SYN_LO	0



`define ERR_MEND	51
`define ERR_NDRW	50
`define ERR_NDSP	49
`define ERR_NDDM	48
`define ERR_NDVCID_HI   45
`define ERR_NDVCID_LO   40
`define ERR_NDADR_HI    39
`define ERR_NDADR_LO    4


//  Phase 2 : SIU Inteface and format change

`define	JBI_HDR_SZ	26 // BS and SR 11/12/03 N2 Xbar Packet format change
`define	JBI_HDR_SZ_LESS1	25 // BS and SR 11/12/03 N2 Xbar Packet format change
`define	JBI_HDR_SZ4     23	
`define	JBI_HDR_SZc	27c
`define	JBI_HDR_SZ4c    23c	

`define	JBI_ADDR_LO	0	
`define	JBI_ADDR_HI	7	
`define	JBI_SZ_LO	8	
`define	JBI_SZ_HI	15	
// `define	JBI_RSVD	16	NOt used
`define	JBI_CTAG_LO	16	
`define	JBI_CTAG_HI	23	
`define	JBI_RQ_RD	24	
`define	JBI_RQ_WR8	25	
`define	JBI_RQ_WR64	26	
`define JBI_OPES_LO	27	// 0 = 30, P=29, E=28, S=27
`define JBI_OPES_HI	30
`define	JBI_RQ_POISON	31	
`define	JBI_ENTRY_LO	32
`define	JBI_ENTRY_HI	33

//  Phase 2 : SIU Inteface and format change
// BS and SR 11/12/03 N2 Xbar Packet format change :
`define	JBINST_SZ_LO	0	
`define	JBINST_SZ_HI	7	
// `define	JBINST_RSVD	8 NOT used	
`define	JBINST_CTAG_LO	8	
`define	JBINST_CTAG_HI	15	
`define	JBINST_RQ_RD	16	
`define	JBINST_RQ_WR8	17	
`define	JBINST_RQ_WR64	18	
`define JBINST_OPES_LO  19	// 0 = 22, P=21, E=20, S=19
`define JBINST_OPES_HI  22
`define	JBINST_ENTRY_LO	23
`define	JBINST_ENTRY_HI	24
`define	JBINST_POISON   25


`define	ST_REQ_ST	1
`define	LD_REQ_ST	2
`define	IDLE	0


 
module l2t (
  vnw_ary, 
  l2t_cpx_req_cq, 
  l2t_cpx_atom_cq, 
  l2t_cpx_data_ca, 
  l2t_pcx_stall_pq, 
  pcx_l2t_data_rdy_px1, 
  pcx_l2t_data_px2, 
  pcx_l2t_atm_px1, 
  cpx_l2t_grant_cx, 
  ncu_l2t_pm, 
  ncu_l2t_ba01, 
  ncu_l2t_ba23, 
  ncu_l2t_ba45, 
  ncu_l2t_ba67, 
  ncu_spc0_core_enable_status, 
  ncu_spc1_core_enable_status, 
  ncu_spc2_core_enable_status, 
  ncu_spc3_core_enable_status, 
  ncu_spc4_core_enable_status, 
  ncu_spc5_core_enable_status, 
  ncu_spc6_core_enable_status, 
  ncu_spc7_core_enable_status, 
  l2d_l2t_decc_c6, 
  l2t_l2d_way_sel_c2, 
  l2t_l2d_rd_wr_c2, 
  l2t_l2d_set_c2, 
  l2t_l2d_col_offset_c2, 
  l2t_l2d_word_en_c2, 
  l2t_l2d_fbrd_c3, 
  l2t_l2d_fb_hit_c3, 
  l2t_l2d_stdecc_c2, 
  l2t_l2b_fbrd_en_c3, 
  l2t_l2b_fbrd_wl_c3, 
  l2t_l2b_fbwr_wen_r2, 
  l2t_l2b_fbwr_wl_r2, 
  l2t_l2b_fbd_stdatasel_c3, 
  l2t_l2b_wbwr_wen_c6, 
  l2t_l2b_wbwr_wl_c6, 
  l2t_l2b_wbrd_en_r0, 
  l2t_l2b_wbrd_wl_r0, 
  l2t_l2b_ev_dword_r0, 
  l2t_l2b_evict_en_r0, 
  l2b_l2t_ev_uerr_r5, 
  l2b_l2t_ev_cerr_r5, 
  l2t_l2b_rdma_wren_s2, 
  l2t_l2b_rdma_wrwl_s2, 
  l2t_l2b_rdma_rdwl_r0, 
  l2t_l2b_rdma_rden_r0, 
  l2t_l2b_ctag_en_c7, 
  l2t_l2b_ctag_c7, 
  l2t_l2b_word_c7, 
  l2t_l2b_req_en_c7, 
  l2t_l2b_word_vld_c7, 
  l2t_rst_fatal_error, 
  l2b_l2t_rdma_uerr_c10, 
  l2b_l2t_rdma_cerr_c10, 
  l2b_l2t_rdma_notdata_c10, 
  l2t_mcu_rd_req, 
  l2t_mcu_rd_dummy_req, 
  l2t_mcu_rd_req_id, 
  l2t_mcu_addr, 
  l2t_mcu_addr_5, 
  l2t_mcu_wr_req, 
  mcu_l2t_rd_ack, 
  mcu_l2t_wr_ack, 
  mcu_l2t_chunk_id_r0, 
  mcu_l2t_data_vld_r0, 
  mcu_l2t_rd_req_id_r0, 
  mcu_l2t_secc_err_r2, 
  mcu_l2t_mecc_err_r2, 
  mcu_l2t_scb_mecc_err, 
  mcu_l2t_scb_secc_err, 
  scan_in, 
  l2t_siu_delay, 
  sii_l2t_req_vld, 
  sii_l2t_req, 
  sii_l2b_ecc, 
  l2t_sii_iq_dequeue, 
  l2t_sii_wib_dequeue, 
  gclk, 
  rst_por_, 
  rst_wmr_, 
  rst_wmr_protect, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_muxtest, 
  tcu_dectest, 
  ccu_slow_cmp_sync_en, 
  ccu_cmp_slow_sync_en, 
  tcu_atpg_mode, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  tcu_array_wr_inhibit, 
  tcu_array_bypass, 
  scan_out, 
  cluster_arst_l, 
  l2t_dbg_sii_iq_dequeue, 
  l2t_dbg_sii_wib_dequeue, 
  l2t_dbg_xbar_vcid, 
  l2t_dbg_err_event, 
  l2t_dbg_pa_match, 
  efu_l2t_fuse_clr, 
  efu_l2t_fuse_xfer_en, 
  efu_l2t_fuse_data, 
  l2t_efu_fuse_data, 
  l2t_efu_fuse_xfer_en, 
  tcu_mbist_bisi_en, 
  tcu_l2t_mbist_start, 
  tcu_l2t_mbist_scan_in, 
  tcu_mbist_user_mode, 
  l2t_tcu_mbist_done, 
  l2t_tcu_mbist_fail, 
  l2t_tcu_mbist_scan_out, 
  l2t_rep_in0, 
  l2t_rep_in1, 
  l2t_rep_in2, 
  l2t_rep_in3, 
  l2t_rep_in4, 
  l2t_rep_in5, 
  l2t_rep_in6, 
  l2t_rep_in7, 
  l2t_rep_in8, 
  l2t_rep_in9, 
  l2t_rep_in10, 
  l2t_rep_in11, 
  l2t_rep_in12, 
  l2t_rep_in13, 
  l2t_rep_in14, 
  l2t_rep_in15, 
  l2t_rep_in16, 
  l2t_rep_in17, 
  l2t_rep_in18, 
  l2t_rep_in19, 
  l2t_rep_out0, 
  l2t_rep_out1, 
  l2t_rep_out2, 
  l2t_rep_out3, 
  l2t_rep_out4, 
  l2t_rep_out5, 
  l2t_rep_out6, 
  l2t_rep_out7, 
  l2t_rep_out8, 
  l2t_rep_out9, 
  l2t_rep_out10, 
  l2t_rep_out11, 
  l2t_rep_out12, 
  l2t_rep_out13, 
  l2t_rep_out14, 
  l2t_rep_out15, 
  l2t_rep_out16, 
  l2t_rep_out17, 
  l2t_rep_out18, 
  l2t_rep_out19, 
  l2t_lstg_in, 
  l2t_rstg_in, 
  l2t_lstg_out, 
  l2t_rstg_out, 
  tcu_l2t_shscan_scan_in, 
  tcu_l2t_shscan_aclk, 
  tcu_l2t_shscan_bclk, 
  tcu_l2t_shscan_scan_en, 
  tcu_l2t_shscan_pce_ov, 
  tcu_l2t_shscan_clk_stop, 
  l2t_tcu_shscan_scan_out, 
  tcu_l2t_coresel, 
  tcu_l2t_tag_or_data_sel, 
  l2t_tcu_dmo_out_prev, 
  l2t_tcu_dmo_out) ;
wire array_wr_inhibit;
wire l2t_clk_header_scanin;
wire l2t_clk_header_scanout;
wire aclk;
wire bclk;
wire ce_ovrd;
wire wmr_protect;
wire wmr_l;
wire aclk_wmr;
wire por_l;
wire cmp_io_sync_en;
wire io_cmp_sync_en;
wire vuad_scanin;
wire vuad_scanout;
wire arbadr_idx_c1c2comp_c1_n;
wire arbadr_idx_c1c3comp_c1_n;
wire arbadr_idx_c1c4comp_c1_n;
wire arbadr_idx_c1c5comp_c1_n;
wire [1:0] vlddir_vd_ce_c2;
wire vuadpm_scanin;
wire vuadpm_scanout;
wire usaloc_vlddir_arb_vuad_ce_err_c3_rep1_v1;
wire [15:0] tag_hit_way_vld_c3_rep2;
wire vlddir_scanin;
wire vlddir_scanout;
wire [15:0] tagdp_lru_way_sel_c3_rep2;
wire tagdp_evict_c3_2_rep1;
wire tag_st_to_data_array_c3_rep1;
wire usaloc_vlddir_arb_vuad_ce_err_c3_rep1_v2;
wire [15:0] tag_hit_way_vld_c3_rep20;
wire usaloc_scanin;
wire usaloc_scanout;
wire [15:0] tagdp_lru_way_sel_c3_rep20;
wire tagdp_evict_c3_1_rep1;
wire [8:0] tagd_arbdp_tag_idx_px2_buf_1;
wire [8:0] tagd_arbdp_tag_idx_px2_buf_2;
wire tag_scanin;
wire tag_scanout;
wire [6:0] l2t_tag_rvalue;
wire [3:0] l2t_tag_rid;
wire l2t_tag_wr_en;
wire l2t_tag_fuse_clr;
wire mbist_run;
wire [5:0] tag_fuse_read_data;
wire [27:0] tag_way12_tag_c2;
wire [27:0] tag_way13_tag_c2;
wire [27:0] tag_way14_tag_c2;
wire [27:0] tag_way15_tag_c2;
wire tagl_1_scanin;
wire tagl_1_scanout;
wire tagl_2_scanin;
wire tagl_2_scanout;
wire tagdp_evict_c3_1;
wire tagdp_evict_c3_2;
wire [15:0] tag_way_sel_c2_buff;
wire tagctl_arb_vuad_ce_err_c3;
wire arb_pf_ice_inst_c2;
wire [15:0] vlddir_vuad_valid_c2_rep1;
wire [3:0] arbdp_diag_wr_way_c2;
wire tagdp_scanin;
wire tagdp_scanout;
wire [27:0] tagd_evict_tag_c3;
wire [27:0] tagd_dmo_evict_tag_c4;
wire arbadr_tagd_2bnk_true_enbld_dist;
wire arbadr_tagd_4bnk_true_enbld_dist;
wire arbadr_tagd_ncu_l2t_pm_n_dist;
wire tagd_scanin;
wire tagd_scanout;
wire [38:0] l2t_tcu_dmo_out_unbuff;
wire [38:0] l2t_tcu_dmo_out_prev_buff;
wire dmologic_scanin;
wire dmologic_scanout;
wire tcu_l2t_shscan_clk_stop_d2;
wire mbist_start_mb0;
wire mbist_start_mb2;
wire l2t_tcu_mbist0_done;
wire l2t_tcu_mbist2_done;
wire l2t_tcu_mbist0_fail;
wire l2t_tcu_mbist2_fail;
wire [7:0] mbist_write_data_decck;
wire tcu_l2t_mbist_scan_in1;
wire [27:0] mbist_tag_lkup_addr;
wire tagctl_scanin;
wire tagctl_scanin_1;
wire misbuf_tag_hit_unqual_c2_rep2;
wire arb_inst_vld_c2_prev;
wire [1:0] filbuf_dis_nderr_c3;
wire misbuf_arb_hit_c3;
wire filbuf_match_c3;
wire misbuf_tag_hit_unqual_c2_rep1;
wire misbuf_notdata_err_c2_rep1;
wire filbuf_tag_tag_hit_frm_mb_c2_rep;
wire [3:0] filbuf_tag_evict_way_c3_rep1;
wire filbuf_dis_cerr_c3_rep1;
wire filbuf_dis_uerr_c3_rep1;
wire tagctl_scanout;
wire l2t_mb2_mbdata_wr_en;
wire l2t_mb2_mbdata_rd_en;
wire l2t_mb2_mbtag_rd_en;
wire l2t_mb2_mbtag_wr_en;
wire [4:0] l2t_mb2_addr;
wire arb_vuad_ce_err_c2;
wire misbuf_vuad_ce_instr_c2;
wire mb_mbist_cam_hit;
wire [3:0] mbist_cam_sel;
wire misbuf_vuad_ce_err_c8;
wire misbuf_notdata_err_c2;
wire misbuf_vuad_ce_err_c6;
wire arbdec_arbdp_inst_bufidhi_c8;
wire deccck_notdata_err_c8;
wire tag_miss_unqual_c2_rep1;
wire tag_misbuf_rdma_reg_vld_c2_rep1a;
wire arb_pf_ice_inst_c7;
wire arbadr_misbuf_idx_c1c2comp_c1;
wire arbadr_misbuf_idx_c1c3comp_c1;
wire filbuf_misbuf_tag_hit_frm_mb_c2;
wire misbuf_scanin;
wire misbuf_scanout;
wire [127:64] mbdata_din;
wire mbdata_scanin;
wire mbdata_scanout;
wire [41:7] arbadr_mbcam_addr_px2_buff;
wire mbtag_scanin;
wire mbtag_scanout;
wire l2t_mb2_fbtag_wr_en;
wire l2t_mb2_fbtag_rd_en;
wire fb_mbist_cam_hit;
wire [110:83] mb_data_read_data_rep;
wire filbuf_arb_tag_hit_frm_mb_c2;
wire rdmat_rdmard_notdata_c12;
wire tag_misbuf_rdma_reg_vld_c2_rep1b;
wire deccck_bscd_notdata_err_c8;
wire arb_fill_vld_c2_rep1;
wire tag_rdma_gate_off_c2_rep1;
wire filbuf_scanin;
wire filbuf_scanout;
wire [7:0] fb_match_idx_unused;
wire [39:0] fbtag_din;
wire arb_inst_vld_c1_v1;
wire fbtag_scanin;
wire fbtag_scanout;
wire [3:0] mbdata_cmp_sel;
wire [7:0] l2t_mb2_wdata;
wire arb_arbdat_mux2_snpsel_px2;
wire arb_arbdat_mux3_bufsel_px2;
wire arb_arbdat_mux4_c1sel_px2;
wire arbdat_scanin;
wire arbdat_scanout;
wire l2t_mb2_run;
wire [33:2] arbadr_csr_debug_addr;
wire arbadr_dirvec_2bnk_true_enbld_dist;
wire arbadr_dirvec_4bnk_true_enbld_dist;
wire arbadr_dirvec_ncu_l2t_pm_n_dist;
wire arbadr_evctag_2bnk_true_enbld_dist;
wire arbadr_evctag_4bnk_true_enbld_dist;
wire arbadr_evctag_ncu_l2t_pm_n_dist;
wire arbadr_arbctl_2bnk_true_enbld_dist;
wire arbadr_arbctl_4bnk_true_enbld_dist;
wire arbadr_arbctl_ncu_l2t_pm_n_dist;
wire [39:4] arbdp_csr_addr_c9;
wire mb2_l2t_wk1_cam_init;
wire mb2_l2t_wk1_cam_shift;
wire arb_arbadr_mux2_snpsel_px2;
wire arb_mux3_bufsel_px1;
wire arb_arbadr_mux4_c1sel_px2;
wire arbadr_scanin;
wire arbadr_scanout;
wire arb_dc_ic_rd_bit_4;
wire arb_arbdec_mux2_snpsel_px2;
wire arb_arbdec_mux3_bufsel_px2;
wire arb_arbdec_mux4_c1sel_px2;
wire arb_dc_evict_c4;
wire arb_ic_evict_c4;
wire arb_inval_inst_vld_c3;
wire ique_arb_pf_ice_px2;
wire filbuf_arb_tag_hit_frm_mb_c2_rep;
wire usaloc_vlddir_arb_vuad_ce_err_c3;
wire l2t_mb2_mbtag_lookup_en;
wire l2t_mb2_fbtag_lookup_en;
wire l2t_mb2_wbtag_lookup_en;
wire l2t_mb2_rdmatag_lookup_en;
wire arbdec_arbdp_inst_rsvd_c1_1;
wire arb_scanin;
wire arb_scanout;
wire [5:0] l2t_dbg_xbar_vcid_transfer;
wire arbdec_scanin;
wire arbdec_scanout_1;
wire arbdec_scanout;
wire l2t_mb2_rdmatag_rd_en;
wire l2t_mb2_wbtag_wr_en;
wire l2t_mb2_wbtag_rd_en;
wire wb_mbist_cam_hit;
wire wbuf_scanin;
wire wbuf_scanout;
wire [7:0] wb_match_idx_unused;
wire arb_inst_vld_c1_v2;
wire wbtag_scanin;
wire wbtag_scanout;
wire iqu_fail_reg;
wire ique_pcx_l2t_data_103_px2;
wire ique_scanin;
wire ique_scanout;
wire iqu_hold_rd_n;
wire l2t_mb2_iqarray_wr_en;
wire l2t_mb2_iqarray_rd_en;
wire iqu_scanin;
wire iqu_scanout;
wire [129:0] pcx_l2t_data_px2_fnl;
wire iqarray_scanin;
wire iqarray_scanout;
wire [3:0] dirrep_dc_lkup_row_dec_c4;
wire [5:0] l2t_mb0_addr;
wire oqu_scanin;
wire oqu_scanout;
wire oqarray_scanin;
wire oqarray_scanout;
wire [7:0] mb0_l2t_mbist_write_data;
wire l2t_mb0_run;
wire oqarray_rw_fail;
wire [3:0] mbist_oqarray_sel;
wire csr_report_ldrc;
wire [127:0] decc_ret_data_c7;
wire [5:4] arbadr_arbdp_line_addr_c7;
wire oque_scanin;
wire oque_scanout;
wire [1:0] ic_cam_fail;
wire [1:0] dc_cam_fail;
wire mb0_l2t_cambist;
wire dirvec_scanin;
wire dirvec_scanout;
wire [3:0] deccck_muxsel_diag_out_c7;
wire deccck_spcd_notdata_err_c8;
wire deccck_scanin;
wire deccck_scanout;
wire decc_scanin;
wire decc_scanout;
wire [63:0] shadow_error_status_reg;
wire [51:4] shadow_notdata_reg;
wire [39:4] shadow_l2erraddr_reg;
wire csreg_l2_cmpr_reg_wr_en_c8;
wire csreg_l2_mask_reg_wr_en_c8;
wire csr_error_status_notdata;
wire csreg_notdata_error_rw_en;
wire csreg_csr_notdata_wr_en_c8;
wire csreg_wr_enable_notdata_vcid_c9;
wire csreg_csr_notdata_vcid_wr_en;
wire csreg_notdata_err_state_in_rw;
wire csreg_notdata_err_state_in_mend;
wire [49:48] csreg_notdata_err_state_in;
wire csreg_notdata_diag_wr_en;
wire csreg_csr_notdata_addr_wr_en;
wire csr_scanin;
wire csr_scanout;
wire [1:0] csreg_csr_rd_mux4_sel_c7;
wire [1:0] csreg_csr_rd_mux_fnl_c7;
wire csreg_scanin;
wire csreg_scanout;
wire l2t_dbg_sii_iq_dequeue_unreg;
wire snp_scanin;
wire snp_scanout;
wire snpd_scanin;
wire snpd_scanout;
wire [6:0] arbdec_snpd_ecc_c8;
wire cam_mb2_rw_fail;
wire evctag_scanin;
wire evctag_scanout;
wire [7:0] rd_match_idx_unused;
wire arb_inst_vld_c1_v3;
wire rdmatag_scanin;
wire rdmatag_scanout;
wire rdmarpt_scanout;
wire rdma_mbist_cam_hit;
wire rdmat_scanout;
wire dirrep_dir_wr_par_c4;
wire arbadr_arbdp_addr4_c4;
wire arbadr_arbdp_dc_addr4_c4;
wire arbadr_arbdp_ic_addr4_c4;
wire arbadr_arbdp_index_ic_addr4_c4;
wire arbadr_arbdp_index_dc_addr4_c4;
wire dirrep_scanin;
wire dirrep_scanout;
wire [3:0] subarray_0_unused;
wire subarray_0_scanin;
wire subarray_0_scanout;
wire [3:0] subarray_1_unused;
wire subarray_1_scanin;
wire subarray_1_scanout;
wire [3:0] subarray_2_unused;
wire subarray_2_scanin;
wire subarray_2_scanout;
wire [3:0] subarray_3_unused;
wire subarray_3_scanin;
wire subarray_3_scanout;
wire [3:0] subarray_8_unused;
wire subarray_8_scanin;
wire subarray_8_scanout;
wire [3:0] subarray_9_unused;
wire subarray_9_scanin;
wire subarray_9_scanout;
wire [3:0] subarray_10_unused;
wire subarray_10_scanin;
wire subarray_10_scanout;
wire [3:0] subarray_11_unused;
wire subarray_11_scanin;
wire subarray_11_scanout;
wire ic_row0_scanin;
wire ic_row0_scanout;
wire ic_force_hit_row0_c4;
wire out_col0_scanin;
wire out_col0_scanout;
wire [2:0] out_col0_dirout_parity_vld_out_unused;
wire [1:0] l2t_mb0_icrow_row_en;
wire [15:0] l2t_mb0_lookup_wdata;
wire [3:0] ic_cam_read_fail;
wire ic_row0_select_panel0;
wire ic_row1_select_panel0;
wire out_col1_scanin;
wire out_col1_scanout;
wire [2:0] out_col1_dirout_parity_vld_out_unused;
wire ic_row0_select_panel1;
wire ic_row1_select_panel1;
wire out_col2_scanin;
wire out_col2_scanout;
wire [2:0] out_col2_dirout_parity_vld_out_unused;
wire [15:0] ic_rd_dataae_row1;
wire ic_row0_select_panel2;
wire ic_row1_select_panel2;
wire out_col3_scanin;
wire out_col3_scanout;
wire [15:0] ic_rd_databf_row1;
wire ic_row0_select_panel3;
wire ic_row1_select_panel3;
wire ic_row2_scanin;
wire ic_row2_scanout;
wire ic_force_hit_row2_c4;
wire dc_row0_scanin;
wire dc_row0_scanout;
wire dc_force_hit_row0_c4;
wire dc_out_col0_scanin;
wire dc_out_col0_scanout;
wire [2:0] dc_out_col0parity_vld_out_unused;
wire [1:0] l2t_mb0_dcrow_row_en;
wire [3:0] dc_cam_read_fail;
wire dc_row0_select_panel0;
wire dc_row1_select_panel0;
wire dc_out_col1_scanin;
wire dc_out_col1_scanout;
wire [2:0] dc_out_col1parity_vld_out_unused;
wire dc_row0_select_panel1;
wire dc_row1_select_panel1;
wire dc_out_col2_scanin;
wire dc_out_col2_scanout;
wire [2:0] dc_out_col2parity_vld_out_unused;
wire dc_row0_select_panel2;
wire dc_row1_select_panel2;
wire dc_out_col3_scanin;
wire dc_out_col3_scanout;
wire dc_row0_select_panel3;
wire dc_row1_select_panel3;
wire ic_row0_ctl_scanin;
wire ic_row0_ctl_scanout;
wire [7:0] l2t_mb0_mask;
wire [3:0] l2t_mb0_icrow_panel_en;
wire [3:0] l2t_mb0_icrow_lookup_en;
wire l2t_mb0_icrow_wr_en;
wire l2t_mb0_icrow_rd_en;
wire [17:9] tagd_lkup_ic_addr_c4;
wire ic_row2_ctl_scanin;
wire ic_row2_ctl_scanout;
wire dc_row0_ctl_scanin;
wire dc_row0_ctl_scanout;
wire [3:0] l2t_mb0_dcrow_panel_en;
wire [3:0] l2t_mb0_dcrow_lookup_en;
wire l2t_mb0_dcrow_wr_en;
wire l2t_mb0_dcrow_rd_en;
wire [17:9] tagd_lkup_dc_addr_c4;
wire dc_row2_ctl_scanin;
wire dc_row2_ctl_scanout;
wire dc_force_hit_row2_c4;
wire dc_row2_scanin;
wire dc_row2_scanout;
wire left_ffrptr_scanin;
wire left_ffrptr_scanout;
wire right_ffrptr_scanin;
wire right_ffrptr_scanout;
wire [12:0] mrep_besides_tagl0_unused;
wire [15:0] mrep_besides_tagl1_unused;
wire [15:0] mrep_besides_tagl2_unused;
wire [15:0] mrep_besides_tagl3_unused;
wire [15:0] mrep_besides_tagl4_unused;
wire [15:0] mrep_besides_tagl5_unused;
wire [15:0] mrep_besides_tagl6_unused;
wire [7:0] mrep_besides_mbdata1_unused;
wire [7:0] mrep_besides_mbdata2_unused;
wire [7:0] mrep_besides_mbdata3_unused;
wire [7:0] mrep_besides_mbdata4_unused;
wire [7:0] mrep_besides_mbdata5_unused;
wire [7:0] mrep_besides_mbdata6_unused;
wire [7:0] mrep_besides_mbdata7_unused;
wire [5:0] mrep_besides_mbdata15_unused;
wire [15:0] tagdp_lru_way_sel_c3_rep1;
wire [15:0] tag_hit_way_vld_c3_rep1;
wire [31:0] mrep_arbdat_top1_unused;
wire [31:0] mrep_arbdat_top2_unused;
wire [31:0] mrep_arbdat_top3_unused;
wire [31:0] mrep_arbdat_bot0_unused;
wire [31:0] mrep_arbdat_bot1_unused;
wire [19:0] mrep_arbdec_top_1_unused;
wire [31:0] mrep_arbdec_top1_unused;
wire [31:0] mrep_arbdec_top2_unused;
wire mrep_besides_arbadr_out0_unused;
wire mrep_besides_arbadr_unused;
wire [1:0] mrep_besides_arbadr11_unused;
wire [1:0] mrep_besides_arbadr12_unused;
wire [1:0] mrep_besides_arbadr13_unused;
wire [1:0] mrep_besides_arbadr14_unused;
wire [1:0] mrep_besides_arbadr15_unused;
wire [1:0] mrep_besides_arbadr16_unused;
wire [1:0] mrep_besides_arbadr17_unused;
wire [1:0] mrep_besides_arbadr18_unused;
wire [1:0] mrep_besides_arbadr19_unused;
wire [1:0] mrep_besides_arbadr20_unused;
wire [1:0] mrep_besides_arbadr21_unused;
wire [1:0] mrep_besides_arbadr22_unused;
wire [1:0] mrep_besides_arbadr23_unused;
wire [1:0] mrep_besides_arbadr24_unused;
wire [1:0] mrep_besides_arbadr25_unused;
wire [1:0] mrep_besides_arbadr26_unused;
wire [1:0] mrep_besides_arbadr27_unused;
wire [1:0] mrep_besides_arbadr28_unused;
wire [1:0] mrep_besides_arbadr29_unused;
wire [1:0] mrep_besides_arbadr30_unused;
wire [1:0] mrep_besides_arbadr31_unused;
wire [1:0] mrep_besides_arbadr32_unused;
wire [1:0] mrep_besides_arbadr33_unused;
wire [1:0] mrep_besides_arbadr34_unused;
wire [1:0] mrep_besides_arbadr35_unused;
wire [1:0] mrep_besides_arbadr36_unused;
wire [1:0] mrep_besides_arbadr37_unused;
wire [1:0] mrep_besides_arbadr38_unused;
wire [1:0] mrep_besides_arbadr39_unused;
wire [1:0] mrep_besides_arbadr40_unused;
wire [1:0] mrep_besides_arbadr41_unused;
wire [1:0] mrep_besides_arbadr42_unused;
wire [1:0] mrep_besides_arbadr43_unused;
wire [1:0] mrep_besides_arbadr44_unused;
wire [1:0] mrep_besides_arbadr45_unused;
wire [1:0] mrep_besides_arbadr46_unused;
wire [1:0] mrep_besides_arbadr47_unused;
wire [1:0] mrep_besides_arbadr48_unused;
wire [1:0] mrep_besides_arbadr49_unused;
wire [1:0] mrep_besides_arbadr50_unused;
wire [1:0] mrep_besides_arbadr51_unused;
wire [1:0] mrep_besides_arbadr52_unused;
wire [1:0] mrep_besides_arbadr53_unused;
wire [1:0] mrep_besides_arbadr54_unused;
wire [1:0] mrep_besides_arbadr55_unused;
wire [1:0] mrep_besides_arbadr56_unused;
wire [1:0] mrep_besides_arbadr57_unused;
wire [1:0] mrep_besides_arbadr58_unused;
wire [1:0] mrep_besides_arbadr59_unused;
wire [1:0] mrep_besides_arbadr60_unused;
wire [1:0] mrep_besides_arbadr61_unused;
wire [1:0] mrep_besides_arbadr62_unused;
wire [1:0] mrep_besides_arbadr63_unused;
wire [1:0] mrep_besides_arbadr64_unused;
wire [2:0] mrep_for_dir0_unused;
wire [2:0] mrep_for_dir3_unused;
wire l2t_mb2_rdmatag_wr_en;
wire mbdata_fail;
wire tcu_l2t_mbist_scan_in2;
wire l2t_mb0_oqarray_wr_en;
wire l2t_mb0_oqarray_rd_en;
wire l2tag_sram_hdr_scanin;
wire l2tag_sram_hdr_scanout;
wire rdmat_scanin;
wire vuad_usaloc_mux_used_and_alloc_comb_sel0;
wire vuad_usaloc_mux_used_and_alloc_comb_sel1;
wire vuad_usaloc_mux_used_and_alloc_comb_sel2;
wire vuad_usaloc_mux_used_and_alloc_comb_sel3;
wire vuad_usaloc_mux_used_and_alloc_comb_sel4;
wire vuad_usaloc_mux_used_and_alloc_comb_sel5;
wire mux_valid_dirty_c1_sel0;
wire mux_valid_dirty_c1_sel1;
wire mux_valid_dirty_c1_sel2;
wire [38:0] mbist_dmo_data_out;
wire arb_l2drpt_waysel_gate_c1;
wire [15:0] tagctl_l2drpt_mux4_way_sel_c1;
wire tag_data_array_wr_active_c1;
wire tag_hit_unqual_c3;
wire misbuf_uncorr_err_c1;
wire misbuf_notdata_err_c1;
wire tag_misbuf_int_ack_c3;
wire [3:0] dec_col_offset_prev_c1;
wire decdp_cas2_from_mb_ctrue_c1;
wire misbuf_vuad_ce_instr_ack_c2;
wire arb_arbdp_dword_st_c1;
wire arbdec_pf_ice_inst_c1;
wire filbuf_misbuf_ue_offmode_c7;
wire filbuf_misbuf_ce_offmode_c7;
wire arb_misbuf_inval_inst_c2;
wire mbdata_fail_bot;
wire mbist_lookupen;
wire iqu_iq_arb_vld_px2_v1;
wire arb_iqsel_px2_v1;
wire arb_snp_snpsel_px2;
wire [4:0] arbdec_csr_ttype_c6;
wire [5:0] arbdec_csr_vcid_c6;
wire wbuf_wbufrpt_leave_state0;
wire wbuf_wbufrpt_next_state_1;
wire cycle_count_less_than_7_din;
wire mcu_l2t_wr_ack_d1;
wire [2:0] rtn_err_field_c7;
wire [3:0] deccdp_decck_uncorr_err_c7;
wire [3:0] deccdp_decck_corr_err_c7;
wire csreg_report_ldrc_inpkt;
wire notdata_higher_priority_err;
wire csreg_wr_enable_notdata_nddm_vcid_c9;
wire set_async_c9;
wire error_rw_en;
wire diag_wr_en;
  

input            vnw_ary; // 2.0
////////////////////////////////////////////////////////////////////////////// 
// CCX interface 
////////////////////////////////////////////////////////////////////////////// 
 
output [7:0]     l2t_cpx_req_cq;   // l2t to processor request // 
output           l2t_cpx_atom_cq; // 
output [`CPX_WIDTH_LESS1:0]  l2t_cpx_data_ca;  // l2t to cpx data pkt // 
output           l2t_pcx_stall_pq; // l2t to pcx IQ_full stall // 
 
input		pcx_l2t_data_rdy_px1; // 
input [`PCX_WIDTH_LESS1:0]  pcx_l2t_data_px2;   // 
input		pcx_l2t_atm_px1; // 
input	[7:0]	cpx_l2t_grant_cx; // 

//////////////////////////////////////////////////////////////////////////////
// NCU interface : BS 03/25/04 for partial bank/core modes support
//////////////////////////////////////////////////////////////////////////////

input           ncu_l2t_pm;   // 0:all 8 banks available, 1:partial mode 
			      //and need to look at each *ba* signals)
input		ncu_l2t_ba01; // 0:bank0 and bank1 unavailable, 1:both banks available 
input           ncu_l2t_ba23; // 0:bank2 and bank3 unavailable, 1:both banks available
input           ncu_l2t_ba45; // 0:bank4 and bank5 unavailable, 1:both banks available
input           ncu_l2t_ba67; // 0:bank6 and bank7 unavailable, 1:both banks available

input           ncu_spc0_core_enable_status; // 0 : spc0 unavailable, 1 : available
input           ncu_spc1_core_enable_status; // 0 : spc1 unavailable, 1 : available
input           ncu_spc2_core_enable_status; // 0 : spc2 unavailable, 1 : available
input           ncu_spc3_core_enable_status; // 0 : spc3 unavailable, 1 : available
input           ncu_spc4_core_enable_status; // 0 : spc4 unavailable, 1 : available
input           ncu_spc5_core_enable_status; // 0 : spc5 unavailable, 1 : available
input           ncu_spc6_core_enable_status; // 0 : spc6 unavailable, 1 : available
input           ncu_spc7_core_enable_status; // 0 : spc7 unavailable, 1 : available


 
////////////////////////////////////////////////////////////////////////////// 
// Interface with l2d 
////////////////////////////////////////////////////////////////////////////// 
 
input [155:0]   l2d_l2t_decc_c6;    // From data of l2d_data.v // 

output	[15:0]	l2t_l2d_way_sel_c2; // 
output	      	l2t_l2d_rd_wr_c2; // 
output	[8:0]	l2t_l2d_set_c2; // 
output	[3:0]	l2t_l2d_col_offset_c2; // 
output	[15:0]	l2t_l2d_word_en_c2; // 
output          l2t_l2d_fbrd_c3;   // From arb of l2t_arb_ctl.sv // 
output          l2t_l2d_fb_hit_c3; // bypass data from Fb  // 
output [77:0]   l2t_l2d_stdecc_c2;// store data.  // 

 
////////////////////////////////////////////////////////////////////////////// 
// Interface with l2b 
////////////////////////////////////////////////////////////////////////////// 
 
//output [77:0]   l2t_l2b_stdecc_c3;// store data. staged version to l2b // 
output		l2t_l2b_fbrd_en_c3; // rd en for a fill operation or fb bypass // 
output	[2:0]	l2t_l2b_fbrd_wl_c3 ; // read entry // 
output	[15:0]	l2t_l2b_fbwr_wen_r2 ; // mcu Fill or store in OFF mode. // 
output	[2:0]	l2t_l2b_fbwr_wl_r2 ; // mcu Fill entry. // 
output		l2t_l2b_fbd_stdatasel_c3; // select store data in OFF mode // 
 
output	[3:0]	l2t_l2b_wbwr_wen_c6; // write en // 
output	[2:0]	l2t_l2b_wbwr_wl_c6; // from wbuf // 
output		l2t_l2b_wbrd_en_r0; // triggerred by a wr_ack from mcu // 
output	[2:0]	l2t_l2b_wbrd_wl_r0;  // 
 
output	[2:0]	l2t_l2b_ev_dword_r0; // 
output          l2t_l2b_evict_en_r0;// From wbuf of l2t_wbuf_ctl.sv // 
input		l2b_l2t_ev_uerr_r5; // 
input		l2b_l2t_ev_cerr_r5; // 
 
// START interface with l2b for handling rdma  reads and writes 

output	[15:0]	l2t_l2b_rdma_wren_s2; // may be all 1s // 
output	[1:0]	l2t_l2b_rdma_wrwl_s2; // 
output	[1:0]	l2t_l2b_rdma_rdwl_r0; // 
output		l2t_l2b_rdma_rden_r0; // 
 
output		l2t_l2b_ctag_en_c7 ; // 
output  [31:0]  l2t_l2b_ctag_c7 ;    //  

// RAS implementation changes 10/14/04
output	[3:0]	l2t_l2b_word_c7 ; // // 
output		l2t_l2b_req_en_c7 ;	// This signal is s one cycle pulse // 
output		l2t_l2b_word_vld_c7; // This signal is high for 16 signals. // 
output		l2t_rst_fatal_error; // Fatal error to rst block on LVU and LRU
 
input		l2b_l2t_rdma_uerr_c10; // 
input		l2b_l2t_rdma_cerr_c10; // 
input           l2b_l2t_rdma_notdata_c10; // 
 
////////////////////////////////////////////////////////////////////////////// 
// Interface with the MCU  
////////////////////////////////////////////////////////////////////////////// 
 
 
output			l2t_mcu_rd_req; // 
output			l2t_mcu_rd_dummy_req; // 
output [2:0]  		l2t_mcu_rd_req_id; // 
output [39:7] 		l2t_mcu_addr; // 
output                  l2t_mcu_addr_5;// 
output        		l2t_mcu_wr_req; // 
 
input         		mcu_l2t_rd_ack; // 
input         		mcu_l2t_wr_ack; // 
input  [1:0]   		mcu_l2t_chunk_id_r0; // 
input         		mcu_l2t_data_vld_r0; // 
input  [2:0]   		mcu_l2t_rd_req_id_r0; // 
input			mcu_l2t_secc_err_r2 ; // 
input			mcu_l2t_mecc_err_r2 ; // 
input			mcu_l2t_scb_mecc_err; // 
input			mcu_l2t_scb_secc_err; // 
input                   scan_in; // 
  
 
////////////////////////////////////////////////////////////////////////////// 
// Snoop / RDMA  interface. 
////////////////////////////////////////////////////////////////////////////// 
 
input           	l2t_siu_delay;
input			sii_l2t_req_vld ;  // 
input	[31:0]		sii_l2t_req; // 
input   [ 6:0]          sii_l2b_ecc; // RAS implementation 10/14/04
output			l2t_sii_iq_dequeue; // 
output			l2t_sii_wib_dequeue; // 
 
 
 
////////////////////////////////////////////////////////////////////////////// 
// Global IOs 
////////////////////////////////////////////////////////////////////////////// 
input   	gclk;   // clock from global distribution
input   	rst_por_;  // power-on, from RST
input   	rst_wmr_;  // warm-reset, from RST
input   	rst_wmr_protect;  // warm-reset, from RST
input   	tcu_pce_ov;    // clock enable overide, from TCU
input   	tcu_clk_stop;       // clock stop, from TCU
input   	tcu_aclk;       // aclk, from TCU
input   	tcu_bclk;       // bclk, from TCU
input   	tcu_scan_en;    // Scan EN, from TCU
input   	tcu_muxtest;        // for pass muxes, from TCU
input   	tcu_dectest;        // for pass muxes, from TCU
input           ccu_slow_cmp_sync_en;
input           ccu_cmp_slow_sync_en;

input   	tcu_atpg_mode;
input   	tcu_se_scancollar_in;
input   	tcu_se_scancollar_out;
input   	tcu_array_wr_inhibit;
input   	tcu_array_bypass;
output		scan_out; //scan chain output // 

input		cluster_arst_l;
 
//////////////////////////////////////////////////////////////////////////////
// DEBUG ports
//////////////////////////////////////////////////////////////////////////////

output		l2t_dbg_sii_iq_dequeue;
output		l2t_dbg_sii_wib_dequeue;
output	[5:0] 	l2t_dbg_xbar_vcid;
output		l2t_dbg_err_event;
output		l2t_dbg_pa_match; 
 
////////////////////////////////////////////////////////////////////////////// 
// Efuse interface signals 
////////////////////////////////////////////////////////////////////////////// 
input		efu_l2t_fuse_clr;
input		efu_l2t_fuse_xfer_en;
input		efu_l2t_fuse_data;
output		l2t_efu_fuse_data;
output		l2t_efu_fuse_xfer_en;
///////////////////////////////////////////////////////////////////////////////// 
// MBIST related pins
//////////////////////////////////////////////////////////////////////////////
input           tcu_mbist_bisi_en;
input           tcu_l2t_mbist_start;
input           tcu_l2t_mbist_scan_in;
input           tcu_mbist_user_mode;

output     	l2t_tcu_mbist_done;
output     	l2t_tcu_mbist_fail;
output    	l2t_tcu_mbist_scan_out;

/////////////////////////////////////////////////////////////////////////////////
// Repeaters
/////////////////////////////////////////////////////////////////////////////////

input    [23:0]  l2t_rep_in0;
input    [23:0]  l2t_rep_in1;
input    [23:0]  l2t_rep_in2;
input    [23:0]  l2t_rep_in3;
input    [23:0]  l2t_rep_in4;
input    [23:0]  l2t_rep_in5;
input    [23:0]  l2t_rep_in6;
input    [23:0]  l2t_rep_in7;
input    [23:0]  l2t_rep_in8;
input    [23:0]  l2t_rep_in9;
input    [23:0]  l2t_rep_in10;
input    [23:0]  l2t_rep_in11;
input    [23:0]  l2t_rep_in12;
input    [23:0]  l2t_rep_in13;
input    [23:0]  l2t_rep_in14;
input    [23:0]  l2t_rep_in15;
input    [23:0]  l2t_rep_in16;
input    [23:0]  l2t_rep_in17;
input    [23:0]  l2t_rep_in18;
input    [23:0]  l2t_rep_in19;

output   [23:0]  l2t_rep_out0;
output   [23:0]  l2t_rep_out1;
output   [23:0]  l2t_rep_out2;
output   [23:0]  l2t_rep_out3;
output   [23:0]  l2t_rep_out4;
output   [23:0]  l2t_rep_out5;
output   [23:0]  l2t_rep_out6;
output   [23:0]  l2t_rep_out7;
output   [23:0]  l2t_rep_out8;
output   [23:0]  l2t_rep_out9;
output   [23:0]  l2t_rep_out10;
output   [23:0]  l2t_rep_out11;
output   [23:0]  l2t_rep_out12;
output   [23:0]  l2t_rep_out13;
output   [23:0]  l2t_rep_out14;
output   [23:0]  l2t_rep_out15;
output   [23:0]  l2t_rep_out16;
output   [23:0]  l2t_rep_out17;
output   [23:0]  l2t_rep_out18;
output   [23:0]  l2t_rep_out19;

input	[191:0]	l2t_lstg_in;
input	[191:0]	l2t_rstg_in;
output	[191:0]	l2t_lstg_out;
output	[191:0]	l2t_rstg_out;


/////////////////////////////////////////////////////////////////////////////////
// shadow scan 
/////////////////////////////////////////////////////////////////////////////////
input		tcu_l2t_shscan_scan_in;
input		tcu_l2t_shscan_aclk;	
input		tcu_l2t_shscan_bclk;   	
input		tcu_l2t_shscan_scan_en;
input		tcu_l2t_shscan_pce_ov;	
input		tcu_l2t_shscan_clk_stop;
output		l2t_tcu_shscan_scan_out;

/////////////////////////////////////////////////////////////////////////////////
// DMO interface changes
/////////////////////////////////////////////////////////////////////////////////
input		tcu_l2t_coresel;	// 1= select current bank dmo out
input		tcu_l2t_tag_or_data_sel;// 1= tag read data 0 = data read data
input	[38:0]	l2t_tcu_dmo_out_prev;	// dmo output from prev bank
output	[38:0]	l2t_tcu_dmo_out;	// dmo output from this bank

//////////////////////////////////////////////////////////////////////////////

wire	[2:0]		arb_cpuid_c5;
wire			arb_oqu_swap_cas2_req_c2;
wire	[2:0]	csreg_notdata_addr_mux_sel;
wire              arb_bs_or_bis_inst_c2; 
// BS 04/20/04 , taking out arb_bs_or_bis_inst_c2 to l2t_usaloc_dp.sv 
// to clear Use bit on a BST or BIST to mitigate pollution effect in L2 cache
// for Copy routines
wire   [1:0] arbadr_arbdp_addr87_c2;        // BS 03/25/04 for partial bank/core modes support

wire 	arb_upper_four_byte_access_c1; // BS 05/04/04 : taking out upper_four_byte_access info to word_en_c2[15:0] gen logic in tag_ctl
wire	arb_lower_four_byte_access_c1; // BS 05/04/04 : taking out upper_four_byte_access info to word_en_c2[15:0] gen logic in tag_ctl
wire  [7:0]	 st_ack_bmask; // BS and SR 1/30/04,Bmask for store ack including Diagnostic store ack
wire  [3:0]      filbuf_tag_evict_way_c3; // BS and SR 12/18/03, LRU way from Filbuf needs to be written to Dir on a Miss
wire            tag_store_inst_c3; //BS and SR 11/07/03, store pipelining support 
wire		misbuf_hit_st_dep_zero; //BS and SR 11/07/03, store pipelining support
wire		sel_st_ack_c7;  // BS and SR 11/12/03 N2 Xbar Packet format change
wire		arbadr_dirvec_addr3_c7; // BS and SR 11/12/03 N2 Xbar Packet format change
wire  [63:0]    st_ack_data; // BS and SR 11/12/03 N2 Xbar Packet format change
                                                // BS and SR 12/22/03, store ack generation for diagnostic store
wire            sel_diag_store_data_c7;  // BS and SR 12/22/03, store ack generation for diagnostic store
wire 		tag_inval_req_c5; // BS and SR 11/12/03 N2 Xbar Packet format change
wire		arb_decdp_mmuld_inst_c6; // BS and SR 11/12/03 N2 Xbar Packet format change
wire		oqu_mmu_ld_hit_c7; // BS and SR 11/12/03 N2 Xbar Packet format change

wire  [3:0]     tag_dir_l2way_sel_c4; // BS and SR 11/18/03 Reverse Directory change

wire [3:0]      ic_cam_en_row0;         // To ic_row0 of dcm_row.v 
wire [3:0]      ic_cam_en_row2;         // To ic_row2 of dcm_row.v 
wire [3:0]      ic_rd_en_row0;          // To ic_row0 of dcm_row.v 
wire [3:0]      ic_rd_en_row2;          // To ic_row2 of dcm_row.v 
wire [3:0]      ic_wr_en_row0;          // To ic_row0 of dcm_row.v 
wire [3:0]      ic_wr_en_row2;          // To ic_row2 of dcm_row.v 
wire [3:0]      dc_cam_en_row0;         // To dc_row0 of dcm_row.v 
wire [3:0]      dc_cam_en_row2;         // To dc_row2 of dcm_row.v 
wire [3:0]      dc_rd_en_row0;          // To dc_row0 of dcm_row.v 
wire [3:0]      dc_rd_en_row2;          // To dc_row2 of dcm_row.v 
wire [3:0]      dc_wr_en_row0;          // To dc_row0 of dcm_row.v 
wire [3:0]      dc_wr_en_row2;          // To dc_row2 of dcm_row.v 
wire		l2clk; 
wire	[38:0]	arbdata_wr_data_c2 ; 
wire 	[38:0]  vuad_diag_data_c7;    
wire    [38:0]  tagdp_vuad_dp_diag_data_c7_buf;
 
// BS and SR VUAD ECC Change 8/9/04

wire	[77:0] write_data; 	
wire		usaloc_ua_ue_c2;
wire		usaloc_ua_ce_c2;
wire	[5:0]	usaloc_ua_synd_c2;
wire            vlddir_vd_ue_c2;
wire  [5:0]     vlddir_vd_synd_c2;

////////////////// 
wire	[5:2]		arbdp_dbg_addr_c3; 
wire                  arb_mb_camen_px2;    //  
wire [39:0]           arbdp_cam_addr_px2;     //  
wire [41:7]           arbadr_mbcam_addr_px2;  //
wire			arb_inst_vld_c1; 
 
 
wire [`L2_POISON:`L2_SZ_LO]arbdp_inst_c8;   //  
 
wire                  filbuf_buf_rd_en;        //  
wire [7:0]            filbuf_fbtag_rd_ptr;     //  
wire                  filbuf_fbtag_wr_en;      //  
wire [7:0]            filbuf_fbtag_wr_ptr;     //  
 
wire                  iq_array_rd_en;         //  
wire [3:0]            iq_array_rd_wl;         //  
wire                  iq_array_wr_en;         //  
wire [3:0]            iq_array_wr_wl;         //  
 
wire [31:0]           mb_write_wl;            //  BS & SR 11/04/03, MB grows to 32
wire                  misbuf_dep_c8;           //  
wire                  misbuf_evict_c8;         //  
wire [4:0]            misbuf_mbentry_c8;       // BS & SR 11/04/03, MB grows to 32 
wire                  misbuf_tecc_c8;          //  
wire [63:0]           mbdata_inst_data_c8;    //  
wire [5:0]            mbdata_inst_tecc_c8;    //  
wire                  mbtag_wr_en_c2;         //  
wire	[31:0]  mb_read_wl ;     // BS & SR 11/04/03, MB grows to 32 
wire    [31:0]  mb_data_write_wl; // BS & SR 11/04/03, MB grows to 32
wire 		mbdata_wr_en_c8;      
 
 
wire [159:0] oq_array_data_in;       //  
wire                  oqarray_rd_en;          //  
wire [3:0]            oqarray_rd_ptr;         //  
wire                  oqarray_wr_en;          //  
wire [3:0]            oqarray_wr_ptr;         //  
 
 
wire	[39:0] rdma_read_data; 
wire [39:0]            wb_read_data;           // To arbadr of l2t_arbadr_dp.sv 
 
wire [7:0]             fb_cam_match;           // To filbuf of l2t_filbuf_ctl.sv // BS and SR 8 deep change 3/3/04
wire [39:0]            fb_read_data;           // To arbadr of l2t_arbadr_dp.sv 
 
wire [159:0]           iq_array_rd_data_c1;    // To ique of l2t_ique_dp.sv 
wire [31:0]            mb_cam_match;           // To misbuf of l2t_misbuf_ctl.sv , BS & SR 11/04/03, MB grows to 32
wire [31:0]            mb_cam_match_idx;           // To misbuf of l2t_misbuf_ctl.sv, BS & SR 11/05/03 MB grows to 32
 
wire [41:0]            mb_read_data;           // To l2t_evctag_dp.sv
wire [39:0]            evctag_mb_read_data;    // from l2t_evctag_dp.sv to  fbtag and mbist module 

wire [159:0]  oq_array_data_out;      // To oque of l2t_oque_dp.sv 
 
wire [7:0]             wb_cam_match_c2;        // To wbuf of l2t_wbuf_ctl.sv // BS and SR 8 deep change 3/3/04
// wire [31:0]            wr_data;                // To icdir of l2t_dirblock.v, ... 
wire	[7:0]	rdmat_cam_match_c2; 	// BS and SR 8 deep change 3/3/04
wire	[3:0]	rdmat_wr_wl_s2; 
wire	[39:6]	rdmatag_wr_addr_s2; 
wire		rdmatag_wr_en_s2; 
wire	[3:0]	rdmat_read_wl; 
wire		rdmat_read_en; 
 
wire [127:0]            ic_cam_hit;             //  
wire                    ic_inval_vld_c7;        //  
 
wire [127:0]            dc_cam_hit;             //  
wire                    dc_inval_vld_c7;        //  
 
// test related. 
wire	mbist_l2vuad_fail; 
wire	mbist_l2tag_fail; 
wire	mbist_l2data_fail; 
 

wire [2:0]              lkup_row_addr_icd_c3;   //  
wire [2:0]              lkup_row_addr_dcd_c3;   //  
wire [17:9]          	tagd_lkup_addr_c4;     // From tagd of l2t_tagd_dp.sv, BS and SR 11/18/03 Reverse Directory change 
wire [41:0]           mb_write_addr;          //  
wire [39:7]           lkup_addr_c1;           //  
 
wire                  wb_read_en;             //  
wire [7:0]            wb_read_wl;             //  
wire [39:0]           wb_write_addr;          //  
wire                  wbtag_write_en_c4;    //  
wire [7:0]            wbtag_write_wl_c4;      //  
 
// End of automatics 
/*AUTOWIRE*/ 
// Beginning of automatic wires (for undeclared instantiated-module outputs) 
wire                    alloc_rst_cond_c3;      // From vuaddp of l2t_vuaddp_ctl.sv 
wire                    alloc_set_cond_c3;      // From vuaddp of l2t_vuaddp_ctl.sv 
wire                    tag_alt_tag_miss_unqual_c3;// From tag of l2t_tag_ctl.sv 
wire                    arbaddr_addr22_c2;      // From arbadr of l2t_arbadr_dp.sv 
wire [10:0]              arbaddr_idx_c3;         // From arbadr of l2t_arbadr_dp.sv 
wire                    arbadr_addr2_c8;     // From arbadr of l2t_arbadr_dp.sv 
wire                    arb_acc_ua_c2;       // From arb of l2t_arb_ctl.sv 
wire                    arb_acc_vd_c2;       // From arb of l2t_arb_ctl.sv 
wire                    arb_csr_rd_en_c3;    // From arb of l2t_arb_ctl.sv 
wire                    arb_csr_rd_en_c7;    // From arb of l2t_arb_ctl.sv 
wire                    arb_csr_st_c2;       // From arb of l2t_arb_ctl.sv 
wire                    arb_csr_wr_en_c3;    // From arb of l2t_arb_ctl.sv 
wire                    arb_csr_wr_en_c7;    // From arb of l2t_arb_ctl.sv 
wire                    arb_data_diag_st_c2; // From arb of l2t_arb_ctl.sv 
wire                    arb_dc_rd_en_c3;     // From arb of l2t_arb_ctl.sv 
wire                    arb_dc_wr_en_c3;     // From arb of l2t_arb_ctl.sv 
wire                    arb_decc_data_sel_c9;// From arb of l2t_arb_ctl.sv 
wire                    arb_diag_complete_c3;// From arb of l2t_arb_ctl.sv 
wire [4:0]              arb_dir_panel_dcd_c3;// From arb of l2t_arb_ctl.sv 
wire [4:0]              arb_dir_panel_icd_c3;// From arb of l2t_arb_ctl.sv 
wire                    arb_dir_vld_c3_l;    // From arb of l2t_arb_ctl.sv 
wire                    arb_dir_wr_en_c4;    // From arb of l2t_arb_ctl.sv 
wire                    arb_evict_c3;        // From arb of l2t_arb_ctl.sv 
wire                    arb_evict_c4;        // From arb of l2t_arb_ctl.sv 
wire                    arb_evict_c5;        // From arb of l2t_arb_ctl.sv 
wire                    arb_evict_tecc_vld_c2;// From arb of l2t_arb_ctl.sv 
wire                    arb_evict_vld_c2;    // From arb of l2t_arb_ctl.sv 
wire                    arb_filbuf_fbsel_c1;  // From arb of l2t_arb_ctl.sv 
wire                    arb_filbuf_hit_off_c1;// From arb of l2t_arb_ctl.sv 
//wire                    arb_filbuf_inst_vld_c2;// From arb of l2t_arb_ctl.sv 
wire                    arb_fill_vld_c2;     // From arb of l2t_arb_ctl.sv 
wire                    arb_ic_rd_en_c3;     // From arb of l2t_arb_ctl.sv 
wire                    arb_ic_wr_en_c3;     // From arb of l2t_arb_ctl.sv 
wire                    arb_imiss_hit_c10;   // From arb of l2t_arb_ctl.sv 
wire                    arb_imiss_hit_c4;    // From arb of l2t_arb_ctl.sv 
wire                    arb_imiss_vld_c2;    // From arb of l2t_arb_ctl.sv 
wire                    arb_inst_diag_c1;    // From arb of l2t_arb_ctl.sv 
wire                    arb_inst_l2data_vld_c6;// From arb of l2t_arb_ctl.sv 
wire                    arb_inst_l2tag_vld_c6;// From arb of l2t_arb_ctl.sv 
wire                    arb_inst_l2vuad_vld_c3;// From arb of l2t_arb_ctl.sv 
wire                    arb_inst_l2vuad_vld_c6;// From arb of l2t_arb_ctl.sv 
wire                    arb_inst_vld_c2;     // From arb of l2t_arb_ctl.sv 
wire                    arb_inval_inst_c2;   // From arb of l2t_arb_ctl.sv 
wire [7:0]              arb_inval_mask_dcd_c3;// From arb of l2t_arb_ctl.sv 
wire [7:0]              arb_inval_mask_icd_c3;// From arb of l2t_arb_ctl.sv 
wire                    arb_iqsel_px2;       // From arb of l2t_arb_ctl.sv 
wire                    arb_l2tag_vld_c4;    // From arb of l2t_arb_ctl.sv 
wire [3:0]              arb_lkup_bank_ena_dcd_c3;// From arb of l2t_arb_ctl.sv 
wire [3:0]              arb_lkup_bank_ena_icd_c3;// From arb of l2t_arb_ctl.sv 
wire                    arb_misbuf_cas1_hit_c8;// From arb of l2t_arb_ctl.sv 
wire                    arb_misbuf_ctrue_c9;  // From arb of l2t_arb_ctl.sv 
wire                    arb_misbuf_hit_off_c1;// From arb of l2t_arb_ctl.sv 
wire                    arb_misbuf_inst_vld_c2;// From arb of l2t_arb_ctl.sv 
wire                    arb_misbuf_mbsel_c1;  // From arb of l2t_arb_ctl.sv 
wire                    arb_normal_tagacc_c2;// From arb of l2t_arb_ctl.sv 
wire                    arb_pst_ctrue_en_c8; // From arb of l2t_arb_ctl.sv 
wire                    arb_rdwr_inst_vld_c2;// From arb of l2t_arb_ctl.sv 
wire                    arb_tag_rd_px2;      // From arb of l2t_arb_ctl.sv 
wire                    tagd_arb_tag_rd_px2_buf;  // From tagd of l2t_tagd_dp.sv 
wire [15:0]             arb_tag_way_px2;     // From arb of l2t_arb_ctl.sv 
wire [15:0]             tagd_arb_tag_way_px2_buf; // From tagd of l2t_tagd_dp.sv 
wire                    arb_tag_wr_px2;      // From arb of l2t_arb_ctl.sv 
wire                    tagd_arb_tag_wr_px2_buf;  // From tagd of l2t_tagd_dp.sv 
wire                    arb_tag_inst_vld_c2;// From arb of l2t_arb_ctl.sv 
wire                    arb_tag_pst_with_ctrue_c1;// From arb of l2t_arb_ctl.sv 
wire                    arb_tagd_perr_vld_c2;// From arb of l2t_arb_ctl.sv 
wire                    arb_tagd_tecc_c2;   // From arb of l2t_arb_ctl.sv 
wire                    arb_tecc_c2;         // From arb of l2t_arb_ctl.sv 
wire [3:0]              arb_tecc_way_c2;     // From arb of l2t_arb_ctl.sv 
wire                    arb_vuad_acc_px2;    // From arb of l2t_arb_ctl.sv 
wire                    arb_vuad_idx2_sel_px2_n;// From arb of l2t_arb_ctl.sv 
wire                    arb_waysel_gate_c2;  // From arb of l2t_arb_ctl.sv 
wire                    arb_waysel_inst_vld_c2;// From arb of l2t_arb_ctl.sv 
wire                    arb_wbuf_hit_off_c1;// From arb of l2t_arb_ctl.sv 
wire                    arb_wbuf_inst_vld_c2;// From arb of l2t_arb_ctl.sv 
wire [4:0]              arb_wr_dc_dir_entry_c3;// From arb of l2t_arb_ctl.sv 
wire [4:0]              arb_wr_ic_dir_entry_c3;// From arb of l2t_arb_ctl.sv 
wire [31:0]             arbdec_ctag_c6;         // From arbdec of l2t_arbdec_dp.sv// Phase 2 : SIU inteface and packet format change 2/7/04
wire [7:0]              arbadr_arbdp_addr11to4_c3;     // From arbadr of l2t_arbadr_dp.sv 
wire                    arbadr_arbdp_addr22_c7;        // From arbadr of l2t_arbadr_dp.sv 
wire [1:0]              arbadr_arbdp_addr3to2_c1;      // From arbadr of l2t_arbadr_dp.sv 
wire [1:0]              arbadr_arbdp_addr5to4_c1;      // From arbadr of l2t_arbadr_dp.sv 
wire [1:0]              arbadr_arbdp_addr5to4_c3;      // From arbadr of l2t_arbadr_dp.sv 
wire                    arbadr_arbdp_addr_c1c2comp_c1; // From arbadr of l2t_arbadr_dp.sv 
wire                    arbadr_arbdp_addr_c1c3comp_c1; // From arbadr of l2t_arbadr_dp.sv 
wire                    arbadr_arbdp_addr_start_c2;    // From arbadr of l2t_arbadr_dp.sv 
wire [2:0]              arbadr_arbdp_byte_addr_c6;     // From arbadr of l2t_arbadr_dp.sv // Phase 2 of SIU changes
wire [2:0]              arbdec_arbdp_cpuid_c2;         // From arbdec of l2t_arbdec_dp.sv
wire [2:0]              arbdec_arbdp_cpuid_c5;         // From arbdec of l2t_arbdec_dp.sv 
wire [39:4]             arbadr_arbdp_csr_addr_c9;      // From arbadr of l2t_arbadr_dp.sv 
wire [3:0]              arbadr_arbdp_diag_wr_way_c2;   // From arbadr of l2t_arbadr_dp.sv 
wire                    arbdec_arbdp_evict_c1;         // From arbdec of l2t_arbdec_dp.sv 
wire                    arbdec_arbdp_inst_bufid1_c1;   // From arbdec of l2t_arbdec_dp.sv 
wire                    arbdec_arbdp_inst_bufidhi_c1;  // From arbdec of l2t_arbdec_dp.sv 
wire                    arbdec_arbdp_inst_bufidlo_c2;  // From arbdec of l2t_arbdec_dp.sv 
wire [2:0]              arbdec_arbdp_inst_cpuid_c7;    // From arbdec of l2t_arbdec_dp.sv 
wire                    arbdec_arbdp_inst_ctrue_c1;    // From arbdec of l2t_arbdec_dp.sv 
wire                    arbdec_arbdp_inst_dep_c2;      // From arbdec of l2t_arbdec_dp.sv 
wire                    arbdec_arbdp_inst_fb_c1;       // From arbdec of l2t_arbdec_dp.sv 
wire                    arbdec_arbdp_inst_fb_c2;       // From arbdec of l2t_arbdec_dp.sv 
wire [1:0]              arbdec_arbdp_inst_l1way_c7;    // From arbdec of l2t_arbdec_dp.sv 
wire                    arbdec_arbdp_inst_mb_c1;       // From arbdec of l2t_arbdec_dp.sv 
wire                    arbdec_arbdp_inst_mb_c2;       // From arbdec of l2t_arbdec_dp.sv 
wire                    arbdec_arbdp_inst_mb_c3;       // From arbdec of l2t_arbdec_dp.sv 
wire [4:0]              arbdec_arbdp_inst_mb_entry_c1; // From arbdec of l2t_arbdec_dp.sv, BS & SR 11/04/03, MB grows to 32 
wire                    arbdec_arbdp_inst_nc_c1;       // From arbdec of l2t_arbdec_dp.sv 
wire                    arbdec_arbdp_inst_nc_c3;       // From arbdec of l2t_arbdec_dp.sv 
wire                    arbdec_arbdp_inst_nc_c7;       // From arbdec of l2t_arbdec_dp.sv 
wire [`L2_RQTYP_HI:`L2_RQTYP_LO]arbdec_arbdp_inst_rqtyp_c1;// From arbdec of l2t_arbdec_dp.sv 
wire [`L2_RQTYP_HI:`L2_RQTYP_LO]arbdec_arbdp_inst_rqtyp_c2;// From arbdec of l2t_arbdec_dp.sv 
wire [`L2_RQTYP_HI:`L2_RQTYP_LO]arbdec_arbdp_inst_rqtyp_c6;// From arbdec of l2t_arbdec_dp.sv 
//wire                    arbdec_arbdp_inst_rsvd_c1;     // From arbdec of l2t_arbdec_dp.sv 
wire [`L2_SZ_HI:`L2_SZ_LO]arbdec_arbdp_inst_size_c1;   // From arbdec of l2t_arbdec_dp.sv 
wire [7:0]              arbdec_arbdp_inst_size_c7;     // From arbdec of l2t_arbdec_dp.sv, BS and SR 11/12/03 N2 Xbar Packet format change 
wire                    arbdec_arbdp_inst_tecc_c3;     // From arbdec of l2t_arbdec_dp.sv 
wire [2:0]              arbdec_arbdp_inst_tid_c7;      // From arbdec of l2t_arbdec_dp.sv, BS and SR 11/12/03 N2 Xbar Packet format change 
wire [3:0]              arbdec_arbdp_inst_way_c1;      // From arbdec of l2t_arbdec_dp.sv 
wire [3:0]              arbdec_arbdp_inst_way_c2;      // From arbdec of l2t_arbdec_dp.sv 
wire [3:0]              arbdec_arbdp_inst_way_c3;      // From arbdec of l2t_arbdec_dp.sv 
wire                    arbdec_arbdp_int_bcast_c5;     // From arbdec of l2t_arbdec_dp.sv 
wire [39:32]            arbadr_arbdp_ioaddr_c1;        // From arbadr of l2t_arbadr_dp.sv 
wire [1:0]              arbdec_arbdp_l1way_c3;         // From arbdec of l2t_arbdec_dp.sv 
wire [5:4]              arbadr_arbdp_line_addr_c6;     // From arbadr of l2t_arbadr_dp.sv 
wire                    arb_arbdp_misbuf_pst_no_ctrue_c2;// From arb of l2t_arb_ctl.sv 
wire [1:0]              arbadr_arbdp_new_addr5to4_px2; // From arbadr of l2t_arbadr_dp.sv 
wire [17:0]             arbdat_arbdp_oque_int_ret_c7;  // From arbdat of l2t_arbdat_dp.sv 
wire [11:6]             arbadr_arbdp_oque_l1_index_c7; // From arbadr of l2t_arbadr_dp.sv 
wire                    arbdec_arbdp_poison_c1;        // From arbdec of l2t_arbdec_dp.sv 
wire                    arb_arbdp_pst_with_ctrue_c2;// From arb of l2t_arb_ctl.sv 
wire [1:0]              arbdec_arbdp_rdma_entry_c3;    // From arbdec of l2t_arbdec_dp.sv 
wire                    arbdec_arbdp_rdma_inst_c1;     // From arbdec of l2t_arbdec_dp.sv 
wire                    arbdec_arbdp_rdma_inst_c2;     // From arbdec of l2t_arbdec_dp.sv 
wire [5:2]              arbadr_arbdp_rdmat_addr_c6; // From arbadr of l2t_arbadr_dp.sv 
wire [8:0]              arbadr_arbdp_tag_idx_px2;      // From arbadr of l2t_arbadr_dp.sv 
wire                    arb_arbdp_tag_pst_no_ctrue_c2;// From arb of l2t_arb_ctl.sv 
wire [27:6]             arbadr_arbdp_tagdata_px2;      // From arbadr of l2t_arbadr_dp.sv 
wire                    arbdec_arbdp_tecc_c1;          // From arbdec of l2t_arbdec_dp.sv 
wire                    arb_arbdp_tecc_inst_mb_c8;  // From arb of l2t_arb_ctl.sv 
wire [8:0]              arbadr_arbdp_vuad_idx1_px2;    // From arbadr of l2t_arbadr_dp.sv 
wire [8:0]              arbadr_arbdp_vuad_idx2_px2;    // From arbadr of l2t_arbadr_dp.sv 
wire                    arb_arbdp_vuadctl_pst_no_ctrue_c2;// From arb of l2t_arb_ctl.sv 
wire [1:0]              arbadr_arbdp_waddr_c6;         // From arbadr of l2t_arbadr_dp.sv 
wire [4:0]              arbadr_arbdp_word_addr_c6;     // From arbadr of l2t_arbadr_dp.sv 
wire                    oqu_atm_inst_ack_c7;    // From oqu of l2t_oqu_ctl.sv 
wire                    arb_bist_or_diag_acc_c1;// From arb of l2t_arb_ctl.sv 
wire [38:0]             vuadpm_bistordiag_ua_data; // From vuadpm of l2t_vuadpm_dp.sv 
wire [38:0]             vuadpm_bistordiag_vd_data; // From vuadpm of l2t_vuadpm_dp.sv 
wire                    vuaddp_bistordiag_wr_ua_c4;// From vuaddp of l2t_vuaddp_ctl.sv 
wire                    vuaddp_bistordiag_wr_vd_c4; // From vuaddp of l2t_vuaddp_ctl.sv 
wire                    arbadr_c1_addr_eq_wb_c4;    // From arbadr of l2t_arbadr_dp.sv 
wire                    tag_cerr_ack_tmp_c4;        // From tag of l2t_tag_ctl.sv 
wire                    csreg_csr_addr_wr_en;         // From csreg of l2t_csreg_ctl.sv 
wire                    csreg_csr_async_wr_en;        // From csreg of l2t_csreg_ctl.sv 
wire                    csreg_csr_bist_wr_en_c8;      // From csreg of l2t_csreg_ctl.sv 
wire                    csreg_csr_wr_en_c8;           // From csreg of l2t_csreg_ctl.sv 
wire                    csreg_csr_erren_wr_en_c8;     // From csreg of l2t_csreg_ctl.sv 
wire                    csreg_csr_errinj_wr_en_c8;    // From csreg of l2t_csreg_ctl.sv 
wire                    csreg_csr_errstate_wr_en_c8;  // From csreg of l2t_csreg_ctl.sv 
wire                    csr_filbuf_l2off;        // From csr of l2t_csr_ctl.sv 
wire                    csr_filbuf_scrub_ready;  // From csr of l2t_csr_ctl.sv 
wire [63:0]             arbdat_csr_inst_wr_data_c8; // From arbdat of l2t_arbdat_dp.sv 
wire                    csr_misbuf_l2off;        // From csr of l2t_csr_ctl.sv 
wire [63:0]             csr_rd_data_c8;         // From csr of l2t_csr_ctl.sv 
wire [3:0]              csreg_csr_rd_mux1_sel_c7;     // From csreg of l2t_csreg_ctl.sv 
wire                    csreg_csr_rd_mux2_sel_c7;     // From csreg of l2t_csreg_ctl.sv 
wire [1:0]              csreg_csr_rd_mux3_sel_c7;     // From csreg of l2t_csreg_ctl.sv 
wire                    csreg_csr_synd_wr_en;         // From csreg of l2t_csreg_ctl.sv 
wire                    csr_tag_l2off;       // From csr of l2t_csr_ctl.sv 
wire                    csreg_csr_tid_wr_en;          // From csreg of l2t_csreg_ctl.sv 
wire                    csr_vuad_l2off;         // From csr of l2t_csr_ctl.sv 
wire                    csr_wbuf_l2off;        // From csr of l2t_csr_ctl.sv 
wire                    csr_wr_dirpinj_en;      // From csr of l2t_csr_ctl.sv 
wire                    tag_data_ecc_active_c3; // From tag of l2t_tag_ctl.sv 
wire [8:0]              arbadr_data_ecc_idx;    // From arbadr of l2t_arbadr_dp.sv 
wire                    arb_data_ecc_idx_en;    // From arb of l2t_arb_ctl.sv 
wire                    arb_data_ecc_idx_reset; // From arb of l2t_arb_ctl.sv 
wire [155:0]            data_in_h_r0;           // From subarray_0 of lib_r_rf32x108_cust.sv 
wire [155:0]            data_in_h_r1;           // From subarray_1 of lib_r_rf32x108_cust.sv 
wire [155:0]            data_in_h_r10;          // From subarray_10 of lib_r_rf32x108_cust.sv 
wire [155:0]            data_in_h_r11;          // From subarray_11 of lib_r_rf32x108_cust.sv 
wire [155:0]            data_in_h_r2;           // From subarray_2 of lib_r_rf32x108_cust.sv 
wire [155:0]            data_in_h_r3;           // From subarray_3 of lib_r_rf32x108_cust.sv 
wire [155:0]            data_in_h_r8;           // From subarray_8 of lib_r_rf32x108_cust.sv 
wire [155:0]            data_in_h_r9;           // From subarray_9 of lib_r_rf32x108_cust.sv 
wire [38:0]             data_out_col_r0;        // From vuadcl_0 of l2t_vuadcl_dp.sv 
wire [38:0]             data_out_col_r10;       // From vuadcl_10 of l2t_vuadcl_dp.sv 
wire [38:0]             data_out_col_r2;        // From vuadcl_2 of l2t_vuadcl_dp.sv 
wire [38:0]             data_out_col_r8;        // From vuadcl_8 of l2t_vuadcl_dp.sv 
wire                    dirrep_dc_dir_clear_c4;  // From dirrep of l2t_dirrep_ctl.sv 
wire [7:0]              dc_inv_mask_0145;       // From dc_ctl_0145 of l2t_dir_ctl.sv 
wire [7:0]              dc_inv_mask_2367;       // From dc_ctl_2367 of l2t_dir_ctl.sv 
wire [7:0]              dc_inv_mask_89cd;       // From dc_ctl_89cd of l2t_dir_ctl.sv 
wire [7:0]              dc_inv_mask_abef;       // From dc_ctl_abef of l2t_dir_ctl.sv 
wire [3:0]              dirrep_dc_lkup_panel_dec_c4;   // From dirrep of l2t_dirrep_ctl.sv 
wire [3:0]              dc_lkup_row_dec_c4;     // From dirrep of l2t_dirrep_ctl.sv 
wire [15:0]             dc_lkup_wr_data_c4_row0;// From dc_buf_row0 of l2t_dirlbf_dp.sv, BS and SR 11/18/03 Reverse Directory change 
wire [15:0]             dc_lkup_wr_data_c4_row2;// From dc_buf_row1 of l2t_dirlbf_dp.sv , BS and SR 11/18/03 Reverse Directory change
wire [2:0]              dc_parity_in;           // From dc_out_col0 of l2t_dirout_dp.sv, ... 
wire [3:0]              dc_parity_out;          // From dc_out_col3 of l2t_dirout_dp.sv, ... 
wire [15:0]             dc_rd_data04_row0;      // From dc_row0 of lib_r_dcm_cust.sv, BS and SR 11/18/03 Reverse Directory change 
wire [15:0]             dc_rd_data15_row0;      // From dc_row0 of lib_r_dcm_cust.sv, BS and SR 11/18/03 Reverse Directory change 
wire [15:0]             dc_rd_data26_row0;      // From dc_row0 of lib_r_dcm_cust.sv, BS and SR 11/18/03 Reverse Directory change 
wire [15:0]             dc_rd_data37_row0;      // From dc_row0 of lib_r_dcm_cust.sv, BS and SR 11/18/03 Reverse Directory change 
wire [15:0]             dc_rd_data8c_row2;      // From dc_row2 of lib_r_dcm_cust.sv, BS and SR 11/18/03 Reverse Directory change 
wire [15:0]             dc_rd_data9d_row2;      // From dc_row2 of lib_r_dcm_cust.sv, BS and SR 11/18/03 Reverse Directory change 
wire [15:0]             dc_rd_dataae_row2;      // From dc_row2 of lib_r_dcm_cust.sv 
wire [15:0]             dc_rd_databf_row2;      // From dc_row2 of lib_r_dcm_cust.sv 
wire                    dirrep_dc_rd_en_c4;     // From dirrep of l2t_dirrep_ctl.sv 
wire [3:0]              dirrep_dc_rdwr_panel_dec_c4; // From dirrep of l2t_dirrep_ctl.sv 
wire [3:0]              dirrep_dc_rdwr_row_en_c4;    // From dirrep of l2t_dirrep_ctl.sv 
wire [5:0]              dc_rw_addr_0145;        // From dc_ctl_0145 of l2t_dir_ctl.sv, BS and SR 11/18/03 Reverse Directory change 
wire [5:0]              dc_rw_addr_89cd;        // From dc_ctl_89cd of l2t_dir_ctl.sv, BS and SR 11/18/03 Reverse Directory change 
wire [4:0]              dc_rw_addr_abef;        // From dc_ctl_abef of l2t_dir_ctl.sv, BS and SR 11/18/03 Reverse Directory change 
wire                    dc_warm_rst_0145;       // From dc_ctl_0145 of l2t_dir_ctl.sv 
wire                    dc_warm_rst_89cd;       // From dc_ctl_89cd of l2t_dir_ctl.sv 
//wire                    dc_warm_rst_abef;       // From dc_ctl_abef of l2t_dir_ctl.sv 
wire                    dirrep_dc_wr_en_c4;     // From dirrep of l2t_dirrep_ctl.sv 
wire                    deccck_bscd_corr_err_c8;  // From deccck of l2t_deccck_ctl.sv 
wire                    deccck_bscd_uncorr_err_c8;// From deccck of l2t_deccck_ctl.sv 
wire                    deccck_scrd_corr_err_c8;  // From deccck of l2t_deccck_ctl.sv 
wire                    deccck_scrd_uncorr_err_c8;// From deccck of l2t_deccck_ctl.sv 
wire                    deccck_spcd_corr_err_c8;  // From deccck of l2t_deccck_ctl.sv 
wire                    deccck_spcd_uncorr_err_c8;// From deccck of l2t_deccck_ctl.sv 
wire                    deccck_spcfb_corr_err_c8; // From deccck of l2t_deccck_ctl.sv 
wire                    deccck_spcfb_uncorr_err_c8;// From deccck of l2t_deccck_ctl.sv 
wire                    tag_decc_tag_acc_en_px2;    // From tag of l2t_tag_ctl.sv 
wire                    deccck_uncorr_err_c8;     // From deccck of l2t_deccck_ctl.sv 
wire                    deccck_corr_err_c8;       // From deccck of l2t_deccck_ctl.sv
wire [63:0]             decc_arbdp_data_c8;   // From decc of l2t_decc_dp.sv 
wire                    arb_decdp_atm_inst_c6;      // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_bis_inst_c3;      // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_cas1_inst_c2;     // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_cas2_from_mb_c2;  // From arb of l2t_arb_ctl.sv 
//wire                    arb_decdp_cas2_from_mb_ctrue_c2;// From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_cas2_inst_c2;     // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_fwd_req_c2;       // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_imiss_inst_c2;    // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_inst_int_c2;      // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_inst_int_c1;      // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_ld64_inst_c1;     // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_ld64_inst_c2;     // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_ld_inst_c2;       // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_pf_inst_c5;       // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_pst_inst_c2;      // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_rmo_st_c3;        // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_st_inst_c2;       // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_st_inst_c3;       // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_st_with_ctrue_c2; // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_strld_inst_c6;    // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_strst_inst_c2;    // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_swap_inst_c2;     // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_tag_wr_c1;     // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_wr64_inst_c2;     // From arb of l2t_arb_ctl.sv 
wire                    arb_decdp_wr8_inst_c2;      // From arb of l2t_arb_ctl.sv 
wire                    arb_diag_or_tecc_write_px2; // From arb of l2t_arb_ctl.sv 
wire [38:0]             usaloc_diag_rd_ua_out;         // From usaloc of l2t_usaloc_dp.sv 
wire [38:0]             vlddir_diag_rd_vd_out;         // From vlddir of l2t_vlddir_dp.sv 
wire [10:0]             arb_dir_addr_c9;            // From arb of l2t_arb_ctl.sv 
wire [39:7]             arbadr_dir_cam_addr_c3;        // From arbadr of l2t_arbadr_dp.sv 
wire                    dirrep_dir_error_c8;           // From dirrep of l2t_dirrep_ctl.sv 
wire                    dirrep_dir_vld_c4_l;           // From dirrep of l2t_dirrep_ctl.sv 
wire [111:0]            dirvec_dirdp_inval_pckt_c7;    // From dirvec of l2t_dirvec_dp.sv 
wire [7:0]              dirvec_dirdp_req_vec_c6;       // From dirvec of l2t_dirvec_dp.sv 
wire [3:0]              dirvec_dirdp_way_info_c7;      // From dirvec of l2t_dirvec_dp.sv, BS and SR 11/18/03 Support for 8 way I$ 
wire                    vlddir_dirty_evict_c3;         // From vlddir of l2t_vlddir_dp.sv 
wire                    filbuf_mcu_scb_mecc_err_d1;   // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_mcu_scb_secc_err_d1;   // From filbuf of l2t_filbuf_ctl.sv 
wire [1:0]              filbuf_mcu_l2t_chunk_id_r1; // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_mcu_l2t_data_vld_r1; // From filbuf of l2t_filbuf_ctl.sv 
wire [7:0]              arb_dword_mask_c8;          // From arb of l2t_arb_ctl.sv 
wire                    deccck_dword_sel_c7;           // From deccck of l2t_deccck_ctl.sv 
wire [`ERR_LDAC:`ERR_LVC] csreg_err_state_in;          // From csreg of l2t_csreg_ctl.sv 
wire                    csreg_err_state_in_mec;       // From csreg of l2t_csreg_ctl.sv 
wire                    csreg_err_state_in_meu;       // From csreg of l2t_csreg_ctl.sv 
wire                    csreg_err_state_in_rw;        // From csreg of l2t_csreg_ctl.sv 
wire                    csr_error_ceen;             // From csr of l2t_csr_ctl.sv 
wire                    csr_error_nceen;            // From csr of l2t_csr_ctl.sv 
wire                    csr_error_status_vec;       // From csr of l2t_csr_ctl.sv 
wire                    csr_error_status_veu;       // From csr of l2t_csr_ctl.sv 
wire                    rdmat_ev_cerr_r6;             // From rdmat of l2t_rdmat_ctl.sv 
wire                    rdmat_ev_uerr_r6;             // From rdmat of l2t_rdmat_ctl.sv 
wire [39:6]             evctag_evict_addr;             // From evctag of l2t_evctag_dp.sv 
wire [39:0]             evctag_addr_px2;      // From evctag of l2t_evctag_dp.sv 
wire                    filbuf_fb_count_eq_0;          // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_arb_l2rd_en;      // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_arb_vld_px1;   // From filbuf of l2t_filbuf_ctl.sv 
wire [2:0]              filbuf_arbdp_entry_px2;  // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_arbdp_tecc_px2;   // From filbuf of l2t_filbuf_ctl.sv 
wire [3:0]              filbuf_arbdp_way_px2;    // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_bsc_corr_err_c12; // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_corr_err_c8;      // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_dis_cerr_c3;      // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_dis_uerr_c3;      // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_fbd_rd_en_c2;     // From filbuf of l2t_filbuf_ctl.sv 
wire [2:0]              filbuf_fbd_rd_entry_c2;  // From filbuf of l2t_filbuf_ctl.sv 
wire [2:0]              filbuf_fbd_wr_entry_r1;  // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_ld64_fb_hit_c12;  // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_misbuf_entry_avail;// From filbuf of l2t_filbuf_ctl.sv 
wire [2:0]              filbuf_misbuf_fbid_d2;    // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_misbuf_match_c2;   // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_misbuf_nofill_d2;  // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_misbuf_stinst_match_c2;// From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_spc_corr_err_c6;  // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_spc_rd_vld_c6;    // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_spc_uncorr_err_c6;// From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_tag_hit_c2;    // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_uncorr_err_c8;    // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_vuad_bypassed_c3; // From filbuf of l2t_filbuf_ctl.sv 
wire [4:0]              filbuf_fbf_enc_dep_mbid_c4;    // From filbuf of l2t_filbuf_ctl.sv,BS & SR 11/04/03, MB grows to 32 
wire [4:0]              filbuf_fbf_enc_ld_mbid_r1;     // From filbuf of l2t_filbuf_ctl.sv, BS & SR 11/04/03, MB grows to 32 
wire                    filbuf_fbf_ready_miss_r1;      // From filbuf of l2t_filbuf_ctl.sv 
wire                    filbuf_fbf_st_or_dep_rdy_c4;   // From filbuf of l2t_filbuf_ctl.sv 
wire [15:0]             vuaddp_fill_way_c3;            // From vuaddp of l2t_vuaddp_ctl.sv 
wire                    oqu_fwd_req_ret_c7;         // From oqu of l2t_oqu_ctl.sv 
wire                    dirrep_ic_dir_clear_c4;        // From dirrep of l2t_dirrep_ctl.sv 
wire [7:0]              ic_inv_mask_0145;       // From ic_ctl_0145 of l2t_dir_ctl.sv 
wire [7:0]              ic_inv_mask_2367;       // From ic_ctl_2367 of l2t_dir_ctl.sv 
wire [7:0]              ic_inv_mask_89cd;       // From ic_ctl_89cd of l2t_dir_ctl.sv 
wire [7:0]              ic_inv_mask_abef;       // From ic_ctl_abef of l2t_dir_ctl.sv 
wire [3:0]              dirrep_ic_lkup_panel_dec_c4;   // From dirrep of l2t_dirrep_ctl.sv 
wire [3:0]              dirrep_ic_lkup_row_dec_c4;     // From dirrep of l2t_dirrep_ctl.sv 
wire [15:0]             ic_lkup_wr_data_c4_row0;// From ic_buf_row0 of l2t_dirlbf_dp.sv, BS and SR 11/18/03 Reverse Directory change 
wire [15:0]             ic_lkup_wr_data_c4_row2;// From ic_buf_row1 of l2t_dirlbf_dp.sv, BS and SR 11/18/03 Reverse Directory change 
wire [2:0]              ic_parity_in;           // From out_col0 of l2t_dirout_dp.sv, ... 
wire [3:0]              ic_parity_out;          // From out_col3 of l2t_dirout_dp.sv, ... 
wire [15:0]             ic_rd_data04_row0;      // From ic_row0 of lib_r_dcm_cust.sv, BS and SR 11/18/03 Reverse Directory change 
wire [15:0]             ic_rd_data15_row0;      // From ic_row0 of lib_r_dcm_cust.sv, BS and SR 11/18/03 Reverse Directory change 
wire [15:0]             ic_rd_data26_row0;      // From ic_row0 of lib_r_dcm_cust.sv, BS and SR 11/18/03 Reverse Directory change 
wire [15:0]             ic_rd_data37_row0;      // From ic_row0 of lib_r_dcm_cust.sv, BS and SR 11/18/03 Reverse Directory change 
wire [15:0]             ic_rd_data8c_row1;      // From ic_row2 of lib_r_dcm_cust.sv, BS and SR 11/18/03 Reverse Directory change 
wire [15:0]             ic_rd_data9d_row1;      // From ic_row2 of lib_r_dcm_cust.sv, BS and SR 11/18/03 Reverse Directory change 
wire                    dirrep_ic_rd_en_c4;            // From dirrep of l2t_dirrep_ctl.sv 
wire [3:0]              dirrep_ic_rdwr_panel_dec_c4;   // From dirrep of l2t_dirrep_ctl.sv 
wire [3:0]              dirrep_ic_rdwr_row_en_c4;      // From dirrep of l2t_dirrep_ctl.sv 
wire [5:0]              ic_rw_addr_0145;        // From ic_ctl_0145 of l2t_dir_ctl.sv , BS and SR 11/18/03 Reverse Directory change
wire [5:0]              ic_rw_addr_2367;        // From ic_ctl_2367 of l2t_dir_ctl.sv , BS and SR 11/18/03 Reverse Directory change
wire [5:0]              ic_rw_addr_89cd;        // From ic_ctl_89cd of l2t_dir_ctl.sv , BS and SR 11/18/03 Reverse Directory change
wire [5:0]              ic_rw_addr_abef;        // From ic_ctl_abef of l2t_dir_ctl.sv , BS and SR 11/18/03 Reverse Directory change
wire                    ic_warm_rst_0145;       // From ic_ctl_0145 of l2t_dir_ctl.sv 
wire                    ic_warm_rst_89cd;       // From ic_ctl_89cd of l2t_dir_ctl.sv 
wire                    dirrep_ic_wr_en_c4;            // From dirrep of l2t_dirrep_ctl.sv 
//wire                    arbadr_idx_c1c4comp_c1;        // From arbadr of l2t_arbadr_dp.sv 
//wire                    arbadr_idx_c1c5comp_c1;        // From arbadr of l2t_arbadr_dp.sv 
wire                    arb_inc_tag_ecc_cnt_c3_n;   // From arb of l2t_arb_ctl.sv 
wire [7:0]              dirrep_inval_mask_dcd_c4;      // From dirrep of l2t_dirrep_ctl.sv 
wire [7:0]              dirrep_inval_mask_icd_c4;      // From dirrep of l2t_dirrep_ctl.sv 
wire                    tagdp_invalid_evict_c3;       // From tagdp of l2t_tagdp_ctl.sv 
wire                    ique_iq_arb_atm_px2;      // From ique of l2t_ique_dp.sv 
wire                    ique_iq_arb_csr_px2;      // From ique of l2t_ique_dp.sv 
wire                    ique_iq_arb_st_px2;       // From ique of l2t_ique_dp.sv 
wire                    ique_iq_arb_vbit_px2;     // From ique of l2t_ique_dp.sv 
wire                    iqu_iq_arb_vld_px2;      // From iqu of l2t_iqu_ctl.sv 
wire [39:0]             ique_iq_arbdp_addr_px2;      // From ique of l2t_ique_dp.sv 
wire [63:0]             ique_iq_arbdp_data_px2;      // From ique of l2t_ique_dp.sv 
wire [24:0]             ique_iq_arbdp_inst_px2;      // From ique of l2t_ique_dp.sv // BS and SR 11/12/03 N2 Xbar Packet format
wire                    iqu_sel_c1;           // From iqu of l2t_iqu_ctl.sv 
wire                    iqu_sel_pcx;          // From iqu of l2t_iqu_ctl.sv 
//wire                    rdmat_sii_req_vld_buf;        // From rdmat of l2t_rdmat_ctl.sv 
wire                    csr_l2_bypass_mode_on;      // From csr of l2t_csr_ctl.sv 
//wire                    csr_l2_dbg_en;              // From csr of l2t_csr_ctl.sv 
wire                    csr_l2_dir_map_on;          // From csr of l2t_csr_ctl.sv 
wire                    csreg_tagdp_l2_dir_map_on;  // From csreg of l2t_csreg_ctl.sv
wire                    csreg_misbuf_l2_dir_map_on;  // From csreg of l2t_csreg_ctl.sv
wire                    csreg_filbuf_l2_dir_map_on;  // From csreg of l2t_csreg_ctl.sv

wire [5:0]              csr_l2_steering_tid;        // From csr of l2t_csr_ctl.sv, BS and SR 11/12/03 N2 Xbar Packet format 
wire [27:0]             decc_lda_syndrome_c9;        // From decc of l2t_decc_dp.sv 
wire [`TAG_WIDTH_LESS1:1]   tagd_lkup_tag_c1;            // From tagd of l2t_tagd_dp.sv 


wire [15:0]             vuaddp_lru_way_c3;             // From vuaddp of l2t_vuaddp_ctl.sv 
wire [15:0]             tagdp_lru_way_sel_c3;         // From tagdp of l2t_tagdp_ctl.sv 
wire [127:0]            mb_data_read_data;      // From mbdata of lib_r_rf16x128d_cust.sv 
wire                    misbuf_arb_mcurd_en;    // From misbuf of l2t_misbuf_ctl.sv 
wire                    misbuf_arb_l2rd_en;      // From misbuf of l2t_misbuf_ctl.sv 
wire                    misbuf_arb_cnt28_px2_prev;// From misbuf of l2t_misbuf_ctl.sv 
wire                    misbuf_arb_snp_cnt8_px1;// From misbuf of l2t_misbuf_ctl.sv 
wire                    misbuf_arb_vld_px1;   // From misbuf of l2t_misbuf_ctl.sv 
wire                    misbuf_arbdp_ctrue_px2;  // From misbuf of l2t_misbuf_ctl.sv 
wire                    misbuf_buf_rd_en;        // From misbuf of l2t_misbuf_ctl.sv 
wire                    misbuf_corr_err_c2;      // From misbuf of l2t_misbuf_ctl.sv 
wire                    misbuf_filbuf_mcu_pick;  // From misbuf of l2t_misbuf_ctl.sv 
wire [2:0]              misbuf_filbuf_fbid;       // From misbuf of l2t_misbuf_ctl.sv 
wire [4:0]              misbuf_filbuf_next_link_c4;// From misbuf of l2t_misbuf_ctl.sv, BS & SR 11/04/03, MB grows to 32
 
wire                    misbuf_filbuf_next_vld_c4;// From misbuf of l2t_misbuf_ctl.sv 
wire [3:0]              misbuf_filbuf_way;        // From misbuf of l2t_misbuf_ctl.sv 
wire                    misbuf_filbuf_way_fbid_vld;// From misbuf of l2t_misbuf_ctl.sv 
wire                    misbuf_hit_c3;           // From misbuf of l2t_misbuf_ctl.sv 
wire                    misbuf_hit_c4;           // From misbuf of l2t_misbuf_ctl.sv 
wire                    misbuf_nondep_fbhit_c3;  // From misbuf of l2t_misbuf_ctl.sv 
wire                    tag_misbuf_rdma_reg_vld_c2;  // From tag of l2t_tag_ctl.sv 
wire                    misbuf_tag_hit_unqual_c2;// From misbuf of l2t_misbuf_ctl.sv 
wire                    misbuf_uncorr_err_c2;    // From misbuf of l2t_misbuf_ctl.sv 
wire [4:0]              misbuf_wbuf_mbid_c4;    // From misbuf of l2t_misbuf_ctl.sv, BS & SR 11/04/03, MB grows to 32  
wire                    misbuf_wr64_miss_comp_c3;// From misbuf of l2t_misbuf_ctl.sv 
wire                    misbuf_mbf_delete_c4;          // From misbuf of l2t_misbuf_ctl.sv 
wire                    misbuf_mbf_insert_c4;          // From misbuf of l2t_misbuf_ctl.sv 
wire [4:0]              misbuf_mbf_insert_mbid_c4;     // From misbuf of l2t_misbuf_ctl.sv, BS & SR 11/04/03, MB grows to 32 
wire                    mbist_arb_l2d_en;       // From mbist of l2t_mbist_ctl.sv 
wire                    mbist_arb_l2t_write;    // From mbist of l2t_mbist_ctl.sv
wire                    mbist_arb_l2d_write;    // From mbist of l2t_mbist_ctl.sv 
wire                    mbist_l2d_en;           // From mbist of l2t_mbist_ctl.sv 
wire [8:0]              mbist_l2d_index;        // From mbist of l2t_mbist_ctl.sv 
wire [3:0]              mbist_l2d_way;          // From mbist of l2t_mbist_ctl.sv 
wire [3:0]              mbist_l2d_word_sel;     // From mbist of l2t_mbist_ctl.sv 
wire                    mbist_l2d_write;        // From mbist of l2t_mbist_ctl.sv 
wire [15:0]             mbist_l2t_dec_way;      // From mbist of l2t_mbist_ctl.sv 
wire [15:0]             tagd_mbist_l2t_dec_way_buf;  // From tagd of l2t_tagd_dp.sv 
wire [8:0]              mbist_l2t_index;        // From mbist of l2t_mbist_ctl.sv 
wire [8:0]              tagd_mbist_l2t_index_buf;    // From tagd of l2t_tagd_dp.sv 
wire                    mbist_l2t_read;         // From mbist of l2t_mbist_ctl.sv 
wire                    tagd_mbist_l2t_read_buf;     // From tagd of l2t_tagd_dp.sv 
wire [3:0]              mbist_l2t_way;          // From mbist of l2t_mbist_ctl.sv 
wire                    mbist_l2t_write;        // From mbist of l2t_mbist_ctl.sv 
wire                    tagd_mbist_l2t_write_buf;    // From tagd of l2t_tagd_dp.sv 
wire [8:0]              mbist_l2v_index;        // From mbist of l2t_mbist_ctl.sv 
wire                    mbist_l2v_read;         // From mbist of l2t_mbist_ctl.sv 
wire                    mbist_l2v_vd;           // From mbist of l2t_mbist_ctl.sv 
wire                    mbist_l2v_write;        // From mbist of l2t_mbist_ctl.sv 
wire                    mbist_stop_on_next_fail;// From test_stub of test_stub_bist.v 
wire [7:0]              mbist_write_data;       // From mbist of l2t_mbist_ctl.sv 
wire [7:0]              tagd_mbist_write_data_buf;   // From tagd of l2t_tagd_dp.sv 
wire [3:0]              csreg_mux1_addr_sel;          // From csreg of l2t_csreg_ctl.sv 
wire [3:0]              mux1_h_sel_r0;          // From vuad of l2t_vuad_dp.sv 
wire [3:0]              mux1_h_sel_r2;          // From vuad of l2t_vuad_dp.sv 
wire [3:0]              mux1_l_sel_r0;          // From vuad of l2t_vuad_dp.sv 
wire [3:0]              mux1_l_sel_r2;          // From vuad of l2t_vuad_dp.sv 
wire                    arb_mux1_mbsel_px1;         // From arb of l2t_arb_ctl.sv 
wire                    arb_mux1_mbsel_px2;         // From arb of l2t_arb_ctl.sv 
wire [3:0]              oqu_mux1_sel_data_c7;       // From oqu of l2t_oqu_ctl.sv 
wire [1:0]              csreg_mux1_synd_sel;          // From csreg of l2t_csreg_ctl.sv 
wire [2:0]              csreg_mux2_addr_sel;          // From csreg of l2t_csreg_ctl.sv 
wire                    vuad_mux2_sel_r0;            // From vuad of l2t_vuad_dp.sv 
wire                    vuad_mux2_sel_r2;            // From vuad of l2t_vuad_dp.sv 
wire [1:0]              csreg_mux2_synd_sel;          // From csreg of l2t_csreg_ctl.sv 
//wire                    arb_mux3_bufsel_px2;        // From arb of l2t_arb_ctl.sv 
wire                    oqu_mux_csr_sel_c7;         // From oqu of l2t_oqu_ctl.sv 
wire [1:0]              vuad_mux_sel;                // From vuad of l2t_vuad_dp.sv 
wire [3:0]              oqu_mux_vec_sel_c6;         // From oqu of l2t_oqu_ctl.sv 
wire                    csr_oneshot_dir_clear_c3;   // From csr of l2t_csr_ctl.sv 
wire                    oqu_arb_full_px2;  // From oqu of l2t_oqu_ctl.sv 
wire                    oqu_cerr_ack_c7;      // From oqu of l2t_oqu_ctl.sv 
wire                    oqu_diag_acc_c8;      // From oqu of l2t_oqu_ctl.sv 
wire                    oqu_imiss_hit_c8;     // From oqu of l2t_oqu_ctl.sv 
wire                    oqu_int_ack_c7;       // From oqu of l2t_oqu_ctl.sv 
wire                    oqu_l2_miss_c7;       // From oqu of l2t_oqu_ctl.sv 
wire                    oqu_pf_ack_c7;        // From oqu of l2t_oqu_ctl.sv 
wire                    oqu_rmo_st_c7;        // From oqu of l2t_oqu_ctl.sv 
wire [3:0]              oqu_rqtyp_rtn_c7;     // From oqu of l2t_oqu_ctl.sv 
wire                    oqu_st_complete_c7;   // From oqu of l2t_oqu_ctl.sv 
wire                    oqu_uerr_ack_c7;      // From oqu of l2t_oqu_ctl.sv 
wire [5:0]              oque_tid_c8;            // From oque of l2t_oque_dp.sv, BS and SR 11/12/03 N2 Xbar Packet format change 
wire                    rdmat_or_rdmat_valid;         // From rdmat of l2t_rdmat_ctl.sv 
wire [2:0]              oqu_out_mux1_sel_c7;        // From oqu of l2t_oqu_ctl.sv 
wire [2:0]              oqu_out_mux2_sel_c7;        // From oqu of l2t_oqu_ctl.sv 

wire			vuadpm_vd_ue_c4;
wire			vuadpm_ua_ue_c4;

wire                    iqu_pcx_l2t_atm_px2_p;    // From iqu of l2t_iqu_ctl.sv 
wire [4:0]              vuad_rd_addr1_r0;            // From vuad of l2t_vuad_dp.sv 
wire [4:0]              vuad_rd_addr1_r1;            // From vuad of l2t_vuad_dp.sv 
wire [4:0]              vuad_rd_addr1_r2;            // From vuad of l2t_vuad_dp.sv 
wire [4:0]              vuad_rd_addr1_r3;            // From vuad of l2t_vuad_dp.sv 
wire [4:0]              vuad_rd_addr2_r0;            // From vuad of l2t_vuad_dp.sv 
wire [4:0]              vuad_rd_addr2_r1;            // From vuad of l2t_vuad_dp.sv 
wire [4:0]              vuad_rd_addr2_r2;            // From vuad of l2t_vuad_dp.sv 
wire [4:0]              vuad_rd_addr2_r3;            // From vuad of l2t_vuad_dp.sv 
wire                    vuad_rd_addr_sel_r0;         // From vuad of l2t_vuad_dp.sv 
wire                    vuad_rd_addr_sel_r1;         // From vuad of l2t_vuad_dp.sv 
wire                    vuad_rd_addr_sel_r2;         // From vuad of l2t_vuad_dp.sv 
wire                    vuad_rd_addr_sel_r3;         // From vuad of l2t_vuad_dp.sv 
wire                    vuad_rd_en_r0;               // From vuad of l2t_vuad_dp.sv 
wire                    vuad_rd_en_r1;               // From vuad of l2t_vuad_dp.sv 
wire                    vuad_rd_en_r2;               // From vuad of l2t_vuad_dp.sv 
wire                    vuad_rd_en_r3;               // From vuad of l2t_vuad_dp.sv 
wire [1:0]              snp_rdmad_wr_entry_s2;      // From snp of l2t_snp_ctl.sv 
wire [39:6]             arbadr_rdmard_addr_c12;        // From arbadr of l2t_arbadr_dp.sv 
wire                    rdmat_rdmard_cerr_c12;        // From rdmat of l2t_rdmat_ctl.sv 
wire                    rdmat_rdmard_uerr_c12;        // From rdmat of l2t_rdmat_ctl.sv 
wire [3:0]              rdmat_pick_vec;         // From rdmat of l2t_rdmat_ctl.sv 
wire [1:0]              rdmat_wr_entry_s1;      // From rdmat of l2t_rdmat_ctl.sv 
wire                    rdmat_hit_unqual_c2; // From rdmat of l2t_rdmat_ctl.sv 
wire [4:0]              rdmat_misbuf_dep_mbid;// From rdmat of l2t_rdmat_ctl.sv, BS & SR 11/04/03, MB grows to 32 
wire                    rdmat_misbuf_dep_rdy_en;// From rdmat of l2t_rdmat_ctl.sv 
wire [3:0]              wbuf_reset_rdmat_vld;        // From wbuf of l2t_wbuf_ctl.sv 
wire [127:0]            retbuf_ret_data_c7;          // From retbuf2 of l2t_retbuf_dp.sv 
wire [127:0]            decc_ret_data_c8;          // From decc of l2t_decc_dp.sv 
wire [38:0]             decc_ret_diag_data_c7;     // From decc of l2t_decc_dp.sv 
wire [27:0]             retbuf_ret_ecc_c7;           // From retbuf2 of l2t_retbuf_dp.sv 
wire [2:0]              deccck_ret_err_c8;           // From deccck of l2t_deccck_ctl.sv 
wire [15:0]             tag_l2b_fbwr_wen_r2;      // From tag of l2t_tag_ctl.sv 
wire [3:0]              tag_scrub_addr_way;         // From tag of l2t_tag_ctl.sv 
wire                    oqu_sel_array_out_l;        // From oqu of l2t_oqu_ctl.sv 
wire                    iqu_sel_c1reg_over_iqarray; // From iqu of l2t_iqu_ctl.sv 
wire                    arb_sel_c2_stall_idx_c1;    // From arb of l2t_arb_ctl.sv 
wire                    arb_sel_deccck_addr_px2;      // From arb of l2t_arb_ctl.sv 
wire                    arb_sel_deccck_or_bist_idx;   // From arb of l2t_arb_ctl.sv 
wire                    vuaddp_sel_diag0_data_wr_c3;   // From vuaddp of l2t_vuaddp_ctl.sv 
wire                    vuaddp_sel_diag1_data_wr_c3;   // From vuaddp of l2t_vuaddp_ctl.sv 
wire                    arb_sel_diag_addr_px2;      // From arb of l2t_arb_ctl.sv 
wire                    arb_sel_diag_tag_addr_px2;  // From arb of l2t_arb_ctl.sv 
wire                    oqu_sel_inval_c7;           // From oqu of l2t_oqu_ctl.sv 
wire                    arb_sel_lkup_stalled_tag_px2;// From arb of l2t_arb_ctl.sv 
wire [3:0]              oqu_sel_mux1_c6;            // From oqu of l2t_oqu_ctl.sv 
wire [3:0]              oqu_sel_mux2_c6;            // From oqu of l2t_oqu_ctl.sv 
wire                    oqu_sel_mux3_c6;            // From oqu of l2t_oqu_ctl.sv 
wire                    tag_sel_rdma_inval_vec_c5;  // From tag of l2t_tag_ctl.sv 
wire                    arb_sel_tecc_addr_px2;      // From arb of l2t_arb_ctl.sv 
wire                    vuaddp_sel_ua_wr_data_byp;     // From vuaddp of l2t_vuaddp_ctl.sv 
wire                    vuaddp_sel_vd_wr_data_byp;     // From vuaddp of l2t_vuaddp_ctl.sv 
wire                    arb_sel_vuad_bist_px2;      // From arb of l2t_arb_ctl.sv 
wire                    arb_sel_way_px2;            // From arb of l2t_arb_ctl.sv 
wire [3:0]              wbuf_set_rdmat_acked;        // From wbuf of l2t_wbuf_ctl.sv 
wire [1:0]              arbdec_size_field_c8;          // From arbdec of l2t_arbdec_dp.sv 
wire                    snp_data1_wen0_s2;      // From snp of l2t_snp_ctl.sv 
wire                    snp_data1_wen1_s2;      // From snp of l2t_snp_ctl.sv 
wire                    snp_data2_wen0_s3;      // From snp of l2t_snp_ctl.sv 
wire                    snp_data2_wen1_s3;      // From snp of l2t_snp_ctl.sv 
wire                    snp_hdr1_wen0_s0;       // From snp of l2t_snp_ctl.sv 
wire                    snp_hdr1_wen1_s0;       // From snp of l2t_snp_ctl.sv 
wire                    snp_hdr2_wen0_s1;       // From snp of l2t_snp_ctl.sv 
wire                    snp_hdr2_wen1_s1;       // From snp of l2t_snp_ctl.sv 
wire                    snp_rd_ptr;          // From snp of l2t_snp_ctl.sv 
wire                    snp_wr_ptr;          // From snp of l2t_snp_ctl.sv 
wire                    snpd_rq_winv_s1;       // From snpd of l2t_snpd_dp.sv 
wire                    snp_snpq_arb_vld_px1;    // From snp of l2t_snp_ctl.sv 
wire [39:0]             snpd_snpq_arbdp_addr_px2;    // From snpd of l2t_snpd_dp.sv 
wire [6:0]             snpd_ecc_px2;    // From snpd of l2t_snpd_dp.sv 
wire [63:0]             snpd_snpq_arbdp_data_px2;    // From snpd of l2t_snpd_dp.sv 
wire [`JBI_HDR_SZ_LESS1:0]  snpd_snpq_arbdp_inst_px2;    // From snpd of l2t_snpd_dp.sv 
wire                    tag_spc_rd_cond_c3;         // From tag of l2t_tag_ctl.sv 
//wire                    vuaddp_st_to_data_array_c3;    // From vuaddp of l2t_vuaddp_ctl.sv 
wire                    arb_store_err_c8;           // From arb of l2t_arb_ctl.sv 
wire                    oqu_str_ld_hit_c7;          // From oqu of l2t_oqu_ctl.sv 
wire                    oqu_strst_ack_c7;           // From oqu of l2t_oqu_ctl.sv 
wire                    tagdp_tag_error_c8;           // From tagdp of l2t_tagdp_ctl.sv 
wire [15:0]             tagl_parity_c2;          // From tagl_1 of l2t_tagl_dp.sv, ... 
wire [3:0]              tagdp_quad_muxsel_c3;     // From tagdp of l2t_tagdp_ctl.sv 
wire [`TAG_WIDTH_LESS1:0]   tagl_quad0_c3;          // From tagl_1 of l2t_tagl_dp.sv 
wire [`TAG_WIDTH_LESS1:0]   tagl_quad1_c3;          // From tagl_1 of l2t_tagl_dp.sv 
wire [`TAG_WIDTH_LESS1:0]   tagl_quad2_c3;          // From tagl_2 of l2t_tagl_dp.sv 
wire [`TAG_WIDTH_LESS1:0]   tagl_quad3_c3;          // From tagl_2 of l2t_tagl_dp.sv 
wire [27:0]             tag_way0_tag_c2;        // From tag of lib_r_l2t_cust.sv 
wire [27:0]             tag_way10_tag_c2;       // From tag of lib_r_l2t_cust.sv 
wire [27:0]             tag_way11_tag_c2;       // From tag of lib_r_l2t_cust.sv 
wire [27:0]             tag_way1_tag_c2;        // From tag of lib_r_l2t_cust.sv 
wire [27:0]             tag_way2_tag_c2;        // From tag of lib_r_l2t_cust.sv 
wire [27:0]             tag_way3_tag_c2;        // From tag of lib_r_l2t_cust.sv 
wire [27:0]             tag_way4_tag_c2;        // From tag of lib_r_l2t_cust.sv 
wire [27:0]             tag_way5_tag_c2;        // From tag of lib_r_l2t_cust.sv 
wire [27:0]             tag_way6_tag_c2;        // From tag of lib_r_l2t_cust.sv 
wire [27:0]             tag_way7_tag_c2;        // From tag of lib_r_l2t_cust.sv 
wire [27:0]             tag_way8_tag_c2;        // From tag of lib_r_l2t_cust.sv 
wire [27:0]             tag_way9_tag_c2;        // From tag of lib_r_l2t_cust.sv 
wire [15:0]             tag_way_sel_c2;         // From tag of lib_r_l2t_cust.sv 
wire [27:0]             arbadr_tag_wrdata_px2;         // From arbadr of l2t_arbadr_dp.sv 
wire [27:0]             tagd_wrdata_px2_buf;     // From tagd of l2t_tagd_dp.sv 
wire                    tag_bsc_rd_vld_c7;   // From tag of l2t_tag_ctl.sv 
wire                    tag_cerr_ack_c5;     // From tag of l2t_tag_ctl.sv 
wire                    tag_deccck_addr3_c7;   // From tag of l2t_tag_ctl.sv 
wire                    tag_deccck_data_sel_c8;// From tag of l2t_tag_ctl.sv 
wire                    tag_fwd_req_ld_c6;   // From tag of l2t_tag_ctl.sv 
wire                    tag_fwd_req_ret_c5;  // From tag of l2t_tag_ctl.sv 
wire                    tag_hit_c3;          // From tag of l2t_tag_ctl.sv 
wire                    tag_hit_c5;          // From tag of l2t_tag_ctl.sv 
wire                    tag_hit_l2orfb_c3;   // From tag of l2t_tag_ctl.sv 
wire                    tag_hit_not_comp_c3; // From tag of l2t_tag_ctl.sv 
wire                    tag_hit_unqual_c2;   // From tag of l2t_tag_ctl.sv 
wire [15:0]             tag_hit_way_vld_c3;  // From tag of l2t_tag_ctl.sv 
wire                    tag_imiss_hit_c5;    // From tag of l2t_tag_ctl.sv 
wire                    tag_inc_rdma_cnt_c4; // From tag of l2t_tag_ctl.sv 
wire                    tag_inst_mb_c5;      // From tag of l2t_tag_ctl.sv 
wire                    tag_int_ack_c5;      // From tag of l2t_tag_ctl.sv 
wire                    tag_siu_req_en_c52;   // From tag of l2t_tag_ctl.sv 
wire                    tag_ld_hit_c5;       // From tag of l2t_tag_ctl.sv 
wire [3:0]              tag_lru_way_c4;      // From tag of l2t_tag_ctl.sv 
wire                    tag_misbuf_par_err_c3;// From tag of l2t_tag_ctl.sv 
wire                    tag_miss_unqual_c2;  // From tag of l2t_tag_ctl.sv 
wire                    tag_nonmem_comp_c6;  // From tag of l2t_tag_ctl.sv 
wire                    tag_rd64_complete_c11;// From tag of l2t_tag_ctl.sv 
wire                    tag_rdma_ev_en_c4;   // From tag of l2t_tag_ctl.sv 
wire                    tag_rdma_gate_off_c2;// From tag of l2t_tag_ctl.sv 
wire                    tag_rdma_vld_px0_p;  // From tag of l2t_tag_ctl.sv 
wire                    tag_rdma_vld_px1;    // From tag of l2t_tag_ctl.sv 
wire                    tag_rdma_wr_comp_c4; // From tag of l2t_tag_ctl.sv 
wire                    tag_rmo_st_ack_c5;   // From tag of l2t_tag_ctl.sv 
wire                    tag_scrub_rd_vld_c7; // From tag of l2t_tag_ctl.sv 
wire                    tag_set_rdma_reg_vld_c4;// From tag of l2t_tag_ctl.sv 
wire                    tag_spc_rd_vld_c6;   // From tag of l2t_tag_ctl.sv 
wire                    tag_st_ack_c5;       // From tag of l2t_tag_ctl.sv 
wire                    tag_st_req_c5;       // From tag of l2t_tag_ctl.sv 
wire                    tag_st_to_data_array_c3;// From tag of l2t_tag_ctl.sv 
wire                    tag_store_inst_c5;   // From tag of l2t_tag_ctl.sv 
wire                    tag_strst_ack_c5;    // From tag of l2t_tag_ctl.sv 
wire                    tag_uerr_ack_c5;     // From tag of l2t_tag_ctl.sv 
wire                    tagdp_arb_par_err_c3;// From tagdp of l2t_tagdp_ctl.sv 
wire [`TAG_WIDTH_LESS1:0]   tagd_diag_data_c7;     // From tagd of l2t_tagd_dp.sv 
wire [`TAG_WIDTH_LESS1:0]   tagd_evict_tag_c4;     // From tagd of l2t_tagd_dp.sv 
wire                    tagdp_misbuf_par_err_c3; // From tagdp of l2t_tagdp_ctl.sv 
wire                    tagdp_tag_par_err_c3;// From tagdp of l2t_tagdp_ctl.sv 
wire [3:0]              tagdp_quad0_muxsel_c3;       // From tagdp of l2t_tagdp_ctl.sv 
wire [3:0]              tagdp_quad1_muxsel_c3;       // From tagdp of l2t_tagdp_ctl.sv 
wire [3:0]              tagdp_quad2_muxsel_c3;       // From tagdp of l2t_tagdp_ctl.sv 
wire [3:0]              tagdp_quad3_muxsel_c3;       // From tagdp of l2t_tagdp_ctl.sv 
wire                    tag_uerr_ack_tmp_c4;        // From tag of l2t_tag_ctl.sv 
wire [77:0]             vuad_array_rd_data_c1;  // From io_left of l2t_vuadio_dp.sv, ... 
wire [77:0]             vlddir_vuad_array_wr_data_c4;  // From vlddir of l2t_vlddir_dp.sv, ... 
wire                    vuaddp_vuad_array_wr_en0_c4;   // From vuaddp of l2t_vuaddp_ctl.sv 
wire                    vuaddp_vuad_array_wr_en1_c4;   // From vuaddp of l2t_vuaddp_ctl.sv 
wire [15:0]             usaloc_vuad_alloc_c2;       // From usaloc of l2t_usaloc_dp.sv 
wire [15:0]             usaloc_vuad_used_c2;        // From usaloc of l2t_usaloc_dp.sv 
wire [15:0]             vlddir_vuad_valid_c2;       // From vlddir of l2t_vlddir_dp.sv 
wire                    vuaddp_vuad_error_c8;          // From vuaddp of l2t_vuaddp_ctl.sv 
wire [8:0]              evctag_vuad_idx_c3;            // From evctag of l2t_evctag_dp.sv 
wire [8:0]              vuaddp_vuad_idx_c4;            // From vuaddp of l2t_vuaddp_ctl.sv 
wire                    vuaddp_vuad_sel_c2;            // From vuaddp of l2t_vuaddp_ctl.sv 
wire                    vuaddp_vuad_sel_c2_d1;         // From vuaddp of l2t_vuaddp_ctl.sv 
wire                    vuaddp_vuad_sel_c4;            // From vuaddp of l2t_vuaddp_ctl.sv 
wire                    vuaddp_vuad_sel_rd;            // From vuaddp of l2t_vuaddp_ctl.sv 
wire	[6:0]		usaloc_ua_synd_c9;
wire	[6:0]		vlddir_vd_synd_c9;

wire                    vuaddp_vuad_tagd_sel_c2_d1;   // From vuaddp of l2t_vuaddp_ctl.sv 
wire                    arb_vuadctl_no_bypass_px2;  // From arb of l2t_arb_ctl.sv 
wire                    wbuf_wb_or_rdma_wr_req_en;   // From wbuf of l2t_wbuf_ctl.sv 
wire                    wbuf_arb_full_px1;  // From wbuf of l2t_wbuf_ctl.sv 
wire                    wbuf_hit_unqual_c2;    // From wbuf of l2t_wbuf_ctl.sv 
wire [4:0]              wbuf_misbuf_dep_mbid;   // From wbuf of l2t_wbuf_ctl.sv, BS & SR 11/04/03, MB grows to 32 
wire                    wbuf_misbuf_dep_rdy_en; // From wbuf of l2t_wbuf_ctl.sv 
wire                    wbuf_wr_addr_sel;      // From wbuf of l2t_wbuf_ctl.sv 
wire [3:0]              vuad_word_en_r0;             // From vuad of l2t_vuad_dp.sv 
wire [3:0]              vuad_word_en_r1;             // From vuad of l2t_vuad_dp.sv 
wire [3:0]              vuad_word_en_r2;             // From vuad of l2t_vuad_dp.sv 
wire [3:0]              vuad_word_en_r3;             // From vuad of l2t_vuad_dp.sv 
wire                    arbdat_word_lower_cmp_c8;      // From arbdat of l2t_arbdat_dp.sv 
wire                    arbdat_word_upper_cmp_c8;      // From arbdat of l2t_arbdat_dp.sv 
wire                    vuaddp_wr64_inst_c3;           // From vuaddp of l2t_vuaddp_ctl.sv 
wire                    arb_wr8_inst_no_ctrue_c1;   // From arb of l2t_arb_ctl.sv 
wire [4:0]              vuad_wr_addr_r0;             // From vuad of l2t_vuad_dp.sv 
wire [4:0]              vuad_wr_addr_r1;             // From vuad of l2t_vuad_dp.sv 
wire [4:0]              vuad_wr_addr_r2;             // From vuad of l2t_vuad_dp.sv 
wire [4:0]              vuad_wr_addr_r3;             // From vuad of l2t_vuad_dp.sv 
wire [4:0]              dirrep_wr_dc_dir_entry_c4;     // From dirrep of l2t_dirrep_ctl.sv, BS and SR 11/18/03 Reverse Directory change 
wire                    vuad_wr_en_r0c0;             // From vuad of l2t_vuad_dp.sv 
wire                    vuad_wr_en_r0c1;             // From vuad of l2t_vuad_dp.sv 
wire                    vuad_wr_en_r1c0;             // From vuad of l2t_vuad_dp.sv 
wire                    vuad_wr_en_r1c1;             // From vuad of l2t_vuad_dp.sv 
wire                    vuad_wr_en_r2c0;             // From vuad of l2t_vuad_dp.sv 
wire                    vuad_wr_en_r2c1;             // From vuad of l2t_vuad_dp.sv 
wire                    vuad_wr_en_r3c0;             // From vuad of l2t_vuad_dp.sv 
wire                    vuad_wr_en_r3c1;             // From vuad of l2t_vuad_dp.sv 
//wire                    csreg_wr_enable_async_c9;     // From csreg of l2t_csreg_ctl.sv 
wire                    csreg_wr_enable_tid_c9;       // From csreg of l2t_csreg_ctl.sv 
wire [4:0]              dirrep_wr_ic_dir_entry_c4;     // From dirrep of l2t_dirrep_ctl.sv, BS and SR 11/18/03 Reverse Directory change 
wire [6:0]              mb0_dcache_index_unused;
wire [1:0]              mb0_dcache_way_unused;
wire [7:0]              mb0_icache_index_unused;
wire [1:0]              mb0_icache_way_unused;
wire [7:0]              mb0_write_data_unused;



clkgen_l2t_cmp l2t_clk_header 
        ( 
	.array_wr_inhibit(array_wr_inhibit),
        .tcu_wr_inhibit (tcu_array_wr_inhibit),
        .tcu_atpg_mode(tcu_atpg_mode),
        .scan_in(l2t_clk_header_scanin),
        .scan_out(l2t_clk_header_scanout),
        .l2clk                  (l2clk                  ),
        .aclk                   (aclk                   ),
        .bclk                   (bclk                   ),
        .pce_ov                 (ce_ovrd                ),
        .wmr_protect            (wmr_protect            ),
        .wmr_                   (wmr_l                  ),
	.cluster_arst_l         (cluster_arst_l         ),
	.ccu_serdes_dtm         (1'b0         		),
	.aclk_wmr               (aclk_wmr               ),
        .por_                   (por_l                  ),
        .cmp_slow_sync_en       (cmp_io_sync_en         ),
        .slow_cmp_sync_en       (io_cmp_sync_en         ),
        .tcu_clk_stop           (tcu_clk_stop           ),
        .tcu_pce_ov             (tcu_pce_ov             ),
        .rst_wmr_protect        (rst_wmr_protect        ),
        .rst_wmr_               (rst_wmr_               ),
        .rst_por_               (rst_por_               ),
        .ccu_cmp_slow_sync_en   (ccu_cmp_slow_sync_en   ),
        .ccu_slow_cmp_sync_en   (ccu_slow_cmp_sync_en   ),
        .tcu_div_bypass         (1'b0                   ),
        .ccu_div_ph             (1'b1                   ),
        .cluster_div_en         (1'b0                   ),
        .gclk                   (gclk                   ),
        .clk_ext                (1'b0                   ),
        .tcu_aclk               (tcu_aclk               ),
        .tcu_bclk               (tcu_bclk               ),
        .scan_en                (tcu_scan_en            )
        );



l2t_vuad_ctl      vuad( 
        .tcu_pce_ov(ce_ovrd),
        .tcu_aclk(aclk),
        .tcu_bclk(bclk),
        .tcu_scan_en(tcu_scan_en),
        .tcu_clk_stop(1'b0),
        // Outputs 
        .vuad_rd_addr1_r0(vuad_rd_addr1_r0[4:0]), 
        .vuad_rd_addr2_r0(vuad_rd_addr2_r0[4:0]), 
        .vuad_rd_addr_sel_r0(vuad_rd_addr_sel_r0), 
        .vuad_wr_addr_r0(vuad_wr_addr_r0[4:0]), 
        .vuad_word_en_r0(vuad_word_en_r0[3:0]), 
        .vuad_wr_en_r0c0(vuad_wr_en_r0c0), 
        .vuad_wr_en_r0c1(vuad_wr_en_r0c1), 
        .vuad_mux1_h_sel_r0(mux1_h_sel_r0[3:0]), 
        .vuad_mux1_l_sel_r0(mux1_l_sel_r0[3:0]), 
        .vuad_mux2_sel_r0(vuad_mux2_sel_r0), 
        .vuad_rd_en_r0  (vuad_rd_en_r0), 
        .vuad_rd_addr1_r1(vuad_rd_addr1_r1[4:0]), 
        .vuad_rd_addr2_r1(vuad_rd_addr2_r1[4:0]), 
        .vuad_rd_addr_sel_r1(vuad_rd_addr_sel_r1), 
        .vuad_wr_addr_r1(vuad_wr_addr_r1[4:0]), 
        .vuad_word_en_r1(vuad_word_en_r1[3:0]), 
        .vuad_wr_en_r1c0(vuad_wr_en_r1c0), 
        .vuad_wr_en_r1c1(vuad_wr_en_r1c1), 
        .vuad_rd_en_r1  (vuad_rd_en_r1), 
        .vuad_rd_addr1_r2(vuad_rd_addr1_r2[4:0]), 
        .vuad_rd_addr2_r2(vuad_rd_addr2_r2[4:0]), 
        .vuad_rd_addr_sel_r2(vuad_rd_addr_sel_r2), 
        .vuad_wr_addr_r2(vuad_wr_addr_r2[4:0]), 
        .vuad_word_en_r2(vuad_word_en_r2[3:0]), 
        .vuad_wr_en_r2c0(vuad_wr_en_r2c0), 
        .vuad_wr_en_r2c1(vuad_wr_en_r2c1), 
        .vuad_mux1_h_sel_r2(mux1_h_sel_r2[3:0]), 
        .vuad_mux1_l_sel_r2(mux1_l_sel_r2[3:0]), 
        .vuad_mux2_sel_r2(vuad_mux2_sel_r2), 
        .vuad_rd_en_r2  (vuad_rd_en_r2), 
        .vuad_rd_addr1_r3(vuad_rd_addr1_r3[4:0]), 
        .vuad_rd_addr2_r3(vuad_rd_addr2_r3[4:0]), 
        .vuad_rd_addr_sel_r3(vuad_rd_addr_sel_r3), 
        .vuad_wr_addr_r3(vuad_wr_addr_r3[4:0]), 
        .vuad_word_en_r3(vuad_word_en_r3[3:0]), 
        .vuad_wr_en_r3c0(vuad_wr_en_r3c0), 
        .vuad_wr_en_r3c1(vuad_wr_en_r3c1), 
        .vuad_rd_en_r3  (vuad_rd_en_r3), 
        .vuad_mux_sel   (vuad_mux_sel[1:0]), 
        // Inputs 
        .rd_addr1  (arbadr_arbdp_vuad_idx1_px2[8:0]), // Templated 
        .rd_addr2  (arbadr_arbdp_vuad_idx2_px2[8:0]), // Templated 
        .rd_addr_sel(arb_vuad_idx2_sel_px2_n), // Templated 
        .wr_addr   (vuaddp_vuad_idx_c4[8:0]),      // Templated 
        .wr_en0    (vuaddp_vuad_array_wr_en0_c4),  // Templated 
        .wr_en1    (vuaddp_vuad_array_wr_en1_c4),  // Templated 
        .array_rd_en(arb_vuad_acc_px2),  // Templated 
        .scan_in(vuad_scanin),
        .scan_out(vuad_scanout),
        .l2clk      (l2clk),
        .vuaddp_vuad_sel_c2(vuaddp_vuad_sel_c2), 
        .vuaddp_vuad_sel_c2_d1(vuaddp_vuad_sel_c2_d1), 
        .vuaddp_vuad_sel_c4(vuaddp_vuad_sel_c4), 
        .vuaddp_vuad_sel_rd(vuaddp_vuad_sel_rd), 
        .vuaddp_vuad_tagd_sel_c2_d1(vuaddp_vuad_tagd_sel_c2_d1), 
        //.vuaddp_st_to_data_array_c3(vuaddp_st_to_data_array_c3), 
        .vuaddp_wr64_inst_c3(vuaddp_wr64_inst_c3), 
//        .vuaddp_vuad_evict_c3(vuaddp_vuad_evict_c3), 
        .vuaddp_alloc_set_cond_c3(alloc_set_cond_c3), 
        .vuaddp_alloc_rst_cond_c3(alloc_rst_cond_c3), 
        .vuaddp_vuad_error_c8(vuaddp_vuad_error_c8), 
       // .vuaddp_hit_wayvld_c3(vuaddp_hit_wayvld_c3[15:0]), 
        .vuaddp_fill_way_c3(vuaddp_fill_way_c3[15:0]), 
       // .vuaddp_lru_way_c3(vuaddp_lru_way_c3[15:0]), 
        .vuaddp_bistordiag_wr_vd_c4(vuaddp_bistordiag_wr_vd_c4), 
        .vuaddp_bistordiag_wr_ua_c4(vuaddp_bistordiag_wr_ua_c4), 
        .vuaddp_sel_ua_wr_data_byp(vuaddp_sel_ua_wr_data_byp), 
        .vuaddp_sel_vd_wr_data_byp(vuaddp_sel_vd_wr_data_byp), 
        .vuaddp_sel_diag0_data_wr_c3(vuaddp_sel_diag0_data_wr_c3), 
        .vuaddp_sel_diag1_data_wr_c3(vuaddp_sel_diag1_data_wr_c3), 
        .vuaddp_vuad_array_wr_en0_c4(vuaddp_vuad_array_wr_en0_c4), 
        .vuaddp_vuad_array_wr_en1_c4(vuaddp_vuad_array_wr_en1_c4), 
        .vuaddp_vuad_idx_c4(vuaddp_vuad_idx_c4[8:0]), 
        // Inputs 
        .bist_vuad_idx_c3(mbist_l2v_index[8:0]), // Templated 
        .evctag_vuad_idx_c3(evctag_vuad_idx_c3[8:0]), 
        .bist_wr_vd_c3(mbist_l2v_vd),       // Templated 
      //  .tag_hit_way_vld_c3(tag_hit_way_vld_c3[15:0]), 
       // .tagdp_lru_way_sel_c3(tagdp_lru_way_sel_c3[15:0]), 
       // .tag_st_to_data_array_c3(tag_st_to_data_array_c3), 
        .arb_decdp_wr64_inst_c2(arb_decdp_wr64_inst_c2), 
//        .tagdp_evict_c3  (tagdp_evict_c3), 
        .arb_acc_vd_c2(arb_acc_vd_c2), 
        .arb_acc_ua_c2(arb_acc_ua_c2), 
				.arbadr_idx_c1c2comp_c1_n(arbadr_idx_c1c2comp_c1_n),
				.arbadr_idx_c1c3comp_c1_n(arbadr_idx_c1c3comp_c1_n),
				.arbadr_idx_c1c4comp_c1_n(arbadr_idx_c1c4comp_c1_n),
				.arbadr_idx_c1c5comp_c1_n(arbadr_idx_c1c5comp_c1_n),
        .arb_decdp_inst_int_c1(arb_decdp_inst_int_c1), 
        .csr_l2_bypass_mode_on(csr_vuad_l2off), // Templated 
        .arb_inst_diag_c1(arb_inst_diag_c1), 
        .bist_vuad_wr_en(mbist_l2v_write),  // Templated 
        .arb_inst_vld_c2(arb_inst_vld_c2), 
        .arb_inst_l2vuad_vld_c3(arb_inst_l2vuad_vld_c3), 
        .arb_decdp_st_inst_c3(arb_decdp_st_inst_c3), 
        .arbdec_arbdp_inst_fb_c2(arbdec_arbdp_inst_fb_c2), 
        .vuadpm_vd_ue_c4(vuadpm_vd_ue_c4), // vuad ecc change
        .vuadpm_ua_ue_c4(vuadpm_ua_ue_c4), // vuad ecc change
        .arbdec_arbdp_inst_way_c2(arbdec_arbdp_inst_way_c2[3:0]), 
        .arb_arbdp_vuadctl_pst_no_ctrue_c2(arb_arbdp_vuadctl_pst_no_ctrue_c2), 
        .arb_decdp_cas1_inst_c2(arb_decdp_cas1_inst_c2), 
        .arb_arbdp_pst_with_ctrue_c2(arb_arbdp_pst_with_ctrue_c2), 
        .arb_decdp_cas2_inst_c2(arb_decdp_cas2_inst_c2), 
        .arbdec_arbdp_inst_mb_c2(arbdec_arbdp_inst_mb_c2), 
        .arb_vuadctl_no_bypass_px2(arb_vuadctl_no_bypass_px2),
  .mbist_run(mbist_run),
  .vuad_usaloc_mux_used_and_alloc_comb_sel0(vuad_usaloc_mux_used_and_alloc_comb_sel0),
  .vuad_usaloc_mux_used_and_alloc_comb_sel1(vuad_usaloc_mux_used_and_alloc_comb_sel1),
  .vuad_usaloc_mux_used_and_alloc_comb_sel2(vuad_usaloc_mux_used_and_alloc_comb_sel2),
  .vuad_usaloc_mux_used_and_alloc_comb_sel3(vuad_usaloc_mux_used_and_alloc_comb_sel3),
  .vuad_usaloc_mux_used_and_alloc_comb_sel4(vuad_usaloc_mux_used_and_alloc_comb_sel4),
  .vuad_usaloc_mux_used_and_alloc_comb_sel5(vuad_usaloc_mux_used_and_alloc_comb_sel5),
  .mux_valid_dirty_c1_sel0(mux_valid_dirty_c1_sel0),
  .mux_valid_dirty_c1_sel1(mux_valid_dirty_c1_sel1),
  .mux_valid_dirty_c1_sel2(mux_valid_dirty_c1_sel2)
	); 






 
l2t_vuadpm_dp		vuadpm(	
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
				.tcu_clk_stop(1'b0),
			/*AUTOINST*/ 
                           // Outputs 
                            .vuadpm_vuad_diag_data_c7(vuad_diag_data_c7[38:0]), 
                            .vuadpm_bistordiag_ua_data(vuadpm_bistordiag_ua_data[38:0]), 
                            .vuadpm_bistordiag_vd_data(vuadpm_bistordiag_vd_data[38:0]), 
		     .vlddir_vd_synd_c2 (vlddir_vd_synd_c2[5:0]),//BSandSR VUAD ECC Change 8/9/04
			.vlddir_vd_ce_c2(vlddir_vd_ce_c2[1]),
			// New
   			    .usaloc_ua_synd_c9		(usaloc_ua_synd_c9[6:0]),
   			    .vlddir_vd_synd_c9		(vlddir_vd_synd_c9[6:0]),
			    .vuadpm_vd_ue_c4(vuadpm_vd_ue_c4),
			    .vuadpm_ua_ue_c4(vuadpm_ua_ue_c4),
			.bist_vuad_rd_en_px1(mbist_l2v_read),
                           // Inputs 
                           .scan_in(vuadpm_scanin),
                           .scan_out(vuadpm_scanout),
                           .l2clk        (l2clk), 
                            .usaloc_diag_rd_ua_out(usaloc_diag_rd_ua_out[38:0]), 
                            .vlddir_diag_rd_vd_out(vlddir_diag_rd_vd_out[38:0]), 
                           .arb_acc_ua_c2(arb_acc_ua_c2), 
                            .arbdat_arbdata_wr_data_c2(arbdata_wr_data_c2[38:0]), 
                           .bist_vuad_data_in(mbist_write_data[7:0]), // Templated 
                            .vuaddp_sel_diag1_data_wr_c3(vuaddp_sel_diag1_data_wr_c3), 
                            .vuaddp_sel_diag0_data_wr_c3(vuaddp_sel_diag0_data_wr_c3),
  .usaloc_ua_ue_c2(usaloc_ua_ue_c2),
  .vlddir_vd_ue_c2(vlddir_vd_ue_c2),
  .usaloc_ua_synd_c2(usaloc_ua_synd_c2[5:0]),
  .usaloc_ua_ce_c2(usaloc_ua_ce_c2),
  .mbist_write_data(mbist_write_data[7:0]),
  .mbist_l2vuad_fail(mbist_l2vuad_fail)); 
 
l2t_vlddir_dp		vlddir(
                      .tcu_pce_ov(ce_ovrd),
                      .tcu_aclk(aclk),
                      .tcu_bclk(bclk),
		      .tcu_scan_en(tcu_scan_en),
		      .tcu_clk_stop(1'b0),
                    // Outputs 
                     .vlddir_vuad_array_wr_data_c4(vlddir_vuad_array_wr_data_c4[38:0]), 
                     .vlddir_dirty_evict_c3     (vlddir_dirty_evict_c3), 
                     .vlddir_vuad_valid_c2   (vlddir_vuad_valid_c2[15:0]), 
                     .vlddir_diag_rd_vd_out     (vlddir_diag_rd_vd_out[38:0]), 
		     .vlddir_vd_ue_c2	(vlddir_vd_ue_c2), // BS and SR VUAD ECC Change 8/9/04
		     .vlddir_vd_ce_c2	(vlddir_vd_ce_c2[1:0]), // BS and SR VUAD ECC Change 8/9/04
		     .vlddir_vd_synd_c2 (vlddir_vd_synd_c2[5:0]),//BSandSR VUAD ECC Change 8/9/04
                    // Inputs 
		     .arb_vuad_ce_err_c3 (usaloc_vlddir_arb_vuad_ce_err_c3_rep1_v1),
		     .tag_hit_way_vld_c3(tag_hit_way_vld_c3_rep2[15:0]),
                     .scan_in(vlddir_scanin),
                     .scan_out(vlddir_scanout),
                     .l2clk               (l2clk), 
//                     .vuaddp_lru_way_c3         (vuaddp_lru_way_c3[15:0]), 
                     .vuaddp_lru_way_c3         (tagdp_lru_way_sel_c3_rep2[15:0]), 
                     .vuaddp_fill_way_c3        (vuaddp_fill_way_c3[15:0]), 
                     //.vuaddp_hit_wayvld_c3      (vuaddp_hit_wayvld_c3[15:0]), 
                     .vuadpm_bistordiag_vd_data (vuadpm_bistordiag_vd_data[38:0]), 
                     .vuaddp_vuad_evict_c3      (tagdp_evict_c3_2_rep1), 
                     .vuaddp_wr64_inst_c3       (vuaddp_wr64_inst_c3), 
                     .vuaddp_st_to_data_array_c3(tag_st_to_data_array_c3_rep1), 
                     .vuaddp_vuad_sel_c2        (vuaddp_vuad_sel_c2), 
                     .vuaddp_vuad_sel_c4        (vuaddp_vuad_sel_c4), 
                     .vuaddp_vuad_sel_rd        (vuaddp_vuad_sel_rd), 
                     .vuaddp_vuad_sel_c2_d1     (vuaddp_vuad_sel_c2_d1), 
                     .vuaddp_bistordiag_wr_vd_c4(vuaddp_bistordiag_wr_vd_c4), 
                     .vuaddp_sel_vd_wr_data_byp (vuaddp_sel_vd_wr_data_byp), 
                     .vuad_array_rd_data_c1(vuad_array_rd_data_c1[38:0]),
  .tcu_muxtest(tcu_muxtest),
  .mux_valid_dirty_c1_sel0(mux_valid_dirty_c1_sel0),
  .mux_valid_dirty_c1_sel1(mux_valid_dirty_c1_sel1),
  .mux_valid_dirty_c1_sel2(mux_valid_dirty_c1_sel2)); 
 
l2t_usaloc_dp		usaloc(
                     .tcu_pce_ov(ce_ovrd),
                     .tcu_aclk(aclk),
                     .tcu_bclk(bclk),
		     .tcu_scan_en(tcu_scan_en),
		     .tcu_clk_stop(1'b0),
                    // Outputs 
                     .usaloc_vuad_array_wr_data_c4(vlddir_vuad_array_wr_data_c4[77:39]), 
                     .usaloc_vuad_used_c2    (usaloc_vuad_used_c2[15:0]), 
                     .usaloc_vuad_alloc_c2   (usaloc_vuad_alloc_c2[15:0]), 
                     .usaloc_diag_rd_ua_out     (usaloc_diag_rd_ua_out[38:0]), 
		     .usaloc_ua_ue_c2	(usaloc_ua_ue_c2), // BS and SR VUAD ECC Change 8/9/04
		     .usaloc_ua_ce_c2	(usaloc_ua_ce_c2), // BS and SR VUAD ECC Change 8/9/04
		     .usaloc_ua_synd_c2	(usaloc_ua_synd_c2[5:0]), //BS and SR VUAD ECC Change
                    // Inputs 
		.arb_vuad_ce_err_c3 (usaloc_vlddir_arb_vuad_ce_err_c3_rep1_v2),
		.tag_hit_way_vld_c3(tag_hit_way_vld_c3_rep20[15:0]),
                     .scan_in(usaloc_scanin),
                     .scan_out(usaloc_scanout),
                     .l2clk               (l2clk), 
                     .arb_bs_or_bis_inst_c2    (arb_bs_or_bis_inst_c2),
                     .tagdp_lru_way_sel_c3     (tagdp_lru_way_sel_c3_rep20[15:0]), 
                     .vuaddp_fill_way_c3        (vuaddp_fill_way_c3[15:0]), 
                    // .vuaddp_hit_wayvld_c3      (vuaddp_hit_wayvld_c3[15:0]), 
                     .vuadpm_bistordiag_ua_data (vuadpm_bistordiag_ua_data[38:0]), 
                     .vuaddp_vuad_evict_c3      (tagdp_evict_c3_1_rep1), 
                     .vuaddp_wr64_inst_c3       (vuaddp_wr64_inst_c3), 
                     .vuaddp_vuad_sel_c4        (vuaddp_vuad_sel_c4), 
                     .vuaddp_vuad_sel_rd        (vuaddp_vuad_sel_rd), 
                     .vuaddp_vuad_sel_c2_d1     (vuaddp_vuad_sel_c2_d1), 
                     .vuaddp_bistordiag_wr_ua_c4(vuaddp_bistordiag_wr_ua_c4), 
                     .vuaddp_sel_ua_wr_data_byp (vuaddp_sel_ua_wr_data_byp), 
                     .vuaddp_alloc_set_cond_c3  (alloc_set_cond_c3), 
                     .vuaddp_alloc_rst_cond_c3  (alloc_rst_cond_c3), 
                    .filbuf_vuad_bypassed_c3(filbuf_vuad_bypassed_c3), 
                    .vuad_array_rd_data_c1(vuad_array_rd_data_c1[77:39]),
  .tcu_muxtest(tcu_muxtest),
  .vuad_usaloc_mux_used_and_alloc_comb_sel0(vuad_usaloc_mux_used_and_alloc_comb_sel0),
  .vuad_usaloc_mux_used_and_alloc_comb_sel1(vuad_usaloc_mux_used_and_alloc_comb_sel1),
  .vuad_usaloc_mux_used_and_alloc_comb_sel2(vuad_usaloc_mux_used_and_alloc_comb_sel2),
  .vuad_usaloc_mux_used_and_alloc_comb_sel3(vuad_usaloc_mux_used_and_alloc_comb_sel3),
  .vuad_usaloc_mux_used_and_alloc_comb_sel4(vuad_usaloc_mux_used_and_alloc_comb_sel4),
  .vuad_usaloc_mux_used_and_alloc_comb_sel5(vuad_usaloc_mux_used_and_alloc_comb_sel5)); 
 
 
//////////////////////////// 
// tag array template 
/////////////////////////// 
 

n2_l2t_sp_28kb_cust		tag(
.bist_index0                    (tagd_mbist_l2t_index_buf[8:0]),
.bist_index1                    (tagd_mbist_l2t_index_buf[8:0]),
.bist_rd_en0                    (tagd_mbist_l2t_read_buf),
.bist_rd_en1                    (tagd_mbist_l2t_read_buf),
.bist_way                       (tagd_mbist_l2t_dec_way_buf[15:0]),
.bist_wr_en0                    (tagd_mbist_l2t_write_buf),
.bist_wr_en1                    (tagd_mbist_l2t_write_buf),
.bist_wrdata0                   (tagd_mbist_write_data_buf[7:0] ),
.bist_wrdata1                   (tagd_mbist_write_data_buf[7:0] ),
.tcu_clk_stop                   (1'b0),
.index0                         (tagd_arbdp_tag_idx_px2_buf_1[8:0]),
.index1                         (tagd_arbdp_tag_idx_px2_buf_2[8:0]),
.scan_in(tag_scanin),
.scan_out(tag_scanout),
.l2clk                          (l2clk),
.lkup_tag0                      (tagd_lkup_tag_c1[`TAG_WIDTH_LESS1:1]),
.lkup_tag1                      (tagd_lkup_tag_c1[`TAG_WIDTH_LESS1:1]),
.pce                            (1'b1),
.vnw_ary                        (vnw_ary),
.tcu_pce_ov                     (ce_ovrd),
.rd_en0                         (tagd_arb_tag_rd_px2_buf),
.rd_en1                         (tagd_arb_tag_rd_px2_buf),
.hdr_l2t_rvalue			(l2t_tag_rvalue[5:0]),
.hdr_l2t_rid			(l2t_tag_rid[3:0]),
.hdr_l2t_wr_en			(l2t_tag_wr_en),
.hdr_l2t_red_clr		(l2t_tag_fuse_clr),
// fuse
.tcu_scan_en0                   (tcu_scan_en),
.tcu_scan_en1                   (tcu_scan_en),
.tcu_se_scancollar_in0          (tcu_se_scancollar_in),
.tcu_se_scancollar_in1          (tcu_se_scancollar_in),
.tcu_se_scancollar_out0         (tcu_se_scancollar_out),
.tcu_se_scancollar_out1         (tcu_se_scancollar_out),
.tcu_aclk0                      (aclk),
.tcu_aclk1                      (aclk),
.tcu_bclk0                      (bclk),
.tcu_bclk1                      (bclk),
.w_inhibit0                     (array_wr_inhibit),
.w_inhibit1                     (array_wr_inhibit),
.way                            (tagd_arb_tag_way_px2_buf[15:0] ),
.wr_en0                         (tagd_arb_tag_wr_px2_buf),
.wr_en1                         (tagd_arb_tag_wr_px2_buf),
.wrdata0                        (tagd_wrdata_px2_buf[27:0]),
.wrdata1                        (tagd_wrdata_px2_buf[27:0]),
.l2t_bist_en0			(mbist_run),
.l2t_bist_en1			(mbist_run),
.wr_en_ov			(1'b1),
.clk_en0			(1'b1),
.clk_en1			(1'b1),
.clk_en_ov			(1'b1),
// outputs
.l2t_hdr_read_data              (tag_fuse_read_data[5:0]),   
.tag_way0                       (tag_way0_tag_c2[27:0]),
.tag_way1                       (tag_way1_tag_c2[27:0]),
.tag_way2                       (tag_way2_tag_c2[27:0]),
.tag_way3                       (tag_way3_tag_c2[27:0]),
.tag_way4                       (tag_way4_tag_c2[27:0]),
.tag_way5                       (tag_way5_tag_c2[27:0]),
.tag_way6                       (tag_way6_tag_c2[27:0]),
.tag_way7                       (tag_way7_tag_c2[27:0]),
.tag_way8                       (tag_way8_tag_c2[27:0]),
.tag_way9                       (tag_way9_tag_c2[27:0]),
.tag_way10                      (tag_way10_tag_c2[27:0]),
.tag_way11                      (tag_way11_tag_c2[27:0]),
.tag_way12                      (tag_way12_tag_c2[27:0]),
.tag_way13                      (tag_way13_tag_c2[27:0]),
.tag_way14                      (tag_way14_tag_c2[27:0]),
.tag_way15                      (tag_way15_tag_c2[27:0]),
.way_hit                        (tag_way_sel_c2[15:0])
);

 
//////////////////////////// 
// tag dp template 
/////////////////////////// 
 
l2t_tagl_dp tagl_1( 
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
				.tcu_clk_stop(1'b0),
                                .tcu_muxtest(tcu_muxtest),
			/*AUTOINST*/ 
                        // Outputs 
                         .tagl_parity_c2      (tagl_parity_c2[7:0]),    // Templated 
                         .tagl_tag_quad0_c3  (tagl_quad0_c3[`TAG_WIDTH_LESS1:0]), // Templated ,BS & SR 10/28/03
                         .tagl_tag_quad1_c3  (tagl_quad1_c3[`TAG_WIDTH_LESS1:0]), // Templated ,BS & SR 10/28/03
                        // Inputs 
                        .way0_tag_c2    (tag_way0_tag_c2[`TAG_WIDTH_LESS1:0]), // Templated 
                        .way1_tag_c2    (tag_way1_tag_c2[`TAG_WIDTH_LESS1:0]), // Templated 
                        .way2_tag_c2    (tag_way2_tag_c2[`TAG_WIDTH_LESS1:0]), // Templated 
                        .way3_tag_c2    (tag_way3_tag_c2[`TAG_WIDTH_LESS1:0]), // Templated 
                        .way4_tag_c2    (tag_way4_tag_c2[`TAG_WIDTH_LESS1:0]), // Templated 
                        .way5_tag_c2    (tag_way5_tag_c2[`TAG_WIDTH_LESS1:0]), // Templated 
                        .way6_tag_c2    (tag_way6_tag_c2[`TAG_WIDTH_LESS1:0]), // Templated ,BS & SR 10/28/03
                        .way7_tag_c2    (tag_way7_tag_c2[`TAG_WIDTH_LESS1:0]), // Templated ,BS & SR 10/28/03
                        .scan_in(tagl_1_scanin),
                        .scan_out(tagl_1_scanout),
                        .l2clk           (l2clk), 
                        .tagdp_quad0_muxsel_c3(tagdp_quad0_muxsel_c3[3:0]), // Templated ,BS & SR 10/28/03
                        .tagdp_quad1_muxsel_c3(tagdp_quad1_muxsel_c3[3:0]),
  .tcu_dectest(tcu_dectest)); // Templated ,BS & SR 10/28/03
 
l2t_tagl_dp tagl_2( 
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
				.tcu_clk_stop(1'b0),
                                .tcu_muxtest(tcu_muxtest),
			/*AUTOINST*/ 
                        // Outputs 
                        .tagl_parity_c2      (tagl_parity_c2[15:8]),   // Templated 
                        .tagl_tag_quad0_c3  (tagl_quad2_c3[`TAG_WIDTH_LESS1:0]), // Templated, BS & SR 10/28/03
                        .tagl_tag_quad1_c3  (tagl_quad3_c3[`TAG_WIDTH_LESS1:0]), // Templated, BS & SR 10/28/03
                        // Inputs 
                        .way0_tag_c2    (tag_way8_tag_c2[`TAG_WIDTH_LESS1:0]), // Templated 
                        .way1_tag_c2    (tag_way9_tag_c2[`TAG_WIDTH_LESS1:0]), // Templated 
                        .way2_tag_c2    (tag_way10_tag_c2[`TAG_WIDTH_LESS1:0]), // Templated 
                        .way3_tag_c2    (tag_way11_tag_c2[`TAG_WIDTH_LESS1:0]), // Templated 
                        .way4_tag_c2    (tag_way12_tag_c2[`TAG_WIDTH_LESS1:0]), // Templated 
                        .way5_tag_c2    (tag_way13_tag_c2[`TAG_WIDTH_LESS1:0]), // Templated 
			.way6_tag_c2	(tag_way14_tag_c2[`TAG_WIDTH_LESS1:0]), // Templated, BS & SR 10/28/03
			.way7_tag_c2	(tag_way15_tag_c2[`TAG_WIDTH_LESS1:0]), // Templated, BS & SR 10/28/03
                        .scan_in(tagl_2_scanin),
                        .scan_out(tagl_2_scanout),
                        .l2clk           (l2clk), 
                        .tagdp_quad0_muxsel_c3(tagdp_quad2_muxsel_c3[3:0]), // Templated, BS & SR 10/28/03 
                        .tagdp_quad1_muxsel_c3(tagdp_quad3_muxsel_c3[3:0]),
  .tcu_dectest(tcu_dectest)); // Templated, BS & SR 10/28/03 
 
 
l2t_tagdp_ctl	tagdp( 
                        .tcu_pce_ov(ce_ovrd),
                        .tcu_aclk(aclk),
                        .tcu_bclk(bclk),
			.tcu_scan_en(tcu_scan_en),
                          // Outputs 
                        .tagdp_quad0_muxsel_c3(tagdp_quad0_muxsel_c3[3:0]), 
                        .tagdp_quad1_muxsel_c3(tagdp_quad1_muxsel_c3[3:0]), 
                        .tagdp_quad2_muxsel_c3(tagdp_quad2_muxsel_c3[3:0]), 
                        .tagdp_quad3_muxsel_c3(tagdp_quad3_muxsel_c3[3:0]), 
                        .tagdp_tag_quad_muxsel_c3(tagdp_quad_muxsel_c3[3:0]), 
                        .tagdp_misbuf_par_err_c3(tagdp_misbuf_par_err_c3), 
                        .tagdp_tag_par_err_c3(tagdp_tag_par_err_c3), 
                        .tagdp_arb_par_err_c3(tagdp_arb_par_err_c3), 
                        .tagdp_tag_error_c8 (tagdp_tag_error_c8), 
                        .tagdp_lru_way_sel_c3(tagdp_lru_way_sel_c3[15:0]), 
                        .tagdp_evict_c3_1     (tagdp_evict_c3_1), 
                        .tagdp_evict_c3_2     (tagdp_evict_c3_2), 
                        .tagdp_invalid_evict_c3(tagdp_invalid_evict_c3), 
                        .tagdp_vuad_dp_diag_data_c7_buf(tagdp_vuad_dp_diag_data_c7_buf[38:0]),
                      .tag_way_sel_c2_buff(tag_way_sel_c2_buff[15:0]), 

                          // Inputs 
                      .arb_vuad_ce_err_c3 (tagctl_arb_vuad_ce_err_c3),
			.arb_pf_ice_inst_c2(arb_pf_ice_inst_c2),
                        .vlddir_vuad_valid_c2(vlddir_vuad_valid_c2_rep1[15:0]), 
                        .tag_parity_c2(tagl_parity_c2[15:0]), 
                        .tag_way_sel_c2(tag_way_sel_c2[15:0]), // Templated 
                        .vuaddp_vuad_tagd_sel_c2_d1(vuaddp_vuad_tagd_sel_c2_d1), 
                        .bist_way_px  (mbist_l2t_way[3:0]),    // Templated 
                        .bist_enable_px(mbist_l2t_read),       // Templated 
                        .arbadr_arbdp_diag_wr_way_c2(arbdp_diag_wr_way_c2[3:0]), 
                        .arb_tecc_way_c2(arb_tecc_way_c2[3:0]), 
                        .arb_normal_tagacc_c2(arb_normal_tagacc_c2), 
                        .arb_tagd_tecc_c2(arb_tagd_tecc_c2), 
                        .arb_tagd_perr_vld_c2(arb_tagd_perr_vld_c2), 
                        .misbuf_hit_c3 (misbuf_hit_c3), 
                        .csr_l2_dir_map_on(csreg_tagdp_l2_dir_map_on), 
                        .arb_l2tag_vld_c4(arb_l2tag_vld_c4), 
                        .vuad_dp_diag_data_c7(vuad_diag_data_c7[38:0]),
                        .scan_in(tagdp_scanin),
                        .scan_out(tagdp_scanout),
                        .l2clk         (l2clk), 
                        .wmr_l       (wmr_l), 
                        .usaloc_vuad_used_c2(usaloc_vuad_used_c2[15:0]), 
                        .usaloc_vuad_alloc_c2(usaloc_vuad_alloc_c2[15:0]), 
                        .arb_evict_vld_c2(arb_evict_vld_c2),
  .mbist_run(mbist_run)); 
 
 
		 
l2t_tagd_dp	tagd( 
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
				.tcu_clk_stop(1'b0),
                                .tcu_muxtest(tcu_muxtest),
			.tcu_dectest(tcu_dectest),
                   .tagd_mbdata_inst_tecc_c8  (mbdata_inst_tecc_c8[5:0]), 
                  .tagd_lkup_addr_c4   (tagd_lkup_addr_c4[17:9]), // BS and SR 11/18/03 Reverse Directory change 
                   
                  /*AUTOINST*/ 
                  // Outputs 
                  .tagd_evict_tag_c3   (tagd_evict_tag_c3[`TAG_WIDTH_LESS1:0]), 
                  .tagd_dmo_evict_tag_c4   (tagd_dmo_evict_tag_c4[`TAG_WIDTH_LESS1:0]), 
                  .tagd_diag_data_c7   (tagd_diag_data_c7[`TAG_WIDTH_LESS1:0]), 
                   .tagd_lkup_row_addr_dcd_c3 (lkup_row_addr_dcd_c3[2:0]), 
                   .tagd_lkup_row_addr_icd_c3 (lkup_row_addr_icd_c3[2:0]), 
                   .tagd_lkup_tag_c1          (tagd_lkup_tag_c1[`TAG_WIDTH_LESS1:1]), 
                   .tagd_arbdp_tag_idx_px2_buf_1(tagd_arbdp_tag_idx_px2_buf_1[8:0]), // BS & SR 10/28/03 
                   .tagd_arbdp_tag_idx_px2_buf_2(tagd_arbdp_tag_idx_px2_buf_2[8:0]), // BS & SR 10/28/03 
                   .tagd_mbist_l2t_index_buf  (tagd_mbist_l2t_index_buf[8:0]),  // BS & SR 10/28/03
                   .tagd_arb_tag_way_px2_buf(tagd_arb_tag_way_px2_buf[15:0]), // BS & SR 10/28/03 
                   .tagd_mbist_l2t_dec_way_buf(tagd_mbist_l2t_dec_way_buf[15:0]), // BS & SR 10/28/03 
                   .tagd_arb_tag_rd_px2_buf(tagd_arb_tag_rd_px2_buf), 
                   .tagd_mbist_l2t_read_buf   (tagd_mbist_l2t_read_buf), 
                   .tagd_arb_tag_wr_px2_buf(tagd_arb_tag_wr_px2_buf), 
                   .tagd_mbist_l2t_write_buf  (tagd_mbist_l2t_write_buf), 
                   .tagd_tag_wrdata_px2_buf   (tagd_wrdata_px2_buf[27:0]), 
                   .tagd_mbist_write_data_buf (tagd_mbist_write_data_buf[7:0]), 
                  // Inputs 
                  .arbadr_2bnk_true_enbld_dist(arbadr_tagd_2bnk_true_enbld_dist), // BS 03/25/04 for partial bank/core modes support
                  .arbadr_4bnk_true_enbld_dist(arbadr_tagd_4bnk_true_enbld_dist), // BS 03/25/04 for partial bank/core modes support
                  .arbadr_ncu_l2t_pm_n_dist(arbadr_tagd_ncu_l2t_pm_n_dist), // BS 03/25/04 for partial bank/core modes support
                  .arbadr_dir_cam_addr_c3      (arbadr_dir_cam_addr_c3[39:7]), 
                  .arbadr_arbaddr_idx_c3       (arbaddr_idx_c3[10:0]), 
                  .arbadr_arbdp_tagdata_px2    (arbadr_arbdp_tagdata_px2[`TAG_WIDTH_LESS1:6]), 
                  .tagl_tag_quad0_c3        (tagl_quad0_c3[`TAG_WIDTH_LESS1:0]), 
                  .tagl_tag_quad1_c3        (tagl_quad1_c3[`TAG_WIDTH_LESS1:0]), 
                  .tagl_tag_quad2_c3        (tagl_quad2_c3[`TAG_WIDTH_LESS1:0]), 
                  .tagl_tag_quad3_c3        (tagl_quad3_c3[`TAG_WIDTH_LESS1:0]), 
                  .tagdp_tag_quad_muxsel_c3   (tagdp_quad_muxsel_c3[3:0]), 
                  .arbadr_arbdp_tag_idx_px2    (arbadr_arbdp_tag_idx_px2[8:0]),  // BS & SR 10/28/03
                  .mbist_l2t_index      (mbist_l2t_index[8:0]),  // BS & SR 10/28/03
                  .arb_tag_way_px2   (arb_tag_way_px2[15:0]),  // BS & SR 10/28/03
                  .mbist_l2t_dec_way    (mbist_l2t_dec_way[15:0]), 
                  .arb_tag_rd_px2    (arb_tag_rd_px2), 
                  .mbist_l2t_read       (mbist_l2t_read), 
                  .arb_tag_wr_px2    (arb_tag_wr_px2), 
                  .mbist_l2t_write      (mbist_l2t_write), 
                   .arbadr_tag_wrdata_px2       (arbadr_tag_wrdata_px2[27:0]), 
                  .mbist_write_data     (mbist_write_data[7:0]), 
                  .arb_evict_c3      (arb_evict_c3), 
                  .scan_in(tagd_scanin),
                  .scan_out(tagd_scanout),
                  .l2clk                 (l2clk),
  .mbist_l2tag_fail(mbist_l2tag_fail)); 
 

l2t_dmorpt_dp  dmorptr 
	(
	.in_bus0	(l2t_tcu_dmo_out_prev[38:0]),
	.in_bus1	(l2t_tcu_dmo_out_unbuff[38:0]),
	.out_bus0	(l2t_tcu_dmo_out_prev_buff[38:0]),
	.out_bus1	(l2t_tcu_dmo_out[38:0])
	);
 
l2t_dmo_dp 	dmologic (
	.tcu_l2t_coresel        (tcu_l2t_coresel),
	.l2t_tcu_dmo_out_prev   (l2t_tcu_dmo_out_prev_buff[38:0]),
	.scan_in(dmologic_scanin),
	.scan_out(dmologic_scanout),
	.l2clk                  (l2clk),
	.tcu_l2t_shscan_clk_stop_d2 	(tcu_l2t_shscan_clk_stop_d2),
	.tcu_l2t_shscan_clk_stop 	(tcu_l2t_shscan_clk_stop),
	.tcu_clk_stop           (1'b0),
	.tcu_pce_ov             (tcu_pce_ov),
	.tcu_aclk               (tcu_aclk),
	.tcu_bclk               (tcu_bclk),
	.tcu_scan_en            (tcu_scan_en),
	.l2t_tcu_dmo_out        (l2t_tcu_dmo_out_unbuff[38:0]),
  .mbist_dmo_data_out(mbist_dmo_data_out[38:0]),
  .io_cmp_sync_en(io_cmp_sync_en)
		);

 
l2t_mbist_ctl	mbist	( 
                // Outputs 
		.mbist_run(mbist_run),
                .mbist_done        (l2t_tcu_mbist_done), 
                .mbist_fail 	(l2t_tcu_mbist_fail), 
		.mbist_start_mb0(mbist_start_mb0),
		.mbist_start_mb2(mbist_start_mb2),
                // Inputs 
		.mbist0_done	(l2t_tcu_mbist0_done),
		.mbist2_done	(l2t_tcu_mbist2_done),
		.mbist0_fail	(l2t_tcu_mbist0_fail),
		.mbist2_fail	(l2t_tcu_mbist2_fail),
                .tcu_pce_ov(ce_ovrd),
                .tcu_aclk(aclk),
                .tcu_bclk(bclk),
		.tcu_scan_en(tcu_scan_en),
		.tcu_clk_stop(1'b0),
                .mbist_l2tag_fail  (mbist_l2tag_fail), 
                .mbist_l2vuad_fail (mbist_l2vuad_fail), 
                .mbist_l2data_fail (mbist_l2data_fail), 
                .mbist_l2tag_index (mbist_l2t_index[8:0]),  // Templated 
                .mbist_l2tag_way   (mbist_l2t_way[3:0]),    // Templated 
                .mbist_l2tag_dec_way(mbist_l2t_dec_way[15:0]), // Templated 
                .mbist_l2tag_read  (mbist_l2t_read),        // Templated 
                .mbist_l2tag_write (mbist_l2t_write),       // Templated 
                .mbist_l2vuad_read (mbist_l2v_read),        // Templated 
                .mbist_l2vuad_index(mbist_l2v_index[8:0]),  // Templated 
                .mbist_l2vuad_vd   (mbist_l2v_vd),          // Templated 
                .mbist_l2vuad_write(mbist_l2v_write),       // Templated 
                .mbist_l2data_index(mbist_l2d_index[8:0]),  // Templated 
                .mbist_l2data_way  (mbist_l2d_way[3:0]),    // Templated 
                .mbist_l2data_word (mbist_l2d_word_sel[3:0]), // Templated 
                .mbist_l2data_write(mbist_l2d_write),       // Templated 
                .mbist_write_data  (mbist_write_data[7:0]), // Templated 
                .mbist_write_data_decck  (mbist_write_data_decck[7:0]), // Templated 
                .mbist_arb_l2t_write(mbist_arb_l2t_write),
                .mbist_arb_l2d_en  (mbist_arb_l2d_en), 
                .mbist_arb_l2d_write(mbist_arb_l2d_write), 
                .mbist_l2d_en      (mbist_l2d_en), 
                .scan_in(tcu_l2t_mbist_scan_in),
                .scan_out(tcu_l2t_mbist_scan_in1),
                .l2clk              (l2clk), 
                .mbist_start       (tcu_l2t_mbist_start), 
                .mbist_user_mode(tcu_mbist_user_mode), 
                .mbist_bisi_mode   (tcu_mbist_bisi_en), 
                .mbist_l2tag_hit_way   (tag_way_sel_c2_buff[15:0]),
                .mbist_l2tag_lkup_tag   (mbist_tag_lkup_addr[27:0]));
 
 
l2t_l2drpt_dp  l2drpt (
			.scan_in	(tagctl_scanin),
			.scan_out	(tagctl_scanin_1),
                        .tag_l2d_way_sel_c2(l2t_l2d_way_sel_c2[15:0]),
        		.tcu_clk_stop(1'b0),
                        .vlddir_vuad_valid_c2 (vlddir_vuad_valid_c2_rep1[15:0]), 
                        .misbuf_tag_hit_unqual_c2(misbuf_tag_hit_unqual_c2_rep2),
  .l2clk(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .arb_l2drpt_waysel_gate_c1(arb_l2drpt_waysel_gate_c1),
  .mbist_run(mbist_run),
  .arb_inst_vld_c2_prev(arb_inst_vld_c2_prev),
  .csr_l2_bypass_mode_on(csr_l2_bypass_mode_on),
  .arb_decdp_ld64_inst_c1(arb_decdp_ld64_inst_c1),
  .tag_way_sel_c2(tag_way_sel_c2[15:0]),
  .tagctl_l2drpt_mux4_way_sel_c1(tagctl_l2drpt_mux4_way_sel_c1[15:0]),
  .tag_rdma_gate_off_c2(tag_rdma_gate_off_c2),
  .tagdp_lru_way_sel_c3(tagdp_lru_way_sel_c3[15:0]),
  .arb_evict_vld_c2(arb_evict_vld_c2),
  .tagdp_tag_par_err_c3(tagdp_tag_par_err_c3)
		      );
l2t_tag_ctl	tagctl ( 
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
			.wmr_l		(wmr_l), 
                      // Outputs 
                      .sel_diag_store_data_c7   (sel_diag_store_data_c7), // BS and SR 12/22/03, store ack generation for diagnostic store

                      .tag_dir_l2way_sel_c4      (tag_dir_l2way_sel_c4), // BS and SR 11/18/03 Reverse Directory change
                      .tag_store_inst_c3	 (tag_store_inst_c3), //BS and SR 11/07/03, store pipelining support 
                      .tag_hit_way_vld_c3(tag_hit_way_vld_c3[15:0]), 
                      .tag_st_to_data_array_c3(tag_st_to_data_array_c3), 
                      .tag_hit_l2orfb_c3(tag_hit_l2orfb_c3), 
                      .tag_miss_unqual_c2(tag_miss_unqual_c2), 
                       .tag_hit_unqual_c2(tag_hit_unqual_c2), 
                      .tag_hit_c3    (tag_hit_c3), 
                      .tag_lru_way_c4(tag_lru_way_c4[3:0]), 
                      .tag_rdma_vld_px0_p(tag_rdma_vld_px0_p), 
                      .tag_hit_not_comp_c3(tag_hit_not_comp_c3), 
                       .tag_alt_tag_miss_unqual_c3(tag_alt_tag_miss_unqual_c3), 
                       .tag_misbuf_rdma_reg_vld_c2(tag_misbuf_rdma_reg_vld_c2), 
                      // .tag_l2d_col_offset_c2(l2t_l2d_col_offset_c2[3:0]), 
                       .tag_l2d_rd_wr_c2  (l2t_l2d_rd_wr_c2), 
                       .tag_l2d_word_en_c2(l2t_l2d_word_en_c2[15:0]), 
                      .tag_deccck_addr3_c7(tag_deccck_addr3_c7), 
                       .tag_decc_tag_acc_en_px2(tag_decc_tag_acc_en_px2), 
	              .arb_inst_vld_c2_prev(arb_inst_vld_c2_prev),
                       .tag_data_ecc_active_c3(tag_data_ecc_active_c3), 
                      .tag_deccck_data_sel_c8(tag_deccck_data_sel_c8), 
                      .tag_scrub_rd_vld_c7(tag_scrub_rd_vld_c7), 
                      .tag_spc_rd_vld_c6(tag_spc_rd_vld_c6), 
                      .tag_bsc_rd_vld_c7(tag_bsc_rd_vld_c7), 
                       .tag_scrub_addr_way   (tag_scrub_addr_way[3:0]), 
                      .tag_imiss_hit_c5(tag_imiss_hit_c5), 
                      .tag_ld_hit_c5 (tag_ld_hit_c5), 
                      .tag_strst_ack_c5(tag_strst_ack_c5), 
                      .tag_st_ack_c5 (tag_st_ack_c5), 
                      .tag_st_req_c5 (tag_st_req_c5), 
                      .tag_inval_req_c5(tag_inval_req_c5), // BS and SR 11/12/03 N2 Xbar Packet format change
                      .tag_nonmem_comp_c6(tag_nonmem_comp_c6), 
                      .tag_uerr_ack_c5(tag_uerr_ack_c5), 
                      .tag_cerr_ack_c5(tag_cerr_ack_c5), 
                      .tag_int_ack_c5(tag_int_ack_c5), 
                      .tag_fwd_req_ret_c5(tag_fwd_req_ret_c5), 
                       .tag_sel_rdma_inval_vec_c5(tag_sel_rdma_inval_vec_c5), 
                      .tag_rdma_wr_comp_c4(tag_rdma_wr_comp_c4), 
                      .tag_rmo_st_ack_c5(tag_rmo_st_ack_c5), 
                      .tag_inst_mb_c5(tag_inst_mb_c5), 
                      .tag_hit_c5    (tag_hit_c5), 
                      .tag_store_inst_c5(tag_store_inst_c5), 
                      .tag_fwd_req_ld_c6(tag_fwd_req_ld_c6), 
                      .tag_rdma_gate_off_c2(tag_rdma_gate_off_c2), 
                      .tag_rd64_complete_c11(tag_rd64_complete_c11), 
                       .tag_uerr_ack_tmp_c4  (tag_uerr_ack_tmp_c4), 
                       .tag_cerr_ack_tmp_c4  (tag_cerr_ack_tmp_c4), 
                       .tag_spc_rd_cond_c3   (tag_spc_rd_cond_c3), 
                      .tag_rdma_vld_px1(tag_rdma_vld_px1), 
                      .tag_rdma_ev_en_c4(tag_rdma_ev_en_c4), 
                      .tag_inc_rdma_cnt_c4(tag_inc_rdma_cnt_c4), 
                      .tag_set_rdma_reg_vld_c4(tag_set_rdma_reg_vld_c4), 
                      .tag_siu_req_en_c52(tag_siu_req_en_c52), 
                      .tag_misbuf_par_err_c3(tag_misbuf_par_err_c3), 
                      // Inputs 
		.filbuf_dis_nderr_c3	(filbuf_dis_nderr_c3[1:0]),
                      .arb_vuad_ce_err_c3 (tagctl_arb_vuad_ce_err_c3),
		      .arb_upper_four_byte_access_c1(arb_upper_four_byte_access_c1), // BS 05/04/04 : taking out upper_four_byte_access info
                      .arb_lower_four_byte_access_c1(arb_lower_four_byte_access_c1), // BS 05/04/04 : taking out lower_four_byte_access info
		      .misbuf_hit_st_dep_zero (misbuf_hit_st_dep_zero), // BS and SR 11/07/03, store pipelining support
		      .misbuf_arb_hit_c3(misbuf_arb_hit_c3), // BS and SR 1/31/04
                      .tag_way_sel_c2   (tag_way_sel_c2[15:0]), 
                       .vlddir_vuad_valid_c2 (vlddir_vuad_valid_c2_rep1[15:0]), 
                       .tagdp_lru_way_sel_c3   (tagdp_lru_way_sel_c3[15:0]), 
                      .tagdp_tag_par_err_c3(tagdp_tag_par_err_c3), 
                      .bist_data_enc_way_sel_c1(mbist_l2d_way[3:0]), // Templated 
                      .bist_data_enable_c1(mbist_l2d_en),        // Templated 
                      .bist_data_wr_enable_c1(mbist_l2d_write),  // Templated 
                      .bist_data_waddr_c1(mbist_l2d_word_sel[3:0]), // Templated 
                       .arbadr_arbdp_addr5to4_c1(arbadr_arbdp_addr5to4_c1[1:0]), 
                       .arbadr_arbdp_addr3to2_c1(arbadr_arbdp_addr3to2_c1[1:0]), 
                       .arbadr_arbaddr_addr22_c2(arbaddr_addr22_c2), 
                       .arbadr_arbdp_diag_wr_way_c2(arbdp_diag_wr_way_c2[3:0]), 
                       .arbdec_arbdp_inst_way_c3(arbdec_arbdp_inst_way_c3[3:0]), 
                       .arb_decdp_tag_wr_c1(arb_decdp_tag_wr_c1), 
                       //.arb_decdp_cas2_from_mb_ctrue_c2(arb_decdp_cas2_from_mb_ctrue_c2), 
                       .arb_decdp_cas2_from_mb_c2(arb_decdp_cas2_from_mb_c2), 
                       .arb_decdp_strst_inst_c2(arb_decdp_strst_inst_c2), 
                       .arb_decdp_rmo_st_c3  (arb_decdp_rmo_st_c3), 
                       .arbdec_arbdp_rdma_inst_c1(arbdec_arbdp_rdma_inst_c1), 
                       .arb_decdp_ld64_inst_c1(arb_decdp_ld64_inst_c1), 
                       .arb_decdp_wr64_inst_c2(arb_decdp_wr64_inst_c2), 
                       .arb_decdp_wr8_inst_c2(arb_decdp_wr8_inst_c2), 
                      .arb_tag_pst_with_ctrue_c1(arb_tag_pst_with_ctrue_c1), 
                       .csr_l2_bypass_mode_on(csr_tag_l2off),      // Templated 
                       .arb_bist_or_diag_acc_c1(arb_bist_or_diag_acc_c1), 
                      .arb_fill_vld_c2(arb_fill_vld_c2), 
                      .arb_imiss_vld_c2(arb_imiss_vld_c2), 
                      .arb_evict_vld_c2(arb_evict_vld_c2), 
                      .arb_tag_inst_vld_c2(arb_tag_inst_vld_c2), 
			 .filbuf_match_c3 (filbuf_match_c3),
                      .arb_waysel_gate_c2(arb_waysel_gate_c2), 
                      .arb_data_diag_st_c2(arb_data_diag_st_c2), 
                      .arb_csr_wr_en_c3(arb_csr_wr_en_c3), 
                      .arb_csr_rd_en_c3(arb_csr_rd_en_c3), 
                      .arb_diag_complete_c3(arb_diag_complete_c3), 
                      .deccck_scrd_uncorr_err_c8(deccck_scrd_uncorr_err_c8), 
                      .misbuf_tag_hit_unqual_c2(misbuf_tag_hit_unqual_c2_rep1), 
                      .misbuf_uncorr_err_c2(misbuf_uncorr_err_c2), 
                      .misbuf_corr_err_c2(misbuf_corr_err_c2), 
		      .misbuf_notdata_err_c2 (misbuf_notdata_err_c2_rep1),
                      .misbuf_wr64_miss_comp_c3(misbuf_wr64_miss_comp_c3), 
                       .arb_decdp_swap_inst_c2(arb_decdp_swap_inst_c2), 
                       .arb_arbdp_tag_pst_no_ctrue_c2(arb_arbdp_tag_pst_no_ctrue_c2), 
                       .arb_decdp_cas1_inst_c2(arb_decdp_cas1_inst_c2), 
                       .arb_decdp_ld_inst_c2 (arb_decdp_ld_inst_c2), 
                       .arbdec_arbdp_inst_mb_c2 (arbdec_arbdp_inst_mb_c2), 
                       .arbdec_arbdp_inst_dep_c2(arbdec_arbdp_inst_dep_c2), 
                       .arb_decdp_st_inst_c2 (arb_decdp_st_inst_c2), 
                       .arb_decdp_st_with_ctrue_c2(arb_decdp_st_with_ctrue_c2), 
                       .arb_decdp_inst_int_c2(arb_decdp_inst_int_c2), 
                       .arb_decdp_fwd_req_c2 (arb_decdp_fwd_req_c2), 
                      .arb_inval_inst_c2(arb_inval_inst_c2), 
                      .arb_waysel_inst_vld_c2(arb_waysel_inst_vld_c2), 
                      .arb_rdwr_inst_vld_c2(arb_rdwr_inst_vld_c2), 
                       .arb_wr8_inst_no_ctrue_c1(arb_wr8_inst_no_ctrue_c1), 
                      .filbuf_tag_hit_c2(filbuf_tag_hit_c2), 
		  .filbuf_tag_hit_frm_mb_c2(filbuf_tag_tag_hit_frm_mb_c2_rep),
 		      .filbuf_tag_evict_way_c3 (filbuf_tag_evict_way_c3_rep1[3:0]), // BS and SR 12/18/03, LRU way from Filbuf needs to be written to Dir on a Miss
                       .filbuf_mcu_l2t_chunk_id_r1(filbuf_mcu_l2t_chunk_id_r1[1:0]), 
                       .filbuf_mcu_l2t_data_vld_r1(filbuf_mcu_l2t_data_vld_r1), 
                      .filbuf_dis_cerr_c3(filbuf_dis_cerr_c3_rep1), 
                      .filbuf_dis_uerr_c3(filbuf_dis_uerr_c3_rep1), 
                      .oqu_st_complete_c7(oqu_st_complete_c7), 
                       .arbdec_arbdp_tecc_c1    (arbdec_arbdp_tecc_c1), 
                      .scan_in(tagctl_scanin_1),
                      .scan_out(tagctl_scanout),
                      .l2clk             (l2clk), 
                       .csr_error_nceen      (csr_error_nceen), 
                       .csr_error_ceen       (csr_error_ceen), 
                      .tagdp_misbuf_par_err_c3(tagdp_misbuf_par_err_c3),
  .tag_data_array_wr_active_c1(tag_data_array_wr_active_c1),
  .tag_hit_unqual_c3(tag_hit_unqual_c3),
  .misbuf_uncorr_err_c1(misbuf_uncorr_err_c1),
  .misbuf_notdata_err_c1(misbuf_notdata_err_c1),
  .tag_misbuf_int_ack_c3(tag_misbuf_int_ack_c3),
  .l2t_l2b_fbwr_wen_r2(l2t_l2b_fbwr_wen_r2[15:0]),
  .l2t_l2b_fbd_stdatasel_c3(l2t_l2b_fbd_stdatasel_c3),
  .tagctl_l2drpt_mux4_way_sel_c1(tagctl_l2drpt_mux4_way_sel_c1[15:0]),
  .dec_col_offset_prev_c1(dec_col_offset_prev_c1[3:0]),
  .decdp_cas2_from_mb_ctrue_c1(decdp_cas2_from_mb_ctrue_c1),
  .misbuf_vuad_ce_instr_ack_c2(misbuf_vuad_ce_instr_ack_c2),
  .mbist_run(mbist_run),
  .arb_arbdp_dword_st_c1(arb_arbdp_dword_st_c1),
  .arb_inst_diag_c1(arb_inst_diag_c1),
  .mbist_arb_l2d_en(mbist_arb_l2d_en)); 
 
 
 
 
l2t_misbuf_ctl	misbuf ( 
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
        .l2t_mb2_mbdata_wr_en           (l2t_mb2_mbdata_wr_en),
        .l2t_mb2_mbdata_rd_en           (l2t_mb2_mbdata_rd_en),
        .l2t_mb2_mbtag_rd_en            (l2t_mb2_mbtag_rd_en),
        .l2t_mb2_mbtag_wr_en            (l2t_mb2_mbtag_wr_en),
        .l2t_mb2_addr                   (l2t_mb2_addr[4:0]),
                    .misbuf_mb_write_wl         (mb_write_wl[31:0]), 
                   .misbuf_dep_c8        (misbuf_dep_c8), 
                   .misbuf_evict_c8      (misbuf_evict_c8), 
                      .arb_vuad_ce_err_c2 (arb_vuad_ce_err_c2),
                   .misbuf_mbentry_c8    (misbuf_mbentry_c8[4:0]), 
                   .misbuf_tecc_c8       (misbuf_tecc_c8), 
                   .misbuf_vuad_ce_instr_c2       (misbuf_vuad_ce_instr_c2), 
                    .misbuf_mbtag_wr_en_c2      (mbtag_wr_en_c2), 
                    .misbuf_mb_read_wl          (mb_read_wl[31:0]), 
                    .misbuf_mb_data_write_wl    (mb_data_write_wl[31:0]), 
                    .misbuf_mbdata_wr_en_c8     (mbdata_wr_en_c8), 
                    .arb_decdp_ld_inst_c2   (arb_decdp_ld_inst_c2), // BS and SR 11/07/03, store pipelining support
                    .arb_decdp_imiss_inst_c2 (arb_decdp_imiss_inst_c2), // BS and SR 11/07/03, store pipelining support
                   .mb_cam_match        (mb_cam_match[31:0]), 
                   .mb_cam_match_idx        (mb_cam_match_idx[31:0]), 
		   .mb_mbist_cam_hit	(mb_mbist_cam_hit),
		   .mbtag_mbist_cam_sel(mbist_cam_sel[0]),
			.wmr_l		(wmr_l), 
			/*AUTOINST*/ 
                   // Outputs 
                   .misbuf_vuad_ce_err_c8(misbuf_vuad_ce_err_c8),
		   .misbuf_hit_st_dep_zero (misbuf_hit_st_dep_zero), // BS and SR 11/07/03, store pipelining support
                   .misbuf_arb_cnt28_px2_prev(misbuf_arb_cnt28_px2_prev), 
                   .misbuf_arb_snp_cnt8_px1(misbuf_arb_snp_cnt8_px1), 
                   .misbuf_arb_vld_px1(misbuf_arb_vld_px1), 
                   .misbuf_nondep_fbhit_c3(misbuf_nondep_fbhit_c3), 
                   .misbuf_hit_c3        (misbuf_hit_c3), 
                   .misbuf_arbdp_ctrue_px2(misbuf_arbdp_ctrue_px2), 
                   .misbuf_arb_l2rd_en   (misbuf_arb_l2rd_en), 
                   .misbuf_arb_mcurd_en (misbuf_arb_mcurd_en), 
                   .misbuf_tag_hit_unqual_c2(misbuf_tag_hit_unqual_c2), 
                   .misbuf_corr_err_c2   (misbuf_corr_err_c2), 
                   .misbuf_uncorr_err_c2 (misbuf_uncorr_err_c2), 
                   .misbuf_notdata_err_c2 (misbuf_notdata_err_c2), 
                   .misbuf_wr64_miss_comp_c3(misbuf_wr64_miss_comp_c3), 
                   .misbuf_wbuf_mbid_c4 (misbuf_wbuf_mbid_c4[4:0]), 
                    .misbuf_mbf_insert_mbid_c4  (misbuf_mbf_insert_mbid_c4[4:0]), 
                    .misbuf_mbf_insert_c4       (misbuf_mbf_insert_c4), 
                   .misbuf_hit_c4        (misbuf_hit_c4), 
                    .misbuf_mbf_delete_c4       (misbuf_mbf_delete_c4), 
                   .misbuf_filbuf_next_vld_c4(misbuf_filbuf_next_vld_c4), 
                   .misbuf_filbuf_next_link_c4(misbuf_filbuf_next_link_c4[4:0]), 
                   .misbuf_filbuf_mcu_pick(misbuf_filbuf_mcu_pick), 
                   .misbuf_filbuf_fbid    (misbuf_filbuf_fbid[2:0]), 
                   .misbuf_filbuf_way     (misbuf_filbuf_way[3:0]), 
                   .misbuf_filbuf_way_fbid_vld(misbuf_filbuf_way_fbid_vld), 
                   .misbuf_buf_rd_en     (misbuf_buf_rd_en), 
                   .l2t_mcu_rd_req   (l2t_mcu_rd_req), 
                   .l2t_mcu_rd_dummy_req(l2t_mcu_rd_dummy_req), 
		   .misbuf_vuad_ce_err_c6(misbuf_vuad_ce_err_c6), // vuad ecc change
                   // Inputs 
		   .arbdec_arbdp_inst_bufidhi_c8(arbdec_arbdp_inst_bufidhi_c8),
		   .deccck_notdata_err_c8(deccck_notdata_err_c8),
		   .tag_store_inst_c3         (tag_store_inst_c3), //BS and SR 11/07/03, store pipelining support
                   .tag_miss_unqual_c2(tag_miss_unqual_c2_rep1), 
                    .tag_hit_unqual_c2(tag_hit_unqual_c2), 
                   .tag_hit_c3       (tag_hit_c3), 
                   .tag_lru_way_c4   (tag_lru_way_c4[3:0]), 
                   .tag_rdma_vld_px0_p(tag_rdma_vld_px0_p), 
                    .tag_misbuf_rdma_reg_vld_c2(tag_misbuf_rdma_reg_vld_c2_rep1a), 
                   .tag_hit_not_comp_c3(tag_hit_not_comp_c3), 
                    .tag_alt_tag_miss_unqual_c3(tag_alt_tag_miss_unqual_c3), 
                    .arb_arbdp_pst_with_ctrue_c2(arb_arbdp_pst_with_ctrue_c2), 
                    .arb_arbdp_misbuf_pst_no_ctrue_c2(arb_arbdp_misbuf_pst_no_ctrue_c2), 
                    .arb_decdp_cas2_inst_c2  (arb_decdp_cas2_inst_c2), 
                    .arbdec_arbdp_inst_mb_c2    (arbdec_arbdp_inst_mb_c2), 
                    .arb_decdp_pst_inst_c2   (arb_decdp_pst_inst_c2), 
                    .arb_decdp_cas1_inst_c2  (arb_decdp_cas1_inst_c2), 
                    .arb_decdp_swap_inst_c2 (arb_decdp_swap_inst_c2),
                    .arbdec_arbdp_inst_mb_entry_c1(arbdec_arbdp_inst_mb_entry_c1[4:0]), 
                    .arb_arbdp_tecc_inst_mb_c8(arb_arbdp_tecc_inst_mb_c8), 
                    .arbdec_arbdp_rdma_inst_c1  (arbdec_arbdp_rdma_inst_c1), 
                    .arb_decdp_ld64_inst_c2  (arb_decdp_ld64_inst_c2), 
                    .arb_decdp_wr64_inst_c2  (arb_decdp_wr64_inst_c2), 
                    .arb_decdp_bis_inst_c3   (arb_decdp_bis_inst_c3), 
                   .arb_csr_st_c2    (arb_csr_st_c2), 
                   .arb_evict_vld_c2 (arb_evict_vld_c2), 
                   .arb_misbuf_inst_vld_c2(arb_misbuf_inst_vld_c2), 
                   .arb_pst_ctrue_en_c8(arb_pst_ctrue_en_c8), 
                    .arb_pf_ice_inst_c2(arb_pf_ice_inst_c2),
                    .arb_pf_ice_inst_c7(arb_pf_ice_inst_c7),
                   .arb_misbuf_hit_off_c1(arb_misbuf_hit_off_c1), 
                   .arb_evict_tecc_vld_c2(arb_evict_tecc_vld_c2), 
                    .arbdec_arbdp_inst_dep_c2   (arbdec_arbdp_inst_dep_c2), 
                    .arbadr_arbdp_addr_c1c2comp_c1(arbadr_arbdp_addr_c1c2comp_c1), 
                    .arbadr_arbdp_addr_c1c3comp_c1(arbadr_arbdp_addr_c1c3comp_c1), 
                    .arbadr_idx_c1c2comp_c1     (arbadr_misbuf_idx_c1c2comp_c1), 
                    .arbadr_idx_c1c3comp_c1     (arbadr_misbuf_idx_c1c3comp_c1), 
                   .arb_misbuf_cas1_hit_c8(arb_misbuf_cas1_hit_c8), 
                   .arb_misbuf_ctrue_c9(arb_misbuf_ctrue_c9), 
                   .arb_misbuf_mbsel_c1(arb_misbuf_mbsel_c1), 
                   .deccck_uncorr_err_c8  (deccck_uncorr_err_c8), 
                  // .deccck_corr_err_c8 (deccck_corr_err_c8),
			.vlddir_vd_ce_c2(vlddir_vd_ce_c2[0]),
		   .filbuf_tag_hit_frm_mb_c2(filbuf_misbuf_tag_hit_frm_mb_c2),
                   .deccck_spcd_corr_err_c8(deccck_spcd_corr_err_c8), 
                   .deccck_spcfb_corr_err_c8(deccck_spcfb_corr_err_c8), 
                   .filbuf_misbuf_match_c2(filbuf_misbuf_match_c2), 
                   .filbuf_misbuf_stinst_match_c2(filbuf_misbuf_stinst_match_c2), 
                   .filbuf_misbuf_entry_avail(filbuf_misbuf_entry_avail), 
                    .filbuf_fbf_ready_miss_r1   (filbuf_fbf_ready_miss_r1), 
                    .filbuf_fbf_enc_ld_mbid_r1  (filbuf_fbf_enc_ld_mbid_r1[4:0]), 
                    .filbuf_fbf_st_or_dep_rdy_c4(filbuf_fbf_st_or_dep_rdy_c4), 
                    .filbuf_fbf_enc_dep_mbid_c4 (filbuf_fbf_enc_dep_mbid_c4[4:0]), 
                    .filbuf_fb_count_eq_0       (filbuf_fb_count_eq_0), 
                   .filbuf_misbuf_fbid_d2 (filbuf_misbuf_fbid_d2[2:0]), 
		   .filbuf_match_c3 (filbuf_match_c3),
                   .filbuf_misbuf_nofill_d2(filbuf_misbuf_nofill_d2), 
                   .wbuf_hit_unqual_c2 (wbuf_hit_unqual_c2), 
                   .wbuf_misbuf_dep_rdy_en(wbuf_misbuf_dep_rdy_en), 
                   .wbuf_misbuf_dep_mbid(wbuf_misbuf_dep_mbid[4:0]), 
                   .rdmat_hit_unqual_c2(rdmat_hit_unqual_c2), 
                   .rdmat_misbuf_dep_mbid(rdmat_misbuf_dep_mbid[4:0]), 
                   .rdmat_misbuf_dep_rdy_en(rdmat_misbuf_dep_rdy_en), 
                   .tag_misbuf_par_err_c3(tag_misbuf_par_err_c3), 
                   .mcu_l2t_rd_ack   (mcu_l2t_rd_ack), 
                    .csr_l2_bypass_mode_on   (csr_misbuf_l2off),       // Templated 
                    .csr_l2_dir_map_on       (csreg_misbuf_l2_dir_map_on), 
                   .scan_in(misbuf_scanin),
                   .scan_out(misbuf_scanout),
                   .l2clk                (l2clk), 
                   .arb_tecc_c2      (arb_tecc_c2),
  .tag_misbuf_int_ack_c3(tag_misbuf_int_ack_c3),
  .arbdec_pf_ice_inst_c1(arbdec_pf_ice_inst_c1),
  .arb_inst_vld_c2(arb_inst_vld_c2),
  .arb_decdp_wr8_inst_c2(arb_decdp_wr8_inst_c2),
  .usaloc_ua_ce_c2(usaloc_ua_ce_c2),
  .misbuf_vuad_ce_instr_ack_c2(misbuf_vuad_ce_instr_ack_c2),
  .arb_decdp_cas2_from_mb_c2(arb_decdp_cas2_from_mb_c2),
  .filbuf_misbuf_ue_offmode_c7(filbuf_misbuf_ue_offmode_c7),
  .filbuf_misbuf_ce_offmode_c7(filbuf_misbuf_ce_offmode_c7),
  .misbuf_arb_hit_c3(misbuf_arb_hit_c3),
  .arb_misbuf_inval_inst_c2(arb_misbuf_inval_inst_c2),
  .misbuf_notdata_err_c1(misbuf_notdata_err_c1),
  .misbuf_uncorr_err_c1(misbuf_uncorr_err_c1),
  .l2t_mb2_run(l2t_mb2_run)); 
 
 
 
n2_l2t_dp_32x128_cust	mbdata( 
                       // Outputs 
                       .dout            (mb_data_read_data[127:0]), // Templated 
                       // Inputs 
		       .din		({mbdata_din[127:64],mbdata_inst_data_c8[63:0]}),
                     //.din           ({10'b0,arbdec_snpd_ecc_c8[6:0],misbuf_mbentry_c8[4:0],mbdata_inst_tecc_c8[5:0],misbuf_evict_c8,misbuf_dep_c8,misbuf_tecc_c8,4'b0,arbdp_inst_c8[`L2_POISON:`L2_SZ_LO],mbdata_inst_data_c8[63:0]}), // Templated 
                // BS and SR 11/12/03 N2 Xbar Packet format change
                       .rd_wl           (mb_read_wl[31:0]),      // Templated 
                       .wr_wl           (mb_data_write_wl[31:0]), // Templated 
                       .read_en         (misbuf_buf_rd_en),       // Templated 
                       .wr_en           (mbdata_wr_en_c8),       // Templated 
                       .tcu_array_wr_inhibit          (array_wr_inhibit),     // Templated 
                       .tcu_aclk(aclk),
		       .tcu_bclk(bclk),
		       .tcu_pce_ov(ce_ovrd),
		       .pce(1'b1),
                       .scan_in(mbdata_scanin),
                       .scan_out(mbdata_scanout),
                       .l2clk            (l2clk),                  // Templated 
                       .tcu_se_scancollar_in    (tcu_se_scancollar_in),
  .tcu_scan_en(tcu_scan_en));                // Templated 
 
 
 
n2_com_cm_32x40_cust       mbtag   
		( 
		.dout(mb_read_data[41:0]), 
                .match(mb_cam_match[31:0]), 
                .match_idx(mb_cam_match_idx[31:0]), 
                .adr_w(mb_write_wl[31:0]), 
                .din(mb_write_addr[41:0]), // C3 PH1 write. 
                .write_en(mbtag_wr_en_c2), 
                .adr_r(mb_read_wl[31:0]), 
                .lookup_en(arb_mb_camen_px2), 
                .key(arbadr_mbcam_addr_px2_buff[41:7]), 
		.tcu_scan_en(tcu_scan_en), 
                .scan_in(mbtag_scanin),
                .scan_out(mbtag_scanout),
                .l2clk(l2clk), 
                .tcu_se_scancollar_in(tcu_se_scancollar_in),
                .tcu_array_wr_inhibit(array_wr_inhibit), 
                .read_en(misbuf_buf_rd_en), 
                .tcu_aclk(aclk),
                .tcu_bclk(bclk),
                .tcu_pce_ov(ce_ovrd),
                .pce(1'b1),
		.tcu_clk_stop(1'b0),
                .tcu_array_bypass (tcu_array_bypass));
 
 
			 
 
l2t_filbuf_ctl	filbuf( 
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
		.tcu_scan_en(tcu_scan_en),
        .l2t_mb2_fbtag_wr_en            (l2t_mb2_fbtag_wr_en),
        .l2t_mb2_fbtag_rd_en            (l2t_mb2_fbtag_rd_en),
        .l2t_mb2_addr                   (l2t_mb2_addr[2:0]),
        .filbuf_fbtag_wr_ptr   (filbuf_fbtag_wr_ptr[7:0]), 
        .filbuf_fbtag_wr_en    (filbuf_fbtag_wr_en), 
        .filbuf_buf_rd_en      (filbuf_buf_rd_en), 
        .filbuf_fbtag_rd_ptr   (filbuf_fbtag_rd_ptr[7:0]), 
        .fb_cam_match         (fb_cam_match[7:0]), 
	.fb_mbist_cam_hit	(fb_mbist_cam_hit),
   .fb_mbist_cam_sel(mbist_cam_sel[1]),
        .mbdata_filbuf_mbf_entry(mb_data_read_data_rep[`MBD_ECC_HI_PLUS5:`MBD_ECC_HI_PLUS1]), // MBID, BS & SR 11/04/03, MB grows to 32 
        .mbdata_filbuf_rqtyp_d1(mb_data_read_data_rep[`MBD_RQ_HI:`MBD_RQ_LO]), 
        .mbdata_filbuf_rsvd_d1(mb_data_read_data_rep[`MBD_RSVD]), 
	.wmr_l		(wmr_l), 
	.filbuf_dis_nderr_c3	(filbuf_dis_nderr_c3[1:0]),
                  // Outputs 
		   .filbuf_tag_evict_way_c3 (filbuf_tag_evict_way_c3[3:0]),
                  .filbuf_tag_hit_c2  (filbuf_tag_hit_c2), 
		  .filbuf_misbuf_tag_hit_frm_mb_c2(filbuf_misbuf_tag_hit_frm_mb_c2),
		  .filbuf_arb_tag_hit_frm_mb_c2(filbuf_arb_tag_hit_frm_mb_c2),
                  .filbuf_fbd_rd_en_c2   (filbuf_fbd_rd_en_c2), 
                  .filbuf_fbd_rd_entry_c2(filbuf_fbd_rd_entry_c2[2:0]), 
                   .filbuf_mcu_l2t_chunk_id_r1(filbuf_mcu_l2t_chunk_id_r1[1:0]), 
                   .filbuf_mcu_l2t_data_vld_r1(filbuf_mcu_l2t_data_vld_r1), 
                  .filbuf_fbd_wr_entry_r1(filbuf_fbd_wr_entry_r1[2:0]), 
                  .l2t_mcu_rd_req_id (l2t_mcu_rd_req_id[2:0]), 
                   .filbuf_fb_count_eq_0        (filbuf_fb_count_eq_0), 
                  .filbuf_misbuf_entry_avail(filbuf_misbuf_entry_avail), 
                  .filbuf_misbuf_match_c2 (filbuf_misbuf_match_c2), 
                  .filbuf_misbuf_fbid_d2  (filbuf_misbuf_fbid_d2[2:0]), 
                   .filbuf_fbf_enc_ld_mbid_r1   (filbuf_fbf_enc_ld_mbid_r1[4:0]), 
                   .filbuf_fbf_ready_miss_r1    (filbuf_fbf_ready_miss_r1), 
                   .filbuf_fbf_enc_dep_mbid_c4  (filbuf_fbf_enc_dep_mbid_c4[4:0]), 
                   .filbuf_fbf_st_or_dep_rdy_c4 (filbuf_fbf_st_or_dep_rdy_c4), 
                  .filbuf_misbuf_nofill_d2(filbuf_misbuf_nofill_d2), 
                  .filbuf_misbuf_stinst_match_c2(filbuf_misbuf_stinst_match_c2), 
                   .filbuf_l2d_fb_hit_c3     (l2t_l2d_fb_hit_c3), 
                  .filbuf_vuad_bypassed_c3(filbuf_vuad_bypassed_c3), 
                  .filbuf_arb_l2rd_en    (filbuf_arb_l2rd_en), 
                  .filbuf_arbdp_way_px2  (filbuf_arbdp_way_px2[3:0]), 
                  .filbuf_arbdp_tecc_px2 (filbuf_arbdp_tecc_px2), 
                  .filbuf_arbdp_entry_px2(filbuf_arbdp_entry_px2[2:0]), 
                  .filbuf_arb_vld_px1 (filbuf_arb_vld_px1), 
                  .filbuf_corr_err_c8    (filbuf_corr_err_c8), 
                  .filbuf_uncorr_err_c8  (filbuf_uncorr_err_c8), 
                   .filbuf_mcu_scb_mecc_err_d1 (filbuf_mcu_scb_mecc_err_d1), 
                   .filbuf_mcu_scb_secc_err_d1 (filbuf_mcu_scb_secc_err_d1), 
                  .filbuf_spc_corr_err_c6(filbuf_spc_corr_err_c6), 
                  .filbuf_spc_uncorr_err_c6(filbuf_spc_uncorr_err_c6), 
                  .filbuf_spc_rd_vld_c6  (filbuf_spc_rd_vld_c6), 
                  .filbuf_bsc_corr_err_c12(filbuf_bsc_corr_err_c12), 
                  .filbuf_ld64_fb_hit_c12(filbuf_ld64_fb_hit_c12), 
                  .filbuf_dis_cerr_c3    (filbuf_dis_cerr_c3), 
                  .filbuf_dis_uerr_c3    (filbuf_dis_uerr_c3), 
                  // Inputs 
		   //.l2t_l2d_stdecc_c2(l2t_l2d_stdecc_c2[77:0]),
                   .misbuf_vuad_ce_err_c8(misbuf_vuad_ce_err_c8),
                   .rdmat_rdmard_cerr_c12      (rdmat_rdmard_cerr_c12), 
                   .rdmat_rdmard_uerr_c12      (rdmat_rdmard_uerr_c12), 
		   .rdmat_rdmard_notdata_c12   (rdmat_rdmard_notdata_c12),
                   .rdmat_ev_cerr_r6           (rdmat_ev_cerr_r6), 
                   .rdmat_ev_uerr_r6           (rdmat_ev_uerr_r6), 
                  .misbuf_filbuf_next_vld_c4(misbuf_filbuf_next_vld_c4), 
                  .misbuf_filbuf_next_link_c4(misbuf_filbuf_next_link_c4[4:0]), 
                   .misbuf_mbf_delete_c4        (misbuf_mbf_delete_c4), 
                  .misbuf_hit_c4         (misbuf_hit_c4), 
                   .misbuf_mbf_insert_c4        (misbuf_mbf_insert_c4), 
                  .misbuf_filbuf_mcu_pick(misbuf_filbuf_mcu_pick), 
                  .misbuf_filbuf_fbid     (misbuf_filbuf_fbid[2:0]), 
                  .misbuf_filbuf_way      (misbuf_filbuf_way[3:0]), 
                  .misbuf_filbuf_way_fbid_vld(misbuf_filbuf_way_fbid_vld), 
                   .misbuf_mbf_insert_mbid_c4   (misbuf_mbf_insert_mbid_c4[4:0]), 
                   .arb_decdp_imiss_inst_c2  (arb_decdp_imiss_inst_c2), 
                   //.arb_decdp_ld_inst_c2     (arb_decdp_ld_inst_c2), 
                   .arbdec_arbdp_inst_mb_entry_c1(arbdec_arbdp_inst_mb_entry_c1[2:0]), 
                   .arb_decdp_cas1_inst_c2   (arb_decdp_cas1_inst_c2), 
                   .arbdec_arbdp_rdma_inst_c1   (arbdec_arbdp_rdma_inst_c1), 
                   .tag_misbuf_rdma_reg_vld_c2(tag_misbuf_rdma_reg_vld_c2_rep1b), 
                  .deccck_scrd_uncorr_err_c8(deccck_scrd_uncorr_err_c8), 
                  .deccck_scrd_corr_err_c8(deccck_scrd_corr_err_c8), 
                  .deccck_bscd_corr_err_c8(deccck_bscd_corr_err_c8), 
                  .deccck_bscd_uncorr_err_c8(deccck_bscd_uncorr_err_c8), 
                  .deccck_bscd_notdata_err_c8(deccck_bscd_notdata_err_c8),
                   .tagdp_tag_error_c8         (tagdp_tag_error_c8), 
                  .tag_rd64_complete_c11(tag_rd64_complete_c11), 
                   .tag_cerr_ack_tmp_c4      (tag_cerr_ack_tmp_c4), 
                   .tag_uerr_ack_tmp_c4      (tag_uerr_ack_tmp_c4), 
                   .tag_spc_rd_cond_c3       (tag_spc_rd_cond_c3), 
                  .csr_filbuf_scrub_ready(csr_filbuf_scrub_ready), 
                  .arb_filbuf_fbsel_c1(arb_filbuf_fbsel_c1), 
//                  .arb_fill_vld_c2   (arb_fill_vld_c2), 
                  .arb_fill_vld_c2   (arb_fill_vld_c2_rep1), 
                  .arb_filbuf_hit_off_c1(arb_filbuf_hit_off_c1), 
//                  .arb_filbuf_inst_vld_c2(arb_filbuf_inst_vld_c2), 
                   .arb_decdp_wr8_inst_c2    (arb_decdp_wr8_inst_c2), 
                   .arbdec_arbdp_inst_mb_c2     (arbdec_arbdp_inst_mb_c2), 
                   .arb_decdp_ld64_inst_c2   (arb_decdp_ld64_inst_c2), 
                   .csr_l2_bypass_mode_on    (csr_filbuf_l2off),       // Templated 
                   .csr_l2_dir_map_on        (csreg_filbuf_l2_dir_map_on), 
                  .mcu_l2t_data_vld_r0(mcu_l2t_data_vld_r0), 
                  .mcu_l2t_rd_req_id_r0(mcu_l2t_rd_req_id_r0[2:0]), 
                  .mcu_l2t_chunk_id_r0(mcu_l2t_chunk_id_r0[1:0]), 
                  .mcu_l2t_secc_err_r2(mcu_l2t_secc_err_r2), 
                  .mcu_l2t_mecc_err_r2(mcu_l2t_mecc_err_r2), 
                  .mcu_l2t_scb_mecc_err(mcu_l2t_scb_mecc_err), 
                  .mcu_l2t_scb_secc_err(mcu_l2t_scb_secc_err), 
                  .tag_rdma_gate_off_c2(tag_rdma_gate_off_c2_rep1), 
                  .scan_in(filbuf_scanin),
                  .scan_out(filbuf_scanout),
                  .l2clk                 (l2clk),
  .filbuf_misbuf_ue_offmode_c7(filbuf_misbuf_ue_offmode_c7),
  .filbuf_misbuf_ce_offmode_c7(filbuf_misbuf_ce_offmode_c7),
  .arb_inst_vld_c2_prev(arb_inst_vld_c2_prev),
  .l2t_mb2_run(l2t_mb2_run),
  .mbist_run(mbist_run)); 
 
 
n2_com_cm_8x40_cust       fbtag   
	( 
	.dout(fb_read_data[39:0]), // BS and SR 8 deep change 3/3/04
        .match(fb_cam_match[7:0]), 
        .match_idx(fb_match_idx_unused[7:0]), 
        .adr_w(filbuf_fbtag_wr_ptr[7:0]), 
	.din (fbtag_din[39:0]),
        //.din({evctag_mb_read_data[39:6],mb_data_read_data[`MBD_ECC_HI:`MBD_ECC_LO]}), 
        .write_en(filbuf_fbtag_wr_en), 
        .adr_r(filbuf_fbtag_rd_ptr[7:0]), 
        .lookup_en(arb_inst_vld_c1_v1), 
        .key(lkup_addr_c1[39:7]), 
        .tcu_array_wr_inhibit(array_wr_inhibit), 
	.tcu_scan_en(tcu_scan_en), 
        .scan_in(fbtag_scanin),
        .scan_out(fbtag_scanout),
        .l2clk(l2clk), 
        .read_en(filbuf_buf_rd_en), 
        .tcu_aclk(aclk),
        .tcu_bclk(bclk),
        .tcu_pce_ov(ce_ovrd),
        .pce(1'b1),
	.tcu_clk_stop(1'b0),
        .tcu_array_bypass (tcu_array_bypass),
	.tcu_se_scancollar_out(tcu_se_scancollar_out), 
	.tcu_se_scancollar_in(tcu_se_scancollar_in) 
	);
 
 
 
l2t_arbdat_dp	arbdat ( 
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
				.tcu_clk_stop(1'b0),
                            .arbdat_mbdata_inst_data_c8(mbdata_inst_data_c8[63:0]), 
                            .arbdat_arbdata_wr_data_c2(arbdata_wr_data_c2[38:0]), 
                           // Outputs 
                       .tag_l2d_col_offset_c2(l2t_l2d_col_offset_c2[3:0]), 
			    .st_ack_data(st_ack_data[63:0]), // BS and SR 11/12/03 N2 Xbar Packet format change
                            .arbdat_arbdp_oque_int_ret_c7(arbdat_arbdp_oque_int_ret_c7[17:0]), 
                            .arbdat_arbdp_store_data_c2(l2t_l2d_stdecc_c2[77:0]), 
                            .arbdat_csr_inst_wr_data_c8(arbdat_csr_inst_wr_data_c8[63:0]), 
                            .arbdat_word_lower_cmp_c8(arbdat_word_lower_cmp_c8), 
                            .arbdat_word_upper_cmp_c8(arbdat_word_upper_cmp_c8), 
                           // Inputs 
			   .arbdec_arbdp_inst_bufidhi_c1(arbdec_arbdp_inst_bufidhi_c1),
                      .sel_diag_store_data_c7   (sel_diag_store_data_c7), // BS and SR 12/22/03, store ack generation for diagnostic store

                            .ique_iq_arbdp_data_px2(ique_iq_arbdp_data_px2[63:0]), 
                            .snpd_snpq_arbdp_data_px2(snpd_snpq_arbdp_data_px2[63:0]), 
                           .mb_data_read_data(mb_data_read_data[63:0]), 
				.mbdata_cmp_sel(mbdata_cmp_sel[3:0]),
				.l2t_mb2_wdata(l2t_mb2_wdata[7:0]),
				.misbuf_buf_rd_en(misbuf_buf_rd_en),
                           .misbuf_arb_l2rd_en(misbuf_arb_l2rd_en), 
                            .arb_mux2_snpsel_px2(arb_arbdat_mux2_snpsel_px2), 
                            .arb_mux3_bufsel_px2(arb_arbdat_mux3_bufsel_px2), 
                            .arb_mux4_c1sel_px2(arb_arbdat_mux4_c1sel_px2), 
                           .arb_decc_data_sel_c9(arb_decc_data_sel_c9), 
                            .arb_bist_or_diag_acc_c1(arb_bist_or_diag_acc_c1), 
                            .arbdec_arbdp_poison_c1(arbdec_arbdp_poison_c1), 
                           .bist_data_data_c1(mbist_write_data[7:0]), // Templated 
                           .bist_data_enable_c1(mbist_arb_l2d_write), // Templated 
                           .decc_arbdp_data_c8(decc_arbdp_data_c8[63:0]), 
                            .arb_dword_mask_c8(arb_dword_mask_c8[7:0]), 
                           .scan_in(arbdat_scanin),
                           .scan_out(arbdat_scanout),
                           .l2clk        (l2clk),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .mbdata_fail_bot(mbdata_fail_bot),
  .tag_data_array_wr_active_c1(tag_data_array_wr_active_c1),
  .l2t_mb2_run(l2t_mb2_run),
  .arb_inst_vld_c2_prev(arb_inst_vld_c2_prev),
  .dec_col_offset_prev_c1(dec_col_offset_prev_c1[3:0]),
  .arbadr_arbdp_addr5to4_c1(arbadr_arbdp_addr5to4_c1[1:0])); 
 
 
l2t_arbadr_dp	arbadr ( 
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
				.tcu_clk_stop(1'b0),
				.tcu_muxtest(tcu_muxtest),
				.tcu_dectest(tcu_dectest),
				.l2t_mb2_run			(l2t_mb2_run),
                            .arbadr_arbdp_cam_addr_px2(arbdp_cam_addr_px2[39:0]), 
                            .arbadr_mbcam_addr_px2(arbadr_mbcam_addr_px2[41:7]),
                          //  .arbadr_arbdp_dbg_addr_c3(arbdp_dbg_addr_c3[5:2]), 
                            .arbdat_arbdata_wr_data_c2(arbdata_wr_data_c2[27:0]), 
				/*AUTOINST*/ 
                           // Outputs 
				.arbadr_csr_debug_addr	(arbadr_csr_debug_addr[33:2]),
                  	  //  .arbadr_2bnk_true_enbld_dist(arbadr_2bnk_true_enbld_dist), // BS 03/25/04 for partial bank/core modes support
                  	  //  .arbadr_4bnk_true_enbld_dist(arbadr_4bnk_true_enbld_dist), // BS 03/25/04 for partial bank/core modes support
                          //  .arbadr_ncu_l2t_pm_n_dist(arbadr_ncu_l2t_pm_n_dist), // BS 03/25/04 for partial bank/core modes support
		
			.arbadr_dirvec_2bnk_true_enbld_dist		(arbadr_dirvec_2bnk_true_enbld_dist),
			.arbadr_dirvec_4bnk_true_enbld_dist              (arbadr_dirvec_4bnk_true_enbld_dist),
			.arbadr_dirvec_ncu_l2t_pm_n_dist                 (arbadr_dirvec_ncu_l2t_pm_n_dist),
			.arbadr_evctag_2bnk_true_enbld_dist              (arbadr_evctag_2bnk_true_enbld_dist),
			.arbadr_evctag_4bnk_true_enbld_dist              (arbadr_evctag_4bnk_true_enbld_dist),
			.arbadr_evctag_ncu_l2t_pm_n_dist                 (arbadr_evctag_ncu_l2t_pm_n_dist),
			.arbadr_tagd_2bnk_true_enbld_dist                (arbadr_tagd_2bnk_true_enbld_dist),
			.arbadr_tagd_4bnk_true_enbld_dist                (arbadr_tagd_4bnk_true_enbld_dist),
			.arbadr_tagd_ncu_l2t_pm_n_dist                   (arbadr_tagd_ncu_l2t_pm_n_dist),
			.arbadr_arbctl_2bnk_true_enbld_dist              (arbadr_arbctl_2bnk_true_enbld_dist),
			.arbadr_arbctl_4bnk_true_enbld_dist              (arbadr_arbctl_4bnk_true_enbld_dist),
			.arbadr_arbctl_ncu_l2t_pm_n_dist                 (arbadr_arbctl_ncu_l2t_pm_n_dist),

                            .arbadr_arbdp_addr87_c2(arbadr_arbdp_addr87_c2[1:0]), // BS 03/25/04 for partial bank/core modes support
			    .arbadr_dirvec_addr3_c7(arbadr_dirvec_addr3_c7), // BS and SR 11/12/03 N2 Xbar Packet format change
                                                                             // add3 for store ack including diagnostic stores
                            .arbadr_arbdp_tag_idx_px2(arbadr_arbdp_tag_idx_px2[8:0]), 
                            .arbadr_arbdp_vuad_idx1_px2(arbadr_arbdp_vuad_idx1_px2[8:0]), 
                            .arbadr_arbdp_vuad_idx2_px2(arbadr_arbdp_vuad_idx2_px2[8:0]), 
                            .arbadr_arbdp_tagdata_px2(arbadr_arbdp_tagdata_px2[27:6]), 
                            .arbadr_arbdp_new_addr5to4_px2(arbadr_arbdp_new_addr5to4_px2[1:0]), 
                            .arbadr_arbdp_addr_c1c2comp_c1(arbadr_arbdp_addr_c1c2comp_c1), 
                            .arbadr_arbdp_addr_c1c3comp_c1(arbadr_arbdp_addr_c1c3comp_c1), 
				.arbadr_idx_c1c2comp_c1_n(arbadr_idx_c1c2comp_c1_n),
				.arbadr_idx_c1c3comp_c1_n(arbadr_idx_c1c3comp_c1_n),
				.arbadr_idx_c1c4comp_c1_n(arbadr_idx_c1c4comp_c1_n),
				.arbadr_idx_c1c5comp_c1_n(arbadr_idx_c1c5comp_c1_n),
                           // .arbadr_vuad_idx_c1c2comp_c1(arbadr_vuad_idx_c1c2comp_c1), 
                           // .arbadr_vuad_idx_c1c3comp_c1(arbadr_vuad_idx_c1c3comp_c1), 
                            .arbadr_misbuf_idx_c1c2comp_c1(arbadr_misbuf_idx_c1c2comp_c1), 
                            .arbadr_misbuf_idx_c1c3comp_c1(arbadr_misbuf_idx_c1c3comp_c1), 
                            //.arbadr_idx_c1c4comp_c1(arbadr_idx_c1c4comp_c1), 
                            //.arbadr_idx_c1c5comp_c1(arbadr_idx_c1c5comp_c1), 
                            .arbadr_arbdp_ioaddr_c1(arbadr_arbdp_ioaddr_c1[39:32]), 
                            .arbadr_arbdp_addr5to4_c1(arbadr_arbdp_addr5to4_c1[1:0]), 
                            .arbadr_arbdp_addr3to2_c1(arbadr_arbdp_addr3to2_c1[1:0]), 
                            .arbadr_arbdp_diag_wr_way_c2(arbdp_diag_wr_way_c2[3:0]), 
                           .l2t_l2d_set_c2(l2t_l2d_set_c2[8:0]), // Templated 
                            .arbadr_arbaddr_addr22_c2(arbaddr_addr22_c2), 
                            .arbadr_arbdp_addr_start_c2(arbadr_arbdp_addr_start_c2), 
                            .arbadr_arbaddr_idx_c3(arbaddr_idx_c3[10:0]), 
                            .arbadr_dir_cam_addr_c3(arbadr_dir_cam_addr_c3[39:7]), 
                            .arbadr_arbdp_addr11to4_c3(arbadr_arbdp_addr11to4_c3[7:0]), 
                            .arbadr_arbdp_addr5to4_c3(arbadr_arbdp_addr5to4_c3[1:0]), 
                            .arbadr_c1_addr_eq_wb_c4(arbadr_c1_addr_eq_wb_c4), 
                            .arbadr_arbdp_rdmat_addr_c6(arbadr_arbdp_rdmat_addr_c6[5:2]), 
                            .arbadr_arbdp_waddr_c6(arbadr_arbdp_waddr_c6[1:0]), 
                            .arbadr_arbdp_word_addr_c6(arbadr_arbdp_word_addr_c6[4:0]), 
                            .arbadr_arbdp_byte_addr_c6(arbadr_arbdp_byte_addr_c6[2:0]), // // Phase 2 : SIU inteface and packet format change 2/7/04
                            .arbadr_arbdp_addr22_c7(arbadr_arbdp_addr22_c7), 
                            .arbadr_arbdp_csr_addr_c9(arbdp_csr_addr_c9[39:4]), 
                            .arbadr_rdmard_addr_c12(arbadr_rdmard_addr_c12[39:6]), 
                            .arbadr_arbdp_line_addr_c6(arbadr_arbdp_line_addr_c6[5:4]), 
                            .arbadr_arbdp_oque_l1_index_c7(arbadr_arbdp_oque_l1_index_c7[11:6]), 
                           .arbadr_addr2_c8(arbadr_addr2_c8), 
                            .arbadr_data_ecc_idx(arbadr_data_ecc_idx[8:0]), 
                            .arbadr_tag_wrdata_px2(arbadr_tag_wrdata_px2[27:0]), 
                           // Inputs 
                            .ncu_l2t_pm(ncu_l2t_pm), // BS 03/25/04 for partial bank/core modes support
                            .ncu_l2t_ba01(ncu_l2t_ba01), // BS 03/25/04 for partial bank/core modes support
                            .ncu_l2t_ba23(ncu_l2t_ba23), // BS 03/25/04 for partial bank/core modes support
                            .ncu_l2t_ba45(ncu_l2t_ba45), // BS 03/25/04 for partial bank/core modes support
                            .ncu_l2t_ba67(ncu_l2t_ba67), // BS 03/25/04 for partial bank/core modes support
                      .sel_diag_store_data_c7   (sel_diag_store_data_c7), // BS and SR 12/22/03, store ack generation for diagnostic store
                            .ique_iq_arbdp_addr_px2(ique_iq_arbdp_addr_px2[39:0]), 
                            .snpd_snpq_arbdp_addr_px2(snpd_snpq_arbdp_addr_px2[39:0]), 
 			    .mbist_tag_lkup_addr	(mbist_tag_lkup_addr[27:0]),
                           .evctag_addr_px2(evctag_addr_px2[39:0]), 
			.mb2_l2t_wk1_cam_init		(mb2_l2t_wk1_cam_init),
			.mb2_l2t_wk1_cam_shift		(mb2_l2t_wk1_cam_shift),
                           .tagd_evict_tag_c4(tagd_evict_tag_c4[`TAG_WIDTH_LESS1:0]), 
                           .tagd_evict_tag_c3(tagd_evict_tag_c3[`TAG_WIDTH_LESS1:0]), 
                            .arb_mux2_snpsel_px2(arb_arbadr_mux2_snpsel_px2), 
			.arb_mux3_bufsel_px1	(arb_mux3_bufsel_px1),
                            .arb_mux4_c1sel_px2(arb_arbadr_mux4_c1sel_px2), 
                            .arb_inc_tag_ecc_cnt_c3_n(arb_inc_tag_ecc_cnt_c3_n), 
                            .arb_data_ecc_idx_reset(arb_data_ecc_idx_reset), 
                            .arb_data_ecc_idx_en(arb_data_ecc_idx_en), 
                            .arb_sel_vuad_bist_px2(arb_sel_vuad_bist_px2), 
                            .arb_sel_deccck_or_bist_idx(arb_sel_deccck_or_bist_idx), 
                            .arb_sel_diag_addr_px2(arb_sel_diag_addr_px2), 
                            .arb_sel_tecc_addr_px2(arb_sel_tecc_addr_px2), 
                            .arb_sel_deccck_addr_px2(arb_sel_deccck_addr_px2), 
                            .arb_sel_diag_tag_addr_px2(arb_sel_diag_tag_addr_px2), 
                            .arb_sel_lkup_stalled_tag_px2(arb_sel_lkup_stalled_tag_px2), 
                           .arb_imiss_hit_c10(arb_imiss_hit_c10), 
                           .tag_rd64_complete_c11(tag_rd64_complete_c11), 
                           .arb_imiss_hit_c4(arb_imiss_hit_c4), 
                            .arb_sel_c2_stall_idx_c1(arb_sel_c2_stall_idx_c1), 
                           .bist_data_set_c1(mbist_l2d_index[8:0]), // Templated, BS & SR 10/28/03 
                           .bist_data_enable_c1(mbist_arb_l2d_en), // Templated 
                           .bist_vuad_idx_px1(mbist_l2v_index[8:0]), // Templated, BS & SR 10/28/03 
                           .scan_in(arbadr_scanin),
                           .scan_out(arbadr_scanout),
                           .l2clk        (l2clk), 
                            .arb_diag_or_tecc_write_px2(arb_diag_or_tecc_write_px2), 
                            .arb_sel_way_px2 (arb_sel_way_px2),
  .io_cmp_sync_en(io_cmp_sync_en),
  .mbist_lookupen(mbist_lookupen),
  .mbist_run(mbist_run),
  .l2t_mb2_wdata(l2t_mb2_wdata[7:0])); 
 
l2t_arb_ctl	arb( 
                .tcu_pce_ov(ce_ovrd),
                .tcu_aclk(aclk),
                .tcu_bclk(bclk),
		.tcu_scan_en(tcu_scan_en),
                .arb_mb_camen_px2(arb_mb_camen_px2), 
		.wmr_l		(wmr_l), 
                .arb_inst_vld_c1(arb_inst_vld_c1), 
                .arb_dc_ic_rd_bit_4(arb_dc_ic_rd_bit_4), 
                // Outputs 
                .arb_cpuid_c5          (arb_cpuid_c5[2:0]),
                     .arb_upper_four_byte_access_c1(arb_upper_four_byte_access_c1), // BS 05/04/04 : taking out upper_four_byte_access info
                     .arb_lower_four_byte_access_c1(arb_lower_four_byte_access_c1), // BS 05/04/04 : taking out lower_four_byte_access info
		     .arb_decdp_mmuld_inst_c6(arb_decdp_mmuld_inst_c6), // BS and SR 11/12/03 N2 Xbar Packet format change
                     .arb_acc_vd_c2  (arb_acc_vd_c2), 
                     .arb_acc_ua_c2  (arb_acc_ua_c2), 
                     .arb_oqu_swap_cas2_req_c2 (arb_oqu_swap_cas2_req_c2),
                      .arb_mux1_mbsel_px2    (arb_mux1_mbsel_px2), 
                      .arb_arbdat_mux2_snpsel_px2(arb_arbdat_mux2_snpsel_px2), 
                      .arb_arbadr_mux2_snpsel_px2(arb_arbadr_mux2_snpsel_px2), 
			.arb_mux3_bufsel_px1	(arb_mux3_bufsel_px1),
                      .arb_arbdec_mux2_snpsel_px2(arb_arbdec_mux2_snpsel_px2), 

                      .arb_arbdat_mux3_bufsel_px2   (arb_arbdat_mux3_bufsel_px2), 
                      .arb_arbdec_mux3_bufsel_px2   (arb_arbdec_mux3_bufsel_px2), 

                      .arb_arbadr_mux4_c1sel_px2    (arb_arbadr_mux4_c1sel_px2), 
                      .arb_arbdat_mux4_c1sel_px2    (arb_arbdat_mux4_c1sel_px2), 
                      .arb_arbdec_mux4_c1sel_px2    (arb_arbdec_mux4_c1sel_px2), 

                      .arb_data_ecc_idx_en   (arb_data_ecc_idx_en), 
                      .arb_data_ecc_idx_reset(arb_data_ecc_idx_reset), 
                      .arb_sel_tecc_addr_px2 (arb_sel_tecc_addr_px2), 
                      .arb_sel_deccck_addr_px2 (arb_sel_deccck_addr_px2), 
                      .arb_sel_diag_addr_px2 (arb_sel_diag_addr_px2), 
                      .arb_sel_diag_tag_addr_px2(arb_sel_diag_tag_addr_px2), 
                      .arb_inc_tag_ecc_cnt_c3_n(arb_inc_tag_ecc_cnt_c3_n), 
                      .arb_sel_lkup_stalled_tag_px2(arb_sel_lkup_stalled_tag_px2), 
                      .arb_bist_or_diag_acc_c1(arb_bist_or_diag_acc_c1), 
                      .arb_sel_deccck_or_bist_idx(arb_sel_deccck_or_bist_idx), 
                      .arb_sel_vuad_bist_px2 (arb_sel_vuad_bist_px2), 
                     .arb_misbuf_inst_vld_c2(arb_misbuf_inst_vld_c2), 
                    // .arb_filbuf_inst_vld_c2(arb_filbuf_inst_vld_c2), 
                     .arb_inst_vld_c2(arb_inst_vld_c2), 
                     .arb_inst_vld_c2_prev(arb_inst_vld_c2_prev), 
                     .misbuf_vuad_ce_instr_c2(misbuf_vuad_ce_instr_c2), 
                     .arb_tag_inst_vld_c2(arb_tag_inst_vld_c2), 
                     .arb_wbuf_inst_vld_c2(arb_wbuf_inst_vld_c2), 
                     .arb_imiss_hit_c10(arb_imiss_hit_c10), 
                     .arb_imiss_hit_c4(arb_imiss_hit_c4), 
                     .arb_evict_c3   (arb_evict_c3), 
                     .arb_evict_c4   (arb_evict_c4), 
                     //.arb_arbdp_evict_c4   (arb_arbdp_evict_c4), 
                     .arb_dc_evict_c4   (arb_dc_evict_c4), 
                     .arb_ic_evict_c4   (arb_ic_evict_c4), 
                     .arb_inval_inst_vld_c3   (arb_inval_inst_vld_c3), 
                      .arb_sel_c2_stall_idx_c1(arb_sel_c2_stall_idx_c1), 
                     .arb_vuad_acc_px2(arb_vuad_acc_px2), 
                     .arb_tag_wr_px2 (arb_tag_wr_px2), 
                     .arb_vuad_idx2_sel_px2_n(arb_vuad_idx2_sel_px2_n), 
                     .arb_filbuf_fbsel_c1(arb_filbuf_fbsel_c1), 
                     .arb_misbuf_mbsel_c1(arb_misbuf_mbsel_c1), 
                     .arb_iqsel_px2  (arb_iqsel_px2), 
                     .arb_evict_vld_c2(arb_evict_vld_c2), 
                     .arb_inst_diag_c1(arb_inst_diag_c1), 
                      .arb_l2d_fbrd_c3    (l2t_l2d_fbrd_c3), 
                     .arb_misbuf_ctrue_c9(arb_misbuf_ctrue_c9), 
                     .arb_misbuf_cas1_hit_c8(arb_misbuf_cas1_hit_c8), 
		     .arb_pf_ice_inst_c2(arb_pf_ice_inst_c2),
		     .arb_pf_ice_inst_c7(arb_pf_ice_inst_c7),
                     .arb_decc_data_sel_c9(arb_decc_data_sel_c9), 
                     .arb_tecc_way_c2(arb_tecc_way_c2[3:0]), 
                     .arb_l2tag_vld_c4(arb_l2tag_vld_c4), 
                      .arb_dword_mask_c8     (arb_dword_mask_c8[7:0]), 
                     .arb_fill_vld_c2(arb_fill_vld_c2), 
                     .arb_imiss_vld_c2(arb_imiss_vld_c2), 
                     .arb_normal_tagacc_c2(arb_normal_tagacc_c2), 
                     .arb_tagd_tecc_c2(arb_tagd_tecc_c2), 
                     .arb_dir_vld_c3_l(arb_dir_vld_c3_l), 
                     .arb_dc_rd_en_c3(arb_dc_rd_en_c3), 
                     .arb_ic_rd_en_c3(arb_ic_rd_en_c3), 
                     .arb_dc_wr_en_c3(arb_dc_wr_en_c3), 
                     .arb_ic_wr_en_c3(arb_ic_wr_en_c3), 
                     .arb_dir_panel_dcd_c3(arb_dir_panel_dcd_c3[4:0]), 
                     .arb_dir_panel_icd_c3(arb_dir_panel_icd_c3[4:0]), 
                     .arb_lkup_bank_ena_dcd_c3(arb_lkup_bank_ena_dcd_c3[3:0]), 
                     .arb_lkup_bank_ena_icd_c3(arb_lkup_bank_ena_icd_c3[3:0]), 
                     .arb_inval_mask_dcd_c3(arb_inval_mask_dcd_c3[7:0]), 
                     .arb_inval_mask_icd_c3(arb_inval_mask_icd_c3[7:0]), 
                     .arb_wr_dc_dir_entry_c3(arb_wr_dc_dir_entry_c3[4:0]), 
                     .arb_wr_ic_dir_entry_c3(arb_wr_ic_dir_entry_c3[4:0]), 
                      .arb_dir_addr_c9       (arb_dir_addr_c9[10:0]), 
                     .arb_dir_wr_en_c4(arb_dir_wr_en_c4), 
                     .arb_csr_wr_en_c7(arb_csr_wr_en_c7), 
                     .arb_csr_rd_en_c7(arb_csr_rd_en_c7), 
                     .arb_evict_c5   (arb_evict_c5), 
                     .arb_waysel_gate_c2(arb_waysel_gate_c2), 
                     .arb_data_diag_st_c2(arb_data_diag_st_c2), 
                     .arb_inval_inst_c2(arb_inval_inst_c2), 
                      .arb_decdp_ld64_inst_c1(arb_decdp_ld64_inst_c1), 
                     .arb_waysel_inst_vld_c2(arb_waysel_inst_vld_c2), 
		.ique_arb_pf_ice_px2 (ique_arb_pf_ice_px2),
                     .arb_rdwr_inst_vld_c2(arb_rdwr_inst_vld_c2), 
                      .arb_ic_inval_vld_c7   (ic_inval_vld_c7), 
                      .arb_dc_inval_vld_c7   (dc_inval_vld_c7), 
                     .arb_inst_l2data_vld_c6(arb_inst_l2data_vld_c6), 
                     .arb_csr_wr_en_c3(arb_csr_wr_en_c3), 
                     .arb_csr_rd_en_c3(arb_csr_rd_en_c3), 
                     .arb_diag_complete_c3(arb_diag_complete_c3), 
                     .arb_tag_pst_with_ctrue_c1(arb_tag_pst_with_ctrue_c1), 
                     .arb_csr_st_c2  (arb_csr_st_c2), 
                     .arb_misbuf_hit_off_c1(arb_misbuf_hit_off_c1), 
                     .arb_pst_ctrue_en_c8(arb_pst_ctrue_en_c8), 
                     .arb_evict_tecc_vld_c2(arb_evict_tecc_vld_c2), 
                     .arb_filbuf_hit_off_c1(arb_filbuf_hit_off_c1), 
                     .arb_wbuf_hit_off_c1(arb_wbuf_hit_off_c1), 
                     .arb_inst_l2vuad_vld_c6(arb_inst_l2vuad_vld_c6), 
                     .arb_inst_l2tag_vld_c6(arb_inst_l2tag_vld_c6), 
                      .arb_decdp_tag_wr_c1(arb_decdp_tag_wr_c1), 
                      .arb_decdp_pst_inst_c2 (arb_decdp_pst_inst_c2), 
                      .arb_decdp_fwd_req_c2  (arb_decdp_fwd_req_c2), 
                      .arb_decdp_swap_inst_c2(arb_decdp_swap_inst_c2), 
                      .arb_decdp_imiss_inst_c2(arb_decdp_imiss_inst_c2), 
                      .arb_decdp_inst_int_c2 (arb_decdp_inst_int_c2), 
                      .arb_decdp_inst_int_c1 (arb_decdp_inst_int_c1), 
                      .arb_decdp_ld64_inst_c2(arb_decdp_ld64_inst_c2), 
                      .arb_decdp_bis_inst_c3 (arb_decdp_bis_inst_c3), 
                      .arb_decdp_rmo_st_c3   (arb_decdp_rmo_st_c3), 
                      .arb_decdp_strst_inst_c2(arb_decdp_strst_inst_c2), 
                      .arb_decdp_wr8_inst_c2 (arb_decdp_wr8_inst_c2), 
                      .arb_decdp_wr64_inst_c2(arb_decdp_wr64_inst_c2), 
                      .arb_decdp_st_inst_c2  (arb_decdp_st_inst_c2), 
                      .arb_decdp_st_inst_c3  (arb_decdp_st_inst_c3), 
                      .arb_decdp_st_with_ctrue_c2(arb_decdp_st_with_ctrue_c2), 
                      .arb_decdp_ld_inst_c2  (arb_decdp_ld_inst_c2), 
                      .arb_arbdp_pst_with_ctrue_c2(arb_arbdp_pst_with_ctrue_c2), 
                      .arb_decdp_cas1_inst_c2(arb_decdp_cas1_inst_c2), 
                      .arb_decdp_cas2_inst_c2(arb_decdp_cas2_inst_c2), 
                      .arb_decdp_cas2_from_mb_c2(arb_decdp_cas2_from_mb_c2), 
                      .filbuf_tag_hit_frm_mb_c2(filbuf_arb_tag_hit_frm_mb_c2_rep), 
                     // .arb_decdp_cas2_from_mb_ctrue_c2(arb_decdp_cas2_from_mb_ctrue_c2), 
                     .arb_inst_l2vuad_vld_c3(arb_inst_l2vuad_vld_c3), 
                      .arb_decdp_pf_inst_c5  (arb_decdp_pf_inst_c5), 
                      .arb_decdp_strld_inst_c6(arb_decdp_strld_inst_c6), 
                      .arb_decdp_atm_inst_c6 (arb_decdp_atm_inst_c6), 
                      .arb_store_err_c8      (arb_store_err_c8), 
                      .arb_arbdp_tecc_inst_mb_c8(arb_arbdp_tecc_inst_mb_c8), 
                     .arb_tagd_perr_vld_c2(arb_tagd_perr_vld_c2), 
                      .arb_arbdp_tag_pst_no_ctrue_c2(arb_arbdp_tag_pst_no_ctrue_c2), 
                      .arb_arbdp_misbuf_pst_no_ctrue_c2(arb_arbdp_misbuf_pst_no_ctrue_c2), 
                      .arb_arbdp_vuadctl_pst_no_ctrue_c2(arb_arbdp_vuadctl_pst_no_ctrue_c2), 
                     .arb_tecc_c2    (arb_tecc_c2), 
                      .arb_vuadctl_no_bypass_px2(arb_vuadctl_no_bypass_px2), 
                      .arb_sel_way_px2       (arb_sel_way_px2), 
                      .arb_diag_or_tecc_write_px2(arb_diag_or_tecc_write_px2), 
                     .arb_tag_rd_px2 (arb_tag_rd_px2), 
                     .arb_tag_way_px2(arb_tag_way_px2[15:0]),  // BS & SR 10/28/03
                      .arb_mux1_mbsel_px1    (arb_mux1_mbsel_px1), 
                      .arb_wr8_inst_no_ctrue_c1(arb_wr8_inst_no_ctrue_c1), 
		      .arb_bs_or_bis_inst_c2(arb_bs_or_bis_inst_c2),
			.usaloc_ua_ce_c2 (usaloc_ua_ce_c2),
			.vlddir_vd_ce_c2 (vlddir_vd_ce_c2[1]),
			.arb_vuad_ce_err_c2 (arb_vuad_ce_err_c2),
			.usaloc_vlddir_arb_vuad_ce_err_c3 (usaloc_vlddir_arb_vuad_ce_err_c3),
			.tagctl_arb_vuad_ce_err_c3 (tagctl_arb_vuad_ce_err_c3),
			//.arb_vuad_ce_err_c3 (arb_vuad_ce_err_c3),
                     // Inputs 
                     .arbadr_2bnk_true_enbld_dist(arbadr_arbctl_2bnk_true_enbld_dist), // BS 03/25/04 for partial bank/core modes support
                     .arbadr_4bnk_true_enbld_dist(arbadr_arbctl_4bnk_true_enbld_dist), // BS 03/25/04 for partial bank/core modes support
                     .arbadr_arbdp_addr87_c2(arbadr_arbdp_addr87_c2[1:0]), // BS 03/25/04 for partial bank/core modes support
                     .arbadr_ncu_l2t_pm_n_dist(arbadr_arbctl_ncu_l2t_pm_n_dist), // BS 03/25/04 for partial bank/core modes support
 		     .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status), // BS 03/25/04 for partial bank/core modes support  
 		     .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status), // BS 03/25/04 for partial bank/core modes support
 		     .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status), // BS 03/25/04 for partial bank/core modes support
 		     .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status), // BS 03/25/04 for partial bank/core modes support
 		     .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status), // BS 03/25/04 for partial bank/core modes support
 		     .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status), // BS 03/25/04 for partial bank/core modes support
 		     .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status), // BS 03/25/04 for partial bank/core modes support
 		     .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status), // BS 03/25/04 for partial bank/core modes support
		     .mbist_arb_l2t_write(mbist_arb_l2t_write),
                     .oqu_arb_full_px2(oqu_arb_full_px2), 
                     .misbuf_arb_vld_px1(misbuf_arb_vld_px1), 
                     .misbuf_arb_cnt28_px2_prev(misbuf_arb_cnt28_px2_prev), 
                     .misbuf_arb_snp_cnt8_px1(misbuf_arb_snp_cnt8_px1), 
                     .wbuf_arb_full_px1(wbuf_arb_full_px1), 
		     .l2t_mb2_mbtag_lookup_en(l2t_mb2_mbtag_lookup_en),
		     .l2t_mb2_fbtag_lookup_en(l2t_mb2_fbtag_lookup_en),
		     .l2t_mb2_wbtag_lookup_en(l2t_mb2_wbtag_lookup_en),
		     .l2t_mb2_rdmatag_lookup_en(l2t_mb2_rdmatag_lookup_en),
		     .l2t_mb2_run(l2t_mb2_run),
                     .filbuf_arb_vld_px1(filbuf_arb_vld_px1), 
                      .iqu_iq_arb_vld_px2 (iqu_iq_arb_vld_px2), 
                      .ique_iq_arb_vbit_px2(ique_iq_arb_vbit_px2), 
                      .ique_iq_arb_atm_px2 (ique_iq_arb_atm_px2), 
                      .ique_iq_arb_csr_px2 (ique_iq_arb_csr_px2), 
                      .ique_iq_arb_st_px2  (ique_iq_arb_st_px2), 
                      .snp_snpq_arb_vld_px1(snp_snpq_arb_vld_px1), 
                     .tag_deccck_data_sel_c8(tag_deccck_data_sel_c8), 
                     .tag_rdma_vld_px1(tag_rdma_vld_px1), 
                      .tag_data_ecc_active_c3(tag_data_ecc_active_c3), 
                      .tag_decc_tag_acc_en_px2(tag_decc_tag_acc_en_px2), 
                     .misbuf_nondep_fbhit_c3(misbuf_nondep_fbhit_c3), 
                     .mbist_arb_l2d_en  (mbist_arb_l2d_en), 
                     .bist_vuad_rd_en_px1(mbist_l2v_read),       // Templated 
                      .arbdec_arbdp_inst_fb_c2  (arbdec_arbdp_inst_fb_c2), 
                     .arbadr_arbdp_ioaddr_c1_39to37(arbadr_arbdp_ioaddr_c1[39:37]), // Templated
                     .arbadr_arbdp_ioaddr_c1_35to33(arbadr_arbdp_ioaddr_c1[35:33]), // Templated
                      .arbdec_size_field_c8     (arbdec_size_field_c8[1:0]), 
                      .arbdat_word_lower_cmp_c8 (arbdat_word_lower_cmp_c8), 
                      .arbdat_word_upper_cmp_c8 (arbdat_word_upper_cmp_c8), 
                     .arbadr_addr2_c8(arbadr_addr2_c8), 
                      .arbdec_arbdp_inst_size_c7(arbdec_arbdp_inst_size_c7[7:0]), // BS and SR 11/12/03 N2 Xbar Packet format change 
                      .arbadr_arbdp_diag_wr_way_c2(arbdp_diag_wr_way_c2[3:0]), 
                      .arbdec_arbdp_inst_way_c1 (arbdec_arbdp_inst_way_c1[3:0]), 
                      .arbdec_arbdp_tecc_c1     (arbdec_arbdp_tecc_c1), 
                     .filbuf_arbdp_way_px2(filbuf_arbdp_way_px2[3:0]), 
                      .arbdec_arbdp_inst_mb_c2  (arbdec_arbdp_inst_mb_c2), 
                      .arbdec_arbdp_inst_fb_c1  (arbdec_arbdp_inst_fb_c1), 
                      .arbdec_arbdp_inst_dep_c2 (arbdec_arbdp_inst_dep_c2), 
                     .tag_hit_l2orfb_c3(tag_hit_l2orfb_c3), 
                     .tagdp_arb_par_err_c3(tagdp_arb_par_err_c3), 
                      .tagdp_invalid_evict_c3  (tagdp_invalid_evict_c3), 
                      .arbdec_arbdp_inst_nc_c3  (arbdec_arbdp_inst_nc_c3), 
                      .arbdec_arbdp_cpuid_c2    (arbdec_arbdp_cpuid_c2[2:0]), 
                      .arbdec_arbdp_l1way_c3    (arbdec_arbdp_l1way_c3[1:0]), 
                      .arbadr_arbdp_addr11to4_c3(arbadr_arbdp_addr11to4_c3[7:0]), 
                      .arbadr_arbdp_new_addr5to4_px2(arbadr_arbdp_new_addr5to4_px2[1:0]), 
                      .arbadr_arbdp_addr5to4_c1 (arbadr_arbdp_addr5to4_c1[1:0]), 
                      .arbadr_arbdp_addr5to4_c3 (arbadr_arbdp_addr5to4_c3[1:0]), 
                      .arbdec_arbdp_inst_mb_c3  (arbdec_arbdp_inst_mb_c3), 
                      .arbdec_arbdp_inst_tecc_c3(arbdec_arbdp_inst_tecc_c3), 
                      .arbdec_arbdp_inst_bufidhi_c1(arbdec_arbdp_inst_bufidhi_c1), 
                      .arbdec_arbdp_inst_bufid1_c1(arbdec_arbdp_inst_bufid1_c1), 
                      .arbdec_arbdp_inst_mb_c1  (arbdec_arbdp_inst_mb_c1), 
                      .arbdec_arbdp_evict_c1    (arbdec_arbdp_evict_c1), 
                      .arbdec_arbdp_inst_rqtyp_c1(arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO]), 
                      .arbdec_arbdp_inst_rsvd_c1(arbdec_arbdp_inst_rsvd_c1_1), 
                      .arbdec_arbdp_inst_nc_c1  (arbdec_arbdp_inst_nc_c1), 
                      .arbdec_arbdp_inst_ctrue_c1(arbdec_arbdp_inst_ctrue_c1), 
                      .arbdec_arbdp_inst_size_c1(arbdec_arbdp_inst_size_c1[`L2_SZ_HI:`L2_SZ_LO]), 
                      .arbadr_arbdp_addr_start_c2(arbadr_arbdp_addr_start_c2), 
                      .arbdec_arbdp_rdma_inst_c2(arbdec_arbdp_rdma_inst_c2), 
                      .arbdec_arbdp_inst_bufidlo_c2(arbdec_arbdp_inst_bufidlo_c2), 
                      .arbdec_arbdp_inst_rqtyp_c2(arbdec_arbdp_inst_rqtyp_c2[`L2_RQTYP_HI:`L2_RQTYP_LO]), 
                      .arbdec_arbdp_inst_rqtyp_c6(arbdec_arbdp_inst_rqtyp_c6[`L2_RQTYP_HI:`L2_RQTYP_LO]), 
                      .arbadr_arbaddr_addr22_c2 (arbaddr_addr22_c2), 
                     .bist_acc_vd_px1   (mbist_l2v_vd),          // Templated 
                      .csr_l2_bypass_mode_on (csr_l2_bypass_mode_on), 
                     .scan_in(arb_scanin),
                     .scan_out(arb_scanout),
                     .l2clk              (l2clk),
  .misbuf_arb_hit_c3(misbuf_arb_hit_c3),
  .arb_misbuf_inval_inst_c2(arb_misbuf_inval_inst_c2),
  .iqu_iq_arb_vld_px2_v1(iqu_iq_arb_vld_px2_v1),
  .arb_l2drpt_waysel_gate_c1(arb_l2drpt_waysel_gate_c1),
  .misbuf_hit_st_dep_zero(misbuf_hit_st_dep_zero),
  .tag_hit_unqual_c3(tag_hit_unqual_c3),
  .mbist_run(mbist_run),
  .mbist_lookupen(mbist_lookupen),
  .io_cmp_sync_en(io_cmp_sync_en),
  .arb_iqsel_px2_v1(arb_iqsel_px2_v1),
  .arb_snp_snpsel_px2(arb_snp_snpsel_px2),
  .arb_arbdp_dword_st_c1(arb_arbdp_dword_st_c1),
  .decdp_cas2_from_mb_ctrue_c1(decdp_cas2_from_mb_ctrue_c1));
 
l2t_arbdec_dp	arbdec( 
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
				.tcu_clk_stop(1'b0),
	 		 /*AUTOINST*/ 
                         // Outputs 
			  .l2t_dbg_xbar_vcid	(l2t_dbg_xbar_vcid_transfer[5:0]),
			  .arbdec_arbdp_inst_c8 (arbdp_inst_c8[`L2_POISON:`L2_SZ_LO]),
			  .arbdec_arbdp_inst_bufidhi_c8(arbdec_arbdp_inst_bufidhi_c8),
                          .arbdec_arbdp_inst_way_c1(arbdec_arbdp_inst_way_c1[3:0]), 
                          .arbdec_arbdp_tecc_c1 (arbdec_arbdp_tecc_c1), 
                          .arbdec_arbdp_poison_c1(arbdec_arbdp_poison_c1), 
                          .arbdec_arbdp_inst_mb_entry_c1(arbdec_arbdp_inst_mb_entry_c1[4:0]), 
                          .arbdec_arbdp_inst_fb_c1(arbdec_arbdp_inst_fb_c1), 
                          .arbdec_arbdp_inst_mb_c1(arbdec_arbdp_inst_mb_c1), 
                          .arbdec_arbdp_evict_c1(arbdec_arbdp_evict_c1), 
                          .arbdec_arbdp_inst_rqtyp_c1(arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO]), 
                         // .arbdec_arbdp_inst_rsvd_c1(arbdec_arbdp_inst_rsvd_c1), 
                          .arbdec_arbdp_inst_nc_c1(arbdec_arbdp_inst_nc_c1), 
                          .arbdec_arbdp_inst_size_c1(arbdec_arbdp_inst_size_c1[`L2_SZ_HI:`L2_SZ_LO]), 
                          .arbdec_arbdp_inst_bufidhi_c1(arbdec_arbdp_inst_bufidhi_c1), 
                          .arbdec_arbdp_inst_bufid1_c1(arbdec_arbdp_inst_bufid1_c1), 
                          .arbdec_arbdp_inst_ctrue_c1(arbdec_arbdp_inst_ctrue_c1), 
                          .arbdec_arbdp_inst_fb_c2(arbdec_arbdp_inst_fb_c2), 
                          .arbdec_arbdp_inst_mb_c2(arbdec_arbdp_inst_mb_c2), 
                          .arbdec_arbdp_rdma_entry_c3(arbdec_arbdp_rdma_entry_c3[1:0]), 
                          .arbdec_arbdp_rdma_inst_c1(arbdec_arbdp_rdma_inst_c1), 
                          .arbdec_arbdp_inst_rsvd_c1_1(arbdec_arbdp_inst_rsvd_c1_1), 
                          .arbdec_arbdp_rdma_inst_c2(arbdec_arbdp_rdma_inst_c2), 
                          .arbdec_arbdp_inst_dep_c2(arbdec_arbdp_inst_dep_c2), 
                          .arbdec_arbdp_inst_way_c2(arbdec_arbdp_inst_way_c2[3:0]), 
                          .arbdec_arbdp_inst_rqtyp_c2(arbdec_arbdp_inst_rqtyp_c2[`L2_RQTYP_HI:`L2_RQTYP_LO]), 
                          .arbdec_arbdp_inst_bufidlo_c2(arbdec_arbdp_inst_bufidlo_c2), 
                          .arbdec_arbdp_inst_rqtyp_c6(arbdec_arbdp_inst_rqtyp_c6[`L2_RQTYP_HI:`L2_RQTYP_LO]), 
                          .arbdec_arbdp_inst_way_c3(arbdec_arbdp_inst_way_c3[3:0]), 
                          .arbdec_arbdp_inst_mb_c3(arbdec_arbdp_inst_mb_c3), 
                          .arbdec_arbdp_inst_tecc_c3(arbdec_arbdp_inst_tecc_c3), 
                          .arbdec_arbdp_inst_nc_c3(arbdec_arbdp_inst_nc_c3), 
                          .arbdec_arbdp_l1way_c3(arbdec_arbdp_l1way_c3[1:0]), 
                          .arbdec_arbdp_cpuid_c5(arbdec_arbdp_cpuid_c5[2:0]), 
                          .arbdec_arbdp_cpuid_c2(arbdec_arbdp_cpuid_c2[2:0]),
                          .arbdec_arbdp_int_bcast_c5(arbdec_arbdp_int_bcast_c5), 
                          .arbdec_arbdp_inst_l1way_c7(arbdec_arbdp_inst_l1way_c7[1:0]), 
                          .arbdec_arbdp_inst_size_c7(arbdec_arbdp_inst_size_c7[7:0]), // BS and SR 11/12/03 N2 Xbar Packet format change 
                          .st_ack_bmask(st_ack_bmask[7:0]), // BS and SR 1/30/04 Bmask for store ack including Diagnostic store ack
                          .arbdec_arbdp_inst_tid_c7(arbdec_arbdp_inst_tid_c7[2:0]), // BS and SR 11/12/03 N2 Xbar Packet format change 
                          .arbdec_arbdp_inst_cpuid_c7(arbdec_arbdp_inst_cpuid_c7[2:0]), 
                          .arbdec_arbdp_inst_nc_c7(arbdec_arbdp_inst_nc_c7), 
                         .arbdec_ctag_c6(arbdec_ctag_c6[31:0]),
                          .arbdec_size_field_c8 (arbdec_size_field_c8[1:0]), 
                         // Inputs 
                      .sel_diag_store_data_c7   (sel_diag_store_data_c7), // BS and SR 12/22/03, store ack generation for diagnostic store
                          .snpd_snpq_arbdp_inst_px2(snpd_snpq_arbdp_inst_px2[`JBI_HDR_SZ_LESS1:0]), 
                          .ique_iq_arbdp_inst_px2(ique_iq_arbdp_inst_px2[24:0]), // BS and SR 11/12/03 N2 Xbar Packet format
                         //  BS & SR 11/04/03, MB grows to 32 
                        // .mb_data_read_data_low(mb_data_read_data[`MBD_POISON:`MBD_SZ_LO]),
                        // .mb_data_read_data_mid(mb_data_read_data[`MBD_EVICT:`MBD_TECC]),
                        // .mb_data_read_data_hi(mb_data_read_data[`MBD_ECC_HI_PLUS5:`MBD_ECC_HI_PLUS1]),
			 //.mbdata_snp_ecc(mb_data_read_data[117:111]),
                         .misbuf_arbdp_ctrue_px2(misbuf_arbdp_ctrue_px2), 
                         .misbuf_arb_l2rd_en(misbuf_arb_l2rd_en), 
                         .filbuf_arbdp_entry_px2(filbuf_arbdp_entry_px2[2:0]), 
                         .filbuf_arbdp_tecc_px2(filbuf_arbdp_tecc_px2), 
                          .csr_l2_steering_tid(csr_l2_steering_tid[5:0]), // BS and SR 11/12/03 N2 Xbar Packet format change 
                         .filbuf_arbdp_way_px2(filbuf_arbdp_way_px2[3:0]), 
                          .arb_mux1_mbsel_px2(arb_mux1_mbsel_px2), 
                          .arb_mux2_snpsel_px2(arb_arbdec_mux2_snpsel_px2), 
                          .arb_mux3_bufsel_px2(arb_arbdec_mux3_bufsel_px2), 
                          .arb_mux4_c1sel_px2(arb_arbdec_mux4_c1sel_px2), 
                         .scan_in(arbdec_scanin),
                         .scan_out(arbdec_scanout_1),
                         .l2clk          (l2clk), 
                          .arbadr_arbdp_byte_addr_c6(arbadr_arbdp_byte_addr_c6[2:0]),
  .misbuf_buf_rd_en(misbuf_buf_rd_en),
  .mbdata_cmp_sel(mbdata_cmp_sel[3:2]),
  .l2t_mb2_wdata(l2t_mb2_wdata[7:0]),
  .mbdata_fail(mbdata_fail),
  .mbdata_fail_bot(mbdata_fail_bot),
  .mb_data_read_data(mb_data_read_data[127:64]),
  .snpd_ecc_px2(snpd_ecc_px2[6:0]),
  .arbdec_snpd_ecc_c8(arbdec_snpd_ecc_c8[6:0]),
  .arbdec_pf_ice_inst_c1(arbdec_pf_ice_inst_c1),
  .arbdec_csr_ttype_c6(arbdec_csr_ttype_c6[4:0]),
  .arbdec_csr_vcid_c6(arbdec_csr_vcid_c6[5:0])); // Phase 2 : SIU inteface and packet format change 2/7/04


l2t_wbufrpt_dp wbufrpt (
		.scan_in(arbdec_scanout_1),
		.scan_out(arbdec_scanout),
        	.tcu_clk_stop(1'b0),
		.wbuf_wb_read_en(wb_read_en),
		.wbuf_rdmat_read_en(rdmat_read_en),
  .l2clk(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .l2t_l2b_wbrd_en_r0(l2t_l2b_wbrd_en_r0),
  .l2t_l2b_rdma_rden_r0(l2t_l2b_rdma_rden_r0),
  .wbuf_wbufrpt_leave_state0(wbuf_wbufrpt_leave_state0),
  .wbuf_wbufrpt_next_state_1(wbuf_wbufrpt_next_state_1),
  .cycle_count_less_than_7_din(cycle_count_less_than_7_din),
  .mcu_l2t_wr_ack_d1(mcu_l2t_wr_ack_d1)
		);
 
l2t_wbuf_ctl	wbuf( 
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),

        .l2t_mb2_rdmatag_rd_en          (l2t_mb2_rdmatag_rd_en),
        .l2t_mb2_wbtag_wr_en            (l2t_mb2_wbtag_wr_en),
        .l2t_mb2_wbtag_rd_en            (l2t_mb2_wbtag_rd_en),
        .l2t_mb2_addr                   (l2t_mb2_addr[2:0]),
                  .wb_cam_match_c2      (wb_cam_match_c2[7:0]), 
		.wb_mbist_cam_hit	(wb_mbist_cam_hit),
			   .wb_mbist_cam_sel(mbist_cam_sel[2]),
                   .wbuf_wbtag_write_wl_c4    (wbtag_write_wl_c4[7:0]), 
                   .wbuf_wbtag_write_en_c4    (wbtag_write_en_c4), 
                   .wbuf_wb_read_wl           (wb_read_wl[7:0]), 
                   .wbuf_wb_read_en           (wb_read_en), 
                   .wbuf_rdmat_read_wl        (rdmat_read_wl[3:0]), 
                   .wbuf_rdmat_read_en        (rdmat_read_en), 
			.wmr_l		(wmr_l), 
                  // Outputs 
		.l2t_dbg_sii_wib_dequeue (l2t_dbg_sii_wib_dequeue),
                  .l2t_l2b_wbwr_wl_c6(l2t_l2b_wbwr_wl_c6[2:0]), 
                  .l2t_l2b_wbwr_wen_c6(l2t_l2b_wbwr_wen_c6[3:0]), 
                  .l2t_l2b_wbrd_wl_r0(l2t_l2b_wbrd_wl_r0[2:0]), 
                 // .l2t_l2b_wbrd_en_r0(l2t_l2b_wbrd_en_r0), 
                  .l2t_l2b_ev_dword_r0(l2t_l2b_ev_dword_r0[2:0]), 
                  .l2t_l2b_evict_en_r0(l2t_l2b_evict_en_r0), 
                  .l2t_mcu_wr_req    (l2t_mcu_wr_req), 
                  .wbuf_hit_unqual_c2  (wbuf_hit_unqual_c2), 
                  .wbuf_misbuf_dep_rdy_en(wbuf_misbuf_dep_rdy_en), 
                  .wbuf_misbuf_dep_mbid (wbuf_misbuf_dep_mbid[4:0]), 
                  .wbuf_arb_full_px1(wbuf_arb_full_px1), 
                  .wbuf_wr_addr_sel    (wbuf_wr_addr_sel), 
                   .wbuf_wb_or_rdma_wr_req_en (wbuf_wb_or_rdma_wr_req_en), 
                  .l2t_l2b_rdma_rdwl_r0(l2t_l2b_rdma_rdwl_r0[1:0]), 
                 // .l2t_l2b_rdma_rden_r0(l2t_l2b_rdma_rden_r0), 
                   .wbuf_reset_rdmat_vld      (wbuf_reset_rdmat_vld[3:0]), 
                   .wbuf_set_rdmat_acked      (wbuf_set_rdmat_acked[3:0]), 
                  .l2t_sii_wib_dequeue(l2t_sii_wib_dequeue), 
                  // Inputs 
		.l2t_siu_delay			(l2t_siu_delay),
                  .scan_in(wbuf_scanin),
                  .scan_out(wbuf_scanout),
                  .l2clk                 (l2clk), 
                   .vlddir_dirty_evict_c3       (vlddir_dirty_evict_c3), 
                   .arbdec_arbdp_inst_fb_c2     (arbdec_arbdp_inst_fb_c2), 
                  .misbuf_wbuf_mbid_c4  (misbuf_wbuf_mbid_c4[4:0]), 
                  .misbuf_hit_c4         (misbuf_hit_c4), 
                  .misbuf_filbuf_mcu_pick(misbuf_filbuf_mcu_pick), 
                   .csr_l2_bypass_mode_on    (csr_wbuf_l2off),       // Templated 
                   .arbadr_c1_addr_eq_wb_c4     (arbadr_c1_addr_eq_wb_c4), 
                  .arb_wbuf_hit_off_c1(arb_wbuf_hit_off_c1), 
                  .arb_wbuf_inst_vld_c2(arb_wbuf_inst_vld_c2), 
                  .mcu_l2t_wr_ack    (mcu_l2t_wr_ack), 
                  .rdmat_pick_vec       (rdmat_pick_vec[3:0]), 
                   .rdmat_or_rdmat_valid       (rdmat_or_rdmat_valid),
  .wbuf_wbufrpt_leave_state0(wbuf_wbufrpt_leave_state0),
  .l2t_mb2_run(l2t_mb2_run),
  .wbuf_wbufrpt_next_state_1(wbuf_wbufrpt_next_state_1),
  .cycle_count_less_than_7_din(cycle_count_less_than_7_din),
  .mcu_l2t_wr_ack_d1(mcu_l2t_wr_ack_d1)); 
 
n2_com_cm_8x40_cust       wbtag   
		( 
		.dout(wb_read_data[39:0]), // BS and SR 8 deep change 3/3/04
                .match(wb_cam_match_c2[7:0]), 
                .match_idx(wb_match_idx_unused[7:0]), 
                .adr_w(wbtag_write_wl_c4[7:0]), 
                .din(wb_write_addr[39:0]), // generated in arbadr 
                .write_en(wbtag_write_en_c4), 
                .adr_r(wb_read_wl[7:0]), 
                .lookup_en(arb_inst_vld_c1_v2), 
                .key(lkup_addr_c1[39:7]), 
		.tcu_se_scancollar_out(tcu_se_scancollar_out), 
                .tcu_array_wr_inhibit(array_wr_inhibit), 
                .scan_in(wbtag_scanin),
                .scan_out(wbtag_scanout),
                .l2clk(l2clk), 
                .pce(1'b1), 
                .read_en(wb_read_en), 
                .tcu_aclk(aclk),
                .tcu_bclk(bclk),
		.tcu_scan_en(tcu_scan_en),
                .tcu_pce_ov(ce_ovrd),
		.tcu_clk_stop(1'b0),
                .tcu_array_bypass (tcu_array_bypass),
                .tcu_se_scancollar_in(tcu_se_scancollar_in));
 
 
l2t_ique_dp	ique( 
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
				.tcu_clk_stop(1'b0),
				.iqu_fail_reg(iqu_fail_reg),
			.tcu_dectest(tcu_dectest),
                 .iq_array_rd_data_c1   (iq_array_rd_data_c1[130:0]), // BS and SR 11/12/03 N2 Xbar Packet format change 
		.ique_arb_pf_ice_px2 (ique_arb_pf_ice_px2),
		  /*AUTOINST*/ 
                 // Outputs 
                  .ique_pcx_l2t_data_103_px2  (ique_pcx_l2t_data_103_px2),
                  .ique_iq_arbdp_data_px2     (ique_iq_arbdp_data_px2[63:0]), 
                  .ique_iq_arbdp_addr_px2     (ique_iq_arbdp_addr_px2[39:0]), 
                  .ique_iq_arbdp_inst_px2     (ique_iq_arbdp_inst_px2[24:0]), // BS and SR 11/12/03 N2 Xbar Packet format
                  .ique_iq_arb_atm_px2     (ique_iq_arb_atm_px2), 
                  .ique_iq_arb_csr_px2     (ique_iq_arb_csr_px2), 
                  .ique_iq_arb_st_px2      (ique_iq_arb_st_px2), 
                  .ique_iq_arb_vbit_px2    (ique_iq_arb_vbit_px2), 
                 // Inputs 
                 .scan_in(ique_scanin),
                 .scan_out(ique_scanout),
                 .l2clk                  (l2clk), 
             .pcx_l2t_data_px2    (pcx_l2t_data_px2[`PCX_WIDTH_LESS1:0]), // BS and SR 11/12/03 N2 Xbar Packet format change 
                  .iqu_pcx_l2t_atm_px2_p   (iqu_pcx_l2t_atm_px2_p), 
                 .iqu_sel_pcx         (iqu_sel_pcx), 
                 .iqu_sel_c1          (iqu_sel_c1), 
                 .iqu_hold_rd_n         (iqu_hold_rd_n), 
                  .iqu_sel_c1reg_over_iqarray(iqu_sel_c1reg_over_iqarray),
  .tcu_muxtest(tcu_muxtest),
  .l2t_mb2_wdata(l2t_mb2_wdata[7:0]),
  .mbdata_cmp_sel(mbdata_cmp_sel[3:0]),
  .iq_array_rd_en(iq_array_rd_en),
  .pcx_l2t_data_px2_fnl(pcx_l2t_data_px2_fnl[129:0])); 
 
l2t_iqu_ctl	iqu( 
                 .tcu_pce_ov(ce_ovrd),
                 .tcu_aclk(aclk),
                 .tcu_bclk(bclk),
		.tcu_scan_en(tcu_scan_en),
		.l2t_mb2_iqarray_wr_en          (l2t_mb2_iqarray_wr_en),
		.l2t_mb2_iqarray_rd_en          (l2t_mb2_iqarray_rd_en),
		.l2t_mb2_run			(l2t_mb2_run),
		.l2t_mb2_addr			(l2t_mb2_addr[3:0]),
                .iqu_iq_array_wr_en       (iq_array_wr_en), 
                .iqu_iq_array_wr_wl       (iq_array_wr_wl[3:0]), 
                .iqu_iq_array_rd_en       (iq_array_rd_en), 
                .iqu_iq_array_rd_wl       (iq_array_rd_wl[3:0]), 
		.wmr_l		(wmr_l), 
                // Outputs 
                .l2t_pcx_stall_pq   (l2t_pcx_stall_pq), 
                .iqu_iq_arb_vld_px2    (iqu_iq_arb_vld_px2), 
                .iqu_pcx_l2t_atm_px2_p  (iqu_pcx_l2t_atm_px2_p), 
                .iqu_sel_pcx        (iqu_sel_pcx), 
                .iqu_sel_c1         (iqu_sel_c1), 
                .iqu_hold_rd_n        (iqu_hold_rd_n), 
                .iqu_sel_c1reg_over_iqarray(iqu_sel_c1reg_over_iqarray), 
                // Inputs 
                .scan_in(iqu_scanin),
                .scan_out(iqu_scanout),
                .l2clk                 (l2clk), 
                .pcx_l2t_data_rdy_px1(pcx_l2t_data_rdy_px1), 
                .pcx_l2t_atm_px1    (pcx_l2t_atm_px1), 
                .arb_iqsel_px2     (arb_iqsel_px2),
  .arb_iqsel_px2_v1(arb_iqsel_px2_v1),
  .iqu_iq_arb_vld_px2_v1(iqu_iq_arb_vld_px2_v1)); 
 
 
 
// x0in fifo -enq iq_array_wr_wl -deq iq_array_rd_wl -depth 16
 
n2_l2t_dp_16x160_cust    iqarray( 
                           // Outputs 
        .dout        (iq_array_rd_data_c1[159:0]), 
                     // Inputs 
	.din ({29'b0,iqu_pcx_l2t_atm_px2_p,pcx_l2t_data_px2_fnl[`PCX_WIDTH_LESS1:104],
		     ique_pcx_l2t_data_103_px2, pcx_l2t_data_px2_fnl[102:0]}), 
          // BS and SR 11/12/03 N2 Xbar Packet format change 
//        .din ({29'b0,iqu_pcx_l2t_atm_px2_p,pcx_l2t_data_px2[`PCX_WIDTH_LESS1:0]}),
        .tcu_pce_ov(ce_ovrd),
        .pce(1'b1),
        .tcu_aclk(aclk),
        .tcu_bclk(bclk),
  	.tcu_scan_en(tcu_scan_en),
        .rd_adr      (iq_array_rd_wl[3:0]), 
        .wr_adr      (iq_array_wr_wl[3:0]), 
        .read_en     (iq_array_rd_en), 
        .wr_en       (iq_array_wr_en), 
        .word_wen    (4'b1111), 
        .byte_wen    (20'b11111111111111111111), 
        .scan_in(iqarray_scanin),
        .scan_out(iqarray_scanout),
        .l2clk      (l2clk), 
        .tcu_array_wr_inhibit(array_wr_inhibit), 
        .mbist_wdata		(l2t_mb2_wdata[7:0]),
	.mbist_run		(l2t_mb2_run),
        .tcu_se_scancollar_in      (tcu_se_scancollar_in)); 
 
 
 
 
l2t_oqu_ctl		oqu( 
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
                     .oqu_oqarray_wr_en      (oqarray_wr_en), 
                     .oqu_oqarray_rd_en      (oqarray_rd_en), 
                     .oqu_oqarray_wr_ptr     (oqarray_wr_ptr[3:0]), 
                     .oqu_oqarray_rd_ptr     (oqarray_rd_ptr[3:0]), 
                    .lkup_bank_ena_dcd_c4(dirrep_dc_lkup_row_dec_c4[3:0]), 
                    .lkup_bank_ena_icd_c4(dirrep_ic_lkup_row_dec_c4[3:0]), 
			.wmr_l		(wmr_l), 
		    /*AUTOINST*/ 
                    // Outputs 
		    .sel_st_ack_c7    (sel_st_ack_c7), // BS and SR 11/12/03 N2 Xbar Packet format change
		    .oqu_mmu_ld_hit_c7(oqu_mmu_ld_hit_c7), // BS and SR 11/12/03 N2 Xbar Packet format change
                    .l2t_cpx_req_cq   (l2t_cpx_req_cq[7:0]), 
                    .l2t_cpx_atom_cq  (l2t_cpx_atom_cq), 
                    .oqu_diag_acc_c8  (oqu_diag_acc_c8), 
                    .oqu_rqtyp_rtn_c7 (oqu_rqtyp_rtn_c7[3:0]), 
                    .oqu_cerr_ack_c7  (oqu_cerr_ack_c7), 
                    .oqu_uerr_ack_c7  (oqu_uerr_ack_c7), 
                     .oqu_str_ld_hit_c7      (oqu_str_ld_hit_c7), 
                     .oqu_fwd_req_ret_c7     (oqu_fwd_req_ret_c7), 
                     .oqu_atm_inst_ack_c7    (oqu_atm_inst_ack_c7), 
                     .oqu_strst_ack_c7       (oqu_strst_ack_c7), 
                    .oqu_int_ack_c7   (oqu_int_ack_c7), 
                    .oqu_imiss_hit_c8 (oqu_imiss_hit_c8), 
                    .oqu_pf_ack_c7    (oqu_pf_ack_c7), 
                    .oqu_rmo_st_c7    (oqu_rmo_st_c7), 
                    .oqu_l2_miss_c7   (oqu_l2_miss_c7), 
                     .oqu_mux1_sel_data_c7   (oqu_mux1_sel_data_c7[3:0]), 
                     .oqu_mux_csr_sel_c7     (oqu_mux_csr_sel_c7), 
                     .oqu_sel_inval_c7       (oqu_sel_inval_c7), 
                     .oqu_out_mux1_sel_c7    (oqu_out_mux1_sel_c7[2:0]), 
                     .oqu_out_mux2_sel_c7    (oqu_out_mux2_sel_c7[2:0]), 
                     .oqu_sel_array_out_l    (oqu_sel_array_out_l), 
                     .oqu_sel_mux1_c6        (oqu_sel_mux1_c6[3:0]), 
                     .oqu_sel_mux2_c6        (oqu_sel_mux2_c6[3:0]), 
                     .oqu_sel_mux3_c6        (oqu_sel_mux3_c6), 
                     .oqu_mux_vec_sel_c6     (oqu_mux_vec_sel_c6[3:0]), 
                    .oqu_arb_full_px2(oqu_arb_full_px2), 
                    .oqu_st_complete_c7(oqu_st_complete_c7), 
		    .misbuf_vuad_ce_err_c6(misbuf_vuad_ce_err_c6), // vuad ecc change
                    // Inputs 
		     .arb_cpuid_c5          (arb_cpuid_c5[2:0]),
                     .arbdec_arbdp_cpuid_c5     (arbdec_arbdp_cpuid_c5[2:0]), 
                     .arbdec_arbdp_int_bcast_c5 (arbdec_arbdp_int_bcast_c5), 
                     .arb_oqu_swap_cas2_req_c2 (arb_oqu_swap_cas2_req_c2),
                     .arb_decdp_strld_inst_c6(arb_decdp_strld_inst_c6), 
                     .arb_decdp_atm_inst_c6  (arb_decdp_atm_inst_c6), 
                     .arb_decdp_pf_inst_c5   (arb_decdp_pf_inst_c5), 
                    .arb_evict_c5    (arb_evict_c5), 
                     .dirvec_dirdp_req_vec_c6   (dirvec_dirdp_req_vec_c6[7:0]), 
        	    .l2t_mb0_addr                   (l2t_mb0_addr[3:0]),
                    .tag_imiss_hit_c5(tag_imiss_hit_c5), 
                    .tag_ld_hit_c5   (tag_ld_hit_c5), 
                    .tag_nonmem_comp_c6(tag_nonmem_comp_c6), 
                    .tag_st_ack_c5   (tag_st_ack_c5), 
                    .tag_strst_ack_c5(tag_strst_ack_c5), 
                    .tag_uerr_ack_c5 (tag_uerr_ack_c5), 
                    .tag_cerr_ack_c5 (tag_cerr_ack_c5), 
                    .tag_int_ack_c5  (tag_int_ack_c5), 
                    .tag_st_req_c5   (tag_st_req_c5), 
                    .tag_inval_req_c5(tag_inval_req_c5), // BS and SR 11/12/03 N2 Xbar Packet format change
                    .arb_decdp_mmuld_inst_c6(arb_decdp_mmuld_inst_c6), // BS and SR 11/12/03 N2 Xbar Packet format change
                    .tag_fwd_req_ret_c5(tag_fwd_req_ret_c5), 
                     .tag_sel_rdma_inval_vec_c5(tag_sel_rdma_inval_vec_c5), 
                    .tag_rdma_wr_comp_c4(tag_rdma_wr_comp_c4), 
                    .tag_store_inst_c5(tag_store_inst_c5), 
                    .tag_fwd_req_ld_c6(tag_fwd_req_ld_c6), 
                    .tag_rmo_st_ack_c5(tag_rmo_st_ack_c5), 
                    .tag_inst_mb_c5  (tag_inst_mb_c5), 
                    .tag_hit_c5      (tag_hit_c5), 
                    .arb_inst_l2data_vld_c6(arb_inst_l2data_vld_c6), 
                    .arb_inst_l2tag_vld_c6(arb_inst_l2tag_vld_c6), 
                    .arb_inst_l2vuad_vld_c6(arb_inst_l2vuad_vld_c6), 
                    .arb_csr_rd_en_c7(arb_csr_rd_en_c7), 
                    .cpx_l2t_grant_cx (cpx_l2t_grant_cx[7:0]), 
                    .scan_in(oqu_scanin),
                    .scan_out(oqu_scanout),
                    .l2clk               (l2clk),
  .l2t_mb0_run(l2t_mb0_run),
  .l2t_mb0_oqarray_rd_en(l2t_mb0_oqarray_rd_en),
  .l2t_mb0_oqarray_wr_en(l2t_mb0_oqarray_wr_en)); 
 
 



n2_l2t_dp_16x160_cust    oqarray( 
                           // Outputs 
                           .dout        (oq_array_data_out[159:0]), 
                           // Inputs 
                           .din         ({14'b0,oq_array_data_in[`CPX_WIDTH_LESS1:0]}), // BS and SR 11/12/03 N2 Xbar Packet format change 
                                .tcu_pce_ov(ce_ovrd),
        		.pce(1'b1),
                       .tcu_aclk(aclk),
                       .tcu_bclk(bclk),
		.tcu_scan_en(tcu_scan_en),
                .rd_adr      (oqarray_rd_ptr[3:0]), 
                .tcu_array_wr_inhibit(array_wr_inhibit), 
                .wr_adr      (oqarray_wr_ptr[3:0]), 
                .read_en     (oqarray_rd_en), 
                .wr_en       (oqarray_wr_en), 
                .word_wen    (4'b1111), 
                .byte_wen    (20'b11111111111111111111), 
                .scan_in(oqarray_scanin),
                .scan_out(oqarray_scanout),
                .l2clk      (l2clk),
        .mbist_wdata            (mb0_l2t_mbist_write_data[7:0]),
        .mbist_run           (l2t_mb0_run),
                           .tcu_se_scancollar_in      (tcu_se_scancollar_in)); 
 
 
l2t_oque_dp		oque( 
                 .tcu_pce_ov(ce_ovrd),
                 .tcu_aclk(aclk),
                 .tcu_bclk(bclk),
		.tcu_scan_en(tcu_scan_en),
		.tcu_clk_stop(1'b0),
                .tcu_muxtest(tcu_muxtest),
			.tcu_dectest(tcu_dectest),
                .oq_array_data_out   (oq_array_data_out[159:0]), 
                .oque_oq_array_data_in    (oq_array_data_in[`CPX_WIDTH_LESS1:0]), 
                .vuadpm_vuad_diag_data_c7(tagdp_vuad_dp_diag_data_c7_buf[38:0]), 
                .oqarray_rw_fail         (oqarray_rw_fail), 
                // Outputs 
                .l2t_cpx_data_ca   (l2t_cpx_data_ca[`CPX_WIDTH_LESS1:0]), 
                .oque_tid_c8         (oque_tid_c8[5:0]), 
		.mbist_oqarray_sel	(mbist_oqarray_sel[3:0]),
                // Inputs 
                .arbdec_arbdp_inst_l1way_c7 (arbdec_arbdp_inst_l1way_c7[1:0]), 
                .arbdec_arbdp_inst_tid_c7   (arbdec_arbdp_inst_tid_c7[2:0]), // BS and SR 11/12/03 N2 Xbar Packet format change 
                .arbdec_arbdp_l1way_c3   (arbdec_arbdp_l1way_c3[1:0]), // BS and SR 11/12/03 N2 Xbar Packet format change 
		.oqu_mmu_ld_hit_c7       (oqu_mmu_ld_hit_c7), // BS and SR 11/12/03 N2 Xbar Packet format change
                .arbdec_arbdp_inst_nc_c7    (arbdec_arbdp_inst_nc_c7), 
                .arbdec_arbdp_inst_cpuid_c7 (arbdec_arbdp_inst_cpuid_c7[2:0]), 
                .oqu_rqtyp_rtn_c7  (oqu_rqtyp_rtn_c7[3:0]), 
                .dirvec_dirdp_way_info_c7   (dirvec_dirdp_way_info_c7[3:0]), // BS and SR 11/18/03 Support for 8 way I$
                .oqu_strst_ack_c7        (oqu_strst_ack_c7), 
                .arbdat_arbdp_oque_int_ret_c7(arbdat_arbdp_oque_int_ret_c7[17:0]), 
		.csr_report_ldrc	(csr_report_ldrc),
                .oqu_fwd_req_ret_c7      (oqu_fwd_req_ret_c7), 
                .oqu_int_ack_c7    (oqu_int_ack_c7), 
                .arbadr_arbdp_oque_l1_index_c7(arbadr_arbdp_oque_l1_index_c7[11:6]), 
                .oqu_imiss_hit_c8  (oqu_imiss_hit_c8), 
		.mb0_l2t_mbist_write_data(mb0_l2t_mbist_write_data[7:0]),
                .decc_ret_data_c7       (decc_ret_data_c7[127:0]), 
// TIMING                .deccck_ret_err_c7        (deccck_ret_err_c7[2:0]), 
                .dirvec_dirdp_inval_pckt_c7 (dirvec_dirdp_inval_pckt_c7[111:0]), 
                .decc_ret_diag_data_c7  (decc_ret_diag_data_c7[38:0]), 
                .tagd_diag_data_c7  (tagd_diag_data_c7[27:0]), 
                .oqu_pf_ack_c7     (oqu_pf_ack_c7), 
                .oqu_rmo_st_c7     (oqu_rmo_st_c7), 
                .oqu_atm_inst_ack_c7     (oqu_atm_inst_ack_c7), 
                .oqu_diag_acc_c8   (oqu_diag_acc_c8), 
// TIMING                .oqu_cerr_ack_c7   (oqu_cerr_ack_c7), 
// TIMING                .oqu_uerr_ack_c7   (oqu_uerr_ack_c7), 
                .oqu_mux1_sel_data_c7    (oqu_mux1_sel_data_c7[3:0]), 
                .oqu_sel_array_out_l     (oqu_sel_array_out_l), 
                .oqu_mux_csr_sel_c7      (oqu_mux_csr_sel_c7), 
                .oqu_sel_inval_c7        (oqu_sel_inval_c7), 
                .oqu_out_mux1_sel_c7     (oqu_out_mux1_sel_c7[2:0]), 
                .oqu_out_mux2_sel_c7     (oqu_out_mux2_sel_c7[2:0]), 
                .arbadr_arbdp_line_addr_c7  (arbadr_arbdp_line_addr_c7[5:4]), 
                .arb_dc_inval_vld_c7     (dc_inval_vld_c7), 
                .arb_ic_inval_vld_c7     (ic_inval_vld_c7), 
                .csr_rd_data_c8      (csr_rd_data_c8[63:0]), 
// TIMING                .oqu_l2_miss_c7    (oqu_l2_miss_c7), 
                .scan_in(oque_scanin),
                .scan_out(oque_scanout),
                .l2clk                (l2clk),
  .rtn_err_field_c7(rtn_err_field_c7[2:0]),
  .st_ack_data(st_ack_data[63:0]),
  .sel_st_ack_c7(sel_st_ack_c7),
  .oqarray_rd_en(oqarray_rd_en)); 
 
 
l2t_dirvec_ctl		dirvec( 
        .tcu_pce_ov(ce_ovrd),
        .tcu_aclk(aclk),
        .tcu_bclk(bclk),
	.tcu_scan_en(tcu_scan_en),
	.tcu_clk_stop(1'b0),
        // Outputs 
        .dirvec_dirdp_req_vec_c6(dirvec_dirdp_req_vec_c6[7:0]), 
        .dirvec_dirdp_way_info_c7(dirvec_dirdp_way_info_c7[3:0]), // BS and SR 11/18/03 Support for 8 way I$
        .dirvec_dirdp_inval_pckt_c7(dirvec_dirdp_inval_pckt_c7[111:0]), 
        // Inputs 
			.arbadr_2bnk_true_enbld_dist		(arbadr_dirvec_2bnk_true_enbld_dist),
			.arbadr_4bnk_true_enbld_dist              (arbadr_dirvec_4bnk_true_enbld_dist),
			.arbadr_ncu_l2t_pm_n_dist                 (arbadr_dirvec_ncu_l2t_pm_n_dist),
	    .sel_st_ack_c7(sel_st_ack_c7), // BS and SR 11/12/03 N2 Xbar Packet format change
            .arbadr_arbdp_line_addr_c7(arbadr_arbdp_line_addr_c7[5:4]), // BS and SR 1/29/04 
	    .st_ack_bmask(st_ack_bmask[7:0]), // BS and SR 11/12/03 N2 Xbar Packet format change
                                              // Bmask for store ack including Diagnostic store ack
	    .arbadr_dirvec_addr3_c7(arbadr_dirvec_addr3_c7), // BS and SR 11/12/03 N2 Xbar Packet format change
            .ic_cam_hit (ic_cam_hit[127:0]), 
            .dc_cam_hit (dc_cam_hit[127:0]), 
            .oqu_sel_mux1_c6(oqu_sel_mux1_c6[3:0]), 
            .oqu_sel_mux2_c6(oqu_sel_mux2_c6[3:0]), 
            .oqu_sel_mux3_c6(oqu_sel_mux3_c6), 
            .oqu_mux_vec_sel_c6(oqu_mux_vec_sel_c6[3:0]), 
	    .ic_cam_fail(ic_cam_fail[1:0]),
	    .dc_cam_fail(dc_cam_fail[1:0]),
	    .mb0_l2t_cambist(mb0_l2t_cambist),
            .scan_in(dirvec_scanin),
            .scan_out(dirvec_scanout),
            .l2clk       (l2clk),
  .io_cmp_sync_en(io_cmp_sync_en),
  .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status),
  .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status),
  .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status),
  .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status),
  .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status),
  .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status),
  .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status),
  .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status)); 
 
l2t_deccck_ctl	deccck(
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
                         // Outputs 
			 .deccck_muxsel_diag_out_c7(deccck_muxsel_diag_out_c7[3:0]),
                         .deccck_bscd_corr_err_c8(deccck_bscd_corr_err_c8), 
                         .deccck_bscd_uncorr_err_c8(deccck_bscd_uncorr_err_c8), 
			 .deccck_bscd_notdata_err_c8(deccck_bscd_notdata_err_c8),
                         .deccck_spcd_corr_err_c8(deccck_spcd_corr_err_c8), 
                         .deccck_spcd_uncorr_err_c8(deccck_spcd_uncorr_err_c8), 
			 .deccck_spcd_notdata_err_c8(deccck_spcd_notdata_err_c8),
                         .deccck_scrd_corr_err_c8(deccck_scrd_corr_err_c8), 
                         .deccck_scrd_uncorr_err_c8(deccck_scrd_uncorr_err_c8), 
                         .deccck_spcfb_corr_err_c8(deccck_spcfb_corr_err_c8), 
                         .deccck_spcfb_uncorr_err_c8(deccck_spcfb_uncorr_err_c8), 
                         .deccck_uncorr_err_c8(deccck_uncorr_err_c8), 
                         .deccck_corr_err_c8 (deccck_corr_err_c8),
			 .deccck_notdata_err_c8(deccck_notdata_err_c8),
                          .deccck_dword_sel_c7  (deccck_dword_sel_c7), 
                         // Inputs 
                         .tag_deccck_addr3_c7(tag_deccck_addr3_c7), 
                         .arb_inst_l2data_vld_c6(arb_inst_l2data_vld_c6), 
                          .tag_data_ecc_active_c3(tag_data_ecc_active_c3), 
                         .bist_data_enable_c1(mbist_l2d_en),     // Templated 
                         .bist_data_waddr_c1(mbist_l2d_word_sel[1:0]), // Templated 
                          .arbadr_arbdp_addr22_c7(arbadr_arbdp_addr22_c7), 
                          .arbadr_arbdp_waddr_c6(arbadr_arbdp_waddr_c6[1:0]), 
                         .tag_bsc_rd_vld_c7(tag_bsc_rd_vld_c7), 
                         .tag_scrub_rd_vld_c7(tag_scrub_rd_vld_c7), 
                         .scan_in(deccck_scanin),
                         .scan_out(deccck_scanout),
                         .l2clk          (l2clk),
  .deccdp_decck_uncorr_err_c7(deccdp_decck_uncorr_err_c7[3:0]),
  .deccdp_decck_corr_err_c7(deccdp_decck_corr_err_c7[3:0]),
  .tag_spc_rd_vld_c6(tag_spc_rd_vld_c6),
  .filbuf_spc_corr_err_c6(filbuf_spc_corr_err_c6),
  .filbuf_spc_uncorr_err_c6(filbuf_spc_uncorr_err_c6),
  .filbuf_spc_rd_vld_c6(filbuf_spc_rd_vld_c6),
  .arbadr_arbdp_line_addr_c7(arbadr_arbdp_line_addr_c7[5:4]),
  .arbadr_arbdp_line_addr_c6(arbadr_arbdp_line_addr_c6[5:4]) 
	);
 
 
l2t_decc_dp		decc
		( 
                .tcu_pce_ov(ce_ovrd),
                .tcu_aclk(aclk),
                .tcu_bclk(bclk),
		.tcu_scan_en(tcu_scan_en),
		.tcu_clk_stop(1'b0),
		.tcu_dectest(tcu_dectest),
                // Outputs 
                .decc_ret_data_c7   (decc_ret_data_c7[127:0]), 
                .decc_arbdp_data_c8(decc_arbdp_data_c8[63:0]), 
                .decc_lda_syndrome_c9 (decc_lda_syndrome_c9[27:0]), 
		.deccck_uncorr_err_c8 (deccck_uncorr_err_c8),
		.deccck_corr_err_c8 (deccck_corr_err_c8),
		.deccck_notdata_err_c8 (deccck_notdata_err_c8),
                .csr_error_ceen    (csr_error_ceen), 
                .csr_error_nceen   (csr_error_nceen), 
                .tag_spc_rd_vld_c6(tag_spc_rd_vld_c6), 
                // Inputs 
                .filbuf_spc_rd_vld_c6  (filbuf_spc_rd_vld_c6), 
                .filbuf_spc_uncorr_err_c6(filbuf_spc_uncorr_err_c6), 
                .filbuf_spc_corr_err_c6(filbuf_spc_corr_err_c6), 
		.tcu_l2t_tag_or_data_sel(tcu_l2t_tag_or_data_sel),
		.decc_ret_diag_data_c7  (decc_ret_diag_data_c7[38:0]),
		.tagd_evict_tag_c3      (tagd_dmo_evict_tag_c4[27:0]),
		.deccck_muxsel_diag_out_c7(deccck_muxsel_diag_out_c7[3:0]),
		.mbist_write_data (mbist_write_data_decck[7:0]),
                .deccck_dword_sel_c7    (deccck_dword_sel_c7), 
                //.retbuf_ret_data_c7   (retbuf_ret_data_c7[127:0]), 
                //.retbuf_ret_ecc_c7    (retbuf_ret_ecc_c7[27:0]), 
  		.l2d_l2t_decc_c6	(l2d_l2t_decc_c6[155:0]),
                .scan_in(decc_scanin),
                .scan_out(decc_scanout),
                .l2clk            (l2clk),
  .oqu_l2_miss_c7(oqu_l2_miss_c7),
  .oqu_uerr_ack_c7(oqu_uerr_ack_c7),
  .oqu_cerr_ack_c7(oqu_cerr_ack_c7),
  .oqu_imiss_hit_c8(oqu_imiss_hit_c8),
  .rtn_err_field_c7(rtn_err_field_c7[2:0]),
  .mbist_dmo_data_out(mbist_dmo_data_out[38:0]),
  .deccdp_decck_uncorr_err_c7(deccdp_decck_uncorr_err_c7[3:0]),
  .deccdp_decck_corr_err_c7(deccdp_decck_corr_err_c7[3:0]),
  .tcu_muxtest(tcu_muxtest),
  .mbist_l2data_fail(mbist_l2data_fail),
  .mbist_l2d_write(mbist_l2d_write)
		); 
 

// 
// l2t_shdwscn_dp block should not be hooked up to the main scan chain
//
l2t_shdwscn_dp	shadow_scan	
	(
	.tcu_l2t_shscan_scan_in		(tcu_l2t_shscan_scan_in	),
	.tcu_l2t_shscan_aclk		(tcu_l2t_shscan_aclk	),
	.tcu_l2t_shscan_bclk   		(tcu_l2t_shscan_bclk   	),
	.tcu_l2t_shscan_scan_en 	(tcu_l2t_shscan_scan_en ),
	.tcu_l2t_shscan_pce_ov		(tcu_l2t_shscan_pce_ov	),
	.tcu_l2t_shscan_clk_stop_d2 	(tcu_l2t_shscan_clk_stop_d2),
	.l2t_tcu_shscan_scan_out	(l2t_tcu_shscan_scan_out),
	.rd_errstate_reg		(shadow_error_status_reg[63:0] ),
	.rd_notdata_reg			(shadow_notdata_reg[`ERR_MEND:`ERR_NDADR_LO]),
	.csr_l2_erraddr_reg		(shadow_l2erraddr_reg[39:4]),
	.l2clk				(l2clk)
	);
 
/////////////////////////////////////////////////////////////////////////
l2t_csr_ctl	csr ( 
               .tcu_pce_ov(ce_ovrd),
               .tcu_aclk(aclk),
               .tcu_bclk(bclk),
		.tcu_scan_en(tcu_scan_en),
		.aclk_wmr(aclk_wmr),
		.wmr_protect(wmr_protect),
               // Outputs 
		.arbadr_csr_debug_addr	(arbadr_csr_debug_addr[33:2]),
		.l2t_dbg_err_event (l2t_dbg_err_event),
		.csr_report_ldrc (csr_report_ldrc),
		.l2t_dbg_pa_match  (l2t_dbg_pa_match),
		.csreg_l2_cmpr_reg_wr_en_c8	(csreg_l2_cmpr_reg_wr_en_c8),
		.csreg_l2_mask_reg_wr_en_c8	(csreg_l2_mask_reg_wr_en_c8),
               .csr_filbuf_scrub_ready   (csr_filbuf_scrub_ready), 
                .csr_l2_bypass_mode_on       (csr_l2_bypass_mode_on), 
               .csr_filbuf_l2off         (csr_filbuf_l2off), 
               .csr_tag_l2off        (csr_tag_l2off), 
               .csr_wbuf_l2off         (csr_wbuf_l2off), 
               .csr_misbuf_l2off         (csr_misbuf_l2off), 
               .csr_vuad_l2off          (csr_vuad_l2off), 
                .csr_l2_dir_map_on           (csr_l2_dir_map_on), 
               // .csr_l2_dbg_en               (csr_l2_dbg_en), 
                .csr_l2_steering_tid         (csr_l2_steering_tid[5:0]), // BS and SR 11/12/03 N2 Xbar Packet format change 
                .csr_error_nceen             (csr_error_nceen), 
                .csr_error_ceen              (csr_error_ceen), 
               .csr_wr_dirpinj_en       (csr_wr_dirpinj_en), 
                .csr_oneshot_dir_clear_c3    (csr_oneshot_dir_clear_c3), 
               .csr_rd_data_c8          (csr_rd_data_c8[63:0]), 
                .csr_error_status_veu        (csr_error_status_veu), 
                .csr_error_status_vec        (csr_error_status_vec), 
//               .l2t_clk_tr            (1'b0), 
		.shadow_error_status_reg(shadow_error_status_reg[63:0] ),
		.shadow_notdata_reg	(shadow_notdata_reg[`ERR_MEND:`ERR_NDADR_LO]),
		.shadow_l2erraddr_reg	(shadow_l2erraddr_reg[39:4]),
               // Inputs 
                .csreg_csr_bist_wr_en_c8(csreg_csr_bist_wr_en_c8), 
		.csr_error_status_notdata(csr_error_status_notdata),
		.csreg_notdata_error_rw_en(csreg_notdata_error_rw_en),
                .csreg_csr_notdata_wr_en_c8(csreg_csr_notdata_wr_en_c8),
                .csreg_wr_enable_notdata_vcid_c9(csreg_wr_enable_notdata_vcid_c9),
                .csreg_csr_notdata_vcid_wr_en(csreg_csr_notdata_vcid_wr_en),
                .csreg_notdata_err_state_in_rw(csreg_notdata_err_state_in_rw),
                .csreg_notdata_err_state_in_mend(csreg_notdata_err_state_in_mend),
                .csreg_notdata_err_state_in(csreg_notdata_err_state_in[`ERR_NDSP:`ERR_NDDM]),
                .csreg_notdata_diag_wr_en(csreg_notdata_diag_wr_en),
                .csreg_csr_notdata_addr_wr_en(csreg_csr_notdata_addr_wr_en),
                .csreg_notdata_addr_mux_sel(csreg_notdata_addr_mux_sel[2:0]),
                .arbdat_csr_inst_wr_data_c8(arbdat_csr_inst_wr_data_c8[63:0]), 
               .arb_inst_vld_c2               (arb_inst_vld_c2), 
               .scan_in(csr_scanin),
               .scan_out(csr_scanout),
               .l2clk                    (l2clk), 
		.csreg_csr_rd_mux4_sel_c7	(csreg_csr_rd_mux4_sel_c7[1:0]),
		.csreg_csr_rd_mux_fnl_c7	(csreg_csr_rd_mux_fnl_c7[1:0]),
                .csreg_csr_erren_wr_en_c8      (csreg_csr_erren_wr_en_c8), 
                .csreg_csr_wr_en_c8        (csreg_csr_wr_en_c8), 
                .csreg_csr_errstate_wr_en_c8   (csreg_csr_errstate_wr_en_c8), 
                .csreg_csr_errinj_wr_en_c8     (csreg_csr_errinj_wr_en_c8), 
                .csreg_csr_rd_mux1_sel_c7      (csreg_csr_rd_mux1_sel_c7[3:0]), 
                .csreg_csr_rd_mux2_sel_c7      (csreg_csr_rd_mux2_sel_c7), 
                .csreg_csr_rd_mux3_sel_c7      (csreg_csr_rd_mux3_sel_c7[1:0]), 
                .arbadr_arbdp_csr_addr_c9       (arbdp_csr_addr_c9[39:4]), 
                .evctag_evict_addr              (evctag_evict_addr[39:6]), 
                .arbadr_rdmard_addr_c12         (arbadr_rdmard_addr_c12[39:6]), 
                .arb_dir_addr_c9             (arb_dir_addr_c9[10:0]), 
                .tag_scrub_addr_way          (tag_scrub_addr_way[3:0]), 
                .arbadr_data_ecc_idx            (arbadr_data_ecc_idx[8:0]), 
                .csreg_err_state_in_rw         (csreg_err_state_in_rw), 
                .csreg_err_state_in_mec        (csreg_err_state_in_mec), 
                .csreg_err_state_in_meu        (csreg_err_state_in_meu), 
                .csreg_err_state_in            (csreg_err_state_in[`ERR_LDAC:`ERR_LVC]), 
                .csreg_mux1_synd_sel           (csreg_mux1_synd_sel[1:0]), 
                .csreg_mux2_synd_sel           (csreg_mux2_synd_sel[1:0]), 
                .csreg_csr_synd_wr_en          (csreg_csr_synd_wr_en), 
   		.usaloc_ua_synd_c9		(usaloc_ua_synd_c9[6:0]),
   		.vlddir_vd_synd_c9		(vlddir_vd_synd_c9[6:0]),
                .decc_lda_syndrome_c9         (decc_lda_syndrome_c9[27:0]), 
                .csreg_wr_enable_tid_c9        (csreg_wr_enable_tid_c9), 
                .csreg_csr_tid_wr_en           (csreg_csr_tid_wr_en), 
                .csreg_csr_async_wr_en         (csreg_csr_async_wr_en), 
                .csreg_mux1_addr_sel           (csreg_mux1_addr_sel[3:0]), 
                .csreg_mux2_addr_sel           (csreg_mux2_addr_sel[2:0]), 
                .csreg_csr_addr_wr_en          (csreg_csr_addr_wr_en), 
               .arb_dir_wr_en_c4     (arb_dir_wr_en_c4), 
               .oque_tid_c8             (oque_tid_c8[5:0]),
  .csreg_report_ldrc_inpkt(csreg_report_ldrc_inpkt),
  .notdata_higher_priority_err(notdata_higher_priority_err),
  .arbdec_csr_ttype_c6(arbdec_csr_ttype_c6[4:0]),
  .arbdec_csr_vcid_c6(arbdec_csr_vcid_c6[5:0]),
  .csreg_wr_enable_notdata_nddm_vcid_c9(csreg_wr_enable_notdata_nddm_vcid_c9),
  .set_async_c9(set_async_c9),
  .error_rw_en(error_rw_en),
  .diag_wr_en(diag_wr_en)); 
 
l2t_csreg_ctl	csreg ( 
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
                       // Outputs 
			.csreg_notdata_error_rw_en(csreg_notdata_error_rw_en),
			.csreg_csr_notdata_wr_en_c8(csreg_csr_notdata_wr_en_c8),
			.csreg_wr_enable_notdata_vcid_c9(csreg_wr_enable_notdata_vcid_c9),
			.csreg_csr_notdata_vcid_wr_en(csreg_csr_notdata_vcid_wr_en),
			.csreg_notdata_err_state_in_rw(csreg_notdata_err_state_in_rw),
			.csreg_notdata_err_state_in_mend(csreg_notdata_err_state_in_mend),
			.csreg_notdata_err_state_in(csreg_notdata_err_state_in[`ERR_NDSP:`ERR_NDDM]),
			.csreg_notdata_diag_wr_en(csreg_notdata_diag_wr_en),
			.csreg_csr_notdata_addr_wr_en(csreg_csr_notdata_addr_wr_en),
			.csreg_notdata_addr_mux_sel(csreg_notdata_addr_mux_sel[2:0]),
			.csreg_csr_rd_mux4_sel_c7	(csreg_csr_rd_mux4_sel_c7[1:0]),
			.csreg_csr_rd_mux_fnl_c7	(csreg_csr_rd_mux_fnl_c7[1:0]),
                        .csreg_tagdp_l2_dir_map_on(csreg_tagdp_l2_dir_map_on),
                        .csreg_misbuf_l2_dir_map_on(csreg_misbuf_l2_dir_map_on),
                        .csreg_filbuf_l2_dir_map_on(csreg_filbuf_l2_dir_map_on),
                        .csreg_csr_wr_en_c8(csreg_csr_wr_en_c8), 
                        .csreg_csr_erren_wr_en_c8(csreg_csr_erren_wr_en_c8), 
                        .csreg_csr_errstate_wr_en_c8(csreg_csr_errstate_wr_en_c8), 
                        .csreg_csr_errinj_wr_en_c8(csreg_csr_errinj_wr_en_c8), 
                        .csreg_err_state_in_rw (csreg_err_state_in_rw), 
                        .csreg_err_state_in_mec(csreg_err_state_in_mec), 
                        .csreg_err_state_in_meu(csreg_err_state_in_meu), 
                        .csreg_err_state_in    (csreg_err_state_in[`ERR_LDAC:`ERR_LVC]), 
                        .csreg_csr_synd_wr_en  (csreg_csr_synd_wr_en), 
                        .csreg_mux1_synd_sel   (csreg_mux1_synd_sel[1:0]), 
                        .csreg_mux2_synd_sel   (csreg_mux2_synd_sel[1:0]), 
                        .csreg_wr_enable_tid_c9(csreg_wr_enable_tid_c9), 
                        .csreg_csr_tid_wr_en   (csreg_csr_tid_wr_en), 
                        .csreg_csr_async_wr_en (csreg_csr_async_wr_en), 
                        .csreg_mux1_addr_sel   (csreg_mux1_addr_sel[3:0]), 
                        .csreg_mux2_addr_sel   (csreg_mux2_addr_sel[2:0]), 
                        .csreg_csr_addr_wr_en  (csreg_csr_addr_wr_en), 
                        .csreg_csr_rd_mux1_sel_c7(csreg_csr_rd_mux1_sel_c7[3:0]), 
                        .csreg_csr_rd_mux2_sel_c7(csreg_csr_rd_mux2_sel_c7), 
                        .csreg_csr_rd_mux3_sel_c7(csreg_csr_rd_mux3_sel_c7[1:0]), 
                        .csreg_csr_bist_wr_en_c8(csreg_csr_bist_wr_en_c8), 
                        .l2t_rst_fatal_error(l2t_rst_fatal_error),
                       // Inputs 
                	.csreg_l2_cmpr_reg_wr_en_c8     (csreg_l2_cmpr_reg_wr_en_c8),
                	.csreg_l2_mask_reg_wr_en_c8     (csreg_l2_mask_reg_wr_en_c8),
		       .misbuf_vuad_ce_err_c8(misbuf_vuad_ce_err_c8),
		       .csr_error_status_notdata(csr_error_status_notdata),
		       .rdmat_rdmard_notdata_c12(rdmat_rdmard_notdata_c12),
		       .deccck_spcd_notdata_err_c8(deccck_spcd_notdata_err_c8),
		       .deccck_bscd_notdata_err_c8(deccck_bscd_notdata_err_c8),
                       .csr_l2_dir_map_on(csr_l2_dir_map_on),
                       .arb_csr_wr_en_c7(arb_csr_wr_en_c7), 
                        .arbadr_arbdp_word_addr_c6(arbadr_arbdp_word_addr_c6[4:0]), 
                       .scan_in(csreg_scanin),
                       .scan_out(csreg_scanout),
                       .l2clk            (l2clk), 
                        .vuaddp_vuad_error_c8   (vuaddp_vuad_error_c8), 
                        .dirrep_dir_error_c8    (dirrep_dir_error_c8), 
                       .deccck_spcd_corr_err_c8(deccck_spcd_corr_err_c8), 
                       .deccck_spcd_uncorr_err_c8(deccck_spcd_uncorr_err_c8), 
                       .deccck_scrd_corr_err_c8(deccck_scrd_corr_err_c8), 
                       .deccck_scrd_uncorr_err_c8(deccck_scrd_uncorr_err_c8), 
                       .deccck_spcfb_corr_err_c8(deccck_spcfb_corr_err_c8), 
                       .deccck_spcfb_uncorr_err_c8(deccck_spcfb_uncorr_err_c8), 
                       .deccck_bscd_corr_err_c8(deccck_bscd_corr_err_c8), 
                       .deccck_bscd_uncorr_err_c8(deccck_bscd_uncorr_err_c8), 
                        .tagdp_tag_error_c8    (tagdp_tag_error_c8), 
                        .filbuf_mcu_scb_secc_err_d1(filbuf_mcu_scb_secc_err_d1), 
                        .filbuf_mcu_scb_mecc_err_d1(filbuf_mcu_scb_mecc_err_d1), 
                       .filbuf_uncorr_err_c8(filbuf_uncorr_err_c8), 
                       .filbuf_corr_err_c8(filbuf_corr_err_c8), 
                       .filbuf_bsc_corr_err_c12(filbuf_bsc_corr_err_c12), 
                       .filbuf_ld64_fb_hit_c12(filbuf_ld64_fb_hit_c12), 
                        .rdmat_ev_uerr_r6      (rdmat_ev_uerr_r6), 
                        .rdmat_ev_cerr_r6      (rdmat_ev_cerr_r6), 
                        .rdmat_rdmard_uerr_c12 (rdmat_rdmard_uerr_c12), 
                        .rdmat_rdmard_cerr_c12 (rdmat_rdmard_cerr_c12), 
                        .csr_error_status_vec(csr_error_status_vec), 
                        .csr_error_status_veu(csr_error_status_veu), 
                        .arb_store_err_c8    (arb_store_err_c8), 
                        .oqu_str_ld_hit_c7   (oqu_str_ld_hit_c7),
  .cmp_io_sync_en(cmp_io_sync_en),
  .csreg_wr_enable_notdata_nddm_vcid_c9(csreg_wr_enable_notdata_nddm_vcid_c9),
  .notdata_higher_priority_err(notdata_higher_priority_err),
  .csr_l2_bypass_mode_on(csr_l2_bypass_mode_on),
  .set_async_c9(set_async_c9),
  .error_rw_en(error_rw_en),
  .diag_wr_en(diag_wr_en),
  .csreg_report_ldrc_inpkt(csreg_report_ldrc_inpkt),
  .arb_fill_vld_c2(arb_fill_vld_c2)); 
 
 
l2t_snp_ctl     snp( 
                // Outputs 
                .l2t_sii_iq_dequeue             (l2t_sii_iq_dequeue), 
                .snp_snpq_arb_vld_px1           (snp_snpq_arb_vld_px1), 
		.l2t_dbg_sii_iq_dequeue		(l2t_dbg_sii_iq_dequeue_unreg),
                .snp_hdr1_wen0_s0               (snp_hdr1_wen0_s0), 
                .snp_hdr2_wen0_s1               (snp_hdr2_wen0_s1), 
                .snp_snp_data1_wen0_s2          (snp_data1_wen0_s2), 
                .snp_snp_data2_wen0_s3          (snp_data2_wen0_s3), 
                .snp_hdr1_wen1_s0               (snp_hdr1_wen1_s0), 
                .snp_hdr2_wen1_s1               (snp_hdr2_wen1_s1), 
                .snp_snp_data1_wen1_s2          (snp_data1_wen1_s2), 
                .snp_snp_data2_wen1_s3          (snp_data2_wen1_s3), 
                .snp_wr_ptr                     (snp_wr_ptr), 
                .snp_rd_ptr                     (snp_rd_ptr), 
                .snp_rdmad_wr_entry_s2          (snp_rdmad_wr_entry_s2[1:0]), 
                .l2t_l2b_rdma_wren_s2           (l2t_l2b_rdma_wren_s2[15:0]), 
                .l2t_l2b_rdma_wrwl_s2           (l2t_l2b_rdma_wrwl_s2[1:0]), 
                // Inputs 
		.l2t_siu_delay			(l2t_siu_delay),
                .tcu_pce_ov                     (ce_ovrd),
                .tcu_aclk                       (aclk),
                .tcu_bclk                       (bclk),
                .tcu_scan_en                    (tcu_scan_en),
                .snp_rdmatag_wr_en_s2           (rdmatag_wr_en_s2), 
                .wmr_l                          (wmr_l), 
                .rdmat_sii_req_vld_buf          (sii_l2t_req_vld), 
                .snpd_rq_winv_s1                (snpd_rq_winv_s1), 
                .rdmat_wr_entry_s1              (rdmat_wr_entry_s1[1:0]), 
                .scan_in(snp_scanin),
                .scan_out(snp_scanout),
                .l2clk                          (l2clk),
  .arb_snp_snpsel_px2(arb_snp_snpsel_px2),
  .l2t_mb2_run(l2t_mb2_run),
  .l2t_mb2_rdmatag_wr_en(l2t_mb2_rdmatag_wr_en)); 
 
 
l2t_snpd_dp     snpd( 
                // Outputs 
                .snpd_snpq_arbdp_addr_px2       (snpd_snpq_arbdp_addr_px2[39:0]), 
                .snpd_snpq_arbdp_inst_px2       (snpd_snpq_arbdp_inst_px2[`JBI_HDR_SZ_LESS1:0]), 
                .snpd_snpq_arbdp_data_px2       (snpd_snpq_arbdp_data_px2[63:0]), 
                .snpd_ecc_px2                   (snpd_ecc_px2[6:0]), 
                .snpd_rq_winv_s1                (snpd_rq_winv_s1), 
                // Inputs 
		.l2t_siu_delay			(l2t_siu_delay),
                .tcu_pce_ov                     (ce_ovrd),
                .tcu_aclk                       (aclk),
                .tcu_bclk                       (bclk),
                .tcu_scan_en                    (tcu_scan_en),
                .tcu_clk_stop                   (1'b0),
                .snpd_rdmatag_wr_addr_s2        (rdmatag_wr_addr_s2[39:6]), 
                .scan_in(snpd_scanin),
                .scan_out(snpd_scanout),
                .l2clk                          (l2clk), 
                .sii_l2t_req                    (sii_l2t_req[31:0]), 
                .sii_l2b_ecc                    (sii_l2b_ecc[6:0]), 
                .snp_hdr1_wen0_s0               (snp_hdr1_wen0_s0), 
                .snp_hdr2_wen0_s1               (snp_hdr2_wen0_s1), 
                .snp_snp_data1_wen0_s2          (snp_data1_wen0_s2), 
                .snp_snp_data2_wen0_s3          (snp_data2_wen0_s3), 
                .snp_hdr1_wen1_s0               (snp_hdr1_wen1_s0), 
                .snp_hdr2_wen1_s1               (snp_hdr2_wen1_s1), 
                .snp_snp_data1_wen1_s2          (snp_data1_wen1_s2), 
                .snp_snp_data2_wen1_s3          (snp_data2_wen1_s3), 
                .snp_wr_ptr                     (snp_wr_ptr), 
                .snp_rd_ptr                     (snp_rd_ptr), 
                .snp_rdmad_wr_entry_s2          (snp_rdmad_wr_entry_s2[1:0]),
  .l2t_mb2_wdata(l2t_mb2_wdata[7:0]),
  .l2t_mb2_run(l2t_mb2_run)); 
 
 
l2t_evctag_dp	evctag( 
                 .tcu_pce_ov(ce_ovrd),
                 .tcu_aclk(aclk),
                 .tcu_bclk(bclk),
		.tcu_scan_en(tcu_scan_en),
		.tcu_clk_stop(1'b0),
                .wb_read_data(wb_read_data[39:0]), 
                .rdma_read_data(rdma_read_data[39:0]), 
                .evctag_lkup_addr_c1(lkup_addr_c1[39:7]), 
                .evctag_mb_write_addr(mb_write_addr[41:0]), 
                .evctag_wb_write_addr(wb_write_addr[39:0]), 
		.mbdata_din	(mbdata_din[127:64]),
		.fbtag_din	(fbtag_din[39:0]),
                 // Outputs 
		// .mbist_cam_read_data(mbist_cam_read_data[41:0]),
			.arbadr_2bnk_true_enbld_dist              (arbadr_evctag_2bnk_true_enbld_dist),
			.arbadr_4bnk_true_enbld_dist              (arbadr_evctag_4bnk_true_enbld_dist),
			.arbadr_ncu_l2t_pm_n_dist                 (arbadr_evctag_ncu_l2t_pm_n_dist),
        	.fbtag_din_unbuff({evctag_mb_read_data[39:6],mb_data_read_data[`MBD_ECC_HI:`MBD_ECC_LO]}), 
                .mbdata_din_unbuf ({10'b0,arbdec_snpd_ecc_c8[6:0],misbuf_mbentry_c8[4:0],mbdata_inst_tecc_c8[5:0],misbuf_evict_c8,misbuf_dep_c8,misbuf_tecc_c8,4'b0,arbdp_inst_c8[`L2_POISON:`L2_SZ_LO]}), 
		.cam_mb2_rw_fail	(cam_mb2_rw_fail),
                 .evctag_addr_px2(evctag_addr_px2[39:0]), 
                 .evctag_evict_addr  (evctag_evict_addr[39:6]), 
                 .l2t_mcu_addr(l2t_mcu_addr[39:7]), 
                 .l2t_mcu_addr_5(l2t_mcu_addr_5),
                 .evctag_vuad_idx_c3 (evctag_vuad_idx_c3[8:0]), 
                 .evctag_mb_read_data(evctag_mb_read_data[39:0]), 
                 .arbadr_mbcam_addr_px2(arbadr_mbcam_addr_px2[41:7]),
                 .arbadr_mbcam_addr_px2_buff(arbadr_mbcam_addr_px2_buff[41:7]),
                 // Inputs 
                 .mb_read_data(mb_read_data[41:0]),
                 .fb_read_data(fb_read_data[39:0]), 
                 .arbadr_arbdp_cam_addr_px2(arbdp_cam_addr_px2[39:0]), 
                 .tagd_evict_tag_c4(tagd_evict_tag_c4[`TAG_WIDTH_LESS1:6]), // Templated 
                 .wbuf_wr_addr_sel(wbuf_wr_addr_sel), 
                 .wbuf_wb_or_rdma_wr_req_en(wbuf_wb_or_rdma_wr_req_en), 
                 .misbuf_arb_l2rd_en(misbuf_arb_l2rd_en), 
                 .misbuf_arb_mcurd_en(misbuf_arb_mcurd_en), 
                 .filbuf_arb_l2rd_en(filbuf_arb_l2rd_en), 
                 .arb_mux1_mbsel_px1(arb_mux1_mbsel_px1), 
                 .arb_evict_c4(arb_evict_c4), 
                 .scan_in(evctag_scanin),
                 .scan_out(evctag_scanout),
                 .l2clk        (l2clk),
  .misbuf_buf_rd_en(misbuf_buf_rd_en),
  .filbuf_buf_rd_en(filbuf_buf_rd_en),
  .wb_read_en(wb_read_en),
  .rdmat_read_en(rdmat_read_en),
  .l2t_mb2_run(l2t_mb2_run),
  .mbist_cam_sel(mbist_cam_sel[3:0]),
  .l2t_mb2_wdata(l2t_mb2_wdata[7:0])); 
 
n2_com_cm_8x40_cust       rdmatag   
		( 
		.dout(rdma_read_data[39:0]), // BS and SR 8 deep change 3/3/04
                .match(rdmat_cam_match_c2[7:0]), 
                .match_idx(rd_match_idx_unused[7:0]), 
                .adr_w({4'b0, rdmat_wr_wl_s2[3:0]}), 
                .din({rdmatag_wr_addr_s2[39:6],6'b0}),  
                .write_en(rdmatag_wr_en_s2), 
                .adr_r({4'b0,rdmat_read_wl[3:0]}), 
                .lookup_en(arb_inst_vld_c1_v3), 
                .key(lkup_addr_c1[39:7]), 
                .tcu_array_wr_inhibit(array_wr_inhibit), 
                .scan_in(rdmatag_scanin),
                .scan_out(rdmatag_scanout),
                .l2clk(l2clk), 
                .pce(1'b1), 
                .read_en(rdmat_read_en), 
                .tcu_aclk(aclk),
                .tcu_bclk(bclk),
		.tcu_scan_en(tcu_scan_en),
                .tcu_pce_ov(ce_ovrd),
		.tcu_clk_stop(1'b0),
                .tcu_array_bypass (tcu_array_bypass),
		.tcu_se_scancollar_out(tcu_se_scancollar_out), 
		.tcu_se_scancollar_in(tcu_se_scancollar_in));
 
 
l2t_rdmarpt_dp rdmarpt 
	(
	.scan_in (rdmatag_scanout),
        .tcu_clk_stop(1'b0),
	.scan_out (rdmarpt_scanout),
  .l2t_l2b_fbrd_en_c3(l2t_l2b_fbrd_en_c3),
  .l2t_l2b_fbrd_wl_c3(l2t_l2b_fbrd_wl_c3[2:0]),
  .l2t_l2b_fbwr_wl_r2(l2t_l2b_fbwr_wl_r2[2:0]),
  .filbuf_fbd_rd_en_c2(filbuf_fbd_rd_en_c2),
  .filbuf_fbd_rd_entry_c2(filbuf_fbd_rd_entry_c2[2:0]),
  .filbuf_fbd_wr_entry_r1(filbuf_fbd_wr_entry_r1[2:0]),
  .l2clk(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
	);

l2t_rdmat_ctl	 rdmat( 
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
                           .snp_rdmatag_wr_en_s2(rdmatag_wr_en_s2), 
                           .rdma_mbist_cam_hit(rdma_mbist_cam_hit), 
			   .rdma_mbist_cam_sel(mbist_cam_sel[3]),
                          .rdmat_cam_match_c2(rdmat_cam_match_c2[3:0]), 
                          .rdmat_wr_wl_s2(rdmat_wr_wl_s2[3:0]), 
			.wmr_l		(wmr_l), 
        .l2t_mb2_addr                   (l2t_mb2_addr[3:0]),
        .l2t_mb2_run                   (l2t_mb2_run),
                          // Outputs 
			  .rdmat_rdmard_notdata_c12(rdmat_rdmard_notdata_c12),
                          .rdmat_wr_entry_s1(rdmat_wr_entry_s1[1:0]), 
                           .rdmat_or_rdmat_valid(rdmat_or_rdmat_valid), 
                          .rdmat_pick_vec(rdmat_pick_vec[3:0]), 
                          .rdmat_rdma_hit_unqual_c2(rdmat_hit_unqual_c2), 
                          .rdmat_rdma_misbuf_dep_rdy_en(rdmat_misbuf_dep_rdy_en), 
                          .rdmat_rdma_misbuf_dep_mbid(rdmat_misbuf_dep_mbid[4:0]), 
                          //.l2t_l2b_fbwr_wl_r2(l2t_l2b_fbwr_wl_r2[2:0]), 
                          //.l2t_l2b_fbrd_en_c3(l2t_l2b_fbrd_en_c3), 
                          //.l2t_l2b_fbrd_wl_c3(l2t_l2b_fbrd_wl_c3[2:0]), 
                          .l2t_l2b_word_vld_c7(l2t_l2b_word_vld_c7), 
                          .l2t_l2b_ctag_en_c7(l2t_l2b_ctag_en_c7), 
                          .l2t_l2b_req_en_c7(l2t_l2b_req_en_c7), 
                          .l2t_l2b_word_c7(l2t_l2b_word_c7[3:0]), 
                           .rdmat_rdmard_cerr_c12(rdmat_rdmard_cerr_c12), 
                           .rdmat_rdmard_uerr_c12(rdmat_rdmard_uerr_c12), 
                           .rdmat_ev_uerr_r6   (rdmat_ev_uerr_r6), 
                           .rdmat_ev_cerr_r6   (rdmat_ev_cerr_r6), 
                          //.l2t_l2b_fbwr_wen_r2(l2t_l2b_fbwr_wen_r2[15:0]), 
                          //.l2t_l2b_fbd_stdatasel_c3(l2t_l2b_fbd_stdatasel_c3), 
                          .l2t_l2b_ctag_c7(l2t_l2b_ctag_c7[31:0]), // Phase 2 : SIU inteface and packet format change 2/7/04 

                          // Inputs 
                          .wbuf_reset_rdmat_vld(wbuf_reset_rdmat_vld[3:0]), 
			  .l2t_dbg_xbar_vcid_unreg	(l2t_dbg_xbar_vcid_transfer[5:0]),
			  .l2t_dbg_xbar_vcid(l2t_dbg_xbar_vcid[5:0]),
			 .l2t_dbg_sii_iq_dequeue_unreg(l2t_dbg_sii_iq_dequeue_unreg),
			 .l2t_dbg_sii_iq_dequeue(l2t_dbg_sii_iq_dequeue),
                          .wbuf_set_rdmat_acked(wbuf_set_rdmat_acked[3:0]), 
                          .arb_wbuf_inst_vld_c2(arb_wbuf_inst_vld_c2), 
                          .arb_wbuf_hit_off_c1(arb_wbuf_hit_off_c1), 
                          .arbdec_arbdp_rdma_entry_c3(arbdec_arbdp_rdma_entry_c3[1:0]), 
                          .misbuf_wbuf_mbid_c4(misbuf_wbuf_mbid_c4[4:0]), 
                          .misbuf_hit_c4 (misbuf_hit_c4), 
                          .tag_rdma_ev_en_c4(tag_rdma_ev_en_c4), 
                          .scan_in(rdmarpt_scanout),
                          .scan_out(rdmat_scanout),
                          .l2clk         (l2clk), 
                          .l2b_l2t_rdma_cerr_c10(l2b_l2t_rdma_cerr_c10), 
                          .l2b_l2t_rdma_uerr_c10(l2b_l2t_rdma_uerr_c10), 
			  .l2b_l2t_rdma_notdata_c10(l2b_l2t_rdma_notdata_c10),
                          .l2b_l2t_ev_uerr_r5(l2b_l2t_ev_uerr_r5), 
                          .l2b_l2t_ev_cerr_r5(l2b_l2t_ev_cerr_r5), 
                          .arbdec_ctag_c6(arbdec_ctag_c6[31:0]),
                          .tag_inc_rdma_cnt_c4(tag_inc_rdma_cnt_c4), 
                          .tag_set_rdma_reg_vld_c4(tag_set_rdma_reg_vld_c4), 
                          .tag_siu_req_en_c52(tag_siu_req_en_c52), 
                          .arbdp_rdma_addr_c6(arbadr_arbdp_rdmat_addr_c6[5:2]) 
                          //.filbuf_fbd_rd_en_c2(filbuf_fbd_rd_en_c2), 
                          //.filbuf_fbd_rd_entry_c2(filbuf_fbd_rd_entry_c2[2:0]), 
                          //.filbuf_fbd_wr_entry_r1(filbuf_fbd_wr_entry_r1[2:0])
			); 
 
 
//l2t_dbg_dp		dbg( 
//        .tcu_pce_ov(ce_ovrd),
//        .tcu_aclk(aclk),
//        .tcu_bclk(bclk),
//        .tcu_scan_en(tcu_scan_en),
//        .tcu_clk_stop(tcu_clk_stop),
//        .arbadr_arbdp_dbg_addr_c3  ({arbadr_dir_cam_addr_c3[33:8], arbdp_dbg_addr_c3[5:2]}), 
//       // Outputs 
//       .l2t_dbgbus_out   (l2t_dbgbus_out[41:0]), // BS and SR 11/12/03 N2 Xbar Packet format change 
//       // Inputs 
//        .csr_l2_dbg_en          (csr_l2_dbg_en), 
//       .scan_in(dbg_scanin),
//       .scan_out(dbg_scanout),
//       .l2clk               (l2clk)); 
// 
//l2t_ret_dp		ret( 
//                                .tcu_pce_ov(ce_ovrd),
//                                .tcu_aclk(aclk),
//                                .tcu_bclk(bclk),
//				.tcu_scan_en(tcu_scan_en),
//				.tcu_clk_stop(1'b0),
//				/*AUTOINST*/ 
//                    // Outputs 
//                    .ret_data_c7_buf  (retbuf_ret_data_c7[127:0]), 
//                    .ret_ecc_c7_buf   (retbuf_ret_ecc_c7[27:0]), 
//                    // Inputs 
//                    .l2d_l2t_decc_c6(l2d_l2t_decc_c6[155:0]), 
//                    .scan_in(ret_scanin),
//                    .scan_out(ret_scanout),
//                    .l2clk               (l2clk)); 
 
l2t_dirrep_ctl		dirrep( 
                                .tcu_pce_ov(ce_ovrd),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
				/*AUTOINST*/ 
                       // Outputs 
                        .dirrep_dir_vld_c4_l    (dirrep_dir_vld_c4_l), 
                        .dirrep_dir_wr_par_c4    (dirrep_dir_wr_par_c4), 
                        .dirrep_dc_rd_en_c4     (dirrep_dc_rd_en_c4), 
                        .dirrep_dc_wr_en_c4     (dirrep_dc_wr_en_c4), 
                        .dirrep_inval_mask_dcd_c4(dirrep_inval_mask_dcd_c4[7:0]), 
                        .dirrep_dc_rdwr_row_en_c4(dirrep_dc_rdwr_row_en_c4[3:0]), 
                        .dirrep_dc_rdwr_panel_dec_c4(dirrep_dc_rdwr_panel_dec_c4[3:0]), 
                        .dirrep_dc_lkup_row_dec_c4(dirrep_dc_lkup_row_dec_c4[3:0]), 
                        .dirrep_dc_lkup_panel_dec_c4(dirrep_dc_lkup_panel_dec_c4[3:0]), 
                        .dirrep_wr_dc_dir_entry_c4(dirrep_wr_dc_dir_entry_c4[4:0]), // BS and SR 11/18/03 Reverse Directory change
                        .dirrep_dc_dir_clear_c4 (dirrep_dc_dir_clear_c4), 
                        .dirrep_ic_rd_en_c4     (dirrep_ic_rd_en_c4), 
                        .dirrep_ic_wr_en_c4     (dirrep_ic_wr_en_c4), 
                        .dirrep_inval_mask_icd_c4(dirrep_inval_mask_icd_c4[7:0]), 
                        .dirrep_ic_rdwr_row_en_c4(dirrep_ic_rdwr_row_en_c4[3:0]), 
                        .dirrep_ic_rdwr_panel_dec_c4(dirrep_ic_rdwr_panel_dec_c4[3:0]), 
                        .dirrep_ic_lkup_row_dec_c4(dirrep_ic_lkup_row_dec_c4[3:0]), 
                        .dirrep_ic_lkup_panel_dec_c4(dirrep_ic_lkup_panel_dec_c4[3:0]), 
                        .dirrep_wr_ic_dir_entry_c4(dirrep_wr_ic_dir_entry_c4[4:0]),// BS and SR 11/18/03 Reverse Directory change 
                        .dirrep_ic_dir_clear_c4 (dirrep_ic_dir_clear_c4), 
                        .dirrep_dir_error_c8    (dirrep_dir_error_c8), 
                        .arbadr_arbdp_addr4_c4    (arbadr_arbdp_addr4_c4), 
                        .arbadr_arbdp_dc_addr4_c4    (arbadr_arbdp_dc_addr4_c4), 
                        .arbadr_arbdp_ic_addr4_c4    (arbadr_arbdp_ic_addr4_c4), 
			.arbadr_arbdp_index_ic_addr4_c4(arbadr_arbdp_index_ic_addr4_c4),
			.arbadr_arbdp_index_dc_addr4_c4(arbadr_arbdp_index_dc_addr4_c4),
                       // Inputs 
                      .arb_ic_inval_vld_c7   (ic_inval_vld_c7), 	
                       .ic_parity_out   (ic_parity_out[3:0]), 
                       .dc_parity_out   (dc_parity_out[3:0]), 
                	.arb_dc_ic_rd_bit_4(arb_dc_ic_rd_bit_4), 
                     .arb_inval_inst_vld_c3   (arb_inval_inst_vld_c3), 
                        .arbadr_arbdp_dir_wr_par_c3(csr_wr_dirpinj_en), 
                        .arbadr_arbdp_addr5to4_c3(arbadr_arbdp_addr5to4_c3[1:0]), 
                       .arb_dir_vld_c3_l(arb_dir_vld_c3_l), 
                       .arb_ic_rd_en_c3(arb_ic_rd_en_c3), 
                       .arb_dc_rd_en_c3(arb_dc_rd_en_c3), 
                       .arb_ic_wr_en_c3(arb_ic_wr_en_c3), 
                       .arb_dc_wr_en_c3(arb_dc_wr_en_c3), 
                       .arb_dir_panel_dcd_c3(arb_dir_panel_dcd_c3[4:0]), 
                       .arb_dir_panel_icd_c3(arb_dir_panel_icd_c3[4:0]), 
                       .arb_lkup_bank_ena_dcd_c3(arb_lkup_bank_ena_dcd_c3[3:0]), 
                       .arb_lkup_bank_ena_icd_c3(arb_lkup_bank_ena_icd_c3[3:0]), 
                       .arb_inval_mask_dcd_c3(arb_inval_mask_dcd_c3[7:0]), 
                       .arb_inval_mask_icd_c3(arb_inval_mask_icd_c3[7:0]), 
                       .arb_wr_dc_dir_entry_c3(arb_wr_dc_dir_entry_c3[4:0]), 
                       .arb_wr_ic_dir_entry_c3(arb_wr_ic_dir_entry_c3[4:0]), 
                        .tagd_lkup_row_addr_dcd_c3(lkup_row_addr_dcd_c3[2:0]), 
                        .tagd_lkup_row_addr_icd_c3(lkup_row_addr_icd_c3[2:0]), 
                        .csr_oneshot_dir_clear_c3(csr_oneshot_dir_clear_c3), 
                       .scan_in(dirrep_scanin),
                       .scan_out(dirrep_scanout),
                       .l2clk            (l2clk),
  .por_l(por_l),
  .l2t_mb0_run(l2t_mb0_run)); 
 
 
/////////////////////////// 
// VUAD array coded here 
/////////////////////////// 
 
 
 
// ROW 0 

n2_l2t_dp_32x160_cust 	subarray_0(
       // Outputs 
       .dout      ({subarray_0_unused[3:0],data_in_h_r0[155:0]}),   
       // Inputs 
        .tcu_pce_ov(ce_ovrd),
        .pce(1'b1),
        .tcu_aclk(aclk),
        .tcu_bclk(bclk),
        .tcu_scan_en(tcu_scan_en),
        .din       ( { 
               1'b0,                1'b0,           1'b0,           1'b0,
       	write_data[77], write_data[77], write_data[77], write_data[77], 
       	write_data[76], write_data[76], write_data[76], write_data[76], 
       	write_data[75], write_data[75], write_data[75], write_data[75], 
       	write_data[74], write_data[74], write_data[74], write_data[74], 
       	write_data[73], write_data[73], write_data[73], write_data[73], 
       	write_data[72], write_data[72], write_data[72], write_data[72], 
       	write_data[71], write_data[71], write_data[71], write_data[71], 
       	write_data[70], write_data[70], write_data[70], write_data[70], 
       	write_data[69], write_data[69], write_data[69], write_data[69], 
       	write_data[68], write_data[68], write_data[68], write_data[68], 
       	write_data[67], write_data[67], write_data[67], write_data[67],
       	write_data[66], write_data[66], write_data[66], write_data[66],
       	write_data[65], write_data[65], write_data[65], write_data[65],
       	write_data[64], write_data[64], write_data[64], write_data[64],
       	write_data[63], write_data[63], write_data[63], write_data[63],
       	write_data[62], write_data[62], write_data[62], write_data[62],
       	write_data[61], write_data[61], write_data[61], write_data[61],
       	write_data[60], write_data[60], write_data[60], write_data[60],
       	write_data[59], write_data[59], write_data[59], write_data[59],
       	write_data[58], write_data[58], write_data[58], write_data[58],
       	write_data[57], write_data[57], write_data[57], write_data[57],
       	write_data[56], write_data[56], write_data[56], write_data[56],
       	write_data[55], write_data[55], write_data[55], write_data[55],
       	write_data[54], write_data[54], write_data[54], write_data[54],
       	write_data[53], write_data[53], write_data[53], write_data[53],
       	write_data[52], write_data[52], write_data[52], write_data[52],
       	write_data[51], write_data[51], write_data[51], write_data[51],
       	write_data[50], write_data[50], write_data[50], write_data[50],
       	write_data[49], write_data[49], write_data[49], write_data[49],
       	write_data[48], write_data[48], write_data[48], write_data[48],
       	write_data[47], write_data[47], write_data[47], write_data[47],
       	write_data[46], write_data[46], write_data[46], write_data[46],
       	write_data[45], write_data[45], write_data[45], write_data[45],
       	write_data[44], write_data[44], write_data[44], write_data[44],
       	write_data[43], write_data[43], write_data[43], write_data[43],
       	write_data[42], write_data[42], write_data[42], write_data[42],
       	write_data[41], write_data[41], write_data[41], write_data[41],
       	write_data[40], write_data[40], write_data[40], write_data[40],
       	write_data[39], write_data[39], write_data[39], write_data[39] }), 
        .rd_adr1   (vuad_rd_addr1_r0[4:0]),      // Templated 
        .rd_adr2   (vuad_rd_addr2_r0[4:0]),      // Templated 
        .sel_rdaddr1(vuad_rd_addr_sel_r0),       // Templated 
        .wr_adr    (vuad_wr_addr_r0[4:0]),       // Templated 
        .read_en   (vuad_rd_en_r0),              // Templated 
        .wr_en     (vuad_wr_en_r0c0),            // Templated 
        .word_wen  (vuad_word_en_r0[3:0]),       // Templated 
        .tcu_array_wr_inhibit(array_wr_inhibit),     // Templated 
        .scan_in(subarray_0_scanin),
        .scan_out(subarray_0_scanout),
        .l2clk      (l2clk),                  // Templated 
        .tcu_se_scancollar_in    (tcu_se_scancollar_in));                // Templated 
 
l2t_vuadcl_dp  vuadcl_0(
                              // Outputs 
                               .vuadcl_data_out_col(data_out_col_r0[38:0]), // Templated 
                              // Inputs 
                                .tcu_muxtest(tcu_muxtest),
                              .data_in_l(data_in_h_r1[155:0]),   // Templated 
                              .data_in_h(data_in_h_r0[155:0]),   // Templated 
                              .mux1_h_sel(mux1_h_sel_r0[3:0]),   // Templated 
                              .mux1_l_sel(mux1_l_sel_r0[3:0]),   // Templated 
                              .mux2_sel (vuad_mux2_sel_r0));      // Templated 
 
n2_l2t_dp_32x160_cust 	subarray_1(
                             // Outputs 
                             .dout      ({subarray_1_unused[3:0],data_in_h_r1[155:0]}),   // Templated 
                             // Inputs 
                                .tcu_pce_ov(ce_ovrd),
        			.pce(1'b1),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),

                             .din       ( { 
			1'b0,                1'b0,           1'b0,           1'b0,
			write_data[77], write_data[77], write_data[77], write_data[77],
			write_data[76], write_data[76], write_data[76], write_data[76],
			write_data[75], write_data[75], write_data[75], write_data[75],
			write_data[74], write_data[74], write_data[74], write_data[74],
			write_data[73], write_data[73], write_data[73], write_data[73],
			write_data[72], write_data[72], write_data[72], write_data[72],
			write_data[71], write_data[71], write_data[71], write_data[71],
			write_data[70], write_data[70], write_data[70], write_data[70],
			write_data[69], write_data[69], write_data[69], write_data[69],
			write_data[68], write_data[68], write_data[68], write_data[68],
			write_data[67], write_data[67], write_data[67], write_data[67],
			write_data[66], write_data[66], write_data[66], write_data[66],
			write_data[65], write_data[65], write_data[65], write_data[65],
			write_data[64], write_data[64], write_data[64], write_data[64],
			write_data[63], write_data[63], write_data[63], write_data[63],
			write_data[62], write_data[62], write_data[62], write_data[62],
			write_data[61], write_data[61], write_data[61], write_data[61],
			write_data[60], write_data[60], write_data[60], write_data[60],
			write_data[59], write_data[59], write_data[59], write_data[59],
			write_data[58], write_data[58], write_data[58], write_data[58],
			write_data[57], write_data[57], write_data[57], write_data[57],
			write_data[56], write_data[56], write_data[56], write_data[56],
			write_data[55], write_data[55], write_data[55], write_data[55],
			write_data[54], write_data[54], write_data[54], write_data[54],
			write_data[53], write_data[53], write_data[53], write_data[53],
			write_data[52], write_data[52], write_data[52], write_data[52],
			write_data[51], write_data[51], write_data[51], write_data[51],
			write_data[50], write_data[50], write_data[50], write_data[50],
			write_data[49], write_data[49], write_data[49], write_data[49],
			write_data[48], write_data[48], write_data[48], write_data[48],
			write_data[47], write_data[47], write_data[47], write_data[47],
			write_data[46], write_data[46], write_data[46], write_data[46],
			write_data[45], write_data[45], write_data[45], write_data[45],
			write_data[44], write_data[44], write_data[44], write_data[44],
			write_data[43], write_data[43], write_data[43], write_data[43],
			write_data[42], write_data[42], write_data[42], write_data[42],
			write_data[41], write_data[41], write_data[41], write_data[41],
			write_data[40], write_data[40], write_data[40], write_data[40],
			write_data[39], write_data[39], write_data[39], write_data[39] }),
                             .rd_adr1   (vuad_rd_addr1_r1[4:0]),      // Templated 
                             .rd_adr2   (vuad_rd_addr2_r1[4:0]),      // Templated 
                             .sel_rdaddr1(vuad_rd_addr_sel_r1),       // Templated 
                             .wr_adr    (vuad_wr_addr_r1[4:0]),       // Templated 
                             .read_en   (vuad_rd_en_r1),              // Templated 
                             .wr_en     (vuad_wr_en_r1c0),            // Templated 
                             .word_wen  (vuad_word_en_r1[3:0]),       // Templated 
                             .tcu_array_wr_inhibit(array_wr_inhibit),     // Templated 
                             .scan_in(subarray_1_scanin),
                             .scan_out(subarray_1_scanout),
                             .l2clk      (l2clk),                  // Templated 
                             .tcu_se_scancollar_in    (tcu_se_scancollar_in));                // Templated 
 
 
 
// ROW 2 
 
n2_l2t_dp_32x160_cust 	subarray_2(/*AUTOINST*/ 
                             // Outputs 
                             .dout      ({subarray_2_unused[3:0],data_in_h_r2[155:0]}),   // Templated 
                             // Inputs 
                                .tcu_pce_ov(ce_ovrd),
        			.pce(1'b1),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
                             .din       ( { 
                        1'b0,                1'b0,           1'b0,           1'b0,
                        write_data[77], write_data[77], write_data[77], write_data[77],
                        write_data[76], write_data[76], write_data[76], write_data[76],
                        write_data[75], write_data[75], write_data[75], write_data[75],
                        write_data[74], write_data[74], write_data[74], write_data[74],
                        write_data[73], write_data[73], write_data[73], write_data[73],
                        write_data[72], write_data[72], write_data[72], write_data[72],
                        write_data[71], write_data[71], write_data[71], write_data[71],
                        write_data[70], write_data[70], write_data[70], write_data[70],
                        write_data[69], write_data[69], write_data[69], write_data[69],
                        write_data[68], write_data[68], write_data[68], write_data[68],
                        write_data[67], write_data[67], write_data[67], write_data[67],
                        write_data[66], write_data[66], write_data[66], write_data[66],
                        write_data[65], write_data[65], write_data[65], write_data[65],
                        write_data[64], write_data[64], write_data[64], write_data[64],
                        write_data[63], write_data[63], write_data[63], write_data[63],
                        write_data[62], write_data[62], write_data[62], write_data[62],
                        write_data[61], write_data[61], write_data[61], write_data[61],
                        write_data[60], write_data[60], write_data[60], write_data[60],
                        write_data[59], write_data[59], write_data[59], write_data[59],
                        write_data[58], write_data[58], write_data[58], write_data[58],
                        write_data[57], write_data[57], write_data[57], write_data[57],
                        write_data[56], write_data[56], write_data[56], write_data[56],
                        write_data[55], write_data[55], write_data[55], write_data[55],
                        write_data[54], write_data[54], write_data[54], write_data[54],
                        write_data[53], write_data[53], write_data[53], write_data[53],
                        write_data[52], write_data[52], write_data[52], write_data[52],
                        write_data[51], write_data[51], write_data[51], write_data[51],
                        write_data[50], write_data[50], write_data[50], write_data[50],
                        write_data[49], write_data[49], write_data[49], write_data[49],
                        write_data[48], write_data[48], write_data[48], write_data[48],
                        write_data[47], write_data[47], write_data[47], write_data[47],
                        write_data[46], write_data[46], write_data[46], write_data[46],
                        write_data[45], write_data[45], write_data[45], write_data[45],
                        write_data[44], write_data[44], write_data[44], write_data[44],
                        write_data[43], write_data[43], write_data[43], write_data[43],
                        write_data[42], write_data[42], write_data[42], write_data[42],
                        write_data[41], write_data[41], write_data[41], write_data[41],
                        write_data[40], write_data[40], write_data[40], write_data[40],
                        write_data[39], write_data[39], write_data[39], write_data[39] }),
                             .rd_adr1   (vuad_rd_addr1_r2[4:0]),      // Templated 
                             .rd_adr2   (vuad_rd_addr2_r2[4:0]),      // Templated 
                             .sel_rdaddr1(vuad_rd_addr_sel_r2),       // Templated 
                             .wr_adr    (vuad_wr_addr_r2[4:0]),       // Templated 
                             .read_en   (vuad_rd_en_r2),              // Templated 
                             .wr_en     (vuad_wr_en_r2c0),            // Templated 
                             .word_wen  (vuad_word_en_r2[3:0]),       // Templated 
                             .tcu_array_wr_inhibit(array_wr_inhibit),     // Templated 
                             .scan_in(subarray_2_scanin),
                             .scan_out(subarray_2_scanout),
                             .l2clk      (l2clk),                  // Templated 
                             .tcu_se_scancollar_in    (tcu_se_scancollar_in));                // Templated 


l2t_vuadcl_dp  vuadcl_2(
                              // Outputs 
                               .vuadcl_data_out_col(data_out_col_r2[38:0]), // Templated 
                              // Inputs 
                                .tcu_muxtest(tcu_muxtest),
                              .data_in_l(data_in_h_r3[155:0]),   // Templated 
                              .data_in_h(data_in_h_r2[155:0]),   // Templated 
                              .mux1_h_sel(mux1_h_sel_r2[3:0]),   // Templated 
                              .mux1_l_sel(mux1_l_sel_r2[3:0]),   // Templated 
                              .mux2_sel (vuad_mux2_sel_r2));      // Templated 


n2_l2t_dp_32x160_cust 	subarray_3(/*AUTOINST*/ 
                             // Outputs 
                             .dout      ({subarray_3_unused[3:0],data_in_h_r3[155:0]}),   // Templated 
                             // Inputs 
                                .tcu_pce_ov(ce_ovrd),
        			.pce(1'b1),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
                             .din       ( { 
                        1'b0,                1'b0,           1'b0,           1'b0,
                        write_data[77], write_data[77], write_data[77], write_data[77],
                        write_data[76], write_data[76], write_data[76], write_data[76],
                        write_data[75], write_data[75], write_data[75], write_data[75],
                        write_data[74], write_data[74], write_data[74], write_data[74],
                        write_data[73], write_data[73], write_data[73], write_data[73],
                        write_data[72], write_data[72], write_data[72], write_data[72],
                        write_data[71], write_data[71], write_data[71], write_data[71],
                        write_data[70], write_data[70], write_data[70], write_data[70],
                        write_data[69], write_data[69], write_data[69], write_data[69],
                        write_data[68], write_data[68], write_data[68], write_data[68],
                        write_data[67], write_data[67], write_data[67], write_data[67],
                        write_data[66], write_data[66], write_data[66], write_data[66],
                        write_data[65], write_data[65], write_data[65], write_data[65],
                        write_data[64], write_data[64], write_data[64], write_data[64],
                        write_data[63], write_data[63], write_data[63], write_data[63],
                        write_data[62], write_data[62], write_data[62], write_data[62],
                        write_data[61], write_data[61], write_data[61], write_data[61],
                        write_data[60], write_data[60], write_data[60], write_data[60],
                        write_data[59], write_data[59], write_data[59], write_data[59],
                        write_data[58], write_data[58], write_data[58], write_data[58],
                        write_data[57], write_data[57], write_data[57], write_data[57],
                        write_data[56], write_data[56], write_data[56], write_data[56],
                        write_data[55], write_data[55], write_data[55], write_data[55],
                        write_data[54], write_data[54], write_data[54], write_data[54],
                        write_data[53], write_data[53], write_data[53], write_data[53],
                        write_data[52], write_data[52], write_data[52], write_data[52],
                        write_data[51], write_data[51], write_data[51], write_data[51],
                        write_data[50], write_data[50], write_data[50], write_data[50],
                        write_data[49], write_data[49], write_data[49], write_data[49],
                        write_data[48], write_data[48], write_data[48], write_data[48],
                        write_data[47], write_data[47], write_data[47], write_data[47],
                        write_data[46], write_data[46], write_data[46], write_data[46],
                        write_data[45], write_data[45], write_data[45], write_data[45],
                        write_data[44], write_data[44], write_data[44], write_data[44],
                        write_data[43], write_data[43], write_data[43], write_data[43],
                        write_data[42], write_data[42], write_data[42], write_data[42],
                        write_data[41], write_data[41], write_data[41], write_data[41],
                        write_data[40], write_data[40], write_data[40], write_data[40],
                        write_data[39], write_data[39], write_data[39], write_data[39] }),
                             .rd_adr1   (vuad_rd_addr1_r3[4:0]),      // Templated 
                             .rd_adr2   (vuad_rd_addr2_r3[4:0]),      // Templated 
                             .sel_rdaddr1(vuad_rd_addr_sel_r3),       // Templated 
                             .wr_adr    (vuad_wr_addr_r3[4:0]),       // Templated 
                             .read_en   (vuad_rd_en_r3),              // Templated 
                             .wr_en     (vuad_wr_en_r3c0),            // Templated 
                             .word_wen  (vuad_word_en_r3[3:0]),       // Templated 
                             .tcu_array_wr_inhibit(array_wr_inhibit),     // Templated 
                             .scan_in(subarray_3_scanin),
                             .scan_out(subarray_3_scanout),
                             .l2clk      (l2clk),                  // Templated 
                             .tcu_se_scancollar_in    (tcu_se_scancollar_in));                // Templated 
 
l2t_vuadio_dp 	io_left( 
                          // Outputs 
                            .vuadio_array_data_in_buf(write_data[77:39]),  
                           .vuadio_data_out_io  (vuad_array_rd_data_c1[77:39]), // Templated 
                          // Inputs 
                          .data_out_col1(data_out_col_r0[38:0]), // Templated 
                          .data_out_col2(data_out_col_r2[38:0]), // Templated 
                          .array_data_in(vlddir_vuad_array_wr_data_c4[77:39]), // Templated 
                           .vuad_mux_sel      (vuad_mux_sel[1:0])); 
 
// ROW 0 col1 
 
n2_l2t_dp_32x160_cust   subarray_8(/*AUTOINST*/ 
                                   // Outputs 
                                   .dout({subarray_8_unused[3:0],data_in_h_r8[155:0]}),   // Templated 
                                   // Inputs 
                                .tcu_pce_ov(ce_ovrd),
        			.pce(1'b1),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
	                           .din         ( { 
						1'b0,         1'b0,          1'b0,           1'b0,      
	                                        write_data[38], write_data[38], write_data[38], write_data[38],
	                                        write_data[37], write_data[37], write_data[37], write_data[37],
	                                        write_data[36], write_data[36], write_data[36], write_data[36],
	                                        write_data[35], write_data[35], write_data[35], write_data[35],
	                                        write_data[34], write_data[34], write_data[34], write_data[34],
	                                        write_data[33], write_data[33], write_data[33], write_data[33],
	                                        write_data[32], write_data[32],write_data[32], write_data[32],
	                                        write_data[31], write_data[31],write_data[31], write_data[31],
	                                        write_data[30], write_data[30],write_data[30], write_data[30],
	                                        write_data[29], write_data[29],write_data[29], write_data[29],
	                                        write_data[28], write_data[28],write_data[28], write_data[28],
	                                        write_data[27], write_data[27],write_data[27], write_data[27],
	                                        write_data[26], write_data[26],write_data[26], write_data[26],
	                                        write_data[25], write_data[25],write_data[25], write_data[25],
	                                        write_data[24], write_data[24],write_data[24], write_data[24],
	                                        write_data[23], write_data[23],write_data[23], write_data[23],
	                                        write_data[22], write_data[22],write_data[22], write_data[22],
	                                        write_data[21], write_data[21],write_data[21], write_data[21],
	                                        write_data[20], write_data[20],write_data[20], write_data[20],
	                                        write_data[19], write_data[19],write_data[19], write_data[19],
	                                        write_data[18], write_data[18],write_data[18], write_data[18],
	                                        write_data[17], write_data[17],write_data[17], write_data[17],
	                                        write_data[16], write_data[16],write_data[16], write_data[16],
	                                        write_data[15], write_data[15],write_data[15], write_data[15],
	                                        write_data[14], write_data[14],write_data[14], write_data[14],
	                                        write_data[13], write_data[13],write_data[13], write_data[13],
	                                        write_data[12], write_data[12],write_data[12], write_data[12],
	                                        write_data[11], write_data[11],write_data[11], write_data[11],
	                                        write_data[10], write_data[10],write_data[10], write_data[10],
	                                        write_data[9],  write_data[9], write_data[9],  write_data[9], 
	                                        write_data[8],  write_data[8], write_data[8],  write_data[8], 
	                                        write_data[7],  write_data[7], write_data[7],  write_data[7], 
	                                        write_data[6],  write_data[6], write_data[6],  write_data[6], 
	                                        write_data[5],  write_data[5], write_data[5],  write_data[5], 
	                                        write_data[4],  write_data[4], write_data[4],  write_data[4], 
	                                        write_data[3],  write_data[3], write_data[3],  write_data[3], 
	                                        write_data[2],  write_data[2], write_data[2],  write_data[2], 
	                                        write_data[1],  write_data[1], write_data[1],  write_data[1], 
	                                        write_data[0],  write_data[0], write_data[0],  write_data[0]}),
                                   .rd_adr1(vuad_rd_addr1_r0[4:0]),   // Templated 
                                   .rd_adr2(vuad_rd_addr2_r0[4:0]),   // Templated 
                                   .sel_rdaddr1(vuad_rd_addr_sel_r0), // Templated 
                                   .wr_adr(vuad_wr_addr_r0[4:0]),     // Templated 
                                   .read_en(vuad_rd_en_r0),           // Templated 
                                   .wr_en(vuad_wr_en_r0c1),           // Templated 
                                   .word_wen(vuad_word_en_r0[3:0]),   // Templated 
                                   .tcu_array_wr_inhibit(array_wr_inhibit), // Templated 
                                   .scan_in(subarray_8_scanin),
                                   .scan_out(subarray_8_scanout),
                                   .l2clk(l2clk),                  // Templated 
                                   .tcu_se_scancollar_in(tcu_se_scancollar_in));              // Templated 
 
l2t_vuadcl_dp  vuadcl_8(/*AUTOINST*/ 
                                    // Outputs 
                                     .vuadcl_data_out_col(data_out_col_r8[38:0]), // Templated 
                                    // Inputs 
                                .tcu_muxtest(tcu_muxtest),
                                    .data_in_l(data_in_h_r9[155:0]), // Templated 
                                    .data_in_h(data_in_h_r8[155:0]), // Templated 
                                    .mux1_h_sel(mux1_h_sel_r0[3:0]), // Templated 
                                    .mux1_l_sel(mux1_l_sel_r0[3:0]), // Templated 
                                    .mux2_sel(vuad_mux2_sel_r0)); // Templated 


n2_l2t_dp_32x160_cust   subarray_9(/*AUTOINST*/ 
                                   // Outputs 
                                   .dout({subarray_9_unused[3:0],data_in_h_r9[155:0]}),   // Templated 
                                   // Inputs 
                                .tcu_pce_ov(ce_ovrd),
        			.pce(1'b1),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
                                   .din         ( { 
                                                1'b0,         1'b0,          1'b0,           1'b0,   
                                                write_data[38], write_data[38], write_data[38], write_data[38],
                                                write_data[37], write_data[37], write_data[37], write_data[37],
                                                write_data[36], write_data[36], write_data[36], write_data[36],
                                                write_data[35], write_data[35], write_data[35], write_data[35],
                                                write_data[34], write_data[34], write_data[34], write_data[34],
                                                write_data[33], write_data[33], write_data[33], write_data[33],
                                                write_data[32], write_data[32],write_data[32], write_data[32],
                                                write_data[31], write_data[31],write_data[31], write_data[31],
                                                write_data[30], write_data[30],write_data[30], write_data[30],
                                                write_data[29], write_data[29],write_data[29], write_data[29],
                                                write_data[28], write_data[28],write_data[28], write_data[28],
                                                write_data[27], write_data[27],write_data[27], write_data[27],
                                                write_data[26], write_data[26],write_data[26], write_data[26],
                                                write_data[25], write_data[25],write_data[25], write_data[25],
                                                write_data[24], write_data[24],write_data[24], write_data[24],
                                                write_data[23], write_data[23],write_data[23], write_data[23],
                                                write_data[22], write_data[22],write_data[22], write_data[22],
                                                write_data[21], write_data[21],write_data[21], write_data[21],
                                                write_data[20], write_data[20],write_data[20], write_data[20],
                                                write_data[19], write_data[19],write_data[19], write_data[19],
                                                write_data[18], write_data[18],write_data[18], write_data[18],
                                                write_data[17], write_data[17],write_data[17], write_data[17],
                                                write_data[16], write_data[16],write_data[16], write_data[16],
                                                write_data[15], write_data[15],write_data[15], write_data[15],
                                                write_data[14], write_data[14],write_data[14], write_data[14],
                                                write_data[13], write_data[13],write_data[13], write_data[13],
                                                write_data[12], write_data[12],write_data[12], write_data[12],
                                                write_data[11], write_data[11],write_data[11], write_data[11],
                                                write_data[10], write_data[10],write_data[10], write_data[10],
                                                write_data[9],  write_data[9], write_data[9],  write_data[9],
                                                write_data[8],  write_data[8], write_data[8],  write_data[8],
                                                write_data[7],  write_data[7], write_data[7],  write_data[7],
                                                write_data[6],  write_data[6], write_data[6],  write_data[6],
                                                write_data[5],  write_data[5], write_data[5],  write_data[5],
                                                write_data[4],  write_data[4], write_data[4],  write_data[4],
                                                write_data[3],  write_data[3], write_data[3],  write_data[3],
                                                write_data[2],  write_data[2], write_data[2],  write_data[2],
                                                write_data[1],  write_data[1], write_data[1],  write_data[1],
                                                write_data[0],  write_data[0], write_data[0],  write_data[0]}),
                                   .rd_adr1(vuad_rd_addr1_r1[4:0]),   // Templated 
                                   .rd_adr2(vuad_rd_addr2_r1[4:0]),   // Templated 
                                   .sel_rdaddr1(vuad_rd_addr_sel_r1), // Templated 
                                   .wr_adr(vuad_wr_addr_r1[4:0]),     // Templated 
                                   .read_en(vuad_rd_en_r1),           // Templated 
                                   .wr_en(vuad_wr_en_r1c1),           // Templated 
                                   .word_wen(vuad_word_en_r1[3:0]),   // Templated 
                                   .tcu_array_wr_inhibit(array_wr_inhibit), // Templated 
                                   .scan_in(subarray_9_scanin),
                                   .scan_out(subarray_9_scanout),
                                   .l2clk(l2clk),                  // Templated 
                                   .tcu_se_scancollar_in(tcu_se_scancollar_in));              // Templated 
 
 
// ROW 2 col1 
 
n2_l2t_dp_32x160_cust   subarray_10(/*AUTOINST*/ 
                                    // Outputs 
                                    .dout({subarray_10_unused[3:0],data_in_h_r10[155:0]}), // Templated 
                                    // Inputs 
                                .tcu_pce_ov(ce_ovrd),
        			.pce(1'b1),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
                                   .din         ( { 
                                                1'b0,         1'b0,          1'b0,           1'b0,   
                                                write_data[38], write_data[38], write_data[38], write_data[38],
                                                write_data[37], write_data[37], write_data[37], write_data[37],
                                                write_data[36], write_data[36], write_data[36], write_data[36],
                                                write_data[35], write_data[35], write_data[35], write_data[35],
                                                write_data[34], write_data[34], write_data[34], write_data[34],
                                                write_data[33], write_data[33], write_data[33], write_data[33],
                                                write_data[32], write_data[32],write_data[32], write_data[32],
                                                write_data[31], write_data[31],write_data[31], write_data[31],
                                                write_data[30], write_data[30],write_data[30], write_data[30],
                                                write_data[29], write_data[29],write_data[29], write_data[29],
                                                write_data[28], write_data[28],write_data[28], write_data[28],
                                                write_data[27], write_data[27],write_data[27], write_data[27],
                                                write_data[26], write_data[26],write_data[26], write_data[26],
                                                write_data[25], write_data[25],write_data[25], write_data[25],
                                                write_data[24], write_data[24],write_data[24], write_data[24],
                                                write_data[23], write_data[23],write_data[23], write_data[23],
                                                write_data[22], write_data[22],write_data[22], write_data[22],
                                                write_data[21], write_data[21],write_data[21], write_data[21],
                                                write_data[20], write_data[20],write_data[20], write_data[20],
                                                write_data[19], write_data[19],write_data[19], write_data[19],
                                                write_data[18], write_data[18],write_data[18], write_data[18],
                                                write_data[17], write_data[17],write_data[17], write_data[17],
                                                write_data[16], write_data[16],write_data[16], write_data[16],
                                                write_data[15], write_data[15],write_data[15], write_data[15],
                                                write_data[14], write_data[14],write_data[14], write_data[14],
                                                write_data[13], write_data[13],write_data[13], write_data[13],
                                                write_data[12], write_data[12],write_data[12], write_data[12],
                                                write_data[11], write_data[11],write_data[11], write_data[11],
                                                write_data[10], write_data[10],write_data[10], write_data[10],
                                                write_data[9],  write_data[9], write_data[9],  write_data[9],
                                                write_data[8],  write_data[8], write_data[8],  write_data[8],
                                                write_data[7],  write_data[7], write_data[7],  write_data[7],
                                                write_data[6],  write_data[6], write_data[6],  write_data[6],
                                                write_data[5],  write_data[5], write_data[5],  write_data[5],
                                                write_data[4],  write_data[4], write_data[4],  write_data[4],
                                                write_data[3],  write_data[3], write_data[3],  write_data[3],
                                                write_data[2],  write_data[2], write_data[2],  write_data[2],
                                                write_data[1],  write_data[1], write_data[1],  write_data[1],
                                                write_data[0],  write_data[0], write_data[0],  write_data[0]}),
                                    .rd_adr1(vuad_rd_addr1_r2[4:0]),  // Templated 
                                    .rd_adr2(vuad_rd_addr2_r2[4:0]),  // Templated 
                                    .sel_rdaddr1(vuad_rd_addr_sel_r2), // Templated 
                                    .wr_adr(vuad_wr_addr_r2[4:0]),    // Templated 
                                    .read_en(vuad_rd_en_r2),          // Templated 
                                    .wr_en(vuad_wr_en_r2c1),          // Templated 
                                    .word_wen(vuad_word_en_r2[3:0]),  // Templated 
                                    .tcu_array_wr_inhibit(array_wr_inhibit), // Templated 
                                    .scan_in(subarray_10_scanin),
                                    .scan_out(subarray_10_scanout),
                                    .l2clk(l2clk),                 // Templated 
                                    .tcu_se_scancollar_in(tcu_se_scancollar_in));             // Templated 
l2t_vuadcl_dp  vuadcl_10(/*AUTOINST*/ 
                                     // Outputs 
                                      .vuadcl_data_out_col(data_out_col_r10[38:0]), // Templated 
                                     // Inputs 
                                .tcu_muxtest(tcu_muxtest),
                                     .data_in_l(data_in_h_r11[155:0]), // Templated 
                                     .data_in_h(data_in_h_r10[155:0]), // Templated 
                                     .mux1_h_sel(mux1_h_sel_r2[3:0]), // Templated 
                                     .mux1_l_sel(mux1_l_sel_r2[3:0]), // Templated 
                                     .mux2_sel(vuad_mux2_sel_r2)); // Templated 


n2_l2t_dp_32x160_cust   subarray_11(/*AUTOINST*/ 
                                    // Outputs 
                                    .dout({subarray_11_unused[3:0],data_in_h_r11[155:0]}), // Templated 
                                    // Inputs 
                                .tcu_pce_ov(ce_ovrd),
        			.pce(1'b1),
                                .tcu_aclk(aclk),
                                .tcu_bclk(bclk),
				.tcu_scan_en(tcu_scan_en),
                                   .din ( { 
                                                1'b0,         1'b0,          1'b0,           1'b0,   
                                                write_data[38], write_data[38], write_data[38], write_data[38],
                                                write_data[37], write_data[37], write_data[37], write_data[37],
                                                write_data[36], write_data[36], write_data[36], write_data[36],
                                                write_data[35], write_data[35], write_data[35], write_data[35],
                                                write_data[34], write_data[34], write_data[34], write_data[34],
                                                write_data[33], write_data[33], write_data[33], write_data[33],
                                                write_data[32], write_data[32],write_data[32], write_data[32],
                                                write_data[31], write_data[31],write_data[31], write_data[31],
                                                write_data[30], write_data[30],write_data[30], write_data[30],
                                                write_data[29], write_data[29],write_data[29], write_data[29],
                                                write_data[28], write_data[28],write_data[28], write_data[28],
                                                write_data[27], write_data[27],write_data[27], write_data[27],
                                                write_data[26], write_data[26],write_data[26], write_data[26],
                                                write_data[25], write_data[25],write_data[25], write_data[25],
                                                write_data[24], write_data[24],write_data[24], write_data[24],
                                                write_data[23], write_data[23],write_data[23], write_data[23],
                                                write_data[22], write_data[22],write_data[22], write_data[22],
                                                write_data[21], write_data[21],write_data[21], write_data[21],
                                                write_data[20], write_data[20],write_data[20], write_data[20],
                                                write_data[19], write_data[19],write_data[19], write_data[19],
                                                write_data[18], write_data[18],write_data[18], write_data[18],
                                                write_data[17], write_data[17],write_data[17], write_data[17],
                                                write_data[16], write_data[16],write_data[16], write_data[16],
                                                write_data[15], write_data[15],write_data[15], write_data[15],
                                                write_data[14], write_data[14],write_data[14], write_data[14],
                                                write_data[13], write_data[13],write_data[13], write_data[13],
                                                write_data[12], write_data[12],write_data[12], write_data[12],
                                                write_data[11], write_data[11],write_data[11], write_data[11],
                                                write_data[10], write_data[10],write_data[10], write_data[10],
                                                write_data[9],  write_data[9], write_data[9],  write_data[9],
                                                write_data[8],  write_data[8], write_data[8],  write_data[8],
                                                write_data[7],  write_data[7], write_data[7],  write_data[7],
                                                write_data[6],  write_data[6], write_data[6],  write_data[6],
                                                write_data[5],  write_data[5], write_data[5],  write_data[5],
                                                write_data[4],  write_data[4], write_data[4],  write_data[4],
                                                write_data[3],  write_data[3], write_data[3],  write_data[3],
                                                write_data[2],  write_data[2], write_data[2],  write_data[2],
                                                write_data[1],  write_data[1], write_data[1],  write_data[1],
                                                write_data[0],  write_data[0], write_data[0],  write_data[0]}),
                                    .rd_adr1(vuad_rd_addr1_r3[4:0]),  // Templated 
                                    .rd_adr2(vuad_rd_addr2_r3[4:0]),  // Templated 
                                    .sel_rdaddr1(vuad_rd_addr_sel_r3), // Templated 
                                    .wr_adr(vuad_wr_addr_r3[4:0]),    // Templated 
                                    .read_en(vuad_rd_en_r3),          // Templated 
                                    .wr_en(vuad_wr_en_r3c1),          // Templated 
                                    .word_wen(vuad_word_en_r3[3:0]),  // Templated 
                                    .tcu_array_wr_inhibit(array_wr_inhibit), // Templated 
                                    .scan_in(subarray_11_scanin),
                                    .scan_out(subarray_11_scanout),
                                    .l2clk(l2clk),                 // Templated 
                                    .tcu_se_scancollar_in(tcu_se_scancollar_in));             // Templated 
 
l2t_vuadio_dp 	io_right( 
                           // Outputs 
                            .vuadio_array_data_in_buf(write_data[38:0]),  
                            .vuadio_data_out_io (vuad_array_rd_data_c1[38:0]), // Templated 
                           // Inputs 
                           .data_out_col1(data_out_col_r8[38:0]), // Templated 
                           .data_out_col2(data_out_col_r10[38:0]), // Templated 
                           .array_data_in(vlddir_vuad_array_wr_data_c4[38:0]), // Templated 
                            .vuad_mux_sel     (vuad_mux_sel[1:0])); 
//l2t_vuad_dp	  vuad( 
//                                .tcu_pce_ov(ce_ovrd),
//                                .tcu_aclk(aclk),
//                                .tcu_bclk(bclk),
//				.tcu_scan_en(tcu_scan_en),
//				.tcu_clk_stop(clk_stop),
//				/*AUTOINST*/ 
//                             // Outputs 
//                              .vuad_rd_addr1_r0(vuad_rd_addr1_r0[4:0]), 
//                              .vuad_rd_addr2_r0(vuad_rd_addr2_r0[4:0]), 
//                              .vuad_rd_addr_sel_r0(vuad_rd_addr_sel_r0), 
//                              .vuad_wr_addr_r0(vuad_wr_addr_r0[4:0]), 
//                              .vuad_word_en_r0(vuad_word_en_r0[3:0]), 
//                              .vuad_wr_en_r0c0(vuad_wr_en_r0c0), 
//                              .vuad_wr_en_r0c1(vuad_wr_en_r0c1), 
//                              .vuad_mux1_h_sel_r0(mux1_h_sel_r0[3:0]), 
//                              .vuad_mux1_l_sel_r0(mux1_l_sel_r0[3:0]), 
//                              .vuad_mux2_sel_r0(vuad_mux2_sel_r0), 
//                              .vuad_rd_en_r0  (vuad_rd_en_r0), 
//                              .vuad_rd_addr1_r1(vuad_rd_addr1_r1[4:0]), 
//                              .vuad_rd_addr2_r1(vuad_rd_addr2_r1[4:0]), 
//                              .vuad_rd_addr_sel_r1(vuad_rd_addr_sel_r1), 
//                              .vuad_wr_addr_r1(vuad_wr_addr_r1[4:0]), 
//                              .vuad_word_en_r1(vuad_word_en_r1[3:0]), 
//                              .vuad_wr_en_r1c0(vuad_wr_en_r1c0), 
//                              .vuad_wr_en_r1c1(vuad_wr_en_r1c1), 
//                              .vuad_rd_en_r1  (vuad_rd_en_r1), 
//                              .vuad_rd_addr1_r2(vuad_rd_addr1_r2[4:0]), 
//                              .vuad_rd_addr2_r2(vuad_rd_addr2_r2[4:0]), 
//                              .vuad_rd_addr_sel_r2(vuad_rd_addr_sel_r2), 
//                              .vuad_wr_addr_r2(vuad_wr_addr_r2[4:0]), 
//                              .vuad_word_en_r2(vuad_word_en_r2[3:0]), 
//                              .vuad_wr_en_r2c0(vuad_wr_en_r2c0), 
//                              .vuad_wr_en_r2c1(vuad_wr_en_r2c1), 
//                              .vuad_mux1_h_sel_r2(mux1_h_sel_r2[3:0]), 
//                              .vuad_mux1_l_sel_r2(mux1_l_sel_r2[3:0]), 
//                              .vuad_mux2_sel_r2(vuad_mux2_sel_r2), 
//                              .vuad_rd_en_r2  (vuad_rd_en_r2), 
//                              .vuad_rd_addr1_r3(vuad_rd_addr1_r3[4:0]), 
//                              .vuad_rd_addr2_r3(vuad_rd_addr2_r3[4:0]), 
//                              .vuad_rd_addr_sel_r3(vuad_rd_addr_sel_r3), 
//                              .vuad_wr_addr_r3(vuad_wr_addr_r3[4:0]), 
//                              .vuad_word_en_r3(vuad_word_en_r3[3:0]), 
//                              .vuad_wr_en_r3c0(vuad_wr_en_r3c0), 
//                              .vuad_wr_en_r3c1(vuad_wr_en_r3c1), 
//                              .vuad_rd_en_r3  (vuad_rd_en_r3), 
//                              .vuad_mux_sel   (vuad_mux_sel[1:0]), 
//                             // Inputs 
//                             .rd_addr1  (arbadr_arbdp_vuad_idx1_px2[8:0]), // Templated 
//                             .rd_addr2  (arbadr_arbdp_vuad_idx2_px2[8:0]), // Templated 
//                             .rd_addr_sel(arb_vuad_idx2_sel_px2_n), // Templated 
//                             .wr_addr   (vuaddp_vuad_idx_c4[8:0]),      // Templated 
//                             .wr_en0    (vuaddp_vuad_array_wr_en0_c4),  // Templated 
//                             .wr_en1    (vuaddp_vuad_array_wr_en1_c4),  // Templated 
//                             .array_rd_en(arb_vuad_acc_px2),  // Templated 
//                             .scan_in(vuad_scanin),
//                             .scan_out(vuad_scanout),
//                             .l2clk      (l2clk)); 
 
//////////////////////////////////////// 
// DIRECTORY 
//////////////////////////////////////// 
 
n2_com_cm_64x64_cust		ic_row0	( 
         .scan_in(ic_row0_scanin),
         .scan_out(ic_row0_scanout),
         .l2clk             (l2clk), 
         // Outputs 
         .row_hit           (ic_cam_hit[63:0]),      
         .rd_data0          (ic_rd_data04_row0[15:0]), // BS and SR 11/18/03 Reverse Directory change 
         .rd_data1          (ic_rd_data15_row0[15:0]), // BS and SR 11/18/03 Reverse Directory change 
         .rd_data2          (ic_rd_data26_row0[15:0]), // BS and SR 11/18/03 Reverse Directory change 
         .rd_data3          (ic_rd_data37_row0[15:0]), // BS and SR 11/18/03 Reverse Directory change 
         // Inputs 
         .tcu_pce_ov	(ce_ovrd),
         .pce		(1'b1),
         .tcu_aclk		(aclk),
         .tcu_bclk		(bclk),
	 .tcu_scan_en	(tcu_scan_en),
	 .tcu_array_bypass (tcu_array_bypass),
	 .force_hit         ({4{ic_force_hit_row0_c4}}),
         .cam_en            (ic_cam_en_row0[3:0]),   // Templated 
         .inv_mask0         (ic_inv_mask_0145[7:0]), // Templated 
         .inv_mask1         (ic_inv_mask_0145[7:0]), // Templated 
         .inv_mask2         (ic_inv_mask_0145[7:0]), // Templated 
         .inv_mask3         (ic_inv_mask_0145[7:0]), // Templated 
         .tcu_se_scancollar_in          (tcu_se_scancollar_in),                // Templated 
         .rd_en             (ic_rd_en_row0[3:0]),    // Templated 
         .rw_addr0          (ic_rw_addr_0145[5:0]),  // Templated,BS and SR 11/18/03 Reverse Directory change 
         .rw_addr1          (ic_rw_addr_0145[5:0]),  // Templated,BS and SR 11/18/03 Reverse Directory change 
         .rw_addr2          (ic_rw_addr_0145[5:0]),  // Templated,BS and SR 11/18/03 Reverse Directory change 
         .rw_addr3          (ic_rw_addr_0145[5:0]),  // Templated,BS and SR 11/18/03 Reverse Directory change 
         .rst_warm_0        (ic_warm_rst_0145),      // Templated 
         .rst_warm_1        (ic_warm_rst_0145),      // Templated 
         .wr_en             (ic_wr_en_row0[3:0]),    // Templated 
         .tcu_array_wr_inhibit            (array_wr_inhibit),     // Templated 
         .wr_data0          (ic_lkup_wr_data_c4_row0[15:0]),    // Templated 
         .wr_data1          (ic_lkup_wr_data_c4_row0[15:0]),    // Templated 
         .wr_data2          (ic_lkup_wr_data_c4_row0[15:0]),    // Templated 
         .wr_data3          (ic_lkup_wr_data_c4_row0[15:0]));    // Templated 
 
 
l2t_dirout_dp	      out_col0	(	 
        // Inputs 
        .tcu_pce_ov(ce_ovrd),
        .tcu_aclk(aclk),
        .tcu_bclk(bclk),
	.tcu_scan_en(tcu_scan_en),
	.tcu_clk_stop(1'b0),
        .scan_in(out_col0_scanin),
        .scan_out(out_col0_scanout),
        .l2clk             (l2clk), 
        // Outputs 
        .dirout_parity_vld_out(out_col0_dirout_parity_vld_out_unused[2:0]), 
        .dirout_parity_vld(ic_parity_in[0]),     
	.mbist_read_data_pick_top	(l2t_mb0_icrow_row_en[0]),
	.mbist_read_data_pick_bottom	(l2t_mb0_icrow_row_en[1]),
	.mbist_lkup_wrdata		(l2t_mb0_lookup_wdata[15:0]),
	.l2t_mb0_run			(l2t_mb0_run),
	.cam_read_fail			(ic_cam_read_fail[0]),
	.mbist_dc_ic_read_en		({ic_rd_en_row0[0],ic_rd_en_row2[0]}),
        .rddata_out_c52_top(ic_rd_data04_row0[15:0]), // BS and SR 11/18/03 Reverse Directory change
        .rddata_out_c52_bottom(ic_rd_data8c_row1[15:0]), // BS and SR 11/18/03 Reverse Directory change
        .rd_data_sel_c52_top(ic_row0_select_panel0), // 
        .rd_data_sel_c52_bottom(ic_row1_select_panel0), // 
        .parity_vld_in(3'b0));             // 


l2t_dirout_dp	      out_col1	(	 
        .tcu_pce_ov(ce_ovrd),
        .tcu_aclk(aclk),
        .tcu_bclk(bclk),
	.tcu_scan_en(tcu_scan_en),
	.tcu_clk_stop(1'b0),
        .scan_in(out_col1_scanin),
        .scan_out(out_col1_scanout),
        .l2clk             (l2clk), 
        .dirout_parity_vld_out(out_col1_dirout_parity_vld_out_unused[2:0]), 
        .dirout_parity_vld(ic_parity_in[1]),     // 
        // Inputs 
	.mbist_read_data_pick_top	(l2t_mb0_icrow_row_en[0]),
	.mbist_read_data_pick_bottom	(l2t_mb0_icrow_row_en[1]),
	.mbist_lkup_wrdata		(l2t_mb0_lookup_wdata[15:0]),
	.l2t_mb0_run			(l2t_mb0_run),
	.cam_read_fail			(ic_cam_read_fail[1]),
	.mbist_dc_ic_read_en		({ic_rd_en_row0[1],ic_rd_en_row2[1]}),
        .rddata_out_c52_top(ic_rd_data15_row0[15:0]), // ,BS and SR 11/18/03 Reverse Directory change 
        .rddata_out_c52_bottom(ic_rd_data9d_row1[15:0]), // BS and SR 11/18/03 Reverse Directory change 
        .rd_data_sel_c52_top(ic_row0_select_panel1), // 
        .rd_data_sel_c52_bottom(ic_row1_select_panel1), // 
        .parity_vld_in(3'b0));             // 
 
l2t_dirout_dp	      out_col2	( 
        .tcu_pce_ov(ce_ovrd),
        .tcu_aclk(aclk),
        .tcu_bclk(bclk),
	.tcu_scan_en(tcu_scan_en),
	.tcu_clk_stop(1'b0),
        .scan_in(out_col2_scanin),
        .scan_out(out_col2_scanout),
        .l2clk             (l2clk), 
        // Outputs 
        .dirout_parity_vld_out(out_col2_dirout_parity_vld_out_unused[2:0]), 
        .dirout_parity_vld(ic_parity_in[2]),     // Templated 
        // Inputs 
	.mbist_read_data_pick_top	(l2t_mb0_icrow_row_en[0]),
	.mbist_read_data_pick_bottom	(l2t_mb0_icrow_row_en[1]),
	.mbist_lkup_wrdata		(l2t_mb0_lookup_wdata[15:0]),
	.l2t_mb0_run			(l2t_mb0_run),
	.cam_read_fail			(ic_cam_read_fail[2]),
	.mbist_dc_ic_read_en		({ic_rd_en_row0[2],ic_rd_en_row2[2]}),
        .rddata_out_c52_top(ic_rd_data26_row0[15:0]), // Templated,BS and SR 11/18/03 Reverse Directory change 
        .rddata_out_c52_bottom(ic_rd_dataae_row1[15:0]), // Templated,BS and SR 11/18/03 Reverse Directory change 
        .rd_data_sel_c52_top(ic_row0_select_panel2), // Templated 
        .rd_data_sel_c52_bottom(ic_row1_select_panel2), // Templated 
        .parity_vld_in(3'b0));             // Templated 
 
l2t_dirout_dp	      out_col3	( 
                        .tcu_pce_ov(ce_ovrd),
                        .tcu_aclk(aclk),
                        .tcu_bclk(bclk),
			.tcu_scan_en(tcu_scan_en),
			.tcu_clk_stop(1'b0),
                        .scan_in(out_col3_scanin),
                        .scan_out(out_col3_scanout),
                        .l2clk             (l2clk), 
                        // Outputs 
                        .dirout_parity_vld_out(ic_parity_out[3:1]), // Templated 
                        .dirout_parity_vld(ic_parity_out[0]),    // Templated 
                        // Inputs 
	.mbist_read_data_pick_top	(l2t_mb0_icrow_row_en[0]),
	.mbist_read_data_pick_bottom	(l2t_mb0_icrow_row_en[1]),
	.mbist_lkup_wrdata		(l2t_mb0_lookup_wdata[15:0]),
	.l2t_mb0_run			(l2t_mb0_run),
	.cam_read_fail			(ic_cam_read_fail[3]),
	.mbist_dc_ic_read_en		({ic_rd_en_row0[3],ic_rd_en_row2[3]}),
        .rddata_out_c52_top(ic_rd_data37_row0[15:0]), // Templated,BS and SR 11/18/03 Reverse Directory change 
        .rddata_out_c52_bottom(ic_rd_databf_row1[15:0]), // Templated,BS and SR 11/18/03 Reverse Directory change 
        .rd_data_sel_c52_top(ic_row0_select_panel3), // Templated 
        .rd_data_sel_c52_bottom(ic_row1_select_panel3), // Templated 
        .parity_vld_in(ic_parity_in[2:0])); // Templated 
 
 
 
// Second half 
n2_com_cm_64x64_cust		ic_row2	( 
                     .scan_in(ic_row2_scanin),
                     .scan_out(ic_row2_scanout),
                     .l2clk             (l2clk), 
                     // Outputs 
                     .row_hit           (ic_cam_hit[127:64]),     // Templated 
                     .rd_data0          (ic_rd_data8c_row1[15:0]), // Templated, BS and SR 11/18/03 Reverse Directory change
                     .rd_data1          (ic_rd_data9d_row1[15:0]), // Templated, BS and SR 11/18/03 Reverse Directory change 
                     .rd_data2          (ic_rd_dataae_row1[15:0]), // Templated, BS and SR 11/18/03 Reverse Directory change 
                     .rd_data3          (ic_rd_databf_row1[15:0]), // Templated, BS and SR 11/18/03 Reverse Directory change 
                     // Inputs 
                     .tcu_pce_ov(ce_ovrd),
                     .pce		(1'b1),
                     .tcu_aclk(aclk),
                     .tcu_bclk(bclk),
		     .tcu_scan_en(tcu_scan_en),
                     .tcu_array_bypass (tcu_array_bypass),
		     .force_hit         ({4{ic_force_hit_row2_c4}}),
                     .cam_en            (ic_cam_en_row2[3:0]),   // Templated 
                     .inv_mask0         (ic_inv_mask_89cd[7:0]), // Templated 
                     .inv_mask1         (ic_inv_mask_89cd[7:0]), // Templated 
                     .inv_mask2         (ic_inv_mask_89cd[7:0]), // Templated 
                     .inv_mask3         (ic_inv_mask_89cd[7:0]), // Templated 
                     .tcu_se_scancollar_in          (tcu_se_scancollar_in),                // Templated 
                     .rd_en             (ic_rd_en_row2[3:0]),    // Templated 
                     .rw_addr0          (ic_rw_addr_89cd[5:0]),  // Templated, BS and SR 11/18/03 Reverse Directory change 
                     .rw_addr1          (ic_rw_addr_89cd[5:0]),  // Templated, BS and SR 11/18/03 Reverse Directory change 
                     .rw_addr2          (ic_rw_addr_89cd[5:0]),  // Templated, BS and SR 11/18/03 Reverse Directory change 
                     .rw_addr3          (ic_rw_addr_89cd[5:0]),  // Templated, BS and SR 11/18/03 Reverse Directory change 
                     .rst_warm_0        (ic_warm_rst_89cd),      // Templated 
                     .rst_warm_1        (ic_warm_rst_89cd),      // Templated 
                     .wr_en             (ic_wr_en_row2[3:0]),    // Templated 
                     .tcu_array_wr_inhibit		(array_wr_inhibit),     // Templated 
                     .wr_data0          (ic_lkup_wr_data_c4_row2[15:0]),    // Templated 
                     .wr_data1          (ic_lkup_wr_data_c4_row2[15:0]),    // Templated 
                     .wr_data2          (ic_lkup_wr_data_c4_row2[15:0]),    // Templated 
                     .wr_data3          (ic_lkup_wr_data_c4_row2[15:0]));    // Templated 
 
 
 
/////////////////////////////////////////// 
// D$ directory starts here. 
/////////////////////////////////////////// 
 
// panels 0,1,2,3  
n2_com_cm_64x64_cust		dc_row0	( 
                        .scan_in(dc_row0_scanin),
                        .scan_out(dc_row0_scanout),
                        .l2clk             (l2clk), 
 
			/*AUTOINST*/ 
                     // Outputs 
                     .row_hit           (dc_cam_hit[63:0]),      // Templated 
                     .rd_data0          (dc_rd_data04_row0[15:0]), // Templated,BS and SR 11/18/03 Reverse Directory change 
                     .rd_data1          (dc_rd_data15_row0[15:0]), // Templated,BS and SR 11/18/03 Reverse Directory change 
                     .rd_data2          (dc_rd_data26_row0[15:0]), // Templated,BS and SR 11/18/03 Reverse Directory change 
                     .rd_data3          (dc_rd_data37_row0[15:0]), // Templated,BS and SR 11/18/03 Reverse Directory change 
                    // Inputs 
                     .tcu_pce_ov	(ce_ovrd),
                     .pce		(1'b1),
                     .tcu_aclk		(aclk),
                     .tcu_bclk		(bclk),
		     .tcu_scan_en	(tcu_scan_en),
                     .tcu_array_bypass  (tcu_array_bypass),
		     .force_hit		({4{dc_force_hit_row0_c4}}),
                     .cam_en            (dc_cam_en_row0[3:0]),   // Templated 
                     .inv_mask0         (dc_inv_mask_0145[7:0]), // Templated 
                     .inv_mask1         (dc_inv_mask_0145[7:0]), // Templated 
                     .inv_mask2         (dc_inv_mask_0145[7:0]), // Templated 
                     .inv_mask3         (dc_inv_mask_0145[7:0]), // Templated 
                     .tcu_se_scancollar_in          (tcu_se_scancollar_in),                // Templated 
                     .rd_en             (dc_rd_en_row0[3:0]),    // Templated 
                     .rw_addr0          (dc_rw_addr_0145[5:0]),  // Templated,BS and SR 11/18/03 Reverse Directory change 
                     .rw_addr1          (dc_rw_addr_0145[5:0]),  // Templated,BS and SR 11/18/03 Reverse Directory change 
                     .rw_addr2          (dc_rw_addr_0145[5:0]),  // Templated,BS and SR 11/18/03 Reverse Directory change 
                     .rw_addr3          (dc_rw_addr_0145[5:0]),  // Templated,BS and SR 11/18/03 Reverse Directory change 
                     .rst_warm_0        (dc_warm_rst_0145),      // Templated 
                     .rst_warm_1        (dc_warm_rst_0145),      // Templated 
                     .wr_en             (dc_wr_en_row0[3:0]),    // Templated 
	.tcu_array_wr_inhibit		(array_wr_inhibit),     // Templated 
                     .wr_data0          (dc_lkup_wr_data_c4_row0[15:0]),    // Templated 
                     .wr_data1          (dc_lkup_wr_data_c4_row0[15:0]),    // Templated 
                     .wr_data2          (dc_lkup_wr_data_c4_row0[15:0]),    // Templated 
                     .wr_data3          (dc_lkup_wr_data_c4_row0[15:0]));    // Templated 
		 
			 
 
 
l2t_dirout_dp	      dc_out_col0	(	 
          .tcu_pce_ov(ce_ovrd),
          .tcu_aclk(aclk),
          .tcu_bclk(bclk),
	  .tcu_scan_en(tcu_scan_en),
	  .tcu_clk_stop(1'b0),
          .scan_in(dc_out_col0_scanin),
          .scan_out(dc_out_col0_scanout),
          .l2clk             (l2clk), 
          // Outputs 
          .dirout_parity_vld_out(dc_out_col0parity_vld_out_unused[2:0]),              // Templated 
          .dirout_parity_vld(dc_parity_in[0]),   // Templated 
          // Inputs 
	.mbist_read_data_pick_top	(l2t_mb0_dcrow_row_en[0]),
	.mbist_read_data_pick_bottom	(l2t_mb0_dcrow_row_en[1]),
	.mbist_lkup_wrdata		(l2t_mb0_lookup_wdata[15:0]),
	.l2t_mb0_run			(l2t_mb0_run),
	.cam_read_fail			(dc_cam_read_fail[0]),
	.mbist_dc_ic_read_en		({dc_rd_en_row0[0],dc_rd_en_row2[0]}),
          .rddata_out_c52_top(dc_rd_data04_row0[15:0]), // Templated, BS and SR 11/18/03 Reverse Directory change 
          .rddata_out_c52_bottom(dc_rd_data8c_row2[15:0]), // Templated, BS and SR 11/18/03 Reverse Directory change 
          .rd_data_sel_c52_top(dc_row0_select_panel0), // Templated 
          .rd_data_sel_c52_bottom(dc_row1_select_panel0), // Templated 
          .parity_vld_in(3'b0));           // Templated 
 
l2t_dirout_dp	      dc_out_col1	(	 
        .tcu_pce_ov(ce_ovrd),
        .tcu_aclk(aclk),
        .tcu_bclk(bclk),
	.tcu_scan_en(tcu_scan_en),
	.tcu_clk_stop(1'b0),
        .scan_in(dc_out_col1_scanin),
        .scan_out(dc_out_col1_scanout),
        .l2clk             (l2clk), 
        // Outputs 
        .dirout_parity_vld_out(dc_out_col1parity_vld_out_unused[2:0]),              // Templated 
        .dirout_parity_vld(dc_parity_in[1]),   // Templated 
        // Inputs 
	.mbist_read_data_pick_top	(l2t_mb0_dcrow_row_en[0]),
	.mbist_read_data_pick_bottom	(l2t_mb0_dcrow_row_en[1]),
	.mbist_lkup_wrdata		(l2t_mb0_lookup_wdata[15:0]),
	.l2t_mb0_run			(l2t_mb0_run),
	.cam_read_fail			(dc_cam_read_fail[1]),
	.mbist_dc_ic_read_en		({dc_rd_en_row0[1],dc_rd_en_row2[1]}),
        .rddata_out_c52_top(dc_rd_data15_row0[15:0]), // Templated,BS and SR 11/18/03 Reverse Directory change 
        .rddata_out_c52_bottom(dc_rd_data9d_row2[15:0]), // Templated,BS and SR 11/18/03 Reverse Directory change 
        .rd_data_sel_c52_top(dc_row0_select_panel1), // Templated 
        .rd_data_sel_c52_bottom(dc_row1_select_panel1), // Templated 
        .parity_vld_in(3'b0));           // Templated 
 
l2t_dirout_dp	      dc_out_col2	( 
        .tcu_pce_ov(ce_ovrd),
        .tcu_aclk(aclk),
        .tcu_bclk(bclk),
	.tcu_scan_en(tcu_scan_en),
	.tcu_clk_stop(1'b0),
        .scan_in(dc_out_col2_scanin),
        .scan_out(dc_out_col2_scanout),
        .l2clk             (l2clk), 
        // Outputs 
        .dirout_parity_vld_out(dc_out_col2parity_vld_out_unused[2:0]),              // Templated 
        .dirout_parity_vld(dc_parity_in[2]),   // Templated 
        // Inputs 
	.mbist_read_data_pick_top	(l2t_mb0_dcrow_row_en[0]),
	.mbist_read_data_pick_bottom	(l2t_mb0_dcrow_row_en[1]),
	.mbist_lkup_wrdata		(l2t_mb0_lookup_wdata[15:0]),
	.l2t_mb0_run			(l2t_mb0_run),
	.cam_read_fail			(dc_cam_read_fail[2]),
	.mbist_dc_ic_read_en		({dc_rd_en_row0[2],dc_rd_en_row2[2]}),
        .rddata_out_c52_top(dc_rd_data26_row0[15:0]), // Templated,BS and SR 11/18/03 Reverse Directory change 
        .rddata_out_c52_bottom(dc_rd_dataae_row2[15:0]), // Templated,BS and SR 11/18/03 Reverse Directory change 
        .rd_data_sel_c52_top(dc_row0_select_panel2), // Templated 
        .rd_data_sel_c52_bottom(dc_row1_select_panel2), // Templated 
        .parity_vld_in(3'b0));           // Templated 
 
l2t_dirout_dp	      dc_out_col3	( 
        .tcu_pce_ov(ce_ovrd),
        .tcu_aclk(aclk),
        .tcu_bclk(bclk),
	.tcu_scan_en(tcu_scan_en),
	.tcu_clk_stop(1'b0),
        .scan_in(dc_out_col3_scanin),
        .scan_out(dc_out_col3_scanout),
        .l2clk             (l2clk), 
 
        // Outputs 
        .dirout_parity_vld_out(dc_parity_out[3:1]), // Templated 
        .dirout_parity_vld(dc_parity_out[0]),  // Templated 
        // Inputs 
	.mbist_read_data_pick_top	(l2t_mb0_dcrow_row_en[0]),
	.mbist_read_data_pick_bottom	(l2t_mb0_dcrow_row_en[1]),
	.mbist_lkup_wrdata		(l2t_mb0_lookup_wdata[15:0]),
	.l2t_mb0_run			(l2t_mb0_run),
	.cam_read_fail			(dc_cam_read_fail[3]),
	.mbist_dc_ic_read_en		({dc_rd_en_row0[3],dc_rd_en_row2[3]}),
        .rddata_out_c52_top(dc_rd_data37_row0[15:0]), // Templated,BS and SR 11/18/03 Reverse Directory change 
        .rddata_out_c52_bottom(dc_rd_databf_row2[15:0]), // Templated,BS and SR 11/18/03 Reverse Directory change 
        .rd_data_sel_c52_top(dc_row0_select_panel3), // Templated 
        .rd_data_sel_c52_bottom(dc_row1_select_panel3), // Templated 
        .parity_vld_in(dc_parity_in[2:0])); // Templated 
 
 
 
 
l2t_dirtop_ctl		ic_row0_ctl
	(
	.scan_in(ic_row0_ctl_scanin),
	.scan_out(ic_row0_ctl_scanout),
	.l2clk			     		(l2clk),
	.tcu_pce_ov                   		(tcu_pce_ov),
	.tcu_aclk                     		(tcu_aclk),
	.tcu_bclk                     		(tcu_bclk),
	.tcu_scan_en                  		(tcu_scan_en),
	.l2t_mb0_run                  		(l2t_mb0_run),
	.l2t_mb0_mask                 		(l2t_mb0_mask[7:0]),
	.l2t_mb0_addr                 		(l2t_mb0_addr[5:0]),
	.l2t_mb0_row_panel_en         		(l2t_mb0_icrow_panel_en[3:0]),
	.l2t_mb0_row_row_en           		(l2t_mb0_icrow_row_en[0]),
	.l2t_mb0_row_lookup_en        		(l2t_mb0_icrow_lookup_en[3:0]),
	.l2t_mb0_lookup_wdata         		(l2t_mb0_lookup_wdata[15:0]),
	.l2t_mb0_row_wr_en            		(l2t_mb0_icrow_wr_en),
	.l2t_mb0_row_rd_en            		(l2t_mb0_icrow_rd_en),
	.ic_dc_dir                    		(1'b1),
	.arb_force_hit_c4             		(arb_ic_evict_c4),
	.arbadr_arbdp_addr4_c4        		(arbadr_arbdp_addr4_c4),
	.dirrep_rd_en_c4              		(dirrep_ic_rd_en_c4),
	.dirrep_wr_en_c4              		(dirrep_ic_wr_en_c4),
	.addr_index_bit5              		(arbadr_arbdp_index_ic_addr4_c4),
	.dirrep_inval_mask_c4         		(dirrep_inval_mask_icd_c4[7:0]),
	.dirrep_rdwr_row_en_c4        		(dirrep_ic_rdwr_row_en_c4[1:0]),
	.dirrep_lkup_row_dec_c4        		(dirrep_ic_lkup_row_dec_c4[1:0]),
	.dirrep_lkup_panel_dec_c4		(dirrep_ic_lkup_panel_dec_c4[3:0]),
	.dirrep_rdwr_panel_dec_c4     		(dirrep_ic_rdwr_panel_dec_c4[3:0]),
	.dirrep_rw_entry_c4           		({arbadr_arbdp_ic_addr4_c4,
				                  dirrep_wr_ic_dir_entry_c4[4:0]}),
	.lkup_wr_data_c4              		({dirrep_dir_vld_c4_l,
				                  dirrep_dir_wr_par_c4,
                            			  tagd_lkup_ic_addr_c4[17:9],
						  tag_dir_l2way_sel_c4[3:0]}),
	.dir_clear_c4                 		(dirrep_ic_dir_clear_c4),
	.dir_rd_data_en_c4            		(ic_rd_en_row0[3:0]),
	.dir_wr_data_en_c4            		(ic_wr_en_row0[3:0]),
	.dir_cam_en_c4                		(ic_cam_en_row0[3:0]),
	.dir_rw_entry_c4              		(ic_rw_addr_0145[5:0]),
	.dir_inval_mask_c4            		(ic_inv_mask_0145[7:0]),
	.dir_warm_rst_c4              		(ic_warm_rst_0145),
	.dirlbf_lkup_wr_data_c4_buf   		(ic_lkup_wr_data_c4_row0[15:0]),
	.dirlbf_force_hit_c4          		(ic_force_hit_row0_c4),
	.select_panel0                		(ic_row0_select_panel0),
	.select_panel1                		(ic_row0_select_panel1),
	.select_panel2                		(ic_row0_select_panel2),
	.select_panel3                		(ic_row0_select_panel3)
	);

l2t_dirtop_ctl          ic_row2_ctl
        (
        .scan_in(ic_row2_ctl_scanin),
        .scan_out(ic_row2_ctl_scanout),
        .l2clk                                  (l2clk),
        .tcu_pce_ov                             (tcu_pce_ov),
        .tcu_aclk                               (tcu_aclk),
        .tcu_bclk                               (tcu_bclk),
        .tcu_scan_en                            (tcu_scan_en),
        .l2t_mb0_run                            (l2t_mb0_run),
        .l2t_mb0_mask                           (l2t_mb0_mask[7:0]),
        .l2t_mb0_addr                           (l2t_mb0_addr[5:0]),
        .l2t_mb0_row_panel_en                   (l2t_mb0_icrow_panel_en[3:0]),
        .l2t_mb0_row_row_en                     (l2t_mb0_icrow_row_en[1]),
        .l2t_mb0_row_lookup_en                  (l2t_mb0_icrow_lookup_en[3:0]),
        .l2t_mb0_lookup_wdata                   (l2t_mb0_lookup_wdata[15:0]),
        .l2t_mb0_row_wr_en                      (l2t_mb0_icrow_wr_en),
        .l2t_mb0_row_rd_en                      (l2t_mb0_icrow_rd_en),
        .ic_dc_dir                              (1'b1),
        .arb_force_hit_c4                       (arb_ic_evict_c4),
        .arbadr_arbdp_addr4_c4                  (arbadr_arbdp_addr4_c4),
        .dirrep_rd_en_c4                        (dirrep_ic_rd_en_c4),
        .dirrep_wr_en_c4                        (dirrep_ic_wr_en_c4),
        .addr_index_bit5                        (arbadr_arbdp_index_ic_addr4_c4),
        .dirrep_inval_mask_c4                   (dirrep_inval_mask_icd_c4[7:0]),
        .dirrep_rdwr_row_en_c4                  (dirrep_ic_rdwr_row_en_c4[3:2]),
	.dirrep_lkup_row_dec_c4        		(dirrep_ic_lkup_row_dec_c4[3:2]),
	.dirrep_lkup_panel_dec_c4		(dirrep_ic_lkup_panel_dec_c4[3:0]),
        .dirrep_rdwr_panel_dec_c4               (dirrep_ic_rdwr_panel_dec_c4[3:0]),
        .dirrep_rw_entry_c4                     ({arbadr_arbdp_ic_addr4_c4,
						dirrep_wr_ic_dir_entry_c4[4:0]}),
        .lkup_wr_data_c4                        ({dirrep_dir_vld_c4_l,
						dirrep_dir_wr_par_c4,
                             			tagd_lkup_ic_addr_c4[17:9],
						tag_dir_l2way_sel_c4[3:0]}),
        .dir_clear_c4                           (dirrep_ic_dir_clear_c4),
        .dir_rd_data_en_c4                      (ic_rd_en_row2[3:0]),
        .dir_wr_data_en_c4                      (ic_wr_en_row2[3:0]),
        .dir_cam_en_c4                          (ic_cam_en_row2[3:0]),
        .dir_rw_entry_c4                        (ic_rw_addr_89cd[5:0]),
        .dir_inval_mask_c4                      (ic_inv_mask_89cd[7:0]),
        .dir_warm_rst_c4                        (ic_warm_rst_89cd),
        .dirlbf_lkup_wr_data_c4_buf             (ic_lkup_wr_data_c4_row2[15:0]),
        .dirlbf_force_hit_c4                    (ic_force_hit_row2_c4),
        .select_panel0                          (ic_row1_select_panel0),
        .select_panel1                          (ic_row1_select_panel1),
        .select_panel2                          (ic_row1_select_panel2),
        .select_panel3                          (ic_row1_select_panel3)
        );


l2t_dirtop_ctl          dc_row0_ctl
        (
        .scan_in(dc_row0_ctl_scanin),
        .scan_out(dc_row0_ctl_scanout),
        .l2clk                                  (l2clk),
        .tcu_pce_ov                             (tcu_pce_ov),
        .tcu_aclk                               (tcu_aclk),
        .tcu_bclk                               (tcu_bclk),
        .tcu_scan_en                            (tcu_scan_en),
        .l2t_mb0_run                            (l2t_mb0_run),
        .l2t_mb0_mask                           (l2t_mb0_mask[7:0]),
        .l2t_mb0_addr                           (l2t_mb0_addr[5:0]),
        .l2t_mb0_row_panel_en                   (l2t_mb0_dcrow_panel_en[3:0]),
        .l2t_mb0_row_row_en                     (l2t_mb0_dcrow_row_en[0]),
        .l2t_mb0_row_lookup_en                  (l2t_mb0_dcrow_lookup_en[3:0]),
        .l2t_mb0_lookup_wdata                   (l2t_mb0_lookup_wdata[15:0]),
        .l2t_mb0_row_wr_en                      (l2t_mb0_dcrow_wr_en),
        .l2t_mb0_row_rd_en                      (l2t_mb0_dcrow_rd_en),
        .ic_dc_dir                              (1'b0),
        .arb_force_hit_c4                       (arb_dc_evict_c4),
        .arbadr_arbdp_addr4_c4                  (arbadr_arbdp_addr4_c4),
        .dirrep_rd_en_c4                        (dirrep_dc_rd_en_c4),
        .dirrep_wr_en_c4                        (dirrep_dc_wr_en_c4),
        .addr_index_bit5                        (arbadr_arbdp_index_dc_addr4_c4),
        .dirrep_inval_mask_c4                   (dirrep_inval_mask_dcd_c4[7:0]),
        .dirrep_rdwr_row_en_c4                  (dirrep_dc_rdwr_row_en_c4[1:0]),
	.dirrep_lkup_row_dec_c4        		(dirrep_dc_lkup_row_dec_c4[1:0]),
	.dirrep_lkup_panel_dec_c4		(dirrep_dc_lkup_panel_dec_c4[3:0]),
        .dirrep_rdwr_panel_dec_c4               (dirrep_dc_rdwr_panel_dec_c4[3:0]),
        .dirrep_rw_entry_c4                     ({arbadr_arbdp_dc_addr4_c4,dirrep_wr_dc_dir_entry_c4[4:0]}),
        .lkup_wr_data_c4                        ({dirrep_dir_vld_c4_l,dirrep_dir_wr_par_c4,
                           tagd_lkup_dc_addr_c4[17:9],tag_dir_l2way_sel_c4[3:0]}),
        .dir_clear_c4                           (dirrep_dc_dir_clear_c4),
        .dir_rd_data_en_c4                      (dc_rd_en_row0[3:0]),
        .dir_wr_data_en_c4                      (dc_wr_en_row0[3:0]),
        .dir_cam_en_c4                          (dc_cam_en_row0[3:0]),
        .dir_rw_entry_c4                        (dc_rw_addr_0145[5:0]),
        .dir_inval_mask_c4                      (dc_inv_mask_0145[7:0]),
        .dir_warm_rst_c4                        (dc_warm_rst_0145),
        .dirlbf_lkup_wr_data_c4_buf             (dc_lkup_wr_data_c4_row0[15:0]),
        .dirlbf_force_hit_c4                    (dc_force_hit_row0_c4),
        .select_panel0                          (dc_row0_select_panel0),
        .select_panel1                          (dc_row0_select_panel1),
        .select_panel2                          (dc_row0_select_panel2),
        .select_panel3                          (dc_row0_select_panel3)
        );


l2t_dirtop_ctl          dc_row2_ctl
        (
        .scan_in(dc_row2_ctl_scanin),
        .scan_out(dc_row2_ctl_scanout),
        .l2clk                                  (l2clk),
        .tcu_pce_ov                             (tcu_pce_ov),
        .tcu_aclk                               (tcu_aclk),
        .tcu_bclk                               (tcu_bclk),
        .tcu_scan_en                            (tcu_scan_en),
        .l2t_mb0_run                            (l2t_mb0_run),
        .l2t_mb0_mask                           (l2t_mb0_mask[7:0]),
        .l2t_mb0_addr                           (l2t_mb0_addr[5:0]),
        .l2t_mb0_row_panel_en                   (l2t_mb0_dcrow_panel_en[3:0]),
        .l2t_mb0_row_row_en                     (l2t_mb0_dcrow_row_en[1]),
        .l2t_mb0_row_lookup_en                  (l2t_mb0_dcrow_lookup_en[3:0]),
        .l2t_mb0_lookup_wdata                   (l2t_mb0_lookup_wdata[15:0]),
        .l2t_mb0_row_wr_en                      (l2t_mb0_dcrow_wr_en),
        .l2t_mb0_row_rd_en                      (l2t_mb0_dcrow_rd_en),
        .ic_dc_dir                              (1'b0),
        .arb_force_hit_c4                       (arb_dc_evict_c4),
        .arbadr_arbdp_addr4_c4                  (arbadr_arbdp_addr4_c4),
        .dirrep_rd_en_c4                        (dirrep_dc_rd_en_c4),
        .dirrep_wr_en_c4                        (dirrep_dc_wr_en_c4),
        .addr_index_bit5                        (arbadr_arbdp_index_dc_addr4_c4),
        .dirrep_inval_mask_c4                   (dirrep_inval_mask_dcd_c4[7:0]),
        .dirrep_rdwr_row_en_c4                  (dirrep_dc_rdwr_row_en_c4[3:2]),
	.dirrep_lkup_row_dec_c4        		(dirrep_dc_lkup_row_dec_c4[3:2]),
	.dirrep_lkup_panel_dec_c4		(dirrep_dc_lkup_panel_dec_c4[3:0]),
        .dirrep_rdwr_panel_dec_c4               (dirrep_dc_rdwr_panel_dec_c4[3:0]),
        .dirrep_rw_entry_c4                     ({arbadr_arbdp_dc_addr4_c4,
						 dirrep_wr_dc_dir_entry_c4[4:0]}),
        .lkup_wr_data_c4                        ({dirrep_dir_vld_c4_l,dirrep_dir_wr_par_c4,
                               			  tagd_lkup_dc_addr_c4[17:9],
					          tag_dir_l2way_sel_c4[3:0]}),
        .dir_clear_c4                           (dirrep_dc_dir_clear_c4),
        .dir_rd_data_en_c4                      (dc_rd_en_row2[3:0]),
        .dir_wr_data_en_c4                      (dc_wr_en_row2[3:0]),
        .dir_cam_en_c4                          (dc_cam_en_row2[3:0]),
        .dir_rw_entry_c4                        (dc_rw_addr_89cd[5:0]),
        .dir_inval_mask_c4                      (dc_inv_mask_89cd[7:0]),
        .dir_warm_rst_c4                        (dc_warm_rst_89cd),
        .dirlbf_lkup_wr_data_c4_buf             (dc_lkup_wr_data_c4_row2[15:0]),
        .dirlbf_force_hit_c4                    (dc_force_hit_row2_c4),
        .select_panel0                          (dc_row1_select_panel0),
        .select_panel1                          (dc_row1_select_panel1),
        .select_panel2                          (dc_row1_select_panel2),
        .select_panel3                          (dc_row1_select_panel3)
        );

// Second half 
n2_com_cm_64x64_cust	dc_row2	( 
                        .scan_in(dc_row2_scanin),
                        .scan_out(dc_row2_scanout),
                        .l2clk             (l2clk), 
 
			/*AUTOINST*/ 
                     // Outputs 
                     .row_hit           (dc_cam_hit[127:64]),     // Templated 
                     .rd_data0          (dc_rd_data8c_row2[15:0]), // Templated, BS and SR 11/18/03 Reverse Directory change 
                     .rd_data1          (dc_rd_data9d_row2[15:0]), // Templated, BS and SR 11/18/03 Reverse Directory change 
                     .rd_data2          (dc_rd_dataae_row2[15:0]), // Templated, BS and SR 11/18/03 Reverse Directory change 
                     .rd_data3          (dc_rd_databf_row2[15:0]), // Templated, BS and SR 11/18/03 Reverse Directory change 
                     // Inputs 
                     .tcu_pce_ov(ce_ovrd),
                     .pce		(1'b1),
                     .tcu_aclk(aclk),
                     .tcu_bclk(bclk),
		     .tcu_scan_en(tcu_scan_en),
                     .tcu_array_bypass (tcu_array_bypass),
		     .force_hit		({4{dc_force_hit_row2_c4}}),
                     .cam_en            (dc_cam_en_row2[3:0]),   // Templated 
                     .inv_mask0         (dc_inv_mask_89cd[7:0]), // Templated 
                     .inv_mask1         (dc_inv_mask_89cd[7:0]), // Templated 
                     .inv_mask2         (dc_inv_mask_89cd[7:0]), // Templated 
                     .inv_mask3         (dc_inv_mask_89cd[7:0]), // Templated 
                     .tcu_se_scancollar_in          (tcu_se_scancollar_in),                // Templated 
                     .rd_en             (dc_rd_en_row2[3:0]),    // Templated 
                     .rw_addr0          (dc_rw_addr_89cd[5:0]),  // Templated, BS and SR 11/18/03 Reverse Directory change 
                     .rw_addr1          (dc_rw_addr_89cd[5:0]),  // Templated, BS and SR 11/18/03 Reverse Directory change 
                     .rw_addr2          (dc_rw_addr_89cd[5:0]),  // Templated, BS and SR 11/18/03 Reverse Directory change 
                     .rw_addr3          (dc_rw_addr_89cd[5:0]),  // Templated, BS and SR 11/18/03 Reverse Directory change 
                     .rst_warm_0        (dc_warm_rst_89cd),      // Templated 
                     .rst_warm_1        (dc_warm_rst_89cd),      // Templated 
                     .wr_en             (dc_wr_en_row2[3:0]),    // Templated 
                     .tcu_array_wr_inhibit		(array_wr_inhibit),     // Templated 
                     .wr_data0          (dc_lkup_wr_data_c4_row2[15:0]),    // Templated 
                     .wr_data1          (dc_lkup_wr_data_c4_row2[15:0]),    // Templated 
                     .wr_data2          (dc_lkup_wr_data_c4_row2[15:0]),    // Templated 
                     .wr_data3          (dc_lkup_wr_data_c4_row2[15:0]));    // Templated 
 
 
			 
//////////////////////////////////////////////////////////////////////////////
//
//		REPEATERS 
//
////////////////////////////////////////////////////////////////////////////
l2t_rep_dp      repeater
        (
        .rep_in0        (l2t_rep_in0[23:0]),
        .rep_in1        (l2t_rep_in1[23:0]),
        .rep_in2        (l2t_rep_in2[23:0]),
        .rep_in3        (l2t_rep_in3[23:0]),
        .rep_in4        (l2t_rep_in4[23:0]),
        .rep_in5        (l2t_rep_in5[23:0]),
        .rep_in6        (l2t_rep_in6[23:0]),
        .rep_in7        (l2t_rep_in7[23:0]),
        .rep_in8        (l2t_rep_in8[23:0]),
        .rep_in9        (l2t_rep_in9[23:0]),
        .rep_in10       (l2t_rep_in10[23:0]),
        .rep_in11       (l2t_rep_in11[23:0]),
        .rep_in12       (l2t_rep_in12[23:0]),
        .rep_in13       (l2t_rep_in13[23:0]),
        .rep_in14       (l2t_rep_in14[23:0]),
        .rep_in15       (l2t_rep_in15[23:0]),
        .rep_in16       (l2t_rep_in16[23:0]),
        .rep_in17       (l2t_rep_in17[23:0]),
        .rep_in18       (l2t_rep_in18[23:0]),
        .rep_in19       (l2t_rep_in19[23:0]),
        .rep_out0       (l2t_rep_out0[23:0]),
        .rep_out1       (l2t_rep_out1[23:0]),
        .rep_out2       (l2t_rep_out2[23:0]),
        .rep_out3       (l2t_rep_out3[23:0]),
        .rep_out4       (l2t_rep_out4[23:0]),
        .rep_out5       (l2t_rep_out5[23:0]),
        .rep_out6       (l2t_rep_out6[23:0]),
        .rep_out7       (l2t_rep_out7[23:0]),
        .rep_out8       (l2t_rep_out8[23:0]),
        .rep_out9       (l2t_rep_out9[23:0]),
        .rep_out10      (l2t_rep_out10[23:0]),
        .rep_out11      (l2t_rep_out11[23:0]),
        .rep_out12      (l2t_rep_out12[23:0]),
        .rep_out13      (l2t_rep_out13[23:0]),
        .rep_out14      (l2t_rep_out14[23:0]),
        .rep_out15      (l2t_rep_out15[23:0]),
        .rep_out16      (l2t_rep_out16[23:0]),
        .rep_out17      (l2t_rep_out17[23:0]),
        .rep_out18      (l2t_rep_out18[23:0]),
        .rep_out19      (l2t_rep_out19[23:0])
        );

l2t_ffrpt_dp	left_ffrptr	
	(
	.data_in		(l2t_lstg_in[191:0]),
	.tcu_clk_stop           (1'b0),     
	.tcu_pce_ov             (tcu_pce_ov),       
	.tcu_scan_en            (tcu_scan_en),        
	.tcu_aclk               (tcu_aclk),
	.tcu_bclk               (tcu_bclk),
	.scan_in(left_ffrptr_scanin),
	.scan_out(left_ffrptr_scanout),
	.l2clk                  (l2clk),
	.data_out               (l2t_lstg_out[191:0])
	);

l2t_ffrpt_dp    right_ffrptr     
        (
        .data_in                (l2t_rstg_in[191:0]),
        .tcu_clk_stop           (1'b0), 
        .tcu_pce_ov             (tcu_pce_ov), 
        .tcu_scan_en            (tcu_scan_en), 
        .tcu_aclk               (tcu_aclk),
        .tcu_bclk               (tcu_bclk),
        .scan_in(right_ffrptr_scanin),
        .scan_out(right_ffrptr_scanout),
        .l2clk                  (l2clk),
        .data_out               (l2t_rstg_out[191:0])
        );

/////////////////////////////////////////////////////////////////////////////////
//    Manual repeaters for internal timing fixes
/////////////////////////////////////////////////////////////////////////////////


l2t_mrep16x8_dp     mrep_besides_tagl 
        (
        .rep_out0       (vlddir_vuad_valid_c2_rep1[15:0]),
        .rep_out1       ({tag_st_to_data_array_c3_rep1,tagdp_evict_c3_2_rep1,
			  tagdp_evict_c3_1_rep1,mrep_besides_tagl0_unused[12:0]}),
        .rep_out2       (mrep_besides_tagl1_unused[15:0]),
        .rep_out3       (mrep_besides_tagl2_unused[15:0]),
        .rep_out4       (mrep_besides_tagl3_unused[15:0]),
        .rep_out5       (mrep_besides_tagl4_unused[15:0]),
        .rep_out6       (mrep_besides_tagl5_unused[15:0]),
        .rep_out7       (mrep_besides_tagl6_unused[15:0]),
        .rep_in0        (vlddir_vuad_valid_c2[15:0]),
        .rep_in1        ({tag_st_to_data_array_c3,tagdp_evict_c3_2,
			   tagdp_evict_c3_1,13'b0}),
        .rep_in2        (16'b0),
        .rep_in3        (16'b0),
        .rep_in4        (16'b0),
        .rep_in5        (16'b0),
        .rep_in6        (16'b0),
        .rep_in7        (16'b0)
        );

l2t_mrep8x16_dp     mrep_besides_mbdata 
        (
        .rep_out0       (mrep_besides_mbdata1_unused[7:0]),
        .rep_out1       (mrep_besides_mbdata2_unused[7:0]),
        .rep_out2       (mrep_besides_mbdata3_unused[7:0]),
        .rep_out3       (mrep_besides_mbdata4_unused[7:0]),
        .rep_out4       (mrep_besides_mbdata5_unused[7:0]),
        .rep_out5       (mrep_besides_mbdata6_unused[7:0]),
        .rep_out6       (mrep_besides_mbdata7_unused[7:0]),
        .rep_out7       (tagdp_lru_way_sel_c3_rep20[7:0]),
        .rep_out8       (tagdp_lru_way_sel_c3_rep20[15:8]),
        .rep_out9       (tag_hit_way_vld_c3_rep20[7:0]),
        .rep_out10      (tag_hit_way_vld_c3_rep20[15:8]),
        .rep_out11      (tag_hit_way_vld_c3_rep2[7:0]),
        .rep_out12      (tag_hit_way_vld_c3_rep2[15:8]),
        .rep_out13      (tagdp_lru_way_sel_c3_rep2[7:0]),
        .rep_out14      (tagdp_lru_way_sel_c3_rep2[15:8]),
        .rep_out15      ({usaloc_vlddir_arb_vuad_ce_err_c3_rep1_v1,usaloc_vlddir_arb_vuad_ce_err_c3_rep1_v2,
				mrep_besides_mbdata15_unused[5:0]}),
        .rep_in0        (8'b0),
        .rep_in1        (8'b0),
        .rep_in2        (8'b0),
        .rep_in3        (8'b0),
        .rep_in4        (8'b0),
        .rep_in5        (8'b0),
        .rep_in6        (8'b0),
        .rep_in7        (tagdp_lru_way_sel_c3_rep1[7:0]),
        .rep_in8        (tagdp_lru_way_sel_c3_rep1[15:8]),
        .rep_in9        (tag_hit_way_vld_c3_rep1[7:0]),
        .rep_in10       (tag_hit_way_vld_c3_rep1[15:8]),
        .rep_in11       (tag_hit_way_vld_c3_rep1[7:0]),
        .rep_in12       (tag_hit_way_vld_c3_rep1[15:8]),
        .rep_in13       (tagdp_lru_way_sel_c3_rep1[7:0]),
        .rep_in14       (tagdp_lru_way_sel_c3_rep1[15:8]),
        .rep_in15       ({usaloc_vlddir_arb_vuad_ce_err_c3,usaloc_vlddir_arb_vuad_ce_err_c3,6'b0})
        );

l2t_mrep32x3_dp   mrep_arbdat_top
         ( 
         .rep_out0        (mrep_arbdat_top1_unused[31:0]),
         .rep_out1        (mrep_arbdat_top2_unused[31:0]),
         .rep_out2        (mrep_arbdat_top3_unused[31:0]),
         .rep_in0         (32'b0),
         .rep_in1         (32'b0),
         .rep_in2         (32'b0)
         );
 
l2t_mrep32x3_dp   mrep_arbdat_bot //1
         (
         .rep_out0        (mrep_arbdat_bot0_unused[31:0]),
         .rep_out1        (mrep_arbdat_bot1_unused[31:0]),
         .rep_out2        ({tagdp_lru_way_sel_c3_rep1[15:0],tag_hit_way_vld_c3_rep1[15:0]}),
         .rep_in0         (32'b0),
         .rep_in1         (32'b0),
         .rep_in2         ({tagdp_lru_way_sel_c3[15:0],tag_hit_way_vld_c3[15:0]})
         );


l2t_mrep32x3_dp   mrep_arbdec_top //1
         (
         .rep_out0        ({arb_fill_vld_c2_rep1,mb_data_read_data_rep[`MBD_ECC_HI_PLUS5:`MBD_ECC_HI_PLUS1],
			   mb_data_read_data_rep[`MBD_RQ_HI:`MBD_RQ_LO], mb_data_read_data_rep[`MBD_RSVD],
			   mrep_arbdec_top_1_unused[19:0]}),
         .rep_out1        (mrep_arbdec_top1_unused[31:0]),    
         .rep_out2        (mrep_arbdec_top2_unused[31:0]),
         .rep_in0         ({arb_fill_vld_c2,mb_data_read_data[`MBD_ECC_HI_PLUS5:`MBD_ECC_HI_PLUS1],
                                mb_data_read_data[`MBD_RQ_HI:`MBD_RQ_LO], mb_data_read_data[`MBD_RSVD],20'b0}), 
         .rep_in1         (32'b0),
         .rep_in2         (32'b0)
         );

l2t_mrep2x64_dp   mrep_besides_arbadr //1
         ( 
         .rep_out0        ({tag_rdma_gate_off_c2_rep1,mrep_besides_arbadr_out0_unused}),
         .rep_out1        ({filbuf_arb_tag_hit_frm_mb_c2_rep,filbuf_tag_tag_hit_frm_mb_c2_rep}),
         .rep_out2        (filbuf_tag_evict_way_c3_rep1[1:0]),
         .rep_out3        (filbuf_tag_evict_way_c3_rep1[3:2]),
         .rep_out4        ({tag_misbuf_rdma_reg_vld_c2_rep1a,tag_misbuf_rdma_reg_vld_c2_rep1b}),
         .rep_out5        ({arb_inst_vld_c1_v1,arb_inst_vld_c1_v2}),
         .rep_out6        ({mrep_besides_arbadr_unused,arb_inst_vld_c1_v3}),
         .rep_out7        ({filbuf_dis_cerr_c3_rep1,filbuf_dis_uerr_c3_rep1}),
         .rep_out8        (mrep_besides_arbadr11_unused[1:0]),
         .rep_out9        (mrep_besides_arbadr12_unused[1:0]),
         .rep_out10       (mrep_besides_arbadr13_unused[1:0]),
         .rep_out11       (mrep_besides_arbadr14_unused[1:0]),
         .rep_out12       (mrep_besides_arbadr15_unused[1:0]),
         .rep_out13       (mrep_besides_arbadr16_unused[1:0]),
         .rep_out14       (mrep_besides_arbadr17_unused[1:0]),
         .rep_out15       (mrep_besides_arbadr18_unused[1:0]),
         .rep_out16       (mrep_besides_arbadr19_unused[1:0]),
         .rep_out17       (mrep_besides_arbadr20_unused[1:0]),
         .rep_out18       (mrep_besides_arbadr21_unused[1:0]),
         .rep_out19       (mrep_besides_arbadr22_unused[1:0]),
         .rep_out20       (mrep_besides_arbadr23_unused[1:0]),
         .rep_out21       (mrep_besides_arbadr24_unused[1:0]),
         .rep_out22       (mrep_besides_arbadr25_unused[1:0]),
         .rep_out23       (mrep_besides_arbadr26_unused[1:0]),
         .rep_out24       (mrep_besides_arbadr27_unused[1:0]),
         .rep_out25       (mrep_besides_arbadr28_unused[1:0]),
         .rep_out26       (mrep_besides_arbadr29_unused[1:0]),
         .rep_out27       (mrep_besides_arbadr30_unused[1:0]),
         .rep_out28       (mrep_besides_arbadr31_unused[1:0]),
         .rep_out29       (mrep_besides_arbadr32_unused[1:0]),
         .rep_out30       (mrep_besides_arbadr33_unused[1:0]),
         .rep_out31       (mrep_besides_arbadr34_unused[1:0]),
         .rep_out32       (mrep_besides_arbadr35_unused[1:0]),
         .rep_out33       (mrep_besides_arbadr36_unused[1:0]),
         .rep_out34       (mrep_besides_arbadr37_unused[1:0]),
         .rep_out35       (mrep_besides_arbadr38_unused[1:0]),
         .rep_out36       (mrep_besides_arbadr39_unused[1:0]),
         .rep_out37       (mrep_besides_arbadr40_unused[1:0]),
         .rep_out38       (mrep_besides_arbadr41_unused[1:0]),
         .rep_out39       (mrep_besides_arbadr42_unused[1:0]),
         .rep_out40       (mrep_besides_arbadr43_unused[1:0]),
         .rep_out41       (mrep_besides_arbadr44_unused[1:0]),
         .rep_out42       (mrep_besides_arbadr45_unused[1:0]),
         .rep_out43       (mrep_besides_arbadr46_unused[1:0]),
         .rep_out44       (mrep_besides_arbadr47_unused[1:0]),
         .rep_out45       (mrep_besides_arbadr48_unused[1:0]),
         .rep_out46       (mrep_besides_arbadr49_unused[1:0]),
         .rep_out47       (mrep_besides_arbadr50_unused[1:0]),
         .rep_out48       (mrep_besides_arbadr51_unused[1:0]),
         .rep_out49       (mrep_besides_arbadr52_unused[1:0]),
         .rep_out50       (mrep_besides_arbadr53_unused[1:0]),
         .rep_out51       (mrep_besides_arbadr54_unused[1:0]),
         .rep_out52       (mrep_besides_arbadr55_unused[1:0]),
         .rep_out53       (mrep_besides_arbadr56_unused[1:0]),
         .rep_out54       (mrep_besides_arbadr57_unused[1:0]),
         .rep_out55       (mrep_besides_arbadr58_unused[1:0]),
         .rep_out56       (mrep_besides_arbadr59_unused[1:0]),
         .rep_out57       (mrep_besides_arbadr60_unused[1:0]),
         .rep_out58       (mrep_besides_arbadr61_unused[1:0]),
         .rep_out59       (mrep_besides_arbadr62_unused[1:0]),
         .rep_out60       (mrep_besides_arbadr63_unused[1:0]),
         .rep_out61       (mrep_besides_arbadr64_unused[1:0]),
         .rep_out62       ({misbuf_tag_hit_unqual_c2_rep2,misbuf_notdata_err_c2_rep1}),
         .rep_out63       ({tag_miss_unqual_c2_rep1,misbuf_tag_hit_unqual_c2_rep1}),
         .rep_in0         ({tag_rdma_gate_off_c2,1'b0}),
         .rep_in1         ({filbuf_arb_tag_hit_frm_mb_c2,filbuf_arb_tag_hit_frm_mb_c2}),
         .rep_in2         (filbuf_tag_evict_way_c3[1:0]),
         .rep_in3         (filbuf_tag_evict_way_c3[3:2]),
         .rep_in4         ({tag_misbuf_rdma_reg_vld_c2,tag_misbuf_rdma_reg_vld_c2}),
         .rep_in5         ({arb_inst_vld_c1,arb_inst_vld_c1}),
         .rep_in6         ({1'b0,arb_inst_vld_c1}),
         .rep_in7         ({filbuf_dis_cerr_c3,filbuf_dis_uerr_c3}),
         .rep_in8         (2'b0),
         .rep_in9         (2'b0),
         .rep_in10         (2'b0),
         .rep_in11         (2'b0),
         .rep_in12         (2'b0),
         .rep_in13         (2'b0),
         .rep_in14         (2'b0),
         .rep_in15         (2'b0),
         .rep_in16         (2'b0),
         .rep_in17         (2'b0),
         .rep_in18         (2'b0),
         .rep_in19         (2'b0),
         .rep_in20         (2'b0),
         .rep_in21         (2'b0),
         .rep_in22         (2'b0),
         .rep_in23         (2'b0),
         .rep_in24         (2'b0),
         .rep_in25         (2'b0),
         .rep_in26         (2'b0),
         .rep_in27         (2'b0),
         .rep_in28         (2'b0),
         .rep_in29         (2'b0),
         .rep_in30         (2'b0),
         .rep_in31         (2'b0),
         .rep_in32         (2'b0),
         .rep_in33         (2'b0),
         .rep_in34         (2'b0),
         .rep_in35         (2'b0),
         .rep_in36         (2'b0),
         .rep_in37         (2'b0),
         .rep_in38         (2'b0),
         .rep_in39         (2'b0),
         .rep_in40         (2'b0),
         .rep_in41         (2'b0),
         .rep_in42         (2'b0),
         .rep_in43         (2'b0),
         .rep_in44         (2'b0),
         .rep_in45         (2'b0),
         .rep_in46         (2'b0),
         .rep_in47         (2'b0),
         .rep_in48         (2'b0),
         .rep_in49         (2'b0),
         .rep_in50         (2'b0),
         .rep_in51         (2'b0),
         .rep_in52         (2'b0),
         .rep_in53         (2'b0),
         .rep_in54         (2'b0),
         .rep_in55         (2'b0),
         .rep_in56         (2'b0),
         .rep_in57         (2'b0),
         .rep_in58         (2'b0),
         .rep_in59         (2'b0),
         .rep_in60         (2'b0),
         .rep_in61         (2'b0),
         .rep_in62         ({misbuf_tag_hit_unqual_c2,misbuf_notdata_err_c2}),
         .rep_in63         ({tag_miss_unqual_c2,misbuf_tag_hit_unqual_c2})
         );


l2t_mrep4x6_dp	mrep_for_dir
	(
	.rep_out0	({mrep_for_dir0_unused[2:0],tagd_lkup_ic_addr_c4[17]}),
	.rep_out1	(tagd_lkup_ic_addr_c4[16:13]),    
	.rep_out2	(tagd_lkup_ic_addr_c4[12:9]),      
	.rep_out3	({mrep_for_dir3_unused[2:0],tagd_lkup_dc_addr_c4[17]}),
	.rep_out4	(tagd_lkup_dc_addr_c4[16:13]),
	.rep_out5	(tagd_lkup_dc_addr_c4[12:9]),
	.rep_in0 	({3'b0,tagd_lkup_addr_c4[17]}),
	.rep_in1 	(tagd_lkup_addr_c4[16:13]),    
	.rep_in2 	(tagd_lkup_addr_c4[12:9]),      
	.rep_in3 	({3'b0,tagd_lkup_addr_c4[17]}),
	.rep_in4 	(tagd_lkup_addr_c4[16:13]),
	.rep_in5 	(tagd_lkup_addr_c4[12:9])
	);

////////////////////////////////////////////////////////////////////////////
//
//		MBIST CONTROLLERS
//
////////////////////////////////////////////////////////////////////////////

l2t_mb2_ctl		mb2_control	
	(
	.mb2_l2t_run			(l2t_mb2_run),
//	.mb2_l2t_cambist		(mb2_l2t_cambist),
	.mb2_l2t_addr			(l2t_mb2_addr[4:0]),
	.mb2_l2t_wdata			(l2t_mb2_wdata[7:0]),
	.mb2_l2t_mbtag_wr_en        	(l2t_mb2_mbtag_wr_en),
	.mb2_l2t_mbtag_rd_en        	(l2t_mb2_mbtag_rd_en),
	.mb2_l2t_mbtag_lookup_en    	(l2t_mb2_mbtag_lookup_en),
	.mb2_l2t_wk1_cam_init		(mb2_l2t_wk1_cam_init),
	.mb2_l2t_wk1_cam_shift		(mb2_l2t_wk1_cam_shift),
        .cam_mb2_cam_fail		({rdma_mbist_cam_hit,wb_mbist_cam_hit,
					  fb_mbist_cam_hit,mb_mbist_cam_hit}),
	.mb2_l2t_fbtag_wr_en            (l2t_mb2_fbtag_wr_en),
	.mb2_l2t_fbtag_rd_en            (l2t_mb2_fbtag_rd_en),
	.mb2_l2t_fbtag_lookup_en        (l2t_mb2_fbtag_lookup_en),
	.mb2_l2t_wbtag_wr_en            (l2t_mb2_wbtag_wr_en),
	.mb2_l2t_wbtag_rd_en            (l2t_mb2_wbtag_rd_en),
	.mb2_l2t_wbtag_lookup_en        (l2t_mb2_wbtag_lookup_en),
	.mb2_l2t_rdmatag_wr_en          (l2t_mb2_rdmatag_wr_en),
	.mb2_l2t_rdmatag_rd_en          (l2t_mb2_rdmatag_rd_en),
	.mb2_l2t_rdmatag_lookup_en      (l2t_mb2_rdmatag_lookup_en),
	.mb2_l2t_mbdata_wr_en           (l2t_mb2_mbdata_wr_en),
	.mb2_l2t_mbdata_rd_en           (l2t_mb2_mbdata_rd_en),
	.cam_mb2_rw_fail		(cam_mb2_rw_fail),	
	.mb2_cmp_sel			(mbdata_cmp_sel[3:0]),	
	.mbdata_mb2_rw_fail		(mbdata_fail),
	.mb2_l2t_iqarray_wr_en  	(l2t_mb2_iqarray_wr_en),
	.mb2_l2t_iqarray_rd_en  	(l2t_mb2_iqarray_rd_en),
	.iqarray_mb2_rw_fail		(iqu_fail_reg),
	.l2t_mb2_done           	(l2t_tcu_mbist2_done),
	.l2t_mb2_fail           	(l2t_tcu_mbist2_fail),
	.mbist_cam_sel			(mbist_cam_sel[3:0]),
	.scan_in(tcu_l2t_mbist_scan_in1),
	.scan_out(tcu_l2t_mbist_scan_in2),
	.l2clk         		        (l2clk),
	.tcu_pce_ov    		        (tcu_pce_ov),
	.tcu_aclk      		        (tcu_aclk),
	.tcu_bclk      		        (tcu_bclk),
	.tcu_scan_en      		(tcu_scan_en),
	.tcu_clk_stop			(1'b0),
	.mbist_start           		(mbist_start_mb2),
	.mbist_user_mode   		(tcu_mbist_user_mode),
	.mbist_bisi_mode		(tcu_mbist_bisi_en)
	);


l2t_mb0_ctl	mb0	(
	.mb0_l2t_run			(l2t_mb0_run),
	.mb0_l2t_cambist		(mb0_l2t_cambist),
	.mb0_l2t_addr			(l2t_mb0_addr[5:0]),
	.mb0_l2t_lookup_wdata 		(l2t_mb0_lookup_wdata[15:0]),
	.mb0_l2t_icrow_wr_en    	(l2t_mb0_icrow_wr_en),
	.mb0_l2t_icrow_rd_en    	(l2t_mb0_icrow_rd_en),
	.mb0_l2t_icrow_lookup_en	(l2t_mb0_icrow_lookup_en[3:0]),
	.mb0_l2t_icrow_row_en		(l2t_mb0_icrow_row_en[1:0]),
	.mb0_l2t_icrow_panel_en		(l2t_mb0_icrow_panel_en[3:0]),
	.mb0_l2t_mask			(l2t_mb0_mask[7:0]),
	.mb0_l2t_dcrow_wr_en    	(l2t_mb0_dcrow_wr_en),
	.mb0_l2t_dcrow_rd_en    	(l2t_mb0_dcrow_rd_en),
	.mb0_l2t_dcrow_lookup_en	(l2t_mb0_dcrow_lookup_en[3:0]),
	.mb0_l2t_dcrow_row_en		(l2t_mb0_dcrow_row_en[1:0]),
	.mb0_l2t_dcrow_panel_en		(l2t_mb0_dcrow_panel_en[3:0]),
	.mb0_l2t_oqarray_wr_en  	(l2t_mb0_oqarray_wr_en),
	.mb0_l2t_oqarray_rd_en  	(l2t_mb0_oqarray_rd_en),
	.mb0_l2t_done           	(l2t_tcu_mbist0_done),
	.mb0_l2t_fail           	(l2t_tcu_mbist0_fail),
	.mb0_l2t_cmpsel			(mbist_oqarray_sel[3:0]),
	.mb0_l2t_mbist_write_data	(mb0_l2t_mbist_write_data[7:0]),
	.ic_cam_fail			(ic_cam_fail[1:0]),
	.dc_cam_fail			(dc_cam_fail[1:0]),
	.dir_dc_rw_fail			(dc_cam_read_fail[3:0]),
	.dir_ic_rw_fail			(ic_cam_read_fail[3:0]),
	.oqarray_rw_fail		(oqarray_rw_fail),
	.scan_in(tcu_l2t_mbist_scan_in2),
	.scan_out(l2t_tcu_mbist_scan_out),
	.l2clk                  	(l2clk),
	.tcu_pce_ov             	(tcu_pce_ov),
	.tcu_clk_stop             	(1'b0),
	.tcu_aclk               	(tcu_aclk),
	.tcu_bclk               	(tcu_bclk),
	.tcu_scan_en            	(tcu_scan_en),
	.mbist_start            	(mbist_start_mb0),
	.mbist_user_mode    		(tcu_mbist_user_mode),
	.mbist_bisi_mode        	(tcu_mbist_bisi_en)
	);


//////////////////////////////////////////////////////////////////////////
//	EFU tag array related header logic
//////////////////////////////////////////////////////////////////////////

l2t_taghdr_ctl l2tag_sram_hdr
        (
        .efu_hdr_write_data        (efu_l2t_fuse_data),     
        .efu_hdr_xfer_en           (efu_l2t_fuse_xfer_en),   
        .efu_hdr_clr               (efu_l2t_fuse_clr), 
        .cmp_io_sync_en            (cmp_io_sync_en),
        .io_cmp_sync_en            (io_cmp_sync_en),
        .sram_hdr_read_data        ({1'b0,tag_fuse_read_data[5:0]}),
        .scan_in(l2tag_sram_hdr_scanin),
        .scan_out(l2tag_sram_hdr_scanout),
        .l2clk                     (l2clk), 
        .tcu_pce_ov                (tcu_pce_ov),
        .tcu_aclk                  (tcu_aclk),
        .tcu_bclk                  (tcu_bclk),
        .tcu_scan_en               (tcu_scan_en),
        .tcu_clk_stop              (1'b0),
        .hdr_efu_read_data         (l2t_efu_fuse_data),
        .hdr_efu_xfer_en           (l2t_efu_fuse_xfer_en),
        .hdr_sram_rvalue           (l2t_tag_rvalue[6:0]),
        .hdr_sram_rid              (l2t_tag_rid[3:0]),
        .hdr_sram_wr_en            (l2t_tag_wr_en),
        .hdr_sram_red_clr          (l2t_tag_fuse_clr)
        );

 
// fixscan start:
assign l2t_clk_header_scanin     = scan_in                  ;
assign vuad_scanin               = l2t_clk_header_scanout   ;
assign vuadpm_scanin             = vuad_scanout             ;
assign vlddir_scanin             = vuadpm_scanout           ;
assign usaloc_scanin             = vlddir_scanout           ;
assign tag_scanin                = usaloc_scanout           ;
assign tagl_1_scanin             = tag_scanout              ;
assign tagl_2_scanin             = tagl_1_scanout           ;
assign tagdp_scanin              = tagl_2_scanout           ;
assign tagd_scanin               = tagdp_scanout            ;
assign dmologic_scanin           = tagd_scanout             ;
assign tagctl_scanin             = dmologic_scanout         ;
assign misbuf_scanin             = tagctl_scanout           ;
assign mbdata_scanin             = misbuf_scanout           ;
assign mbtag_scanin              = mbdata_scanout           ;
assign filbuf_scanin             = mbtag_scanout            ;
assign fbtag_scanin              = filbuf_scanout           ;
assign arbdat_scanin             = fbtag_scanout            ;
assign arbadr_scanin             = arbdat_scanout           ;
assign arb_scanin                = arbadr_scanout           ;
assign arbdec_scanin             = arb_scanout              ;
assign wbuf_scanin               = arbdec_scanout           ;
assign wbtag_scanin              = wbuf_scanout             ;
assign ique_scanin               = wbtag_scanout            ;
assign iqu_scanin                = ique_scanout             ;
assign iqarray_scanin            = iqu_scanout              ;
assign oqu_scanin                = iqarray_scanout          ;
assign oqarray_scanin            = oqu_scanout              ;
assign oque_scanin               = oqarray_scanout          ;
assign dirvec_scanin             = oque_scanout             ;
assign deccck_scanin             = dirvec_scanout           ;
assign decc_scanin               = deccck_scanout           ;
assign csr_scanin                = decc_scanout             ;
assign csreg_scanin              = csr_scanout              ;
assign snp_scanin                = csreg_scanout            ;
assign snpd_scanin               = snp_scanout              ;
assign evctag_scanin             = snpd_scanout             ;
assign rdmatag_scanin            = evctag_scanout           ;
assign rdmat_scanin              = rdmatag_scanout          ;
assign dirrep_scanin             = rdmat_scanout            ;
assign subarray_0_scanin         = dirrep_scanout           ;
assign subarray_1_scanin         = subarray_0_scanout       ;
assign subarray_2_scanin         = subarray_1_scanout       ;
assign subarray_3_scanin         = subarray_2_scanout       ;
assign subarray_8_scanin         = subarray_3_scanout       ;
assign subarray_9_scanin         = subarray_8_scanout       ;
assign subarray_10_scanin        = subarray_9_scanout       ;
assign subarray_11_scanin        = subarray_10_scanout      ;
assign ic_row0_scanin            = subarray_11_scanout      ;
assign out_col0_scanin           = ic_row0_scanout          ;
assign out_col1_scanin           = out_col0_scanout         ;
assign out_col2_scanin           = out_col1_scanout         ;
assign out_col3_scanin           = out_col2_scanout         ;
assign ic_row2_scanin            = out_col3_scanout         ;
assign dc_row0_scanin            = ic_row2_scanout          ;
assign dc_out_col0_scanin        = dc_row0_scanout          ;
assign dc_out_col1_scanin        = dc_out_col0_scanout      ;
assign dc_out_col2_scanin        = dc_out_col1_scanout      ;
assign dc_out_col3_scanin        = dc_out_col2_scanout      ;
assign ic_row0_ctl_scanin        = dc_out_col3_scanout      ;
assign ic_row2_ctl_scanin        = ic_row0_ctl_scanout      ;
assign dc_row0_ctl_scanin        = ic_row2_ctl_scanout      ;
assign dc_row2_ctl_scanin        = dc_row0_ctl_scanout      ;
assign dc_row2_scanin            = dc_row2_ctl_scanout      ;
assign left_ffrptr_scanin        = dc_row2_scanout          ;
assign right_ffrptr_scanin       = left_ffrptr_scanout      ;
assign l2tag_sram_hdr_scanin     = right_ffrptr_scanout     ;
assign scan_out                  = l2tag_sram_hdr_scanout   ;
// fixscan end:
endmodule 

