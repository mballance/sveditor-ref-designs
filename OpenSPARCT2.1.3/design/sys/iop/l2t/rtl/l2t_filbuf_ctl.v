// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_filbuf_ctl.v
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
//////////////////////////////////////////////////////////////////////// 
 
module l2t_filbuf_ctl (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  rdmat_rdmard_cerr_c12, 
  rdmat_rdmard_uerr_c12, 
  rdmat_rdmard_notdata_c12, 
  rdmat_ev_cerr_r6, 
  rdmat_ev_uerr_r6, 
  filbuf_fbtag_wr_ptr, 
  filbuf_fbtag_wr_en, 
  filbuf_buf_rd_en, 
  filbuf_fbtag_rd_ptr, 
  scan_out, 
  filbuf_tag_evict_way_c3, 
  filbuf_tag_hit_c2, 
  filbuf_arb_tag_hit_frm_mb_c2, 
  filbuf_misbuf_tag_hit_frm_mb_c2, 
  filbuf_fbd_rd_en_c2, 
  filbuf_fbd_rd_entry_c2, 
  filbuf_mcu_l2t_chunk_id_r1, 
  filbuf_mcu_l2t_data_vld_r1, 
  filbuf_fbd_wr_entry_r1, 
  l2t_mcu_rd_req_id, 
  filbuf_fb_count_eq_0, 
  filbuf_misbuf_entry_avail, 
  filbuf_misbuf_match_c2, 
  filbuf_misbuf_fbid_d2, 
  filbuf_fbf_enc_ld_mbid_r1, 
  filbuf_fbf_ready_miss_r1, 
  filbuf_fbf_enc_dep_mbid_c4, 
  filbuf_fbf_st_or_dep_rdy_c4, 
  filbuf_misbuf_nofill_d2, 
  filbuf_misbuf_stinst_match_c2, 
  filbuf_misbuf_ue_offmode_c7, 
  filbuf_misbuf_ce_offmode_c7, 
  filbuf_l2d_fb_hit_c3, 
  filbuf_vuad_bypassed_c3, 
  filbuf_arb_l2rd_en, 
  filbuf_arbdp_way_px2, 
  filbuf_arbdp_tecc_px2, 
  filbuf_arbdp_entry_px2, 
  filbuf_arb_vld_px1, 
  filbuf_corr_err_c8, 
  filbuf_uncorr_err_c8, 
  filbuf_mcu_scb_mecc_err_d1, 
  filbuf_mcu_scb_secc_err_d1, 
  filbuf_spc_corr_err_c6, 
  filbuf_spc_uncorr_err_c6, 
  filbuf_spc_rd_vld_c6, 
  filbuf_bsc_corr_err_c12, 
  filbuf_ld64_fb_hit_c12, 
  filbuf_dis_cerr_c3, 
  filbuf_dis_uerr_c3, 
  filbuf_dis_nderr_c3, 
  misbuf_vuad_ce_err_c8, 
  misbuf_filbuf_next_vld_c4, 
  misbuf_filbuf_next_link_c4, 
  misbuf_mbf_delete_c4, 
  misbuf_hit_c4, 
  misbuf_mbf_insert_c4, 
  mbdata_filbuf_mbf_entry, 
  misbuf_filbuf_mcu_pick, 
  misbuf_filbuf_fbid, 
  misbuf_filbuf_way, 
  misbuf_filbuf_way_fbid_vld, 
  misbuf_mbf_insert_mbid_c4, 
  mbdata_filbuf_rqtyp_d1, 
  mbdata_filbuf_rsvd_d1, 
  arb_decdp_imiss_inst_c2, 
  arbdec_arbdp_inst_mb_entry_c1, 
  arb_decdp_cas1_inst_c2, 
  arbdec_arbdp_rdma_inst_c1, 
  tag_misbuf_rdma_reg_vld_c2, 
  deccck_scrd_uncorr_err_c8, 
  deccck_scrd_corr_err_c8, 
  deccck_bscd_corr_err_c8, 
  deccck_bscd_uncorr_err_c8, 
  deccck_bscd_notdata_err_c8, 
  tagdp_tag_error_c8, 
  tag_rd64_complete_c11, 
  tag_cerr_ack_tmp_c4, 
  tag_uerr_ack_tmp_c4, 
  tag_spc_rd_cond_c3, 
  csr_filbuf_scrub_ready, 
  arb_filbuf_fbsel_c1, 
  arb_fill_vld_c2, 
  arb_filbuf_hit_off_c1, 
  arb_inst_vld_c2_prev, 
  arb_decdp_wr8_inst_c2, 
  arbdec_arbdp_inst_mb_c2, 
  arb_decdp_ld64_inst_c2, 
  fb_cam_match, 
  csr_l2_bypass_mode_on, 
  csr_l2_dir_map_on, 
  mcu_l2t_data_vld_r0, 
  mcu_l2t_rd_req_id_r0, 
  mcu_l2t_chunk_id_r0, 
  mcu_l2t_secc_err_r2, 
  mcu_l2t_mecc_err_r2, 
  mcu_l2t_scb_mecc_err, 
  mcu_l2t_scb_secc_err, 
  tag_rdma_gate_off_c2, 
  wmr_l, 
  scan_in, 
  l2clk, 
  l2t_mb2_run, 
  l2t_mb2_fbtag_wr_en, 
  l2t_mb2_fbtag_rd_en, 
  l2t_mb2_addr, 
  fb_mbist_cam_hit, 
  fb_mbist_cam_sel, 
  mbist_run);
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
wire ff_mcu_pick_d1_scanin;
wire ff_mcu_pick_d1_scanout;
wire [7:0] mbist_fbtag_wr_ptr;
wire [2:0] l2t_mb2_addr_r3;
wire ff_l2t_mb2_run_r1_scanin;
wire ff_l2t_mb2_run_r1_scanout;
wire l2t_mb2_fbtag_rd_en_r1;
wire l2t_mb2_fbtag_rd_en_r2;
wire l2t_mb2_fbtag_wr_en_r1;
wire l2t_mb2_fbtag_wr_en_r2;
wire [2:0] l2t_mb2_addr_r1;
wire [2:0] l2t_mb2_addr_r2;
wire mbist_run_r1;
wire l2t_mb2_fbtag_rd_en_r3;
wire fb_mbist_cam_sel_r1;
wire l2t_mb2_run_r1;
wire l2t_mb2_fbtag_wr_en_r3;
wire ff_filbuf_misbuf_fbid_d2_scanin;
wire ff_filbuf_misbuf_fbid_d2_scanout;
wire ff_fill_vld_c3_scanin;
wire ff_fill_vld_c3_scanout;
wire ff_l2_bypass_mode_on_scanin;
wire ff_l2_bypass_mode_on_scanout;
wire ff_l2_dir_map_on_d1_scanin;
wire ff_l2_dir_map_on_d1_scanout;
wire ff_rdma_inst_c2_scanin;
wire ff_rdma_inst_c2_scanout;
wire rdma_inst_c2;
wire ff_arb_filbuf_inst_vld_c2_scanin;
wire ff_arb_filbuf_inst_vld_c2_scanout;
wire arb_filbuf_inst_vld_c2;
wire ff_fb_set_valid_d2_scanin;
wire ff_fb_set_valid_d2_scanout;
wire ff_valid_bit_scanin;
wire ff_valid_bit_scanout;
wire ff_fb_count_scanin;
wire ff_fb_count_scanout;
wire ff_rqtyp_d2_scanin;
wire ff_rqtyp_d2_scanout;
wire ff_snp_d2_scanin;
wire ff_snp_d2_scanout;
wire ff_stinst_0_scanin;
wire ff_stinst_0_scanout;
wire ff_stinst_1_scanin;
wire ff_stinst_1_scanout;
wire ff_stinst_2_scanin;
wire ff_stinst_2_scanout;
wire ff_stinst_3_scanin;
wire ff_stinst_3_scanout;
wire ff_stinst_4_scanin;
wire ff_stinst_4_scanout;
wire ff_stinst_5_scanin;
wire ff_stinst_5_scanout;
wire ff_stinst_6_scanin;
wire ff_stinst_6_scanout;
wire ff_stinst_7_scanin;
wire ff_stinst_7_scanout;
wire ff_nofill_0_scanin;
wire ff_nofill_0_scanout;
wire ff_nofill_1_scanin;
wire ff_nofill_1_scanout;
wire ff_nofill_2_scanin;
wire ff_nofill_2_scanout;
wire ff_nofill_3_scanin;
wire ff_nofill_3_scanout;
wire ff_nofill_4_scanin;
wire ff_nofill_4_scanout;
wire ff_nofill_5_scanin;
wire ff_nofill_5_scanout;
wire ff_nofill_6_scanin;
wire ff_nofill_6_scanout;
wire ff_nofill_7_scanin;
wire ff_nofill_7_scanout;
wire ff_fb_hit_off_c1_d1_scanin;
wire ff_fb_hit_off_c1_d1_scanout;
wire fb_hit_off_c1_d1;
wire fb_mbist_cam_hit_unreg;
wire ff_fb_cam_hit_vec_scanin;
wire ff_fb_cam_hit_vec_scanout;
wire [7:0] fb_cam_match_d1;
wire filbuf_tag_hit_frm_mb_c2;
wire ff_imiss_ld64_fb_hit_c3_scanin;
wire ff_imiss_ld64_fb_hit_c3_scanout;
wire ff_l2d_fb_hit_c3_scanin;
wire ff_l2d_fb_hit_c3_scanout;
wire ff_qual_hit_vec_c3_scanin;
wire ff_qual_hit_vec_c3_scanout;
wire ff_qual_hit_vec_c4_scanin;
wire ff_qual_hit_vec_c4_scanout;
wire ff_bypassed_scanin;
wire ff_bypassed_scanout;
wire ff_fill_entry_num_c2_scanin;
wire ff_fill_entry_num_c2_scanout;
wire ff_fill_entry_num_c3_scanin;
wire ff_fill_entry_num_c3_scanout;
wire ff_inst_vld_c3_scanin;
wire ff_inst_vld_c3_scanout;
wire ff_misbuf_filbuf_fbid_d1_scanin;
wire ff_misbuf_filbuf_fbid_d1_scanout;
wire ff_misbuf_filbuf_way_d1_scanin;
wire ff_misbuf_filbuf_way_d1_scanout;
wire ff_misbuf_filbuf_way_vld_d1_scanin;
wire ff_misbuf_filbuf_way_vld_d1_scanout;
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
wire ff_way_vld_scanin;
wire ff_way_vld_scanout;
wire ff_data_vld_r0_d1_scanin;
wire ff_data_vld_r0_d1_scanout;
wire ff_data_vld_r1_scanin;
wire ff_data_vld_r1_scanout;
wire ff_mcu_l2t_chunk_id_r0_d1_scanin;
wire ff_mcu_l2t_chunk_id_r0_d1_scanout;
wire ff_mcu_l2t_chunk_id_r1_scanin;
wire ff_mcu_l2t_chunk_id_r1_scanout;
wire ff_l2t_req_id_r0_d1_scanin;
wire ff_l2t_req_id_r0_d1_scanout;
wire ff_l2t_req_id_r1_scanin;
wire ff_l2t_req_id_r1_scanout;
wire ff_mcu_cnt_scanin;
wire ff_mcu_cnt_scanout;
wire mcu_count_state1;
wire mcu_count_state3;
wire ready_imiss_r0_d1;
wire ff_cas1_inst_c3_scanin;
wire ff_cas1_inst_c3_scanout;
wire ff_cas1_inst_c4_scanin;
wire ff_cas1_inst_c4_scanout;
wire ff_fb_hit_vec_c3_scanin;
wire ff_fb_hit_vec_c3_scanout;
wire ff_fb_hit_vec_c4_scanin;
wire ff_fb_hit_vec_c4_scanout;
wire ff_fb_l2_ready_scanin;
wire ff_fb_l2_ready_scanout;
wire ff_l2_pick_d1_scanin;
wire ff_l2_pick_d1_scanout;
wire ff_l2_wait_scanin;
wire ff_l2_wait_scanout;
wire ff_l2_entry_px2_scanin;
wire ff_l2_entry_px2_scanout;
wire ff_l2_way_px2_scanin;
wire ff_l2_way_px2_scanout;
wire ff_mbf_entry_d2_scanin;
wire ff_mbf_entry_d2_scanout;
wire ff_mbid0_scanin;
wire ff_mbid0_scanout;
wire ff_mbid1_scanin;
wire ff_mbid1_scanout;
wire ff_mbid2_scanin;
wire ff_mbid2_scanout;
wire ff_mbid3_scanin;
wire ff_mbid3_scanout;
wire ff_mbid4_scanin;
wire ff_mbid4_scanout;
wire ff_mbid5_scanin;
wire ff_mbid5_scanout;
wire ff_mbid6_scanin;
wire ff_mbid6_scanout;
wire ff_mbid7_scanin;
wire ff_mbid7_scanout;
wire ff_fill_complete_c4_scanin;
wire ff_fill_complete_c4_scanout;
wire ff_fb_next_link_vld_scanin;
wire ff_fb_next_link_vld_scanout;
wire ff_enc_hit_vec_c3_scanin;
wire ff_enc_hit_vec_c3_scanout;
wire ff_fill_entry_c2_scanin;
wire ff_fill_entry_c2_scanout;
wire ff_fill_entry_c3_scanin;
wire ff_fill_entry_c3_scanout;
wire dbginit_l;
wire ff_l2_rd_state_scanin;
wire ff_l2_rd_state_scanout;
wire ff_l2_rd_state_quad0_scanin;
wire ff_l2_rd_state_quad0_scanout;
wire ff_l2_rd_state_quad1_scanin;
wire ff_l2_rd_state_quad1_scanout;
wire ff_l2_rd_ptr_scanin;
wire ff_l2_rd_ptr_scanout;
wire ff_secc_err_r3_scanin;
wire ff_secc_err_r3_scanout;
wire ff_mecc_err_r3_scanin;
wire ff_mecc_err_r3_scanout;
wire ff_data_vld_r2_scanin;
wire ff_data_vld_r2_scanout;
wire ff_data_vld_r3_scanin;
wire ff_data_vld_r3_scanout;
wire ff_mcu_rd_req_id_r2_scanin;
wire ff_mcu_rd_req_id_r2_scanout;
wire ff_mcu_rd_req_id_r3_scanin;
wire ff_mcu_rd_req_id_r3_scanout;
wire ff_wr8_inst_c3_scanin;
wire ff_wr8_inst_c3_scanout;
wire ff_wr8_inst_c4_scanin;
wire ff_wr8_inst_c4_scanout;
wire ff_fb_cerr_scanin;
wire ff_fb_cerr_scanout;
wire ff_fb_uerr_scanin;
wire ff_fb_uerr_scanout;
wire filbuf_misbuf_ue_offmode_c3;
wire filbuf_misbuf_ce_offmode_c3;
wire ff_filbuf_misbuf_ue_offmode_scanin;
wire ff_filbuf_misbuf_ue_offmode_scanout;
wire ff_filbuf_misbuf_ce_offmode_scanin;
wire ff_filbuf_misbuf_ce_offmode_scanout;
wire ff_filbuf_corr_err_c4_scanin;
wire ff_filbuf_corr_err_c4_scanout;
wire ff_filbuf_corr_err_c5_scanin;
wire ff_filbuf_corr_err_c5_scanout;
wire ff_filbuf_corr_err_c52_scanin;
wire ff_filbuf_corr_err_c52_scanout;
wire ff_filbuf_corr_err_c6_scanin;
wire ff_filbuf_corr_err_c6_scanout;
wire ff_filbuf_corr_err_c7_scanin;
wire ff_filbuf_corr_err_c7_scanout;
wire ff_filbuf_corr_err_c8_scanin;
wire ff_filbuf_corr_err_c8_scanout;
wire ff_filbuf_uncorr_err_c4_scanin;
wire ff_filbuf_uncorr_err_c4_scanout;
wire ff_filbuf_uncorr_err_c5_scanin;
wire ff_filbuf_uncorr_err_c5_scanout;
wire ff_filbuf_uncorr_err_c52_scanin;
wire ff_filbuf_uncorr_err_c52_scanout;
wire ff_filbuf_uncorr_err_c6_scanin;
wire ff_filbuf_uncorr_err_c6_scanout;
wire ff_filbuf_uncorr_err_c7_scanin;
wire ff_filbuf_uncorr_err_c7_scanout;
wire ff_filbuf_uncorr_err_c8_scanin;
wire ff_filbuf_uncorr_err_c8_scanout;
wire ff_filbuf_hit_c3_scanin;
wire ff_filbuf_hit_c3_scanout;
wire ff_filbuf_hit_c4_scanin;
wire ff_filbuf_hit_c4_scanout;
wire filbuf_hit_c4;
wire ff_imiss_inst_c3_scanin;
wire ff_imiss_inst_c3_scanout;
wire imiss_inst_c3;
wire ff_imiss_inst_c4_scanin;
wire ff_imiss_inst_c4_scanout;
wire imiss_inst_c4;
wire ff_ld64_inst_c3_scanin;
wire ff_ld64_inst_c3_scanout;
wire ld64_inst_c3;
wire ff_spc_rd_vld_c4_scanin;
wire ff_spc_rd_vld_c4_scanout;
wire ff_spc_rd_vld_c5_scanin;
wire ff_spc_rd_vld_c5_scanout;
wire ff_spc_rd_vld_c52_scanin;
wire ff_spc_rd_vld_c52_scanout;
wire ff_spc_rd_vld_c6_scanin;
wire ff_spc_rd_vld_c6_scanout;
wire ff_fbcerr0_d1_scanin;
wire ff_fbcerr0_d1_scanout;
wire ff_fbuerr0_d1_scanin;
wire ff_fbuerr0_d1_scanout;
wire ff_spc_corr_err_c4_scanin;
wire ff_spc_corr_err_c4_scanout;
wire ff_spc_corr_err_c5_scanin;
wire ff_spc_corr_err_c5_scanout;
wire ff_spc_corr_err_c52_scanin;
wire ff_spc_corr_err_c52_scanout;
wire ff_spc_corr_err_c6_scanin;
wire ff_spc_corr_err_c6_scanout;
wire ff_spc_uncorr_err_c4_scanin;
wire ff_spc_uncorr_err_c4_scanout;
wire ff_spc_uncorr_err_c5_scanin;
wire ff_spc_uncorr_err_c5_scanout;
wire ff_spc_uncorr_err_c52_scanin;
wire ff_spc_uncorr_err_c52_scanout;
wire ff_spc_uncorr_err_c6_scanin;
wire ff_spc_uncorr_err_c6_scanout;
wire ff_bsc_corr_err_c4_scanin;
wire ff_bsc_corr_err_c4_scanout;
wire bsc_corr_err_c4;
wire ff_bsc_corr_err_c5_scanin;
wire ff_bsc_corr_err_c5_scanout;
wire bsc_corr_err_c5;
wire ff_bsc_corr_err_c52_scanin;
wire ff_bsc_corr_err_c52_scanout;
wire bsc_corr_err_c52;
wire ff_bsc_corr_err_c6_scanin;
wire ff_bsc_corr_err_c6_scanout;
wire bsc_corr_err_c6;
wire ff_bsc_corr_err_c7_scanin;
wire ff_bsc_corr_err_c7_scanout;
wire bsc_corr_err_c7;
wire ff_bsc_corr_err_c8_scanin;
wire ff_bsc_corr_err_c8_scanout;
wire bsc_corr_err_c8;
wire ff_bsc_corr_err_c9_scanin;
wire ff_bsc_corr_err_c9_scanout;
wire bsc_corr_err_c9;
wire ff_bsc_corr_err_c10_scanin;
wire ff_bsc_corr_err_c10_scanout;
wire bsc_corr_err_c10;
wire ff_bsc_corr_err_c11_scanin;
wire ff_bsc_corr_err_c11_scanout;
wire bsc_corr_err_c11;
wire ff_bsc_corr_err_c12_scanin;
wire ff_bsc_corr_err_c12_scanout;
wire bsc_corr_err_c12;
wire ff_ld64_fb_hit_c4_scanin;
wire ff_ld64_fb_hit_c4_scanout;
wire ld64_fb_hit_c4;
wire ff_ld64_fb_hit_c5_scanin;
wire ff_ld64_fb_hit_c5_scanout;
wire ld64_fb_hit_c5;
wire ff_ld64_fb_hit_c52_scanin;
wire ff_ld64_fb_hit_c52_scanout;
wire ld64_fb_hit_c52;
wire ff_ld64_fb_hit_c6_scanin;
wire ff_ld64_fb_hit_c6_scanout;
wire ld64_fb_hit_c6;
wire ff_ld64_fb_hit_c7_scanin;
wire ff_ld64_fb_hit_c7_scanout;
wire ld64_fb_hit_c7;
wire ff_ld64_fb_hit_c8_scanin;
wire ff_ld64_fb_hit_c8_scanout;
wire ld64_fb_hit_c8;
wire ff_ld64_fb_hit_c9_scanin;
wire ff_ld64_fb_hit_c9_scanout;
wire ld64_fb_hit_c9;
wire ff_ld64_fb_hit_c10_scanin;
wire ff_ld64_fb_hit_c10_scanout;
wire ld64_fb_hit_c10;
wire ff_ld64_fb_hit_c11_scanin;
wire ff_ld64_fb_hit_c11_scanout;
wire ld64_fb_hit_c11;
wire ff_ld64_fb_hit_c12_scanin;
wire ff_ld64_fb_hit_c12_scanout;
wire ld64_fb_hit_c12;
wire ff_mcu_scb_mecc_err_d1_scanin;
wire ff_mcu_scb_mecc_err_d1_scanout;
wire ff_mcu_scb_secc_err_d1_scanin;
wire ff_mcu_scb_secc_err_d1_scanout;
wire ff_fb_uerr_pend_scanin;
wire ff_fb_uerr_pend_scanout;
wire fb_nduerr_pend_set;
wire fb_nduerr_pend_reset;
wire fb_nduerr_pend_in;
wire fb_nduerr_pend;
wire ff_fb_nduerr_pend_scanin;
wire ff_fb_nduerr_pend_scanout;
wire ff_fb_cerr_pend_scanin;
wire ff_fb_cerr_pend_scanout;
wire fb_ndcerr_pend_set;
wire fb_ndcerr_pend_reset;
wire fb_ndcerr_pend_in;
wire fb_ndcerr_pend;
wire ff_fb_ndcerr_pend_scanin;
wire ff_fb_ndcerr_pend_scanout;
wire ff_fb_tecc_pend_scanin;
wire ff_fb_tecc_pend_scanout;
wire ff_fb_tecc_pend_d1_scanin;
wire ff_fb_tecc_pend_d1_scanout;
 

 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 
// from rdmat. 
input	rdmat_rdmard_cerr_c12;
input   rdmat_rdmard_uerr_c12;
input   rdmat_rdmard_notdata_c12;
input	rdmat_ev_cerr_r6;
input   rdmat_ev_uerr_r6;
// to fbtag. 
output	[7:0]	filbuf_fbtag_wr_ptr; // PH1 write. 
output		filbuf_fbtag_wr_en; // PH1 write. 
output		filbuf_buf_rd_en;	// to fbtag. 
output	[7:0]	filbuf_fbtag_rd_ptr ; // to fbtag. 
output scan_out; 
 
// to tag 
output [3:0]    filbuf_tag_evict_way_c3;// BS and SR 12/18/03, LRU way from Filbuf needs to be written to Dir on a Miss
output		filbuf_tag_hit_c2 ;   
output		filbuf_arb_tag_hit_frm_mb_c2;
output		filbuf_misbuf_tag_hit_frm_mb_c2;
output		filbuf_fbd_rd_en_c2; // to fbdata via tag 
output	[2:0]	filbuf_fbd_rd_entry_c2; // to fbdata via tag 
output	[1:0]	filbuf_mcu_l2t_chunk_id_r1; // to tag 
output		filbuf_mcu_l2t_data_vld_r1; // to tag 
output	[2:0]	filbuf_fbd_wr_entry_r1 ; 
 
// to mcu 
output	[2:0]	l2t_mcu_rd_req_id ; 
 
// to misbuf. 
output		filbuf_fb_count_eq_0; // to misbuf for csr inst ready 
output		filbuf_misbuf_entry_avail ; // to misbuf for mcu pick 
output		filbuf_misbuf_match_c2; // to misbuf for eviction and 
output	[2:0]	filbuf_misbuf_fbid_d2; 
output	[4:0]	filbuf_fbf_enc_ld_mbid_r1;  // BS & SR 11/04/03, MB grows to 32
output		filbuf_fbf_ready_miss_r1; 
output	[4:0]	filbuf_fbf_enc_dep_mbid_c4; // BS & SR 11/04/03, MB grows to 32
output		filbuf_fbf_st_or_dep_rdy_c4; 
output	filbuf_misbuf_nofill_d2; // to misbuf 
output	filbuf_misbuf_stinst_match_c2; // NEW_PIN 
output          filbuf_misbuf_ue_offmode_c7;
output          filbuf_misbuf_ce_offmode_c7;
 
// to l2d 
output		filbuf_l2d_fb_hit_c3; // used in C5 to select between 
 
// to vuad dp 
output		filbuf_vuad_bypassed_c3; 
 
 
// to arb 
output		filbuf_arb_l2rd_en; // to arbaddr 
output	[3:0]	filbuf_arbdp_way_px2; // goes to arb and arbdec. 
output		filbuf_arbdp_tecc_px2; 
output	[2:0]	filbuf_arbdp_entry_px2; 
output		filbuf_arb_vld_px1; // to arb  
 
// to csr 
output	filbuf_corr_err_c8 ; // to csr 
output	filbuf_uncorr_err_c8 ; // to csr 
output	filbuf_mcu_scb_mecc_err_d1;
output  filbuf_mcu_scb_secc_err_d1;
 
// to decc will take c6 for timing reasons
//output	filbuf_spc_corr_err_c7; // to decc 
//output	filbuf_spc_uncorr_err_c7; // to decc 
//output	filbuf_spc_rd_vld_c7; // to decc 
output        filbuf_spc_corr_err_c6; // to decc
output        filbuf_spc_uncorr_err_c6; // to decc
output        filbuf_spc_rd_vld_c6; // to decc





output	filbuf_bsc_corr_err_c12; // to decc NEW_PIN 
output	filbuf_ld64_fb_hit_c12; // to decc NEW_PIN 
 
// to oqu. 
output	filbuf_dis_cerr_c3; 
output	filbuf_dis_uerr_c3;  
output [1:0] filbuf_dis_nderr_c3; 
 
// from  misbuf 
input           misbuf_vuad_ce_err_c8;
input		misbuf_filbuf_next_vld_c4; 
input	[4:0]	misbuf_filbuf_next_link_c4; // BS & SR 11/04/03, MB grows to 32
input		misbuf_mbf_delete_c4; 
input		misbuf_hit_c4; 
input		misbuf_mbf_insert_c4; 
input	[4:0]	mbdata_filbuf_mbf_entry; // BS & SR 11/04/03, MB grows to 32
input		misbuf_filbuf_mcu_pick; 
input   [2:0]   misbuf_filbuf_fbid; 
input   [3:0]   misbuf_filbuf_way ; 
input           misbuf_filbuf_way_fbid_vld ; 
input	[4:0]	misbuf_mbf_insert_mbid_c4; // BS & SR 11/04/03, MB grows to 32
 
// from mbdata. 
input	[4:0]	mbdata_filbuf_rqtyp_d1; // from mbdata. 
input		mbdata_filbuf_rsvd_d1; // RSVD bit from mbdata 
 
// from arbdec 
input		arb_decdp_imiss_inst_c2; 
// int 5.0 changes
// input		arb_decdp_ld_inst_c2;  // NEW_PIN 
input	[2:0]	arbdec_arbdp_inst_mb_entry_c1; 

input		arb_decdp_cas1_inst_c2;// from arbdec 
 
 
input	arbdec_arbdp_rdma_inst_c1;  // POST_3.0 pin From arbdec Left 
input	tag_misbuf_rdma_reg_vld_c2; // POST_3.0 pin from tag Bottom. 
 
// from decc. 
input	deccck_scrd_uncorr_err_c8; 
input	deccck_scrd_corr_err_c8; 
input	deccck_bscd_corr_err_c8; 
input	deccck_bscd_uncorr_err_c8; 
input   deccck_bscd_notdata_err_c8;
 
// from tagd 
input	tagdp_tag_error_c8; // from tagd/ 
 
// from tag 
input	tag_rd64_complete_c11; // from tag. NEW_PIN 
input	tag_cerr_ack_tmp_c4;
input   tag_uerr_ack_tmp_c4; // POST_2.0 pins
input	tag_spc_rd_cond_c3; // POST_3.2 pins 

 
// from csr block 
input	csr_filbuf_scrub_ready ; 
 
// from arb 
input		arb_filbuf_fbsel_c1; // from arb 
input		arb_fill_vld_c2; 
input		arb_filbuf_hit_off_c1; // from arb. used to disable hits. 
//input		arb_filbuf_inst_vld_c2; 
input		arb_inst_vld_c2_prev; 
input		arb_decdp_wr8_inst_c2; 
 
// from arbdec 
input		arbdec_arbdp_inst_mb_c2 ; 
input		arb_decdp_ld64_inst_c2; 
 
 
// from fbtag 
input	[7:0] 	fb_cam_match; 
 
// from csr 
input	      csr_l2_bypass_mode_on ; 
input	      csr_l2_dir_map_on ; // NEW_PIN 
 
// from BTU 
input		mcu_l2t_data_vld_r0; // data vld r0 
input	[2:0]	mcu_l2t_rd_req_id_r0 ; // req id r0 
input	[1:0]	mcu_l2t_chunk_id_r0;  // 16B chunk address. 
input	mcu_l2t_secc_err_r2; 
input	mcu_l2t_mecc_err_r2; 
input	mcu_l2t_scb_mecc_err; 
input	mcu_l2t_scb_secc_err; 
 
// from scbug.evict 
 
// from filbuf. 
input	tag_rdma_gate_off_c2; 
 
input   wmr_l;
input scan_in;
input	l2clk; 
 
// mbist
input		l2t_mb2_run;
input		l2t_mb2_fbtag_wr_en;
input		l2t_mb2_fbtag_rd_en;
input	[2:0]	l2t_mb2_addr;
output		fb_mbist_cam_hit;
input		fb_mbist_cam_sel;

input		mbist_run;
 
wire	mcu_pick_d1; 
wire	[7:0]	fb_wr_ptr_d1; 
wire	[2:0]	enc_wr_ptr_d1; 
wire    [7:0]   clear_err_c3;

wire            filbuf_misbuf_ue_offmode_c4,filbuf_misbuf_ue_offmode_c5,filbuf_misbuf_ue_offmode_c52;
wire            filbuf_misbuf_ue_offmode_c6;

wire            filbuf_misbuf_ce_offmode_c4,filbuf_misbuf_ce_offmode_c5,filbuf_misbuf_ce_offmode_c52;
wire            filbuf_misbuf_ce_offmode_c6;

 
// fb control bits. 
wire	[7:0]	fb_set_valid, fb_valid_prev , fb_valid ; 
wire	[7:0]	fb_stinst; 
wire	[7:0]	fb_nofill; 
wire	[7:0]	fb_l2_ready_in,	fb_l2_ready; 
wire	[7:0]	fb_bypassed_in, fb_bypassed ; 
wire	[3:0]	way0, way1, way2, way3; 
wire	[3:0]	way4, way5, way6, way7; 
wire	[7:0]	fb_way_vld_in, fb_way_vld; 
wire	[4:0]	mbid0, mbid1, mbid2, mbid3; // BS & SR 11/04/03, MB grows to 32
wire	[4:0]	mbid4, mbid5, mbid6, mbid7; // BS & SR 11/04/03, MB grows to 32
wire	[7:0]	fb_next_link_vld_in, fb_next_link_vld; 
wire	[7:0]	fb_cerr, fb_uerr ; 
wire	fb_cerr_pend; 
wire	fb_uerr_pend; 
wire	fb_tecc_pend; 
 
// SR Changes for new MCU protocol 4/8/04
wire       fb_imissinst_d2;        
wire [7:0] fb_imissinst;   
wire [1:0] ff_stinst_din_input;

 
 
wire	[7:0]	fill_entry_num_c3, fill_complete_c3, fill_complete_c4; 
wire		fill_vld_c3  ; 
wire	fb_count_en, fb_count_rst; 
wire	[3:0]	fb_count_prev, fb_count_plus1, fb_count_minus1 ; 
wire	[3:0]	fb_count; 
 
wire	[4:0]	mbf_rqtyp_d2; 
wire	[7:0]	fb_set_valid_d2; 
wire		fb_stinst_d2; 
 
wire		l2_bypass_mode_on_d1 ; 
wire  [2:0]   misbuf_filbuf_fbid_d1; 
wire  [3:0]   misbuf_filbuf_way_d1 ; 
wire          misbuf_filbuf_way_vld_d1 ; 
wire  [7:0]   dec_mb_fb_id_d1; 
 
wire	[7:0]	fb_hit_vec_c2 ; 
wire	imiss_ld64_fb_hit_c2, imiss_ld64_fb_hit_c3 ; 
 
wire	[1:0]	mcu_return_cnt, mcu_return_cnt_plus1 ; 
wire	mcu_cnt_reset; 
wire	mcu_data_vld_r1; 
wire	[2:0]	mcu_rd_req_id_r1; 
wire	cas1_inst_c3, cas1_inst_c4; 
wire	mcu_count_state0, mcu_count_state2 ; 
wire	[7:0]	fb_hit_vec_c3, fb_hit_vec_c4 ; 
wire	[7:0]	dec_rdreq_id_r0_d1; 
 
wire	dep_ptr_wr_en_c4, non_dep_mbf_insert_c4; 
wire	[7:0]	dep_wr_ptr_c4, non_dep_wr_ptr_c4; 
wire	[4:0]	mbf_entry_d2;  // BS & SR 11/04/03, MB grows to 32  
wire	[7:0]	sel_def_mbid; 
 
 
wire	[4:0]	mbid0_in, mbid1_in, mbid2_in, mbid3_in; // BS & SR 11/04/03, MB grows to 32
wire	[4:0]	mbid4_in, mbid5_in, mbid6_in, mbid7_in;// BS & SR 11/04/03, MB grows to 32 
 
wire	[7:0]	fb_l2_rd_ptr_in; 
wire	[7:0]	fb_l2_rd_ptr; 
 
wire	[4:0]	mux1_mbid_r1, mux2_mbid_r1 ; // BS & SR 11/04/03, MB grows to 32
wire	[4:0]	mux1_dep_mbid_c4, mux2_dep_mbid_c4 ; // BS & SR 11/04/03, MB grows to 32
wire	ready_ld_r0_d1 ; 
wire	fill_entry_0to3_c4 ; 
wire	[7:0]	fill_entry_num_c1, fill_entry_num_c2 ; 
 
wire	pick_s0, pick_s1, pick_s2, pick_s3 ; 
wire	pick_s0_quad0, pick_s1_quad0, pick_s2_quad0, pick_s3_quad0 ; 
wire	pick_s0_quad1, pick_s1_quad1, pick_s2_quad1, pick_s3_quad1 ; 
wire	pick_quad_s0, pick_quad_s1 ; 
 
wire	[3:0]	pick_quad0_in, pick_quad1_in ; 
wire	[1:0]	pick_quad_in ; 
wire	[3:0]	pick_quad0_sel, pick_quad1_sel;
wire	[1:0]	pick_quad_sel; // int 5.0
 
wire	[7:0]	l2_pick_vec; 
wire		l2_pick, l2_pick_d1 ; 
wire		l2_wait_in, l2_wait; 
 
wire	init_pick_state; 
wire	sel_l2st_lshift, sel_l2st_same;  
wire	[3:0]	l2_rd_state_lshift, l2_rd_state_in, l2_rd_state ; 
 
wire	sel_l2st_lshift_quad0, sel_l2st_same_quad0; 
wire	[3:0]	l2_rd_state_lshift_quad0, l2_rd_state_in_quad0, l2_rd_state_quad0 ; 
 
wire	sel_l2st_lshift_quad1, sel_l2st_same_quad1; 
wire	[3:0]	l2_rd_state_lshift_quad1, l2_rd_state_in_quad1, l2_rd_state_quad1 ; 
 
wire	[2:0]	enc_l2_rd_ptr ; 
wire	[3:0]	mux1_way, mux2_way, fill_way ; 
 
wire		l2t_l2d_fb_hit_c2; // used in C5 to select between 
wire	sel_c2_entry; 
wire	[2:0]	fb_rd_entry_c2; 
wire	[2:0]	enc_hit_vec_c2, enc_hit_vec_c3 ; 
wire	[2:0]	fill_entry_c2; 
 
wire		mecc_err_r3, secc_err_r3; 
wire		filbuf_corr_err_c3, filbuf_corr_err_c4, filbuf_corr_err_c5, filbuf_corr_err_c52; // BS 03/11/04 extra cycle for mem access 
wire		filbuf_corr_err_c6, filbuf_corr_err_c7 ; 
wire		filbuf_uncorr_err_c3, filbuf_uncorr_err_c4, filbuf_uncorr_err_c5, filbuf_uncorr_err_c52; // BS 03/11/04 extra cycle for mem access 
wire		filbuf_uncorr_err_c6, filbuf_uncorr_err_c7 ; 
wire		mcu_data_vld_r2, mcu_data_vld_r3 ; 
wire	[2:0]	mcu_rd_req_id_r2, mcu_rd_req_id_r3 ; 
wire	[7:0]	fb_cerr_in, fb_uerr_in ; 
wire	[7:0]	fb_cerr_prev, fb_uerr_prev ; 
 
wire	filbuf_hit_c3; 
wire	spc_rd_vld_c3; 
wire	spc_rd_vld_c4, spc_rd_vld_c5 , spc_rd_vld_c52 ;  // BS 03/11/04 extra cycle for mem access
wire	spc_rd_vld_c6, spc_rd_vld_c7 ; 
wire	spc_corr_err_c3, spc_corr_err_c4, spc_corr_err_c5, spc_corr_err_c52; // BS 03/11/04 extra cycle for mem access
wire	spc_corr_err_c6, spc_corr_err_c7 ; 
wire	spc_uncorr_err_c3, spc_uncorr_err_c4, spc_uncorr_err_c5, spc_uncorr_err_c52 ; // BS 03/11/04 extra cycle for mem access 
wire	spc_uncorr_err_c6, spc_uncorr_err_c7 ; 
wire	fb_uerr_pend_set, fb_uerr_pend_reset, fb_uerr_pend_in ; 
wire	fb_cerr_pend_set, fb_cerr_pend_reset, fb_cerr_pend_in ; 
wire	fb_tecc_pend_set, fb_tecc_pend_reset; 
wire	fb_tecc_pend_in; 
 
wire	filbuf_hit_c2; 
wire	fb_nofill_d2; 
 
wire	[7:0]	no_fill_entry_dequeue_c3;  
wire		en_dequeue_c3; 
wire		en_hit_dequeue_c2; 
wire		ready_ld64_r0_d1; 
wire		mbf_rsvd_d2; 
wire	fb_nofill_rst; 
wire	qual_hit_vec_c2, qual_hit_vec_c3, qual_hit_vec_c4; 
 
wire	[7:0]	dep_wr_qual_c4; 
 
wire	[2:0]	fill_entry_c3; 
wire	sel_c2_fill_entry; 
wire	sel_c3_fill_entry; 
wire	sel_def_hit_entry_mux1; 
wire	l2_dir_map_on_d1; 
wire	mcu_data_vld_r0_d1; 
 
wire	[1:0]	mcu_l2t_chunk_id_r0_d1; 
wire	[2:0]	mcu_rd_req_id_r0_d1; 
wire	fbhit_cerr_err_c3, fbhit_uerr_err_c3 ; 
wire	bsc_corr_err_c3, ld64_fb_hit_c3; 
wire	wr8_inst_c3, wr8_inst_c4; 
wire            dbb_rst_l; 
wire	[7:0]	dec_fill_entry_c3; 
wire		cerr_ack_c4, uerr_ack_c4 ; 
wire	inst_vld_c3; 
wire	fbcerr0_d1, fbuerr0_d1; 
 
 
wire	[7:0]	fill_complete_sel ; 
wire	fill_complete_4to7_def, fill_complete_0to3_def ; 
wire	[7:0]	fb_l2_rd_ptr_sel; 
wire	way_mux1_def, way_mux2_def ; 
wire	rdreq_0to3_def, rdreq_4to7_def ; 
 
wire	[7:0]	dep_wr_ptr_c4_rst, non_dep_wr_ptr_c4_rst; 
wire	[7:0]	fb_set_valid_d2_rst; 
wire 	fb_tecc_pend_d1; 
reg	[3:0]	filbuf_tag_evict_way_c3;


//////////////////////////////////////////////////
// L1 clk header
//////////////////////////////////////////////////
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

l2t_filbuf_ctl_l1clkhdr_ctl_macro clkgen (
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
l2t_filbuf_ctl_spare_ctl_macro__num_6 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
//////////////////////////////////////////



//////////////////////////////////////////////////////////////////////////////// 
// L2 OFF MODE : 
// 
// The RTL for filbuf contains the following exceptions to handle off mode operation. 
// 
// 1) A non Store, non LD64 entry is invalidated in C2 on a Fill Buffer hit. 
//    stores have to be kept around to write to DRAM, LD64s turn the valid bit 
//    of in C3( they can afford to do so due to the access bubbles following a ld64). 
// 
// 2) Fill Buffer is one deep only  
// 
// 3) fb_l2_ready is set only in the following  case,  
//	 A non CAS1 instruction hitting an entry with fb_stinst =1 . 
// 
// 4) Fill does not wake up stores by default. It only wakes up 
//    dependent instructions in the Miss Buffer. 
//  
// 5) dep wr enable is asserted only if an instruction( other than a CAS1) hits 
//    a Fill Buffer entry with fb_stinst=1. 
// 
// 6) Fill Pipeline is skewed by one cycle. 
// 
// 7)  In l2_bypass_mode, the way_vld bit is not required to be set. 
//	for an l2_pick 
//////////////////////////////////////////////////////////////////////////////// 
//////////////////////////////////////////////////////////////////////////////// 
// L2 DIR MAP MODE ON 
// 
//  This mode is different from the regular mode of operation in the following 
// ways 
// - Loads/Imisses are not readied by the second incoming packet of data from the  
//   mcu. Check the expression for ready_miss_r1 
// - Loads/Imisses are readied similar to stores, i.e. after a Fill. 
//////////////////////////////////////////////////////////////////////////////// 
 
/////////////////////////////////////////////////////////////////// 
 // Reset flop 
 /////////////////////////////////////////////////////////////////// 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 reset_flop 
				(.dout(dbb_rst_l), 
                                        .scan_in(reset_flop_scanin),
                                        .scan_out(reset_flop_scanout),
                                        .l1clk(l1clk), 
                                        .din(wmr_l),
  .siclk(siclk),
  .soclk(soclk) 
                                         
); 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// Fill Buffer Insertion Pipeline. 
// The Fill Buffer (FB) is inserted when a Miss Buffer is read for making 
// a request to DRAM. The following pipeline is used for FB insertion 
// 
//------------------------------------------------------------------------------ 
//	D0			D1				D2 
//------------------------------------------------------------------------------ 
//	mcu pick (misbuf)	read mbtag			write fbtag+ecc 
// 
//				read mbdata 
//				for rqtyp and tag ecc		write "stinst"  
//								write insert mbid 
//		 
//	xmit mcu pick		generate wr ptr			fb_entry_avail  
//	to filbuf.		xmit to fbtag.			logic 
// 
//				xmit mcu_pickd1		xmit inserting 
//				as wen to fbtag.		fbid to mbf 
//								 
//				set valid bit			xmit addr(arbadr) 
//								xmit req id (filbuf) 
//				update fbcount			xmit req ( misbuf). 
// 
//								 
//------------------------------------------------------------------------------ 
//////////////////////////////////////////////////////////////////////////////// 
 
////////////////// 
// 1.  Generation of insertion ptr 
// and wen for fbtag. 
////////////////// 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_mcu_pick_d1 
                           (.din(misbuf_filbuf_mcu_pick), .l1clk(l1clk), 
                         .scan_in(ff_mcu_pick_d1_scanin),
                         .scan_out(ff_mcu_pick_d1_scanout),
                         .dout(mcu_pick_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	fb_wr_ptr_d1[0] = ~fb_valid[0] ; 
assign	fb_wr_ptr_d1[1] = fb_valid[0] & ~fb_valid[1]; 
assign	fb_wr_ptr_d1[2] = &(fb_valid[1:0]) & ~fb_valid[2] ; 
assign	fb_wr_ptr_d1[3] = &(fb_valid[2:0]) & ~fb_valid[3] ; 
assign	fb_wr_ptr_d1[4] = &(fb_valid[3:0]) & ~fb_valid[4] ; 
assign	fb_wr_ptr_d1[5] = &(fb_valid[4:0]) & ~fb_valid[5] ; 
assign	fb_wr_ptr_d1[6] = &(fb_valid[5:0]) & ~fb_valid[6] ; 
assign	fb_wr_ptr_d1[7] = &(fb_valid[6:0]) & ~fb_valid[7] ; 


assign mbist_fbtag_wr_ptr[0] = (l2t_mb2_addr_r3[2:0]==3'h0);
assign mbist_fbtag_wr_ptr[1] = (l2t_mb2_addr_r3[2:0]==3'h1);
assign mbist_fbtag_wr_ptr[2] = (l2t_mb2_addr_r3[2:0]==3'h2);
assign mbist_fbtag_wr_ptr[3] = (l2t_mb2_addr_r3[2:0]==3'h3);
assign mbist_fbtag_wr_ptr[4] = (l2t_mb2_addr_r3[2:0]==3'h4);
assign mbist_fbtag_wr_ptr[5] = (l2t_mb2_addr_r3[2:0]==3'h5);
assign mbist_fbtag_wr_ptr[6] = (l2t_mb2_addr_r3[2:0]==3'h6);
assign mbist_fbtag_wr_ptr[7] = (l2t_mb2_addr_r3[2:0]==3'h7);
 

l2t_filbuf_ctl_msff_ctl_macro__width_18 ff_l2t_mb2_run_r1 
        (
	.scan_in(ff_l2t_mb2_run_r1_scanin),
	.scan_out(ff_l2t_mb2_run_r1_scanout),
	.din({mbist_run,l2t_mb2_fbtag_rd_en,l2t_mb2_fbtag_rd_en_r1,l2t_mb2_fbtag_rd_en_r2,
		fb_mbist_cam_sel,l2t_mb2_run,l2t_mb2_fbtag_wr_en,
          l2t_mb2_fbtag_wr_en_r1,l2t_mb2_fbtag_wr_en_r2,l2t_mb2_addr[2:0],
			l2t_mb2_addr_r1[2:0],l2t_mb2_addr_r2[2:0]}), 
	.l1clk(l1clk),  
	.dout({mbist_run_r1,l2t_mb2_fbtag_rd_en_r1,l2t_mb2_fbtag_rd_en_r2, 
			l2t_mb2_fbtag_rd_en_r3,fb_mbist_cam_sel_r1,l2t_mb2_run_r1,l2t_mb2_fbtag_wr_en_r1,
           l2t_mb2_fbtag_wr_en_r2,l2t_mb2_fbtag_wr_en_r3,l2t_mb2_addr_r1[2:0],
		l2t_mb2_addr_r2[2:0],l2t_mb2_addr_r3[2:0]}),
  .siclk(siclk),
  .soclk(soclk)  
	); 

assign	filbuf_fbtag_wr_ptr[7:0] = l2t_mb2_run_r1 ? mbist_fbtag_wr_ptr[7:0] : fb_wr_ptr_d1[7:0] ; 
assign	filbuf_fbtag_wr_en = l2t_mb2_run_r1 ? l2t_mb2_fbtag_wr_en_r3 : mcu_pick_d1 ; 
 
////////////////// 
// 2.  xmit fbid to mbf 
// for misbuf tracking.THe fbid is later 
// re-transmitted to filbuf for writing the way 
// and way valid fields in filbuf. 
////////////////// 
 
assign	enc_wr_ptr_d1[0] = fb_wr_ptr_d1[1] | fb_wr_ptr_d1[3] |  
	   fb_wr_ptr_d1[5] | fb_wr_ptr_d1[7]  ; 
assign	enc_wr_ptr_d1[1] = fb_wr_ptr_d1[2] | fb_wr_ptr_d1[3] | 
	   fb_wr_ptr_d1[6] | fb_wr_ptr_d1[7]  ; 
assign	enc_wr_ptr_d1[2] = fb_wr_ptr_d1[4] | fb_wr_ptr_d1[5] | 
   	   fb_wr_ptr_d1[6] | fb_wr_ptr_d1[7]  ; 
 
l2t_filbuf_ctl_msff_ctl_macro__width_3 ff_filbuf_misbuf_fbid_d2 
                           (.din(enc_wr_ptr_d1[2:0]), .l1clk(l1clk), 
                  .scan_in(ff_filbuf_misbuf_fbid_d2_scanin),
                  .scan_out(ff_filbuf_misbuf_fbid_d2_scanout),
                  .dout(filbuf_misbuf_fbid_d2[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
/////////////////////////////////////////////////////////////// 
// 3.The l2t-mcu interface for read requests consists of 
// req, req_id and addr signals all of which are  
// transmitted in the D2 stage 
/////////////////////////////////////////////////////////////// 
 
assign	l2t_mcu_rd_req_id = filbuf_misbuf_fbid_d2 ; 
 
 
////////////////////////////////////////////////////////// 
// VALID bit logic. 
// The Valid bit is set in cycle D1 of a miss insertion. 
// It is reset in the C3 cycle of a FIll. Since a Fill is 
// followed by 3 bubbles, the earliest operation following 
// a Fill will be in C1 when the fill is in C4. This means that 
// an operation following the fill ( to the same $ line) 
// will never hit the FB. 
// 
// Valid bit is also reset for a nofill entry if that entry 
// encounters a hit. Since ld64s are the only instructions that 
// will cause a no_fill entry, the reset operation can be 
// performed in C3 like that for a Fill operation. This is  
// because a ld64 is followed by two bubbles. 
// 
// Valid bit is reset for a fb hit to entry 0 in l2 off mode 
// if that entry has fb_stinst==0. In this case, the valid bit 
// will have to be reset in C2 since the following instruction 
// will have to see the effects of it.Hence this reset condition 
// is the most critical. 
////////////////////////////////////////////////////////// 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_fill_vld_c3 
                           (.din(arb_fill_vld_c2), .l1clk(l1clk), 
                .scan_in(ff_fill_vld_c3_scanin),
                .scan_out(ff_fill_vld_c3_scanout),
                .dout(fill_vld_c3),
  .siclk(siclk),
  .soclk(soclk)  
);  
 
 
assign	no_fill_entry_dequeue_c3 =  (fb_hit_vec_c3 & fb_nofill  &  
				{8{qual_hit_vec_c3}}); 
 
// In l2 off mode, any non-store entry is dequeued  
// when an inst hits  the Fill Buffer. 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_l2_bypass_mode_on 
                           (.din(csr_l2_bypass_mode_on), .l1clk(l1clk), 
                    .scan_in(ff_l2_bypass_mode_on_scanin),
                    .scan_out(ff_l2_bypass_mode_on_scanout),
                    .dout(l2_bypass_mode_on_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_l2_dir_map_on_d1 
                           (.din(csr_l2_dir_map_on), .l1clk(l1clk), 
                    .scan_in(ff_l2_dir_map_on_d1_scanin),
                    .scan_out(ff_l2_dir_map_on_d1_scanout),
                    .dout(l2_dir_map_on_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// In OFF mode, an instruction(B) may be in C1 when 
// a C2 instruction(A) hits the Fill Buffer. Hence the valid bit 
// reset condition should be flopped to C3 so that instruction B 
// can see the effects of instruction A on the Fill Buffer. 
// However, en_hit_dequeue_c2 had a critical component, tag_rdma_gate_off_c2 
// This component has been removed and replaced with 
// rdma_inst_c2 & tag_misbuf_rdma_reg_vld_c2. 
 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_rdma_inst_c2 
                           (.din(arbdec_arbdp_rdma_inst_c1), .l1clk(l1clk), 
               .scan_in(ff_rdma_inst_c2_scanin),
               .scan_out(ff_rdma_inst_c2_scanout),
               .dout(rdma_inst_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 


l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_arb_filbuf_inst_vld_c2	
        (
	.scan_in(ff_arb_filbuf_inst_vld_c2_scanin),
	.scan_out(ff_arb_filbuf_inst_vld_c2_scanout),
	.din(arb_inst_vld_c2_prev), 
	.l1clk(l1clk),
        .dout(arb_filbuf_inst_vld_c2),
  .siclk(siclk),
  .soclk(soclk)
	);

 
assign	en_hit_dequeue_c2 = arbdec_arbdp_inst_mb_c2  & 
                                arb_filbuf_inst_vld_c2 & 
				~(rdma_inst_c2 & tag_misbuf_rdma_reg_vld_c2) & 
				fb_hit_vec_c2[0] &  
				~fb_stinst[0] & // not a store 
				 ~fb_nofill[0] & // not a  ld64 
				l2_bypass_mode_on_d1 ; // OFF mode on. 
 
assign	dec_fill_entry_c3[7:1] = fill_entry_num_c3[7:1] & {7{fill_vld_c3}} ; 
 
assign	fill_complete_c3[7:1] = dec_fill_entry_c3[7:1] | 
				no_fill_entry_dequeue_c3[7:1] ; 
 
assign	dec_fill_entry_c3[0] = fill_entry_num_c3[0] & fill_vld_c3 ; 
 
assign  fill_complete_c3[0] = 	dec_fill_entry_c3[0] |  
				no_fill_entry_dequeue_c3[0] | 
				en_hit_dequeue_c2 ; // off mode condition only. 
 
// COVERAGE: exercise all fill_complete_c3[7:0] conditions.  
// especially all en_hit_dequeue_c2 conditions. 
 
assign	fb_set_valid = fb_wr_ptr_d1   
			& {8{mcu_pick_d1}} ; 
 
l2t_filbuf_ctl_msff_ctl_macro__width_8 ff_fb_set_valid_d2 
                           (.din(fb_set_valid[7:0]), .l1clk(l1clk), 
		.scan_in(ff_fb_set_valid_d2_scanin),
		.scan_out(ff_fb_set_valid_d2_scanout),
		.dout(fb_set_valid_d2[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	fb_valid_prev = ( fb_set_valid_d2 | fb_valid )   & 
			~fill_complete_c3; 
 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__width_8 ff_valid_bit  // sync reset active low
                           (.din(fb_valid_prev[7:0]), .l1clk(l1clk),  
	.scan_in(ff_valid_bit_scanin),
	.scan_out(ff_valid_bit_scanout),
	.clr(~dbb_rst_l), .dout(fb_valid[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
////////////////////////////////////////////////////////// 
// FB Counter  
// Increment and decrement conditions are the same as 
// set and reset conditions of the valid bit, respectively. 
//  
// filbuf_fb_count_eq_0 is required by misbuf to ready a csr write. 
// 
// filbuf_misbuf_entry_avail is required by misbuf as a condition 
// for mcu_pick. 
////////////////////////////////////////////////////////// 
 
assign	en_dequeue_c3 = (|( no_fill_entry_dequeue_c3 )) | 
				fill_vld_c3   | 
				en_hit_dequeue_c2 ; 
 
 
assign  fb_count_en = ( mcu_pick_d1 | en_dequeue_c3 ) &  
			~( mcu_pick_d1 & en_dequeue_c3 )  ; 
 
assign  fb_count_plus1  = fb_count + 4'b1 ; 
assign  fb_count_minus1 = fb_count - 4'b1 ; 
 
assign	fb_count_rst = (~dbb_rst_l ); 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_fb_count 
			(.dout (fb_count_prev[3:0]), 
          	.din0(fb_count_plus1[3:0]), .din1(fb_count_minus1[3:0]), 
                .sel0(mcu_pick_d1), .sel1(~mcu_pick_d1)); 
 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__en_1__width_4 ff_fb_count  // sync reset active high
                           (.din(fb_count_prev[3:0]),  
	  .scan_in(ff_fb_count_scanin),
	  .scan_out(ff_fb_count_scanout),
	  .l1clk(l1clk), .clr(fb_count_rst),.en(fb_count_en), 
         .dout(fb_count[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
);  
 
assign	filbuf_fb_count_eq_0 = ( fb_count == 4'b0 ) ; 
 
/////////////////////////////////////////// 
// in L2 off mode, Fb is only one deep. 
/////////////////////////////////////////// 
 
 
assign	filbuf_misbuf_entry_avail =  
	( ~fb_count[3] & ~l2_bypass_mode_on_d1 )  | 
	( filbuf_fb_count_eq_0 & l2_bypass_mode_on_d1 ) ; 
 
 
 
////////////////////////////////////////////////////////// 
// STINST: Set for any miss that requires a fill to happen   
//	  before it is processed out of the Miss Buffer. 
// 
//	   Lds , Imisses and Strloads are the only requests which bypass 
//	   data out of the fill buffer. All other instructions 
//	   will wait for a FIll to happen before they are readied 
//	   in the mIss Buffer. 
// 
//	   This bit is not valid unless fb_valid is set. 
////////////////////////////////////////////////////////// 
 
l2t_filbuf_ctl_msff_ctl_macro__width_5 ff_rqtyp_d2 
                           (.din(mbdata_filbuf_rqtyp_d1[4:0]), .l1clk(l1clk), 
			.scan_in(ff_rqtyp_d2_scanin),
			.scan_out(ff_rqtyp_d2_scanout),
			.dout(mbf_rqtyp_d2[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_snp_d2 
                           (.din(mbdata_filbuf_rsvd_d1), .l1clk(l1clk), 
			.scan_in(ff_snp_d2_scanin),
			.scan_out(ff_snp_d2_scanout),
			.dout(mbf_rsvd_d2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	fb_stinst_d2 = (~( mbf_rqtyp_d2 == `IMISS_RQ ) &  
			~( mbf_rqtyp_d2 == `LOAD_RQ )  &  
			~( mbf_rqtyp_d2 == `STRLOAD_RQ )  &  
			~( mbf_rsvd_d2 & mbf_rqtyp_d2[0] ) ) ; 
 
// SR Changes for new MCU protocol 4/8/04 : decoding IMISS_RQ and LOAD_RQ also 
// for N2 as the MCU protocol has changed : mcu_data_vld's for chunks <0,1> and <2,3>
// do not come back to back as in N1 but can come separated by arbitrary number of
// cycles. Hence the fill buffer wakeup will happen after 1st packet for load, after
// 2nd packet for imiss and after 4th packet for block loads and bypass cases.
 
assign fb_imissinst_d2 =  mbf_rqtyp_d2 == `IMISS_RQ ;
assign ff_stinst_din_input = {fb_stinst_d2, fb_imissinst_d2};
 
 l2t_filbuf_ctl_msff_ctl_macro__en_1__width_2 ff_stinst_0 
                 (
		 .scan_in(ff_stinst_0_scanin),
		 .scan_out(ff_stinst_0_scanout),
		 .din(ff_stinst_din_input),
		 .en(fb_set_valid_d2[0]), 
                 .l1clk(l1clk), 
	   	 .dout({fb_stinst[0], fb_imissinst[0]}),
  .siclk(siclk),
  .soclk(soclk)  
		); 


l2t_filbuf_ctl_msff_ctl_macro__en_1__width_2 ff_stinst_1 
                (
		.scan_in(ff_stinst_1_scanin),
		.scan_out(ff_stinst_1_scanout),
		.din(ff_stinst_din_input),
		.en(fb_set_valid_d2[1]), 
                .l1clk(l1clk), 
		.dout({fb_stinst[1],fb_imissinst[1]}),
  .siclk(siclk),
  .soclk(soclk)  
		); 

l2t_filbuf_ctl_msff_ctl_macro__en_1__width_2 ff_stinst_2 
                (
		.scan_in(ff_stinst_2_scanin),
		.scan_out(ff_stinst_2_scanout),
		.din(ff_stinst_din_input),
		.en(fb_set_valid_d2[2]), 
                .l1clk(l1clk), .dout({fb_stinst[2],fb_imissinst[2]}),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__en_1__width_2 ff_stinst_3 
                (	
		.scan_in(ff_stinst_3_scanin),
		.scan_out(ff_stinst_3_scanout),
		.din(ff_stinst_din_input),
		.en(fb_set_valid_d2[3]), 
                .l1clk(l1clk), .dout({fb_stinst[3],fb_imissinst[3]}),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__en_1__width_2 ff_stinst_4 
                (.din(ff_stinst_din_input),
		.scan_in(ff_stinst_4_scanin),
		.scan_out(ff_stinst_4_scanout),
		.en(fb_set_valid_d2[4]), 
                .l1clk(l1clk), 
		.dout({fb_stinst[4],fb_imissinst[4]}),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__en_1__width_2 ff_stinst_5 
                (
		.scan_in(ff_stinst_5_scanin),
		.scan_out(ff_stinst_5_scanout),
		.din(ff_stinst_din_input),
		.en(fb_set_valid_d2[5]), 
                .l1clk(l1clk), .dout({fb_stinst[5],fb_imissinst[5]}),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__en_1__width_2 ff_stinst_6 
               (.din(ff_stinst_din_input),
		.scan_in(ff_stinst_6_scanin),
		.scan_out(ff_stinst_6_scanout),
		.en(fb_set_valid_d2[6]), 
                .l1clk(l1clk), .dout({fb_stinst[6],fb_imissinst[6]}),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__en_1__width_2 ff_stinst_7 
               (.din(ff_stinst_din_input),
		.scan_in(ff_stinst_7_scanin),
		.scan_out(ff_stinst_7_scanout),
		.en(fb_set_valid_d2[7]), 
                .l1clk(l1clk), .dout({fb_stinst[7],fb_imissinst[7]}),
  .siclk(siclk),
  .soclk(soclk)  
); 

 
////////////////////////////////////////////////////////// 
// NO_FILL: Set or reset when an entry is written into 
// 	    the fbtags.  
//	    Set for a ld64 instruction and reset for any 
//	    other instruction. 
//	    Used in the valid bit setting and l2_ready logic. 
// 
// filbuf_misbuf_nofill_d2 is used to not turn on fbid_vld in  
// the miss buffer. 
////////////////////////////////////////////////////////// 
 
 
 
assign	fb_nofill_d2 = mbf_rsvd_d2 & mbf_rqtyp_d2[0] ; 
assign	filbuf_misbuf_nofill_d2 = fb_nofill_d2 ; 
assign	fb_nofill_rst = ~dbb_rst_l; 
 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_nofill_0  // sync reset active high
                           (.din(fb_nofill_d2), .en(fb_set_valid_d2[0]), 
		.scan_in(ff_nofill_0_scanin),
		.scan_out(ff_nofill_0_scanout),
		.clr(fb_nofill_rst), 
        	.l1clk(l1clk), .dout(fb_nofill[0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_nofill_1  // sync reset active high
                           (.din(fb_nofill_d2), .en(fb_set_valid_d2[1]), 
		.scan_in(ff_nofill_1_scanin),
		.scan_out(ff_nofill_1_scanout),
		.clr(fb_nofill_rst), 
        	.l1clk(l1clk), .dout(fb_nofill[1]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_nofill_2  // sync reset active high
                           (.din(fb_nofill_d2), .en(fb_set_valid_d2[2]), 
		.scan_in(ff_nofill_2_scanin),
		.scan_out(ff_nofill_2_scanout),
		.clr(fb_nofill_rst), 
        	.l1clk(l1clk), .dout(fb_nofill[2]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_nofill_3  // sync reset active high
                           (.din(fb_nofill_d2), .en(fb_set_valid_d2[3]), 
		.scan_in(ff_nofill_3_scanin),
		.scan_out(ff_nofill_3_scanout),
		.clr(fb_nofill_rst), 
        	.l1clk(l1clk), .dout(fb_nofill[3]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_nofill_4  // sync reset active high
                           (.din(fb_nofill_d2), .en(fb_set_valid_d2[4]), 
		.scan_in(ff_nofill_4_scanin),
		.scan_out(ff_nofill_4_scanout),
		.clr(fb_nofill_rst), 
        	.l1clk(l1clk), .dout(fb_nofill[4]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_nofill_5  // sync reset active high
                           (.din(fb_nofill_d2), .en(fb_set_valid_d2[5]), 
		.scan_in(ff_nofill_5_scanin),
		.scan_out(ff_nofill_5_scanout),
		.clr(fb_nofill_rst), 
        	.l1clk(l1clk), .dout(fb_nofill[5]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_nofill_6  // sync reset active high
                           (.din(fb_nofill_d2), .en(fb_set_valid_d2[6]), 
		.scan_in(ff_nofill_6_scanin),
		.scan_out(ff_nofill_6_scanout),
		.clr(fb_nofill_rst), 
        	.l1clk(l1clk), .dout(fb_nofill[6]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_nofill_7  // sync reset active high
                           (.din(fb_nofill_d2), .en(fb_set_valid_d2[7]), 
		.scan_in(ff_nofill_7_scanin),
		.scan_out(ff_nofill_7_scanout),
		.clr(fb_nofill_rst), 
        	.l1clk(l1clk), .dout(fb_nofill[7]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 
 
/////////////////////////////////////////////////////////////////////// 
// FB CAM EN: THe FB cam is enabled if arb_inst_vld_c1. 
// FB hit is enabled (in arb) . 
// 
// The Hit logic in C2 generates the following signals. 
//  
// filbuf_misbuf_match_c2 : used by misbuf to turn off eviction for 
//		an insrtuction that misses the tag. Notice 
//		that this signal is not qualified with 
//		arb_inst_vld_c2. 
// 
// filbuf_misbuf_stinst_match_c2: fb hit entry corresponds to a store 
// 
// filbuf_tag_hit_frm_mb_c2 : Used in tag to generate tag_hit_l2orfb_c2. 
//		This signal is high only if an instruction from 
//		the miss buffer hits the FIll buffer.Not gated off when 
//		the rdma register is vld. 
// 
/////////////////////////////////////////////////////////////////////// 
 
 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_fb_hit_off_c1_d1 
                           (.din(arb_filbuf_hit_off_c1), .l1clk(l1clk), 
                .scan_in(ff_fb_hit_off_c1_d1_scanin),
                .scan_out(ff_fb_hit_off_c1_d1_scanout),
                .dout(fb_hit_off_c1_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 

l2t_filbuf_ctl_msff_ctl_macro__width_9 ff_fb_cam_hit_vec 
                           (.din({fb_mbist_cam_hit_unreg,fb_cam_match[7:0]}), .l1clk(l1clk),
                .scan_in(ff_fb_cam_hit_vec_scanin),
                .scan_out(ff_fb_cam_hit_vec_scanout),
                .dout({fb_mbist_cam_hit,fb_cam_match_d1[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign fb_mbist_cam_hit_unreg = fb_mbist_cam_sel_r1 ? |(fb_cam_match_d1[7:0]) :1'b0;
 
// fb_hit_vec_c2: 
// indicates that a valid instruction hits 
// the fill buffer. 
 
assign	fb_hit_vec_c2 = fb_cam_match & fb_valid  &  
			{8{~fb_hit_off_c1_d1 }} ; 
 
// Above equation is cloned and sent to misbuf
assign	filbuf_arb_tag_hit_frm_mb_c2 = |( fb_hit_vec_c2 )  & // tag match in fb 
			arbdec_arbdp_inst_mb_c2  & 
			arb_filbuf_inst_vld_c2 ;// Miss buffer instruction 


assign  filbuf_misbuf_tag_hit_frm_mb_c2 = |( fb_hit_vec_c2 )  & // tag match in fb
                        arbdec_arbdp_inst_mb_c2  &
                        arb_filbuf_inst_vld_c2 ;// Miss buffer instruction


assign filbuf_tag_hit_frm_mb_c2 = filbuf_arb_tag_hit_frm_mb_c2 ;






assign filbuf_tag_hit_c2 = |( fb_hit_vec_c2 )  & // tag match in fb
                       arb_filbuf_inst_vld_c2 ; // tag_rdma_gate_off_c2 qual mbist_done in tag.
 
assign	filbuf_misbuf_match_c2 = |( fb_hit_vec_c2 ) ; //  not qualified with inst vld. 
 
 
assign	filbuf_misbuf_stinst_match_c2 = ( fb_hit_vec_c2[0] & fb_stinst[0]) ; // matches a  
					// store instruction. 
 
 
assign  filbuf_hit_c2 = filbuf_tag_hit_frm_mb_c2 & ~tag_rdma_gate_off_c2 ; 
 
 
 
assign	imiss_ld64_fb_hit_c2 = ( arb_decdp_imiss_inst_c2 | 
			arb_decdp_ld64_inst_c2 )  & filbuf_hit_c2 ; 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_imiss_ld64_fb_hit_c3 
                           (.din(imiss_ld64_fb_hit_c2), .l1clk(l1clk), 
               .scan_in(ff_imiss_ld64_fb_hit_c3_scanin),
               .scan_out(ff_imiss_ld64_fb_hit_c3_scanout),
               .dout(imiss_ld64_fb_hit_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
/////////////////////////////////////////////////////////////////////// 
// 
// filbuf_l2d_fb_hit_c3: Generated as a select for Fill Buffer data 
//	   	over $ data. 
//	   	C3 cycle of a regular load/imiss or 
//		C4 cycle of an imiss hitting the Fill Buffer. 
//		C4 cycle of a FIll in l2 off mode. 
//		This signal is staged for two cycles and used 
//		in l2d for the Fbdata vs L2data mux. 
// 
/////////////////////////////////////////////////////////////////////// 
 
assign	l2t_l2d_fb_hit_c2 = mbist_run_r1 ? 1'b0 : (filbuf_hit_c2 | // ld or imiss 1st packet 
		imiss_ld64_fb_hit_c3 |  // imiss 2nd packet 
		(fill_vld_c3 & l2_bypass_mode_on_d1 )); // fill in OFF mode  
		
				 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_l2d_fb_hit_c3 
                           (.din(l2t_l2d_fb_hit_c2), .l1clk(l1clk), 
               .scan_in(ff_l2d_fb_hit_c3_scanin),
               .scan_out(ff_l2d_fb_hit_c3_scanout),
               .dout(filbuf_l2d_fb_hit_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 
assign  qual_hit_vec_c2 = ~tag_rdma_gate_off_c2 & arbdec_arbdp_inst_mb_c2  & 
                                arb_filbuf_inst_vld_c2 ; 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_qual_hit_vec_c3 
                           (.din(qual_hit_vec_c2), .l1clk(l1clk), 
               .scan_in(ff_qual_hit_vec_c3_scanin),
               .scan_out(ff_qual_hit_vec_c3_scanout),
               .dout(qual_hit_vec_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_qual_hit_vec_c4 
                           (.din(qual_hit_vec_c3), .l1clk(l1clk), 
               .scan_in(ff_qual_hit_vec_c4_scanin),
               .scan_out(ff_qual_hit_vec_c4_scanout),
               .dout(qual_hit_vec_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
/////////////////////////////////////////////////////////////////// 
// BYPASSED bit: The Bypassed bit is used to 
// tell if an instruction already 
// received bypassed data from the 
// Fill Buffer. If not, then the  
// ALLOC bit in vuad is not reset 
// by the FIll but rather by the  
// operation that hits the $. 
// 
// Set in the C3 cycle of a mbf instruction hitting 
// the fill buffer and reset in C3 cycle of a Fill 
// Bypassed bit is not set for a no fill Entry  
// or in the $ off mode.  
/////////////////////////////////////////////////////////////////// 
 
 
assign  fb_bypassed_in = ( fb_bypassed |  
			(fb_hit_vec_c3 & {8{qual_hit_vec_c3}} & 
			~fb_nofill & 
			 ~{8{l2_bypass_mode_on_d1}}) 
			 ) & ~fill_complete_c3; 
 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__width_8 ff_bypassed  // sync reset active low
                           (.din(fb_bypassed_in[7:0]), .l1clk(l1clk), .clr(~dbb_rst_l), 
         .scan_in(ff_bypassed_scanin),
         .scan_out(ff_bypassed_scanout),
         .dout(fb_bypassed[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	fill_entry_num_c1[0] = ( arbdec_arbdp_inst_mb_entry_c1[2:0] == 3'd0 ); 
assign	fill_entry_num_c1[1] = ( arbdec_arbdp_inst_mb_entry_c1[2:0] == 3'd1 ); 
assign	fill_entry_num_c1[2] = ( arbdec_arbdp_inst_mb_entry_c1[2:0] == 3'd2 ); 
assign	fill_entry_num_c1[3] = ( arbdec_arbdp_inst_mb_entry_c1[2:0] == 3'd3 ); 
assign	fill_entry_num_c1[4] = ( arbdec_arbdp_inst_mb_entry_c1[2:0] == 3'd4 ); 
assign	fill_entry_num_c1[5] = ( arbdec_arbdp_inst_mb_entry_c1[2:0] == 3'd5 ); 
assign	fill_entry_num_c1[6] = ( arbdec_arbdp_inst_mb_entry_c1[2:0] == 3'd6 ); 
assign	fill_entry_num_c1[7] = ( arbdec_arbdp_inst_mb_entry_c1[2:0] == 3'd7 ); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_8 ff_fill_entry_num_c2 
                           (.din(fill_entry_num_c1[7:0]), .l1clk(l1clk), 
               .scan_in(ff_fill_entry_num_c2_scanin),
               .scan_out(ff_fill_entry_num_c2_scanout),
               .dout(fill_entry_num_c2[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_8 ff_fill_entry_num_c3 
                           (.din(fill_entry_num_c2[7:0]), .l1clk(l1clk), 
               .scan_in(ff_fill_entry_num_c3_scanin),
               .scan_out(ff_fill_entry_num_c3_scanout),
               .dout(fill_entry_num_c3[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_inst_vld_c3 
                           (.din(arb_filbuf_inst_vld_c2), .l1clk(l1clk), 
               .scan_in(ff_inst_vld_c3_scanin),
               .scan_out(ff_inst_vld_c3_scanout),
               .dout(inst_vld_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	filbuf_vuad_bypassed_c3 = |( fb_bypassed & fill_entry_num_c3 ) & 
                        inst_vld_c3 ; 
 
 
////////////////////////////////////////////////////////////////////// 
// MBF interface: Way,  WAY_VLD bits in filbuf are written 
// by misbuf.  
//WAY and WAY_VLD are written when an instruction in the  
//miss buffer performs its "eviction" pass and gets a way allocated. 
// The above explanation assumes that an eviction pass will always 
// follow a request to mcu. However, in cases that the mcu request 
// happens after the eviction pass, the WAY and WAY_VLD bits 
// are written immediately after the DRAM request.  
// 
// Here is the pipeline for writing the way and evict_done bits. 
// if eviction happens after a request to DRAM is issued by the  
// miss buffer 
// --------------------------------------------------------------- 
// 	C4/			C5/			C6/ 
//---------------------------------------------------------------- 
//	write			pick 
//	way vld bit.		one mbf entry		write 
//	(misbuf)			with wayvld and		way into 
//				fbid vld.		entry pointed 
//							by fbid. 
//				muxout 
//				way and 
//				fbid.			set evict_done 
// --------------------------------------------------------------- 
// 
/////////////////////////////////////////////////////////////////////// 
 
 
 
l2t_filbuf_ctl_msff_ctl_macro__width_3 ff_misbuf_filbuf_fbid_d1 
                           (.din(misbuf_filbuf_fbid[2:0]), .l1clk(l1clk), 
         	.scan_in(ff_misbuf_filbuf_fbid_d1_scanin),
         	.scan_out(ff_misbuf_filbuf_fbid_d1_scanout),
         	.dout(misbuf_filbuf_fbid_d1[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_4 ff_misbuf_filbuf_way_d1 
                           (.din(misbuf_filbuf_way[3:0]), .l1clk(l1clk), 
         	.scan_in(ff_misbuf_filbuf_way_d1_scanin),
         	.scan_out(ff_misbuf_filbuf_way_d1_scanout),
         	.dout(misbuf_filbuf_way_d1[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_misbuf_filbuf_way_vld_d1 
                           (.din(misbuf_filbuf_way_fbid_vld), .l1clk(l1clk), 
         	.scan_in(ff_misbuf_filbuf_way_vld_d1_scanin),
         	.scan_out(ff_misbuf_filbuf_way_vld_d1_scanout),
         	.dout(misbuf_filbuf_way_vld_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	dec_mb_fb_id_d1[0] = ( misbuf_filbuf_fbid_d1[2:0] == 3'd0 ) & 
				misbuf_filbuf_way_vld_d1; 
assign	dec_mb_fb_id_d1[1] = ( misbuf_filbuf_fbid_d1[2:0] == 3'd1 ) & 
				misbuf_filbuf_way_vld_d1; 
assign	dec_mb_fb_id_d1[2] = ( misbuf_filbuf_fbid_d1[2:0] == 3'd2 ) & 
				misbuf_filbuf_way_vld_d1; 
assign	dec_mb_fb_id_d1[3] = ( misbuf_filbuf_fbid_d1[2:0] == 3'd3 ) & 
				misbuf_filbuf_way_vld_d1; 
assign	dec_mb_fb_id_d1[4] = ( misbuf_filbuf_fbid_d1[2:0] == 3'd4 ) & 
				misbuf_filbuf_way_vld_d1; 
assign	dec_mb_fb_id_d1[5] = ( misbuf_filbuf_fbid_d1[2:0] == 3'd5 ) & 
				misbuf_filbuf_way_vld_d1; 
assign	dec_mb_fb_id_d1[6] = ( misbuf_filbuf_fbid_d1[2:0] == 3'd6 ) & 
				misbuf_filbuf_way_vld_d1; 
assign	dec_mb_fb_id_d1[7] = ( misbuf_filbuf_fbid_d1[2:0] == 3'd7 ) & 
				misbuf_filbuf_way_vld_d1; 
 
 
/////////// 
// WAY<3:0> 
/////////// 
 
l2t_filbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way0 
                           (.din(misbuf_filbuf_way_d1[3:0]), .en(dec_mb_fb_id_d1[0]), 
                        .scan_in(ff_way0_scanin),
                        .scan_out(ff_way0_scanout),
                        .l1clk(l1clk), .dout(way0[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way1 
                           (.din(misbuf_filbuf_way_d1[3:0]), .en(dec_mb_fb_id_d1[1]), 
                        .scan_in(ff_way1_scanin),
                        .scan_out(ff_way1_scanout),
                        .l1clk(l1clk), .dout(way1[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way2 
                           (.din(misbuf_filbuf_way_d1[3:0]), .en(dec_mb_fb_id_d1[2]), 
                        .scan_in(ff_way2_scanin),
                        .scan_out(ff_way2_scanout),
                        .l1clk(l1clk), .dout(way2[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way3 
                           (.din(misbuf_filbuf_way_d1[3:0]), .en(dec_mb_fb_id_d1[3]), 
                        .scan_in(ff_way3_scanin),
                        .scan_out(ff_way3_scanout),
                        .l1clk(l1clk), .dout(way3[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way4 
                           (.din(misbuf_filbuf_way_d1[3:0]), .en(dec_mb_fb_id_d1[4]), 
                        .scan_in(ff_way4_scanin),
                        .scan_out(ff_way4_scanout),
                        .l1clk(l1clk), .dout(way4[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way5 
                           (.din(misbuf_filbuf_way_d1[3:0]), .en(dec_mb_fb_id_d1[5]), 
                        .scan_in(ff_way5_scanin),
                        .scan_out(ff_way5_scanout),
                        .l1clk(l1clk), .dout(way5[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way6 
                           (.din(misbuf_filbuf_way_d1[3:0]), .en(dec_mb_fb_id_d1[6]), 
                        .scan_in(ff_way6_scanin),
                        .scan_out(ff_way6_scanout),
                        .l1clk(l1clk), .dout(way6[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__en_1__width_4 ff_way7 
                           (.din(misbuf_filbuf_way_d1[3:0]), .en(dec_mb_fb_id_d1[7]), 
                        .scan_in(ff_way7_scanin),
                        .scan_out(ff_way7_scanout),
                        .l1clk(l1clk), .dout(way7[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
/////////// 
// WAY_VLD 
// set at the time of an eviction "pass" ( or after a mcu pick ) 
// and reset at the time of fill 
// Can also be reset if picked by the L2_ARB picker. 
/////////// 
 
assign	fb_way_vld_in = ( fb_way_vld |  dec_mb_fb_id_d1 ) & ~fill_complete_c3 ; 
 
 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__width_8 ff_way_vld  // sync reset active low
                           (.din(fb_way_vld_in[7:0]), .l1clk(l1clk),  
	.scan_in(ff_way_vld_scanin),
	.scan_out(ff_way_vld_scanout),
	.clr(~dbb_rst_l), .dout(fb_way_vld[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// DRAM interface.: 
// Data arriving from DRAM is written into the Fill Buffer 
// 128 bits at a time. Here is the pipeline. 
// 
//----------------------------------------------------------------------------- 
// R0		R1		R2	R3	R4	R5(PX2) 
//----------------------------------------------------------------------------- 
//		-inc		-data	-write 
// -data_vld	mcu_cnt	from	into 
// from mcu			mcu	FB 
//					to	in PH2 
//					l2b 
// 
//		-if mcu_cnt_in	-READY	-PICK   -READ	-ISSUE 
//		is 2, rdy miss	logic 
//		in mbf		in misbuf 
//----------------------------------------------------------------------------- 
// 
// New addition; 
// Added a R0_d1 stage between R0 and R1 
// 
//////////////////////////////////////////////////////////////////////////////// 
 
////////////// 
// mcu packet 
// counter 
////////////// 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_data_vld_r0_d1 
                           (.din(mcu_l2t_data_vld_r0), .l1clk(l1clk), 
                        .scan_in(ff_data_vld_r0_d1_scanin),
                        .scan_out(ff_data_vld_r0_d1_scanout),
                        .dout(mcu_data_vld_r0_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_data_vld_r1 
                           (.din(mcu_data_vld_r0_d1), .l1clk(l1clk), 
                        .scan_in(ff_data_vld_r1_scanin),
                        .scan_out(ff_data_vld_r1_scanout),
                        .dout(mcu_data_vld_r1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	filbuf_mcu_l2t_data_vld_r1 = mcu_data_vld_r1; 
 
l2t_filbuf_ctl_msff_ctl_macro__width_2 ff_mcu_l2t_chunk_id_r0_d1 
                           (.din(mcu_l2t_chunk_id_r0[1:0]),  
		.scan_in(ff_mcu_l2t_chunk_id_r0_d1_scanin),
		.scan_out(ff_mcu_l2t_chunk_id_r0_d1_scanout),
		.l1clk(l1clk), 
		.dout(mcu_l2t_chunk_id_r0_d1[1:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_2 ff_mcu_l2t_chunk_id_r1 
                           (.din(mcu_l2t_chunk_id_r0_d1[1:0]),  
		.scan_in(ff_mcu_l2t_chunk_id_r1_scanin),
		.scan_out(ff_mcu_l2t_chunk_id_r1_scanout),
		.l1clk(l1clk), 
		.dout(filbuf_mcu_l2t_chunk_id_r1[1:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_3 ff_l2t_req_id_r0_d1 
                           (.din(mcu_l2t_rd_req_id_r0[2:0]),  
		.scan_in(ff_l2t_req_id_r0_d1_scanin),
		.scan_out(ff_l2t_req_id_r0_d1_scanout),
		.l1clk(l1clk), 
		.dout(mcu_rd_req_id_r0_d1[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_3 ff_l2t_req_id_r1 
                           (.din(mcu_rd_req_id_r0_d1[2:0]),  
		.scan_in(ff_l2t_req_id_r1_scanin),
		.scan_out(ff_l2t_req_id_r1_scanout),
		.l1clk(l1clk), 
		.dout(mcu_rd_req_id_r1[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
// counter 
assign	mcu_return_cnt_plus1 = mcu_return_cnt + 2'b1 ; 
 
assign	mcu_cnt_reset = ~dbb_rst_l ; 
 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__en_1__width_2 ff_mcu_cnt  // sync reset active high
                           (.din(mcu_return_cnt_plus1[1:0]), .l1clk(l1clk),  
			.scan_in(ff_mcu_cnt_scanin),
			.scan_out(ff_mcu_cnt_scanout),
			.clr(mcu_cnt_reset),	.en(mcu_data_vld_r0_d1), 
                        .dout(mcu_return_cnt[1:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// SR Changes for new MCU protocol 4/8/04 : decoding IMISS_RQ and LOAD_RQ also 
// for N2 as the MCU protocol has changed : mcu_data_vld's for chunks <0,1> and <2,3>
// do not come back to back as in N1 but can come separated by arbitrary number of
// cycles. Hence the fill buffer wakeup will happen after 1st packet for load, after
// 2nd packet for imiss and after 4th packet for block loads and bypass cases.


//assign  mcu_count_state0 = (mcu_return_cnt == 2'd0); 
assign  mcu_count_state1 = (mcu_return_cnt == 2'd1); 
//assign  mcu_count_state2 = (mcu_return_cnt == 2'd2); 
assign  mcu_count_state3 = (mcu_return_cnt == 2'd3); 


 
//////////////// 
// Miss Buffer  Ld/Imiss miss  Ready 
// A load/Imiss instruction is readied if  
// mcu_count_state1 & mcu_data_vld_r1 implying 
// that the 2nd packet has arrived from DRAM. 
// 
// In off mode, an instruction is readied  
// when all packets arrive from DRAM 
//////////////// 
 
assign	dec_rdreq_id_r0_d1[0] =  ( mcu_rd_req_id_r0_d1 == 3'd0 ) ; 
assign	dec_rdreq_id_r0_d1[1] =  ( mcu_rd_req_id_r0_d1 == 3'd1 ) ; 
assign	dec_rdreq_id_r0_d1[2] =  ( mcu_rd_req_id_r0_d1 == 3'd2 ) ; 
assign	dec_rdreq_id_r0_d1[3] =  ( mcu_rd_req_id_r0_d1 == 3'd3 ) ; 
assign	dec_rdreq_id_r0_d1[4] =  ( mcu_rd_req_id_r0_d1 == 3'd4 ) ; 
assign	dec_rdreq_id_r0_d1[5] =  ( mcu_rd_req_id_r0_d1 == 3'd5 ) ; 
assign	dec_rdreq_id_r0_d1[6] =  ( mcu_rd_req_id_r0_d1 == 3'd6 ) ; 
assign	dec_rdreq_id_r0_d1[7] =  ( mcu_rd_req_id_r0_d1 == 3'd7 ) ; 
 
assign	rdreq_0to3_def = ~(|dec_rdreq_id_r0_d1[2:0]); 
assign	rdreq_4to7_def = ~(|dec_rdreq_id_r0_d1[6:4]); 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux1_rtn_mbid  // BS & SR 11/04/03, MB grows to 32
			(.dout(mux1_mbid_r1[4:0]), 
           .din0(mbid0[4:0]), .din1(mbid1[4:0]), .din2(mbid2[4:0]), .din3(mbid3[4:0]), 
           .sel0(dec_rdreq_id_r0_d1[0]), .sel1(dec_rdreq_id_r0_d1[1]), 
           .sel2(dec_rdreq_id_r0_d1[2]), .sel3(rdreq_0to3_def)); 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux2_rtn_mbid 
			(.dout(mux2_mbid_r1[4:0]), 
           .din0(mbid4[4:0]), .din1(mbid5[4:0]), .din2(mbid6[4:0]), .din3(mbid7[4:0]), 
           .sel0(dec_rdreq_id_r0_d1[4]), .sel1(dec_rdreq_id_r0_d1[5]), 
           .sel2(dec_rdreq_id_r0_d1[6]), .sel3(rdreq_4to7_def)); 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_5 mux3_rtn_mbid  // BS & SR 11/04/03, MB grows to 32
			(.dout(filbuf_fbf_enc_ld_mbid_r1[4:0]), 
            .din0(mux1_mbid_r1[4:0]), .din1(mux2_mbid_r1[4:0]), 
            .sel0(~mcu_rd_req_id_r0_d1[2]), .sel1(mcu_rd_req_id_r0_d1[2])); 
 
 
 
assign	ready_ld64_r0_d1 = |( dec_rdreq_id_r0_d1 &  fb_nofill) ; // => ld64 instr. 

// SR Changes for new MCU protocol 4/8/04 : decoding IMISS_RQ and LOAD_RQ also
// for N2 as the MCU protocol has changed : mcu_data_vld's for chunks <0,1> and <2,3>
// do not come back to back as in N1 but can come separated by arbitrary number of
// cycles. Hence the fill buffer wakeup will happen after 1st packet for load, after
// 2nd packet for imiss and after 4th packet for block loads and bypass cases.

assign  ready_ld_r0_d1 = |( dec_rdreq_id_r0_d1 & ~fb_stinst & ~fb_imissinst & ~fb_nofill) ; // => everything otherr than store and imiss,
                                                                                            // covers ld instr. 
assign  ready_imiss_r0_d1 = |( dec_rdreq_id_r0_d1 & fb_imissinst  & ~fb_nofill) ; // => imiss instr. 

assign  filbuf_fbf_ready_miss_r1 =
( ( ( mcu_count_state1 & mcu_data_vld_r0_d1 & ready_ld_r0_d1 ) | // Load ready 
 ( mcu_count_state1 & mcu_data_vld_r0_d1 & ready_imiss_r0_d1)) &   // Imiss ready  
        ~l2_bypass_mode_on_d1 & // L2 ON 
   ~l2_dir_map_on_d1) |
( mcu_count_state3 &  mcu_data_vld_r0_d1 & // 3 packets received 
( l2_bypass_mode_on_d1 | ready_ld64_r0_d1 ) ) ; // L2 OFF and any instruction.    

/////////////////////////////////////////////////////////// 
// L2 ready: is set to indicate that all packets for this 
// miss request have arrived from DRAM. ALongwith WAY_VLD, 
// this bit is used as a pick condition for a FILL. 
//  
// Set when mcu_count_state2 and mcu_data_vld_r1 is high 
// in l2 ON mode. 
//  
// In cache OFF mode, L2 ready is set if an instruction  
// hits an FB entry with fb_stinst=1, implying that the 
// line is dirty in the FIll Buffer and needs to be written  
// back to DRAM , exception is a CAS1. IN the case of a cas1 
// instruction, the ready bit is not set. 
/////////////////////////////////////////////////////////// 
 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_cas1_inst_c3 
                           (.din(arb_decdp_cas1_inst_c2), .l1clk(l1clk), 
                        .scan_in(ff_cas1_inst_c3_scanin),
                        .scan_out(ff_cas1_inst_c3_scanout),
                        .dout(cas1_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_cas1_inst_c4 
                           (.din(cas1_inst_c3), .l1clk(l1clk), 
                        .scan_in(ff_cas1_inst_c4_scanin),
                        .scan_out(ff_cas1_inst_c4_scanout),
                        .dout(cas1_inst_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_8 ff_fb_hit_vec_c3 
                           (.din(fb_hit_vec_c2[7:0]), .l1clk(l1clk), 
                        .scan_in(ff_fb_hit_vec_c3_scanin),
                        .scan_out(ff_fb_hit_vec_c3_scanout),
                        .dout(fb_hit_vec_c3[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__width_8 ff_fb_hit_vec_c4 
                           (.din(fb_hit_vec_c3[7:0]), .l1clk(l1clk), 
                        .scan_in(ff_fb_hit_vec_c4_scanin),
                        .scan_out(ff_fb_hit_vec_c4_scanout),
                        .dout(fb_hit_vec_c4[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 

// SR Changes for new MCU protocol 4/8/04 : decoding IMISS_RQ and LOAD_RQ also
// for N2 as the MCU protocol has changed : mcu_data_vld's for chunks <0,1> and <2,3>
// do not come back to back as in N1 but can come separated by arbitrary number of
// cycles. Hence the fill buffer wakeup will happen after 1st packet for load, after
// 2nd packet for imiss and after 4th packet for block loads and bypass cases.
 

assign  fb_l2_ready_in[7:1] = ( ({7{mcu_count_state3 &
                                 mcu_data_vld_r0_d1  }} // last pckt from mcu
                                & dec_rdreq_id_r0_d1[7:1] // id of incoming pckt
                                & ~fb_nofill[7:1] )|  // not a no fill req.
                                fb_l2_ready[7:1] ) &
                                ~fb_l2_rd_ptr[7:1] ;

assign  fb_l2_ready_in[0] = ( ( mcu_count_state3 &
                                ~l2_bypass_mode_on_d1 &
                                mcu_data_vld_r0_d1
                                & ~fb_nofill[0]
                               & dec_rdreq_id_r0_d1[0] ) |
                              ( l2_bypass_mode_on_d1 &  // l2 off
                                fb_stinst[0] &  // ~imiss and ~ld & ~ld64
                                misbuf_mbf_delete_c4 &          // mbf dequeue
                                fb_hit_vec_c4[0] &      // hit in fb
                                qual_hit_vec_c4 &
                                ~cas1_inst_c4 ) |       // not a CAS1
                                fb_l2_ready[0]
                             ) & ~fb_l2_rd_ptr[0]  ;


l2t_filbuf_ctl_msff_ctl_macro__clr_1__width_8 ff_fb_l2_ready  // sync reset active low
                           (.din(fb_l2_ready_in[7:0]), .l1clk(l1clk),  
			.scan_in(ff_fb_l2_ready_scanin),
			.scan_out(ff_fb_l2_ready_scanout),
			.clr(~dbb_rst_l), 
                      .dout(fb_l2_ready[7:0]),
  .siclk(siclk),
  .soclk(soclk)
); 
 
 
/////////////////////////////////////////////////////////////////////////// 
// Interface with L2 ARB: 
// The Fill Buffer can issue instructions at the rate of 1 every 4 cycles. 
// and the issue pipeline is similar to that of the Miss Buffer. 
//-------------------------------------------------------------------------- 
// inst A       PICK            READ (PX1)              ISSUE(PX2) 
//-------------------------------------------------------------------------- 
//              -pick if 
//              ~l2_wait 
//              or fbsel_c1     -read fbtag 
// 
//              -set l2_wait    -enable px2 rd flop 
//                              if l2_pick_d1       	- hold fbtag 
//							  until next l2_pick 
// 
//				-way and fbid 
//				 to arbdec. 
//-------------------------------------------------------------------------- 
// ENtires that are l2_ready and way_vld are picked for FIlls. 
// However, in l2_bypass_mode, the way_vld bit is not required to be set. 
// 
/////////////////////////////////////////////////////////////////////////// 
 
 
assign	l2_pick_vec[7:1] = ( fb_l2_ready[7:1] &  fb_way_vld[7:1] )   & ~{7{l2_wait}} ; 
assign	l2_pick_vec[0] = ( fb_l2_ready[0] &  (fb_way_vld[0]| l2_bypass_mode_on_d1) )   & ~l2_wait ; 
 
assign  l2_pick = |( l2_pick_vec )  ; 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_l2_pick_d1 
                           (.din(l2_pick), .l1clk(l1clk), 
               .scan_in(ff_l2_pick_d1_scanin),
               .scan_out(ff_l2_pick_d1_scanout),
               .dout(l2_pick_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign  l2_wait_in =  ( l2_pick | l2_wait)   
		& ~arb_filbuf_fbsel_c1 ; 
 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__width_1 ff_l2_wait  // sync reset active low
                           (.din(l2_wait_in), .l1clk(l1clk), .clr(~dbb_rst_l), 
               .scan_in(ff_l2_wait_scanin),
               .scan_out(ff_l2_wait_scanout),
               .dout(l2_wait),
  .siclk(siclk),
  .soclk(soclk)  
); 
 


assign  filbuf_buf_rd_en = l2t_mb2_run_r1 ? l2t_mb2_fbtag_rd_en_r3 : l2_pick ; 
 
assign  filbuf_arb_l2rd_en = l2_pick_d1; 
 
assign  filbuf_arb_vld_px1 = l2_wait ; 
 
 
////////////////////////// 
// FBID field to L2 arbdec 
////////////////////////// 
 
assign  enc_l2_rd_ptr[0] = fb_l2_rd_ptr[1] | fb_l2_rd_ptr[3] | 
                           fb_l2_rd_ptr[5] | fb_l2_rd_ptr[7]  ; 
 
assign  enc_l2_rd_ptr[1] = fb_l2_rd_ptr[2] | fb_l2_rd_ptr[3] | 
                           fb_l2_rd_ptr[6] | fb_l2_rd_ptr[7]  ; 
 
assign  enc_l2_rd_ptr[2] = fb_l2_rd_ptr[4] | fb_l2_rd_ptr[5] | 
                           fb_l2_rd_ptr[6] | fb_l2_rd_ptr[7]  ; 
 
 
l2t_filbuf_ctl_msff_ctl_macro__en_1__width_3 ff_l2_entry_px2 
                           (.din(enc_l2_rd_ptr[2:0]), .en(l2_pick_d1), 
               .scan_in(ff_l2_entry_px2_scanin),
               .scan_out(ff_l2_entry_px2_scanout),
               .l1clk(l1clk), .dout(filbuf_arbdp_entry_px2[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
			 
); 
 
 
////////////////////// 
// WAY field to L2 arbdec 
////////////////////// 
 
assign	way_mux1_def = ~(|fb_l2_rd_ptr[2:0]); 
assign	way_mux2_def = ~(|fb_l2_rd_ptr[6:4]); 
 
assign	fb_l2_rd_ptr_sel[0] = fb_l2_rd_ptr[0] ; 
assign	fb_l2_rd_ptr_sel[1] = fb_l2_rd_ptr[1] ; 
assign	fb_l2_rd_ptr_sel[2] = fb_l2_rd_ptr[2] ; 
assign	fb_l2_rd_ptr_sel[3] = way_mux1_def    ; 
 
assign	fb_l2_rd_ptr_sel[4] = fb_l2_rd_ptr[4] ; 
assign	fb_l2_rd_ptr_sel[5] = fb_l2_rd_ptr[5] ; 
assign	fb_l2_rd_ptr_sel[6] = fb_l2_rd_ptr[6] ; 
assign	fb_l2_rd_ptr_sel[7] = way_mux2_def ; 
 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_4 l2_way_mux1 
			(.dout (mux1_way[3:0]), 
                  .din0(way0[3:0]),.din1(way1[3:0]), 
                  .din2(way2[3:0]),.din3(way3[3:0]), 
                  .sel0(fb_l2_rd_ptr_sel[0]), .sel1(fb_l2_rd_ptr_sel[1]), 
                  .sel2(fb_l2_rd_ptr_sel[2]), .sel3(fb_l2_rd_ptr_sel[3])); 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_4 l2_way_mux2 
			(.dout (mux2_way[3:0]), 
                  .din0(way4[3:0]),.din1(way5[3:0]), 
                  .din2(way6[3:0]),.din3(way7[3:0]), 
                  .sel0(fb_l2_rd_ptr_sel[4]),.sel1(fb_l2_rd_ptr_sel[5]), 
                  .sel2(fb_l2_rd_ptr_sel[6]),.sel3(fb_l2_rd_ptr_sel[7])); 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 l2_way_mux 
			(.dout (fill_way[3:0]), 
                     .din0(mux2_way[3:0]), .din1(mux1_way[3:0]), 
                     .sel0(enc_l2_rd_ptr[2]),.sel1(~enc_l2_rd_ptr[2])); 
 
l2t_filbuf_ctl_msff_ctl_macro__en_1__width_4 ff_l2_way_px2 
                           (.din(fill_way[3:0]), .en(l2_pick_d1), 
              .scan_in(ff_l2_way_px2_scanin),
              .scan_out(ff_l2_way_px2_scanout),
              .l1clk(l1clk), .dout(filbuf_arbdp_way_px2[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
		 
); 
 
 
 
/////////////////////////////////////////////////////////////////////////// 
// Writing MBID into the FIll Buffer. 
// There are 3 conditions under which the mbid of an instruction is written 
// into the Fill Buffer so that the fill buffer can ready that instruction  
// after a fill. They are as following: 
// 1. A miss buffer dependent's mbID is written into the fill Buffer when  
//    the older instruction hits the fill buffer and completes ( dequeues from mb) 
//    This is mbist_done in the C4 cycle of the older instruction. 
// 2. A non dependent instruction that issues from the IQ cannot receive data 
//    from the FIll Buffer. The mbID of the instruction is written into the  
//    Fill Buffer so that it can be readied when a fill is performed. 
//    The mbID write into the Fill Buffer is performed in C4. 
// 3. The ID of a miss requesting to DRAM is writted into the Fill Buffer in 
//    the D2 cycle of the l2-mcu request pipeline. 
// 
// 
// A next_link VALID bit is set when the mbid comes from either 1 or 2 above. 
// The next_link VALID bit is reset when a fill is complete. 
// 
/////////////////////////////////////////////////////////////////////////// 
 
 
 
assign	dep_ptr_wr_en_c4 = misbuf_filbuf_next_vld_c4 & misbuf_mbf_delete_c4  & 
				~cas1_inst_c4; // cas1 dependents never woken up by the FBF 
 
 
assign  dep_wr_qual_c4  = ( {8{~l2_bypass_mode_on_d1}} |  // l2 $ ON 
			fb_stinst ) ;	// Fill Buffer instruction is a Store. 
 
assign  dep_wr_ptr_c4 = fb_hit_vec_c4  & dep_wr_qual_c4 &  
				{8{dep_ptr_wr_en_c4 }}  ; 
 
 
 
assign	non_dep_mbf_insert_c4 =  misbuf_mbf_insert_c4 & ~misbuf_hit_c4; 
 
assign	non_dep_wr_ptr_c4 = fb_hit_vec_c4 &  
			{8{non_dep_mbf_insert_c4 }} ; 
 
 
assign	non_dep_wr_ptr_c4_rst = non_dep_wr_ptr_c4  ;
assign	dep_wr_ptr_c4_rst = dep_wr_ptr_c4 ;
assign	fb_set_valid_d2_rst = fb_set_valid_d2 ;
 
 
l2t_filbuf_ctl_msff_ctl_macro__width_5 ff_mbf_entry_d2  // BS & SR 11/04/03, MB grows to 32
                           (.din(mbdata_filbuf_mbf_entry[4:0]), .l1clk(l1clk), 
                        .scan_in(ff_mbf_entry_d2_scanin),
                        .scan_out(ff_mbf_entry_d2_scanout),
                        .dout(mbf_entry_d2[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	sel_def_mbid  = ~( dep_wr_ptr_c4 | fb_set_valid_d2_rst | 
		   non_dep_wr_ptr_c4 ) ;

//BS & SR 11/04/03, MB grows to 32
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_mbid0 
			(.dout(mbid0_in[4:0]), 
        .din0(misbuf_filbuf_next_link_c4[4:0]), .din1(mbf_entry_d2[4:0]), 
        .din2(misbuf_mbf_insert_mbid_c4[4:0]), .din3(mbid0[4:0]), 
        .sel0(dep_wr_ptr_c4_rst[0]), .sel1(fb_set_valid_d2_rst[0]), 
        .sel2(non_dep_wr_ptr_c4_rst[0]), .sel3(sel_def_mbid[0])); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_5 ff_mbid0 
                           (.din(mbid0_in[4:0]), .l1clk(l1clk), 
          .scan_in(ff_mbid0_scanin),
          .scan_out(ff_mbid0_scanout),
          .dout(mbid0[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_mbid1 
			(.dout(mbid1_in[4:0]), 
        .din0(misbuf_filbuf_next_link_c4[4:0]), .din1(mbf_entry_d2[4:0]), 
        .din2(misbuf_mbf_insert_mbid_c4[4:0]), .din3(mbid1[4:0]), 
        .sel0(dep_wr_ptr_c4_rst[1]), .sel1(fb_set_valid_d2_rst[1]), 
        .sel2(non_dep_wr_ptr_c4_rst[1]), .sel3(sel_def_mbid[1])); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_5 ff_mbid1 
                           (.din(mbid1_in[4:0]), .l1clk(l1clk), 
        .scan_in(ff_mbid1_scanin),
        .scan_out(ff_mbid1_scanout),
        .dout(mbid1[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_mbid2 
			(.dout(mbid2_in[4:0]), 
        .din0(misbuf_filbuf_next_link_c4[4:0]), .din1(mbf_entry_d2[4:0]), 
        .din2(misbuf_mbf_insert_mbid_c4[4:0]), .din3(mbid2[4:0]), 
        .sel0(dep_wr_ptr_c4_rst[2]), .sel1(fb_set_valid_d2_rst[2]), 
        .sel2(non_dep_wr_ptr_c4_rst[2]), .sel3(sel_def_mbid[2])); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_5 ff_mbid2 
                           (.din(mbid2_in[4:0]), .l1clk(l1clk), 
        .scan_in(ff_mbid2_scanin),
        .scan_out(ff_mbid2_scanout),
        .dout(mbid2[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_mbid3 
			(.dout(mbid3_in[4:0]), 
        .din0(misbuf_filbuf_next_link_c4[4:0]), .din1(mbf_entry_d2[4:0]), 
        .din2(misbuf_mbf_insert_mbid_c4[4:0]), .din3(mbid3[4:0]), 
        .sel0(dep_wr_ptr_c4_rst[3]), .sel1(fb_set_valid_d2_rst[3]), 
        .sel2(non_dep_wr_ptr_c4_rst[3]), .sel3(sel_def_mbid[3])); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_5 ff_mbid3 
                           (.din(mbid3_in[4:0]), .l1clk(l1clk), 
        .scan_in(ff_mbid3_scanin),
        .scan_out(ff_mbid3_scanout),
        .dout(mbid3[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_mbid4 
			(.dout(mbid4_in[4:0]), 
        .din0(misbuf_filbuf_next_link_c4[4:0]), .din1(mbf_entry_d2[4:0]), 
        .din2(misbuf_mbf_insert_mbid_c4[4:0]), .din3(mbid4[4:0]), 
        .sel0(dep_wr_ptr_c4_rst[4]), .sel1(fb_set_valid_d2_rst[4]), 
        .sel2(non_dep_wr_ptr_c4_rst[4]), .sel3(sel_def_mbid[4])); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_5 ff_mbid4 
                           (.din(mbid4_in[4:0]), .l1clk(l1clk), 
             .scan_in(ff_mbid4_scanin),
             .scan_out(ff_mbid4_scanout),
             .dout(mbid4[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_mbid5 
			(.dout(mbid5_in[4:0]), 
        .din0(misbuf_filbuf_next_link_c4[4:0]), .din1(mbf_entry_d2[4:0]), 
        .din2(misbuf_mbf_insert_mbid_c4[4:0]), .din3(mbid5[4:0]), 
        .sel0(dep_wr_ptr_c4_rst[5]), .sel1(fb_set_valid_d2_rst[5]), 
        .sel2(non_dep_wr_ptr_c4_rst[5]), .sel3(sel_def_mbid[5])); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_5 ff_mbid5 
                           (.din(mbid5_in[4:0]), .l1clk(l1clk), 
             .scan_in(ff_mbid5_scanin),
             .scan_out(ff_mbid5_scanout),
             .dout(mbid5[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_mbid6 
			(.dout(mbid6_in[4:0]), 
        .din0(misbuf_filbuf_next_link_c4[4:0]), .din1(mbf_entry_d2[4:0]), 
        .din2(misbuf_mbf_insert_mbid_c4[4:0]), .din3(mbid6[4:0]), 
        .sel0(dep_wr_ptr_c4_rst[6]), .sel1(fb_set_valid_d2_rst[6]), 
        .sel2(non_dep_wr_ptr_c4_rst[6]), .sel3(sel_def_mbid[6])); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_5 ff_mbid6 
                           (.din(mbid6_in[4:0]), .l1clk(l1clk), 
             .scan_in(ff_mbid6_scanin),
             .scan_out(ff_mbid6_scanout),
             .dout(mbid6[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_mbid7 
			(.dout(mbid7_in[4:0]), 
        .din0(misbuf_filbuf_next_link_c4[4:0]), .din1(mbf_entry_d2[4:0]), 
        .din2(misbuf_mbf_insert_mbid_c4[4:0]), .din3(mbid7[4:0]), 
        .sel0(dep_wr_ptr_c4_rst[7]), .sel1(fb_set_valid_d2_rst[7]), 
        .sel2(non_dep_wr_ptr_c4_rst[7]), .sel3(sel_def_mbid[7])); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_5 ff_mbid7 
                           (.din(mbid7_in[4:0]), .l1clk(l1clk), 
             .scan_in(ff_mbid7_scanin),
             .scan_out(ff_mbid7_scanout),
             .dout(mbid7[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
////////////////////////////////////////////////////////////////////// 
// FB  next link valid: 
// Set in the C4 cycle of an operation that writes mbid into 
// the Fill Buffer. REset in the C4 cycle of a Fill operation. 
// 
// NOTE: The resetting of next_link vld cannot be mbist_done before C4 
// since it is only set in C4 of a miss buffer/IQ operation. 
////////////////////////////////////////////////////////////////////// 
 
l2t_filbuf_ctl_msff_ctl_macro__width_8 ff_fill_complete_c4 
                           (.din(fill_complete_c3[7:0]), .l1clk(l1clk), 
             	.scan_in(ff_fill_complete_c4_scanin),
             	.scan_out(ff_fill_complete_c4_scanout),
             	.dout(fill_complete_c4[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	fb_next_link_vld_in = ( fb_next_link_vld | 
				dep_wr_ptr_c4 | 
				non_dep_wr_ptr_c4 ) &  
				~fill_complete_c4 ; 
 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__width_8 ff_fb_next_link_vld  // sync reset active low
                           (.din(fb_next_link_vld_in[7:0]), .l1clk(l1clk),  
	.scan_in(ff_fb_next_link_vld_scanin),
	.scan_out(ff_fb_next_link_vld_scanout),
	.clr(~dbb_rst_l), .dout(fb_next_link_vld[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
//////////////// 
// Ready logic for dependent instructions. 
// Dependents/Store instructions are readied on a Fill. 
// 
// In L2 off mode, stores are readied when the FB entry has 
// the complete 64Bytes. Hence, we do not ready stores on 
// a Fill in L2 OFF mode. 
///////////////// 
 
assign  fill_entry_0to3_c4 = |( fill_complete_c4[3:0]) ; 
 
 
// Added for one hot sel and scan protection. 
assign	fill_complete_0to3_def = ~(|fill_complete_c4[2:0]); 
assign	fill_complete_4to7_def = ~(|fill_complete_c4[6:4]); 
 
assign	fill_complete_sel[0] = fill_complete_c4[0] ;
assign	fill_complete_sel[1] = fill_complete_c4[1] ;
assign	fill_complete_sel[2] = fill_complete_c4[2] ;
assign	fill_complete_sel[3] = fill_complete_0to3_def ;
 
assign	fill_complete_sel[4] = fill_complete_c4[4] ;
assign	fill_complete_sel[5] = fill_complete_c4[5] ;
assign	fill_complete_sel[6] = fill_complete_c4[6] ;
assign	fill_complete_sel[7] = fill_complete_4to7_def ;
 
// BS & SR 11/04/03, MB grows to 32 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux1_dep_mbid 
			(.dout(mux1_dep_mbid_c4[4:0]), 
           .din0(mbid0[4:0]), .din1(mbid1[4:0]), .din2(mbid2[4:0]), .din3(mbid3[4:0]), 
           .sel0(fill_complete_sel[0]), .sel1(fill_complete_sel[1]), 
           .sel2(fill_complete_sel[2]), .sel3(fill_complete_sel[3])); 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux2_dep_mbid 
			(.dout(mux2_dep_mbid_c4[4:0]), 
           .din0(mbid4[4:0]), .din1(mbid5[4:0]), .din2(mbid6[4:0]), .din3(mbid7[4:0]), 
           .sel0(fill_complete_sel[4]), .sel1(fill_complete_sel[5]), 
           .sel2(fill_complete_sel[6]), .sel3(fill_complete_sel[7])); 
 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_5 mux3_dep_mbid  // BS & SR 11/04/03, MB grows to 32
			(.dout(filbuf_fbf_enc_dep_mbid_c4[4:0]), 
           .din0(mux1_dep_mbid_c4[4:0]), .din1(mux2_dep_mbid_c4[4:0]), 
           .sel0(fill_entry_0to3_c4), .sel1(~fill_entry_0to3_c4)); 
 
 
assign  filbuf_fbf_st_or_dep_rdy_c4 =  |( fill_complete_c4 &  
		(	fb_next_link_vld |	// real dep. 
		(fb_stinst & ~{8{l2_bypass_mode_on_d1}}) | 	// store inst 
		(~fb_stinst & ~fb_nofill & {8{l2_dir_map_on_d1}} )) // any inst in dir map mode. 
						// no FILLS have to be gated off because they 
						// are invalidated in this cycle. 
				 ); 
 
 
 
////////////////////////////////////////////////////////////////////// 
// FB data interface. 
// fbdata has two ports 1r and 1w. Read is performed in PH1 and write 
// in PH2.  
// 
// THe operations causing a read are as follows: 
// - Any operation that hits the FB in  
// - An Imiss operation hitting the FB accesses it for 2 cycles. 
// - A Fill operation  
// Here is the pipeline for read enable and read wl generation. 
// 
//------------------------------------------------------------------- 
//	C2		C3		C4 
//------------------------------------------------------------------- 
//	generate	flop		read	 
//	hit		in tag 	FB data. 
//  	and hit entry 
// 
//	generate wen	xmit 
//	and wordline	to fbdata 
// 
//	xmit to  
//	tag 
//------------------------------------------------------------------- 
// 
////////////////////////////////////////////////////////////////////// 
 
///////// 
// Wr en and wr wordline generation. 
///////// 
 
 
// change r1 to r2 in the following equation. 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_3 mux_fbwr_entry_c2 
			(.dout(filbuf_fbd_wr_entry_r1[2:0]), 
           .din0(enc_hit_vec_c2[2:0]), .din1(mcu_rd_req_id_r1[2:0]), 
           .sel0(~filbuf_mcu_l2t_data_vld_r1), .sel1(filbuf_mcu_l2t_data_vld_r1)); 
 
 
///////// 
// 
// Rd en and rd wordline generation. 
//  
///////// 
 
assign	sel_c2_fill_entry = arb_fill_vld_c2 & ~l2_bypass_mode_on_d1 ; 
assign	sel_c3_fill_entry = fill_vld_c3  & l2_bypass_mode_on_d1 ; 
 
assign	filbuf_fbd_rd_en_c2 = filbuf_tag_hit_frm_mb_c2 | // replaced from filbuf_hit_c2 
			imiss_ld64_fb_hit_c3 |  
			sel_c2_fill_entry | 
			sel_c3_fill_entry ; 
 
assign  enc_hit_vec_c2[0] = fb_hit_vec_c2[1] | fb_hit_vec_c2[3] | 
                           fb_hit_vec_c2[5] | fb_hit_vec_c2[7]  ; 
 
assign  enc_hit_vec_c2[1] = fb_hit_vec_c2[2] | fb_hit_vec_c2[3] | 
                           fb_hit_vec_c2[6] | fb_hit_vec_c2[7]  ; 
 
assign  enc_hit_vec_c2[2] = fb_hit_vec_c2[4] | fb_hit_vec_c2[5] | 
                           fb_hit_vec_c2[6] | fb_hit_vec_c2[7]  ; 
 
 
l2t_filbuf_ctl_msff_ctl_macro__width_3 ff_enc_hit_vec_c3 
                           (.din(enc_hit_vec_c2[2:0]), .l1clk(l1clk), 
               .scan_in(ff_enc_hit_vec_c3_scanin),
               .scan_out(ff_enc_hit_vec_c3_scanout),
               .dout(enc_hit_vec_c3[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_3 ff_fill_entry_c2 
                           (.din(arbdec_arbdp_inst_mb_entry_c1[2:0]), .l1clk(l1clk), 
               .scan_in(ff_fill_entry_c2_scanin),
               .scan_out(ff_fill_entry_c2_scanout),
               .dout(fill_entry_c2[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_3 ff_fill_entry_c3 
                           (.din(fill_entry_c2[2:0]), .l1clk(l1clk), 
               .scan_in(ff_fill_entry_c3_scanin),
               .scan_out(ff_fill_entry_c3_scanout),
               .dout(fill_entry_c3[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// Pick C2 fill entry if Fill and $ ON 
// Pick C3 fill entry if Fill and $ OFF. 
// Else pick C3 hit entry. 
 
assign	sel_def_hit_entry_mux1 = ~sel_c2_fill_entry & ~sel_c3_fill_entry ; 
 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_3 mux1_fb_entry_c2  
			(.dout(fb_rd_entry_c2[2:0]), 
           	.din0(fill_entry_c2[2:0]),  
		.din1(fill_entry_c3[2:0]), 
		.din2(enc_hit_vec_c3[2:0]), 
           	.sel0(sel_c2_fill_entry),  
           	.sel1(sel_c3_fill_entry),  
		.sel2(sel_def_hit_entry_mux1)); 
 
assign	sel_c2_entry = sel_def_hit_entry_mux1 & ~imiss_ld64_fb_hit_c3  ; 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_3 mux2_fb_entry_c2 
			(.dout(filbuf_fbd_rd_entry_c2[2:0]), 
           	.din0(enc_hit_vec_c2[2:0]),  
		.din1(fb_rd_entry_c2[2:0]), 
           	.sel0(sel_c2_entry),  
		.sel1(~sel_c2_entry)); 
 
 
/////////////// 
// PICKER 
/////////////// 

assign dbginit_l = 1'b1;
 
// Pick from the FIll Buffer. 
assign  init_pick_state = ~dbb_rst_l | ~dbginit_l ; 
 
// PICK STATE 
assign  sel_l2st_lshift = arb_filbuf_fbsel_c1 & ~init_pick_state ; 
assign  sel_l2st_same = ~arb_filbuf_fbsel_c1  & ~init_pick_state ; 
assign  l2_rd_state_lshift = { l2_rd_state[2:0], l2_rd_state[3] } ; 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_l2_rd_state  
			(.dout(l2_rd_state_in[3:0]), 
                      .din0(4'b1), .din1(l2_rd_state_lshift[3:0]), 
                      .din2(l2_rd_state[3:0]), 
                      .sel0(init_pick_state), .sel1(sel_l2st_lshift), 
                      .sel2(sel_l2st_same)) ; 
l2t_filbuf_ctl_msff_ctl_macro__width_4 ff_l2_rd_state 
                           (.din(l2_rd_state_in[3:0]), .l1clk(l1clk), 
                        .scan_in(ff_l2_rd_state_scanin),
                        .scan_out(ff_l2_rd_state_scanout),
                        .dout(l2_rd_state[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// PICK STATE quad0 
assign  sel_l2st_lshift_quad0 = ( arb_filbuf_fbsel_c1  
		&  (|(fb_l2_rd_ptr[3:0])) ) & ~init_pick_state ; 
assign  sel_l2st_same_quad0 = ~( arb_filbuf_fbsel_c1 &   
		(|(fb_l2_rd_ptr[3:0])) )  & ~init_pick_state ; 
assign  l2_rd_state_lshift_quad0 = { l2_rd_state_quad0[2:0], l2_rd_state_quad0[3] } ; 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_l2_rd_state_quad0  
			(.dout(l2_rd_state_in_quad0[3:0]), 
                           .din0(4'b1), .din1(l2_rd_state_lshift_quad0[3:0]), 
                           .din2(l2_rd_state_quad0[3:0]), 
                           .sel0(init_pick_state), .sel1(sel_l2st_lshift_quad0), 
                           .sel2(sel_l2st_same_quad0)) ; 
l2t_filbuf_ctl_msff_ctl_macro__width_4 ff_l2_rd_state_quad0 
                           (.din(l2_rd_state_in_quad0[3:0]), .l1clk(l1clk), 
                        .scan_in(ff_l2_rd_state_quad0_scanin),
                        .scan_out(ff_l2_rd_state_quad0_scanout),
                        .dout(l2_rd_state_quad0[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
// PICK STATE quad1 
assign  sel_l2st_lshift_quad1 = ( arb_filbuf_fbsel_c1  
		&  (|(fb_l2_rd_ptr[3:0])) ) & ~init_pick_state ; 
assign  sel_l2st_same_quad1 = ~( arb_filbuf_fbsel_c1  
		&  (|(fb_l2_rd_ptr[3:0])) )  & ~init_pick_state ; 
assign  l2_rd_state_lshift_quad1 = { l2_rd_state_quad1[2:0], l2_rd_state_quad1[3] } ; 
 
l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_l2_rd_state_quad1  
			(.dout(l2_rd_state_in_quad1[3:0]), 
                           .din0(4'b1), .din1(l2_rd_state_lshift_quad1[3:0]), 
                           .din2(l2_rd_state_quad1[3:0]), 
                           .sel0(init_pick_state), .sel1(sel_l2st_lshift_quad1), 
                           .sel2(sel_l2st_same_quad1)) ; 
l2t_filbuf_ctl_msff_ctl_macro__width_4 ff_l2_rd_state_quad1 
                           (.din(l2_rd_state_in_quad1[3:0]), .l1clk(l1clk), 
                        .scan_in(ff_l2_rd_state_quad1_scanin),
                        .scan_out(ff_l2_rd_state_quad1_scanout),
                        .dout(l2_rd_state_quad1[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
// anchor 
assign  pick_s0 = l2_rd_state[0] ; 
assign  pick_s1 = l2_rd_state[1] ; 
assign  pick_s2 = l2_rd_state[2] ; 
assign  pick_s3 = l2_rd_state[3] ; 
 
assign  pick_s0_quad0 = l2_rd_state_quad0[0]; 
assign  pick_s1_quad0 = l2_rd_state_quad0[1]; 
assign  pick_s2_quad0 = l2_rd_state_quad0[2]; 
assign  pick_s3_quad0 = l2_rd_state_quad0[3]; 
 
assign  pick_s0_quad1 = l2_rd_state_quad1[0]; 
assign  pick_s1_quad1 = l2_rd_state_quad1[1]; 
assign  pick_s2_quad1 = l2_rd_state_quad1[2]; 
assign  pick_s3_quad1 = l2_rd_state_quad1[3]; 
 
 
// anchor quads 
assign  pick_quad_s0 = ( pick_s0 | pick_s2 ) ; 
assign  pick_quad_s1 = ( pick_s1 | pick_s3 ) ; 
 
// sel vector 
assign  pick_quad0_in = ( l2_pick_vec[3:0] ); 
assign  pick_quad1_in = ( l2_pick_vec[7:4] ) ; 
 
// sel vector  quad 
assign  pick_quad_in[0] = |( pick_quad0_in ) ; 
assign  pick_quad_in[1] = |( pick_quad1_in ) ; 
 
 
// QUAD0 bits. 
assign  pick_quad0_sel[0] = pick_quad0_in[0] &  ( pick_s0_quad0 | 
                ( pick_s1_quad0 & ~( pick_quad0_in[1] | 
                        pick_quad0_in[2] | pick_quad0_in[3] ) ) | 
                        ( pick_s2_quad0 & ~(pick_quad0_in[2] | pick_quad0_in[3] )) | 
                        ( pick_s3_quad0 & ~(pick_quad0_in[3] )  ) ) ; 
 
assign  pick_quad0_sel[1] = pick_quad0_in[1] &  ( pick_s1_quad0 | 
                ( pick_s2_quad0 & ~( pick_quad0_in[2] | 
                        pick_quad0_in[3] | pick_quad0_in[0] ) ) | 
                        ( pick_s3_quad0 & ~(pick_quad0_in[3] | pick_quad0_in[0] )) | 
                        ( pick_s0_quad0 & ~(pick_quad0_in[0] )  ) ) ; 
 
 
assign  pick_quad0_sel[2] = pick_quad0_in[2] &  ( pick_s2_quad0 | 
                ( pick_s3_quad0 & ~( pick_quad0_in[3] | 
                        pick_quad0_in[0] | pick_quad0_in[1] ) ) | 
                        ( pick_s0_quad0 & ~(pick_quad0_in[0] | pick_quad0_in[1] )) | 
                        ( pick_s1_quad0 & ~(pick_quad0_in[1] )  ) ) ; 
 
assign  pick_quad0_sel[3] = pick_quad0_in[3] &  ( pick_s3_quad0 | 
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
 
// QUAD 
 
assign  pick_quad_sel[0] = pick_quad_in[0] &  ( pick_quad_s0 | 
                ( pick_quad_s1 & ~pick_quad_in[1] ) )   ; 
 
assign  pick_quad_sel[1] = pick_quad_in[1] &  ( pick_quad_s1 | 
                ( pick_quad_s0 & ~pick_quad_in[0] ) )   ; 
 
assign  fb_l2_rd_ptr_in[3:0] = ( pick_quad0_sel[3:0]  & {4{pick_quad_sel[0]}} ) ; 
assign  fb_l2_rd_ptr_in[7:4] = ( pick_quad1_sel[3:0]  & {4{pick_quad_sel[1]}} ) ;  
 
assign	filbuf_fbtag_rd_ptr[7:0] = l2t_mb2_run_r1 ? mbist_fbtag_wr_ptr[7:0] : fb_l2_rd_ptr_in[7:0] ; 
 
l2t_filbuf_ctl_msff_ctl_macro__width_8 ff_l2_rd_ptr 
                           (.din(fb_l2_rd_ptr_in[7:0]), .l1clk(l1clk), 
            .scan_in(ff_l2_rd_ptr_scanin),
            .scan_out(ff_l2_rd_ptr_scanout),
            .dout(fb_l2_rd_ptr[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
////////////////////////////////////////////////////////////////////////////////// 
// DRAM related ERRORs 
// fb_Cerr and fb_uerr:  
// 
// When a DRAM read access encounters an error, an error indication is sent 
// to the L2$. The L2 uses this indication to set DAC/DAU bits in the Error 
// Status register. 
// fb_cerr or fb_uerr bits are set synchronous with any data xfer from mcu. 
// 
// If an instruction issued from the Miss Buffer hits an entry in the Fill Buffer 
// with fb_cerr or fb_uerr, an error indication is reported to the sparcs  
// and the err bits are reset in filbuf.  
// AN error is not cleared in the case of a wr8 hitting the fill buffer in 
// OFF mode. In this case, we wait for the fill to clear the ERROR  
// after causing a DAU to be reported.This is because a WR8 instruction will 
// not be sending a st_ack but an evict_ack to the sparcs. The ERR field of 
// a CPX evict_ack is ignored. 
// 
// Note: Set condition has a higher priority than the reset condition. 
// 
// If a fill happens before the bypass operation, an error indication is sent( to the cores) 
// synchronous with the fill oepration and  the error bits are reset in filbuf. 
// 
// The following signals are generated in l2t_filbuf for logging and  
// reporting. 
// 
// Logging 
//  filbuf_spc_uncorr_err_c7; //    
//  filbuf_spc_corr_err_c7; //    
//  filbuf_spc_rd_vld_c7; // 	 
//  filbuf_bsc_corr_err_c12; //  
//  filbuf_ld64_fb_hit_c12; //  
// 
// Reporting. 
//  filbuf_dis_cerr_c3; 
//  filbuf_dis_uerr_c3; 
// 
// 
// 
// filbuf_corr_err_c8, filbuf_uncorr_err_c8: Used only for logging of  
// 	errors DAC/DAU in l2t_csr_ctl.sv. Generated during a Fill. 
// 
// filbuf_spc_corr_err_c7, filbuf_spc_uncorr_err_c7: Used for logging 
//  	of DAC/DAU hits during sparc reads hitting the FIll buffer. 
//	Also used to report errors to the issuing sparcs for  
//	Load/imiss/pst_read hits. 
// 
// filbuf_spc_rd_vld_c7: Used for reporting errors to the issuing sparc. 
//	This bit will be used to detect any bit flips in the data that 
//	is in the Fill Buffer. Any errors coming from DRAM will already 
//	be detected by the above two signals filbuf_spc_corr_err_c7 & 
//	filbuf_spc_uncorr_err_c7. 
// 
// filbuf_bsc_corr_err_c12: Used to detect correctable errors in  
//	an RDMA read instruction when it misses the L2. Used  
// 	for logging 
// 
// filbuf_ld64_fbhit_c12: Used for differentiating between an LDRU 
// 	and a DRU error while logging. 
// 
// 
//	 
// 
//			 
////////////////////////////////////////////////////////////////////////////////// 
 
 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_secc_err_r3 
                           (.din(mcu_l2t_secc_err_r2), .l1clk(l1clk), 
		.scan_in(ff_secc_err_r3_scanin),
		.scan_out(ff_secc_err_r3_scanout),
		.dout(secc_err_r3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_mecc_err_r3 
                           (.din(mcu_l2t_mecc_err_r2), .l1clk(l1clk), 
		.scan_in(ff_mecc_err_r3_scanin),
		.scan_out(ff_mecc_err_r3_scanout),
		.dout(mecc_err_r3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_data_vld_r2 
                           (.din(mcu_data_vld_r1), .l1clk(l1clk), 
                        .scan_in(ff_data_vld_r2_scanin),
                        .scan_out(ff_data_vld_r2_scanout),
                        .dout(mcu_data_vld_r2),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_data_vld_r3 
                           (.din(mcu_data_vld_r2), .l1clk(l1clk), 
                        .scan_in(ff_data_vld_r3_scanin),
                        .scan_out(ff_data_vld_r3_scanout),
                        .dout(mcu_data_vld_r3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_3 ff_mcu_rd_req_id_r2 
                           (.din(mcu_rd_req_id_r1[2:0]), .l1clk(l1clk), 
			.scan_in(ff_mcu_rd_req_id_r2_scanin),
			.scan_out(ff_mcu_rd_req_id_r2_scanout),
			.dout(mcu_rd_req_id_r2[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_3 ff_mcu_rd_req_id_r3 
                           (.din(mcu_rd_req_id_r2[2:0]), .l1clk(l1clk), 
			.scan_in(ff_mcu_rd_req_id_r3_scanin),
			.scan_out(ff_mcu_rd_req_id_r3_scanout),
			.dout(mcu_rd_req_id_r3[2:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign  fb_cerr_in[0] =  ( mcu_rd_req_id_r3 == 3'd0 ) & secc_err_r3  & mcu_data_vld_r3; 
assign  fb_cerr_in[1] =  ( mcu_rd_req_id_r3 == 3'd1 ) & secc_err_r3  & mcu_data_vld_r3; 
assign  fb_cerr_in[2] =  ( mcu_rd_req_id_r3 == 3'd2 ) & secc_err_r3  & mcu_data_vld_r3; 
assign  fb_cerr_in[3] =  ( mcu_rd_req_id_r3 == 3'd3 ) & secc_err_r3  & mcu_data_vld_r3; 
assign  fb_cerr_in[4] =  ( mcu_rd_req_id_r3 == 3'd4 ) & secc_err_r3  & mcu_data_vld_r3; 
assign  fb_cerr_in[5] =  ( mcu_rd_req_id_r3 == 3'd5 ) & secc_err_r3  & mcu_data_vld_r3; 
assign  fb_cerr_in[6] =  ( mcu_rd_req_id_r3 == 3'd6 ) & secc_err_r3  & mcu_data_vld_r3; 
assign  fb_cerr_in[7] =  ( mcu_rd_req_id_r3 == 3'd7 ) & secc_err_r3  & mcu_data_vld_r3; 
 
assign  fb_uerr_in[0] =  ( mcu_rd_req_id_r3 == 3'd0 ) & mecc_err_r3  & mcu_data_vld_r3; 
assign  fb_uerr_in[1] =  ( mcu_rd_req_id_r3 == 3'd1 ) & mecc_err_r3  & mcu_data_vld_r3; 
assign  fb_uerr_in[2] =  ( mcu_rd_req_id_r3 == 3'd2 ) & mecc_err_r3  & mcu_data_vld_r3; 
assign  fb_uerr_in[3] =  ( mcu_rd_req_id_r3 == 3'd3 ) & mecc_err_r3  & mcu_data_vld_r3; 
assign  fb_uerr_in[4] =  ( mcu_rd_req_id_r3 == 3'd4 ) & mecc_err_r3  & mcu_data_vld_r3; 
assign  fb_uerr_in[5] =  ( mcu_rd_req_id_r3 == 3'd5 ) & mecc_err_r3  & mcu_data_vld_r3; 
assign  fb_uerr_in[6] =  ( mcu_rd_req_id_r3 == 3'd6 ) & mecc_err_r3  & mcu_data_vld_r3; 
assign  fb_uerr_in[7] =  ( mcu_rd_req_id_r3 == 3'd7 ) & mecc_err_r3  & mcu_data_vld_r3; 
 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_wr8_inst_c3 
                           (.din(arb_decdp_wr8_inst_c2), .l1clk(l1clk), 
                .scan_in(ff_wr8_inst_c3_scanin),
                .scan_out(ff_wr8_inst_c3_scanout),
                .dout(wr8_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_wr8_inst_c4 
                           (.din(wr8_inst_c3), .l1clk(l1clk), 
                .scan_in(ff_wr8_inst_c4_scanin),
                .scan_out(ff_wr8_inst_c4_scanout),
                .dout(wr8_inst_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 

assign  clear_err_c3 = fb_hit_vec_c3 & {8{filbuf_hit_c3 & ~wr8_inst_c3}} ;

assign  fb_cerr_prev = ( fb_cerr  & ~( fill_complete_c3 | clear_err_c3 ) )
                        | fb_cerr_in ;
assign  fb_uerr_prev = ( fb_uerr  & ~( fill_complete_c3 | clear_err_c3 ) )
                        | fb_uerr_in ;
 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__width_8 ff_fb_cerr  // sync reset active low
                           (.din(fb_cerr_prev[7:0]), .l1clk(l1clk), .dout(fb_cerr[7:0]), 
			.scan_in(ff_fb_cerr_scanin),
			.scan_out(ff_fb_cerr_scanout),
			.clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk) 
                         
); 
 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__width_8 ff_fb_uerr  // sync reset active low
                           (.din(fb_uerr_prev[7:0]), .l1clk(l1clk), .dout(fb_uerr[7:0]), 
			.scan_in(ff_fb_uerr_scanin),
			.scan_out(ff_fb_uerr_scanout),
			.clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk) 
                         
); 

// in case CAS1 or SWAP/ldstub 1st pass detects a UE or CE in the FIll Buffer
// in off_mode , need to log the error bit in the miss buffer (mb_corr,mb_uncorr_err bits)
// so that the CAS2 pass and SWAP/LDSTUB second pass also reports error in the
// Store ack packet.

assign filbuf_misbuf_ue_offmode_c3 = (|(fb_uerr & clear_err_c3)) & l2_bypass_mode_on_d1;
assign filbuf_misbuf_ce_offmode_c3 = (|(fb_cerr & clear_err_c3)) & l2_bypass_mode_on_d1; 

l2t_filbuf_ctl_msff_ctl_macro__width_5 ff_filbuf_misbuf_ue_offmode 
           (.din({filbuf_misbuf_ue_offmode_c3,filbuf_misbuf_ue_offmode_c4,
                  filbuf_misbuf_ue_offmode_c5,filbuf_misbuf_ue_offmode_c52,
                  filbuf_misbuf_ue_offmode_c6}),
            .scan_in(ff_filbuf_misbuf_ue_offmode_scanin),
            .scan_out(ff_filbuf_misbuf_ue_offmode_scanout),
            .l1clk(l1clk), 
            .dout({filbuf_misbuf_ue_offmode_c4,filbuf_misbuf_ue_offmode_c5,
                  filbuf_misbuf_ue_offmode_c52,filbuf_misbuf_ue_offmode_c6,
                  filbuf_misbuf_ue_offmode_c7}),
  .siclk(siclk),
  .soclk(soclk));

l2t_filbuf_ctl_msff_ctl_macro__width_5 ff_filbuf_misbuf_ce_offmode 
           (.din({filbuf_misbuf_ce_offmode_c3,filbuf_misbuf_ce_offmode_c4,
                  filbuf_misbuf_ce_offmode_c5,filbuf_misbuf_ce_offmode_c52,
                  filbuf_misbuf_ce_offmode_c6}),
            .scan_in(ff_filbuf_misbuf_ce_offmode_scanin),
            .scan_out(ff_filbuf_misbuf_ce_offmode_scanout),
            .l1clk(l1clk), 
            .dout({filbuf_misbuf_ce_offmode_c4,filbuf_misbuf_ce_offmode_c5,
                  filbuf_misbuf_ce_offmode_c52,filbuf_misbuf_ce_offmode_c6,
                  filbuf_misbuf_ce_offmode_c7}),
  .siclk(siclk),
  .soclk(soclk));

 
////////////////////////// 
// Error during a FIll:  
// Reported to the CSR block. 
// 
// The fb_cerr/fb_uerr bits are  
// cleared by a fill or a HIT 
// except for a wr8 hit. 
//  
// However, a filbuf_corr err 
// or filbuf_uncorr_err is  
// signalled only for a fill. 
// 
////////////////////////// 
 

assign  filbuf_corr_err_c3 = |( dec_fill_entry_c3 & fb_cerr )  ; 
assign  filbuf_uncorr_err_c3 = |( dec_fill_entry_c3 & fb_uerr )   ; 

 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_filbuf_corr_err_c4 
                           (.din(filbuf_corr_err_c3), .l1clk(l1clk), 
                                .scan_in(ff_filbuf_corr_err_c4_scanin),
                                .scan_out(ff_filbuf_corr_err_c4_scanout),
                                .dout(filbuf_corr_err_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_filbuf_corr_err_c5 
                           (.din(filbuf_corr_err_c4), .l1clk(l1clk), 
                                .scan_in(ff_filbuf_corr_err_c5_scanin),
                                .scan_out(ff_filbuf_corr_err_c5_scanout),
                                .dout(filbuf_corr_err_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
// BS 03/11/04 extra cycle for mem access

l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_filbuf_corr_err_c52 
                           (.din(filbuf_corr_err_c5), .l1clk(l1clk),
                                .scan_in(ff_filbuf_corr_err_c52_scanin),
                                .scan_out(ff_filbuf_corr_err_c52_scanout),
                                .dout(filbuf_corr_err_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_filbuf_corr_err_c6 
                           (.din(filbuf_corr_err_c52), .l1clk(l1clk), 
                                .scan_in(ff_filbuf_corr_err_c6_scanin),
                                .scan_out(ff_filbuf_corr_err_c6_scanout),
                                .dout(filbuf_corr_err_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_filbuf_corr_err_c7 
                           (.din(filbuf_corr_err_c6), .l1clk(l1clk), 
                                .scan_in(ff_filbuf_corr_err_c7_scanin),
                                .scan_out(ff_filbuf_corr_err_c7_scanout),
                                .dout(filbuf_corr_err_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_filbuf_corr_err_c8 
                           (.din(filbuf_corr_err_c7), .l1clk(l1clk), 
                                .scan_in(ff_filbuf_corr_err_c8_scanin),
                                .scan_out(ff_filbuf_corr_err_c8_scanout),
                                .dout(filbuf_corr_err_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_filbuf_uncorr_err_c4 
                           (.din(filbuf_uncorr_err_c3), .l1clk(l1clk), 
                              .scan_in(ff_filbuf_uncorr_err_c4_scanin),
                              .scan_out(ff_filbuf_uncorr_err_c4_scanout),
                              .dout(filbuf_uncorr_err_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_filbuf_uncorr_err_c5 
                           (.din(filbuf_uncorr_err_c4), .l1clk(l1clk), 
                              .scan_in(ff_filbuf_uncorr_err_c5_scanin),
                              .scan_out(ff_filbuf_uncorr_err_c5_scanout),
                              .dout(filbuf_uncorr_err_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_filbuf_uncorr_err_c52 
                           (.din(filbuf_uncorr_err_c5), .l1clk(l1clk),
                              .scan_in(ff_filbuf_uncorr_err_c52_scanin),
                              .scan_out(ff_filbuf_uncorr_err_c52_scanout),
                              .dout(filbuf_uncorr_err_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_filbuf_uncorr_err_c6 
                           (.din(filbuf_uncorr_err_c52), .l1clk(l1clk), 
                              .scan_in(ff_filbuf_uncorr_err_c6_scanin),
                              .scan_out(ff_filbuf_uncorr_err_c6_scanout),
                              .dout(filbuf_uncorr_err_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_filbuf_uncorr_err_c7 
                           (.din(filbuf_uncorr_err_c6), .l1clk(l1clk), 
                              .scan_in(ff_filbuf_uncorr_err_c7_scanin),
                              .scan_out(ff_filbuf_uncorr_err_c7_scanout),
                              .dout(filbuf_uncorr_err_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_filbuf_uncorr_err_c8 
                           (.din(filbuf_uncorr_err_c7), .l1clk(l1clk), 
                              .scan_in(ff_filbuf_uncorr_err_c8_scanin),
                              .scan_out(ff_filbuf_uncorr_err_c8_scanout),
                              .dout(filbuf_uncorr_err_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
/////////////////////////// 
// Error During a Hit. 
// Sent to the decc block 
/////////////////////////// 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_filbuf_hit_c3 
                           (.din(filbuf_hit_c2), .l1clk(l1clk), 
                              .scan_in(ff_filbuf_hit_c3_scanin),
                              .scan_out(ff_filbuf_hit_c3_scanout),
                              .dout(filbuf_hit_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_filbuf_hit_c4 
                           (.din(filbuf_hit_c3), .l1clk(l1clk), 
                              .scan_in(ff_filbuf_hit_c4_scanin),
                              .scan_out(ff_filbuf_hit_c4_scanout),
                              .dout(filbuf_hit_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_imiss_inst_c3 
                           (.din(arb_decdp_imiss_inst_c2), .l1clk(l1clk), 
                              .scan_in(ff_imiss_inst_c3_scanin),
                              .scan_out(ff_imiss_inst_c3_scanout),
                              .dout(imiss_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_imiss_inst_c4 
                           (.din(imiss_inst_c3), .l1clk(l1clk), 
                              .scan_in(ff_imiss_inst_c4_scanin),
                              .scan_out(ff_imiss_inst_c4_scanout),
                              .dout(imiss_inst_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_ld64_inst_c3 
                           (.din(arb_decdp_ld64_inst_c2), .l1clk(l1clk), 
                              .scan_in(ff_ld64_inst_c3_scanin),
                              .scan_out(ff_ld64_inst_c3_scanout),
                              .dout(ld64_inst_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign  spc_rd_vld_c3  = (filbuf_hit_c3 & tag_spc_rd_cond_c3) | // any read of the Fill buffer.( other than rdma inst) 
							    // should cause spc_rd_vld_c3 to go high. 
                        ( filbuf_hit_c4 & imiss_inst_c4 ) ; 
 
 
 
 
//////////////////////////// 
// sparc read 
//////////////////////////// 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_spc_rd_vld_c4 
                           (.din(spc_rd_vld_c3), .l1clk(l1clk), 
                              .scan_in(ff_spc_rd_vld_c4_scanin),
                              .scan_out(ff_spc_rd_vld_c4_scanout),
                              .dout(spc_rd_vld_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_spc_rd_vld_c5 
                           (.din(spc_rd_vld_c4), .l1clk(l1clk), 
                              .scan_in(ff_spc_rd_vld_c5_scanin),
                              .scan_out(ff_spc_rd_vld_c5_scanout),
                              .dout(spc_rd_vld_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_spc_rd_vld_c52 
                           (.din(spc_rd_vld_c5), .l1clk(l1clk),
                              .scan_in(ff_spc_rd_vld_c52_scanin),
                              .scan_out(ff_spc_rd_vld_c52_scanout),
                              .dout(spc_rd_vld_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_spc_rd_vld_c6 
                           (.din(spc_rd_vld_c52), .l1clk(l1clk), 
                              .scan_in(ff_spc_rd_vld_c6_scanin),
                              .scan_out(ff_spc_rd_vld_c6_scanout),
                              .dout(spc_rd_vld_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
//msff_ctl_macro ff_spc_rd_vld_c7 (width=1)
//                           (.din(spc_rd_vld_c6), .l1clk(l1clk), 
//                              .scan_in(ff_spc_rd_vld_c7_scanin),
//                              .scan_out(ff_spc_rd_vld_c7_scanout),
//                              .dout(spc_rd_vld_c7),  
//); 
 
assign  filbuf_spc_rd_vld_c6 = spc_rd_vld_c6 ; 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_fbcerr0_d1 
                           (.din(fb_cerr[0]), .l1clk(l1clk), 
                .scan_in(ff_fbcerr0_d1_scanin),
                .scan_out(ff_fbcerr0_d1_scanout),
                .dout(fbcerr0_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_fbuerr0_d1 
                           (.din(fb_uerr[0]), .l1clk(l1clk), 
                .scan_in(ff_fbuerr0_d1_scanin),
                .scan_out(ff_fbuerr0_d1_scanout),
                .dout(fbuerr0_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// In the OFF mode, fb_cerr & fb_uerr are reset in the C2 cycle of  
// a hit. Hence they are unavailable for setting fbhit_cerr_err_c3 & 
// fbhit_uerr_err_c3. This problem can be solved by flopping fb_cerr_0 and 
// fb_uerr_0 and using them in the L2 off mode for flagging errors. 
// 
 
assign  fbhit_cerr_err_c3 = (|( fb_hit_vec_c3 & fb_cerr ) |  
				(fb_hit_vec_c3[0] & fbcerr0_d1 & l2_bypass_mode_on_d1)) 
				 & qual_hit_vec_c3 ; 
assign  fbhit_uerr_err_c3 = (|( fb_hit_vec_c3 & fb_uerr ) |  
				(fb_hit_vec_c3[0] & fbuerr0_d1 & l2_bypass_mode_on_d1)) 
				 & qual_hit_vec_c3 ; 
 
 
assign  spc_corr_err_c3 = fbhit_cerr_err_c3 & 
                                spc_rd_vld_c3 ; // the first packet of 
                                                  // an imiss will clear 
                                                  // the cerr bit. 
 
assign  spc_uncorr_err_c3 = fbhit_uerr_err_c3 & 
                                spc_rd_vld_c3 ; // the first packet of 
                                                  // an imiss will clear 
                                                  // the uerr bit. 
//////////////////////////// 
// sparc corr err 
//////////////////////////// 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_spc_corr_err_c4 
                           (.din(spc_corr_err_c3), .l1clk(l1clk), 
                                .scan_in(ff_spc_corr_err_c4_scanin),
                                .scan_out(ff_spc_corr_err_c4_scanout),
                                .dout(spc_corr_err_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_spc_corr_err_c5 
                           (.din(spc_corr_err_c4), .l1clk(l1clk), 
                                .scan_in(ff_spc_corr_err_c5_scanin),
                                .scan_out(ff_spc_corr_err_c5_scanout),
                                .dout(spc_corr_err_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
// BS 03/11/04 extra cycle for mem access
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_spc_corr_err_c52 
                           (.din(spc_corr_err_c5), .l1clk(l1clk),
                                .scan_in(ff_spc_corr_err_c52_scanin),
                                .scan_out(ff_spc_corr_err_c52_scanout),
                                .dout(spc_corr_err_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_spc_corr_err_c6 
                           (.din(spc_corr_err_c52), .l1clk(l1clk), 
                                .scan_in(ff_spc_corr_err_c6_scanin),
                                .scan_out(ff_spc_corr_err_c6_scanout),
                                .dout(spc_corr_err_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
//msff_ctl_macro ff_spc_corr_err_c7 (width=1)
//                           (.din(spc_corr_err_c6), .l1clk(l1clk), 
//                                .scan_in(ff_spc_corr_err_c7_scanin),
//                                .scan_out(ff_spc_corr_err_c7_scanout),
//                                .dout(spc_corr_err_c7),  
//); 
 
assign  filbuf_spc_corr_err_c6 = spc_corr_err_c6 ; 
 
//////////////////////////// 
// sparc uncorr err 
//////////////////////////// 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_spc_uncorr_err_c4 
                           (.din(spc_uncorr_err_c3), .l1clk(l1clk), 
                                .scan_in(ff_spc_uncorr_err_c4_scanin),
                                .scan_out(ff_spc_uncorr_err_c4_scanout),
                                .dout(spc_uncorr_err_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_spc_uncorr_err_c5 
                           (.din(spc_uncorr_err_c4), .l1clk(l1clk), 
                                .scan_in(ff_spc_uncorr_err_c5_scanin),
                                .scan_out(ff_spc_uncorr_err_c5_scanout),
                                .dout(spc_uncorr_err_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
// BS 03/11/04 extra cycle for mem access
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_spc_uncorr_err_c52 
                           (.din(spc_uncorr_err_c5), .l1clk(l1clk),
                                .scan_in(ff_spc_uncorr_err_c52_scanin),
                                .scan_out(ff_spc_uncorr_err_c52_scanout),
                                .dout(spc_uncorr_err_c52),
  .siclk(siclk),
  .soclk(soclk)  
);
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_spc_uncorr_err_c6 
                           (.din(spc_uncorr_err_c52), .l1clk(l1clk), 
                                .scan_in(ff_spc_uncorr_err_c6_scanin),
                                .scan_out(ff_spc_uncorr_err_c6_scanout),
                                .dout(spc_uncorr_err_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
//msff_ctl_macro ff_spc_uncorr_err_c7 (width=1)
//                           (.din(spc_uncorr_err_c6), .l1clk(l1clk), 
//                                .scan_in(ff_spc_uncorr_err_c7_scanin),
//                                .scan_out(ff_spc_uncorr_err_c7_scanout),
//                                .dout(spc_uncorr_err_c7),  
//); 
 
assign  filbuf_spc_uncorr_err_c6 = spc_uncorr_err_c6 ; 
 
//////////////////////////// 
// bsc corr err 
//////////////////////////// 
 
assign  bsc_corr_err_c3 =  ( filbuf_hit_c3 & ld64_inst_c3 ) & 
                                fbhit_cerr_err_c3 ; 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_bsc_corr_err_c4 
                           (.din(bsc_corr_err_c3), .l1clk(l1clk), 
                                .scan_in(ff_bsc_corr_err_c4_scanin),
                                .scan_out(ff_bsc_corr_err_c4_scanout),
                                .dout(bsc_corr_err_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_bsc_corr_err_c5 
                           (.din(bsc_corr_err_c4), .l1clk(l1clk), 
                                .scan_in(ff_bsc_corr_err_c5_scanin),
                                .scan_out(ff_bsc_corr_err_c5_scanout),
                                .dout(bsc_corr_err_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
// BS 03/11/04 extra cycle for mem access

l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_bsc_corr_err_c52 
                           (.din(bsc_corr_err_c5), .l1clk(l1clk),
                                .scan_in(ff_bsc_corr_err_c52_scanin),
                                .scan_out(ff_bsc_corr_err_c52_scanout),
                                .dout(bsc_corr_err_c52),
  .siclk(siclk),
  .soclk(soclk)  
);
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_bsc_corr_err_c6 
                           (.din(bsc_corr_err_c52), .l1clk(l1clk), 
                                .scan_in(ff_bsc_corr_err_c6_scanin),
                                .scan_out(ff_bsc_corr_err_c6_scanout),
                                .dout(bsc_corr_err_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_bsc_corr_err_c7 
                           (.din(bsc_corr_err_c6), .l1clk(l1clk), 
                                .scan_in(ff_bsc_corr_err_c7_scanin),
                                .scan_out(ff_bsc_corr_err_c7_scanout),
                                .dout(bsc_corr_err_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_bsc_corr_err_c8 
                           (.din(bsc_corr_err_c7), .l1clk(l1clk), 
                                .scan_in(ff_bsc_corr_err_c8_scanin),
                                .scan_out(ff_bsc_corr_err_c8_scanout),
                                .dout(bsc_corr_err_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_bsc_corr_err_c9 
                           (.din(bsc_corr_err_c8), .l1clk(l1clk), 
                                .scan_in(ff_bsc_corr_err_c9_scanin),
                                .scan_out(ff_bsc_corr_err_c9_scanout),
                                .dout(bsc_corr_err_c9),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_bsc_corr_err_c10 
                           (.din(bsc_corr_err_c9), .l1clk(l1clk), 
                                .scan_in(ff_bsc_corr_err_c10_scanin),
                                .scan_out(ff_bsc_corr_err_c10_scanout),
                                .dout(bsc_corr_err_c10),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_bsc_corr_err_c11 
                           (.din(bsc_corr_err_c10), .l1clk(l1clk), 
                                .scan_in(ff_bsc_corr_err_c11_scanin),
                                .scan_out(ff_bsc_corr_err_c11_scanout),
                                .dout(bsc_corr_err_c11),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_bsc_corr_err_c12 
                           (.din(bsc_corr_err_c11), .l1clk(l1clk), 
                                .scan_in(ff_bsc_corr_err_c12_scanin),
                                .scan_out(ff_bsc_corr_err_c12_scanout),
                                .dout(bsc_corr_err_c12),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign  filbuf_bsc_corr_err_c12 = bsc_corr_err_c12 ; 
 
 
//////////////////////////// 
// ld64 fb hit c12 
//////////////////////////// 
 
 
assign  ld64_fb_hit_c3 = (filbuf_hit_c3 & ld64_inst_c3) ; 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_ld64_fb_hit_c4 
                           (.din(ld64_fb_hit_c3), .l1clk(l1clk), 
                                .scan_in(ff_ld64_fb_hit_c4_scanin),
                                .scan_out(ff_ld64_fb_hit_c4_scanout),
                                .dout(ld64_fb_hit_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_ld64_fb_hit_c5 
                           (.din(ld64_fb_hit_c4), .l1clk(l1clk), 
                                .scan_in(ff_ld64_fb_hit_c5_scanin),
                                .scan_out(ff_ld64_fb_hit_c5_scanout),
                                .dout(ld64_fb_hit_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 
// BS 03/11/04 extra cycle for mem access

l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_ld64_fb_hit_c52 
                           (.din(ld64_fb_hit_c5), .l1clk(l1clk),
                                .scan_in(ff_ld64_fb_hit_c52_scanin),
                                .scan_out(ff_ld64_fb_hit_c52_scanout),
                                .dout(ld64_fb_hit_c52),
  .siclk(siclk),
  .soclk(soclk)  
);
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_ld64_fb_hit_c6 
                           (.din(ld64_fb_hit_c52), .l1clk(l1clk), 
                                .scan_in(ff_ld64_fb_hit_c6_scanin),
                                .scan_out(ff_ld64_fb_hit_c6_scanout),
                                .dout(ld64_fb_hit_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_ld64_fb_hit_c7 
                           (.din(ld64_fb_hit_c6), .l1clk(l1clk), 
                                .scan_in(ff_ld64_fb_hit_c7_scanin),
                                .scan_out(ff_ld64_fb_hit_c7_scanout),
                                .dout(ld64_fb_hit_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_ld64_fb_hit_c8 
                           (.din(ld64_fb_hit_c7), .l1clk(l1clk), 
                                .scan_in(ff_ld64_fb_hit_c8_scanin),
                                .scan_out(ff_ld64_fb_hit_c8_scanout),
                                .dout(ld64_fb_hit_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_ld64_fb_hit_c9 
                           (.din(ld64_fb_hit_c8), .l1clk(l1clk), 
                                .scan_in(ff_ld64_fb_hit_c9_scanin),
                                .scan_out(ff_ld64_fb_hit_c9_scanout),
                                .dout(ld64_fb_hit_c9),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_ld64_fb_hit_c10 
                           (.din(ld64_fb_hit_c9), .l1clk(l1clk), 
                                .scan_in(ff_ld64_fb_hit_c10_scanin),
                                .scan_out(ff_ld64_fb_hit_c10_scanout),
                                .dout(ld64_fb_hit_c10),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_ld64_fb_hit_c11 
                           (.din(ld64_fb_hit_c10), .l1clk(l1clk), 
                                .scan_in(ff_ld64_fb_hit_c11_scanin),
                                .scan_out(ff_ld64_fb_hit_c11_scanout),
                                .dout(ld64_fb_hit_c11),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__en_1__width_1 ff_ld64_fb_hit_c12 
                           (.din(ld64_fb_hit_c11), .l1clk(l1clk), 
                                    .scan_in(ff_ld64_fb_hit_c12_scanin),
                                    .scan_out(ff_ld64_fb_hit_c12_scanout),
                                    .en(tag_rd64_complete_c11), 
                                .dout(ld64_fb_hit_c12),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign  filbuf_ld64_fb_hit_c12 = ld64_fb_hit_c12; 
 
 
 
 
 
////////////////////////////////////////////////////////////////////////////////// 
// Asynchronous errors : 
// Errors due to the following cases are reported as disrupting erross 
// * eviction C and U 
// * l2 scrub. C and U 
// * mcu scrub C and U 
// * tag error.	C only 
// * vuad error. C only
// 
////////////////////////////////////////////////////////////////////////////////// 
 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_mcu_scb_mecc_err_d1 
                           (.din(mcu_l2t_scb_mecc_err), .l1clk(l1clk), 
                        .scan_in(ff_mcu_scb_mecc_err_d1_scanin),
                        .scan_out(ff_mcu_scb_mecc_err_d1_scanout),
                        .dout(filbuf_mcu_scb_mecc_err_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_mcu_scb_secc_err_d1 
                           (.din(mcu_l2t_scb_secc_err), .l1clk(l1clk), 
                        .scan_in(ff_mcu_scb_secc_err_d1_scanin),
                        .scan_out(ff_mcu_scb_secc_err_d1_scanout),
                        .dout(filbuf_mcu_scb_secc_err_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
////////////// 
// UERR PEND 
// 
// POST_2.0 conditions: 
// 
// If an error is encountered while performing  
// the read part of a partial wr8. the error is 
// recorded in the miss buffer and then registered 
// as a pending error in filbuf . An ERROR indication 
// is sent to the "steering sparc" on a FILL. 
// 
////////////////////////////////////////////////////////// 
 
 
assign	uerr_ack_c4 = tag_uerr_ack_tmp_c4 & wr8_inst_c4 ; 
 
assign  fb_uerr_pend_set =     rdmat_ev_uerr_r6 |	// eviction 
		uerr_ack_c4 |  
                filbuf_mcu_scb_mecc_err_d1 | // mcu scrub err 
                deccck_scrd_uncorr_err_c8 | // l2 scrub err. 
		rdmat_rdmard_uerr_c12 | // Ld64 error 
                (rdmat_rdmard_notdata_c12 & filbuf_ld64_fb_hit_c12) | // Ld64 Notdata error
		(deccck_bscd_uncorr_err_c8 & misbuf_vuad_ce_err_c8); // WR8 uncorr error in ON mode only if VUAD CE detected. 

 
assign  fb_uerr_pend_reset = (~fb_uerr_pend_set & fill_vld_c3 ); 
 
assign  fb_uerr_pend_in = ( fb_uerr_pend_set | fb_uerr_pend ) 
                                & ~fb_uerr_pend_reset ; 
 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__width_1 ff_fb_uerr_pend  // sync reset active low
                           (.din(fb_uerr_pend_in), .l1clk(l1clk),.clr(~dbb_rst_l), 
                        .scan_in(ff_fb_uerr_pend_scanin),
                        .scan_out(ff_fb_uerr_pend_scanout),
                        .dout(fb_uerr_pend),
  .siclk(siclk),
  .soclk(soclk)  
); 
///////////////////////////////////////////////////////////////////////////////////////////////
//      Not data pending ueerr bit
///////////////////////////////////////////////////////////////////////////////////////////////


assign fb_nduerr_pend_set =  (rdmat_rdmard_notdata_c12 & ~l2_bypass_mode_on_d1 & ~filbuf_ld64_fb_hit_c12)
                             | // Ld64 Notdata error
			     deccck_bscd_notdata_err_c8 ; // WR8 notdata error in ON mode only

assign fb_nduerr_pend_reset = (~fb_nduerr_pend_set & fill_vld_c3 );

assign  fb_nduerr_pend_in = ( fb_nduerr_pend_set | fb_nduerr_pend )
                                & ~fb_nduerr_pend_reset ;

l2t_filbuf_ctl_msff_ctl_macro__clr_1__width_1 ff_fb_nduerr_pend  // sync reset active low
        (
	.scan_in(ff_fb_nduerr_pend_scanin),
	.scan_out(ff_fb_nduerr_pend_scanout),
	.din(fb_nduerr_pend_in), 
	.l1clk(l1clk),
	.clr(~dbb_rst_l),
        .dout(fb_nduerr_pend),
  .siclk(siclk),
  .soclk(soclk)
	);


			




 
////////////// 
// CERR PEND 
////////////// 
assign	cerr_ack_c4 = tag_cerr_ack_tmp_c4 & wr8_inst_c4 ; 
/////////////////////////////////////
// Bud id 93653 fix 
//assign  fb_cerr_pend_set =     rdmat_ev_cerr_r6 |	// eviction 
//			cerr_ack_c4 |  
//                        filbuf_mcu_scb_secc_err_d1 | // mcu scrub err 
//			tagdp_tag_error_c8 | // Tag parity Error  
//                        misbuf_vuad_ce_err_c8 | // vuad SBE
//                        deccck_scrd_corr_err_c8 | // l2 scrub err. 
//			rdmat_rdmard_cerr_c12 | // Ld 64 error. for LDRC 
//			rdmat_rdmard_notdata_c12 | // Ld64 Notdata error
//			filbuf_bsc_corr_err_c12 | // ld 64 error for DRC 
//			deccck_bscd_notdata_err_c8 | // WR8 notdata error in ON mode only
//			deccck_bscd_corr_err_c8 ; // Wr8 corr error in L2 ON mode only 
// If the rdma load 64 hits filbuf means that this was a miss and hence should
// not report notdata but should report UE.

assign  fb_cerr_pend_set =     rdmat_ev_cerr_r6 |     // eviction
                      cerr_ack_c4 |
                      filbuf_mcu_scb_secc_err_d1 | // mcu scrub err
                      tagdp_tag_error_c8 | // Tag parity Error
                      misbuf_vuad_ce_err_c8 | // vuad SBE
                      deccck_scrd_corr_err_c8 | // l2 scrub err.
                      rdmat_rdmard_cerr_c12 | // Ld 64 error. for LDRC
                      filbuf_bsc_corr_err_c12 | // ld 64 error for DRC
                      deccck_bscd_corr_err_c8 ; // Wr8 corr error in L2 ON mode only

assign  fb_cerr_pend_reset = (~fb_cerr_pend_set & fill_vld_c3 ); 
assign  fb_cerr_pend_in = ( fb_cerr_pend_set | fb_cerr_pend ) & ~fb_cerr_pend_reset ; 
 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__width_1 ff_fb_cerr_pend  // sync reset active low
        (
	.scan_in(ff_fb_cerr_pend_scanin),
	.scan_out(ff_fb_cerr_pend_scanout),
	.din(fb_cerr_pend_in), 
	.l1clk(l1clk),
	.clr(~dbb_rst_l), 
        .dout(fb_cerr_pend),
  .siclk(siclk),
  .soclk(soclk)  
	); 
///////////////////////////////////////////////////////////////////////////////////////////////
//	Not data cerr err bit reported
///////////////////////////////////////////////////////////////////////////////////////////////
assign fb_ndcerr_pend_set = deccck_bscd_notdata_err_c8 | // WR8 notdata error in ON mode only
                (rdmat_rdmard_notdata_c12 & ~l2_bypass_mode_on_d1 & ~filbuf_ld64_fb_hit_c12); // Ld64 Notdata error

assign fb_ndcerr_pend_reset = ~fb_ndcerr_pend_set & fill_vld_c3;

assign fb_ndcerr_pend_in  = (fb_ndcerr_pend_set | fb_ndcerr_pend) & ~fb_ndcerr_pend_reset;

l2t_filbuf_ctl_msff_ctl_macro__clr_1__width_1 ff_fb_ndcerr_pend  // sync reset active low
        (
        .scan_in(ff_fb_ndcerr_pend_scanin),
        .scan_out(ff_fb_ndcerr_pend_scanout),
        .din( fb_ndcerr_pend_in), 
        .l1clk(l1clk),
        .clr(~dbb_rst_l),
        .dout( fb_ndcerr_pend),
  .siclk(siclk),
  .soclk(soclk)  
        );

///////////////////////////////////////////////////////////////////////////////////////////////

/////////////// 
// 
// A Disrupting error is sent to the Thread and  
// Core pointed to by the steering control fields in the 
// L2 control register. 
// 
// A disrupting error is sent under the following conditions. 
// - A fill when the fb_?err bit is still set. 
// - A Fill occurring after any of the following errors happen 
//  1. eviction 
//  2. scrub err from mcu. 
//  3. l2 scrub error. 
//  4. rdma rd error. 
//  5. err while performing the rd part of a Wr8 inst. 
//  6. Tag ecc error. 
//  7. VUAD SBE
//  
/////////////// 
 
assign  filbuf_dis_cerr_c3  =  filbuf_corr_err_c3 | // bypass operation
                        ( fill_vld_c3 & fb_cerr_pend ) ; // Fill operation

assign  filbuf_dis_uerr_c3  =  filbuf_uncorr_err_c3 |
                        ( fill_vld_c3 & fb_uerr_pend ) ;

assign filbuf_dis_nderr_c3[1] = (fill_vld_c3 &  fb_nduerr_pend);
assign filbuf_dis_nderr_c3[0] = (fill_vld_c3 &  fb_ndcerr_pend);

 
////////////////////////////////////////////////////////////// 
// SCRUB / TECC:  
// The tecc bit 
// in filbuf is used to get a scrub started. 
// Reset in the C1 cycle of a FILL. 
/////////////////////////////////////////////////////////////// 
 
 
assign  fb_tecc_pend_set = csr_filbuf_scrub_ready ; 
 
assign  fb_tecc_pend_reset = ( ~csr_filbuf_scrub_ready & fb_tecc_pend_d1 &  arb_filbuf_fbsel_c1 ); 
 
assign  fb_tecc_pend_in = ( fb_tecc_pend_set | fb_tecc_pend ) & ~fb_tecc_pend_reset ; 
 
l2t_filbuf_ctl_msff_ctl_macro__clr_1__width_1 ff_fb_tecc_pend  // sync reset active low
                           (.din(fb_tecc_pend_in), .l1clk(l1clk),.clr(~dbb_rst_l), 
                                .scan_in(ff_fb_tecc_pend_scanin),
                                .scan_out(ff_fb_tecc_pend_scanout),
                                .dout(fb_tecc_pend),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_filbuf_ctl_msff_ctl_macro__width_1 ff_fb_tecc_pend_d1 
                           (.din(fb_tecc_pend), .l1clk(l1clk), 
                                .scan_in(ff_fb_tecc_pend_d1_scanin),
                                .scan_out(ff_fb_tecc_pend_d1_scanout),
                                .dout(fb_tecc_pend_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign  filbuf_arbdp_tecc_px2  = fb_tecc_pend ; 

// BS and SR 12/18/03, LRU way from Filbuf needs to be written to Dir on a Load Miss
// during the replay phase of the load .
// We pick the way based on fb_hit_vec_c3
//
//mux_ctl_macro mux_filbuf_tag_evict_way_c3 (width=4,ports=8,mux=pgnpe)
//                (
//		  .dout (filbuf_tag_evict_way_c3[3:0]),
//                  .din0(way0[3:0]),.din1(way1[3:0]),
//                  .din2(way2[3:0]),.din3(way3[3:0]),
//                  .din4(way4[3:0]),.din5(way5[3:0]),
//                  .din6(way6[3:0]),.din7(way7[3:0]),
//                  .sel0(fb_hit_vec_c3[0]), 
//		  .sel1(fb_hit_vec_c3[1]),
//                  .sel2(fb_hit_vec_c3[2]), 
//		  .sel3(fb_hit_vec_c3[3]),
//                  .sel4(fb_hit_vec_c3[4]), 
//		  .sel5(fb_hit_vec_c3[5]),
//                  .sel6(fb_hit_vec_c3[6]), 
//		  .sel7(fb_hit_vec_c3[7])
//		);
//


always@(way0 or way1 or way2 or way3 or way4 or way5 or way6 or way7 or fb_hit_vec_c3) 
begin
case(fb_hit_vec_c3)  // synopsys parallel_case full_case
8'b00000001 	:	filbuf_tag_evict_way_c3[3:0] = way0[3:0];
8'b00000010 	:	filbuf_tag_evict_way_c3[3:0] = way1[3:0];
8'b00000100 	:	filbuf_tag_evict_way_c3[3:0] = way2[3:0];
8'b00001000 	:	filbuf_tag_evict_way_c3[3:0] = way3[3:0];
8'b00010000 	:	filbuf_tag_evict_way_c3[3:0] = way4[3:0];
8'b00100000 	:	filbuf_tag_evict_way_c3[3:0] = way5[3:0];
8'b01000000 	:	filbuf_tag_evict_way_c3[3:0] = way6[3:0];
8'b10000000 	:	filbuf_tag_evict_way_c3[3:0] = way7[3:0];
default		:	filbuf_tag_evict_way_c3[3:0] = 4'b0;
endcase
end


 
// fixscan start:
assign spares_scanin             = scan_in                  ;
assign reset_flop_scanin         = spares_scanout           ;
assign ff_mcu_pick_d1_scanin     = reset_flop_scanout       ;
assign ff_l2t_mb2_run_r1_scanin  = ff_mcu_pick_d1_scanout   ;
assign ff_filbuf_misbuf_fbid_d2_scanin = ff_l2t_mb2_run_r1_scanout;
assign ff_fill_vld_c3_scanin     = ff_filbuf_misbuf_fbid_d2_scanout;
assign ff_l2_bypass_mode_on_scanin = ff_fill_vld_c3_scanout   ;
assign ff_l2_dir_map_on_d1_scanin = ff_l2_bypass_mode_on_scanout;
assign ff_rdma_inst_c2_scanin    = ff_l2_dir_map_on_d1_scanout;
assign ff_arb_filbuf_inst_vld_c2_scanin = ff_rdma_inst_c2_scanout  ;
assign ff_fb_set_valid_d2_scanin = ff_arb_filbuf_inst_vld_c2_scanout;
assign ff_valid_bit_scanin       = ff_fb_set_valid_d2_scanout;
assign ff_fb_count_scanin        = ff_valid_bit_scanout     ;
assign ff_rqtyp_d2_scanin        = ff_fb_count_scanout      ;
assign ff_snp_d2_scanin          = ff_rqtyp_d2_scanout      ;
assign ff_stinst_0_scanin        = ff_snp_d2_scanout        ;
assign ff_stinst_1_scanin        = ff_stinst_0_scanout      ;
assign ff_stinst_2_scanin        = ff_stinst_1_scanout      ;
assign ff_stinst_3_scanin        = ff_stinst_2_scanout      ;
assign ff_stinst_4_scanin        = ff_stinst_3_scanout      ;
assign ff_stinst_5_scanin        = ff_stinst_4_scanout      ;
assign ff_stinst_6_scanin        = ff_stinst_5_scanout      ;
assign ff_stinst_7_scanin        = ff_stinst_6_scanout      ;
assign ff_nofill_0_scanin        = ff_stinst_7_scanout      ;
assign ff_nofill_1_scanin        = ff_nofill_0_scanout      ;
assign ff_nofill_2_scanin        = ff_nofill_1_scanout      ;
assign ff_nofill_3_scanin        = ff_nofill_2_scanout      ;
assign ff_nofill_4_scanin        = ff_nofill_3_scanout      ;
assign ff_nofill_5_scanin        = ff_nofill_4_scanout      ;
assign ff_nofill_6_scanin        = ff_nofill_5_scanout      ;
assign ff_nofill_7_scanin        = ff_nofill_6_scanout      ;
assign ff_fb_hit_off_c1_d1_scanin = ff_nofill_7_scanout      ;
assign ff_fb_cam_hit_vec_scanin  = ff_fb_hit_off_c1_d1_scanout;
assign ff_imiss_ld64_fb_hit_c3_scanin = ff_fb_cam_hit_vec_scanout;
assign ff_l2d_fb_hit_c3_scanin   = ff_imiss_ld64_fb_hit_c3_scanout;
assign ff_qual_hit_vec_c3_scanin = ff_l2d_fb_hit_c3_scanout ;
assign ff_qual_hit_vec_c4_scanin = ff_qual_hit_vec_c3_scanout;
assign ff_bypassed_scanin        = ff_qual_hit_vec_c4_scanout;
assign ff_fill_entry_num_c2_scanin = ff_bypassed_scanout      ;
assign ff_fill_entry_num_c3_scanin = ff_fill_entry_num_c2_scanout;
assign ff_inst_vld_c3_scanin     = ff_fill_entry_num_c3_scanout;
assign ff_misbuf_filbuf_fbid_d1_scanin = ff_inst_vld_c3_scanout   ;
assign ff_misbuf_filbuf_way_d1_scanin = ff_misbuf_filbuf_fbid_d1_scanout;
assign ff_misbuf_filbuf_way_vld_d1_scanin = ff_misbuf_filbuf_way_d1_scanout;
assign ff_way0_scanin            = ff_misbuf_filbuf_way_vld_d1_scanout;
assign ff_way1_scanin            = ff_way0_scanout          ;
assign ff_way2_scanin            = ff_way1_scanout          ;
assign ff_way3_scanin            = ff_way2_scanout          ;
assign ff_way4_scanin            = ff_way3_scanout          ;
assign ff_way5_scanin            = ff_way4_scanout          ;
assign ff_way6_scanin            = ff_way5_scanout          ;
assign ff_way7_scanin            = ff_way6_scanout          ;
assign ff_way_vld_scanin         = ff_way7_scanout          ;
assign ff_data_vld_r0_d1_scanin  = ff_way_vld_scanout       ;
assign ff_data_vld_r1_scanin     = ff_data_vld_r0_d1_scanout;
assign ff_mcu_l2t_chunk_id_r0_d1_scanin = ff_data_vld_r1_scanout   ;
assign ff_mcu_l2t_chunk_id_r1_scanin = ff_mcu_l2t_chunk_id_r0_d1_scanout;
assign ff_l2t_req_id_r0_d1_scanin = ff_mcu_l2t_chunk_id_r1_scanout;
assign ff_l2t_req_id_r1_scanin   = ff_l2t_req_id_r0_d1_scanout;
assign ff_mcu_cnt_scanin         = ff_l2t_req_id_r1_scanout ;
assign ff_cas1_inst_c3_scanin    = ff_mcu_cnt_scanout       ;
assign ff_cas1_inst_c4_scanin    = ff_cas1_inst_c3_scanout  ;
assign ff_fb_hit_vec_c3_scanin   = ff_cas1_inst_c4_scanout  ;
assign ff_fb_hit_vec_c4_scanin   = ff_fb_hit_vec_c3_scanout ;
assign ff_fb_l2_ready_scanin     = ff_fb_hit_vec_c4_scanout ;
assign ff_l2_pick_d1_scanin      = ff_fb_l2_ready_scanout   ;
assign ff_l2_wait_scanin         = ff_l2_pick_d1_scanout    ;
assign ff_l2_entry_px2_scanin    = ff_l2_wait_scanout       ;
assign ff_l2_way_px2_scanin      = ff_l2_entry_px2_scanout  ;
assign ff_mbf_entry_d2_scanin    = ff_l2_way_px2_scanout    ;
assign ff_mbid0_scanin           = ff_mbf_entry_d2_scanout  ;
assign ff_mbid1_scanin           = ff_mbid0_scanout         ;
assign ff_mbid2_scanin           = ff_mbid1_scanout         ;
assign ff_mbid3_scanin           = ff_mbid2_scanout         ;
assign ff_mbid4_scanin           = ff_mbid3_scanout         ;
assign ff_mbid5_scanin           = ff_mbid4_scanout         ;
assign ff_mbid6_scanin           = ff_mbid5_scanout         ;
assign ff_mbid7_scanin           = ff_mbid6_scanout         ;
assign ff_fill_complete_c4_scanin = ff_mbid7_scanout         ;
assign ff_fb_next_link_vld_scanin = ff_fill_complete_c4_scanout;
assign ff_enc_hit_vec_c3_scanin  = ff_fb_next_link_vld_scanout;
assign ff_fill_entry_c2_scanin   = ff_enc_hit_vec_c3_scanout;
assign ff_fill_entry_c3_scanin   = ff_fill_entry_c2_scanout ;
assign ff_l2_rd_state_scanin     = ff_fill_entry_c3_scanout ;
assign ff_l2_rd_state_quad0_scanin = ff_l2_rd_state_scanout   ;
assign ff_l2_rd_state_quad1_scanin = ff_l2_rd_state_quad0_scanout;
assign ff_l2_rd_ptr_scanin       = ff_l2_rd_state_quad1_scanout;
assign ff_secc_err_r3_scanin     = ff_l2_rd_ptr_scanout     ;
assign ff_mecc_err_r3_scanin     = ff_secc_err_r3_scanout   ;
assign ff_data_vld_r2_scanin     = ff_mecc_err_r3_scanout   ;
assign ff_data_vld_r3_scanin     = ff_data_vld_r2_scanout   ;
assign ff_mcu_rd_req_id_r2_scanin = ff_data_vld_r3_scanout   ;
assign ff_mcu_rd_req_id_r3_scanin = ff_mcu_rd_req_id_r2_scanout;
assign ff_wr8_inst_c3_scanin     = ff_mcu_rd_req_id_r3_scanout;
assign ff_wr8_inst_c4_scanin     = ff_wr8_inst_c3_scanout   ;
assign ff_fb_cerr_scanin         = ff_wr8_inst_c4_scanout   ;
assign ff_fb_uerr_scanin         = ff_fb_cerr_scanout       ;
assign ff_filbuf_misbuf_ue_offmode_scanin = ff_fb_uerr_scanout       ;
assign ff_filbuf_misbuf_ce_offmode_scanin = ff_filbuf_misbuf_ue_offmode_scanout;
assign ff_filbuf_corr_err_c4_scanin = ff_filbuf_misbuf_ce_offmode_scanout;
assign ff_filbuf_corr_err_c5_scanin = ff_filbuf_corr_err_c4_scanout;
assign ff_filbuf_corr_err_c52_scanin = ff_filbuf_corr_err_c5_scanout;
assign ff_filbuf_corr_err_c6_scanin = ff_filbuf_corr_err_c52_scanout;
assign ff_filbuf_corr_err_c7_scanin = ff_filbuf_corr_err_c6_scanout;
assign ff_filbuf_corr_err_c8_scanin = ff_filbuf_corr_err_c7_scanout;
assign ff_filbuf_uncorr_err_c4_scanin = ff_filbuf_corr_err_c8_scanout;
assign ff_filbuf_uncorr_err_c5_scanin = ff_filbuf_uncorr_err_c4_scanout;
assign ff_filbuf_uncorr_err_c52_scanin = ff_filbuf_uncorr_err_c5_scanout;
assign ff_filbuf_uncorr_err_c6_scanin = ff_filbuf_uncorr_err_c52_scanout;
assign ff_filbuf_uncorr_err_c7_scanin = ff_filbuf_uncorr_err_c6_scanout;
assign ff_filbuf_uncorr_err_c8_scanin = ff_filbuf_uncorr_err_c7_scanout;
assign ff_filbuf_hit_c3_scanin   = ff_filbuf_uncorr_err_c8_scanout;
assign ff_filbuf_hit_c4_scanin   = ff_filbuf_hit_c3_scanout ;
assign ff_imiss_inst_c3_scanin   = ff_filbuf_hit_c4_scanout ;
assign ff_imiss_inst_c4_scanin   = ff_imiss_inst_c3_scanout ;
assign ff_ld64_inst_c3_scanin    = ff_imiss_inst_c4_scanout ;
assign ff_spc_rd_vld_c4_scanin   = ff_ld64_inst_c3_scanout  ;
assign ff_spc_rd_vld_c5_scanin   = ff_spc_rd_vld_c4_scanout ;
assign ff_spc_rd_vld_c52_scanin  = ff_spc_rd_vld_c5_scanout ;
assign ff_spc_rd_vld_c6_scanin   = ff_spc_rd_vld_c52_scanout;
assign ff_fbcerr0_d1_scanin      = ff_spc_rd_vld_c6_scanout ;
assign ff_fbuerr0_d1_scanin      = ff_fbcerr0_d1_scanout    ;
assign ff_spc_corr_err_c4_scanin = ff_fbuerr0_d1_scanout    ;
assign ff_spc_corr_err_c5_scanin = ff_spc_corr_err_c4_scanout;
assign ff_spc_corr_err_c52_scanin = ff_spc_corr_err_c5_scanout;
assign ff_spc_corr_err_c6_scanin = ff_spc_corr_err_c52_scanout;
assign ff_spc_uncorr_err_c4_scanin = ff_spc_corr_err_c6_scanout;
assign ff_spc_uncorr_err_c5_scanin = ff_spc_uncorr_err_c4_scanout;
assign ff_spc_uncorr_err_c52_scanin = ff_spc_uncorr_err_c5_scanout;
assign ff_spc_uncorr_err_c6_scanin = ff_spc_uncorr_err_c52_scanout;
assign ff_bsc_corr_err_c4_scanin = ff_spc_uncorr_err_c6_scanout;
assign ff_bsc_corr_err_c5_scanin = ff_bsc_corr_err_c4_scanout;
assign ff_bsc_corr_err_c52_scanin = ff_bsc_corr_err_c5_scanout;
assign ff_bsc_corr_err_c6_scanin = ff_bsc_corr_err_c52_scanout;
assign ff_bsc_corr_err_c7_scanin = ff_bsc_corr_err_c6_scanout;
assign ff_bsc_corr_err_c8_scanin = ff_bsc_corr_err_c7_scanout;
assign ff_bsc_corr_err_c9_scanin = ff_bsc_corr_err_c8_scanout;
assign ff_bsc_corr_err_c10_scanin = ff_bsc_corr_err_c9_scanout;
assign ff_bsc_corr_err_c11_scanin = ff_bsc_corr_err_c10_scanout;
assign ff_bsc_corr_err_c12_scanin = ff_bsc_corr_err_c11_scanout;
assign ff_ld64_fb_hit_c4_scanin  = ff_bsc_corr_err_c12_scanout;
assign ff_ld64_fb_hit_c5_scanin  = ff_ld64_fb_hit_c4_scanout;
assign ff_ld64_fb_hit_c52_scanin = ff_ld64_fb_hit_c5_scanout;
assign ff_ld64_fb_hit_c6_scanin  = ff_ld64_fb_hit_c52_scanout;
assign ff_ld64_fb_hit_c7_scanin  = ff_ld64_fb_hit_c6_scanout;
assign ff_ld64_fb_hit_c8_scanin  = ff_ld64_fb_hit_c7_scanout;
assign ff_ld64_fb_hit_c9_scanin  = ff_ld64_fb_hit_c8_scanout;
assign ff_ld64_fb_hit_c10_scanin = ff_ld64_fb_hit_c9_scanout;
assign ff_ld64_fb_hit_c11_scanin = ff_ld64_fb_hit_c10_scanout;
assign ff_ld64_fb_hit_c12_scanin = ff_ld64_fb_hit_c11_scanout;
assign ff_mcu_scb_mecc_err_d1_scanin = ff_ld64_fb_hit_c12_scanout;
assign ff_mcu_scb_secc_err_d1_scanin = ff_mcu_scb_mecc_err_d1_scanout;
assign ff_fb_uerr_pend_scanin    = ff_mcu_scb_secc_err_d1_scanout;
assign ff_fb_nduerr_pend_scanin  = ff_fb_uerr_pend_scanout  ;
assign ff_fb_cerr_pend_scanin    = ff_fb_nduerr_pend_scanout;
assign ff_fb_ndcerr_pend_scanin  = ff_fb_cerr_pend_scanout  ;
assign ff_fb_tecc_pend_scanin    = ff_fb_ndcerr_pend_scanout;
assign ff_fb_tecc_pend_d1_scanin = ff_fb_tecc_pend_scanout  ;
assign scan_out                  = ff_fb_tecc_pend_d1_scanout;
// fixscan end:
endmodule 







// any PARAMS parms go into naming of macro

module l2t_filbuf_ctl_l1clkhdr_ctl_macro (
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


module l2t_filbuf_ctl_spare_ctl_macro__num_6 (
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
assign scan_out = so_5;



endmodule






// any PARAMS parms go into naming of macro

module l2t_filbuf_ctl_msff_ctl_macro__width_1 (
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

module l2t_filbuf_ctl_msff_ctl_macro__width_18 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [17:0] fdin;
wire [16:0] so;

  input [17:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [17:0] dout;
  output scan_out;
assign fdin[17:0] = din[17:0];






dff #(18)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[17:0]),
.si({scan_in,so[16:0]}),
.so({so[16:0],scan_out}),
.q(dout[17:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_filbuf_ctl_msff_ctl_macro__width_3 (
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

module l2t_filbuf_ctl_msff_ctl_macro__width_8 (
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

module l2t_filbuf_ctl_msff_ctl_macro__clr_1__width_8 (
  din, 
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
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0] & ~{8{clr}};






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

module l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 (
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

module l2t_filbuf_ctl_msff_ctl_macro__clr_1__en_1__width_4 (
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

module l2t_filbuf_ctl_msff_ctl_macro__width_5 (
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

module l2t_filbuf_ctl_msff_ctl_macro__en_1__width_2 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = (din[1:0] & {2{en}}) | (dout[1:0] & ~{2{en}});






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

module l2t_filbuf_ctl_msff_ctl_macro__clr_1__en_1__width_1 (
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

module l2t_filbuf_ctl_msff_ctl_macro__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [7:0] so;

  input [8:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_filbuf_ctl_msff_ctl_macro__width_4 (
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

module l2t_filbuf_ctl_msff_ctl_macro__en_1__width_4 (
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

module l2t_filbuf_ctl_msff_ctl_macro__width_2 (
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

module l2t_filbuf_ctl_msff_ctl_macro__clr_1__en_1__width_2 (
  din, 
  en, 
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
  input en;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = (din[1:0] & {2{en}} & ~{2{clr}}) | (dout[1:0] & ~{2{en}} & ~{2{clr}});






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

module l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 (
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

module l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_5 (
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

module l2t_filbuf_ctl_msff_ctl_macro__clr_1__width_1 (
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

module l2t_filbuf_ctl_msff_ctl_macro__en_1__width_3 (
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

module l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_4 (
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


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_3 (
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

module l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_3 (
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

module l2t_filbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 (
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

module l2t_filbuf_ctl_msff_ctl_macro__en_1__width_1 (
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








