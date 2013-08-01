/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_dmc_reg_defines.h
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

`ifdef NEPTUNE
`define NO_OF_DMAS 24
`else
`define NO_OF_DMAS 16
`endif
// `define PTR_WIDTH 19
// `define PTR_WIDTH_PLUS1 20
// `define RNG_LENGTH_WIDTH 16

`define PTR_WIDTH 16
`define PTR_WIDTH_PLUS1 17
`define RNG_LENGTH_WIDTH 13

// OFFSET for the cache ram
   `define DMA0_Cache_OFFSET 8'h00
   `define DMA1_Cache_OFFSET 8'h08
   `define DMA2_Cache_OFFSET 8'h10
   `define DMA3_Cache_OFFSET 8'h18
   `define DMA4_Cache_OFFSET 8'h20
   `define DMA5_Cache_OFFSET 8'h28
   `define DMA6_Cache_OFFSET 8'h30
   `define DMA7_Cache_OFFSET 8'h38
   `define DMA8_Cache_OFFSET 8'h40
   `define DMA9_Cache_OFFSET 8'h48
   `define DMA10_Cache_OFFSET 8'h50
   `define DMA11_Cache_OFFSET 8'h58
   `define DMA12_Cache_OFFSET 8'h60
   `define DMA13_Cache_OFFSET 8'h68
   `define DMA14_Cache_OFFSET 8'h70
   `define DMA15_Cache_OFFSET 8'h78
   `define DMA16_Cache_OFFSET 8'h80
   `define DMA17_Cache_OFFSET 8'h88
   `define DMA18_Cache_OFFSET 8'h90
   `define DMA19_Cache_OFFSET 8'h98
   `define DMA20_Cache_OFFSET 8'hA0
   `define DMA21_Cache_OFFSET 8'hA8
   `define DMA22_Cache_OFFSET 8'hB0
   `define DMA23_Cache_OFFSET 8'hB8
   `define DMA24_Cache_OFFSET 8'hC0
   `define DMA25_Cache_OFFSET 8'hC8
   `define DMA26_Cache_OFFSET 8'hD0
   `define DMA27_Cache_OFFSET 8'hD8
   `define DMA28_Cache_OFFSET 8'hE0
   `define DMA29_Cache_OFFSET 8'hE8
   `define DMA30_Cache_OFFSET 8'hF0 
   `define DMA31_Cache_OFFSET 8'hF8 


// ERROR CODE Definations for ERROR LOG

`define ERR_CODE_PKT_SIZE_ERR 3'b110
`define ERR_CODE_PREF_BUF_PAR_ERR 3'b100
`define ERR_CODE_TX_RING_OFLOW 3'b101
`define ERR_CODE_NACK_PREF 3'b011
`define ERR_CODE_NACK_PKT_RD 3'b010
`define ERR_CODE_CONF_PART_ERR 3'b001
`define ERR_CODE_PKT_PART_ERR 3'b000


`define RESP_ERROR 8'hff

`define DMC_DMA0_SPACE         11'h200
`define DMC_DMA1_SPACE         11'h201
`define DMC_DMA2_SPACE         11'h202
`define DMC_DMA3_SPACE         11'h203
`define DMC_DMA4_SPACE         11'h204
`define DMC_DMA5_SPACE         11'h205
`define DMC_DMA6_SPACE         11'h206
`define DMC_DMA7_SPACE         11'h207
`define DMC_DMA8_SPACE         11'h208
`define DMC_DMA9_SPACE         11'h209
`define DMC_DMA10_SPACE        11'h20A
`define DMC_DMA11_SPACE        11'h20B
`define DMC_DMA12_SPACE        11'h20C
`define DMC_DMA13_SPACE        11'h20D
`define DMC_DMA14_SPACE        11'h20E
`define DMC_DMA15_SPACE        11'h20F
`define DMC_DMA16_SPACE        11'h210
`define DMC_DMA17_SPACE        11'h211
`define DMC_DMA18_SPACE        11'h212
`define DMC_DMA19_SPACE        11'h213
`define DMC_DMA20_SPACE        11'h214
`define DMC_DMA21_SPACE        11'h215
`define DMC_DMA22_SPACE        11'h216
`define DMC_DMA23_SPACE        11'h217
`define DMC_DMA24_SPACE        11'h218
`define DMC_DMA25_SPACE        11'h219
`define DMC_DMA26_SPACE        11'h21A
`define DMC_DMA27_SPACE        11'h21B
`define DMC_DMA28_SPACE        11'h21C
`define DMC_DMA29_SPACE        11'h21D
`define DMC_DMA30_SPACE        11'h21E
`define DMC_DMA31_SPACE        11'h21F

`define TDMC_RSVD              11'h220


`define DMC_DMA_RSV_SPACE      9'h070

`define TX_ADDR_MD 	20'h45000
`define TX_CACHE_PAR_CORRUPT 	20'h45040
`define TDMC_DEBUG_SELECT 20'h45080
`define TDMC_TRAINING_VECTOR 20'h45088

`define TDMC_MEM_ADDR  20'h45090
`define TDMC_MEM_DATA0 20'h45098
`define TDMC_MEM_DATA1 20'h450A0
`define TDMC_MEM_DATA2 20'h450A8
`define TDMC_MEM_DATA3 20'h450B0
`define TDMC_MEM_DATA4 20'h450B8

// DMA_0 Defines

`define TXDMA_RNG_CFIG_DMA0   9'h000
`define TXDMA_RNG_CFIG_DMA0_H 9'h004

`define TXDMA_RNG_HDH_DMA0    9'h008
`define TXDMA_RNG_HDL_DMA0    9'h010
`define TXDMA_RING_KICK_DMA0  9'h018
`define TXDMA_ENT_MASK_DMA0   9'h020

`define TXDMA_CS_DMA0         9'h028
`define TXDMA_CS_DMA0_H       9'h02C

`define TXDMA_MBH_DMA0        9'h030
`define TXDMA_MBL_DMA0        9'h038
`define TXDMA_ST_DMA0         9'h040
`define TXDMA_RNG_ERR_LOGH_DMA0 9'h048
`define TXDMA_RNG_ERR_LOGL_DMA0 9'h050
`define TXDMA_INTR_DBG_DMA0 9'h060
`define TXDMA_CS_DBG_DMA0 9'h068
`define SHTXDMA_RNG_ERR_LOGL_DMA0 9'h068
`define TXDMA_DUMMY0_DMA0     9'h070
`define TXDMA_DUMMY1_DMA0     9'h078
`define TXDMA_DUMMY2_DMA0     9'h080
`define TXDMA_DUMMY3_DMA0     9'h088
`define TXDMA_DUMMY4_DMA0     9'h090
`define TXDMA_DUMMY5_DMA0     9'h098
`define TXDMA_DUMMY6_DMA0     9'h0A0
`define TXDMA_DUMMY7_DMA0     9'h0A8
`define TXDMA_DUMMY8_DMA0     9'h0B0
`define TXDMA_DUMMY9_DMA0     9'h0B8


// FZC DEFINES
`define TXDMA_LOG_PAGE_VLD_DMA0  9'h000
`define TXDMA_LOG_PAGE_MASK0_DMA0 9'h008
`define TXDMA_LOG_PAGE_VALUE0_DMA0 9'h010
`define TXDMA_LOG_PAGE_MASK1_DMA0 9'h018
`define TXDMA_LOG_PAGE_VALUE1_DMA0 9'h020
`define TXDMA_LOG_PAGE_RELOC0_DMA0 9'h028
`define TXDMA_LOG_PAGE_RELOC1_DMA0 9'h030
`define TXDMA_LOG_PAGE_HANDLE_DMA0 9'h038

// DMA_1 Defines

`define TXDMA_RNG_CFIG_DMA1   9'h000
`define TXDMA_RNG_CFIG_DMA1_H 9'h004

`define TXDMA_RNG_HDH_DMA1    9'h008
`define TXDMA_RNG_HDL_DMA1    9'h010
`define TXDMA_RING_KICK_DMA1  9'h018
`define TXDMA_ENT_MASK_DMA1   9'h020

`define TXDMA_CS_DMA1         9'h028
`define TXDMA_CS_DMA1_H       9'h02c

`define TXDMA_MBH_DMA1        9'h030
`define TXDMA_MBL_DMA1        9'h038
`define TXDMA_ST_DMA1         9'h040
`define TXDMA_RNG_ERR_LOGH_DMA1 9'h048
`define TXDMA_RNG_ERR_LOGL_DMA1 9'h050
`define TXDMA_INTR_DBG_DMA1 9'h060
`define TXDMA_CS_DBG_DMA1 9'h068
`define SHTXDMA_RNG_ERR_LOGL_DMA1 9'h068
`define TXDMA_DUMMY0_DMA1     9'h070
`define TXDMA_DUMMY1_DMA1     9'h078
`define TXDMA_DUMMY2_DMA1     9'h080
`define TXDMA_DUMMY3_DMA1     9'h088
`define TXDMA_DUMMY4_DMA1     9'h090
`define TXDMA_DUMMY5_DMA1     9'h098
`define TXDMA_DUMMY6_DMA1     9'h0A0
`define TXDMA_DUMMY7_DMA1     9'h0A8
`define TXDMA_DUMMY8_DMA1     9'h0B0
`define TXDMA_DUMMY9_DMA1     9'h0B8


// FZC DEFINES
`define TXDMA_LOG_PAGE_VLD_DMA1  9'h000
`define TXDMA_LOG_PAGE_MASK0_DMA1 9'h008
`define TXDMA_LOG_PAGE_VALUE0_DMA1 9'h010
`define TXDMA_LOG_PAGE_MASK1_DMA1 9'h018
`define TXDMA_LOG_PAGE_VALUE1_DMA1 9'h020
`define TXDMA_LOG_PAGE_RELOC0_DMA1 9'h028
`define TXDMA_LOG_PAGE_RELOC1_DMA1 9'h030
`define TXDMA_LOG_PAGE_HANDLE_DMA1 9'h038

// DMA_2 Defines

`define TXDMA_RNG_CFIG_DMA2   9'h000
`define TXDMA_RNG_CFIG_DMA2_H 9'h004

`define TXDMA_RNG_HDH_DMA2    9'h008
`define TXDMA_RNG_HDL_DMA2    9'h010
`define TXDMA_RING_KICK_DMA2  9'h018
`define TXDMA_ENT_MASK_DMA2   9'h020

`define TXDMA_CS_DMA2         9'h028
`define TXDMA_CS_DMA2_H       9'h02c

`define TXDMA_MBH_DMA2        9'h030
`define TXDMA_MBL_DMA2        9'h038
`define TXDMA_ST_DMA2         9'h040
`define TXDMA_RNG_ERR_LOGH_DMA2 9'h048
`define TXDMA_RNG_ERR_LOGL_DMA2 9'h050
`define TXDMA_INTR_DBG_DMA2 9'h060
`define TXDMA_CS_DBG_DMA2 9'h068
`define SHTXDMA_RNG_ERR_LOGL_DMA2 9'h068
`define TXDMA_DUMMY0_DMA2     9'h070
`define TXDMA_DUMMY1_DMA2     9'h078
`define TXDMA_DUMMY2_DMA2     9'h080
`define TXDMA_DUMMY3_DMA2     9'h088
`define TXDMA_DUMMY4_DMA2     9'h090
`define TXDMA_DUMMY5_DMA2     9'h098
`define TXDMA_DUMMY6_DMA2     9'h0A0
`define TXDMA_DUMMY7_DMA2     9'h0A8
`define TXDMA_DUMMY8_DMA2     9'h0B0
`define TXDMA_DUMMY9_DMA2     9'h0B8


// FZC DEFINES
`define TXDMA_LOG_PAGE_VLD_DMA2  9'h000
`define TXDMA_LOG_PAGE_MASK0_DMA2 9'h008
`define TXDMA_LOG_PAGE_VALUE0_DMA2 9'h010
`define TXDMA_LOG_PAGE_MASK1_DMA2 9'h018
`define TXDMA_LOG_PAGE_VALUE1_DMA2 9'h020
`define TXDMA_LOG_PAGE_RELOC0_DMA2 9'h028
`define TXDMA_LOG_PAGE_RELOC1_DMA2 9'h030
`define TXDMA_LOG_PAGE_HANDLE_DMA2 9'h038

// DMA_3 Defines

`define TXDMA_RNG_CFIG_DMA3   9'h000
`define TXDMA_RNG_CFIG_DMA3_H 9'h004

`define TXDMA_RNG_HDH_DMA3    9'h008
`define TXDMA_RNG_HDL_DMA3    9'h010
`define TXDMA_RING_KICK_DMA3  9'h018
`define TXDMA_ENT_MASK_DMA3   9'h020

`define TXDMA_CS_DMA3         9'h028
`define TXDMA_CS_DMA3_H         9'h02c

`define TXDMA_MBH_DMA3        9'h030
`define TXDMA_MBL_DMA3        9'h038
`define TXDMA_ST_DMA3         9'h040
`define TXDMA_RNG_ERR_LOGH_DMA3 9'h048
`define TXDMA_RNG_ERR_LOGL_DMA3 9'h050
`define TXDMA_INTR_DBG_DMA3 9'h060
`define TXDMA_CS_DBG_DMA3 9'h068
`define SHTXDMA_RNG_ERR_LOGL_DMA3 9'h068
`define TXDMA_DUMMY0_DMA3     9'h070
`define TXDMA_DUMMY1_DMA3     9'h078
`define TXDMA_DUMMY2_DMA3     9'h080
`define TXDMA_DUMMY3_DMA3     9'h088
`define TXDMA_DUMMY4_DMA3     9'h090
`define TXDMA_DUMMY5_DMA3     9'h098
`define TXDMA_DUMMY6_DMA3     9'h0A0
`define TXDMA_DUMMY7_DMA3     9'h0A8
`define TXDMA_DUMMY8_DMA3     9'h0B0
`define TXDMA_DUMMY9_DMA3     9'h0B8


// FZC DEFINES
`define TXDMA_LOG_PAGE_VLD_DMA3  9'h000
`define TXDMA_LOG_PAGE_MASK0_DMA3 9'h008
`define TXDMA_LOG_PAGE_VALUE0_DMA3 9'h010
`define TXDMA_LOG_PAGE_MASK1_DMA3 9'h018
`define TXDMA_LOG_PAGE_VALUE1_DMA3 9'h020
`define TXDMA_LOG_PAGE_RELOC0_DMA3 9'h028
`define TXDMA_LOG_PAGE_RELOC1_DMA3 9'h030
`define TXDMA_LOG_PAGE_HANDLE_DMA3 9'h038

// Debug port selects
`define TDMC_CACHE_FETCH_STATE 6'h1
`define TDMC_MBOX_STATE	       6'h2

`define TDMC_DMA0_DEBUG_SEL 6'd3
`define TDMC_DMA1_DEBUG_SEL 6'd4
`define TDMC_DMA2_DEBUG_SEL 6'd5
`define TDMC_DMA3_DEBUG_SEL 6'd6
`define TDMC_DMA4_DEBUG_SEL 6'd7
`define TDMC_DMA5_DEBUG_SEL 6'd8
`define TDMC_DMA6_DEBUG_SEL 6'd9
`define TDMC_DMA7_DEBUG_SEL 6'd10
`define TDMC_DMA8_DEBUG_SEL 6'd11
`define TDMC_DMA9_DEBUG_SEL 6'd12
`define TDMC_DMA10_DEBUG_SEL 6'd13
`define TDMC_DMA11_DEBUG_SEL 6'd14
`define TDMC_DMA12_DEBUG_SEL 6'd15
`define TDMC_DMA13_DEBUG_SEL 6'd16
`define TDMC_DMA14_DEBUG_SEL 6'd17
`define TDMC_DMA15_DEBUG_SEL 6'd18
`define TDMC_DMA16_DEBUG_SEL 6'd19
`define TDMC_DMA17_DEBUG_SEL 6'd20
`define TDMC_DMA18_DEBUG_SEL 6'd21
`define TDMC_DMA19_DEBUG_SEL 6'd22
`define TDMC_DMA20_DEBUG_SEL 6'd23
`define TDMC_DMA21_DEBUG_SEL 6'd24
`define TDMC_DMA22_DEBUG_SEL 6'd25
`define TDMC_DMA23_DEBUG_SEL 6'd26

`define TDMC_TRAINING_SET      6'h3E
`define TDMC_TRAINING_LOAD     6'h3F
//






