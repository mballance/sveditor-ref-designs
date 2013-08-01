// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_oque_dp.v
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


 
 
 
module l2t_oque_dp (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  tcu_muxtest, 
  tcu_dectest, 
  rtn_err_field_c7, 
  arbdec_arbdp_inst_l1way_c7, 
  arbdec_arbdp_inst_tid_c7, 
  oqu_mmu_ld_hit_c7, 
  arbdec_arbdp_l1way_c3, 
  arbdec_arbdp_inst_nc_c7, 
  csr_report_ldrc, 
  arbdec_arbdp_inst_cpuid_c7, 
  oqu_rqtyp_rtn_c7, 
  dirvec_dirdp_way_info_c7, 
  oqu_strst_ack_c7, 
  arbdat_arbdp_oque_int_ret_c7, 
  oqu_fwd_req_ret_c7, 
  oqu_int_ack_c7, 
  arbadr_arbdp_oque_l1_index_c7, 
  oqu_imiss_hit_c8, 
  decc_ret_data_c7, 
  dirvec_dirdp_inval_pckt_c7, 
  st_ack_data, 
  sel_st_ack_c7, 
  decc_ret_diag_data_c7, 
  tagd_diag_data_c7, 
  vuadpm_vuad_diag_data_c7, 
  oq_array_data_out, 
  oqu_pf_ack_c7, 
  oqu_rmo_st_c7, 
  oqu_atm_inst_ack_c7, 
  oqu_diag_acc_c8, 
  oqu_mux1_sel_data_c7, 
  oqu_sel_array_out_l, 
  oqu_mux_csr_sel_c7, 
  oqu_sel_inval_c7, 
  oqu_out_mux1_sel_c7, 
  oqu_out_mux2_sel_c7, 
  arbadr_arbdp_line_addr_c7, 
  arb_dc_inval_vld_c7, 
  arb_ic_inval_vld_c7, 
  csr_rd_data_c8, 
  l2clk, 
  scan_out, 
  scan_in, 
  oque_oq_array_data_in, 
  l2t_cpx_data_ca, 
  oque_tid_c8, 
  mb0_l2t_mbist_write_data, 
  mbist_oqarray_sel, 
  oqarray_rw_fail, 
  oqarray_rd_en);
wire stop;
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire muxtst;
wire test;
wire sel_c8_n;
wire err_pkt_dispatch;
wire csr_report_ldrc_and_errkt;
wire nc_bit_c7_fnl;
wire tid_c7_buf_b0;
wire [1:0] arbdec_arbdp_inst_l1way_c7_buf;
wire arbdec_arbdp_inst_cpuid_c7_buf_b0;
wire arbadr_arbdp_oque_l1_index_c7_buf_b11;
wire sel_inval_c8;
wire ff_MERGED_scanin;
wire ff_MERGED_scanout;
wire oqu_strst_ack_c7_n;
wire csr_or_diag_sel_c7_127to112_n;
wire oqu_fwd_req_ret_c7_n;
wire oqu_mmu_ld_hit_c7_n;
wire dirvec_dirdp_way_info_sel;
wire mux1_sel_data_0_or_mux1_sel_data_1;
wire mux1_sel_data_2_or_oqu_int_ack;
wire oqu_mux_csr_sel_c7_n;
wire sel_st_ack_c7_n;
wire int_or_diag_sel_c7_n;
wire oqu_mux_csr_sel_c7_n_and_int_or_diag_sel_c7_and_sel_st_ack_n;
wire oqu_mux_csr_sel_c7_and_int_or_diag_sel_c7_and_sel_st_ack_n;
wire int_or_diag_sel_and_not_sel_st_ack;
wire csr_or_diag_sel_c7_111to64_n;
wire [2:0] ret_buf_c7;
wire ff_decc_data_0_scanin;
wire ff_decc_data_0_scanout;
wire ff_decc_data_1_scanin;
wire ff_decc_data_1_scanout;
wire ff_decc_data_2_scanin;
wire ff_decc_data_2_scanout;
wire ff_decc_data_3_scanin;
wire ff_decc_data_3_scanout;
wire ext_inval_data_0_scanin;
wire ext_inval_data_0_scanout;
wire ext_inval_data_1_scanin;
wire ext_inval_data_1_scanout;
wire ext_inval_data_2_scanin;
wire ext_inval_data_2_scanout;
wire ext_inval_data_3_scanin;
wire ext_inval_data_3_scanout;
wire [145:0] oque_oq_array_data_in_inv;
wire oque_oq_array_data_in_inv_ff_scanin;
wire oque_oq_array_data_in_inv_ff_scanout;
wire sel_inval_c8_n;
wire ff_data_rtn_d1_1_scanin;
wire ff_data_rtn_d1_1_scanout;
wire ff_data_rtn_d1_2_scanin;
wire ff_data_rtn_d1_2_scanout;
wire ff_data_rtn_d1_3_scanin;
wire ff_data_rtn_d1_3_scanout;
wire ff_data_rtn_d1_4_scanin;
wire ff_data_rtn_d1_4_scanout;
wire [3:0] mbist_oqarray_sel_r1;
wire [39:0] mbist_oqarray_dout;
wire ff_mbist_oqarray_dout_scanin;
wire ff_mbist_oqarray_dout_scanout;
wire [39:0] for_mbist_oqarray_dout;
wire ff_mbist_flop_scanin;
wire ff_mbist_flop_scanout;
wire [39:0] mb0_l2t_mbist_write_data_r1;
wire oqarray_rw_fail_unreg;
wire ff_mbist_flop1_scanin;
wire ff_mbist_flop1_scanout;
wire [39:0] mb0_l2t_mbist_write_data_r2;
wire oqarray_fail1;
wire oqarray_fail2;
wire ff_oqarray_rd_en_scanin;
wire ff_oqarray_rd_en_scanout;
wire oqarray_rd_en_r1;
wire oqarray_rd_en_r2;
wire oqarray_rw_fail_w;
wire oqarray_rd_en_r2_n;
wire oqu_sel_array_out_l_n;
wire oq_array_data_out_sel;
wire staged_data_out_sel;
wire [145:0] oque_cpx_data_c8_buff;
wire ff_tmp_cpx_data_ca_1_scanin;
wire ff_tmp_cpx_data_ca_1_scanout;
wire ff_tmp_cpx_data_ca_2_scanin;
wire ff_tmp_cpx_data_ca_2_scanout;
wire ff_tmp_cpx_data_ca_3_scanin;
wire ff_tmp_cpx_data_ca_3_scanout;
wire ff_tmp_cpx_data_ca_4_scanin;
wire ff_tmp_cpx_data_ca_4_scanout;
wire [37:0] mux2_sel_c8_0_ff;
wire ff_mux2_sel_c8_0_scanin;
wire ff_mux2_sel_c8_0_scanout;
wire [37:0] mux2_sel_c8_1_ff;
wire ff_mux2_sel_c8_1_scanin;
wire ff_mux2_sel_c8_1_scanout;
wire [37:0] mux2_sel_c8_2_ff;
wire ff_mux2_sel_c8_2_scanin;
wire ff_mux2_sel_c8_2_scanout;
 

 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 input tcu_clk_stop;
 input tcu_muxtest; 
 input tcu_dectest; 
 
//input		oqu_l2_miss_c7 ; // NEW_PIN  
//input		oqu_cerr_ack_c7; // asynchronous corr err  
//input		oqu_uerr_ack_c7; // asynchronous uncorr err  
//input   [2:0]	deccck_ret_err_c7; 
input	[2:0]	rtn_err_field_c7;

input	[1:0]	arbdec_arbdp_inst_l1way_c7 ; 
input   [2:0]   arbdec_arbdp_inst_tid_c7;  //  BS and SR 11/12/03 N2 Xbar Packet format change
input           oqu_mmu_ld_hit_c7;  //  BS and SR 11/12/03 N2 Xbar Packet format change
input   [1:0]   arbdec_arbdp_l1way_c3;  //  BS and SR 11/12/03 N2 Xbar Packet format change


input           arbdec_arbdp_inst_nc_c7; 
input           csr_report_ldrc; 
input	[2:0]	arbdec_arbdp_inst_cpuid_c7 ; 
input	[3:0]   oqu_rqtyp_rtn_c7; 
input	[3:0]	dirvec_dirdp_way_info_c7;  //  BS and SR 11/18/03 Support for 8 way I$ 
input		oqu_strst_ack_c7; 
input	[17:0]	arbdat_arbdp_oque_int_ret_c7; 
 
input		oqu_fwd_req_ret_c7 ;  
 
input		oqu_int_ack_c7; 
input	[11:6]	arbadr_arbdp_oque_l1_index_c7; 
input	        oqu_imiss_hit_c8; 
input   [127:0]	decc_ret_data_c7; 
input   [111:0]	dirvec_dirdp_inval_pckt_c7; 
input	[63:0]	st_ack_data;
input		sel_st_ack_c7;
input	[38:0]  decc_ret_diag_data_c7 ; 
input	[27:0]  tagd_diag_data_c7; 
input	[38:0]	vuadpm_vuad_diag_data_c7; 
input	[159:0] oq_array_data_out ; 
input           oqu_pf_ack_c7; // NEW_PIN from oqu. 
input		oqu_rmo_st_c7; // NEW_PIN from oqu. 
 
input		oqu_atm_inst_ack_c7; 
input		oqu_diag_acc_c8; 
 
input  [3:0]	oqu_mux1_sel_data_c7; // mux sels 
input		oqu_sel_array_out_l; // Mux sel from oqu. NEW_PIN 
input  		oqu_mux_csr_sel_c7; 
input		oqu_sel_inval_c7; // sel for oqarray_data_in 
input	[2:0]	oqu_out_mux1_sel_c7; // sel for mux1 
input	[2:0]	oqu_out_mux2_sel_c7; // sel for mux2 
 
 
input	[5:4]	arbadr_arbdp_line_addr_c7; // from arbaddr dp 
input		arb_dc_inval_vld_c7; // from tag 
input		arb_ic_inval_vld_c7; // from tag 
 
input	[63:0]	csr_rd_data_c8; 
 
input		l2clk; 
 
output 		scan_out; 
input 		scan_in; 
//output 		oqu_dispatched_err_pkt; 
 
output	[`CPX_WIDTH-1:0] oque_oq_array_data_in ; 
output	[`CPX_WIDTH-1:0] l2t_cpx_data_ca; 
output	[5:0]		oque_tid_c8 ; //  BS and SR 11/12/03 N2 Xbar Packet format change 

input	[7:0]	mb0_l2t_mbist_write_data;
input	[3:0]	mbist_oqarray_sel;
output		oqarray_rw_fail;
input		oqarray_rd_en;

assign stop = tcu_clk_stop;
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
assign muxtst = tcu_muxtest;
assign test = tcu_dectest;


//assign scan_out = 1'b0;

 
 
wire	[`CPX_WIDTH-13:0]  ext_inval_data_c8; 
wire	[`CPX_WIDTH-13:0]  ext_ret_data_c8; 
 
wire	[`CPX_WIDTH-1:0]   staged_data_out_c9; 
wire	[`CPX_WIDTH-1:0]   staged_cpx_packet_c9; 
 
 
wire	[2:0]	inst_tid_c8; //  BS and SR 11/12/03 N2 Xbar Packet format change 
wire		inst_nc_c8; 
 
wire	[2:0]	tid_c7; //  BS and SR 11/12/03 N2 Xbar Packet format change 
wire		nc_bit_c7 ; 
 
wire	[2:0]	tid_c8; //  BS and SR 11/12/03 N2 Xbar Packet format change 
wire	[1:0]	mmuid_c7; //  BS and SR 11/12/03 N2 Xbar Packet format change 
wire	[1:0]	arbdec_arbdp_l1way_c4; //  BS and SR 11/12/03 N2 Xbar Packet format change 
wire	[1:0]	arbdec_arbdp_l1way_c5; //  BS and SR 11/12/03 N2 Xbar Packet format change 
wire    [1:0]   arbdec_arbdp_l1way_c52; // BS 03/11/04 extra cycle for mem access
wire	[1:0]	arbdec_arbdp_l1way_c6; //  BS and SR 11/12/03 N2 Xbar Packet format change 
 
 
 
wire	[2:0]	inval_buf_c7; 
wire	[2:0]	inval_buf_c8; 
 
wire	[38:0]	tmp_inval_data_c7 ; 
wire		int_or_diag_sel_c7; 
wire	[127:0]	ext_inval_data_c7; 
 
wire	[2:0]	mod_sz_field_st_c7 ; 
wire	[1:0]	l1_way_c8; 
wire		sel_c8 ; 
wire	[2:0]	inst_cpuid_c8; 
wire	[2:0]	cpuid_c7; 
wire	[2:0]	cpuid_c8; 
 
wire	[5:0]	inst_inval_index_c8; 
wire	[5:0]	inval_index_c7; 
wire	[63:0]	dir_or_csr_data; 
 
wire	[2:0]	async_error_c7; 
 
wire	[2:0]	ret_buf_c8; 
wire	[2:0]	inval_way_c7; 
wire	[2:0]	ret_way_c7; 
wire	[2:0]	ret_way_c8; 
wire	[1:0]	inst_l1way_c7; 
wire	[`CPX_WIDTH-1:0]	tmp_cpx_data_ca; 
wire	[`CPX_WIDTH-1:0]	tmp_cpx_data_ca_d1; 
 
wire	[2:0]	error_field_c7; 
wire	[2:0]	error_field_c8; 
wire	[2:0]	rtn_err_field_c8; 
wire	[`CPX_WIDTH-1:0] oque_cpx_data_c8; 
wire	[`CPX_WIDTH-1:0] oque_cpx_data_c8_muxout; 
 
 
wire	[3:0]	hi_inval_c7 ; 
wire	[3:0]	hi_inval_c8 ; 
wire	[3:0]	cpx_hi_inval_c7; 
 
wire	rmo_st_c8; 
wire	cpx_rmo_c7;  
 
wire    csr_or_diag_sel_c7_111to64 ; 
wire    csr_or_diag_sel_c7_127to112 ; 
wire	[2:0]	mux1_sel_c8 ; 
wire	[2:0]	mux2_sel_c8 ; 
 
 
//////////////////////////////////////////////////////////////////////////////// 
//____________________________________________________________________ 
//Pkt |bits|No |Load|I$f |I$f |Strm|Evct|Stor|Strm|Int | FP |Fwd |Err | 
//    |    |   |    | 1  | 2  |Load| Inv|Ack |Stor|    |    |rep |    | 
//    |    |   |    |    |    |    |    |    |Ack |    |    |    |    | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//Vld |144 | 1 | V  | V  | V  | V  | V  | V  | V  | V  | V  | V  | V  | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//Rtn |143 | 4 |0000|0001|0001|0010|0011|0100|0110|0111|1000|1011|1100| 
//Typ |140 |   |    |    |    |    |    |    |    |    |    |    |    | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//ERR |139 | 3 | V  | V  | V  | V  | X  | X  | X  | X  | X  | V  | V  | 
//    |137 |   |    |    |    |    |    |    |    |    |    |    |    | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
// NC |136 | 1 | V  | V  | V  | V  | V  | V  | V  |flus| V  |R/!W| X  | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//    |135 | 1 | T  | T  | T  | T  | X  | T  | T  | X  | T  | X  | 0  | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//    |134 | 1 | T  | T  | T  | T  | X  | T  | T  | X  | T  | X  | 0  | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//    |133 | 1 | WV | WV | WV | WV | X  | X  | X  | X  | X  |tar | X  | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//    |132 | 1 | W  | W  | W  | W  | X  | X  | X  | X  | X  |tar | X  | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//    |131 | 1 | W  | W  | W  | W  | X  | P  | X  | X  | X  |tar | X  | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//    |130 | 1 | X  | X  | X  | 0  | X  | P  | 0  | X  | X  | X  | X  | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//    |129 | 1 |atm | X  | X  | 0  | X  |atm | X  | X  | X  | X  | X  | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//    |128 | 1 | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//data|127 |128|    |    |    |    |6PA,|3cpu|3cpu|    |    |    |    | 
//    |0   |   | V  | V  | V  | V  |112 |6PA,|6pa,|    |    | +  |    | 
//    |    |   |    |    |    |    |Inv |112 |112 | V! | V* |Data|Add | 
//    |    |   |    |    |    |    |    |Inv |Inv |    |    |    |    | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//    |    |   |    |    |    |    |    |    |    |    |    |    |    | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//////////////////////////////////////////////////////////////////////////////// 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// In casse of Imiss or Diag instruction a bubble is inserted and 
// a dummy instruction is inserted in the next cycle that looks 
// like the current instruction. sel_c8 is used to select the 
// bit fields for the dummy instruction, which is the delayed 
// version of the original values. 
 
// assign  sel_c8 = (oqu_imiss_hit_c8 | oqu_diag_acc_c8) ; 

l2t_oque_dp_or_macro__width_1 sel_c8_or_slice  
	( 
	.dout 	(sel_c8), 
	.din0	(oqu_imiss_hit_c8), 
	.din1	(oqu_diag_acc_c8) 
	); 

 
 
//////////////////////////////////////////////////////////////////////////////// 
// TID (Thread ID), bit 136:134 of the CPX Packet 
//////////////////////////////////////////////////////////////////////////////// 
//msff_macro ff_MERGED2 (width=12,stack=12r,dmsff=32x) //  BS and SR 11/12/03 N2 Xbar Packet format change
// (.dout({inst_tid_c8[2:0],hi_inval_c8[3:0],rmo_st_c8,sel_inval_c8,cpuid_c8[2:0]}), 
//  .scan_in(ff_MERGED2_scanin),
//  .scan_out(ff_MERGED2_scanout),
//  .din({arbdec_arbdp_inst_tid_c7[2:0],hi_inval_c7[3:0],oqu_rmo_st_c7,oqu_sel_inval_c7,ext_inval_data_c7[120:118]}), 
//  .clk(l2clk), 
//  .en(1'b1), 
//
// ) ; 


l2t_oque_dp_inv_macro__width_1 sel_c8_inv_slice  
	( 
	.dout	(sel_c8_n ), 
	.din	(sel_c8 ) 
	);	


// bug id fix 91281
//assign nc_bit_c7_fnl = nc_bit_c7 | (csr_report_ldrc & (oqu_rqtyp_rtn_c7[3:0] == 4'hc));

l2t_oque_dp_cmp_macro__width_8 cmp_rtn_type_err_ind_pkt 
	(
	.dout	(err_pkt_dispatch),
	.din0	({4'b1,4'hc}),
	.din1	({4'b1,oqu_rqtyp_rtn_c7[3:0]})
	);
l2t_oque_dp_and_macro__width_1 and_csr_report_ldrc_for_errpkt 
	(
	.dout	(csr_report_ldrc_and_errkt),
	.din0	(err_pkt_dispatch),
	.din1	(csr_report_ldrc)
	);
l2t_oque_dp_or_macro__width_1 or_csr_report_ldrc_for_errpkt 
        (
        .dout   (nc_bit_c7_fnl),
        .din0   (csr_report_ldrc_and_errkt),
        .din1   (nc_bit_c7)
        );



l2t_oque_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_20r__width_20 mux_MERGED  //  BS and SR 11/12/03 N2 Xbar Packet format change
              (
                .dout({tid_c7[2:0],nc_bit_c7,inst_l1way_c7[1:0],cpuid_c7[2:0],inval_index_c7[5:0],cpx_rmo_c7,cpx_hi_inval_c7[3:0]}),
                .din0({arbdec_arbdp_inst_tid_c7[2:0],arbdec_arbdp_inst_nc_c7,arbdec_arbdp_inst_l1way_c7[1:0],
			arbdec_arbdp_inst_cpuid_c7[2:0],arbadr_arbdp_oque_l1_index_c7[11:6],oqu_rmo_st_c7,hi_inval_c7[3:0]}),
                .sel0(sel_c8_n),
                .din1({inst_tid_c8[2:0],inst_nc_c8,l1_way_c8[1:0],inst_cpuid_c8[2:0],inst_inval_index_c8[5:0],rmo_st_c8,hi_inval_c8[3:0]}),
                .sel1(sel_c8)
              ) ;


l2t_oque_dp_buff_macro__minbuff_1__stack_40r__width_5 MERGED_minbuff  (
  .din ({tid_c7[0],    arbdec_arbdp_inst_l1way_c7[1:0],    arbdec_arbdp_inst_cpuid_c7[0],    arbadr_arbdp_oque_l1_index_c7[11]}),
  .dout({tid_c7_buf_b0,arbdec_arbdp_inst_l1way_c7_buf[1:0],arbdec_arbdp_inst_cpuid_c7_buf_b0,arbadr_arbdp_oque_l1_index_c7_buf_b11}));


l2t_oque_dp_msff_macro__dmsff_32x__stack_40r__width_37 ff_MERGED  //  BS and SR 11/12/03 N2 Xbar Packet format change
              (.dout({inst_tid_c8[2:0],hi_inval_c8[3:0],rmo_st_c8,sel_inval_c8,cpuid_c8[2:0],
			tid_c8[2:0],l1_way_c8[1:0],inst_cpuid_c8[2:0],inst_inval_index_c8[5:0],
			inst_nc_c8,
		        arbdec_arbdp_l1way_c4[1:0],
		        arbdec_arbdp_l1way_c5[1:0],arbdec_arbdp_l1way_c52[1:0],arbdec_arbdp_l1way_c6[1:0],mmuid_c7[1:0]}),
               .scan_in(ff_MERGED_scanin),
               .scan_out(ff_MERGED_scanout),
               .din({arbdec_arbdp_inst_tid_c7[2:0],hi_inval_c7[3:0],oqu_rmo_st_c7,			// 36:29
			oqu_sel_inval_c7,ext_inval_data_c7[120:118],					// 28:25
			tid_c7[2:1],tid_c7_buf_b0,arbdec_arbdp_inst_l1way_c7_buf[1:0],			// 24:20
			arbdec_arbdp_inst_cpuid_c7[2:1],arbdec_arbdp_inst_cpuid_c7_buf_b0,		// 19:17
			arbadr_arbdp_oque_l1_index_c7_buf_b11,arbadr_arbdp_oque_l1_index_c7[10:6],	// 16:11
			arbdec_arbdp_inst_nc_c7,							//    10
			arbdec_arbdp_l1way_c3[1:0],							// 09:08
			arbdec_arbdp_l1way_c4[1:0],arbdec_arbdp_l1way_c5[1:0],
			arbdec_arbdp_l1way_c52[1:0],arbdec_arbdp_l1way_c6[1:0]}),
               .clk(l2clk),
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)

              ) ;


////////////////////////////////////////////////////////////////////////////////
// NC (Non Cachable) bit, bit 136 of the CPX Packet
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// RQTYP (Return request type), bit 143:140 of the CPX Packet
////////////////////////////////////////////////////////////////////////////////
 
//////////////////////////////////////////////////////////////////////////////// 
// SIZE, bit 130:128 of the CPX Packet 
//_____________________________________________________________________ 
//Pkt |bits|No |Load|I$f |I$f |Strm|Evct|Stor|Strm|Int | FP |Fwd |Err | 
//    |    |   |    | 1  | 2  |Load| Inv|Ack |Stor|    |    |rep |    | 
//    |    |   |    |    |    |    |    |    |Ack |    |    |    |    | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//    |130 | 1 | X  | X  | X  | 0  | X  |P[0]| 0  | X  | X  | X  | X  | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//    |129 | 1 |atm | X  | X  | 0  | X  |atm | 0  | X  | X  | X  | X  | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//    |128 | 1 | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
 
//////////////////////////////////////////////////////////////////////////////// 
 
 
// sz_field == {P[0], atomic, 1'b0} for Store instruction 
//          == {0, 0, 0}         for Streaming Store instruction //  BS and SR 11/12/03 N2 Xbar Packet format change 
// inst_l1way_c7 == P[1:0] in case of Store instruction 
//               == {0, 0} in case of Streaming Store instruction //  BS and SR 11/12/03 N2 Xbar Packet format change 
assign  mod_sz_field_st_c7[2] = inst_l1way_c7[0] ; 
assign  mod_sz_field_st_c7[1] = oqu_atm_inst_ack_c7 ; // qualified. 
assign  mod_sz_field_st_c7[0] = 1'b0; 

l2t_oque_dp_inv_macro__width_1 oqu_strst_ack_c7_inv_macro  
	( 
	.dout	(oqu_strst_ack_c7_n ), 
	.din	(oqu_strst_ack_c7 ) 
	);	

 
l2t_oque_dp_mux_macro__dmux_4x__mux_aonpe__ports_2__stack_3r__width_3 mux_buf_c7 
              (.dout (inval_buf_c7[2:0]), 
               .din0  (mod_sz_field_st_c7[2:0]),    .sel0 (oqu_strst_ack_c7_n), 
               .din1  (3'b0),  .sel1 (oqu_strst_ack_c7) //  BS and SR 11/12/03 N2 Xbar Packet format change 
              ) ; 
 
 
//  BS and SR 11/12/03 N2 Xbar Packet format change
// sz_field == {0, atomic, prefetch} for Load/Atomic/Prefetch data return 
//          == {0, 0, 0}      for Streaming Load Data Return 

 
 
//////////////////////////////////////////////////////////////////////////////// 
// CPUID 
//////////////////////////////////////////////////////////////////////////////// 
 
 
l2t_oque_dp_inv_macro__width_1 csr_or_diag_sel_c7_127to112_inv_slice  
	( 
	.dout	(csr_or_diag_sel_c7_127to112_n ), 
	.din	(csr_or_diag_sel_c7_127to112 ) 
	);	


l2t_oque_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_14r__width_14 mux_MERGED2 
        (
        .dout ({ext_inval_data_c7[125],ext_inval_data_c7[124:121],ext_inval_data_c7[120:118],ext_inval_data_c7[117:112]}),
        .din0  ({cpx_rmo_c7,cpx_hi_inval_c7[3:0],cpuid_c7[2:0],inval_index_c7[5:0]}),
        .sel0 (csr_or_diag_sel_c7_127to112_n),
        .din1  ({ext_inval_data_c7[61],ext_inval_data_c7[60:57],ext_inval_data_c7[56:54],ext_inval_data_c7[53:48]}),   
        .sel1 (csr_or_diag_sel_c7_127to112)
              ) ;

// assign  cpuid_c8[2:0] = ext_inval_data_c8[120:118] ; 
 
 
assign  oque_tid_c8 = {cpuid_c8[2:0], tid_c8[2:0]} ; //  BS and SR 11/12/03 N2 Xbar Packet format change 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// WAY-INFO 
//_____________________________________________________________________ 
//Pkt |bits|No |Load|I$f |I$f |Strm|Evct|Stor|Strm|Int | FP |Fwd |Err | 
//    |    |   |    | 1  | 2  |Load| Inv|Ack |Stor|    |    |rep |    | 
//    |    |   |    |    |    |    |    |    |Ack |    |    |    |    | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//    |133 | 1 | WV | WV | WV | WV | X  | X  | X  | X  | X  |tar | X  | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//    |132 | 1 | W  | W  | W  | W  | X  | X  | X  | X  | X  |tar | X  | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
//    |131 | 1 | W  | W  | W  | W  | X  |P[1]| X  | X  | X  |tar | X  | 
//____|____|___|____|____|____|____|____|____|____|____|____|____|____| 
// 
// In case of Forward Request instruction, CPU ID field of the PCX packet will 
// contain the Source of the Forward Request, that Surce ID will be returned as 
// Target ID by the L2 in the Forward Reply packet. Target ID occupy same bit 
// position in the Forward Reply packet as the Way Valid & Way bits for the 
// Load & I$ fill packets. 
//////////////////////////////////////////////////////////////////////////////// 


l2t_oque_dp_inv_macro__width_1 oqu_fwd_req_ret_c7_inv_slice  
	( 
	.dout	(oqu_fwd_req_ret_c7_n ), 
	.din	(oqu_fwd_req_ret_c7 ) 
	);	


l2t_oque_dp_mux_macro__dmux_4x__mux_aonpe__ports_2__stack_3r__width_3 mux_inval_way_c7 
              (.dout (inval_way_c7[2:0]), 
               .din0  ({2'b0,inst_l1way_c7[1]}),  .sel0 (oqu_fwd_req_ret_c7_n), 
               .din1  (cpuid_c7[2:0]),            .sel1 (oqu_fwd_req_ret_c7) 
              ) ; 
 
 
//why ret_way_c7[2:0] != dirvec_dirdp_way_info_c7[2:0] ; 
//  BS and SR 11/12/03 N2 Xbar Packet format change
// assign dirvec_dirdp_way_info_sel = ~oqu_mmu_ld_hit_c7 & oqu_fwd_req_ret_c7_n;

l2t_oque_dp_inv_macro__width_1 inv_oqu_mmu_ld_hit_c7 
	(
	.dout	(oqu_mmu_ld_hit_c7_n),
	.din	(oqu_mmu_ld_hit_c7)
	);

l2t_oque_dp_and_macro__width_1 and_dirvec_dirdp_way_info_sel 
	(
	.dout	(dirvec_dirdp_way_info_sel),
	.din0	(oqu_mmu_ld_hit_c7_n),
	.din1	(oqu_fwd_req_ret_c7_n)
	);


// BS 03/11/04 extra cycle for mem access



l2t_oque_dp_mux_macro__dmux_4x__mux_aonpe__ports_3__stack_3r__width_3 mux_ret_way_c7   //  BS and SR 11/12/03 N2 Xbar Packet format change
              (.dout (ret_way_c7[2:0]), 
               .din0  (dirvec_dirdp_way_info_c7[3:1]),  .sel0 (dirvec_dirdp_way_info_sel), // BS and SR 11/18/03 Support for 8 way I$
               .din1  (cpuid_c7[2:0]),           .sel1 (oqu_fwd_req_ret_c7),
               .din2  ({1'b0,mmuid_c7[1:0]}),    .sel2 (oqu_mmu_ld_hit_c7)   // BS and SR 11/12/03 N2 Xbar Packet format change
              ) ; 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// INVAL INDEX. 
//////////////////////////////////////////////////////////////////////////////// 
// Index bits[11:6] for the L1$. Although for D$ bits<4,5,8,9,10> and for I$ 
// bits<5,8,9,10,11> are used as index bits in L1$, bits<11:6> are send by the 
// L2. For D$ bit<11> will be ignored and four inval bits corresponding to 
// bits<5:4> == 00, 01, 10 & 11 are send. For I$ two inval bits corresponding to 
// the bit<5> == 0 & 1 are send. 

 
 
//////////////////////////////////////////////////////////////////////////////// 
// higher order bits or dir  payload. 
// added to support the invalidation packet. 
//////////////////////////////////////////////////////////////////////////////// 
assign  hi_inval_c7 = {arb_ic_inval_vld_c7, arb_dc_inval_vld_c7, arbadr_arbdp_line_addr_c7} ; 
 
 
 
//////////////////////////////////////////////////////////////// 
// bit # 125 of the payload of a inval* packet 
//////////////////////////////////////////////////////////////// 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// ERR FIELDS 
// async errors from oqu. 
// sync errors from decc. 
// THe MSB of the error field is used by the Performance counter 
// to count the number of misses for a Load/Imiss/StrmLoad instruction. 
//////////////////////////////////////////////////////////////////////////////// 
// 
///****************************************************************************/
///****************************************************************************/
///****************************************************************************/
///****************************************************************************/
///****************************************************************************/
//msff_macro ff_deccck_ret_err_c8 (width=1,stack=4r,dmsff=32x) 
//   ( 
//    .scan_in(ff_deccck_ret_err_c8_scanin),
//    .scan_out(ff_deccck_ret_err_c8_scanout),
//    .dout(ret_err_c8_1),
//    .clk(l2clk), 
//    .en(1'b1), 
//    .din(deccck_ret_err_c7[1])) ;
// 
//assign  async_error_c7 = {oqu_l2_miss_c7,  
//			oqu_uerr_ack_c7,  // comes from pst/atomic stores and Dis errs from FB 
//			oqu_cerr_ack_c7} ; // comes from pst/atomic stores and Dis errs from FB 
//
// 
//assign  error_field_c7[2] = (async_error_c7[2]) ; 
//
//// assign  error_field_c7[1] = (async_error_c7[1] |  (deccck_ret_err_c8[1] & oqu_imiss_hit_c8)) ; 
//
//and_macro error_field_c7_2_and_slice (width=1) 
//	( 
//	.dout 	(deccck_ret_err_1_and_oqu_imiss_hit_c8), 
//	.din0	(oqu_imiss_hit_c8), 
//	.din1	(ret_err_c8_1) 
//	); 
//
//or_macro error_field_c7_1_or_slice (width=1) 
//	( 
//	.dout 	(error_field_c7[1]), 
//	.din0	(async_error_c7[1]), 
//	.din1	(deccck_ret_err_1_and_oqu_imiss_hit_c8) 
//	); 
//
//assign  error_field_c7[0] = (async_error_c7[0]) ; 
// 
//// assign  rtn_err_field_c8 = error_field_c8 | deccck_ret_err_c8 ; 
//
//or_macro rtn_err_field_c8_or_slice (width=3) 
//	( 
//	.dout 	(rtn_err_field_c7[2:0]), 
//	.din0	(error_field_c7[2:0]), 
//	.din1	(deccck_ret_err_c7[2:0]) 
//	); 
//
///****************************************************************************/
///****************************************************************************/
///****************************************************************************/
///****************************************************************************/
///****************************************************************************/
 
 
//////////////////////////////////////////////////////////////////////////////// 
// DATA MUXES 
//////////////////////////////////////////////////////////////////////////////// 
 
//assign  int_or_diag_sel_c7 = (oqu_mux1_sel_data_c7[0] | oqu_mux1_sel_data_c7[1] | 
//                              oqu_mux1_sel_data_c7[2] | oqu_int_ack_c7) ; 

l2t_oque_dp_or_macro__width_1 mux1_sel_data_0_or_mux1_sel_data_1_slice  
	( 
	.dout 	(mux1_sel_data_0_or_mux1_sel_data_1), 
	.din0	(oqu_mux1_sel_data_c7[0]), 
	.din1	(oqu_mux1_sel_data_c7[1]) 
	); 

l2t_oque_dp_or_macro__width_1 mux1_sel_data_2_or_oqu_int_ack_slice  
	( 
	.dout 	(mux1_sel_data_2_or_oqu_int_ack), 
	.din0	(oqu_mux1_sel_data_c7[2]), 
	.din1	(oqu_int_ack_c7) 
	); 

l2t_oque_dp_or_macro__width_1 int_or_diag_sel_or_slice  
	( 
	.dout 	(int_or_diag_sel_c7), 
	.din0	(mux1_sel_data_2_or_oqu_int_ack), 
	.din1	(mux1_sel_data_0_or_mux1_sel_data_1) 
	); 
 
l2t_oque_dp_mux_macro__mux_pgpe__ports_4__stack_39r__width_39 mux_tmp_inv_data_c7 
  	(
	.dout (tmp_inval_data_c7[38:0]), 
   	.din0  (decc_ret_diag_data_c7[38:0]),              
	.sel0 (oqu_mux1_sel_data_c7[0]), 
   	.din1  ({11'b0, tagd_diag_data_c7[27:0]}),     
	.sel1 (oqu_mux1_sel_data_c7[1]), 
   	.din2  (vuadpm_vuad_diag_data_c7[38:0]),    
	.sel2 (oqu_mux1_sel_data_c7[2]), 
   	.din3  ({21'b0, arbdat_arbdp_oque_int_ret_c7[17:0]}),
  .muxtst(muxtst),
  .test(test)  
//	.sel3 (oqu_mux1_sel_data_c7[3]) 
  	); 


l2t_oque_dp_inv_macro__width_1 oqu_mux_csr_sel_c7_inv_macro  
	( 
	.dout	(oqu_mux_csr_sel_c7_n ), 
	.din	(oqu_mux_csr_sel_c7 ) 
	);	

 
//mux_macro mux_csr_sel_1 (width=32,ports=2,mux=aonpe,stack=32r,dmux=4x)
//              (.dout (dir_or_csr_data[63:32]), 
//               .din0  (dirvec_dirdp_inval_pckt_c7[63:32]),  .sel0 (oqu_mux_csr_sel_c7_n), 
//               .din1  (csr_rd_data_c8[63:32]),       .sel1 (oqu_mux_csr_sel_c7) 
//              ) ; 
//
//mux_macro mux_csr_sel_2 (width=32,ports=2,mux=aonpe,stack=32r,dmux=4x)
//              (.dout (dir_or_csr_data[31:0]),
//               .din0  (dirvec_dirdp_inval_pckt_c7[31:0]),  .sel0 (oqu_mux_csr_sel_c7_n),
//               .din1  (csr_rd_data_c8[31:0]),       .sel1 (oqu_mux_csr_sel_c7)
//              ) ;
// 
l2t_oque_dp_inv_macro__dinv_16x__width_2 int_or_diag_sel_c7_inv_slice  
	( 
	.dout	({sel_st_ack_c7_n,int_or_diag_sel_c7_n}), 
	.din	({sel_st_ack_c7,int_or_diag_sel_c7}) 
	);	

//mux_macro int_diag_sel63to0_1 (width=32,ports=2,mux=aonpe,stack=32r,dmux=8x)
//              (.dout (ext_inval_data_c7[63:32]), 
//               .din0  (dir_or_csr_data[63:32]),            .sel0 (int_or_diag_sel_c7_n), 
//               .din1  ({25'b0,tmp_inval_data_c7[38:32]}), .sel1 (int_or_diag_sel_c7) 
//              ) ; 
//
//mux_macro int_diag_sel63to0_2 (width=32,ports=2,mux=aonpe,stack=32r,dmux=8x)
//              (.dout (ext_inval_data_c7[31:0]),
//               .din0  (dir_or_csr_data[31:0]),            .sel0 (int_or_diag_sel_c7_n),
//               .din1  (tmp_inval_data_c7[31:0]), .sel1 (int_or_diag_sel_c7)
//              ) ;
//


l2t_oque_dp_and_macro__dinv_32x__dnand_16x__ports_3__width_2 and_csr_sel_int_or_diag_sel
	(
	.dout	({oqu_mux_csr_sel_c7_n_and_int_or_diag_sel_c7_and_sel_st_ack_n, oqu_mux_csr_sel_c7_and_int_or_diag_sel_c7_and_sel_st_ack_n}),
	.din0	({oqu_mux_csr_sel_c7_n,oqu_mux_csr_sel_c7}),
	.din1	({int_or_diag_sel_c7_n,int_or_diag_sel_c7_n}),
	.din2	({sel_st_ack_c7_n,sel_st_ack_c7_n})
	);

l2t_oque_dp_and_macro__width_1 and_int_or_diag_sel_and_not_sel_st_ack 
	(
	.dout	(int_or_diag_sel_and_not_sel_st_ack),
	.din0	(int_or_diag_sel_c7),
	.din1	(sel_st_ack_c7_n)
	);


l2t_oque_dp_mux_macro__dmux_32x__mux_pgnpe__ports_4__stack_32r__width_32 mux_csr_int_diag_sel63to0_1	
	(
	.dout	(ext_inval_data_c7[63:32]),
	.din0   (dirvec_dirdp_inval_pckt_c7[63:32]),  
	.din1   (csr_rd_data_c8[63:32]),       
	.din2   ({25'b0,tmp_inval_data_c7[38:32]}),
	.din3	(st_ack_data[63:32]),
	.sel0	(oqu_mux_csr_sel_c7_n_and_int_or_diag_sel_c7_and_sel_st_ack_n),
	.sel1	(oqu_mux_csr_sel_c7_and_int_or_diag_sel_c7_and_sel_st_ack_n),
	.sel2   (int_or_diag_sel_and_not_sel_st_ack),
	.sel3	(sel_st_ack_c7),
  .muxtst(muxtst)
	);


l2t_oque_dp_mux_macro__dmux_32x__mux_pgnpe__ports_4__stack_32r__width_32 mux_csr_int_diag_sel63to0_2   
        (
        .dout   (ext_inval_data_c7[31:0]),
        .din0   (dirvec_dirdp_inval_pckt_c7[31:0]),
        .din1   (csr_rd_data_c8[31:0]),
        .din2   (tmp_inval_data_c7[31:0]),
	.din3	(st_ack_data[31:0]),
	.sel0	(oqu_mux_csr_sel_c7_n_and_int_or_diag_sel_c7_and_sel_st_ack_n),
	.sel1	(oqu_mux_csr_sel_c7_and_int_or_diag_sel_c7_and_sel_st_ack_n),
	.sel2   (int_or_diag_sel_and_not_sel_st_ack),
	.sel3	(sel_st_ack_c7),
  .muxtst(muxtst)
        );

// assign  csr_or_diag_sel_c7_111to64  = ( int_or_diag_sel_c7 | oqu_mux_csr_sel_c7) ; 
// assign  csr_or_diag_sel_c7_127to112 = (~int_or_diag_sel_c7 & oqu_mux_csr_sel_c7) ; 


l2t_oque_dp_and_macro__width_1 csr_or_diag_sel_c7_127to112_slice  
	( 
	.dout 	(csr_or_diag_sel_c7_127to112), 
	.din0	(int_or_diag_sel_c7_n), 
	.din1	(oqu_mux_csr_sel_c7) 
	); 

l2t_oque_dp_or_macro__width_1 csr_or_diag_sel_c7_111to64_slice  
	( 
	.dout 	(csr_or_diag_sel_c7_111to64), 
	.din0	(int_or_diag_sel_c7), 
	.din1	(oqu_mux_csr_sel_c7) 
	); 

l2t_oque_dp_inv_macro__width_1 csr_or_diag_sel_c7_111to64_inv_slice  
	( 
	.dout	(csr_or_diag_sel_c7_111to64_n ), 
	.din	(csr_or_diag_sel_c7_111to64 ) 
	);	

l2t_oque_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_48r__width_48 int_diag_sel111to64 
              (.dout (ext_inval_data_c7[111:64]), 
               .din0  (dirvec_dirdp_inval_pckt_c7[111:64]),  .sel0 (csr_or_diag_sel_c7_111to64_n), 
               .din1  (ext_inval_data_c7[47:0])    //  .sel1 (csr_or_diag_sel_c7_111to64) 
              ) ; 

 
/////////////////////////////////////////////////////////////////////////
// Flop ret_data                                                       //
/////////////////////////////////////////////////////////////////////////

// inv_macro inv_ret_way_c7 (width=3) 
// 	( 
// 	.dout	(ret_way_c7_inv[2:0] ), 
// 	.din	(ret_way_c7[2:0] ) 
// 	);	

assign ret_buf_c7[2:0] = {dirvec_dirdp_way_info_c7[0],oqu_atm_inst_ack_c7,oqu_pf_ack_c7} ;
// inv_macro inv_ret_buf_c7 (width=3) 
// 	( 
// 	.dout	(ret_buf_c7_inv[2:0] ), 
// 	.din	(ret_buf_c7[2:0] ) 
// 	);	

l2t_oque_dp_msffi_macro__dmsffi_16x__stack_36r__width_24 ff_decc_data_0 
              (.dout_l(ext_ret_data_c8[133:110]),
               .din({ret_way_c7[2:0],ret_buf_c7[2:0],decc_ret_data_c7[127:110]}),
               .scan_in(ff_decc_data_0_scanin),
               .scan_out(ff_decc_data_0_scanout),
               .clk(l2clk),
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)

              ) ;

 
l2t_oque_dp_msffi_macro__dmsffi_16x__stack_36r__width_36 ff_decc_data_1 
              (.dout_l(ext_ret_data_c8[109:74]),
               .din(decc_ret_data_c7[109:74]),
               .scan_in(ff_decc_data_1_scanin),
               .scan_out(ff_decc_data_1_scanout),
               .clk(l2clk),
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)

              ) ;

l2t_oque_dp_msffi_macro__dmsffi_16x__stack_36r__width_36 ff_decc_data_2 
              (.dout_l(ext_ret_data_c8[73:38]),
               .din(decc_ret_data_c7[73:38]),
               .scan_in(ff_decc_data_2_scanin),
               .scan_out(ff_decc_data_2_scanout),
               .clk(l2clk),
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)

              ) ;

l2t_oque_dp_msffi_macro__dmsffi_16x__stack_38r__width_38 ff_decc_data_3 
              (.dout_l(ext_ret_data_c8[37:0]),
               .din(decc_ret_data_c7[37:0]),
               .scan_in(ff_decc_data_3_scanin),
               .scan_out(ff_decc_data_3_scanout),
               .clk(l2clk),
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)

              ) ;

/////////////////////////////////////////////////////////////////////////
// Flop ext_inval_data                                                //
/////////////////////////////////////////////////////////////////////////
l2t_oque_dp_msffi_macro__dmsffi_16x__stack_34r__width_24 ext_inval_data_0  //  
              (.dout_l(ext_inval_data_c8[133:110]),
               .din ({inval_way_c7[2:0],inval_buf_c7[2:0],ext_inval_data_c7[127:110]}),
               .scan_in(ext_inval_data_0_scanin),
               .scan_out(ext_inval_data_0_scanout),
               .clk(l2clk), 
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
 
              ) ; 

l2t_oque_dp_msffi_macro__dmsffi_16x__stack_36r__width_36 ext_inval_data_1  //  
              (.dout_l(ext_inval_data_c8[109:74]),
               .din(ext_inval_data_c7[109:74]), 
               .scan_in(ext_inval_data_1_scanin),
               .scan_out(ext_inval_data_1_scanout),
               .clk(l2clk), 
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
 
              ) ; 

l2t_oque_dp_msffi_macro__dmsffi_16x__stack_36r__width_36 ext_inval_data_2  //  
              (.dout_l(ext_inval_data_c8[73:38]),
               .din(ext_inval_data_c7[73:38]), 
               .scan_in(ext_inval_data_2_scanin),
               .scan_out(ext_inval_data_2_scanout),
               .clk(l2clk), 
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
 
              ) ; 

l2t_oque_dp_msffi_macro__dmsffi_16x__stack_38r__width_38 ext_inval_data_3  //  
              (.dout_l(ext_inval_data_c8[37:0]),
               .din(ext_inval_data_c7[37:0]), 
               .scan_in(ext_inval_data_3_scanin),
               .scan_out(ext_inval_data_3_scanout),
               .clk(l2clk), 
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
 
              ) ; 

/////////////////////////////////////////////////////////////////////////
// Flop top oque_oq_array_data
/////////////////////////////////////////////////////////////////////////
	
l2t_oque_dp_msffi_macro__dmsffi_16x__stack_12r__width_11 oque_oq_array_data_in_inv_ff  //  
              (.dout_l(oque_oq_array_data_in_inv[144:134]),
               .din ({oqu_rqtyp_rtn_c7[3:0],rtn_err_field_c7[2:0],nc_bit_c7_fnl,tid_c7[2:0]}),
               .scan_in(oque_oq_array_data_in_inv_ff_scanin),
               .scan_out(oque_oq_array_data_in_inv_ff_scanout),
               .clk(l2clk), 
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
 
              ) ; 

 
 

// assign  ext_ret_data_c8[`CPX_WYVLD:`CPX_WY_LO] =  ret_way_c8 ;  // 133:131 
// assign  ext_ret_data_c8[`CPX_BF_HI:`CPX_BF_LO] =  ret_buf_c8 ;  // 130:128 
// assign  ext_ret_data_c8[127:0]                 = decc_ret_data_c8 ; 

// assign  ext_inval_data_c8[`CPX_WYVLD:`CPX_WY_LO] = inval_way_c8 ; // 133:131 
// assign  ext_inval_data_c8[`CPX_BF_HI:`CPX_BF_LO] = inval_buf_c8 ; // 130:128 

//assign  ext_inval_data_c8[127:126] = 2'b0 ; 
//assign  ext_inval_data_c8[125]     = cpx_rmo_c8 ; 
//assign  ext_inval_data_c8[124:121] = cpx_hi_inval_c8 ; 
//assign  ext_inval_data_c8[120:118] = cpuid_c8 ; 
//assign  ext_inval_data_c8[117:112] = inval_index_c8 ; 
 
 
l2t_oque_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_2r__width_2 int_diag_sel127to126 
              (.dout (ext_inval_data_c7[127:126]), 
               .din0  (2'b0),                       .sel0 (csr_or_diag_sel_c7_127to112_n), 
               .din1  (ext_inval_data_c7[63:62]),   .sel1 (csr_or_diag_sel_c7_127to112) 
              ) ; 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// OQ ARRAY DATA IN 
// Data needs to be flopped in  OQ ARRAY  
// Array is written in phase 2 of C6 . 
//////////////////////////////////////////////////////////////////////////////// 
 
 
l2t_oque_dp_inv_macro__dinv_32x__width_1 sel_inval_c8_inv_slice  
	( 
	.dout	(sel_inval_c8_n ), 
	.din	(sel_inval_c8 ) 
	);	

// inv_macro inv_oqu_rqtyp_rtn_c7 (width=4) 
// 	( 
// 	.dout	(oqu_rqtyp_rtn_c7_inv[3:0] ), 
// 	.din	(oqu_rqtyp_rtn_c7[3:0] ) 
// 	);	

// inv_macro inv_tid_c7 (width=3) 
// 	( 
// 	.dout	(tid_c7_inv[2:0] ), 
// 	.din	(tid_c7[2:0] ) 
// 	);	

// this data will be delayed by 4 gates after the negative edge 
l2t_oque_dp_mux_macro__dmux_4x__mux_aonpe__ports_2__stack_36r__width_36 mux_oq_in_data_c8_1 
  (     .dout (oque_oq_array_data_in_inv[`CPX_WIDTH-13:98]),   // 133:0
        .din0  (ext_inval_data_c8[`CPX_WIDTH-13:98]), .sel0 (sel_inval_c8),
        .din1  (ext_ret_data_c8[`CPX_WIDTH-13:98]), .sel1 (sel_inval_c8_n)
  ) ;

l2t_oque_dp_mux_macro__dmux_4x__mux_aonpe__ports_2__stack_36r__width_36 mux_oq_in_data_c8_2 
  (     .dout (oque_oq_array_data_in_inv[97:62]),   // 133:0
        .din0  (ext_inval_data_c8[97:62]), .sel0 (sel_inval_c8),
        .din1  (ext_ret_data_c8[97:62]), .sel1 (sel_inval_c8_n)
  ) ;

l2t_oque_dp_mux_macro__dmux_4x__mux_aonpe__ports_2__stack_36r__width_36 mux_oq_in_data_c8_3 
  (     .dout (oque_oq_array_data_in_inv[61:26]),   // 133:0
        .din0  (ext_inval_data_c8[61:26]), .sel0 (sel_inval_c8),
        .din1  (ext_ret_data_c8[61:26]), .sel1 (sel_inval_c8_n)
  ) ;

l2t_oque_dp_mux_macro__dmux_4x__mux_aonpe__ports_2__stack_26r__width_26 mux_oq_in_data_c8_4 
  (     .dout (oque_oq_array_data_in_inv[25:0]),   // 133:0
        .din0  (ext_inval_data_c8[25:0]), .sel0 (sel_inval_c8),
        .din1  (ext_ret_data_c8[25:0]), .sel1 (sel_inval_c8_n)
  ) ;
 
//////////////////////////////////////////////////////////////////
// Invert back oque_oq_array_data                               // 
//////////////////////////////////////////////////////////////////
l2t_oque_dp_inv_macro__stack_38r__width_38 inv1_oque_oq_array_data_in	
 	(
 	.dout	(oque_oq_array_data_in[37:0]),
 	.din	(oque_oq_array_data_in_inv[37:0])
 	);


 l2t_oque_dp_inv_macro__stack_36r__width_36 inv2_oque_oq_array_data_in        
         (
         .dout   (oque_oq_array_data_in[73:38]),
         .din    (oque_oq_array_data_in_inv[73:38])
         );

 l2t_oque_dp_inv_macro__stack_36r__width_36 inv3_oque_oq_array_data_in        
         (
         .dout   (oque_oq_array_data_in[109:74]),
         .din    (oque_oq_array_data_in_inv[109:74])
         );

 l2t_oque_dp_inv_macro__stack_36r__width_35 inv4_oque_oq_array_data_in        
         (
         .dout   (oque_oq_array_data_in[144:110]),
         .din    (oque_oq_array_data_in_inv[144:110])
         );
	
 
assign oque_oq_array_data_in[145] = 1'b1 ;
//////////////////////////////////////////////////////////////////
l2t_oque_dp_msff_macro__stack_36r__width_36 ff_data_rtn_d1_1 
              (.dout(staged_data_out_c9[`CPX_WIDTH-1:110]),
               .scan_in(ff_data_rtn_d1_1_scanin),
               .scan_out(ff_data_rtn_d1_1_scanout),
               .din(oque_oq_array_data_in[`CPX_WIDTH-1:110]),
               .clk(l2clk),
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)

              ) ;

l2t_oque_dp_msff_macro__stack_36r__width_36 ff_data_rtn_d1_2 
              (.dout(staged_data_out_c9[109:74]),
               .scan_in(ff_data_rtn_d1_2_scanin),
               .scan_out(ff_data_rtn_d1_2_scanout),
               .din(oque_oq_array_data_in[109:74]),
               .clk(l2clk),
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)

              ) ;
l2t_oque_dp_msff_macro__stack_36r__width_36 ff_data_rtn_d1_3 
              (.dout(staged_data_out_c9[73:38]),
               .scan_in(ff_data_rtn_d1_3_scanin),
               .scan_out(ff_data_rtn_d1_3_scanout),
               .din(oque_oq_array_data_in[73:38]),
               .clk(l2clk),
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)

              ) ;
l2t_oque_dp_msff_macro__stack_38r__width_38 ff_data_rtn_d1_4 
              (.dout(staged_data_out_c9[37:0]),
               .scan_in(ff_data_rtn_d1_4_scanin),
               .scan_out(ff_data_rtn_d1_4_scanout),
               .din(oque_oq_array_data_in[37:0]),
               .clk(l2clk),
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;


l2t_oque_dp_msff_macro__stack_44r__width_44 ff_mbist_oqarray_dout 
       (.dout({mbist_oqarray_sel_r1[3:0],mbist_oqarray_dout[39:0]}),
       .scan_in(ff_mbist_oqarray_dout_scanin),
       .scan_out(ff_mbist_oqarray_dout_scanout),
       .din({mbist_oqarray_sel[3:0],for_mbist_oqarray_dout[39:0]}),
       .clk(l2clk),
       .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
       );


l2t_oque_dp_msff_macro__stack_42r__width_41 ff_mbist_flop 
	(
	.scan_in(ff_mbist_flop_scanin),
	.scan_out(ff_mbist_flop_scanout),
	.dout	({oqarray_rw_fail,mb0_l2t_mbist_write_data_r1[39:0]}),
	.din	({oqarray_rw_fail_unreg,{5{mb0_l2t_mbist_write_data[7:0]}}}),
	.clk	(l2clk),
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

l2t_oque_dp_msff_macro__stack_40r__width_40 ff_mbist_flop1 
        (
        .scan_in(ff_mbist_flop1_scanin),
        .scan_out(ff_mbist_flop1_scanout),
        .dout   (mb0_l2t_mbist_write_data_r2[39:0]),
        .din    (mb0_l2t_mbist_write_data_r1[39:0]),
        .clk    (l2clk),
        .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2t_oque_dp_cmp_macro__dcmp_8x__width_32 mbist_first 
	(
	.dout	(oqarray_fail1),
	.din0	(mb0_l2t_mbist_write_data_r2[31:0]),
	.din1	(mbist_oqarray_dout[31:0])
	);
l2t_oque_dp_cmp_macro__dcmp_8x__width_8 mbist_second 
        (
        .dout   (oqarray_fail2),
        .din0   (mb0_l2t_mbist_write_data_r2[39:32]),
        .din1   (mbist_oqarray_dout[39:32])
        );



l2t_oque_dp_msff_macro__stack_4r__width_2 ff_oqarray_rd_en 
       (
	.scan_in(ff_oqarray_rd_en_scanin),
	.scan_out(ff_oqarray_rd_en_scanout),
	.dout({oqarray_rd_en_r1,oqarray_rd_en_r2}),
       .din({oqarray_rd_en,oqarray_rd_en_r1}),
       .clk(l2clk),
       .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
       );


//assign oqarray_rd_en_r3_n = ~oqarray_rd_en_r3;

l2t_oque_dp_mux_macro__dmux_4x__mux_aonpe__ports_2__width_1 mux_oq_fail 
	(
	.dout	(oqarray_rw_fail_unreg),
	.din0	(oqarray_rw_fail_w),
	.din1	(1'b1),
	.sel0	(oqarray_rd_en_r2),
	.sel1	(oqarray_rd_en_r2_n)
	);


l2t_oque_dp_and_macro__width_1 and_mbist_oq_fail 
	(
	.dout	(oqarray_rw_fail_w),
	.din0	(oqarray_fail1),
	.din1	(oqarray_fail2)
	);



//mux_macro mux_mbist_oqarray_dout  (width=40,ports=4,mux=aonpe,stack=40r,dmux=8x)
//	(
//	.dout	(for_mbist_oqarray_dout[39:0]),
//	.din0	(oq_array_data_out[39:0]),
//	.din1	(oq_array_data_out[79:40]),
//	.din2	(oq_array_data_out[119:80]),
//	.din3	({14'b0,oq_array_data_out[145:120]}),
//	.sel0	(mbist_oqarray_sel_r1[3]),
//	.sel1	(mbist_oqarray_sel_r1[2]),
//	.sel2	(mbist_oqarray_sel_r1[1]),
//	.sel3	(mbist_oqarray_sel_r1[0])
//	);

l2t_oque_dp_mux_macro__dmux_4x__mux_aonpe__ports_4__stack_40r__width_40 mux_mbist_oqarray_dout  
        (
        .dout   (for_mbist_oqarray_dout[39:0]),
        .din0   (oq_array_data_out[39:0]),
        .din1   (oq_array_data_out[79:40]),
        .din2   (oq_array_data_out[119:80]),
        .din3   (oq_array_data_out[159:120]),
        .sel0    (mbist_oqarray_sel_r1[3]),
        .sel1    (mbist_oqarray_sel_r1[2]),
        .sel2    (mbist_oqarray_sel_r1[1]),
        .sel3    (mbist_oqarray_sel_r1[0])
        );


 
l2t_oque_dp_inv_macro__width_2 oqu_sel_array_out_l_inv_slice  
	( 
	.dout	({oqu_sel_array_out_l_n,oqarray_rd_en_r2_n}), 
	.din	({oqu_sel_array_out_l,oqarray_rd_en_r2}) 
	);	


l2t_oque_dp_and_macro__width_1 and_oq_array_data_out_sel 
        (
        .dout   (oq_array_data_out_sel),
        .din0   (oqu_sel_array_out_l_n),
        .din1   (oqu_out_mux1_sel_c7[1])
        );

l2t_oque_dp_and_macro__width_1 and_staged_data_out_sel 
        (
        .dout   (staged_data_out_sel),
        .din0   (oqu_sel_array_out_l),
        .din1   (oqu_out_mux1_sel_c7[1])
        );




 
//mux_macro mux_oqarray_dout_1 (width=36,ports=2,mux=aonpe,stack=36r,dmux=4x)
//  (     .dout (eff_oqarray_dout[`CPX_WIDTH-1:110]),   // effective array data after data
//                                                    // forwarding
//        .din0  (oq_array_data_out[`CPX_WIDTH-1:110]), .sel0 (oqu_sel_array_out_l_n),
//        .din1  (staged_data_out_c9[`CPX_WIDTH-1:110]), .sel1 (oqu_sel_array_out_l)
//  ) ;
//
//mux_macro mux_oqarray_dout_2 (width=36,ports=2,mux=aonpe,stack=36r,dmux=4x)
//  (     .dout (eff_oqarray_dout[109:74]),   // effective array data after data
//                                                    // forwarding
//        .din0  (oq_array_data_out[109:74]), .sel0 (oqu_sel_array_out_l_n),
//        .din1  (staged_data_out_c9[109:74]), .sel1 (oqu_sel_array_out_l)
//  ) ;
//
//mux_macro mux_oqarray_dout_3 (width=36,ports=2,mux=aonpe,stack=36r,dmux=4x)
//  (     .dout (eff_oqarray_dout[73:38]),   // effective array data after data
//                                                    // forwarding
//        .din0  (oq_array_data_out[73:38]), .sel0 (oqu_sel_array_out_l_n),
//        .din1  (staged_data_out_c9[73:38]), .sel1 (oqu_sel_array_out_l)
//  ) ;
//
//mux_macro mux_oqarray_dout_4 (width=38,ports=2,mux=aonpe,stack=38r,dmux=4x)
//  (     .dout (eff_oqarray_dout[37:0]),   // effective array data after data
//                                                    // forwarding
//        .din0  (oq_array_data_out[37:0]), .sel0 (oqu_sel_array_out_l_n),
//        .din1  (staged_data_out_c9[37:0]), .sel1 (oqu_sel_array_out_l)
//  ) ;

 
l2t_oque_dp_mux_macro__dmux_32x__mux_pgpe__ports_4__stack_36r__width_36 ff_tmp_cpx_data_ca1  
  (.dout (tmp_cpx_data_ca[`CPX_WIDTH-1:110]),
   .din0  (oque_oq_array_data_in[`CPX_WIDTH-1:110]),    .sel0 (oqu_out_mux1_sel_c7[2]), // def sel
   .din1  (oq_array_data_out[`CPX_WIDTH-1:110]),  .sel1 (oq_array_data_out_sel), // oq data
   .din2  (staged_data_out_c9[`CPX_WIDTH-1:110]),  .sel2 (staged_data_out_sel), // staged_data_out 
   .din3  (oque_cpx_data_c8_buff[`CPX_WIDTH-1:110]),
  .muxtst(muxtst),
  .test(test)  //.sel3 (oqu_out_mux1_sel_c7[0])  // staged packet sel
  ) ;

l2t_oque_dp_mux_macro__dmux_32x__mux_pgpe__ports_4__stack_36r__width_36 ff_tmp_cpx_data_ca2  
  (.dout (tmp_cpx_data_ca[109:74]),
   .din0  (oque_oq_array_data_in[109:74]),    .sel0 (oqu_out_mux1_sel_c7[2]), // def sel
   .din1  (oq_array_data_out[109:74]),  .sel1 (oq_array_data_out_sel), // oq data
   .din2  (staged_data_out_c9[109:74]),  .sel2 (staged_data_out_sel), // staged_data_out
   .din3  (oque_cpx_data_c8_buff[109:74]),
  .muxtst(muxtst),
  .test(test) // .sel3 (oqu_out_mux1_sel_c7[0])  // staged packet sel
  ) ;

l2t_oque_dp_mux_macro__dmux_32x__mux_pgpe__ports_4__stack_36r__width_36 ff_tmp_cpx_data_ca3  
  (.dout (tmp_cpx_data_ca[73:38]),
   .din0  (oque_oq_array_data_in[73:38]),    .sel0 (oqu_out_mux1_sel_c7[2]), // def sel
   .din1  (oq_array_data_out[73:38]),  .sel1 (oq_array_data_out_sel), // oq data
   .din2  (staged_data_out_c9[73:38]),  .sel2 (staged_data_out_sel), // staged_data_out
   .din3  (oque_cpx_data_c8_buff[73:38]),
  .muxtst(muxtst),
  .test(test) // .sel3 (oqu_out_mux1_sel_c7[0])  // staged packet sel
  ) ;

l2t_oque_dp_mux_macro__dmux_32x__mux_pgpe__ports_4__stack_38r__width_38 ff_tmp_cpx_data_ca4  
  (.dout (tmp_cpx_data_ca[37:0]),
   .din0  (oque_oq_array_data_in[37:0]),    .sel0 (oqu_out_mux1_sel_c7[2]), // def sel   //
   .din1  (oq_array_data_out[37:0]),  .sel1 (oq_array_data_out_sel), // oq data
   .din2  (staged_data_out_c9[37:0]),  .sel2 (staged_data_out_sel), // staged_data_out
   .din3  (oque_cpx_data_c8_buff[37:0]),
  .muxtst(muxtst),
  .test(test) // .sel3 (oqu_out_mux1_sel_c7[0])  // staged packet sel
  ) ;



/////////////////////////////////////////////////////////////////
// Flop ff_tmp_cpx_data_ca
/////////////////////////////////////////////////////////////////
l2t_oque_dp_msffi_macro__dmsffi_16x__stack_36r__width_36 ff_tmp_cpx_data_ca_1 
              (.dout_l(tmp_cpx_data_ca_d1[`CPX_WIDTH-1:110]),
               .din(tmp_cpx_data_ca[`CPX_WIDTH-1:110]),
               .scan_in(ff_tmp_cpx_data_ca_1_scanin),
               .scan_out(ff_tmp_cpx_data_ca_1_scanout),
               .clk(l2clk),
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)

              ) ;

l2t_oque_dp_msffi_macro__dmsffi_16x__stack_36r__width_36 ff_tmp_cpx_data_ca_2 
              (.dout_l(tmp_cpx_data_ca_d1[109:74]),
               .din(tmp_cpx_data_ca[109:74]),
               .scan_in(ff_tmp_cpx_data_ca_2_scanin),
               .scan_out(ff_tmp_cpx_data_ca_2_scanout),
               .clk(l2clk),
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)

              ) ;
l2t_oque_dp_msffi_macro__dmsffi_16x__stack_36r__width_36 ff_tmp_cpx_data_ca_3 
              (.dout_l(tmp_cpx_data_ca_d1[73:38]),
               .din(tmp_cpx_data_ca[73:38]),
               .scan_in(ff_tmp_cpx_data_ca_3_scanin),
               .scan_out(ff_tmp_cpx_data_ca_3_scanout),
               .clk(l2clk),
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)

              ) ;
l2t_oque_dp_msffi_macro__dmsffi_16x__stack_38r__width_38 ff_tmp_cpx_data_ca_4 
              (.dout_l(tmp_cpx_data_ca_d1[37:0]),
               .din(tmp_cpx_data_ca[37:0]),
               .scan_in(ff_tmp_cpx_data_ca_4_scanin),
               .scan_out(ff_tmp_cpx_data_ca_4_scanout),
               .clk(l2clk),
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;



/////////////////////////////////////////////////////////
// flopping selects.
/////////////////////////////////////////////////////////

l2t_oque_dp_msff_macro__dmsff_32x__stack_38r__width_38 ff_mux2_sel_c8_0  // 
              (.dout(mux2_sel_c8_0_ff[37:0]),
               .scan_in(ff_mux2_sel_c8_0_scanin),
               .scan_out(ff_mux2_sel_c8_0_scanout),
               .din({38{oqu_out_mux2_sel_c7[0]}}),
               .clk(l2clk),
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;

l2t_oque_dp_msff_macro__dmsff_32x__stack_38r__width_38 ff_mux2_sel_c8_1  // 
              (.dout(mux2_sel_c8_1_ff[37:0]),
               .scan_in(ff_mux2_sel_c8_1_scanin),
               .scan_out(ff_mux2_sel_c8_1_scanout),
               .din({38{oqu_out_mux2_sel_c7[1]}}),
               .clk(l2clk),
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;

l2t_oque_dp_msff_macro__dmsff_32x__stack_38r__width_38 ff_mux2_sel_c8_2  // 
              (.dout(mux2_sel_c8_2_ff[37:0]),
               .scan_in(ff_mux2_sel_c8_2_scanin),
               .scan_out(ff_mux2_sel_c8_2_scanout),
               .din({38{oqu_out_mux2_sel_c7[2]}}),
               .clk(l2clk),
               .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;


// -----------------------------------------------------------------------------------

// assign	mux2_sel_c8[0] = out_mux2_sel_c8[0] ; 
// assign	mux2_sel_c8[1] = out_mux2_sel_c8[1] ; 
// assign	mux2_sel_c8[2] = out_mux2_sel_c8[2] ; 

// -----------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
///////////////////////////////////////////////////////////////////////////////////////////////
// First Row of muxes. 
///////////////////////////////////////////////////////////////////////////////////////////////

//--- 113:110  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_110  
  (.out (oque_cpx_data_c8_muxout[110]),
   .in0  (tmp_cpx_data_ca_d1[110]),
   .sel0 (mux2_sel_c8_0_ff[0]), // Old data sel
   .in1  (ext_inval_data_c8[110]),
   .sel1 (mux2_sel_c8_1_ff[0]), // Inval
   .in2  (ext_ret_data_c8[110]),
   .sel2 (mux2_sel_c8_2_ff[0])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_111  
  (.out (oque_cpx_data_c8_muxout[111]),
   .in0  (tmp_cpx_data_ca_d1[111]),
   .sel0 (mux2_sel_c8_0_ff[1]), // Old data sel
   .in1  (ext_inval_data_c8[111]),
   .sel1 (mux2_sel_c8_1_ff[1]), // Inval
   .in2  (ext_ret_data_c8[111]),
   .sel2 (mux2_sel_c8_2_ff[1])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_112  
  (.out (oque_cpx_data_c8_muxout[112]),
   .in0  (tmp_cpx_data_ca_d1[112]),
   .sel0 (mux2_sel_c8_0_ff[2]), // Old data sel
   .in1  (ext_inval_data_c8[112]),
   .sel1 (mux2_sel_c8_1_ff[2]), // Inval
   .in2  (ext_ret_data_c8[112]),
   .sel2 (mux2_sel_c8_2_ff[2])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_113  
  (.out (oque_cpx_data_c8_muxout[113]),
   .in0  (tmp_cpx_data_ca_d1[113]),
   .sel0 (mux2_sel_c8_0_ff[3]), // Old data sel
   .in1  (ext_inval_data_c8[113]),
   .sel1 (mux2_sel_c8_1_ff[3]), // Inval
   .in2  (ext_ret_data_c8[113]),
   .sel2 (mux2_sel_c8_2_ff[3])  // Def Sel
  ) ;
//--- 117:114  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_114  
  (.out (oque_cpx_data_c8_muxout[114]),
   .in0  (tmp_cpx_data_ca_d1[114]),
   .sel0 (mux2_sel_c8_0_ff[4]), // Old data sel
   .in1  (ext_inval_data_c8[114]),
   .sel1 (mux2_sel_c8_1_ff[4]), // Inval
   .in2  (ext_ret_data_c8[114]),
   .sel2 (mux2_sel_c8_2_ff[4])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_115  
  (.out (oque_cpx_data_c8_muxout[115]),
   .in0  (tmp_cpx_data_ca_d1[115]),
   .sel0 (mux2_sel_c8_0_ff[5]), // Old data sel
   .in1  (ext_inval_data_c8[115]),
   .sel1 (mux2_sel_c8_1_ff[5]), // Inval
   .in2  (ext_ret_data_c8[115]),
   .sel2 (mux2_sel_c8_2_ff[5])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_116  
  (.out (oque_cpx_data_c8_muxout[116]),
   .in0  (tmp_cpx_data_ca_d1[116]),
   .sel0 (mux2_sel_c8_0_ff[6]), // Old data sel
   .in1  (ext_inval_data_c8[116]),
   .sel1 (mux2_sel_c8_1_ff[6]), // Inval
   .in2  (ext_ret_data_c8[116]),
   .sel2 (mux2_sel_c8_2_ff[6])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_117  
  (.out (oque_cpx_data_c8_muxout[117]),
   .in0  (tmp_cpx_data_ca_d1[117]),
   .sel0 (mux2_sel_c8_0_ff[7]), // Old data sel
   .in1  (ext_inval_data_c8[117]),
   .sel1 (mux2_sel_c8_1_ff[7]), // Inval
   .in2  (ext_ret_data_c8[117]),
   .sel2 (mux2_sel_c8_2_ff[7])  // Def Sel
  ) ;

//--- 121:118  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_118  
  (.out (oque_cpx_data_c8_muxout[118]),
   .in0  (tmp_cpx_data_ca_d1[118]),
   .sel0 (mux2_sel_c8_0_ff[8]), // Old data sel
   .in1  (ext_inval_data_c8[118]),
   .sel1 (mux2_sel_c8_1_ff[8]), // Inval
   .in2  (ext_ret_data_c8[118]),
   .sel2 (mux2_sel_c8_2_ff[8])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_119  
  (.out (oque_cpx_data_c8_muxout[119]),
   .in0  (tmp_cpx_data_ca_d1[119]),
   .sel0 (mux2_sel_c8_0_ff[9]), // Old data sel
   .in1  (ext_inval_data_c8[119]),
   .sel1 (mux2_sel_c8_1_ff[9]), // Inval
   .in2  (ext_ret_data_c8[119]),
   .sel2 (mux2_sel_c8_2_ff[9])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_120  
  (.out (oque_cpx_data_c8_muxout[120]),
   .in0  (tmp_cpx_data_ca_d1[120]),
   .sel0 (mux2_sel_c8_0_ff[10]), // Old data sel
   .in1  (ext_inval_data_c8[120]),
   .sel1 (mux2_sel_c8_1_ff[10]), // Inval
   .in2  (ext_ret_data_c8[120]),
   .sel2 (mux2_sel_c8_2_ff[10])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_121  
  (.out (oque_cpx_data_c8_muxout[121]),
   .in0  (tmp_cpx_data_ca_d1[121]),
   .sel0 (mux2_sel_c8_0_ff[11]), // Old data sel
   .in1  (ext_inval_data_c8[121]),
   .sel1 (mux2_sel_c8_1_ff[11]), // Inval
   .in2  (ext_ret_data_c8[121]),
   .sel2 (mux2_sel_c8_2_ff[11])  // Def Sel
  ) ;

//--- 125:122  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_122  
  (.out (oque_cpx_data_c8_muxout[122]),
   .in0  (tmp_cpx_data_ca_d1[122]),
   .sel0 (mux2_sel_c8_0_ff[12]), // Old data sel
   .in1  (ext_inval_data_c8[122]),
   .sel1 (mux2_sel_c8_1_ff[12]), // Inval
   .in2  (ext_ret_data_c8[122]),
   .sel2 (mux2_sel_c8_2_ff[12])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_123  
  (.out (oque_cpx_data_c8_muxout[123]),
   .in0  (tmp_cpx_data_ca_d1[123]),
   .sel0 (mux2_sel_c8_0_ff[13]), // Old data sel
   .in1  (ext_inval_data_c8[123]),
   .sel1 (mux2_sel_c8_1_ff[13]), // Inval
   .in2  (ext_ret_data_c8[123]),
   .sel2 (mux2_sel_c8_2_ff[13])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_124  
  (.out (oque_cpx_data_c8_muxout[124]),
   .in0  (tmp_cpx_data_ca_d1[124]),
   .sel0 (mux2_sel_c8_0_ff[14]), // Old data sel
   .in1  (ext_inval_data_c8[124]),
   .sel1 (mux2_sel_c8_1_ff[14]), // Inval
   .in2  (ext_ret_data_c8[124]),
   .sel2 (mux2_sel_c8_2_ff[14])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_125  
  (.out (oque_cpx_data_c8_muxout[125]),
   .in0  (tmp_cpx_data_ca_d1[125]),
   .sel0 (mux2_sel_c8_0_ff[15]), // Old data sel
   .in1  (ext_inval_data_c8[125]),
   .sel1 (mux2_sel_c8_1_ff[15]), // Inval
   .in2  (ext_ret_data_c8[125]),
   .sel2 (mux2_sel_c8_2_ff[15])  // Def Sel
  ) ;

//--- 129:126  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_126  
  (.out (oque_cpx_data_c8_muxout[126]),
   .in0  (tmp_cpx_data_ca_d1[126]),
   .sel0 (mux2_sel_c8_0_ff[16]), // Old data sel
   .in1  (ext_inval_data_c8[126]),
   .sel1 (mux2_sel_c8_1_ff[16]), // Inval
   .in2  (ext_ret_data_c8[126]),
   .sel2 (mux2_sel_c8_2_ff[16])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_127  
  (.out (oque_cpx_data_c8_muxout[127]),
   .in0  (tmp_cpx_data_ca_d1[127]),
   .sel0 (mux2_sel_c8_0_ff[17]), // Old data sel
   .in1  (ext_inval_data_c8[127]),
   .sel1 (mux2_sel_c8_1_ff[17]), // Inval
   .in2  (ext_ret_data_c8[127]),
   .sel2 (mux2_sel_c8_2_ff[17])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_128  
  (.out (oque_cpx_data_c8_muxout[128]),
   .in0  (tmp_cpx_data_ca_d1[128]),
   .sel0 (mux2_sel_c8_0_ff[18]), // Old data sel
   .in1  (ext_inval_data_c8[128]),
   .sel1 (mux2_sel_c8_1_ff[18]), // Inval
   .in2  (ext_ret_data_c8[128]),
   .sel2 (mux2_sel_c8_2_ff[18])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_129  
  (.out (oque_cpx_data_c8_muxout[129]),
   .in0  (tmp_cpx_data_ca_d1[129]),
   .sel0 (mux2_sel_c8_0_ff[19]), // Old data sel
   .in1  (ext_inval_data_c8[129]),
   .sel1 (mux2_sel_c8_1_ff[19]), // Inval
   .in2  (ext_ret_data_c8[129]),
   .sel2 (mux2_sel_c8_2_ff[19])  // Def Sel
  ) ;

//--- 133:130  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_130  
  (.out (oque_cpx_data_c8_muxout[130]),
   .in0  (tmp_cpx_data_ca_d1[130]),
   .sel0 (mux2_sel_c8_0_ff[20]), // Old data sel
   .in1  (ext_inval_data_c8[130]),
   .sel1 (mux2_sel_c8_1_ff[20]), // Inval
   .in2  (ext_ret_data_c8[130]),
   .sel2 (mux2_sel_c8_2_ff[20])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_131  
  (.out (oque_cpx_data_c8_muxout[131]),
   .in0  (tmp_cpx_data_ca_d1[131]),
   .sel0 (mux2_sel_c8_0_ff[21]), // Old data sel
   .in1  (ext_inval_data_c8[131]),
   .sel1 (mux2_sel_c8_1_ff[21]), // Inval
   .in2  (ext_ret_data_c8[131]),
   .sel2 (mux2_sel_c8_2_ff[21])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_132  
  (.out (oque_cpx_data_c8_muxout[132]),
   .in0  (tmp_cpx_data_ca_d1[132]),
   .sel0 (mux2_sel_c8_0_ff[22]), // Old data sel
   .in1  (ext_inval_data_c8[132]),
   .sel1 (mux2_sel_c8_1_ff[22]), // Inval
   .in2  (ext_ret_data_c8[132]),
   .sel2 (mux2_sel_c8_2_ff[22])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_133  
  (.out (oque_cpx_data_c8_muxout[133]),
   .in0  (tmp_cpx_data_ca_d1[133]),
   .sel0 (mux2_sel_c8_0_ff[23]), // Old data sel
   .in1  (ext_inval_data_c8[133]),
   .sel1 (mux2_sel_c8_1_ff[23]), // Inval
   .in2  (ext_ret_data_c8[133]),
   .sel2 (mux2_sel_c8_2_ff[23])  // Def Sel
  ) ;

//--- 137:134  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_134  
  (.out (oque_cpx_data_c8_muxout[134]),
   .in0  (tmp_cpx_data_ca_d1[134]),
   .sel0 (mux2_sel_c8_0_ff[24]), // Old data sel
   .in1  (oque_oq_array_data_in_inv[134]),
   .sel1 (mux2_sel_c8_1_ff[24]), // Inval
   .in2  (oque_oq_array_data_in_inv[134]),
   .sel2 (mux2_sel_c8_2_ff[24])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_135  
  (.out (oque_cpx_data_c8_muxout[135]),
   .in0  (tmp_cpx_data_ca_d1[135]),
   .sel0 (mux2_sel_c8_0_ff[25]), // Old data sel
   .in1  (oque_oq_array_data_in_inv[135]),
   .sel1 (mux2_sel_c8_1_ff[25]), // Inval
   .in2  (oque_oq_array_data_in_inv[135]),
   .sel2 (mux2_sel_c8_2_ff[25])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_136  
  (.out (oque_cpx_data_c8_muxout[136]),
   .in0  (tmp_cpx_data_ca_d1[136]),
   .sel0 (mux2_sel_c8_0_ff[26]), // Old data sel
   .in1  (oque_oq_array_data_in_inv[136]),
   .sel1 (mux2_sel_c8_1_ff[26]), // Inval
   .in2  (oque_oq_array_data_in_inv[136]),
   .sel2 (mux2_sel_c8_2_ff[26])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_137  
  (.out (oque_cpx_data_c8_muxout[137]),
   .in0  (tmp_cpx_data_ca_d1[137]),
   .sel0 (mux2_sel_c8_0_ff[27]), // Old data sel
   .in1  (oque_oq_array_data_in_inv[137]),
   .sel1 (mux2_sel_c8_1_ff[27]), // Inval
   .in2  (oque_oq_array_data_in_inv[137]),
   .sel2 (mux2_sel_c8_2_ff[27])  // Def Sel
  ) ;

//--- 141:138  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_138  
  (.out (oque_cpx_data_c8_muxout[138]),
   .in0  (tmp_cpx_data_ca_d1[138]),
   .sel0 (mux2_sel_c8_0_ff[28]), // Old data sel
   .in1  (oque_oq_array_data_in_inv[138]),
   .sel1 (mux2_sel_c8_1_ff[28]), // Inval
   .in2  (oque_oq_array_data_in_inv[138]),
   .sel2 (mux2_sel_c8_2_ff[28])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_139  
  (.out (oque_cpx_data_c8_muxout[139]),
   .in0  (tmp_cpx_data_ca_d1[139]),
   .sel0 (mux2_sel_c8_0_ff[29]), // Old data sel
   .in1  (oque_oq_array_data_in_inv[139]),
   .sel1 (mux2_sel_c8_1_ff[29]), // Inval
   .in2  (oque_oq_array_data_in_inv[139]),
   .sel2 (mux2_sel_c8_2_ff[29])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_140  
  (.out (oque_cpx_data_c8_muxout[140]),
   .in0  (tmp_cpx_data_ca_d1[140]),
   .sel0 (mux2_sel_c8_0_ff[30]), // Old data sel
   .in1  (oque_oq_array_data_in_inv[140]),
   .sel1 (mux2_sel_c8_1_ff[30]), // Inval
   .in2  (oque_oq_array_data_in_inv[140]),
   .sel2 (mux2_sel_c8_2_ff[30])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_141  
  (.out (oque_cpx_data_c8_muxout[141]),
   .in0  (tmp_cpx_data_ca_d1[141]),
   .sel0 (mux2_sel_c8_0_ff[31]), // Old data sel
   .in1  (oque_oq_array_data_in_inv[141]),
   .sel1 (mux2_sel_c8_1_ff[31]), // Inval
   .in2  (oque_oq_array_data_in_inv[141]),
   .sel2 (mux2_sel_c8_2_ff[31])  // Def Sel
  ) ;

//--- 145:142  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_142  
  (.out (oque_cpx_data_c8_muxout[142]),
   .in0  (tmp_cpx_data_ca_d1[142]),
   .sel0 (mux2_sel_c8_0_ff[32]), // Old data sel
   .in1  (oque_oq_array_data_in_inv[142]),
   .sel1 (mux2_sel_c8_1_ff[32]), // Inval
   .in2  (oque_oq_array_data_in_inv[142]),
   .sel2 (mux2_sel_c8_2_ff[32])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_143  
  (.out (oque_cpx_data_c8_muxout[143]),
   .in0  (tmp_cpx_data_ca_d1[143]),
   .sel0 (mux2_sel_c8_0_ff[33]), // Old data sel
   .in1  (oque_oq_array_data_in_inv[143]),
   .sel1 (mux2_sel_c8_1_ff[33]), // Inval
   .in2  (oque_oq_array_data_in_inv[143]),
   .sel2 (mux2_sel_c8_2_ff[33])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_144  
  (.out (oque_cpx_data_c8_muxout[144]),
   .in0  (tmp_cpx_data_ca_d1[144]),
   .sel0 (mux2_sel_c8_0_ff[34]), // Old data sel
   .in1  (oque_oq_array_data_in_inv[144]),
   .sel1 (mux2_sel_c8_1_ff[34]), // Inval
   .in2  (oque_oq_array_data_in_inv[144]),
   .sel2 (mux2_sel_c8_2_ff[34])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_145  
  (.out (oque_cpx_data_c8_muxout[145]),
   .in0  (tmp_cpx_data_ca_d1[145]),
   .sel0 (mux2_sel_c8_0_ff[35]), // Old data sel
   .in1  (oque_oq_array_data_in_inv[145]),
   .sel1 (mux2_sel_c8_1_ff[35]), // Inval
   .in2  (oque_oq_array_data_in_inv[145]),
   .sel2 (mux2_sel_c8_2_ff[35])  // Def Sel
  ) ;

assign oque_oq_array_data_in_inv[145] = 1'b0 ;
///////////////////////////////////////////////////////////////////////////////////////////////
// Second Row of muxes. 
///////////////////////////////////////////////////////////////////////////////////////////////

//--- 77:74  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_74  
  (.out (oque_cpx_data_c8_muxout[74]),
   .in0  (tmp_cpx_data_ca_d1[74]),
   .sel0 (mux2_sel_c8_0_ff[0]), // Old data sel
   .in1  (ext_inval_data_c8[74]),
   .sel1 (mux2_sel_c8_1_ff[0]), // Inval
   .in2  (ext_ret_data_c8[74]),
   .sel2 (mux2_sel_c8_2_ff[0])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_75  
  (.out (oque_cpx_data_c8_muxout[75]),
   .in0  (tmp_cpx_data_ca_d1[75]),
   .sel0 (mux2_sel_c8_0_ff[1]), // Old data sel
   .in1  (ext_inval_data_c8[75]),
   .sel1 (mux2_sel_c8_1_ff[1]), // Inval
   .in2  (ext_ret_data_c8[75]),
   .sel2 (mux2_sel_c8_2_ff[1])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_76  
  (.out (oque_cpx_data_c8_muxout[76]),
   .in0  (tmp_cpx_data_ca_d1[76]),
   .sel0 (mux2_sel_c8_0_ff[2]), // Old data sel
   .in1  (ext_inval_data_c8[76]),
   .sel1 (mux2_sel_c8_1_ff[2]), // Inval
   .in2  (ext_ret_data_c8[76]),
   .sel2 (mux2_sel_c8_2_ff[2])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_77  
  (.out (oque_cpx_data_c8_muxout[77]),
   .in0  (tmp_cpx_data_ca_d1[77]),
   .sel0 (mux2_sel_c8_0_ff[3]), // Old data sel
   .in1  (ext_inval_data_c8[77]),
   .sel1 (mux2_sel_c8_1_ff[3]), // Inval
   .in2  (ext_ret_data_c8[77]),
   .sel2 (mux2_sel_c8_2_ff[3])  // Def Sel
  ) ;
//--- 81:78  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_78  
  (.out (oque_cpx_data_c8_muxout[78]),
   .in0  (tmp_cpx_data_ca_d1[78]),
   .sel0 (mux2_sel_c8_0_ff[4]), // Old data sel
   .in1  (ext_inval_data_c8[78]),
   .sel1 (mux2_sel_c8_1_ff[4]), // Inval
   .in2  (ext_ret_data_c8[78]),
   .sel2 (mux2_sel_c8_2_ff[4])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_79  
  (.out (oque_cpx_data_c8_muxout[79]),
   .in0  (tmp_cpx_data_ca_d1[79]),
   .sel0 (mux2_sel_c8_0_ff[5]), // Old data sel
   .in1  (ext_inval_data_c8[79]),
   .sel1 (mux2_sel_c8_1_ff[5]), // Inval
   .in2  (ext_ret_data_c8[79]),
   .sel2 (mux2_sel_c8_2_ff[5])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_80  
  (.out (oque_cpx_data_c8_muxout[80]),
   .in0  (tmp_cpx_data_ca_d1[80]),
   .sel0 (mux2_sel_c8_0_ff[6]), // Old data sel
   .in1  (ext_inval_data_c8[80]),
   .sel1 (mux2_sel_c8_1_ff[6]), // Inval
   .in2  (ext_ret_data_c8[80]),
   .sel2 (mux2_sel_c8_2_ff[6])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_81  
  (.out (oque_cpx_data_c8_muxout[81]),
   .in0  (tmp_cpx_data_ca_d1[81]),
   .sel0 (mux2_sel_c8_0_ff[7]), // Old data sel
   .in1  (ext_inval_data_c8[81]),
   .sel1 (mux2_sel_c8_1_ff[7]), // Inval
   .in2  (ext_ret_data_c8[81]),
   .sel2 (mux2_sel_c8_2_ff[7])  // Def Sel
  ) ;

//--- 85:82  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_82  
  (.out (oque_cpx_data_c8_muxout[82]),
   .in0  (tmp_cpx_data_ca_d1[82]),
   .sel0 (mux2_sel_c8_0_ff[8]), // Old data sel
   .in1  (ext_inval_data_c8[82]),
   .sel1 (mux2_sel_c8_1_ff[8]), // Inval
   .in2  (ext_ret_data_c8[82]),
   .sel2 (mux2_sel_c8_2_ff[8])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_83  
  (.out (oque_cpx_data_c8_muxout[83]),
   .in0  (tmp_cpx_data_ca_d1[83]),
   .sel0 (mux2_sel_c8_0_ff[9]), // Old data sel
   .in1  (ext_inval_data_c8[83]),
   .sel1 (mux2_sel_c8_1_ff[9]), // Inval
   .in2  (ext_ret_data_c8[83]),
   .sel2 (mux2_sel_c8_2_ff[9])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_84  
  (.out (oque_cpx_data_c8_muxout[84]),
   .in0  (tmp_cpx_data_ca_d1[84]),
   .sel0 (mux2_sel_c8_0_ff[10]), // Old data sel
   .in1  (ext_inval_data_c8[84]),
   .sel1 (mux2_sel_c8_1_ff[10]), // Inval
   .in2  (ext_ret_data_c8[84]),
   .sel2 (mux2_sel_c8_2_ff[10])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_85  
  (.out (oque_cpx_data_c8_muxout[85]),
   .in0  (tmp_cpx_data_ca_d1[85]),
   .sel0 (mux2_sel_c8_0_ff[11]), // Old data sel
   .in1  (ext_inval_data_c8[85]),
   .sel1 (mux2_sel_c8_1_ff[11]), // Inval
   .in2  (ext_ret_data_c8[85]),
   .sel2 (mux2_sel_c8_2_ff[11])  // Def Sel
  ) ;

//--- 89:86  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_86  
  (.out (oque_cpx_data_c8_muxout[86]),
   .in0  (tmp_cpx_data_ca_d1[86]),
   .sel0 (mux2_sel_c8_0_ff[12]), // Old data sel
   .in1  (ext_inval_data_c8[86]),
   .sel1 (mux2_sel_c8_1_ff[12]), // Inval
   .in2  (ext_ret_data_c8[86]),
   .sel2 (mux2_sel_c8_2_ff[12])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_87  
  (.out (oque_cpx_data_c8_muxout[87]),
   .in0  (tmp_cpx_data_ca_d1[87]),
   .sel0 (mux2_sel_c8_0_ff[13]), // Old data sel
   .in1  (ext_inval_data_c8[87]),
   .sel1 (mux2_sel_c8_1_ff[13]), // Inval
   .in2  (ext_ret_data_c8[87]),
   .sel2 (mux2_sel_c8_2_ff[13])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_88  
  (.out (oque_cpx_data_c8_muxout[88]),
   .in0  (tmp_cpx_data_ca_d1[88]),
   .sel0 (mux2_sel_c8_0_ff[14]), // Old data sel
   .in1  (ext_inval_data_c8[88]),
   .sel1 (mux2_sel_c8_1_ff[14]), // Inval
   .in2  (ext_ret_data_c8[88]),
   .sel2 (mux2_sel_c8_2_ff[14])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_89  
  (.out (oque_cpx_data_c8_muxout[89]),
   .in0  (tmp_cpx_data_ca_d1[89]),
   .sel0 (mux2_sel_c8_0_ff[15]), // Old data sel
   .in1  (ext_inval_data_c8[89]),
   .sel1 (mux2_sel_c8_1_ff[15]), // Inval
   .in2  (ext_ret_data_c8[89]),
   .sel2 (mux2_sel_c8_2_ff[15])  // Def Sel
  ) ;

//--- 93:90  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_90  
  (.out (oque_cpx_data_c8_muxout[90]),
   .in0  (tmp_cpx_data_ca_d1[90]),
   .sel0 (mux2_sel_c8_0_ff[16]), // Old data sel
   .in1  (ext_inval_data_c8[90]),
   .sel1 (mux2_sel_c8_1_ff[16]), // Inval
   .in2  (ext_ret_data_c8[90]),
   .sel2 (mux2_sel_c8_2_ff[16])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_91  
  (.out (oque_cpx_data_c8_muxout[91]),
   .in0  (tmp_cpx_data_ca_d1[91]),
   .sel0 (mux2_sel_c8_0_ff[17]), // Old data sel
   .in1  (ext_inval_data_c8[91]),
   .sel1 (mux2_sel_c8_1_ff[17]), // Inval
   .in2  (ext_ret_data_c8[91]),
   .sel2 (mux2_sel_c8_2_ff[17])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_92  
  (.out (oque_cpx_data_c8_muxout[92]),
   .in0  (tmp_cpx_data_ca_d1[92]),
   .sel0 (mux2_sel_c8_0_ff[18]), // Old data sel
   .in1  (ext_inval_data_c8[92]),
   .sel1 (mux2_sel_c8_1_ff[18]), // Inval
   .in2  (ext_ret_data_c8[92]),
   .sel2 (mux2_sel_c8_2_ff[18])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_93  
  (.out (oque_cpx_data_c8_muxout[93]),
   .in0  (tmp_cpx_data_ca_d1[93]),
   .sel0 (mux2_sel_c8_0_ff[19]), // Old data sel
   .in1  (ext_inval_data_c8[93]),
   .sel1 (mux2_sel_c8_1_ff[19]), // Inval
   .in2  (ext_ret_data_c8[93]),
   .sel2 (mux2_sel_c8_2_ff[19])  // Def Sel
  ) ;

//--- 97:94  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_94  
  (.out (oque_cpx_data_c8_muxout[94]),
   .in0  (tmp_cpx_data_ca_d1[94]),
   .sel0 (mux2_sel_c8_0_ff[20]), // Old data sel
   .in1  (ext_inval_data_c8[94]),
   .sel1 (mux2_sel_c8_1_ff[20]), // Inval
   .in2  (ext_ret_data_c8[94]),
   .sel2 (mux2_sel_c8_2_ff[20])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_95  
  (.out (oque_cpx_data_c8_muxout[95]),
   .in0  (tmp_cpx_data_ca_d1[95]),
   .sel0 (mux2_sel_c8_0_ff[21]), // Old data sel
   .in1  (ext_inval_data_c8[95]),
   .sel1 (mux2_sel_c8_1_ff[21]), // Inval
   .in2  (ext_ret_data_c8[95]),
   .sel2 (mux2_sel_c8_2_ff[21])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_96  
  (.out (oque_cpx_data_c8_muxout[96]),
   .in0  (tmp_cpx_data_ca_d1[96]),
   .sel0 (mux2_sel_c8_0_ff[22]), // Old data sel
   .in1  (ext_inval_data_c8[96]),
   .sel1 (mux2_sel_c8_1_ff[22]), // Inval
   .in2  (ext_ret_data_c8[96]),
   .sel2 (mux2_sel_c8_2_ff[22])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_97  
  (.out (oque_cpx_data_c8_muxout[97]),
   .in0  (tmp_cpx_data_ca_d1[97]),
   .sel0 (mux2_sel_c8_0_ff[23]), // Old data sel
   .in1  (ext_inval_data_c8[97]),
   .sel1 (mux2_sel_c8_1_ff[23]), // Inval
   .in2  (ext_ret_data_c8[97]),
   .sel2 (mux2_sel_c8_2_ff[23])  // Def Sel
  ) ;

//--- 101:98  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_98  
  (.out (oque_cpx_data_c8_muxout[98]),
   .in0  (tmp_cpx_data_ca_d1[98]),
   .sel0 (mux2_sel_c8_0_ff[24]), // Old data sel
   .in1  (ext_inval_data_c8[98]),
   .sel1 (mux2_sel_c8_1_ff[24]), // Inval
   .in2  (ext_ret_data_c8[98]),
   .sel2 (mux2_sel_c8_2_ff[24])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_99  
  (.out (oque_cpx_data_c8_muxout[99]),
   .in0  (tmp_cpx_data_ca_d1[99]),
   .sel0 (mux2_sel_c8_0_ff[25]), // Old data sel
   .in1  (ext_inval_data_c8[99]),
   .sel1 (mux2_sel_c8_1_ff[25]), // Inval
   .in2  (ext_ret_data_c8[99]),
   .sel2 (mux2_sel_c8_2_ff[25])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_100  
  (.out (oque_cpx_data_c8_muxout[100]),
   .in0  (tmp_cpx_data_ca_d1[100]),
   .sel0 (mux2_sel_c8_0_ff[26]), // Old data sel
   .in1  (ext_inval_data_c8[100]),
   .sel1 (mux2_sel_c8_1_ff[26]), // Inval
   .in2  (ext_ret_data_c8[100]),
   .sel2 (mux2_sel_c8_2_ff[26])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_101  
  (.out (oque_cpx_data_c8_muxout[101]),
   .in0  (tmp_cpx_data_ca_d1[101]),
   .sel0 (mux2_sel_c8_0_ff[27]), // Old data sel
   .in1  (ext_inval_data_c8[101]),
   .sel1 (mux2_sel_c8_1_ff[27]), // Inval
   .in2  (ext_ret_data_c8[101]),
   .sel2 (mux2_sel_c8_2_ff[27])  // Def Sel
  ) ;

//--- 105:102  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_102  
  (.out (oque_cpx_data_c8_muxout[102]),
   .in0  (tmp_cpx_data_ca_d1[102]),
   .sel0 (mux2_sel_c8_0_ff[28]), // Old data sel
   .in1  (ext_inval_data_c8[102]),
   .sel1 (mux2_sel_c8_1_ff[28]), // Inval
   .in2  (ext_ret_data_c8[102]),
   .sel2 (mux2_sel_c8_2_ff[28])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_103  
  (.out (oque_cpx_data_c8_muxout[103]),
   .in0  (tmp_cpx_data_ca_d1[103]),
   .sel0 (mux2_sel_c8_0_ff[29]), // Old data sel
   .in1  (ext_inval_data_c8[103]),
   .sel1 (mux2_sel_c8_1_ff[29]), // Inval
   .in2  (ext_ret_data_c8[103]),
   .sel2 (mux2_sel_c8_2_ff[29])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_104  
  (.out (oque_cpx_data_c8_muxout[104]),
   .in0  (tmp_cpx_data_ca_d1[104]),
   .sel0 (mux2_sel_c8_0_ff[30]), // Old data sel
   .in1  (ext_inval_data_c8[104]),
   .sel1 (mux2_sel_c8_1_ff[30]), // Inval
   .in2  (ext_ret_data_c8[104]),
   .sel2 (mux2_sel_c8_2_ff[30])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_105  
  (.out (oque_cpx_data_c8_muxout[105]),
   .in0  (tmp_cpx_data_ca_d1[105]),
   .sel0 (mux2_sel_c8_0_ff[31]), // Old data sel
   .in1  (ext_inval_data_c8[105]),
   .sel1 (mux2_sel_c8_1_ff[31]), // Inval
   .in2  (ext_ret_data_c8[105]),
   .sel2 (mux2_sel_c8_2_ff[31])  // Def Sel
  ) ;

//--- 109:106  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_106  
  (.out (oque_cpx_data_c8_muxout[106]),
   .in0  (tmp_cpx_data_ca_d1[106]),
   .sel0 (mux2_sel_c8_0_ff[32]), // Old data sel
   .in1  (ext_inval_data_c8[106]),
   .sel1 (mux2_sel_c8_1_ff[32]), // Inval
   .in2  (ext_ret_data_c8[106]),
   .sel2 (mux2_sel_c8_2_ff[32])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_107  
  (.out (oque_cpx_data_c8_muxout[107]),
   .in0  (tmp_cpx_data_ca_d1[107]),
   .sel0 (mux2_sel_c8_0_ff[33]), // Old data sel
   .in1  (ext_inval_data_c8[107]),
   .sel1 (mux2_sel_c8_1_ff[33]), // Inval
   .in2  (ext_ret_data_c8[107]),
   .sel2 (mux2_sel_c8_2_ff[33])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_108  
  (.out (oque_cpx_data_c8_muxout[108]),
   .in0  (tmp_cpx_data_ca_d1[108]),
   .sel0 (mux2_sel_c8_0_ff[34]), // Old data sel
   .in1  (ext_inval_data_c8[108]),
   .sel1 (mux2_sel_c8_1_ff[34]), // Inval
   .in2  (ext_ret_data_c8[108]),
   .sel2 (mux2_sel_c8_2_ff[34])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_109  
  (.out (oque_cpx_data_c8_muxout[109]),
   .in0  (tmp_cpx_data_ca_d1[109]),
   .sel0 (mux2_sel_c8_0_ff[35]), // Old data sel
   .in1  (ext_inval_data_c8[109]),
   .sel1 (mux2_sel_c8_1_ff[35]), // Inval
   .in2  (ext_ret_data_c8[109]),
   .sel2 (mux2_sel_c8_2_ff[35])  // Def Sel
  ) ;

///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////
// Third Row of muxes. 
///////////////////////////////////////////////////////////////////////////////////////////////

//--- 41:38  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_38  
  (.out (oque_cpx_data_c8_muxout[38]),
   .in0  (tmp_cpx_data_ca_d1[38]),
   .sel0 (mux2_sel_c8_0_ff[0]), // Old data sel
   .in1  (ext_inval_data_c8[38]),
   .sel1 (mux2_sel_c8_1_ff[0]), // Inval
   .in2  (ext_ret_data_c8[38]),
   .sel2 (mux2_sel_c8_2_ff[0])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_39  
  (.out (oque_cpx_data_c8_muxout[39]),
   .in0  (tmp_cpx_data_ca_d1[39]),
   .sel0 (mux2_sel_c8_0_ff[1]), // Old data sel
   .in1  (ext_inval_data_c8[39]),
   .sel1 (mux2_sel_c8_1_ff[1]), // Inval
   .in2  (ext_ret_data_c8[39]),
   .sel2 (mux2_sel_c8_2_ff[1])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_40  
  (.out (oque_cpx_data_c8_muxout[40]),
   .in0  (tmp_cpx_data_ca_d1[40]),
   .sel0 (mux2_sel_c8_0_ff[2]), // Old data sel
   .in1  (ext_inval_data_c8[40]),
   .sel1 (mux2_sel_c8_1_ff[2]), // Inval
   .in2  (ext_ret_data_c8[40]),
   .sel2 (mux2_sel_c8_2_ff[2])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_41  
  (.out (oque_cpx_data_c8_muxout[41]),
   .in0  (tmp_cpx_data_ca_d1[41]),
   .sel0 (mux2_sel_c8_0_ff[3]), // Old data sel
   .in1  (ext_inval_data_c8[41]),
   .sel1 (mux2_sel_c8_1_ff[3]), // Inval
   .in2  (ext_ret_data_c8[41]),
   .sel2 (mux2_sel_c8_2_ff[3])  // Def Sel
  ) ;
//--- 45:42  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_42  
  (.out (oque_cpx_data_c8_muxout[42]),
   .in0  (tmp_cpx_data_ca_d1[42]),
   .sel0 (mux2_sel_c8_0_ff[4]), // Old data sel
   .in1  (ext_inval_data_c8[42]),
   .sel1 (mux2_sel_c8_1_ff[4]), // Inval
   .in2  (ext_ret_data_c8[42]),
   .sel2 (mux2_sel_c8_2_ff[4])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_43  
  (.out (oque_cpx_data_c8_muxout[43]),
   .in0  (tmp_cpx_data_ca_d1[43]),
   .sel0 (mux2_sel_c8_0_ff[5]), // Old data sel
   .in1  (ext_inval_data_c8[43]),
   .sel1 (mux2_sel_c8_1_ff[5]), // Inval
   .in2  (ext_ret_data_c8[43]),
   .sel2 (mux2_sel_c8_2_ff[5])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_44  
  (.out (oque_cpx_data_c8_muxout[44]),
   .in0  (tmp_cpx_data_ca_d1[44]),
   .sel0 (mux2_sel_c8_0_ff[6]), // Old data sel
   .in1  (ext_inval_data_c8[44]),
   .sel1 (mux2_sel_c8_1_ff[6]), // Inval
   .in2  (ext_ret_data_c8[44]),
   .sel2 (mux2_sel_c8_2_ff[6])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_45  
  (.out (oque_cpx_data_c8_muxout[45]),
   .in0  (tmp_cpx_data_ca_d1[45]),
   .sel0 (mux2_sel_c8_0_ff[7]), // Old data sel
   .in1  (ext_inval_data_c8[45]),
   .sel1 (mux2_sel_c8_1_ff[7]), // Inval
   .in2  (ext_ret_data_c8[45]),
   .sel2 (mux2_sel_c8_2_ff[7])  // Def Sel
  ) ;

//--- 49:46  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_46  
  (.out (oque_cpx_data_c8_muxout[46]),
   .in0  (tmp_cpx_data_ca_d1[46]),
   .sel0 (mux2_sel_c8_0_ff[8]), // Old data sel
   .in1  (ext_inval_data_c8[46]),
   .sel1 (mux2_sel_c8_1_ff[8]), // Inval
   .in2  (ext_ret_data_c8[46]),
   .sel2 (mux2_sel_c8_2_ff[8])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_47  
  (.out (oque_cpx_data_c8_muxout[47]),
   .in0  (tmp_cpx_data_ca_d1[47]),
   .sel0 (mux2_sel_c8_0_ff[9]), // Old data sel
   .in1  (ext_inval_data_c8[47]),
   .sel1 (mux2_sel_c8_1_ff[9]), // Inval
   .in2  (ext_ret_data_c8[47]),
   .sel2 (mux2_sel_c8_2_ff[9])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_48  
  (.out (oque_cpx_data_c8_muxout[48]),
   .in0  (tmp_cpx_data_ca_d1[48]),
   .sel0 (mux2_sel_c8_0_ff[10]), // Old data sel
   .in1  (ext_inval_data_c8[48]),
   .sel1 (mux2_sel_c8_1_ff[10]), // Inval
   .in2  (ext_ret_data_c8[48]),
   .sel2 (mux2_sel_c8_2_ff[10])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_49  
  (.out (oque_cpx_data_c8_muxout[49]),
   .in0  (tmp_cpx_data_ca_d1[49]),
   .sel0 (mux2_sel_c8_0_ff[11]), // Old data sel
   .in1  (ext_inval_data_c8[49]),
   .sel1 (mux2_sel_c8_1_ff[11]), // Inval
   .in2  (ext_ret_data_c8[49]),
   .sel2 (mux2_sel_c8_2_ff[11])  // Def Sel
  ) ;

//--- 53:50  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_50  
  (.out (oque_cpx_data_c8_muxout[50]),
   .in0  (tmp_cpx_data_ca_d1[50]),
   .sel0 (mux2_sel_c8_0_ff[12]), // Old data sel
   .in1  (ext_inval_data_c8[50]),
   .sel1 (mux2_sel_c8_1_ff[12]), // Inval
   .in2  (ext_ret_data_c8[50]),
   .sel2 (mux2_sel_c8_2_ff[12])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_51  
  (.out (oque_cpx_data_c8_muxout[51]),
   .in0  (tmp_cpx_data_ca_d1[51]),
   .sel0 (mux2_sel_c8_0_ff[13]), // Old data sel
   .in1  (ext_inval_data_c8[51]),
   .sel1 (mux2_sel_c8_1_ff[13]), // Inval
   .in2  (ext_ret_data_c8[51]),
   .sel2 (mux2_sel_c8_2_ff[13])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_52  
  (.out (oque_cpx_data_c8_muxout[52]),
   .in0  (tmp_cpx_data_ca_d1[52]),
   .sel0 (mux2_sel_c8_0_ff[14]), // Old data sel
   .in1  (ext_inval_data_c8[52]),
   .sel1 (mux2_sel_c8_1_ff[14]), // Inval
   .in2  (ext_ret_data_c8[52]),
   .sel2 (mux2_sel_c8_2_ff[14])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_53  
  (.out (oque_cpx_data_c8_muxout[53]),
   .in0  (tmp_cpx_data_ca_d1[53]),
   .sel0 (mux2_sel_c8_0_ff[15]), // Old data sel
   .in1  (ext_inval_data_c8[53]),
   .sel1 (mux2_sel_c8_1_ff[15]), // Inval
   .in2  (ext_ret_data_c8[53]),
   .sel2 (mux2_sel_c8_2_ff[15])  // Def Sel
  ) ;

//--- 57:54  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_54  
  (.out (oque_cpx_data_c8_muxout[54]),
   .in0  (tmp_cpx_data_ca_d1[54]),
   .sel0 (mux2_sel_c8_0_ff[16]), // Old data sel
   .in1  (ext_inval_data_c8[54]),
   .sel1 (mux2_sel_c8_1_ff[16]), // Inval
   .in2  (ext_ret_data_c8[54]),
   .sel2 (mux2_sel_c8_2_ff[16])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_55  
  (.out (oque_cpx_data_c8_muxout[55]),
   .in0  (tmp_cpx_data_ca_d1[55]),
   .sel0 (mux2_sel_c8_0_ff[17]), // Old data sel
   .in1  (ext_inval_data_c8[55]),
   .sel1 (mux2_sel_c8_1_ff[17]), // Inval
   .in2  (ext_ret_data_c8[55]),
   .sel2 (mux2_sel_c8_2_ff[17])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_56  
  (.out (oque_cpx_data_c8_muxout[56]),
   .in0  (tmp_cpx_data_ca_d1[56]),
   .sel0 (mux2_sel_c8_0_ff[18]), // Old data sel
   .in1  (ext_inval_data_c8[56]),
   .sel1 (mux2_sel_c8_1_ff[18]), // Inval
   .in2  (ext_ret_data_c8[56]),
   .sel2 (mux2_sel_c8_2_ff[18])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_57  
  (.out (oque_cpx_data_c8_muxout[57]),
   .in0  (tmp_cpx_data_ca_d1[57]),
   .sel0 (mux2_sel_c8_0_ff[19]), // Old data sel
   .in1  (ext_inval_data_c8[57]),
   .sel1 (mux2_sel_c8_1_ff[19]), // Inval
   .in2  (ext_ret_data_c8[57]),
   .sel2 (mux2_sel_c8_2_ff[19])  // Def Sel
  ) ;

//--- 61:58  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_58  
  (.out (oque_cpx_data_c8_muxout[58]),
   .in0  (tmp_cpx_data_ca_d1[58]),
   .sel0 (mux2_sel_c8_0_ff[20]), // Old data sel
   .in1  (ext_inval_data_c8[58]),
   .sel1 (mux2_sel_c8_1_ff[20]), // Inval
   .in2  (ext_ret_data_c8[58]),
   .sel2 (mux2_sel_c8_2_ff[20])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_59  
  (.out (oque_cpx_data_c8_muxout[59]),
   .in0  (tmp_cpx_data_ca_d1[59]),
   .sel0 (mux2_sel_c8_0_ff[21]), // Old data sel
   .in1  (ext_inval_data_c8[59]),
   .sel1 (mux2_sel_c8_1_ff[21]), // Inval
   .in2  (ext_ret_data_c8[59]),
   .sel2 (mux2_sel_c8_2_ff[21])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_60  
  (.out (oque_cpx_data_c8_muxout[60]),
   .in0  (tmp_cpx_data_ca_d1[60]),
   .sel0 (mux2_sel_c8_0_ff[22]), // Old data sel
   .in1  (ext_inval_data_c8[60]),
   .sel1 (mux2_sel_c8_1_ff[22]), // Inval
   .in2  (ext_ret_data_c8[60]),
   .sel2 (mux2_sel_c8_2_ff[22])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_61  
  (.out (oque_cpx_data_c8_muxout[61]),
   .in0  (tmp_cpx_data_ca_d1[61]),
   .sel0 (mux2_sel_c8_0_ff[23]), // Old data sel
   .in1  (ext_inval_data_c8[61]),
   .sel1 (mux2_sel_c8_1_ff[23]), // Inval
   .in2  (ext_ret_data_c8[61]),
   .sel2 (mux2_sel_c8_2_ff[23])  // Def Sel
  ) ;

//--- 65:62  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_62  
  (.out (oque_cpx_data_c8_muxout[62]),
   .in0  (tmp_cpx_data_ca_d1[62]),
   .sel0 (mux2_sel_c8_0_ff[24]), // Old data sel
   .in1  (ext_inval_data_c8[62]),
   .sel1 (mux2_sel_c8_1_ff[24]), // Inval
   .in2  (ext_ret_data_c8[62]),
   .sel2 (mux2_sel_c8_2_ff[24])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_63  
  (.out (oque_cpx_data_c8_muxout[63]),
   .in0  (tmp_cpx_data_ca_d1[63]),
   .sel0 (mux2_sel_c8_0_ff[25]), // Old data sel
   .in1  (ext_inval_data_c8[63]),
   .sel1 (mux2_sel_c8_1_ff[25]), // Inval
   .in2  (ext_ret_data_c8[63]),
   .sel2 (mux2_sel_c8_2_ff[25])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_64  
  (.out (oque_cpx_data_c8_muxout[64]),
   .in0  (tmp_cpx_data_ca_d1[64]),
   .sel0 (mux2_sel_c8_0_ff[26]), // Old data sel
   .in1  (ext_inval_data_c8[64]),
   .sel1 (mux2_sel_c8_1_ff[26]), // Inval
   .in2  (ext_ret_data_c8[64]),
   .sel2 (mux2_sel_c8_2_ff[26])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_65  
  (.out (oque_cpx_data_c8_muxout[65]),
   .in0  (tmp_cpx_data_ca_d1[65]),
   .sel0 (mux2_sel_c8_0_ff[27]), // Old data sel
   .in1  (ext_inval_data_c8[65]),
   .sel1 (mux2_sel_c8_1_ff[27]), // Inval
   .in2  (ext_ret_data_c8[65]),
   .sel2 (mux2_sel_c8_2_ff[27])  // Def Sel
  ) ;

//--- 69:66  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_66  
  (.out (oque_cpx_data_c8_muxout[66]),
   .in0  (tmp_cpx_data_ca_d1[66]),
   .sel0 (mux2_sel_c8_0_ff[28]), // Old data sel
   .in1  (ext_inval_data_c8[66]),
   .sel1 (mux2_sel_c8_1_ff[28]), // Inval
   .in2  (ext_ret_data_c8[66]),
   .sel2 (mux2_sel_c8_2_ff[28])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_67  
  (.out (oque_cpx_data_c8_muxout[67]),
   .in0  (tmp_cpx_data_ca_d1[67]),
   .sel0 (mux2_sel_c8_0_ff[29]), // Old data sel
   .in1  (ext_inval_data_c8[67]),
   .sel1 (mux2_sel_c8_1_ff[29]), // Inval
   .in2  (ext_ret_data_c8[67]),
   .sel2 (mux2_sel_c8_2_ff[29])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_68  
  (.out (oque_cpx_data_c8_muxout[68]),
   .in0  (tmp_cpx_data_ca_d1[68]),
   .sel0 (mux2_sel_c8_0_ff[30]), // Old data sel
   .in1  (ext_inval_data_c8[68]),
   .sel1 (mux2_sel_c8_1_ff[30]), // Inval
   .in2  (ext_ret_data_c8[68]),
   .sel2 (mux2_sel_c8_2_ff[30])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_69  
  (.out (oque_cpx_data_c8_muxout[69]),
   .in0  (tmp_cpx_data_ca_d1[69]),
   .sel0 (mux2_sel_c8_0_ff[31]), // Old data sel
   .in1  (ext_inval_data_c8[69]),
   .sel1 (mux2_sel_c8_1_ff[31]), // Inval
   .in2  (ext_ret_data_c8[69]),
   .sel2 (mux2_sel_c8_2_ff[31])  // Def Sel
  ) ;

//--- 73:70  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_70  
  (.out (oque_cpx_data_c8_muxout[70]),
   .in0  (tmp_cpx_data_ca_d1[70]),
   .sel0 (mux2_sel_c8_0_ff[32]), // Old data sel
   .in1  (ext_inval_data_c8[70]),
   .sel1 (mux2_sel_c8_1_ff[32]), // Inval
   .in2  (ext_ret_data_c8[70]),
   .sel2 (mux2_sel_c8_2_ff[32])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_71  
  (.out (oque_cpx_data_c8_muxout[71]),
   .in0  (tmp_cpx_data_ca_d1[71]),
   .sel0 (mux2_sel_c8_0_ff[33]), // Old data sel
   .in1  (ext_inval_data_c8[71]),
   .sel1 (mux2_sel_c8_1_ff[33]), // Inval
   .in2  (ext_ret_data_c8[71]),
   .sel2 (mux2_sel_c8_2_ff[33])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_72  
  (.out (oque_cpx_data_c8_muxout[72]),
   .in0  (tmp_cpx_data_ca_d1[72]),
   .sel0 (mux2_sel_c8_0_ff[34]), // Old data sel
   .in1  (ext_inval_data_c8[72]),
   .sel1 (mux2_sel_c8_1_ff[34]), // Inval
   .in2  (ext_ret_data_c8[72]),
   .sel2 (mux2_sel_c8_2_ff[34])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_73  
  (.out (oque_cpx_data_c8_muxout[73]),
   .in0  (tmp_cpx_data_ca_d1[73]),
   .sel0 (mux2_sel_c8_0_ff[35]), // Old data sel
   .in1  (ext_inval_data_c8[73]),
   .sel1 (mux2_sel_c8_1_ff[35]), // Inval
   .in2  (ext_ret_data_c8[73]),
   .sel2 (mux2_sel_c8_2_ff[35])  // Def Sel
  ) ;

///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////
// Fourth Row of muxes. 
///////////////////////////////////////////////////////////////////////////////////////////////

//--- 3:0  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_0  
  (.out (oque_cpx_data_c8_muxout[0]),
   .in0  (tmp_cpx_data_ca_d1[0]),
   .sel0 (mux2_sel_c8_0_ff[0]), // Old data sel
   .in1  (ext_inval_data_c8[0]),
   .sel1 (mux2_sel_c8_1_ff[0]), // Inval
   .in2  (ext_ret_data_c8[0]),
   .sel2 (mux2_sel_c8_2_ff[0])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_1  
  (.out (oque_cpx_data_c8_muxout[1]),
   .in0  (tmp_cpx_data_ca_d1[1]),
   .sel0 (mux2_sel_c8_0_ff[1]), // Old data sel
   .in1  (ext_inval_data_c8[1]),
   .sel1 (mux2_sel_c8_1_ff[1]), // Inval
   .in2  (ext_ret_data_c8[1]),
   .sel2 (mux2_sel_c8_2_ff[1])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_2  
  (.out (oque_cpx_data_c8_muxout[2]),
   .in0  (tmp_cpx_data_ca_d1[2]),
   .sel0 (mux2_sel_c8_0_ff[2]), // Old data sel
   .in1  (ext_inval_data_c8[2]),
   .sel1 (mux2_sel_c8_1_ff[2]), // Inval
   .in2  (ext_ret_data_c8[2]),
   .sel2 (mux2_sel_c8_2_ff[2])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_3  
  (.out (oque_cpx_data_c8_muxout[3]),
   .in0  (tmp_cpx_data_ca_d1[3]),
   .sel0 (mux2_sel_c8_0_ff[3]), // Old data sel
   .in1  (ext_inval_data_c8[3]),
   .sel1 (mux2_sel_c8_1_ff[3]), // Inval
   .in2  (ext_ret_data_c8[3]),
   .sel2 (mux2_sel_c8_2_ff[3])  // Def Sel
  ) ;
//--- 7:4  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_4  
  (.out (oque_cpx_data_c8_muxout[4]),
   .in0  (tmp_cpx_data_ca_d1[4]),
   .sel0 (mux2_sel_c8_0_ff[4]), // Old data sel
   .in1  (ext_inval_data_c8[4]),
   .sel1 (mux2_sel_c8_1_ff[4]), // Inval
   .in2  (ext_ret_data_c8[4]),
   .sel2 (mux2_sel_c8_2_ff[4])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_5  
  (.out (oque_cpx_data_c8_muxout[5]),
   .in0  (tmp_cpx_data_ca_d1[5]),
   .sel0 (mux2_sel_c8_0_ff[5]), // Old data sel
   .in1  (ext_inval_data_c8[5]),
   .sel1 (mux2_sel_c8_1_ff[5]), // Inval
   .in2  (ext_ret_data_c8[5]),
   .sel2 (mux2_sel_c8_2_ff[5])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_6  
  (.out (oque_cpx_data_c8_muxout[6]),
   .in0  (tmp_cpx_data_ca_d1[6]),
   .sel0 (mux2_sel_c8_0_ff[6]), // Old data sel
   .in1  (ext_inval_data_c8[6]),
   .sel1 (mux2_sel_c8_1_ff[6]), // Inval
   .in2  (ext_ret_data_c8[6]),
   .sel2 (mux2_sel_c8_2_ff[6])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_7  
  (.out (oque_cpx_data_c8_muxout[7]),
   .in0  (tmp_cpx_data_ca_d1[7]),
   .sel0 (mux2_sel_c8_0_ff[7]), // Old data sel
   .in1  (ext_inval_data_c8[7]),
   .sel1 (mux2_sel_c8_1_ff[7]), // Inval
   .in2  (ext_ret_data_c8[7]),
   .sel2 (mux2_sel_c8_2_ff[7])  // Def Sel
  ) ;

//--- 11:8  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_8  
  (.out (oque_cpx_data_c8_muxout[8]),
   .in0  (tmp_cpx_data_ca_d1[8]),
   .sel0 (mux2_sel_c8_0_ff[8]), // Old data sel
   .in1  (ext_inval_data_c8[8]),
   .sel1 (mux2_sel_c8_1_ff[8]), // Inval
   .in2  (ext_ret_data_c8[8]),
   .sel2 (mux2_sel_c8_2_ff[8])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_9  
  (.out (oque_cpx_data_c8_muxout[9]),
   .in0  (tmp_cpx_data_ca_d1[9]),
   .sel0 (mux2_sel_c8_0_ff[9]), // Old data sel
   .in1  (ext_inval_data_c8[9]),
   .sel1 (mux2_sel_c8_1_ff[9]), // Inval
   .in2  (ext_ret_data_c8[9]),
   .sel2 (mux2_sel_c8_2_ff[9])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_10  
  (.out (oque_cpx_data_c8_muxout[10]),
   .in0  (tmp_cpx_data_ca_d1[10]),
   .sel0 (mux2_sel_c8_0_ff[10]), // Old data sel
   .in1  (ext_inval_data_c8[10]),
   .sel1 (mux2_sel_c8_1_ff[10]), // Inval
   .in2  (ext_ret_data_c8[10]),
   .sel2 (mux2_sel_c8_2_ff[10])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_11  
  (.out (oque_cpx_data_c8_muxout[11]),
   .in0  (tmp_cpx_data_ca_d1[11]),
   .sel0 (mux2_sel_c8_0_ff[11]), // Old data sel
   .in1  (ext_inval_data_c8[11]),
   .sel1 (mux2_sel_c8_1_ff[11]), // Inval
   .in2  (ext_ret_data_c8[11]),
   .sel2 (mux2_sel_c8_2_ff[11])  // Def Sel
  ) ;

//--- 15:12  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_12  
  (.out (oque_cpx_data_c8_muxout[12]),
   .in0  (tmp_cpx_data_ca_d1[12]),
   .sel0 (mux2_sel_c8_0_ff[12]), // Old data sel
   .in1  (ext_inval_data_c8[12]),
   .sel1 (mux2_sel_c8_1_ff[12]), // Inval
   .in2  (ext_ret_data_c8[12]),
   .sel2 (mux2_sel_c8_2_ff[12])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_13  
  (.out (oque_cpx_data_c8_muxout[13]),
   .in0  (tmp_cpx_data_ca_d1[13]),
   .sel0 (mux2_sel_c8_0_ff[13]), // Old data sel
   .in1  (ext_inval_data_c8[13]),
   .sel1 (mux2_sel_c8_1_ff[13]), // Inval
   .in2  (ext_ret_data_c8[13]),
   .sel2 (mux2_sel_c8_2_ff[13])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_14  
  (.out (oque_cpx_data_c8_muxout[14]),
   .in0  (tmp_cpx_data_ca_d1[14]),
   .sel0 (mux2_sel_c8_0_ff[14]), // Old data sel
   .in1  (ext_inval_data_c8[14]),
   .sel1 (mux2_sel_c8_1_ff[14]), // Inval
   .in2  (ext_ret_data_c8[14]),
   .sel2 (mux2_sel_c8_2_ff[14])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_15  
  (.out (oque_cpx_data_c8_muxout[15]),
   .in0  (tmp_cpx_data_ca_d1[15]),
   .sel0 (mux2_sel_c8_0_ff[15]), // Old data sel
   .in1  (ext_inval_data_c8[15]),
   .sel1 (mux2_sel_c8_1_ff[15]), // Inval
   .in2  (ext_ret_data_c8[15]),
   .sel2 (mux2_sel_c8_2_ff[15])  // Def Sel
  ) ;

//--- 19:16  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_16  
  (.out (oque_cpx_data_c8_muxout[16]),
   .in0  (tmp_cpx_data_ca_d1[16]),
   .sel0 (mux2_sel_c8_0_ff[16]), // Old data sel
   .in1  (ext_inval_data_c8[16]),
   .sel1 (mux2_sel_c8_1_ff[16]), // Inval
   .in2  (ext_ret_data_c8[16]),
   .sel2 (mux2_sel_c8_2_ff[16])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_17  
  (.out (oque_cpx_data_c8_muxout[17]),
   .in0  (tmp_cpx_data_ca_d1[17]),
   .sel0 (mux2_sel_c8_0_ff[17]), // Old data sel
   .in1  (ext_inval_data_c8[17]),
   .sel1 (mux2_sel_c8_1_ff[17]), // Inval
   .in2  (ext_ret_data_c8[17]),
   .sel2 (mux2_sel_c8_2_ff[17])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_18  
  (.out (oque_cpx_data_c8_muxout[18]),
   .in0  (tmp_cpx_data_ca_d1[18]),
   .sel0 (mux2_sel_c8_0_ff[18]), // Old data sel
   .in1  (ext_inval_data_c8[18]),
   .sel1 (mux2_sel_c8_1_ff[18]), // Inval
   .in2  (ext_ret_data_c8[18]),
   .sel2 (mux2_sel_c8_2_ff[18])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_19  
  (.out (oque_cpx_data_c8_muxout[19]),
   .in0  (tmp_cpx_data_ca_d1[19]),
   .sel0 (mux2_sel_c8_0_ff[19]), // Old data sel
   .in1  (ext_inval_data_c8[19]),
   .sel1 (mux2_sel_c8_1_ff[19]), // Inval
   .in2  (ext_ret_data_c8[19]),
   .sel2 (mux2_sel_c8_2_ff[19])  // Def Sel
  ) ;

//--- 23:20  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_20  
  (.out (oque_cpx_data_c8_muxout[20]),
   .in0  (tmp_cpx_data_ca_d1[20]),
   .sel0 (mux2_sel_c8_0_ff[20]), // Old data sel
   .in1  (ext_inval_data_c8[20]),
   .sel1 (mux2_sel_c8_1_ff[20]), // Inval
   .in2  (ext_ret_data_c8[20]),
   .sel2 (mux2_sel_c8_2_ff[20])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_21  
  (.out (oque_cpx_data_c8_muxout[21]),
   .in0  (tmp_cpx_data_ca_d1[21]),
   .sel0 (mux2_sel_c8_0_ff[21]), // Old data sel
   .in1  (ext_inval_data_c8[21]),
   .sel1 (mux2_sel_c8_1_ff[21]), // Inval
   .in2  (ext_ret_data_c8[21]),
   .sel2 (mux2_sel_c8_2_ff[21])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_22  
  (.out (oque_cpx_data_c8_muxout[22]),
   .in0  (tmp_cpx_data_ca_d1[22]),
   .sel0 (mux2_sel_c8_0_ff[22]), // Old data sel
   .in1  (ext_inval_data_c8[22]),
   .sel1 (mux2_sel_c8_1_ff[22]), // Inval
   .in2  (ext_ret_data_c8[22]),
   .sel2 (mux2_sel_c8_2_ff[22])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_23  
  (.out (oque_cpx_data_c8_muxout[23]),
   .in0  (tmp_cpx_data_ca_d1[23]),
   .sel0 (mux2_sel_c8_0_ff[23]), // Old data sel
   .in1  (ext_inval_data_c8[23]),
   .sel1 (mux2_sel_c8_1_ff[23]), // Inval
   .in2  (ext_ret_data_c8[23]),
   .sel2 (mux2_sel_c8_2_ff[23])  // Def Sel
  ) ;

//--- 27:24  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_24  
  (.out (oque_cpx_data_c8_muxout[24]),
   .in0  (tmp_cpx_data_ca_d1[24]),
   .sel0 (mux2_sel_c8_0_ff[24]), // Old data sel
   .in1  (ext_inval_data_c8[24]),
   .sel1 (mux2_sel_c8_1_ff[24]), // Inval
   .in2  (ext_ret_data_c8[24]),
   .sel2 (mux2_sel_c8_2_ff[24])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_25  
  (.out (oque_cpx_data_c8_muxout[25]),
   .in0  (tmp_cpx_data_ca_d1[25]),
   .sel0 (mux2_sel_c8_0_ff[25]), // Old data sel
   .in1  (ext_inval_data_c8[25]),
   .sel1 (mux2_sel_c8_1_ff[25]), // Inval
   .in2  (ext_ret_data_c8[25]),
   .sel2 (mux2_sel_c8_2_ff[25])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_26  
  (.out (oque_cpx_data_c8_muxout[26]),
   .in0  (tmp_cpx_data_ca_d1[26]),
   .sel0 (mux2_sel_c8_0_ff[26]), // Old data sel
   .in1  (ext_inval_data_c8[26]),
   .sel1 (mux2_sel_c8_1_ff[26]), // Inval
   .in2  (ext_ret_data_c8[26]),
   .sel2 (mux2_sel_c8_2_ff[26])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_27  
  (.out (oque_cpx_data_c8_muxout[27]),
   .in0  (tmp_cpx_data_ca_d1[27]),
   .sel0 (mux2_sel_c8_0_ff[27]), // Old data sel
   .in1  (ext_inval_data_c8[27]),
   .sel1 (mux2_sel_c8_1_ff[27]), // Inval
   .in2  (ext_ret_data_c8[27]),
   .sel2 (mux2_sel_c8_2_ff[27])  // Def Sel
  ) ;

//--- 31:28  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_28  
  (.out (oque_cpx_data_c8_muxout[28]),
   .in0  (tmp_cpx_data_ca_d1[28]),
   .sel0 (mux2_sel_c8_0_ff[28]), // Old data sel
   .in1  (ext_inval_data_c8[28]),
   .sel1 (mux2_sel_c8_1_ff[28]), // Inval
   .in2  (ext_ret_data_c8[28]),
   .sel2 (mux2_sel_c8_2_ff[28])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_29  
  (.out (oque_cpx_data_c8_muxout[29]),
   .in0  (tmp_cpx_data_ca_d1[29]),
   .sel0 (mux2_sel_c8_0_ff[29]), // Old data sel
   .in1  (ext_inval_data_c8[29]),
   .sel1 (mux2_sel_c8_1_ff[29]), // Inval
   .in2  (ext_ret_data_c8[29]),
   .sel2 (mux2_sel_c8_2_ff[29])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_30  
  (.out (oque_cpx_data_c8_muxout[30]),
   .in0  (tmp_cpx_data_ca_d1[30]),
   .sel0 (mux2_sel_c8_0_ff[30]), // Old data sel
   .in1  (ext_inval_data_c8[30]),
   .sel1 (mux2_sel_c8_1_ff[30]), // Inval
   .in2  (ext_ret_data_c8[30]),
   .sel2 (mux2_sel_c8_2_ff[30])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_31  
  (.out (oque_cpx_data_c8_muxout[31]),
   .in0  (tmp_cpx_data_ca_d1[31]),
   .sel0 (mux2_sel_c8_0_ff[31]), // Old data sel
   .in1  (ext_inval_data_c8[31]),
   .sel1 (mux2_sel_c8_1_ff[31]), // Inval
   .in2  (ext_ret_data_c8[31]),
   .sel2 (mux2_sel_c8_2_ff[31])  // Def Sel
  ) ;

//--- 35:32  -------//
cl_dp1_aomux3_8x ff_cpx_data_ca_1_32  
  (.out (oque_cpx_data_c8_muxout[32]),
   .in0  (tmp_cpx_data_ca_d1[32]),
   .sel0 (mux2_sel_c8_0_ff[32]), // Old data sel
   .in1  (ext_inval_data_c8[32]),
   .sel1 (mux2_sel_c8_1_ff[32]), // Inval
   .in2  (ext_ret_data_c8[32]),
   .sel2 (mux2_sel_c8_2_ff[32])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_33  
  (.out (oque_cpx_data_c8_muxout[33]),
   .in0  (tmp_cpx_data_ca_d1[33]),
   .sel0 (mux2_sel_c8_0_ff[33]), // Old data sel
   .in1  (ext_inval_data_c8[33]),
   .sel1 (mux2_sel_c8_1_ff[33]), // Inval
   .in2  (ext_ret_data_c8[33]),
   .sel2 (mux2_sel_c8_2_ff[33])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_34  
  (.out (oque_cpx_data_c8_muxout[34]),
   .in0  (tmp_cpx_data_ca_d1[34]),
   .sel0 (mux2_sel_c8_0_ff[34]), // Old data sel
   .in1  (ext_inval_data_c8[34]),
   .sel1 (mux2_sel_c8_1_ff[34]), // Inval
   .in2  (ext_ret_data_c8[34]),
   .sel2 (mux2_sel_c8_2_ff[34])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_35  
  (.out (oque_cpx_data_c8_muxout[35]),
   .in0  (tmp_cpx_data_ca_d1[35]),
   .sel0 (mux2_sel_c8_0_ff[35]), // Old data sel
   .in1  (ext_inval_data_c8[35]),
   .sel1 (mux2_sel_c8_1_ff[35]), // Inval
   .in2  (ext_ret_data_c8[35]),
   .sel2 (mux2_sel_c8_2_ff[35])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_36  
  (.out (oque_cpx_data_c8_muxout[36]),
   .in0  (tmp_cpx_data_ca_d1[36]),
   .sel0 (mux2_sel_c8_0_ff[36]), // Old data sel
   .in1  (ext_inval_data_c8[36]),
   .sel1 (mux2_sel_c8_1_ff[36]), // Inval
   .in2  (ext_ret_data_c8[36]),
   .sel2 (mux2_sel_c8_2_ff[36])  // Def Sel
  ) ;

cl_dp1_aomux3_8x ff_cpx_data_ca_1_37  
  (.out (oque_cpx_data_c8_muxout[37]),
   .in0  (tmp_cpx_data_ca_d1[37]),
   .sel0 (mux2_sel_c8_0_ff[37]), // Old data sel
   .in1  (ext_inval_data_c8[37]),
   .sel1 (mux2_sel_c8_1_ff[37]), // Inval
   .in2  (ext_ret_data_c8[37]),
   .sel2 (mux2_sel_c8_2_ff[37])  // Def Sel
  ) ;

///////////////////////////////////////////////////////////////////////////////////////////////
//----------------------------------------------------------------------------------------

l2t_oque_dp_buff_macro__dbuff_16x__stack_38r__width_38 buff1_oque_cpx_data_c8 
        (
        .dout   (oque_cpx_data_c8_buff[37:0]),
        .din    (oque_cpx_data_c8[37:0])
        );


 l2t_oque_dp_buff_macro__dbuff_16x__stack_36r__width_36 buff2_oque_cpx_data_c8        
         (
         .dout   (oque_cpx_data_c8_buff[73:38]),
         .din    (oque_cpx_data_c8[73:38])
         );

 l2t_oque_dp_buff_macro__dbuff_16x__stack_36r__width_36 buff3_oque_cpx_data_c8        
         (
         .dout   (oque_cpx_data_c8_buff[109:74]),
         .din    (oque_cpx_data_c8[109:74])
         );

 l2t_oque_dp_buff_macro__dbuff_16x__stack_36r__width_36 buff4_oque_cpx_data_c8        
         (
         .dout   (oque_cpx_data_c8_buff[145:110]),
         .din    (oque_cpx_data_c8[145:110])
         );

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------


l2t_oque_dp_inv_macro__dinv_48x__stack_38r__width_38 inv1_oque_cpx_data_c8	
 	(
 	.dout	(oque_cpx_data_c8[37:0]),
 	.din	(oque_cpx_data_c8_muxout[37:0])
 	);


 l2t_oque_dp_inv_macro__dinv_48x__stack_36r__width_36 inv2_oque_cpx_data_c8        
         (
         .dout   (oque_cpx_data_c8[73:38]),
         .din    (oque_cpx_data_c8_muxout[73:38])
         );

 l2t_oque_dp_inv_macro__dinv_48x__stack_36r__width_36 inv3_oque_cpx_data_c8        
         (
         .dout   (oque_cpx_data_c8[109:74]),
         .din    (oque_cpx_data_c8_muxout[109:74])
         );

 l2t_oque_dp_inv_macro__dinv_48x__stack_36r__width_36 inv4_oque_cpx_data_c8        
         (
         .dout   (oque_cpx_data_c8[145:110]),
         .din    (oque_cpx_data_c8_muxout[145:110])
         );
	
// oque_cpx_data_c8 

// /
// /mux_macro ff_cpx_data_ca_1  (width=36,ports=3,mux=pgnpe,dmux=32x,stack=36r)
// /  (.dout (oque_cpx_data_c8_muxout[146-1:110]),
// /   .din0  (tmp_cpx_data_ca_d1[146-1:110]),
// ///   .din0  (tmp_cpx_data_ca[146-1:110]),
// /   .sel0 (mux2_sel_c8[0]), // Old data sel
// /   .din1  ({oque_oq_array_data_in[145:134], ext_inval_data_c8[146-13:110]}),
// /   .sel1 (mux2_sel_c8[1]), // Inval
// /   .din2  ({oque_oq_array_data_in[145:134], ext_ret_data_c8[146-13:110]}),
// /   .sel2 (mux2_sel_c8[2])  // Def Sel
// /  ) ;
// /
// /mux_macro ff_cpx_data_ca_2  (width=36,ports=3,mux=pgnpe,dmux=32x,stack=36r)
// /  (.dout (oque_cpx_data_c8_muxout[109:74]),
// ///   .din0  (tmp_cpx_data_ca[109:74]),
// /   .din0  (tmp_cpx_data_ca_d1[109:74]),
// /   .sel0 (mux2_sel_c8[0]), // Old data sel
// /   .din1  (ext_inval_data_c8[109:74]),
// /   .sel1 (mux2_sel_c8[1]), // Inval
// /   .din2  (ext_ret_data_c8[109:74]),
// /   .sel2 (mux2_sel_c8[2])  // Def Sel
// /  ) ;
// / 
// /mux_macro ff_cpx_data_ca_3  (width=36,ports=3,mux=pgnpe,dmux=32x,stack=36r)
// /  (.dout (oque_cpx_data_c8_muxout[73:38]),
// ///   .din0  (tmp_cpx_data_ca[73:38]),
// /   .din0  (tmp_cpx_data_ca_d1[73:38]),
// /   .sel0 (mux2_sel_c8[0]), // Old data sel
// /   .din1  (ext_inval_data_c8[73:38]),
// /   .sel1 (mux2_sel_c8[1]), // Inval
// /   .din2  (ext_ret_data_c8[73:38]),
// /   .sel2 (mux2_sel_c8[2])  // Def Sel
// /  ) ;
// /
// /mux_macro ff_cpx_data_ca_4  (width=38,ports=3,mux=pgnpe,dmux=32x,stack=38r)
// /  (.dout (oque_cpx_data_c8_muxout[37:0]),
// ///   .din0  (tmp_cpx_data_ca[37:0]),
// /   .din0  (tmp_cpx_data_ca_d1[37:0]),
// /   .sel0 (mux2_sel_c8[0]), // Old data sel
// /   .din1  (ext_inval_data_c8[37:0]),
// /   .sel1 (mux2_sel_c8[1]), // Inval
// /   .din2  (ext_ret_data_c8[37:0]),
// /   .sel2 (mux2_sel_c8[2])  // Def Sel
// /  ) ;
// / 
//
// assign  l2t_cpx_data_ca = oque_cpx_data_c8_muxout ; 

assign  l2t_cpx_data_ca = oque_cpx_data_c8 ; 


//
//assign oqu_dispatched_err_pkt = (l2t_cpx_data_ca[145:141] == 5'b11100);
//
//
//cmp_macro cmp_oqu_dispatched_err_pkt (width=8,dcmp=8x)
//	(
//	.dout	(oqu_dispatched_err_pkt),
//	.din0	({3'b0,oque_cpx_data_c8_buff[145:141]}),
//	.din1	(8'b00011100)
//	);
//

 
// fixscan start:
assign ff_MERGED_scanin          = scan_in                  ;
assign ff_decc_data_0_scanin     = ff_MERGED_scanout        ;
assign ff_decc_data_1_scanin     = ff_decc_data_0_scanout   ;
assign ff_decc_data_2_scanin     = ff_decc_data_1_scanout   ;
assign ff_decc_data_3_scanin     = ff_decc_data_2_scanout   ;
assign ext_inval_data_0_scanin   = ff_decc_data_3_scanout   ;
assign ext_inval_data_1_scanin   = ext_inval_data_0_scanout ;
assign ext_inval_data_2_scanin   = ext_inval_data_1_scanout ;
assign ext_inval_data_3_scanin   = ext_inval_data_2_scanout ;
assign oque_oq_array_data_in_inv_ff_scanin = ext_inval_data_3_scanout ;
assign ff_data_rtn_d1_1_scanin   = oque_oq_array_data_in_inv_ff_scanout;
assign ff_data_rtn_d1_2_scanin   = ff_data_rtn_d1_1_scanout ;
assign ff_data_rtn_d1_3_scanin   = ff_data_rtn_d1_2_scanout ;
assign ff_data_rtn_d1_4_scanin   = ff_data_rtn_d1_3_scanout ;
assign ff_mbist_oqarray_dout_scanin = ff_data_rtn_d1_4_scanout ;
assign ff_mbist_flop_scanin      = ff_mbist_oqarray_dout_scanout;
assign ff_mbist_flop1_scanin     = ff_mbist_flop_scanout    ;
assign ff_oqarray_rd_en_scanin   = ff_mbist_flop1_scanout   ;
assign ff_tmp_cpx_data_ca_1_scanin = ff_oqarray_rd_en_scanout ;
assign ff_tmp_cpx_data_ca_2_scanin = ff_tmp_cpx_data_ca_1_scanout;
assign ff_tmp_cpx_data_ca_3_scanin = ff_tmp_cpx_data_ca_2_scanout;
assign ff_tmp_cpx_data_ca_4_scanin = ff_tmp_cpx_data_ca_3_scanout;
assign ff_mux2_sel_c8_0_scanin   = ff_tmp_cpx_data_ca_4_scanout;
assign ff_mux2_sel_c8_1_scanin   = ff_mux2_sel_c8_0_scanout ;
assign ff_mux2_sel_c8_2_scanin   = ff_mux2_sel_c8_1_scanout ;
assign scan_out                  = ff_mux2_sel_c8_2_scanout ;
// fixscan end:
endmodule 



//  
//   or macro for ports = 2,3
//
//





module l2t_oque_dp_or_macro__width_1 (
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
//   invert macro
//
//





module l2t_oque_dp_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_oque_dp_cmp_macro__width_8 (
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
//   and macro for ports = 2,3,4
//
//





module l2t_oque_dp_and_macro__width_1 (
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





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_oque_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_20r__width_20 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [19:0] din0;
  input sel0;
  input [19:0] din1;
  input sel1;
  output [19:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(20)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[19:0]),
  .in1(din1[19:0]),
.dout(dout[19:0])
);









  



endmodule


//
//   buff macro
//
//





module l2t_oque_dp_buff_macro__minbuff_1__stack_40r__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






buff #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);








endmodule









// any PARAMS parms go into naming of macro

module l2t_oque_dp_msff_macro__dmsff_32x__stack_40r__width_37 (
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
wire [35:0] so;

  input [36:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [36:0] dout;


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
dff #(37)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[36:0]),
.si({scan_in,so[35:0]}),
.so({so[35:0],scan_out}),
.q(dout[36:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_oque_dp_mux_macro__dmux_4x__mux_aonpe__ports_2__stack_3r__width_3 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [2:0] din0;
  input sel0;
  input [2:0] din1;
  input sel1;
  output [2:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(3)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[2:0]),
  .in1(din1[2:0]),
.dout(dout[2:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_oque_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_14r__width_14 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [13:0] din0;
  input sel0;
  input [13:0] din1;
  input sel1;
  output [13:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(14)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[13:0]),
  .in1(din1[13:0]),
.dout(dout[13:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_oque_dp_mux_macro__dmux_4x__mux_aonpe__ports_3__stack_3r__width_3 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;

  input [2:0] din0;
  input sel0;
  input [2:0] din1;
  input sel1;
  input [2:0] din2;
  input sel2;
  output [2:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(3)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[2:0]),
  .in1(din1[2:0]),
  .in2(din2[2:0]),
.dout(dout[2:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_oque_dp_mux_macro__mux_pgpe__ports_4__stack_39r__width_39 (
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

  input [38:0] din0;
  input [38:0] din1;
  input [38:0] din2;
  input [38:0] din3;
  input sel0;
  input sel1;
  input sel2;
  input muxtst;
  input test;
  output [38:0] dout;





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

mux4 #(39)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[38:0]),
  .in1(din1[38:0]),
  .in2(din2[38:0]),
  .in3(din3[38:0]),
.dout(dout[38:0]),
  .muxtst(muxtst)
);









  



endmodule


//
//   invert macro
//
//





module l2t_oque_dp_inv_macro__dinv_16x__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






inv #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module l2t_oque_dp_and_macro__dinv_32x__dnand_16x__ports_3__width_2 (
  din0, 
  din1, 
  din2, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  input [1:0] din2;
  output [1:0] dout;






and3 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.in2(din2[1:0]),
.out(dout[1:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_oque_dp_mux_macro__dmux_32x__mux_pgnpe__ports_4__stack_32r__width_32 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  muxtst, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [31:0] din0;
  input sel0;
  input [31:0] din1;
  input sel1;
  input [31:0] din2;
  input sel2;
  input [31:0] din3;
  input sel3;
  input muxtst;
  output [31:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4 #(32)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
.dout(dout[31:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_oque_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_48r__width_48 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [47:0] din0;
  input [47:0] din1;
  input sel0;
  output [47:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(48)  d0_0 (
  .sel(psel1),
  .in0(din0[47:0]),
  .in1(din1[47:0]),
.dout(dout[47:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_oque_dp_msffi_macro__dmsffi_16x__stack_36r__width_24 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout_l, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [22:0] so;

  input [23:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [23:0] dout_l;


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
msffi_dp #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q_l(dout_l[23:0])
);



















endmodule













// any PARAMS parms go into naming of macro

module l2t_oque_dp_msffi_macro__dmsffi_16x__stack_36r__width_36 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout_l, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [34:0] so;

  input [35:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [35:0] dout_l;


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
msffi_dp #(36)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[35:0]),
.si({scan_in,so[34:0]}),
.so({so[34:0],scan_out}),
.q_l(dout_l[35:0])
);



















endmodule













// any PARAMS parms go into naming of macro

module l2t_oque_dp_msffi_macro__dmsffi_16x__stack_38r__width_38 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout_l, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [36:0] so;

  input [37:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [37:0] dout_l;


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
msffi_dp #(38)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[37:0]),
.si({scan_in,so[36:0]}),
.so({so[36:0],scan_out}),
.q_l(dout_l[37:0])
);



















endmodule













// any PARAMS parms go into naming of macro

module l2t_oque_dp_msffi_macro__dmsffi_16x__stack_34r__width_24 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout_l, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [22:0] so;

  input [23:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [23:0] dout_l;


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
msffi_dp #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q_l(dout_l[23:0])
);



















endmodule













// any PARAMS parms go into naming of macro

module l2t_oque_dp_msffi_macro__dmsffi_16x__stack_12r__width_11 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout_l, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [9:0] so;

  input [10:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [10:0] dout_l;


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
msffi_dp #(11)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[10:0]),
.si({scan_in,so[9:0]}),
.so({so[9:0],scan_out}),
.q_l(dout_l[10:0])
);



















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_oque_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_2r__width_2 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [1:0] din0;
  input sel0;
  input [1:0] din1;
  input sel1;
  output [1:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(2)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[1:0]),
  .in1(din1[1:0]),
.dout(dout[1:0])
);









  



endmodule


//
//   invert macro
//
//





module l2t_oque_dp_inv_macro__dinv_32x__width_1 (
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

module l2t_oque_dp_mux_macro__dmux_4x__mux_aonpe__ports_2__stack_36r__width_36 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [35:0] din0;
  input sel0;
  input [35:0] din1;
  input sel1;
  output [35:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(36)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[35:0]),
  .in1(din1[35:0]),
.dout(dout[35:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_oque_dp_mux_macro__dmux_4x__mux_aonpe__ports_2__stack_26r__width_26 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [25:0] din0;
  input sel0;
  input [25:0] din1;
  input sel1;
  output [25:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(26)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[25:0]),
  .in1(din1[25:0]),
.dout(dout[25:0])
);









  



endmodule


//
//   invert macro
//
//





module l2t_oque_dp_inv_macro__stack_38r__width_38 (
  din, 
  dout);
  input [37:0] din;
  output [37:0] dout;






inv #(38)  d0_0 (
.in(din[37:0]),
.out(dout[37:0])
);









endmodule





//
//   invert macro
//
//





module l2t_oque_dp_inv_macro__stack_36r__width_36 (
  din, 
  dout);
  input [35:0] din;
  output [35:0] dout;






inv #(36)  d0_0 (
.in(din[35:0]),
.out(dout[35:0])
);









endmodule





//
//   invert macro
//
//





module l2t_oque_dp_inv_macro__stack_36r__width_35 (
  din, 
  dout);
  input [34:0] din;
  output [34:0] dout;






inv #(35)  d0_0 (
.in(din[34:0]),
.out(dout[34:0])
);









endmodule









// any PARAMS parms go into naming of macro

module l2t_oque_dp_msff_macro__stack_36r__width_36 (
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
wire [34:0] so;

  input [35:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [35:0] dout;


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
dff #(36)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[35:0]),
.si({scan_in,so[34:0]}),
.so({so[34:0],scan_out}),
.q(dout[35:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_oque_dp_msff_macro__stack_38r__width_38 (
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
wire [36:0] so;

  input [37:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [37:0] dout;


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
dff #(38)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[37:0]),
.si({scan_in,so[36:0]}),
.so({so[36:0],scan_out}),
.q(dout[37:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_oque_dp_msff_macro__stack_44r__width_44 (
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
wire [42:0] so;

  input [43:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [43:0] dout;


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
dff #(44)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[43:0]),
.si({scan_in,so[42:0]}),
.so({so[42:0],scan_out}),
.q(dout[43:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_oque_dp_msff_macro__stack_42r__width_41 (
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
wire [39:0] so;

  input [40:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [40:0] dout;


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
dff #(41)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[40:0]),
.si({scan_in,so[39:0]}),
.so({so[39:0],scan_out}),
.q(dout[40:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_oque_dp_msff_macro__stack_40r__width_40 (
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
wire [38:0] so;

  input [39:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [39:0] dout;


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
dff #(40)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[39:0]),
.si({scan_in,so[38:0]}),
.so({so[38:0],scan_out}),
.q(dout[39:0])
);




















endmodule









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_oque_dp_cmp_macro__dcmp_8x__width_32 (
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





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_oque_dp_cmp_macro__dcmp_8x__width_8 (
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









// any PARAMS parms go into naming of macro

module l2t_oque_dp_msff_macro__stack_4r__width_2 (
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
wire [0:0] so;

  input [1:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [1:0] dout;


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
dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_oque_dp_mux_macro__dmux_4x__mux_aonpe__ports_2__width_1 (
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


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_oque_dp_mux_macro__dmux_4x__mux_aonpe__ports_4__stack_40r__width_40 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [39:0] din0;
  input sel0;
  input [39:0] din1;
  input sel1;
  input [39:0] din2;
  input sel2;
  input [39:0] din3;
  input sel3;
  output [39:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(40)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[39:0]),
  .in1(din1[39:0]),
  .in2(din2[39:0]),
  .in3(din3[39:0]),
.dout(dout[39:0])
);









  



endmodule


//
//   invert macro
//
//





module l2t_oque_dp_inv_macro__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






inv #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_oque_dp_mux_macro__dmux_32x__mux_pgpe__ports_4__stack_36r__width_36 (
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

  input [35:0] din0;
  input [35:0] din1;
  input [35:0] din2;
  input [35:0] din3;
  input sel0;
  input sel1;
  input sel2;
  input muxtst;
  input test;
  output [35:0] dout;





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

mux4 #(36)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[35:0]),
  .in1(din1[35:0]),
  .in2(din2[35:0]),
  .in3(din3[35:0]),
.dout(dout[35:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_oque_dp_mux_macro__dmux_32x__mux_pgpe__ports_4__stack_38r__width_38 (
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

  input [37:0] din0;
  input [37:0] din1;
  input [37:0] din2;
  input [37:0] din3;
  input sel0;
  input sel1;
  input sel2;
  input muxtst;
  input test;
  output [37:0] dout;





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

mux4 #(38)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[37:0]),
  .in1(din1[37:0]),
  .in2(din2[37:0]),
  .in3(din3[37:0]),
.dout(dout[37:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_oque_dp_msff_macro__dmsff_32x__stack_38r__width_38 (
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
wire [36:0] so;

  input [37:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [37:0] dout;


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
dff #(38)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[37:0]),
.si({scan_in,so[36:0]}),
.so({so[36:0],scan_out}),
.q(dout[37:0])
);




















endmodule









//
//   buff macro
//
//





module l2t_oque_dp_buff_macro__dbuff_16x__stack_38r__width_38 (
  din, 
  dout);
  input [37:0] din;
  output [37:0] dout;






buff #(38)  d0_0 (
.in(din[37:0]),
.out(dout[37:0])
);








endmodule





//
//   buff macro
//
//





module l2t_oque_dp_buff_macro__dbuff_16x__stack_36r__width_36 (
  din, 
  dout);
  input [35:0] din;
  output [35:0] dout;






buff #(36)  d0_0 (
.in(din[35:0]),
.out(dout[35:0])
);








endmodule





//
//   invert macro
//
//





module l2t_oque_dp_inv_macro__dinv_48x__stack_38r__width_38 (
  din, 
  dout);
  input [37:0] din;
  output [37:0] dout;






inv #(38)  d0_0 (
.in(din[37:0]),
.out(dout[37:0])
);









endmodule





//
//   invert macro
//
//





module l2t_oque_dp_inv_macro__dinv_48x__stack_36r__width_36 (
  din, 
  dout);
  input [35:0] din;
  output [35:0] dout;






inv #(36)  d0_0 (
.in(din[35:0]),
.out(dout[35:0])
);









endmodule




