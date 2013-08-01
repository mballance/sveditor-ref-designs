/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_smx_define.h
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

`define SMX_PD

`define SMX_CMDPOS_POST 	5
`define SMX_CMDPOS_ORDER 	4
`define SMX_CMDPOS_CODE 	2:0

// meta cmd code
`define SMX_CMD_MEMRD 	3'b000
`define SMX_CMD_MEMWR 	3'b001
`define SMX_CMD_ORDER 	1'b1
`define SMX_CMD_BYPASS 	1'b0
`define SMX_CMD_POST 	1'b1
`define SMX_CMD_NONPOST 1'b0
`define SMX_CMD_COMP_WITH_DATA 3'b101 // read resp ???
`define SMX_CMD_COMP_WITHOUT_DATA 3'b110  // write resp ??

// resp cmd code not sure ???
// see below 

// si cmd code
`define SMX_SICMD_WR_POST 	6'b010010
`define SMX_SICMD_WR_NONPOST 	6'b000010
`define SMX_SICMD_RD 		6'b001010
`define SMX_SICMD_WR_RESP	6'b100010
`define SMX_SICMD_RD_RESP	6'b101010

// sii hdr format position	
`define SMX_SICMD_POS_RESP	127	// 1
`define SMX_SICMD_POS_POST	126	// 1
`define SMX_SICMD_POS_RD	125	// 1

`define SMX_SICMD_POS_CMD	127:122
`define SMX_SICMD_POS_RSV0	121:85
`define SMX_SICMD_POS_AP	84:83
`define SMX_SICMD_POS_ERR	82:80	// 3
`define SMX_SICMD_POS_HERR	81:80	// 2; hdr err E, UE 
`define SMX_SICMD_POS_ID	79:64	// 16
`define SMX_SICMD_POS_RSV1	63
`define SMX_SICMD_POS_CP	62
`define SMX_SICMD_POS_ID_ECC	61:56
`define SMX_SICMD_POS_RSV2	55:40
`define SMX_SICMD_POS_PA	39:0

`define SMX_SICMD_POS_ID_META	79:74
`define SMX_SICMD_POS_ID_SEQ	73:64


// cr
`define SMX_SII_MAX_ORD_CR	5'd16
`define SMX_SII_MAX_BYP_CR	5'd16

// arb
`define SMX_DATA_CYCLES 	3'h4
`define SMX_REQARB_RD		1'b0
`define SMX_REQARB_WR		1'b1

`define SMX_CMDFF_POS_CMD       65:60
`define SMX_CMDFF_POS_ERR     	59:57 
`define SMX_CMDFF_POS_ID     	56:41 
`define SMX_CMDFF_POS_ADDR     	40:1
`define SMX_CMDFF_POS_ORDER     0 

		// ??? assign xtb position
`define SMX_XTB_POS_RCVCNT	        128:119	// 10; append at bus
`define SMX_XTB_POS_ADDR		118:55	// 64
`define SMX_XTB_POS_LEN			54:41	// 14
`define SMX_XTB_POS_PORT		40:39	// 2
`define SMX_XTB_POS_DMA			38:34	// 5
`define SMX_XTB_POS_CLIENT		33:26	// 8
`define SMX_XTB_POS_NOF64B		25:16	//10 
`define SMX_XTB_POS_SOP_LINE_EN   	15:12	// 4
`define SMX_XTB_POS_EOP_LINE_EN   	11:8	// 4
`define SMX_XTB_POS_SOP_BYTE_EN		7:4	// 4
`define SMX_XTB_POS_EOP_BYTE_EN 	3:0	// 4

`define SMX_RESP_CMDFF_POS_WITH_DATA	21
`define SMX_RESP_CMDFF_POS_RESP		20
`define SMX_RESP_CMDFF_POS_RD		19
`define SMX_RESP_CMDFF_POS_ERR		18:16
`define SMX_RESP_CMDFF_POS_PKTERR	16
`define SMX_RESP_CMDFF_POS_ID		15:0
`define SMX_RESP_CMDFF_POS_ID_META	15:10
`define SMX_RESP_CMDFF_POS_SEQ   	9:0


`define SMX_LE_B0 		7:0
`define SMX_LE_B1 		15:8
`define SMX_LE_B2 		23:16
`define SMX_LE_B3 		31:24
`define SMX_LE_B4 		39:32
`define SMX_LE_B5 		47:40
`define SMX_LE_B6 		55:48
`define SMX_LE_B7 		63:56
`define SMX_LE_B8 		71:64
`define SMX_LE_B9 		79:72
`define SMX_LE_B10 		87:80
`define SMX_LE_B11 		95:88
`define SMX_LE_B12 		103:96
`define SMX_LE_B13 		111:104
`define SMX_LE_B14 		119:112
`define SMX_LE_B15 		127:120

`define SMX_BE_B0       	127:120
`define SMX_BE_B1       	119:112
`define SMX_BE_B2       	111:104
`define SMX_BE_B3       	103:96
`define SMX_BE_B4       	95:88
`define SMX_BE_B5       	87:80
`define SMX_BE_B6       	79:72
`define SMX_BE_B7       	71:64
`define SMX_BE_B8       	63:56
`define SMX_BE_B9       	55:48
`define SMX_BE_B10      	47:40
`define SMX_BE_B11      	39:32
`define SMX_BE_B12      	31:24
`define SMX_BE_B13      	23:16
`define SMX_BE_B14      	15:8
`define SMX_BE_B15      	7:0


`define SMX_TRAINING_SET	3'h4
`define SMX_TRAINING_LOAD	3'h5


/* meta cmd
	wr, rd
	post, non-post
	cmd[5]  1'b1 posted
		1'b0 non-posted 
	cmd[4]  1'b1 order 
		1'b0 bypass
	cmd[3]  1'b1 64b addressing
		1'b0 32b addressing ??
	cmd[2:0] 3'b000 rd
		 3'b001 wr 
 	peu spec
 		[4:3] error type ???
	peu spec
	 	 3'b101 completion with data ??
	 	 3'b110 completion without data ??

	smx spec 
	 	 3'b100 completion read 
	               (completion with data) ??
	 	 3'b101 completion write
		       (completion without data ??
	currently implement smx spec's
*/ 
/* si hdr
	si.cmd
	si.err[2:0]
	si.id[15:0]
	si.pa[39:0]
	order/bypass
*/


