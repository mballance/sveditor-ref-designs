// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_csr_ctl.v
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
 
module l2t_csr_ctl (
  scan_out, 
  csr_filbuf_scrub_ready, 
  csr_l2_bypass_mode_on, 
  csr_filbuf_l2off, 
  csr_tag_l2off, 
  csr_wbuf_l2off, 
  csr_misbuf_l2off, 
  csr_vuad_l2off, 
  csr_l2_dir_map_on, 
  csr_l2_steering_tid, 
  csr_error_nceen, 
  csr_error_ceen, 
  csr_wr_dirpinj_en, 
  csr_oneshot_dir_clear_c3, 
  csr_rd_data_c8, 
  csr_error_status_veu, 
  csr_error_status_vec, 
  csr_report_ldrc, 
  csreg_report_ldrc_inpkt, 
  notdata_higher_priority_err, 
  arbdat_csr_inst_wr_data_c8, 
  csreg_csr_bist_wr_en_c8, 
  scan_in, 
  l2clk, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  aclk_wmr, 
  wmr_protect, 
  csreg_csr_erren_wr_en_c8, 
  csreg_csr_wr_en_c8, 
  csreg_csr_errstate_wr_en_c8, 
  csreg_csr_errinj_wr_en_c8, 
  csreg_l2_cmpr_reg_wr_en_c8, 
  csreg_l2_mask_reg_wr_en_c8, 
  arb_inst_vld_c2, 
  csreg_csr_rd_mux4_sel_c7, 
  csreg_csr_rd_mux_fnl_c7, 
  arbdec_csr_ttype_c6, 
  arbdec_csr_vcid_c6, 
  arbadr_csr_debug_addr, 
  csreg_wr_enable_notdata_nddm_vcid_c9, 
  l2t_dbg_err_event, 
  l2t_dbg_pa_match, 
  csreg_csr_rd_mux1_sel_c7, 
  csreg_csr_rd_mux2_sel_c7, 
  csreg_csr_rd_mux3_sel_c7, 
  arbadr_arbdp_csr_addr_c9, 
  evctag_evict_addr, 
  arbadr_rdmard_addr_c12, 
  arb_dir_addr_c9, 
  tag_scrub_addr_way, 
  arbadr_data_ecc_idx, 
  csreg_err_state_in_rw, 
  csreg_err_state_in_mec, 
  csreg_err_state_in_meu, 
  csreg_err_state_in, 
  csreg_mux1_synd_sel, 
  csreg_mux2_synd_sel, 
  csreg_csr_synd_wr_en, 
  usaloc_ua_synd_c9, 
  vlddir_vd_synd_c9, 
  decc_lda_syndrome_c9, 
  csreg_wr_enable_tid_c9, 
  csreg_csr_tid_wr_en, 
  csreg_csr_async_wr_en, 
  set_async_c9, 
  error_rw_en, 
  diag_wr_en, 
  csreg_mux1_addr_sel, 
  csreg_mux2_addr_sel, 
  csreg_csr_addr_wr_en, 
  arb_dir_wr_en_c4, 
  oque_tid_c8, 
  csreg_csr_notdata_wr_en_c8, 
  csreg_wr_enable_notdata_vcid_c9, 
  csreg_csr_notdata_vcid_wr_en, 
  csreg_notdata_err_state_in_rw, 
  csreg_notdata_err_state_in_mend, 
  csreg_notdata_err_state_in, 
  csreg_notdata_diag_wr_en, 
  csreg_notdata_error_rw_en, 
  csreg_csr_notdata_addr_wr_en, 
  csreg_notdata_addr_mux_sel, 
  csr_error_status_notdata, 
  shadow_l2erraddr_reg, 
  shadow_notdata_reg, 
  shadow_error_status_reg);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire spares_scanin;
wire arb_inst_vld_c6;
wire arb_inst_vld_c7;
wire spares_scanout;
wire ff_csr_l2_control_reg_0_scanin;
wire ff_csr_l2_control_reg_0_scanout;
wire ff_csr_l2_control_reg_2to1_scanin;
wire ff_csr_l2_control_reg_2to1_scanout;
wire ff_csr_l2_control_reg_scb_int_scanin;
wire ff_csr_l2_control_reg_scb_int_scanout;
wire ff_csr_l2_control_reg_steering_scanin;
wire ff_csr_l2_control_reg_steering_scanout;
wire ff_csr_l2_control_reg_dbg_scanin;
wire ff_csr_l2_control_reg_dbg_scanout;
wire ff_csr_l2_control_reg_dir_clr_scanin;
wire ff_csr_l2_control_reg_dir_clr_scanout;
wire ff_dir_clr_d1_scanin;
wire ff_dir_clr_d1_scanout;
wire dir_clr_d1;
wire ff_dir_clr_d2_scanin;
wire ff_dir_clr_d2_scanout;
wire dir_clr_d2;
wire ff_scrub_count_scanin;
wire ff_scrub_count_scanout;
wire ff_csr_l2_erren_d1_scanin;
wire ff_csr_l2_erren_d1_scanout;
wire mbist_done;
wire [2:0] mbist_err;
wire [10:0] bist_data_prev;
wire ff_bist_registrer_scanin;
wire ff_bist_registrer_scanout;
wire [10:0] csr_bist_read_data_unused;
wire ff_csr_l2_errsynd_d1_scanin;
wire ff_csr_l2_errsynd_d1_scanout;
wire ff_inst_tid_c9_scanin;
wire ff_inst_tid_c9_scanout;
wire ff_csr_l2_erritid_d1_scanin;
wire ff_csr_l2_erritid_d1_scanout;
wire ff_async_bit_scanin;
wire ff_async_bit_scanout;
wire ff_csr_l2_errrw_d1_scanin;
wire ff_csr_l2_errrw_d1_scanout;
wire ff_csr_l2_errmeu_d1_scanin;
wire ff_csr_l2_errmeu_d1_scanout;
wire ff_csr_l2_errmec_d1_scanin;
wire ff_csr_l2_errmec_d1_scanout;
wire ff_csr_l2_errstate_d1_scanin;
wire ff_csr_l2_errstate_d1_scanout;
wire ff_csr_l2_erraddr_d1_scanin;
wire ff_csr_l2_erraddr_d1_scanout;
wire ff_csr_l2_errinj_d1_scanin;
wire ff_csr_l2_errinj_d1_scanout;
wire [63:0] csr_rd_data_c7_1;
wire [63:0] debug_csr_read_data;
wire [63:0] l2_mask_register;
wire [63:0] l2_compare_register;
wire ff_csr_rd_data_c8_scanin;
wire ff_csr_rd_data_c8_scanout;
wire ff_csr_l2_notdata_rw_d1_scanin;
wire ff_csr_l2_notdata_rw_d1_scanout;
wire ff_csr_l2_notdata_mend_d1_scanin;
wire ff_csr_l2_notdata_mend_d1_scanout;
wire ff_csr_l2_notdata_ndspnddm_d1_scanin;
wire ff_csr_l2_notdata_ndspnddm_d1_scanout;
wire sel_diag_notdata_wr;
wire ff_csr_l2_notdata_vcid_d1_scanin;
wire ff_csr_l2_notdata_vcid_d1_scanout;
wire ff_csr_l2_notdata_addr_d1_scanin;
wire ff_csr_l2_notdata_addr_d1_scanout;
wire [63:0] l2_compare_register_prev;
wire ff_l2_compare_register_scanin;
wire ff_l2_compare_register_scanout;
wire [63:0] l2_mask_register_prev;
wire ff_l2_mask_register_scanin;
wire ff_l2_mask_register_scanout;
wire [63:0] debug_address_inpipe;
wire ff_debug_address_inpipe_scanin;
wire ff_debug_address_inpipe_scanout;
wire [63:0] debug_address_inpipe_d1;
wire ff_instruction_vld_piped_scanin;
wire ff_instruction_vld_piped_scanout;
wire arb_inst_vld_c3;
wire arb_inst_vld_c4;
wire arb_inst_vld_c5;
wire arb_inst_vld_c52;
wire l2t_dbg_pa_match_unreg;
wire l2t_dbg_err_event_unreg;
wire ff_l2t_dbg_pa_match_scanin;
wire ff_l2t_dbg_pa_match_scanout;
wire warm_scanout_n;
wire warm_scanout;
 
 
output        	scan_out; 
output 	      	csr_filbuf_scrub_ready; // to filbuf. 
output		csr_l2_bypass_mode_on; // to arb 
output		csr_filbuf_l2off; 
output		csr_tag_l2off; 
output		csr_wbuf_l2off; 
output		csr_misbuf_l2off; 
output		csr_vuad_l2off; 
output		csr_l2_dir_map_on; // NEW_PIN 
output	[5:0]	csr_l2_steering_tid; // NEW_PIN, BS and SR 11/12/03 N2 Xbar Packet format change 
output		csr_error_nceen;
output  	csr_error_ceen;
output		csr_wr_dirpinj_en; 
output		csr_oneshot_dir_clear_c3; // NEW_PIN left 

// STM register. 
output	[63:0]	csr_rd_data_c8; 
output		csr_error_status_veu; 
output  	csr_error_status_vec;
output		csr_report_ldrc;
input		csreg_report_ldrc_inpkt;

output		notdata_higher_priority_err;
 
input	[63:0]	arbdat_csr_inst_wr_data_c8;// from arbdata POST_2.0 Left Replacement for mbdata* 
input		csreg_csr_bist_wr_en_c8;
input 		scan_in;
input 		l2clk; 
input           tcu_pce_ov;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input		aclk_wmr;
input		wmr_protect;
 
// from CSR CTL. 
input		csreg_csr_erren_wr_en_c8; 
input		csreg_csr_wr_en_c8; 
input		csreg_csr_errstate_wr_en_c8; 
input		csreg_csr_errinj_wr_en_c8; 

// debug changes
input  		csreg_l2_cmpr_reg_wr_en_c8;
input  		csreg_l2_mask_reg_wr_en_c8;
input  		arb_inst_vld_c2;
input	[1:0]	csreg_csr_rd_mux4_sel_c7;
input	[1:0]	csreg_csr_rd_mux_fnl_c7;
input   [4:0]   arbdec_csr_ttype_c6;
input   [5:0]   arbdec_csr_vcid_c6;
input   [33:2]  arbadr_csr_debug_addr;

input		csreg_wr_enable_notdata_nddm_vcid_c9;
output		l2t_dbg_err_event;
output		l2t_dbg_pa_match;

 
// read enables from csr. 
input	[3:0]	csreg_csr_rd_mux1_sel_c7; 
input		csreg_csr_rd_mux2_sel_c7; 
input	[1:0]	csreg_csr_rd_mux3_sel_c7; 
 
 
// Address inputs. 
input	[39:4]	arbadr_arbdp_csr_addr_c9 ; // c9 instruction addr from arbadr 
input	[39:6]	evctag_evict_addr ;	// from evctag. 
input	[39:6]  arbadr_rdmard_addr_c12; // from arbadr. 
input	[10:0]	arb_dir_addr_c9 ; // from arb 
input   [3:0]   tag_scrub_addr_way;   // from tag 
input	[8:0] 	arbadr_data_ecc_idx; // 	from arbaddr 
 
 
 
// Status register bits from csr 
input           csreg_err_state_in_rw ; 
input           csreg_err_state_in_mec ; 
input           csreg_err_state_in_meu ; 
input   [`ERR_LDAC:`ERR_LVC]   csreg_err_state_in ; 
 
// Syndrome mux selects 
input  [1:0]   csreg_mux1_synd_sel; // vuad and wr data 
input  [1:0]   csreg_mux2_synd_sel; // ldau and default 
input          csreg_csr_synd_wr_en; 
 
// Syndrome inputs. 
input	[6:0] 	usaloc_ua_synd_c9;
input	[6:0] 	vlddir_vd_synd_c9;
input	[27:0]	decc_lda_syndrome_c9; // from decc 
 
// TID 
input		csreg_wr_enable_tid_c9 ; 
input		csreg_csr_tid_wr_en; 
 
// ASYNC 
input		csreg_csr_async_wr_en; 

// int 5.0 changes
input        	set_async_c9;   // ADDED POST_4.0
input        	error_rw_en;  // ADDED POST_4.0
input        	diag_wr_en;  // ADDED POST_4.0



 
// Addr 
input  [3:0]   	csreg_mux1_addr_sel; 
input  [2:0]   	csreg_mux2_addr_sel; 
input          	csreg_csr_addr_wr_en; 
 
 
input		arb_dir_wr_en_c4; 
input   [5:0]   oque_tid_c8;            // From oque of l2t_oque_dp.sv, BS and SR 11/12/03 N2 Xbar Packet format change 


// Notdata related signals from l2t_csreg_ctl

input           csreg_csr_notdata_wr_en_c8;
input  	        csreg_wr_enable_notdata_vcid_c9;
input  	        csreg_csr_notdata_vcid_wr_en;
input           csreg_notdata_err_state_in_rw;
input           csreg_notdata_err_state_in_mend;
input  [`ERR_NDSP:`ERR_NDDM]   	csreg_notdata_err_state_in;
input           csreg_notdata_diag_wr_en;
input		csreg_notdata_error_rw_en;
input           csreg_csr_notdata_addr_wr_en;
input  [2:0]	csreg_notdata_addr_mux_sel; // 0 : c9 address, 1 : siu read address, 2 : diagnostic wr address

output		csr_error_status_notdata; // a Notdata error is already logged
 
//// shadow scan ports

output	[39:4]	shadow_l2erraddr_reg;
output	[`ERR_MEND:`ERR_NDADR_LO] shadow_notdata_reg;
output	[63:0]  shadow_error_status_reg;



//////////////////////////////////////////////////
// L1 clk header
//////////////////////////////////////////////////
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

l2t_csr_ctl_l1clkhdr_ctl_macro clkgen (
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
//spare_ctl_macro spares (num=10) (
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
wire spare7_flop_unused;
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

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
			       .q(spare0_flop_unused));
assign si_0 = spares_scanin;

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
                               .d(1'b0),
                               .q(spare7_flop_unused));
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
// BUG ID 110568 .d(1'b0), .q(spare9_flop_unused));
                               .d(arb_inst_vld_c6), .q(arb_inst_vld_c7));

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
assign spares_scanout = so_9;


///////////////////////////////////////////


 


wire	[5:0]	inst_tid_c9; // BS and SR 11/12/03 N2 Xbar Packet format change 
wire	[22:0]	csr_l2_control_prev; // BS and SR 11/12/03 N2 Xbar Packet format change 
wire	[22:0]	csr_l2_control_reg; // BS and SR 11/12/03 N2 Xbar Packet format change 
wire	[31:0]	scrub_counter, scrub_counter_plus1; 
wire	[31:0]	scrub_counter_p; 
 
wire	[2:0]	csr_l2_erren_prev; 
wire	[2:0]	csr_l2_erren_reg; 
 
wire	unqual_scrub_ready;  
wire	sel_scrub_zero; 
wire	[39:4]	csr_l2_erraddr_reg;  // int 5.0 changes
wire	[63:0]	csr_l2_errstate_reg; 
wire    [`ERR_MEND:`ERR_NDADR_LO]  csr_l2_notdata_reg;
wire    [`ERR_MEND:`ERR_NDADR_LO]  rd_notdata_reg;
wire	[1:0]	csr_l2_errinj_reg; 
wire	[63:0]	mux1_data_out_c7, mux2_data_out_c7; 
 
 
wire	csr_l2_control_prev_0_l, csr_l2_control_reg_0_l ; 
wire	[63:0]	csr_rd_data_c7; 
wire	[31:0]	mux1_synd_c9 ; 
wire	[63:0]	csr_l2_errstate_prev; 
wire    [`ERR_MEND:`ERR_NDADR_LO] csr_l2_notdata_prev;
wire	[12:0]	scrub_addr; 
wire	[39:4]	mux1_addr_c9; // int 5.0 changes
wire	[39:4]	csr_l2_erraddr_prev; // int 5.0 changes
wire	[1:0]	csr_l2_errinj_prev; 
 
wire	[63:0]	  rd_errstate_reg; 
wire            dbb_rst_l; 
wire	dbg_trigger; 
//wire	error_in; 
//wire	l2t_clk_tr_prev; 
// shadow scan
wire    [63:0]  shdw_rd_errstate_reg;
wire    [63:0]  shdw_rd_notdata_reg;
wire    [63:0]  shdw_csr_l2_erraddr_reg;


/////////////////////////////////////////////////////////////////////////////////// 
// L2 BIST CONTROL REGISTER Address<39:32>= 0xa8 
// 
//______________________________________________________________________________ 
// 
//	BIST_ReadOnly<12:9> BIST_WR fields<8:0> 
//______________________________________________________________________________ 
// This register is physically located in the test stub.  
// a 13 bit bus from the tstub is used for read. 
/////////////////////////////////////////////////////////////////////////////////// 
 
/////////////////////////////////////////////////////////////////////////////////// 
// L2 BANK CONTROL REgister Address<39:32> 0xa9 ; 
//______________________________________________________________________________ 
//  
//	DIR_CLEAR DBG_EN	Steering <19:15> SCB INERVal<14:3> SCB_EN  direct_mapped_on L2_OFF 
//_____________________________________________________________________________ 
// dir clr: This bit is used to perform a one shot clear of the  
// dbg en: mux select for the dbgbus that goes to the IOB 
// Steering id = {cpuid, tid } 
// scrub_interval: SCB interval  12 bits  
// scrub_enable:	scb_en 
// direct_mapped_on : direct mapped mode. 
// l2_off: l2 off mode. 
/////////////////////////////////////////////////////////////////////////////////// 
 
assign	csr_l2_control_prev[22:1] =   arbdat_csr_inst_wr_data_c8[22:1]  ;  // BS and SR 11/12/03 N2 Xbar Packet format change 
 
////////////// 
// L2 off bit 
// This bit is set to  
// 1 at POR. 
////////////// 
 
 
assign	csr_l2_control_prev_0_l  =  ~arbdat_csr_inst_wr_data_c8[0] ; 
 
l2t_csr_ctl_msff_ctl_macro__en_1__width_1 ff_csr_l2_control_reg_0  // sync reset active high
               (   // FS:wmr_protect
		.scan_in(ff_csr_l2_control_reg_0_scanin),
		.scan_out(ff_csr_l2_control_reg_0_scanout),
		.siclk	(aclk_wmr),
		.din(csr_l2_control_prev_0_l),  
		.en(csreg_csr_wr_en_c8),
		.l1clk(l1clk), .dout(csr_l2_control_reg_0_l),
  .soclk(soclk)  
		); 
 
assign	csr_l2_control_reg[0] = ~csr_l2_control_reg_0_l ; 
 
assign	csr_l2_bypass_mode_on = csr_l2_control_reg[0] ; 
assign	csr_filbuf_l2off = csr_l2_control_reg[0] ; 
assign	csr_tag_l2off = csr_l2_control_reg[0] ; 
assign	csr_wbuf_l2off = csr_l2_control_reg[0] ; 
assign	csr_misbuf_l2off = csr_l2_control_reg[0] ; 
assign	csr_vuad_l2off = csr_l2_control_reg[0] ; 
 
assign	csr_l2_dir_map_on = csr_l2_control_reg[1]  & ~csr_l2_control_reg[0]; // when both L2_OFF and L2_DIR_MAP 
									 // are 1, L2_DIR_MAP is ignored. 
assign	csr_l2_steering_tid = csr_l2_control_reg[20:15] ; 
 
 
////////////// 
// other mode bits 
////////////// 
l2t_csr_ctl_msff_ctl_macro__en_1__width_2 ff_csr_l2_control_reg_2to1  // sync reset active high
               ( // FS:wmr_protect
		.scan_in(ff_csr_l2_control_reg_2to1_scanin),
		.scan_out(ff_csr_l2_control_reg_2to1_scanout),
		.siclk	(aclk_wmr),
		.din(csr_l2_control_prev[2:1]),  
		.en(csreg_csr_wr_en_c8),
		.l1clk(l1clk), .dout(csr_l2_control_reg[2:1]),
  .soclk(soclk)  
		); 
 
////////////// 
// scrub interval. 
////////////// 
l2t_csr_ctl_msff_ctl_macro__en_1__width_12 ff_csr_l2_control_reg_scb_int  // sync reset active high
               ( // FS:wmr_protect
		.scan_in(ff_csr_l2_control_reg_scb_int_scanin),
		.scan_out(ff_csr_l2_control_reg_scb_int_scanout),
		.siclk	(aclk_wmr),
		.din(csr_l2_control_prev[14:3]),  
		.en(csreg_csr_wr_en_c8), 
		.l1clk(l1clk), .dout(csr_l2_control_reg[14:3]),
  .soclk(soclk)  
		); 
 
////////////// 
// steering bits + dbgen 
////////////// 
l2t_csr_ctl_msff_ctl_macro__en_1__width_6 ff_csr_l2_control_reg_steering  // sync reset active high , BS and SR 11/12/03 N2 Xbar Packet format change
              ( // FS:wmr_protect
		.scan_in(ff_csr_l2_control_reg_steering_scanin),
		.scan_out(ff_csr_l2_control_reg_steering_scanout),
		.siclk	(aclk_wmr),
		.din(csr_l2_control_prev[20:15]),  
		.en(csreg_csr_wr_en_c8), 
		.l1clk(l1clk), .dout(csr_l2_control_reg[20:15]),
  .soclk(soclk)  
		); 
 
////////////// 
// dbgen needs to be preserved across  
// a reset 
////////////// 
 
l2t_csr_ctl_msff_ctl_macro__en_1__width_1 ff_csr_l2_control_reg_dbg  // BS and SR 11/12/03 N2 Xbar Packet format change
                ( // FS:wmr_protect
		.scan_in(ff_csr_l2_control_reg_dbg_scanin),
		.scan_out(ff_csr_l2_control_reg_dbg_scanout),
		.siclk	(aclk_wmr),
		.din(csr_l2_control_prev[21]),  
		.en(csreg_csr_wr_en_c8),  
		.l1clk(l1clk), .dout(csr_l2_control_reg[21]),
  .soclk(soclk)  
		); 
 
 
////////////// 
// Directory clear bit. 
////////////// 
l2t_csr_ctl_msff_ctl_macro__en_1__width_1 ff_csr_l2_control_reg_dir_clr  // sync reset active high, BS and SR 11/12/03 N2 Xbar Packet format change
               ( // FS:wmr_protect
		.scan_in(ff_csr_l2_control_reg_dir_clr_scanin),
		.scan_out(ff_csr_l2_control_reg_dir_clr_scanout),
		.siclk	(aclk_wmr),
		.din(csr_l2_control_prev[22]),  
		.en(csreg_csr_wr_en_c8), 
		.l1clk(l1clk), .dout(csr_l2_control_reg[22]),
  .soclk(soclk)  
		); 
 
///////////////////////// 
// Directory clear logic 
// The dir clr bit is followed by 
// two shadow flops. 
// If the pattern on the two following flops is 
// 2'b10, the directory is cleared. Else it is not. 
// This ensures that one diagnostic write will perform 
// only one clear without destroying the contents of the 
// L2.ESR dir_Ctl bit. 
///////////////////////// 
 
l2t_csr_ctl_msff_ctl_macro__width_1 ff_dir_clr_d1 
               ( // FS:wmr_protect
		.scan_in(ff_dir_clr_d1_scanin),
		.scan_out(ff_dir_clr_d1_scanout),
		.siclk	(aclk_wmr),
		.din(csr_l2_control_reg[22]), .l1clk(l1clk), 
		.dout(dir_clr_d1),
  .soclk(soclk)  
		); 
 
l2t_csr_ctl_msff_ctl_macro__width_1 ff_dir_clr_d2 
               ( // FS:wmr_protect
		.scan_in(ff_dir_clr_d2_scanin),
		.scan_out(ff_dir_clr_d2_scanout),
		.siclk	(aclk_wmr),
		.din(dir_clr_d1), .l1clk(l1clk), 
		.dout(dir_clr_d2),
  .soclk(soclk)  
		); 
 
assign	 csr_oneshot_dir_clear_c3 = (dir_clr_d1 & ~dir_clr_d2); 
 
 
 
///////////////////////////////////////////////////////// 
// Scrub counter. 
// The scrub interval is programmable and has a range of 
// 1M - 4B cycles. 
// After a scrub interval, one set of the cache is 
// scrubbed. The scrub operation is synchronized with the 
// occurrence of the next fill after the scrub counter 
// expires. 
///////////////////////////////////////////////////////// 
 
 
	assign	sel_scrub_zero =   unqual_scrub_ready ; 
 
	assign	scrub_counter_plus1 = scrub_counter + 32'b1;  
 
l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_32 mux_scrub_count 
			(.dout(scrub_counter_p[31:0]), 
			 .din0(32'b0), .din1(scrub_counter_plus1[31:0]), 
			 .sel0(sel_scrub_zero), .sel1(~sel_scrub_zero)); 
 
l2t_csr_ctl_msff_ctl_macro__width_32 ff_scrub_count 
                 ( // FS:wmr_protect
		.scan_in(ff_scrub_count_scanin),
		.scan_out(ff_scrub_count_scanout),
		.siclk	(aclk_wmr),
		.din(scrub_counter_p[31:0]), .l1clk(l1clk), 
		.dout(scrub_counter[31:0]),
  .soclk(soclk)  
		); 
 
	assign	unqual_scrub_ready = ( scrub_counter[31:0] ==  
			{ csr_l2_control_reg[14:3], 20'b0} ) ; 
 
	assign	csr_filbuf_scrub_ready = unqual_scrub_ready &  
				csr_l2_control_reg[2] ; 
 
///////////////////////////////////////////////////////// 
// L2 error enable register.  
// -------------------------- 
//DBG_TRIG_EN	NCEEN	CEEN 
//--------------------------- 
///////////////////////////////////////////////////////// 
 
 
	assign	csr_l2_erren_prev[0]  = arbdat_csr_inst_wr_data_c8[0] ; 
	assign	csr_l2_erren_prev[1]  = arbdat_csr_inst_wr_data_c8[1] ; 
	assign	csr_l2_erren_prev[2]  = arbdat_csr_inst_wr_data_c8[2] ; 
 
l2t_csr_ctl_msff_ctl_macro__en_1__width_3 ff_csr_l2_erren_d1  // sync reset active high
               ( // FS:wmr_protect
		.scan_in(ff_csr_l2_erren_d1_scanin),
		.scan_out(ff_csr_l2_erren_d1_scanout),
		.siclk	(aclk_wmr),
		.din(csr_l2_erren_prev[2:0]),  
		.en(csreg_csr_erren_wr_en_c8), .l1clk(l1clk), 
		.dout(csr_l2_erren_reg[2:0]),
  .soclk(soclk)  
		); 
 
	assign	dbg_trigger      = 	     csr_l2_erren_reg[2] ; 
	assign	csr_error_nceen  = 	csr_l2_erren_reg[1] ; 
	assign	csr_error_ceen   = 	csr_l2_erren_reg[0] ; 
 

////////////////////////////////////////////////////////////////////////////////
//
//   BIST register
// This register is now in TCU hence always read as zeros
//
////////////////////////////////////////////////////////////////////////////////


assign mbist_done = 1'b0;
assign mbist_err = 3'b0;

assign bist_data_prev[10:0] = {mbist_done, mbist_err[2:0], arbdat_csr_inst_wr_data_c8[6:0]};

l2t_csr_ctl_msff_ctl_macro__en_1__width_11 ff_bist_registrer 
               (// FS:wmr_protect
		.scan_in(ff_bist_registrer_scanin),
		.scan_out(ff_bist_registrer_scanout),
		.siclk	(aclk_wmr),
		.din(bist_data_prev[10:0]),
                .en(csreg_csr_bist_wr_en_c8), 
		.l1clk(l1clk), 
                .dout(csr_bist_read_data_unused[10:0]),
  .soclk(soclk)
		);
 
////////////////////////////////////////////////////////////////////////////////// 
// L2 error status register. ( addr = ab ) 
// ------------------------------------------------------------------------------ 
// MEU MEC RW ASYN TID LDAC LDAU LDWC LDWULDRC LDRU LDSC LDSU LTC LRU LVU DAC DAU 
//------------------------------------------------------------------------------- 
// DRC	DRU	DSC	DSU	VEC 	VEU RSVD<34:32>	SYND<31:0> 
//------------------------------------------------------------------------------- 
// Keep the old value unless the new value being written is a 1. 
////////////////////////////////////////////////////////////////////////////////// 
 
 
 
////////////////////////////////////// 
// SYNDROME (NON_STICKY) // int 5.0 changes
// * vuad errors 
// * ldac/ldau 
// * ldrc/ldru for rdma writes only. 
////////////////////////////////////// 
 
l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_32 synd_c9_mux1   // VUAD ecc change
			(.dout(mux1_synd_c9[31:0]), 
                                .din0({18'b0,vlddir_vd_synd_c9[6:0],usaloc_ua_synd_c9[6:0]}), 
                                .din1({4'b0,arbdat_csr_inst_wr_data_c8[27:0]}), 
                                .sel0(csreg_mux1_synd_sel[0]), 
                                .sel1(csreg_mux1_synd_sel[1])); 
 
l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_32 synd_c9_mux2 
			(.dout(csr_l2_errstate_prev[31:0]), 
                                .din0(mux1_synd_c9[31:0]), 
                                .din1({4'b0,decc_lda_syndrome_c9[27:0]}), 
                                .sel0(csreg_mux2_synd_sel[1]), 
                                .sel1(csreg_mux2_synd_sel[0])); 
 
l2t_csr_ctl_msff_ctl_macro__en_1__width_32 ff_csr_l2_errsynd_d1 
			( // FS:wmr_protect
			.scan_in(ff_csr_l2_errsynd_d1_scanin),
			.scan_out(ff_csr_l2_errsynd_d1_scanout),
		.siclk	(aclk_wmr),
			.din(csr_l2_errstate_prev[31:0]), 
                         .en(csreg_csr_synd_wr_en), .l1clk(l1clk), 
                         .dout(csr_l2_errstate_reg[31:0]),
  .soclk(soclk) 
                          
); 
 
 
////////////////////////////////////// 
// TID BITS 
////////////////////////////////////// 
 
 
l2t_csr_ctl_msff_ctl_macro__width_6 ff_inst_tid_c9  // BS and SR 11/12/03 N2 Xbar Packet format change
				( // FS:wmr_protect
			.scan_in(ff_inst_tid_c9_scanin),
			.scan_out(ff_inst_tid_c9_scanout),
		.siclk	(aclk_wmr),
			.dout(inst_tid_c9[5:0]), .l1clk(l1clk), 
                               .din(oque_tid_c8[5:0]),
  .soclk(soclk) 
                                
); 
 
l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_6 mux_tid_c9  // BS and SR 11/12/03 N2 Xbar Packet format change
			(.dout(csr_l2_errstate_prev[`ERR_TID_HI:`ERR_TID_LO]), 
                         .din0(inst_tid_c9[5:0]), 
                         .din1(arbdat_csr_inst_wr_data_c8[`ERR_TID_HI:`ERR_TID_LO]), 
                         .sel0(csreg_wr_enable_tid_c9), 
                         .sel1(~csreg_wr_enable_tid_c9)); 
 
l2t_csr_ctl_msff_ctl_macro__en_1__width_6 ff_csr_l2_erritid_d1  // BS and SR 11/12/03 N2 Xbar Packet format change
		( // FS:wmr_protect
			.scan_in(ff_csr_l2_erritid_d1_scanin),
			.scan_out(ff_csr_l2_erritid_d1_scanout),
		.siclk	(aclk_wmr),
			.din(csr_l2_errstate_prev[`ERR_TID_HI:`ERR_TID_LO]), 
                 .en(csreg_csr_tid_wr_en), .l1clk(l1clk), 
                 .dout(csr_l2_errstate_reg[`ERR_TID_HI:`ERR_TID_LO]),
  .soclk(soclk) 
                  
); 
 
 
////////////////////////////////////// 
// ASYNC BIT (NON_STICKY) // int 5.0 changes
////////////////////////////////////// 
 
 

assign          csr_l2_errstate_prev[`ERR_ASYNC] = // int 5.0 change
                     ( diag_wr_en & arbdat_csr_inst_wr_data_c8[`ERR_ASYNC]) | // diag write
                     ( set_async_c9) ; // async ld hit

l2t_csr_ctl_msff_ctl_macro__en_1__width_1 ff_async_bit  // int 5.0 change
                (// FS:wmr_protect
		.scan_in(ff_async_bit_scanin),
		.scan_out(ff_async_bit_scanout),
		.siclk	(aclk_wmr),
		.din(csr_l2_errstate_prev[`ERR_ASYNC]), .l1clk(l1clk), 
                .dout(csr_l2_errstate_reg[`ERR_ASYNC]), .en(csreg_csr_async_wr_en),
  .soclk(soclk)
		); 
 
 
 
////////////////////////////////////// 
// RW BITS 
////////////////////////////////////// 
 
// int 5.0 changes
assign  csr_l2_errstate_prev[`ERR_RW] =
                        ( diag_wr_en & arbdat_csr_inst_wr_data_c8[`ERR_RW] ) |
                           csreg_err_state_in_rw ;


 
l2t_csr_ctl_msff_ctl_macro__en_1__width_1 ff_csr_l2_errrw_d1  // int 5.0 changes
		( // FS:wmr_protect
		.scan_in(ff_csr_l2_errrw_d1_scanin),
		.scan_out(ff_csr_l2_errrw_d1_scanout),
		.siclk	(aclk_wmr),
		.din(csr_l2_errstate_prev[`ERR_RW]), .l1clk(l1clk), 
                 .dout(csr_l2_errstate_reg[`ERR_RW]), .en(error_rw_en),
  .soclk(soclk)
                  
); 
 
 
////////////////////////////////////// 
// Error bits (STICKY)
////////////////////////////////////// 

// int 5.0 changes
// assign  csr_l2_errstate_prev[60] = arbdat_csr_inst_wr_data_c8[60];
// Reserved position in N1 and is now assignedto TID growing to 3 bits



assign  csr_l2_errstate_prev[`ERR_MEU]  = 
                       ( ~( csreg_csr_errstate_wr_en_c8 & 
                       arbdat_csr_inst_wr_data_c8[`ERR_MEU] )  & 
                       csr_l2_errstate_reg[`ERR_MEU] 
                       ) | csreg_err_state_in_meu ; 
 
 
assign  csr_l2_errstate_prev[`ERR_MEC]  = 
                       ( ~( csreg_csr_errstate_wr_en_c8 & 
                       arbdat_csr_inst_wr_data_c8[`ERR_MEC] )  & 
                       csr_l2_errstate_reg[`ERR_MEC] 
                       ) | csreg_err_state_in_mec ; 
 
assign  csr_l2_errstate_prev[`ERR_LDAC:`ERR_LVC] = 
                       ( ~({20{csreg_csr_errstate_wr_en_c8}} & 
                        arbdat_csr_inst_wr_data_c8[`ERR_LDAC:`ERR_LVC])  & 
                        csr_l2_errstate_reg[`ERR_LDAC:`ERR_LVC] 
                        ) | csreg_err_state_in[`ERR_LDAC:`ERR_LVC]  ; 
 
 
l2t_csr_ctl_msff_ctl_macro__width_1 ff_csr_l2_errmeu_d1 
                           (// FS:wmr_protect
			.scan_in(ff_csr_l2_errmeu_d1_scanin),
			.scan_out(ff_csr_l2_errmeu_d1_scanout),
		.siclk	(aclk_wmr),
			.din(csr_l2_errstate_prev[`ERR_MEU]),  
			.l1clk(l1clk), 
                 	.dout(csr_l2_errstate_reg[`ERR_MEU]),
  .soclk(soclk) 
                 	 
); 
 
l2t_csr_ctl_msff_ctl_macro__width_1 ff_csr_l2_errmec_d1 
                           (// FS:wmr_protect
			.scan_in(ff_csr_l2_errmec_d1_scanin),
			.scan_out(ff_csr_l2_errmec_d1_scanout),
		.siclk	(aclk_wmr),
			.din(csr_l2_errstate_prev[`ERR_MEC]),  
			.l1clk(l1clk), 
                 	.dout(csr_l2_errstate_reg[`ERR_MEC]),
  .soclk(soclk) 
                 	 
); 
 
l2t_csr_ctl_msff_ctl_macro__width_20 ff_csr_l2_errstate_d1 
                (// FS:wmr_protect
		.scan_in(ff_csr_l2_errstate_d1_scanin),
		.scan_out(ff_csr_l2_errstate_d1_scanout),
		.siclk	(aclk_wmr),
		.din(csr_l2_errstate_prev[`ERR_LDAC:`ERR_LVC]),  
		 .l1clk(l1clk), 
                 .dout(csr_l2_errstate_reg[`ERR_LDAC:`ERR_LVC]),
  .soclk(soclk) 
                  
); 
 
assign  csr_error_status_veu = csr_l2_errstate_reg[`ERR_VEU] ; 
assign  csr_error_status_vec = csr_l2_errstate_reg[`ERR_VEC] ; 

 
 
////////////////////////////////////////////////////////////////////////////////// 
// L2 Error Address Register	( addr = ac ) 
// ------------------------------------------- 
//			Addr<39:4>,4'b0  
// ------------------------------------------- 
//     dir_addr<10:6> = panel # 
//     dir_addr<5:1> = entry # 
//     dir_addr<0> = I$ , 0= d$ 
////////////////////////////////////////////////////////////////////////////////// 
 
 
 
assign  scrub_addr = { tag_scrub_addr_way, arbadr_data_ecc_idx } ; 
 
l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_36 addr_c9_mux1  // int 5.0 changes
			(.dout(mux1_addr_c9[39:4]), 
                                .din0({24'b0,arb_dir_addr_c9[10:9],arb_dir_addr_c9[7:0],2'b0}),  
                                .din1({18'b0,scrub_addr[12:0],5'b0}),  
                                .din2({evctag_evict_addr[39:6],2'b0}), 
                                .din3({arbadr_rdmard_addr_c12[39:6],2'b0}), 
                                .sel0(csreg_mux1_addr_sel[0]), 
                                .sel1(csreg_mux1_addr_sel[1]), 
                                .sel2(csreg_mux1_addr_sel[2]), 
                                .sel3(csreg_mux1_addr_sel[3])); 
 
l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_36 addr_c9_mux2   // int 5.0 changes
			(.dout(csr_l2_erraddr_prev[39:4]), 
                                .din0(mux1_addr_c9[39:4]), 
                                .din1(arbadr_arbdp_csr_addr_c9[39:4]), 
                                .din2(arbdat_csr_inst_wr_data_c8[39:4]), 
                                .sel0(csreg_mux2_addr_sel[0]), 
                                .sel1(csreg_mux2_addr_sel[1]), 
                                .sel2(csreg_mux2_addr_sel[2])); 
 
l2t_csr_ctl_msff_ctl_macro__en_1__width_36 ff_csr_l2_erraddr_d1  // int 5.0 changes
                           (// FS:wmr_protect
			.scan_in(ff_csr_l2_erraddr_d1_scanin),
			.scan_out(ff_csr_l2_erraddr_d1_scanout),
		.siclk	(aclk_wmr),
			.din(csr_l2_erraddr_prev[39:4]), 
                              .en(csreg_csr_addr_wr_en), .l1clk(l1clk), 
                              .dout(csr_l2_erraddr_reg[39:4]),
  .soclk(soclk) 
                               
); 
 
////////////////////////////////////////////////////////////////////////////////// 
// L2 Error INJ Register    ( addr = ad ) 
// ------------------------------------------- 
//                      SSHOT,ENB 
// ------------------------------------------- 
////////////////////////////////////////////////////////////////////////////////// 
 
 
// ENB bit. 
// Set on write. 
// Reset on write OR if ONESHOT bit is set. 
 
assign  csr_l2_errinj_prev[0] = ( csr_l2_errinj_reg[0] | 
                                csreg_csr_errinj_wr_en_c8 & arbdat_csr_inst_wr_data_c8[0] ) 
                                & ~((arb_dir_wr_en_c4  & csr_l2_errinj_reg[1] ) | 
                                (csreg_csr_errinj_wr_en_c8 & ~arbdat_csr_inst_wr_data_c8[0] )) ; 
 
// SSHOT bit can only be set or reset using a CSR Write 
assign  csr_l2_errinj_prev[1] = ( csr_l2_errinj_reg[1] | 
                                csreg_csr_errinj_wr_en_c8 & arbdat_csr_inst_wr_data_c8[1] ) 
                                & ~( csreg_csr_errinj_wr_en_c8 & ~arbdat_csr_inst_wr_data_c8[1] ) ; 
 
 
 
l2t_csr_ctl_msff_ctl_macro__width_2 ff_csr_l2_errinj_d1  // sync reset active low
			(// FS:wmr_protect
			.scan_in(ff_csr_l2_errinj_d1_scanin),
			.scan_out(ff_csr_l2_errinj_d1_scanout),
		.siclk	(aclk_wmr),
			.din(csr_l2_errinj_prev[1:0]), .l1clk(l1clk), 
                         .dout(csr_l2_errinj_reg[1:0]),
  .soclk(soclk) 
                          
); 
 
assign  csr_wr_dirpinj_en = csr_l2_errinj_reg[0] ; 
 
 
////////////////////////////////////////////////////////////////////////////////// 
// THIS REGISTER DOES NOT EXIST ANYMORE
// L2 SELF TIME MARGIN REGISTER ( ae or af) 
// ------------------------------------------------ 
//        CAM2<7:0> DIR<7:0> DATA<3:0> TAG<3:0> 
// ------------------------------------------------ 
//////////////////////////////////////////////////////////////////////////////////// 
// 
// 
//	assign  csr_l2_stm_prev[23:0] = arbdat_csr_inst_wr_data_c8[23:0] ; 
// 
//msff_ctl_macro ff_csr_l2_stm_reg (width=24,en=1,clr=1) // sync reset active high
//                           (.din(csr_l2_stm_prev[23:0]), 
//                 .en(csreg_csr_stm_wr_en_c8), .l1clk(l1clk), .clr(~dbb_rst_l), 
//		.dout(csr_l2_stm_reg[23:0]),  
//		.scan_in(), 
//		.scan_out()
//); 
// 
//	assign	l2t_l2d_l2d_cbit = csr_l2_stm_reg[3:0] ; 
// 	//assign  l2t_cam2_stm = csr_l2_stm_reg[23:16] ; 
//	assign  l2t_dir_stm = csr_l2_stm_reg[15:8] ; 
//	//assign  l2t_tag_stm = csr_l2_stm_reg[7:4] ; 
// 
// 
// 
// 
//////////////////////////////////////////////////////////////////////////////////// 
// READ OPERATION 
////////////////////////////////////////////////////////////////////////////////// 
 
assign  rd_errstate_reg = { csr_l2_errstate_reg[63:60], // bit 60 ERR_ASYNC has to be used 
                            csr_l2_errstate_reg[59:34],
				5'b0, 
                            csr_l2_errstate_reg[28:0] } ; 

assign csr_report_ldrc = csreg_report_ldrc_inpkt; 
 
 
l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_64 mux_mux1_data_out_c7 
			(.dout ( mux1_data_out_c7[63:0] ) , 
                                .din0(64'b0),	// A8 
                                .din1({42'b0,csr_l2_control_reg[21:0]}), // A9 
                                .din2({61'b0,csr_l2_erren_reg[2:0]}),	// AA 
                                .din3(rd_errstate_reg[63:0]),	// AB 
                                .sel0(csreg_csr_rd_mux1_sel_c7[0]), 
                                .sel1(csreg_csr_rd_mux1_sel_c7[1]), 
                                .sel2(csreg_csr_rd_mux1_sel_c7[2]), 
                                .sel3(csreg_csr_rd_mux1_sel_c7[3])); 
 
l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_64 mux_mux2_data_out_c7  
			(.dout (mux2_data_out_c7[63:0] ) , 
                                .din0({24'b0,csr_l2_erraddr_reg[39:4],4'b0}),	// AC 
                                .din1({62'b0,csr_l2_errinj_reg[1:0]}),		// AD 
                                .din2({12'b0,rd_notdata_reg[`ERR_MEND:`ERR_NDADR_LO],4'b0}), // AE or AF
                                .sel0(csreg_csr_rd_mux1_sel_c7[0]), 
                                .sel1(csreg_csr_rd_mux1_sel_c7[1]), 
                                .sel2(csreg_csr_rd_mux2_sel_c7)); 
 
l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_64 mux3_data_out_c8 
			(.dout ( csr_rd_data_c7_1[63:0] ) , 
                                .din0({mux1_data_out_c7[63:0]}), 
                                .din1({mux2_data_out_c7[63:0]}), 
                                .sel0(csreg_csr_rd_mux3_sel_c7[0]), 
                                .sel1(csreg_csr_rd_mux3_sel_c7[1])
				); 


l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_64 mux_fnl_data_out_c8 
                        (.dout ( csr_rd_data_c7[63:0] ) ,
                                .din0(csr_rd_data_c7_1[63:0]),
                                .din1(debug_csr_read_data[63:0]),
                                .sel0(csreg_csr_rd_mux_fnl_c7[0]),
                                .sel1(csreg_csr_rd_mux_fnl_c7[1])
                                );



l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_64 mux4_data_out_c8 
                        (.dout ( debug_csr_read_data[63:0] ) ,
                                .din0(l2_mask_register[63:0]),
                                .din1(l2_compare_register[63:0]),
                                .sel0(csreg_csr_rd_mux4_sel_c7[1]),
                                .sel1(csreg_csr_rd_mux4_sel_c7[0]));





 
l2t_csr_ctl_msff_ctl_macro__width_64 ff_csr_rd_data_c8 
                       (// FS:wmr_protect
			.scan_in(ff_csr_rd_data_c8_scanin),
			.scan_out(ff_csr_rd_data_c8_scanout),
		.siclk	(aclk_wmr),
			.din(csr_rd_data_c7[63:0]), 
        		.l1clk(l1clk),  
			.dout(csr_rd_data_c8[63:0]),
  .soclk(soclk)  
			 
); 

// Follow Bug id : 87784 
// Notdata Error Register BS 06/13/04 
// 51     : NDRW    R/W
// 50     : MEND    R/W1C
// 49     : NDSP    R/W1C
// 48     : NDDM    R/W1C
// 47:46  : RSVD    R(0's)
// 45:40  : NDVCID  R/W
// 39:4   : NDADR   R/W
// 3:0    : RSVD    R(0's)

//////////////////////////////////////
// NDRW BIT
//////////////////////////////////////
//
//assign  csr_l2_notdata_prev[`ERR_NDRW] =
//                        ( csreg_notdata_diag_wr_en & arbdat_csr_inst_wr_data_c8[`ERR_NDRW] ) |
//                           csreg_notdata_err_state_in_rw;
//


assign  csr_l2_notdata_prev[`ERR_NDRW] = ( csreg_notdata_diag_wr_en & arbdat_csr_inst_wr_data_c8[`ERR_NDRW] ) |
			 csreg_notdata_err_state_in_rw & ~(csr_l2_notdata_reg[`ERR_NDSP] & csr_l2_notdata_reg[`ERR_NDRW]);



l2t_csr_ctl_msff_ctl_macro__en_1__width_1 ff_csr_l2_notdata_rw_d1 
                (// FS:wmr_protect
		.scan_in(ff_csr_l2_notdata_rw_d1_scanin),
		.scan_out(ff_csr_l2_notdata_rw_d1_scanout),
		.siclk	(aclk_wmr),
		.din(csr_l2_notdata_prev[`ERR_NDRW]), .l1clk(l1clk),
                 .dout(csr_l2_notdata_reg[`ERR_NDRW]), .en(csreg_notdata_error_rw_en),
  .soclk(soclk)

);

assign notdata_higher_priority_err = csr_l2_notdata_reg[`ERR_NDRW] & csr_l2_notdata_reg[`ERR_NDSP];

//////////////////////////////////////
// MEND BIT
//////////////////////////////////////

assign  csr_l2_notdata_prev[`ERR_MEND]  =
                       ( ~( csreg_csr_notdata_wr_en_c8 &
                       arbdat_csr_inst_wr_data_c8[`ERR_MEND] )  &
                       csr_l2_notdata_reg[`ERR_MEND]
                       ) | csreg_notdata_err_state_in_mend;

l2t_csr_ctl_msff_ctl_macro__width_1 ff_csr_l2_notdata_mend_d1 
                           (// FS:wmr_protect
		.scan_in(ff_csr_l2_notdata_mend_d1_scanin),
		.scan_out(ff_csr_l2_notdata_mend_d1_scanout),
		.siclk	(aclk_wmr),
		.din(csr_l2_notdata_prev[`ERR_MEND]),
                        .l1clk(l1clk),
                        .dout(csr_l2_notdata_reg[`ERR_MEND]),
  .soclk(soclk)
);

//////////////////////////////////////
// NDSP and NDRW  BITS
//////////////////////////////////////

assign  csr_l2_notdata_prev[`ERR_NDSP:`ERR_NDDM]  =
                       ( ~({2{csreg_csr_notdata_wr_en_c8}} &
                       arbdat_csr_inst_wr_data_c8[`ERR_NDSP:`ERR_NDDM]) &
                       csr_l2_notdata_reg[`ERR_NDSP:`ERR_NDDM]
                       ) | csreg_notdata_err_state_in[`ERR_NDSP:`ERR_NDDM];

l2t_csr_ctl_msff_ctl_macro__width_4 ff_csr_l2_notdata_ndspnddm_d1 
                           (// FS:wmr_protect
		.scan_in(ff_csr_l2_notdata_ndspnddm_d1_scanin),
		.scan_out(ff_csr_l2_notdata_ndspnddm_d1_scanout),
		.siclk	(aclk_wmr),
		.din({csr_l2_notdata_prev[`ERR_NDSP:`ERR_NDDM],2'b0}),
                        .l1clk(l1clk),
                        .dout(csr_l2_notdata_reg[`ERR_NDSP:`ERR_NDDM-2]),
  .soclk(soclk)
);


//////////////////////////////////////
// NDVCID BITS
//////////////////////////////////////


assign sel_diag_notdata_wr = ~(csreg_wr_enable_notdata_vcid_c9 | csreg_wr_enable_notdata_nddm_vcid_c9);

l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_6 mux_ndvcid_c9 
       (
	.dout(csr_l2_notdata_prev[`ERR_NDVCID_HI:`ERR_NDVCID_LO]),
        .din0(inst_tid_c9[5:0]),
	.din1(csr_l2_steering_tid[5:0]),
        .din2(arbdat_csr_inst_wr_data_c8[`ERR_NDVCID_HI:`ERR_NDVCID_LO]),
        .sel0(csreg_wr_enable_notdata_vcid_c9),
        .sel1(csreg_wr_enable_notdata_nddm_vcid_c9),
        .sel2(sel_diag_notdata_wr)
	);





l2t_csr_ctl_msff_ctl_macro__en_1__width_6 ff_csr_l2_notdata_vcid_d1  // BS and SR 11/12/03 N2 Xbar Packet format change
                (// FS:wmr_protect
		.scan_in(ff_csr_l2_notdata_vcid_d1_scanin),
		.scan_out(ff_csr_l2_notdata_vcid_d1_scanout),
		.siclk	(aclk_wmr),
		.din(csr_l2_notdata_prev[`ERR_NDVCID_HI:`ERR_NDVCID_LO]),
                 .en(csreg_csr_notdata_vcid_wr_en), .l1clk(l1clk),
                 .dout(csr_l2_notdata_reg[`ERR_NDVCID_HI:`ERR_NDVCID_LO]),
  .soclk(soclk)

);

//////////////////////////////////////
// NDADR BITS
//////////////////////////////////////

l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_36 mux_ndadr_c9   // int 5.0 changes
                        (.dout(csr_l2_notdata_prev[`ERR_NDADR_HI:`ERR_NDADR_LO]),
                                .din0(arbadr_arbdp_csr_addr_c9[39:4]), // c9 address
                                .din1({arbadr_rdmard_addr_c12[39:6],2'b0}), // siu address
                                .din2(arbdat_csr_inst_wr_data_c8[`ERR_NDADR_HI:`ERR_NDADR_LO]), // diagnostic wr data 
                                .sel0(csreg_notdata_addr_mux_sel[0]),
                                .sel1(csreg_notdata_addr_mux_sel[1]),
                                .sel2(csreg_notdata_addr_mux_sel[2]));

l2t_csr_ctl_msff_ctl_macro__en_1__width_36 ff_csr_l2_notdata_addr_d1  // int 5.0 changes
                           (// FS:wmr_protect
		.scan_in(ff_csr_l2_notdata_addr_d1_scanin),
		.scan_out(ff_csr_l2_notdata_addr_d1_scanout),
		.siclk	(aclk_wmr),
		.din(csr_l2_notdata_prev[`ERR_NDADR_HI:`ERR_NDADR_LO]),
                              .en(csreg_csr_notdata_addr_wr_en), .l1clk(l1clk),
                              .dout(csr_l2_notdata_reg[`ERR_NDADR_HI:`ERR_NDADR_LO]),
  .soclk(soclk)

);

// Bug id : 87784 
// 50 : NDRW 
// 51 : MEND  It is difficult to go change the entire logic around
// Hence swapping just these two bit definitions while reading it 
// to keep it consistent with PRM
//assign rd_notdata_reg = {csr_l2_notdata_reg[`ERR_MEND],csr_l2_notdata_reg[`ERR_NDRW],csr_l2_notdata_reg[ERR_NDSP:`ERR_NDADR_LO]};

assign rd_notdata_reg =  csr_l2_notdata_reg[`ERR_MEND:`ERR_NDADR_LO];

assign csr_error_status_notdata =  (|(csr_l2_notdata_reg[`ERR_NDSP:`ERR_NDDM]));   
              // a Notdata Error is already logged
 
//////////////////////////////////////
//// Shadow scan registers
////////////////////////////////////////
assign shadow_l2erraddr_reg[39:4] = csr_l2_erraddr_reg[39:4];
assign shadow_notdata_reg[`ERR_MEND:`ERR_NDADR_LO] = rd_notdata_reg[`ERR_MEND:`ERR_NDADR_LO];
assign shadow_error_status_reg[63:0] = rd_errstate_reg[63:0];



// input  csreg_l2_cmpr_reg_wr_en_c8;
// input  csreg_l2_mask_reg_wr_en_c8;
//////////////////////////////////////
//// Debug block
////////////////////////////////////////


// L2 Compare Register

//assign l2_compare_register_prev[63:0] = ({64{csreg_l2_cmpr_reg_wr_en_c8}} & 
//		{12'b0,arbdat_csr_inst_wr_data_c8[51:48],2'b0,arbdat_csr_inst_wr_data_c8[45:40],6'b0,
//			arbdat_csr_inst_wr_data_c8[33:2],2'b0} );// | l2_compare_register;

assign l2_compare_register_prev[63:0] = ( {11'b0,arbdat_csr_inst_wr_data_c8[52:48],2'b0,
arbdat_csr_inst_wr_data_c8[45:40],6'b0,arbdat_csr_inst_wr_data_c8[33:2],2'b0} );

l2t_csr_ctl_msff_ctl_macro__en_1__width_64	ff_l2_compare_register	
	(// FS:wmr_protect
	.scan_in(ff_l2_compare_register_scanin),
	.scan_out(ff_l2_compare_register_scanout),
		.siclk	(aclk_wmr),
	.dout	(l2_compare_register[63:0]),
	.l1clk	(l1clk),
        .en     (csreg_l2_cmpr_reg_wr_en_c8),
	.din	(l2_compare_register_prev[63:0]),
  .soclk(soclk)
	);

// L2 Mask register

//assign l2_mask_register_prev[63:0] = ({64{csreg_l2_mask_reg_wr_en_c8}} &
//                {12'b0,arbdat_csr_inst_wr_data_c8[51:48],2'b0,arbdat_csr_inst_wr_data_c8[45:40],
//		  6'b0,arbdat_csr_inst_wr_data_c8[33:2],2'b0} ) ;// | l2_mask_register;

assign l2_mask_register_prev[63:0] = ({11'b0,arbdat_csr_inst_wr_data_c8[52:48],
	2'b0,arbdat_csr_inst_wr_data_c8[45:40],6'b0,arbdat_csr_inst_wr_data_c8[33:2],2'b0} ) ;

l2t_csr_ctl_msff_ctl_macro__en_1__width_64  ff_l2_mask_register  
        (// FS:wmr_protect
        .scan_in(ff_l2_mask_register_scanin),
        .scan_out(ff_l2_mask_register_scanout),
		.siclk	(aclk_wmr),
        .dout   (l2_mask_register[63:0]),
        .l1clk  (l1clk),
        .en     (csreg_l2_mask_reg_wr_en_c8),
        .din    (l2_mask_register_prev[63:0]),
  .soclk(soclk)
        );

assign debug_address_inpipe[63:0] = ({11'b0,arbdec_csr_ttype_c6[4:0],2'b0,
		arbdec_csr_vcid_c6[5:0],6'b0,arbadr_csr_debug_addr[33:2],2'b0});

l2t_csr_ctl_msff_ctl_macro__width_64  ff_debug_address_inpipe  
        (// FS:wmr_protect
        .scan_in(ff_debug_address_inpipe_scanin),
        .scan_out(ff_debug_address_inpipe_scanout),
		.siclk	(aclk_wmr),
        .dout   (debug_address_inpipe_d1[63:0]),
        .l1clk  (l1clk),
        .din    (debug_address_inpipe[63:0]),
  .soclk(soclk)
        );

l2t_csr_ctl_msff_ctl_macro__width_5  ff_instruction_vld_piped  
        (// FS:wmr_protect
        .scan_in(ff_instruction_vld_piped_scanin),
        .scan_out(ff_instruction_vld_piped_scanout),
		.siclk	(aclk_wmr),
        .dout   ({arb_inst_vld_c3,arb_inst_vld_c4,arb_inst_vld_c5,arb_inst_vld_c52,arb_inst_vld_c6}),
        .l1clk  (l1clk),
        .din    ({arb_inst_vld_c2,arb_inst_vld_c3,arb_inst_vld_c4,arb_inst_vld_c5,arb_inst_vld_c52}),
  .soclk(soclk)
        );


assign l2t_dbg_pa_match_unreg = ((debug_address_inpipe_d1[63:0] & l2_mask_register[63:0]) 
// BUG ID 110568				== l2_compare_register[63:0]) & arb_inst_vld_c6; 
				 == l2_compare_register[63:0]) & arb_inst_vld_c7; 

assign l2t_dbg_err_event_unreg = (csr_error_status_notdata | csr_error_status_veu | csr_error_status_vec) 
			& dbg_trigger;


l2t_csr_ctl_msff_ctl_macro__width_2  ff_l2t_dbg_pa_match  
        (// FS:wmr_protect
        .scan_in(ff_l2t_dbg_pa_match_scanin),
        .scan_out(ff_l2t_dbg_pa_match_scanout),
	.siclk	(aclk_wmr),
        .dout   ({l2t_dbg_pa_match,l2t_dbg_err_event}),
        .l1clk  (l1clk),
        .din    ({l2t_dbg_pa_match_unreg,l2t_dbg_err_event_unreg}),
  .soclk(soclk)
        );


assign warm_scanout_n = ~warm_scanout;

assign scan_out = ~(warm_scanout_n | wmr_protect);



///////////////////////////////////////////////////////////////////////////////////////////////////
// fixscan start:
assign spares_scanin             = scan_in                  ;
assign ff_csr_l2_control_reg_0_scanin = spares_scanout       ;
assign ff_csr_l2_control_reg_2to1_scanin = ff_csr_l2_control_reg_0_scanout;
assign ff_csr_l2_control_reg_scb_int_scanin = ff_csr_l2_control_reg_2to1_scanout;
assign ff_csr_l2_control_reg_steering_scanin = ff_csr_l2_control_reg_scb_int_scanout;
assign ff_csr_l2_control_reg_dbg_scanin = ff_csr_l2_control_reg_steering_scanout;
assign ff_csr_l2_control_reg_dir_clr_scanin = ff_csr_l2_control_reg_dbg_scanout;
assign ff_dir_clr_d1_scanin      = ff_csr_l2_control_reg_dir_clr_scanout;
assign ff_dir_clr_d2_scanin      = ff_dir_clr_d1_scanout    ;
assign ff_scrub_count_scanin     = ff_dir_clr_d2_scanout    ;
assign ff_csr_l2_erren_d1_scanin = ff_scrub_count_scanout   ;
assign ff_bist_registrer_scanin  = ff_csr_l2_erren_d1_scanout;
assign ff_csr_l2_errsynd_d1_scanin = ff_bist_registrer_scanout;
assign ff_inst_tid_c9_scanin     = ff_csr_l2_errsynd_d1_scanout;
assign ff_csr_l2_erritid_d1_scanin = ff_inst_tid_c9_scanout   ;
assign ff_async_bit_scanin       = ff_csr_l2_erritid_d1_scanout;
assign ff_csr_l2_errrw_d1_scanin = ff_async_bit_scanout     ;
assign ff_csr_l2_errmeu_d1_scanin = ff_csr_l2_errrw_d1_scanout;
assign ff_csr_l2_errmec_d1_scanin = ff_csr_l2_errmeu_d1_scanout;
assign ff_csr_l2_errstate_d1_scanin = ff_csr_l2_errmec_d1_scanout;
assign ff_csr_l2_erraddr_d1_scanin = ff_csr_l2_errstate_d1_scanout;
assign ff_csr_l2_errinj_d1_scanin = ff_csr_l2_erraddr_d1_scanout;
assign ff_csr_rd_data_c8_scanin  = ff_csr_l2_errinj_d1_scanout;
assign ff_csr_l2_notdata_rw_d1_scanin = ff_csr_rd_data_c8_scanout;
assign ff_csr_l2_notdata_mend_d1_scanin = ff_csr_l2_notdata_rw_d1_scanout;
assign ff_csr_l2_notdata_ndspnddm_d1_scanin = ff_csr_l2_notdata_mend_d1_scanout;
assign ff_csr_l2_notdata_vcid_d1_scanin = ff_csr_l2_notdata_ndspnddm_d1_scanout;
assign ff_csr_l2_notdata_addr_d1_scanin = ff_csr_l2_notdata_vcid_d1_scanout;
assign ff_l2_compare_register_scanin = ff_csr_l2_notdata_addr_d1_scanout;
assign ff_l2_mask_register_scanin = ff_l2_compare_register_scanout;
assign ff_debug_address_inpipe_scanin = ff_l2_mask_register_scanout;
assign ff_instruction_vld_piped_scanin = ff_debug_address_inpipe_scanout;
assign ff_l2t_dbg_pa_match_scanin = ff_instruction_vld_piped_scanout;
assign warm_scanout                  = ff_l2t_dbg_pa_match_scanout;
// fixscan end:
endmodule 






// any PARAMS parms go into naming of macro

module l2t_csr_ctl_l1clkhdr_ctl_macro (
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

module l2t_csr_ctl_msff_ctl_macro__en_1__width_1 (
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

module l2t_csr_ctl_msff_ctl_macro__en_1__width_2 (
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

module l2t_csr_ctl_msff_ctl_macro__en_1__width_12 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [11:0] fdin;
wire [10:0] so;

  input [11:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [11:0] dout;
  output scan_out;
assign fdin[11:0] = (din[11:0] & {12{en}}) | (dout[11:0] & ~{12{en}});






dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_csr_ctl_msff_ctl_macro__en_1__width_6 (
  din, 
  en, 
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
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = (din[5:0] & {6{en}}) | (dout[5:0] & ~{6{en}});






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

module l2t_csr_ctl_msff_ctl_macro__width_1 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_32 (
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






// any PARAMS parms go into naming of macro

module l2t_csr_ctl_msff_ctl_macro__width_32 (
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

module l2t_csr_ctl_msff_ctl_macro__en_1__width_3 (
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













// any PARAMS parms go into naming of macro

module l2t_csr_ctl_msff_ctl_macro__en_1__width_11 (
  din, 
  en, 
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
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [10:0] dout;
  output scan_out;
assign fdin[10:0] = (din[10:0] & {11{en}}) | (dout[10:0] & ~{11{en}});






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

module l2t_csr_ctl_msff_ctl_macro__en_1__width_32 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = (din[31:0] & {32{en}}) | (dout[31:0] & ~{32{en}});






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

module l2t_csr_ctl_msff_ctl_macro__width_6 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_6 (
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

module l2t_csr_ctl_msff_ctl_macro__width_20 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_36 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
  input [35:0] din0;
  input sel0;
  input [35:0] din1;
  input sel1;
  input [35:0] din2;
  input sel2;
  input [35:0] din3;
  input sel3;
  output [35:0] dout;





assign dout[35:0] = ( {36{sel0}} & din0[35:0] ) |
                       ( {36{sel1}} & din1[35:0]) |
                       ( {36{sel2}} & din2[35:0]) |
                       ( {36{sel3}} & din3[35:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_36 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [35:0] din0;
  input sel0;
  input [35:0] din1;
  input sel1;
  input [35:0] din2;
  input sel2;
  output [35:0] dout;





assign dout[35:0] = ( {36{sel0}} & din0[35:0] ) |
                       ( {36{sel1}} & din1[35:0]) |
                       ( {36{sel2}} & din2[35:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_csr_ctl_msff_ctl_macro__en_1__width_36 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [35:0] fdin;
wire [34:0] so;

  input [35:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [35:0] dout;
  output scan_out;
assign fdin[35:0] = (din[35:0] & {36{en}}) | (dout[35:0] & ~{36{en}});






dff #(36)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[35:0]),
.si({scan_in,so[34:0]}),
.so({so[34:0],scan_out}),
.q(dout[35:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_csr_ctl_msff_ctl_macro__width_2 (
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

module l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;
  output [63:0] dout;





assign dout[63:0] = ( {64{sel0}} & din0[63:0] ) |
                       ( {64{sel1}} & din1[63:0]) |
                       ( {64{sel2}} & din2[63:0]) |
                       ( {64{sel3}} & din3[63:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  output [63:0] dout;





assign dout[63:0] = ( {64{sel0}} & din0[63:0] ) |
                       ( {64{sel1}} & din1[63:0]) |
                       ( {64{sel2}} & din2[63:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  output [63:0] dout;





assign dout[63:0] = ( {64{sel0}} & din0[63:0] ) |
                       ( {64{sel1}} & din1[63:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_csr_ctl_msff_ctl_macro__width_64 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = din[63:0];






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_csr_ctl_msff_ctl_macro__width_4 (
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

module l2t_csr_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_6 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [5:0] din0;
  input sel0;
  input [5:0] din1;
  input sel1;
  input [5:0] din2;
  input sel2;
  output [5:0] dout;





assign dout[5:0] = ( {6{sel0}} & din0[5:0] ) |
                       ( {6{sel1}} & din1[5:0]) |
                       ( {6{sel2}} & din2[5:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_csr_ctl_msff_ctl_macro__en_1__width_64 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = (din[63:0] & {64{en}}) | (dout[63:0] & ~{64{en}});






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_csr_ctl_msff_ctl_macro__width_5 (
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








