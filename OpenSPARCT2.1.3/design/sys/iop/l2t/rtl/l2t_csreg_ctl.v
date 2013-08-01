// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_csreg_ctl.v
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
 
module l2t_csreg_ctl (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  arb_csr_wr_en_c7, 
  arbadr_arbdp_word_addr_c6, 
  l2clk, 
  cmp_io_sync_en, 
  scan_in, 
  vuaddp_vuad_error_c8, 
  dirrep_dir_error_c8, 
  deccck_spcd_corr_err_c8, 
  deccck_spcd_uncorr_err_c8, 
  deccck_spcd_notdata_err_c8, 
  deccck_scrd_corr_err_c8, 
  deccck_scrd_uncorr_err_c8, 
  deccck_spcfb_corr_err_c8, 
  deccck_spcfb_uncorr_err_c8, 
  deccck_bscd_corr_err_c8, 
  deccck_bscd_uncorr_err_c8, 
  deccck_bscd_notdata_err_c8, 
  tagdp_tag_error_c8, 
  csr_l2_dir_map_on, 
  misbuf_vuad_ce_err_c8, 
  csreg_tagdp_l2_dir_map_on, 
  csreg_misbuf_l2_dir_map_on, 
  csreg_filbuf_l2_dir_map_on, 
  csreg_wr_enable_notdata_nddm_vcid_c9, 
  notdata_higher_priority_err, 
  filbuf_mcu_scb_secc_err_d1, 
  filbuf_mcu_scb_mecc_err_d1, 
  filbuf_uncorr_err_c8, 
  filbuf_corr_err_c8, 
  filbuf_bsc_corr_err_c12, 
  filbuf_ld64_fb_hit_c12, 
  rdmat_ev_uerr_r6, 
  rdmat_ev_cerr_r6, 
  rdmat_rdmard_uerr_c12, 
  rdmat_rdmard_cerr_c12, 
  rdmat_rdmard_notdata_c12, 
  csr_error_status_vec, 
  csr_error_status_veu, 
  csr_error_status_notdata, 
  csr_l2_bypass_mode_on, 
  arb_store_err_c8, 
  oqu_str_ld_hit_c7, 
  scan_out, 
  csreg_csr_wr_en_c8, 
  csreg_csr_erren_wr_en_c8, 
  csreg_csr_errstate_wr_en_c8, 
  csreg_csr_errinj_wr_en_c8, 
  csreg_csr_notdata_wr_en_c8, 
  csreg_err_state_in_rw, 
  csreg_err_state_in_mec, 
  csreg_err_state_in_meu, 
  csreg_err_state_in, 
  csreg_csr_synd_wr_en, 
  csreg_mux1_synd_sel, 
  csreg_mux2_synd_sel, 
  csreg_wr_enable_tid_c9, 
  csreg_csr_tid_wr_en, 
  csreg_csr_async_wr_en, 
  csreg_wr_enable_notdata_vcid_c9, 
  csreg_csr_notdata_vcid_wr_en, 
  csreg_notdata_err_state_in_rw, 
  csreg_notdata_err_state_in_mend, 
  csreg_notdata_err_state_in, 
  set_async_c9, 
  error_rw_en, 
  diag_wr_en, 
  csreg_notdata_diag_wr_en, 
  csreg_report_ldrc_inpkt, 
  arb_fill_vld_c2, 
  csreg_mux1_addr_sel, 
  csreg_mux2_addr_sel, 
  csreg_csr_addr_wr_en, 
  csreg_csr_notdata_addr_wr_en, 
  csreg_notdata_addr_mux_sel, 
  csreg_notdata_error_rw_en, 
  csreg_csr_rd_mux1_sel_c7, 
  csreg_csr_rd_mux2_sel_c7, 
  csreg_csr_rd_mux3_sel_c7, 
  l2t_rst_fatal_error, 
  csreg_csr_bist_wr_en_c8, 
  csreg_l2_cmpr_reg_wr_en_c8, 
  csreg_l2_mask_reg_wr_en_c8, 
  csreg_csr_rd_mux4_sel_c7, 
  csreg_csr_rd_mux_fnl_c7);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire spares_scanin;
wire spares_scanout;
wire ff_word_addr_c7_scanin;
wire ff_word_addr_c7_scanout;
wire ff_bist_reg_write_en_d1_scanin;
wire ff_bist_reg_write_en_d1_scanout;
wire ff_control_reg_write_en_d1_scanin;
wire ff_control_reg_write_en_d1_scanout;
wire ff_erren_reg_write_en_d1_scanin;
wire ff_erren_reg_write_en_d1_scanout;
wire ff_errst_reg_write_en_d1_scanin;
wire ff_errst_reg_write_en_d1_scanout;
wire ff_erraddr_reg_write_en_d1_scanin;
wire ff_erraddr_reg_write_en_d1_scanout;
wire ff_errinj_reg_write_en_d1_scanin;
wire ff_errinj_reg_write_en_d1_scanout;
wire ff_mux1_sel_c7_scanin;
wire ff_mux1_sel_c7_scanout;
wire ff_err_state_new_c9_lvu_scanin;
wire ff_err_state_new_c9_lvu_scanout;
wire ff_err_state_new_c9_lru_scanin;
wire ff_err_state_new_c9_lru_scanout;
wire ff_err_state_new_c9_ldsu_scanin;
wire ff_err_state_new_c9_ldsu_scanout;
wire ff_err_state_new_c9_ldau_scanin;
wire ff_err_state_new_c9_ldau_scanout;
wire ff_err_state_new_c9_ldwu_scanin;
wire ff_err_state_new_c9_ldwu_scanout;
wire ff_err_state_new_c9_ldru_scanin;
wire ff_err_state_new_c9_ldru_scanout;
wire ff_err_state_new_c9_dru_scanin;
wire ff_err_state_new_c9_dru_scanout;
wire ff_err_state_new_c9_dau_scanin;
wire ff_err_state_new_c9_dau_scanout;
wire ff_err_state_new_c9_dsu_scanin;
wire ff_err_state_new_c9_dsu_scanout;
wire ff_err_state_new_c9_lvc_scanin;
wire ff_err_state_new_c9_lvc_scanout;
wire ff_err_state_new_c9_ltc_scanin;
wire ff_err_state_new_c9_ltc_scanout;
wire ff_err_state_new_c9_ldsc_scanin;
wire ff_err_state_new_c9_ldsc_scanout;
wire ff_err_state_new_c9_ldac_scanin;
wire ff_err_state_new_c9_ldac_scanout;
wire ff_err_state_new_c9_ldwc_scanin;
wire ff_err_state_new_c9_ldwc_scanout;
wire ff_arb_fill_vld_c3_scanin;
wire ff_arb_fill_vld_c3_scanout;
wire arb_fill_vld_c3;
wire ldrc_reporting_data_in;
wire rst_report_ldrc_inpkt_c3;
wire ff_ldrc_reporting_scanin;
wire ff_ldrc_reporting_scanout;
wire csreg_report_ldrc_inpkt_data_in;
wire ff_csreg_report_ldrc_inpkt_staging_scanin;
wire ff_csreg_report_ldrc_inpkt_staging_scanout;
wire ff_err_state_new_c9_ldrc_scanin;
wire ff_err_state_new_c9_ldrc_scanout;
wire ff_err_state_new_c9_drc_scanin;
wire ff_err_state_new_c9_drc_scanout;
wire ff_err_state_new_c9_dac_scanin;
wire ff_err_state_new_c9_dac_scanout;
wire ff_err_state_new_c9_dsc_scanin;
wire ff_err_state_new_c9_dsc_scanout;
wire ff_store_error_c9_scanin;
wire ff_store_error_c9_scanout;
wire rdmat_rdmard_uerr_c12_reg_in;
wire ff_rdmard_uerr_c13_scanin;
wire ff_rdmard_uerr_c13_scanout;
wire ff_rdmard_cerr_c13_scanin;
wire ff_rdmard_cerr_c13_scanout;
wire ff_str_ld_hit_c8_scanin;
wire ff_str_ld_hit_c8_scanout;
wire ff_str_ld_hit_c9_scanin;
wire ff_str_ld_hit_c9_scanout;
wire ff_deccck_bscd_uncorr_err_c9_scanin;
wire ff_deccck_bscd_uncorr_err_c9_scanout;
wire ff_deccck_bscd_corr_err_c9_scanin;
wire ff_deccck_bscd_corr_err_c9_scanout;
wire ff_deccck_bscd_notdata_err_c9_scanin;
wire ff_deccck_bscd_notdata_err_c9_scanout;
wire deccck_bscd_notdata_err_c9;
wire ff_bsc_corr_err_c13_scanin;
wire ff_bsc_corr_err_c13_scanout;
wire ff_en_por_c7_d1_scanin;
wire ff_en_por_c7_d1_scanout;
wire ff_en_por_c7_d2_scanin;
wire ff_en_por_c7_d2_scanout;
wire en_por_c7_d2;
wire ff_en_por_c7_d3_scanin;
wire ff_en_por_c7_d3_scanout;
wire en_por_c7_d3;
wire ff_en_por_c7_d4_scanin;
wire ff_en_por_c7_d4_scanout;
wire en_por_c7_d4;
wire en_por_streatched;
wire ff_l2t_rst_fatal_error_scanin;
wire ff_l2t_rst_fatal_error_scanout;
wire cmp_io_sync_en_r1;
wire ff_cmp_io_sync_en_scanin;
wire ff_cmp_io_sync_en_scanout;
wire ff_err_state_new_c9_nddm_scanin;
wire ff_err_state_new_c9_nddm_scanout;
wire ff_err_state_new_c9_ndsp_scanin;
wire ff_err_state_new_c9_ndsp_scanout;
wire ff_rdmard_notdata_err_c13_scanin;
wire ff_rdmard_notdata_err_c13_scanout;
wire rdmard_notdata_err_c13;
wire notdata_reg_write_en;
wire ff_notdata_reg_write_en_d1_scanin;
wire ff_notdata_reg_write_en_d1_scanout;
wire notdata_reg_write_en_d1;
wire csreg_csr_l2_mask_reg_wr_en;
wire ff_l2_mask_reg_wr_en_scanin;
wire ff_l2_mask_reg_wr_en_scanout;
wire csreg_csr_l2_mask_reg_wr_en_d1;
wire csreg_csr_l2_cmpr_reg_wr_en;
wire ff_l2_cmpr_reg_wr_en_scanin;
wire ff_l2_cmpr_reg_wr_en_scanout;
wire csreg_csr_l2_cmpr_reg_wr_en_d1;
 

 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 
input		arb_csr_wr_en_c7; 
input	[4:0]	arbadr_arbdp_word_addr_c6;	 
 
input		l2clk; 
input		cmp_io_sync_en; 
input 		scan_in;
 
// from vuaddp 
input		vuaddp_vuad_error_c8; // from vuad dp. 
// from arb. 
input		dirrep_dir_error_c8 ; // from the directory 
 
 
// from l2t_deccck_ctl.sv 
input   	deccck_spcd_corr_err_c8 ;	// error in 156 bit data  
input   	deccck_spcd_uncorr_err_c8 ; // error in 156 bit data  
input           deccck_spcd_notdata_err_c8 ; // Notdata error in 156 bit data
input   	deccck_scrd_corr_err_c8 ;// error in 156 bit data  
input  		deccck_scrd_uncorr_err_c8 ;// error in 156 bit data  
input   	deccck_spcfb_corr_err_c8 ; // error in 156 bit data or error  
input   	deccck_spcfb_uncorr_err_c8 ; // error in 156 bit data or error  
input		deccck_bscd_corr_err_c8; // error in 156 bit data ( for WR8s) 
input		deccck_bscd_uncorr_err_c8; // error in 156 bit data ( for WR8s) 
input		deccck_bscd_notdata_err_c8; // notdata error in 156 bit data ( for WR8s)
 
 
 
// from l2t_tagd_ctl.sv 
input		tagdp_tag_error_c8; 


// start int 5.0 changes
input   	csr_l2_dir_map_on; // POST_4.2 ( Left)
input           misbuf_vuad_ce_err_c8;

//output  	csreg_filbuf_deccck_scrd_corr_err_c8; // POST_4.2 ( Top)
//output  	csreg_filbuf_deccck_scrd_uncorr_err_c8; // POST_4.2 ( Top)
//output  	csreg_misbuf_deccck_spcfb_corr_err_c8; // POST_4.2 (Top)
//output  	csreg_misbuf_deccck_spcd_corr_err_c8 ; // POST_4.2 (Top)
//output  	csreg_filbuf_deccck_bscd_corr_err_c8; // POST_4.2 ( Top)
//output  	csreg_filbuf_deccck_bscd_uncorr_err_c8; // POST_4.2 ( Top)
//output  	csreg_arb_data_ecc_active_c3; // POST_4.2 ( Top)
//output  	csreg_decc_data_ecc_active_c3; // POST_4.2 ( Top)
output          csreg_tagdp_l2_dir_map_on; // POST_4.2 ( Left/Bottom)
output          csreg_misbuf_l2_dir_map_on; // POST_4.2 ( Top) 
output          csreg_filbuf_l2_dir_map_on; // POST_4.2 ( Top) 

output		csreg_wr_enable_notdata_nddm_vcid_c9;

//output          csreg_arb_dbginit_l ;      // POST_4.2 TOp
//output          csreg_misbuf_dbginit_l ;       // POST_4.2             Top
////output          csreg_filbuf_dbginit_l ;       // POST_4.2     Top
//output          csreg_tag_dbginit_l ;      // POST_4.2     Top
//output          csreg_tagdp_ctl_dbginit_l ;   // POST_4.2 Left
//output          csreg_csr_dbginit_l ; // POST_4.2 Left
//output          csreg_wbuf_dbginit_l ;       // POST_4.2 Top

//  End 5.0 changes


input		notdata_higher_priority_err;
 
// from l2t_filbuf_ctl.sv 
input		filbuf_mcu_scb_secc_err_d1; // scrub error from DRAM 
input		filbuf_mcu_scb_mecc_err_d1; // scrub error from DRAM 
input   	filbuf_uncorr_err_c8 ; // Errors from DRAM in response to a read 
input   	filbuf_corr_err_c8 ; //  Errors from DRAM in response to a read 
input		filbuf_bsc_corr_err_c12;  // Errors from DRAM in response to a rd64 miss. 
input		filbuf_ld64_fb_hit_c12;	 // qualification for errors found in 	 
					// rdma rd stream out data path.  
 
// from l2t_rdmat_ctl.sv 
input		rdmat_ev_uerr_r6;// wb errors from the evict dp. 
input		rdmat_ev_cerr_r6;// wb errors from the evict dp. 
input		rdmat_rdmard_uerr_c12; 
input		rdmat_rdmard_cerr_c12; 
input		rdmat_rdmard_notdata_c12;
 
// from csr 
input		csr_error_status_vec; 
input		csr_error_status_veu; 
input           csr_error_status_notdata;
input		csr_l2_bypass_mode_on; 

  
// from arbdec 
input		arb_store_err_c8; 
 
input	oqu_str_ld_hit_c7; // from oqu. 

// csreg 
output scan_out; 

// write enables for all csrs after address decode

output		csreg_csr_wr_en_c8 ; 
output		csreg_csr_erren_wr_en_c8; 
output		csreg_csr_errstate_wr_en_c8; 
output		csreg_csr_errinj_wr_en_c8; 
output		csreg_csr_notdata_wr_en_c8;
 
// 21 control bits in Status register. 
output          csreg_err_state_in_rw ; 
output          csreg_err_state_in_mec ; 
output          csreg_err_state_in_meu ; 
output  [`ERR_LDAC:`ERR_LVC]   csreg_err_state_in ; 

// L2 Error syndrome (for UE and CE only)
 
output		csreg_csr_synd_wr_en; 
output	[1:0]	csreg_mux1_synd_sel; 
output	[1:0]	csreg_mux2_synd_sel; 

// TID(VCID) write enable for UE and CE
 
output	csreg_wr_enable_tid_c9; 
output	csreg_csr_tid_wr_en; 
output	csreg_csr_async_wr_en; 

// VCID write enable for Notdata 

output  csreg_wr_enable_notdata_vcid_c9;
output  csreg_csr_notdata_vcid_wr_en;

 
// Notdata error bits in L2 Notdata register 

output          csreg_notdata_err_state_in_rw;
output          csreg_notdata_err_state_in_mend;
output  [`ERR_NDSP:`ERR_NDDM]   csreg_notdata_err_state_in;

// start int 5.0 changes 
output          set_async_c9 ; // ADDED POST_4.0
output          error_rw_en ; // ADDED POST_4.0

// Diagnostic write enable for UE/CE Error status register 
output          diag_wr_en; // ADDED POST_4.0

// Diagnostic write enable for Notdata Error register

output		csreg_notdata_diag_wr_en;
output		csreg_report_ldrc_inpkt;
input		arb_fill_vld_c2;

// end int 5.0 changes
 
 
output	[3:0]	csreg_mux1_addr_sel; 
output  [2:0]	csreg_mux2_addr_sel; 

// UE/CE EAR write enable 
output		csreg_csr_addr_wr_en; 

// Notdata EAR write enable
output		csreg_csr_notdata_addr_wr_en;

// Notdata EAR address select

output [2:0]	csreg_notdata_addr_mux_sel;

// Notdata RW write enable

output		csreg_notdata_error_rw_en;
 
// read enables. 
output	[3:0]	csreg_csr_rd_mux1_sel_c7; 
output		csreg_csr_rd_mux2_sel_c7; 
output	[1:0]	csreg_csr_rd_mux3_sel_c7; 
 
// these outputs need to be removed. 
output		l2t_rst_fatal_error; 
output	csreg_csr_bist_wr_en_c8; // POST_2.0 

// debug changes
output	csreg_l2_cmpr_reg_wr_en_c8;
output	csreg_l2_mask_reg_wr_en_c8;
output	[1:0] csreg_csr_rd_mux4_sel_c7;
output	[1:0] csreg_csr_rd_mux_fnl_c7;
 
 

//////////////////////////////////////////////////
// L1 clk header
//////////////////////////////////////////////////
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

l2t_csreg_ctl_l1clkhdr_ctl_macro clkgen (
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
l2t_csreg_ctl_spare_ctl_macro__num_4 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
//////////////////////////////////////////



wire [1:0] new_notdata_err_vec_c9;
wire [1:0] wr_notdata_err_vec_c9;
wire       report_ldrc_inpkt;
wire       csreg_report_ldrc_inpkt_c4,csreg_report_ldrc_inpkt_c5;
wire       csreg_report_ldrc_inpkt_c52,csreg_report_ldrc_inpkt_c6;
wire       csreg_report_ldrc_inpkt_c7,csreg_report_ldrc_inpkt_c8,csreg_report_ldrc_inpkt_c9;
 
wire	control_reg_write_en, control_reg_write_en_d1; 
wire	erren_reg_write_en, erren_reg_write_en_d1; 
wire	errst_reg_write_en, errst_reg_write_en_d1; 
wire	erraddr_reg_write_en, erraddr_reg_write_en_d1; 
wire	errinj_reg_write_en, errinj_reg_write_en_d1; 
 
wire	[4:0]	word_addr_c7; 
wire	[2:0]	mux1_sel_c6, mux1_sel_c7; 
wire		addr2_c7; 
 
wire    [63:0]  err_status_in; 
wire    [63:0]  err_state_new_c9; 
wire    [63:0]  err_state_new_c8; 
wire    [7:0]   new_uerr_vec_c9 ; 
wire    [7:0]   wr_uerr_vec_c9 ; 
wire    [7:0]   new_cerr_vec_c9 ; 
wire    [7:0]   wr_cerr_vec_c9 ; 
wire    [`ERR_NDSP:`ERR_NDDM] err_state_notdata_new_c8;
wire    [`ERR_NDSP:`ERR_NDDM] err_state_notdata_new_c9;
wire    [`ERR_MEND:`ERR_NDDM] err_status_notdata_in;
 
wire	rdma_pst_err_c9; 
wire    rdma_pst_notdata_err_c9;
wire	store_error_c9 ; 
wire	rdmard_uerr_c13, rdmard_cerr_c13 ; 
 
wire	str_ld_hit_c8, str_ld_hit_c9 ; 
wire	err_sel, new_err_sel; 
wire	rdmard_addr_sel_c13; 
wire	bsc_corr_err_c13; 
 
wire	en_por_c7, en_por_c7_d1;  
wire	bist_reg_write_en, bist_reg_write_en_d1; 
wire	[3:0]	mux1_addr_sel_tmp; 
wire	[2:0]	mux2_addr_sel_tmp ; 
wire	pipe_addr_sel; 

// int 5.0 changes
wire 		deccck_bscd_uncorr_err_c9, deccck_bscd_corr_err_c9 ;
wire         	csreg_csr_erraddr_wr_en_c8;
wire 		csreg_wr_enable_async_c9;
wire 		error_spc, error_bsc ;

// start int 5.0 changes
// --------------\/------- Added repeaters post_4.2 ---\/ --------

//        assign  csreg_arb_dbginit_l = dbginit_l ;
//        assign  csreg_misbuf_dbginit_l = dbginit_l ;
//        assign  csreg_filbuf_dbginit_l = dbginit_l ;
//        assign  csreg_wbuf_dbginit_l = dbginit_l ;
//        assign  csreg_csr_dbginit_l = dbginit_l ;
//        assign  csreg_tag_dbginit_l = dbginit_l ;
//        assign  csreg_tagdp_ctl_dbginit_l = dbginit_l ;
//////////
        //decc_spcd_uncorr_err_c8 repeater not needed.
        //decc_spcfb_corr_err_c8 repeater not needed.

//        assign  csreg_filbuf_deccck_scrd_corr_err_c8 = deccck_scrd_corr_err_c8;
//        assign  csreg_filbuf_deccck_scrd_uncorr_err_c8 = deccck_scrd_uncorr_err_c8 ;
//        assign  csreg_filbuf_deccck_bscd_corr_err_c8 = deccck_bscd_corr_err_c8 ;
//        assign  csreg_filbuf_deccck_bscd_uncorr_err_c8 = deccck_bscd_uncorr_err_c8 ; 
//        assign  csreg_misbuf_deccck_spcd_corr_err_c8 = deccck_spcd_corr_err_c8 ;
//        assign  csreg_misbuf_deccck_spcfb_corr_err_c8 = deccck_spcfb_corr_err_c8 ;
//        assign  csreg_arb_data_ecc_active_c3 = tag_data_ecc_active_c3 ;
//        assign  csreg_decc_data_ecc_active_c3 = tag_data_ecc_active_c3 ;
        assign  csreg_tagdp_l2_dir_map_on = csr_l2_dir_map_on ;
        assign  csreg_misbuf_l2_dir_map_on = csr_l2_dir_map_on ;
        assign  csreg_filbuf_l2_dir_map_on = csr_l2_dir_map_on ;

// --------------\/------- Added repeaters post_4.2 ---\/ --------
// end int 5.0 changes


 
///////////////////////////////////////////////////// 
// Exception cases: 
// 
// - Wr8s will cause  DAU to be set in OFF mode. ( if an uncorr err  
//   is signalled by DRAM). 
// - Wr8 will cause  DAC to be set. in OFF/ON mode. 
///////////////////////////////////////////////////// 
 
//////////////////////////////////////////////////////////////////////////////// 
// CSR pipeline. 
// 
//============================================================ 
// 	C7		C8		C9		 
//============================================================ 
//	generate	mux out		xmit 
//	mux selects	rd data		to  
//					ccx 
//						 
//			enable 
//			a write 
//					 
//============================================================ 
// 
// Eventhough the Write and Read operations do not happen in the 
// same cycle, no data forwarding is required because the write 
// is followed by ATLEAST one bubble 
// 
// Errors update the ESR and EAR in the C10 cycle.  
// Hence a CSR load may actually miss the error that occurred 
// just before it. 
//////////////////////////////////////////////////////////////////////////////// 
 
////////////////////////// 
// I) WR ENABLE GENERATION 
// 
// Write pipeline. 
// A CSR store is performed  
// in the C8 cycle. 
////////////////////////// 
 
l2t_csreg_ctl_msff_ctl_macro__width_5 ff_word_addr_c7 
                           (.din(arbadr_arbdp_word_addr_c6[4:0]),  
				.scan_in(ff_word_addr_c7_scanin),
				.scan_out(ff_word_addr_c7_scanout),
				.l1clk(l1clk), 
                               .dout(word_addr_c7[4:0]),
  .siclk(siclk),
  .soclk(soclk) 
                                
); 
 
////////////////////////// 
// BIST REG	 A8 
// This register can be written by software or 
// by JTAG via the CTU 
////////////////////////// 
 
 
 
assign  bist_reg_write_en =  arb_csr_wr_en_c7 &  
			 (word_addr_c7[2:0]==3'h0 ) ; // A8 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_bist_reg_write_en_d1 
                           (.din(bist_reg_write_en),  
				.scan_in(ff_bist_reg_write_en_d1_scanin),
				.scan_out(ff_bist_reg_write_en_d1_scanout),
				.l1clk(l1clk), 
                               .dout(bist_reg_write_en_d1),
  .siclk(siclk),
  .soclk(soclk) 
                                
); 
 
assign	csreg_csr_bist_wr_en_c8 = bist_reg_write_en_d1  ; 
 
////////////////////////// 
// CONTROL REG	 A9 
////////////////////////// 
assign  control_reg_write_en =  arb_csr_wr_en_c7 &  
			 (word_addr_c7[2:0]==3'h1 ) ; // A9 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_control_reg_write_en_d1 
                           (.din(control_reg_write_en),  
				.scan_in(ff_control_reg_write_en_d1_scanin),
				.scan_out(ff_control_reg_write_en_d1_scanout),
				.l1clk(l1clk), 
                               .dout(control_reg_write_en_d1),
  .siclk(siclk),
  .soclk(soclk) 
                                
); 
 
assign	csreg_csr_wr_en_c8 = control_reg_write_en_d1  ; 
 
////////////////////////// 
// ERR ENABLE REG	AA 
////////////////////////// 
assign	erren_reg_write_en = arb_csr_wr_en_c7 &  
				 (word_addr_c7[2:0]==3'h2) ; // AA 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_erren_reg_write_en_d1 
                           (.din(erren_reg_write_en),  
				.scan_in(ff_erren_reg_write_en_d1_scanin),
				.scan_out(ff_erren_reg_write_en_d1_scanout),
				.l1clk(l1clk), 
                               .dout(erren_reg_write_en_d1),
  .siclk(siclk),
  .soclk(soclk) 
                                
); 
 
assign  csreg_csr_erren_wr_en_c8 = erren_reg_write_en_d1  ; 
 
////////////////////////// 
// ERR STATE REG	AB 
////////////////////////// 
assign  errst_reg_write_en = arb_csr_wr_en_c7 &  
                                 (word_addr_c7[2:0]==3'h3) ; // AB 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_errst_reg_write_en_d1 
                           (.din(errst_reg_write_en), .l1clk(l1clk), 
                               .scan_in(ff_errst_reg_write_en_d1_scanin),
                               .scan_out(ff_errst_reg_write_en_d1_scanout),
                               .dout(errst_reg_write_en_d1),
  .siclk(siclk),
  .soclk(soclk) 
                                
); 
 
assign  csreg_csr_errstate_wr_en_c8 = errst_reg_write_en_d1 ; 
 
////////////////////////// 
// ERR ADDR REG	AC 
////////////////////////// 
assign  erraddr_reg_write_en = arb_csr_wr_en_c7 & 
                                 (word_addr_c7[2:0]==3'h4) ; // AC 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_erraddr_reg_write_en_d1 
                           (.din(erraddr_reg_write_en), .l1clk(l1clk), 
                               .scan_in(ff_erraddr_reg_write_en_d1_scanin),
                               .scan_out(ff_erraddr_reg_write_en_d1_scanout),
                               .dout(erraddr_reg_write_en_d1),
  .siclk(siclk),
  .soclk(soclk) 
                                
); 
 
 
assign  csreg_csr_erraddr_wr_en_c8 = erraddr_reg_write_en_d1 ; 
 
////////////////////////// 
// ERR INJ  REG AD 
////////////////////////// 
assign  errinj_reg_write_en = arb_csr_wr_en_c7 & 
                                 (word_addr_c7[2:0]==3'h5) ;	// AD 
 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_errinj_reg_write_en_d1 
                           (.din(errinj_reg_write_en), .l1clk(l1clk), 
                               .scan_in(ff_errinj_reg_write_en_d1_scanin),
                               .scan_out(ff_errinj_reg_write_en_d1_scanout),
                               .dout(errinj_reg_write_en_d1),
  .siclk(siclk),
  .soclk(soclk) 
                                
); 
 
assign  csreg_csr_errinj_wr_en_c8 = errinj_reg_write_en_d1   ; 
 
////////////////////////// 
// THIS REGISTER HAS BEEN REMOVED FROM THE SPEC
// STM  REG	AE or AF 
////////////////////////// 
//assign  stm_reg_write_en = arb_csr_wr_en_c7 & 
//                                 ( (word_addr_c7[2:0]==3'h6) | 
//				   (word_addr_c7[2:0]==3'h7) 
//				 ) ; 
//msff_ctl_macro ff_stm_reg_write_en_d1 (width=1)
//                           (.din(stm_reg_write_en), .l1clk(l1clk), 
//                               .dout(stm_reg_write_en_d1), 
//                                
//		.scan_in(), 
//		.scan_out()
//); 
// 
// 
//assign  csreg_csr_stm_wr_en_c8 = stm_reg_write_en_d1   ; 
// 
// 
// 
// 
// 
// 
////////////////////////// 
// RD enable generation. 
////////////////////////// 
 
assign	mux1_sel_c6[0] = ( arbadr_arbdp_word_addr_c6[1:0] == 2'd0 ) ; // A8 or Ac 
assign	mux1_sel_c6[1] = ( arbadr_arbdp_word_addr_c6[1:0] == 2'd1 ) ; // A9 or Ad 
assign	mux1_sel_c6[2] = ( arbadr_arbdp_word_addr_c6[1:0] == 2'd2 ) ; //Aa  or Ae 
 
 
l2t_csreg_ctl_msff_ctl_macro__width_3 ff_mux1_sel_c7 
                           (.din(mux1_sel_c6[2:0]), .l1clk(l1clk), 
                               .scan_in(ff_mux1_sel_c7_scanin),
                               .scan_out(ff_mux1_sel_c7_scanout),
                               .dout(mux1_sel_c7[2:0]),
  .siclk(siclk),
  .soclk(soclk) 
                                
); 
 
assign	csreg_csr_rd_mux1_sel_c7[0] = mux1_sel_c7[0] ; 
assign	csreg_csr_rd_mux1_sel_c7[1] = mux1_sel_c7[1] ; 
assign	csreg_csr_rd_mux1_sel_c7[2] = mux1_sel_c7[2] ; 
assign	csreg_csr_rd_mux1_sel_c7[3] = ~(|(mux1_sel_c7[2:0])); 
 
assign  csreg_csr_rd_mux2_sel_c7 = ~( mux1_sel_c7[0] |  mux1_sel_c7[1] ) ; 
 
 
assign	csreg_csr_rd_mux3_sel_c7[0] = ~word_addr_c7[2] ; 
assign	csreg_csr_rd_mux3_sel_c7[1] = word_addr_c7[2] ; 


// Debug related signals
assign csreg_csr_rd_mux4_sel_c7[0] = (word_addr_c7[4:0]==5'h1F );
assign csreg_csr_rd_mux4_sel_c7[1] = (word_addr_c7[4:0]==5'h0F );

assign csreg_csr_rd_mux_fnl_c7[0] = ~(csreg_csr_rd_mux4_sel_c7[0] | csreg_csr_rd_mux4_sel_c7[1]);
assign csreg_csr_rd_mux_fnl_c7[1] = csreg_csr_rd_mux4_sel_c7[0] | csreg_csr_rd_mux4_sel_c7[1];




 
////////////////////////// 
// ERROR LOGGING LOGIC. 
// UNCORR ERRORS. 
////////////////////////// 
 
///////////////////////////////////////////////////// 
// LVU bit 
// vuad UE. Addr=C9, syndrome = {VD_syndrome[5:0], UA_syndrome[5:0] }
// set this bit, if there is no pending uncorr err. 
///////////////////////////////////////////////////// 
 
assign	err_state_new_c8[`ERR_LVU]  = vuaddp_vuad_error_c8 ; 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_lvu 
			(.din(err_state_new_c8[`ERR_LVU]), .l1clk(l1clk), 
                         .scan_in(ff_err_state_new_c9_lvu_scanin),
                         .scan_out(ff_err_state_new_c9_lvu_scanout),
                         .dout(err_state_new_c9[`ERR_LVU]),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
//assign	err_status_in[`ERR_LVU] = ~(csr_error_status_veu | err_state_new_c9[`ERR_LVU]) &  err_state_new_c9[`ERR_LVU] ; 
assign	err_status_in[`ERR_LVU] = ~csr_error_status_veu & err_state_new_c9[`ERR_LVU];
 
///////////////////////////////////////////////////// 
// LRU bit 
// dir parity. Addr=index	syndrome = X 
// set this bit if no lvu occurs and no pending uncorr err. 
///////////////////////////////////////////////////// 
 
assign	err_state_new_c8[`ERR_LRU] =   dirrep_dir_error_c8 ; // directory error 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_lru 
			(.din(err_state_new_c8[`ERR_LRU]), .l1clk(l1clk), 
                         .scan_in(ff_err_state_new_c9_lru_scanin),
                         .scan_out(ff_err_state_new_c9_lru_scanout),
                         .dout(err_state_new_c9[`ERR_LRU]),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
assign	err_status_in[`ERR_LRU] = ~( err_state_new_c9[`ERR_LVU] | 
			csr_error_status_veu )  & 
			err_state_new_c9[`ERR_LRU] ; 
// int 5.0 changes start

/////////////////////////////////////////////////////
// LDSU bit
// set for a scrub
//  Address=C7. Syndrome = data_syndrome from decc
/////////////////////////////////////////////////////

assign  err_state_new_c8[`ERR_LDSU] = deccck_scrd_uncorr_err_c8 ; // scrub  uncorr err

l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_ldsu 
                        (.din(err_state_new_c8[`ERR_LDSU]), .l1clk(l1clk),
                         .scan_in(ff_err_state_new_c9_ldsu_scanin),
                         .scan_out(ff_err_state_new_c9_ldsu_scanout),
                         .dout(err_state_new_c9[`ERR_LDSU]),
  .siclk(siclk),
  .soclk(soclk)
                          
);

assign  err_status_in[`ERR_LDSU] = ~( err_state_new_c9[`ERR_LVU] |
                        err_state_new_c9[`ERR_LRU]  |
                        csr_error_status_veu ) &
                        err_state_new_c9[`ERR_LDSU] ;

// int 5.0 changes end
 
///////////////////////////////////////////////////// 
// LDAU bit 
// set for any kind of access LD/ST/ATOMIC/PST  
// Address=C9. Syndrome = data_syndrome from deccck 
// Only set for accesses that hit the $ 
///////////////////////////////////////////////////// 
 
assign	err_state_new_c8[`ERR_LDAU] = deccck_spcd_uncorr_err_c8 ; // data uncorr err 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_ldau 
			(.din(err_state_new_c8[`ERR_LDAU]), .l1clk(l1clk), 
                         .scan_in(ff_err_state_new_c9_ldau_scanin),
                         .scan_out(ff_err_state_new_c9_ldau_scanout),
                         .dout(err_state_new_c9[`ERR_LDAU]),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
assign  err_status_in[`ERR_LDAU] = ~( err_state_new_c9[`ERR_LVU] | 
		      err_state_new_c9[`ERR_LRU]  | 
		      csr_error_status_veu ) & 
		    err_state_new_c9[`ERR_LDAU] ; 
 
///////////////////////////////////////////////////// 
// LDWU bit // eviction error logging done in cycles r7 through r14 
// of an evict. Address logging is also done in the
// same 8 cycle window 
// ??? may need to change leave_state2 counter to 13 
// in wbuf.v
///////////////////////////////////////////////////// 
 
assign	err_state_new_c8[`ERR_LDWU] = rdmat_ev_uerr_r6 ; // eviction  uncorr err 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_ldwu 
			(.din(err_state_new_c8[`ERR_LDWU]), .l1clk(l1clk), 
                         .scan_in(ff_err_state_new_c9_ldwu_scanin),
                         .scan_out(ff_err_state_new_c9_ldwu_scanout),
                         .dout(err_state_new_c9[`ERR_LDWU]),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
assign  err_status_in[`ERR_LDWU] = ~( err_state_new_c9[`ERR_LVU] |
                             err_state_new_c9[`ERR_LRU]  |
                             err_state_new_c9[`ERR_LDAU] |
                             err_state_new_c9[`ERR_LDSU] |
                             csr_error_status_veu ) &
                             err_state_new_c9[`ERR_LDWU] ;

 
///////////////////////////////////////////////////// 
// LDRU bit 
// Set for an RDMA Read or an RDMA Write ( Partial )  
//  or RDMA Write which  
// returns with an error from the DRAM.  
// Only set for accesses that hit the $ 
///////////////////////////////////////////////////// 
 
 
// int 5.0 changes : Fix for bug 92901
//assign	err_state_new_c8[`ERR_LDRU] =    deccck_bscd_uncorr_err_c8 |  
//				  ( (rdmat_rdmard_uerr_c12 | rdmat_rdmard_notdata_c12) &  
//				~filbuf_ld64_fb_hit_c12 ) ; 
// 

assign	err_state_new_c8[`ERR_LDRU] =    deccck_bscd_uncorr_err_c8 |  
				  ( rdmat_rdmard_uerr_c12 &  ~filbuf_ld64_fb_hit_c12 ) ; 






// int 5.0 changes
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_ldru 
			(.din(err_state_new_c8[`ERR_LDRU]), .l1clk(l1clk), 
                         .scan_in(ff_err_state_new_c9_ldru_scanin),
                         .scan_out(ff_err_state_new_c9_ldru_scanout),
                         .dout(err_state_new_c9[`ERR_LDRU]),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
// int 5.0 changes
assign  err_status_in[`ERR_LDRU] = ~( err_state_new_c9[`ERR_LVU] | 
                        err_state_new_c9[`ERR_LRU] |  
		    	err_state_new_c9[`ERR_LDAU] | 
		     	err_state_new_c9[`ERR_LDSU] | 
			err_state_new_c9[`ERR_LDWU] |
			csr_error_status_veu ) &  
			err_state_new_c9[`ERR_LDRU] ; 
 
// int 5.0 changes
/////////////////////////////////////////////////////
// DRU bit
// FB hit only  for LD64/
// Wr8s will cause  DAU to be set in OFF mode.
/////////////////////////////////////////////////////

assign  err_state_new_c8[`ERR_DRU] = ( (rdmat_rdmard_uerr_c12 | rdmat_rdmard_notdata_c12) &
                                filbuf_ld64_fb_hit_c12) ;

l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_dru 
			(.din(err_state_new_c8[`ERR_DRU]), .l1clk(l1clk), 
                         .scan_in(ff_err_state_new_c9_dru_scanin),
                         .scan_out(ff_err_state_new_c9_dru_scanout),
                         .dout(err_state_new_c9[`ERR_DRU]),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
assign  err_status_in[`ERR_DRU] = ~( err_state_new_c9[`ERR_LVU] |
                             err_state_new_c9[`ERR_LRU]  |
                             err_state_new_c9[`ERR_LDAU] |
                             err_state_new_c9[`ERR_LDRU] |
                             err_state_new_c9[`ERR_LDSU] |
                             err_state_new_c9[`ERR_LDRU] |
                             err_state_new_c9[`ERR_LDWU] |
                             csr_error_status_veu) & 
                             err_state_new_c9[`ERR_DRU] ;

///////////////////////////////////////////////////// 
// DAU bit 
// only set for a FB hit or a FILL 
///////////////////////////////////////////////////// 
 
assign	err_state_new_c8[`ERR_DAU]  =  
		( deccck_spcfb_uncorr_err_c8 | // from a spc instruction 
		filbuf_uncorr_err_c8 )  ;  // from a fill. 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_dau 
			(.din(err_state_new_c8[`ERR_DAU]), .l1clk(l1clk), 
                         .scan_in(ff_err_state_new_c9_dau_scanin),
                         .scan_out(ff_err_state_new_c9_dau_scanout),
                         .dout(err_state_new_c9[`ERR_DAU]),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
assign  err_status_in[`ERR_DAU] = ~( err_state_new_c9[`ERR_LVU] | 
                            err_state_new_c9[`ERR_LRU]  | 
                            err_state_new_c9[`ERR_LDAU] | 
                            err_state_new_c9[`ERR_LDRU] | 
                            err_state_new_c9[`ERR_LDSU] | 
                            err_state_new_c9[`ERR_LDRU] | 
			    err_state_new_c9[`ERR_LDWU] | 
                             err_state_new_c9[`ERR_DRU] | 
                            csr_error_status_veu ) &  
			err_state_new_c9[`ERR_DAU] ; 
 
///////////////////////////////////////////////////// 
// DSU bit 
// This bit does not influence MEU 
// and does not need to go through the 
// priority logic 
///////////////////////////////////////////////////// 
 
assign	err_state_new_c8[`ERR_DSU] =  filbuf_mcu_scb_mecc_err_d1 ;  
		// scrub in DRAM causing an error. 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_dsu 
			(.din(err_state_new_c8[`ERR_DSU]), .l1clk(l1clk), 
                         .scan_in(ff_err_state_new_c9_dsu_scanin),
                         .scan_out(ff_err_state_new_c9_dsu_scanout),
                         .dout(err_state_new_c9[`ERR_DSU]),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
assign  err_status_in[`ERR_DSU] = err_state_new_c9[`ERR_DSU] ; 
				  
				 
 
///////////////////////////////////////////////////// 
// MEU bit 
// Multiple error uncorrectable bit is set if multiple  
// uncorrectable errors happen in the same cycle or 
// are separated in time. 
// This bit is set if the vector being written in 
// is different from the vector that is detected  
///////////////////////////////////////////////////// 
 
assign	new_uerr_vec_c9 = { err_state_new_c9[`ERR_LDAU], 
			   err_state_new_c9[`ERR_LDWU], 
			   err_state_new_c9[`ERR_LDRU], 
			   err_state_new_c9[`ERR_LDSU], 
			   err_state_new_c9[`ERR_LRU], 
			   err_state_new_c9[`ERR_LVU], 
			   err_state_new_c9[`ERR_DAU], 
			   err_state_new_c9[`ERR_DRU] } ; 
 
// atleast 10 gates to do the priority. 
assign	wr_uerr_vec_c9 = { err_status_in[`ERR_LDAU], 
                           err_status_in[`ERR_LDWU], 
                           err_status_in[`ERR_LDRU], 
                           err_status_in[`ERR_LDSU], 
                           err_status_in[`ERR_LRU], 
                           err_status_in[`ERR_LVU], 
                           err_status_in[`ERR_DAU], 
                           err_status_in[`ERR_DRU] } ; 
 
assign	err_status_in[`ERR_MEU] = |( ~wr_uerr_vec_c9 & new_uerr_vec_c9 ) ;  
 
 
 
 
///////////////////////////////////////////////////// 
// VEU bit 
///////////////////////////////////////////////////// 
assign	err_status_in[`ERR_VEU] = |(new_uerr_vec_c9) ; 
 
 
 
///////////////////////////////////////////////////// 
// ERROR LOGGING LOGIC. 
// CORR ERRORS. 
// correctible errors are logged if  
// * there is no uncorr err in the same cycle. 
// * there is no pending corr or uncorr err. 
///////////////////////////////////////////////////// 

/////////////////////////////////////////////////////
// LVC bit
/////////////////////////////////////////////////////

assign  err_state_new_c8[`ERR_LVC]  = misbuf_vuad_ce_err_c8 ; // VUAD SBE  

l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_lvc 
                        (.din(err_state_new_c8[`ERR_LVC]), .l1clk(l1clk),
                         .scan_in(ff_err_state_new_c9_lvc_scanin),
                         .scan_out(ff_err_state_new_c9_lvc_scanout),
                         .dout(err_state_new_c9[`ERR_LVC]),
  .siclk(siclk),
  .soclk(soclk)
);

assign  err_status_in[`ERR_LVC] = ~( err_status_in[`ERR_VEU] |
                  csr_error_status_veu |
                   csr_error_status_vec ) & 
                err_state_new_c9[`ERR_LVC] ;

 
///////////////////////////////////////////////////// 
// LTC bit 
///////////////////////////////////////////////////// 
 
assign	err_state_new_c8[`ERR_LTC]  = tagdp_tag_error_c8 ; 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_ltc 
			(.din(err_state_new_c8[`ERR_LTC]), .l1clk(l1clk), 
                         .scan_in(ff_err_state_new_c9_ltc_scanin),
                         .scan_out(ff_err_state_new_c9_ltc_scanout),
                         .dout(err_state_new_c9[`ERR_LTC]),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
assign  err_status_in[`ERR_LTC] = ~( err_status_in[`ERR_VEU] | 
		  csr_error_status_veu | 
		   csr_error_status_vec  | 
                   err_state_new_c9[`ERR_LVC]) &  
		err_state_new_c9[`ERR_LTC] ; 
 
///////////////////////////////////////////////////// 
// LDSC bit 
// addr=C9 and syndrome = data synd. 
///////////////////////////////////////////////////// 
 
assign	err_state_new_c8[`ERR_LDSC] = deccck_scrd_corr_err_c8 ; 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_ldsc 
			(.din(err_state_new_c8[`ERR_LDSC]), .l1clk(l1clk), 
                         .scan_in(ff_err_state_new_c9_ldsc_scanin),
                         .scan_out(ff_err_state_new_c9_ldsc_scanout),
                         .dout(err_state_new_c9[`ERR_LDSC]),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
assign  err_status_in[`ERR_LDSC] = ~( err_status_in[`ERR_VEU] | 
                               csr_error_status_veu | 
                               csr_error_status_vec | 
                               err_state_new_c9[`ERR_LVC] |
                               err_state_new_c9[`ERR_LTC] ) & 
                               err_state_new_c9[`ERR_LDSC] ; // LDAC and LDSC are mutex 
								 
/////////////////////////////////////////////////////
// LDAC bit
/////////////////////////////////////////////////////
assign  err_state_new_c8[`ERR_LDAC] = deccck_spcd_corr_err_c8 ; 
                                        
// int 5.0 changes
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_ldac 
                        (.din(err_state_new_c8[`ERR_LDAC]), .l1clk(l1clk),
                         .scan_in(ff_err_state_new_c9_ldac_scanin),
                         .scan_out(ff_err_state_new_c9_ldac_scanout),
                         .dout(err_state_new_c9[`ERR_LDAC]),
  .siclk(siclk),
  .soclk(soclk)
                          
);


// int 5.0 changes
assign  err_status_in[`ERR_LDAC] =  ~( err_status_in[`ERR_VEU] |
                         csr_error_status_veu |
                         csr_error_status_vec |
                         err_state_new_c9[`ERR_LVC] |
                         err_state_new_c9[`ERR_LTC] ) &
                         err_state_new_c9[`ERR_LDAC] ;


///////////////////////////////////////////////////// 
// LDWC bit 
// comes from a Wback  
// addr = evicted address and syndrome = datasyndrome. 
///////////////////////////////////////////////////// 
 
assign	err_state_new_c8[`ERR_LDWC] = rdmat_ev_cerr_r6  & ~csr_l2_bypass_mode_on; 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_ldwc 
			(.din(err_state_new_c8[`ERR_LDWC]), .l1clk(l1clk), 
                         .scan_in(ff_err_state_new_c9_ldwc_scanin),
                         .scan_out(ff_err_state_new_c9_ldwc_scanout),
                         .dout(err_state_new_c9[`ERR_LDWC]),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
assign  err_status_in[`ERR_LDWC] = ~( err_status_in[`ERR_VEU] | 
                               csr_error_status_veu | 
                               csr_error_status_vec | 
                               err_state_new_c9[`ERR_LVC] |
                              err_state_new_c9[`ERR_LTC] | 
		   	err_state_new_c9[`ERR_LDSC] | 
			   err_state_new_c9[`ERR_LDAC]  ) & 
                           err_state_new_c9[`ERR_LDWC] ; // LDAC and LDSC are mutex 
 
 
///////////////////////////////////////////////////// 
// LDRC bit 
// comes from an RDMA Read access and  
// only for a $ hit 
///////////////////////////////////////////////////// 
 
assign	err_state_new_c8[`ERR_LDRC] =  deccck_bscd_corr_err_c8 | 
                                  ( rdmat_rdmard_cerr_c12 & 
                                ~filbuf_ld64_fb_hit_c12 ) ; 
					 

l2t_csreg_ctl_msff_ctl_macro__width_1 ff_arb_fill_vld_c3 
        (
	.scan_in(ff_arb_fill_vld_c3_scanin),
	.scan_out(ff_arb_fill_vld_c3_scanout),
	.din(arb_fill_vld_c2),
	.l1clk(l1clk),
        .dout(arb_fill_vld_c3),
  .siclk(siclk),
  .soclk(soclk)
	);


assign ldrc_reporting_data_in =  (err_state_new_c8[`ERR_LDRC]) ? 1'b1 : report_ldrc_inpkt;


assign rst_report_ldrc_inpkt_c3 = report_ldrc_inpkt & arb_fill_vld_c3 & ~err_state_new_c8[`ERR_LDRC]; 

l2t_csreg_ctl_msff_ctl_macro__clr_1__width_1 ff_ldrc_reporting 
	(
	.scan_in(ff_ldrc_reporting_scanin),
	.scan_out(ff_ldrc_reporting_scanout),
	.dout	(report_ldrc_inpkt),
	.din	(ldrc_reporting_data_in),
	.l1clk	(l1clk),
	.clr	(rst_report_ldrc_inpkt_c3),
  .siclk(siclk),
  .soclk(soclk)
	);

assign csreg_report_ldrc_inpkt_data_in = report_ldrc_inpkt & arb_fill_vld_c3; 


l2t_csreg_ctl_msff_ctl_macro__width_5 ff_csreg_report_ldrc_inpkt_staging 
        (
        .scan_in(ff_csreg_report_ldrc_inpkt_staging_scanin),
        .scan_out(ff_csreg_report_ldrc_inpkt_staging_scanout),
        .din({csreg_report_ldrc_inpkt_data_in,csreg_report_ldrc_inpkt_c4,csreg_report_ldrc_inpkt_c5,
		csreg_report_ldrc_inpkt_c52,csreg_report_ldrc_inpkt_c6}),
        .l1clk(l1clk),
        .dout({csreg_report_ldrc_inpkt_c4,csreg_report_ldrc_inpkt_c5,
                 csreg_report_ldrc_inpkt_c52,csreg_report_ldrc_inpkt_c6,
		csreg_report_ldrc_inpkt_c7}),
  .siclk(siclk),
  .soclk(soclk));

assign csreg_report_ldrc_inpkt = csreg_report_ldrc_inpkt_c7;


 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_ldrc 
			(.din(err_state_new_c8[`ERR_LDRC]), .l1clk(l1clk), 
                         .scan_in(ff_err_state_new_c9_ldrc_scanin),
                         .scan_out(ff_err_state_new_c9_ldrc_scanout),
                         .dout(err_state_new_c9[`ERR_LDRC]),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
assign  err_status_in[`ERR_LDRC] =  ~( err_status_in[`ERR_VEU] | 
                         csr_error_status_veu | 
                        csr_error_status_vec | 
                        err_state_new_c9[`ERR_LVC] |
                        err_state_new_c9[`ERR_LTC] | 
                        err_state_new_c9[`ERR_LDSC] |  
                        err_state_new_c9[`ERR_LDWC]  | 
			err_state_new_c9[`ERR_LDAC] ) &  
			err_state_new_c9[`ERR_LDRC] ; 
 
/////////////////////////////////////////////////////
// DRC bit
// ld 64 will cause DRC to be set.
/////////////////////////////////////////////////////
// int 5.0 changes
assign  err_state_new_c8[`ERR_DRC] =    filbuf_bsc_corr_err_c12 ;

// int 5.0 changes
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_drc 
                        (.din(err_state_new_c8[`ERR_DRC]), .l1clk(l1clk),
                         .scan_in(ff_err_state_new_c9_drc_scanin),
                         .scan_out(ff_err_state_new_c9_drc_scanout),
                         .dout(err_state_new_c9[`ERR_DRC]),
  .siclk(siclk),
  .soclk(soclk)
                          
);

// int 5.0 changes
assign  err_status_in[`ERR_DRC] = ~( err_status_in[`ERR_VEU] |
                        csr_error_status_veu |
                        csr_error_status_vec |
                        err_state_new_c9[`ERR_LVC] |
                        err_state_new_c9[`ERR_LTC] |
                        err_state_new_c9[`ERR_LDSC] | 
                        err_state_new_c9[`ERR_LDAC]  |
                        err_state_new_c9[`ERR_LDWC] | 
                        err_state_new_c9[`ERR_LDRC] 
                        ) &
                        err_state_new_c9[`ERR_DRC];


///////////////////////////////////////////////////// 
// DAC bit 
// Only an fb hit or a fill 
///////////////////////////////////////////////////// 
assign	err_state_new_c8[`ERR_DAC]  = ( deccck_spcfb_corr_err_c8 | 
					filbuf_corr_err_c8 )   ; 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_dac 
			(.din(err_state_new_c8[`ERR_DAC]), .l1clk(l1clk), 
                         .scan_in(ff_err_state_new_c9_dac_scanin),
                         .scan_out(ff_err_state_new_c9_dac_scanout),
                         .dout(err_state_new_c9[`ERR_DAC]),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
assign  err_status_in[`ERR_DAC] = ~( err_status_in[`ERR_VEU] | 
                                    csr_error_status_veu | 
                                   csr_error_status_vec | 
                                   err_state_new_c9[`ERR_LVC] |
                                   err_state_new_c9[`ERR_LTC] | 
                                   err_state_new_c9[`ERR_LDSC] |  
                                   err_state_new_c9[`ERR_LDAC]  | 
                                   err_state_new_c9[`ERR_LDWC] |  
                                   err_state_new_c9[`ERR_LDRC] | 
                                   err_state_new_c9[`ERR_DRC]  
					) &  
				err_state_new_c9[`ERR_DAC]; 
 
 
///////////////////////////////////////////////////// 
// DSC bit 
///////////////////////////////////////////////////// 
assign	err_state_new_c8[`ERR_DSC] = filbuf_mcu_scb_secc_err_d1 ; 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_dsc 
			(.din(err_state_new_c8[`ERR_DSC]), .l1clk(l1clk), 
                         .scan_in(ff_err_state_new_c9_dsc_scanin),
                         .scan_out(ff_err_state_new_c9_dsc_scanout),
                         .dout(err_state_new_c9[`ERR_DSC]),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
assign  err_status_in[`ERR_DSC] = err_state_new_c9[`ERR_DSC] ; 
 
///////////////////////////////////////////////////// 
// MEC bit 
// set if the corr err detected is unable to record in the L2 esr 
// OR if an uncorrectable err happens when a corr err has already occurred. 
///////////////////////////////////////////////////// 
 
assign	wr_cerr_vec_c9 = {  err_status_in[`ERR_LVC], 
                            err_status_in[`ERR_LTC], 
			    err_status_in[`ERR_LDAC], 
			    err_status_in[`ERR_LDRC], 
			    err_status_in[`ERR_LDWC], 
			    err_status_in[`ERR_LDSC], 
			    err_status_in[`ERR_DAC], 
			    err_status_in[`ERR_DRC] } ; 
 
assign	new_cerr_vec_c9 = { err_state_new_c9[`ERR_LVC],  
                            err_state_new_c9[`ERR_LTC], 
			    err_state_new_c9[`ERR_LDAC], 
			    err_state_new_c9[`ERR_LDRC], 
			    err_state_new_c9[`ERR_LDWC], 
			    err_state_new_c9[`ERR_LDSC], 
			    err_state_new_c9[`ERR_DAC], 
			    err_state_new_c9[`ERR_DRC] } ; 
 
assign  err_status_in[`ERR_MEC] = (|( ~wr_cerr_vec_c9 & new_cerr_vec_c9 )) | 
			 ( err_status_in[`ERR_VEU] & csr_error_status_vec ) ; 
 
///////////////////////////////////////////////////// 
// VEC bit 
///////////////////////////////////////////////////// 
assign	err_status_in[`ERR_VEC] = |( new_cerr_vec_c9 ) ; 
 
 
 
///////////////////////////////////////////////////// 
// RW bit 
// 1 for a write access 
// Set to 1 for Stores, strm stores, CAs, SWAP, LDSTUB 
// or rdma psts that encounter an error. 
///////////////////////////////////////////////////// 
 
// int 5.0 changes 
assign	rdma_pst_err_c9 = deccck_bscd_uncorr_err_c9 |  
				deccck_bscd_corr_err_c9 ; 
 
// int 5.0 changes 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_store_error_c9 
			(.din(arb_store_err_c8), .l1clk(l1clk), 
                         .scan_in(ff_store_error_c9_scanin),
                         .scan_out(ff_store_error_c9_scanout),
                         .dout(store_error_c9),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 

// int 5.0 changes 
assign  error_spc = ( err_status_in[`ERR_LDAU] | err_status_in[`ERR_LDAC] |
                err_status_in[`ERR_DAU] | err_status_in[`ERR_DAC]) ;

// int 5.0 changes 
assign  error_bsc = ( err_status_in[`ERR_LDRU] | err_status_in[`ERR_LDRC] |
                err_status_in[`ERR_DRU] | err_status_in[`ERR_DRC] );


// int 5.0 changes 
assign  err_status_in[`ERR_RW] = ( store_error_c9 & error_spc) |
                                ( rdma_pst_err_c9 & error_bsc & 
                                ~( rdmard_uerr_c13 | rdmard_cerr_c13 ) ) ;

// int 5.0 changes 
assign  error_rw_en  = ( error_spc | error_bsc )  |
                        (  diag_wr_en ) ;

 
///////////////////////////////////////////////////// 
// ERROR STATUS BITS to CSR from csreg. 
///////////////////////////////////////////////////// 
assign	csreg_err_state_in_mec = err_status_in[`ERR_MEC]; 
assign	csreg_err_state_in_meu = err_status_in[`ERR_MEU]; 
assign	csreg_err_state_in_rw = err_status_in[`ERR_RW]; 
assign	csreg_err_state_in[`ERR_LDAC:`ERR_LVC] = err_status_in[`ERR_LDAC:`ERR_LVC] ; 
 
 
///////////////////////////////////////////////////// 
// SYNDROME 
// recorded for 
// * vuad errors 
// * ldac/ldau 
// * ldrc/ldru for rdma writes only. 
///////////////////////////////////////////////////// 

assign  rdmat_rdmard_uerr_c12_reg_in = (rdmat_rdmard_uerr_c12 | (rdmat_rdmard_notdata_c12 & filbuf_ld64_fb_hit_c12)); 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_rdmard_uerr_c13 
//			(.din(rdmat_rdmard_uerr_c12), .l1clk(l1clk), 
			(.din(rdmat_rdmard_uerr_c12_reg_in), .l1clk(l1clk), 
                         .scan_in(ff_rdmard_uerr_c13_scanin),
                         .scan_out(ff_rdmard_uerr_c13_scanout),
                         .dout(rdmard_uerr_c13),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_rdmard_cerr_c13 
			(.din(rdmat_rdmard_cerr_c12), .l1clk(l1clk), 
                         .scan_in(ff_rdmard_cerr_c13_scanin),
                         .scan_out(ff_rdmard_cerr_c13_scanout),
                         .dout(rdmard_cerr_c13),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
 
assign    csreg_mux1_synd_sel[0] = err_status_in[`ERR_LVU] | err_status_in[`ERR_LVC]; 
assign    csreg_mux1_synd_sel[1] = ~csreg_mux1_synd_sel[0]; // fix for bug 117562
assign    csreg_mux2_synd_sel[0] = ((err_state_new_c9[`ERR_LDAU] |  
				err_state_new_c9[`ERR_LDAC]) | 
                              (( err_state_new_c9[`ERR_LDRU] |  
				err_state_new_c9[`ERR_LDRC] ) & 
                               ~( rdmard_uerr_c13 | rdmard_cerr_c13 )) 
                              ) ; 
 
assign    csreg_mux2_synd_sel[1] = ~csreg_mux2_synd_sel[0] ; 
 
 
assign  csreg_csr_synd_wr_en =  diag_wr_en | 
                        ( new_err_sel & ( csreg_mux1_synd_sel[0] | csreg_mux2_synd_sel[0] )) ;

 
///////////////////////////////////////////////////// 
// TID 
// reported for 
// * ldac/ldau errors 
// * dac/dau errors when they are 
//   detected/reported by an instruction other than a FILL 
///////////////////////////////////////////////////// 
 
 
assign  csreg_wr_enable_tid_c9 = ( err_status_in[`ERR_LDAC] | 
                             err_status_in[`ERR_LDAU] | 
                             err_status_in[`ERR_DAC] | 
                             err_status_in[`ERR_DAU] ) ; 
 
assign  csreg_csr_tid_wr_en = ( csreg_wr_enable_tid_c9 | diag_wr_en ) ;
 
 
///////////////////////////////////////////////////// 
// ASYNC 
// reported for only ldac/ldau errors. 
///////////////////////////////////////////////////// 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_str_ld_hit_c8 
                           (.din(oqu_str_ld_hit_c7), .l1clk(l1clk), 
                               .scan_in(ff_str_ld_hit_c8_scanin),
                               .scan_out(ff_str_ld_hit_c8_scanout),
                               .dout(str_ld_hit_c8),
  .siclk(siclk),
  .soclk(soclk) 
                                
); 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_str_ld_hit_c9 
                           (.din(str_ld_hit_c8), .l1clk(l1clk), 
                               .scan_in(ff_str_ld_hit_c9_scanin),
                               .scan_out(ff_str_ld_hit_c9_scanout),
                               .dout(str_ld_hit_c9),
  .siclk(siclk),
  .soclk(soclk) 
                                
); 
// int 5.0 changes
assign  csreg_wr_enable_async_c9 = (err_status_in[`ERR_LDAC] |
                                err_status_in[`ERR_DAC] |
                                err_status_in[`ERR_DAU] |
                                err_status_in[`ERR_LDAU] ) ;


// int 5.0 changes
assign  set_async_c9 = str_ld_hit_c9 ;

// int 5.0 changes
assign  csreg_csr_async_wr_en =  ( csreg_wr_enable_async_c9 |
                            diag_wr_en ) ;

 
/////////////////////////////////////////////////////
// ADDRESS PRIORITIES
/////////////////////////////////////////////////////
// int 5.0 changes
// 
// 1. LVU               pipe-addr
// 2. LRU               dir_addr
// 3a. LDSU             scrub addr
// 3b. LDAU             pipe_addr.
// 4.  LDWU             evict_addr
// 5a. LDRU             rdma rd addr.
// 5b. LDRU             pipe_addr.
// 6a.  DRU             rdma rd addr.
// 6b.  DRU             pipe addr 
// 6c.  DAU             pipe_addr
// 7.   LVC             pipe addr
// 8.   LTC             pipe_addr
// 9a.  LDSC            scrub addr.
// 9b.  LDAC            pipe_addr
// 10. LDWC              evict_addr
// 11a. LDRC            rdma rd addr.
// 11b. LDRC            pipe_addr.
// 12a  DRC             rdma rd addr.
// 12b  DRC             pipe addr
// 12c  DAC             pipe_addr.
/////////////////////////////////////////////////////
// int 5.0 changes
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_deccck_bscd_uncorr_err_c9 
                        (.din(deccck_bscd_uncorr_err_c8), .l1clk(l1clk),
                         .scan_in(ff_deccck_bscd_uncorr_err_c9_scanin),
                         .scan_out(ff_deccck_bscd_uncorr_err_c9_scanout),
                         .dout(deccck_bscd_uncorr_err_c9),
  .siclk(siclk),
  .soclk(soclk)
                          
);
// int 5.0 changes
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_deccck_bscd_corr_err_c9 
                        (.din(deccck_bscd_corr_err_c8), .l1clk(l1clk),
                         .scan_in(ff_deccck_bscd_corr_err_c9_scanin),
                         .scan_out(ff_deccck_bscd_corr_err_c9_scanout),
                         .dout(deccck_bscd_corr_err_c9),
  .siclk(siclk),
  .soclk(soclk)
                          
);

l2t_csreg_ctl_msff_ctl_macro__width_1 ff_deccck_bscd_notdata_err_c9 
                        (.din(deccck_bscd_notdata_err_c8), .l1clk(l1clk),
                         .scan_in(ff_deccck_bscd_notdata_err_c9_scanin),
                         .scan_out(ff_deccck_bscd_notdata_err_c9_scanout),
                         .dout(deccck_bscd_notdata_err_c9),
  .siclk(siclk),
  .soclk(soclk)

);

 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_bsc_corr_err_c13 
			(.din(filbuf_bsc_corr_err_c12), .l1clk(l1clk), 
                         .scan_in(ff_bsc_corr_err_c13_scanin),
                         .scan_out(ff_bsc_corr_err_c13_scanout),
                         .dout(bsc_corr_err_c13),
  .siclk(siclk),
  .soclk(soclk) 
                          
); 
 
// int 5.0 changes
assign  mux1_addr_sel_tmp[0] = err_state_new_c9[`ERR_LRU] ; // sel dir addr.

// int 5.0 changes
assign  mux1_addr_sel_tmp[1] =  
                (( err_state_new_c9[`ERR_LDSU]  & ~err_state_new_c9[`ERR_LRU] ) |
                 ( err_state_new_c9[`ERR_LDSC]  & ~err_status_in[`ERR_VEU]) ) ; // scrub addr.

// int 5.0 changes
assign  mux1_addr_sel_tmp[2] =  (( err_state_new_c9[`ERR_LDWU]  & ~err_state_new_c9[`ERR_LDSU]
                                & ~err_state_new_c9[`ERR_LRU] ) |
                             (  err_state_new_c9[`ERR_LDWC]  &
                                ~err_status_in[`ERR_VEU] &
                                ~err_state_new_c9[`ERR_LDSC]) ) ; // evict addr.

assign  mux1_addr_sel_tmp[3] = ~|(mux1_addr_sel_tmp[2:0]); 
 
 
assign	csreg_mux1_addr_sel[0] = mux1_addr_sel_tmp[0] ; 
assign	csreg_mux1_addr_sel[1] = mux1_addr_sel_tmp[1] ; 
assign	csreg_mux1_addr_sel[2] = mux1_addr_sel_tmp[2] ; 
assign	csreg_mux1_addr_sel[3] = ( mux1_addr_sel_tmp[3]) ; 
 
 
assign    err_sel = ( err_status_in[`ERR_VEC] | 
                     err_status_in[`ERR_VEU] ) ; 
 
// int 5.0 changes
assign  diag_wr_en = csreg_csr_errstate_wr_en_c8  & ~err_sel ;

// int 5.0 changes
assign  rdmard_addr_sel_c13 = ( (err_state_new_c9[`ERR_LDRU] | err_state_new_c9[`ERR_DRU] ) |
                              (( err_state_new_c9[`ERR_LDRC] | err_state_new_c9[`ERR_DRC]) 
                                & ~err_status_in[`ERR_VEU])) & 
                                (rdmard_uerr_c13 | rdmard_cerr_c13 | bsc_corr_err_c13 );     // rdma rd addr only
 

// int 5.0 changes
// Fix for bug#4375
// when an error is detected in a  rdma rd and a wr8 in the same cycle, 
// the wr8 address is discarded and the rdma rd address is selected.
// the pipe_addr_sel expression needed appropriate qualifications with
// rdmard_uerr_c13 & ( rdmard_cerr_c13 | bsc_corr_err_c13 ) 

 
// int 5.0 changes
assign  pipe_addr_sel   = ( err_state_new_c9[`ERR_LVU]  | 
                                (~err_state_new_c9[`ERR_LRU] & err_state_new_c9[`ERR_LDAU] ) |
                (~err_state_new_c9[`ERR_LRU] & ~err_state_new_c9[`ERR_LDWU] & deccck_bscd_uncorr_err_c9  & ~rdmard_uerr_c13))  |
                         (~err_status_in[`ERR_VEU] & 
                                (err_state_new_c9[`ERR_LTC] |
                                 err_state_new_c9[`ERR_LVC] |
                                 err_state_new_c9[`ERR_LDAC] |
                                 ( deccck_bscd_corr_err_c9 & ~err_state_new_c9[`ERR_LDWC] & ~rdmard_cerr_c13 & ~bsc_corr_err_c13 ))
                         );      // pipe addr only


				  
			 
 
// int 5.0 changes
assign  mux2_addr_sel_tmp[0] = ( rdmard_addr_sel_c13 |
                                (|(mux1_addr_sel_tmp[2:0])) ) &
                                ~pipe_addr_sel   ; // sel mux1 
                                                          // if err
                                                          // or rdma rd
 
assign  mux2_addr_sel_tmp[1] = err_sel & ~mux2_addr_sel_tmp[0] ;  // sel pipe addr 
							  // a9 
 
assign  mux2_addr_sel_tmp[2] = ~(mux2_addr_sel_tmp[1] | mux2_addr_sel_tmp[0] ) ; 
							// sel wr data. 
 
assign	csreg_mux2_addr_sel[0] = mux2_addr_sel_tmp[0] ; 
assign	csreg_mux2_addr_sel[1] = mux2_addr_sel_tmp[1] ; 
assign	csreg_mux2_addr_sel[2] = ( mux2_addr_sel_tmp[2] ) ; 
 
assign  new_err_sel = |(wr_uerr_vec_c9)  | (|(wr_cerr_vec_c9) ) ; 
 
// int 5.0 changes
// An error gets priority to write into the EAR if an error
// and a diagnostic write try to update the EAR in the same cycle.
// Bug #3986. 
// err_addr_sel indicates that an error occurred. In this case,
// any diagnostic write is disabled.

// int 5.0 changes
assign  csreg_csr_addr_wr_en = ( csreg_csr_erraddr_wr_en_c8 & ~err_sel ) | new_err_sel ;
 
 
 
///////////////////////////////////////////////////// 
// POR signalled for LVU/LRU 
// PMB requires reset assertion for 6 cycles. 
// The following signal is not a C8 signal but  
// that is the name it has been given. 
// int 5.0 changes
// This request is conditioned in JBI with an enable bit
// before actually causing a POR.
///////////////////////////////////////////////////// 
 
assign  en_por_c7 = ( err_state_new_c9[`ERR_LVU] | err_state_new_c9[`ERR_LRU] ) ; 
 
l2t_csreg_ctl_msff_ctl_macro__width_1 ff_en_por_c7_d1 
                           (.din(en_por_c7), .l1clk(l1clk), 
                               .scan_in(ff_en_por_c7_d1_scanin),
                               .scan_out(ff_en_por_c7_d1_scanout),
                               .dout(en_por_c7_d1),
  .siclk(siclk),
  .soclk(soclk) 
                                
); 

l2t_csreg_ctl_msff_ctl_macro__width_1 ff_en_por_c7_d2 
                           (.din(en_por_c7_d1), .l1clk(l1clk),
                               .scan_in(ff_en_por_c7_d2_scanin),
                               .scan_out(ff_en_por_c7_d2_scanout),
                               .dout(en_por_c7_d2),
  .siclk(siclk),
  .soclk(soclk)

);

l2t_csreg_ctl_msff_ctl_macro__width_1 ff_en_por_c7_d3 
                           (.din(en_por_c7_d2), .l1clk(l1clk),
                               .scan_in(ff_en_por_c7_d3_scanin),
                               .scan_out(ff_en_por_c7_d3_scanout),
                               .dout(en_por_c7_d3),
  .siclk(siclk),
  .soclk(soclk)

);

l2t_csreg_ctl_msff_ctl_macro__width_1 ff_en_por_c7_d4 
                           (.din(en_por_c7_d3), .l1clk(l1clk),
                               .scan_in(ff_en_por_c7_d4_scanin),
                               .scan_out(ff_en_por_c7_d4_scanout),
                               .dout(en_por_c7_d4),
  .siclk(siclk),
  .soclk(soclk)

);

assign en_por_streatched = en_por_c7_d1 | en_por_c7_d2 | en_por_c7_d3 | en_por_c7_d4 ;

 
// For timing reason flipped to iol2clk domain
//  assign	l2t_rst_fatal_error = en_por_c7_d1 ; 
///

l2t_csreg_ctl_msff_ctl_macro__en_1__width_1 ff_l2t_rst_fatal_error 
	(
	.scan_in(ff_l2t_rst_fatal_error_scanin),
	.scan_out(ff_l2t_rst_fatal_error_scanout),
	.dout	(l2t_rst_fatal_error),
	.din	(en_por_streatched),
	.l1clk  (l1clk),
        .en     (cmp_io_sync_en_r1),
  .siclk(siclk),
  .soclk(soclk)
        );


l2t_csreg_ctl_msff_ctl_macro__width_1 ff_cmp_io_sync_en        
        (
        .scan_in(ff_cmp_io_sync_en_scanin),
        .scan_out(ff_cmp_io_sync_en_scanout),
        .dout   (cmp_io_sync_en_r1),
        .din    (cmp_io_sync_en),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );




 
// BS 06/13/04 added Notdata error logic
///////////////////////////////////////////////////

/////////////////////////////////////////////////////
// NDDM bit
// Set for an RDMA Read or an RDMA Write ( Partial )
// Only set for accesses that hit the $ and finds Notdata
/////////////////////////////////////////////////////
 

assign  err_state_notdata_new_c8[`ERR_NDDM] =    deccck_bscd_notdata_err_c8 |
                                  ( rdmat_rdmard_notdata_c12 &
                                ~filbuf_ld64_fb_hit_c12 ) ;

l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_nddm 
                        (.din(err_state_notdata_new_c8[`ERR_NDDM]), .l1clk(l1clk),
                         .scan_in(ff_err_state_new_c9_nddm_scanin),
                         .scan_out(ff_err_state_new_c9_nddm_scanout),
                         .dout(err_state_notdata_new_c9[`ERR_NDDM]),
  .siclk(siclk),
  .soclk(soclk)

);

assign  err_status_notdata_in[`ERR_NDDM] = (~( err_state_notdata_new_c9[`ERR_NDSP]) &
                        err_state_notdata_new_c9[`ERR_NDDM])  &
                        ~csr_error_status_notdata;
                  // will log the error only if a notdata error  is not logged already

/////////////////////////////////////////////////////
// NDSP bit
// set for any kind of access LD/ST/ATOMIC/PST that hits the cache 
// and finds Notdata 
// Address=C9. Syndrome = all 1's and hence not stored 
/////////////////////////////////////////////////////

assign  err_state_notdata_new_c8[`ERR_NDSP] = deccck_spcd_notdata_err_c8 ;
                                     // Notdata err on a sparc read hit

l2t_csreg_ctl_msff_ctl_macro__width_1 ff_err_state_new_c9_ndsp 
                        (.din(err_state_notdata_new_c8[`ERR_NDSP]), .l1clk(l1clk),
                         .scan_in(ff_err_state_new_c9_ndsp_scanin),
                         .scan_out(ff_err_state_new_c9_ndsp_scanout),
                         .dout(err_state_notdata_new_c9[`ERR_NDSP]),
  .siclk(siclk),
  .soclk(soclk)

);

assign  err_status_notdata_in[`ERR_NDSP] = err_state_notdata_new_c9[`ERR_NDSP] & ~csr_error_status_notdata;
            // will log the error only if a notdata error  is not logged already

/////////////////////////////////////////////////////
// MEND bit
// Multiple error notdata bit is set if multiple
// notdata errors happen in the same cycle or
// are separated in time.
// This bit is set if the vector being written in
// is different from the vector that is detected
/////////////////////////////////////////////////////

assign  new_notdata_err_vec_c9 = { err_state_notdata_new_c9[`ERR_NDSP],
                           err_state_notdata_new_c9[`ERR_NDDM] } ;

assign  wr_notdata_err_vec_c9 = { err_status_notdata_in[`ERR_NDSP],
                           err_status_notdata_in[`ERR_NDDM] } ;

assign  err_status_notdata_in[`ERR_MEND] = |( ~wr_notdata_err_vec_c9 & new_notdata_err_vec_c9 ) ;

/////////////////////////////////////////////////////
// NDRW bit
// 1 for a write access
// Set to 1 for Stores, strm stores, CAs, SWAP, LDSTUB
// or rdma psts that encounter a notdata error.
/////////////////////////////////////////////////////

l2t_csreg_ctl_msff_ctl_macro__width_1 ff_rdmard_notdata_err_c13 
                        (.din(rdmat_rdmard_notdata_c12), .l1clk(l1clk),
                         .scan_in(ff_rdmard_notdata_err_c13_scanin),
                         .scan_out(ff_rdmard_notdata_err_c13_scanout),
                         .dout(rdmard_notdata_err_c13),
  .siclk(siclk),
  .soclk(soclk)

);


assign  rdma_pst_notdata_err_c9 = deccck_bscd_notdata_err_c9;

assign  err_status_notdata_in[`ERR_NDRW] = ( store_error_c9 & err_status_notdata_in[`ERR_NDSP]) |
                                ( rdma_pst_notdata_err_c9 & err_status_notdata_in[`ERR_NDDM]);



assign  csreg_notdata_error_rw_en  = ( err_status_notdata_in[`ERR_NDSP] | err_status_notdata_in[`ERR_NDRW]
			 | (err_status_notdata_in[`ERR_NDDM] & ~notdata_higher_priority_err ) |				
				csreg_notdata_diag_wr_en) ;



/////////////////////////////////////////////////////
// NOTDATA ERROR STATUS BITS to CSR from csreg.
/////////////////////////////////////////////////////
assign  csreg_notdata_err_state_in_rw = err_status_notdata_in[`ERR_NDRW];
assign  csreg_notdata_err_state_in_mend = err_status_notdata_in[`ERR_MEND];
assign  csreg_notdata_err_state_in[`ERR_NDSP:`ERR_NDDM] = err_status_notdata_in[`ERR_NDSP:`ERR_NDDM] ;

//////////////////////////////////////////
// NOTDATA ERROR REG AE,AF (AF is removed)
//////////////////////////////////////////
//assign  notdata_reg_write_en = arb_csr_wr_en_c7 &
//                                 ((word_addr_c7==3'h6) | (word_addr_c7==3'h7)) ; // AE or AF
// not data register accessed with ae or be
assign  notdata_reg_write_en = arb_csr_wr_en_c7 & 
		((word_addr_c7[4:0]==5'h0E) | (word_addr_c7[4:0]==5'h1E)); // AE or BE 

l2t_csreg_ctl_msff_ctl_macro__width_1 ff_notdata_reg_write_en_d1 
                           (.din(notdata_reg_write_en), .l1clk(l1clk),
                               .scan_in(ff_notdata_reg_write_en_d1_scanin),
                               .scan_out(ff_notdata_reg_write_en_d1_scanout),
                               .dout(notdata_reg_write_en_d1),
  .siclk(siclk),
  .soclk(soclk)

);

assign  csreg_csr_notdata_wr_en_c8 = notdata_reg_write_en_d1;

/////////////////////////////////////////////////////
// Notdata VCID write enable
// valid for
// * NDSP Errors  
/////////////////////////////////////////////////////
//
// A Notdata error gets priority to write into the VCID if an error
// and a diagnostic write try to update the VCID in the same cycle.
// In case an  error occurrs in the same cycle as the diagnostic write,
// the  diagnostic write is disabled.

assign  csreg_wr_enable_notdata_vcid_c9 = (err_status_notdata_in[`ERR_NDSP]);

assign csreg_wr_enable_notdata_nddm_vcid_c9 = ( err_status_notdata_in[`ERR_NDDM]);

assign  csreg_notdata_diag_wr_en = (csreg_csr_notdata_wr_en_c8 &
                                 ~(|(err_status_notdata_in[`ERR_NDSP:`ERR_NDDM])));

assign  csreg_csr_notdata_vcid_wr_en = ( csreg_wr_enable_notdata_vcid_c9 |
			csreg_wr_enable_notdata_nddm_vcid_c9 | csreg_notdata_diag_wr_en);

/////////////////////////////////////////////////////
// Notdata address write enable
// valid for
// * NDSP and NDDM Errors 
/////////////////////////////////////////////////////
// A Notdata error gets priority to write into the EAR if an error
// and a diagnostic write try to update the EAR in the same cycle.
// In case an  error occurrs in the same cycle as the diagnostic write,
// the  diagnostic write is disabled.

assign  csreg_csr_notdata_addr_wr_en = (|(err_status_notdata_in[`ERR_NDSP:`ERR_NDDM])) |
                                       csreg_csr_notdata_wr_en_c8;

 

assign csreg_notdata_addr_mux_sel[2:0] = 
	{ (~err_status_notdata_in[`ERR_NDSP] & ~err_status_notdata_in[`ERR_NDDM]), // wr address from diagnostic 
(~err_status_notdata_in[`ERR_NDSP] & err_status_notdata_in[`ERR_NDDM] &
	~rdma_pst_notdata_err_c9 & rdmard_notdata_err_c13), // rdma rd address
(err_status_notdata_in[`ERR_NDSP] | ( rdma_pst_notdata_err_c9 & err_status_notdata_in[`ERR_NDDM])
                                )}; // c9 address 
			 
/////////////////////////////////////////////////////
// L2 Mask registers
//
/////////////////////////////////////////////////////
assign csreg_csr_l2_mask_reg_wr_en =  arb_csr_wr_en_c7 & (word_addr_c7[4:0]==5'h0F ) ; // AF

l2t_csreg_ctl_msff_ctl_macro__width_1	ff_l2_mask_reg_wr_en 
	(
	.scan_in(ff_l2_mask_reg_wr_en_scanin),
	.scan_out(ff_l2_mask_reg_wr_en_scanout),
	.dout	(csreg_csr_l2_mask_reg_wr_en_d1),
	.din	(csreg_csr_l2_mask_reg_wr_en),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
	
assign csreg_l2_mask_reg_wr_en_c8 = csreg_csr_l2_mask_reg_wr_en_d1;	

 
/////////////////////////////////////////////////////
// L2 Compare registers
//
/////////////////////////////////////////////////////


assign csreg_csr_l2_cmpr_reg_wr_en =  arb_csr_wr_en_c7 & (word_addr_c7[4:0]==5'h1F ) ; // BF

l2t_csreg_ctl_msff_ctl_macro__width_1  ff_l2_cmpr_reg_wr_en 
        (
        .scan_in(ff_l2_cmpr_reg_wr_en_scanin),
        .scan_out(ff_l2_cmpr_reg_wr_en_scanout),
        .dout   (csreg_csr_l2_cmpr_reg_wr_en_d1),
        .din    (csreg_csr_l2_cmpr_reg_wr_en),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

assign csreg_l2_cmpr_reg_wr_en_c8 = csreg_csr_l2_cmpr_reg_wr_en_d1;





// fixscan start:
assign spares_scanin             = scan_in                  ;
assign ff_word_addr_c7_scanin    = spares_scanout           ;
assign ff_bist_reg_write_en_d1_scanin = ff_word_addr_c7_scanout  ;
assign ff_control_reg_write_en_d1_scanin = ff_bist_reg_write_en_d1_scanout;
assign ff_erren_reg_write_en_d1_scanin = ff_control_reg_write_en_d1_scanout;
assign ff_errst_reg_write_en_d1_scanin = ff_erren_reg_write_en_d1_scanout;
assign ff_erraddr_reg_write_en_d1_scanin = ff_errst_reg_write_en_d1_scanout;
assign ff_errinj_reg_write_en_d1_scanin = ff_erraddr_reg_write_en_d1_scanout;
assign ff_mux1_sel_c7_scanin     = ff_errinj_reg_write_en_d1_scanout;
assign ff_err_state_new_c9_lvu_scanin = ff_mux1_sel_c7_scanout   ;
assign ff_err_state_new_c9_lru_scanin = ff_err_state_new_c9_lvu_scanout;
assign ff_err_state_new_c9_ldsu_scanin = ff_err_state_new_c9_lru_scanout;
assign ff_err_state_new_c9_ldau_scanin = ff_err_state_new_c9_ldsu_scanout;
assign ff_err_state_new_c9_ldwu_scanin = ff_err_state_new_c9_ldau_scanout;
assign ff_err_state_new_c9_ldru_scanin = ff_err_state_new_c9_ldwu_scanout;
assign ff_err_state_new_c9_dru_scanin = ff_err_state_new_c9_ldru_scanout;
assign ff_err_state_new_c9_dau_scanin = ff_err_state_new_c9_dru_scanout;
assign ff_err_state_new_c9_dsu_scanin = ff_err_state_new_c9_dau_scanout;
assign ff_err_state_new_c9_lvc_scanin = ff_err_state_new_c9_dsu_scanout;
assign ff_err_state_new_c9_ltc_scanin = ff_err_state_new_c9_lvc_scanout;
assign ff_err_state_new_c9_ldsc_scanin = ff_err_state_new_c9_ltc_scanout;
assign ff_err_state_new_c9_ldac_scanin = ff_err_state_new_c9_ldsc_scanout;
assign ff_err_state_new_c9_ldwc_scanin = ff_err_state_new_c9_ldac_scanout;
assign ff_arb_fill_vld_c3_scanin = ff_err_state_new_c9_ldwc_scanout;
assign ff_ldrc_reporting_scanin  = ff_arb_fill_vld_c3_scanout;
assign ff_csreg_report_ldrc_inpkt_staging_scanin = ff_ldrc_reporting_scanout;
assign ff_err_state_new_c9_ldrc_scanin = ff_csreg_report_ldrc_inpkt_staging_scanout;
assign ff_err_state_new_c9_drc_scanin = ff_err_state_new_c9_ldrc_scanout;
assign ff_err_state_new_c9_dac_scanin = ff_err_state_new_c9_drc_scanout;
assign ff_err_state_new_c9_dsc_scanin = ff_err_state_new_c9_dac_scanout;
assign ff_store_error_c9_scanin  = ff_err_state_new_c9_dsc_scanout;
assign ff_rdmard_uerr_c13_scanin = ff_store_error_c9_scanout;
assign ff_rdmard_cerr_c13_scanin = ff_rdmard_uerr_c13_scanout;
assign ff_str_ld_hit_c8_scanin   = ff_rdmard_cerr_c13_scanout;
assign ff_str_ld_hit_c9_scanin   = ff_str_ld_hit_c8_scanout ;
assign ff_deccck_bscd_uncorr_err_c9_scanin = ff_str_ld_hit_c9_scanout ;
assign ff_deccck_bscd_corr_err_c9_scanin = ff_deccck_bscd_uncorr_err_c9_scanout;
assign ff_deccck_bscd_notdata_err_c9_scanin = ff_deccck_bscd_corr_err_c9_scanout;
assign ff_bsc_corr_err_c13_scanin = ff_deccck_bscd_notdata_err_c9_scanout;
assign ff_en_por_c7_d1_scanin    = ff_bsc_corr_err_c13_scanout;
assign ff_en_por_c7_d2_scanin    = ff_en_por_c7_d1_scanout  ;
assign ff_en_por_c7_d3_scanin    = ff_en_por_c7_d2_scanout  ;
assign ff_en_por_c7_d4_scanin    = ff_en_por_c7_d3_scanout  ;
assign ff_l2t_rst_fatal_error_scanin = ff_en_por_c7_d4_scanout  ;
assign ff_cmp_io_sync_en_scanin  = ff_l2t_rst_fatal_error_scanout;
assign ff_err_state_new_c9_nddm_scanin = ff_cmp_io_sync_en_scanout;
assign ff_err_state_new_c9_ndsp_scanin = ff_err_state_new_c9_nddm_scanout;
assign ff_rdmard_notdata_err_c13_scanin = ff_err_state_new_c9_ndsp_scanout;
assign ff_notdata_reg_write_en_d1_scanin = ff_rdmard_notdata_err_c13_scanout;
assign ff_l2_mask_reg_wr_en_scanin = ff_notdata_reg_write_en_d1_scanout;
assign ff_l2_cmpr_reg_wr_en_scanin = ff_l2_mask_reg_wr_en_scanout;
assign scan_out                  = ff_l2_cmpr_reg_wr_en_scanout;
// fixscan end:
endmodule 







// any PARAMS parms go into naming of macro

module l2t_csreg_ctl_l1clkhdr_ctl_macro (
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


module l2t_csreg_ctl_spare_ctl_macro__num_4 (
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

module l2t_csreg_ctl_msff_ctl_macro__width_5 (
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

module l2t_csreg_ctl_msff_ctl_macro__width_1 (
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

module l2t_csreg_ctl_msff_ctl_macro__width_3 (
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

module l2t_csreg_ctl_msff_ctl_macro__clr_1__width_1 (
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

module l2t_csreg_ctl_msff_ctl_macro__en_1__width_1 (
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








