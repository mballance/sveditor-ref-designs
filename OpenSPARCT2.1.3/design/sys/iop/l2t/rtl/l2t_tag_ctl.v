// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_tag_ctl.v
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


 
 
module l2t_tag_ctl (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tag_dir_l2way_sel_c4, 
  tag_hit_way_vld_c3, 
  tag_st_to_data_array_c3, 
  tag_hit_l2orfb_c3, 
  sel_diag_store_data_c7, 
  tag_data_array_wr_active_c1, 
  tag_miss_unqual_c2, 
  tag_hit_unqual_c2, 
  tag_hit_unqual_c3, 
  tag_hit_c3, 
  tag_lru_way_c4, 
  misbuf_uncorr_err_c1, 
  misbuf_notdata_err_c1, 
  tag_rdma_vld_px0_p, 
  tag_hit_not_comp_c3, 
  tag_alt_tag_miss_unqual_c3, 
  tag_misbuf_rdma_reg_vld_c2, 
  tag_misbuf_int_ack_c3, 
  l2t_l2b_fbwr_wen_r2, 
  l2t_l2b_fbd_stdatasel_c3, 
  tagctl_l2drpt_mux4_way_sel_c1, 
  dec_col_offset_prev_c1, 
  tag_l2d_rd_wr_c2, 
  tag_l2d_word_en_c2, 
  decdp_cas2_from_mb_ctrue_c1, 
  tag_deccck_addr3_c7, 
  tag_decc_tag_acc_en_px2, 
  tag_data_ecc_active_c3, 
  tag_deccck_data_sel_c8, 
  tag_scrub_rd_vld_c7, 
  tag_spc_rd_vld_c6, 
  tag_bsc_rd_vld_c7, 
  tag_scrub_addr_way, 
  tag_imiss_hit_c5, 
  tag_ld_hit_c5, 
  tag_strst_ack_c5, 
  tag_st_ack_c5, 
  tag_inval_req_c5, 
  tag_st_req_c5, 
  tag_nonmem_comp_c6, 
  tag_uerr_ack_c5, 
  tag_cerr_ack_c5, 
  tag_int_ack_c5, 
  tag_fwd_req_ret_c5, 
  tag_sel_rdma_inval_vec_c5, 
  tag_rdma_wr_comp_c4, 
  tag_rmo_st_ack_c5, 
  tag_inst_mb_c5, 
  tag_hit_c5, 
  tag_store_inst_c5, 
  tag_fwd_req_ld_c6, 
  tag_rdma_gate_off_c2, 
  tag_rd64_complete_c11, 
  tag_uerr_ack_tmp_c4, 
  tag_cerr_ack_tmp_c4, 
  tag_spc_rd_cond_c3, 
  arb_vuad_ce_err_c3, 
  tag_rdma_vld_px1, 
  tag_rdma_ev_en_c4, 
  tag_inc_rdma_cnt_c4, 
  tag_set_rdma_reg_vld_c4, 
  tag_siu_req_en_c52, 
  tag_store_inst_c3, 
  scan_out, 
  misbuf_hit_st_dep_zero, 
  tag_way_sel_c2, 
  vlddir_vuad_valid_c2, 
  tagdp_lru_way_sel_c3, 
  misbuf_vuad_ce_instr_ack_c2, 
  tagdp_tag_par_err_c3, 
  bist_data_enc_way_sel_c1, 
  bist_data_enable_c1, 
  bist_data_wr_enable_c1, 
  bist_data_waddr_c1, 
  mbist_run, 
  arbadr_arbdp_addr5to4_c1, 
  arbadr_arbdp_addr3to2_c1, 
  arbadr_arbaddr_addr22_c2, 
  arbadr_arbdp_diag_wr_way_c2, 
  arbdec_arbdp_inst_way_c3, 
  arb_decdp_tag_wr_c1, 
  arb_decdp_cas2_from_mb_c2, 
  arb_decdp_strst_inst_c2, 
  arb_arbdp_dword_st_c1, 
  arb_decdp_rmo_st_c3, 
  arbdec_arbdp_rdma_inst_c1, 
  arb_decdp_ld64_inst_c1, 
  arb_decdp_wr64_inst_c2, 
  arb_decdp_wr8_inst_c2, 
  arb_tag_pst_with_ctrue_c1, 
  csr_l2_bypass_mode_on, 
  arb_bist_or_diag_acc_c1, 
  arb_fill_vld_c2, 
  arb_imiss_vld_c2, 
  arb_evict_vld_c2, 
  arb_tag_inst_vld_c2, 
  arb_waysel_gate_c2, 
  arb_data_diag_st_c2, 
  arb_csr_wr_en_c3, 
  arb_csr_rd_en_c3, 
  arb_diag_complete_c3, 
  deccck_scrd_uncorr_err_c8, 
  misbuf_tag_hit_unqual_c2, 
  misbuf_uncorr_err_c2, 
  misbuf_corr_err_c2, 
  misbuf_notdata_err_c2, 
  misbuf_wr64_miss_comp_c3, 
  misbuf_arb_hit_c3, 
  filbuf_match_c3, 
  arb_decdp_swap_inst_c2, 
  arb_arbdp_tag_pst_no_ctrue_c2, 
  arb_decdp_cas1_inst_c2, 
  arb_decdp_ld_inst_c2, 
  arbdec_arbdp_inst_mb_c2, 
  arbdec_arbdp_inst_dep_c2, 
  arb_decdp_st_inst_c2, 
  arb_decdp_st_with_ctrue_c2, 
  arb_decdp_inst_int_c2, 
  arb_decdp_fwd_req_c2, 
  arb_inst_diag_c1, 
  arb_inval_inst_c2, 
  arb_waysel_inst_vld_c2, 
  arb_inst_vld_c2_prev, 
  arb_upper_four_byte_access_c1, 
  arb_lower_four_byte_access_c1, 
  arb_rdwr_inst_vld_c2, 
  arb_wr8_inst_no_ctrue_c1, 
  filbuf_tag_hit_c2, 
  filbuf_tag_hit_frm_mb_c2, 
  filbuf_tag_evict_way_c3, 
  filbuf_mcu_l2t_chunk_id_r1, 
  filbuf_mcu_l2t_data_vld_r1, 
  filbuf_dis_cerr_c3, 
  filbuf_dis_uerr_c3, 
  filbuf_dis_nderr_c3, 
  oqu_st_complete_c7, 
  arbdec_arbdp_tecc_c1, 
  wmr_l, 
  l2clk, 
  scan_in, 
  csr_error_nceen, 
  csr_error_ceen, 
  tagdp_misbuf_par_err_c3, 
  tag_misbuf_par_err_c3, 
  mbist_arb_l2d_en);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire spares_scanin;
wire spares_scanout;
wire reset_flop_scanin;
wire reset_flop_scanout;
wire ff_mbist_run_scanin;
wire ff_mbist_run_scanout;
wire mbist_run_r1_n;
wire ff_mbist_arb_l2d_en_d1_scanin;
wire ff_mbist_arb_l2d_en_d1_scanout;
wire mbist_arb_l2d_en_d1;
wire csr_l2_bypass_mode_on_qual;
wire ff_l2_bypass_mode_on_scanin;
wire ff_l2_bypass_mode_on_scanout;
wire l2_bypass_mode_on_d1;
wire arb_fill_vld_c2_in;
wire ff_fill_vld_c3_scanin;
wire ff_fill_vld_c3_scanout;
wire arb_decdp_ld64_inst_c1_qual;
wire ff_ld64_inst_c2_scanin;
wire ff_ld64_inst_c2_scanout;
wire ff_temp_way_sel_c2_scanin;
wire ff_temp_way_sel_c2_scanout;
wire arb_evict_vld_c2_qual;
wire ff_evict_unqual_vld_c3_scanin;
wire ff_evict_unqual_vld_c3_scanout;
wire ff_wr8_no_ctrue_c2_scanin;
wire ff_wr8_no_ctrue_c2_scanout;
wire wr8_inst_no_ctrue_c2_cloned;
wire tag_rdma_gate_off_c2_internal;
wire rdma_reg_vld_cloned;
wire rdma_inst_c2_cloned;
wire ff_tag_hit_way_vld_c3_scanin;
wire ff_tag_hit_way_vld_c3_scanout;
wire [15:0] tag_l2d_way_sel_c2;
wire ff_tag_l2d_way_sel_c3_scanin;
wire ff_tag_l2d_way_sel_c3_scanout;
wire ff_way_sel_unqual_c3_scanin;
wire ff_way_sel_unqual_c3_scanout;
wire misbuf_hit_st_dep_zero_qual;
wire filbuf_tag_hit_c3_tmp;
wire filbuf_tag_hit_c3;
wire imiss_vld_c4;
wire ff_filbuf_tag_evict_way_c4_scanin;
wire ff_filbuf_tag_evict_way_c4_scanout;
wire ff_filbuf_tag_hit_c3_scanin;
wire ff_filbuf_tag_hit_c3_scanout;
wire evict_sel_c3;
wire hit_sel_c3;
wire [3:0] tag_dir_l2way_sel_c3;
wire ff_tag_dir_l2way_sel_c4_scanin;
wire ff_tag_dir_l2way_sel_c4_scanout;
wire ff_alt_tag_miss_unqual_c3_scanin;
wire ff_alt_tag_miss_unqual_c3_scanout;
wire ff_tag_hit_c3_scanin;
wire ff_tag_hit_c3_scanout;
wire ff_tag_hit_l2orfb_c3_scanin;
wire ff_tag_hit_l2orfb_c3_scanout;
wire ff_tag_hit_not_comp_c3_scanin;
wire ff_tag_hit_not_comp_c3_scanout;
wire ff_encoded_lru_c4_scanin;
wire ff_encoded_lru_c4_scanout;
wire ff_addr5to4_c2_scanin;
wire ff_addr5to4_c2_scanout;
wire ff_dec_col_offset_prev_c2_scanin;
wire ff_dec_col_offset_prev_c2_scanout;
wire col_offset_sel_c1;
wire ff_col_offset_sel_c2_scanin;
wire ff_col_offset_sel_c2_scanout;
wire col_offset_sel_c2_fnl;
wire col_offset_sel_c2_fnl_n;
wire [3:0] tag_l2d_col_offset_c2;
wire ff_imiss_tag_hit_c4_scanin;
wire ff_imiss_tag_hit_c4_scanout;
wire ff_rdma_inst_c2_scanin;
wire ff_rdma_inst_c2_scanout;
wire ff_rdma_inst_c3_scanin;
wire ff_rdma_inst_c3_scanout;
wire ff_st_to_data_array_c3_scanin;
wire ff_st_to_data_array_c3_scanout;
wire ff_tag_spc_rd_vld_c4_scanin;
wire ff_tag_spc_rd_vld_c4_scanout;
wire ff_tag_spc_rd_vld_c5_scanin;
wire ff_tag_spc_rd_vld_c5_scanout;
wire ff_tag_spc_rd_vld_c52_scanin;
wire ff_tag_spc_rd_vld_c52_scanout;
wire ff_tag_spc_rd_vld_c6_scanin;
wire ff_tag_spc_rd_vld_c6_scanout;
wire ff_tag_spc_rd_vld_c7_scanin;
wire ff_tag_spc_rd_vld_c7_scanout;
wire tag_spc_rd_vld_c7;
wire ff_tag_bsc_rd_vld_c4_scanin;
wire ff_tag_bsc_rd_vld_c4_scanout;
wire ff_tag_bsc_rd_vld_c5_scanin;
wire ff_tag_bsc_rd_vld_c5_scanout;
wire ff_tag_bsc_rd_vld_c52_scanin;
wire ff_tag_bsc_rd_vld_c52_scanout;
wire ff_tag_bsc_rd_vld_c6_scanin;
wire ff_tag_bsc_rd_vld_c6_scanout;
wire ff_tag_bsc_rd_vld_c7_scanin;
wire ff_tag_bsc_rd_vld_c7_scanout;
wire ff_prev_rd_wr_c2_scanin;
wire ff_prev_rd_wr_c2_scanout;
wire ff_pst_with_ctrue_c2_scanin;
wire ff_pst_with_ctrue_c2_scanout;
wire misbuffer_errors_c1;
wire other_term_c2_prev;
wire ff_mb_errs_c2_scanin;
wire ff_mb_errs_c2_scanout;
wire other_term_c2;
wire arb_inst_diag_c2;
wire ff_prev_rd_wr_c2_1_scanin;
wire ff_prev_rd_wr_c2_1_scanout;
wire ff_tag_st_to_data_array_c3_scanin;
wire ff_tag_st_to_data_array_c3_scanout;
wire ff_prev_wen_c1_scanin;
wire ff_prev_wen_c1_scanout;
wire ff_sel_prev_wen_c2_scanin;
wire ff_sel_prev_wen_c2_scanout;
wire [15:0] word_en_c1;
wire ff_dec_word_addr_c2_scanin;
wire ff_dec_word_addr_c2_scanout;
wire [15:0] tag_l2d_word_en_c1;
wire ff_dec_word_enable_c2_scanin;
wire ff_dec_word_enable_c2_scanout;
wire ff_tecc_c2_scanin;
wire ff_tecc_c2_scanout;
wire ff_scrub_fsm_cnt_scanin;
wire ff_scrub_fsm_cnt_scanout;
wire ff_scrub_addr_cnt_scanin;
wire ff_scrub_addr_cnt_scanout;
wire ff_decc_tag_acc_en_px2_scanin;
wire ff_decc_tag_acc_en_px2_scanout;
wire ff_scrub_way_vld_c3_scanin;
wire ff_scrub_way_vld_c3_scanout;
wire ff_scrub_way_vld_c4_scanin;
wire ff_scrub_way_vld_c4_scanout;
wire ff_scrub_way_vld_c5_scanin;
wire ff_scrub_way_vld_c5_scanout;
wire ff_scrub_way_vld_c52_scanin;
wire ff_scrub_way_vld_c52_scanout;
wire ff_scrub_way_vld_c6_scanin;
wire ff_scrub_way_vld_c6_scanout;
wire ff_scrub_way_vld_c7_scanin;
wire ff_scrub_way_vld_c7_scanout;
wire ff_scrub_rd_vld_c8_scanin;
wire ff_scrub_rd_vld_c8_scanout;
wire ff_scrub_wr_disable_c9_scanin;
wire ff_scrub_wr_disable_c9_scanout;
wire ff_l2b_fbwr_wen_r2_scanin;
wire ff_l2b_fbwr_wen_r2_scanout;
wire ff_tag_l2b_fbd_stdatasel_c3_scanin;
wire ff_tag_l2b_fbd_stdatasel_c3_scanout;
wire ff_imiss_vld_c3_scanin;
wire ff_imiss_vld_c3_scanout;
wire ff_imiss_hit_c4_scanin;
wire ff_imiss_hit_c4_scanout;
wire ff_imiss_hit_c5_scanin;
wire ff_imiss_hit_c5_scanout;
wire ff_swap_inst_c3_scanin;
wire ff_swap_inst_c3_scanout;
wire ff_pst_no_ctrue_c3_scanin;
wire ff_pst_no_ctrue_c3_scanout;
wire ff_cas1_inst_c3_scanin;
wire ff_cas1_inst_c3_scanout;
wire ff_ld_inst_c3_scanin;
wire ff_ld_inst_c3_scanout;
wire ff_ld_hit_c4_scanin;
wire ff_ld_hit_c4_scanout;
wire ff_ld_hit_c5_scanin;
wire ff_ld_hit_c5_scanout;
wire ff_inst_vld_c3_scanin;
wire ff_inst_vld_c3_scanout;
wire ff_inst_diag_c3_scanin;
wire ff_inst_diag_c3_scanout;
wire ff_inst_mb_c3_scanin;
wire ff_inst_mb_c3_scanout;
wire ff_inst_mb_c4_scanin;
wire ff_inst_mb_c4_scanout;
wire ff_inst_mb_c5_scanin;
wire ff_inst_mb_c5_scanout;
wire ff_misbuf_hit_unqual_c3_scanin;
wire ff_misbuf_hit_unqual_c3_scanout;
wire ff_inst_dep_c3_scanin;
wire ff_inst_dep_c3_scanout;
wire ff_store_inst_c3_scanin;
wire ff_store_inst_c3_scanout;
wire ff_store_inst_c4_scanin;
wire ff_store_inst_c4_scanout;
wire ff_store_inst_c5_scanin;
wire ff_store_inst_c5_scanout;
wire ff_cas2_from_mb_c3_scanin;
wire ff_cas2_from_mb_c3_scanout;
wire ff_pst_with_ctrue_c3_scanin;
wire ff_pst_with_ctrue_c3_scanout;
wire ff_inval_inst_c3_scanin;
wire ff_inval_inst_c3_scanout;
wire ff_strstore_c3_scanin;
wire ff_strstore_c3_scanout;
wire ff_diag_rd_en_c3_scanin;
wire ff_diag_rd_en_c3_scanout;
wire csr_rd_en_c4;
wire ff_diag_wr_en_c3_scanin;
wire ff_diag_wr_en_c3_scanout;
wire ff_diag_complete_c4_scanin;
wire ff_diag_complete_c4_scanout;
wire ff_tecc_c3_scanin;
wire ff_tecc_c3_scanout;
wire ff_tag_hit_unqual_c3_scanin;
wire ff_tag_hit_unqual_c3_scanout;
wire tag_misbuf_ack_c3;
wire vuad_ce_instr_ack_c3;
wire inval_req_c3;
wire st_inval_ack_c3;
wire ff_st_ack_c4_scanin;
wire ff_st_ack_c4_scanout;
wire ff_st_ack_c5_scanin;
wire ff_st_ack_c5_scanout;
wire ff_inval_req_c4_scanin;
wire ff_inval_req_c4_scanout;
wire inval_req_c4;
wire ff_inval_ack_c5_scanin;
wire ff_inval_ack_c5_scanout;
wire inval_req_c5;
wire ff_tag_hit_c4_scanin;
wire ff_tag_hit_c4_scanout;
wire ff_tag_hit_c5_scanin;
wire ff_tag_hit_c5_scanout;
wire ff_st_req_c4_scanin;
wire ff_st_req_c4_scanout;
wire ff_st_req_c5_scanin;
wire ff_st_req_c5_scanout;
wire sel_diag_store_data_c4;
wire ff_sel_diag_store_data_c5_scanin;
wire ff_sel_diag_store_data_c5_scanout;
wire ff_sel_diag_store_data_c52_scanin;
wire ff_sel_diag_store_data_c52_scanout;
wire ff_sel_diag_store_data_c6_scanin;
wire ff_sel_diag_store_data_c6_scanout;
wire ff_sel_diag_store_data_c7_scanin;
wire ff_sel_diag_store_data_c7_scanout;
wire ff_strst_ack_c4_scanin;
wire ff_strst_ack_c4_scanout;
wire ff_strst_ack_c5_scanin;
wire ff_strst_ack_c5_scanout;
wire ff_rmo_st_ack_c4_scanin;
wire ff_rmo_st_ack_c4_scanout;
wire ff_rmo_st_ack_c5_scanin;
wire ff_rmo_st_ack_c5_scanout;
wire ff_nonmem_comp_c5_scanin;
wire ff_nonmem_comp_c5_scanout;
wire ff_nonmem_comp_c52_scanin;
wire ff_nonmem_comp_c52_scanout;
wire ff_nonmem_comp_c6_scanin;
wire ff_nonmem_comp_c6_scanout;
wire ff_st_with_ctrue_c3_scanin;
wire ff_st_with_ctrue_c3_scanout;
wire ff_misbuf_uerr_c3_scanin;
wire ff_misbuf_uerr_c3_scanout;
wire misbuf_nderr_c3;
wire ff_misbuf_cerr_c3_scanin;
wire ff_misbuf_cerr_c3_scanout;
wire ff_uerr_ack_tmp_c4_scanin;
wire ff_uerr_ack_tmp_c4_scanout;
wire misbuf_nderr_c4;
wire ff_uerr_ack_c4_scanin;
wire ff_uerr_ack_c4_scanout;
wire ff_uerr_ack_c5_scanin;
wire ff_uerr_ack_c5_scanout;
wire misbuf_nderr_c5;
wire ff_error_ceen_d1_scanin;
wire ff_error_ceen_d1_scanout;
wire ff_error_nceen_d1_scanin;
wire ff_error_nceen_d1_scanout;
wire [1:0] filbuf_dis_nderr_c5;
wire ff_cerr_ack_tmp_c4_scanin;
wire ff_cerr_ack_tmp_c4_scanout;
wire ff_cerr_ack_c4_scanin;
wire ff_cerr_ack_c4_scanout;
wire ff_cerr_ack_c5_scanin;
wire ff_cerr_ack_c5_scanout;
wire ff_dis_nderr_c5_scanin;
wire ff_dis_nderr_c5_scanout;
wire [1:0] filbuf_dis_nderr_c4;
wire ff_inst_int_c3_scanin;
wire ff_inst_int_c3_scanout;
wire ff_int_ack_c4_scanin;
wire ff_int_ack_c4_scanout;
wire ff_int_ack_c5_scanin;
wire ff_int_ack_c5_scanout;
wire ff_fwd_req_c3_scanin;
wire ff_fwd_req_c3_scanout;
wire ff_fwd_req_vld_diag_c4_scanin;
wire ff_fwd_req_vld_diag_c4_scanout;
wire ff_fwd_req_ret_c4_scanin;
wire ff_fwd_req_ret_c4_scanout;
wire ff_fwd_req_ret_c5_scanin;
wire ff_fwd_req_ret_c5_scanout;
wire ff_fwd_req_ld_c4_scanin;
wire ff_fwd_req_ld_c4_scanout;
wire ff_fwd_req_ld_c5_scanin;
wire ff_fwd_req_ld_c5_scanout;
wire ff_fwd_req_ld_c52_scanin;
wire ff_fwd_req_ld_c52_scanout;
wire ff_fwd_req_ld_c6_scanin;
wire ff_fwd_req_ld_c6_scanout;
wire ff_ld64_inst_c3_scanin;
wire ff_ld64_inst_c3_scanout;
wire ff_wr64_inst_c3_scanin;
wire ff_wr64_inst_c3_scanout;
wire ff_wr8_inst_c3_scanin;
wire ff_wr8_inst_c3_scanout;
wire ff_sel_rdma_inval_vec_c4_scanin;
wire ff_sel_rdma_inval_vec_c4_scanout;
wire ff_sel_rdma_inval_vec_c5_scanin;
wire ff_sel_rdma_inval_vec_c5_scanout;
wire ff_tag_rdma_ev_en_c3_scanin;
wire ff_tag_rdma_ev_en_c3_scanout;
wire ff_rdma_reg_vld_scanin;
wire ff_rdma_reg_vld_scanout;
wire ff_tag_rdma_wr_comp_c4_scanin;
wire ff_tag_rdma_wr_comp_c4_scanout;
wire ff_misbuf_rdma_reg_vld_c2_scanin;
wire ff_misbuf_rdma_reg_vld_c2_scanout;
wire ff_rdma_vld_px0_p_scanin;
wire ff_rdma_vld_px0_p_scanout;
wire ff_rdma_vld_px1_scanin;
wire ff_rdma_vld_px1_scanout;
wire ff_set_rdma_reg_vld_c4_scanin;
wire ff_set_rdma_reg_vld_c4_scanout;
wire ff_tag_siu_req_state_0_scanin;
wire ff_tag_siu_req_state_0_scanout;
wire ff_tag_siu_req_state_scanin;
wire ff_tag_siu_req_state_scanout;
wire ff_inc_rdma_cnt_c4_scanin;
wire ff_inc_rdma_cnt_c4_scanout;
wire ff_rdmard_cnt_scanin;
wire ff_rdmard_cnt_scanout;
wire ff_rd64_complete_c4_scanin;
wire ff_rd64_complete_c4_scanout;
wire ff_rd64_complete_c5_scanin;
wire ff_rd64_complete_c5_scanout;
wire ff_rd64_complete_c52_scanin;
wire ff_rd64_complete_c52_scanout;
wire ff_rd64_complete_c6_scanin;
wire ff_rd64_complete_c6_scanout;
wire ff_rd64_complete_c7_scanin;
wire ff_rd64_complete_c7_scanout;
wire ff_rd64_complete_c8_scanin;
wire ff_rd64_complete_c8_scanout;
wire ff_rd64_complete_c9_scanin;
wire ff_rd64_complete_c9_scanout;
wire ff_rd64_complete_c10_scanin;
wire ff_rd64_complete_c10_scanout;
wire ff_rd64_complete_c11_scanin;
wire ff_rd64_complete_c11_scanout;
 

 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;

output  [3:0]   tag_dir_l2way_sel_c4; // BS and SR 11/18/03 REverse Direcrtory change  
//output  [3:0]   tag_dir_l2way_sel_c3; // BS and SR 11/18/03 REverse Direcrtory change
output	[15:0]	tag_hit_way_vld_c3; // to vuad dp qualified with misbuf already 
output		tag_st_to_data_array_c3; // to vuad dp for dirty bit setting. 
output		tag_hit_l2orfb_c3; 
 
// to arbdat
output          sel_diag_store_data_c7;  // BS and SR 12/22/03, store ack generation for diagnostic store
output          tag_data_array_wr_active_c1; // scrub write in C1


// to misbuf 
output		tag_miss_unqual_c2;	// used for miss Buffer insertion.  
output		tag_hit_unqual_c2;  // used  for miss buffer deletion. 
output          tag_hit_unqual_c3;  // to arb for cam en logic
output		tag_hit_c3; // used in misbuf to ready dependents. 
output	[3:0]	tag_lru_way_c4 ; // to misbuf for registering the lru way. 

// timing optimization
input  misbuf_uncorr_err_c1;
input  misbuf_notdata_err_c1;
//input	arb_misbuf_inst_vld_c2;
//input	arb_misbuf_inval_inst_c2;
//input	decdp_ic_dc_inval_inst_c1;
 
output		tag_rdma_vld_px0_p; // to the miss buffer picker. 
output		tag_hit_not_comp_c3; 
output		tag_alt_tag_miss_unqual_c3; 
output		tag_misbuf_rdma_reg_vld_c2 ; // POST 3.0 pin TOP 
output          tag_misbuf_int_ack_c3;
 
// to l2b fbdata 
output	[15:0]	l2t_l2b_fbwr_wen_r2; 
//output		tag_l2b_fbd_stdatasel_c3; 
output		l2t_l2b_fbd_stdatasel_c3; 
 
output	[15:0]	tagctl_l2drpt_mux4_way_sel_c1; 
// to l2d 
//output	[15:0]	tag_l2d_way_sel_c2; 
//output	[3:0]	tag_l2d_col_offset_c2; 
output		[3:0]	dec_col_offset_prev_c1;
output		tag_l2d_rd_wr_c2;	 
output	[15:0]	tag_l2d_word_en_c2; 





// flopped for timing reasons
input		decdp_cas2_from_mb_ctrue_c1;
 
output	tag_deccck_addr3_c7; // decc for 64b mux sel 
output	tag_decc_tag_acc_en_px2; // arb for tag/vuad acc en generation 
output	tag_data_ecc_active_c3 ; // arb for arb mux sel generation 
output	tag_deccck_data_sel_c8; // used by arbdata to sel scrub data over store data. 
output	tag_scrub_rd_vld_c7 ; // to decc. 
//output	tag_spc_rd_vld_c7; // to decc indicating that a spc read is ON 
output	tag_spc_rd_vld_c6; // to decc for timing will be flopped in decc

output	tag_bsc_rd_vld_c7; // NEW_PIN to deccck 
output	[3:0]	tag_scrub_addr_way; // goes to csr 
 
// to oqu 
output	tag_imiss_hit_c5; // meant for generating req_vec and type. 
output	tag_ld_hit_c5; // meant for generating req_vec 
output	tag_strst_ack_c5; // meant for generating req_vec 
output	tag_st_ack_c5; // meant for generating req_vec 
output  tag_inval_req_c5; // meant for generating req_vec, BS and SR 11/12/03 N2 Xbar Packet format change
output	tag_st_req_c5; // meant for generating rqtyp 
output	tag_nonmem_comp_c6; // csr or diagnotic instructions complete. 
output	tag_uerr_ack_c5; 
output	tag_cerr_ack_c5; 
output	tag_int_ack_c5; 
output	tag_fwd_req_ret_c5; // to oqu 
//output	tag_fwd_req_in_c5; // to oqu. 
output	tag_sel_rdma_inval_vec_c5; // to oqu. 
output	tag_rdma_wr_comp_c4;  // to oqu for rdma state m/c 
output	tag_rmo_st_ack_c5; // NEW_PIN to l2t_oqu_ctl.sv 
output	tag_inst_mb_c5; // NEW_PIN to l2t_oqu_ctl.sv 
output	tag_hit_c5; // NEW_PIN to l2t_oqu_ctl.sv 
 
// to oq_dctl 
output	tag_store_inst_c5; // to oq_dctl. 
output	tag_fwd_req_ld_c6;  
 
// to filbuf 
output	tag_rdma_gate_off_c2; // to filbuf for gating off fb hit. 
output  tag_rd64_complete_c11; // NEW_PIN 
output	tag_uerr_ack_tmp_c4; // POST_2.0 pins 
output  tag_cerr_ack_tmp_c4;
output	tag_spc_rd_cond_c3 ; // POST 3.2 
 
// to arb 
input	arb_vuad_ce_err_c3; // VUAD ecc change
output	tag_rdma_vld_px1; // to the arbiter. 
 
// rdmat. 
output	tag_rdma_ev_en_c4; 
 
// to l2b_rep 
output		tag_inc_rdma_cnt_c4; // NEW_PIN 
output		tag_set_rdma_reg_vld_c4 ; // NEW_PIN 
output		tag_siu_req_en_c52; // NEW_PIN 

// to misbuf

output  tag_store_inst_c3; //BS and SR 11/07/03, store pipelining support
 
 
output scan_out; 
input           misbuf_hit_st_dep_zero; // BS and SR 11/07/03, store pipelining support 
input	[15:0]	tag_way_sel_c2; // from the tag 
 
input	[15:0]	vlddir_vuad_valid_c2; // from vuad dp 
input	[15:0]	tagdp_lru_way_sel_c3; // from vuad dp 
 
input		misbuf_vuad_ce_instr_ack_c2;
input		tagdp_tag_par_err_c3 ; // from tagd. 
 
input	[3:0]	bist_data_enc_way_sel_c1; 
input		bist_data_enable_c1; 
input		bist_data_wr_enable_c1; 
input	[3:0]	bist_data_waddr_c1; 
input		mbist_run;
 
// from arbaddr 
input   [1:0]	arbadr_arbdp_addr5to4_c1; // from arbaddr 
input   [1:0]	arbadr_arbdp_addr3to2_c1; // from arbaddr 
 
input		arbadr_arbaddr_addr22_c2; // diagnostic word address. from arbaddr. 
input	[3:0]	arbadr_arbdp_diag_wr_way_c2; // from arbaddr. addr<21..18> 
 
// from arbdec 
input	[3:0]	arbdec_arbdp_inst_way_c3; // from arbdec 
input	arb_decdp_tag_wr_c1; // indicates a write into the L2$ data array.  
				    // from arbdec 
//input	arb_decdp_cas2_from_mb_ctrue_c2; // indicates that cas2 will write into the L2.  
				    // from arbdec. 
input	arb_decdp_cas2_from_mb_c2; 
input	arb_decdp_strst_inst_c2; 
input	arb_arbdp_dword_st_c1 ; // indicates a 64b write to the data array 
input	arb_decdp_rmo_st_c3; // NEW_PIN from arbdec. 
 
// rdma related decoded inputs from arbdec. 
input	arbdec_arbdp_rdma_inst_c1; // POST 3.0 pin replaces arbdec_arbdp_rdma_inst_c2  
input	arb_decdp_ld64_inst_c1; // indicates a 64B read from the data array from BSC/JBI 
input	arb_decdp_wr64_inst_c2;  
input	arb_decdp_wr8_inst_c2; 

input	arb_tag_pst_with_ctrue_c1 ; 
 
input	csr_l2_bypass_mode_on; 
 
input	arb_bist_or_diag_acc_c1; 
input	arb_fill_vld_c2; 
input	arb_imiss_vld_c2;  
input	arb_evict_vld_c2;  
input	arb_tag_inst_vld_c2; 
input	arb_waysel_gate_c2; 
input	arb_data_diag_st_c2; // diagnostic store to data array from arb. 
input	arb_csr_wr_en_c3 ; // csr write from miss Buffer, 
input	arb_csr_rd_en_c3 ; // csr read 
input	arb_diag_complete_c3; // vuad, tag, data access 
 
input	deccck_scrd_uncorr_err_c8; 
 
// from misbuf. 
input	misbuf_tag_hit_unqual_c2; // misbuf hit not qualled with instr vld. 
input	misbuf_uncorr_err_c2; // mbf uncorr err means no store.  
input	misbuf_corr_err_c2; 
input	misbuf_notdata_err_c2; 
input	misbuf_wr64_miss_comp_c3 ; // indicates wr64 completion 
input   misbuf_arb_hit_c3; // BS and SR 1/31/04
//input	misbuf_gate_off_par_err_c3 ; // from misbuf POST_3.4 
input   filbuf_match_c3; 

 
 
// arbdec 
input	arb_decdp_swap_inst_c2; 
input	arb_arbdp_tag_pst_no_ctrue_c2;	 // Pin on TOP 
input	arb_decdp_cas1_inst_c2; 
input	arb_decdp_ld_inst_c2; 
input	arbdec_arbdp_inst_mb_c2; // from arbdec 
input	arbdec_arbdp_inst_dep_c2; // from arbdec 
input	arb_decdp_st_inst_c2; // from arbdec. 
input	arb_decdp_st_with_ctrue_c2; 
input	arb_decdp_inst_int_c2; 
input	arb_decdp_fwd_req_c2; // from arbdec 
 
// arb. 
//input	arb_inst_diag_c2; // from arb. 
input	arb_inst_diag_c1; // from arb. 
input	arb_inval_inst_c2; 
input  arb_waysel_inst_vld_c2; // POST_2.0 
//input  arb_coloff_inst_vld_c2; // POST_2.0 
input	arb_inst_vld_c2_prev;
input  arb_upper_four_byte_access_c1;// BS 05/04/04 : taking out upper_four_byte_access info to word_en_c2[15:0] gen logic in tag_ctl
input  arb_lower_four_byte_access_c1; // BS 05/04/04 :  taking out lower_four_byte_access info to word_en_c2[15:0] gen logic in tag_ctl
input  arb_rdwr_inst_vld_c2; // POST_2.0 
//  input  arb_wen_inst_vld_c2; // POST_2.0  int 5.0 changes
input	arb_wr8_inst_no_ctrue_c1; // POST_3.4 
 
 
// from filbuf 
input		filbuf_tag_hit_c2; // filbuf hit. 
input           filbuf_tag_hit_frm_mb_c2; // filbuf hit for an instruction issued from Miss Buffer
input   [3:0]   filbuf_tag_evict_way_c3; // BS and SR 12/18/03, LRU way from Filbuf needs to be written to Dir on a Miss
input	[1:0]	filbuf_mcu_l2t_chunk_id_r1; // chunk id for fbdata wr 
input		filbuf_mcu_l2t_data_vld_r1; 
input	filbuf_dis_cerr_c3; 
input	filbuf_dis_uerr_c3; 
input	[1:0]  filbuf_dis_nderr_c3;
 
input		oqu_st_complete_c7; // from oqu. 
 
input	arbdec_arbdp_tecc_c1; // from arbdec. Simply the tecc bit of an instruction. 
input   wmr_l;
input	l2clk; 
input scan_in;
input	csr_error_nceen;
input   csr_error_ceen; // POST_3.2
 
input	tagdp_misbuf_par_err_c3; 
output	tag_misbuf_par_err_c3; 
input	mbist_arb_l2d_en;
 
wire  		dirty_bit_set_c2;
wire            misbuf_vuad_ce_instr_ack_c3;
wire   [3:0]    filbuf_tag_evict_way_c3_tmp;
wire   [3:0]    filbuf_tag_evict_way_c4;
wire   [3:0]    filbuf_tag_evict_way_c4_in;
wire            sel_diag_store_data_c5; // BS and SR 12/22/03, store ack generation for diagnostic store
wire            sel_diag_store_data_c52; // BS 03/11/04 extra cycle for mem access
wire            sel_diag_store_data_c6; // BS and SR 12/22/03, store ack generation for diagnostic store
wire            sel_diag_store_data_c7; // BS and SR 12/22/03, store ack generation for diagnostic store

//wire    [15:0]  tag_l2d_way_sel_mod_c2; // BS and SR 12/22/03 , brought out evict way separately to mux for DIr L2 way
wire    [3:0]   tagdp_lru_way_sel_enc_c3; // BS and SR 12/22/03 , brought out evict way separately to mux for DIr L2 way
wire    [3:0]   tag_dir_l2way_sel_taghit_c3; // BS and SR 12/18/03, LRU way from Filbuf needs to be written to Dir on a Miss
wire    [15:0]  tag_l2d_way_sel_c3; //  BS and SR 11/18/03 REverse Direcrtory change
wire            tag_store_inst_c3; //BS and SR 11/07/03, store pipelining support
wire	[2:0]	tag_siu_req_state_in, tag_siu_req_state; 
 
wire	[3:0]	mux1_way_sel_c1, mux2_way_sel_c1, mux3_way_sel_c1; 
wire		data_array_acc_active_c1, qual_way_sel_c1; 
wire	[15:0]	dec_way_sel_c1; 
 
wire	evict_unqual_vld_c3; 
wire	[15:0]	mux4_way_sel_c1, hit_way_vld_c2, temp_way_sel_c2; 
 
wire	[3:0]	encoded_lru_way_c3; 
wire	tag_hit_c2; 
 
wire	[1:0]	mux1_col_offset_c1, mux2_col_offset_c1, mux3_col_offset_c1; 
wire	[3:0]	dec_col_offset_prev_c1, col_offset_dec_prev_c2; 
wire	[3:0]	dec_col_offset_c2; 
// wire	data_hold_c2;  // int 5.0 changes
//wire	tag_wr_c2; 
wire	prev_rd_wr_c1, prev_rd_wr_c2; 
 
wire	[15:0]	bist_word_en_c1; 
wire	[15:0]	dec_word_addr_c2; 
wire	[15:0]	word_en_c2 ; 
wire	[15:0]	diag_word_en_c2 ; 
wire	[15:0]	mux1_wen_c1 ; 
wire	[15:0]	data_ecc_wen_c1 ; 
wire	[15:0]	mux2_wen_c1; 
wire	[15:0]	tmp_word_en_c2 ; 
wire	[15:0]	prev_wen_c1, prev_wen_c2 ; 
 
 
wire	arb_tecc_c2;  
 
wire	scrub_fsm_reset, scrub_fsm_en ;  
wire	[3:0]	scrub_fsm_cnt, scrub_fsm_cnt_plus1 ; 
wire	scrub_addr_reset, scrub_addr_en ; 
wire	[6:0]	scrub_addr_cnt_plus1, scrub_addr_cnt ; 
wire	[15:0]	dec_scrub_addr_way; 
wire	scrub_way_vld_c2,scrub_way_vld_c3; 
wire	scrub_way_vld_c4,scrub_way_vld_c5, scrub_way_vld_c52; // BS 03/11/04 extra cycle for mem access 
wire	scrub_way_vld_c6,scrub_way_vld_c7; 
wire	qual_col_offset_c1; 
wire	data_array_wr_active_c1 ; 
wire	scrub_rd_vld_c8, scrub_wr_disable_c8 ; 
wire	scrub_wr_disable_c9; 
wire	imiss_tag_hit_c3, imiss_tag_hit_c4 ; 
wire	tag_spc_rd_vld_c3; 
wire	tag_spc_rd_vld_c4, tag_spc_rd_vld_c5, tag_spc_rd_vld_c52; // BS 03/11/04 extra cycle for mem access 
wire	tag_spc_rd_vld_c6; 
 
wire		tag_hit_l2orfb_c2; 
wire	waysel_match_c2; 
 
wire	[15:0]	mcu_fbd_wen_r1 ; 
wire	[15:0]	l2t_l2b_fbwr_wen_r1; 
wire	imiss_vld_c3; 
wire	imiss_hit_c3, arb_imiss_hit_c4, imiss_hit_c5 ; 
wire	swap_inst_c3, pst_no_ctrue_c3, cas1_inst_c3, ld_inst_c3 ; 
wire	ld_hit_c3, ld_hit_c4, ld_hit_c5; 
 
 
wire	inst_vld_c3, inst_diag_c3, inst_mb_c3; 
wire	misbuf_hit_unqual_c3; 
wire	inst_dep_c3   ; 
wire	pst_with_ctrue_c3, inval_inst_c3; 
wire	ack_c3, st_ack_c3, strst_ack_c3, cas2_from_mb_c3;  
 
wire	csr_wr_en_c4, strstore_inst_c3 ; 
wire	diag_complete_c4; 
 
wire	st_ack_c4, st_ack_c5; 
wire	strst_ack_c4, strst_ack_c5; 
wire	st_req_c3, st_req_c4, st_req_c5 ; 
wire	nonmem_comp_c4, nonmem_comp_c5, nonmem_comp_c52, nonmem_comp_c6; // BS 03/11/04 extra cycle for mem access
 
 
wire	st_with_ctrue_c3, misbuf_uerr_c3, misbuf_cerr_c3 ; 
wire	uerr_ack_c3, uerr_ack_c4, uerr_ack_c5 ; 
wire	cerr_ack_c3, cerr_ack_c4, cerr_ack_c5 ; 
 
wire	inst_int_c3, int_ack_c3; 
wire	int_ack_c4, int_ack_c5; 
 
wire	fwd_req_c3, fwd_req_vld_diag_c3, fwd_req_vld_diagn_c3; 
wire	fwd_req_vld_diag_c4; 
wire	fwd_req_ret_c3, fwd_req_ret_c4, fwd_req_ret_c5 ; 
 
wire	store_inst_c3, store_inst_c4, store_inst_c5; 
wire	fwd_req_ld_c3, fwd_req_ld_c4, fwd_req_ld_c5, fwd_req_ld_c52, fwd_req_ld_c6 ; // BS 03/11/04 extra cycle for mem access 
wire	mcu_l2t_data_vld_r2; 
 
wire	sel_store_wen; 
 
wire	fill_vld_c3; 
 
wire	tag_rdmard_vld_c2, sel_c3_hit_way ; 
 
wire	ld64_inst_c3, wr64_inst_c3, wr8_inst_c3; 
wire	set_rdma_reg_vld_c3, reset_rdma_reg_vld; 
wire	rd64_complete_c3; 
wire	wr64_hit_complete_c3, wr8_complete_c3; 
wire	rdma_reg_vld_in, rdma_reg_vld; 
 
wire	[3:0]	rdma_cnt_plus1, rdma_cnt; 
wire	rdma_cnt_reset, inc_rdma_cnt_c3; 
wire	set_rdma_reg_vld_c4;  
wire	idle_state_in_l,idle_state_l; 
wire	inc_rdma_cnt_c4;  

wire    reset_rdma_vld_px0_p_in; 
wire	rdma_vld_px0_p_in;
wire    rdma_vld_px0_p; 
wire	reset_rdma_vld_px1_in ; 
wire	rdma_vld_px1_in, rdma_vld_px1;  
wire	tag_rdma_ev_en_c3; 
 
 
wire	tag_fb_hit_c2; 
wire	[15:0]	fbd_word_en_c2; 
wire	alt_tag_hit_unqual_c2; 
wire	tag_hit_not_comp_c2; 
wire	alt_tag_miss_unqual_c2; 
 
 
wire	sel_rdma_inval_vec_c3, sel_rdma_inval_vec_c4 ; 
wire	tag_rdma_wr_comp_c3;  
 wire	[15:0]	dec_word_addr_c1; 
 wire	[1:0]	addr5to4_c2; 
//wire	fwd_req_in_c3, fwd_req_in_c4, fwd_req_in_c5 ; 
wire	rmo_st_ack_c3, rmo_st_ack_c4, rmo_st_ack_c5 ; 
wire	inst_mb_c4, inst_mb_c5 ; 
 
wire	tag_hit_c4; 
wire	st_to_data_array_c3; 
wire	rdma_inst_c3; 
wire	tag_bsc_rd_vld_c3, tag_bsc_rd_vld_c4; 
wire	tag_bsc_rd_vld_c5, tag_bsc_rd_vld_c52, tag_bsc_rd_vld_c6; // BS 03/11/04 extra cycle for mem access 
 
 
wire    rd64_complete_c4, rd64_complete_c5, rd64_complete_c52, rd64_complete_c6; // BS 03/11/04 extra cycle for mem access 
wire    rd64_complete_c7, rd64_complete_c8, rd64_complete_c9; 
wire    rd64_complete_c10, rd64_complete_c11 ; 
 
wire	[3:0]	dec_lo_way_sel_c1; 
wire	[3:0]	dec_hi_way_sel_c1; 
wire	[3:0]	dec_lo_scb_way; 
wire	[3:0]	dec_hi_scb_way ; 
 
wire		dbb_rst_l; 
wire	uerr_ack_tmp_c3,cerr_ack_tmp_c3; 
wire	vld_mbf_miss_c2; 
wire	st_to_data_array_c2; 
wire	[15:0] way_sel_unqual_c2_n;
wire    [15:0] way_sel_unqual_c2_mod_n; // BS and SR 12/22/03 , brought out evict way separately to mux for DIr L2 way
wire    [15:0] way_sel_unqual_c2; // BS 03/03/04, fix for Bug 79529 
wire    [15:0] way_sel_unqual_c3; // BS 03/03/04, fix for Bug 79529
wire	vld_mbf_miss_c2_n; 
wire	prev_rd_wr_c2_1; 
wire	[15:0]	tag_hit_way_vld_c2; 
 
wire	rdma_inst_c2; 
wire	tecc_c3; 
 wire	sel_prev_wen_c1, sel_prev_wen_c2; 
wire	error_ceen_d1, error_nceen_d1; 
wire	pst_with_ctrue_c2; 
wire	ld64_inst_c2; 
wire	wr8_inst_no_ctrue_c2; 
//wire	bist_data_enable_c2; 
wire	col_offset_sel_c2; 
wire 	decc_tag_acc_en_px1; // int 5.0 change

/////////////////////////////////////////////////////////////////// 
 // Reset flop 
 /////////////////////////////////////////////////////////////////// 

//////////////////////////////////////////////////
// L1 clk header
//////////////////////////////////////////////////
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

l2t_tag_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk(l2clk),
        .l1en(1'b1 ),
        .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

//////////////////////////////////////////////////

//////////////////////////////////////////
// Spare gate insertion
//////////////////////////////////////////
l2t_tag_ctl_spare_ctl_macro__num_4 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
//////////////////////////////////////////


 
l2t_tag_ctl_msff_ctl_macro__width_1 reset_flop 
				(.dout(dbb_rst_l), 
                                        .scan_in(reset_flop_scanin),
                                        .scan_out(reset_flop_scanout),
                                        .l1clk(l1clk), 
                                        .din(wmr_l),
  .siclk(siclk),
  .soclk(soclk) 
                                         
); 

l2t_tag_ctl_msffi_ctl_macro__width_1 ff_mbist_run 
        (
	.scan_in(ff_mbist_run_scanin),
	.scan_out(ff_mbist_run_scanout),
	.q_l(mbist_run_r1_n),
        .l1clk(l1clk),
        .din(mbist_run),
  .siclk(siclk),
  .soclk(soclk)
	);

l2t_tag_ctl_msff_ctl_macro__width_1 ff_mbist_arb_l2d_en_d1 
       (
	.scan_in(ff_mbist_arb_l2d_en_d1_scanin),
	.scan_out(ff_mbist_arb_l2d_en_d1_scanout),
	.din(mbist_arb_l2d_en), 
	.l1clk(l1clk),
        .dout(mbist_arb_l2d_en_d1),
  .siclk(siclk),
  .soclk(soclk)
	);


assign csr_l2_bypass_mode_on_qual = mbist_run_r1_n ? csr_l2_bypass_mode_on : 1'b0;

l2t_tag_ctl_msff_ctl_macro__width_1 ff_l2_bypass_mode_on 
                           (.din(csr_l2_bypass_mode_on_qual), .l1clk(l1clk),  
				.scan_in(ff_l2_bypass_mode_on_scanin),
				.scan_out(ff_l2_bypass_mode_on_scanout),
				.dout(l2_bypass_mode_on_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 


assign arb_fill_vld_c2_in = mbist_run_r1_n ? arb_fill_vld_c2 : 1'b0; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_fill_vld_c3 
                           (.din(arb_fill_vld_c2_in), .l1clk(l1clk),  
				.scan_in(ff_fill_vld_c3_scanin),
				.scan_out(ff_fill_vld_c3_scanout),
				.dout(fill_vld_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
//////////////////////////////////////////////////////////////////////////////////// 
// Way Select Logic. 
// The way chosen for data access is from the following components 
// * bist way 
// * diagnostic data access way 
// * scrub way 
// * fill way  
// * hit way C3 ( imiss or an rdma rd i.e.ld64) 
// * hit way  
// * lru way for an eviction 
//////////////////////////////////////////////////////////////////////////////////// 
 
 
l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_mux1_way_sel_c1 
		(.dout (mux1_way_sel_c1[3:0]), // bist or diagnostic way. 
                               	.din0(bist_data_enc_way_sel_c1[3:0]), // bist data 
				.din1(arbadr_arbdp_diag_wr_way_c2[3:0]), // diagnostic 
                               	.sel0(bist_data_enable_c1),  
				.sel1(~bist_data_enable_c1)); 
 
l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_mux2_way_sel_c1 
		(.dout (mux2_way_sel_c1[3:0]), // bist/diagnostic or scrub way. 
                               	.din0(mux1_way_sel_c1[3:0]), // bist data 
				.din1(tag_scrub_addr_way[3:0]), // scrub 
                               	.sel0(~data_array_acc_active_c1), // no scrub access 
				.sel1(data_array_acc_active_c1)); // scrub access 
 
l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_mux3_way_sel_c1 
		(.dout (mux3_way_sel_c1[3:0]), // bist/diagnostic/scrub or fill way. 
                               	.din0(mux2_way_sel_c1[3:0]), // bist data 
				.din1(arbdec_arbdp_inst_way_c3[3:0]), // fill way 
                               	.sel0(~fill_vld_c3), // fill vld in C2. 
				.sel1(fill_vld_c3)); 
 
assign	tag_misbuf_par_err_c3 = tagdp_misbuf_par_err_c3 ; 
 
assign	qual_way_sel_c1 = ( arb_bist_or_diag_acc_c1 | 	// L2 cache can be OFF. 
			( fill_vld_c3 & ~l2_bypass_mode_on_d1 ) | // l2 cache is ON 
			  data_array_acc_active_c1 ) ; // scrub state machine is accessing 
							// the data $. 
 
 
assign  dec_lo_way_sel_c1[0] = ( mux3_way_sel_c1[1:0]==2'd0 ) 
                                        & qual_way_sel_c1 ; 
assign  dec_lo_way_sel_c1[1] = ( mux3_way_sel_c1[1:0]==2'd1 ) 
                                        & qual_way_sel_c1 ; 
assign  dec_lo_way_sel_c1[2] = ( mux3_way_sel_c1[1:0]==2'd2 ) 
                                        & qual_way_sel_c1 ; 
assign  dec_lo_way_sel_c1[3] = ( mux3_way_sel_c1[1:0]==2'd3 ) 
                                        & qual_way_sel_c1 ; 
 
 
assign  dec_hi_way_sel_c1[0] = ( mux3_way_sel_c1[3:2]==2'd0 ) ; 
 
assign  dec_hi_way_sel_c1[1] = ( mux3_way_sel_c1[3:2]==2'd1 ) ; 
 
assign  dec_hi_way_sel_c1[2] = ( mux3_way_sel_c1[3:2]==2'd2 ) ; 
 
assign  dec_hi_way_sel_c1[3] = ( mux3_way_sel_c1[3:2]==2'd3 ) ; 
 
 
 
assign  dec_way_sel_c1[0] = dec_hi_way_sel_c1[0] & dec_lo_way_sel_c1[0] ; // 0000 
assign  dec_way_sel_c1[1] = dec_hi_way_sel_c1[0] & dec_lo_way_sel_c1[1] ; // 0001 
assign  dec_way_sel_c1[2] = dec_hi_way_sel_c1[0] & dec_lo_way_sel_c1[2] ; // 0010 
assign  dec_way_sel_c1[3] = dec_hi_way_sel_c1[0] & dec_lo_way_sel_c1[3] ; // 0011 
assign  dec_way_sel_c1[4] = dec_hi_way_sel_c1[1] & dec_lo_way_sel_c1[0] ; // 0100  
assign  dec_way_sel_c1[5] = dec_hi_way_sel_c1[1] & dec_lo_way_sel_c1[1] ; // 0101  
assign  dec_way_sel_c1[6] = dec_hi_way_sel_c1[1] & dec_lo_way_sel_c1[2] ; // 0110  
assign  dec_way_sel_c1[7] = dec_hi_way_sel_c1[1] & dec_lo_way_sel_c1[3] ; // 0111  
assign  dec_way_sel_c1[8] = dec_hi_way_sel_c1[2] & dec_lo_way_sel_c1[0] ; // 1000 
assign  dec_way_sel_c1[9] = dec_hi_way_sel_c1[2] & dec_lo_way_sel_c1[1] ; // 1001 
assign  dec_way_sel_c1[10] = dec_hi_way_sel_c1[2] & dec_lo_way_sel_c1[2] ; // 1010 
assign  dec_way_sel_c1[11] = dec_hi_way_sel_c1[2] & dec_lo_way_sel_c1[3] ; // 1011 
assign  dec_way_sel_c1[12] = dec_hi_way_sel_c1[3] & dec_lo_way_sel_c1[0] ; // 1100 
assign  dec_way_sel_c1[13] = dec_hi_way_sel_c1[3] & dec_lo_way_sel_c1[1] ; // 1101 
assign  dec_way_sel_c1[14] = dec_hi_way_sel_c1[3] & dec_lo_way_sel_c1[2] ; // 1110 
assign  dec_way_sel_c1[15] = dec_hi_way_sel_c1[3] & dec_lo_way_sel_c1[3] ; // 1111 
 

assign arb_decdp_ld64_inst_c1_qual = mbist_run_r1_n ? arb_decdp_ld64_inst_c1 : 1'b0;


l2t_tag_ctl_msff_ctl_macro__width_1 ff_ld64_inst_c2 
                           (.din(arb_decdp_ld64_inst_c1_qual), .l1clk(l1clk),  
				.scan_in(ff_ld64_inst_c2_scanin),
				.scan_out(ff_ld64_inst_c2_scanout),
				.dout(ld64_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	tag_rdmard_vld_c2 = mbist_run_r1_n ? (ld64_inst_c2 & arb_tag_inst_vld_c2) : 1'b0; 
			 
assign	sel_c3_hit_way = ( arb_imiss_vld_c2  
				| tag_rdmard_vld_c2 ) & 
			~misbuf_tag_hit_unqual_c2 &
			~l2_bypass_mode_on_d1;  // int 5.0 changes

assign tagctl_l2drpt_mux4_way_sel_c1[15:0] = mux4_way_sel_c1[15:0];
 
// Use a mux flop to reduce setup. 
l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_16 mux_mu4_way_sel_c1 
		(.dout (mux4_way_sel_c1[15:0]), // bist/diag/fill/scrub OR imiss 
                               	.din0(dec_way_sel_c1[15:0]), // bist/diag/fill/scrub way decoded 
				.din1(hit_way_vld_c2[15:0]), // hit way C2  
                               	.sel0(~sel_c3_hit_way),  
				.sel1(sel_c3_hit_way));// imiss or rdma rd vld in C2. 
 
l2t_tag_ctl_msff_ctl_macro__width_16 ff_temp_way_sel_c2 
                           (.din(mux4_way_sel_c1[15:0]), .l1clk(l1clk), 
               .scan_in(ff_temp_way_sel_c2_scanin),
               .scan_out(ff_temp_way_sel_c2_scanout),
               .dout(temp_way_sel_c2[15:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
///////////////////////////////////////////////////////////////// 
// An unqualled version of evict is used to  
// send the way selects to the data array 
// If a tag parity error is detected while performing  
// an eviction pass, the data array is read but, eviction  
// is not performed during this pass. 
///////////////////////////////////////////////////////////////// 

assign arb_evict_vld_c2_qual = mbist_run_r1_n ? arb_evict_vld_c2 : 1'b0;
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_evict_unqual_vld_c3 
                           (.din(arb_evict_vld_c2_qual), .l1clk(l1clk), 
                    .scan_in(ff_evict_unqual_vld_c3_scanin),
                    .scan_out(ff_evict_unqual_vld_c3_scanout),
                    .dout(evict_unqual_vld_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
///////////////////////////////////////////////////////////////// 
// An RDMA instruction that is not a PST will not access the 
// $  or the FB if the rdma reg vld is asserted. 
///////////////////////////////////////////////////////////////// 
l2t_tag_ctl_msff_ctl_macro__dmsff_32x__width_2 ff_wr8_no_ctrue_c2 
                           (.din({2{arb_wr8_inst_no_ctrue_c1}}), .l1clk(l1clk), 
                    .scan_in(ff_wr8_no_ctrue_c2_scanin),
                    .scan_out(ff_wr8_no_ctrue_c2_scanout),
                    .dout({wr8_inst_no_ctrue_c2_cloned,wr8_inst_no_ctrue_c2}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// isolated the load 
assign	tag_rdma_gate_off_c2_internal = ( rdma_reg_vld & ~wr8_inst_no_ctrue_c2 & rdma_inst_c2 ); 
assign	tag_rdma_gate_off_c2 = ( rdma_reg_vld_cloned & ~wr8_inst_no_ctrue_c2_cloned & rdma_inst_c2_cloned ); 
 
 
///////////////////////////////////////////////////////////////// 
// The following signal is sent to vuad dp. 
// On a miss Buffer hit, the way selects are turned off to prevent  
// any dirty bit update in the vuad array 
// critical signals - arb_tag_inst_vld_c2,  arb_waysel_gate_c2 
//			arb_arbdp_tag_pst_no_ctrue_c2, rdma_inst_c2 	 
//			Use higher metal layer for all these signals. 
///////////////////////////////////////////////////////////////// 
 
 
assign	hit_way_vld_c2 = tag_way_sel_c2 & vlddir_vuad_valid_c2 &  
				{16{arb_waysel_inst_vld_c2 &  
				~tag_rdma_gate_off_c2_internal & 
				arb_waysel_gate_c2  }} ;  
 
 
assign	vld_mbf_miss_c2 = ~misbuf_tag_hit_unqual_c2 & arb_waysel_inst_vld_c2; 
 
assign	tag_hit_way_vld_c2 = hit_way_vld_c2  & 
			{16{vld_mbf_miss_c2}};  
 
l2t_tag_ctl_msff_ctl_macro__width_16 ff_tag_hit_way_vld_c3 
                           (.din(tag_hit_way_vld_c2[15:0]), .l1clk(l1clk), 
               .scan_in(ff_tag_hit_way_vld_c3_scanin),
               .scan_out(ff_tag_hit_way_vld_c3_scanout),
               .dout(tag_hit_way_vld_c3[15:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// 
//assign	way_sel_unqual_c2_n = mbist_run_r1_n ? (~(temp_way_sel_c2 |   
//		//  way for a bist/diag/fill/scrub OR imiss 2nd packet. 
// 		( hit_way_vld_c2 & {16{~l2_bypass_mode_on_d1 & ~ld64_inst_c2 }} )|   
//		// C2 instruction hit way  
//		(tagdp_lru_way_sel_c3 & {16{evict_unqual_vld_c3 & 
//		~tagdp_tag_par_err_c3 }}))) : ~temp_way_sel_c2 ; 


assign  way_sel_unqual_c2_n = (~(temp_way_sel_c2 |
                //  way for a bist/diag/fill/scrub OR imiss 2nd packet.
                ( hit_way_vld_c2 & {16{~l2_bypass_mode_on_d1 & ~ld64_inst_c2 }} )|
                // C2 instruction hit way
                (tagdp_lru_way_sel_c3 & {16{evict_unqual_vld_c3 &
                ~tagdp_tag_par_err_c3 }})));






 
assign	vld_mbf_miss_c2_n = (misbuf_tag_hit_unqual_c2 & arb_waysel_inst_vld_c2) ;
 
assign	tag_l2d_way_sel_c2 = ~(way_sel_unqual_c2_n | {16{vld_mbf_miss_c2_n}}) ;  
			// C2 way select is turned off if the instruction in C2 is a 
			// mbf hit. 
//
//// BS and SR 12/22/03 , brought out evict way separately to mux for DIr L2 way
//assign way_sel_unqual_c2_mod_n = ~(temp_way_sel_c2 |
//                //  way for a bist/diag/fill/scrub OR imiss 2nd packet.
//                ( hit_way_vld_c2 & {16{~l2_bypass_mode_on_d1 & ~ld64_inst_c2 }} ));
//// BS and SR 12/22/03 , brought out evict way separately to mux for DIr L2 way
////assign  tag_l2d_way_sel_mod_c2 = ~(way_sel_unqual_c2_mod_n | {16{vld_mbf_miss_c2_n}}) ;


// BS abd SR 11/18/03 REverse Direcrtory change 
// L2 way number is being taken to the Directory to be stored along with
// Index of hit

l2t_tag_ctl_msff_ctl_macro__width_16 ff_tag_l2d_way_sel_c3 
                           (.din(tag_l2d_way_sel_c2[15:0]), .l1clk(l1clk),
               .scan_in(ff_tag_l2d_way_sel_c3_scanin),
               .scan_out(ff_tag_l2d_way_sel_c3_scanout),
               .dout(tag_l2d_way_sel_c3[15:0]),
  .siclk(siclk),
  .soclk(soclk)  
);

assign way_sel_unqual_c2 = ~(way_sel_unqual_c2_n); // BS 03/03/04, fix for Bug 79529 

l2t_tag_ctl_msff_ctl_macro__width_16 ff_way_sel_unqual_c3  // BS 03/03/04, fix for Bug 79529
                           (.din(way_sel_unqual_c2[15:0]), .l1clk(l1clk),
               .scan_in(ff_way_sel_unqual_c3_scanin),
               .scan_out(ff_way_sel_unqual_c3_scanout),
               .dout(way_sel_unqual_c3[15:0]),
  .siclk(siclk),
  .soclk(soclk)  
);
// BS 03/03/04, fix for Bug 79529 :
// in case MB hit in C2 for a store , we may still need to cam the DIr in c5 if the
// misbuf_hit_st_dep_zero is true in c3. hence cannot lose way_sel_unqual_c2_n, have to
// preserve it in c3 and use this way_sel to cam dir in C5. 

// timing fix in misbuf
assign misbuf_hit_st_dep_zero_qual = misbuf_hit_st_dep_zero & (store_inst_c3 | strstore_inst_c3) ;

assign tag_dir_l2way_sel_taghit_c3[0] = misbuf_hit_st_dep_zero_qual ? 
                               (|({way_sel_unqual_c3[1],
                                   way_sel_unqual_c3[3],
                                   way_sel_unqual_c3[5],
                                   way_sel_unqual_c3[7],
                                   way_sel_unqual_c3[9],
                                   way_sel_unqual_c3[11],
                                   way_sel_unqual_c3[13],
                                   way_sel_unqual_c3[15]})) : 
                               (|({tag_l2d_way_sel_c3[1],
                                   tag_l2d_way_sel_c3[3],
                                   tag_l2d_way_sel_c3[5],
                                   tag_l2d_way_sel_c3[7],
                                   tag_l2d_way_sel_c3[9],
                                   tag_l2d_way_sel_c3[11],
                                   tag_l2d_way_sel_c3[13],
                                   tag_l2d_way_sel_c3[15]}));

assign tag_dir_l2way_sel_taghit_c3[1] = misbuf_hit_st_dep_zero_qual ? 
                               (|({way_sel_unqual_c3[2],
                                   way_sel_unqual_c3[3],
                                   way_sel_unqual_c3[6],
                                   way_sel_unqual_c3[7],
                                   way_sel_unqual_c3[10],
                                   way_sel_unqual_c3[11],
                                   way_sel_unqual_c3[14],
                                   way_sel_unqual_c3[15]})) : 
                               (|({tag_l2d_way_sel_c3[2],
                                   tag_l2d_way_sel_c3[3],
                                   tag_l2d_way_sel_c3[6],
                                   tag_l2d_way_sel_c3[7],
                                   tag_l2d_way_sel_c3[10],
                                   tag_l2d_way_sel_c3[11],
                                   tag_l2d_way_sel_c3[14],
                                   tag_l2d_way_sel_c3[15]})); 

assign tag_dir_l2way_sel_taghit_c3[2] = misbuf_hit_st_dep_zero_qual ? 
                               (|({way_sel_unqual_c3[4],
                                   way_sel_unqual_c3[5],
                                   way_sel_unqual_c3[6],
                                   way_sel_unqual_c3[7],
                                   way_sel_unqual_c3[12],
                                   way_sel_unqual_c3[13],
                                   way_sel_unqual_c3[14],
                                   way_sel_unqual_c3[15]})) : 
                               (|({tag_l2d_way_sel_c3[4],
                                   tag_l2d_way_sel_c3[5],
                                   tag_l2d_way_sel_c3[6],
                                   tag_l2d_way_sel_c3[7],
                                   tag_l2d_way_sel_c3[12],
                                   tag_l2d_way_sel_c3[13],
                                   tag_l2d_way_sel_c3[14],
                                   tag_l2d_way_sel_c3[15]})); 


assign tag_dir_l2way_sel_taghit_c3[3] = misbuf_hit_st_dep_zero_qual ? 
                               (|({way_sel_unqual_c3[8],
                                   way_sel_unqual_c3[9],
                                   way_sel_unqual_c3[10],
                                   way_sel_unqual_c3[11],
                                   way_sel_unqual_c3[12],
                                   way_sel_unqual_c3[13],
                                   way_sel_unqual_c3[14],
                                   way_sel_unqual_c3[15]})) : 
                               (|({tag_l2d_way_sel_c3[8],
                                   tag_l2d_way_sel_c3[9],
                                   tag_l2d_way_sel_c3[10],
                                   tag_l2d_way_sel_c3[11],
                                   tag_l2d_way_sel_c3[12],
                                   tag_l2d_way_sel_c3[13],
                                   tag_l2d_way_sel_c3[14],
                                   tag_l2d_way_sel_c3[15]})); 
// BS 04/14/04 :
// In case of Imiss , since the imiss will cam d$ DIR over 2 back to back cycles, we need to preserve 
// filbuf_tag_evict_way_c3 for 2 cycles and need to hold filbuf_tag_hit_c3 high over 2 back to back cycles
// this is done by oring filbuf_tag_hit_c2 with imiss_vld_c3&filbuf_tag_hit_c3 to create filbuf_tag_hit_c3
// and by using imiss_vld_c3 to register filbuf_tag_evict_way_c3 into filbuf_tag_evict_way_c4

assign filbuf_tag_hit_c3_tmp = filbuf_tag_hit_c2 | (imiss_vld_c3 & filbuf_tag_hit_c3);
assign filbuf_tag_evict_way_c4_in = ({imiss_vld_c3,imiss_vld_c3,imiss_vld_c3,imiss_vld_c3} &
                                    filbuf_tag_evict_way_c3[3:0]); 
assign filbuf_tag_evict_way_c3_tmp = imiss_vld_c4 ? filbuf_tag_evict_way_c4[3:0] : filbuf_tag_evict_way_c3[3:0];

l2t_tag_ctl_msff_ctl_macro__width_5 ff_filbuf_tag_evict_way_c4   
              (.din({filbuf_tag_evict_way_c4_in[3:0],imiss_vld_c3}), .l1clk(l1clk),
               .scan_in(ff_filbuf_tag_evict_way_c4_scanin),
               .scan_out(ff_filbuf_tag_evict_way_c4_scanout),
               .dout({filbuf_tag_evict_way_c4[3:0],imiss_vld_c4}),
  .siclk(siclk),
  .soclk(soclk)
);

l2t_tag_ctl_msff_ctl_macro__width_1 ff_filbuf_tag_hit_c3  // BS and SR 12/18/03, LRU way from Filbuf needs to be written to Dir on a Miss
              (.din(filbuf_tag_hit_c3_tmp), .l1clk(l1clk),
               .scan_in(ff_filbuf_tag_hit_c3_scanin),
               .scan_out(ff_filbuf_tag_hit_c3_scanout),
               .dout(filbuf_tag_hit_c3),
  .siclk(siclk),
  .soclk(soclk)  
);



// BS and SR 12/22/03 , brought out evict way separately to mux for DIr L2 way
assign evict_sel_c3 = (evict_unqual_vld_c3 & ~tagdp_tag_par_err_c3 & ~arb_vuad_ce_err_c3);
assign hit_sel_c3 = ~(evict_sel_c3 | filbuf_tag_hit_c3);
assign tagdp_lru_way_sel_enc_c3[0] = |({tagdp_lru_way_sel_c3[1],
                                   tagdp_lru_way_sel_c3[3],
                                   tagdp_lru_way_sel_c3[5],
                                   tagdp_lru_way_sel_c3[7],
                                   tagdp_lru_way_sel_c3[9],
                                   tagdp_lru_way_sel_c3[11],
                                   tagdp_lru_way_sel_c3[13],
                                   tagdp_lru_way_sel_c3[15]});

assign tagdp_lru_way_sel_enc_c3[1] = |({tagdp_lru_way_sel_c3[2],
                                   tagdp_lru_way_sel_c3[3],
                                   tagdp_lru_way_sel_c3[6],
                                   tagdp_lru_way_sel_c3[7],
                                   tagdp_lru_way_sel_c3[10],
                                   tagdp_lru_way_sel_c3[11],
                                   tagdp_lru_way_sel_c3[14],
                                   tagdp_lru_way_sel_c3[15]});

assign tagdp_lru_way_sel_enc_c3[2] = |({tagdp_lru_way_sel_c3[4],
                                   tagdp_lru_way_sel_c3[5],
                                   tagdp_lru_way_sel_c3[6],
                                   tagdp_lru_way_sel_c3[7],
                                   tagdp_lru_way_sel_c3[12],
                                   tagdp_lru_way_sel_c3[13],
                                   tagdp_lru_way_sel_c3[14],
                                   tagdp_lru_way_sel_c3[15]});

assign tagdp_lru_way_sel_enc_c3[3] = |({tagdp_lru_way_sel_c3[8],
                                   tagdp_lru_way_sel_c3[9],
                                   tagdp_lru_way_sel_c3[10],
                                   tagdp_lru_way_sel_c3[11],
                                   tagdp_lru_way_sel_c3[12],
                                   tagdp_lru_way_sel_c3[13],
                                   tagdp_lru_way_sel_c3[14],
                                   tagdp_lru_way_sel_c3[15]});
// BS and SR 12/22/03 , brought out evict way separately to mux for DIr L2 way

l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_tag_dir_l2way_sel_c3 
                           // BS and SR 12/18/03, LRU way from Filbuf needs to be written to Dir on a Miss
                (.dout (tag_dir_l2way_sel_c3[3:0]),
                                .din0(filbuf_tag_evict_way_c3_tmp[3:0]), // LRU way from Filbuf on a load/iftech miss
                                .din1(tagdp_lru_way_sel_enc_c3[3:0]), // Evict way for an eviction
                       // BS and SR 12/22/03 , brought out evict way separately to mux for DIr L2 way
                                .din2(tag_dir_l2way_sel_taghit_c3[3:0]), // Tag hit way from Tag array on a Load hit
                                .sel0(filbuf_tag_hit_c3),
                                .sel1(evict_sel_c3),
                                .sel2(hit_sel_c3));


l2t_tag_ctl_msff_ctl_macro__width_4 ff_tag_dir_l2way_sel_c4  // BS and SR 11/18/03 Reverse Directory change
                           (.din(tag_dir_l2way_sel_c3[3:0]), .l1clk(l1clk),
               .scan_in(ff_tag_dir_l2way_sel_c4_scanin),
               .scan_out(ff_tag_dir_l2way_sel_c4_scanout),
               .dout(tag_dir_l2way_sel_c4[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
);


 
 
 
 
 
////////////////////////////////////////////////////////////////////// 
// MISS condition for miss buffer insertion. 
// tag miss is high  if all  the following conditions are true. 
// - no tag match 
// - NOT an interrupt or invalidate instruction. 
// - NOT a diagnostic instruction 
// - NOT a tecc instruction 
// - NOT a cas2 from the xbar. 
// 
// The tag_miss_unqual_c2 is also qualified with the  
// tag_rdma_reg_vld_c2 for a arb_decdp_wr64_inst_c2 so that 
// we do not "complete" a wr64 miss when it actually encounters 
// rdma_reg_vld = 1 
//  
// The tag_miss_unqual_c2 is only gated off by a wr64 rdma instruction 
// and not by ld64 or wr8 because in those cases tag_miss_unqual_c2 is 
// not used as a completion condition but to make a request to  
// DRAM 
////////////////////////////////////////////////////////////////////// 
 
assign	 waysel_match_c2 = |( tag_way_sel_c2 & vlddir_vuad_valid_c2 ) ; 
 
assign	 tag_miss_unqual_c2 = (~waysel_match_c2 | l2_bypass_mode_on_d1) &	// no way sel match 
			      ~( rdma_reg_vld & arb_decdp_wr64_inst_c2 )  // not a wr64 with rdma_reg_vld
				& arb_waysel_gate_c2   ;  // int 5.0 changes
 
 
////////////////////////////////////////////////////////////////////// 
// A version of tag_miss* that is not gated off by  
// the tag_rdma_reg_vld_c2 signal. This is used  
// to indicate  "what could have been" if the  rdma_reg_vld  
// was 0. 
////////////////////////////////////////////////////////////////////// 
 
 
assign	alt_tag_miss_unqual_c2 = (~waysel_match_c2 |  
					l2_bypass_mode_on_d1)      // no way sel match 
					 & arb_waysel_gate_c2; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_alt_tag_miss_unqual_c3 
                           (.din(alt_tag_miss_unqual_c2), .l1clk(l1clk), 
                    .scan_in(ff_alt_tag_miss_unqual_c3_scanin),
                    .scan_out(ff_alt_tag_miss_unqual_c3_scanout),
                    .dout(tag_alt_tag_miss_unqual_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
///////////////////////////////////////////////////////////////////// 
// HIT logic 
// hit way vld is qualified with ~l2_bypass_mode_on_d1  
// for generating the hit signal. 
// tag_hit_unqual_c2 is used to delete an instruction from the mbf. 
//  
////////////////////////////////////////////////////////////////////// 
 
assign	tag_hit_unqual_c2 = waysel_match_c2  & arb_waysel_gate_c2 & 
				 ~tag_rdma_gate_off_c2_internal & 
				~l2_bypass_mode_on_d1; 
	 
assign	tag_hit_c2 =  tag_hit_unqual_c2  & vld_mbf_miss_c2 ; 
 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_hit_c3 
                           (.din(tag_hit_c2), .l1clk(l1clk), 
                      .scan_in(ff_tag_hit_c3_scanin),
                      .scan_out(ff_tag_hit_c3_scanout),
                      .dout(tag_hit_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// same as the expression for filbuf_hit_c2 in filbuf. 
 
assign	tag_fb_hit_c2 = filbuf_tag_hit_frm_mb_c2 & ~tag_rdma_gate_off_c2_internal; 
 
assign	tag_hit_l2orfb_c2 = ( tag_hit_c2 | tag_fb_hit_c2 ) ; 
 
 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_hit_l2orfb_c3 
                           (.din(tag_hit_l2orfb_c2), .l1clk(l1clk), 
                    .scan_in(ff_tag_hit_l2orfb_c3_scanin),
                    .scan_out(ff_tag_hit_l2orfb_c3_scanout),
                    .dout(tag_hit_l2orfb_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 


 
/////////////////////////////////////// 
// If an rdma instruction hitting the  
// $ is not able to complete because 
// of tag_rdma_gate_off_c2_internal being ON 
// that instruction will be inserted in 
// the Miss Buffer and readied in C7. 
// 
// - The insertion condition is taken  
// care off by looking at rdma_reg_vld & rdma_inst 
/////////////////////////////////////// 
 
 
assign	alt_tag_hit_unqual_c2 = waysel_match_c2  & arb_waysel_gate_c2 & 
				~l2_bypass_mode_on_d1; 
 
assign	tag_hit_not_comp_c2 =  (( alt_tag_hit_unqual_c2 &   
					vld_mbf_miss_c2  ) |  
				filbuf_tag_hit_frm_mb_c2) & 
				tag_rdma_gate_off_c2_internal ; 
					 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_hit_not_comp_c3 
                           (.din(tag_hit_not_comp_c2), .l1clk(l1clk), 
                    .scan_in(ff_tag_hit_not_comp_c3_scanin),
                    .scan_out(ff_tag_hit_not_comp_c3_scanout),
                    .dout(tag_hit_not_comp_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 
/////////////////////////////////////// 
// ** eviction way recorded in the  
// Miss Buffer and used for a Fill. 
//////////////////////////////////////// 
 
assign	encoded_lru_way_c3[0] = ( tagdp_lru_way_sel_c3[1] | tagdp_lru_way_sel_c3[3] | tagdp_lru_way_sel_c3[5] | 
				tagdp_lru_way_sel_c3[7] | tagdp_lru_way_sel_c3[9] | tagdp_lru_way_sel_c3[11]  |
				tagdp_lru_way_sel_c3[13] | tagdp_lru_way_sel_c3[15] ) ; 

assign	encoded_lru_way_c3[1] = ( tagdp_lru_way_sel_c3[2] | tagdp_lru_way_sel_c3[3] | tagdp_lru_way_sel_c3[6] | 
				tagdp_lru_way_sel_c3[7] | tagdp_lru_way_sel_c3[10] | tagdp_lru_way_sel_c3[11] |
				tagdp_lru_way_sel_c3[14] | tagdp_lru_way_sel_c3[15] ); 

assign	encoded_lru_way_c3[2] = ( tagdp_lru_way_sel_c3[4] | tagdp_lru_way_sel_c3[5] | tagdp_lru_way_sel_c3[6] | 
				tagdp_lru_way_sel_c3[7] | tagdp_lru_way_sel_c3[12] | tagdp_lru_way_sel_c3[13] | 
				tagdp_lru_way_sel_c3[14] | tagdp_lru_way_sel_c3[15]) ;  

assign	encoded_lru_way_c3[3] = ( tagdp_lru_way_sel_c3[8] | tagdp_lru_way_sel_c3[9] | tagdp_lru_way_sel_c3[10] | 
				tagdp_lru_way_sel_c3[11] | tagdp_lru_way_sel_c3[12] | tagdp_lru_way_sel_c3[13] | 
                                tagdp_lru_way_sel_c3[14] | tagdp_lru_way_sel_c3[15] ) ; 
 
l2t_tag_ctl_msff_ctl_macro__width_4 ff_encoded_lru_c4 
                           (.din(encoded_lru_way_c3[3:0]), .l1clk(l1clk), 
                     .scan_in(ff_encoded_lru_c4_scanin),
                     .scan_out(ff_encoded_lru_c4_scanout),
                     .dout(tag_lru_way_c4[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
////////////////////////////////////////////////////////////////////// 
// COL OFFSET LOGIC 
// col offset(16B bank accessed ) is dependent on the instruction in the pipe as shown  
// * bist col offset in C1 
// * diagnostic data access in C2 
// * deccck scrub access. 
// * col offset of an imiss 2nd packet 
// * fill  
// * evict 
// * col offset of the valid instruction in C2. 
////////////////////////////////////////////////////////////////////// 
 
l2t_tag_ctl_msff_ctl_macro__width_2 ff_addr5to4_c2 
                           (.din(arbadr_arbdp_addr5to4_c1[1:0]), .l1clk(l1clk), 
                    .scan_in(ff_addr5to4_c2_scanin),
                    .scan_out(ff_addr5to4_c2_scanout),
                    .dout(addr5to4_c2[1:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_2 mux_mux1_col_c1 
		(.dout (mux1_col_offset_c1[1:0]), // bist or diagnostic col. 
                               	.din0(bist_data_waddr_c1[3:2]), // bist data 
				.din1(addr5to4_c2[1:0]), // diagnostic 16B address. 
                               	.sel0(bist_data_enable_c1),  
				.sel1(~bist_data_enable_c1)); 
 
l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_2 mux_mux2_col_c1 
		(.dout (mux2_col_offset_c1[1:0]), // bist/diagnostic or scrub col. 
                               	.din0(mux1_col_offset_c1[1:0]), // bist or diag col 
				.din1(scrub_addr_cnt[2:1]), // scrub 
                               	.sel0(~data_array_acc_active_c1), //  no scrub access 
				.sel1(data_array_acc_active_c1)); 
 
 
l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_2 mux_mux3_col_c1 
		(.dout (mux3_col_offset_c1[1:0]), // bist/diag/scrub  or imiss 2nd pckt col. 
                               	.din0(mux2_col_offset_c1[1:0]), // bist/diag/scrub 
				.din1({addr5to4_c2[1],1'b1}), // imiss 2nd packt 
                               	.sel0(~arb_imiss_vld_c2), // default 
				.sel1(arb_imiss_vld_c2));  // imiss 2nd packet active. 
 
 
assign	qual_col_offset_c1 = ( arb_imiss_vld_c2 |  
				arb_bist_or_diag_acc_c1 | 
				data_array_acc_active_c1 ) ; 
 
assign	dec_col_offset_prev_c1[0] = ((( mux3_col_offset_c1[1:0] == 2'b00 ) & qual_col_offset_c1 ) |  
				fill_vld_c3 | tag_rdmard_vld_c2 | arb_evict_vld_c2); 

assign	dec_col_offset_prev_c1[1] = ( ( mux3_col_offset_c1[1:0] == 2'b01 ) & qual_col_offset_c1 ) | 
				fill_vld_c3 | 
				tag_rdmard_vld_c2 | 
                                arb_evict_vld_c2 ; 
assign	dec_col_offset_prev_c1[2] =  ( ( mux3_col_offset_c1[1:0] == 2'b10 ) & qual_col_offset_c1 ) | 
				fill_vld_c3 | 
				tag_rdmard_vld_c2 | 
                                arb_evict_vld_c2 ; 
assign	dec_col_offset_prev_c1[3] = ( ( mux3_col_offset_c1[1:0] == 2'b11 ) & qual_col_offset_c1 ) | 
				fill_vld_c3 | 
				tag_rdmard_vld_c2 | 
                                arb_evict_vld_c2 ; 
 
assign	dec_col_offset_c2[0] = ( addr5to4_c2[1:0] == 2'd0 ); 
assign	dec_col_offset_c2[1] = ( addr5to4_c2[1:0] == 2'd1 ); 
assign	dec_col_offset_c2[2] = ( addr5to4_c2[1:0] == 2'd2 ); 
assign	dec_col_offset_c2[3] = ( addr5to4_c2[1:0] == 2'd3 ); 
 
l2t_tag_ctl_msff_ctl_macro__width_4 ff_dec_col_offset_prev_c2 
                           (.din(dec_col_offset_prev_c1[3:0]), .l1clk(l1clk),  
			  .scan_in(ff_dec_col_offset_prev_c2_scanin),
			  .scan_out(ff_dec_col_offset_prev_c2_scanout),
			  .dout(col_offset_dec_prev_c2[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
//msff_ctl_macro ff_bist_data_enable_c2 (width=1)
//                           (.din(bist_data_enable_c1), .l1clk(l1clk),  
//			  .scan_in(ff_bist_data_enable_c2_scanin),
//			  .scan_out(ff_bist_data_enable_c2_scanout),
//			  .dout(bist_data_enable_c2),  
//); 
//// 
//msff_ctl_macro ff_arb_inst_vld_c2 (width=1)
//                           (.din(arb_inst_vld_c2_prev), .l1clk(l1clk),
//                          .scan_in(ff_arb_inst_vld_c2_scanin),
//                          .scan_out(ff_arb_inst_vld_c2_scanout),
//                          .dout(arb_inst_vld_c2),
//);
//
//
 
 
//assign	col_offset_sel_c2 = arb_coloff_inst_vld_c2 & ~bist_data_enable_c2 ; 

assign  col_offset_sel_c1 = arb_inst_vld_c2_prev & ~bist_data_enable_c1;
//assign  col_offset_sel_c1_n = ~col_offset_sel_c1;


l2t_tag_ctl_msff_ctl_macro__width_1 ff_col_offset_sel_c2 
                           (.din(col_offset_sel_c1), .l1clk(l1clk),
                          .scan_in(ff_col_offset_sel_c2_scanin),
                          .scan_out(ff_col_offset_sel_c2_scanout),
                          .dout(col_offset_sel_c2),
  .siclk(siclk),
  .soclk(soclk)
);
 
// Big  Endian to Little Endian conversion  
// required to match data array implementation. 
// 
//mux_ctl_macro mux_mux4_col_c2 (width=4,ports=2,mux=aonpe)
//		(.dout ({tag_l2d_col_offset_c2[0], 
//			tag_l2d_col_offset_c2[1], 
//			tag_l2d_col_offset_c2[2], 
//			tag_l2d_col_offset_c2[3]}), 
//                       	.din0(col_offset_dec_prev_c2[3:0]), // prev instruc col offset 
//			.din1(dec_col_offset_c2[3:0]), // current instruction col offset 
//                      	.sel0(~col_offset_sel_c2), // sel prev instruc. 
//			.sel1(col_offset_sel_c2));  // sel current instruction 
// arb_data_diag_st_c2

//need to drive the col offset in the desired cycle since 
// data array then locks the col offset.

//assign col_offset_sel_c2_fnl = col_offset_sel_c2 & ~(arb_data_diag_st_c2 | arb_evict_vld_c2 );
//assign col_offset_sel_c2_fnl = col_offset_sel_c2 & ~(arb_data_diag_st_c2 | arb_fill_vld_c2);


assign col_offset_sel_c2_fnl = col_offset_sel_c2 ;

assign col_offset_sel_c2_fnl_n = ~col_offset_sel_c2_fnl;


l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_mux4_col_c2 
                (.dout ({tag_l2d_col_offset_c2[0],
                        tag_l2d_col_offset_c2[1],
                        tag_l2d_col_offset_c2[2],
                        tag_l2d_col_offset_c2[3]}),
                        .din0(col_offset_dec_prev_c2[3:0]), // prev instruc col offset
                        .din1(dec_col_offset_c2[3:0]), // current instruction col offset
                        .sel0(col_offset_sel_c2_fnl_n), // sel prev instruc.
                        .sel1(col_offset_sel_c2_fnl));  // sel current instruction


 
////////////////////////////////////////// 
// hold the prev value if col_offset is non-one hot. 
// This logic is not necessary since l2d uses a default int 5.0 changes
////////////////////////////////////////// 
// 
//mux_ctl_macro mux_tmp_col_c2 (width=4,ports=2,mux=aonpe)
//		(.dout (tmp_col_offset_c2[3:0]), // col offset 
//                       	.din0(col_offset_dec_prev_c2[3:0]), // prev instruc col offset 
//			.din1(dec_col_offset_c2[3:0]), // current instruction col offset 
//                      	.sel0(~arb_wen_inst_vld_c2), // sel prev instruc. 
//			.sel1(arb_wen_inst_vld_c2));  // sel current instruction 
// 
//assign	data_hold_c2 = (&(tmp_col_offset_c2)) | 
//			~(|(tmp_col_offset_c2))  ; 
// 
//msff_ctl_macro ff_hold_c3_l (width=1)
//                           (.din(data_hold_c2), .l1clk(l1clk), 
//                    .dout(tag_l2d_hold_c3),  
//		.scan_in(), 
//		.scan_out()
//); 
// 
// 
// 
// 
/////////////////////////////////////////////////////////////////// 
// tag_spc_rd_vld_c7 is asserted to indicate to decc that  
// a sparc read is active and that any error that is detected in the 
// data needs to be reported as an L2 read error. 
/////////////////////////////////////////////////////////////////// 
 
assign	imiss_tag_hit_c3 = imiss_vld_c3 & tag_hit_c3 ; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_imiss_tag_hit_c4 
                           (.din(imiss_tag_hit_c3), .l1clk(l1clk), 
                           .scan_in(ff_imiss_tag_hit_c4_scanin),
                           .scan_out(ff_imiss_tag_hit_c4_scanout),
                           .dout(imiss_tag_hit_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__dmsff_32x__width_2 ff_rdma_inst_c2 
                           (.din({2{arbdec_arbdp_rdma_inst_c1}}), .l1clk(l1clk), 
                           .scan_in(ff_rdma_inst_c2_scanin),
                           .scan_out(ff_rdma_inst_c2_scanout),
                           .dout({rdma_inst_c2_cloned,rdma_inst_c2}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_rdma_inst_c3 
                           (.din(rdma_inst_c2), .l1clk(l1clk), 
                           .scan_in(ff_rdma_inst_c3_scanin),
                           .scan_out(ff_rdma_inst_c3_scanout),
                           .dout(rdma_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 

 ///////////////////////
 // ECO fix for bug#5085.
 // the signal ff_tagctl_st_to_data_array_c3
 // is used only in vuaddp_ctl to set the
 // dirty bit in the VUAD. A partial store
 // that encounters an uncorrectable error during 
 // its read, should set the dirty bit in the VUAD
 // eventhough the write is disabled.
 ///////////////////////
 
 assign        dirty_bit_set_c2 = st_to_data_array_c2 | pst_with_ctrue_c2 ;

 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_st_to_data_array_c3 
                           (.din(dirty_bit_set_c2),  
		   .scan_in(ff_st_to_data_array_c3_scanin),
		   .scan_out(ff_st_to_data_array_c3_scanout),
		   .l1clk(l1clk), .dout(st_to_data_array_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// sparc rd vld is asserted for assertion of sparc errors detected in 
// the decc datapath. 
// A rd is valid if  
// * C3 tag hit and rd is high for a non-rdma, non-pst with ctrue, non cas2 from mb 
//   instruction 
// * C4 tag hit for an imiss instruction. 
// 
// A pst with ctrue ( or a cas2 from mb ) instruction will cause a rd to the $   
// only if the earlier 
// read detected an error. Hence, there is no need to detect another error on 
// its second pass. 
 
// tag_spc_rd_cond_c3 is used by filbuf to assert  
// errors in OFF mode when a PST, SWAP or CAS2 hits 
// the fill buffer and detects an ERROR. 
// Read bug#3116. 
 
assign	tag_spc_rd_cond_c3 = ~pst_with_ctrue_c3 &  
			 ~cas2_from_mb_c3 &  
			 ~st_to_data_array_c3 & 
			 ~rdma_inst_c3 ; 
 
 
assign	tag_spc_rd_vld_c3 =   
			( tag_hit_c3 & // hitting the $ 
			tag_spc_rd_cond_c3) | imiss_tag_hit_c4 ; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_spc_rd_vld_c4 
                           (.din(tag_spc_rd_vld_c3), .l1clk(l1clk), 
                           .scan_in(ff_tag_spc_rd_vld_c4_scanin),
                           .scan_out(ff_tag_spc_rd_vld_c4_scanout),
                           .dout(tag_spc_rd_vld_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_spc_rd_vld_c5 
                           (.din(tag_spc_rd_vld_c4), .l1clk(l1clk), 
                           .scan_in(ff_tag_spc_rd_vld_c5_scanin),
                           .scan_out(ff_tag_spc_rd_vld_c5_scanout),
                           .dout(tag_spc_rd_vld_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
// BS 03/11/04 extra cycle for mem access
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_spc_rd_vld_c52 
                           (.din(tag_spc_rd_vld_c5), .l1clk(l1clk),
                           .scan_in(ff_tag_spc_rd_vld_c52_scanin),
                           .scan_out(ff_tag_spc_rd_vld_c52_scanout),
                           .dout(tag_spc_rd_vld_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_spc_rd_vld_c6 
                           (.din(tag_spc_rd_vld_c52), .l1clk(l1clk), 
                           .scan_in(ff_tag_spc_rd_vld_c6_scanin),
                           .scan_out(ff_tag_spc_rd_vld_c6_scanout),
                           .dout(tag_spc_rd_vld_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_spc_rd_vld_c7 
                           (.din(tag_spc_rd_vld_c6), .l1clk(l1clk), 
                           .scan_in(ff_tag_spc_rd_vld_c7_scanin),
                           .scan_out(ff_tag_spc_rd_vld_c7_scanout),
                           .dout(tag_spc_rd_vld_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
/////////////////////////////////////////////////////////////////// 
// tag_bsc_rd_vld_c7 is asserted to indicate to decc that  
// a bsc(wr8) read is active and that any error that is detected in the 
// data needs to be reported as an L2 read error. 
/////////////////////////////////////////////////////////////////// 
 
// A Wr8 with ctrue instruction will cause a rd to the $   
// only if the earlier 
// read detected an error. Hence, there is no need to detect another error on 
// its second pass. 
 
assign	tag_bsc_rd_vld_c3 = ( tag_hit_c3 & // hitting the $ 
		   	~st_to_data_array_c3 &  
			~pst_with_ctrue_c3 & 
			wr8_inst_c3 ) ;   
 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_bsc_rd_vld_c4 
                           (.din(tag_bsc_rd_vld_c3), .l1clk(l1clk), 
                           .scan_in(ff_tag_bsc_rd_vld_c4_scanin),
                           .scan_out(ff_tag_bsc_rd_vld_c4_scanout),
                           .dout(tag_bsc_rd_vld_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_bsc_rd_vld_c5 
                           (.din(tag_bsc_rd_vld_c4), .l1clk(l1clk), 
                           .scan_in(ff_tag_bsc_rd_vld_c5_scanin),
                           .scan_out(ff_tag_bsc_rd_vld_c5_scanout),
                           .dout(tag_bsc_rd_vld_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
// BS 03/11/04 extra cycle for mem access
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_bsc_rd_vld_c52 
                           (.din(tag_bsc_rd_vld_c5), .l1clk(l1clk),
                           .scan_in(ff_tag_bsc_rd_vld_c52_scanin),
                           .scan_out(ff_tag_bsc_rd_vld_c52_scanout),
                           .dout(tag_bsc_rd_vld_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_bsc_rd_vld_c6 
                           (.din(tag_bsc_rd_vld_c52), .l1clk(l1clk), 
                           .scan_in(ff_tag_bsc_rd_vld_c6_scanin),
                           .scan_out(ff_tag_bsc_rd_vld_c6_scanout),
                           .dout(tag_bsc_rd_vld_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_bsc_rd_vld_c7 
                           (.din(tag_bsc_rd_vld_c6), .l1clk(l1clk), 
                           .scan_in(ff_tag_bsc_rd_vld_c7_scanin),
                           .scan_out(ff_tag_bsc_rd_vld_c7_scanout),
                           .dout(tag_bsc_rd_vld_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 
					 
////////////////////////////////////////// 
// Read Write logic. 
// Write is set for the following instr. 
// * Fill,  
// * diagnostic store. 
// * data scrub write 
// * bist write. 
// * normal write in C2. 
////////////////////////////////////////// 
//msff_ctl_macro ff_decdp_tag_wr_c2 (width=1)
//                           (.din(arb_decdp_tag_wr_c1), .l1clk(l1clk), 
//                    .scan_in(ff_decdp_tag_wr_c2_scanin),
//                    .scan_out(ff_decdp_tag_wr_c2_scanout),
//                    .dout(tag_wr_c2),  
//); 
 
assign	prev_rd_wr_c1 = mbist_run_r1_n ? (fill_vld_c3 | // fill instruction vld 
		arb_data_diag_st_c2  | // diagnostic store 
		( data_array_wr_active_c1 & ~scrub_wr_disable_c9 )) : // scrub write operation 
		bist_data_wr_enable_c1 ; // bist wr. 
 
//
//msff_ctl_macro ff_decdp_cas2_from_mb_ctrue_c2 (width=1)
//                (.din(decdp_cas2_from_mb_ctrue_c1), .l1clk(l1clk),
//                .scan_in(ff_decdp_cas2_from_mb_ctrue_c2_scanin),
//                .scan_out(ff_decdp_cas2_from_mb_ctrue_c2_scanout),
//                .dout(arb_decdp_cas2_from_mb_ctrue_c2),
//);
//
//
l2t_tag_ctl_msff_ctl_macro__width_1 ff_prev_rd_wr_c2 
                           (.din(prev_rd_wr_c1), .l1clk(l1clk), 
		    .scan_in(ff_prev_rd_wr_c2_scanin),
		    .scan_out(ff_prev_rd_wr_c2_scanout),
		    .dout(prev_rd_wr_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_pst_with_ctrue_c2 
                           (.din(arb_tag_pst_with_ctrue_c1), .l1clk(l1clk), 
		    .scan_in(ff_pst_with_ctrue_c2_scanin),
		    .scan_out(ff_pst_with_ctrue_c2_scanout),
		    .dout(pst_with_ctrue_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// (i)in case of uncorr/notdata err on the data read for a cas1, ctrue bit gets turned off in l2t_misbuf_ctl.sv
// this turns off pst_with_ctrue_c2 as arb_tag_pst_with_ctrue_c1 depends on 
// arbdec_arbdp_inst_ctrue_c1 ( which will be forced to 0). The write is disabled through all terms in the
// equation. Note that a corr error on a cas1 will not turn off the Ctrue bit.
// (ii)in case of uncorr/notdata err on a swap, the write is disabled by misbuf_uncorr_err_c2. The write is not disabled on corr
//  error for a swap. 
// (iii) in case of uncorr/notdata error on a regular store, the write is disabled. The write is not disabled on corr
//  error for a regular store. 


assign misbuffer_errors_c1 = (misbuf_uncorr_err_c1 | misbuf_notdata_err_c1);



assign other_term_c2_prev = mbist_run_r1_n ? (( arb_decdp_tag_wr_c1  | // non diagnostic, non partial st.
                 decdp_cas2_from_mb_ctrue_c1  | // cas2 pass
      ( arb_tag_pst_with_ctrue_c1 & ~misbuffer_errors_c1 )) & ~arb_inst_diag_c1) : 1'b0;

//assign mb_error_c1 = misbuffer_errors_c1 & ~decdp_ic_dc_inval_inst_c1;


l2t_tag_ctl_msff_ctl_macro__width_2 ff_mb_errs_c2 
                           (.din({other_term_c2_prev,arb_inst_diag_c1}), .l1clk(l1clk),
                    .scan_in(ff_mb_errs_c2_scanin),
                    .scan_out(ff_mb_errs_c2_scanout),
                    .dout({other_term_c2,arb_inst_diag_c2}),
  .siclk(siclk),
  .soclk(soclk)
);
//assign 	tag_l2d_rd_wr_c2 =  ~prev_rd_wr_c2  &  
//				 ~( 
//				(
//			( tag_wr_c2 ) | // non diagnostic, non partial st. 
//                ( arb_decdp_cas2_from_mb_ctrue_c2 ) | // cas2 pass 
//	( pst_with_ctrue_c2 & ~misbuffer_errors_c2_fnl )) & // swap/ldstub update pass, store 2nd pass 
//                arb_rdwr_inst_vld_c2 &  // instruction vld in C2 
//                ~arb_inst_diag_c2 )  ; 
// 

assign        tag_l2d_rd_wr_c2 =  ~prev_rd_wr_c2  &
~( other_term_c2 & arb_rdwr_inst_vld_c2); // & ~arb_inst_diag_c2);
			  






////////////////////////////////////////// 
// tag_st_to_data_array_c2 logic  
// indicates that a C2 instruction is  
// going to write into the L2 data array. 
////////////////////////////////////////// 
 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_prev_rd_wr_c2_1 
                           (.din(prev_rd_wr_c1), .l1clk(l1clk), 
		    .scan_in(ff_prev_rd_wr_c2_1_scanin),
		    .scan_out(ff_prev_rd_wr_c2_1_scanout),
		    .dout(prev_rd_wr_c2_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	st_to_data_array_c2 = ~tag_l2d_rd_wr_c2 & ~prev_rd_wr_c2_1 ; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_st_to_data_array_c3 
                           (.din(st_to_data_array_c2), .l1clk(l1clk), 
		    .scan_in(ff_tag_st_to_data_array_c3_scanin),
		    .scan_out(ff_tag_st_to_data_array_c3_scanout),
		    .dout(tag_st_to_data_array_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
////////////////////////////////////////// 
// WORD ENABLE logic. 
////////////////////////////////////////// 
 
 
 assign  bist_word_en_c1[0] = ( bist_data_waddr_c1 == 4'd0 ) ; 
 assign  bist_word_en_c1[1] = ( bist_data_waddr_c1 == 4'd1 ) ; 
 assign  bist_word_en_c1[2] = ( bist_data_waddr_c1 == 4'd2 )  ; 
 assign  bist_word_en_c1[3] = ( bist_data_waddr_c1 == 4'd3 )  ; 
 assign  bist_word_en_c1[4] = ( bist_data_waddr_c1 == 4'd4 )  ; 
 assign  bist_word_en_c1[5] = ( bist_data_waddr_c1 == 4'd5 )  ; 
 assign  bist_word_en_c1[6] = ( bist_data_waddr_c1 == 4'd6 )  ; 
 assign  bist_word_en_c1[7] =  ( bist_data_waddr_c1 == 4'd7 ) ; 
 assign  bist_word_en_c1[8] = ( bist_data_waddr_c1 == 4'd8 )  ; 
 assign  bist_word_en_c1[9] =  ( bist_data_waddr_c1 == 4'd9 )  ; 
 assign  bist_word_en_c1[10] =  ( bist_data_waddr_c1 == 4'd10 )  ; 
 assign  bist_word_en_c1[11] =  ( bist_data_waddr_c1 == 4'd11 )  ; 
 assign  bist_word_en_c1[12] =  ( bist_data_waddr_c1 == 4'd12 )  ; 
 assign  bist_word_en_c1[13] =  ( bist_data_waddr_c1 == 4'd13 )  ; 
 assign  bist_word_en_c1[14] =  ( bist_data_waddr_c1 == 4'd14 )  ; 
 assign  bist_word_en_c1[15] =  ( bist_data_waddr_c1 == 4'd15 )  ; 
 
 assign diag_word_en_c2[0] = word_en_c2[0]  & ~arbadr_arbaddr_addr22_c2 ; 
 assign diag_word_en_c2[1] = word_en_c2[1]  & arbadr_arbaddr_addr22_c2 ; 
 assign diag_word_en_c2[2] = word_en_c2[2]  & ~arbadr_arbaddr_addr22_c2 ; 
 assign diag_word_en_c2[3] = word_en_c2[3]  & arbadr_arbaddr_addr22_c2 ; 
 assign diag_word_en_c2[4] = word_en_c2[4]  & ~arbadr_arbaddr_addr22_c2 ; 
 assign diag_word_en_c2[5] = word_en_c2[5]  & arbadr_arbaddr_addr22_c2 ; 
 assign diag_word_en_c2[6] = word_en_c2[6]  & ~arbadr_arbaddr_addr22_c2 ; 
 assign diag_word_en_c2[7] = word_en_c2[7]  & arbadr_arbaddr_addr22_c2 ; 
 assign diag_word_en_c2[8] = word_en_c2[8]  & ~arbadr_arbaddr_addr22_c2 ; 
 assign diag_word_en_c2[9] = word_en_c2[9]  & arbadr_arbaddr_addr22_c2 ; 
 assign diag_word_en_c2[10] = word_en_c2[10]  & ~arbadr_arbaddr_addr22_c2 ; 
 assign diag_word_en_c2[11] = word_en_c2[11]  & arbadr_arbaddr_addr22_c2 ; 
 assign diag_word_en_c2[12] = word_en_c2[12]  & ~arbadr_arbaddr_addr22_c2 ; 
 assign diag_word_en_c2[13] = word_en_c2[13]  & arbadr_arbaddr_addr22_c2 ; 
 assign diag_word_en_c2[14] = word_en_c2[14]  & ~arbadr_arbaddr_addr22_c2 ; 
 assign diag_word_en_c2[15] = word_en_c2[15]  & arbadr_arbaddr_addr22_c2 ; 
 
l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_16 mux_mux1_wen_c1 
		(.dout (mux1_wen_c1[15:0]), // bist or diagnostic wen. 
                               	.din0(bist_word_en_c1[15:0]), // bist wen 
				.din1(diag_word_en_c2[15:0]), // diagnostic word enable. 
                               	.sel0(bist_data_enable_c1),  
				.sel1(~bist_data_enable_c1)); 
 
 assign  data_ecc_wen_c1[0] = ( scrub_addr_cnt[2:0] == 3'd0 ) ; 
 assign  data_ecc_wen_c1[1] = ( scrub_addr_cnt[2:0] == 3'd0 ) ; 
 assign  data_ecc_wen_c1[2] = ( scrub_addr_cnt[2:0] == 3'd1 ) ; 
 assign  data_ecc_wen_c1[3] = ( scrub_addr_cnt[2:0] == 3'd1 ) ; 
 assign  data_ecc_wen_c1[4] = ( scrub_addr_cnt[2:0] == 3'd2 ) ; 
 assign  data_ecc_wen_c1[5] = ( scrub_addr_cnt[2:0] == 3'd2 ) ; 
 assign  data_ecc_wen_c1[6] = ( scrub_addr_cnt[2:0] == 3'd3 ) ; 
 assign  data_ecc_wen_c1[7] =  ( scrub_addr_cnt[2:0] == 3'd3 ) ; 
 assign  data_ecc_wen_c1[8] = ( scrub_addr_cnt[2:0] == 3'd4 ) ; 
 assign  data_ecc_wen_c1[9] =  ( scrub_addr_cnt[2:0] == 3'd4 ) ; 
 assign  data_ecc_wen_c1[10] =  ( scrub_addr_cnt[2:0] == 3'd5 ) ; 
 assign  data_ecc_wen_c1[11] =  ( scrub_addr_cnt[2:0] == 3'd5 ) ; 
 assign  data_ecc_wen_c1[12] =  ( scrub_addr_cnt[2:0] == 3'd6 ) ; 
 assign  data_ecc_wen_c1[13] =  ( scrub_addr_cnt[2:0] == 3'd6 ) ; 
 assign  data_ecc_wen_c1[14] =  ( scrub_addr_cnt[2:0] == 3'd7 ) ; 
 assign  data_ecc_wen_c1[15] =  ( scrub_addr_cnt[2:0] == 3'd7 ) ; 
 
l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_16 mux_mux2_wen_c1 
		(.dout (mux2_wen_c1[15:0]), // bist/diagnostic or scrub wen. 
                               	.din0(mux1_wen_c1[15:0]), // bist or diag wen 
				.din1(data_ecc_wen_c1[15:0]), // scrub 
                               	.sel0(arb_bist_or_diag_acc_c1), // bist or diagnostic access. 
				.sel1(~arb_bist_or_diag_acc_c1)); 
 
 assign	 prev_wen_c1 = ( mux2_wen_c1 | {16{fill_vld_c3}}) ; 
 
l2t_tag_ctl_msff_ctl_macro__width_16 ff_prev_wen_c1 
                           (.din(prev_wen_c1[15:0]), .l1clk(l1clk), 
                    .scan_in(ff_prev_wen_c1_scanin),
                    .scan_out(ff_prev_wen_c1_scanout),
                    .dout(prev_wen_c2[15:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 // The delayed word en  is picked in the following cases 
 // bist_data_enable_c1 
 // diagnostic access c1 
 // data_array_wr_active_c1 
 // fill in C3 
 
 assign	sel_prev_wen_c1 = ( arb_bist_or_diag_acc_c1 | data_array_wr_active_c1 | 
				fill_vld_c3 ) ; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_sel_prev_wen_c2 
                           (.din(sel_prev_wen_c1), .l1clk(l1clk), 
                    .scan_in(ff_sel_prev_wen_c2_scanin),
                    .scan_out(ff_sel_prev_wen_c2_scanout),
                    .dout(sel_prev_wen_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 // Critical in the generation of wenables. 

// BS 05/04/04 : taking out upper_four_byte_access and lower_four_byte_access info to word_en_c2[15:0] gen logic in tag_ctl
// BE's would be used to control word_en_c2 instead of address bit [2].

 assign  dec_word_addr_c1[0] = ( {arbadr_arbdp_addr5to4_c1,arbadr_arbdp_addr3to2_c1[1],arb_lower_four_byte_access_c1} == 4'b0001); 
 assign  dec_word_addr_c1[1] = ( {arbadr_arbdp_addr5to4_c1,arbadr_arbdp_addr3to2_c1[1],arb_upper_four_byte_access_c1} == 4'b0001);
 assign  dec_word_addr_c1[2] = ( {arbadr_arbdp_addr5to4_c1,arbadr_arbdp_addr3to2_c1[1],arb_lower_four_byte_access_c1} == 4'b0011); 
 assign  dec_word_addr_c1[3] = ( {arbadr_arbdp_addr5to4_c1,arbadr_arbdp_addr3to2_c1[1],arb_upper_four_byte_access_c1} == 4'b0011);
 assign  dec_word_addr_c1[4] = ( {arbadr_arbdp_addr5to4_c1,arbadr_arbdp_addr3to2_c1[1],arb_lower_four_byte_access_c1} == 4'b0101); 
 assign  dec_word_addr_c1[5] = ( {arbadr_arbdp_addr5to4_c1,arbadr_arbdp_addr3to2_c1[1],arb_upper_four_byte_access_c1} == 4'b0101);
 assign  dec_word_addr_c1[6] = ( {arbadr_arbdp_addr5to4_c1,arbadr_arbdp_addr3to2_c1[1],arb_lower_four_byte_access_c1} == 4'b0111); 
 assign  dec_word_addr_c1[7] = ( {arbadr_arbdp_addr5to4_c1,arbadr_arbdp_addr3to2_c1[1],arb_upper_four_byte_access_c1} == 4'b0111);
 assign  dec_word_addr_c1[8] = ( {arbadr_arbdp_addr5to4_c1,arbadr_arbdp_addr3to2_c1[1],arb_lower_four_byte_access_c1} == 4'b1001); 
 assign  dec_word_addr_c1[9] = ( {arbadr_arbdp_addr5to4_c1,arbadr_arbdp_addr3to2_c1[1],arb_upper_four_byte_access_c1} == 4'b1001);
 assign  dec_word_addr_c1[10] =( {arbadr_arbdp_addr5to4_c1,arbadr_arbdp_addr3to2_c1[1],arb_lower_four_byte_access_c1} == 4'b1011); 
 assign  dec_word_addr_c1[11] =( {arbadr_arbdp_addr5to4_c1,arbadr_arbdp_addr3to2_c1[1],arb_upper_four_byte_access_c1} == 4'b1011);
 assign  dec_word_addr_c1[12] =( {arbadr_arbdp_addr5to4_c1,arbadr_arbdp_addr3to2_c1[1],arb_lower_four_byte_access_c1} == 4'b1101); 
 assign  dec_word_addr_c1[13] =( {arbadr_arbdp_addr5to4_c1,arbadr_arbdp_addr3to2_c1[1],arb_upper_four_byte_access_c1} == 4'b1101);
 assign  dec_word_addr_c1[14] =( {arbadr_arbdp_addr5to4_c1,arbadr_arbdp_addr3to2_c1[1],arb_lower_four_byte_access_c1} == 4'b1111); 
 assign  dec_word_addr_c1[15] =( {arbadr_arbdp_addr5to4_c1,arbadr_arbdp_addr3to2_c1[1],arb_upper_four_byte_access_c1} == 4'b1111);
 
l2t_tag_ctl_msff_ctl_macro__width_16 ff_dec_word_addr_c2 
                           (.din(word_en_c1[15:0]), .l1clk(l1clk), 
                    .scan_in(ff_dec_word_addr_c2_scanin),
                    .scan_out(ff_dec_word_addr_c2_scanout),
                    .dout(word_en_c2[15:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 assign	word_en_c1[0] = (dec_word_addr_c1[0]) | ( dec_word_addr_c1[1] & arb_arbdp_dword_st_c1 ) ; 
 assign	word_en_c1[1] = (dec_word_addr_c1[1]) | ( dec_word_addr_c1[0] & arb_arbdp_dword_st_c1 ) ; 
 assign	word_en_c1[2] = (dec_word_addr_c1[2]) | ( dec_word_addr_c1[3] & arb_arbdp_dword_st_c1 ) ; 
 assign	word_en_c1[3] = (dec_word_addr_c1[3]) | ( dec_word_addr_c1[2] & arb_arbdp_dword_st_c1 ) ; 
 assign	word_en_c1[4] = (dec_word_addr_c1[4]) | ( dec_word_addr_c1[5] & arb_arbdp_dword_st_c1 ) ; 
 assign	word_en_c1[5] = (dec_word_addr_c1[5]) | ( dec_word_addr_c1[4] & arb_arbdp_dword_st_c1 ) ; 
 assign	word_en_c1[6] = (dec_word_addr_c1[6]) | ( dec_word_addr_c1[7] & arb_arbdp_dword_st_c1 ) ; 
 assign	word_en_c1[7] = (dec_word_addr_c1[7]) | ( dec_word_addr_c1[6] & arb_arbdp_dword_st_c1 ) ; 
 assign	word_en_c1[8] = (dec_word_addr_c1[8]) | ( dec_word_addr_c1[9] & arb_arbdp_dword_st_c1 ) ; 
 assign	word_en_c1[9] = (dec_word_addr_c1[9]) | ( dec_word_addr_c1[8] & arb_arbdp_dword_st_c1 ) ; 
 assign	word_en_c1[10] = (dec_word_addr_c1[10]) | ( dec_word_addr_c1[11] & arb_arbdp_dword_st_c1 ) ; 
 assign	word_en_c1[11] = (dec_word_addr_c1[11]) | ( dec_word_addr_c1[10] & arb_arbdp_dword_st_c1 ) ; 
 assign	word_en_c1[12] = (dec_word_addr_c1[12]) | ( dec_word_addr_c1[13] & arb_arbdp_dword_st_c1 ) ; 
 assign	word_en_c1[13] = (dec_word_addr_c1[13]) | ( dec_word_addr_c1[12] & arb_arbdp_dword_st_c1 ) ; 
 assign	word_en_c1[14] = (dec_word_addr_c1[14]) | ( dec_word_addr_c1[15] & arb_arbdp_dword_st_c1 ) ; 
 assign	word_en_c1[15] = (dec_word_addr_c1[15]) | ( dec_word_addr_c1[14] & arb_arbdp_dword_st_c1 ) ; 


l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_16 mux_word_en_c1 
	(
	.dout	({tag_l2d_word_en_c1[0],
                  tag_l2d_word_en_c1[1],
                  tag_l2d_word_en_c1[2],
                  tag_l2d_word_en_c1[3],
                  tag_l2d_word_en_c1[4],
                  tag_l2d_word_en_c1[5],
                  tag_l2d_word_en_c1[6],
                  tag_l2d_word_en_c1[7],
                  tag_l2d_word_en_c1[8],
                  tag_l2d_word_en_c1[9],
                  tag_l2d_word_en_c1[10],
                  tag_l2d_word_en_c1[11],
                  tag_l2d_word_en_c1[12],
                  tag_l2d_word_en_c1[13],
                  tag_l2d_word_en_c1[14],
                  tag_l2d_word_en_c1[15]}),
	.din0	(word_en_c1[15:0]),
	.din1	(prev_wen_c1[15:0]),
	.sel0	(~sel_prev_wen_c1),
	.sel1	(sel_prev_wen_c1)
	);

// flop tag_l2d_word_en_c1 
l2t_tag_ctl_msff_ctl_macro__dmsff_32x__width_16 ff_dec_word_enable_c2 
        (
	.scan_in(ff_dec_word_enable_c2_scanin),
	.scan_out(ff_dec_word_enable_c2_scanout),
	.din(tag_l2d_word_en_c1[15:0]), 
	.l1clk(l1clk),
        .dout(tag_l2d_word_en_c2[15:0]),
  .siclk(siclk),
  .soclk(soclk)
	);



// word en mux 
//mux_ctl_macro mux_word_en_c2 (width=16,ports=2,mux=aonpe)
//		( .dout ( {tag_l2d_word_en_c2[0], 
//					tag_l2d_word_en_c2[1], 
//					tag_l2d_word_en_c2[2], 
//					tag_l2d_word_en_c2[3], 
//					tag_l2d_word_en_c2[4], 
//					tag_l2d_word_en_c2[5], 
//					tag_l2d_word_en_c2[6], 
//					tag_l2d_word_en_c2[7], 
//					tag_l2d_word_en_c2[8], 
//					tag_l2d_word_en_c2[9], 
//					tag_l2d_word_en_c2[10], 
//					tag_l2d_word_en_c2[11], 
//					tag_l2d_word_en_c2[12], 
//					tag_l2d_word_en_c2[13], 
//					tag_l2d_word_en_c2[14], 
//					tag_l2d_word_en_c2[15]}), 
//  	                    .din0(word_en_c2[15:0]),  
//			    .din1(prev_wen_c2[15:0]), 
//                      	.sel0(~sel_prev_wen_c2),  
//			.sel1(sel_prev_wen_c2)); 




 
l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_16 mux_tmp_word_en_c2 
		( .dout ( tmp_word_en_c2[15:0]), 
  	                    .din0(word_en_c2[15:0]),  
			    .din1(prev_wen_c2[15:0]), 
                      	.sel0(~sel_prev_wen_c2),  
			.sel1(sel_prev_wen_c2)); 
 
 
 
 
 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
// Scrub Pipeline. 
// CSR bit[7]  is used to determine if scrub mode is ON. 
// If so { CSR[19:8], 7FFFF } is the scrub frequency. 
// 
// A Scrub is initiated by a FIll Operation after a scrub period defined above 
// expires. Here's the pipeline. 
// BUG: There is a problem with starting the scrub pipeline when the  
// 
//	C3		 
//----------------------------- 
//	fill 
//	op with 
//	tecc=1 
// 
//	start 
//	scrub fsm 
//	cnt=0		cnt=1 
// 
// 
// SCRUB ADDR COUNTER [6:3] = WAY<3:0> ( when way reaches 15, reset the addr counter ) 
// SCRUB ADDR COUNTER [2:0] = 64b address. 
// BS 07/14/05 : changed Scrub pipeline to take into account C52 stage
//------------------------------------------------------------------------------------------------------------------------ 
// cnt=   2	3	4	5	6	7	8	9	10	11	12	13	14	15	16 
//-------------------------------------------------------------------------------------------------------------------------
// pseudo  
// stage PX2	C1	C2	C3	C4	C5	C52	C6	C7	C8(px2)	C1	c2	C3	C4	C5 
//-------------------------------------------------------------------------------------------------------------------------
// setup 	tagrd	rdout	xmit	rd1	rd2	rd3	xmit	ecc	mux	mux		xmit	wr1	wr2 
// tagrd		valid   scrub				to	corr	out	with 
// with scrub		bit	way				l2t		64b	c1 inst 
// idx 				to						data		 
//		gen		l2d								 
//		way, 									perform		cnt=0  
//		rd									stecc 
//		from									& gen 
//		l2d									waysel 
//											l2d_wr 
//											& col_off 
//			vbit	 
//			& way	v1	v2	v3	v4	v5	v6	v7      v8 
//
//                      scrub   c3      c4      c5      c52     c6      c7
//                      way vld
//
//                      scrub wr                                                c8      c9
//                      disable
//-------------------------------------------------------------------------------------------------------------------------
// 														cnt=1	  2	 
//-------------------------------------------------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tecc_c2 
                           (.din(arbdec_arbdp_tecc_c1), .l1clk(l1clk), 
                    .scan_in(ff_tecc_c2_scanin),
                    .scan_out(ff_tecc_c2_scanout),
                    .dout(arb_tecc_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign        scrub_fsm_reset = ~dbb_rst_l | ( scrub_fsm_cnt[3:0] == 4'b1101) ; // reset cnt on 13 instead of 12 , as we have C52
                                                                                // BS : 07/14/05

 
assign	scrub_fsm_en =  ( (|( scrub_fsm_cnt ))  |  
			 (|(scrub_addr_cnt)) | 
			 ( fill_vld_c3 & tecc_c3 ) // trigger for data scb. 
			)  ; 
 
assign	scrub_fsm_cnt_plus1  = scrub_fsm_cnt + 4'b1 ; 
 
l2t_tag_ctl_msff_ctl_macro__clr_1__en_1__width_4 ff_scrub_fsm_cnt  // sync reset active high
                           (.din(scrub_fsm_cnt_plus1[3:0]), 
                 .scan_in(ff_scrub_fsm_cnt_scanin),
                 .scan_out(ff_scrub_fsm_cnt_scanout),
                 .en(scrub_fsm_en), .l1clk(l1clk), .clr(scrub_fsm_reset), 
                 .dout(scrub_fsm_cnt[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	scrub_addr_reset = ~dbb_rst_l | //~dbginit_l  | 
//		 (( scrub_addr_cnt[6:0] == 7'b1011_111 )  & 
		 (( scrub_addr_cnt[6:0] == 7'b1111_111 )  & 
			( scrub_fsm_cnt[3:0] == 4'b1101)) ; // After scrubbing the 
							// last DWORD of way 15. reset  
							// addr_cnt 
                                                        // BS : 07/14/05
 
assign	scrub_addr_en = ( scrub_fsm_cnt[3:0] == 4'b1101) & ~scrub_addr_reset ; // BS : 07/14/05 
 
assign	scrub_addr_cnt_plus1 = scrub_addr_cnt + 7'b1 ; 
 
l2t_tag_ctl_msff_ctl_macro__clr_1__en_1__width_7 ff_scrub_addr_cnt  // sync reset active high
                           (.din(scrub_addr_cnt_plus1[6:0]), 
                 .scan_in(ff_scrub_addr_cnt_scanin),
                 .scan_out(ff_scrub_addr_cnt_scanout),
                 .en(scrub_addr_en), .l1clk(l1clk), .clr(scrub_addr_reset), 
                 .dout(scrub_addr_cnt[6:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
//////////////////////////////////////////////////////////// 
// The following signal, tag_decc_tag_acc_en_px2 is used 
// to indicate to arb that a tag access needs to be performed 
// in the next cycle. 
//////////////////////////////////////////////////////////// 
 
// int 5.0 changes
// ------------\/ Added the following logic for timing \/-----------

assign  decc_tag_acc_en_px1 = ( scrub_fsm_cnt[3:0] == 4'b0001 ) &
                        scrub_fsm_en ;

l2t_tag_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_decc_tag_acc_en_px2 // sync reset active high
                           (.din(decc_tag_acc_en_px1),
                 .scan_in(ff_decc_tag_acc_en_px2_scanin),
                 .scan_out(ff_decc_tag_acc_en_px2_scanout),
                 .en(scrub_fsm_en), .l1clk(l1clk), .clr(scrub_fsm_reset),
                 .dout(tag_decc_tag_acc_en_px2),
  .siclk(siclk),
  .soclk(soclk)  
);

//dffre   #(1)  ff_decc_tag_acc_en_px2  (.din(decc_tag_acc_en_px1),
//                 .en(scrub_fsm_en), .clk(l1clk), .rst(scrub_fsm_reset),
//                 .q(decc_tag_acc_en_px2), .se(se), .si(), .so());
//
// ------------\/ Added the above logic for timing \/-----------
// assign	tag_decc_tag_acc_en_px2 = ( scrub_fsm_cnt[3:0] == 4'b0010 );  // int 5.0 changes
 
//////////////////////////////////////////////////////////// 
// The following signal tag_data_ecc_active_c3 is used by arbaddr to select 
// the deccck idx  for tag access 
//////////////////////////////////////////////////////////// 
 
assign	tag_data_ecc_active_c3 = scrub_fsm_en ; 
			 
 
//////////////////////////////////////////////////////////// 
// The waysels, coloffset word_en, set etc are chosen for  
// a scrub instruction in C1. 
// Hence, data_array-acc_active_c1 should be set when 
// the fsm_counter = 3or 12 
//////////////////////////////////////////////////////////// 
 
assign	data_array_wr_active_c1 = ( scrub_fsm_cnt[3:0] == 4'b1100 ) ; // wr 
                                                                      // BS : 07/14/05
assign  tag_data_array_wr_active_c1 = data_array_wr_active_c1;
 
assign	data_array_acc_active_c1 = mbist_run_r1_n ? (( scrub_fsm_cnt[3:0] == 4'b0011 ) | // rd 
			data_array_wr_active_c1) : ~mbist_arb_l2d_en_d1; 
 
		 
//////////////////////////////////////////////////////////// 
// refer to scrub pipeline 
// The following signal tag_deccck_data_sel_c8 is used to  
// select between store data and deccck scrub data. 
///////////////////////////////////////////////////////////// 
 
assign	tag_deccck_data_sel_c8 = (scrub_fsm_cnt[3:0] == 4'b1011); // BS : 07/14/05 
 
//////////////////////////////////////////////////////////// 
// refer to scrub pipeline 
// The following signal tag_deccck_addr3_c7 is used to  
// mux out the DWORD that is being scrubbed. 
///////////////////////////////////////////////////////////// 
 
assign	tag_deccck_addr3_c7 = scrub_addr_cnt[0] ; 
 
assign	tag_scrub_addr_way = scrub_addr_cnt[6:3] ; 
 
 
assign  dec_lo_scb_way[0] = ( tag_scrub_addr_way[1:0]==2'd0 ); 
assign  dec_lo_scb_way[1] = ( tag_scrub_addr_way[1:0]==2'd1 ); 
assign  dec_lo_scb_way[2] = ( tag_scrub_addr_way[1:0]==2'd2 ); 
assign  dec_lo_scb_way[3] = ( tag_scrub_addr_way[1:0]==2'd3 ); 
 
 
assign  dec_hi_scb_way[0] = ( tag_scrub_addr_way[3:2]==2'd0 ) ; 
assign  dec_hi_scb_way[1] = ( tag_scrub_addr_way[3:2]==2'd1 ) ; 
assign  dec_hi_scb_way[2] = ( tag_scrub_addr_way[3:2]==2'd2 ) ; 
assign  dec_hi_scb_way[3] = ( tag_scrub_addr_way[3:2]==2'd3 ) ; 
 
 assign  dec_scrub_addr_way[0] = dec_hi_scb_way[0] & dec_lo_scb_way[0] ; // 0000 
 assign  dec_scrub_addr_way[1] = dec_hi_scb_way[0] & dec_lo_scb_way[1] ; // 0001 
 assign  dec_scrub_addr_way[2] = dec_hi_scb_way[0] & dec_lo_scb_way[2] ; // 0010 
 assign  dec_scrub_addr_way[3] = dec_hi_scb_way[0] & dec_lo_scb_way[3] ; // 0011 
 assign  dec_scrub_addr_way[4] = dec_hi_scb_way[1] & dec_lo_scb_way[0] ; // 0100  
 assign  dec_scrub_addr_way[5] = dec_hi_scb_way[1] & dec_lo_scb_way[1] ; // 0101  
 assign  dec_scrub_addr_way[6] = dec_hi_scb_way[1] &  dec_lo_scb_way[2] ; // 0110  
 assign  dec_scrub_addr_way[7] = dec_hi_scb_way[1] & dec_lo_scb_way[3] ; // 0111  
 assign  dec_scrub_addr_way[8] = dec_hi_scb_way[2] & dec_lo_scb_way[0] ; // 1000 
 assign  dec_scrub_addr_way[9] = dec_hi_scb_way[2] & dec_lo_scb_way[1] ; // 1001 
 assign  dec_scrub_addr_way[10] = dec_hi_scb_way[2] & dec_lo_scb_way[2] ; // 1010 
 assign  dec_scrub_addr_way[11] = dec_hi_scb_way[2] & dec_lo_scb_way[3] ; // 1011 
 assign  dec_scrub_addr_way[12] = dec_hi_scb_way[3] & dec_lo_scb_way[0] ; // 1100 
 assign  dec_scrub_addr_way[13] = dec_hi_scb_way[3] & dec_lo_scb_way[1] ; // 1101 
 assign  dec_scrub_addr_way[14] = dec_hi_scb_way[3] & dec_lo_scb_way[2] ; // 1110 
 assign  dec_scrub_addr_way[15] = dec_hi_scb_way[3] & dec_lo_scb_way[3] ; // 1111 
 
 
assign  scrub_way_vld_c2 = |( dec_scrub_addr_way & vlddir_vuad_valid_c2 ) ; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_scrub_way_vld_c3 
                           (.din(scrub_way_vld_c2), .l1clk(l1clk), 
                   .scan_in(ff_scrub_way_vld_c3_scanin),
                   .scan_out(ff_scrub_way_vld_c3_scanout),
                   .dout(scrub_way_vld_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_scrub_way_vld_c4 
                           (.din(scrub_way_vld_c3), .l1clk(l1clk), 
                   .scan_in(ff_scrub_way_vld_c4_scanin),
                   .scan_out(ff_scrub_way_vld_c4_scanout),
                   .dout(scrub_way_vld_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_scrub_way_vld_c5 
                           (.din(scrub_way_vld_c4), .l1clk(l1clk), 
                   .scan_in(ff_scrub_way_vld_c5_scanin),
                   .scan_out(ff_scrub_way_vld_c5_scanout),
                   .dout(scrub_way_vld_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
// BS 03/11/04 extra cycle for mem access
l2t_tag_ctl_msff_ctl_macro__width_1 ff_scrub_way_vld_c52 
                           (.din(scrub_way_vld_c5), .l1clk(l1clk),
                   .scan_in(ff_scrub_way_vld_c52_scanin),
                   .scan_out(ff_scrub_way_vld_c52_scanout),
                   .dout(scrub_way_vld_c52),
  .siclk(siclk),
  .soclk(soclk)  
);
l2t_tag_ctl_msff_ctl_macro__width_1 ff_scrub_way_vld_c6 
                           (.din(scrub_way_vld_c52), .l1clk(l1clk), 
                   .scan_in(ff_scrub_way_vld_c6_scanin),
                   .scan_out(ff_scrub_way_vld_c6_scanout),
                   .dout(scrub_way_vld_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_scrub_way_vld_c7 
                           (.din(scrub_way_vld_c6), .l1clk(l1clk), 
                   .scan_in(ff_scrub_way_vld_c7_scanin),
                   .scan_out(ff_scrub_way_vld_c7_scanout),
                   .dout(scrub_way_vld_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
//////////////////////////////////////////////////////////// 
// tag_scrub_rd_vld_c7 indicates to decc that  
// any error information on data read from the data array 
// should be reported only if this signal is high  
//////////////////////////////////////////////////////////// 
 
// Bug id : 88450
// assign	tag_scrub_rd_vld_c7 = ( scrub_fsm_cnt[3:0] == 4'b1001 )  & scrub_way_vld_c7 ; 
assign        tag_scrub_rd_vld_c7 = ( scrub_fsm_cnt[3:0] == 4'b1010 )  & scrub_way_vld_c7 ;
 
//////////////////////////////////////////////////////////// 
// scrub write is disabled  
// if the valid bit of the line being scrubbed is 0,  
// OR if the read part of the scrub detected a dbit err. 
// The  write operation of a line scrub happens 9 cycles after 
// the read. The valid bit and error information need to be 
// staged until the pseudo C1 stage of the WRite operation. 
//////////////////////////////////////////////////////////// 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_scrub_rd_vld_c8 
                           (.din(tag_scrub_rd_vld_c7), .l1clk(l1clk), 
                              .scan_in(ff_scrub_rd_vld_c8_scanin),
                              .scan_out(ff_scrub_rd_vld_c8_scanout),
                              .dout(scrub_rd_vld_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	scrub_wr_disable_c8 = ~scrub_rd_vld_c8 | deccck_scrd_uncorr_err_c8 ; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_scrub_wr_disable_c9 
                           (.din(scrub_wr_disable_c8), .l1clk(l1clk), 
                              .scan_in(ff_scrub_wr_disable_c9_scanin),
                              .scan_out(ff_scrub_wr_disable_c9_scanout),
                              .dout(scrub_wr_disable_c9),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
////////////////////////////////////////////////////////////////////// 
// Fb data interface. 
// All fbdata signals are generated in filbuf and flopped here 
// before transmitting to l2b. THe excetion is wen  
////////////////////////////////////////////////////////////////////// 
 
 
 
 
assign  mcu_fbd_wen_r1[0]= ( filbuf_mcu_l2t_chunk_id_r1[1:0] == 2'd0 ) & 
				filbuf_mcu_l2t_data_vld_r1;  
assign  mcu_fbd_wen_r1[1]= ( filbuf_mcu_l2t_chunk_id_r1[1:0] == 2'd0 ) & 
				filbuf_mcu_l2t_data_vld_r1;  
assign  mcu_fbd_wen_r1[2]= ( filbuf_mcu_l2t_chunk_id_r1[1:0] == 2'd0 ) & 
				filbuf_mcu_l2t_data_vld_r1;  
assign  mcu_fbd_wen_r1[3]= ( filbuf_mcu_l2t_chunk_id_r1[1:0] == 2'd0 ) & 
				filbuf_mcu_l2t_data_vld_r1;  
assign  mcu_fbd_wen_r1[4]= ( filbuf_mcu_l2t_chunk_id_r1[1:0] == 2'd1 ) & 
				filbuf_mcu_l2t_data_vld_r1;  
assign  mcu_fbd_wen_r1[5]= ( filbuf_mcu_l2t_chunk_id_r1[1:0] == 2'd1 ) & 
				filbuf_mcu_l2t_data_vld_r1;  
assign  mcu_fbd_wen_r1[6]= ( filbuf_mcu_l2t_chunk_id_r1[1:0] == 2'd1 ) & 
				filbuf_mcu_l2t_data_vld_r1;  
assign  mcu_fbd_wen_r1[7]= ( filbuf_mcu_l2t_chunk_id_r1[1:0] == 2'd1 ) & 
				filbuf_mcu_l2t_data_vld_r1;  
assign  mcu_fbd_wen_r1[8]= ( filbuf_mcu_l2t_chunk_id_r1[1:0] == 2'd2 ) & 
				filbuf_mcu_l2t_data_vld_r1;  
assign  mcu_fbd_wen_r1[9]= ( filbuf_mcu_l2t_chunk_id_r1[1:0] == 2'd2 ) & 
				filbuf_mcu_l2t_data_vld_r1;  
assign  mcu_fbd_wen_r1[10]= ( filbuf_mcu_l2t_chunk_id_r1[1:0] == 2'd2 ) & 
				filbuf_mcu_l2t_data_vld_r1; 
assign  mcu_fbd_wen_r1[11]= ( filbuf_mcu_l2t_chunk_id_r1[1:0] == 2'd2 ) & 
				filbuf_mcu_l2t_data_vld_r1;  
assign  mcu_fbd_wen_r1[12]= ( filbuf_mcu_l2t_chunk_id_r1[1:0] == 2'd3 ) & 
				filbuf_mcu_l2t_data_vld_r1;  
assign  mcu_fbd_wen_r1[13]= ( filbuf_mcu_l2t_chunk_id_r1[1:0] == 2'd3 ) & 
				filbuf_mcu_l2t_data_vld_r1;  
assign  mcu_fbd_wen_r1[14]= ( filbuf_mcu_l2t_chunk_id_r1[1:0] == 2'd3 ) & 
				filbuf_mcu_l2t_data_vld_r1;  
assign  mcu_fbd_wen_r1[15]= ( filbuf_mcu_l2t_chunk_id_r1[1:0] == 2'd3 ) & 
				filbuf_mcu_l2t_data_vld_r1;  
 
// 
// In off mode, the following instructions are allowed to write to the 
// FB 
// - non partial stores/streaming stores or wr8s. 
// All other instructions are forbidden from writing into the fbf. 
// 
 
assign	sel_store_wen = ~filbuf_mcu_l2t_data_vld_r1 &  
			 st_to_data_array_c2 
                	& l2_bypass_mode_on_d1  ; 
 
assign 	fbd_word_en_c2 = tmp_word_en_c2 & {16{tag_fb_hit_c2}} ; 
 
l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_16 mux_fb_word_en_c2 
		( .dout ( l2t_l2b_fbwr_wen_r1[15:0]), 
             	.din0(mcu_fbd_wen_r1[15:0]), // mcu data wen logic above 
		.din1(fbd_word_en_c2[15:0]), // from cache wen logic only asserted when 
					    // Fb hit is high. 
                .sel0(~sel_store_wen),  // mcu data transfer active 
		.sel1(sel_store_wen)); 
 
l2t_tag_ctl_msff_ctl_macro__width_16 ff_l2b_fbwr_wen_r2 
                           (.din(l2t_l2b_fbwr_wen_r1[15:0]),  
		.scan_in(ff_l2b_fbwr_wen_r2_scanin),
		.scan_out(ff_l2b_fbwr_wen_r2_scanout),
		.l1clk(l1clk), 
                .dout(l2t_l2b_fbwr_wen_r2[15:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
///////////////////////////////////////////////// 
// In L2 off mode, the following signal is 
// used to select store data over data from DRAM 
///////////////////////////////////////////////// 
// 
//msff_ctl_macro ff_data_vld_r3 (width=1)
//                           (.din(filbuf_mcu_l2t_data_vld_r1), .l1clk(l1clk), 
//                   .scan_in(ff_data_vld_r3_scanin),
//                   .scan_out(ff_data_vld_r3_scanout),
//                   .dout(mcu_l2t_data_vld_r2),  
//); 
// 
//assign	tag_l2b_fbd_stdatasel_c3 = ~mcu_l2t_data_vld_r2 ; 

l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_l2b_fbd_stdatasel_c3 
        (.din(~filbuf_mcu_l2t_data_vld_r1), .l1clk(l1clk),
                   .scan_in(ff_tag_l2b_fbd_stdatasel_c3_scanin),
                   .scan_out(ff_tag_l2b_fbd_stdatasel_c3_scanout),
                   .dout(l2t_l2b_fbd_stdatasel_c3),
  .siclk(siclk),
  .soclk(soclk)
);


 
////////////////////////////////////////////////////////////////////////// 
// Signals going to oqu. 
// Imiss return is sent for an imiss hit. 
//  
// 
////////////////////////////////////////////////////////////////////////// 
 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_imiss_vld_c3 
                           (.din(arb_imiss_vld_c2), .l1clk(l1clk), 
                   .scan_in(ff_imiss_vld_c3_scanin),
                   .scan_out(ff_imiss_vld_c3_scanout),
                   .dout(imiss_vld_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	imiss_hit_c3 = imiss_vld_c3 & tag_hit_l2orfb_c3 ; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_imiss_hit_c4 
                           (.din(imiss_hit_c3), .l1clk(l1clk), 
                   .scan_in(ff_imiss_hit_c4_scanin),
                   .scan_out(ff_imiss_hit_c4_scanout),
                   .dout(arb_imiss_hit_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_imiss_hit_c5 
                           (.din(arb_imiss_hit_c4), .l1clk(l1clk), 
                   .scan_in(ff_imiss_hit_c5_scanin),
                   .scan_out(ff_imiss_hit_c5_scanout),
                   .dout(imiss_hit_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	tag_imiss_hit_c5 = imiss_hit_c5 ;
///////////////////////// 
// Ld return packet is sent for the following cases: 
// - ld hit, 
// - swap hit first pass. 
// - cas1 hit  
///////////////////////// 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_swap_inst_c3 
                           (.din(arb_decdp_swap_inst_c2), .l1clk(l1clk), 
                   .scan_in(ff_swap_inst_c3_scanin),
                   .scan_out(ff_swap_inst_c3_scanout),
                   .dout(swap_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_pst_no_ctrue_c3 
                           (.din(arb_arbdp_tag_pst_no_ctrue_c2), .l1clk(l1clk), 
                   .scan_in(ff_pst_no_ctrue_c3_scanin),
                   .scan_out(ff_pst_no_ctrue_c3_scanout),
                   .dout(pst_no_ctrue_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_cas1_inst_c3 
                           (.din(arb_decdp_cas1_inst_c2), .l1clk(l1clk), 
                   .scan_in(ff_cas1_inst_c3_scanin),
                   .scan_out(ff_cas1_inst_c3_scanout),
                   .dout(cas1_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_ld_inst_c3 
                           (.din(arb_decdp_ld_inst_c2), .l1clk(l1clk), 
                   .scan_in(ff_ld_inst_c3_scanin),
                   .scan_out(ff_ld_inst_c3_scanout),
                   .dout(ld_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	ld_hit_c3 = ( ( swap_inst_c3 & pst_no_ctrue_c3 ) | 
		     cas1_inst_c3  | 
		ld_inst_c3 ) & tag_hit_l2orfb_c3; 
			 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_ld_hit_c4 
                           (.din(ld_hit_c3), .l1clk(l1clk), 
                   .scan_in(ff_ld_hit_c4_scanin),
                   .scan_out(ff_ld_hit_c4_scanout),
                   .dout(ld_hit_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_ld_hit_c5 
                           (.din(ld_hit_c4), .l1clk(l1clk), 
                   .scan_in(ff_ld_hit_c5_scanin),
                   .scan_out(ff_ld_hit_c5_scanout),
                   .dout(ld_hit_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	tag_ld_hit_c5 = ld_hit_c5 ; 
 
///////////////////////// 
// St ack is sent for the following cases: 
// - cas2 from mb hitting the $. 
// - swap 2nd pass hitting the $ 
// - non-dep store. 
// - inval instruction 
// - diagnostic write delayed st ack. 
// -csr write from miss buffer delayed st ack 
///////////////////////// 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_inst_vld_c3 
                           (.din(arb_tag_inst_vld_c2), .l1clk(l1clk), 
                   .scan_in(ff_inst_vld_c3_scanin),
                   .scan_out(ff_inst_vld_c3_scanout),
                   .dout(inst_vld_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_inst_diag_c3 
                           (.din(arb_inst_diag_c2), .l1clk(l1clk), 
                   .scan_in(ff_inst_diag_c3_scanin),
                   .scan_out(ff_inst_diag_c3_scanout),
                   .dout(inst_diag_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_inst_mb_c3 
                           (.din(arbdec_arbdp_inst_mb_c2), .l1clk(l1clk), 
                   .scan_in(ff_inst_mb_c3_scanin),
                   .scan_out(ff_inst_mb_c3_scanout),
                   .dout(inst_mb_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_inst_mb_c4 
                           (.din(inst_mb_c3), .l1clk(l1clk), 
                   .scan_in(ff_inst_mb_c4_scanin),
                   .scan_out(ff_inst_mb_c4_scanout),
                   .dout(inst_mb_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_inst_mb_c5 
                           (.din(inst_mb_c4), .l1clk(l1clk), 
                   .scan_in(ff_inst_mb_c5_scanin),
                   .scan_out(ff_inst_mb_c5_scanout),
                   .dout(inst_mb_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	tag_inst_mb_c5 = inst_mb_c5 ; 
 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_misbuf_hit_unqual_c3 
                           (.din(misbuf_tag_hit_unqual_c2), .l1clk(l1clk), 
                   .scan_in(ff_misbuf_hit_unqual_c3_scanin),
                   .scan_out(ff_misbuf_hit_unqual_c3_scanout),
                   .dout(misbuf_hit_unqual_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_inst_dep_c3 
                           (.din(arbdec_arbdp_inst_dep_c2), .l1clk(l1clk), 
                   .scan_in(ff_inst_dep_c3_scanin),
                   .scan_out(ff_inst_dep_c3_scanout),
                   .dout(inst_dep_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_store_inst_c3 
                           (.din(arb_decdp_st_inst_c2), .l1clk(l1clk), 
                   .scan_in(ff_store_inst_c3_scanin),
                   .scan_out(ff_store_inst_c3_scanout),
                   .dout(store_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 

assign tag_store_inst_c3 = (store_inst_c3 | strstore_inst_c3) ; //BS and SR 11/07/03, store pipelining support
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_store_inst_c4 
                           (.din(store_inst_c3), .l1clk(l1clk), 
                   .scan_in(ff_store_inst_c4_scanin),
                   .scan_out(ff_store_inst_c4_scanout),
                   .dout(store_inst_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_store_inst_c5 
                           (.din(store_inst_c4), .l1clk(l1clk), 
                   .scan_in(ff_store_inst_c5_scanin),
                   .scan_out(ff_store_inst_c5_scanout),
                   .dout(store_inst_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	tag_store_inst_c5  = store_inst_c5 ; // to oq_dctl. 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_cas2_from_mb_c3 
                           (.din(arb_decdp_cas2_from_mb_c2), .l1clk(l1clk),  
			.scan_in(ff_cas2_from_mb_c3_scanin),
			.scan_out(ff_cas2_from_mb_c3_scanout),
			.dout(cas2_from_mb_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_pst_with_ctrue_c3 
                           (.din(pst_with_ctrue_c2), .l1clk(l1clk),  
			.scan_in(ff_pst_with_ctrue_c3_scanin),
			.scan_out(ff_pst_with_ctrue_c3_scanout),
			.dout(pst_with_ctrue_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_inval_inst_c3 
                           (.din(arb_inval_inst_c2), .l1clk(l1clk), 
                   .scan_in(ff_inval_inst_c3_scanin),
                   .scan_out(ff_inval_inst_c3_scanout),
                   .dout(inval_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_strstore_c3 
                           (.din (arb_decdp_strst_inst_c2),.l1clk(l1clk), 
                   .scan_in(ff_strstore_c3_scanin),
                   .scan_out(ff_strstore_c3_scanout),
                   .dout(strstore_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_diag_rd_en_c3 
                           (.din(arb_csr_rd_en_c3), .l1clk(l1clk), 
                   .scan_in(ff_diag_rd_en_c3_scanin),
                   .scan_out(ff_diag_rd_en_c3_scanout),
                   .dout(csr_rd_en_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_diag_wr_en_c3 
                           (.din(arb_csr_wr_en_c3), .l1clk(l1clk), 
                   .scan_in(ff_diag_wr_en_c3_scanin),
                   .scan_out(ff_diag_wr_en_c3_scanout),
                   .dout(csr_wr_en_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_diag_complete_c4 
                           (.din(arb_diag_complete_c3), .l1clk(l1clk), 
                   .scan_in(ff_diag_complete_c4_scanin),
                   .scan_out(ff_diag_complete_c4_scanout),
                   .dout(diag_complete_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tecc_c3 
                           (.din(arb_tecc_c2), .l1clk(l1clk), 
                    .scan_in(ff_tecc_c3_scanin),
                    .scan_out(ff_tecc_c3_scanout),
                    .dout(tecc_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// A STore instruction will send an  ack if it is 
// - not issued from the MB and hits the $ and not the miss buffer 
// - not issued from the mb and misses the $ AND does not encounter  
// a parity error AND misses the miss buffer. 
// BS and SR 11/07/03, store pipelining support 
// - not issued from the MB and misses in the $ , but hits in the Miss Buffer
//   with all entries having DEP = 0 
// - not issued from the MB and hits the $ and Miss Buffer with all entries having DEP = 0
// BS and SR 11/07/03, store pipelining support
// - issued from the MB with DEP=1 and hits the $  
// - issued from the MB with DEP=1 nd misses the $ AND does not encounter  
// a parity error. 
// - not a tag scrub instruction. 

l2t_tag_ctl_msff_ctl_macro__width_2 ff_tag_hit_unqual_c3 
                           (.din({tag_hit_unqual_c2,misbuf_vuad_ce_instr_ack_c2}), .l1clk(l1clk), 
                      .scan_in(ff_tag_hit_unqual_c3_scanin),
                      .scan_out(ff_tag_hit_unqual_c3_scanout),
                      .dout({tag_hit_unqual_c3,misbuf_vuad_ce_instr_ack_c3}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
//assign	ack_c3 = inst_vld_c3 & 	 
//		~tecc_c3 & 
//		~inst_diag_c3 &  
//		( ( tag_hit_l2orfb_c3 | ~(tagdp_tag_par_err_c3 & ~tag_hit_unqual_c3) ) & 
//		  (( ~inst_mb_c3 & ~misbuf_hit_unqual_c3) | (~inst_mb_c3 & ~tag_hit_unqual_c3 & misbuf_hit_st_dep_zero_qual) |
//// BS and SR 11/07/03, store pipelining support 
//// - not issued from the MB and misses in the $ , but hits in the Miss Buffer
////   with DEP bits for all entries it hits aginst being zeroes, fix for bug 81235
//                   inst_dep_c3 )  
//		) ; 
// 
//	//( ( ~inst_mb_c3 & ~misbuf_hit_unqual_c3 ) |  
//		//(( misbuf_gate_off_par_err_c3 |  // gate off par err for hits 
//		//~tagdp_tag_par_err_c3 )   
//		//& inst_dep_c3 ) 
//	//); 



assign tag_misbuf_ack_c3 = (inst_vld_c3 &	  ~tecc_c3 & ~inst_diag_c3 &
(( tag_hit_l2orfb_c3 | ~(tagdp_tag_par_err_c3 & ~tag_hit_unqual_c3) ) &
(( ~inst_mb_c3 & ~misbuf_hit_unqual_c3) |
(~inst_mb_c3 &
(misbuf_hit_st_dep_zero_qual & ~filbuf_match_c3)) | inst_dep_c3 )));

assign	ack_c3 = tag_misbuf_ack_c3 & ~arb_vuad_ce_err_c3 ;

assign vuad_ce_instr_ack_c3 = misbuf_vuad_ce_instr_ack_c3 & ~arb_vuad_ce_err_c3 & ~evict_unqual_vld_c3
                              & ~(tagdp_tag_par_err_c3 & ~tag_hit_unqual_c3);  

assign tag_misbuf_int_ack_c3  = (inst_vld_c3 & ~tecc_c3 & ~inst_diag_c3 &
                                (( tag_hit_l2orfb_c3 | ~(tagdp_tag_par_err_c3 & ~tag_hit_unqual_c3) ) 
                                ));

 
/////////////////////// 
// The following signal is used in oqu to  
// pick between the dir req vec and dec req vec. 
/////////////////////// 
// int 4.0 changes
//-----\/ FIX for bug#4619 ------ \/
// added a ~misbuf_hit_unqual_c3 qualification to
// a inval instruction.
//-----\/ FIX for bug#4619 ------ \/

assign	st_ack_c3 = ( store_inst_c3 & (ack_c3 | vuad_ce_instr_ack_c3) )  | // plain store ack 
		( ( cas2_from_mb_c3 |  // cas2 hit 
		( pst_with_ctrue_c3 & swap_inst_c3 ) )  // swap pass2 hit 
		& tag_hit_l2orfb_c3 ) | 
		( inval_inst_c3 & inst_vld_c3 & ~misbuf_hit_unqual_c3 ); // invalidate instr int 5.0 changes

// BS and SR 11/12/03 N2 Xbar Packet format change :

assign inval_req_c3 = ( inval_inst_c3 & inst_vld_c3 & ~misbuf_arb_hit_c3)   ; // invalidate instr
// send the inval ack only if it does not hit against anything in the miss buffer.
// if it does hit in MB, put the INV instruction into the Miss Buffer and later
// issue when the instruction it hit agianst is out of the MB.

assign st_inval_ack_c3 = st_ack_c3 | inval_req_c3;
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_st_ack_c4 
                           (.din(st_inval_ack_c3), .l1clk(l1clk), 
                   .scan_in(ff_st_ack_c4_scanin),
                   .scan_out(ff_st_ack_c4_scanout),
                   .dout(st_ack_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_st_ack_c5 
                           (.din(st_ack_c4), .l1clk(l1clk), 
                   .scan_in(ff_st_ack_c5_scanin),
                   .scan_out(ff_st_ack_c5_scanout),
                   .dout(st_ack_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS and SR 11/12/03 N2 Xbar Packet format change :
l2t_tag_ctl_msff_ctl_macro__width_1 ff_inval_req_c4 
                           (.din(inval_req_c3), .l1clk(l1clk),
                   .scan_in(ff_inval_req_c4_scanin),
                   .scan_out(ff_inval_req_c4_scanout),
                   .dout(inval_req_c4),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_tag_ctl_msff_ctl_macro__width_1 ff_inval_ack_c5 
                           (.din(inval_req_c4), .l1clk(l1clk),
                   .scan_in(ff_inval_ack_c5_scanin),
                   .scan_out(ff_inval_ack_c5_scanout),
                   .dout(inval_req_c5),
  .siclk(siclk),
  .soclk(soclk)  
);

 
assign	tag_st_ack_c5 = st_ack_c5 ; 
assign  tag_inval_req_c5 = inval_req_c5; // BS and SR 11/12/03 N2 Xbar Packet format change
 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_hit_c4 
                           (.din(tag_hit_c3), .l1clk(l1clk), 
                      .scan_in(ff_tag_hit_c4_scanin),
                      .scan_out(ff_tag_hit_c4_scanout),
                      .dout(tag_hit_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_hit_c5 
                           (.din(tag_hit_c4), .l1clk(l1clk), 
                      .scan_in(ff_tag_hit_c5_scanin),
                      .scan_out(ff_tag_hit_c5_scanout),
                      .dout(tag_hit_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 
/////////////////////// 
// the following signal is used in oqu to 
// generate the correct request type. 
/////////////////////// 
 
assign	st_req_c3 = st_ack_c3 | csr_wr_en_c4 | 
			( store_inst_c4 & diag_complete_c4 ) ; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_st_req_c4 
                           (.din(st_req_c3), .l1clk(l1clk), 
                   .scan_in(ff_st_req_c4_scanin),
                   .scan_out(ff_st_req_c4_scanout),
                   .dout(st_req_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_st_req_c5 
                           (.din(st_req_c4), .l1clk(l1clk), 
                   .scan_in(ff_st_req_c5_scanin),
                   .scan_out(ff_st_req_c5_scanout),
                   .dout(st_req_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	tag_st_req_c5 = st_req_c5 ; 

//////////////////////////////////////////
//  DIAG and store data select generation
//////////////////////////////////////////

// BS and SR 12/22/03, store ack generation for diagnostic store
// diagnostic data select mux is being generated and taken out to 
// l2t_arbdat_dp.sv.  For a regular store ack the cpx request gets sent in c7
// but for  diagnostic ack the cpx request gets sent in c8 
// This mux select will select the c8 data in case of diagnostic ack or
// or c7 data for regular store ack

assign sel_diag_store_data_c4 = csr_wr_en_c4 | ( store_inst_c4 & diag_complete_c4 ) ;

l2t_tag_ctl_msff_ctl_macro__width_1  ff_sel_diag_store_data_c5       
        (
        .scan_in(ff_sel_diag_store_data_c5_scanin),
        .scan_out(ff_sel_diag_store_data_c5_scanout),
        .dout   (sel_diag_store_data_c5),
        .din    (sel_diag_store_data_c4),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        
);

// BS 03/11/04 extra cycle for mem access

l2t_tag_ctl_msff_ctl_macro__width_1  ff_sel_diag_store_data_c52       
        (
        .scan_in(ff_sel_diag_store_data_c52_scanin),
        .scan_out(ff_sel_diag_store_data_c52_scanout),
        .dout   (sel_diag_store_data_c52),
        .din    (sel_diag_store_data_c5),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        
);


l2t_tag_ctl_msff_ctl_macro__width_1  ff_sel_diag_store_data_c6       
        (
        .scan_in(ff_sel_diag_store_data_c6_scanin),
        .scan_out(ff_sel_diag_store_data_c6_scanout),
        .dout   (sel_diag_store_data_c6),
        .din    (sel_diag_store_data_c52),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        
);

l2t_tag_ctl_msff_ctl_macro__width_1  ff_sel_diag_store_data_c7       
        (
        .scan_in(ff_sel_diag_store_data_c7_scanin),
        .scan_out(ff_sel_diag_store_data_c7_scanout),
        .dout   (sel_diag_store_data_c7),
        .din    (sel_diag_store_data_c6),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        
);

//msff_ctl_macro  ff_sel_diag_store_data_c8       (width=1)
//        (
//        .scan_in(ff_sel_diag_store_data_c8_scanin),
//        .scan_out(ff_sel_diag_store_data_c8_scanout),
//        .dout   (sel_diag_store_data_c8),
//        .din    (sel_diag_store_data_c7),
//        .l1clk  (l1clk),
//        
//);
//
 
/////////////////////// 
// streaming store ack 
/////////////////////// 
 
assign	strst_ack_c3 =  strstore_inst_c3 & (ack_c3 | vuad_ce_instr_ack_c3); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_strst_ack_c4 
                           (.din(strst_ack_c3), .l1clk(l1clk), 
                   .scan_in(ff_strst_ack_c4_scanin),
                   .scan_out(ff_strst_ack_c4_scanout),
                   .dout(strst_ack_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_strst_ack_c5 
                           (.din(strst_ack_c4), .l1clk(l1clk), 
                   .scan_in(ff_strst_ack_c5_scanin),
                   .scan_out(ff_strst_ack_c5_scanout),
                   .dout(strst_ack_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	tag_strst_ack_c5 = strst_ack_c5 ; 
 
////////////////////// 
// rmo store ack 
///////////////////// 
 
assign	rmo_st_ack_c3 = arb_decdp_rmo_st_c3 & (ack_c3 | vuad_ce_instr_ack_c3); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_rmo_st_ack_c4 
                           (.din(rmo_st_ack_c3), .l1clk(l1clk), 
                   .scan_in(ff_rmo_st_ack_c4_scanin),
                   .scan_out(ff_rmo_st_ack_c4_scanout),
                   .dout(rmo_st_ack_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_rmo_st_ack_c5 
                           (.din(rmo_st_ack_c4), .l1clk(l1clk), 
                   .scan_in(ff_rmo_st_ack_c5_scanin),
                   .scan_out(ff_rmo_st_ack_c5_scanout),
                   .dout(rmo_st_ack_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	tag_rmo_st_ack_c5 =  rmo_st_ack_c5; 
 
 
 
/////////////////////// 
// diag or csr complete( non memory ) 
/////////////////////// 
 
assign	nonmem_comp_c4 = diag_complete_c4 | 
				  csr_wr_en_c4 | 
				csr_rd_en_c4 ; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_nonmem_comp_c5 
                           (.din(nonmem_comp_c4), .l1clk(l1clk), 
                   .scan_in(ff_nonmem_comp_c5_scanin),
                   .scan_out(ff_nonmem_comp_c5_scanout),
                   .dout(nonmem_comp_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_tag_ctl_msff_ctl_macro__width_1 ff_nonmem_comp_c52 
                           (.din(nonmem_comp_c5), .l1clk(l1clk),
                   .scan_in(ff_nonmem_comp_c52_scanin),
                   .scan_out(ff_nonmem_comp_c52_scanout),
                   .dout(nonmem_comp_c52),
  .siclk(siclk),
  .soclk(soclk)  
);
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_nonmem_comp_c6 
                           (.din(nonmem_comp_c52), .l1clk(l1clk), 
                   .scan_in(ff_nonmem_comp_c6_scanin),
                   .scan_out(ff_nonmem_comp_c6_scanout),
                   .dout(nonmem_comp_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	tag_nonmem_comp_c6 = nonmem_comp_c6 ; 
 
//////////////////////////////////////////////////// 
// 
// correctable and non correctable err ack 
// 
// - When a PST instruction makes its second pass 
// an error indication is sent to spcX Ty. 
// 
// (Atomics are not included in this because 
// the load part of the atomic sends an error similar 
// to loads.) 
// 
// - A fill will also send an error indication 
//   to SPc0 T0 if the uncorr/err bit is set 
//   in filbuf 
//  
//////////////////////////////////////////////////// 
 
// POST_2.0 additions. 
// tagcl_?err_ack is asserted to  
// send an error packet to a sparc 
// for partial stores. 
// 
// Wr8s need to be excluded from this 
// since they differ from regular stores 
// in the following aspect.  
// regular stores send an ack/inval packet 
// when they make their first non-dependent 
// pass down the pipe. 
// wr8s send an invalidate(eviction) packet  
// when they make their final pass down the pipe 
// Hence the error indication needs to be sent 
// along with a fill instead of being sent with 
// the 2nd pass of a store. 
 
 
 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_st_with_ctrue_c3 
                           (.din(arb_decdp_st_with_ctrue_c2), .l1clk(l1clk), 
                   .scan_in(ff_st_with_ctrue_c3_scanin),
                   .scan_out(ff_st_with_ctrue_c3_scanout),
                   .dout(st_with_ctrue_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_2 ff_misbuf_uerr_c3 
                           (.din({misbuf_uncorr_err_c2,misbuf_notdata_err_c2}), .l1clk(l1clk), 
                   .scan_in(ff_misbuf_uerr_c3_scanin),
                   .scan_out(ff_misbuf_uerr_c3_scanout),
                   .dout({misbuf_uerr_c3,misbuf_nderr_c3}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_misbuf_cerr_c3 
                           (.din(misbuf_corr_err_c2), .l1clk(l1clk), 
                   .scan_in(ff_misbuf_cerr_c3_scanin),
                   .scan_out(ff_misbuf_cerr_c3_scanout),
                   .dout(misbuf_cerr_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
//
//msff_ctl_macro ff_arb_oqu_swap_cas2_req_c3 (width=1)
//	(.din(arb_oqu_swap_cas2_req_c2), .l1clk(l1clk),
//                   .scan_in(ff_arb_oqu_swap_cas2_req_c3_scanin),
//                   .scan_out(ff_arb_oqu_swap_cas2_req_c3_scanout),
//                   .dout(arb_oqu_swap_cas2_req_c3),
//);

 
// tag_hit_c3 is used to qualify st_with_ctrue_c3. 
// st_with_ctrue_c3 is qualfied everywhere else. 
// Bug # 3528:	6/26/2003 
// The qualification with tag_hit_c3 instead of tag_hit_l2orfb_c3 assumes that 
// the $ is turned ON. THis causes ?err_ack_tmp_c3 to be deasserted for psts in OFF 
// mode. This has been changed to tag_hit_l2orfb_c3 to  solve the problem. 
// Nodata would have both misbuf_uerr_c3,misbuf_cerr_c3 = 1.
 
assign	uerr_ack_tmp_c3 =  ((misbuf_uerr_c3 | misbuf_nderr_c3) & st_with_ctrue_c3  & tag_hit_l2orfb_c3 & 
			   inst_vld_c3) | filbuf_dis_uerr_c3 | filbuf_dis_nderr_c3[1] ; 

l2t_tag_ctl_msff_ctl_macro__width_2 ff_uerr_ack_tmp_c4 
                           (.din({uerr_ack_tmp_c3,misbuf_nderr_c3}), .l1clk(l1clk), 
                   .scan_in(ff_uerr_ack_tmp_c4_scanin),
                   .scan_out(ff_uerr_ack_tmp_c4_scanout),
                   .dout({tag_uerr_ack_tmp_c4,misbuf_nderr_c4}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	uerr_ack_c3 = uerr_ack_tmp_c3 & ~wr8_inst_c3 ; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_uerr_ack_c4 
                           (.din(uerr_ack_c3), .l1clk(l1clk), 
                   .scan_in(ff_uerr_ack_c4_scanin),
                   .scan_out(ff_uerr_ack_c4_scanout),
                   .dout(uerr_ack_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_2 ff_uerr_ack_c5 
                           (.din({misbuf_nderr_c4,uerr_ack_c4}), .l1clk(l1clk), 
                   .scan_in(ff_uerr_ack_c5_scanin),
                   .scan_out(ff_uerr_ack_c5_scanout),
                   .dout({misbuf_nderr_c5,uerr_ack_c5}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// Reporting of errors to the sparc depends on the csr_error_ceen  
// and csr_error_nceen bits. If these bits are turned off, the spc 
// does not reveive any errors from the L2. 
// There is one caveat. The error that causes tag_uerr_ack_c5 
// or tag_cerr_ack_c5 to go HIGH may have occurred before  
// or after the changing of error_Ceen and csr_error_nceen bits. 
 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_error_ceen_d1 
              (.dout   (error_ceen_d1), .din (csr_error_ceen), 
               .scan_in(ff_error_ceen_d1_scanin),
               .scan_out(ff_error_ceen_d1_scanout),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)  
		); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_error_nceen_d1 
        (
	.scan_in(ff_error_nceen_d1_scanin),
	.scan_out(ff_error_nceen_d1_scanout),
	.dout   (error_nceen_d1), .din (csr_error_nceen),
        .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
	); 
 
 
assign	tag_uerr_ack_c5 = (uerr_ack_c5  & error_nceen_d1) | 
			(misbuf_nderr_c5 | filbuf_dis_nderr_c5[1]) & error_nceen_d1; 
 
// tag_hit_c3 is used to qualify st_with_ctrue_c3. 
// st_with_ctrue_c3 is qualfied everywhere else. 
// Bug # 3528:	6/26/2003 
// The qualification with tag_hit_c3 instead of tag_hit_l2orfb_c3 assumes that 
// the $ is turned ON. THis causes ?err_ack_tmp_c3 to be deasserted for psts in OFF 
// mode. This has been changed to tag_hit_l2orfb_c3 to  solve the problem. 
// Nodata would have both misbuf_uerr_c3,misbuf_cerr_c3 = 1.
//
//assign	cerr_ack_tmp_c3 = (((misbuf_cerr_c3 & ~(misbuf_uerr_c3 & error_nceen_d1)) | 
//		misbuf_nderr_c3) & st_with_ctrue_c3  & tag_hit_l2orfb_c3 & inst_vld_c3 ) | 
//		(filbuf_dis_cerr_c3 & ~(filbuf_dis_uerr_c3 & error_nceen_d1)) | filbuf_dis_nderr_c3[0];
//



assign  cerr_ack_tmp_c3 = ((misbuf_cerr_c3 & ~(misbuf_uerr_c3 & error_nceen_d1))
                 & st_with_ctrue_c3  & tag_hit_l2orfb_c3 & inst_vld_c3 ) |
                (filbuf_dis_cerr_c3 & ~(filbuf_dis_uerr_c3 & error_nceen_d1));




l2t_tag_ctl_msff_ctl_macro__width_1 ff_cerr_ack_tmp_c4 
                           (.din(cerr_ack_tmp_c3), .l1clk(l1clk), 
                   .scan_in(ff_cerr_ack_tmp_c4_scanin),
                   .scan_out(ff_cerr_ack_tmp_c4_scanout),
                   .dout(tag_cerr_ack_tmp_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	cerr_ack_c3 = cerr_ack_tmp_c3 & ~wr8_inst_c3 ; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_cerr_ack_c4 
                           (.din(cerr_ack_c3), .l1clk(l1clk), 
                   .scan_in(ff_cerr_ack_c4_scanin),
                   .scan_out(ff_cerr_ack_c4_scanout),
                   .dout(cerr_ack_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_cerr_ack_c5 
                           (.din(cerr_ack_c4), .l1clk(l1clk), 
                   .scan_in(ff_cerr_ack_c5_scanin),
                   .scan_out(ff_cerr_ack_c5_scanout),
                   .dout(cerr_ack_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	tag_cerr_ack_c5 = (cerr_ack_c5 & error_ceen_d1) | 
		(misbuf_nderr_c5 | filbuf_dis_nderr_c5[0]) & error_nceen_d1 ; 


// computing notdata error reporting

l2t_tag_ctl_msff_ctl_macro__width_4 ff_dis_nderr_c5 
	(
	.scan_in(ff_dis_nderr_c5_scanin),
	.scan_out(ff_dis_nderr_c5_scanout),
	.din({filbuf_dis_nderr_c3[1:0],filbuf_dis_nderr_c4[1:0]}),
	.l1clk(l1clk),
	.dout({filbuf_dis_nderr_c4[1:0],filbuf_dis_nderr_c5[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
	);


 
////////////////////// 
// 
// interrupt acknowledgement 
// 
////////////////////// 
 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_inst_int_c3 
                           (.din(arb_decdp_inst_int_c2), .l1clk(l1clk), 
                   .scan_in(ff_inst_int_c3_scanin),
                   .scan_out(ff_inst_int_c3_scanout),
                   .dout(inst_int_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	int_ack_c3 = inst_int_c3 & inst_vld_c3 ; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_int_ack_c4 
                           (.din(int_ack_c3), .l1clk(l1clk), 
                   .scan_in(ff_int_ack_c4_scanin),
                   .scan_out(ff_int_ack_c4_scanout),
                   .dout(int_ack_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_int_ack_c5 
                           (.din(int_ack_c4), .l1clk(l1clk), 
                   .scan_in(ff_int_ack_c5_scanin),
                   .scan_out(ff_int_ack_c5_scanout),
                   .dout(int_ack_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	tag_int_ack_c5 = int_ack_c5 ; 
 
/////////////////////// 
// 
// fwd req return : 
// 1. A diag fwd req will 
// send a delayed(1cyc) reponse. 
// 2. A non-diag fwd req will send its response 
//    similar to any other request in C8	 
//  
/////////////////////// 
 
 
 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_fwd_req_c3 
                           (.din(arb_decdp_fwd_req_c2), .l1clk(l1clk), 
                   .scan_in(ff_fwd_req_c3_scanin),
                   .scan_out(ff_fwd_req_c3_scanout),
                   .dout(fwd_req_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	fwd_req_vld_diag_c3 = fwd_req_c3 &  
			inst_vld_c3 & 
			inst_diag_c3 ; 
 
assign	fwd_req_vld_diagn_c3 = fwd_req_c3 & 
                        inst_vld_c3 & 
                        ~inst_diag_c3 ; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_fwd_req_vld_diag_c4 
                           (.din(fwd_req_vld_diag_c3), .l1clk(l1clk), 
                   .scan_in(ff_fwd_req_vld_diag_c4_scanin),
                   .scan_out(ff_fwd_req_vld_diag_c4_scanout),
                   .dout(fwd_req_vld_diag_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	fwd_req_ret_c3 = fwd_req_vld_diag_c4 | fwd_req_vld_diagn_c3; 
 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_fwd_req_ret_c4 
                           (.din(fwd_req_ret_c3), .l1clk(l1clk), 
                   .scan_in(ff_fwd_req_ret_c4_scanin),
                   .scan_out(ff_fwd_req_ret_c4_scanout),
                   .dout(fwd_req_ret_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_fwd_req_ret_c5 
                           (.din(fwd_req_ret_c4), .l1clk(l1clk), 
                   .scan_in(ff_fwd_req_ret_c5_scanin),
                   .scan_out(ff_fwd_req_ret_c5_scanout),
                   .dout(fwd_req_ret_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	tag_fwd_req_ret_c5 = fwd_req_ret_c5 ; 
 
 
// FWD req acks were earlier sent to cpu#0. 
// Now, the ack is sent to the cpu that forwards the IOB request. 
 
// the following signal is high only for non-diag reads 
assign	fwd_req_ld_c3 = fwd_req_vld_diagn_c3  & ld_inst_c3 ; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_fwd_req_ld_c4 
                           (.din(fwd_req_ld_c3), .l1clk(l1clk), 
                   .scan_in(ff_fwd_req_ld_c4_scanin),
                   .scan_out(ff_fwd_req_ld_c4_scanout),
                   .dout(fwd_req_ld_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_fwd_req_ld_c5 
                           (.din(fwd_req_ld_c4), .l1clk(l1clk), 
                   .scan_in(ff_fwd_req_ld_c5_scanin),
                   .scan_out(ff_fwd_req_ld_c5_scanout),
                   .dout(fwd_req_ld_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_tag_ctl_msff_ctl_macro__width_1 ff_fwd_req_ld_c52 
                           (.din(fwd_req_ld_c5), .l1clk(l1clk),
                   .scan_in(ff_fwd_req_ld_c52_scanin),
                   .scan_out(ff_fwd_req_ld_c52_scanout),
                   .dout(fwd_req_ld_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_fwd_req_ld_c6 
                           (.din(fwd_req_ld_c52), .l1clk(l1clk), 
                   .scan_in(ff_fwd_req_ld_c6_scanin),
                   .scan_out(ff_fwd_req_ld_c6_scanout),
                   .dout(fwd_req_ld_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	tag_fwd_req_ld_c6 = fwd_req_ld_c6 ; 
 
 
 
 
///////////////////////////////////////////////////////////// 
// 
// indicates that the rdma register 
// is in use. This register has the following set 
// reset conditions. 
// 
// Set in the C3 cycle of 
// - WR8 and ~no_Ctrue hitting the $. 
// - Wr64 hitting the $  
//	or missing the ($ and FB and MB and WB and rdma WB) 
// - ld64 hitting the $ or Fb. 
// 
// Reset the rdma reg valid under the following conditions. 
// - For a Ld64, rdma reg valid is deasserted when the counter 
//   reaches 17. 
// _ For a store the rdma reg valid is deasserted when the  
//   OQ is able to make the invalidate request to the primary  
//   caches. 
// 
// 
// ld rdma reg vld. 
//----------------------------------------------------------------------------------- 
// C3		c4	c5	c6	c7.... C14..   	C16	c18 	c19	c20 
// start	 
// count_c3	count=1						count=15			 
//			 
//----------------------------------------------------------------------------------- 
// 
//reg_vld=1						allow 
//							arb sel	rv_c2_p=0 
//							in next  
//							cyc, cnt=13 
// 
//						allow 
//						mb pick.	 
//						in next cyc 
//						count=11 
//----------------------------------------------------------------------------------- 
// 
//OPeration B								C2 
// 
//----------------------------------------------------------------------------------- 
// => reg_vld_px2_p = 0, when count=13. = C16 
// => reg_vld_px0_p = 0 when count = 11 = C14 
// 
// Since the occupation latency of the rdma interface for stores 
// is not fixed, the counter is reset and rv_c2_p, rv_px2_p and rv_px0_p 
// go low in the same cycle. 
// 
// *** rdma_reg_vld is a C4 flop whose results are consumed by a C2 instruction. 
// However, this works fine because any rdma instruction causes a 1 cycle 
// bubble in the pipe. 
//  
// *** a RD64 response can immediately be followed by a write response 
//	since the number of cycles that a read occupies the interface 
//	is static(17 cycles). However, a write response cannot be immediately 
//	followed by another response for atleast 7 cycles. 
///////////////////////////////////////////////////////////// 
 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_ld64_inst_c3 
                           (.din(ld64_inst_c2), .l1clk(l1clk),  
		.scan_in(ff_ld64_inst_c3_scanin),
		.scan_out(ff_ld64_inst_c3_scanout),
		.dout(ld64_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_wr64_inst_c3 
                           (.din(arb_decdp_wr64_inst_c2), .l1clk(l1clk),  
		.scan_in(ff_wr64_inst_c3_scanin),
		.scan_out(ff_wr64_inst_c3_scanout),
		.dout(wr64_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_wr8_inst_c3 
                           (.din(arb_decdp_wr8_inst_c2), .l1clk(l1clk),  
		.scan_in(ff_wr8_inst_c3_scanin),
		.scan_out(ff_wr8_inst_c3_scanout),
		.dout(wr8_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
//msff_ctl_macro ff_arbdp_tag_pst_no_ctrue_c2 (width=1)
//                           (.din(arb_arbdp_tag_pst_no_ctrue_c2), .l1clk(l1clk),  
//		.dout(pst_no_ctrue_c3),  
//		.scan_in(), 
//		.scan_out()
//); 
 
////////// 
// hit completion for 
// all types of rdma instructions 
// HIT is only asserted if rdma_reg_vld=0 
////////// 
assign	rd64_complete_c3 = 	( ld64_inst_c3 & tag_hit_l2orfb_c3 ) & ~arb_vuad_ce_err_c3; 
assign	wr64_hit_complete_c3 =   ( wr64_inst_c3 & tag_hit_l2orfb_c3 )  & ~arb_vuad_ce_err_c3; 
assign	wr8_complete_c3 = ( wr8_inst_c3 & ~pst_no_ctrue_c3 & 
				tag_hit_l2orfb_c3 )  & ~arb_vuad_ce_err_c3; 
 
////////////////////////////////////// 
// select inval vector 
// to oqu for selecting  
// the results of the directory CAM 
// for generating the request vector 
// and invalidation packet. 
////////////////////////////////////// 
 
 
assign sel_rdma_inval_vec_c3 = ( wr8_inst_c3 | wr64_inst_c3 ) & 
                                tag_hit_l2orfb_c3; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_sel_rdma_inval_vec_c4 
                           (.din(sel_rdma_inval_vec_c3), .l1clk(l1clk), 
                .scan_in(ff_sel_rdma_inval_vec_c4_scanin),
                .scan_out(ff_sel_rdma_inval_vec_c4_scanout),
                .dout(sel_rdma_inval_vec_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_sel_rdma_inval_vec_c5 
                           (.din(sel_rdma_inval_vec_c4), .l1clk(l1clk), 
                .scan_in(ff_sel_rdma_inval_vec_c5_scanin),
                .scan_out(ff_sel_rdma_inval_vec_c5_scanout),
                .dout(tag_sel_rdma_inval_vec_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
////////// 
// tag_rdma_ev_en_c4 is used to 
// set mcu_req in l2t_rdmat 
///////// 
 
// int 5.0 changes
// 10/3/2003 : tagdp_tag_par_err_c3 qualification is 
// needed for every expression that has misbuf_wr64_miss_comp_c3
// THis is because misbuf_wr64_miss_comp_c3 is now not qualified
// with tag_mbctl_par_err_c3.

 
//
// VUAD ecc change
// In case VUAD CE is found, we need to disable l2t_sii_wib_dequeue 
// We do this by gating off tag_rdma_ev_en_c3 by arb_vuad_ce_err_c3
// So the IOWB does not get evicted to MCU 
// The WR64 that found the CE would get moved to the MB and gets
// replayed.  On replay it does not find VUAD CE anymore and 
// this time upon completion it will assert l2t_sii_wib_dequeue
// and cause eviction of IOWB to happen

 
assign	tag_rdma_ev_en_c3 = (( misbuf_wr64_miss_comp_c3 & ~tagdp_tag_par_err_c3) |  // int 5.0 change
				wr64_hit_complete_c3) & ~arb_vuad_ce_err_c3  ; 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_rdma_ev_en_c3 
                           (.din(tag_rdma_ev_en_c3), .l1clk(l1clk),  
		.scan_in(ff_tag_rdma_ev_en_c3_scanin),
		.scan_out(ff_tag_rdma_ev_en_c3_scanout),
		.dout(tag_rdma_ev_en_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	tag_rdma_wr_comp_c3 =  (misbuf_wr64_miss_comp_c3 & ~tagdp_tag_par_err_c3 & ~arb_vuad_ce_err_c3) | // int 5.0 change 
                                wr8_complete_c3 | 
                                wr64_hit_complete_c3 ; 


//
//  When a VUAD CE error occurs,  we need to disable data returns and 
//  write acks to SIU.  We do this by shutting off l2t_l2b_ctag_en_c7
//  and l2t_l2b_req_en_c7.  
//  The SIU instruction will get replayed from MB, will not find the CE any more
//  and will complete as normal sending back data and ack to SIU.
//  


assign	set_rdma_reg_vld_c3 = ( rd64_complete_c3  |  tag_rdma_wr_comp_c3 ) & ~arb_vuad_ce_err_c3 ; 
 
 
assign	reset_rdma_reg_vld = ( &(rdma_cnt) |  // reset for lds 
			oqu_st_complete_c7 ) ; // reset for stores. 
 
assign	rdma_reg_vld_in = ( rdma_reg_vld  | set_rdma_reg_vld_c3 ) & 
				~reset_rdma_reg_vld ; 
 
l2t_tag_ctl_msff_ctl_macro__clr_1__dmsff_32x__width_2 ff_rdma_reg_vld  // sync reset active low
                           (.din({2{rdma_reg_vld_in}}), .l1clk(l1clk),  
			.scan_in(ff_rdma_reg_vld_scanin),
			.scan_out(ff_rdma_reg_vld_scanout),
			.clr(~dbb_rst_l), 
			.dout({rdma_reg_vld_cloned,rdma_reg_vld}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_tag_rdma_wr_comp_c4 
                           (.din(tag_rdma_wr_comp_c3), .l1clk(l1clk),  
		.scan_in(ff_tag_rdma_wr_comp_c4_scanin),
		.scan_out(ff_tag_rdma_wr_comp_c4_scanout),
		.dout(tag_rdma_wr_comp_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
////////// 
// tag_rdma_reg_vld_c2 is consumed by 
// a C2 instruction. 
////////// 
l2t_tag_ctl_msff_ctl_macro__clr_1__width_1 ff_misbuf_rdma_reg_vld_c2  // sync reset active low
                           (.din(rdma_reg_vld_in), .l1clk(l1clk),  
			.scan_in(ff_misbuf_rdma_reg_vld_c2_scanin),
			.scan_out(ff_misbuf_rdma_reg_vld_c2_scanout),
			.clr(~dbb_rst_l), 
			.dout(tag_misbuf_rdma_reg_vld_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
////////////////////////// 
// 
//tag_rdma_vld_px0_p: 
// 
// the following signal is high from the C4 cycle of an  
// instruction setting rdma_reg_vld and will be reset 
// when the rdma rd counter is 11 or when oqu_st_complete_c7 
// is high 
// 
// It is used in misbuf to permit an L2 pick in the next 
// cycle for an RDMA instruction. Pipeline is as follows 
//-------------------------------------------------------------------------------- 
// cnt11		12	13	14	15	16	17 
//------------------------------------------------------------------------------- 
//							rdma_reg_vld==0 
// reset 
// rdma_vld_px0_p	pre	pick	read	issue	C1	C2 
//			cond		mbuffer	PX2 
//			L2 rdy 
//			in misbuf 
//-------------------------------------------------------------------------------- 
 
// Introduced a  1 cycle latency in the reintroduction of 
// rdma instructions after the setting of rdma_reg_vld. 
// This is to make sure that the rdma rd address is kept 
// around until an error on the last packet is reported. 
//		 
////////////////////////// 
 
assign	reset_rdma_vld_px0_p_in = (rdma_cnt == 4'd11 )  
				|  oqu_st_complete_c7 ; 
 
assign	rdma_vld_px0_p_in = ( set_rdma_reg_vld_c3 | rdma_vld_px0_p ) 
				& ~reset_rdma_vld_px0_p_in ; 
 
l2t_tag_ctl_msff_ctl_macro__clr_1__width_1 ff_rdma_vld_px0_p  // sync reset active low
                           (.din(rdma_vld_px0_p_in), .l1clk(l1clk),  
		.scan_in(ff_rdma_vld_px0_p_scanin),
		.scan_out(ff_rdma_vld_px0_p_scanout),
		.clr(~dbb_rst_l), 
		.dout(rdma_vld_px0_p),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign tag_rdma_vld_px0_p = rdma_vld_px0_p ; 
 
////////////////////////// 
// 
//tag_rdma_vld_px1: 
// 
// the following signal is high from the C4 cycle of an 
// instruction setting rdma_reg_vld and will be reset 
// when the rdma rd counter is 13 or when oqu_st_complete_c7 
// is high 
// 
//-------------------------------------------------------------------------------- 
// cnt13		14		15	16	17 
//------------------------------------------------------------------------------- 
//						rdma_reg_vld==0 
// reset 
// rdma_vld_px1		allow		issue 
//			snp		snp	C1	C2 
//			selection	PX2 
//			in arb 
//-------------------------------------------------------------------------------- 
// It is used in arb to permit an RDMA instruction 
// to be picked. 
// 
// Introduced a  1 cycle latency in the reintroduction of 
// rdma instructions after the setting of rdma_reg_vld. 
// This is to make sure that the rdma rd address is kept 
// around until an error on the last packet is reported. 
// 
////////////////////////// 
 
 
assign  reset_rdma_vld_px1_in = (rdma_cnt == 4'd12 ) 
                                |  oqu_st_complete_c7 ; 
 
assign  rdma_vld_px1_in = ( set_rdma_reg_vld_c3 | rdma_vld_px1 ) 
                                & ~reset_rdma_vld_px1_in ; 
 
l2t_tag_ctl_msff_ctl_macro__clr_1__width_1 ff_rdma_vld_px1  // sync reset active low
                           (.din(rdma_vld_px1_in), .l1clk(l1clk), 
                .scan_in(ff_rdma_vld_px1_scanin),
                .scan_out(ff_rdma_vld_px1_scanout),
                .clr(~dbb_rst_l), 
                .dout(rdma_vld_px1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign tag_rdma_vld_px1 = rdma_vld_px1 ; 
 
//////////////////////////////////////////////////////////////////////// 
// Write the CTAG into the CTAG register in l2b 
// if an instruction completes. 
//////////////////////////////////////////////////////////////////////// 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_set_rdma_reg_vld_c4 
                           (.din(set_rdma_reg_vld_c3), .l1clk(l1clk),  
		.scan_in(ff_set_rdma_reg_vld_c4_scanin),
		.scan_out(ff_set_rdma_reg_vld_c4_scanout),
		.dout(set_rdma_reg_vld_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	tag_set_rdma_reg_vld_c4 = set_rdma_reg_vld_c4 ; 
 
//////////////////////////////////////////////////////////////////////// 
// 
// request to siu: 
// the above signal may or may not be synchronous with the setting 
// of rdma_reg_vld.  
// - For loads , this signal is sent in C7,  
// - for store  misses this is a C8 signal.  
// - For stores that hit any L1$, this 
// signal is transmitted only after all L1 $ invalidate packets are 
// queued up in the CPX. 
// 
// The following FSM is used to perform the above function. 
//	 
//-------------------------------------------------------------------------------- 
// 	STATES		IDLE		ST_REQ_ST		LD_REQ_ST 
//-------------------------------------------------------------------------------- 
//	IDLE		rst or		set rdma_reg	set rdma reg 
//			~rdma_reg	& WR8 or WR64	and LD64 
//-------------------------------------------------------------------------------- 
//	ST_REQ_ST	oqu_st_	~oqu_st_	- 
//			complete_c7	complete_c7 
//-------------------------------------------------------------------------------- 
//	LD_REQ_ST	rdmardcount	-		rdmardcount!=15 
//			==15		 
//-------------------------------------------------------------------------------- 
// 
//	req_en_c7 = 1  if LD_REQ_ST & rdmardcount=4; 
//	req_en_c7 = 1  if ST_REQ_ST & oqu_st_complete_c7; 
// 
// Note: Since the counter is a C4 flop whose results are consumed by 
//	 a C2 instruction, there is no transition between ST_REQ_ST & LD_REQ_ST. 
//	 After, IDLE state is reached, the FSM remains in that state for 
//	 atleast two more cycles. 
// 
//	***rdma_reg_vld above is nothing but an OR of ST_REQ_ST  and LD_REQ_ST states. 
// 
//////////////////////////////////////////////////////////////////////// 
 
assign	tag_siu_req_state_in[`IDLE] = 	((tag_siu_req_state[`ST_REQ_ST]  
					& oqu_st_complete_c7) | // STORE DONE 
					( tag_siu_req_state[`LD_REQ_ST]  
					& (&(rdma_cnt)) ) |	// LOAD DONE 
				      	tag_siu_req_state[`IDLE] )  & 
					~set_rdma_reg_vld_c3 ; 
 
assign	idle_state_in_l = ~tag_siu_req_state_in[`IDLE] ; 
 
l2t_tag_ctl_msff_ctl_macro__clr_1__width_1 ff_tag_siu_req_state_0  // sync reset active low
                           (.din(idle_state_in_l), .l1clk(l1clk),  
		.scan_in(ff_tag_siu_req_state_0_scanin),
		.scan_out(ff_tag_siu_req_state_0_scanout),
		.clr(~dbb_rst_l), 
		.dout(idle_state_l),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	tag_siu_req_state[`IDLE] = ~idle_state_l ;  
 
 
assign	tag_siu_req_state_in[`ST_REQ_ST] = ((tag_siu_req_state[`IDLE] & 
					set_rdma_reg_vld_c3 & ~ld64_inst_c3 ) | // NON LD REQ 
					tag_siu_req_state[`ST_REQ_ST]) & 
					~oqu_st_complete_c7;	// not ST_DONE 
						 
						 
assign	tag_siu_req_state_in[`LD_REQ_ST] = ((tag_siu_req_state[`IDLE] & 
					set_rdma_reg_vld_c3 & ld64_inst_c3 ) | // LD REQ 
					tag_siu_req_state[`LD_REQ_ST]) & 
					~(&(rdma_cnt));	// LD_DONE 
						 
 
l2t_tag_ctl_msff_ctl_macro__clr_1__width_2 ff_tag_siu_req_state  // sync reset active low
		(.din(tag_siu_req_state_in[`LD_REQ_ST:`ST_REQ_ST]), .l1clk(l1clk),  
		.scan_in(ff_tag_siu_req_state_scanin),
		.scan_out(ff_tag_siu_req_state_scanout),
		.clr(~dbb_rst_l), 
		.dout(tag_siu_req_state[`LD_REQ_ST:`ST_REQ_ST]),
  .siclk(siclk),
  .soclk(soclk)  
		 
); 
 
 
assign	tag_siu_req_en_c52 = ( tag_siu_req_state[`LD_REQ_ST] & 
				( rdma_cnt == 4'd3 ) ) | 
				( tag_siu_req_state[`ST_REQ_ST] & 
					oqu_st_complete_c7 ) ; 
 
 
 
 
 
//////////////////////////////////// 
// 
// rdma rd counter 
// trigger the count 
// in C3, and in C18 
// the counter is reset 
// 
// The rdmard counter is a C4 flop. 
// 
///////////////////////////////////// 
 
assign inc_rdma_cnt_c3 =  |(rdma_cnt) | rd64_complete_c3 ; 
 
l2t_tag_ctl_msff_ctl_macro__clr_1__width_1 ff_inc_rdma_cnt_c4  // sync reset active low
                           (.din(inc_rdma_cnt_c3), .l1clk(l1clk),  
		.scan_in(ff_inc_rdma_cnt_c4_scanin),
		.scan_out(ff_inc_rdma_cnt_c4_scanout),
		.clr(~dbb_rst_l), 
		.dout(inc_rdma_cnt_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	tag_inc_rdma_cnt_c4 = inc_rdma_cnt_c4 ; 
 
assign	rdma_cnt_plus1 = rdma_cnt +4'b1 ; 
 
assign	rdma_cnt_reset = ~dbb_rst_l ; 
 
l2t_tag_ctl_msff_ctl_macro__clr_1__en_1__width_4 ff_rdmard_cnt  // sync reset active high
                           (.din(rdma_cnt_plus1[3:0]), 
                 .scan_in(ff_rdmard_cnt_scanin),
                 .scan_out(ff_rdmard_cnt_scanout),
                 .en(inc_rdma_cnt_c3), .l1clk(l1clk), .clr(rdma_cnt_reset), 
                 .dout(rdma_cnt[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 
//////////////////////////////////////////// 
// rdma rd pipeline For holding error state 
// and address. 
// 
// 
//c5: 	$ read cyc1 
//c6: 	$ read cyc2 
//c7: 	 xmit inside l2d  
//c8: 	 xmit from l2d to l2b  
//c9: 	 mux data 
//c10:	 perform ECC. 
//c11:	 xmit data and xmit errors to l2t 
//   :   HOLD the C11 address  
//       and C11 errors in filbuf. 
//c12:	 flop errors in l2t. 
// 
// 
// The hold signal in C11 is generated here. 
// 
//////////////////////////////////////////// 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_rd64_complete_c4 
                           (.din(rd64_complete_c3), .l1clk(l1clk),  
		.scan_in(ff_rd64_complete_c4_scanin),
		.scan_out(ff_rd64_complete_c4_scanout),
		.dout(rd64_complete_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_rd64_complete_c5 
                           (.din(rd64_complete_c4), .l1clk(l1clk),  
		.scan_in(ff_rd64_complete_c5_scanin),
		.scan_out(ff_rd64_complete_c5_scanout),
		.dout(rd64_complete_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_tag_ctl_msff_ctl_macro__width_1 ff_rd64_complete_c52 
                           (.din(rd64_complete_c5), .l1clk(l1clk),
                .scan_in(ff_rd64_complete_c52_scanin),
                .scan_out(ff_rd64_complete_c52_scanout),
                .dout(rd64_complete_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_rd64_complete_c6 
                           (.din(rd64_complete_c52), .l1clk(l1clk),  
		.scan_in(ff_rd64_complete_c6_scanin),
		.scan_out(ff_rd64_complete_c6_scanout),
		.dout(rd64_complete_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_rd64_complete_c7 
                           (.din(rd64_complete_c6), .l1clk(l1clk),  
		.scan_in(ff_rd64_complete_c7_scanin),
		.scan_out(ff_rd64_complete_c7_scanout),
		.dout(rd64_complete_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_rd64_complete_c8 
                           (.din(rd64_complete_c7), .l1clk(l1clk),  
		.scan_in(ff_rd64_complete_c8_scanin),
		.scan_out(ff_rd64_complete_c8_scanout),
		.dout(rd64_complete_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_rd64_complete_c9 
                           (.din(rd64_complete_c8), .l1clk(l1clk),  
		.scan_in(ff_rd64_complete_c9_scanin),
		.scan_out(ff_rd64_complete_c9_scanout),
		.dout(rd64_complete_c9),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_rd64_complete_c10 
                           (.din(rd64_complete_c9), .l1clk(l1clk),  
		.scan_in(ff_rd64_complete_c10_scanin),
		.scan_out(ff_rd64_complete_c10_scanout),
		.dout(rd64_complete_c10),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tag_ctl_msff_ctl_macro__width_1 ff_rd64_complete_c11 
                           (.din(rd64_complete_c10), .l1clk(l1clk),  
		.scan_in(ff_rd64_complete_c11_scanin),
		.scan_out(ff_rd64_complete_c11_scanout),
		.dout(rd64_complete_c11),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	tag_rd64_complete_c11 = rd64_complete_c11 ; 
 
 
 
 
// fixscan start:
assign spares_scanin             = scan_in                  ;
assign reset_flop_scanin         = spares_scanout           ;
assign ff_mbist_run_scanin       = reset_flop_scanout       ;
assign ff_mbist_arb_l2d_en_d1_scanin = ff_mbist_run_scanout     ;
assign ff_l2_bypass_mode_on_scanin = ff_mbist_arb_l2d_en_d1_scanout;
assign ff_fill_vld_c3_scanin     = ff_l2_bypass_mode_on_scanout;
assign ff_ld64_inst_c2_scanin    = ff_fill_vld_c3_scanout   ;
assign ff_temp_way_sel_c2_scanin = ff_ld64_inst_c2_scanout  ;
assign ff_evict_unqual_vld_c3_scanin = ff_temp_way_sel_c2_scanout;
assign ff_wr8_no_ctrue_c2_scanin = ff_evict_unqual_vld_c3_scanout;
assign ff_tag_hit_way_vld_c3_scanin = ff_wr8_no_ctrue_c2_scanout;
assign ff_tag_l2d_way_sel_c3_scanin = ff_tag_hit_way_vld_c3_scanout;
assign ff_way_sel_unqual_c3_scanin = ff_tag_l2d_way_sel_c3_scanout;
assign ff_filbuf_tag_evict_way_c4_scanin = ff_way_sel_unqual_c3_scanout;
assign ff_filbuf_tag_hit_c3_scanin = ff_filbuf_tag_evict_way_c4_scanout;
assign ff_tag_dir_l2way_sel_c4_scanin = ff_filbuf_tag_hit_c3_scanout;
assign ff_alt_tag_miss_unqual_c3_scanin = ff_tag_dir_l2way_sel_c4_scanout;
assign ff_tag_hit_c3_scanin      = ff_alt_tag_miss_unqual_c3_scanout;
assign ff_tag_hit_l2orfb_c3_scanin = ff_tag_hit_c3_scanout    ;
assign ff_tag_hit_not_comp_c3_scanin = ff_tag_hit_l2orfb_c3_scanout;
assign ff_encoded_lru_c4_scanin  = ff_tag_hit_not_comp_c3_scanout;
assign ff_addr5to4_c2_scanin     = ff_encoded_lru_c4_scanout;
assign ff_dec_col_offset_prev_c2_scanin = ff_addr5to4_c2_scanout   ;
assign ff_col_offset_sel_c2_scanin = ff_dec_col_offset_prev_c2_scanout;
assign ff_imiss_tag_hit_c4_scanin = ff_col_offset_sel_c2_scanout;
assign ff_rdma_inst_c2_scanin    = ff_imiss_tag_hit_c4_scanout;
assign ff_rdma_inst_c3_scanin    = ff_rdma_inst_c2_scanout  ;
assign ff_st_to_data_array_c3_scanin = ff_rdma_inst_c3_scanout  ;
assign ff_tag_spc_rd_vld_c4_scanin = ff_st_to_data_array_c3_scanout;
assign ff_tag_spc_rd_vld_c5_scanin = ff_tag_spc_rd_vld_c4_scanout;
assign ff_tag_spc_rd_vld_c52_scanin = ff_tag_spc_rd_vld_c5_scanout;
assign ff_tag_spc_rd_vld_c6_scanin = ff_tag_spc_rd_vld_c52_scanout;
assign ff_tag_spc_rd_vld_c7_scanin = ff_tag_spc_rd_vld_c6_scanout;
assign ff_tag_bsc_rd_vld_c4_scanin = ff_tag_spc_rd_vld_c7_scanout;
assign ff_tag_bsc_rd_vld_c5_scanin = ff_tag_bsc_rd_vld_c4_scanout;
assign ff_tag_bsc_rd_vld_c52_scanin = ff_tag_bsc_rd_vld_c5_scanout;
assign ff_tag_bsc_rd_vld_c6_scanin = ff_tag_bsc_rd_vld_c52_scanout;
assign ff_tag_bsc_rd_vld_c7_scanin = ff_tag_bsc_rd_vld_c6_scanout;
assign ff_prev_rd_wr_c2_scanin   = ff_tag_bsc_rd_vld_c7_scanout;
assign ff_pst_with_ctrue_c2_scanin = ff_prev_rd_wr_c2_scanout ;
assign ff_mb_errs_c2_scanin      = ff_pst_with_ctrue_c2_scanout;
assign ff_prev_rd_wr_c2_1_scanin = ff_mb_errs_c2_scanout    ;
assign ff_tag_st_to_data_array_c3_scanin = ff_prev_rd_wr_c2_1_scanout;
assign ff_prev_wen_c1_scanin     = ff_tag_st_to_data_array_c3_scanout;
assign ff_sel_prev_wen_c2_scanin = ff_prev_wen_c1_scanout   ;
assign ff_dec_word_addr_c2_scanin = ff_sel_prev_wen_c2_scanout;
assign ff_dec_word_enable_c2_scanin = ff_dec_word_addr_c2_scanout;
assign ff_tecc_c2_scanin         = ff_dec_word_enable_c2_scanout;
assign ff_scrub_fsm_cnt_scanin   = ff_tecc_c2_scanout       ;
assign ff_scrub_addr_cnt_scanin  = ff_scrub_fsm_cnt_scanout ;
assign ff_decc_tag_acc_en_px2_scanin = ff_scrub_addr_cnt_scanout;
assign ff_scrub_way_vld_c3_scanin = ff_decc_tag_acc_en_px2_scanout;
assign ff_scrub_way_vld_c4_scanin = ff_scrub_way_vld_c3_scanout;
assign ff_scrub_way_vld_c5_scanin = ff_scrub_way_vld_c4_scanout;
assign ff_scrub_way_vld_c52_scanin = ff_scrub_way_vld_c5_scanout;
assign ff_scrub_way_vld_c6_scanin = ff_scrub_way_vld_c52_scanout;
assign ff_scrub_way_vld_c7_scanin = ff_scrub_way_vld_c6_scanout;
assign ff_scrub_rd_vld_c8_scanin = ff_scrub_way_vld_c7_scanout;
assign ff_scrub_wr_disable_c9_scanin = ff_scrub_rd_vld_c8_scanout;
assign ff_l2b_fbwr_wen_r2_scanin = ff_scrub_wr_disable_c9_scanout;
assign ff_tag_l2b_fbd_stdatasel_c3_scanin = ff_l2b_fbwr_wen_r2_scanout;
assign ff_imiss_vld_c3_scanin    = ff_tag_l2b_fbd_stdatasel_c3_scanout;
assign ff_imiss_hit_c4_scanin    = ff_imiss_vld_c3_scanout  ;
assign ff_imiss_hit_c5_scanin    = ff_imiss_hit_c4_scanout  ;
assign ff_swap_inst_c3_scanin    = ff_imiss_hit_c5_scanout  ;
assign ff_pst_no_ctrue_c3_scanin = ff_swap_inst_c3_scanout  ;
assign ff_cas1_inst_c3_scanin    = ff_pst_no_ctrue_c3_scanout;
assign ff_ld_inst_c3_scanin      = ff_cas1_inst_c3_scanout  ;
assign ff_ld_hit_c4_scanin       = ff_ld_inst_c3_scanout    ;
assign ff_ld_hit_c5_scanin       = ff_ld_hit_c4_scanout     ;
assign ff_inst_vld_c3_scanin     = ff_ld_hit_c5_scanout     ;
assign ff_inst_diag_c3_scanin    = ff_inst_vld_c3_scanout   ;
assign ff_inst_mb_c3_scanin      = ff_inst_diag_c3_scanout  ;
assign ff_inst_mb_c4_scanin      = ff_inst_mb_c3_scanout    ;
assign ff_inst_mb_c5_scanin      = ff_inst_mb_c4_scanout    ;
assign ff_misbuf_hit_unqual_c3_scanin = ff_inst_mb_c5_scanout    ;
assign ff_inst_dep_c3_scanin     = ff_misbuf_hit_unqual_c3_scanout;
assign ff_store_inst_c3_scanin   = ff_inst_dep_c3_scanout   ;
assign ff_store_inst_c4_scanin   = ff_store_inst_c3_scanout ;
assign ff_store_inst_c5_scanin   = ff_store_inst_c4_scanout ;
assign ff_cas2_from_mb_c3_scanin = ff_store_inst_c5_scanout ;
assign ff_pst_with_ctrue_c3_scanin = ff_cas2_from_mb_c3_scanout;
assign ff_inval_inst_c3_scanin   = ff_pst_with_ctrue_c3_scanout;
assign ff_strstore_c3_scanin     = ff_inval_inst_c3_scanout ;
assign ff_diag_rd_en_c3_scanin   = ff_strstore_c3_scanout   ;
assign ff_diag_wr_en_c3_scanin   = ff_diag_rd_en_c3_scanout ;
assign ff_diag_complete_c4_scanin = ff_diag_wr_en_c3_scanout ;
assign ff_tecc_c3_scanin         = ff_diag_complete_c4_scanout;
assign ff_tag_hit_unqual_c3_scanin = ff_tecc_c3_scanout       ;
assign ff_st_ack_c4_scanin       = ff_tag_hit_unqual_c3_scanout;
assign ff_st_ack_c5_scanin       = ff_st_ack_c4_scanout     ;
assign ff_inval_req_c4_scanin    = ff_st_ack_c5_scanout     ;
assign ff_inval_ack_c5_scanin    = ff_inval_req_c4_scanout  ;
assign ff_tag_hit_c4_scanin      = ff_inval_ack_c5_scanout  ;
assign ff_tag_hit_c5_scanin      = ff_tag_hit_c4_scanout    ;
assign ff_st_req_c4_scanin       = ff_tag_hit_c5_scanout    ;
assign ff_st_req_c5_scanin       = ff_st_req_c4_scanout     ;
assign ff_sel_diag_store_data_c5_scanin = ff_st_req_c5_scanout     ;
assign ff_sel_diag_store_data_c52_scanin = ff_sel_diag_store_data_c5_scanout;
assign ff_sel_diag_store_data_c6_scanin = ff_sel_diag_store_data_c52_scanout;
assign ff_sel_diag_store_data_c7_scanin = ff_sel_diag_store_data_c6_scanout;
assign ff_strst_ack_c4_scanin    = ff_sel_diag_store_data_c7_scanout;
assign ff_strst_ack_c5_scanin    = ff_strst_ack_c4_scanout  ;
assign ff_rmo_st_ack_c4_scanin   = ff_strst_ack_c5_scanout  ;
assign ff_rmo_st_ack_c5_scanin   = ff_rmo_st_ack_c4_scanout ;
assign ff_nonmem_comp_c5_scanin  = ff_rmo_st_ack_c5_scanout ;
assign ff_nonmem_comp_c52_scanin = ff_nonmem_comp_c5_scanout;
assign ff_nonmem_comp_c6_scanin  = ff_nonmem_comp_c52_scanout;
assign ff_st_with_ctrue_c3_scanin = ff_nonmem_comp_c6_scanout;
assign ff_misbuf_uerr_c3_scanin  = ff_st_with_ctrue_c3_scanout;
assign ff_misbuf_cerr_c3_scanin  = ff_misbuf_uerr_c3_scanout;
assign ff_uerr_ack_tmp_c4_scanin = ff_misbuf_cerr_c3_scanout;
assign ff_uerr_ack_c4_scanin     = ff_uerr_ack_tmp_c4_scanout;
assign ff_uerr_ack_c5_scanin     = ff_uerr_ack_c4_scanout   ;
assign ff_error_ceen_d1_scanin   = ff_uerr_ack_c5_scanout   ;
assign ff_error_nceen_d1_scanin  = ff_error_ceen_d1_scanout ;
assign ff_cerr_ack_tmp_c4_scanin = ff_error_nceen_d1_scanout;
assign ff_cerr_ack_c4_scanin     = ff_cerr_ack_tmp_c4_scanout;
assign ff_cerr_ack_c5_scanin     = ff_cerr_ack_c4_scanout   ;
assign ff_dis_nderr_c5_scanin    = ff_cerr_ack_c5_scanout   ;
assign ff_inst_int_c3_scanin     = ff_dis_nderr_c5_scanout  ;
assign ff_int_ack_c4_scanin      = ff_inst_int_c3_scanout   ;
assign ff_int_ack_c5_scanin      = ff_int_ack_c4_scanout    ;
assign ff_fwd_req_c3_scanin      = ff_int_ack_c5_scanout    ;
assign ff_fwd_req_vld_diag_c4_scanin = ff_fwd_req_c3_scanout    ;
assign ff_fwd_req_ret_c4_scanin  = ff_fwd_req_vld_diag_c4_scanout;
assign ff_fwd_req_ret_c5_scanin  = ff_fwd_req_ret_c4_scanout;
assign ff_fwd_req_ld_c4_scanin   = ff_fwd_req_ret_c5_scanout;
assign ff_fwd_req_ld_c5_scanin   = ff_fwd_req_ld_c4_scanout ;
assign ff_fwd_req_ld_c52_scanin  = ff_fwd_req_ld_c5_scanout ;
assign ff_fwd_req_ld_c6_scanin   = ff_fwd_req_ld_c52_scanout;
assign ff_ld64_inst_c3_scanin    = ff_fwd_req_ld_c6_scanout ;
assign ff_wr64_inst_c3_scanin    = ff_ld64_inst_c3_scanout  ;
assign ff_wr8_inst_c3_scanin     = ff_wr64_inst_c3_scanout  ;
assign ff_sel_rdma_inval_vec_c4_scanin = ff_wr8_inst_c3_scanout   ;
assign ff_sel_rdma_inval_vec_c5_scanin = ff_sel_rdma_inval_vec_c4_scanout;
assign ff_tag_rdma_ev_en_c3_scanin = ff_sel_rdma_inval_vec_c5_scanout;
assign ff_rdma_reg_vld_scanin    = ff_tag_rdma_ev_en_c3_scanout;
assign ff_tag_rdma_wr_comp_c4_scanin = ff_rdma_reg_vld_scanout  ;
assign ff_misbuf_rdma_reg_vld_c2_scanin = ff_tag_rdma_wr_comp_c4_scanout;
assign ff_rdma_vld_px0_p_scanin  = ff_misbuf_rdma_reg_vld_c2_scanout;
assign ff_rdma_vld_px1_scanin    = ff_rdma_vld_px0_p_scanout;
assign ff_set_rdma_reg_vld_c4_scanin = ff_rdma_vld_px1_scanout  ;
assign ff_tag_siu_req_state_0_scanin = ff_set_rdma_reg_vld_c4_scanout;
assign ff_tag_siu_req_state_scanin = ff_tag_siu_req_state_0_scanout;
assign ff_inc_rdma_cnt_c4_scanin = ff_tag_siu_req_state_scanout;
assign ff_rdmard_cnt_scanin      = ff_inc_rdma_cnt_c4_scanout;
assign ff_rd64_complete_c4_scanin = ff_rdmard_cnt_scanout    ;
assign ff_rd64_complete_c5_scanin = ff_rd64_complete_c4_scanout;
assign ff_rd64_complete_c52_scanin = ff_rd64_complete_c5_scanout;
assign ff_rd64_complete_c6_scanin = ff_rd64_complete_c52_scanout;
assign ff_rd64_complete_c7_scanin = ff_rd64_complete_c6_scanout;
assign ff_rd64_complete_c8_scanin = ff_rd64_complete_c7_scanout;
assign ff_rd64_complete_c9_scanin = ff_rd64_complete_c8_scanout;
assign ff_rd64_complete_c10_scanin = ff_rd64_complete_c9_scanout;
assign ff_rd64_complete_c11_scanin = ff_rd64_complete_c10_scanout;
assign scan_out                  = ff_rd64_complete_c11_scanout;
// fixscan end:
endmodule 








// any PARAMS parms go into naming of macro

module l2t_tag_ctl_l1clkhdr_ctl_macro (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module l2t_tag_ctl_spare_ctl_macro__num_4 (
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

module l2t_tag_ctl_msff_ctl_macro__width_1 (
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

module l2t_tag_ctl_msffi_ctl_macro__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  q_l, 
  scan_out);
  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] q_l;
  output scan_out;






msffi #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(din[0:0]),
.si(scan_in),
.so(scan_out),
.q_l(q_l[0:0])
);












endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 (
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


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_16 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [15:0] din0;
  input sel0;
  input [15:0] din1;
  input sel1;
  output [15:0] dout;





assign dout[15:0] = ( {16{sel0}} & din0[15:0] ) |
                       ( {16{sel1}} & din1[15:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_tag_ctl_msff_ctl_macro__width_16 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0];






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_tag_ctl_msff_ctl_macro__dmsff_32x__width_2 (
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

module l2t_tag_ctl_msff_ctl_macro__width_5 (
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

module l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 (
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






// any PARAMS parms go into naming of macro

module l2t_tag_ctl_msff_ctl_macro__width_4 (
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













// any PARAMS parms go into naming of macro

module l2t_tag_ctl_msff_ctl_macro__width_2 (
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

module l2t_tag_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_2 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [1:0] din0;
  input sel0;
  input [1:0] din1;
  input sel1;
  output [1:0] dout;





assign dout[1:0] = ( {2{sel0}} & din0[1:0] ) |
                       ( {2{sel1}} & din1[1:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_tag_ctl_msff_ctl_macro__dmsff_32x__width_16 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0];






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_tag_ctl_msff_ctl_macro__clr_1__en_1__width_4 (
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

module l2t_tag_ctl_msff_ctl_macro__clr_1__en_1__width_7 (
  din, 
  en, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input en;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = (din[6:0] & {7{en}} & ~{7{clr}}) | (dout[6:0] & ~{7{en}} & ~{7{clr}});






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

module l2t_tag_ctl_msff_ctl_macro__clr_1__en_1__width_1 (
  din, 
  en, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}} & ~{1{clr}}) | (dout[0:0] & ~{1{en}} & ~{1{clr}});






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

module l2t_tag_ctl_msff_ctl_macro__clr_1__dmsff_32x__width_2 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0] & ~{2{clr}};






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

module l2t_tag_ctl_msff_ctl_macro__clr_1__width_1 (
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

module l2t_tag_ctl_msff_ctl_macro__clr_1__width_2 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0] & ~{2{clr}};






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








