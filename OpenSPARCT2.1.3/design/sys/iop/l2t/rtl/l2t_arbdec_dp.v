// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_arbdec_dp.v
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
// Local header file includes / local define 
//////////////////////////////////////////////////////////////////////// 
 
module l2t_arbdec_dp (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  snpd_snpq_arbdp_inst_px2, 
  ique_iq_arbdp_inst_px2, 
  sel_diag_store_data_c7, 
  misbuf_buf_rd_en, 
  mbdata_cmp_sel, 
  l2t_mb2_wdata, 
  mbdata_fail, 
  mbdata_fail_bot, 
  mb_data_read_data, 
  snpd_ecc_px2, 
  misbuf_arbdp_ctrue_px2, 
  misbuf_arb_l2rd_en, 
  filbuf_arbdp_entry_px2, 
  filbuf_arbdp_tecc_px2, 
  csr_l2_steering_tid, 
  filbuf_arbdp_way_px2, 
  arb_mux1_mbsel_px2, 
  arb_mux2_snpsel_px2, 
  arb_mux3_bufsel_px2, 
  arb_mux4_c1sel_px2, 
  scan_in, 
  l2clk, 
  arbadr_arbdp_byte_addr_c6, 
  scan_out, 
  arbdec_arbdp_inst_c8, 
  arbdec_snpd_ecc_c8, 
  arbdec_arbdp_inst_bufidhi_c8, 
  arbdec_pf_ice_inst_c1, 
  arbdec_arbdp_inst_way_c1, 
  arbdec_arbdp_tecc_c1, 
  arbdec_arbdp_poison_c1, 
  arbdec_arbdp_inst_mb_entry_c1, 
  arbdec_arbdp_inst_fb_c1, 
  arbdec_arbdp_inst_mb_c1, 
  arbdec_arbdp_evict_c1, 
  arbdec_arbdp_inst_rqtyp_c1, 
  arbdec_arbdp_inst_nc_c1, 
  arbdec_arbdp_inst_size_c1, 
  arbdec_arbdp_inst_bufidhi_c1, 
  arbdec_arbdp_inst_bufid1_c1, 
  arbdec_arbdp_inst_ctrue_c1, 
  arbdec_arbdp_inst_fb_c2, 
  arbdec_arbdp_inst_mb_c2, 
  arbdec_arbdp_rdma_entry_c3, 
  arbdec_arbdp_rdma_inst_c1, 
  arbdec_arbdp_inst_rsvd_c1_1, 
  arbdec_arbdp_rdma_inst_c2, 
  arbdec_arbdp_inst_dep_c2, 
  arbdec_arbdp_inst_way_c2, 
  arbdec_arbdp_inst_rqtyp_c2, 
  arbdec_arbdp_inst_bufidlo_c2, 
  arbdec_arbdp_inst_rqtyp_c6, 
  arbdec_arbdp_inst_way_c3, 
  arbdec_arbdp_inst_mb_c3, 
  arbdec_arbdp_inst_tecc_c3, 
  arbdec_arbdp_inst_nc_c3, 
  arbdec_arbdp_l1way_c3, 
  arbdec_arbdp_cpuid_c2, 
  arbdec_arbdp_cpuid_c5, 
  arbdec_arbdp_int_bcast_c5, 
  arbdec_arbdp_inst_l1way_c7, 
  arbdec_arbdp_inst_size_c7, 
  st_ack_bmask, 
  arbdec_arbdp_inst_tid_c7, 
  arbdec_arbdp_inst_cpuid_c7, 
  arbdec_arbdp_inst_nc_c7, 
  arbdec_ctag_c6, 
  arbdec_size_field_c8, 
  arbdec_csr_ttype_c6, 
  arbdec_csr_vcid_c6, 
  l2t_dbg_xbar_vcid);
wire stop;
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire ff_read_mbdata_reg_inst1_scanin;
wire ff_read_mbdata_reg_inst1_scanout;
wire ff_mbdata_snp_ecc_scanin;
wire ff_mbdata_snp_ecc_scanout;
wire [6:0] mbdata_snp_ecc_px2;
wire ff_read_mbdata_reg_inst2_scanin;
wire ff_read_mbdata_reg_inst2_scanout;
wire arb_mux1_mbsel_px2_n;
wire arb_mux2_snpsel_px2_n;
wire arb_mux3_bufsel_px2_n;
wire arb_mux4_c1sel_px2_n;
wire ff_inst1_c1_scanin;
wire ff_inst1_c1_scanout;
wire [12:9] arbdp_inst_c1_rep1;
wire [19:19] arbdp_inst_c1_rep;
wire ff_inst1_c2_scanin;
wire ff_inst1_c2_scanout;
wire ff_inst1_c3_scanin;
wire ff_inst1_c3_scanout;
wire [5:0] mux1_snp_ecc_px2;
wire [5:0] mux2_snp_ecc_px2;
wire [5:0] mux3_snp_ecc_px2;
wire [5:0] mux4_snp_ecc_px2;
wire [5:0] arbdp_snp_ecc_c1;
wire ff_inst2_c1_scanin;
wire ff_inst2_c1_scanout;
wire ff_inst2_c2_scanin;
wire ff_inst2_c2_scanout;
wire [5:0] arbdp_snp_ecc_c2;
wire ff_inst2_c3_scanin;
wire ff_inst2_c3_scanout;
wire [5:0] arbdp_snp_ecc_c3;
wire ff_inst2_c4_scanin;
wire ff_inst2_c4_scanout;
wire [5:0] arbdp_snp_ecc_c4;
wire ff_inst2_c5_scanin;
wire ff_inst2_c5_scanout;
wire [5:0] arbdp_snp_ecc_c5;
wire ff_inst2_c52_scanin;
wire ff_inst2_c52_scanout;
wire [5:0] arbdp_snp_ecc_c52;
wire ff_inst2_c6_scanin;
wire ff_inst2_c6_scanout;
wire [5:0] arbdp_snp_ecc_c6;
wire ff_inst2_c7_scanin;
wire ff_inst2_c7_scanout;
wire [5:0] arbdp_snp_ecc_c7;
wire ff_inst2_c8_scanin;
wire ff_inst2_c8_scanout;
wire arbdec_arbdp_rdma_inst_c1_n;
wire [7:0] l2t_mb2_wdata_r2;
wire sel_diag_store_data_c7_n;
wire ff_inst_size_c8_scanin;
wire ff_inst_size_c8_scanout;
wire [7:0] l2t_mb2_wdata_r3;
wire sel_diag_store_data_c8;
wire sel_diag_store_data_c8_n;
wire [7:0] st_ack_bmask_unbuff;
wire [4:0] req_type_n;
wire arbdec_arbdp_inst_rsvd_c1_1_n;
wire req_type_n_1;
wire req_type_n_2;
wire its_a_load;
wire pf_ice_qual;
wire ff_mb_data_read_data0_scanin;
wire ff_mb_data_read_data0_scanout;
wire [127:64] mb_data_read_data_r1;
wire ff_mb_data_read_data1_scanin;
wire ff_mb_data_read_data1_scanout;
wire [31:0] mbdata_cmp_data;
wire mbdata_fail_unreg;
wire [7:0] l2t_mb2_wdata_r4;
wire ff_mbdata_mbist_reg_scanin;
wire ff_mbdata_mbist_reg_scanout;
wire mbdata_fail_top;
wire [7:0] l2t_mb2_wdata_r1;
wire misbuf_buf_rd_en_r1;
wire misbuf_buf_rd_en_r2;
wire mbdata_fail_top_or_bot;
wire mbdata_fail_unreg_w;
wire misbuf_buf_rd_en_r2_qual;
wire misbuf_buf_rd_en_r2_n;
wire mbdata_test_active;
 

input 		tcu_pce_ov;
input 		tcu_aclk;
input 		tcu_bclk;
input 		tcu_scan_en;
input 		tcu_clk_stop;


// snp IQ instruction fields 
input [`JBI_HDR_SZ-1:0]        snpd_snpq_arbdp_inst_px2; // grown by 1 bit since 2.0 


// IQ instruction fields 
input 	[24:0]	ique_iq_arbdp_inst_px2 ; // from iq ( no valid bit required ) , BS and SR 11/12/03 N2 Xbar Packet format
input          sel_diag_store_data_c7 ; // from tag , for diagnostic store ack cases

// Miss buffer instruction fields 
//input [`MBD_POISON:`MBD_SZ_LO] mb_data_read_data_low ; // grown by 1 bit since 2.0 , BS & SR 11/04/03, MB grows to 32 
//input [`MBD_EVICT:`MBD_TECC]  mb_data_read_data_mid; // BS & SR 11/04/03, MB grows to 32 
//input [`MBD_ECC_HI+5: `MBD_ECC_HI+1]  mb_data_read_data_hi; // BS & SR 11/04/03, MB grows to 32
//input [6:0]        mbdata_snp_ecc;  // RAS implementation 14/10/04
input           misbuf_buf_rd_en;
input   [3:2]   mbdata_cmp_sel;
input   [7:0]   l2t_mb2_wdata;
output          mbdata_fail;
input		mbdata_fail_bot;
input	[127:64]	mb_data_read_data;

/////////////////////////////

input [6:0]        snpd_ecc_px2;  // RAS implementation 14/10/04



input		misbuf_arbdp_ctrue_px2; 
input		misbuf_arb_l2rd_en ;  // from misbuf 

// Fill buffer instruction fields 
input	[2:0]	filbuf_arbdp_entry_px2; 
input		filbuf_arbdp_tecc_px2; 
input	[5:0]	csr_l2_steering_tid; // BS and SR 11/12/03 N2 Xbar Packet format change 
input	[3:0]	filbuf_arbdp_way_px2; 


input	arb_mux1_mbsel_px2; // arb 
input	arb_mux2_snpsel_px2; // arb 
input  arb_mux3_bufsel_px2; // arb 
input  arb_mux4_c1sel_px2; // arb 

input scan_in; 
input	l2clk; 

input	[2:0]	arbadr_arbdp_byte_addr_c6; // from arbaddr  // Phase 2 : SIU inteface and packet format change 2/7/04
 
 
output 				scan_out; 
output	[`L2_POISON:`L2_SZ_LO] arbdec_arbdp_inst_c8; // to mbdata. 
output	[6:0]	arbdec_snpd_ecc_c8;
output          arbdec_arbdp_inst_bufidhi_c8; // to misbuf
 
 
 output         arbdec_pf_ice_inst_c1; 
 output	[3:0]	arbdec_arbdp_inst_way_c1; 
 output		arbdec_arbdp_tecc_c1 ; // used in arb for waysel gate 
 
 output		arbdec_arbdp_poison_c1; // NEW_PIN to arbdata  
 output	[4:0]	arbdec_arbdp_inst_mb_entry_c1; // Miss Buffer entry to misbuf , BS & SR 11/04/03, MB grows to 32 
 output		arbdec_arbdp_inst_fb_c1 ; // used by arb to turn off fb hits. 
 output		arbdec_arbdp_inst_mb_c1 ; // used by arb to turn off fb hits. 
 output		arbdec_arbdp_evict_c1; // unqualled evict to arb 
 output   [`L2_RQTYP_HI:`L2_RQTYP_LO] arbdec_arbdp_inst_rqtyp_c1 ; // NEW_PIN decode 
 output   	arbdec_arbdp_inst_nc_c1 ; // NEW_PIN decode 
 output	[`L2_SZ_HI:`L2_SZ_LO] arbdec_arbdp_inst_size_c1; // NEW_PIN decode 
 output		arbdec_arbdp_inst_bufidhi_c1; 
 output		arbdec_arbdp_inst_bufid1_c1; // buf_id hi-1 
 output		arbdec_arbdp_inst_ctrue_c1; 
 
 
 
 output		arbdec_arbdp_inst_fb_c2; // output to arb for  
				 // generation of l2d wrdata mux sel. 
 output		arbdec_arbdp_inst_mb_c2;	 
 output	[1:0]	arbdec_arbdp_rdma_entry_c3; 
 output		arbdec_arbdp_rdma_inst_c1; // used in misbuf,filbuf,tag. 
 output		arbdec_arbdp_inst_rsvd_c1_1; // used in arb
 output		arbdec_arbdp_rdma_inst_c2; // used in arb. 
 output		arbdec_arbdp_inst_dep_c2; // to arb for dir cam logic 
 output	[3:0]	arbdec_arbdp_inst_way_c2; //  used in l2t_vuaddp.sv 
 output [`L2_RQTYP_HI:`L2_RQTYP_LO] arbdec_arbdp_inst_rqtyp_c2 ; // NEW_PIN decode 
 output   	arbdec_arbdp_inst_bufidlo_c2 ; // NEW_PIN decode 
 output	[`L2_RQTYP_HI:`L2_RQTYP_LO]  arbdec_arbdp_inst_rqtyp_c6 ; 
 
 
 output	[3:0]	arbdec_arbdp_inst_way_c3; // used in l2t_tag_ctl.sv 
// output		arbdec_arbdp_inst_fb_c3;  
 output 	arbdec_arbdp_inst_mb_c3;  
 output 	arbdec_arbdp_inst_tecc_c3; 
 output		arbdec_arbdp_inst_nc_c3; // L1 non allocating instruction 
 output	[1:0]	arbdec_arbdp_l1way_c3; // l1 replacement way. 
 output [2:0]   arbdec_arbdp_cpuid_c2;
 
 
 output	[2:0]	arbdec_arbdp_cpuid_c5;
 output		arbdec_arbdp_int_bcast_c5; // to oqu. 
 
 output	[1:0]	arbdec_arbdp_inst_l1way_c7; // to oque 
 output	[7:0]	arbdec_arbdp_inst_size_c7; // to oque , BS and SR 11/12/03 N2 Xbar Packet format change
 output [7:0]   st_ack_bmask; // to dirvec, BS and SR 1/30/04, Bmask for store ack including diagnostic stores
 output	[2:0]	arbdec_arbdp_inst_tid_c7; // to oque, BS and SR 11/12/03 N2 Xbar Packet format change 
 output	[2:0]	arbdec_arbdp_inst_cpuid_c7; // to oque 
 output		arbdec_arbdp_inst_nc_c7; // to oque 
 output	[31:0]	arbdec_ctag_c6; // Phase 2 : SIU inteface and packet format change 2/7/04
 
 output [1:0] 	arbdec_size_field_c8;  // used for CAS instructions compare qualification 
 
// debug changes

output	[4:0]	arbdec_csr_ttype_c6;
output	[5:0] 	arbdec_csr_vcid_c6;
output	[5:0]	l2t_dbg_xbar_vcid;
 
 
 
assign stop = tcu_clk_stop;
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;


//assign scan_out = 1'b0;

 wire	[`L2_FBF :`L2_SZ_LO] snpq_inst_px2; 
 wire	[`L2_FBF :`L2_SZ_LO] iq_inst_px2; 
 wire	[`L2_FBF :`L2_SZ_LO] fbf_inst_px2; 
 wire	[`L2_FBF :`L2_SZ_LO] mbf_inst_px2; // BS & SR 11/04/03, MB grows to 32 
 
 wire	[`L2_FBF :`L2_SZ_LO] mux1_inst_px2; // BS & SR 11/04/03, MB grows to 32 
 wire	[`L2_FBF :`L2_SZ_LO] mux2_inst_px2; // BS & SR 11/04/03, MB grows to 32 
 wire	[`L2_FBF :`L2_SZ_LO] mux3_inst_px2; // BS & SR 11/04/03, MB grows to 32 
 wire	[`L2_FBF :`L2_SZ_LO] mux4_inst_px2; // BS & SR 11/04/03, MB grows to 32 
 
 wire	[`L2_FBF :`L2_SZ_LO] arbdp_inst_c1; // BS & SR 11/04/03, MB grows to 32 
 wire	[`L2_FBF :`L2_SZ_LO] arbdp_inst_c2; // BS & SR 11/04/03, MB grows to 32 
 wire	[`L2_FBF :`L2_SZ_LO] arbdp_inst_c3; // BS & SR 11/04/03, MB grows to 32 
 
 wire	[`L2_POISON :`L2_SZ_LO] arbdp_inst_c4; 
 wire	[`L2_POISON :`L2_SZ_LO] arbdp_inst_c5; 
 wire   [`L2_POISON :`L2_SZ_LO] arbdp_inst_c52; // BS 03/11/04 extra cycle for mem access
 wire	[`L2_POISON :`L2_SZ_LO] arbdp_inst_c6; 
 wire	[`L2_POISON :`L2_SZ_LO] arbdp_inst_c7; 
 
 wire   [7:0]   arbdec_arbdp_inst_size_c8; // BS and SR 1/30/04, Bmask for store ack including diagnostic stores
 

//
// Congestion made me move this logic 
//

wire [`MBD_POISON:`MBD_SZ_LO] 		mb_data_read_data_low; 
wire [`MBD_EVICT:`MBD_TECC]  		mb_data_read_data_mid; 
wire [`MBD_ECC_HI+5: `MBD_ECC_HI+1]  	mb_data_read_data_hi;
wire [6:0]        			mbdata_snp_ecc;  

assign mb_data_read_data_low[`MBD_POISON:`MBD_SZ_LO] 	= mb_data_read_data[`MBD_POISON:`MBD_SZ_LO];	
assign mb_data_read_data_mid[`MBD_EVICT:`MBD_TECC] = mb_data_read_data[`MBD_EVICT:`MBD_TECC];
assign mb_data_read_data_hi[`MBD_ECC_HI+5: `MBD_ECC_HI+1] =mb_data_read_data[`MBD_ECC_HI+5: `MBD_ECC_HI+1]; 	
assign mbdata_snp_ecc[6:0]  = mb_data_read_data[117:111];
 
////////////////////////////////////////////////////////////////////////////////////// 
// INSTRUCTION FIELDS		MBF	FBF	SNP			IQ/PCX 
////////////////////////////////////////////////////////////////////////////////////// 
//	L2_FBF			0	1	0			0 
//	L2_MBF			1	0	0			0 
//	L2_SNP			0	0	1			0 
//	L2_CTRUE		V	0	0			0 
//	L2_EVICT		V	0	0			0 
//	L2_DEP			V	0	0			0 
//	L2_TECC			V	V	0			0 
//	L2_ENTRY<4:0>		mbid	fbid // BS & SR 11/04/03, MB grows to 32 
// 	L2_POISON		0	0	V			0 
//	L2_RDMA<1:0>		V	0	V			0 
//	L2_RQTYP<4:0>		V**	1F   {1'b0,"O", req<2:0>}	V // Phase 2 : SIU inteface and packet format change 2/7/04 
//	L2_NC			V	0	0			V // Phase 2 : SIU inteface and packet format change 2/7/04 
//	L2_RSVD			0	0	1			0 
//	L2_CPUID<2:0>		V**	0***	"PES" bits			V // Phase 2 : SIU inteface and packet format change 2/7/04 
// 	L2_TID<2:0>		V	0***	ctag<15:13>		V //BS and SR 11/12/03 N2 Xbar Packet formaT
//	L2_BUFID<2:0>		rsvd	X	ctag<12:10>		rsvd // Phase 2 : SIU inteface and packet format change 2/7/04 
//	L2_L1WY<1:0>		V	X	ctag<9:8>		V // Phase 2 : SIU inteface and packet format change 2/7/04 
//	L2_SZ_HI<7:0>		V	X	V/ctag7:0		V BS and SR 11/12/03 N2 Xbar Packet forma // Phase 2 : SIU inteface and packet format change 2/7/04
////////////////////////////////////////////////////////////////////////////////////// 
// snoop instuction bits [40:0]. 
// // Phase 2 : SIU inteface and packet format change 2/7/04
// instruction format is as follows
//          WRI         RDD             WR8
// 0-15 : tag[15:0]     tag[15:0]       {8'bdontcare, byteenable[7:0]}
// 16   :    0           1              0
// 17   :    0           0              1
// 18   :    1           0              0
// 22-19:    {O,P,E,S}   {O,P,E,S}      {O,P,E,S}
// 23   :    dont care  dont care       dont care
// 25-24:    rdma       rdma            rdma entry
// 27   :   poison      poison          poison

  
 
 
  assign snpq_inst_px2[`L2_FBF] = 1'b0 ; 
  assign snpq_inst_px2[`L2_MBF] = 1'b0 ; 
  assign snpq_inst_px2[`L2_SNP] = 1'b1 ; // currently this bit is RSVD 
  assign snpq_inst_px2[`L2_CTRUE] = 1'b0 ; 
  assign snpq_inst_px2[`L2_EVICT] = 1'b0;  
  assign snpq_inst_px2[`L2_DEP] = 1'b0 ; 
  assign snpq_inst_px2[`L2_TECC] = 1'b0 ; 
  assign snpq_inst_px2[`L2_POISON] = snpd_snpq_arbdp_inst_px2[`JBINST_POISON]; 
  assign snpq_inst_px2[`L2_ENTRY_HI:`L2_ENTRY_LO] = 5'b0 ; 
   
  assign  snpq_inst_px2[`L2_RDMA_HI:`L2_RDMA_LO] = { 
		snpd_snpq_arbdp_inst_px2[`JBINST_ENTRY_HI:`JBINST_ENTRY_LO] } ; 
 
  assign snpq_inst_px2[`L2_RQTYP_HI:`L2_RQTYP_LO] =  
 		{ 
		1'b0, snpd_snpq_arbdp_inst_px2[`JBINST_OPES_HI],
		snpd_snpq_arbdp_inst_px2[`JBINST_RQ_WR64:`JBINST_RQ_RD] 
		} ; 
 
  assign  snpq_inst_px2[`L2_NC] = 1'b0 ; 
 
  assign  snpq_inst_px2[`L2_RSVD] = 1'b1 ; 
 
  assign  snpq_inst_px2[`L2_CPUID_HI:`L2_CPUID_LO] =  
		{ snpd_snpq_arbdp_inst_px2[`JBINST_OPES_LO+2:`JBINST_OPES_LO]}; 
 


// RDD AND WRI will have tag[15:0] but WR8 will have 
// 7:0 valid  
  assign  snpq_inst_px2[`L2_TID_HI:`L2_TID_LO] =  
		{snpd_snpq_arbdp_inst_px2[`JBINST_CTAG_HI:`JBINST_CTAG_LO+5]}; 
                 // BS and SR 11/12/03 N2 Xbar Packet format change
 
  assign  snpq_inst_px2[`L2_BUFID_HI:`L2_BUFID_LO] =  
		{ snpd_snpq_arbdp_inst_px2[`JBINST_CTAG_LO+4:`JBINST_CTAG_LO+2]}; 
 
  assign  snpq_inst_px2[`L2_L1WY_HI:`L2_L1WY_LO] =  
		{ snpd_snpq_arbdp_inst_px2[`JBINST_CTAG_LO+1:`JBINST_CTAG_LO]}; 
 
  assign  snpq_inst_px2[`L2_SZ_HI:`L2_SZ_LO] =   
		snpd_snpq_arbdp_inst_px2[`JBINST_SZ_HI:`JBINST_SZ_LO]; 

 
//********************** 
// iq instuction. 
//********************** 
 
// inst bits 40:26 
  assign	iq_inst_px2[`L2_FBF:`L2_ENTRY_LO] = 12'b0 ; 
  assign	iq_inst_px2[`L2_POISON] = 1'b0 ; 
 
  assign	iq_inst_px2[`L2_RDMA_HI:`L2_RDMA_LO] = 2'b0; 
// inst bits 25:0 BS and SR 11/12/03 N2 Xbar Packet format
  assign	iq_inst_px2[`L2_RQTYP_HI:`L2_SZ_LO] =  
		{ique_iq_arbdp_inst_px2[24:19], 
		1'b0, 	// RSVD bit 
		ique_iq_arbdp_inst_px2[`L2_CPUID_HI:`L2_SZ_LO]} ;	 
 
 
//********************** 
// fill buffer instuction. 
//********************** 
// inst bits  40:29 
  assign  fbf_inst_px2[`L2_FBF] = 1'b1 ; 
  assign  fbf_inst_px2[`L2_MBF] = 1'b0 ; 
  assign  fbf_inst_px2[`L2_SNP] = 1'b0 ; 
  assign  fbf_inst_px2[`L2_RSVD] = 1'b0 ; 
 
  assign  fbf_inst_px2[`L2_CTRUE] = 1'b0 ; 
  assign  fbf_inst_px2[`L2_EVICT] = 1'b0; 
  assign  fbf_inst_px2[`L2_DEP] = 1'b0 ; 
  assign  fbf_inst_px2[`L2_TECC] = filbuf_arbdp_tecc_px2 ; 
  assign  fbf_inst_px2[`L2_ENTRY_HI:`L2_ENTRY_LO] = { 2'b00 , filbuf_arbdp_entry_px2[2:0] } ; 
 
// inst bits 28:0 
  assign  fbf_inst_px2[`L2_POISON] = 1'b0; 
  assign  fbf_inst_px2[`L2_RDMA_HI:`L2_RDMA_LO] = 2'b0; 
  assign  fbf_inst_px2[`L2_RQTYP_HI:`L2_RQTYP_LO] = 5'b11111; 
  assign  fbf_inst_px2[`L2_NC] = 1'b0 ; 
  assign  fbf_inst_px2[`L2_CPUID_HI:`L2_CPUID_LO] = csr_l2_steering_tid[5:3]; 
  assign  fbf_inst_px2[`L2_TID_HI:`L2_TID_LO] = csr_l2_steering_tid[2:0]; // BS and SR 11/12/03 N2 Xbar Packet format change 
  assign  fbf_inst_px2[`L2_BUFID_HI:`L2_BUFID_HI-3] = filbuf_arbdp_way_px2[3:0] ; 
  assign  fbf_inst_px2[`L2_BUFID_HI-4:`L2_SZ_LO] = 9'b0 ; // BS and SR 11/12/03 N2 Xbar Packet format change 
 
 
//********************** 
// miss buffer instuction. 
//********************** 
 
// bits [40:37]
 
  assign  mbf_inst_px2[`L2_FBF] = 1'b0 ; // BS & SR 11/04/03, MB grows to 32 
  assign  mbf_inst_px2[`L2_MBF] = 1'b1 ; // BS & SR 11/04/03, MB grows to 32 
  assign  mbf_inst_px2[`L2_SNP] = 1'b0 ; // BS & SR 11/04/03, MB grows to 32 
  assign  mbf_inst_px2[`L2_CTRUE] = misbuf_arbdp_ctrue_px2;  // BS & SR 11/04/03, MB grows to 32 

// bits [36:29]


//msff_macro  ff_mbdata_snp_ecc_d1	(width=7,stack=7c)
//	(
//	.din(mbdata_snp_ecc_d1[6:0]),
//        .scan_in(),
//        .scan_out(),
//        .clk(l2clk),
//        .dout(mbdata_snp_ecc_px2[6:0]),
//        .en(1'b1)
//	);
// 
//msff_macro ff_read_mbdata_reg_inst1 (width=15,stack=15c)
//        (
//	.din({mbdata_snp_ecc[6:0],mb_data_read_data_mid,mb_data_read_data_hi}), //  BS & SR 11/04/03, MB grows to 32
//	.scan_in(ff_read_mbdata_reg_inst1_scanin),
//	.scan_out(ff_read_mbdata_reg_inst1_scanout),
//	.clk(l2clk), 
//        .dout({mbdata_snp_ecc_px2[6:0],mbf_inst_px2[`L2_EVICT:`L2_ENTRY_LO]}), 
//	.en(misbuf_arb_l2rd_en)
//	); 
//

l2t_arbdec_dp_msff_macro__stack_8c__width_8 ff_read_mbdata_reg_inst1 
        (
      .scan_in(ff_read_mbdata_reg_inst1_scanin),
      .scan_out(ff_read_mbdata_reg_inst1_scanout),
      .din({mb_data_read_data_mid,mb_data_read_data_hi}), //  BS & SR 11/04/03, MB grows to 32
      .clk(l2clk),
      .dout(mbf_inst_px2[`L2_EVICT:`L2_ENTRY_LO]),
      .en(misbuf_arb_l2rd_en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
      );

//
//msff_macro  ff_misbuf_arb_l2rd_en_d1      (width=1,stack=1c)
//      (
//      .scan_in(ff_misbuf_arb_l2rd_en_d1_scanin),
//      .scan_out(ff_misbuf_arb_l2rd_en_d1_scanout),
//      .din(misbuf_arb_l2rd_en),
//      .clk(l2clk),
//      .dout(misbuf_arb_l2rd_en_d1),
//      .en(1'b1)
//      );
//

l2t_arbdec_dp_msff_macro__stack_7c__width_7 ff_mbdata_snp_ecc 
        (
      	.scan_in(ff_mbdata_snp_ecc_scanin),
      	.scan_out(ff_mbdata_snp_ecc_scanout),
      	.din(mbdata_snp_ecc[6:0]), //  BS & SR 11/04/03, MB grows to 32
      	.clk(l2clk),
      	.dout(mbdata_snp_ecc_px2[6:0]),
      	.en(misbuf_arb_l2rd_en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
      	);

// bits [28:0]
 
l2t_arbdec_dp_msff_macro__stack_29c__width_29 ff_read_mbdata_reg_inst2  // BS and SR 11/12/03 N2 Xbar Packet format change
	(
	.scan_in(ff_read_mbdata_reg_inst2_scanin),
	.scan_out(ff_read_mbdata_reg_inst2_scanout),
	.din(mb_data_read_data_low), //  BS & SR 11/04/03, MB grows to 32
	.clk(l2clk), 
	.dout(mbf_inst_px2[`L2_POISON:`L2_SZ_LO]), 
	.en(misbuf_arb_l2rd_en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
 
 
//************************ 
// arbiter muxes 
// arbiter is split into two rows 
// The first row contains 11 bits. The second row contains 20 bits. 
//************************ 
l2t_arbdec_dp_inv_macro__width_1 arb_mux1_mbsel_px2_inv_slice  
	( 
	.dout	(arb_mux1_mbsel_px2_n ), 
	.din	(arb_mux1_mbsel_px2 ) 
	);	
 
l2t_arbdec_dp_mux_macro__mux_aonpe__ports_2__stack_12c__width_12 mux_mux1_inst1_px2  //  BS & SR 11/04/03, MB grows to 32
	(
	.dout (mux1_inst_px2[`L2_FBF:`L2_ENTRY_LO]) , 
	.din0(mbf_inst_px2[`L2_FBF:`L2_ENTRY_LO]), // mbf inst 40:29 
	.din1(fbf_inst_px2[`L2_FBF:`L2_ENTRY_LO]), // fbf inst  40:29 
	.sel0(arb_mux1_mbsel_px2), 
	.sel1(arb_mux1_mbsel_px2_n)
	); 
 
l2t_arbdec_dp_mux_macro__mux_aonpe__ports_2__stack_29c__width_29 mux_mux1_inst2_px2  // BS and SR 11/12/03 N2 Xbar Packet format change
	(
	.dout (mux1_inst_px2[`L2_POISON:`L2_SZ_LO]) , 
	.din0(mbf_inst_px2[`L2_POISON:`L2_SZ_LO]), // mbf inst 28:0 
	.din1(fbf_inst_px2[`L2_POISON:`L2_SZ_LO] ), // fbf inst  28:0 
	.sel0(arb_mux1_mbsel_px2), 
	.sel1(arb_mux1_mbsel_px2_n)
	); 
 
l2t_arbdec_dp_inv_macro__width_1 arb_mux2_snpsel_px2_inv_slice  
	( 
	.dout	(arb_mux2_snpsel_px2_n ), 
	.din	(arb_mux2_snpsel_px2 ) 
	);	
	
l2t_arbdec_dp_mux_macro__mux_aonpe__ports_2__stack_12c__width_12 mux_mux2_inst1_px2  //  BS & SR 11/04/03, MB grows to 32
	(
	.dout (mux2_inst_px2[`L2_FBF:`L2_ENTRY_LO]) , 
	.din0(snpq_inst_px2[`L2_FBF:`L2_ENTRY_LO]), // snoop  
	.din1(mux1_inst_px2[`L2_FBF:`L2_ENTRY_LO]), // fbf/mbf instuction 40:29 
	.sel0(arb_mux2_snpsel_px2), 
	.sel1(arb_mux2_snpsel_px2_n)
	); 
	 
l2t_arbdec_dp_mux_macro__mux_aonpe__ports_2__stack_29c__width_29 mux_mux2_inst2_px2  // BS and SR 11/12/03 N2 Xbar Packet format change
	(
	.dout (mux2_inst_px2[`L2_POISON:`L2_SZ_LO]) , 
	.din0(snpq_inst_px2[`L2_POISON:`L2_SZ_LO]), // snoop inst 28:0 
	.din1(mux1_inst_px2[`L2_POISON:`L2_SZ_LO] ), // fbf/mbf inst  28:0 
	.sel0(arb_mux2_snpsel_px2), 
	.sel1(arb_mux2_snpsel_px2_n)
	); 
 
l2t_arbdec_dp_inv_macro__width_1 arb_mux3_bufsel_px2_inv_slice  
	( 
	.dout	(arb_mux3_bufsel_px2_n ), 
	.din	(arb_mux3_bufsel_px2 ) 
	);	
 
l2t_arbdec_dp_mux_macro__mux_aonpe__ports_2__stack_12c__width_12 mux_mux3_inst1_px2  //  BS & SR 11/04/03, MB grows to 32
	(
	.dout (mux3_inst_px2[`L2_FBF:`L2_ENTRY_LO]) , 
	.din0(mux2_inst_px2[`L2_FBF:`L2_ENTRY_LO]), // snoop and mbf and fbf 
	.din1(iq_inst_px2[`L2_FBF:`L2_ENTRY_LO]), // iq instuction 40:29 
	.sel0(arb_mux3_bufsel_px2), 
	.sel1(arb_mux3_bufsel_px2_n)
	); 

 
l2t_arbdec_dp_mux_macro__mux_aonpe__ports_2__stack_29c__width_29 mux_mux3_inst2_px2  // BS and SR 11/12/03 N2 Xbar Packet format change
	(
	.dout (mux3_inst_px2[`L2_POISON:`L2_SZ_LO]) , 
	.din0(mux2_inst_px2[`L2_POISON:`L2_SZ_LO]), // snoop and mbf  and fbf 
	.din1(iq_inst_px2[`L2_POISON:`L2_SZ_LO] ), // iq inst  28:0 
	.sel0(arb_mux3_bufsel_px2), 
	.sel1(arb_mux3_bufsel_px2_n)
	); 
 
 
 // a mux flop cannot be used here. 
l2t_arbdec_dp_inv_macro__width_1 arb_mux4_c1sel_px2_inv_slice  
	( 
	.dout	(arb_mux4_c1sel_px2_n ), 
	.din	(arb_mux4_c1sel_px2 ) 
	);	
	

l2t_arbdec_dp_mux_macro__mux_aonpe__ports_2__stack_12c__width_12 mux_mux4_inst1_px2  //  BS & SR 11/04/03, MB grows to 32
	(
	.dout (mux4_inst_px2[`L2_FBF:`L2_ENTRY_LO]) , 
	.din0(mux3_inst_px2[`L2_FBF:`L2_ENTRY_LO]), // snoop and mbf and fbf and iq 
	.din1(arbdp_inst_c1[`L2_FBF:`L2_ENTRY_LO]), // c1 instuction 40:29 
	.sel0(arb_mux4_c1sel_px2_n), 
	.sel1(arb_mux4_c1sel_px2)
	); 
 
l2t_arbdec_dp_mux_macro__mux_aonpe__ports_2__stack_29c__width_29 mux_mux4_inst2_px2  // BS and SR 11/12/03 N2 Xbar Packet format
	(
	.dout (mux4_inst_px2[`L2_POISON:`L2_SZ_LO]) , 
	.din0(mux3_inst_px2[`L2_POISON:`L2_SZ_LO]), // snoop and mbf  and fbf and iq 
	.din1(arbdp_inst_c1[`L2_POISON:`L2_SZ_LO] ), // c1 inst  28:0 
	.sel0(arb_mux4_c1sel_px2_n), 
	.sel1(arb_mux4_c1sel_px2)
	); 

// Upper part : 40:29

 
l2t_arbdec_dp_msff_macro__stack_18c__width_17 ff_inst1_c1  //  BS & SR 11/04/03, MB grows to 32
	(
	.scan_in(ff_inst1_c1_scanin),
	.scan_out(ff_inst1_c1_scanout),
	.din({mux4_inst_px2[`L2_BUFID_HI:`L2_BUFID_HI-3],mux4_inst_px2[`L2_RSVD],mux4_inst_px2[`L2_FBF:`L2_ENTRY_LO]}), 
	.clk(l2clk), 
	.dout({arbdp_inst_c1_rep1[`L2_BUFID_HI:`L2_BUFID_HI-3],arbdp_inst_c1_rep[`L2_RSVD],arbdp_inst_c1[`L2_FBF:`L2_ENTRY_LO]}), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
l2t_arbdec_dp_msff_macro__stack_12c__width_12 ff_inst1_c2  //  BS & SR 11/04/03, MB grows to 32
	(
	.scan_in(ff_inst1_c2_scanin),
	.scan_out(ff_inst1_c2_scanout),
	.din(arbdp_inst_c1[`L2_FBF:`L2_ENTRY_LO]), 
	.clk(l2clk), 
	.dout(arbdp_inst_c2[`L2_FBF:`L2_ENTRY_LO]), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
l2t_arbdec_dp_msff_macro__stack_12c__width_12 ff_inst1_c3  //  BS & SR 11/04/03, MB grows to 32
	(
	.scan_in(ff_inst1_c3_scanin),
	.scan_out(ff_inst1_c3_scanout),
	.din(arbdp_inst_c2[`L2_FBF:`L2_ENTRY_LO]), 
	.clk(l2clk), 
	.dout(arbdp_inst_c3[`L2_FBF:`L2_ENTRY_LO]), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	); 
 
// Lower part : 28:0 and siu ecc bits

//////////////////////// SNOOP ECC CALCULATIONS ////////////////////////////////
//mux_macro  mux_snp_ecc (width=7,mux=aonpe,ports=2,stack=7c)
//	(
//	.dout	(snp_ecc_px2[6:0]),
//	.din0	(snpd_ecc_px2[6:0]),
//	.din1	(mbdata_snp_ecc_px2[6:0]),
//	.sel0	(arb_mux2_snpsel_px2),
//	.sel1	(arb_mux2_snpsel_px2_n)
//	);

l2t_arbdec_dp_mux_macro__mux_aonpe__ports_2__stack_6c__width_6 mux_mux1_snp_ecc1_px2 
        (
        .dout(mux1_snp_ecc_px2[5:0]) , 
        .din0(mbdata_snp_ecc_px2[5:0]), 
        .din1(6'b0), 
        .sel0(arb_mux1_mbsel_px2), 
        .sel1(arb_mux1_mbsel_px2_n)
        ); 


l2t_arbdec_dp_mux_macro__mux_aonpe__ports_2__stack_6c__width_6 mux_mux2_snp_ecc2_px2  
        (
        .dout(mux2_snp_ecc_px2[5:0]) , 
        .din0(snpd_ecc_px2[5:0]), 
        .din1(mux1_snp_ecc_px2[5:0]), 
        .sel0(arb_mux2_snpsel_px2), 
        .sel1(arb_mux2_snpsel_px2_n)
        ); 
l2t_arbdec_dp_mux_macro__mux_aonpe__ports_2__stack_6c__width_6 mux_mux3_snp_ecc2_px2  
        (
        .dout(mux3_snp_ecc_px2[5:0]) , 
        .din0(mux2_snp_ecc_px2[5:0]), 
        .din1(6'b0), 
        .sel0(arb_mux3_bufsel_px2), 
        .sel1(arb_mux3_bufsel_px2_n)
        ); 
 
 
l2t_arbdec_dp_mux_macro__mux_aonpe__ports_2__stack_6c__width_6 mux_mux4_snp_ecc2_px2  
        (
        .dout(mux4_snp_ecc_px2[5:0]) , 
        .din0(mux3_snp_ecc_px2[5:0]), 
        .din1(arbdp_snp_ecc_c1[5:0] ), 
        .sel0(arb_mux4_c1sel_px2_n), 
        .sel1(arb_mux4_c1sel_px2)
        ); 

//////////////////////// SNOOP ECC CALCULATIONS ////////////////////////////////
l2t_arbdec_dp_msff_macro__stack_35c__width_35 ff_inst2_c1  // BS and SR 11/12/03 N2 Xbar Packet format change
	(
	.scan_in(ff_inst2_c1_scanin),
	.scan_out(ff_inst2_c1_scanout),
	.din({mux4_snp_ecc_px2[5:0],mux4_inst_px2[`L2_POISON:`L2_SZ_LO]}), 
	.clk(l2clk), 
	.dout({arbdp_snp_ecc_c1[5:0],arbdp_inst_c1[`L2_POISON:`L2_SZ_LO]}), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
 
l2t_arbdec_dp_msff_macro__stack_35c__width_35 ff_inst2_c2  // BS and SR 11/12/03 N2 Xbar Packet format change
	(
	.scan_in(ff_inst2_c2_scanin),
	.scan_out(ff_inst2_c2_scanout),
	.din({arbdp_snp_ecc_c1[5:0],arbdp_inst_c1[`L2_POISON:`L2_SZ_LO]}), 
	.clk(l2clk), 
	.dout({arbdp_snp_ecc_c2[5:0],arbdp_inst_c2[`L2_POISON:`L2_SZ_LO]}), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
l2t_arbdec_dp_msff_macro__stack_35c__width_35 ff_inst2_c3  // BS and SR 11/12/03 N2 Xbar Packet format change
	(
	.scan_in(ff_inst2_c3_scanin),
	.scan_out(ff_inst2_c3_scanout),
	.din({arbdp_snp_ecc_c2[5:0],arbdp_inst_c2[`L2_POISON:`L2_SZ_LO]}), 
	.clk(l2clk), 
	.dout({arbdp_snp_ecc_c3[5:0],arbdp_inst_c3[`L2_POISON:`L2_SZ_LO]}), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
 
l2t_arbdec_dp_msff_macro__stack_35c__width_35 ff_inst2_c4  // BS and SR 11/12/03 N2 Xbar Packet format change
	(
	.scan_in(ff_inst2_c4_scanin),
	.scan_out(ff_inst2_c4_scanout),
	.din({arbdp_snp_ecc_c3[5:0],arbdp_inst_c3[`L2_POISON:`L2_SZ_LO]}), 
	.clk(l2clk), 
	.dout({arbdp_snp_ecc_c4[5:0],arbdp_inst_c4[`L2_POISON:`L2_SZ_LO]}), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
l2t_arbdec_dp_msff_macro__stack_35c__width_35 ff_inst2_c5  // BS and SR 11/12/03 N2 Xbar Packet format change
	(
	.scan_in(ff_inst2_c5_scanin),
	.scan_out(ff_inst2_c5_scanout),
	.din({arbdp_snp_ecc_c4[5:0],arbdp_inst_c4[`L2_POISON:`L2_SZ_LO]}), 
	.clk(l2clk), 
	.dout({arbdp_snp_ecc_c5[5:0],arbdp_inst_c5[`L2_POISON:`L2_SZ_LO]}), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 

// BS 03/11/04 extra cycle for mem access

l2t_arbdec_dp_msff_macro__stack_35c__width_35 ff_inst2_c52  // BS and SR 11/12/03 N2 Xbar Packet format change
	(
	.scan_in(ff_inst2_c52_scanin),
	.scan_out(ff_inst2_c52_scanout),
	.din({arbdp_snp_ecc_c5[5:0],arbdp_inst_c5[`L2_POISON:`L2_SZ_LO]}),
	.clk(l2clk),
	.dout({arbdp_snp_ecc_c52[5:0],arbdp_inst_c52[`L2_POISON:`L2_SZ_LO]}),
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	);
 
 
l2t_arbdec_dp_msff_macro__stack_35c__width_35 ff_inst2_c6  // BS and SR 11/12/03 N2 Xbar Packet format change
	(
	.scan_in(ff_inst2_c6_scanin),
	.scan_out(ff_inst2_c6_scanout),
	.din({arbdp_snp_ecc_c52[5:0],arbdp_inst_c52[`L2_POISON:`L2_SZ_LO]}), 
	.clk(l2clk), 
	.dout({arbdp_snp_ecc_c6[5:0],arbdp_inst_c6[`L2_POISON:`L2_SZ_LO]}), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
 
l2t_arbdec_dp_msff_macro__stack_35c__width_35 ff_inst2_c7  //BS and SR 11/12/03 N2 Xbar Packet format change
	(
	.scan_in(ff_inst2_c7_scanin),
	.scan_out(ff_inst2_c7_scanout),
	.din({arbdp_snp_ecc_c6[5:0],arbdp_inst_c6[`L2_POISON:`L2_SZ_LO]}), 
	.clk(l2clk), 
	.dout({arbdp_snp_ecc_c7[5:0],arbdp_inst_c7[`L2_POISON:`L2_SZ_LO]}), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	); 
 
l2t_arbdec_dp_msff_macro__stack_35c__width_35 ff_inst2_c8  //BS and SR 11/12/03 N2 Xbar Packet format change
	(
	.scan_in(ff_inst2_c8_scanin),
	.scan_out(ff_inst2_c8_scanout),
	.din({arbdp_snp_ecc_c7[5:0],arbdp_inst_c7[`L2_POISON:`L2_SZ_LO]}), 
	.clk(l2clk), 
	.dout({arbdec_snpd_ecc_c8[5:0],arbdec_arbdp_inst_c8[`L2_POISON:`L2_SZ_LO]}), 
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	); 
 
assign arbdec_snpd_ecc_c8[6] = 1'b0;
 
////////////////////////////////////////////////////// 
// C1 Bits used in decode 
////////////////////////////////////////////////////// 
 
assign	arbdec_arbdp_poison_c1 = 1'b0; 
				 
// For timing reasons will duplicate
//assign  arbdec_arbdp_inst_way_c1 = arbdp_inst_c1[`L2_BUFID_HI:`L2_BUFID_HI-3] ;  
assign  arbdec_arbdp_inst_way_c1 = arbdp_inst_c1_rep1[`L2_BUFID_HI:`L2_BUFID_HI-3] ;  
 
assign	arbdec_arbdp_inst_fb_c1 = arbdp_inst_c1[`L2_FBF] ; // used by 
				// arb to  turn off fb hits. 
                                // BS & SR 11/04/03, MB grows to 32
assign	arbdec_arbdp_evict_c1 = arbdp_inst_c1[`L2_EVICT] ; // BS & SR 11/04/03, MB grows to 32  
 
assign	arbdec_arbdp_tecc_c1 = arbdp_inst_c1[`L2_TECC] ;// BS & SR 11/04/03, MB grows to 32 
 
assign	arbdec_arbdp_inst_mb_c1 = arbdp_inst_c1[`L2_MBF] ;// BS & SR 11/04/03, MB grows to 32 
 
assign	arbdec_arbdp_inst_rsvd_c1_1 = arbdp_inst_c1_rep[`L2_RSVD] ; 
 
assign	arbdec_arbdp_inst_nc_c1 = arbdp_inst_c1[`L2_NC] ; 
 
assign	arbdec_arbdp_inst_ctrue_c1 = arbdp_inst_c1[`L2_CTRUE] ;// BS & SR 11/04/03, MB grows to 32 
 
assign	arbdec_arbdp_inst_size_c1[`L2_SZ_HI:`L2_SZ_LO] = 
			arbdp_inst_c1[`L2_SZ_HI:`L2_SZ_LO]; 
 
// assign	arbdec_arbdp_inst_bufidhi_c1 = (arbdp_inst_c1[`L2_BUFID_HI] & ~arbdec_arbdp_rdma_inst_c1); 


l2t_arbdec_dp_inv_macro__width_1  inv_arbdec_arbdp_rdma_inst_c1 
	(
	.dout	(arbdec_arbdp_rdma_inst_c1_n),
	.din	(arbdec_arbdp_rdma_inst_c1)
	);

l2t_arbdec_dp_and_macro__width_1  and_arbdec_arbdp_inst_bufidhi_c1 
	(
	.dout	(arbdec_arbdp_inst_bufidhi_c1),
	.din0	(arbdp_inst_c1[`L2_BUFID_HI]),
	.din1	(arbdec_arbdp_rdma_inst_c1_n)
	);


 
assign	arbdec_arbdp_inst_bufid1_c1 = arbdp_inst_c1[`L2_BUFID_HI-1]; 
 
assign	arbdec_arbdp_inst_rqtyp_c1 = arbdp_inst_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] ; 
 
assign  arbdec_arbdp_inst_mb_entry_c1 = arbdp_inst_c1[`L2_ENTRY_HI:`L2_ENTRY_LO] ;// BS & SR 11/04/03, MB grows to 32 
 
assign	arbdec_arbdp_rdma_inst_c1 = arbdp_inst_c1[`L2_RSVD] ; 

////////////////////////////////////////////////////// 
// C2 Bits used in decode 
////////////////////////////////////////////////////// 
 
assign	arbdec_arbdp_inst_bufidlo_c2 =  arbdp_inst_c2[`L2_BUFID_LO] ; 
 
assign  arbdec_arbdp_inst_mb_c2 = arbdp_inst_c2[`L2_MBF] ; // used in vuad dp, arb// BS & SR 11/04/03, MB grows to 32 
 
assign  arbdec_arbdp_inst_fb_c2 = arbdp_inst_c2[`L2_FBF] ;  // fill instruction in C2. 
						      // output to arb and vuad dp.// BS & SR 11/04/03, MB grows to 32 
assign  arbdec_arbdp_inst_dep_c2 = arbdp_inst_c2[`L2_DEP];// BS & SR 11/04/03, MB grows to 32 
				 
assign	arbdec_arbdp_rdma_inst_c2 = arbdp_inst_c2[`L2_RSVD] ; 
 
assign	arbdec_arbdp_inst_rqtyp_c2 = arbdp_inst_c2[`L2_RQTYP_HI:`L2_RQTYP_LO] ; 
 
assign  arbdec_arbdp_inst_way_c2 = arbdp_inst_c2[`L2_BUFID_HI:`L2_BUFID_HI-3] ;  
 
////////////////////////////////////////////////////// 
// C3 Bits used in decode 
////////////////////////////////////////////////////// 
 
assign  arbdec_arbdp_inst_mb_c3 = arbdp_inst_c3[`L2_MBF] ;// BS & SR 11/04/03, MB grows to 32 
 
//assign  arbdec_arbdp_inst_fb_c3 = arbdp_inst_c3[`L2_FBF] ;// BS & SR 11/04/03, MB grows to 32 
 
assign	arbdec_arbdp_inst_tecc_c3 = arbdp_inst_c3[`L2_TECC];// BS & SR 11/04/03, MB grows to 32 
 
assign  arbdec_arbdp_inst_way_c3 = arbdp_inst_c3[`L2_BUFID_HI:`L2_BUFID_HI-3] ;  
 
assign	arbdec_arbdp_rdma_entry_c3 = arbdp_inst_c3[`L2_RDMA_HI:`L2_RDMA_LO] ; 
 
assign	arbdec_arbdp_inst_nc_c3 = arbdp_inst_c3[`L2_NC] ; 
 
assign	arbdec_arbdp_l1way_c3 = arbdp_inst_c3[`L2_L1WY_HI:`L2_L1WY_LO] ; 
 
////////////////////////////////////////////////////// 
// C5+ Bits used in decode 
////////////////////////////////////////////////////// 
 
// Debug related signals
assign arbdec_csr_ttype_c6[4:0] = arbdp_inst_c6[`L2_RQTYP_HI:`L2_RQTYP_LO] ;
assign arbdec_csr_vcid_c6[5:0] = {arbdp_inst_c6[`L2_CPUID_HI:`L2_CPUID_LO], 
			       arbdp_inst_c6[`L2_TID_HI:`L2_TID_LO]};

assign l2t_dbg_xbar_vcid[5:0] = {arbdp_inst_c6[`L2_CPUID_HI:`L2_CPUID_LO], 
			       arbdp_inst_c6[`L2_TID_HI:`L2_TID_LO]} ;

assign  arbdec_arbdp_int_bcast_c5 = arbdp_inst_c5[`L2_NC] ; 
assign	arbdec_arbdp_inst_rqtyp_c6 = arbdp_inst_c6[`L2_RQTYP_HI:`L2_RQTYP_LO] ; 
assign arbdec_arbdp_inst_bufidhi_c8 = arbdec_arbdp_inst_c8[`L2_BUFID_HI]; // to l2t_misbuf_ctl to force compare result = 1
									 // on a CAS1 from Core with PCX[116] = 1'b1
                                                                         // to indicate Notdata
 
 
 
////////////////////////////////////////////////////// 
// CTAG sent to l2b  
// Ctag<23:0> = { Ordered,read_bit,PES bits,tag[15:0]}
////////////////////////////////////////////////////// 
//assign	arbdec_ctag_c6[14:0] =  { arbadr_arbdp_byte_addr_c6[1:0], // BS and SR 11/12/03 N2 Xbar Packet format change 
//		arbdp_inst_c6[`L2_RQTYP_LO],	// rd 
//		arbdp_inst_c6[`L2_RQTYP_HI:`L2_RQTYP_HI-1], // ctag 11:10 
//                arbdp_inst_c6[`L2_CPUID_HI:`L2_CPUID_LO], // ctag 9:7 
//		arbdp_inst_c6[`L2_TID_HI-1:`L2_L1WY_LO] } ; // ctag 6:0 

// Phase 2 : SIU inteface and packet format change 2/7/04

assign arbdec_ctag_c6[31:0] = {
		arbdp_inst_c6[`L2_POISON],	// J bit
		arbdp_snp_ecc_c6[5:0],  // RAS implementation 14/10/04
		1'b0,
		arbdp_inst_c6[`L2_RQTYP_HI-1],	// O bit
		arbdp_inst_c6[`L2_CPUID_HI:`L2_CPUID_LO], // PES
		arbadr_arbdp_byte_addr_c6[2:0],	// CBA
		arbdp_inst_c6[`L2_RQTYP_LO],	// RDD
		arbdp_inst_c6[`L2_TID_HI:`L2_SZ_LO] };	// tag 15:0
 
 
// Fields that go to oque for return to the  
// sparcs  
 
assign	arbdec_arbdp_inst_l1way_c7 = arbdp_inst_c7[`L2_L1WY_HI:`L2_L1WY_LO] ; 
assign	arbdec_arbdp_inst_size_c7 = arbdp_inst_c7[`L2_SZ_HI:`L2_SZ_LO] ; 
assign	arbdec_arbdp_inst_tid_c7 = arbdp_inst_c7[`L2_TID_HI:`L2_TID_LO] ; 
assign	arbdec_arbdp_inst_cpuid_c7 = arbdp_inst_c7[`L2_CPUID_HI:`L2_CPUID_LO] ; 
assign	arbdec_arbdp_inst_nc_c7 = arbdp_inst_c7[`L2_NC] ; 



 
l2t_arbdec_dp_msff_macro__stack_18c__width_18 ff_inst_size_c8 
           (.din({l2t_mb2_wdata_r2[7:0],sel_diag_store_data_c7,sel_diag_store_data_c7_n,arbdec_arbdp_inst_size_c7[7:0]}), .clk(l2clk),
           .scan_in(ff_inst_size_c8_scanin),
           .scan_out(ff_inst_size_c8_scanout),
           .dout({l2t_mb2_wdata_r3[7:0],sel_diag_store_data_c8,sel_diag_store_data_c8_n,arbdec_arbdp_inst_size_c8[7:0]}), .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
);

// BS and SR 12/22/03, store ack generation for diagnostic store
l2t_arbdec_dp_inv_macro__width_1 inv_sel_diag_store_data_c8 
        (
        .dout   (sel_diag_store_data_c7_n ),
        .din    (sel_diag_store_data_c7 )
        );


// BS and SR 1/30/04, bmask for store ack generation , including diagnostic store
l2t_arbdec_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_8c__width_8 mux_st_ack_bmask     
       (
       .dout   (st_ack_bmask_unbuff[7:0]),
       .din0   (arbdec_arbdp_inst_size_c8[7:0]),
       .din1   (arbdec_arbdp_inst_size_c7[7:0]),
       .sel0   (sel_diag_store_data_c8),        // for diagnostic store ack cases
       .sel1   (sel_diag_store_data_c8_n)       // for default cases
       );
 
l2t_arbdec_dp_buff_macro__dbuff_32x__stack_8c__width_8 buff_st_ack_bmask     
	(
	.dout   (st_ack_bmask[7:0]),
	.din	(st_ack_bmask_unbuff[7:0])
	);

 
 
 
// to arb for determining if an instruction  
// is a CAS or CASX. 
 
// assign	arbdec_size_field_c8[1:0]= arbdec_arbdp_inst_c8[`L2_SZ_HI-1:`L2_SZ_LO] ;  


// BS and SR 11/12/03 N2 Xbar Packet format change :
//
//assign arbdec_size_field_c8[1:0] = {((arbdec_arbdp_inst_c8[`L2_SZ_LO] & arbdec_arbdp_inst_c8[`L2_SZ_LO+1] &
//                              arbdec_arbdp_inst_c8[`L2_SZ_LO+2] & arbdec_arbdp_inst_c8[`L2_SZ_LO+3]) &
//                               (~arbdec_arbdp_inst_c8[`L2_SZ_HI] & ~arbdec_arbdp_inst_c8[`L2_SZ_HI-1] &
//                                ~arbdec_arbdp_inst_c8[`L2_SZ_HI-2] & ~arbdec_arbdp_inst_c8[`L2_SZ_HI-3])),
//                               // size [7:0] == 11110000
//                               ((~arbdec_arbdp_inst_c8[`L2_SZ_LO] & ~arbdec_arbdp_inst_c8[`L2_SZ_LO+1] &
//                              ~arbdec_arbdp_inst_c8[`L2_SZ_LO+2] & ~arbdec_arbdp_inst_c8[`L2_SZ_LO+3]) &
//                               (arbdec_arbdp_inst_c8[`L2_SZ_HI] & arbdec_arbdp_inst_c8[`L2_SZ_HI-1] &
//                                arbdec_arbdp_inst_c8[`L2_SZ_HI-2] & arbdec_arbdp_inst_c8[`L2_SZ_HI-3]))};
//                                // size [7:0] == 00001111
//

l2t_arbdec_dp_cmp_macro__width_8 arbdec_size_field_c8_slice0  
        (
        .din0   ({arbdec_arbdp_inst_c8[`L2_SZ_LO], arbdec_arbdp_inst_c8[`L2_SZ_LO+1], arbdec_arbdp_inst_c8[`L2_SZ_LO+2], 
		    arbdec_arbdp_inst_c8[`L2_SZ_LO+3], arbdec_arbdp_inst_c8[`L2_SZ_HI], arbdec_arbdp_inst_c8[`L2_SZ_HI-1],
		    arbdec_arbdp_inst_c8[`L2_SZ_HI-2], arbdec_arbdp_inst_c8[`L2_SZ_HI-3]}),
        .din1   (8'b11110000),
        .dout   (arbdec_size_field_c8[1])
        );

l2t_arbdec_dp_cmp_macro__width_8 arbdec_size_field_c8_slice1  
        (
        .din0   ({arbdec_arbdp_inst_c8[`L2_SZ_LO], arbdec_arbdp_inst_c8[`L2_SZ_LO+1], arbdec_arbdp_inst_c8[`L2_SZ_LO+2], 
		    arbdec_arbdp_inst_c8[`L2_SZ_LO+3], arbdec_arbdp_inst_c8[`L2_SZ_HI], arbdec_arbdp_inst_c8[`L2_SZ_HI-1],
		    arbdec_arbdp_inst_c8[`L2_SZ_HI-2], arbdec_arbdp_inst_c8[`L2_SZ_HI-3]}),
        .din1   (8'b00001111),
        .dout   (arbdec_size_field_c8[0])
        );
      
 
 // cpu id in C3,C4,C5,C6 to arb for  
 // directory invalidation mask calculation. 
// C6 and C7 cpuid are used in direvec_ctl for  
 // dirvec mux selects 
assign  arbdec_arbdp_cpuid_c2  = arbdp_inst_c2[`L2_CPUID_HI:`L2_CPUID_LO] ; // BS 03/25/04 for partial bank/core modes support 
assign  arbdec_arbdp_cpuid_c5  = arbdp_inst_c5[`L2_CPUID_HI:`L2_CPUID_LO] ; 

///////////////////////////////////////////////////////////////////
// Prfetch ICE decode
///////////////////////////////////////////////////////////////////
// For timing reasons will redo this logic

//assign arbdec_pf_ice_inst_c1 =  ~arbdec_arbdp_inst_rsvd_c1_1 &
//       arbdec_arbdp_inst_bufid1_c1 & arbdec_arbdp_inst_bufidhi_c1 & // inv bit = 1, pf bit =1
//             ( arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO] == `LOAD_RQ ) ;

l2t_arbdec_dp_inv_macro__dinv_16x__stack_8c__width_6 inv_req_type 
        (
        .dout({req_type_n[4:0],arbdec_arbdp_inst_rsvd_c1_1_n}),
        .din({arbdec_arbdp_inst_rqtyp_c1[`L2_RQTYP_HI:`L2_RQTYP_LO],arbdec_arbdp_inst_rsvd_c1_1})
        );

l2t_arbdec_dp_nand_macro__dnand_16x__ports_3__stack_3r__width_1 nand_pf_ice_instr_1  
        (
        .dout   (req_type_n_1),
        .din0   (req_type_n[0]),
        .din1   (req_type_n[1]),
        .din2   (req_type_n[2])
        );

l2t_arbdec_dp_nand_macro__dnand_16x__ports_2__stack_3r__width_1 nand_pf_ice_instr 
        (
        .dout   (req_type_n_2),
        .din0   (req_type_n[3]),
        .din1   (req_type_n[4])
        );

l2t_arbdec_dp_nor_macro__dnor_16x__ports_2__stack_3r__width_1 nor_pf_ice_instr1 
        (
        .dout   (its_a_load),
        .din0   (req_type_n_1),
        .din1   (req_type_n_2)
        );

l2t_arbdec_dp_and_macro__dnand_16x__ports_3__stack_3r__width_1 nand_inv_pf_bit_notrsvd 
        (
        .dout   (pf_ice_qual),
        .din0   (arbdec_arbdp_inst_rsvd_c1_1_n),
        .din1   (arbdec_arbdp_inst_bufid1_c1),
        .din2   (arbdec_arbdp_inst_bufidhi_c1)
        );

 
l2t_arbdec_dp_and_macro__dinv_32x__dnand_24x__ports_2__stack_3r__width_1 nand_pf_ice_instr_fnl 
        (
        .dout   (arbdec_pf_ice_inst_c1),
        .din0   (pf_ice_qual),
        .din1   (its_a_load)
        );

/////////////////////////////////////////////////////////////
//      MBDATA MBIST SIGNALS
/////////////////////////////////////////////////////////////


l2t_arbdec_dp_msff_macro__stack_32c__width_32  ff_mb_data_read_data0  
        (
        .scan_in(ff_mb_data_read_data0_scanin),
        .scan_out(ff_mb_data_read_data0_scanout),
        .dout    (mb_data_read_data_r1[95:64]),
        .din     (mb_data_read_data[95:64]),
        .clk     (l2clk),
        .en      (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2t_arbdec_dp_msff_macro__stack_32c__width_32  ff_mb_data_read_data1  
        (
        .scan_in(ff_mb_data_read_data1_scanin),
        .scan_out(ff_mb_data_read_data1_scanout),
        .dout    (mb_data_read_data_r1[127:96]),
        .din     (mb_data_read_data[127:96]),
        .clk     (l2clk),
        .en      (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );



l2t_arbdec_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 mux_mb_data_read_data0 
        (
        .dout   (mbdata_cmp_data[31:0]),
        .din0   (mb_data_read_data_r1[95:64]),
        .din1   (mb_data_read_data_r1[127:96]),
        .sel0   (mbdata_cmp_sel[2]),
        .sel1   (mbdata_cmp_sel[3])
        );

l2t_arbdec_dp_cmp_macro__dcmp_8x__width_32 cmp_mbdata_cmp_data 
        (
        .dout   (mbdata_fail_unreg),
        .din0   ({4{l2t_mb2_wdata_r4[7:0]}}),
        .din1   (mbdata_cmp_data[31:0])
        );

l2t_arbdec_dp_msff_macro__stack_32c__width_28  ff_mbdata_mbist_reg  
        (
        .scan_in(ff_mbdata_mbist_reg_scanin),
        .scan_out(ff_mbdata_mbist_reg_scanout),
        .dout   ({mbdata_fail,
		  mbdata_fail_top,
                  l2t_mb2_wdata_r1[7:0],
                  l2t_mb2_wdata_r2[7:0],
                  l2t_mb2_wdata_r4[7:0],
                  misbuf_buf_rd_en_r1,
                  misbuf_buf_rd_en_r2}),
        .din    ({mbdata_fail_top_or_bot,
		  mbdata_fail_unreg_w,
                  l2t_mb2_wdata[7:0],
                  l2t_mb2_wdata_r1[7:0],
                  l2t_mb2_wdata_r3[7:0],
                  misbuf_buf_rd_en,
                  misbuf_buf_rd_en_r1}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2t_arbdec_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_2c__width_1 mux_mbdata_fail_unreg 
        (
        .dout   (mbdata_fail_unreg_w),
        .din0   (mbdata_fail_unreg),
        .din1   (1'b1),
        .sel0   (misbuf_buf_rd_en_r2_qual),
        .sel1   (misbuf_buf_rd_en_r2_n)
        );

l2t_arbdec_dp_inv_macro__width_1 inv_misbuf_buf_rd_en_r2 
        (
        .dout   (misbuf_buf_rd_en_r2_n),
        .din    (misbuf_buf_rd_en_r2_qual)
        );


l2t_arbdec_dp_and_macro__width_2 and_enable_mbdata_rd 
	(
	.dout	({misbuf_buf_rd_en_r2_qual,mbdata_fail_top_or_bot}),
	.din0	({mbdata_test_active,	   mbdata_fail_top}),
	.din1	({misbuf_buf_rd_en_r2,	   mbdata_fail_bot})
	);

l2t_arbdec_dp_or_macro__width_1 or_mbdata_mbist_active 
        (
        .dout   (mbdata_test_active),
        .din0   (mbdata_cmp_sel[3]),
        .din1   (mbdata_cmp_sel[2])
        );

 
// fixscan start:
assign ff_read_mbdata_reg_inst1_scanin = scan_in                  ;
assign ff_mbdata_snp_ecc_scanin  = ff_read_mbdata_reg_inst1_scanout;
assign ff_read_mbdata_reg_inst2_scanin = ff_mbdata_snp_ecc_scanout;
assign ff_inst1_c1_scanin        = ff_read_mbdata_reg_inst2_scanout;
assign ff_inst1_c2_scanin        = ff_inst1_c1_scanout      ;
assign ff_inst1_c3_scanin        = ff_inst1_c2_scanout      ;
assign ff_inst2_c1_scanin        = ff_inst1_c3_scanout      ;
assign ff_inst2_c2_scanin        = ff_inst2_c1_scanout      ;
assign ff_inst2_c3_scanin        = ff_inst2_c2_scanout      ;
assign ff_inst2_c4_scanin        = ff_inst2_c3_scanout      ;
assign ff_inst2_c5_scanin        = ff_inst2_c4_scanout      ;
assign ff_inst2_c52_scanin       = ff_inst2_c5_scanout      ;
assign ff_inst2_c6_scanin        = ff_inst2_c52_scanout     ;
assign ff_inst2_c7_scanin        = ff_inst2_c6_scanout      ;
assign ff_inst2_c8_scanin        = ff_inst2_c7_scanout      ;
assign ff_inst_size_c8_scanin    = ff_inst2_c8_scanout      ;
assign ff_mb_data_read_data0_scanin = ff_inst_size_c8_scanout  ;
assign ff_mb_data_read_data1_scanin = ff_mb_data_read_data0_scanout;
assign ff_mbdata_mbist_reg_scanin = ff_mb_data_read_data1_scanout;
assign scan_out                  = ff_mbdata_mbist_reg_scanout;
// fixscan end:
endmodule 






// any PARAMS parms go into naming of macro

module l2t_arbdec_dp_msff_macro__stack_8c__width_8 (
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













// any PARAMS parms go into naming of macro

module l2t_arbdec_dp_msff_macro__stack_7c__width_7 (
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
wire [5:0] so;

  input [6:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [6:0] dout;


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
dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_arbdec_dp_msff_macro__stack_29c__width_29 (
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
wire [27:0] so;

  input [28:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [28:0] dout;


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
dff #(29)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[28:0]),
.si({scan_in,so[27:0]}),
.so({so[27:0],scan_out}),
.q(dout[28:0])
);




















endmodule









//
//   invert macro
//
//





module l2t_arbdec_dp_inv_macro__width_1 (
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

module l2t_arbdec_dp_mux_macro__mux_aonpe__ports_2__stack_12c__width_12 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [11:0] din0;
  input sel0;
  input [11:0] din1;
  input sel1;
  output [11:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(12)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
.dout(dout[11:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbdec_dp_mux_macro__mux_aonpe__ports_2__stack_29c__width_29 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [28:0] din0;
  input sel0;
  input [28:0] din1;
  input sel1;
  output [28:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(29)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[28:0]),
  .in1(din1[28:0]),
.dout(dout[28:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_arbdec_dp_msff_macro__stack_18c__width_17 (
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
wire [15:0] so;

  input [16:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [16:0] dout;


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
dff #(17)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[16:0]),
.si({scan_in,so[15:0]}),
.so({so[15:0],scan_out}),
.q(dout[16:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_arbdec_dp_msff_macro__stack_12c__width_12 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbdec_dp_mux_macro__mux_aonpe__ports_2__stack_6c__width_6 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [5:0] din0;
  input sel0;
  input [5:0] din1;
  input sel1;
  output [5:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(6)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[5:0]),
  .in1(din1[5:0]),
.dout(dout[5:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_arbdec_dp_msff_macro__stack_35c__width_35 (
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
//   and macro for ports = 2,3,4
//
//





module l2t_arbdec_dp_and_macro__width_1 (
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

module l2t_arbdec_dp_msff_macro__stack_18c__width_18 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbdec_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_8c__width_8 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [7:0] din0;
  input sel0;
  input [7:0] din1;
  input sel1;
  output [7:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(8)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
.dout(dout[7:0])
);









  



endmodule


//
//   buff macro
//
//





module l2t_arbdec_dp_buff_macro__dbuff_32x__stack_8c__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);








endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_arbdec_dp_cmp_macro__width_8 (
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
//   invert macro
//
//





module l2t_arbdec_dp_inv_macro__dinv_16x__stack_8c__width_6 (
  din, 
  dout);
  input [5:0] din;
  output [5:0] dout;






inv #(6)  d0_0 (
.in(din[5:0]),
.out(dout[5:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2t_arbdec_dp_nand_macro__dnand_16x__ports_3__stack_3r__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nand3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2t_arbdec_dp_nand_macro__dnand_16x__ports_2__stack_3r__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module l2t_arbdec_dp_nor_macro__dnor_16x__ports_2__stack_3r__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module l2t_arbdec_dp_and_macro__dnand_16x__ports_3__stack_3r__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






and3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module l2t_arbdec_dp_and_macro__dinv_32x__dnand_24x__ports_2__stack_3r__width_1 (
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

module l2t_arbdec_dp_msff_macro__stack_32c__width_32 (
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
wire [30:0] so;

  input [31:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


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
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbdec_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_32c__width_32 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [31:0] din0;
  input sel0;
  input [31:0] din1;
  input sel1;
  output [31:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(32)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(dout[31:0])
);









  



endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_arbdec_dp_cmp_macro__dcmp_8x__width_32 (
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









// any PARAMS parms go into naming of macro

module l2t_arbdec_dp_msff_macro__stack_32c__width_28 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_arbdec_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_2c__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module l2t_arbdec_dp_and_macro__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






and2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module l2t_arbdec_dp_or_macro__width_1 (
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




