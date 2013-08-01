// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_tagdp_ctl.v
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


 
module l2t_tagdp_ctl (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  vlddir_vuad_valid_c2, 
  tag_parity_c2, 
  tag_way_sel_c2, 
  tag_way_sel_c2_buff, 
  vuaddp_vuad_tagd_sel_c2_d1, 
  bist_way_px, 
  bist_enable_px, 
  tagdp_quad0_muxsel_c3, 
  tagdp_quad1_muxsel_c3, 
  tagdp_quad2_muxsel_c3, 
  tagdp_quad3_muxsel_c3, 
  tagdp_tag_quad_muxsel_c3, 
  vuad_dp_diag_data_c7, 
  tagdp_vuad_dp_diag_data_c7_buf, 
  arbadr_arbdp_diag_wr_way_c2, 
  arb_tecc_way_c2, 
  arb_normal_tagacc_c2, 
  arb_tagd_tecc_c2, 
  arb_tagd_perr_vld_c2, 
  misbuf_hit_c3, 
  mbist_run, 
  csr_l2_dir_map_on, 
  arb_l2tag_vld_c4, 
  arb_vuad_ce_err_c3, 
  l2clk, 
  scan_in, 
  wmr_l, 
  tagdp_misbuf_par_err_c3, 
  tagdp_tag_par_err_c3, 
  tagdp_arb_par_err_c3, 
  tagdp_tag_error_c8, 
  scan_out, 
  usaloc_vuad_used_c2, 
  usaloc_vuad_alloc_c2, 
  tagdp_lru_way_sel_c3, 
  arb_evict_vld_c2, 
  arb_pf_ice_inst_c2, 
  tagdp_evict_c3_1, 
  tagdp_evict_c3_2, 
  tagdp_invalid_evict_c3);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire spares_scanin;
wire spares_scanout;
wire ff_tagdp_vuad_dp_diag_data_c7_scanin;
wire ff_tagdp_vuad_dp_diag_data_c7_scanout;
wire reset_flop_scanin;
wire reset_flop_scanout;
wire arb_pf_ice_evict_vld_c3;
wire ff_evict_c3_1_scanin;
wire ff_evict_c3_1_scanout;
wire arb_pf_ice_evict_vld_c2;
wire ff_evict_c3_2_scanin;
wire ff_evict_c3_2_scanout;
wire par_err_c3_n;
wire arb_pf_ice_evict_vld_c3_n;
wire ff_tagd_par_err_c3_scanin;
wire ff_tagd_par_err_c3_scanout;
wire ff_tagd_par_err_c3_2_scanin;
wire ff_tagd_par_err_c3_2_scanout;
wire ff_tagdp_misbuf_par_err_c3_scanin;
wire ff_tagdp_misbuf_par_err_c3_scanout;
wire ff_tagdp_tag_par_err_c3_scanin;
wire ff_tagdp_tag_par_err_c3_scanout;
wire ff_tagdp_arb_par_err_c3_scanin;
wire ff_tagdp_arb_par_err_c3_scanout;
wire ff_tagd_par_err_c4_scanin;
wire ff_tagd_par_err_c4_scanout;
wire ff_tagd_par_err_c5_scanin;
wire ff_tagd_par_err_c5_scanout;
wire ff_tagd_par_err_c52_scanin;
wire ff_tagd_par_err_c52_scanout;
wire ff_tag_error_c6_scanin;
wire ff_tag_error_c6_scanout;
wire ff_tag_error_c7_scanin;
wire ff_tag_error_c7_scanout;
wire ff_tag_error_c8_scanin;
wire ff_tag_error_c8_scanout;
wire ff_l2_dir_map_on_d1_scanin;
wire ff_l2_dir_map_on_d1_scanout;
wire ff_diag_way_c3_scanin;
wire ff_diag_way_c3_scanout;
wire ff_diag_way_c4_scanin;
wire ff_diag_way_c4_scanout;
wire ff_lru_quad_muxsel_c2_scanin;
wire ff_lru_quad_muxsel_c2_scanout;
wire ff_bist_way_c1_scanin;
wire ff_bist_way_c1_scanout;
wire ff_bist_way_c2_scanin;
wire ff_bist_way_c2_scanout;
wire ff_bist_enable_c1_scanin;
wire ff_bist_enable_c1_scanout;
wire ff_bist_enable_c2_scanin;
wire ff_bist_enable_c2_scanout;
wire ff_mbist_run_scanin;
wire ff_mbist_run_scanout;
wire mbist_run_r1;
wire ff_use_dec_sel_c3_scanin;
wire ff_use_dec_sel_c3_scanout;
wire ff_tag_quad0_muxsel_c2_scanin;
wire ff_tag_quad0_muxsel_c2_scanout;
wire ff_tag_quad1_muxsel_c2_scanin;
wire ff_tag_quad1_muxsel_c2_scanout;
wire ff_tag_quad2_muxsel_c2_scanin;
wire ff_tag_quad2_muxsel_c2_scanout;
wire ff_tag_quad3_muxsel_c2_scanin;
wire ff_tag_quad3_muxsel_c2_scanout;
wire ff_dir_quad_way_c3_scanin;
wire ff_dir_quad_way_c3_scanout;
wire ff_lru_state_scanin;
wire ff_lru_state_scanout;
wire ff_lru_state_quad0_scanin;
wire ff_lru_state_quad0_scanout;
wire ff_lru_state_quad1_scanin;
wire ff_lru_state_quad1_scanout;
wire ff_lru_state_quad2_scanin;
wire ff_lru_state_quad2_scanout;
wire ff_lru_state_quad3_scanin;
wire ff_lru_state_quad3_scanout;
wire ff_spec_alloc_c3_scanin;
wire ff_spec_alloc_c3_scanout;
wire sel_dir_way;
wire ff_lru_way_c3_scanin;
wire ff_lru_way_c3_scanout;
wire ff_lru_way_c3_1_scanin;
wire ff_lru_way_c3_1_scanout;
wire ff_valid_c3_scanin;
wire ff_valid_c3_scanout;
 

 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 
input	[15:0]	vlddir_vuad_valid_c2; // BS & SR 10/28/03 
input	[15:0]	tag_parity_c2; // from tagd.needs to be mapped // BS & SR 10/28/03  
			       // @ the top level. 
 
input	[15:0]	tag_way_sel_c2; // This can be a delayed version of the way selects.POST_3.0, BS & SR 10/28/03 

output	[15:0]	tag_way_sel_c2_buff;
input		vuaddp_vuad_tagd_sel_c2_d1; //POST_3.0 
 
// Adding all the mux control logic for tagd and tagl into  
// this block. 
// All bist inputs come from a PX2 flop in the bist controller. 
input   [3:0]   bist_way_px; // from tagbist 
input           bist_enable_px; // from tagbist 
 
 
                                 // calculations. 
output  [3:0]   tagdp_quad0_muxsel_c3; // BS & SR 10/28/03 
output  [3:0]   tagdp_quad1_muxsel_c3; // BS & SR 10/28/03 
output  [3:0]   tagdp_quad2_muxsel_c3; // BS & SR 10/28/03 
output  [3:0]   tagdp_quad3_muxsel_c3; // BS & SR 10/28/03 

output  [3:0]   tagdp_tag_quad_muxsel_c3 ; // to tagd 

// start int 5.0 change
//input        [7:0]   mbist_write_data; // int 5.0 changes
//input        [8:0]   mbist_l2v_index; // POST_4.2 signals
//input                mbist_l2v_vd; // POST_4.2 signals
//input                mbist_l2v_write; // POST_4.2 signals
input        [38:0]  vuad_dp_diag_data_c7 ; // POST_4.2 si

//output       [7:0]   tagdp_bist_vuad_wr_data ;
//output       [8:0]   tagdp_bist_vuad_index; // POST_4.2 signals
//output               tagdp_bist_vuad_vd; // POST_4.2 signals
//output               tagdp_bist_vuad_write; // POST_4.2 signals
output       [38:0]  tagdp_vuad_dp_diag_data_c7_buf; // POST_4.2
// end int 5.0 change

 
input   [3:0]   arbadr_arbdp_diag_wr_way_c2 ; // Wr or read way for tag Diagnostic Accesses. 
input   [3:0]   arb_tecc_way_c2; 
input           arb_normal_tagacc_c2 ; // indicates that lru way from vuad is used for 
                                 // tag selection 
input           arb_tagd_tecc_c2; // NEW_PIN . sel tecc way 
input		arb_tagd_perr_vld_c2; // POST_2.0 PIN 
input		misbuf_hit_c3; // POST_2.0 PIN 
input		mbist_run; // POST_2.0 PIN 
 
input           csr_l2_dir_map_on;  // NEW_PIN from csr 
input           arb_l2tag_vld_c4; // from tag 
input           arb_vuad_ce_err_c3;
 
input		 l2clk; 
input scan_in;
input            wmr_l; 
 
 
 
 
output          tagdp_misbuf_par_err_c3 ;  // can be made a C3 signal. 
output		tagdp_tag_par_err_c3; // used to gate off eviction way 
output		tagdp_arb_par_err_c3; // used to gate off an eviction signal 
 
output		tagdp_tag_error_c8; // to filbuf and csr. 
 
 
output scan_out; 
 
input   [15:0]   usaloc_vuad_used_c2 ; // BS & SR 10/28/03 
input   [15:0]   usaloc_vuad_alloc_c2 ; // BS & SR 10/28/03 
 
output  [15:0]   tagdp_lru_way_sel_c3; // BS & SR 10/28/03 
 
// to tagd 
// All outputs are xmitted in C2 and used in C3. 
// Buffer the following so that they can transmit to tagd. 
 
input           arb_evict_vld_c2; 
input		arb_pf_ice_inst_c2;
 
output          tagdp_evict_c3_1; 
output          tagdp_evict_c3_2; 
output		tagdp_invalid_evict_c3; 
 
 
 
 
wire	par_err_c2, par_err_c3; 
wire	tagd_par_err_c4, tagd_par_err_c5, tagd_par_err_c52; // BS 03/11/04 extra cycle for mem access 
wire	tag_error_c6, tag_error_c7 ; 
 
 
wire   [3:0]   lru_quad0_muxsel_c2 ; // BS & SR 10/28/03 
wire   [3:0]   lru_quad1_muxsel_c2 ; // BS & SR 10/28/03 
wire   [3:0]   lru_quad2_muxsel_c2 ; // BS & SR 10/28/03 
wire   [3:0]   lru_quad3_muxsel_c2 ; // BS & SR 10/28/03 
 
 
wire    [3:0]   diag_wr_way_c3; 
wire    [3:0]   diag_wr_way_c4; 
 
wire    [3:0]   dec_lower_tag_way_c2; 
wire    [3:0]   dec_high_tag_way_c2; 
 
wire    [3:0]   bist_way_c1; 
wire    [3:0]   bist_way_c2; 
wire            bist_enable_c1; 
wire            bist_enable_c2; 
 
wire   [3:0]   lru_quad_muxsel_c2; 
wire	[3:0]	lru_quad_muxsel_c3; 
 
wire    [3:0]   tag_quad0_muxsel_c2 ; // BS & SR 10/28/03 
wire    [3:0]   tag_quad1_muxsel_c2 ; // BS & SR 10/28/03 
wire    [3:0]   tag_quad2_muxsel_c2 ; // BS & SR 10/28/03 
wire    [3:0]   tag_quad3_muxsel_c2 ; // BS & SR 10/28/03 
 
wire    [3:0] dir_quad0_way_c2, dir_quad1_way_c2 ; // BS & SR 10/28/03
wire    [3:0] dir_quad2_way_c2, dir_quad3_way_c2 ; // BS & SR 10/28/03
 
wire    [3:0]   tag_quad0_muxsel_c3; // BS & SR 10/28/03 
wire    [3:0]   tag_quad1_muxsel_c3; // BS & SR 10/28/03 
wire    [3:0]   tag_quad2_muxsel_c3; // BS & SR 10/28/03 
wire    [3:0]   tag_quad3_muxsel_c3; // BS & SR 10/28/03 
 
 
wire    [3:0]   dir_quad_way_c2; 
wire    [3:0]   dir_quad_way_c3; 
wire            sel_bist_way_c2 ; 
wire            sel_diag_way_c4 ; 
wire            sel_tecc_way_c2 ; 
 
wire    [1:0]   enc_high_tag_way_c2; 
wire    [1:0]   enc_lower_tag_way_c2; 
wire            use_dec_sel_c2; 
wire    use_dec_sel_c3; 
wire    l2_dir_map_on_d1; 
wire    sel_dir_way_c2; // pick way indicated by addr<21:18> 
 
	 
wire	[3:0] muxsel_quad0_way_c2 ; // BS & SR 10/28/03
wire	[3:0] muxsel_quad1_way_c2 ; // BS & SR 10/28/03
wire	[3:0] muxsel_quad2_way_c2 ; // BS & SR 10/28/03
wire	[3:0] muxsel_quad3_way_c2 ; // BS & SR 10/28/03
wire	nondep_tagd_par_err_c3; 
wire	evict_vld_c3_1, evict_vld_c3_2; 
wire	evict_c3_1; 
	 
 
wire    dbb_rst_l; 
wire	par_err_c3_2; 
 
wire	[15:0]	lru_way_sel_c3_1; // BS & SR 10/28/03 
wire	[15:0]	valid_c3; // BS & SR 10/28/03 
 


//////////////////////////////////////////////////
// L1 clk header
//////////////////////////////////////////////////
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

l2t_tagdp_ctl_l1clkhdr_ctl_macro clkgen (
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
l2t_tagdp_ctl_spare_ctl_macro__num_4 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
//////////////////////////////////////////



// int 5.0 changes
// ----------------------\/ POST 4.2 repeater addition \/
//assign       tagdp_bist_vuad_wr_data = mbist_write_data ;
//assign       tagdp_bist_vuad_write =  mbist_l2v_write ;
//assign       tagdp_bist_vuad_vd = mbist_l2v_vd ;
//assign       tagdp_bist_vuad_index = mbist_l2v_index ;
//assign     tagdp_vuad_dp_diag_data_c7_buf = vuad_dp_diag_data_c7 ;


l2t_tagdp_ctl_msff_ctl_macro__width_39 ff_tagdp_vuad_dp_diag_data_c7 
        (
	.scan_in(ff_tagdp_vuad_dp_diag_data_c7_scanin),
	.scan_out(ff_tagdp_vuad_dp_diag_data_c7_scanout),
	.dout   (tagdp_vuad_dp_diag_data_c7_buf[38:0]),
        .din 	(vuad_dp_diag_data_c7[38:0]),
        .l1clk 	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
        ); 






// ----------------------\/ POST 4.2 repeater addition \/
 
/////////////////////////////////////////////////////////////////// 
// Reset flop 
/////////////////////////////////////////////////////////////////// 
 
l2t_tagdp_ctl_msff_ctl_macro__width_1 reset_flop 
				(.dout(dbb_rst_l), 
                                        .scan_in(reset_flop_scanin),
                                        .scan_out(reset_flop_scanout),
                                        .l1clk(l1clk), 
                                        .din(wmr_l),
  .siclk(siclk),
  .soclk(soclk) 
); 

l2t_tagdp_ctl_msff_ctl_macro__dmsff_32x__width_2 ff_evict_c3_1 
              (.dout   ({evict_vld_c3_1,arb_pf_ice_evict_vld_c3}), 
               .scan_in(ff_evict_c3_1_scanin),
               .scan_out(ff_evict_c3_1_scanout),
               .din ({arb_evict_vld_c2,arb_pf_ice_evict_vld_c2}), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              ) ; 
l2t_tagdp_ctl_msff_ctl_macro__width_1 ff_evict_c3_2 
              (.dout   (evict_vld_c3_2), 
               .scan_in(ff_evict_c3_2_scanin),
               .scan_out(ff_evict_c3_2_scanout),
               .din (arb_evict_vld_c2), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              ) ; 

/////////////////////
// bug id 93679
// In case of PF ice the allocate bits should not be set since 
// there is no instruction filling that place. 
 
//timing optimized qualified in usaloc


cl_u1_inv_32x inv_par_err_c3_n 
	(
	.out	(par_err_c3_n),
	.in	(par_err_c3)
	);

cl_u1_inv_32x inv_arb_pf_ice_evict_vld_c3_n 
        (
        .out   (arb_pf_ice_evict_vld_c3_n),
        .in    (arb_pf_ice_evict_vld_c3)
        );

cl_u1_nand3_24x nand_tagdp_evict_c3_1 
	(
	.in0	(par_err_c3_n),
	.in1	(evict_vld_c3_1),
	.in2	(arb_pf_ice_evict_vld_c3_n),
	.out	(tagdp_evict_c3_1)
	);

//assign  tagdp_evict_c3_1     = ~(evict_vld_c3_1 & ~par_err_c3 & ~arb_pf_ice_evict_vld_c3); // & ~arb_vuad_ce_err_c3; 

assign  tagdp_evict_c3_2     = evict_vld_c3_1 & ~par_err_c3  & ~arb_vuad_ce_err_c3; //& ~arb_pf_ice_evict_vld_c3;
 
assign	evict_c3_1  =  evict_vld_c3_2 & ~par_err_c3_2 & ~arb_vuad_ce_err_c3; 
 
 
// evict qualification is performed in arb. 
assign	tagdp_invalid_evict_c3 =   |(lru_way_sel_c3_1 & ~valid_c3) ; 
 
 
 
//////////////////////////////////////////// 
// The tag compare operation is a 27 bit 
// compare. The overall Parity bit is  
// not part of the compare.  
//  
// An error in any bit of the tag will cause 
// the lkup operation to fail except for 
// that in the overall parity bit. 
// In case of an error in P, we need to  
// turn off signalling a parity error. 
// 
// That is done using the not_hit_way_c2 signal 
//assign	tagd_par_err_c2 = 	arb_tagd_perr_vld_c2 & // inst vld from arb 
//	(|( tag_parity_c2 & not_hit_way_c2  )) ; 
//////////////////////////////////////////// 
 
//////////////////////////////////////////// 
// An eviction is turned off if 
// par_err_c3 is asserted. This is becuase 
// the eviction could very well pick a way  
// with a corrupted tag and this would end 
// up in memory corruption. 
//////////////////////////////////////////// 
 
 
// the following signal is used for reporting purposes only 
assign	par_err_c2 = arb_tagd_perr_vld_c2 & |(tag_parity_c2 & vlddir_vuad_valid_c2); 
 
 
// the following signals are used for control in the pipeline. 
// In misbuf, tag, vuad, arb this par err signal is used 
// for different purposes. In all cases it is used only for 
// an EVICT instruction or for a miss. 
// In misbuf, it is used in the insertion expression provided 
// the instruction also misses the $ and FB. 
 
l2t_tagdp_ctl_msff_ctl_macro__dmsff_32x__width_1 ff_tagd_par_err_c3 
                           (.din(par_err_c2), .l1clk(l1clk), 
                              .scan_in(ff_tagd_par_err_c3_scanin),
                              .scan_out(ff_tagd_par_err_c3_scanout),
                              .dout(par_err_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_1 ff_tagd_par_err_c3_2 
                           (.din(par_err_c2), .l1clk(l1clk), 
                              .scan_in(ff_tagd_par_err_c3_2_scanin),
                              .scan_out(ff_tagd_par_err_c3_2_scanout),
                              .dout(par_err_c3_2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_1 ff_tagdp_misbuf_par_err_c3 
                           (.din(par_err_c2), .l1clk(l1clk), 
                              .scan_in(ff_tagdp_misbuf_par_err_c3_scanin),
                              .scan_out(ff_tagdp_misbuf_par_err_c3_scanout),
                              .dout(tagdp_misbuf_par_err_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_1 ff_tagdp_tag_par_err_c3 
                           (.din(par_err_c2), .l1clk(l1clk), 
                              .scan_in(ff_tagdp_tag_par_err_c3_scanin),
                              .scan_out(ff_tagdp_tag_par_err_c3_scanout),
                              .dout(tagdp_tag_par_err_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_1 ff_tagdp_arb_par_err_c3 
                           (.din(par_err_c2), .l1clk(l1clk), 
                              .scan_in(ff_tagdp_arb_par_err_c3_scanin),
                              .scan_out(ff_tagdp_arb_par_err_c3_scanout),
                              .dout(tagdp_arb_par_err_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// In all the destination blocks, vuad, tag, misbuf and arb, this 
// par_err signal is used only for a non-dep instruction. 
// Dependents will not report a parity error at all. 
// Hovewer, reporting is enabled for all hit cases that encounter a  
// tag corruption.  
 
 
assign	nondep_tagd_par_err_c3 = par_err_c3 & ~misbuf_hit_c3; 
 
 
l2t_tagdp_ctl_msff_ctl_macro__width_1 ff_tagd_par_err_c4 
                           (.din(nondep_tagd_par_err_c3), .l1clk(l1clk), 
                              .scan_in(ff_tagd_par_err_c4_scanin),
                              .scan_out(ff_tagd_par_err_c4_scanout),
                              .dout(tagd_par_err_c4),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_1 ff_tagd_par_err_c5 
                           (.din(tagd_par_err_c4), .l1clk(l1clk), 
                              .scan_in(ff_tagd_par_err_c5_scanin),
                              .scan_out(ff_tagd_par_err_c5_scanout),
                              .dout(tagd_par_err_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_tagdp_ctl_msff_ctl_macro__width_1 ff_tagd_par_err_c52 
                           (.din(tagd_par_err_c5), .l1clk(l1clk),
                              .scan_in(ff_tagd_par_err_c52_scanin),
                              .scan_out(ff_tagd_par_err_c52_scanout),
                              .dout(tagd_par_err_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_tagdp_ctl_msff_ctl_macro__width_1 ff_tag_error_c6 
                           (.din(tagd_par_err_c52), .l1clk(l1clk), 
                              .scan_in(ff_tag_error_c6_scanin),
                              .scan_out(ff_tag_error_c6_scanout),
                              .dout(tag_error_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_1 ff_tag_error_c7 
                           (.din(tag_error_c6), .l1clk(l1clk), 
                              .scan_in(ff_tag_error_c7_scanin),
                              .scan_out(ff_tag_error_c7_scanout),
                              .dout(tag_error_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_1 ff_tag_error_c8 
                           (.din(tag_error_c7), .l1clk(l1clk), 
                              .scan_in(ff_tag_error_c8_scanin),
                              .scan_out(ff_tag_error_c8_scanout),
                              .dout(tagdp_tag_error_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
///////////////////////////////////////////// 
// Mux select generation to read 
// out the evicted tag & 
// 16:1 muxing of the tag read 
// 
// In C2 we generate the muxselects for all the 
// 4 quads. 
// These mux selects are generated for the following 
// 2 categories of accesses. 
// I)Normal accesses: sels generated by vuad 
// II) Direct Accesses: Diagnostic/direct mapped, BIST, tecc  
// 
// In C3 we generate the mux selects for the 4-1 mux in 
// this block. 
///////////////////////////////////////////// 

// BS 06/24/04 : support for Prefetch ICE.
// In case evict instruction is a Prefetch ICE, pick way from 21:18 of the address itself

assign arb_pf_ice_evict_vld_c2 = arb_pf_ice_inst_c2 & arb_evict_vld_c2; 
 
l2t_tagdp_ctl_msff_ctl_macro__width_1 ff_l2_dir_map_on_d1 
                           (.din(csr_l2_dir_map_on), .l1clk(l1clk), 
		  .scan_in(ff_l2_dir_map_on_d1_scanin),
		  .scan_out(ff_l2_dir_map_on_d1_scanout),
		  .dout(l2_dir_map_on_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_4 ff_diag_way_c3 
                           (.din(arbadr_arbdp_diag_wr_way_c2[3:0]), .l1clk(l1clk), 
          .scan_in(ff_diag_way_c3_scanin),
          .scan_out(ff_diag_way_c3_scanout),
          .dout(diag_wr_way_c3[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_4 ff_diag_way_c4 
                           (.din(diag_wr_way_c3[3:0]), .l1clk(l1clk), 
          .scan_in(ff_diag_way_c4_scanin),
          .scan_out(ff_diag_way_c4_scanout),
          .dout(diag_wr_way_c4[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_4 ff_lru_quad_muxsel_c2 
                           (.din(lru_quad_muxsel_c2[3:0]), .l1clk(l1clk), 
	  .scan_in(ff_lru_quad_muxsel_c2_scanin),
	  .scan_out(ff_lru_quad_muxsel_c2_scanout),
	  .dout(lru_quad_muxsel_c3[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_4 ff_bist_way_c1 
                           (.din(bist_way_px[3:0]), .l1clk(l1clk), 
	  .scan_in(ff_bist_way_c1_scanin),
	  .scan_out(ff_bist_way_c1_scanout),
	  .dout(bist_way_c1[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_4 ff_bist_way_c2 
                           (.din(bist_way_c1[3:0]), .l1clk(l1clk), 
	  .scan_in(ff_bist_way_c2_scanin),
	  .scan_out(ff_bist_way_c2_scanout),
	  .dout(bist_way_c2[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_1 ff_bist_enable_c1 
                           (.din(bist_enable_px), .l1clk(l1clk), 
	  .scan_in(ff_bist_enable_c1_scanin),
	  .scan_out(ff_bist_enable_c1_scanout),
	  .dout(bist_enable_c1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_1 ff_bist_enable_c2 
                           (.din(bist_enable_c1), .l1clk(l1clk), 
	  .scan_in(ff_bist_enable_c2_scanin),
	  .scan_out(ff_bist_enable_c2_scanout),
	  .dout(bist_enable_c2),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 06/24/04 : support for Prefetch ICE.
// In case evict instruction is a Prefetch ICE, pick way from 21:18 of the address itself
 
 
assign	sel_bist_way_c2 =  bist_enable_c2 ; 
assign	sel_diag_way_c4 = ~bist_enable_c2 & arb_l2tag_vld_c4;	 
assign	sel_tecc_way_c2 = ~bist_enable_c2 & ~arb_l2tag_vld_c4  & 
			arb_tagd_tecc_c2 ; 
assign	sel_dir_way_c2 = ~arb_tagd_tecc_c2 & ~bist_enable_c2 & 
			~arb_l2tag_vld_c4 ; 
 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_2 mux_way_low 
		(	.dout (enc_lower_tag_way_c2[1:0]), 
                             	.din0(bist_way_c2[1:0]),  // bist way c2 
				.din1(diag_wr_way_c4[1:0]), // diag way c4 
                             	.din2(arb_tecc_way_c2[1:0]),// tecc way c2( from a counter in arbdec) 
                             	.din3(arbadr_arbdp_diag_wr_way_c2[1:0]),// addr_c2<19:18> 
                             	.sel0(sel_bist_way_c2),  // bist way sel 
				.sel1(sel_diag_way_c4), // no bist way sel and diag sel. 
				.sel2(sel_tecc_way_c2), // tecc way 
                             	.sel3(sel_dir_way_c2)); // default is dir mapped way. 
 
assign	dec_lower_tag_way_c2[0] =(enc_lower_tag_way_c2 == 2'd0 ) ; 
assign	dec_lower_tag_way_c2[1] =(enc_lower_tag_way_c2 == 2'd1 ) ; 
assign	dec_lower_tag_way_c2[2] =(enc_lower_tag_way_c2 == 2'd2 ) ; 
assign	dec_lower_tag_way_c2[3] =(enc_lower_tag_way_c2 == 2'd3 ) ; 
 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_2 mux_way_high 
		(.dout (enc_high_tag_way_c2[1:0]), 
                             	.din0(bist_way_c2[3:2]), // bist way c2 
				.din1(diag_wr_way_c4[3:2]),  // diag way c4 
                             	.din2(arb_tecc_way_c2[3:2]), // tecc way c2( from a counter in arbdec) 
                             	.din3(arbadr_arbdp_diag_wr_way_c2[3:2]),// addr_c2<21:20> 
                             	.sel0(sel_bist_way_c2), // bist way sel 
				.sel1(sel_diag_way_c4), // no bist way sel and diag sel. 
				.sel2(sel_tecc_way_c2), // tecc 
                             	.sel3(sel_dir_way_c2)); // default is dir mapped way. 
 
assign	dec_high_tag_way_c2[0] = (enc_high_tag_way_c2 == 2'd0 ) ; 
assign	dec_high_tag_way_c2[1] = (enc_high_tag_way_c2 == 2'd1 ) ; 
assign	dec_high_tag_way_c2[2] = (enc_high_tag_way_c2 == 2'd2 ) ; 
assign	dec_high_tag_way_c2[3] = (enc_high_tag_way_c2 == 2'd3 ) ; 
 
//  Quad0 muxselects // BS & SR 10/28/03 
//  Tags in Quad0 correspond to way=0,1,2,3 , // BS & SR 10/28/03
 
assign	dir_quad0_way_c2[0] = dec_high_tag_way_c2[0]  &  
				dec_lower_tag_way_c2[0] ; // 0000 
assign	dir_quad0_way_c2[1] = dec_high_tag_way_c2[0]  &  
				dec_lower_tag_way_c2[1] ; // 0001 
assign	dir_quad0_way_c2[2] = dec_high_tag_way_c2[0]  &  
				dec_lower_tag_way_c2[2] ; // 0010 
assign  dir_quad0_way_c2[3] = dec_high_tag_way_c2[0]  &
                                dec_lower_tag_way_c2[3] ; // 0011 // BS & SR 10/28/03

 
assign	dir_quad_way_c2[0] = |( dir_quad0_way_c2 ) ; // BS & SR 10/28/03 
				 
 
assign	muxsel_quad0_way_c2[2:0] = dir_quad0_way_c2[2:0]; // BS & SR 10/28/03 
assign	muxsel_quad0_way_c2[3] = ~( dir_quad0_way_c2[2] | dir_quad0_way_c2[1] | 
				dir_quad0_way_c2[0] ) ; // BS & SR 10/28/03 
				 
				 
//  Quad1 muxselects // BS & SR 10/28/03 
//  Tags in Quad1 correspond to way=4,5,6,7  // BS & SR 10/28/03 
 
assign	dir_quad1_way_c2[0] = dec_high_tag_way_c2[1]  &  
				dec_lower_tag_way_c2[0] ; // 0100 // BS & SR 10/28/03 
 
assign	dir_quad1_way_c2[1] = dec_high_tag_way_c2[1]  & 
                                dec_lower_tag_way_c2[1] ; // 0101 // BS & SR 10/28/03 
 
assign	dir_quad1_way_c2[2] = dec_high_tag_way_c2[1]  &  
                                dec_lower_tag_way_c2[2] ; // 0110 // BS & SR 10/28/03 

assign  dir_quad1_way_c2[3] = dec_high_tag_way_c2[1]  &   
                                dec_lower_tag_way_c2[3] ; // 0111 // BS & SR 10/28/03

assign	dir_quad_way_c2[1] = |( dir_quad1_way_c2 ) ; // BS & SR 10/28/03 
				 
				 
assign	muxsel_quad1_way_c2[2:0] = dir_quad1_way_c2[2:0]; // BS & SR 10/28/03 
assign	muxsel_quad1_way_c2[3] = ~( dir_quad1_way_c2[2] | dir_quad1_way_c2[1] | 
				dir_quad1_way_c2[0] ) ; // BS & SR 10/28/03 
				 
				 
 
//  Quad2 muxselects 
//  Tags in Quad2 correspond to way=8 ,9, 10,11 
 
assign	dir_quad2_way_c2[0] =   dec_high_tag_way_c2[2]  & 
				dec_lower_tag_way_c2[0] ; // 1000 BS & SR 10/28/03
 
assign	dir_quad2_way_c2[1] =   dec_high_tag_way_c2[2]  & 
				dec_lower_tag_way_c2[1] ; // 1001 BS & SR 10/28/03
 
assign	dir_quad2_way_c2[2] =  dec_high_tag_way_c2[2]   &  
				dec_lower_tag_way_c2[2] ; // 1010  BS & SR 10/28/03

assign  dir_quad2_way_c2[3] =  dec_high_tag_way_c2[2]   &
                                dec_lower_tag_way_c2[3] ; // 1011 BS & SR 10/28/03
 
 
assign	dir_quad_way_c2[2] = |( dir_quad2_way_c2 ) ; 
 
assign	muxsel_quad2_way_c2[2:0] = dir_quad2_way_c2[2:0]; // BS & SR 10/28/03
assign	muxsel_quad2_way_c2[3] = ~( dir_quad2_way_c2[2] | dir_quad2_way_c2[1] | 
				dir_quad2_way_c2[0] ) ; // BS & SR 10/28/03
				 
//  Quad3 muxselects 
//  Tags in Quad3 correspond to way=12, 13, 14, 15
 
assign  dir_quad3_way_c2[0] =  dec_high_tag_way_c2[3]  & 
                                dec_lower_tag_way_c2[0] ; // 1100 BS & SR 10/28/03
 
assign  dir_quad3_way_c2[1] = dec_high_tag_way_c2[3] & 
				dec_lower_tag_way_c2[1] ; // 1101 BS & SR 10/28/03
                                
assign  dir_quad3_way_c2[2] =  dec_high_tag_way_c2[3]   & 
                                dec_lower_tag_way_c2[2] ; // 1110 BS & SR 10/28/03
 
assign  dir_quad3_way_c2[3] =  dec_high_tag_way_c2[3]   & 
                                dec_lower_tag_way_c2[3] ; // 1111 BS & SR 10/28/03
 
assign	dir_quad_way_c2[3] = |( dir_quad3_way_c2 ) ; 
 
assign	muxsel_quad3_way_c2[2:0] = dir_quad3_way_c2[2:0]; // BS & SR 10/28/03
assign	muxsel_quad3_way_c2[3] = ~( dir_quad3_way_c2[2] | dir_quad3_way_c2[1] |
				  dir_quad3_way_c2[0] ) ; // BS & SR 10/28/03

// BS 06/24/04 : support for Prefetch ICE.
// In case evict instruction is a Prefetch ICE, pick way from 21:18 of the address itself
l2t_tagdp_ctl_msff_ctl_macro__width_1 ff_mbist_run 
	(
	.scan_in(ff_mbist_run_scanin),
	.scan_out(ff_mbist_run_scanout),
	.dout	(mbist_run_r1),
	.din	(mbist_run),
	.l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

// 
//assign	use_dec_sel_c2 = ((~arb_normal_tagacc_c2 | l2_dir_map_on_d1  
//			| arb_pf_ice_evict_vld_c2 ) & ~mbist_run_r1 )
//			| (bist_enable_c2 & mbist_run_r1); 
//

assign use_dec_sel_c2 = mbist_run_r1? bist_enable_c2 : 
		(~arb_normal_tagacc_c2 | l2_dir_map_on_d1 | arb_pf_ice_evict_vld_c2 );



 
l2t_tagdp_ctl_msff_ctl_macro__width_1 ff_use_dec_sel_c3 
                           (.din(use_dec_sel_c2), .l1clk(l1clk), 
          .scan_in(ff_use_dec_sel_c3_scanin),
          .scan_out(ff_use_dec_sel_c3_scanout),
          .dout(use_dec_sel_c3),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
				 
///////// 
// QUAD0  // BS & SR 10/28/03
///////// 
 
// Use a mux flop for the following to reduce the setup on lru_quad0_muxsel_c2 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_tag_quad0_muxsel_c2  // BS & SR 10/28/03
		( .dout (tag_quad0_muxsel_c2[3:0]), 
              			.din0(muxsel_quad0_way_c2[3:0]),   // BS & SR 10/28/03
				.din1(lru_quad0_muxsel_c2[3:0]), 
              			.sel0(use_dec_sel_c2),  
				.sel1(~use_dec_sel_c2)); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_4 ff_tag_quad0_muxsel_c2  // BS & SR 10/28/03
                           (.din(tag_quad0_muxsel_c2[3:0]), .l1clk(l1clk), 
                       .scan_in(ff_tag_quad0_muxsel_c2_scanin),
                       .scan_out(ff_tag_quad0_muxsel_c2_scanout),
                       .dout(tag_quad0_muxsel_c3[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	tagdp_quad0_muxsel_c3[3:0] = tag_quad0_muxsel_c3[3:0]; // BS & SR 10/28/03 
 
 
///////// 
// QUAD1  // BS & SR 10/28/03
///////// 
 
// Use a mux flop for the following to reduce the setup on lru_quad1_muxsel_c2 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_tag_quad1_muxsel_c2  // BS & SR 10/28/03
		( .dout (tag_quad1_muxsel_c2[3:0]), 
                  .din0(muxsel_quad1_way_c2[3:0]),  // BS & SR 10/28/03
                  .din1(lru_quad1_muxsel_c2[3:0]), 
                  .sel0(use_dec_sel_c2), 
                  .sel1(~use_dec_sel_c2)); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_4 ff_tag_quad1_muxsel_c2  // BS & SR 10/28/03
                  (.din(tag_quad1_muxsel_c2[3:0]), .l1clk(l1clk), 
                  .scan_in(ff_tag_quad1_muxsel_c2_scanin),
                  .scan_out(ff_tag_quad1_muxsel_c2_scanout),
                  .dout(tag_quad1_muxsel_c3[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
		); 
 
assign  tagdp_quad1_muxsel_c3[3:0] = tag_quad1_muxsel_c3[3:0] ;  // BS & SR 10/28/03
 
 
 
///////// 
// QUAD2  // BS & SR 10/28/03
///////// 
 
// Use a mux flop for the following to reduce the setup on lru_quad2_muxsel_c2 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_tag_quad2_muxsel_c2  // BS & SR 10/28/03
		( .dout (tag_quad2_muxsel_c2[3:0]), 
                                .din0(muxsel_quad2_way_c2[3:0]),  // BS & SR 10/28/03
                                .din1(lru_quad2_muxsel_c2[3:0]), 
                                .sel0(use_dec_sel_c2), 
                                .sel1(~use_dec_sel_c2)); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_4 ff_tag_quad2_muxsel_c2  // BS & SR 10/28/03
                           (.din(tag_quad2_muxsel_c2[3:0]), .l1clk(l1clk), 
                       .scan_in(ff_tag_quad2_muxsel_c2_scanin),
                       .scan_out(ff_tag_quad2_muxsel_c2_scanout),
                       .dout(tag_quad2_muxsel_c3[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign  tagdp_quad2_muxsel_c3[3:0] = tag_quad2_muxsel_c3[3:0];  // BS & SR 10/28/03
 
 
 
///////// 
// QUAD3  // BS & SR 10/28/03
///////// 
 
// Use a mux flop for the following to reduce the setup on lru_quad3_muxsel_c2 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_tag_quad3_muxsel_c2   // BS & SR 10/28/03
		( .dout (tag_quad3_muxsel_c2[3:0]), 
                                .din0(muxsel_quad3_way_c2[3:0]),   // BS & SR 10/28/03
                                .din1(lru_quad3_muxsel_c2[3:0]), 
                                .sel0(use_dec_sel_c2), 
                                .sel1(~use_dec_sel_c2)); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_4 ff_tag_quad3_muxsel_c2   // BS & SR 10/28/03
                           (.din(tag_quad3_muxsel_c2[3:0]), .l1clk(l1clk), 
                       .scan_in(ff_tag_quad3_muxsel_c2_scanin),
                       .scan_out(ff_tag_quad3_muxsel_c2_scanout),
                       .dout(tag_quad3_muxsel_c3[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign  tagdp_quad3_muxsel_c3[3:0] = tag_quad3_muxsel_c3[3:0];   // BS & SR 10/28/03
 
l2t_tagdp_ctl_msff_ctl_macro__width_4 ff_dir_quad_way_c3 
                           (.din(dir_quad_way_c2[3:0]), .l1clk(l1clk), 
                              .scan_in(ff_dir_quad_way_c3_scanin),
                              .scan_out(ff_dir_quad_way_c3_scanout),
                              .dout(dir_quad_way_c3[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
///////// 
// QUAD 
///////// 
 
// Use the C5 select from the diagnostic read/BIST or the C3 select from Lru. 
// 
assign tagdp_tag_quad_muxsel_c3[0] = use_dec_sel_c3 ? dir_quad_way_c3[0] : lru_quad_muxsel_c3[0];
assign tagdp_tag_quad_muxsel_c3[1] = use_dec_sel_c3 ? dir_quad_way_c3[1] : lru_quad_muxsel_c3[1];
assign tagdp_tag_quad_muxsel_c3[2] = use_dec_sel_c3 ? dir_quad_way_c3[2] : lru_quad_muxsel_c3[2];
assign tagdp_tag_quad_muxsel_c3[3] = use_dec_sel_c3 ? dir_quad_way_c3[3] : lru_quad_muxsel_c3[3];

 

 
//***************************************************************************** 
// LRU state flop. 
// * initialized to 1 on reset. 
// * left shifted ( rotate) on every eviction. 
// * else maintains its state. 
//***************************************************************************** 
 
 
wire		lshift_lru_quad0; 
wire		no_lshift_lru_quad0; 
wire	[3:0]	lru_state_lshift_quad0; 
wire	[3:0]	lru_state_quad0 ; 
wire	[3:0]	lru_state_quad0_p ; 
 
wire            lshift_lru_quad1; 
wire            no_lshift_lru_quad1; // BS & SR 10/28/03
wire    [3:0]   lru_state_lshift_quad1; 
wire    [3:0]   lru_state_quad1 ; 
wire    [3:0]   lru_state_quad1_p ; 
 
wire            lshift_lru_quad2; 
wire            no_lshift_lru_quad2; 
wire    [3:0]   lru_state_lshift_quad2; 
wire    [3:0]   lru_state_quad2 ; 
wire    [3:0]   lru_state_quad2_p ; 
 
wire            lshift_lru_quad3; 
wire            no_lshift_lru_quad3; 
wire    [3:0]   lru_state_lshift_quad3; 
wire    [3:0]   lru_state_quad3 ; 
wire    [3:0]   lru_state_quad3_p ; 
 
wire		pick_quad0; 
wire		pick_quad1; 
wire		pick_quad2; 
wire		pick_quad3; 
 
 
wire	[15:0]	vec_unvuad_used_c2; 
wire	[15:0]	vec_unvuad_alloc_c2; 
wire	sel_unvuad_used_c2; 
 
//wire	vuad_way_avail_c2; 
wire	vec_unalloc0to3_c2; 
wire	vec_unalloc4to7_c2; 
wire	vec_unalloc8to11_c2; 
wire	vec_unalloc12to15_c2; 
 
wire	vec_unused0to3_c2; 
wire	vec_unused4to7_c2; 
wire	vec_unused8to11_c2; 
wire	vec_unused12to15_c2; 
 
wire	[3:0]	used_lru_quad_c2; 
 
wire	[3:0]	used_lru_quad0_c2; 
wire	[3:0]	used_lru_quad1_c2; 
wire	[3:0]	used_lru_quad2_c2; 
wire	[3:0]	used_lru_quad3_c2; 
 
wire	[3:0]	alloc_lru_quad_c2; 
 
wire	[3:0]	alloc_lru_quad0_c2; 
wire	[3:0]	alloc_lru_quad1_c2; 
wire	[3:0]	alloc_lru_quad2_c2; 
wire	[3:0]	alloc_lru_quad3_c2; 
 
wire	[3:0]	used_quad0_tagsel_c2; 
wire	[3:0]	alloc_quad0_tagsel_c2; 
wire	[3:0]	lru_quad0_tagsel_c2; 
wire	[3:0]	used_quad1_tagsel_c2; 
wire	[3:0]	alloc_quad1_tagsel_c2; 
wire	[3:0]	lru_quad1_tagsel_c2; 
wire	[3:0]	used_quad2_tagsel_c2; 
wire	[3:0]	alloc_quad2_tagsel_c2; 
wire	[3:0]	lru_quad2_tagsel_c2; 
wire	[3:0]	used_quad3_tagsel_c2; 
wire	[3:0]	alloc_quad3_tagsel_c2; 
wire	[3:0]	lru_quad3_tagsel_c2; 
 
wire	[3:0]	used_quad_sel_c2; 
wire	[3:0]	alloc_quad_sel_c2; 
wire	[3:0]	lru_quad_sel_c2; 
 
wire	[15:0]	lru_way_sel_c2; 
 
wire		lshift_lru; 
wire		no_lshift_lru; 
wire	[3:0]	lru_state_lshift; 
wire	[3:0]	lru_state_p; 
wire	[3:0]	lru_state; 
 
wire		init_lru_state; 
wire	[3:0]	dec_lo_dir_way_c2; 
wire	[3:0]	dec_hi_dir_way_c2; 
wire	[15:0]	dec_dir_way_c2; 
wire	[15:0]	evict_way_sel_c2; 
 
wire	[15:0]	spec_alloc_c2, spec_alloc_c3; 
wire	[15:0]	mod_alloc_c2; 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// LRU algorithm is used to select a way, out of 16 ways, to be evicted out of 
// the L2 Cache. The algorithm used for the way select is not a tru LRU (Least 
// Recently Used) algorithm but Round Robin arbitration. Round Robin arbitration 
// is done in two stages by dividing 16 ways in 4 quads of 4 ways each 
// quad0[3:0] = Way[3:0], 
// quad1[3:0] = Way[7:4], 
// quad2[3:0] = Way[11:8], 
// quad3[3:0] = Way[15:12]. 
// 
// First Round Robin is done within each quads to select one of the 4 ways 
// and then Round Robin is done to select one of the four quads. 
// A 4 bit one hot shift register maintains the state of the arbiter. An one 
// at the bit location corresponding to a way represents highest priority for 
// that way. Everytime an eviction takes place, state register is updated by 
// shifting it left by one bit otherwise state of the register does not change. 
// State register is used in C2 for the way selection and it is updated in the 
// C3. On reset state rtegister is initialized to a state such that way0 has the 
// highest priority. 
// 
// Way selection algorithm depends on the Used and Allocate bit of the VUAD 
// array, read during C1, for the way selection. First priority is given to the 
// ways that has not been Used and has not been Allocated for the eviction in 
// the previous cycle. If there is no Unused and Unallocated way then a way that 
// has not been previously Allocated is given preference. 
// Note : Invalid bit is not used for the way selection as if a way is Invalid 
//        then its Used bit will not be set, so checking Invalid bit is 
//        redundant. 
//////////////////////////////////////////////////////////////////////////////// 
 
 
// QUAD ANCHOR 
 
assign	init_lru_state	= ~dbb_rst_l; // piped warm reset 
 
 
assign	lshift_lru = evict_c3_1 & ~init_lru_state; 
assign	no_lshift_lru = ~evict_c3_1 & ~init_lru_state ; 
assign	lru_state_lshift = { lru_state[2:0], lru_state[3] } ; 
 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_lru_st  
		(.dout (lru_state_p[3:0]), 
                            .din0(4'b0001), 
                            .din1(lru_state_lshift[3:0]), 
                            .din2(lru_state[3:0]), 
			    .sel0(init_lru_state), 
                            .sel1(lshift_lru), 
			    .sel2(no_lshift_lru)); 
 
 
l2t_tagdp_ctl_msff_ctl_macro__width_4 ff_lru_state 
                           (.din(lru_state_p[3:0]), 
                               .scan_in(ff_lru_state_scanin),
                               .scan_out(ff_lru_state_scanout),
                               .l1clk(l1clk), 
                               .dout(lru_state[3:0]),
  .siclk(siclk),
  .soclk(soclk) 
                                
                               
                               
); 
 
 
// Quad0 ANCHOR 
assign  lshift_lru_quad0 = evict_c3_1 & pick_quad0 & ~init_lru_state; // BS & SR 10/28/03
assign  no_lshift_lru_quad0 = ~( evict_c3_1 &  pick_quad0 )  & ~init_lru_state   ; // BS & SR 10/28/03
assign  lru_state_lshift_quad0 = { lru_state_quad0[2:0], lru_state_quad0[3]} ; // BS & SR 10/28/03
 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_lru_st_quad0   // BS & SR 10/28/03
		(.dout (lru_state_quad0_p[3:0]), 
                            .din0(4'b0001), 
                            .din1(lru_state_lshift_quad0[3:0]), 
                            .din2(lru_state_quad0[3:0]), 
                            .sel0(init_lru_state), 
                            .sel1(lshift_lru_quad0), 
                            .sel2(no_lshift_lru_quad0)); 
 
 
l2t_tagdp_ctl_msff_ctl_macro__width_4 ff_lru_state_quad0  // BS & SR 10/28/03
                           (.din(lru_state_quad0_p[3:0]), 
                               .scan_in(ff_lru_state_quad0_scanin),
                               .scan_out(ff_lru_state_quad0_scanout),
                               .l1clk(l1clk), 
                               .dout(lru_state_quad0[3:0]),
  .siclk(siclk),
  .soclk(soclk) 
                               
                               
); 
 
 
// Quad1 ANCHOR 
assign  lshift_lru_quad1 = evict_c3_1 & pick_quad1 & ~init_lru_state;  // BS & SR 10/28/03
assign  no_lshift_lru_quad1 = ~( evict_c3_1 &  pick_quad1 )  & ~init_lru_state   ;  // BS & SR 10/28/03
assign  lru_state_lshift_quad1 = { lru_state_quad1[2:0], lru_state_quad1[3] } ;  // BS & SR 10/28/03
 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_lru_st_quad1   // BS & SR 10/28/03
		(.dout (lru_state_quad1_p[3:0]), 
                            .din0(4'b0001), 
                            .din1(lru_state_lshift_quad1[3:0]), 
                            .din2(lru_state_quad1[3:0]), 
                            .sel0(init_lru_state), 
                            .sel1(lshift_lru_quad1), 
                            .sel2(no_lshift_lru_quad1)); 
 
 
l2t_tagdp_ctl_msff_ctl_macro__width_4 ff_lru_state_quad1  // BS & SR 10/28/03
                           (.din(lru_state_quad1_p[3:0]), 
                               .scan_in(ff_lru_state_quad1_scanin),
                               .scan_out(ff_lru_state_quad1_scanout),
                               .l1clk(l1clk), 
                               .dout(lru_state_quad1[3:0]),
  .siclk(siclk),
  .soclk(soclk) 
                               
                               
); 
 
// Quad2 ANCHOR 
assign  lshift_lru_quad2 = evict_c3_1 & pick_quad2 & ~init_lru_state; // BS & SR 10/28/03
assign  no_lshift_lru_quad2 = ~( evict_c3_1 &  pick_quad2 )  & ~init_lru_state   ; // BS & SR 10/28/03
assign  lru_state_lshift_quad2 = { lru_state_quad2[2:0], lru_state_quad2[3] } ; // BS & SR 10/28/03
 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_lru_st_quad2  // BS & SR 10/28/03
		(.dout (lru_state_quad2_p[3:0]), 
                            .din0(4'b0001), 
                            .din1(lru_state_lshift_quad2[3:0]), 
                            .din2(lru_state_quad2[3:0]), 
                            .sel0(init_lru_state), 
                            .sel1(lshift_lru_quad2), 
                            .sel2(no_lshift_lru_quad2)); 
 
 
l2t_tagdp_ctl_msff_ctl_macro__width_4 ff_lru_state_quad2  // BS & SR 10/28/03
                           (.din(lru_state_quad2_p[3:0]), 
                               .scan_in(ff_lru_state_quad2_scanin),
                               .scan_out(ff_lru_state_quad2_scanout),
                               .l1clk(l1clk), 
                               .dout(lru_state_quad2[3:0]),
  .siclk(siclk),
  .soclk(soclk) 
                               
                               
); 
 
 
// Quad3 ANCHOR 
assign  lshift_lru_quad3 = evict_c3_1 & pick_quad3 & ~init_lru_state; // BS & SR 10/28/03
assign  no_lshift_lru_quad3 = ~( evict_c3_1 &  pick_quad3 )  & ~init_lru_state   ; // BS & SR 10/28/03
assign  lru_state_lshift_quad3 = { lru_state_quad3[2:0], lru_state_quad3[3] } ; // BS & SR 10/28/03
 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_lru_st_quad3   // BS & SR 10/28/03
		(.dout (lru_state_quad3_p[3:0]), 
                            .din0(4'b0001), 
                            .din1(lru_state_lshift_quad3[3:0]), 
                            .din2(lru_state_quad3[3:0]), 
                            .sel0(init_lru_state), 
                            .sel1(lshift_lru_quad3), 
                            .sel2(no_lshift_lru_quad3)); 
 
 
l2t_tagdp_ctl_msff_ctl_macro__width_4 ff_lru_state_quad3  // BS & SR 10/28/03
                           (.din(lru_state_quad3_p[3:0]), 
                               .scan_in(ff_lru_state_quad3_scanin),
                               .scan_out(ff_lru_state_quad3_scanout),
                               .l1clk(l1clk), 
                               .dout(lru_state_quad3[3:0]),
  .siclk(siclk),
  .soclk(soclk) 
                               
                               
); 
 
 
 
 
//************************************************************************************ 
// LRU algorithm 
// *  3 vectors are computed ( Invalid[15:0], Unused[15:0], Unallocated[15:0] ) 
// *  On vector is selected based on the 3 select bits read out of the array in C1, 
//    invalid, unused, unallocated 
// *  A state register is used to decide which quadrant to pick. 
// *  The same state register picks a way in each of the 4 quadrants. 
//************************************************************************************ 
 
// 
// If an instruction in C2 sets the alloc bit, it needs to be bypassed 
// to the instruction that immediately follows it. This is done speculatively 
// using the spec_alloc_c3 signal if the instruction in C2 is to the same index 
// as an instruction in C3. 
 
assign tag_way_sel_c2_buff[15:0] = tag_way_sel_c2[15:0];
 
assign	spec_alloc_c2 = ( tag_way_sel_c2_buff & vlddir_vuad_valid_c2 ) ; 
 
l2t_tagdp_ctl_msff_ctl_macro__width_16 ff_spec_alloc_c3  // BS & SR 10/28/03
                           (.din(spec_alloc_c2[15:0]), 
                               .scan_in(ff_spec_alloc_c3_scanin),
                               .scan_out(ff_spec_alloc_c3_scanout),
                               .l1clk(l1clk), .dout(spec_alloc_c3[15:0]),
  .siclk(siclk),
  .soclk(soclk) 
                                
); 
 
assign	mod_alloc_c2 = ( usaloc_vuad_alloc_c2 |  
			( spec_alloc_c3  & {16{vuaddp_vuad_tagd_sel_c2_d1}} ) ); // BS & SR 10/28/03
 
// 2-3 gates. 
assign	vec_unvuad_used_c2 = ~usaloc_vuad_used_c2 & ~mod_alloc_c2 ;  
assign	vec_unvuad_alloc_c2 = ~mod_alloc_c2 ;	 
 
assign	sel_unvuad_used_c2 = |( vec_unvuad_used_c2) ; // WAY lock will be ORED to this 
 
// 2-3 gates. 
assign	vec_unused0to3_c2   = |(vec_unvuad_used_c2[3:0]); // BS & SR 10/28/03
assign	vec_unused4to7_c2   = |(vec_unvuad_used_c2[7:4]); // BS & SR 10/28/03
assign	vec_unused8to11_c2  = |(vec_unvuad_used_c2[11:8]); // BS & SR 10/28/03
assign	vec_unused12to15_c2 = |(vec_unvuad_used_c2[15:12]); // BS & SR 10/28/03
 
// vec_unallocxtoxc2 is used to select one of the four quads. 
assign	vec_unalloc0to3_c2   = |(vec_unvuad_alloc_c2[3:0]); // BS & SR 10/28/03
assign	vec_unalloc4to7_c2   = |(vec_unvuad_alloc_c2[7:4]); // BS & SR 10/28/03
assign	vec_unalloc8to11_c2  = |(vec_unvuad_alloc_c2[11:8]); // BS & SR 10/28/03
assign	vec_unalloc12to15_c2 = |(vec_unvuad_alloc_c2[15:12]); // BS & SR 10/28/03
 
 
///////////////////////////// 
//UNUSED ROUND ROBIN PICK 
///////////////////////////// 
assign	used_lru_quad_c2 = {  vec_unused12to15_c2,  vec_unused8to11_c2,  vec_unused4to7_c2,  vec_unused0to3_c2 } ; 
 
assign	used_lru_quad0_c2 = vec_unvuad_used_c2[3:0] ; // BS & SR 10/28/03 
assign	used_lru_quad1_c2 = vec_unvuad_used_c2[7:4] ;  // BS & SR 10/28/03
assign	used_lru_quad2_c2 = vec_unvuad_used_c2[11:8] ;  // BS & SR 10/28/03
assign	used_lru_quad3_c2 = vec_unvuad_used_c2[15:12] ;  // BS & SR 10/28/03
 
///////////////////////////// 
//UNALLOC ROUND ROBIN PICK 
///////////////////////////// 
assign	alloc_lru_quad_c2 = { vec_unalloc12to15_c2,  vec_unalloc8to11_c2, vec_unalloc4to7_c2,  vec_unalloc0to3_c2 } ; 
 
assign	alloc_lru_quad0_c2 = vec_unvuad_alloc_c2[3:0] ; // BS & SR 10/28/03
assign	alloc_lru_quad1_c2 = vec_unvuad_alloc_c2[7:4] ; // BS & SR 10/28/03
assign	alloc_lru_quad2_c2 = vec_unvuad_alloc_c2[11:8] ; // BS & SR 10/28/03
assign	alloc_lru_quad3_c2 = vec_unvuad_alloc_c2[15:12] ; // BS & SR 10/28/03
 
/************ LRU way within quad0 ************************/ 
 
 
assign  used_quad0_tagsel_c2[0] =   used_lru_quad0_c2[0] & 
          ( lru_state_quad0[0]  | 
          ( lru_state_quad0[1] & ~( used_lru_quad0_c2[1] | used_lru_quad0_c2[2] | used_lru_quad0_c2[3]) ) | 
          ( lru_state_quad0[2] & ~(used_lru_quad0_c2[2] | used_lru_quad0_c2[3]) ) |
	  ( lru_state_quad0[3] & ~(used_lru_quad0_c2[3]) ) ) ; // BS & SR 10/28/03
 
assign  used_quad0_tagsel_c2[1] =   used_lru_quad0_c2[1] & 
          ( lru_state_quad0[1]  | 
          ( lru_state_quad0[2] & ~( used_lru_quad0_c2[2] | used_lru_quad0_c2[0] | used_lru_quad0_c2[3] )) | 
          ( lru_state_quad0[3] & ~( used_lru_quad0_c2[3] | used_lru_quad0_c2[0] )) | 
          ( lru_state_quad0[0] & ~used_lru_quad0_c2[0])  ) ; // BS & SR 10/28/03
 
assign  used_quad0_tagsel_c2[2] =   used_lru_quad0_c2[2] & 
          ( lru_state_quad0[2]  | 
          ( lru_state_quad0[3] & ~(used_lru_quad0_c2[0] |  used_lru_quad0_c2[1] | used_lru_quad0_c2[3])) | 
          ( lru_state_quad0[0] & ~(used_lru_quad0_c2[0] |  used_lru_quad0_c2[1] )) | 
          ( lru_state_quad0[1] & ~used_lru_quad0_c2[1] ) ) ; // BS & SR 10/28/03
                
 
assign  used_quad0_tagsel_c2[3] =   used_lru_quad0_c2[3] & 
          ( lru_state_quad0[3]  | 
          ( lru_state_quad0[0] & ~(used_lru_quad0_c2[0] |  used_lru_quad0_c2[1] | used_lru_quad0_c2[2])) | 
          ( lru_state_quad0[1] & ~(used_lru_quad0_c2[2] |  used_lru_quad0_c2[1] )) | 
          ( lru_state_quad0[2] & ~used_lru_quad0_c2[2] ) ) ; // BS & SR 10/28/03



assign  alloc_quad0_tagsel_c2[0] =   alloc_lru_quad0_c2[0] & 
          ( lru_state_quad0[0]  | 
          ( lru_state_quad0[1] & ~( alloc_lru_quad0_c2[1] | alloc_lru_quad0_c2[2] | alloc_lru_quad0_c2[3] ) ) | 
          ( lru_state_quad0[2] & ~( alloc_lru_quad0_c2[2] | alloc_lru_quad0_c2[3]) ) | 
          ( lru_state_quad0[3] & ~alloc_lru_quad0_c2[3] ) ) ;  // BS & SR 10/28/03
 
assign  alloc_quad0_tagsel_c2[1] =   alloc_lru_quad0_c2[1] & 
          ( lru_state_quad0[1]  | 
          ( lru_state_quad0[2] & ~( alloc_lru_quad0_c2[2] | alloc_lru_quad0_c2[3] |  alloc_lru_quad0_c2[0] )) | 
          ( lru_state_quad0[3] & ~( alloc_lru_quad0_c2[3] | alloc_lru_quad0_c2[0] )) | 
          ( lru_state_quad0[0] & ~alloc_lru_quad0_c2[0])  ) ;  // BS & SR 10/28/03
 
assign  alloc_quad0_tagsel_c2[2] =   alloc_lru_quad0_c2[2] & 
          ( lru_state_quad0[2]  | 
          ( lru_state_quad0[3] & ~( alloc_lru_quad0_c2[3] | alloc_lru_quad0_c2[0] | alloc_lru_quad0_c2[1] )) | 
          ( lru_state_quad0[0] & ~(alloc_lru_quad0_c2[0] |  alloc_lru_quad0_c2[1])) | 
          ( lru_state_quad0[1] & ~alloc_lru_quad0_c2[1] ) ) ; // BS & SR 10/28/03
 
assign  alloc_quad0_tagsel_c2[3] =   alloc_lru_quad0_c2[3] & 
          ( lru_state_quad0[3]  | 
          ( lru_state_quad0[0] & ~( alloc_lru_quad0_c2[0] | alloc_lru_quad0_c2[1] | alloc_lru_quad0_c2[2] )) | 
          ( lru_state_quad0[1] & ~(alloc_lru_quad0_c2[1] |  alloc_lru_quad0_c2[2])) | 
          ( lru_state_quad0[2] & ~alloc_lru_quad0_c2[2] ) ) ; // BS & SR 10/28/03
 
 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_used_lru_quad0  // BS & SR 10/28/03
		(.dout (lru_quad0_tagsel_c2[3:0]), 
                            .din0(used_quad0_tagsel_c2[3:0]), 
                            .din1(alloc_quad0_tagsel_c2[3:0]), 
                            .sel0(sel_unvuad_used_c2), 
                            .sel1(~sel_unvuad_used_c2)); 
 
 
assign	lru_quad0_muxsel_c2[2:0] = lru_quad0_tagsel_c2[2:0] ; // BS & SR Int 5.0 changes
assign	lru_quad0_muxsel_c2[3] = ~(lru_quad0_tagsel_c2[2] | lru_quad0_tagsel_c2[1] | lru_quad0_tagsel_c2[0]) ; // BS & SR Int 5.0 changes

 
/************ LRU way within Quad1 ************************/ 
 
 
assign  used_quad1_tagsel_c2[0] =   used_lru_quad1_c2[0] & 
          ( lru_state_quad1[0]  | 
          ( lru_state_quad1[1] & ~( used_lru_quad1_c2[1] | used_lru_quad1_c2[2] | used_lru_quad1_c2[3] ) ) | 
          ( lru_state_quad1[2] & ~(used_lru_quad1_c2[2] | used_lru_quad1_c2[3] ) ) |
          ( lru_state_quad1[3] & ~(used_lru_quad1_c2[3]) ) ) ; // BS & SR 10/28/03
 
assign  used_quad1_tagsel_c2[1] =   used_lru_quad1_c2[1] & 
          ( lru_state_quad1[1]  | 
          ( lru_state_quad1[2] & ~( used_lru_quad1_c2[2] | used_lru_quad1_c2[3] | used_lru_quad1_c2[0] )) | 
          ( lru_state_quad1[3] & ~( used_lru_quad1_c2[3] | used_lru_quad1_c2[0] )) | 
          ( lru_state_quad1[0] & ~used_lru_quad1_c2[0])  ) ; // BS & SR 10/28/03
 
assign  used_quad1_tagsel_c2[2] =   used_lru_quad1_c2[2] & 
          ( lru_state_quad1[2]  | 
          ( lru_state_quad1[3] & ~( used_lru_quad1_c2[3] | used_lru_quad1_c2[0] | used_lru_quad1_c2[1] )) | 
          ( lru_state_quad1[0] & ~(used_lru_quad1_c2[0] |  used_lru_quad1_c2[1])) | 
          ( lru_state_quad1[1] & ~used_lru_quad1_c2[1] ) ) ; // BS & SR 10/28/03
                
assign  used_quad1_tagsel_c2[3] =   used_lru_quad1_c2[3] & 
          ( lru_state_quad1[3]  | 
          ( lru_state_quad1[0] & ~( used_lru_quad1_c2[0] | used_lru_quad1_c2[1] | used_lru_quad1_c2[2] )) | 
          ( lru_state_quad1[1] & ~(used_lru_quad1_c2[1] |  used_lru_quad1_c2[2])) | 
          ( lru_state_quad1[2] & ~used_lru_quad1_c2[2] ) ) ; // BS & SR 10/28/03



 
assign  alloc_quad1_tagsel_c2[0] =   alloc_lru_quad1_c2[0] & 
          ( lru_state_quad1[0]  | 
          ( lru_state_quad1[1] & ~( alloc_lru_quad1_c2[1] | alloc_lru_quad1_c2[2] | alloc_lru_quad1_c2[3] ) ) | 
          ( lru_state_quad1[2] & ~( alloc_lru_quad1_c2[2] | alloc_lru_quad1_c2[3] ) ) | 
          ( lru_state_quad1[3] & ~alloc_lru_quad1_c2[3] ) ) ; // BS & SR 10/28/03
 
assign  alloc_quad1_tagsel_c2[1] =   alloc_lru_quad1_c2[1] & 
          ( lru_state_quad1[1]  | 
          ( lru_state_quad1[2] & ~( alloc_lru_quad1_c2[2] | alloc_lru_quad1_c2[3] | alloc_lru_quad1_c2[0] )) | 
          ( lru_state_quad1[3] & ~( alloc_lru_quad1_c2[3] | alloc_lru_quad1_c2[0] ) ) | 
          ( lru_state_quad1[0] & ~alloc_lru_quad1_c2[0])  ) ; // BS & SR 10/28/03
 
assign  alloc_quad1_tagsel_c2[2] =   alloc_lru_quad1_c2[2] & 
          ( lru_state_quad1[2]  | 
          ( lru_state_quad1[3] & ~( alloc_lru_quad1_c2[3] | alloc_lru_quad1_c2[0] | alloc_lru_quad1_c2[1] ) ) |
          ( lru_state_quad1[0] & ~(alloc_lru_quad1_c2[0] |  alloc_lru_quad1_c2[1])) | 
          ( lru_state_quad1[1] & ~alloc_lru_quad1_c2[1] ) ) ; // BS & SR 10/28/03
 
assign  alloc_quad1_tagsel_c2[3] =   alloc_lru_quad1_c2[3] & 
          ( lru_state_quad1[3]  | 
          ( lru_state_quad1[0] & ~( alloc_lru_quad1_c2[0] | alloc_lru_quad1_c2[1] | alloc_lru_quad1_c2[2] ) ) |
          ( lru_state_quad1[1] & ~(alloc_lru_quad1_c2[2] |  alloc_lru_quad1_c2[1])) | 
          ( lru_state_quad1[2] & ~alloc_lru_quad1_c2[2] ) ) ; // BS & SR 10/28/03
 

 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_used_lru_quad1   // BS & SR 10/28/03
		(.dout (lru_quad1_tagsel_c2[3:0]), 
                            .din0(used_quad1_tagsel_c2[3:0]), 
                            .din1(alloc_quad1_tagsel_c2[3:0]), 
                            .sel0(sel_unvuad_used_c2), 
                            .sel1(~sel_unvuad_used_c2)); 
 
 
assign  lru_quad1_muxsel_c2[2:0] = lru_quad1_tagsel_c2[2:0] ; // BS & SR Int 5.0 changes
assign  lru_quad1_muxsel_c2[3] = ~(lru_quad1_tagsel_c2[2] | lru_quad1_tagsel_c2[1] | lru_quad1_tagsel_c2[0]) ; // BS & SR Int 5.0 changes

/************ LRU way within Quad2 ************************/ 
 
 
assign  used_quad2_tagsel_c2[0] =   used_lru_quad2_c2[0] & 
          ( lru_state_quad2[0]  | 
          ( lru_state_quad2[1] & ~( used_lru_quad2_c2[1] | used_lru_quad2_c2[2] | used_lru_quad2_c2[3] ) ) | 
          ( lru_state_quad2[2] & ~( used_lru_quad2_c2[2] | used_lru_quad2_c2[3] ) ) | 
          ( lru_state_quad2[3] & ~used_lru_quad2_c2[3] ) ) ; // BS & SR 10/28/03
 
assign  used_quad2_tagsel_c2[1] =   used_lru_quad2_c2[1] & 
          ( lru_state_quad2[1]  | 
          ( lru_state_quad2[2] & ~( used_lru_quad2_c2[2] | used_lru_quad2_c2[3] | used_lru_quad2_c2[0] )) | 
	  ( lru_state_quad2[3] & ~( used_lru_quad2_c2[3] | used_lru_quad2_c2[0] ) ) |
          ( lru_state_quad2[0] & ~used_lru_quad2_c2[0])  ) ; // BS & SR 10/28/03
 
assign  used_quad2_tagsel_c2[2] =   used_lru_quad2_c2[2] & 
          ( lru_state_quad2[2]  | 
          ( lru_state_quad2[3] & ~(used_lru_quad2_c2[0] |  used_lru_quad2_c2[1] | used_lru_quad2_c2[3])) | 
          ( lru_state_quad2[0] & ~(used_lru_quad2_c2[0] |  used_lru_quad2_c2[1])) | 
          ( lru_state_quad2[1] & ~used_lru_quad2_c2[1] ) ) ; // BS & SR 10/28/03

assign  used_quad2_tagsel_c2[3] =   used_lru_quad2_c2[3] & 
          ( lru_state_quad2[3]  | 
          ( lru_state_quad2[0] & ~(used_lru_quad2_c2[0] |  used_lru_quad2_c2[1] | used_lru_quad2_c2[2])) | 
          ( lru_state_quad2[1] & ~(used_lru_quad2_c2[2] |  used_lru_quad2_c2[1])) | 
          ( lru_state_quad2[2] & ~used_lru_quad2_c2[2] ) ) ; // BS & SR 10/28/03

 
assign  alloc_quad2_tagsel_c2[0] =   alloc_lru_quad2_c2[0] & 
          ( lru_state_quad2[0]  | 
          ( lru_state_quad2[1] & ~( alloc_lru_quad2_c2[1] | alloc_lru_quad2_c2[2] | alloc_lru_quad2_c2[3] ) ) | 
          ( lru_state_quad2[2] & ~( alloc_lru_quad2_c2[2] | alloc_lru_quad2_c2[3] ) ) | 
          ( lru_state_quad2[3] & ~alloc_lru_quad2_c2[3] ) ) ; // BS & SR 10/28/03
 
assign  alloc_quad2_tagsel_c2[1] =   alloc_lru_quad2_c2[1] & 
          ( lru_state_quad2[1]  | 
          ( lru_state_quad2[2] & ~( alloc_lru_quad2_c2[2] | alloc_lru_quad2_c2[0] | alloc_lru_quad2_c2[3])) | 
          ( lru_state_quad2[3] & ~( alloc_lru_quad2_c2[3] | alloc_lru_quad2_c2[0] )) | 
          ( lru_state_quad2[0] & ~alloc_lru_quad2_c2[0])  ) ; // BS & SR 10/28/03
 
assign  alloc_quad2_tagsel_c2[2] =   alloc_lru_quad2_c2[2] & 
          ( lru_state_quad2[2]  | 
          ( lru_state_quad2[3] & ~(alloc_lru_quad2_c2[3] |  alloc_lru_quad2_c2[1] | alloc_lru_quad2_c2[0] )) | 
          ( lru_state_quad2[0] & ~(alloc_lru_quad2_c2[0] |  alloc_lru_quad2_c2[1] )) | 
          ( lru_state_quad2[1] & ~alloc_lru_quad2_c2[1] ) ) ; // BS & SR 10/28/03
 
assign  alloc_quad2_tagsel_c2[3] =   alloc_lru_quad2_c2[3] & 
          ( lru_state_quad2[3]  | 
          ( lru_state_quad2[0] & ~(alloc_lru_quad2_c2[2] |  alloc_lru_quad2_c2[1] | alloc_lru_quad2_c2[0] )) | 
          ( lru_state_quad2[1] & ~(alloc_lru_quad2_c2[2] |  alloc_lru_quad2_c2[1] )) | 
          ( lru_state_quad2[2] & ~alloc_lru_quad2_c2[2] ) ) ; // BS & SR 10/28/03
 
 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_used_lru_quad2  // BS & SR 10/28/03
		(.dout (lru_quad2_tagsel_c2[3:0]), 
                            .din0(used_quad2_tagsel_c2[3:0]), 
                            .din1(alloc_quad2_tagsel_c2[3:0]), 
                            .sel0(sel_unvuad_used_c2), 
                            .sel1(~sel_unvuad_used_c2)); 
 
 
assign  lru_quad2_muxsel_c2[2:0] = lru_quad2_tagsel_c2[2:0] ; // BS & SR Int 5.0 changes
assign  lru_quad2_muxsel_c2[3] = ~(lru_quad2_tagsel_c2[2] | lru_quad2_tagsel_c2[1] | lru_quad2_tagsel_c2[0]) ; // BS & SR Int 5.0 changes
 
/************ LRU way within Quad3 ************************/ 
 
 
assign  used_quad3_tagsel_c2[0] =   used_lru_quad3_c2[0] & 
          ( lru_state_quad3[0]  | 
          ( lru_state_quad3[1] & ~( used_lru_quad3_c2[1] | used_lru_quad3_c2[2] | used_lru_quad3_c2[3] ) ) | 
          ( lru_state_quad3[2] & ~( used_lru_quad3_c2[3] | used_lru_quad3_c2[2] ) ) | 
          ( lru_state_quad3[3] & ~used_lru_quad3_c2[3] ) ) ; // BS & SR 10/28/03
 
assign  used_quad3_tagsel_c2[1] =   used_lru_quad3_c2[1] & 
          ( lru_state_quad3[1]  | 
          ( lru_state_quad3[2] & ~( used_lru_quad3_c2[2] | used_lru_quad3_c2[0] | used_lru_quad3_c2[3] )) | 
          ( lru_state_quad3[3] & ~( used_lru_quad3_c2[3] | used_lru_quad3_c2[0] )) | 
          ( lru_state_quad3[0] & ~used_lru_quad3_c2[0])  ) ; // BS & SR 10/28/03
 
assign  used_quad3_tagsel_c2[2] =   used_lru_quad3_c2[2] & 
          ( lru_state_quad3[2]  | 
          ( lru_state_quad3[3] & ~(used_lru_quad3_c2[0] |  used_lru_quad3_c2[1] | used_lru_quad3_c2[3] )) | 
          ( lru_state_quad3[0] & ~(used_lru_quad3_c2[0] |  used_lru_quad3_c2[1])) | 
          ( lru_state_quad3[1] & ~used_lru_quad3_c2[1] ) ) ; // BS & SR 10/28/03
                
assign  used_quad3_tagsel_c2[3] =   used_lru_quad3_c2[3] & 
          ( lru_state_quad3[3]  | 
          ( lru_state_quad3[0] & ~(used_lru_quad3_c2[0] |  used_lru_quad3_c2[1] | used_lru_quad3_c2[2] )) | 
          ( lru_state_quad3[1] & ~(used_lru_quad3_c2[1] |  used_lru_quad3_c2[2])) | 
          ( lru_state_quad3[2] & ~used_lru_quad3_c2[2] ) ) ; // BS & SR 10/28/03
 

assign  alloc_quad3_tagsel_c2[0] =   alloc_lru_quad3_c2[0] & 
          ( lru_state_quad3[0]  | 
          ( lru_state_quad3[1] & ~( alloc_lru_quad3_c2[1] | alloc_lru_quad3_c2[2] | alloc_lru_quad3_c2[3] ) ) | 
          ( lru_state_quad3[2] & ~( alloc_lru_quad3_c2[3] | alloc_lru_quad3_c2[2] ) ) | 
          ( lru_state_quad3[3] & ~alloc_lru_quad3_c2[3] ) ) ; // BS & SR 10/28/03
 
assign  alloc_quad3_tagsel_c2[1] =   alloc_lru_quad3_c2[1] & 
          ( lru_state_quad3[1]  | 
          ( lru_state_quad3[2] & ~( alloc_lru_quad3_c2[2] | alloc_lru_quad3_c2[0] | alloc_lru_quad3_c2[3]  )) | 
          ( lru_state_quad3[3] & ~( alloc_lru_quad3_c2[3] | alloc_lru_quad3_c2[0] )) | 
          ( lru_state_quad3[0] & ~alloc_lru_quad3_c2[0])  ) ; // BS & SR 10/28/03
 
assign  alloc_quad3_tagsel_c2[2] =   alloc_lru_quad3_c2[2] & 
          ( lru_state_quad3[2]  | 
          ( lru_state_quad3[3] & ~(alloc_lru_quad3_c2[3] |  alloc_lru_quad3_c2[1] | alloc_lru_quad3_c2[0])) | 
          ( lru_state_quad3[0] & ~(alloc_lru_quad3_c2[0] |  alloc_lru_quad3_c2[1])) | 
          ( lru_state_quad3[1] & ~alloc_lru_quad3_c2[1] ) ) ; // BS & SR 10/28/03
 
assign  alloc_quad3_tagsel_c2[3] =   alloc_lru_quad3_c2[3] & 
          ( lru_state_quad3[3]  | 
          ( lru_state_quad3[0] & ~(alloc_lru_quad3_c2[0] |  alloc_lru_quad3_c2[1] | alloc_lru_quad3_c2[2])) | 
          ( lru_state_quad3[1] & ~(alloc_lru_quad3_c2[1] |  alloc_lru_quad3_c2[2])) | 
          ( lru_state_quad3[2] & ~alloc_lru_quad3_c2[2] ) ) ; // BS & SR 10/28/03
 
 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_used_lru_quad3  // BS & SR 10/28/03
		(.dout (lru_quad3_tagsel_c2[3:0]), 
                            .din0(used_quad3_tagsel_c2[3:0]), 
                            .din1(alloc_quad3_tagsel_c2[3:0]), 
                            .sel0(sel_unvuad_used_c2), 
                            .sel1(~sel_unvuad_used_c2)); 
 
 
assign  lru_quad3_muxsel_c2[2:0] = lru_quad3_tagsel_c2[2:0] ; // BS & SR Int 5.0 changes
assign  lru_quad3_muxsel_c2[3] = ~(lru_quad3_tagsel_c2[2] | lru_quad3_tagsel_c2[1] | lru_quad3_tagsel_c2[0]) ; // BS & SR Int 5.0 changes

/************ LRU  quad ************************/ 
 
 
assign  used_quad_sel_c2[0] =   used_lru_quad_c2[0] & 
          ( lru_state[0]  | 
          ( lru_state[1] & ~( used_lru_quad_c2[1] | used_lru_quad_c2[2] | used_lru_quad_c2[3] )) | 
          ( lru_state[2] & ~( used_lru_quad_c2[2] | used_lru_quad_c2[3] )) | 
          ( lru_state[3] & ~(used_lru_quad_c2[3] ))  ) ; 
 
assign  used_quad_sel_c2[1] =   used_lru_quad_c2[1] & 
          ( lru_state[1]  | 
          ( lru_state[2] & ~( used_lru_quad_c2[0] | used_lru_quad_c2[2] | used_lru_quad_c2[3] )) | 
          ( lru_state[3] & ~( used_lru_quad_c2[3] | used_lru_quad_c2[0] )) | 
          ( lru_state[0] & ~(used_lru_quad_c2[0] ))  ) ; 
 
assign  used_quad_sel_c2[2] =   used_lru_quad_c2[2] & 
          ( lru_state[2]  | 
          ( lru_state[3] & ~( used_lru_quad_c2[0] | used_lru_quad_c2[1] | used_lru_quad_c2[3] )) | 
          ( lru_state[0] & ~( used_lru_quad_c2[0] | used_lru_quad_c2[1] )) | 
          ( lru_state[1] & ~(used_lru_quad_c2[1] ))  ) ; 
 
assign  used_quad_sel_c2[3] =   used_lru_quad_c2[3] & 
          ( lru_state[3]  | 
          ( lru_state[0] & ~( used_lru_quad_c2[0] | used_lru_quad_c2[1] | used_lru_quad_c2[2] )) | 
          ( lru_state[1] & ~( used_lru_quad_c2[2] | used_lru_quad_c2[1] )) | 
          ( lru_state[2] & ~(used_lru_quad_c2[2] ))  ) ; 
 
 
assign  alloc_quad_sel_c2[0] =   alloc_lru_quad_c2[0] & 
          ( lru_state[0]  | 
          ( lru_state[1] & ~( alloc_lru_quad_c2[1] | alloc_lru_quad_c2[2] | alloc_lru_quad_c2[3] )) | 
          ( lru_state[2] & ~( alloc_lru_quad_c2[2] | alloc_lru_quad_c2[3] )) | 
          ( lru_state[3] & ~(alloc_lru_quad_c2[3] ))  ) ; 
 
assign  alloc_quad_sel_c2[1] =   alloc_lru_quad_c2[1] & 
          ( lru_state[1]  | 
          ( lru_state[2] & ~( alloc_lru_quad_c2[0] | alloc_lru_quad_c2[2] | alloc_lru_quad_c2[3] )) | 
          ( lru_state[3] & ~( alloc_lru_quad_c2[3] | alloc_lru_quad_c2[0] )) | 
          ( lru_state[0] & ~(alloc_lru_quad_c2[0] ))  ) ; 
 
assign  alloc_quad_sel_c2[2] =   alloc_lru_quad_c2[2] & 
          ( lru_state[2]  | 
          ( lru_state[3] & ~( alloc_lru_quad_c2[0] | alloc_lru_quad_c2[1] | alloc_lru_quad_c2[3] )) | 
          ( lru_state[0] & ~( alloc_lru_quad_c2[0] | alloc_lru_quad_c2[1] )) | 
          ( lru_state[1] & ~(alloc_lru_quad_c2[1] ))  ) ; 
 
assign  alloc_quad_sel_c2[3] =   alloc_lru_quad_c2[3] & 
          ( lru_state[3]  | 
          ( lru_state[0] & ~( alloc_lru_quad_c2[0] | alloc_lru_quad_c2[1] | alloc_lru_quad_c2[2] )) | 
          ( lru_state[1] & ~( alloc_lru_quad_c2[2] | alloc_lru_quad_c2[1] )) | 
          ( lru_state[2] & ~(alloc_lru_quad_c2[2] ))  ) ; 
 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_used_lru_quad 
		(.dout (lru_quad_sel_c2[3:0]), 
                            .din0(used_quad_sel_c2[3:0]), 
                            .din1(alloc_quad_sel_c2[3:0]), 
                            .sel0(sel_unvuad_used_c2), 
                            .sel1(~sel_unvuad_used_c2)); 
 

assign  lru_quad_muxsel_c2[2:0] = lru_quad_sel_c2[2:0] ; // BS & SR Int 5.0 changes
assign  lru_quad_muxsel_c2[3] = ~(lru_quad_sel_c2[2] | lru_quad_sel_c2[1] | lru_quad_sel_c2[0]) ; // BS & SR Int 5.0 changes

// lru_way_sel_c2 takes 14-15 gates to compute. 
assign	lru_way_sel_c2[3:0]   = lru_quad0_tagsel_c2 & {4{lru_quad_sel_c2[0]}} ; // BS & SR 10/28/03
assign	lru_way_sel_c2[7:4]   = lru_quad1_tagsel_c2 & {4{lru_quad_sel_c2[1]}} ; // BS & SR 10/28/03
assign	lru_way_sel_c2[11:8]  = lru_quad2_tagsel_c2 & {4{lru_quad_sel_c2[2]}} ; // BS & SR 10/28/03
assign	lru_way_sel_c2[15:12] = lru_quad3_tagsel_c2 & {4{lru_quad_sel_c2[3]}} ; // BS & SR 10/28/03
 
 
assign	dec_lo_dir_way_c2[0] = ( arbadr_arbdp_diag_wr_way_c2[1:0]==2'd0 ) ; 
assign	dec_lo_dir_way_c2[1] = ( arbadr_arbdp_diag_wr_way_c2[1:0]==2'd1 ) ; 
assign	dec_lo_dir_way_c2[2] = ( arbadr_arbdp_diag_wr_way_c2[1:0]==2'd2 ) ; 
assign	dec_lo_dir_way_c2[3] = ( arbadr_arbdp_diag_wr_way_c2[1:0]==2'd3 ) ; 
 
 
assign	dec_hi_dir_way_c2[0] = ( arbadr_arbdp_diag_wr_way_c2[3:2]==2'd0 ) ; 
assign	dec_hi_dir_way_c2[1] = ( arbadr_arbdp_diag_wr_way_c2[3:2]==2'd1 ) ; 
assign	dec_hi_dir_way_c2[2] = ( arbadr_arbdp_diag_wr_way_c2[3:2]==2'd2 ) ; 
assign	dec_hi_dir_way_c2[3] = ( arbadr_arbdp_diag_wr_way_c2[3:2]==2'd3 ) ; 
 
 
assign	dec_dir_way_c2[0] = dec_hi_dir_way_c2[0] & dec_lo_dir_way_c2[0] ; // 0000 
assign	dec_dir_way_c2[1] = dec_hi_dir_way_c2[0] & dec_lo_dir_way_c2[1] ; // 0001 
assign	dec_dir_way_c2[2] = dec_hi_dir_way_c2[0] & dec_lo_dir_way_c2[2] ; // 0010 
assign	dec_dir_way_c2[3] = dec_hi_dir_way_c2[0] & dec_lo_dir_way_c2[3] ; // 0011 // BS & SR 10/28/03
assign  dec_dir_way_c2[4] = dec_hi_dir_way_c2[1] & dec_lo_dir_way_c2[0] ; // 0100
assign  dec_dir_way_c2[5] = dec_hi_dir_way_c2[1] & dec_lo_dir_way_c2[1] ; // 0101 // BS & SR 10/28/03
assign  dec_dir_way_c2[6] = dec_hi_dir_way_c2[1] & dec_lo_dir_way_c2[2] ; // 0110 
assign  dec_dir_way_c2[7] = dec_hi_dir_way_c2[1] & dec_lo_dir_way_c2[3] ; // 0111 // BS & SR 10/28/03
assign	dec_dir_way_c2[8] = dec_hi_dir_way_c2[2] & dec_lo_dir_way_c2[0] ; // 1000 
assign	dec_dir_way_c2[9] = dec_hi_dir_way_c2[2] & dec_lo_dir_way_c2[1] ; // 1001 
assign	dec_dir_way_c2[10] = dec_hi_dir_way_c2[2] & dec_lo_dir_way_c2[2] ; // 1010 
assign	dec_dir_way_c2[11] = dec_hi_dir_way_c2[2] & dec_lo_dir_way_c2[3] ; // 1011 
assign	dec_dir_way_c2[12] = dec_hi_dir_way_c2[3] & dec_lo_dir_way_c2[0] ; // 1100 // BS & SR 10/28/03
assign	dec_dir_way_c2[13] = dec_hi_dir_way_c2[3] & dec_lo_dir_way_c2[1] ; // 1101 // BS & SR 10/28/03
assign	dec_dir_way_c2[14] = dec_hi_dir_way_c2[3] & dec_lo_dir_way_c2[2] ; // 1110 // BS & SR 10/28/03
assign	dec_dir_way_c2[15] = dec_hi_dir_way_c2[3] & dec_lo_dir_way_c2[3] ; // 1111 // BS & SR 10/28/03


// BS 06/24/04 : support for Prefetch ICE.
// In case evict instruction is a Prefetch ICE, pick way from 21:18 of the address itself

assign sel_dir_way = (arb_pf_ice_evict_vld_c2 | l2_dir_map_on_d1);
 
 
l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_16 mux_evict_way_sel_c2 // BS & SR 10/28/03
              (.dout (evict_way_sel_c2[15:0]), 
               .din0  (dec_dir_way_c2[15:0]),  .sel0 (sel_dir_way), 
               .din1  (lru_way_sel_c2[15:0]),  .sel1 (~sel_dir_way) 
              ) ; 
 
 
l2t_tagdp_ctl_msff_ctl_macro__width_16 ff_lru_way_c3 // BS & SR 10/28/03
                           (.din(evict_way_sel_c2[15:0]), 
                               .scan_in(ff_lru_way_c3_scanin),
                               .scan_out(ff_lru_way_c3_scanout),
                               .l1clk(l1clk), 
                               .dout(tagdp_lru_way_sel_c3[15:0]),
  .siclk(siclk),
  .soclk(soclk) 
                               
                               
); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_16 ff_lru_way_c3_1 // BS & SR 10/28/03
                           (.din(evict_way_sel_c2[15:0]), 
                               .scan_in(ff_lru_way_c3_1_scanin),
                               .scan_out(ff_lru_way_c3_1_scanout),
                               .l1clk(l1clk), 
                               .dout(lru_way_sel_c3_1[15:0]),
  .siclk(siclk),
  .soclk(soclk) 
                               
                               
); 
 
l2t_tagdp_ctl_msff_ctl_macro__width_16 ff_valid_c3 // BS & SR 10/28/03
                           (.din(vlddir_vuad_valid_c2[15:0]), 
                               .scan_in(ff_valid_c3_scanin),
                               .scan_out(ff_valid_c3_scanout),
                               .l1clk(l1clk), 
                               .dout(valid_c3[15:0]),
  .siclk(siclk),
  .soclk(soclk) 
                               
                               
); 
 
assign	pick_quad0 = |(lru_way_sel_c3_1[3:0]  ) ; // BS & SR 10/28/03
assign	pick_quad1 = |(lru_way_sel_c3_1[7:4]  ) ; // BS & SR 10/28/03
assign	pick_quad2 = |(lru_way_sel_c3_1[11:8] ) ; // BS & SR 10/28/03
assign	pick_quad3 = |(lru_way_sel_c3_1[15:12]) ; // BS & SR 10/28/03
 
 
// fixscan start:
assign spares_scanin             = scan_in                  ;
assign ff_tagdp_vuad_dp_diag_data_c7_scanin = spares_scanout           ;
assign reset_flop_scanin         = ff_tagdp_vuad_dp_diag_data_c7_scanout;
assign ff_evict_c3_1_scanin      = reset_flop_scanout       ;
assign ff_evict_c3_2_scanin      = ff_evict_c3_1_scanout    ;
assign ff_tagd_par_err_c3_scanin = ff_evict_c3_2_scanout    ;
assign ff_tagd_par_err_c3_2_scanin = ff_tagd_par_err_c3_scanout;
assign ff_tagdp_misbuf_par_err_c3_scanin = ff_tagd_par_err_c3_2_scanout;
assign ff_tagdp_tag_par_err_c3_scanin = ff_tagdp_misbuf_par_err_c3_scanout;
assign ff_tagdp_arb_par_err_c3_scanin = ff_tagdp_tag_par_err_c3_scanout;
assign ff_tagd_par_err_c4_scanin = ff_tagdp_arb_par_err_c3_scanout;
assign ff_tagd_par_err_c5_scanin = ff_tagd_par_err_c4_scanout;
assign ff_tagd_par_err_c52_scanin = ff_tagd_par_err_c5_scanout;
assign ff_tag_error_c6_scanin    = ff_tagd_par_err_c52_scanout;
assign ff_tag_error_c7_scanin    = ff_tag_error_c6_scanout  ;
assign ff_tag_error_c8_scanin    = ff_tag_error_c7_scanout  ;
assign ff_l2_dir_map_on_d1_scanin = ff_tag_error_c8_scanout  ;
assign ff_diag_way_c3_scanin     = ff_l2_dir_map_on_d1_scanout;
assign ff_diag_way_c4_scanin     = ff_diag_way_c3_scanout   ;
assign ff_lru_quad_muxsel_c2_scanin = ff_diag_way_c4_scanout   ;
assign ff_bist_way_c1_scanin     = ff_lru_quad_muxsel_c2_scanout;
assign ff_bist_way_c2_scanin     = ff_bist_way_c1_scanout   ;
assign ff_bist_enable_c1_scanin  = ff_bist_way_c2_scanout   ;
assign ff_bist_enable_c2_scanin  = ff_bist_enable_c1_scanout;
assign ff_mbist_run_scanin       = ff_bist_enable_c2_scanout;
assign ff_use_dec_sel_c3_scanin  = ff_mbist_run_scanout     ;
assign ff_tag_quad0_muxsel_c2_scanin = ff_use_dec_sel_c3_scanout;
assign ff_tag_quad1_muxsel_c2_scanin = ff_tag_quad0_muxsel_c2_scanout;
assign ff_tag_quad2_muxsel_c2_scanin = ff_tag_quad1_muxsel_c2_scanout;
assign ff_tag_quad3_muxsel_c2_scanin = ff_tag_quad2_muxsel_c2_scanout;
assign ff_dir_quad_way_c3_scanin = ff_tag_quad3_muxsel_c2_scanout;
assign ff_lru_state_scanin       = ff_dir_quad_way_c3_scanout;
assign ff_lru_state_quad0_scanin = ff_lru_state_scanout     ;
assign ff_lru_state_quad1_scanin = ff_lru_state_quad0_scanout;
assign ff_lru_state_quad2_scanin = ff_lru_state_quad1_scanout;
assign ff_lru_state_quad3_scanin = ff_lru_state_quad2_scanout;
assign ff_spec_alloc_c3_scanin   = ff_lru_state_quad3_scanout;
assign ff_lru_way_c3_scanin      = ff_spec_alloc_c3_scanout ;
assign ff_lru_way_c3_1_scanin    = ff_lru_way_c3_scanout    ;
assign ff_valid_c3_scanin        = ff_lru_way_c3_1_scanout  ;
assign scan_out                  = ff_valid_c3_scanout      ;
// fixscan end:
endmodule 







// any PARAMS parms go into naming of macro

module l2t_tagdp_ctl_l1clkhdr_ctl_macro (
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


module l2t_tagdp_ctl_spare_ctl_macro__num_4 (
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

module l2t_tagdp_ctl_msff_ctl_macro__width_39 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [38:0] fdin;
wire [37:0] so;

  input [38:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [38:0] dout;
  output scan_out;
assign fdin[38:0] = din[38:0];






dff #(39)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[38:0]),
.si({scan_in,so[37:0]}),
.so({so[37:0],scan_out}),
.q(dout[38:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_tagdp_ctl_msff_ctl_macro__width_1 (
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

module l2t_tagdp_ctl_msff_ctl_macro__dmsff_32x__width_2 (
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

module l2t_tagdp_ctl_msff_ctl_macro__dmsff_32x__width_1 (
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

module l2t_tagdp_ctl_msff_ctl_macro__width_4 (
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

module l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_2 (
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

module l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 (
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

module l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 (
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

module l2t_tagdp_ctl_msff_ctl_macro__width_16 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_tagdp_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_16 (
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

