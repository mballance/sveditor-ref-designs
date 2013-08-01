/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: global.h
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
`ifndef PR_ALWAYS 
  `define PR_ALWAYS $dispmon 
`endif



`ifdef FBD_MACRO
`else
`define DBG_0 21
`define DBG_1 22
`define DBG_2 23
`define DBG_3 24
`define DBG_4 25

// Stingray uses parts of fbdimm model, so FBDIMM_FAST flag cannot be verified at this point
`ifdef STINGRAY
`else

  `ifdef AXIS_FBDIMM_NO_FSR
    `define FBDIMM_FAST_IDLE 1
    `define FBDIMM_FAST_NB   1
    `define AXIS_FBDIMM_1AMB 1
  `endif

 `define FBDIMM_FAST 1
 `define FBDIMM_FAST_CURR 1
 `define FBDIMM_FAST_INIT 1
 `define FBDIMM_ENABLE_SELF_REF_FSM 1
`endif

`define NO_CLK_INT_2X 1

`define AMB_INIT_DISABLE  4'b0000
`define AMB_INIT_TRAIN    4'b0001
`define AMB_INIT_TEST     4'b0010
`define AMB_INIT_POLL     4'b0011
`define AMB_INIT_CONFIG   4'b0100
`define AMB_INIT_LO       4'b0101
`define AMB_INIT_LOS      4'b0110
`define AMB_INIT_CALIB    4'b0111
`define AMB_INIT_RECALIB 4'b1000

`define TS0_FRAMES   50 //3180 // 265 ts0 * 12 cyc/frame
`define tCalibrate   5760 // 480K frames = 480 * 12 cycles per frame
`define tClkTrain    10 //504  // 42 frames  = 42 * 12 cycles per frame
`define tBitLock     1428 // 119 frames = 119 * 12 cycles per frame
`define tFrameLock   1848 // 154 frames = 154 * 12 cycles per frame
`define tEIPropagate 48   // 4 frames = 4 * 12 cycles per frame
`define tDisable     10 //612  // 51 frames = 51 * 12 cycles per frame
`define tEDisable    10 //240  // 20 frames = 20 * 12 cycles per frame

`define IDLE       0
`define TS_TRAIN_1 1
`define TS_TRAIN_2 2
`define TS_TEST_1  3
`define TS_TEST_2  4
`define TS_TEST_3  5
`define TS_TEST_4  6

`define  CMD_ACT 0
`define  CMD_WR 1
`define  CMD_RD 2
`define  CMD_PALL 3
`define  CMD_PSNG 4
`define  CMD_ARF 5
`define  CMD_EnSR 6
`define  CMD_ExSR 7
`define  CMD_EnPD 8
`define  CMD_DBE 9
`define  CMD_DRT 10
`define  CMD_DEI 11
`define  CMD_DPD 12
`define  CMD_DPR 13
`define  CMD_WCFG 14
`define  CMD_RCFG 15
`define  CMD_SCR 16
`define  CMD_SYNC 17
`define  CMD_NOP 18
`define  CMD_UND 19
`define  CMD_DRAM_CKE_DIMM 20
`define  CMD_DRAM_CKE_RANK 21

`define  NB_ST_1 4'h1
`define  NB_ST_2 4'h2
`define  NB_ST_3 4'h3
`define  NB_ST_4 4'h4
`define  NB_ST_5 4'h5
`define  NB_ST_6 4'h6
`define  NB_ST_7 4'h7
`define  NB_ST_8 4'h8
`define  NB_ST_9 4'h9
`define  NB_ST_10 4'ha
`define  NB_ST_11 4'hb
`define  NB_ST_12 4'hc
`define  NB_ST_13 4'hd
`define  TRANSFER_0 5'h0
`define  TRANSFER_1 5'h1
`define  TRANSFER_2 5'h2
`define  TRANSFER_3 5'h3
`define  TRANSFER_4 5'h4
`define  TRANSFER_5 5'h5
`define  TRANSFER_6 5'h6
`define  TRANSFER_7 5'h7
`define  TRANSFER_8 5'h8
`define  TRANSFER_9 5'h9
`define  TRANSFER_10 5'ha
`define  TRANSFER_11 5'hb

`define FBD_MACRO 1
`endif
