// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_arbadr_dp.v
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


 
// comments. requires about 20 tracks per bit pitch in the  
// vertical direction. 
 
//////////////////////////////////////////////////////////////////////// 
// Local header file includes / local define 
//////////////////////////////////////////////////////////////////////// 
 
module l2t_arbadr_dp (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  tcu_muxtest, 
  tcu_dectest, 
  ncu_l2t_pm, 
  ncu_l2t_ba01, 
  ncu_l2t_ba23, 
  ncu_l2t_ba45, 
  ncu_l2t_ba67, 
  arbadr_dirvec_2bnk_true_enbld_dist, 
  arbadr_dirvec_4bnk_true_enbld_dist, 
  arbadr_dirvec_ncu_l2t_pm_n_dist, 
  arbadr_evctag_2bnk_true_enbld_dist, 
  arbadr_evctag_4bnk_true_enbld_dist, 
  arbadr_evctag_ncu_l2t_pm_n_dist, 
  arbadr_tagd_2bnk_true_enbld_dist, 
  arbadr_tagd_4bnk_true_enbld_dist, 
  arbadr_tagd_ncu_l2t_pm_n_dist, 
  arbadr_arbctl_2bnk_true_enbld_dist, 
  arbadr_arbctl_4bnk_true_enbld_dist, 
  arbadr_arbctl_ncu_l2t_pm_n_dist, 
  arbadr_arbdp_addr87_c2, 
  sel_diag_store_data_c7, 
  ique_iq_arbdp_addr_px2, 
  snpd_snpq_arbdp_addr_px2, 
  evctag_addr_px2, 
  arbdat_arbdata_wr_data_c2, 
  tagd_evict_tag_c3, 
  tagd_evict_tag_c4, 
  arb_mux2_snpsel_px2, 
  arb_mux3_bufsel_px1, 
  arb_mux4_c1sel_px2, 
  arb_inc_tag_ecc_cnt_c3_n, 
  arb_data_ecc_idx_reset, 
  arb_data_ecc_idx_en, 
  arb_sel_vuad_bist_px2, 
  arb_sel_deccck_or_bist_idx, 
  arb_sel_diag_addr_px2, 
  arb_sel_tecc_addr_px2, 
  arb_sel_deccck_addr_px2, 
  arb_sel_diag_tag_addr_px2, 
  arb_sel_lkup_stalled_tag_px2, 
  arb_imiss_hit_c10, 
  tag_rd64_complete_c11, 
  arb_imiss_hit_c4, 
  arb_sel_c2_stall_idx_c1, 
  bist_data_set_c1, 
  bist_data_enable_c1, 
  bist_vuad_idx_px1, 
  l2clk, 
  io_cmp_sync_en, 
  scan_in, 
  scan_out, 
  arbadr_arbdp_tag_idx_px2, 
  arbadr_arbdp_vuad_idx1_px2, 
  arbadr_arbdp_vuad_idx2_px2, 
  arbadr_arbdp_tagdata_px2, 
  arbadr_arbdp_cam_addr_px2, 
  arbadr_mbcam_addr_px2, 
  arbadr_arbdp_new_addr5to4_px2, 
  arbadr_arbdp_addr_c1c2comp_c1, 
  arbadr_arbdp_addr_c1c3comp_c1, 
  arbadr_idx_c1c2comp_c1_n, 
  arbadr_idx_c1c3comp_c1_n, 
  arbadr_idx_c1c4comp_c1_n, 
  arbadr_idx_c1c5comp_c1_n, 
  arbadr_misbuf_idx_c1c2comp_c1, 
  arbadr_misbuf_idx_c1c3comp_c1, 
  arbadr_arbdp_ioaddr_c1, 
  arbadr_arbdp_addr5to4_c1, 
  arbadr_arbdp_addr3to2_c1, 
  arbadr_arbdp_diag_wr_way_c2, 
  l2t_l2d_set_c2, 
  arbadr_arbaddr_addr22_c2, 
  arbadr_arbdp_addr_start_c2, 
  arbadr_arbaddr_idx_c3, 
  arbadr_dir_cam_addr_c3, 
  arbadr_arbdp_addr11to4_c3, 
  arbadr_arbdp_addr5to4_c3, 
  arbadr_c1_addr_eq_wb_c4, 
  arbadr_arbdp_rdmat_addr_c6, 
  arbadr_arbdp_waddr_c6, 
  arbadr_arbdp_word_addr_c6, 
  arbadr_csr_debug_addr, 
  arbadr_arbdp_byte_addr_c6, 
  arbadr_arbdp_addr22_c7, 
  arbadr_arbdp_csr_addr_c9, 
  arbadr_rdmard_addr_c12, 
  arbadr_arbdp_line_addr_c6, 
  arbadr_arbdp_oque_l1_index_c7, 
  arbadr_dirvec_addr3_c7, 
  arbadr_addr2_c8, 
  arbadr_data_ecc_idx, 
  arb_diag_or_tecc_write_px2, 
  arb_sel_way_px2, 
  arbadr_tag_wrdata_px2, 
  l2t_mb2_run, 
  mbist_tag_lkup_addr, 
  mbist_lookupen, 
  mbist_run, 
  l2t_mb2_wdata, 
  mb2_l2t_wk1_cam_shift, 
  mb2_l2t_wk1_cam_init);
wire stop;
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire muxtst;
wire test;
wire ff_tagd_evict_tag_c4_scanin;
wire ff_tagd_evict_tag_c4_scanout;
wire [29:6] tecc_corr_tag_c1_unbuff;
wire [4:0] corr_bit_unbuff;
wire check_corr_bit_16;
wire check_corr_bit_8;
wire check_corr_bit_4;
wire check_corr_bit_2;
wire check_corr_bit_1;
wire cbit_err_n;
wire par_err_tag_c4_and_cbit_err;
wire ff_tecc_corr_tag_c2_scanin;
wire ff_tecc_corr_tag_c2_scanout;
wire arb_mux2_snpsel_px2_n;
wire [39:0] arbdp_addr_c1_1;
wire sel_diag_store_data_c7_n;
wire ff_mux3_bufsel_px2_scanin;
wire ff_mux3_bufsel_px2_scanout;
wire io_cmp_sync_en_r1;
wire sel_diag_store_data_c8_n;
wire sel_diag_store_data_c8;
wire arb_mux3_bufsel_px2;
wire arb_mux3_bufsel_px2_n;
wire snoop_select;
wire evict_select;
wire [39:0] arbdp_addr_c1_2;
wire ff_stall_addr_idx_c1_unbuff_scanin;
wire ff_stall_addr_idx_c1_unbuff_scanout;
wire [8:0] stall_addr_idx_c1_1;
wire [8:0] stall_addr_idx_c1_2;
wire [8:0] stall_addr_idx_c1_3;
wire [8:0] stall_addr_idx_px2_unbuff;
wire fourbanks_true_enbld_ff1;
wire twobanks_true_enbld_ff1;
wire l2t_mb2_run_r1_n;
wire l2t_mb2_run_r1;
wire ff_l2t_mb2_wdata_scanin;
wire ff_l2t_mb2_wdata_scanout;
wire mbist_run_r1;
wire [7:0] l2t_mb2_wdata_r1;
wire l2t_mb2_wdata_r1_0_n;
wire mbist_run_r1_n;
wire walk1;
wire walk0;
wire lookupen_and_shift_init;
wire mb2_l2t_wk1_cam_init_r1;
wire shift_init;
wire mb2_l2t_wk1_cam_shift_r1;
wire [41:7] cam_lookup_data_w;
wire [41:7] cam_lookup_data_reg;
wire ff_cam_mbist_datain_reg_scanin;
wire ff_cam_mbist_datain_reg_scanout;
wire [41:7] mbist_mbcam_addr_input;
wire [41:7] arbadr_mbcam_addr_px2_unbuff;
wire [8:0] arbadr_data_ecc_idx_internal;
wire [12:9] arbadr_unused;
wire [8:0] arbadr_data_ecc_idx_plus1;
wire [8:0] arb_data_ecc_idx_reset10_n;
wire [8:0] ff_data_ecc_idx_din;
wire ff_data_ecc_idx_scanin;
wire ff_data_ecc_idx_scanout;
wire ff_bist_vuad_idx_px2_scanin;
wire ff_bist_vuad_idx_px2_scanout;
wire arbadr_dirvec_addr3_c7_tmp;
wire arbadr_dirvec_addr3_c8;
wire arb_sel_vuad_bist_px2_n;
wire arb_inc_tag_ecc_cnt_c3_n_n;
wire ff_idx_hold_c2_scanin;
wire ff_idx_hold_c2_scanout;
wire arb_sel_diag_tag_addr_px2_n;
wire arb_sel_lkup_stalled_tag_px2_n;
wire ff_stall_addr_idx_c2to5_scanin;
wire ff_stall_addr_idx_c2to5_scanout;
wire ncu_l2t_pm_sync_n_ff1_n;
wire fourbanks_true_enbld_ff1_n;
wire twobanks_true_enbld_ff1_n;
wire ncu_l2t_pm_sync_n_ff1;
wire mux_data_idx_px2_sel1;
wire mux_data_idx_px2_sel2;
wire mux_data_idx_px2_sel3;
wire ff_ncu_signals_scanin;
wire ff_ncu_signals_scanout;
wire ncu_l2t_pm_sync;
wire ncu_l2t_ba01_sync;
wire ncu_l2t_ba23_sync;
wire ncu_l2t_ba45_sync;
wire ncu_l2t_ba67_sync;
wire ncu_l2t_pm_sync_n;
wire ncu_l2t_pm_sync_n_ff8;
wire ncu_l2t_pm_sync_n_ff7;
wire ncu_l2t_pm_sync_n_ff6;
wire ncu_l2t_pm_sync_n_ff5;
wire ncu_l2t_ba01_sync_n;
wire ncu_l2t_ba23_sync_n;
wire ncu_l2t_ba45_sync_n;
wire ncu_l2t_ba67_sync_n;
wire ba01_only_enbld;
wire ba23_only_enbld;
wire ba45_only_enbld;
wire ba67_only_enbld;
wire twobanks_enbld_1;
wire twobanks_enbld;
wire ba0123_enbld;
wire ba2345_enbld;
wire ba4567_enbld;
wire ba6701_enbld;
wire ba2367_enbld;
wire ba0145_enbld;
wire fourbanks_enbld_1;
wire fourbanks_enbld_2;
wire fourbanks_enbld;
wire twobanks_true_enbld;
wire twobanks_true_enbld_ff8;
wire twobanks_true_enbld_ff7;
wire twobanks_true_enbld_ff6;
wire twobanks_true_enbld_ff5;
wire fourbanks_true_enbld;
wire fourbanks_true_enbld_ff8;
wire fourbanks_true_enbld_ff7;
wire fourbanks_true_enbld_ff6;
wire fourbanks_true_enbld_ff5;
wire mux_ncu_l2t_pm_sync_n;
wire mux_twobanks_true_enbld;
wire mux_fourbanks_true_enbld;
wire [7:0] ncu_l2t_pm_sync_n_8;
wire [7:0] twobanks_true_enbld_8;
wire [7:0] fourbanks_true_enbld_8;
wire ff_l2d_idx_c1_scanin;
wire ff_l2d_idx_c1_scanout;
wire ff_ncu_mux_sel_2_scanin;
wire ff_ncu_mux_sel_2_scanout;
wire ff_ncu_mux_sel_3_scanin;
wire ff_ncu_mux_sel_3_scanout;
wire ncu_l2t_pm_sync_n_ff2;
wire twobanks_true_enbld_ff2;
wire fourbanks_true_enbld_ff2;
wire ff_ncu_mux_sel_1_scanin;
wire ff_ncu_mux_sel_1_scanout;
wire arb_sel_c2_stall_idx_c1_n;
wire bist_data_enable_c1_n;
wire ff_l2d_idx_c2_scanin;
wire ff_l2d_idx_c2_scanout;
wire ff_l2d_idx_fnl_c2_scanin;
wire ff_l2d_idx_fnl_c2_scanout;
wire arb_diag_or_tecc_write_px2_n;
wire arb_sel_way_px2_n;
wire [27:0] arbadr_tag_wrdata_px2_unbuff;
wire [39:0] arbdp_addr_c1_unbuff;
wire [39:0] arbdp_addr_c1_3;
wire ff_inst_addr_c1_scanin;
wire ff_inst_addr_c1_scanout;
wire ff_addr_c2_scanin;
wire ff_addr_c2_scanout;
wire [39:32] arbadr_arbdp_ioaddr_c1_unused;
wire ff_addr_c3_scanin;
wire ff_addr_c3_scanout;
wire arbadr_arbdp_addr_c1c2comp_c1_unbuff;
wire arbadr_arbdp_addr_c1c3comp_c1_unbuff;
wire ff_addr_c4_scanin;
wire ff_addr_c4_scanout;
wire arb_imiss_hit_c4_n;
wire ff_addr_c5_scanin;
wire ff_addr_c5_scanout;
wire ff_addr_c52_scanin;
wire ff_addr_c52_scanout;
wire ff_addr_c6_scanin;
wire ff_addr_c6_scanout;
wire ff_addr_c7_scanin;
wire ff_addr_c7_scanout;
wire ff_addr_c8_scanin;
wire ff_addr_c8_scanout;
wire ff_addr_c9_scanin;
wire ff_addr_c9_scanout;
wire ff_addr_c10_scanin;
wire ff_addr_c10_scanout;
wire ff_addr_c11_scanin;
wire ff_addr_c11_scanout;
wire arb_imiss_hit_c10_n;
wire ff_arbdp_addr_c12_scanin;
wire ff_arbdp_addr_c12_scanout;
wire arbadr_idx_c1c2comp_c1_unbuff;
wire arbadr_idx_c1c3comp_c1_unbuff;
wire arbadr_idx_c1c4comp_c1_unbuff;
wire arbadr_idx_c1c5comp_c1_unbuff;
wire arbadr_c1_addr_eq_wb_c4_unbuff_1;
wire arbadr_c1_addr_eq_wb_c4_unbuff_2;
wire arbadr_c1_addr_eq_wb_c4_unbuff;
 

 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 input tcu_clk_stop;
 input tcu_muxtest;
 input tcu_dectest;
 
// data to the L2 arbiter 

// BS 03/25/04 for partial bank/core modes support
input           ncu_l2t_pm; // 0:all 8 banks available, 1:partial mode and need to look at each *ba* signals)
input           ncu_l2t_ba01; // 0:bank0 and bank1 unavailable, 1:both banks available 
input           ncu_l2t_ba23; // 0:bank2 and bank3 unavailable, 1:both banks available
input           ncu_l2t_ba45; // 0:bank4 and bank5 unavailable, 1:both banks available
input           ncu_l2t_ba67; // 0:bank6 and bank7 unavailable, 1:both banks available

output          arbadr_dirvec_2bnk_true_enbld_dist; // 2 banks enabled
output          arbadr_dirvec_4bnk_true_enbld_dist; // 4 banks enabled
output          arbadr_dirvec_ncu_l2t_pm_n_dist;  

output          arbadr_evctag_2bnk_true_enbld_dist; // 2 banks enabled
output          arbadr_evctag_4bnk_true_enbld_dist; // 4 banks enabled
output          arbadr_evctag_ncu_l2t_pm_n_dist;  

output          arbadr_tagd_2bnk_true_enbld_dist; // 2 banks enabled
output          arbadr_tagd_4bnk_true_enbld_dist; // 4 banks enabled
output          arbadr_tagd_ncu_l2t_pm_n_dist;  

output          arbadr_arbctl_2bnk_true_enbld_dist; // 2 banks enabled
output          arbadr_arbctl_4bnk_true_enbld_dist; // 4 banks enabled
output          arbadr_arbctl_ncu_l2t_pm_n_dist;  





output  [1:0]   arbadr_arbdp_addr87_c2; // PA [8:7] for forming directory address , BS 03/25/04 for partial bank/core modes support


input           sel_diag_store_data_c7; // from tag, for store ack generation for diagnostic store 
input	[39:0]	ique_iq_arbdp_addr_px2; // IQ instruction 
input	[39:0]	snpd_snpq_arbdp_addr_px2; // PX2 instruction. 
input	[39:0]	evctag_addr_px2; // mb fb addr mux output. 
input	[27:0]	arbdat_arbdata_wr_data_c2; // for diagnostic tag writes. from arbdata // pin on the left 
input	[(`TAG_WIDTH-1):0] tagd_evict_tag_c3 ; // read tag.	TOP 
output	[(`TAG_WIDTH-1):0] tagd_evict_tag_c4 ; // read tag.	TOP 
 
//input		csr_wr_dirpinj_en ; // parity injection into directory is enabled. 
//input   [3:0]   tag_dir_l2way_sel_c3; //  L2 tag hit way for directory , BS and SR 11/18/03 Reverse Directory change
 
 
input		arb_mux2_snpsel_px2; // snp,mb and fb 
input		arb_mux3_bufsel_px1; // snp,mb and fb 
//input		arb_mux3_bufsel_px2; // snp,mb,fb or IQ 
input		arb_mux4_c1sel_px2; // snp,mb,fb,iq or C1 
 
input		arb_inc_tag_ecc_cnt_c3_n; // from arb. 
input		arb_data_ecc_idx_reset; // decc scrub idx = 0 from arb 
input		arb_data_ecc_idx_en; // decc scrub idx increment. from arb 
 
input		arb_sel_vuad_bist_px2; // NEW_PIN 
input	 	arb_sel_deccck_or_bist_idx; // NEW_PIN 
// input		sel_stall_vuad_idx ; // NEW_PIN from arb 
 
input		arb_sel_diag_addr_px2; // diag tag idx sel 
input		arb_sel_tecc_addr_px2; // tecc idx sel. 
input		arb_sel_deccck_addr_px2; // decc idx sel. 
input		arb_sel_diag_tag_addr_px2; // diag or tecc or deccck only 
input		arb_sel_lkup_stalled_tag_px2; // sel stalled address. 
input		arb_imiss_hit_c10; // select to pick address 
		     // for a csr write. NEW_PIN replaces OLD_PIN arb_imiss_hit_c8 
 
input		tag_rd64_complete_c11; // NEW_PIN  
input		arb_imiss_hit_c4; // select to pick an address for camming the dir 
input		arb_sel_c2_stall_idx_c1; // sel from arb  
input	[8:0]	bist_data_set_c1; // from data bist 
input		bist_data_enable_c1; // from databist 
input	[8:0]	bist_vuad_idx_px1 ; // POST_3.0 pin , BS & SR 10/28/03 
input		l2clk;	 
input		io_cmp_sync_en;	 
input scan_in; 
 
output scan_out; 
// PX2 outputs 
output	[8:0]	arbadr_arbdp_tag_idx_px2 ; // addr<17:9> going to tag, BS & SR 10/28/03  
output	[8:0]	arbadr_arbdp_vuad_idx1_px2 ; // addr<17:9> going to vuad . BS & SR 10/28/03 
output	[8:0]	arbadr_arbdp_vuad_idx2_px2 ; // addr<17:9> going to vuad . BS & SR 10/28/03 
// wr data to tagd 
output	[27:6]	arbadr_arbdp_tagdata_px2; // lkup data for the tag. // int 5.0 changes
output	[39:0]	arbadr_arbdp_cam_addr_px2 ; // Address to l2t_arbadr_dp.sv 
output  [41:7]  arbadr_mbcam_addr_px2 ; // Address to cam MBF.
output	[1:0]	arbadr_arbdp_new_addr5to4_px2; // to arb for col offset stall calculation ( does not include 
					// the output of the stall mux . 
 
 
// C1 outputs 
output	arbadr_arbdp_addr_c1c2comp_c1;	// to misbuf via arb 
output	arbadr_arbdp_addr_c1c3comp_c1;	// to misbuf via arb 
 
//output	arbadr_idx_c1c2comp_c1 ; // to vuad dp via arb 
//output	arbadr_idx_c1c3comp_c1 ; // to vuad dp via arb 

output		arbadr_idx_c1c2comp_c1_n;
output		arbadr_idx_c1c3comp_c1_n;
output		arbadr_idx_c1c4comp_c1_n;
output		arbadr_idx_c1c5comp_c1_n;


//output		arbadr_vuad_idx_c1c2comp_c1;
//output		arbadr_vuad_idx_c1c3comp_c1;
output		arbadr_misbuf_idx_c1c2comp_c1;
output		arbadr_misbuf_idx_c1c3comp_c1;

//output	arbadr_idx_c1c4comp_c1 ; // to vuad dp via arb 
//output	arbadr_idx_c1c5comp_c1; // to vuad dp via arb 
 
//output	[1:0]	arbadr_arbdp_word_addr_c1; // to arbdec for pst decode logic 
output	[39:32]	arbadr_arbdp_ioaddr_c1; // bits 39-32 are used to determine if the 
                                 // address space is DRAM or diagnostic. 
output	[1:0]	arbadr_arbdp_addr5to4_c1; // to arb foroffset stall calculation 
output	[1:0]	arbadr_arbdp_addr3to2_c1 ; // output to tag. 
 
// C2 outputs 
output	[3:0]	arbadr_arbdp_diag_wr_way_c2; // bit of the diagnostic access address indicate way. 

output	[8:0]	l2t_l2d_set_c2; // 2X wire going to l2d. BS & SR 10/28/03 
output		arbadr_arbaddr_addr22_c2; // used by vuad dp for muxing diagnostic read data. 
output	arbadr_arbdp_addr_start_c2;  // NEW_PIN to l2t_arbdec. 
 
 
// C3 outputs 
// output	[8:0]	evctag_vuad_idx_c3; // NEW_PIN to vuad array 
output	[10:0]   arbadr_arbaddr_idx_c3; // sent to tagd. BS & SR 10/28/03 
output	[39:7]	arbadr_dir_cam_addr_c3; // output to tagd. 
//output		arbadr_arbdp_dir_wr_par_c3 ; // wr data for i and d directories. 
output	[7:0]	arbadr_arbdp_addr11to4_c3; // output to arb  for dir cam logic
output	[1:0]	arbadr_arbdp_addr5to4_c3 ; // output to arb  for dir cam logic 
//output	[5:2]	arbadr_arbdp_dbg_addr_c3 ; // output to dbg. 
 
 
output	arbadr_c1_addr_eq_wb_c4; //output to wbuf. 
 
//output	[5:2] 	arbdp_tag_addr_c6; // to tag 
output	[5:2] 	arbadr_arbdp_rdmat_addr_c6; // to l2b_rep NEW_PIN 
output	[1:0] 	arbadr_arbdp_waddr_c6; // word addr to decc 
output	[4:0]	arbadr_arbdp_word_addr_c6 ; // address of a Byte to csr. NEW_PIN 
output	[33:2]  arbadr_csr_debug_addr; // address to csr for debug related logic
 
output	[2:0]	arbadr_arbdp_byte_addr_c6; // to arbdec for pst decode logic // // Phase 2 : SIU inteface and packet format change 2/7/04
output		arbadr_arbdp_addr22_c7 ; // diagnostic  data word addr 
output	[39:4]	arbadr_arbdp_csr_addr_c9; // NEW _PIN replaces OLD_PIN arbdp_csr_addr_c7 
output	[39:6]  	arbadr_rdmard_addr_c12; // NEW_PIN 
output	[5:4]	arbadr_arbdp_line_addr_c6 ; // to oque. 
//output	[2:0]	arbadr_arbdp_inst_byte_addr_c7 ; // to arb for dword mask generation. 
output	[11:6]	arbadr_arbdp_oque_l1_index_c7; // l1 index. 
output          arbadr_dirvec_addr3_c7; // Bit 3 of address, BS and SR 11/12/03 N2 Xbar Packet format change
 
output		arbadr_addr2_c8 ; // to arb for cas compare. 
 
 
output	[8:0]	arbadr_data_ecc_idx; //  output to the CSR block. BS & SR 10/28/03 
 
 
input	arb_diag_or_tecc_write_px2; // new input. Left 
input	arb_sel_way_px2; // Left 
output	[27:0]	arbadr_tag_wrdata_px2 ; // interleave with pins arbadr_arbdp_tagdata_px2 
				 // at the bottom. 
 
input		l2t_mb2_run;
input	[27:0]	mbist_tag_lkup_addr;
input		mbist_lookupen;
input		mbist_run;


input	[7:0]	l2t_mb2_wdata;
input		mb2_l2t_wk1_cam_shift;
input		mb2_l2t_wk1_cam_init;

assign stop = tcu_clk_stop;
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
assign muxtst = tcu_muxtest;
assign test = tcu_dectest;

////////////////////////////////////////////////////////////////////////////// 
wire [31:0] arbadr_addr_c1_pbnk,arbadr_addr_c2_pbnk,arbadr_addr_c3_pbnk;
wire    [23:0]  tagd_evct_addr_39_16_c4;
wire    [17:9]  arbadr_mbcam_idx_px2;   // Index to MB CAM
wire    [27:6]  arbadr_arbdp_tagdata_tmp_px2; // BS 03/25/04 for partial bank/core modes support  
wire    [39:18] evctag_addr_fnl_px2,arbdp_addr_c1_1_fnl; // BS 03/25/04 for partial bank/core modes support
wire    [8:0]   stall_addr_idx_c1,stall_addr_idx_c2,stall_addr_idx_c3,stall_addr_idx_c4,stall_addr_idx_c5; 
                     // BS 03/25/04 for partial bank/core modes support
wire    [8:0]   mux3_tag_idx_px2; // BS 03/25/04 for partial bank/core modes support
 
wire	[39:0]	tag_diag_wr_data_c2; // diagnostic wr data after processing. 
wire	[29:0] 	err_tag_c4 ; // read tag. 
wire		cbit_err; 
wire	[29:0] 	tecc_corr_tag_c1; // corrected tag in  the tagecc pipeline. 
wire	[27:0] 	tecc_corr_tag_c2; // corrected tag in  the tagecc pipeline. // int 5.0 changes
wire		par_err_tag_c4; // par err. 
wire	[8:0]	tag_ecc_idx; // BS & SR 10/28/03 
 
wire	[39:0]	mux2_addr_px2; // snoop/mbf and fbf address. 
wire	[39:0]	mux3_addr_px2; // snoop/mbf/fbf and Iq address. 
wire	[39:0]	mux4_addr_px2; // snoop/mbf/fbf Iq address. 
 
wire	[8:0]	data_ecc_idx_plus1; // BS & SR 10/28/03 
 
wire	[8:0]	tag_acc_idx_px2; // BS & SR 10/28/03 
wire	[8:0]	mux_idx2_px2; // BS & SR 10/28/03 
wire	[27:0]	tag_acc_data_px2; 
wire	[27:0]	mux2_tagdata_px2; 
 
wire	[4:0]	corr_bit; 
 
 
wire	[39:0]	arbdp_addr_c1; 
wire	[39:0]	arbdp_addr_c2; 
wire	[39:0]	arbdp_addr_c3; 
wire	[39:0]	arbdp_addr_c4; 
wire	[39:0]	arbdp_addr_c5; 
wire    [39:0]  arbdp_addr_c52; // BS 03/11/04 extra cycle for mem access
wire	[39:0]	arbdp_addr_c6; 
wire	[39:0]	arbdp_addr_c7; 
wire	[39:0]	arbdp_addr_c8; 
wire	[39:0]	arbdp_addr_c9; 
wire	[39:0]	arbdp_addr_c10; 
wire	[39:0]	arbdp_addr_c11; 
 
 
wire	[8:0]	data_idx_px2; // BS & SR 10/28/03 
wire	[8:0]	data_idx_c1, data_bist_idx_c2, data_bist_idx_c1; 
wire	[8:0]	stall_idx_c1; 
wire	[39:7] evict_addr_c4 ; 
 
wire	[8:0]	vuad_acc_idx_px2; // BS & SR 10/28/03 
wire	[8:0]	vuad_idx2_px2; // BS & SR 10/28/03 
wire	[8:0]	bist_vuad_idx; // BS & SR 10/28/03 
 
////////////////////////////////////////////////////////////////////////////// 
///////////////////////////////////////////////////////////// 
// dp is 30 bits wide eventhough tag is only 28 bits wide. 
// ECC Correction and Generation for writing into the tag array. 
// 30 bit wide dp eventhough, the tag is only 28 bits wide. 
///////////////////////////////////////////////////////////// 
 
//assign	err_tag_c4 = {2'b0,tagd_evict_tag_c4[(`TAG_WIDTH-1):0]}; 

l2t_arbadr_dp_msff_macro__dmsff_32x__stack_30r__width_28 ff_tagd_evict_tag_c4 
	(
	.scan_in(ff_tagd_evict_tag_c4_scanin),
	.scan_out(ff_tagd_evict_tag_c4_scanout),
	.dout	(tagd_evict_tag_c4[(`TAG_WIDTH-1):0]),
	.din	(tagd_evict_tag_c3[(`TAG_WIDTH-1):0]),
	.clk	(l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);


l2t_arbadr_dp_buff_macro__dbuff_16x__width_30 buff_err_tag_c4 
	(
	.dout	(err_tag_c4[29:0]),
	.din	({2'b0,tagd_evict_tag_c4[(`TAG_WIDTH-1):0]})
	);
 
l2t_ecc30b_dp	ecc_corr
	(
	.din	({err_tag_c4[29:6]}), 
	.parity	(err_tag_c4[5:1]), 
	.dout	(tecc_corr_tag_c1_unbuff[29:6]), 
	.corrected_bit(corr_bit_unbuff[4:0])
	); 
 
l2t_arbadr_dp_buff_macro__dbuff_16x__width_29   buff_ecc_out_corr_bit  
	(
	.dout	({tecc_corr_tag_c1[29:6],corr_bit[4:0]}),
	.din	({tecc_corr_tag_c1_unbuff[29:6],corr_bit_unbuff[4:0]})
	);

 
//assign	tecc_corr_tag_c1[5] = err_tag_c4[5] ^ ( corr_bit[4:0] == 5'd16) ; 
//assign	tecc_corr_tag_c1[4] = err_tag_c4[4] ^ ( corr_bit[4:0] == 5'd8) ; 
//assign	tecc_corr_tag_c1[3] = err_tag_c4[3] ^ ( corr_bit[4:0] == 5'd4) ; 
//assign	tecc_corr_tag_c1[2] = err_tag_c4[2] ^ ( corr_bit[4:0] == 5'd2) ; 
//assign	tecc_corr_tag_c1[1] = err_tag_c4[1] ^ ( corr_bit[4:0] == 5'd1) ; 

l2t_arbadr_dp_cmp_macro__dcmp_8x__width_8 check_corr_bit_16_slice  
	( 
	.din0	({3'b0,corr_bit[4:0]}), 
	.din1	({3'b0,5'd16}), 
	.dout	( check_corr_bit_16) 
	);

l2t_arbadr_dp_cmp_macro__dcmp_8x__width_8 check_corr_bit_08_slice  
        (
        .din0   ({3'b0,corr_bit[4:0]}),
        .din1   ({3'b0,5'd8}),
        .dout   ( check_corr_bit_8)
        );

l2t_arbadr_dp_cmp_macro__dcmp_8x__width_8 check_corr_bit_04_slice 
        (
        .din0   ({3'b0,corr_bit[4:0]}),
        .din1   ({3'b0,5'd4}),
        .dout   ( check_corr_bit_4)
        );

l2t_arbadr_dp_cmp_macro__dcmp_8x__width_8 check_corr_bit_02_slice 
        (
        .din0   ({3'b0,corr_bit[4:0]}),
        .din1   ({3'b0,5'd2}),
        .dout   ( check_corr_bit_2)
        );

l2t_arbadr_dp_cmp_macro__dcmp_8x__width_8 check_corr_bit_01_slice 
        (
        .din0   ({3'b0,corr_bit[4:0]}),
        .din1   ({3'b0,5'd1}),
        .dout   (check_corr_bit_1)
        );

l2t_arbadr_dp_xor_macro__width_1 xor_err_tag_5_corr_bit16  
	( 
	.dout 	(tecc_corr_tag_c1[5]), 
	.din0	(check_corr_bit_16), 
	.din1	(err_tag_c4[5]) 
	);

l2t_arbadr_dp_xor_macro__width_1 xor_err_tag_4_corr_bit8  
        (
        .dout   (tecc_corr_tag_c1[4]),
        .din0   (check_corr_bit_8),
        .din1   (err_tag_c4[4])
        );
l2t_arbadr_dp_xor_macro__width_1 xor_err_tag_3_corr_bit4  
        (
        .dout   (tecc_corr_tag_c1[3]),
        .din0   (check_corr_bit_4),
        .din1   (err_tag_c4[3])
        );
l2t_arbadr_dp_xor_macro__width_1 xor_err_tag_2_corr_bit2  
        (
        .dout   (tecc_corr_tag_c1[2]),
        .din0   (check_corr_bit_2),
        .din1   (err_tag_c4[2])
        );
l2t_arbadr_dp_xor_macro__width_1 xor_err_tag_1_corr_bit1  
        (
        .dout   (tecc_corr_tag_c1[1]),
        .din0   (check_corr_bit_1),
        .din1   (err_tag_c4[1])
        );

// assign	cbit_err	= |(corr_bit[4:0]); 


l2t_arbadr_dp_cmp_macro__dcmp_8x__width_8 cmp_cbit_err 
	(
	.dout	(cbit_err_n),
	.din0	({3'b0,corr_bit[4:0]}),
	.din1	(8'b0)
	);

//or_macro        corr_bit_slice_0  (width=1)
//        (
//        .dout   (corr_bit_0_or_1),
//        .din0   (corr_bit[0]),
//        .din1   (corr_bit[1])
//        );
//
//or_macro        corr_bit_slice_1  (width=1)
//        (
//        .dout   (corr_bit_1_or_2),
//        .din0   (corr_bit_0_or_1),
//        .din1   (corr_bit[2])
//        );
//
//or_macro        corr_bit_slice_2  (width=1)
//        (
//        .dout   (corr_bit_2_or_3),
//        .din0   (corr_bit_1_or_2),
//        .din1   (corr_bit[3])
//        );
//
//or_macro        corr_bit_slice_3  (width=1)
//        (
//        .dout   (cbit_err),
//        .din0   (corr_bit_2_or_3),
//        .din1   (corr_bit[4])
//        );
//
//zzpar32	par_bit	(.z(par_err_tag_c4), .d({err_tag_c4[29:0],2'b0})); 

l2t_arbadr_dp_prty_macro__dprty_8x__width_32 par_bit  
	(
	.din	({err_tag_c4[29:0],2'b0}),
	.dout	(par_err_tag_c4)
	);
 
// assign	tecc_corr_tag_c1[0] = ( par_err_tag_c4 & ~cbit_err ) ^ err_tag_c4[0] ; 


l2t_arbadr_dp_and_macro__width_1 par_err_tag_c4_and_cbit_err_slice  
        ( 
        .din1   (par_err_tag_c4), 
        .din0   (cbit_err_n), 
        .dout   (par_err_tag_c4_and_cbit_err) 
        );

l2t_arbadr_dp_xor_macro__width_1 tecc_corr_tag_c1_0_slice_xor  
        ( 
        .din1   (par_err_tag_c4_and_cbit_err), 
        .din0   (err_tag_c4[0]), 
        .dout   (tecc_corr_tag_c1[0]) 
        );
 
l2t_arbadr_dp_msff_macro__stack_28r__width_28 ff_tecc_corr_tag_c2  // int 5.0 changes
         (
	.scan_in(ff_tecc_corr_tag_c2_scanin),
	.scan_out(ff_tecc_corr_tag_c2_scanout),
	.din	(tecc_corr_tag_c1[27:0]), 	
	.clk	(l2clk), 
	.dout	(tecc_corr_tag_c2[27:0]), 
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	); 
 
 
///////////////////////////////////////////////////////////////////////// 
// 1st level of ARB muxes  
// 1) Mux between Fb and MB addr	(in evctag) 
// 2) Mux between Mux1 and SNp data 
// 3) Mux between Mux2 and IQ data 
///////////////////////////////////////////////////////////////////////// 
 
l2t_arbadr_dp_inv_macro__dinv_32x__width_1 arb_mux2_snpsel_px2_inv_slice   (
        .dout   (arb_mux2_snpsel_px2_n),
        .din    (arb_mux2_snpsel_px2)
        );

 
l2t_arbadr_dp_msff_macro__dmsff_32x__stack_8c__width_8 ff_mux3_bufsel_px2 
	(
	.din({arbdp_addr_c1_1[21:18],io_cmp_sync_en,sel_diag_store_data_c7_n,
		sel_diag_store_data_c7,arb_mux3_bufsel_px1}), 
	.clk(l2clk), .en(1'b1),
	.scan_in(ff_mux3_bufsel_px2_scanin),
	.scan_out(ff_mux3_bufsel_px2_scanout),
	.dout({arbadr_arbdp_diag_wr_way_c2[3:0],io_cmp_sync_en_r1,sel_diag_store_data_c8_n,
		sel_diag_store_data_c8,arb_mux3_bufsel_px2}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)  
	); 
 

l2t_arbadr_dp_inv_macro__dinv_32x__width_1 arb_mux3_bufsel_px2_invert_slice   (
        .dout   (arb_mux3_bufsel_px2_n),
        .din    (arb_mux3_bufsel_px2)
        );

l2t_arbadr_dp_and_macro__width_1 and_snp_select 
     	(
     	.dout	(snoop_select),
     	.din0	(arb_mux2_snpsel_px2),
     	.din1	(arb_mux3_bufsel_px2)
     	);

l2t_arbadr_dp_and_macro__width_1 and_evict_select 
             (
             .dout   (evict_select),
             .din0   (arb_mux2_snpsel_px2_n),
             .din1   (arb_mux3_bufsel_px2)
             );

l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_3__stack_40r__width_40 mux_mux3_instr_px2 
        (
	.dout 	(mux3_addr_px2[39:0]) , 
	.din0   (snpd_snpq_arbdp_addr_px2[39:0]),
	.din1	(ique_iq_arbdp_addr_px2[39:0]), 
	.din2	(evctag_addr_px2[39:0]),
	.sel0	(snoop_select), 
	.sel1	(arb_mux3_bufsel_px2_n),
	.sel2	(evict_select)
	);  
 

l2t_arbadr_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_40r__width_40 mux_mux4_instr_px2 
         (
	.dout 	(mux4_addr_px2[39:0]) , 
	.din0	(arbdp_addr_c1_2[39:0]), 
	.din1	(mux3_addr_px2[39:0]), 
	.sel0	(arb_mux4_c1sel_px2) 
	);  
 
 
//assign	arbadr_arbdp_new_addr5to4_px2 = mux3_addr_px2[5:4]; // column offset  
//assign	arbadr_arbdp_cam_addr_px2 =  mux4_addr_px2[39:0] ; // miss buffer cam address. 


l2t_arbadr_dp_buff_macro__dbuff_32x__stack_40r__width_40  buff_arbadr_arbdp_cam_addr_px2  
	(
	.dout	(arbadr_arbdp_cam_addr_px2[39:0]),
	.din	(mux4_addr_px2[39:0])
	);

//buff_macro   buff_arbadr_arbdp_new_addr5to4_px2  (width=2,stack=2r,dbuff=32x)
//	(
//	.dout	(arbadr_arbdp_new_addr5to4_px2[1:0]),
//	.din	(mux3_addr_px2[5:4])
//	);
//
//buff_macro buff_stall_addr_idx_c1 (width=27,dbuff=32x)
//	(
//	.dout	({stall_addr_idx_c1_1[8:0],stall_addr_idx_c1_2[8:0],stall_addr_idx_c1_3[8:0]}),
//	.din	({stall_addr_idx_c1_unbuff[8:0],stall_addr_idx_c1_unbuff[8:0],stall_addr_idx_c1_unbuff[8:0]})
//	);
//


l2t_arbadr_dp_msff_macro__dmsff_32x__stack_36r__width_27 ff_stall_addr_idx_c1_unbuff	
	(
	.scan_in(ff_stall_addr_idx_c1_unbuff_scanin),
	.scan_out(ff_stall_addr_idx_c1_unbuff_scanout),
	.dout	({stall_addr_idx_c1_1[8:0],stall_addr_idx_c1_2[8:0],stall_addr_idx_c1_3[8:0]}),
	.din	({stall_addr_idx_px2_unbuff[8:0],stall_addr_idx_px2_unbuff[8:0],stall_addr_idx_px2_unbuff[8:0]}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
	

l2t_arbadr_dp_mux_macro__dmux_32x__mux_pgpe__ports_3__stack_36r__width_27 mux_arbadr_idx_px2 
        (
	.dout({stall_addr_idx_px2_unbuff[8:0],arbadr_arbdp_vuad_idx1_px2[8:0],    arbadr_mbcam_idx_px2[17:9]}),
        .din0({mux4_addr_px2[16:8]          ,mux3_addr_px2[16:8],			mux4_addr_px2[16:8]}), 
        .din1({mux4_addr_px2[15:7]          ,mux3_addr_px2[15:7],			mux4_addr_px2[15:7]}), 
        .din2({mux4_addr_px2[17:9]          ,mux3_addr_px2[17:9],			mux4_addr_px2[17:9]}),
        .sel0(fourbanks_true_enbld_ff1),  // 1 bit shifted idx in case of 4 banks enabled
        .sel1(twobanks_true_enbld_ff1),
  .muxtst(muxtst),
  .test(test)   // 2 bit shifted idx of 2 banks enabled
//        .sel2(ncu_l2t_pm_sync_n_ff1),    // original idx , all banks enabled
        );

l2t_arbadr_dp_inv_macro__dinv_32x__width_1  inv_l2t_mb2_run 
	(
	.dout	(l2t_mb2_run_r1_n),
	.din	(l2t_mb2_run_r1)
	);


l2t_arbadr_dp_msff_macro__stack_10r__width_9 ff_l2t_mb2_wdata   
        (
        .scan_in(ff_l2t_mb2_wdata_scanin),
        .scan_out(ff_l2t_mb2_wdata_scanout),
        .dout   ({mbist_run_r1,l2t_mb2_wdata_r1[7:0]}),
        .din    ({mbist_run,l2t_mb2_wdata[7:0]}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2t_arbadr_dp_inv_macro__dinv_32x__width_2 inv_l2t_mb2_wdata_r1_0 
	(
	.dout	({l2t_mb2_wdata_r1_0_n,mbist_run_r1_n}),
	.din	({l2t_mb2_wdata_r1[0],mbist_run_r1})
	);

l2t_arbadr_dp_and_macro__width_3 and_mbist_gate1 
	(
	.dout	({walk1,walk0,lookupen_and_shift_init}),
	.din0	({mb2_l2t_wk1_cam_init_r1,mb2_l2t_wk1_cam_init_r1,mbist_lookupen}),
	.din1	({l2t_mb2_wdata_r1[0],l2t_mb2_wdata_r1_0_n,shift_init})
	);

l2t_arbadr_dp_nor_macro__width_1 nor_shift_init	
	(
	.dout	(shift_init),
	.din0	(mb2_l2t_wk1_cam_shift_r1),
	.din1	(mb2_l2t_wk1_cam_init_r1)
	);

l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_5__stack_35r__width_35 mux_cam_lookup_data 
         (
         .dout   (cam_lookup_data_w[41:7]),
         .din0   ({34'b0,1'b1}),         // initial loading 0 or 1
         .din1   ({{34{1'b1}},1'b0}),    //walk 0 or 1
         .din2   ({cam_lookup_data_reg[40:7],l2t_mb2_wdata_r1_0_n}), //walk 0 or 1
         .din3   (35'h0),                                // initialize lookup
         .din4   ({l2t_mb2_wdata_r1[2:0],{4{l2t_mb2_wdata_r1[7:0]}}}), // camming data
         .sel0   (walk1),
         .sel1   (walk0),
         .sel2   (mb2_l2t_wk1_cam_shift_r1),
         .sel3   (l2t_mb2_run_r1_n),
         .sel4   (lookupen_and_shift_init)
         );


l2t_arbadr_dp_msff_macro__stack_35r__width_35 ff_cam_mbist_datain_reg	
	(
	.scan_in(ff_cam_mbist_datain_reg_scanin),
	.scan_out(ff_cam_mbist_datain_reg_scanout),
	.dout	(cam_lookup_data_reg[41:7]),
	.din	(cam_lookup_data_w[41:7]),
	.clk	(l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

//mux_macro mux_wlk_lookup_addr (width=35,ports=2,mux=aonpe,dmux=8x)
//	(
//	.dout	(cam_lookup_data[41:7]),
//	.din0	({7'b0,cam_lookup_data_reg[27:7],7'b0}),
//	.din1	(cam_lookup_data_reg[41:7]),
//	.sel0	(l2t_mb2_run_r1),
//	.sel1	(l2t_mb2_run_r1_n)
//	);

l2t_arbadr_dp_buff_macro__dbuff_8x__stack_35r__width_35 buff_mbist_mbcam_addr_input  
	(
	.dout	(mbist_mbcam_addr_input[41:7]),
//	.din	(cam_lookup_data_reg[41:7])
//	.din	(cam_lookup_data_w[41:7])
	.din	(cam_lookup_data_reg[41:7])
	);

l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_35r__width_35 mux_arbadr_mbcam_addr_px2 
	(
	.dout	(arbadr_mbcam_addr_px2_unbuff[41:7]),
	.din0	(mbist_mbcam_addr_input[41:7]),
	.din1	({mux4_addr_px2[39:16],arbadr_mbcam_idx_px2[17:9],mux4_addr_px2[8:7]}),
	.sel0	(l2t_mb2_run_r1),
	.sel1	(l2t_mb2_run_r1_n)
	);

l2t_arbadr_dp_buff_macro__dbuff_32x__stack_37r__width_37 buff_arbadr_mbcam_addr_px2 
	(
	.dout	({arbadr_mbcam_addr_px2[41:7],arbadr_arbdp_new_addr5to4_px2[1:0]}),
	.din	({arbadr_mbcam_addr_px2_unbuff[41:7],mux3_addr_px2[5:4]})
	);

 

//////////////////////////////////////////////////////////////////////// 
// INDEX BITS TO THE VUAD. 
//////////////////////////////////////////////////////////////////////// 
 
 
// data ecc index manipulation. 
//assign	arbadr_data_ecc_idx_plus1 = arbadr_data_ecc_idx + 10'b1 ; 

l2t_arbadr_dp_increment_macro__dincr_8x__width_12 decc_incr   // BS & SR 10/28/03 
	(
//  	.din	( {3'b000,arbadr_data_ecc_idx[8:0]} ) ,
  	.din	( {3'b000,arbadr_data_ecc_idx_internal[8:0]} ) ,
  	.cin	(1'b1 ) ,
  	.dout	({arbadr_unused[11:9],arbadr_data_ecc_idx_plus1[8:0]}) ,
  	.cout	(arbadr_unused[12])
	);
 
l2t_arbadr_dp_inv_macro__dinv_32x__stack_9r__width_9 arb_data_ecc_idx_reset_inv_slice 
        (
        .dout   (arb_data_ecc_idx_reset10_n[8:0]),
        .din    ({9{arb_data_ecc_idx_reset}})
        );

///assign arb_data_ecc_idx_reset10_n[8:0] = {9{arb_data_ecc_idx_reset_n}}; // BS & SR 10/28/03


l2t_arbadr_dp_and_macro__width_9 ff_data_ecc_idx_din_and_macro  // BS & SR 10/28/03
	(
	.dout 	(ff_data_ecc_idx_din[8:0]),
	.din0 	(arb_data_ecc_idx_reset10_n[8:0]),
	.din1 	(arbadr_data_ecc_idx_plus1[8:0])
	);

l2t_arbadr_dp_msff_macro__dmsff_32x__stack_20r__width_18 ff_data_ecc_idx  // BS & SR 10/28/03
        (
        .scan_in(ff_data_ecc_idx_scanin),
        .scan_out(ff_data_ecc_idx_scanout),
        .clk    (l2clk),
        .din    ({ff_data_ecc_idx_din[8:0],ff_data_ecc_idx_din[8:0]}),
        .dout   ({arbadr_data_ecc_idx_internal[8:0],arbadr_data_ecc_idx[8:0]}),
        .en     (arb_data_ecc_idx_en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


l2t_arbadr_dp_msff_macro__stack_13r__width_13 ff_bist_vuad_idx_px2  // BS & SR 10/28/03
	(
	.scan_in(ff_bist_vuad_idx_px2_scanin),
	.scan_out(ff_bist_vuad_idx_px2_scanout),
	.din	({arbadr_dirvec_addr3_c7_tmp,l2t_mb2_run,bist_vuad_idx_px1[8:0],
		mb2_l2t_wk1_cam_init,mb2_l2t_wk1_cam_shift}), 
	.clk	(l2clk),  
	.dout	({arbadr_dirvec_addr3_c8,l2t_mb2_run_r1,bist_vuad_idx[8:0],
		mb2_l2t_wk1_cam_init_r1,mb2_l2t_wk1_cam_shift_r1}), 	
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 

 
l2t_arbadr_dp_inv_macro__dinv_32x__width_1 arb_sel_vuad_bist_px2_inv_slice   (
        .dout   (arb_sel_vuad_bist_px2_n),
        .din    (arb_sel_vuad_bist_px2)
        );

l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_10r__width_9 mux_vuad_acc_idx_px2  // BS & SR 10/28/03
        (
	.dout 	( vuad_acc_idx_px2[8:0] ) , 
//	.din0	(arbadr_data_ecc_idx[8:0]),  // deccck idx 
	.din0	(arbadr_data_ecc_idx_internal[8:0]),  // deccck idx 
	.din1	(bist_vuad_idx[8:0]), // tecc idx 
	.sel0	(arb_sel_vuad_bist_px2_n), //  sel deccck 
	.sel1	(arb_sel_vuad_bist_px2)
	); // sel tecc 
 
//inv_macro arb_sel_deccck_or_bist_idx_inv_slice (width=1,dinv=32x)
//	(
//        .dout   (arb_sel_deccck_or_bist_idx_n),
//        .din    (arb_sel_deccck_or_bist_idx)
//        );


l2t_arbadr_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_10r__width_9 mux_vuad_idx2_px2  // BS & SR 10/28/03
        (
//	.dout (vuad_idx2_px2[8:0] ) , 
	.dout (arbadr_arbdp_vuad_idx2_px2[8:0] ) , 
	.din0(vuad_acc_idx_px2[8:0]), // bist or deccck idx 
	.din1(stall_addr_idx_c1_1[8:0]), // stalled addr, BS 03/25/04 for partial bank/core modes support 
	.sel0(arb_sel_deccck_or_bist_idx)  // select diag/bist addr 
//	.sel1(arb_sel_deccck_or_bist_idx_n) // ~select diag/bist addr
	); 
 
// BS 03/25/04 for partial bank/core modes support
// vuad index shift for unstalled operations

//mux_macro mux_arbadr_arbdp_vuad_idx1_px2 (width=9,ports=3,mux=aonpe,stack=10r,dmux=8x)
//            (.dout (arbadr_arbdp_vuad_idx1_px2_unbuff[8:0]) , // index for unstalled operations.
//            .din0(mux3_addr_px2[17:9]), // original idx from core/siu/mbf/filbuf, all banks enabled
//            .din1(mux3_addr_px2[16:8]), // 1 bit shifted idx in case of 4 banks enabled
//            .din2(mux3_addr_px2[15:7]), // 2 bit shifted idx in case of 2 banks enabled
//            .sel0(ncu_l2t_pm_sync_n),
//            .sel1(fourbanks_true_enbld),
//            .sel2(twobanks_true_enbld)
//            );

 
//assign	arbadr_arbdp_vuad_idx2_px2 = vuad_idx2_px2[8:0] ; // index for stalled operations. 

//buff_macro buff_arbadr_arbdp_vuad_idx1_px2  (width=18,stack=18r,dbuff=32x)
//	(
//	.dout	({arbadr_arbdp_vuad_idx2_px2[8:0],arbadr_arbdp_vuad_idx1_px2[8:0]}),	
//	.din	({vuad_idx2_px2[8:0],arbadr_arbdp_vuad_idx1_px2_unbuff[8:0]})
////	);
//
//buff_macro buff_arbadr_arbdp_vuad_idx1_px2  (width=9,stack=10r,dbuff=32x)
//        (
//        .dout   (arbadr_arbdp_vuad_idx2_px2[8:0]),  
//        .din    (vuad_idx2_px2[8:0])
//        );
//
//



//////////////////////////////////////////////////////////////////////////
// INDEX BITS TO THE TAG. 
// The index of a C1 stalled instruction is muxed with the following 
// components to generate the address for accessing tag/vuad arrays 
// tag_ecc addr. 
// data_ecc_addr. 
// tag diagnostic addr. 
// ( The tag BIST mux is located inside the tag array ) 
// 
// two separate addresses are sent to the tag array/vuad array. 
// these arrays select between the new address or the address of the  
// stalled instruction. The select signal is generated in l2t_arb_ctl.sv 
//////////////////////////////////////////////////////////////////////// 
 
l2t_arbadr_dp_inv_macro__dinv_32x__width_1 arb_inc_tag_ecc_cnt_c3_n_inv_slice   (
        .dout   (arb_inc_tag_ecc_cnt_c3_n_n),
        .din    (arb_inc_tag_ecc_cnt_c3_n)
        );

l2t_arbadr_dp_msff_macro__stack_10r__width_9 ff_idx_hold_c2  // BS & SR 10/28/03
//                       (.din(arbdp_addr_c2[17:9]), .clk(l2clk), 
                      (.din(arbadr_addr_c2_pbnk[8:0]), .clk(l2clk), // fix for bug 117807
                       .scan_in(ff_idx_hold_c2_scanin),
                       .scan_out(ff_idx_hold_c2_scanout),
                       .dout(tag_ecc_idx[8:0]), .en(arb_inc_tag_ecc_cnt_c3_n),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
 
l2t_arbadr_dp_mux_macro__dmux_8x__mux_pgnpe__ports_3__stack_10r__width_9 mux_tag_idx_px   // BS & SR 10/28/03
			(.dout ( tag_acc_idx_px2[8:0] ) , 
//			.din0(arbadr_data_ecc_idx[8:0]),  // deccck idx 
			.din0(arbadr_data_ecc_idx_internal[8:0]),  // deccck idx 
			.din1(tag_ecc_idx[8:0]), // tecc idx 
			.din2(arbdp_addr_c2[17:9]), // diagnostic wr. 
			.sel0(arb_sel_deccck_addr_px2), //  sel decc 
			.sel1(arb_sel_tecc_addr_px2), // sel tecc 
			.sel2(arb_sel_diag_addr_px2),
  .muxtst(muxtst)); // sel diag wr. 
 
l2t_arbadr_dp_inv_macro__dinv_32x__width_1 arb_sel_diag_tag_addr_px2_inv_slice   (
        .dout   (arb_sel_diag_tag_addr_px2_n),
        .din    (arb_sel_diag_tag_addr_px2)
        );

l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_10r__width_9 mux_mux_idx2_px2  // BS & SR 10/28/03
	(.dout (mux_idx2_px2[8:0] ) , 
	.din0(tag_acc_idx_px2[8:0]), // tecc, deccck and diag write. 
	.din1(stall_addr_idx_c1_1[8:0]), // stalled addr, BS 03/25/04 for partial bank/core modes support 
	.sel0(arb_sel_diag_tag_addr_px2),  // select diag/tecc/deccck addr 
	.sel1(arb_sel_diag_tag_addr_px2_n)); // sel stalled addr. 
 
l2t_arbadr_dp_inv_macro__dinv_32x__width_1 arb_sel_lkup_stalled_tag_px2_inv_slice   (
        .dout   (arb_sel_lkup_stalled_tag_px2_n),
        .din    (arb_sel_lkup_stalled_tag_px2)
        );


// BS 03/25/04 for partial bank/core modes support
// tag index shift , shift only indices from core/siu/mbf/fbf/stalled instructions
// no shift for tecc, scrub and diagnostic accesses
//mux_macro  mux_stall_addr_idx_c1 (width=9,ports=3,mux=aonpe,stack=10r,dmux=8x)
//                        (.dout (stall_addr_idx_c1[8:0]) ,
//                        .din0  (arbdp_addr_c1[17:9]  ), // original idx from core/siu/mbf/filbuf, all banks enabled
//                        .din1  (arbdp_addr_c1[16:8]  ), // 1 bit shifted idx in case of 4 banks enabled
//                        .din2  (arbdp_addr_c1[15:7]  ), // 2 bit shifted idx in case of 2 banks enabled
//                        .sel0(ncu_l2t_pm_sync_n),
//                        .sel1(fourbanks_true_enbld),
//                        .sel2(twobanks_true_enbld)
//                        );
// B.S : 03/26/05 
// Flop stall_addr_idx_c1 till c5 , these will be used to detect index matches
// between wr and rd of vuad to trigger vuad bypass.

l2t_arbadr_dp_msff_macro__stack_36r__width_36 ff_stall_addr_idx_c2to5  // BS & SR 10/28/03
       (
	.scan_in(ff_stall_addr_idx_c2to5_scanin),
	.scan_out(ff_stall_addr_idx_c2to5_scanout),
	.din({stall_addr_idx_c1_1[8:0],stall_addr_idx_c2[8:0],stall_addr_idx_c3[8:0],stall_addr_idx_c4[8:0]}), 
	.clk(l2clk),
        .dout({stall_addr_idx_c2[8:0],stall_addr_idx_c3[8:0],stall_addr_idx_c4[8:0],stall_addr_idx_c5[8:0]}), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

//////////////////////////////
l2t_arbadr_dp_inv_macro__dinv_32x__width_3 inv_partial_core_signals 
	(
	.dout	({ncu_l2t_pm_sync_n_ff1_n,fourbanks_true_enbld_ff1_n,twobanks_true_enbld_ff1_n}),
	.din	({ncu_l2t_pm_sync_n_ff1,fourbanks_true_enbld_ff1,twobanks_true_enbld_ff1})
	);

l2t_arbadr_dp_nor_macro__dnor_16x__width_1 nor_mux_data_idx_px2_muxsel_1 
	(
	.dout	(mux_data_idx_px2_sel1),
	.din0	(arb_sel_lkup_stalled_tag_px2),
	.din1	(ncu_l2t_pm_sync_n_ff1_n)
	);

l2t_arbadr_dp_nor_macro__dnor_16x__ports_3__width_2 nor_mux_data_idx_px2_muxsel_2_3   // fix for bug 111495
        (
        .dout   ({mux_data_idx_px2_sel2,mux_data_idx_px2_sel3}),
        .din0   ({arb_sel_lkup_stalled_tag_px2,arb_sel_lkup_stalled_tag_px2}),
        .din1   ({fourbanks_true_enbld_ff1_n,fourbanks_true_enbld_ff1}),
        .din2   ({ncu_l2t_pm_sync_n_ff1,ncu_l2t_pm_sync_n_ff1})
        );


// ATPG fix not possible on this mux.. very critical timing
//
//mux_macro mux_data_idx_px2 (width=9,ports=4,mux=pgnpe,stack=10r,dmux=32x) // ATPG FLAGGED
//	(
//	.dout 	(data_idx_px2[8:0]) , 
//	.din0	(mux3_addr_px2[17:9]), // instruction Px2 addr 
//	.din1	(mux3_addr_px2[16:8]), 
//	.din2	(mux3_addr_px2[15:7]),
//	.din3	(mux_idx2_px2[8:0]),   // C1 or modified index 
//	.sel0	(mux_data_idx_px2_sel1),
//	.sel1	(mux_data_idx_px2_sel2),
//	.sel2	(mux_data_idx_px2_sel3),
//	);

l2t_arbadr_dp_mux_macro__dmux_32x__mux_pgnpe__ports_4__stack_10r__width_9 mux_data_idx_px2  // BS & SR 10/28/03
        (
        .dout   (data_idx_px2[8:0]) , 
        .din0   (mux_idx2_px2[8:0]), // C1 or modified index 
        .din1   (mux3_addr_px2[17:9]), // instruction Px2 addr 
        .din2   (mux3_addr_px2[16:8]),
        .din3   (mux3_addr_px2[15:7]),
        .sel0   (arb_sel_lkup_stalled_tag_px2),  // select diag/tecc/deccck addr 
        .sel1   (mux_data_idx_px2_sel1),
        .sel2   (mux_data_idx_px2_sel2),
        .sel3   (mux_data_idx_px2_sel3),
  .muxtst(muxtst)
        );




l2t_arbadr_dp_msff_macro__stack_5r__width_5 ff_ncu_signals  // BS & SR 10/28/03
       (
        .scan_in(ff_ncu_signals_scanin),
        .scan_out(ff_ncu_signals_scanout),
        .din({ncu_l2t_pm,ncu_l2t_ba01,ncu_l2t_ba23,ncu_l2t_ba45,ncu_l2t_ba67}),
	.dout({ncu_l2t_pm_sync,ncu_l2t_ba01_sync,ncu_l2t_ba23_sync,ncu_l2t_ba45_sync,ncu_l2t_ba67_sync}),
        .clk(l2clk),
        .en(io_cmp_sync_en_r1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


l2t_arbadr_dp_inv_macro__width_1 inv_ncu_l2t_pm  (
        .dout   (ncu_l2t_pm_sync_n),
        .din    (ncu_l2t_pm_sync)
      );

assign arbadr_dirvec_ncu_l2t_pm_n_dist = ncu_l2t_pm_sync_n_ff8;
assign arbadr_arbctl_ncu_l2t_pm_n_dist = ncu_l2t_pm_sync_n_ff7;
assign arbadr_tagd_ncu_l2t_pm_n_dist   = ncu_l2t_pm_sync_n_ff6;
assign arbadr_evctag_ncu_l2t_pm_n_dist = ncu_l2t_pm_sync_n_ff5;

l2t_arbadr_dp_inv_macro__width_1 inv_ncu_l2t_ba01  (
        .dout   (ncu_l2t_ba01_sync_n),
        .din    (ncu_l2t_ba01_sync)
       );

l2t_arbadr_dp_inv_macro__width_1 inv_ncu_l2t_ba23  (
        .dout   (ncu_l2t_ba23_sync_n),
        .din    (ncu_l2t_ba23_sync)
       );
l2t_arbadr_dp_inv_macro__width_1 inv_ncu_l2t_ba45  (
        .dout   (ncu_l2t_ba45_sync_n),
        .din    (ncu_l2t_ba45_sync)
       );
l2t_arbadr_dp_inv_macro__width_1 inv_ncu_l2t_ba67  (
        .dout   (ncu_l2t_ba67_sync_n),
        .din    (ncu_l2t_ba67_sync)
       );

l2t_arbadr_dp_and_macro__ports_4__width_1 ba01_only_enbld_slice  
                        (.dout (ba01_only_enbld),
                         .din0 (ncu_l2t_ba01_sync),
                         .din1 (ncu_l2t_ba23_sync_n),
                         .din2 (ncu_l2t_ba45_sync_n),
                         .din3 (ncu_l2t_ba67_sync_n)
                        );

l2t_arbadr_dp_and_macro__ports_4__width_1 ba23_only_enbld_slice   
                        (.dout (ba23_only_enbld), 
                         .din0 (ncu_l2t_ba23_sync),
                         .din1 (ncu_l2t_ba01_sync_n),
                         .din2 (ncu_l2t_ba45_sync_n),
                         .din3 (ncu_l2t_ba67_sync_n)
                        );
l2t_arbadr_dp_and_macro__ports_4__width_1 ba45_only_enbld_slice   
                        (.dout (ba45_only_enbld), 
                         .din0 (ncu_l2t_ba45_sync),
                         .din1 (ncu_l2t_ba23_sync_n),
                         .din2 (ncu_l2t_ba01_sync_n),
                         .din3 (ncu_l2t_ba67_sync_n)
                        );
l2t_arbadr_dp_and_macro__ports_4__width_1 ba67_only_enbld_slice   
                        (.dout (ba67_only_enbld), 
                         .din0 (ncu_l2t_ba67_sync),
                         .din1 (ncu_l2t_ba23_sync_n),
                         .din2 (ncu_l2t_ba45_sync_n),
                         .din3 (ncu_l2t_ba01_sync_n)
                        );

l2t_arbadr_dp_or_macro__ports_3__width_1  or_2banks_enbld_1_slice   
                        (.dout (twobanks_enbld_1), 
                         .din0 (ba01_only_enbld),
                         .din1 (ba23_only_enbld), 
                         .din2 (ba45_only_enbld) 
                        );

l2t_arbadr_dp_or_macro__ports_2__width_1  or_2banks_enbld_slice  
                        (.dout (twobanks_enbld),
                         .din0 (twobanks_enbld_1),
                         .din1 (ba67_only_enbld)
                        );


l2t_arbadr_dp_and_macro__ports_4__width_1 ba0123_enbld_slice   
                        (.dout (ba0123_enbld), 
                         .din0 (ncu_l2t_ba01_sync),
                         .din1 (ncu_l2t_ba23_sync),
                         .din2 (ncu_l2t_ba45_sync_n),
                         .din3 (ncu_l2t_ba67_sync_n)
                        );

l2t_arbadr_dp_and_macro__ports_4__width_1 ba2345_enbld_slice   
                        (.dout (ba2345_enbld), 
                         .din0 (ncu_l2t_ba23_sync),
                         .din1 (ncu_l2t_ba01_sync_n),
                         .din2 (ncu_l2t_ba45_sync),
                         .din3 (ncu_l2t_ba67_sync_n)
                        );
l2t_arbadr_dp_and_macro__ports_4__width_1 ba4567_enbld_slice   
                        (.dout (ba4567_enbld), 
                         .din0 (ncu_l2t_ba45_sync),
                         .din1 (ncu_l2t_ba23_sync_n),
                         .din2 (ncu_l2t_ba01_sync_n),
                         .din3 (ncu_l2t_ba67_sync)
                        );
l2t_arbadr_dp_and_macro__ports_4__width_1 ba6701_enbld_slice   
                        (.dout (ba6701_enbld), 
                         .din0 (ncu_l2t_ba67_sync),
                         .din1 (ncu_l2t_ba23_sync_n),
                         .din2 (ncu_l2t_ba45_sync_n),
                         .din3 (ncu_l2t_ba01_sync)
                        );

l2t_arbadr_dp_and_macro__ports_4__width_1 ba2367_enbld_slice   
                        (.dout (ba2367_enbld), 
                         .din0 (ncu_l2t_ba67_sync),
                         .din1 (ncu_l2t_ba23_sync),
                         .din2 (ncu_l2t_ba45_sync_n),
                         .din3 (ncu_l2t_ba01_sync_n)
                        );
l2t_arbadr_dp_and_macro__ports_4__width_1 ba0145_enbld_slice   
                        (.dout (ba0145_enbld), 
                         .din0 (ncu_l2t_ba67_sync_n),
                         .din1 (ncu_l2t_ba23_sync_n),
                         .din2 (ncu_l2t_ba45_sync),
                         .din3 (ncu_l2t_ba01_sync)
                        );

l2t_arbadr_dp_or_macro__ports_3__width_1  or_4banks_enbld_1_slice   
                        (.dout (fourbanks_enbld_1), 
                         .din0 (ba0123_enbld),
                         .din1 (ba2345_enbld),
                         .din2 (ba4567_enbld)
                        );

l2t_arbadr_dp_or_macro__ports_3__width_1  or_4banks_enbld_2_slice   
                        (.dout (fourbanks_enbld_2), 
                         .din0 (ba6701_enbld),
                         .din1 (ba0145_enbld),
                         .din2 (ba2367_enbld)
                        );

l2t_arbadr_dp_or_macro__ports_2__width_1  or_4banks_enbld_slice  
                        (.dout (fourbanks_enbld),
                         .din0 (fourbanks_enbld_1),
                         .din1 (fourbanks_enbld_2)
                        );

l2t_arbadr_dp_and_macro__ports_2__width_1 and_twobanks_true_enbld_slice  
                        (.dout (twobanks_true_enbld),
                         .din0 (ncu_l2t_pm_sync),
                         .din1 (twobanks_enbld)
                        );

assign arbadr_dirvec_2bnk_true_enbld_dist = twobanks_true_enbld_ff8;
assign arbadr_evctag_2bnk_true_enbld_dist = twobanks_true_enbld_ff7;
assign arbadr_arbctl_2bnk_true_enbld_dist = twobanks_true_enbld_ff6;
assign arbadr_tagd_2bnk_true_enbld_dist   = twobanks_true_enbld_ff5;

l2t_arbadr_dp_and_macro__ports_2__width_1 and_fourbanks_true_enbld_slice  
                        (.dout (fourbanks_true_enbld),
                         .din0 (ncu_l2t_pm_sync),
                         .din1 (fourbanks_enbld)
                        );

assign arbadr_dirvec_4bnk_true_enbld_dist = fourbanks_true_enbld_ff8;
assign arbadr_evctag_4bnk_true_enbld_dist = fourbanks_true_enbld_ff7;
assign arbadr_arbctl_4bnk_true_enbld_dist = fourbanks_true_enbld_ff6;
assign arbadr_tagd_4bnk_true_enbld_dist   = fourbanks_true_enbld_ff5;

//assign arbadr_arbdp_tag_idx_px2[8:0] = data_idx_px2[8:0];

//buff_macro buff_arbadr_arbdp_tag_idx_px2 (width=9,dbuff=16x)
//	(
//	.dout	(arbadr_arbdp_tag_idx_px2[8:0]),
//	.din	(data_idx_px2[8:0])
//	);




l2t_arbadr_dp_inv_macro__dinv_16x__width_9 inv_arbadr_arbdp_tag_idx_px2 
      (
      .dout   (arbadr_arbdp_tag_idx_px2[8:0]),
      .din    (data_idx_px2[8:0])
      );

 
/////////////////////////////////////////////////////////////////////////// 
// l2t_l2d_set_c2 
//	If an operation is stalled in C1, the C1 and C2 indices are 
//	maintained until the stall is deasserted. 
//  
//	The set calculation is done with 3 2:1 muxes as follows 
//	mux1: select between a stalled C1 addr ( from C1 op, deccck idx,  
//		tecc idx, diagnostic idx ) and a PX2 operation. 
//	mux2(c2 stall mux): select between the FLOPPED mux1 output C2 idx. 
// 
//	mux3(bust mux flop): select between bist idx and the output of mux2 
//	 
//	Notice that the C1 and C2 indices are stalled. 
/////////////////////////////////////////////////////////////////////////// 
l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__width_3 mux_ncu_partialbank_signals 
	(
	.dout	({mux_ncu_l2t_pm_sync_n,mux_twobanks_true_enbld,mux_fourbanks_true_enbld}),
	.din0	({ncu_l2t_pm_sync_n,twobanks_true_enbld,fourbanks_true_enbld}),
	.din1	(3'b0),
	.sel0	(mbist_run_r1_n),
	.sel1	(mbist_run_r1)
	);

assign ncu_l2t_pm_sync_n_8[7:0] = {8{mux_ncu_l2t_pm_sync_n}};
assign twobanks_true_enbld_8[7:0] = {8{mux_twobanks_true_enbld}};
assign fourbanks_true_enbld_8[7:0] = {8{mux_fourbanks_true_enbld}};

l2t_arbadr_dp_msff_macro__dmsff_32x__stack_10r__width_9 ff_l2d_idx_c1  // BS & SR 10/28/03
        (
        .scan_in(ff_l2d_idx_c1_scanin),
        .scan_out(ff_l2d_idx_c1_scanout),
        .din(data_idx_px2[8:0]),
        .clk(l2clk),
        .dout(data_idx_c1[8:0]),
        .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );
 
// use a mux flop here to reduce setup. 
l2t_arbadr_dp_msff_macro__dmsff_32x__stack_4r__width_3 ff_ncu_mux_sel_2  // BS & SR 10/28/03
        (
	.scan_in(ff_ncu_mux_sel_2_scanin),
	.scan_out(ff_ncu_mux_sel_2_scanout),
	.din({ncu_l2t_pm_sync_n_8[0],twobanks_true_enbld_8[0],fourbanks_true_enbld_8[0]}), 
	.clk(l2clk),
	.dout({ncu_l2t_pm_sync_n_ff1, twobanks_true_enbld_ff1, fourbanks_true_enbld_ff1}), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 

l2t_arbadr_dp_msff_macro__dmsff_32x__stack_4r__width_3 ff_ncu_mux_sel_3  // BS & SR 10/28/03
        (
        .scan_in(ff_ncu_mux_sel_3_scanin),
        .scan_out(ff_ncu_mux_sel_3_scanout),
        .din({ncu_l2t_pm_sync_n_8[1],twobanks_true_enbld_8[1],fourbanks_true_enbld_8[1]}),      
        .clk(l2clk),
        .dout({ncu_l2t_pm_sync_n_ff2, twobanks_true_enbld_ff2, fourbanks_true_enbld_ff2}),
        .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

// Following flop needs to drive outside blocks
l2t_arbadr_dp_msff_macro__dmsff_32x__stack_12r__width_12 ff_ncu_mux_sel_1  // BS & SR 10/28/03
        (
        .scan_in(ff_ncu_mux_sel_1_scanin),
        .scan_out(ff_ncu_mux_sel_1_scanout),
        .din({ncu_l2t_pm_sync_n_8[7:4],twobanks_true_enbld_8[7:4],fourbanks_true_enbld_8[7:4]}),
        .clk(l2clk),
        .dout({ncu_l2t_pm_sync_n_ff5,ncu_l2t_pm_sync_n_ff6,ncu_l2t_pm_sync_n_ff7,ncu_l2t_pm_sync_n_ff8,
               twobanks_true_enbld_ff5,twobanks_true_enbld_ff6,twobanks_true_enbld_ff7,twobanks_true_enbld_ff8,
               fourbanks_true_enbld_ff5,fourbanks_true_enbld_ff6,fourbanks_true_enbld_ff7,fourbanks_true_enbld_ff8}),
        .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );  
 
l2t_arbadr_dp_inv_macro__dinv_32x__width_1 arb_sel_c2_stall_idx_c1_inv_slice   (
        .dout   (arb_sel_c2_stall_idx_c1_n),
        .din    (arb_sel_c2_stall_idx_c1)
        );

l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_10r__width_9 mux_c2stall  // BS & SR 10/28/03
			(.dout (stall_idx_c1[8:0] ) , 
			.din0(data_idx_c1[8:0]),  // idx of C1 instruction 
			.din1(data_bist_idx_c2[8:0]), // BIST set 
			.sel0(arb_sel_c2_stall_idx_c1_n),   // stalled c2 address is NOT selected 
			.sel1(arb_sel_c2_stall_idx_c1));  // stalled c2 address is selected  
 
// C2 address stall mux. 
// If a stall is asserted, the C2 address needs to be 
// retained. THis is  

l2t_arbadr_dp_inv_macro__dinv_32x__width_1 bist_data_enable_c1_inv_slice   (
        .dout   (bist_data_enable_c1_n),
        .din    (bist_data_enable_c1)
        );

 
l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_10r__width_9 mux_data_idx_c1  // BS & SR 10/28/03
			(.dout (data_bist_idx_c1[8:0] ) , 
			.din0(stall_idx_c1[8:0]),  // idx of C1 instruction 
			.din1(bist_data_set_c1[8:0]), // BIST set 
			.sel0(bist_data_enable_c1_n),   
			.sel1(bist_data_enable_c1));  
 
// use a mux flop here to reduce setup. 
l2t_arbadr_dp_msff_macro__stack_10r__width_9 ff_l2d_idx_c2  // BS & SR 10/28/03
               (.din(data_bist_idx_c1[8:0]), .clk(l2clk),  
		.scan_in(ff_l2d_idx_c2_scanin),
		.scan_out(ff_l2d_idx_c2_scanout),
		.dout(data_bist_idx_c2[8:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 
 
//assign	l2t_l2d_set_c2 = data_bist_idx_c2 ; 
//buff_macro buff_l2t_l2d_set_c2	(width=9,stack=9r,dbuff=32x)
//	(
//	.dout	(l2t_l2d_set_c2[8:0]),
//	.din	(data_bist_idx_c2[8:0])
//	);

l2t_arbadr_dp_msff_macro__dmsff_32x__stack_10r__width_9 ff_l2d_idx_fnl_c2 
        (
	.scan_in(ff_l2d_idx_fnl_c2_scanin),
	.scan_out(ff_l2d_idx_fnl_c2_scanout),
	.din(data_bist_idx_c1[8:0]), 
	.clk(l2clk),
        .dout(l2t_l2d_set_c2[8:0]), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

 
 
/////////////////////////////////////////////////////////////////////// 
// other bits of the tag. 
/////////////////////////////////////////////////////////////////////// 
 
// diagnostic wr data  
// assign	tag_diag_wr_data_c2[39:18] = arbdat_arbdata_wr_data_c2[27:6] ; // c2 data. 
// assign	tag_diag_wr_data_c2[5:0] =   arbdat_arbdata_wr_data_c2[5:0]; // tag ecc bits. 

l2t_arbadr_dp_buff_macro__dbuff_16x__stack_28r__width_28 buff_tag_diag_wr_data_c2  
	(
	.dout	({tag_diag_wr_data_c2[39:18],tag_diag_wr_data_c2[5:0]}),
	.din	(arbdat_arbdata_wr_data_c2[27:0])
	);


 
l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_28r__width_28 mux_tag_acc_data_px2	 
	(.dout(tag_acc_data_px2[27:0]) , 
	.din0(tecc_corr_tag_c2[27:0]), // corr tecc tag. 
	.din1({tag_diag_wr_data_c2[39:18],tag_diag_wr_data_c2[5:0]}), // diagnostic write tag. 
	.sel0(arb_inc_tag_ecc_cnt_c3_n_n), // tecc active 
	.sel1(arb_inc_tag_ecc_cnt_c3_n)); // tecc not active 
 
//******************************************************************* 
// Changes start here. 
// changed sel0 and sel1 ; 
l2t_arbadr_dp_inv_macro__dinv_32x__width_1 arb_diag_or_tecc_write_px2_inv_slice   (
        .dout   (arb_diag_or_tecc_write_px2_n),
        .din    (arb_diag_or_tecc_write_px2)
        );

l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_3__stack_22r__width_22 mux_arbdp_addr_c1_1_fnl 
       (.dout (arbdp_addr_c1_1_fnl[39:18]) ,
       .din0(arbdp_addr_c1_1[39:18]), // original tag from core/siu/mbf/filbuf, all banks enabled
       .din1(arbdp_addr_c1_1[38:17]), // 1 bit shifted tag in case of 4 banks enabled
       .din2(arbdp_addr_c1_1[37:16]), // 2 bit shifted tag in case of 2 banks enabled
       .sel0(ncu_l2t_pm_sync_n_ff2),
       .sel1(fourbanks_true_enbld_ff2),
       .sel2(twobanks_true_enbld_ff2)
       );


l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_28r__width_28 mux_tag_stalled_data	 
	(
	.dout	(mux2_tagdata_px2[27:0]) , 
	.din0	(tag_acc_data_px2[27:0]), // corr tecc tag or diag data 
	.din1	({arbdp_addr_c1_1_fnl[39:18],arbdp_addr_c1_1[5:0]}), // c1 tag 
	.sel0	(arb_diag_or_tecc_write_px2), // diag ortecc or deccck active 
	.sel1	(arb_diag_or_tecc_write_px2_n)
	); // no diag or tecc access. 
 
//Added this mux  
l2t_arbadr_dp_inv_macro__dinv_32x__width_1 arb_sel_way_px2_inv_slice   (
        .dout   (arb_sel_way_px2_n),
        .din    (arb_sel_way_px2)
        );

// BS 03/25/04 for partial bank/core modes support
// fill tag shift for update 
// On a fill related tag update, the tag needs to be shifted also,
// however the ecc would be correct as it is gnerated off of the
// miss address in C1 which had been shifted properly already 
// before tag lookup. hence we do not need to change evctag_addr_px2[5:0]
// also corr tecc tag or diag data should go through unmodified to the
// tag array.

l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_3__stack_22r__width_22 mux_evctag_addr_fnl_px2 
       (.dout (evctag_addr_fnl_px2[39:18]) ,
       .din0(evctag_addr_px2[39:18]), // original tag from core/siu/mbf/filbuf, all banks enabled
       .din1(evctag_addr_px2[38:17]), // 1 bit shifted tag in case of 4 banks enabled
       .din2(evctag_addr_px2[37:16]), // 2 bit shifted tag in case of 2 banks enabled
       .sel0(ncu_l2t_pm_sync_n_ff2),
       .sel1(fourbanks_true_enbld_ff2),
       .sel2(twobanks_true_enbld_ff2)
       );


l2t_arbadr_dp_buff_macro__dbuff_8x__stack_28r__width_28 buff_arbadr_tag_wrdata_px2 
	(
	.dout	(arbadr_tag_wrdata_px2[27:0]),
	.din	(arbadr_tag_wrdata_px2_unbuff[27:0])
	);
l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_28r__width_28 mux_tag_wrdata_px2	 
	(
	.dout	(arbadr_tag_wrdata_px2_unbuff[27:0]) , 
	.din0	(mux2_tagdata_px2[27:0]), // corr tecc tag or diag data 
	.din1	({evctag_addr_fnl_px2[39:18],evctag_addr_px2[5:0]}), // px2 fill tag 
	.sel0	(arb_sel_way_px2_n), // diag ortecc or deccck active 
	.sel1	(arb_sel_way_px2) // no diag or tecc access. 
	);
 
// LKUP addr. 
// changed in0 

l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_22r__width_22 mux_arbdp_tagdata_tmp_px2	  // int 5.0 changes
	(
	.dout	(arbadr_arbdp_tagdata_tmp_px2[27:6]) , 
	.din0	(arbdp_addr_c1_1[39:18]), // c1 tag 
	.din1	(mux3_addr_px2[39:18]), // tag from other srcs 
	.sel0	(arb_sel_lkup_stalled_tag_px2), // stalled tag sel. 
	.sel1	(arb_sel_lkup_stalled_tag_px2_n) // new tag sel 
	);

// BS 03/25/04 for partial bank/core modes support
// tag shift for lookup

l2t_arbadr_dp_mux_macro__dmux_32x__mux_pgpe__ports_4__stack_22r__width_22 mux_arbdp_tagdata_px2 
        (
	.dout (arbadr_arbdp_tagdata_px2[27:6]) ,
        .din0(arbadr_arbdp_tagdata_tmp_px2[27:6]), // original tag from core/siu/mbf/filbuf, all banks enabled
        .din1({arbadr_arbdp_tagdata_tmp_px2[26:6],mux4_addr_px2[17]}), // 1 bit shifted tag in case of 4 banks enabled
        .din2({arbadr_arbdp_tagdata_tmp_px2[25:6],mux4_addr_px2[17:16]}), // 2 bit shifted tag in case of 2 banks enabled
        .din3(mbist_tag_lkup_addr[27:6]), // mbist lkup data
        .sel0(ncu_l2t_pm_sync_n_ff2),
        .sel1(fourbanks_true_enbld_ff2),
        .sel2(twobanks_true_enbld_ff2),
  .muxtst(muxtst),
  .test(test)
//	.sel3(mbist_run_r1)
        );

 
// Changes end here. 
//******************************************************************* 
 
// the whole tag for CAMMIng the miss buffer. 

l2t_arbadr_dp_buff_macro__dbuff_32x__width_40 buff_arbdp_addr_c1_1 
	(
	.dout	(arbdp_addr_c1_1[39:0]), 
	.din	(arbdp_addr_c1_unbuff[39:0])
	);

l2t_arbadr_dp_buff_macro__dbuff_32x__width_40 buff_arbdp_addr_c1_2 
        (
        .dout   (arbdp_addr_c1_2[39:0]),
        .din    (arbdp_addr_c1_unbuff[39:0])
        );


l2t_arbadr_dp_buff_macro__dbuff_32x__width_40 buff_arbdp_addr_c1_3 
        (
        .dout   (arbdp_addr_c1_3[39:0]),
        .din    (arbdp_addr_c1_unbuff[39:0])
        );



l2t_arbadr_dp_msff_macro__dmsff_32x__stack_40r__width_40 ff_inst_addr_c1 
	(
	.scan_in(ff_inst_addr_c1_scanin),
	.scan_out(ff_inst_addr_c1_scanout),
	.din	(mux4_addr_px2[39:0]), 
	.clk	(l2clk),  
	.dout	(arbdp_addr_c1_unbuff[39:0]), 
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 

 
// assign arbadr_arbdp_addr5to4_c1 = arbdp_addr_c1[5:4] ; // to arb for col offset stall calculation. 
// assign	arbadr_arbdp_addr3to2_c1 = arbdp_addr_c1[3:2] ; 
// assign	arbadr_arbdp_ioaddr_c1 = arbdp_addr_c1[39:32] ; // to arb for diag acc decode 
// assign	arbadr_arbdp_word_addr_c1 = arbdp_addr_c1[1:0] ; // pst decode in arbdec 


l2t_arbadr_dp_msff_macro__dmsff_32x__minbuff_1__stack_40r__width_40 ff_addr_c2 
                (.din(arbdp_addr_c1_1[39:0]), .clk(l2clk), 
                .scan_in(ff_addr_c2_scanin),
                .scan_out(ff_addr_c2_scanout),
                .dout(arbdp_addr_c2[39:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
		); 


// assign arbadr_arbdp_addr87_c2 = arbdp_addr_c2[8:7]; //  BS 03/25/04 for partial bank/core modes support
// assign	arbadr_arbaddr_addr22_c2 =  arbdp_addr_c2[22] ;  
// assign	arbadr_arbdp_addr5to4_c2 = arbdp_addr_c2[5:4] ; 
// assign	arbadr_arbdp_diag_wr_way_c2 = arbdp_addr_c2[21:18] ;// diag wr way 
 
assign arbadr_arbdp_ioaddr_c1[39:32] = arbdp_addr_c1_1[39:32];

l2t_arbadr_dp_buff_macro__dbuff_32x__stack_23r__width_15 buff_arbadr_arbaddr_addr_c2  
	(
	.dout	({arbadr_arbdp_addr5to4_c1[1:0],arbadr_arbdp_addr3to2_c1[1:0],
		arbadr_arbdp_ioaddr_c1_unused[39:32], 
		arbadr_arbdp_addr87_c2,arbadr_arbaddr_addr22_c2}),
	.din	({arbdp_addr_c1_1[5:4],arbdp_addr_c1_1[3:2],arbdp_addr_c1_1[39:32],
		  arbdp_addr_c2[8:7],arbdp_addr_c2[22]})
	);

// The following signal indicates that the access is issued to  
// addr0 of a cacheline. 
 
 
// assign	arbadr_arbdp_addr_start_c2 = ( arbdp_addr_c2[5:0] == 6'b0 ) ; 

l2t_arbadr_dp_cmp_macro__dcmp_8x__width_8 arbadr_arbdp_addr_start_c2_cmptr  
        ( 
        .din0   ({2'b0,6'b0}),
        .din1   ({2'b0,arbdp_addr_c2[5:0]}), 
        .dout   (arbadr_arbdp_addr_start_c2) 
        ); 

l2t_arbadr_dp_msff_macro__stack_40r__width_40 ff_addr_c3 
                (.din(arbdp_addr_c2[39:0]), .clk(l2clk), 
              	.scan_in(ff_addr_c3_scanin),
              	.scan_out(ff_addr_c3_scanout),
              	.dout(arbdp_addr_c3[39:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 
 
//assign	arbadr_arbdp_addr5to4_c3 = arbdp_addr_c3[5:4] ; // used in arb for dir cam 
//assign	arbadr_arbaddr_idx_c3 = arbdp_addr_c3[17:7] ; // for  vuad array writes. 

l2t_arbadr_dp_buff_macro__dbuff_32x__stack_15r__width_15 buff_arbadr_arbdp_addr_c1c2comp_c1c3cmp_c1  
        (
        .dout   ({arbadr_arbdp_addr5to4_c3[1:0],arbadr_arbaddr_idx_c3[10:0],
		arbadr_arbdp_addr_c1c2comp_c1,arbadr_arbdp_addr_c1c3comp_c1}),
        .din    ({arbdp_addr_c3[5:4],arbdp_addr_c3[17:7],
		arbadr_arbdp_addr_c1c2comp_c1_unbuff,arbadr_arbdp_addr_c1c3comp_c1_unbuff})
        );





 
//////  POST_4.1
assign	arbadr_arbdp_addr11to4_c3[7:0] =  arbdp_addr_c3[11:4] ; 

//assign	arbadr_arbdp_dbg_addr_c3 = {arbdp_addr_c3[5:2] }; 
 
l2t_arbadr_dp_msff_macro__minbuff_1__stack_40r__width_40 ff_addr_c4 
                 (.din(arbdp_addr_c3[39:0]), .clk(l2clk), 
                .scan_in(ff_addr_c4_scanin),
                .scan_out(ff_addr_c4_scanout),
                .dout(arbdp_addr_c4[39:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 
 
// address for CAMMing the directory. i.e. lkup key 
// wr data into the directory. 
// The evict addr is muxed into this value in tagd. 
 
l2t_arbadr_dp_inv_macro__dinv_32x__width_1 arb_imiss_hit_c4_inv_slice   (
        .dout   (arb_imiss_hit_c4_n),
        .din    (arb_imiss_hit_c4)
        );

l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_33r__width_33 mux_tmp_cam_addr_c3 
	( .dout (arbadr_dir_cam_addr_c3[39:7]), 
             .din0(arbdp_addr_c3[39:7]), .din1(arbdp_addr_c4[39:7]), 
             .sel0(arb_imiss_hit_c4_n), .sel1(arb_imiss_hit_c4)); 
 
l2t_arbadr_dp_msff_macro__stack_40r__width_40 ff_addr_c5 
           (
	.scan_in(ff_addr_c5_scanin),
	.scan_out(ff_addr_c5_scanout),
	.din(arbdp_addr_c4[39:0]), .clk(l2clk), 
        .dout(arbdp_addr_c5[39:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 

// BS 03/11/04 extra cycle for mem access

l2t_arbadr_dp_msff_macro__stack_40r__width_40 ff_addr_c52 
           (
        .scan_in(ff_addr_c52_scanin),
        .scan_out(ff_addr_c52_scanout),
        .din(arbdp_addr_c5[39:0]), .clk(l2clk),
        .dout(arbdp_addr_c52[39:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
);

l2t_arbadr_dp_msff_macro__stack_40r__width_40 ff_addr_c6 
           (.din(arbdp_addr_c52[39:0]), .clk(l2clk), 
            .scan_in(ff_addr_c6_scanin),
            .scan_out(ff_addr_c6_scanout),
            .dout(arbdp_addr_c6[39:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 
 
// assign	arbadr_arbdp_word_addr_c6 = arbdp_addr_c6[36:32] ;// word address to csr ctl. 
// assign	arbadr_arbdp_waddr_c6  = arbdp_addr_c6[3:2] ; // word address tpo  
// assign	arbadr_arbdp_rdmat_addr_c6 = arbdp_addr_c6[5:2] ; // requrired in rdma state logic. 
// assign	arbadr_arbdp_oque_l1_index_c7[11:6] = {1'b0,arbdp_addr_c7[10:6]} ; // idx bits to oque 
// assign  arbadr_dirvec_addr3_c7_tmp = arbdp_addr_c7[3] ; // Address bit 3, BS and SR 11/12/03 N2 Xbar Packet format change

// debug related changes
// assign arbadr_csr_debug_addr[33:2] = arbdp_addr_c6[33:2];

l2t_arbadr_dp_buff_macro__dbuff_32x__stack_32r__width_32  buff_arbadr_csr_debug_addr  
	(
	.dout	(arbadr_csr_debug_addr[33:2]),
	.din	(arbdp_addr_c6[33:2])
	);

l2t_arbadr_dp_buff_macro__dbuff_32x__stack_18r__width_18 buff_arbdp_addr_c6 
	(
	.dout	({arbadr_arbdp_word_addr_c6[4:0],arbadr_arbdp_waddr_c6[1:0],
		  arbadr_arbdp_rdmat_addr_c6[5:2], arbadr_arbdp_oque_l1_index_c7[11:6],
		  arbadr_dirvec_addr3_c7_tmp}),
	.din	({arbdp_addr_c6[36:32],arbdp_addr_c6[3:2],arbdp_addr_c6[5:2],
		1'b0,arbdp_addr_c7[10:6],arbdp_addr_c7[3]})
	);

// BS and SR 12/22/03, store ack generation for diagnostic store

l2t_arbadr_dp_inv_macro__dinv_32x__width_1 inv_sel_diag_store_data_c8 
        (
        .dout   (sel_diag_store_data_c7_n ),
        .din    (sel_diag_store_data_c7 )
        );

l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_1r__width_1 mux_st_ack_addr3     
       (
       .dout   (arbadr_dirvec_addr3_c7),
       .din0   (arbadr_dirvec_addr3_c8),
       .din1   (arbadr_dirvec_addr3_c7_tmp),
       .sel0   (sel_diag_store_data_c8),        // for diagnostic store ack cases
       .sel1   (sel_diag_store_data_c8_n)       // for default cases
       );


assign	arbadr_arbdp_byte_addr_c6 = arbdp_addr_c6[2:0] ; // to arbdec for ctag generation, Phase 2 : SIU inteface and packet format change 2/7/04

 
l2t_arbadr_dp_msff_macro__dmsff_32x__stack_40r__width_40 ff_addr_c7 
              (.din(arbdp_addr_c6[39:0]), .clk(l2clk), 
                .scan_in(ff_addr_c7_scanin),
                .scan_out(ff_addr_c7_scanout),
                .dout(arbdp_addr_c7[39:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 
 
// assign	arbadr_arbdp_inst_byte_addr_c7[2:0] = arbdp_addr_c7[2:0] ; // byte address	to arb. 
// assign	arbadr_arbdp_addr22_c7 = arbdp_addr_c7[22] ; // diagnostic data word addr. 
// assign	arbadr_arbdp_line_addr_c7[5:4] = arbdp_addr_c7[5:4] ;// required by oque but pipe stage may change 
// assign	arbadr_addr2_c8 = arbdp_addr_c8[2] ; // for cas compare. 
 
l2t_arbadr_dp_buff_macro__dbuff_32x__stack_6r__width_2  buff_arbdp_addr_c7_misc  
	(
	.dout	({arbadr_arbdp_addr22_c7,arbadr_addr2_c8}),
	.din	({arbdp_addr_c7[22],arbdp_addr_c8[2]})
	);

//assign arbadr_arbdp_line_addr_c7[5:4] = arbdp_addr_c7[5:4];
assign arbadr_arbdp_line_addr_c6[5:4] = arbdp_addr_c6[5:4];
 
 
l2t_arbadr_dp_msff_macro__stack_40r__width_40 ff_addr_c8 
                (.din(arbdp_addr_c7[39:0]), .clk(l2clk), 
                .scan_in(ff_addr_c8_scanin),
                .scan_out(ff_addr_c8_scanout),
                .dout(arbdp_addr_c8[39:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 
 
 
l2t_arbadr_dp_msff_macro__stack_40r__width_40 ff_addr_c9 
                  (.din(arbdp_addr_c8[39:0]), .clk(l2clk), 
                .scan_in(ff_addr_c9_scanin),
                .scan_out(ff_addr_c9_scanout),
                .dout(arbdp_addr_c9[39:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 
 
l2t_arbadr_dp_msff_macro__stack_40r__width_40 ff_addr_c10 
                   (.din(arbdp_addr_c9[39:0]), .clk(l2clk), 
                .scan_in(ff_addr_c10_scanin),
                .scan_out(ff_addr_c10_scanout),
                .dout(arbdp_addr_c10[39:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 
 
l2t_arbadr_dp_msff_macro__stack_40r__width_40 ff_addr_c11 
                   (.din(arbdp_addr_c10[39:0]), .clk(l2clk), 
                .scan_in(ff_addr_c11_scanin),
                .scan_out(ff_addr_c11_scanout),
                .dout(arbdp_addr_c11[39:0]), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 
 
/////////////////////////////////////////////////// 
// Addr to csr block is the address of a ld in C9 
// or an imiss in C10 
/////////////////////////////////////////////////// 

l2t_arbadr_dp_inv_macro__dinv_32x__width_1 arb_imiss_hit_c10_inv_slice  
        ( 
        .dout   (arb_imiss_hit_c10_n), 
        .din    (arb_imiss_hit_c10) 
        );

 
l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_36r__width_36 mux_arbadr_arbdp_csr_addr_c9 
			( .dout (arbadr_arbdp_csr_addr_c9[39:4]), 
              .din0(arbdp_addr_c9[39:4]), .din1(arbdp_addr_c10[39:4]), 
              .sel0(arb_imiss_hit_c10_n), .sel1(arb_imiss_hit_c10)); 
 
 
/////////////////////////////////////////////////// 
// Addr of an ld64 instruction  is staged till C11 
/////////////////////////////////////////////////// 
 
l2t_arbadr_dp_msff_macro__stack_34r__width_34 ff_arbdp_addr_c12 
               (.din(arbdp_addr_c11[39:6]), .clk(l2clk), 
               .scan_in(ff_arbdp_addr_c12_scanin),
               .scan_out(ff_arbdp_addr_c12_scanout),
               .dout(arbadr_rdmard_addr_c12[39:6]), .en(tag_rd64_complete_c11),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
); 

// B.S 05/02/05 : fix for bug 93991 :
// c1c2 cmp and c1c3 cmp have to be generated taking partial core/bank mode into account


l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_3__stack_32r__width_31 mux_arbdp_c1_pbnk 
        (.dout (arbadr_addr_c1_pbnk[30:0]) ,
        .din0(arbdp_addr_c1_3[39:9]), // original PA from core/siu/mbf/filbuf, all banks enabled
        .din1(arbdp_addr_c1_3[38:8]), // 1 bit shifted PA in case of 4 banks enabled
        .din2(arbdp_addr_c1_3[37:7]), // 2 bit shifted PA in case of 2 banks enabled
        .sel0(ncu_l2t_pm_sync_n_ff1),
        .sel1(fourbanks_true_enbld_ff1),
        .sel2(twobanks_true_enbld_ff1)
        );


l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_3__stack_32r__width_31 mux_arbdp_c2_pbnk 
        (.dout (arbadr_addr_c2_pbnk[30:0]) ,
        .din0(arbdp_addr_c2[39:9]), // original PA from core/siu/mbf/filbuf, all banks enabled
        .din1(arbdp_addr_c2[38:8]), // 1 bit shifted PA in case of 4 banks enabled
        .din2(arbdp_addr_c2[37:7]), // 2 bit shifted PA in case of 2 banks enabled
        .sel0(ncu_l2t_pm_sync_n_ff1),
        .sel1(fourbanks_true_enbld_ff1),
        .sel2(twobanks_true_enbld_ff1)
        );


l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_3__stack_32r__width_31 mux_arbdp_c3_pbnk 
        (.dout (arbadr_addr_c3_pbnk[30:0]) ,
        .din0(arbdp_addr_c3[39:9]), // original PA from core/siu/mbf/filbuf, all banks enabled
        .din1(arbdp_addr_c3[38:8]), // 1 bit shifted PA in case of 4 banks enabled
        .din2(arbdp_addr_c3[37:7]), // 2 bit shifted PA in case of 2 banks enabled
        .sel0(ncu_l2t_pm_sync_n_ff1),
        .sel1(fourbanks_true_enbld_ff1),
        .sel2(twobanks_true_enbld_ff1)
        );

 
l2t_arbadr_dp_cmp_macro__dcmp_8x__width_32 mbf_bypass_cmp1  
                ( .din0({1'b0,arbadr_addr_c2_pbnk[30:0]}),
                  .din1({1'b0,arbadr_addr_c1_pbnk[30:0]}),
                  .dout(arbadr_arbdp_addr_c1c2comp_c1_unbuff)
                );

l2t_arbadr_dp_cmp_macro__dcmp_8x__width_32 mbf_bypass_cmp2  
                ( .din0({1'b0,arbadr_addr_c3_pbnk[30:0]}),
                  .din1({1'b0,arbadr_addr_c1_pbnk[30:0]}),
                  .dout(arbadr_arbdp_addr_c1c3comp_c1_unbuff)
                );


 
// INDEX COMPARATORS for VUAD bypass 

// B.S : 03/26/05
// Flop stall_addr_idx_c1 till c5 , these will be used to detect index matches
// between wr and rd of vuad to trigger vuad bypass.
//assign	arbadr_idx_c1c2comp_c1 = ( stall_addr_idx_c2[8:0] == stall_addr_idx_c1[8:0] ) ; 
//assign	arbadr_idx_c1c3comp_c1 = ( stall_addr_idx_c3[8:0] == stall_addr_idx_c1[8:0] ) ; 
//assign	arbadr_idx_c1c4comp_c1 = ( stall_addr_idx_c4[8:0] == stall_addr_idx_c1[8:0] ) ; 
//assign	arbadr_idx_c1c5comp_c1 = ( stall_addr_idx_c5[8:0] == stall_addr_idx_c1[8:0] ) ; 

l2t_arbadr_dp_cmp_macro__dcmp_8x__width_12 vuad_bypass_cmp1 
               ( .din0({3'b00,stall_addr_idx_c2[8:0]}),
                 .din1({3'b00,stall_addr_idx_c1_2[8:0]}),
                 .dout(arbadr_idx_c1c2comp_c1_unbuff)
               );


l2t_arbadr_dp_buff_macro__dbuff_48x__width_2 buff_c1c2andc1c3_slice 
	(
	.dout	({arbadr_misbuf_idx_c1c2comp_c1,arbadr_misbuf_idx_c1c3comp_c1}),
	.din	({arbadr_idx_c1c2comp_c1_unbuff,arbadr_idx_c1c3comp_c1_unbuff})
	);


l2t_arbadr_dp_inv_macro__dinv_32x__width_4 inv_signals_to_vuad 
	(
	.dout	({arbadr_idx_c1c2comp_c1_n,arbadr_idx_c1c3comp_c1_n,
			arbadr_idx_c1c4comp_c1_n,arbadr_idx_c1c5comp_c1_n}),
	.din	({arbadr_idx_c1c2comp_c1_unbuff,arbadr_idx_c1c3comp_c1_unbuff,
		  arbadr_idx_c1c4comp_c1_unbuff,arbadr_idx_c1c5comp_c1_unbuff})
	);





l2t_arbadr_dp_cmp_macro__dcmp_8x__width_12 vuad_bypass_cmp2 
               ( .din0({3'b00,stall_addr_idx_c3[8:0]}),
                 .din1({3'b00,stall_addr_idx_c1_2[8:0]}),
                 .dout(arbadr_idx_c1c3comp_c1_unbuff)
               );
l2t_arbadr_dp_cmp_macro__dcmp_8x__width_12 vuad_bypass_cmp3 
               ( .din0({3'b00,stall_addr_idx_c4[8:0]}),
                 .din1({3'b00,stall_addr_idx_c1_3[8:0]}),
                 .dout(arbadr_idx_c1c4comp_c1_unbuff)
               );
l2t_arbadr_dp_cmp_macro__dcmp_8x__width_12 vuad_bypass_cmp4 
               ( .din0({3'b00,stall_addr_idx_c5[8:0]}),
                 .din1({3'b00,stall_addr_idx_c1_3[8:0]}),
                 .dout(arbadr_idx_c1c5comp_c1_unbuff)
               );


 
/////////////////////////////////////////////// 
// bypassing of wb_write_data 
// required for generation 
// of wb hit. 
// evicted tag is written into the WBB in C5. 
// The operation in C2 in that cycle will have 
// to see the effect of the wb write. Hence the 
// C4 address being written into the tag is compared 
// with the address of the instruction in C1. 
////////////////////////////////////////////// 
// 
// assign  evict_addr_c4[39:18] = tagd_evict_tag_orig_c4[21:0] ; 
// assign  evict_addr_c4[17:8] = arbdp_addr_c4[17:8] ; 
//

// fix for bug 93448 : tag read from tag array on evict needs to be shifted around to
// original address before being sent to MCU

l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_3__stack_24r__width_24 mux_tagd_evict_addr_39_16_c4 
        (
        .dout (tagd_evct_addr_39_16_c4[23:0]),
        .din0({tagd_evict_tag_c4[`TAG_WIDTH-1:6],arbdp_addr_c4[17:16]}), // original idx , all banks enabled
        .din1({1'b0,tagd_evict_tag_c4[`TAG_WIDTH-1:6],arbdp_addr_c4[16]}), // 1 bit shifted idx for 4 banks enabled
        .din2({2'b0,tagd_evict_tag_c4[`TAG_WIDTH-1:6]}), //2 bit shifted idx for 2 banks enabled
        .sel0(ncu_l2t_pm_sync_n_ff2),
        .sel1(fourbanks_true_enbld_ff2),
        .sel2(twobanks_true_enbld_ff2)
        );


l2t_arbadr_dp_buff_macro__dbuff_16x__stack_33r__width_33 buff_evict_addr_c4 
	(
	.dout	(evict_addr_c4[39:7]),
	.din	({tagd_evct_addr_39_16_c4[23:0],arbdp_addr_c4[15:7]})
	);
 
// assign  arbadr_c1_addr_eq_wb_c4 = (evict_addr_c4[39:8] == arbdp_addr_c1[39:8]); 

// B.S 05/15/05 : Fix for bug 94724. Since in partial bank mode, we can have index starting
// from PA[7] , we need to compare PA[39:7] instead of PA[39:8].
 
l2t_arbadr_dp_cmp_macro__dcmp_8x__dcmp_8x__width_32 cmpc4c1 
               ( .din0(arbdp_addr_c1_3[39:8]),
                 .din1(evict_addr_c4[39:8]),
                 .dout(arbadr_c1_addr_eq_wb_c4_unbuff_1)
               ); 

l2t_arbadr_dp_xnor_macro__dxnor_8x__ports_2__width_1 xnor_bit7  (
  .dout(arbadr_c1_addr_eq_wb_c4_unbuff_2),
  .din0(arbdp_addr_c1_3[7]),
  .din1(evict_addr_c4[7])
);

l2t_arbadr_dp_and_macro__ports_2__width_1 arbadr_c1_addr_eq_wb_c4_unbuff_macro  (
  .dout(arbadr_c1_addr_eq_wb_c4_unbuff),
  .din0(arbadr_c1_addr_eq_wb_c4_unbuff_1),
  .din1(arbadr_c1_addr_eq_wb_c4_unbuff_2)
);



l2t_arbadr_dp_buff_macro__dbuff_32x__stack_1r__width_1 buff_arbadr_c1_addr_eq_wb_c4_buf  
	(
	.dout	(arbadr_c1_addr_eq_wb_c4),
	.din	(arbadr_c1_addr_eq_wb_c4_unbuff)
	);
 
 
// fixscan start:
assign ff_tagd_evict_tag_c4_scanin = scan_in                  ;
assign ff_tecc_corr_tag_c2_scanin = ff_tagd_evict_tag_c4_scanout;
assign ff_mux3_bufsel_px2_scanin = ff_tecc_corr_tag_c2_scanout;
assign ff_stall_addr_idx_c1_unbuff_scanin = ff_mux3_bufsel_px2_scanout;
assign ff_l2t_mb2_wdata_scanin   = ff_stall_addr_idx_c1_unbuff_scanout;
assign ff_cam_mbist_datain_reg_scanin = ff_l2t_mb2_wdata_scanout ;
assign ff_data_ecc_idx_scanin    = ff_cam_mbist_datain_reg_scanout;
assign ff_bist_vuad_idx_px2_scanin = ff_data_ecc_idx_scanout  ;
assign ff_idx_hold_c2_scanin     = ff_bist_vuad_idx_px2_scanout;
assign ff_stall_addr_idx_c2to5_scanin = ff_idx_hold_c2_scanout   ;
assign ff_ncu_signals_scanin     = ff_stall_addr_idx_c2to5_scanout;
assign ff_l2d_idx_c1_scanin      = ff_ncu_signals_scanout   ;
assign ff_ncu_mux_sel_2_scanin   = ff_l2d_idx_c1_scanout    ;
assign ff_ncu_mux_sel_3_scanin   = ff_ncu_mux_sel_2_scanout ;
assign ff_ncu_mux_sel_1_scanin   = ff_ncu_mux_sel_3_scanout ;
assign ff_l2d_idx_c2_scanin      = ff_ncu_mux_sel_1_scanout ;
assign ff_l2d_idx_fnl_c2_scanin  = ff_l2d_idx_c2_scanout    ;
assign ff_inst_addr_c1_scanin    = ff_l2d_idx_fnl_c2_scanout;
assign ff_addr_c2_scanin         = ff_inst_addr_c1_scanout  ;
assign ff_addr_c3_scanin         = ff_addr_c2_scanout       ;
assign ff_addr_c4_scanin         = ff_addr_c3_scanout       ;
assign ff_addr_c5_scanin         = ff_addr_c4_scanout       ;
assign ff_addr_c52_scanin        = ff_addr_c5_scanout       ;
assign ff_addr_c6_scanin         = ff_addr_c52_scanout      ;
assign ff_addr_c7_scanin         = ff_addr_c6_scanout       ;
assign ff_addr_c8_scanin         = ff_addr_c7_scanout       ;
assign ff_addr_c9_scanin         = ff_addr_c8_scanout       ;
assign ff_addr_c10_scanin        = ff_addr_c9_scanout       ;
assign ff_addr_c11_scanin        = ff_addr_c10_scanout      ;
assign ff_arbdp_addr_c12_scanin  = ff_addr_c11_scanout      ;
assign scan_out                  = ff_arbdp_addr_c12_scanout;
// fixscan end:
endmodule 
 
 







// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__dmsff_32x__stack_30r__width_28 (
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
wire [26:0] so;

  input [27:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [27:0] dout;


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
dff #(28)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[27:0]),
.si({scan_in,so[26:0]}),
.so({so[26:0],scan_out}),
.q(dout[27:0])
);




















endmodule









//
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__dbuff_16x__width_30 (
  din, 
  dout);
  input [29:0] din;
  output [29:0] dout;






buff #(30)  d0_0 (
.in(din[29:0]),
.out(dout[29:0])
);








endmodule




//
//   xor macro for ports = 2,3
//
//





module l2t_arbadr_dp_xor_macro__dxor_8x__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;





xor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module l2t_arbadr_dp_xor_macro__dxor_8x__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;





xor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);








endmodule





//
//   invert macro
//
//





module l2t_arbadr_dp_inv_macro__stack_1r__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module l2t_arbadr_dp_and_macro__ports_2__width_1 (
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
//   xor macro for ports = 2,3
//
//





module l2t_arbadr_dp_xor_macro__stack_24r__width_24 (
  din0, 
  din1, 
  dout);
  input [23:0] din0;
  input [23:0] din1;
  output [23:0] dout;





xor2 #(24)  d0_0 (
.in0(din0[23:0]),
.in1(din1[23:0]),
.out(dout[23:0])
);








endmodule





//
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__stack_5r__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






buff #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);








endmodule





//
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__dbuff_16x__width_29 (
  din, 
  dout);
  input [28:0] din;
  output [28:0] dout;






buff #(29)  d0_0 (
.in(din[28:0]),
.out(dout[28:0])
);








endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_arbadr_dp_cmp_macro__dcmp_8x__width_8 (
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
//   xor macro for ports = 2,3
//
//





module l2t_arbadr_dp_xor_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;





xor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);








endmodule





//
//   parity macro (even parity)
//
//





module l2t_arbadr_dp_prty_macro__dprty_8x__width_32 (
  din, 
  dout);
  input [31:0] din;
  output dout;







prty #(32)  m0_0 (
.in(din[31:0]),
.out(dout)
);










endmodule





//  
//   and macro for ports = 2,3,4
//
//





module l2t_arbadr_dp_and_macro__width_1 (
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









// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__stack_28r__width_28 (
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
wire [26:0] so;

  input [27:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [27:0] dout;


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
dff #(28)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[27:0]),
.si({scan_in,so[26:0]}),
.so({so[26:0],scan_out}),
.q(dout[27:0])
);




















endmodule









//
//   invert macro
//
//





module l2t_arbadr_dp_inv_macro__dinv_32x__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__dmsff_32x__stack_8c__width_8 (
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
wire [6:0] so;

  input [7:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [7:0] dout;


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
dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_3__stack_40r__width_40 (
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

  input [39:0] din0;
  input sel0;
  input [39:0] din1;
  input sel1;
  input [39:0] din2;
  input sel2;
  output [39:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(40)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[39:0]),
  .in1(din1[39:0]),
  .in2(din2[39:0]),
.dout(dout[39:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_40r__width_40 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [39:0] din0;
  input [39:0] din1;
  input sel0;
  output [39:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(40)  d0_0 (
  .sel(psel1),
  .in0(din0[39:0]),
  .in1(din1[39:0]),
.dout(dout[39:0])
);









  



endmodule


//
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__dbuff_32x__stack_40r__width_40 (
  din, 
  dout);
  input [39:0] din;
  output [39:0] dout;






buff #(40)  d0_0 (
.in(din[39:0]),
.out(dout[39:0])
);








endmodule









// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__dmsff_32x__stack_36r__width_27 (
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
wire [25:0] so;

  input [26:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [26:0] dout;


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
dff #(27)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[26:0]),
.si({scan_in,so[25:0]}),
.so({so[25:0],scan_out}),
.q(dout[26:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_32x__mux_pgpe__ports_3__stack_36r__width_27 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [26:0] din0;
  input [26:0] din1;
  input [26:0] din2;
  input sel0;
  input sel1;
  input muxtst;
  input test;
  output [26:0] dout;





cl_dp1_penc3_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
  .test(test)
);

mux3 #(27)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[26:0]),
  .in1(din1[26:0]),
  .in2(din2[26:0]),
.dout(dout[26:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__stack_10r__width_9 (
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
wire [7:0] so;

  input [8:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [8:0] dout;


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
dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);




















endmodule









//
//   invert macro
//
//





module l2t_arbadr_dp_inv_macro__dinv_32x__width_2 (
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





module l2t_arbadr_dp_and_macro__width_3 (
  din0, 
  din1, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  output [2:0] dout;






and2 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.out(dout[2:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module l2t_arbadr_dp_nor_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_5__stack_35r__width_35 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;

  input [34:0] din0;
  input sel0;
  input [34:0] din1;
  input sel1;
  input [34:0] din2;
  input sel2;
  input [34:0] din3;
  input sel3;
  input [34:0] din4;
  input sel4;
  output [34:0] dout;





cl_dp1_muxbuff5_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4)
);
mux5s #(35)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .in0(din0[34:0]),
  .in1(din1[34:0]),
  .in2(din2[34:0]),
  .in3(din3[34:0]),
  .in4(din4[34:0]),
.dout(dout[34:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__stack_35r__width_35 (
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
wire [33:0] so;

  input [34:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [34:0] dout;


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
dff #(35)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[34:0]),
.si({scan_in,so[33:0]}),
.so({so[33:0],scan_out}),
.q(dout[34:0])
);




















endmodule









//
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__dbuff_8x__stack_35r__width_35 (
  din, 
  dout);
  input [34:0] din;
  output [34:0] dout;






buff #(35)  d0_0 (
.in(din[34:0]),
.out(dout[34:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_35r__width_35 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [34:0] din0;
  input sel0;
  input [34:0] din1;
  input sel1;
  output [34:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(35)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[34:0]),
  .in1(din1[34:0]),
.dout(dout[34:0])
);









  



endmodule


//
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__dbuff_32x__stack_37r__width_37 (
  din, 
  dout);
  input [36:0] din;
  output [36:0] dout;






buff #(37)  d0_0 (
.in(din[36:0]),
.out(dout[36:0])
);








endmodule





//
//   increment macro 
//
//





module l2t_arbadr_dp_increment_macro__dincr_8x__width_12 (
  din, 
  cin, 
  dout, 
  cout);
  input [11:0] din;
  input cin;
  output [11:0] dout;
  output cout;






incr #(12)  m0_0 (
.cin(cin),
.in(din[11:0]),
.out(dout[11:0]),
.cout(cout)
);











endmodule





//
//   invert macro
//
//





module l2t_arbadr_dp_inv_macro__dinv_32x__stack_9r__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






inv #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module l2t_arbadr_dp_and_macro__width_9 (
  din0, 
  din1, 
  dout);
  input [8:0] din0;
  input [8:0] din1;
  output [8:0] dout;






and2 #(9)  d0_0 (
.in0(din0[8:0]),
.in1(din1[8:0]),
.out(dout[8:0])
);









endmodule









// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__dmsff_32x__stack_20r__width_18 (
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
wire [16:0] so;

  input [17:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [17:0] dout;


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
dff #(18)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[17:0]),
.si({scan_in,so[16:0]}),
.so({so[16:0],scan_out}),
.q(dout[17:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__stack_13r__width_13 (
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
wire [11:0] so;

  input [12:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [12:0] dout;


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
dff #(13)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[12:0]),
.si({scan_in,so[11:0]}),
.so({so[11:0],scan_out}),
.q(dout[12:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_10r__width_9 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [8:0] din0;
  input sel0;
  input [8:0] din1;
  input sel1;
  output [8:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(9)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[8:0]),
  .in1(din1[8:0]),
.dout(dout[8:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_10r__width_9 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [8:0] din0;
  input [8:0] din1;
  input sel0;
  output [8:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(9)  d0_0 (
  .sel(psel1),
  .in0(din0[8:0]),
  .in1(din1[8:0]),
.dout(dout[8:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_8x__mux_pgnpe__ports_3__stack_10r__width_9 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  muxtst, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;

  input [8:0] din0;
  input sel0;
  input [8:0] din1;
  input sel1;
  input [8:0] din2;
  input sel2;
  input muxtst;
  output [8:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3 #(9)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[8:0]),
  .in1(din1[8:0]),
  .in2(din2[8:0]),
.dout(dout[8:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__stack_36r__width_36 (
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









//
//   invert macro
//
//





module l2t_arbadr_dp_inv_macro__dinv_32x__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






inv #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module l2t_arbadr_dp_nor_macro__dnor_16x__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule





//
//   nor macro for ports = 2,3
//
//





module l2t_arbadr_dp_nor_macro__dnor_16x__ports_3__width_2 (
  din0, 
  din1, 
  din2, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  input [1:0] din2;
  output [1:0] dout;






nor3 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.in2(din2[1:0]),
.out(dout[1:0])
);







endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_32x__mux_pgnpe__ports_4__stack_10r__width_9 (
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

  input [8:0] din0;
  input sel0;
  input [8:0] din1;
  input sel1;
  input [8:0] din2;
  input sel2;
  input [8:0] din3;
  input sel3;
  input muxtst;
  output [8:0] dout;





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
mux4 #(9)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[8:0]),
  .in1(din1[8:0]),
  .in2(din2[8:0]),
  .in3(din3[8:0]),
.dout(dout[8:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__stack_5r__width_5 (
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
wire [3:0] so;

  input [4:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [4:0] dout;


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
dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);




















endmodule









//
//   invert macro
//
//





module l2t_arbadr_dp_inv_macro__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module l2t_arbadr_dp_and_macro__ports_4__width_1 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  input [0:0] din3;
  output [0:0] dout;






and4 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.in3(din3[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module l2t_arbadr_dp_or_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






or3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module l2t_arbadr_dp_or_macro__ports_2__width_1 (
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





module l2t_arbadr_dp_inv_macro__dinv_16x__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






inv #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__width_3 (
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






// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__dmsff_32x__stack_10r__width_9 (
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
wire [7:0] so;

  input [8:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [8:0] dout;


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
dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__dmsff_32x__stack_4r__width_3 (
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
wire [1:0] so;

  input [2:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [2:0] dout;


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
dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__dmsff_32x__stack_12r__width_12 (
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
wire [10:0] so;

  input [11:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [11:0] dout;


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
dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);




















endmodule









//
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__dbuff_16x__stack_28r__width_28 (
  din, 
  dout);
  input [27:0] din;
  output [27:0] dout;






buff #(28)  d0_0 (
.in(din[27:0]),
.out(dout[27:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_28r__width_28 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [27:0] din0;
  input sel0;
  input [27:0] din1;
  input sel1;
  output [27:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(28)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[27:0]),
  .in1(din1[27:0]),
.dout(dout[27:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_3__stack_22r__width_22 (
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

  input [21:0] din0;
  input sel0;
  input [21:0] din1;
  input sel1;
  input [21:0] din2;
  input sel2;
  output [21:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(22)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[21:0]),
  .in1(din1[21:0]),
  .in2(din2[21:0]),
.dout(dout[21:0])
);









  



endmodule


//
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__dbuff_8x__stack_28r__width_28 (
  din, 
  dout);
  input [27:0] din;
  output [27:0] dout;






buff #(28)  d0_0 (
.in(din[27:0]),
.out(dout[27:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_22r__width_22 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [21:0] din0;
  input sel0;
  input [21:0] din1;
  input sel1;
  output [21:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(22)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[21:0]),
  .in1(din1[21:0]),
.dout(dout[21:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_32x__mux_pgpe__ports_4__stack_22r__width_22 (
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

  input [21:0] din0;
  input [21:0] din1;
  input [21:0] din2;
  input [21:0] din3;
  input sel0;
  input sel1;
  input sel2;
  input muxtst;
  input test;
  output [21:0] dout;





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

mux4 #(22)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[21:0]),
  .in1(din1[21:0]),
  .in2(din2[21:0]),
  .in3(din3[21:0]),
.dout(dout[21:0]),
  .muxtst(muxtst)
);









  



endmodule


//
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__dbuff_32x__width_40 (
  din, 
  dout);
  input [39:0] din;
  output [39:0] dout;






buff #(40)  d0_0 (
.in(din[39:0]),
.out(dout[39:0])
);








endmodule









// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__dmsff_32x__stack_40r__width_40 (
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













// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__dmsff_32x__minbuff_1__stack_40r__width_40 (
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
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__dbuff_32x__stack_23r__width_15 (
  din, 
  dout);
  input [14:0] din;
  output [14:0] dout;






buff #(15)  d0_0 (
.in(din[14:0]),
.out(dout[14:0])
);








endmodule









// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__stack_40r__width_40 (
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
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__dbuff_32x__stack_15r__width_15 (
  din, 
  dout);
  input [14:0] din;
  output [14:0] dout;






buff #(15)  d0_0 (
.in(din[14:0]),
.out(dout[14:0])
);








endmodule









// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__minbuff_1__stack_40r__width_40 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_33r__width_33 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [32:0] din0;
  input sel0;
  input [32:0] din1;
  input sel1;
  output [32:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(33)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[32:0]),
  .in1(din1[32:0]),
.dout(dout[32:0])
);









  



endmodule


//
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__dbuff_32x__stack_32r__width_32 (
  din, 
  dout);
  input [31:0] din;
  output [31:0] dout;






buff #(32)  d0_0 (
.in(din[31:0]),
.out(dout[31:0])
);








endmodule





//
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__dbuff_32x__stack_18r__width_18 (
  din, 
  dout);
  input [17:0] din;
  output [17:0] dout;






buff #(18)  d0_0 (
.in(din[17:0]),
.out(dout[17:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_1r__width_1 (
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


//
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__dbuff_32x__stack_6r__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_36r__width_36 (
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






// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_msff_macro__stack_34r__width_34 (
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
wire [32:0] so;

  input [33:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [33:0] dout;


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
dff #(34)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[33:0]),
.si({scan_in,so[32:0]}),
.so({so[32:0],scan_out}),
.q(dout[33:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_3__stack_32r__width_31 (
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

  input [30:0] din0;
  input sel0;
  input [30:0] din1;
  input sel1;
  input [30:0] din2;
  input sel2;
  output [30:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(31)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[30:0]),
  .in1(din1[30:0]),
  .in2(din2[30:0]),
.dout(dout[30:0])
);









  



endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_arbadr_dp_cmp_macro__dcmp_8x__width_32 (
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





module l2t_arbadr_dp_cmp_macro__dcmp_8x__width_12 (
  din0, 
  din1, 
  dout);
  input [11:0] din0;
  input [11:0] din1;
  output dout;






cmp #(12)  m0_0 (
.in0(din0[11:0]),
.in1(din1[11:0]),
.out(dout)
);










endmodule





//
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__dbuff_48x__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule





//
//   invert macro
//
//





module l2t_arbadr_dp_inv_macro__dinv_32x__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






inv #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbadr_dp_mux_macro__dmux_8x__mux_aonpe__ports_3__stack_24r__width_24 (
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

  input [23:0] din0;
  input sel0;
  input [23:0] din1;
  input sel1;
  input [23:0] din2;
  input sel2;
  output [23:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(24)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[23:0]),
  .in1(din1[23:0]),
  .in2(din2[23:0]),
.dout(dout[23:0])
);









  



endmodule


//
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__dbuff_16x__stack_33r__width_33 (
  din, 
  dout);
  input [32:0] din;
  output [32:0] dout;






buff #(33)  d0_0 (
.in(din[32:0]),
.out(dout[32:0])
);








endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_arbadr_dp_cmp_macro__dcmp_8x__dcmp_8x__width_32 (
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
//   xnor macro for ports = 2,3
//
//





module l2t_arbadr_dp_xnor_macro__dxnor_8x__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






xnor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule





//
//   buff macro
//
//





module l2t_arbadr_dp_buff_macro__dbuff_32x__stack_1r__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule




