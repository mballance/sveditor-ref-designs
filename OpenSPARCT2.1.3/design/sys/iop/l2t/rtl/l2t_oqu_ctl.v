// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_oqu_ctl.v
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
`define	ACK_IDLE	0 
`define	ACK_WAIT	1 
`define	ACK_CCX_REQ	2 
 
 


// Address Map Defines
// ===================
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


 
 
module l2t_oqu_ctl (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  arbdec_arbdp_cpuid_c5, 
  arbdec_arbdp_int_bcast_c5, 
  arb_decdp_strld_inst_c6, 
  arb_decdp_atm_inst_c6, 
  arb_decdp_pf_inst_c5, 
  arb_evict_c5, 
  arb_cpuid_c5, 
  arb_oqu_swap_cas2_req_c2, 
  dirvec_dirdp_req_vec_c6, 
  tag_imiss_hit_c5, 
  tag_ld_hit_c5, 
  tag_nonmem_comp_c6, 
  tag_st_ack_c5, 
  tag_strst_ack_c5, 
  tag_uerr_ack_c5, 
  tag_cerr_ack_c5, 
  tag_int_ack_c5, 
  tag_st_req_c5, 
  arb_decdp_mmuld_inst_c6, 
  tag_inval_req_c5, 
  tag_fwd_req_ret_c5, 
  tag_sel_rdma_inval_vec_c5, 
  tag_rdma_wr_comp_c4, 
  tag_store_inst_c5, 
  tag_fwd_req_ld_c6, 
  tag_rmo_st_ack_c5, 
  tag_inst_mb_c5, 
  tag_hit_c5, 
  arb_inst_l2data_vld_c6, 
  arb_inst_l2tag_vld_c6, 
  arb_inst_l2vuad_vld_c6, 
  arb_csr_rd_en_c7, 
  lkup_bank_ena_dcd_c4, 
  lkup_bank_ena_icd_c4, 
  cpx_l2t_grant_cx, 
  wmr_l, 
  scan_in, 
  l2clk, 
  scan_out, 
  l2t_cpx_req_cq, 
  l2t_cpx_atom_cq, 
  oqu_diag_acc_c8, 
  oqu_rqtyp_rtn_c7, 
  oqu_cerr_ack_c7, 
  oqu_uerr_ack_c7, 
  oqu_str_ld_hit_c7, 
  oqu_fwd_req_ret_c7, 
  oqu_atm_inst_ack_c7, 
  oqu_strst_ack_c7, 
  oqu_int_ack_c7, 
  oqu_imiss_hit_c8, 
  oqu_pf_ack_c7, 
  oqu_rmo_st_c7, 
  oqu_l2_miss_c7, 
  oqu_mux1_sel_data_c7, 
  oqu_mux_csr_sel_c7, 
  oqu_sel_inval_c7, 
  oqu_out_mux1_sel_c7, 
  oqu_out_mux2_sel_c7, 
  oqu_sel_array_out_l, 
  oqu_sel_mux1_c6, 
  oqu_sel_mux2_c6, 
  oqu_sel_mux3_c6, 
  oqu_mux_vec_sel_c6, 
  oqu_oqarray_wr_en, 
  oqu_oqarray_rd_en, 
  oqu_oqarray_wr_ptr, 
  oqu_oqarray_rd_ptr, 
  oqu_arb_full_px2, 
  oqu_st_complete_c7, 
  sel_st_ack_c7, 
  oqu_mmu_ld_hit_c7, 
  misbuf_vuad_ce_err_c6, 
  l2t_mb0_run, 
  l2t_mb0_oqarray_rd_en, 
  l2t_mb0_oqarray_wr_en, 
  l2t_mb0_addr);
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
wire ff_int_bcast_c52_scanin;
wire ff_int_bcast_c52_scanout;
wire int_bcast_c52;
wire ff_int_bcast_c6_scanin;
wire ff_int_bcast_c6_scanout;
wire ff_dec_cpu_c52_scanin;
wire ff_dec_cpu_c52_scanout;
wire [7:0] dec_cpu_c52;
wire ff_dec_cpu_c6_scanin;
wire ff_dec_cpu_c6_scanout;
wire ff_dec_cpu_c7_scanin;
wire ff_dec_cpu_c7_scanout;
wire ff_sel_dec_vec_c7_scanin;
wire ff_sel_dec_vec_c7_scanout;
wire ff_diag_acc_c8_scanin;
wire ff_diag_acc_c8_scanout;
wire ff_sel_stinv_req_c52_scanin;
wire ff_sel_stinv_req_c52_scanout;
wire sel_stinv_req_c52;
wire ff_sel_stinv_req_c6_scanin;
wire ff_sel_stinv_req_c6_scanout;
wire ff_sel_inv_vec_c52_scanin;
wire ff_sel_inv_vec_c52_scanout;
wire sel_inv_vec_c52;
wire ff_sel_inv_vec_c6_scanin;
wire ff_sel_inv_vec_c6_scanout;
wire arb_oqu_swap_cas2_req_c5;
wire ff_sel_dec_vec_c52_scanin;
wire ff_sel_dec_vec_c52_scanout;
wire sel_dec_vec_c52;
wire ff_sel_dec_vec_c5_d1_scanin;
wire ff_sel_dec_vec_c5_d1_scanout;
wire ff_req_out_c7_scanin;
wire ff_req_out_c7_scanout;
wire ff_imiss1_out_c52_scanin;
wire ff_imiss1_out_c52_scanout;
wire imiss1_out_c52;
wire ff_imiss1_out_c6_scanin;
wire ff_imiss1_out_c6_scanout;
wire ff_imiss1_out_c7_scanin;
wire ff_imiss1_out_c7_scanout;
wire ff_imiss1_out_c8_scanin;
wire ff_imiss1_out_c8_scanout;
wire ff_imiss2_req_vec_c7_scanin;
wire ff_imiss2_req_vec_c7_scanout;
wire ff_c6_req_vld_scanin;
wire ff_c6_req_vld_scanout;
wire ff_sel_c7_req_d1_scanin;
wire ff_sel_c7_req_d1_scanout;
wire misbuf_vuad_ce_err_c7;
wire imiss1_out_gated_vuad_c6;
wire imiss1_out_gated_vuad_c7;
wire ff_rdma_inv_c7_scanin;
wire ff_rdma_inv_c7_scanout;
wire ff_xbar_req_c7_scanin;
wire ff_xbar_req_c7_scanout;
wire ff_imiss1_to_xbarq_c7_scanin;
wire ff_imiss1_to_xbarq_c7_scanout;
wire ff_rdma_to_xbarq_c7_scanin;
wire ff_rdma_to_xbarq_c7_scanout;
wire ff_imiss2_to_xbarq_c7_scanin;
wire ff_imiss2_to_xbarq_c7_scanout;
wire ff_bcast_req_c6_scanin;
wire ff_bcast_req_c6_scanout;
wire ff_bcast_to_xbar_c7_scanin;
wire ff_bcast_to_xbar_c7_scanout;
wire allow_req_c6_qual;
wire ff_allow_req_c7_scanin;
wire ff_allow_req_c7_scanout;
wire [7:0] l2t_cpx_req_cq_c6;
wire l2t_cpx_atom_cq_c6;
wire ff_l2t_cpx_req_cq_c7_scanin;
wire ff_l2t_cpx_req_cq_c7_scanout;
wire ff_l2t_cpx_atom_cq_c7_scanin;
wire ff_l2t_cpx_atom_cq_c7_scanout;
wire ff_l2t_cpx_req_cq_c7_dup_scanin;
wire ff_l2t_cpx_req_cq_c7_dup_scanout;
wire [7:0] l2t_cpx_req_cq_dup;
wire ff_fwd_req_ret_c52_scanin;
wire ff_fwd_req_ret_c52_scanout;
wire fwd_req_ret_c52;
wire ff_fwd_req_ret_c6_scanin;
wire ff_fwd_req_ret_c6_scanout;
wire ff_fwd_req_ret_c7_scanin;
wire ff_fwd_req_ret_c7_scanout;
wire ff_int_ack_c52_scanin;
wire ff_int_ack_c52_scanout;
wire int_ack_c52;
wire ff_int_ack_c6_scanin;
wire ff_int_ack_c6_scanout;
wire ff_int_ack_c7_scanin;
wire ff_int_ack_c7_scanout;
wire ff_ld_hit_c52_scanin;
wire ff_ld_hit_c52_scanout;
wire ld_hit_c52;
wire ff_ld_hit_c6_scanin;
wire ff_ld_hit_c6_scanout;
wire ff_ld_hit_c7_scanin;
wire ff_ld_hit_c7_scanout;
wire ff_st_req_c52_scanin;
wire ff_st_req_c52_scanout;
wire st_req_c52;
wire ff_st_req_c6_scanin;
wire ff_st_req_c6_scanout;
wire ff_st_req_c7_scanin;
wire ff_st_req_c7_scanout;
wire ff_inval_req_c52_scanin;
wire ff_inval_req_c52_scanout;
wire inval_req_c52;
wire ff_inval_req_c6_scanin;
wire ff_inval_req_c6_scanout;
wire inval_req_c6;
wire ff_inval_req_c7_scanin;
wire ff_inval_req_c7_scanout;
wire inval_req_c7;
wire ff_strst_ack_c52_scanin;
wire ff_strst_ack_c52_scanout;
wire strst_ack_c52;
wire ff_strst_ack_c6_scanin;
wire ff_strst_ack_c6_scanout;
wire ff_strst_ack_c7_scanin;
wire ff_strst_ack_c7_scanout;
wire ff_rmo_st_c52_scanin;
wire ff_rmo_st_c52_scanout;
wire rmo_st_c52;
wire ff_rmo_st_c6_scanin;
wire ff_rmo_st_c6_scanout;
wire ff_rmo_st_c7_scanin;
wire ff_rmo_st_c7_scanout;
wire ff_sel_inv_vec_c7_scanin;
wire ff_sel_inv_vec_c7_scanout;
wire ff_uerr_ack_c52_scanin;
wire ff_uerr_ack_c52_scanout;
wire uerr_ack_c52;
wire ff_uerr_ack_c6_scanin;
wire ff_uerr_ack_c6_scanout;
wire ff_uerr_ack_c7_scanin;
wire ff_uerr_ack_c7_scanout;
wire ff_st_ack_c52_scanin;
wire ff_st_ack_c52_scanout;
wire st_ack_c52;
wire ff_st_ack_c6_scanin;
wire ff_st_ack_c6_scanout;
wire ff_st_ack_c7_scanin;
wire ff_st_ack_c7_scanout;
wire ff_cerr_ack_c52_scanin;
wire ff_cerr_ack_c52_scanout;
wire cerr_ack_c52;
wire ff_cerr_ack_c6_scanin;
wire ff_cerr_ack_c6_scanout;
wire ff_cerr_ack_c7_scanin;
wire ff_cerr_ack_c7_scanout;
wire ff_strld_inst_c7_scanin;
wire ff_strld_inst_c7_scanout;
wire ff_mmuld_inst_c7_scanin;
wire ff_mmuld_inst_c7_scanout;
wire ff_atm_inst_c7_scanin;
wire ff_atm_inst_c7_scanout;
wire ff_l2_miss_c52_scanin;
wire ff_l2_miss_c52_scanout;
wire l2_miss_c52;
wire ff_l2_miss_c6_scanin;
wire ff_l2_miss_c6_scanout;
wire ff_l2_miss_c7_scanin;
wire ff_l2_miss_c7_scanout;
wire ff_pf_inst_c52_scanin;
wire ff_pf_inst_c52_scanout;
wire pf_inst_c52;
wire ff_pf_inst_c6_scanin;
wire ff_pf_inst_c6_scanout;
wire ff_pf_inst_c7_scanin;
wire ff_pf_inst_c7_scanout;
wire arb_oqu_swap_cas2_req_c3;
wire arb_oqu_swap_cas2_req_c4;
wire arb_oqu_swap_cas2_req_c52;
wire arb_oqu_swap_cas2_req_c6;
wire ff_arb_oqu_swap_cas2_req_scanin;
wire ff_arb_oqu_swap_cas2_req_scanout;
wire arb_oqu_swap_cas2_req_c7;
wire sel_inval_ack_c7;
wire sel_st_ack_true_c7;
wire ff_inc_wr_ptr_d1_scanin;
wire ff_inc_wr_ptr_d1_scanout;
wire ff_inc_wr_ptr_d1_1_scanin;
wire ff_inc_wr_ptr_d1_1_scanout;
wire ff_inc_wr_ptr_d1_2_scanin;
wire ff_inc_wr_ptr_d1_2_scanout;
wire ff_l2t_mb0_run_r1_scanin;
wire ff_l2t_mb0_run_r1_scanout;
wire l2t_mb0_run_r1;
wire ff_enc_wr_ptr_d1_scanin;
wire ff_enc_wr_ptr_d1_scanout;
wire ff_wr_ptr15to1_d1_scanin;
wire ff_wr_ptr15to1_d1_scanout;
wire ff_wr_ptr0_d1_scanin;
wire ff_wr_ptr0_d1_scanout;
wire ff_inc_rd_ptr_d1_scanin;
wire ff_inc_rd_ptr_d1_scanout;
wire ff_inc_rd_ptr_d1_1_scanin;
wire ff_inc_rd_ptr_d1_1_scanout;
wire ff_inc_rd_ptr_d1_2_scanin;
wire ff_inc_rd_ptr_d1_2_scanout;
wire ff_rd_ptr15to1_d1_scanin;
wire ff_rd_ptr15to1_d1_scanout;
wire ff_rd_ptr0_d1_scanin;
wire ff_rd_ptr0_d1_scanout;
wire ff_enc_wr_ptr_d2_scanin;
wire ff_enc_wr_ptr_d2_scanout;
wire ff_enc_rd_ptr_d1_scanin;
wire ff_enc_rd_ptr_d1_scanout;
wire ff_inc_wr_ptr_d2_scanin;
wire ff_inc_wr_ptr_d2_scanout;
wire ff_oq_cnt_d1_scanin;
wire ff_oq_cnt_d1_scanout;
wire ff_oq_cnt_plus1_d1_scanin;
wire ff_oq_cnt_plus1_d1_scanout;
wire ff_oq_cnt_minus1_d1_scanin;
wire ff_oq_cnt_minus1_d1_scanout;
wire ff_oq_count_15_d1_scanin;
wire ff_oq_count_15_d1_scanout;
wire ff_oq_count_16_d1_scanin;
wire ff_oq_count_16_d1_scanout;
wire ff_oqu_arb_full_px2_scanin;
wire ff_oqu_arb_full_px2_scanout;
wire ff_oq_count_nonzero_d1_scanin;
wire ff_oq_count_nonzero_d1_scanout;
wire ff_old_req_vld_d1_scanin;
wire ff_old_req_vld_d1_scanout;
wire ff_oq0_out_scanin;
wire ff_oq0_out_scanout;
wire ff_oq1_out_scanin;
wire ff_oq1_out_scanout;
wire ff_oq2_out_scanin;
wire ff_oq2_out_scanout;
wire ff_oq3_out_scanin;
wire ff_oq3_out_scanout;
wire ff_oq4_out_scanin;
wire ff_oq4_out_scanout;
wire ff_oq5_out_scanin;
wire ff_oq5_out_scanout;
wire ff_oq6_out_scanin;
wire ff_oq6_out_scanout;
wire ff_oq7_out_scanin;
wire ff_oq7_out_scanout;
wire ff_oq8_out_scanin;
wire ff_oq8_out_scanout;
wire ff_oq9_out_scanin;
wire ff_oq9_out_scanout;
wire ff_oq10_out_scanin;
wire ff_oq10_out_scanout;
wire ff_oq11_out_scanin;
wire ff_oq11_out_scanout;
wire ff_oq12_out_scanin;
wire ff_oq12_out_scanout;
wire ff_oq13_out_scanin;
wire ff_oq13_out_scanout;
wire ff_oq14_out_scanin;
wire ff_oq14_out_scanout;
wire ff_oq15_out_scanin;
wire ff_oq15_out_scanout;
wire ff_xbar0_scanin;
wire ff_xbar0_scanout;
wire ff_xbar1_scanin;
wire ff_xbar1_scanout;
wire ff_xbar2_scanin;
wire ff_xbar2_scanout;
wire ff_xbar3_scanin;
wire ff_xbar3_scanout;
wire ff_xbar4_scanin;
wire ff_xbar4_scanout;
wire ff_xbar5_scanin;
wire ff_xbar5_scanout;
wire ff_xbar6_scanin;
wire ff_xbar6_scanout;
wire ff_xbar7_scanin;
wire ff_xbar7_scanout;
wire ff_rdma_wr_comp_c5_scanin;
wire ff_rdma_wr_comp_c5_scanout;
wire ff_rdma_wr_comp_c52_scanin;
wire ff_rdma_wr_comp_c52_scanout;
wire ff_rdma_req_state_0_scanin;
wire ff_rdma_req_state_0_scanout;
wire ff_rdma_state_scanin;
wire ff_rdma_state_scanout;
wire ff_oqu_st_complete_c6_scanin;
wire ff_oqu_st_complete_c6_scanout;
wire store_inst_c52;
wire ff_store_inst_c52_scanin;
wire ff_store_inst_c52_scanout;
wire ff_store_inst_c6_scanin;
wire ff_store_inst_c6_scanout;
wire ff_store_inst_c7_scanin;
wire ff_store_inst_c7_scanout;
wire ff_csr_reg_rd_en_c8_scanin;
wire ff_csr_reg_rd_en_c8_scanout;
wire ff_sel_inval_c7_scanin;
wire ff_sel_inval_c7_scanout;
wire ff_fwd_req_vld_ld_c7_scanin;
wire ff_fwd_req_vld_ld_c7_scanout;
wire ff_diag_data_sel_c7_scanin;
wire ff_diag_data_sel_c7_scanout;
wire ff_diag_lddata_sel_c8_scanin;
wire ff_diag_lddata_sel_c8_scanout;
wire ff_diag_tag_sel_c7_scanin;
wire ff_diag_tag_sel_c7_scanout;
wire ff_diag_ldtag_sel_c8_scanin;
wire ff_diag_ldtag_sel_c8_scanout;
wire ff_diag_vuad_sel_c7_scanin;
wire ff_diag_vuad_sel_c7_scanout;
wire ff_diag_ldvuad_sel_c8_scanin;
wire ff_diag_ldvuad_sel_c8_scanout;
wire ff_diag_def_sel_c8_scanin;
wire ff_diag_def_sel_c8_scanout;
wire [2:0] inst_cpuid_c52;
wire ff_dirvec_cpuid_c52_scanin;
wire ff_dirvec_cpuid_c52_scanout;
wire ff_dirvec_cpuid_c6_scanin;
wire ff_dirvec_cpuid_c6_scanout;
wire [2:0] cpuid_c52;
wire [6:0] dec_cpuid_c52;
wire ff_dec_cpuid_c6_scanin;
wire ff_dec_cpuid_c6_scanout;
wire ff_lkup_bank_ena_icd_c5_scanin;
wire ff_lkup_bank_ena_icd_c5_scanout;
wire ff_lkup_bank_ena_dcd_c5_scanin;
wire ff_lkup_bank_ena_dcd_c5_scanout;
wire [3:0] mux_vec_sel_c52;
wire ff_mux_vec_sel_c52_scanin;
wire ff_mux_vec_sel_c52_scanout;
wire ff_mux_vec_sel_c6_scanin;
wire ff_mux_vec_sel_c6_scanout;
 
 
 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 
// from arbdec 
input	[2:0]	arbdec_arbdp_cpuid_c5; // account for fwd_req cpuid 
input		arbdec_arbdp_int_bcast_c5; 
input		arb_decdp_strld_inst_c6; 
input		arb_decdp_atm_inst_c6; 
input	arb_decdp_pf_inst_c5; // NEW_PIN from arbdec 
 
// from arb. 
input		arb_evict_c5; 
input  [2:0]    arb_cpuid_c5;
// BS,SR 12/07/04 : taking out arb_swap_cas2_req_c2 to l2t_oqu_ctl.sv to disable ERROR
// Indication packet on a CE,UE, or Notdata on the store part of the swap or CAS2.
// Instead , regular store ack packet will get sent.

input arb_oqu_swap_cas2_req_c2;
 
input	[7:0]	dirvec_dirdp_req_vec_c6; 
 
// from tag. 
input	tag_imiss_hit_c5; 
input	tag_ld_hit_c5; 
input	tag_nonmem_comp_c6; 
input	tag_st_ack_c5;  
input	tag_strst_ack_c5; 
input	tag_uerr_ack_c5; 
input	tag_cerr_ack_c5; 
input	tag_int_ack_c5; 
input	tag_st_req_c5; 
input   arb_decdp_mmuld_inst_c6; // BS and SR 11/12/03 N2 Xbar Packet format change
input   tag_inval_req_c5; // BS and SR 11/12/03 N2 Xbar Packet format change
input	tag_fwd_req_ret_c5; // tells oqu to send a req 2 cycles later. 
//input	tag_fwd_req_in_c5; 
input	tag_sel_rdma_inval_vec_c5; 
input	tag_rdma_wr_comp_c4; 
input	tag_store_inst_c5; 
input	tag_fwd_req_ld_c6; 
input	tag_rmo_st_ack_c5; // NEW_PIN from tag 
input	tag_inst_mb_c5; //  NEW_PIN  from tag. 
input	tag_hit_c5; // NEW_PIN from tag. 
 
// from arb. 
input   arb_inst_l2data_vld_c6; 
input   arb_inst_l2tag_vld_c6; 
input   arb_inst_l2vuad_vld_c6; 
input	arb_csr_rd_en_c7; 
 
input	[3:0]	lkup_bank_ena_dcd_c4; 
input	[3:0]	lkup_bank_ena_icd_c4; 
 
// from cpx 
input	[7:0]	cpx_l2t_grant_cx; 
 
input           wmr_l;
input scan_in;
input		l2clk; 
 
output scan_out; 
 
// cpx  
output	[7:0]	l2t_cpx_req_cq ; 
output		l2t_cpx_atom_cq; 
 
// to oque. 
output		oqu_diag_acc_c8; 
output	[3:0]	oqu_rqtyp_rtn_c7; 
output		oqu_cerr_ack_c7 ; 
output		oqu_uerr_ack_c7 ; 
output		oqu_str_ld_hit_c7; 
output		oqu_fwd_req_ret_c7; 
output		oqu_atm_inst_ack_c7; 
output		oqu_strst_ack_c7; 
output		oqu_int_ack_c7; 
output		oqu_imiss_hit_c8; 
output		oqu_pf_ack_c7; // NEW_PIN to oque. 
output		oqu_rmo_st_c7; // NEW_PIN to oque 
output		oqu_l2_miss_c7; // NEW_PIN to oque 
 
 
// mux selects to oque 
output  [3:0]   oqu_mux1_sel_data_c7; 
output          oqu_mux_csr_sel_c7; 
output          oqu_sel_inval_c7; 
output  [2:0]   oqu_out_mux1_sel_c7; // sel for mux1 // new_pin POST_3.3 advanced to C7 
output  [2:0]   oqu_out_mux2_sel_c7; // sel for mux2 // new_pin POST_3.3 advanced to C7 
output		oqu_sel_array_out_l; // NEW_PIN 
 
// outputs going to dirvec 
output  [3:0]   oqu_sel_mux1_c6; 
output  [3:0]   oqu_sel_mux2_c6; 
output          oqu_sel_mux3_c6; 
output  [3:0]   oqu_mux_vec_sel_c6; 
 
 
 
// to oq array. 
output		oqu_oqarray_wr_en; 
output		oqu_oqarray_rd_en; 
output	[3:0]	oqu_oqarray_wr_ptr; 
output	[3:0]	oqu_oqarray_rd_ptr; 
 
// to arb 
output		oqu_arb_full_px2; 
 
// to tag 
output		oqu_st_complete_c7; 

output 		sel_st_ack_c7;  // BS and SR 11/12/03 N2 Xbar Packet format change
output 		oqu_mmu_ld_hit_c7;  // BS and SR 11/12/03 N2 Xbar Packet format change

// from misbuf
input		misbuf_vuad_ce_err_c6; // vuad ecc change

// mbist

input		l2t_mb0_run;
input		l2t_mb0_oqarray_rd_en;
input		l2t_mb0_oqarray_wr_en;
input	[3:0]	l2t_mb0_addr;


 

//////////////////////////////////////////////////
// L1 clk header
//////////////////////////////////////////////////
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

l2t_l1clkhdr_ctl_macro clkgen (
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
l2t_spare_ctl_macro__num_4 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
//////////////////////////////////////////


wire   [7:0] dec_cpu_gated_vuad_c6,dec_cpu_gated_vuad_c7,inval_vec_gated_vuad_c6;

wire    oqu_mmu_ld_hit_c7; // BS and SR 11/12/03 N2 Xbar Packet format change
wire	int_bcast_c5, int_bcast_c6; 
wire	[7:0]	dec_cpu_c5, dec_cpu_c6, dec_cpu_c7; 
wire	sel_stinv_req_c5, sel_stinv_req_c6; 
wire	sel_inv_vec_c5, sel_inv_vec_c6 ; 
wire	sel_dec_vec_c5, sel_dec_vec_c5_d1; 
wire	sel_dec_vec_c6, sel_dec_vec_c6_d1; 
wire	[7:0]	inval_vec_c6; 
wire	[3:0]	sel_req_out_c6; 
wire	[7:0]   req_out_c6, req_out_c7; 
wire	imiss1_out_c6, imiss1_out_c7, imiss1_out_c8; 
wire	imiss2_out_c6, imiss2_out_c7; 
wire	[7:0]	imiss2_req_vec_c6, imiss2_req_vec_c7; 
wire	c6_req_vld, c7_req_vld; 
wire	sel_c7_req, sel_c7_req_d1 ; 
wire	old_req_vld_d1, oq_count_nonzero_d1; 
wire	mux1_sel_c7_req, mux1_sel_dec_vec_c6; 
wire	mux1_sel_def_c6, mux1_sel_dec_vec_c7; 
wire	imiss1_to_xbar_tmp_c6;  
wire	[7:0]	imiss2_to_xbar_tmp_c6; 
 
wire	mux2_sel_inv_vec_c6; 
wire	oq_count_nonzero; 
wire	mux3_sel_oq_req; 
wire	imiss1_oq_or_pipe; 
wire	sel_old_req; 
wire	imiss1_to_xbarq_c6, imiss1_to_xbarq_c7; 
 
 
wire	[7:0]	imiss2_from_oq, imiss2_oq_or_pipe; 
wire	[7:0]	req_to_xbarq_c6, req_to_xbarq_c7; 
wire	[7:0]	imiss2_to_xbarq_c6, imiss2_to_xbarq_c7; 
wire	[7:0]	mux2_req_vec_c6, mux3_req_vec_c6; 
wire	[7:0]	mux1_req_vec_c6; 
 
wire	[4:0]	oq_count_p; 
 
wire	[7:0]	bcast_st_req_c6, bcast_inval_req_c6; 
wire		bcast_req_c6,bcast_req_c7 ; 
wire		bcast_req_pipe; 
wire		bcast_req_oq_or_pipe, bcast_to_xbar_c6, bcast_to_xbar_c7; 
wire	[7:0]	bcast_req_xbarqfull_c6, req_to_que_in_xbarq_c7; 
wire		allow_new_req_bcast, allow_old_req_bcast ; 
wire		allow_req_c6, allow_req_c7 ; 
wire	[7:0]	que_in_xbarq_c7; 
wire		old_req_vld ; 
 
wire	[3:0]	load_ret, stack_ret, imiss_err_or_int_rqtyp_c7 ; 
wire	st_req_c6, st_req_c7, int_req_sel_c7 ; 
wire	fwd_req_ret_c6 ; 
wire	int_ack_c6, int_ack_c7 ; 
wire	ld_hit_c6, ld_hit_c7 ; 
wire	strld_inst_c7; 
wire    mmuld_inst_c7; // BS and SR 11/12/03 N2 Xbar Packet format change
wire	atm_inst_c7; 
wire	strst_ack_c6 ; 
wire	uerr_ack_c6, uerr_ack_c7 ; 
wire	cerr_ack_c6, cerr_ack_c7 ; 
wire	imiss_req_sel_c7, err_req_sel_c7 ; 
wire	sel_evict_vec_c7; 
wire	imiss_err_or_int_sel_c7, sel_st_ack_c7, sel_ld_ret_c7; 
wire	[3:0]	rqtyp_rtn_c7; 
wire    [3:0]   rqtyp_rtn_c7_tmp; // BS and SR 11/12/03 N2 Xbar Packet format change
 
wire	inc_wr_ptr, inc_wr_ptr_d1, inc_rd_ptr, inc_rd_ptr_d1; 
wire	[15:0]	wr_word_line, rd_word_line; 
wire	[3:0]	enc_wr_ptr, enc_rd_ptr; 
wire	[3:0]   enc_wr_ptr_d1, enc_rd_ptr_d1; 
wire	[15:0]	wr_ptr, wr_ptr_d1, wr_ptr_lsby1; 
wire		wr_ptr0_n, wr_ptr0_n_d1 ; 
wire	[15:0]	rd_ptr, rd_ptr_d1, rd_ptr_lsby1; 
wire		rd_ptr0_n, rd_ptr0_n_d1 ; 
 
wire	sel_count_inc, sel_count_dec, sel_count_def; 
wire	[4:0]	oq_count_plus_1,oq_count_minus_1, oq_count_reset_p ; 
wire	[4:0]	oq_count_d1, oq_count_plus_1_d1, oq_count_minus_1_d1; 
wire	oqu_full_px1; 
 
 
wire    [11:0]   oq0_out; 
wire    [11:0]   oq1_out; 
wire    [11:0]   oq2_out; 
wire    [11:0]   oq3_out; 
wire    [11:0]   oq4_out; 
wire    [11:0]   oq5_out; 
wire    [11:0]   oq6_out; 
wire    [11:0]   oq7_out; 
wire    [11:0]   oq8_out; 
wire    [11:0]   oq9_out; 
wire    [11:0]   oq10_out; 
wire    [11:0]   oq11_out; 
wire    [11:0]   oq12_out; 
wire    [11:0]   oq13_out; 
wire    [11:0]   oq14_out; 
wire    [11:0]   oq15_out; 
 
wire	[7:0]	oq_rd_out; 
wire	imiss1_rd_out, imiss2_rd_out; 
wire	oq_bcast_out; 
 
wire	[1:0]	xbar0_cnt, xbar0_cnt_p, xbar0_cnt_plus1, xbar0_cnt_minus1; 
wire	[1:0]	xbar1_cnt, xbar1_cnt_p, xbar1_cnt_plus1, xbar1_cnt_minus1; 
wire	[1:0]	xbar2_cnt, xbar2_cnt_p, xbar2_cnt_plus1, xbar2_cnt_minus1; 
wire	[1:0]	xbar3_cnt, xbar3_cnt_p, xbar3_cnt_plus1, xbar3_cnt_minus1; 
wire	[1:0]	xbar4_cnt, xbar4_cnt_p, xbar4_cnt_plus1, xbar4_cnt_minus1; 
wire	[1:0]	xbar5_cnt, xbar5_cnt_p, xbar5_cnt_plus1, xbar5_cnt_minus1; 
wire	[1:0]	xbar6_cnt, xbar6_cnt_p, xbar6_cnt_plus1, xbar6_cnt_minus1; 
wire	[1:0]	xbar7_cnt, xbar7_cnt_p, xbar7_cnt_plus1, xbar7_cnt_minus1; 
wire	[7:0]	xbarq_full, xbarq_cnt1; 
 
wire    [7:0]   inc_xbar_cnt; 
wire    [7:0]   dec_xbar_cnt; 
wire    [7:0]   nochange_xbar_cnt; 
wire    [7:0]   change_xbar_cnt; 
 
 
wire    [15:0]  oq_out_bit7,oq_out_bit6,oq_out_bit5,oq_out_bit4; 
wire    [15:0]  oq_out_bit3,oq_out_bit2,oq_out_bit1,oq_out_bit0; 
wire    [15:0]  imiss1_oq_out; 
wire    [15:0]  imiss2_oq_out; 
wire    [15:0]  bcast_oq_out ; 
wire	[7:0]	evict_inv_vec; 
 
wire	[15:0]	rdma_oq_out; 
wire	oq_rdma_out; 
wire	rdma_inv_c6, rdma_inv_c7; 
wire	rdma_to_xbar_tmp_c6, rdma_oq_or_pipe; 
wire	rdma_to_xbarq_c6, rdma_to_xbarq_c7 ; 
 
wire	rdma_wr_comp_c5; 
wire    rdma_wr_comp_c52; // BS 03/11/04 extra cycle for mem access
wire	dir_hit_c6 ; 
wire	ack_idle_state_in_l, ack_idle_state_l ; 
wire	oqu_st_complete_c6 ; 
wire	[2:0]	rdma_state_in, rdma_state; 
wire	rdma_req_sent_c7; 
 
wire	oqu_prev_data_c7; 
wire	oqu_sel_oq_c7; 
wire	oqu_sel_old_req_c7; 
wire	oqu_sel_inval_c6; 
 
wire            store_inst_c6; 
wire            store_inst_c7; 
 
wire            diag_data_sel_c7; 
wire            diag_tag_sel_c7; 
wire            diag_vuad_sel_c7; 
wire            diag_lddata_sel_c7; 
wire            diag_ldtag_sel_c7; 
wire            diag_ldvuad_sel_c7; 
wire            diag_lddata_sel_c8; 
wire            diag_ldtag_sel_c8; 
wire            diag_ldvuad_sel_c8; 
wire            diag_def_sel_c7; 
wire            diag_def_sel_c8; 
 
wire            fwd_req_vld_ld_c7; 
 
wire            oqctl_sel_inval_c7; 
 
wire            csr_reg_rd_en_c8; 
 
 
wire            sel_old_data_c7; 
 
 
wire    [2:0]   cpuid_c5; 
wire    [2:0]   inst_cpuid_c6; 
wire    [6:0]   dec_cpuid_c6 ; 
wire    [6:0]   dec_cpuid_c5; 
 
wire    [3:0]   lkup_bank_ena_dcd_c5; 
wire    [3:0]   lkup_bank_ena_icd_c5; 
 
wire    [3:0]   mux_vec_sel_c5; 
wire    [3:0]   mux_vec_sel_c6_unqual ; 
wire	pf_inst_c6, pf_inst_c7 ; 
wire	rmo_st_c6, rmo_st_c7 ; 
wire	l2_miss_c5, l2_miss_c6, l2_miss_c7 ; 
 
 
wire	[3:0]	enc_wr_ptr_d2 ; 
wire		inc_wr_ptr_d2; 
 
wire            dbb_rst_l; 
wire		inc_rd_ptr_d1_1, inc_rd_ptr_d1_2, inc_rd_ptr_d1_3; 
wire	 inc_wr_ptr_d1_1, inc_wr_ptr_d1_2; 
wire	st_ack_c6, st_ack_c7; 
wire	oq_count_15_p,  oq_count_15_d1; 
wire	oq_count_16_p,  oq_count_16_d1; 
wire	wr_wl_disable; 
 
/////////////////////////////////////////////////////////////////// 
 // Reset flop 
 /////////////////////////////////////////////////////////////////// 
 
l2t_msff_ctl_macro__width_1 reset_flop 
				(.dout(dbb_rst_l), 
                                        .scan_in(reset_flop_scanin),
                                        .scan_out(reset_flop_scanout),
                                        .l1clk(l1clk), 
                                        .din(wmr_l),
  .siclk(siclk),
  .soclk(soclk) 
                                         
); 
 
 
 
/////////////////////////////////////////////////////////////////////////// 
// Request vector generation. 
// The CPUs need to be either invalidated or acknowledged for actions that 
// happen in the L2 $. Most of these actions are caused by cpu requests to  
// the L2. However, evictions and disrupting errors are independent of  
// requests coming from the CPU and form a portion of the requests going 
// to the CPUs 
// 
// All requests are sent to the CPUs in C7 except requests in response 
// to diagnostic accesses which are sent a cycle later. 
// 
// Request can be generated from an instruction in the pipe or an older 
// request.  The request vector is generated in C6 The request vector is generated in C6. 
// The 4 sources of requests in the following logic are as follows: 
// * Request in pipe 
// * delayed ( 1cycle ) Request in pipe 
// * Request from the OQ. 
// * Request that was selected from the above  3 sources but 
//   was not able to send to the xbar because of a xbar fulll condition 
// 
/////////////////////////////////////////////////////////////////////////// 
 
 
 
 
assign	int_bcast_c5 = tag_int_ack_c5 & arbdec_arbdp_int_bcast_c5 ; 

// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_1 ff_int_bcast_c52 
                           (.din(int_bcast_c5), .l1clk(l1clk),
                    .scan_in(ff_int_bcast_c52_scanin),
                    .scan_out(ff_int_bcast_c52_scanout),
                    .dout(int_bcast_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_msff_ctl_macro__width_1 ff_int_bcast_c6 
                           (.din(int_bcast_c52), .l1clk(l1clk), 
                    .scan_in(ff_int_bcast_c6_scanin),
                    .scan_out(ff_int_bcast_c6_scanout),
                    .dout(int_bcast_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
/////////////// 
// FWD req responses are now forwarded to the  
// cpu that made the request. 
////////// 
// 
//mux_ctl_macro mux_cpuid_c5 (width=3,ports=2,mux=aonpe)
//			(.dout(cpu_c5[2:0]), 
//                       	.din0(arbdec_arbdp_cpuid_c5[2:0]), // instr cpu id  
//				.din1(3'b0), // fwd req response alwaya to cpu0 
//                       	.sel0(~tag_fwd_req_in_c5), // no fwd req 
//				.sel1(tag_fwd_req_in_c5)); // fwd req 
////////////// 
 
assign  dec_cpu_c5[0] = ( arbdec_arbdp_cpuid_c5[2:0] == 3'd0 ) | int_bcast_c5 ; 
assign  dec_cpu_c5[1] = ( arbdec_arbdp_cpuid_c5[2:0] == 3'd1 ) | int_bcast_c5 ; 
assign  dec_cpu_c5[2] = ( arbdec_arbdp_cpuid_c5[2:0] == 3'd2 ) | int_bcast_c5 ; 
assign  dec_cpu_c5[3] = ( arbdec_arbdp_cpuid_c5[2:0] == 3'd3 ) | int_bcast_c5 ; 
assign  dec_cpu_c5[4] = ( arbdec_arbdp_cpuid_c5[2:0] == 3'd4 ) | int_bcast_c5 ; 
assign  dec_cpu_c5[5] = ( arbdec_arbdp_cpuid_c5[2:0] == 3'd5 ) | int_bcast_c5 ; 
assign  dec_cpu_c5[6] = ( arbdec_arbdp_cpuid_c5[2:0] == 3'd6 ) | int_bcast_c5 ; 
assign  dec_cpu_c5[7] = ( arbdec_arbdp_cpuid_c5[2:0] == 3'd7 ) | int_bcast_c5 ; 

// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_8 ff_dec_cpu_c52 
                           (.din(dec_cpu_c5[7:0]), .l1clk(l1clk),
                    .scan_in(ff_dec_cpu_c52_scanin),
                    .scan_out(ff_dec_cpu_c52_scanout),
                    .dout(dec_cpu_c52[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
);
l2t_msff_ctl_macro__width_8 ff_dec_cpu_c6 
                           (.din(dec_cpu_c52[7:0]), .l1clk(l1clk), 
                    .scan_in(ff_dec_cpu_c6_scanin),
                    .scan_out(ff_dec_cpu_c6_scanout),
                    .dout(dec_cpu_c6[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
l2t_msff_ctl_macro__width_8 ff_dec_cpu_c7 
                           (.din(dec_cpu_c6[7:0]), .l1clk(l1clk), 
                    .scan_in(ff_dec_cpu_c7_scanin),
                    .scan_out(ff_dec_cpu_c7_scanout),
                    .dout(dec_cpu_c7[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// select the req vec for the instruction in C6 for a diagnostic 
// access or a CSR instruction store completion. 
 
assign	sel_dec_vec_c6 = tag_nonmem_comp_c6; 
 
l2t_msff_ctl_macro__width_1 ff_sel_dec_vec_c7 
                           (.din(sel_dec_vec_c6), .l1clk(l1clk), 
                    	.scan_in(ff_sel_dec_vec_c7_scanin),
                    	.scan_out(ff_sel_dec_vec_c7_scanout),
                    	.dout(sel_dec_vec_c6_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_diag_acc_c8 
                           (.din(sel_dec_vec_c6_d1), .l1clk(l1clk), 
         		.scan_in(ff_diag_acc_c8_scanin),
         		.scan_out(ff_diag_acc_c8_scanout),
         		.dout(oqu_diag_acc_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
assign	sel_stinv_req_c5 = ( tag_st_ack_c5  
			| tag_strst_ack_c5 )   ; 

// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_1 ff_sel_stinv_req_c52 
                           (.din(sel_stinv_req_c5), .l1clk(l1clk),
                    .scan_in(ff_sel_stinv_req_c52_scanin),
                    .scan_out(ff_sel_stinv_req_c52_scanout),
                    .dout(sel_stinv_req_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_msff_ctl_macro__width_1 ff_sel_stinv_req_c6 
                           (.din(sel_stinv_req_c52), .l1clk(l1clk), 
                    .scan_in(ff_sel_stinv_req_c6_scanin),
                    .scan_out(ff_sel_stinv_req_c6_scanout),
                    .dout(sel_stinv_req_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	sel_inv_vec_c5 =  ( arb_evict_c5 | tag_sel_rdma_inval_vec_c5 ) ; 

// BS 03/11/04 extra cycle for mem access
l2t_msff_ctl_macro__width_1 ff_sel_inv_vec_c52 
                           (.din(sel_inv_vec_c5), .l1clk(l1clk),
                    .scan_in(ff_sel_inv_vec_c52_scanin),
                    .scan_out(ff_sel_inv_vec_c52_scanout),
                    .dout(sel_inv_vec_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_msff_ctl_macro__width_1 ff_sel_inv_vec_c6 
                           (.din(sel_inv_vec_c52), .l1clk(l1clk), 
                    .scan_in(ff_sel_inv_vec_c6_scanin),
                    .scan_out(ff_sel_inv_vec_c6_scanout),
                    .dout(sel_inv_vec_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	sel_dec_vec_c5 = ( tag_imiss_hit_c5 |  
			tag_ld_hit_c5 | 
			(tag_uerr_ack_c5 & ~arb_oqu_swap_cas2_req_c5) |
			(tag_cerr_ack_c5 & ~arb_oqu_swap_cas2_req_c5) |
			tag_int_ack_c5 )  ; 

                       // fix for bug 92808, l2 should
                       // let inval happen to other sparcs if it has UE/CE in cas2 or swap
                       // as it will send regular store ack packet for such cases
                       // and not ERROR indication packet.

// BS 03/11/04 extra cycle for mem access
l2t_msff_ctl_macro__width_1 ff_sel_dec_vec_c52 
                           (.din(sel_dec_vec_c5), .l1clk(l1clk),
                    .scan_in(ff_sel_dec_vec_c52_scanin),
                    .scan_out(ff_sel_dec_vec_c52_scanout),
                    .dout(sel_dec_vec_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_msff_ctl_macro__width_1 ff_sel_dec_vec_c5_d1 
                           (.din(sel_dec_vec_c52), .l1clk(l1clk), 
                    .scan_in(ff_sel_dec_vec_c5_d1_scanin),
                    .scan_out(ff_sel_dec_vec_c5_d1_scanout),
                    .dout(sel_dec_vec_c5_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// invalidate/stack vector 
assign	inval_vec_c6 = ( dirvec_dirdp_req_vec_c6 | 
                ( dec_cpu_c6 &  
		{8{sel_stinv_req_c6}} ) ) ; 
 
 
assign	sel_req_out_c6[0] = sel_dec_vec_c5_d1 ; 
assign	sel_req_out_c6[1] = sel_dec_vec_c6_d1 & ~sel_dec_vec_c5_d1 ; 
assign	sel_req_out_c6[2] = ( sel_stinv_req_c6 | sel_inv_vec_c6 )  & ~sel_dec_vec_c5_d1 & 
				~sel_dec_vec_c6_d1 ; 
assign	sel_req_out_c6[3] = ~( sel_stinv_req_c6 |  
				sel_inv_vec_c6 | 
				sel_dec_vec_c5_d1 | 
				sel_dec_vec_c6_d1 ) ; 
 
 
// pipeline request C6 
l2t_mux_ctl_macro__mux_aonpe__ports_4__width_8 mux_req_out_c6 
		( .dout (req_out_c6[7:0]), 
                  	.din0(dec_cpu_gated_vuad_c6[7:0]),  
			.din1(dec_cpu_gated_vuad_c7[7:0]), 
                  	.din2(inval_vec_gated_vuad_c6[7:0]),  
			.din3(8'b0), 
                  	.sel0(sel_req_out_c6[0]),  
			.sel1(sel_req_out_c6[1]), 
                  	.sel2(sel_req_out_c6[2]),  
			.sel3(sel_req_out_c6[3])); 
 
l2t_msff_ctl_macro__width_8 ff_req_out_c7 
                           (.din(req_out_c6[7:0]), .l1clk(l1clk), 
           	.scan_in(ff_req_out_c7_scanin),
           	.scan_out(ff_req_out_c7_scanout),
           	.dout(req_out_c7[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// imiss 1 request C6. 
 
l2t_msff_ctl_macro__width_1 ff_imiss1_out_c52 
                           (.din(tag_imiss_hit_c5), .l1clk(l1clk), 
                    .scan_in(ff_imiss1_out_c52_scanin),
                    .scan_out(ff_imiss1_out_c52_scanout),
                    .dout(imiss1_out_c52),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_1 ff_imiss1_out_c6 
                           (.din(imiss1_out_c52), .l1clk(l1clk),
                    .scan_in(ff_imiss1_out_c6_scanin),
                    .scan_out(ff_imiss1_out_c6_scanout),
                    .dout(imiss1_out_c6),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_msff_ctl_macro__width_1 ff_imiss1_out_c7 
                           (.din(imiss1_out_c6), .l1clk(l1clk), 
                 .scan_in(ff_imiss1_out_c7_scanin),
                 .scan_out(ff_imiss1_out_c7_scanout),
                 .dout(imiss1_out_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_imiss1_out_c8 
                           (.din(imiss1_out_c7), .l1clk(l1clk), 
                 .scan_in(ff_imiss1_out_c8_scanin),
                 .scan_out(ff_imiss1_out_c8_scanout),
                 .dout(imiss1_out_c8),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	oqu_imiss_hit_c8 = imiss1_out_c8 ; 
 
assign	imiss2_out_c6 = imiss1_out_c7; 
assign	imiss2_out_c7 = imiss1_out_c8; 
 
assign  imiss2_req_vec_c6 = {8{imiss2_out_c6}} & req_out_c7 ; 
 
l2t_msff_ctl_macro__width_8 ff_imiss2_req_vec_c7 
                           (.din(imiss2_req_vec_c6[7:0]), .l1clk(l1clk), 
               .scan_in(ff_imiss2_req_vec_c7_scanin),
               .scan_out(ff_imiss2_req_vec_c7_scanout),
               .dout(imiss2_req_vec_c7[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
////////////////////// 
// A request in the pipe is valid under the following conditions. 
//  -dir inval vec is non-zero for an eviction 
//  -an imiss 2nd packet is in C7 
//  -all conditions that cause assertion of sel_dec_vec_c5_d1 
//  -all conditions that cause the assertion of sel_dec_vec_c6_d1 
// 
// A delayed pipe( by 1 cycle ) request is selected  
// over an incomping pipe request in Cycle T 
// if the pipe request is cycle T-1 was overruled due 
// to higher priority requests. 
////////////////////// 
 
assign	evict_inv_vec = {8{sel_inv_vec_c6}} & dirvec_dirdp_req_vec_c6 ; 
 
assign	c6_req_vld  = |( evict_inv_vec | imiss2_req_vec_c6 ) | 
			sel_dec_vec_c5_d1 |  
			sel_stinv_req_c6 |  
			sel_dec_vec_c6_d1 ; 
				 
l2t_msff_ctl_macro__width_1 ff_c6_req_vld 
                           (.din(c6_req_vld), .l1clk(l1clk), 
                 .scan_in(ff_c6_req_vld_scanin),
                 .scan_out(ff_c6_req_vld_scanout),
                 .dout(c7_req_vld),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign  sel_c7_req = c7_req_vld & ( sel_c7_req_d1 |// selected delayed pipe req 
                old_req_vld_d1 | 	// selected existing req to xbar 
		oq_count_nonzero_d1) ; // selected from OQ. 
 
l2t_msff_ctl_macro__width_1 ff_sel_c7_req_d1 
                           (.din(sel_c7_req), .l1clk(l1clk), 
                .scan_in(ff_sel_c7_req_d1_scanin),
                .scan_out(ff_sel_c7_req_d1_scanout),
                .dout(sel_c7_req_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 
////////////////////////// 
// request Mux1. 
// Select between the following 
// request sources - 
// - delayed pipe req 
// - c6 pipe req 
// - c7 pipe req 
// - default. 
// 
// A delayed pipe request has the 
// highest priority. 
////////////////////////// 
assign mux1_sel_c7_req = sel_c7_req  ; 
 
assign mux1_sel_dec_vec_c6 =  sel_dec_vec_c5_d1  & ~sel_c7_req; 
assign mux1_sel_dec_vec_c7 =  sel_dec_vec_c6_d1 & 
				~sel_dec_vec_c5_d1 & 
				~sel_c7_req ; 
 
assign	mux1_sel_def_c6 = ~( sel_dec_vec_c5_d1 | 
			  sel_dec_vec_c6_d1 ) & 
			  ~sel_c7_req ; 

assign dec_cpu_gated_vuad_c6 = dec_cpu_c6 & {8{~misbuf_vuad_ce_err_c6}};
assign dec_cpu_gated_vuad_c7 = dec_cpu_c7 & {8{~misbuf_vuad_ce_err_c7}};
				 
 
l2t_mux_ctl_macro__mux_aonpe__ports_4__width_8 mux_mux1_req_vec_c6 
		( .dout (mux1_req_vec_c6[7:0]), 
             		.din0(req_out_c7[7:0]),  
			.din1(dec_cpu_gated_vuad_c6[7:0]), 
               		.din2(dec_cpu_gated_vuad_c7[7:0]),  
			.din3(8'b0), 
               		.sel0(mux1_sel_c7_req),  
			.sel1(mux1_sel_dec_vec_c6), 
               		.sel2(mux1_sel_dec_vec_c7),  
			.sel3(mux1_sel_def_c6)); 

assign imiss1_out_gated_vuad_c6 = imiss1_out_c6 & ~misbuf_vuad_ce_err_c6; 
assign imiss1_out_gated_vuad_c7 = imiss1_out_c7 & ~misbuf_vuad_ce_err_c7;
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_1 mux_mux1_imiss1_c6 
		(.dout(imiss1_to_xbar_tmp_c6), 
                       	.din0(imiss1_out_gated_vuad_c6), 
			.din1(imiss1_out_gated_vuad_c7), 
                       	.sel0(~sel_c7_req), 
			.sel1(sel_c7_req)); 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_8 mux_mux1_imiss2_c6 
		(.dout(imiss2_to_xbar_tmp_c6[7:0]), 
                       	.din0(imiss2_req_vec_c6[7:0]), 
			.din1(imiss2_req_vec_c7[7:0]), 
                       	.sel0(~sel_c7_req), 
			.sel1(sel_c7_req)); 
 
assign	rdma_inv_c6 = rdma_state[`ACK_WAIT] &  |( dirvec_dirdp_req_vec_c6 ); 
 
l2t_msff_ctl_macro__width_1 ff_rdma_inv_c7 
                           (.din(rdma_inv_c6), .l1clk(l1clk), 
                   .scan_in(ff_rdma_inv_c7_scanin),
                   .scan_out(ff_rdma_inv_c7_scanout),
                   .dout(rdma_inv_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_1 mux_mux1_rdma_c6 
		(.dout(rdma_to_xbar_tmp_c6), 
                       	.din0(rdma_inv_c6), 
			.din1(rdma_inv_c7), 
                       	.sel0(~sel_c7_req), 
			.sel1(sel_c7_req)); 
 
////////////////////////// 
// request Mux2. 
// Select between the following 
// - Mux1 request 
// - invalidation/ack vector. 
////////////////////////// 
 
 
 
assign	mux2_sel_inv_vec_c6 = mux1_sel_def_c6 &  
			( sel_stinv_req_c6 | sel_inv_vec_c6 ); 
				 
assign inval_vec_gated_vuad_c6 =  inval_vec_c6 & {8{~misbuf_vuad_ce_err_c6}};
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_8 mux_mux2_req_c6 
		( .dout (mux2_req_vec_c6[7:0]), 
                   	.din0(mux1_req_vec_c6[7:0]),  
			.din1(inval_vec_gated_vuad_c6[7:0]), 
                   	.sel0(~mux2_sel_inv_vec_c6),  
			.sel1(mux2_sel_inv_vec_c6)) ; 
 
////////////////////////// 
// request Mux3. 
// Select between the following 
// - Mux2 request 
// - Oq request. 
// OQ request has priority 
////////////////////////// 
 
 
 
assign  mux3_sel_oq_req = dbb_rst_l & oq_count_nonzero; 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_8 mux_mux3_req_vec_c6 
		( .dout (mux3_req_vec_c6[7:0]), 
                	.din0(mux2_req_vec_c6[7:0]),  
		 	.din1(oq_rd_out[7:0]), 
           		.sel0(~mux3_sel_oq_req),  
			.sel1(mux3_sel_oq_req)); 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_1 mux_imiss1_oq_or_pipe 
		( .dout (imiss1_oq_or_pipe), 
                        .din0(imiss1_to_xbar_tmp_c6),  
			.din1(imiss1_rd_out), 
                        .sel0(~mux3_sel_oq_req),  
			.sel1(mux3_sel_oq_req)); 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_1 mux_rdma_oq_or_pipe 
		( .dout (rdma_oq_or_pipe), 
                        .din0(rdma_to_xbar_tmp_c6),  
			.din1(oq_rdma_out), 
                        .sel0(~mux3_sel_oq_req),  
			.sel1(mux3_sel_oq_req)); 
 
assign  imiss2_from_oq = {8{imiss2_rd_out}} & req_to_xbarq_c7 ; 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_8 mux_imiss2_oq_or_pipe 
		( .dout (imiss2_oq_or_pipe[7:0]), 
                  	.din0(imiss2_to_xbar_tmp_c6[7:0]),  
			.din1(imiss2_from_oq[7:0]), 
                  	.sel0(~mux3_sel_oq_req),  
			.sel1(mux3_sel_oq_req)); 
 
 
 
 
////////////////////////// 
// A 2 to 1 mux flop to select 
// either the old request  
// or a new one. 
////////////////////////// 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_8 mux_req_to_xbar_c6 
		( .dout (req_to_xbarq_c6[7:0]), 
                        .din0(req_to_xbarq_c7[7:0]),  
			.din1(mux3_req_vec_c6[7:0]), 
                        .sel0(sel_old_req),  
			.sel1(~sel_old_req)); 
 
l2t_msff_ctl_macro__width_8 ff_xbar_req_c7 
                           (.din(req_to_xbarq_c6[7:0]), .l1clk(l1clk), 
                        .scan_in(ff_xbar_req_c7_scanin),
                        .scan_out(ff_xbar_req_c7_scanout),
                        .dout(req_to_xbarq_c7[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// use a mux flop here 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_1 mux_imiss1_to_xbar_c6 
		( .dout (imiss1_to_xbarq_c6), 
                        .din0(imiss1_to_xbarq_c7),  
			.din1(imiss1_oq_or_pipe), 
                        .sel0(sel_old_req),  
			.sel1(~sel_old_req)); 
 
l2t_msff_ctl_macro__width_1 ff_imiss1_to_xbarq_c7 
                           (.din(imiss1_to_xbarq_c6), .l1clk(l1clk), 
                        .scan_in(ff_imiss1_to_xbarq_c7_scanin),
                        .scan_out(ff_imiss1_to_xbarq_c7_scanout),
                        .dout(imiss1_to_xbarq_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// use a mux flop here 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_1 mux_rdma_to_xbar_c6 
		( .dout (rdma_to_xbarq_c6), 
                        .din0(rdma_to_xbarq_c7),  
			.din1(rdma_oq_or_pipe), 
                        .sel0(sel_old_req),  
			.sel1(~sel_old_req)); 
 
l2t_msff_ctl_macro__width_1 ff_rdma_to_xbarq_c7 
                           (.din(rdma_to_xbarq_c6), .l1clk(l1clk), 
                        .scan_in(ff_rdma_to_xbarq_c7_scanin),
                        .scan_out(ff_rdma_to_xbarq_c7_scanout),
                        .dout(rdma_to_xbarq_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// use a mux flop here 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_8 mux_imiss2_to_xbar_c6 
		( .dout (imiss2_to_xbarq_c6[7:0]), 
                        .din0(imiss2_to_xbarq_c7[7:0]),  
			.din1(imiss2_oq_or_pipe[7:0]), 
                        .sel0(sel_old_req),  
			.sel1(~sel_old_req)); 
 
l2t_msff_ctl_macro__width_8 ff_imiss2_to_xbarq_c7 
                           (.din(imiss2_to_xbarq_c6[7:0]), .l1clk(l1clk), 
                        .scan_in(ff_imiss2_to_xbarq_c7_scanin),
                        .scan_out(ff_imiss2_to_xbarq_c7_scanout),
                        .dout(imiss2_to_xbarq_c7[7:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
/////////////////////////////////////////////////////////////////////////// 
// For TSO it is essential that a multicast request be queued up in all 
// Xbar Qs at the same time. In order for this to happen, a request that  
// is multicast will have to wait for all destination Xbar Qs to be  
// available. 
// 
// The following requests are multicast requests. 
// - eviction requests ( that go to atleast one cpu ). 
// - interrupt broadcasts 
// - store invalidates ( that go to more than one cpu ). 
/////////////////////////////////////////////////////////////////////////// 
 
 
assign  bcast_st_req_c6 = {8{sel_stinv_req_c6}} & ~dec_cpu_c6  ; 
assign  bcast_inval_req_c6  =  {8{sel_inv_vec_c6}}  ; 
 
assign  bcast_req_c6 =  int_bcast_c6 | 
        	(|( ( bcast_st_req_c6 | bcast_inval_req_c6)  
		& dirvec_dirdp_req_vec_c6 ) )  ; 
 
l2t_msff_ctl_macro__width_1 ff_bcast_req_c6 
                           (.din(bcast_req_c6), .l1clk(l1clk), 
               .scan_in(ff_bcast_req_c6_scanin),
               .scan_out(ff_bcast_req_c6_scanout),
               .dout(bcast_req_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_1 mux_bcast_req_pipe 
		(.dout(bcast_req_pipe), 
                                .din0(bcast_req_c7),.din1(bcast_req_c6), 
                                .sel0(sel_c7_req),.sel1(~sel_c7_req)); 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_1 mux_bcast_req_oq_or_pipe 
		( .dout( bcast_req_oq_or_pipe), 
                        .din0(bcast_req_pipe),.din1(oq_bcast_out), 
                        .sel0(~oq_count_nonzero),.sel1(oq_count_nonzero)); 
 
// use a mux flop here 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_1 mux_bcast_to_xbar_c6 
		( .dout (bcast_to_xbar_c6), 
                         .din0(bcast_to_xbar_c7), .din1(bcast_req_oq_or_pipe), 
                         .sel0(sel_old_req), .sel1(~sel_old_req)); 
 
l2t_msff_ctl_macro__width_1 ff_bcast_to_xbar_c7 
                           (.din(bcast_to_xbar_c6), .l1clk(l1clk), 
                        .scan_in(ff_bcast_to_xbar_c7_scanin),
                        .scan_out(ff_bcast_to_xbar_c7_scanout),
                        .dout(bcast_to_xbar_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
//////////////////////// 
// logic for disallowing a request from transmitting. 
// 
// A request that is in the pipe will be gated off   
// if: 
// - xbar is full or  
// - xbar=1 and incrementing in that cycle. 
//  
// Request that has already made it to the output 
// of the request muxes will be gate off if 
// - xbar is full. 
//////////////////////// 
 
 
 
assign  bcast_req_xbarqfull_c6 = ( xbarq_full  
			| ( xbarq_cnt1 & que_in_xbarq_c7 ) ); 
 
 
assign  allow_new_req_bcast = (&( ~mux3_req_vec_c6 |  
				~bcast_req_xbarqfull_c6 )) | 
                                ~bcast_req_oq_or_pipe ; 
 
assign  allow_old_req_bcast =   (&( ~req_to_que_in_xbarq_c7 |  
					~xbarq_full )) | 
                                        ~bcast_to_xbar_c7 ; 
 
 
 
// use a mux flop here 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_1 mux_allow_req_c6 
		( .dout (allow_req_c6), 
                         .din0(allow_old_req_bcast), .din1(allow_new_req_bcast), 
                         .sel0(sel_old_req), .sel1(~sel_old_req)); 
 
// Bug id 98795 
// when vuad ce happens the req to crossbar should be cut off 
// with it's associated logic.
//

assign allow_req_c6_qual = allow_req_c6;

l2t_msff_ctl_macro__width_2 ff_allow_req_c7 
                           (.din({allow_req_c6_qual,misbuf_vuad_ce_err_c6}), .l1clk(l1clk), 
                        .scan_in(ff_allow_req_c7_scanin),
                        .scan_out(ff_allow_req_c7_scanout),
                        .dout({allow_req_c7,misbuf_vuad_ce_err_c7}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign  req_to_que_in_xbarq_c7 = ( req_to_xbarq_c7  | imiss2_to_xbarq_c7)  ; 
 
assign  que_in_xbarq_c7 =   req_to_que_in_xbarq_c7 & {8{allow_req_c7}}; 
 
assign  old_req_vld = |( req_to_que_in_xbarq_c7 & xbarq_full &  
			~cpx_l2t_grant_cx ) | 
                        ~allow_req_c7 ; 
 
assign  sel_old_req = dbb_rst_l & old_req_vld ; 
 
assign l2t_cpx_req_cq_c6[7:0] = (req_to_xbarq_c6 & {8{allow_req_c6}});
assign l2t_cpx_atom_cq_c6 = imiss1_to_xbarq_c6 ;


l2t_msff_ctl_macro__dmsff_32x__width_8 ff_l2t_cpx_req_cq_c7 
	(
	.scan_in(ff_l2t_cpx_req_cq_c7_scanin),
	.scan_out(ff_l2t_cpx_req_cq_c7_scanout),
	.dout	(l2t_cpx_req_cq[7:0]),
	.din	(l2t_cpx_req_cq_c6[7:0]),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

l2t_msff_ctl_macro__dmsff_32x__width_1 ff_l2t_cpx_atom_cq_c7 
        (
        .scan_in(ff_l2t_cpx_atom_cq_c7_scanin),
        .scan_out(ff_l2t_cpx_atom_cq_c7_scanout),
        .dout   (l2t_cpx_atom_cq),
        .din    (l2t_cpx_atom_cq_c6),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


l2t_msff_ctl_macro__width_8 ff_l2t_cpx_req_cq_c7_dup 
        (
        .scan_in(ff_l2t_cpx_req_cq_c7_dup_scanin),
        .scan_out(ff_l2t_cpx_req_cq_c7_dup_scanout),
        .dout   (l2t_cpx_req_cq_dup[7:0]),
        .din    (l2t_cpx_req_cq_c6[7:0]),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

 
 
 
/////////////////////////////////////////////////////////// 
// RQTYP and other signals sent to oque 
// RQTYP is generated using several stages of muxing as follows: 
// 1. mux between st ack and fwd reply 
// 2. mux between ld ret and fwd reply 
// 3. mux between int_ack, imiss_ret and err_ack 
// 4. mux between mux1, mux2 and mux3 outputs and eviction_ret. 
// 5. If an ack is a strm load or strm store ret, then the streaming 
//    bit of the request type is set. 
// 
// The request type logic is performed in C7. 
/////////////////////////////////////////////////////////// 
 
l2t_msff_ctl_macro__width_1 ff_fwd_req_ret_c52 
                           (.din(tag_fwd_req_ret_c5), .l1clk(l1clk), 
                    .scan_in(ff_fwd_req_ret_c52_scanin),
                    .scan_out(ff_fwd_req_ret_c52_scanout),
                    .dout(fwd_req_ret_c52),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_1 ff_fwd_req_ret_c6 
                           (.din(fwd_req_ret_c52), .l1clk(l1clk),
                    .scan_in(ff_fwd_req_ret_c6_scanin),
                    .scan_out(ff_fwd_req_ret_c6_scanout),
                    .dout(fwd_req_ret_c6),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_msff_ctl_macro__width_1 ff_fwd_req_ret_c7 
                           (.din(fwd_req_ret_c6), .l1clk(l1clk), 
                    .scan_in(ff_fwd_req_ret_c7_scanin),
                    .scan_out(ff_fwd_req_ret_c7_scanout),
                    .dout(oqu_fwd_req_ret_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access
l2t_msff_ctl_macro__width_1 ff_int_ack_c52 
                           (.din(tag_int_ack_c5), .l1clk(l1clk),
                    .scan_in(ff_int_ack_c52_scanin),
                    .scan_out(ff_int_ack_c52_scanout),
                    .dout(int_ack_c52),
  .siclk(siclk),
  .soclk(soclk)  
);
 
l2t_msff_ctl_macro__width_1 ff_int_ack_c6 
                           (.din(int_ack_c52), .l1clk(l1clk), 
                    .scan_in(ff_int_ack_c6_scanin),
                    .scan_out(ff_int_ack_c6_scanout),
                    .dout(int_ack_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_int_ack_c7 
                           (.din(int_ack_c6), .l1clk(l1clk), 
                    .scan_in(ff_int_ack_c7_scanin),
                    .scan_out(ff_int_ack_c7_scanout),
                    .dout(int_ack_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	oqu_int_ack_c7 = int_ack_c7; 

// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_1 ff_ld_hit_c52 
                           (.din(tag_ld_hit_c5), .l1clk(l1clk),
                    .scan_in(ff_ld_hit_c52_scanin),
                    .scan_out(ff_ld_hit_c52_scanout),
                    .dout(ld_hit_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_msff_ctl_macro__width_1 ff_ld_hit_c6 
                           (.din(ld_hit_c52), .l1clk(l1clk), 
                    .scan_in(ff_ld_hit_c6_scanin),
                    .scan_out(ff_ld_hit_c6_scanout),
                    .dout(ld_hit_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_ld_hit_c7 
                           (.din(ld_hit_c6), .l1clk(l1clk), 
                    .scan_in(ff_ld_hit_c7_scanin),
                    .scan_out(ff_ld_hit_c7_scanout),
                    .dout(ld_hit_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_1 ff_st_req_c52 
                           (.din(tag_st_req_c5), .l1clk(l1clk),
                    .scan_in(ff_st_req_c52_scanin),
                    .scan_out(ff_st_req_c52_scanout),
                    .dout(st_req_c52),
  .siclk(siclk),
  .soclk(soclk)  
);
 
l2t_msff_ctl_macro__width_1 ff_st_req_c6 
                           (.din(st_req_c52), .l1clk(l1clk), 
                    .scan_in(ff_st_req_c6_scanin),
                    .scan_out(ff_st_req_c6_scanout),
                    .dout(st_req_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_st_req_c7 
                           (.din(st_req_c6), .l1clk(l1clk), 
                    .scan_in(ff_st_req_c7_scanin),
                    .scan_out(ff_st_req_c7_scanout),
                    .dout(st_req_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS and SR 11/12/03 N2 Xbar Packet format change :

// BS 03/11/04 extra cycle for mem access
l2t_msff_ctl_macro__width_1 ff_inval_req_c52 
                           (.din(tag_inval_req_c5), .l1clk(l1clk),
                    .scan_in(ff_inval_req_c52_scanin),
                    .scan_out(ff_inval_req_c52_scanout),
                    .dout(inval_req_c52),
  .siclk(siclk),
  .soclk(soclk)  
);


l2t_msff_ctl_macro__width_1 ff_inval_req_c6 
                           (.din(inval_req_c52), .l1clk(l1clk),
                    .scan_in(ff_inval_req_c6_scanin),
                    .scan_out(ff_inval_req_c6_scanout),
                    .dout(inval_req_c6),
  .siclk(siclk),
  .soclk(soclk)  
);

l2t_msff_ctl_macro__width_1 ff_inval_req_c7 
                           (.din(inval_req_c6), .l1clk(l1clk),
                    .scan_in(ff_inval_req_c7_scanin),
                    .scan_out(ff_inval_req_c7_scanout),
                    .dout(inval_req_c7),
  .siclk(siclk),
  .soclk(soclk)  
);

// BS 03/11/04 extra cycle for mem access
l2t_msff_ctl_macro__width_1 ff_strst_ack_c52 
                           (.din(tag_strst_ack_c5), .l1clk(l1clk),
                    .scan_in(ff_strst_ack_c52_scanin),
                    .scan_out(ff_strst_ack_c52_scanout),
                    .dout(strst_ack_c52),
  .siclk(siclk),
  .soclk(soclk)  
);
 
l2t_msff_ctl_macro__width_1 ff_strst_ack_c6 
                           (.din(strst_ack_c52), .l1clk(l1clk), 
                    .scan_in(ff_strst_ack_c6_scanin),
                    .scan_out(ff_strst_ack_c6_scanout),
                    .dout(strst_ack_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_strst_ack_c7 
                           (.din(strst_ack_c6), .l1clk(l1clk), 
                    .scan_in(ff_strst_ack_c7_scanin),
                    .scan_out(ff_strst_ack_c7_scanout),
                    .dout(oqu_strst_ack_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
// RMO store ACK. 
// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_1 ff_rmo_st_c52 
                           (.din(tag_rmo_st_ack_c5), .l1clk(l1clk),
                    .scan_in(ff_rmo_st_c52_scanin),
                    .scan_out(ff_rmo_st_c52_scanout),
                    .dout(rmo_st_c52),
  .siclk(siclk),
  .soclk(soclk)  
);
 
l2t_msff_ctl_macro__width_1 ff_rmo_st_c6 
                           (.din(rmo_st_c52), .l1clk(l1clk), 
                    .scan_in(ff_rmo_st_c6_scanin),
                    .scan_out(ff_rmo_st_c6_scanout),
                    .dout(rmo_st_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_rmo_st_c7 
                           (.din(rmo_st_c6), .l1clk(l1clk), 
                    .scan_in(ff_rmo_st_c7_scanin),
                    .scan_out(ff_rmo_st_c7_scanout),
                    .dout(rmo_st_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	oqu_rmo_st_c7 = rmo_st_c7 ; 
 
 
 
l2t_msff_ctl_macro__width_1 ff_sel_inv_vec_c7 
                           (.din(sel_inv_vec_c6), .l1clk(l1clk), 
                    .scan_in(ff_sel_inv_vec_c7_scanin),
                    .scan_out(ff_sel_inv_vec_c7_scanout),
                    .dout(sel_evict_vec_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_1 ff_uerr_ack_c52 
                           (.din(tag_uerr_ack_c5), .l1clk(l1clk),
                    .scan_in(ff_uerr_ack_c52_scanin),
                    .scan_out(ff_uerr_ack_c52_scanout),
                    .dout(uerr_ack_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_msff_ctl_macro__width_1 ff_uerr_ack_c6 
                           (.din(uerr_ack_c52), .l1clk(l1clk), 
                    .scan_in(ff_uerr_ack_c6_scanin),
                    .scan_out(ff_uerr_ack_c6_scanout),
                    .dout(uerr_ack_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_uerr_ack_c7 
                           (.din(uerr_ack_c6), .l1clk(l1clk), 
                    .scan_in(ff_uerr_ack_c7_scanin),
                    .scan_out(ff_uerr_ack_c7_scanout),
                    .dout(uerr_ack_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	oqu_uerr_ack_c7 = uerr_ack_c7 ; 

// BS 03/11/04 extra cycle for mem access
l2t_msff_ctl_macro__width_1 ff_st_ack_c52 
                           (.din(tag_st_ack_c5), .l1clk(l1clk),
                    .scan_in(ff_st_ack_c52_scanin),
                    .scan_out(ff_st_ack_c52_scanout),
                    .dout(st_ack_c52),
  .siclk(siclk),
  .soclk(soclk)  
);
 
l2t_msff_ctl_macro__width_1 ff_st_ack_c6 
                           (.din(st_ack_c52), .l1clk(l1clk), 
                    .scan_in(ff_st_ack_c6_scanin),
                    .scan_out(ff_st_ack_c6_scanout),
                    .dout(st_ack_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_st_ack_c7 
                           (.din(st_ack_c6), .l1clk(l1clk), 
                    .scan_in(ff_st_ack_c7_scanin),
                    .scan_out(ff_st_ack_c7_scanout),
                    .dout(st_ack_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_1 ff_cerr_ack_c52 
                           (.din(tag_cerr_ack_c5), .l1clk(l1clk),
                    .scan_in(ff_cerr_ack_c52_scanin),
                    .scan_out(ff_cerr_ack_c52_scanout),
                    .dout(cerr_ack_c52),
  .siclk(siclk),
  .soclk(soclk)  
);
 
 
l2t_msff_ctl_macro__width_1 ff_cerr_ack_c6 
                           (.din(cerr_ack_c52), .l1clk(l1clk), 
                    .scan_in(ff_cerr_ack_c6_scanin),
                    .scan_out(ff_cerr_ack_c6_scanout),
                    .dout(cerr_ack_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_cerr_ack_c7 
                           (.din(cerr_ack_c6), .l1clk(l1clk), 
                    .scan_in(ff_cerr_ack_c7_scanin),
                    .scan_out(ff_cerr_ack_c7_scanout),
                    .dout(cerr_ack_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	oqu_cerr_ack_c7 = cerr_ack_c7 ; 
 
l2t_msff_ctl_macro__width_1 ff_strld_inst_c7 
                           (.din(arb_decdp_strld_inst_c6), .l1clk(l1clk), 
                    .scan_in(ff_strld_inst_c7_scanin),
                    .scan_out(ff_strld_inst_c7_scanout),
                    .dout(strld_inst_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS and SR 11/12/03 N2 Xbar Packet format change :
l2t_msff_ctl_macro__width_1 ff_mmuld_inst_c7 
                           (.din(arb_decdp_mmuld_inst_c6), .l1clk(l1clk),
                    .scan_in(ff_mmuld_inst_c7_scanin),
                    .scan_out(ff_mmuld_inst_c7_scanout),
                    .dout(mmuld_inst_c7),
  .siclk(siclk),
  .soclk(soclk)  
);


 
l2t_msff_ctl_macro__width_1 ff_atm_inst_c7 
                           (.din(arb_decdp_atm_inst_c6), .l1clk(l1clk), 
                    .scan_in(ff_atm_inst_c7_scanin),
                    .scan_out(ff_atm_inst_c7_scanout),
                    .dout(atm_inst_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
//////////////////////////////////////////////////////// 
// L2 miss is reported for LDs, IMIsses(1st pckt only ) 
// and stores. In all these cases, a miss is reported 
// - if the instruction is issued from the miss Buffer 
// - or if a st ack is sent for an instruction missing the 
// L2. 
//////////////////////////////////////////////////////// 
 
assign	l2_miss_c5 =  (tag_inst_mb_c5 &  
			( tag_st_ack_c5 |  
			tag_ld_hit_c5 | 
			tag_imiss_hit_c5 )) | 
			( ~tag_hit_c5 &  
			  tag_st_ack_c5 ); 
			 
// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_1 ff_l2_miss_c52 
                           (.din(l2_miss_c5), .l1clk(l1clk),
                    .scan_in(ff_l2_miss_c52_scanin),
                    .scan_out(ff_l2_miss_c52_scanout),
                    .dout(l2_miss_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_msff_ctl_macro__width_1 ff_l2_miss_c6 
                           (.din(l2_miss_c52), .l1clk(l1clk), 
                    .scan_in(ff_l2_miss_c6_scanin),
                    .scan_out(ff_l2_miss_c6_scanout),
                    .dout(l2_miss_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_l2_miss_c7 
                           (.din(l2_miss_c6), .l1clk(l1clk), 
                    .scan_in(ff_l2_miss_c7_scanin),
                    .scan_out(ff_l2_miss_c7_scanout),
                    .dout(l2_miss_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	oqu_l2_miss_c7 = l2_miss_c7 & ~(oqu_rqtyp_rtn_c7==4'hc); 
 
///////////////////////////////////////// 
// A prefetch instruction has a "LOAD" 
// opcode . Used to set bit 128 of the CPX 
// packet  
///////////////////////////////////////// 

// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_1 ff_pf_inst_c52 
                           (.din(arb_decdp_pf_inst_c5), .l1clk(l1clk),
                    .scan_in(ff_pf_inst_c52_scanin),
                    .scan_out(ff_pf_inst_c52_scanout),
                    .dout(pf_inst_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_msff_ctl_macro__width_1 ff_pf_inst_c6 
                           (.din(pf_inst_c52), .l1clk(l1clk), 
                    .scan_in(ff_pf_inst_c6_scanin),
                    .scan_out(ff_pf_inst_c6_scanout),
                    .dout(pf_inst_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_pf_inst_c7 
                           (.din(pf_inst_c6), .l1clk(l1clk), 
                    .scan_in(ff_pf_inst_c7_scanin),
                    .scan_out(ff_pf_inst_c7_scanout),
                    .dout(pf_inst_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	 oqu_pf_ack_c7 = pf_inst_c7 & ld_hit_c7 ; 
 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_load_ret 
		( .dout (load_ret[3:0]), 
                        .din0(`LOAD_RET),  
			.din1(`FWD_RPY_RET), 
                        .sel0(~oqu_fwd_req_ret_c7),  
			.sel1(oqu_fwd_req_ret_c7)); 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_stack_ret 
		( .dout (stack_ret[3:0]), 
                        .din0(`ST_ACK),  
			.din1(`FWD_RPY_RET), 
                        .sel0(~oqu_fwd_req_ret_c7),  
			.sel1(oqu_fwd_req_ret_c7)); 
 
 
assign	imiss_req_sel_c7 = imiss1_out_c7 | imiss1_out_c8 ; 
assign	err_req_sel_c7 = ( ~imiss_req_sel_c7 & ~int_ack_c7 ); 
assign	int_req_sel_c7 =  int_ack_c7 & ~imiss_req_sel_c7 ; 
 
l2t_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_imiss_err_or_intreq_c7  
		( .dout (imiss_err_or_int_rqtyp_c7[3:0]), 
                          	.din0(`IFILL_RET),  
				.din1(`INT_RET), 
                          	.din2(`ERR_RET), 
                          	.sel0(imiss_req_sel_c7),  
				.sel1(int_req_sel_c7), 
                          	.sel2(err_req_sel_c7)); 

// BS,SR  12/07/04 : taking out arb_swap_cas2_req_c2 to l2t_oqu_ctl.sv to disable ERROR
// Indication packet on a CE,UE, or Notdata on the store part of the swap or CAS2.
// Instead , regular store ack packet will get sent.

l2t_msff_ctl_macro__width_6 ff_arb_oqu_swap_cas2_req 
                           (.din({arb_oqu_swap_cas2_req_c2,arb_oqu_swap_cas2_req_c3,
                                  arb_oqu_swap_cas2_req_c4,arb_oqu_swap_cas2_req_c5,
                                  arb_oqu_swap_cas2_req_c52,arb_oqu_swap_cas2_req_c6}), .l1clk(l1clk),
                    .scan_in(ff_arb_oqu_swap_cas2_req_scanin),
                    .scan_out(ff_arb_oqu_swap_cas2_req_scanout),
                    .dout({arb_oqu_swap_cas2_req_c3,arb_oqu_swap_cas2_req_c4,
                                  arb_oqu_swap_cas2_req_c5,arb_oqu_swap_cas2_req_c52,
                                  arb_oqu_swap_cas2_req_c6,arb_oqu_swap_cas2_req_c7}),
  .siclk(siclk),
  .soclk(soclk)
);

assign  imiss_err_or_int_sel_c7 = ( imiss_req_sel_c7 | int_ack_c7 |
                                (((uerr_ack_c7 | cerr_ack_c7) & ~ld_hit_c7) & ~arb_oqu_swap_cas2_req_c7)) &
                                ~sel_evict_vec_c7 ; // no eviction

 
assign	sel_st_ack_c7 = ( st_req_c7 | oqu_strst_ack_c7 ) &  
			~imiss_err_or_int_sel_c7  
			& ~sel_evict_vec_c7 ; 

// BS and SR 11/12/03 N2 Xbar Packet format change
assign sel_inval_ack_c7 = inval_req_c7 & ~imiss_err_or_int_sel_c7 & ~sel_evict_vec_c7 ;
 
assign	sel_ld_ret_c7 = ~imiss_err_or_int_sel_c7 & ~sel_st_ack_c7 & ~sel_inval_ack_c7 & 
			~sel_evict_vec_c7 ; 

// BS 2/3/04 : During I$ or D$ INval ACk, sel_st_ack_c7 is also valid as st_ack_c3 gets asserted
// when inval_inst_c3 is true
// Hence to propagate INVAL_ACK , we need to disable sel_st_ack_c7 with sel_inval_ack_c7
// when driven as muxsel to mux_req_type_c7

assign sel_st_ack_true_c7 = sel_st_ack_c7 & ~sel_inval_ack_c7; // valid only if sel_inval_ack_c7 = 1'b0 
 
l2t_mux_ctl_macro__mux_aonpe__ports_4__width_4 mux_req_type_c7  // BS and SR 11/12/03 N2 Xbar Packet format change
		( .dout (rqtyp_rtn_c7_tmp[3:0]), 
                        .din0(load_ret[3:0]), 	// load return 
			.din1(stack_ret[3:0]),	// store ack return 
                        .din2(`EVICT_REQ), // evict req 
			.din3(`INVAL_ACK), // I$ or D$ Inval ack
                        .sel0(sel_ld_ret_c7), 	 
			.sel1(sel_st_ack_true_c7), // BS 2/3/04 
                        .sel2(sel_evict_vec_c7),  
			.sel3(sel_inval_ack_c7)); 

l2t_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_req_type_fnl_c7  // BS and SR 11/12/03 N2 Xbar Packet format change
                ( .dout (rqtyp_rtn_c7[3:0]),
                        .din0(rqtyp_rtn_c7_tmp[3:0]),   // load return
                        .din1(imiss_err_or_int_rqtyp_c7[3:0]), //imiss err or int
                        .sel0(~imiss_err_or_int_sel_c7),
                        .sel1(imiss_err_or_int_sel_c7));

 
 
assign	oqu_str_ld_hit_c7 = strld_inst_c7 & ld_hit_c7 ; 
assign  oqu_mmu_ld_hit_c7 = mmuld_inst_c7 & ld_hit_c7 ; // BS and SR 11/12/03 N2 Xbar Packet format change
 
assign  oqu_rqtyp_rtn_c7[3] = rqtyp_rtn_c7[3] ; 
assign  oqu_rqtyp_rtn_c7[2] = rqtyp_rtn_c7[2]  | oqu_mmu_ld_hit_c7; // BS and SR 11/12/03 N2 Xbar Packet format change 
assign  oqu_rqtyp_rtn_c7[1] = rqtyp_rtn_c7[1] | oqu_str_ld_hit_c7 | oqu_strst_ack_c7 ; 
assign  oqu_rqtyp_rtn_c7[0] = rqtyp_rtn_c7[0]  | oqu_mmu_ld_hit_c7;  // BS and SR 11/12/03 N2 Xbar Packet format change
 
 
assign	oqu_atm_inst_ack_c7 =  ( atm_inst_c7 & ( ld_hit_c7 | st_ack_c7 ) ) |  
				imiss1_out_c8 ; 
 
 
 
 
 
 
 
//////////////////////////////////////////////////////////////////// 
// Oq counter:  The Oq counter  is a C9 flop. However, the  
// full signal is generated in C8 using the previous value 
// of the counter. The full signal is asserted when the  
// counter is 7 or higher. THis means that instructions 
// PX2-C8 can be accomodated in the OQ. Here re the pipelines 
// for incrementing and decrementing OQ count. 
//----------------------------------------------------------------- 
//	#1(C7)			#2(C8)		#3		#4 
//----------------------------------------------------------------- 
//	 
//	if the C7 req  
//	is still vld 
//	AND ((oq_count!=0 )	inc counter.  
//	 OR old_req_vld ). 
// 
//	setup wline for		wr_Data into 
//	oqarray write.		oqarray 
// 
//	setup wline for 
//	req Q write. 
//	 
//	req Q write. 
//----------------------------------------------------------------- 
//	#1			#2			#3 
//----------------------------------------------------------------- 
//  	inc rd pointer 
//	if ~oldreq		dec counter		send to CPX 
//	and if oq_count 
//	non_zero		rd data 
//				from array 
//	setup wline 
//	for reading next 
//	entry.(earliest 
//	issue out of 
//	OQ is in C10) 
// 
//////////////////////////////////////////////////////////////////// 
 
 
//////////////////// 
// Wr Pointer 
//////////////////// 
 
 
assign  inc_wr_ptr = sel_c7_req  
		& (oq_count_nonzero | old_req_vld) ; 
 
// use a big flop that has a fanout of 16 so that the  
// output of the flop can be used directly to mux out 
// the wr ptr 
l2t_msff_ctl_macro__clr_1__width_1 ff_inc_wr_ptr_d1  // sync reset active low
                           (.din(inc_wr_ptr), .l1clk(l1clk), 
		  .scan_in(ff_inc_wr_ptr_d1_scanin),
		  .scan_out(ff_inc_wr_ptr_d1_scanout),
		  .clr(~dbb_rst_l), 
                  .dout(inc_wr_ptr_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__clr_1__width_1 ff_inc_wr_ptr_d1_1  // sync reset active low
                           (.din(inc_wr_ptr), .l1clk(l1clk), 
		  .scan_in(ff_inc_wr_ptr_d1_1_scanin),
		  .scan_out(ff_inc_wr_ptr_d1_1_scanout),
		  .clr(~dbb_rst_l), 
                  .dout(inc_wr_ptr_d1_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__clr_1__width_1 ff_inc_wr_ptr_d1_2  // sync reset active low
                           (.din(inc_wr_ptr), .l1clk(l1clk), 
		  .scan_in(ff_inc_wr_ptr_d1_2_scanin),
		  .scan_out(ff_inc_wr_ptr_d1_2_scanout),
		  .clr(~dbb_rst_l), 
                  .dout(inc_wr_ptr_d1_2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 

l2t_msff_ctl_macro__width_1 ff_l2t_mb0_run_r1 
                           (.din(l2t_mb0_run), .l1clk(l1clk),  
		.scan_in(ff_l2t_mb0_run_r1_scanin),
		.scan_out(ff_l2t_mb0_run_r1_scanout),
		.dout(l2t_mb0_run_r1),
  .siclk(siclk),
  .soclk(soclk)  
); 
assign  oqu_oqarray_wr_en = ~l2t_mb0_run_r1 ? inc_wr_ptr_d1 : l2t_mb0_oqarray_wr_en ; // wen for array write 
 
assign	wr_word_line  = wr_ptr & {16{~wr_wl_disable}} ; // wline for req Q write. 
 
assign  enc_wr_ptr[0] = ( wr_ptr[1] | wr_ptr[3] | wr_ptr[5] | 
                         wr_ptr[7] | wr_ptr[9] | wr_ptr[11] | 
                         wr_ptr[13] | wr_ptr[15] ) ; 
 
assign  enc_wr_ptr[1] = ( wr_ptr[2] | wr_ptr[3] | wr_ptr[6] | 
                          wr_ptr[7] | wr_ptr[10] | wr_ptr[11] | 
                          wr_ptr[14] | wr_ptr[15] ) ; 
 
assign  enc_wr_ptr[2] = ( wr_ptr[4] | wr_ptr[5] | wr_ptr[6] | 
                          wr_ptr[7] | wr_ptr[12] | wr_ptr[13] | 
                          wr_ptr[14] | wr_ptr[15] ) ; 
 
assign  enc_wr_ptr[3] = ( wr_ptr[8] | wr_ptr[9] | wr_ptr[10] | 
                          wr_ptr[11] | wr_ptr[12] | wr_ptr[13] | 
                          wr_ptr[14] | wr_ptr[15] ) ; 
 
l2t_msff_ctl_macro__width_4 ff_enc_wr_ptr_d1 
                           (.din(enc_wr_ptr[3:0]), .l1clk(l1clk), 
                  .scan_in(ff_enc_wr_ptr_d1_scanin),
                  .scan_out(ff_enc_wr_ptr_d1_scanout),
                  .dout(enc_wr_ptr_d1[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 
 
assign  oqu_oqarray_wr_ptr  = ~l2t_mb0_run_r1 ? enc_wr_ptr_d1 : l2t_mb0_addr; // write wline for array 
 
 
assign  wr_ptr_lsby1 = { wr_ptr_d1[14:0], wr_ptr_d1[15] } ; 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_16 mux_wr_ptr 
		( .dout (wr_ptr[15:0]), // used for FIFO write 
                        .din0(wr_ptr_lsby1[15:0]), // advanced 
			.din1(wr_ptr_d1[15:0]), // same 
                        .sel0(inc_wr_ptr_d1_1),  // sel advance 
			.sel1(~inc_wr_ptr_d1_1)); 
 
 
l2t_msff_ctl_macro__clr_1__width_15 ff_wr_ptr15to1_d1  // sync reset active low
                           (.din(wr_ptr[15:1]), .l1clk(l1clk), 
        .scan_in(ff_wr_ptr15to1_d1_scanin),
        .scan_out(ff_wr_ptr15to1_d1_scanout),
        .clr(~dbb_rst_l), .dout(wr_ptr_d1[15:1]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	wr_ptr0_n = ~wr_ptr[0]; 
 
l2t_msff_ctl_macro__clr_1__width_1 ff_wr_ptr0_d1  // sync reset active low
                           (.din(wr_ptr0_n), .l1clk(l1clk), 
        .scan_in(ff_wr_ptr0_d1_scanin),
        .scan_out(ff_wr_ptr0_d1_scanout),
        .clr(~dbb_rst_l), .dout(wr_ptr0_n_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	wr_ptr_d1[0] = ~wr_ptr0_n_d1; 
 
//////////////////// 
// Rd Pointer 
//////////////////// 
 
assign  inc_rd_ptr = oq_count_nonzero & ~old_req_vld ; 
 
l2t_msff_ctl_macro__clr_1__width_1 ff_inc_rd_ptr_d1  // sync reset active low
                           (.din(inc_rd_ptr), .l1clk(l1clk), 
		 .scan_in(ff_inc_rd_ptr_d1_scanin),
		 .scan_out(ff_inc_rd_ptr_d1_scanout),
		 .clr(~dbb_rst_l), 
                 .dout(inc_rd_ptr_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__clr_1__width_1 ff_inc_rd_ptr_d1_1  // sync reset active low
                           (.din(inc_rd_ptr), .l1clk(l1clk), 
		 .scan_in(ff_inc_rd_ptr_d1_1_scanin),
		 .scan_out(ff_inc_rd_ptr_d1_1_scanout),
		 .clr(~dbb_rst_l), 
                 .dout(inc_rd_ptr_d1_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__clr_1__width_1 ff_inc_rd_ptr_d1_2  // sync reset active low
                           (.din(inc_rd_ptr), .l1clk(l1clk), 
		 .scan_in(ff_inc_rd_ptr_d1_2_scanin),
		 .scan_out(ff_inc_rd_ptr_d1_2_scanout),
		 .clr(~dbb_rst_l), 
                 .dout(inc_rd_ptr_d1_2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 
assign  oqu_oqarray_rd_en =  ~l2t_mb0_run_r1 ? oq_count_nonzero : l2t_mb0_oqarray_rd_en ; // array rd enable 
 
 
assign	rd_word_line    =  rd_ptr ; // wline for req Q read 
 
 
assign  enc_rd_ptr[0] = ( rd_ptr[1] | rd_ptr[3] | rd_ptr[5] | 
                          rd_ptr[7] | rd_ptr[9] | rd_ptr[11] | 
                          rd_ptr[13] | rd_ptr[15] ) ; 
 
assign  enc_rd_ptr[1] = ( rd_ptr[2] | rd_ptr[3] | rd_ptr[6] | 
                          rd_ptr[7] | rd_ptr[10] | rd_ptr[11] | 
                          rd_ptr[14] | rd_ptr[15] ) ; 
 
assign  enc_rd_ptr[2] = ( rd_ptr[4] | rd_ptr[5] | rd_ptr[6] | 
                          rd_ptr[7] | rd_ptr[12] | rd_ptr[13] | 
                          rd_ptr[14] | rd_ptr[15] ) ; 
 
assign  enc_rd_ptr[3] = ( rd_ptr[8] | rd_ptr[9] | rd_ptr[10] | 
                          rd_ptr[11] | rd_ptr[12] | rd_ptr[13] | 
                          rd_ptr[14] | rd_ptr[15] ) ; 
 
assign  oqu_oqarray_rd_ptr = ~l2t_mb0_run_r1 ? enc_rd_ptr : l2t_mb0_addr; // ph1 read  
 
assign  rd_ptr_lsby1 = { rd_ptr_d1[14:0], rd_ptr_d1[15] } ; 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_16 mux_rd_ptr 
		( .dout (rd_ptr[15:0]), 
                    	.din0(rd_ptr_lsby1[15:0]),  
			.din1(rd_ptr_d1[15:0]), 
                        .sel0(inc_rd_ptr_d1_1),  
			.sel1(~inc_rd_ptr_d1_1)); 
 
l2t_msff_ctl_macro__clr_1__width_15 ff_rd_ptr15to1_d1  // sync reset active low
                           (.din(rd_ptr[15:1]), .l1clk(l1clk), 
        .scan_in(ff_rd_ptr15to1_d1_scanin),
        .scan_out(ff_rd_ptr15to1_d1_scanout),
        .clr(~dbb_rst_l), .dout(rd_ptr_d1[15:1]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	rd_ptr0_n = ~rd_ptr[0] ; 
 
l2t_msff_ctl_macro__clr_1__width_1 ff_rd_ptr0_d1  // sync reset active low
                           (.din(rd_ptr0_n), .l1clk(l1clk), 
        .scan_in(ff_rd_ptr0_d1_scanin),
        .scan_out(ff_rd_ptr0_d1_scanout),
        .clr(~dbb_rst_l), .dout(rd_ptr0_n_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	rd_ptr_d1[0] = ~rd_ptr0_n_d1; 
 
////////////////// 
// What If???? 
// Wrptr == Rdptr. 
// If the Wr ptr is equal t th eread ptr. 
// the array read data is not going to  
// be  correct. In this case, the  
// write data needs to be forwarded to 
// the rd data. 
////////////////// 
l2t_msff_ctl_macro__width_4 ff_enc_wr_ptr_d2 
                           (.din(enc_wr_ptr_d1[3:0]), .l1clk(l1clk), 
                  .scan_in(ff_enc_wr_ptr_d2_scanin),
                  .scan_out(ff_enc_wr_ptr_d2_scanout),
                  .dout(enc_wr_ptr_d2[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_4 ff_enc_rd_ptr_d1 
                           (.din(enc_rd_ptr[3:0]), .l1clk(l1clk), 
                  .scan_in(ff_enc_rd_ptr_d1_scanin),
                  .scan_out(ff_enc_rd_ptr_d1_scanout),
                  .dout(enc_rd_ptr_d1[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_inc_wr_ptr_d2 
                           (.din(inc_wr_ptr_d1), .l1clk(l1clk), 
                  .scan_in(ff_inc_wr_ptr_d2_scanin),
                  .scan_out(ff_inc_wr_ptr_d2_scanout),
                  .dout(inc_wr_ptr_d2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
// Int 5.0 changes
//////---\/ FIx for macrotest \/---------

 
assign	oqu_sel_array_out_l = (( enc_wr_ptr_d2 == enc_rd_ptr_d1 )  & 
				inc_wr_ptr_d2  & 	// WR 
				oq_count_nonzero_d1);  // RD 
 
// int 5.0 changes
//////////////////
// OQ counter.
// assert full when 5 or greater.
//
// Bug#4503. The oqcount full assumption is
// wrong. Here is why 
// Currently we assert oq_count_full when the
// counter is 7.
// The case that will cause the worst case skid
// and break the above assumption is as follows.
//-------------------------------------
// cycle #X             cycle #X+1
//-------------------------------------
//
// C8 (~stall if                C9(cnt=5)
//     cnt <= 5)
// C7                   C8(6)
// C6                   C7(7)
// C52                  C6(8)
// C5                   C52(9)                  
// C4                   C5(10)
// C3                   C4(11)
// C2                   C3(12)
// C1                   C2(13)
// PX2                  C1(14 and 15)
// PX1                  PX2(16 and 17)
//
//-------------------------------------
// The C1 instruction could be an imiss. that requires 2 slots in the IQ.
// Similarly, the PX2 instruction could be an IMISS/CAS that requires 2 slots.
// This would put the counter at 17. Hence the oq counter full needs to be asserted 
// at 5 or more
//////////////////

 
 
assign  sel_count_inc = inc_wr_ptr_d1_2 & ~inc_rd_ptr_d1_2; 
assign  sel_count_dec = ~inc_wr_ptr_d1 & inc_rd_ptr_d1 ; 
assign  sel_count_def = ~( sel_count_inc | sel_count_dec ) ; 
 
assign  oq_count_plus_1 =  (oq_count_p + 5'b1 )  ; 
assign  oq_count_minus_1 = ( oq_count_p - 5'b1 ) ; 
assign  oq_count_reset_p = ( oq_count_p ); 
 
l2t_msff_ctl_macro__clr_1__width_5 ff_oq_cnt_d1  // sync reset active low
                           (.din(oq_count_reset_p[4:0]), .l1clk(l1clk), 
                  .scan_in(ff_oq_cnt_d1_scanin),
                  .scan_out(ff_oq_cnt_d1_scanout),
                  .clr(~dbb_rst_l),.dout(oq_count_d1[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_5 ff_oq_cnt_plus1_d1 
                           (.din(oq_count_plus_1[4:0]), .l1clk(l1clk), 
                  .scan_in(ff_oq_cnt_plus1_d1_scanin),
                  .scan_out(ff_oq_cnt_plus1_d1_scanout),
                  .dout(oq_count_plus_1_d1[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_5 ff_oq_cnt_minus1_d1 
                           (.din(oq_count_minus_1[4:0]), .l1clk(l1clk), 
                  .scan_in(ff_oq_cnt_minus1_d1_scanin),
                  .scan_out(ff_oq_cnt_minus1_d1_scanout),
                  .dout(oq_count_minus_1_d1[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_mux_ctl_macro__mux_aonpe__ports_3__width_5 mux_oq_count  
		( .dout (oq_count_p[4:0]), 
                        .din0(oq_count_d1[4:0]),  
			.din1(oq_count_minus_1_d1[4:0]), 
                        .din2(oq_count_plus_1_d1[4:0]), 
                        .sel0(sel_count_def),  
			.sel1(sel_count_dec), 
                        .sel2(sel_count_inc)); 
 
assign  oq_count_nonzero = |( oq_count_p) ;  
 
// Read bug report for Bug # 3352. 
// Funtionality to turn OFF the wr_wordline when the  
// counter is at 16 or is going to reach 16 . Since the  
// wr pointer advances with every write, we need to prevent 
// a write when the counter is 16 and the pointer has wrapped 
// around.  
// Here is pipeline. 
//-------------------------------------------------------- 
// 	X		X+1		X+2 
//-------------------------------------------------------- 
// 1)	cnt_p==15	insert=1	 
//			delete=0 
//			cnt_p=16	 
// 	wr_wline!=0	wr_wline=0;	 
// 
// 2)	cnt_p==16	if delete=0 
//	wr_wline==0	wr_wline=0; 
// 
//			if delete=1 
//			wr_wline!=0; 
//-------------------------------------------------------- 
 
assign	oq_count_15_p = ( oq_count_p == 5'hf ) ; 
 
l2t_msff_ctl_macro__width_1 ff_oq_count_15_d1 
                           (.din(oq_count_15_p), .l1clk(l1clk), 
                  .scan_in(ff_oq_count_15_d1_scanin),
                  .scan_out(ff_oq_count_15_d1_scanout),
                  .dout(oq_count_15_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	oq_count_16_p = ( oq_count_p == 5'h10 ) ; 
 
l2t_msff_ctl_macro__width_1 ff_oq_count_16_d1 
                           (.din(oq_count_16_p), .l1clk(l1clk), 
                  .scan_in(ff_oq_count_16_d1_scanin),
                  .scan_out(ff_oq_count_16_d1_scanout),
                  .dout(oq_count_16_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	wr_wl_disable = ( ( oq_count_15_d1 & sel_count_inc ) | 
			( oq_count_16_d1 & ~sel_count_dec ) ) ; 
 
assign	oqu_full_px1 = ( oq_count_p[2] & oq_count_p[1]) | // int 5.0 changes
                       ( oq_count_p[2] & ~oq_count_p[1] & oq_count_p[0]) | // count = 5 , BS 04/22/04 
			 ( oq_count_p[3] ) | 
			 ( oq_count_p[4] ) ; 
 
l2t_msff_ctl_macro__width_1 ff_oqu_arb_full_px2 
                           (.din(oqu_full_px1), .l1clk(l1clk), 
                  .scan_in(ff_oqu_arb_full_px2_scanin),
                  .scan_out(ff_oqu_arb_full_px2_scanout),
                  .dout(oqu_arb_full_px2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
//////////////////////////////////////////////////////////////////// 
// Oqdp mux select generation: 
//////////////////////////////////////////////////////////////////// 
 
l2t_msff_ctl_macro__width_1 ff_oq_count_nonzero_d1 
                           (.din(oq_count_nonzero), .l1clk(l1clk), 
                              .scan_in(ff_oq_count_nonzero_d1_scanin),
                              .scan_out(ff_oq_count_nonzero_d1_scanout),
                              .dout(oq_count_nonzero_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_old_req_vld_d1 
                           (.din(old_req_vld), .l1clk(l1clk), 
                              .scan_in(ff_old_req_vld_d1_scanin),
                              .scan_out(ff_old_req_vld_d1_scanout),
                              .dout(old_req_vld_d1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign  oqu_sel_inval_c6 = ( sel_inv_vec_c6 | sel_stinv_req_c6  | int_ack_c6 | 
                                mux1_sel_dec_vec_c7  )  ; 
 
assign  oqu_sel_old_req_c7  = old_req_vld_d1 ; 
 
assign  oqu_sel_oq_c7 = inc_rd_ptr_d1 ; 
 
assign  oqu_prev_data_c7 = sel_c7_req_d1 & ~old_req_vld_d1 &  
			~oq_count_nonzero_d1 ; 
 
 
 
/////////////////////////////////////////////////////////////////////////////////// 
// OQ request Q 
/////////////////////////////////////////////////////////////////////////////////// 
 
l2t_msff_ctl_macro__en_1__width_12 ff_oq0_out 
                           (.din({rdma_inv_c7,bcast_req_c7,req_out_c7[7:0],imiss1_out_c7,imiss2_out_c7}),  
			     .scan_in(ff_oq0_out_scanin),
			     .scan_out(ff_oq0_out_scanout),
			     .en(wr_word_line[0]), 
			     .l1clk(l1clk), .dout(oq0_out[11:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_12 ff_oq1_out 
                           (.din({rdma_inv_c7,bcast_req_c7,req_out_c7[7:0],imiss1_out_c7,imiss2_out_c7}),  
			     .scan_in(ff_oq1_out_scanin),
			     .scan_out(ff_oq1_out_scanout),
			     .en(wr_word_line[1]), 
			     .l1clk(l1clk), .dout(oq1_out[11:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_12 ff_oq2_out 
                           (.din({rdma_inv_c7,bcast_req_c7,req_out_c7[7:0],imiss1_out_c7,imiss2_out_c7}),  
			     .scan_in(ff_oq2_out_scanin),
			     .scan_out(ff_oq2_out_scanout),
			     .en(wr_word_line[2]), 
			     .l1clk(l1clk), .dout(oq2_out[11:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_12 ff_oq3_out 
                           (.din({rdma_inv_c7,bcast_req_c7,req_out_c7[7:0],imiss1_out_c7,imiss2_out_c7}),  
			     .scan_in(ff_oq3_out_scanin),
			     .scan_out(ff_oq3_out_scanout),
			     .en(wr_word_line[3]), 
			     .l1clk(l1clk), .dout(oq3_out[11:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_12 ff_oq4_out 
                           (.din({rdma_inv_c7,bcast_req_c7,req_out_c7[7:0],imiss1_out_c7,imiss2_out_c7}),  
			     .scan_in(ff_oq4_out_scanin),
			     .scan_out(ff_oq4_out_scanout),
			     .en(wr_word_line[4]), 
			     .l1clk(l1clk), .dout(oq4_out[11:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_12 ff_oq5_out 
                           (.din({rdma_inv_c7,bcast_req_c7,req_out_c7[7:0],imiss1_out_c7,imiss2_out_c7}),  
			     .scan_in(ff_oq5_out_scanin),
			     .scan_out(ff_oq5_out_scanout),
			     .en(wr_word_line[5]), 
			     .l1clk(l1clk), .dout(oq5_out[11:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_12 ff_oq6_out 
                           (.din({rdma_inv_c7,bcast_req_c7,req_out_c7[7:0],imiss1_out_c7,imiss2_out_c7}),  
			     .scan_in(ff_oq6_out_scanin),
			     .scan_out(ff_oq6_out_scanout),
			     .en(wr_word_line[6]), 
			     .l1clk(l1clk), .dout(oq6_out[11:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_12 ff_oq7_out 
                           (.din({rdma_inv_c7,bcast_req_c7,req_out_c7[7:0],imiss1_out_c7,imiss2_out_c7}),  
			     .scan_in(ff_oq7_out_scanin),
			     .scan_out(ff_oq7_out_scanout),
			     .en(wr_word_line[7]), 
			     .l1clk(l1clk), .dout(oq7_out[11:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_12 ff_oq8_out 
                           (.din({rdma_inv_c7,bcast_req_c7,req_out_c7[7:0],imiss1_out_c7,imiss2_out_c7}),  
			     .scan_in(ff_oq8_out_scanin),
			     .scan_out(ff_oq8_out_scanout),
			     .en(wr_word_line[8]), 
			     .l1clk(l1clk), .dout(oq8_out[11:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_12 ff_oq9_out 
                           (.din({rdma_inv_c7,bcast_req_c7,req_out_c7[7:0],imiss1_out_c7,imiss2_out_c7}),  
			     .scan_in(ff_oq9_out_scanin),
			     .scan_out(ff_oq9_out_scanout),
			     .en(wr_word_line[9]), 
			     .l1clk(l1clk), .dout(oq9_out[11:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_12 ff_oq10_out 
                           (.din({rdma_inv_c7,bcast_req_c7,req_out_c7[7:0],imiss1_out_c7,imiss2_out_c7}),  
			     .scan_in(ff_oq10_out_scanin),
			     .scan_out(ff_oq10_out_scanout),
			     .en(wr_word_line[10]), 
			     .l1clk(l1clk), .dout(oq10_out[11:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_12 ff_oq11_out 
                           (.din({rdma_inv_c7,bcast_req_c7,req_out_c7[7:0],imiss1_out_c7,imiss2_out_c7}),  
			     .scan_in(ff_oq11_out_scanin),
			     .scan_out(ff_oq11_out_scanout),
			     .en(wr_word_line[11]), 
			     .l1clk(l1clk), .dout(oq11_out[11:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_12 ff_oq12_out 
                           (.din({rdma_inv_c7,bcast_req_c7,req_out_c7[7:0],imiss1_out_c7,imiss2_out_c7}),  
			     .scan_in(ff_oq12_out_scanin),
			     .scan_out(ff_oq12_out_scanout),
			     .en(wr_word_line[12]), 
			     .l1clk(l1clk), .dout(oq12_out[11:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_12 ff_oq13_out 
                           (.din({rdma_inv_c7,bcast_req_c7,req_out_c7[7:0],imiss1_out_c7,imiss2_out_c7}),  
			     .scan_in(ff_oq13_out_scanin),
			     .scan_out(ff_oq13_out_scanout),
			     .en(wr_word_line[13]), 
			     .l1clk(l1clk), .dout(oq13_out[11:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_12 ff_oq14_out 
                           (.din({rdma_inv_c7,bcast_req_c7,req_out_c7[7:0],imiss1_out_c7,imiss2_out_c7}),  
			     .scan_in(ff_oq14_out_scanin),
			     .scan_out(ff_oq14_out_scanout),
			     .en(wr_word_line[14]), 
			     .l1clk(l1clk), .dout(oq14_out[11:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_12 ff_oq15_out 
                           (.din({rdma_inv_c7,bcast_req_c7,req_out_c7[7:0],imiss1_out_c7,imiss2_out_c7}),  
			     .scan_in(ff_oq15_out_scanin),
			     .scan_out(ff_oq15_out_scanout),
			     .en(wr_word_line[15]), 
			     .l1clk(l1clk), .dout(oq15_out[11:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign	oq_out_bit7 = { oq15_out[9],oq14_out[9],oq13_out[9],oq12_out[9], 
                        oq11_out[9],oq10_out[9],oq9_out[9],oq8_out[9], 
                        oq7_out[9],oq6_out[9],oq5_out[9],oq4_out[9], 
                        oq3_out[9],oq2_out[9],oq1_out[9],oq0_out[9] } ; 
 
assign	oq_out_bit6 = { oq15_out[8],oq14_out[8],oq13_out[8],oq12_out[8], 
                        oq11_out[8],oq10_out[8],oq9_out[8],oq8_out[8], 
                        oq7_out[8],oq6_out[8],oq5_out[8],oq4_out[8], 
                        oq3_out[8],oq2_out[8],oq1_out[8],oq0_out[8] } ; 
 
assign	oq_out_bit5 = { oq15_out[7],oq14_out[7],oq13_out[7],oq12_out[7], 
                        oq11_out[7],oq10_out[7],oq9_out[7],oq8_out[7], 
                        oq7_out[7],oq6_out[7],oq5_out[7],oq4_out[7], 
                        oq3_out[7],oq2_out[7],oq1_out[7],oq0_out[7] } ; 
 
assign	oq_out_bit4 = { oq15_out[6],oq14_out[6],oq13_out[6],oq12_out[6], 
                        oq11_out[6],oq10_out[6],oq9_out[6],oq8_out[6], 
                        oq7_out[6],oq6_out[6],oq5_out[6],oq4_out[6], 
                        oq3_out[6],oq2_out[6],oq1_out[6],oq0_out[6] } ; 
 
assign	oq_out_bit3 = { oq15_out[5],oq14_out[5],oq13_out[5],oq12_out[5], 
                        oq11_out[5],oq10_out[5],oq9_out[5],oq8_out[5], 
                        oq7_out[5],oq6_out[5],oq5_out[5],oq4_out[5], 
                        oq3_out[5],oq2_out[5],oq1_out[5],oq0_out[5] } ; 
 
assign	oq_out_bit2 = { oq15_out[4],oq14_out[4],oq13_out[4],oq12_out[4], 
                        oq11_out[4],oq10_out[4],oq9_out[4],oq8_out[4], 
                        oq7_out[4],oq6_out[4],oq5_out[4],oq4_out[4], 
                        oq3_out[4],oq2_out[4],oq1_out[4],oq0_out[4] } ; 
 
assign	oq_out_bit1 = { oq15_out[3],oq14_out[3],oq13_out[3],oq12_out[3], 
                        oq11_out[3],oq10_out[3],oq9_out[3],oq8_out[3], 
                        oq7_out[3],oq6_out[3],oq5_out[3],oq4_out[3], 
                        oq3_out[3],oq2_out[3],oq1_out[3],oq0_out[3] } ; 
 
assign	oq_out_bit0 = { oq15_out[2],oq14_out[2],oq13_out[2],oq12_out[2], 
                        oq11_out[2],oq10_out[2],oq9_out[2],oq8_out[2], 
                        oq7_out[2],oq6_out[2],oq5_out[2],oq4_out[2], 
                        oq3_out[2],oq2_out[2],oq1_out[2],oq0_out[2] } ; 
 
assign	imiss2_oq_out = { oq15_out[0],oq14_out[0],oq13_out[0],oq12_out[0], 
			oq11_out[0],oq10_out[0],oq9_out[0],oq8_out[0], 
			oq7_out[0],oq6_out[0],oq5_out[0],oq4_out[0], 
			oq3_out[0],oq2_out[0],oq1_out[0],oq0_out[0] }; 
 
assign	imiss1_oq_out = { oq15_out[1],oq14_out[1],oq13_out[1],oq12_out[1], 
			oq11_out[1],oq10_out[1],oq9_out[1],oq8_out[1], 
			oq7_out[1],oq6_out[1],oq5_out[1],oq4_out[1], 
			oq3_out[1],oq2_out[1],oq1_out[1],oq0_out[1] }; 
 
assign	bcast_oq_out = { oq15_out[10],oq14_out[10],oq13_out[10],oq12_out[10], 
                        oq11_out[10],oq10_out[10],oq9_out[10],oq8_out[10], 
                        oq7_out[10],oq6_out[10],oq5_out[10],oq4_out[10], 
                        oq3_out[10],oq2_out[10],oq1_out[10],oq0_out[10] }; 
 
assign	rdma_oq_out = { oq15_out[11],oq14_out[11],oq13_out[11],oq12_out[11], 
                        oq11_out[11],oq10_out[11],oq9_out[11],oq8_out[11], 
                        oq7_out[11],oq6_out[11],oq5_out[11],oq4_out[11], 
                        oq3_out[11],oq2_out[11],oq1_out[11],oq0_out[11] }; 
 
 
assign	oq_rd_out[7] 	= |( oq_out_bit7 & rd_word_line )  ; 
assign	oq_rd_out[6] 	= |( oq_out_bit6 & rd_word_line )  ; 
assign	oq_rd_out[5] 	= |( oq_out_bit5 & rd_word_line )  ; 
assign	oq_rd_out[4] 	= |( oq_out_bit4 & rd_word_line )  ; 
assign	oq_rd_out[3] 	= |( oq_out_bit3 & rd_word_line )  ; 
assign	oq_rd_out[2] 	= |( oq_out_bit2 & rd_word_line )  ; 
assign	oq_rd_out[1] 	= |( oq_out_bit1 & rd_word_line )  ; 
assign	oq_rd_out[0] 	= |( oq_out_bit0 & rd_word_line )  ; 
 
assign  imiss1_rd_out = |( imiss1_oq_out & rd_word_line ) ; 
 
assign  imiss2_rd_out = |( imiss2_oq_out & rd_word_line ) ; 
 
assign	oq_bcast_out = |( bcast_oq_out & rd_word_line ) ; 
 
assign	oq_rdma_out  = |( rdma_oq_out & rd_word_line ) ; 
 
 
/////////////////////////////////////////////////////////////////////////////////// 
// CROSSBAR Q COUNT 
/** The crossbar q count is maintained here */ 
// Each crossbar queue is incremented if 
// * A request is issued to that destination 
//   OR if "atomic" is high and a request was issued to that  
//   destination  
// Each crossbar queue is decremented if 
// * A  grant is received from the crossbar for a request 
// * crossbar queue counters are initialized to 0 on reset 
 
// The crossbar Q full signal is high if 
// * the crossbar count is 2 
// * the crossbar count is non-zero and the request is an imiss return. 
/////////////////////////////////////////////////////////////////////////////////// 
 
assign  xbarq_full[0] = ( xbar0_cnt[1])  ; 
assign  xbarq_full[1] = ( xbar1_cnt[1])  ; 
assign  xbarq_full[2] = ( xbar2_cnt[1])  ; 
assign  xbarq_full[3] = ( xbar3_cnt[1])  ; 
assign  xbarq_full[4] = ( xbar4_cnt[1])  ; 
assign  xbarq_full[5] = ( xbar5_cnt[1])  ; 
assign  xbarq_full[6] = ( xbar6_cnt[1])  ; 
assign  xbarq_full[7] = ( xbar7_cnt[1])  ; 
	 
assign  xbarq_cnt1[0] = ( xbar0_cnt[0])  ; 
assign  xbarq_cnt1[1] = ( xbar1_cnt[0])  ; 
assign  xbarq_cnt1[2] = ( xbar2_cnt[0])  ; 
assign  xbarq_cnt1[3] = ( xbar3_cnt[0])  ; 
assign  xbarq_cnt1[4] = ( xbar4_cnt[0])  ; 
assign  xbarq_cnt1[5] = ( xbar5_cnt[0])  ; 
assign  xbarq_cnt1[6] = ( xbar6_cnt[0])  ; 
assign  xbarq_cnt1[7] = ( xbar7_cnt[0])  ; 
	 
assign  inc_xbar_cnt[0] = ( que_in_xbarq_c7[0] & ~xbarq_full[0] & ~cpx_l2t_grant_cx[0] )  ; 
assign  dec_xbar_cnt[0] = ( ~que_in_xbarq_c7[0] & cpx_l2t_grant_cx[0] ) ; 
assign  nochange_xbar_cnt[0] = ~dec_xbar_cnt[0] & ~inc_xbar_cnt[0] ; 
assign  change_xbar_cnt[0] = ~nochange_xbar_cnt[0] ; 
assign  xbar0_cnt_plus1[1:0] = xbar0_cnt[1:0] + 2'b1 ; 
assign  xbar0_cnt_minus1[1:0] = xbar0_cnt[1:0] - 2'b1 ; 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_2 mux_xbar0_cnt 
		( .dout (xbar0_cnt_p[1:0]), 
                       .din0(xbar0_cnt_plus1[1:0]), .din1(xbar0_cnt_minus1[1:0]), 
                       .sel0(inc_xbar_cnt[0]),     .sel1(~inc_xbar_cnt[0])) ; 
 
l2t_msff_ctl_macro__clr_1__en_1__width_2 ff_xbar0  // sync reset active low
                           (.din(xbar0_cnt_p[1:0]), .l1clk(l1clk), 
                             .scan_in(ff_xbar0_scanin),
                             .scan_out(ff_xbar0_scanout),
                             .clr(~dbb_rst_l), .en(change_xbar_cnt[0]), 
                             .dout(xbar0_cnt[1:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
	 
assign  inc_xbar_cnt[1] = ( que_in_xbarq_c7[1] & ~xbarq_full[1] & ~cpx_l2t_grant_cx[1] )  ; 
assign  dec_xbar_cnt[1] = ( ~que_in_xbarq_c7[1] & cpx_l2t_grant_cx[1] ) ; 
assign  nochange_xbar_cnt[1] = ~dec_xbar_cnt[1] &  ~inc_xbar_cnt[1] ; 
assign  change_xbar_cnt[1] = ~nochange_xbar_cnt[1] ; 
assign  xbar1_cnt_plus1[1:0] = xbar1_cnt[1:0] + 2'b1 ; 
assign  xbar1_cnt_minus1[1:0] = xbar1_cnt[1:0] - 2'b1 ; 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_2 mux_xbar1_cnt 
		( .dout (xbar1_cnt_p[1:0]), 
                       .din0(xbar1_cnt_plus1[1:0]), .din1(xbar1_cnt_minus1[1:0]), 
                       .sel0(inc_xbar_cnt[1]),     .sel1(~inc_xbar_cnt[1])) ; 
 
l2t_msff_ctl_macro__clr_1__en_1__width_2 ff_xbar1  // sync reset active low
                           (.din(xbar1_cnt_p[1:0]), .l1clk(l1clk), 
                             .scan_in(ff_xbar1_scanin),
                             .scan_out(ff_xbar1_scanout),
                             .clr(~dbb_rst_l), .en(change_xbar_cnt[1]), 
                             .dout(xbar1_cnt[1:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
	 
assign  inc_xbar_cnt[2] = ( que_in_xbarq_c7[2] & ~xbarq_full[2] & ~cpx_l2t_grant_cx[2] )  ; 
assign  dec_xbar_cnt[2] = ( ~que_in_xbarq_c7[2] & cpx_l2t_grant_cx[2] ) ; 
assign  nochange_xbar_cnt[2] = ~dec_xbar_cnt[2] & ~inc_xbar_cnt[2] ; 
assign  change_xbar_cnt[2] = ~nochange_xbar_cnt[2] ; 
assign  xbar2_cnt_plus1[1:0] = xbar2_cnt[1:0] + 2'b1 ; 
assign  xbar2_cnt_minus1[1:0] = xbar2_cnt[1:0] - 2'b1 ; 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_2 mux_xbar2_cnt 
		( .dout (xbar2_cnt_p[1:0]), 
                       .din0(xbar2_cnt_plus1[1:0]), .din1(xbar2_cnt_minus1[1:0]), 
                       .sel0(inc_xbar_cnt[2]),     .sel1(~inc_xbar_cnt[2])) ; 
 
l2t_msff_ctl_macro__clr_1__en_1__width_2 ff_xbar2  // sync reset active low
                           (.din(xbar2_cnt_p[1:0]), .l1clk(l1clk), 
                             .scan_in(ff_xbar2_scanin),
                             .scan_out(ff_xbar2_scanout),
                             .clr(~dbb_rst_l), .en(change_xbar_cnt[2]), 
                             .dout(xbar2_cnt[1:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
	 
assign  inc_xbar_cnt[3] = ( que_in_xbarq_c7[3] & ~xbarq_full[3] & ~cpx_l2t_grant_cx[3] )  ; 
assign  dec_xbar_cnt[3] = ( ~que_in_xbarq_c7[3] & cpx_l2t_grant_cx[3] ) ; 
assign  nochange_xbar_cnt[3] = ~dec_xbar_cnt[3] & ~inc_xbar_cnt[3] ; 
assign  change_xbar_cnt[3] = ~nochange_xbar_cnt[3] ; 
assign  xbar3_cnt_plus1[1:0] = xbar3_cnt[1:0] + 2'b1 ; 
assign  xbar3_cnt_minus1[1:0] = xbar3_cnt[1:0] - 2'b1 ; 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_2 mux_xbar3_cnt 
		( .dout (xbar3_cnt_p[1:0]), 
                       .din0(xbar3_cnt_plus1[1:0]), .din1(xbar3_cnt_minus1[1:0]), 
                       .sel0(inc_xbar_cnt[3]),     .sel1(~inc_xbar_cnt[3])) ; 
 
l2t_msff_ctl_macro__clr_1__en_1__width_2 ff_xbar3  // sync reset active low
                           (.din(xbar3_cnt_p[1:0]), .l1clk(l1clk), 
                             .scan_in(ff_xbar3_scanin),
                             .scan_out(ff_xbar3_scanout),
                             .clr(~dbb_rst_l), .en(change_xbar_cnt[3]), 
                             .dout(xbar3_cnt[1:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
	 
assign  inc_xbar_cnt[4] = ( que_in_xbarq_c7[4] & ~xbarq_full[4] & ~cpx_l2t_grant_cx[4] )  ; 
assign  dec_xbar_cnt[4] = ( ~que_in_xbarq_c7[4] & cpx_l2t_grant_cx[4] ) ; 
assign  nochange_xbar_cnt[4] = ~dec_xbar_cnt[4] & ~inc_xbar_cnt[4] ; 
assign  change_xbar_cnt[4] = ~nochange_xbar_cnt[4] ; 
assign  xbar4_cnt_plus1[1:0] = xbar4_cnt[1:0] + 2'b1 ; 
assign  xbar4_cnt_minus1[1:0] = xbar4_cnt[1:0] - 2'b1 ; 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_2 mux_xbar4_cnt 
		( .dout (xbar4_cnt_p[1:0]), 
                       .din0(xbar4_cnt_plus1[1:0]), .din1(xbar4_cnt_minus1[1:0]), 
                       .sel0(inc_xbar_cnt[4]),     .sel1(~inc_xbar_cnt[4])) ; 
 
l2t_msff_ctl_macro__clr_1__en_1__width_2 ff_xbar4  // sync reset active low
                           (.din(xbar4_cnt_p[1:0]), .l1clk(l1clk), 
                             .scan_in(ff_xbar4_scanin),
                             .scan_out(ff_xbar4_scanout),
                             .clr(~dbb_rst_l), .en(change_xbar_cnt[4]), 
                             .dout(xbar4_cnt[1:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
	 
assign  inc_xbar_cnt[5] = ( que_in_xbarq_c7[5] & ~xbarq_full[5] & ~cpx_l2t_grant_cx[5] )  ; 
assign  dec_xbar_cnt[5] = ( ~que_in_xbarq_c7[5] & cpx_l2t_grant_cx[5] ) ; 
assign  nochange_xbar_cnt[5] = ~dec_xbar_cnt[5] & ~inc_xbar_cnt[5] ; 
assign  change_xbar_cnt[5] = ~nochange_xbar_cnt[5] ; 
assign  xbar5_cnt_plus1[1:0] = xbar5_cnt[1:0] + 2'b1 ; 
assign  xbar5_cnt_minus1[1:0] = xbar5_cnt[1:0] - 2'b1 ; 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_2 mux_xbar5_cnt 
		( .dout (xbar5_cnt_p[1:0]), 
                       .din0(xbar5_cnt_plus1[1:0]), .din1(xbar5_cnt_minus1[1:0]), 
                       .sel0(inc_xbar_cnt[5]),     .sel1(~inc_xbar_cnt[5])) ; 
 
l2t_msff_ctl_macro__clr_1__en_1__width_2 ff_xbar5  // sync reset active low
                           (.din(xbar5_cnt_p[1:0]), .l1clk(l1clk), 
                             .scan_in(ff_xbar5_scanin),
                             .scan_out(ff_xbar5_scanout),
                             .clr(~dbb_rst_l), .en(change_xbar_cnt[5]), 
                             .dout(xbar5_cnt[1:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
	 
assign  inc_xbar_cnt[6] = ( que_in_xbarq_c7[6] & ~xbarq_full[6] & ~cpx_l2t_grant_cx[6] )  ; 
assign  dec_xbar_cnt[6] = ( ~que_in_xbarq_c7[6] & cpx_l2t_grant_cx[6] ) ; 
assign  nochange_xbar_cnt[6] = ~dec_xbar_cnt[6] & ~inc_xbar_cnt[6] ; 
assign  change_xbar_cnt[6] = ~nochange_xbar_cnt[6] ; 
assign  xbar6_cnt_plus1[1:0] = xbar6_cnt[1:0] + 2'b1 ; 
assign  xbar6_cnt_minus1[1:0] = xbar6_cnt[1:0] - 2'b1 ; 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_2 mux_xbar6_cnt 
		( .dout (xbar6_cnt_p[1:0]), 
                       .din0(xbar6_cnt_plus1[1:0]), .din1(xbar6_cnt_minus1[1:0]), 
                       .sel0(inc_xbar_cnt[6]),     .sel1(~inc_xbar_cnt[6])) ; 
 
l2t_msff_ctl_macro__clr_1__en_1__width_2 ff_xbar6  // sync reset active low
                           (.din(xbar6_cnt_p[1:0]), .l1clk(l1clk), 
                             .scan_in(ff_xbar6_scanin),
                             .scan_out(ff_xbar6_scanout),
                             .clr(~dbb_rst_l), .en(change_xbar_cnt[6]), 
                             .dout(xbar6_cnt[1:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
	 
assign  inc_xbar_cnt[7] = ( que_in_xbarq_c7[7] & ~xbarq_full[7] & ~cpx_l2t_grant_cx[7] )  ; 
assign  dec_xbar_cnt[7] = ( ~que_in_xbarq_c7[7] & cpx_l2t_grant_cx[7] ) ; 
assign  nochange_xbar_cnt[7] = ~dec_xbar_cnt[7] & ~inc_xbar_cnt[7] ; 
assign  change_xbar_cnt[7] = ~nochange_xbar_cnt[7] ; 
assign  xbar7_cnt_plus1[1:0] = xbar7_cnt[1:0] + 2'b1 ; 
assign  xbar7_cnt_minus1[1:0] = xbar7_cnt[1:0] - 2'b1 ; 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_2 mux_xbar7_cnt 
		( .dout (xbar7_cnt_p[1:0]), 
                       .din0(xbar7_cnt_plus1[1:0]), .din1(xbar7_cnt_minus1[1:0]), 
                       .sel0(inc_xbar_cnt[7]),     .sel1(~inc_xbar_cnt[7])) ; 
 
l2t_msff_ctl_macro__clr_1__en_1__width_2 ff_xbar7  // sync reset active low
                           (.din(xbar7_cnt_p[1:0]), .l1clk(l1clk), 
                             .scan_in(ff_xbar7_scanin),
                             .scan_out(ff_xbar7_scanout),
                             .clr(~dbb_rst_l), .en(change_xbar_cnt[7]), 
                             .dout(xbar7_cnt[1:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 
/////////////////////////////////////////////////////////////// 
// 
// RDMA store completion state machine. 
// 
// An RDMA store WR8 or WR64 acks the src only after 
// all the L1$ invalidates have queued up at the crossbar. 
// There are 3 possible cases with stores. 
// 
// - Stores missing the L2 send a completion signal in C7 
// - Store missing the L1 ( i.e. directory ) will send a 
//   completion signal in C7. 
// - Stores hitting the L1 will send a completion signal 
//   after making a request to the crossbar. 
// ACK_WAIT state is hit on completion. 
// ACK_CCX_REQ_ST is hit on a completion followed by a directory hit. 
// The following table represents all state transitions in this 
// FSM. 
// 
//--------------------------------------------------------------------------- 
// STATES	ACK_IDLE		ACK_WAIT		ACK_CCX_REQ 
//--------------------------------------------------------------------------- 
// ACK_IDLE	~comp_c5		comp_c5			never 
// 
//--------------------------------------------------------------------------- 
// ACK_WAIT	~hit_c6			 			directory 
//		or no			never			hit_c6 
//		directory 
//		hit 
//--------------------------------------------------------------------------- 
// ACK_CCX_REQ  req_cq & 		never			~(rdma_inv 
//		rdma_invtoxbar					to xbar & req) 
//--------------------------------------------------------------------------- 
//  
// oqu_st_complete_c7 if there is a transition 
//  			to the ACK_IDLE state from  
//			ACK_WAIT or ACK_CCX_REQ 
// 
/////////////////////////////////////////////////////////////// 
 
 
l2t_msff_ctl_macro__width_1 ff_rdma_wr_comp_c5 
                           (.din(tag_rdma_wr_comp_c4), .l1clk(l1clk), 
                              .scan_in(ff_rdma_wr_comp_c5_scanin),
                              .scan_out(ff_rdma_wr_comp_c5_scanout),
                              .dout(rdma_wr_comp_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_1 ff_rdma_wr_comp_c52 
                           (.din(rdma_wr_comp_c5), .l1clk(l1clk),
                              .scan_in(ff_rdma_wr_comp_c52_scanin),
                              .scan_out(ff_rdma_wr_comp_c52_scanout),
                              .dout(rdma_wr_comp_c52),
  .siclk(siclk),
  .soclk(soclk)  
);
 
assign	dir_hit_c6 = |(dirvec_dirdp_req_vec_c6); 
 
assign	rdma_req_sent_c7 = |(l2t_cpx_req_cq_dup) &  
				rdma_to_xbarq_c7 ; 
 
assign  rdma_state_in[`ACK_IDLE] =       ( 	 
			(rdma_state[`ACK_WAIT] & ~dir_hit_c6) | // NO L1 INVAL 
                        (rdma_state[`ACK_CCX_REQ] &  
			rdma_req_sent_c7 )| // L1 INVAL SENT 
                        rdma_state[`ACK_IDLE]  
			)  & ~rdma_wr_comp_c52 ; // completion of a write // BS 03/11/04 extra cycle for mem access 
 
assign  ack_idle_state_in_l = ~rdma_state_in[`ACK_IDLE] ; 
 
l2t_msff_ctl_macro__clr_1__width_1 ff_rdma_req_state_0  // sync reset active low
                           (.din(ack_idle_state_in_l), .l1clk(l1clk), 
                .scan_in(ff_rdma_req_state_0_scanin),
                .scan_out(ff_rdma_req_state_0_scanout),
                .clr(~dbb_rst_l), 
                .dout(ack_idle_state_l),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign  rdma_state[`ACK_IDLE] = ~ack_idle_state_l ; 
 
 
assign  rdma_state_in[`ACK_WAIT] =  
			(rdma_state[`ACK_IDLE] & rdma_wr_comp_c52 ) ; // BS 03/11/04 extra cycle for mem access 
 
 
assign  rdma_state_in[`ACK_CCX_REQ] = ( 
			(rdma_state[`ACK_WAIT] & dir_hit_c6 ) |  
							// l1 INVAL to BE SENT 
                        rdma_state[`ACK_CCX_REQ]) & 
                        ~rdma_req_sent_c7 ; 
 
l2t_msff_ctl_macro__clr_1__width_2 ff_rdma_state  // sync reset active low
                (.din(rdma_state_in[`ACK_CCX_REQ:`ACK_WAIT]),  
		.scan_in(ff_rdma_state_scanin),
		.scan_out(ff_rdma_state_scanout),
		.l1clk(l1clk), .clr(~dbb_rst_l), 
                .dout(rdma_state[`ACK_CCX_REQ:`ACK_WAIT]),
  .siclk(siclk),
  .soclk(soclk) 
                 
); 
 
 
assign	oqu_st_complete_c6 = rdma_state_in[`ACK_IDLE] & 
				~rdma_state[`ACK_IDLE] ; 
 
l2t_msff_ctl_macro__width_1 ff_oqu_st_complete_c6 
                           (.din(oqu_st_complete_c6), .l1clk(l1clk), 
                   .scan_in(ff_oqu_st_complete_c6_scanin),
                   .scan_out(ff_oqu_st_complete_c6_scanout),
                   .dout(oqu_st_complete_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
 
 
//////////////////////////////////////// 
// Generation of mux selects for 
// oque. This was previously mbist_done in 
// oq_dctl. Now that logic has been 
// merged into oqu. (11/05/2002). 
//////////////////////////////////////// 
 
 
 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// staging flops. 

// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_1 ff_store_inst_c52 
              (.dout   (store_inst_c52),
               .scan_in(ff_store_inst_c52_scanin),
               .scan_out(ff_store_inst_c52_scanout),
               .din (tag_store_inst_c5),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
                

              ) ;

 
l2t_msff_ctl_macro__width_1 ff_store_inst_c6 
              (.dout   (store_inst_c6), 
               .scan_in(ff_store_inst_c6_scanin),
               .scan_out(ff_store_inst_c6_scanout),
               .din (store_inst_c52), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
l2t_msff_ctl_macro__width_1 ff_store_inst_c7 
              (.dout   (store_inst_c7), 
               .scan_in(ff_store_inst_c7_scanin),
               .scan_out(ff_store_inst_c7_scanout),
               .din (store_inst_c6), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
l2t_msff_ctl_macro__width_1 ff_csr_reg_rd_en_c8 
              (.dout   (csr_reg_rd_en_c8), 
               .scan_in(ff_csr_reg_rd_en_c8_scanin),
               .scan_out(ff_csr_reg_rd_en_c8_scanout),
               .din (arb_csr_rd_en_c7), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
l2t_msff_ctl_macro__width_1 ff_sel_inval_c7 
              (.dout   (oqctl_sel_inval_c7), 
               .scan_in(ff_sel_inval_c7_scanin),
               .scan_out(ff_sel_inval_c7_scanout),
               .din (oqu_sel_inval_c6), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
l2t_msff_ctl_macro__width_1 ff_fwd_req_vld_ld_c7 
              (.dout   (fwd_req_vld_ld_c7), 
               .scan_in(ff_fwd_req_vld_ld_c7_scanin),
               .scan_out(ff_fwd_req_vld_ld_c7_scanout),
               .din (tag_fwd_req_ld_c6), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// DATA Diagnostic access. 
// remember tag_fwd_req_ld_c6 is only asserted for non-diag accesses. 
// "oqu_mux1_sel_data_c7[3:0]" is used for select signal for a 39 bit 4to1 MUX in 
// OQDP that selects among Diag data, Tag Diag data, VUAD Diag data & Interrupt 
// return data. 
//////////////////////////////////////////////////////////////////////////////// 
l2t_msff_ctl_macro__width_1 ff_diag_data_sel_c7 
              (.dout   (diag_data_sel_c7), 
               .scan_in(ff_diag_data_sel_c7_scanin),
               .scan_out(ff_diag_data_sel_c7_scanout),
               .din (arb_inst_l2data_vld_c6), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
assign  diag_lddata_sel_c7 = (diag_data_sel_c7 & ~store_inst_c7) | 
                              tag_fwd_req_ld_c6 ; 
 
 
l2t_msff_ctl_macro__width_1 ff_diag_lddata_sel_c8 
              (.dout   (diag_lddata_sel_c8), 
               .scan_in(ff_diag_lddata_sel_c8_scanin),
               .scan_out(ff_diag_lddata_sel_c8_scanout),
               .din (diag_lddata_sel_c7), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
assign  oqu_mux1_sel_data_c7[0] = diag_lddata_sel_c8; 
 
//////////////////////////////////////// 
// Tag Diagnostic access. 
//////////////////////////////////////// 
l2t_msff_ctl_macro__width_1 ff_diag_tag_sel_c7 
              (.dout   (diag_tag_sel_c7), 
               .scan_in(ff_diag_tag_sel_c7_scanin),
               .scan_out(ff_diag_tag_sel_c7_scanout),
               .din (arb_inst_l2tag_vld_c6), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
assign  diag_ldtag_sel_c7 = diag_tag_sel_c7 & ~store_inst_c7 ; 
 
 
l2t_msff_ctl_macro__width_1 ff_diag_ldtag_sel_c8 
              (.dout   (diag_ldtag_sel_c8), 
               .scan_in(ff_diag_ldtag_sel_c8_scanin),
               .scan_out(ff_diag_ldtag_sel_c8_scanout),
               .din (diag_ldtag_sel_c7), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
assign  oqu_mux1_sel_data_c7[1] = diag_ldtag_sel_c8; 
 
//////////////////////////////////////// 
// VUAD Diagnostic access. 
//////////////////////////////////////// 
l2t_msff_ctl_macro__width_1 ff_diag_vuad_sel_c7 
              (.dout   (diag_vuad_sel_c7), 
               .scan_in(ff_diag_vuad_sel_c7_scanin),
               .scan_out(ff_diag_vuad_sel_c7_scanout),
               .din (arb_inst_l2vuad_vld_c6), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
assign  diag_ldvuad_sel_c7 = diag_vuad_sel_c7 & ~store_inst_c7 ; 
 
 
l2t_msff_ctl_macro__width_1 ff_diag_ldvuad_sel_c8 
              (.dout   (diag_ldvuad_sel_c8), 
               .scan_in(ff_diag_ldvuad_sel_c8_scanin),
               .scan_out(ff_diag_ldvuad_sel_c8_scanout),
               .din (diag_ldvuad_sel_c7), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
assign  oqu_mux1_sel_data_c7[2] = diag_ldvuad_sel_c8 ; 
 
//////////////////////////////////////// 
// default mux sel 
//////////////////////////////////////// 
assign  diag_def_sel_c7 = ~(diag_lddata_sel_c7 | diag_ldtag_sel_c7 |  // int 5.0 changes
                            diag_ldvuad_sel_c7) ; 
 
l2t_msff_ctl_macro__width_1 ff_diag_def_sel_c8 
              (.dout   (diag_def_sel_c8), 
               .scan_in(ff_diag_def_sel_c8_scanin),
               .scan_out(ff_diag_def_sel_c8_scanout),
               .din (diag_def_sel_c7), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
assign  oqu_mux1_sel_data_c7[3] = diag_def_sel_c8 ; 

 
//////////////////////////////////////////////////////////////////////////////// 
assign	oqu_mux_csr_sel_c7 = csr_reg_rd_en_c8 ; // buferred here. 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// mux select to choose between 
// inval and ret data for oqarray_datain 
//////////////////////////////////////////////////////////////////////////////// 
assign  oqu_sel_inval_c7 = oqctl_sel_inval_c7 | diag_lddata_sel_c8 | 
                       diag_ldtag_sel_c8  | diag_ldvuad_sel_c8 |   
                       fwd_req_vld_ld_c7 ; 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// mux select for 3-1 mux in oque. 
// sel0 .... old packet 
// sel1 .... oq data 
// sel2 .... def. 
//////////////////////////////////////////////////////////////////////////////// 
 
assign  oqu_out_mux1_sel_c7[0] = oqu_sel_old_req_c7 ; 
assign	oqu_out_mux1_sel_c7[1] = oqu_sel_oq_c7 ; 
assign	oqu_out_mux1_sel_c7[2] = ~(oqu_sel_old_req_c7 | oqu_sel_oq_c7 )  ; 

//////////////////////////////////////////////////////////////////////////////// 
// mux2 select for 3-1 mux in oque. 
// sel0.....oq,old or prev data 
// sel1.....inval data 
// sel2.....def  
//////////////////////////////////////////////////////////////////////////////// 
assign  sel_old_data_c7 = (oqu_sel_old_req_c7 | oqu_sel_oq_c7 | 
                           oqu_prev_data_c7); 
 
assign  oqu_out_mux2_sel_c7[0] = sel_old_data_c7 ; 
assign  oqu_out_mux2_sel_c7[1] = oqu_sel_inval_c7 & ~sel_old_data_c7 ; 
assign  oqu_out_mux2_sel_c7[2] = ~(sel_old_data_c7 | oqu_sel_inval_c7) ; 
 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// Directory in L2 is arranged in the form of 32 Panels (8 Rows x 4 Columns). 
// Each panel contains 1 Set (4 Ways) for each of the 8 CPU. A Panel is selected 
// for Camming based on address bit <4,5,8,9,10> for the D$ Cam and address bit 
// <5,8,9,10,11> for the I$ Cam. In D$ bit <10,9,8> is used for selecting a Row 
// and bit <5,4> is used for selecting the a Column. In I$ bit <10,9,8> is used 
// for selecting a Row and bit <5,11> is used for selecting a Column. 
// 
// I$ and D$ Cam produce a 128 bit output which corresponds to the CAM hit or 
// miss output bit for a Row of 4 Panels (each panel have 32 entry, 4 way of a 
// set for each of the 8 cpu). In case of an eviction all the 128 bit of the 
// D$ Cam and only 64 bits of the I$ Cam will be valid. In case of Load only 
// 4 bit of the I$ cam output will be valid (For Load, if the data requested by 
// a particular cpu is also present in the I$ of the same processor then that 
// data in L1's I$ must be invalidated. So for a load only one panel in 
// I$ Cam will be Cammed and only bits corresponding to that particular cpu will 
// be relevant). In case of Imiss, in first cycle one set of the 4 bit of the 
// D$ Cam output will be valid and in the second cycle another set of the 4 bit 
// of the D$ Cam output will be valid. 
// To mux out relevant 4 bits out of the 128 bit output from the I$ and D$ Cam 
// Three stage muxing is mbist_done. First 8to1 muxing is mbist_done in 2 stages (first 
// 4to1 and then 2to1) to mux out all the 16 bits corresponding a particular cpu. 
// This muxing is mbist_done based on the cpu id. Then 4:1 muxing is mbist_done to select a 
// particular column out of the four column, this is mbist_done based on the address 
// bit <5,4> for the D$ and address bit <5,11> for the I$. 
//  
// oqu_sel_mux1_c6[3:0], oqu_sel_mux2_c6[3:0] and oqu_sel_mux3_c6 is used for the 8to1 
// Muxing. oqu_sel_mux1_c6[3:0] & oqu_sel_mux2_c6[3:0] is used for the 4to1 muxing in 
// the first stage and oqu_sel_mux3_c6 is used to do 2to1 muxing in the second 
// stage. 
// oqu_mux_vec_sel_c6[3:0] is used to do final 4to1 Muxing. 
// 
//////////////////////////////////////////////////////////////////////////////// 
// the arbdec_arbdp_cpuid_c5 requires ~10 gates of setup. 

// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_3 ff_dirvec_cpuid_c52 
              (.dout   (inst_cpuid_c52[2:0]),
       //        .din (arbdec_arbdp_cpuid_c5[2:0]),
               .scan_in(ff_dirvec_cpuid_c52_scanin),
               .scan_out(ff_dirvec_cpuid_c52_scanout),
               .din (arb_cpuid_c5[2:0]), //the mapped cpuid taking into account PA[8:7] in Partial bank Mode
                                         // needs to be used to generate oqu_mux_sel[1/2/3] to dirvec.
                                         // this is because to generate the i$ and D$ mutual invals for load
                                         // and ifill returns, the hit way sel from the dc and ic dirs (way_way_vld*)
                                         // reflect the remapped cpuid . hence the oqu_mux_sels need to be
                                         // generated based on the remapped cpuid also. However the remapped cpuid
                                         // is not used to generate the cpx request. Fix for bug 92557  
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
                

              ) ;

 
l2t_msff_ctl_macro__width_3 ff_dirvec_cpuid_c6 
              (.dout   (inst_cpuid_c6[2:0]), 
               .scan_in(ff_dirvec_cpuid_c6_scanin),
               .scan_out(ff_dirvec_cpuid_c6_scanout),
               .din (inst_cpuid_c52[2:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_3 mux_dirvec_cpuid_c52 
              (.dout (cpuid_c52[2:0]), 
               .din0  (inst_cpuid_c52[2:0]),  .sel0 (~imiss1_out_c6), 
               .din1  (inst_cpuid_c6[2:0]),   .sel1 (imiss1_out_c6) 
              ) ; 
 
 
assign  dec_cpuid_c52[0] = (cpuid_c52 == 3'd0) ; 
assign  dec_cpuid_c52[1] = (cpuid_c52 == 3'd1) ; 
assign  dec_cpuid_c52[2] = (cpuid_c52 == 3'd2) ; 
assign  dec_cpuid_c52[3] = (cpuid_c52 == 3'd3) ; 
assign  dec_cpuid_c52[4] = (cpuid_c52 == 3'd4) ; 
assign  dec_cpuid_c52[5] = (cpuid_c52 == 3'd5) ; 
assign  dec_cpuid_c52[6] = (cpuid_c52 == 3'd6) ; 
 
l2t_msff_ctl_macro__width_7 ff_dec_cpuid_c6  // int 5.0 changes
              (.dout   (dec_cpuid_c6[6:0]), 
               .scan_in(ff_dec_cpuid_c6_scanin),
               .scan_out(ff_dec_cpuid_c6_scanout),
               .din (dec_cpuid_c52[6:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
assign  oqu_sel_mux1_c6[0] =   dec_cpuid_c6[0] ; 
assign  oqu_sel_mux1_c6[1] =   dec_cpuid_c6[1] ; 
assign  oqu_sel_mux1_c6[2] =   dec_cpuid_c6[2] ; 
assign  oqu_sel_mux1_c6[3] = ~(dec_cpuid_c6[0] | dec_cpuid_c6[1] | dec_cpuid_c6[2]) ; 
 
assign  oqu_sel_mux2_c6[0] =   dec_cpuid_c6[4] ; 
assign  oqu_sel_mux2_c6[1] =   dec_cpuid_c6[5] ; 
assign  oqu_sel_mux2_c6[2] =   dec_cpuid_c6[6] ; 
assign  oqu_sel_mux2_c6[3] = ~(dec_cpuid_c6[4] | dec_cpuid_c6[5] | dec_cpuid_c6[6]); 
 
assign  oqu_sel_mux3_c6    =   |(dec_cpuid_c6[3:0]) ; 
 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// mux selects for the mux that selects the data 
// for way-wayvld bits of the cpx packet. 
 
l2t_msff_ctl_macro__width_4 ff_lkup_bank_ena_icd_c5 
              (.dout   (lkup_bank_ena_icd_c5[3:0]), 
               .scan_in(ff_lkup_bank_ena_icd_c5_scanin),
               .scan_out(ff_lkup_bank_ena_icd_c5_scanout),
               .din (lkup_bank_ena_icd_c4[3:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
l2t_msff_ctl_macro__width_4 ff_lkup_bank_ena_dcd_c5 
              (.dout   (lkup_bank_ena_dcd_c5[3:0]), 
               .scan_in(ff_lkup_bank_ena_dcd_c5_scanin),
               .scan_out(ff_lkup_bank_ena_dcd_c5_scanout),
               .din (lkup_bank_ena_dcd_c4[3:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
assign  mux_vec_sel_c5[0] = (lkup_bank_ena_icd_c5[0] | lkup_bank_ena_dcd_c5[0] | 
                             lkup_bank_ena_icd_c5[1]) ; 
assign  mux_vec_sel_c5[1] =  lkup_bank_ena_dcd_c5[1] & ~mux_vec_sel_c5[0] ; 
assign  mux_vec_sel_c5[2] =  (lkup_bank_ena_icd_c5[2] | lkup_bank_ena_dcd_c5[2] | 
                              lkup_bank_ena_icd_c5[3]) & 
                            ~(mux_vec_sel_c5[0] | mux_vec_sel_c5[1]) ; 
assign  mux_vec_sel_c5[3] = ~(mux_vec_sel_c5[0] | mux_vec_sel_c5[1] | 
                              mux_vec_sel_c5[2]) ; 

// BS 03/11/04 extra cycle for mem access
l2t_msff_ctl_macro__width_4 ff_mux_vec_sel_c52 
              (.dout   (mux_vec_sel_c52[3:0]),
               .scan_in(ff_mux_vec_sel_c52_scanin),
               .scan_out(ff_mux_vec_sel_c52_scanout),
               .din (mux_vec_sel_c5[3:0]),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
                

              ) ;

 
l2t_msff_ctl_macro__width_4 ff_mux_vec_sel_c6 
              (.dout   (mux_vec_sel_c6_unqual[3:0]), 
               .scan_in(ff_mux_vec_sel_c6_scanin),
               .scan_out(ff_mux_vec_sel_c6_scanout),
               .din (mux_vec_sel_c52[3:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
assign  oqu_mux_vec_sel_c6[0] = mux_vec_sel_c6_unqual[0]; 
assign  oqu_mux_vec_sel_c6[1] = mux_vec_sel_c6_unqual[1]; 
assign  oqu_mux_vec_sel_c6[2] = mux_vec_sel_c6_unqual[2]; 
assign  oqu_mux_vec_sel_c6[3] = mux_vec_sel_c6_unqual[3]; 
 
 
 
// fixscan start:
assign spares_scanin             = scan_in                  ;
assign reset_flop_scanin         = spares_scanout           ;
assign ff_int_bcast_c52_scanin   = reset_flop_scanout       ;
assign ff_int_bcast_c6_scanin    = ff_int_bcast_c52_scanout ;
assign ff_dec_cpu_c52_scanin     = ff_int_bcast_c6_scanout  ;
assign ff_dec_cpu_c6_scanin      = ff_dec_cpu_c52_scanout   ;
assign ff_dec_cpu_c7_scanin      = ff_dec_cpu_c6_scanout    ;
assign ff_sel_dec_vec_c7_scanin  = ff_dec_cpu_c7_scanout    ;
assign ff_diag_acc_c8_scanin     = ff_sel_dec_vec_c7_scanout;
assign ff_sel_stinv_req_c52_scanin = ff_diag_acc_c8_scanout   ;
assign ff_sel_stinv_req_c6_scanin = ff_sel_stinv_req_c52_scanout;
assign ff_sel_inv_vec_c52_scanin = ff_sel_stinv_req_c6_scanout;
assign ff_sel_inv_vec_c6_scanin  = ff_sel_inv_vec_c52_scanout;
assign ff_sel_dec_vec_c52_scanin = ff_sel_inv_vec_c6_scanout;
assign ff_sel_dec_vec_c5_d1_scanin = ff_sel_dec_vec_c52_scanout;
assign ff_req_out_c7_scanin      = ff_sel_dec_vec_c5_d1_scanout;
assign ff_imiss1_out_c52_scanin  = ff_req_out_c7_scanout    ;
assign ff_imiss1_out_c6_scanin   = ff_imiss1_out_c52_scanout;
assign ff_imiss1_out_c7_scanin   = ff_imiss1_out_c6_scanout ;
assign ff_imiss1_out_c8_scanin   = ff_imiss1_out_c7_scanout ;
assign ff_imiss2_req_vec_c7_scanin = ff_imiss1_out_c8_scanout ;
assign ff_c6_req_vld_scanin      = ff_imiss2_req_vec_c7_scanout;
assign ff_sel_c7_req_d1_scanin   = ff_c6_req_vld_scanout    ;
assign ff_rdma_inv_c7_scanin     = ff_sel_c7_req_d1_scanout ;
assign ff_xbar_req_c7_scanin     = ff_rdma_inv_c7_scanout   ;
assign ff_imiss1_to_xbarq_c7_scanin = ff_xbar_req_c7_scanout   ;
assign ff_rdma_to_xbarq_c7_scanin = ff_imiss1_to_xbarq_c7_scanout;
assign ff_imiss2_to_xbarq_c7_scanin = ff_rdma_to_xbarq_c7_scanout;
assign ff_bcast_req_c6_scanin    = ff_imiss2_to_xbarq_c7_scanout;
assign ff_bcast_to_xbar_c7_scanin = ff_bcast_req_c6_scanout  ;
assign ff_allow_req_c7_scanin    = ff_bcast_to_xbar_c7_scanout;
assign ff_l2t_cpx_req_cq_c7_scanin = ff_allow_req_c7_scanout  ;
assign ff_l2t_cpx_atom_cq_c7_scanin = ff_l2t_cpx_req_cq_c7_scanout;
assign ff_l2t_cpx_req_cq_c7_dup_scanin = ff_l2t_cpx_atom_cq_c7_scanout;
assign ff_fwd_req_ret_c52_scanin = ff_l2t_cpx_req_cq_c7_dup_scanout;
assign ff_fwd_req_ret_c6_scanin  = ff_fwd_req_ret_c52_scanout;
assign ff_fwd_req_ret_c7_scanin  = ff_fwd_req_ret_c6_scanout;
assign ff_int_ack_c52_scanin     = ff_fwd_req_ret_c7_scanout;
assign ff_int_ack_c6_scanin      = ff_int_ack_c52_scanout   ;
assign ff_int_ack_c7_scanin      = ff_int_ack_c6_scanout    ;
assign ff_ld_hit_c52_scanin      = ff_int_ack_c7_scanout    ;
assign ff_ld_hit_c6_scanin       = ff_ld_hit_c52_scanout    ;
assign ff_ld_hit_c7_scanin       = ff_ld_hit_c6_scanout     ;
assign ff_st_req_c52_scanin      = ff_ld_hit_c7_scanout     ;
assign ff_st_req_c6_scanin       = ff_st_req_c52_scanout    ;
assign ff_st_req_c7_scanin       = ff_st_req_c6_scanout     ;
assign ff_inval_req_c52_scanin   = ff_st_req_c7_scanout     ;
assign ff_inval_req_c6_scanin    = ff_inval_req_c52_scanout ;
assign ff_inval_req_c7_scanin    = ff_inval_req_c6_scanout  ;
assign ff_strst_ack_c52_scanin   = ff_inval_req_c7_scanout  ;
assign ff_strst_ack_c6_scanin    = ff_strst_ack_c52_scanout ;
assign ff_strst_ack_c7_scanin    = ff_strst_ack_c6_scanout  ;
assign ff_rmo_st_c52_scanin      = ff_strst_ack_c7_scanout  ;
assign ff_rmo_st_c6_scanin       = ff_rmo_st_c52_scanout    ;
assign ff_rmo_st_c7_scanin       = ff_rmo_st_c6_scanout     ;
assign ff_sel_inv_vec_c7_scanin  = ff_rmo_st_c7_scanout     ;
assign ff_uerr_ack_c52_scanin    = ff_sel_inv_vec_c7_scanout;
assign ff_uerr_ack_c6_scanin     = ff_uerr_ack_c52_scanout  ;
assign ff_uerr_ack_c7_scanin     = ff_uerr_ack_c6_scanout   ;
assign ff_st_ack_c52_scanin      = ff_uerr_ack_c7_scanout   ;
assign ff_st_ack_c6_scanin       = ff_st_ack_c52_scanout    ;
assign ff_st_ack_c7_scanin       = ff_st_ack_c6_scanout     ;
assign ff_cerr_ack_c52_scanin    = ff_st_ack_c7_scanout     ;
assign ff_cerr_ack_c6_scanin     = ff_cerr_ack_c52_scanout  ;
assign ff_cerr_ack_c7_scanin     = ff_cerr_ack_c6_scanout   ;
assign ff_strld_inst_c7_scanin   = ff_cerr_ack_c7_scanout   ;
assign ff_mmuld_inst_c7_scanin   = ff_strld_inst_c7_scanout ;
assign ff_atm_inst_c7_scanin     = ff_mmuld_inst_c7_scanout ;
assign ff_l2_miss_c52_scanin     = ff_atm_inst_c7_scanout   ;
assign ff_l2_miss_c6_scanin      = ff_l2_miss_c52_scanout   ;
assign ff_l2_miss_c7_scanin      = ff_l2_miss_c6_scanout    ;
assign ff_pf_inst_c52_scanin     = ff_l2_miss_c7_scanout    ;
assign ff_pf_inst_c6_scanin      = ff_pf_inst_c52_scanout   ;
assign ff_pf_inst_c7_scanin      = ff_pf_inst_c6_scanout    ;
assign ff_arb_oqu_swap_cas2_req_scanin = ff_pf_inst_c7_scanout    ;
assign ff_inc_wr_ptr_d1_scanin   = ff_arb_oqu_swap_cas2_req_scanout;
assign ff_inc_wr_ptr_d1_1_scanin = ff_inc_wr_ptr_d1_scanout ;
assign ff_inc_wr_ptr_d1_2_scanin = ff_inc_wr_ptr_d1_1_scanout;
assign ff_l2t_mb0_run_r1_scanin  = ff_inc_wr_ptr_d1_2_scanout;
assign ff_enc_wr_ptr_d1_scanin   = ff_l2t_mb0_run_r1_scanout;
assign ff_wr_ptr15to1_d1_scanin  = ff_enc_wr_ptr_d1_scanout ;
assign ff_wr_ptr0_d1_scanin      = ff_wr_ptr15to1_d1_scanout;
assign ff_inc_rd_ptr_d1_scanin   = ff_wr_ptr0_d1_scanout    ;
assign ff_inc_rd_ptr_d1_1_scanin = ff_inc_rd_ptr_d1_scanout ;
assign ff_inc_rd_ptr_d1_2_scanin = ff_inc_rd_ptr_d1_1_scanout;
assign ff_rd_ptr15to1_d1_scanin  = ff_inc_rd_ptr_d1_2_scanout;
assign ff_rd_ptr0_d1_scanin      = ff_rd_ptr15to1_d1_scanout;
assign ff_enc_wr_ptr_d2_scanin   = ff_rd_ptr0_d1_scanout    ;
assign ff_enc_rd_ptr_d1_scanin   = ff_enc_wr_ptr_d2_scanout ;
assign ff_inc_wr_ptr_d2_scanin   = ff_enc_rd_ptr_d1_scanout ;
assign ff_oq_cnt_d1_scanin       = ff_inc_wr_ptr_d2_scanout ;
assign ff_oq_cnt_plus1_d1_scanin = ff_oq_cnt_d1_scanout     ;
assign ff_oq_cnt_minus1_d1_scanin = ff_oq_cnt_plus1_d1_scanout;
assign ff_oq_count_15_d1_scanin  = ff_oq_cnt_minus1_d1_scanout;
assign ff_oq_count_16_d1_scanin  = ff_oq_count_15_d1_scanout;
assign ff_oqu_arb_full_px2_scanin = ff_oq_count_16_d1_scanout;
assign ff_oq_count_nonzero_d1_scanin = ff_oqu_arb_full_px2_scanout;
assign ff_old_req_vld_d1_scanin  = ff_oq_count_nonzero_d1_scanout;
assign ff_oq0_out_scanin         = ff_old_req_vld_d1_scanout;
assign ff_oq1_out_scanin         = ff_oq0_out_scanout       ;
assign ff_oq2_out_scanin         = ff_oq1_out_scanout       ;
assign ff_oq3_out_scanin         = ff_oq2_out_scanout       ;
assign ff_oq4_out_scanin         = ff_oq3_out_scanout       ;
assign ff_oq5_out_scanin         = ff_oq4_out_scanout       ;
assign ff_oq6_out_scanin         = ff_oq5_out_scanout       ;
assign ff_oq7_out_scanin         = ff_oq6_out_scanout       ;
assign ff_oq8_out_scanin         = ff_oq7_out_scanout       ;
assign ff_oq9_out_scanin         = ff_oq8_out_scanout       ;
assign ff_oq10_out_scanin        = ff_oq9_out_scanout       ;
assign ff_oq11_out_scanin        = ff_oq10_out_scanout      ;
assign ff_oq12_out_scanin        = ff_oq11_out_scanout      ;
assign ff_oq13_out_scanin        = ff_oq12_out_scanout      ;
assign ff_oq14_out_scanin        = ff_oq13_out_scanout      ;
assign ff_oq15_out_scanin        = ff_oq14_out_scanout      ;
assign ff_xbar0_scanin           = ff_oq15_out_scanout      ;
assign ff_xbar1_scanin           = ff_xbar0_scanout         ;
assign ff_xbar2_scanin           = ff_xbar1_scanout         ;
assign ff_xbar3_scanin           = ff_xbar2_scanout         ;
assign ff_xbar4_scanin           = ff_xbar3_scanout         ;
assign ff_xbar5_scanin           = ff_xbar4_scanout         ;
assign ff_xbar6_scanin           = ff_xbar5_scanout         ;
assign ff_xbar7_scanin           = ff_xbar6_scanout         ;
assign ff_rdma_wr_comp_c5_scanin = ff_xbar7_scanout         ;
assign ff_rdma_wr_comp_c52_scanin = ff_rdma_wr_comp_c5_scanout;
assign ff_rdma_req_state_0_scanin = ff_rdma_wr_comp_c52_scanout;
assign ff_rdma_state_scanin      = ff_rdma_req_state_0_scanout;
assign ff_oqu_st_complete_c6_scanin = ff_rdma_state_scanout    ;
assign ff_store_inst_c52_scanin  = ff_oqu_st_complete_c6_scanout;
assign ff_store_inst_c6_scanin   = ff_store_inst_c52_scanout;
assign ff_store_inst_c7_scanin   = ff_store_inst_c6_scanout ;
assign ff_csr_reg_rd_en_c8_scanin = ff_store_inst_c7_scanout ;
assign ff_sel_inval_c7_scanin    = ff_csr_reg_rd_en_c8_scanout;
assign ff_fwd_req_vld_ld_c7_scanin = ff_sel_inval_c7_scanout  ;
assign ff_diag_data_sel_c7_scanin = ff_fwd_req_vld_ld_c7_scanout;
assign ff_diag_lddata_sel_c8_scanin = ff_diag_data_sel_c7_scanout;
assign ff_diag_tag_sel_c7_scanin = ff_diag_lddata_sel_c8_scanout;
assign ff_diag_ldtag_sel_c8_scanin = ff_diag_tag_sel_c7_scanout;
assign ff_diag_vuad_sel_c7_scanin = ff_diag_ldtag_sel_c8_scanout;
assign ff_diag_ldvuad_sel_c8_scanin = ff_diag_vuad_sel_c7_scanout;
assign ff_diag_def_sel_c8_scanin = ff_diag_ldvuad_sel_c8_scanout;
assign ff_dirvec_cpuid_c52_scanin = ff_diag_def_sel_c8_scanout;
assign ff_dirvec_cpuid_c6_scanin = ff_dirvec_cpuid_c52_scanout;
assign ff_dec_cpuid_c6_scanin    = ff_dirvec_cpuid_c6_scanout;
assign ff_lkup_bank_ena_icd_c5_scanin = ff_dec_cpuid_c6_scanout  ;
assign ff_lkup_bank_ena_dcd_c5_scanin = ff_lkup_bank_ena_icd_c5_scanout;
assign ff_mux_vec_sel_c52_scanin = ff_lkup_bank_ena_dcd_c5_scanout;
assign ff_mux_vec_sel_c6_scanin  = ff_mux_vec_sel_c52_scanout;
assign scan_out                  = ff_mux_vec_sel_c6_scanout;
// fixscan end:
endmodule 
 
 


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_mux_ctl_macro__mux_aonpe__ports_2__width_1 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [0:0] din0;
  input sel0;
  input [0:0] din1;
  input sel1;
  output [0:0] dout;





assign dout[0:0] = ( {1{sel0}} & din0[0:0] ) |
                       ( {1{sel1}} & din1[0:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_mux_ctl_macro__mux_aonpe__ports_2__width_2 (
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


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_mux_ctl_macro__mux_aonpe__ports_2__width_3 (
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

module l2t_mux_ctl_macro__mux_aonpe__ports_2__width_4 (
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

module l2t_mux_ctl_macro__mux_aonpe__ports_2__width_8 (
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



// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_mux_ctl_macro__mux_aonpe__ports_3__width_4 (
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

module l2t_mux_ctl_macro__mux_aonpe__ports_3__width_5 (
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





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_mux_ctl_macro__mux_aonpe__ports_4__width_4 (
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

module l2t_mux_ctl_macro__mux_aonpe__ports_4__width_5 (
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

module l2t_mux_ctl_macro__mux_aonpe__ports_4__width_8 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
  input [7:0] din0;
  input sel0;
  input [7:0] din1;
  input sel1;
  input [7:0] din2;
  input sel2;
  input [7:0] din3;
  input sel3;
  output [7:0] dout;





assign dout[7:0] = ( {8{sel0}} & din0[7:0] ) |
                       ( {8{sel1}} & din1[7:0]) |
                       ( {8{sel2}} & din2[7:0]) |
                       ( {8{sel3}} & din3[7:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_msff_ctl_macro__clr_1__width_15 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [14:0] fdin;
wire [13:0] so;

  input [14:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [14:0] dout;
  output scan_out;
assign fdin[14:0] = din[14:0] & ~{15{clr}};






dff #(15)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[14:0]),
.si({scan_in,so[13:0]}),
.so({so[13:0],scan_out}),
.q(dout[14:0])
);












endmodule






// any PARAMS parms go into naming of macro

module l2t_msff_ctl_macro__en_1__width_12 (
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

module l2t_msff_ctl_macro__dmsff_32x__width_1 (
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

module l2t_msff_ctl_macro__dmsff_32x__width_8 (
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

module l2t_msff_ctl_macro__clr_1__en_1__width_2 (
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

module l2t_mux_ctl_macro__mux_aonpe__ports_2__width_16 (
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

module l2t_msff_ctl_macro__clr_1__width_1 (
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

module l2t_msff_ctl_macro__clr_1__width_2 (
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

module l2t_msff_ctl_macro__clr_1__width_5 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0] & ~{5{clr}};






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


