// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_arb_ctl.v
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


 
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
// Description: 
//	This module contains the following 
//	// Mux sel logic for arbitration. 
//	// select logic for advancing IQ/SNP/MB/FB pointers. 
//	// mux selects for the dir CAM address muxes in arbadr. 
//	// Mux selects for the error addresses 
//	// Instruction valid C1 and C2  
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 
//////////////////////////////////////////////////////////////////////// 
// Local header file includes / local define 
//////////////////////////////////////////////////////////////////////// 
 
module l2t_arb_ctl (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  arbadr_ncu_l2t_pm_n_dist, 
  arbadr_2bnk_true_enbld_dist, 
  arbadr_4bnk_true_enbld_dist, 
  arbadr_arbdp_addr87_c2, 
  ncu_spc0_core_enable_status, 
  ncu_spc1_core_enable_status, 
  ncu_spc2_core_enable_status, 
  ncu_spc3_core_enable_status, 
  ncu_spc4_core_enable_status, 
  ncu_spc5_core_enable_status, 
  ncu_spc6_core_enable_status, 
  ncu_spc7_core_enable_status, 
  oqu_arb_full_px2, 
  misbuf_arb_vld_px1, 
  misbuf_arb_cnt28_px2_prev, 
  misbuf_arb_snp_cnt8_px1, 
  wbuf_arb_full_px1, 
  misbuf_arb_hit_c3, 
  arb_misbuf_inval_inst_c2, 
  filbuf_arb_vld_px1, 
  iqu_iq_arb_vld_px2, 
  iqu_iq_arb_vld_px2_v1, 
  ique_iq_arb_vbit_px2, 
  ique_iq_arb_atm_px2, 
  ique_iq_arb_csr_px2, 
  ique_iq_arb_st_px2, 
  ique_arb_pf_ice_px2, 
  snp_snpq_arb_vld_px1, 
  arb_l2drpt_waysel_gate_c1, 
  tag_deccck_data_sel_c8, 
  tag_rdma_vld_px1, 
  tag_data_ecc_active_c3, 
  tag_decc_tag_acc_en_px2, 
  misbuf_nondep_fbhit_c3, 
  misbuf_hit_st_dep_zero, 
  tag_hit_unqual_c3, 
  mbist_arb_l2d_en, 
  bist_vuad_rd_en_px1, 
  mbist_run, 
  arbdec_arbdp_inst_fb_c2, 
  arbadr_arbdp_ioaddr_c1_39to37, 
  arbadr_arbdp_ioaddr_c1_35to33, 
  arbdec_size_field_c8, 
  arbdat_word_lower_cmp_c8, 
  arbdat_word_upper_cmp_c8, 
  arbadr_addr2_c8, 
  arbdec_arbdp_inst_size_c7, 
  arbadr_arbdp_diag_wr_way_c2, 
  arbdec_arbdp_inst_way_c1, 
  arbdec_arbdp_tecc_c1, 
  filbuf_arbdp_way_px2, 
  filbuf_tag_hit_frm_mb_c2, 
  arbdec_arbdp_inst_mb_c2, 
  arbdec_arbdp_inst_fb_c1, 
  arbdec_arbdp_inst_dep_c2, 
  tag_hit_l2orfb_c3, 
  tagdp_arb_par_err_c3, 
  tagdp_invalid_evict_c3, 
  arbdec_arbdp_inst_nc_c3, 
  arbdec_arbdp_cpuid_c2, 
  arbdec_arbdp_l1way_c3, 
  arbadr_arbdp_addr11to4_c3, 
  arbadr_arbdp_new_addr5to4_px2, 
  arbadr_arbdp_addr5to4_c1, 
  arbadr_arbdp_addr5to4_c3, 
  arbdec_arbdp_inst_mb_c3, 
  arbdec_arbdp_inst_tecc_c3, 
  arbdec_arbdp_inst_bufidhi_c1, 
  arbdec_arbdp_inst_bufid1_c1, 
  arbdec_arbdp_inst_mb_c1, 
  arbdec_arbdp_evict_c1, 
  arbdec_arbdp_inst_rqtyp_c1, 
  arbdec_arbdp_inst_rsvd_c1, 
  arbdec_arbdp_inst_nc_c1, 
  arbdec_arbdp_inst_ctrue_c1, 
  arbdec_arbdp_inst_size_c1, 
  arbadr_arbdp_addr_start_c2, 
  arbdec_arbdp_rdma_inst_c2, 
  arbdec_arbdp_inst_bufidlo_c2, 
  arbdec_arbdp_inst_rqtyp_c2, 
  arbdec_arbdp_inst_rqtyp_c6, 
  arbadr_arbaddr_addr22_c2, 
  bist_acc_vd_px1, 
  l2t_mb2_mbtag_lookup_en, 
  l2t_mb2_fbtag_lookup_en, 
  l2t_mb2_wbtag_lookup_en, 
  l2t_mb2_rdmatag_lookup_en, 
  l2t_mb2_run, 
  mbist_lookupen, 
  mbist_arb_l2t_write, 
  arb_decdp_mmuld_inst_c6, 
  arb_acc_vd_c2, 
  arb_acc_ua_c2, 
  csr_l2_bypass_mode_on, 
  l2clk, 
  io_cmp_sync_en, 
  wmr_l, 
  scan_in, 
  usaloc_ua_ce_c2, 
  vlddir_vd_ce_c2, 
  misbuf_vuad_ce_instr_c2, 
  arb_cpuid_c5, 
  scan_out, 
  arb_bs_or_bis_inst_c2, 
  arb_mux1_mbsel_px2, 
  arb_arbdat_mux2_snpsel_px2, 
  arb_arbadr_mux2_snpsel_px2, 
  arb_arbdec_mux2_snpsel_px2, 
  arb_arbdat_mux3_bufsel_px2, 
  arb_arbdec_mux3_bufsel_px2, 
  arb_mux3_bufsel_px1, 
  arb_arbadr_mux4_c1sel_px2, 
  arb_arbdat_mux4_c1sel_px2, 
  arb_arbdec_mux4_c1sel_px2, 
  arb_data_ecc_idx_en, 
  arb_data_ecc_idx_reset, 
  arb_sel_tecc_addr_px2, 
  arb_sel_deccck_addr_px2, 
  arb_sel_diag_addr_px2, 
  arb_sel_diag_tag_addr_px2, 
  arb_inc_tag_ecc_cnt_c3_n, 
  arb_sel_lkup_stalled_tag_px2, 
  arb_bist_or_diag_acc_c1, 
  arb_sel_deccck_or_bist_idx, 
  arb_sel_vuad_bist_px2, 
  arb_misbuf_inst_vld_c2, 
  arb_inst_vld_c2, 
  arb_tag_inst_vld_c2, 
  arb_wbuf_inst_vld_c2, 
  arb_imiss_hit_c10, 
  arb_imiss_hit_c4, 
  arb_evict_c3, 
  arb_evict_c4, 
  arb_sel_c2_stall_idx_c1, 
  arb_vuad_acc_px2, 
  arb_upper_four_byte_access_c1, 
  arb_lower_four_byte_access_c1, 
  arb_tag_wr_px2, 
  arb_vuad_idx2_sel_px2_n, 
  arb_mb_camen_px2, 
  arb_filbuf_fbsel_c1, 
  arb_misbuf_mbsel_c1, 
  arb_iqsel_px2, 
  arb_iqsel_px2_v1, 
  arb_evict_vld_c2, 
  arb_ic_evict_c4, 
  arb_dc_evict_c4, 
  arb_inst_diag_c1, 
  arb_inst_vld_c1, 
  arb_inval_inst_vld_c3, 
  arb_l2d_fbrd_c3, 
  arb_misbuf_ctrue_c9, 
  arb_misbuf_cas1_hit_c8, 
  arb_decc_data_sel_c9, 
  arb_tecc_way_c2, 
  arb_l2tag_vld_c4, 
  arb_dword_mask_c8, 
  arb_fill_vld_c2, 
  arb_imiss_vld_c2, 
  arb_pf_ice_inst_c2, 
  arb_pf_ice_inst_c7, 
  arb_normal_tagacc_c2, 
  arb_tagd_tecc_c2, 
  arb_dir_vld_c3_l, 
  arb_dc_rd_en_c3, 
  arb_ic_rd_en_c3, 
  arb_dc_wr_en_c3, 
  arb_ic_wr_en_c3, 
  arb_dir_panel_dcd_c3, 
  arb_dir_panel_icd_c3, 
  arb_lkup_bank_ena_dcd_c3, 
  arb_lkup_bank_ena_icd_c3, 
  arb_inval_mask_dcd_c3, 
  arb_inval_mask_icd_c3, 
  arb_wr_dc_dir_entry_c3, 
  arb_wr_ic_dir_entry_c3, 
  arb_dc_ic_rd_bit_4, 
  arb_dir_addr_c9, 
  arb_dir_wr_en_c4, 
  arb_csr_wr_en_c7, 
  arb_csr_rd_en_c7, 
  arb_evict_c5, 
  arb_waysel_gate_c2, 
  arb_data_diag_st_c2, 
  arb_inval_inst_c2, 
  arb_decdp_ld64_inst_c1, 
  arb_waysel_inst_vld_c2, 
  arb_inst_vld_c2_prev, 
  arb_rdwr_inst_vld_c2, 
  arb_ic_inval_vld_c7, 
  arb_dc_inval_vld_c7, 
  arb_inst_l2data_vld_c6, 
  arb_csr_wr_en_c3, 
  arb_csr_rd_en_c3, 
  arb_diag_complete_c3, 
  arb_tag_pst_with_ctrue_c1, 
  arb_csr_st_c2, 
  arb_misbuf_hit_off_c1, 
  arb_pst_ctrue_en_c8, 
  arb_evict_tecc_vld_c2, 
  arb_filbuf_hit_off_c1, 
  arb_wbuf_hit_off_c1, 
  arb_inst_l2vuad_vld_c6, 
  arb_inst_l2tag_vld_c6, 
  arb_snp_snpsel_px2, 
  arb_decdp_tag_wr_c1, 
  arb_decdp_pst_inst_c2, 
  arb_decdp_fwd_req_c2, 
  arb_decdp_swap_inst_c2, 
  arb_decdp_imiss_inst_c2, 
  arb_decdp_inst_int_c2, 
  arb_decdp_inst_int_c1, 
  arb_decdp_ld64_inst_c2, 
  arb_decdp_bis_inst_c3, 
  arb_decdp_rmo_st_c3, 
  arb_decdp_strst_inst_c2, 
  arb_decdp_wr8_inst_c2, 
  arb_decdp_wr64_inst_c2, 
  arb_decdp_st_inst_c2, 
  arb_decdp_st_inst_c3, 
  arb_decdp_st_with_ctrue_c2, 
  arb_decdp_ld_inst_c2, 
  arb_arbdp_dword_st_c1, 
  arb_arbdp_pst_with_ctrue_c2, 
  arb_decdp_cas1_inst_c2, 
  arb_decdp_cas2_inst_c2, 
  arb_decdp_cas2_from_mb_c2, 
  decdp_cas2_from_mb_ctrue_c1, 
  arb_inst_l2vuad_vld_c3, 
  arb_decdp_pf_inst_c5, 
  arb_decdp_strld_inst_c6, 
  arb_decdp_atm_inst_c6, 
  arb_store_err_c8, 
  arb_arbdp_tecc_inst_mb_c8, 
  arb_tagd_perr_vld_c2, 
  arb_arbdp_tag_pst_no_ctrue_c2, 
  arb_arbdp_misbuf_pst_no_ctrue_c2, 
  arb_arbdp_vuadctl_pst_no_ctrue_c2, 
  arb_tecc_c2, 
  arb_vuadctl_no_bypass_px2, 
  arb_sel_way_px2, 
  arb_diag_or_tecc_write_px2, 
  arb_tag_rd_px2, 
  arb_tag_way_px2, 
  arb_mux1_mbsel_px1, 
  arb_wr8_inst_no_ctrue_c1, 
  arb_vuad_ce_err_c2, 
  usaloc_vlddir_arb_vuad_ce_err_c3, 
  tagctl_arb_vuad_ce_err_c3, 
  arb_oqu_swap_cas2_req_c2);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire spares_scanin;
wire spares_scanout;
wire l1clk;
wire dbginit_l;
wire dbb_rst_l;
wire reset_flop_scanin;
wire reset_flop_scanout;
wire ff_gate_off_prim_req_c1_scanin;
wire ff_gate_off_prim_req_c1_scanout;
wire reset_for_pf_ice_c8;
wire reset_for_pf_ice_c3;
wire decdp_pf_ice_inst_c3;
wire ff_reset_for_pf_ice_staging_scanin;
wire ff_reset_for_pf_ice_staging_scanout;
wire reset_for_pf_ice_c4;
wire reset_for_pf_ice_c5;
wire reset_for_pf_ice_c52;
wire reset_for_pf_ice_c6;
wire reset_for_pf_ice_c7;
wire ff_gate_off_prim_req_state_scanin;
wire ff_gate_off_prim_req_state_scanout;
wire l2_bypass_mode_on_d1;
wire ff_l2_bypass_mode_on_d1_scanin;
wire ff_l2_bypass_mode_on_d1_scanout;
wire ff_mbf_valid_px2_scanin;
wire ff_mbf_valid_px2_scanout;
wire ff_mbf_valid_px2_1_scanin;
wire ff_mbf_valid_px2_1_scanout;
wire ff_fbf_valid_px2_1_scanin;
wire ff_fbf_valid_px2_1_scanout;
wire ff_snp_valid_px2_scanin;
wire ff_snp_valid_px2_scanout;
wire ff_snp_valid_px2_1_scanin;
wire ff_snp_valid_px2_1_scanout;
wire ff_mux3_bufsel_px2_scanin;
wire ff_mux3_bufsel_px2_scanout;
wire arb_mux3_bufsel_px2_unbuff;
wire ff_atm_instr_c1_scanin;
wire ff_atm_instr_c1_scanout;
wire arb_stall_c2_clone_1;
wire arb_stall_unqual_c2_clone_1;
wire arb_inst_vld_c1_1_cloned;
wire ff_arb_stall_c1_cloned_scanin;
wire ff_arb_stall_c1_cloned_scanout;
wire ff_arb_inst_vld_c1_1_clone_scanin;
wire ff_arb_inst_vld_c1_1_clone_scanout;
wire tag_data_ecc_active_c3_inverted;
wire tcu_scan_en_inv;
wire data_ecc_active_c4_n;
wire arb_sel_deccck_addr_px2_n;
wire ff_data_ecc_active_c4_dup_scanin;
wire ff_data_ecc_active_c4_dup_scanout;
wire data_ecc_active_c4_noninv;
wire ff_inc_tag_ecc_cnt_c3_dup_scanin;
wire ff_inc_tag_ecc_cnt_c3_dup_scanout;
wire inc_tag_ecc_cnt_c3_1_n;
wire inc_tag_ecc_cnt_c3_1_v2;
wire ff_tecc_c2_scanin;
wire ff_tecc_c2_scanout;
wire tecc_c2;
wire ff_arb_tecc_c2_c3_scanin;
wire ff_arb_tecc_c2_c3_scanout;
wire ff_data_ecc_active_c4_scanin;
wire ff_data_ecc_active_c4_scanout;
wire ff_bist_vuad_rd_en_px1_scanin;
wire ff_bist_vuad_rd_en_px1_scanout;
wire mbist_run_r1;
wire ff_bist_enable_c1_scanin;
wire ff_bist_enable_c1_scanout;
wire ff_bist_enable_c2_scanin;
wire ff_bist_enable_c2_scanout;
wire ff_bist_acc_vd_px2_scanin;
wire ff_bist_acc_vd_px2_scanout;
wire ff_bist_acc_vd_c1_scanin;
wire ff_bist_acc_vd_c1_scanout;
wire ff_bist_acc_vd_c2_scanin;
wire ff_bist_acc_vd_c2_scanout;
wire ff_mbist_arb_l2d_en_d1_scanin;
wire ff_mbist_arb_l2d_en_d1_scanout;
wire mbist_arb_l2d_en_d1;
wire ff_arb_tag_acc_c1_scanin;
wire ff_arb_tag_acc_c1_scanout;
wire ff_sp_tag_access_c1_scanin;
wire ff_sp_tag_access_c1_scanout;
wire ff_normal_tagacc_c2_scanin;
wire ff_normal_tagacc_c2_scanout;
wire ff_l2t_mb2_run_r1_scanin;
wire ff_l2t_mb2_run_r1_scanout;
wire l2t_mb2_run_r1;
wire l2t_mb2_mbtag_lookup_en_r1;
wire l2t_mb2_mbtag_lookup_en_r2;
wire ff_mbfull_px2_scanin;
wire ff_mbfull_px2_scanout;
wire arb_iqsel_px2_phase1;
wire arb_iqsel_px2_v1_n;
wire ff_mbsel_c1_scanin;
wire ff_mbsel_c1_scanout;
wire ff_fbsel_c1_scanin;
wire ff_fbsel_c1_scanout;
wire ff_snpsel_c1_scanin;
wire ff_snpsel_c1_scanout;
wire ff_snpsel_c2_scanin;
wire ff_snpsel_c2_scanout;
wire ff_snpsel_c3_scanin;
wire ff_snpsel_c3_scanout;
wire ff_arb_evict_c3_scanin;
wire ff_arb_evict_c3_scanout;
wire arb_vuad_ce_err_c3;
wire ff_arb_evict_c4_scanin;
wire ff_arb_evict_c4_scanout;
wire ff_arb_evict_c5_scanin;
wire ff_arb_evict_c5_scanout;
wire ff_imiss_inst_c3_scanin;
wire ff_imiss_inst_c3_scanout;
wire ff_arb_imiss_hit_c4_scanin;
wire ff_arb_imiss_hit_c4_scanout;
wire ff_arb_imiss_hit_c5_scanin;
wire ff_arb_imiss_hit_c5_scanout;
wire ff_arb_imiss_hit_c52_scanin;
wire ff_arb_imiss_hit_c52_scanout;
wire arb_imiss_hit_c52;
wire ff_arb_imiss_hit_c6_scanin;
wire ff_arb_imiss_hit_c6_scanout;
wire ff_arb_imiss_hit_c7_scanin;
wire ff_arb_imiss_hit_c7_scanout;
wire ff_arb_imiss_hit_c8_scanin;
wire ff_arb_imiss_hit_c8_scanout;
wire ff_arb_imiss_hit_c9_scanin;
wire ff_arb_imiss_hit_c9_scanout;
wire ff_arb_imiss_hit_c10_scanin;
wire ff_arb_imiss_hit_c10_scanout;
wire ff_arb_inst_diag_c2_scanin;
wire ff_arb_inst_diag_c2_scanout;
wire arb_inst_diag_c2;
wire decdp_inst_int_or_inval_c2;
wire ff_arb_inst_csr_c1_scanin;
wire ff_arb_inst_csr_c1_scanout;
wire ff_arb_inst_l2data_c2_scanin;
wire ff_arb_inst_l2data_c2_scanout;
wire ff_inst_l2data_vld_c3_scanin;
wire ff_inst_l2data_vld_c3_scanout;
wire ff_inst_l2data_vld_c4_scanin;
wire ff_inst_l2data_vld_c4_scanout;
wire ff_inst_l2data_vld_c5_scanin;
wire ff_inst_l2data_vld_c5_scanout;
wire ff_inst_l2data_vld_c52_scanin;
wire ff_inst_l2data_vld_c52_scanout;
wire ff_inst_l2data_vld_c6_scanin;
wire ff_inst_l2data_vld_c6_scanout;
wire ff_arb_csr_wr_en_c3_scanin;
wire ff_arb_csr_wr_en_c3_scanout;
wire ff_arb_csr_wr_en_c3_1_scanin;
wire ff_arb_csr_wr_en_c3_1_scanout;
wire ff_arb_csr_wr_en_c4_scanin;
wire ff_arb_csr_wr_en_c4_scanout;
wire ff_arb_csr_wr_en_c5_scanin;
wire ff_arb_csr_wr_en_c5_scanout;
wire ff_arb_csr_wr_en_c52_scanin;
wire ff_arb_csr_wr_en_c52_scanout;
wire ff_arb_csr_wr_en_c6_scanin;
wire ff_arb_csr_wr_en_c6_scanout;
wire ff_arb_csr_wr_en_c7_scanin;
wire ff_arb_csr_wr_en_c7_scanout;
wire ff_arb_csr_wr_en_c8_scanin;
wire ff_arb_csr_wr_en_c8_scanout;
wire ff_arb_csr_rd_en_c3_scanin;
wire ff_arb_csr_rd_en_c3_scanout;
wire ff_arb_csr_rd_en_c4_scanin;
wire ff_arb_csr_rd_en_c4_scanout;
wire ff_arb_csr_rd_en_c5_scanin;
wire ff_arb_csr_rd_en_c5_scanout;
wire ff_arb_csr_rd_en_c52_scanin;
wire ff_arb_csr_rd_en_c52_scanout;
wire ff_arb_csr_rd_en_c6_scanin;
wire ff_arb_csr_rd_en_c6_scanout;
wire ff_arb_csr_rd_en_c7_scanin;
wire ff_arb_csr_rd_en_c7_scanout;
wire ff_arb_inst_l2tag_c2_scanin;
wire ff_arb_inst_l2tag_c2_scanout;
wire ff_arb_inst_l2tag_c2_1_scanin;
wire ff_arb_inst_l2tag_c2_1_scanout;
wire ff_inst_l2tag_vld_c3_scanin;
wire ff_inst_l2tag_vld_c3_scanout;
wire ff_inst_l2tag_vld_c4_scanin;
wire ff_inst_l2tag_vld_c4_scanout;
wire ff_inst_l2tag_vld_c5_scanin;
wire ff_inst_l2tag_vld_c5_scanout;
wire ff_inst_l2tag_vld_c52_scanin;
wire ff_inst_l2tag_vld_c52_scanout;
wire ff_inst_l2tag_vld_c6_scanin;
wire ff_inst_l2tag_vld_c6_scanout;
wire ff_arb_inst_l2vuad_c2_scanin;
wire ff_arb_inst_l2vuad_c2_scanout;
wire ff_inst_l2vuad_vld_c3_scanin;
wire ff_inst_l2vuad_vld_c3_scanout;
wire ff_inst_l2vuad_vld_c4_scanin;
wire ff_inst_l2vuad_vld_c4_scanout;
wire ff_inst_l2vuad_vld_c5_scanin;
wire ff_inst_l2vuad_vld_c5_scanout;
wire ff_inst_l2vuad_vld_c52_scanin;
wire ff_inst_l2vuad_vld_c52_scanout;
wire ff_inst_l2vuad_vld_c6_scanin;
wire ff_inst_l2vuad_vld_c6_scanout;
wire ff_deccck_data_sel_c9_scanin;
wire ff_deccck_data_sel_c9_scanout;
wire ff_lower_cas_c9_scanin;
wire ff_lower_cas_c9_scanout;
wire ff_upper_cas_c9_scanin;
wire ff_upper_cas_c9_scanout;
wire ff_word_lower_cmp_c9_scanin;
wire ff_word_lower_cmp_c9_scanout;
wire ff_word_upper_cmp_c9_scanin;
wire ff_word_upper_cmp_c9_scanout;
wire ff_tecc_inst_c2_scanin;
wire ff_tecc_inst_c2_scanout;
wire ff_inc_tag_ecc_cnt_c3_scanin;
wire ff_inc_tag_ecc_cnt_c3_scanout;
wire ff_tag_ecc_fsm_count_scanin;
wire ff_tag_ecc_fsm_count_scanout;
wire ff_scrub_fsm_count_eq_6_px2_scanin;
wire ff_scrub_fsm_count_eq_6_px2_scanout;
wire ff_scrub_fsm_count_eq_1_px2_scanin;
wire ff_scrub_fsm_count_eq_1_px2_scanout;
wire ff_tecc_tag_acc_en_px2_scanin;
wire ff_tecc_tag_acc_en_px2_scanout;
wire ff_arb_tagd_tecc_c2_scanin;
wire ff_arb_tagd_tecc_c2_scanout;
wire ff_diag_or_tecc_acc_c1_scanin;
wire ff_diag_or_tecc_acc_c1_scanout;
wire arbdec_arbdp_inst_fb_c1_qual;
wire ff_hit_l2orfb_c4_scanin;
wire ff_hit_l2orfb_c4_scanout;
wire ff_hit_l2orfb_c5_scanin;
wire ff_hit_l2orfb_c5_scanout;
wire ff_hit_l2orfb_c52_scanin;
wire ff_hit_l2orfb_c52_scanout;
wire ff_hit_l2orfb_c6_scanin;
wire ff_hit_l2orfb_c6_scanout;
wire ff_hit_l2orfb_c7_scanin;
wire ff_hit_l2orfb_c7_scanout;
wire ff_hit_l2orfb_c8_scanin;
wire ff_hit_l2orfb_c8_scanout;
wire vuad_ce_err_c7;
wire ff_dword_mask_c8_scanin;
wire ff_dword_mask_c8_scanout;
wire ff_fbrd_c3_scanin;
wire ff_fbrd_c3_scanout;
wire ff_st_cam_en_c3_scanin;
wire ff_st_cam_en_c3_scanout;
wire arb_decdp_cas2_from_mb_ctrue_c2;
wire ff_sp_cam_en_c3_scanin;
wire ff_sp_cam_en_c3_scanout;
wire ff_arb_decdp_cas1_inst_c3_scanin;
wire ff_arb_decdp_cas1_inst_c3_scanout;
wire arb_decdp_cas1_inst_c3;
wire arb_decdp_swap_inst_c3;
wire arbdec_arbdp_rdma_inst_c3;
wire arb_decdp_ld_inst_c3;
wire arb_decdp_wr8_inst_c3;
wire arb_decdp_ld64_inst_c3;
wire arb_decdp_cas2_inst_c3;
wire enable_dc_cam;
wire misbuf_vuad_ce_instr_c3;
wire disable_dc_cam;
wire ff_enc_cam_addr_c4_scanin;
wire ff_enc_cam_addr_c4_scanout;
wire ff_vuad_ce_scanin;
wire ff_vuad_ce_scanout;
wire vuad_ce_err_c2_unqual;
wire vuad_ce_err_c3;
wire vuad_ce_err_c2;
wire ff_vuad_ce_err_c3_scanin;
wire ff_vuad_ce_err_c3_scanout;
wire vuad_ce_err_c4;
wire vuad_ce_err_c5;
wire vuad_ce_err_c52;
wire vuad_ce_err_c6;
wire ff_arbctl_inst_nc_c2_scanin;
wire ff_arbctl_inst_nc_c2_scanout;
wire arb_inst_nc_c2;
wire ff_ic_hitqual_cam_en_c3_scanin;
wire ff_ic_hitqual_cam_en_c3_scanout;
wire ff_ld_inst_c3_scanin;
wire ff_ld_inst_c3_scanout;
wire decdp_rmo_st_or_strst_c3;
wire ff_dc_inval_c3_scanin;
wire ff_dc_inval_c3_scanout;
wire ff_ic_inval_c3_scanin;
wire ff_ic_inval_c3_scanout;
wire ff_dc_inval_vld_c4_scanin;
wire ff_dc_inval_vld_c4_scanout;
wire ff_dc_inval_vld_c5_scanin;
wire ff_dc_inval_vld_c5_scanout;
wire ff_dc_inval_vld_c52_scanin;
wire ff_dc_inval_vld_c52_scanout;
wire ff_dc_inval_vld_c6_scanin;
wire ff_dc_inval_vld_c6_scanout;
wire ff_dc_inval_vld_c7_scanin;
wire ff_dc_inval_vld_c7_scanout;
wire ff_ic_inval_vld_c4_scanin;
wire ff_ic_inval_vld_c4_scanout;
wire ff_ic_inval_vld_c5_scanin;
wire ff_ic_inval_vld_c5_scanout;
wire ff_ic_inval_vld_c52_scanin;
wire ff_ic_inval_vld_c52_scanout;
wire ff_ic_inval_vld_c6_scanin;
wire ff_ic_inval_vld_c6_scanout;
wire ff_ic_inval_vld_c7_scanin;
wire ff_ic_inval_vld_c7_scanout;
wire ff_ic_inval_vld_c8_scanin;
wire ff_ic_inval_vld_c8_scanout;
wire arb_ic_inval_vld_c8;
wire ff_ic_inval_vld_c9_scanin;
wire ff_ic_inval_vld_c9_scanout;
wire arb_ic_inval_vld_c9;
wire ff_arb_dir_wr_en_c4_scanin;
wire ff_arb_dir_wr_en_c4_scanout;
wire dir_store_inst_vld_c3;
wire ff_dir_addr_cnt_scanin;
wire ff_dir_addr_cnt_scanout;
wire ff_dir_addr_cnt_c4_scanin;
wire ff_dir_addr_cnt_c4_scanout;
wire ff_dir_addr_cnt_c5_scanin;
wire ff_dir_addr_cnt_c5_scanout;
wire ff_dir_addr_cnt_c52_scanin;
wire ff_dir_addr_cnt_c52_scanout;
wire ff_dir_addr_cnt_c6_scanin;
wire ff_dir_addr_cnt_c6_scanout;
wire ff_dir_addr_cnt_c7_scanin;
wire ff_dir_addr_cnt_c7_scanout;
wire ff_dir_addr_c8_scanin;
wire ff_dir_addr_c8_scanout;
wire ff_dir_addr_c9_scanin;
wire ff_dir_addr_c9_scanout;
wire ff_sync_en_scanin;
wire ff_sync_en_scanout;
wire io_cmp_sync_en_r1;
wire ff_ncu_signals_scanin;
wire ff_ncu_signals_scanout;
wire spc0_avl;
wire spc1_avl;
wire spc2_avl;
wire spc3_avl;
wire spc4_avl;
wire spc5_avl;
wire spc6_avl;
wire spc7_avl_unused;
wire ff_staged_part_bank_scanin;
wire ff_staged_part_bank_scanout;
wire arbadr_ncu_l2t_pm_n;
wire arbadr_2bnk_true_enbld;
wire arbadr_4bnk_true_enbld;
wire ff_arb_cpuid_c3_scanin;
wire ff_arb_cpuid_c3_scanout;
wire ff_arb_cpuid_c4_scanin;
wire ff_arb_cpuid_c4_scanout;
wire ff_arb_cpuid_c5_scanin;
wire ff_arb_cpuid_c5_scanout;
wire ff_arb_cpuid_c52_scanin;
wire ff_arb_cpuid_c52_scanout;
wire ff_arb_ic_dir_wrentry_c4_scanin;
wire ff_arb_ic_dir_wrentry_c4_scanout;
wire [4:0] arb_ic_dir_wrentry_c4;
wire ff_arb_ic_dir_wrentry_c5_scanin;
wire ff_arb_ic_dir_wrentry_c5_scanout;
wire [4:0] arb_ic_dir_wrentry_c5;
wire ff_arb_ic_dir_wrentry_c6_scanin;
wire ff_arb_ic_dir_wrentry_c6_scanout;
wire [4:0] arb_ic_dir_wrentry_c6;
wire ff_arb_ic_dir_wrentry_c7_scanin;
wire ff_arb_ic_dir_wrentry_c7_scanout;
wire [4:0] arb_ic_dir_wrentry_c7;
wire inval_foric_vld;
wire ff_dc_wr_panel_c4_scanin;
wire ff_dc_wr_panel_c4_scanout;
wire ff_dc_wr_panel_c5_scanin;
wire ff_dc_wr_panel_c5_scanout;
wire ff_dc_wr_panel_c52_scanin;
wire ff_dc_wr_panel_c52_scanout;
wire ff_arbdec_arbdp_inst_bufidlo_c3_scanin;
wire ff_arbdec_arbdp_inst_bufidlo_c3_scanout;
wire arbdec_arbdp_inst_bufidlo_c3;
wire ff_ic_wr_panel_c4_scanin;
wire ff_ic_wr_panel_c4_scanout;
wire ff_ic_wr_panel_c5_scanin;
wire ff_ic_wr_panel_c5_scanout;
wire ff_ic_wr_panel_c52_scanin;
wire ff_ic_wr_panel_c52_scanout;
wire ff_ic_wr_panel_c6_scanin;
wire ff_ic_wr_panel_c6_scanout;
wire [4:0] ic_wr_panel_c6;
wire ff_ic_wr_panel_c7_scanin;
wire ff_ic_wr_panel_c7_scanout;
wire [4:0] ic_wr_panel_c7;
wire ff_ic_wr_panel_c8_scanin;
wire ff_ic_wr_panel_c8_scanout;
wire [4:0] ic_wr_panel_c8;
wire ff_ic_wr_panel_c9_scanin;
wire ff_ic_wr_panel_c9_scanout;
wire [4:0] ic_wr_panel_c9;
wire mux_sel_ic_inval_678_n;
wire [4:0] tmp_ic_wr_panel_c3_1;
wire mux_sel_ic_inval_6789;
wire fnl_sel_inval;
wire fnl_sel_default;
wire ff_wr64_inst_c3_scanin;
wire ff_wr64_inst_c3_scanout;
wire decdp_pf_ice_inst_c1;
wire ff_waysel_gate_c2_scanin;
wire ff_waysel_gate_c2_scanout;
wire ff_parerr_gate_c1_scanin;
wire ff_parerr_gate_c1_scanout;
wire ff_arb_stall_c1_scanin;
wire ff_arb_stall_c1_scanout;
wire ff_arb_inst_vld_c1_scanin;
wire ff_arb_inst_vld_c1_scanout;
wire arb_inst_vld_c1_fnl;
wire mbist_any_tag_lookup;
wire ff_mbist_lookup_r1_scanin;
wire ff_mbist_lookup_r1_scanout;
wire mbist_any_tag_lookup_reg;
wire mbist_any_tag_lookup_reg1;
wire l2t_mb2_fbtag_lookup_en_r1;
wire l2t_mb2_wbtag_lookup_en_r1;
wire l2t_mb2_rdmatag_lookup_en_r1;
wire mbist_any_tag_lookup_reg2;
wire ff_arb_inst_vld_c1_1_scanin;
wire ff_arb_inst_vld_c1_1_scanout;
wire ff_arb_inst_vld_c2_scanin;
wire ff_arb_inst_vld_c2_scanout;
wire ff_arb_inst_vld_c2_1_scanin;
wire ff_arb_inst_vld_c2_1_scanout;
wire ff_arb_inst_vld_c2_2_scanin;
wire ff_arb_inst_vld_c2_2_scanout;
wire ff_arb_inst_vld_c2_3_scanin;
wire ff_arb_inst_vld_c2_3_scanout;
wire ff_arb_inst_vld_c2_4_scanin;
wire ff_arb_inst_vld_c2_4_scanout;
wire ff_arb_inst_vld_c2_5_scanin;
wire ff_arb_inst_vld_c2_5_scanout;
wire ff_arb_inst_vld_c2_6_scanin;
wire ff_arb_inst_vld_c2_6_scanout;
wire ff_arb_inst_vld_c2_7_scanin;
wire ff_arb_inst_vld_c2_7_scanout;
wire ff_arb_inst_vld_c2_8_scanin;
wire ff_arb_inst_vld_c2_8_scanout;
wire ff_arb_inst_vld_c2_10_scanin;
wire ff_arb_inst_vld_c2_10_scanout;
wire ff_arb_inst_vld_c3_scanin;
wire ff_arb_inst_vld_c3_scanout;
wire ff_arb_inst_vld_c3_1_scanin;
wire ff_arb_inst_vld_c3_1_scanout;
wire ff_arb_inst_vld_c3_2_scanin;
wire ff_arb_inst_vld_c3_2_scanout;
wire ff_dec_evict_c2_scanin;
wire ff_dec_evict_c2_scanout;
wire ff_dec_evict_tecc_c2_scanin;
wire ff_dec_evict_tecc_c2_scanout;
wire ff_decdp_st_inst_c2_scanin;
wire ff_decdp_st_inst_c2_scanout;
wire ff_decdp_st_inst_c2_1_scanin;
wire ff_decdp_st_inst_c2_1_scanout;
wire ff_decdp_st_inst_c3_scanin;
wire ff_decdp_st_inst_c3_scanout;
wire ff_decdp_st_inst_c3_1_scanin;
wire ff_decdp_st_inst_c3_1_scanout;
wire ff_decdp_st_inst_c3_2_scanin;
wire ff_decdp_st_inst_c3_2_scanout;
wire ff_arbdp_inst_bufid1_c2_scanin;
wire ff_arbdp_inst_bufid1_c2_scanout;
wire decdp_bs_inst_c2;
wire ff_decdp_bis_inst_c2_scanin;
wire ff_decdp_bis_inst_c2_scanout;
wire decdp_strst_maid1_c2;
wire decdp_rmo_st_or_strst_maid1_c2;
wire ff_decdp_rmo_st_c3_scanin;
wire ff_decdp_rmo_st_c3_scanout;
wire decdp_rmo_st_or_strst_c2;
wire ff_decdp_rmo_or_strst_c3_scanin;
wire ff_decdp_rmo_or_strst_c3_scanout;
wire ff_decdp_strst_inst_c2_scanin;
wire ff_decdp_strst_inst_c2_scanout;
wire ff_decdp_strst_inst_c2_1_scanin;
wire ff_decdp_strst_inst_c2_1_scanout;
wire ff_decdp_wr8_inst_c2_scanin;
wire ff_decdp_wr8_inst_c2_scanout;
wire ff_decdp_wr64_inst_c2_scanin;
wire ff_decdp_wr64_inst_c2_scanout;
wire ff_decdp_wr64_inst_c2_1_scanin;
wire ff_decdp_wr64_inst_c2_1_scanout;
wire ff_arb_decdp_ld64_inst_c1_scanin;
wire ff_arb_decdp_ld64_inst_c1_scanout;
wire ff_decdp_inst_int_c2_scanin;
wire ff_decdp_inst_int_c2_scanout;
wire four_or_eight_byte_access_c1;
wire eight_byte_access_c1;
wire ff_decdp_pst_inst_c2_scanin;
wire ff_decdp_pst_inst_c2_scanout;
wire ff_decdp_pst_inst_c3_scanin;
wire ff_decdp_pst_inst_c3_scanout;
wire ff_decdp_pst_inst_c4_scanin;
wire ff_decdp_pst_inst_c4_scanout;
wire ff_decdp_pst_inst_c5_scanin;
wire ff_decdp_pst_inst_c5_scanout;
wire ff_decdp_pst_inst_c52_scanin;
wire ff_decdp_pst_inst_c52_scanout;
wire ff_decdp_pst_inst_c6_scanin;
wire ff_decdp_pst_inst_c6_scanout;
wire ff_decdp_pst_inst_c7_scanin;
wire ff_decdp_pst_inst_c7_scanout;
wire ff_st_no_ctrue_c1_scanin;
wire ff_st_no_ctrue_c1_scanout;
wire ff_arbdp_pst_no_ctrue_c2_1_scanin;
wire ff_arbdp_pst_no_ctrue_c2_1_scanout;
wire ff_arbdp_pst_with_ctrue_c2_scanin;
wire ff_arbdp_pst_with_ctrue_c2_scanout;
wire ff_arbdp_tag_pst_no_ctrue_c2_scanin;
wire ff_arbdp_tag_pst_no_ctrue_c2_scanout;
wire ff_arbdp_misbuf_pst_no_ctrue_c2_scanin;
wire ff_arbdp_misbuf_pst_no_ctrue_c2_scanout;
wire ff_arbdp_vuadctl_pst_no_ctrue_c2_scanin;
wire ff_arbdp_vuadctl_pst_no_ctrue_c2_scanout;
wire ff_decdp_cas1_inst_c2_scanin;
wire ff_decdp_cas1_inst_c2_scanout;
wire ff_decdp_cas1_inst_c2_1_scanin;
wire ff_decdp_cas1_inst_c2_1_scanout;
wire ff_decdp_cas2_inst_c2_scanin;
wire ff_decdp_cas2_inst_c2_scanout;
wire ff_decdp_cas2_from_mb_c2_scanin;
wire ff_decdp_cas2_from_mb_c2_scanout;
wire ff_decdp_cas2_from_mb_ctrue_c2_scanin;
wire ff_decdp_cas2_from_mb_ctrue_c2_scanout;
wire ff_store_err_c3_scanin;
wire ff_store_err_c3_scanout;
wire ff_store_err_c4_scanin;
wire ff_store_err_c4_scanout;
wire ff_store_err_c5_scanin;
wire ff_store_err_c5_scanout;
wire ff_store_err_c52_scanin;
wire ff_store_err_c52_scanout;
wire ff_store_err_c6_scanin;
wire ff_store_err_c6_scanout;
wire ff_store_err_c7_scanin;
wire ff_store_err_c7_scanout;
wire ff_store_err_c8_scanin;
wire ff_store_err_c8_scanout;
wire ff_decdp_fwd_req_c2_scanin;
wire ff_decdp_fwd_req_c2_scanout;
wire ff_decdp_swap_inst_c2_scanin;
wire ff_decdp_swap_inst_c2_scanout;
wire ff_decdp_imiss_inst_c2_scanin;
wire ff_decdp_imiss_inst_c2_scanout;
wire ff_decdp_camld_inst_c2_scanin;
wire ff_decdp_camld_inst_c2_scanout;
wire ff_decdp_ld_inst_c2_scanin;
wire ff_decdp_ld_inst_c2_scanout;
wire ff_decdp_pf_inst_c2_scanin;
wire ff_decdp_pf_inst_c2_scanout;
wire ff_decdp_pf_inst_c3_scanin;
wire ff_decdp_pf_inst_c3_scanout;
wire ff_decdp_pf_inst_c4_scanin;
wire ff_decdp_pf_inst_c4_scanout;
wire ff_decdp_pf_inst_c5_scanin;
wire ff_decdp_pf_inst_c5_scanout;
wire ff_decdp_pf_ice_inst_c2_scanin;
wire ff_decdp_pf_ice_inst_c2_scanout;
wire ff_decdp_pf_ice_inst_c3_scanin;
wire ff_decdp_pf_ice_inst_c3_scanout;
wire ff_decdp_pf_ice_inst_c4_scanin;
wire ff_decdp_pf_ice_inst_c4_scanout;
wire decdp_pf_ice_inst_c4;
wire ff_decdp_pf_ice_inst_c5_scanin;
wire ff_decdp_pf_ice_inst_c5_scanout;
wire decdp_pf_ice_inst_c5;
wire ff_decdp_pf_ice_inst_c52_scanin;
wire ff_decdp_pf_ice_inst_c52_scanout;
wire decdp_pf_ice_inst_c52;
wire ff_decdp_pf_ice_inst_c6_scanin;
wire ff_decdp_pf_ice_inst_c6_scanout;
wire decdp_pf_ice_inst_c6;
wire ff_decdp_pf_ice_inst_c7_scanin;
wire ff_decdp_pf_ice_inst_c7_scanout;
wire ff_decdp_dc_inval_c2_scanin;
wire ff_decdp_dc_inval_c2_scanout;
wire ff_decdp_ic_inval_c2_scanin;
wire ff_decdp_ic_inval_c2_scanout;
wire ff_pst_no_ctrue_c3_scanin;
wire ff_pst_no_ctrue_c3_scanout;
wire ff_pst_no_ctrue_c4_scanin;
wire ff_pst_no_ctrue_c4_scanout;
wire ff_pst_no_ctrue_c5_scanin;
wire ff_pst_no_ctrue_c5_scanout;
wire ff_pst_no_ctrue_c52_scanin;
wire ff_pst_no_ctrue_c52_scanout;
wire ff_pst_no_ctrue_c6_scanin;
wire ff_pst_no_ctrue_c6_scanout;
wire ff_pst_no_ctrue_c7_scanin;
wire ff_pst_no_ctrue_c7_scanout;
wire ff_pst_no_ctrue_c8_scanin;
wire ff_pst_no_ctrue_c8_scanout;
wire ff_decdp_cas1_inst_c3_scanin;
wire ff_decdp_cas1_inst_c3_scanout;
wire ff_decdp_cas1_inst_c4_scanin;
wire ff_decdp_cas1_inst_c4_scanout;
wire ff_decdp_cas1_inst_c5_scanin;
wire ff_decdp_cas1_inst_c5_scanout;
wire ff_decdp_cas1_inst_c52_scanin;
wire ff_decdp_cas1_inst_c52_scanout;
wire ff_decdp_cas1_inst_c6_scanin;
wire ff_decdp_cas1_inst_c6_scanout;
wire ff_decdp_cas1_inst_c7_scanin;
wire ff_decdp_cas1_inst_c7_scanout;
wire ff_decdp_cas1_inst_c8_scanin;
wire ff_decdp_cas1_inst_c8_scanout;
wire ff_arbdp_evict_c2_scanin;
wire ff_arbdp_evict_c2_scanout;
wire ff_arbdp_evict_c3_scanin;
wire ff_arbdp_evict_c3_scanout;
wire arb_ic_evict_c3;
wire arb_dc_evict_c3;
wire ff_arbdp_evict_c4_scanin;
wire ff_arbdp_evict_c4_scanout;
wire ff_arbdp_tecc_inst_mb_c4_scanin;
wire ff_arbdp_tecc_inst_mb_c4_scanout;
wire ff_arbdp_tecc_inst_mb_c5_scanin;
wire ff_arbdp_tecc_inst_mb_c5_scanout;
wire ff_arbdp_tecc_inst_mb_c52_scanin;
wire ff_arbdp_tecc_inst_mb_c52_scanout;
wire ff_arbdp_tecc_inst_mb_c6_scanin;
wire ff_arbdp_tecc_inst_mb_c6_scanout;
wire ff_arbdp_tecc_inst_mb_c7_scanin;
wire ff_arbdp_tecc_inst_mb_c7_scanout;
wire ff_arbdp_tecc_inst_mb_c8_scanin;
wire ff_arbdp_tecc_inst_mb_c8_scanout;
 

 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;


 input  arbadr_ncu_l2t_pm_n_dist; //  BS 03/25/04 for partial bank/core modes support
 input  arbadr_2bnk_true_enbld_dist; //  BS 03/25/04 for partial bank/core modes support
 input  arbadr_4bnk_true_enbld_dist; //  BS 03/25/04 for partial bank/core modes support
 input [1:0]  arbadr_arbdp_addr87_c2; //  BS 03/25/04 for partial bank/core modes support 
 input  ncu_spc0_core_enable_status; // 0 : spc0 unavailable, 1 : available
 input  ncu_spc1_core_enable_status; // 0 : spc1 unavailable, 1 : available
 input  ncu_spc2_core_enable_status; // 0 : spc2 unavailable, 1 : available
 input  ncu_spc3_core_enable_status; // 0 : spc3 unavailable, 1 : available
 input  ncu_spc4_core_enable_status; // 0 : spc4 unavailable, 1 : available
 input  ncu_spc5_core_enable_status; // 0 : spc5 unavailable, 1 : available
 input  ncu_spc6_core_enable_status; // 0 : spc6 unavailable, 1 : available
 input  ncu_spc7_core_enable_status; // 0 : spc7 unavailable, 1 : available


 input	oqu_arb_full_px2; // oq is full. Comes from a flop in oqu. oq=6 or greater 
 
 input	misbuf_arb_vld_px1; // valid Miss Buffer instruction. 
 input	misbuf_arb_cnt28_px2_prev; // NEW_PIN 
 //input	misbuf_arb_cnt12_px2; // OLD_PIN 
 //input	misbuf_arb_cnt11_px1; // OLD_PIN 
 input	misbuf_arb_snp_cnt8_px1; // 8 or more snoop entries in the mbf. 
 
 input	wbuf_arb_full_px1; // wb is full. Comes from a flop in wbuf 
	 			// has to accomodate the instruction in PX2 and C1  
 
// start int 5.0 changes
 input  misbuf_arb_hit_c3 ; // POST_4.2 pin ( place on the right towards the bottom )
 output arb_misbuf_inval_inst_c2 ; // POST_4.2 pin ( place on the right towards the bottom )
// output decdp_ic_dc_inval_inst_c1 ; // POST_4.2 pin ( place on the right towards the bottom )
// end
 
 input	filbuf_arb_vld_px1; // valid fill in the Fill Buffer. 
 
 input	iqu_iq_arb_vld_px2; // valid iq instruction 
 input	iqu_iq_arb_vld_px2_v1; // valid iq instruction 
 input	ique_iq_arb_vbit_px2; // vbit in the payload. 
 input	ique_iq_arb_atm_px2; // Px2 packet is atomic with the following packet. 
 input	ique_iq_arb_csr_px2; // may be critical. 
 input	ique_iq_arb_st_px2; // predecode from ique. 
 input	ique_arb_pf_ice_px2;  // predecode from ique pf ice 
 input	snp_snpq_arb_vld_px1; // valid instruction at the head of the snoop q. 
 
  output	arb_l2drpt_waysel_gate_c1; 
 
 
 input	tag_deccck_data_sel_c8; // decc state machine store data state. 
 input	tag_rdma_vld_px1; 
 input 	tag_data_ecc_active_c3; // deccck state machine active. 
 input	tag_decc_tag_acc_en_px2; // decc FSM tag access state. 
 input	misbuf_nondep_fbhit_c3;  
 input  misbuf_hit_st_dep_zero;
 input  tag_hit_unqual_c3;
 
 
 
  
 input	mbist_arb_l2d_en; // from databist  POST_3.2 
 input	bist_vuad_rd_en_px1; 

 input	mbist_run;
  
 
 input	arbdec_arbdp_inst_fb_c2; // fill instruction 

// int 5.0 changes

 input  [39:37] arbadr_arbdp_ioaddr_c1_39to37 ; // bits 39-32 are used to determine if the
                                 // address space is DRAM or diagnostic.
 input  [35:33] arbadr_arbdp_ioaddr_c1_35to33 ; // bits 39-32 are used to determine if the
                                 // address space is DRAM or diagnostic.

  
 
 // CAS compare related inputs 
 input	[1:0]	arbdec_size_field_c8; // from arbdec for cas compare. 
 input		arbdat_word_lower_cmp_c8; // from arbdata for cas compare. 
 input		arbdat_word_upper_cmp_c8; // from arbdec for cas compare. 
 input		arbadr_addr2_c8; // from arbdec for cas compare. 
  
 // dwod mask generation inputs 
 input	[7:0]	arbdec_arbdp_inst_size_c7; // BS and SR 11/12/03 N2 Xbar Packet format change
 
 input	[3:0]   arbadr_arbdp_diag_wr_way_c2; // from the addr of a tag write instruction 
//  input	[2:0]	arbadr_arbdp_inst_byte_addr_c7; // from arbaddr. 
 
 input	[3:0]	arbdec_arbdp_inst_way_c1 ;  // from bits of a C1 instruction  
 input		arbdec_arbdp_tecc_c1 ; 
 
 input	[3:0]	filbuf_arbdp_way_px2; // new instruction way. 
 input          filbuf_tag_hit_frm_mb_c2;// instruction from MB hits in Fill Buffer , need to turn off 
                                         // VUAD CE detection and reporting
 
 
 
 input	arbdec_arbdp_inst_mb_c2; 
 input	arbdec_arbdp_inst_fb_c1; 
 input	arbdec_arbdp_inst_dep_c2; 
 
 input	tag_hit_l2orfb_c3 ; 
 input	tagdp_arb_par_err_c3; // used to gate off evicts in C3 
 input  tagdp_invalid_evict_c3 ; // from vuad dp. 
 input	arbdec_arbdp_inst_nc_c3 ; 
 input	[2:0]	arbdec_arbdp_cpuid_c2; // from arbdec ,BS 03/25/04 for partial bank/core modes support 

                // BS 03/11/04 extra cycle for mem access
 input	[1:0]	arbdec_arbdp_l1way_c3; 
 
 input       [7:0]   arbadr_arbdp_addr11to4_c3 ; // from arbaddr 
 
 
 input	[1:0]	arbadr_arbdp_new_addr5to4_px2; // from arbaddr not including stall mux results 
 input	[1:0]	arbadr_arbdp_addr5to4_c1; // from arbaddr not including stall mux results 
// int 5.0 change
 //input	        arbadr_arbdp_addr5_c2; // from arbaddr not including stall mux results 
 input	[1:0]	arbadr_arbdp_addr5to4_c3; // from arbaddr not including stall mux results 

input   arbdec_arbdp_inst_mb_c3;
input   arbdec_arbdp_inst_tecc_c3;
 
input   arbdec_arbdp_inst_bufidhi_c1 ; // NEW_PIN decode 
input	arbdec_arbdp_inst_bufid1_c1;  
input   arbdec_arbdp_inst_mb_c1 ; // NEW_PIN decode 
input   arbdec_arbdp_evict_c1; // NEW_PIN decode.  
input	[`L2_RQTYP_HI:`L2_RQTYP_LO] arbdec_arbdp_inst_rqtyp_c1 ; // NEW_PIN decode 
input	arbdec_arbdp_inst_rsvd_c1; // NEW_PIN decode 
input	arbdec_arbdp_inst_nc_c1 ; // NEW_PIN decode 
//input	[1:0]	arbadr_arbdp_word_addr_c1;  
input		arbdec_arbdp_inst_ctrue_c1; 
input	[`L2_SZ_HI:`L2_SZ_LO]	arbdec_arbdp_inst_size_c1; 
 
input	arbadr_arbdp_addr_start_c2; // NEW_PIN decode 
input   arbdec_arbdp_rdma_inst_c2; // NEW_PIN decode 
input   arbdec_arbdp_inst_bufidlo_c2 ; // NEW_PIN decode 
input	[`L2_RQTYP_HI:`L2_RQTYP_LO] arbdec_arbdp_inst_rqtyp_c2 ; // NEW_PIN decode 
input	[`L2_RQTYP_HI:`L2_RQTYP_LO] arbdec_arbdp_inst_rqtyp_c6 ; // NEW_PIN decode 
  
 
 input	arbadr_arbaddr_addr22_c2 ; // NEW_PIN 
 input	bist_acc_vd_px1 ; // NEW_PIN from l2t_mbist_ctl.sv 

// MBIST hookup's
input	 l2t_mb2_mbtag_lookup_en;
input    l2t_mb2_fbtag_lookup_en;
input    l2t_mb2_wbtag_lookup_en;
input    l2t_mb2_rdmatag_lookup_en;
input    l2t_mb2_run;
output		mbist_lookupen;


// int 5.0 changes
input   mbist_arb_l2t_write ; // POST_4.0

 output arb_decdp_mmuld_inst_c6; // BS and SR 11/12/03 N2 Xbar Packet format change 
 output	arb_acc_vd_c2 ; // NEW_PIN 
 output	arb_acc_ua_c2 ; // NEW_PIN 
 
 // csr inputs 
 input	csr_l2_bypass_mode_on; 
 
 // new pin POST_2.0 
 // new pin POST_2.0 
 
 input	l2clk; 
 input io_cmp_sync_en;
 input	wmr_l; 
 input scan_in;
 
// int 5.0 changes
input           usaloc_ua_ce_c2;	// VUAD ecc changes
input           vlddir_vd_ce_c2;	// VUAD ecc changes
input           misbuf_vuad_ce_instr_c2;	// VUAD ecc changes

output [2:0]    arb_cpuid_c5;

output scan_out; 

output arb_bs_or_bis_inst_c2; // BS 04/20/04 , taking out arb_bs_or_bis_inst_c2 to l2t_usaloc_dp.sv 
                              // to clear Use bit on a BST or BIST to mitigate pollution effect in L2 cache
                              // for Copy routines

//output arb_dirvec_cpu0_sel00 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu0_selbot ;// BS 03/25/04 for partial bank/core modes support
//
//output arb_dirvec_cpu1_sel00 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu1_sel01 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu1_selbot ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu1_seltop ;// BS 03/25/04 for partial bank/core modes support
//
//output arb_dirvec_cpu2_sel00 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu2_sel01 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu2_sel10 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu2_selbot ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu2_seltop ;// BS 03/25/04 for partial bank/core modes support
//
//output arb_dirvec_cpu3_sel00 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu3_sel01 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu3_sel10 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu3_sel11 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu3_selbot ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu3_seltop ;// BS 03/25/04 for partial bank/core modes support
//
//output arb_dirvec_cpu4_sel00 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu4_sel01 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu4_sel10 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu4_sel11 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu4_selbot ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu4_seltop ;// BS 03/25/04 for partial bank/core modes support
//
//output arb_dirvec_cpu5_sel00 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu5_sel01 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu5_sel10 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu5_sel11 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu5_selbot ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu5_seltop ;// BS 03/25/04 for partial bank/core modes support
//
//output arb_dirvec_cpu6_sel00 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu6_sel01 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu6_sel10 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu6_sel11 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu6_selbot ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu6_seltop ;// BS 03/25/04 for partial bank/core modes support
//
//output arb_dirvec_cpu7_sel00 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu7_sel01 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu7_sel10 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu7_sel11 ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu7_selbot ;// BS 03/25/04 for partial bank/core modes support
//output arb_dirvec_cpu7_seltop ;// BS 03/25/04 for partial bank/core modes support
// 
 // BS 2/1/04 : Brought out IC inval signal to separate from IC fill
 // because IC fill will load only one panel in 1 row (only one 1 cache waY) while IC inval will write
 // to two panels in two rows (2 icache ways) every cycle. This IC dir write enable logic is in
 // l2t_dir_ctl.sv.

// output arb_ic_inval_wr_en_c3; // to l2t_dirrep_ctl
 
 output	arb_mux1_mbsel_px2; // to all arbdps. 
// output	arb_mux2_snpsel_px2; // to all arbdps. 
// cloned for timing
output arb_arbdat_mux2_snpsel_px2;
output arb_arbadr_mux2_snpsel_px2;
output arb_arbdec_mux2_snpsel_px2;


//output arb_arbadr_mux3_bufsel_px2;
output arb_arbdat_mux3_bufsel_px2;
output arb_arbdec_mux3_bufsel_px2;

output	arb_mux3_bufsel_px1;

// output	arb_mux4_c1sel_px2; // to all arbdps. 
output arb_arbadr_mux4_c1sel_px2;
output arb_arbdat_mux4_c1sel_px2;
output arb_arbdec_mux4_c1sel_px2;
 
 output arb_data_ecc_idx_en ; // to arbaddr  
 output arb_data_ecc_idx_reset ; // to arbaddr. 
 
 output arb_sel_tecc_addr_px2; // sel for tecc,deccck,diagtag mux in px2. 
 output arb_sel_deccck_addr_px2; // sel for tecc,decc,diagtag mux in px2. 
 output arb_sel_diag_addr_px2; // sel for tecc,deccck,diagtag mux in px2. 
 output arb_sel_diag_tag_addr_px2; // sel between C1 address and address from diag/tecc/deccck accesses. 
 output arb_inc_tag_ecc_cnt_c3_n; // tecc instruction in C3. 
 output arb_sel_lkup_stalled_tag_px2; // sel tecc/diagtag/c1 tag address. 
 
 output	arb_bist_or_diag_acc_c1; // sel bist/diag data in arbaddr. 
			     // used for bist vs diagnostic way selection 
			     // in tag. 

//  output  arb_bist_or_diag_acc_qual_c1;
 
 output	arb_sel_deccck_or_bist_idx; // NEW_PIN 
 output	arb_sel_vuad_bist_px2 ; // NEW_PIN 
 // output	sel_stall_vuad_idx; // to arbadr. NEW_PIN 
 
 output	arb_misbuf_inst_vld_c2; // instruction valid to misbuf 
// output	arb_filbuf_inst_vld_c2; // instruction valid to filbuf. 
 output	arb_inst_vld_c2; // valid instruction in C2.to arbaddr 
 
 output	arb_tag_inst_vld_c2; // same as arb_inst_vld_c2 
 
 output	arb_wbuf_inst_vld_c2; 
 
 output	arb_imiss_hit_c10; // mux select for err reporting for imisses 
 output	arb_imiss_hit_c4; // mux select for dir cam address 
 
 output	arb_evict_c3; // mux select for dir cam address 
 output	arb_evict_c4; // mux select for writing the approp 
			 // address into the directory 
 
 output	arb_sel_c2_stall_idx_c1; // this signal goes to the set logic in 
			     // arbaddr 
 output	arb_vuad_acc_px2; // is an enable for vuad access. 

 output arb_upper_four_byte_access_c1;// BS 05/04/04 : taking out upper_four_byte_access info to word_en_c2[15:0] gen logic in tag_ctl
 output arb_lower_four_byte_access_c1;// BS 05/04/04 : taking out lower_four_byte_access info to word_en_c2[15:0] gen logic in tag_ctl

 output	arb_tag_wr_px2; // to tag for writes. 
 output arb_vuad_idx2_sel_px2_n; 	// sel adr2 ( stalled addr ) for vuad access. 
 
 output	arb_mb_camen_px2; // mbcam en. 
 
 output	arb_filbuf_fbsel_c1 ; // indicates that an fb instruction got picked 
 output	arb_misbuf_mbsel_c1; // indicates that an fb instruction got picked. 
 output	arb_iqsel_px2; // indicates that the iq instruction got picked. 
 output	arb_iqsel_px2_v1; // indicates that the iq instruction got picked. 
 
 output	arb_evict_vld_c2; // output to vuad dp. 

 output	arb_ic_evict_c4; // output to vuad dp. 
 output	arb_dc_evict_c4; // output to vuad dp. 

 output	arb_inst_diag_c1; // output to vuad dp. 
 
 
 output	arb_inst_vld_c1; // valid instruction in C1  
 output	arb_inval_inst_vld_c3; // valid invalid instruction in C3  
 
 // to l2d 
 output	arb_l2d_fbrd_c3; // mux select for wr data in l2d. 
 
 // to misbuf 
 output	arb_misbuf_ctrue_c9 ; // compare true.  
 output	arb_misbuf_cas1_hit_c8; // cas1 hit qualifier for the above inst. 
 
 output 	arb_decc_data_sel_c9; // scrub data write select to arbdat ; 
 output [3:0]	arb_tecc_way_c2; // to tagd for tagecc related reads. 
 output		arb_l2tag_vld_c4; // to tagd for diagnostic read  
 // output		arb_int_or_diag_acc_c1; // to tagd POST_2.0 
 
 output	[7:0]	arb_dword_mask_c8; // used in arbdata for pst merging. 
 
 output		arb_fill_vld_c2; // to tag. 
 output		arb_imiss_vld_c2; // to tag for way select mux 

 output         arb_pf_ice_inst_c2;
 output         arb_pf_ice_inst_c7;
 
 
///////////////////// 
// TAG DP outputs 
///////////////////// 
 output	arb_normal_tagacc_c2; // to tagd 
 output	arb_tagd_tecc_c2; // NEW_PIN indicates that a tecc op is 
			      // reading the tags. 

///////////////////// 
// Directory or Dir rep outputs  
///////////////////// 
output		arb_dir_vld_c3_l;   
output		arb_dc_rd_en_c3; // NEW_PIN 
output          arb_ic_rd_en_c3;
output		arb_dc_wr_en_c3; // NEW_PIN 
output          arb_ic_wr_en_c3;
output	[4:0]	arb_dir_panel_dcd_c3; // NEW_PIN 
output  [4:0]   arb_dir_panel_icd_c3;
output	[3:0]	arb_lkup_bank_ena_dcd_c3 ; // NEW_PIN 
output  [3:0]   arb_lkup_bank_ena_icd_c3 ; // NEW_PIN
output [7:0]	arb_inval_mask_dcd_c3; // NEW_PIN 
output [7:0]    arb_inval_mask_icd_c3;
output	[4:0]	arb_wr_dc_dir_entry_c3; // NEW_PIN 
output  [4:0]   arb_wr_ic_dir_entry_c3;
output		arb_dc_ic_rd_bit_4;
 
 
 output [10:0]  arb_dir_addr_c9; // NEW_PIN 
 
 output		arb_dir_wr_en_c4; // NEW_PIN to the csrblock 
 
 
output	arb_csr_wr_en_c7; // to the csr block 
output	arb_csr_rd_en_c7; // to oq_dctl. 
 
 
 output	arb_evict_c5; // to oqu. 
 
/////////////////////// 
// tag outputs 
/////////////////////// 
 output	arb_waysel_gate_c2; 
 output	arb_data_diag_st_c2; 
 output	arb_inval_inst_c2; 
// output	arb_inst_diag_c2; 
output	arb_decdp_ld64_inst_c1; // POST_3.4 constrain it properly. 
 
 output	 arb_waysel_inst_vld_c2; // POST_2.0 
// output	 arb_coloff_inst_vld_c2; // POST_2.0 
  output	arb_inst_vld_c2_prev;
 output	 arb_rdwr_inst_vld_c2; // POST_2.0 

// int 5.0 changes
// output	 arb_wen_inst_vld_c2; // POST_2.0 
 
 output	arb_ic_inval_vld_c7; // outputs to oque to send a st ack 
 output arb_dc_inval_vld_c7;
 
 
 output	arb_inst_l2data_vld_c6; // diagnostic data access to decc. 
 
 
output	arb_csr_wr_en_c3; // to tag for st ack generation 
output	arb_csr_rd_en_c3; // to tag. 
output	arb_diag_complete_c3; 
output	arb_tag_pst_with_ctrue_c1 ; // POST_3.4 pin Bottom. 
/////////////////////// 
// misbuf outputs 
/////////////////////// 
output	arb_csr_st_c2; // to misbuf for insert and delete logic. 
output	arb_misbuf_hit_off_c1 ; // turn off mb tag hit if this signal is high. 
output	arb_pst_ctrue_en_c8; 
output	arb_evict_tecc_vld_c2 ; // POST_2.0 pin 
 
/////////////////////// 
// filbuf outputs 
/////////////////////// 
 output	arb_filbuf_hit_off_c1 ; // turn off fb tag hit if this signal is high. 
 
/////////////////////// 
// wbuf outputs 
/////////////////////// 
 output	arb_wbuf_hit_off_c1 ; // turn off wb tag hit if this signal is high. 
 
/////////////////////// 
// oq_dctl outputs 
/////////////////////// 
  output	arb_inst_l2vuad_vld_c6; 
  output	arb_inst_l2tag_vld_c6; 
 
/////////////////////// 
// to snp 
/////////////////////// 
// output	arb_snpsel_c1; 
output	arb_snp_snpsel_px2;
 
//output	arb_dbg_inst_vld_c3; // to dbg. 
 
output	arb_decdp_tag_wr_c1; 
 
output	arb_decdp_pst_inst_c2 ; 
output	arb_decdp_fwd_req_c2; 
output	arb_decdp_swap_inst_c2; 
output	arb_decdp_imiss_inst_c2; 
// int 5.0 changes
output		arb_decdp_inst_int_c2;
output          arb_decdp_inst_int_c1;


output	arb_decdp_ld64_inst_c2; // NEW_PIN decod 
output	arb_decdp_bis_inst_c3; // NEW_PIN decode 
output  arb_decdp_rmo_st_c3;
output	arb_decdp_strst_inst_c2; // NEW_PIN decode 
output	arb_decdp_wr8_inst_c2; // NEW_PIN decode 
output  arb_decdp_wr64_inst_c2;
output	arb_decdp_st_inst_c2; // NEW_PIN decode. 
output  arb_decdp_st_inst_c3;
output	arb_decdp_st_with_ctrue_c2; 
output	arb_decdp_ld_inst_c2; 
output	arb_arbdp_dword_st_c1 ; 
output	arb_arbdp_pst_with_ctrue_c2; 
output	arb_decdp_cas1_inst_c2; 
output	arb_decdp_cas2_inst_c2; 
output	arb_decdp_cas2_from_mb_c2; 
//output	arb_decdp_cas2_from_mb_ctrue_c2; 
output	decdp_cas2_from_mb_ctrue_c1; 
 
output	arb_inst_l2vuad_vld_c3; // to vuaddp 
 
//output	arb_write_req_c3; // to arbdec 
//output  arb_prim_req_c3;
 
output	arb_decdp_pf_inst_c5; 
output	arb_decdp_strld_inst_c6 ;  
output  arb_decdp_atm_inst_c6;
 
output	arb_store_err_c8; 
output	arb_arbdp_tecc_inst_mb_c8; 
output	arb_tagd_perr_vld_c2; // POST_2.0 pin 
 
output	arb_arbdp_tag_pst_no_ctrue_c2; // POST 3.0 pin 
output	arb_arbdp_misbuf_pst_no_ctrue_c2; // POST 3.0 pin 
output	arb_arbdp_vuadctl_pst_no_ctrue_c2; // POST 3.0 pin 
 
output	arb_tecc_c2; // POST_3.0 PIN 
 
 output	arb_vuadctl_no_bypass_px2; // POST_3.1 pin 
 
 output		arb_sel_way_px2;  // selects go to arbaddr to wr data muxes 
 output		arb_diag_or_tecc_write_px2 ;  // selects go to arbaddr to wr data muxes 
 output		arb_tag_rd_px2; // to tag for reads. 
 output [15:0]	arb_tag_way_px2; // tag write way. // BS & SR 10/28/03
 output	arb_mux1_mbsel_px1; 
 output		arb_wr8_inst_no_ctrue_c1; // POST_3.4 

output          arb_vuad_ce_err_c2;	// VUAD ecc changes
output          usaloc_vlddir_arb_vuad_ce_err_c3;	// VUAD ecc changes
output          tagctl_arb_vuad_ce_err_c3;	// VUAD ecc changes

// BS & SR 12/07/04 : taking out arb_swap_cas2_req_c2 to l2t_oqu_ctl.sv to disable ERROR
// Indication packet on a CE,UE, or Notdata on the store part of the swap or CAS2.
// Instead , regular store ack packet will get sent.

output arb_oqu_swap_cas2_req_c2;


//////////////////////////////////////////////////
// L1 clk header
//////////////////////////////////////////////////
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

//////////////////////////////////////////
// Spare gate insertion
//////////////////////////////////////////
l2t_arb_ctl_spare_ctl_macro__num_4 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
//////////////////////////////////////////


l2t_arb_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk(l2clk),
        .l1en(1'b1 ),
        .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

//////////////////////////////////////////////////

assign dbginit_l = 1'b1;

wire [7:0] arb_cpuid_dec_c2;
wire       sel_bot_seg;
wire       sel_00;
wire       sel_01;
wire       sel_10;
wire       sel_11;
wire       sum0;
wire [1:0] sum01;
wire [1:0] sum012;
wire [2:0] sum0123,sum01234,sum012345,sum0123456;
wire [1:0] seg;
wire [2:0] arb_cpuid_c3,arb_cpuid_c4,arb_cpuid_c52;

 wire [2:0] arb_cpuid_fnl_c2;
 wire   decdp_strpst_inst_c1;
 wire	arb_tag_acc_px2 ; // indicates that the tag array is accessed. 
 wire	sel_delayed_fill_wr_c1, sel_fill_wr_px2; 
 
 wire		set_gate_off_prim_req_px2; 
 wire		gate_off_prim_req_c1; 
 wire		gate_off_prim_req_state; 
 wire		gate_off_prim_req_state_in; 
 
 wire	arb_inst_l2vuad_c2 ; 
 wire	inst_l2vuad_vld_c2, inst_l2vuad_vld_c3, inst_l2vuad_vld_c4 ; 
 wire	inst_l2tag_vld_c3, inst_l2tag_vld_c4; 
 
 wire	arb_multi_cyc_c1; 
 wire	arb_stall_c2 ; 
 wire	same_col_stall_c1, arb_prev_stall_c1, arb_stall_c1 ; 

// int 5.0 changes

 wire	decdp_st_inst_c3_1; 
 
 
 wire   mbf_valid_px1,mbf_valid_px2; 
 wire   snp_valid_px2; 
 wire   fbf_valid_px1; // int 5.0 changes ,fbf_valid_px2; 
 
 wire   mbsel_px2,mbsel_c1; 
 wire   snpsel_px2,snpsel_c1,snpsel_c2, snpsel_c3; 
 wire   fbsel_px2,fbsel_c1; 
 wire	iqsel_px2; 
 wire	mbfull_px2; 
 wire	arb_inst_vld_px2; 
 wire	inst_vld_c2_prev; 
  
 wire   atm_instr_c1, atm_instr_px2; 
 wire	inc_tag_ecc_cnt_c3; 
 
 
// int 5.0 changes
//  wire	imiss_hit_c7;

 wire	arb_inst_l2tag_c2; 
 wire	inst_l2tag_vld_c2; // needed in muxsel generation for arbaddr 
 wire	arb_inst_l2data_c2; 
 wire	inst_l2data_vld_c2; // used in muxsel generation for arbdata 
 wire	inst_l2data_vld_c3, inst_l2data_vld_c4; 
 wire	inst_l2data_vld_c5, inst_l2data_vld_c52, inst_l2data_vld_c6; // BS 03/11/04 extra cycle for mem access 
 wire	cmp_lower_c9, cmp_upper_c9, cmp_dword_c9; 
 
 wire	[7:0]	tecc_st_cnt_plus1, tecc_st_cnt ; 
 
 wire	[3:0]	tag_diag_or_tecc_way_c2; 
 wire	[3:0]	stalled_tag; 
 
 wire	[7:0]	dword_mask_c7;  
 wire	hit_l2orfb_c4, hit_l2orfb_c5, hit_l2orfb_c52, hit_l2orfb_c6, hit_l2orfb_c7, hit_l2orfb_c8 ; 
             // BS 03/11/04 extra cycle for mem access
 wire	arb_inst_vld_c3; // used to qualify address compares 
 wire	arb_inst_vld_c3_1; // used to qualify address compares 
 
  
 wire	[10:0]	dir_addr_cnt_plus1,dir_addr_cnt_c3; 
 wire	[10:0]	dir_addr_cnt_c4,dir_addr_cnt_c5, dir_addr_cnt_c52; // BS 03/11/04 extra cycle for mem access 
 wire	[10:0]	dir_addr_cnt_c6,dir_addr_cnt_c7, dir_addr_cnt_c8; 
 wire	[4:0]	dir_entry_c3, dir_entry_c4, dir_entry_c5, dir_entry_c52, dir_entry_c6 ; // BS 03/11/04 extra cycle for mem access 
 wire	[4:0]	tmp_wr_dir_entry_c3, wr_dir_entry_c3 ;	 
 wire		def_inval_entry; 
 wire	[4:0]	dc_wr_panel_c3, dc_wr_panel_c4; 
 wire	[4:0]	dc_wr_panel_c5, dc_wr_panel_c52; // BS 03/11/04 extra cycle for mem access 
 wire	[4:0]	tmp_dc_wr_panel_c3; 
 wire	[4:0]	ic_wr_panel_c3, ic_wr_panel_c4; 
 wire	[4:0]	ic_wr_panel_c5, ic_wr_panel_c52; // BS 03/11/04 extra cycle for mem access 
 wire	[4:0]	tmp_ic_wr_panel_c3; 
 wire	[7:0]	self_inval_mask_c3, others_inval_mask_c3, tmp_inval_mask_c3 ; 
 wire	[2:0]	cpuid_c3; 
 wire		ld_inst_c3, ld_hit_c3, sel_stld_mask; 
 wire		inval_inst_vld_c2 ; 
 wire		dc_inval_vld_c3, ic_inval_vld_c3, inval_inst_vld_c3;  
 wire		dc_inval_vld_c4, ic_inval_vld_c4, inval_inst_vld_c4;  
 wire		dc_inval_vld_c5, ic_inval_vld_c5, inval_inst_vld_c5;  
// BS 03/11/04 extra cycle for mem access
 wire           dc_inval_vld_c52, ic_inval_vld_c52, inval_inst_vld_c52;
 wire		dc_inval_vld_c6, ic_inval_vld_c6;  
 wire		dc_inval_c3, ic_inval_c3; 
  
 wire	[3:0]	dc_cam_addr_c3, ic_cam_addr_c3 ; 
// int 5.0 changes
 wire	     	enc_cam_addr_c4 ; 


 wire		dc_hitqual_cam_en0_c3, dc_hitqual_cam_en1_c3, ic_hitqual_cam_en_c2 ; 
 
 wire		tmp_bank_icd_c3 ; 
 
 wire	st_cam_en_c2 ; 
  wire	waysel_gate_c1; 
 
 wire	arb_imiss_hit_c5, arb_imiss_hit_c7 ; 
 wire	arb_imiss_hit_c8, arb_imiss_hit_c9 ; 
 wire	tecc_inst_c2; 
 wire	tecc_tag_acc_en_px2; 
 wire	inc_tag_ecc_cnt_c2; 
 wire	data_ecc_active_c4 ; // used for stall. 
 wire	arb_inst_csr_c2; 
 
 wire	imiss_inst_c3; 
 wire   st_cam_en_c3_tmp; // BS and SR 11/07/03, store pipelining support 
 wire	st_cam_en_c3; 
 wire	sp_cam_en_c2, sp_cam_en_c3; // special instruction cam en 
 wire	ic_hitqual_cam_en_c3; 
wire	imiss_hit_c3; 
 
wire	arb_evict_unqual_c3; 
wire	arb_csr_wr_en_c2, arb_csr_wr_en_c4; 
wire	arb_csr_wr_en_c5, arb_csr_wr_en_c52, arb_csr_wr_en_c6, arb_csr_wr_en_c8; // BS 03/11/04 extra cycle for mem access 
wire	arb_csr_rd_en_c2, arb_csr_rd_en_c4; 
wire	arb_csr_rd_en_c5, arb_csr_rd_en_c52, arb_csr_rd_en_c6; // BS 03/11/04 extra cycle for mem access 
  wire	inst_l2vuad_vld_c5, inst_l2vuad_vld_c52, inst_l2vuad_vld_c6; // BS 03/11/04 extra cycle for mem access 
  wire	inst_l2tag_vld_c5, inst_l2tag_vld_c52, inst_l2tag_vld_c6; // BS 03/11/04 extra cycle for mem access 
 
 wire	arb_inst_csr_c1; 
 wire	arb_inst_l2data_c1; 
 wire	arb_inst_l2tag_c1; 
 wire	arb_inst_l2vuad_c1; 
 wire	store_inst_en_c3 ; 
 
 wire	sp_tag_access_c1, sp_tag_access_px2 ; 
 wire	arb_tag_acc_c1; 
 wire	normal_tagacc_c1, normal_tagacc_c2; 
 wire	arb_stall_unqual_c2; 
 
 wire	wr64_inst_c3; 
 wire	rdma_64B_stall; 
 wire	arb_fill_vld_c3; 
 wire	arb_imiss_hit_c6;  
 
 wire	gate_off_buf_req_px2; 
 wire	snp_muxsel_px1  ; 
 wire	arb_dir_wr_en_c3; 
 
 wire	 bist_enable_c1, bist_enable_c2 ; 
 wire	bist_acc_vd_c1, bist_acc_vd_c2 ; 
 
 // Decode  
 
 
// int 5.0 changes
// wire	decdp_inst_int_c1; 


wire	decdp_inst_int_or_inval_c1;  
wire	arbdp_inst_mb_or_fb_c1 ; 
 
wire	decdp_rmo_st_c2, decdp_bis_inst_c2 ; 
wire	decdp_strst_inst_c1; 
wire	decdp_wr8_inst_c1, decdp_wr64_inst_c1 ; 
wire	decdp_st_inst_c1; 
wire	dec_evict_c1, dec_evict_c2; 
 
wire	decdp_rdmapst_inst_c1; 
wire	decdp_pst_inst_c1_internal; 
wire	pst_with_ctrue_c1, decdp_cas1_inst_c1; 
wire	decdp_cas2_inst_c1, decdp_cas2_from_mb_c1; 
wire	decdp_cas2_from_mb_ctrue_c1; 
wire	decdp_cas2_from_xbar_c1; 
wire	decdp_pst_st_c1, pst_no_ctrue_c1; 
wire	st_with_ctrue_c1; 
wire	arbdp_tecc_inst_c1; 
wire	store_err_c2, store_err_c3, store_err_c4 ; 
wire	store_err_c5, store_err_c52, store_err_c6, store_err_c7 ; // BS 03/11/04 extra cycle for mem access 
wire	decdp_fwd_req_c1; 
wire	decdp_swap_inst_c1; 
wire	decdp_camld_inst_c1, decdp_camld_inst_c2; 
wire	decdp_imiss_inst_c1;  
wire	decdp_ld_inst_c1; 
wire	decdp_pf_inst_c1, decdp_pf_inst_c2; 
wire	decdp_pf_inst_c3, decdp_pf_inst_c4; 
wire	dword_st_c1; 
wire	decdp_dc_inval_c1, decdp_dc_inval_c2; 
wire	decdp_ic_inval_c1, decdp_ic_inval_c2; 
wire	multi_cyc_op_c1; 
wire	decdp_pst_inst_c3, decdp_pst_inst_c4, decdp_pst_inst_c5, decdp_pst_inst_c52; // BS 03/11/04 extra cycle for mem access 
wire	decdp_pst_inst_c6, decdp_pst_inst_c7 ; 
wire	pst_no_ctrue_c3, pst_no_ctrue_c4, pst_no_ctrue_c5, pst_no_ctrue_c52 ; // BS 03/11/04 extra cycle for mem access 
wire	pst_no_ctrue_c6, pst_no_ctrue_c7 ; 
wire	arbdp_pst_no_ctrue_c8; 
wire	decdp_cas1_inst_c3, decdp_cas1_inst_c4, decdp_cas1_inst_c5, decdp_cas1_inst_c52 ; // BS 03/11/04 extra cycle for mem access 
wire	decdp_cas1_inst_c6, decdp_cas1_inst_c7, decdp_cas1_inst_c8 ; 
//wire	sp_pst_inst_c2, sp_pst_inst_c3, sp_pst_inst_c4 ; 
//wire	sp_pst_inst_c5, sp_pst_inst_c52, sp_pst_inst_c6;// sp_pst_inst_c7 ; // BS 03/11/04 extra cycle for mem access 
wire	decdp_strpst_inst_c2, decdp_rdmapst_inst_c2; 
wire	arbdp_tecc_inst_mb_c3, arbdp_tecc_inst_mb_c4; 
wire	arbdp_tecc_inst_mb_c5, arbdp_tecc_inst_mb_c52, arbdp_tecc_inst_mb_c6; // BS 03/11/04 extra cycle for mem access 
wire	arbdp_tecc_inst_mb_c7; 
wire	tecc_st_cnt_reset; 
 
 wire	arb_inst_vld_c2_1, arb_inst_vld_c2_2; 
 wire	arb_inst_vld_c2_3, arb_inst_vld_c2_4; 
 wire	arb_inst_vld_c2_5, arb_inst_vld_c2_6; 
 wire	arb_inst_vld_c2_7; 
 
 
wire	imiss_stall_op_c1inc1; 
wire	decdp_cas1_inst_c1_1, decdp_cas1_inst_c2_1; 
wire	arb_stall_tmp_c1; 
wire	mbf_valid_px2_1; 
wire	fbf_valid_px2_1; 
wire	snp_valid_px2_1; 
wire	arb_inst_vld_c1_1; 
wire	decdp_st_inst_c2_1; 
wire	decdp_strst_inst_c2_1; 
wire	tecc_tag_acc_en_px1; 
wire	arb_tagd_tecc_c1; 
wire	arb_csr_wr_en_c3_1; 
wire	decdp_wr64_inst_c2_1; 
wire	arbdp_pst_no_ctrue_c2_1; 
wire	parerr_gate_c1, parerr_gate_c2; 
wire	dec_evict_tecc_c1, dec_evict_tecc_c2; 
wire	arbdp_evict_c2, arbdp_evict_c3; 
 wire	arb_inst_vld_c2_8; 
 wire	arb_inst_vld_c2_10; // int 5.0 changes, arb_inst_vld_c2_11; 
 wire	bist_vuad_rd_en_px2; 
 wire	bist_acc_vd_px2; 

  wire	store_inst_vld_c3; 
  wire	store_inst_vld_c3_1; 
 wire	lower_cas_c8, lower_cas_c9; 
 wire	upper_cas_c8, upper_cas_c9; 
 wire	arbdat_word_lower_cmp_c8, word_lower_cmp_c9; 
 wire	arbdat_word_upper_cmp_c8, word_upper_cmp_c9; 
wire	[3:0]	enc_tag_way_px2; 

wire	[3:0]	dec_lo_way_sel_c1; 
// int 5.0 changes 
wire	[3:0]	dec_hi_way_sel_c1 ; // left as is since way = 16

wire	decdp_st_inst_c3_2, arb_inst_vld_c3_2 ; 
wire	store_inst_vld_c3_2; 
wire	arb_inst_l2tag_c2_1; 
  wire	scrub_fsm_count_eq_5_px1, scrub_fsm_count_eq_6_px2; 
 wire	diag_or_tecc_acc_px2, diag_or_tecc_acc_c1; 
 wire	diag_or_scr_way_sel; 
wire	inst_l2tag_vld_c2_1; 
  wire	scrub_fsm_count_eq_0_px1, scrub_fsm_count_eq_1_px2 ; 
wire	inst_bufid1_c2; 
 wire	mux3_bufsel_px1; 
 wire	snp_valid_px1; 

 wire   wr8_inst_pst_c1; // int 5.0 changes
 
 
 /////////////////////////////////////////////////////////////////// 
 // 
 // L2 $ OFF mode exceptions in arb: 
 // 	IN the L2 $ off mode, a fill can only be issued if the 
 // 	wbb is not full. This is factored into the fbsel logic in PX1 
 // 
 /////////////////////////////////////////////////////////////////// 
 
 
 /////////////////////////////////////////////////////////////////// 
 // Reset flop 
 /////////////////////////////////////////////////////////////////// 
 
l2t_arb_ctl_msff_ctl_macro__width_1 reset_flop 
				(.dout(dbb_rst_l),  
					.scan_in(reset_flop_scanin),
					.scan_out(reset_flop_scanout),
					.l1clk(l1clk), 
                    			.din(wmr_l),
  .siclk(siclk),
  .soclk(soclk)  
					 
); 
 
 
 /////////////////////////////////////////////////////////////////// 
 // Sel for  picking ctu data over sparc data for a BIST control reg 
 // CSR write.  
 /////////////////////////////////////////////////////////////////// 
  
 
 /////////////////////////////////////////////////////////////////// 
 //pipeline for gating off instructions due to CSR stores. 
 //-------------------------------------------------------------------- 
 // 		PX2		C1 
 //-------------------------------------------------------------------- 
 //		csr store 
 //		selected 
 //		from IQ 
 //				assert 
 //				primary 
 //				request  
 //				blackout. 
 //				 
 //-------------------------------------------------------------------- 
 //				PX2 
 //-------------------------------------------------------------------- 
 //				 
 //				gate off 
 //				issue from 
 //				all srcs except 
 //				C1 
 //				 
 //				 
 //-------------------------------------------------------------------- 
 //				PX1		PX2 
 //-------------------------------------------------------------------- 
 //				gate off 
 //				issue from 
 //				snpQ		 
 // 
 //						gate 
 //						off issue 
 //						from IQ 
 // 
 //						continue 
 //						fb/mb reqs. 
 //					 
 //////////////////////////////////////////////////////////////// 
 
 
// 
// assign set_gate_off_prim_req_px2 = (  ique_iq_arb_csr_px2 &  // csr address 
//	                            ique_iq_arb_st_px2 &  // store 
//				    ique_iq_arb_vbit_px2 &  
//	                            iqsel_px2 ) ; // select an IQ instruction. 
//



assign set_gate_off_prim_req_px2 = (( ique_iq_arb_csr_px2 &  // csr address
				      ique_iq_arb_st_px2 &  // store
                                      ique_iq_arb_vbit_px2 & iqsel_px2 ) | // select an IQ instruction.
				      (ique_arb_pf_ice_px2 & ique_iq_arb_vbit_px2 & iqsel_px2)); //select pf ice inst
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_gate_off_prim_req_c1 
		(.dout(gate_off_prim_req_c1), .l1clk(l1clk),  
                 .scan_in(ff_gate_off_prim_req_c1_scanin),
                 .scan_out(ff_gate_off_prim_req_c1_scanout),
                 .din(set_gate_off_prim_req_px2),
  .siclk(siclk),
  .soclk(soclk)  
		); 
 
assign gate_off_prim_req_state_in = ( gate_off_prim_req_state | // gate off state==1 
                             gate_off_prim_req_c1 ) & // PX2 req is a csr store. 
                            ~( arb_csr_wr_en_c8 | reset_for_pf_ice_c8) ; 



assign reset_for_pf_ice_c3 = arbdec_arbdp_inst_mb_c3 & decdp_pf_ice_inst_c3 & arb_inst_vld_c3 & ~arbdec_arbdp_inst_tecc_c3 &
                             ~tagdp_arb_par_err_c3; // on a tag parity error in the eviction pass of
                                                    // prefetch ice or the tecc pass that comes after that
                                                    // ,do not remove the IQ dequeue blocking

l2t_arb_ctl_msff_ctl_macro__width_6 ff_reset_for_pf_ice_staging 
        (
        .scan_in(ff_reset_for_pf_ice_staging_scanin),
        .scan_out(ff_reset_for_pf_ice_staging_scanout),
        .din({reset_for_pf_ice_c3,reset_for_pf_ice_c4,reset_for_pf_ice_c5,
		reset_for_pf_ice_c52,reset_for_pf_ice_c6,reset_for_pf_ice_c7}),
	.l1clk(l1clk),
	.dout({reset_for_pf_ice_c4,reset_for_pf_ice_c5,
		reset_for_pf_ice_c52,reset_for_pf_ice_c6,reset_for_pf_ice_c7,reset_for_pf_ice_c8}),
  .siclk(siclk),
  .soclk(soclk)
        );

 
l2t_arb_ctl_msff_ctl_macro__clr_1__width_1 ff_gate_off_prim_req_state  // sync reset active low
				(.dout(gate_off_prim_req_state), .l1clk(l1clk),  
			.scan_in(ff_gate_off_prim_req_state_scanin),
			.scan_out(ff_gate_off_prim_req_state_scanout),
			.clr(~dbb_rst_l), 
		    .din(gate_off_prim_req_state_in),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 // miss buffer instructions are blacked out for 2 cycles after issue.   
 assign	mbf_valid_px1 = ( misbuf_arb_vld_px1 & ~mbsel_px2 & ~mbsel_c1 )  & //  2 cycle blackout. 
		         ~wbuf_arb_full_px1; // wb can accept only 2 more reqs 
 
 // snpq instructions are blacked out for 4 cycles after issue. 
 // A snoop/rdma instruction is issued one every 4 cycles at best. 
 // In the C3 cycle of a snoop, the rdma register vld signal 
 // will go high ( if the rdma instruction can complete ) and  
 // prevent an instruction from issuing until the register goes low. 
 
 // A snoop is blacked out until, the previous snoop has had 
 // an opportunity to set rdma_reg_vld in C4. 
 
 
 assign	snp_muxsel_px1 = ( snp_snpq_arb_vld_px1 &  
	  ~snpsel_px2 & ~snpsel_c1 & ~snpsel_c2  & ~snpsel_c3) // blacked out for 4 cycles. 
		& ~misbuf_arb_snp_cnt8_px1 // no more than 8 snp entries in the mbf 
		//& ~misbuf_arb_cnt11_px1 // no more than 11 entries in the mbf 
		& ~tag_rdma_vld_px1 // reg_vld for stores is ~ 6 cycles and for loads is ~17 cycles 
 		& ~gate_off_prim_req_state & // csr instruction in the pipe c2 or beyond. 
	      	~gate_off_prim_req_c1; // csr instruction in C1 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_l2_bypass_mode_on_d1 
				(.dout(l2_bypass_mode_on_d1), .l1clk(l1clk),  
                 .scan_in(ff_l2_bypass_mode_on_d1_scanin),
                 .scan_out(ff_l2_bypass_mode_on_d1_scanout),
                 .din(csr_l2_bypass_mode_on),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 // fill buffer instructions. are blacked out for 2 cycles after issue. 
 assign	fbf_valid_px1 = ( filbuf_arb_vld_px1 & ~fbsel_px2 & ~fbsel_c1 )  // 2 cycle blackout 
			& ~(wbuf_arb_full_px1 & l2_bypass_mode_on_d1 ) ; // wb is inserted by  
									  // a fill in OFF mode. 
 
 assign	arb_mux1_mbsel_px1 = mbf_valid_px1 ; // introduced for evctagd. 
 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_mbf_valid_px2 
				(.dout(mbf_valid_px2), .l1clk(l1clk), 
                                       .scan_in(ff_mbf_valid_px2_scanin),
                                       .scan_out(ff_mbf_valid_px2_scanout),
                                       .din(mbf_valid_px1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_mbf_valid_px2_1 
				(.dout(mbf_valid_px2_1), .l1clk(l1clk), 
                                       .scan_in(ff_mbf_valid_px2_1_scanin),
                                       .scan_out(ff_mbf_valid_px2_1_scanout),
                                       .din(mbf_valid_px1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// int 5.0 changes
//msff_ctl_macro ff_fbf_valid_px2 (width=1)
//				(.dout(fbf_valid_px2), .l1clk(l1clk), 
//                                       .din(fbf_valid_px1),  
//		.scan_in(), 
//		.scan_out()
//); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_fbf_valid_px2_1 
				(.dout(fbf_valid_px2_1), .l1clk(l1clk), 
                                       .scan_in(ff_fbf_valid_px2_1_scanin),
                                       .scan_out(ff_fbf_valid_px2_1_scanout),
                                       .din(fbf_valid_px1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	snp_valid_px1 = snp_muxsel_px1 & ~misbuf_arb_cnt28_px2_prev ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_snp_valid_px2 
                           (.din(snp_valid_px1), .l1clk(l1clk), 
                                       .scan_in(ff_snp_valid_px2_scanin),
                                       .scan_out(ff_snp_valid_px2_scanout),
                                       .dout(snp_valid_px2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_snp_valid_px2_1 
                           (.din(snp_valid_px1), .l1clk(l1clk), 
                                       .scan_in(ff_snp_valid_px2_1_scanin),
                                       .scan_out(ff_snp_valid_px2_1_scanout),
                                       .dout(snp_valid_px2_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	mux3_bufsel_px1 = ( mbf_valid_px1 | fbf_valid_px1 | snp_valid_px1 ) & 
			~atm_instr_px2 ; 
assign arb_mux3_bufsel_px1 = mux3_bufsel_px1;
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_mux3_bufsel_px2 
                           (.din(mux3_bufsel_px1), .l1clk(l1clk), 
                                       .scan_in(ff_mux3_bufsel_px2_scanin),
                                       .scan_out(ff_mux3_bufsel_px2_scanout),
                                       .dout(arb_mux3_bufsel_px2_unbuff),
  .siclk(siclk),
  .soclk(soclk)  
); 
 

//assign arb_arbadr_mux3_bufsel_px2 = arb_mux3_bufsel_px2_unbuff;
assign arb_arbdec_mux3_bufsel_px2 = arb_mux3_bufsel_px2_unbuff;
assign arb_arbdat_mux3_bufsel_px2 = arb_mux3_bufsel_px2_unbuff;



 
 // mux3 selects between the BUffer/snp instructions and the instruction from the IQ, 
 // IQ instructions have priority only if the instruction currently in C1 is atomic with 
 // the instruction in PX2. 
 
 //assign	arb_mux3_bufsel_px2 = ( mbf_valid_px2_1 | fbf_valid_px2 | snp_valid_px2 ) &  
			    //~atm_instr_c1; 
 
 
//////////////////////////////////////////////////////// 
// mux select for addresses 
////////////////////////////////////////////////////// 
 
 // Mux1 in the arbiter selects between a Miss Buffer instruction and 
 // a Fill. The Miss Buffer instruction has higher priority 
 
 assign	arb_mux1_mbsel_px2 = mbf_valid_px2 ; 
 
 // mux2 selects between the MB/FB instruction or an external snoop 
 // snoop has a higher priority. 
 
 assign	arb_arbadr_mux2_snpsel_px2 = snp_valid_px2  ; 
 assign	arb_arbdat_mux2_snpsel_px2 = snp_valid_px2  ; 
 assign	arb_arbdec_mux2_snpsel_px2 = snp_valid_px2  ; 
 
 ///////////////////////////////////////////////////////////////////////////////////////////////// 
 // atomic instruction logic 
 // an atomic instruction in PX2 stage of the IQ pipe will cause the PX1 instruction to be issued 
 // immediately following it. However, if there is a stall asserted for the atomic instruction in C1, 
 // the selection of the following instruction from the IQ is postponed until after the stall. 
 // IQ pipeline 
 //-------------------------------------------------------------------- 
 //	PX1 		PX2		C1		 
 //-------------------------------------------------------------------- 
 //			atomic 		 
 //			attribute 
 //			bit from 
 //			IQ. 
 //-------------------------------------------------------------------- 
 //	PX2 		C1		C2		 
 //-------------------------------------------------------------------- 
 //			atomic 
 //			attribute 
 //			of C1 instr. 
 //			in case of 
 //			a C1 stall. 
 //-------------------------------------------------------------------- 
 //			PX1		PX2 		 
 //-------------------------------------------------------------------- 
 //					choose 
 //					IQ  
 //					instr. 
 //					if stall 
 //					is 0. 
 //////////////////////////////////////////////////////////////////////////////////////////////// 
 
 assign	atm_instr_px2 = ( ique_iq_arb_atm_px2 &  iqsel_px2 )  // atomic instruction from IQ 
	 | ( atm_instr_c1 & arb_stall_c2 ) ; // C1 instruction is an atomic that is stalled. 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_atm_instr_c1 
				(.dout(atm_instr_c1), .l1clk(l1clk), 
                                      .scan_in(ff_atm_instr_c1_scanin),
                                      .scan_out(ff_atm_instr_c1_scanout),
                                      .din(atm_instr_px2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 // mux3 selects between the BUffer/snp instructions and the instruction from the IQ, 
 // IQ instructions have priority only if the instruction currently in C1 is atomic with 
 // the instruction in PX2. 
 
 //assign	arb_mux3_bufsel_px2 = ( mbf_valid_px2_1 | fbf_valid_px2 | snp_valid_px2 ) &  
			    //~atm_instr_c1; 
 
// Timing fix cloning
assign	arb_stall_c2_clone_1 = arb_stall_unqual_c2_clone_1 &  arb_inst_vld_c1_1_cloned ; 

l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_stall_c1_cloned 
       (
	.scan_in(ff_arb_stall_c1_cloned_scanin),
	.scan_out(ff_arb_stall_c1_cloned_scanout),
	.din(arb_stall_c1), 
	.l1clk(l1clk),
       	.dout(arb_stall_unqual_c2_clone_1),
  .siclk(siclk),
  .soclk(soclk)
	);

l2t_arb_ctl_msff_ctl_macro__clr_1__width_1 ff_arb_inst_vld_c1_1_clone  // sync reset active low
       (
	.scan_in(ff_arb_inst_vld_c1_1_clone_scanin),
	.scan_out(ff_arb_inst_vld_c1_1_clone_scanout),
	.din(arb_inst_vld_px2), 
	.l1clk(l1clk),
       	.clr(~dbb_rst_l),
       	.dout(arb_inst_vld_c1_1_cloned),
  .siclk(siclk),
  .soclk(soclk)
	);



// assign	arb_arbadr_mux4_c1sel_px2 = arb_stall_c2 & dbb_rst_l; 
// assign	arb_arbdat_mux4_c1sel_px2 = arb_stall_c2 & dbb_rst_l; 
// assign	arb_arbdec_mux4_c1sel_px2 = arb_stall_c2 & dbb_rst_l; 
 
assign	arb_arbadr_mux4_c1sel_px2 = arb_stall_c2_clone_1 & dbb_rst_l; 
assign	arb_arbdat_mux4_c1sel_px2 = arb_stall_c2_clone_1 & dbb_rst_l; 
assign	arb_arbdec_mux4_c1sel_px2 = arb_stall_c2_clone_1 & dbb_rst_l; 
 
 
 //mux selects 
 
 
//////////////////////////////////////////////////////////////////////////////
//  For ATPG : ECO ID 106991
//////////////////////////////////////////////////////////////////////////////
//assign arb_sel_tecc_addr_px2 = inc_tag_ecc_cnt_c3; 

assign arb_sel_tecc_addr_px2 = (inc_tag_ecc_cnt_c3 | tcu_scan_en); 



//////////////////////////////////////////////////////////////////////////////



// timing fix
// assign arb_sel_deccck_addr_px2 = ~inc_tag_ecc_cnt_c3 & data_ecc_active_c4 ; 

// Cloning logic due for timing 
//assign arb_sel_diag_addr_px2 = ~inc_tag_ecc_cnt_c3 & ~data_ecc_active_c4; 

assign tag_data_ecc_active_c3_inverted = ~tag_data_ecc_active_c3;

// ECO for Atpg : 106991
//
//

cl_u1_inv_16x  arb__inv_eco_106991 (.in(tcu_scan_en), .out(
        tcu_scan_en_inv));


cl_u1_nand3_16x  nand_arb_sel_deccck_addr_px2 
	(
	.in0(~inc_tag_ecc_cnt_c3), // Fix for bug 111495
 	.in1(~data_ecc_active_c4_n), // Fix for bug 111495
        .in2(tcu_scan_en_inv), 
	.out(arb_sel_deccck_addr_px2_n)
	);

cl_u1_inv_32x	inv_arb_sel_deccck_addr_px2
	(
	.out	(arb_sel_deccck_addr_px2),
	.in	(arb_sel_deccck_addr_px2_n)
	);

l2t_arb_ctl_msffi_ctl_macro__dmsff_16x__width_2 ff_data_ecc_active_c4_dup 
	(
	.scan_in(ff_data_ecc_active_c4_dup_scanin),
	.scan_out(ff_data_ecc_active_c4_dup_scanout),
	.din({tag_data_ecc_active_c3_inverted,tag_data_ecc_active_c3}), 
	.l1clk(l1clk),
        .q_l({data_ecc_active_c4_noninv,data_ecc_active_c4_n}),
  .siclk(siclk),
  .soclk(soclk)
        );

l2t_arb_ctl_msffi_ctl_macro__dmsff_16x__width_2 ff_inc_tag_ecc_cnt_c3_dup 
	(
	.scan_in(ff_inc_tag_ecc_cnt_c3_dup_scanin),
	.scan_out(ff_inc_tag_ecc_cnt_c3_dup_scanout),
	.din({2{inc_tag_ecc_cnt_c2}}), 	
	.l1clk(l1clk),
	.q_l({inc_tag_ecc_cnt_c3_1_n,inc_tag_ecc_cnt_c3_1_v2}),
  .siclk(siclk),
  .soclk(soclk)
	);

// FLIP TO NOR 16x

// ECO for Atpg : 106991

assign arb_sel_diag_addr_px2 = (~inc_tag_ecc_cnt_c3 & tcu_scan_en_inv) & data_ecc_active_c4_n ;  
                                   // Fix for bug 111495


assign arb_inc_tag_ecc_cnt_c3_n = ~inc_tag_ecc_cnt_c3 ; 


 
////////////////////////////////////////////////////////////////////// 
// Scrub index enable : 
// When a tecc fill is active in C2. 
////////////////////////////////////////////////////////////////////// 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_tecc_c2 
                           (.din(arbdec_arbdp_tecc_c1), .l1clk(l1clk), 
                        .scan_in(ff_tecc_c2_scanin),
                        .scan_out(ff_tecc_c2_scanout),
                        .dout(tecc_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// 
//msff_ctl_macro ff_arb_tecc_c2_c3 (width=2)	// VUAD ecc changes
//                           (.din({arbdec_arbdp_tecc_c1,arb_tecc_c2}), .l1clk(l1clk), 
//                        .scan_in(ff_arb_tecc_c2_c3_scanin),
//                        .scan_out(ff_arb_tecc_c2_c3_scanout),
//                        .dout({arb_tecc_c2,arb_tecc_c3}),  
//); 

l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_tecc_c2_c3       // VUAD ecc changes
               (
		.scan_in(ff_arb_tecc_c2_c3_scanin),
		.scan_out(ff_arb_tecc_c2_c3_scanout),
		.din(arbdec_arbdp_tecc_c1), .l1clk(l1clk),
               .dout(arb_tecc_c2),
  .siclk(siclk),
  .soclk(soclk)
	);


l2t_arb_ctl_msff_ctl_macro__width_1 ff_data_ecc_active_c4 
               (.din(tag_data_ecc_active_c3), .l1clk(l1clk), 
               .scan_in(ff_data_ecc_active_c4_scanin),
               .scan_out(ff_data_ecc_active_c4_scanout),
               .dout(data_ecc_active_c4),
  .siclk(siclk),
  .soclk(soclk)  
		); 
 
 assign arb_data_ecc_idx_en = ( arb_fill_vld_c2 & tecc_c2 ) ; 
 assign arb_data_ecc_idx_reset =   ( ~dbb_rst_l | ~dbginit_l ); 
 
 
 
 // The following mux select is used in selecting the C2 address(stalled) 
 // over the c1 address. 
 // The set to be scrubbed for data ecc is part of the C1 address and not  
 // part of the stalled C2 address. 
 assign	arb_sel_c2_stall_idx_c1 = ( arb_stall_unqual_c2 & ~data_ecc_active_c4 ); 
 
 ////////////////////////////////////////////////////////// 
 // The 3 addresses making up the stalled vuad address 
 // are 
 // - C1 instruction address 
 // - DECC scrub address 
 // - Bist address. 
 ////////////////////////////////////////////////////////// 
 
 //assign	arb_sel_vuad_bist_px2 = ( bist_vuad_rd_en_px2 | 
 //		bist_vuad_wr_en_px2 )  ; 
 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_bist_vuad_rd_en_px1 
                           (.din(bist_vuad_rd_en_px1), .l1clk(l1clk), 
                        .scan_in(ff_bist_vuad_rd_en_px1_scanin),
                        .scan_out(ff_bist_vuad_rd_en_px1_scanout),
                        .dout(bist_vuad_rd_en_px2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	 arb_sel_vuad_bist_px2 = bist_vuad_rd_en_px2 & mbist_run_r1; 
 
 assign	arb_sel_deccck_or_bist_idx = ( data_ecc_active_c4 & ~mbist_run_r1 )| 
				(bist_vuad_rd_en_px2 & mbist_run_r1) ; 
 
 // The following signal is a copy of arb_sel_deccck_or_bist_idx 
 // and is used to disable bypassing of vuad data from the  
 // other stages of the pipe so as to read the array output 
  
 assign	arb_vuadctl_no_bypass_px2 = ( data_ecc_active_c4  & ~mbist_run_r1) | 
                                (bist_vuad_rd_en_px2 & mbist_run_r1 ) ; 
 
 
 assign arb_vuad_idx2_sel_px2_n = ~( arb_stall_c2 | bist_vuad_rd_en_px2 | 
	                               data_ecc_active_c4)  ; 
 
 //assign	sel_stall_vuad_idx = ( arb_stall_c2 | 
				//bist_vuad_rd_en_px2  | 
				//data_ecc_active_c4 ) ; 
 
  
 //////////////////////////////////////////////////////////////////////////////////////////// 
 // VUAD bist related signals. 
 //////////////////////////////////////////////////////////////////////////////////////////// 
 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_bist_enable_c1 
                           (.din(bist_vuad_rd_en_px2), .l1clk(l1clk), 
                        .scan_in(ff_bist_enable_c1_scanin),
                        .scan_out(ff_bist_enable_c1_scanout),
                        .dout(bist_enable_c1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_bist_enable_c2 
                           (.din(bist_enable_c1), .l1clk(l1clk), 
                        .scan_in(ff_bist_enable_c2_scanin),
                        .scan_out(ff_bist_enable_c2_scanout),
                        .dout(bist_enable_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_bist_acc_vd_px2 
                           (.din(bist_acc_vd_px1), .l1clk(l1clk), 
                        .scan_in(ff_bist_acc_vd_px2_scanin),
                        .scan_out(ff_bist_acc_vd_px2_scanout),
                        .dout(bist_acc_vd_px2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_bist_acc_vd_c1 
                           (.din(bist_acc_vd_px2), .l1clk(l1clk), 
                        .scan_in(ff_bist_acc_vd_c1_scanin),
                        .scan_out(ff_bist_acc_vd_c1_scanout),
                        .dout(bist_acc_vd_c1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_bist_acc_vd_c2 
                           (.din(bist_acc_vd_c1), .l1clk(l1clk), 
                        .scan_in(ff_bist_acc_vd_c2_scanin),
                        .scan_out(ff_bist_acc_vd_c2_scanout),
                        .dout(bist_acc_vd_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// 
// assign	arb_acc_vd_c2 = ( arbadr_arbaddr_addr22_c2 & inst_l2vuad_vld_c2 ) | 
//			   ( bist_acc_vd_c2 & bist_enable_c2 ) ; 
// 
// assign	arb_acc_ua_c2 = ( ~arbadr_arbaddr_addr22_c2 & inst_l2vuad_vld_c2 ) | 
//			   ( ~bist_acc_vd_c2 & bist_enable_c2 ) ; 
// 


assign arb_acc_ua_c2 =  bist_enable_c2 ? ~bist_acc_vd_c2 : 
		( ~arbadr_arbaddr_addr22_c2 & inst_l2vuad_vld_c2 );

assign arb_acc_vd_c2 =  bist_enable_c2 ? bist_acc_vd_c2 : 
		( arbadr_arbaddr_addr22_c2 & inst_l2vuad_vld_c2 );
 

  
 
 //////////////////////////////////////////////////////////////////////////////////////////// 
 // Mux selects for arbdata muxes 
 //////////////////////////////////////////////////////////////////////////////////////////// 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_mbist_arb_l2d_en_d1 
               (
		.scan_in(ff_mbist_arb_l2d_en_d1_scanin),
		.scan_out(ff_mbist_arb_l2d_en_d1_scanout),
		.din(mbist_arb_l2d_en), 
		.l1clk(l1clk),
                .dout(mbist_arb_l2d_en_d1),
  .siclk(siclk),
  .soclk(soclk)
		);




 assign	arb_bist_or_diag_acc_c1 =  ( inst_l2data_vld_c2 | mbist_arb_l2d_en_d1 ); 

//assign arb_bist_or_diag_acc_qual_c1 = arb_bist_or_diag_acc_c1 & arb_stall_c1;
  
 
 //////////////////////////////////////////////////////////////////////// 
 // the following signal indicates that the tag array is accessed. 
 // It is asserted aggressively when 
 // // mbf,fbf,snp or iq instructions are valid OR 
 // // when there is a stalled instruction in C1 OR 
 // // when there is a tecc, deccck or diagnostic tag access OR 
 // // when a BIST access is performed. 
 //////////////////////////////////////////////////////////////////////// 
 
 assign	arb_tag_acc_px2 = ( arb_stall_c2|  
				tecc_tag_acc_en_px2 |  
				inst_l2tag_vld_c2 |  
				tag_decc_tag_acc_en_px2 | // may not be reqd?????? 
				 mbf_valid_px2_1 | fbf_valid_px2_1 | snp_valid_px2_1  | 
				iqu_iq_arb_vld_px2 ) ; 
 
 //////////////////////////////////////////////////////////////////////// 
 // arb_normal_tagacc_c2 is used by tagd to either select the dec 
 // way or lru_way  
 // Dec way is used by the following instructions  
 // tecc, tag diagnostic access, data ecc, fill 
 //////////////////////////////////////////////////////////////////////// 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_tag_acc_c1 
                           (.din(arb_tag_acc_px2), .l1clk(l1clk), 
                        .scan_in(ff_arb_tag_acc_c1_scanin),
                        .scan_out(ff_arb_tag_acc_c1_scanout),
                        .dout(arb_tag_acc_c1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	sp_tag_access_px2 = tecc_tag_acc_en_px2 | // tecc tag access 
				inst_l2tag_vld_c2 | // diagnostic tag access 
				tag_decc_tag_acc_en_px2  ; // decc tag access. 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_sp_tag_access_c1 
                           (.din(sp_tag_access_px2), .l1clk(l1clk), 
                        .scan_in(ff_sp_tag_access_c1_scanin),
                        .scan_out(ff_sp_tag_access_c1_scanout),
                        .dout(sp_tag_access_c1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign normal_tagacc_c1= arb_tag_acc_c1  
				& ~sp_tag_access_c1 ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_normal_tagacc_c2 
                           (.din(normal_tagacc_c1), .l1clk(l1clk), 
                        .scan_in(ff_normal_tagacc_c2_scanin),
                        .scan_out(ff_normal_tagacc_c2_scanout),
                        .dout(normal_tagacc_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	arb_normal_tagacc_c2 = normal_tagacc_c2 & ~arb_fill_vld_c2 ; 
 
 
 //////////////////////////////////////////////////////////////////////// 
 // vuad rd access en 
 // Similar to tag access expression minus 
 // tag diagnostic access. 
 //////////////////////////////////////////////////////////////////////// 

 assign arb_vuad_acc_px2 = ((arb_stall_c2 | tag_decc_tag_acc_en_px2 | tecc_tag_acc_en_px2 | 
                             mbf_valid_px2_1 | fbf_valid_px2_1 | snp_valid_px2_1 | iqu_iq_arb_vld_px2 ) & ~mbist_run_r1) | 
                                (bist_vuad_rd_en_px2  & mbist_run_r1) ; 


 
// assign	arb_vuad_acc_px2 = ((arb_stall_c2 | tag_decc_tag_acc_en_px2 | 
//				tecc_tag_acc_en_px2 | 
//				mbf_valid_px2_1 | fbf_valid_px2_1 | snp_valid_px2_1 | 
//				iqu_iq_arb_vld_px2 | arb_vuad_acc_px2) & ~mbist_run_r1) | 
//				( mbist_run_r1 &( bist_vuad_rd_en_px2 | arb_vuad_acc_px2)); 
 
 //////////////////////////////////////////////////////////////////////// 
 // mbcam is asserted for the following conditions 
 // * PX2 instruction from the IQ is valid 
 // * PX2 instruction from the snoop Q is valid. 
 // * C1 instruction is stalled  
 // In case 1 and 2 it is possible that the instruction never got issued 
 // because of a mbf full condition or a copyback Q full condition. 
 // However, the miss buffer cam is still asserted speculatively for 
 // timing reasons.  
 //  
 // The Hit vector generated by the cam operation is appropriately  
 // qualified in misbuf to gate off any false hits due to speculative 
 // camming. 
 //////////////////////////////////////////////////////////////////////// 



l2t_arb_ctl_msff_ctl_macro__width_3 ff_l2t_mb2_run_r1 
              (.din({l2t_mb2_run,mbist_run,l2t_mb2_mbtag_lookup_en}), .l1clk(l1clk),  
		.scan_in(ff_l2t_mb2_run_r1_scanin),
		.scan_out(ff_l2t_mb2_run_r1_scanout),
		.dout({l2t_mb2_run_r1,mbist_run_r1,l2t_mb2_mbtag_lookup_en_r1}),
  .siclk(siclk),
  .soclk(soclk)  
		); 


 
 assign	arb_mb_camen_px2 = l2t_mb2_run_r1 ? l2t_mb2_mbtag_lookup_en_r2 :
				(iqu_iq_arb_vld_px2 |  snp_valid_px2_1 | arb_stall_c2); 
				 
 
 // Miss buffer count is a C4 flop. 
 // Instructions in C1,C2,C3 are inflight ops that can be inserted. 
 // //The instruction in PX2 is picked if atleast 4 entries are available in the MBF. ( mbcount <= 12)  
 // //If PX2 is a block store atleast 11 entries should be availabe in the MBF. ( mb_count <= 5 )  
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_mbfull_px2 
				(.dout(mbfull_px2), .l1clk(l1clk), 
                                  .scan_in(ff_mbfull_px2_scanin),
                                  .scan_out(ff_mbfull_px2_scanout),
                                  .din(misbuf_arb_cnt28_px2_prev),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 assign	gate_off_buf_req_px2 = ( iqu_iq_arb_vld_px2 & atm_instr_c1 ) | // iq atomic instr. 
                            gate_off_prim_req_c1 | // csr instruction in C1. 
                            oqu_arb_full_px2 | // OQ full 
                            arb_stall_c2 ; // stall 
 
 
 assign	mbsel_px2 = mbf_valid_px2_1  & ~snp_valid_px2_1 & dbb_rst_l &  
		~gate_off_buf_req_px2; 
 
 assign	fbsel_px2 = fbf_valid_px2_1 & ~mbf_valid_px2_1  & ~snp_valid_px2_1 & dbb_rst_l & 
		~gate_off_buf_req_px2 ; 
 
 
 assign	snpsel_px2 = snp_valid_px2_1 &  dbb_rst_l &  ~gate_off_buf_req_px2 ; 
 assign	arb_snp_snpsel_px2 = snp_valid_px2_1 &  dbb_rst_l &  ~gate_off_buf_req_px2 ; 
 
// ////// most critical signal in this block  
 assign	iqsel_px2 =  iqu_iq_arb_vld_px2 & dbb_rst_l & (  
                               	( ~(	mbf_valid_px2_1 |  
					fbf_valid_px2_1 |  
					snp_valid_px2_1 ) // no buffer instructions. 
                                  	& ~mbfull_px2 &  // mbf is not full 
                                  	~gate_off_prim_req_c1 &  
				  	~gate_off_prim_req_state & // csr store in the pipe 
	                          	~oqu_arb_full_px2 )  // oqfull in PX2 
	| atm_instr_c1 ) &  // if c1 is atomic IQ has lower priority than only stall_c1. 
	~arb_stall_c2 ; // stall 
 
// Cloning logic for timing fix
//assign	arb_iqsel_px2 = iqsel_px2 ; 

assign arb_iqsel_px2 = iqu_iq_arb_vld_px2 & dbb_rst_l & (
         ( ~(    mbf_valid_px2_1 | fbf_valid_px2_1 | snp_valid_px2_1 ) // no buffer instructions.
         & ~mbfull_px2 &  // mbf is not full
         ~gate_off_prim_req_c1 & ~gate_off_prim_req_state & // csr store in the pipe
         ~oqu_arb_full_px2 )  // oqfull in PX2
        | atm_instr_c1 ) &  // if c1 is atomic IQ has lower priority than only stall_c1.
        ~arb_stall_c2 ; // stall




assign arb_iqsel_px2_phase1 = dbb_rst_l & (
         ( ~(    mbf_valid_px2_1 | fbf_valid_px2_1 | snp_valid_px2_1 ) // no buffer instructions.
         & ~mbfull_px2 &  // mbf is not full
         ~gate_off_prim_req_c1 & ~gate_off_prim_req_state & // csr store in the pipe
         ~oqu_arb_full_px2 )  // oqfull in PX2
        | atm_instr_c1 ) &  // if c1 is atomic IQ has lower priority than only stall_c1.
        ~arb_stall_c2 ; // stall

// assign arb_iqsel_px2_v1 = iqu_iq_arb_vld_px2 & arb_iqsel_px2_phase1;

cl_u1_nand2_16x  nand_arb_iqsel_px2_v1_n
        (
        .out    (arb_iqsel_px2_v1_n),
        .in0    (iqu_iq_arb_vld_px2_v1),
        .in1    (arb_iqsel_px2_phase1)
        );

cl_u1_inv_48x   inv_arb_iqsel_px2_v1
        (
        .out    (arb_iqsel_px2_v1),
        .in     (arb_iqsel_px2_v1_n)
        );

l2t_arb_ctl_msff_ctl_macro__width_1 ff_mbsel_c1 
				(.dout(mbsel_c1), .l1clk(l1clk), 
                                  .scan_in(ff_mbsel_c1_scanin),
                                  .scan_out(ff_mbsel_c1_scanout),
                                  .din(mbsel_px2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	arb_misbuf_mbsel_c1 = mbsel_c1 ; 
 
// int 5.0 changes
//msff_ctl_macro ff_mbsel_c2 (width=1)
//				(.dout(mbsel_c2), .l1clk(l1clk), 
//                                  .din(mbsel_c1),  
//		.scan_in(), 
//		.scan_out()
//); 
// 

l2t_arb_ctl_msff_ctl_macro__width_1 ff_fbsel_c1 
				(.dout(fbsel_c1), .l1clk(l1clk), 
                                  .scan_in(ff_fbsel_c1_scanin),
                                  .scan_out(ff_fbsel_c1_scanout),
                                  .din(fbsel_px2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	arb_filbuf_fbsel_c1 = fbsel_c1 ; 
 
// int 5.0 changes
//msff_ctl_macro ff_fbsel_c2 (width=1)
//				(.dout(fbsel_c2), .l1clk(l1clk), 
//                                  .din(fbsel_c1),  
//		.scan_in(), 
//		.scan_out()
//); 

 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_snpsel_c1 
				(.dout(snpsel_c1), .l1clk(l1clk), 
                                   .scan_in(ff_snpsel_c1_scanin),
                                   .scan_out(ff_snpsel_c1_scanout),
                                   .din(snpsel_px2),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_snpsel_c2 
				(.dout(snpsel_c2), .l1clk(l1clk), 
                                   .scan_in(ff_snpsel_c2_scanin),
                                   .scan_out(ff_snpsel_c2_scanout),
                                   .din(snpsel_c1),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_snpsel_c3 
				(.dout(snpsel_c3), .l1clk(l1clk), 
                                   .scan_in(ff_snpsel_c3_scanin),
                                   .scan_out(ff_snpsel_c3_scanout),
                                   .din(snpsel_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// assign	arb_snpsel_c1 = snpsel_c1 ; 
 
//////////////////////////////////////////////////////////////// 
// mux selects for dir cam address 
// An eviction is turned off in C3 if a  
// parity error is detected during the eviction operation. 
//////////////////////////////////////////////////////////////// 
 
 assign	arb_evict_vld_c2 = mbist_run_r1 ? 1'b0 : (dec_evict_c2 & arb_inst_vld_c2_6); 
 
 // eviction address vs normal addresses 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_evict_c3 
                           (.din(arb_evict_vld_c2), .l1clk(l1clk), 
                 .scan_in(ff_arb_evict_c3_scanin),
                 .scan_out(ff_arb_evict_c3_scanout),
                 .dout(arb_evict_unqual_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	arb_evict_c3 = arb_evict_unqual_c3 & ~tagdp_arb_par_err_c3 & ~arb_vuad_ce_err_c3; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_evict_c4 
                           (.din(arb_evict_c3), .l1clk(l1clk), 
                 .scan_in(ff_arb_evict_c4_scanin),
                 .scan_out(ff_arb_evict_c4_scanout),
                 .dout(arb_evict_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_evict_c5 
                           (.din(arb_evict_c4), .l1clk(l1clk), 
                 .scan_in(ff_arb_evict_c5_scanin),
                 .scan_out(ff_arb_evict_c5_scanout),
                 .dout(arb_evict_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 assign	arb_imiss_vld_c2 = mbist_run_r1 ? 1'b0 : arb_decdp_imiss_inst_c2 & arb_inst_vld_c2_6 ; 
  
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_imiss_inst_c3 
                           (.din(arb_decdp_imiss_inst_c2), .l1clk(l1clk), 
                 .scan_in(ff_imiss_inst_c3_scanin),
                 .scan_out(ff_imiss_inst_c3_scanout),
                 .dout(imiss_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	imiss_hit_c3 = imiss_inst_c3 & tag_hit_l2orfb_c3 ; 
 
 // c4 vs c3 addresses. 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_imiss_hit_c4 
                           (.din(imiss_hit_c3), .l1clk(l1clk), 
                 .scan_in(ff_arb_imiss_hit_c4_scanin),
                 .scan_out(ff_arb_imiss_hit_c4_scanout),
                 .dout(arb_imiss_hit_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
//////////////////////////////////////////////////////////////// 
// mux selects for imiss address for err  
// reporting. 
// Used to determine if the C7 or C8 address should be chosen for error logging. 
//////////////////////////////////////////////////////////////// 
  
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_imiss_hit_c5 
                           (.din(arb_imiss_hit_c4), .l1clk(l1clk), 
                 .scan_in(ff_arb_imiss_hit_c5_scanin),
                 .scan_out(ff_arb_imiss_hit_c5_scanout),
                 .dout(arb_imiss_hit_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_imiss_hit_c52 
                           (.din(arb_imiss_hit_c5), .l1clk(l1clk),
                 .scan_in(ff_arb_imiss_hit_c52_scanin),
                 .scan_out(ff_arb_imiss_hit_c52_scanout),
                 .dout(arb_imiss_hit_c52),
  .siclk(siclk),
  .soclk(soclk)  
);
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_imiss_hit_c6 
                           (.din(arb_imiss_hit_c52), .l1clk(l1clk), 
                 .scan_in(ff_arb_imiss_hit_c6_scanin),
                 .scan_out(ff_arb_imiss_hit_c6_scanout),
                 .dout(arb_imiss_hit_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
  
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_imiss_hit_c7 
                           (.din(arb_imiss_hit_c6), .l1clk(l1clk), 
                 .scan_in(ff_arb_imiss_hit_c7_scanin),
                 .scan_out(ff_arb_imiss_hit_c7_scanout),
                 .dout(arb_imiss_hit_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_imiss_hit_c8 
                           (.din(arb_imiss_hit_c7), .l1clk(l1clk), 
                 .scan_in(ff_arb_imiss_hit_c8_scanin),
                 .scan_out(ff_arb_imiss_hit_c8_scanout),
                 .dout(arb_imiss_hit_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_imiss_hit_c9 
                           (.din(arb_imiss_hit_c8), .l1clk(l1clk), 
                 .scan_in(ff_arb_imiss_hit_c9_scanin),
                 .scan_out(ff_arb_imiss_hit_c9_scanout),
                 .dout(arb_imiss_hit_c9),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_imiss_hit_c10 
                           (.din(arb_imiss_hit_c9), .l1clk(l1clk), 
                 .scan_in(ff_arb_imiss_hit_c10_scanin),
                 .scan_out(ff_arb_imiss_hit_c10_scanout),
                 .dout(arb_imiss_hit_c10),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 //////////////////////////////////////////////////////////////////// 
 // Decode based on address. 
 //////////////////////////////////////////////////////////////////// 
 
 // Fix for bug#3789 
 // an interrupt issued with a diagnostic address is not  
 // marked as a diagnostic instruction. 
 
 assign arb_inst_diag_c1 = arb_inst_vld_c1_1 & 
		~( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `INT_RQ ) & 
			// int 5.0 changes
                        // ( arbadr_arbdp_ioaddr_c1[39:37] == 3'h5 );  // A0-BF 
			   ( arbadr_arbdp_ioaddr_c1_39to37[39:37] == 3'h5 );  // A0-BF


l2t_arb_ctl_msff_ctl_macro__width_2 ff_arb_inst_diag_c2 	// VUAD ecc changes
                           (.din({arb_inst_diag_c1,decdp_inst_int_or_inval_c1}), .l1clk(l1clk), 
                 .scan_in(ff_arb_inst_diag_c2_scanin),
                 .scan_out(ff_arb_inst_diag_c2_scanout),
                 .dout({arb_inst_diag_c2,decdp_inst_int_or_inval_c2}),
  .siclk(siclk),
  .soclk(soclk)  
); 

 //assign arb_int_or_diag_acc_c1 = ( arb_inst_diag_c1 |  
			//decdp_inst_int_or_inval_c1 ) ; // all instructions that do not insert in mbf 
 
  //A8 and above. 
 assign arb_inst_csr_c1 = arb_inst_diag_c1 & 
                                // int 5.0 changes arbadr_arbdp_ioaddr_c1[35] ; 
				arbadr_arbdp_ioaddr_c1_35to33[35];
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_csr_c1 
                           (.din(arb_inst_csr_c1), .l1clk(l1clk), 
                 .scan_in(ff_arb_inst_csr_c1_scanin),
                 .scan_out(ff_arb_inst_csr_c1_scanout),
                 .dout(arb_inst_csr_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
  // A0, A1, A2, A3 
 assign arb_inst_l2data_c1 = arb_inst_diag_c1 &  
		// int 5.0 changes ~arbadr_arbdp_ioaddr_c1[35] & ~arbadr_arbdp_ioaddr_c1[34] ; 
			~arbadr_arbdp_ioaddr_c1_35to33[35] & ~arbadr_arbdp_ioaddr_c1_35to33[34] ;
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_l2data_c2 
                           (.din(arb_inst_l2data_c1), .l1clk(l1clk), 
                 .scan_in(ff_arb_inst_l2data_c2_scanin),
                 .scan_out(ff_arb_inst_l2data_c2_scanout),
                 .dout(arb_inst_l2data_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	inst_l2data_vld_c2 = arb_inst_l2data_c2 & arb_inst_vld_c2_6; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_inst_l2data_vld_c3 
                           (.din(inst_l2data_vld_c2), .l1clk(l1clk), 
                 .scan_in(ff_inst_l2data_vld_c3_scanin),
                 .scan_out(ff_inst_l2data_vld_c3_scanout),
                 .dout(inst_l2data_vld_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_inst_l2data_vld_c4 
                           (.din(inst_l2data_vld_c3), .l1clk(l1clk), 
                 .scan_in(ff_inst_l2data_vld_c4_scanin),
                 .scan_out(ff_inst_l2data_vld_c4_scanout),
                 .dout(inst_l2data_vld_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_inst_l2data_vld_c5 
                           (.din(inst_l2data_vld_c4), .l1clk(l1clk), 
                 .scan_in(ff_inst_l2data_vld_c5_scanin),
                 .scan_out(ff_inst_l2data_vld_c5_scanout),
                 .dout(inst_l2data_vld_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_arb_ctl_msff_ctl_macro__width_1 ff_inst_l2data_vld_c52 
                           (.din(inst_l2data_vld_c5), .l1clk(l1clk),
                 .scan_in(ff_inst_l2data_vld_c52_scanin),
                 .scan_out(ff_inst_l2data_vld_c52_scanout),
                 .dout(inst_l2data_vld_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_arb_ctl_msff_ctl_macro__width_1 ff_inst_l2data_vld_c6 
                           (.din(inst_l2data_vld_c52), .l1clk(l1clk), 
                 .scan_in(ff_inst_l2data_vld_c6_scanin),
                 .scan_out(ff_inst_l2data_vld_c6_scanout),
                 .dout(inst_l2data_vld_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	arb_inst_l2data_vld_c6 = inst_l2data_vld_c6 ; 
 
 ////////////////////////////////////////// 
 // csr store signal is used to 
 // enqueue or dequeue an instruction from 
 // the miss buffer. 
 ////////////////////////////////////////// 
 
 
 assign	arb_csr_st_c2 = arb_inst_csr_c2 & decdp_st_inst_c2_1 ; 
 
 
 
 assign	arb_csr_wr_en_c2 = arb_csr_st_c2 & 	 
			arbdec_arbdp_inst_mb_c2  & 
			arb_inst_vld_c2_6 ; 
  
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_csr_wr_en_c3 
                           (.din(arb_csr_wr_en_c2), .l1clk(l1clk), 
                 .scan_in(ff_arb_csr_wr_en_c3_scanin),
                 .scan_out(ff_arb_csr_wr_en_c3_scanout),
                 .dout(arb_csr_wr_en_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_csr_wr_en_c3_1 
                           (.din(arb_csr_wr_en_c2), .l1clk(l1clk), 
                 .scan_in(ff_arb_csr_wr_en_c3_1_scanin),
                 .scan_out(ff_arb_csr_wr_en_c3_1_scanout),
                 .dout(arb_csr_wr_en_c3_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_csr_wr_en_c4 
                           (.din(arb_csr_wr_en_c3_1), .l1clk(l1clk), 
                 .scan_in(ff_arb_csr_wr_en_c4_scanin),
                 .scan_out(ff_arb_csr_wr_en_c4_scanout),
                 .dout(arb_csr_wr_en_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_csr_wr_en_c5 
                           (.din(arb_csr_wr_en_c4), .l1clk(l1clk), 
                 .scan_in(ff_arb_csr_wr_en_c5_scanin),
                 .scan_out(ff_arb_csr_wr_en_c5_scanout),
                 .dout(arb_csr_wr_en_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_csr_wr_en_c52 
                           (.din(arb_csr_wr_en_c5), .l1clk(l1clk),
                 .scan_in(ff_arb_csr_wr_en_c52_scanin),
                 .scan_out(ff_arb_csr_wr_en_c52_scanout),
                 .dout(arb_csr_wr_en_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_csr_wr_en_c6 
                           (.din(arb_csr_wr_en_c52), .l1clk(l1clk), 
                 .scan_in(ff_arb_csr_wr_en_c6_scanin),
                 .scan_out(ff_arb_csr_wr_en_c6_scanout),
                 .dout(arb_csr_wr_en_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_csr_wr_en_c7 
                           (.din(arb_csr_wr_en_c6), .l1clk(l1clk), 
                 .scan_in(ff_arb_csr_wr_en_c7_scanin),
                 .scan_out(ff_arb_csr_wr_en_c7_scanout),
                 .dout(arb_csr_wr_en_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_csr_wr_en_c8 
                           (.din(arb_csr_wr_en_c7), .l1clk(l1clk), 
                 .scan_in(ff_arb_csr_wr_en_c8_scanin),
                 .scan_out(ff_arb_csr_wr_en_c8_scanout),
                 .dout(arb_csr_wr_en_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
  assign arb_csr_rd_en_c2 = arb_inst_csr_c2 & arb_decdp_ld_inst_c2 & 
				arb_inst_vld_c2_6; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_csr_rd_en_c3 
                           (.din(arb_csr_rd_en_c2), .l1clk(l1clk), 
                 .scan_in(ff_arb_csr_rd_en_c3_scanin),
                 .scan_out(ff_arb_csr_rd_en_c3_scanout),
                 .dout(arb_csr_rd_en_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_csr_rd_en_c4 
                           (.din(arb_csr_rd_en_c3), .l1clk(l1clk), 
                 .scan_in(ff_arb_csr_rd_en_c4_scanin),
                 .scan_out(ff_arb_csr_rd_en_c4_scanout),
                 .dout(arb_csr_rd_en_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_csr_rd_en_c5 
                           (.din(arb_csr_rd_en_c4), .l1clk(l1clk), 
                 .scan_in(ff_arb_csr_rd_en_c5_scanin),
                 .scan_out(ff_arb_csr_rd_en_c5_scanout),
                 .dout(arb_csr_rd_en_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_csr_rd_en_c52 
                           (.din(arb_csr_rd_en_c5), .l1clk(l1clk),
                 .scan_in(ff_arb_csr_rd_en_c52_scanin),
                 .scan_out(ff_arb_csr_rd_en_c52_scanout),
                 .dout(arb_csr_rd_en_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_csr_rd_en_c6 
                           (.din(arb_csr_rd_en_c52), .l1clk(l1clk), 
                 .scan_in(ff_arb_csr_rd_en_c6_scanin),
                 .scan_out(ff_arb_csr_rd_en_c6_scanout),
                 .dout(arb_csr_rd_en_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_csr_rd_en_c7 
                           (.din(arb_csr_rd_en_c6), .l1clk(l1clk), 
                 .scan_in(ff_arb_csr_rd_en_c7_scanin),
                 .scan_out(ff_arb_csr_rd_en_c7_scanout),
                 .dout(arb_csr_rd_en_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 //////////////////////// 
 // data diagnostic store for R/W calculation 
 //////////////////////// 
 assign	arb_data_diag_st_c2 = inst_l2data_vld_c2 & decdp_st_inst_c2_1 ; 
 
 
  // A4 or A5 
 assign arb_inst_l2tag_c1 = arb_inst_diag_c1 &  
// int 5.0 changes 	~arbadr_arbdp_ioaddr_c1[35] & arbadr_arbdp_ioaddr_c1[34] & 	 
// 			~arbadr_arbdp_ioaddr_c1[33] ; 
			 ~arbadr_arbdp_ioaddr_c1_35to33[35] & arbadr_arbdp_ioaddr_c1_35to33[34] &
			 ~arbadr_arbdp_ioaddr_c1_35to33[33];
 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_l2tag_c2 
                           (.din(arb_inst_l2tag_c1), .l1clk(l1clk), 
                 .scan_in(ff_arb_inst_l2tag_c2_scanin),
                 .scan_out(ff_arb_inst_l2tag_c2_scanout),
                 .dout(arb_inst_l2tag_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
	 
 assign	inst_l2tag_vld_c2 = arb_inst_l2tag_c2 & arb_inst_vld_c2_6 ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_l2tag_c2_1 
                           (.din(arb_inst_l2tag_c1), .l1clk(l1clk), 
                 .scan_in(ff_arb_inst_l2tag_c2_1_scanin),
                 .scan_out(ff_arb_inst_l2tag_c2_1_scanout),
                 .dout(arb_inst_l2tag_c2_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
	 
 assign	inst_l2tag_vld_c2_1 = arb_inst_l2tag_c2_1 & arb_inst_vld_c2_6 ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_inst_l2tag_vld_c3 
                           (.din(inst_l2tag_vld_c2), .l1clk(l1clk), 
                 .scan_in(ff_inst_l2tag_vld_c3_scanin),
                 .scan_out(ff_inst_l2tag_vld_c3_scanout),
                 .dout(inst_l2tag_vld_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_inst_l2tag_vld_c4 
                           (.din(inst_l2tag_vld_c3), .l1clk(l1clk), 
                 .scan_in(ff_inst_l2tag_vld_c4_scanin),
                 .scan_out(ff_inst_l2tag_vld_c4_scanout),
                 .dout(inst_l2tag_vld_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	arb_l2tag_vld_c4 = inst_l2tag_vld_c4 ; // to tagd. 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_inst_l2tag_vld_c5 
                           (.din(inst_l2tag_vld_c4), .l1clk(l1clk), 
                 .scan_in(ff_inst_l2tag_vld_c5_scanin),
                 .scan_out(ff_inst_l2tag_vld_c5_scanout),
                 .dout(inst_l2tag_vld_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_arb_ctl_msff_ctl_macro__width_1 ff_inst_l2tag_vld_c52 
                           (.din(inst_l2tag_vld_c5), .l1clk(l1clk),
                 .scan_in(ff_inst_l2tag_vld_c52_scanin),
                 .scan_out(ff_inst_l2tag_vld_c52_scanout),
                 .dout(inst_l2tag_vld_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_inst_l2tag_vld_c6 
                           (.din(inst_l2tag_vld_c52), .l1clk(l1clk), 
                 .scan_in(ff_inst_l2tag_vld_c6_scanin),
                 .scan_out(ff_inst_l2tag_vld_c6_scanout),
                 .dout(inst_l2tag_vld_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
	 
 assign	arb_inst_l2tag_vld_c6 = inst_l2tag_vld_c6 ; 
   
 
 
  // A6 or A7 
 assign arb_inst_l2vuad_c1 = arb_inst_diag_c1 &  

// int 5.0 changes	~arbadr_arbdp_ioaddr_c1[35] & arbadr_arbdp_ioaddr_c1[34] & 	 
//			arbadr_arbdp_ioaddr_c1[33]; 
			~arbadr_arbdp_ioaddr_c1_35to33[35] & arbadr_arbdp_ioaddr_c1_35to33[34]  &
			arbadr_arbdp_ioaddr_c1_35to33[33];	
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_l2vuad_c2 
                (.din(arb_inst_l2vuad_c1), .l1clk(l1clk), 
                 .scan_in(ff_arb_inst_l2vuad_c2_scanin),
                 .scan_out(ff_arb_inst_l2vuad_c2_scanout),
                 .dout(arb_inst_l2vuad_c2),
  .siclk(siclk),
  .soclk(soclk)  
		); 
 
assign inst_l2vuad_vld_c2 = arb_inst_l2vuad_c2 & arb_inst_vld_c2_7 & ~mbist_run_r1; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_inst_l2vuad_vld_c3 
                           (.din(inst_l2vuad_vld_c2), .l1clk(l1clk), 
                 .scan_in(ff_inst_l2vuad_vld_c3_scanin),
                 .scan_out(ff_inst_l2vuad_vld_c3_scanout),
                 .dout(inst_l2vuad_vld_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
  assign	arb_inst_l2vuad_vld_c3 = inst_l2vuad_vld_c3 ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_inst_l2vuad_vld_c4 
                           (.din(inst_l2vuad_vld_c3), .l1clk(l1clk), 
                 .scan_in(ff_inst_l2vuad_vld_c4_scanin),
                 .scan_out(ff_inst_l2vuad_vld_c4_scanout),
                 .dout(inst_l2vuad_vld_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_inst_l2vuad_vld_c5 
                           (.din(inst_l2vuad_vld_c4), .l1clk(l1clk), 
                 .scan_in(ff_inst_l2vuad_vld_c5_scanin),
                 .scan_out(ff_inst_l2vuad_vld_c5_scanout),
                 .dout(inst_l2vuad_vld_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_arb_ctl_msff_ctl_macro__width_1 ff_inst_l2vuad_vld_c52 
                           (.din(inst_l2vuad_vld_c5), .l1clk(l1clk),
                 .scan_in(ff_inst_l2vuad_vld_c52_scanin),
                 .scan_out(ff_inst_l2vuad_vld_c52_scanout),
                 .dout(inst_l2vuad_vld_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_inst_l2vuad_vld_c6 
                           (.din(inst_l2vuad_vld_c52), .l1clk(l1clk), 
                 .scan_in(ff_inst_l2vuad_vld_c6_scanin),
                 .scan_out(ff_inst_l2vuad_vld_c6_scanout),
                 .dout(inst_l2vuad_vld_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
  assign	arb_inst_l2vuad_vld_c6 = inst_l2vuad_vld_c6 ; 
   
  assign  arb_diag_complete_c3 = inst_l2vuad_vld_c3 | 
				inst_l2tag_vld_c3 | 
				inst_l2data_vld_c3; 
 
 
 
 
//////////////////////////////////////////////////////////// 
// refer to scrub pipeline 
// The following signal tag_deccck_data_sel_c8 is used to 
// select between store data and deccck scrub data. 
///////////////////////////////////////////////////////////// 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_deccck_data_sel_c9 
                           (.din(tag_deccck_data_sel_c8), .l1clk(l1clk), 
             .scan_in(ff_deccck_data_sel_c9_scanin),
             .scan_out(ff_deccck_data_sel_c9_scanout),
             .dout(arb_decc_data_sel_c9),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 
 //////////////////////////////////////////////////////////////////////////// 
 // CAs compare results and control signal 
 // to misbuf. 
 // arb_misbuf_ctrue_c9 is the compare result. 
 // arb_misbuf_cas1_hit_c8 is the qualifier. 
 //////////////////////////////////////////////////////////////////////////// 
 
 assign	lower_cas_c8 = arbdec_size_field_c8[1] & ~arbdec_size_field_c8[0] & arbadr_addr2_c8 ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_lower_cas_c9 
                           (.din(lower_cas_c8), .l1clk(l1clk), 
             .scan_in(ff_lower_cas_c9_scanin),
             .scan_out(ff_lower_cas_c9_scanout),
             .dout(lower_cas_c9),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	upper_cas_c8 = ~arbdec_size_field_c8[1] & arbdec_size_field_c8[0] & ~arbadr_addr2_c8 ; 
         // BS and SR 11/12/03 N2 Xbar Packet format change
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_upper_cas_c9 
                           (.din(upper_cas_c8), .l1clk(l1clk), 
             .scan_in(ff_upper_cas_c9_scanin),
             .scan_out(ff_upper_cas_c9_scanout),
             .dout(upper_cas_c9),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_word_lower_cmp_c9 
                           (.din(arbdat_word_lower_cmp_c8), .l1clk(l1clk), 
             .scan_in(ff_word_lower_cmp_c9_scanin),
             .scan_out(ff_word_lower_cmp_c9_scanout),
             .dout(word_lower_cmp_c9),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_word_upper_cmp_c9 
                           (.din(arbdat_word_upper_cmp_c8), .l1clk(l1clk), 
             .scan_in(ff_word_upper_cmp_c9_scanin),
             .scan_out(ff_word_upper_cmp_c9_scanout),
             .dout(word_upper_cmp_c9),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 assign	cmp_lower_c9 =  word_lower_cmp_c9 & lower_cas_c9; 
 
 assign	cmp_upper_c9 = word_upper_cmp_c9 & upper_cas_c9; 
 
 assign	cmp_dword_c9 =  word_lower_cmp_c9 & word_upper_cmp_c9 ; 
 
 assign	arb_misbuf_ctrue_c9 =  ( cmp_dword_c9 | cmp_lower_c9 | cmp_upper_c9 )  ; 
 
 assign	arb_misbuf_cas1_hit_c8 =  decdp_cas1_inst_c8 & hit_l2orfb_c8 ; 
  
 
 //////////////////////////////////////////////////////////////////////////////////// 
 // tecc count is maintained 
 // here. The tag ecc pipeline is as follows. 
 // 
 //-------------------------------------------------------- 
 //	C1(tecc inst	C2(setup tag read  
 //	   from mb or 	   of corrupted 
 //	   snpiQ)	   idx  
 //			 
 //			   store affected 
 //			   idx in arbaddr 
 //				 
 //			   start 
 //			   counting. 
 //-------------------------------------------------------- 
 // 
 // 
 //------------------------------------------------------------------------------- 
 // count<2:0>  1(px2)	2(c1)	3(c2)	4(c3)	5(c4)	6(px2)	7(c1)	8 
 //------------------------------------------------------------------------------- 
 // action 	setup  	tagrd   setup	mux 	corre	setup	tagwr	do nothing 
 //		idx	   	muxsel	tag 	tag 	wr	 
 //							idx 
 //------------------------------------------------------------------------------- 
 // STALL lasts for 128 cycles. 
 // When the counter is 1 or 6, the tag_acc_px2 needs to be enabled  
 // for a tagecc operation. If an instruction is present in C1, the  
 // tag will be enabled for the entire duration of the tag ecc operation. 
 //////////////////////////////////////////////////////////////////////////////////// 
 
  
 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_tecc_inst_c2 
                           (.din(arbdp_tecc_inst_c1), .l1clk(l1clk),  
                        .scan_in(ff_tecc_inst_c2_scanin),
                        .scan_out(ff_tecc_inst_c2_scanout),
                        .dout(tecc_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
  
// int 5.0 changes 

  assign inc_tag_ecc_cnt_c2 = ( tecc_inst_c2 & arb_inst_vld_c2_7 ) |
                                        (|( tecc_st_cnt )) ;
 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_inc_tag_ecc_cnt_c3 
                           (.din(inc_tag_ecc_cnt_c2), .l1clk(l1clk),  
                        .scan_in(ff_inc_tag_ecc_cnt_c3_scanin),
                        .scan_out(ff_inc_tag_ecc_cnt_c3_scanout),
                        .dout(inc_tag_ecc_cnt_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
  assign	tecc_st_cnt_plus1 = tecc_st_cnt + 8'b1 ; 
 
  assign	tecc_st_cnt_reset = ~dbb_rst_l | 
				    ~dbginit_l |  
				    (tecc_st_cnt == 8'b1111111 ); 
 
l2t_arb_ctl_msff_ctl_macro__clr_1__en_1__width_8 ff_tag_ecc_fsm_count  // sync reset active high
                           (.din(tecc_st_cnt_plus1[7:0]), 
                 .scan_in(ff_tag_ecc_fsm_count_scanin),
                 .scan_out(ff_tag_ecc_fsm_count_scanout),
                 .en(inc_tag_ecc_cnt_c2), .l1clk(l1clk), .clr(tecc_st_cnt_reset), 
                 .dout(tecc_st_cnt[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 

   
// int 5.0 changes
// msff_ctl_macro ff_arb_tecc_way_c2 (width=4,en=1,clr=1) // sync reset active high
//                            (.din(tecc_st_cnt_plus1[6:3]), 
//                  .en(inc_tag_ecc_cnt_c2), .l1clk(l1clk), .clr(tecc_st_cnt_reset), 
//                  .dout(arb_tecc_way_c2[3:0]),  
//		.scan_in(), 
//		.scan_out()
//); 

assign        arb_tecc_way_c2 = tecc_st_cnt[6:3] ; // tecc way // int 5.0 changes
   
assign	scrub_fsm_count_eq_5_px1  = (tecc_st_cnt[2:0] == 3'd5) ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_scrub_fsm_count_eq_6_px2 
                           (.din(scrub_fsm_count_eq_5_px1), 
                  .scan_in(ff_scrub_fsm_count_eq_6_px2_scanin),
                  .scan_out(ff_scrub_fsm_count_eq_6_px2_scanout),
                  .l1clk(l1clk),  
                 .dout(scrub_fsm_count_eq_6_px2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
  assign	scrub_fsm_count_eq_0_px1  = (tecc_st_cnt[2:0] == 3'd0) & 
					inc_tag_ecc_cnt_c2 ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_scrub_fsm_count_eq_1_px2 
                           (.din(scrub_fsm_count_eq_0_px1), 
                  .scan_in(ff_scrub_fsm_count_eq_1_px2_scanin),
                  .scan_out(ff_scrub_fsm_count_eq_1_px2_scanout),
                  .l1clk(l1clk),  
                 .dout(scrub_fsm_count_eq_1_px2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
  assign tecc_tag_acc_en_px1 =  (( tecc_st_cnt[2:0] == 3'd0 )  & inc_tag_ecc_cnt_c2 ) | 
				( tecc_st_cnt[2:0] == 3'd5 ); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_tecc_tag_acc_en_px2 
                           (.din(tecc_tag_acc_en_px1), .l1clk(l1clk),  
                        .scan_in(ff_tecc_tag_acc_en_px2_scanin),
                        .scan_out(ff_tecc_tag_acc_en_px2_scanout),
                        .dout(tecc_tag_acc_en_px2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
  assign	arb_tagd_tecc_c1 = ( tecc_st_cnt[2:0] == 3'd2 ); 
 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_tagd_tecc_c2 
                           (.din(arb_tagd_tecc_c1), .l1clk(l1clk),  
                        .scan_in(ff_arb_tagd_tecc_c2_scanin),
                        .scan_out(ff_arb_tagd_tecc_c2_scanout),
                        .dout(arb_tagd_tecc_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// int 5.0 changes
// assign	arb_tecc_way_c2 = tecc_st_cnt[6:3] ; // tecc way. 
 
 
 /////////////////////////////////////////////////////////////////////// 
 // tag is written if 
 // - a Fill instruction is allowed to issue in PX2 and is not superceded  
 // by a stall condition or  diag/tecc/deccck active. 
 // - A diagnostic tag write in C2 
 // _ Tecc tag write state. 
 // - Fill stalled in C1 but not superceded by diag/tecc/deccck  active. 
 //////////////////////////////////////////////////////////////////////// 
 
 
 
 // Used to select between the way and wrdata of a C1 instruction vs 
 // a tecc or diagnostic instruction. 
 assign	arb_diag_or_tecc_write_px2 = (decdp_st_inst_c2_1 & inst_l2tag_vld_c2_1 ) | 
				scrub_fsm_count_eq_6_px2 ; 
 
 assign	diag_or_scr_way_sel = inst_l2tag_vld_c2_1 |  scrub_fsm_count_eq_6_px2 ; 
 
 assign	diag_or_tecc_acc_px2 = (inst_l2tag_vld_c2_1 ) | 
				scrub_fsm_count_eq_6_px2 | 
				scrub_fsm_count_eq_1_px2 | 
				data_ecc_active_c4 ; 
 
 assign arb_sel_diag_tag_addr_px2 = diag_or_tecc_acc_px2 ; 
	                         
//////////////////////////////////////////////////////////////////////////////
//  Fix for atpg : ECO ID 106991
//////////////////////////////////////////////////////////////////////////////
// assign	arb_sel_lkup_stalled_tag_px2 = ( arb_stall_c2 |  
//	(inst_l2tag_vld_c2_1  | scrub_fsm_count_eq_6_px2 | scrub_fsm_count_eq_1_px2 | data_ecc_active_c4))  ; 
//


assign	arb_sel_lkup_stalled_tag_px2 = (( arb_stall_c2 |  
	(inst_l2tag_vld_c2_1  | scrub_fsm_count_eq_6_px2 | scrub_fsm_count_eq_1_px2 | data_ecc_active_c4)) | tcu_scan_en ) ; 
	                         
			 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_diag_or_tecc_acc_c1 
                           (.din(diag_or_tecc_acc_px2), .l1clk(l1clk),  
                        .scan_in(ff_diag_or_tecc_acc_c1_scanin),
                        .scan_out(ff_diag_or_tecc_acc_c1_scanout),
                        .dout(diag_or_tecc_acc_c1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// int 5.0 changes
// assign	sel_fill_wr_px2  = fbsel_px2 &  ~diag_or_tecc_acc_px2 ; 
 assign	sel_fill_wr_px2  = fbsel_px2 &  ~diag_or_tecc_acc_px2 & ~l2_bypass_mode_on_d1; 

 // BS 04/28/04 sync up with N1 TO 1.0
 assign        arbdec_arbdp_inst_fb_c1_qual =  arbdec_arbdp_inst_fb_c1 & arb_inst_vld_c1_1; 
 
 // A fill will write into the tag in C1 instead of in PX2 if 
 // the fill is stalled in C1 due to a deccck, tecc or tag diagnostic access. 
 // This means that one cycle after the tecc, deccck or diagnostic operation  
 // finishes accessing the tag, the fill in C1 will access the tag. 
 
// int 5.0 changes
// assign sel_delayed_fill_wr_c1 = arbdec_arbdp_inst_fb_c1 &  diag_or_tecc_acc_c1  & 
//				 ~diag_or_tecc_acc_px2 ; 
 
 assign sel_delayed_fill_wr_c1 = arbdec_arbdp_inst_fb_c1_qual &  diag_or_tecc_acc_c1  & 
				 ~diag_or_tecc_acc_px2  & ~l2_bypass_mode_on_d1 ; 


 assign	arb_tag_wr_px2 = sel_fill_wr_px2 | 
			arb_diag_or_tecc_write_px2 | // diagnostic or tecc write. 
			sel_delayed_fill_wr_c1 ; 
										   // cyc after. 

// int 5.0 changes
 // added POST_4.0 for bug #3897. If mbist is ON when a diagnostic 
 // write is issued to turn it off, the Mbist write should take precedence over
 // the diagnostic access.

 assign arb_tag_rd_px2 = ~arb_tag_wr_px2 
                                & arb_tag_acc_px2    
                                & ~mbist_arb_l2t_write ;


 
 assign	arb_sel_way_px2 = ~sel_delayed_fill_wr_c1 & ~diag_or_tecc_acc_px2 ; 
				 
 
 ////////////////////////////////////////////////////////// 
 // way for tag writes is determined here. 
 ////////////////////////////////////////////////////////// 
 
l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux1_tag_way_px 
			(.dout ( tag_diag_or_tecc_way_c2[3:0] ) , // diag or tag write way 
                        .din0(tecc_st_cnt[6:3]),			// tecc way counter 
                        .din1(arbadr_arbdp_diag_wr_way_c2[3:0] ),	// diagnostic way 
                        .sel0(inc_tag_ecc_cnt_c3),		// tecc under process 
                        .sel1(~inc_tag_ecc_cnt_c3));		// default 
 
l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux2_tag_way_px 
			(.dout (stalled_tag[3:0]) , // stalled or diag or tag write way 
                        .din0(tag_diag_or_tecc_way_c2[3:0]),	// diag or tag tecc way counter 
                        .din1(arbdec_arbdp_inst_way_c1[3:0] ),		// stalled instr way 
                        .sel0(diag_or_scr_way_sel),	// diag or tecc under process 
                        .sel1(~diag_or_scr_way_sel));	// default 
 
l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux3_tag_way_px 
			(.dout (enc_tag_way_px2[3:0]) , // stalled or diag or tag write way 
                        .din0(stalled_tag[3:0]),	// diag or tag tecc way counter or stalled way 
                        .din1(filbuf_arbdp_way_px2[3:0] ),		// fbtag  
                        .sel0(~arb_sel_way_px2),	 
                        .sel1(arb_sel_way_px2));	 
 
//////////////////////////////////////////////////////////////////////////////// 
// Decode the tag way here 
//////////////////////////////////////////////////////////////////////////////// 
 
assign  dec_lo_way_sel_c1[0] = ( enc_tag_way_px2[1:0]==2'd0 ) ; 
assign  dec_lo_way_sel_c1[1] = ( enc_tag_way_px2[1:0]==2'd1 ) ; 
assign  dec_lo_way_sel_c1[2] = ( enc_tag_way_px2[1:0]==2'd2 ) ; 
assign  dec_lo_way_sel_c1[3] = ( enc_tag_way_px2[1:0]==2'd3 ) ; 
 
assign  dec_hi_way_sel_c1[0] = ( enc_tag_way_px2[3:2]==2'd0 ) ; 
assign  dec_hi_way_sel_c1[1] = ( enc_tag_way_px2[3:2]==2'd1 ) ; 
assign  dec_hi_way_sel_c1[2] = ( enc_tag_way_px2[3:2]==2'd2 ) ; 
assign  dec_hi_way_sel_c1[3] = ( enc_tag_way_px2[3:2]==2'd3 ) ; 
 
 
assign  arb_tag_way_px2[0] = dec_hi_way_sel_c1[0] & dec_lo_way_sel_c1[0] ; // 0000 
assign  arb_tag_way_px2[1] = dec_hi_way_sel_c1[0] & dec_lo_way_sel_c1[1] ; // 0001 
assign  arb_tag_way_px2[2] = dec_hi_way_sel_c1[0] & dec_lo_way_sel_c1[2] ; // 0010 
assign  arb_tag_way_px2[3] = dec_hi_way_sel_c1[0] & dec_lo_way_sel_c1[3] ; // 0011 
 
assign  arb_tag_way_px2[4] = dec_hi_way_sel_c1[1] & dec_lo_way_sel_c1[0] ;  
assign  arb_tag_way_px2[5] = dec_hi_way_sel_c1[1] & dec_lo_way_sel_c1[1] ;  
assign  arb_tag_way_px2[6] = dec_hi_way_sel_c1[1] & dec_lo_way_sel_c1[2] ;  
assign  arb_tag_way_px2[7] = dec_hi_way_sel_c1[1] & dec_lo_way_sel_c1[3] ;  
 
assign  arb_tag_way_px2[8] = dec_hi_way_sel_c1[2] & dec_lo_way_sel_c1[0] ; // 1000 
assign  arb_tag_way_px2[9] = dec_hi_way_sel_c1[2] & dec_lo_way_sel_c1[1] ; // 1001 
assign  arb_tag_way_px2[10] = dec_hi_way_sel_c1[2] & dec_lo_way_sel_c1[2] ; // 1010 
assign  arb_tag_way_px2[11] = dec_hi_way_sel_c1[2] & dec_lo_way_sel_c1[3] ; // 1011 


assign  arb_tag_way_px2[12] = dec_hi_way_sel_c1[3] & dec_lo_way_sel_c1[0] ; // 1100, BS & SR 10/28/03
assign  arb_tag_way_px2[13] = dec_hi_way_sel_c1[3] & dec_lo_way_sel_c1[1] ; // 1101, BS & SR 10/28/03
assign  arb_tag_way_px2[14] = dec_hi_way_sel_c1[3] & dec_lo_way_sel_c1[2] ; // 1110, BS & SR 10/28/03
assign  arb_tag_way_px2[15] = dec_hi_way_sel_c1[3] & dec_lo_way_sel_c1[3] ; // 1111, BS & SR 10/28/03
 
 
//////////////////////////////////////////////////////////////////////////////// 
// dword mask generation logic for pst data merging. 
//////////////////////////////////////////////////////////////////////////////// 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_hit_l2orfb_c4 
                           (.din(tag_hit_l2orfb_c3), .l1clk(l1clk), 
                                  .scan_in(ff_hit_l2orfb_c4_scanin),
                                  .scan_out(ff_hit_l2orfb_c4_scanout),
                                  .dout(hit_l2orfb_c4),
  .siclk(siclk),
  .soclk(soclk) 
                                   
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_hit_l2orfb_c5 
                           (.din(hit_l2orfb_c4), .l1clk(l1clk), 
                                  .scan_in(ff_hit_l2orfb_c5_scanin),
                                  .scan_out(ff_hit_l2orfb_c5_scanout),
                                  .dout(hit_l2orfb_c5),
  .siclk(siclk),
  .soclk(soclk) 
                                   
); 

// BS 03/11/04 extra cycle for mem access

l2t_arb_ctl_msff_ctl_macro__width_1 ff_hit_l2orfb_c52 
                           (.din(hit_l2orfb_c5), .l1clk(l1clk),
                                  .scan_in(ff_hit_l2orfb_c52_scanin),
                                  .scan_out(ff_hit_l2orfb_c52_scanout),
                                  .dout(hit_l2orfb_c52),
  .siclk(siclk),
  .soclk(soclk)
                                   
);

l2t_arb_ctl_msff_ctl_macro__width_1 ff_hit_l2orfb_c6 
                           (.din(hit_l2orfb_c52), .l1clk(l1clk), 
                                  .scan_in(ff_hit_l2orfb_c6_scanin),
                                  .scan_out(ff_hit_l2orfb_c6_scanout),
                                  .dout(hit_l2orfb_c6),
  .siclk(siclk),
  .soclk(soclk) 
                                   
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_hit_l2orfb_c7 
                           (.din(hit_l2orfb_c6), .l1clk(l1clk), 
                                  .scan_in(ff_hit_l2orfb_c7_scanin),
                                  .scan_out(ff_hit_l2orfb_c7_scanout),
                                  .dout(hit_l2orfb_c7),
  .siclk(siclk),
  .soclk(soclk) 
                                   
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_hit_l2orfb_c8 
                           (.din(hit_l2orfb_c7), .l1clk(l1clk), 
                                  .scan_in(ff_hit_l2orfb_c8_scanin),
                                  .scan_out(ff_hit_l2orfb_c8_scanout),
                                  .dout(hit_l2orfb_c8),
  .siclk(siclk),
  .soclk(soclk) 
                                   
); 
 
  
// BS and SR 11/12/03 N2 Xbar Packet format change :

// bug id 95620
//  Upon encountering vuad array for a partial store,
//  Care should be taken to diable the mask bits since the first pass is to detect and correct
//  VUAD error

assign        dword_mask_c7 = (arbdec_arbdp_inst_size_c7[7:0]) | {8{~decdp_pst_inst_c7|~hit_l2orfb_c7 | vuad_ce_err_c7}};
 
 
l2t_arb_ctl_msff_ctl_macro__width_8 ff_dword_mask_c8 
                           (.din(dword_mask_c7[7:0]), .l1clk(l1clk), 
                                  .scan_in(ff_dword_mask_c8_scanin),
                                  .scan_out(ff_dword_mask_c8_scanout),
                                  .dout(arb_dword_mask_c8[7:0]),
  .siclk(siclk),
  .soclk(soclk) 
                                   
); 
 
 
 // //////////////////////////////////////////////////////////////////////////////////// 
 // PST CTRUE WR EN 
 // Write ctrue for a PST if its  pass hits the cache or FB so that the next 
 // pass will perform a store to the $ 
 // //////////////////////////////////////////////////////////////////////////////////// 
 
 
 assign arb_pst_ctrue_en_c8 = arbdp_pst_no_ctrue_c8 & hit_l2orfb_c8 ; 
 

 
 // //////////////////////////////////////////////////////////////////////////////////// 
 // Select for the mux in data array between store data and fill data. 
 // /////////////////////////////////////////////////////////////////////////////////// 
 
 assign	arb_fill_vld_c2 = mbist_run_r1 ? 1'b0 : ( arbdec_arbdp_inst_fb_c2 & arb_inst_vld_c2_7) ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_fbrd_c3 
                           (.din(arb_fill_vld_c2), .l1clk(l1clk), 
                 .scan_in(ff_fbrd_c3_scanin),
                 .scan_out(ff_fbrd_c3_scanout),
                 .dout(arb_fill_vld_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	arb_l2d_fbrd_c3 = arb_fill_vld_c3 ; 
 
 
 
 
 ////////////////////////////////////////////////////////////////////// 
 // DIrectory access Signals are generated here 
 ///////////////////////////////////////////////////////////////////// 
 
 //////////////////////////////////////////////////////////////////////// 
 // 1. Bank enable for the  D$ directories. 
 //	C2		C3	 
 //================================ 
 //    store		imiss2 hit 
 //    hit			 
 //  				 
 //    atm hit		eviction 
 //			of valid line 
 //     
 //    imiss1 hit 	xmit to dir 
 //	 
 //    bst hit 
 //    snp hit 
 //////////////////////////////////////////////////////////////////////// 
 
  
 assign	st_cam_en_c2 = ( decdp_st_inst_c2_1 | decdp_strst_inst_c2_1 ) & 
		 ~( arb_decdp_fwd_req_c2 | arb_inst_diag_c2 ) &  
		 ( ~arbdec_arbdp_inst_mb_c2 | arbdec_arbdp_inst_dep_c2 ) ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_st_cam_en_c3 
                           (.din(st_cam_en_c2), .l1clk(l1clk), 
             	.scan_in(ff_st_cam_en_c3_scanin),
             	.scan_out(ff_st_cam_en_c3_scanout),
             	.dout(st_cam_en_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 

 
// special instructions cam en. 
// 2/20/2003 Changed arb_decdp_cas2_from_mb_c2 to 
// arb_decdp_cas2_from_mb_ctrue_c2 in the following expressions. 
// A CAS instruction will not cam the D$ directory unless 
// the compare results are true. 
// Remember: THe I$ directory WILL BE CAMMED irrespective 
// of the compare results. 
 
 assign	sp_cam_en_c2 = ( ~arbdp_pst_no_ctrue_c2_1 & arb_decdp_swap_inst_c2 ) | 
			( ~arbdp_pst_no_ctrue_c2_1 & arb_decdp_wr8_inst_c2 ) | 
                                arb_decdp_cas2_from_mb_ctrue_c2 ; 
 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_sp_cam_en_c3 
                           (.din(sp_cam_en_c2), .l1clk(l1clk), 
             	.scan_in(ff_sp_cam_en_c3_scanin),
             	.scan_out(ff_sp_cam_en_c3_scanout),
             	.dout(sp_cam_en_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	dc_cam_addr_c3[0] = ( arbadr_arbdp_addr5to4_c3 == 2'd0 ) ; 
 assign	dc_cam_addr_c3[1] = ( arbadr_arbdp_addr5to4_c3 == 2'd1 ) ; 
 assign	dc_cam_addr_c3[2] = ( arbadr_arbdp_addr5to4_c3 == 2'd2 ) ; 
 assign	dc_cam_addr_c3[3] = ( arbadr_arbdp_addr5to4_c3 == 2'd3 ) ; 
 
 
 
// int 5.0 changes
 //---------\/ POST_4.2 change required for timing \/------
 // misbuf_nondep_fbhit_c3 is an unqualified signal from mbctl
 //---------\/ POST_4.2 change required for timing \/------
 

 assign store_inst_en_c3 = ( tag_hit_l2orfb_c3 | 
                        ( misbuf_nondep_fbhit_c3  & ~tagdp_arb_par_err_c3 & arb_inst_vld_c3_2 & ~arb_vuad_ce_err_c3));

//  assign	store_inst_en_c3 = ( tag_hit_l2orfb_c3 | misbuf_nondep_fbhit_c3 ) ; 
 
 // cam entries with addr<5>==0 for the 1st imiss packet. 

l2t_arb_ctl_msff_ctl_macro__width_7 ff_arb_decdp_cas1_inst_c3  
        (
        .scan_in(ff_arb_decdp_cas1_inst_c3_scanin),
        .scan_out(ff_arb_decdp_cas1_inst_c3_scanout),
        .din({arb_decdp_cas1_inst_c2,arb_decdp_swap_inst_c2,arbdec_arbdp_rdma_inst_c2,arb_decdp_ld_inst_c2
              ,arb_decdp_wr8_inst_c2,arb_decdp_ld64_inst_c2,arb_decdp_cas2_inst_c2}), 
        .l1clk(l1clk),
        .dout({arb_decdp_cas1_inst_c3,arb_decdp_swap_inst_c3,arbdec_arbdp_rdma_inst_c3,arb_decdp_ld_inst_c3
                ,arb_decdp_wr8_inst_c3,arb_decdp_ld64_inst_c3,arb_decdp_cas2_inst_c3}),
  .siclk(siclk),
  .soclk(soclk)
        );

// Bug fix 87037
assign enable_dc_cam = ((~arb_decdp_cas1_inst_c3 & ~arb_decdp_swap_inst_c3 & ~arb_decdp_ld_inst_c3) 
                        | arbdec_arbdp_rdma_inst_c3 ) & misbuf_vuad_ce_instr_c3 & 
                          ~arb_decdp_ld64_inst_c3 & ~arb_decdp_wr8_inst_c3 & ~arb_decdp_cas2_inst_c3;



// for swap and wr8, sp_cam_en_c2 will enable D$ directory CAMing only

assign disable_dc_cam = (arb_decdp_swap_inst_c3 & arb_vuad_ce_err_c3) | 
			(imiss_inst_c3 & tag_hit_l2orfb_c3 & arb_vuad_ce_err_c3) | 
			(store_inst_en_c3 & arb_vuad_ce_err_c3) ; 



// Bug id 87014
 assign       dc_hitqual_cam_en0_c3 = (( st_cam_en_c3  & (store_inst_en_c3 | 
                               (tag_hit_unqual_c3 & misbuf_hit_st_dep_zero))) 
                              | ( tag_hit_l2orfb_c3 & (sp_cam_en_c3 | enable_dc_cam))
			      | ( ~tag_hit_l2orfb_c3 & misbuf_vuad_ce_instr_c3 & store_inst_en_c3) 
                              | imiss_hit_c3 ) & ~disable_dc_cam;
 
// Bug id 87014
assign        dc_hitqual_cam_en1_c3 = (( st_cam_en_c3  & (store_inst_en_c3 | 
                               (tag_hit_unqual_c3 & misbuf_hit_st_dep_zero))) 
                              | ( (enable_dc_cam | sp_cam_en_c3) & tag_hit_l2orfb_c3 )
			      | ( ~tag_hit_l2orfb_c3 & misbuf_vuad_ce_instr_c3 & store_inst_en_c3)) 
                              & ~disable_dc_cam ;

l2t_arb_ctl_msff_ctl_macro__width_1 ff_enc_cam_addr_c4  // int 5.0 changes
                           (.din(arbadr_arbdp_addr5to4_c3[1]), .l1clk(l1clk), 
          		.scan_in(ff_enc_cam_addr_c4_scanin),
          		.scan_out(ff_enc_cam_addr_c4_scanout),
          		.dout(enc_cam_addr_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 


l2t_arb_ctl_msff_ctl_macro__width_1 ff_vuad_ce  
              (.dout   ({misbuf_vuad_ce_instr_c3}),
                .scan_in(ff_vuad_ce_scanin),
                .scan_out(ff_vuad_ce_scanout),
                .din ({misbuf_vuad_ce_instr_c2}),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
              ) ;


// VUAD ECC pipeline : 
// On detecting a CE on VUAD in L2 the following happen
// 0. We detect VUAD CE on any valid instruction from Core or SIU other than Tecc, I$ Invalidate,
//    D$ Invalidates,Prefetch ICE  and Diagnostics . (However the data gets silently corrected for
//    Tecc, I$ Invalidate,D$ Invalidates,Prefetch ICE  and Diagnostics in C2 stage of pipe before it
//    gets written to VUAD array in C5). For Prefetch ICE, even if the error happens in the
//    Eviction pass of the Prefetch ICE, since it gets corrected in C2 phase itself , any
//    error in Valid,Dirty bits will not be visible, and the Prefetch ICE will do the
//    right thing w.r.t Dirty/Clean 
// 1. On detecting CE, Instruction gets moved into the MB (logic in l2t_misbuf_ctl)
// 2. Correction happens in C2 stage in l2t_usaloc_dp and l2t_vlddir_dp
// 3. CAMS to I$ and D$ directories are gated off (logic in l2t_arb_ctl)
// 4. Updates of I$ and D$ directories are gated off (logic in l2t_arb_ctl)
// 5. requests to crossbar gated off in C7 (first pass) (logic in l2t_oqu_ctl)
// 6. Updates of VUAD array happens in C5 (first pass) (logic in l2t_vuaddp_ctl)
//    This is corrected data.
// 7. DRAM ready is not set (logic in l2t_misbuf_ctl)
// 8. Instruction would be readied for replay from MB in C9 ((logic in l2t_misbuf_ctl)

//assign vuad_ce_err_c3 = (usaloc_ua_ce_c3 | vlddir_vd_ce_c3) & arb_inst_vld_c3 &
//                        ~(arb_tecc_c3 | inst_diag_c3 | decdp_pf_ice_inst_c3 | decdp_inst_int_or_inval_c3) ;
//
//
//assign arb_vuad_ce_err_c3 = vuad_ce_err_c3;

// changed from c3 to c2

/*
// VUAD CE is not detected for the following :
1.TECC instruction
2.Fill
3.Diagnostic instruction
4.Prefetch ICE
5.Invalidation Instructions
6.Replayed instructions from Miss Buffer that hit in the Fill Buffer
*/
 
//
//the following equation will have filbuf_tag_hit_frm_mb_c2 qualified in misbuf
//since this signal goes to misbuf.
//
//assign vuad_ce_err_c2_unqual  = arb_inst_vld_c2 & ~(arb_tecc_c2 | 
//	filbuf_tag_hit_frm_mb_c2 | arb_fill_vld_c2 | arb_inst_diag_c2 
//        | arb_pf_ice_inst_c2 | decdp_inst_int_or_inval_c2) ;
//


assign vuad_ce_err_c2_unqual  = arb_inst_vld_c2 & ~(arb_tecc_c2 | 
      filbuf_tag_hit_frm_mb_c2 | arb_fill_vld_c2 | arb_inst_diag_c2 | l2_bypass_mode_on_d1 | 
	arb_pf_ice_inst_c2 | decdp_inst_int_or_inval_c2) ;

// assign arb_vuad_ce_err_c2 = vuad_ce_err_c2_unqual;

assign arb_vuad_ce_err_c2 = arb_inst_vld_c2_4 & ~(arb_tecc_c2 | l2_bypass_mode_on_d1 |  
      	arb_fill_vld_c2 | arb_inst_diag_c2 | arb_pf_ice_inst_c2 | decdp_inst_int_or_inval_c2) ;


assign arb_vuad_ce_err_c3 = vuad_ce_err_c3;

assign vuad_ce_err_c2 = (usaloc_ua_ce_c2 | vlddir_vd_ce_c2) & vuad_ce_err_c2_unqual;


l2t_arb_ctl_msff_ctl_macro__width_8 ff_vuad_ce_err_c3  // int 5.0 changes
                       (
                        .scan_in(ff_vuad_ce_err_c3_scanin),
                        .scan_out(ff_vuad_ce_err_c3_scanout),
                        .din({vuad_ce_err_c2,vuad_ce_err_c2,vuad_ce_err_c2,vuad_ce_err_c3,vuad_ce_err_c4,vuad_ce_err_c5,
                                vuad_ce_err_c52,vuad_ce_err_c6}), 
                        .l1clk(l1clk),
                        .dout({vuad_ce_err_c3,usaloc_vlddir_arb_vuad_ce_err_c3,tagctl_arb_vuad_ce_err_c3,
				vuad_ce_err_c4,vuad_ce_err_c5, vuad_ce_err_c52,vuad_ce_err_c6,vuad_ce_err_c7}),
  .siclk(siclk),
  .soclk(soclk)
                        );

  
 // snoops and block stores need to be included in this expression. 
// In case of VUAD CE turn off CAM enable for D$ directory
//
//
// assign	arb_lkup_bank_ena_dcd_c3[0] = ( dc_cam_addr_c3[0] &  // cam for store,atomic, imiss packet1 
//			 dc_hitqual_cam_en0_c3 ) | 
//			( arb_evict_c3 & ~tagdp_invalid_evict_c3 ) | // eviction CAM 
//			 ( wr64_inst_c3  & tag_hit_l2orfb_c3 ); 
// 
// assign	arb_lkup_bank_ena_dcd_c3[1] = ( dc_cam_addr_c3[1] &  // cam for store,atomic, imiss packet2 
//			 dc_hitqual_cam_en1_c3)  | 
//		( arb_evict_c3 & ~tagdp_invalid_evict_c3 ) |
//// int 5.0 changes
////		(  ~enc_cam_addr_c4[1]  & arb_imiss_hit_c4 )|// addr<5>=0 cam for 2nd imiss packet 
//		(  ~enc_cam_addr_c4  & arb_imiss_hit_c4 )|// addr<5>=0 cam for 2nd imiss packet 
//		 ( wr64_inst_c3  & tag_hit_l2orfb_c3 ); 
//
//
//
//
// 
// assign	arb_lkup_bank_ena_dcd_c3[2] = ( dc_cam_addr_c3[2] &  // cam for store,atomic, imiss packet1 
//			 dc_hitqual_cam_en0_c3)  | 
//			( arb_evict_c3 & ~tagdp_invalid_evict_c3 ) | 
//			(wr64_inst_c3  &  tag_hit_l2orfb_c3 );  
// 
// assign	arb_lkup_bank_ena_dcd_c3[3] = ( dc_cam_addr_c3[3] &  // cam for store,atomic, imiss packet2 
//			 dc_hitqual_cam_en1_c3 )  | 
//			( arb_evict_c3 & ~tagdp_invalid_evict_c3 ) | 
//// int 5.0 changes
////		( enc_cam_addr_c4[1] & arb_imiss_hit_c4 )|  // addr<5>=1 cam for 2nd imiss packet 
//		( enc_cam_addr_c4 & arb_imiss_hit_c4 )|  // addr<5>=1 cam for 2nd imiss packet 
//
//			( wr64_inst_c3  &  tag_hit_l2orfb_c3 ); 
// 

// VUAD ecc changes
 assign arb_lkup_bank_ena_dcd_c3[0] = (( dc_cam_addr_c3[0] &  // cam for store,atomic, imiss packet1 
                         dc_hitqual_cam_en0_c3 ) | 
                        ( arb_evict_c3 & ~tagdp_invalid_evict_c3 ) | // eviction CAM 
                         ( wr64_inst_c3  & tag_hit_l2orfb_c3 )) & ~vuad_ce_err_c3; // VUAD ecc change
 
 assign arb_lkup_bank_ena_dcd_c3[1] = ((( dc_cam_addr_c3[1] &  // cam for store,atomic, imiss packet2 
                         dc_hitqual_cam_en1_c3)  | 
                         ( arb_evict_c3 & ~tagdp_invalid_evict_c3 ) |
                        ( wr64_inst_c3  &  tag_hit_l2orfb_c3 )) & ~vuad_ce_err_c3)
                        |
                        (( ~enc_cam_addr_c4  & arb_imiss_hit_c4 ) // addr<5>=0 cam for 2nd imiss packet
                        & ~vuad_ce_err_c4); // VUAD ecc change
 
 assign arb_lkup_bank_ena_dcd_c3[2] = (( dc_cam_addr_c3[2] &  // cam for store,atomic, imiss packet1 
                         dc_hitqual_cam_en0_c3)  | 
                        ( arb_evict_c3 & ~tagdp_invalid_evict_c3 ) | 
                        (wr64_inst_c3  &  tag_hit_l2orfb_c3 )) & ~vuad_ce_err_c3;    // VUAD ecc change
 
 assign arb_lkup_bank_ena_dcd_c3[3] = ((( dc_cam_addr_c3[3] &  // cam for store,atomic, imiss packet2 
                         dc_hitqual_cam_en1_c3 )  | 
                        ( arb_evict_c3 & ~tagdp_invalid_evict_c3 ) | 
                        ( wr64_inst_c3  &  tag_hit_l2orfb_c3 )) & ~vuad_ce_err_c3)
                        |
                        (( enc_cam_addr_c4 & arb_imiss_hit_c4 )  // addr<5>=1 cam for 2nd imiss packet 
                        & ~vuad_ce_err_c4); // VUAD ecc change
 

 
 //////////////////////////////////////////////////////////////////////// 
 // 2. Bank enable for the  I$ directories. 
 //	C2		C3		 
 //================================== 
 //    store		 	 
 //    hit			 
 //  				 
 //    atm hit		eviction 
 //			of valid line 
 //     
 //    ld hit		xmit to 
 //			dir 
 //    bst hit  
 //    snp hit 
 //////////////////////////////////////////////////////////////////////// 


 // int 5.0 change
 //-------\/ Added this logic POST_4.2 \/----------
 // For a BLD, NC=1. The D$ is not filled with BLD data returned by
 // the L2. In this case, it will be incorrect to invalidate the i$
 // because the i$ logic cannot handle more than one invalidate per
 // outstanding load whereas a BLD will invalidate 2 lines in the I$( potentially)

l2t_arb_ctl_msff_ctl_macro__width_1 ff_arbctl_inst_nc_c2 
                           (.din(arbdec_arbdp_inst_nc_c1), .l1clk(l1clk),
                .scan_in(ff_arbctl_inst_nc_c2_scanin),
                .scan_out(ff_arbctl_inst_nc_c2_scanout),
                .dout(arb_inst_nc_c2),
  .siclk(siclk),
  .soclk(soclk) 
);

 
 assign	ic_hitqual_cam_en_c2 = (( ~arbdp_pst_no_ctrue_c2_1 & arb_decdp_swap_inst_c2 ) | 
				( ~arbdp_pst_no_ctrue_c2_1 & arb_decdp_wr8_inst_c2 ) | 
				arb_decdp_cas2_from_mb_c2 | 		 
				(decdp_camld_inst_c2 & ~arb_inst_nc_c2 )) ; // int 5.0 change 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_ic_hitqual_cam_en_c3 
                           (.din(ic_hitqual_cam_en_c2), .l1clk(l1clk), 
             	.scan_in(ff_ic_hitqual_cam_en_c3_scanin),
             	.scan_out(ff_ic_hitqual_cam_en_c3_scanout),
             	.dout(ic_hitqual_cam_en_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 // instructions that cam only one directory panel are included here. 
 
 assign	tmp_bank_icd_c3 = ( st_cam_en_c3 & (store_inst_en_c3 | 
                (tag_hit_unqual_c3 & misbuf_hit_st_dep_zero))) | 
		( ic_hitqual_cam_en_c3 & tag_hit_l2orfb_c3 ) ; 
 
 
// BS and SR 11/18/03 Support for 8 way I$
// Support for 8 way I$. Two rows need to be cammed out of 4 for every 
// Load hit or Store hit. All four rows need to be cammed for an Eviction
// Each row holds I$ ways 0 through 3 or I$ ways 4 through 7.
// Row select = {addr[5],I$ L1 way[2]} 
//
// assign	arb_lkup_bank_ena_icd_c3[0]  =  ( tmp_bank_icd_c3 & ~arbadr_arbdp_addr5to4_c3[1] ) |  
//			 ((arb_evict_c3 & ~tagdp_invalid_evict_c3) |  
//			(wr64_inst_c3 & tag_hit_l2orfb_c3 )  )  ;
//  
// assign	arb_lkup_bank_ena_icd_c3[1]  =  ( tmp_bank_icd_c3 & ~arbadr_arbdp_addr5to4_c3[1] ) |  
//			 ((arb_evict_c3 & ~tagdp_invalid_evict_c3) |  
//			(wr64_inst_c3 & tag_hit_l2orfb_c3 )  ) ;
// 
// 
// assign	arb_lkup_bank_ena_icd_c3[2]  = ( tmp_bank_icd_c3 & arbadr_arbdp_addr5to4_c3[1] ) | 
//			 ((arb_evict_c3 & ~tagdp_invalid_evict_c3) | 
//			(wr64_inst_c3 & tag_hit_l2orfb_c3 )  ) ;
// 
// 
// assign	arb_lkup_bank_ena_icd_c3[3]  =  ( tmp_bank_icd_c3 & arbadr_arbdp_addr5to4_c3[1] ) | 
//			 ((arb_evict_c3 & ~tagdp_invalid_evict_c3) |  
//			(wr64_inst_c3 & tag_hit_l2orfb_c3 )  ) ;
// 


// In case of VUAD CE turn off CAM enable for I$ directory
 assign arb_lkup_bank_ena_icd_c3[0]  =  (( tmp_bank_icd_c3 & ~arbadr_arbdp_addr5to4_c3[1] ) |  
                         ((arb_evict_c3 & ~tagdp_invalid_evict_c3) |  
                        (wr64_inst_c3 & tag_hit_l2orfb_c3 ))) & ~vuad_ce_err_c3;
  
 assign arb_lkup_bank_ena_icd_c3[1]  =  (( tmp_bank_icd_c3 & ~arbadr_arbdp_addr5to4_c3[1] ) |  
                         ((arb_evict_c3 & ~tagdp_invalid_evict_c3) |  
                        (wr64_inst_c3 & tag_hit_l2orfb_c3 ))) & ~vuad_ce_err_c3;
 
 
 assign arb_lkup_bank_ena_icd_c3[2]  = (( tmp_bank_icd_c3 & arbadr_arbdp_addr5to4_c3[1] ) | 
                         ((arb_evict_c3 & ~tagdp_invalid_evict_c3) | 
                        (wr64_inst_c3 & tag_hit_l2orfb_c3 ))) & ~vuad_ce_err_c3 ;
 
 
 assign arb_lkup_bank_ena_icd_c3[3]  =  (( tmp_bank_icd_c3 & arbadr_arbdp_addr5to4_c3[1] ) | 
                         ((arb_evict_c3 & ~tagdp_invalid_evict_c3) |  
                        (wr64_inst_c3 & tag_hit_l2orfb_c3 ))) & ~vuad_ce_err_c3 ;
 

   
 //////////////////////////////////////////////////////////////////////// 
 // 3 & 4. Row address for the  D$ directories. ( This logic is in arbadr.) 
 //////////////////////////////////////////////////////////////////////// 


 
 //////////////////////////////////////////////////////////////////////// 
 // 5. INvalidate mask  for the  d$ directories.  
 //	// For a normal store in C3 invalidate all other cpus 
 //	// For an imiss ld in C3 or C4  invalidate the decoded cpu 
 //	// invalidate all cpus as the default case. 
 //////////////////////////////////////////////////////////////////////// 
 
l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_3 mux_cpuid_c3 
			(.dout (cpuid_c3[2:0]) , // c3 invalidation cpu 
                        .din0(arb_cpuid_c4[2:0]),	// c4 instruction cpuid 
                        .din1(arb_cpuid_c3[2:0] ),	// c3 instruction cpuid 
                        .sel0(arb_imiss_hit_c4),	// sel c4 cpuid 
                        .sel1(~arb_imiss_hit_c4));	// sel default. 
 
  assign	self_inval_mask_c3[0] = ( cpuid_c3 == 3'd0 ) ; 
  assign 	self_inval_mask_c3[1] = ( cpuid_c3 == 3'd1 ) ; 
  assign	self_inval_mask_c3[2] = ( cpuid_c3 == 3'd2 ) ; 
  assign	self_inval_mask_c3[3] = ( cpuid_c3 == 3'd3 ) ; 
  assign	self_inval_mask_c3[4] = ( cpuid_c3 == 3'd4 ) ; 
  assign	self_inval_mask_c3[5] = ( cpuid_c3 == 3'd5 ) ; 
  assign	self_inval_mask_c3[6] = ( cpuid_c3 == 3'd6 ) ; 
  assign	self_inval_mask_c3[7] = ( cpuid_c3 == 3'd7 ) ; 
 
  assign	others_inval_mask_c3 = ~self_inval_mask_c3 ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_ld_inst_c3 
                           (.din(decdp_camld_inst_c2), .l1clk(l1clk), 
             .scan_in(ff_ld_inst_c3_scanin),
             .scan_out(ff_ld_inst_c3_scanout),
             .dout(ld_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
   
 
  // store hit includes that case where the store hits the Fill Buffer 
  // and not the Miss Buffer. 
  //assign st_inst_hit_c3 =  arb_decdp_st_inst_c3 & store_inst_en_c3 ; 
 
 // Store inst vld c3 can be used in place of st_inst_hit_c3 in 
 // * inval mask logic. 
 // * dir rd entry logic 
 // * dir error logic 
 // * dir rd panel logic. 
 
 
  
  assign store_inst_vld_c3 = arb_decdp_st_inst_c3 & arb_inst_vld_c3 ; 
  assign store_inst_vld_c3_1 = decdp_st_inst_c3_1 & arb_inst_vld_c3_1 ; 
  assign store_inst_vld_c3_2 = decdp_st_inst_c3_2 & arb_inst_vld_c3_2 ; 
 
 
  assign ld_hit_c3 =  ld_inst_c3 & tag_hit_l2orfb_c3; 
 
  assign sel_stld_mask = ( ( store_inst_vld_c3_2 &  
				~decdp_rmo_st_or_strst_c3 &  // Inval every cpu on an eviction or a rmo store 
					~arb_evict_unqual_c3  ) // or a stream store 
				| imiss_hit_c3 | 
				arb_imiss_hit_c4 | ld_hit_c3 ); 
 
l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_8 mux1_inval_mask_c3 
			(.dout (tmp_inval_mask_c3[7:0]) , // lds and stores mask 
                        .din0(others_inval_mask_c3[7:0]), // stores mask 
                        .din1(self_inval_mask_c3[7:0] ),	// loads mask 
                        .sel0(store_inst_vld_c3_1),	// sel stores mask 
                        .sel1(~store_inst_vld_c3_1)); // sel default. 
 
l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_8 mux2_inval_mask_c3 
			(.dout (arb_inval_mask_dcd_c3[7:0]) , // inval_mask_dcd 
                        .din0(tmp_inval_mask_c3[7:0]), // stores/lds  mask 
                        .din1(8'hFF),	// default mask  
                        .sel0(sel_stld_mask),	// sel stldimiss mask 
                        .sel1(~sel_stld_mask)); // sel default. 
 
 
	 
 //////////////////////////////////////////////////////////////////////// 
 // 6. INvalidate mask  for the  i$ directories.  
 //	// For an  ld in C3  invalidate the decoded cpu 
 // 	// invalidate all cpus in the default case. 
 //////////////////////////////////////////////////////////////////////// 
   
l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_8 mux1_ic_inval_mask_c3 
			(.dout(arb_inval_mask_icd_c3[7:0]) , // inval_mask_icd 
                        .din0(self_inval_mask_c3[7:0]), // lds  mask 
                        .din1(8'hFF),	// default mask  
                        .sel0(ld_hit_c3),	// sel lds mask 
                        .sel1(~ld_hit_c3)); // sel default. 
 
 
 
 //////////////////////////////////////////////////////////////////////// 
 // 7. Wr enable into the D$ & I$ directory  
 //////////////////////////////////////////////////////////////////////// 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_dc_inval_c3 
                           (.din(decdp_dc_inval_c2), .l1clk(l1clk), 
                              .scan_in(ff_dc_inval_c3_scanin),
                              .scan_out(ff_dc_inval_c3_scanout),
                              .dout(dc_inval_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_ic_inval_c3 
                           (.din(decdp_ic_inval_c2), .l1clk(l1clk), 
                              .scan_in(ff_ic_inval_c3_scanin),
                              .scan_out(ff_ic_inval_c3_scanout),
                              .dout(ic_inval_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
  assign	inval_inst_vld_c2 = ( decdp_dc_inval_c2 |  
					decdp_ic_inval_c2 ) & 
					arb_inst_vld_c2_7 ; 
 
  assign	arb_inval_inst_c2 = inval_inst_vld_c2 ; 
 

//----\/ FIX for bug#4619 \/--------------------------------------
  assign        arb_misbuf_inval_inst_c2 = ( decdp_dc_inval_c2 |
                                        decdp_ic_inval_c2 ) ;


  assign     dc_inval_vld_c3 = dc_inval_c3 & arb_inst_vld_c3 & ~misbuf_arb_hit_c3 ;
  assign     ic_inval_vld_c3 = ic_inval_c3 & arb_inst_vld_c3 & ~misbuf_arb_hit_c3 ;
 
//  assign     dc_inval_vld_c3 = dc_inval_c3 & arb_inst_vld_c3 ; 
//  assign     ic_inval_vld_c3 = ic_inval_c3 & arb_inst_vld_c3 ; 
  
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_dc_inval_vld_c4 
                           (.din(dc_inval_vld_c3), .l1clk(l1clk), 
                   	.scan_in(ff_dc_inval_vld_c4_scanin),
                   	.scan_out(ff_dc_inval_vld_c4_scanout),
                   	.dout(dc_inval_vld_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_dc_inval_vld_c5 
                           (.din(dc_inval_vld_c4), .l1clk(l1clk), 
                   	.scan_in(ff_dc_inval_vld_c5_scanin),
                   	.scan_out(ff_dc_inval_vld_c5_scanout),
                   	.dout(dc_inval_vld_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_arb_ctl_msff_ctl_macro__width_1 ff_dc_inval_vld_c52 
                           (.din(dc_inval_vld_c5), .l1clk(l1clk),
                        .scan_in(ff_dc_inval_vld_c52_scanin),
                        .scan_out(ff_dc_inval_vld_c52_scanout),
                        .dout(dc_inval_vld_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_arb_ctl_msff_ctl_macro__width_1 ff_dc_inval_vld_c6 
                           (.din(dc_inval_vld_c52), .l1clk(l1clk), 
                   	.scan_in(ff_dc_inval_vld_c6_scanin),
                   	.scan_out(ff_dc_inval_vld_c6_scanout),
                   	.dout(dc_inval_vld_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_dc_inval_vld_c7 
                           (.din(dc_inval_vld_c6), .l1clk(l1clk), 
                   	.scan_in(ff_dc_inval_vld_c7_scanin),
                   	.scan_out(ff_dc_inval_vld_c7_scanout),
                   	.dout(arb_dc_inval_vld_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_ic_inval_vld_c4 
                           (.din(ic_inval_vld_c3), .l1clk(l1clk), 
                   	.scan_in(ff_ic_inval_vld_c4_scanin),
                   	.scan_out(ff_ic_inval_vld_c4_scanout),
                   	.dout(ic_inval_vld_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_ic_inval_vld_c5 
                           (.din(ic_inval_vld_c4), .l1clk(l1clk), 
                   	.scan_in(ff_ic_inval_vld_c5_scanin),
                   	.scan_out(ff_ic_inval_vld_c5_scanout),
                   	.dout(ic_inval_vld_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_arb_ctl_msff_ctl_macro__width_1 ff_ic_inval_vld_c52 
                           (.din(ic_inval_vld_c5), .l1clk(l1clk),
                        .scan_in(ff_ic_inval_vld_c52_scanin),
                        .scan_out(ff_ic_inval_vld_c52_scanout),
                        .dout(ic_inval_vld_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_arb_ctl_msff_ctl_macro__width_1 ff_ic_inval_vld_c6 
                           (.din(ic_inval_vld_c52), .l1clk(l1clk), 
                   	.scan_in(ff_ic_inval_vld_c6_scanin),
                   	.scan_out(ff_ic_inval_vld_c6_scanout),
                   	.dout(ic_inval_vld_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_ic_inval_vld_c7 
                           (.din(ic_inval_vld_c6), .l1clk(l1clk), 
                   	.scan_in(ff_ic_inval_vld_c7_scanin),
                   	.scan_out(ff_ic_inval_vld_c7_scanout),
                   	.dout(arb_ic_inval_vld_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// SR 12/6/04 :: Dir changes  following 2 flops

l2t_arb_ctl_msff_ctl_macro__width_1 ff_ic_inval_vld_c8 
                           (.din(arb_ic_inval_vld_c7), 
                        .scan_in(ff_ic_inval_vld_c8_scanin),
                        .scan_out(ff_ic_inval_vld_c8_scanout),
                        .l1clk(l1clk),
                        .dout(arb_ic_inval_vld_c8),
  .siclk(siclk),
  .soclk(soclk));

l2t_arb_ctl_msff_ctl_macro__width_1 ff_ic_inval_vld_c9 
                           (.din(arb_ic_inval_vld_c8), 
                        .scan_in(ff_ic_inval_vld_c9_scanin),
                        .scan_out(ff_ic_inval_vld_c9_scanout),
                        .l1clk(l1clk),
                        .dout(arb_ic_inval_vld_c9),
  .siclk(siclk),
  .soclk(soclk));


//msff_ctl_macro ff_ic_inval_vld_c10 (width=1)
//                           (.din(arb_ic_inval_vld_c9),
//                        .scan_in(ff_ic_inval_vld_c10_scanin),
//                        .scan_out(ff_ic_inval_vld_c10_scanout),
//                        .l1clk(l1clk),
//                        .dout(arb_ic_inval_vld_c10));



 
 assign	inval_inst_vld_c3 = dc_inval_vld_c3 | ic_inval_vld_c3 ; 
 assign	inval_inst_vld_c4 = dc_inval_vld_c4 | ic_inval_vld_c4 ; 
 assign	inval_inst_vld_c5 = dc_inval_vld_c5 | ic_inval_vld_c5 ; 
 assign inval_inst_vld_c52 = dc_inval_vld_c52 | ic_inval_vld_c52 ; // BS 03/11/04 extra cycle for mem access
 
 
 
 // Date : 2/2/2002:  
 // In L2 bypass mode, the directory write for Fb hits is 
 // disabled  
 
// 
// assign	arb_dc_wr_en_c3 =  ( ld_hit_c3 & ~arbdec_arbdp_inst_nc_c3 
//			& ~l2_bypass_mode_on_d1 ) |  
//			dc_inval_vld_c3 | 		// l1_way 00 
//			dc_inval_vld_c4 |		// l1_way 01 
//			dc_inval_vld_c5 | 		// l1_way 10 
////			dc_inval_vld_c6 ;		// l1_way 11 
//                        dc_inval_vld_c52 ;              // l1_way 11 BS 03/11/04 extra cycle for mem access
//	 
//   
// assign	arb_ic_wr_en_c3 =  ( imiss_hit_c3 & ~arbdec_arbdp_inst_nc_c3 
//			& ~l2_bypass_mode_on_d1 ) |  
//			ic_inval_vld_c3 | 		// l1_way 00 
//			ic_inval_vld_c4 |		// l1_way 01 
//			ic_inval_vld_c5 | 		// l1_way 10 
//		//	ic_inval_vld_c6 ;		// l1_way 11 
//                        ic_inval_vld_c52 ;              // l1_way 11 BS 03/11/04 extra cycle for mem access
//
// // BS 2/1/04 : Brought out IC inval signal to separate from IC fill 
// // because IC fill will load only one panel in 1 row (only one 1 cache waY) while IC inval will write
// // to two panels in two rows (2 icache ways) every cycle. This IC dir write enable logic is in 
// // l2t_dir_ctl.sv.
//
// assign arb_ic_inval_wr_en_c3 = ic_inval_vld_c3 |               // l1_way 00
//                        	ic_inval_vld_c4 |               // l1_way 01
//                        	ic_inval_vld_c5 |               // l1_way 10
//                      //  	ic_inval_vld_c6 ;               // l1_way 11
//                                ic_inval_vld_c52 ;              // l1_way 11 BS 03/11/04 extra cycle for mem access
//
// 
// VUAD ecc changes
//  vuad ce will disable the D$ dir writes only for instructions other than D$ invalidates.
// for D$ invalidates, vuad ce will be masked and hence the dir writes will go through
 
 assign arb_dc_wr_en_c3 =   (( ~vuad_ce_err_c3 & ld_hit_c3 & ~arbdec_arbdp_inst_nc_c3  // VUAD ecc change
                        & ~l2_bypass_mode_on_d1 )  |  
                        dc_inval_vld_c3 |               // l1_way 00 
                        dc_inval_vld_c4 |               // l1_way 01 
                        dc_inval_vld_c5 |               // l1_way 10 
                        dc_inval_vld_c52 );              // l1_way 11 BS 03/11/04 extra cycle for mem access
         
   
////  vuad ce will disable the I$ dir writes only for instructions other than I$ invalidates.
//// for I$ invalidates, vuad ce will be masked and hence the dir writes will go through
//
// assign arb_ic_wr_en_c3 =  (( ~vuad_ce_err_c3 & imiss_hit_c3 & ~arbdec_arbdp_inst_nc_c3  // VUAD ecc change
//                        & ~l2_bypass_mode_on_d1 ) |  
//                        ic_inval_vld_c3 |               // l1_way 00 
//                        ic_inval_vld_c4 |               // l1_way 01 
//                        ic_inval_vld_c5 |               // l1_way 10 
//                        ic_inval_vld_c52 );              // l1_way 11 BS 03/11/04 extra cycle for mem access
//
// // BS 2/1/04 : Brought out IC inval signal to separate from IC fill 
// // because IC fill will load only one panel in 1 row (only one 1 cache waY) while IC inval will write
// // to two panels in two rows (2 icache ways) every cycle. This IC dir write enable logic is in 
// // l2t_dir_ctl.sv.
//
//// In case of VUAD CE turn off write enable for I$ directory
// assign arb_ic_inval_wr_en_c3 = (ic_inval_vld_c3 |               // l1_way 00
//                                ic_inval_vld_c4 |               // l1_way 01
//                                ic_inval_vld_c5 |               // l1_way 10
//                                ic_inval_vld_c52); // l1_way 11 BS 03/11/04 extra cycle for mem access
//

// SR 12/6/04 :: Dir changes

assign arb_ic_wr_en_c3 =  (( ~vuad_ce_err_c3 & imiss_hit_c3 & 
			~arbdec_arbdp_inst_nc_c3 & ~l2_bypass_mode_on_d1 )  | 
			ic_inval_vld_c3 |               // l1_way 000
                        ic_inval_vld_c4 |               // l1_way 001
                        ic_inval_vld_c5 |               // l1_way 010
                        ic_inval_vld_c52 | 		// l1_way 011
			ic_inval_vld_c6 | 		// l1_way 100
                        arb_ic_inval_vld_c7 |           // l1_way 101
                        arb_ic_inval_vld_c8 |           // l1_way 110
                        arb_ic_inval_vld_c9 );          // l1_way 111

//assign arb_ic_inval_wr_en_c3 = 
//			(ic_inval_vld_c3 |       // l1_way 000
//                        ic_inval_vld_c4 |        // l1_way 001
//                        ic_inval_vld_c5 |        // l1_way 010
//                        ic_inval_vld_c52 | 	// l1_way 011
//                        ic_inval_vld_c6 |               // l1_way 100
//                        arb_ic_inval_vld_c7 |           // l1_way 101
//                        arb_ic_inval_vld_c8 |           // l1_way 110
//                        arb_ic_inval_vld_c9 );          // l1_way 111
 
 //////////////////////////////////////////////////////////////////////// 
 // The Error injection register in csr needs this signal. 
 //////////////////////////////////////////////////////////////////////// 
 assign	arb_dir_wr_en_c3 = ( arb_dc_wr_en_c3 | 
				arb_ic_wr_en_c3 ) ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_dir_wr_en_c4 
                           (.din(arb_dir_wr_en_c3), .l1clk(l1clk), 
           	.scan_in(ff_arb_dir_wr_en_c4_scanin),
           	.scan_out(ff_arb_dir_wr_en_c4_scanout),
           	.dout(arb_dir_wr_en_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 //////////////////////////////////////////////////////////////////////// 
 // 8. Rd enable into the d$ and I$ directories 
 // A read is performed when a store hit is in C3. 
 //	dir_addr_cnt<10:6> = panel # 
 //	dir_addr_cnt<5:1> = entry # 
 // 	dir_addr_cnt<0> = I$ , 0= d$ 
 // 	Pipeline for reads. 
 //-------------------------------------------------------------------------------- 
 // 	C3	 	C4		C5		C6		C7 
 //-------------------------------------------------------------------------------- 
 //   setup		xmit		Dir		Parity		Error 
 //   dir		inside		Rd		Calc.		Xmit 
 //   rd access		the dir						to arb 
 //   I$/d$ 
 //////////////////////////////////////////////////////////////////////// 
 
 assign	dir_addr_cnt_plus1 = dir_addr_cnt_c3 + 11'b1 ; 
 
assign dir_store_inst_vld_c3 = store_inst_vld_c3 & ~arb_vuad_ce_err_c3; // do nothing on vuad ce error


l2t_arb_ctl_msff_ctl_macro__clr_1__en_1__width_11 ff_dir_addr_cnt  // sync reset active high
				(.dout(dir_addr_cnt_c3[10:0]), 
                 .scan_in(ff_dir_addr_cnt_scanin),
                 .scan_out(ff_dir_addr_cnt_scanout),
                 .en(dir_store_inst_vld_c3), .l1clk(l1clk), .clr(arb_data_ecc_idx_reset), 
                 .din(dir_addr_cnt_plus1[10:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	arb_dc_rd_en_c3 = (~dir_addr_cnt_c3[0] & store_inst_vld_c3_1) & ~arb_vuad_ce_err_c3; 
 assign	arb_ic_rd_en_c3 = (dir_addr_cnt_c3[0] & store_inst_vld_c3_1 ) & ~arb_vuad_ce_err_c3; 
 assign arb_dc_ic_rd_bit_4 = dir_addr_cnt_c3[6];
 
   
l2t_arb_ctl_msff_ctl_macro__width_11 ff_dir_addr_cnt_c4 
                           (.din(dir_addr_cnt_c3[10:0]), .l1clk(l1clk), 
             .scan_in(ff_dir_addr_cnt_c4_scanin),
             .scan_out(ff_dir_addr_cnt_c4_scanout),
             .dout(dir_addr_cnt_c4[10:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_11 ff_dir_addr_cnt_c5 
                           (.din(dir_addr_cnt_c4[10:0]), .l1clk(l1clk), 
             .scan_in(ff_dir_addr_cnt_c5_scanin),
             .scan_out(ff_dir_addr_cnt_c5_scanout),
             .dout(dir_addr_cnt_c5[10:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_arb_ctl_msff_ctl_macro__width_11 ff_dir_addr_cnt_c52 
                           (.din(dir_addr_cnt_c5[10:0]), .l1clk(l1clk),
             .scan_in(ff_dir_addr_cnt_c52_scanin),
             .scan_out(ff_dir_addr_cnt_c52_scanout),
             .dout(dir_addr_cnt_c52[10:0]),
  .siclk(siclk),
  .soclk(soclk)  
);



l2t_arb_ctl_msff_ctl_macro__width_11 ff_dir_addr_cnt_c6 
                           (.din(dir_addr_cnt_c52[10:0]), .l1clk(l1clk), 
             .scan_in(ff_dir_addr_cnt_c6_scanin),
             .scan_out(ff_dir_addr_cnt_c6_scanout),
             .dout(dir_addr_cnt_c6[10:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_11 ff_dir_addr_cnt_c7 
                           (.din(dir_addr_cnt_c6[10:0]), .l1clk(l1clk), 
             .scan_in(ff_dir_addr_cnt_c7_scanin),
             .scan_out(ff_dir_addr_cnt_c7_scanout),
             .dout(dir_addr_cnt_c7[10:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
			  
 
 ///////////////// 
 // sent to the CSR 
 // block for ERR 
 //  reporting. 
 ///////////////// 
 
l2t_arb_ctl_msff_ctl_macro__width_11 ff_dir_addr_c8 
                           (.din(dir_addr_cnt_c7[10:0]), .l1clk(l1clk), 
            .scan_in(ff_dir_addr_c8_scanin),
            .scan_out(ff_dir_addr_c8_scanout),
            .dout(dir_addr_cnt_c8[10:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_11 ff_dir_addr_c9 
                           (.din(dir_addr_cnt_c8[10:0]), .l1clk(l1clk), 
            .scan_in(ff_dir_addr_c9_scanin),
            .scan_out(ff_dir_addr_c9_scanout),
            .dout(arb_dir_addr_c9[10:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
//////////////////////////////////////////////////////////////////////// 
// 9. Rd/Wr entry number  
//////////////////////////////////////////////////////////////////////// 

// BS 03/25/04 for partial bank/core modes support

//assign spc0_avl =  ncu_spc0_core_enable_status;
//assign spc1_avl =  ncu_spc1_core_enable_status;
//assign spc2_avl =  ncu_spc2_core_enable_status;
//assign spc3_avl =  ncu_spc3_core_enable_status;
//assign spc4_avl =  ncu_spc4_core_enable_status;
//assign spc5_avl =  ncu_spc5_core_enable_status;
//assign spc6_avl =  ncu_spc6_core_enable_status;
//assign spc7_avl =  ncu_spc7_core_enable_status;

l2t_arb_ctl_msff_ctl_macro__width_1 ff_sync_en 
	(
	.scan_in(ff_sync_en_scanin),
	.scan_out(ff_sync_en_scanout),
	.dout	(io_cmp_sync_en_r1),
	.din	(io_cmp_sync_en),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

l2t_arb_ctl_msff_ctl_macro__en_1__width_8 ff_ncu_signals 
	(
	.scan_in(ff_ncu_signals_scanin),
	.scan_out(ff_ncu_signals_scanout),
	.dout	({spc0_avl,
                  spc1_avl,
                  spc2_avl,
                  spc3_avl,
                  spc4_avl,
                  spc5_avl,
                  spc6_avl,
                  spc7_avl_unused}),
	.din	({ ncu_spc0_core_enable_status,
                   ncu_spc1_core_enable_status,
                   ncu_spc2_core_enable_status,
                   ncu_spc3_core_enable_status,
                   ncu_spc4_core_enable_status,
                   ncu_spc5_core_enable_status,
                   ncu_spc6_core_enable_status,
                   ncu_spc7_core_enable_status}),
	.l1clk	(l1clk),
	.en	(io_cmp_sync_en_r1),
  .siclk(siclk),
  .soclk(soclk)
	);



l2t_arb_ctl_msff_ctl_macro__width_3 ff_staged_part_bank	
	(
	.scan_in(ff_staged_part_bank_scanin),
	.scan_out(ff_staged_part_bank_scanout),
	.dout	({arbadr_ncu_l2t_pm_n,
 		  arbadr_2bnk_true_enbld,
 		  arbadr_4bnk_true_enbld}),
	.din	({arbadr_ncu_l2t_pm_n_dist,
                  arbadr_2bnk_true_enbld_dist,
                  arbadr_4bnk_true_enbld_dist}),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


assign arb_cpuid_dec_c2[0] = (arbdec_arbdp_cpuid_c2[2:0] == 3'b000);
assign arb_cpuid_dec_c2[1] = (arbdec_arbdp_cpuid_c2[2:0] == 3'b001); 
assign arb_cpuid_dec_c2[2] = (arbdec_arbdp_cpuid_c2[2:0] == 3'b010); 
assign arb_cpuid_dec_c2[3] = (arbdec_arbdp_cpuid_c2[2:0] == 3'b011); 
assign arb_cpuid_dec_c2[4] = (arbdec_arbdp_cpuid_c2[2:0] == 3'b100); 
assign arb_cpuid_dec_c2[5] = (arbdec_arbdp_cpuid_c2[2:0] == 3'b101); 
assign arb_cpuid_dec_c2[6] = (arbdec_arbdp_cpuid_c2[2:0] == 3'b110); 
assign arb_cpuid_dec_c2[7] = (arbdec_arbdp_cpuid_c2[2:0] == 3'b111); 





assign sum01 = {1'b0,spc0_avl} + {1'b0,spc1_avl};
assign sum012 = {1'b0,spc0_avl} + {1'b0,spc1_avl} + {1'b0,spc2_avl};
assign sum0123 = {2'b00,spc0_avl} + {2'b00,spc1_avl} + {2'b00,spc2_avl} + {2'b00,spc3_avl};
assign sum01234 = {2'b00,spc0_avl} + {2'b00,spc1_avl} + {2'b00,spc2_avl} + {2'b00,spc3_avl} + {2'b00,spc4_avl};
assign sum012345 = {2'b00,spc0_avl} + {2'b00,spc1_avl} + {2'b00,spc2_avl} + {2'b00,spc3_avl} + {2'b00,spc4_avl} + {2'b00,spc5_avl};
assign sum0123456 = {2'b00,spc0_avl} + {2'b00,spc1_avl} + {2'b00,spc2_avl} + {2'b00,spc3_avl} + {2'b00,spc4_avl} + {2'b00,spc5_avl} 
                    + {2'b00,spc6_avl};

assign sum0 = spc0_avl;

assign sel_bot_seg = (arb_cpuid_dec_c2[0]) | 
                     (arb_cpuid_dec_c2[1] & (sum0 == 1'b0)) |
                     (arb_cpuid_dec_c2[2] & (sum01 == 2'b00)) | 
                     (arb_cpuid_dec_c2[3] & (sum012 == 2'b00)) | 
                     (arb_cpuid_dec_c2[4] & (sum0123 == 3'b000)) | 
                     (arb_cpuid_dec_c2[5] & (sum01234 == 3'b000)) |
                     (arb_cpuid_dec_c2[6] & (sum012345 == 3'b000)) | 
                     (arb_cpuid_dec_c2[7] & (sum0123456  == 3'b000)); 

assign   sel_00 = sel_bot_seg;
assign   sel_01 = (arb_cpuid_dec_c2[1] & (sum0 == 1'b1)) |
                  (arb_cpuid_dec_c2[2] & (sum01 == 2'b01)) |
                  (arb_cpuid_dec_c2[3] & (sum012 == 2'b01)) |
                  (arb_cpuid_dec_c2[4] & (sum0123 == 3'b001)) |
                  (arb_cpuid_dec_c2[5] & (sum01234 == 3'b001)) |
                  (arb_cpuid_dec_c2[6] & (sum012345 == 3'b001)) |
                  (arb_cpuid_dec_c2[7] & (sum0123456  == 3'b001));
                 
assign   sel_10 = (arb_cpuid_dec_c2[2] & (sum01 == 2'b10)) |
                  (arb_cpuid_dec_c2[3] & (sum012 == 2'b10)) |
                  (arb_cpuid_dec_c2[4] & (sum0123 == 3'b010)) |
                  (arb_cpuid_dec_c2[5] & (sum01234 == 3'b010)) |
                  (arb_cpuid_dec_c2[6] & (sum012345 == 3'b010)) |
                  (arb_cpuid_dec_c2[7] & (sum0123456 == 3'b010));

assign   sel_11 = (arb_cpuid_dec_c2[3] & (sum012 == 2'b11)) |
                  (arb_cpuid_dec_c2[4] & (sum0123 == 3'b011)) |
                  (arb_cpuid_dec_c2[5] & (sum01234 == 3'b011)) |
                  (arb_cpuid_dec_c2[6] & (sum012345 == 3'b011)) |
                  (arb_cpuid_dec_c2[7] & (sum0123456 == 3'b011)); 

//assign arb_dirvec_cpu0_sel00 = arbadr_4bnk_true_enbld & sum0;
//assign arb_dirvec_cpu0_selbot = arbadr_2bnk_true_enbld & sum0; // fix for bug 93049, had a typo here.
//                                                               // should have been arbadr_2bnk_true_enbld
//                                                               // instead of "arbadr_4bnk_true_enbld"
//
//assign arb_dirvec_cpu1_sel00 = arbadr_4bnk_true_enbld & ~sum0 & (sum01==2'b01);
//assign arb_dirvec_cpu1_sel01 = arbadr_4bnk_true_enbld & (sum01==2'b10);
//assign arb_dirvec_cpu1_selbot = arbadr_2bnk_true_enbld & ~sum0 & (sum01==2'b01);
//assign arb_dirvec_cpu1_seltop = arbadr_2bnk_true_enbld & (sum01==2'b10);
//
//assign arb_dirvec_cpu2_sel00 = arbadr_4bnk_true_enbld & (sum01==2'b00) & (sum012 == 2'b01);
//assign arb_dirvec_cpu2_sel01 = arbadr_4bnk_true_enbld & (sum01==2'b01) & (sum012 == 2'b10);
//assign arb_dirvec_cpu2_sel10 = arbadr_4bnk_true_enbld & (sum01==2'b10) & (sum012 == 2'b11);
//assign arb_dirvec_cpu2_selbot = arbadr_2bnk_true_enbld & (sum01==2'b00) & (sum012 == 2'b01);
//assign arb_dirvec_cpu2_seltop = arbadr_2bnk_true_enbld & (sum01==2'b01) & (sum012 == 2'b10);
//
//assign arb_dirvec_cpu3_sel00 = arbadr_4bnk_true_enbld & (sum012 == 2'b00) & (sum0123 == 3'b001);
//assign arb_dirvec_cpu3_sel01 = arbadr_4bnk_true_enbld & (sum012 == 2'b01) & (sum0123 == 3'b010);
//assign arb_dirvec_cpu3_sel10 = arbadr_4bnk_true_enbld & (sum012 == 2'b10) & (sum0123 == 3'b011);
//assign arb_dirvec_cpu3_sel11 = arbadr_4bnk_true_enbld & (sum012 == 2'b11) & (sum0123 == 3'b100);
//assign arb_dirvec_cpu3_selbot = arbadr_2bnk_true_enbld & (sum012 == 2'b00) & (sum0123 == 3'b001);
//assign arb_dirvec_cpu3_seltop = arbadr_2bnk_true_enbld & (sum012 == 2'b01) & (sum0123 == 3'b010);
//
//assign arb_dirvec_cpu4_sel00 = arbadr_4bnk_true_enbld & (sum0123 == 3'b000) & (sum01234 == 3'b001); 
//assign arb_dirvec_cpu4_sel01 = arbadr_4bnk_true_enbld & (sum0123 == 3'b001) & (sum01234 == 3'b010); 
//assign arb_dirvec_cpu4_sel10 = arbadr_4bnk_true_enbld & (sum0123 == 3'b010) & (sum01234 == 3'b011); 
//assign arb_dirvec_cpu4_sel11 = arbadr_4bnk_true_enbld & (sum0123 == 3'b011) & (sum01234 == 3'b100);
//assign arb_dirvec_cpu4_selbot = arbadr_2bnk_true_enbld & (sum0123 == 3'b000) & (sum01234 == 3'b001); 
//assign arb_dirvec_cpu4_seltop = arbadr_2bnk_true_enbld & (sum0123 == 3'b001) & (sum01234 == 3'b010); 
//
//assign arb_dirvec_cpu5_sel00 = arbadr_4bnk_true_enbld & (sum01234 == 3'b000) & (sum012345== 3'b001); 
//assign arb_dirvec_cpu5_sel01 = arbadr_4bnk_true_enbld & (sum01234 == 3'b001) & (sum012345== 3'b010); 
//assign arb_dirvec_cpu5_sel10 = arbadr_4bnk_true_enbld & (sum01234 == 3'b010) & (sum012345== 3'b011);
//assign arb_dirvec_cpu5_sel11 = arbadr_4bnk_true_enbld & (sum01234 == 3'b011) & (sum012345== 3'b100);
//assign arb_dirvec_cpu5_selbot = arbadr_2bnk_true_enbld & (sum01234 == 3'b000) & (sum012345 == 3'b001); 
//assign arb_dirvec_cpu5_seltop = arbadr_2bnk_true_enbld & (sum01234 == 3'b001) & (sum012345 == 3'b010); 
//
//assign arb_dirvec_cpu6_sel00 = arbadr_4bnk_true_enbld & (sum012345 == 3'b000) & (sum0123456 == 3'b001); 
//assign arb_dirvec_cpu6_sel01 = arbadr_4bnk_true_enbld & (sum012345 == 3'b001) & (sum0123456 == 3'b010); 
//assign arb_dirvec_cpu6_sel10 = arbadr_4bnk_true_enbld & (sum012345 == 3'b010) & (sum0123456 == 3'b011);
//assign arb_dirvec_cpu6_sel11 = arbadr_4bnk_true_enbld & (sum012345 == 3'b011) & (sum0123456 == 3'b100);
//assign arb_dirvec_cpu6_selbot = arbadr_2bnk_true_enbld & (sum012345 == 3'b000) & (sum0123456 == 3'b001); 
//assign arb_dirvec_cpu6_seltop = arbadr_2bnk_true_enbld & (sum012345 == 3'b001) & (sum0123456 == 3'b010); 
//
//assign arb_dirvec_cpu7_sel00 = arbadr_4bnk_true_enbld & (sum0123456 == 3'b000) & spc7_avl; 
//assign arb_dirvec_cpu7_sel01 = arbadr_4bnk_true_enbld & (sum0123456 == 3'b001) & spc7_avl; 
//assign arb_dirvec_cpu7_sel10 = arbadr_4bnk_true_enbld & (sum0123456 == 3'b010) & spc7_avl; 
//assign arb_dirvec_cpu7_sel11 = arbadr_4bnk_true_enbld & (sum0123456 == 3'b011) & spc7_avl; 
//assign arb_dirvec_cpu7_selbot = arbadr_2bnk_true_enbld & (sum0123456 == 3'b000) & spc7_avl;
//assign arb_dirvec_cpu7_seltop = arbadr_2bnk_true_enbld & (sum0123456 == 3'b001) & spc7_avl;
//

l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_2 sel_segment 
                        (.dout (seg[1:0]),
                         .din0 (2'b00),
                         .din1 (2'b01),
                         .din2 (2'b10),
                         .din3 (2'b11),
                         .sel0 (sel_00),
                         .sel1 (sel_01),
                         .sel2 (sel_10),
                         .sel3 (sel_11)
                        );



l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_3 mux_arb_cpuid_fnl_c2 
                        (.dout (arb_cpuid_fnl_c2[2:0]) ,
                        .din0(arbdec_arbdp_cpuid_c2[2:0]), // original cpuid , all banks enabled
                        .din1({seg[1:0],arbadr_arbdp_addr87_c2[1]}), // bit[8] in case of 4 banks enabled
                        .din2({~sel_bot_seg,arbadr_arbdp_addr87_c2[1:0]}), // bits 8:7 in case of 2 banks enabled
                             // fix for bug 93607, msb should be 1'b0 when sel_bot_seg = 1
                        .sel0(arbadr_ncu_l2t_pm_n),
                        .sel1(arbadr_4bnk_true_enbld),
                        .sel2(arbadr_2bnk_true_enbld)
                        );

  

l2t_arb_ctl_msff_ctl_macro__width_3 ff_arb_cpuid_c3 
     ( .din(arb_cpuid_fnl_c2), .l1clk(l1clk), 
       .scan_in(ff_arb_cpuid_c3_scanin),
       .scan_out(ff_arb_cpuid_c3_scanout),
       .dout(arb_cpuid_c3),
  .siclk(siclk),
  .soclk(soclk)
     );

l2t_arb_ctl_msff_ctl_macro__width_3 ff_arb_cpuid_c4 
     ( .din(arb_cpuid_c3), .l1clk(l1clk), 
       .scan_in(ff_arb_cpuid_c4_scanin),
       .scan_out(ff_arb_cpuid_c4_scanout),
       .dout(arb_cpuid_c4),
  .siclk(siclk),
  .soclk(soclk)
     );

l2t_arb_ctl_msff_ctl_macro__width_3 ff_arb_cpuid_c5 
     ( .din(arb_cpuid_c4), .l1clk(l1clk), 
       .scan_in(ff_arb_cpuid_c5_scanin),
       .scan_out(ff_arb_cpuid_c5_scanout),
       .dout(arb_cpuid_c5),
  .siclk(siclk),
  .soclk(soclk)
     );

l2t_arb_ctl_msff_ctl_macro__width_3 ff_arb_cpuid_c52 
     ( .din(arb_cpuid_c5), .l1clk(l1clk), 
       .scan_in(ff_arb_cpuid_c52_scanin),
       .scan_out(ff_arb_cpuid_c52_scanout),
       .dout(arb_cpuid_c52),
  .siclk(siclk),
  .soclk(soclk)
     );

 
 assign	dir_entry_c3 = { arb_cpuid_c3, arbdec_arbdp_l1way_c3 } ; 
 assign	dir_entry_c4 = { arb_cpuid_c4, 2'b01 } ; 
 assign	dir_entry_c5 = { arb_cpuid_c5, 2'b10 } ; 
 assign	dir_entry_c52 = { arb_cpuid_c52, 2'b11 } ; // BS 03/11/04 extra cycle for mem access 
 
 assign	def_inval_entry = ~( inval_inst_vld_c4 | 
                                inval_inst_vld_c5 | 
                                        inval_inst_vld_c52 ) ; // BS 03/11/04 extra cycle for mem access 
 
l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_inval_dir_entry_c3 
			(.dout (tmp_wr_dir_entry_c3[4:0]), 
                               .din0(dir_entry_c3[4:0]), .din1(dir_entry_c4[4:0]), 
                                .din2(dir_entry_c5[4:0]), .din3(dir_entry_c52[4:0]), 
                                .sel0(def_inval_entry), .sel1(inval_inst_vld_c4), 
                                .sel2(inval_inst_vld_c5), .sel3(inval_inst_vld_c52)); // BS 03/11/04 extra cycle for mem access 
 
  
 assign	wr_dir_entry_c3[1:0] = tmp_wr_dir_entry_c3[1:0] & ~{2{inval_inst_vld_c3}} ; 
 assign	wr_dir_entry_c3[4:2] = tmp_wr_dir_entry_c3[4:2] ; 
 
 
  
l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_5 mux_dir_entry_c3 
			(.dout (arb_wr_dc_dir_entry_c3[4:0]), 
                                .din0(dir_addr_cnt_c3[5:1]), .din1(wr_dir_entry_c3[4:0]), 
                                .sel0(store_inst_vld_c3_1), .sel1(~store_inst_vld_c3_1)); 

//  SR 12/6/04 :  Dir changes toggle ic dir entry for 8 clocks instead of 4
 
l2t_arb_ctl_msff_ctl_macro__width_5 ff_arb_ic_dir_wrentry_c4 
        (
        .scan_in(ff_arb_ic_dir_wrentry_c4_scanin),
        .scan_out(ff_arb_ic_dir_wrentry_c4_scanout),
        .din(arb_wr_dc_dir_entry_c3[4:0]), 
        .l1clk(l1clk),
        .dout(arb_ic_dir_wrentry_c4[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        );
l2t_arb_ctl_msff_ctl_macro__width_5 ff_arb_ic_dir_wrentry_c5 
        (
        .scan_in(ff_arb_ic_dir_wrentry_c5_scanin),
        .scan_out(ff_arb_ic_dir_wrentry_c5_scanout),
        .din(arb_ic_dir_wrentry_c4[4:0]),
        .l1clk(l1clk),
        .dout(arb_ic_dir_wrentry_c5[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        );
l2t_arb_ctl_msff_ctl_macro__width_5 ff_arb_ic_dir_wrentry_c6 
        (
        .scan_in(ff_arb_ic_dir_wrentry_c6_scanin),
        .scan_out(ff_arb_ic_dir_wrentry_c6_scanout),
        .din(arb_ic_dir_wrentry_c5[4:0]),
        .l1clk(l1clk),
        .dout(arb_ic_dir_wrentry_c6[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        );

l2t_arb_ctl_msff_ctl_macro__width_5 ff_arb_ic_dir_wrentry_c7 
        (
        .scan_in(ff_arb_ic_dir_wrentry_c7_scanin),
        .scan_out(ff_arb_ic_dir_wrentry_c7_scanout),
        .din(arb_ic_dir_wrentry_c6[4:0]),
        .l1clk(l1clk),
        .dout(arb_ic_dir_wrentry_c7[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        );


assign inval_foric_vld = ic_inval_vld_c6 | arb_ic_inval_vld_c7 | arb_ic_inval_vld_c8 |
			arb_ic_inval_vld_c9;

l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_5 mux_arb_wr_ic_dir_entry_c3 
                        (
                         .dout(arb_wr_ic_dir_entry_c3[4:0]), 
                         .din0(arb_wr_dc_dir_entry_c3[4:0]), 
                         .din1(arb_ic_dir_wrentry_c7[4:0]), 
                         .sel0(~inval_foric_vld), 
                         .sel1(inval_foric_vld));

// Not anymore since it is now 8 clocks
// assign	arb_wr_ic_dir_entry_c3 = arb_wr_dc_dir_entry_c3 ; 
//

 assign arb_inval_inst_vld_c3 = inval_inst_vld_c3;
 
//////////////////////////////////////////////////////////////////////// 
// 10. Rd/Wr Panel number  
//     BS and SR 11/18/03 Support for 8 way I$
//	d$ panel number = X<10-9>, Y<5-4>  
//	i$ panel number	= X<10-9>, Y<5,I$ l1 way[2]> 
//////////////////////////////////////////////////////////////////////// 
 
 
 assign	dc_wr_panel_c3 = { arbadr_arbdp_addr11to4_c3[6:4], arbadr_arbdp_addr11to4_c3[1:0]}; 
 
l2t_arb_ctl_msff_ctl_macro__width_5 ff_dc_wr_panel_c4 
                           (.din(dc_wr_panel_c3[4:0]), .l1clk(l1clk), 
             	.scan_in(ff_dc_wr_panel_c4_scanin),
             	.scan_out(ff_dc_wr_panel_c4_scanout),
             	.dout(dc_wr_panel_c4[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_5 ff_dc_wr_panel_c5 
                           (.din(dc_wr_panel_c4[4:0]), .l1clk(l1clk), 
             	.scan_in(ff_dc_wr_panel_c5_scanin),
             	.scan_out(ff_dc_wr_panel_c5_scanout),
             	.dout(dc_wr_panel_c5[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_arb_ctl_msff_ctl_macro__width_5 ff_dc_wr_panel_c52 
                           (.din(dc_wr_panel_c5[4:0]), .l1clk(l1clk),
                .scan_in(ff_dc_wr_panel_c52_scanin),
                .scan_out(ff_dc_wr_panel_c52_scanout),
                .dout(dc_wr_panel_c52[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_inval_dc_panel_c3 
			(.dout (tmp_dc_wr_panel_c3[4:0]), 
                                .din0(dc_wr_panel_c3[4:0]), .din1(dc_wr_panel_c4[4:0]), 
                                .din2(dc_wr_panel_c5[4:0]), .din3(dc_wr_panel_c52[4:0]), 
                                .sel0(def_inval_entry), .sel1(inval_inst_vld_c4), 
                                .sel2(inval_inst_vld_c5), .sel3(inval_inst_vld_c52)); // BS 03/11/04 extra cycle for mem access 
 
l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_5 mux_dc_dir_panel_c3 
			(.dout (arb_dir_panel_dcd_c3[4:0]), 
                                .din0(dir_addr_cnt_c3[10:6]), .din1(tmp_dc_wr_panel_c3[4:0]), 
                                .sel0(store_inst_vld_c3_2), .sel1(~store_inst_vld_c3_2)); 
 
 
// BS and SR 11/18/03 Support for 8 way I$
// Row Select for I$ panel 
// Support for 8 way I$. Two rows need to be cammed out of 4 for every
// Load hit or Store hit. All four rows need to be cammed for an Eviction
// Each row holds I$ ways 0 through 3 or I$ ways 4 through 7.
// Row select = {addr[5],I$ L1 way[2]}

l2t_arb_ctl_msff_ctl_macro__width_1 ff_arbdec_arbdp_inst_bufidlo_c3 
	 (.din(arbdec_arbdp_inst_bufidlo_c2), .l1clk(l1clk),
                .scan_in(ff_arbdec_arbdp_inst_bufidlo_c3_scanin),
                .scan_out(ff_arbdec_arbdp_inst_bufidlo_c3_scanout),
                .dout(arbdec_arbdp_inst_bufidlo_c3),
  .siclk(siclk),
  .soclk(soclk)  
);

assign	ic_wr_panel_c3 = { arbadr_arbdp_addr11to4_c3[6:4], arbadr_arbdp_addr11to4_c3[1], arbdec_arbdp_inst_bufidlo_c3}; 


  
l2t_arb_ctl_msff_ctl_macro__width_5 ff_ic_wr_panel_c4 
                           (.din(ic_wr_panel_c3[4:0]), .l1clk(l1clk), 
             	.scan_in(ff_ic_wr_panel_c4_scanin),
             	.scan_out(ff_ic_wr_panel_c4_scanout),
             	.dout(ic_wr_panel_c4[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_arb_ctl_msff_ctl_macro__width_5 ff_ic_wr_panel_c5 
                           (.din(ic_wr_panel_c4[4:0]), .l1clk(l1clk), 
             	.scan_in(ff_ic_wr_panel_c5_scanin),
             	.scan_out(ff_ic_wr_panel_c5_scanout),
             	.dout(ic_wr_panel_c5[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_arb_ctl_msff_ctl_macro__width_5 ff_ic_wr_panel_c52 
                           (.din(ic_wr_panel_c5[4:0]), .l1clk(l1clk),
                .scan_in(ff_ic_wr_panel_c52_scanin),
                .scan_out(ff_ic_wr_panel_c52_scanout),
                .dout(ic_wr_panel_c52[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
);


//  SR 12/6/04  :: DIR changes 


l2t_arb_ctl_msff_ctl_macro__width_5 ff_ic_wr_panel_c6 
              (
		.scan_in(ff_ic_wr_panel_c6_scanin),
		.scan_out(ff_ic_wr_panel_c6_scanout),
		.din(ic_wr_panel_c52[4:0]), 
		.l1clk(l1clk),
                .dout(ic_wr_panel_c6[4:0]),
  .siclk(siclk),
  .soclk(soclk)
		);

l2t_arb_ctl_msff_ctl_macro__width_5 ff_ic_wr_panel_c7 
              (
                .scan_in(ff_ic_wr_panel_c7_scanin),
                .scan_out(ff_ic_wr_panel_c7_scanout),
                .din(ic_wr_panel_c6[4:0]), 
                .l1clk(l1clk),
                .dout(ic_wr_panel_c7[4:0]),
  .siclk(siclk),
  .soclk(soclk)
                );
l2t_arb_ctl_msff_ctl_macro__width_5 ff_ic_wr_panel_c8 
              (
                .scan_in(ff_ic_wr_panel_c8_scanin),
                .scan_out(ff_ic_wr_panel_c8_scanout),
                .din(ic_wr_panel_c7[4:0]), 
                .l1clk(l1clk),
                .dout(ic_wr_panel_c8[4:0]),
  .siclk(siclk),
  .soclk(soclk)
                );
l2t_arb_ctl_msff_ctl_macro__width_5 ff_ic_wr_panel_c9 
              (
                .scan_in(ff_ic_wr_panel_c9_scanin),
                .scan_out(ff_ic_wr_panel_c9_scanout),
                .din(ic_wr_panel_c8[4:0]), 
                .l1clk(l1clk),
                .dout(ic_wr_panel_c9[4:0]),
  .siclk(siclk),
  .soclk(soclk)
                );


assign mux_sel_ic_inval_678_n = ~(ic_inval_vld_c6 | arb_ic_inval_vld_c7 | arb_ic_inval_vld_c8);

l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_inval_ic_panel_second_half 
                (
                .dout (tmp_ic_wr_panel_c3_1[4:0]),
                .din0(ic_wr_panel_c6[4:0]), .din1(ic_wr_panel_c7[4:0]),
                .din2(ic_wr_panel_c8[4:0]), .din3(ic_wr_panel_c9[4:0]),
                .sel0(ic_inval_vld_c6), .sel1(arb_ic_inval_vld_c7),
                .sel2(arb_ic_inval_vld_c8), .sel3(mux_sel_ic_inval_678_n)
                );


assign mux_sel_ic_inval_6789 = ~mux_sel_ic_inval_678_n | arb_ic_inval_vld_c9; 


l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_inval_ic_panel_c3 
		(
		.dout (tmp_ic_wr_panel_c3[4:0]), 
                .din0(ic_wr_panel_c3[4:0]), .din1(ic_wr_panel_c4[4:0]), 
                .din2(ic_wr_panel_c5[4:0]), .din3(ic_wr_panel_c52[4:0]), 
                .sel0(def_inval_entry), .sel1(inval_inst_vld_c4), 
                .sel2(inval_inst_vld_c5), .sel3(inval_inst_vld_c52)
		); 


assign fnl_sel_inval = ~store_inst_vld_c3_2 &  mux_sel_ic_inval_6789;
assign fnl_sel_default = ~store_inst_vld_c3_2 &  ~mux_sel_ic_inval_6789;

 
l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_5 mux_ic_dir_panel_c3 
		(
		.dout (arb_dir_panel_icd_c3[4:0]), 
                .din0(dir_addr_cnt_c3[10:6]), 
		.din1(tmp_ic_wr_panel_c3[4:0]), 
		.din2(tmp_ic_wr_panel_c3_1[4:0]), 
                .sel0(store_inst_vld_c3_2), //.sel1(~store_inst_vld_c3_2)
		.sel1(fnl_sel_default),
		.sel2(fnl_sel_inval)
		); 









 ////////////////////////////////////////////////////////////////////////// 
 // Valid bit written into the directory entries is  
 // * 0 when an invalidation instruction is active 
 // * 1 by default. 
 ////////////////////////////////////////////////////////////////////////// 
 
 assign	arb_dir_vld_c3_l = ~( inval_inst_vld_c3 | 
				inval_inst_vld_c4 | 
				inval_inst_vld_c5 | 
				inval_inst_vld_c52 | 
				ic_inval_vld_c6 | 
                                arb_ic_inval_vld_c7 | 
                                arb_ic_inval_vld_c8 | 
                                arb_ic_inval_vld_c9) ; 
  
 ////////////////////////////////////////////////////////////////////////// 
 // 2nd cycle stall condition for WR64 and RD64 
 ////////////////////////////////////////////////////////////////////////// 
 assign	rdma_64B_stall = ( decdp_wr64_inst_c2_1 | arb_decdp_ld64_inst_c2 ) & 
				arb_inst_vld_c2_7 ; 
  
l2t_arb_ctl_msff_ctl_macro__width_1 ff_wr64_inst_c3 
                           (.din(decdp_wr64_inst_c2_1), .l1clk(l1clk), 
             	.scan_in(ff_wr64_inst_c3_scanin),
             	.scan_out(ff_wr64_inst_c3_scanout),
             	.dout(wr64_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 ////////////////////////////////////////////////////////////////////////// 
 // Way select gate 
 // Way selects are turned off for the following types of operations. 
 // * INterrupts  
 // * L1 $ inval instructions. 
 // * Prefetch ICE
 // * Fills. 
 // * Diagnostic instructions. 
 // * cas2 from the xbar. 
 // * Tecc instructions. 
 // * eviction instructions. 
 ////////////////////////////////////////////////////////////////////////// 
 
 
 assign	waysel_gate_c1 = ~( decdp_inst_int_or_inval_c1 | // int or inval instr. 
				arbdec_arbdp_inst_fb_c1_qual | // Fills. 
				arb_inst_diag_c1 | 	// diagnostic instruction 
				decdp_cas2_from_xbar_c1 |  // cas2 from xbar 
                                decdp_pf_ice_inst_c1 | // Prefetch Ice
				dec_evict_c1	| // eviction instruction. 
				arbdec_arbdp_tecc_c1	); // tecc instruction 
			 
assign arb_l2drpt_waysel_gate_c1 = waysel_gate_c1;




l2t_arb_ctl_msff_ctl_macro__width_1 ff_waysel_gate_c2 
                           (.din(waysel_gate_c1), .l1clk(l1clk), 
             	.scan_in(ff_waysel_gate_c2_scanin),
             	.scan_out(ff_waysel_gate_c2_scanout),
             	.dout(arb_waysel_gate_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 ////////////////////////////////////////////////////////////////////////// 
 // Par err gate C1 
 // Parity error is gated off for the tag under the following conditions: 
 // - INterrupts 
 // L1 $ inval instructions 
 // Prefetch ICE
 // Fills 
 // Diagnostic instructions 
 // Tecc instructions 
 ////////////////////////////////////////////////////////////////////////// 
 
 assign parerr_gate_c1 = ~( decdp_inst_int_or_inval_c1 | // int or inval instr. 
                                (decdp_pf_ice_inst_c1 & ~arbdec_arbdp_evict_c1)  | // Prefetch Ice 1st pass
                                arbdec_arbdp_inst_fb_c1_qual | // Fills. 
                                arb_inst_diag_c1 | 
				arbdec_arbdp_tecc_c1   ); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_parerr_gate_c1 
                           (.din(parerr_gate_c1), .l1clk(l1clk), 
             	.scan_in(ff_parerr_gate_c1_scanin),
             	.scan_out(ff_parerr_gate_c1_scanout),
             	.dout(parerr_gate_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	arb_tagd_perr_vld_c2 = arb_inst_vld_c2   
					& ~l2_bypass_mode_on_d1  
					& parerr_gate_c2 ; 
 
 
 
 ////////////////////////////////////////////////////////////////////////// 
 // Stall logic. 
 // The following instructions/events cause the C1 instruction in  
 // the pipe to be stalled. 
 // * evictions. 	(2 cycle stall ) 
 // * Fills. 	(2 cycle stall ) 
 // * Imiss. 	(1 cycle stall ) 
 // * tecc. 	(n cycle stall ) 
 // * diagnostic access. 	(data=2, tag=3, vuad=4)  
 // * snoop access ( n cycle stall ) 
 // * SAme col stall  
 //  
 // The above multicycle stall conditions are detected in C1  
 // and so is the same col stall. This is qualfied with  
 // arb_unstalled_inst_c1. 
 // WHen a multicycle instruction is in C2 or beyond, inst_vld_cn is 
 // used for qualifying that instruction. 
 // 
 ////////////////////////////////////////////////////////////////////////// 
 
 assign	arb_multi_cyc_c1 = ( multi_cyc_op_c1 | 	// all mutlcyc ops except diagnostics. 
			arb_inst_diag_c1 )   
 			& ~arb_stall_c2  &  arb_inst_vld_c1_1 ; // unstalled valid instruction in C1. 
 
 ////////////////////////////////////////////////////////////////////////// 
 // imiss_col_stall_c1: 	 
 //-------------------------------------------------------------------- 
 //	instA 		C1		C2		C3 
 //	instB				C1 stall	C1 stall 
 //     OR 
 //	instB				PX2 nostall	C1 stall 
 //-------------------------------------------------------------------- 
 // when an imiss packet is in C2, stall is high due to arb_multi_cyc_c1. 
 // when the imiss packet is in C3, stall is high if the instruction stalled 
 // in C1 or in PX2 accesses the same column as the second imiss packet . 
 // ** arbadr_arbdp_new_addr5to4_px2 ** is the output of the address muxes in arbadr 
 // not including the final stall mux. 
 ////////////////////////////////////////////////////////////////////////// 
//			px2	c1      c2    c3    C4
///////////////////////////////////////////////////////////////////////////////////////////////
//	inst A          	imiss1               
//				stall_c1
//	inst A			imiss2		imiss1
//				no_c1 Stall	noc2stall
//  same col inst B		imiss Stall 		imiss2	imiss1
// ~same col inst B		NoStall		imiss2	imiss1
//	
///////////////////////////////////////////////////////////////////////////////////////////////

assign  imiss_stall_op_c1inc1 = (arbadr_arbdp_addr5to4_c1[0] & arb_stall_c2 & arb_imiss_vld_c2 ) ;


//
//assign  same_col_stall_c1 = ~arb_stall_c2 & (
//         ( arb_inst_vld_c1_1 & (
//	 (~arbadr_arbdp_addr5to4_c1[1] & ~arbadr_arbdp_addr5to4_c1[0] & ~arbadr_arbdp_new_addr5to4_px2[0])  |
//	 (~arbadr_arbdp_addr5to4_c1[1] &  arbadr_arbdp_addr5to4_c1[0] &  arbadr_arbdp_new_addr5to4_px2[0])  |
//	 ( arbadr_arbdp_addr5to4_c1[1] & ~arbadr_arbdp_addr5to4_c1[0] & ~arbadr_arbdp_new_addr5to4_px2[0])  |
//	 ( arbadr_arbdp_addr5to4_c1[1] &  arbadr_arbdp_addr5to4_c1[0] &  arbadr_arbdp_new_addr5to4_px2[0]))) |
//         ( arb_imiss_vld_c2 & arbadr_arbdp_new_addr5to4_px2[0] ));
//

assign  same_col_stall_c1 = ~arb_stall_c2 & (
         ( arb_inst_vld_c1_1 & (
         ( ~arbadr_arbdp_addr5to4_c1[0] & ~arbadr_arbdp_new_addr5to4_px2[0])  |
         (  arbadr_arbdp_addr5to4_c1[0] &  arbadr_arbdp_new_addr5to4_px2[0]))) |
         ( arb_imiss_vld_c2 & arbadr_arbdp_new_addr5to4_px2[0] ));


 
 ////////////////////////////////////////////////////////////////////////// 
 // same_col_stall_c1: 	 
 //-------------------------------------------------------------------- 
 //	instA 				C1 nostall	C2		 
 //	instB				PX2 		C1 stall 
 //-------------------------------------------------------------------- 
 // If a packet in PX2 has the same address as a packet in C1 that is not 
 // currently stalling in C1. 
 ////////////////////////////////////////////////////////////////////////// 
 
  
 ////////////// 
 // The following component of stall does not require any qualification  
 // since it already is qualified with inst vld in the appropriate stages. 
// Notice that in the case of tecc or deccck stalls, the stall is asserted for  
 // one more cycle than the operation itself so that the instruction stalled in 
 // C1 can again access the tags and VUAD array. 
 ////////////// 
 
 
 assign	arb_prev_stall_c1 = arb_evict_vld_c2 | // evict last cyc 
			 (arb_fill_vld_c2 | arb_fill_vld_c3)  |  // fill last 2 cycles 
			rdma_64B_stall | // 64B rdma access  
	( inval_inst_vld_c2 | inval_inst_vld_c3 | inval_inst_vld_c4 )| // inval cyc2-4  
//  SR 12/6/04 :  Dir changes stall for 4 more clocks from c4
( ic_inval_vld_c5 | ic_inval_vld_c52 | ic_inval_vld_c6 | arb_ic_inval_vld_c7) |
			( inst_l2data_vld_c2 ) | // data diag. last cyc  
			( inst_l2tag_vld_c2 | inst_l2tag_vld_c3 ) | // tag last 2 cycles 
			( inst_l2vuad_vld_c2 | inst_l2vuad_vld_c3 | inst_l2vuad_vld_c4 ) | // vuad last 3 cycles. 
			 ( inc_tag_ecc_cnt_c2 | inc_tag_ecc_cnt_c3 ) | // tecc stall  
			 ( data_ecc_active_c4 ) ; // deccck stall from tag. 
				 
assign	arb_stall_tmp_c1 = ( imiss_stall_op_c1inc1 ) | 
			( arb_multi_cyc_c1 ) | 
			( arb_prev_stall_c1 ) ; 
			 
assign	arb_stall_c1 = (arb_stall_tmp_c1 | same_col_stall_c1) ; 
  
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_stall_c1 
                           (.din(arb_stall_c1), .l1clk(l1clk), 
          	.scan_in(ff_arb_stall_c1_scanin),
          	.scan_out(ff_arb_stall_c1_scanout),
          	.dout(arb_stall_unqual_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	arb_stall_c2 = arb_stall_unqual_c2 &  arb_inst_vld_c1_1 ; 
  
////////////////////////////////////////////////////////// 
//// instruction valid logic 
// An instruction from the IQ/PCX without V=1 is considered 
// to be an invalid instruction. 
// Since the V bit is part of the payload, it is late arriving 
// compared to the rdy bit.  
// 
// THe rdy bit  is used to enable tag vuad  and cam access. 
// However, the V bit of the packet needs to be high 
// for the instruction to be considered valid. 
////////////////////////////////////////////////////////// 
 
 assign	arb_inst_vld_px2 = ( arb_stall_c2 | 
 	mbsel_px2 |  
	fbsel_px2 |  
	snpsel_px2 |  
	( iqsel_px2 & ique_iq_arb_vbit_px2 )   
	)  ; 

// int 5.0 change				 
// arbctl_inst_vld_c1 is used only for
// enabling the lkup in bw_r_cm16x40b i.e. fb,wb and rdma tags.
// This flop is disabled by the assertion of sehold.

l2t_arb_ctl_msff_ctl_macro__clr_1__width_1 ff_arb_inst_vld_c1  // sync reset active low
                           (.din(arb_inst_vld_px2), .l1clk(l1clk),  
		 .scan_in(ff_arb_inst_vld_c1_scanin),
		 .scan_out(ff_arb_inst_vld_c1_scanout),
		 .clr(~dbb_rst_l), 
	         .dout(arb_inst_vld_c1_fnl),
  .siclk(siclk),
  .soclk(soclk)  
); 

assign mbist_any_tag_lookup = l2t_mb2_rdmatag_lookup_en | l2t_mb2_fbtag_lookup_en 
				| l2t_mb2_wbtag_lookup_en;

l2t_arb_ctl_msff_ctl_macro__width_7 ff_mbist_lookup_r1  
	(
	.scan_in(ff_mbist_lookup_r1_scanin),
	.scan_out(ff_mbist_lookup_r1_scanout),
	.din({l2t_mb2_fbtag_lookup_en, l2t_mb2_wbtag_lookup_en,
	l2t_mb2_mbtag_lookup_en_r1, l2t_mb2_rdmatag_lookup_en,mbist_any_tag_lookup,mbist_any_tag_lookup_reg,mbist_any_tag_lookup_reg1}), 
	.l1clk(l1clk),
	.dout({l2t_mb2_fbtag_lookup_en_r1, l2t_mb2_wbtag_lookup_en_r1,
		l2t_mb2_mbtag_lookup_en_r2, l2t_mb2_rdmatag_lookup_en_r1,mbist_any_tag_lookup_reg,mbist_any_tag_lookup_reg1,mbist_any_tag_lookup_reg2}),
  .siclk(siclk),
  .soclk(soclk)
	);


assign mbist_lookupen = (l2t_mb2_fbtag_lookup_en_r1 | l2t_mb2_wbtag_lookup_en_r1 |
			 l2t_mb2_mbtag_lookup_en_r1 | l2t_mb2_rdmatag_lookup_en_r1);

//assign arb_inst_vld_c1 = l2t_mb2_run_r1 ? (l2t_mb2_fbtag_lookup_en_r1 | 
//	l2t_mb2_wbtag_lookup_en_r1 | l2t_mb2_rdmatag_lookup_en_r1) : arb_inst_vld_c1_fnl;

assign arb_inst_vld_c1 = l2t_mb2_run_r1 ? mbist_any_tag_lookup_reg2 : arb_inst_vld_c1_fnl;
 
l2t_arb_ctl_msff_ctl_macro__clr_1__width_1 ff_arb_inst_vld_c1_1  // sync reset active low
                           (.din(arb_inst_vld_px2), .l1clk(l1clk),  
		 .scan_in(ff_arb_inst_vld_c1_1_scanin),
		 .scan_out(ff_arb_inst_vld_c1_1_scanout),
		 .clr(~dbb_rst_l), 
	         .dout(arb_inst_vld_c1_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
  
 // the following expression indicates if an instruction will be 
 // valid in the next cycle in the C2 stage. 
 
 assign	inst_vld_c2_prev =  arb_inst_vld_c1_1  & ~arb_stall_unqual_c2 ; 

 assign	arb_inst_vld_c2_prev =  arb_inst_vld_c1_1  & ~arb_stall_unqual_c2 ; 
 
// make 8 copies of instruction valid 
// since it is heavily loaded. 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_vld_c2 
                           (.din(inst_vld_c2_prev), .l1clk(l1clk),  
	         .scan_in(ff_arb_inst_vld_c2_scanin),
	         .scan_out(ff_arb_inst_vld_c2_scanout),
	         .dout(arb_inst_vld_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_vld_c2_1 
                           (.din(inst_vld_c2_prev), .l1clk(l1clk),  
	         .scan_in(ff_arb_inst_vld_c2_1_scanin),
	         .scan_out(ff_arb_inst_vld_c2_1_scanout),
	         .dout(arb_inst_vld_c2_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_vld_c2_2 
                           (.din(inst_vld_c2_prev), .l1clk(l1clk),  
	         .scan_in(ff_arb_inst_vld_c2_2_scanin),
	         .scan_out(ff_arb_inst_vld_c2_2_scanout),
	         .dout(arb_inst_vld_c2_2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_vld_c2_3 
                           (.din(inst_vld_c2_prev), .l1clk(l1clk),  
	         .scan_in(ff_arb_inst_vld_c2_3_scanin),
	         .scan_out(ff_arb_inst_vld_c2_3_scanout),
	         .dout(arb_inst_vld_c2_3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_vld_c2_4 
                           (.din(inst_vld_c2_prev), .l1clk(l1clk),  
	         .scan_in(ff_arb_inst_vld_c2_4_scanin),
	         .scan_out(ff_arb_inst_vld_c2_4_scanout),
	         .dout(arb_inst_vld_c2_4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_vld_c2_5 
                           (.din(inst_vld_c2_prev), .l1clk(l1clk),  
	         .scan_in(ff_arb_inst_vld_c2_5_scanin),
	         .scan_out(ff_arb_inst_vld_c2_5_scanout),
	         .dout(arb_inst_vld_c2_5),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_vld_c2_6 
                           (.din(inst_vld_c2_prev), .l1clk(l1clk),  
	         .scan_in(ff_arb_inst_vld_c2_6_scanin),
	         .scan_out(ff_arb_inst_vld_c2_6_scanout),
	         .dout(arb_inst_vld_c2_6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_vld_c2_7 
                           (.din(inst_vld_c2_prev), .l1clk(l1clk),  
	         .scan_in(ff_arb_inst_vld_c2_7_scanin),
	         .scan_out(ff_arb_inst_vld_c2_7_scanout),
	         .dout(arb_inst_vld_c2_7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	arb_tag_inst_vld_c2 = arb_inst_vld_c2_2; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_vld_c2_8 
                           (.din(inst_vld_c2_prev), .l1clk(l1clk),  
	         .scan_in(ff_arb_inst_vld_c2_8_scanin),
	         .scan_out(ff_arb_inst_vld_c2_8_scanout),
	         .dout(arb_inst_vld_c2_8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	arb_waysel_inst_vld_c2 = arb_inst_vld_c2_8 ; // to tag waysel comp. 
 
 


 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_vld_c2_10 
                           (.din(inst_vld_c2_prev), .l1clk(l1clk),  
	         .scan_in(ff_arb_inst_vld_c2_10_scanin),
	         .scan_out(ff_arb_inst_vld_c2_10_scanout),
	         .dout(arb_inst_vld_c2_10),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	arb_rdwr_inst_vld_c2 = arb_inst_vld_c2_10 ; // to tag rdwr comp. 

// int 5.0 change 
//msff_ctl_macro ff_arb_inst_vld_c2_11 (width=1)
//                           (.din(inst_vld_c2_prev), .l1clk(l1clk),  
//	         .dout(arb_inst_vld_c2_11),  
//		.scan_in(), 
//		.scan_out()
//); 
// 
//assign	arb_wen_inst_vld_c2 = arb_inst_vld_c2_11 ; // to tag word_en comp. 
 
 
 assign	arb_misbuf_inst_vld_c2 = arb_inst_vld_c2_3 ; 

// the following signal is flopped in filbuf
// assign	arb_filbuf_inst_vld_c2 = arb_inst_vld_c2_4 ; 
 assign	arb_wbuf_inst_vld_c2 = arb_inst_vld_c2_5 ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_vld_c3 
                           (.din(arb_inst_vld_c2), .l1clk(l1clk),  
	         .scan_in(ff_arb_inst_vld_c3_scanin),
	         .scan_out(ff_arb_inst_vld_c3_scanout),
	         .dout(arb_inst_vld_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_vld_c3_1 
                           (.din(arb_inst_vld_c2_1), .l1clk(l1clk),  
	         .scan_in(ff_arb_inst_vld_c3_1_scanin),
	         .scan_out(ff_arb_inst_vld_c3_1_scanout),
	         .dout(arb_inst_vld_c3_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_inst_vld_c3_2 
                           (.din(arb_inst_vld_c2_1), .l1clk(l1clk),  
	         .scan_in(ff_arb_inst_vld_c3_2_scanin),
	         .scan_out(ff_arb_inst_vld_c3_2_scanout),
	         .dout(arb_inst_vld_c3_2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// assign	arb_dbg_inst_vld_c3 = arb_inst_vld_c3 ; 
 
 //////////////////////////////////////////////////////////////////////// 
 // MB CAM hit DISABLE  : arb_misbuf_hit_off_c1  
 // Miss Buffer hit is disabled in the following conditions: 
 // * MB or FB instruction. 
 // * invalid instruction. 
 // * INVAL instruction  
 // * Diagnostic  
 // * INterrupt instruction 
 //////////////////////////////////////////////////////////////////////// 

//-----------\/ FIX for BUG#4619. Mb is cammed on a INVAL instruction as well \/---------

 assign	arb_misbuf_hit_off_c1 = ~arb_inst_vld_c1_1 | // invalid instruction 
		//	decdp_inst_int_or_inval_c1 | // int or inval c1 
                        arb_decdp_inst_int_c1 | // int C1
			arbdp_inst_mb_or_fb_c1 |  // mb or fb  
			arb_inst_diag_c1 ; // diagnostic access 

//-----------\/ FIX for BUG#4619. Mb is cammed on a INVAL instruction as well \/---------

 
 //////////////////////////////////////////////////////////////////////// 
 // FB CAM hit DISABLE  : arb_filbuf_hit_off_c1  
 // Fill Buffer hit is disabled in the following conditions: 
 // * FB instruction. 
 // * invalid instruction. 
 // * INVAL instruction  
 // * Diagnostic  
 // * INterrupt instruction 
 // * TECC instruction. 
 // * EVICT instruction 
 //////////////////////////////////////////////////////////////////////// 
 
 
 assign	arb_filbuf_hit_off_c1 = ~arb_inst_vld_c1_1 | // invalid instruction 
                        decdp_inst_int_or_inval_c1 | // int or inval c1 
                        arbdec_arbdp_inst_fb_c1_qual |  // mb or fb 
                        arb_inst_diag_c1 |  // diagnostic access 
			arbdec_arbdp_tecc_c1  |  // tecc instruction 
			dec_evict_c1 ; // eviction pass 
 
 //////////////////////////////////////////////////////////////////////// 
 // WB CAM hit DISABLE  : arb_wbuf_hit_off_c1  
 // WB Buffer hit is disabled in the following conditions: 
 // * FB instruction. 
 // * invalid instruction. 
 // * INVAL instruction  
 // * Diagnostic  
 // * INterrupt instruction 
 // * TECC instruction. 
 //////////////////////////////////////////////////////////////////////// 
 
 
 assign	arb_wbuf_hit_off_c1 = ~arb_inst_vld_c1_1 | // invalid instruction 
                        decdp_inst_int_or_inval_c1 | // int or inval c1 
                        arbdec_arbdp_inst_fb_c1_qual |  // mb or fb 
                        arb_inst_diag_c1 |  // diagnostic access 
			arbdec_arbdp_tecc_c1  ;  // tecc instruction 
 
 
 
 
 
 // Decode logic. 
 
  ////////////////////////////////////////////////////// 
 // unqualled eviction packet. 
 // If an instruction is a TECC instruction then eviction 
 // is turned off.Why? 
 // An instruction making an eviction pass could detect a 
 // TECC error. In this case, we mark the TECC bit in the 
 // miss Buffer and also keep the EVICT bit set. When the 
 // instruction makes its next pass through the L2 pipeline 
 // It will cause TECC repair and reset TECC_READY. 
 // The following pass will cause an eviction and reset EVICT_READY. 
//  IN order for this to happen, we need to set the EVICT bit for 
//  an EVICTIOn instruction with tecc=1. 
//  
 ////////////////////////////////////////////////////// 
 
 assign	dec_evict_c1 = arbdec_arbdp_evict_c1 & ~arbdec_arbdp_tecc_c1 ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_dec_evict_c2 
                           (.din(dec_evict_c1), .l1clk(l1clk), 
                 .scan_in(ff_dec_evict_c2_scanin),
                 .scan_out(ff_dec_evict_c2_scanout),
                 .dout(dec_evict_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	dec_evict_tecc_c1 = arbdec_arbdp_evict_c1 & arbdec_arbdp_tecc_c1 ; 
  
l2t_arb_ctl_msff_ctl_macro__width_1 ff_dec_evict_tecc_c2 
                           (.din(dec_evict_tecc_c1), .l1clk(l1clk), 
                 .scan_in(ff_dec_evict_tecc_c2_scanin),
                 .scan_out(ff_dec_evict_tecc_c2_scanout),
                 .dout(dec_evict_tecc_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	arb_evict_tecc_vld_c2 = dec_evict_tecc_c2 &  
					arb_inst_vld_c2_6 ; 
 
 ////////////////////////////////////////////////////// 
// normal store instruction 
////////////////////////////////////////////////////// 
assign  decdp_st_inst_c1  = ~arbdec_arbdp_inst_rsvd_c1 & ( 
                ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `STORE_RQ ) | 
                (( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `FWD_RQ )  & 
               ~arbdec_arbdp_inst_nc_c1 )        ); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_st_inst_c2 
                           (.din(decdp_st_inst_c1),   
        .scan_in(ff_decdp_st_inst_c2_scanin),
        .scan_out(ff_decdp_st_inst_c2_scanout),
        .l1clk(l1clk), .dout(arb_decdp_st_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_st_inst_c2_1 
                           (.din(decdp_st_inst_c1),   
        .scan_in(ff_decdp_st_inst_c2_1_scanin),
        .scan_out(ff_decdp_st_inst_c2_1_scanout),
        .l1clk(l1clk), .dout(decdp_st_inst_c2_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_st_inst_c3 
                           (.din(decdp_st_inst_c2_1),   
        .scan_in(ff_decdp_st_inst_c3_scanin),
        .scan_out(ff_decdp_st_inst_c3_scanout),
        .l1clk(l1clk), .dout(arb_decdp_st_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_st_inst_c3_1 
                           (.din(decdp_st_inst_c2_1),   
        .scan_in(ff_decdp_st_inst_c3_1_scanin),
        .scan_out(ff_decdp_st_inst_c3_1_scanout),
        .l1clk(l1clk), .dout(decdp_st_inst_c3_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_st_inst_c3_2 
                           (.din(decdp_st_inst_c2_1),   
        .scan_in(ff_decdp_st_inst_c3_2_scanin),
        .scan_out(ff_decdp_st_inst_c3_2_scanout),
        .l1clk(l1clk), .dout(decdp_st_inst_c3_2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
////////////////////////////////////////////////////// 
// 1) A normal store with bit[109] = 1 is treated like a 
//              Block init store if it is performed to 
//              address 0 within a cacheline. 
// bug #3395 
// PCX[109] is used to denote an RMO store ( BST or BIST ). 
// PCX[110] is used to denote a BST. 
////////////////////////////////////////////////////// 
 
 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arbdp_inst_bufid1_c2 
                           (.din(arbdec_arbdp_inst_bufid1_c1), .l1clk(l1clk), 
               .scan_in(ff_arbdp_inst_bufid1_c2_scanin),
               .scan_out(ff_arbdp_inst_bufid1_c2_scanout),
               .dout(inst_bufid1_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign   decdp_bis_inst_c2 = arbadr_arbdp_addr_start_c2 &    // addr<5:0> = 0 
                       ~arbdec_arbdp_rdma_inst_c2 & 
			~inst_bufid1_c2 & // implies a BST and not BIST 
        ( arbdec_arbdp_inst_rqtyp_c2[`L2_RQTYP_HI:`L2_RQTYP_LO] == `STORE_RQ ) &  
			arbdec_arbdp_inst_bufidlo_c2 ; 

assign   decdp_bs_inst_c2 = arbadr_arbdp_addr_start_c2 &    // addr<5:0> = 0
                       ~arbdec_arbdp_rdma_inst_c2 &
        ( arbdec_arbdp_inst_rqtyp_c2[`L2_RQTYP_HI:`L2_RQTYP_LO] == `STORE_RQ ) &
                        inst_bufid1_c2; // implies a BST

assign arb_bs_or_bis_inst_c2 = decdp_bis_inst_c2 | decdp_bs_inst_c2; // BST or BIST


 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_bis_inst_c2 
                           (.din(decdp_bis_inst_c2),   
        .scan_in(ff_decdp_bis_inst_c2_scanin),
        .scan_out(ff_decdp_bis_inst_c2_scanout),
        .l1clk(l1clk), .dout(arb_decdp_bis_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 
 
 
assign  decdp_rmo_st_c2 = ~arbdec_arbdp_rdma_inst_c2 &      // not a JBI inst 
        ( arbdec_arbdp_inst_rqtyp_c2[`L2_RQTYP_HI:`L2_RQTYP_LO] == `STORE_RQ )  & 
        		arbdec_arbdp_inst_bufidlo_c2 ; 

// BS 03/10/04 fix for bug : 80000, MAiD is being propagated from SPU to L2
// needs to be played back to SPU on bit 125 of CPX packet
 
assign decdp_strst_maid1_c2 = ( arbdec_arbdp_inst_rqtyp_c2[`L2_RQTYP_HI:`L2_RQTYP_LO] == `STRST_RQ)  &
                        arbdec_arbdp_inst_bufidlo_c2 ;

assign decdp_rmo_st_or_strst_maid1_c2 = decdp_rmo_st_c2 | decdp_strst_maid1_c2;
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_rmo_st_c3 
                           (.din(decdp_rmo_st_or_strst_maid1_c2),   
        .scan_in(ff_decdp_rmo_st_c3_scanin),
        .scan_out(ff_decdp_rmo_st_c3_scanout),
        .l1clk(l1clk), .dout(arb_decdp_rmo_st_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 

assign decdp_rmo_st_or_strst_c2 = decdp_rmo_st_c2 | arb_decdp_strst_inst_c2;

// rmo st or stream store will inval dir entry on a hit, will set inval_mask = 8'hff
// for stream store,dir entry inval  will not depend on status of maid bit

l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_rmo_or_strst_c3 
                           (.din(decdp_rmo_st_or_strst_c2),
        .scan_in(ff_decdp_rmo_or_strst_c3_scanin),
        .scan_out(ff_decdp_rmo_or_strst_c3_scanout),
        .l1clk(l1clk), .dout(decdp_rmo_st_or_strst_c3),
  .siclk(siclk),
  .soclk(soclk)
);
 
 
 
////////////////////////////////////////////////////// 
// streaming store 
////////////////////////////////////////////////////// 
assign  decdp_strst_inst_c1  =  ~arbdec_arbdp_inst_rsvd_c1  &  
              ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `STRST_RQ)   ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_strst_inst_c2 
                           (.din(decdp_strst_inst_c1),   
        .scan_in(ff_decdp_strst_inst_c2_scanin),
        .scan_out(ff_decdp_strst_inst_c2_scanout),
        .l1clk(l1clk), .dout(arb_decdp_strst_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_strst_inst_c2_1 
                           (.din(decdp_strst_inst_c1),   
        .scan_in(ff_decdp_strst_inst_c2_1_scanin),
        .scan_out(ff_decdp_strst_inst_c2_1_scanout),
        .l1clk(l1clk), .dout(decdp_strst_inst_c2_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
////////////////////////////////////////////////////// 
// rdma store instructions. 
////////////////////////////////////////////////////// 
 
assign  decdp_wr8_inst_c1 =  arbdec_arbdp_inst_rsvd_c1 &  
                        arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_LO+1] ; 
 
assign  decdp_wr64_inst_c1 =  arbdec_arbdp_inst_rsvd_c1 &  
                        arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_LO+2] ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_wr8_inst_c2 
                           (.din(decdp_wr8_inst_c1),   
        .scan_in(ff_decdp_wr8_inst_c2_scanin),
        .scan_out(ff_decdp_wr8_inst_c2_scanout),
        .l1clk(l1clk), .dout(arb_decdp_wr8_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_wr64_inst_c2 
                           (.din(decdp_wr64_inst_c1),  
        .scan_in(ff_decdp_wr64_inst_c2_scanin),
        .scan_out(ff_decdp_wr64_inst_c2_scanout),
        .l1clk(l1clk), .dout(arb_decdp_wr64_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_wr64_inst_c2_1 
                           (.din(decdp_wr64_inst_c1),  
        .scan_in(ff_decdp_wr64_inst_c2_1_scanin),
        .scan_out(ff_decdp_wr64_inst_c2_1_scanout),
        .l1clk(l1clk), .dout(decdp_wr64_inst_c2_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 ////////////////////////////////////////////////////// 
 // rdma ld instruction 
 ////////////////////////////////////////////////////// 
 
assign arb_decdp_ld64_inst_c1 = arbdec_arbdp_inst_rsvd_c1 & 
                        arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_LO] ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arb_decdp_ld64_inst_c1 
                           (.din(arb_decdp_ld64_inst_c1),  
        .scan_in(ff_arb_decdp_ld64_inst_c1_scanin),
        .scan_out(ff_arb_decdp_ld64_inst_c1_scanout),
        .l1clk(l1clk), .dout(arb_decdp_ld64_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 
////////////////////////////////////////////////////// 
// interrupt access to tagd via arb for disabling tag parity errors. 
////////////////////////////////////////////////////// 
 
assign  arb_decdp_inst_int_c1 = ~arbdec_arbdp_inst_rsvd_c1 & 
                            ~arbdec_arbdp_evict_c1 & 
        ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `INT_RQ ) ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_inst_int_c2 
                           (.din(arb_decdp_inst_int_c1), 
        .scan_in(ff_decdp_inst_int_c2_scanin),
        .scan_out(ff_decdp_inst_int_c2_scanout),
        .l1clk(l1clk), .dout(arb_decdp_inst_int_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 

// int 5.0 change 
//msff_ctl_macro ff_decdp_inst_int_c3 (width=1)
//                           (.din(arb_decdp_inst_int_c2), 
//        .l1clk(l1clk), .dout(arb_decdp_inst_int_c3),  
//		.scan_in(), 
//		.scan_out()
//); 
 
// Bug fix 87786
//
//assign decdp_inst_int_or_inval_c1  = arb_decdp_inst_int_c1 | 
//                                ( arbdec_arbdp_inst_bufidhi_c1 & 
//                                 ~arbdec_arbdp_inst_bufid1_c1 &
//                                 ~arbdec_arbdp_inst_fb_c1_qual  & 
//                                 ~arbdec_arbdp_inst_rsvd_c1 ) ; 
// 

assign decdp_inst_int_or_inval_c1  = arb_decdp_inst_int_c1 |
                                ( (decdp_pf_inst_c1 | decdp_ic_inval_c1 | decdp_dc_inval_c1) &
                                 ~arbdec_arbdp_inst_bufid1_c1 &
                                 ~arbdec_arbdp_inst_fb_c1_qual  &
                                 ~arbdec_arbdp_inst_rsvd_c1 ) ;


 
assign arbdp_inst_mb_or_fb_c1 = arbdec_arbdp_inst_mb_c1 | 
                                arbdec_arbdp_inst_fb_c1_qual ; 
 
 
////////////////////////////////////////////////////// 
 // the following decoded signals are required in vuad dp. 
 // *pst with and without ctrue logic 
 // *cas1 instruction decode. 
 // *cas2 instruction decode. 
 ////////////////////////////////////////////////////// 
 
 
 assign decdp_strpst_inst_c1 = ~arbdec_arbdp_inst_rsvd_c1 & 
                                ~arbdec_arbdp_evict_c1 & 
           ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `STRST_RQ) &  
           ~four_or_eight_byte_access_c1;// BS and SR 11/12/03 N2 Xbar Packet format change 
 
 // new net created to relieve timing pressure from the 
 // arb_tag_pst_no_ctrue_c2 signal that is used 
 // in the way_sel expression inside tag. 
 // This expr does not need a ~RSVD qualification as that is 
 // done inside tag. 
 
 // int 5.0 change
 assign	wr8_inst_pst_c1 = ~arbdec_arbdp_evict_c1 &  
				arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_LO+1] & ~four_or_eight_byte_access_c1;
 // BS and SR 11/12/03 N2 Xbar Packet format change :  
 
 assign decdp_rdmapst_inst_c1 = arbdec_arbdp_inst_rsvd_c1 & 
				wr8_inst_pst_c1 ; // int 5.0 change 

 assign arb_wr8_inst_no_ctrue_c1 = wr8_inst_pst_c1 & ~arbdec_arbdp_inst_ctrue_c1; // int 5.0 change 

  
// BS and SR 11/12/03 N2 Xbar Packet format change :

 assign  four_or_eight_byte_access_c1 = ((arbdec_arbdp_inst_size_c1[`L2_SZ_LO] & arbdec_arbdp_inst_size_c1[`L2_SZ_LO+1] &
                              arbdec_arbdp_inst_size_c1[`L2_SZ_LO+2] & arbdec_arbdp_inst_size_c1[`L2_SZ_LO+3]) &
                               (~arbdec_arbdp_inst_size_c1[`L2_SZ_HI] & ~arbdec_arbdp_inst_size_c1[`L2_SZ_HI-1] &
                                ~arbdec_arbdp_inst_size_c1[`L2_SZ_HI-2] & ~arbdec_arbdp_inst_size_c1[`L2_SZ_HI-3]))
                                // size [7:0] == 00001111
                               |
                               ((~arbdec_arbdp_inst_size_c1[`L2_SZ_LO] & ~arbdec_arbdp_inst_size_c1[`L2_SZ_LO+1] &
                              ~arbdec_arbdp_inst_size_c1[`L2_SZ_LO+2] & ~arbdec_arbdp_inst_size_c1[`L2_SZ_LO+3]) &
                               (arbdec_arbdp_inst_size_c1[`L2_SZ_HI] & arbdec_arbdp_inst_size_c1[`L2_SZ_HI-1] &
                                arbdec_arbdp_inst_size_c1[`L2_SZ_HI-2] & arbdec_arbdp_inst_size_c1[`L2_SZ_HI-3]))
                               // size [7:0] == 11110000
                               |
                               ((arbdec_arbdp_inst_size_c1[`L2_SZ_LO] & arbdec_arbdp_inst_size_c1[`L2_SZ_LO+1] &
                                arbdec_arbdp_inst_size_c1[`L2_SZ_LO+2] & arbdec_arbdp_inst_size_c1[`L2_SZ_LO+3]) &
                               (arbdec_arbdp_inst_size_c1[`L2_SZ_HI] & arbdec_arbdp_inst_size_c1[`L2_SZ_HI-1] &
                                arbdec_arbdp_inst_size_c1[`L2_SZ_HI-2] & arbdec_arbdp_inst_size_c1[`L2_SZ_HI-3]));
                               // size [7:0] == 11111111

 assign eight_byte_access_c1 = ((arbdec_arbdp_inst_size_c1[`L2_SZ_LO] & arbdec_arbdp_inst_size_c1[`L2_SZ_LO+1] &
                                arbdec_arbdp_inst_size_c1[`L2_SZ_LO+2] & arbdec_arbdp_inst_size_c1[`L2_SZ_LO+3]) &
                               (arbdec_arbdp_inst_size_c1[`L2_SZ_HI] & arbdec_arbdp_inst_size_c1[`L2_SZ_HI-1] &
                                arbdec_arbdp_inst_size_c1[`L2_SZ_HI-2] & arbdec_arbdp_inst_size_c1[`L2_SZ_HI-3]));
                               // size [7:0] == 11111111

//
// SR bug id 84953
// for a diagnostic access to data array both upper and lower 4 bytes 
// have to be enabled.  hence oring regular store byte with arb_inst_diag_c1
// 

 assign arb_upper_four_byte_access_c1 = (|(arbdec_arbdp_inst_size_c1[`L2_SZ_LO+3:`L2_SZ_LO]) |  // for st
					  arb_inst_diag_c1 ) ;  // for diag
 assign arb_lower_four_byte_access_c1 = (|(arbdec_arbdp_inst_size_c1[`L2_SZ_LO+7:`L2_SZ_LO+4]) | // for st
					  arb_inst_diag_c1 ) ;  // for diag

// 
// assign  decdp_pst_inst_c1  =   ( ~arbdec_arbdp_inst_rsvd_c1 & // BS and SR 11/12/03 N2 Xbar Packet format change 
//                                ~( arbadr_arbdp_ioaddr_c1_39to37[39:37] == 3'h5 ) & // int 5.0 change 
//                                ~arbdec_arbdp_evict_c1 & ( 
//        ( ~four_or_eight_byte_access_c1 & 
//        (( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `STORE_RQ ) |
//        ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `STRST_RQ ))) |  
//        ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `SWAP_RQ ) ))  |  
//                decdp_rdmapst_inst_c1 ;  
//
//

////   The below logic is cloned for timing reasons

 assign  decdp_pst_inst_c1_internal  =   ( ~arbdec_arbdp_inst_rsvd_c1 & // BS and SR 11/12/03 N2 Xbar Packet format change
                                ~( arbadr_arbdp_ioaddr_c1_39to37[39:37] == 3'h5 ) & // int 5.0 change
                                ~arbdec_arbdp_evict_c1 & (
        ( ~four_or_eight_byte_access_c1 &
        (( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `STORE_RQ ) |
        ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `STRST_RQ ))) |
        ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `SWAP_RQ ) ))  |
                decdp_rdmapst_inst_c1 ;





 
 assign decdp_pst_st_c1 = ~arbdec_arbdp_inst_rsvd_c1 & 
                          ~arbdec_arbdp_evict_c1 & 
        ( ~four_or_eight_byte_access_c1 &  // BS and SR 11/12/03 N2 Xbar Packet format change
        ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `STORE_RQ )) ; 
 
 
 assign pst_no_ctrue_c1 = ( decdp_pst_inst_c1_internal &  
			~arbdec_arbdp_inst_ctrue_c1); 
 
 ////////////////////////////////////////////////////////////// 
 // arb_decdp_st_with_ctrue_c2: 
 // This signal is used for generating an ERR packet  
 // for PST 2nd passes that encountered an error during  
 // the first pass. 
 // All partial stores ( including atomic stores ) 
 // are included in this signal. 
 ////////////////////////////////////////////////////////////// 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pst_inst_c2 
                           (.din(decdp_pst_inst_c1_internal), 
        .scan_in(ff_decdp_pst_inst_c2_scanin),
        .scan_out(ff_decdp_pst_inst_c2_scanout),
        .l1clk(l1clk), .dout(arb_decdp_pst_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pst_inst_c3 
                           (.din(arb_decdp_pst_inst_c2), 
        .scan_in(ff_decdp_pst_inst_c3_scanin),
        .scan_out(ff_decdp_pst_inst_c3_scanout),
        .l1clk(l1clk), .dout(decdp_pst_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pst_inst_c4 
                           (.din(decdp_pst_inst_c3), 
        .scan_in(ff_decdp_pst_inst_c4_scanin),
        .scan_out(ff_decdp_pst_inst_c4_scanout),
        .l1clk(l1clk), .dout(decdp_pst_inst_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pst_inst_c5 
                           (.din(decdp_pst_inst_c4), 
        .scan_in(ff_decdp_pst_inst_c5_scanin),
        .scan_out(ff_decdp_pst_inst_c5_scanout),
        .l1clk(l1clk), .dout(decdp_pst_inst_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pst_inst_c52 
                           (.din(decdp_pst_inst_c5),
        .scan_in(ff_decdp_pst_inst_c52_scanin),
        .scan_out(ff_decdp_pst_inst_c52_scanout),
        .l1clk(l1clk), .dout(decdp_pst_inst_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pst_inst_c6 
                           (.din(decdp_pst_inst_c52), 
        .scan_in(ff_decdp_pst_inst_c6_scanin),
        .scan_out(ff_decdp_pst_inst_c6_scanout),
        .l1clk(l1clk), .dout(decdp_pst_inst_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pst_inst_c7 
                           (.din(decdp_pst_inst_c6), 
        .scan_in(ff_decdp_pst_inst_c7_scanin),
        .scan_out(ff_decdp_pst_inst_c7_scanout),
        .l1clk(l1clk), .dout(decdp_pst_inst_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign st_with_ctrue_c1  = (( decdp_pst_st_c1 | decdp_strpst_inst_c1 | 
		decdp_rdmapst_inst_c1 | decdp_swap_inst_c1) & arbdec_arbdp_inst_ctrue_c1)
                |  decdp_cas2_inst_c1 ; 

                // BS 03/04/05 : on cas2 and swap that had errors in 
		// cas1 and swap/ldstub return phases, need to
		// return error type in cas2 and swap/ldstub acks.

                // Fix for bug 90935
                // cas1 with UE/ND would not set ctrue bit and store would get blocked in tag_ctl
                // cas1 with CE would still set Ctrue bit and store would happen.
                // In both of the above cases, cas2 would send err packet on cas ack packet 

                // swap/ldstub with UE/ND would still set ctrue bit , but store would get blocked in tag_ctl
                // through misbuf_uncorr_err_c2
                // swap/ldstub with CE would set ctrue bit and store would be allowed to happen
                // In both of the above cases, swap/ldstub ack would drive err field as valid 

l2t_arb_ctl_msff_ctl_macro__width_1 ff_st_no_ctrue_c1 
                           (.din(st_with_ctrue_c1), 
        .scan_in(ff_st_no_ctrue_c1_scanin),
        .scan_out(ff_st_no_ctrue_c1_scanout),
        .l1clk(l1clk), .dout(arb_decdp_st_with_ctrue_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 assign decdp_cas1_inst_c1 =   ~arbdec_arbdp_inst_rsvd_c1 & 
                                ~arbdec_arbdp_evict_c1 & 
             ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `CAS1_RQ )  ; 
 
 assign decdp_cas1_inst_c1_1 = decdp_cas1_inst_c1; 
 
 assign decdp_cas2_inst_c1 =   ~arbdec_arbdp_inst_rsvd_c1 & 
                                ~arbdec_arbdp_evict_c1 & 
             ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `CAS2_RQ )  ; 
 
 assign decdp_cas2_from_mb_c1 = decdp_cas2_inst_c1  
				& arbdec_arbdp_inst_mb_c1 ; 
 
 
 assign decdp_cas2_from_mb_ctrue_c1 = decdp_cas2_from_mb_c1 & 
                                        arbdec_arbdp_inst_ctrue_c1 ; 
 
 assign decdp_cas2_from_xbar_c1 = decdp_cas2_inst_c1  
				& ~arbdec_arbdp_inst_mb_c1 ; 
 
 
 
 ////////////////////////////////////////////////////// 
 // The following signal indicates that a tecc repair 
 // sequence needs to be initiated in arb. 
 // The appropriate counters need to be initialized. 
 ////////////////////////////////////////////////////// 
 
 assign arbdp_tecc_inst_c1 = arbdec_arbdp_tecc_c1 & arbdec_arbdp_inst_mb_c1; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arbdp_pst_no_ctrue_c2_1 
                           (.din(pst_no_ctrue_c1), 
        .scan_in(ff_arbdp_pst_no_ctrue_c2_1_scanin),
        .scan_out(ff_arbdp_pst_no_ctrue_c2_1_scanout),
        .l1clk(l1clk), .dout(arbdp_pst_no_ctrue_c2_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 //assign pst_with_ctrue_c1 =  decdp_pst_inst_c1_internal  
			// & arbdec_arbdp_inst_ctrue_c1 ; 
 
 // It is not necessary to use decdp_pst_inst_c1  
 // Any instruction issued from the miss buffer with ctrue=1 is either  
 // a partial store or a CAS2. 
 assign pst_with_ctrue_c1 =  arbdec_arbdp_inst_mb_c1  
			 & arbdec_arbdp_inst_ctrue_c1 ; 
 
 assign	arb_tag_pst_with_ctrue_c1 = pst_with_ctrue_c1 ; 
 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arbdp_pst_with_ctrue_c2 
                           (.din(pst_with_ctrue_c1), 
        .scan_in(ff_arbdp_pst_with_ctrue_c2_scanin),
        .scan_out(ff_arbdp_pst_with_ctrue_c2_scanout),
        .l1clk(l1clk), .dout(arb_arbdp_pst_with_ctrue_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 

 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arbdp_tag_pst_no_ctrue_c2 
                           (.din(pst_no_ctrue_c1), 
        .scan_in(ff_arbdp_tag_pst_no_ctrue_c2_scanin),
        .scan_out(ff_arbdp_tag_pst_no_ctrue_c2_scanout),
        .l1clk(l1clk), .dout(arb_arbdp_tag_pst_no_ctrue_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arbdp_misbuf_pst_no_ctrue_c2 
                           (.din(pst_no_ctrue_c1), 
        .scan_in(ff_arbdp_misbuf_pst_no_ctrue_c2_scanin),
        .scan_out(ff_arbdp_misbuf_pst_no_ctrue_c2_scanout),
        .l1clk(l1clk), .dout(arb_arbdp_misbuf_pst_no_ctrue_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arbdp_vuadctl_pst_no_ctrue_c2 
                           (.din(pst_no_ctrue_c1), 
        .scan_in(ff_arbdp_vuadctl_pst_no_ctrue_c2_scanin),
        .scan_out(ff_arbdp_vuadctl_pst_no_ctrue_c2_scanout),
        .l1clk(l1clk), .dout(arb_arbdp_vuadctl_pst_no_ctrue_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 // multiple copies needed due to the loading internally. 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_cas1_inst_c2 
                           (.din(decdp_cas1_inst_c1), .l1clk(l1clk), 
                .scan_in(ff_decdp_cas1_inst_c2_scanin),
                .scan_out(ff_decdp_cas1_inst_c2_scanout),
                .dout(arb_decdp_cas1_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_cas1_inst_c2_1 
                           (.din(decdp_cas1_inst_c1_1), .l1clk(l1clk), 
                .scan_in(ff_decdp_cas1_inst_c2_1_scanin),
                .scan_out(ff_decdp_cas1_inst_c2_1_scanout),
                .dout(decdp_cas1_inst_c2_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_cas2_inst_c2 
                           (.din(decdp_cas2_inst_c1), .l1clk(l1clk), 
                .scan_in(ff_decdp_cas2_inst_c2_scanin),
                .scan_out(ff_decdp_cas2_inst_c2_scanout),
                .dout(arb_decdp_cas2_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_cas2_from_mb_c2 
		(.din(decdp_cas2_from_mb_c1), .l1clk(l1clk), 
                .scan_in(ff_decdp_cas2_from_mb_c2_scanin),
                .scan_out(ff_decdp_cas2_from_mb_c2_scanout),
                .dout(arb_decdp_cas2_from_mb_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_cas2_from_mb_ctrue_c2 
		(.din(decdp_cas2_from_mb_ctrue_c1), .l1clk(l1clk), 
                .scan_in(ff_decdp_cas2_from_mb_ctrue_c2_scanin),
                .scan_out(ff_decdp_cas2_from_mb_ctrue_c2_scanout),
                .dout(arb_decdp_cas2_from_mb_ctrue_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
////////////////////////////////////////////////////// 
 // This signal is used for RW bit in the L2_ESR 
 // The following Store/Atomic instructions can encounter 
 // an error while performing a Read 
 // - Partial stores. 
 // - LDSTUB/SWAP. 
 // - CAS 
 // - Streaming Partial stores. 
 ////////////////////////////////////////////////////// 
 
 
 assign store_err_c2 = ( arb_decdp_pst_inst_c2 | decdp_cas1_inst_c2_1 )  & 
			 arb_inst_vld_c2_5 ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_store_err_c3 
                           (.din(store_err_c2), .l1clk(l1clk), 
                .scan_in(ff_store_err_c3_scanin),
                .scan_out(ff_store_err_c3_scanout),
                .dout(store_err_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_store_err_c4 
                           (.din(store_err_c3), .l1clk(l1clk), 
                .scan_in(ff_store_err_c4_scanin),
                .scan_out(ff_store_err_c4_scanout),
                .dout(store_err_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_store_err_c5 
                           (.din(store_err_c4), .l1clk(l1clk), 
                .scan_in(ff_store_err_c5_scanin),
                .scan_out(ff_store_err_c5_scanout),
                .dout(store_err_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_arb_ctl_msff_ctl_macro__width_1 ff_store_err_c52 
                           (.din(store_err_c5), .l1clk(l1clk),
                .scan_in(ff_store_err_c52_scanin),
                .scan_out(ff_store_err_c52_scanout),
                .dout(store_err_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_store_err_c6 
                           (.din(store_err_c52), .l1clk(l1clk), 
                .scan_in(ff_store_err_c6_scanin),
                .scan_out(ff_store_err_c6_scanout),
                .dout(store_err_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_store_err_c7 
                           (.din(store_err_c6), .l1clk(l1clk), 
                .scan_in(ff_store_err_c7_scanin),
                .scan_out(ff_store_err_c7_scanout),
                .dout(store_err_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_store_err_c8 
                           (.din(store_err_c7), .l1clk(l1clk), 
                .scan_in(ff_store_err_c8_scanin),
                .scan_out(ff_store_err_c8_scanout),
                .dout(arb_store_err_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
////////////////////////////////////////////////////// 
// The following is used in RD./Wr logic in tag. 
////////////////////////////////////////////////////// 
assign arb_decdp_tag_wr_c1 =   ( decdp_strst_inst_c1 
                                | decdp_st_inst_c1 
                                | decdp_wr8_inst_c1 ) 
                                & ~decdp_pst_inst_c1_internal ; 
 
////////////////////////////////////////////////////// 
// forward req 
// used in arb to enable store invals for all 
// cpus. 
////////////////////////////////////////////////////// 
 
assign decdp_fwd_req_c1 = ~arbdec_arbdp_inst_rsvd_c1 & 
                                ~arbdec_arbdp_evict_c1 & 
                ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == 5'b01101 )  ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_fwd_req_c2 
                           (.din(decdp_fwd_req_c1), .l1clk(l1clk), 
                .scan_in(ff_decdp_fwd_req_c2_scanin),
                .scan_out(ff_decdp_fwd_req_c2_scanout),
                .dout(arb_decdp_fwd_req_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
////////////////////////////////////////////////////// 
// SWAP/LDSTUB decode 
////////////////////////////////////////////////////// 
 
 assign  decdp_swap_inst_c1 = ~arbdec_arbdp_inst_rsvd_c1 & 
                               ~arbdec_arbdp_evict_c1 & 
            ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `SWAP_RQ ) ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_swap_inst_c2 
                           (.din(decdp_swap_inst_c1), .l1clk(l1clk), 
                .scan_in(ff_decdp_swap_inst_c2_scanin),
                .scan_out(ff_decdp_swap_inst_c2_scanout),
                .dout(arb_decdp_swap_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 ////////////////////////////////////////////////////// 
 // IMISS decode 
 // Remember to disqualify INVAL instructions. 
 ////////////////////////////////////////////////////// 
 
  assign  decdp_imiss_inst_c1  =  ~arbdec_arbdp_inst_rsvd_c1 & 
                                  ~arbdec_arbdp_evict_c1 & 
                                ~arbdec_arbdp_inst_bufidhi_c1 & 
       ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `IMISS_RQ ) ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_imiss_inst_c2 
                           (.din(decdp_imiss_inst_c1),  
  .scan_in(ff_decdp_imiss_inst_c2_scanin),
  .scan_out(ff_decdp_imiss_inst_c2_scanout),
  .l1clk(l1clk), .dout(arb_decdp_imiss_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 ////////////////////////////////////////////////////// 
 // LD that cams the I$ decode 
 // Streaming loads and FWD req loads are not included. 
 ////////////////////////////////////////////////////// 
 
 
 assign decdp_camld_inst_c1 = ~arbdec_arbdp_inst_rsvd_c1 & 
                                 ~arbdec_arbdp_evict_c1 & 
                                ~arbdec_arbdp_inst_bufidhi_c1 & 
          ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `LOAD_RQ ) ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_camld_inst_c2 
                           (.din(decdp_camld_inst_c1),  
	.scan_in(ff_decdp_camld_inst_c2_scanin),
	.scan_out(ff_decdp_camld_inst_c2_scanout),
	.l1clk(l1clk), .dout(decdp_camld_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 ///////////////////////////////////////////////////// 
 // Ld instruction decode for sending a request back 
 // with data. 
 ///////////////////////////////////////////////////// 
 
 
 assign  decdp_ld_inst_c1  =  ~arbdec_arbdp_inst_rsvd_c1 & 
                                ~arbdec_arbdp_evict_c1 & 
                                ~arbdec_arbdp_inst_bufidhi_c1 & 
          (( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `LOAD_RQ) | 
           ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `MMU_RQ) | // BS and SR 11/12/03 N2 Xbar Packet format change
           ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `STRLOAD_RQ) | 
           (( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `FWD_RQ) & 
                                arbdec_arbdp_inst_nc_c1 ) 
          ); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_ld_inst_c2 
                           (.din(decdp_ld_inst_c1), .l1clk(l1clk), 
                .scan_in(ff_decdp_ld_inst_c2_scanin),
                .scan_out(ff_decdp_ld_inst_c2_scanout),
                .dout(arb_decdp_ld_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 ///////////////////////////////////////////////////// 
 // Prefetch instruction. 
 // At this time, the instruction is not qualified 
 // so it could be an eviction pass of a prefetch 
 // instruction. THe qualification is done in oqu. 
 ///////////////////////////////////////////////////// 
 
 
 assign decdp_pf_inst_c1 = ~arbdec_arbdp_inst_rsvd_c1 & 
                           arbdec_arbdp_inst_bufid1_c1 & 
                           ~arbdec_arbdp_inst_bufidhi_c1 & // inv bit = 0, pf bit = 1
             ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `LOAD_RQ ) ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pf_inst_c2 
                           (.din(decdp_pf_inst_c1), .l1clk(l1clk), 
                .scan_in(ff_decdp_pf_inst_c2_scanin),
                .scan_out(ff_decdp_pf_inst_c2_scanout),
                .dout(decdp_pf_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pf_inst_c3 
                           (.din(decdp_pf_inst_c2), .l1clk(l1clk), 
                .scan_in(ff_decdp_pf_inst_c3_scanin),
                .scan_out(ff_decdp_pf_inst_c3_scanout),
                .dout(decdp_pf_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pf_inst_c4 
                           (.din(decdp_pf_inst_c3), .l1clk(l1clk), 
                .scan_in(ff_decdp_pf_inst_c4_scanin),
                .scan_out(ff_decdp_pf_inst_c4_scanout),
                .dout(decdp_pf_inst_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pf_inst_c5 
                           (.din(decdp_pf_inst_c4), .l1clk(l1clk), 
                .scan_in(ff_decdp_pf_inst_c5_scanin),
                .scan_out(ff_decdp_pf_inst_c5_scanout),
                .dout(arb_decdp_pf_inst_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

 /////////////////////////////////////////////////////
 // Prefetch ICE instruction.
 // BS 06/24/04
 // Have to squash the DRAM read on a Prefetch ICE. Prefetch ICE should
 // miss in L2 tags , and get inserted in the Miss Buffer , but should
 // not assert a DRAM read request. It should cause the eviction pass
 // to happen using the way from PA[21:18] of the instruction itself.
 // In the eviction pass, the miss buffer entry will get deleted .
 /////////////////////////////////////////////////////

assign decdp_pf_ice_inst_c1 =  ~arbdec_arbdp_inst_rsvd_c1 &
                           arbdec_arbdp_inst_bufid1_c1 &
                           arbdec_arbdp_inst_bufidhi_c1 & // inv bit = 1, pf bit = 1
             ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `LOAD_RQ ) ;

 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pf_ice_inst_c2 
                           (.din(decdp_pf_ice_inst_c1), .l1clk(l1clk),
                .scan_in(ff_decdp_pf_ice_inst_c2_scanin),
                .scan_out(ff_decdp_pf_ice_inst_c2_scanout),
                .dout(arb_pf_ice_inst_c2),
  .siclk(siclk),
  .soclk(soclk)
);

l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pf_ice_inst_c3 
                           (.din(arb_pf_ice_inst_c2), .l1clk(l1clk),
                .scan_in(ff_decdp_pf_ice_inst_c3_scanin),
                .scan_out(ff_decdp_pf_ice_inst_c3_scanout),
                .dout(decdp_pf_ice_inst_c3),
  .siclk(siclk),
  .soclk(soclk)
);

//assign arb_iqu_pf_ice_stall_set = decdp_pf_ice_inst_c1 & arb_inst_vld_c1_1;
//assign arb_iqu_pf_ice_stall_clr = decdp_pf_ice_inst_c3 & arbdec_arbdp_inst_mb_c3;

l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pf_ice_inst_c4  
                           (.din(decdp_pf_ice_inst_c3), .l1clk(l1clk),
                .scan_in(ff_decdp_pf_ice_inst_c4_scanin),
                .scan_out(ff_decdp_pf_ice_inst_c4_scanout),
                .dout(decdp_pf_ice_inst_c4),
  .siclk(siclk),
  .soclk(soclk)
);

l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pf_ice_inst_c5  
                           (.din(decdp_pf_ice_inst_c4), .l1clk(l1clk),
                .scan_in(ff_decdp_pf_ice_inst_c5_scanin),
                .scan_out(ff_decdp_pf_ice_inst_c5_scanout),
                .dout(decdp_pf_ice_inst_c5),
  .siclk(siclk),
  .soclk(soclk)
);

l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pf_ice_inst_c52  
                           (.din(decdp_pf_ice_inst_c5), .l1clk(l1clk),
                .scan_in(ff_decdp_pf_ice_inst_c52_scanin),
                .scan_out(ff_decdp_pf_ice_inst_c52_scanout),
                .dout(decdp_pf_ice_inst_c52),
  .siclk(siclk),
  .soclk(soclk)
);

l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pf_ice_inst_c6  
                           (.din(decdp_pf_ice_inst_c52), .l1clk(l1clk),
                .scan_in(ff_decdp_pf_ice_inst_c6_scanin),
                .scan_out(ff_decdp_pf_ice_inst_c6_scanout),
                .dout(decdp_pf_ice_inst_c6),
  .siclk(siclk),
  .soclk(soclk)
);

l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_pf_ice_inst_c7  
                           (.din(decdp_pf_ice_inst_c6), .l1clk(l1clk),
                .scan_in(ff_decdp_pf_ice_inst_c7_scanin),
                .scan_out(ff_decdp_pf_ice_inst_c7_scanout),
                .dout(arb_pf_ice_inst_c7),
  .siclk(siclk),
  .soclk(soclk)
);


/////////////////////////////////////////////////////// 
 // Streaming load indication to oqu in C6 
 // Used in rqtyp logic 
 // Note: This is an unqualled instruction and has to 
 // be qualified with load hit to be accurate. 
 /////////////////////////////////////////////////////// 
 
 assign arb_decdp_strld_inst_c6 =  
	( arbdec_arbdp_inst_rqtyp_c6[`L2_RQTYP_HI:`L2_RQTYP_LO] == `STRLOAD_RQ) ; 

///////////////////////////////////////////////////////
// BS and SR 11/12/03 N2 Xbar Packet format change
 // MMU load return indication to oqu in C6
 // Used in rqtyp logic
 // Note: This is an unqualled instruction and has to
 // be qualified with load hit to be accurate.
 ///////////////////////////////////////////////////////

 assign arb_decdp_mmuld_inst_c6 =
( arbdec_arbdp_inst_rqtyp_c6[`L2_RQTYP_HI:`L2_RQTYP_LO] == `MMU_RQ);
 
 assign arb_decdp_atm_inst_c6 = ( arbdec_arbdp_inst_rqtyp_c6[`L2_RQTYP_HI:`L2_RQTYP_LO] == `SWAP_RQ ) | 
                            ( arbdec_arbdp_inst_rqtyp_c6[`L2_RQTYP_HI:`L2_RQTYP_LO] == `CAS1_RQ ) | 
                            ( arbdec_arbdp_inst_rqtyp_c6[`L2_RQTYP_HI:`L2_RQTYP_LO] == `CAS2_RQ ) ; 
 
 
 ////////////////////////////////////////////////////// 
 // The following expression is used for word enable generation in 
 // tag. 
 // A store is considered to be a DWORD store under the following 
 // conditions: 
 // 1) strm store or rdma wr8 with size=0 
 // 2) cas2 from mb or a regular store with sz=3 
 ////////////////////////////////////////////////////// 
 
 assign dword_st_c1 = (( decdp_strst_inst_c1 | decdp_wr8_inst_c1 )  &          // strm or siu WR8 
                       eight_byte_access_c1) |        // strm store  8 byte access, BS and SR 11/12/03 N2 Xbar Packet format change 
                      (( decdp_st_inst_c1 | decdp_cas2_from_mb_c1 ) & 
                        eight_byte_access_c1) | // BS and SR 11/12/03 N2 Xbar Packet format change
                       ( decdp_pst_inst_c1_internal &  arbdec_arbdp_inst_ctrue_c1) ;             // pst write  is always a dword write. 
 
assign arb_arbdp_dword_st_c1 = dword_st_c1;
 
 ///////////////////////////////////////////////////// 
 // INVAL instruction decode to arb 
 // ~arbdp_inst_c1[`L2_EVICT]  qualification is not necessary 
 // as these instructions can only come from the IQ and not 
 // from the Miss Buffer. 
 ///////////////////////////////////////////////////// 
 
 
//  assign decdp_ic_dc_inval_inst_c1 = decdp_dc_inval_c1 | decdp_ic_inval_c1;
 assign decdp_dc_inval_c1 = arbdec_arbdp_inst_bufidhi_c1 & ~arbdec_arbdp_inst_bufid1_c1 & 
                                  // inv bit = 1, pf bit = 0
                        ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `LOAD_RQ ) & 
                                ~arbdec_arbdp_inst_rsvd_c1 ; 
 
 assign decdp_ic_inval_c1 = arbdec_arbdp_inst_bufidhi_c1 & 
                    ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `IMISS_RQ ) & 
                                ~arbdec_arbdp_inst_rsvd_c1 ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_dc_inval_c2 
                           (.din(decdp_dc_inval_c1), .l1clk(l1clk), 
                .scan_in(ff_decdp_dc_inval_c2_scanin),
                .scan_out(ff_decdp_dc_inval_c2_scanout),
                .dout(decdp_dc_inval_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_ic_inval_c2 
                           (.din(decdp_ic_inval_c1), .l1clk(l1clk), 
                .scan_in(ff_decdp_ic_inval_c2_scanin),
                .scan_out(ff_decdp_ic_inval_c2_scanout),
                .dout(decdp_ic_inval_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
  
 ////////////////////////////////////////////////////////////////////////// 
 // Stall logic.( logic is in l2t_arb but some of the 
 //             components are calculated here ). 
 // The following instructions/events cause the C1 instruction in 
 // the pipe to be stalled. 
 // * evictions.        (2 cycle stall ) 
 // * Fills.    (2 cycle stall ) 
 // * Imiss.    (1 cycle stall ) 
 // * tecc.     (n cycle stall ) 
 // * diagnostic access.        (data=2, tag=3, vuad=4) 
 // * snoop access ( n cycle stall ) 
 // * SAme col stall 
 // 
 // The above multicycle stall conditions are detected in C1 
 // and so is the same col stall. This is qualfied with 
 // arb_unstalled_inst_c1. 
 // WHen a multicycle instruction is in C2 or beyond, inst_vld_cn is 
 // used for qualifying that instruction. 
 ///////////////////////////////////////////////////////////////////////////// 
 
 assign multi_cyc_op_c1 = arbdec_arbdp_evict_c1 | // eviction 
                        arbdec_arbdp_inst_fb_c1_qual | // fill instruction 
                        decdp_imiss_inst_c1 | // imiss 
                        decdp_ic_inval_c1 | // i$ invalidate 
                        decdp_dc_inval_c1 | // d$ invalidate 
                        arbdec_arbdp_tecc_c1 | // tecc instruction. 
                       arbdec_arbdp_inst_rsvd_c1 ; // siu instruction 
 
 
 
///////////////////////////////////////////////////// 
//PST no ctrue is staged till C8 and then 
//qualified with a hit signal to generate the 
// write enable  for mb_ctrue. 
// The write enable generation is mbist_done in arb. 
// the Ctrue logic is performed in misbuf. 
////////////////////////////////////////////////////// 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_pst_no_ctrue_c3 
                           (.din(arbdp_pst_no_ctrue_c2_1), 
        .scan_in(ff_pst_no_ctrue_c3_scanin),
        .scan_out(ff_pst_no_ctrue_c3_scanout),
        .l1clk(l1clk), .dout(pst_no_ctrue_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_pst_no_ctrue_c4 
                           (.din(pst_no_ctrue_c3), 
        .scan_in(ff_pst_no_ctrue_c4_scanin),
        .scan_out(ff_pst_no_ctrue_c4_scanout),
        .l1clk(l1clk), .dout(pst_no_ctrue_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_pst_no_ctrue_c5 
                           (.din(pst_no_ctrue_c4), 
        .scan_in(ff_pst_no_ctrue_c5_scanin),
        .scan_out(ff_pst_no_ctrue_c5_scanout),
        .l1clk(l1clk), .dout(pst_no_ctrue_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_arb_ctl_msff_ctl_macro__width_1 ff_pst_no_ctrue_c52 
                           (.din(pst_no_ctrue_c5),
        .scan_in(ff_pst_no_ctrue_c52_scanin),
        .scan_out(ff_pst_no_ctrue_c52_scanout),
        .l1clk(l1clk), .dout(pst_no_ctrue_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_pst_no_ctrue_c6 
                           (.din(pst_no_ctrue_c52), 
        .scan_in(ff_pst_no_ctrue_c6_scanin),
        .scan_out(ff_pst_no_ctrue_c6_scanout),
        .l1clk(l1clk), .dout(pst_no_ctrue_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_pst_no_ctrue_c7 
                           (.din(pst_no_ctrue_c6), 
        .scan_in(ff_pst_no_ctrue_c7_scanin),
        .scan_out(ff_pst_no_ctrue_c7_scanout),
        .l1clk(l1clk), .dout(pst_no_ctrue_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_pst_no_ctrue_c8 
                           (.din(pst_no_ctrue_c7), 
        .scan_in(ff_pst_no_ctrue_c8_scanin),
        .scan_out(ff_pst_no_ctrue_c8_scanout),
        .l1clk(l1clk), .dout(arbdp_pst_no_ctrue_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
///////////////////////////////////////////////////// 
// CAs1 instruction 
///////////////////////////////////////////////////// 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_cas1_inst_c3 
                           (.din(decdp_cas1_inst_c2_1), 
        .scan_in(ff_decdp_cas1_inst_c3_scanin),
        .scan_out(ff_decdp_cas1_inst_c3_scanout),
        .l1clk(l1clk), .dout(decdp_cas1_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_cas1_inst_c4 
                           (.din(decdp_cas1_inst_c3), 
        .scan_in(ff_decdp_cas1_inst_c4_scanin),
        .scan_out(ff_decdp_cas1_inst_c4_scanout),
        .l1clk(l1clk), .dout(decdp_cas1_inst_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_cas1_inst_c5 
                           (.din(decdp_cas1_inst_c4), 
        .scan_in(ff_decdp_cas1_inst_c5_scanin),
        .scan_out(ff_decdp_cas1_inst_c5_scanout),
        .l1clk(l1clk), .dout(decdp_cas1_inst_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_cas1_inst_c52 
                           (.din(decdp_cas1_inst_c5),
        .scan_in(ff_decdp_cas1_inst_c52_scanin),
        .scan_out(ff_decdp_cas1_inst_c52_scanout),
        .l1clk(l1clk), .dout(decdp_cas1_inst_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_cas1_inst_c6 
                           (.din(decdp_cas1_inst_c52), 
        .scan_in(ff_decdp_cas1_inst_c6_scanin),
        .scan_out(ff_decdp_cas1_inst_c6_scanout),
        .l1clk(l1clk), .dout(decdp_cas1_inst_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_cas1_inst_c7 
                           (.din(decdp_cas1_inst_c6), 
        .scan_in(ff_decdp_cas1_inst_c7_scanin),
        .scan_out(ff_decdp_cas1_inst_c7_scanout),
        .l1clk(l1clk), .dout(decdp_cas1_inst_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_decdp_cas1_inst_c8 
                           (.din(decdp_cas1_inst_c7), 
        .scan_in(ff_decdp_cas1_inst_c8_scanin),
        .scan_out(ff_decdp_cas1_inst_c8_scanout),
        .l1clk(l1clk), .dout(decdp_cas1_inst_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
/////////////////////////////////////////////////// 
// Special store logic. Used to generate byte masks for 
// streaming stores and wr8s 
/////////////////////////////////////////////////// 
 
//msff_ctl_macro ff_decdp_strpst_inst_c2 (width=1)
//                           (.din(decdp_strpst_inst_c1), 
//        	.scan_in(ff_decdp_strpst_inst_c2_scanin),
//        	.scan_out(ff_decdp_strpst_inst_c2_scanout),
//        	.l1clk(l1clk), .dout(decdp_strpst_inst_c2),  
//); 
//				 
//msff_ctl_macro ff_decdp_rdmapst_inst_c2 (width=1)
//                           (.din(decdp_rdmapst_inst_c1), 
//        	.scan_in(ff_decdp_rdmapst_inst_c2_scanin),
//        	.scan_out(ff_decdp_rdmapst_inst_c2_scanout),
//        	.l1clk(l1clk), .dout(decdp_rdmapst_inst_c2),  
//); 
// 
//  assign	sp_pst_inst_c2 = ( decdp_strpst_inst_c2 | 
//			decdp_rdmapst_inst_c2 ) ; 
// 
//msff_ctl_macro ff_sp_pst_inst_c3 (width=1)
//                           (.din(sp_pst_inst_c2), 
//        	.scan_in(ff_sp_pst_inst_c3_scanin),
//        	.scan_out(ff_sp_pst_inst_c3_scanout),
//        	.l1clk(l1clk), .dout(sp_pst_inst_c3),  
//); 
// 
//msff_ctl_macro ff_sp_pst_inst_c4 (width=1)
//                           (.din(sp_pst_inst_c3), 
//        	.scan_in(ff_sp_pst_inst_c4_scanin),
//        	.scan_out(ff_sp_pst_inst_c4_scanout),
//        	.l1clk(l1clk), .dout(sp_pst_inst_c4),  
//); 
// 
//msff_ctl_macro ff_sp_pst_inst_c5 (width=1)
//                           (.din(sp_pst_inst_c4), 
//        	.scan_in(ff_sp_pst_inst_c5_scanin),
//        	.scan_out(ff_sp_pst_inst_c5_scanout),
//        	.l1clk(l1clk), .dout(sp_pst_inst_c5),  
//); 
//
//// BS 03/11/04 extra cycle for mem access
//
//msff_ctl_macro ff_sp_pst_inst_c52 (width=1)
//                           (.din(sp_pst_inst_c5),
//                .scan_in(ff_sp_pst_inst_c52_scanin),
//                .scan_out(ff_sp_pst_inst_c52_scanout),
//                .l1clk(l1clk), .dout(sp_pst_inst_c52),  
//);
//
// 
//msff_ctl_macro ff_sp_pst_inst_c6 (width=1)
//                           (.din(sp_pst_inst_c52), 
//        	.scan_in(ff_sp_pst_inst_c6_scanin),
//        	.scan_out(ff_sp_pst_inst_c6_scanout),
//        	.l1clk(l1clk), .dout(sp_pst_inst_c6),  
//); 
// 
//msff_ctl_macro ff_sp_pst_inst_c7 (width=1)
//                           (.din(sp_pst_inst_c6), 
//        	.scan_in(ff_sp_pst_inst_c7_scanin),
//        	.scan_out(ff_sp_pst_inst_c7_scanout),
//        	.l1clk(l1clk), .dout(sp_pst_inst_c7),  
//); 
 
// BS 12/07/04 : taking out arb_swap_cas2_req_c2 to l2t_oqu_ctl.sv to disable ERROR
// Indication packet on a CE,UE, or Notdata on the store part of the swap or CAS2.
// Instead , regular store ack packet will get sent.

assign arb_oqu_swap_cas2_req_c2 = ( arb_decdp_swap_inst_c2 | arb_decdp_cas2_inst_c2);

 
///////////////////////////////////////////////////// 
// TECC instruction in C8 is used by the misbuf 
// READY Logic. HEnce, this bit should not be looking 
// at only the TECC bit of an instruction but also 
// the fact that it got issued out of the MBF 
// 
// If an eviction packet has tecc_c3==1, the L2 ready bit 
// is not set but EVICT_READY is set. 
///////////////////////////////////////////////////// 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arbdp_evict_c2 
                           (.din(arbdec_arbdp_evict_c1), 
        .scan_in(ff_arbdp_evict_c2_scanin),
        .scan_out(ff_arbdp_evict_c2_scanout),
        .l1clk(l1clk), .dout(arbdp_evict_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arbdp_evict_c3 
                           (.din(arbdp_evict_c2), 
        .scan_in(ff_arbdp_evict_c3_scanin),
        .scan_out(ff_arbdp_evict_c3_scanout),
        .l1clk(l1clk), .dout(arbdp_evict_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign arb_ic_evict_c3 = wr64_inst_c3 | arbdp_evict_c3; // Set force hit for directories 
assign arb_dc_evict_c3 = arbdp_evict_c3 | wr64_inst_c3; // Set force hit for directories 

l2t_arb_ctl_msff_ctl_macro__width_2 ff_arbdp_evict_c4 
	(
	.scan_in(ff_arbdp_evict_c4_scanin),
	.scan_out(ff_arbdp_evict_c4_scanout),
	.din({arb_dc_evict_c3,arb_ic_evict_c3}),
	.l1clk(l1clk), 
	.dout({arb_ic_evict_c4,arb_dc_evict_c4}),
  .siclk(siclk),
  .soclk(soclk)
	);



 
assign  arbdp_tecc_inst_mb_c3 = arbdec_arbdp_inst_tecc_c3 & 
                                arbdec_arbdp_inst_mb_c3  & 
				~arbdp_evict_c3 ; 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arbdp_tecc_inst_mb_c4 
                           (.din(arbdp_tecc_inst_mb_c3), 
        .scan_in(ff_arbdp_tecc_inst_mb_c4_scanin),
        .scan_out(ff_arbdp_tecc_inst_mb_c4_scanout),
        .l1clk(l1clk), .dout(arbdp_tecc_inst_mb_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arbdp_tecc_inst_mb_c5 
                           (.din(arbdp_tecc_inst_mb_c4), 
        .scan_in(ff_arbdp_tecc_inst_mb_c5_scanin),
        .scan_out(ff_arbdp_tecc_inst_mb_c5_scanout),
        .l1clk(l1clk), .dout(arbdp_tecc_inst_mb_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_arb_ctl_msff_ctl_macro__width_1 ff_arbdp_tecc_inst_mb_c52 
                           (.din(arbdp_tecc_inst_mb_c5),
        .scan_in(ff_arbdp_tecc_inst_mb_c52_scanin),
        .scan_out(ff_arbdp_tecc_inst_mb_c52_scanout),
        .l1clk(l1clk), .dout(arbdp_tecc_inst_mb_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arbdp_tecc_inst_mb_c6 
                           (.din(arbdp_tecc_inst_mb_c52), 
        .scan_in(ff_arbdp_tecc_inst_mb_c6_scanin),
        .scan_out(ff_arbdp_tecc_inst_mb_c6_scanout),
        .l1clk(l1clk), .dout(arbdp_tecc_inst_mb_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arbdp_tecc_inst_mb_c7 
                           (.din(arbdp_tecc_inst_mb_c6), 
        .scan_in(ff_arbdp_tecc_inst_mb_c7_scanin),
        .scan_out(ff_arbdp_tecc_inst_mb_c7_scanout),
        .l1clk(l1clk), .dout(arbdp_tecc_inst_mb_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_arb_ctl_msff_ctl_macro__width_1 ff_arbdp_tecc_inst_mb_c8 
                           (.din(arbdp_tecc_inst_mb_c7), 
        .scan_in(ff_arbdp_tecc_inst_mb_c8_scanin),
        .scan_out(ff_arbdp_tecc_inst_mb_c8_scanout),
        .l1clk(l1clk), .dout(arb_arbdp_tecc_inst_mb_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
				 
// fixscan start:
assign spares_scanin             = scan_in                  ;
assign reset_flop_scanin         = spares_scanout           ;
assign ff_gate_off_prim_req_c1_scanin = reset_flop_scanout       ;
assign ff_reset_for_pf_ice_staging_scanin = ff_gate_off_prim_req_c1_scanout;
assign ff_gate_off_prim_req_state_scanin = ff_reset_for_pf_ice_staging_scanout;
assign ff_l2_bypass_mode_on_d1_scanin = ff_gate_off_prim_req_state_scanout;
assign ff_mbf_valid_px2_scanin   = ff_l2_bypass_mode_on_d1_scanout;
assign ff_mbf_valid_px2_1_scanin = ff_mbf_valid_px2_scanout ;
assign ff_fbf_valid_px2_1_scanin = ff_mbf_valid_px2_1_scanout;
assign ff_snp_valid_px2_scanin   = ff_fbf_valid_px2_1_scanout;
assign ff_snp_valid_px2_1_scanin = ff_snp_valid_px2_scanout ;
assign ff_mux3_bufsel_px2_scanin = ff_snp_valid_px2_1_scanout;
assign ff_atm_instr_c1_scanin    = ff_mux3_bufsel_px2_scanout;
assign ff_arb_stall_c1_cloned_scanin = ff_atm_instr_c1_scanout  ;
assign ff_arb_inst_vld_c1_1_clone_scanin = ff_arb_stall_c1_cloned_scanout;
assign ff_data_ecc_active_c4_dup_scanin = ff_arb_inst_vld_c1_1_clone_scanout;
assign ff_inc_tag_ecc_cnt_c3_dup_scanin = ff_data_ecc_active_c4_dup_scanout;
assign ff_tecc_c2_scanin         = ff_inc_tag_ecc_cnt_c3_dup_scanout;
assign ff_arb_tecc_c2_c3_scanin  = ff_tecc_c2_scanout       ;
assign ff_data_ecc_active_c4_scanin = ff_arb_tecc_c2_c3_scanout;
assign ff_bist_vuad_rd_en_px1_scanin = ff_data_ecc_active_c4_scanout;
assign ff_bist_enable_c1_scanin  = ff_bist_vuad_rd_en_px1_scanout;
assign ff_bist_enable_c2_scanin  = ff_bist_enable_c1_scanout;
assign ff_bist_acc_vd_px2_scanin = ff_bist_enable_c2_scanout;
assign ff_bist_acc_vd_c1_scanin  = ff_bist_acc_vd_px2_scanout;
assign ff_bist_acc_vd_c2_scanin  = ff_bist_acc_vd_c1_scanout;
assign ff_mbist_arb_l2d_en_d1_scanin = ff_bist_acc_vd_c2_scanout;
assign ff_arb_tag_acc_c1_scanin  = ff_mbist_arb_l2d_en_d1_scanout;
assign ff_sp_tag_access_c1_scanin = ff_arb_tag_acc_c1_scanout;
assign ff_normal_tagacc_c2_scanin = ff_sp_tag_access_c1_scanout;
assign ff_l2t_mb2_run_r1_scanin  = ff_normal_tagacc_c2_scanout;
assign ff_mbfull_px2_scanin      = ff_l2t_mb2_run_r1_scanout;
assign ff_mbsel_c1_scanin        = ff_mbfull_px2_scanout    ;
assign ff_fbsel_c1_scanin        = ff_mbsel_c1_scanout      ;
assign ff_snpsel_c1_scanin       = ff_fbsel_c1_scanout      ;
assign ff_snpsel_c2_scanin       = ff_snpsel_c1_scanout     ;
assign ff_snpsel_c3_scanin       = ff_snpsel_c2_scanout     ;
assign ff_arb_evict_c3_scanin    = ff_snpsel_c3_scanout     ;
assign ff_arb_evict_c4_scanin    = ff_arb_evict_c3_scanout  ;
assign ff_arb_evict_c5_scanin    = ff_arb_evict_c4_scanout  ;
assign ff_imiss_inst_c3_scanin   = ff_arb_evict_c5_scanout  ;
assign ff_arb_imiss_hit_c4_scanin = ff_imiss_inst_c3_scanout ;
assign ff_arb_imiss_hit_c5_scanin = ff_arb_imiss_hit_c4_scanout;
assign ff_arb_imiss_hit_c52_scanin = ff_arb_imiss_hit_c5_scanout;
assign ff_arb_imiss_hit_c6_scanin = ff_arb_imiss_hit_c52_scanout;
assign ff_arb_imiss_hit_c7_scanin = ff_arb_imiss_hit_c6_scanout;
assign ff_arb_imiss_hit_c8_scanin = ff_arb_imiss_hit_c7_scanout;
assign ff_arb_imiss_hit_c9_scanin = ff_arb_imiss_hit_c8_scanout;
assign ff_arb_imiss_hit_c10_scanin = ff_arb_imiss_hit_c9_scanout;
assign ff_arb_inst_diag_c2_scanin = ff_arb_imiss_hit_c10_scanout;
assign ff_arb_inst_csr_c1_scanin = ff_arb_inst_diag_c2_scanout;
assign ff_arb_inst_l2data_c2_scanin = ff_arb_inst_csr_c1_scanout;
assign ff_inst_l2data_vld_c3_scanin = ff_arb_inst_l2data_c2_scanout;
assign ff_inst_l2data_vld_c4_scanin = ff_inst_l2data_vld_c3_scanout;
assign ff_inst_l2data_vld_c5_scanin = ff_inst_l2data_vld_c4_scanout;
assign ff_inst_l2data_vld_c52_scanin = ff_inst_l2data_vld_c5_scanout;
assign ff_inst_l2data_vld_c6_scanin = ff_inst_l2data_vld_c52_scanout;
assign ff_arb_csr_wr_en_c3_scanin = ff_inst_l2data_vld_c6_scanout;
assign ff_arb_csr_wr_en_c3_1_scanin = ff_arb_csr_wr_en_c3_scanout;
assign ff_arb_csr_wr_en_c4_scanin = ff_arb_csr_wr_en_c3_1_scanout;
assign ff_arb_csr_wr_en_c5_scanin = ff_arb_csr_wr_en_c4_scanout;
assign ff_arb_csr_wr_en_c52_scanin = ff_arb_csr_wr_en_c5_scanout;
assign ff_arb_csr_wr_en_c6_scanin = ff_arb_csr_wr_en_c52_scanout;
assign ff_arb_csr_wr_en_c7_scanin = ff_arb_csr_wr_en_c6_scanout;
assign ff_arb_csr_wr_en_c8_scanin = ff_arb_csr_wr_en_c7_scanout;
assign ff_arb_csr_rd_en_c3_scanin = ff_arb_csr_wr_en_c8_scanout;
assign ff_arb_csr_rd_en_c4_scanin = ff_arb_csr_rd_en_c3_scanout;
assign ff_arb_csr_rd_en_c5_scanin = ff_arb_csr_rd_en_c4_scanout;
assign ff_arb_csr_rd_en_c52_scanin = ff_arb_csr_rd_en_c5_scanout;
assign ff_arb_csr_rd_en_c6_scanin = ff_arb_csr_rd_en_c52_scanout;
assign ff_arb_csr_rd_en_c7_scanin = ff_arb_csr_rd_en_c6_scanout;
assign ff_arb_inst_l2tag_c2_scanin = ff_arb_csr_rd_en_c7_scanout;
assign ff_arb_inst_l2tag_c2_1_scanin = ff_arb_inst_l2tag_c2_scanout;
assign ff_inst_l2tag_vld_c3_scanin = ff_arb_inst_l2tag_c2_1_scanout;
assign ff_inst_l2tag_vld_c4_scanin = ff_inst_l2tag_vld_c3_scanout;
assign ff_inst_l2tag_vld_c5_scanin = ff_inst_l2tag_vld_c4_scanout;
assign ff_inst_l2tag_vld_c52_scanin = ff_inst_l2tag_vld_c5_scanout;
assign ff_inst_l2tag_vld_c6_scanin = ff_inst_l2tag_vld_c52_scanout;
assign ff_arb_inst_l2vuad_c2_scanin = ff_inst_l2tag_vld_c6_scanout;
assign ff_inst_l2vuad_vld_c3_scanin = ff_arb_inst_l2vuad_c2_scanout;
assign ff_inst_l2vuad_vld_c4_scanin = ff_inst_l2vuad_vld_c3_scanout;
assign ff_inst_l2vuad_vld_c5_scanin = ff_inst_l2vuad_vld_c4_scanout;
assign ff_inst_l2vuad_vld_c52_scanin = ff_inst_l2vuad_vld_c5_scanout;
assign ff_inst_l2vuad_vld_c6_scanin = ff_inst_l2vuad_vld_c52_scanout;
assign ff_deccck_data_sel_c9_scanin = ff_inst_l2vuad_vld_c6_scanout;
assign ff_lower_cas_c9_scanin    = ff_deccck_data_sel_c9_scanout;
assign ff_upper_cas_c9_scanin    = ff_lower_cas_c9_scanout  ;
assign ff_word_lower_cmp_c9_scanin = ff_upper_cas_c9_scanout  ;
assign ff_word_upper_cmp_c9_scanin = ff_word_lower_cmp_c9_scanout;
assign ff_tecc_inst_c2_scanin    = ff_word_upper_cmp_c9_scanout;
assign ff_inc_tag_ecc_cnt_c3_scanin = ff_tecc_inst_c2_scanout  ;
assign ff_tag_ecc_fsm_count_scanin = ff_inc_tag_ecc_cnt_c3_scanout;
assign ff_scrub_fsm_count_eq_6_px2_scanin = ff_tag_ecc_fsm_count_scanout;
assign ff_scrub_fsm_count_eq_1_px2_scanin = ff_scrub_fsm_count_eq_6_px2_scanout;
assign ff_tecc_tag_acc_en_px2_scanin = ff_scrub_fsm_count_eq_1_px2_scanout;
assign ff_arb_tagd_tecc_c2_scanin = ff_tecc_tag_acc_en_px2_scanout;
assign ff_diag_or_tecc_acc_c1_scanin = ff_arb_tagd_tecc_c2_scanout;
assign ff_hit_l2orfb_c4_scanin   = ff_diag_or_tecc_acc_c1_scanout;
assign ff_hit_l2orfb_c5_scanin   = ff_hit_l2orfb_c4_scanout ;
assign ff_hit_l2orfb_c52_scanin  = ff_hit_l2orfb_c5_scanout ;
assign ff_hit_l2orfb_c6_scanin   = ff_hit_l2orfb_c52_scanout;
assign ff_hit_l2orfb_c7_scanin   = ff_hit_l2orfb_c6_scanout ;
assign ff_hit_l2orfb_c8_scanin   = ff_hit_l2orfb_c7_scanout ;
assign ff_dword_mask_c8_scanin   = ff_hit_l2orfb_c8_scanout ;
assign ff_fbrd_c3_scanin         = ff_dword_mask_c8_scanout ;
assign ff_st_cam_en_c3_scanin    = ff_fbrd_c3_scanout       ;
assign ff_sp_cam_en_c3_scanin    = ff_st_cam_en_c3_scanout  ;
assign ff_arb_decdp_cas1_inst_c3_scanin = ff_sp_cam_en_c3_scanout  ;
assign ff_enc_cam_addr_c4_scanin = ff_arb_decdp_cas1_inst_c3_scanout;
assign ff_vuad_ce_scanin         = ff_enc_cam_addr_c4_scanout;
assign ff_vuad_ce_err_c3_scanin  = ff_vuad_ce_scanout       ;
assign ff_arbctl_inst_nc_c2_scanin = ff_vuad_ce_err_c3_scanout;
assign ff_ic_hitqual_cam_en_c3_scanin = ff_arbctl_inst_nc_c2_scanout;
assign ff_ld_inst_c3_scanin      = ff_ic_hitqual_cam_en_c3_scanout;
assign ff_dc_inval_c3_scanin     = ff_ld_inst_c3_scanout    ;
assign ff_ic_inval_c3_scanin     = ff_dc_inval_c3_scanout   ;
assign ff_dc_inval_vld_c4_scanin = ff_ic_inval_c3_scanout   ;
assign ff_dc_inval_vld_c5_scanin = ff_dc_inval_vld_c4_scanout;
assign ff_dc_inval_vld_c52_scanin = ff_dc_inval_vld_c5_scanout;
assign ff_dc_inval_vld_c6_scanin = ff_dc_inval_vld_c52_scanout;
assign ff_dc_inval_vld_c7_scanin = ff_dc_inval_vld_c6_scanout;
assign ff_ic_inval_vld_c4_scanin = ff_dc_inval_vld_c7_scanout;
assign ff_ic_inval_vld_c5_scanin = ff_ic_inval_vld_c4_scanout;
assign ff_ic_inval_vld_c52_scanin = ff_ic_inval_vld_c5_scanout;
assign ff_ic_inval_vld_c6_scanin = ff_ic_inval_vld_c52_scanout;
assign ff_ic_inval_vld_c7_scanin = ff_ic_inval_vld_c6_scanout;
assign ff_ic_inval_vld_c8_scanin = ff_ic_inval_vld_c7_scanout;
assign ff_ic_inval_vld_c9_scanin = ff_ic_inval_vld_c8_scanout;
assign ff_arb_dir_wr_en_c4_scanin = ff_ic_inval_vld_c9_scanout;
assign ff_dir_addr_cnt_scanin    = ff_arb_dir_wr_en_c4_scanout;
assign ff_dir_addr_cnt_c4_scanin = ff_dir_addr_cnt_scanout  ;
assign ff_dir_addr_cnt_c5_scanin = ff_dir_addr_cnt_c4_scanout;
assign ff_dir_addr_cnt_c52_scanin = ff_dir_addr_cnt_c5_scanout;
assign ff_dir_addr_cnt_c6_scanin = ff_dir_addr_cnt_c52_scanout;
assign ff_dir_addr_cnt_c7_scanin = ff_dir_addr_cnt_c6_scanout;
assign ff_dir_addr_c8_scanin     = ff_dir_addr_cnt_c7_scanout;
assign ff_dir_addr_c9_scanin     = ff_dir_addr_c8_scanout   ;
assign ff_sync_en_scanin         = ff_dir_addr_c9_scanout   ;
assign ff_ncu_signals_scanin     = ff_sync_en_scanout       ;
assign ff_staged_part_bank_scanin = ff_ncu_signals_scanout   ;
assign ff_arb_cpuid_c3_scanin    = ff_staged_part_bank_scanout;
assign ff_arb_cpuid_c4_scanin    = ff_arb_cpuid_c3_scanout  ;
assign ff_arb_cpuid_c5_scanin    = ff_arb_cpuid_c4_scanout  ;
assign ff_arb_cpuid_c52_scanin   = ff_arb_cpuid_c5_scanout  ;
assign ff_arb_ic_dir_wrentry_c4_scanin = ff_arb_cpuid_c52_scanout ;
assign ff_arb_ic_dir_wrentry_c5_scanin = ff_arb_ic_dir_wrentry_c4_scanout;
assign ff_arb_ic_dir_wrentry_c6_scanin = ff_arb_ic_dir_wrentry_c5_scanout;
assign ff_arb_ic_dir_wrentry_c7_scanin = ff_arb_ic_dir_wrentry_c6_scanout;
assign ff_dc_wr_panel_c4_scanin  = ff_arb_ic_dir_wrentry_c7_scanout;
assign ff_dc_wr_panel_c5_scanin  = ff_dc_wr_panel_c4_scanout;
assign ff_dc_wr_panel_c52_scanin = ff_dc_wr_panel_c5_scanout;
assign ff_arbdec_arbdp_inst_bufidlo_c3_scanin = ff_dc_wr_panel_c52_scanout;
assign ff_ic_wr_panel_c4_scanin  = ff_arbdec_arbdp_inst_bufidlo_c3_scanout;
assign ff_ic_wr_panel_c5_scanin  = ff_ic_wr_panel_c4_scanout;
assign ff_ic_wr_panel_c52_scanin = ff_ic_wr_panel_c5_scanout;
assign ff_ic_wr_panel_c6_scanin  = ff_ic_wr_panel_c52_scanout;
assign ff_ic_wr_panel_c7_scanin  = ff_ic_wr_panel_c6_scanout;
assign ff_ic_wr_panel_c8_scanin  = ff_ic_wr_panel_c7_scanout;
assign ff_ic_wr_panel_c9_scanin  = ff_ic_wr_panel_c8_scanout;
assign ff_wr64_inst_c3_scanin    = ff_ic_wr_panel_c9_scanout;
assign ff_waysel_gate_c2_scanin  = ff_wr64_inst_c3_scanout  ;
assign ff_parerr_gate_c1_scanin  = ff_waysel_gate_c2_scanout;
assign ff_arb_stall_c1_scanin    = ff_parerr_gate_c1_scanout;
assign ff_arb_inst_vld_c1_scanin = ff_arb_stall_c1_scanout  ;
assign ff_mbist_lookup_r1_scanin = ff_arb_inst_vld_c1_scanout;
assign ff_arb_inst_vld_c1_1_scanin = ff_mbist_lookup_r1_scanout;
assign ff_arb_inst_vld_c2_scanin = ff_arb_inst_vld_c1_1_scanout;
assign ff_arb_inst_vld_c2_1_scanin = ff_arb_inst_vld_c2_scanout;
assign ff_arb_inst_vld_c2_2_scanin = ff_arb_inst_vld_c2_1_scanout;
assign ff_arb_inst_vld_c2_3_scanin = ff_arb_inst_vld_c2_2_scanout;
assign ff_arb_inst_vld_c2_4_scanin = ff_arb_inst_vld_c2_3_scanout;
assign ff_arb_inst_vld_c2_5_scanin = ff_arb_inst_vld_c2_4_scanout;
assign ff_arb_inst_vld_c2_6_scanin = ff_arb_inst_vld_c2_5_scanout;
assign ff_arb_inst_vld_c2_7_scanin = ff_arb_inst_vld_c2_6_scanout;
assign ff_arb_inst_vld_c2_8_scanin = ff_arb_inst_vld_c2_7_scanout;
assign ff_arb_inst_vld_c2_10_scanin = ff_arb_inst_vld_c2_8_scanout;
assign ff_arb_inst_vld_c3_scanin = ff_arb_inst_vld_c2_10_scanout;
assign ff_arb_inst_vld_c3_1_scanin = ff_arb_inst_vld_c3_scanout;
assign ff_arb_inst_vld_c3_2_scanin = ff_arb_inst_vld_c3_1_scanout;
assign ff_dec_evict_c2_scanin    = ff_arb_inst_vld_c3_2_scanout;
assign ff_dec_evict_tecc_c2_scanin = ff_dec_evict_c2_scanout  ;
assign ff_decdp_st_inst_c2_scanin = ff_dec_evict_tecc_c2_scanout;
assign ff_decdp_st_inst_c2_1_scanin = ff_decdp_st_inst_c2_scanout;
assign ff_decdp_st_inst_c3_scanin = ff_decdp_st_inst_c2_1_scanout;
assign ff_decdp_st_inst_c3_1_scanin = ff_decdp_st_inst_c3_scanout;
assign ff_decdp_st_inst_c3_2_scanin = ff_decdp_st_inst_c3_1_scanout;
assign ff_arbdp_inst_bufid1_c2_scanin = ff_decdp_st_inst_c3_2_scanout;
assign ff_decdp_bis_inst_c2_scanin = ff_arbdp_inst_bufid1_c2_scanout;
assign ff_decdp_rmo_st_c3_scanin = ff_decdp_bis_inst_c2_scanout;
assign ff_decdp_rmo_or_strst_c3_scanin = ff_decdp_rmo_st_c3_scanout;
assign ff_decdp_strst_inst_c2_scanin = ff_decdp_rmo_or_strst_c3_scanout;
assign ff_decdp_strst_inst_c2_1_scanin = ff_decdp_strst_inst_c2_scanout;
assign ff_decdp_wr8_inst_c2_scanin = ff_decdp_strst_inst_c2_1_scanout;
assign ff_decdp_wr64_inst_c2_scanin = ff_decdp_wr8_inst_c2_scanout;
assign ff_decdp_wr64_inst_c2_1_scanin = ff_decdp_wr64_inst_c2_scanout;
assign ff_arb_decdp_ld64_inst_c1_scanin = ff_decdp_wr64_inst_c2_1_scanout;
assign ff_decdp_inst_int_c2_scanin = ff_arb_decdp_ld64_inst_c1_scanout;
assign ff_decdp_pst_inst_c2_scanin = ff_decdp_inst_int_c2_scanout;
assign ff_decdp_pst_inst_c3_scanin = ff_decdp_pst_inst_c2_scanout;
assign ff_decdp_pst_inst_c4_scanin = ff_decdp_pst_inst_c3_scanout;
assign ff_decdp_pst_inst_c5_scanin = ff_decdp_pst_inst_c4_scanout;
assign ff_decdp_pst_inst_c52_scanin = ff_decdp_pst_inst_c5_scanout;
assign ff_decdp_pst_inst_c6_scanin = ff_decdp_pst_inst_c52_scanout;
assign ff_decdp_pst_inst_c7_scanin = ff_decdp_pst_inst_c6_scanout;
assign ff_st_no_ctrue_c1_scanin  = ff_decdp_pst_inst_c7_scanout;
assign ff_arbdp_pst_no_ctrue_c2_1_scanin = ff_st_no_ctrue_c1_scanout;
assign ff_arbdp_pst_with_ctrue_c2_scanin = ff_arbdp_pst_no_ctrue_c2_1_scanout;
assign ff_arbdp_tag_pst_no_ctrue_c2_scanin = ff_arbdp_pst_with_ctrue_c2_scanout;
assign ff_arbdp_misbuf_pst_no_ctrue_c2_scanin = ff_arbdp_tag_pst_no_ctrue_c2_scanout;
assign ff_arbdp_vuadctl_pst_no_ctrue_c2_scanin = ff_arbdp_misbuf_pst_no_ctrue_c2_scanout;
assign ff_decdp_cas1_inst_c2_scanin = ff_arbdp_vuadctl_pst_no_ctrue_c2_scanout;
assign ff_decdp_cas1_inst_c2_1_scanin = ff_decdp_cas1_inst_c2_scanout;
assign ff_decdp_cas2_inst_c2_scanin = ff_decdp_cas1_inst_c2_1_scanout;
assign ff_decdp_cas2_from_mb_c2_scanin = ff_decdp_cas2_inst_c2_scanout;
assign ff_decdp_cas2_from_mb_ctrue_c2_scanin = ff_decdp_cas2_from_mb_c2_scanout;
assign ff_store_err_c3_scanin    = ff_decdp_cas2_from_mb_ctrue_c2_scanout;
assign ff_store_err_c4_scanin    = ff_store_err_c3_scanout  ;
assign ff_store_err_c5_scanin    = ff_store_err_c4_scanout  ;
assign ff_store_err_c52_scanin   = ff_store_err_c5_scanout  ;
assign ff_store_err_c6_scanin    = ff_store_err_c52_scanout ;
assign ff_store_err_c7_scanin    = ff_store_err_c6_scanout  ;
assign ff_store_err_c8_scanin    = ff_store_err_c7_scanout  ;
assign ff_decdp_fwd_req_c2_scanin = ff_store_err_c8_scanout  ;
assign ff_decdp_swap_inst_c2_scanin = ff_decdp_fwd_req_c2_scanout;
assign ff_decdp_imiss_inst_c2_scanin = ff_decdp_swap_inst_c2_scanout;
assign ff_decdp_camld_inst_c2_scanin = ff_decdp_imiss_inst_c2_scanout;
assign ff_decdp_ld_inst_c2_scanin = ff_decdp_camld_inst_c2_scanout;
assign ff_decdp_pf_inst_c2_scanin = ff_decdp_ld_inst_c2_scanout;
assign ff_decdp_pf_inst_c3_scanin = ff_decdp_pf_inst_c2_scanout;
assign ff_decdp_pf_inst_c4_scanin = ff_decdp_pf_inst_c3_scanout;
assign ff_decdp_pf_inst_c5_scanin = ff_decdp_pf_inst_c4_scanout;
assign ff_decdp_pf_ice_inst_c2_scanin = ff_decdp_pf_inst_c5_scanout;
assign ff_decdp_pf_ice_inst_c3_scanin = ff_decdp_pf_ice_inst_c2_scanout;
assign ff_decdp_pf_ice_inst_c4_scanin = ff_decdp_pf_ice_inst_c3_scanout;
assign ff_decdp_pf_ice_inst_c5_scanin = ff_decdp_pf_ice_inst_c4_scanout;
assign ff_decdp_pf_ice_inst_c52_scanin = ff_decdp_pf_ice_inst_c5_scanout;
assign ff_decdp_pf_ice_inst_c6_scanin = ff_decdp_pf_ice_inst_c52_scanout;
assign ff_decdp_pf_ice_inst_c7_scanin = ff_decdp_pf_ice_inst_c6_scanout;
assign ff_decdp_dc_inval_c2_scanin = ff_decdp_pf_ice_inst_c7_scanout;
assign ff_decdp_ic_inval_c2_scanin = ff_decdp_dc_inval_c2_scanout;
assign ff_pst_no_ctrue_c3_scanin = ff_decdp_ic_inval_c2_scanout;
assign ff_pst_no_ctrue_c4_scanin = ff_pst_no_ctrue_c3_scanout;
assign ff_pst_no_ctrue_c5_scanin = ff_pst_no_ctrue_c4_scanout;
assign ff_pst_no_ctrue_c52_scanin = ff_pst_no_ctrue_c5_scanout;
assign ff_pst_no_ctrue_c6_scanin = ff_pst_no_ctrue_c52_scanout;
assign ff_pst_no_ctrue_c7_scanin = ff_pst_no_ctrue_c6_scanout;
assign ff_pst_no_ctrue_c8_scanin = ff_pst_no_ctrue_c7_scanout;
assign ff_decdp_cas1_inst_c3_scanin = ff_pst_no_ctrue_c8_scanout;
assign ff_decdp_cas1_inst_c4_scanin = ff_decdp_cas1_inst_c3_scanout;
assign ff_decdp_cas1_inst_c5_scanin = ff_decdp_cas1_inst_c4_scanout;
assign ff_decdp_cas1_inst_c52_scanin = ff_decdp_cas1_inst_c5_scanout;
assign ff_decdp_cas1_inst_c6_scanin = ff_decdp_cas1_inst_c52_scanout;
assign ff_decdp_cas1_inst_c7_scanin = ff_decdp_cas1_inst_c6_scanout;
assign ff_decdp_cas1_inst_c8_scanin = ff_decdp_cas1_inst_c7_scanout;
assign ff_arbdp_evict_c2_scanin  = ff_decdp_cas1_inst_c8_scanout;
assign ff_arbdp_evict_c3_scanin  = ff_arbdp_evict_c2_scanout;
assign ff_arbdp_evict_c4_scanin  = ff_arbdp_evict_c3_scanout;
assign ff_arbdp_tecc_inst_mb_c4_scanin = ff_arbdp_evict_c4_scanout;
assign ff_arbdp_tecc_inst_mb_c5_scanin = ff_arbdp_tecc_inst_mb_c4_scanout;
assign ff_arbdp_tecc_inst_mb_c52_scanin = ff_arbdp_tecc_inst_mb_c5_scanout;
assign ff_arbdp_tecc_inst_mb_c6_scanin = ff_arbdp_tecc_inst_mb_c52_scanout;
assign ff_arbdp_tecc_inst_mb_c7_scanin = ff_arbdp_tecc_inst_mb_c6_scanout;
assign ff_arbdp_tecc_inst_mb_c8_scanin = ff_arbdp_tecc_inst_mb_c7_scanout;
assign scan_out                  = ff_arbdp_tecc_inst_mb_c8_scanout;
// fixscan end:
endmodule 


//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module l2t_arb_ctl_spare_ctl_macro__num_4 (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;
wire si_3;
wire so_3;
wire spare3_flop_unused;
wire spare3_buf_32x_unused;
wire spare3_nand3_8x_unused;
wire spare3_inv_8x_unused;
wire spare3_aoi22_4x_unused;
wire spare3_buf_8x_unused;
wire spare3_oai22_4x_unused;
wire spare3_inv_16x_unused;
wire spare3_nand2_16x_unused;
wire spare3_nor3_4x_unused;
wire spare3_nand2_8x_unused;
wire spare3_buf_16x_unused;
wire spare3_nor2_16x_unused;
wire spare3_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));

cl_sc1_msff_8x spare3_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_3),
                               .so(so_3),
                               .d(1'b0),
                               .q(spare3_flop_unused));
assign si_3 = so_2;

cl_u1_buf_32x   spare3_buf_32x (.in(1'b1),
                                   .out(spare3_buf_32x_unused));
cl_u1_nand3_8x spare3_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare3_nand3_8x_unused));
cl_u1_inv_8x    spare3_inv_8x (.in(1'b1),
                                  .out(spare3_inv_8x_unused));
cl_u1_aoi22_4x spare3_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_aoi22_4x_unused));
cl_u1_buf_8x    spare3_buf_8x (.in(1'b1),
                                  .out(spare3_buf_8x_unused));
cl_u1_oai22_4x spare3_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_oai22_4x_unused));
cl_u1_inv_16x   spare3_inv_16x (.in(1'b1),
                                   .out(spare3_inv_16x_unused));
cl_u1_nand2_16x spare3_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare3_nand2_16x_unused));
cl_u1_nor3_4x spare3_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare3_nor3_4x_unused));
cl_u1_nand2_8x spare3_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare3_nand2_8x_unused));
cl_u1_buf_16x   spare3_buf_16x (.in(1'b1),
                                   .out(spare3_buf_16x_unused));
cl_u1_nor2_16x spare3_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare3_nor2_16x_unused));
cl_u1_inv_32x   spare3_inv_32x (.in(1'b1),
                                   .out(spare3_inv_32x_unused));
assign scan_out = so_3;



endmodule






// any PARAMS parms go into naming of macro

module l2t_arb_ctl_l1clkhdr_ctl_macro (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule













// any PARAMS parms go into naming of macro

module l2t_arb_ctl_msff_ctl_macro__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_arb_ctl_msff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_arb_ctl_msff_ctl_macro__clr_1__width_1 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0] & ~{1{clr}};






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_arb_ctl_msffi_ctl_macro__dmsff_16x__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  q_l, 
  scan_out);
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] q_l;
  output scan_out;






msffi #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(din[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q_l(q_l[1:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_arb_ctl_msff_ctl_macro__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_arb_ctl_msff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_arb_ctl_msff_ctl_macro__clr_1__en_1__width_8 (
  din, 
  en, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input en;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = (din[7:0] & {8{en}} & ~{8{clr}}) | (dout[7:0] & ~{8{en}} & ~{8{clr}});






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [3:0] din0;
  input sel0;
  input [3:0] din1;
  input sel1;
  output [3:0] dout;





assign dout[3:0] = ( {4{sel0}} & din0[3:0] ) |
                       ( {4{sel1}} & din1[3:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_arb_ctl_msff_ctl_macro__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0];






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_arb_ctl_msff_ctl_macro__width_7 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0];






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);












endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_3 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [2:0] din0;
  input sel0;
  input [2:0] din1;
  input sel1;
  output [2:0] dout;





assign dout[2:0] = ( {3{sel0}} & din0[2:0] ) |
                       ( {3{sel1}} & din1[2:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_8 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [7:0] din0;
  input sel0;
  input [7:0] din1;
  input sel1;
  output [7:0] dout;





assign dout[7:0] = ( {8{sel0}} & din0[7:0] ) |
                       ( {8{sel1}} & din1[7:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_arb_ctl_msff_ctl_macro__clr_1__en_1__width_11 (
  din, 
  en, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [10:0] fdin;
wire [9:0] so;

  input [10:0] din;
  input en;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [10:0] dout;
  output scan_out;
assign fdin[10:0] = (din[10:0] & {11{en}} & ~{11{clr}}) | (dout[10:0] & ~{11{en}} & ~{11{clr}});






dff #(11)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[10:0]),
.si({scan_in,so[9:0]}),
.so({so[9:0],scan_out}),
.q(dout[10:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_arb_ctl_msff_ctl_macro__width_11 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [10:0] fdin;
wire [9:0] so;

  input [10:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [10:0] dout;
  output scan_out;
assign fdin[10:0] = din[10:0];






dff #(11)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[10:0]),
.si({scan_in,so[9:0]}),
.so({so[9:0],scan_out}),
.q(dout[10:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_arb_ctl_msff_ctl_macro__en_1__width_8 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = (din[7:0] & {8{en}}) | (dout[7:0] & ~{8{en}});






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_2 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
  input [1:0] din0;
  input sel0;
  input [1:0] din1;
  input sel1;
  input [1:0] din2;
  input sel2;
  input [1:0] din3;
  input sel3;
  output [1:0] dout;





assign dout[1:0] = ( {2{sel0}} & din0[1:0] ) |
                       ( {2{sel1}} & din1[1:0]) |
                       ( {2{sel2}} & din2[1:0]) |
                       ( {2{sel3}} & din3[1:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_3 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [2:0] din0;
  input sel0;
  input [2:0] din1;
  input sel1;
  input [2:0] din2;
  input sel2;
  output [2:0] dout;





assign dout[2:0] = ( {3{sel0}} & din0[2:0] ) |
                       ( {3{sel1}} & din1[2:0]) |
                       ( {3{sel2}} & din2[2:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
  input [4:0] din0;
  input sel0;
  input [4:0] din1;
  input sel1;
  input [4:0] din2;
  input sel2;
  input [4:0] din3;
  input sel3;
  output [4:0] dout;





assign dout[4:0] = ( {5{sel0}} & din0[4:0] ) |
                       ( {5{sel1}} & din1[4:0]) |
                       ( {5{sel2}} & din2[4:0]) |
                       ( {5{sel3}} & din3[4:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_5 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [4:0] din0;
  input sel0;
  input [4:0] din1;
  input sel1;
  output [4:0] dout;





assign dout[4:0] = ( {5{sel0}} & din0[4:0] ) |
                       ( {5{sel1}} & din1[4:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_arb_ctl_msff_ctl_macro__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0];






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arb_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_5 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [4:0] din0;
  input sel0;
  input [4:0] din1;
  input sel1;
  input [4:0] din2;
  input sel2;
  output [4:0] dout;





assign dout[4:0] = ( {5{sel0}} & din0[4:0] ) |
                       ( {5{sel1}} & din1[4:0]) |
                       ( {5{sel2}} & din2[4:0]);





endmodule

