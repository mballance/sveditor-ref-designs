/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: pcie.h
* Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
* 4150 Network Circle, Santa Clara, California 95054, U.S.A.
*
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* For the avoidance of doubt, and except that if any non-GPL license 
* choice is available it will apply instead, Sun elects to use only 
* the General Public License version 2 (GPLv2) at this time for any 
* software where a choice of GPL license versions is made 
* available with the language indicating that GPLv2 or any later version 
* may be used, or where a choice of which version of the GPL is applied is 
* otherwise unspecified. 
*
* Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
* CA 95054 USA or visit www.sun.com if you need additional information or 
* have any questions. 
*
* 
* ========== Copyright Header End ============================================
*/
`define FIRE_PA_MSB  		42		// Physical address MSB

`define FIRE_DEBUG_WDTH		8 		// Width of the Debug Ports
`define FIRE_DBG_DATA_BITS	7:0 		// Debug data bits

`define FIRE_PRF_ADDR_BITS	7:0
`define FIRE_PRF_DATA_BITS	63:0

//-----------------------------------------------------------------------------
//******************************** CSR INTERFACE ******************************
//-----------------------------------------------------------------------------

`define FIRE_CSR_ADDR_BITS	26:0
`define FIRE_CSR_DATA_BITS	63:0
`define FIRE_CSR_RDMS_BITS	63:32
`define FIRE_CSR_RDLS_BITS	31:0

`define FIRE_CSR_CMND_BITS	2:0
`define FIRE_CSR_SRCB_BITS	1:0
`define FIRE_CSR_STTS_BITS	2:0
`define FIRE_CSR_TOUT_BITS	7:0

`define FIRE_CSR_RING_WDTH	32
`define FIRE_CSR_RING_BITS	`FIRE_CSR_RING_WDTH-1:0

`define FIRE_CSR_PCKT_WDTH	96
`define FIRE_CSR_PCKT_BITS	`FIRE_CSR_PCKT_WDTH-1:0

`define FIRE_CSR_CMND_IDLE	3'b000
`define FIRE_CSR_CMND_RSET	3'b001
`define FIRE_CSR_CMND_RREQ	3'b010
`define FIRE_CSR_CMND_WREQ	3'b011
`define FIRE_CSR_CMND_RRSP	3'b100
`define FIRE_CSR_CMND_WRSP	3'b101
`define FIRE_CSR_CMND_RERR	3'b110
`define FIRE_CSR_CMND_WERR	3'b111

`define FIRE_CSR_PCKT_CMND_BITS	95:93
`define FIRE_CSR_PCKT_ADDR_BITS	95:64
`define FIRE_CSR_PCKT_RDMS_BITS	63:32
`define FIRE_CSR_PCKT_RDLS_BITS	31:0

`define FIRE_CSR_RING_CMND_BITS	31:29
`define FIRE_CSR_RING_WRIT_BITS	29
`define FIRE_CSR_RING_SRCB_BITS	28:27
`define FIRE_CSR_RING_ADDR_BITS	`FIRE_CSR_ADDR_BITS

`define FIRE_CSR_SRCB_JTAG	2'b00
`define FIRE_CSR_SRCB_SLOW	2'b01
`define FIRE_CSR_SRCB_MEDM	2'b10
`define FIRE_CSR_SRCB_FAST	2'b11

//#######################################################
// FIRE Defines Used in DCM, Modules 
//#######################################################
`define FIRE_CSR_ADDR_MAX_WIDTH 27		     		// Maximum width of supplied address
`define FIRE_CSR_CHECK_ADDR_BIT_RANGE 4:0		   	// Bit fields of the supplied address port
`define FIRE_CSR_CHECK_ADDR_WIDTH 5		       		// Width of the supplied address port
`define FIRE_CSR_DATA_14_WIDTH 14		    		// Width of data in P1
`define FIRE_CSR_DATA_50_WIDTH 50		    		// Width of data in P2
`define FIRE_CSR_DATA_WIDTH   64 		   		// Width of data in a register
`define FIRE_CSR_HOST_DONE_STATUS_ACCESS_VIO 3'b100		// Access violation occured
`define FIRE_CSR_HOST_DONE_STATUS_MAP_DONE_TIMEOUT 3'b101	// Timeout values exceeded
`define FIRE_CSR_HOST_DONE_STATUS_RING_TRANS_ERROR 3'b111	// Error on CSR Ring
`define FIRE_CSR_HOST_DONE_STATUS_SUCCESS 3'b0		       	// Transaction completed successfully
`define FIRE_CSR_HOST_DONE_STATUS_WIDTH 3		     	// Width of Done status to Host devices
`define FIRE_CSR_NON_MUTEABLE_BITS 31:0				// Non-muteable bits in P1
`define FIRE_CSR_NON_MUTEABLE_WIDTH 32			 	// Width of non-muteable data in P1
`define FIRE_CSR_PKT_ACC_VIO_BIT 33		      		// Bit position of the access violation bit
`define FIRE_CSR_PKT_ADDR_BITS 28:0		    		// Bit position of the address bits in first CSR packet
`define FIRE_CSR_PKT_ADDR_WIDTH 29		     		// Width of the address bits in the packet format
`define FIRE_CSR_PKT_DATA_14_BIT 49:36		     		// Bit position of the 14 bits of data
`define FIRE_CSR_PKT_DATA_50_BIT 49:0		      		// Bit positions of the 50 bits of data
`define FIRE_CSR_PKT_DONE_BIT 35 		   		// Bit position of the done bit
`define FIRE_CSR_PKT_MAPPED_BIT 34		     		// Bit position of the mapped bit
`define FIRE_CSR_PKT_RESERVED_BIT 32		       		// Bit position of the reserved bit
`define FIRE_CSR_PKT_SRC_BUS_BITS 30:29		       		// Bit position of the source bus id bits
`define FIRE_CSR_PKT_SRC_BUS_ID_WIDTH 2			   	// Width of the src bus id in packet format
`define FIRE_CSR_PKT_VALID_BIT 50		    		// Bit position of the valid bit in each CSR packet
`define FIRE_CSR_PKT_WR_BIT   31 		   		// Bit position of the write command
`define FIRE_CSR_RING_WIDTH   32 		   		// Width of CSR ring
`define FIRE_CSR_SRC_BUS_ID_WIDTH 2		       		// Width of the src bus id ports
`define FIRE_CSR_TIMEOUT_WIDTH 8 		    		// Width of timeout counter


//#######################################################
// EGL Defines Used in Leveraged DCC and CCC Modules 
//
// Based on Fire version of `defines
//#######################################################


//`define EGL_CSR_ADDR_MAX_WIDTH                          `FIRE_CSR_ADDR_MAX_WIDTH
`define EGL_CSR_CHECK_ADDR_BIT_RANGE                    `FIRE_CSR_CHECK_ADDR_BIT_RANGE
`define EGL_CSR_CHECK_ADDR_WIDTH                        `FIRE_CSR_CHECK_ADDR_WIDTH
`define EGL_CSR_DATA_14_WIDTH                           `FIRE_CSR_DATA_14_WIDTH
`define EGL_CSR_DATA_50_WIDTH                           `FIRE_CSR_DATA_50_WIDTH
`define EGL_CSR_DATA_WIDTH                              `FIRE_CSR_DATA_WIDTH
`define EGL_CSR_HOST_DONE_STATUS_ACCESS_VIO             `FIRE_CSR_HOST_DONE_STATUS_ACCESS_VIO
`define EGL_CSR_HOST_DONE_STATUS_MAP_DONE_TIMEOUT       `FIRE_CSR_HOST_DONE_STATUS_MAP_DONE_TIMEOUT
`define EGL_CSR_HOST_DONE_STATUS_RING_TRANS_ERROR       `FIRE_CSR_HOST_DONE_STATUS_RING_TRANS_ERROR
`define EGL_CSR_HOST_DONE_STATUS_SUCCESS                `FIRE_CSR_HOST_DONE_STATUS_SUCCESS
`define EGL_CSR_HOST_DONE_STATUS_WIDTH                  `FIRE_CSR_HOST_DONE_STATUS_WIDTH
`define EGL_CSR_NON_MUTEABLE_BITS                       `FIRE_CSR_NON_MUTEABLE_BITS
`define EGL_CSR_NON_MUTEABLE_WIDTH                      `FIRE_CSR_NON_MUTEABLE_WIDTH
`define EGL_CSR_PKT_ACC_VIO_BIT                         `FIRE_CSR_PKT_ACC_VIO_BIT
`define EGL_CSR_PKT_ADDR_BITS                           `FIRE_CSR_PKT_ADDR_BITS
`define EGL_CSR_PKT_ADDR_WIDTH                          `FIRE_CSR_PKT_ADDR_WIDTH
`define EGL_CSR_PKT_DATA_14_BIT                         `FIRE_CSR_PKT_DATA_14_BIT
`define EGL_CSR_PKT_DATA_50_BIT                         `FIRE_CSR_PKT_DATA_50_BIT 
`define EGL_CSR_PKT_DONE_BIT                            `FIRE_CSR_PKT_DONE_BIT
`define EGL_CSR_PKT_MAPPED_BIT                          `FIRE_CSR_PKT_MAPPED_BIT
`define EGL_CSR_PKT_RESERVED_BIT                        `FIRE_CSR_PKT_RESERVED_BIT
`define EGL_CSR_PKT_SRC_BUS_BITS                        `FIRE_CSR_PKT_SRC_BUS_BITS
`define EGL_CSR_PKT_SRC_BUS_ID_WIDTH                    `FIRE_CSR_PKT_SRC_BUS_ID_WIDTH
`define EGL_CSR_PKT_VALID_BIT                           `FIRE_CSR_PKT_VALID_BIT
`define EGL_CSR_PKT_WR_BIT                              `FIRE_CSR_PKT_WR_BIT
`define EGL_CSR_RING_WIDTH                              `FIRE_CSR_RING_WIDTH
`define EGL_CSR_SRC_BUS_ID_WIDTH                        `FIRE_CSR_SRC_BUS_ID_WIDTH
`define EGL_CSR_TIMEOUT_WIDTH                           `FIRE_CSR_TIMEOUT_WIDTH         

//-----------------------------------------------------------------------------
//************************ DTL-JBC INTERFACE ************************
//-----------------------------------------------------------------------------
`define FIRE_DTL_PDQ_WDTH        2
`define FIRE_DTL_LPDQ_WDTH       9
`define FIRE_DTL_OVERIDE_WDTH    7

//-----------------------------------------------------------------------------
//************************ EXT Interrupt-JBC INTERFACE ************************
//-----------------------------------------------------------------------------
`define FIRE_EXT_INT_WDTH        40


//-----------------------------------------------------------------------------
//****************************** EBUS-JBC INTERFACE ****************************
//-----------------------------------------------------------------------------
`define FIRE_EBUS_AD_WDTH        8
`define FIRE_EBUS_A_WDTH         8 

//-----------------------------------------------------------------------------
//****************************** GPIO-JBC INTERFACE ****************************
//-----------------------------------------------------------------------------
`define FIRE_GPIO_WDTH        	 4

//-----------------------------------------------------------------------------
//****************************** JTAG-JBC INTERFACE ****************************
//-----------------------------------------------------------------------------
`define FIRE_DEVID_WDTH        	 16

//-----------------------------------------------------------------------------
//****************************** JBC-PLLC INTERFACE ****************************
//-----------------------------------------------------------------------------
`define FIRE_PLL_JIT_WDTH        2
`define FIRE_PLL_CNT_WDTH        2

//-----------------------------------------------------------------------------
//****************************** DMC-JBC INTERFACE ****************************
//-----------------------------------------------------------------------------

//#######################################################
// DMC-to-JBC Interface (D2J)
//#######################################################

// ~~~~~~~~~~ Ingress Command Interface ~~~~~~~~~~~~~~~~~

`define FIRE_D2J_CMD_WDTH        4                      // d2j_cmd[3:0]
`define FIRE_D2J_ADDR_WDTH       `FIRE_PA_MSB - 5       // d2j_addr[42:6]
`define FIRE_D2J_CTAG_WDTH       16                     // d2j_ctag[15:0]

// ~~~~~~~~~~ Ingress Data Interface ~~~~~~~~~~~~~~~~~~~~

`define FIRE_D2J_DATA_WDTH       128    // d2j_data[127:0]
`define FIRE_D2J_BMSK_WDTH       16     // d2j_bmsk[15:0]
`define FIRE_D2J_DPAR_WDTH       5      // d2j_data_par[4:0]

// ~~~~~~~~~~ PIO Wrack Interface ~~~~~~~~~~~~~~~~~~~~~~~

`define FIRE_D2J_P_WRACK_WDTH    4      // d2j_p_wrack_tag[3:0]

// ~~~~~~~~~~ MMU Interface ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`define FIRE_D2J_TSB_BASE_WDTH    `FIRE_PA_MSB - 12      // d2j_tsb_base[42:13]
`define FIRE_D2J_TSB_BASE_BITS    `FIRE_PA_MSB:13
`define FIRE_D2J_TSB_SIZE_WDTH    4                      // d2j_tsb_size[3:0]
`define FIRE_D2J_TSB_SIZE_BITS    3:0

// ~~~~~~~~~~ To JBC Spares ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`define FIRE_D2J_SPARE_WDTH	5	// d2j_spare[4:0]

//#######################################################
// JBC-to-DMC Interface (J2D)
//#######################################################

// ~~~~~~~~~~ CSR Interface~~~~~~~~~~~~~~~~ ~~~~~~~~~~
`define FIRE_J2D_INSTANCE_ID_WDTH 	1      // j2d_instance_id
`define FIRE_J2D_INSTANCE_ID_BITS 	0:0

// ~~~~~~~~~~ Egress DMA/INT Command Interface ~~~~~~~~~~

`define FIRE_J2D_DI_CMD_WDTH     2      // j2d_di_cmd[1:0]
`define FIRE_J2D_DI_CTAG_WDTH    16     // j2d_di_ctag[15:0]

// ~~~~~~~~~~ Egress PIO Command Interface ~~~~~~~~~~~~~~

`define FIRE_J2D_P_CMD_WDTH      4      // j2d_p_cmd[3:0]
`define FIRE_J2D_P_ADDR_WDTH     36     // j2d_p_addr[35:0]
`define FIRE_J2D_P_BMSK_WDTH     16     // j2d_p_bmsk[15:0]
//BP n2 6-01-04 keep bits packed, even though on d2j_ctag there is a 0 inbetween fields
`define FIRE_J2D_P_CTAG_WDTH     11     // j2d_p_ctag[10:0]

// ~~~~~~~~~~ Egress DMA Data Interface ~~~~~~~~~~~~~~~~~

`define FIRE_J2D_D_DATA_WDTH     128    // j2d_d_data[127:0]
`define FIRE_J2D_D_DPAR_WDTH     4      // j2d_d_data_par[3:0]

// ~~~~~~~~~~ Egress PIO Data Interface ~~~~~~~~~~~~~~~~~

`define FIRE_J2D_P_DATA_WDTH     128    // j2d_p_data[127:0]
`define FIRE_J2D_P_DPAR_WDTH     4      // j2d_p_data_par[3:0]

// ~~~~~~~~~~ DMA Wrack Interface ~~~~~~~~~~~~~~~~~~~~~~~

`define FIRE_J2D_D_WRACK_WDTH    4      // j2d_d_wrack_tag[3:0]

// ~~~~~~~~~~ MMU Interface ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`define FIRE_J2D_MMU_ADDR_WDTH   `FIRE_PA_MSB - 5       // j2d_mmu_addr[42:6]
`define FIRE_J2D_MMU_ADDR_BITS   `FIRE_PA_MSB:6

// ~~~~~~~~~~ IMU Interface ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`define FIRE_J2D_EXT_INT_WDTH    	20     // j2d_ext_int_l[19:0]
`define FIRE_J2D_JID_WDTH    		1      // j2d_jid

// ~~~~~~~~~~ To DMC Spares ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`define FIRE_J2D_SPARE_WDTH	5	// j2d_spare[4:0]


//-----------------------------------------------------------------------------
//****************************** DMC-PEC INTERFACE ****************************
//-----------------------------------------------------------------------------

//#######################################################
// Ingress Interface
//#######################################################

// ~~~~~~~~~~ Ingress IHB Interface ~~~~~~~~~~~~~~~~~

`define FIRE_D2P_IHB_PTR_WDTH		7
`define FIRE_D2P_IHB_PTR_BITS		`FIRE_D2P_IHB_PTR_WDTH-1:0

`define FIRE_P2D_IHB_WPTR_WDTH		7
`define FIRE_P2D_IHB_WPTR_BITS		`FIRE_P2D_IHB_WPTR_WDTH-1:0

`define FIRE_D2P_IHB_ADDR_WDTH		6
`define FIRE_D2P_IHB_ADDR_BITS		`FIRE_D2P_IHB_ADDR_WDTH-1:0

`define FIRE_P2D_IHB_DATA_WDTH		128
`define FIRE_P2D_IHB_DATA_BITS		`FIRE_P2D_IHB_DATA_WDTH-1:0

`define FIRE_P2D_IHB_DPAR_WDTH		4
`define FIRE_P2D_IHB_DPAR_BITS		`FIRE_P2D_IHB_DPAR_WDTH-1:0

// ~~~~~~~~~~ Ingress IDB Interface ~~~~~~~~~~~~~~~~~

`define FIRE_D2P_IDB_ADDR_WDTH        8                 // d2p_idb_addr
`define FIRE_D2P_IDB_ADDR_BITS        `FIRE_D2P_IDB_ADDR_WDTH-1:0

`define FIRE_P2D_IDB_DATA_WDTH        128               // p2d_idb_data
`define FIRE_P2D_IDB_DATA_BITS        `FIRE_P2D_IDB_DATA_WDTH-1:0

`define FIRE_P2D_IDB_DPAR_WDTH        4                 // p2d_idb_dpar
`define FIRE_P2D_IDB_DPAR_BITS        `FIRE_P2D_IDB_DPAR_WDTH-1:0

// ~~~~~~~~~~ Ingress IBC Interface ~~~~~~~~~~~~~~~~~

`define FIRE_D2P_IBC_DC_WDTH		12
`define FIRE_D2P_IBC_DC_BITS		`FIRE_D2P_IBC_DC_WDTH-1:0

`define FIRE_D2P_IBC_HC_WDTH		8
`define FIRE_D2P_IBC_HC_BITS		`FIRE_D2P_IBC_HC_WDTH-1:0

`define FIRE_D2P_IBC_NHC_WDTH         8                 // d2p_ibc_nhc
`define FIRE_D2P_IBC_NHC_BITS         `FIRE_D2P_IBC_NHC_WDTH-1:0

`define FIRE_D2P_IBC_PHC_WDTH         8                 // d2p_ibc_phc
`define FIRE_D2P_IBC_PHC_BITS         `FIRE_D2P_IBC_PHC_WDTH-1:0

`define FIRE_D2P_IBC_PDC_WDTH         12                // d2p_ibc_pdc
`define FIRE_D2P_IBC_PDC_BITS         `FIRE_D2P_IBC_PDC_WDTH-1:0

// ~~~~~~~~~~ Ingress CTO Interface ~~~~~~~~~~~~~~~~~

`define FIRE_P2D_CTO_TAG_WDTH         5                 // p2d_cto_tag
`define FIRE_P2D_CTO_TAG_BITS         `FIRE_P2D_CTO_TAG_WDTH-1:0

//#######################################################
// Egress Interface
//#######################################################

// ~~~~~~~~~~ Egress EHB Interface ~~~~~~~~~~~~~~~~~

`define FIRE_D2P_EHB_ADDR_WDTH        6                  // d2p_ehb_addr[5:0]
`define FIRE_D2P_EHB_ADDR_BITS        `FIRE_D2P_EHB_ADDR_WDTH-1:0

`define FIRE_D2P_EHB_DATA_WDTH        128                // d2p_ehb_data[127:0]
`define FIRE_D2P_EHB_DATA_BITS        `FIRE_D2P_EHB_DATA_WDTH-1:0

`define FIRE_D2P_EHB_DPAR_WDTH        4                  // d2p_ehb_dpar[3:0]
`define FIRE_D2P_EHB_DPAR_BITS        `FIRE_D2P_EHB_DPAR_WDTH-1:0

// ~~~~~~~~~~ Egress EDB Interface ~~~~~~~~~~~~~~~~~

`define FIRE_D2P_EDB_ADDR_WDTH        8                  // d2p_edb_addr[7:0]
`define FIRE_D2P_EDB_ADDR_BITS        `FIRE_D2P_EDB_ADDR_WDTH-1:0

`define FIRE_D2P_EDB_DATA_DW4_LSB     0 	
`define FIRE_D2P_EDB_DATA_DW4_WDTH    32 	
`define FIRE_D2P_EDB_DATA_DW4_MSB     `FIRE_D2P_EDB_DATA_DW4_LSB + `FIRE_D2P_EDB_DATA_DW4_WDTH - 1

`define FIRE_D2P_EDB_DATA_DW3_LSB     `FIRE_D2P_EDB_DATA_DW4_LSB + `FIRE_D2P_EDB_DATA_DW4_WDTH 	
`define FIRE_D2P_EDB_DATA_DW3_WDTH    32 	
`define FIRE_D2P_EDB_DATA_DW3_MSB     `FIRE_D2P_EDB_DATA_DW3_LSB + `FIRE_D2P_EDB_DATA_DW3_WDTH - 1

`define FIRE_D2P_EDB_DATA_DW2_LSB     `FIRE_D2P_EDB_DATA_DW3_LSB + `FIRE_D2P_EDB_DATA_DW3_WDTH 	
`define FIRE_D2P_EDB_DATA_DW2_WDTH    32 	
`define FIRE_D2P_EDB_DATA_DW2_MSB     `FIRE_D2P_EDB_DATA_DW2_LSB + `FIRE_D2P_EDB_DATA_DW2_WDTH - 1
 	
`define FIRE_D2P_EDB_DATA_DW1_LSB     `FIRE_D2P_EDB_DATA_DW2_LSB + `FIRE_D2P_EDB_DATA_DW2_WDTH 	
`define FIRE_D2P_EDB_DATA_DW1_WDTH    32 	
`define FIRE_D2P_EDB_DATA_DW1_MSB     `FIRE_D2P_EDB_DATA_DW1_LSB + `FIRE_D2P_EDB_DATA_DW1_WDTH - 1
 
`define FIRE_D2P_EDB_DATA_WDTH        `FIRE_D2P_EDB_DATA_DW1_LSB + `FIRE_D2P_EDB_DATA_DW1_WDTH
`define FIRE_D2P_EDB_DATA_BITS        `FIRE_D2P_EDB_DATA_WDTH-1:0
		 			                 // d2p_edb_data[127:0]
`define FIRE_D2P_EDB_DPAR_WDTH        4                  // d2p_edb_dpar[3:0]
`define FIRE_D2P_EDB_DPAR_BITS        `FIRE_D2P_EDB_DPAR_WDTH-1:0

// ~~~~~~~~~~ Egress CREDIT Interface ~~~~~~~~~~~~~~~~~

`define FIRE_P2D_ECH_RPTR_WDTH        6                  // p2d_ech_rptr[5:0]
`define FIRE_P2D_ECH_RPTR_BITS        `FIRE_P2D_ECH_RPTR_WDTH-1:0

`define FIRE_P2D_ERH_RPTR_WDTH        6                  // p2d_erh_rptr[5:0]
`define FIRE_P2D_ERH_RPTR_BITS        `FIRE_P2D_ERH_RPTR_WDTH-1:0

`define FIRE_D2P_ECH_WPTR_WDTH        6                  // d2p_ech_wptr[5:0]
`define FIRE_D2P_ECH_WPTR_BITS        `FIRE_D2P_ECH_WPTR_WDTH-1:0

`define FIRE_D2P_ERH_WPTR_WDTH        6                  // d2p_erh_wptr[5:0]
`define FIRE_D2P_ERH_WPTR_BITS        `FIRE_D2P_ERH_WPTR_WDTH-1:0

`define FIRE_P2D_ECD_RPTR_WDTH        8                  // p2d_ecd_rptr[7:0]
`define FIRE_P2D_ECD_RPTR_BITS        `FIRE_P2D_ECD_RPTR_WDTH-1:0

`define FIRE_P2D_ERD_RPTR_WDTH        8                  // p2d_erd_rptr[7:0]
`define FIRE_P2D_ERD_RPTR_BITS        `FIRE_P2D_ERD_RPTR_WDTH-1:0

//#######################################################
// Ingress Interface
//#######################################################

//#######################################################
// CSR Interface
//#######################################################

`define FIRE_P2D_MPS_WDTH             3                   // p2d_mps[2:0]
`define FIRE_P2D_MPS_BITS             `FIRE_P2D_MPS_WDTH-1:0

`define FIRE_D2P_CSR_RING_WDTH        96                 // d2p_csr_ring[99:0]
`define FIRE_P2D_CSR_RING_WDTH        96                 // p2d_csr_ring[99:0]

//#######################################################
// DMC<->PEC (ILU<->TLU) spares
//#######################################################

`define FIRE_D2P_SPARE_WDTH	5	// d2p_spare[4:0]
`define FIRE_P2D_SPARE_WDTH	5	// p2d_spare[4:0]


//-----------------------------------------------------------------------------
//********************* DMC-PEC (ILU-TLU) Interface Records *******************
//-----------------------------------------------------------------------------

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// NOTE: In the IHB and EHB defines, 
//       *_4DWH_* represents header byte 12 - 15 in PCIE spec.
//       *_3DWH_* represents header byte 8 - 11 in PCIE spec.
//       *_2DWH_* represents header byte 4 - 7 in PCIE spec.
//       *_1DWH_* represents header byte 0 - 3 in PCIE spec.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//####################################
// Ingress Header Buffer Record (IHB)
// From IHB to DIM
//####################################

`define FIRE_IHB_4DWH_LSB           	0                                               	// Start of Field
`define FIRE_IHB_4DWH_WDTH          	32	                                                // Width of Field
`define FIRE_IHB_4DWH_MSB           	`FIRE_IHB_4DWH_LSB + `FIRE_IHB_4DWH_WDTH -1     	// MSB of Field

`define FIRE_IHB_3DWH_LSB           	`FIRE_IHB_4DWH_LSB + `FIRE_IHB_4DWH_WDTH              	// Start of Field
`define FIRE_IHB_3DWH_WDTH          	32	                                                // Width of Field
`define FIRE_IHB_3DWH_MSB           	`FIRE_IHB_3DWH_LSB + `FIRE_IHB_3DWH_WDTH -1     	// MSB of Field

`define FIRE_IHB_2DWH_LSB           	`FIRE_IHB_3DWH_LSB + `FIRE_IHB_3DWH_WDTH              	// Start of Field
`define FIRE_IHB_2DWH_WDTH          	32	                                                // Width of Field
`define FIRE_IHB_2DWH_MSB           	`FIRE_IHB_2DWH_LSB + `FIRE_IHB_2DWH_WDTH -1     	// MSB of Field

`define FIRE_IHB_1DWH_LSB           	`FIRE_IHB_2DWH_LSB + `FIRE_IHB_2DWH_WDTH              	// Start of Field
`define FIRE_IHB_1DWH_WDTH          	32	                                                // Width of Field
`define FIRE_IHB_1DWH_MSB           	`FIRE_IHB_1DWH_LSB + `FIRE_IHB_1DWH_WDTH -1     	// MSB of Field

`define FIRE_IHB_REC_WDTH           	`FIRE_IHB_1DWH_LSB + `FIRE_IHB_1DWH_WDTH       		// Complete Record Width


//####################################
// Egress Header Buffer Record (EHB)
// From DEM to EHB
//####################################

`define FIRE_EHB_4DWH_LSB           	0                                                	// Start of Field
`define FIRE_EHB_4DWH_WDTH          	32	                                                // Width of Field
`define FIRE_EHB_4DWH_MSB           	`FIRE_EHB_4DWH_LSB + `FIRE_EHB_4DWH_WDTH -1     	// MSB of Field

`define FIRE_EHB_3DWH_LSB           	`FIRE_EHB_4DWH_LSB + `FIRE_EHB_4DWH_WDTH              	// Start of Field
`define FIRE_EHB_3DWH_WDTH          	32	                                                // Width of Field
`define FIRE_EHB_3DWH_MSB           	`FIRE_EHB_3DWH_LSB + `FIRE_EHB_3DWH_WDTH -1     	// MSB of Field

`define FIRE_EHB_2DWH_LSB           	`FIRE_EHB_3DWH_LSB + `FIRE_EHB_3DWH_WDTH              	// Start of Field
`define FIRE_EHB_2DWH_WDTH          	32	                                                // Width of Field
`define FIRE_EHB_2DWH_MSB           	`FIRE_EHB_2DWH_LSB + `FIRE_EHB_2DWH_WDTH -1     	// MSB of Field

`define FIRE_EHB_1DWH_LSB           	`FIRE_EHB_2DWH_LSB + `FIRE_EHB_2DWH_WDTH              	// Start of Field
`define FIRE_EHB_1DWH_WDTH          	32	                                                // Width of Field
`define FIRE_EHB_1DWH_MSB           	`FIRE_EHB_1DWH_LSB + `FIRE_EHB_1DWH_WDTH -1     	// MSB of Field

`define FIRE_EHB_REC_WDTH           	`FIRE_EHB_1DWH_LSB + `FIRE_EHB_1DWH_WDTH       		// Complete Record Width

//#######################################################
// PCI Express
//#######################################################

`define FIRE_PCIE_HDR_FMT_BITS		126:125
`define FIRE_PCIE_HDR_TYPE_BITS		124:120
`define FIRE_PCIE_HDR_TC_BITS		118:116
`define FIRE_PCIE_HDR_TD_BITS		111
`define FIRE_PCIE_HDR_EP_BITS		110
`define FIRE_PCIE_HDR_LEN_BITS		105:96
`define FIRE_PCIE_HDR_MSG_BITS		71:64

`define FIRE_PCIE_FMT_WDTH		2
`define FIRE_PCIE_FMT_BITS		`FIRE_PCIE_FMT_WDTH-1:0

`define FIRE_PCIE_TYPE_WDTH		5
`define FIRE_PCIE_TYPE_BITS		`FIRE_PCIE_TYPE_WDTH-1:0

`define FIRE_PCIE_TC_WDTH		3
`define FIRE_PCIE_TC_BITS		`FIRE_PCIE_TC_WDTH-1:0

`define FIRE_PCIE_LEN_WDTH		10
`define FIRE_PCIE_LEN_BITS		`FIRE_PCIE_LEN_WDTH-1:0

`define FIRE_PCIE_MSG_WDTH		8
`define FIRE_PCIE_MSG_BITS		`FIRE_PCIE_MSG_WDTH-1:0

`define FIRE_PCIE_BUS_NUM_WDTH		8
`define FIRE_PCIE_BUS_NUM_BITS		`FIRE_PCIE_BUS_NUM_WDTH-1:0

`define FIRE_PCIE_REQ_ID_WDTH		16
`define FIRE_PCIE_REQ_ID_BITS		`FIRE_PCIE_REQ_ID_WDTH-1:0
