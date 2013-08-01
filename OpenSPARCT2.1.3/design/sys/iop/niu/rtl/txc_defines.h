/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: txc_defines.h
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
 *  txc_defines.h
 *
 *  Txc Defines Header Include File
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
// SD - Synchronous Delay
// AD - Asynchronous Delay
/*--------------------------------------------------------------*/
`define SD 1
`define AD 0

/*--------------------------------------------------------------*/
// MAC Ports 
/*--------------------------------------------------------------*/
`define FIFO_SIZE_1024 11'd1024
`define FIFO_SIZE_1024_MINUS_1 11'd1023
`define FIFO_SIZE_640  11'd640 
`define FIFO_SIZE_640_MINUS_1  11'd639 

/*--------------------------------------------------------------*/
// MAC Ports 
/*--------------------------------------------------------------*/
`define PORT_ZERO             2'h0
`define PORT_ONE              2'h1
`define PORT_TWO              2'h2
`define PORT_THREE            2'h3

/*--------------------------------------------------------------*/
// TX Control Header defines
/*--------------------------------------------------------------*/

`define CKSUM_EN_PKT_TYPE     63:62
`define IP_VER                61
`define LLC_SNAP_PACKET       57
`define VLAN_PACKET           56
`define IHL                   55:52
`define L3START               51:48
`define L4START               45:40
`define L4STUFF               37:32
`define TOT_XFER_LENGTH       29:16
`define PAD                   2:0


`define IPV4                  2'b01
`define IPV6                  2'b10
`define ETHERNET_PKT          2'b00
`define VLAN_ONLY             2'b01
`define LLC_SNAP_ONLY         2'b10
`define LLC_SNAP_PLUS_VLAN    2'b11

// Don't need, remove
//`define IPV4_HEADER_CHECKSUM  60
//`define LAYER4_PROTOCOL       59:58
//`define LAYER4_CRC_32C        57

/*--------------------------------------------------------------*/
// Number of Bytes
/*--------------------------------------------------------------*/
`define ONE_BYTE         7'd1
`define TWO_BYTES        7'd2
`define THREE_BYTES      7'd3
`define FOUR_BYTES       7'd4
`define FIVE_BYTES       7'd5
`define SIX_BYTES        7'd6
`define SEVEN_BYTES      7'd7

`define OFFSET_ZERO      3'h0
`define OFFSET_ONE       3'h1
`define OFFSET_TWO       3'h2
`define OFFSET_THREE     3'h3
`define OFFSET_FOUR      3'h4
`define OFFSET_FIVE      3'h5
`define OFFSET_SIX       3'h6
`define OFFSET_SEVEN     3'h7

/*--------------------------------------------------------------*/
// Number of Shifts
/*--------------------------------------------------------------*/
`define SHIFT_ZERO_BYTE           16'bxxxx_xxxx_xxxx_xxx1
`define SHIFT_ONE_BYTE            16'bxxxx_xxxx_xxxx_xx10
`define SHIFT_TWO_BYTES           16'bxxxx_xxxx_xxxx_x100
`define SHIFT_THREE_BYTES         16'bxxxx_xxxx_xxxx_1000
`define SHIFT_FOUR_BYTES          16'bxxxx_xxxx_xxx1_0000
`define SHIFT_FIVE_BYTES          16'bxxxx_xxxx_xx10_0000
`define SHIFT_SIX_BYTES           16'bxxxx_xxxx_x100_0000
`define SHIFT_SEVEN_BYTES         16'bxxxx_xxxx_1000_0000
`define SHIFT_EIGHT_BYTES         16'bxxxx_xxx1_0000_0000
`define SHIFT_NINE_BYTES          16'bxxxx_xx10_0000_0000
`define SHIFT_TEN_BYTES           16'bxxxx_x100_0000_0000
`define SHIFT_ELEVEN_BYTES        16'bxxxx_1000_0000_0000
`define SHIFT_TWELVE_BYTES        16'bxxx1_0000_0000_0000
`define SHIFT_THIRTEEN_BYTES      16'bxx10_0000_0000_0000
`define SHIFT_FOURTEEN_BYTES      16'bx100_0000_0000_0000
`define SHIFT_FIFTEEN_BYTES       16'b1000_0000_0000_0000

/*--------------------------------------------------------------*/
// Meta Commands
/*--------------------------------------------------------------*/
`define RESPONSE_WITH_DATA  8'h05
`define RESPONSE_NO_DATA    8'h06
`define RESPONSE_TIMEOUT    4'hF
`define RESPONSE_GOOD       4'h0

/*--------------------------------------------------------------*/
// TX DMA Commands
/*--------------------------------------------------------------*/
`define TXC_MEM_READ_ORDERED_64   8'b0001_1000
`define TXC_MEM_READ_ORDERED_32   8'b0001_0000
`define TXC_MEM_READ_BYPASS_64    8'b0000_1000
`define TXC_MEM_READ_BYPASS_32    8'b0000_0000

`define TXC_MEM_WRITE_POSTED   8'b0010_0001
`define TXC_MEM_WRITE_ORDERED  8'b0001_0001
`define TXC_MEM_WRITE_BYPASS   8'b0000_1001

`define TXC_COMP_READ          8'b0000_0100

`define TXC_COMP_WRITE_POSTED  8'b0010_0101  
`define TXC_COMP_WRITE_ORDERED 8'b0001_0101  
`define TXC_COMP_WRITE_BYPASS  8'b0000_1101  

/*--------------------------------------------------------------*/
// DMA Channel Numbers 
/*--------------------------------------------------------------*/
`define DMA_CHANNEL_ZERO         5'd0
`define DMA_CHANNEL_ONE          5'd1
`define DMA_CHANNEL_TWO          5'd2
`define DMA_CHANNEL_THREE        5'd3
`define DMA_CHANNEL_FOUR         5'd4
`define DMA_CHANNEL_FIVE         5'd5
`define DMA_CHANNEL_SIX          5'd6
`define DMA_CHANNEL_SEVEN        5'd7
`define DMA_CHANNEL_EIGHT        5'd8
`define DMA_CHANNEL_NINE         5'd9
`define DMA_CHANNEL_TEN          5'd10
`define DMA_CHANNEL_ELEVEN       5'd11
`define DMA_CHANNEL_TWELVE       5'd12
`define DMA_CHANNEL_THIRTEEN     5'd13
`define DMA_CHANNEL_FOURTEEN     5'd14
`define DMA_CHANNEL_FIFTEEN      5'd15
`define DMA_CHANNEL_SIXTEEN      5'd16
`define DMA_CHANNEL_SEVENTEEN    5'd17
`define DMA_CHANNEL_EIGHTEEN     5'd18
`define DMA_CHANNEL_NINETEEN     5'd19
`define DMA_CHANNEL_TWENTY       5'd20
`define DMA_CHANNEL_TWENTYONE    5'd21
`define DMA_CHANNEL_TWENTYTWO    5'd22
`define DMA_CHANNEL_TWENTYTHREE  5'd23
`define DMA_CHANNEL_TWENTYFOUR   5'd24
`define DMA_CHANNEL_TWENTYFIVE   5'd25
`define DMA_CHANNEL_TWENTYSIX    5'd26
`define DMA_CHANNEL_TWENTYSEVEN  5'd27
`define DMA_CHANNEL_TWENTYEIGHT  5'd28
`define DMA_CHANNEL_TWENTYNINE   5'd29
`define DMA_CHANNEL_THIRTY       5'd30
`define DMA_CHANNEL_THIRTYONE    5'd31

/*--------------------------------------------------------------*/
// Transaction Ids
/*--------------------------------------------------------------*/
`define TID_ZERO         5'd0
`define TID_ONE          5'd1
`define TID_TWO          5'd2
`define TID_THREE        5'd3
`define TID_FOUR         5'd4
`define TID_FIVE         5'd5
`define TID_SIX          5'd6
`define TID_SEVEN        5'd7
`define TID_EIGHT        5'd8
`define TID_NINE         5'd9
`define TID_TEN          5'd10
`define TID_ELEVEN       5'd11
`define TID_TWELVE       5'd12
`define TID_THIRTEEN     5'd13
`define TID_FOURTEEN     5'd14
`define TID_FIFTEEN      5'd15
`define TID_SIXTEEN      5'd16
`define TID_SEVENTEEN    5'd17
`define TID_EIGHTEEN     5'd18
`define TID_NINETEEN     5'd19
`define TID_TWENTY       5'd20
`define TID_TWENTYONE    5'd21
`define TID_TWENTYTWO    5'd22
`define TID_TWENTYTHREE  5'd23
`define TID_TWENTYFOUR   5'd24
`define TID_TWENTYFIVE   5'd25
`define TID_TWENTYSIX    5'd26
`define TID_TWENTYSEVEN  5'd27
`define TID_TWENTYEIGHT  5'd28
`define TID_TWENTYNINE   5'd29
`define TID_THIRTY       5'd30
`define TID_THIRTYONE    5'd31

/*--------------------------------------------------------------*/
// Reorder ff Data Out Field
/*--------------------------------------------------------------*/
`define ROFF_PKTDATA_ECC 151:136
`define ROFF_RESERVED    153
`define ROFF_BYTEOFFSET  134:130
`define ROFF_SOP         129
`define ROFF_EOP         128
`define ROFF_PKTDATA     127:0
`define ROFF_ABORT       135


`define CTRLHDR_STARTPKT_PAD 2:0

/*--------------------------------------------------------------*/
// Little Endian byte reference
/*--------------------------------------------------------------*/
`define TXC_B14_B0   119:0
`define TXC_B13_B0   111:0
`define TXC_B12_B0   103:0
`define TXC_B11_B0   95:0
`define TXC_B10_B0   87:0
`define TXC_B9_B0    79:0
`define TXC_B8_B0    71:0
`define TXC_B7_B0    63:0
`define TXC_B6_B0    55:0
`define TXC_B5_B0    47:0
`define TXC_B4_B0    39:0
`define TXC_B3_B0    31:0
`define TXC_B2_B0    23:0
`define TXC_B1_B0    15:0
`define TXC_B0       7:0

`define TXC_B15_B1   127:8
`define TXC_B15_B2   127:16
`define TXC_B15_B3   127:24
`define TXC_B15_B4   127:32
`define TXC_B15_B5   127:40
`define TXC_B15_B6   127:48
`define TXC_B15_B7   127:56
`define TXC_B15_B8   127:64
`define TXC_B15_B9   127:72
`define TXC_B15_B10  127:80
`define TXC_B15_B11  127:88
`define TXC_B15_B12  127:96
`define TXC_B15_B13  127:104
`define TXC_B15_B14  127:112
`define TXC_B15      127:120

`define TXC_B1  15:8
`define TXC_B2  23:16
`define TXC_B3  31:24
`define TXC_B4  39:32
`define TXC_B5  47:40
`define TXC_B6  55:48
`define TXC_B7  63:56
`define TXC_B8  71:64
`define TXC_B9  79:72
`define TXC_B10 87:80
`define TXC_B11 95:88
`define TXC_B12 103:96
`define TXC_B13 111:104
`define TXC_B14 119:112

/*--------------------------------------------------------------*/
// Debug Port Select Defines
/*--------------------------------------------------------------*/
`define DATA_FETCH_ENGINE 6'h00
`define PORT0_ENGINE      6'h01
`define PORT0_CKSUM       6'h02
`define PORT0_DRR         6'h03
`define PORT1_ENGINE      6'h04
`define PORT1_CKSUM       6'h05
`define PORT1_DRR         6'h06
`define PORT2_ENGINE      6'h07
`define PORT2_CKSUM       6'h08
`define PORT2_DRR         6'h09
`define PORT3_ENGINE      6'h0A
`define PORT3_CKSUM       6'h0B
`define PORT3_DRR         6'h0C
`define TRAINING_SET      6'h3E
`define TRAINING_LOAD     6'h3F
