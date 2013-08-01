// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: peu_defines.hpp
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
#ifndef INC_peu_defines_hpp__
#define INC_peu_defines_hpp__

//-----------------------------------------------------------------------------
//****************************** GLOBAL CONSTANTS *****************************
//-----------------------------------------------------------------------------

#define PA_MSB  		42		// Physical address MSB

#define DEBUG_WDTH		8 		// Width of the Debug Ports
#define DBG_DATA_BITS	7,0 		// Debug data bits

#define PRF_ADDR_BITS	7,0
#define PRF_DATA_BITS	63,0

//-----------------------------------------------------------------------------
//******************************** CSR INTERFACE ******************************
//-----------------------------------------------------------------------------

#define CSR_ADDR_WDTH	27
#define CSR_ADDR_BITS	26,0
#define CSR_DATA_WDTH	64
#define CSR_DATA_BITS	63,0
#define CSR_RDMS_BITS	63,32
#define CSR_RDLS_BITS	31,0

#define CSR_CMND_WDTH	3
#define CSR_CMND_BITS	2,0
#define CSR_SRCB_WDTH	2
#define CSR_SRCB_BITS	1,0
#define CSR_STTS_BITS	2,0
#define CSR_TOUT_BITS	7,0

#define CSR_RING_WDTH	32
#define CSR_RING_BITS	CSR_RING_WDTH-1,0

#define CSR_PCKT_WDTH	96
#define CSR_PCKT_BITS	CSR_PCKT_WDTH-1,0

#define CSR_CMND_IDLE	0x0
#define CSR_CMND_RSET	0x1
#define CSR_CMND_RREQ	0x2
#define CSR_CMND_WREQ	0x3
#define CSR_CMND_RRSP	0x4
#define CSR_CMND_WRSP	0x5
#define CSR_CMND_RERR	0x6
#define CSR_CMND_WERR	0x7

#define CSR_PCKT_CMND_BITS	95,93
#define CSR_PCKT_ADDR_BITS	95,64
#define CSR_PCKT_RDMS_BITS	63,32
#define CSR_PCKT_RDLS_BITS	31,0

#define CSR_RING_CMND_BITS	31,29
#define CSR_RING_WRIT_BITS	29
#define CSR_RING_SRCB_BITS	28,27
#define CSR_RING_ADDR_BITS	CSR_ADDR_BITS

#define CSR_SRCB_JTAG	0
#define CSR_SRCB_SLOW	1
#define CSR_SRCB_MEDM	2
#define CSR_SRCB_FAST	3

//#######################################################
// Ingress Interface
//#######################################################

// ~~~~~~~~~~ Ingress IHB Interface ~~~~~~~~~~~~~~~~~

#define D2P_IHB_PTR_WDTH		7
#define D2P_IHB_PTR_BITS		D2P_IHB_PTR_WDTH-1,0

#define P2D_IHB_WPTR_WDTH		7
#define P2D_IHB_WPTR_BITS		P2D_IHB_WPTR_WDTH-1,0

#define D2P_IHB_ADDR_WDTH		6
#define D2P_IHB_ADDR_BITS		D2P_IHB_ADDR_WDTH-1,0
#define IHB_BUF_SIZE 			64	

#define P2D_IHB_DATA_WDTH		128
#define P2D_IHB_DATA_BITS		P2D_IHB_DATA_WDTH-1,0

#define P2D_IHB_DPAR_WDTH		4
#define P2D_IHB_DPAR_BITS		P2D_IHB_DPAR_WDTH-1,0

// ~~~~~~~~~~ Ingress IDB Interface ~~~~~~~~~~~~~~~~~

#define D2P_IDB_ADDR_WDTH        8                 // d2p_idb_addr
#define D2P_IDB_ADDR_BITS        D2P_IDB_ADDR_WDTH-1,0
#define IDB_BUF_SIZE			 256

#define P2D_IDB_DATA_WDTH        128               // p2d_idb_data
#define P2D_IDB_DATA_BITS        P2D_IDB_DATA_WDTH-1,0

#define P2D_IDB_DPAR_WDTH        4                 // p2d_idb_dpar
#define P2D_IDB_DPAR_BITS        P2D_IDB_DPAR_WDTH-1,0

// ~~~~~~~~~~ Ingress IBC Interface ~~~~~~~~~~~~~~~~~

#define D2P_IBC_DC_WDTH		12
#define D2P_IBC_DC_BITS		D2P_IBC_DC_WDTH-1,0

#define D2P_IBC_HC_WDTH		8
#define D2P_IBC_HC_BITS		D2P_IBC_HC_WDTH-1,0

#define D2P_IBC_NHC_WDTH         8                 // d2p_ibc_nhc
#define D2P_IBC_NHC_BITS         D2P_IBC_NHC_WDTH-1,0

#define D2P_IBC_PHC_WDTH         8                 // d2p_ibc_phc
#define D2P_IBC_PHC_BITS         D2P_IBC_PHC_WDTH-1,0

#define D2P_IBC_PDC_WDTH         12                // d2p_ibc_pdc
#define D2P_IBC_PDC_BITS         D2P_IBC_PDC_WDTH-1,0

// ~~~~~~~~~~ Ingress CTO Interface ~~~~~~~~~~~~~~~~~

#define P2D_CTO_TAG_WDTH         5                 // p2d_cto_tag
#define P2D_CTO_TAG_BITS         P2D_CTO_TAG_WDTH-1,0

//#######################################################
// Egress Interface
//#######################################################

// ~~~~~~~~~~ Egress EHB Interface ~~~~~~~~~~~~~~~~~

#define D2P_EHB_ADDR_WDTH        6                  // d2p_ehb_addr[5:0]
#define D2P_EHB_ADDR_BITS        D2P_EHB_ADDR_WDTH-1,0
#define EHB_BUF_SIZE			 64

#define D2P_EHB_DATA_WDTH        128                // d2p_ehb_data[127:0]
#define D2P_EHB_DATA_BITS        D2P_EHB_DATA_WDTH-1,0

#define D2P_EHB_DPAR_WDTH        4                  // d2p_ehb_dpar[3,0]
#define D2P_EHB_DPAR_BITS        D2P_EHB_DPAR_WDTH-1,0

// ~~~~~~~~~~ Egress EDB Interface ~~~~~~~~~~~~~~~~~

#define D2P_EDB_ADDR_WDTH        8                  // d2p_edb_addr[7:0]
#define D2P_EDB_ADDR_BITS        D2P_EDB_ADDR_WDTH-1,0
#define EDB_BUF_SIZE			 256

#define D2P_EDB_DATA_DW4_LSB     0 	
#define D2P_EDB_DATA_DW4_WDTH    32 	
#define D2P_EDB_DATA_DW4_MSB     D2P_EDB_DATA_DW4_LSB + D2P_EDB_DATA_DW4_WDTH - 1

#define D2P_EDB_DATA_DW3_LSB     D2P_EDB_DATA_DW4_LSB + D2P_EDB_DATA_DW4_WDTH 	
#define D2P_EDB_DATA_DW3_WDTH    32 	
#define D2P_EDB_DATA_DW3_MSB     D2P_EDB_DATA_DW3_LSB + D2P_EDB_DATA_DW3_WDTH - 1

#define D2P_EDB_DATA_DW2_LSB     D2P_EDB_DATA_DW3_LSB + D2P_EDB_DATA_DW3_WDTH 	
#define D2P_EDB_DATA_DW2_WDTH    32 	
#define D2P_EDB_DATA_DW2_MSB     D2P_EDB_DATA_DW2_LSB + D2P_EDB_DATA_DW2_WDTH - 1
 	
#define D2P_EDB_DATA_DW1_LSB     D2P_EDB_DATA_DW2_LSB + D2P_EDB_DATA_DW2_WDTH 	
#define D2P_EDB_DATA_DW1_WDTH    32 	
#define D2P_EDB_DATA_DW1_MSB     D2P_EDB_DATA_DW1_LSB + D2P_EDB_DATA_DW1_WDTH - 1
 
#define D2P_EDB_DATA_WDTH        D2P_EDB_DATA_DW1_LSB + D2P_EDB_DATA_DW1_WDTH
#define D2P_EDB_DATA_BITS        D2P_EDB_DATA_WDTH-1,0
		 			                 // d2p_edb_data[127:0]
#define D2P_EDB_DPAR_WDTH        4                  // d2p_edb_dpar[3:0]
#define D2P_EDB_DPAR_BITS        D2P_EDB_DPAR_WDTH-1,0

// ~~~~~~~~~~ Egress CREDIT Interface ~~~~~~~~~~~~~~~~~

#define P2D_EHB_ADDR_WDTH		 6

#define P2D_ECH_ADDR_WDTH		 6
#define P2D_ECH_RPTR_WDTH        6                  // p2d_ech_rptr[5:0]
#define P2D_ECH_RPTR_BITS        P2D_ECH_RPTR_WDTH-1,0

#define P2D_ERH_ADDR_WDTH		 6
#define P2D_ERH_RPTR_WDTH        6                  // p2d_erh_rptr[5:0]
#define P2D_ERH_RPTR_BITS        P2D_ERH_RPTR_WDTH-1,0

#define D2P_ECH_WPTR_WDTH        6                  // d2p_ech_wptr[5:0]
#define D2P_ECH_WPTR_BITS        D2P_ECH_WPTR_WDTH-1,0

#define D2P_ERH_WPTR_WDTH        6                  // d2p_erh_wptr[5:0]
#define D2P_ERH_WPTR_BITS        D2P_ERH_WPTR_WDTH-1,0

#define P2D_EDB_ADDR_WDTH		 7

#define P2D_ECD_ADDR_WDTH		 7
#define P2D_ECD_RPTR_WDTH        8                  // p2d_ecd_rptr[7:0]
#define P2D_ECD_RPTR_BITS        P2D_ECD_RPTR_WDTH-1,0

#define P2D_ERD_ADDR_WDTH		 7
#define P2D_ERD_RPTR_WDTH        8                  // p2d_erd_rptr[7:0]
#define P2D_ERD_RPTR_BITS        P2D_ERD_RPTR_WDTH-1,0


//#######################################################
// Ingress Interface
//#######################################################

//#######################################################
// CSR Interface
//#######################################################

#define P2D_MPS_WDTH             3                   // p2d_mps[2:0]
#define P2D_MPS_BITS             P2D_MPS_WDTH-1:0

#define D2P_CSR_RING_WDTH        96                 // d2p_csr_ring[99:0]
#define P2D_CSR_RING_WDTH        96                 // p2d_csr_ring[99:0]

//#######################################################
// DMC<->PEC (ILU<->TLU) spares
//#######################################################

#define D2P_SPARE_WDTH	5	// d2p_spare[4:0]
#define P2D_SPARE_WDTH	5	// p2d_spare[4:0]



//#######################################################
// PCI Express
//#######################################################

#define PCIE_HDR_FMT_BITS		126,125
#define PCIE_HDR_TYPE_BITS		124,120
#define PCIE_HDR_TC_BITS		118,116
#define PCIE_HDR_TD_BITS		111
#define PCIE_HDR_EP_BITS		110
#define PCIE_HDR_LEN_BITS		105,96
#define PCIE_HDR_MSG_BITS		71,64

#define PCIE_FMT_WDTH		2
#define PCIE_FMT_BITS		PCIE_FMT_WDTH-1,0

#define PCIE_TYPE_WDTH		5
#define PCIE_TYPE_BITS		PCIE_TYPE_WDTH-1,0

#define PCIE_TC_WDTH		3
#define PCIE_TC_BITS		PCIE_TC_WDTH-1,0

#define PCIE_LEN_WDTH		10
#define PCIE_LEN_BITS		PCIE_LEN_WDTH-1,0

#define PCIE_MSG_WDTH		8
#define PCIE_MSG_BITS		PCIE_MSG_WDTH-1,0

#define PCIE_BUS_NUM_WDTH		8
#define PCIE_BUS_NUM_BITS		PCIE_BUS_NUM_WDTH-1,0

#define PCIE_REQ_ID_WDTH		16
#define PCIE_REQ_ID_BITS		PCIE_REQ_ID_WDTH-1,0


#endif //INC_peu_defines_hpp__
