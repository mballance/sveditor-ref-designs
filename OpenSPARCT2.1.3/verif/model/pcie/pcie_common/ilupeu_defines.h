/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ilupeu_defines.h
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
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ilupeu_defines.h
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
#ifndef INC_ILUPEU_DEFINES_H
#define INC_ILUPEU_DEFINES_H


#define ILUPEU_DL_INACTIVE	"0b001"
#define ILUPEU_DL_INIT      	"0b010"
#define ILUPEU_DL_ACTIVE      	"0b100"

#define ILUPEU_LINK_DOWN      	"0b0"
#define ILUPEU_LINK_UP      	"0b1"

#define ILUPEU_FC_IDLE      	"0b00"
#define ILUPEU_FC_INIT1      	"0b01"
#define ILUPEU_FC_INIT2      	"0b11"
#define ILUPEU_FC_INIT_DONE    	"0b10"

#define ILUPEU_LANE_REVERSED	 	"0b1"
#define ILUPEU_LANE_NOT_REVERSED	"0b0"


#define ILUPEU_LINK_WIDTH_X1     "0b0000"
#define ILUPEU_LINK_WIDTH_X2     "0b0001"
#define ILUPEU_LINK_WIDTH_X4     "0b0011"
#define ILUPEU_LINK_WIDTH_X8     "0b0111"

//PEU definitions from xmlh_ltssm.v
#define ILUPEU_LTSSM_DETECT_QUIET         sc_uint<64>(0x00)
#define ILUPEU_LTSSM_DETECT_ACT           sc_uint<64>(0x01)
#define ILUPEU_LTSSM_POLL_ACTIVE          sc_uint<64>(0x02)
#define ILUPEU_LTSSM_POLL_COMPLIANCE      sc_uint<64>(0x03)
#define ILUPEU_LTSSM_POLL_CONFIG          sc_uint<64>(0x04)
#define ILUPEU_LTSSM_PRE_DETECT_QUIET     sc_uint<64>(0x05)
#define ILUPEU_LTSSM_DETECT_WAIT          sc_uint<64>(0x06)
#define ILUPEU_LTSSM_CFG_LINKWD_START     sc_uint<64>(0x07)
#define ILUPEU_LTSSM_CFG_LINKWD_ACEPT     sc_uint<64>(0x08)
#define ILUPEU_LTSSM_CFG_LANENUM_WAIT     sc_uint<64>(0x09)
#define ILUPEU_LTSSM_CFG_LANENUM_ACEPT    sc_uint<64>(0x0A)
#define ILUPEU_LTSSM_CFG_COMPLETE         sc_uint<64>(0x0B)
#define ILUPEU_LTSSM_CFG_IDLE             sc_uint<64>(0x0C)
#define ILUPEU_LTSSM_RCVRY_RCVRLOCK       sc_uint<64>(0x0D)
#define ILUPEU_LTSSM_RCVRY_RCVRCFG        sc_uint<64>(0x0E)
#define ILUPEU_LTSSM_RCVRY_IDLE           sc_uint<64>(0x0F)
#define ILUPEU_LTSSM_L0                   sc_uint<64>(0x10)
#define ILUPEU_LTSSM_L0S                  sc_uint<64>(0x11)
#define ILUPEU_LTSSM_L123_SEND_EIDLE      sc_uint<64>(0x12)
#define ILUPEU_LTSSM_L1_IDLE              sc_uint<64>(0x13)
#define ILUPEU_LTSSM_L2_IDLE              sc_uint<64>(0x14)
#define ILUPEU_LTSSM_L2_WAKE              sc_uint<64>(0x15)
#define ILUPEU_LTSSM_DISABLED_ENTRY       sc_uint<64>(0x16)
#define ILUPEU_LTSSM_DISABLED_IDLE        sc_uint<64>(0x17)
#define ILUPEU_LTSSM_DISABLED             sc_uint<64>(0x18)
#define ILUPEU_LTSSM_LPBK_ENTRY           sc_uint<64>(0x19)
#define ILUPEU_LTSSM_LPBK_ACTIVE          sc_uint<64>(0x1A)
#define ILUPEU_LTSSM_LPBK_EXIT            sc_uint<64>(0x1B)
#define ILUPEU_LTSSM_LPBK_EXIT_TIMEOUT    sc_uint<64>(0x1C)
#define ILUPEU_LTSSM_HOT_RESET_ENTRY      sc_uint<64>(0x1D)
#define ILUPEU_LTSSM_HOT_RESET            sc_uint<64>(0x1F)


//Standard CSR width
#define ILUPEU_CSR_WIDTH		 64
#define ILUPEU_FAST_LINK_TRAIN_TO        15000
#define ILUPEU_DEFAULT_LINK_TRAIN_TO     10000000

//Default Retry Credits
#define ILUPEU_DEFAULT_RETRY_CREDITS    sc_uint<64>(0x1580)

//Defines for Ingress/Egress
#define ILUPEU_INGRESS_TRANS    1
#define ILUPEU_EGRESS_TRANS     0

//Defines for Strategy Encodings 
#define ILUPEU_TLP_STRAT_ENC       0
#define ILUPEU_DLLP_FC_STRAT_ENC   1
#define ILUPEU_DLLP_PM_STRAT_ENC   2


#define ILUPEU_TRUE                    1
#define ILUPEU_FALSE                   0

// TLP Field Acquisition Defines
#define ILUPEU_TLP_TYPE_QUAD_LOC                    0
#define ILUPEU_TLP_TYPE_BITS                     (30,24)

#define ILUPEU_TLP_TC_QUAD_LOC                      0
#define ILUPEU_TLP_TC_BITS                       (22,20)

#define ILUPEU_TLP_DATASIZE_QUAD_LOC                0
#define ILUPEU_TLP_DATASIZE_BITS                 (9,0)



// TLP Type Encodings
#define ILUPEU_TLP_FMT_TYPE_MRD32                   "0b0000000"
#define ILUPEU_TLP_FMT_TYPE_MRD64                   "0b0100000"
#define ILUPEU_TLP_FMT_TYPE_MRDLK32                 "0b0000001"
#define ILUPEU_TLP_FMT_TYPE_MRDLK64                 "0b0100001"
#define ILUPEU_TLP_FMT_TYPE_MWR32                   "0b1000000"
#define ILUPEU_TLP_FMT_TYPE_MWR64                   "0b1100000"
#define ILUPEU_TLP_FMT_TYPE_IORD                    "0b0000010"
#define ILUPEU_TLP_FMT_TYPE_IOWR                    "0b1000010"
#define ILUPEU_TLP_FMT_TYPE_CFGRD0                  "0b0000100"
#define ILUPEU_TLP_FMT_TYPE_CFGWR0                  "0b1000100"
#define ILUPEU_TLP_FMT_TYPE_CFGRD1                  "0b0000101"
#define ILUPEU_TLP_FMT_TYPE_CFGWR1                  "0b1000101"
#define ILUPEU_TLP_FMT_TYPE_MSG0                    "0b0110000"
#define ILUPEU_TLP_FMT_TYPE_MSG1                    "0b0110001"
#define ILUPEU_TLP_FMT_TYPE_MSG2                    "0b0110010"
#define ILUPEU_TLP_FMT_TYPE_MSG3                    "0b0110011"
#define ILUPEU_TLP_FMT_TYPE_MSG4                    "0b0110100"
#define ILUPEU_TLP_FMT_TYPE_MSG5                    "0b0110101"
#define ILUPEU_TLP_FMT_TYPE_MSG6                    "0b0110110"
#define ILUPEU_TLP_FMT_TYPE_MSG7                    "0b0110111"
#define ILUPEU_TLP_FMT_TYPE_MSGD0                   "0b1110000"
#define ILUPEU_TLP_FMT_TYPE_MSGD1                   "0b1110001"
#define ILUPEU_TLP_FMT_TYPE_MSGD2                   "0b1110010"
#define ILUPEU_TLP_FMT_TYPE_MSGD3                   "0b1110011"
#define ILUPEU_TLP_FMT_TYPE_MSGD4                   "0b1110100"
#define ILUPEU_TLP_FMT_TYPE_MSGD5                   "0b1110101"
#define ILUPEU_TLP_FMT_TYPE_MSGD6                   "0b1110110"
#define ILUPEU_TLP_FMT_TYPE_MSGD7                   "0b1110111"
#define ILUPEU_TLP_FMT_TYPE_CPL                     "0b0001010"
#define ILUPEU_TLP_FMT_TYPE_CPLD                    "0b1001010"
#define ILUPEU_TLP_FMT_TYPE_CPLLK                   "0b0001011"
#define ILUPEU_TLP_FMT_TYPE_CPLDLK                  "0b1001011"



// TLP Commands
#define ILUPEU_TLP_CMD_IDLE                         "0b000"
#define ILUPEU_TLP_CMD_ABORT_EOP                    "0b001                    "
#define ILUPEU_TLP_CMD_DATA                         "0b010"
#define ILUPEU_TLP_CMD_DATA_EOP                     "0b011"
#define ILUPEU_TLP_CMD_RESERVED_A                   "0b100"
#define ILUPEU_TLP_CMD_RESERVED_B                   "0b101"
#define ILUPEU_TLP_CMD_SOP_DATA                     "0b110"
#define ILUPEU_TLP_CMD_SOP_DATA_EOP                 "0b111"



// TLP Status
#define ILUPEU_TLP_STATUS_NO_ERROR                  "0b0000"
#define ILUPEU_TLP_STATUS_RECEIVE_ERROR             "0b0001"
#define ILUPEU_TLP_STATUS_CRC_ERROR                 "0b0010"
#define ILUPEU_TLP_STATUS_EDB_INDICATION            "0b0011"
#define ILUPEU_TLP_STATUS_MISSING_EOP_ERROR         "0b0100"
#define ILUPEU_TLP_STATUS_PACKET_LENGTH_ERROR       "0b0101"
#define ILUPEU_TLP_STATUS_DATA_PARITY_ERROR         "0b0110"



// FC Type
#define ILUPEU_FC_TYPE_IDLE                         "0b000"
#define ILUPEU_FC_TYPE_INIT_COMPLETION              "0b001"
#define ILUPEU_FC_TYPE_INIT_NON_POSTED              "0b010"
#define ILUPEU_FC_TYPE_INIT_POSTED                  "0b011"
#define ILUPEU_FC_TYPE_RESERVED                     "0b100"
#define ILUPEU_FC_TYPE_UPDATE_COMPLETION            "0b101"
#define ILUPEU_FC_TYPE_UPDATE_NON_POSTED            "0b110"
#define ILUPEU_FC_TYPE_UPDATE_POSTED                "0b111"
#define ILUPEU_FC_HEADER_CREDIT_WIDTH               8 
#define ILUPEU_FC_DATA_CREDIT_WIDTH                 12 


//Defines for 4DW 128 bit header 
#define ILUPEU_TLP_HDR_WIDTH   		128
#define ILUPEU_TLP_HDR_DW0_BITS		(127,96)
#define ILUPEU_TLP_HDR_DW1_BITS		 (95,64)
#define ILUPEU_TLP_HDR_DW2_BITS		 (63,32)
#define ILUPEU_TLP_HDR_DW3_BITS		 (31,0)
#define ILUPEU_TLP_HDR_BITS        		(127,0)
#define ILUPEU_TLP_HDR_FMT_BITS        	(126,125)
#define ILUPEU_TLP_HDR_FMT_DATA_BITS   	(126,126)
#define ILUPEU_TLP_HDR_FMT_4DW_BITS    	(125,125)
#define ILUPEU_TLP_HDR_TYPE_BITS            (124,120)
#define ILUPEU_TLP_HDR_FMT_TYPE_BITS        (126,120)
#define ILUPEU_TLP_HDR_TC_BITS         	(118,116)
#define ILUPEU_TLP_HDR_TD_BITS         	(111,111)
#define ILUPEU_TLP_HDR_EP_BITS         	(110,110)
#define ILUPEU_TLP_HDR_ATTR_BITS       	(109,108)
#define ILUPEU_TLP_HDR_RO_BITS       	(109,109)
#define ILUPEU_TLP_HDR_SNOOP_BITS       	(108,108)
#define ILUPEU_TLP_HDR_LEN_BITS        	(105,96)
#define ILUPEU_TLP_HDR_REQ_ID_BITS     	 (95,80)
#define ILUPEU_TLP_HDR_REQ_BUS_NUM_BITS    	 (95,88)
#define ILUPEU_TLP_HDR_REQ_DEV_NUM_BITS    	 (87,83)
#define ILUPEU_TLP_HDR_REQ_FUNC_NUM_BITS  	 (82,80)
#define ILUPEU_TLP_HDR_TAG_BITS    		 (79,72)
#define ILUPEU_TLP_HDR_LAST_DWBE_BITS  	 (71,68)
#define ILUPEU_TLP_HDR_FIRST_DWBE_BITS 	 (67,64)
#define ILUPEU_TLP_HDR_MSG_CODE_BITS   	 (71,64)
#define ILUPEU_TLP_HDR_ADDR64_UPPER_BITS     (63,32)
#define ILUPEU_TLP_HDR_ADDR64_LOWER_BITS     (31,2)
#define ILUPEU_TLP_HDR_ADDR32_BITS     	 (63,34)
#define ILUPEU_TLP_HDR_CPL_ID_BITS     	 (95,80)
#define ILUPEU_TLP_HDR_CPL_CPL_BUS_NUM_BITS  (95,88)
#define ILUPEU_TLP_HDR_CPL_CPL_DEV_NUM_BITS  (87,83)
#define ILUPEU_TLP_HDR_CPL_CPL_FUNC_NUM_BITS (82,80)
#define ILUPEU_TLP_HDR_CPL_STATUS_BITS 	 (79,77)
#define ILUPEU_TLP_HDR_CPL_BCM_BITS        	 (76,76)
#define ILUPEU_TLP_HDR_CPL_BYTECOUNT_BITS  	 (75,64)
#define ILUPEU_TLP_HDR_CPL_REQ_ID_BITS 	 (63,48)
#define ILUPEU_TLP_HDR_CPL_REQ_BUS_NUM_BITS  (63,56)
#define ILUPEU_TLP_HDR_CPL_REQ_DEV_NUM_BITS  (55,51)
#define ILUPEU_TLP_HDR_CPL_REQ_FUNC_NUM_BITS (50,48)
#define ILUPEU_TLP_HDR_CPL_TAG_BITS    	(47,40)
#define ILUPEU_TLP_HDR_CPL_LOWADDR_BITS    	(38,32)
#define ILUPEU_TLP_HDR_CFG_BUS_NUM_BITS 	(63,56)
#define ILUPEU_TLP_HDR_CFG_DEV_NUM_BITS 	(55,51)
#define ILUPEU_TLP_HDR_CFG_FUNC_NUM_BITS 	(50,48)
#define ILUPEU_TLP_HDR_CFG_EXT_REG_NUM_BITS	(43,40)
#define ILUPEU_TLP_HDR_CFG_REG_NUM_BITS	(39,34)
#define ILUPEU_TLP_HDR_MSG_DW3_BITS   	(63,32)
#define ILUPEU_TLP_HDR_MSG_DW4_BITS   	(31,0)
#define ILUPEU_TLP_HDR_MSG_VNDR_CPL_BUS_NUM_BITS  (63,56)
#define ILUPEU_TLP_HDR_MSG_VNDR_CPL_DEV_NUM_BITS  (55,51)
#define ILUPEU_TLP_HDR_MSG_VNDR_CPL_FUNC_NUM_BITS (50,48)
#define ILUPEU_TLP_HDR_MSG_VNDR_VNDR_ID           (47,32)





#define ILUPEU_DW_WIDTH			32
#define ILUPEU_DW_BITS			(31,0)
#define ILUPEU_DW_BYTE_0_BITS		(31,24)
#define ILUPEU_DW_BYTE_1_BITS		(23,16)
#define ILUPEU_DW_BYTE_2_BITS		(15,8)
#define ILUPEU_DW_BYTE_3_BITS		(7,0)

 
#define ILUPEU_TLP_HDR_FMT_DATA_3DW       "0b10"
#define ILUPEU_TLP_HDR_FMT_DATA_4DW       "0b11"
#define ILUPEU_TLP_HDR_FMT_NO_DATA_3DW    "0b00"
#define ILUPEU_TLP_HDR_FMT_NO_DATA_4DW    "0b01"
 


#define ILUPEU_TLP_TYPE_MEM           "0b00000"
#define ILUPEU_TLP_TYPE_MEM_LK        "0b00001"
#define ILUPEU_TLP_TYPE_CPL           "0b01010"
#define ILUPEU_TLP_TYPE_CPL_LK        "0b01011"
#define ILUPEU_TLP_TYPE_CFG0          "0b00100"
#define ILUPEU_TLP_TYPE_CFG1          "0b00101"
#define ILUPEU_TLP_TYPE_IO            "0b00010"
#define ILUPEU_TLP_TYPE_MSG           "0b10000"
#define ILUPEU_TLP_TYPE_MSG_RC_MASK   "0b00111"
#define ILUPEU_TLP_TYPE_VALID_00     sc_uint<64>(0x00000c37)
#define ILUPEU_TLP_TYPE_VALID_01     sc_uint<64>(0x00ff0003)
#define ILUPEU_TLP_TYPE_VALID_10     sc_uint<64>(0x00000c35)
#define ILUPEU_TLP_TYPE_VALID_11     sc_uint<64>(0x00ff0001)


#define ILUPEU_TLP_CPL_STATUS_SC          "0b000"
#define ILUPEU_TLP_CPL_STATUS_UR          "0b001"
#define ILUPEU_TLP_CPL_STATUS_CRS         "0b010"
#define ILUPEU_TLP_CPL_STATUS_CA          "0b100"
#define ILUPEU_TLP_CPL_STATUS_TIMEOUT     "0b111"
#define ILUPEU_TLP_CPL_STATUS_RSVD1       "0b011"
#define ILUPEU_TLP_CPL_STATUS_RSVD2       "0b101"
#define ILUPEU_TLP_CPL_STATUS_RSVD3       "0b110"
#define ILUPEU_TLP_CPL_STATUS_RSVD4       "0b111"

//L2T defines
#define ILUPEU_L2T_ITP_CMD_WIDTH           3
#define ILUPEU_L2T_ITP_CMD_BITS            (2,0)
#define ILUPEU_L2T_ITP_CMD_EOP_VLD_BITS    (0,0)
#define ILUPEU_L2T_ITP_CMD_DATA_VLD_BITS   (1,1)
#define ILUPEU_L2T_ITP_CMD_SOP_VLD_BITS    (2,2)
#define ILUPEU_L2T_ITP_POS_WIDTH           4
#define ILUPEU_L2T_ITP_POS_SOP_WIDTH       2
#define ILUPEU_L2T_ITP_POS_EOP_WIDTH       2
#define ILUPEU_L2T_ITP_POS_BITS            (3,0)
#define ILUPEU_L2T_ITP_POS_SOP_BITS        (3,2)
#define ILUPEU_L2T_ITP_POS_EOP_BITS        (1,0)
#define ILUPEU_L2T_ITP_POS_SOP_POS0        "0b00"
#define ILUPEU_L2T_ITP_POS_SOP_POS1        "0b01"
#define ILUPEU_L2T_ITP_POS_SOP_POS2        "0b10"
#define ILUPEU_L2T_ITP_POS_SOP_POS3        "0b11"
#define ILUPEU_L2T_ITP_POS_EOP_POS0        "0b00"
#define ILUPEU_L2T_ITP_POS_EOP_POS1        "0b01"
#define ILUPEU_L2T_ITP_POS_EOP_POS2        "0b10"
#define ILUPEU_L2T_ITP_POS_EOP_POS3        "0b11"

//T2L defines
#define ILUPEU_T2L_LNK_CAP_WIDTH               32
#define ILUPEU_T2L_LNK_CAP_MAX_LNK_SPD_WIDTH   4 
#define ILUPEU_T2L_LNK_CAP_MAX_LNK_SPD_BITS    (3,0) 
#define ILUPEU_T2L_LNK_CAP_MAX_LNK_WDTH_WIDTH  6 
#define ILUPEU_T2L_LNK_CAP_MAX_LNK_WDTH_BITS   (9,4) 

#define ILUPEU_T2L_LNK_CAP_ASPM_WIDTH          2 
#define ILUPEU_T2L_LNK_CAP_ASPM_BITS           (11,10) 
#define ILUPEU_T2L_LNK_CAP_LOS_EXIT_LAT_WIDTH  3 
#define ILUPEU_T2L_LNK_CAP_LOS_EXIT_LAT_BITS   (14,12) 
#define ILUPEU_T2L_LNK_CAP_L1_EXIT_LAT_WIDTH   3 
#define ILUPEU_T2L_LNK_CAP_L1_EXIT_LAT_BITS    (17,15) 
#define ILUPEU_T2L_LNK_CAP_PORT_NMBR_WIDTH     8 
#define ILUPEU_T2L_LNK_CAP_PORT_NMBR_BITS      (31,24) 

#define ILUPEU_T2L_LNK_CTRL_WIDTH              16
#define ILUPEU_T2L_LNK_CTRL_ASPM_WIDTH         2 
#define ILUPEU_T2L_LNK_CTRL_ASPM_BITS          (1,0) 
#define ILUPEU_T2L_LNK_CTRL_RCB_WIDTH          1 
#define ILUPEU_T2L_LNK_CTRL_RCB_BITS           (3,3) 
#define ILUPEU_T2L_LNK_CTRL_LNK_DISABL_WIDTH   1 
#define ILUPEU_T2L_LNK_CTRL_LNK_DISABL_BITS    (4,4) 
#define ILUPEU_T2L_LNK_CTRL_RETRAIN_LNK_WIDTH  1 
#define ILUPEU_T2L_LNK_CTRL_RETRAIN_LNK_BITS   (5,5) 
#define ILUPEU_T2L_LNK_CTRL_CMN_CLK_CFG_WIDTH  1 
#define ILUPEU_T2L_LNK_CTRL_CMN_CLK_CFG_BITS   (6,6) 
#define ILUPEU_T2L_LNK_CTRL_EXTND_SYNC_WIDTH   1 
#define ILUPEU_T2L_LNK_CTRL_EXTND_SYNC_BITS    (7,7) 

#define ILUPEU_T2L_LNK_CFG_WIDTH               8
#define ILUPEU_T2L_LNK_CFG_PORT_CFG_WIDTH      1 
#define ILUPEU_T2L_LNK_CFG_PORT_CFG_BITS       (0,0) 
#define ILUPEU_T2L_LNK_CFG_SLOT_CLK_CFG_WIDTH  1 
#define ILUPEU_T2L_LNK_CFG_SLOT_CLK_CFG_BITS   (1,1) 


// PM DLLP Type
#define ILUPEU_PM_DLLP_TYPE_WIDTH                3
#define ILUPEU_PM_DLLP_TYPE_IDLE                 "0b000"
#define ILUPEU_PM_DLLP_TYPE_ENTER_L1             "0b001"
#define ILUPEU_PM_DLLP_TYPE_ENTER_L23            "0b010"
#define ILUPEU_PM_DLLP_TYPE_ACTIVE_STATE_REQ_L1  "0b011"
#define ILUPEU_PM_DLLP_TYPE_REQ_ACK              "0b100"


#endif


