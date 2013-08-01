/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_txc_reg_defines.h
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
/********************************************************************* *
 *  niu_txc_reg_defines.h
 *
 *  NIU Txc Register Defines Header File
 *
 *  Orignal Author(s)   Rahoul Puri
 *  Modifier(s)
 *  Project(s)          Neptune
 *
 *  Copyright (c) 2004   Sun Microsystems, Inc.
 *
 *  All Rights Reserved.
 *
 *  This verilog model is the confidential and proprietary property of
 *  Sun Microsystems, Inc., and the possession or use of this model
 *  requires a written license from Sun Microsystems, Inc.
 *
 **********************************************************************/

/*--------------------------------------------------------------*/
// Nomenclature, Defines and niu_txc_Control Slave Access Behaviour
//
// RW   - Read & Write
// RO   - Read Only
// RSV  - Reserved
//
// Reserved - Read or Writes will generate Slave Error
// Writes to Read Only will generate Slave Error
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// NIU TXc Read & Write Registers
/*--------------------------------------------------------------*/
`define DMA0_SPACE         8'h80
`define DMA1_SPACE         8'h81
`define DMA2_SPACE         8'h82
`define DMA3_SPACE         8'h83
`define DMA4_SPACE         8'h84
`define DMA5_SPACE         8'h85
`define DMA6_SPACE         8'h86
`define DMA7_SPACE         8'h87
`define DMA8_SPACE         8'h88
`define DMA9_SPACE         8'h89
`define DMA10_SPACE        8'h8A
`define DMA11_SPACE        8'h8B
`define DMA12_SPACE        8'h8C
`define DMA13_SPACE        8'h8D
`define DMA14_SPACE        8'h8E
`define DMA15_SPACE        8'h8F
`define DMA16_SPACE        8'h90
`define DMA17_SPACE        8'h91
`define DMA18_SPACE        8'h92
`define DMA19_SPACE        8'h93
`define DMA20_SPACE        8'h94
`define DMA21_SPACE        8'h95
`define DMA22_SPACE        8'h96
`define DMA23_SPACE        8'h97

`define DMA_RSV_SPACE      12'h010

`define TXC_LOWER            19'h20000
`define TXC_UPPER            19'h20018
`define TXC_INT_LOWER        19'h20420
`define TXC_INT_UPPER        19'h20430

`define PORT0_LOWER          19'h20020 //
`define PORT0_UPPER          19'h20100 //

`define PORT1_LOWER          19'h20120 //
`define PORT1_UPPER          19'h20200 //

`define PORT2_LOWER          19'h20220 //
`define PORT2_UPPER          19'h20300 //

`define PORT3_LOWER          19'h20320 //
`define PORT3_UPPER          19'h20400 //

/*--------------------------------------------------------------*/
// NIU TXc Address Range Mapping
//
// Address for NIT TXc CSR access is 0x0070_0000: 19 bit Address Space
//
// 00[0_0000- Logical offsett]_[0000_0000_0 -512 Registers(64Bit)]XXX
//
// DMA 0  => 20'h00000<->20'h00FFC
// DMA 1  => 20'h01000<->20'h01FFC
// DMA 2  => 20'h02000<->20'h02FFC
// DMA 3  => 20'h03000<->20'h03FFC
// DMA 4  => 20'h04000<->20'h04FFC
// DMA 5  => 20'h05000<->20'h05FFC
// DMA 6  => 20'h06000<->20'h06FFC
// DMA 7  => 20'h07000<->20'h07FFC
// DMA 8  => 20'h08000<->20'h08FFC
// DMA 9  => 20'h09000<->20'h09FFC
// DMA 10 => 20'h0A000<->20'h0AFFC
// DMA 11 => 20'h0B000<->20'h0BFFC
// DMA 12 => 20'h0C000<->20'h0CFFC
// DMA 13 => 20'h0D000<->20'h0DFFC
// DMA 14 => 20'h0E000<->20'h0EFFC
// DMA 15 => 20'h0F000<->20'h0FFFC
// DMA 16 => 20'h10000<->20'h10FFC
// DMA 17 => 20'h11000<->20'h11FFC
// DMA 18 => 20'h12000<->20'h12FFC
// DMA 19 => 20'h13000<->20'h13FFC
// DMA 20 => 20'h14000<->20'h14FFC
// DMA 21 => 20'h15000<->20'h15FFC
// DMA 22 => 20'h16000<->20'h16FFC
// DMA 23 => 20'h17000<->20'h17FFC
// DMA 24 => 20'h18000<->20'h18FFC
// DMA 25 => 20'h19000<->20'h19FFC
// DMA 26 => 20'h1A000<->20'h1AFFC
// DMA 27 => 20'h1B000<->20'h1BFFC
// DMA 28 => 20'h1C000<->20'h1CFFC
// DMA 29 => 20'h1D000<->20'h1DFFC
// DMA 30 => 20'h1E000<->20'h1EFFC
// DMA 31 => 20'h1F000<->20'h1FFFC
// TXC    => 20'h20000<->20'h20FFC
// RSV    => 20'h20FFC<->20'h4FFFC
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// DMA Read & Write Registers => 20'h00000<->20'h00FFC
/*--------------------------------------------------------------*/
`define DMA_MAXBURST           12'h000   // 20'h00000 - RW
`define DMA_LENGTH             12'h008   // 20'h00008 - RO
//`define RESERVED            20'h00FF8 - 20'h00010  - Reserved

/*--------------------------------------------------------------*/
// DMA 0 Read & Write Registers => 20'h00000<->20'h00FFC
/*--------------------------------------------------------------*/
`define DMA_0_MAXBURST         14'h0000   // 20'h00000 - RW
`define DMA_0_LENGTH           14'h0008   // 20'h00008 - RO
//`define DMA_0_MAXBURST         12'h000   // 20'h00000 - RW
//`define DMA_0_LENGTH           12'h008   // 20'h00008 - RO
//`define RESERVED            20'h00FF8 - 20'h00010  - Reserved

/*--------------------------------------------------------------*/
// DMA 1 Read & Write Registers => 20'h01000<->20'h01FFC
/*--------------------------------------------------------------*/
`define DMA_1_MAXBURST         14'h1000   // 20'h01000 - RW
`define DMA_1_LENGTH           14'h1008   // 20'h01008 - RO
//`define DMA_1_MAXBURST         12'h000   // 20'h01000 - RW
//`define DMA_1_LENGTH           12'h008   // 20'h01008 - RO
//`define RESERVED            20'h01FF8 - 20'h01010  - Reserved

/*--------------------------------------------------------------*/
// DMA 2 Read & Write Registers => 20'h1400<->20'h02FFC
/*--------------------------------------------------------------*/
`define DMA_2_MAXBURST         14'h2000   // 20'h02000 - RW
`define DMA_2_LENGTH           14'h2008   // 20'h02008 - RO
//`define DMA_2_MAXBURST         12'h000   // 20'h02000 - RW
//`define DMA_2_LENGTH           12'h008   // 20'h02008 - RO
//`define RESERVED            20'h02FF8 - 20'h02010  - Reserved

/*--------------------------------------------------------------*/
// DMA 3 Read & Write Registers => 20'h1E00<->20'h03FFC
/*--------------------------------------------------------------*/
`define DMA_3_MAXBURST         14'h3000   // 20'h03000 - RW
`define DMA_3_LENGTH           14'h3008   // 20'h03008 - RO
//`define DMA_3_MAXBURST         12'h000   // 20'h03000 - RW
//`define DMA_3_LENGTH           12'h008   // 20'h03008 - RO
//`define RESERVED            20'h03FF8 - 20'h03010  - Reserved

/*--------------------------------------------------------------*/
// DMA 4 Read & Write Registers => 20'h04000<->20'h04FFC
/*--------------------------------------------------------------*/
//`define DMA_4_MAXBURST         12'h000   // 20'h04000 - RW
//`define DMA_4_LENGTH           12'h008   // 20'h04008 - RO
//`define RESERVED            20'h04FF8 - 20'h04010  - Reserved

/*--------------------------------------------------------------*/
// DMA 5 Read & Write Registers => 20'h05000<->20'h05FFC
/*--------------------------------------------------------------*/
//`define DMA_5_MAXBURST         12'h000   // 20'h05000 - RW
//`define DMA_5_LENGTH           12'h008   // 20'h05008 - RO
//`define RESERVED            20'h05FF8 - 20'h05010  - Reserved

/*--------------------------------------------------------------*/
// DMA 6 Read & Write Registers => 20'h06000<->20'h06FFC
/*--------------------------------------------------------------*/
//`define DMA_6_MAXBURST         12'h000   // 20'h06000 - RW
//`define DMA_6_LENGTH           12'h008   // 20'h06008 - RO
//`define RESERVED            20'h06FF8 - 20'h06010  - Reserved

/*--------------------------------------------------------------*/
// DMA 7 Read & Write Registers => 20'h07000<->20'h07FFC
/*--------------------------------------------------------------*/
//`define DMA_7_MAXBURST         12'h000   // 20'h07000 - RW
//`define DMA_7_LENGTH           12'h008   // 20'h07008 - RO
//`define RESERVED            20'h07FF8 - 20'h07010  - Reserved

/*--------------------------------------------------------------*/
// DMA 8 Read & Write Registers => 20'h08000<->20'h08FFC
/*--------------------------------------------------------------*/
//`define DMA_8_MAXBURST         12'h000   // 20'h08000 - RW
//`define DMA_8_LENGTH           12'h008   // 20'h08008 - RO
//`define RESERVED            20'h08FF8 - 20'h08010  - Reserved

/*--------------------------------------------------------------*/
// DMA 9 Read & Write Registers => 20'h09000<->20'h09FFC
/*--------------------------------------------------------------*/
//`define DMA_9_MAXBURST         12'h000   // 20'h09000 - RW
//`define DMA_9_LENGTH           12'h008   // 20'h09008 - RO
//`define RESERVED            20'h09FF8 - 20'h09010  - Reserved

/*--------------------------------------------------------------*/
// DMA 10 Read & Write Registers => 20'h0A000<->20'h0AFFC
/*--------------------------------------------------------------*/
//`define DMA_10_MAXBURST         12'h000   // 20'h0A000 - RW
//`define DMA_10_LENGTH           12'h008   // 20'h0A008 - RO
//`define RESERVED            20'h0AFF8 - 20'h0A010  - Reserved

/*--------------------------------------------------------------*/
// DMA 11 Read & Write Registers => 20'h0B000<->20'h0BFFC
/*--------------------------------------------------------------*/
//`define DMA_11_MAXBURST         12'h000   // 20'h0B000 - RW
//`define DMA_11_LENGTH           12'h008   // 20'h0B008 - RO
//`define RESERVED            20'h0BFF8 - 20'h0B010  - Reserved

/*--------------------------------------------------------------*/
// DMA 12 Read & Write Registers => 20'h0C000<->20'h0CFFC
/*--------------------------------------------------------------*/
//`define DMA_12_MAXBURST         12'h000   // 20'h0C000 - RW
//`define DMA_12_LENGTH           12'h008   // 20'h0C008 - RO
//`define RESERVED            20'h0CFF8 - 20'h0C010  - Reserved

/*--------------------------------------------------------------*/
// DMA 13 Read & Write Registers => 20'h0D000<->20'h0DFFC
/*--------------------------------------------------------------*/
//`define DMA_13_MAXBURST         12'h000   // 20'h0D000 - RW
//`define DMA_13_LENGTH           12'h008   // 20'h0D008 - RO
//`define RESERVED            20'h0DFF8 - 20'h0D050  - Reserved

/*--------------------------------------------------------------*/
// DMA 14 Read & Write Registers => 20`h0E000<->20`h0EFFC
/*--------------------------------------------------------------*/
//`define DMA_14_MAXBURST         12'h000   // 20`h0E000 - RW
//`define DMA_14_LENGTH           12'h008   // 20'h0E008 - RO
//`define RESERVED            20`h0EFF8 - 20`h0E010  - Reserved

/*--------------------------------------------------------------*/
// DMA 15 Read & Write Registers => 20'h0F000<->20'h0FFFC
/*--------------------------------------------------------------*/
//`define DMA_15_MAXBURST         12'h000   // 20'h0F000 - RW
//`define DMA_15_LENGTH           12'h008   // 20'h0F008 - RO
//`define RESERVED            20'h0FFF8 - 20'h0F010  - Reserved

/*--------------------------------------------------------------*/
// DMA 16 Read & Write Registers => 20'h10000<->20'h10FFC
/*--------------------------------------------------------------*/
//`define DMA_16_MAXBURST         12'h000   // 20'h10000 - RW
//`define DMA_16_LENGTH           12'h008   // 20'h10008 - RO
//`define RESERVED            20'h10FF8 - 20'h10010  - Reserved

/*--------------------------------------------------------------*/
// DMA 17 Read & Write Registers => 20'h11000<->20'h11FFC
/*--------------------------------------------------------------*/
//`define DMA_17_MAXBURST         12'h000   // 20'h11000 - RW
//`define DMA_17_LENGTH           12'h008   // 20'h11008 - RO
//`define RESERVED            20'h11FF8 - 20'h11010  - Reserved

/*--------------------------------------------------------------*/
// DMA 18 Read & Write Registers => 20'h12000<->20'h12FFC
/*--------------------------------------------------------------*/
//`define DMA_18_MAXBURST         12'h000   // 20'h12000 - RW
//`define DMA_18_LENGTH           12'h008   // 20'h12008 - RO
//`define RESERVED            20'h12FF8 - 20'h12010  - Reserved

/*--------------------------------------------------------------*/
// DMA 19 Read & Write Registers => 20'h13000<->20'h13FFC
/*--------------------------------------------------------------*/
//`define DMA_19_MAXBURST         12'h000   // 20'h13000 - RW
//`define DMA_19_LENGTH           12'h008   // 20'h13008 - RO
//`define RESERVED            20'h13FF8 - 20'h13010  - Reserved

/*--------------------------------------------------------------*/
// DMA 20 Read & Write Registers => 20'h14000<->20'h14FFC
/*--------------------------------------------------------------*/
//`define DMA_20_MAXBURST         12'h000   // 20'h14000 - RW
//`define DMA_20_LENGTH           12'h008   // 20'h14008 - RO
//`define RESERVED            20'h14FF8 - 20'h14010  - Reserved

/*--------------------------------------------------------------*/
// DMA 21 Read & Write Registers => 20'h15000<->20'h15FFC
/*--------------------------------------------------------------*/
//`define DMA_21_MAXBURST         12'h000   // 20'h15000 - RW
//`define DMA_21_LENGTH           12'h008   // 20'h15008 - RO
//`define RESERVED            20'h15FF8 - 20'h15010  - Reserved

/*--------------------------------------------------------------*/
// DMA 22 Read & Write Registers => 20'h16000<->20'h16FFC
/*--------------------------------------------------------------*/
//`define DMA_22_MAXBURST         12'h000   // 20'h16000 - RW
//`define DMA_22_LENGTH           12'h008   // 20'h16008 - RO
//`define RESERVED            20'h16FF8 - 20'h16010  - Reserved

/*--------------------------------------------------------------*/
// DMA 23 Read & Write Registers => 20'h17000<->20'h17FFC
/*--------------------------------------------------------------*/
//`define DMA_23_MAXBURST         12'h000   // 20'h17000 - RW
//`define DMA_23_LENGTH           12'h008   // 20'h17008 - RO
//`define RESERVED            20'h17FF8 - 20'h17010  - Reserved

/*--------------------------------------------------------------*/
// NIU TXc Read & Write Registers
// TXC    => 20'h20000<->20'h20FFC
// Port 0    => 20'h20100<->20'h200FC
// Port 1    => 20'h20400<->20'h204FC
// Port 1    => 20'h20800<->20'h228FC
// Port 1    => 20'h20C00<->20'h20CFC
/*--------------------------------------------------------------*/
`define TXC_CONTROL            12'h000    // 20'h20000 - RW
`define TXC_TRAINING           12'h008    // 20'h20008 - RW
`define TXC_DEBUG_SELECT       12'h010    // 20'h20010 - RW
`define TXC_MAX_REORDER        12'h018    // 20'h20018 - RW

`define PORT0_CONTROL          12'h020    // 20'h20020 - RW
`define PORT0_DMA_ENABLE       12'h028    // 20'h20028 - RW
`define PORT0_PACKETS_STUFFED  12'h030    // 20'h20030 - RW
`define PORT0_PACKETS_XMITTED  12'h038    // 20'h20038 - RW
`define PORT0_RO_ECC_CONTROL   12'h040    // 20'h20040 - RW
`define PORT0_RO_ECC_ADDR      12'h048    // 20'h20048 - RW
`define PORT0_RO_ECC_DATA0     12'h050    // 20'h20050 - RO
`define PORT0_RO_ECC_DATA1     12'h058    // 20'h20058 - RO
`define PORT0_RO_ECC_DATA2     12'h060    // 20'h20060 - RO
`define PORT0_RO_ECC_DATA3     12'h068    // 20'h20068 - RO
`define PORT0_RO_ECC_DATA4     12'h070    // 20'h20070 - RO
`define PORT0_SF_ECC_CONTROL   12'h078    // 20'h20078 - RW
`define PORT0_SF_ECC_ADDR      12'h080    // 20'h20080 - RW
`define PORT0_SF_ECC_DATA0     12'h088    // 20'h20088 - RO
`define PORT0_SF_ECC_DATA1     12'h090    // 20'h20090 - RO
`define PORT0_SF_ECC_DATA2     12'h098    // 20'h20098 - RO
`define PORT0_SF_ECC_DATA3     12'h0A0    // 20'h200A0 - RO
`define PORT0_SF_ECC_DATA4     12'h0A8    // 20'h200A8 - RO
`define PORT0_REORDER_TID      12'h0B0    // 20'h200B0 - RW
`define PORT0_REORDER_STATE0   12'h0B8    // 20'h200B8 - RW
`define PORT0_REORDER_STATE1   12'h0C0    // 20'h200C0 - RW
`define PORT0_REORDER_STATE2   12'h0C8    // 20'h200C8 - RW
`define PORT0_REORDER_STATE3   12'h0D0    // 20'h200D0 - RW
`define PORT0_REORDER_CONTROL  12'h0D8    // 20'h200D8 - RW
`define PORT0_REORDER_DATA0    12'h0E0    // 20'h200E0 - RW
`define PORT0_REORDER_DATA1    12'h0E8    // 20'h200E8 - RW
`define PORT0_REORDER_DATA2    12'h0F0    // 20'h200F0 - RW
`define PORT0_REORDER_DATA3    12'h0F8    // 20'h200F8 - RW
`define PORT0_PACKETS_REQUEST  12'h100    // 20'h20100 - RW

//`define RESERVED            20'h20108 - 20'h2011F  - Reserved
`define PORT1_CONTROL          12'h120    // 20'h20120 - RW
`define PORT1_DMA_ENABLE       12'h128    // 20'h20128 - RW
`define PORT1_PACKETS_STUFFED  12'h130    // 20'h20130 - RW
`define PORT1_PACKETS_XMITTED  12'h138    // 20'h20138 - RW
`define PORT1_RO_ECC_CONTROL   12'h140    // 20'h20140 - RW
`define PORT1_RO_ECC_ADDR      12'h148    // 20'h20148 - RW
`define PORT1_RO_ECC_DATA0     12'h150    // 20'h20150 - RO
`define PORT1_RO_ECC_DATA1     12'h158    // 20'h20158 - RO
`define PORT1_RO_ECC_DATA2     12'h160    // 20'h20160 - RO
`define PORT1_RO_ECC_DATA3     12'h168    // 20'h20168 - RO
`define PORT1_RO_ECC_DATA4     12'h170    // 20'h20170 - RO
`define PORT1_SF_ECC_CONTROL   12'h178    // 20'h20178 - RW
`define PORT1_SF_ECC_ADDR      12'h180    // 20'h20180 - RW
`define PORT1_SF_ECC_DATA0     12'h188    // 20'h20188 - RO
`define PORT1_SF_ECC_DATA1     12'h190    // 20'h20190 - RO
`define PORT1_SF_ECC_DATA2     12'h198    // 20'h20198 - RO
`define PORT1_SF_ECC_DATA3     12'h1A0    // 20'h201A0 - RO
`define PORT1_SF_ECC_DATA4     12'h1A8    // 20'h201A8 - RO
`define PORT1_REORDER_TID      12'h1B0    // 20'h201B8 - RW
`define PORT1_REORDER_STATE0   12'h1B8    // 20'h201B0 - RW
`define PORT1_REORDER_STATE1   12'h1C0    // 20'h201C0 - RW
`define PORT1_REORDER_STATE2   12'h1C8    // 20'h201C8 - RW
`define PORT1_REORDER_STATE3   12'h1D0    // 20'h201D0 - RW
`define PORT1_REORDER_CONTROL  12'h1D8    // 20'h201D8 - RW
`define PORT1_REORDER_DATA0    12'h1E0    // 20'h201E0 - RW
`define PORT1_REORDER_DATA1    12'h1E8    // 20'h201E8 - RW
`define PORT1_REORDER_DATA2    12'h1F0    // 20'h201F0 - RW
`define PORT1_REORDER_DATA3    12'h1F8    // 20'h201F8 - RW
`define PORT1_PACKETS_REQUEST  12'h200    // 20'h20200 - RW

//`define RESERVED            20'h20208 - 20'h2021F  - Reserved
`define PORT2_CONTROL          12'h220    // 20'h20220 - RW
`define PORT2_DMA_ENABLE       12'h228    // 20'h20228 - RW
`define PORT2_PACKETS_STUFFED  12'h230    // 20'h20230 - RW
`define PORT2_PACKETS_XMITTED  12'h238    // 20'h20238 - RW
`define PORT2_RO_ECC_CONTROL   12'h240    // 20'h20240 - RW
`define PORT2_RO_ECC_ADDR      12'h248    // 20'h20248 - RW
`define PORT2_RO_ECC_DATA0     12'h250    // 20'h20250 - RO
`define PORT2_RO_ECC_DATA1     12'h258    // 20'h20258 - RO
`define PORT2_RO_ECC_DATA2     12'h260    // 20'h20260 - RO
`define PORT2_RO_ECC_DATA3     12'h268    // 20'h20268 - RO
`define PORT2_RO_ECC_DATA4     12'h270    // 20'h20270 - RO
`define PORT2_SF_ECC_CONTROL   12'h278    // 20'h20278 - RW
`define PORT2_SF_ECC_ADDR      12'h280    // 20'h20280 - RW
`define PORT2_SF_ECC_DATA0     12'h288    // 20'h20288 - RO
`define PORT2_SF_ECC_DATA1     12'h290    // 20'h20290 - RO
`define PORT2_SF_ECC_DATA2     12'h298    // 20'h20298 - RO
`define PORT2_SF_ECC_DATA3     12'h2A0    // 20'h202A0 - RO
`define PORT2_SF_ECC_DATA4     12'h2A8    // 20'h202A8 - RO
`define PORT2_REORDER_TID      12'h2B0    // 20'h202B8 - RW
`define PORT2_REORDER_STATE0   12'h2B8    // 20'h202B0 - RW
`define PORT2_REORDER_STATE1   12'h2C0    // 20'h202C0 - RW
`define PORT2_REORDER_STATE2   12'h2C8    // 20'h202C8 - RW
`define PORT2_REORDER_STATE3   12'h2D0    // 20'h202D0 - RW
`define PORT2_REORDER_CONTROL  12'h2D8    // 20'h202D8 - RW
`define PORT2_REORDER_DATA0    12'h2E0    // 20'h202E0 - RW
`define PORT2_REORDER_DATA1    12'h2E8    // 20'h202E8 - RW
`define PORT2_REORDER_DATA2    12'h2F0    // 20'h202F0 - RW
`define PORT2_REORDER_DATA3    12'h2F8    // 20'h202F8 - RW
`define PORT2_PACKETS_REQUEST  12'h300    // 20'h20300 - RW

//`define RESERVED            20'h20308 - 20'h2031F  - Reserved
`define PORT3_CONTROL          12'h320    // 20'h20320 - RW
`define PORT3_DMA_ENABLE       12'h328    // 20'h20328 - RW
`define PORT3_PACKETS_STUFFED  12'h330    // 20'h20330 - RW
`define PORT3_PACKETS_XMITTED  12'h338    // 20'h20338 - RW
`define PORT3_RO_ECC_CONTROL   12'h340    // 20'h20340 - RW
`define PORT3_RO_ECC_ADDR      12'h348    // 20'h20348 - RW
`define PORT3_RO_ECC_DATA0     12'h350    // 20'h20350 - RO
`define PORT3_RO_ECC_DATA1     12'h358    // 20'h20358 - RO
`define PORT3_RO_ECC_DATA2     12'h360    // 20'h20360 - RO
`define PORT3_RO_ECC_DATA3     12'h368    // 20'h20368 - RO
`define PORT3_RO_ECC_DATA4     12'h370    // 20'h20370 - RO
`define PORT3_SF_ECC_CONTROL   12'h378    // 20'h20378 - RW
`define PORT3_SF_ECC_ADDR      12'h380    // 20'h20380 - RW
`define PORT3_SF_ECC_DATA0     12'h388    // 20'h20388 - RO
`define PORT3_SF_ECC_DATA1     12'h390    // 20'h20390 - RO
`define PORT3_SF_ECC_DATA2     12'h398    // 20'h20398 - RO
`define PORT3_SF_ECC_DATA3     12'h3A0    // 20'h203A0 - RO
`define PORT3_SF_ECC_DATA4     12'h3A8    // 20'h203A8 - RO
`define PORT3_REORDER_TID      12'h3B0    // 20'h203B0 - RW
`define PORT3_REORDER_STATE0   12'h3B8    // 20'h203B8 - RW
`define PORT3_REORDER_STATE1   12'h3C0    // 20'h203C0 - RW
`define PORT3_REORDER_STATE2   12'h3C8    // 20'h203C8 - RW
`define PORT3_REORDER_STATE3   12'h3D0    // 20'h203D0 - RW
`define PORT3_REORDER_CONTROL  12'h3D8    // 20'h203D8 - RW
`define PORT3_REORDER_DATA0    12'h3E0    // 20'h203E0 - RW
`define PORT3_REORDER_DATA1    12'h3E8    // 20'h203E8 - RW
`define PORT3_REORDER_DATA2    12'h3F0    // 20'h203F0 - RW
`define PORT3_REORDER_DATA3    12'h3F8    // 20'h203F8 - RW
`define PORT3_PACKETS_REQUEST  12'h400    // 20'h20400 - RW

//`define RESERVED            20'h20408 - 20'h2041F  - Reserved
`define TXC_INT_SET_EVENT      12'h420    // 20'h20420 - RW
`define TXC_INT_CLR_EVENT      12'h428    // 20'h20428 - RW
`define TXC_INT_MASK           12'h430    // 20'h20430 - RW

//`define RESERVED            20'h20438 - 20'h2FFFF  - Reserved
