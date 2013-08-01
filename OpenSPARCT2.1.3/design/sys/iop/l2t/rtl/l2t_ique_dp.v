// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_ique_dp.v
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



module l2t_ique_dp (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  tcu_muxtest, 
  tcu_dectest, 
  l2clk, 
  scan_in, 
  pcx_l2t_data_px2, 
  iqu_pcx_l2t_atm_px2_p, 
  iq_array_rd_data_c1, 
  iqu_sel_pcx, 
  iqu_sel_c1, 
  iqu_hold_rd_n, 
  iqu_sel_c1reg_over_iqarray, 
  l2t_mb2_wdata, 
  mbdata_cmp_sel, 
  iq_array_rd_en, 
  scan_out, 
  ique_iq_arbdp_data_px2, 
  ique_iq_arbdp_addr_px2, 
  ique_iq_arbdp_inst_px2, 
  ique_iq_arb_atm_px2, 
  ique_iq_arb_csr_px2, 
  ique_iq_arb_st_px2, 
  ique_iq_arb_vbit_px2, 
  ique_pcx_l2t_data_103_px2, 
  pcx_l2t_data_px2_fnl, 
  ique_arb_pf_ice_px2, 
  iqu_fail_reg);
wire stop;
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire muxtst;
wire test;
wire ff_pcx_l2t_data_c1_1_fnl_scanin;
wire ff_pcx_l2t_data_c1_1_fnl_scanout;
wire ff_pcx_l2t_data_c1_2_fnl_scanin;
wire ff_pcx_l2t_data_c1_2_fnl_scanout;
wire ique_pf_ice_px2;
wire pcx_l2t_data_103_px2_fnl;
wire ff_pcx_l2t_data_c1_1_scanin;
wire ff_pcx_l2t_data_c1_1_scanout;
wire ff_pcx_l2t_data_c1_2_scanin;
wire ff_pcx_l2t_data_c1_2_scanout;
wire iqu_fail;
wire iq_array_rd_en_r2_n;
wire iq_array_rd_en_r2;
wire iqu_sel_c1reg_over_iqarray_n;
wire [4:0] unused;
wire ff_iq_array_rd_data_c2_1_scanin;
wire ff_iq_array_rd_data_c2_1_scanout;
wire ff_iq_array_rd_data_c2_2_scanin;
wire ff_iq_array_rd_data_c2_2_scanout;
wire iqu_sel_c1_n;
wire iqu_sel_pcx_n;
wire csr_eq1_out;
wire inst_99_is_1;
wire store_check1_out;
wire store_check2_out;
wire bit_123_n;
wire store_eqn_2;
wire [31:0] iqu_rd_data;
wire ff_l2t_mb2_wdata_scanin;
wire ff_l2t_mb2_wdata_scanout;
wire [31:0] iqu_rd_data_reg;
wire [7:0] l2t_mb2_wdata_r2;
wire [7:0] l2t_mb2_wdata_r1;
wire iq_array_rd_en_r1;
wire iqu_fail_raw;
 
 
 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 input tcu_clk_stop;
 input tcu_muxtest;
 input tcu_dectest;
 
input           l2clk; 
input scan_in; 
input  [129:0]  pcx_l2t_data_px2;  // BS and SR 11/12/03 N2 Xbar Packet format change 
input           iqu_pcx_l2t_atm_px2_p; 
input  [130:0]  iq_array_rd_data_c1; // BS and SR 11/12/03 N2 Xbar Packet format change 
input           iqu_sel_pcx; 
input           iqu_sel_c1; 
input           iqu_hold_rd_n; 
input           iqu_sel_c1reg_over_iqarray; 
input  [7:0]    l2t_mb2_wdata; 
input	[3:0]	mbdata_cmp_sel;
input		iq_array_rd_en;
 
output 		scan_out; 
output [63:0]   ique_iq_arbdp_data_px2; 
output [39:0]   ique_iq_arbdp_addr_px2; 
output [24:0]   ique_iq_arbdp_inst_px2; // BS and SR 11/12/03 N2 Xbar Packet format change 
output          ique_iq_arb_atm_px2; 
output          ique_iq_arb_csr_px2; 
output          ique_iq_arb_st_px2; 
output		ique_iq_arb_vbit_px2; 
output          ique_pcx_l2t_data_103_px2; 
output  [129:0]  pcx_l2t_data_px2_fnl;  // 

//output		ique_pf_ice_px2;
output		ique_arb_pf_ice_px2;
output		iqu_fail_reg;

assign stop = tcu_clk_stop;
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
assign muxtst = tcu_muxtest;
assign test = tcu_dectest;


//assign scan_out = 1'b0;

wire   [130:0]  pcx_l2t_data_c1; // BS and SR 11/12/03 N2 Xbar Packet format change 
wire   [130:0]  tmp_iq_array_rd_data_c1; // BS and SR 11/12/03 N2 Xbar Packet format change 
wire   [130:0]  iq_array_rd_data_c2; // BS and SR 11/12/03 N2 Xbar Packet format change 
wire   [130:0]  mux_c1c2_rd_data;  // BS and SR 11/12/03 N2 Xbar Packet format change 
wire   [130:0]  inst; // BS and SR 11/12/03 N2 Xbar Packet format change 

// BS 06/24/04 : Support for Prefetch ICE
// In case PF and INV bits in pcx packet are both 1's , it is a Prefetch ICE packet.
// Have to force PA[39] or bit 103 of pcx packet to 1 in that case.
// PA[38:37] will be forced to 2'b11 by software itself. So overall PA[39:37] will be
// all 1's and Prefetch ICE will always miss in L2 tags irrespective of 8/4/2 bank
// mode of operation of N2. 
// PA[39:37] being all 1's means it wont be decoded as a CSR access also by L2.
// L2 decodes csr accesses only for PA[39:37] = 3'b101

//assign ique_pf_ice_px2 = (ique_iq_arbdp_inst_px2[24:20] == `LOAD_RQ) & 
//			ique_iq_arbdp_inst_px2[12] & ique_iq_arbdp_inst_px2[11]  ;


l2t_ique_dp_msff_macro__stack_66c__width_66 ff_pcx_l2t_data_c1_1_fnl 
	(
	.scan_in(ff_pcx_l2t_data_c1_1_fnl_scanin),
	.scan_out(ff_pcx_l2t_data_c1_1_fnl_scanout),
	.dout	({pcx_l2t_data_px2_fnl[65:0]}), 
        .din	({pcx_l2t_data_px2[65:0]}), 
        .clk	(l2clk), 
        .en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
        ); 

l2t_ique_dp_msff_macro__stack_66c__width_64 ff_pcx_l2t_data_c1_2_fnl  
         (
	.scan_in(ff_pcx_l2t_data_c1_2_fnl_scanin),
	.scan_out(ff_pcx_l2t_data_c1_2_fnl_scanout),
	.dout	(pcx_l2t_data_px2_fnl[129:66]),
	.din	(pcx_l2t_data_px2[129:66]),
         .clk    (l2clk),
         .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
         ); 


l2t_ique_dp_cmp_macro__dcmp_8x__width_8 cmp_ique_pf_ice_px2 
	(
	.dout	(ique_pf_ice_px2),
	.din0	({pcx_l2t_data_px2_fnl[128:124],pcx_l2t_data_px2_fnl[116:115],1'b0}),
	.din1	(8'b00000110)
	);

l2t_ique_dp_or_macro__ports_2__width_1 or_pa39_prf_ice 
        (
        .dout   (pcx_l2t_data_103_px2_fnl),
        .din0   (pcx_l2t_data_px2_fnl[103]),
        .din1   (ique_pf_ice_px2)
        );


l2t_ique_dp_buff_macro__dbuff_16x__width_1 buff_ique_pcx_l2t_data_103_px2 
	(
	.dout	( ique_pcx_l2t_data_103_px2 ),
	.din	( pcx_l2t_data_103_px2_fnl)
	);

l2t_ique_dp_msff_macro__stack_66c__width_66 ff_pcx_l2t_data_c1_1 
	(
	.scan_in(ff_pcx_l2t_data_c1_1_scanin),
	.scan_out(ff_pcx_l2t_data_c1_1_scanout),
	.dout	({pcx_l2t_data_c1[65:0]}), 
        .din	({pcx_l2t_data_px2_fnl[65:0]}), 
        .clk	(l2clk), 
        .en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
        ); 

l2t_ique_dp_msff_macro__stack_66c__width_66 ff_pcx_l2t_data_c1_2  
         (
	.scan_in(ff_pcx_l2t_data_c1_2_scanin),
	.scan_out(ff_pcx_l2t_data_c1_2_scanout),
	.dout	({iqu_fail_reg,pcx_l2t_data_c1[130:66]}),
	.din	({iqu_fail,iqu_pcx_l2t_atm_px2_p,pcx_l2t_data_px2_fnl[129:128],
		pcx_l2t_data_px2_fnl[127:104],pcx_l2t_data_103_px2_fnl,pcx_l2t_data_px2_fnl[102:66]}),
         .clk    (l2clk),
         .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
         ); 


l2t_ique_dp_inv_macro__dinv_16x__width_1 iqu_hold_rd_invert 
        (
        .dout   (iq_array_rd_en_r2_n),
        .din    (iq_array_rd_en_r2)
        );


l2t_ique_dp_inv_macro__dinv_16x__width_1 mux_iq_array_rd_data_c1_sel_invert  
        (
        .dout   (iqu_sel_c1reg_over_iqarray_n), 
        .din    (iqu_sel_c1reg_over_iqarray )  
        );
 
l2t_ique_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_66c__width_66 mux_iq_array_rd_data_c1_1 
        (
	.dout 	(tmp_iq_array_rd_data_c1[65:0]), 
        .din0  	(iq_array_rd_data_c1[65:0]),  
        .din1  	(pcx_l2t_data_c1[65:0]),    
	.sel0 	(iqu_sel_c1reg_over_iqarray_n), 
	.sel1 	(iqu_sel_c1reg_over_iqarray) 
        ); 

l2t_ique_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_66c__width_66 mux_iq_array_rd_data_c1_2  // BS and SR 11/12/03 N2 Xbar Packet format change
        (
        .dout   ({unused[0],tmp_iq_array_rd_data_c1[130:66]}),
        .din0   ({1'b0,iq_array_rd_data_c1[130:66]}),
        .din1   ({1'b0,pcx_l2t_data_c1[130:66]}),
        .sel0   (iqu_sel_c1reg_over_iqarray_n),
        .sel1   (iqu_sel_c1reg_over_iqarray)
        ) ;


l2t_ique_dp_msff_macro__stack_66c__width_66 ff_iq_array_rd_data_c2_1 
        (
	.scan_in(ff_iq_array_rd_data_c2_1_scanin),
	.scan_out(ff_iq_array_rd_data_c2_1_scanout),
	.dout	(iq_array_rd_data_c2[65:0]), 
	.din	(tmp_iq_array_rd_data_c1[65:0]), 
        .clk	(l2clk), 
        .en	(iqu_hold_rd_n),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        ) ; 

l2t_ique_dp_msff_macro__stack_66c__width_66 ff_iq_array_rd_data_c2_2  
        (
        .scan_in(ff_iq_array_rd_data_c2_2_scanin),
        .scan_out(ff_iq_array_rd_data_c2_2_scanout),
        .dout   ({unused[1],iq_array_rd_data_c2[130:66]}),
        .din    ({1'b0,tmp_iq_array_rd_data_c1[130:66]}),
        .clk    (l2clk),
        .en     (iqu_hold_rd_n),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


l2t_ique_dp_inv_macro__dinv_16x__width_1 u_mux_c1c2_rd_data_sel_invert  
	( 
	.dout	(iqu_sel_c1_n), 
	.din	(iqu_sel_c1 ) 
	);
 
l2t_ique_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_66c__width_66 u_mux_c1c2_rd_data_1 
        (
	.dout 	(mux_c1c2_rd_data[65:0]), 
        .din0  	(pcx_l2t_data_c1[65:0]),     
        .din1  	(iq_array_rd_data_c2[65:0]),   
	.sel0 	(iqu_sel_c1), 
	.sel1 	(iqu_sel_c1_n) 
        ) ; 

l2t_ique_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_66c__width_66 u_mux_c1c2_rd_data_2  // BS and SR 11/12/03 N2 Xbar Packet format change
                (
                .dout   ({unused[2],mux_c1c2_rd_data[130:66]}),
                .din0   ({1'b0,pcx_l2t_data_c1[130:66]}),    
                .din1   ({1'b0,iq_array_rd_data_c2[130:66]}),  
                .sel0   (iqu_sel_c1),
                .sel1   (iqu_sel_c1_n)
                ) ;

l2t_ique_dp_inv_macro__width_1 mux_inst_sel_invert  
        (
        .dout   (iqu_sel_pcx_n),
        .din    (iqu_sel_pcx )
        );


l2t_ique_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_66c__width_66 mux_inst_1 
	(
	.dout 	(inst[65:0]), 
	.din0  	(pcx_l2t_data_px2_fnl[65:0]),  
	.din1  	(mux_c1c2_rd_data[65:0]),      
	.sel0 	(iqu_sel_pcx),
	.sel1 	(iqu_sel_pcx_n)
       	); 
 
l2t_ique_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_66c__width_66 mux_inst_2  
       (
       .dout 	({unused[3],inst[130:66]}),
       .din0  	({1'b0,iqu_pcx_l2t_atm_px2_p,pcx_l2t_data_px2_fnl[129:104],
		  pcx_l2t_data_103_px2_fnl,pcx_l2t_data_px2_fnl[102:66]}),
       .din1  	({1'b0,mux_c1c2_rd_data[130:66]}),
       .sel0 	(iqu_sel_pcx)
       ) ;

l2t_ique_dp_cmp_macro__dcmp_8x__width_8 cmp_ique_pf_ice_fnl 
	(
	.dout	(ique_arb_pf_ice_px2),
	.din0	({inst[128:124],inst[116:115],1'b0}),
	.din1	(8'b00000110)
	);

 
//assign ique_iq_arbdp_data_px2  = inst[63:0] ; 
//assign ique_iq_arbdp_addr_px2  = inst[103:64] ; 
//assign ique_iq_arbdp_inst_px2  = inst[128:104] ; // BS and SR 11/12/03 N2 Xbar Packet format change 
//assign ique_iq_arb_vbit_px2 = inst[129]; // BS and SR 11/12/03 N2 Xbar Packet format change 
//assign ique_iq_arb_atm_px2  = inst[130] ;  // BS and SR 11/12/03 N2 Xbar Packet format change
//assign ique_iq_arb_csr_px2  = (inst[103:101] == 5'b101) & (inst[99] == 1'b1) ; 
// BS and SR 11/12/03 N2 Xbar Packet format change :
//assign ique_iq_arb_st_px2   = ( (inst[128:124] == 5'b00001)  |	// Store 
//				(( inst[128:124] == 5'b01101)  & 
//				   ~inst[123]) )  ;		// FWD_REQ with 
//								// R/Wbar == 0 
//

l2t_ique_dp_buff_macro__dbuff_32x__stack_66c__width_66 ique_arbdp_slice0 
        (
        .dout   ({ique_iq_arbdp_addr_px2[1:0],ique_iq_arbdp_data_px2[63:0]}),
        .din    (inst[65:0])
        );

//
//buff_macro ique_arbdp_slice1 (width=66,stack=66c,dbuff=32x)
//        (
//        .dout   ({unused_6,ique_iq_arb_atm_px2,ique_iq_arb_vbit_px2,
//		  ique_iq_arbdp_inst_px2[24:0],ique_iq_arbdp_addr_px2[39:2]}),
//        .din    ({1'b0,inst[130:66]})
//        );


assign {unused[4],ique_iq_arb_atm_px2,ique_iq_arb_vbit_px2,
                ique_iq_arbdp_inst_px2[24:0],ique_iq_arbdp_addr_px2[39:2]} = {1'b0,inst[130:66]};


l2t_ique_dp_cmp_macro__dcmp_8x__width_8 csr_check_eq1  
	( 
	.din0	({3'b0,5'b101}), 
	.din1	({5'b0,inst[103:101]}), 
	.dout	(csr_eq1_out) 
	); 

l2t_ique_dp_and_macro__width_1 inst_99_1  
	(
	.dout	(inst_99_is_1),
	.din0	(inst[99]),
	.din1	(1'b1)
	);

l2t_ique_dp_and_macro__width_1 csr_inst_decode  
        (
        .dout   (ique_iq_arb_csr_px2),
        .din0   (inst_99_is_1),
        .din1   (csr_eq1_out)
        );

l2t_ique_dp_cmp_macro__dcmp_8x__width_8 store_check_1 
        (
        .din0   ({3'b0,5'b00001}),
        .din1   ({3'b0,inst[128:124]}), //  BS and SR 11/12/03 N2 Xbar Packet format change
        .dout   (store_check1_out)
        );

l2t_ique_dp_cmp_macro__dcmp_8x__width_8 store_check_2 
        (
        .din0   ({3'b0,5'b01101}),
        .din1   ({3'b0,inst[128:124]}), //  BS and SR 11/12/03 N2 Xbar Packet format change
        .dout   (store_check2_out)
        ); 

l2t_ique_dp_inv_macro__dinv_16x__width_1 invert_bit_inst_123  //  BS and SR 11/12/03 N2 Xbar Packet format change 
	( 
	.dout	(bit_123_n), 
	.din	(inst[123] ) 
	);

l2t_ique_dp_and_macro__width_1 store_2_slice  (
	.dout	(store_eqn_2),
	.din0	(bit_123_n), //  BS and SR 11/12/03 N2 Xbar Packet format change
	.din1	(store_check2_out)
	);

l2t_ique_dp_or_macro__width_1 store2_slice  (
        .dout   (ique_iq_arb_st_px2),
        .din0   (store_eqn_2),
        .din1   (store_check1_out)
        );

///////  MBIST //////


l2t_ique_dp_mux_macro__dmux_16x__mux_pgpe__ports_4__width_32 mux_iq_array_rd_data_c1  // ATPG Clean up
	(
	.dout	(iqu_rd_data[31:0]),	
	.din0	(iq_array_rd_data_c1[31:0]),
	.din1	(iq_array_rd_data_c1[63:32]),
	.din2	(iq_array_rd_data_c1[95:64]),
	.din3	(iq_array_rd_data_c1[127:96]),
	.sel0   (mbdata_cmp_sel[0]),
        .sel1   (mbdata_cmp_sel[1]),
        .sel2   (mbdata_cmp_sel[2]),
  .muxtst(muxtst),
  .test(test)
        );

l2t_ique_dp_msff_macro__dmsff_32x__stack_66c__width_50 ff_l2t_mb2_wdata 
	(
	.scan_in(ff_l2t_mb2_wdata_scanin),
	.scan_out(ff_l2t_mb2_wdata_scanout),
	.dout	({iqu_rd_data_reg[31:0],
		  l2t_mb2_wdata_r2[7:0],
		  l2t_mb2_wdata_r1[7:0],
		  iq_array_rd_en_r1,
		  iq_array_rd_en_r2}),
	.din	({iqu_rd_data[31:0],
		  l2t_mb2_wdata_r1[7:0],
		  l2t_mb2_wdata[7:0],
		  iq_array_rd_en,
		  iq_array_rd_en_r1}),
	.clk	(l2clk),
	.en 	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

l2t_ique_dp_cmp_macro__dcmp_8x__width_32 cmp_iqu_data        
	(
        .dout   (iqu_fail_raw),
        .din0   ({4{l2t_mb2_wdata_r2[7:0]}}),
        .din1   (iqu_rd_data_reg[31:0])
        );

l2t_ique_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__width_1 mux_iqu_fail 
        (
        .dout   (iqu_fail),
        .din0   (iqu_fail_raw),
        .din1   (1'b1),
        .sel0   (iq_array_rd_en_r2),
        .sel1   (iq_array_rd_en_r2_n)
        );




// fixscan start:
assign ff_pcx_l2t_data_c1_1_fnl_scanin = scan_in                  ;
assign ff_pcx_l2t_data_c1_2_fnl_scanin = ff_pcx_l2t_data_c1_1_fnl_scanout;
assign ff_pcx_l2t_data_c1_1_scanin = ff_pcx_l2t_data_c1_2_fnl_scanout;
assign ff_pcx_l2t_data_c1_2_scanin = ff_pcx_l2t_data_c1_1_scanout;
assign ff_iq_array_rd_data_c2_1_scanin = ff_pcx_l2t_data_c1_2_scanout;
assign ff_iq_array_rd_data_c2_2_scanin = ff_iq_array_rd_data_c2_1_scanout;
assign ff_l2t_mb2_wdata_scanin   = ff_iq_array_rd_data_c2_2_scanout;
assign scan_out                  = ff_l2t_mb2_wdata_scanout ;
// fixscan end:
endmodule 






// any PARAMS parms go into naming of macro

module l2t_ique_dp_msff_macro__stack_66c__width_66 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [64:0] so;

  input [65:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [65:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(66)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[65:0]),
.si({scan_in,so[64:0]}),
.so({so[64:0],scan_out}),
.q(dout[65:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_ique_dp_msff_macro__stack_66c__width_64 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_ique_dp_cmp_macro__dcmp_8x__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output dout;






cmp #(8)  m0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout)
);










endmodule





//  
//   or macro for ports = 2,3
//
//





module l2t_ique_dp_or_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   buff macro
//
//





module l2t_ique_dp_buff_macro__dbuff_16x__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





//
//   invert macro
//
//





module l2t_ique_dp_inv_macro__dinv_16x__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_ique_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_66c__width_66 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [65:0] din0;
  input sel0;
  input [65:0] din1;
  input sel1;
  output [65:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(66)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[65:0]),
  .in1(din1[65:0]),
.dout(dout[65:0])
);









  



endmodule


//
//   invert macro
//
//





module l2t_ique_dp_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_ique_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_66c__width_66 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [65:0] din0;
  input [65:0] din1;
  input sel0;
  output [65:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(66)  d0_0 (
  .sel(psel1),
  .in0(din0[65:0]),
  .in1(din1[65:0]),
.dout(dout[65:0])
);









  



endmodule


//
//   buff macro
//
//





module l2t_ique_dp_buff_macro__dbuff_32x__stack_66c__width_66 (
  din, 
  dout);
  input [65:0] din;
  output [65:0] dout;






buff #(66)  d0_0 (
.in(din[65:0]),
.out(dout[65:0])
);








endmodule





//  
//   and macro for ports = 2,3,4
//
//





module l2t_ique_dp_and_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module l2t_ique_dp_or_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_ique_dp_mux_macro__dmux_16x__mux_pgpe__ports_4__width_32 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel0, 
  sel1, 
  sel2, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [31:0] din0;
  input [31:0] din1;
  input [31:0] din2;
  input [31:0] din3;
  input sel0;
  input sel1;
  input sel2;
  input muxtst;
  input test;
  output [31:0] dout;





cl_dp1_penc4_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
  .test(test)
);

mux4 #(32)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
.dout(dout[31:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_ique_dp_msff_macro__dmsff_32x__stack_66c__width_50 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [48:0] so;

  input [49:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [49:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(50)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[49:0]),
.si({scan_in,so[48:0]}),
.so({so[48:0],scan_out}),
.q(dout[49:0])
);




















endmodule









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_ique_dp_cmp_macro__dcmp_8x__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output dout;






cmp #(32)  m0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout)
);










endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_ique_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__width_1 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [0:0] din0;
  input sel0;
  input [0:0] din1;
  input sel1;
  output [0:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(1)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
.dout(dout[0:0])
);









  



endmodule

