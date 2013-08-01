// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_misbuf_ctl.v
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


 
 
//////////////////////////////////////////////////////////////////////// 
// Local header file includes / local defines 
// Update on 3/10/2003: Added a gate_off_par_err_c2 signal to gate off 
// 			par error insertion when an instruction actually 
//		 	hits the $ or FB. However if an instruction is inserted 
//			due to another reason, then tagd_par_err_c2 is used 
//			for all other purposes. 
//////////////////////////////////////////////////////////////////////// 
 
module l2t_misbuf_ctl (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tag_miss_unqual_c2, 
  tag_store_inst_c3, 
  tag_hit_unqual_c2, 
  tag_hit_c3, 
  tag_lru_way_c4, 
  tag_rdma_vld_px0_p, 
  tag_misbuf_rdma_reg_vld_c2, 
  tag_hit_not_comp_c3, 
  tag_alt_tag_miss_unqual_c3, 
  tag_misbuf_int_ack_c3, 
  arb_pf_ice_inst_c2, 
  arbdec_pf_ice_inst_c1, 
  arb_inst_vld_c2, 
  arb_pf_ice_inst_c7, 
  arb_decdp_ld_inst_c2, 
  arb_decdp_imiss_inst_c2, 
  arb_decdp_swap_inst_c2, 
  arb_arbdp_pst_with_ctrue_c2, 
  arb_arbdp_misbuf_pst_no_ctrue_c2, 
  arb_decdp_cas2_inst_c2, 
  arbdec_arbdp_inst_mb_c2, 
  arb_decdp_pst_inst_c2, 
  arb_decdp_cas1_inst_c2, 
  arbdec_arbdp_inst_mb_entry_c1, 
  arb_arbdp_tecc_inst_mb_c8, 
  arbdec_arbdp_rdma_inst_c1, 
  arb_decdp_ld64_inst_c2, 
  arb_decdp_wr64_inst_c2, 
  arb_decdp_bis_inst_c3, 
  arbdec_arbdp_inst_bufidhi_c8, 
  arb_decdp_wr8_inst_c2, 
  arb_csr_st_c2, 
  arb_evict_vld_c2, 
  arb_misbuf_inst_vld_c2, 
  arb_pst_ctrue_en_c8, 
  arb_misbuf_hit_off_c1, 
  arb_evict_tecc_vld_c2, 
  arbdec_arbdp_inst_dep_c2, 
  arb_vuad_ce_err_c2, 
  usaloc_ua_ce_c2, 
  vlddir_vd_ce_c2, 
  misbuf_vuad_ce_err_c6, 
  misbuf_vuad_ce_instr_c2, 
  misbuf_vuad_ce_instr_ack_c2, 
  arb_decdp_cas2_from_mb_c2, 
  arbadr_arbdp_addr_c1c2comp_c1, 
  arbadr_arbdp_addr_c1c3comp_c1, 
  arbadr_idx_c1c2comp_c1, 
  arbadr_idx_c1c3comp_c1, 
  arb_misbuf_cas1_hit_c8, 
  arb_misbuf_ctrue_c9, 
  arb_misbuf_mbsel_c1, 
  mb_cam_match, 
  mb_cam_match_idx, 
  deccck_uncorr_err_c8, 
  deccck_notdata_err_c8, 
  deccck_spcd_corr_err_c8, 
  deccck_spcfb_corr_err_c8, 
  filbuf_misbuf_match_c2, 
  filbuf_misbuf_stinst_match_c2, 
  filbuf_misbuf_entry_avail, 
  filbuf_fbf_ready_miss_r1, 
  filbuf_fbf_enc_ld_mbid_r1, 
  filbuf_fbf_st_or_dep_rdy_c4, 
  filbuf_fbf_enc_dep_mbid_c4, 
  filbuf_fb_count_eq_0, 
  filbuf_misbuf_fbid_d2, 
  filbuf_misbuf_nofill_d2, 
  filbuf_misbuf_ue_offmode_c7, 
  filbuf_misbuf_ce_offmode_c7, 
  wbuf_hit_unqual_c2, 
  wbuf_misbuf_dep_rdy_en, 
  wbuf_misbuf_dep_mbid, 
  rdmat_hit_unqual_c2, 
  rdmat_misbuf_dep_mbid, 
  rdmat_misbuf_dep_rdy_en, 
  tag_misbuf_par_err_c3, 
  mcu_l2t_rd_ack, 
  csr_l2_bypass_mode_on, 
  csr_l2_dir_map_on, 
  l2clk, 
  wmr_l, 
  scan_in, 
  arb_tecc_c2, 
  scan_out, 
  misbuf_hit_st_dep_zero, 
  misbuf_arb_cnt28_px2_prev, 
  misbuf_arb_snp_cnt8_px1, 
  misbuf_arb_vld_px1, 
  misbuf_nondep_fbhit_c3, 
  misbuf_hit_c3, 
  misbuf_arb_hit_c3, 
  arb_misbuf_inval_inst_c2, 
  filbuf_match_c3, 
  misbuf_arbdp_ctrue_px2, 
  misbuf_arb_l2rd_en, 
  misbuf_arb_mcurd_en, 
  misbuf_tag_hit_unqual_c2, 
  misbuf_corr_err_c2, 
  misbuf_uncorr_err_c2, 
  misbuf_notdata_err_c2, 
  misbuf_wr64_miss_comp_c3, 
  misbuf_wbuf_mbid_c4, 
  misbuf_mbf_insert_mbid_c4, 
  misbuf_mbf_insert_c4, 
  misbuf_hit_c4, 
  misbuf_mbf_delete_c4, 
  misbuf_filbuf_next_vld_c4, 
  misbuf_filbuf_next_link_c4, 
  misbuf_filbuf_mcu_pick, 
  misbuf_filbuf_fbid, 
  misbuf_filbuf_way, 
  misbuf_filbuf_way_fbid_vld, 
  filbuf_tag_hit_frm_mb_c2, 
  misbuf_mbtag_wr_en_c2, 
  misbuf_mb_write_wl, 
  misbuf_buf_rd_en, 
  misbuf_mb_read_wl, 
  misbuf_dep_c8, 
  misbuf_mb_data_write_wl, 
  misbuf_evict_c8, 
  misbuf_tecc_c8, 
  misbuf_mbentry_c8, 
  misbuf_mbdata_wr_en_c8, 
  misbuf_notdata_err_c1, 
  misbuf_uncorr_err_c1, 
  l2t_mcu_rd_req, 
  l2t_mcu_rd_dummy_req, 
  l2t_mb2_mbdata_wr_en, 
  l2t_mb2_run, 
  l2t_mb2_mbdata_rd_en, 
  l2t_mb2_mbtag_rd_en, 
  l2t_mb2_mbtag_wr_en, 
  l2t_mb2_addr, 
  mb_mbist_cam_hit, 
  mbtag_mbist_cam_sel, 
  misbuf_vuad_ce_err_c8);
wire pce_ov;
wire siclk;
wire soclk;
wire stop;
wire se;
wire l1clk;
wire vuad_err_true_c2;
wire vuad_err_true_c3;
wire spares_scanout;
wire dbginit_l;
wire reset_flop_scanin;
wire reset_flop_scanout;
wire arb_vuad_ce_err_c2_qual;
wire ff_l2t_mbist_r1_scanin;
wire ff_l2t_mbist_r1_scanout;
wire l2t_mb2_mbdata_wr_en_r1;
wire l2t_mb2_mbtag_rd_en_r1;
wire l2t_mb2_mbtag_wr_en_r1;
wire l2t_mb2_mbdata_rd_en_r1;
wire [4:0] l2t_mb2_addr_r1;
wire l2t_mb2_mbdata_wr_en_r2;
wire mbtag_mbist_cam_sel_r1;
wire l2t_mb2_run_r1;
wire l2t_mb2_mbtag_rd_en_r2;
wire l2t_mb2_mbtag_wr_en_r2;
wire l2t_mb2_mbdata_rd_en_r2;
wire [4:0] l2t_mb2_addr_r2;
wire misbuf_vuad_ce_err_log_c2;
wire ff_loggingerr_scanin;
wire ff_loggingerr_scanout;
wire misbuf_vuad_ce_err_log_c3;
wire misbuf_vuad_ce_err_log_c4;
wire misbuf_vuad_ce_err_log_c5;
wire misbuf_vuad_ce_err_log_c52;
wire misbuf_vuad_ce_err_log_c6;
wire misbuf_vuad_ce_err_log_c7;
wire ff_tag_hit_unqual_c3_scanin;
wire ff_tag_hit_unqual_c3_scanout;
wire ff_mbf_insert_c3_scanin;
wire ff_mbf_insert_c3_scanout;
wire ff_mbf_insert_c3_1_scanin;
wire ff_mbf_insert_c3_1_scanout;
wire mbf_insert_c3_tmp_1_clone;
wire ff_inst_mb_c3_1_scanin;
wire ff_inst_mb_c3_1_scanout;
wire ff_arb_vuad_ce_err_c3_scanin;
wire ff_arb_vuad_ce_err_c3_scanout;
wire arb_vuad_ce_err_c3;
wire ff_mbf_delete_c3_scanin;
wire ff_mbf_delete_c3_scanout;
wire mbf_delete_c3_tmp;
wire ff_mbf_delete_c3_1_scanin;
wire ff_mbf_delete_c3_1_scanout;
wire mbf_delete_c3_tmp_1_clone;
wire arb_pf_ice_inst_c3;
wire misbuf_tag_hit_unqual_c2_internal;
wire ff_mbctl_nondep_fbhit_c3_scanin;
wire ff_mbctl_nondep_fbhit_c3_scanout;
wire [31:0] mbtag_write_ptr;
wire ff_mb_count_c4_scanin;
wire ff_mb_count_c4_scanout;
wire ff_rdma_inst_c2_scanin;
wire ff_rdma_inst_c2_scanout;
wire ff_rdma_inst_c3_scanin;
wire ff_rdma_inst_c3_scanout;
wire ff_mb_rdma_count_c4_scanin;
wire ff_mb_rdma_count_c4_scanout;
wire ff_inst_mb_entry_c2_scanin;
wire ff_inst_mb_entry_c2_scanout;
wire mb_mbist_cam_hit_unreg;
wire ff_mb_mbist_cam_match_scanin;
wire ff_mb_mbist_cam_match_scanout;
wire [31:0] mb_cam_match_reg;
wire ff_l2_dir_map_on_d1_scanin;
wire ff_l2_dir_map_on_d1_scanout;
wire ff_tmp_cam_hit_vec_c2_scanin;
wire ff_tmp_cam_hit_vec_c2_scanout;
wire ff_tmp_idx_hit_vec_c2_scanin;
wire ff_tmp_idx_hit_vec_c2_scanout;
wire ff_misbuf_c1c2_match_c1_d1_scanin;
wire ff_misbuf_c1c2_match_c1_d1_scanout;
wire ff_misbuf_c1c2_match_c1_d1_1_scanin;
wire ff_misbuf_c1c2_match_c1_d1_1_scanout;
wire misbuf_c1c2_match_c1_d1_1_clone;
wire ff_mb_hit_off_c1_d1_scanin;
wire ff_mb_hit_off_c1_d1_scanout;
wire mb_hit_off_c1_d1_clone;
wire ff_misbuf_hit_vec_c3_scanin;
wire ff_misbuf_hit_vec_c3_scanout;
wire tmp_cam_hit_c2_or_all;
wire tmp_hit_unqual_c2_cloned;
wire inst_mb_c3_2_clone;
wire mb_inst_vld_c3_2_clone;
wire tmp_cam_hit_c2_clone;
wire ff_idx_c1c2comp_c1_d1_scanin;
wire ff_idx_c1c2comp_c1_d1_scanout;
wire arbadr_idx_c1c2comp_c1_d1;
wire ff_misbuf_idx_hit_vec_c3_scanin;
wire ff_misbuf_idx_hit_vec_c3_scanout;
wire [1:0] cout6;
wire [1:0] cout7;
wire [1:0] cout8;
wire [1:0] cout9;
wire [1:0] cout10;
wire ff_hit_count_c4_scanin;
wire ff_hit_count_c4_scanout;
wire ff_mb_idx_count_full_c5_scanin;
wire ff_mb_idx_count_full_c5_scanout;
wire ff_inst_mb_c3_scanin;
wire ff_inst_mb_c3_scanout;
wire ff_inst_mb_c3_2_scanin;
wire ff_inst_mb_c3_2_scanout;
wire ff_mb_inst_vld_c3_scanin;
wire ff_mb_inst_vld_c3_scanout;
wire ff_mb_inst_vld_c3_1_scanin;
wire ff_mb_inst_vld_c3_1_scanout;
wire ff_mb_inst_vld_staging_scanin;
wire ff_mb_inst_vld_staging_scanout;
wire misbuf_inst_c4;
wire misbuf_inst_c5;
wire misbuf_inst_c52;
wire misbuf_inst_c6;
wire misbuf_inst_c7;
wire misbuf_inst_c8;
wire ff_mb_inst_vld_c3_2_scanin;
wire ff_mb_inst_vld_c3_2_scanout;
wire ff_mb_rewrite_en_c4_scanin;
wire ff_mb_rewrite_en_c4_scanout;
wire ff_mb_rewrite_en_c5_scanin;
wire ff_mb_rewrite_en_c5_scanout;
wire ff_mb_rewrite_en_c52_scanin;
wire ff_mb_rewrite_en_c52_scanout;
wire mb_rewrite_en_c52;
wire ff_mb_rewrite_en_c6_scanin;
wire ff_mb_rewrite_en_c6_scanout;
wire ff_mb_rewrite_en_c7_scanin;
wire ff_mb_rewrite_en_c7_scanout;
wire ff_mb_rewrite_en_c8_scanin;
wire ff_mb_rewrite_en_c8_scanout;
wire ff_mbdata_wr_en_c4_scanin;
wire ff_mbdata_wr_en_c4_scanout;
wire ff_mbdata_wr_en_c5_scanin;
wire ff_mbdata_wr_en_c5_scanout;
wire ff_mbdata_wr_en_c52_scanin;
wire ff_mbdata_wr_en_c52_scanout;
wire ff_mbdata_wr_en_c6_scanin;
wire ff_mbdata_wr_en_c6_scanout;
wire ff_mbdata_wr_en_c7_scanin;
wire ff_mbdata_wr_en_c7_scanout;
wire ff_mbdata_wr_en_c8_scanin;
wire ff_mbdata_wr_en_c8_scanout;
wire misbuf_mbdata_wr_en_c8_fnl;
wire ff_enc_tag_wr_wl_c3_scanin;
wire ff_enc_tag_wr_wl_c3_scanout;
wire ff_enc_data_wr_wl_c4_scanin;
wire ff_enc_data_wr_wl_c4_scanout;
wire ff_enc_data_wr_wl_c5_scanin;
wire ff_enc_data_wr_wl_c5_scanout;
wire ff_enc_data_wr_wl_c52_scanin;
wire ff_enc_data_wr_wl_c52_scanout;
wire ff_enc_data_wr_wl_c6_scanin;
wire ff_enc_data_wr_wl_c6_scanout;
wire ff_enc_data_wr_wl_c7_scanin;
wire ff_enc_data_wr_wl_c7_scanout;
wire ff_enc_data_wr_wl_c8_scanin;
wire ff_enc_data_wr_wl_c8_scanout;
wire ff_enc_data_wr_wl_c9_scanin;
wire ff_enc_data_wr_wl_c9_scanout;
wire ff_mbf_dep_c3_scanin;
wire ff_mbf_dep_c3_scanout;
wire misbuf_dep_inst_c3_tmp;
wire ff_dep_inst_c3_scanin;
wire ff_dep_inst_c3_scanout;
wire ff_tecc_c3_scanin;
wire ff_tecc_c3_scanout;
wire ff_set_dep_c2_ldifetch_miss_c2_scanin;
wire ff_set_dep_c2_ldifetch_miss_c2_scanout;
wire arb_decdp_cas2_inst_c3;
wire arb_decdp_swap_inst_c3;
wire ff_mbf_dep_c4_scanin;
wire ff_mbf_dep_c4_scanout;
wire ff_dep_bit_scanin;
wire ff_dep_bit_scanout;
wire ff_mbf_dep_c5_scanin;
wire ff_mbf_dep_c5_scanout;
wire ff_mbf_dep_c52_scanin;
wire ff_mbf_dep_c52_scanout;
wire ff_mbf_dep_c6_scanin;
wire ff_mbf_dep_c6_scanout;
wire ff_mbf_dep_c7_scanin;
wire ff_mbf_dep_c7_scanout;
wire ff_mbf_dep_c8_scanin;
wire ff_mbf_dep_c8_scanout;
wire ff_misbuf_mark_evict_tmp_c3_scanin;
wire ff_misbuf_mark_evict_tmp_c3_scanout;
wire ff_evict_vld_unqual_c3_scanin;
wire ff_evict_vld_unqual_c3_scanout;
wire ff_decdp_wr64_inst_c3_scanin;
wire ff_decdp_wr64_inst_c3_scanout;
wire ff_decdp_ld64_inst_c3_scanin;
wire ff_decdp_ld64_inst_c3_scanout;
wire ff_ld64_inst_c4_scanin;
wire ff_ld64_inst_c4_scanout;
wire ff_ld64_inst_c5_scanin;
wire ff_ld64_inst_c5_scanout;
wire ff_ld64_inst_c52_scanin;
wire ff_ld64_inst_c52_scanout;
wire ff_ld64_inst_c6_scanin;
wire ff_ld64_inst_c6_scanout;
wire ff_ld64_inst_c7_scanin;
wire ff_ld64_inst_c7_scanout;
wire arb_decdp_cas2_from_mb_c3;
wire ff_mcu_rdy_c4_scanin;
wire ff_mcu_rdy_c4_scanout;
wire ff_mcu_rdy_c5_scanin;
wire ff_mcu_rdy_c5_scanout;
wire ff_mcu_rdy_c52_scanin;
wire ff_mcu_rdy_c52_scanout;
wire ff_mcu_rdy_c6_scanin;
wire ff_mcu_rdy_c6_scanout;
wire ff_mcu_rdy_c7_scanin;
wire ff_mcu_rdy_c7_scanout;
wire ff_mcu_rdy_c8_scanin;
wire ff_mcu_rdy_c8_scanout;
wire ff_evict_par_err_c3_scanin;
wire ff_evict_par_err_c3_scanout;
wire evict_par_vuad_ce_err_c3;
wire ff_evict_par_err_c4_scanin;
wire ff_evict_par_err_c4_scanout;
wire ff_evict_par_err_c5_scanin;
wire ff_evict_par_err_c5_scanout;
wire ff_evict_par_err_c52_scanin;
wire ff_evict_par_err_c52_scanout;
wire ff_evict_par_err_c6_scanin;
wire ff_evict_par_err_c6_scanout;
wire ff_evict_par_err_c7_scanin;
wire ff_evict_par_err_c7_scanout;
wire misbuf_evict_nopfice_c7;
wire ff_misbuf_evict_c8_scanin;
wire ff_misbuf_evict_c8_scanout;
wire buffer_miss_vld_c4;
wire buffer_miss_vld_c5;
wire buffer_miss_vld_c52;
wire buffer_miss_vld_c6;
wire buffer_miss_vld_c7;
wire ff_buffer_miss_vld_c3_scanin;
wire ff_buffer_miss_vld_c3_scanout;
wire buffer_miss_vld_c8;
wire ff_rdma_reg_vld_c3_scanin;
wire ff_rdma_reg_vld_c3_scanout;
wire ff_rdma_comp_rdy_c4_scanin;
wire ff_rdma_comp_rdy_c4_scanout;
wire ff_rdma_comp_rdy_c5_scanin;
wire ff_rdma_comp_rdy_c5_scanout;
wire ff_rdma_comp_rdy_c52_scanin;
wire ff_rdma_comp_rdy_c52_scanout;
wire ff_rdma_comp_rdy_c6_scanin;
wire ff_rdma_comp_rdy_c6_scanout;
wire ff_rdma_comp_rdy_c7_scanin;
wire ff_rdma_comp_rdy_c7_scanout;
wire ff_rdma_comp_rdy_c8_scanin;
wire ff_rdma_comp_rdy_c8_scanout;
wire ff_misbuf_tecc_c4_scanin;
wire ff_misbuf_tecc_c4_scanout;
wire ff_misbuf_tecc_c5_scanin;
wire ff_misbuf_tecc_c5_scanout;
wire ff_misbuf_tecc_c52_scanin;
wire ff_misbuf_tecc_c52_scanout;
wire ff_misbuf_tecc_c6_scanin;
wire ff_misbuf_tecc_c6_scanout;
wire ff_misbuf_tecc_c7_scanin;
wire ff_misbuf_tecc_c7_scanout;
wire ff_misbuf_tecc_c8_scanin;
wire ff_misbuf_tecc_c8_scanout;
wire ff_mb_write_ptr_c3_scanin;
wire ff_mb_write_ptr_c3_scanout;
wire ff_mb_entry_c3_scanin;
wire ff_mb_entry_c3_scanout;
wire ff_mb_entry_c3_1_scanin;
wire ff_mb_entry_c3_1_scanout;
wire ff_valid_bit_scanin;
wire ff_valid_bit_scanout;
wire ff_rdma_bit_scanin;
wire ff_rdma_bit_scanout;
wire ff_bis_bit_scanin;
wire ff_bis_bit_scanout;
wire ff_arb_pf_ice_inst_c8_scanin;
wire ff_arb_pf_ice_inst_c8_scanout;
wire arb_pf_ice_inst_c8;
wire arb_vuad_ce_err_c3_tmp;
wire arb_vuad_ce_err_c4;
wire arb_vuad_ce_err_c5;
wire arb_vuad_ce_err_c52;
wire arb_vuad_ce_err_c6;
wire arb_vuad_ce_err_c7;
wire ff_arb_vuad_ce_err_slice_scanin;
wire ff_arb_vuad_ce_err_slice_scanout;
wire arb_vuad_ce_err_c8;
wire misbuf_hit_unqual_c3;
wire [31:0] reset_vuad_ce_replay;
wire tag_misbuf_ack_c3;
wire [31:0] vuad_ce_replay_in;
wire [31:0] vuad_ack_pending_in;
wire ff_vuad_ce_replay_scanin;
wire ff_vuad_ce_replay_scanout;
wire ff_mcu_ready_bit_scanin;
wire ff_mcu_ready_bit_scanout;
wire ff_young_bit_scanin;
wire ff_young_bit_scanout;
wire ff_next_link0_scanin;
wire ff_next_link0_scanout;
wire ff_next_link1_scanin;
wire ff_next_link1_scanout;
wire ff_next_link2_scanin;
wire ff_next_link2_scanout;
wire ff_next_link3_scanin;
wire ff_next_link3_scanout;
wire ff_next_link4_scanin;
wire ff_next_link4_scanout;
wire ff_next_link5_scanin;
wire ff_next_link5_scanout;
wire ff_next_link6_scanin;
wire ff_next_link6_scanout;
wire ff_next_link7_scanin;
wire ff_next_link7_scanout;
wire ff_next_link8_scanin;
wire ff_next_link8_scanout;
wire ff_next_link9_scanin;
wire ff_next_link9_scanout;
wire ff_next_link10_scanin;
wire ff_next_link10_scanout;
wire ff_next_link11_scanin;
wire ff_next_link11_scanout;
wire ff_next_link12_scanin;
wire ff_next_link12_scanout;
wire ff_next_link13_scanin;
wire ff_next_link13_scanout;
wire ff_next_link14_scanin;
wire ff_next_link14_scanout;
wire ff_next_link15_scanin;
wire ff_next_link15_scanout;
wire ff_next_link16_scanin;
wire ff_next_link16_scanout;
wire ff_next_link17_scanin;
wire ff_next_link17_scanout;
wire ff_next_link18_scanin;
wire ff_next_link18_scanout;
wire ff_next_link19_scanin;
wire ff_next_link19_scanout;
wire ff_next_link20_scanin;
wire ff_next_link20_scanout;
wire ff_next_link21_scanin;
wire ff_next_link21_scanout;
wire ff_next_link22_scanin;
wire ff_next_link22_scanout;
wire ff_next_link23_scanin;
wire ff_next_link23_scanout;
wire ff_next_link24_scanin;
wire ff_next_link24_scanout;
wire ff_next_link25_scanin;
wire ff_next_link25_scanout;
wire ff_next_link26_scanin;
wire ff_next_link26_scanout;
wire ff_next_link27_scanin;
wire ff_next_link27_scanout;
wire ff_next_link28_scanin;
wire ff_next_link28_scanout;
wire ff_next_link29_scanin;
wire ff_next_link29_scanout;
wire ff_next_link30_scanin;
wire ff_next_link30_scanout;
wire ff_next_link31_scanin;
wire ff_next_link31_scanout;
wire ff_inst_mb_c4_scanin;
wire ff_inst_mb_c4_scanout;
wire ff_inst_mb_c5_scanin;
wire ff_inst_mb_c5_scanout;
wire ff_inst_mb_c52_scanin;
wire ff_inst_mb_c52_scanout;
wire tag_inst_mb_c52;
wire ff_inst_mb_c6_scanin;
wire ff_inst_mb_c6_scanout;
wire ff_inst_mb_c7_scanin;
wire ff_inst_mb_c7_scanout;
wire ff_inst_mb_c8_scanin;
wire ff_inst_mb_c8_scanout;
wire ff_inst_mb_c9_scanin;
wire ff_inst_mb_c9_scanout;
wire ff_enc_data_wr_wl_c7_1_scanin;
wire ff_enc_data_wr_wl_c7_1_scanout;
wire set_arb_misbuf_cas1_hit_c8;
wire ff_cas1_hit_c9_scanin;
wire ff_cas1_hit_c9_scanout;
wire ff_uncorr_err_c9_scanin;
wire ff_uncorr_err_c9_scanout;
wire ff_notdata_err_c9_scanin;
wire ff_notdata_err_c9_scanout;
wire notdata_err_c9;
wire ff_corr_err_c9_scanin;
wire ff_corr_err_c9_scanout;
wire corr_err_c9;
wire ff_inst_bufidhi_c9_scanin;
wire ff_inst_bufidhi_c9_scanout;
wire arbdec_arbdp_inst_bufidhi_c9;
wire ff_ctrue_bit_scanin;
wire ff_ctrue_bit_scanout;
wire ff_mbf_insert_mbid_c4_scanin;
wire ff_mbf_insert_mbid_c4_scanout;
wire ff_mbf_insert_c4_scanin;
wire ff_mbf_insert_c4_scanout;
wire ff_misbuf_hit_c3_scanin;
wire ff_misbuf_hit_c3_scanout;
wire ff_misbuf_arb_hit_c3_scanin;
wire ff_misbuf_arb_hit_c3_scanout;
wire ff_misbuf_hit_c4_scanin;
wire ff_misbuf_hit_c4_scanout;
wire ff_misbuf_filbuf_next_vld_c4_scanin;
wire ff_misbuf_filbuf_next_vld_c4_scanout;
wire ff_mbf_delete_c4_scanin;
wire ff_mbf_delete_c4_scanout;
wire [4:0] nextlink_ida0123;
wire [4:0] nextlink_ida4567;
wire [4:0] nextlink_ida89ab;
wire [4:0] nextlink_idacdef;
wire ff_misbuf_filbuf_next_link_c4_scanin;
wire ff_misbuf_filbuf_next_link_c4_scanout;
wire ff_mb_data_vld_scanin;
wire ff_mb_data_vld_scanout;
wire misbuf_evict_qual_c7;
wire ff_gate_evict_set_staging_scanin;
wire ff_gate_evict_set_staging_scanout;
wire misbuf_evict_c8_pfice_qual;
wire [31:0] pfice_inst_rdy;
wire ff_mb_evict_ready_scanin;
wire ff_mb_evict_ready_scanout;
wire ff_mb_tecc_ready_scanin;
wire ff_mb_tecc_ready_scanout;
wire ff_ready_miss_r2_scanin;
wire ff_ready_miss_r2_scanout;
wire ff_fbf_enc_ld_mbid_r1_scanin;
wire ff_fbf_enc_ld_mbid_r1_scanout;
wire ff_fbf_st_or_dep_rdy_c5_scanin;
wire ff_fbf_st_or_dep_rdy_c5_scanout;
wire ff_fbf_enc_dep_mbid_c5_scanin;
wire ff_fbf_enc_dep_mbid_c5_scanout;
wire ff_decdp_cas1_inst_c2_scanin;
wire ff_decdp_cas1_inst_c2_scanout;
wire ff_l2_bypass_mode_on_d1_scanin;
wire ff_l2_bypass_mode_on_d1_scanout;
wire ff_filbuf_match_c3_scanin;
wire ff_filbuf_match_c3_scanout;
wire ff_filbuf_stinst_match_c3_scanin;
wire ff_filbuf_stinst_match_c3_scanout;
wire ff_misbuf_inval_inst_c3_scanin;
wire ff_misbuf_inval_inst_c3_scanout;
wire ff_mb_dep_rdy_en_c4_scanin;
wire ff_mb_dep_rdy_en_c4_scanout;
wire ff_wbb_dep_rdy_en_d1_scanin;
wire ff_wbb_dep_rdy_en_d1_scanout;
wire ff_dep_mbid_d1_scanin;
wire ff_dep_mbid_d1_scanout;
wire ff_rdmatb_dep_rdy_en_d1_scanin;
wire ff_rdmatb_dep_rdy_en_d1_scanout;
wire ff_dep_rdmat_mbid_d1_scanin;
wire ff_dep_rdmat_mbid_d1_scanout;
wire ff_set_mbid_vld_scanin;
wire ff_set_mbid_vld_scanout;
wire ff_mbid_vld_scanin;
wire ff_mbid_vld_scanout;
wire ff_mbid_scanin;
wire ff_mbid_scanout;
wire set_mbid_vld_pfice_prev;
wire ff_set_mbid_vld_pfice_prev_scanin;
wire ff_set_mbid_vld_pfice_prev_scanout;
wire set_mbid_vld_pfice;
wire ready_pf_ice_instr;
wire pf_ice_mbid_vld_in;
wire pf_ice_mbid_vld;
wire ff_pfice_mbid_vld_scanin;
wire ff_pfice_mbid_vld_scanout;
wire pf_ice_rdy_inst_en;
wire ff_pfice_mbid_scanin;
wire ff_pfice_mbid_scanout;
wire [4:0] pf_ice_csr_mbid;
wire ff_vuad_ce_err_ready_scanin;
wire ff_vuad_ce_err_ready_scanout;
wire nonmisbuf_inst_c8;
wire misbuf_inst_with_vuaderr_c8;
wire ff_mb_l2_ready_scanin;
wire ff_mb_l2_ready_scanout;
wire ff_l2_pick_d1_scanin;
wire ff_l2_pick_d1_scanout;
wire ff_l2_wait_scanin;
wire ff_l2_wait_scanout;
wire ff_read_reg_ctrue_in_scanin;
wire ff_read_reg_ctrue_in_scanout;
wire ff_mcu_l2t_rd_ack_d1_scanin;
wire ff_mcu_l2t_rd_ack_d1_scanout;
wire ff_misbuf_filbuf_mcu_pick_scanin;
wire ff_misbuf_filbuf_mcu_pick_scanout;
wire ff_mcu_pick_scanin;
wire ff_mcu_pick_scanout;
wire ff_mcu_pick_2_scanin;
wire ff_mcu_pick_2_scanout;
wire ff_mcu_pick_d1_scanin;
wire ff_mcu_pick_d1_scanout;
wire mcu_pick_d1;
wire ff_mcu_pick_d2_scanin;
wire ff_mcu_pick_d2_scanout;
wire mcu_pick_d2;
wire ff_dummy_req_d2_scanin;
wire ff_dummy_req_d2_scanout;
wire ff_mcu_ack_pend_state_scanin;
wire ff_mcu_ack_pend_state_scanout;
wire ff_evict_vld_c4_scanin;
wire ff_evict_vld_c4_scanout;
wire ff_way0_scanin;
wire ff_way0_scanout;
wire ff_way1_scanin;
wire ff_way1_scanout;
wire ff_way2_scanin;
wire ff_way2_scanout;
wire ff_way3_scanin;
wire ff_way3_scanout;
wire ff_way4_scanin;
wire ff_way4_scanout;
wire ff_way5_scanin;
wire ff_way5_scanout;
wire ff_way6_scanin;
wire ff_way6_scanout;
wire ff_way7_scanin;
wire ff_way7_scanout;
wire ff_way8_scanin;
wire ff_way8_scanout;
wire ff_way9_scanin;
wire ff_way9_scanout;
wire ff_way10_scanin;
wire ff_way10_scanout;
wire ff_way11_scanin;
wire ff_way11_scanout;
wire ff_way12_scanin;
wire ff_way12_scanout;
wire ff_way13_scanin;
wire ff_way13_scanout;
wire ff_way14_scanin;
wire ff_way14_scanout;
wire ff_way15_scanin;
wire ff_way15_scanout;
wire ff_way16_scanin;
wire ff_way16_scanout;
wire ff_way17_scanin;
wire ff_way17_scanout;
wire ff_way18_scanin;
wire ff_way18_scanout;
wire ff_way19_scanin;
wire ff_way19_scanout;
wire ff_way20_scanin;
wire ff_way20_scanout;
wire ff_way21_scanin;
wire ff_way21_scanout;
wire ff_way22_scanin;
wire ff_way22_scanout;
wire ff_way23_scanin;
wire ff_way23_scanout;
wire ff_way24_scanin;
wire ff_way24_scanout;
wire ff_way25_scanin;
wire ff_way25_scanout;
wire ff_way26_scanin;
wire ff_way26_scanout;
wire ff_way27_scanin;
wire ff_way27_scanout;
wire ff_way28_scanin;
wire ff_way28_scanout;
wire ff_way29_scanin;
wire ff_way29_scanout;
wire ff_way30_scanin;
wire ff_way30_scanout;
wire ff_way31_scanin;
wire ff_way31_scanout;
wire ff_arb_pf_ice_inst_c4_scanin;
wire ff_arb_pf_ice_inst_c4_scanout;
wire ff_mb_way_vld_scanin;
wire ff_mb_way_vld_scanout;
wire ff_fbid0_scanin;
wire ff_fbid0_scanout;
wire ff_fbid1_scanin;
wire ff_fbid1_scanout;
wire ff_fbid2_scanin;
wire ff_fbid2_scanout;
wire ff_fbid3_scanin;
wire ff_fbid3_scanout;
wire ff_fbid4_scanin;
wire ff_fbid4_scanout;
wire ff_fbid5_scanin;
wire ff_fbid5_scanout;
wire ff_fbid6_scanin;
wire ff_fbid6_scanout;
wire ff_fbid7_scanin;
wire ff_fbid7_scanout;
wire ff_fbid8_scanin;
wire ff_fbid8_scanout;
wire ff_fbid9_scanin;
wire ff_fbid9_scanout;
wire ff_fbid10_scanin;
wire ff_fbid10_scanout;
wire ff_fbid11_scanin;
wire ff_fbid11_scanout;
wire ff_fbid12_scanin;
wire ff_fbid12_scanout;
wire ff_fbid13_scanin;
wire ff_fbid13_scanout;
wire ff_fbid14_scanin;
wire ff_fbid14_scanout;
wire ff_fbid15_scanin;
wire ff_fbid15_scanout;
wire ff_fbid16_scanin;
wire ff_fbid16_scanout;
wire ff_fbid17_scanin;
wire ff_fbid17_scanout;
wire ff_fbid18_scanin;
wire ff_fbid18_scanout;
wire ff_fbid19_scanin;
wire ff_fbid19_scanout;
wire ff_fbid20_scanin;
wire ff_fbid20_scanout;
wire ff_fbid21_scanin;
wire ff_fbid21_scanout;
wire ff_fbid22_scanin;
wire ff_fbid22_scanout;
wire ff_fbid23_scanin;
wire ff_fbid23_scanout;
wire ff_fbid24_scanin;
wire ff_fbid24_scanout;
wire ff_fbid25_scanin;
wire ff_fbid25_scanout;
wire ff_fbid26_scanin;
wire ff_fbid26_scanout;
wire ff_fbid27_scanin;
wire ff_fbid27_scanout;
wire ff_fbid28_scanin;
wire ff_fbid28_scanout;
wire ff_fbid29_scanin;
wire ff_fbid29_scanout;
wire ff_fbid30_scanin;
wire ff_fbid30_scanout;
wire ff_fbid31_scanin;
wire ff_fbid31_scanout;
wire ff_mb_fbid_vld_scanin;
wire ff_mb_fbid_vld_scanout;
wire ff_misbuf_filbuf_way_fbid_vld_scanin;
wire ff_misbuf_filbuf_way_fbid_vld_scanout;
wire fbsel_23to20;
wire ff_fbsel_0to3_d1_scanin;
wire ff_fbsel_0to3_d1_scanout;
wire ff_fbsel_4to7_d1_scanin;
wire ff_fbsel_4to7_d1_scanout;
wire ff_fbsel_8tob_d1_scanin;
wire ff_fbsel_8tob_d1_scanout;
wire ff_fbsel_15to12_d1_scanin;
wire ff_fbsel_15to12_d1_scanout;
wire ff_fbsel_a_0to3_d1_scanin;
wire ff_fbsel_a_0to3_d1_scanout;
wire ff_fbsel_a_4to7_d1_scanin;
wire ff_fbsel_a_4to7_d1_scanout;
wire ff_fbsel_a_8tob_d1_scanin;
wire ff_fbsel_a_8tob_d1_scanout;
wire ff_fbsel_def_vld_d1_scanin;
wire ff_fbsel_def_vld_d1_scanout;
wire ff_misbuf_filbuf_way_0123_scanin;
wire ff_misbuf_filbuf_way_0123_scanout;
wire ff_misbuf_filbuf_way_4567_scanin;
wire ff_misbuf_filbuf_way_4567_scanout;
wire ff_misbuf_filbuf_way_89ab_scanin;
wire ff_misbuf_filbuf_way_89ab_scanout;
wire ff_misbuf_filbuf_way_cdef_scanin;
wire ff_misbuf_filbuf_way_cdef_scanout;
wire ff_misbuf_filbuf_way_a0123_scanin;
wire ff_misbuf_filbuf_way_a0123_scanout;
wire ff_misbuf_filbuf_way_a4567_scanin;
wire ff_misbuf_filbuf_way_a4567_scanout;
wire ff_misbuf_filbuf_way_a89ab_scanin;
wire ff_misbuf_filbuf_way_a89ab_scanout;
wire ff_misbuf_filbuf_way_acdef_scanin;
wire ff_misbuf_filbuf_way_acdef_scanout;
wire [3:0] misbuf_filbuf_a_way;
wire [3:0] misbuf_filbuf_b_way;
wire [2:0] fbida0123;
wire [2:0] fbida4567;
wire [2:0] fbida89ab;
wire [2:0] fbidacdef;
wire ff_misbuf_filbuf_fbid_0123_scanin;
wire ff_misbuf_filbuf_fbid_0123_scanout;
wire ff_misbuf_filbuf_fbid_4567_scanin;
wire ff_misbuf_filbuf_fbid_4567_scanout;
wire ff_misbuf_filbuf_fbid_89ab_scanin;
wire ff_misbuf_filbuf_fbid_89ab_scanout;
wire ff_misbuf_filbuf_fbid_cdef_scanin;
wire ff_misbuf_filbuf_fbid_cdef_scanout;
wire ff_misbuf_filbuf_fbid_a0123_scanin;
wire ff_misbuf_filbuf_fbid_a0123_scanout;
wire ff_misbuf_filbuf_fbid_a4567_scanin;
wire ff_misbuf_filbuf_fbid_a4567_scanout;
wire ff_misbuf_filbuf_fbid_a89ab_scanin;
wire ff_misbuf_filbuf_fbid_a89ab_scanout;
wire ff_misbuf_filbuf_fbid_acdef_scanin;
wire ff_misbuf_filbuf_fbid_acdef_scanout;
wire partial_st_wr8_inst_c2;
wire ff_wr8_piped_scanin;
wire ff_wr8_piped_scanout;
wire partial_st_wr8_inst_c3;
wire partial_st_wr8_inst_c4;
wire partial_st_wr8_inst_c5;
wire partial_st_wr8_inst_c52;
wire partial_st_wr8_inst_c6;
wire partial_st_wr8_inst_c7;
wire filbuf_misbuf_ue_offmode_c8;
wire filbuf_misbuf_ce_offmode_c8;
wire partial_st_wr8_inst_c8;
wire filbuf_misbuf_ue_offmode_c9;
wire filbuf_misbuf_ce_offmode_c9;
wire ff_mb_corr_err_scanin;
wire ff_mb_corr_err_scanout;
wire ff_mb_uncorr_err_scanin;
wire ff_mb_uncorr_err_scanout;
wire [31:0] mb_nderr_in;
wire [31:0] mb_nderr;
wire ff_mb_nderr_in_scanin;
wire ff_mb_nderr_in_scanout;
wire ff_misbuf_corr_err_c2_scanin;
wire ff_misbuf_corr_err_c2_scanout;
wire ff_misbuf_uncorr_err_c2_scanin;
wire ff_misbuf_uncorr_err_c2_scanout;
wire ff_misbuf_nderr_unqual_c2_scanin;
wire ff_misbuf_nderr_unqual_c2_scanout;
wire misbuf_nderr_unqual_c2;
wire ff_mb_l2_ready_qual_scanin;
wire ff_mb_l2_ready_qual_scanout;
wire ff_mcu_pick_1_scanin;
wire ff_mcu_pick_1_scanout;
wire ff_mcu_pick_2_l_scanin;
wire ff_mcu_pick_2_l_scanout;
wire ff_mcu_state_scanin;
wire ff_mcu_state_scanout;
wire ff_mcu_state_quad0_scanin;
wire ff_mcu_state_quad0_scanout;
wire ff_mcu_state_quad1_scanin;
wire ff_mcu_state_quad1_scanout;
wire ff_mcu_state_quad2_scanin;
wire ff_mcu_state_quad2_scanout;
wire ff_mcu_state_quad3_scanin;
wire ff_mcu_state_quad3_scanout;
wire ff_mcu_state_quad4_scanin;
wire ff_mcu_state_quad4_scanout;
wire ff_mcu_state_quad5_scanin;
wire ff_mcu_state_quad5_scanout;
wire ff_mcu_state_quad6_scanin;
wire ff_mcu_state_quad6_scanout;
wire ff_mcu_state_quad7_scanin;
wire ff_mcu_state_quad7_scanout;
wire ff_l2_state_scanin;
wire ff_l2_state_scanout;
wire ff_l2_state_quad0_scanin;
wire ff_l2_state_quad0_scanout;
wire ff_l2_state_quad1_scanin;
wire ff_l2_state_quad1_scanout;
wire ff_l2_state_quad2_scanin;
wire ff_l2_state_quad2_scanout;
wire ff_l2_state_quad3_scanin;
wire ff_l2_state_quad3_scanout;
wire sel_l2_lshift_quad4;
wire sel_l2_same_quad4;
wire ff_l2_state_quad4_scanin;
wire ff_l2_state_quad4_scanout;
wire sel_l2_lshift_quad5;
wire sel_l2_same_quad5;
wire ff_l2_state_quad5_scanin;
wire ff_l2_state_quad5_scanout;
wire sel_l2_lshift_quad6;
wire sel_l2_same_quad6;
wire ff_l2_state_quad6_scanin;
wire ff_l2_state_quad6_scanout;
wire sel_l2_lshift_quad7;
wire sel_l2_same_quad7;
wire ff_l2_state_quad7_scanin;
wire ff_l2_state_quad7_scanout;
wire [3:0] pick_state_quad4;
wire [3:0] pick_state_quad5;
wire [3:0] pick_state_quad6;
wire [3:0] pick_state_quad7;
wire pick_s4;
wire pick_s5;
wire pick_s6;
wire pick_s7;
wire pick_s0_quad4;
wire pick_s1_quad4;
wire pick_s2_quad4;
wire pick_s3_quad4;
wire pick_s0_quad5;
wire pick_s1_quad5;
wire pick_s2_quad5;
wire pick_s3_quad5;
wire pick_s0_quad6;
wire pick_s1_quad6;
wire pick_s2_quad6;
wire pick_s3_quad6;
wire pick_s0_quad7;
wire pick_s1_quad7;
wire pick_s2_quad7;
wire pick_s3_quad7;
wire ff_picker_out_d1_scanin;
wire ff_picker_out_d1_scanout;
wire ff_picker_out_d2_scanin;
wire ff_picker_out_d2_scanout;
 

 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 
// from tag 
input	tag_miss_unqual_c2; // Miss not qualified with  inst vld or misbuf_hit_c2 
input   tag_store_inst_c3;  //BS and SR 11/07/03, store pipelining support
input	tag_hit_unqual_c2; 
input	tag_hit_c3 ; // from tag. 
input	[3:0]	tag_lru_way_c4; // encoded way from tag. 
 
input	tag_rdma_vld_px0_p; // used in misbuf for l2 pick logic. 
input	tag_misbuf_rdma_reg_vld_c2; // used by misbuf to insert instructions. 
input	tag_hit_not_comp_c3; // indicates that hit completion was gated off 
input	tag_alt_tag_miss_unqual_c3; // indicates a tag mismatch unqualled. 
input   tag_misbuf_int_ack_c3; // initiates a ack condition true in c3 
 
 
// from arb 
input   arb_pf_ice_inst_c2;  // BS 06/24/04 : Prefetch ICE in c2 stage 
input   arbdec_pf_ice_inst_c1;
input   arb_inst_vld_c2; // valid instruction in C2
input   arb_pf_ice_inst_c7;  // BS 06/24/04 : Prefetch ICE in c7 stage 
input	arb_decdp_ld_inst_c2; // BS and SR 11/07/03, store pipelining support 
input   arb_decdp_imiss_inst_c2; // BS and SR 11/07/03, store pipelining support
input   arb_decdp_swap_inst_c2; // BS and SR 11/07/03, store pipelining support
input	arb_arbdp_pst_with_ctrue_c2 ; // from arbdec. 
input	arb_arbdp_misbuf_pst_no_ctrue_c2 ; // from arbdec. includes LDSTUB/SWAPs pin on TOP 
input	arb_decdp_cas2_inst_c2; // from arbdec. 
input	arbdec_arbdp_inst_mb_c2; 
input	arb_decdp_pst_inst_c2; 
input	arb_decdp_cas1_inst_c2; 
input	[4:0]	arbdec_arbdp_inst_mb_entry_c1; // BS & SR 11/04/03, MB grows to 32 
input	arb_arbdp_tecc_inst_mb_c8; // indicates a tecc instruction from mbf 
 
input	arbdec_arbdp_rdma_inst_c1; // POST_3.0 pin replaces arbdec_arbdp_rdma_inst_c2 
input	arb_decdp_ld64_inst_c2; // this signal indicates an rdma rd. 
input	arb_decdp_wr64_inst_c2; 
input	arb_decdp_bis_inst_c3; // NEW_PIN from arbdec. indicating a Block INIT store. 
input   arbdec_arbdp_inst_bufidhi_c8; // NEW_PIN from arbdec
input	arb_decdp_wr8_inst_c2;
 
// from arb 
input	arb_csr_st_c2; 
input	arb_evict_vld_c2 ; // from arb. 
input	arb_misbuf_inst_vld_c2; 
input	arb_pst_ctrue_en_c8; // from arb. PST ctrue only. 
input	arb_misbuf_hit_off_c1; // frm arb used to turn off hits. 
input	arb_evict_tecc_vld_c2; // POST_2.0 pin. 
input	arbdec_arbdp_inst_dep_c2 ; // POST_2.0 pin. 

input	arb_vuad_ce_err_c2; // vuad ecc change
input	usaloc_ua_ce_c2;	// used alloc CE
input	vlddir_vd_ce_c2;	// valid dirty CE

output	misbuf_vuad_ce_err_c6; // vuad ecc change
output	misbuf_vuad_ce_instr_c2; // vuad ecc change
output  misbuf_vuad_ce_instr_ack_c2; // vuad ecc change

input	arb_decdp_cas2_from_mb_c2;
 
// input	arb_addr_c1eqc2_c1 ; // from arb ( 32b address compare ) OLD_PIN 
// input	arb_addr_c1eqc3_c1 ; // from arb ( 32b address compare ) OLD_PIN 
 
input	arbadr_arbdp_addr_c1c2comp_c1; // NEW_PIN 
input	arbadr_arbdp_addr_c1c3comp_c1; // NEW_PIN 
input	arbadr_idx_c1c2comp_c1; // NEW_PIN 
input	arbadr_idx_c1c3comp_c1; // NEW_PIN 
 
input	arb_misbuf_cas1_hit_c8;// CAS1 hit. 
input	arb_misbuf_ctrue_c9 ; // compare result for CAS1 
input	arb_misbuf_mbsel_c1; 
 
// from mbtag 
input	[31:0]	mb_cam_match ; // from mbtag. BS & SR 11/04/03, MB grows to 32 
input	[31:0]	mb_cam_match_idx ; // NEW_PIN replacing mb_cam_match14 BS & SR 11/04/03, MB grows to 32 
 
// from decc 
input	deccck_uncorr_err_c8 ; // UE ecc result for CAS1 
//input   deccck_corr_err_c8; // CE ecc result on CAS1
input   deccck_notdata_err_c8; // Notdata on CAS1
input	deccck_spcd_corr_err_c8; 
input	deccck_spcfb_corr_err_c8 ;  
 
// from filbuf. 
input	filbuf_misbuf_match_c2 ; // from filbuf. 
input	filbuf_misbuf_stinst_match_c2 ; // NEW_PIN  
input	filbuf_misbuf_entry_avail; // from filbuf. 
input	filbuf_fbf_ready_miss_r1; // miss ready  
input	[4:0]	filbuf_fbf_enc_ld_mbid_r1 ; // miss entry BS & SR 11/04/03, MB grows to 32 
input	filbuf_fbf_st_or_dep_rdy_c4;// st or dep rdy enable 
input	[4:0] filbuf_fbf_enc_dep_mbid_c4; // st or dep entry mbid BS & SR 11/04/03, MB grows to 32 
input	filbuf_fb_count_eq_0; // from filbuf. 
input	[2:0]	filbuf_misbuf_fbid_d2 ; // inserting fbid  
input		filbuf_misbuf_nofill_d2;// for no fills. 
input          filbuf_misbuf_ue_offmode_c7;
input          filbuf_misbuf_ce_offmode_c7;

 
// wbuf 
input	wbuf_hit_unqual_c2 ; // from wbuf. 
input	wbuf_misbuf_dep_rdy_en ; // rdy wbb dependents 
input	[4:0]	wbuf_misbuf_dep_mbid; // wbb dependent mbid. BS & SR 11/04/03, MB grows to 32 
 
// rdmat. 
input	rdmat_hit_unqual_c2; // from rdmat 
input	[4:0]	rdmat_misbuf_dep_mbid; // from rdmat BS & SR 11/04/03, MB grows to 32 
input	rdmat_misbuf_dep_rdy_en; 
 
 
input	tag_misbuf_par_err_c3 ; // parity err from tagd. 
 
// mcu interface 
input	mcu_l2t_rd_ack; 
 
// from csr 
input	csr_l2_bypass_mode_on; 
input	csr_l2_dir_map_on; // NEW_PIN 
 
 
 
 
input	l2clk; 
input	wmr_l; 
input scan_in;
 
input	arb_tecc_c2; // POST_3.0 PIN 
 
output scan_out; 
 
 
// to arb 
output          misbuf_hit_st_dep_zero; // BS and SR 11/07/03, store pipelining support
output		misbuf_arb_cnt28_px2_prev ; 
output		misbuf_arb_snp_cnt8_px1; 
output		misbuf_arb_vld_px1 ;  
output		misbuf_nondep_fbhit_c3; // to arb for dir CAM input generation. 

// to iqu
//output		mb_valid_stall_pfice_c3;
 
// to tagd 
output	misbuf_hit_c3; // POST_2.0 pin 

output	misbuf_arb_hit_c3; // int 5.0 changes
input	arb_misbuf_inval_inst_c2; // int 5.0 changes

output  filbuf_match_c3;        // bg fix 84674
 
// to arbaddr and arbdec. 
output	misbuf_arbdp_ctrue_px2; // instruction CTRUE bit. 
output	misbuf_arb_l2rd_en; // rd flop en to arbaddr and arbdec. 
output	misbuf_arb_mcurd_en; // rd flop en to arbaddr and arbdec 
 
// to tag. 
output	misbuf_tag_hit_unqual_c2; 
output	misbuf_corr_err_c2;
output  misbuf_uncorr_err_c2;
output	misbuf_notdata_err_c2;
output	misbuf_wr64_miss_comp_c3; // to tag for setting rdma reg vld. 
 
// to wbuf. 
output	[4:0]	misbuf_wbuf_mbid_c4; // write mbid to RDY in WBB after write to DRAM. 
                                     // BS & SR 11/04/03, MB grows to 32
 
// to filbuf. 
output	[4:0]	misbuf_mbf_insert_mbid_c4; // BS & SR 11/04/03, MB grows to 32 
output		misbuf_mbf_insert_c4; 
output 		misbuf_hit_c4; 
output		misbuf_mbf_delete_c4; 
output		misbuf_filbuf_next_vld_c4; 
output	[4:0]	misbuf_filbuf_next_link_c4; // BS & SR 11/04/03, MB grows to 32 
output		misbuf_filbuf_mcu_pick ; 
 
output	[2:0]	misbuf_filbuf_fbid; 
output	[3:0]	misbuf_filbuf_way ; 
output		misbuf_filbuf_way_fbid_vld ; 


input		filbuf_tag_hit_frm_mb_c2;
 
// to mbtag  
output		misbuf_mbtag_wr_en_c2 ;// output to mbtag only 
output	[31:0]	misbuf_mb_write_wl ; // output to mbtag , BS & SR 11/04/03,MB grows to 32   
output		misbuf_buf_rd_en; // output to mbtag and mbdata  
output	[31:0]	misbuf_mb_read_wl ; // output to mbtag and mbdata. , MB grows to 32 
 
// to mbdata. 
output		misbuf_dep_c8; // to mbdata. 
output	[31:0]	misbuf_mb_data_write_wl; // to mbdata , BS & SR 11/04/03, MB grows to 32 
output		misbuf_evict_c8; // to mbdata 
output		misbuf_tecc_c8 ; // to mbdata 
output	[4:0]	misbuf_mbentry_c8 ; // to mbdata , BS & SR 11/04/03, MB grows to 32 
output		misbuf_mbdata_wr_en_c8  ; 
 
output	misbuf_notdata_err_c1;
output	misbuf_uncorr_err_c1;
// to BTU 
output	l2t_mcu_rd_req ; 
output	l2t_mcu_rd_dummy_req; 

// to l2t_csreg_ctl, l2t_filbuf_ctl

input		l2t_mb2_mbdata_wr_en;
input		l2t_mb2_run;
input		l2t_mb2_mbdata_rd_en;
input		l2t_mb2_mbtag_rd_en;
input		l2t_mb2_mbtag_wr_en;
input	[4:0]	l2t_mb2_addr;
output		mb_mbist_cam_hit;
input		mbtag_mbist_cam_sel;

output  misbuf_vuad_ce_err_c8;
 
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign stop = 1'b0;
assign se = tcu_scan_en;

l2t_misbuf_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk(l2clk),
        .l1en(1'b1 ),
        .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

//////////////////////////////////////////
// Spare gate insertion
//////////////////////////////////////////
//spare_ctl_macro spares (num=15) (
//        .scan_in(spares_scanin),
//        .scan_out(spares_scanout),
//        .l1clk  (l1clk)
//);

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
wire si_4;
wire so_4;
wire spare4_flop_unused;
wire spare4_buf_32x_unused;
wire spare4_nand3_8x_unused;
wire spare4_inv_8x_unused;
wire spare4_aoi22_4x_unused;
wire spare4_buf_8x_unused;
wire spare4_oai22_4x_unused;
wire spare4_inv_16x_unused;
wire spare4_nand2_16x_unused;
wire spare4_nor3_4x_unused;
wire spare4_nand2_8x_unused;
wire spare4_buf_16x_unused;
wire spare4_nor2_16x_unused;
wire spare4_inv_32x_unused;
wire si_5;
wire so_5;
wire spare5_flop_unused;
wire spare5_buf_32x_unused;
wire spare5_nand3_8x_unused;
wire spare5_inv_8x_unused;
wire spare5_aoi22_4x_unused;
wire spare5_buf_8x_unused;
wire spare5_oai22_4x_unused;
wire spare5_inv_16x_unused;
wire spare5_nand2_16x_unused;
wire spare5_nor3_4x_unused;
wire spare5_nand2_8x_unused;
wire spare5_buf_16x_unused;
wire spare5_nor2_16x_unused;
wire spare5_inv_32x_unused;
wire si_6;
wire so_6;
wire spare6_flop_unused;
wire spare6_buf_32x_unused;
wire spare6_nand3_8x_unused;
wire spare6_inv_8x_unused;
wire spare6_aoi22_4x_unused;
wire spare6_buf_8x_unused;
wire spare6_oai22_4x_unused;
wire spare6_inv_16x_unused;
wire spare6_nand2_16x_unused;
wire spare6_nor3_4x_unused;
wire spare6_nand2_8x_unused;
wire spare6_buf_16x_unused;
wire spare6_nor2_16x_unused;
wire spare6_inv_32x_unused;
wire si_7;
wire so_7;
wire spare7_buf_32x_unused;
wire spare7_nand3_8x_unused;
wire spare7_inv_8x_unused;
wire spare7_aoi22_4x_unused;
wire spare7_buf_8x_unused;
wire spare7_oai22_4x_unused;
wire spare7_inv_16x_unused;
wire spare7_nand2_16x_unused;
wire spare7_nor3_4x_unused;
wire spare7_nand2_8x_unused;
wire spare7_buf_16x_unused;
wire spare7_nor2_16x_unused;
wire spare7_inv_32x_unused;
wire si_8;
wire so_8;
wire spare8_flop_unused;
wire spare8_buf_32x_unused;
wire spare8_nand3_8x_unused;
wire spare8_inv_8x_unused;
wire spare8_aoi22_4x_unused;
wire spare8_buf_8x_unused;
wire spare8_oai22_4x_unused;
wire spare8_inv_16x_unused;
wire spare8_nand2_16x_unused;
wire spare8_nor3_4x_unused;
wire spare8_nand2_8x_unused;
wire spare8_buf_16x_unused;
wire spare8_nor2_16x_unused;
wire spare8_inv_32x_unused;
wire si_9;
wire so_9;
wire spare9_flop_unused;
wire spare9_buf_32x_unused;
wire spare9_nand3_8x_unused;
wire spare9_inv_8x_unused;
wire spare9_aoi22_4x_unused;
wire spare9_buf_8x_unused;
wire spare9_oai22_4x_unused;
wire spare9_inv_16x_unused;
wire spare9_nand2_16x_unused;
wire spare9_nor3_4x_unused;
wire spare9_nand2_8x_unused;
wire spare9_buf_16x_unused;
wire spare9_nor2_16x_unused;
wire spare9_inv_32x_unused;
wire si_10;
wire so_10;
wire spare10_flop_unused;
wire spare10_buf_32x_unused;
wire spare10_nand3_8x_unused;
wire spare10_inv_8x_unused;
wire spare10_aoi22_4x_unused;
wire spare10_buf_8x_unused;
wire spare10_oai22_4x_unused;
wire spare10_inv_16x_unused;
wire spare10_nand2_16x_unused;
wire spare10_nor3_4x_unused;
wire spare10_nand2_8x_unused;
wire spare10_buf_16x_unused;
wire spare10_nor2_16x_unused;
wire spare10_inv_32x_unused;
wire si_11;
wire so_11;
wire spare11_flop_unused;
wire spare11_buf_32x_unused;
wire spare11_nand3_8x_unused;
wire spare11_inv_8x_unused;
wire spare11_aoi22_4x_unused;
wire spare11_buf_8x_unused;
wire spare11_oai22_4x_unused;
wire spare11_inv_16x_unused;
wire spare11_nand2_16x_unused;
wire spare11_nor3_4x_unused;
wire spare11_nand2_8x_unused;
wire spare11_buf_16x_unused;
wire spare11_nor2_16x_unused;
wire spare11_inv_32x_unused;
wire si_12;
wire so_12;
wire spare12_flop_unused;
wire spare12_buf_32x_unused;
wire spare12_nand3_8x_unused;
wire spare12_inv_8x_unused;
wire spare12_aoi22_4x_unused;
wire spare12_buf_8x_unused;
wire spare12_oai22_4x_unused;
wire spare12_inv_16x_unused;
wire spare12_nand2_16x_unused;
wire spare12_nor3_4x_unused;
wire spare12_nand2_8x_unused;
wire spare12_buf_16x_unused;
wire spare12_nor2_16x_unused;
wire spare12_inv_32x_unused;
wire si_13;
wire so_13;
wire spare13_flop_unused;
wire spare13_buf_32x_unused;
wire spare13_nand3_8x_unused;
wire spare13_inv_8x_unused;
wire spare13_aoi22_4x_unused;
wire spare13_buf_8x_unused;
wire spare13_oai22_4x_unused;
wire spare13_inv_16x_unused;
wire spare13_nand2_16x_unused;
wire spare13_nor3_4x_unused;
wire spare13_nand2_8x_unused;
wire spare13_buf_16x_unused;
wire spare13_nor2_16x_unused;
wire spare13_inv_32x_unused;
wire si_14;
wire so_14;
wire spare14_flop_unused;
wire spare14_buf_32x_unused;
wire spare14_nand3_8x_unused;
wire spare14_inv_8x_unused;
wire spare14_aoi22_4x_unused;
wire spare14_buf_8x_unused;
wire spare14_oai22_4x_unused;
wire spare14_inv_16x_unused;
wire spare14_nand2_16x_unused;
wire spare14_nor3_4x_unused;
wire spare14_nand2_8x_unused;
wire spare14_buf_16x_unused;
wire spare14_nor2_16x_unused;
wire spare14_inv_32x_unused;

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

cl_sc1_msff_8x spare4_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_4),
                               .so(so_4),
                               .d(1'b0),
                               .q(spare4_flop_unused));
assign si_4 = so_3;

cl_u1_buf_32x   spare4_buf_32x (.in(1'b1),
                                   .out(spare4_buf_32x_unused));
cl_u1_nand3_8x spare4_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare4_nand3_8x_unused));
cl_u1_inv_8x    spare4_inv_8x (.in(1'b1),
                                  .out(spare4_inv_8x_unused));
cl_u1_aoi22_4x spare4_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_aoi22_4x_unused));
cl_u1_buf_8x    spare4_buf_8x (.in(1'b1),
                                  .out(spare4_buf_8x_unused));
cl_u1_oai22_4x spare4_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_oai22_4x_unused));
cl_u1_inv_16x   spare4_inv_16x (.in(1'b1),
                                   .out(spare4_inv_16x_unused));
cl_u1_nand2_16x spare4_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare4_nand2_16x_unused));
cl_u1_nor3_4x spare4_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare4_nor3_4x_unused));
cl_u1_nand2_8x spare4_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare4_nand2_8x_unused));
cl_u1_buf_16x   spare4_buf_16x (.in(1'b1),
                                   .out(spare4_buf_16x_unused));
cl_u1_nor2_16x spare4_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare4_nor2_16x_unused));
cl_u1_inv_32x   spare4_inv_32x (.in(1'b1),
                                   .out(spare4_inv_32x_unused));

cl_sc1_msff_8x spare5_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_5),
                               .so(so_5),
                               .d(1'b0),
                               .q(spare5_flop_unused));
assign si_5 = so_4;

cl_u1_buf_32x   spare5_buf_32x (.in(1'b1),
                                   .out(spare5_buf_32x_unused));
cl_u1_nand3_8x spare5_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare5_nand3_8x_unused));
cl_u1_inv_8x    spare5_inv_8x (.in(1'b1),
                                  .out(spare5_inv_8x_unused));
cl_u1_aoi22_4x spare5_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_aoi22_4x_unused));
cl_u1_buf_8x    spare5_buf_8x (.in(1'b1),
                                  .out(spare5_buf_8x_unused));
cl_u1_oai22_4x spare5_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_oai22_4x_unused));
cl_u1_inv_16x   spare5_inv_16x (.in(1'b1),
                                   .out(spare5_inv_16x_unused));
cl_u1_nand2_16x spare5_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare5_nand2_16x_unused));
cl_u1_nor3_4x spare5_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare5_nor3_4x_unused));
cl_u1_nand2_8x spare5_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare5_nand2_8x_unused));
cl_u1_buf_16x   spare5_buf_16x (.in(1'b1),
                                   .out(spare5_buf_16x_unused));
cl_u1_nor2_16x spare5_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare5_nor2_16x_unused));
cl_u1_inv_32x   spare5_inv_32x (.in(1'b1),
                                   .out(spare5_inv_32x_unused));

cl_sc1_msff_8x spare6_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_6),
                               .so(so_6),
                               .d(1'b0),
                               .q(spare6_flop_unused));
assign si_6 = so_5;

cl_u1_buf_32x   spare6_buf_32x (.in(1'b1),
                                   .out(spare6_buf_32x_unused));
cl_u1_nand3_8x spare6_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare6_nand3_8x_unused));
cl_u1_inv_8x    spare6_inv_8x (.in(1'b1),
                                  .out(spare6_inv_8x_unused));
cl_u1_aoi22_4x spare6_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_aoi22_4x_unused));
cl_u1_buf_8x    spare6_buf_8x (.in(1'b1),
                                  .out(spare6_buf_8x_unused));
cl_u1_oai22_4x spare6_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_oai22_4x_unused));
cl_u1_inv_16x   spare6_inv_16x (.in(1'b1),
                                   .out(spare6_inv_16x_unused));
cl_u1_nand2_16x spare6_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare6_nand2_16x_unused));
cl_u1_nor3_4x spare6_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare6_nor3_4x_unused));
cl_u1_nand2_8x spare6_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare6_nand2_8x_unused));
cl_u1_buf_16x   spare6_buf_16x (.in(1'b1),
                                   .out(spare6_buf_16x_unused));
cl_u1_nor2_16x spare6_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare6_nor2_16x_unused));
cl_u1_inv_32x   spare6_inv_32x (.in(1'b1),
                                   .out(spare6_inv_32x_unused));

cl_sc1_msff_8x spare7_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_7),
                               .so(so_7),
                               .d(vuad_err_true_c2),
                               .q(vuad_err_true_c3));
assign si_7 = so_6;

cl_u1_buf_32x   spare7_buf_32x (.in(1'b1),
                                   .out(spare7_buf_32x_unused));
cl_u1_nand3_8x spare7_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare7_nand3_8x_unused));
cl_u1_inv_8x    spare7_inv_8x (.in(1'b1),
                                  .out(spare7_inv_8x_unused));
cl_u1_aoi22_4x spare7_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_aoi22_4x_unused));
cl_u1_buf_8x    spare7_buf_8x (.in(1'b1),
                                  .out(spare7_buf_8x_unused));
cl_u1_oai22_4x spare7_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_oai22_4x_unused));
cl_u1_inv_16x   spare7_inv_16x (.in(1'b1),
                                   .out(spare7_inv_16x_unused));
cl_u1_nand2_16x spare7_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare7_nand2_16x_unused));
cl_u1_nor3_4x spare7_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare7_nor3_4x_unused));
cl_u1_nand2_8x spare7_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare7_nand2_8x_unused));
cl_u1_buf_16x   spare7_buf_16x (.in(1'b1),
                                   .out(spare7_buf_16x_unused));
cl_u1_nor2_16x spare7_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare7_nor2_16x_unused));
cl_u1_inv_32x   spare7_inv_32x (.in(1'b1),
                                   .out(spare7_inv_32x_unused));

cl_sc1_msff_8x spare8_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_8),
                               .so(so_8),
                               .d(1'b0),
                               .q(spare8_flop_unused));
assign si_8 = so_7;

cl_u1_buf_32x   spare8_buf_32x (.in(1'b1),
                                   .out(spare8_buf_32x_unused));
cl_u1_nand3_8x spare8_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare8_nand3_8x_unused));
cl_u1_inv_8x    spare8_inv_8x (.in(1'b1),
                                  .out(spare8_inv_8x_unused));
cl_u1_aoi22_4x spare8_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_aoi22_4x_unused));
cl_u1_buf_8x    spare8_buf_8x (.in(1'b1),
                                  .out(spare8_buf_8x_unused));
cl_u1_oai22_4x spare8_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_oai22_4x_unused));
cl_u1_inv_16x   spare8_inv_16x (.in(1'b1),
                                   .out(spare8_inv_16x_unused));
cl_u1_nand2_16x spare8_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare8_nand2_16x_unused));
cl_u1_nor3_4x spare8_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare8_nor3_4x_unused));
cl_u1_nand2_8x spare8_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare8_nand2_8x_unused));
cl_u1_buf_16x   spare8_buf_16x (.in(1'b1),
                                   .out(spare8_buf_16x_unused));
cl_u1_nor2_16x spare8_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare8_nor2_16x_unused));
cl_u1_inv_32x   spare8_inv_32x (.in(1'b1),
                                   .out(spare8_inv_32x_unused));

cl_sc1_msff_8x spare9_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_9),
                               .so(so_9),
                               .d(1'b0),
                               .q(spare9_flop_unused));
assign si_9 = so_8;

cl_u1_buf_32x   spare9_buf_32x (.in(1'b1),
                                   .out(spare9_buf_32x_unused));
cl_u1_nand3_8x spare9_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare9_nand3_8x_unused));
cl_u1_inv_8x    spare9_inv_8x (.in(1'b1),
                                  .out(spare9_inv_8x_unused));
cl_u1_aoi22_4x spare9_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_aoi22_4x_unused));
cl_u1_buf_8x    spare9_buf_8x (.in(1'b1),
                                  .out(spare9_buf_8x_unused));
cl_u1_oai22_4x spare9_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_oai22_4x_unused));
cl_u1_inv_16x   spare9_inv_16x (.in(1'b1),
                                   .out(spare9_inv_16x_unused));
cl_u1_nand2_16x spare9_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare9_nand2_16x_unused));
cl_u1_nor3_4x spare9_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare9_nor3_4x_unused));
cl_u1_nand2_8x spare9_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare9_nand2_8x_unused));
cl_u1_buf_16x   spare9_buf_16x (.in(1'b1),
                                   .out(spare9_buf_16x_unused));
cl_u1_nor2_16x spare9_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare9_nor2_16x_unused));
cl_u1_inv_32x   spare9_inv_32x (.in(1'b1),
                                   .out(spare9_inv_32x_unused));

cl_sc1_msff_8x spare10_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_10),
                               .so(so_10),
                               .d(1'b0),
                               .q(spare10_flop_unused));
assign si_10 = so_9;

cl_u1_buf_32x   spare10_buf_32x (.in(1'b1),
                                   .out(spare10_buf_32x_unused));
cl_u1_nand3_8x spare10_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare10_nand3_8x_unused));
cl_u1_inv_8x    spare10_inv_8x (.in(1'b1),
                                  .out(spare10_inv_8x_unused));
cl_u1_aoi22_4x spare10_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_aoi22_4x_unused));
cl_u1_buf_8x    spare10_buf_8x (.in(1'b1),
                                  .out(spare10_buf_8x_unused));
cl_u1_oai22_4x spare10_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_oai22_4x_unused));
cl_u1_inv_16x   spare10_inv_16x (.in(1'b1),
                                   .out(spare10_inv_16x_unused));
cl_u1_nand2_16x spare10_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare10_nand2_16x_unused));
cl_u1_nor3_4x spare10_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare10_nor3_4x_unused));
cl_u1_nand2_8x spare10_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare10_nand2_8x_unused));
cl_u1_buf_16x   spare10_buf_16x (.in(1'b1),
                                   .out(spare10_buf_16x_unused));
cl_u1_nor2_16x spare10_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare10_nor2_16x_unused));
cl_u1_inv_32x   spare10_inv_32x (.in(1'b1),
                                   .out(spare10_inv_32x_unused));

cl_sc1_msff_8x spare11_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_11),
                               .so(so_11),
                               .d(1'b0),
                               .q(spare11_flop_unused));
assign si_11 = so_10;

cl_u1_buf_32x   spare11_buf_32x (.in(1'b1),
                                   .out(spare11_buf_32x_unused));
cl_u1_nand3_8x spare11_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare11_nand3_8x_unused));
cl_u1_inv_8x    spare11_inv_8x (.in(1'b1),
                                  .out(spare11_inv_8x_unused));
cl_u1_aoi22_4x spare11_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare11_aoi22_4x_unused));
cl_u1_buf_8x    spare11_buf_8x (.in(1'b1),
                                  .out(spare11_buf_8x_unused));
cl_u1_oai22_4x spare11_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare11_oai22_4x_unused));
cl_u1_inv_16x   spare11_inv_16x (.in(1'b1),
                                   .out(spare11_inv_16x_unused));
cl_u1_nand2_16x spare11_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare11_nand2_16x_unused));
cl_u1_nor3_4x spare11_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare11_nor3_4x_unused));
cl_u1_nand2_8x spare11_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare11_nand2_8x_unused));
cl_u1_buf_16x   spare11_buf_16x (.in(1'b1),
                                   .out(spare11_buf_16x_unused));
cl_u1_nor2_16x spare11_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare11_nor2_16x_unused));
cl_u1_inv_32x   spare11_inv_32x (.in(1'b1),
                                   .out(spare11_inv_32x_unused));

cl_sc1_msff_8x spare12_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_12),
                               .so(so_12),
                               .d(1'b0),
                               .q(spare12_flop_unused));
assign si_12 = so_11;

cl_u1_buf_32x   spare12_buf_32x (.in(1'b1),
                                   .out(spare12_buf_32x_unused));
cl_u1_nand3_8x spare12_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare12_nand3_8x_unused));
cl_u1_inv_8x    spare12_inv_8x (.in(1'b1),
                                  .out(spare12_inv_8x_unused));
cl_u1_aoi22_4x spare12_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare12_aoi22_4x_unused));
cl_u1_buf_8x    spare12_buf_8x (.in(1'b1),
                                  .out(spare12_buf_8x_unused));
cl_u1_oai22_4x spare12_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare12_oai22_4x_unused));
cl_u1_inv_16x   spare12_inv_16x (.in(1'b1),
                                   .out(spare12_inv_16x_unused));
cl_u1_nand2_16x spare12_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare12_nand2_16x_unused));
cl_u1_nor3_4x spare12_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare12_nor3_4x_unused));
cl_u1_nand2_8x spare12_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare12_nand2_8x_unused));
cl_u1_buf_16x   spare12_buf_16x (.in(1'b1),
                                   .out(spare12_buf_16x_unused));
cl_u1_nor2_16x spare12_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare12_nor2_16x_unused));
cl_u1_inv_32x   spare12_inv_32x (.in(1'b1),
                                   .out(spare12_inv_32x_unused));

cl_sc1_msff_8x spare13_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_13),
                               .so(so_13),
                               .d(1'b0),
                               .q(spare13_flop_unused));
assign si_13 = so_12;

cl_u1_buf_32x   spare13_buf_32x (.in(1'b1),
                                   .out(spare13_buf_32x_unused));
cl_u1_nand3_8x spare13_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare13_nand3_8x_unused));
cl_u1_inv_8x    spare13_inv_8x (.in(1'b1),
                                  .out(spare13_inv_8x_unused));
cl_u1_aoi22_4x spare13_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare13_aoi22_4x_unused));
cl_u1_buf_8x    spare13_buf_8x (.in(1'b1),
                                  .out(spare13_buf_8x_unused));
cl_u1_oai22_4x spare13_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare13_oai22_4x_unused));
cl_u1_inv_16x   spare13_inv_16x (.in(1'b1),
                                   .out(spare13_inv_16x_unused));
cl_u1_nand2_16x spare13_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare13_nand2_16x_unused));
cl_u1_nor3_4x spare13_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare13_nor3_4x_unused));
cl_u1_nand2_8x spare13_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare13_nand2_8x_unused));
cl_u1_buf_16x   spare13_buf_16x (.in(1'b1),
                                   .out(spare13_buf_16x_unused));
cl_u1_nor2_16x spare13_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare13_nor2_16x_unused));
cl_u1_inv_32x   spare13_inv_32x (.in(1'b1),
                                   .out(spare13_inv_32x_unused));

cl_sc1_msff_8x spare14_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_14),
                               .so(so_14),
                               .d(1'b0),
                               .q(spare14_flop_unused));
assign si_14 = so_13;

cl_u1_buf_32x   spare14_buf_32x (.in(1'b1),
                                   .out(spare14_buf_32x_unused));
cl_u1_nand3_8x spare14_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare14_nand3_8x_unused));
cl_u1_inv_8x    spare14_inv_8x (.in(1'b1),
                                  .out(spare14_inv_8x_unused));
cl_u1_aoi22_4x spare14_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare14_aoi22_4x_unused));
cl_u1_buf_8x    spare14_buf_8x (.in(1'b1),
                                  .out(spare14_buf_8x_unused));
cl_u1_oai22_4x spare14_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare14_oai22_4x_unused));
cl_u1_inv_16x   spare14_inv_16x (.in(1'b1),
                                   .out(spare14_inv_16x_unused));
cl_u1_nand2_16x spare14_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare14_nand2_16x_unused));
cl_u1_nor3_4x spare14_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare14_nor3_4x_unused));
cl_u1_nand2_8x spare14_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare14_nand2_8x_unused));
cl_u1_buf_16x   spare14_buf_16x (.in(1'b1),
                                   .out(spare14_buf_16x_unused));
cl_u1_nor2_16x spare14_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare14_nor2_16x_unused));
cl_u1_inv_32x   spare14_inv_32x (.in(1'b1),
                                   .out(spare14_inv_32x_unused));
assign spares_scanout = so_14;

assign dbginit_l = 1'b1;

wire [31:0] cas_ctrue_set_preerror_c9; 
wire [31:0] clr_mb_l2_rdy_pfice;
wire [31:0] vuad_ack_pending, vuad_ce_replay;

wire    set_dep_ldifetch_miss_c2; // BS and SR 11/07/03, store pipelining support 
wire    set_dep_ldifetch_miss_c3; // BS and SR 11/07/03, store pipelining support
wire    mb_hit_dep_one;  // BS and SR 11/07/03, store pipelining support
wire    [31:0] mb_dep_prev; // BS and SR 11/07/03, store pipelining support
wire    [31:0] mb_dep; // BS and SR 11/07/03, store pipelining support
wire    misbuf_hit_st_dep_zero; // BS and SR 11/07/03, store pipelining support
wire	mbf_insert_c2;  
wire	mbf_delete_miss_c2; 
wire	mbf_delete_c2, mbf_delete_c3; 
wire	[31:0]	reset_valid_bit_c3; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	mb_write_ptr_c2, mb_write_ptr_c3 ; // BS & SR 11/04/03, MB grows to 32 
wire	[4:0]	mb_entry_c3;// BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	dec_mb_entry_c3; // BS & SR 11/04/03, MB grows to 32 
 
wire    [5:0]   mb_count_prev; // BS & SR 11/04/03, MB grows to 32 
wire    [5:0]   mb_count_c4; // Actual count. // BS & SR 11/04/03, MB grows to 32 
wire    [5:0]   mb_count_plus1; // BS & SR 11/04/03, MB grows to 32 
wire    [5:0]   mb_count_minus1; // BS & SR 11/04/03, MB grows to 32 
wire		cnt_reset, mb_count_en ; 
wire	[31:0]	mb_tag_wr_wl_c3; // BS & SR 11/04/03, MB grows to 32 
 
wire	[4:0]	inst_mb_entry_c2; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0] cam_hit_vec_c1 ; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0] hit_off_bypass_vec_c1 ; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0] hit_on_bypass_vec_c1 ; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0] tmp_cam_hit_vec_c1, tmp_cam_hit_vec_c2 ;// BS & SR 11/04/03, MB grows to 32 
wire	tmp_cam_hit_c2; 
wire		misbuf_hit_c2; 
wire	[31:0]	misbuf_hit_vec_c2, misbuf_hit_vec_c3; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	dec_mb_entry_c2; // BS & SR 11/04/03, MB grows to 32 
 
wire	inst_mb_c3; 
wire	mb_inst_vld_c3; 
wire	mb_rewrite_en_c3; 
wire	mbdata_wr_en_c3, mbdata_wr_en_c4; 
wire	mbdata_wr_en_c5, mbdata_wr_en_c52, mbdata_wr_en_c6; // BS 03/11/04 extra cycle for mem access 
wire	mbdata_wr_en_c7  ; 
 
wire	[4:0]	enc_tag_wr_wl_c2, enc_tag_wr_wl_c3; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	insert_ptr_c8 ; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	mb_data_wr_wl_c8 ; // BS & SR 11/04/03, MB grows to 32 
 
wire	[4:0]	enc_data_wr_wl_c4, enc_data_wr_wl_c5; // BS & SR 11/04/03, MB grows to 32 
wire    [4:0]   enc_data_wr_wl_c52; // BS 03/11/04 extra cycle for mem access
wire	[4:0]	enc_data_wr_wl_c6, enc_data_wr_wl_c7; // BS & SR 11/04/03, MB grows to 32 
wire	[4:0]	enc_data_wr_wl_c8 ; // BS & SR 11/04/03, MB grows to 32 
 
// Control Bits. 
wire	[31:0]	mb_valid_prev, mb_valid; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	mb_bis_prev, mb_bis; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	mb_rdma_prev, mb_rdma; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	mb_young_prev, mb_young ; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	mb_ctrue_prev, mb_ctrue ; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	mb_mcu_ready, mb_mcu_ready_in; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	mb_evict_ready, mb_evict_ready_in ; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	mb_tecc_ready, mb_tecc_ready_in ; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	mb_data_vld_in, mb_data_vld; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	mb_l2_ready_in, mb_l2_ready; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	mb_way_vld_in , mb_way_vld ; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	mb_fbid_vld_in , mb_fbid_vld ; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	mb_corr_err_in, mb_corr_err ; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	mb_uncorr_err_in, mb_uncorr_err ; // BS & SR 11/04/03, MB grows to 32 
 
wire	[3:0]	way0, way1, way2, way3 ; 
wire	[3:0]	way4, way5, way6, way7 ; 
wire	[3:0]	way8, way9, way10, way11 ; 
wire	[3:0]	way12, way13, way14, way15 ; 
wire	[3:0]	way16, way17, way18, way19; 
wire	[3:0]	way20, way21, way23 , way22 ; 
wire	[3:0]	way24, way25, way26 , way27 ; 
wire	[3:0]	way28, way29, way30 , way31 ; 



wire	[4:0]	next_link_entry0, next_link_entry1, next_link_entry2, next_link_entry3; 
// BS & SR 11/04/03, MB grows to 32
wire	[4:0]	next_link_entry4, next_link_entry5, next_link_entry6, next_link_entry7; 
// BS & SR 11/04/03, MB grows to 32
wire	[4:0]	next_link_entry8, next_link_entry9, next_link_entry10, next_link_entry11; 
// BS & SR 11/04/03, MB grows to 32
wire	[4:0]	next_link_entry12, next_link_entry13, next_link_entry14, next_link_entry15; 
wire	[4:0]	next_link_entry16, next_link_entry17, next_link_entry18, next_link_entry19; 
wire	[4:0]	next_link_entry20, next_link_entry21, next_link_entry22, next_link_entry23; 
wire	[4:0]	next_link_entry24, next_link_entry25, next_link_entry26, next_link_entry27; 
wire	[4:0]	next_link_entry28, next_link_entry29, next_link_entry30, next_link_entry31; 
// BS & SR 11/04/03, MB grows to 32
wire	[2:0]	fbid0, fbid1, fbid2, fbid3 ; 
wire	[2:0]	fbid4, fbid5, fbid6, fbid7 ; 
wire	[2:0]	fbid8, fbid9, fbid10, fbid11 ; 
wire	[2:0]	fbid12, fbid13, fbid14, fbid15 ; 
wire	[2:0]	fbid16, fbid17, fbid18, fbid19 ; 
wire	[2:0]	fbid20, fbid21, fbid22, fbid23 ; 
wire	[2:0]	fbid24, fbid25, fbid26, fbid27 ; 
wire	[2:0]	fbid28, fbid29, fbid30, fbid31 ; 
 
 
 
wire	[31:0]	 mb_way_fb_vld_reset ; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	way_fbid_vld;  // BS & SR 11/04/03, MB grows to 32
 
// Mux selects for muxing out the next link field 
wire	sel_0to3, sel_4to7, sel_8to11, sel_12to15 ; 
wire    sel_19to16, sel_23to20, sel_27to24, sel_31to28; 
wire	sel_default_0123, sel_default_4567 ; 
wire	sel_default_89ab, sel_default_cdef ; 
wire    sel_default_a_0123, sel_default_a_4567, sel_default_a_89ab, sel_default_a_cdef;
wire    sel_default_0to15; // BS & SR 11/04/03, MB grows to 32
wire    sel_default_16to31; // BS & SR 11/04/03, MB grows to 32
 
wire		misbuf_next_vld_c3; 
wire	[4:0]	misbuf_next_link_c3; // BS & SR 11/04/03, MB grows to 32 
wire    [4:0]   misbuf_next_link_a_c3; // BS & SR 11/04/03, MB grows to 32
wire    [4:0]   misbuf_next_link_b_c3; // BS & SR 11/04/03, MB grows to 32

 
wire	inst_mb_c4, tag_inst_mb_c5, inst_mb_c6; 
wire	inst_mb_c7, inst_mb_c8; 
wire	[31:0]	cas_rdy_set_c9; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	cas_ctrue_set_c9;  // BS & SR 11/04/03, MB grows to 32
wire	[4:0] 	misbuf_ctrue_rdy_entry; // BS & SR 11/04/03, MB grows to 32 
wire	[4:0]	nextlink_id0123, nextlink_id4567 ; // BS & SR 11/04/03, MB grows to 32 
wire	[4:0]	nextlink_id89ab, nextlink_idcdef ; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	next_link_wr_en_c3 ; // BS & SR 11/04/03, MB grows to 32 
wire	[4:0]	enc_data_wr_wl_c3; // BS & SR 11/04/03, MB grows to 32 
 
wire	mb_hit_off_c1_d1; 
 
wire	misbuf_dep_inst_c3, misbuf_dep_inst_c4; 
wire	misbuf_dep_inst_c5, misbuf_dep_inst_c52, misbuf_dep_inst_c6; // BS 03/11/04 extra cycle for mem access 
wire	misbuf_dep_inst_c7; 
 
 
wire	misbuf_mark_evict_tmp_c2; 
wire	misbuf_mark_evict_tmp_c3; 
wire	misbuf_mark_mcu_rdy_c3; 
wire	mcu_rdy_c4, mcu_rdy_c5 , mcu_rdy_c52; // BS 03/11/04 extra cycle for mem access 
wire	mcu_rdy_c6, mcu_rdy_c7, mcu_rdy_c8 ; 
wire	misbuf_evict_c7; 
 
wire	misbuf_tecc_c4, misbuf_tecc_c5 , misbuf_tecc_c52; // BS 03/11/04 extra cycle for mem access 
wire	misbuf_tecc_c6, misbuf_tecc_c7 ; 
 
wire	[31:0]	mcu_ready_set_c8, reset_mcu_ready ; // BS & SR 11/04/03, MB grows to 32 
wire		mcu_pick; 
 
wire	mcu_ack_pending_in; 
wire	mcu_ack_pend_state; 
wire	mcu_l2t_rd_ack_d1; 
 
wire		ready_miss_r2; 
wire	[4:0]	ld_mbid_r2 ; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	mb_miss_rdy_r2 ; // BS & SR 11/04/03, MB grows to 32  
wire	st_or_dep_rdy_c5; 
wire	[4:0]	dep_mbid_c5; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	fb_dep_rdy_c5; // BS & SR 11/04/03, MB grows to 32 
wire	cas1_inst_c3; 
wire	mb_dep_rdy_en_c3, mb_dep_rdy_en_c4; 
wire	[31:0]	mb_dep_rdy_c4; // BS & SR 11/04/03, MB grows to 32 
wire	[4:0]	wbb_dep_mbid_d1; // BS & SR 11/04/03, MB grows to 32 
wire		wbb_dep_rdy_en_d1; 
wire	[31:0]	wbb_dep_rdy_d1; // BS & SR 11/04/03, MB grows to 32 
wire	rdmat_dep_rdy_en_d1; 
wire	[4:0]	rdmat_dep_mbid_d1; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	rdmat_dep_rdy_d1; // BS & SR 11/04/03, MB grows to 32 
 
wire	mbid_vld_in, mbid_vld; 
wire	set_mbid_vld, reset_mbid_vld, set_mbid_vld_prev; 
wire	rdy_csr_inst_en; 
wire	[4:0]	csr_mbid; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	csr_inst_rdy ; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	cas2_or_pst_rdy_c8; // BS & SR 11/04/03, MB grows to 32 
wire	mcu_pick_prev; 
 
wire	[31:0]	l2_pick_vec, mcu_pick_vec, mb_read_pick_vec ; // BS & SR 11/04/03, MB grows to 32 
wire	[3:0]	pick_quad0_in, pick_quad1_in, pick_quad2_in, pick_quad3_in; 
wire 	[3:0]	pick_quad4_in, pick_quad5_in, pick_quad6_in, pick_quad7_in;
wire	[7:0]	pick_quad_in;  // BS & SR 11/04/03, MB grows to 32
 
wire		sel_mcu_lshift, sel_mcu_same ; 
wire	[7:0]	mcu_pick_state_lshift, mcu_pick_state,mcu_pick_state_prev ; // BS & SR 11/04/03, MB grows to 32
 
wire		sel_mcu_lshift_quad0, sel_mcu_same_quad0 ; 
wire	[3:0]	mcu_pick_state_lshift_quad0, mcu_pick_state_quad0; 
wire	[3:0]	mcu_pick_state_prev_quad0 ; 

wire		sel_mcu_lshift_quad1, sel_mcu_same_quad1 ; 
wire	[3:0]	mcu_pick_state_lshift_quad1, mcu_pick_state_quad1; 
wire	[3:0]	mcu_pick_state_prev_quad1 ; 
 
wire		sel_mcu_lshift_quad2, sel_mcu_same_quad2 ; 
wire	[3:0]	mcu_pick_state_lshift_quad2, mcu_pick_state_quad2; 
wire	[3:0]	mcu_pick_state_prev_quad2 ; 
 
wire		sel_mcu_lshift_quad3, sel_mcu_same_quad3 ; 
wire	[3:0]	mcu_pick_state_lshift_quad3, mcu_pick_state_quad3; 
wire	[3:0]	mcu_pick_state_prev_quad3 ; 

wire            sel_mcu_lshift_quad4, sel_mcu_same_quad4 ;
wire    [3:0]   mcu_pick_state_lshift_quad4, mcu_pick_state_quad4;
wire    [3:0]   mcu_pick_state_prev_quad4 ;

wire            sel_mcu_lshift_quad5, sel_mcu_same_quad5 ;
wire    [3:0]   mcu_pick_state_lshift_quad5, mcu_pick_state_quad5;
wire    [3:0]   mcu_pick_state_prev_quad5 ;

wire            sel_mcu_lshift_quad6, sel_mcu_same_quad6 ;
wire    [3:0]   mcu_pick_state_lshift_quad6, mcu_pick_state_quad6;
wire    [3:0]   mcu_pick_state_prev_quad6 ;

wire            sel_mcu_lshift_quad7, sel_mcu_same_quad7 ;
wire    [3:0]   mcu_pick_state_lshift_quad7, mcu_pick_state_quad7;
wire    [3:0]   mcu_pick_state_prev_quad7 ;

 
wire	sel_l2_lshift, sel_l2_same, init_pick_state; 
wire	[7:0]	l2_pick_state_prev, l2_pick_state_lshift; // BS & SR 11/04/03, MB grows to 32
wire	[7:0]	l2_pick_state; // BS & SR 11/04/03, MB grows to 32
wire	sel_l2_lshift_quad0, sel_l2_same_quad0, init_pick_state_quad0; 
wire	[3:0]	l2_pick_state_prev_quad0, l2_pick_state_lshift_quad0; 
wire	[3:0]	l2_pick_state_quad0; 
wire	sel_l2_lshift_quad1, sel_l2_same_quad1, init_pick_state_quad1; 
wire	[3:0]	l2_pick_state_prev_quad1, l2_pick_state_lshift_quad1; 
wire	[3:0]	l2_pick_state_quad1; 
wire	sel_l2_lshift_quad2, sel_l2_same_quad2, init_pick_state_quad2; 
wire	[3:0]	l2_pick_state_prev_quad2, l2_pick_state_lshift_quad2; 
wire	[3:0]	l2_pick_state_quad2; 
wire	sel_l2_lshift_quad3, sel_l2_same_quad3, init_pick_state_quad3; 
wire	[3:0]	l2_pick_state_prev_quad3, l2_pick_state_lshift_quad3; 
wire	[3:0]	l2_pick_state_quad3; 
wire    [3:0]   l2_pick_state_prev_quad4, l2_pick_state_lshift_quad4; // BS & SR 11/04/03, MB grows to 32
wire    [3:0]   l2_pick_state_quad4; // BS & SR 11/04/03, MB grows to 32
wire    [3:0]   l2_pick_state_prev_quad5, l2_pick_state_lshift_quad5; // BS & SR 11/04/03, MB grows to 32
wire    [3:0]   l2_pick_state_quad5; // BS & SR 11/04/03, MB grows to 32
wire    [3:0]   l2_pick_state_prev_quad6, l2_pick_state_lshift_quad6; // BS & SR 11/04/03, MB grows to 32
wire    [3:0]   l2_pick_state_quad6; // BS & SR 11/04/03, MB grows to 32
wire    [3:0]   l2_pick_state_prev_quad7, l2_pick_state_lshift_quad7; // BS & SR 11/04/03, MB grows to 32
wire    [3:0]   l2_pick_state_quad7; // BS & SR 11/04/03, MB grows to 32
wire	[7:0]	pick_state; 
wire	[3:0]	pick_state_quad0, pick_state_quad1; 
wire	[3:0]	pick_state_quad2, pick_state_quad3; 
wire	pick_s0_quad0, 	pick_s1_quad0, pick_s2_quad0, pick_s3_quad0; 
wire	pick_s0_quad1, 	pick_s1_quad1, pick_s2_quad1, pick_s3_quad1; 
wire	pick_s0_quad2, 	pick_s1_quad2, pick_s2_quad2, pick_s3_quad2; 
wire	pick_s0_quad3, 	pick_s1_quad3, pick_s2_quad3, pick_s3_quad3; 
wire	pick_s0, pick_s1, pick_s2, pick_s3 ; 
wire	[3:0]	pick_quad0_sel, pick_quad1_sel ; 
wire	[3:0]	pick_quad2_sel, pick_quad3_sel ; 
wire    [3:0]   pick_quad4_sel, pick_quad5_sel ; // BS & SR 11/04/03, MB grows to 32
wire    [3:0]   pick_quad6_sel, pick_quad7_sel ; // BS & SR 11/04/03, MB grows to 32

wire	[7:0]	pick_oct_sel; // BS & SR 11/04/03, MB grows to 32 
wire	[31:0]	picker_out, picker_out_d1, picker_out_d2 ; // BS & SR 11/04/03, MB grows to 32 
wire		picker_out_qual; 
 
wire	l2_pick, l2_pick_d1; 
wire	l2_wait_set, l2_wait_reset ; 
wire	l2_wait_in, l2_wait ; 
wire	l2_pick_read_ctrue; 
wire	evict_vld_unqual_c3; 
 
wire	evict_vld_c3, evict_vld_c4; 
wire	[31:0]	dec_wr_wl_c4; // BS & SR 11/04/03, MB grows to 32 
 wire	[31:0]	dec_mcu_pick_d2 ; // BS & SR 11/04/03, MB grows to 32 
 
wire	way_fbid_rd_vld_prev; 
wire	fbsel_0to3, fbsel_4to7, fbsel_8to11;  
wire	fbsel_def_0123, fbsel_def_4567, fbsel_def_89ab, fbsel_def_cdef ; 
wire	fbsel_def_vld ;  
wire 	fbsel_15to12 , fbsel_19to16 , fbsel_27to24, fbsel_31to28;
wire	[3:0]	way0123, way4567, way89ab, waycdef; 
wire 	[3:0]   waya89ab, waya4567, waya0123, wayacdef;
wire	[2:0]	fbid0123, fbid4567, fbid89ab, fbidcdef; 
 
wire	[31:0]	mb_entry_dec_c1; // BS & SR 11/04/03, MB grows to 32 
wire	misbuf_corr_err_unqual_c2, misbuf_uncorr_err_unqual_c2; 
wire	misbuf_corr_err_c1, misbuf_uncorr_err_c1 ; 
wire	[4:0]	mbf_insert_mbid_c3; // BS & SR 11/04/03, MB grows to 32 
wire		mbf_insert_c3; 
wire	nondep_fbhit_c2_unqual; 
wire	rdma_inst_c3; 
wire	[31:0]	mb_l2_ready_qual_in, mb_l2_ready_qual ; // BS & SR 11/04/03, MB grows to 32 
 
wire	mbf_insert_c3_tmp, inst_mb_c3_1; 
wire	wr64_inst_c3; 
 
wire	mb_rdma_count_en; 
wire	[3:0]	mb_rdma_count_c4, mb_rdma_count_plus1;  
wire	[3:0]	mb_rdma_count_prev, mb_rdma_count_minus1;  
wire	inc_rdma_cnt_c3; 
 
wire	buffer_miss_vld_c2, buffer_miss_vld_c3; 
wire	rdma_comp_rdy_c3, rdma_comp_rdy_c4, rdma_comp_rdy_c5, rdma_comp_rdy_c52;  // BS 03/11/04 extra cycle for mem access
wire	rdma_comp_rdy_c6, rdma_comp_rdy_c7, rdma_comp_rdy_c8 ; 
wire	wr64_miss_not_comp_c3; 
wire	ld64_inst_c3, ld64_inst_c4, ld64_inst_c5 , ld64_inst_c52;  // BS 03/11/04 extra cycle for mem access
wire	ld64_inst_c6, ld64_inst_c7 ; 
 
wire	filbuf_match_c3, filbuf_match_c3_unqual ; 
wire	l2_bypass_mode_on_d1; 
 
wire	misbuf_rdma_gate_off_c2; 
wire	rdma_reg_vld_c3; 
wire	filbuf_stinst_match_c3; 
wire	dummy_req_d1, dummy_req_d2 ; 
 
wire	[31:0]	mb_cam_hit_vec_c1 ; // BS & SR 11/04/03, MB grows to 32 
 
wire	tmp_cam_hit_c1_3to0, tmp_cam_hit_c1_7to4; 
wire	tmp_cam_hit_c1_11to8, tmp_cam_hit_c1_15to12; 
wire	tmp_cam_hit_c2_3to0, tmp_cam_hit_c2_7to4; 
wire	tmp_cam_hit_c2_11to8, tmp_cam_hit_c2_15to12; 
// BS & SR 11/04/03, MB grows to 32
wire    tmp_cam_hit_c1_19to16, tmp_cam_hit_c1_23to20, tmp_cam_hit_c1_27to24;
wire	tmp_cam_hit_c1_31to28; 
wire    tmp_cam_hit_c2_19to16, tmp_cam_hit_c2_23to20, tmp_cam_hit_c2_27to24;
wire    tmp_cam_hit_c2_31to28;
 
wire	l2_dir_map_on_d1; 
wire	misbuf_c1c3_match_c1; 
wire	misbuf_c1c2_match_c1, misbuf_c1c2_match_c1_d1; 
wire    [31:0]  mb_valid_ifin; // BS & SR 11/04/03, MB grows to 32 
wire	mcu_pick_1, mcu_pick_2_l ; 
 
wire	evict_par_err_c3, evict_par_err_c4;  
wire	evict_par_err_c5, evict_par_err_c52; // BS 03/11/04 extra cycle for mem access  
wire	evict_par_err_c6, evict_par_err_c7;  
wire	[31:0]	mb_tag_wr_wl_c3_tmp; // BS & SR 11/04/03, MB grows to 32 
 
wire	[31:0]	cam_idx_hit_vec_c1, idx_on_bypass_vec_c1;
wire	[31:0]	tmp_idx_hit_vec_c1, tmp_idx_hit_vec_c2;
wire	[31:0]	misbuf_idx_hit_vec_c2, misbuf_idx_hit_vec_c3, misbuf_idx_hit_vec_c3_fnl ;
wire	tmp_hit_unqual_c2 ; 
wire	nondep_fbhit_c3_unqual; 
wire	hit_vec_qual, idx_hit_vec_qual; 
wire	mbissue_inst_vld_c2; 
wire    mbissue_inst_vld_c3;
 
wire	[1:0]	cout1; 
wire	[1:0]	cout2; 
wire	[1:0]	cout3; 
wire	[1:0]	cout4; 
wire	[1:0]	cout5; 
 
wire	[2:0]	cout2_1; 
wire	[2:0]	cout2_2; 
wire	[2:0]	cout2_3; 
wire    [2:0]   cout2_4; // BS & SR 11/04/03, MB grows to 32
wire    [2:0]   cout2_5; // BS & SR 11/04/03, MB grows to 32

 
wire	[3:0]	cout3_1, cout3_2; // BS & SR 11/04/03, MB grows to 32
wire	[4:0]	cout4_1 ; // BS & SR 11/04/03, MB grows to 32 
wire    [5:0]   cout5_1; // BS & SR 11/04/03, MB grows to 32
 
wire	set_mb_idx_full_c4, reset_mb_idx_full_c4 ; 
wire	mb_idx_count_full_c4, mb_idx_count_full_c5; 
wire	[5:0]	hit_count_c4; 
 
wire	mb_rewrite_en_c4; 
wire	mb_rewrite_en_c5, mb_rwrite_en_c52, mb_rewrite_en_c6; // BS 03/11/04 extra cycle for mem access 
wire	mb_rewrite_en_c7, mb_rewrite_en_c8; 
 
wire	[3:0]	dec_low_insert_ptr;
wire	[7:0]	dec_hi_insert_ptr; 
wire	mb_inst_vld_c3_1; 
wire	[31:0]	mb_way_fb_vld_tmp; // BS & SR 11/04/03, MB grows to 32 
wire		mb_way_fb_vld_tmp_0to3; 
wire		mb_way_fb_vld_tmp_4to7; 
wire		mb_way_fb_vld_tmp_8to11; 
wire		mb_way_fb_vld_tmp_12to15; 
wire    mb_way_fb_vld_tmp_16to19, mb_way_fb_vld_tmp_20to23; 
wire   	mb_way_fb_vld_tmp_24to27, mb_way_fb_vld_tmp_28to31;
wire    dbb_rst_l; 
wire	misbuf_tecc_c3; 
wire	tag_hit_unqual_c3; 
wire	mb_inst_vld_c3_2; 
wire	misbuf_c1c2_match_c1_d1_1; 
wire	mbf_insert_c3_tmp_1, mbf_delete_c3_tmp_1 ; 
wire	inst_mb_c3_2; 
wire	mcu_pick_2; 
wire	evict_tecc_vld_c3; 
wire	misbuf_dep_inst_c2; 
wire	dep_inst_c3, tecc_c3 ; 
wire	inst_mb_c9; 
wire	[4:0]	enc_data_wr_wl_c9; // BS & SR 11/04/03, MB grows to 32 
wire	cas1_hit_c9; 
wire	uncorr_err_c9; 
wire	[31:0]	pst_ctrue_set_c8; // BS & SR 11/04/03, MB grows to 32 
wire	misbuf_corr_err_c8; 
 
wire	rdma_inst_c2; 
wire	fbsel_0to3_d1, fbsel_4to7_d1; 
wire	fbsel_8to11_d1, fbsel_def_vld_d1; 
wire    fbsel_15to12_d1, fbsel_19to16_d1, fbsel_23to20_d1, fbsel_27to24_d1; 
wire    fbsel_def_a_0123, fbsel_def_a_4567, fbsel_def_a_89ab, fbsel_def_a_cdef;
wire	sel_mux0, sel_mux1; 
wire    sel_mux0123, sel_mux4567; 
wire	sel_mux2, sel_mux3; 
wire	sel_mux4, sel_mux5; 
wire	sel_mux6, sel_mux7; 
wire	[3:0]	way0123_d1, way4567_d1 ; 
wire	[3:0]	way89ab_d1, waycdef_d1 ; 
wire 	[3:0]      wayacdef_d1, waya89ab_d1, waya4567_d1, waya0123_d1;
wire	[2:0]	fbid0123_d1, fbid4567_d1; 
wire 	[2:0]	fbida0123_d1, fbida4567_d1, fbida89ab_d1, fbidacdef_d1; 
wire 	[2:0]	misbuf_filbuf_fbid_a, misbuf_filbuf_fbid_b;
wire	[2:0]	fbid89ab_d1, fbidcdef_d1; 
wire	[4:0]	enc_data_wr_wl_c7_1; // BS & SR 11/04/03, MB grows to 32 
wire	[4:0]	mb_entry_c3_1; // BS & SR 11/04/03, MB grows to 32 

// VUAD ecc change
wire 	[31:0]	vuad_ce_err_rdy;
wire	[4:0]	enc_tag_wr_wl_c4;
wire	[4:0]	enc_tag_wr_wl_c5;
wire	[4:0]	enc_tag_wr_wl_c52;
wire	[4:0]	enc_tag_wr_wl_c6;
wire	[4:0]	enc_tag_wr_wl_c7;
wire	[4:0]	enc_tag_wr_wl_c8;

wire misbuf_inval_inst_c3;  // int 5.0 changes

///////////////////////////////////////////////////////////////// 
// 
// OFF mode  exceptions in  misbuf: 
// 
// 1) In the L2 off mode,  a mbf dependent is readied on a 
//    fill buffer hit unless, the fill buffer entry has fb_stinst=1 
//    or the instruction hitting the FIll Buffer is a CAS1  
// 
// 2) Eviction pass is turned off by preventing the setting of 
//    the EVICT bit. Remember to not turn off the mcu request. 
//	( Look at the expression for misbuf_evict_c7 ) 
// 
///////////////////////////////////////////////////////////////// 
 
 
/////////////////////////////////////////////////////////////////// 
 // Reset flop 
 /////////////////////////////////////////////////////////////////// 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 reset_flop 
				(.dout(dbb_rst_l), 
                                        .scan_in(reset_flop_scanin),
                                        .scan_out(reset_flop_scanout),
                                        .l1clk(l1clk), 
                                        .din(wmr_l),
  .siclk(siclk),
  .soclk(soclk) 
                                         
); 
 
 
 
///////////////////////////////////////////////////////////////// 
// An RDMA instruction that is not a PST will not access the 
// $  or the FB if the rdma reg vld is asserted. 
// 
// This signal is used for gating off completions becuase of 
// FB hits. 
///////////////////////////////////////////////////////////////// 
 
assign  misbuf_rdma_gate_off_c2 = ( tag_misbuf_rdma_reg_vld_c2  
                                //~arb_arbdp_misbuf_pst_no_ctrue_c2  not needed since we use this  for completions only 
                                & rdma_inst_c2 ); 
 
 
/////////////////////////////////////////////////////////////////////////// 
// MISS BUFFER INSERTION : An entry is inserted into the Miss Buffer under 
//	the following conditions 
//	* Valid instruction has to be a non Miss Buffer 
//	  instruction AND 
//	* An L2 tag miss with the following exceptions 
//		- Tecc instruction 
//		- diagnostic instruction 
//		- interrupt instruction. 
//		- inval instruction. 
//		- cas2 instruction. 
//		- wr64 instruction not hitting the fill Buffer 
//	* A Pst with no ctrue ( INcludes LDSTUB/SWAPS) 
//	* An rdma instrution that encounters rdma_reg_vld. 
//	* A CAS2 instruction  
//	* Miss Buffer hit. 
//	* WB or RDMAt hit. 
//	* CSR store. 
//	**** A non Allocating instruction that encounters a Parity error. 
// 
// MISS BUFFER DELETION : An entry is deleted from the Miss Buffer if 
//	* It is issued from the Miss Buffer 
//	  AND 
//	* a non-partial store $ or FB hit. 
//	* Pst with ctrue $ or FB hit. 
//	* CSR store from the Miss Buffer.  
// 
// MISS BUFFER INSERTION PIPELINE: 
//--------------------------------------------------------------------- 
// 	C1		C2		C3		C4 
//--------------------------------------------------------------------- 
//	Cam		generate	write		valid=1 
//	mbf		wr ptr		mbf tag 
//							mb_count[4:0] 
//							mb_count>5 
//							mb_count>12 
//					insertion 
//					condition 
//					counter 
//					logic 
//--------------------------------------------------------------------- 
// TIMING tag_miss_unqual_c2 is the most critical condition for insertion. 
//	  It takes ~17 gates to arrive at misbuf. 
//	  If parity has to be factored into the insertion equation, it would have 
//	  to be Ored in C3.  
//	   
//	 
////////////////////////////////////////////////////////////////////////// 
 
//
// for timing reasons filbuf_tag_hit_frm_mb_c2 is brought in directly and qualified.
//

assign arb_vuad_ce_err_c2_qual = (usaloc_ua_ce_c2 | vlddir_vd_ce_c2) & 
			(arb_vuad_ce_err_c2  & ~filbuf_tag_hit_frm_mb_c2);


l2t_misbuf_ctl_msff_ctl_macro__width_20 ff_l2t_mbist_r1 
        (
	.scan_in(ff_l2t_mbist_r1_scanin),
	.scan_out(ff_l2t_mbist_r1_scanout),
	.din({l2t_mb2_mbdata_wr_en,l2t_mb2_mbdata_wr_en_r1,mbtag_mbist_cam_sel,
		l2t_mb2_run,l2t_mb2_mbtag_rd_en,l2t_mb2_mbtag_rd_en_r1,
		l2t_mb2_mbtag_wr_en,l2t_mb2_mbtag_wr_en_r1,l2t_mb2_mbdata_rd_en,
		l2t_mb2_mbdata_rd_en_r1,l2t_mb2_addr[4:0],l2t_mb2_addr_r1[4:0]}), 	
	.l1clk(l1clk),
        .dout({l2t_mb2_mbdata_wr_en_r1,l2t_mb2_mbdata_wr_en_r2,mbtag_mbist_cam_sel_r1,
		l2t_mb2_run_r1,l2t_mb2_mbtag_rd_en_r1,l2t_mb2_mbtag_rd_en_r2,
		l2t_mb2_mbtag_wr_en_r1,l2t_mb2_mbtag_wr_en_r2,l2t_mb2_mbdata_rd_en_r1,
		l2t_mb2_mbdata_rd_en_r2,l2t_mb2_addr_r1[4:0],l2t_mb2_addr_r2[4:0]}),
  .siclk(siclk),
  .soclk(soclk)
	);

//assign misbuf_vuad_ce_err_log_c2 = (usaloc_ua_ce_c2 | vlddir_vd_ce_c2) & arb_vuad_ce_err_c2;
assign misbuf_vuad_ce_err_log_c2 = (usaloc_ua_ce_c2 | vlddir_vd_ce_c2) 
		& (arb_vuad_ce_err_c2  & ~filbuf_tag_hit_frm_mb_c2);


l2t_misbuf_ctl_msff_ctl_macro__width_7 ff_loggingerr 
        (
	.scan_in(ff_loggingerr_scanin),
	.scan_out(ff_loggingerr_scanout),
	.din({misbuf_vuad_ce_err_log_c2,misbuf_vuad_ce_err_log_c3,
	      misbuf_vuad_ce_err_log_c4,misbuf_vuad_ce_err_log_c5,
	      misbuf_vuad_ce_err_log_c52, misbuf_vuad_ce_err_log_c6,
	      misbuf_vuad_ce_err_log_c7}), 
	.l1clk(l1clk),  
	.dout({misbuf_vuad_ce_err_log_c3,misbuf_vuad_ce_err_log_c4,
		misbuf_vuad_ce_err_log_c5, misbuf_vuad_ce_err_log_c52,
		 misbuf_vuad_ce_err_log_c6, misbuf_vuad_ce_err_log_c7,
		misbuf_vuad_ce_err_c8}),
  .siclk(siclk),
  .soclk(soclk)  
	);
 
assign misbuf_mbtag_wr_en_c2 = l2t_mb2_run_r1 ? l2t_mb2_mbtag_wr_en_r2 : 
                                (~arbdec_arbdp_inst_mb_c2 & arb_misbuf_inst_vld_c2) ;
 
assign	mbf_insert_c2 =  (((arb_arbdp_misbuf_pst_no_ctrue_c2 | // pst no ctrue 
			arb_decdp_cas2_inst_c2 |  // cas2 
			arb_csr_st_c2 ) |  // csr store c2 
			wbuf_hit_unqual_c2 | // wb tag match 
			rdmat_hit_unqual_c2 | // rdma tag match 
			misbuf_rdma_gate_off_c2 ) &  // rdma reg vld. 
			misbuf_mbtag_wr_en_c2 )  | 
			misbuf_hit_c2 |  // dependent insertion. 
                        (arb_pf_ice_inst_c2 & arb_inst_vld_c2 & ~arbdec_arbdp_inst_mb_c2) | // prefetch ICE first pass
	                (arb_vuad_ce_err_c2_qual & ~arbdec_arbdp_inst_mb_c2) |
			( tag_miss_unqual_c2 &  
			 ~(arb_decdp_wr64_inst_c2 & ~filbuf_misbuf_match_c2) & // not an RDMA 64B write that misses FB 
			misbuf_mbtag_wr_en_c2 );  
 
// fix for bug 116974

assign vuad_err_true_c2 = (usaloc_ua_ce_c2 | vlddir_vd_ce_c2);

// Parity error insertion is turned off for a tag hit
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_tag_hit_unqual_c3 
                           (.din(tag_hit_unqual_c2), .l1clk(l1clk),
                .scan_in(ff_tag_hit_unqual_c3_scanin),
                .scan_out(ff_tag_hit_unqual_c3_scanout),
                .dout(tag_hit_unqual_c3),
  .siclk(siclk),
  .soclk(soclk)
);

//assign	 misbuf_tag_hit_unqual_c3 = tag_hit_unqual_c3 ; 
 
 
			 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbf_insert_c3 
                           (.din(mbf_insert_c2), .l1clk(l1clk),  
		.scan_in(ff_mbf_insert_c3_scanin),
		.scan_out(ff_mbf_insert_c3_scanout),
		.dout(mbf_insert_c3_tmp),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__dmsff_32x__width_2 ff_mbf_insert_c3_1 
                           (.din({2{mbf_insert_c2}}), .l1clk(l1clk),  
		.scan_in(ff_mbf_insert_c3_1_scanin),
		.scan_out(ff_mbf_insert_c3_1_scanout),
		.dout({mbf_insert_c3_tmp_1_clone,mbf_insert_c3_tmp_1}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_inst_mb_c3_1 
                           (.din(arbdec_arbdp_inst_mb_c2), .l1clk(l1clk),  
		.scan_in(ff_inst_mb_c3_1_scanin),
		.scan_out(ff_inst_mb_c3_1_scanout),
		.dout(inst_mb_c3_1),
  .siclk(siclk),
  .soclk(soclk)  
); 

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_arb_vuad_ce_err_c3 
	(
	.scan_in(ff_arb_vuad_ce_err_c3_scanin),
	.scan_out(ff_arb_vuad_ce_err_c3_scanout),
	.din(arb_vuad_ce_err_c2_qual), 
	.l1clk(l1clk),
	.dout(arb_vuad_ce_err_c3),
  .siclk(siclk),
  .soclk(soclk)
	);








// Force insertion of instruction into MB in case of arb_vuad_ce_err_c3 = 1
// No need to gate arb_vuad_ce_err_c3 with inst_mb_c3_1 because
// CE can only be found on an instruction that is not issued from MB
// When the instruction gets written to MB, the error gets corrected
// in the same pass. So the replayed instruction can never find a CE.
// 
//assign	mbf_insert_c3 = mbf_insert_c3_tmp | ( ~inst_mb_c3_1 &  // VUAD ecc change
//				tag_misbuf_par_err_c3  & 
//				~tag_hit_unqual_c3 ) | arb_vuad_ce_err_c3 ; // tecc insert is  
//								// the most critical  
//								// insertion condition. 
// 

assign        mbf_insert_c3 = mbf_insert_c3_tmp | ( ~inst_mb_c3_1 &  // VUAD ecc change
		tag_misbuf_par_err_c3  & ~tag_hit_unqual_c3 ) | (~inst_mb_c3_1 & arb_vuad_ce_err_c3);

 
 
assign	mbf_delete_miss_c2 = ( ~arb_decdp_pst_inst_c2 |  // non partial store inst 
				arb_arbdp_pst_with_ctrue_c2 ) & // pst with ctrue 
			 	mbissue_inst_vld_c2 & 
				( tag_hit_unqual_c2 |  
				(filbuf_misbuf_match_c2 &  
				~misbuf_rdma_gate_off_c2 )) & ~arb_vuad_ce_err_c2_qual ; 
// int 5.0 changes
//-----\/ FIX for bug #4619 --\/-----
// inval/csr  instructions will get deleted from the miss buffer
// when they are issued out of there unless there is a vuad err for which the
// instruction will be replayed.
// Prefetch ICE and wr64 get deleted unless there is a vuad ce or tag parity
// Error, or a tecc instruction , for which they get replayed.
//-----\/ FIX for bug #4619 --\/-----

 
assign	mbf_delete_c2  = (( arb_csr_st_c2  | arb_misbuf_inval_inst_c2 ) 
		// delete a miss after it hits $ or FB 
		& mbissue_inst_vld_c2 & ~arb_vuad_ce_err_c2_qual  )  | mbf_delete_miss_c2 ;  
	
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbf_delete_c3 
                           (.din(mbf_delete_c2), .l1clk(l1clk),  
		.scan_in(ff_mbf_delete_c3_scanin),
		.scan_out(ff_mbf_delete_c3_scanout),
		.dout(mbf_delete_c3_tmp),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__dmsff_32x__width_2 ff_mbf_delete_c3_1 
                           (.din({2{mbf_delete_c2}}), .l1clk(l1clk),  
		.scan_in(ff_mbf_delete_c3_1_scanin),
		.scan_out(ff_mbf_delete_c3_1_scanout),
		.dout({mbf_delete_c3_tmp_1,mbf_delete_c3_tmp_1_clone}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	mbf_delete_c3 = ( inst_mb_c3 & misbuf_wr64_miss_comp_c3 & ~tag_misbuf_par_err_c3 & ~arb_vuad_ce_err_c3) 
			| (mbissue_inst_vld_c3 & arb_pf_ice_inst_c3 & ~evict_tecc_vld_c3 & ~arb_vuad_ce_err_c3 & ~tag_misbuf_par_err_c3) 
                        | mbf_delete_c3_tmp ; // int 5.0 changes 

 
/////////////////////////////////////////////////////////////////////// 
// misbuf_nondep_fbhit_c3: This signal indicates an FB tag match  
// for an instruction that is not a miss buffer dependent. 
// 
// A store  instruction issued from the Xbar that misses the Miss Buffer 
// but hits the Fill Buffer should CAM the directory and invalidate 
// the L1s that share the line.  
// If we simply look at tag_hitl2orfb_c3, we will miss the above 
// case.  
// 
// However, for all tag miss cases encountering a parity error, the 
// store is inserted into the Miss Buffer and replayed for sending an ACK 
// 
// misbuf_nondep_fbhit_c3 should be low when a tag parity error occurs. 
// This is because we don't want to CAM the directory for the case when 
// a tag miss but a fb hit is encountered for a non miss buffer instruction. 
/////////////////////////////////////////////////////////////////////// 
 
 
assign	nondep_fbhit_c2_unqual =  filbuf_misbuf_match_c2 &  
				~misbuf_tag_hit_unqual_c2_internal ;  
// int 5.0 change
//msff_ctl_macro ff_misbuf_nondep_fbhit_c3 (width=1)
//                           (.din(nondep_fbhit_c2_unqual), .l1clk(l1clk),  
//		.dout(nondep_fbhit_c3_unqual),  
//		.scan_in(), 
//		.scan_out()
//); 
// 
//assign	misbuf_nondep_fbhit_c3 = nondep_fbhit_c3_unqual &  
//				~tag_misbuf_par_err_c3 & 
//				mb_inst_vld_c3 ; 
// -------------\/ FIX for int_5.0 \/-------------------------------
// mbctl_nondep_fbhit_c3 is no longer qualfied with mb_inst_vld_c3
// or tag_misbuf_par_err_c3 since it is a critical signal.
// -----------------------------------------------------------------

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbctl_nondep_fbhit_c3 
		(
		.scan_in(ff_mbctl_nondep_fbhit_c3_scanin),
		.scan_out(ff_mbctl_nondep_fbhit_c3_scanout),
		.din(nondep_fbhit_c2_unqual),
		.dout(misbuf_nondep_fbhit_c3),
		.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
		
		

		);
 
 
////////////////////////////////////////////////////////////////////////////// 
// mbf Insertion pointer. 
// The Insertion pointer is determined in C2 based on the  
// valid bit written by the C4 instruction. One cycle of 
// forwarding is required to prevent overwriting a valid 
// entry as shown in the following pipeline. 
//----------------------------------------------------- 
//	C2		C3		C4 
//----------------------------------------------------- 
//	calc.		write		valid=1 
//	wr ptr. 
//----------------------------------------------------- 
//			C2		C3		 
//----------------------------------------------------- 
//			calc		 
//			wr ptr. 
// 
// 	Timing optimization: The wr ptr in C2 can assume that the  
// 	operation in C3 is going to insert. This will not affect the 
//	insertion of the C2 op even if the assumption turns out to  
//	be incorrect. 
///////////////////////////////////////////////////////////////////////////////// 
 
 
 
 
 
assign  mb_valid_ifin = ( mb_valid | (mb_write_ptr_c3 &  
			{32{mb_inst_vld_c3_1}} )); // BS & SR 11/04/03, MB grows to 32 
 
assign  mb_write_ptr_c2[0] = ~mb_valid_ifin[0]; 
assign  mb_write_ptr_c2[1] = ~mb_valid_ifin[1] &       (mb_valid_ifin[0]) ; 
assign  mb_write_ptr_c2[2] = ~mb_valid_ifin[2] &   (&(mb_valid_ifin[1:0])) ; 
assign  mb_write_ptr_c2[3] = ~mb_valid_ifin[3] &  (&(mb_valid_ifin[2:0])) ; 
assign  mb_write_ptr_c2[4] = ~mb_valid_ifin[4] &  (&(mb_valid_ifin[3:0])) ; 
assign  mb_write_ptr_c2[5] = ~mb_valid_ifin[5] &   (&(mb_valid_ifin[4:0])) ; 
assign  mb_write_ptr_c2[6] = ~mb_valid_ifin[6] &   (&(mb_valid_ifin[5:0])) ; 
assign  mb_write_ptr_c2[7] = ~mb_valid_ifin[7] &   (&(mb_valid_ifin[6:0])) ; 
assign  mb_write_ptr_c2[8] = ~mb_valid_ifin[8] &   (&(mb_valid_ifin[7:0])) ; 
assign  mb_write_ptr_c2[9] = ~mb_valid_ifin[9] &   (&(mb_valid_ifin[8:0])) ; 
assign  mb_write_ptr_c2[10] = ~mb_valid_ifin[10] &   (&(mb_valid_ifin[9:0])) ; 
assign  mb_write_ptr_c2[11] = ~mb_valid_ifin[11] &   (&(mb_valid_ifin[10:0])) ; 
assign  mb_write_ptr_c2[12] = ~mb_valid_ifin[12] &   (&(mb_valid_ifin[11:0])) ; 
assign  mb_write_ptr_c2[13] = ~mb_valid_ifin[13] &   (&(mb_valid_ifin[12:0])) ; 
assign  mb_write_ptr_c2[14] = ~mb_valid_ifin[14] &   (&(mb_valid_ifin[13:0])) ; 
assign  mb_write_ptr_c2[15] = ~mb_valid_ifin[15] &   (&(mb_valid_ifin[14:0])) ; 
// BS & SR 11/04/03, MB grows to 32
assign  mb_write_ptr_c2[16] = ~mb_valid_ifin[16] &      (&(mb_valid_ifin[15:0])) ;
assign  mb_write_ptr_c2[17] = ~mb_valid_ifin[17] &   (&(mb_valid_ifin[16:0])) ;
assign  mb_write_ptr_c2[18] = ~mb_valid_ifin[18] &  (&(mb_valid_ifin[17:0])) ;
assign  mb_write_ptr_c2[19] = ~mb_valid_ifin[19] &  (&(mb_valid_ifin[18:0])) ;
assign  mb_write_ptr_c2[20] = ~mb_valid_ifin[20] &   (&(mb_valid_ifin[19:0])) ;
assign  mb_write_ptr_c2[21] = ~mb_valid_ifin[21] &   (&(mb_valid_ifin[20:0])) ;
assign  mb_write_ptr_c2[22] = ~mb_valid_ifin[22] &   (&(mb_valid_ifin[21:0])) ;
assign  mb_write_ptr_c2[23] = ~mb_valid_ifin[23] &   (&(mb_valid_ifin[22:0])) ;
assign  mb_write_ptr_c2[24] = ~mb_valid_ifin[24] &   (&(mb_valid_ifin[23:0])) ;
assign  mb_write_ptr_c2[25] = ~mb_valid_ifin[25] &   (&(mb_valid_ifin[24:0])) ;
assign  mb_write_ptr_c2[26] = ~mb_valid_ifin[26] &   (&(mb_valid_ifin[25:0])) ;
assign  mb_write_ptr_c2[27] = ~mb_valid_ifin[27] &   (&(mb_valid_ifin[26:0])) ;
assign  mb_write_ptr_c2[28] = ~mb_valid_ifin[28] &   (&(mb_valid_ifin[27:0])) ;
assign  mb_write_ptr_c2[29] = ~mb_valid_ifin[29] &   (&(mb_valid_ifin[28:0])) ;
assign  mb_write_ptr_c2[30] = ~mb_valid_ifin[30] &   (&(mb_valid_ifin[29:0])) ;
assign  mb_write_ptr_c2[31] = ~mb_valid_ifin[31] &   (&(mb_valid_ifin[30:0])) ;


assign mbtag_write_ptr[0]  = (l2t_mb2_addr_r2[4:0]==5'd0); 
assign mbtag_write_ptr[1]  = (l2t_mb2_addr_r2[4:0]==5'd1); 
assign mbtag_write_ptr[2]  = (l2t_mb2_addr_r2[4:0]==5'd2); 
assign mbtag_write_ptr[3]  = (l2t_mb2_addr_r2[4:0]==5'd3); 
assign mbtag_write_ptr[4]  = (l2t_mb2_addr_r2[4:0]==5'd4); 
assign mbtag_write_ptr[5]  = (l2t_mb2_addr_r2[4:0]==5'd5); 
assign mbtag_write_ptr[6]  = (l2t_mb2_addr_r2[4:0]==5'd6); 
assign mbtag_write_ptr[7]  = (l2t_mb2_addr_r2[4:0]==5'd7); 
assign mbtag_write_ptr[8]  = (l2t_mb2_addr_r2[4:0]==5'd8); 
assign mbtag_write_ptr[9]  = (l2t_mb2_addr_r2[4:0]==5'd9); 
assign mbtag_write_ptr[10] = (l2t_mb2_addr_r2[4:0]==5'd10); 
assign mbtag_write_ptr[11] = (l2t_mb2_addr_r2[4:0]==5'd11); 
assign mbtag_write_ptr[12] = (l2t_mb2_addr_r2[4:0]==5'd12); 
assign mbtag_write_ptr[13] = (l2t_mb2_addr_r2[4:0]==5'd13); 
assign mbtag_write_ptr[14] = (l2t_mb2_addr_r2[4:0]==5'd14); 
assign mbtag_write_ptr[15] = (l2t_mb2_addr_r2[4:0]==5'd15); 
assign mbtag_write_ptr[16] = (l2t_mb2_addr_r2[4:0]==5'd16); 
assign mbtag_write_ptr[17] = (l2t_mb2_addr_r2[4:0]==5'd17); 
assign mbtag_write_ptr[18] = (l2t_mb2_addr_r2[4:0]==5'd18); 
assign mbtag_write_ptr[19] = (l2t_mb2_addr_r2[4:0]==5'd19); 
assign mbtag_write_ptr[20] = (l2t_mb2_addr_r2[4:0]==5'd20); 
assign mbtag_write_ptr[21] = (l2t_mb2_addr_r2[4:0]==5'd21); 
assign mbtag_write_ptr[22] = (l2t_mb2_addr_r2[4:0]==5'd22); 
assign mbtag_write_ptr[23] = (l2t_mb2_addr_r2[4:0]==5'd23); 
assign mbtag_write_ptr[24] = (l2t_mb2_addr_r2[4:0]==5'd24); 
assign mbtag_write_ptr[25] = (l2t_mb2_addr_r2[4:0]==5'd25); 
assign mbtag_write_ptr[26] = (l2t_mb2_addr_r2[4:0]==5'd26); 
assign mbtag_write_ptr[27] = (l2t_mb2_addr_r2[4:0]==5'd27); 
assign mbtag_write_ptr[28] = (l2t_mb2_addr_r2[4:0]==5'd28); 
assign mbtag_write_ptr[29] = (l2t_mb2_addr_r2[4:0]==5'd29); 
assign mbtag_write_ptr[30] = (l2t_mb2_addr_r2[4:0]==5'd30); 
assign mbtag_write_ptr[31] = (l2t_mb2_addr_r2[4:0]==5'd31); 
 
 
assign	misbuf_mb_write_wl = l2t_mb2_run_r1 ? mbtag_write_ptr :  mb_write_ptr_c2 ; // wordline for mbtag write 




 
////////////////////////////////////////////////////////////// 
// Generate 2 signals  : 
// mb_count,  
// misbuf_arb_cnt28_px2 count >= 28 
// 
// The cnt12 condition is calculated in C3 and staged to C4. 
// The inflight instructions that need to be accounted for are 
// PX2*, C1, C2 C3,  
// 
// ( The PX2 instruction is not stalled if it is the 2nd packet 
// of a CAS instruction and if the first one has gone through.) 
// Hence the high water mark is asserted when there are 12 or 
// more instructions in the Miss Buffer. 
// 
// Timing notes: 
// The mb_cnt28_px2_prev is calculated in the C3 stage  
// every "valid" C3 op is presumed to insert if it is not issued 
// from the Miss Buffer. If this is the case, the Miss Buffer will 
// have to accomodate the ops in C2, C1, PX2 and PX1. Hence this 
// signal is asserted when the miss buffer counter is at 11  
// and the C3 op is not from the miss buffer. OR 
// if the miss buffer counter > 11 
// 
////////////////////////////////////////////////////////////// 
 
assign	cnt_reset = ( ~dbb_rst_l ) ; 
 
// insertion and deletion cannot happen at the same time. 
assign	mb_count_en = ( mbf_insert_c3 | mbf_delete_c3 ) ; 
  
 
assign  mb_count_plus1  = mb_count_c4+ 6'b1 ; // BS & SR 11/04/03, MB grows to 32 
assign  mb_count_minus1 = mb_count_c4- 6'b1 ; // BS & SR 11/04/03, MB grows to 32 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_6 mux_mbf_count  // BS & SR 11/04/03, MB grows to 32
			(.dout (mb_count_prev[5:0]), 
                    .din0(mb_count_plus1[5:0]), .din1(mb_count_minus1[5:0]), 
                    .sel0(mbf_insert_c3), .sel1(~mbf_insert_c3)); 
 
l2t_misbuf_ctl_msff_ctl_macro__clr_1__en_1__width_6 ff_mb_count_c4  // sync reset active high // BS & SR 11/04/03, MB grows to 32
                           (.din(mb_count_prev[5:0]), 
                 .scan_in(ff_mb_count_c4_scanin),
                 .scan_out(ff_mb_count_c4_scanout),
                 .en(mb_count_en), .l1clk(l1clk), .clr(cnt_reset), 
                 .dout(mb_count_c4[5:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	misbuf_arb_cnt28_px2_prev =  // BS & SR 11/04/03, MB grows to 32 
		mb_idx_count_full_c4  |  // indicates 11 or more entries with 
					// the same index in the mIss buffer. 
		(( mb_count_c4== 6'd27 )  
		& mb_inst_vld_c3 & ~inst_mb_c3 )  | // assume that  
	     	( mb_count_c4 > 6'd27 ) ; 
 
 
////FIXME synopsys translate_off FIXME fix sunv
//always	@(mb_count_c4  ) begin // BS & SR 11/04/03, MB grows to 32 
//	if(  mb_count_c4 > 6'd32 )  begin 
//	$error("MB_COUNT", "illegal mb insertion with mb_count 33"); 
//	end 
//	else begin end // do nothing, int 5.0 changes
//end 
////FIXME synopsys translate_on FIXME fix sunv

 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_rdma_inst_c2 
		(.din(arbdec_arbdp_rdma_inst_c1), .l1clk(l1clk), 
             .scan_in(ff_rdma_inst_c2_scanin),
             .scan_out(ff_rdma_inst_c2_scanout),
             .dout(rdma_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_rdma_inst_c3 
		(.din(rdma_inst_c2), .l1clk(l1clk), 
             .scan_in(ff_rdma_inst_c3_scanin),
             .scan_out(ff_rdma_inst_c3_scanout),
             .dout(rdma_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
////////////////////////////////////////////////////////////////////// 
// PREVENTION of LIVELOCK 
// RDMA instructions in the Miss Buffer have a high water mark of 
// 8 for the following reason. 
// When the interface to the siu frees up, an instruction from the 
// snoop/siu interface will have a higher priority to issue than 
// the miss Buffer. It is possible to construct a livelock case 
// where, entries from the snpq always get selected over older 
// miss buffer snoops. If the miss Buffer is filled with snoops, 
// it will cause the pipeline to be completely hogged by snoops. 
//  
// To prevent this livelock, we maintain a snoop instruction counter 
//  in the Miss Buffer. Whenever this counter reaches 8. it disallows 
// any instruction from the snoop Q from issuing to the pipeline until 
// the counter value drops below 8. 
////////////////////////////////////////////////////////////////////// 
 
assign	mb_rdma_count_en = ( mbf_insert_c3 | mbf_delete_c3 ) & rdma_inst_c3 ; 
assign  mb_rdma_count_plus1  = mb_rdma_count_c4+ 4'b1 ; 
assign  mb_rdma_count_minus1 = mb_rdma_count_c4- 4'b1 ; 
 
assign	inc_rdma_cnt_c3 = mbf_insert_c3 & rdma_inst_c3; 
 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_mbf_rdma_count 
			(.dout (mb_rdma_count_prev[3:0]), 
                .din0(mb_rdma_count_plus1[3:0]),  
		.din1(mb_rdma_count_minus1[3:0]), 
                .sel0(inc_rdma_cnt_c3),  
		.sel1(~inc_rdma_cnt_c3)); 
 
l2t_misbuf_ctl_msff_ctl_macro__clr_1__en_1__width_4 ff_mb_rdma_count_c4  // sync reset active high
                           (.din(mb_rdma_count_prev[3:0]), 
                 .scan_in(ff_mb_rdma_count_c4_scanin),
                 .scan_out(ff_mb_rdma_count_c4_scanout),
                 .en(mb_rdma_count_en), .l1clk(l1clk), .clr(cnt_reset), 
                 .dout(mb_rdma_count_c4[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	misbuf_arb_snp_cnt8_px1 = ( mb_rdma_count_c4 >= 4'd8 ); 
 
////////////////////////////////////////////////////////////// 
//MB_CAM_EN logic in arb. 
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
 
/////////////////////////////////////////////////////////////////////////////// 
// CAM hit generation: This operation requires forwarding due to  
// the offset between insertion and CAMMING. 
//----------------------------------------------------------------------------- 
// op A		C1(cam)		C2	C3(enqueue/dequeue)	C4(valid=1/0) 
// op B				C1	C2			C3		 
// op C					C1			C2 
// op D								C1 
//----------------------------------------------------------------------------- 
// The earliest operation that can see the effects of OP A is OP D.  
// If we want OP B and OP C to see the effects of OP A, we need to forward 
// that information while generating mb Hit. 
// 
// forwarding all the information from a C2 op to a C1 op presents  
// a timing problem. Performing the bypassing in C2 will cause misbuf_hit_c2 to be 
// the critical component of the hit_way_vld_c2 signal. One way of solving these 
// two problems is to decouple hit_vec_c2 and misbuf_hit_c2 logic cones. 
//  
// 
// Bypass Logic for hit_vec and hit in C1 and C2. 
// 
// C1: 
// - Bypass all information from C3 to the C1 operation. 
// - If the C2 operation is from the Miss Buffer, turn off hit for the 
//   entry of the C2 operation. 
//  
// C2: 
// - If C3 operation inserts, use address match and entry to OR with the result 
//   from C1. 
// - If C3 operation from the miss buffer, does not delete, use address match 
//   and entry to OR with the result from C1. 
// 
//////////////////////////////////////////////////////////////////////////////// 
 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_inst_mb_entry_c2 
                           (.din(arbdec_arbdp_inst_mb_entry_c1[4:0]), .l1clk(l1clk),  
		.scan_in(ff_inst_mb_entry_c2_scanin),
		.scan_out(ff_inst_mb_entry_c2_scanout),
		.dout(inst_mb_entry_c2[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	dec_mb_entry_c2[0]	= ( inst_mb_entry_c2 == 5'd0 ) ; 
assign	dec_mb_entry_c2[1]	= ( inst_mb_entry_c2 == 5'd1 ) ; 
assign	dec_mb_entry_c2[2]	= ( inst_mb_entry_c2 == 5'd2 ) ; 
assign	dec_mb_entry_c2[3]	= ( inst_mb_entry_c2 == 5'd3 ) ; 
assign	dec_mb_entry_c2[4]	= ( inst_mb_entry_c2 == 5'd4 ) ; 
assign	dec_mb_entry_c2[5]	= ( inst_mb_entry_c2 == 5'd5 ) ; 
assign	dec_mb_entry_c2[6]	= ( inst_mb_entry_c2 == 5'd6 ) ; 
assign	dec_mb_entry_c2[7]	= ( inst_mb_entry_c2 == 5'd7 ) ; 
assign	dec_mb_entry_c2[8]	= ( inst_mb_entry_c2 == 5'd8 ) ; 
assign	dec_mb_entry_c2[9]	= ( inst_mb_entry_c2 == 5'd9 ) ; 
assign	dec_mb_entry_c2[10]	= ( inst_mb_entry_c2 == 5'd10 ) ; 
assign	dec_mb_entry_c2[11]	= ( inst_mb_entry_c2 == 5'd11 ) ; 
assign	dec_mb_entry_c2[12]	= ( inst_mb_entry_c2 == 5'd12 ) ; 
assign	dec_mb_entry_c2[13]	= ( inst_mb_entry_c2 == 5'd13 ) ; 
assign	dec_mb_entry_c2[14]	= ( inst_mb_entry_c2 == 5'd14 ) ; 
assign	dec_mb_entry_c2[15]	= ( inst_mb_entry_c2 == 5'd15 ) ; 
assign  dec_mb_entry_c2[16]     = ( inst_mb_entry_c2 == 5'd16 ) ; // BS & SR 11/04/03, MB grows to 32
assign  dec_mb_entry_c2[17]     = ( inst_mb_entry_c2 == 5'd17 ) ;
assign  dec_mb_entry_c2[18]     = ( inst_mb_entry_c2 == 5'd18 ) ;
assign  dec_mb_entry_c2[19]     = ( inst_mb_entry_c2 == 5'd19 ) ;
assign  dec_mb_entry_c2[20]     = ( inst_mb_entry_c2 == 5'd20 ) ;
assign  dec_mb_entry_c2[21]     = ( inst_mb_entry_c2 == 5'd21 ) ;
assign  dec_mb_entry_c2[22]     = ( inst_mb_entry_c2 == 5'd22 ) ;
assign  dec_mb_entry_c2[23]     = ( inst_mb_entry_c2 == 5'd23 ) ;
assign  dec_mb_entry_c2[24]     = ( inst_mb_entry_c2 == 5'd24 ) ;
assign  dec_mb_entry_c2[25]     = ( inst_mb_entry_c2 == 5'd25 ) ;
assign  dec_mb_entry_c2[26]     = ( inst_mb_entry_c2 == 5'd26 ) ;
assign  dec_mb_entry_c2[27]     = ( inst_mb_entry_c2 == 5'd27 ) ;
assign  dec_mb_entry_c2[28]     = ( inst_mb_entry_c2 == 5'd28 ) ;
assign  dec_mb_entry_c2[29]     = ( inst_mb_entry_c2 == 5'd29 ) ;
assign  dec_mb_entry_c2[30]     = ( inst_mb_entry_c2 == 5'd30 ) ;
assign  dec_mb_entry_c2[31]     = ( inst_mb_entry_c2 == 5'd31 ) ;

 
//// mbist//////


l2t_misbuf_ctl_msff_ctl_macro__width_33 ff_mb_mbist_cam_match 
                           (.din({mb_mbist_cam_hit_unreg,mb_cam_match[31:0]}), .l1clk(l1clk),
               .scan_in(ff_mb_mbist_cam_match_scanin),
               .scan_out(ff_mb_mbist_cam_match_scanout),
               .dout({mb_mbist_cam_hit,mb_cam_match_reg[31:0]}),
  .siclk(siclk),
  .soclk(soclk)
);


assign mb_mbist_cam_hit_unreg = mbtag_mbist_cam_sel_r1 ? |(mb_cam_match_reg[31:0]) : 1'b0;


 
 
 
///////////////////////// 
// HIt vector generation  
///////////////////////// 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_l2_dir_map_on_d1 
              (.din(csr_l2_dir_map_on), .l1clk(l1clk), 
               .scan_in(ff_l2_dir_map_on_d1_scanin),
               .scan_out(ff_l2_dir_map_on_d1_scanout),
               .dout(l2_dir_map_on_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 


 
 
// miss buffer cam match 
assign	mb_cam_hit_vec_c1 = ( mb_cam_match_idx &         // BS & SR 11/04/03, MB grows to 32
				{32{(l2_dir_map_on_d1 & ~arbdec_pf_ice_inst_c1)}} ) | 
                                    // dont look at mb_cam_match_idx for prefetch ICE in dmap mode
                                    // fix for bug 103065
			     mb_cam_match  ; 
 
// C1-C3 addr match. 
assign	misbuf_c1c3_match_c1 = ( arbadr_idx_c1c3comp_c1 &  
				l2_dir_map_on_d1 & ~arbdec_pf_ice_inst_c1 ) | 
                                    // dont look at mb_cam_match_idx for prefetch ICE in dmap mode
				arbadr_arbdp_addr_c1c3comp_c1 ; 
 
 
// C1-c2 addr match. 
assign	misbuf_c1c2_match_c1 = ( arbadr_idx_c1c2comp_c1 &  
				l2_dir_map_on_d1 & ~arbdec_pf_ice_inst_c1) | 
                                    // dont look at mb_cam_match_idx for prefetch ICE in dmap mode
				arbadr_arbdp_addr_c1c2comp_c1 ; 
 
assign	cam_hit_vec_c1 = ( mb_cam_hit_vec_c1 & mb_valid ); // addr or idx match 
assign	cam_idx_hit_vec_c1 = ( mb_cam_match_idx & mb_valid );  // idx match only 
 
// turn off hits for a C3 delete and a C2  
// inst from the miss buffer ( speculating that it will cause 
// a deletion ). 
 
assign	mbissue_inst_vld_c2 = ( arbdec_arbdp_inst_mb_c2 &  
			arb_misbuf_inst_vld_c2 ) ; 
 
assign	hit_off_bypass_vec_c1 =  
			( dec_mb_entry_c3 & {32{mbf_delete_c3_tmp}} ) | // entry dequeued in C3  // BS & SR 11/04/03, MB grows to 32
    			( dec_mb_entry_c2 & {32{mbissue_inst_vld_c2}}) ; // entry from C2 if from mb 
 
// turn on hits for a insert in C3. 
 
assign	hit_on_bypass_vec_c1 = ( {32{misbuf_c1c3_match_c1}}  // not qualified with inst vlds. 
				& mb_tag_wr_wl_c3_tmp )  ;  // BS & SR 11/04/03, MB grows to 32
 
assign	idx_on_bypass_vec_c1 = ({32{arbadr_idx_c1c3comp_c1 }}  
				& mb_tag_wr_wl_c3_tmp ) ;  // BS & SR 11/04/03, MB grows to 32
 
assign	tmp_cam_hit_vec_c1 = ( cam_hit_vec_c1 |  
				hit_on_bypass_vec_c1 ) &  
				~hit_off_bypass_vec_c1 ; 
 
assign	tmp_idx_hit_vec_c1 = ( cam_idx_hit_vec_c1 |  
				idx_on_bypass_vec_c1 ) &  
				~hit_off_bypass_vec_c1 ; 
 
 
//assign	tmp_cam_hit_c1_3to0 = |( tmp_cam_hit_vec_c1[3:0] ) ; 
//assign	tmp_cam_hit_c1_7to4 = |( tmp_cam_hit_vec_c1[7:4] ) ; 
//assign	tmp_cam_hit_c1_11to8 = |( tmp_cam_hit_vec_c1[11:8] ) ; 
//assign	tmp_cam_hit_c1_15to12 = |( tmp_cam_hit_vec_c1[15:12] ) ; 
//// BS & SR 11/04/03, MB grows to 32
//assign	tmp_cam_hit_c1_19to16 = |( tmp_cam_hit_vec_c1[19:16] ) ; 
//assign	tmp_cam_hit_c1_23to20 = |( tmp_cam_hit_vec_c1[23:20] ) ; 
//assign	tmp_cam_hit_c1_27to24 = |( tmp_cam_hit_vec_c1[27:24] ) ; 
//assign	tmp_cam_hit_c1_31to28 = |( tmp_cam_hit_vec_c1[31:28] ) ; 
// 
// 
//msff_ctl_macro ff_tmp_cam_hit_c2_3to0 (width=1)
//                           (.din(tmp_cam_hit_c1_3to0),  
//				.scan_in(ff_tmp_cam_hit_c2_3to0_scanin),
//				.scan_out(ff_tmp_cam_hit_c2_3to0_scanout),
//				.l1clk(l1clk),  
//		.dout(tmp_cam_hit_c2_3to0),  
//); 
// 
//msff_ctl_macro ff_tmp_cam_hit_c1_7to4 (width=1)
//                           (.din(tmp_cam_hit_c1_7to4),  
//				.scan_in(ff_tmp_cam_hit_c1_7to4_scanin),
//				.scan_out(ff_tmp_cam_hit_c1_7to4_scanout),
//				.l1clk(l1clk),  
//		.dout(tmp_cam_hit_c2_7to4),  
//); 
// 
//msff_ctl_macro ff_tmp_cam_hit_c2_11to8 (width=1)
//                           (.din(tmp_cam_hit_c1_11to8),  
//				.scan_in(ff_tmp_cam_hit_c2_11to8_scanin),
//				.scan_out(ff_tmp_cam_hit_c2_11to8_scanout),
//				.l1clk(l1clk),  
//		.dout(tmp_cam_hit_c2_11to8),  
//); 
// 
//msff_ctl_macro ff_tmp_cam_hit_c2_15to12 (width=1)
//                           (.din(tmp_cam_hit_c1_15to12),  
//				.scan_in(ff_tmp_cam_hit_c2_15to12_scanin),
//				.scan_out(ff_tmp_cam_hit_c2_15to12_scanout),
//				.l1clk(l1clk),  
//		.dout(tmp_cam_hit_c2_15to12),  
//); 
//
//// BS & SR 11/04/03, MB grows to 32
//msff_ctl_macro ff_tmp_cam_hit_c2_19to16 (width=1)
//	(
//	.scan_in(ff_tmp_cam_hit_c2_19to16_scanin),
//	.scan_out(ff_tmp_cam_hit_c2_19to16_scanout),
//	.din(tmp_cam_hit_c1_19to16),
//	.l1clk(l1clk),
//	.dout(tmp_cam_hit_c2_19to16),
//	
//);
//
//msff_ctl_macro ff_tmp_cam_hit_c2_23to20 (width=1)
//        (
//        .scan_in(ff_tmp_cam_hit_c2_23to20_scanin),
//        .scan_out(ff_tmp_cam_hit_c2_23to20_scanout),
//        .din(tmp_cam_hit_c1_23to20),
//        .l1clk(l1clk),
//        .dout(tmp_cam_hit_c2_23to20),
//        
//);
//
//msff_ctl_macro ff_tmp_cam_hit_c2_27to24 (width=1)
//        (
//        .scan_in(ff_tmp_cam_hit_c2_27to24_scanin),
//        .scan_out(ff_tmp_cam_hit_c2_27to24_scanout),
//        .din(tmp_cam_hit_c1_27to24),
//        .l1clk(l1clk),
//        .dout(tmp_cam_hit_c2_27to24),
//        
//);
//
//
//msff_ctl_macro ff_tmp_cam_hit_c2_31to28 (width=1)
//        (
//        .scan_in(ff_tmp_cam_hit_c2_31to28_scanin),
//        .scan_out(ff_tmp_cam_hit_c2_31to28_scanout),
//        .din(tmp_cam_hit_c1_31to28),
//        .l1clk(l1clk),
//        .dout(tmp_cam_hit_c2_31to28),
//        
//);

 
l2t_misbuf_ctl_msff_ctl_macro__width_32 ff_tmp_cam_hit_vec_c2  	// BS & SR 11/04/03, MB grows to 32
                           (.din(tmp_cam_hit_vec_c1[31:0]),  
				.scan_in(ff_tmp_cam_hit_vec_c2_scanin),
				.scan_out(ff_tmp_cam_hit_vec_c2_scanout),
				.l1clk(l1clk),  
				.dout(tmp_cam_hit_vec_c2[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
				 
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_32 ff_tmp_idx_hit_vec_c2  	// BS & SR 11/04/03, MB grows to 32
                           (.din(tmp_idx_hit_vec_c1[31:0]),  
				.scan_in(ff_tmp_idx_hit_vec_c2_scanin),
				.scan_out(ff_tmp_idx_hit_vec_c2_scanout),
				.l1clk(l1clk),  
				.dout(tmp_idx_hit_vec_c2[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
				 
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_c1c2_match_c1_d1 
                           (.din(misbuf_c1c2_match_c1),  
				.scan_in(ff_misbuf_c1c2_match_c1_d1_scanin),
				.scan_out(ff_misbuf_c1c2_match_c1_d1_scanout),
				.l1clk(l1clk),  
				.dout(misbuf_c1c2_match_c1_d1),
  .siclk(siclk),
  .soclk(soclk)  
				 
); 
 
l2t_misbuf_ctl_msff_ctl_macro__dmsff_32x__width_2 ff_misbuf_c1c2_match_c1_d1_1 
                           (.din({2{misbuf_c1c2_match_c1}}),  
				.scan_in(ff_misbuf_c1c2_match_c1_d1_1_scanin),
				.scan_out(ff_misbuf_c1c2_match_c1_d1_1_scanout),
				.l1clk(l1clk),  
				.dout({misbuf_c1c2_match_c1_d1_1_clone,misbuf_c1c2_match_c1_d1_1}),
  .siclk(siclk),
  .soclk(soclk)  
				 
); 
 
 
l2t_misbuf_ctl_msff_ctl_macro__dmsff_32x__width_2 ff_mb_hit_off_c1_d1 
                           (.din({2{arb_misbuf_hit_off_c1}}), .l1clk(l1clk),  
		.scan_in(ff_mb_hit_off_c1_d1_scanin),
		.scan_out(ff_mb_hit_off_c1_d1_scanout),
		.dout({mb_hit_off_c1_d1_clone,mb_hit_off_c1_d1}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
///////////////////////// 
// HIt generation  
///////////////////////// 
 
assign	hit_vec_qual = ~mb_hit_off_c1_d1 & arb_misbuf_inst_vld_c2 ; 
 
assign	misbuf_hit_vec_c2 = {32{hit_vec_qual}} &  // BS & SR 11/04/03, MB grows to 32
		( tmp_cam_hit_vec_c2  | // cam hit + c3 byp 
		( {32{misbuf_c1c2_match_c1_d1}} &  mb_tag_wr_wl_c3_tmp )| // C2 insert byp 
		( {32{misbuf_c1c2_match_c1_d1 & mb_inst_vld_c3_1 & 
		inst_mb_c3 &  ~mbf_delete_c3_tmp}} & dec_mb_entry_c3 ) ) ;	// C2 not delete bypass. 
 
l2t_misbuf_ctl_msff_ctl_macro__width_32 ff_misbuf_hit_vec_c3 	// BS & SR 11/04/03, MB grows to 32
                           (.din(misbuf_hit_vec_c2[31:0]), .l1clk(l1clk),  
		.scan_in(ff_misbuf_hit_vec_c3_scanin),
		.scan_out(ff_misbuf_hit_vec_c3_scanout),
		.dout(misbuf_hit_vec_c3[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 // BS & SR 11/04/03, MB grows to 32 
//assign	tmp_cam_hit_c2 = ( tmp_cam_hit_c2_3to0 | tmp_cam_hit_c2_7to4 | 
//		tmp_cam_hit_c2_11to8 | tmp_cam_hit_c2_15to12 |
//		tmp_cam_hit_c2_19to16  | tmp_cam_hit_c2_23to20 | 
//		tmp_cam_hit_c2_27to24 | tmp_cam_hit_c2_31to28); 
// 

  assign tmp_cam_hit_c2_or_all = |(tmp_cam_hit_vec_c1[31:0]);

// this signal is going to be critical. 
assign	tmp_hit_unqual_c2 =  
		( misbuf_c1c2_match_c1_d1_1 & mbf_insert_c3_tmp_1 ) | // C2 insert bypass 
		( misbuf_c1c2_match_c1_d1_1 & inst_mb_c3_2 & mb_inst_vld_c3_2 & 
		 ~mbf_delete_c3_tmp_1 ) ; // C2 not delete bypass   

// LOGIC CLONED comPletely do not tap it off

assign  tmp_hit_unqual_c2_cloned =
                ( misbuf_c1c2_match_c1_d1_1_clone & mbf_insert_c3_tmp_1_clone ) | // C2 insert bypass
                ( misbuf_c1c2_match_c1_d1_1_clone & inst_mb_c3_2_clone & mb_inst_vld_c3_2_clone &
                 ~mbf_delete_c3_tmp_1_clone ) ; // C2 not delete bypass

// Isolated load for this.
assign	misbuf_tag_hit_unqual_c2 = (  tmp_hit_unqual_c2_cloned  | tmp_cam_hit_c2_clone ) & ~mb_hit_off_c1_d1_clone ;  // cam hit + c3 bypass 

assign	misbuf_tag_hit_unqual_c2_internal  = (  tmp_hit_unqual_c2  | tmp_cam_hit_c2 ) & ~mb_hit_off_c1_d1 ;  // cam hit + c3 bypass 
 
assign	misbuf_hit_c2 =  misbuf_tag_hit_unqual_c2_internal  & arb_misbuf_inst_vld_c2 ; 
 
///////////////////////// 
// IDX HIt generation  
// used for generating mbfull 
///////////////////////// 
 
l2t_misbuf_ctl_msff_ctl_macro__dmsff_32x__width_3 ff_idx_c1c2comp_c1_d1  
	(
	.scan_in(ff_idx_c1c2comp_c1_d1_scanin),
	.scan_out(ff_idx_c1c2comp_c1_d1_scanout),
	.din({tmp_cam_hit_c2_or_all,tmp_cam_hit_c2_or_all,arbadr_idx_c1c2comp_c1}), 
     	.l1clk(l1clk), 
     	.dout({tmp_cam_hit_c2_clone,tmp_cam_hit_c2,arbadr_idx_c1c2comp_c1_d1}),
  .siclk(siclk),
  .soclk(soclk) 
	);



 
assign	idx_hit_vec_qual = ~mb_hit_off_c1_d1 & arb_misbuf_inst_vld_c2 ; 
 
assign	misbuf_idx_hit_vec_c2 = {32{idx_hit_vec_qual}} & // BS & SR 11/04/03, MB grows to 32
		(   tmp_idx_hit_vec_c2 | 	// cam hit + c3 byp 
		( {32{arbadr_idx_c1c2comp_c1_d1}} & mb_tag_wr_wl_c3_tmp )| // C2 insert byp 
		( {32{arbadr_idx_c1c2comp_c1_d1 & mb_inst_vld_c3_1 & 
		 inst_mb_c3 &  ~mbf_delete_c3_tmp}} & dec_mb_entry_c3 )) ;// C2 not delete bypass. 
 
l2t_misbuf_ctl_msff_ctl_macro__width_32 ff_misbuf_idx_hit_vec_c3 
                           (.din(misbuf_idx_hit_vec_c2[31:0]), .l1clk(l1clk),  
		.scan_in(ff_misbuf_idx_hit_vec_c3_scanin),
		.scan_out(ff_misbuf_idx_hit_vec_c3_scanout),
		.dout(misbuf_idx_hit_vec_c3[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 

assign misbuf_idx_hit_vec_c3_fnl = misbuf_idx_hit_vec_c3 & mb_young; 
 
///////////////////////// 
// Adder to add 32 bits from 
// hit_vec_c3 
///////////////////////// 
 
 
 
///////////////////////////// 
// STAGE1 
//////////////////////////// 
adder_1b	bit0_2( 
                 // Outputs 
                 .cout                  (cout1[1]), 
                 .sum                   (cout1[0]), 
                 // Inputs 
                 .oper1                 (misbuf_idx_hit_vec_c3_fnl[0]), 
                 .oper2                 (misbuf_idx_hit_vec_c3_fnl[1]), 
                 .cin                   (misbuf_idx_hit_vec_c3_fnl[2])); 
 
adder_1b	bit3_5( 
                 // Outputs 
                 .cout                  (cout2[1]), 
                 .sum                   (cout2[0]), 
                 // Inputs 
                 .oper1                 (misbuf_idx_hit_vec_c3_fnl[3]), 
                 .oper2                 (misbuf_idx_hit_vec_c3_fnl[4]), 
                 .cin                   (misbuf_idx_hit_vec_c3_fnl[5])); 
 
adder_1b	bit6_8( 
                 // Outputs 
                 .cout                  (cout3[1]), 
                 .sum                   (cout3[0]), 
                 // Inputs 
                 .oper1                 (misbuf_idx_hit_vec_c3_fnl[6]), 
                 .oper2                 (misbuf_idx_hit_vec_c3_fnl[7]), 
                 .cin                   (misbuf_idx_hit_vec_c3_fnl[8])); 
 
adder_1b	bit9_11( 
                 // Outputs 
                 .cout                  (cout4[1]), 
                 .sum                   (cout4[0]), 
                 // Inputs 
                 .oper1                 (misbuf_idx_hit_vec_c3_fnl[9]), 
                 .oper2                 (misbuf_idx_hit_vec_c3_fnl[10]), 
                 .cin                   (misbuf_idx_hit_vec_c3_fnl[11])); 
 
adder_1b	bit12_14( 
                 // Outputs 
                 .cout                  (cout5[1]), 
                 .sum                   (cout5[0]), 
                 // Inputs 
                 .oper1                 (misbuf_idx_hit_vec_c3_fnl[12]), 
                 .oper2                 (misbuf_idx_hit_vec_c3_fnl[13]), 
                 .cin                   (misbuf_idx_hit_vec_c3_fnl[14])); 

// BS & SR 11/04/03, MB grows to 32

adder_1b        bit15_17(
                 // Outputs
                 .cout                  (cout6[1]),
                 .sum                   (cout6[0]),
                 // Inputs
                 .oper1                 (misbuf_idx_hit_vec_c3_fnl[15]),
                 .oper2                 (misbuf_idx_hit_vec_c3_fnl[16]),
                 .cin                   (misbuf_idx_hit_vec_c3_fnl[17]));

adder_1b        bit18_20(
                 // Outputs
                 .cout                  (cout7[1]),
                 .sum                   (cout7[0]),
                 // Inputs
                 .oper1                 (misbuf_idx_hit_vec_c3_fnl[18]),
                 .oper2                 (misbuf_idx_hit_vec_c3_fnl[19]),
                 .cin                   (misbuf_idx_hit_vec_c3_fnl[20]));

adder_1b        bit21_23(
                 // Outputs
                 .cout                  (cout8[1]),
                 .sum                   (cout8[0]),
                 // Inputs
                 .oper1                 (misbuf_idx_hit_vec_c3_fnl[21]),
                 .oper2                 (misbuf_idx_hit_vec_c3_fnl[22]),
                 .cin                   (misbuf_idx_hit_vec_c3_fnl[23]));

adder_1b        bit24_26(
                 // Outputs
                 .cout                  (cout9[1]),
                 .sum                   (cout9[0]),
                 // Inputs
                 .oper1                 (misbuf_idx_hit_vec_c3_fnl[24]),
                 .oper2                 (misbuf_idx_hit_vec_c3_fnl[25]),
                 .cin                   (misbuf_idx_hit_vec_c3_fnl[26]));

adder_1b        bit27_29(
                 // Outputs
                 .cout                  (cout10[1]),
                 .sum                   (cout10[0]),
                 // Inputs
                 .oper1                 (misbuf_idx_hit_vec_c3_fnl[27]),
                 .oper2                 (misbuf_idx_hit_vec_c3_fnl[28]),
                 .cin                   (misbuf_idx_hit_vec_c3_fnl[29]));


 
///////////////////////////// 
// STAGE2 
//////////////////////////// 
 
 
adder_2b	bits0_5( 
                  // Outputs 
                  .sum                  (cout2_1[1:0]), 
                  .cout                 (cout2_1[2]), 
                  // Inputs 
                  .oper1                (cout1[1:0]), 
                  .oper2                (cout2[1:0]), 
                  .cin                  (1'b0)); 
 
 
adder_2b	bits6_11( 
                  // Outputs 
                  .sum                  (cout2_2[1:0]), 
                  .cout                 (cout2_2[2]), 
                  // Inputs 
                  .oper1                (cout3[1:0]), 
                  .oper2                (cout4[1:0]), 
                  .cin                  (1'b0)); 

// BS & SR 11/04/03, MB grows to 32 
 
adder_2b	bits12_17( 
                  // Outputs 
                  .sum                  (cout2_3[1:0]), 
                  .cout                 (cout2_3[2]), 
                  // Inputs 
                  .oper1                (cout5[1:0]), 
                  .oper2                (cout6[1:0]), 
                  .cin                  (1'b0)); 

adder_2b        bits18_23(
                  // Outputs
                  .sum                  (cout2_4[1:0]),
                  .cout                 (cout2_4[2]),
                  // Inputs
                  .oper1                (cout7[1:0]),
                  .oper2                (cout8[1:0]),
                  .cin                  (misbuf_idx_hit_vec_c3_fnl[30]));

adder_2b        bits24_29(
                  // Outputs
                  .sum                  (cout2_5[1:0]),
                  .cout                 (cout2_5[2]),
                  // Inputs
                  .oper1                (cout9[1:0]),
                  .oper2                (cout10[1:0]),
                  .cin                  (misbuf_idx_hit_vec_c3_fnl[31]));


///////////////////////////// 
// STAGE3 
//////////////////////////// 

 
adder_3b	bits0_11( 
                   // Outputs 
                   .sum                 (cout3_1[2:0]), 
                   .cout                (cout3_1[3]), 
                   // Inputs 
                   .oper1               (cout2_1[2:0]), 
                   .oper2               (cout2_2[2:0]), 
                   .cin                 (1'b0)); 

adder_3b        bits12_23(
                   // Outputs
                   .sum                 (cout3_2[2:0]),
                   .cout                (cout3_2[3]),
                   // Inputs
                   .oper1               (cout2_3[2:0]),
                   .oper2               (cout2_4[2:0]),
                   .cin                 (1'b0));

 
///////////////////////////// 
// STAGE4 
//////////////////////////// 
 
adder_4b        bits0_23( 
                   // Outputs 
                   .sum                 (cout4_1[3:0]), 
                   .cout                (cout4_1[4]), 
                   // Inputs 
                   .oper1               (cout3_1[3:0]), 
                   .oper2               (cout3_2[3:0]), 
                   .cin                 (1'b0)); 

/////////////////////////////
// STAGE5
////////////////////////////

adder_5b        bits0_31(
                   // Outputs
                   .sum                 (cout5_1[4:0]),
                   .cout                (cout5_1[5]),
                   // Inputs
                   .oper1               (cout4_1[4:0]),
                   .oper2               ({2'b0,cout2_5[2:0]}),
                   .cin                 (1'b0));

 
////////////////////////////////////////////////////////////////////////////// 
// If an instruction encounters 11 or more hits in the Miss buffer to the 
// same index, the pipe is stalled and miss buffer full is asserted by 
// arb until the miss buffer count drops to 11 
////////////////////////////////////////////////////////////////////////////// 
 
l2t_misbuf_ctl_msff_ctl_macro__width_6 ff_hit_count_c4 
                           (.din(cout5_1[5:0]), .l1clk(l1clk),  
			.scan_in(ff_hit_count_c4_scanin),
			.scan_out(ff_hit_count_c4_scanout),
			.dout(hit_count_c4[5:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// hit count = 11 or greater 
// BS & SR 11/04/03, MB grows to 32
assign	set_mb_idx_full_c4 = hit_count_c4[5] | hit_count_c4[4] | (hit_count_c4[3] & hit_count_c4[2]) | 
		(hit_count_c4[3] & ~hit_count_c4[2] & hit_count_c4[1] & hit_count_c4[0] );
 
// miss buffer count is 11 or less  
assign  reset_mb_idx_full_c4 = ~mb_count_c4[4] & ~mb_count_c4[5] & // BS & SR 11/04/03, MB grows to 32
				~(mb_count_c4[3] & mb_count_c4[2]); // BS & SR 11/04/03, MB grows to 32
 
 
assign	mb_idx_count_full_c4 = ( mb_idx_count_full_c5 |  
			set_mb_idx_full_c4 ) 
			& ~reset_mb_idx_full_c4  ; 
 
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_1 ff_mb_idx_count_full_c5  // sync reset active low
                           (.din(mb_idx_count_full_c4), .l1clk(l1clk),  
			.scan_in(ff_mb_idx_count_full_c5_scanin),
			.scan_out(ff_mb_idx_count_full_c5_scanout),
			.dout(mb_idx_count_full_c5),   
			.clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk)); 
 
 
 
 
////////////////////////////////////////////////////////////////////////////// 
// mbdata Insertion  
// Write the miss Buffer data array in the C9 cycle of the  following types of 
// instructions: 
// 1) Miss Buffer instruction that is not deleted in C3 
// 2) Iq instr instruction that is inserted in the Miss Buffer. 
////////////////////////////////////////////////////////////////////////////// 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_inst_mb_c3 
                           (.din(arbdec_arbdp_inst_mb_c2), .l1clk(l1clk),  
			.scan_in(ff_inst_mb_c3_scanin),
			.scan_out(ff_inst_mb_c3_scanout),
			.dout(inst_mb_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__dmsff_32x__width_2 ff_inst_mb_c3_2 
                           (.din({2{arbdec_arbdp_inst_mb_c2}}), .l1clk(l1clk),  
			.scan_in(ff_inst_mb_c3_2_scanin),
			.scan_out(ff_inst_mb_c3_2_scanout),
			.dout({inst_mb_c3_2_clone,inst_mb_c3_2}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mb_inst_vld_c3 
                           (.din(arb_misbuf_inst_vld_c2), .l1clk(l1clk),  
			.scan_in(ff_mb_inst_vld_c3_scanin),
			.scan_out(ff_mb_inst_vld_c3_scanout),
			.dout(mb_inst_vld_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mb_inst_vld_c3_1 
                           (.din(arb_misbuf_inst_vld_c2), .l1clk(l1clk),  
			.scan_in(ff_mb_inst_vld_c3_1_scanin),
			.scan_out(ff_mb_inst_vld_c3_1_scanout),
			.dout(mb_inst_vld_c3_1),
  .siclk(siclk),
  .soclk(soclk)  
); 


l2t_misbuf_ctl_msff_ctl_macro__width_6 ff_mb_inst_vld_staging 
	(
	.scan_in(ff_mb_inst_vld_staging_scanin),
	.scan_out(ff_mb_inst_vld_staging_scanout),
	.dout	({misbuf_inst_c4,misbuf_inst_c5,misbuf_inst_c52,misbuf_inst_c6,misbuf_inst_c7,misbuf_inst_c8}),
	.din	({inst_mb_c3,misbuf_inst_c4,misbuf_inst_c5,misbuf_inst_c52,misbuf_inst_c6,misbuf_inst_c7}),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


 
l2t_misbuf_ctl_msff_ctl_macro__dmsff_32x__width_2 ff_mb_inst_vld_c3_2 
        (
	.scan_in(ff_mb_inst_vld_c3_2_scanin),
	.scan_out(ff_mb_inst_vld_c3_2_scanout),
	.din({2{arb_misbuf_inst_vld_c2}}), .l1clk(l1clk),  
	.dout({mb_inst_vld_c3_2_clone,mb_inst_vld_c3_2}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	mb_rewrite_en_c3 =  (  inst_mb_c3 &   
				~mbf_delete_c3 & 
                                 mb_inst_vld_c3_1 ) ; 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mb_rewrite_en_c4 
                           (.din(mb_rewrite_en_c3), .l1clk(l1clk),  
			.scan_in(ff_mb_rewrite_en_c4_scanin),
			.scan_out(ff_mb_rewrite_en_c4_scanout),
			.dout(mb_rewrite_en_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mb_rewrite_en_c5 
                           (.din(mb_rewrite_en_c4), .l1clk(l1clk),  
			.scan_in(ff_mb_rewrite_en_c5_scanin),
			.scan_out(ff_mb_rewrite_en_c5_scanout),
			.dout(mb_rewrite_en_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mb_rewrite_en_c52 
                           (.din(mb_rewrite_en_c5), .l1clk(l1clk),
                        .scan_in(ff_mb_rewrite_en_c52_scanin),
                        .scan_out(ff_mb_rewrite_en_c52_scanout),
                        .dout(mb_rewrite_en_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mb_rewrite_en_c6 
                           (.din(mb_rewrite_en_c52), .l1clk(l1clk),  
			.scan_in(ff_mb_rewrite_en_c6_scanin),
			.scan_out(ff_mb_rewrite_en_c6_scanout),
			.dout(mb_rewrite_en_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mb_rewrite_en_c7 
                           (.din(mb_rewrite_en_c6), .l1clk(l1clk),  
			.scan_in(ff_mb_rewrite_en_c7_scanin),
			.scan_out(ff_mb_rewrite_en_c7_scanout),
			.dout(mb_rewrite_en_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mb_rewrite_en_c8 
                           (.din(mb_rewrite_en_c7), .l1clk(l1clk),  
			.scan_in(ff_mb_rewrite_en_c8_scanin),
			.scan_out(ff_mb_rewrite_en_c8_scanout),
			.dout(mb_rewrite_en_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	mbdata_wr_en_c3 = ( mbf_insert_c3 | mb_rewrite_en_c3 ) ; 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbdata_wr_en_c4 
                           (.din(mbdata_wr_en_c3), .l1clk(l1clk),  
			.scan_in(ff_mbdata_wr_en_c4_scanin),
			.scan_out(ff_mbdata_wr_en_c4_scanout),
			.dout(mbdata_wr_en_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbdata_wr_en_c5 
                           (.din(mbdata_wr_en_c4), .l1clk(l1clk),  
			.scan_in(ff_mbdata_wr_en_c5_scanin),
			.scan_out(ff_mbdata_wr_en_c5_scanout),
			.dout(mbdata_wr_en_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbdata_wr_en_c52 
                           (.din(mbdata_wr_en_c5), .l1clk(l1clk),
                        .scan_in(ff_mbdata_wr_en_c52_scanin),
                        .scan_out(ff_mbdata_wr_en_c52_scanout),
                        .dout(mbdata_wr_en_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbdata_wr_en_c6 
                           (.din(mbdata_wr_en_c52), .l1clk(l1clk),  
			.scan_in(ff_mbdata_wr_en_c6_scanin),
			.scan_out(ff_mbdata_wr_en_c6_scanout),
			.dout(mbdata_wr_en_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbdata_wr_en_c7 
                           (.din(mbdata_wr_en_c6), .l1clk(l1clk),  
			.scan_in(ff_mbdata_wr_en_c7_scanin),
			.scan_out(ff_mbdata_wr_en_c7_scanout),
			.dout(mbdata_wr_en_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbdata_wr_en_c8 
                           (.din(mbdata_wr_en_c7), .l1clk(l1clk),  
			.scan_in(ff_mbdata_wr_en_c8_scanin),
			.scan_out(ff_mbdata_wr_en_c8_scanout),
			.dout(misbuf_mbdata_wr_en_c8_fnl),
  .siclk(siclk),
  .soclk(soclk)  
); 

assign misbuf_mbdata_wr_en_c8 = l2t_mb2_run_r1 ? l2t_mb2_mbdata_wr_en_r2 : misbuf_mbdata_wr_en_c8_fnl;
 
 
////////////////////////////////////////////////////////////////////////////// 
// mbdata wr wordline  
// The wordline chosen for a write into MBDATA is either of the following 
// * wordline that just got inserted. 
// * wordline that just got reinserted 
// * Wordline of the dependent instruction ( Used only to RDY a  CAS2 instruction 
//  and not to write into mbdata ) 
////////////////////////////////////////////////////////////////////////////// 
 
// BS & SR 11/04/03, MB grows to 32
assign  enc_tag_wr_wl_c2[0] = ( mb_write_ptr_c2[1] | mb_write_ptr_c2[3] | 
                                mb_write_ptr_c2[5] | mb_write_ptr_c2[7] | 
                                mb_write_ptr_c2[9] | mb_write_ptr_c2[11] | 
                                mb_write_ptr_c2[13] | mb_write_ptr_c2[15] |
				mb_write_ptr_c2[17] | mb_write_ptr_c2[19] |
				mb_write_ptr_c2[21] | mb_write_ptr_c2[23] |
				mb_write_ptr_c2[25] | mb_write_ptr_c2[27] |
				mb_write_ptr_c2[27]  | mb_write_ptr_c2[29]|
				mb_write_ptr_c2[31]
                               ); 
 
assign  enc_tag_wr_wl_c2[1] = ( mb_write_ptr_c2[2] | mb_write_ptr_c2[3] | 
                                mb_write_ptr_c2[6] | mb_write_ptr_c2[7] | 
                                mb_write_ptr_c2[10] | mb_write_ptr_c2[11] | 
                                mb_write_ptr_c2[14] | mb_write_ptr_c2[15] |
                                mb_write_ptr_c2[18] | mb_write_ptr_c2[19] |
                                mb_write_ptr_c2[22] | mb_write_ptr_c2[23] |
                                mb_write_ptr_c2[26] | mb_write_ptr_c2[27] |
                                mb_write_ptr_c2[30] | mb_write_ptr_c2[31] 
                                        ); 
 
assign  enc_tag_wr_wl_c2[2] = ( mb_write_ptr_c2[4] | mb_write_ptr_c2[5] | 
                                mb_write_ptr_c2[6] | mb_write_ptr_c2[7] | 
                                mb_write_ptr_c2[12] | mb_write_ptr_c2[13] | 
                                mb_write_ptr_c2[14] | mb_write_ptr_c2[15] |
                                mb_write_ptr_c2[20] | mb_write_ptr_c2[21] |
                                mb_write_ptr_c2[22] | mb_write_ptr_c2[23] |
                                mb_write_ptr_c2[28] | mb_write_ptr_c2[29] |
                                mb_write_ptr_c2[30] | mb_write_ptr_c2[31] 
                                ); 
 
assign  enc_tag_wr_wl_c2[3] = ( mb_write_ptr_c2[8] | mb_write_ptr_c2[9] | 
                                mb_write_ptr_c2[10] | mb_write_ptr_c2[11] | 
                                mb_write_ptr_c2[12] | mb_write_ptr_c2[13] | 
                                mb_write_ptr_c2[14] | mb_write_ptr_c2[15] |
                                mb_write_ptr_c2[24] | mb_write_ptr_c2[25] |
                                mb_write_ptr_c2[26] | mb_write_ptr_c2[27] |
                                mb_write_ptr_c2[28] | mb_write_ptr_c2[29] |
                                mb_write_ptr_c2[30] | mb_write_ptr_c2[31]);

assign  enc_tag_wr_wl_c2[4] = ( mb_write_ptr_c2[16] | mb_write_ptr_c2[17] |
                                mb_write_ptr_c2[18] | mb_write_ptr_c2[19] |
                                mb_write_ptr_c2[20] | mb_write_ptr_c2[21] |
                                mb_write_ptr_c2[22] | mb_write_ptr_c2[23] |
                                mb_write_ptr_c2[24] | mb_write_ptr_c2[25] |
                                mb_write_ptr_c2[26] | mb_write_ptr_c2[27] |
                                mb_write_ptr_c2[28] | mb_write_ptr_c2[29] |
                                mb_write_ptr_c2[30] | mb_write_ptr_c2[31]);

 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_enc_tag_wr_wl_c3  // BS & SR 11/04/03, MB grows to 32
                           (.din(enc_tag_wr_wl_c2[4:0]), .l1clk(l1clk),  
			.scan_in(ff_enc_tag_wr_wl_c3_scanin),
			.scan_out(ff_enc_tag_wr_wl_c3_scanout),
			.dout(enc_tag_wr_wl_c3[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_5 mux_enc_data_wr_wl_c3   // BS & SR 11/04/03, MB grows to 32
			(.dout(enc_data_wr_wl_c3[4:0]), 
                                .din0(enc_tag_wr_wl_c3[4:0]), // inserting entry in C3 
                                .din1(mb_entry_c3[4:0]), // reinserting entry in C3 
                                .din2(misbuf_next_link_c3[4:0]),// depdendent of C3 instruction 
                                .sel0(mbf_insert_c3), 
                                .sel1(mb_rewrite_en_c3), 
                                .sel2(~mbdata_wr_en_c3)); 
 
 
assign	misbuf_wbuf_mbid_c4 = enc_data_wr_wl_c4 ; 
 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_enc_data_wr_wl_c4  // BS & SR 11/04/03, MB grows to 32
                           (.din(enc_data_wr_wl_c3[4:0]), .l1clk(l1clk),  
			.scan_in(ff_enc_data_wr_wl_c4_scanin),
			.scan_out(ff_enc_data_wr_wl_c4_scanout),
			.dout(enc_data_wr_wl_c4[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_enc_data_wr_wl_c5  // BS & SR 11/04/03, MB grows to 32
                           (.din(enc_data_wr_wl_c4[4:0]), .l1clk(l1clk),  
			.scan_in(ff_enc_data_wr_wl_c5_scanin),
			.scan_out(ff_enc_data_wr_wl_c5_scanout),
			.dout(enc_data_wr_wl_c5[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_enc_data_wr_wl_c52  // BS & SR 11/04/03, MB grows to 32
                           (.din(enc_data_wr_wl_c5[4:0]), .l1clk(l1clk),
                        .scan_in(ff_enc_data_wr_wl_c52_scanin),
                        .scan_out(ff_enc_data_wr_wl_c52_scanout),
                        .dout(enc_data_wr_wl_c52[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_enc_data_wr_wl_c6  // BS & SR 11/04/03, MB grows to 32
                           (.din(enc_data_wr_wl_c52[4:0]), .l1clk(l1clk),  
			.scan_in(ff_enc_data_wr_wl_c6_scanin),
			.scan_out(ff_enc_data_wr_wl_c6_scanout),
			.dout(enc_data_wr_wl_c6[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_enc_data_wr_wl_c7  // BS & SR 11/04/03, MB grows to 32
                           (.din(enc_data_wr_wl_c6[4:0]), .l1clk(l1clk),  
			.scan_in(ff_enc_data_wr_wl_c7_scanin),
			.scan_out(ff_enc_data_wr_wl_c7_scanout),
			.dout(enc_data_wr_wl_c7[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_enc_data_wr_wl_c8  // BS & SR 11/04/03, MB grows to 32
                           (.din(enc_data_wr_wl_c7[4:0]), .l1clk(l1clk),  
			.scan_in(ff_enc_data_wr_wl_c8_scanin),
			.scan_out(ff_enc_data_wr_wl_c8_scanout),
			.dout(enc_data_wr_wl_c8[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_enc_data_wr_wl_c9  // BS & SR 11/04/03, MB grows to 32
                           (.din(enc_data_wr_wl_c8[4:0]), .l1clk(l1clk),  
			.scan_in(ff_enc_data_wr_wl_c9_scanin),
			.scan_out(ff_enc_data_wr_wl_c9_scanout),
			.dout(enc_data_wr_wl_c9[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// BS & SR 11/04/03, MB grows to 32

assign dec_low_insert_ptr[0] = ( enc_data_wr_wl_c8[1:0] == 2'd0 ); 
assign dec_low_insert_ptr[1] = ( enc_data_wr_wl_c8[1:0] == 2'd1 ); 
assign dec_low_insert_ptr[2] = ( enc_data_wr_wl_c8[1:0] == 2'd2 ); 
assign dec_low_insert_ptr[3] = ( enc_data_wr_wl_c8[1:0] == 2'd3 ); 

assign dec_hi_insert_ptr[0] = ( enc_data_wr_wl_c8[4:2] == 3'd0 ); 
assign dec_hi_insert_ptr[1] = ( enc_data_wr_wl_c8[4:2] == 3'd1 ); 
assign dec_hi_insert_ptr[2] = ( enc_data_wr_wl_c8[4:2] == 3'd2 ); 
assign dec_hi_insert_ptr[3] = ( enc_data_wr_wl_c8[4:2] == 3'd3 ); 
assign dec_hi_insert_ptr[4] = ( enc_data_wr_wl_c8[4:2] == 3'd4 ); 
assign dec_hi_insert_ptr[5] = ( enc_data_wr_wl_c8[4:2] == 3'd5 ); 
assign dec_hi_insert_ptr[6] = ( enc_data_wr_wl_c8[4:2] == 3'd6 ); 
assign dec_hi_insert_ptr[7] = ( enc_data_wr_wl_c8[4:2] == 3'd7 ); 
 
assign	insert_ptr_c8[0] = ( dec_hi_insert_ptr[0] &  dec_low_insert_ptr[0] ) ; 
assign	insert_ptr_c8[1] = ( dec_hi_insert_ptr[0] &  dec_low_insert_ptr[1] ) ; 
assign	insert_ptr_c8[2] = ( dec_hi_insert_ptr[0] &  dec_low_insert_ptr[2] ) ; 
assign	insert_ptr_c8[3] = ( dec_hi_insert_ptr[0] &  dec_low_insert_ptr[3] ) ; 
assign	insert_ptr_c8[4] = ( dec_hi_insert_ptr[1] &  dec_low_insert_ptr[0] ) ; 
assign	insert_ptr_c8[5] = ( dec_hi_insert_ptr[1] &  dec_low_insert_ptr[1] ) ; 
assign	insert_ptr_c8[6] = ( dec_hi_insert_ptr[1] &  dec_low_insert_ptr[2] ) ; 
assign	insert_ptr_c8[7] = ( dec_hi_insert_ptr[1] &  dec_low_insert_ptr[3] ) ; 
assign	insert_ptr_c8[8] = ( dec_hi_insert_ptr[2] &  dec_low_insert_ptr[0] ) ; 
assign	insert_ptr_c8[9] = ( dec_hi_insert_ptr[2] &  dec_low_insert_ptr[1] ) ; 
assign	insert_ptr_c8[10] = ( dec_hi_insert_ptr[2] &  dec_low_insert_ptr[2] ) ; 
assign	insert_ptr_c8[11] = ( dec_hi_insert_ptr[2] &  dec_low_insert_ptr[3] ) ; 
assign	insert_ptr_c8[12] = ( dec_hi_insert_ptr[3] &  dec_low_insert_ptr[0] ) ; 
assign	insert_ptr_c8[13] = ( dec_hi_insert_ptr[3] &  dec_low_insert_ptr[1] ) ; 
assign	insert_ptr_c8[14] = ( dec_hi_insert_ptr[3] &  dec_low_insert_ptr[2] ) ; 
assign	insert_ptr_c8[15] = ( dec_hi_insert_ptr[3] &  dec_low_insert_ptr[3] ) ; 
// BS & SR 11/04/03, MB grows to 32
assign	insert_ptr_c8[16] = ( dec_hi_insert_ptr[4] &  dec_low_insert_ptr[0] ) ; 
assign	insert_ptr_c8[17] = ( dec_hi_insert_ptr[4] &  dec_low_insert_ptr[1] ) ; 
assign	insert_ptr_c8[18] = ( dec_hi_insert_ptr[4] &  dec_low_insert_ptr[2] ) ; 
assign	insert_ptr_c8[19] = ( dec_hi_insert_ptr[4] &  dec_low_insert_ptr[3] ) ; 
assign	insert_ptr_c8[20] = ( dec_hi_insert_ptr[5] &  dec_low_insert_ptr[0] ) ; 
assign	insert_ptr_c8[21] = ( dec_hi_insert_ptr[5] &  dec_low_insert_ptr[1] ) ; 
assign	insert_ptr_c8[22] = ( dec_hi_insert_ptr[5] &  dec_low_insert_ptr[2] ) ; 
assign	insert_ptr_c8[23] = ( dec_hi_insert_ptr[5] &  dec_low_insert_ptr[3] ) ; 
assign	insert_ptr_c8[24] = ( dec_hi_insert_ptr[6] &  dec_low_insert_ptr[0] ) ; 
assign	insert_ptr_c8[25] = ( dec_hi_insert_ptr[6] &  dec_low_insert_ptr[1] ) ; 
assign	insert_ptr_c8[26] = ( dec_hi_insert_ptr[6] &  dec_low_insert_ptr[2] ) ; 
assign	insert_ptr_c8[27] = ( dec_hi_insert_ptr[6] &  dec_low_insert_ptr[3] ) ; 
assign	insert_ptr_c8[28] = ( dec_hi_insert_ptr[7] &  dec_low_insert_ptr[0] ) ; 
assign	insert_ptr_c8[29] = ( dec_hi_insert_ptr[7] &  dec_low_insert_ptr[1] ) ; 
assign	insert_ptr_c8[30] = ( dec_hi_insert_ptr[7] &  dec_low_insert_ptr[2] ) ; 
assign	insert_ptr_c8[31] = ( dec_hi_insert_ptr[7] &  dec_low_insert_ptr[3] ) ; 
 
 
assign  mb_data_wr_wl_c8  = insert_ptr_c8 & {32{misbuf_mbdata_wr_en_c8}} ; // BS & SR 11/04/03, MB grows to 32
//assign  misbuf_mb_data_write_wl = mb_data_wr_wl_c8 ;  
assign  misbuf_mb_data_write_wl = l2t_mb2_run_r1 ? mbtag_write_ptr[31:0] : mb_data_wr_wl_c8[31:0];
assign	misbuf_mbentry_c8 = enc_data_wr_wl_c8 ; 
 
////////////////////////////////////////////////////////////////////////////// 
// DEP bit is used by the st ack logic to send an ACK for a store issued 
// out of the Miss Buffer. 
//  
// THis bit is set 
// - if an ifetch or load not issued from the MB misses in L2. //BS and SR 11/07/03, store pipelining support
//   we set the DEP bit in such a case, so that a future store to the same address
//   sees that the load/ifetch's dep bit has been set and then sets its own DEP bit
//   and goes into the Miss Buffer. This avoids early caming and early store ack in the
//   case of store hit to outstanding load.
// - for a swap/cas2 not issued from the miss buffer 
// - if any instruction other than a store  instruction hits the Miss Buffer 
// - if a store instruction hits the Miss Buffer and DEP bit for at least one entry it hits 
//   against is a 1, BS and SR 11/07/03, store pipelining support
//   ( if DEP bits for all the entries the store hits against are 0's , then should not
//   ( set DEP bit. BS and SR 11/07/03, store pipelining support)
// - an instruction from the Miss Buffer encountering a tag par err. 
// - an instruction from the Miss Buffer with tecc=1 
// - an instruction from the IQ  encountering a tag parity error. 
// - an instruction from core/SIU encountering a VUAD SBE // VUAD ecc change
////////////////////////////////////////////////////////////////////////////// 
 
 
assign	misbuf_dep_inst_c2 =  misbuf_hit_c2 ; 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbf_dep_c3 
                           (.din(misbuf_dep_inst_c2), .l1clk(l1clk), 
             .scan_in(ff_mbf_dep_c3_scanin),
             .scan_out(ff_mbf_dep_c3_scanout),
             .dout(misbuf_dep_inst_c3_tmp),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// the following signal represents the DEP bit of an instr. 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_dep_inst_c3 
                           (.din(arbdec_arbdp_inst_dep_c2), .l1clk(l1clk), 
             .scan_in(ff_dep_inst_c3_scanin),
             .scan_out(ff_dep_inst_c3_scanout),
             .dout(dep_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// the following signal represents the TECC bit of an instr. 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_tecc_c3 
                           (.din(arb_tecc_c2), .l1clk(l1clk), 
             .scan_in(ff_tecc_c3_scanin),
             .scan_out(ff_tecc_c3_scanout),
             .dout(tecc_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 

//BS and SR 11/07/03, store pipelining support

assign set_dep_ldifetch_miss_c2 = ( arb_decdp_ld_inst_c2 | arb_decdp_imiss_inst_c2  | arb_decdp_cas1_inst_c2
                                    ) & tag_miss_unqual_c2;

//BS and SR 11/07/03, store pipelining support

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_set_dep_c2_ldifetch_miss_c2 
                           (.din(set_dep_ldifetch_miss_c2), .l1clk(l1clk),
             .scan_in(ff_set_dep_c2_ldifetch_miss_c2_scanin),
             .scan_out(ff_set_dep_c2_ldifetch_miss_c2_scanout),
             .dout(set_dep_ldifetch_miss_c3),
  .siclk(siclk),
  .soclk(soclk)  
);


assign  misbuf_dep_inst_c3 = (misbuf_dep_inst_c3_tmp & ~tag_store_inst_c3 & ~arb_pf_ice_inst_c3) |
             //if mbf hit and not a store instruction or Prefetch ICE instruction hit set DEP 
         ( misbuf_dep_inst_c3_tmp & tag_store_inst_c3 & mb_hit_dep_one) |
             // if mbf hit and  a store instruction hit set DEP only if at least one
             // of the DEP bits of the entries the store hits against is 1;
	(arb_vuad_ce_err_c3  & ~inst_mb_c3) |
	    // Set on vuad ce error for an instruction not issued from misbuf
         ( misbuf_dep_inst_c3_tmp & tag_store_inst_c3 & filbuf_match_c3 ) |
         // If an instruction hits in both filbuf and misbuf then 
         // there is a previous store to the same address and a pending fill to 
         // happen. In this case set the dep bit  : fix for bug 84674
         ( dep_inst_c3 & tag_misbuf_par_err_c3 & ~tag_hit_unqual_c3 ) | 
                            // if a tagpar do not reset DEP 
         ( dep_inst_c3 & tecc_c3 ) |  // if a tag scrub, do not reset DEP 
         ( dep_inst_c3 & arb_vuad_ce_err_c3) |  // if a VUAD CE on a dependant instruction, do not reset DEP
         ( ~inst_mb_c3 & tag_misbuf_par_err_c3  & ~tag_hit_unqual_c3) | // if a tagpar set DEP
         ( ~inst_mb_c3 & (set_dep_ldifetch_miss_c3 | arb_decdp_cas2_inst_c3 | arb_decdp_swap_inst_c3)) ;
                       // BS and SR 11/07/03, store pipelining support


//BS and SR 11/07/03, store pipelining support
// due to timing reason the qualifying with tag_store_inst_c3 is moved to tag_ctl 
//assign misbuf_hit_st_dep_zero = ( misbuf_dep_inst_c3_tmp & tag_store_inst_c3 & ~mb_hit_dep_one);
assign misbuf_hit_st_dep_zero = ( misbuf_dep_inst_c3_tmp & ~mb_hit_dep_one);
                        // if mbf hit and  a store instruction hit and all the DEP bits of the entries 
                        // the store hits against are 0's, do not set DEP bit, but enable Caming
                        // for store and send store ack. This would accelerate acks for the 
                        // store pipelining case
 
l2t_misbuf_ctl_msff_ctl_macro__width_3 ff_mbf_dep_c4 
                           (.din({misbuf_dep_inst_c3,arb_decdp_swap_inst_c2,arb_decdp_cas2_inst_c2}), .l1clk(l1clk), 
             .scan_in(ff_mbf_dep_c4_scanin),
             .scan_out(ff_mbf_dep_c4_scanout),
             .dout({misbuf_dep_inst_c4,arb_decdp_swap_inst_c3,arb_decdp_cas2_inst_c3}),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS and SR 11/07/03, store pipelining support
// We create 32 DEP bits to decide if subsequent stores that hit to one or more
// entries with DEP bit = 1, should also set their DEP bit . Loads will not look
// at DEP bits of entries they hit against . If a store hits against entries for
// which all DEP bits are 0, the store will issue the ack and cam the directory
// in the first phase itself , thereby accelerating the acks for the store pipelining
// case 

assign  mb_dep_prev = ( (mb_tag_wr_wl_c3 & {32{misbuf_dep_inst_c3}}) | mb_dep ) & ~reset_valid_bit_c3 ;

// BS & SR 11/04/03, MB grows to 32
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_dep_bit  // sync reset active low
                           (.din(mb_dep_prev[31:0]), .l1clk(l1clk),
        .scan_in(ff_dep_bit_scanin),
        .scan_out(ff_dep_bit_scanout),
        .clr(~dbb_rst_l), .dout(mb_dep[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
);

// BS and SR 11/07/03, store pipelining support
// this logic senses if one or more DEP bits for all the entries that the current
// instruction hits against in the Miss Buffer are 1 or not. the logic is used only
// by stores to not set DEP bit and send ack immeditaley in the first pass in case
// the result of this logic turns out to be false. If the result turns out ot be true,
// then the store can set its dep bit and ack and caming will happen in the second
// pass (after getting replayed from the Miss Buffer)

assign mb_hit_dep_one = | (misbuf_hit_vec_c3[31:0] & mb_dep[31:0]); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbf_dep_c5 
                           (.din(misbuf_dep_inst_c4), .l1clk(l1clk), 
             .scan_in(ff_mbf_dep_c5_scanin),
             .scan_out(ff_mbf_dep_c5_scanout),
             .dout(misbuf_dep_inst_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbf_dep_c52 
                           (.din(misbuf_dep_inst_c5), .l1clk(l1clk),
             .scan_in(ff_mbf_dep_c52_scanin),
             .scan_out(ff_mbf_dep_c52_scanout),
             .dout(misbuf_dep_inst_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbf_dep_c6 
                           (.din(misbuf_dep_inst_c52), .l1clk(l1clk), 
             .scan_in(ff_mbf_dep_c6_scanin),
             .scan_out(ff_mbf_dep_c6_scanout),
             .dout(misbuf_dep_inst_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbf_dep_c7 
                           (.din(misbuf_dep_inst_c6), .l1clk(l1clk), 
             .scan_in(ff_mbf_dep_c7_scanin),
             .scan_out(ff_mbf_dep_c7_scanout),
             .dout(misbuf_dep_inst_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbf_dep_c8 
                           (.din(misbuf_dep_inst_c7), .l1clk(l1clk), 
             .scan_in(ff_mbf_dep_c8_scanin),
             .scan_out(ff_mbf_dep_c8_scanout),
             .dout(misbuf_dep_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
////////////////////////////////////////////////////////////////////////////// 
// EVICT bit in MBdata 
//  The evict bit is set for a "true miss" with no VUAD CE, to indicate that its 
//  next pass is going to cause an EVICTION. The EVICT bit is reset 
//  when an evict instruction makes a pass down the Pipe. 
// Tecc and VUAD CE cases are exception cases: EVICT bit is not reset for an evict 
// instruction pass if that pass encounters a TECC error or VUAD CE. 
////////////////////////////////////////////////////////////////////////////// 
 
 
assign	buffer_miss_vld_c2 = ~misbuf_tag_hit_unqual_c2_internal & 
				~filbuf_misbuf_match_c2 & 
				~wbuf_hit_unqual_c2 & 
				~rdmat_hit_unqual_c2 & 
				arb_misbuf_inst_vld_c2 ; 
assign	misbuf_mark_evict_tmp_c2 =  
			 tag_miss_unqual_c2 & // 0 for an evict instruction 
			 buffer_miss_vld_c2;
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_mark_evict_tmp_c3 
		(.din(misbuf_mark_evict_tmp_c2), .l1clk(l1clk), 
             .scan_in(ff_misbuf_mark_evict_tmp_c3_scanin),
             .scan_out(ff_misbuf_mark_evict_tmp_c3_scanout),
             .dout(misbuf_mark_evict_tmp_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_evict_vld_unqual_c3 
                           (.din(arb_evict_vld_c2), .l1clk(l1clk), 
             .scan_in(ff_evict_vld_unqual_c3_scanin),
             .scan_out(ff_evict_vld_unqual_c3_scanout),
             .dout(evict_vld_unqual_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_decdp_wr64_inst_c3 
                           (.din(arb_decdp_wr64_inst_c2), .l1clk(l1clk), 
             .scan_in(ff_decdp_wr64_inst_c3_scanin),
             .scan_out(ff_decdp_wr64_inst_c3_scanout),
             .dout(wr64_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_decdp_ld64_inst_c3 
                           (.din(arb_decdp_ld64_inst_c2), .l1clk(l1clk), 
             .scan_in(ff_decdp_ld64_inst_c3_scanin),
             .scan_out(ff_decdp_ld64_inst_c3_scanout),
             .dout(ld64_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_ld64_inst_c4 
                           (.din(ld64_inst_c3), .l1clk(l1clk), 
             .scan_in(ff_ld64_inst_c4_scanin),
             .scan_out(ff_ld64_inst_c4_scanout),
             .dout(ld64_inst_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_ld64_inst_c5 
                           (.din(ld64_inst_c4), .l1clk(l1clk), 
             .scan_in(ff_ld64_inst_c5_scanin),
             .scan_out(ff_ld64_inst_c5_scanout),
             .dout(ld64_inst_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_ld64_inst_c52 
                           (.din(ld64_inst_c5), .l1clk(l1clk),
             .scan_in(ff_ld64_inst_c52_scanin),
             .scan_out(ff_ld64_inst_c52_scanout),
             .dout(ld64_inst_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_ld64_inst_c6 
                           (.din(ld64_inst_c52), .l1clk(l1clk), 
             .scan_in(ff_ld64_inst_c6_scanin),
             .scan_out(ff_ld64_inst_c6_scanout),
             .dout(ld64_inst_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_ld64_inst_c7 
                           (.din(ld64_inst_c6), .l1clk(l1clk), 
             .scan_in(ff_ld64_inst_c7_scanin),
             .scan_out(ff_ld64_inst_c7_scanout),
             .dout(ld64_inst_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 

assign	misbuf_mark_mcu_rdy_c3 = ( misbuf_mark_evict_tmp_c3 & 
		~wr64_inst_c3 & // do not set EVICT for a wr64 instruction 
		~arb_decdp_cas2_from_mb_c3 &
                ~arb_vuad_ce_err_c3 &   // a VUAD CE will gate setting of EVICT
		~tag_misbuf_par_err_c3  // a par err will gate setting of EVICT 
		& ~arb_pf_ice_inst_c3) ;  
 
l2t_misbuf_ctl_msff_ctl_macro__width_2 ff_mcu_rdy_c4 
              (.din({misbuf_mark_mcu_rdy_c3,arb_decdp_cas2_from_mb_c2}), .l1clk(l1clk), 
             .scan_in(ff_mcu_rdy_c4_scanin),
             .scan_out(ff_mcu_rdy_c4_scanout),
             .dout({mcu_rdy_c4,arb_decdp_cas2_from_mb_c3}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mcu_rdy_c5 
                           (.din(mcu_rdy_c4), .l1clk(l1clk), 
             .scan_in(ff_mcu_rdy_c5_scanin),
             .scan_out(ff_mcu_rdy_c5_scanout),
             .dout(mcu_rdy_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mcu_rdy_c52 
                           (.din(mcu_rdy_c5), .l1clk(l1clk),
             .scan_in(ff_mcu_rdy_c52_scanin),
             .scan_out(ff_mcu_rdy_c52_scanout),
             .dout(mcu_rdy_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mcu_rdy_c6 
                           (.din(mcu_rdy_c52), .l1clk(l1clk), 
             .scan_in(ff_mcu_rdy_c6_scanin),
             .scan_out(ff_mcu_rdy_c6_scanout),
             .dout(mcu_rdy_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mcu_rdy_c7 
                           (.din(mcu_rdy_c6), .l1clk(l1clk), 
             .scan_in(ff_mcu_rdy_c7_scanin),
             .scan_out(ff_mcu_rdy_c7_scanout),
             .dout(mcu_rdy_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mcu_rdy_c8 
                           (.din(mcu_rdy_c7), .l1clk(l1clk), 
             .scan_in(ff_mcu_rdy_c8_scanin),
             .scan_out(ff_mcu_rdy_c8_scanout),
             .dout(mcu_rdy_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// If an eviction packet encounters a tag parity error or VUAD CE,
// the EVICT bit needs to be set again so that the instruction 
// can make an eviction pass after the tag/vuad array has been  
// repaired. 
// 
// Similarly if an evict packet is issued with tecc=1  
// the evict_ready bit needs to be set again for that packet. 
// Both the above cases are covered in the expression for 
// evict_par_vuad_ce_err_c3 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_evict_par_err_c3 
                           (.din(arb_evict_tecc_vld_c2), .l1clk(l1clk), 
             .scan_in(ff_evict_par_err_c3_scanin),
             .scan_out(ff_evict_par_err_c3_scanout),
             .dout(evict_tecc_vld_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 

assign  evict_par_vuad_ce_err_c3 = (evict_vld_unqual_c3 & (arb_vuad_ce_err_c3 | 
					tag_misbuf_par_err_c3)) | evict_tecc_vld_c3;
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_evict_par_err_c4 
       (
	.scan_in(ff_evict_par_err_c4_scanin),
	.scan_out(ff_evict_par_err_c4_scanout),
	.din(evict_par_vuad_ce_err_c3), 
	.l1clk(l1clk), 
        .dout(evict_par_err_c4),
  .siclk(siclk),
  .soclk(soclk)  
	); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_evict_par_err_c5 
                           (.din(evict_par_err_c4), .l1clk(l1clk), 
             .scan_in(ff_evict_par_err_c5_scanin),
             .scan_out(ff_evict_par_err_c5_scanout),
             .dout(evict_par_err_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_evict_par_err_c52 
                           (.din(evict_par_err_c5), .l1clk(l1clk),
             .scan_in(ff_evict_par_err_c52_scanin),
             .scan_out(ff_evict_par_err_c52_scanout),
             .dout(evict_par_err_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_evict_par_err_c6 
                           (.din(evict_par_err_c52), .l1clk(l1clk), 
             .scan_in(ff_evict_par_err_c6_scanin),
             .scan_out(ff_evict_par_err_c6_scanout),
             .dout(evict_par_err_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_evict_par_err_c7 
                           (.din(evict_par_err_c6), .l1clk(l1clk), 
             .scan_in(ff_evict_par_err_c7_scanin),
             .scan_out(ff_evict_par_err_c7_scanout),
             .dout(evict_par_err_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// all ld64 are no_fill instructions. 
 
// The following expression for the EVICT bit  is used for 
// causing an eviction pass. It is not used for making a 
// request to DRAM. Hence, if we want to turn off the eviction 
// pass while not turning off requests to DRAM, this is the place 
// to do it. 
 
assign	misbuf_evict_nopfice_c7 = ( mcu_rdy_c7  
			& ~ld64_inst_c7  // LD 64 no fill 
			& ~l2_bypass_mode_on_d1) // L2 off 
			| evict_par_err_c7 ;   
 
assign misbuf_evict_c7 = misbuf_evict_nopfice_c7 | arb_pf_ice_inst_c7;

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_evict_c8 
                           (.din(misbuf_evict_c7), .l1clk(l1clk), 
             .scan_in(ff_misbuf_evict_c8_scanin),
             .scan_out(ff_misbuf_evict_c8_scanout),
             .dout(misbuf_evict_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
////////////////////////////////////////////////////////////////////////////// 
// The Code in this section handles a RDMA instruction completion. 
// i.e. if an instruction is not able to complete because of 
// "rdma_reg_vld" being high, this logic will enable the READY 
// condition for such an instruction that gets inserted in  
// the Miss Buffer.  
//  
//  
// Completion of a wr64  is signalled if it misses  
// everything ( $, FB WBB and RDMAT). Remember that  
// the tag_miss_unqual_c2 is already qualified with 
// ~tag_rdma_reg_vld so completion is actually off 
// when that signal is high. 
////////////////////////////////////////////////////////////////////////////// 
// int 5.0 changes 
// removed  the tag_misbuf_par_err_c3 for timing reasons.
// THe following signal will be transmitted to tagctl 
// where it is used after qualification with *par_err_c3.
assign	misbuf_wr64_miss_comp_c3 = misbuf_mark_evict_tmp_c3 &  
				wr64_inst_c3 ; 
 
l2t_misbuf_ctl_msff_ctl_macro__width_7 ff_buffer_miss_vld_c3 
                           (.din({buffer_miss_vld_c2,buffer_miss_vld_c3,buffer_miss_vld_c4,
                                  buffer_miss_vld_c5,buffer_miss_vld_c52,buffer_miss_vld_c6,
                                  buffer_miss_vld_c7}), .l1clk(l1clk), 
             .scan_in(ff_buffer_miss_vld_c3_scanin),
             .scan_out(ff_buffer_miss_vld_c3_scanout),
             .dout({buffer_miss_vld_c3,buffer_miss_vld_c4,buffer_miss_vld_c5,buffer_miss_vld_c52,
                    buffer_miss_vld_c6,buffer_miss_vld_c7,buffer_miss_vld_c8}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_rdma_reg_vld_c3 
                           (.din(tag_misbuf_rdma_reg_vld_c2), .l1clk(l1clk), 
             .scan_in(ff_rdma_reg_vld_c3_scanin),
             .scan_out(ff_rdma_reg_vld_c3_scanout),
             .dout(rdma_reg_vld_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	wr64_miss_not_comp_c3 = buffer_miss_vld_c3 & 
				tag_alt_tag_miss_unqual_c3 &  
				~tag_misbuf_par_err_c3 &  
                                ~arb_vuad_ce_err_c3 &
				wr64_inst_c3 & 
				rdma_reg_vld_c3; 
 
assign	rdma_comp_rdy_c3 = ( wr64_miss_not_comp_c3 | tag_hit_not_comp_c3 ) ; 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_rdma_comp_rdy_c4 
                           (.din(rdma_comp_rdy_c3), .l1clk(l1clk), 
             .scan_in(ff_rdma_comp_rdy_c4_scanin),
             .scan_out(ff_rdma_comp_rdy_c4_scanout),
             .dout(rdma_comp_rdy_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_rdma_comp_rdy_c5 
                           (.din(rdma_comp_rdy_c4), .l1clk(l1clk), 
             .scan_in(ff_rdma_comp_rdy_c5_scanin),
             .scan_out(ff_rdma_comp_rdy_c5_scanout),
             .dout(rdma_comp_rdy_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_rdma_comp_rdy_c52 
                           (.din(rdma_comp_rdy_c5), .l1clk(l1clk),
             .scan_in(ff_rdma_comp_rdy_c52_scanin),
             .scan_out(ff_rdma_comp_rdy_c52_scanout),
             .dout(rdma_comp_rdy_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_rdma_comp_rdy_c6 
                           (.din(rdma_comp_rdy_c52), .l1clk(l1clk), 
             .scan_in(ff_rdma_comp_rdy_c6_scanin),
             .scan_out(ff_rdma_comp_rdy_c6_scanout),
             .dout(rdma_comp_rdy_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_rdma_comp_rdy_c7 
                           (.din(rdma_comp_rdy_c6), .l1clk(l1clk), 
             .scan_in(ff_rdma_comp_rdy_c7_scanin),
             .scan_out(ff_rdma_comp_rdy_c7_scanout),
             .dout(rdma_comp_rdy_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_rdma_comp_rdy_c8 
                           (.din(rdma_comp_rdy_c7), .l1clk(l1clk), 
             .scan_in(ff_rdma_comp_rdy_c8_scanin),
             .scan_out(ff_rdma_comp_rdy_c8_scanout),
             .dout(rdma_comp_rdy_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
////////////////////////////////////////////////////////////////////////////// 
// TECC bit in MBdata: 
//	The TECC bit is set in mbdata if a tag parity is encountered for an 
//  	instruction that writes/rewrites into the miss Buffer. 
// This bit is used to cause a scrub when the instruction is reissued. 
////////////////////////////////////////////////////////////////////////////// 
 
 
assign	misbuf_tecc_c3 = tag_misbuf_par_err_c3 &  
			~tag_hit_unqual_c3 & 
			buffer_miss_vld_c3; // a hit in any of the buffers 
					    // triggers an alternate ready mechanism 
					    // that might set L2 ready  
					    // Hence, tecc_ready setting needs to 
					    // be disabled in this case. 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_tecc_c4 
                           (.din(misbuf_tecc_c3), .l1clk(l1clk), 
             .scan_in(ff_misbuf_tecc_c4_scanin),
             .scan_out(ff_misbuf_tecc_c4_scanout),
             .dout(misbuf_tecc_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_tecc_c5 
                           (.din(misbuf_tecc_c4), .l1clk(l1clk), 
             .scan_in(ff_misbuf_tecc_c5_scanin),
             .scan_out(ff_misbuf_tecc_c5_scanout),
             .dout(misbuf_tecc_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_tecc_c52 
                           (.din(misbuf_tecc_c5), .l1clk(l1clk),
             .scan_in(ff_misbuf_tecc_c52_scanin),
             .scan_out(ff_misbuf_tecc_c52_scanout),
             .dout(misbuf_tecc_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_tecc_c6 
                           (.din(misbuf_tecc_c52), .l1clk(l1clk), 
             .scan_in(ff_misbuf_tecc_c6_scanin),
             .scan_out(ff_misbuf_tecc_c6_scanout),
             .dout(misbuf_tecc_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_tecc_c7 
                           (.din(misbuf_tecc_c6), .l1clk(l1clk), 
             .scan_in(ff_misbuf_tecc_c7_scanin),
             .scan_out(ff_misbuf_tecc_c7_scanout),
             .dout(misbuf_tecc_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_tecc_c8 
                           (.din(misbuf_tecc_c7), .l1clk(l1clk), 
             .scan_in(ff_misbuf_tecc_c8_scanin),
             .scan_out(ff_misbuf_tecc_c8_scanout),
             .dout(misbuf_tecc_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
/////////////////////////////////////////////////////// 
// VALID bit : set on insertion and reset on deletion 
/////////////////////////////////////////////////////// 
 
// BS & SR 11/04/03, MB grows to 32
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_mb_write_ptr_c3  // sync reset active low
                           (.din(mb_write_ptr_c2[31:0]), .l1clk(l1clk), 
			.scan_in(ff_mb_write_ptr_c3_scanin),
			.scan_out(ff_mb_write_ptr_c3_scanout),
			.clr(~dbb_rst_l), 
                     .dout(mb_write_ptr_c3[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	mb_tag_wr_wl_c3 = mb_write_ptr_c3 & {32{mbf_insert_c3}} ; // BS & SR 11/04/03, MB grows to 32
assign	mb_tag_wr_wl_c3_tmp = mb_write_ptr_c3 & {32{mbf_insert_c3_tmp}} ; // BS & SR 11/04/03, MB grows to 32
 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_mb_entry_c3  // BS & SR 11/04/03, MB grows to 32
                           (.din(inst_mb_entry_c2[4:0]), .l1clk(l1clk), 
                       .scan_in(ff_mb_entry_c3_scanin),
                       .scan_out(ff_mb_entry_c3_scanout),
                       .dout(mb_entry_c3[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_mb_entry_c3_1  // BS & SR 11/04/03, MB grows to 32
                           (.din(inst_mb_entry_c2[4:0]), .l1clk(l1clk), 
                       .scan_in(ff_mb_entry_c3_1_scanin),
                       .scan_out(ff_mb_entry_c3_1_scanout),
                       .dout(mb_entry_c3_1[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	dec_mb_entry_c3[0]	= ( mb_entry_c3_1 == 5'd0 ) ; 
assign	dec_mb_entry_c3[1]	= ( mb_entry_c3_1 == 5'd1 ) ; 
assign	dec_mb_entry_c3[2]	= ( mb_entry_c3_1 == 5'd2 ) ; 
assign	dec_mb_entry_c3[3]	= ( mb_entry_c3_1 == 5'd3 ) ; 
assign	dec_mb_entry_c3[4]	= ( mb_entry_c3_1 == 5'd4 ) ; 
assign	dec_mb_entry_c3[5]	= ( mb_entry_c3_1 == 5'd5 ) ; 
assign	dec_mb_entry_c3[6]	= ( mb_entry_c3_1 == 5'd6 ) ; 
assign	dec_mb_entry_c3[7]	= ( mb_entry_c3_1 == 5'd7 ) ; 
assign	dec_mb_entry_c3[8]	= ( mb_entry_c3_1 == 5'd8 ) ; 
assign	dec_mb_entry_c3[9]	= ( mb_entry_c3_1 == 5'd9 ) ; 
assign	dec_mb_entry_c3[10]	= ( mb_entry_c3_1 == 5'd10 ) ; 
assign	dec_mb_entry_c3[11]	= ( mb_entry_c3_1 == 5'd11 ) ; 
assign	dec_mb_entry_c3[12]	= ( mb_entry_c3_1 == 5'd12 ) ; 
assign	dec_mb_entry_c3[13]	= ( mb_entry_c3_1 == 5'd13 ) ; 
assign	dec_mb_entry_c3[14]	= ( mb_entry_c3_1 == 5'd14 ) ; 
assign	dec_mb_entry_c3[15]	= ( mb_entry_c3_1 == 5'd15 ) ; 

// BS & SR 11/04/03, MB grows to 32
assign  dec_mb_entry_c3[16]      = ( mb_entry_c3_1 == 5'd16) ; 
assign  dec_mb_entry_c3[17]      = ( mb_entry_c3_1 == 5'd17) ; 
assign  dec_mb_entry_c3[18]      = ( mb_entry_c3_1 == 5'd18) ;
assign  dec_mb_entry_c3[19]      = ( mb_entry_c3_1 == 5'd19) ; 
assign  dec_mb_entry_c3[20]      = ( mb_entry_c3_1 == 5'd20) ; 
assign  dec_mb_entry_c3[21]      = ( mb_entry_c3_1 == 5'd21) ; 
assign  dec_mb_entry_c3[22]      = ( mb_entry_c3_1 == 5'd22) ;
assign  dec_mb_entry_c3[23]      = ( mb_entry_c3_1 == 5'd23) ;
assign  dec_mb_entry_c3[24]      = ( mb_entry_c3_1 == 5'd24) ;
assign  dec_mb_entry_c3[25]      = ( mb_entry_c3_1 == 5'd25) ; 
assign  dec_mb_entry_c3[26]     = ( mb_entry_c3_1  == 5'd26) ;  
assign  dec_mb_entry_c3[27]     = ( mb_entry_c3_1  == 5'd27) ;  
assign  dec_mb_entry_c3[28]     = ( mb_entry_c3_1  == 5'd28) ;  
assign  dec_mb_entry_c3[29]     = ( mb_entry_c3_1  == 5'd29) ;
assign  dec_mb_entry_c3[30]     = ( mb_entry_c3_1  == 5'd30) ; 
assign  dec_mb_entry_c3[31]     = ( mb_entry_c3_1  == 5'd31) ; 

// Used by filbuf since this is the same as fill entry. 
assign	reset_valid_bit_c3 = ( dec_mb_entry_c3 & {32{mbf_delete_c3}} ) ; // BS & SR 11/04/03, MB grows to 32
assign	mb_valid_prev = ( mb_tag_wr_wl_c3 | mb_valid ) & ~reset_valid_bit_c3 ; 
 
// BS & SR 11/04/03, MB grows to 32
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_valid_bit  // sync reset active low
                           (.din(mb_valid_prev[31:0]), .l1clk(l1clk),  
	.scan_in(ff_valid_bit_scanin),
	.scan_out(ff_valid_bit_scanout),
	.clr(~dbb_rst_l), .dout(mb_valid[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 

//assign mb_valid_stall_pfice_c3 = |(mb_valid[31:0]);
 
 
/////////////////////////////////////////////////////// 
// RDMA bit : set on insertion of a RDMA instruction  
//	and reset on deletion 
// used only for purposes of picking an instruction 
// in the Miss Buffer. 
/////////////////////////////////////////////////////// 
 
 
assign 	mb_rdma_prev = (( mb_tag_wr_wl_c3 & {32{rdma_inst_c3}} ) | 
			 mb_rdma ) & ~reset_valid_bit_c3 ; 
// BS & SR 11/04/03, MB grows to 32 
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_rdma_bit  // sync reset active low
                           (.din(mb_rdma_prev[31:0]), .l1clk(l1clk),  
	.scan_in(ff_rdma_bit_scanin),
	.scan_out(ff_rdma_bit_scanout),
	.clr(~dbb_rst_l), .dout(mb_rdma[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
/////////////////////////////////////////////////////// 
// BIS bit : set on insertion of a BIS instruction 
//      and reset on deletion 
// used to assert a dummy request to DRAM  
/////////////////////////////////////////////////////// 
 
assign  mb_bis_prev = (( mb_tag_wr_wl_c3 & {32{arb_decdp_bis_inst_c3}} )  
			| mb_bis ) & ~reset_valid_bit_c3 ; 
 
// BS & SR 11/04/03, MB grows to 32
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_bis_bit  // sync reset active low
                           (.din(mb_bis_prev[31:0]), .l1clk(l1clk), 
        .scan_in(ff_bis_bit_scanin),
        .scan_out(ff_bis_bit_scanout),
        .clr(~dbb_rst_l), .dout(mb_bis[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
////////////////////////////////////////////////////////////////////////// 
// DRAM READY  bit : set on insertion/reinsertion 
//		 of all cases of "true miss" in C8, other than a Prefetch ICE. 
//		and reset on a PICK for mcu issue. 
// The reason the mcu_ready bit is set in C7 is as follows: 
//  
// ------------------------------------------------------------------------ 
// #1		#2(C8)		#3(C9)		#4((c10)	#5(c11) 
// ------------------------------------------------------------------------ 
// mcu_ready	mcu_pick_prev	mcu_pick	read		req 
// set							 
//								write 
//								fbtag. 
//								other 
//								fb fields. 
// -------------------------------------------------------------------------- 
// fbtagecc and other fields of fb come from mbdata. 
// mbdata gets written in c9. Hence it cannot be read before 
// c10. 
// This required cycle #4 to correspond to c10. 
////////////////////////////////////////////////////////////////////////// 

// BS 06/24/04 : Support for Prefetch ICE.
// Have to squash the DRAM read on a Prefetch ICE. Prefetch ICE should
// miss in L2 tags , and get inserted in the Miss Buffer , but should
// not assert a DRAM read request. It should cause the eviction pass
// to happen using the way from PA[21:18] of the instruction itself.
// In the eviction pass, the miss buffer entry will get deleted .
// However if there is a tag parity error during the Prefetch ICE
// first pass, the Prefetch ICE will get inserted into the miss buffer
// , but the DRMA ready bit will not be set as usual. The evict_rdy
// bit will not be set due to the tag parity error.
// Then a scrub will be issued from the Miss Buffer and when it finishes,
// it will ready the Prefetch ICE and this time it will miss cleanly, and
// follow normal behavior for Prefetch ICE. This has to be verified with
// directed diags 
 
// Also in case of VUAD CE have to disable the MCU request
// as we do not know if it is a valid hit or miss.

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_arb_pf_ice_inst_c8 
               (.din(arb_pf_ice_inst_c7), .l1clk(l1clk),
                .scan_in(ff_arb_pf_ice_inst_c8_scanin),
                .scan_out(ff_arb_pf_ice_inst_c8_scanout),
                .dout(arb_pf_ice_inst_c8),
  .siclk(siclk),
  .soclk(soclk)
		);

//
// In case both tag parity error and VUAD CE happen for the same
// instruction and it is a tag miss, the mcu ready bit will be set as it gets set on a regular tag parity error 
// However the L2 ready bit will not be set in C9 but will be set after the scrub
// itself. Hence we need to gate off the setting of arb_vuad_ce_err_c3 by not of 
// tag_misbuf_par_err_c3 so that we get the behv of L2 ready and MCU ready same
// as if only tag parity error occured.
// In case of a tag hit, have to process the instruction as if a VUAD ecc error
// has happened, i.e put it in the miss buffer and replay from it. The tag parity
// error on a tag hit means the parity bit itself is in error , the instruction 
// normally would just finish in the pipe. So if a VUAD ecc error also happened,
// have to move it to miss buffer and replay from there. 
 
assign arb_vuad_ce_err_c3_tmp = ~(tag_misbuf_par_err_c3 & ~tag_hit_unqual_c3 ) & arb_vuad_ce_err_c3 ;

l2t_misbuf_ctl_msff_ctl_macro__width_7 ff_arb_vuad_ce_err_slice 
	(.din({arb_vuad_ce_err_c3_tmp,arb_vuad_ce_err_c4,arb_vuad_ce_err_c5,arb_vuad_ce_err_c52,
		arb_vuad_ce_err_c6,arb_vuad_ce_err_c7,misbuf_tag_hit_unqual_c2_internal}), 
         .scan_in(ff_arb_vuad_ce_err_slice_scanin),
         .scan_out(ff_arb_vuad_ce_err_slice_scanout),
         .dout({arb_vuad_ce_err_c4,arb_vuad_ce_err_c5,arb_vuad_ce_err_c52,arb_vuad_ce_err_c6,
		arb_vuad_ce_err_c7,arb_vuad_ce_err_c8,misbuf_hit_unqual_c3}),
	 .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign misbuf_vuad_ce_err_c6 = arb_vuad_ce_err_c6 ; // vuad ecc change
 
////  For vuad ecc ce 

assign reset_vuad_ce_replay[31:0] =  ({32{~arb_vuad_ce_err_c3_tmp & mbissue_inst_vld_c3}} & dec_mb_entry_c3); 

// in case of a dependant insertion to miss buffer , do not set the ce_replay bit if there is a vuad ce
// this is because the replay of the dependant should only happen after its dependancy has cleared
// and not before that. Replaying before the dependancy has been cleared , might have the dependant
// hit in the tag or fill buffer and the dependant might complete before the instruction it is
// dependant on. Also vuad_ce_err_rdy[31:0] will not be set for a dependant insertion to miss buffer
// with vuad ce.

assign tag_misbuf_ack_c3 = ( tag_misbuf_int_ack_c3 &
                                  ((~inst_mb_c3 & ~misbuf_hit_unqual_c3) |
                                  (~inst_mb_c3 &
                                  (misbuf_hit_st_dep_zero & tag_store_inst_c3 & ~filbuf_match_c3)) | dep_inst_c3 ));


assign vuad_ce_replay_in[31:0] = (({32{arb_vuad_ce_err_c3_tmp & ~mbissue_inst_vld_c3 & mbf_insert_c3 & buffer_miss_vld_c3}} 
                                     & mb_write_ptr_c3 ) |
                                  ({32{arb_vuad_ce_err_c3_tmp & mbissue_inst_vld_c3 & buffer_miss_vld_c3}} 
                                     & dec_mb_entry_c3)  |
                                     vuad_ce_replay) &
	                         ~(reset_vuad_ce_replay); 

assign vuad_ack_pending_in[31:0] = (({32{tag_misbuf_ack_c3 & arb_vuad_ce_err_c3_tmp & ~mbissue_inst_vld_c3 & mbf_insert_c3 & 
                                         buffer_miss_vld_c3}}
                                     & mb_write_ptr_c3 ) |
                                  ({32{tag_misbuf_ack_c3 & arb_vuad_ce_err_c3_tmp & mbissue_inst_vld_c3 & buffer_miss_vld_c3}}
                                     & dec_mb_entry_c3)	 |
                                     vuad_ack_pending) &
                                 ~(reset_vuad_ce_replay);

                           

l2t_misbuf_ctl_msff_ctl_macro__width_65 ff_vuad_ce_replay  
	(
	.scan_in(ff_vuad_ce_replay_scanin),
	.scan_out(ff_vuad_ce_replay_scanout),
	.din({vuad_ce_replay_in[31:0],mbissue_inst_vld_c2,vuad_ack_pending_in[31:0]}), 
	.l1clk(l1clk),
	.dout({vuad_ce_replay[31:0],mbissue_inst_vld_c3,vuad_ack_pending[31:0]}),
  .siclk(siclk),
  .soclk(soclk) 
	);

//assign 	misbuf_vuad_ce_instr_c2 = |({32{arb_misbuf_inst_vld_c2}} & vuad_ce_replay & ~mb_l2_ready);
assign 	misbuf_vuad_ce_instr_c2 = |({32{arb_misbuf_inst_vld_c2 & arbdec_arbdp_inst_mb_c2}} & 
                                        dec_mb_entry_c2 & vuad_ce_replay & ~mb_l2_ready);

assign misbuf_vuad_ce_instr_ack_c2 = |({32{arb_misbuf_inst_vld_c2 & arbdec_arbdp_inst_mb_c2}} &
		dec_mb_entry_c2 & vuad_ce_replay & vuad_ack_pending & ~mb_l2_ready);

//////

// VUAD ecc changes
 assign	mcu_ready_set_c8 = ( insert_ptr_c8 & {32{misbuf_mbdata_wr_en_c8  & ~arb_pf_ice_inst_c8 & 
			     ~arb_vuad_ce_err_c8 & mcu_rdy_c8}}  ) ; // BS & SR 11/04/03, MB grows to 32 
 
 assign	reset_mcu_ready = ( picker_out & {32{mcu_pick}} ) ; // BS & SR 11/04/03, MB grows to 32 
 
 assign	mb_mcu_ready_in = ( mb_mcu_ready | mcu_ready_set_c8 ) & 
				~( reset_mcu_ready ) ; 
 
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_mcu_ready_bit  // sync reset active low, BS & SR 11/04/03, MB grows to 32
                           (.din(mb_mcu_ready_in[31:0]), .l1clk(l1clk),  
	.scan_in(ff_mcu_ready_bit_scanin),
	.scan_out(ff_mcu_ready_bit_scanout),
	.clr(~dbb_rst_l), .dout(mb_mcu_ready[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
			 
 
///////////////////////////////////////////////////////////////// 
// YOUNG bit : Denotes the Youngest MB entry for that address. 
//  
// Set in the C3 cycle of non-dependent insertion and reset 
// in the C3 cycle of an instruction hitting a young miss Buffer 
// entry.Also reset on dequeue. 
// 
///////////////////////////////////////////////////////////////// 
 
assign	mb_young_prev = ( mb_tag_wr_wl_c3 | mb_young ) & 
			~( misbuf_hit_vec_c3 | reset_valid_bit_c3 ) ; 
 
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_young_bit  // sync reset active low. // BS & SR 11/04/03, MB grows to 32
                           (.din(mb_young_prev[31:0]), .l1clk(l1clk),  
	.scan_in(ff_young_bit_scanin),
	.scan_out(ff_young_bit_scanout),
	.clr(~dbb_rst_l), .dout(mb_young[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
///////////////////////////////////////////////////////////////// 
// NEXT LINK Field : Denotes the next(agewise) dependent's miss buffer 
//		    ID. 
//  
// Set in the C3 cycle of dependents insertion into the Miss Buffer. 
// However next link is set for the older entry and not for the inserting 
// entry. 
///////////////////////////////////////////////////////////////// 
 
assign	next_link_wr_en_c3  = mb_young &  misbuf_hit_vec_c3;
 
// BS & SR 11/04/03, MB grows to 32
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link0 
                           (.din(enc_tag_wr_wl_c3[4:0]), 
                        .scan_in(ff_next_link0_scanin),
                        .scan_out(ff_next_link0_scanout),
                        .en(next_link_wr_en_c3[0]), 
                        .l1clk(l1clk), .dout(next_link_entry0[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
			      
); 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link1 
                           (.din(enc_tag_wr_wl_c3[4:0]), 
                        .scan_in(ff_next_link1_scanin),
                        .scan_out(ff_next_link1_scanout),
                        .en(next_link_wr_en_c3[1]), 
                        .l1clk(l1clk), .dout(next_link_entry1[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
                         
); 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link2 
                           (.din(enc_tag_wr_wl_c3[4:0]), 
                        .scan_in(ff_next_link2_scanin),
                        .scan_out(ff_next_link2_scanout),
                        .en(next_link_wr_en_c3[2]), 
                        .l1clk(l1clk), .dout(next_link_entry2[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
                         
); 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link3 
                           (.din(enc_tag_wr_wl_c3[4:0]), 
                        .scan_in(ff_next_link3_scanin),
                        .scan_out(ff_next_link3_scanout),
                        .en(next_link_wr_en_c3[3]), 
                        .l1clk(l1clk), .dout(next_link_entry3[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
                         
); 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link4 
                           (.din(enc_tag_wr_wl_c3[4:0]), 
                        .scan_in(ff_next_link4_scanin),
                        .scan_out(ff_next_link4_scanout),
                        .en(next_link_wr_en_c3[4]), 
                        .l1clk(l1clk), .dout(next_link_entry4[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
                         
); 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link5 
                           (.din(enc_tag_wr_wl_c3[4:0]), 
                        .scan_in(ff_next_link5_scanin),
                        .scan_out(ff_next_link5_scanout),
                        .en(next_link_wr_en_c3[5]), 
                        .l1clk(l1clk), .dout(next_link_entry5[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
                         
); 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link6 
                           (.din(enc_tag_wr_wl_c3[4:0]), 
                        .scan_in(ff_next_link6_scanin),
                        .scan_out(ff_next_link6_scanout),
                        .en(next_link_wr_en_c3[6]), 
                        .l1clk(l1clk), .dout(next_link_entry6[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
                         
); 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link7 
                           (.din(enc_tag_wr_wl_c3[4:0]), 
                        .scan_in(ff_next_link7_scanin),
                        .scan_out(ff_next_link7_scanout),
                        .en(next_link_wr_en_c3[7]), 
                        .l1clk(l1clk), .dout(next_link_entry7[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
                         
); 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link8 
                           (.din(enc_tag_wr_wl_c3[4:0]), 
                        .scan_in(ff_next_link8_scanin),
                        .scan_out(ff_next_link8_scanout),
                        .en(next_link_wr_en_c3[8]), 
                        .l1clk(l1clk), .dout(next_link_entry8[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
                         
); 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link9 
                           (.din(enc_tag_wr_wl_c3[4:0]), 
                        .scan_in(ff_next_link9_scanin),
                        .scan_out(ff_next_link9_scanout),
                        .en(next_link_wr_en_c3[9]), 
                        .l1clk(l1clk), .dout(next_link_entry9[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
                         
); 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link10 
                           (.din(enc_tag_wr_wl_c3[4:0]), 
                        .scan_in(ff_next_link10_scanin),
                        .scan_out(ff_next_link10_scanout),
                        .en(next_link_wr_en_c3[10]), 
                        .l1clk(l1clk), .dout(next_link_entry10[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
                         
); 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link11 
                           (.din(enc_tag_wr_wl_c3[4:0]), 
                        .scan_in(ff_next_link11_scanin),
                        .scan_out(ff_next_link11_scanout),
                        .en(next_link_wr_en_c3[11]), 
                        .l1clk(l1clk), .dout(next_link_entry11[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
                         
); 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link12 
                           (.din(enc_tag_wr_wl_c3[4:0]), 
                        .scan_in(ff_next_link12_scanin),
                        .scan_out(ff_next_link12_scanout),
                        .en(next_link_wr_en_c3[12]), 
                        .l1clk(l1clk), .dout(next_link_entry12[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
                         
); 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link13 
                           (.din(enc_tag_wr_wl_c3[4:0]), 
                        .scan_in(ff_next_link13_scanin),
                        .scan_out(ff_next_link13_scanout),
                        .en(next_link_wr_en_c3[13]), 
                        .l1clk(l1clk), .dout(next_link_entry13[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
                         
); 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link14 
                           (.din(enc_tag_wr_wl_c3[4:0]), 
                        .scan_in(ff_next_link14_scanin),
                        .scan_out(ff_next_link14_scanout),
                        .en(next_link_wr_en_c3[14]), 
                        .l1clk(l1clk), .dout(next_link_entry14[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
                        
); 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link15 
                           (.din(enc_tag_wr_wl_c3[4:0]), 
                        .scan_in(ff_next_link15_scanin),
                        .scan_out(ff_next_link15_scanout),
                        .en(next_link_wr_en_c3[15]), 
                        .l1clk(l1clk), .dout(next_link_entry15[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
                         
); 

// BS & SR 11/04/03, MB grows to 32
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link16 
	(
	.scan_in(ff_next_link16_scanin),
	.scan_out(ff_next_link16_scanout),
	.din(enc_tag_wr_wl_c3[4:0]),
	.en(next_link_wr_en_c3[16]),
	.l1clk(l1clk), 
	.dout(next_link_entry16[4:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link17 
        (
        .scan_in(ff_next_link17_scanin),
        .scan_out(ff_next_link17_scanout),
        .din(enc_tag_wr_wl_c3[4:0]),
        .en(next_link_wr_en_c3[17]),
        .l1clk(l1clk), 
        .dout(next_link_entry17[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link18 
        (
        .scan_in(ff_next_link18_scanin),
        .scan_out(ff_next_link18_scanout),
        .din(enc_tag_wr_wl_c3[4:0]),
        .en(next_link_wr_en_c3[18]),
        .l1clk(l1clk),
        .dout(next_link_entry18[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link19 
        (
        .scan_in(ff_next_link19_scanin),
        .scan_out(ff_next_link19_scanout),
        .din(enc_tag_wr_wl_c3[4:0]),
        .en(next_link_wr_en_c3[19]),
        .l1clk(l1clk),
        .dout(next_link_entry19[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link20 
        (
        .scan_in(ff_next_link20_scanin),
        .scan_out(ff_next_link20_scanout),
        .din(enc_tag_wr_wl_c3[4:0]),
        .en(next_link_wr_en_c3[20]),
        .l1clk(l1clk),
        .dout(next_link_entry20[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link21 
        (
        .scan_in(ff_next_link21_scanin),
        .scan_out(ff_next_link21_scanout),
        .din(enc_tag_wr_wl_c3[4:0]),
        .en(next_link_wr_en_c3[21]),
        .l1clk(l1clk),
        .dout(next_link_entry21[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);


l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link22 
        (
        .scan_in(ff_next_link22_scanin),
        .scan_out(ff_next_link22_scanout),
        .din(enc_tag_wr_wl_c3[4:0]),
        .en(next_link_wr_en_c3[22]),
        .l1clk(l1clk),
        .dout(next_link_entry22[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link23 
        (
        .scan_in(ff_next_link23_scanin),
        .scan_out(ff_next_link23_scanout),
        .din(enc_tag_wr_wl_c3[4:0]),
        .en(next_link_wr_en_c3[23]),
        .l1clk(l1clk),
        .dout(next_link_entry23[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);


l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link24 
        (
        .scan_in(ff_next_link24_scanin),
        .scan_out(ff_next_link24_scanout),
        .din(enc_tag_wr_wl_c3[4:0]),
        .en(next_link_wr_en_c3[24]),
        .l1clk(l1clk),
        .dout(next_link_entry24[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);


l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link25 
        (
        .scan_in(ff_next_link25_scanin),
        .scan_out(ff_next_link25_scanout),
        .din(enc_tag_wr_wl_c3[4:0]),
        .en(next_link_wr_en_c3[25]),
        .l1clk(l1clk),
        .dout(next_link_entry25[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);


l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link26 
        (
        .scan_in(ff_next_link26_scanin),
        .scan_out(ff_next_link26_scanout),
        .din(enc_tag_wr_wl_c3[4:0]),
        .en(next_link_wr_en_c3[26]),
        .l1clk(l1clk),
        .dout(next_link_entry26[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);


l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link27 
        (
        .scan_in(ff_next_link27_scanin),
        .scan_out(ff_next_link27_scanout),
        .din(enc_tag_wr_wl_c3[4:0]),
        .en(next_link_wr_en_c3[27]),
        .l1clk(l1clk),
        .dout(next_link_entry27[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);


l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link28 
        (
        .scan_in(ff_next_link28_scanin),
        .scan_out(ff_next_link28_scanout),
        .din(enc_tag_wr_wl_c3[4:0]),
        .en(next_link_wr_en_c3[28]),
        .l1clk(l1clk),
        .dout(next_link_entry28[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);


l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link29 
        (
        .scan_in(ff_next_link29_scanin),
        .scan_out(ff_next_link29_scanout),
        .din(enc_tag_wr_wl_c3[4:0]),
        .en(next_link_wr_en_c3[29]),
        .l1clk(l1clk),
        .dout(next_link_entry29[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link30 
        (
        .scan_in(ff_next_link30_scanin),
        .scan_out(ff_next_link30_scanout),
        .din(enc_tag_wr_wl_c3[4:0]),
        .en(next_link_wr_en_c3[30]),
        .l1clk(l1clk),
        .dout(next_link_entry30[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_next_link31 
        (
        .scan_in(ff_next_link31_scanin),
        .scan_out(ff_next_link31_scanout),
        .din(enc_tag_wr_wl_c3[4:0]),
        .en(next_link_wr_en_c3[31]),
        .l1clk(l1clk),
        .dout(next_link_entry31[4:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

		   
//////////////////////////////////////////////////////////////////// 
// CTRUE bit : Denotes "final" pass for a partial store/swap/ldstub 
//       and "store" for a CAS2 instruction in the miss buffer. 
//	- This bit is set in the C8 cycle of a parital store hitting 
// 	 the $ for the inserting/resinserting entry in C8. 
//       If there is a UE/Notdata error, the bit will still be set
//       but the write will be disabled in the final pass.
// 	- Also set in C8  of a CAS1 packet hitting in the cache/fb 
//	  if the compare operation is true.But this bit is set  
//	  for the Miss Buffer entry of the CAS2 dependent of the  
//	  CAS1 packet and not for the CAS1 packet itself. 
//        If CAS1 encounters UE,CE,Notdata , this bit will not be
//        set indicating there will still be a CAS2 pass but the
//        write to the cache will be disabled.
// If CAS1 is issued from the Miss Buffer, the CTRUE bit is set for 
// its miss buffer dependent. 
// If CAS1 is issued from the IQ, The CTRUE bit is set for the  
// miss buffer entry of the instruction that is following 2 cycles 
// after. 
//////////////////////////////////////////////////////////////////// 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_inst_mb_c4 
                           (.din(inst_mb_c3), .l1clk(l1clk),  
			.scan_in(ff_inst_mb_c4_scanin),
			.scan_out(ff_inst_mb_c4_scanout),
			.dout(inst_mb_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_inst_mb_c5 
                           (.din(inst_mb_c4), .l1clk(l1clk),  
			.scan_in(ff_inst_mb_c5_scanin),
			.scan_out(ff_inst_mb_c5_scanout),
			.dout(tag_inst_mb_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_inst_mb_c52 
                           (.din(tag_inst_mb_c5), .l1clk(l1clk),
                        .scan_in(ff_inst_mb_c52_scanin),
                        .scan_out(ff_inst_mb_c52_scanout),
                        .dout(tag_inst_mb_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_inst_mb_c6 
                           (.din(tag_inst_mb_c52), .l1clk(l1clk),  
			.scan_in(ff_inst_mb_c6_scanin),
			.scan_out(ff_inst_mb_c6_scanout),
			.dout(inst_mb_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_inst_mb_c7 
                           (.din(inst_mb_c6), .l1clk(l1clk),  
			.scan_in(ff_inst_mb_c7_scanin),
			.scan_out(ff_inst_mb_c7_scanout),
			.dout(inst_mb_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_inst_mb_c8 
                           (.din(inst_mb_c7), .l1clk(l1clk),  
			.scan_in(ff_inst_mb_c8_scanin),
			.scan_out(ff_inst_mb_c8_scanout),
			.dout(inst_mb_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_inst_mb_c9 
                           (.din(inst_mb_c8), .l1clk(l1clk),  
			.scan_in(ff_inst_mb_c9_scanin),
			.scan_out(ff_inst_mb_c9_scanout),
			.dout(inst_mb_c9),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_enc_data_wr_wl_c7_1 
                           (.din(enc_data_wr_wl_c6[4:0]), .l1clk(l1clk),  
			.scan_in(ff_enc_data_wr_wl_c7_1_scanin),
			.scan_out(ff_enc_data_wr_wl_c7_1_scanout),
			.dout(enc_data_wr_wl_c7_1[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_5 mux_ctrue_entry 
			(.dout(misbuf_ctrue_rdy_entry[4:0]), 
                           .din0(enc_data_wr_wl_c9[4:0]),// cas1 from mb contains cas2(dep) id 
                           .din1(enc_data_wr_wl_c7_1[4:0]), // cas1 from IQ. contains cas2 id 
                           .sel0(inst_mb_c9), 
                           .sel1(~inst_mb_c9)); 
 
// In case of cas instruction encountering an vuad error 
// do not set the ctrue bit in the same pass as the cas will
// be replayed

assign set_arb_misbuf_cas1_hit_c8 = arb_misbuf_cas1_hit_c8 & ~arb_vuad_ce_err_c8;
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_cas1_hit_c9 
                           (.din(set_arb_misbuf_cas1_hit_c8), .l1clk(l1clk),  
			.scan_in(ff_cas1_hit_c9_scanin),
			.scan_out(ff_cas1_hit_c9_scanout),
			.dout(cas1_hit_c9),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 assign  cas_rdy_set_c9[0]  = ( misbuf_ctrue_rdy_entry == 5'd0 )  & cas1_hit_c9;  
 assign  cas_rdy_set_c9[1]  = ( misbuf_ctrue_rdy_entry == 5'd1 )  & cas1_hit_c9;  
 assign  cas_rdy_set_c9[2]  = ( misbuf_ctrue_rdy_entry == 5'd2 )  & cas1_hit_c9;  
 assign  cas_rdy_set_c9[3]  = ( misbuf_ctrue_rdy_entry == 5'd3 )  & cas1_hit_c9;  
 assign  cas_rdy_set_c9[4]  = ( misbuf_ctrue_rdy_entry == 5'd4 )  & cas1_hit_c9;  
 assign  cas_rdy_set_c9[5]  = ( misbuf_ctrue_rdy_entry == 5'd5 )  & cas1_hit_c9;  
 assign  cas_rdy_set_c9[6]  = ( misbuf_ctrue_rdy_entry == 5'd6 )  & cas1_hit_c9;  
 assign  cas_rdy_set_c9[7]  = ( misbuf_ctrue_rdy_entry == 5'd7 )  & cas1_hit_c9;  
 assign  cas_rdy_set_c9[8]  = ( misbuf_ctrue_rdy_entry == 5'd8 )  & cas1_hit_c9;  
 assign  cas_rdy_set_c9[9]  = ( misbuf_ctrue_rdy_entry == 5'd9 )  & cas1_hit_c9;  
 assign  cas_rdy_set_c9[10] = ( misbuf_ctrue_rdy_entry == 5'd10 )  & cas1_hit_c9;  
 assign  cas_rdy_set_c9[11] = ( misbuf_ctrue_rdy_entry == 5'd11 )  & cas1_hit_c9;  
 assign  cas_rdy_set_c9[12] = ( misbuf_ctrue_rdy_entry == 5'd12 )  & cas1_hit_c9;  
 assign  cas_rdy_set_c9[13] = ( misbuf_ctrue_rdy_entry == 5'd13 )  & cas1_hit_c9;  
 assign  cas_rdy_set_c9[14] = ( misbuf_ctrue_rdy_entry == 5'd14 )  & cas1_hit_c9;  
 assign  cas_rdy_set_c9[15] = ( misbuf_ctrue_rdy_entry == 5'd15 )  & cas1_hit_c9;  
// BS & SR 11/04/03, MB grows to 32
 assign  cas_rdy_set_c9[16]  = ( misbuf_ctrue_rdy_entry == 5'd16 )  & cas1_hit_c9;
 assign  cas_rdy_set_c9[17]  = ( misbuf_ctrue_rdy_entry == 5'd17 )  & cas1_hit_c9;
 assign  cas_rdy_set_c9[18]  = ( misbuf_ctrue_rdy_entry == 5'd18 )  & cas1_hit_c9;
 assign  cas_rdy_set_c9[19]  = ( misbuf_ctrue_rdy_entry == 5'd19 )  & cas1_hit_c9;
 assign  cas_rdy_set_c9[20]  = ( misbuf_ctrue_rdy_entry == 5'd20 )  & cas1_hit_c9;
 assign  cas_rdy_set_c9[21]  = ( misbuf_ctrue_rdy_entry == 5'd21 )  & cas1_hit_c9;
 assign  cas_rdy_set_c9[22]  = ( misbuf_ctrue_rdy_entry == 5'd22 )  & cas1_hit_c9;
 assign  cas_rdy_set_c9[23]  = ( misbuf_ctrue_rdy_entry == 5'd23 )  & cas1_hit_c9;
 assign  cas_rdy_set_c9[24]  = ( misbuf_ctrue_rdy_entry == 5'd24 )  & cas1_hit_c9;
 assign  cas_rdy_set_c9[25]  = ( misbuf_ctrue_rdy_entry == 5'd25 )  & cas1_hit_c9;
 assign  cas_rdy_set_c9[26]  = ( misbuf_ctrue_rdy_entry == 5'd26 )  & cas1_hit_c9;
 assign  cas_rdy_set_c9[27]  = ( misbuf_ctrue_rdy_entry == 5'd27 )  & cas1_hit_c9;
 assign  cas_rdy_set_c9[28]  = ( misbuf_ctrue_rdy_entry == 5'd28 )  & cas1_hit_c9;
 assign  cas_rdy_set_c9[29]  = ( misbuf_ctrue_rdy_entry == 5'd29 )  & cas1_hit_c9;
 assign  cas_rdy_set_c9[30]  = ( misbuf_ctrue_rdy_entry == 5'd30 )  & cas1_hit_c9;
 assign  cas_rdy_set_c9[31]  = ( misbuf_ctrue_rdy_entry == 5'd31 )  & cas1_hit_c9;

 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_uncorr_err_c9 
                           (.din(deccck_uncorr_err_c8), .l1clk(l1clk),  
			.scan_in(ff_uncorr_err_c9_scanin),
			.scan_out(ff_uncorr_err_c9_scanout),
			.dout(uncorr_err_c9),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 06/13/04 added Notdata logic
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_notdata_err_c9 
                           (.din(deccck_notdata_err_c8), .l1clk(l1clk),
                        .scan_in(ff_notdata_err_c9_scanin),
                        .scan_out(ff_notdata_err_c9_scanout),
                        .dout(notdata_err_c9),
  .siclk(siclk),
  .soclk(soclk)
);


l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_corr_err_c9 
                       //    (.din(deccck_corr_err_c8), .l1clk(l1clk),
                        (.din(misbuf_corr_err_c8), .l1clk(l1clk),
                        .scan_in(ff_corr_err_c9_scanin),
                        .scan_out(ff_corr_err_c9_scanout),
                        .dout(corr_err_c9),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_inst_bufidhi_c9 
                           (.din(arbdec_arbdp_inst_bufidhi_c8), .l1clk(l1clk),
                        .scan_in(ff_inst_bufidhi_c9_scanin),
                        .scan_out(ff_inst_bufidhi_c9_scanout),
                        .dout(arbdec_arbdp_inst_bufidhi_c9),
  .siclk(siclk),
  .soclk(soclk)
);
 
assign cas_ctrue_set_preerror_c9 = cas_rdy_set_c9; // BS 04/0/4/05 : fix for bug 90935
                                   // in case of cas1 always use the cas_rdy bits to set 
                                   // mb_corr_err or mb_uncorr_err irrespective of the
                                   // ctrue bit. This is because even if the ctrue bit is 0 (miscompare)
                                   // or ctrue is not set because of error, we want to report
                                   // the error in cas ack pass.
           

 
assign	cas_ctrue_set_c9 =  cas_rdy_set_c9 &  // BS & SR 11/04/03, MB grows to 32
			({32{arbdec_arbdp_inst_bufidhi_c9}} | // if bit 116 of PCX packet (bufidhi bit) = 1'b1, force the
                                                              // compare to be true and during CAS2 phase have to write 
                                                              // Notdata into L2, BS 06/13/04. Notdata gets written by
                                                              // inverting the ecc bits of the CAS2 store data in c1 phase
                                                              // of the CAS2 pass . Ecc bits of both 4 byte chunks get
                                                              // flipped irrespective of whether it is a low cas, high cas
                                                              // or whole cas. 
                        {32{arb_misbuf_ctrue_c9 & // compare is true 
			~notdata_err_c9 & ~uncorr_err_c9}}) ; // no UE or Notdata in the read. 
 
assign	pst_ctrue_set_c8 = insert_ptr_c8 & {32{arb_pst_ctrue_en_c8}} ; // BS & SR 11/04/03, MB grows to 32
 
assign  mb_ctrue_prev = ( (pst_ctrue_set_c8 & ~{32{misbuf_vuad_ce_err_c8}}) | // pst ctrue set if no vuad error
			  cas_ctrue_set_c9 | // cas2 ctrue. 
				mb_ctrue ) &  
			~reset_valid_bit_c3 ; 
  
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_ctrue_bit  // sync reset active low // BS & SR 11/04/03, MB grows to 32
                           (.din(mb_ctrue_prev[31:0]), .l1clk(l1clk),  
	.scan_in(ff_ctrue_bit_scanin),
	.scan_out(ff_ctrue_bit_scanout),
	.clr(~dbb_rst_l), .dout(mb_ctrue[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
////////////////////////////////////////////////////////////////////////////// 
// Miss Buffer ID to the Fill Buffer: The ID( mbf entry #) of a miss buffer  
// instruction is written into the Fill Buffer in the following cases 
// 1) INstruction from the miss buffer is deleted due to a Fill Buffer hit 
//    and hence the dependent instruction's ID is written into the FIll Buffer. 
// 2) Instruction from the IQ hits the Fill Buffer ( and is a non-dependent 
//    instruction ) so its ID is written into the Fill Buffer. 
// 3) ID of a "true miss" when it requests to DRAM and enqueues in the FB 
// Here is the Pipeline for case 1 and case 2. 
// 
// case 1: The next link mux has to be mbist_done in C3 to  
// 	   handle the case where a dependent was just issued 
//	   from the IQ one cycle before the Miss Buffer 
//	   instruction that will complete. 
//--------------------------------------------- 
//	C3		C4		C5 
//--------------------------------------------- 
//			mbf 		fbf 
//			delete		write 
//	nextlink mux 
// 
//	nextlink vld 
//	logic 
//------------------------------------ 
// 
//  
// case 2 
//------------------------------------ 
// 	C4		C5 
//------------------------------------ 
// 	mbf insert	fbf write 
//				 
//	enc tag wr ptr 
//---------------------------------------------------------------------------- 
////////////////////////////////////////////////////////////////////////////// 
 
// case 2 related control output 
 
assign	mbf_insert_mbid_c3 = enc_tag_wr_wl_c3 ; 
 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_mbf_insert_mbid_c4  // BS & SR 11/04/03, MB grows to 32
                           (.din(mbf_insert_mbid_c3[4:0]), .l1clk(l1clk),  
		.scan_in(ff_mbf_insert_mbid_c4_scanin),
		.scan_out(ff_mbf_insert_mbid_c4_scanout),
		.dout(misbuf_mbf_insert_mbid_c4[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbf_insert_c4 
                           (.din(mbf_insert_c3), .l1clk(l1clk),  
		.scan_in(ff_mbf_insert_c4_scanin),
		.scan_out(ff_mbf_insert_c4_scanout),
		.dout(misbuf_mbf_insert_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_hit_c3 
                           (.din(misbuf_hit_c2), .l1clk(l1clk),  
		.scan_in(ff_misbuf_hit_c3_scanin),
		.scan_out(ff_misbuf_hit_c3_scanout),
		.dout(misbuf_hit_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 

//--\/--- ADDED TO FIX bug#4619 -----\/-----------
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_arb_hit_c3  // int 5.0 changes
                           (.din(misbuf_hit_c2), .l1clk(l1clk),
                .scan_in(ff_misbuf_arb_hit_c3_scanin),
                .scan_out(ff_misbuf_arb_hit_c3_scanout),
                .dout(misbuf_arb_hit_c3),
  .siclk(siclk),
  .soclk(soclk)  
);
//--\/--- ADDED TO FIX bug#4619 -----\/-----------


l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_hit_c4 
(.din({misbuf_hit_c3}), .l1clk(l1clk),  
.scan_in(ff_misbuf_hit_c4_scanin),
.scan_out(ff_misbuf_hit_c4_scanout),
.dout({misbuf_hit_c4}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// Case 1 related. 
 
assign	misbuf_next_vld_c3 = ( |( dec_mb_entry_c3 & ~mb_young))  &  
				inst_mb_c3  & 
                                mb_inst_vld_c3_1 ; 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_filbuf_next_vld_c4 
                           (.din(misbuf_next_vld_c3), .l1clk(l1clk), 
             .scan_in(ff_misbuf_filbuf_next_vld_c4_scanin),
             .scan_out(ff_misbuf_filbuf_next_vld_c4_scanout),
             .dout(misbuf_filbuf_next_vld_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mbf_delete_c4 
                           (.din(mbf_delete_c3), .l1clk(l1clk), 
             .scan_in(ff_mbf_delete_c4_scanin),
             .scan_out(ff_mbf_delete_c4_scanout),
             .dout(misbuf_mbf_delete_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign  sel_0to3 = |( dec_mb_entry_c3[3:0] ); 
assign  sel_4to7 = |( dec_mb_entry_c3[7:4] ); 
assign  sel_8to11 = |( dec_mb_entry_c3[11:8] ); 
assign  sel_12to15 = |( dec_mb_entry_c3[15:12] ); 
// BS & SR 11/04/03, MB grows to 32
assign  sel_19to16 = |( dec_mb_entry_c3[19:16] ); 
assign  sel_23to20 = |( dec_mb_entry_c3[23:20] ); 
assign  sel_27to24 = |( dec_mb_entry_c3[27:24] ); 
assign  sel_31to28 = |( dec_mb_entry_c3[31:28] ); 

assign  sel_default_0123 =  ~sel_0to3 | dec_mb_entry_c3[3]  ; 
assign  sel_default_4567 =  ~sel_4to7 | dec_mb_entry_c3[7]  ; 
assign  sel_default_89ab =  ~sel_8to11 | dec_mb_entry_c3[11] ; 
assign  sel_default_cdef =  ~sel_12to15 | dec_mb_entry_c3[15] ; 
// BS & SR 11/04/03, MB grows to 32
assign  sel_default_a_0123 =  ~sel_19to16 | dec_mb_entry_c3[19]  ; 
assign  sel_default_a_4567 =  ~sel_23to20 | dec_mb_entry_c3[23]  ; 
assign  sel_default_a_89ab =  ~sel_27to24 | dec_mb_entry_c3[27] ; 
assign  sel_default_a_cdef =  ~sel_31to28 | dec_mb_entry_c3[31] ; 

assign  sel_default_0to15 = (sel_0to3 | sel_4to7 | sel_8to11 | sel_12to15);
assign  sel_default_16to31 = ~sel_default_0to15;
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_nextlink_0123 
	( .dout(nextlink_id0123[4:0]), 
          .din0(next_link_entry0[4:0]), .din1(next_link_entry1[4:0]), 
          .din2(next_link_entry2[4:0]), .din3(next_link_entry3[4:0]), 
          .sel0(dec_mb_entry_c3[0]), .sel1(dec_mb_entry_c3[1]), 
          .sel2(dec_mb_entry_c3[2]), .sel3(sel_default_0123)); 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_nextlink_4567 
	( .dout(nextlink_id4567[4:0]), 
          .din0(next_link_entry4[4:0]), .din1(next_link_entry5[4:0]), 
          .din2(next_link_entry6[4:0]), .din3(next_link_entry7[4:0]), 
          .sel0(dec_mb_entry_c3[4]), .sel1(dec_mb_entry_c3[5]), 
          .sel2(dec_mb_entry_c3[6]), .sel3(sel_default_4567)); 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_nextlink_89ab 
	( .dout(nextlink_id89ab[4:0]), 
          .din0(next_link_entry8[4:0]), .din1(next_link_entry9[4:0]), 
          .din2(next_link_entry10[4:0]), .din3(next_link_entry11[4:0]), 
          .sel0(dec_mb_entry_c3[8]), .sel1(dec_mb_entry_c3[9]), 
          .sel2(dec_mb_entry_c3[10]), .sel3(sel_default_89ab)); 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_nextlink_cdef 
	(.dout(nextlink_idcdef[4:0]), 
          .din0(next_link_entry12[4:0]), .din1(next_link_entry13[4:0]), 
          .din2(next_link_entry14[4:0]), .din3(next_link_entry15[4:0]), 
          .sel0(dec_mb_entry_c3[12]), .sel1(dec_mb_entry_c3[13]), 
          .sel2(dec_mb_entry_c3[14]), .sel3(sel_default_cdef)); 

// BS & SR 11/04/03, MB grows to 32

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_nextlink_a0123 
        (
	.dout(nextlink_ida0123[4:0]),
	.din0(next_link_entry16[4:0]),
	.din1(next_link_entry17[4:0]),
	.din2(next_link_entry18[4:0]),
	.din3(next_link_entry19[4:0]),
	.sel0(dec_mb_entry_c3[16]),
	.sel1(dec_mb_entry_c3[17]),
	.sel2(dec_mb_entry_c3[18]),
	.sel3(sel_default_a_0123)
	);

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_nextlink_a4567 
        (
        .dout(nextlink_ida4567[4:0]),
        .din0(next_link_entry20[4:0]),
        .din1(next_link_entry21[4:0]),
        .din2(next_link_entry22[4:0]),
        .din3(next_link_entry23[4:0]),
        .sel0(dec_mb_entry_c3[20]),
        .sel1(dec_mb_entry_c3[21]),
        .sel2(dec_mb_entry_c3[22]),
        .sel3(sel_default_a_4567)
        );

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_nextlink_a89ab 
        (
        .dout(nextlink_ida89ab[4:0]),
        .din0(next_link_entry24[4:0]),
        .din1(next_link_entry25[4:0]),
        .din2(next_link_entry26[4:0]),
        .din3(next_link_entry27[4:0]),
        .sel0(dec_mb_entry_c3[24]),
        .sel1(dec_mb_entry_c3[25]),
        .sel2(dec_mb_entry_c3[26]),
        .sel3(sel_default_a_89ab)
        );
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_nextlink_acdef 
        (
        .dout(nextlink_idacdef[4:0]),
        .din0(next_link_entry28[4:0]),
        .din1(next_link_entry29[4:0]),
        .din2(next_link_entry30[4:0]),
        .din3(next_link_entry31[4:0]),
        .sel0(dec_mb_entry_c3[28]),
        .sel1(dec_mb_entry_c3[29]),
        .sel2(dec_mb_entry_c3[30]),
        .sel3(sel_default_a_cdef)
        );

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_next_link_c3_a 
	(.dout(misbuf_next_link_a_c3[4:0]), 
         .din0(nextlink_id0123[4:0]), .din1(nextlink_id4567[4:0]), 
         .din2(nextlink_id89ab[4:0]), .din3(nextlink_idcdef[4:0]), 
         .sel0(sel_0to3), 
	 .sel1(sel_4to7), 
         .sel2(sel_8to11), 
	 .sel3(sel_12to15)); 

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_next_link_c3_b 
        (.dout(misbuf_next_link_b_c3[4:0]),
         .din0(nextlink_ida0123[4:0]), .din1(nextlink_ida4567[4:0]), 
         .din2(nextlink_ida89ab[4:0]), .din3(nextlink_idacdef[4:0]), 
         .sel0(sel_19to16),
         .sel1(sel_23to20),
         .sel2(sel_27to24), 
         .sel3(sel_31to28));

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_5 mux_next_link_c3 
        (.dout(misbuf_next_link_c3[4:0]),
         .din0(misbuf_next_link_a_c3[4:0]),
         .din1(misbuf_next_link_b_c3[4:0]),
         .sel0(sel_default_0to15),
         .sel1(sel_default_16to31)
         );

 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_misbuf_filbuf_next_link_c4  // BS & SR 11/04/03, MB grows to 32
                           (.din(misbuf_next_link_c3[4:0]), .l1clk(l1clk), 
             .scan_in(ff_misbuf_filbuf_next_link_c4_scanin),
             .scan_out(ff_misbuf_filbuf_next_link_c4_scanout),
             .dout(misbuf_filbuf_next_link_c4[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
////////////////////////////////////////////////////////////////////////////// 
// MB_DATA_VLD in misbuf: A zero in this bit for a valid instruction is  
//			 used to indicate that the instruction is inflight	 
//			 and even if READY=1 , it cannot be picked for issue. 
////////////////////////////////////////////////////////////////////////////// 
 
assign	mb_data_vld_in =  (( insert_ptr_c8 & {32{misbuf_mbdata_wr_en_c8}} ) | // BS & SR 11/04/03, MB grows to 32 
				mb_data_vld ) &  
			~( picker_out_d1 & {32{l2_pick_d1}} ) ; // reset on pick 

 
 
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_mb_data_vld  // sync reset active low , BS & SR 11/04/03, MB grows to 32
                           (.din(mb_data_vld_in[31:0]), .l1clk(l1clk), 
        .scan_in(ff_mb_data_vld_scanin),
        .scan_out(ff_mb_data_vld_scanout),
        .clr(~dbb_rst_l), .dout(mb_data_vld[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
////////////////////////////////////////////////////////////////////////////// 
// EVICT READY bit in Mbctl: THis is a duplicate of the evict bit 
//	written into mbdata.  USed for 
//	* Picking instructions for their eviction pass. 
//	* Potentially disable the pick of evict ready entries 
//	  when the WBB is full thereby removing the WBB full condition 
//	  from the arbiter. 
// 	Notice that tecc pick has a higher priority than an evict pick. 
// A mb_tecc_ready pick was originally designed not to reset the evict_ready 
// bit. However, if evict_ready & tecc_ready, we can reset both the ready bits 
// because, the tecc&evict instruction will cause a scrub and also cause evict_ready 
// to be set again. 
////////////////////////////////////////////////////////////////////////////// 
// for a pf ice in first pass do not set this evict ready till the 
// requests pending in mb is processed.
 

assign misbuf_evict_qual_c7 = misbuf_evict_nopfice_c7;

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_gate_evict_set_staging 
       (
	.scan_in(ff_gate_evict_set_staging_scanin),
	.scan_out(ff_gate_evict_set_staging_scanout),
	.din(misbuf_evict_qual_c7),
	.l1clk(l1clk),
	.dout(misbuf_evict_c8_pfice_qual),
  .siclk(siclk),
  .soclk(soclk)
	);


assign  mb_evict_ready_in = (( insert_ptr_c8 & {32{misbuf_evict_c8_pfice_qual}}) |  
				pfice_inst_rdy | mb_evict_ready ) & 
                        ~( picker_out_d1 &   {32{l2_pick_d1}} ) ;  // BS & SR 11/04/03, MB grows to 32 
		// reset on pick 
 
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_mb_evict_ready  // sync reset active low , BS & SR 11/04/03, MB grows to 32
                           (.din(mb_evict_ready_in[31:0]), .l1clk(l1clk), 
        .scan_in(ff_mb_evict_ready_scanin),
        .scan_out(ff_mb_evict_ready_scanout),
        .clr(~dbb_rst_l), .dout(mb_evict_ready[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
////////////////////////////////////////////////////////////////////////////// 
// TECC READY bit in Mbctl: THis is a duplicate of the tecc bit 
//	written into mbdata.  USed for 
//	* Picking instructions for their tecc pass. 
// 	Tecc pick has a higher priority than an evict pick. 
// Notice that all TECCs do not cause the setting of a TECC bit in the $. 
// If an instruction gets bypassed data from the Fill Buffer, the tecc is  
// a don't care. ALso, a parity error will not be signalled if a hit  
// is encountered inspite of a parity error in another way 
////////////////////////////////////////////////////////////////////////////// 
 
assign  mb_tecc_ready_in = (( insert_ptr_c8 & {32{misbuf_tecc_c8  
				& misbuf_mbdata_wr_en_c8 }}) |  
				mb_tecc_ready ) & // BS & SR 11/04/03, MB grows to 32 
                  ~( picker_out_d1 &  {32{l2_pick_d1}} ) ; // reset on pick 
 
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_mb_tecc_ready  // sync reset active low
                           (.din(mb_tecc_ready_in[31:0]), .l1clk(l1clk), 
        .scan_in(ff_mb_tecc_ready_scanin),
        .scan_out(ff_mb_tecc_ready_scanout),
        .clr(~dbb_rst_l), .dout(mb_tecc_ready[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
////////////////////////////////////////////////////////////////////////////// 
// L2_READY in misbuf: This bit is set for any instruction in the mBF that is 
//	ready for issue/reissue down the L2 pipeline. the READY bit for an  
// 	entry is reset when that entry is "l2 picked". The following 
//	components go into the L2_READY set condition. 
//	* Misses Readied on mcu data arrival by  the FIll Buffer. 
//	* Stores/ Miss Buffer dependents readied on a Fill by the  
//	  Fill Buffer ( Readied in the C4 cycle of a FILL ). 
//	* Miss Buffer dependents readied when the older instruction 
//	  dequeues from the Miss Buffer. ( in the C4 stage of the older inst.)  
//	* WBB dependents readied when the Write back is acked by DRAM/BTU 
//	* Ready a CSR instruction when the FIll Buffer is empty and the mIss Buffer 
//	  has only one entry available. 
//	* Ready a Partial store for its 2nd pass if the 1st pass is able to  
//	  set the CTRUE bit. 
//	* Ready a CAS2 packet if the CAS1 packet hits the $ or FB after the 
//	  first packet has reached C8. 
//	* Ready a STQ2 packet if the STQ1 packet hits the $ or FB after the 
//        first packet has reached C4 
//	* Ready a tecc instruction in C8 
////////////////////////////////////////////////////////////////////////////// 
 
////// 
// Misses Readied on mcu data arrival by  the FIll Buffer 
//-------------------------------------- 
//	R1			R2 
//------------------------------------ 
//	rd_data_vld_d1		ready 
//				dep 
// 	mux out 
//	ID of true miss 
//	mbf inst. in 
//	filbuf. 
////// 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_ready_miss_r2 
                           (.din(filbuf_fbf_ready_miss_r1), .l1clk(l1clk), 
                               .scan_in(ff_ready_miss_r2_scanin),
                               .scan_out(ff_ready_miss_r2_scanout),
                               .dout(ready_miss_r2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_fbf_enc_ld_mbid_r1  // BS & SR 11/04/03, MB grows to 32
                           (.din(filbuf_fbf_enc_ld_mbid_r1[4:0]), .l1clk(l1clk), 
                               .scan_in(ff_fbf_enc_ld_mbid_r1_scanin),
                               .scan_out(ff_fbf_enc_ld_mbid_r1_scanout),
                               .dout(ld_mbid_r2[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign  mb_miss_rdy_r2[0]  = ( ld_mbid_r2 == 5'd0) & ready_miss_r2 ; 
assign  mb_miss_rdy_r2[1]  = ( ld_mbid_r2 == 5'd1) & ready_miss_r2 ; 
assign  mb_miss_rdy_r2[2]  = ( ld_mbid_r2 == 5'd2) & ready_miss_r2 ; 
assign  mb_miss_rdy_r2[3]  = ( ld_mbid_r2 == 5'd3) & ready_miss_r2 ; 
assign  mb_miss_rdy_r2[4]  = ( ld_mbid_r2 == 5'd4) & ready_miss_r2 ; 
assign  mb_miss_rdy_r2[5]  = ( ld_mbid_r2 == 5'd5) & ready_miss_r2 ; 
assign  mb_miss_rdy_r2[6]  = ( ld_mbid_r2 == 5'd6) & ready_miss_r2 ; 
assign  mb_miss_rdy_r2[7]  = ( ld_mbid_r2 == 5'd7) & ready_miss_r2 ; 
assign  mb_miss_rdy_r2[8]  = ( ld_mbid_r2 == 5'd8) & ready_miss_r2 ; 
assign  mb_miss_rdy_r2[9]  = ( ld_mbid_r2 == 5'd9) & ready_miss_r2 ; 
assign  mb_miss_rdy_r2[10] = ( ld_mbid_r2 == 5'd10) & ready_miss_r2 ; 
assign  mb_miss_rdy_r2[11] = ( ld_mbid_r2 == 5'd11) & ready_miss_r2 ; 
assign  mb_miss_rdy_r2[12] = ( ld_mbid_r2 == 5'd12) & ready_miss_r2 ; 
assign  mb_miss_rdy_r2[13] = ( ld_mbid_r2 == 5'd13) & ready_miss_r2 ; 
assign  mb_miss_rdy_r2[14] = ( ld_mbid_r2 == 5'd14) & ready_miss_r2 ; 
assign  mb_miss_rdy_r2[15] = ( ld_mbid_r2 == 5'd15) & ready_miss_r2 ; 
// BS & SR 11/04/03, MB grows to 32
assign  mb_miss_rdy_r2[16]  = ( ld_mbid_r2 == 5'd16) & ready_miss_r2 ;
assign  mb_miss_rdy_r2[17]  = ( ld_mbid_r2 == 5'd17) & ready_miss_r2 ;
assign  mb_miss_rdy_r2[18]  = ( ld_mbid_r2 == 5'd18) & ready_miss_r2 ;
assign  mb_miss_rdy_r2[19]  = ( ld_mbid_r2 == 5'd19) & ready_miss_r2 ;
assign  mb_miss_rdy_r2[20]  = ( ld_mbid_r2 == 5'd20) & ready_miss_r2 ;
assign  mb_miss_rdy_r2[21]  = ( ld_mbid_r2 == 5'd21) & ready_miss_r2 ;
assign  mb_miss_rdy_r2[22]  = ( ld_mbid_r2 == 5'd22) & ready_miss_r2 ;
assign  mb_miss_rdy_r2[23]  = ( ld_mbid_r2 == 5'd23) & ready_miss_r2 ;
assign  mb_miss_rdy_r2[24]  = ( ld_mbid_r2 == 5'd24) & ready_miss_r2 ;
assign  mb_miss_rdy_r2[25]  = ( ld_mbid_r2 == 5'd25) & ready_miss_r2 ;
assign  mb_miss_rdy_r2[26] =  ( ld_mbid_r2 == 5'd26) & ready_miss_r2 ;
assign  mb_miss_rdy_r2[27] =  ( ld_mbid_r2 == 5'd27) & ready_miss_r2 ;
assign  mb_miss_rdy_r2[28] =  ( ld_mbid_r2 == 5'd28) & ready_miss_r2 ;
assign  mb_miss_rdy_r2[29] =  ( ld_mbid_r2 == 5'd29) & ready_miss_r2 ;
assign  mb_miss_rdy_r2[30] =  ( ld_mbid_r2 == 5'd30) & ready_miss_r2 ;
assign  mb_miss_rdy_r2[31] =  ( ld_mbid_r2 == 5'd31) & ready_miss_r2 ;


 
////// 
// Stores/ Miss Buffer dependents in FB 
// readied in the C5 cycle of a Fill 
//-------------------------------------- 
//	C4			C5 
//------------------------------------ 
//	fill_complete_c4	ready 
//				dep 
// 	mux out 
//	ID of dependent 
//	mbf inst. in 
//	filbuf. 
////// 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_fbf_st_or_dep_rdy_c5 
                           (.din(filbuf_fbf_st_or_dep_rdy_c4), .l1clk(l1clk), 
               .scan_in(ff_fbf_st_or_dep_rdy_c5_scanin),
               .scan_out(ff_fbf_st_or_dep_rdy_c5_scanout),
               .dout(st_or_dep_rdy_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_fbf_enc_dep_mbid_c5  // BS & SR 11/04/03, MB grows to 32
                           (.din(filbuf_fbf_enc_dep_mbid_c4[4:0]), .l1clk(l1clk), 
               .scan_in(ff_fbf_enc_dep_mbid_c5_scanin),
               .scan_out(ff_fbf_enc_dep_mbid_c5_scanout),
               .dout(dep_mbid_c5[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
assign  fb_dep_rdy_c5[0] = ( dep_mbid_c5 == 5'd0) & st_or_dep_rdy_c5 ; 
assign  fb_dep_rdy_c5[1] = ( dep_mbid_c5 == 5'd1) & st_or_dep_rdy_c5 ; 
assign  fb_dep_rdy_c5[2] = ( dep_mbid_c5 == 5'd2) & st_or_dep_rdy_c5 ; 
assign  fb_dep_rdy_c5[3] = ( dep_mbid_c5 == 5'd3) & st_or_dep_rdy_c5 ; 
assign  fb_dep_rdy_c5[4] = ( dep_mbid_c5 == 5'd4) & st_or_dep_rdy_c5 ; 
assign  fb_dep_rdy_c5[5] = ( dep_mbid_c5 == 5'd5) & st_or_dep_rdy_c5 ; 
assign  fb_dep_rdy_c5[6] = ( dep_mbid_c5 == 5'd6) & st_or_dep_rdy_c5 ; 
assign  fb_dep_rdy_c5[7] = ( dep_mbid_c5 == 5'd7) & st_or_dep_rdy_c5 ; 
assign  fb_dep_rdy_c5[8] = ( dep_mbid_c5 == 5'd8) & st_or_dep_rdy_c5 ; 
assign  fb_dep_rdy_c5[9] = ( dep_mbid_c5 == 5'd9) & st_or_dep_rdy_c5 ; 
assign  fb_dep_rdy_c5[10] = ( dep_mbid_c5 == 5'd10) & st_or_dep_rdy_c5 ; 
assign  fb_dep_rdy_c5[11] = ( dep_mbid_c5 == 5'd11) & st_or_dep_rdy_c5 ; 
assign  fb_dep_rdy_c5[12] = ( dep_mbid_c5 == 5'd12) & st_or_dep_rdy_c5 ; 
assign  fb_dep_rdy_c5[13] = ( dep_mbid_c5 == 5'd13) & st_or_dep_rdy_c5 ; 
assign  fb_dep_rdy_c5[14] = ( dep_mbid_c5 == 5'd14) & st_or_dep_rdy_c5 ; 
assign  fb_dep_rdy_c5[15] = ( dep_mbid_c5 == 5'd15) & st_or_dep_rdy_c5 ; 
// BS & SR 11/04/03, MB grows to 32
assign  fb_dep_rdy_c5[16] = ( dep_mbid_c5 == 5'd16) & st_or_dep_rdy_c5 ;
assign  fb_dep_rdy_c5[17] = ( dep_mbid_c5 == 5'd17) & st_or_dep_rdy_c5 ;
assign  fb_dep_rdy_c5[18] = ( dep_mbid_c5 == 5'd18) & st_or_dep_rdy_c5 ;
assign  fb_dep_rdy_c5[19] = ( dep_mbid_c5 == 5'd19) & st_or_dep_rdy_c5 ;
assign  fb_dep_rdy_c5[20] = ( dep_mbid_c5 == 5'd20) & st_or_dep_rdy_c5 ;
assign  fb_dep_rdy_c5[21] = ( dep_mbid_c5 == 5'd21) & st_or_dep_rdy_c5 ;
assign  fb_dep_rdy_c5[22] = ( dep_mbid_c5 == 5'd22) & st_or_dep_rdy_c5 ;
assign  fb_dep_rdy_c5[23] = ( dep_mbid_c5 == 5'd23) & st_or_dep_rdy_c5 ;
assign  fb_dep_rdy_c5[24] = ( dep_mbid_c5 == 5'd24) & st_or_dep_rdy_c5 ;
assign  fb_dep_rdy_c5[25] = ( dep_mbid_c5 == 5'd25) & st_or_dep_rdy_c5 ;
assign  fb_dep_rdy_c5[26] = ( dep_mbid_c5 == 5'd26) & st_or_dep_rdy_c5 ;
assign  fb_dep_rdy_c5[27] = ( dep_mbid_c5 == 5'd27) & st_or_dep_rdy_c5 ;
assign  fb_dep_rdy_c5[28] = ( dep_mbid_c5 == 5'd28) & st_or_dep_rdy_c5 ;
assign  fb_dep_rdy_c5[29] = ( dep_mbid_c5 == 5'd29) & st_or_dep_rdy_c5 ;
assign  fb_dep_rdy_c5[30] = ( dep_mbid_c5 == 5'd30) & st_or_dep_rdy_c5 ;
assign  fb_dep_rdy_c5[31] = ( dep_mbid_c5 == 5'd31) & st_or_dep_rdy_c5 ;


 
////// 
//  Miss Buffer dependents READY: 
//-------------------------------------- 
//	C3			C4 
//------------------------------------ 
//	mbf_delete_c3		ready 
//				dep 
// 	mux out 
//	ID of dependent 
//	mbf inst. in 
//	misbuf. 
// 
//	find out 
//	if next_link 
//	is vld. 
//------------------------------------ 
// We  do not ready a miss buffer dependent immediately 
// after the older instruction dequeues from the Miss buffer.
// There are cases where the dependent may have to wait in the miss buffer
// for other events to occur. For example, a load that hits the fill Buffer
// will not ready the Miss Buffer dependent.
// 
// dep rdy conditions: 
// - older instruction hits the $ ( non cas1). 
// - older instruction is a wr64 and completes. 
// - older instruction is a ld64 and hits the FB. 
// -older instruction hits FB in $ off mode. 
//  
////// 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_decdp_cas1_inst_c2 
                           (.din(arb_decdp_cas1_inst_c2), .l1clk(l1clk), 
               .scan_in(ff_decdp_cas1_inst_c2_scanin),
               .scan_out(ff_decdp_cas1_inst_c2_scanout),
               .dout(cas1_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_l2_bypass_mode_on_d1 
                           (.din(csr_l2_bypass_mode_on), .l1clk(l1clk), 
               .scan_in(ff_l2_bypass_mode_on_d1_scanin),
               .scan_out(ff_l2_bypass_mode_on_d1_scanout),
               .dout(l2_bypass_mode_on_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_filbuf_match_c3 
                           (.din(filbuf_misbuf_match_c2), .l1clk(l1clk), 
               .scan_in(ff_filbuf_match_c3_scanin),
               .scan_out(ff_filbuf_match_c3_scanout),
               .dout(filbuf_match_c3_unqual),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	filbuf_match_c3 =  filbuf_match_c3_unqual &   mb_inst_vld_c3 ; 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_filbuf_stinst_match_c3 
                           (.din(filbuf_misbuf_stinst_match_c2), .l1clk(l1clk), 
               .scan_in(ff_filbuf_stinst_match_c3_scanin),
               .scan_out(ff_filbuf_stinst_match_c3_scanout),
               .dout(filbuf_stinst_match_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
// int 5.0 changes
//-----\/ FIX for bug #4619 --\/-----
// inval instructions will ready their dependents 
// when they are deleted from the miss buffer
//-----\/ FIX for bug #4619 --\/-----
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_inval_inst_c3 
                           (.din(arb_misbuf_inval_inst_c2), .l1clk(l1clk),
               .scan_in(ff_misbuf_inval_inst_c3_scanin),
               .scan_out(ff_misbuf_inval_inst_c3_scanout),
               .dout(misbuf_inval_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
);

 
 
assign	mb_dep_rdy_en_c3 =  misbuf_next_vld_c3 & mbf_delete_c3 & ( 
                        (tag_hit_c3 & ~cas1_inst_c3 & ~vuad_err_true_c3) | // fix for bug 116974
                                                                           // If instruction from MB sees a vuad error
                                                                           // but still completes e.g a load bypass from
                                                                           // Fill Buffer, it should not ready the dependant
                                                                           // in the miss buffer as the hit can be a false hit
                                                                           // due to vuad error. The fill should happen and only
                                                                           // then the dependant should be readied.
			( misbuf_inval_inst_c3) | // int 5.0 changes FIX for bug #4619
			( misbuf_wr64_miss_comp_c3 & ~tag_misbuf_par_err_c3 & ~arb_vuad_ce_err_c3) |  // int 5.0 changes
			(filbuf_match_c3 & ~cas1_inst_c3 & 
				(ld64_inst_c3  |   // fb match for ld64 
				(l2_bypass_mode_on_d1 &  
				~filbuf_stinst_match_c3  
				)) // no fill or $ OFF 
			) ); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mb_dep_rdy_en_c4 
                           (.din(mb_dep_rdy_en_c3), .l1clk(l1clk), 
               .scan_in(ff_mb_dep_rdy_en_c4_scanin),
               .scan_out(ff_mb_dep_rdy_en_c4_scanout),
               .dout(mb_dep_rdy_en_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign  mb_dep_rdy_c4[0] = ( misbuf_filbuf_next_link_c4 == 5'd0) & mb_dep_rdy_en_c4 ; 
assign  mb_dep_rdy_c4[1] = ( misbuf_filbuf_next_link_c4 == 5'd1) & mb_dep_rdy_en_c4 ; 
assign  mb_dep_rdy_c4[2] = ( misbuf_filbuf_next_link_c4 == 5'd2) & mb_dep_rdy_en_c4 ; 
assign  mb_dep_rdy_c4[3] = ( misbuf_filbuf_next_link_c4 == 5'd3) & mb_dep_rdy_en_c4 ; 
assign  mb_dep_rdy_c4[4] = ( misbuf_filbuf_next_link_c4 == 5'd4) & mb_dep_rdy_en_c4 ; 
assign  mb_dep_rdy_c4[5] = ( misbuf_filbuf_next_link_c4 == 5'd5) & mb_dep_rdy_en_c4 ; 
assign  mb_dep_rdy_c4[6] = ( misbuf_filbuf_next_link_c4 == 5'd6) & mb_dep_rdy_en_c4 ; 
assign  mb_dep_rdy_c4[7] = ( misbuf_filbuf_next_link_c4 == 5'd7) & mb_dep_rdy_en_c4 ; 
assign  mb_dep_rdy_c4[8] = ( misbuf_filbuf_next_link_c4 == 5'd8) & mb_dep_rdy_en_c4 ; 
assign  mb_dep_rdy_c4[9] = ( misbuf_filbuf_next_link_c4 == 5'd9) & mb_dep_rdy_en_c4 ; 
assign  mb_dep_rdy_c4[10] = ( misbuf_filbuf_next_link_c4 == 5'd10) & mb_dep_rdy_en_c4 ; 
assign  mb_dep_rdy_c4[11] = ( misbuf_filbuf_next_link_c4 == 5'd11) & mb_dep_rdy_en_c4 ; 
assign  mb_dep_rdy_c4[12] = ( misbuf_filbuf_next_link_c4 == 5'd12) & mb_dep_rdy_en_c4 ; 
assign  mb_dep_rdy_c4[13] = ( misbuf_filbuf_next_link_c4 == 5'd13) & mb_dep_rdy_en_c4 ; 
assign  mb_dep_rdy_c4[14] = ( misbuf_filbuf_next_link_c4 == 5'd14) & mb_dep_rdy_en_c4 ; 
assign  mb_dep_rdy_c4[15] = ( misbuf_filbuf_next_link_c4 == 5'd15) & mb_dep_rdy_en_c4 ; 
// BS & SR 11/04/03, MB grows to 32
assign  mb_dep_rdy_c4[16]  = ( misbuf_filbuf_next_link_c4 == 5'd16) & mb_dep_rdy_en_c4 ;
assign  mb_dep_rdy_c4[17]  = ( misbuf_filbuf_next_link_c4 == 5'd17) & mb_dep_rdy_en_c4 ;
assign  mb_dep_rdy_c4[18]  = ( misbuf_filbuf_next_link_c4 == 5'd18) & mb_dep_rdy_en_c4 ;
assign  mb_dep_rdy_c4[19]  = ( misbuf_filbuf_next_link_c4 == 5'd19) & mb_dep_rdy_en_c4 ;
assign  mb_dep_rdy_c4[20]  = ( misbuf_filbuf_next_link_c4 == 5'd20) & mb_dep_rdy_en_c4 ;
assign  mb_dep_rdy_c4[21]  = ( misbuf_filbuf_next_link_c4 == 5'd21) & mb_dep_rdy_en_c4 ;
assign  mb_dep_rdy_c4[22]  = ( misbuf_filbuf_next_link_c4 == 5'd22) & mb_dep_rdy_en_c4 ;
assign  mb_dep_rdy_c4[23]  = ( misbuf_filbuf_next_link_c4 == 5'd23) & mb_dep_rdy_en_c4 ;
assign  mb_dep_rdy_c4[24]  = ( misbuf_filbuf_next_link_c4 == 5'd24) & mb_dep_rdy_en_c4 ;
assign  mb_dep_rdy_c4[25]  = ( misbuf_filbuf_next_link_c4 == 5'd25) & mb_dep_rdy_en_c4 ;
assign  mb_dep_rdy_c4[26]  = ( misbuf_filbuf_next_link_c4 == 5'd26) & mb_dep_rdy_en_c4 ;
assign  mb_dep_rdy_c4[27]  = ( misbuf_filbuf_next_link_c4 == 5'd27) & mb_dep_rdy_en_c4 ;
assign  mb_dep_rdy_c4[28]  = ( misbuf_filbuf_next_link_c4 == 5'd28) & mb_dep_rdy_en_c4 ;
assign  mb_dep_rdy_c4[29]  = ( misbuf_filbuf_next_link_c4 == 5'd29) & mb_dep_rdy_en_c4 ;
assign  mb_dep_rdy_c4[30]  = ( misbuf_filbuf_next_link_c4 == 5'd30) & mb_dep_rdy_en_c4 ;
assign  mb_dep_rdy_c4[31]  = ( misbuf_filbuf_next_link_c4 == 5'd31) & mb_dep_rdy_en_c4 ;

 
/////////// 
// Ready from Wbctl for WBB hits sitting in the Miss Buffer. 
//-------------------------------------- 
//	1			2			 
//------------------------------------ 
//	wbb eviction		ready 
//	complete 
//				dep 
// 	mux out 
//	ID of dependent 
/////////// 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_wbb_dep_rdy_en_d1 
                           (.din(wbuf_misbuf_dep_rdy_en), .l1clk(l1clk), 
               .scan_in(ff_wbb_dep_rdy_en_d1_scanin),
               .scan_out(ff_wbb_dep_rdy_en_d1_scanout),
               .dout(wbb_dep_rdy_en_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_dep_mbid_d1   // BS & SR 11/04/03, MB grows to 32
                           (.din(wbuf_misbuf_dep_mbid[4:0]), .l1clk(l1clk), 
               .scan_in(ff_dep_mbid_d1_scanin),
               .scan_out(ff_dep_mbid_d1_scanout),
               .dout(wbb_dep_mbid_d1[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign  wbb_dep_rdy_d1[0] = ( wbb_dep_mbid_d1 == 5'd0) & wbb_dep_rdy_en_d1 ; 
assign  wbb_dep_rdy_d1[1] = ( wbb_dep_mbid_d1 == 5'd1) & wbb_dep_rdy_en_d1 ; 
assign  wbb_dep_rdy_d1[2] = ( wbb_dep_mbid_d1 == 5'd2) & wbb_dep_rdy_en_d1 ; 
assign  wbb_dep_rdy_d1[3] = ( wbb_dep_mbid_d1 == 5'd3) & wbb_dep_rdy_en_d1 ; 
assign  wbb_dep_rdy_d1[4] = ( wbb_dep_mbid_d1 == 5'd4) & wbb_dep_rdy_en_d1 ; 
assign  wbb_dep_rdy_d1[5] = ( wbb_dep_mbid_d1 == 5'd5) & wbb_dep_rdy_en_d1 ; 
assign  wbb_dep_rdy_d1[6] = ( wbb_dep_mbid_d1 == 5'd6) & wbb_dep_rdy_en_d1 ; 
assign  wbb_dep_rdy_d1[7] = ( wbb_dep_mbid_d1 == 5'd7) & wbb_dep_rdy_en_d1 ; 
assign  wbb_dep_rdy_d1[8] = ( wbb_dep_mbid_d1 == 5'd8) & wbb_dep_rdy_en_d1 ; 
assign  wbb_dep_rdy_d1[9] = ( wbb_dep_mbid_d1 == 5'd9) & wbb_dep_rdy_en_d1 ; 
assign  wbb_dep_rdy_d1[10] = ( wbb_dep_mbid_d1 == 5'd10) & wbb_dep_rdy_en_d1 ; 
assign  wbb_dep_rdy_d1[11] = ( wbb_dep_mbid_d1 == 5'd11) & wbb_dep_rdy_en_d1 ; 
assign  wbb_dep_rdy_d1[12] = ( wbb_dep_mbid_d1 == 5'd12) & wbb_dep_rdy_en_d1 ; 
assign  wbb_dep_rdy_d1[13] = ( wbb_dep_mbid_d1 == 5'd13) & wbb_dep_rdy_en_d1 ; 
assign  wbb_dep_rdy_d1[14] = ( wbb_dep_mbid_d1 == 5'd14) & wbb_dep_rdy_en_d1 ; 
assign  wbb_dep_rdy_d1[15] = ( wbb_dep_mbid_d1 == 5'd15) & wbb_dep_rdy_en_d1 ; 
// BS & SR 11/04/03, MB grows to 32
assign  wbb_dep_rdy_d1[16]  = ( wbb_dep_mbid_d1 == 5'd16) & wbb_dep_rdy_en_d1 ;
assign  wbb_dep_rdy_d1[17]  = ( wbb_dep_mbid_d1 == 5'd17) & wbb_dep_rdy_en_d1 ;
assign  wbb_dep_rdy_d1[18]  = ( wbb_dep_mbid_d1 == 5'd18) & wbb_dep_rdy_en_d1 ;
assign  wbb_dep_rdy_d1[19]  = ( wbb_dep_mbid_d1 == 5'd19) & wbb_dep_rdy_en_d1 ;
assign  wbb_dep_rdy_d1[20]  = ( wbb_dep_mbid_d1 == 5'd20) & wbb_dep_rdy_en_d1 ;
assign  wbb_dep_rdy_d1[21]  = ( wbb_dep_mbid_d1 == 5'd21) & wbb_dep_rdy_en_d1 ;
assign  wbb_dep_rdy_d1[22]  = ( wbb_dep_mbid_d1 == 5'd22) & wbb_dep_rdy_en_d1 ;
assign  wbb_dep_rdy_d1[23]  = ( wbb_dep_mbid_d1 == 5'd23) & wbb_dep_rdy_en_d1 ;
assign  wbb_dep_rdy_d1[24]  = ( wbb_dep_mbid_d1 == 5'd24) & wbb_dep_rdy_en_d1 ;
assign  wbb_dep_rdy_d1[25]  = ( wbb_dep_mbid_d1 == 5'd25) & wbb_dep_rdy_en_d1 ;
assign  wbb_dep_rdy_d1[26]  = ( wbb_dep_mbid_d1 == 5'd26) & wbb_dep_rdy_en_d1 ;
assign  wbb_dep_rdy_d1[27]  = ( wbb_dep_mbid_d1 == 5'd27) & wbb_dep_rdy_en_d1 ;
assign  wbb_dep_rdy_d1[28]  = ( wbb_dep_mbid_d1 == 5'd28) & wbb_dep_rdy_en_d1 ;
assign  wbb_dep_rdy_d1[29]  = ( wbb_dep_mbid_d1 == 5'd29) & wbb_dep_rdy_en_d1 ;
assign  wbb_dep_rdy_d1[30]  = ( wbb_dep_mbid_d1 == 5'd30) & wbb_dep_rdy_en_d1 ;
assign  wbb_dep_rdy_d1[31]  = ( wbb_dep_mbid_d1 == 5'd31) & wbb_dep_rdy_en_d1 ;



 
/////////// 
// Ready from rdmat for rdmat hits sitting in the Miss Buffer. 
//-------------------------------------- 
//	1			2			 
//------------------------------------ 
//	rdmat eviction		ready 
//	complete 
//				dep 
// 	mux out 
//	ID of dependent 
/////////// 
 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_rdmatb_dep_rdy_en_d1 
                           (.din(rdmat_misbuf_dep_rdy_en), .l1clk(l1clk), 
               .scan_in(ff_rdmatb_dep_rdy_en_d1_scanin),
               .scan_out(ff_rdmatb_dep_rdy_en_d1_scanout),
               .dout(rdmat_dep_rdy_en_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_5 ff_dep_rdmat_mbid_d1  // BS & SR 11/04/03, MB grows to 32
                           (.din(rdmat_misbuf_dep_mbid[4:0]), .l1clk(l1clk), 
               .scan_in(ff_dep_rdmat_mbid_d1_scanin),
               .scan_out(ff_dep_rdmat_mbid_d1_scanout),
               .dout(rdmat_dep_mbid_d1[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign  rdmat_dep_rdy_d1[0] = ( rdmat_dep_mbid_d1 == 5'd0) & rdmat_dep_rdy_en_d1 ; 
assign  rdmat_dep_rdy_d1[1] = ( rdmat_dep_mbid_d1 == 5'd1) & rdmat_dep_rdy_en_d1 ; 
assign  rdmat_dep_rdy_d1[2] = ( rdmat_dep_mbid_d1 == 5'd2) & rdmat_dep_rdy_en_d1 ; 
assign  rdmat_dep_rdy_d1[3] = ( rdmat_dep_mbid_d1 == 5'd3) & rdmat_dep_rdy_en_d1 ; 
assign  rdmat_dep_rdy_d1[4] = ( rdmat_dep_mbid_d1 == 5'd4) & rdmat_dep_rdy_en_d1 ; 
assign  rdmat_dep_rdy_d1[5] = ( rdmat_dep_mbid_d1 == 5'd5) & rdmat_dep_rdy_en_d1 ; 
assign  rdmat_dep_rdy_d1[6] = ( rdmat_dep_mbid_d1 == 5'd6) & rdmat_dep_rdy_en_d1 ; 
assign  rdmat_dep_rdy_d1[7] = ( rdmat_dep_mbid_d1 == 5'd7) & rdmat_dep_rdy_en_d1 ; 
assign  rdmat_dep_rdy_d1[8] = ( rdmat_dep_mbid_d1 == 5'd8) & rdmat_dep_rdy_en_d1 ; 
assign  rdmat_dep_rdy_d1[9] = ( rdmat_dep_mbid_d1 == 5'd9) & rdmat_dep_rdy_en_d1 ; 
assign  rdmat_dep_rdy_d1[10] = ( rdmat_dep_mbid_d1 == 5'd10) & rdmat_dep_rdy_en_d1 ; 
assign  rdmat_dep_rdy_d1[11] = ( rdmat_dep_mbid_d1 == 5'd11) & rdmat_dep_rdy_en_d1 ; 
assign  rdmat_dep_rdy_d1[12] = ( rdmat_dep_mbid_d1 == 5'd12) & rdmat_dep_rdy_en_d1 ; 
assign  rdmat_dep_rdy_d1[13] = ( rdmat_dep_mbid_d1 == 5'd13) & rdmat_dep_rdy_en_d1 ; 
assign  rdmat_dep_rdy_d1[14] = ( rdmat_dep_mbid_d1 == 5'd14) & rdmat_dep_rdy_en_d1 ; 
assign  rdmat_dep_rdy_d1[15] = ( rdmat_dep_mbid_d1 == 5'd15) & rdmat_dep_rdy_en_d1 ; 
// BS & SR 11/04/03, MB grows to 32
assign  rdmat_dep_rdy_d1[16]  = ( rdmat_dep_mbid_d1 == 5'd16) & rdmat_dep_rdy_en_d1 ;
assign  rdmat_dep_rdy_d1[17]  = ( rdmat_dep_mbid_d1 == 5'd17) & rdmat_dep_rdy_en_d1 ;
assign  rdmat_dep_rdy_d1[18]  = ( rdmat_dep_mbid_d1 == 5'd18) & rdmat_dep_rdy_en_d1 ;
assign  rdmat_dep_rdy_d1[19]  = ( rdmat_dep_mbid_d1 == 5'd19) & rdmat_dep_rdy_en_d1 ;
assign  rdmat_dep_rdy_d1[20]  = ( rdmat_dep_mbid_d1 == 5'd20) & rdmat_dep_rdy_en_d1 ;
assign  rdmat_dep_rdy_d1[21]  = ( rdmat_dep_mbid_d1 == 5'd21) & rdmat_dep_rdy_en_d1 ;
assign  rdmat_dep_rdy_d1[22]  = ( rdmat_dep_mbid_d1 == 5'd22) & rdmat_dep_rdy_en_d1 ;
assign  rdmat_dep_rdy_d1[23]  = ( rdmat_dep_mbid_d1 == 5'd23) & rdmat_dep_rdy_en_d1 ;
assign  rdmat_dep_rdy_d1[24]  = ( rdmat_dep_mbid_d1 == 5'd24) & rdmat_dep_rdy_en_d1 ;
assign  rdmat_dep_rdy_d1[25]  = ( rdmat_dep_mbid_d1 == 5'd25) & rdmat_dep_rdy_en_d1 ;
assign  rdmat_dep_rdy_d1[26]  = ( rdmat_dep_mbid_d1 == 5'd26) & rdmat_dep_rdy_en_d1 ;
assign  rdmat_dep_rdy_d1[27]  = ( rdmat_dep_mbid_d1 == 5'd27) & rdmat_dep_rdy_en_d1 ;
assign  rdmat_dep_rdy_d1[28]  = ( rdmat_dep_mbid_d1 == 5'd28) & rdmat_dep_rdy_en_d1 ;
assign  rdmat_dep_rdy_d1[29]  = ( rdmat_dep_mbid_d1 == 5'd29) & rdmat_dep_rdy_en_d1 ;
assign  rdmat_dep_rdy_d1[30]  = ( rdmat_dep_mbid_d1 == 5'd30) & rdmat_dep_rdy_en_d1 ;
assign  rdmat_dep_rdy_d1[31]  = ( rdmat_dep_mbid_d1 == 5'd31) & rdmat_dep_rdy_en_d1 ;

/////////// 
// C8 ready.  
// * Ready for CAS2 ( readies dependent entry  in C9) 
// * PST 2nd pass  ( Readies same instruction in mb) 
// * tag parity detected (  Readies same instruction in mb) 
// * A TECC instruction ( Readies same instruction in mb) 
/////////// 
 
 
assign	cas2_or_pst_rdy_c8 = ( mb_data_wr_wl_c8 &  // insert or reinsert pointer. 
					{32{arb_pst_ctrue_en_c8  | // pst ctrue enable c8 // BS & SR 11/04/03, MB grows to 32
					arb_arbdp_tecc_inst_mb_c8 |// tecc instruction 
					rdma_comp_rdy_c8}} ) | // rdma reg incomplete instruction 
				cas_rdy_set_c9 ; // CAS rdy set c9( does not imply ctrue=1) 
 
 
/////////////////////////////// 
// CSR store ready: 
// A CSR store is inserted in the Miss Buffer  
// like any miss. The MBID of a CSR store is saved 
// since there can only be one CSR store pending 
// in the L2$. Once the cache is disabled all snoops 
// will receive a miss response from the L2. 
// 
// Pipeline for writing mbid and mbid vld for 
// a CSR write. 
//------------------------------------------- 
// 	C3		C4 
//------------------------------------------- 
//			mbidvld=1 
//			mbid = valid 
// 
//			if mb_count=1 
//			& fb_count=0 
//			set RDY. 
/////////////////////////////// 
 
 
assign	set_mbid_vld_prev=  arb_csr_st_c2   & // CSR store
                       misbuf_mbtag_wr_en_c2 ; 

 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_set_mbid_vld 
             (.din(set_mbid_vld_prev), .l1clk(l1clk),  
               .scan_in(ff_set_mbid_vld_scanin),
               .scan_out(ff_set_mbid_vld_scanout),
               .dout(set_mbid_vld),
  .siclk(siclk),
  .soclk(soclk)  
); 
		 
assign	reset_mbid_vld = ( mb_count_c4==6'd1)  // only entry is csr write, BS & SR 11/04/03, MB grows to 32
			& filbuf_fb_count_eq_0 ; // fill buffer empty. 
                         
 
assign	mbid_vld_in = ((  mbid_vld  & ~reset_mbid_vld ) | set_mbid_vld ) ; 
 
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_1 ff_mbid_vld  // sync reset active low
                           (.din(mbid_vld_in), .l1clk(l1clk), .clr(~dbb_rst_l), 
               .scan_in(ff_mbid_vld_scanin),
               .scan_out(ff_mbid_vld_scanout),
               .dout(mbid_vld),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	rdy_csr_inst_en = mbid_vld & reset_mbid_vld ; 
 
 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_mbid  // BS & SR 11/04/03, MB grows to 32
                           (.din(enc_tag_wr_wl_c3[4:0]), .l1clk(l1clk),  
		.scan_in(ff_mbid_scanin),
		.scan_out(ff_mbid_scanout),
		.en(set_mbid_vld), 
               .dout(csr_mbid[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 


 
assign  csr_inst_rdy[0] = ( csr_mbid == 5'd0) & rdy_csr_inst_en ; 
assign  csr_inst_rdy[1] = ( csr_mbid == 5'd1) & rdy_csr_inst_en ; 
assign  csr_inst_rdy[2] = ( csr_mbid == 5'd2) & rdy_csr_inst_en ; 
assign  csr_inst_rdy[3] = ( csr_mbid == 5'd3) & rdy_csr_inst_en ; 
assign  csr_inst_rdy[4] = ( csr_mbid == 5'd4) & rdy_csr_inst_en ; 
assign  csr_inst_rdy[5] = ( csr_mbid == 5'd5) & rdy_csr_inst_en ; 
assign  csr_inst_rdy[6] = ( csr_mbid == 5'd6) & rdy_csr_inst_en ; 
assign  csr_inst_rdy[7] = ( csr_mbid == 5'd7) & rdy_csr_inst_en ; 
assign  csr_inst_rdy[8] = ( csr_mbid == 5'd8) & rdy_csr_inst_en ; 
assign  csr_inst_rdy[9] = ( csr_mbid == 5'd9) & rdy_csr_inst_en ; 
assign  csr_inst_rdy[10] = ( csr_mbid == 5'd10) & rdy_csr_inst_en ; 
assign  csr_inst_rdy[11] = ( csr_mbid == 5'd11) & rdy_csr_inst_en ; 
assign  csr_inst_rdy[12] = ( csr_mbid == 5'd12) & rdy_csr_inst_en ; 
assign  csr_inst_rdy[13] = ( csr_mbid == 5'd13) & rdy_csr_inst_en ; 
assign  csr_inst_rdy[14] = ( csr_mbid == 5'd14) & rdy_csr_inst_en ; 
assign  csr_inst_rdy[15] = ( csr_mbid == 5'd15) & rdy_csr_inst_en ; 
// BS & SR 11/04/03, MB grows to 32
assign  csr_inst_rdy[16] = ( csr_mbid == 5'd16) & rdy_csr_inst_en ;
assign  csr_inst_rdy[17] = ( csr_mbid == 5'd17) & rdy_csr_inst_en ;
assign  csr_inst_rdy[18] = ( csr_mbid == 5'd18) & rdy_csr_inst_en ;
assign  csr_inst_rdy[19] = ( csr_mbid == 5'd19) & rdy_csr_inst_en ;
assign  csr_inst_rdy[20] = ( csr_mbid == 5'd20) & rdy_csr_inst_en ;
assign  csr_inst_rdy[21] = ( csr_mbid == 5'd21) & rdy_csr_inst_en ;
assign  csr_inst_rdy[22] = ( csr_mbid == 5'd22) & rdy_csr_inst_en ;
assign  csr_inst_rdy[23] = ( csr_mbid == 5'd23) & rdy_csr_inst_en ;
assign  csr_inst_rdy[24] = ( csr_mbid == 5'd24) & rdy_csr_inst_en ;
assign  csr_inst_rdy[25] = ( csr_mbid == 5'd25) & rdy_csr_inst_en ;
assign  csr_inst_rdy[26] = ( csr_mbid == 5'd26) & rdy_csr_inst_en ;
assign  csr_inst_rdy[27] = ( csr_mbid == 5'd27) & rdy_csr_inst_en ;
assign  csr_inst_rdy[28] = ( csr_mbid == 5'd28) & rdy_csr_inst_en ;
assign  csr_inst_rdy[29] = ( csr_mbid == 5'd29) & rdy_csr_inst_en ;
assign  csr_inst_rdy[30] = ( csr_mbid == 5'd30) & rdy_csr_inst_en ;
assign  csr_inst_rdy[31] = ( csr_mbid == 5'd31) & rdy_csr_inst_en ;


assign  set_mbid_vld_pfice_prev =  arb_pf_ice_inst_c2 & misbuf_mbtag_wr_en_c2;

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_set_mbid_vld_pfice_prev 
             (.din(set_mbid_vld_pfice_prev), .l1clk(l1clk),
               .scan_in(ff_set_mbid_vld_pfice_prev_scanin),
               .scan_out(ff_set_mbid_vld_pfice_prev_scanout),
               .dout(set_mbid_vld_pfice),
  .siclk(siclk),
  .soclk(soclk)
);

assign  ready_pf_ice_instr = ( mb_count_c4==6'd1)  // only entry is csr write, BS & SR 11/04/03, MB grows to 32
                        & filbuf_fb_count_eq_0 ; // fill buffer empty.

assign  pf_ice_mbid_vld_in = ((pf_ice_mbid_vld & ~ready_pf_ice_instr ) | set_mbid_vld_pfice) ;

l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_1 ff_pfice_mbid_vld  // sync reset active low
              (.din(pf_ice_mbid_vld_in), .l1clk(l1clk), .clr(~dbb_rst_l),
               .scan_in(ff_pfice_mbid_vld_scanin),
               .scan_out(ff_pfice_mbid_vld_scanout),
               .dout(pf_ice_mbid_vld),
  .siclk(siclk),
  .soclk(soclk)
);

assign  pf_ice_rdy_inst_en = pf_ice_mbid_vld & ready_pf_ice_instr ;


l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 ff_pfice_mbid  // BS & SR 11/04/03, MB grows to 32
                           (.din(enc_tag_wr_wl_c3[4:0]), .l1clk(l1clk),
                .scan_in(ff_pfice_mbid_scanin),
                .scan_out(ff_pfice_mbid_scanout),
                .en(set_mbid_vld_pfice),
               .dout(pf_ice_csr_mbid[4:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// pf ice inst ready
assign  pfice_inst_rdy[0] = ( pf_ice_csr_mbid == 5'd0) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[1] = ( pf_ice_csr_mbid == 5'd1) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[2] = ( pf_ice_csr_mbid == 5'd2) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[3] = ( pf_ice_csr_mbid == 5'd3) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[4] = ( pf_ice_csr_mbid == 5'd4) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[5] = ( pf_ice_csr_mbid == 5'd5) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[6] = ( pf_ice_csr_mbid == 5'd6) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[7] = ( pf_ice_csr_mbid == 5'd7) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[8] = ( pf_ice_csr_mbid == 5'd8) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[9] = ( pf_ice_csr_mbid == 5'd9) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[10] = ( pf_ice_csr_mbid == 5'd10) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[11] = ( pf_ice_csr_mbid == 5'd11) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[12] = ( pf_ice_csr_mbid == 5'd12) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[13] = ( pf_ice_csr_mbid == 5'd13) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[14] = ( pf_ice_csr_mbid == 5'd14) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[15] = ( pf_ice_csr_mbid == 5'd15) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[16] = ( pf_ice_csr_mbid == 5'd16) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[17] = ( pf_ice_csr_mbid == 5'd17) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[18] = ( pf_ice_csr_mbid == 5'd18) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[19] = ( pf_ice_csr_mbid == 5'd19) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[20] = ( pf_ice_csr_mbid == 5'd20) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[21] = ( pf_ice_csr_mbid == 5'd21) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[22] = ( pf_ice_csr_mbid == 5'd22) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[23] = ( pf_ice_csr_mbid == 5'd23) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[24] = ( pf_ice_csr_mbid == 5'd24) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[25] = ( pf_ice_csr_mbid == 5'd25) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[26] = ( pf_ice_csr_mbid == 5'd26) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[27] = ( pf_ice_csr_mbid == 5'd27) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[28] = ( pf_ice_csr_mbid == 5'd28) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[29] = ( pf_ice_csr_mbid == 5'd29) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[30] = ( pf_ice_csr_mbid == 5'd30) & pf_ice_rdy_inst_en ;
assign  pfice_inst_rdy[31] = ( pf_ice_csr_mbid == 5'd31) & pf_ice_rdy_inst_en ;

 
// VUAD CE ready logic


l2t_misbuf_ctl_msff_ctl_macro__width_30 ff_vuad_ce_err_ready  // VUAD ecc changes
       (
	.scan_in(ff_vuad_ce_err_ready_scanin),
	.scan_out(ff_vuad_ce_err_ready_scanout),
	.din({enc_tag_wr_wl_c3[4:0],enc_tag_wr_wl_c4[4:0],enc_tag_wr_wl_c5[4:0],enc_tag_wr_wl_c52[4:0], 
	      enc_tag_wr_wl_c6[4:0],enc_tag_wr_wl_c7[4:0]}),
	.dout({enc_tag_wr_wl_c4[4:0],enc_tag_wr_wl_c5[4:0],enc_tag_wr_wl_c52[4:0],
		enc_tag_wr_wl_c6[4:0],enc_tag_wr_wl_c7[4:0],enc_tag_wr_wl_c8[4:0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk) 
        );      


assign nonmisbuf_inst_c8 = ~misbuf_inst_c8 & arb_vuad_ce_err_c8 & buffer_miss_vld_c8;// in case of hit in any buffer,
                                                                                 // do not set vuad_ce_err_rdy bit

assign misbuf_inst_with_vuaderr_c8 = misbuf_inst_c8 & arb_vuad_ce_err_c8 & ~misbuf_evict_c8 & buffer_miss_vld_c8;

assign  vuad_ce_err_rdy[0 ] = ((enc_tag_wr_wl_c8 == 5'd0) & nonmisbuf_inst_c8) |
			      (( enc_data_wr_wl_c8==5'd0   ) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[1 ] = ((enc_tag_wr_wl_c8 == 5'd1) & nonmisbuf_inst_c8) |
			      (( enc_data_wr_wl_c8==5'd1   ) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[2 ] = ((enc_tag_wr_wl_c8 == 5'd2) & nonmisbuf_inst_c8) |
			      (( enc_data_wr_wl_c8==5'd2   ) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[3 ] = ((enc_tag_wr_wl_c8 == 5'd3) & nonmisbuf_inst_c8) |
			      (( enc_data_wr_wl_c8==5'd3   ) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[4 ] = ((enc_tag_wr_wl_c8 == 5'd4) & nonmisbuf_inst_c8) |
			      (( enc_data_wr_wl_c8==5'd4   ) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[5 ] = ((enc_tag_wr_wl_c8 == 5'd5) & nonmisbuf_inst_c8) |
			      (( enc_data_wr_wl_c8==5'd5   ) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[6 ] = ((enc_tag_wr_wl_c8 == 5'd6) & nonmisbuf_inst_c8) |
			      (( enc_data_wr_wl_c8==5'd6   ) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[7 ] = ((enc_tag_wr_wl_c8 == 5'd7) & nonmisbuf_inst_c8) |
			      (( enc_data_wr_wl_c8==5'd7   ) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[8 ] = ((enc_tag_wr_wl_c8 == 5'd8) & nonmisbuf_inst_c8) |
			      (( enc_data_wr_wl_c8==5'd8   ) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[9 ] = ((enc_tag_wr_wl_c8 == 5'd9) & nonmisbuf_inst_c8) |
			      (( enc_data_wr_wl_c8==5'd9   ) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[10] = ((enc_tag_wr_wl_c8 == 5'd10) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8==5'd10  ) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[11] = ((enc_tag_wr_wl_c8 == 5'd11) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8==5'd11  ) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[12] = ((enc_tag_wr_wl_c8 == 5'd12) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8==5'd12  ) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[13] = ((enc_tag_wr_wl_c8 == 5'd13) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8==5'd13  ) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[14] = ((enc_tag_wr_wl_c8 == 5'd14) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8==5'd14  ) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[15] = ((enc_tag_wr_wl_c8 == 5'd15) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8==5'd15  ) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[16] = ((enc_tag_wr_wl_c8 == 5'd16) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8 == 5'd16) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[17] = ((enc_tag_wr_wl_c8 == 5'd17) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8 == 5'd17) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[18] = ((enc_tag_wr_wl_c8 == 5'd18) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8 == 5'd18) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[19] = ((enc_tag_wr_wl_c8 == 5'd19) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8 == 5'd19) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[20] = ((enc_tag_wr_wl_c8 == 5'd20) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8 == 5'd20) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[21] = ((enc_tag_wr_wl_c8 == 5'd21) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8 == 5'd21) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[22] = ((enc_tag_wr_wl_c8 == 5'd22) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8 == 5'd22) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[23] = ((enc_tag_wr_wl_c8 == 5'd23) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8 == 5'd23) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[24] = ((enc_tag_wr_wl_c8 == 5'd24) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8 == 5'd24) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[25] = ((enc_tag_wr_wl_c8 == 5'd25) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8 == 5'd25) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[26] = ((enc_tag_wr_wl_c8 == 5'd26) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8 == 5'd26) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[27] = ((enc_tag_wr_wl_c8 == 5'd27) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8 == 5'd27) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[28] = ((enc_tag_wr_wl_c8 == 5'd28) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8 == 5'd28) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[29] = ((enc_tag_wr_wl_c8 == 5'd29) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8 == 5'd29) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[30] = ((enc_tag_wr_wl_c8 == 5'd30) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8 == 5'd30) & misbuf_inst_with_vuaderr_c8 );
assign  vuad_ce_err_rdy[31] = ((enc_tag_wr_wl_c8 == 5'd31) & nonmisbuf_inst_c8) |
			     (( enc_data_wr_wl_c8 == 5'd31) & misbuf_inst_with_vuaderr_c8 );

assign  clr_mb_l2_rdy_pfice = ({32{(mbissue_inst_vld_c3 & arb_pf_ice_inst_c3 & ~evict_tecc_vld_c3 & 
                                   ~arb_vuad_ce_err_c3 & ~tag_misbuf_par_err_c3)}}) & dec_mb_entry_c3; 

assign  mb_l2_ready_in = (  
			mb_miss_rdy_r2 | // miss readied by fill data 
			fb_dep_rdy_c5  | // miss/dep readied by fill op 
			mb_dep_rdy_c4 |	// mbf dep ready 
			wbb_dep_rdy_d1 |	// wbb dependent ready	 
			rdmat_dep_rdy_d1 | // rdma dep ready 
			cas2_or_pst_rdy_c8 | 	// ctrue instr 
			csr_inst_rdy | // csr stores. 
			vuad_ce_err_rdy |	// VUAD ce error ready in c9
                        mb_l2_ready ) & 
                       ~( (picker_out_d1 &  
			~mb_evict_ready &  // if evict ready is set, that is 
					   // the that will be reset before l2_ready. 
			~mb_tecc_ready &     // if tecc ready is set, that will be  
					   // the first to get reset. 
			{32{l2_pick_d1}}) // reset on pick , BS & SR 11/04/03, MB grows to 32
                        | clr_mb_l2_rdy_pfice // clear l2_ready when pfice makes its last pass 
                         ) ; 
 
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_mb_l2_ready  // sync reset active low, BS & SR 11/04/03, MB grows to 32
       (.din(mb_l2_ready_in[31:0]), .l1clk(l1clk), 
        .scan_in(ff_mb_l2_ready_scanin),
        .scan_out(ff_mb_l2_ready_scanout),
        .clr(~dbb_rst_l), .dout(mb_l2_ready[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
	); 
 
 
///////////////////////////////////////////////////////////////////////////////// 
// Interface with the L2 Arbiter: 
//  An instruction is picked for L2 issue if the the MB tag and  
//  data are not in use for a DRAM issue. 
// 
//  THe Miss buffer can issue instructions to the L2 pipeline  
//  at the rate of 1 every 3 cycles. Here is the pipeline for 
//  miss buffer issue. The following pipeline assumes that 
//  the instruction picked by the Miss Buffer for issue is  
//  immediately picked for issue by the arbiter. 
// 
//-------------------------------------------------------------------------- 
// inst A	PICK		READ (PX1)		ISSUE(PX2)	 
//-------------------------------------------------------------------------- 
//		-pick if 
//		~l2_wait	 
//		or mbsel_c1	-read mbtag		 
//				-read mbdata		 
//		-set l2_wait	-enable px2 rd flop 
//				if l2_pick_d1		- hold mbtag 
//							  and mbdata if 
//							  l2_wait 
//-------------------------------------------------------------------------- 
// 
// l2_pick is similar to mcu pick. It is used to turn off  
// L2_READY, EVICT_READY and DATA_VLD bits in misbuf. 
// 
// picker_out_qual  is used to qualify a pick. 
// If this signal is low, it implies that either 
// an l2 pick is pending issue or 
// a  mcu_pick is pending acknowledgement 
// or there is no "READY" instruction for mcu or l2 issue. 
// 
///////////////////////////////////////////////////////////////////////////////// 
 
 
assign	l2_pick = |( l2_pick_vec )  & picker_out_qual & ~mcu_pick_2  & 
			~mb_rewrite_en_c8 ; 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_l2_pick_d1 
                           (.din(l2_pick), .l1clk(l1clk),  
               .scan_in(ff_l2_pick_d1_scanin),
               .scan_out(ff_l2_pick_d1_scanout),
               .dout(l2_pick_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	l2_wait_set = l2_pick & ( ~l2_wait | arb_misbuf_mbsel_c1) ; 
assign	l2_wait_reset = arb_misbuf_mbsel_c1 ; 
 
// In the following case, set takes preference over the reset 
// condition. 
assign	l2_wait_in =  ( l2_wait  & ~l2_wait_reset) | 
			l2_wait_set  ; 
 
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_1 ff_l2_wait  // sync reset active low
                           (.din(l2_wait_in), .l1clk(l1clk), .clr(~dbb_rst_l), 
               .scan_in(ff_l2_wait_scanin),
               .scan_out(ff_l2_wait_scanout),
               .dout(l2_wait),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	picker_out_qual = ~l2_wait | 	// l2 pick active 
			 arb_misbuf_mbsel_c1 | // l2 pick selected 
			  mcu_pick_2 ;	// mcu pick 
 
 
assign	misbuf_buf_rd_en = l2t_mb2_run_r1 ? (l2t_mb2_mbtag_rd_en_r2 | l2t_mb2_mbdata_rd_en_r2)
						 : (l2_pick | mcu_pick_2); 
 
// Signals  for enabling rd data flops for the Miss Buffer. 
assign	misbuf_arb_l2rd_en = l2t_mb2_run_r1 ? 1'b1 : l2_pick_d1; 
 
assign	misbuf_arb_vld_px1 = l2_wait ; 
 
//////////////////////////// 
// CTRUE bit to L2. 
// THis is the only bit going to  
// the arbiter as part of the instr. 
// from misbuf. 
//////////////////////////// 
 
 
assign	l2_pick_read_ctrue = |( picker_out_d1 & mb_ctrue ) ; 
 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_1 ff_read_reg_ctrue_in 
                           (.din(l2_pick_read_ctrue), 
                 .scan_in(ff_read_reg_ctrue_in_scanin),
                 .scan_out(ff_read_reg_ctrue_in_scanout),
                 .en(l2_pick_d1), .l1clk(l1clk), 
                 .dout(misbuf_arbdp_ctrue_px2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
////////////////////////////////////////////////////////////////// 
// Interface with DRAM:  
// An entry with mcu_ready is picked to issue a request to  
// DRAM. If it is determined in cycle X that there is atleast one 
// mcu_ready entry in the MBF, then the pick in cycle X+1 is  
// reserved for issue to DRAM. Unless the following conditions are 
// true: 
// * Fill Buffer has no entry available. 
// * Prev request is pending to DRAM 
// 
// Pipeline for RD requests to DRAM: 
//----------------------------------------------------------------- 
//	#1		#2		#3		#4 
//----------------------------------------------------------------- 
// mcu_pick_prev	pick		mbtag rd	2-1 addr mux 
//							rd_req xmit 
//							rd_addr xmit 
// 
//							write TAG,WR/RD, 
//							mbf entry,  
//							into FB 
//							 
//----------------------------------------------------------------- 
// In the best case, cycle #1 can coincide with C4 of a miss inst. 
// 
// The Dram ready bit is set in C8. Hence it can only be consumed 
// in C9. mcu_pick_prev is set in C8 based on the mcu set  
// condition. This condition was added on 2/3/2003 
////////////////////////////////////////////////////////////////// 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mcu_l2t_rd_ack_d1 
                           (.din(mcu_l2t_rd_ack), .l1clk(l1clk), 
             .scan_in(ff_mcu_l2t_rd_ack_d1_scanin),
             .scan_out(ff_mcu_l2t_rd_ack_d1_scanout),
             .dout(mcu_l2t_rd_ack_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// VUAD ecc changes
assign	mcu_pick_prev = ~mcu_pick & // back to back picks not allowed. 
			~mb_rewrite_en_c7 & // read and write in same cyc not allowed. 
			( mcu_l2t_rd_ack_d1 | // ack from Dram 
			~mcu_ack_pend_state ) & // request pending in mcu 
			filbuf_misbuf_entry_avail & // fill buffer has entries 
			( |( mb_mcu_ready)   | 
			( misbuf_mbdata_wr_en_c8 & ~(arb_pf_ice_inst_c8 | arb_vuad_ce_err_c8) 
			   & mcu_rdy_c8 ) ); // atleast one ready entry 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_filbuf_mcu_pick 
                           (.din(mcu_pick_prev), .l1clk(l1clk), 
             .scan_in(ff_misbuf_filbuf_mcu_pick_scanin),
             .scan_out(ff_misbuf_filbuf_mcu_pick_scanout),
             .dout(misbuf_filbuf_mcu_pick),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mcu_pick 
                           (.din(mcu_pick_prev), .l1clk(l1clk), 
             .scan_in(ff_mcu_pick_scanin),
             .scan_out(ff_mcu_pick_scanout),
             .dout(mcu_pick),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mcu_pick_2 
                           (.din(mcu_pick_prev), .l1clk(l1clk), 
             .scan_in(ff_mcu_pick_2_scanin),
             .scan_out(ff_mcu_pick_2_scanout),
             .dout(mcu_pick_2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mcu_pick_d1 
                           (.din(mcu_pick), .l1clk(l1clk), 
             .scan_in(ff_mcu_pick_d1_scanin),
             .scan_out(ff_mcu_pick_d1_scanout),
             .dout(mcu_pick_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mcu_pick_d2 
                           (.din(mcu_pick_d1), .l1clk(l1clk), 
             .scan_in(ff_mcu_pick_d2_scanin),
             .scan_out(ff_mcu_pick_d2_scanout),
             .dout(mcu_pick_d2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	misbuf_arb_mcurd_en = mcu_pick_d1; 
 
assign	l2t_mcu_rd_req = mcu_pick_d2 ; 
 
 
assign	dummy_req_d1 = |( mb_bis & picker_out_d1 ) & mcu_pick_d1 ; 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_dummy_req_d2 
                           (.din(dummy_req_d1), .l1clk(l1clk), 
             .scan_in(ff_dummy_req_d2_scanin),
             .scan_out(ff_dummy_req_d2_scanout),
             .dout(dummy_req_d2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	l2t_mcu_rd_dummy_req = dummy_req_d2 ;  
 
 
 
assign	mcu_ack_pending_in = ( mcu_ack_pend_state |  
			mcu_pick ) & 
		~mcu_l2t_rd_ack_d1 ; 
 
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_1 ff_mcu_ack_pend_state  // sync reset active low
                           (.din(mcu_ack_pending_in), .l1clk(l1clk),	 
		.scan_in(ff_mcu_ack_pend_state_scanin),
		.scan_out(ff_mcu_ack_pend_state_scanout),
		.clr(~dbb_rst_l), 
             .dout(mcu_ack_pend_state),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
//////////////////////////////////////////////////////////////////// 
// Miss Buffer to Fill Buffer Miss Interface. 
// 
// The fields required for processing a miss in the Fill Buffer are 
// written in two stages:  
// 1) When it is picked for mcu issue i.e. during fill buffer insertion 
// 2) When an eviction is performed. 
//  
// THe following Bits are used for saving the fields required 
// by the Fill Buffer for miss processing that may not be available 
// at the time of fill Buffer insertion. 
// 
// WAY, FBID, WAY_VLD and FBID_VLD 
// 
// Fill Buffer id valid is asserted in the d2 cycle of a mcu_pick 
// IN the same cycle FBID is written in misbuf. 
//  
// WAY and way_vld are asserted in the C4 cycle of an eviction 
// operation. 
// 
// Prioritized(FBID_VLD and WAY_VLD) is used to mux out the 
// WAY and FBID fields from the selected miss buffer entry. 
// Also, this one hot vector is used for resetting FBID_VLD & WAY_VLD. 
//////////////////////////////////////////////////////////////////// 
 
////////////// 
// WAY FIELD: This Field needs to be maintained in misbuf 
//      WAY is stored into the WAY FIELD when an eviction 
//      operation completes and gets a way allocated for 
//      a Miss in the Miss Buffer. 
//      Needs to be used in conjunction with EVICT_DONE 
//      which is synonymous with "way valid"  
// 
//      Written in the C4 cycle of an eviction operation. 
///////////// 
 
assign		evict_vld_c3  = evict_vld_unqual_c3 & ~arb_pf_ice_inst_c3 &  
			~tag_misbuf_par_err_c3 & ~arb_vuad_ce_err_c3; // in case of vuad ce, also disable
                                                                      // setting of mb_way_vld[31:0] on an
                                                                      // eviction as the eviction will be
                                                                      // replayed 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_evict_vld_c4 
                           (.din(evict_vld_c3), .l1clk(l1clk), 
             .scan_in(ff_evict_vld_c4_scanin),
             .scan_out(ff_evict_vld_c4_scanout),
             .dout(evict_vld_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign  dec_wr_wl_c4[0]   = ( enc_data_wr_wl_c4==5'd0   ) & evict_vld_c4 ; 
assign  dec_wr_wl_c4[1]   = ( enc_data_wr_wl_c4==5'd1   ) & evict_vld_c4 ; 
assign  dec_wr_wl_c4[2]   = ( enc_data_wr_wl_c4==5'd2   ) & evict_vld_c4 ; 
assign  dec_wr_wl_c4[3]   = ( enc_data_wr_wl_c4==5'd3   ) & evict_vld_c4 ; 
assign  dec_wr_wl_c4[4]   = ( enc_data_wr_wl_c4==5'd4   ) & evict_vld_c4 ; 
assign  dec_wr_wl_c4[5]   = ( enc_data_wr_wl_c4==5'd5   ) & evict_vld_c4 ; 
assign  dec_wr_wl_c4[6]   = ( enc_data_wr_wl_c4==5'd6   ) & evict_vld_c4 ; 
assign  dec_wr_wl_c4[7]   = ( enc_data_wr_wl_c4==5'd7   ) & evict_vld_c4 ; 
assign  dec_wr_wl_c4[8]   = ( enc_data_wr_wl_c4==5'd8   ) & evict_vld_c4 ; 
assign  dec_wr_wl_c4[9]   = ( enc_data_wr_wl_c4==5'd9   ) & evict_vld_c4 ; 
assign  dec_wr_wl_c4[10]  = ( enc_data_wr_wl_c4==5'd10  ) & evict_vld_c4 ; 
assign  dec_wr_wl_c4[11]  = ( enc_data_wr_wl_c4==5'd11  ) & evict_vld_c4 ; 
assign  dec_wr_wl_c4[12]  = ( enc_data_wr_wl_c4==5'd12  ) & evict_vld_c4 ; 
assign  dec_wr_wl_c4[13]  = ( enc_data_wr_wl_c4==5'd13  ) & evict_vld_c4 ; 
assign  dec_wr_wl_c4[14]  = ( enc_data_wr_wl_c4==5'd14  ) & evict_vld_c4 ; 
assign  dec_wr_wl_c4[15]  = ( enc_data_wr_wl_c4==5'd15  ) & evict_vld_c4 ; 
assign  dec_wr_wl_c4[16]  = ( enc_data_wr_wl_c4 == 5'd16) & evict_vld_c4 ;
assign  dec_wr_wl_c4[17]  = ( enc_data_wr_wl_c4 == 5'd17) & evict_vld_c4 ;
assign  dec_wr_wl_c4[18]  = ( enc_data_wr_wl_c4 == 5'd18) & evict_vld_c4 ;
assign  dec_wr_wl_c4[19]  = ( enc_data_wr_wl_c4 == 5'd19) & evict_vld_c4 ;
assign  dec_wr_wl_c4[20]  = ( enc_data_wr_wl_c4 == 5'd20) & evict_vld_c4 ;
assign  dec_wr_wl_c4[21]  = ( enc_data_wr_wl_c4 == 5'd21) & evict_vld_c4 ;
assign  dec_wr_wl_c4[22]  = ( enc_data_wr_wl_c4 == 5'd22) & evict_vld_c4 ;
assign  dec_wr_wl_c4[23]  = ( enc_data_wr_wl_c4 == 5'd23) & evict_vld_c4 ;
assign  dec_wr_wl_c4[24]  = ( enc_data_wr_wl_c4 == 5'd24) & evict_vld_c4 ;
assign  dec_wr_wl_c4[25]  = ( enc_data_wr_wl_c4 == 5'd25) & evict_vld_c4 ;
assign  dec_wr_wl_c4[26]  = ( enc_data_wr_wl_c4 == 5'd26) & evict_vld_c4 ;
assign  dec_wr_wl_c4[27]  = ( enc_data_wr_wl_c4 == 5'd27) & evict_vld_c4 ;
assign  dec_wr_wl_c4[28]  = ( enc_data_wr_wl_c4 == 5'd28) & evict_vld_c4 ;
assign  dec_wr_wl_c4[29]  = ( enc_data_wr_wl_c4 == 5'd29) & evict_vld_c4 ;
assign  dec_wr_wl_c4[30]  = ( enc_data_wr_wl_c4 == 5'd30) & evict_vld_c4 ;
assign  dec_wr_wl_c4[31]  = ( enc_data_wr_wl_c4 == 5'd31) & evict_vld_c4 ;


   
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way0 
                           (.din(tag_lru_way_c4[3:0]), 
				  
                        .scan_in(ff_way0_scanin),
                        .scan_out(ff_way0_scanout),
                        .en(dec_wr_wl_c4[0]), .l1clk(l1clk), .dout(way0[3:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way1 
                           (.din(tag_lru_way_c4[3:0]), 
				 
                        .scan_in(ff_way1_scanin),
                        .scan_out(ff_way1_scanout),
                        .en(dec_wr_wl_c4[1]), .l1clk(l1clk), .dout(way1[3:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way2 
                           (.din(tag_lru_way_c4[3:0]), 
				 
                        .scan_in(ff_way2_scanin),
                        .scan_out(ff_way2_scanout),
                        .en(dec_wr_wl_c4[2]), .l1clk(l1clk), .dout(way2[3:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way3 
                           (.din(tag_lru_way_c4[3:0]), 
				 
                        .scan_in(ff_way3_scanin),
                        .scan_out(ff_way3_scanout),
                        .en(dec_wr_wl_c4[3]), .l1clk(l1clk), .dout(way3[3:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way4 
                           (.din(tag_lru_way_c4[3:0]), 
				 
                        .scan_in(ff_way4_scanin),
                        .scan_out(ff_way4_scanout),
                        .en(dec_wr_wl_c4[4]), .l1clk(l1clk), .dout(way4[3:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way5 
                           (.din(tag_lru_way_c4[3:0]), 
				 
                        .scan_in(ff_way5_scanin),
                        .scan_out(ff_way5_scanout),
                        .en(dec_wr_wl_c4[5]), .l1clk(l1clk), .dout(way5[3:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way6 
                           (.din(tag_lru_way_c4[3:0]), 
				 
                        .scan_in(ff_way6_scanin),
                        .scan_out(ff_way6_scanout),
                        .en(dec_wr_wl_c4[6]), .l1clk(l1clk), .dout(way6[3:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way7 
                           (.din(tag_lru_way_c4[3:0]), 
				 
                        .scan_in(ff_way7_scanin),
                        .scan_out(ff_way7_scanout),
                        .en(dec_wr_wl_c4[7]), .l1clk(l1clk), .dout(way7[3:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way8 
                           (.din(tag_lru_way_c4[3:0]), 
				 
                        .scan_in(ff_way8_scanin),
                        .scan_out(ff_way8_scanout),
                        .en(dec_wr_wl_c4[8]), .l1clk(l1clk), .dout(way8[3:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way9 
                           (.din(tag_lru_way_c4[3:0]), 
				 
                        .scan_in(ff_way9_scanin),
                        .scan_out(ff_way9_scanout),
                        .en(dec_wr_wl_c4[9]), .l1clk(l1clk), .dout(way9[3:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way10 
                           (.din(tag_lru_way_c4[3:0]), 
				 
                        .scan_in(ff_way10_scanin),
                        .scan_out(ff_way10_scanout),
                        .en(dec_wr_wl_c4[10]), .l1clk(l1clk), .dout(way10[3:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way11 
                           (.din(tag_lru_way_c4[3:0]), 
				 
                        .scan_in(ff_way11_scanin),
                        .scan_out(ff_way11_scanout),
                        .en(dec_wr_wl_c4[11]), .l1clk(l1clk), .dout(way11[3:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way12 
                           (.din(tag_lru_way_c4[3:0]), 
				 
                        .scan_in(ff_way12_scanin),
                        .scan_out(ff_way12_scanout),
                        .en(dec_wr_wl_c4[12]), .l1clk(l1clk), .dout(way12[3:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way13 
                           (.din(tag_lru_way_c4[3:0]), 
				 
                        .scan_in(ff_way13_scanin),
                        .scan_out(ff_way13_scanout),
                        .en(dec_wr_wl_c4[13]), .l1clk(l1clk), .dout(way13[3:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way14 
                           (.din(tag_lru_way_c4[3:0]), 
				 
                        .scan_in(ff_way14_scanin),
                        .scan_out(ff_way14_scanout),
                        .en(dec_wr_wl_c4[14]), .l1clk(l1clk), .dout(way14[3:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way15 
                           (.din(tag_lru_way_c4[3:0]), 
				 
                        .scan_in(ff_way15_scanin),
                        .scan_out(ff_way15_scanout),
                        .en(dec_wr_wl_c4[15]), .l1clk(l1clk), .dout(way15[3:0]),
  .siclk(siclk),
  .soclk(soclk));  

// // BS & SR 11/04/03, MB grows to 32
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way16 
	(
	.scan_in(ff_way16_scanin),
	.scan_out(ff_way16_scanout),
	.din(tag_lru_way_c4[3:0]),
	.en(dec_wr_wl_c4[16]),
	.l1clk(l1clk),
	.dout(way16[3:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);
	
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way17 
        (
        .scan_in(ff_way17_scanin),
        .scan_out(ff_way17_scanout),
        .din(tag_lru_way_c4[3:0]),
        .en(dec_wr_wl_c4[17]),
        .l1clk(l1clk),
        .dout(way17[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way18 
        (
        .scan_in(ff_way18_scanin),
        .scan_out(ff_way18_scanout),
        .din(tag_lru_way_c4[3:0]),
        .en(dec_wr_wl_c4[18]),
        .l1clk(l1clk),
        .dout(way18[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);
	
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way19 
        (
        .scan_in(ff_way19_scanin),
        .scan_out(ff_way19_scanout),
        .din(tag_lru_way_c4[3:0]),
        .en(dec_wr_wl_c4[19]),
        .l1clk(l1clk),
        .dout(way19[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way20 
        (
        .scan_in(ff_way20_scanin),
        .scan_out(ff_way20_scanout),
        .din(tag_lru_way_c4[3:0]),
        .en(dec_wr_wl_c4[20]),
        .l1clk(l1clk),
        .dout(way20[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);
 
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way21 
        (
        .scan_in(ff_way21_scanin),
        .scan_out(ff_way21_scanout),
        .din(tag_lru_way_c4[3:0]),
        .en(dec_wr_wl_c4[21]),
        .l1clk(l1clk),
        .dout(way21[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way22 
        (
        .scan_in(ff_way22_scanin),
        .scan_out(ff_way22_scanout),
        .din(tag_lru_way_c4[3:0]),
        .en(dec_wr_wl_c4[22]),
        .l1clk(l1clk),
        .dout(way22[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way23 
        (
        .scan_in(ff_way23_scanin),
        .scan_out(ff_way23_scanout),
        .din(tag_lru_way_c4[3:0]),
        .en(dec_wr_wl_c4[23]),
        .l1clk(l1clk),
        .dout(way23[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way24 
        (
        .scan_in(ff_way24_scanin),
        .scan_out(ff_way24_scanout),
        .din(tag_lru_way_c4[3:0]),
        .en(dec_wr_wl_c4[24]),
        .l1clk(l1clk),
        .dout(way24[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way25 
        (
        .scan_in(ff_way25_scanin),
        .scan_out(ff_way25_scanout),
        .din(tag_lru_way_c4[3:0]),
        .en(dec_wr_wl_c4[25]),
        .l1clk(l1clk),
        .dout(way25[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way26 
        (
        .scan_in(ff_way26_scanin),
        .scan_out(ff_way26_scanout),
        .din(tag_lru_way_c4[3:0]),
        .en(dec_wr_wl_c4[26]),
        .l1clk(l1clk),
        .dout(way26[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way27 
        (
        .scan_in(ff_way27_scanin),
        .scan_out(ff_way27_scanout),
        .din(tag_lru_way_c4[3:0]),
        .en(dec_wr_wl_c4[27]),
        .l1clk(l1clk),
        .dout(way27[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way28 
        (
        .scan_in(ff_way28_scanin),
        .scan_out(ff_way28_scanout),
        .din(tag_lru_way_c4[3:0]),
        .en(dec_wr_wl_c4[28]),
        .l1clk(l1clk),
        .dout(way28[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way29 
        (
        .scan_in(ff_way29_scanin),
        .scan_out(ff_way29_scanout),
        .din(tag_lru_way_c4[3:0]),
        .en(dec_wr_wl_c4[29]),
        .l1clk(l1clk),
        .dout(way29[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way30 
        (
        .scan_in(ff_way30_scanin),
        .scan_out(ff_way30_scanout),
        .din(tag_lru_way_c4[3:0]),
        .en(dec_wr_wl_c4[30]),
        .l1clk(l1clk),
        .dout(way30[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way31 
        (
        .scan_in(ff_way31_scanin),
        .scan_out(ff_way31_scanout),
        .din(tag_lru_way_c4[3:0]),
        .en(dec_wr_wl_c4[31]),
        .l1clk(l1clk),
        .dout(way31[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        
);

//////////// 
// WAY_VLD bit  
// set when an eviction is mbist_done in the C4 cycle 
// of an eviction packet and reset when the evicted way 
// is written into the Fill Buffer. 
// 
// For pf ice instruction, the mb_way_vld should be cleared 
// in the eviction pass 
//////////// 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_arb_pf_ice_inst_c4 
	(
	.scan_in(ff_arb_pf_ice_inst_c4_scanin),
	.scan_out(ff_arb_pf_ice_inst_c4_scanout),
	.dout	(arb_pf_ice_inst_c3),
	.din	(arb_pf_ice_inst_c2),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign	mb_way_vld_in = ( mb_way_vld | dec_wr_wl_c4 ) & 
			~(mb_way_fb_vld_reset);
 
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_mb_way_vld  // sync reset active low
                           (.din(mb_way_vld_in[31:0]), .l1clk(l1clk),   // BS & SR 11/04/03, MB grows to 32
      .scan_in(ff_mb_way_vld_scanin),
      .scan_out(ff_mb_way_vld_scanout),
      .clr(~dbb_rst_l), .dout(mb_way_vld[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
////////////// 
// FBID FIELD:  
// 	FBID is tracked in the Miss Buffer  
// 	to perform the write of Miss fields in FB 
//	asynchronous with the mcu pick. 
// 
// For a No Fill entry, fbid vld is not set 
// This is because way_vld will not be set for 
// this instruction as it never makes an eviction 
// pass.  
////////////// 
 
 
 
assign  dec_mcu_pick_d2 = picker_out_d2 & {32{mcu_pick_d2 & ~filbuf_misbuf_nofill_d2}} ;  // BS & SR 11/04/03, MB grows to 32
   
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid0 
                           (.din(filbuf_misbuf_fbid_d2[2:0]), 
				 
                        .scan_in(ff_fbid0_scanin),
                        .scan_out(ff_fbid0_scanout),
                        .en(dec_mcu_pick_d2[0]), .l1clk(l1clk), .dout(fbid0[2:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid1 
                           (.din(filbuf_misbuf_fbid_d2[2:0]), 
				 
                        .scan_in(ff_fbid1_scanin),
                        .scan_out(ff_fbid1_scanout),
                        .en(dec_mcu_pick_d2[1]), .l1clk(l1clk), .dout(fbid1[2:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid2 
                           (.din(filbuf_misbuf_fbid_d2[2:0]), 
				 
                        .scan_in(ff_fbid2_scanin),
                        .scan_out(ff_fbid2_scanout),
                        .en(dec_mcu_pick_d2[2]), .l1clk(l1clk), .dout(fbid2[2:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid3 
                           (.din(filbuf_misbuf_fbid_d2[2:0]), 
				 
                        .scan_in(ff_fbid3_scanin),
                        .scan_out(ff_fbid3_scanout),
                        .en(dec_mcu_pick_d2[3]), .l1clk(l1clk), .dout(fbid3[2:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid4 
                           (.din(filbuf_misbuf_fbid_d2[2:0]), 
				 
                        .scan_in(ff_fbid4_scanin),
                        .scan_out(ff_fbid4_scanout),
                        .en(dec_mcu_pick_d2[4]), .l1clk(l1clk), .dout(fbid4[2:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid5 
                           (.din(filbuf_misbuf_fbid_d2[2:0]), 
				 
                        .scan_in(ff_fbid5_scanin),
                        .scan_out(ff_fbid5_scanout),
                        .en(dec_mcu_pick_d2[5]), .l1clk(l1clk), .dout(fbid5[2:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid6 
                           (.din(filbuf_misbuf_fbid_d2[2:0]), 
				 
                        .scan_in(ff_fbid6_scanin),
                        .scan_out(ff_fbid6_scanout),
                        .en(dec_mcu_pick_d2[6]), .l1clk(l1clk), .dout(fbid6[2:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid7 
                           (.din(filbuf_misbuf_fbid_d2[2:0]), 
				 
                        .scan_in(ff_fbid7_scanin),
                        .scan_out(ff_fbid7_scanout),
                        .en(dec_mcu_pick_d2[7]), .l1clk(l1clk), .dout(fbid7[2:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid8 
                           (.din(filbuf_misbuf_fbid_d2[2:0]), 
				 
                        .scan_in(ff_fbid8_scanin),
                        .scan_out(ff_fbid8_scanout),
                        .en(dec_mcu_pick_d2[8]), .l1clk(l1clk), .dout(fbid8[2:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid9 
                           (.din(filbuf_misbuf_fbid_d2[2:0]), 
				 
                        .scan_in(ff_fbid9_scanin),
                        .scan_out(ff_fbid9_scanout),
                        .en(dec_mcu_pick_d2[9]), .l1clk(l1clk), .dout(fbid9[2:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid10 
                           (.din(filbuf_misbuf_fbid_d2[2:0]), 
				 
                        .scan_in(ff_fbid10_scanin),
                        .scan_out(ff_fbid10_scanout),
                        .en(dec_mcu_pick_d2[10]), .l1clk(l1clk), .dout(fbid10[2:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid11 
                           (.din(filbuf_misbuf_fbid_d2[2:0]), 
				 
                        .scan_in(ff_fbid11_scanin),
                        .scan_out(ff_fbid11_scanout),
                        .en(dec_mcu_pick_d2[11]), .l1clk(l1clk), .dout(fbid11[2:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid12 
                           (.din(filbuf_misbuf_fbid_d2[2:0]), 
				 
                        .scan_in(ff_fbid12_scanin),
                        .scan_out(ff_fbid12_scanout),
                        .en(dec_mcu_pick_d2[12]), .l1clk(l1clk), .dout(fbid12[2:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid13 
                           (.din(filbuf_misbuf_fbid_d2[2:0]), 
				 
                        .scan_in(ff_fbid13_scanin),
                        .scan_out(ff_fbid13_scanout),
                        .en(dec_mcu_pick_d2[13]), .l1clk(l1clk), .dout(fbid13[2:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid14 
                           (.din(filbuf_misbuf_fbid_d2[2:0]), 
				 
                        .scan_in(ff_fbid14_scanin),
                        .scan_out(ff_fbid14_scanout),
                        .en(dec_mcu_pick_d2[14]), .l1clk(l1clk), .dout(fbid14[2:0]),
  .siclk(siclk),
  .soclk(soclk));  
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid15 
                           (.din(filbuf_misbuf_fbid_d2[2:0]), 
				 
                        .scan_in(ff_fbid15_scanin),
                        .scan_out(ff_fbid15_scanout),
                        .en(dec_mcu_pick_d2[15]), .l1clk(l1clk), .dout(fbid15[2:0]),
  .siclk(siclk),
  .soclk(soclk));  
// BS & SR 11/04/03, MB grows to 32
l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid16 
	(
	.scan_in(ff_fbid16_scanin),
	.scan_out(ff_fbid16_scanout),
	.din(filbuf_misbuf_fbid_d2[2:0]),
	.en(dec_mcu_pick_d2[16]),
	.l1clk(l1clk),
	.dout(fbid16[2:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid17 
	(
	.scan_in(ff_fbid17_scanin),
	.scan_out(ff_fbid17_scanout),
	.din(filbuf_misbuf_fbid_d2[2:0]),
	.en(dec_mcu_pick_d2[17]),
	.l1clk(l1clk),
	.dout(fbid17[2:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid18 
	(
	.scan_in(ff_fbid18_scanin),
	.scan_out(ff_fbid18_scanout),
	.din(filbuf_misbuf_fbid_d2[2:0]),
	.en(dec_mcu_pick_d2[18]),
	.l1clk(l1clk),
	.dout(fbid18[2:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid19 
	(
	.scan_in(ff_fbid19_scanin),
	.scan_out(ff_fbid19_scanout),
	.din(filbuf_misbuf_fbid_d2[2:0]),
	.en(dec_mcu_pick_d2[19]),
	.l1clk(l1clk),
	.dout(fbid19[2:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid20 
	(
	.scan_in(ff_fbid20_scanin),
	.scan_out(ff_fbid20_scanout),
	.din(filbuf_misbuf_fbid_d2[2:0]),
	.en(dec_mcu_pick_d2[20]),
	.l1clk(l1clk),
	.dout(fbid20[2:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid21 
	(
	.scan_in(ff_fbid21_scanin),
	.scan_out(ff_fbid21_scanout),
	.din(filbuf_misbuf_fbid_d2[2:0]),
	.en(dec_mcu_pick_d2[21]),
	.l1clk(l1clk),
	.dout(fbid21[2:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid22 
	(
	.scan_in(ff_fbid22_scanin),
	.scan_out(ff_fbid22_scanout),
	.din(filbuf_misbuf_fbid_d2[2:0]),
	.en(dec_mcu_pick_d2[22]),
	.l1clk(l1clk),
	.dout(fbid22[2:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid23 
	(
	.scan_in(ff_fbid23_scanin),
	.scan_out(ff_fbid23_scanout),
	.din(filbuf_misbuf_fbid_d2[2:0]),
	.en(dec_mcu_pick_d2[23]),
	.l1clk(l1clk),
	.dout(fbid23[2:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid24 
	(
	.scan_in(ff_fbid24_scanin),
	.scan_out(ff_fbid24_scanout),
	.din(filbuf_misbuf_fbid_d2[2:0]),
	.en(dec_mcu_pick_d2[24]),
	.l1clk(l1clk),
	.dout(fbid24[2:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid25 
	(
	.scan_in(ff_fbid25_scanin),
	.scan_out(ff_fbid25_scanout),
	.din(filbuf_misbuf_fbid_d2[2:0]),
	.en(dec_mcu_pick_d2[25]),
	.l1clk(l1clk),
	.dout(fbid25[2:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid26 
	(
	.scan_in(ff_fbid26_scanin),
	.scan_out(ff_fbid26_scanout),
	.din(filbuf_misbuf_fbid_d2[2:0]),
	.en(dec_mcu_pick_d2[26]),
	.l1clk(l1clk),
	.dout(fbid26[2:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid27 
	(
	.scan_in(ff_fbid27_scanin),
	.scan_out(ff_fbid27_scanout),
	.din(filbuf_misbuf_fbid_d2[2:0]),
	.en(dec_mcu_pick_d2[27]),
	.l1clk(l1clk),
	.dout(fbid27[2:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid28 
	(
	.scan_in(ff_fbid28_scanin),
	.scan_out(ff_fbid28_scanout),
	.din(filbuf_misbuf_fbid_d2[2:0]),
	.en(dec_mcu_pick_d2[28]),
	.l1clk(l1clk),
	.dout(fbid28[2:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid29 
	(
	.scan_in(ff_fbid29_scanin),
	.scan_out(ff_fbid29_scanout),
	.din(filbuf_misbuf_fbid_d2[2:0]),
	.en(dec_mcu_pick_d2[29]),
	.l1clk(l1clk),
	.dout(fbid29[2:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid30 
	(
	.scan_in(ff_fbid30_scanin),
	.scan_out(ff_fbid30_scanout),
	.din(filbuf_misbuf_fbid_d2[2:0]),
	.en(dec_mcu_pick_d2[30]),
	.l1clk(l1clk),
	.dout(fbid30[2:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);

l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 ff_fbid31 
	(
	.scan_in(ff_fbid31_scanin),
	.scan_out(ff_fbid31_scanout),
	.din(filbuf_misbuf_fbid_d2[2:0]),
	.en(dec_mcu_pick_d2[31]),
	.l1clk(l1clk),
	.dout(fbid31[2:0]),
  .siclk(siclk),
  .soclk(soclk)
	
);


 
//////////// 
// FBID_VLD   
// set when mcu _pick_d2 is asserted. 
// to indicate that the entry in the Miss Buffer 
// has been picked for requesting to mcu 
//////////// 
 
// bug #2196. 
// a ld64 miss or any operation in  
// Off mode, will cause fbid_vld to be set  
// but the "mb_way_fb_vld_reset" reset condition 
// will never happen. This causes the bit to have 
// stale state. Resetting now with fbid vld. 
assign	mb_fbid_vld_in = ( mb_fbid_vld | dec_mcu_pick_d2 ) & 
			~(mb_way_fb_vld_reset |  
				reset_valid_bit_c3) ; 
 
l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_mb_fbid_vld  // sync reset active low , BS & SR 11/04/03, MB grows to 32
                           (.din(mb_fbid_vld_in[31:0]), .l1clk(l1clk), 
      .scan_in(ff_mb_fbid_vld_scanin),
      .scan_out(ff_mb_fbid_vld_scanout),
      .clr(~dbb_rst_l), .dout(mb_fbid_vld[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
//////////// 
// Muxing out way and fbid for 
// writing into  FBctl 
//////////// 
 
 
assign	way_fbid_vld = ( mb_fbid_vld & mb_way_vld) ; 
 
assign	way_fbid_rd_vld_prev = |(way_fbid_vld) ; 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_filbuf_way_fbid_vld 
		(.din(way_fbid_rd_vld_prev), .l1clk(l1clk), 
             .scan_in(ff_misbuf_filbuf_way_fbid_vld_scanin),
             .scan_out(ff_misbuf_filbuf_way_fbid_vld_scanout),
             .dout(misbuf_filbuf_way_fbid_vld),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// Needs to be coded differently for timing. 
 
assign	mb_way_fb_vld_tmp[0] = way_fbid_vld[0] ; 
assign	mb_way_fb_vld_tmp[1] = way_fbid_vld[1] &   ~(way_fbid_vld[0]); 
assign  mb_way_fb_vld_tmp[2] = way_fbid_vld[2] &   ~(|(way_fbid_vld[1:0])) ; 
assign	mb_way_fb_vld_tmp[3] = way_fbid_vld[3] &  ~(|(way_fbid_vld[2:0])) ; 
assign  fbsel_def_0123 =  ~(|way_fbid_vld[2:0]); 
 
assign  mb_way_fb_vld_tmp[4] = way_fbid_vld[4] ; 
assign  mb_way_fb_vld_tmp[5] = way_fbid_vld[5] &   ~(way_fbid_vld[4]); 
assign  mb_way_fb_vld_tmp[6] = way_fbid_vld[6] &   ~(|(way_fbid_vld[5:4])) ; 
assign  mb_way_fb_vld_tmp[7] = way_fbid_vld[7] &  ~(|(way_fbid_vld[6:4])) ; 
assign  fbsel_def_4567 =  ~(|way_fbid_vld[6:4]); 
 
assign  mb_way_fb_vld_tmp[8] = way_fbid_vld[8] ; 
assign  mb_way_fb_vld_tmp[9] = way_fbid_vld[9] &   ~(way_fbid_vld[8]); 
assign  mb_way_fb_vld_tmp[10] = way_fbid_vld[10] &   ~(|(way_fbid_vld[9:8])) ; 
assign  mb_way_fb_vld_tmp[11] = way_fbid_vld[11] &  ~(|(way_fbid_vld[10:8])) ; 
assign  fbsel_def_89ab =  ~(|way_fbid_vld[10:8]); 
 
assign  mb_way_fb_vld_tmp[12] = way_fbid_vld[12] ; 
assign  mb_way_fb_vld_tmp[13] = way_fbid_vld[13] &   ~(way_fbid_vld[12]); 
assign  mb_way_fb_vld_tmp[14] = way_fbid_vld[14] &   ~(|(way_fbid_vld[13:12])) ; 
assign  mb_way_fb_vld_tmp[15] = way_fbid_vld[15] &  ~(|(way_fbid_vld[14:12])) ; 
assign  fbsel_def_cdef =  ~(|way_fbid_vld[14:12]); 

// BS & SR 11/04/03, MB grows to 32
assign  mb_way_fb_vld_tmp[16] = way_fbid_vld[16] ;
assign  mb_way_fb_vld_tmp[17] = way_fbid_vld[17] &  ~(way_fbid_vld[16]);
assign  mb_way_fb_vld_tmp[18] = way_fbid_vld[18] &  ~(|(way_fbid_vld[17:16])) ;
assign  mb_way_fb_vld_tmp[19] = way_fbid_vld[19] &  ~(|(way_fbid_vld[18:16])) ;
assign  fbsel_def_a_0123 =  ~(|way_fbid_vld[18:16]);

assign  mb_way_fb_vld_tmp[20] = way_fbid_vld[20] ;
assign  mb_way_fb_vld_tmp[21] = way_fbid_vld[21] &  ~(way_fbid_vld[20]);
assign  mb_way_fb_vld_tmp[22] = way_fbid_vld[22] &  ~(|(way_fbid_vld[21:20])) ;
assign  mb_way_fb_vld_tmp[23] = way_fbid_vld[23] &  ~(|(way_fbid_vld[22:20])) ;
assign  fbsel_def_a_4567 =  ~(|way_fbid_vld[22:20]);

assign  mb_way_fb_vld_tmp[24] = way_fbid_vld[24] ;
assign  mb_way_fb_vld_tmp[25] = way_fbid_vld[25] &  ~(way_fbid_vld[24]);
assign  mb_way_fb_vld_tmp[26] = way_fbid_vld[26] &  ~(|(way_fbid_vld[25:24])) ;
assign  mb_way_fb_vld_tmp[27] = way_fbid_vld[27] &  ~(|(way_fbid_vld[26:24])) ;
assign  fbsel_def_a_89ab =  ~(|way_fbid_vld[26:24]);

assign  mb_way_fb_vld_tmp[28] = way_fbid_vld[28] ;
assign  mb_way_fb_vld_tmp[29] = way_fbid_vld[29] &  ~(way_fbid_vld[28]);
assign  mb_way_fb_vld_tmp[30] = way_fbid_vld[30] &  ~(|(way_fbid_vld[29:28])) ;
assign  mb_way_fb_vld_tmp[31] = way_fbid_vld[31] &  ~(|(way_fbid_vld[30:28])) ;
assign  fbsel_def_a_cdef =  ~(|way_fbid_vld[30:28]);

assign	mb_way_fb_vld_tmp_0to3 = |( way_fbid_vld[3:0]) ; 
assign	mb_way_fb_vld_tmp_4to7 = |( way_fbid_vld[7:4]) ; 
assign	mb_way_fb_vld_tmp_8to11 = |( way_fbid_vld[11:8]) ; 
assign	mb_way_fb_vld_tmp_12to15 = |( way_fbid_vld[15:12]) ; 
assign  mb_way_fb_vld_tmp_16to19 = |( way_fbid_vld[19:16]) ;
assign  mb_way_fb_vld_tmp_20to23 = |( way_fbid_vld[23:20]) ;
assign  mb_way_fb_vld_tmp_24to27 = |( way_fbid_vld[27:24]) ;
//assign  mb_way_fb_vld_tmp_28to31 = |( way_fbid_vld[31:28]) ;
 
 
// signal to reset way vld and fbid vld. 
assign	mb_way_fb_vld_reset[3:0] = mb_way_fb_vld_tmp[3:0] ; 
assign	mb_way_fb_vld_reset[7:4] = mb_way_fb_vld_tmp[7:4]  &  
					~{4{mb_way_fb_vld_tmp_0to3}} ; 
assign	mb_way_fb_vld_reset[11:8] = mb_way_fb_vld_tmp[11:8] &  
					~{4{mb_way_fb_vld_tmp_0to3}} & 
					~{4{mb_way_fb_vld_tmp_4to7}}; 
assign	mb_way_fb_vld_reset[15:12] = mb_way_fb_vld_tmp[15:12]  &  
					~{4{mb_way_fb_vld_tmp_0to3}} 
					& ~{4{mb_way_fb_vld_tmp_4to7}} &  
				~{4{mb_way_fb_vld_tmp_8to11}} ; 

// BS & SR 11/04/03, MB grows to 32
assign  mb_way_fb_vld_reset[19:16] = mb_way_fb_vld_tmp[19:16]  &
                                     ~{4{mb_way_fb_vld_tmp_0to3}} & 
                                     ~{4{mb_way_fb_vld_tmp_4to7}} &
                                     ~{4{mb_way_fb_vld_tmp_8to11}} &
                                     ~{4{mb_way_fb_vld_tmp_12to15}} ;

assign  mb_way_fb_vld_reset[23:20] = mb_way_fb_vld_tmp[23:20]  &
                                     ~{4{mb_way_fb_vld_tmp_0to3}} & 
                                     ~{4{mb_way_fb_vld_tmp_4to7}} &
                                     ~{4{mb_way_fb_vld_tmp_8to11}} &
                                     ~{4{mb_way_fb_vld_tmp_12to15}} &
				     ~{4{mb_way_fb_vld_tmp_16to19}};

assign  mb_way_fb_vld_reset[27:24] = mb_way_fb_vld_tmp[27:24]  &
                                     ~{4{mb_way_fb_vld_tmp_0to3}} & 
                                     ~{4{mb_way_fb_vld_tmp_4to7}} &
                                     ~{4{mb_way_fb_vld_tmp_8to11}} &
                                     ~{4{mb_way_fb_vld_tmp_12to15}} &
				     ~{4{mb_way_fb_vld_tmp_16to19}} &
				     ~{4{mb_way_fb_vld_tmp_20to23}};

assign  mb_way_fb_vld_reset[31:28] = mb_way_fb_vld_tmp[31:28]  &
                                     ~{4{mb_way_fb_vld_tmp_0to3}} & 
                                     ~{4{mb_way_fb_vld_tmp_4to7}} &
                                     ~{4{mb_way_fb_vld_tmp_8to11}} &
                                     ~{4{mb_way_fb_vld_tmp_12to15}} &
                                     ~{4{mb_way_fb_vld_tmp_16to19}} &
                                     ~{4{mb_way_fb_vld_tmp_20to23}} &
				     ~{4{mb_way_fb_vld_tmp_24to27}};

assign  fbsel_0to3 = mb_way_fb_vld_tmp_0to3 ; 
assign  fbsel_4to7 = mb_way_fb_vld_tmp_4to7 & ~mb_way_fb_vld_tmp_0to3; 
assign  fbsel_8to11 = mb_way_fb_vld_tmp_8to11 & ~mb_way_fb_vld_tmp_0to3 & 
			~mb_way_fb_vld_tmp_4to7 ; 


// BS & SR 11/04/03, MB grows to 32

assign  fbsel_15to12 =  mb_way_fb_vld_tmp_12to15 & 
			~mb_way_fb_vld_tmp_8to11 &
			~mb_way_fb_vld_tmp_0to3 &
                        ~mb_way_fb_vld_tmp_4to7 ;
assign  fbsel_19to16 =  mb_way_fb_vld_tmp_16to19 &
			~mb_way_fb_vld_tmp_12to15 & 
                        ~mb_way_fb_vld_tmp_8to11 &
                        ~mb_way_fb_vld_tmp_0to3 &
                        ~mb_way_fb_vld_tmp_4to7 ;
assign  fbsel_23to20 =  mb_way_fb_vld_tmp_20to23 &
  			~mb_way_fb_vld_tmp_16to19 &
                        ~mb_way_fb_vld_tmp_12to15 &
                        ~mb_way_fb_vld_tmp_8to11 &
                        ~mb_way_fb_vld_tmp_0to3 &
                        ~mb_way_fb_vld_tmp_4to7 ;
assign  fbsel_27to24 =  mb_way_fb_vld_tmp_24to27 &
			~mb_way_fb_vld_tmp_20to23 &
                        ~mb_way_fb_vld_tmp_16to19 &
                        ~mb_way_fb_vld_tmp_12to15 &
                        ~mb_way_fb_vld_tmp_8to11 &
                        ~mb_way_fb_vld_tmp_0to3 &
                        ~mb_way_fb_vld_tmp_4to7 ;
//assign fbsel_31to28 =   mb_way_fb_vld_tmp_28to31 &
//			~mb_way_fb_vld_tmp_24to27 &
//                        ~mb_way_fb_vld_tmp_20to23 &
//                        ~mb_way_fb_vld_tmp_16to19 &
//                        ~mb_way_fb_vld_tmp_12to15 &
//                        ~mb_way_fb_vld_tmp_8to11 &
//                        ~mb_way_fb_vld_tmp_0to3 &
//                        ~mb_way_fb_vld_tmp_4to7 ;

//assign  fbsel_def_vld = ~( fbsel_0to3 | fbsel_4to7 | fbsel_8to11 | fbsel_15to12 | fbsel_19to16 | 
//			  fbsel_27to24 ) ; 

assign  fbsel_def_vld = ~( fbsel_0to3 | fbsel_4to7 | fbsel_8to11 | fbsel_15to12 | fbsel_19to16 |
                          // fbsel_27to24 ) ;  fix for bug 85990
                          fbsel_23to20 | fbsel_27to24 ) ;

 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_fbsel_0to3_d1 
                           (.din(fbsel_0to3), .l1clk(l1clk), 
             .scan_in(ff_fbsel_0to3_d1_scanin),
             .scan_out(ff_fbsel_0to3_d1_scanout),
             .dout(fbsel_0to3_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_fbsel_4to7_d1 
                           (.din(fbsel_4to7), .l1clk(l1clk), 
             .scan_in(ff_fbsel_4to7_d1_scanin),
             .scan_out(ff_fbsel_4to7_d1_scanout),
             .dout(fbsel_4to7_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_fbsel_8tob_d1 
                           (.din(fbsel_8to11), .l1clk(l1clk), 
             .scan_in(ff_fbsel_8tob_d1_scanin),
             .scan_out(ff_fbsel_8tob_d1_scanout),
             .dout(fbsel_8to11_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 


// BS & SR 11/04/03, MB grows to 32
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_fbsel_15to12_d1 
            (.din(fbsel_15to12), .l1clk(l1clk), 
             .scan_in(ff_fbsel_15to12_d1_scanin),
             .scan_out(ff_fbsel_15to12_d1_scanout),
             .dout(fbsel_15to12_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_fbsel_a_0to3_d1 
            (.din(fbsel_19to16), .l1clk(l1clk), 
             .scan_in(ff_fbsel_a_0to3_d1_scanin),
             .scan_out(ff_fbsel_a_0to3_d1_scanout),
             .dout(fbsel_19to16_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_fbsel_a_4to7_d1 
            (.din(fbsel_23to20), .l1clk(l1clk), 
             .scan_in(ff_fbsel_a_4to7_d1_scanin),
             .scan_out(ff_fbsel_a_4to7_d1_scanout),
             .dout(fbsel_23to20_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_fbsel_a_8tob_d1 
            (.din(fbsel_27to24), .l1clk(l1clk),
             .scan_in(ff_fbsel_a_8tob_d1_scanin),
             .scan_out(ff_fbsel_a_8tob_d1_scanout),
             .dout(fbsel_27to24_d1),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_fbsel_def_vld_d1 
            (.din(fbsel_def_vld), .l1clk(l1clk),
             .scan_in(ff_fbsel_def_vld_d1_scanin),
             .scan_out(ff_fbsel_def_vld_d1_scanout),
             .dout(fbsel_def_vld_d1),
  .siclk(siclk),
  .soclk(soclk)  
);


assign	sel_mux0 = fbsel_0to3_d1 ; 
assign	sel_mux1 = fbsel_4to7_d1 ; 
assign	sel_mux2 = fbsel_8to11_d1; 
// BS & SR 11/04/03, MB grows to 32
assign	sel_mux3 = fbsel_15to12_d1 ; 
assign	sel_mux4 = fbsel_19to16_d1 ; 
assign	sel_mux5 = fbsel_23to20_d1 ; 
assign	sel_mux6 = fbsel_27to24_d1 ; 
assign	sel_mux7 = fbsel_def_vld_d1 ; 
 

assign sel_mux0123 = sel_mux0 | sel_mux1 | sel_mux2 | sel_mux3;
assign sel_mux4567 = ~sel_mux0123;
 
//////////////////////////////////// 
// 1st level of muxing out the way for Fb write. 
//////////////////////////////////// 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_4 mux_way_0123 
	(.dout(way0123[3:0]), 
          .din0(way0[3:0]), .din1(way1[3:0]), 
          .din2(way2[3:0]), .din3(way3[3:0]), 
          .sel0(mb_way_fb_vld_tmp[0]), .sel1(mb_way_fb_vld_tmp[1]), 
          .sel2(mb_way_fb_vld_tmp[2]), .sel3(fbsel_def_0123)); 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_4 mux_way_4567 
			(.dout(way4567[3:0]), 
          .din0(way4[3:0]), .din1(way5[3:0]), 
          .din2(way6[3:0]), .din3(way7[3:0]), 
          .sel0(mb_way_fb_vld_tmp[4]), .sel1(mb_way_fb_vld_tmp[5]), 
          .sel2(mb_way_fb_vld_tmp[6]), .sel3(fbsel_def_4567)); 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_4 mux_way_89ab 
			(.dout(way89ab[3:0]), 
          .din0(way8[3:0]), .din1(way9[3:0]), 
          .din2(way10[3:0]), .din3(way11[3:0]), 
          .sel0(mb_way_fb_vld_tmp[8]), .sel1(mb_way_fb_vld_tmp[9]), 
          .sel2(mb_way_fb_vld_tmp[10]), .sel3(fbsel_def_89ab)); 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_4 mux_way_cdef 
			(.dout(waycdef[3:0]), 
          .din0(way12[3:0]), .din1(way13[3:0]), 
          .din2(way14[3:0]), .din3(way15[3:0]), 
          .sel0(mb_way_fb_vld_tmp[12]), .sel1(mb_way_fb_vld_tmp[13]), 
          .sel2(mb_way_fb_vld_tmp[14]), .sel3(fbsel_def_cdef)); 

// BS & SR 11/04/03, MB grows to 32

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_4 mux_way_a0123 
        (.dout(waya0123[3:0]),
          .din0(way16[3:0]), .din1(way17[3:0]),
          .din2(way18[3:0]), .din3(way19[3:0]),
          .sel0(mb_way_fb_vld_tmp[16]), .sel1(mb_way_fb_vld_tmp[17]),
          .sel2(mb_way_fb_vld_tmp[18]), .sel3(fbsel_def_a_0123));

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_4 mux_way_a4567 
        (.dout(waya4567[3:0]),
          .din0(way20[3:0]), .din1(way21[3:0]),
          .din2(way22[3:0]), .din3(way23[3:0]),
          .sel0(mb_way_fb_vld_tmp[20]), .sel1(mb_way_fb_vld_tmp[21]),
          .sel2(mb_way_fb_vld_tmp[22]), .sel3(fbsel_def_a_4567));

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_4 mux_way_a89ab 
        (.dout(waya89ab[3:0]),
          .din0(way24[3:0]), .din1(way25[3:0]),
          .din2(way26[3:0]), .din3(way27[3:0]),
          .sel0(mb_way_fb_vld_tmp[24]), .sel1(mb_way_fb_vld_tmp[25]),
          .sel2(mb_way_fb_vld_tmp[26]), .sel3(fbsel_def_a_89ab));

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_4 mux_way_acdef 
        (.dout(wayacdef[3:0]),
          .din0(way28[3:0]), .din1(way29[3:0]),
          .din2(way30[3:0]), .din3(way31[3:0]),
          .sel0(mb_way_fb_vld_tmp[28]), .sel1(mb_way_fb_vld_tmp[29]),
          .sel2(mb_way_fb_vld_tmp[30]), .sel3(fbsel_def_a_cdef));

 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_misbuf_filbuf_way_0123 
		(.din(way0123[3:0]), .l1clk(l1clk), 
             .scan_in(ff_misbuf_filbuf_way_0123_scanin),
             .scan_out(ff_misbuf_filbuf_way_0123_scanout),
             .dout(way0123_d1[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_misbuf_filbuf_way_4567 
		(.din(way4567[3:0]), .l1clk(l1clk), 
             .scan_in(ff_misbuf_filbuf_way_4567_scanin),
             .scan_out(ff_misbuf_filbuf_way_4567_scanout),
             .dout(way4567_d1[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_misbuf_filbuf_way_89ab 
		(.din(way89ab[3:0]), .l1clk(l1clk), 
             .scan_in(ff_misbuf_filbuf_way_89ab_scanin),
             .scan_out(ff_misbuf_filbuf_way_89ab_scanout),
             .dout(way89ab_d1[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_misbuf_filbuf_way_cdef 
		(.din(waycdef[3:0]), .l1clk(l1clk), 
             .scan_in(ff_misbuf_filbuf_way_cdef_scanin),
             .scan_out(ff_misbuf_filbuf_way_cdef_scanout),
             .dout(waycdef_d1[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS & SR 11/04/03, MB grows to 32

l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_misbuf_filbuf_way_a0123 
                (.din(waya0123[3:0]), .l1clk(l1clk),
             .scan_in(ff_misbuf_filbuf_way_a0123_scanin),
             .scan_out(ff_misbuf_filbuf_way_a0123_scanout),
             .dout(waya0123_d1[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_misbuf_filbuf_way_a4567 
                (.din(waya4567[3:0]), .l1clk(l1clk),
             .scan_in(ff_misbuf_filbuf_way_a4567_scanin),
             .scan_out(ff_misbuf_filbuf_way_a4567_scanout),
             .dout(waya4567_d1[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_misbuf_filbuf_way_a89ab 
                (.din(waya89ab[3:0]), .l1clk(l1clk),
             .scan_in(ff_misbuf_filbuf_way_a89ab_scanin),
             .scan_out(ff_misbuf_filbuf_way_a89ab_scanout),
             .dout(waya89ab_d1[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_misbuf_filbuf_way_acdef 
                (.din(wayacdef[3:0]), .l1clk(l1clk),
             .scan_in(ff_misbuf_filbuf_way_acdef_scanin),
             .scan_out(ff_misbuf_filbuf_way_acdef_scanout),
             .dout(wayacdef_d1[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
);

 
//////////////////////////////////// 
// 2nd  level of muxing out the way for Fb write. 
//////////////////////////////////// 

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_4 mux_way_prev_a 
	(.dout(misbuf_filbuf_a_way[3:0]), 
          .din0(way0123_d1[3:0]), .din1(way4567_d1[3:0]), 
          .din2(way89ab_d1[3:0]), .din3(waycdef_d1[3:0]), 
          .sel0(sel_mux0), .sel1(sel_mux1), 
          .sel2(sel_mux2), .sel3(sel_mux3)); 

// BS & SR 11/04/03, MB grows to 32

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_4 mux_way_prev_b 
        (.dout(misbuf_filbuf_b_way[3:0]), 
          .din0(waya0123_d1[3:0]), .din1(waya4567_d1[3:0]),
          .din2(waya89ab_d1[3:0]), .din3(wayacdef_d1[3:0]),
          .sel0(sel_mux4), .sel1(sel_mux5),
          .sel2(sel_mux6), .sel3(sel_mux7));

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_way_prev 
        (.dout(misbuf_filbuf_way[3:0]),
          .din0(misbuf_filbuf_a_way[3:0]), .din1(misbuf_filbuf_b_way[3:0]),
          .sel0(sel_mux0123), .sel1(sel_mux4567));
 
//////////////////////////////////////////////////// 
// 1'st level of muxing out the fbid for Fb write. 
////////////////////////////////////////////////// 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_3 mux_fbid_0123 
	(.dout(fbid0123[2:0]), 
          .din0(fbid0[2:0]), .din1(fbid1[2:0]), 
          .din2(fbid2[2:0]), .din3(fbid3[2:0]), 
          .sel0(mb_way_fb_vld_tmp[0]), .sel1(mb_way_fb_vld_tmp[1]), 
          .sel2(mb_way_fb_vld_tmp[2]), .sel3(fbsel_def_0123)); 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_3 mux_fbid_4567 
	(.dout(fbid4567[2:0]), 
          .din0(fbid4[2:0]), .din1(fbid5[2:0]), 
          .din2(fbid6[2:0]), .din3(fbid7[2:0]), 
          .sel0(mb_way_fb_vld_tmp[4]), .sel1(mb_way_fb_vld_tmp[5]), 
          .sel2(mb_way_fb_vld_tmp[6]), .sel3(fbsel_def_4567)); 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_3 mux_fbid_89ab 
			(.dout(fbid89ab[2:0]), 
          .din0(fbid8[2:0]), .din1(fbid9[2:0]), 
          .din2(fbid10[2:0]), .din3(fbid11[2:0]), 
          .sel0(mb_way_fb_vld_tmp[8]), .sel1(mb_way_fb_vld_tmp[9]), 
          .sel2(mb_way_fb_vld_tmp[10]), .sel3(fbsel_def_89ab)); 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_3 mux_fbid_cdef 
			(.dout(fbidcdef[2:0]), 
          .din0(fbid12[2:0]), .din1(fbid13[2:0]), 
          .din2(fbid14[2:0]), .din3(fbid15[2:0]), 
          .sel0(mb_way_fb_vld_tmp[12]), .sel1(mb_way_fb_vld_tmp[13]), 
          .sel2(mb_way_fb_vld_tmp[14]), .sel3(fbsel_def_cdef)); 

// BS & SR 11/04/03, MB grows to 32

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_3 mux_fbid_a0123 
        (.dout(fbida0123[2:0]), 
          .din0(fbid16[2:0]), .din1(fbid17[2:0]),
          .din2(fbid18[2:0]), .din3(fbid19[2:0]),
          .sel0(mb_way_fb_vld_tmp[16]), .sel1(mb_way_fb_vld_tmp[17]),
          .sel2(mb_way_fb_vld_tmp[18]), .sel3(fbsel_def_a_0123));

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_3 mux_fbid_a4567 
         (.dout(fbida4567[2:0]),
          .din0(fbid20[2:0]), .din1(fbid21[2:0]),
          .din2(fbid22[2:0]), .din3(fbid23[2:0]),
          .sel0(mb_way_fb_vld_tmp[20]), .sel1(mb_way_fb_vld_tmp[21]),
          .sel2(mb_way_fb_vld_tmp[22]), .sel3(fbsel_def_a_4567));

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_3 mux_fbid_a89ab 
         (.dout(fbida89ab[2:0]),
          .din0(fbid24[2:0]), .din1(fbid25[2:0]),
          .din2(fbid26[2:0]), .din3(fbid27[2:0]),
          .sel0(mb_way_fb_vld_tmp[24]), .sel1(mb_way_fb_vld_tmp[25]),
          .sel2(mb_way_fb_vld_tmp[26]), .sel3(fbsel_def_a_89ab));

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_3 mux_fbid_acdef 
         (.dout(fbidacdef[2:0]),
          .din0(fbid28[2:0]), .din1(fbid29[2:0]),
          .din2(fbid30[2:0]), .din3(fbid31[2:0]),
          .sel0(mb_way_fb_vld_tmp[28]), .sel1(mb_way_fb_vld_tmp[29]),
          .sel2(mb_way_fb_vld_tmp[30]), .sel3(fbsel_def_a_cdef));

 
 
l2t_misbuf_ctl_msff_ctl_macro__width_3 ff_misbuf_filbuf_fbid_0123 
		(.din(fbid0123[2:0]), .l1clk(l1clk), 
             .scan_in(ff_misbuf_filbuf_fbid_0123_scanin),
             .scan_out(ff_misbuf_filbuf_fbid_0123_scanout),
             .dout(fbid0123_d1[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_3 ff_misbuf_filbuf_fbid_4567 
		(.din(fbid4567[2:0]), .l1clk(l1clk), 
             .scan_in(ff_misbuf_filbuf_fbid_4567_scanin),
             .scan_out(ff_misbuf_filbuf_fbid_4567_scanout),
             .dout(fbid4567_d1[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_3 ff_misbuf_filbuf_fbid_89ab 
		(.din(fbid89ab[2:0]), .l1clk(l1clk), 
             .scan_in(ff_misbuf_filbuf_fbid_89ab_scanin),
             .scan_out(ff_misbuf_filbuf_fbid_89ab_scanout),
             .dout(fbid89ab_d1[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_3 ff_misbuf_filbuf_fbid_cdef 
		(.din(fbidcdef[2:0]), .l1clk(l1clk), 
             .scan_in(ff_misbuf_filbuf_fbid_cdef_scanin),
             .scan_out(ff_misbuf_filbuf_fbid_cdef_scanout),
             .dout(fbidcdef_d1[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS & SR 11/04/03, MB grows to 32

l2t_misbuf_ctl_msff_ctl_macro__width_3 ff_misbuf_filbuf_fbid_a0123 
                (.din(fbida0123[2:0]), .l1clk(l1clk),
             .scan_in(ff_misbuf_filbuf_fbid_a0123_scanin),
             .scan_out(ff_misbuf_filbuf_fbid_a0123_scanout),
             .dout(fbida0123_d1[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_misbuf_ctl_msff_ctl_macro__width_3 ff_misbuf_filbuf_fbid_a4567 
                (.din(fbida4567[2:0]), .l1clk(l1clk),
             .scan_in(ff_misbuf_filbuf_fbid_a4567_scanin),
             .scan_out(ff_misbuf_filbuf_fbid_a4567_scanout),
             .dout(fbida4567_d1[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_misbuf_ctl_msff_ctl_macro__width_3 ff_misbuf_filbuf_fbid_a89ab 
                (.din(fbida89ab[2:0]), .l1clk(l1clk),
             .scan_in(ff_misbuf_filbuf_fbid_a89ab_scanin),
             .scan_out(ff_misbuf_filbuf_fbid_a89ab_scanout),
             .dout(fbida89ab_d1[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_misbuf_ctl_msff_ctl_macro__width_3 ff_misbuf_filbuf_fbid_acdef 
                (.din(fbidacdef[2:0]), .l1clk(l1clk),
             .scan_in(ff_misbuf_filbuf_fbid_acdef_scanin),
             .scan_out(ff_misbuf_filbuf_fbid_acdef_scanout),
             .dout(fbidacdef_d1[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
);

 
////////////////////////////////////////////////// 
// 2nd  level of muxing out the fbid for Fb write. 
/////////////////////////////////////////////////// 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_3 mux_fbid_a 
	 (.dout(misbuf_filbuf_fbid_a[2:0]), 
          .din0(fbid0123_d1[2:0]), .din1(fbid4567_d1[2:0]), 
          .din2(fbid89ab_d1[2:0]), .din3(fbidcdef_d1[2:0]), 
          .sel0(sel_mux0), .sel1(sel_mux1), 
          .sel2(sel_mux2), .sel3(sel_mux3)); 

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_3 mux_fbid_b 
         (.dout(misbuf_filbuf_fbid_b[2:0]),
          .din0(fbida0123_d1[2:0]), .din1(fbida4567_d1[2:0]),
          .din2(fbida89ab_d1[2:0]), .din3(fbidacdef_d1[2:0]),
          .sel0(sel_mux4), .sel1(sel_mux5),
          .sel2(sel_mux6), .sel3(sel_mux7));

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_3 mux_fbid 
         (.dout(misbuf_filbuf_fbid[2:0]),
          .din0(misbuf_filbuf_fbid_a[2:0]), .din1(misbuf_filbuf_fbid_b[2:0]),
          .sel0(sel_mux0123), .sel1(sel_mux4567));

 
 
///////////////////////////////////////////////////////////// 
// ERROR LOGIC: 
//	CERR and UERR bits are set for ce,ue and notdata errors for instructions that 
//	make two passes even when they hit the L2. This includes 
//	psts, cas, swap/ldstub instrctions. 
// 
// CERR: For PSTs, Ldstubs, SWAPs and CAs instructions,  
// the l2 data or Fb corr or Notdata err signal is recorded in mb_corr_err 
// so as to signal a disrupting trap to the sparc and thread 
// that the instr. is performed by. For both non-atomic and atomic 
// store, this ERR is actually signalled with a store.
// 
// UNCORR: This bit has a dual purpose. The one mentioned above 
// and also it is used to gate off the store part of the atomic 
// or a partial store. A notdata error will also set this bit for
// any psts/cas/swap/ldstub. 
///////////////////////////////////////////////////////////// 
 
 
// A CAS sets its ctrue bit only in C9. 
// The following logic uses either the C8 errors or the C9 errors 
// for setting the misbuf_err bits based on whether the "ctrue setting" 
// instruction is a regular PST or a CAS instruction. 
// we need to gate off the notdata error reporting for off mode 

// in case of vuad ce error, do not set mb_corr,mb_uncorr,mb_nderr[31:0] bits
// for a partial store . Partial store will get replayed and then will set
// ctrue and error bits. 

assign partial_st_wr8_inst_c2 = arb_decdp_wr8_inst_c2 & arb_decdp_pst_inst_c2;
 
l2t_misbuf_ctl_msff_ctl_macro__width_11  ff_wr8_piped 
	(
	.scan_in(ff_wr8_piped_scanin),
	.scan_out(ff_wr8_piped_scanout),
	.din	({partial_st_wr8_inst_c2,partial_st_wr8_inst_c3,partial_st_wr8_inst_c4,partial_st_wr8_inst_c5,
		 partial_st_wr8_inst_c52,partial_st_wr8_inst_c6,partial_st_wr8_inst_c7,
                 filbuf_misbuf_ue_offmode_c7,filbuf_misbuf_ue_offmode_c8,
                 filbuf_misbuf_ce_offmode_c7,filbuf_misbuf_ce_offmode_c8}),
	.dout	({partial_st_wr8_inst_c3,partial_st_wr8_inst_c4,partial_st_wr8_inst_c5,
		 partial_st_wr8_inst_c52,partial_st_wr8_inst_c6,partial_st_wr8_inst_c7,partial_st_wr8_inst_c8,
                 filbuf_misbuf_ue_offmode_c8,filbuf_misbuf_ue_offmode_c9,
                 filbuf_misbuf_ce_offmode_c8,filbuf_misbuf_ce_offmode_c9}),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

assign	  misbuf_corr_err_c8 = deccck_spcd_corr_err_c8 | deccck_spcfb_corr_err_c8 ;
 
assign    mb_corr_err_in = ((pst_ctrue_set_c8 & {32{(misbuf_corr_err_c8 & ~misbuf_vuad_ce_err_c8) |
                                                    filbuf_misbuf_ce_offmode_c8}}) | // PST/SWAP/LDSTUB CE 
			    (cas_ctrue_set_preerror_c9 & {32{corr_err_c9 
                                                    | filbuf_misbuf_ce_offmode_c9}}) | // CAS1 CE 
			    mb_corr_err  ) & ~reset_valid_bit_c3 ;


l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_mb_corr_err  // sync reset active low, BS & SR 11/04/03, MB grows to 32
                (
		.scan_in(ff_mb_corr_err_scanin),
		.scan_out(ff_mb_corr_err_scanout),
		.din(mb_corr_err_in[31:0]), 
		.l1clk(l1clk), 
                .dout(mb_corr_err[31:0]), 
		.clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk) 
		); 


// BS 06/13/04 : in case of Notdata error on read pass for partial stores and swap/ldstubs,
// have to squash the store in the second pass. Setting mb_uncorr_err is required.
// 
//assign       mb_uncorr_err_in = ( ( pst_ctrue_set_c8 & {32{(deccck_uncorr_err_c8 | deccck_notdata_err_c8)}}) | 
//		// PST/SWAP/LDSTUB UE or Notdata errors
//		( cas_ctrue_set_preerror_c9 & {32{(uncorr_err_c9 | notdata_err_c9)}}) 
//		// CAS1 UE or Notdata error
//		| mb_uncorr_err  )  
//		& ~reset_valid_bit_c3 ; // BS & SR 11/04/03, MB grows to 32
// 

assign       mb_uncorr_err_in = ((pst_ctrue_set_c8 & {32{((deccck_uncorr_err_c8 & ~misbuf_vuad_ce_err_c8 &
                                                          ~deccck_notdata_err_c8)
                                                         | filbuf_misbuf_ue_offmode_c8)
                                                         }}) | // PST/SWAP/LDSTUB UE 
                                                        // if UE and Notdata detected in same line
                                                        // only Notdata needs to be reported, in which case
                                                        // should not set mb_uncorr_err
                                                        // fix for bug 101500
              ( cas_ctrue_set_preerror_c9 & {32{(uncorr_err_c9 | filbuf_misbuf_ue_offmode_c9)}}) // CAS1 UE 
              | mb_uncorr_err  ) & ~reset_valid_bit_c3 ; 


l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_mb_uncorr_err  // sync reset active low // BS & SR 11/04/03, MB grows to 32
                (.din(mb_uncorr_err_in[31:0]), .l1clk(l1clk), 
		.scan_in(ff_mb_uncorr_err_scanin),
		.scan_out(ff_mb_uncorr_err_scanout),
		.dout(mb_uncorr_err[31:0]),  
		.clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk) 
		); 

// DO NOT USE csr_l2_bypass_mode_on unreg verion..

assign mb_nderr_in[31:0] = ((pst_ctrue_set_c8 & 
                {32{(deccck_notdata_err_c8 & ~misbuf_vuad_ce_err_c8 & ~partial_st_wr8_inst_c8 & ~l2_bypass_mode_on_d1)}}) | 
		(cas_ctrue_set_preerror_c9 & {32{(notdata_err_c9)}}) | // CAS1 Notdata error
		mb_nderr) & ~reset_valid_bit_c3 ;


l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 ff_mb_nderr_in  // sync reset active low // BS & SR 11/04/03, MB grows to 32
                (.din(mb_nderr_in[31:0]), .l1clk(l1clk),
                .scan_in(ff_mb_nderr_in_scanin),
                .scan_out(ff_mb_nderr_in_scanout),
                .dout(mb_nderr[31:0]),
                .clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk)
                );


 
 
////////////////////////////////////////////////////////// 
// ERR bit to l2t_tag to gate off writes to the  
// data array. 
////////////////////////////////////////////////////////// 
 
assign  mb_entry_dec_c1[0] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd0 ) ; 
assign  mb_entry_dec_c1[1] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd1 ) ; 
assign  mb_entry_dec_c1[2] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd2 ) ; 
assign  mb_entry_dec_c1[3] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd3 ) ; 
assign  mb_entry_dec_c1[4] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd4 ) ; 
assign  mb_entry_dec_c1[5] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd5 ) ; 
assign  mb_entry_dec_c1[6] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd6 ) ; 
assign  mb_entry_dec_c1[7] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd7 ) ; 
assign  mb_entry_dec_c1[8] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd8 ) ; 
assign  mb_entry_dec_c1[9] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd9 ) ; 
assign  mb_entry_dec_c1[10] = ( arbdec_arbdp_inst_mb_entry_c1 == 5'd10 ) ; 
assign  mb_entry_dec_c1[11] = ( arbdec_arbdp_inst_mb_entry_c1 == 5'd11 ) ; 
assign  mb_entry_dec_c1[12] = ( arbdec_arbdp_inst_mb_entry_c1 == 5'd12 ) ; 
assign  mb_entry_dec_c1[13] = ( arbdec_arbdp_inst_mb_entry_c1 == 5'd13 ) ; 
assign  mb_entry_dec_c1[14] = ( arbdec_arbdp_inst_mb_entry_c1 == 5'd14 ) ; 
assign  mb_entry_dec_c1[15] = ( arbdec_arbdp_inst_mb_entry_c1 == 5'd15 ) ; 
// BS & SR 11/04/03, MB grows to 32
assign  mb_entry_dec_c1[16] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd16 ) ;
assign  mb_entry_dec_c1[17] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd17 ) ;
assign  mb_entry_dec_c1[18] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd18 ) ;
assign  mb_entry_dec_c1[19] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd19 ) ;
assign  mb_entry_dec_c1[20] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd20 ) ;
assign  mb_entry_dec_c1[21] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd21 ) ;
assign  mb_entry_dec_c1[22] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd22 ) ;
assign  mb_entry_dec_c1[23] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd23 ) ;
assign  mb_entry_dec_c1[24] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd24 ) ;
assign  mb_entry_dec_c1[25] =  ( arbdec_arbdp_inst_mb_entry_c1 == 5'd25 ) ;
assign  mb_entry_dec_c1[26] = ( arbdec_arbdp_inst_mb_entry_c1 == 5'd26) ;
assign  mb_entry_dec_c1[27] = ( arbdec_arbdp_inst_mb_entry_c1 == 5'd27) ;
assign  mb_entry_dec_c1[28] = ( arbdec_arbdp_inst_mb_entry_c1 == 5'd28) ;
assign  mb_entry_dec_c1[29] = ( arbdec_arbdp_inst_mb_entry_c1 == 5'd29) ;
assign  mb_entry_dec_c1[30] = ( arbdec_arbdp_inst_mb_entry_c1 == 5'd30) ;
assign  mb_entry_dec_c1[31] = ( arbdec_arbdp_inst_mb_entry_c1 == 5'd31) ;





 
assign  misbuf_corr_err_c1 = |( mb_entry_dec_c1 & mb_corr_err )  ; 
 
assign  misbuf_uncorr_err_c1 = |( mb_entry_dec_c1 & mb_uncorr_err ) ; 

assign   misbuf_notdata_err_c1 = |( mb_entry_dec_c1 & mb_nderr );
 


l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_corr_err_c2 
                           (.din(misbuf_corr_err_c1), .l1clk(l1clk), 
                                .scan_in(ff_misbuf_corr_err_c2_scanin),
                                .scan_out(ff_misbuf_corr_err_c2_scanout),
                                .dout(misbuf_corr_err_unqual_c2),
  .siclk(siclk),
  .soclk(soclk) 
                                 
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_uncorr_err_c2 
                           (.din(misbuf_uncorr_err_c1), .l1clk(l1clk), 
                                .scan_in(ff_misbuf_uncorr_err_c2_scanin),
                                .scan_out(ff_misbuf_uncorr_err_c2_scanout),
                                .dout(misbuf_uncorr_err_unqual_c2),
  .siclk(siclk),
  .soclk(soclk) 
                                 
); 

l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_nderr_unqual_c2 
        (
	.scan_in(ff_misbuf_nderr_unqual_c2_scanin),
	.scan_out(ff_misbuf_nderr_unqual_c2_scanout),
	.din(misbuf_notdata_err_c1), 
	.l1clk(l1clk),
        .dout(misbuf_nderr_unqual_c2),
  .siclk(siclk),
  .soclk(soclk)
	);

 
//assign	misbuf_corr_err_c2 = arbdec_arbdp_inst_mb_c2 & misbuf_corr_err_unqual_c2 ; 
//assign	misbuf_uncorr_err_c2 = arbdec_arbdp_inst_mb_c2 & misbuf_uncorr_err_unqual_c2 ; 
// arbdec_arbdp_inst_mb_c2 qualification may not be required since 
// these expressions are qualified with pst_with_ctrue_c? 
// which implies that an instruction is from the Miss Buffer. 

// need to qualify with arb_misbuf_inst_vld_c2
 
//assign	misbuf_corr_err_c2 =   misbuf_corr_err_unqual_c2 & arb_misbuf_inst_vld_c2 & ~arb_misbuf_inval_inst_c2; 
//assign	misbuf_uncorr_err_c2 =   misbuf_uncorr_err_unqual_c2 & arb_misbuf_inst_vld_c2 & ~arb_misbuf_inval_inst_c2; 
//assign	misbuf_notdata_err_c2 =   misbuf_nderr_unqual_c2 & arb_misbuf_inst_vld_c2 & ~arb_misbuf_inval_inst_c2; 

assign  misbuf_corr_err_c2 =   misbuf_corr_err_unqual_c2 & arb_misbuf_inst_vld_c2 & 
                        ~arb_misbuf_inval_inst_c2 & arbdec_arbdp_inst_mb_c2; 
assign  misbuf_uncorr_err_c2 =   misbuf_uncorr_err_unqual_c2 & arb_misbuf_inst_vld_c2 & 
                        ~arb_misbuf_inval_inst_c2 & arbdec_arbdp_inst_mb_c2; 
assign  misbuf_notdata_err_c2 =   misbuf_nderr_unqual_c2 & arb_misbuf_inst_vld_c2 & 
                        ~arb_misbuf_inval_inst_c2 & arbdec_arbdp_inst_mb_c2; 
 

 
 
 
 
//////////////////////////////////////////////////////////////////////// 
// MBF  PICKER: THe picker in the MBF is shared between L2 and DRAM 
//	request picks. The DRAM request pick has preference over 
//	the L2 request. 
// 
// l2 pick: mb_l2_ready is pre-conditioned to account for rdma reads. 
// 	An rdma read  will be  picked only if the rdma register in 
//	tag is invalid. Since the PICK is performed in PX0, the 
//	rdma register valid signal from tag is a PX0_p signal that 
// 	is used after flopping one cycle. 
// 
//	For more details, read the description of the rdma register  
//	in tag. 
// 
//////////////////////////////////////////////////////////////////////// 
 
 
 
assign	mb_l2_ready_qual_in = mb_l2_ready_in &  
			~({32{tag_rdma_vld_px0_p}} & mb_rdma ) ; // BS & SR 11/04/03, MB grows to 32

 
l2t_misbuf_ctl_msff_ctl_macro__width_32 ff_mb_l2_ready_qual  // BS & SR 11/04/03, MB grows to 32
                           (.din(mb_l2_ready_qual_in[31:0]), .l1clk(l1clk), 
                  .scan_in(ff_mb_l2_ready_qual_scanin),
                  .scan_out(ff_mb_l2_ready_qual_scanout),
                  .dout(mb_l2_ready_qual[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mcu_pick_1 
                           (.din(mcu_pick_prev), .l1clk(l1clk), 
             .scan_in(ff_mcu_pick_1_scanin),
             .scan_out(ff_mcu_pick_1_scanout),
             .dout(mcu_pick_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_1 ff_mcu_pick_2_l 
                           (.din(~mcu_pick_prev), .l1clk(l1clk), 
             .scan_in(ff_mcu_pick_2_l_scanin),
             .scan_out(ff_mcu_pick_2_l_scanout),
             .dout(mcu_pick_2_l),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign  mcu_pick_vec  = mb_mcu_ready ; 
 
assign  l2_pick_vec = (( mb_l2_ready_qual | mb_evict_ready | mb_tecc_ready) 
                        & mb_data_vld) ; 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_32 mux_mb_read_pick_vec  // BS & SR 11/04/03, MB grows to 32
			( .dout ( mb_read_pick_vec[31:0]), 
                         .din0(mcu_pick_vec[31:0]), 
                         .din1(l2_pick_vec[31:0]), 
                         .sel0(mcu_pick_1), 
                         .sel1(mcu_pick_2_l)); 
 
 
 
 
///////////////// 
// PICKER 
///////////////// 
assign  pick_quad0_in = mb_read_pick_vec[3:0] ; 
assign  pick_quad1_in = mb_read_pick_vec[7:4] ; 
assign  pick_quad2_in = mb_read_pick_vec[11:8] ; 
assign  pick_quad3_in = mb_read_pick_vec[15:12] ; 

// BS & SR 11/04/03, MB grows to 32
assign  pick_quad4_in = mb_read_pick_vec[19:16] ;
assign  pick_quad5_in = mb_read_pick_vec[23:20] ;
assign  pick_quad6_in = mb_read_pick_vec[27:24] ;
assign  pick_quad7_in = mb_read_pick_vec[31:28] ;

assign  pick_quad_in[0] = |( pick_quad0_in ) ; 
assign  pick_quad_in[1] = |( pick_quad1_in ) ; 
assign  pick_quad_in[2] = |( pick_quad2_in ) ; 
assign  pick_quad_in[3] = |( pick_quad3_in ) ; 

// BS & SR 11/04/03, MB grows to 32
assign  pick_quad_in[4] = |( pick_quad4_in ) ;
assign  pick_quad_in[5] = |( pick_quad5_in ) ;
assign  pick_quad_in[6] = |( pick_quad6_in ) ;
assign  pick_quad_in[7] = |( pick_quad7_in ) ;

//  CHECK THIS

assign	init_pick_state = ~dbb_rst_l | ~dbginit_l; 
assign	sel_mcu_lshift = mcu_pick_d1 & ~init_pick_state ; 
assign	sel_mcu_same = ~mcu_pick_d1  & ~init_pick_state ; 
 
assign	mcu_pick_state_lshift = { mcu_pick_state[6:0], mcu_pick_state[7] } ;  // BS & SR 11/04/03, MB grows to 32
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_8 mux_mcu_st   // BS & SR 11/04/03, MB grows to 32
			(.dout(mcu_pick_state_prev[7:0]), 
                           .din0(8'b1), 
                           .din1(mcu_pick_state_lshift[7:0]), 
                           .din2(mcu_pick_state[7:0]), 
                           .sel0(init_pick_state), 
                           .sel1(sel_mcu_lshift), 
                           .sel2(sel_mcu_same)) ; 
 
l2t_misbuf_ctl_msff_ctl_macro__width_8 ff_mcu_state  // BS & SR 11/04/03, MB grows to 32
                           (.din(mcu_pick_state_prev[7:0]), .l1clk(l1clk), 
               .scan_in(ff_mcu_state_scanin),
               .scan_out(ff_mcu_state_scanout),
               .dout(mcu_pick_state[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// DRAM STATE quad0 
assign  sel_mcu_lshift_quad0 = mcu_pick_d1 & (|(picker_out_d1[3:0])) &  ~init_pick_state ; 
assign  sel_mcu_same_quad0 = ~( mcu_pick_d1  & (|(picker_out_d1[3:0])) )   &  ~init_pick_state ; 
assign  mcu_pick_state_lshift_quad0 = { mcu_pick_state_quad0[2:0],  mcu_pick_state_quad0[3] } ; 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_mcu_st_quad0  
			(.dout(mcu_pick_state_prev_quad0[3:0]), 
                           .din0(4'b1), 
                           .din1(mcu_pick_state_lshift_quad0[3:0]), 
                           .din2(mcu_pick_state_quad0[3:0]), 
                           .sel0(init_pick_state), 
                           .sel1(sel_mcu_lshift_quad0), 
                           .sel2(sel_mcu_same_quad0)) ; 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_mcu_state_quad0 
                           (.din(mcu_pick_state_prev_quad0[3:0]), .l1clk(l1clk), 
                .scan_in(ff_mcu_state_quad0_scanin),
                .scan_out(ff_mcu_state_quad0_scanout),
                .dout(mcu_pick_state_quad0[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// DRAM STATE quad1 
 
 
 
assign  sel_mcu_lshift_quad1 = mcu_pick_d1 & (|(picker_out_d1[7:4]))  &  ~init_pick_state ; 
assign  sel_mcu_same_quad1 = ~( mcu_pick_d1  & (|(picker_out_d1[7:4])) )   &  ~init_pick_state ; 
assign  mcu_pick_state_lshift_quad1 = { mcu_pick_state_quad1[2:0],  mcu_pick_state_quad1[3] } ; 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_mcu_st_quad1  
			(.dout(mcu_pick_state_prev_quad1[3:0]), 
                           .din0(4'b1), 
                           .din1(mcu_pick_state_lshift_quad1[3:0]), 
                           .din2(mcu_pick_state_quad1[3:0]), 
                           .sel0(init_pick_state), 
                           .sel1(sel_mcu_lshift_quad1), 
                           .sel2(sel_mcu_same_quad1)) ; 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_mcu_state_quad1 
                           (.din(mcu_pick_state_prev_quad1[3:0]), .l1clk(l1clk), 
                            .scan_in(ff_mcu_state_quad1_scanin),
                            .scan_out(ff_mcu_state_quad1_scanout),
                            .dout(mcu_pick_state_quad1[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// DRAM STATE quad2 
assign  sel_mcu_lshift_quad2 = mcu_pick_d1 & (|(picker_out_d1[11:8]))  
				&  ~init_pick_state ; 
assign  sel_mcu_same_quad2 = ~( mcu_pick_d1  & (|(picker_out_d1[11:8])) )   
				&  ~init_pick_state ; 
assign  mcu_pick_state_lshift_quad2 = { mcu_pick_state_quad2[2:0],  
			mcu_pick_state_quad2[3] } ; 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_mcu_st_quad2  
			(.dout(mcu_pick_state_prev_quad2[3:0]), 
                           .din0(4'b1), 
                           .din1(mcu_pick_state_lshift_quad2[3:0]), 
                           .din2(mcu_pick_state_quad2[3:0]), 
                           .sel0(init_pick_state), 
                           .sel1(sel_mcu_lshift_quad2), 
                           .sel2(sel_mcu_same_quad2)) ; 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_mcu_state_quad2 
                           (.din(mcu_pick_state_prev_quad2[3:0]), .l1clk(l1clk), 
               .scan_in(ff_mcu_state_quad2_scanin),
               .scan_out(ff_mcu_state_quad2_scanout),
               .dout(mcu_pick_state_quad2[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// DRAM STATE quad3 
assign  sel_mcu_lshift_quad3 = mcu_pick_d1 & (|(picker_out_d1[15:12]))  
				&  ~init_pick_state ; 
assign  sel_mcu_same_quad3 = ~( mcu_pick_d1  & (|(picker_out_d1[15:12])) )   
				&  ~init_pick_state ; 
assign  mcu_pick_state_lshift_quad3 = { mcu_pick_state_quad3[2:0],  
				mcu_pick_state_quad3[3] } ; 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_mcu_st_quad3  
			(.dout(mcu_pick_state_prev_quad3[3:0]), 
                           .din0(4'b1), 
                           .din1(mcu_pick_state_lshift_quad3[3:0]), 
                           .din2(mcu_pick_state_quad3[3:0]), 
                           .sel0(init_pick_state), 
                           .sel1(sel_mcu_lshift_quad3), 
                           .sel2(sel_mcu_same_quad3)) ; 
 
l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_mcu_state_quad3 
                           (.din(mcu_pick_state_prev_quad3[3:0]), .l1clk(l1clk), 
               .scan_in(ff_mcu_state_quad3_scanin),
               .scan_out(ff_mcu_state_quad3_scanout),
               .dout(mcu_pick_state_quad3[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 

// BS & SR 11/04/03, MB grows to 32

// DRAM STATE quad4
assign  sel_mcu_lshift_quad4 = mcu_pick_d1 & (|(picker_out_d1[19:16])) &  ~init_pick_state ;
assign  sel_mcu_same_quad4 = ~( mcu_pick_d1  & (|(picker_out_d1[19:16])) ) &  ~init_pick_state ;
assign  mcu_pick_state_lshift_quad4 = { mcu_pick_state_quad4[2:0], mcu_pick_state_quad4[3] } ;

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_mcu_st_quad4  
        (
	.dout(mcu_pick_state_prev_quad4[3:0]),
        .din0(4'b1),
        .din1(mcu_pick_state_lshift_quad4[3:0]),
        .din2(mcu_pick_state_quad4[3:0]),
        .sel0(init_pick_state),
        .sel1(sel_mcu_lshift_quad4),
        .sel2(sel_mcu_same_quad4)) ;

l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_mcu_state_quad4 
	(
	.scan_in(ff_mcu_state_quad4_scanin),
	.scan_out(ff_mcu_state_quad4_scanout),
	.din(mcu_pick_state_prev_quad4[3:0]), .l1clk(l1clk),
	.dout(mcu_pick_state_quad4[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
);

// DRAM STATE quad5
assign  sel_mcu_lshift_quad5 = mcu_pick_d1 & (|(picker_out_d1[23:20])) &  ~init_pick_state ;
assign  sel_mcu_same_quad5 = ~( mcu_pick_d1  & (|(picker_out_d1[23:20])) ) &  ~init_pick_state ;
assign  mcu_pick_state_lshift_quad5 = { mcu_pick_state_quad5[2:0], mcu_pick_state_quad5[3] } ;

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_mcu_st_quad5  
        (
        .dout(mcu_pick_state_prev_quad5[3:0]),
        .din0(4'b1),
        .din1(mcu_pick_state_lshift_quad5[3:0]),
        .din2(mcu_pick_state_quad5[3:0]),
        .sel0(init_pick_state),
        .sel1(sel_mcu_lshift_quad5),
        .sel2(sel_mcu_same_quad5)) ;

l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_mcu_state_quad5 
        (
        .scan_in(ff_mcu_state_quad5_scanin),
        .scan_out(ff_mcu_state_quad5_scanout),
        .din(mcu_pick_state_prev_quad5[3:0]), .l1clk(l1clk),
        .dout(mcu_pick_state_quad5[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
);

// DRAM STATE quad6
assign  sel_mcu_lshift_quad6 = mcu_pick_d1 & (|(picker_out_d1[27:24])) &  ~init_pick_state ;
assign  sel_mcu_same_quad6 = ~( mcu_pick_d1  & (|(picker_out_d1[27:24])) ) &  ~init_pick_state ;
assign  mcu_pick_state_lshift_quad6 = { mcu_pick_state_quad6[2:0], mcu_pick_state_quad6[3] } ;

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_mcu_st_quad6  
        (
        .dout(mcu_pick_state_prev_quad6[3:0]),
        .din0(4'b1),
        .din1(mcu_pick_state_lshift_quad6[3:0]),
        .din2(mcu_pick_state_quad6[3:0]),
        .sel0(init_pick_state),
        .sel1(sel_mcu_lshift_quad6),
        .sel2(sel_mcu_same_quad6)) ;

l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_mcu_state_quad6 
        (
        .scan_in(ff_mcu_state_quad6_scanin),
        .scan_out(ff_mcu_state_quad6_scanout),
        .din(mcu_pick_state_prev_quad6[3:0]), .l1clk(l1clk),
        .dout(mcu_pick_state_quad6[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
);


// DRAM STATE quad7
assign  sel_mcu_lshift_quad7 = mcu_pick_d1 & (|(picker_out_d1[31:28])) &  ~init_pick_state ;
assign  sel_mcu_same_quad7 = ~( mcu_pick_d1  & (|(picker_out_d1[31:28])) ) &  ~init_pick_state ;
assign  mcu_pick_state_lshift_quad7 = { mcu_pick_state_quad7[2:0], mcu_pick_state_quad7[3] } ;

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_mcu_st_quad7  
        (
        .dout(mcu_pick_state_prev_quad7[3:0]),
        .din0(4'b1),
        .din1(mcu_pick_state_lshift_quad7[3:0]),
        .din2(mcu_pick_state_quad7[3:0]),
        .sel0(init_pick_state),
        .sel1(sel_mcu_lshift_quad7),
        .sel2(sel_mcu_same_quad7)) ;

l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_mcu_state_quad7 
        (
        .scan_in(ff_mcu_state_quad7_scanin),
        .scan_out(ff_mcu_state_quad7_scanout),
        .din(mcu_pick_state_prev_quad7[3:0]), .l1clk(l1clk),
        .dout(mcu_pick_state_quad7[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
);

////////// 
// L2  STATE 
assign  sel_l2_lshift = l2_pick_d1 &  ~init_pick_state  ; 
assign  sel_l2_same =  ~l2_pick_d1    &  ~init_pick_state  ; 
assign	l2_pick_state_lshift = { l2_pick_state[6:0], l2_pick_state[7] } ; 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_8 mux_l2_st  
			(.dout(l2_pick_state_prev[7:0]), 
                           .din0(8'b1), 
                           .din1(l2_pick_state_lshift[7:0]), 
                           .din2(l2_pick_state[7:0]), 
                           .sel0(init_pick_state), 
                           .sel1(sel_l2_lshift), 
                           .sel2(sel_l2_same)) ; 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_8 ff_l2_state 
                           (.din(l2_pick_state_prev[7:0]), .l1clk(l1clk), 
                    .scan_in(ff_l2_state_scanin),
                    .scan_out(ff_l2_state_scanout),
                    .dout(l2_pick_state[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
// L2 state quad0 
 
 
assign  sel_l2_lshift_quad0 = ( l2_pick_d1 & (|(picker_out_d1[3:0]))) &   
				~init_pick_state  ; 
assign  sel_l2_same_quad0 =   ~( l2_pick_d1 & (|(picker_out_d1[3:0])) )    
				&  ~init_pick_state ; 
assign  l2_pick_state_lshift_quad0 = { l2_pick_state_quad0[2:0], l2_pick_state_quad0[3] } ; 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_l2_st_quad0  
			(.dout(l2_pick_state_prev_quad0[3:0]), 
                           .din0(4'b1), 
                           .din1(l2_pick_state_lshift_quad0[3:0]), 
                           .din2(l2_pick_state_quad0[3:0]), 
                           .sel0(init_pick_state), 
                           .sel1(sel_l2_lshift_quad0), 
                           .sel2(sel_l2_same_quad0)) ; 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_l2_state_quad0 
                           (.din(l2_pick_state_prev_quad0[3:0]), .l1clk(l1clk), 
                 .scan_in(ff_l2_state_quad0_scanin),
                 .scan_out(ff_l2_state_quad0_scanout),
                 .dout(l2_pick_state_quad0[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// L2 state quad1 
 
assign  sel_l2_lshift_quad1 = ( l2_pick_d1 & (|(picker_out_d1[7:4])) )  
				&  ~init_pick_state  ; 
assign  sel_l2_same_quad1 =   ~( l2_pick_d1 & (|(picker_out_d1[7:4])) )    
				&  ~init_pick_state ; 
assign  l2_pick_state_lshift_quad1 = { l2_pick_state_quad1[2:0],  
				l2_pick_state_quad1[3] } ; 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_l2_st_quad1  
			(.dout(l2_pick_state_prev_quad1[3:0]), 
                           .din0(4'b1), 
                           .din1(l2_pick_state_lshift_quad1[3:0]), 
                           .din2(l2_pick_state_quad1[3:0]), 
                           .sel0(init_pick_state), 
                           .sel1(sel_l2_lshift_quad1), 
                           .sel2(sel_l2_same_quad1)) ; 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_l2_state_quad1 
                           (.din(l2_pick_state_prev_quad1[3:0]), .l1clk(l1clk), 
                 .scan_in(ff_l2_state_quad1_scanin),
                 .scan_out(ff_l2_state_quad1_scanout),
                 .dout(l2_pick_state_quad1[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// L2 state quad2 
 
 
assign  sel_l2_lshift_quad2 = ( l2_pick_d1 & (|(picker_out_d1[11:8])) )  
			&  ~init_pick_state  ; 
assign  sel_l2_same_quad2 =   ~( l2_pick_d1 & (|(picker_out_d1[11:8])) )    
			&  ~init_pick_state ; 
assign  l2_pick_state_lshift_quad2 = { l2_pick_state_quad2[2:0],  
			l2_pick_state_quad2[3] } ; 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_l2_st_quad2  
			(.dout(l2_pick_state_prev_quad2[3:0]), 
                           .din0(4'b1), 
                           .din1(l2_pick_state_lshift_quad2[3:0]), 
                           .din2(l2_pick_state_quad2[3:0]), 
                           .sel0(init_pick_state), 
                           .sel1(sel_l2_lshift_quad2), 
                           .sel2(sel_l2_same_quad2)) ; 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_l2_state_quad2 
                           (.din(l2_pick_state_prev_quad2[3:0]), .l1clk(l1clk), 
                 .scan_in(ff_l2_state_quad2_scanin),
                 .scan_out(ff_l2_state_quad2_scanout),
                 .dout(l2_pick_state_quad2[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// L2 state quad3 
 
 
assign  sel_l2_lshift_quad3 = ( l2_pick_d1 & (|(picker_out_d1[15:12])) )  &  ~init_pick_state  ; 
assign  sel_l2_same_quad3 =   ~( l2_pick_d1 & (|(picker_out_d1[15:12])) )    &  ~init_pick_state ; 
assign  l2_pick_state_lshift_quad3 = { l2_pick_state_quad3[2:0],  l2_pick_state_quad3[3] } ; 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_l2_st_quad3  
			(.dout(l2_pick_state_prev_quad3[3:0]), 
                         .din0(4'b1), 
                         .din1(l2_pick_state_lshift_quad3[3:0]), 
                         .din2(l2_pick_state_quad3[3:0]), 
                         .sel0(init_pick_state), 
                         .sel1(sel_l2_lshift_quad3), 
                         .sel2(sel_l2_same_quad3)) ; 
 
 
l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_l2_state_quad3 
                       (.din(l2_pick_state_prev_quad3[3:0]), .l1clk(l1clk), 
                        .scan_in(ff_l2_state_quad3_scanin),
                        .scan_out(ff_l2_state_quad3_scanout),
                        .dout(l2_pick_state_quad3[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 


// BS & SR 11/04/03, MB grows to 32
// L2 STATE quad4
assign  sel_l2_lshift_quad4 = l2_pick_d1 & (|(picker_out_d1[19:16])) &  ~init_pick_state ;
assign  sel_l2_same_quad4 = ~( l2_pick_d1  & (|(picker_out_d1[19:16])) ) &  ~init_pick_state ;
assign  l2_pick_state_lshift_quad4 = { l2_pick_state_quad4[2:0], l2_pick_state_quad4[3] } ;

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_l2_st_quad4  
        (
        .dout(l2_pick_state_prev_quad4[3:0]),
        .din0(4'b1),
        .din1(l2_pick_state_lshift_quad4[3:0]),
        .din2(l2_pick_state_quad4[3:0]),
        .sel0(init_pick_state),
        .sel1(sel_l2_lshift_quad4),
        .sel2(sel_l2_same_quad4)) ;

l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_l2_state_quad4 
        (
        .scan_in(ff_l2_state_quad4_scanin),
        .scan_out(ff_l2_state_quad4_scanout),
        .din(l2_pick_state_prev_quad4[3:0]), .l1clk(l1clk),
        .dout(l2_pick_state_quad4[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
);

// L2 STATE quad5
assign  sel_l2_lshift_quad5 = l2_pick_d1 & (|(picker_out_d1[23:20])) &  ~init_pick_state ;
assign  sel_l2_same_quad5 = ~( l2_pick_d1  & (|(picker_out_d1[23:20])) ) &  ~init_pick_state ;
assign  l2_pick_state_lshift_quad5 = { l2_pick_state_quad5[2:0], l2_pick_state_quad5[3] } ;

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_l2_st_quad5  
        (
        .dout(l2_pick_state_prev_quad5[3:0]),
        .din0(4'b1),
        .din1(l2_pick_state_lshift_quad5[3:0]),
        .din2(l2_pick_state_quad5[3:0]),
        .sel0(init_pick_state),
        .sel1(sel_l2_lshift_quad5),
        .sel2(sel_l2_same_quad5)) ;

l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_l2_state_quad5 
        (
        .scan_in(ff_l2_state_quad5_scanin),
        .scan_out(ff_l2_state_quad5_scanout),
        .din(l2_pick_state_prev_quad5[3:0]), .l1clk(l1clk),
        .dout(l2_pick_state_quad5[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
);


// L2 STATE quad6
assign  sel_l2_lshift_quad6 = l2_pick_d1 & (|(picker_out_d1[27:24])) &  ~init_pick_state ;
assign  sel_l2_same_quad6 = ~( l2_pick_d1  & (|(picker_out_d1[27:24])) ) &  ~init_pick_state ;
assign  l2_pick_state_lshift_quad6 = { l2_pick_state_quad6[2:0], l2_pick_state_quad6[3] } ;

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_l2_st_quad6  
        (
        .dout(l2_pick_state_prev_quad6[3:0]),
        .din0(4'b1),
        .din1(l2_pick_state_lshift_quad6[3:0]),
        .din2(l2_pick_state_quad6[3:0]),
        .sel0(init_pick_state),
        .sel1(sel_l2_lshift_quad6),
        .sel2(sel_l2_same_quad6)) ;

l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_l2_state_quad6 
        (
        .scan_in(ff_l2_state_quad6_scanin),
        .scan_out(ff_l2_state_quad6_scanout),
        .din(l2_pick_state_prev_quad6[3:0]), .l1clk(l1clk),
        .dout(l2_pick_state_quad6[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
);


// L2 STATE quad7
assign  sel_l2_lshift_quad7 = l2_pick_d1 & (|(picker_out_d1[31:28])) &  ~init_pick_state ;
assign  sel_l2_same_quad7 = ~( l2_pick_d1  & (|(picker_out_d1[31:28])) ) &  ~init_pick_state ;
assign  l2_pick_state_lshift_quad7 = { l2_pick_state_quad7[2:0], l2_pick_state_quad7[3] } ;

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_l2_st_quad7  
        (
        .dout(l2_pick_state_prev_quad7[3:0]),
        .din0(4'b1),
        .din1(l2_pick_state_lshift_quad7[3:0]),
        .din2(l2_pick_state_quad7[3:0]),
        .sel0(init_pick_state),
        .sel1(sel_l2_lshift_quad7),
        .sel2(sel_l2_same_quad7)) ;

l2t_misbuf_ctl_msff_ctl_macro__width_4 ff_l2_state_quad7 
        (
        .scan_in(ff_l2_state_quad7_scanin),
        .scan_out(ff_l2_state_quad7_scanout),
        .din(l2_pick_state_prev_quad7[3:0]), .l1clk(l1clk),
        .dout(l2_pick_state_quad7[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
);




 
 
// mux for picking the anchor of the RPE. 
// real mcu pick 
 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_8 mux_pick_state 
		( .dout ( pick_state[7:0]), 
                  .din0(l2_pick_state[7:0]), 
                  .din1(mcu_pick_state[7:0]), 
                  .sel0(~mcu_pick), 
                  .sel1(mcu_pick)); 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_pick_state_quad0 
			( .dout(pick_state_quad0[3:0]), 
                         .din0(l2_pick_state_quad0[3:0]), 
                         .din1(mcu_pick_state_quad0[3:0]), 
                         .sel0(~mcu_pick), 
                         .sel1(mcu_pick)); 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_pick_state_quad1 
			( .dout (pick_state_quad1[3:0]), 
                         .din0(l2_pick_state_quad1[3:0]), 
                         .din1(mcu_pick_state_quad1[3:0]), 
                         .sel0(~mcu_pick), 
                         .sel1(mcu_pick)); 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_pick_state_quad2 
			( .dout (pick_state_quad2[3:0]), 
                         .din0(l2_pick_state_quad2[3:0]), 
                         .din1(mcu_pick_state_quad2[3:0]), 
                         .sel0(~mcu_pick), 
                         .sel1(mcu_pick)); 
 
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_pick_state_quad3 
			( .dout (pick_state_quad3[3:0]), 
                         .din0(l2_pick_state_quad3[3:0]), 
                         .din1(mcu_pick_state_quad3[3:0]), 
                         .sel0(~mcu_pick), 
                         .sel1(mcu_pick)); 

// BS & SR 11/04/03, MB grows to 32
l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_pick_state_quad4 
                        ( .dout (pick_state_quad4[3:0]),
                         .din0(l2_pick_state_quad4[3:0]),
                         .din1(mcu_pick_state_quad4[3:0]),
                         .sel0(~mcu_pick),
                         .sel1(mcu_pick));

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_pick_state_quad5 
                        ( .dout (pick_state_quad5[3:0]),
                         .din0(l2_pick_state_quad5[3:0]),
                         .din1(mcu_pick_state_quad5[3:0]),
                         .sel0(~mcu_pick),
                         .sel1(mcu_pick));

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_pick_state_quad6 
                        ( .dout (pick_state_quad6[3:0]),
                         .din0(l2_pick_state_quad6[3:0]),
                         .din1(mcu_pick_state_quad6[3:0]),
                         .sel0(~mcu_pick),
                         .sel1(mcu_pick));

l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_pick_state_quad7 
                        ( .dout (pick_state_quad7[3:0]),
                         .din0(l2_pick_state_quad7[3:0]),
                         .din1(mcu_pick_state_quad7[3:0]),
                         .sel0(~mcu_pick),
                         .sel1(mcu_pick));

 
 
 
 
assign  pick_s0 = pick_state[0] ; 
assign	pick_s1 = pick_state[1] ; 
assign	pick_s2 = pick_state[2] ; 
assign  pick_s3 = pick_state[3] ; 
// BS & SR 11/04/03, MB grows to 32
assign  pick_s4 = pick_state[4] ; 
assign  pick_s5 = pick_state[5] ; 
assign  pick_s6 = pick_state[6] ; 
assign  pick_s7 = pick_state[7] ; 
 
 
assign	pick_s0_quad0 = pick_state_quad0[0]; 
assign	pick_s1_quad0 = pick_state_quad0[1]; 
assign	pick_s2_quad0 = pick_state_quad0[2]; 
assign	pick_s3_quad0 = pick_state_quad0[3]; 
 
assign	pick_s0_quad1 = pick_state_quad1[0]; 
assign	pick_s1_quad1 = pick_state_quad1[1]; 
assign	pick_s2_quad1 = pick_state_quad1[2]; 
assign	pick_s3_quad1 = pick_state_quad1[3]; 
 
assign	pick_s0_quad2 = pick_state_quad2[0]; 
assign	pick_s1_quad2 = pick_state_quad2[1]; 
assign	pick_s2_quad2 = pick_state_quad2[2]; 
assign	pick_s3_quad2 = pick_state_quad2[3]; 
 
assign	pick_s0_quad3 = pick_state_quad3[0]; 
assign	pick_s1_quad3 = pick_state_quad3[1]; 
assign	pick_s2_quad3 = pick_state_quad3[2]; 
assign	pick_s3_quad3 = pick_state_quad3[3]; 
 
// BS & SR 11/04/03, MB grows to 32
assign  pick_s0_quad4 = pick_state_quad4[0];
assign  pick_s1_quad4 = pick_state_quad4[1];
assign  pick_s2_quad4 = pick_state_quad4[2]; 
assign  pick_s3_quad4 = pick_state_quad4[3]; 

assign  pick_s0_quad5 = pick_state_quad5[0]; 
assign  pick_s1_quad5 = pick_state_quad5[1]; 
assign  pick_s2_quad5 = pick_state_quad5[2];
assign  pick_s3_quad5 = pick_state_quad5[3];
 
assign  pick_s0_quad6 = pick_state_quad6[0]; 
assign  pick_s1_quad6 = pick_state_quad6[1]; 
assign  pick_s2_quad6 = pick_state_quad6[2]; 
assign  pick_s3_quad6 = pick_state_quad6[3]; 

assign  pick_s0_quad7 = pick_state_quad7[0];
assign  pick_s1_quad7 = pick_state_quad7[1]; 
assign  pick_s2_quad7 = pick_state_quad7[2]; 
assign  pick_s3_quad7 = pick_state_quad7[3]; 


 
 
 
// QUAD0 bits. 
assign	pick_quad0_sel[0] = pick_quad0_in[0] &  
			  ( pick_s0_quad0 |  
			  ( pick_s1_quad0 & ~( pick_quad0_in[1] | pick_quad0_in[2] | pick_quad0_in[3] )) |
			  ( pick_s2_quad0 & ~(pick_quad0_in[2] | pick_quad0_in[3] )) | 
			  ( pick_s3_quad0 & ~(pick_quad0_in[3] )  ) ) ; 
 
 
assign	pick_quad0_sel[1] = pick_quad0_in[1] &  ( pick_s1_quad0 | 
                ( pick_s2_quad0 & ~( pick_quad0_in[2] | 
                        pick_quad0_in[3] | pick_quad0_in[0] ) ) | 
                        ( pick_s3_quad0 & ~(pick_quad0_in[3] | pick_quad0_in[0] )) | 
                        ( pick_s0_quad0 & ~(pick_quad0_in[0] )  ) ) ; 
 
 
assign	pick_quad0_sel[2] = pick_quad0_in[2] &  ( pick_s2_quad0 | 
                ( pick_s3_quad0 & ~( pick_quad0_in[3] | 
                        pick_quad0_in[0] | pick_quad0_in[1] ) ) | 
                        ( pick_s0_quad0 & ~(pick_quad0_in[0] | pick_quad0_in[1] )) | 
                        ( pick_s1_quad0 & ~(pick_quad0_in[1] )  ) ) ; 
 
assign	pick_quad0_sel[3] = pick_quad0_in[3] &  ( pick_s3_quad0 | 
                ( pick_s0_quad0 & ~( pick_quad0_in[0] | 
                        pick_quad0_in[1] | pick_quad0_in[2] ) ) | 
                        ( pick_s1_quad0 & ~(pick_quad0_in[1] | pick_quad0_in[2] )) | 
                        ( pick_s2_quad0 & ~(pick_quad0_in[2] )  ) ) ; 
 
 
// QUAD1 bits. 
assign  pick_quad1_sel[0] = pick_quad1_in[0] &  ( pick_s0_quad1 | 
                ( pick_s1_quad1 & ~( pick_quad1_in[1] | 
                        pick_quad1_in[2] | pick_quad1_in[3] ) ) | 
                        ( pick_s2_quad1 & ~(pick_quad1_in[2] | pick_quad1_in[3] )) | 
                        ( pick_s3_quad1 & ~(pick_quad1_in[3] )  ) ) ; 
 
 
assign  pick_quad1_sel[1] = pick_quad1_in[1] &  ( pick_s1_quad1 | 
                ( pick_s2_quad1 & ~( pick_quad1_in[2] | 
                        pick_quad1_in[3] | pick_quad1_in[0] ) ) | 
                        ( pick_s3_quad1 & ~(pick_quad1_in[3] | pick_quad1_in[0] )) | 
                        ( pick_s0_quad1 & ~(pick_quad1_in[0] )  ) ) ; 
 
 
assign  pick_quad1_sel[2] = pick_quad1_in[2] &  ( pick_s2_quad1 | 
                ( pick_s3_quad1 & ~( pick_quad1_in[3] | 
                        pick_quad1_in[0] | pick_quad1_in[1] ) ) | 
                        ( pick_s0_quad1 & ~(pick_quad1_in[0] | pick_quad1_in[1] )) | 
                        ( pick_s1_quad1 & ~(pick_quad1_in[1] )  ) ) ; 
 
assign  pick_quad1_sel[3] = pick_quad1_in[3] &  ( pick_s3_quad1 | 
                ( pick_s0_quad1 & ~( pick_quad1_in[0] | 
                        pick_quad1_in[1] | pick_quad1_in[2] ) ) | 
                        ( pick_s1_quad1 & ~(pick_quad1_in[1] | pick_quad1_in[2] )) | 
                        ( pick_s2_quad1 & ~(pick_quad1_in[2] )  ) ) ;  
 
// QUAD2 bits. 
assign  pick_quad2_sel[0] = pick_quad2_in[0] &  ( pick_s0_quad2 | 
                ( pick_s1_quad2 & ~( pick_quad2_in[1] | 
                        pick_quad2_in[2] | pick_quad2_in[3] ) ) | 
                        ( pick_s2_quad2 & ~(pick_quad2_in[2] | pick_quad2_in[3] )) | 
                        ( pick_s3_quad2 & ~(pick_quad2_in[3] )  ) ) ; 
 
 
assign  pick_quad2_sel[1] = pick_quad2_in[1] &  ( pick_s1_quad2 | 
                ( pick_s2_quad2 & ~( pick_quad2_in[2] | 
                        pick_quad2_in[3] | pick_quad2_in[0] ) ) | 
                        ( pick_s3_quad2 & ~(pick_quad2_in[3] | pick_quad2_in[0] )) | 
                        ( pick_s0_quad2 & ~(pick_quad2_in[0] )  ) ) ; 
 
 
assign  pick_quad2_sel[2] = pick_quad2_in[2] &  ( pick_s2_quad2 | 
                ( pick_s3_quad2 & ~( pick_quad2_in[3] | 
                        pick_quad2_in[0] | pick_quad2_in[1] ) ) | 
                        ( pick_s0_quad2 & ~(pick_quad2_in[0] | pick_quad2_in[1] )) | 
                        ( pick_s1_quad2 & ~(pick_quad2_in[1] )  ) ) ; 
 
assign  pick_quad2_sel[3] = pick_quad2_in[3] &  ( pick_s3_quad2 | 
                ( pick_s0_quad2 & ~( pick_quad2_in[0] | 
                        pick_quad2_in[1] | pick_quad2_in[2] ) ) | 
                        ( pick_s1_quad2 & ~(pick_quad2_in[1] | pick_quad2_in[2] )) | 
                        ( pick_s2_quad2 & ~(pick_quad2_in[2] )  ) ) ;  
 
 
// QUAD3 bits. 
assign  pick_quad3_sel[0] = pick_quad3_in[0] &  
			  ( pick_s0_quad3 | 
                	  ( pick_s1_quad3 & ~( pick_quad3_in[1] | pick_quad3_in[2] | pick_quad3_in[3] ) ) | 
                          ( pick_s2_quad3 & ~(pick_quad3_in[2] | pick_quad3_in[3] )) | 
                          ( pick_s3_quad3 & ~(pick_quad3_in[3] )  ) ) ; 
 
 
assign  pick_quad3_sel[1] = pick_quad3_in[1] &  
			  ( pick_s1_quad3 | 
                	  ( pick_s2_quad3 & ~( pick_quad3_in[2] | pick_quad3_in[3] | pick_quad3_in[0] ) ) | 
                          ( pick_s3_quad3 & ~(pick_quad3_in[3] | pick_quad3_in[0] )) | 
                          ( pick_s0_quad3 & ~(pick_quad3_in[0] )  ) ) ; 
 
 
assign  pick_quad3_sel[2] = pick_quad3_in[2] &  
			  ( pick_s2_quad3 | 
                	  ( pick_s3_quad3 & ~( pick_quad3_in[3] | pick_quad3_in[0] | pick_quad3_in[1] ) ) | 
                          ( pick_s0_quad3 & ~(pick_quad3_in[0] | pick_quad3_in[1] )) | 
                          ( pick_s1_quad3 & ~(pick_quad3_in[1] )  ) ) ; 
 
assign  pick_quad3_sel[3] = pick_quad3_in[3] &  
			  ( pick_s3_quad3 | 
                	  ( pick_s0_quad3 & ~( pick_quad3_in[0] | pick_quad3_in[1] | pick_quad3_in[2] ) ) | 
                          ( pick_s1_quad3 & ~(pick_quad3_in[1] | pick_quad3_in[2] )) | 
                          ( pick_s2_quad3 & ~(pick_quad3_in[2] )  ) ) ;  
 
// BS & SR 11/04/03, MB grows to 32

// QUAD4 bits.
assign  pick_quad4_sel[0] = pick_quad4_in[0] &  
                          ( pick_s0_quad4 |
                          ( pick_s1_quad4 & ~( pick_quad4_in[1] | pick_quad4_in[2] | pick_quad4_in[3] ) ) |
                          ( pick_s2_quad4 & ~(pick_quad4_in[2] | pick_quad4_in[3] )) |
                          ( pick_s3_quad4 & ~(pick_quad4_in[3] )  ) ) ;


assign  pick_quad4_sel[1] = pick_quad4_in[1] &  
                          ( pick_s1_quad4 |
                          ( pick_s2_quad4 & ~( pick_quad4_in[2] | pick_quad4_in[3] | pick_quad4_in[0] ) ) |
                          ( pick_s3_quad4 & ~(pick_quad4_in[3] | pick_quad4_in[0] )) |
                          ( pick_s0_quad4 & ~(pick_quad4_in[0] )  ) ) ;


assign  pick_quad4_sel[2] = pick_quad4_in[2] &  
                          ( pick_s2_quad4 |
                          ( pick_s3_quad4 & ~( pick_quad4_in[3] | pick_quad4_in[0] | pick_quad4_in[1] ) ) |
                          ( pick_s0_quad4 & ~(pick_quad4_in[0] | pick_quad4_in[1] )) |
                          ( pick_s1_quad4 & ~(pick_quad4_in[1] )  ) ) ;

assign  pick_quad4_sel[3] = pick_quad4_in[3] &  
                          ( pick_s3_quad4 |
                          ( pick_s0_quad4 & ~( pick_quad4_in[0] | pick_quad4_in[1] | pick_quad4_in[2] ) ) |
                          ( pick_s1_quad4 & ~(pick_quad4_in[1] | pick_quad4_in[2] )) |
                          ( pick_s2_quad4 & ~(pick_quad4_in[2] )  ) ) ;


// QUAD5 bits.
assign  pick_quad5_sel[0] = pick_quad5_in[0] &  
                          ( pick_s0_quad5 |
                          ( pick_s1_quad5 & ~( pick_quad5_in[1] | pick_quad5_in[2] | pick_quad5_in[3] ) ) |
                          ( pick_s2_quad5 & ~(pick_quad5_in[2] | pick_quad5_in[3] )) |
                          ( pick_s3_quad5 & ~(pick_quad5_in[3] )  ) ) ;


assign  pick_quad5_sel[1] = pick_quad5_in[1] &  
                          ( pick_s1_quad5 |
                          ( pick_s2_quad5 & ~( pick_quad5_in[2] | pick_quad5_in[3] | pick_quad5_in[0] ) ) |
                          ( pick_s3_quad5 & ~(pick_quad5_in[3] | pick_quad5_in[0] )) |
                          ( pick_s0_quad5 & ~(pick_quad5_in[0] )  ) ) ;


assign  pick_quad5_sel[2] = pick_quad5_in[2] &  
                          ( pick_s2_quad5 |
                          ( pick_s3_quad5 & ~( pick_quad5_in[3] | pick_quad5_in[0] | pick_quad5_in[1] ) ) |
                          ( pick_s0_quad5 & ~(pick_quad5_in[0] | pick_quad5_in[1] )) |
                          ( pick_s1_quad5 & ~(pick_quad5_in[1] )  ) ) ;

assign  pick_quad5_sel[3] = pick_quad5_in[3] &  
                          ( pick_s3_quad5 |
                          ( pick_s0_quad5 & ~( pick_quad5_in[0] | pick_quad5_in[1] | pick_quad5_in[2] ) ) |
                          ( pick_s1_quad5 & ~(pick_quad5_in[1] | pick_quad5_in[2] )) |
                          ( pick_s2_quad5 & ~(pick_quad5_in[2] )  ) ) ;


// QUAD6 bits.
assign  pick_quad6_sel[0] = pick_quad6_in[0] &  
                          ( pick_s0_quad6 |
                          ( pick_s1_quad6 & ~( pick_quad6_in[1] | pick_quad6_in[2] | pick_quad6_in[3] ) ) |
                          ( pick_s2_quad6 & ~(pick_quad6_in[2] | pick_quad6_in[3] )) |
                          ( pick_s3_quad6 & ~(pick_quad6_in[3] )  ) ) ;


assign  pick_quad6_sel[1] = pick_quad6_in[1] &  
                          ( pick_s1_quad6 |
                          ( pick_s2_quad6 & ~( pick_quad6_in[2] | pick_quad6_in[3] | pick_quad6_in[0] ) ) |
                          ( pick_s3_quad6 & ~(pick_quad6_in[3] | pick_quad6_in[0] )) |
                          ( pick_s0_quad6 & ~(pick_quad6_in[0] )  ) ) ;


assign  pick_quad6_sel[2] = pick_quad6_in[2] &  
                          ( pick_s2_quad6 |
                          ( pick_s3_quad6 & ~( pick_quad6_in[3] | pick_quad6_in[0] | pick_quad6_in[1] ) ) |
                          ( pick_s0_quad6 & ~(pick_quad6_in[0] | pick_quad6_in[1] )) |
                          ( pick_s1_quad6 & ~(pick_quad6_in[1] )  ) ) ;

assign  pick_quad6_sel[3] = pick_quad6_in[3] &  
                          ( pick_s3_quad6 |
                          ( pick_s0_quad6 & ~( pick_quad6_in[0] | pick_quad6_in[1] | pick_quad6_in[2] ) ) |
                          ( pick_s1_quad6 & ~(pick_quad6_in[1] | pick_quad6_in[2] )) |
                          ( pick_s2_quad6 & ~(pick_quad6_in[2] )  ) ) ;


// QUAD7 bits.
assign  pick_quad7_sel[0] = pick_quad7_in[0] &  
                          ( pick_s0_quad7 |
                          ( pick_s1_quad7 & ~( pick_quad7_in[1] | pick_quad7_in[2] | pick_quad7_in[3] ) ) |
                          ( pick_s2_quad7 & ~(pick_quad7_in[2] | pick_quad7_in[3] )) |
                          ( pick_s3_quad7 & ~(pick_quad7_in[3] )  ) ) ;


assign  pick_quad7_sel[1] = pick_quad7_in[1] &  
                          ( pick_s1_quad7 |
                          ( pick_s2_quad7 & ~( pick_quad7_in[2] | pick_quad7_in[3] | pick_quad7_in[0] ) ) |
                          ( pick_s3_quad7 & ~(pick_quad7_in[3] | pick_quad7_in[0] )) |
                          ( pick_s0_quad7 & ~(pick_quad7_in[0] )  ) ) ;


assign  pick_quad7_sel[2] = pick_quad7_in[2] &  
                          ( pick_s2_quad7 |
                          ( pick_s3_quad7 & ~( pick_quad7_in[3] | pick_quad7_in[0] | pick_quad7_in[1] ) ) |
                          ( pick_s0_quad7 & ~(pick_quad7_in[0] | pick_quad7_in[1] )) |
                          ( pick_s1_quad7 & ~(pick_quad7_in[1] )  ) ) ;

assign  pick_quad7_sel[3] = pick_quad7_in[3] &  
                          ( pick_s3_quad7 |
                          ( pick_s0_quad7 & ~( pick_quad7_in[0] | pick_quad7_in[1] | pick_quad7_in[2] ) ) |
                          ( pick_s1_quad7 & ~(pick_quad7_in[1] | pick_quad7_in[2] )) |
                          ( pick_s2_quad7 & ~(pick_quad7_in[2] )  ) ) ;


 
// BS & SR 11/04/03, MB grows to 32
// OCTAL  bits. 
assign  pick_oct_sel[0] = pick_quad_in[0] &  
			 ( pick_s0 | 
                         ( pick_s1 & ~( pick_quad_in[1] | pick_quad_in[2] | pick_quad_in[3] |  pick_quad_in[4] |
                                        pick_quad_in[5] | pick_quad_in[6] | pick_quad_in[7])) |
                         ( pick_s2 & ~(pick_quad_in[2] | pick_quad_in[3] |  pick_quad_in[4] |
                                        pick_quad_in[5] | pick_quad_in[6] | pick_quad_in[7])) | 
                         ( pick_s3 & ~(pick_quad_in[3] |  pick_quad_in[4] |
                                        pick_quad_in[5] | pick_quad_in[6] | pick_quad_in[7])) |
                         ( pick_s4 & ~(pick_quad_in[4] |
                                        pick_quad_in[5] | pick_quad_in[6] | pick_quad_in[7])) |
                         ( pick_s5 & ~(pick_quad_in[5] | pick_quad_in[6] | pick_quad_in[7])) |
                         ( pick_s6 & ~(pick_quad_in[6] | pick_quad_in[7])) |
                         ( pick_s7 & ~(pick_quad_in[7]))
                         ) ; 
 
 
assign  pick_oct_sel[1] = pick_quad_in[1] &  
			 ( pick_s1 | 
                         ( pick_s2 & ~( pick_quad_in[2] | pick_quad_in[3] | pick_quad_in[4] |  pick_quad_in[5] |
                                        pick_quad_in[6] | pick_quad_in[7] | pick_quad_in[0])) |
                         ( pick_s3 & ~(pick_quad_in[3] | pick_quad_in[4] |  pick_quad_in[5] |
                                        pick_quad_in[6] | pick_quad_in[7] | pick_quad_in[0])) |
                         ( pick_s4 & ~(pick_quad_in[4] |  pick_quad_in[5] |
                                        pick_quad_in[6] | pick_quad_in[7] | pick_quad_in[0])) |
                         ( pick_s5 & ~(pick_quad_in[5] |
                                        pick_quad_in[6] | pick_quad_in[7] | pick_quad_in[0])) |
                         ( pick_s6 & ~(pick_quad_in[6] | pick_quad_in[7] | pick_quad_in[0])) |
                         ( pick_s7 & ~(pick_quad_in[7] | pick_quad_in[0])) |
                         ( pick_s0 & ~(pick_quad_in[0])) 
                         ) ;    

 
 
assign  pick_oct_sel[2] = pick_quad_in[2] &  
       ( pick_s2 |
       ( pick_s3 & ~( pick_quad_in[3] | pick_quad_in[4] | pick_quad_in[5] |  pick_quad_in[6] |
                                        pick_quad_in[7] | pick_quad_in[0] | pick_quad_in[1])) |
       ( pick_s4 & ~(pick_quad_in[4] | pick_quad_in[5] |  pick_quad_in[6] |
                                        pick_quad_in[7] | pick_quad_in[0] | pick_quad_in[1])) |
       ( pick_s5 & ~(pick_quad_in[5] |  pick_quad_in[6] | pick_quad_in[7] | pick_quad_in[0] | pick_quad_in[1])) |
       ( pick_s6 & ~(pick_quad_in[6] | pick_quad_in[7] | pick_quad_in[0] | pick_quad_in[1])) |
       ( pick_s7 & ~(pick_quad_in[7] | pick_quad_in[0] | pick_quad_in[1])) |
       ( pick_s0 & ~(pick_quad_in[0] | pick_quad_in[1])) |
       ( pick_s1 & ~(pick_quad_in[1]))
       ) ;



 
assign  pick_oct_sel[3] = pick_quad_in[3] &  
       ( pick_s3 | 
       ( pick_s4 & ~( pick_quad_in[4] | pick_quad_in[5] |  pick_quad_in[6] | 
                                        pick_quad_in[7] | pick_quad_in[0] | pick_quad_in[1] | pick_quad_in[2])) |
       ( pick_s5 & ~(pick_quad_in[5] |  pick_quad_in[6] | 
                                        pick_quad_in[7] | pick_quad_in[0] | pick_quad_in[1] | pick_quad_in[2])) |
       ( pick_s6 & ~(pick_quad_in[6] |  pick_quad_in[7] | pick_quad_in[0] | pick_quad_in[1] | pick_quad_in[2])) |
       ( pick_s7 & ~(pick_quad_in[7] | pick_quad_in[0] | pick_quad_in[1] | pick_quad_in[2])) |
       ( pick_s0 & ~(pick_quad_in[0] | pick_quad_in[1] | pick_quad_in[2])) |
       ( pick_s1 & ~(pick_quad_in[1] | pick_quad_in[2])) |
       ( pick_s2 & ~(pick_quad_in[2]))
       ) ;

assign  pick_oct_sel[4] = pick_quad_in[4] &
	( pick_s4 |
	( pick_s5 & ~( pick_quad_in[5] | pick_quad_in[6] |  pick_quad_in[7] |       
	pick_quad_in[0] | pick_quad_in[1] | pick_quad_in[2] | pick_quad_in[3])) |
	( pick_s6 & ~( pick_quad_in[6] | pick_quad_in[7] | pick_quad_in[0] | pick_quad_in[1] | pick_quad_in[2] | 
			pick_quad_in[3])) |
	( pick_s7 & ~(pick_quad_in[7] | pick_quad_in[0] | pick_quad_in[1] | pick_quad_in[2] | pick_quad_in[3])) |
	( pick_s0 & ~(pick_quad_in[0] | pick_quad_in[1] | pick_quad_in[2] | pick_quad_in[3])) |
	( pick_s1 & ~(pick_quad_in[1] | pick_quad_in[2] | pick_quad_in[3])) |
	( pick_s2 & ~(pick_quad_in[2] | pick_quad_in[3])) |
	( pick_s3 & ~(pick_quad_in[3]))
       ) ;

assign  pick_oct_sel[5] = pick_quad_in[5] &
        ( pick_s5 |
        ( pick_s6 & ~(pick_quad_in[6] |  pick_quad_in[7] |
        pick_quad_in[0] | pick_quad_in[1] | pick_quad_in[2] | pick_quad_in[3] | pick_quad_in[4])) |
        ( pick_s7 & ~(pick_quad_in[7] | pick_quad_in[0] | pick_quad_in[1] | pick_quad_in[2] | 
                        pick_quad_in[3] | pick_quad_in[4])) |
        ( pick_s0 & ~(pick_quad_in[0] | pick_quad_in[1] | pick_quad_in[2] | pick_quad_in[3] | pick_quad_in[4])) |
        ( pick_s1 & ~(pick_quad_in[1] | pick_quad_in[2] | pick_quad_in[3] | pick_quad_in[4])) |
        ( pick_s2 & ~(pick_quad_in[2] | pick_quad_in[3] | pick_quad_in[4])) |
        ( pick_s3 & ~(pick_quad_in[3] | pick_quad_in[4])) |
        ( pick_s4 & ~(pick_quad_in[4]))
       ) ;


assign  pick_oct_sel[6] = pick_quad_in[6] &
        ( pick_s6 |
        ( pick_s7 & ~(pick_quad_in[7] | pick_quad_in[0] | pick_quad_in[1] | 
		      pick_quad_in[2] | pick_quad_in[3] | pick_quad_in[4] | pick_quad_in[5] )) |
        ( pick_s0 & ~(pick_quad_in[0] | pick_quad_in[1] | pick_quad_in[2] |       
                        pick_quad_in[3] | pick_quad_in[4] | pick_quad_in[5] )) |
        ( pick_s1 & ~(pick_quad_in[1] | pick_quad_in[2] | pick_quad_in[3] | pick_quad_in[4] | pick_quad_in[5])) |
        ( pick_s2 & ~(pick_quad_in[2] | pick_quad_in[3] | pick_quad_in[4] | pick_quad_in[5])) |
        ( pick_s3 & ~(pick_quad_in[3] | pick_quad_in[4] | pick_quad_in[5])) |
        ( pick_s4 & ~(pick_quad_in[4] | pick_quad_in[5])) |
        ( pick_s5 & ~(pick_quad_in[5]))
       ) ;


assign  pick_oct_sel[7] = pick_quad_in[7] &
        ( pick_s7 |
        ( pick_s0 & ~(pick_quad_in[0] | pick_quad_in[1] | 
                      pick_quad_in[2] | pick_quad_in[3] | pick_quad_in[4] | pick_quad_in[5] | pick_quad_in[6] )) |
        ( pick_s1 & ~(pick_quad_in[1] | pick_quad_in[2] |             
                      pick_quad_in[3] | pick_quad_in[4] | pick_quad_in[5] | pick_quad_in[6] )) |
        ( pick_s2 & ~(pick_quad_in[2] | pick_quad_in[3] | pick_quad_in[4] | pick_quad_in[5] | pick_quad_in[6])) |
        ( pick_s3 & ~(pick_quad_in[3] | pick_quad_in[4] | pick_quad_in[5] | pick_quad_in[6])) |
        ( pick_s4 & ~(pick_quad_in[4] | pick_quad_in[5] | pick_quad_in[6])) |
        ( pick_s5 & ~(pick_quad_in[5] | pick_quad_in[6])) |
        ( pick_s6 & ~(pick_quad_in[6]))
       ) ;



 
 
assign picker_out[3:0]	= pick_quad0_sel & {4{pick_oct_sel[0] & picker_out_qual }}  ; 
assign picker_out[7:4]	= pick_quad1_sel & {4{pick_oct_sel[1] & picker_out_qual }}  ; 
assign picker_out[11:8]	= pick_quad2_sel & {4{pick_oct_sel[2] & picker_out_qual }}  ; 
assign picker_out[15:12] = pick_quad3_sel & {4{pick_oct_sel[3]& picker_out_qual }}  ; 

// BS & SR 11/04/03, MB grows to 32

assign picker_out[19:16]  = pick_quad4_sel & {4{pick_oct_sel[4] & picker_out_qual }}  ;
assign picker_out[23:20]  = pick_quad5_sel & {4{pick_oct_sel[5] & picker_out_qual }}  ;
assign picker_out[27:24]  = pick_quad6_sel & {4{pick_oct_sel[6] & picker_out_qual }}  ;
assign picker_out[31:28]  = pick_quad7_sel & {4{pick_oct_sel[7] & picker_out_qual }}  ;

 
 
l2t_misbuf_ctl_msff_ctl_macro__width_32 ff_picker_out_d1  // BS & SR 11/04/03, MB grows to 32
                           (.din(picker_out[31:0]), .l1clk(l1clk), 
                  .scan_in(ff_picker_out_d1_scanin),
                  .scan_out(ff_picker_out_d1_scanout),
                  .dout(picker_out_d1[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_misbuf_ctl_msff_ctl_macro__width_32 ff_picker_out_d2  // BS & SR 11/04/03, MB grows to 32
                           (.din(picker_out_d1[31:0]), .l1clk(l1clk), 
                  .scan_in(ff_picker_out_d2_scanin),
                  .scan_out(ff_picker_out_d2_scanout),
                  .dout(picker_out_d2[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// Read wordlines for the tag and data arrays. 
// setup will depend on timing of picker_out_qual i.e. "mbsel_px"  
 
assign	misbuf_mb_read_wl[31:0] = l2t_mb2_run_r1 ? mbtag_write_ptr[31:0] : picker_out[31:0]; 
 
 
// fixscan start:
assign reset_flop_scanin         = spares_scanout                  ;
assign ff_l2t_mbist_r1_scanin    = reset_flop_scanout       ;
assign ff_loggingerr_scanin      = ff_l2t_mbist_r1_scanout  ;
assign ff_tag_hit_unqual_c3_scanin = ff_loggingerr_scanout    ;
assign ff_mbf_insert_c3_scanin   = ff_tag_hit_unqual_c3_scanout;
assign ff_mbf_insert_c3_1_scanin = ff_mbf_insert_c3_scanout ;
assign ff_inst_mb_c3_1_scanin    = ff_mbf_insert_c3_1_scanout;
assign ff_arb_vuad_ce_err_c3_scanin = ff_inst_mb_c3_1_scanout  ;
assign ff_mbf_delete_c3_scanin   = ff_arb_vuad_ce_err_c3_scanout;
assign ff_mbf_delete_c3_1_scanin = ff_mbf_delete_c3_scanout ;
assign ff_mbctl_nondep_fbhit_c3_scanin = ff_mbf_delete_c3_1_scanout;
assign ff_mb_count_c4_scanin     = ff_mbctl_nondep_fbhit_c3_scanout;
assign ff_rdma_inst_c2_scanin    = ff_mb_count_c4_scanout   ;
assign ff_rdma_inst_c3_scanin    = ff_rdma_inst_c2_scanout  ;
assign ff_mb_rdma_count_c4_scanin = ff_rdma_inst_c3_scanout  ;
assign ff_inst_mb_entry_c2_scanin = ff_mb_rdma_count_c4_scanout;
assign ff_mb_mbist_cam_match_scanin = ff_inst_mb_entry_c2_scanout;
assign ff_l2_dir_map_on_d1_scanin = ff_mb_mbist_cam_match_scanout;
assign ff_tmp_cam_hit_vec_c2_scanin = ff_l2_dir_map_on_d1_scanout;
assign ff_tmp_idx_hit_vec_c2_scanin = ff_tmp_cam_hit_vec_c2_scanout;
assign ff_misbuf_c1c2_match_c1_d1_scanin = ff_tmp_idx_hit_vec_c2_scanout;
assign ff_misbuf_c1c2_match_c1_d1_1_scanin = ff_misbuf_c1c2_match_c1_d1_scanout;
assign ff_mb_hit_off_c1_d1_scanin = ff_misbuf_c1c2_match_c1_d1_1_scanout;
assign ff_misbuf_hit_vec_c3_scanin = ff_mb_hit_off_c1_d1_scanout;
assign ff_idx_c1c2comp_c1_d1_scanin = ff_misbuf_hit_vec_c3_scanout;
assign ff_misbuf_idx_hit_vec_c3_scanin = ff_idx_c1c2comp_c1_d1_scanout;
assign ff_hit_count_c4_scanin    = ff_misbuf_idx_hit_vec_c3_scanout;
assign ff_mb_idx_count_full_c5_scanin = ff_hit_count_c4_scanout  ;
assign ff_inst_mb_c3_scanin      = ff_mb_idx_count_full_c5_scanout;
assign ff_inst_mb_c3_2_scanin    = ff_inst_mb_c3_scanout    ;
assign ff_mb_inst_vld_c3_scanin  = ff_inst_mb_c3_2_scanout  ;
assign ff_mb_inst_vld_c3_1_scanin = ff_mb_inst_vld_c3_scanout;
assign ff_mb_inst_vld_staging_scanin = ff_mb_inst_vld_c3_1_scanout;
assign ff_mb_inst_vld_c3_2_scanin = ff_mb_inst_vld_staging_scanout;
assign ff_mb_rewrite_en_c4_scanin = ff_mb_inst_vld_c3_2_scanout;
assign ff_mb_rewrite_en_c5_scanin = ff_mb_rewrite_en_c4_scanout;
assign ff_mb_rewrite_en_c52_scanin = ff_mb_rewrite_en_c5_scanout;
assign ff_mb_rewrite_en_c6_scanin = ff_mb_rewrite_en_c52_scanout;
assign ff_mb_rewrite_en_c7_scanin = ff_mb_rewrite_en_c6_scanout;
assign ff_mb_rewrite_en_c8_scanin = ff_mb_rewrite_en_c7_scanout;
assign ff_mbdata_wr_en_c4_scanin = ff_mb_rewrite_en_c8_scanout;
assign ff_mbdata_wr_en_c5_scanin = ff_mbdata_wr_en_c4_scanout;
assign ff_mbdata_wr_en_c52_scanin = ff_mbdata_wr_en_c5_scanout;
assign ff_mbdata_wr_en_c6_scanin = ff_mbdata_wr_en_c52_scanout;
assign ff_mbdata_wr_en_c7_scanin = ff_mbdata_wr_en_c6_scanout;
assign ff_mbdata_wr_en_c8_scanin = ff_mbdata_wr_en_c7_scanout;
assign ff_enc_tag_wr_wl_c3_scanin = ff_mbdata_wr_en_c8_scanout;
assign ff_enc_data_wr_wl_c4_scanin = ff_enc_tag_wr_wl_c3_scanout;
assign ff_enc_data_wr_wl_c5_scanin = ff_enc_data_wr_wl_c4_scanout;
assign ff_enc_data_wr_wl_c52_scanin = ff_enc_data_wr_wl_c5_scanout;
assign ff_enc_data_wr_wl_c6_scanin = ff_enc_data_wr_wl_c52_scanout;
assign ff_enc_data_wr_wl_c7_scanin = ff_enc_data_wr_wl_c6_scanout;
assign ff_enc_data_wr_wl_c8_scanin = ff_enc_data_wr_wl_c7_scanout;
assign ff_enc_data_wr_wl_c9_scanin = ff_enc_data_wr_wl_c8_scanout;
assign ff_mbf_dep_c3_scanin      = ff_enc_data_wr_wl_c9_scanout;
assign ff_dep_inst_c3_scanin     = ff_mbf_dep_c3_scanout    ;
assign ff_tecc_c3_scanin         = ff_dep_inst_c3_scanout   ;
assign ff_set_dep_c2_ldifetch_miss_c2_scanin = ff_tecc_c3_scanout       ;
assign ff_mbf_dep_c4_scanin      = ff_set_dep_c2_ldifetch_miss_c2_scanout;
assign ff_dep_bit_scanin         = ff_mbf_dep_c4_scanout    ;
assign ff_mbf_dep_c5_scanin      = ff_dep_bit_scanout       ;
assign ff_mbf_dep_c52_scanin     = ff_mbf_dep_c5_scanout    ;
assign ff_mbf_dep_c6_scanin      = ff_mbf_dep_c52_scanout   ;
assign ff_mbf_dep_c7_scanin      = ff_mbf_dep_c6_scanout    ;
assign ff_mbf_dep_c8_scanin      = ff_mbf_dep_c7_scanout    ;
assign ff_misbuf_mark_evict_tmp_c3_scanin = ff_mbf_dep_c8_scanout    ;
assign ff_evict_vld_unqual_c3_scanin = ff_misbuf_mark_evict_tmp_c3_scanout;
assign ff_decdp_wr64_inst_c3_scanin = ff_evict_vld_unqual_c3_scanout;
assign ff_decdp_ld64_inst_c3_scanin = ff_decdp_wr64_inst_c3_scanout;
assign ff_ld64_inst_c4_scanin    = ff_decdp_ld64_inst_c3_scanout;
assign ff_ld64_inst_c5_scanin    = ff_ld64_inst_c4_scanout  ;
assign ff_ld64_inst_c52_scanin   = ff_ld64_inst_c5_scanout  ;
assign ff_ld64_inst_c6_scanin    = ff_ld64_inst_c52_scanout ;
assign ff_ld64_inst_c7_scanin    = ff_ld64_inst_c6_scanout  ;
assign ff_mcu_rdy_c4_scanin      = ff_ld64_inst_c7_scanout  ;
assign ff_mcu_rdy_c5_scanin      = ff_mcu_rdy_c4_scanout    ;
assign ff_mcu_rdy_c52_scanin     = ff_mcu_rdy_c5_scanout    ;
assign ff_mcu_rdy_c6_scanin      = ff_mcu_rdy_c52_scanout   ;
assign ff_mcu_rdy_c7_scanin      = ff_mcu_rdy_c6_scanout    ;
assign ff_mcu_rdy_c8_scanin      = ff_mcu_rdy_c7_scanout    ;
assign ff_evict_par_err_c3_scanin = ff_mcu_rdy_c8_scanout    ;
assign ff_evict_par_err_c4_scanin = ff_evict_par_err_c3_scanout;
assign ff_evict_par_err_c5_scanin = ff_evict_par_err_c4_scanout;
assign ff_evict_par_err_c52_scanin = ff_evict_par_err_c5_scanout;
assign ff_evict_par_err_c6_scanin = ff_evict_par_err_c52_scanout;
assign ff_evict_par_err_c7_scanin = ff_evict_par_err_c6_scanout;
assign ff_misbuf_evict_c8_scanin = ff_evict_par_err_c7_scanout;
assign ff_buffer_miss_vld_c3_scanin = ff_misbuf_evict_c8_scanout;
assign ff_rdma_reg_vld_c3_scanin = ff_buffer_miss_vld_c3_scanout;
assign ff_rdma_comp_rdy_c4_scanin = ff_rdma_reg_vld_c3_scanout;
assign ff_rdma_comp_rdy_c5_scanin = ff_rdma_comp_rdy_c4_scanout;
assign ff_rdma_comp_rdy_c52_scanin = ff_rdma_comp_rdy_c5_scanout;
assign ff_rdma_comp_rdy_c6_scanin = ff_rdma_comp_rdy_c52_scanout;
assign ff_rdma_comp_rdy_c7_scanin = ff_rdma_comp_rdy_c6_scanout;
assign ff_rdma_comp_rdy_c8_scanin = ff_rdma_comp_rdy_c7_scanout;
assign ff_misbuf_tecc_c4_scanin  = ff_rdma_comp_rdy_c8_scanout;
assign ff_misbuf_tecc_c5_scanin  = ff_misbuf_tecc_c4_scanout;
assign ff_misbuf_tecc_c52_scanin = ff_misbuf_tecc_c5_scanout;
assign ff_misbuf_tecc_c6_scanin  = ff_misbuf_tecc_c52_scanout;
assign ff_misbuf_tecc_c7_scanin  = ff_misbuf_tecc_c6_scanout;
assign ff_misbuf_tecc_c8_scanin  = ff_misbuf_tecc_c7_scanout;
assign ff_mb_write_ptr_c3_scanin = ff_misbuf_tecc_c8_scanout;
assign ff_mb_entry_c3_scanin     = ff_mb_write_ptr_c3_scanout;
assign ff_mb_entry_c3_1_scanin   = ff_mb_entry_c3_scanout   ;
assign ff_valid_bit_scanin       = ff_mb_entry_c3_1_scanout ;
assign ff_rdma_bit_scanin        = ff_valid_bit_scanout     ;
assign ff_bis_bit_scanin         = ff_rdma_bit_scanout      ;
assign ff_arb_pf_ice_inst_c8_scanin = ff_bis_bit_scanout       ;
assign ff_arb_vuad_ce_err_slice_scanin = ff_arb_pf_ice_inst_c8_scanout;
assign ff_vuad_ce_replay_scanin  = ff_arb_vuad_ce_err_slice_scanout;
assign ff_mcu_ready_bit_scanin   = ff_vuad_ce_replay_scanout;
assign ff_young_bit_scanin       = ff_mcu_ready_bit_scanout ;
assign ff_next_link0_scanin      = ff_young_bit_scanout     ;
assign ff_next_link1_scanin      = ff_next_link0_scanout    ;
assign ff_next_link2_scanin      = ff_next_link1_scanout    ;
assign ff_next_link3_scanin      = ff_next_link2_scanout    ;
assign ff_next_link4_scanin      = ff_next_link3_scanout    ;
assign ff_next_link5_scanin      = ff_next_link4_scanout    ;
assign ff_next_link6_scanin      = ff_next_link5_scanout    ;
assign ff_next_link7_scanin      = ff_next_link6_scanout    ;
assign ff_next_link8_scanin      = ff_next_link7_scanout    ;
assign ff_next_link9_scanin      = ff_next_link8_scanout    ;
assign ff_next_link10_scanin     = ff_next_link9_scanout    ;
assign ff_next_link11_scanin     = ff_next_link10_scanout   ;
assign ff_next_link12_scanin     = ff_next_link11_scanout   ;
assign ff_next_link13_scanin     = ff_next_link12_scanout   ;
assign ff_next_link14_scanin     = ff_next_link13_scanout   ;
assign ff_next_link15_scanin     = ff_next_link14_scanout   ;
assign ff_next_link16_scanin     = ff_next_link15_scanout   ;
assign ff_next_link17_scanin     = ff_next_link16_scanout   ;
assign ff_next_link18_scanin     = ff_next_link17_scanout   ;
assign ff_next_link19_scanin     = ff_next_link18_scanout   ;
assign ff_next_link20_scanin     = ff_next_link19_scanout   ;
assign ff_next_link21_scanin     = ff_next_link20_scanout   ;
assign ff_next_link22_scanin     = ff_next_link21_scanout   ;
assign ff_next_link23_scanin     = ff_next_link22_scanout   ;
assign ff_next_link24_scanin     = ff_next_link23_scanout   ;
assign ff_next_link25_scanin     = ff_next_link24_scanout   ;
assign ff_next_link26_scanin     = ff_next_link25_scanout   ;
assign ff_next_link27_scanin     = ff_next_link26_scanout   ;
assign ff_next_link28_scanin     = ff_next_link27_scanout   ;
assign ff_next_link29_scanin     = ff_next_link28_scanout   ;
assign ff_next_link30_scanin     = ff_next_link29_scanout   ;
assign ff_next_link31_scanin     = ff_next_link30_scanout   ;
assign ff_inst_mb_c4_scanin      = ff_next_link31_scanout   ;
assign ff_inst_mb_c5_scanin      = ff_inst_mb_c4_scanout    ;
assign ff_inst_mb_c52_scanin     = ff_inst_mb_c5_scanout    ;
assign ff_inst_mb_c6_scanin      = ff_inst_mb_c52_scanout   ;
assign ff_inst_mb_c7_scanin      = ff_inst_mb_c6_scanout    ;
assign ff_inst_mb_c8_scanin      = ff_inst_mb_c7_scanout    ;
assign ff_inst_mb_c9_scanin      = ff_inst_mb_c8_scanout    ;
assign ff_enc_data_wr_wl_c7_1_scanin = ff_inst_mb_c9_scanout    ;
assign ff_cas1_hit_c9_scanin     = ff_enc_data_wr_wl_c7_1_scanout;
assign ff_uncorr_err_c9_scanin   = ff_cas1_hit_c9_scanout   ;
assign ff_notdata_err_c9_scanin  = ff_uncorr_err_c9_scanout ;
assign ff_corr_err_c9_scanin     = ff_notdata_err_c9_scanout;
assign ff_inst_bufidhi_c9_scanin = ff_corr_err_c9_scanout   ;
assign ff_ctrue_bit_scanin       = ff_inst_bufidhi_c9_scanout;
assign ff_mbf_insert_mbid_c4_scanin = ff_ctrue_bit_scanout     ;
assign ff_mbf_insert_c4_scanin   = ff_mbf_insert_mbid_c4_scanout;
assign ff_misbuf_hit_c3_scanin   = ff_mbf_insert_c4_scanout ;
assign ff_misbuf_arb_hit_c3_scanin = ff_misbuf_hit_c3_scanout ;
assign ff_misbuf_hit_c4_scanin   = ff_misbuf_arb_hit_c3_scanout;
assign ff_misbuf_filbuf_next_vld_c4_scanin = ff_misbuf_hit_c4_scanout ;
assign ff_mbf_delete_c4_scanin   = ff_misbuf_filbuf_next_vld_c4_scanout;
assign ff_misbuf_filbuf_next_link_c4_scanin = ff_mbf_delete_c4_scanout ;
assign ff_mb_data_vld_scanin     = ff_misbuf_filbuf_next_link_c4_scanout;
assign ff_gate_evict_set_staging_scanin = ff_mb_data_vld_scanout   ;
assign ff_mb_evict_ready_scanin  = ff_gate_evict_set_staging_scanout;
assign ff_mb_tecc_ready_scanin   = ff_mb_evict_ready_scanout;
assign ff_ready_miss_r2_scanin   = ff_mb_tecc_ready_scanout ;
assign ff_fbf_enc_ld_mbid_r1_scanin = ff_ready_miss_r2_scanout ;
assign ff_fbf_st_or_dep_rdy_c5_scanin = ff_fbf_enc_ld_mbid_r1_scanout;
assign ff_fbf_enc_dep_mbid_c5_scanin = ff_fbf_st_or_dep_rdy_c5_scanout;
assign ff_decdp_cas1_inst_c2_scanin = ff_fbf_enc_dep_mbid_c5_scanout;
assign ff_l2_bypass_mode_on_d1_scanin = ff_decdp_cas1_inst_c2_scanout;
assign ff_filbuf_match_c3_scanin = ff_l2_bypass_mode_on_d1_scanout;
assign ff_filbuf_stinst_match_c3_scanin = ff_filbuf_match_c3_scanout;
assign ff_misbuf_inval_inst_c3_scanin = ff_filbuf_stinst_match_c3_scanout;
assign ff_mb_dep_rdy_en_c4_scanin = ff_misbuf_inval_inst_c3_scanout;
assign ff_wbb_dep_rdy_en_d1_scanin = ff_mb_dep_rdy_en_c4_scanout;
assign ff_dep_mbid_d1_scanin     = ff_wbb_dep_rdy_en_d1_scanout;
assign ff_rdmatb_dep_rdy_en_d1_scanin = ff_dep_mbid_d1_scanout   ;
assign ff_dep_rdmat_mbid_d1_scanin = ff_rdmatb_dep_rdy_en_d1_scanout;
assign ff_set_mbid_vld_scanin    = ff_dep_rdmat_mbid_d1_scanout;
assign ff_mbid_vld_scanin        = ff_set_mbid_vld_scanout  ;
assign ff_mbid_scanin            = ff_mbid_vld_scanout      ;
assign ff_set_mbid_vld_pfice_prev_scanin = ff_mbid_scanout          ;
assign ff_pfice_mbid_vld_scanin  = ff_set_mbid_vld_pfice_prev_scanout;
assign ff_pfice_mbid_scanin      = ff_pfice_mbid_vld_scanout;
assign ff_vuad_ce_err_ready_scanin = ff_pfice_mbid_scanout    ;
assign ff_mb_l2_ready_scanin     = ff_vuad_ce_err_ready_scanout;
assign ff_l2_pick_d1_scanin      = ff_mb_l2_ready_scanout   ;
assign ff_l2_wait_scanin         = ff_l2_pick_d1_scanout    ;
assign ff_read_reg_ctrue_in_scanin = ff_l2_wait_scanout       ;
assign ff_mcu_l2t_rd_ack_d1_scanin = ff_read_reg_ctrue_in_scanout;
assign ff_misbuf_filbuf_mcu_pick_scanin = ff_mcu_l2t_rd_ack_d1_scanout;
assign ff_mcu_pick_scanin        = ff_misbuf_filbuf_mcu_pick_scanout;
assign ff_mcu_pick_2_scanin      = ff_mcu_pick_scanout      ;
assign ff_mcu_pick_d1_scanin     = ff_mcu_pick_2_scanout    ;
assign ff_mcu_pick_d2_scanin     = ff_mcu_pick_d1_scanout   ;
assign ff_dummy_req_d2_scanin    = ff_mcu_pick_d2_scanout   ;
assign ff_mcu_ack_pend_state_scanin = ff_dummy_req_d2_scanout  ;
assign ff_evict_vld_c4_scanin    = ff_mcu_ack_pend_state_scanout;
assign ff_way0_scanin            = ff_evict_vld_c4_scanout  ;
assign ff_way1_scanin            = ff_way0_scanout          ;
assign ff_way2_scanin            = ff_way1_scanout          ;
assign ff_way3_scanin            = ff_way2_scanout          ;
assign ff_way4_scanin            = ff_way3_scanout          ;
assign ff_way5_scanin            = ff_way4_scanout          ;
assign ff_way6_scanin            = ff_way5_scanout          ;
assign ff_way7_scanin            = ff_way6_scanout          ;
assign ff_way8_scanin            = ff_way7_scanout          ;
assign ff_way9_scanin            = ff_way8_scanout          ;
assign ff_way10_scanin           = ff_way9_scanout          ;
assign ff_way11_scanin           = ff_way10_scanout         ;
assign ff_way12_scanin           = ff_way11_scanout         ;
assign ff_way13_scanin           = ff_way12_scanout         ;
assign ff_way14_scanin           = ff_way13_scanout         ;
assign ff_way15_scanin           = ff_way14_scanout         ;
assign ff_way16_scanin           = ff_way15_scanout         ;
assign ff_way17_scanin           = ff_way16_scanout         ;
assign ff_way18_scanin           = ff_way17_scanout         ;
assign ff_way19_scanin           = ff_way18_scanout         ;
assign ff_way20_scanin           = ff_way19_scanout         ;
assign ff_way21_scanin           = ff_way20_scanout         ;
assign ff_way22_scanin           = ff_way21_scanout         ;
assign ff_way23_scanin           = ff_way22_scanout         ;
assign ff_way24_scanin           = ff_way23_scanout         ;
assign ff_way25_scanin           = ff_way24_scanout         ;
assign ff_way26_scanin           = ff_way25_scanout         ;
assign ff_way27_scanin           = ff_way26_scanout         ;
assign ff_way28_scanin           = ff_way27_scanout         ;
assign ff_way29_scanin           = ff_way28_scanout         ;
assign ff_way30_scanin           = ff_way29_scanout         ;
assign ff_way31_scanin           = ff_way30_scanout         ;
assign ff_arb_pf_ice_inst_c4_scanin = ff_way31_scanout         ;
assign ff_mb_way_vld_scanin      = ff_arb_pf_ice_inst_c4_scanout;
assign ff_fbid0_scanin           = ff_mb_way_vld_scanout    ;
assign ff_fbid1_scanin           = ff_fbid0_scanout         ;
assign ff_fbid2_scanin           = ff_fbid1_scanout         ;
assign ff_fbid3_scanin           = ff_fbid2_scanout         ;
assign ff_fbid4_scanin           = ff_fbid3_scanout         ;
assign ff_fbid5_scanin           = ff_fbid4_scanout         ;
assign ff_fbid6_scanin           = ff_fbid5_scanout         ;
assign ff_fbid7_scanin           = ff_fbid6_scanout         ;
assign ff_fbid8_scanin           = ff_fbid7_scanout         ;
assign ff_fbid9_scanin           = ff_fbid8_scanout         ;
assign ff_fbid10_scanin          = ff_fbid9_scanout         ;
assign ff_fbid11_scanin          = ff_fbid10_scanout        ;
assign ff_fbid12_scanin          = ff_fbid11_scanout        ;
assign ff_fbid13_scanin          = ff_fbid12_scanout        ;
assign ff_fbid14_scanin          = ff_fbid13_scanout        ;
assign ff_fbid15_scanin          = ff_fbid14_scanout        ;
assign ff_fbid16_scanin          = ff_fbid15_scanout        ;
assign ff_fbid17_scanin          = ff_fbid16_scanout        ;
assign ff_fbid18_scanin          = ff_fbid17_scanout        ;
assign ff_fbid19_scanin          = ff_fbid18_scanout        ;
assign ff_fbid20_scanin          = ff_fbid19_scanout        ;
assign ff_fbid21_scanin          = ff_fbid20_scanout        ;
assign ff_fbid22_scanin          = ff_fbid21_scanout        ;
assign ff_fbid23_scanin          = ff_fbid22_scanout        ;
assign ff_fbid24_scanin          = ff_fbid23_scanout        ;
assign ff_fbid25_scanin          = ff_fbid24_scanout        ;
assign ff_fbid26_scanin          = ff_fbid25_scanout        ;
assign ff_fbid27_scanin          = ff_fbid26_scanout        ;
assign ff_fbid28_scanin          = ff_fbid27_scanout        ;
assign ff_fbid29_scanin          = ff_fbid28_scanout        ;
assign ff_fbid30_scanin          = ff_fbid29_scanout        ;
assign ff_fbid31_scanin          = ff_fbid30_scanout        ;
assign ff_mb_fbid_vld_scanin     = ff_fbid31_scanout        ;
assign ff_misbuf_filbuf_way_fbid_vld_scanin = ff_mb_fbid_vld_scanout   ;
assign ff_fbsel_0to3_d1_scanin   = ff_misbuf_filbuf_way_fbid_vld_scanout;
assign ff_fbsel_4to7_d1_scanin   = ff_fbsel_0to3_d1_scanout ;
assign ff_fbsel_8tob_d1_scanin   = ff_fbsel_4to7_d1_scanout ;
assign ff_fbsel_15to12_d1_scanin = ff_fbsel_8tob_d1_scanout ;
assign ff_fbsel_a_0to3_d1_scanin = ff_fbsel_15to12_d1_scanout;
assign ff_fbsel_a_4to7_d1_scanin = ff_fbsel_a_0to3_d1_scanout;
assign ff_fbsel_a_8tob_d1_scanin = ff_fbsel_a_4to7_d1_scanout;
assign ff_fbsel_def_vld_d1_scanin = ff_fbsel_a_8tob_d1_scanout;
assign ff_misbuf_filbuf_way_0123_scanin = ff_fbsel_def_vld_d1_scanout;
assign ff_misbuf_filbuf_way_4567_scanin = ff_misbuf_filbuf_way_0123_scanout;
assign ff_misbuf_filbuf_way_89ab_scanin = ff_misbuf_filbuf_way_4567_scanout;
assign ff_misbuf_filbuf_way_cdef_scanin = ff_misbuf_filbuf_way_89ab_scanout;
assign ff_misbuf_filbuf_way_a0123_scanin = ff_misbuf_filbuf_way_cdef_scanout;
assign ff_misbuf_filbuf_way_a4567_scanin = ff_misbuf_filbuf_way_a0123_scanout;
assign ff_misbuf_filbuf_way_a89ab_scanin = ff_misbuf_filbuf_way_a4567_scanout;
assign ff_misbuf_filbuf_way_acdef_scanin = ff_misbuf_filbuf_way_a89ab_scanout;
assign ff_misbuf_filbuf_fbid_0123_scanin = ff_misbuf_filbuf_way_acdef_scanout;
assign ff_misbuf_filbuf_fbid_4567_scanin = ff_misbuf_filbuf_fbid_0123_scanout;
assign ff_misbuf_filbuf_fbid_89ab_scanin = ff_misbuf_filbuf_fbid_4567_scanout;
assign ff_misbuf_filbuf_fbid_cdef_scanin = ff_misbuf_filbuf_fbid_89ab_scanout;
assign ff_misbuf_filbuf_fbid_a0123_scanin = ff_misbuf_filbuf_fbid_cdef_scanout;
assign ff_misbuf_filbuf_fbid_a4567_scanin = ff_misbuf_filbuf_fbid_a0123_scanout;
assign ff_misbuf_filbuf_fbid_a89ab_scanin = ff_misbuf_filbuf_fbid_a4567_scanout;
assign ff_misbuf_filbuf_fbid_acdef_scanin = ff_misbuf_filbuf_fbid_a89ab_scanout;
assign ff_wr8_piped_scanin       = ff_misbuf_filbuf_fbid_acdef_scanout;
assign ff_mb_corr_err_scanin     = ff_wr8_piped_scanout     ;
assign ff_mb_uncorr_err_scanin   = ff_mb_corr_err_scanout   ;
assign ff_mb_nderr_in_scanin     = ff_mb_uncorr_err_scanout ;
assign ff_misbuf_corr_err_c2_scanin = ff_mb_nderr_in_scanout   ;
assign ff_misbuf_uncorr_err_c2_scanin = ff_misbuf_corr_err_c2_scanout;
assign ff_misbuf_nderr_unqual_c2_scanin = ff_misbuf_uncorr_err_c2_scanout;
assign ff_mb_l2_ready_qual_scanin = ff_misbuf_nderr_unqual_c2_scanout;
assign ff_mcu_pick_1_scanin      = ff_mb_l2_ready_qual_scanout;
assign ff_mcu_pick_2_l_scanin    = ff_mcu_pick_1_scanout    ;
assign ff_mcu_state_scanin       = ff_mcu_pick_2_l_scanout  ;
assign ff_mcu_state_quad0_scanin = ff_mcu_state_scanout     ;
assign ff_mcu_state_quad1_scanin = ff_mcu_state_quad0_scanout;
assign ff_mcu_state_quad2_scanin = ff_mcu_state_quad1_scanout;
assign ff_mcu_state_quad3_scanin = ff_mcu_state_quad2_scanout;
assign ff_mcu_state_quad4_scanin = ff_mcu_state_quad3_scanout;
assign ff_mcu_state_quad5_scanin = ff_mcu_state_quad4_scanout;
assign ff_mcu_state_quad6_scanin = ff_mcu_state_quad5_scanout;
assign ff_mcu_state_quad7_scanin = ff_mcu_state_quad6_scanout;
assign ff_l2_state_scanin        = ff_mcu_state_quad7_scanout;
assign ff_l2_state_quad0_scanin  = ff_l2_state_scanout      ;
assign ff_l2_state_quad1_scanin  = ff_l2_state_quad0_scanout;
assign ff_l2_state_quad2_scanin  = ff_l2_state_quad1_scanout;
assign ff_l2_state_quad3_scanin  = ff_l2_state_quad2_scanout;
assign ff_l2_state_quad4_scanin  = ff_l2_state_quad3_scanout;
assign ff_l2_state_quad5_scanin  = ff_l2_state_quad4_scanout;
assign ff_l2_state_quad6_scanin  = ff_l2_state_quad5_scanout;
assign ff_l2_state_quad7_scanin  = ff_l2_state_quad6_scanout;
assign ff_picker_out_d1_scanin   = ff_l2_state_quad7_scanout;
assign ff_picker_out_d2_scanin   = ff_picker_out_d1_scanout ;
assign scan_out                  = ff_picker_out_d2_scanout ;
// fixscan end:
endmodule 











module adder_1b(/*AUTOARG*/ 
   // Outputs 
   cout, sum,  
   // Inputs 
   oper1, oper2, cin 
   ); 
input   oper1; 
input   oper2; 
input   cin; 
output  cout; 
output  sum; 
 
assign  sum = oper1 ^ oper2 ^ cin ; 
assign  cout =  ( cin & ( oper1 | oper2 ) ) | 
                ( oper1 & oper2 ) ; 
endmodule
 
module adder_2b(/*AUTOARG*/ 
   // Outputs 
   sum, cout,  
   // Inputs 
   oper1, oper2, cin 
   ); 
 
input   [1:0]	oper1; 
input   [1:0]	oper2; 
input   cin; 
output  [1:0]	sum; 
output  cout; 
 
wire    [1:0]   gen, prop; 
wire    [2:0]   carry ; 
 
assign  carry[0] = cin; 
 
assign  gen[0] = oper1[0] & oper2[0] ; 
assign  prop[0] = oper1[0] | oper2[0] ; 
assign  sum[0] = oper1[0] ^ oper2[0] ^ carry[0] ; 
 
 
assign  carry[1] = ( carry[0]  & prop[0] ) | gen[0] ; 
 
assign  gen[1] = oper1[1] & oper2[1] ; 
assign  prop[1] = oper1[1] | oper2[1] ; 
assign  sum[1] = oper1[1] ^ oper2[1] ^ carry[1] ; 
 
assign  carry[2] = ( carry[0] & prop[0]  & prop[1] ) | 
                ( gen[0]  &  prop[1] ) | 
                 gen[1] ; 
 
assign  cout = carry[2] ; 
endmodule 
 
 
module adder_3b(/*AUTOARG*/ 
   // Outputs 
   sum, cout,  
   // Inputs 
   oper1, oper2, cin 
   ); 
 
input   [2:0]	oper1; 
input   [2:0]	oper2; 
input   cin; 
output  [2:0]	sum; 
output	cout; 
 
wire    [2:0]   gen, prop; 
wire    [3:0]   carry ; 
 
assign  carry[0] = cin; 
 
assign  gen[0] = oper1[0] & oper2[0] ; 
assign  prop[0] = oper1[0] | oper2[0] ; 
assign  sum[0] = oper1[0] ^ oper2[0] ^ carry[0] ; 
 
 
assign  carry[1] = ( carry[0]  & prop[0] ) | gen[0] ; 
 
assign  gen[1] = oper1[1] & oper2[1] ; 
assign  prop[1] = oper1[1] | oper2[1] ; 
assign  sum[1] = oper1[1] ^ oper2[1] ^ carry[1] ; 
 
assign  carry[2] = ( carry[0]  & prop[0] & prop[1] ) | 
                ( gen[0]  & prop[1] ) | gen[1]   ; 
 
assign  gen[2] = oper1[2] & oper2[2] ; 
assign  prop[2] = oper1[2] | oper2[2] ; 
assign  sum[2] = oper1[2] ^ oper2[2] ^ carry[2] ; 
 
assign  carry[3] = ( carry[0]  & prop[0] & prop[1] & prop[2] ) | 
                        ( gen[0]  & prop[1] & prop[2] ) | 
                        ( gen[1]  & prop[2] ) | gen[2]   ; 
 
 
assign  cout = carry[3]; 
endmodule
 
module adder_4b(/*AUTOARG*/ 
   // Outputs 
   sum, cout,  
   // Inputs 
   oper1, oper2, cin 
   ); 
 
input   [3:0]	oper1; 
input   [3:0]	oper2; 
input   cin; 
output  [3:0]	sum; 
output	cout; 
 
wire    [3:0]   gen, prop; 
wire    [4:0]   carry ; 
 
assign  carry[0] = cin; 
 
assign  gen[0] = oper1[0] & oper2[0] ; 
assign  prop[0] = oper1[0] | oper2[0] ; 
assign  sum[0] = oper1[0] ^ oper2[0] ^ carry[0] ; 
 
 
assign  carry[1] = ( carry[0]  & prop[0] ) | gen[0] ; 
 
assign  gen[1] = oper1[1] & oper2[1] ; 
assign  prop[1] = oper1[1] | oper2[1] ; 
assign  sum[1] = oper1[1] ^ oper2[1] ^ carry[1] ; 
 
assign  carry[2] = ( carry[0]  & prop[0] & prop[1] ) | 
                ( gen[0]  & prop[1] ) | gen[1]   ; 
 
assign  gen[2] = oper1[2] & oper2[2] ; 
assign  prop[2] = oper1[2] | oper2[2] ; 
assign  sum[2] = oper1[2] ^ oper2[2] ^ carry[2] ; 
 
assign  carry[3] = ( carry[0]  & prop[0] & prop[1] & prop[2] ) | 
                        ( gen[0]  & prop[1] & prop[2] ) | 
                        ( gen[1]  & prop[2] ) | gen[2]   ; 
 
assign  gen[3] = oper1[3] & oper2[3] ; 
assign  prop[3] = oper1[3] | oper2[3] ; 
assign  sum[3] = oper1[3] ^ oper2[3] ^ carry[3] ; 
 
assign  carry[4] = ( carry[0]  & prop[0] & prop[1] & prop[2]  & prop[3] ) | 
                        ( gen[0]  & prop[1] & prop[2] & prop[3] ) | 
                        ( gen[1]  & prop[2] & prop[3] ) |  
			( gen[2] & prop[3] ) | 
			( gen[3] );    
 
 
 
assign  cout = carry[4]; 
endmodule
 
 
module adder_5b(/*AUTOARG*/ 
   // Outputs 
   sum, cout,  
   // Inputs 
   oper1, oper2, cin 
   ); 
 
input   [4:0]	oper1; 
input   [4:0]	oper2; 
input   cin; 
output  [4:0]	sum; 
output	cout; 
 
wire    [4:0]   gen, prop; 
wire    [5:0]   carry ; 
 
assign  carry[0] = cin; 
 
assign  gen[0] = oper1[0] & oper2[0] ; 
assign  prop[0] = oper1[0] | oper2[0] ; 
assign  sum[0] = oper1[0] ^ oper2[0] ^ carry[0] ; 
 
 
assign  carry[1] = ( carry[0]  & prop[0] ) | gen[0] ; 
 
assign  gen[1] = oper1[1] & oper2[1] ; 
assign  prop[1] = oper1[1] | oper2[1] ; 
assign  sum[1] = oper1[1] ^ oper2[1] ^ carry[1] ; 
 
assign  carry[2] = ( carry[0]  & prop[0] & prop[1] ) | 
                ( gen[0]  & prop[1] ) | gen[1]   ; 
 
assign  gen[2] = oper1[2] & oper2[2] ; 
assign  prop[2] = oper1[2] | oper2[2] ; 
assign  sum[2] = oper1[2] ^ oper2[2] ^ carry[2] ; 
 
assign  carry[3] = ( carry[0]  & prop[0] & prop[1] & prop[2] ) | 
                        ( gen[0]  & prop[1] & prop[2] ) | 
                        ( gen[1]  & prop[2] ) | gen[2]   ; 
 
assign  gen[3] = oper1[3] & oper2[3] ; 
assign  prop[3] = oper1[3] | oper2[3] ; 
assign  sum[3] = oper1[3] ^ oper2[3] ^ carry[3] ; 
 
assign  carry[4] = ( carry[0]  & prop[0] & prop[1] & prop[2]  & prop[3] ) | 
                        ( gen[0]  & prop[1] & prop[2] & prop[3] ) | 
                        ( gen[1]  & prop[2] & prop[3] ) |  
			( gen[2] & prop[3] ) | 
			( gen[3] );    

assign  gen[4] = oper1[4] & oper2[4];
assign  prop[4] = oper1[4] | oper2[4];
assign  sum[4] = oper1[4] ^ oper2[4] ^ carry[4];

assign  carry[5] = ( carry[0]  & prop[0] & prop[1] & prop[2]  & prop[3] & prop[4] ) |
                        ( gen[0]  & prop[1] & prop[2] & prop[3] & prop[4] ) |
                        ( gen[1]  & prop[2] & prop[3] & prop[4] ) |
                        ( gen[2] & prop[3] & prop[4] ) |
                        ( gen[3] & prop[4] ) |
                        ( gen[4] ); 
 
 
assign  cout = carry[5]; 
endmodule
 






// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_l1clkhdr_ctl_macro (
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

module l2t_misbuf_ctl_msff_ctl_macro__width_1 (
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

module l2t_misbuf_ctl_msff_ctl_macro__width_20 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [19:0] fdin;
wire [18:0] so;

  input [19:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [19:0] dout;
  output scan_out;
assign fdin[19:0] = din[19:0];






dff #(20)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[19:0]),
.si({scan_in,so[18:0]}),
.so({so[18:0],scan_out}),
.q(dout[19:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_msff_ctl_macro__width_7 (
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













// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_msff_ctl_macro__dmsff_32x__width_2 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_6 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [5:0] din0;
  input sel0;
  input [5:0] din1;
  input sel1;
  output [5:0] dout;





assign dout[5:0] = ( {6{sel0}} & din0[5:0] ) |
                       ( {6{sel1}} & din1[5:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_msff_ctl_macro__clr_1__en_1__width_6 (
  din, 
  en, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input en;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = (din[5:0] & {6{en}} & ~{6{clr}}) | (dout[5:0] & ~{6{en}} & ~{6{clr}});






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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 (
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

module l2t_misbuf_ctl_msff_ctl_macro__clr_1__en_1__width_4 (
  din, 
  en, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input en;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = (din[3:0] & {4{en}} & ~{4{clr}}) | (dout[3:0] & ~{4{en}} & ~{4{clr}});






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_msff_ctl_macro__width_5 (
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













// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_msff_ctl_macro__width_33 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [32:0] fdin;
wire [31:0] so;

  input [32:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [32:0] dout;
  output scan_out;
assign fdin[32:0] = din[32:0];






dff #(33)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[32:0]),
.si({scan_in,so[31:0]}),
.so({so[31:0],scan_out}),
.q(dout[32:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_msff_ctl_macro__width_32 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = din[31:0];






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_msff_ctl_macro__dmsff_32x__width_3 (
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

module l2t_misbuf_ctl_msff_ctl_macro__width_6 (
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

module l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_1 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_5 (
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






// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_msff_ctl_macro__width_3 (
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

module l2t_misbuf_ctl_msff_ctl_macro__clr_1__width_32 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = din[31:0] & ~{32{clr}};






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_msff_ctl_macro__width_2 (
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

module l2t_misbuf_ctl_msff_ctl_macro__width_65 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [64:0] fdin;
wire [63:0] so;

  input [64:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [64:0] dout;
  output scan_out;
assign fdin[64:0] = din[64:0];






dff #(65)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[64:0]),
.si({scan_in,so[63:0]}),
.so({so[63:0],scan_out}),
.q(dout[64:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_msff_ctl_macro__en_1__width_5 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = (din[4:0] & {5{en}}) | (dout[4:0] & ~{5{en}});






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

module l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_5 (
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


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 (
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






// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_msff_ctl_macro__width_30 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [29:0] fdin;
wire [28:0] so;

  input [29:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [29:0] dout;
  output scan_out;
assign fdin[29:0] = din[29:0];






dff #(30)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[29:0]),
.si({scan_in,so[28:0]}),
.so({so[28:0],scan_out}),
.q(dout[29:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_msff_ctl_macro__en_1__width_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});






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

module l2t_misbuf_ctl_msff_ctl_macro__en_1__width_4 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = (din[3:0] & {4{en}}) | (dout[3:0] & ~{4{en}});






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_msff_ctl_macro__en_1__width_3 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = (din[2:0] & {3{en}}) | (dout[2:0] & ~{3{en}});






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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_4 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
  input [3:0] din0;
  input sel0;
  input [3:0] din1;
  input sel1;
  input [3:0] din2;
  input sel2;
  input [3:0] din3;
  input sel3;
  output [3:0] dout;





assign dout[3:0] = ( {4{sel0}} & din0[3:0] ) |
                       ( {4{sel1}} & din1[3:0]) |
                       ( {4{sel2}} & din2[3:0]) |
                       ( {4{sel3}} & din3[3:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_3 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
  input [2:0] din0;
  input sel0;
  input [2:0] din1;
  input sel1;
  input [2:0] din2;
  input sel2;
  input [2:0] din3;
  input sel3;
  output [2:0] dout;





assign dout[2:0] = ( {3{sel0}} & din0[2:0] ) |
                       ( {3{sel1}} & din1[2:0]) |
                       ( {3{sel2}} & din2[2:0]) |
                       ( {3{sel3}} & din3[2:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_3 (
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






// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_msff_ctl_macro__width_11 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_32 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [31:0] din0;
  input sel0;
  input [31:0] din1;
  input sel1;
  output [31:0] dout;





assign dout[31:0] = ( {32{sel0}} & din0[31:0] ) |
                       ( {32{sel1}} & din1[31:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_8 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [7:0] din0;
  input sel0;
  input [7:0] din1;
  input sel1;
  input [7:0] din2;
  input sel2;
  output [7:0] dout;





assign dout[7:0] = ( {8{sel0}} & din0[7:0] ) |
                       ( {8{sel1}} & din1[7:0]) |
                       ( {8{sel2}} & din2[7:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_msff_ctl_macro__width_8 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [3:0] din0;
  input sel0;
  input [3:0] din1;
  input sel1;
  input [3:0] din2;
  input sel2;
  output [3:0] dout;





assign dout[3:0] = ( {4{sel0}} & din0[3:0] ) |
                       ( {4{sel1}} & din1[3:0]) |
                       ( {4{sel2}} & din2[3:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_misbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_8 (
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

