/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: xmac.h
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
/*%W%	%G%*/

/*************************************************************************
 *
 * File Name    : xmac.h
 * Author Name  : John Lo
 * Description  : 
 * Parent Module: none
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 7/18/00
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

`define POWER             1'b1
`define GROUND            1'b0

`define BUS10BIT          9:0
`define BUS12BIT         11:0
`define BUS16BIT         15:0
`define BUS64BIT         63:0
`define BUS72BIT         71:0
`define BUS128BIT       127:0
`define BUS144BIT       143:0
  
`define  BYTE             7:0 
`define  BYTE0            7:0 
`define  BYTE1           15:8
`define  BYTE2           23:16
`define  BYTE3           31:24
`define  BYTE4           39:32
`define  BYTE5           47:40
`define  BYTE6           55:48
`define  BYTE7           63:56
`define  BYTE8           71:64
`define  BYTE9           79:72
`define  BYTE10          87:80
`define  BYTE11          95:88
`define  BYTE12         103:96
`define  BYTE13         111:104
`define  BYTE14         119:112
`define  BYTE15         127:120
`define  BYTE16         135:128
`define  BYTE17         143:136
`define  BYTE18         151:144
`define  BYTE19         159:152
`define  NIB             3:0
`define  NIB0            3:0
`define  NIB1            7:4
`define  I               8'h07
`define  S               8'hFB
`define  T               8'hFD
`define  E               8'hFE
`define  SEQ             8'h9C
`define  SFD_MII         8'h5D                          
`define  SFD_GMII        8'hD5                          
`define  SIGNED_BYTE     8:0
`define  SIGN_BIT        8
`define  FOUR_CRC_BYTES  4
`define  MERGE_A_B       1:0
`define  CREDIT_BIAS     12
`define  DBYTE           15:0    // double bytes
`define  DBYTE_WIDTH     16    // double bytes
`define  QBYTE           31:0    // quad   bytes
`define  TBITS           22:0    // 
`define  TBITS_WIDTH     23      // 
`define  REMOTE_FAULT_SEQ {8'h02,8'h00,8'h00,`SEQ,8'h02,8'h00,8'h00,`SEQ} 

// ***********************
// * Mac host info table *
// ***********************
// * mode host_id def_qpn*
// ***********************

// 2'b00(2),mac_addr_index(6),def_QP(8),mode_bit,local_cpu,ph_bit,mu_bit 
// total 20 bits

`define  H_INFO_WIDTH    18       // perfect match register width
`define  H_INFO          `H_INFO_WIDTH - 1 : 0 
`define  MAC_CTRL_WIDTH  `H_INFO_WIDTH + 2
`define  MAC_CTRL        `H_INFO_WIDTH + 1 : 0 

// ***********************
// * Mac pio intf     
// ***********************

`define  XMAC0_ADDR_OFFSET    4'h0
`define  XPCS0_ADDR_OFFSET    4'h1
`define  PCS0_ADDR_OFFSET     4'h2
`define  XMAC1_ADDR_OFFSET    4'h3
`define  XPCS1_ADDR_OFFSET    4'h4
`define  PCS1_ADDR_OFFSET     4'h5
`define  BMAC2_ADDR_OFFSET    4'h6
`define  PCS2_ADDR_OFFSET     4'h7
`define  BMAC3_ADDR_OFFSET    4'h8
`define  PCS3_ADDR_OFFSET     4'h9
`define  ESR_ADDR_OFFSET      4'ha
`define  MIF_ADDR_OFFSET      4'hb

// *********************************
// * 20to10 and 10to20 conversion     
// *********************************
`define  X2WD                 19:0
`define  X2WD0                19:0
`define  X2WD1                39:20
`define  X2WD2                59:40
`define  X2WD3                79:60

`define  X1WD                  9:0
`define  X1WD0                 9:0
`define  X1WD1                19:10
`define  X1WD2                29:20
`define  X1WD3                39:30

`define  SEL_mac_training_vector  4'hF


////////////////////////////////////////////////////////////////////////////
// The following two ifdef variable defines the mix-and-match configuration
// of xmac
//
// ALT_ADDR_AND_HASH_FUNC : defines extra mac alternative address
//                          matching and multicast address hashing filter 
//                          function. This is mainly for NIC application. 
//
// XGMII_ONLY             : selects between 10G only mac vs quad speed mac 
//                          (10M/100M/1G/10G).
////////////////////////////////////////////////////////////////////////////

`define ALT_ADDR_AND_HASH_FUNC     1
`define GATE_LEVEL                 1
`define FULL_DUPLEX_ONLY           1
//`define USE_XGMII_INTF             1

// `define XGMII_ONLY

// Defines divider clock and loopback clock polarity

`ifdef NEPTUNE
`define USE_NON_INVERTING_CLOCK    1
`else
`endif
